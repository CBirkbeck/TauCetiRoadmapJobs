<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/122#issuecomment-6334883609 -->
Red team round 2 pass b (claude) of dfb31e4

Verdict: needs_changes

1. **F01** (P2) `riemannGoodCover` is stated for a topological surface, not the Riemann surface of the README

   **Location:** `packages/AbelianSchemesAndArithmeticModuliPartII/Suggested.lean:143`: “theorem riemannGoodCover {S ι : Type*} [TopologicalSpace S] [T2Space S] [SecondCountableTopology S] [ChartedSpace ℂ S]”; `packages/AbelianSchemesAndArithmeticModuliPartII/README.md:1106`: “Every open cover of a second-countable Hausdorff Riemann surface has a locally finite refinement”.

   **Claim:** The Lean signature carries only a `ChartedSpace ℂ S` instance, which is a topological 2-manifold with no holomorphic (or even smooth) atlas; no `IsManifold` instance is in scope. The README target, its source and its proof plan ("geodesically convex" refinement via a Riemannian metric, as in the cited passage) are for a Riemann surface. At the Lean generality the conclusion (contractible finite intersections) is still true, but only through the smoothing of topological surfaces (Radó), which is neither a target nor a supplier here. The Lean statement is at a different generality from the README (defect class 9) and its proof route is unowned at that generality.

   **Witness:** GH line 1049–1054 (§5.2, PDF p.22) shrinks the cover members using a diffeomorphism onto open subsets of ℝ² and refines through Weil's differentiable-manifold argument; the round-2 pass a inventory records the same read-off ("Topological surface suffices") without naming a proof route at that generality. A probe copy with `[IsManifold 𝓘(ℂ) ω S]` added (under `open scoped Manifold ContDiff`) elaborates at the pin with only the `sorry` warning.

   **Exact repair text:** In `Suggested.lean` replace the binder list by
   ```lean
   open scoped Manifold ContDiff in
   theorem riemannGoodCover {S ι : Type*} [TopologicalSpace S] [T2Space S]
       [SecondCountableTopology S] [ChartedSpace ℂ S] [IsManifold 𝓘(ℂ) ω S]
   ```
   (rest of the statement unchanged). In the README target add after "Prove `riemannGoodCover` in the following generality.": "The carrier is a complex-analytic manifold of dimension one (`IsManifold 𝓘(ℂ) ω S`); the refinement uses a Riemannian metric and geodesically convex neighbourhoods, so no smoothing of a topological surface is assumed."

2. **F02** (P3) Two boundary theorems close in one tactic from Mathlib

   **Location:** `packages/AbelianSchemesAndArithmeticModuliPartII/Suggested.lean:232`: “theorem compactLatticeImageLimit_rankZero”; `:238`: “theorem compactLatticeImageLimit_constant”; `packages/AbelianSchemesAndArithmeticModuliPartII/README.md:1597`: “These boundary cases are named `compactLatticeImageLimit_rankZero`, `compactLatticeImageLimit_constant`”.

   **Claim:** Both are stated as `sorry`'d targets but are one tactic from Mathlib: the rank-zero image is `Set.univ` because `Fin 0 → ℤ_[ℓ]` is a subsingleton, and the constant case is `Set.iInter_const` after rewriting with `hconst`.

   **Witness:** A probe copy at the pin closes `compactLatticeImageLimit_rankZero` with `simp [Set.eq_univ_iff_forall]` and `compactLatticeImageLimit_constant` with `simp [hconst, Set.iInter_const]` (also `simp only [hconst, Set.iInter_const]`), exit 0, no diagnostics.

   **Exact repair text:** Replace the two `sorry` bodies by the verified proofs:
   ```lean
   theorem compactLatticeImageLimit_rankZero {ℓ : ℕ} [Fact ℓ.Prime]
       (u : Matrix (Fin 0) (Fin 0) (PadicInt ℓ)) :
       Set.range u.mulVec = Set.univ := by
     simp [Set.eq_univ_iff_forall]

   theorem compactLatticeImageLimit_constant {ℓ : ℕ} [Fact ℓ.Prime] (d : ℕ)
       (u : ℕ → Matrix (Fin d) (Fin d) (PadicInt ℓ))
       (v : Matrix (Fin d) (Fin d) (PadicInt ℓ)) (hconst : ∀ n, u n = v) :
       Set.range v.mulVec = ⋂ n, Set.range (u n).mulVec := by
     simp [hconst, Set.iInter_const]
   ```
   and in the README Checks say that these two are proved boundary theorems while `compactLatticeImageLimit_powers` remains a target.

