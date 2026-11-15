# Review of ArithmeticGaloisRepresentations (pull request #856 at 00e8930)

**Verdict:** accepted

Incremental re-review of 0 changed lines since `00e8930`: the folder is unchanged, and this round reads the pull request's title and description, as they stand now, against the head. No finding.

## Previous findings

- R01 — repaired: the description now reads "No continued L-function is consumed. Section 2.7 owns the Gauss-sum local constants of characters … the README names these as owners only", as `README.md:153–166` does.
- R02 — repaired: "PadicPeriodRings §§1.1–1.5, 2 and 4.1–4.3, earlier in the merge order, owns the completion … the README names it as owner and consumes nothing from it"; the two later roadmaps "consume this roadmap".
- R03 — repaired: the "On main" list now names "AnalyticNumberTheoryPartI §2.2a (… on which §§3.2, 3.5 and 6.6 here build)" and "AnalyticNumberTheoryPartII §§5.3g, 5.3h and 5.3j (… consumed by §2.7)".

## Verified sound

| Statement | Instances and computed values | Result |
| --- | --- | --- |
| Description: "Still open" against "On main" supplier split | Not on main, open: AbelianSchemesAndArithmeticModuli, IntegralHeckeAndGaloisDeterminants, PadicLocalLanglandsForGL2Qp. On main: AdelicAlgebraicGroups, AnalyticNumberTheoryPartI, PartII, CFSGBasicProperties, PivotalSpherical, RamificationOfCompleteDiscretelyValuedFields | Holds |
| Description: PadicPeriodRings earlier, two consumers later | Merge order: PadicPeriodRings line 23; this roadmap 58; FiniteFlatGroupsAndIntegralPadicHodgeTheory 67; NeronModelsAndSemistableAbelianVarieties 68. README mentions PadicPeriodRings once (`:198`, ownership table) | Holds |
| Description: arithmetic Frobenius, Hodge–Tate weight `+1` for `χ_ℓ` (§6 Check, `README.md:4415`) | `Frob_l ζ = ζ^l` gives `χ_p(Frob_l) = l` (geometric would give `l⁻¹`); `c ζ = ζ⁻¹` gives `χ_p(c) = −1`; `ℚ_ℓ(−1)` weight `−1` (`:277`) | Holds |
| Description: `LinearMap.det` is 1 on non-free modules | `A = ℚ × ℚ`, `M = (1,0)A`, `u = 2`: no finite basis, pinned `det u = 1`; the determinant line gives `(2,1) ≠ 1` | Holds |
| Description: joint continuity stronger than `ContRepresentation` | `a ↦ (1+ℓ)^a` on `ℚ_ℓ` discrete: each operator continuous; stabiliser of `1` is `{0}`, not open in `ℤ_ℓ` | Holds |
| Description: "§2.7 … consumes no continued L-function" against §2.7's contract | `README.md:499–512`: inputs are §§5.3g, 5.3h, 5.3j only; `:158–163` "this roadmap consumes neither"; `:165–166` §2.41 "does not use §2.7" | Holds |

The rows for untouched statements stand as in the previous review, of `00e8930`.

- Gate, run on this head: `gate ArithmeticGaloisRepresentations: set_option=0 … depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK` (exit 0); the worker's run adds `build=0`.
- Dependency check: `depcheck: 245 roadmaps, 2223 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- `lake env lean` on `Suggested.lean`: exit 0, 20 lines of output, each a `declaration uses 'sorry'` warning. `git diff --stat origin/main...HEAD` outside the folder is empty.
- Pinned declarations opened: Mathlib `LinearMap.det` (`LinearAlgebra/Determinant.lean:164–166`, `else 1` without a finite basis); `ContRepresentation` (`RepresentationTheory/Continuous/Basic.lean:55–58`, a bare `G →* V →L[R] V`).
- Description sentences checked against the head, all agreeing: the title (README heading), the summary block, the first prose paragraph (incl. "vast" at `README.md:5399–5425`, Ogg's formula at NeronModelsAndSemistableAbelianVarieties §§5.3a–5.3i, `:193–194, 2537`), the folder contents (three files, 33 declarations), "Supplier amendments" (`:441`, `:519`), the by-section supplier paragraph (`:148–150, 179–183, 481–512, 618–644, 717–722`), the L-function paragraph (`:153–166`), and the last paragraph (`:191–198`).
- Cross-roadmap citations of the description resolved, 14: on main as in the previous review (AA.2.4, §2.2a, §2.3a, §2.41, §§5.3g/h/j, T1–T2, Layer 2, Layers 3a–4a, LFunctions Layers 0, 5–6); at open heads: IntegralHeckeAndGaloisDeterminants Layers 0, 1 (`README.md:687, 1927`, *Classical Ribet lattice* `:2585`); PadicLocalLanglandsForGL2Qp §0.3 (`:268, 278`; its `:2452` names §2.3 here as the consumer); AbelianSchemesAndArithmeticModuli A3, A4.1, A6.10–A6.12 (`:1393, 1839, 3015, 3043, 3060`); PadicPeriodRings §§1, 2, 4.1, 4.3 (`:86, 272, 418, 471`); FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.P2–R07.P5a, R07.P7.1–R07.P7.5 (`:10, 1371`); NeronModelsAndSemistableAbelianVarieties §§5.0a, 5.3i, 6.0 (`:3034, 3695, 3832`).
- Seeded sample and unverified locators: none falls in a changed passage (0 changed lines); the README flags no locator as unverified.
- Remark, no change asked: the by-section paragraph is introduced by "Among its roadmap suppliers", so its not listing the other contract sections (ClassFieldTheory, Chebotarev, RepresentationTheory and the rest) contradicts nothing.

Overlap check: read ArtinRepresentations, PotentialAutomorphyInfrastructurePartII, NeronModelsAndSemistableAbelianVarieties, RamificationOfCompleteDiscretelyValuedFields, SmoothRepresentationsOfLocalGroups, ClassFieldTheory (the results-and-headings list is empty; scopes as read for the review of `00e8930`, the overlap listing unchanged: no shared pull request, no dropped id); nothing shared.

Source independence: changed passages only; 0 passages compared with 0 sources (the folder did not change); arrangement not compared again (no layer added, removed or reordered).

## Not verifiable

- none in the text this round checks.

## Source issues

- none

## For the human reviewers

- none
