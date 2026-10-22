<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/167#issuecomment-6335588483 -->
Red team round 1 pass b (claude) of 5c85222

Verdict: needs_changes

1. **F01** (P1) The Siegel period-domain canonical range is attributed to a supplier section that does not state it

   **Location:** `packages/OverconvergentAutomorphicForms/README.md:984`: “A quantitative canonical/anticanonical interpretation additionally requires the actual T3 comparison, including p>2g and its range c_g+n−1<w≤n, c_g=(2g−1)p/(2g(p−1))”; also `README.md:1118`: “A canonical-domain interpretation needs the separate quantitative canonical-subgroup comparison.”

   **Claim:** The statement that the pseudocanonical level-n subgroup of a w-ordinary point of the Siegel period domain is the canonical subgroup, for p>2g and (2g−1)p/(2g(p−1))+n−1<w≤n, is written as supplied by HodgeTateAndCanonicalSubgroups Layer 3. That layer proves canonical subgroups with Hasse-height bounds only; it has no statement about period coordinates within p^(−w) of ℤ_p, no p>2g hypothesis and no constant (2g−1)p/(2g(p−1)). The prerequisite is unowned.

   **Witness:** TauCetiRoadmap/HodgeTateAndCanonicalSubgroups/README.md at its open head: Layer 3 is lines 1143–1369 with subsections 3.1–3.12 (Hasse valuation, lifting, weak/strong canonical subgroups, Hilbert O_F-structure); its only quantitative ranges are Hasse bounds, line 1306: “The strict bounds are `w<1/(2p^{n−1})` for `p≥5`, `w<1/3^n` for `p=3`”. Layer 4 (lines 1370–1529) is the Hilbert period estimate of BHW Proposition 5.18 (§4.6, line 1482). The actual statement is drw line 2101–2103 (Proposition 3.6.12, pp.46–47 of the arXiv v3 extraction) and line 2112 (Corollary 3.6.13), with p>2g assumed at line 2093.

   **Exact repair text:** Replace the sentence at line 984 by: “A quantitative canonical/anticanonical interpretation additionally requires `siegelPeriodDomain_canonicalRange`, a target of this layer: for p>2g, a w-ordinary semiabelian scheme over O_C of dimension g with constant toric rank, and (2g−1)p/(2g(p−1))+n−1<w≤n, the pseudocanonical level-n subgroup is the canonical subgroup of level n and the Hodge height is less than 1/(2p^(n−1)); hence X_w maps into the canonical locus in that range (DRW Proposition 3.6.12 and Corollary 3.6.13, pp.46–47). Its proof uses HodgeTateAndCanonicalSubgroups §3.6–§3.8 for the canonical subgroup of a point of bounded Hasse height.” Replace “supplier §§1.30,3.4 and T3's quantitative Siegel comparison” at the end of the paragraph by “supplier §§1.30, 3.4; HodgeTateAndCanonicalSubgroups §§3.6–3.8”. At line 1118 replace “needs the separate quantitative canonical-subgroup comparison” by “needs `siegelPeriodDomain_canonicalRange` of §8.2”.

