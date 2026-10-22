<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/168#issuecomment-6336369105 -->
Red team round 1 pass b (claude) of 7a3e546

Verdict: needs_changes

1. **F01** (P1) Four cited supplier roadmaps exist nowhere a package may consume

   **Location:** `packages/PadicHodgeRegulators/README.md:45`: “From KTheoryFiniteLocalFields §§1.8,6.6–6.7 and K3BlochGroups, consume finite Chern operations … MotivicEtaleKTheory §12.1 supplies universal finite étale Chern operations.” Also lines 7, 51 (“and the existing SyntomicCohomology material”), 548 (“GeneralizedHeegnerCycles GH.8 (differential evaluation)”), 753, 906, 990, 1062, 1155 (“BorelRegulators §3.12”), 1177.

   **Claim:** MotivicEtaleKTheory §12.1, SyntomicCohomology, BorelRegulators §3.12 and GeneralizedHeegnerCycles GH.8 are written as supplied inputs, and Layers 3, 5 and 6 build on them (§3.3 `blochDilog`, §5.6 `rootClassK3`, §5.9, §6.5(c), §6.7). None of them is on `main` (`TauCetiRoadmap/`, `Completed/`), none is in the merge order on the board's main, none is the head of any open content-repository pull request or an open board package, and no `design/plan.json` declares them as gaps. These are unowned prerequisites, not declared gaps. (K3BlochGroups, also cited, is an open board package above this roadmap in the merge order and is not part of this finding; whether its labels V.3/V.6 match that package is left to its own review.)

   **Witness:** the merge order on the board's main has no line for any of the four names; `TauCetiRoadmap/` and `Completed/` on `main` have no such folders; the open pull-request list (head branches) has none. The notions do have owners in the allowed set: `TauCetiRoadmap/ColemanIntegration/README.md:1496` “### L2.Fb The pre-Bloch and Bloch groups of a field, and the projective five-term relation” (ORDER line 102); `TauCetiRoadmap/KTheoryFiniteLocalFields/README.md:301` “### 1.8 Universal finite-coefficient Chern maps before rigidity” (ORDER line 62).

   **Exact repair text:** In `## Scope and ownership` and `## Exact supplier contracts` replace “MotivicEtaleKTheory §12.1 supplies universal finite étale Chern operations” by “KTheoryFiniteLocalFields §1.8 supplies the universal finite-coefficient Chern maps `earlyChern i j`”. Delete “and the existing SyntomicCohomology material” from the dependency display at line 51 and name the actual owner of each item (CohomologyComparisons for Hyodo–Kato, PadicPeriodRings for period rings). In §6.7 replace “BorelRegulators §3.12” by an explicit hypothesis “dim_ℚ K_3(F) ⊗ ℚ = r_2(F) (Borel)” carried by `padicK3RegulatorInjective_iff_rank`, or by a declared gap on a roadmap in the merge order. Delete the parenthesis “(GeneralizedHeegnerCycles GH.8 (differential evaluation))” from the Check at line 548.

