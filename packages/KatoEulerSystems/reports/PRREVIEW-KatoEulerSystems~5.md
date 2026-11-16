# Review of KatoEulerSystems (pull request #1804 at 7a6112e)

**Verdict:** needs changes

Incremental re-review of 0 changed lines since 903763b; this round reads the pull request's title and description, as they stand now, against the head. One finding, in the description; the folder's files need no change.

## R01 (P3) — the description says RankZeroOneBSDPartII consumes this roadmap by name; it does not name it

**Location:** pull request description, prose paragraph: "ModularIwasawaMainConjectures, RankZeroOneBSDPartII, HeegnerPointEulerSystems and CMRankZeroConverse consume it by name."; and the `<!-- roadmap-summary -->` block, "Why Tau Ceti wants it": "RankZeroOneBSDPartII its Selmer finiteness for E/ℚ with L(E,1) ≠ 0 at every p".

**Claim:** `RankZeroOneBSDPartII` does not cite this roadmap, and the head says only that it "can use" it; the three other roadmaps named do cite it, as does `AutomorphicCongruences`, which the sentence omits.

**Witness:** `TauCetiRoadmap/RankZeroOneBSDPartII/README.md` and `Suggested.lean` at the open head 27e8ab08: 0 occurrences of `KatoEulerSystems` (and of "Kato"). `TauCetiRoadmap/KatoEulerSystems/README.md` line 3219: "`RankZeroOneBSDPartII` can use the reciprocity and interpolation statements".

**Repair:** Replace the prose sentence by: "ModularIwasawaMainConjectures, AutomorphicCongruences, HeegnerPointEulerSystems and CMRankZeroConverse consume it by name; RankZeroOneBSDPartII can use its Selmer finiteness but does not cite it." In the summary block write "RankZeroOneBSDPartII can use its Selmer finiteness for E/ℚ with L(E,1) ≠ 0 at every p;".

## Previous findings

- R01 — repaired: "Admissibility holds at almost all λ, and at every λ when f has CM or no nontrivial inner twist … Integral freeness, integral Euler-system and Tamagawa bounds, exact and multiplicative elliptic divisibility, control and the Ш bound assume p odd."

## Verified sound

| Statement | Instances | Values | Result | Change |
|---|---|---|---|---|
| Description "RankZeroOneBSDPartII … consume it by name" | occurrences of `KatoEulerSystems` at the open heads | RankZeroOneBSDPartII 0; ModularIwasawaMainConjectures 51; AutomorphicCongruences 38; CMRankZeroConverse 17; HeegnerPointEulerSystems 6 | false for one of the four named | R01 |
| Description "at every λ when f has CM or no nontrivial inner twist, hence for elliptic curves over ℚ" vs Conventions (line 198) and 4.1 | `u = [[1,1],[0,1]]`; E/ℚ | `u − 1 = [[0,1],[0,0]]`, kernel of dimension 1; for E, `F = F⁰ = ℚ`, B = M₂(ℚ) split; CM admissible by definition | agrees (README lines 200–204, 1952) | none |
| Description "canonical maps, rational module structure and regulator comparison hold at every p, 2 included" (at admissible places) | `p = 2` | 4.4 line 1808 "any p"; 5.2–5.3 lines 2133, 2165 include `p = 2`; 6.4 line 2531 "every p, including two" | agrees | none |
| Description "exact and multiplicative elliptic divisibility … assume p odd" vs 7.4 | `p = 2`, nonsplit `α = −1` | `1 − α⁻¹ = 2`: a unit for odd p, a non-unit at 2; README line 2792: at 2 "the multiplicative cases and the exact divisibility have no supplier"; `char | 2^t L_E` kept | agrees | none |
| Description "integral freeness, integral Euler-system and Tamagawa bounds, control and the Ш bound assume p odd" | `p = 2` | 4.4 `p ≠ 2`; 4.3 line 1799 and 7.2 line 2700 "p odd"; 7.7 "an odd prime p"; 7.8 `p ∤ 2 r_E ∏…`: `2 ∣ 2` fails; 7.9(3) "p odd" | agrees | none |
| Description "the K₂ transfer identity needs SK₁ = 0" vs 1.1 | R a field; general finite étale | field: `SK₁ = 0`, identity asserted; otherwise `f_*[s]` has determinant `N(s)` but need not equal `[N(s)]` (line 785) | agrees | none |
| `ellipticCyclotomicFiniteGeneration`, cited by "the points over every m-power cyclotomic tower" | `m = 1`; `m = 0` | `m = 1`: `x^1 = 1`, field ℚ, `E(ℚ)` finitely generated; `m = 0`, `n = 1`: `x^0 = 1` for all x, field ℂ, `E(ℂ)` not finitely generated | `1 ≤ m` in the signature excludes the failing case | none |

Rows for the folder's other statements stand as in the previous review, of `903763b`; the diff changes none.

- Description sentences checked against the head: the 3 paragraphs of the summary block and the prose paragraph item by item against the eight ownership bullets and the 80 headings; the folder, dependency and validation sentences. One contradicted (R01).
- Supplier subsections of the README: 24 roadmaps, 5 on main (`ModularCurves`, `ModularForms`, `PadicMeasuresIwasawaAlgebras`, `EllipticCurves`, `EtaleCohomologyFoundations`); the 19 others are the 19 entries of the generated depends-on block.
- Title and "adds" reading: the folder is not on main; 3 files, 3398 insertions, 80 headings and 3 Lean declarations added, none removed. No change outside the folder against the base (`outside-folder=0`).
- Gate rerun on this head: every check 0, `OK`, exit 0; the worker's gate, build included, passed. Dependency check: `depcheck: 234 roadmaps, 2228 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- `lake env lean` on `TauCetiRoadmap/KatoEulerSystems/Suggested.lean`: two `declaration uses sorry` warnings (lines 50, 75), nothing else. Elaborated signatures: 3 declarations, no lost binder.
- Remark: the description's list of statements that assume p odd omits 7.6 (no finite submodule, "an odd prime p"); it claims nothing at 2 for it.
- Seeded sample and source locators: none falls in a changed passage (the folder's diff is empty); not rechecked.

Overlap check: read the ownership and supplier passages on this roadmap of ModularIwasawaMainConjectures, ModularIwasawaMainConjecturesPartII, AutomorphicCongruences and CMRankZeroConverse at their open heads; each cites `KatoEulerSystems` by section or as a declared gap, and leaves the geometric classes to PadicFamilies §4.0 as this README does; nothing shared. The scopes of the roadmaps on main were not read again (no folder change since 903763b); `scratch/overlaps.md` lists no dropped id, second copy or conflicting head.

Source independence: changed passages only: 0 passages compared (the folder's diff is empty); arrangement not compared again, no layer added, removed or reordered.

## Not verifiable

- The description's "5 independent review rounds and 2 red-team rounds on the job board": the board's history is outside what this review reads.
- `Serre1972`, `FontaineMessing1987` (waived) and `PerrinRiou1990`, `PerrinRiou1994`, `Schneider1985`, `JacquetShalika1976`, `Rohrlich1984`, `Rohrlich1988`, `Ribet1980`, `BlochKato1990`, `DiamondShurman2005` (uncertified): cited by locator only, as in the previous reports.

## Source issues

- none

## For the human reviewers

- none
