<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/167#issuecomment-6348196117 -->
Red team round 2 pass b (claude) of f996b0f

Verdict: needs_changes

1. **F01** (P3) Two new sorried targets close from the pinned Mathlib in three and four tactics

   **Location:** `packages/OverconvergentAutomorphicForms/Suggested.lean:341`: “theorem determinantLineMap_translation {S : Type*} [CommRing S]” (body `sorry` at line 349); `Suggested.lean:81`: “theorem principalUnits_antitone : Antitone (principalUnits F p) := by” (body `sorry` at line 82).

   **Claim:** Both were added by the fix round and are left admitted, but each is immediate from the pinned API: the translation identity is determinant multiplicativity plus `Matrix.det_transpose`, and antitonicity is `Ideal.Quotient.eq` plus `Ideal.span_singleton_le_span_singleton`. A probe copy with the proofs below elaborates with exit 0 and no diagnostic other than the remaining `sorry` warnings.

   **Witness:** `Matrix.det_transpose`, `Units.ext`, `map_mul` (Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean:93 `def det : GL n R →* Rˣ`); `Ideal.Quotient.eq`, `Ideal.span_singleton_le_span_singleton`, `pow_dvd_pow`.

   **Exact repair text:** Replace the two `sorry` bodies by:
   ```lean
   theorem principalUnits_antitone : Antitone (principalUnits F p) := by
     intro r s hrs x hx
     simp only [principalUnits, MonoidHom.mem_ker, Units.ext_iff, Units.coe_map,
       MonoidHom.coe_ofClass, RingHom.toMonoidHom_eq_coe, Units.val_one] at hx ⊢
     rw [← map_one (Ideal.Quotient.mk _), Ideal.Quotient.eq] at hx ⊢
     exact Ideal.span_singleton_le_span_singleton.mpr (pow_dvd_pow _ hrs) hx
   ```
   ```lean
       determinantLineMap χ a (hT * g) =
         (χ (Matrix.GeneralLinearGroup.det h) : S) * determinantLineMap χ a g := by
     intro hT
     have h1 : Matrix.GeneralLinearGroup.det hT = Matrix.GeneralLinearGroup.det h :=
       Units.ext (Matrix.det_transpose _)
     simp [determinantLineMap, map_mul, h1, mul_left_comm]
   ```