2. **F02** (P1) SelmerIwasawaCohomology §§4.2–4.6 do not exist and that roadmap does not own the period rings

   **Location:** `packages/PadicHodgeRegulators/README.md:33`: “From SelmerIwasawaCohomology §4.2–4.5, consume B_cris, B_dR, B_e, continuous Galois cohomology, the fundamental exact sequences with continuous nonequivariant sections, and D_cris and D_dR.” Also lines 9 (“§4.2–4.9 owns the period rings”), 41 (“Its §4.6–4.7 supplies the small-weight integral comparison”), 84 (“from SelmerIwasawaCohomology §4.3”), 400.

   **Claim:** The package consumes sections §§4.2–4.6 of SelmerIwasawaCohomology for the period rings, the fundamental exact sequences and the small-weight comparison. At the head of that roadmap’s open pull request (branch `roadmap/selmer-iwasawa-cohomology`) Layer 4 begins at §4.7; there is no §4.1–§4.6, and the roadmap itself imports period rings from PadicPeriodRings and the finite-K comparison contracts from FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.P2–R07.P5. Only §4.9 and its three Bloch–Kato names are cited correctly.

   **Witness:** `TauCetiRoadmap/SelmerIwasawaCohomology/README.md:1863` “## Layer 4: Finite conditions and arithmetic applications”, `:1865` “### 4.7 Small-weight crystalline realization and extension exactness”, `:1907` “### 4.9 The Bloch–Kato local condition on `T` and `W`” with `blochKatoCondition`, `blochKatoCondition_T`, `blochKatoStructure` at `:1919–1921`; `:115` “### From PadicPeriodRings”. The owner: `TauCetiRoadmap/PadicPeriodRings/README.md:194` “### 1.5 The topological de Rham period rings”, `:410` “### 4.3 Fixed fields, regularity and the fundamental period identity”, `:414` the `G_K`-equivariant sequence 0 → ℚ_p → B_cris^{φ=1} → B_dR/Fil⁰ → 0 (ORDER line 16).

   **Exact repair text:** Replace line 9 by “PadicPeriodRings §§1.5 and 4.3 own the period rings B_cris, B_dR, B_e, their fixed fields and the fundamental exact sequence; FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.P2–R07.P5 own the finite-K crystalline and de Rham comparison contracts; SelmerIwasawaCohomology §4.9 owns the finite Bloch–Kato condition on T and W.” Replace “From SelmerIwasawaCohomology §4.2–4.5, consume …” at line 33 by “From PadicPeriodRings §§1.5, 4.3, consume B_cris, B_dR, B_e, D_cris and D_dR and the fundamental exact sequence; from FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.P2–R07.P5 the continuous sections and the crystalline-to-de Rham implication.” Replace “Its §4.6–4.7 supplies the small-weight integral comparison” by “SelmerIwasawaCohomology §4.7 supplies the small-weight crystalline realization”; replace “SelmerIwasawaCohomology §4.3” at line 84 by “PadicPeriodRings §4.3”; replace “SelmerIwasawaCohomology §§4.2–4.7” at line 400 by “PadicPeriodRings §§1.5, 4.3; SelmerIwasawaCohomology §4.7”. Keep D_cris/D_dR, if PadicPeriodRings does not define them at its head, as a declared gap “What PadicPeriodRings must provide (gap:dcris-ddr-functors): the functors D_cris, D_dR with their filtration and Frobenius for finite K/ℚ_p”.

3. **F03** (P2) Tame symbols are attributed to AlgebraicCurves, which has none

   **Location:** `packages/PadicHodgeRegulators/README.md:80`: “AlgebraicCurves supplies smooth proper geometrically connected curves, their étale boundaries, divisors, tame symbols and pull/push.”

   **Claim:** The tame symbol used in §§7.3, 7.8 (`relativeResidue_tameKernel`, “tame-kernel condition”) and 7.11 (“trivial total tame symbols”) is said to come from AlgebraicCurves. The AlgebraicCurves roadmap on `main` contains no symbol, K₂ or tame-symbol material; its only “tame” items are tame ramification. The owner in the merge order is K2SymbolsBrauer.

   **Witness:** `TauCetiRoadmap/AlgebraicCurves/README.md` has no occurrence of “symbol”, “K_2” or “K₂”; `TauCetiRoadmap/K2SymbolsBrauer/README.md:1391` “## Layer 9: tame symbols and Milnor residues”, `:1448` “### 9.2 The tame symbol of a discrete valuation”, `:1498` “### 9.4 The tame symbol is bilinear and satisfies the Steinberg relation” (ORDER line 31).

   **Exact repair text:** “AlgebraicCurves supplies smooth proper geometrically connected curves, their étale boundaries, divisors and pull/push; K2SymbolsBrauer §§9.2–9.4 supplies the tame symbol ∂_v{f, g} at a closed point, its bilinearity and the Steinberg relation, and the residue sequence used for the tame kernel of §§7.3, 7.8 and 7.11.” Add K2SymbolsBrauer to the `### Dependencies` of Layer 7.