2. **F02** (P3) Seven sorried targets close from the pinned Mathlib in one tactic (six) or two (one)

   **Location:** `packages/OverconvergentAutomorphicForms/Suggested.lean:44`, `:142`, `:189`, `:216`, `:250`, `:264`, `:269` (`finrank_Op`, `weightMap_mk_apply`, `right_cocycle_of_left`, `wild_factor_conjugation`, `antidiagonal_dual_factor`, `determinantLineMap_injective`, `atkin_lehner_chart`).

   **Claim:** These are stated as targets but are immediate from the pinned API; the probe copy with the proofs below elaborates with exit 0 and only the remaining seven `sorry` warnings (lines 40, 52, 62, 70, 80, 150, 156).

   **Witness:** `Module.finrank_baseChange` (Mathlib/LinearAlgebra/Dimension/Constructions.lean:376), `NumberField.RingOfIntegers.rank` (Mathlib/NumberTheory/NumberField/Basic.lean:415), `Matrix.fromCols_mul_fromBlocks` (Mathlib/Data/Matrix/ColumnRowPartitioned.lean:253); the other four are `simp`/`rw` from the definitions.

   **Exact repair text:** Replace the respective `sorry` bodies by:
   ```lean
   theorem finrank_Op : Module.finrank ℤ_[p] (Op F p) = Module.finrank ℚ F := by
     rw [Module.finrank_baseChange, RingOfIntegers.rank]
   ```
   ```lean
       weightMap F p R (ArithWeight.mk F p R w t) x =
         w x ^ 2 * (t (normUnits F p x))⁻¹ := by
     exact congrArg₂ (· * ·) (map_pow w x 2) (map_inv t _)
   ```
   ```lean
       (K (γ * δ)⁻¹ x)⁻¹ = (K γ⁻¹ x)⁻¹ * (K δ⁻¹ (γ⁻¹ • x))⁻¹ := by
     rw [mul_inv_rev, hK, mul_inv_rev]
   ```
   ```lean
         lowerFactor γ z := by
     simp [lowerFactor, Matrix.mul_apply, Fin.sum_univ_succ, mul_assoc]
   ```
   ```lean
         W * A.transpose * W + (W * C.transpose * W) * Z := by
     conv_rhs => rw [← hZ]
     simp [antidiagonalDualFactor, Matrix.transpose_add, Matrix.transpose_mul, Matrix.mul_add,
       Matrix.add_mul, Matrix.mul_assoc, ← Matrix.mul_assoc W W, hW]
   ```
   ```lean
       (χ : Rˣ →* Sˣ) : Function.Injective (determinantLineMap (n := n) χ) :=
     fun a b h => by simpa [determinantLineMap] using congrFun h 1
   ```
   ```lean
       Matrix.fromCols (-(q • Z)) (1 : Matrix n n R) := by
     simp [Matrix.fromCols_mul_fromBlocks]
   ```
   Keep the seven remaining `sorry` targets (`compactSpace_Op`, `norm_tmul_one`, `continuous_normUnits`, `normUnits_unitsToOp`, `open_finiteIndex_principalUnits`, `congruence_unit_norm_one`, `weightMap_mk_congruenceUnit`); none of them closed by `inferInstance`, `fun_prop`, `continuity` or `simp` with the definitions.

3. **F03** (P3) A kept definition and its four proved examples depend on `sorryAx`

   **Location:** `packages/OverconvergentAutomorphicForms/Suggested.lean:134–135`: “continuous_toFun := (continuous_id.pow 2).prodMk (continuous_normUnits F p).inv”; consumers at `:138`, `:142`, `:164`, `:170`, `:175`, `:179`; `README.md:132`: “Both are proved tests in `Suggested.lean`.”

   **Claim:** `weightDualMap` is a real-bodied `ContinuousMonoidHom` whose continuity field is discharged by the sorried theorem `continuous_normUnits`. Hence `weightDualMap`, `weightMap`, `weightMap_mk_apply` and the examples at lines 164–180 all depend on `sorryAx`: the convention tests the README advertises as proved are admitted through the definition.

   **Witness:** In a probe copy, `#print axioms HilbertWeight.weightDualMap` and `#print axioms HilbertWeight.weightMap_mk_apply` both list `sorryAx`.

   **Exact repair text:** State the convention on the underlying group map and keep continuity as the target. Verified in a probe (sorry-free `#print axioms` for `weightDualMonoidHom` and `weightMapHom_mk_apply`):
   ```lean
   /-- the underlying group map `x ↦ (x², N_p(x)⁻¹)`; continuity is the separate target below. -/
   def weightDualMonoidHom : (Op F p)ˣ →* ((Op F p)ˣ × ℤ_[p]ˣ) where
     toFun := fun x ↦ (x ^ 2, (normUnits F p x)⁻¹)
     map_one' := by simp
     map_mul' := fun x y ↦ by
       ext1 <;> simp only [Prod.fst_mul, Prod.snd_mul, map_mul, mul_inv]
       exact mul_pow x y 2

   /-- The dual map is continuous (follows from `continuous_normUnits`). -/
   theorem continuous_weightDualMonoidHom : Continuous (weightDualMonoidHom F p) :=
     (continuous_id.pow 2).prodMk (continuous_normUnits F p).inv

   /-- the continuous dual map. -/
   def weightDualMap : ContinuousMonoidHom (Op F p)ˣ ((Op F p)ˣ × ℤ_[p]ˣ) :=
     ⟨weightDualMonoidHom F p, continuous_weightDualMonoidHom F p⟩

   /-- pullback of the underlying group map; sorry-free. -/
   def weightMapHom (κ : ArithWeight F p R) : (Op F p)ˣ →* Rˣ :=
     κ.toMonoidHom.comp (weightDualMonoidHom F p)

   /-- pullback along the continuous group map. -/
   def weightMap (κ : ArithWeight F p R) : GeomWeight F p R := κ.comp (weightDualMap F p)

   /-- The geometric weight is the square character times the inverse norm character. -/
   theorem weightMapHom_mk_apply (w : GeomWeight F p R) (t : ContinuousMonoidHom ℤ_[p]ˣ Rˣ)
       (x : (Op F p)ˣ) :
       weightMapHom F p R (ArithWeight.mk F p R w t) x = w x ^ 2 * (t (normUnits F p x))⁻¹ :=
     congrArg₂ (· * ·) (map_pow w x 2) (map_inv t _)

   theorem weightMap_apply (κ : ArithWeight F p R) (x : (Op F p)ˣ) :
       weightMap F p R κ x = weightMapHom F p R κ x := rfl

   example (t : ContinuousMonoidHom ℤ_[p]ˣ Rˣ) (x : (Op F p)ˣ) :
       weightMapHom F p R (ArithWeight.mk F p R 1 t) x = (t (normUnits F p x))⁻¹ := by
     rw [weightMapHom_mk_apply]; simp

   example (w : GeomWeight F p R) (x : (Op F p)ˣ) :
       weightMapHom F p R (ArithWeight.mk F p R w 1) x = w x ^ 2 := by
     rw [weightMapHom_mk_apply]; simp

   example : weightDualMonoidHom F p 1 = (1, 1) := map_one _
   ```
   Add `weightDualMonoidHom`, `weightMapHom`, `weightMapHom_mk_apply` and `weightMap_apply` to README §0.2, and change line 132 to “Both are proved tests of `weightMapHom` in `Suggested.lean`.”