2. **F02** (P3) Four sorried statements are one-step corollaries of other sorried targets in the file

   **Location:** `packages/OverconvergentAutomorphicForms/Suggested.lean:151`: “theorem continuous_weightDualMap : Continuous (weightDualMap F p) := by”; `:159`: “theorem continuous_weightMap (κ : ArithWeight F p R) :”; `:71`: “theorem normUnits_unitsToOp (η : (𝓞 F)ˣ) :”; `:181`: “theorem weightMap_mk_congruenceUnit (N : ℕ) (hN : 4 ≤ N)”.

   **Claim:** Given `continuous_normUnits`, `norm_tmul_one` and `congruence_unit_norm_one`, each of these closes in one term or two tactics, so the file admits four statements whose only content is another admitted target. The genuine Layer-0 targets are `compactSpace_Op`, `norm_tmul_one`, `continuous_normUnits`, `open_finiteIndex_principalUnits` and `congruence_unit_norm_one`; the four corollaries should be proved in place (so the file's `sorry` count records the real targets) or deleted.

   **Witness:** A probe copy with the four proofs below elaborates with exit 0; `normUnits_unitsToOp` is definitionally `norm_tmul_one F p η` (the `exact?` probe on `norm_tmul_one` itself returns only that sibling, no Mathlib closer).

   **Exact repair text:**
   ```lean
   theorem normUnits_unitsToOp (η : (𝓞 F)ˣ) :
       (normUnits F p (unitsToOp F p η) : ℤ_[p]) =
         ((Algebra.norm ℤ (η : 𝓞 F) : ℤ) : ℤ_[p]) :=
     norm_tmul_one F p (η : 𝓞 F)
   ```
   ```lean
   theorem continuous_weightDualMap : Continuous (weightDualMap F p) :=
     (continuous_id.pow 2).prodMk (continuous_normUnits F p).inv
   ```
   ```lean
   theorem continuous_weightMap (κ : ArithWeight F p R) :
       Continuous (weightMap F p R κ) :=
     κ.continuous.comp (continuous_weightDualMap F p)
   ```
   ```lean
       (weightMap F p R (ArithWeight.mk F p R w t) (unitsToOp F p η))⁻¹ *
         w (unitsToOp F p η) ^ 2 = 1 := by
     rw [weightMap_mk_apply, congruence_unit_norm_one F p N hN η hη]
     simp
   ```

3. **F03** (P3) The HodgeTateAndCanonicalSubgroups labels T3–T6, T4 and T5 do not exist at the supplier's head

   **Location:** `packages/OverconvergentAutomorphicForms/README.md:13`: “`HodgeTateAndCanonicalSubgroups`, T3–T6, owns canonical subgroups, the Hilbert period-coordinate estimates”; also `README.md:438` (“supplied by HodgeTateAndCanonicalSubgroups T4”), `:450`, `:482`, `:543`, `:663`, `:665`, `:720`, `:734` (“T4”, “T5”, “T5's”).

   **Claim:** The supplier's README names its layers “Layer 3” … “Layer 6” and its subsections by number; the token “T3”–“T6” occurs nowhere in it. The supplier table at lines 54–56 already cites the real sections (§3.12, §§4.6–4.8, §§5.1, 5.8, 5.10–5.12, §2.10, §§7.29–7.30), so the nine T-labels are invented vocabulary that a reader cannot resolve.

   **Witness:** TauCetiRoadmap/HodgeTateAndCanonicalSubgroups/README.md at its open head c024ddc: line 1143 “## Layer 3: Canonical subgroups with quantitative bounds”, line 1370 “## Layer 4: Canonical/anticanonical geometry and period estimates”, line 1530 “## Layer 5: Igusa trivializations and the modified integral lattice”, line 1794 “## Layer 6: Logarithmic adic sites before period sheaves”; a search for `T3`, `T4`, `T5`, `T6` in that file returns nothing.

   **Exact repair text:** At line 13 replace “T3–T6” by “Layers 3–6”. Replace every “T4” (lines 438, 450, 482) by “§§4.6–4.8”, every “T5” and “T5's” (lines 482, 543, 663, 665, 720, 734) by “Layer 5 (§§5.1, 5.8, 5.10–5.12)” and “Layer 5's” respectively; at line 665 write “In the §5.12 comparison, the analytic character index is m=k+r−1”.

4. **F04** (P3) Six Checks are written on supplier-owned objects under names neither the supplier nor this roadmap declares

   **Location:** `packages/OverconvergentAutomorphicForms/README.md:274`: “For `analyticVectors`, the trivial finite-dimensional representation is unchanged, with its usual topology.”; `:275`, `:276` (“`analyticVectors`”), `:277`–`:279` (“For `admissibleBanachRepresentation`, C(H,E) under the regular action has dual the free rank-one bounded-measure module.”).

   **Claim:** After the round-1 repair, line 268 imports “the supplied analytic orbit vectors and compact-open admissible Banach category” from CompletedCohomologyPartII F.4 and F.1 and this roadmap defines neither object. The six Checks nevertheless test `analyticVectors` and `admissibleBanachRepresentation` as if they were this roadmap's definitions, under backticked names that do not occur in the supplier; the gate reads such a name as a target of this roadmap, which reintroduces the second owner the repair removed.

   **Witness:** TauCetiRoadmap/CompletedCohomologyPartII/README.md at its open head 1337958: line 176 “### F.1 Integral duality and the admissible Banach category”, line 233 “### F.4 Locally analytic vectors and their derived functor”; neither section, nor the file, contains `analyticVectors` or `admissibleBanachRepresentation`. In this package the two names occur only in the six Check bullets.

   **Exact repair text:** Rewrite the six bullets without backticks, as tests of the imported objects applied to this roadmap's comparison targets: “For the supplied locally analytic vectors (CompletedCohomologyPartII F.4), …” in lines 274–276 and “For the supplied admissible Banach category (CompletedCohomologyPartII F.1), …” in lines 277–279; keep the bullet at line 279 as the Check of `admissibleBanach_closedRegularEmbedding` (“A closed H-stable subspace of C(H,E)^a passes `admissibleBanach_closedRegularEmbedding`; an arbitrary algebraic embedding with no closed-image or topology condition does not.”).

5. **F05** (P3) Four locators name the wrong page or a nonexistent result

   **Location:** `packages/OverconvergentAutomorphicForms/README.md:474`: “Sources: BHW Remark 6.7, p.1759”; `:440`: “Source for the endpoint: BHW Proposition 5.18 and its proof, pp.1752–1753.”; `:688`: “Source: the analytic torsor in AIP-adic Proposition 4.2, pp.15–16”; `:527`: “Source: AIP-cusp §3.5 and Theorem 3.16, pp.17–18.”

   **Claim:** Remark 6.7 is entirely on printed page 1758; Proposition 5.18 is stated on p.1751 (its proof runs to p.1753); AIP-adic has no Proposition 4.2 (4.2 is a section heading and “Lemma 4.2” is an integrality lemma), the analytic torsor f_n : F_{n,r,I}→IG_{n,r,I} being introduced in §4.1; AIP-cusp §3.5 begins on p.16.

   **Witness:** bhw line 1919 (Remark 6.7) lies between the page-51 marker (line 1895, printed “1758”) and the page-52 marker (line 1931, printed “1759”); bhw line 1639 (Proposition 5.18) is on extraction page 44 = printed 1751, page 45 starting at line 1667; aip-adic line 679 “4.2 The sheaves of overconvergent forms”, line 685 “Lemma 4.2”, line 671 the torsor f_n; aip-cusp line 649 (§3.5) on page 16, line 715 (Theorem 3.16) on page 18.

   **Exact repair text:** Line 474: “Sources: BHW Remark 6.7, p.1758; …”. Line 440: “Source for the endpoint: BHW Proposition 5.18 and its proof, pp.1751–1753.” Line 688: “Source: the analytic torsor f_n of AIP-adic §4.1, pp.15–16, and the comparison argument of BHW §7.2, pp.1762–1765.” Line 527: “Source: AIP-cusp §3.5 and Theorem 3.16, pp.16–18.”

6. **F06** (P3) The module docstring does not name the headline theorems that are not statable at the pins

   **Location:** `packages/OverconvergentAutomorphicForms/Suggested.lean:4`–`:9`: “This file records light definitions and theorem signatures statable against the pinned APIs and is not exhaustive.”

   **Claim:** The acceptance-test form requires the module docstring to say which headline theorems are not statable at the pins and which carrier each lacks. Since the round-1 deletion of the name catalogue, nothing in the file names them: the roadmap's end theorems (`geometricAip_comparison`, `arithmeticAip_comparison`, `hilbertControllingOperator_completelyContinuous`, `ordinaryIgusa_completionComparison`, `unitaryEigenvariety_reduced`, `bruhatCoefficient_cohomologyComparison`) are absent from the docstring, which only says the file “is not exhaustive”.

   **Witness:** `Suggested.lean:3`–`:10` is the whole docstring; the README's headline targets are at `README.md:718` (`geometricAip_comparison`), `:722` (`arithmeticAip_comparison`), `:866` (`hilbertControllingOperator_completelyContinuous`), `:935` (`ordinaryIgusa_completionComparison`), `:339` (`unitaryEigenvariety_reduced`), `:1105` (`bruhatCoefficient_cohomologyComparison`).

   **Exact repair text:** Replace lines 3–10 by:
   ```lean
   /-!
   # OverconvergentAutomorphicForms: target signatures

   The roadmap is README.md; this file is not the roadmap. It states, against the pinned
   Mathlib, the headline statements that are statable now, with the few light definitions
   they need: the integral tensor algebra and its norm, the inverse-norm weight convention,
   the left-to-right automorphy conversion, the wild denominator normalization, and the
   antidiagonal dual-factor, determinant-line and Atkin–Lehner block conventions.

   Not statable at the pins, and therefore not stated here: `geometricAip_comparison` and
   `arithmeticAip_comparison` (no perfectoid Hilbert tower, Hodge–Tate period map or AIP
   torsor), `hilbertControllingOperator_completelyContinuous` (no cuspidal Banach modules
   of overconvergent Hilbert forms), `ordinaryIgusa_completionComparison` (no ordinary
   Igusa tower or spectral completion), `unitaryEigenvariety_reduced` (no completed
   automorphic functions, locally analytic Jacquet module or eigenvariety), and
   `bruhatCoefficient_cohomologyComparison` (no toroidal tower diamond or Bruhat reduction).
   -/
   ```

7. **F07** (P3) Process narrative: “current” in the supplier contracts

   **Location:** `packages/OverconvergentAutomorphicForms/README.md:48`: “From current Tau Ceti, `NumberField.NarrowClassGroup` and its finite instance supply the polarization-class index.”; `:67`: “These current supplier names distinguish the R0, R3 and R5 owners.”

   **Claim:** “current” dates the text to the moment of writing; the README is to be timeless. The second sentence is also content-free once the names are cited.

   **Witness:** The house-style list of process words includes “current”; both sentences read differently once a supplier is renamed.

   **Exact repair text:** Line 48: “From Tau Ceti, `NumberField.NarrowClassGroup` and its finite instance supply the polarization-class index.” Line 67: delete the sentence “These current supplier names distinguish the R0, R3 and R5 owners.”

## Verified sound

- Read all 1,150 README lines (44 numbered subsections, every Checks bullet) and all 423 lines of `Suggested.lean`: 15 definitions/abbreviations, 5 instances, 18 theorem signatures (11 admitted, 7 proved), 20 proved examples.
- Elaboration of `Suggested.lean` as submitted in the content checkout's Lake environment: exit 0 with exactly eleven `declaration uses 'sorry'` warnings (lines 40, 52, 63, 71, 81, 85, 151, 159, 175, 181, 341) and no other diagnostic. Single `import Mathlib`; no `TauCeti.*` import.
- `#check @name` for all 33 named declarations in a probe copy: every elaborated type carries the binders its README statement needs (`[NumberField F]` and `[Fact p.Prime]` on all admitted arithmetic and continuity statements; `[Fintype n] [DecidableEq n] [CommRing R]` on the matrix theorems; the action and left-cocycle hypotheses on `right_cocycle_of_left`; `weightMap_mk_apply` correctly without `NumberField`). `#print axioms` on `weightDualMap`, `weightMap_mk_apply`, `determinantLineMap_injective`, `wild_factor_conjugation`: no `sorryAx` (the round-1 F03 defect is gone).
- One-tactic probes on the eleven admitted statements: `compactSpace_Op` (no instance found by `infer_instance`), `norm_tmul_one` (`exact?` finds no Mathlib closer; there is no norm base-change lemma under `Mathlib/RingTheory/Norm`), `continuous_normUnits`, `open_finiteIndex_principalUnits`, `congruence_unit_norm_one` remain genuine targets; the other six are F01 and F02.
- Truth of the 18 Lean statements and of the new README targets at the stated generality (instances: F=ℚ, split and ramified quadratic F, p=2 and p=5, r=0, N=4, η=−1 and mixed-sign norm-one units, the zero ring, empty index, W=0, noncommuting 2×2 blocks, q=0): all sound. `determinantLineMap_translation` is true as typed (det(hᵀg)=det h·det g, χ multiplicative, S commutative).
- Round-1 repairs verified on this head. Pass a (codex): F01 Gʳ quotient throughout §§8.6–8.7 with the cubic norm-one torus Check (lines 1070–1080); F02 `hilbertPeriod_unsplitRamifiedGenerator` deleted, §3.12/§§4.6–4.8 imported (lines 13, 54, 440); F03 compact weight geometry imported from PhiGammaModulesAndIwasawaCohomology §4.0 via LocallyAnalyticDistributions §3.3, PadicMeasuresIwasawaAlgebras §3a.1 (lines 16, 106) — the cited sections exist (PhiGamma line 1247, LAD lines 1228 and 2542, PMIA line 2213); F04 §§5.8, 5.10–5.12, §2.10, §§7.29–7.30 all exist at HodgeTate c024ddc (lines 1030, 1687, 1725, 1742, 1759, 3209, 3239) and the five declaration names occur there as `TauCeti.HodgeTate.*` (lines 1504, 1518, 1727, 1744, 1761); F05 (line 294); F06 (lines 339, 357, 367); F07 `determinantLineMap_translation` present (line 341); F08 catalogue deleted; F09 (lines 188, 197); F10 (lines 17, 268; residue is F04 above); F11 result kinds corrected (all AIP-cusp and BHW locators below); F12 examples present (lines 91, 101, 189, 197, 206, 213, 218, 286, 365, 372, 383); F13 `sources.toml` with 13 keyed works, every `sha256` and `alternate_sha256` resolving to a cached extraction; F14 (lines 208, 362, 909); F15 all primes with the dyadic Check and proved example (lines 988, 1002, Lean 286–291); F16 `rightCocycleOfLeft`, `atkinLehnerBlock` with three Checks each and proved tests through them; F17 (line 1121). Pass b (claude): F01 `siegelPeriodDomain_canonicalRange` stated at line 988 with the DRW hypotheses (drw lines 2101–2103, p>2g at line 2093, consequence at line 2112) and three boundary Checks recomputed (c_g=3/4 at g=1, p=3: 7/8 admitted, 3/4 excluded; n=2: 15/8 admitted; p=2, g=1: no instance); F02 all seven proofs present (lines 44, 167, 233, 278, 320, 336, 356); F03 `weightDualMap`/`weightMap` are sorry-free monoid homomorphisms; F04 `Ring.DirectLimit.of`/`lift` (line 46); F05 examples at lines 213 and 286.
- Checks recomputed (24): quadratic scalar norm 4 at p=2, N(−1)=(−1)^d, H₁=ℤ₂^× and −1∉H₂, weightDualMap(−1)=(1,(−1)^d), (2,3)↦3 for `ArithWeight.mk 1 t`, κ(2)=2 versus 8, (4,1/2)·(9,1/3)=(36,1/6), T_principal(x^k)=|pk|_p and 0 at k=0, tensor rank 6, dual value 1/2, pole radius p^(−(r−1/2)), c_z=2 for diag(2,1) over ℚ₂, dimensions 2 and 4, AB=[2,1;1,1]≠BA=[1,1;1,2] with B⁻¹A⁻¹=[1,−1;−1,2] and A⁻¹B⁻¹=[2,−1;−1,1], scalar 2 versus 1/2, 1/12 < 1/9 < 1/3 and 1/8 at p=2, 1/100↔1/20, factors 1/2 and 1/6, κ(d)⁻¹w(d)=1 at d=2, tame degrees 3/2 and 1+1/q (|ℙ¹(O/l²)|=q²+q), 126 versus 3126, J=1+2Z=3 at Z=1, diag(1,4) versus diag(4,1) with WZᵀW=Z, det[1,7;0,1]=1, [1,3]·[0,1;−2,0]=[−6,1], empty-index determinant 1.
- Locators verified against the cached legal copies, by manifest sha256 (103 statements across 13 works): BHW 24 (Definitions 5.17, 6.1, 6.2, 6.5, 6.8, 7.9, 9.1, 9.4, 9.8, 9.10, 9.11, 10.2, 10.4; Propositions 5.18, 6.6, 10.8; Remark 6.7; Theorems 7.14, 9.12; Lemmas 9.2, 9.3, 9.7, 10.1, 10.3; printed page = extraction page + 1707, read from the running heads at lines 1896 and 1932); AIP-cusp 19 (Proposition 3.14, Remark 3.15, Theorems 3.16, 3.17, 4.4, Corollaries 3.20, 3.24, 3.26, Lemmas 3.21, 3.25, 3.27, 4.5, 6.3, Propositions 3.22, 3.23, 6.2, 6.4, §§3.5, 4.1); AIP-adic 13 (Lemmas 2.4, 4.4, Propositions 2.8, 4.1, 4.3, 4.7, 4.8, 8.4, Theorems 6.7, 8.2, Corollary 8.3, §§8.3, 8.4); DRW 7 (Definitions 2.5.3, 3.1.10, 3.1.14, Remarks 3.1.15, 3.6.2, Proposition 3.6.12, Corollary 3.6.13, pp.19–47 of the 108-page arXiv v3 extraction); Ding 2 (§4.2.2 p.66, Proposition 4.14 p.67 of the published copy, now certified); Breuil–Ding Lemma 6.1 p.81; BHS *Une interprétation modulaire* 6 (Lemme 3.10 p.24, Proposition 3.11 and Corollaire 3.12 p.26, Théorème 3.19 p.31, Corollaire 3.20 p.33, Proposition 5.3 p.46 of the 53-page author copy); BHS *Smoothness* Lemma 3.8 p.22; Chenevier Proposition 6.4 p.20, Lemme 6.5 p.21; BP 9 (Theorem 4.4.40 p.80, Propositions 4.6.9 p.93, 4.6.15 p.95, §6.2.4 p.149, §6.2.20 p.152, §6.3.1, Proposition 6.3.3, Corollary 6.3.4 p.154, Proposition 6.3.7 p.155; 181 pages); Heuer 3 (Corollary 1.5 p.3, Definition 3.7 and Proposition 3.8 p.15); Emerton-analytic 9 (Definitions 1.2.6, 3.5.3, 6.1.1, Theorems 1.2.11, 6.1.20, Corollary 5.3.19, Propositions 5.3.22, 6.2.4, 6.4.10 on pp.23–129); Emerton–Jacquet 7 (Definitions 3.2.1, 3.4.1, Propositions 3.2.4, 3.4.6, 4.3.4, 4.3.6, Theorem 4.2.32 on printed pp.796–834 from the running heads). The four slips are F05.
- Supplier citations checked (13 roadmaps, 70 sections and 14 declaration names): HodgeTateAndCanonicalSubgroups at c024ddc (§§2.10, 3.6–3.8, 3.12, 4.6–4.8, 5.1, 5.8, 5.10–5.12, 7.29–7.30; five names); PerfectoidShimuraVarieties at 21b9aa1 (§§1.30, 3.4, 5.4–5.10, 6.1, 6.1a, 6.2, 6.3, 6.12–6.15; `siegelGraphChart_act`, `hodgeFrame_transform` at its line 1273; `G^r` and the ℚ(∛2) torus at lines 11, 1927–1939); PerfectoidTowers at 537fec2 (P9.6–P9.13; the four named declarations at lines 442, 3164, 3165, 3273, 3282); AutomorphicBundles at 218de51 (Layers B0–B5); LocallyAnalyticDistributions at 3a4526a (Layers 0, 4, §§3.3, 4.15); PhiGammaModulesAndIwasawaCohomology at 1f879b2 (§4.0); CompletedCohomologyPartII at 1337958 (F.1, F.4, Layers 1–3, §8.5); PadicFamilies at 97889a4 (Layer 4 (Pr)/Fredholm inputs, §2a.1); AdicSpacesPartII R0.3, AdicSpacesPartIII R3, AdicSpacesPartIV R5.5–R5.7 with the three italic contract names, AlgebraicVectorBundles L0A–L0C, L2B and PadicMeasuresIwasawaAlgebras §3a.1 on main. Pinned names re-checked at the pin: `Algebra.TensorProduct.leftAlgebra`, `IsModuleTopology.continuous_of_linearMap`, `IsModuleTopology.isTopologicalRing`, `PadicInt.compactSpace`, `Algebra.norm_apply`, `Algebra.norm_eq_prod_embeddings`, `Matrix.isUnit_iff_isUnit_det`, `Matrix.mul_nonsing_inv`, `Matrix.nonsing_inv_mul`, `Matrix.fromCols_mul_fromBlocks`, `Ring.DirectLimit`, `AdicCompletion`, `Matrix.GeneralLinearGroup.det`, `Matrix.GeneralLinearGroup.mkOfDetNeZero`, plus `Module.finrank_baseChange` and `NumberField.RingOfIntegers.rank` through the elaborated proof of `finrank_Op`; Tau Ceti `NarrowClassGroup.instFinite` (TauCeti/NumberTheory/NumberField/NarrowClassGroup/Finite.lean:38).
- Merge order: the branch's `merge-order/ORDER.txt` predates the import and lacks the roadmap; the board's current `merge-order/ORDER.txt` on main lists OverconvergentAutomorphicForms at position 170, after every supplier (AdicSpacesPartII 7, AdicSpacesPartIII 8, AdicSpacesPartIV 11, PerfectoidTowers 13, PhiGammaModulesAndIwasawaCohomology 27, LocallyAnalyticDistributions 62, PadicFamilies 145, CompletedCohomologyPartII 156, AutomorphicBundles 167, HodgeTateAndCanonicalSubgroups 168, PerfectoidShimuraVarieties 169); AlgebraicVectorBundles and PadicMeasuresIwasawaAlgebras are on main. No declared gaps and no `design/plan.json`. Dependency gate output, verbatim:

```text
depcheck: 14 roadmaps, 112 edges, 0 problem(s)
```

No UPWARD, CYCLE or NOT IN ORDER line.

- Policy: title capitalisation correct; no `lemma`, `set_option`, `#eval`, `True` placeholder, LaTeX delimiter, issue or pull-request number, “review”, “round”, “so far” in README or Lean (the residue is F07); every Lean name occurs in the README and every README claim of a proved test in `Suggested.lean` (lines 133, 984) is backed by an example; at most two examples per kept definition; three or more Checks for each kept definition.
- Not re-raised: every round-1 finding of pass a (F01–F17) and pass b (F01–F05), all verified repaired above. Round 2 pass a had not been posted when this pass was written.

## Not verifiable

- DRW's version date (“9 April 2026”, `README.md:1141`) and the 2026 journal DOI in `sources.toml`: the cached arXiv v3 extraction carries no date stamp; the theorem numbering used here was verified in that extraction.
- The qualification of `HodgeTate.siegelGraphChart_act` and `HodgeTate.hodgeFrame_transform`: PerfectoidShimuraVarieties lists them as members of `HodgeTate.siegelGraphChart` (`.siegelGraphChart_act`, `.hodgeFrame_transform`) at its line 1273; the fully qualified names were not checked beyond that line.
- Sibling supplier READMEs were read at the open pull-request heads named above; PadicFamilies and LocallyAnalyticDistributions have moved since round 1 (97889a4, 3a4526a), and a later push changes line numbers.
- Heavy geometric and representation-theoretic targets (torsor invariants, integral model comparisons, Igusa coverage, the unitary classicality inputs, the Bruhat cohomology comparison) were checked for hypotheses, boundary cases and supplier existence only; their proofs are future library work.
