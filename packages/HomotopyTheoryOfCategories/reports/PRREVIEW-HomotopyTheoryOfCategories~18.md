# Review of HomotopyTheoryOfCategories (pull request #1521 at 8fbebd0)

**Verdict:** needs changes

Incremental re-review of the 16 lines added since `a61ddd4`, all in `TauCetiRoadmap/HomotopyTheoryOfCategories/README.md`: the new Provenance section and its References entry.

## R01 (P3) — The Provenance section links `FactorizationSystems` to no target

**Location:** `TauCetiRoadmap/HomotopyTheoryOfCategories/README.md` lines 1588 and 1596: "it maps existing Lean code to targets and prescribes nothing" … "`LeanPool/FactorizationSystems` treats orthogonal factorization systems."

**Claim:** The section says it maps code to targets. This clause names no target and does not say the project is unused, although 7.5 and 8.3 do use epi–mono factorizations. A reader cannot tell whether those targets should consult the project.

**Witness:** At LeanPool commit f8b9b72, `FactorizationSystems/Examples.lean` has one system, `EpiMonoSet` (epi, mono) on `Type u`. In the README, "orthogonal" occurs only at line 1596. 8.3 (line 1029) takes the factorizations from Mathlib's `SimplexCategory.reedyStructure`.

**Repair:** Change line 1596 to: "`LeanPool/FactorizationSystems` treats orthogonal factorization systems, with (epi, mono) on `Type u` as its one example; no target here uses one: the epi–mono factorizations of `Δ` in 7.5 and 8.3 are those of Mathlib's `SimplexCategory.reedyStructure`."

## R02 (P3) — The reuse rule names LeanPool's maintainers instead of the code's authors

**Location:** `TauCetiRoadmap/HomotopyTheoryOfCategories/README.md` lines 1592–1593: "adaptation is agreed with its maintainers first, and adapted code keeps its license notices."

**Claim:** The repository's rule for porting existing work requires the agreement of the code's authors. LeanPool is a pool of imported projects, and its maintainers are not the authors of the two projects named.

**Witness:** `README.md` line 330 asks contributors to work with the authors of the existing material and get their agreement. LeanPool's NOTICE gives the upstream repositories jzxia/WhiteheadTheorem and ivankobe/FactorizationSystems. Its file headers name Jiazhen Xia and Ivan Kobe as authors.

**Repair:** Change the clause to: "adaptation is agreed first with the authors of the code (named in each file's header and in LeanPool's NOTICE), and adapted code keeps its license notices."

## Previous findings

- none: the review of `a61ddd4` raised no finding.

## Verified sound

| Statement | Instance | Computed on each side | Result |
| --- | --- | --- | --- |
| "`LeanPool/WhiteheadTheorem` proves Whitehead's theorem for CW complexes" | `WhiteheadTheorem/Basic.lean` at f8b9b72 | `WhiteheadTheorem (X Y : CWComplex.{u}) (f) : IsWeakHomotopyEquiv f.hom → IsHomotopyEquiv f.hom` | true |
| "which Scope lists as not used" | README line 63; AlgebraicTopology (main) | Row "Homotopy groups of spaces, Hurewicz and Whitehead theorems … not used". AlgebraicTopology §8.5 is Whitehead. No other README line names Whitehead. | true |
| "each project permissively licensed (Apache-2.0 or MIT)" | LeanPool `NOTICE` | WhiteheadTheorem is listed among Apache-2.0 originals and FactorizationSystems among MIT originals. Two CC-BY-NC-SA projects were relicensed to Apache-2.0 by their sole authors. | true |
| "Lean and Mathlib v4.35.0, earlier than our pin" | LeanPool `lean-toolchain`, `lake-manifest.json`; this head | LeanPool: `v4.35.0`, Mathlib `inputRev` `v4.35.0` (rev 56a0058). Pin: `v4.36.0-rc2`, Mathlib 1b1ccf4. | true |
| "Nothing there treats basic localizers, test categories, Thomason equivalences or derivators" | tree 6587f51, 345 directories; NOTICE | No project name or NOTICE entry matches. The nearest are EilenbergZilber, DirectedTopologyLean4 and FiniteGraphFundamentalGroup, none of them about localizers or derivators. | true by name |
| R01: FactorizationSystems against the targets | `Examples.lean`; README 7.5, 8.3 | One example: (epi, mono) on `Type u`. 7.5 Check: componentwise epi–mono pairs on `Δ × Δ`. 8.3: `ReedyStructure (epimorphisms SimplexCategory) (monomorphisms _) ℕ`, Mathlib line 42. | no target is linked |
| R02: reuse rule | `README.md` line 330; NOTICE; file headers | House rule: the authors' agreement. README here: the maintainers' agreement. The authors are Jiazhen Xia and Ivan Kobe, upstream of the pool. | rule misstated |
| Description against the head: Provenance paragraph; "Downstream consumers, Research context, Provenance and References" | headings at lines 1568, 1577, 1586, 1599; `Suggested.lean` | Commit f8b9b72, v4.35.0, two projects, not a dependency. `Suggested.lean` has no Whitehead or factorization-system declaration (grep: only `brown_factorization`). | true; no change left unstated |