3. **F03** (P3) Waterhouse Porism 4.3 is on printed page 540, not 541

   **Location:** `packages/AbelianSchemesAndArithmeticModuliPartII/README.md:2352`–`2353`: “Chapter 2, Porism 4.3 and Theorem 6.1, printed pp.527–528,541,550–551”; `packages/AbelianSchemesAndArithmeticModuliPartII/sources.toml:212`: “Porism 4.3, p.541”.

   **Claim:** The round-1 repair (fix report F23) changed 540 to 541 on the strength of the round-1 pass b witness "PDF page 21 = printed 541"; that arithmetic was wrong. In the cached legal copy the printed page header on PDF page 21 reads 540, on page 31 reads 550 and on page 33 reads 552, so printed = PDF + 519, and Porism 4.3 (Waterhouse line 786, PDF page 21) is on printed page 540. The original 540 was correct. The same offset makes the §1.2 locator at README lines 2019 and 2078 ("printed pp.525 ... PDF pp.6") inconsistent: Waterhouse line 143 (§1.2 heading) is on PDF page 5, printed 524.

   **Witness:** Waterhouse line 762 (page-21 header, printed 540), line 786 (Porism 4.3), line 1166 (page-31 header, printed 550), line 1240 (page-33 header, printed 552); Theorem 6.1 at line 1196 is on PDF pages 31–32, printed 550–551, which the README states correctly.

   **Exact repair text:** README line 2353: "pp.527–528,540,550–551."; `sources.toml` line 212: `locator = "Section 1.2; Chapter 2; Section 3.1; Porism 4.3, p.540; Theorem 6.1"`; README lines 2019 and 2078: "§1.2 and §3.1, printed pp.524–525,529–531 (PDF pp.5–6,10–12)".

4. **F04** (P3) `constantRankLocal`: the README's generality differs from the Lean's in both directions

   **Location:** `packages/AbelianSchemesAndArithmeticModuliPartII/README.md:1093`: “For a C^k map f:M^m→N^n of finite-dimensional real manifolds, 1≤k≤∞, with differential of constant rank r”; `packages/AbelianSchemesAndArithmeticModuliPartII/Suggested.lean:128`–`129`: “theorem constantRankLocal (m n r : ℕ) … (k : ℕ∞ω) (hk : 1 ≤ k) (f : (Fin m → ℝ) → (Fin n → ℝ))”.

   **Claim:** The README says the target is proved "in the following generality" for manifolds and 1 ≤ k ≤ ∞; the Lean statement is on an open subset of ℝ^m with values in ℝ^n (narrower carriers) and allows k = ω, the analytic case (wider regularity). Both statements are true, but the README and the Lean must agree (lean-form rule: the README's generality equals the Lean's).

   **Witness:** `ℕ∞ω` in the pinned Mathlib is `WithTop ℕ∞` with `ω` the analytic level; `1 ≤ k` admits `k = ω`. The Lean carrier is `(Fin m → ℝ) → (Fin n → ℝ)` with `U : Set (Fin m → ℝ)`.

   **Exact repair text:** README lines 1093–1096: "For an open set U ⊆ ℝ^m and a map f : ℝ^m → ℝ^n that is C^k on U, 1 ≤ k ≤ ω (ω the real-analytic case), with differential of constant rank r on U, local C^k coordinates at each point of U put f in projection form; each nonempty fibre in that neighbourhood is a C^k submanifold of dimension m−r. The statement for maps of finite-dimensional real manifolds follows in charts. Apply to the real-analytic Betti map on its smooth maximal-rank locus, where m=2 dim X."

## Verified sound

