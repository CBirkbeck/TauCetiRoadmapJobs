# GATE-HyperellipticCurves~4: answers to human review

One comment (CBirkbeck, 2026-11-09T13:46:55Z), a status note on the main merge, contains three
checkable claims. They are numbered H01–H03. Repairs are in commit `b238f61` on top of `d33798c`.

## H01 (CBirkbeck) — applied differently

The path claim is correct: at the Tau Ceti pin `2fd255d`, `TauCeti/FieldTheory/FunctionField/Hyperelliptic/Genus.lean` no longer exists, and the folder `Genus/` holds `Basic.lean` and `Two.lean`. But `Genus/Basic.lean` declares only eleven theorems (no definitions or instances), and `Suggested.lean` uses none of them: `TauCeti.genus` comes from `RiemannRoch/Genus.lean` and `TauCeti.IsHyperellipticFunctionField` from `Hyperelliptic/Basic.lean`, which `Suggested.lean` already imports. Because only modules that are actually used may be imported, the import was deleted rather than repointed (`TauCetiRoadmap/HyperellipticCurves/Suggested.lean` line 5: `public import TauCeti.FieldTheory.FunctionField.Hyperelliptic.Genus.Basic` → removed).

Evidence that nothing depended on it:
- The file builds without the import.
- `#check @name` on all 35 declarations gives the same elaborated types as at `d33798c` (35 of 35 match after normalising whitespace).

The same stale path was also in the README. In the supplier contract, `TauCetiRoadmap/HyperellipticCurves/README.md` line 407 changed from (`…/Hyperelliptic/Genus.lean`) to (`…/Hyperelliptic/Genus/Basic.lean`). The six names cited there are at `Genus/Basic.lean`:
- `finrank_ratFunc_eq_two_of_sq_eq`, line 134
- `Place.one_lt_ramificationIdx_iff_of_sq_eq`, line 281
- `degree_different_ratFunc_of_sq_eq`, line 307
- `isIntegrallyClosedIn_of_sq_eq`, line 325
- `genus_eq_of_sq_eq`, line 339
- `isHyperellipticFunctionField_of_sq_eq`, line 353

## H02 (CBirkbeck) — answered

Confirmed. `lake build TauCetiRoadmap.HyperellipticCurves.Suggested` at `d33798c` finished with "Build completed successfully (18640 jobs)". It printed 16 `declaration uses sorry` warnings, one for each sorry'd theorem, and no other diagnostics. After the repair the build has the same outcome (18502 jobs, the same 16 warnings).

## H03 (CBirkbeck) — answered

"No other change" correctly describes the commit: `git diff e63cf0a d33798c -- TauCetiRoadmap/HyperellipticCurves` is the single import line.

The merge itself needed one more repair. Main moved LocalFieldsRamification from `TauCetiRoadmap/` to `Completed/`: it is present at the old merge base `c994070` and only under `Completed/` on main. That left four README links pointing at a missing file. At lines 462, 1524, 1622 and 1848, `(../LocalFieldsRamification/README.md)` changed to `(../../Completed/LocalFieldsRamification/README.md)`, which is the form other roadmaps on main use.

The layers those links cite still carry the cited content:
- Layer 0, "local fields and their finite extensions", at line 72 of the completed README.
- Layer 3, "ramification, the tame and wild cases, and the filtration", at line 724.
- `TauCeti.LocalFieldsRamification.lowerRamificationGroup` is at `TauCeti/NumberTheory/LocalField/RamificationGroup.lean` line 99.

The merge also moved the pins: Tau Ceti `358314d` → `2fd255d` and Mathlib `f6090c7` → `1b1ccf4`. Apart from the H01 path, nothing the README cites broke:
- Every one of the README's 266 backticked identifiers that occurs at the old pins also occurs at the new pins.
- Every `TauCeti/…` and `Mathlib/…` file path resolves, except two:
  - line 44 names the proposed home for new files, which is not meant to exist yet;
  - line 1144 is an elided `Mathlib/NumberTheory/...` path. It predates the merge and was left unchanged.
- The line locators at lines 693–694 still hold: `twoTorsionPolynomial_discr` is at `Weierstrass.lean:311` and `variableChange_Δ` at `VariableChange.lean:218`.
- The section headings of the cited main roadmaps that the merge changed are the same:
  - StableReduction Layers 0–11 (lines 343–778); only its preamble headings were renamed.
  - AlgebraicCurves Layer 10 (line 1193) and Layer 11 (line 1396).

## Adversarial pass on what changed

No mathematical statement, definition or convention was added or changed. The rows below cover the items that were changed.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `Suggested.lean` import of `…Hyperelliptic.Genus.Basic` | build with and without; `#check @` on all 35 declarations | 18640 vs 18502 jobs, both succeed; 16 vs 16 sorry warnings; 35/35 identical types; `Genus/Basic.lean` has 11 theorems, 0 defs, 0 instances; 0 uses in `Suggested.lean` | unused import | removed |
| README l. 407 path of the `y² = f` genus results | old and new path at Tau Ceti `2fd255d` | old path absent; 6/6 cited names in `Genus/Basic.lean` (lines 134, 281, 307, 325, 339, 353) | stale path | repointed |
| README l. 401 `isHyperellipticFunctionField_of_genus_eq_two`, `…_iff_two_le_genus_and_exists_degree_eq_two_and_two_le_dim` | location at the new pin | `Hyperelliptic/Basic.lean` lines 211 and 170 | holds | none |
| LocalFieldsRamification links (l. 462, 1524, 1622, 1848) | path at merge base `c994070` and at main | present under `TauCetiRoadmap/` before, only under `Completed/` now; Layer 0 at l. 72, Layer 3 at l. 724 | broken by merge | repointed |
| README identifiers across the pin move | 266 backticked tokens against identifier sets at both pins | 0 present at old and absent at new (Tau Ceti 194807 → 357188 identifiers; Mathlib 234058 → 236322) | holds | none |

`#check` comparison: all 35 declarations were elaborated by appending `#check @name` temporarily and running the allowed build; the lines were then removed. Compared with the recorded elaborated types, nothing changed: no binder was lost or added.

Leads in the worker's citation scan, 18 names "found nowhere":
- `Model.weierstrassForm` is this roadmap's own declaration (`Suggested.lean` line 134).
- The other 17 are either declarations of external repositories at pinned commits, cited as prior work (weil-conjectures, AxiomMath/Weil), or LMFDB knowl ids (`g2c.*`). None is claimed as a pinned declaration.

Ownership: the repairs add no construction, so ownership is unchanged. Sources: nothing new was cited or fetched, and no `needs-references.toml` was written.

## Build, gate and depcheck

- Build: `lake build TauCetiRoadmap.HyperellipticCurves.Suggested` at `b238f61` printed "Build completed successfully (18502 jobs)", with 16 `declaration uses sorry` warnings and no errors.
- Gate: `gate HyperellipticCurves: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- Depcheck: `depcheck: 235 roadmaps, 2257 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line, and HyperellipticCurves is at line 392 of the merge order.
- Commit: `b238f61 HyperellipticCurves: review repairs (drop unused genus import, repoint genus path and LocalFieldsRamification links)`. Not pushed.