`Suggested.lean` and the pins are unchanged since `a61ddd4`, so the rows of the previous reviews for untouched statements stand as in the review of `a61ddd4`.

- **Gate.** The worker's gate at `8fbebd0` is 0 on every check, with `build=0`, OK. My re-run (`--base origin/main`) is 0 on every text scanner, including `statement-hygiene`, `stray-files` and `outside-folder`. Its only non-zero check is `depcheck: NOT IN ORDER: HomotopyTheoryOfCategories` against the public merge order, which is not a finding.
- **Dependency check** against the candidate order: `depcheck: 237 roadmaps, 2242 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.
- **Elaboration.** `lake env lean` on `Suggested.lean` exits 0 with 52 "declaration uses `sorry`" warnings and nothing else.
- **Outside the folder:** `git diff --stat origin/main...HEAD` outside `TauCetiRoadmap/HomotopyTheoryOfCategories` is empty.
- **Seeded sample:** none of the 15 seeded targets falls in the changed passages. The README flags no locator as unverified.
- **External texts read at commit f8b9b72:** LeanPool `README.md`, `NOTICE`, `lean-toolchain`, `lake-manifest.json`, `WhiteheadTheorem/Basic.lean`, `FactorizationSystems/Examples.lean`, and the `LeanPool/` tree listing.
- **Pinned declarations opened:** 1, `SimplexCategory.reedyStructure` at `Mathlib/AlgebraicTopology/Reedy/SimplexCategory.lean` line 42.
- Remark on untouched text (no change requested): the Scope row at line 63 cites "AlgebraicTopology, Stage 8", but AlgebraicTopology numbers that material as Layer 8 (§8.5).

Overlap check: read GrothendieckInfinityGroupoids (#1060), ModelCategories, KanQuillen, EnrichedLocalization and SimplicialCategories (#2269), and StableHomotopyKTheory and BordismFormalGroups (main), as in the previous review. The change adds no owned object. Orthogonal factorization systems, named only in the Provenance section, are not owned here; OrthogonalFactorization (#341) plans them, and this roadmap does not cite it. No object is owned twice.

Source independence: changed passages only. 3 passages (the two Provenance paragraphs and the References entry) were compared with 1 source, LeanPool's `README.md` at f8b9b72. The longest shared run is 5 words, the licence phrase "permissively licensed (Apache-2.0 or MIT)", which is not copying. No layer was added, removed or reordered, so the arrangement stands as compared in the full review.

## Not verifiable

- Brown–Heath–Kamps 1983, Brown–Spencer 1976 and Joyal–Street 1993 are `uncertified` in the manifest and cited by locator alone. No changed text cites them.
- Hirschhorn 2003 (8.3) was verified only through secondary sources, as in earlier reports. No changed text cites it.
- LeanPool's 345 directories were checked by name and NOTICE entry, not file by file, for the "nothing there treats" sentence.

## Source issues

- none

## For the human reviewers

- Licence: the manifest records `bhk1983`, `brownspencer1976` and `joyalstreet1993` as `uncertified` (paywalled). The README cites them by locator only, and no text was compared with them.
- Licence: LeanPool's `NOTICE` lists FactorizationSystems among MIT originals ("Copyright (c) 2024 ivankobe"). Its `Examples.lean` header at f8b9b72 says "Released under Apache 2.0" with copyright 2026 Ivan Kobe. Nothing from LeanPool is adapted in `Suggested.lean`.