- Elaboration: `Suggested.lean` elaborates at the pins as submitted (probe copy, exit 0): 25 `declaration uses 'sorry'` warnings and no other diagnostic. Imports: the single line `import Mathlib`; no `TauCeti.*` module is imported or needed.
- Declarations read: 39 (3 `def`, 2 `abbrev`, 27 `theorem`, 7 `example`); all 7 examples are proved; at most two examples per definition; no `lemma`, `set_option`, `#eval`, `True` placeholder or `def := sorry`; every Lean name occurs in the README (32 named declarations checked by grep). Policy greps on the README find no pull-request numbers, process words, LaTeX delimiters or `set_option`.
- Triviality probe: of the 25 sorried theorems, the two in F02 close in one tactic. `degreeCompletion_nonzero_degree_zero` closes in three tactics (`rintro rfl`, `congrArg (PiTensorProduct.isEmptyEquiv (Fin 0))`, `simp`), not one, so it is not raised; `tensorSymmetricPower_nonfixed`, `torusAnnihilator_top`, `torusAnnihilator_orderTwo` did not close by `simp` with the definitions unfolded; the remaining 18 were not attempted (they need real arguments).
- Truth of the Lean statements as typed, with degenerate instances: `tensorSymmetricPower` (n = 0, 1 give ⊤; swap of e₀⊗e₁), `degreeCompletion`, `torusCharacter`/`torusAnnihilator` (annihilators ℤⁿ, 0, 2ℤ), `closedTorusSubgroup_characters` (Pontryagin duality; closedness is explicit), `countableClosedTorusSubgroups` (n = 0), `invarianceOfDomain` (m = 0), `titsFreeSubgroup` (n = 0 vacuous; characteristic zero needs no finite generation), `freeMatrixWordGrowth` (positive words give 1, 2, 4 elements; C = 1/2, T₀ = 1), `compactLatticeImageLimit` (⊆ by closedness of compact images and antitonicity, ⊇ by compactness of ℤ_ℓ^d; d = 0), `compactLatticeImageLimit_powers`, `monicCoefficientLift` (zero ring, unit ideal), `fixedResultantCongruence` (fixed Sylvester sizes), `shiftedFactorSlope` (v Res(R,ψ_n) = n·deg R exactly since ψ_n(α) = π^n(1+π^n u); Res(S,ψ_n) stabilises at v Res(S,R); e = 0, S = 1, inseparable R), `resultantRecognition`/`padicResultantRecognition` (slope comparison factor by factor; tests eventually common-nonzero; P = 1 versus X), `weilGeneratorDiscriminantBound` (index-square relation, d = 1 vacuous but true), `orderedRootProductBound` (D equals ∏|disc R_k|^{e_k²}∏|Res(R_k,R_l)|^{2e_ke_l}, a positive integer; m = 0, 1; q = 1), `rationalOrbitCount` (fibres of Γ\G/Stab → Γ\G/aK₀a⁻¹ have size ≤ D; D = 0 forces X empty), `powerSumReconstruction` (Newton for the upper half, reciprocity for the lower; g = 0; q = 0), `weilPolynomialCount` ((4g q^{j/2}+1) ≤ (4g+1)q^{j/2}; q = 2, g = 1).
- Targets read: all 114 target blocks of P0–P4, B0–B4, F0–F6, with their API, Checks and Needs. Conventions recomputed: Betti form i∂∂̄(2(Im w)ᵗY⁻¹(Im w)) = 2Σ d_j da_j∧db_j for type D (g = 1 gives 2 da∧db); descending-coefficient reciprocity a_{2g−i} = q^{g−i}a_i; Honda–Tate invariant f_v ord_v(π)/a = [K:ℚ_p] ord_v(π)/ord_v(p^a); block-algebra K-dimension a² and commutant dimension Σ d_i e_i²; Δ_ℓ summed over ℓ gives D_* (disc/resultant factorisation), hence D_*² orbits and index ≤ D_* and the D_*³h bound; (2√p)^{3m(m−1)}; the p = 2 exception y²+xy = x³+x²+1 (#E(𝔽₂) = 2, #E(𝔽₄) = 8) and the odd-p p-group test including p = 3, a = 3; LT Lemma 2.1 constant corrected to (4g+1)^g; Σ_{j≤g} log((j−1)!) = ½g² log g + O(g²); ℚ(i) rank-one mass 1/4 versus count 1; 17 + 1/4 = 69/4; isogeny-class exponent (log q)g²/4 + O(g log g); class sets by reduced norm (strong approximation for d ≥ 2, d = 1 separate); Gao–Betti Definition 1.6 inequality dim⟨Y⟩_sg − dim π(Y) < dim Y + t. 18 Checks recomputed; the five declared gaps are treated as contracts.
- Locators verified against the cached legal copies: 49 locator groups across 13 sources — Tate (Hyp, Proposition 1 pp.136–137, Theorem 1(c) p.139), LT (Lemma 2.1/Corollary 2.2 p.5, Remark 3.2 p.11, (15) p.11, (20)–(21) p.14, (28) p.16, Proposition 4.11/Example 4.13 p.20, Proposition 4.16 p.22, Proposition 4.17 p.23, (39) p.27, (51) p.30, Lemma 5.11 p.33, (56) p.33, Lemma 5.19 p.36), DPH (Theorem 1.3 with c₄ = e^{−3/2}, c₅ = 2+√2), Lee (Theorem 1.1, (5)–(10) pp.4–5, (11) p.6), GH (Proposition 1.3, Theorem 5.1 p.18, Ax-type and Lemma 5.2 pp.19–20, Proposition 5.3 pp.21–22, §5.2 p.22, Proposition 5.4 pp.22–24, Lemmas 5.5–5.8 pp.25–26, invariance of domain p.29, Lemma 6.2 p.31), Waterhouse (Chapter 2 p.526, Theorem 6.1 pp.550–551; Porism 4.3 is F03), DGH (Lemmas 2.3/2.4/2.6, Corollary 2.5, Proposition 2.7, Theorem 6.2 p.26 with g ≥ 2, M ≥ 3g−2), Gao–Betti (Theorem 1.1 p.2, Definitions 1.5–1.6 pp.4–5, Theorem 7.1 p.16, Theorem 10.1 p.26 with hypothesis (c) and the t-parametrised (i)–(ii)), Conrad (Lemma 2.3 p.6, Theorem 2.6 p.8), Kings ((2.2.2) p.10), Roby (Chapter III §5 p.252, Proposition III.1 p.255, Proposition IV.5 p.273), GGK (Proposition 5.2 printed p.212). All agree with the README except F03.
- Supplier citations checked at the suppliers' current heads (45): AbelianSchemesAndArithmeticModuli (A2.2, A3.9, A4.1–A4.3, A5, A6.1 and the 13 cited declaration names), GeometryOfNumbersAndQuadraticArithmetic (§2.5, §3.3), FiniteFlatGroupsAndIntegralPadicHodgeTheory at its moved head 7782ded (R07.1.2 `etaleGroupEquivContAction`, R07.2.10 `dieudonnePDivisible`, R07.2.19 `exists_padic_charpoly`), JacobianChallengePartII (§2.6 `CurveDifference`, §§5.3–5.4, §7.2 `levelFaltingsZhang`), ComplexComparisonPartII (C0, C1.1 `localDolbeault`, C5), DeligneWeightsAndPurity (0.1–0.3, 1.4, 1.5 with the point-count identity for all m ≥ 1), PELModuli (M3.5, M3.6, M5, M6 incl. M6.11), ShimuraVarieties (P.1, 3.5a–3.5d, 3.5b.1), AdelicAlgebraicGroups (Layers 1, 3, 4 with the cited anchors); on main: ClassFieldTheory Layers 5/10/13, SemisimpleAlgebras Layers 4/5, Completed/EffectiveBounds Layer 1, Chebotarev Layer 14, AlgebraicVectorBundles L0B/L2B, SchemeAndStackFoundations Layers 2/4, DifferentialGeometry Layers 0/1, Completed/HodgeStructures L0–L3, ImaginaryQuadraticClassNumber H3.6. Every `### From TauCetiRoadmap.X` supplier is above the package in `merge-order/ORDER.txt` (ComplexComparisonPartII 35, AbelianSchemesAndArithmeticModuli 36, FiniteFlat 41, JacobianChallengePartII 44, GeometryOfNumbers 60, ShimuraVarieties 81, PELModuli 89; package at 90 on the PR branch). The two completed suppliers are headed `Completed/…`, not `TauCetiRoadmap.…`. All five gap slugs occur in both the README contracts and `design/plan.json` with named suppliers, each consumed by a target.
- Pinned libraries: the six cited TauCeti files exist at a91d3aaf and the eight cited names (`oneEquiv`, `splitAt`, `resultant_deriv`, `discr_eq_prod_roots_sub_sq`, `discr_mul`, `discr_powerBasis_eq_minpoly_discr`, `symmetricTensors`, `IsIsogeny`) are found; `Polynomial.discr`, `Polynomial.resultant` (optional degree arguments), `IsDiscreteValuationRing.addVal : AddValuation O ℕ∞`, `PadicInt.valuation : ℕ` checked by `#check` at the pin.
- Dependency gate (run against the main merge order, as the brief prescribes):

```text
NOT IN ORDER: AbelianSchemesAndArithmeticModuliPartII (insert it after its last supplier)
depcheck: 8 roadmaps, 56 edges, 1 problem(s)
```

  No UPWARD or CYCLE line; "not in order" is the imported package's expected state before intake (the PR branch inserts it at line 90, which pass a already reports as S06).
- Earlier findings not re-raised: round-1 pass a F01–F18 and pass b F01–F23 are repaired at this head or settled as declared gaps (F08–F11 of pass a; b F01, F02, F04, F18), as the fix report records; round-2 pass a S01 (hyperbolic growth inputs), S02 (algebraic Ax-type bridge), S03 (uniform Manin–Mumford/Lang–Néron), S04 (completion Checks accept the direct sum), S05 (restating Checks), S06 (ORDER.txt in the diff) are independent of this pass and are not repeated. F03 above corrects a repair that followed round-1 pass b F23's wrong page arithmetic.

## Not verifiable

- Tits, Theorem 3: recorded `uncertified` (paywalled); the attribution of both the characteristic-zero theorem and the Zariski-dense corollary to "Theorem 3" was not checked.
- Deligne printed pages 42, 45, 51 for Corollary 4.1.2, Theorem 4.2.6, Rappel 4.4.3: the extraction's page offset to the printed PMIHES pagination was not established in this pass (the items were located by number only).
- Milne (1968) and WM (1971) are OCR of image-only scans; their §1 and Part I/II locators were not re-read beyond headings in this pass.
- The five declared supplier gaps are contracts; their future proofs, the KS formal-functions and derived-completion comparisons, and the full proofs of the cited sources are not certified here.
- Mathematical truth of the 18 untested sorried theorems was checked by hand on degenerate instances, not by proof.
