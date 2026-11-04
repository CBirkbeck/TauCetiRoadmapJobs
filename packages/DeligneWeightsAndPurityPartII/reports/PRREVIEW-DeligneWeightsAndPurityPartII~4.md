# Review of DeligneWeightsAndPurityPartII (pull request #1760 at 01f26c4)

**Verdict:** accepted

Incremental re-review of the 34 lines changed since 6d3fa37: the `gap:projective-space-fan-realization` contract is withdrawn and §4.7 now owns the projective-space realization of the standard fan schemes (README :953–:975), with the matching scope sentence (:15), a Mathlib paragraph (:45), a ShimuraCompactifications supplier subsection (:95–:97), the rewritten AnalyticToricGeometryPartII clause (:103), the §4.7 *Needs:* line (:975), the Layer 4 dependencies (:983) and the Lean docstring (Suggested.lean :45–:50). Everything the diff leaves untouched carries the verdicts of the three previous reports. No blocking finding remains; the three findings below are P3.

## R01 (P3) — The fibre clause of the Segre API bullet is wrong for three or more factors

**Location:** `TauCetiRoadmap/DeligneWeightsAndPurityPartII/README.md:960`, “the restriction of O(1,…,1) to a fibre of any projection is O(1) on that fibre”.

**Claim and defect:** The projections of §4.7 are the projections prᵢ : ∏ⱼℙ^(nⱼ)_k → ℙ^(nᵢ)_k (“compatibly with projections”, :953, :959). A fibre of prᵢ is ∏_(j≠i)ℙ^(nⱼ)_k, and O(1,…,1) restricts to O(1,…,1) on it, which is O(1) only when the family has two members. The bullet is true only when “projection” means the projection onto the product of the other factors, whose fibre is a copy of ℙ^(nᵢ)_k.

**Witness:** ℙ¹_k × ℙ¹_k × ℙ¹_k with pr₁: the fibre over a point is ℙ¹_k × ℙ¹_k and O(1,1,1) restricts to O(1,1), of bidegree (1,1), not O(1). The Σ₁ × Σ₁ Check at :967 (“restriction to either ruling has degree 1”) is the two-factor case, where both readings agree.

**Exact repair:** Replace the clause by “the restriction of O(1,…,1) to a fibre of the projection onto the product of the other factors, a copy of ℙ^(nᵢ)_k, is O(1)”. On the witness the fibre of ℙ¹×ℙ¹×ℙ¹ → ℙ¹×ℙ¹ is ℙ¹ and the restriction of O(1,1,1) is O(1), of degree 1; the Σ₁ × Σ₁ Check is unchanged.

## R02 (P3) — The pinned complex product-fan isomorphism is not cited

**Location:** `TauCetiRoadmap/DeligneWeightsAndPurityPartII/README.md:953`, “For finite rational fans Σ, Σ′ … and every commutative ring R, construct `X_{Σ×Σ′,R}` ≅ `X_{Σ,R}` ×_R `X_{Σ′,R}` chart by chart”; the From Tau Ceti section (:49–:53) names no toric declaration.

**Claim and defect:** The pinned Tau Ceti already proves this identification over ℂ: `TauCeti.Toric.Fan.prod` (`TauCeti/Geometry/Toric/Algebraic/Fan/Product/Basic.lean:56`) and `TauCeti.Toric.Fan.algebraicProdIso` (`TauCeti/Geometry/Toric/Algebraic/Fan/Product/Isomorphism.lean:105`), the isomorphism from `(Φ.prod Ψ).algebraicRealization` to the fibre product of the two realizations over `Spec ℂ`, built chart by chart from the product cones. ShimuraCompactifications §0.16 identifies its scheme over ℂ with `Fan.algebraicRealization` (`finiteFanScheme_complex`), so the R = ℂ instance of the §4.7 product identification exists at the pin and must be cited rather than restated; the arbitrary-ring statement on the §0.16 scheme is new and stays §4.7's.

**Witness:** `TauCeti/Geometry/Toric/Algebraic/Fan/Product/Isomorphism.lean:91` (“The scheme of a product fan is the fibre product of the fan schemes over `Spec ℂ`”) and :105–:107.

**Exact repair:** In the From Tau Ceti section add that `TauCeti.Toric.Fan.prod` and `TauCeti.Toric.Fan.algebraicProdIso` in `TauCeti/Geometry/Toric/Algebraic/Fan/Product/Isomorphism.lean` give the product-fan isomorphism over ℂ only, and in §4.7 say that the identification over every R restricts over ℂ, through the agreement of ShimuraCompactifications §0.16, to that pinned isomorphism. No mathematics changes; the product rows of the table below are unaffected.