4. **F04** (P3) The direct-limit supplier names do not exist at the pin

   **Location:** `packages/OverconvergentAutomorphicForms/README.md:46`: “For scalar direct limits and completion use `DirectLimit.Ring.of`, `DirectLimit.Ring.lift` and `AdicCompletion`”.

   **Claim:** The pinned declarations are `Ring.DirectLimit.of` and `Ring.DirectLimit.lift`; the cited names are transposed and resolve to nothing.

   **Witness:** Mathlib/Algebra/Colimit/Ring.lean:41 `namespace Ring`, :63 `namespace DirectLimit`, :66 `nonrec def of`, :131 `def lift`. `AdicCompletion` exists (Mathlib/RingTheory/AdicCompletion/Basic.lean:171).

   **Exact repair text:** “For scalar direct limits and completion use `Ring.DirectLimit.of`, `Ring.DirectLimit.lift` and `AdicCompletion`, with topology and sheaf comparison proved separately.”

5. **F05** (P3) Two further statable `lowerFactor` and constructor Checks have no Lean mirror

   **Location:** `packages/OverconvergentAutomorphicForms/README.md:801`: “The identity and every upper unipotent have `lowerFactor` equal to 1”; `:802`: “A lower unipotent [1,0;c,1] gives 1+cz”; `:118`: “`ArithWeight.mk` of two trivial characters is trivial.”

   **Claim:** These Checks are provable on the existing carriers and are not among the mirrors listed in pass a's F12; `lowerFactor` currently has one diagonal example and one numerical example.

   **Witness:** The examples below elaborate in a probe copy.

   **Exact repair text:** Combine with the existing diagonal example so that `lowerFactor` keeps at most two examples:
   ```lean
   /-- Diagonal, upper-unipotent and lower-unipotent denominators. -/
   example (a d b c z : R) :
       lowerFactor !![a, 0; 0, d] z = d ∧ lowerFactor !![1, b; 0, 1] z = 1 ∧
         lowerFactor !![1, 0; c, 1] z = c * z + 1 := by
     simp [lowerFactor]
   ```
   and under `section Weights`:
   ```lean
   example : ArithWeight.mk F p R 1 1 = 1 := by
     ext; simp [ArithWeight.mk]
   ```

## Verified sound