4. **F04** (P3) Six sorried theorems close with short proofs from the pinned Mathlib

   **Location:** `packages/PadicHodgeRegulators/Suggested.lean:213`, `:296`, `:274`, `:95`, `:157`, `:182` (`gammaLeadingFactor_ne_zero`, `shearMatrix_unit`, `coleman_row_covariance`, `residueDilogValue_five_values`, `quadraticFrobeniusInverse_spec`, `quadraticEulerInverse_spec`).

   **Claim:** These are stated as targets (and listed as API in README §§8.6, 9.18, 9.17, 5.2, 8.2, 8.4) but each closes in a probe copy against the pinned Mathlib with the proofs below; the first four are one tactic or one simp call followed by `decide`. Only `finitePolylog_two_double_zero`, `residueDilogValue_cancel_double_zero`, `residueDilogValue_spans`, `quadraticEulerInverse_product` and `constraint_basis_and_determinant` remain genuine targets.

   **Witness:** A probe copy of the file with the proofs below in place elaborated with exit code 0 and no diagnostics for these six declarations.

   **Exact repair text:**
   ```lean
   theorem gammaLeadingFactor_ne_zero (j : ℤ) : gammaLeadingFactor j ≠ 0 := by
     unfold gammaLeadingFactor; split_ifs <;> positivity

   theorem shearMatrix_unit {R : Type*} [CommRing R] (e₁ e₂ : R)
       (h : IsUnit (1 - e₁ * e₂)) : IsUnit (shearMatrix e₁ e₂) := by
     simpa [Matrix.isUnit_iff_isUnit_det, shearMatrix, Matrix.det_fin_two_of, mul_comm] using h

   theorem coleman_row_covariance {R A : Type*} [CommRing R] [CommRing A]
       (ι : R →+* A) {d : ℕ} (c : Fin d → R)
       (U : (Matrix (Fin d) (Fin d) R)ˣ)
       (M : Matrix (Fin d) (Fin d) A) (B : (Matrix (Fin d) (Fin d) A)ˣ) :
       (fun k => ι ((c ᵥ* (↑U⁻¹ : Matrix (Fin d) (Fin d) R)) k)) ᵥ*
           ((↑U : Matrix (Fin d) (Fin d) R).map ι * M *
             (↑B⁻¹ : Matrix (Fin d) (Fin d) A)) =
         ((fun k => ι (c k)) ᵥ* M) ᵥ* (↑B⁻¹ : Matrix (Fin d) (Fin d) A) := by
     simp [RingHom.map_vecMul, Matrix.vecMul_vecMul, ← Matrix.mul_assoc, ← Matrix.map_mul,
       Function.comp_def]

   theorem residueDilogValue_five_values :
       residueDilogValue 5 (2 : ZMod 5) = 1 ∧
       residueDilogValue 5 (3 : ZMod 5) = 4 ∧
       residueDilogValue 5 (4 : ZMod 5) = 0 := by
     simp [residueDilogValue, finitePolylog, Finset.sum_Ico_succ_top]; decide +kernel

   theorem quadraticFrobeniusInverse_spec {E ι : Type*} [Field E] [Fintype ι]
       [DecidableEq ι] (a b : E) (Φ : Matrix ι ι E)
       (hΦ : Φ ^ 2 + a • Φ + b • 1 = 0) (hb : b ≠ 0) :
       Φ * quadraticFrobeniusInverse a b Φ = 1 ∧
         quadraticFrobeniusInverse a b Φ * Φ = 1 := by
     have h2 : Φ ^ 2 + a • Φ = -(b • (1 : Matrix ι ι E)) := eq_neg_of_add_eq_zero_left hΦ
     constructor
     · calc Φ * quadraticFrobeniusInverse a b Φ = (-b⁻¹) • (Φ ^ 2 + a • Φ) := by
             simp [quadraticFrobeniusInverse, Matrix.mul_smul, Matrix.mul_add, sq]
         _ = 1 := by rw [h2, smul_neg, neg_smul, neg_neg, smul_smul, inv_mul_cancel₀ hb, one_smul]
     · calc quadraticFrobeniusInverse a b Φ * Φ = (-b⁻¹) • (Φ ^ 2 + a • Φ) := by
             simp [quadraticFrobeniusInverse, Matrix.smul_mul, Matrix.add_mul, sq]
         _ = 1 := by rw [h2, smul_neg, neg_smul, neg_neg, smul_smul, inv_mul_cancel₀ hb, one_smul]

   theorem quadraticEulerInverse_spec {E ι : Type*} [Field E] [Fintype ι]
       [DecidableEq ι] (a b : E) (Φ : Matrix ι ι E)
       (hΦ : Φ ^ 2 + a • Φ + b • 1 = 0) (hs : 1 + a + b ≠ 0) :
       (1 - Φ) * quadraticEulerInverse a b Φ = 1 ∧
         quadraticEulerInverse a b Φ * (1 - Φ) = 1 := by
     have h2 : Φ ^ 2 + a • Φ = -(b • (1 : Matrix ι ι E)) := eq_neg_of_add_eq_zero_left hΦ
     have k1 : (1 - Φ) * (Φ + (1 + a) • (1 : Matrix ι ι E)) = (1 + a + b) • 1 := by
       have : (1 - Φ) * (Φ + (1 + a) • (1 : Matrix ι ι E)) =
           (1 + a) • (1 : Matrix ι ι E) - (Φ ^ 2 + a • Φ) := by
         simp only [sub_mul, mul_add, one_mul, Matrix.mul_smul, Matrix.mul_one, sq, add_smul, one_smul]
         abel
       rw [this, h2, sub_neg_eq_add, ← add_smul]
     have k2 : (Φ + (1 + a) • (1 : Matrix ι ι E)) * (1 - Φ) = (1 + a + b) • 1 := by
       have : (Φ + (1 + a) • (1 : Matrix ι ι E)) * (1 - Φ) =
           (1 + a) • (1 : Matrix ι ι E) - (Φ ^ 2 + a • Φ) := by
         simp only [mul_sub, add_mul, mul_one, Matrix.smul_mul, Matrix.one_mul, sq, add_smul, one_smul]
         abel
       rw [this, h2, sub_neg_eq_add, ← add_smul]
     constructor
     · rw [quadraticEulerInverse, Matrix.mul_smul, k1, smul_smul, inv_mul_cancel₀ hs, one_smul]
     · rw [quadraticEulerInverse, Matrix.smul_mul, k2, smul_smul, inv_mul_cancel₀ hs, one_smul]
   ```
   Keep the declarations (they are the Checks’ Lean mirrors) but the README should no longer list them as open targets; `residueDilogValue_five_values` may also be folded into the residue examples as pass a proposes.