## R03 (P3) — The standard fan is attributed to Layer 0, and the projectivity notion is unnamed

**Location:** `TauCetiRoadmap/DeligneWeightsAndPurityPartII/README.md:953`, “the standard simplex fan of AnalyticToricGeometry Layer 0”; :975, “AnalyticToricGeometry Layer 0 (standard and product fans)”; :953, “Hence these complete regular fans give projective smooth split toric varieties over k”.

**Claim and defect:** AnalyticToricGeometry on main defines no standard fan in Layer 0 (:186–:260 of its README build fans, cones, regularity, products and the fan scheme in general); the standard complete fan of projective space appears only in the overview (:76) and in the “Acceptance checks” (:521, over ℂ with its standard charts). Section 4.7 defines Σₙ itself (rays e₁, …, eₙ, e₀ = −Σeᵢ, cones σᵢ), so nothing is unowned, but the attribution points to the wrong place. Separately, the conclusion “projective … over k” names no predicate, while the §4.6 hypothesis is “projective smooth split toric variety” and SchemeAndStackFoundations §4.19 at its head defines `IsProjectiveOverSpec k` as a closed immersion into ℙⁿ_k = Mathlib's `Proj` of k[T₀, …, Tₙ] with the degree grading, the same carrier §4.7 uses, with structure map `Proj.toSpecZero`. The Segre closed immersion of §4.7 establishes exactly that predicate.

**Witness:** `Completed/AnalyticToricGeometry/README.md:76`, :521; `TauCetiRoadmap/SchemeAndStackFoundations/README.md` at its head, §4.19, the paragraph “Define `IsProjectiveOverSpec R g`” and its Check “`ℙⁿ_R` itself … for `n = 0`, `ℙ⁰_R ≅ Spec R`”.

**Exact repair:** Write “the standard complete fan Σₙ, defined here as in the “Acceptance checks” of AnalyticToricGeometry” and cite Layer 0 only for fans and products; and say that the Segre closed immersion makes `X_{∏Σ_(nᵢ),k}` projective over k in the sense of SchemeAndStackFoundations §4.19 `IsProjectiveOverSpec`, whose ℙⁿ_k is the same `Proj` with the same structure map, so that §4.6's hypothesis and §4.7's conclusion name one notion. For n = 0 both give ℙ⁰_k = Spec k.

## Previous findings

- R01 — repaired: the `gap:projective-space-fan-realization` contract is gone; README gap slugs are now the four ClassicalAdicEtaleCohomology slugs, equal to the plan's four, and §4.7 (:953–:961) owns the identification on the ShimuraCompactifications §0.16 scheme instead of asking a supplier for it.
- R02 — repaired: “### From TauCetiRoadmap.ShimuraCompactifications” (:95–:97) now describes §0.16 (charts Spec R[P_σ], face localizations, torus action, stratum ideals, coefficient change, agreement over ℂ) and states that §0.16 identifies no fan with projective space; verified against §0.16–§0.17 at the supplier's head.

## Verified sound

**Changed passages.** README :15, :45, :95–:103, :951–:983 and Suggested.lean :45–:50 were read in full with §4.6 (:932–:947), which §4.7 applies, and the Layer 4 examples (:979). `Suggested.lean` still declares nothing (58 lines, `module`, one `import Mathlib`, one docstring, the namespace). The diff outside the folder is empty (`git diff --stat origin/main...HEAD` excluding the folder prints nothing).

**Gate, dependency check and elaboration.** The worker's gate at 01f26c4 is all zeros and OK. `lake env lean` on `TauCetiRoadmap/DeligneWeightsAndPurityPartII/Suggested.lean` from the worktree exited 0 with no output in 6 s. With no declaration, the `#check @name` comparison, the section-variable audit and the one-tactic padding probe have empty inventories; no headline is statable at the pins, and the docstring names what each lacks. Dependency check rerun for this head:

```text
depcheck: 204 roadmaps, 1652 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. `ORDER.txt`: ShimuraCompactifications 146, AnalyticToricGeometryPartII 147, this roadmap 346; SchemeAndStackFoundations, AnalyticToricGeometry and AlgebraicModuliForArithmeticGeometry are on main or earlier.

**Declared gaps.** `packages/DeligneWeightsAndPurityPartII/design/plan.json` `gaps`: `huber-compact-support-nearby-cycles`, `analytic-comparison-automorphisms`, `adapted-plurinodal-alteration`, `huber-smooth-relative-duality`; README slugs: the same four (5, 3, 5 and 6 mentions). Their texts are unchanged since r1 and keep that report's verdict (precise, minimal, declared).

**Library declarations opened at the pins.** `AlgebraicGeometry.«Proj»` as a `Scheme`, `Mathlib/AlgebraicGeometry/ProjectiveSpectrum/Scheme.lean:854`; `MvPolynomial.homogeneousSubmodule`, `Mathlib/RingTheory/MvPolynomial/Homogeneous.lean:87`; `MvPolynomial.gradedAlgebra`, an `abbrev` at :613 whose docstring says it is deliberately not a global instance, made a local instance at :627, so README :45 “a local rather than global instance” is exact; `AlgebraicGeometry.IsClosedImmersion`, `Mathlib/AlgebraicGeometry/Morphisms/ClosedImmersion.lean:44` (a class extending `SurjectiveOnStalks`). No `VeryAmple`, `veryAmple` or Segre-embedding declaration exists in the pinned Mathlib (grep over `Mathlib/`; the only “Segre” is a heights section in `Mathlib/NumberTheory/Height/Basic.lean:641`), and no fan scheme, so README :45 “Mathlib identifies no fan scheme with Proj and states no very ampleness” holds. Tau Ceti: `TauCeti.Toric.Fan` at `TauCeti/Geometry/Toric/Algebraic/Fan/Basic.lean:83` has fields `cones`, `finite_cones`, `isToricCone`, `mem_of_isFaceOf`, `inf_isFaceOf_left` and no nonemptiness field, so the empty fan of the n = 0 Check is a fan at the pin; `Fan.algebraicRealization` at `TauCeti/Geometry/Toric/Algebraic/Fan/Scheme.lean:138` is the complex colimit; `Fan.prod` and `Fan.algebraicProdIso` as in R02. `finiteFanScheme` is absent from the pin, as the roadmap service's lead says; it is cited as a ShimuraCompactifications target, not as a pinned name.

**Cross-roadmap citations resolved at the suppliers' heads.** ShimuraCompactifications (open head through the roadmap service): §0.16 “Toric schemes over arbitrary commutative rings” constructs `TauCeti.Toric.finiteFanScheme` for a finite rational fan and any commutative ring from the charts Spec R[P_σ] glued along face localizations, with the split torus action, stratum ideals, `finiteFanScheme_baseChange`, `finiteFanScheme_complex` (agreement with `Fan.algebraicRealization` over ℂ) and `finiteFanScheme_torusAction`; it states no product-fan compatibility and no projective-space identification; its ℙ¹ fan appears only as the first Check of §0.17. README :97 is an accurate description. AnalyticToricGeometryPartII (`rev/1647`): §0.5 “Integral toric line bundles” builds O(D) on X_(Σ,A) for every commutative ring A from generators χ^(m_σ) with ⟨m_σ,vᵢ⟩ = −aᵢ, and §0.3 fixes W_Σ(D) = {u : ⟨u,vᵢ⟩ ≥ −aᵢ} (:23, :145), the convention the §4.7 section count uses; §1.1 is the unit toric space and §1.2 the complete-fan analytification comparison, which says “Regularity and projectivity are unnecessary” and whose third Check is the complete regular nonprojective fan of WeilConjectures WC.6 (FS25, Example 4.1), so README :103 and the Check at :969 are accurate; neither section, nor §0.5, identifies a fan scheme with projective space (grep for Proj, projective space, Segre, very ample: no target). AnalyticToricGeometry on main: Layer 0 (:186) supplies fans, regularity, products and the complex fan scheme; :160–:163 state that the empty fan is a regular fan with empty realization and that a nonempty fan contains the zero cone (`Fan.bot_mem`); the “Acceptance checks” (:521–:524) identify the standard complete fan with complex projective space and product fans with products. SchemeAndStackFoundations (`rev/1276`) §4.19 defines `IsProjectiveOverSpec` on the same `Proj` carrier (R03). AlgebraicModuliForArithmeticGeometry (open head, §1.4 “Relative very ampleness”) defines `relativeVeryAmple` as an immersion into a projective bundle with L ≅ i*O(1) and checks O(1) on ℙⁿ_S; it states no Segre target (its one mention is a proof remark at :730), so §4.7's Segre closed immersion has no earlier owner.

**Ownership.** The projective-space identification of the standard fan schemes over an arbitrary field, the product-fan identification over an arbitrary ring and the Segre closed immersion with O(1) pulling back to O(1,…,1) were searched by object (Segre, very ample, simplex fan, standard complete fan, fan of projective space) in the roadmaps on main, the sibling checkouts named in the brief and the 440 open pull requests through the roadmap service: the only earlier statements are the complex ones at the pin and in AnalyticToricGeometry (R02, R03) and the generic predicates of SchemeAndStackFoundations §4.19 and AlgebraicModuliForArithmeticGeometry §1.4; none states the identification over a field. This roadmap is therefore the owner, and the scope sentence at :15 says so. `Suggested.lean` declares no name, so there is no fully qualified name to collide.

**Sources at the cited lines.** SCH12 line 2363 defines a fan (nonempty in Scholze's convention; the roadmap's empty-fan remark concerns the Tau Ceti notion and cites Scholze only for the gluing); lines 2368–2373 give U_σ = Spec k[σ^∨ ∩ M], the open immersions along faces and the glued X_Σ with the torus U_{0} = Spec k[M], printed p. 303 (the page-60 marker at line 2376 is printed 304); lines 2381–2389 are Definition/Proposition 8.4 with H⁰(X_Σ, O(D)) = ⊕ kχ^u over ⟨u,vᵢ⟩ ≥ −aᵢ, p. 304. The locator at :953 “pp. 303–304; SCH12 line 2373 and line 2386” is exact, and the sections formula is the one the API bullet at :958 applies. Line 2589 is Theorem 9.6, p. 309, as cited at :951.

**Seeded sample.** The fifteen sampled targets (§§0.3, 0.4, 0.5, 0.9, 0.10, 1.2, 2.2, 2.3, 2.4, 3.1, 3.6, 4.1, 4.2, 4.3, 4.5, at README :203–:920) lie entirely outside the diff hunks (:12–:17, :42–:48, :90–:105, :944–:985), so none is changed; they keep the r1 verification against SCH12, ITO20, DEL80, DJ96 and RAM05. The roadmap service's four unresolved Lean names (`finiteFanScheme`, `VanishingCycles.adicFunctoriality`, `WeilDeligneRep.IsPureEnd`, `WeilDeligneRep.IsWeilNumber`) are supplier targets of open roadmaps cited on unchanged lines (:57, :69, :97), settled in the previous rounds.

**Adversarial table.** Rows with computed values for every changed statement; the rows the diff leaves untouched carry the previous reports' rows by name.

| Statement | Instances and computed values on both sides | Result/change |
|---|---|---|
| Σₙ as defined at :953 is complete and regular; σᵢ charts | n = 1: rays e₁, e₀ = −e₁; σ₀ = cone(e₁), σ₁ = cone(e₀). n = 2: σ₁ = cone(e₀, e₂) with det(e₀, e₂) = det((−1,−1),(0,1)) = −1, a basis; in general {e₀} ∪ {eⱼ : j ≠ 0, i} has determinant ±1 | Regular, maximal cones cover ℤⁿ ⊗ ℝ; no change |
| k[σᵢ^∨ ∩ M] = k[xⱼ/xᵢ : j ≠ i] | σ₀^∨ = {u : uⱼ ≥ 0}, generators e_j^*, monomials xⱼ/x₀. σᵢ^∨ (i ≥ 1) = {u : uⱼ ≥ 0 (j ≠ i), Σu ≤ 0}, generators −e_i^* and e_j^* − e_i^* (j ≠ 0, i), monomials x₀/xᵢ and xⱼ/xᵢ: n free generators | Equal; the chart is D₊(xᵢ) = Spec (k[x]_(xᵢ))₀; no change |
| Overlap = homogeneous transition, torus = {x₀⋯xₙ ≠ 0} | σ₀ ∩ σ₁ for n = 1 is the zero cone: k[T, T⁻¹] with S = T⁻¹; for general n, σᵢ ∩ σᵢ′ localizes at xᵢ′/xᵢ, giving D₊(xᵢxᵢ′); the zero cone gives k[M] = k[(xᵢ/x₀)^±] = D₊(x₀⋯xₙ) | Matches :953, :957 and the Σ₁ Check; sending S ↦ T would glue the identity on k[T,T⁻¹]: the line with doubled origin, as the Check says |
| Σ₀ and ℙ⁰_k | Σ₀ = {0} in the zero lattice: chart k[0] = k, Spec k. Proj k[x₀]: relevant homogeneous primes avoiding (x₀) are {(0)}, D₊(x₀) = Spec (k[x₀]_(x₀))₀ = Spec k | Equal; O(D₀) = O since there is no ray; no change |
| Sections of O(D₀) and O(−D₀) with the ATGII §0.5 convention | W(D₀) = {u ∈ M : ⟨u,eⱼ⟩ ≥ 0 (j ≥ 1), ⟨u,e₀⟩ ≥ −1} = {u ∈ ℕⁿ : Σuⱼ ≤ 1}, size n + 1: n = 2 gives (0,0), (1,0), (0,1) = 1, x₁/x₀, x₂/x₀; h⁰(ℙ², O(1)) = 3. W(−D₀) needs Σuⱼ ≤ −1 with uⱼ ≥ 0: empty; h⁰(O(−1)) = 0. D_{e₀} lies in the charts i ≥ 1 where x₀/xᵢ = 0: the hyperplane x₀ = 0, so O(D₀) ≅ O(1), degree 1 on ℙ¹ | Both API bullets at :958 and the Σ₂ Check hold; the sign-reversed model is excluded by the section count |
| Product-fan identification over R | (σ×τ)^∨ ∩ (M ⊕ M′) = P_σ ⊕ P_τ, R[P_σ ⊕ P_τ] = R[P_σ] ⊗_R R[P_τ], Spec of which is the fibre product of charts. R the zero ring: both sides empty. Σ′ = Σ₀: cones σ × {0}, X ≅ X ×_R Spec R. Σ′ empty: no cones, empty scheme on both sides. ℂ: the pinned `algebraicProdIso` | True at every instance; the ℂ case is at the pin (R02) |
| Products of projective spaces and the empty product | Family (1,1): Σ₁ × Σ₁ has the four charts k[T,S], k[T⁻¹,S], k[T,S⁻¹], k[T⁻¹,S⁻¹], glued to ℙ¹ × ℙ¹. Empty family: iterated product over no factors is Σ₀, Spec k = ℙ⁰_k; N = ∏(nᵢ+1) − 1 = 1 − 1 = 0 | Matches :953 and the n = 0 Check |
| Segre map and O(1,…,1) | (1,1): N = 2·2 − 1 = 3, coordinates z_(ab) = x_a y_b, relation z₀₀z₁₁ = z₀₁z₁₀, image a smooth quadric; O(1) pulls back to O(1,1), of degree 1 on each ruling, while O(1,0) has degree 0 on the second ruling and is not very ample. (1,1,1): N = 7, image the Segre threefold cut out by the 2×2 minors across all index pairs. Empty family: ℙ⁰ → ℙ⁰ the identity, O ↦ O | Closed immersion and pullback hold; the fibre clause fails for three factors (R01) |
| Field extension k ⊆ k′ | charts k[xⱼ/xᵢ] ⊗_k k′ = k′[xⱼ/xᵢ]; Proj commutes with the base change of the graded ring; §0.16 `finiteFanScheme_baseChange` gives the fan side | Compatible; no change |
| Scope sentence :15 and Lean docstring :45–:50 | README gap slugs 4 = plan slugs 4; `finiteFanScheme` absent from the pinned Tau Ceti, `algebraicRealization` ℂ-only, so “lacks the fan scheme over a field … Mathlib's `Proj` alone does not carry it” is exact | Consistent |
| §4.7 first paragraph, Fermat and cubic-threefold Checks | Untouched by the diff | r2 row, values unchanged |
| Toric contract rows (n = 1 charts, chart indexed by i, O(1), Segre, empty product, nonprojective control) | Replaced by the rows above, recomputed on the §4.7 text | Superseded |
| The four ClassicalAdicEtaleCohomology contracts and their §§3.4, 4.2 applications | Untouched by the diff | r2 rows, values unchanged |
| Conventions, 0.1–0.10, 1.1–1.2, 2.1–2.5, 3.1–3.6, 4.1, 4.3–4.6 | Untouched by the diff | r1 rows by name, values unchanged |

## Not verifiable

- **LUT93**, **HUB96** and **HUB98**: settled as uncertified; nothing in the diff cites them. No new request is opened.
- Ownership against open pull requests was checked through the roadmap service's index of 440 pull requests and the sibling checkouts the brief names; board packages were checked through the index in the brief (five packages, none toric).

## Source issues

- none
