# Water Tracers in CCPP-SCM: Change Log

This document records every code change made for water tracers (water tagging now, water
isotopes later) in CCPP-SCM v8.0.0 with the `SCM_GFS_v17_p8_ugwpv1` suite.

| | |
|---|---|
| **SCM repository** | [Asiyaabs/ccpp-scm](https://github.com/Asiyaabs/ccpp-scm), branch `feature/water-tracers` |
| **Physics repository** | [Asiyaabs/ccpp-physics](https://github.com/Asiyaabs/ccpp-physics), branch `feature/water-tracers` (submodule `ccpp/physics`) |
| **Base** | CCPP-SCM v8.0.0 (`70dd01b`), CCPP-Physics v8.0.0 (`2a66945`) |
| **Design / plan** | `README_water_tracers.md` |

---

## Contents

1. [What water tracers are](#1-what-water-tracers-are)
2. [Status](#2-status)
3. [How to switch tracers on](#3-how-to-switch-tracers-on)
4. [Namelist reference](#4-namelist-reference)
5. [Tracer sets, names and index tables](#5-tracer-sets-names-and-index-tables)
6. [Changed files](#6-changed-files)
7. [Tests](#7-tests)
8. [Next steps](#8-next-steps)

---

## 1. What water tracers are

A water tracer is an extra copy of the model's water (`qv, ql, qi, qr, qs, qg`). It is moved
by the same processes as the model water, so it can follow:

- **Bulk check set (`H2O`)**: a full copy of the model water. If the tracer code is right, it
  stays equal to the model water. This is the main correctness test.
- **Tag sets (`H2O_<TAG>`)**: water from one source only. For example, `COL` holds water that
  evaporated from the surface inside the column.
- **Isotope sets (`HDO`, `H218O`)**: planned for Phase 4. The fractionation hooks (`alpha`)
  will be in place from Phase 2.

The physics never reads the tracers back, so **the model answer does not change** when
tracers are switched on.

---

## 2. Status

| Phase / step | Content | Status |
|---|---|---|
| 0 | Base v8.0.0, input data, case namelists, baseline runs | ✅ done |
| 1 – step 4 | Namelist, tracer registration, index tables | ✅ done, tested |
| 1 – step 5 | Helper module (`wtr_transfer`, `wtr_alpha`) | ⏳ next |
| 1 – step 6 | Host rules: initial values, forcing, clipping, output | ⏳ |
| 2 | Schemes, one per commit (PBL → shallow conv → deep conv → Thompson → photochem / surface / sea ice → Noah-MP) | ⏳ |
| 3 | Documentation | ⏳ |
| 4 | Isotopes (HDO, H218O) | ⏳ |

---

## 3. How to switch tracers on

1. Open the physics namelist `ccpp/physics_namelists/input_GFS_v17_p8_ugwpv1.nml`.
2. In the `&water_tracer_nml` group at the end of the file, set:
   ```fortran
   tagging = .true.
   ```
3. Run the case as usual. No rebuild is needed:
   ```bash
   cd scm/bin
   qcmd -V -A <project> --ntasks 1 -l walltime=02:00:00 -- python run_scm.py -c flux_chaz_2022081500 -s SCM_GFS_v17_p8_ugwpv1 > run.log 2>&1
   ```

You don't need to edit the tracer file (`scm/etc/tracer_config/tracers_GFS_v17_p8_ugwpv1.txt`).
The host appends the water tracers to the tracer list in memory.

The `&water_tracer_nml` group is **optional**. Leaving it out of a namelist file has the same
effect as `tagging = .false.`.

---

## 4. Namelist reference

```fortran
&water_tracer_nml
  tagging        = .false.     ! master switch
  wtr_species    = 'H2O'       ! species list: H2O (HDO, H218O later)
  wtr_tag_names  = 'COL'       ! tag names, up to 10
  wtr_tag_source = 'surface'   ! where the water of each tag enters
  wtr_bulk_check = .true.      ! add the H2O bulk check set
  wtr_init_tags  = 'zero'      ! initial tags: 'zero' | 'bulk' | 'fraction'
  wtr_init_frac  = 0.5         ! initial tag fraction when wtr_init_tags = 'fraction'
/
```

| Variable | Type | Default | Allowed values |
|---|---|---|---|
| `tagging` | logical | `.false.` | |
| `wtr_species` | string list | `'H2O'` | `H2O` only for now (`HDO` and `H218O` give "not implemented yet") |
| `wtr_tag_names` | string list | `'COL'` | any names, no duplicates, up to 10 |
| `wtr_tag_source` | string list | `'surface'` | `surface` only for now |
| `wtr_bulk_check` | logical | `.true.` | for H2O only; isotopes always get a bulk set |
| `wtr_init_tags` | string | `'zero'` | `zero`, `bulk`, `fraction` |
| `wtr_init_frac` | real | `0.5` | 0 to 1 |

An invalid value stops the run with a message that starts with `water_tracers_config:`.

> `wtr_init_tags` and `wtr_init_frac` are read and checked now, but they only take effect
> from step 6.

---

## 5. Tracer sets, names and index tables

### Sets

For each species, the code creates the optional bulk set and then one set per tag:

| Set | Species | Kind | Bulk set |
|---|---|---|---|
| 1 `H2O` | 1 (H2O) | 1 (bulk) | 1 (itself) |
| 2 `H2O_COL` | 1 (H2O) | 2 (tag) | 1 |

When `wtr_bulk_check = .false.`, H2O tags have bulk set `0`, which means the model water itself.

### Tracer names

Each set has 6 phases, named `<phase>_<set>`:

```
qv_H2O      ql_H2O      qi_H2O      qr_H2O      qs_H2O      qg_H2O
qv_H2O_COL  ql_H2O_COL  qi_H2O_COL  qr_H2O_COL  qs_H2O_COL  qg_H2O_COL
```

With the default namelist this gives 2 sets × 6 phases = **12 tracers**, added after the
tracers from the tracer file. Their type is generic (0), so the PBL and convection schemes
mix and transport them like any other tracer.

### Index tables

The physics finds the tracers through these tables, which are stored in `GFS_control_type`:

| Field | Shape | Meaning |
|---|---|---|
| `wtr_idx(set, phase)` | (nset, 6) | position of the tracer in `qgrs` / `gq0` |
| `wtr_model_idx(phase)` | (6) | position of the model water (`ntqv, ntcw, ntiw, ntrw, ntsw, ntgl`), 0 if absent |
| `wtr_species(set)` | (nset) | 1 H2O, 2 HDO, 3 H218O |
| `wtr_kind(set)` | (nset) | 1 bulk, 2 tag |
| `wtr_bulk(set)` | (nset) | bulk set of this set (0 = model water) |

The phase order is always `qv, ql, qi, qr, qs, qg`. When tagging is off, `wtr_nset = 0` and
all of these arrays have size zero.

---

## 6. Changed files

### 6.1 Physics repository (`ccpp/physics`)

| File | Change |
|---|---|
| `physics/tools/water_tracers_config.F90` | **New.** Module `water_tracers_config`: reads `&water_tracer_nml` (`wtr_read_nml`), checks it, and builds sets, names and index tables (`wtr_nset`, `wtr_set_info`, `wtr_tracer_names`, `wtr_index_table`). This is a plain Fortran module, not a CCPP scheme. |

### 6.2 SCM repository

| File | Change |
|---|---|
| `scm/src/scm_input.F90` | New routine `add_water_tracers`, called right after `get_tracers` in `get_config_nml`. When tagging is on, it appends the water tracer names (type 0) and prints `water tracers: tagging on, N tracers added:`. |
| `scm/src/GFS_typedefs.F90` | 8 new fields in `GFS_control_type` (see §5). In `control_initialize`, after the tracer indices are set, it reads `&water_tracer_nml`, fills the index tables and prints the sets (master task only). |
| `scm/src/GFS_typedefs.meta` | Metadata for the 8 new fields. Adds `tools/water_tracers_config.F90` to `dependencies`. |
| `ccpp/physics_namelists/input_GFS_v17_p8_ugwpv1.nml` | `&water_tracer_nml` group appended, `tagging = .false.` |
| `ccpp/physics_namelists/input_GFS_v17_p8_ugwpv1_ps.nml` | same |
| `.gitmodules` | `ccpp-physics` URL points to `Asiyaabs/ccpp-physics` |
| `scm/etc/case_config/flux_chaz_2022081500.nml` | **New** case (August) |
| `scm/etc/case_config/flux_chaz_2023011500.nml` | **New** case (January) |
| `scm/etc/case_config/flux_chaz_2023031400.nml` | **New** case (March) |

### 6.3 New CCPP standard names

| Standard name | Field |
|---|---|
| `flag_for_water_tracers` | `tagging` |
| `number_of_water_tracer_sets` | `wtr_nset` |
| `number_of_water_tracer_phases` | `wtr_nphase` |
| `index_of_water_tracers_in_tracer_concentration_array` | `wtr_idx` |
| `index_of_model_water_per_water_tracer_phase_in_tracer_concentration_array` | `wtr_model_idx` |
| `species_of_water_tracer_sets` | `wtr_species` |
| `kind_of_water_tracer_sets` | `wtr_kind` |
| `bulk_set_of_water_tracer_sets` | `wtr_bulk` |

### 6.4 Not tracked in git

Input data (`scm/data/processed_case_input`, `physics_input_data`, `comparison_data`) and
`scm/run/` are listed in `.git/info/exclude`.

---

## 7. Tests

Build: Intel oneAPI 2025.3.1, spack-stack 2.1.1 (`module load derecho_intel/2.1.1`), Derecho.

### Step 4, test 1: tagging off gives the same answer (✅ passed, 2026-11-02)

All six cases were run with `tagging = .false.` using the step-4 executable and compared
with the v8.0.0 baseline (`/glade/work/asiyab/SWI_NCAR/baseline_v8/`) by `cmp`:

| Case | Run length (s) | Status | `output.nc` vs baseline |
|---|---|---|---|
| `flux_chaz_2022081500` | 172800 | 0 | byte-identical |
| `flux_chaz_2023011500` | 172800 | 0 | byte-identical |
| `flux_chaz_2023031400` | 172800 | 0 | byte-identical |
| `gabls3_noahmp` | 86400 | 0 | byte-identical |
| `MOSAiC-AMPS` | 604800 | 0 | byte-identical |
| `twpice` | 2138400 | 0 | byte-identical |

### Step 4, test 2: tagging on (✅ passed, 2026-11-02)

Result for `flux_chaz_2022081500`: status 0, `output.nc` byte-identical to the baseline, and the log shows

```
water tracers: tagging on, 12 tracers added:
qv_H2O      ql_H2O      qi_H2O      qr_H2O      qs_H2O      qg_H2O
qv_H2O_COL  ql_H2O_COL  qi_H2O_COL  qr_H2O_COL  qs_H2O_COL  qg_H2O_COL
...
water tracers: tagging on, 2 sets
set     H2O     species 1 kind 1 bulk set 1 tracer idx 13 14 15 16 17 18
set H2O_COL     species 1 kind 2 bulk set 1 tracer idx 19 20 21 22 23 24
```

The 12 tracers from the tracer file come first (24 tracers in total).

How to repeat the test:

Run `flux_chaz_2022081500` with `tagging = .true.`. Add `-v` to `run_scm.py`, because
without it the model's own printout (including the water-tracer lines) is not written to the log:

```bash
cd scm/bin
qcmd -V -A <project> --ntasks 1 -l walltime=02:00:00 -- python run_scm.py -c flux_chaz_2022081500 -s SCM_GFS_v17_p8_ugwpv1 -v > run_flux_chaz_2022081500_tagon.log 2>&1
grep -A3 "water tracers" run_flux_chaz_2022081500_tagon.log
```

Expected:

- The log lists 12 tracers (`qv_H2O … qg_H2O_COL`) and 2 sets with their tracer indices.
- The model fields in `output.nc` are the same as the baseline, because the tracers are not
  written to the output until step 6 and they don't feed back on the physics.

---

## 8. Next steps

1. **Step 5**: new module `water_tracers_utils` in `physics/tools/`:
   - `wtr_transfer(src_q, src_trc, dq, dst_trc, alpha)`: moves the tracer share of a
     water change `dq` from a source store to a destination store, as
     `dq * src_trc / src_q * alpha`.
   - `wtr_alpha`: fractionation factor hook. It returns 1 for H2O and tags; the isotope
     values come in Phase 4.
2. **Step 6**: host rules in the SCM:
   - initial values (bulk = model water; tags per `wtr_init_tags`, set again after
     `ccpp_physics_init` because Thompson converts to dry mixing ratio there)
   - forcing (bulk H2O gets the qv forcing; tags take drying at the column ratio but no
     moistening)
   - clipping (0 ≤ tag ≤ bulk) after the physics
   - writing the tracers to `output.nc`
3. **Phase 2**: edit the schemes one at a time, one commit each. After each scheme, the
   bulk set must still equal the model water.