5. **F05** (P3) ColemanIntegration is cited through anchors that do not exist at its head

   **Location:** `packages/PadicHodgeRegulators/README.md:471`: “(ColemanIntegration:Layer 0 iwasawa-logarithm)”; also 181, 715 (“Layer 0 log-branch”), 724 (“Layer 2 five-term-relation”), 738 and 775 (“Layer 2 dilogarithm-identities”), 742 (“Layer 2 integral-modified-polylogarithm”), 930 (“Layer 2 values-at-tame-roots-of-unity (c)”), 1212 (“Layer 1 good-reduction-pair”), 1251 (“Layer 1 coleman-integral”).

   **Claim:** The slug-style anchors are not section numbers, target names or stable identifiers of ColemanIntegration (ORDER line 102), whose sections are numbered L0.n, L1.n, L2.n, L3.n and which carries no “Stable target identifier” lines; a reader cannot resolve them.

   **Witness:** `TauCetiRoadmap/ColemanIntegration/README.md:466` “### L0.15 The branches `log_a` of the p-adic logarithm”, `:534` “### L0.18 The Iwasawa logarithm `log_p`”, `:703` “### L1.1 A curve with good reduction and an etale divisor”, `:1092` “### L1.19 The Coleman integral”, `:1496` “### L2.Fb The pre-Bloch and Bloch groups of a field, and the projective five-term relation”, `:1717` “### L2.13 The modified polylogarithm as an integral rigid function off the residue disc of 1”, `:1796` “### L2.18 The p-adic dilogarithm `D` and its two-term, branch and Frobenius identities”, `:1871` “### L2.25 Polylogarithm values at roots of unity of order prime to `p`”; no line of that file contains “dilogarithm-identities”, “five-term-relation”, “good-reduction-pair”, “log-branch” or “iwasawa-logarithm”.

   **Exact repair text:** Replace the anchors by section numbers: “ColemanIntegration L0.15” for log-branch, “L0.18” for iwasawa-logarithm, “L1.1” for good-reduction-pair, “L1.19” for coleman-integral, “L2.Fb” for five-term-relation, “L2.13” for integral-modified-polylogarithm, “L2.18” for dilogarithm-identities (keep the clause letters only if L2.18 numbers them), “L2.25” for values-at-tame-roots-of-unity. §L3.14 and §L3.15 are already correct.

