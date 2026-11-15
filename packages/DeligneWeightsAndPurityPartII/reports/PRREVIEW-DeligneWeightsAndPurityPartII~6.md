# Review of DeligneWeightsAndPurityPartII (pull request #1760 at 71dd669)

**Verdict:** accepted

Incremental re-review of the 22 lines changed since f44c08c (README :13, :17, :33, :45, :49, :953, :975, :983, :987), and of the pull request's title and description against this head. No finding.

## Previous findings

- R01 — repaired: Conventions (:33) define a projective fan by `AlgebraicGeometry.Scheme.IsProjectiveOver F` for every field F; :953 concludes “projective over k in the sense of `AlgebraicGeometry.Scheme.IsProjectiveOver k` … which is the projectivity hypothesis of §4.6”.
- R02 — repaired: the description now reads “`Suggested.lean` declares nothing: no headline theorem is statable against the pinned Mathlib and Tau Ceti, and its module docstring names, for each group of headlines, the carriers it lacks”.

## Verified sound

| Statement | Instances and computed values on both sides | Result/change |
|---|---|---|
| Projective fan (Conventions, :33) against the pinned `IsProjectiveOver` | Pin: ∃ finite R-module M and a closed immersion over Spec R into Proj of `homogeneousSubmodule R M`. Σ₀: `X_{Σ₀,F}` = Spec F = Proj Sym_F(F). Empty fan: empty scheme, closed in any Proj; pin imposes no nonemptiness | Definition determines the notion; the nonprojective complete regular fan of the :969 Check fails it over every field |
| §4.7 projectivity conclusion (:953) | (1,1): N = 2·2 − 1 = 3, ℙ¹×ℙ¹ ⊆ Proj Sym_k(k⁴), relation z₀₀z₁₁ = z₀₁z₁₀. Empty family: N = 0, identity of ℙ⁰_k = Spec k. n = 0: Proj k[x₀] = Spec k | True; k arbitrary, so the Conventions' “every field F” is met; matches §4.6's hypothesis at :934 |
| Σₙ is `TauCeti.Toric.Fan.projectiveSpace` (:49, :953) | Pin: generators `none ↦ −∑ b j`, `some j ↦ b j`; cones indexed by S ≠ univ. n = 1: rays e₁, −e₁, cones {0}, cone(e₁), cone(−e₁). n = 0: `Option ι` has one element, only S = ∅, the zero cone | Same rays and cones as :953; Σ₀ agrees |
| Restriction over ℂ to `projectiveSpaceToProj` (:953) | Pin: target Proj of Sym_ℂ(`Option ι → ℂ`); chart of the cone omitting k has range `Proj.basicOpen 𝒜 (X k)`; `IsIso` instance. README: chart of σᵢ onto xᵢ ≠ 0, x₀ ↔ e₀ ↔ `none`. n = 1: σ₀ = cone(e₁), ring k[x₁/x₀], open x₀ ≠ 0 | Same charts, same indexing; ℂ-only at the pin, as :49 says; the every-field statement stays §4.7's |
| ℙⁿ_k as Proj of the symmetric algebra (:45) | n = 0: Sym_k(k) = k[x₀], Proj = Spec k. n = 1: Sym_k(k²) = k[x₀,x₁], degree-1 part of rank 2. Pin: `gradedAlgebra : GradedAlgebra (homogeneousSubmodule R M)` is a global instance | Agrees with the carrier `IsProjectiveOver` uses, so the Segre target is literally an instance of the predicate |
| Theorem of §4.7 against SCH12 (seeded target) | SCH12 line 2589 (Theorem 9.6, p. 309): characteristic-0 local field, geometrically connected proper smooth, set-theoretic complete intersection in a projective smooth toric variety. Line 239: Theorem 1.15. Lines 2373, 2386: gluing (p. 303), Definition/Proposition 8.4 (p. 304) | Hypotheses and pages as cited; the changed text alters no hypothesis |

Rows for statements the diff does not touch stand as in the previous review, of f44c08c.

- Gate at 71dd669 (worker's run): every counter 0, build 0, OK. Dependency check rerun: `depcheck: 244 roadmaps, 2229 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line.
- Elaboration: `lake env lean` on `TauCetiRoadmap/DeligneWeightsAndPurityPartII/Suggested.lean` exits 0 with no output; the file declares nothing, so the `#check` comparison and the one-tactic probe have empty inventories. Nothing changed outside the folder against the base.
- Library declarations opened at the pin (7): `TauCeti/AlgebraicGeometry/ProjectiveSpectrum/ProjectiveOver.lean:58` (`IsProjectiveOver`), `TauCeti/LinearAlgebra/SymmetricAlgebra/Homogeneous.lean:57`, `…/Grading.lean:74`, `TauCeti/Geometry/Toric/Algebraic/Fan/ProjectiveSpace/Basic.lean:66` and :279, `…/ProjectiveSpace/Proj.lean:491` and :612; Mathlib `LinearAlgebra/SymmetricAlgebra/Basic.lean` exists. Every path on :45 and :49 is exact.
- Cross-roadmap citations resolved (4): SchemeAndStackFoundations §4.19 (its README :7737, `IsProjectiveOver` at :7778); AnalyticToricGeometry Layer 0 (:186) and “Acceptance checks” (:504, :521); ShimuraCompactifications §0.16 at its open head; AnalyticToricGeometryPartII §0.5 at its open head.
- Source locators checked (4): SCH12 lines 239, 2373, 2386, 2589. Seeded sample: only §4.7 lies in a changed passage; the other fourteen keep their earlier verification.
- Title and description read against the head: adds the folder (three files, 60 headings, no Lean declaration); the `IsProjectiveOver` and `projectiveSpaceToProj` sentence, the `Suggested.lean` sentence, the WeightsInEtaleCohomology sentence (README :17, and :987 no longer names it as a consumer) and the validation counters all agree with the head.
- Declared gaps: the four ClassicalAdicEtaleCohomology contracts are untouched by the diff.

Overlap check: read AnalyticToricGeometryPartII, ClassicalAdicEtaleCohomology, EtaleCohomologyFoundations (and SchemeAndStackFoundations §4.19); the changed passages share the projective-space fan and its complex Proj identification, and the projectivity predicate, with the pinned Tau Ceti, which owns them and is cited; nothing else shared.

Source independence: changed passages only; 3 passages compared with 1 source (SCH12 lines 2368–2389 and 2589–2591), none shared beyond formulas and defined terms (longest common run 4 words); largest share ITO20, 94 of 187 source mentions; no layer added, removed or reordered, so the contents were not compared again.

## Not verifiable

- LUT93, HUB96, HUB98: settled as uncertified; no changed passage cites them.
- The description's account of earlier review rounds and of who ported the package: not checkable from the head.

## Source issues

- none

## For the human reviewers

- ITO20, the source with the largest share of locators, is cited as arXiv:2008.07794v1 (`TauCetiRoadmap/DeligneWeightsAndPurityPartII/README.md:994`); the README gives no journal reference for it.
