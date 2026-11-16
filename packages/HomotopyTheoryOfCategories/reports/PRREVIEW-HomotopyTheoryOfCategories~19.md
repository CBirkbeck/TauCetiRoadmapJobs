# Review of HomotopyTheoryOfCategories (pull request #1521 at 46d6fae)

**Verdict:** accepted

Incremental re-review of the 10 lines changed since `8fbebd0`, all in the Provenance section of `TauCetiRoadmap/HomotopyTheoryOfCategories/README.md`. No findings.

## Previous findings

- R01 — repaired: "`LeanPool/FactorizationSystems` treats orthogonal factorization systems, with (epi, mono) on `Type u` as its one example; no target here uses one: the epi–mono factorizations of `Δ` in 7.5 and 8.3 are those of Mathlib's `SimplexCategory.reedyStructure`." (lines 1596–1598)
- R02 — repaired: "adaptation is agreed first with the authors of the code (named in each file's header and in LeanPool's NOTICE), and adapted code keeps its license notices." (lines 1592–1593)

## Verified sound

| Statement | Instance | Computed on each side | Result |
| --- | --- | --- | --- |
| `SimplexCategory.reedyStructure` (cited by the changed text; 8.3) | `[2] → [2]`, `(0,1,2) ↦ (0,0,2)` | Pin line 42: `ReedyStructure (epimorphisms _) (monomorphisms _) ℕ`, `deg := len`. Image `{0,2}`, so `[2] ↠ [1] ↪ [2]`, degrees 2 → 1 → 2 | agrees with the 8.3 Check |
| 7.5 Products (seeded; cited by the changed text) | `(s⁰ : [1]→[0], d⁰ : [0]→[1])` on `Δ × Δ`; `[1] × [1]` | `(s⁰, id) ≫ (id, d⁰)` through `([0],[0])`, degrees 1 → 0 → 1. `max`: `(0,1) ⟶ (1,1)` gives 1 → 1, not strictly raising | true; Riehl–Verity 2.7 uses the sum |
| "no target here uses one" (an orthogonal factorization system) | (epi, mono) on `Δ`; README grep | The pair on `Δ` is orthogonal: factorization unique, both classes `IsMultiplicative` (Basic.lean line 46). "orthogonal" occurs only at line 1596. 5.4's lifting (line 780) is a weak one | true of what the targets consume |
| R02: "named in each file's header and in LeanPool's NOTICE" | LeanPool f8b9b72 | Headers: "Authors: Ivan Kobe" (`Examples.lean`), "Authors: Jiazhen Xia" (`WhiteheadTheorem/Basic.lean`). NOTICE: "Copyright (c) 2024 ivankobe" and upstream `jzxia/WhiteheadTheorem` | true; the NOTICE names Xia only by handle |
| R01: "(epi, mono) on `Type u` as its one example" | `FactorizationSystems/Examples.lean` | One `FactorizationSystem`, `EpiMonoSet`, with `epimorphisms (Type u)` and `monomorphisms (Type u)` | true |
| Description against the head | Provenance paragraph; supplier list; layers 0–13 | "its maintainers have not been contacted". Nothing is adapted, so the head's authors rule is not engaged. Suppliers match lines 148–209, and the layers match the headings | nothing contradicted or left unstated |

`Suggested.lean` is unchanged since `8fbebd0` (`git diff --stat 8fbebd0 HEAD` lists only `README.md`). The rows for untouched statements therefore stand as in the previous review, of `8fbebd0`.

- **Gate.** The worker's gate at `46d6fae` is 0 on every check, with `build=0`. My re-run (`--base origin/main`) is 0 on every text scanner, including `statement-hygiene`, `stray-files` and `outside-folder`. Its only non-zero check is `depcheck: NOT IN ORDER: HomotopyTheoryOfCategories` against the public merge order, which is not a finding.
- **Dependency check** against the candidate order: `depcheck: 257 roadmaps, 2433 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.
- **Elaboration.** `lake env lean` on `Suggested.lean` exits 0 with 52 "declaration uses `sorry`" warnings and nothing else.
- **Outside the folder:** `git diff --stat origin/main...HEAD` outside `TauCetiRoadmap/HomotopyTheoryOfCategories` is empty.
- **Source locators checked: 2.** Of the seeded sample, only 7.5 falls in the changed text's citations. Its locator, Riehl–Verity, TAC 29 (2014), 2.7, pp. 264–265 (product degree `deg(c) + deg(d)`), was checked against the TAC text, and so was 2.6 (`Δ`, `Δ₊`) for 8.3. Both hold.
- **Pinned declarations opened: 2.** `SimplexCategory.reedyStructure` (`Mathlib/AlgebraicTopology/Reedy/SimplexCategory.lean` line 42) and `ReedyStructure` (`Mathlib/AlgebraicTopology/Reedy/Basic.lean` line 45).
- **External texts read at LeanPool f8b9b72:** `NOTICE`, `LeanPool/FactorizationSystems/Examples.lean` and `LeanPool/WhiteheadTheorem/Basic.lean`.
- Remark on untouched text (no change requested): the Scope row at line 63 still cites "AlgebraicTopology, Stage 8", but AlgebraicTopology numbers this material as Layer 8.

Overlap check: I read GeneralAlgebraicKTheory (main), which is new to the vocabulary list. It consumes Quillen A/B from StableHomotopyKTheory §§2.31–2.35 and Waldhausen foundations from its §§6.1–6.2, and it owns nothing this roadmap owns. GrothendieckInfinityGroupoids (#1060), ModelCategories, KanQuillen, EnrichedLocalization, SimplicialCategories (#2269), StableHomotopyKTheory and BordismFormalGroups (main) stand as read in the previous review. OrthogonalFactorization (#341) plans no simplex-category factorization (grep: no `simplex`, `Reedy` or `Δ`), and this roadmap neither cites it nor owns orthogonal factorization systems. The change adds no owned object, and nothing is shared.

Source independence: changed passages only. 2 passages (the reuse clause and the `FactorizationSystems` sentence) were compared with 2 sources: LeanPool at f8b9b72 (`NOTICE` and the two file headers) and Riehl–Verity TAC 2014 2.6–2.7. The longest shared run is 3 words, the standard name "orthogonal factorization systems". No layer was added, removed or reordered, so the arrangement stands as compared in the full review.

## Not verifiable

- Brown–Heath–Kamps 1983, Brown–Spencer 1976 and Joyal–Street 1993 are `uncertified` in the manifest and cited by locator alone. No changed text cites them.
- Hirschhorn 2003 (8.3) was verified only through secondary sources, as in earlier reports. No changed text cites it.
- LeanPool's 345 directories were checked by name and NOTICE entry, not file by file, for the "Nothing there treats" sentence.

## Source issues

- none

## For the human reviewers

- Licence: the manifest records `bhk1983`, `brownspencer1976` and `joyalstreet1993` as `uncertified` (paywalled). The README cites them by locator only, and no text was compared with them.
- Licence: LeanPool's `NOTICE` lists FactorizationSystems among the MIT originals ("Copyright (c) 2024 ivankobe"). Its `Examples.lean` header at f8b9b72 says Apache 2.0, copyright 2026 Ivan Kobe. Nothing from LeanPool is adapted in `Suggested.lean`.