6. **F06** (P3) Pin narrative and a declaration that does not exist at the pinned Tau Ceti

   **Location:** `packages/PadicHodgeRegulators/README.md:31`: “`TauCeti.rootsOfUnityFieldEquivResidueFieldUnits` supply the multiplicative section, uniqueness and tame-root correspondence at the stated older pin, with argument K. In the current API use …”; also line 13 (“The current Tau Ceti local-field library”), 183 (“(pinned commit f790474)”), 195 (“This is current …”), 2218 (a bibliography entry pinning a Tau Ceti commit).

   **Claim:** The README narrates two library versions (“older pin”, “current”) and pins a commit, which is process narrative, and `TauCeti.rootsOfUnityFieldEquivResidueFieldUnits` does not exist in the pinned library.

   **Witness:** A whole-tree search of the pinned Tau Ceti (commit `a91d3aaf`) finds `teichmuller`, `unitsMap_residue_teichmuller`, `rootsOfUnityAlgebraMulEquivUnitsResidueField`, `unitFiltrationZeroEquivProd`, `frobeniusAlgEquiv_teichmullerLift`, `frobeniusAlgEquiv_rootsOfUnity` and the four cited files, but no `rootsOfUnityFieldEquivResidueFieldUnits`.

   **Exact repair text:** Line 31: “From Tau Ceti, `TauCeti.teichmuller 𝒪[K]`, `TauCeti.unitsMap_residue_teichmuller` and `TauCeti.rootsOfUnityAlgebraMulEquivUnitsResidueField 𝒪[K] K` (`TauCeti/RingTheory/Henselian/Teichmuller.lean`) supply the multiplicative section, its uniqueness and the tame-root correspondence; `TauCeti.unitFiltrationZeroEquivProd` (`TauCeti/NumberTheory/LocalField/UnitsDecomposition.lean`) supplies the tame/principal-unit decomposition.” Delete “The current” at line 13 (“The Tau Ceti local-field library supplies …”), “This is current” at line 195 (“This is `TauCeti.frobeniusAlgEquiv_teichmullerLift` …”), the parenthesis “(pinned commit f790474)” at line 183, and the `TauCetiTeichmuller` bibliography entry at line 2218 (cite the module path in the text instead).

7. **F07** (P3) The absolute sign of the p = 5 pairing Check is not determined by the stated conventions

   **Location:** `packages/PadicHodgeRegulators/README.md:699`: “At p=5, P_{ℚ₅(1)}(κ(6),logχ)=log₅(6)≠0, whereas P_{ℚ₅}(logχ,κ(6))=−log₅(6).”; reused at line 1621.

   **Claim:** The relative sign between the two orders is fixed by the convention P_W(a,b) = −P_{W*(1)}(b,a) (line 684), but the absolute value +log₅(6) depends on the normalisation of the local reciprocity map and of the invariant H²(K,ℚ_p(1)) → ℚ_p, neither of which the Conventions or the supplier contract (line 41) fixes. With Serre’s normalisation (a uniformiser maps to the arithmetic Frobenius, so rec(u) acts on μ_{p^∞} through u⁻¹) the same ordered pairing ⟨κ(u), ψ⟩ = ψ(rec(u)) evaluates to −log₅(6); with the geometric normalisation it is +log₅(6). A Check whose value flips with an unstated convention is not a witness for the sign it is meant to pin.

   **Witness:** The Kummer convention κ: τ(α)/α is fixed at line 655, but no sentence of `## Conventions` or of the supplier contract at line 41 states which Frobenius the reciprocity map sends a uniformiser to, nor the sign of the invariant map.

   **Exact repair text:** Add to `## Conventions`: “Local class field theory is normalised so that a uniformiser maps to the geometric Frobenius and rec(u) acts on μ_{p^∞} by ζ ↦ ζ^u for u ∈ 𝒪_K^×; the invariant H²(K,ℚ_p(1)) ≅ ℚ_p is the one for which ⟨κ(u), ψ⟩ = ψ(rec(u)) for ψ ∈ H¹(K,ℚ_p). Under the opposite (arithmetic) normalisation every absolute sign below is negated while all relative signs are unchanged.” Keep the Check at line 699 and add the clause “(geometric reciprocity normalisation)” after “log₅(6)”.

## Verified sound