- Read all 1,139 README lines (44 numbered subsections, every Checks bullet) and all 348 lines of `Suggested.lean`: 13 definitions/abbreviations, 5 instances, 14 theorem signatures, 17 examples.
- Elaboration of `Suggested.lean` as submitted in the content checkout's Lake environment: exit 0 with exactly fourteen `declaration uses 'sorry'` warnings (lines 40, 44, 52, 62, 70, 80, 142, 150, 156, 189, 216, 250, 264, 269); no other diagnostic. Single `import Mathlib`; no `TauCeti.*` import.
- Truth of the 14 Lean statements at the stated generality (instances tried: F=ℚ, ramified and split quadratic F, p=2, r=0, N=4, η=−1 and mixed-sign norm-one units, the zero ring for the matrix layers, empty index, noncommuting 2×2 blocks, W=0): all sound; `congruence_unit_norm_one` holds already for N≥3 (N≥4 is the standing level convention, not a defect). Every Lean name appears in the README; the README's generality matches the Lean binders (the topology on `Op` is the module topology, not arbitrary).
- Policy: no `lemma`, `set_option`, `#eval`, `True` placeholder, LaTeX delimiter, pull-request number or process word in README or Lean; title capitalisation correct; at most two examples per kept definition; the name catalogue at Lean 318–346 is pass a's F08 and is not re-raised.
- Locators verified against the cached legal copies (99 statements across 13 works): BHW 22 (Definitions 5.17, 6.1, 6.4, 6.5, 7.9, 9.1, 9.4, 9.8, 9.11, 10.2, 10.4; Propositions 5.18, 6.6, 10.8; Remark 6.7; Theorems 7.14, 9.12; Lemmas 9.2, 9.3, 9.5, 10.1, 10.3; journal page = extraction page + 1707, all within the cited ranges); AIP-adic 12 (Lemma 2.4, Propositions 2.8, 4.1, 4.3, 4.7, 4.8, 8.4, Lemma 4.4, Theorems 6.7, 8.2, Corollary 8.3, §6.4); AIP-cusp 10 (Proposition 3.14, Remark 3.15, Theorem 3.17, Corollary 3.20, Proposition 3.22, Proposition 6.2, Lemma 6.3, Proposition 6.4, Theorem 4.4, Lemma 4.5; the result-kind and page slips are pass a's F11); BP 16 (§4.4.38, Theorem 4.4.40, Propositions 4.6.9, 4.6.12, 4.6.14, 4.6.15, §§6.2.4, 6.2.9, 6.2.11, 6.2.20, 6.3.1, Proposition 6.3.3, Corollary 6.3.4, Propositions 6.3.6–6.3.7; the copy is the 180-page version); DRW 10 (§§2.1, 2.3–2.5, 3.4 by the contents list, Definitions 2.5.3, 3.1.10, 3.1.13, 3.1.14, Remarks 3.1.9, 3.1.12, 3.1.15, 3.6.2, equation (5) p.20, Proposition 3.6.12); Heuer 2; Emerton-analytic 17 (Definitions 1.2.6, 1.2.8, 1.2.10, 3.5.3, 6.1.1, 6.4.2, 6.4.9; Theorem 1.2.11; Corollary 5.3.19; Propositions 5.3.22, 6.2.4, 6.4.1, 6.4.5, 6.4.6, 6.4.7, 6.4.10; Theorem 6.1.20); Emerton-Jacquet 3 (Propositions 3.2.4, 4.3.4, Theorem 4.2.32; journal page = extraction page + 774 from the printed running heads); Breuil–Ding Lemma 6.1 (p.83); Chenevier Proposition 6.4 and Lemme 6.5 (pp.20–21, arXiv v1); Ding preprint §4.2.2 and Proposition 4.14 (equidimensional of dimension n·d_K); BHS Proposition 3.11, Proposition 5.3 and Lemma 3.8 in the legal author/IHÉS copies (edition caveat below).
- Statement content checked against the sources: BHW's κ=w²·(t⁻¹∘N) (bhw line 1850) agrees with `weightDualMap`; the four multipliers of Definition 9.1 (bhw lines 2767–2785) agree with the §4.1 table; Lemma 9.2's cancellation (bhw line 2801) agrees with `arithmeticMultiplier_central`; Lemma 10.3's conjugation j(γ)=[a,ϖb;ϖ⁻¹c,d] and u_p^*z=ϖz (bhw lines 3121–3126) agree with `wild_factor_conjugation`; BHW Proposition 5.18 (bhw line 1640) states closed bounds for every p while the supplier §4.6 states strict bounds for odd p, and the README treats the odd-p endpoint as the named target `hilbertPeriod_endpointExtension`, consistently; AIP-adic's ε_char=1 (odd p), 3 (p=2) (aip-adic line 396), H as a quotient of (O_F/p²)^× with the χ⁻¹ eigensheaf on IG₂ (aip-adic lines 1224–1236), the §6.1 constraints r≥3, r+k≥n≥k′+2 (k′+4 at p=2), n′=n−k′−2 (n−k′−4) (aip-adic lines 683–684); DRW's Iw⁺ as the preimage of the torus (drw lines 393–394), f(γβ)=κ(β)f(γ) (drw line 1087), (γ·f)(γ′)=f(ᵗγγ′) (drw line 1114), γ^*s=s·(γ_a+zγ_c) (drw line 942); BP's f(mb)=(w₀,Mκ)(b⁻¹)f(m), hf(m)=f(h⁻¹m), tf(m)=f(t⁻¹n̄_m t t_m n_m) (bp lines 6896, 6902–6903), κ_A=−w₀,M wν_A−(w₀,M wρ+ρ) and the D_{κ_A+2ρ_nc} model (bp lines 7099, 7106–7107); Breuil–Ding's C(U_℘,O_E)^{⊕r} local model (breuil-ding lines 3369–3371).
- Checks recomputed (22): rank and norm of scalars in degree two (4 at p=2, 2^d), N(−1)=(−1)^d, H₀=O_p^×, H₂⊆H₁, −1∉H₂ at p=2, weightDualMap(2)·(3)=(36,1/6)=value at 6, κ(2)=2 versus 8 at p=5, exponents (1,0)↦2 and (0,1)↦−1 with product 1, T_pro(x^k)=|pk|_p at odd p, sign character trivial on H₃, c_z=2 for diag(2,1) in GL₂(ℚ₂), index |O_K/ϖ|, dimensions n[K:ℚ_p] (2 and 4) and n([K:ℚ_p]+1) for the ℚ_p-analytic torus character space, ε-ranges at p=3,m=1 (1/12, 1/9, 1/3) and p=2,m=1 (1/8), AL scaling 1/100↔1/20, factors 1/2 and 1/6, full arithmetic multiplier κ(d)⁻¹w(d)=1 at d=2 and t(N(z)) on scalars, Weil-pairing twist 1/2, tame degrees 3/2 at q=2 and 1+1/q at a=l² (|ℙ¹(O/l²)|=q²+q), the 126/3126 conjugation test, p^(−d) normalisation, lim colim Maps(ℤ/p^i,ℤ/p^m)=C(ℤ_p,ℤ_p), the diag(1,4) versus diag(4,1) dual-factor test, diag(2,3)↦6, [1,3]·[0,1;−2,0]=[−6,1], ‖EC‖≤p^(−(w+1)).
- Supplier citations checked (13 roadmaps, 46 sections/declarations): AdicSpacesPartII R0 (R0.3 completed tensor), AdicSpacesPartIII R3, AdicSpacesPartIV R5.5–R5.7 with *affinoid-weight-coefficient-sheaf*, *coefficient-sheaf-local-equalizer*, *coefficient-sheaf-kiehl*; AlgebraicVectorBundles L0A–L0C, L2B; PerfectoidShimuraVarieties §§1.30, 3.4 (`HodgeTate.siegelGraphChart_act`, `hodgeFrame_transform`), 5.4–5.10, 6.1a, 6.3, 6.12–6.15; PerfectoidTowers P9.6–P9.13 with `WeightExtension.structureSheafEqualizer`, `integralStructureSheafEqualizer`, `ProEtaleSite.invariant_subsheaf`, `integral_matrix_coboundary_effectivity`; AutomorphicBundles B0–B5; LocallyAnalyticDistributions Layers 0 and 4; CompletedCohomologyPartII Layers 1–3, §8.5, F.1, F.4; PadicFamilies (Fredholm hypersurface and (Pr) modules); HodgeTateAndCanonicalSubgroups §§2.10, 3.12, 4.6–4.8, 5.1, 5.8, 5.10–5.12 (the T5/T6 drift is pass a's F04). Pinned names: 20 Mathlib declarations of the supplier contract present (including `Module.Finite.base_change`, `Module.Free.tensor`, `IsModuleTopology.continuous_of_linearMap`, `PadicInt.compactSpace`, `NumberField.isUnit_iff_norm`, `Matrix.fromCols`, `Matrix.GeneralLinearGroup.det`, `Algebra.norm_eq_prod_embeddings`, `LinearMap.det_baseChange`) except the pair in F04; TauCeti `NarrowClassGroup` finite instance (TauCeti/NumberTheory/NumberField/NarrowClassGroup/Finite.lean:38) and `TauCeti/Algebra/Lie/HighestWeight/Module.lean` present.
- Merge order: suppliers in `merge-order/ORDER.txt` at AdicSpacesPartII 7, AdicSpacesPartIII 8, AdicSpacesPartIV 11, PerfectoidTowers 13, PhiGammaModulesAndIwasawaCohomology 26, LocallyAnalyticDistributions 59, PadicFamilies 124, CompletedCohomologyPartII 131, AutomorphicBundles 134, HodgeTateAndCanonicalSubgroups 135, PerfectoidShimuraVarieties 136; AlgebraicVectorBundles and PadicMeasuresIwasawaAlgebras are on main; OverconvergentAutomorphicForms is absent from ORDER.txt (imported package, not a defect). The bare `CompletedCohomology` is pass a's F10. Dependency gate output, verbatim:

```text
NOT IN ORDER: OverconvergentAutomorphicForms (insert it after its last supplier)
depcheck: 8 roadmaps, 57 edges, 1 problem(s)
```

No UPWARD or CYCLE line. No declared gaps (no plan.json at this head).

- Not re-raised (pass a, codex, of the same head): F01 general-data central quotient; F02 ramified generator owned by HodgeTate; F03 compact character space owned by PhiGammaModules/LAD and the PadicMeasuresIwasawaAlgebras L0a locator; F04 HodgeTate T5/T6 locators; F05 one-character support Check; F06 unramified twist; F07 missing `determinantLineMap_translation`; F08 name catalogue; F09 affinoid compact type; F10 analytic vectors/admissibility owned by CompletedCohomologyPartII and the bare `CompletedCohomology`; F11 BHW/AIP-cusp result kinds and pages; F12 missing Check mirrors; F13 absent `sources.toml`; F14 three Checks; F15 dyadic Siegel scope; F16 two examples bypassing definitions; F17 rank-one Bruhat Check.

## Not verifiable

- `sources.toml` is absent from the package (pass a's F13), so the cached copies were identified by title and recorded URL rather than by manifest sha256; the works and versions used are the Annales de l'Institut Fourier BHW PDF, the two Pilloni author manuscripts, the 180-page HigherColeman author copy, arXiv 2106.00094v3, arXiv 2012.07918v2, Emerton's 2011 author manuscript, the Numdam Emerton–Jacquet article, the Breuil author copy of Breuil–Ding, arXiv math/0301032v1, and arXiv 2407.21237v2.
- Ding's published pages 66–67: only the arXiv v2 (§4.2.2 p.71, Proposition 4.14 p.72) is cached; the published pagination is uncertified.
- BHS page numbers cited from the Lyon copies: the cached legal copies (Breuil's author page, IHÉS) place Proposition 3.11 on p.26, Proposition 5.3 on p.46 and Lemma 3.8 on p.22; the Lyon editions' pages (23–26, 44–45, 24) could not be checked.
- Emerton–Jacquet journal pages were inferred from the extraction's printed running heads (offset 774), not from a journal-paginated copy.
- The sibling supplier READMEs were read at their open pull-request heads (HodgeTateAndCanonicalSubgroups c024ddc, PerfectoidShimuraVarieties 21b9aa1, AutomorphicBundles 218de51, PerfectoidTowers 537fec2, LocallyAnalyticDistributions 8f2b3da, CompletedCohomologyPartII 1337958, PadicFamilies f9ad8cc, PhiGammaModulesAndIwasawaCohomology 1f879b2); a later push changes line numbers.
- The repair of F03 was elaborated in a reduced probe containing only Layer 0's weight declarations, not spliced into the full file.
- Heavy geometric targets (torsor invariants, integral model comparisons, Igusa coverage, the unitary classicality inputs) were checked for hypotheses and boundary cases only; their proofs are future library work.
