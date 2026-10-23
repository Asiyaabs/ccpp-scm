#!/usr/bin/env python3
import re, sys, glob
import xml.etree.ElementTree as ET

SUITE = sys.argv[1] if len(sys.argv) > 1 else "ccpp/suites/suite_SCM_GFS_v17_p8_ugwpv1.xml"
PHYS = "ccpp/physics/physics"
PAT = re.compile(r"specific_humidity|water_vapor|cloud_liquid|cloud_ice|cloud_condensed|"
                 r"ice_water|liquid_water|rain|snow|graupel|hail|mixing_ratio|tracer|"
                 r"condensate|precip|hydrometeor|tagged", re.I)

def parse_meta(path):
    tables, table, var, mode = {}, None, None, None
    for raw in open(path, errors="ignore"):
        s = raw.strip()
        if not s or s.startswith("#"):
            continue
        m = re.match(r"\[(.+)\]$", s)
        if m:
            tag = m.group(1)
            if tag == "ccpp-table-properties":
                mode = "props"
            elif tag == "ccpp-arg-table":
                mode, table = "head", None
            else:
                mode, var = "var", {"local": tag}
                if table is not None:
                    tables[table].append(var)
            continue
        if "=" in s:
            k, v = [x.strip() for x in s.split("=", 1)]
            if mode == "head" and k == "name":
                table = v
                tables[table] = []
            elif mode == "var":
                var[k] = v
    return tables

index = {}
for f in glob.glob(PHYS + "/**/*.meta", recursive=True):
    for t, args in parse_meta(f).items():
        if t.endswith("_run"):
            index[t[:-4]] = (f, args)

root = ET.parse(SUITE).getroot()
for grp in root.iter("group"):
    for el in grp.iter("scheme"):
        name = el.text.strip()
        if name not in index:
            print(f"[{grp.get('name')}] {name}: !! no _run table found in any .meta")
            continue
        f, args = index[name]
        hits = [a for a in args if a.get("intent") in ("inout", "out")
                and PAT.search(a.get("standard_name", "") + " " + a["local"])]
        if not hits:
            print(f"[{grp.get('name')}] {name}: (no moisture/tracer outputs)")
            continue
        print(f"[{grp.get('name')}] {name}   <{f}>")
        for a in hits:
            print(f"      {a['local']:22s} {a['intent']:6s} {a.get('standard_name','')}")