- Elaboration: `Suggested.lean` copied verbatim to a probe copy elaborates with exit code 0 and exactly eleven `declaration uses 'sorry'` warnings (lines 57, 82, 95, 102, 157, 182, 190, 213, 259, 274, 296) and no other diagnostic. It imports only `import Mathlib`; no `TauCeti.*` import, no `lemma`, no `set_option`, no `#eval`/`#print`/`#synth`; every kept definition has exactly two proved examples; no sorried data. Declarations read: 8 definitions, 12 theorems (11 admitted, `residueDilogValue_map` proved), 16 examples, 2 local instances (38 items). Short-proof probes: six admitted theorems close (F04); `finitePolylog_two_double_zero`, `residueDilogValue_cancel_double_zero`, `residueDilogValue_spans`, `quadraticEulerInverse_product` and `constraint_basis_and_determinant` did not close with the attempted one-tactic and short proofs and are genuine targets.
- README read in full (2,230 lines): 114 numbered target subsections 0.1–9.36, 18 supplier subsections, the two required-contract tables, Downstream consumers and References.
- Checks recomputed and found correct (34): the ZMod 5 and ZMod 3 finite-polylogarithm values at lines 928, 931–933 and the residue values (1,4,0) with their spans at 948 and 984; the cubic field factorisation (degrees 2 and 1, discriminant −23) at 324 and the identity z₂ = 1 − α at 1167 against GSWZ2024 Example 4.3; the Teichmüller and Frobenius Checks at 187–189 and 201–202; the Tate-cone values at 243–244 and 247; the weight-two torsion w₂^{(3)}(ℚ₃) = 3 at 349 and the rank-3 statement at 346; the dimension formulas at 426–429, 447–450, 501–503, 530 and 537; the Fontaine boundary sign derivation at 561 and the value 25/24 at 570; the generator and root-change Checks at 611, 613, 624–625; the Gamma values at 1456–1458; the inverse values at 1388–1390 and 1414–1416 and the value −9/10 at 1442; the logarithmic-factor values at 1473–1475; the f₆ jets 5/2, 35/12, −35/3, −70/3 at 1659–1662; the Gauss-sum vanishing at 2147; the shear and slope arithmetic at 1905, 1920, 1932, 1942; the modular relation at 2044 and the Cayley–Hamilton contraction at 2078; the trace Check at 1107.
- Adversarial pass: Berger’s Theorem A.3 is quoted at the right generality and the sharpness Checks at 165–166 hold with the weight-of-ℚ_p(1) = +1 convention (Berger2003DM line 1019 and the convention sentence at line 268); the ψ=1 versus φ=1 Check at 124, the torsion Check at 122, the Tate-twist dictionary of §1.8 including r ≤ −1, the rank-zero and empty-product conventions of §§3.1, 5.6, 5.8, the singular Euler-factor exclusions of §§8.1–8.5 and the unit-versus-nonzero determinant distinction of §9.18 were instantiated and found consistent.
- Locators verified against the cached legal copies (41, across 12 sources; sources identified by the URL recorded in each cached text since the package has no `sources.toml`): BK1990 Cor. 3.8.4 and (3.8.5) pp. 355–356 (lines 716, 744); CC99 Lemme I.4.2 p. 7, Prop. II.1.2 and Thm II.1.3 p. 12, Thm IV.2.1 p. 21, Lemme V.3.1 and Prop. V.3.2 p. 26; Berger2003DM Prop. I.8 p. 110, Thm II.3 p. 114, Thm II.6 p. 116, Thm II.8 p. 118, Thm II.16 and Rem. II.17 p. 122, Thm A.3 p. 124; LZ2014 Lemma 2.4 p. 7, Def. 4.14 and Rem. 4.16 p. 20, Thm B.6 p. 39; HK2011 Rem. 1.3.3 p. 9, Def. 2.2.1 and Ex. 2.2.4 p. 14; BNQD2002 Lemme 1.3.2 p. 647, Thm 2.1 p. 648, Lemme 2.2.2 p. 649, §2.3.2 p. 652; EN2016 Thm 2.2 p. 7; CN2017 Thm 1.1 and (1.3) p. 2; Rubin2000 Rem. I.3.6 p. 7, Cor. I.6.4 p. 16, Rem. I.7.1 p. 17, App. B Cor. 5.2 p. 157; LLZ2011 Prop. 2.11, Thm 2.12, Cor. 2.13 p. 1115, Rem. 2.14 p. 1116; LLZWach2010 Thm 3.5 p. 10, Lemma 3.7; GSWZ2024 Lemma 3.1 (line 1975) and Example 4.3 with (270) (line 2694). All statements and page numbers agree with the README.
- Supplier citations checked at the suppliers’ current heads (19 sections in 14 roadmaps): SelmerIwasawaCohomology §4.9 and its three names (correct; §§4.2–4.6 absent, F02); PhiGammaModulesAndIwasawaCohomology Layers 3, 5, 6, §5.7 (`blochKatoExp`), §6.2 (good bases); KTheoryFiniteLocalFields §§1.8, 6.6, 6.7, Layer 6, §7.6 (semilocal completed map); LocallyAnalyticDistributions §§1.1, 1.4, 1.5, 2.1, 2.3, 3.3; PadicDifferentialEquationsAndRigidCohomology RD.4 (Monsky–Washnitzer comparison); CohomologyComparisons §§4.1–4.2 (Hyodo–Kato adapters); ColemanPowerSeries Layers 1–2 and §2.1; ColemanIntegration §§L3.14, L3.15 (correct; slug anchors F05); LocalGaloisGroups Layer 7; LocalFieldsRamification Layers 1–2; PadicMeasuresIwasawaAlgebras; Completed/NumberFieldArithmetic Layer 5 `semilocalEquiv`; Completed/EffectiveBounds; AlgebraicCurves (F03). CohomologyComparisonsPartII and ColemanIntegrationPartII target names are covered by pass a F01–F02 and were not re-checked.
- Dependency check (exit code 0):

