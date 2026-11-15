# Review of KatoEulerSystems (pull request #1804 at 903763b)

**Verdict:** needs changes

Incremental re-review of 0 changed lines since 903763b; this round reads the pull request's title and description against the head. One finding, in the description; the folder's files need no change.

## R01 (P3) — the description's "every prime is covered" is contradicted by the README's hypotheses

**Location:** pull request description, `<!-- roadmap-summary -->` block, "Approach and generality": "Every prime is covered, 2 included, with the full cyclotomic algebra in place of halved projectors and literal symmetric-power duals kept integral."

**Claim:** The head does not cover every prime: the canonical morphism and everything resting on it are stated for admissible `(f,λ)` only, and the elliptic divisibility, control, Ш and Tamagawa statements assume p odd.

**Witness:** `TauCetiRoadmap/KatoEulerSystems/README.md` line 1992 "Throughout 5.1–5.4 `(f,λ)` is admissible"; lines 1816–1817 (inadmissible λ "not claimed"); 7.4 line 2767 "p an odd prime"; 7.8 line 2924 "`p = 2` is excluded"; 7.9(3) line 3138 "p odd".

**Repair:** Replace the sentence by: "The module structure of Iwasawa cohomology, the canonical and twist-one morphisms and the regulator comparison are stated at every prime p, 2 included, for the admissible pairs (f, λ) of the Conventions (all but finitely many λ; every λ when f has CM, has no nontrivial inner twist, or comes from an elliptic curve over ℚ), with the full cyclotomic algebra in place of halved projectors and literal symmetric-power duals kept integral. The integral freeness of 4.4, the elliptic divisibility, no-finite-submodule, control and Ш statements (7.4, 7.6–7.8) and the Tamagawa bound 7.9(3) assume p odd." In the block's first sentence, write "Kato's canonical zeta morphism V(f) → H¹_Iw(V(f)) at the admissible coefficient places".

## Previous findings

- none: the previous report (of 903763b, accepted) listed no finding; its R01 and R02 of the round before were recorded there as repaired, and the folder has not changed since.

## Verified sound

| Statement | Instances | Values | Result | Change |
|---|---|---|---|---|
| Description "every prime is covered" vs Conventions "admissible pairs" and 5.1 | λ above a place where Momose's algebra B is a division algebra D | for `d ∈ D`, `d ≠ 1`: `d − 1` invertible, fixed space 0, never 1-dimensional; README line 1662 says the same | such `(f,λ)` is not admissible; 5.1–5.4, 6.2, 6.4, 7.1–7.2 not claimed there | R01 |
| Description "every prime … 2 included" vs 7.4, 7.8, 7.9(3) | `p = 2` | 7.8 hypothesis `p ∤ 2 r_E ∏…`: `2 ∣ 2`, fails; 7.4 "p an odd prime"; 7.9(3) "p odd"; 7.6, 7.7 "an odd prime p" | `p = 2` excluded from these | R01 |
| Description "finiteness of Sel_(p^∞)(E/ℚ) at every p when L(E,1) ≠ 0" vs 7.9 | E/ℚ, `p = 2`, CM E | README line 3040–3041: finite for every p, "including CM curves and `p = 2`"; an elliptic newform is admissible at every p (line 203, 4.1) | description agrees | none |
| Description "finite generation of E(ℚ_∞)" vs 7.3 | any p | README line 2732–2734: non-CM E, "for any p" | agrees (the description leaves the non-CM hypothesis to the README) | none |

Rows for the folder's statements stand as in the previous review, of `903763b`; the diff changes none.

- Description sentences checked against the head: 5 of the summary block, the long prose paragraph (each named item against the eight ownership bullets and the layer headings), the folder, validation and dependency sentences. One contradicted (R01).
- Consumers named in the description resolved at the open heads: `ModularIwasawaMainConjectures`, `AutomorphicCongruences`, `CMRankZeroConverse` and `HeegnerPointEulerSystems` (e9fc187f, §6.9 "Auxiliary rank-zero formula over K" exists) cite `KatoEulerSystems` by name; `RankZeroOneBSDPartII` is named in the README's Downstream consumers.
- Supplier subsections of the README (24 roadmaps) against the description: the 5 on main aside, the 19 others are the 19 entries of the generated depends-on block, `AdelicImagesAndModularCurves` included; "the elliptic image theorems are imported" agrees with 4.7.
- Title and "adds" reading: the folder is not on main; 3 files, 3398 insertions, 80 headings and 3 Lean declarations added, none removed; the description says so.
- Gate rerun on this head: every check 0, `OK`, exit 0 (the worker's gate: every check passed, build included). Dependency check: `depcheck: 238 roadmaps, 2254 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- `lake env lean` on `TauCetiRoadmap/KatoEulerSystems/Suggested.lean`: two `declaration uses sorry` warnings (lines 50, 75), nothing else. The worker's elaborated signatures: 3 declarations, no lost binder. No change outside the folder.
- Remark: `CMRankZeroConverse` (README lines 109, 111) and `HeegnerPointEulerSystems` (line 229) each state "What KatoEulerSystems must provide (gap:…)"; these are their declared contracts, and this README's Downstream consumers does not name `CMRankZeroConverse`.
- Seeded sample and source locators: none falls in a changed passage (the folder's diff is empty); not rechecked.

Overlap check: no folder change since 903763b, so the scopes of the closest roadmaps were not read again; `scratch/overlaps.md` lists no shared roadmap, dropped id or second copy; the citations of this roadmap by `CMRankZeroConverse` and `HeegnerPointEulerSystems` were read.

Source independence: changed passages only: 0 passages compared (the folder's diff is empty); arrangement not compared again, no layer added, removed or reordered.

## Not verifiable

- The description's "5 independent review rounds and 2 red-team rounds on the job board": the board's history is outside what this review reads.
- `Serre1972`, `FontaineMessing1987` (waived) and `PerrinRiou1990`, `PerrinRiou1994`, `Schneider1985`, `JacquetShalika1976`, `Rohrlich1984`, `Rohrlich1988`, `Ribet1980`, `BlochKato1990`, `DiamondShurman2005` (uncertified): cited by locator only, as in the previous report.

## Source issues

- none

## For the human reviewers

- none
