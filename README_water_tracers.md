# Water Tracers in CCPP-SCM

Water tracers are extra copies of the model's water that follow it through the physics.
They answer questions the model water alone cannot:

- **Where does this water come from?** *Water tagging* marks water by its source (for
  example, evaporation from the local surface) and follows it into vapour, cloud and
  precipitation.
- **What isotopic signal does it carry?** *Water isotopes* (HDO, H₂¹⁸O) follow the same
  paths as the water, with fractionation at phase changes. This lets the model be compared
  with isotope observations. (Planned.)

This branch adds water tracers to CCPP-SCM v8.0.0 with the `SCM_GFS_v17_p8_ugwpv1` suite,
following the iCESM / iCAM approach.

| | |
|---|---|
| **SCM** | [Asiyaabs/ccpp-scm](https://github.com/Asiyaabs/ccpp-scm), branch `feature/water-tracers` |
| **Physics** | [Asiyaabs/ccpp-physics](https://github.com/Asiyaabs/ccpp-physics), branch `feature/water-tracers` |
| **Change log and tests** | [`README_water_tracers_changes.md`](README_water_tracers_changes.md) |

> **Status:** framework complete (namelist, tracer registration, index tables, helper routine,
> initial values, forcing, output). The physics schemes don't move the tracers yet, apart
> from passive transport by convection. See [Roadmap](#roadmap).

---

## Contents

- [Key ideas](#key-ideas)
- [Quick start](#quick-start)
- [Namelist options](#namelist-options)
- [Output](#output)
- [Tracer sets and names](#tracer-sets-and-names)
- [For developers: using the tracers in a scheme](#for-developers-using-the-tracers-in-a-scheme)
- [Roadmap](#roadmap)
- [References](#references)

---

## Key ideas

**No effect on the model answer.** Tracers are passive: the physics moves them but never
reads them back. With tracers switched on or off, the model fields are identical.

**A bulk check set.** Next to the tags, the code carries `H2O`, a full copy of the model
water. If every water transfer is coded correctly, `H2O` stays equal to the model water at
all times. Any difference points to the exact process that is wrong. For isotopes the same
set is required: it is the reference that the isotope ratios are measured against.

**One rule for every transfer.** When a process moves an amount `dq` of water from one
store to another (for example, condensation from vapour to cloud), each tracer moves the
same fraction of its own store:

```
dtracer = dq × (tracer in source / water in source) × α
```

`α` = 1 for water and tags. For isotopes, `α` is the fractionation factor of that process.
Every process that fractionates in nature gets its own `α` hook.

**Switched on at run time.** All of it is set by a namelist group. No rebuild is needed, and
the tracer configuration file stays unchanged.

---

## Quick start

1. Build and run the SCM as usual (see the main [README](README.md)).
2. In `ccpp/physics_namelists/input_GFS_v17_p8_ugwpv1.nml`, set `tagging = .true.` in the
   `&water_tracer_nml` group:
   ```fortran
   &water_tracer_nml
     tagging = .true.
   /
   ```
3. Run a case. With `-v`, the run log shows the water tracers:
   ```bash
   cd scm/bin
   python run_scm.py -c twpice -s SCM_GFS_v17_p8_ugwpv1 -v
   ```
   ```
   water tracers: tagging on, 12 tracers added:
   qv_H2O      ql_H2O      qi_H2O      qr_H2O      qs_H2O      qg_H2O
   qv_H2O_COL  ql_H2O_COL  qi_H2O_COL  qr_H2O_COL  qs_H2O_COL  qg_H2O_COL
   ```

---

## Namelist options

The group `&water_tracer_nml` sits in the physics namelist. It is optional: without it,
tracers are off.

| Option | Default | Meaning |
|---|---|---|
| `tagging` | `.false.` | Master switch |
| `wtr_species` | `'H2O'` | Species to carry. Only `H2O` for now; `HDO` and `H218O` are planned |
| `wtr_tag_names` | `'COL'` | Names of the tags (up to 10) |
| `wtr_tag_source` | `'surface'` | Where each tag's water enters: `surface` = surface evaporation in the column |
| `wtr_bulk_check` | `.true.` | Carry the `H2O` bulk check set |
| `wtr_init_tags` | `'zero'` | Initial tags: `zero`, `bulk` (tag = all water), or `fraction` |
| `wtr_init_frac` | `0.5` | Initial tag fraction when `wtr_init_tags = 'fraction'` |
| `wtr_tag_moisten` | `.false.` | Test mode: tags get the full large-scale forcing, like the bulk set. With `wtr_init_tags = 'bulk'`, every tag must then equal the bulk set |

An invalid option stops the run with a message that starts with `water_tracers_config:`.

---

## Output

With tagging on, `output.nc` gets the water tracers (`qv_H2O`, …, `qg_H2O_COL`), the model
precipitation and surface flux with CAM names (`PRECC`, `PRECSC`, `PRECL`, `PRECSL`, `PRECT`,
`QFLX`), and per set the iCESM-style fields `PRECRC_<set>r`, `PRECSC_<set>s`, `PRECRL_<set>R`,
`PRECSL_<set>S` and `QFLX_<set>`. Lowercase `r`/`s` means convective, uppercase `R`/`S` means
large-scale. With tagging off, `output.nc` is unchanged.

## Tracer sets and names

A **set** is one complete copy of the water, in 6 phases:

| Phase | `qv` | `ql` | `qi` | `qr` | `qs` | `qg` |
|---|---|---|---|---|---|---|
| | vapour | cloud liquid | cloud ice | rain | snow | graupel |

The sets are the bulk set (if `wtr_bulk_check`) and then one set per tag, for each species.
Each tracer is named `<phase>_<species>[_<tag>]`:

| Set | Kind | Tracers |
|---|---|---|
| `H2O` | bulk check | `qv_H2O` … `qg_H2O` |
| `H2O_COL` | tag | `qv_H2O_COL` … `qg_H2O_COL` |
| `HDO` *(planned)* | isotope bulk | `qv_HDO` … `qg_HDO` |
| `HDO_COL` *(planned)* | isotope tag | `qv_HDO_COL` … `qg_HDO_COL` |

The tracers are appended in memory after the tracers from the tracer file, as generic tracers
(type 0); the tracer file itself is not changed. The convection schemes (samfdeepcnv,
samfshalcnv) transport the vapour tracers, like other generic tracers; the tracer condensate is
not transported, like the model condensate. The PBL scheme
(satmedmfvdifq) mixes them too, and the surface evaporation enters their vapour (`qv_<set>`).

---

## For developers: using the tracers in a scheme

The host builds index tables at start-up. A scheme requests them through its `.meta` file by
standard name:

| Standard name | Fortran shape | Meaning |
|---|---|---|
| `flag_for_water_tracers` | scalar logical | tracers on/off |
| `number_of_water_tracer_sets` | scalar | `nset` (0 when off) |
| `number_of_water_tracer_phases` | scalar | 6 |
| `index_of_water_tracers_in_tracer_concentration_array` | `(nset, 6)` | tracer index of each set and phase |
| `index_of_model_water_per_water_tracer_phase_in_tracer_concentration_array` | `(6)` | index of the model water of each phase (0 if absent) |
| `species_of_water_tracer_sets` | `(nset)` | 1 H2O, 2 HDO, 3 H218O |
| `kind_of_water_tracer_sets` | `(nset)` | 1 bulk, 2 tag |
| `bulk_set_of_water_tracer_sets` | `(nset)` | bulk set of each set (0 = model water) |

For example, rain of set `s` is `q(:, :, wtr_idx(s, 4))`, and the matching model rain is
`q(:, :, wtr_model_idx(4))`.

Every water transfer in a scheme is one call of the helper routine, for each set `s`:

```fortran
use water_tracers_utils, only: wtr_transfer, wtr_alpha, wtr_proc_cond_liq

! condensation of dq from vapour to cloud water (qv = model vapour before the transfer)
call wtr_transfer(qv, q(i,k,wtr_idx(s,1)), dq, q(i,k,wtr_idx(s,2)), &
                  wtr_alpha(wtr_species(s), wtr_proc_cond_liq, t(i,k)))
```

Leave out the destination for water that leaves the atmosphere (precipitation at the
surface), and leave out `alpha` when the process does not fractionate. Tracer precipitation
and surface fluxes go into the per-step arrays `wtr_raincd`, `wtr_raincs`, `wtr_rainmp`,
`wtr_snowmp` and `wtr_qflx` (standard names in
[`README_water_tracers_changes.md`](README_water_tracers_changes.md)).

The code is in
[`physics/tools/water_tracers_config.F90`](https://github.com/Asiyaabs/ccpp-physics/blob/feature/water-tracers/physics/tools/water_tracers_config.F90)
and
[`physics/tools/water_tracers_utils.F90`](https://github.com/Asiyaabs/ccpp-physics/blob/feature/water-tracers/physics/tools/water_tracers_utils.F90).

---

## Roadmap

| Step | Content | Status |
|---|---|---|
| Framework | Namelist, tracer registration, index tables | ✅ |
| Framework | Helper module: `wtr_transfer`, `wtr_alpha` | ✅ |
| Framework | Initial values, forcing, clipping, output | ✅ |
| Schemes | PBL: mixing and surface evaporation | ✅ |
| Schemes | PBL: condensation in updrafts/downdrafts, negative-water fixes | ✅ |
| Schemes | shallow convection | ✅ |
| Schemes | deep convection | ✅ |
| Schemes | Thompson microphysics | ✅ |
| Schemes | water photochemistry → surface (ocean, sea ice, Noah-MP), one at a time | ⏳ |
| Isotopes | HDO and H₂¹⁸O with fractionation | ⏳ |

Each scheme is accepted only when the `H2O` bulk set still equals the model water.

---

## References

- Brady, E., et al. (2019). The connected isotopic water cycle in the Community Earth System
  Model version 1. *JAMES*, 11, 2547–2566.
- Nusbaumer, J., et al. (2017). Evaluating hydrological processes in the Community
  Atmosphere Model Version 5 (CAM5) using stable isotope ratios of water. *JAMES*, 9, 949–977.