```text
depcheck: 9 roadmaps, 84 edges, 0 problem(s)
```

  No UPWARD or CYCLE line. `grep -nx PadicHodgeRegulators merge-order/ORDER.txt` finds nothing; the package is an import and is not in the merge order, which is not a defect.
- Policy: title keeps proper names capitalised; no `lemma`, `set_option`, issue or pull-request numbers in README or Lean; no LaTeX delimiters found.
- Earlier findings not re-raised (pass a, round 1): F01 (CohomologyComparisonsPartII names), F02 (ColemanIntegrationPartII names and the wrong sibling edge), F03 (D = ∅ dagger algebra), F04 (restricted semistable graph), F05 (three filtered de Rham theories), F06 (character-specialisation Λ-linearity Check), F07 (ℚ_p-linearity on the rational domain), F08 (missing coordinate-image headline), F09 (missing Lean mirrors of Checks), F10 (ten Lean names without README counterpart, including `finitePolylog_two_rootMultiplicity_one` versus `finitePolylog_two_double_zero`), F11 (missing `sources.toml`, duplicate keys Berger2003/Berger2003DM, LLZWach/LLZWach2010, LLZ2011/LLZ2010v2), F12 (reconstruction is `LinearEquiv.symm_apply_apply`), F13 (rank-zero largest weight), F14 (unused-index hypotheses of `constraint_basis_and_determinant`), F15 (Fontaine–Ouyang version numbering), F16 (trailing name catalogue and missing docstrings).

## Not verifiable

- `sources.toml` is absent from the package (pass a F11), so source ids could not be mapped to sha256 files; the twelve sources above were identified by the URL header of each cached text. Locators into Besser2000 (OCR’d PostScript), BdJ2003 (OCR), NN2016, Tamme2014, AM18, AM2022, Asakura2023, BZ2017, BR2019, Besser2025, Ara2003, AC20, BdJ2012, WeibelChern, FontaineBPR1994, HK2, Benois2014, RJ2018 and Limites2004 were not checked in this pass.
- The explorer campaign documents for K3BlochGroups, MotivicEtaleKTheory, GeneralizedHeegnerCycles and BorelRegulators exist only in the explorer repository (`content/campaign/`); they are not roadmaps a package may consume, and their section labels (“V.3 (pre bloch group)”, “§12.1”, “GH.8 (differential evaluation)”, “§3.12”) could not be matched to any section of those documents. No `design/plan.json` was readable at this head, so no declared gaps could be discharged against them.
- The Cartier-type hypothesis added to EN2016 Theorem 2.2 at README line 300 is stronger than the hypothesis printed at EN2016 line 318 (fs log-scheme log-smooth over 𝒪_K^×); whether the underlying theorem attributed there to Tsuji needs Cartier type was not checked against the primary source and is not raised.
- The quadratic-Euler product `quadraticEulerInverse_product`, `finitePolylog_two_double_zero`, `residueDilogValue_cancel_double_zero`, `residueDilogValue_spans` and `constraint_basis_and_determinant` were tested only against short probes; their truth as stated was checked by hand (the F₅ values, the double zero for p > 3, the empty-J and d = 0 cases) and not mechanically.
