<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/131#issuecomment-6334936716 -->
Red team round 2 pass b (claude) of 47e438c

Verdict: needs_changes

1. **F01** (P2) Two boundary theorems are ill-typed: `ZMod 7` and `ZMod 5` carry no `Fact (Nat.Prime _)`

   **Location:** `packages/ComputationalNumberTheory/Suggested.lean:276`: “¬ ∃ P : PresentationChange (X ^ 3 - 2 : (ZMod 7)[X]) (X ^ 3 - 2),” and `packages/ComputationalNumberTheory/Suggested.lean:550`: “∃ c : FiniteFieldFactorCertificate (X ^ 2 + 1 : (ZMod 5)[X]),”.

   **Claim:** `PresentationChange` and `FiniteFieldFactorCertificate` take polynomials over a `Field`. `Field (ZMod n)` exists only under `[Fact (Nat.Prime n)]`, and Mathlib has that instance globally for 2 and 3 only. `PresentationChange.scaling_seven_impossible` (lines 275–278) and `FiniteFieldFactorCertificate.five_split` (lines 549–552) carry no such binder, so their statements do not elaborate; the file's other `ZMod 5` boundary theorems (lines 184, 231) and `square_linear_three` (line 539) do carry it.

   **Witness:** a probe copy of the file with the Tau Ceti imports and lines 1084–1148 removed reports at line 276 “Application type mismatch: The argument X ^ 3 - 2 has type Polynomial (ZMod 7) … but is expected to have type Polynomial ?m … Field.toSemifield …”, and at line 550 “failed to synthesize instance of type class Field ℕ” together with “argument X ^ 2 + 1 has type (ZMod 5)[X] but is expected to have type ℕ[X]”.

   **Exact repair text:**

   ```lean
   theorem PresentationChange.scaling_seven_impossible [Fact (Nat.Prime 7)] :
       ¬ ∃ P : PresentationChange (X ^ 3 - 2 : (ZMod 7)[X]) (X ^ 3 - 2),
         P.b = 2 * X ∧ P.c = 2 * X := by
     sorry
   ```

   ```lean
   theorem FiniteFieldFactorCertificate.five_split [Fact (Nat.Prime 5)] :
       ∃ c : FiniteFieldFactorCertificate (X ^ 2 + 1 : (ZMod 5)[X]),
         c.lead = 1 ∧ c.factors = [(X - C 2, 1), (X - C 3, 1)] := by
     sorry
   ```

   Both elaborate in the probe copy with only the `sorry` warning.

2. **F02** (P2) `pointCount_small_character_controls` is ill-typed at `ZMod 5`

   **Location:** `packages/ComputationalNumberTheory/Suggested.lean:1105`: “(⟨0, 0, 0, 0, 0⟩ : WeierstrassCurve (ZMod 5)).pointCount = 6 ∧”.

   **Claim:** `WeierstrassCurve.pointCount` is declared for `[Field F]` (pinned Tau Ceti `TauCeti/AlgebraicGeometry/EllipticCurve/PointCount.lean`, lines 9 and 14). Section `EllipticCurves` has no `Fact (Nat.Prime 5)`, so the middle conjunct of the theorem at lines 1103–1107 cannot elaborate, while the `ZMod 3` and `ZMod 2` conjuncts can. The sibling `pointCount_five_cubic` at line 1099 carries `[Fact (Nat.Prime 5)]`.

   **Witness:** the declaration could not be elaborated as submitted (see Not verifiable). A probe with a stand-in `def pc {F : Type*} [Field F] (W : WeierstrassCurve F) : ℕ` fails exactly at `pc (⟨0, 0, 0, 0, 0⟩ : WeierstrassCurve (ZMod 5))` with “failed to synthesize instance of type class Field (ZMod 5)”, and succeeds for `ZMod 3`, for `ZMod 2`, and for `ZMod 5` under `[Fact (Nat.Prime 5)]`.

   **Exact repair text:**

   ```lean
   theorem pointCount_small_character_controls [Fact (Nat.Prime 5)] :
       (⟨0, 0, 0, 1, 0⟩ : WeierstrassCurve (ZMod 3)).pointCount = 4 ∧
       (⟨0, 0, 0, 0, 0⟩ : WeierstrassCurve (ZMod 5)).pointCount = 6 ∧
       (⟨0, 0, 0, 0, 1⟩ : WeierstrassCurve (ZMod 2)).pointCount = 3 := by
     sorry
   ```

3. **F03** (P3) Six proved declarations do not elaborate, and four linter warnings

   **Location:** `packages/ComputationalNumberTheory/Suggested.lean:93`: “simpa [AlgebraicRootCertificate.value, rationalRootCertificate] using h”; also lines 364, 604–605, 1203–1207, 1270 and 1308.

   **Claim:** the proofs of `rationalRootCertificate_value` (lines 91–93), the `StrongLiar 7 3 ∧ ¬ StrongLiar 1 1` example (line 364), the zero-polynomial `RationalFactorCertificate` example (lines 603–606), the saturation-controls example (lines 1193–1207), the `intervalInv` example (lines 1266–1270) and the `complexBoxSet` singleton example (lines 1306–1312) are rejected, so the file does not build even after F01. Four further non-`sorry` diagnostics are emitted at lines 81, 271, 1344 and 1621.

   **Witness:** probe copy errors — line 93: “Type mismatch: After simplification, term h has type ⋯.choose - ↑r = 0 but is expected to have type ⋯.choose = ↑r”; line 364: “failed to synthesize Decidable (StrongLiar 7 3 ∧ ¬StrongLiar 1 1)”; line 604: “Unknown constant List.prod_ne_zero_iff.mpr”; lines 1203 and 1206: unsolved goals “2 • 1 ∈ ⊥”, “h1 : 1 ∈ ⊥ ⊢ False” and the product analogue; line 1270: “Tactic decide failed to reduce … reduction got stuck at … Rat.inv”; line 1308: “'change' tactic failed”. Warnings — line 81: “simp already closes the goal”; line 271: “automatically included section variable(s) unused … [Fintype F]”; line 1344: “this tactic is never executed” (`ring`); line 1621: “Used tac1 <;> tac2 where (tac1; tac2) would suffice”.

   **Exact repair text** (every replacement elaborated without diagnostics in a probe copy):

   - line 93: `  exact sub_eq_zero.mp (by simpa [AlgebraicRootCertificate.value, rationalRootCertificate] using h)`
   - line 364:

     ```lean
     example : StrongLiar 7 3 ∧ ¬ StrongLiar 1 1 := by
       refine ⟨⟨by norm_num, by decide, by norm_num, by norm_num, ?_⟩, by simp [StrongLiar]⟩
       have h6 : (6 : ℕ).factorization 2 = 1 := by
         rw [show (6 : ℕ) = 2 ^ 1 * 3 by norm_num, Nat.factorization_mul (by norm_num) (by norm_num),
           Nat.Prime.factorization_pow Nat.prime_two]
         simp [Nat.factorization_eq_zero_of_not_dvd (by norm_num : ¬ 2 ∣ 3)]
       right
       exact ⟨0, by rw [h6]; norm_num, by rw [h6]; decide⟩
     ```

   - lines 604–605: `  have hp : c.factors.prod ≠ 0 := List.prod_ne_zero (fun h0 => (c.monic 0 h0).ne_zero rfl)`
   - lines 1201–1207:

     ```lean
       · constructor
         · intro h
           have h1 := h 1 (AddSubgroup.mem_bot.mpr (by decide))
           exact one_ne_zero (AddSubgroup.mem_bot.mp h1)
         · intro h
           have h1 := h (0, 1) (AddSubgroup.mem_prod.mpr ⟨AddSubgroup.mem_top _,
             AddSubgroup.mem_bot.mpr (by decide)⟩)
           exact one_ne_zero (AddSubgroup.mem_bot.mp (AddSubgroup.mem_prod.mp h1).2)
     ```

   - line 1270: `  norm_num [intervalInv, NonemptyInterval.pure]`
   - line 1308 (replacing the `change` line):

     ```lean
       simp only [complexBoxSet, Set.mem_ofPred_eq, Set.mem_singleton_iff, NonemptyInterval.pure,
         Rat.cast_zero]
     ```

   - warnings: line 81 `    simp at h1`; insert `omit [Fintype F] in` as a new line immediately before the docstring at line 270; delete line 1344; line 1621 `  convert h using 1; norm_num [Fin.sum_univ_two]`.

4. **F04** (P3) Five of the six Tau Ceti imports supply nothing the file uses

   **Location:** `packages/ComputationalNumberTheory/Suggested.lean:3`: “import TauCeti.AlgebraicGeometry.EllipticCurve.MordellWeil.LocalCondition”, and lines 4–7.

   **Claim:** the Tau Ceti names occurring in the file are `pointCount`, `frobeniusTrace` (module `PointCount`) and `W.M`, `W.μX`, `μ`, `W.f` (defined in `MordellWeil.XSubT`, lines 164, 505, 548 and 794 of the pinned module, which `LocalCondition` and `TwoTorsion` re-export). Nothing from `LocalCondition` (`localRes`, `localCondition`, `mem_localCondition_iff`), `TwoTorsion` (`card_ker_nsmul_two`), `DivisionPolynomial.Descent` (`mul_eval_ΨSq_eq_eval_Φ_of_zsmul`), `ModularForms.SturmBound` (`eq_of_sturm_bound`) or `LocalField.Squares` (`unitFiltration_le_range_powMonoidHom_two`) is referenced; `𝒪[L]`, `IsNonarchimedeanLocalField`, `ModularForm.L`, `CuspForm.discriminant`, `qExpansion` and `𝒮ℒ` are Mathlib's. The rule admits only the individual `TauCeti.*` modules actually used.

   **Witness:** a grep of each of the five modules' declaration names over the file returns no occurrence; every declaration outside lines 1084–1148 elaborates against `import Mathlib` alone (probe copy).

   **Exact repair text:** replace lines 2–7 by

   ```lean
   import TauCeti.AlgebraicGeometry.EllipticCurve.PointCount
   import TauCeti.AlgebraicGeometry.EllipticCurve.MordellWeil.XSubT
   ```

5. **F05** (P3) A Completed-only supplier is headed “TauCetiRoadmap NumberFieldArithmetic”

   **Location:** `packages/ComputationalNumberTheory/README.md:88`: “**TauCetiRoadmap NumberFieldArithmetic** (Layers 3 and 7): the index–discriminant identity,” and `packages/ComputationalNumberTheory/README.md:1183`: “TauCetiRoadmap NumberFieldArithmetic Layers 3 and 7”.

   **Claim:** NumberFieldArithmetic exists on main only as `Completed/NumberFieldArithmetic` (Layer 3 at its README line 834, Layer 7 at line 1900); there is no `TauCetiRoadmap/NumberFieldArithmetic`. Sibling roadmaps cite completed roadmaps as `[X](../../Completed/X/README.md)`.

   **Witness:** `Completed/NumberFieldArithmetic/README.md` exists on main; `TauCetiRoadmap/NumberFieldArithmetic/` does not.

   **Exact repair text:** line 88: “- **[NumberFieldArithmetic](../../Completed/NumberFieldArithmetic/README.md)** (Layers 3 and 7): the index–discriminant identity,”; line 1183: “Completed NumberFieldArithmetic Layers 3 and 7”.

6. **F06** (P3) Two sorried targets are one tactic from Mathlib

   **Location:** `packages/ComputationalNumberTheory/Suggested.lean:751`: “(R : Subalgebra ℤ K) : pRadicalLattice R 0 = ⊥ := by” and `packages/ComputationalNumberTheory/Suggested.lean:976`: “∃ c : LocalExpansionCertificate L π π⁻¹ 1, c.valuation = -1 ∧ c.digits 0 = 1 := by”.

   **Claim:** `pRadicalLattice_zero` (lines 750–752) and `LocalExpansionCertificate.uniformizer_inverse` (lines 974–977) are stated as targets but close by one tactic or one term.

   **Witness:** a probe copy elaborates both proofs below with no diagnostics.

   **Exact repair text:** line 752: `  simp [pRadicalLattice]`; lines 976–977: end the signature with `:=` instead of `:= by` and give the body `  ⟨⟨hπ, hnorm, -1, fun _ => 1, by simp, by simp⟩, rfl, rfl⟩`.

   Probe outcome for the other sorried boundary targets tried (`phiExpansion_X`, `coefficientValuation_three_controls`, `isPSaturated_six_integers`, `ellipsoidPoints_zero_form_infinite`, `FiniteFieldFactorCertificate.zero_impossible`, `multiplierRing_half_impossible`, `isPMaximal_integer_order`): none closed with a `simp`/`norm_num`/`decide` one-liner; they stay targets.

## Verified sound

- Read all 2264 README lines (104 bold targets in 119 numbered sections, 227 Check cases) and all 1623 Suggested.lean lines (247 declarations: 142 theorems, 45 definitions, 14 structures, 1 inductive, 45 examples); every section `variable` block checked against each sorried signature (number-field, finite-field, interval, Gram and elliptic sections carry their instances in the signatures).
- Elaboration: the file as submitted stops at line 1 (see Not verifiable). A probe copy keeping 1558 of the 1623 lines (all but the Tau Ceti block 1084–1148, imports reduced to `import Mathlib`) gives 17 errors in 9 declarations (F01, F03) and the 4 linter warnings of F03; every other declaration elaborates with only `sorry` warnings — including `card_padicRoots_eq` with `ramificationIdx`/`inertiaDeg`, `isSquare_iff_isSquare_mod` over `IsNonarchimedeanLocalField`, `weight26_ordinary_107` by `decide`, `exists_millerBasis`, `levelOne_congruence_sturm`, the `ModularForm.L`/`DirichletCharacter.LFunction` statements, the Platt theorems and all `Fact`-guarded `ZMod 5`/`ZMod 3` boundary theorems. With the F01/F03/F06 repairs applied the probe copy elaborates with `sorry` warnings only.
- Checks recomputed (about 45 values): `a_107(ΔE₄²E₆) = 35830422465487817813321292 ≡ −1 (mod 107)` by exact integer convolution; the weight-38 Miller basis and `T₇₉ mod 79 = [[3,17],[25,10]]` with determinant 0; point counts 4, 9, 6, 3 for the four listed curves; Pratt size 7 for `(3, 2, [2])`; Pocklington `F = 8`, witness 3, for 17 (`3⁸ ≡ −1`); φ-expansion of `X²` in base `X−1` = 1, 2, 1; coefficient valuations 1 and 0; the side `(0,1)–(2,0)` of `X²−3` and the rejection of slope `−1` (`hd = 2 > u = 1`); residuals `Y−1` and `(Y−1)²`; 17 and 5 in ℚ₂, 6 in ℚ₅, `(1+π)² = 3+2π`; `[−2,3]·[−4,5] = [−12,15]`, `[2,4]⁻¹`, `[−4,−2]⁻¹`, dyadic hulls `[1/4,1/2]` and `[−1,0]`, unique integers for `[3/4,5/4]`, `[0,1]`, `{1/2}`; ellipsoid counts 5, 7 and `{0,1}`; the multiplicity value −34; `8/π² ≈ 0.8106 ∈ (4/5, 41/50)`, `16/π² ≈ 1.6211 ∈ [8/5, 41/25]`, `ζ(2) ≈ 1.6449 ∈ [8/5, 5/3]`, `ζ(0) = −1/2`, `L(Δ,12) ≈ 0.9945 ∈ (1/2, 3/2)` with Mathlib's `ModularForm.L` equal to `Σ aₙ n⁻ˢ`, `ψ′(1) − 1 = π²/6 − 1 ∈ (0,1)` and the `N = 2` bound `1/2`; the real local image of `y² = x³ − x` (discriminant 4, classes `(+,−,−)` and `(+,+,+)`, order 2) and the dyadic non-example (`N₂ = 8`, `f(1/4) = −15/64`, unit part `≡ 1 (mod 8)`); the 16 nonordinary pairs' companion relation `k + k′ = p + 3` and gcd filter giving 79, 151, 173, 193; the six accepted companion pairs with `gcd(k−1, p−1) = 1` and the 151 exclusion with gcd 3; Mathlib's `E₄` has constant term 1 (`EisensteinSeries.E_qExpansion_coeff_zero`) and `CuspForm.discriminant` is `η²⁴`, so 3.1–3.2 Checks hold.
- Locators verified (33, against the cached legal copies, page markers compared with the printed numbering): Shoup Thm 10.3 (line 12442, printed 309), Thm 19.10 (20086), Thm 19.14 (20193, 515), Thm 20.1 (20483, 523), Exercise 20.2 (20535, 524), Fig. 21.1 (21555, 550 — the AKS branches `r = n`, `gcd(n,r) > 1`, order `> 4 len(n)²` and loop bound `2 len(n)⌊√r⌋ + 1` match `aksParameter`/`AKSAccepts`), Lemma 21.6 (21678, 553); Stein Alg 2.18, Lemma 2.20, Remark 2.21, Prop 2.31, Thm 9.18 (1096, 1134, 1162, 1324, 7638; printed 19, 20, 21, 24, 171); GMN Def 1.6 (314, p.7), Def 1.9 (385, p.8), Thm 1.13 (495, p.10), Thm 1.15 (575, p.11), Thm 1.19 (684, p.14), Cor 1.20 (713, p.14); MilneANT Thm 7.32 (5320, printed 120), Thm 7.33 (5346, 121), Prop 8.2 (5929, 136); Platt Thm 7.1 (955, p.14: `q ≤ 400000`, heights `max(10⁸/q, 7.5·10⁷/q + 200)` for even and `max(10⁸/q, 3.75·10⁷/q + 200)` for odd `q`, as in `platt_bounded_height`), Thm 7.2 (976, p.15, `q ≤ 2000000`), Thms 3.1–3.3 (227, 271, 321); BCG Thm 2.1 (198), Thm 2.4 (323, printed 515), Cor 3.2 (453, 518), Remark 3.3 (457, 518); CarusoPublished Prop 2.1.1 (922), Def 2.1.2 (941), Prop 2.1.3 (955); Théry Thm 6.1 (248, p.9), Thm 6.2 (265, p.9; the printed size condition is the misprint the README corrects to `n < F²`); Siksek (39) 813 p.17, (40) 843, (41) 875 p.18; CL §3.16 and Prop 3.17 (11644, 11662, printed 304); NumberRings (9-2) 1104 (234), Prop 9.3 1125 (235); Sutherland eq. (1) 99 (p.2); Bennett–Siksek Prop 7.2 (851, 374; proof 915, 376); CG13 Appendix table 522 (p.14; the 151 row at 556); de Weger §3.6 2357 (p.51); LLL82 Thm 3.6 820 (p.26), (2.13) 638, (3.5) 779; FPS Lemma 3 (631, p.16), Lemma 4 (662, p.17); Cremona local solubility (850, p.80) and the discriminant-sign discussion (1474, p.93); DLMF 5.7.6 (254), 5.15.1 (64), 25.11.4 (213), 25.11.7 (419), 8.2.2 (122). All 25 readable manifest works are present in the cache; Mattuck is the settled uncertified entry.
- Supplier citations checked (9 roadmaps, 3 Completed/pinned-library contracts): ClassicalArithmeticCompletion §§3.3, 3.5, 3.25, 3.27, 3.33, 3.48, 5.1–5.3, 5.10, 5.11, 5.16, 5.22 exist on main with the cited `IntMatrix.IsSmithDecomposition`, `IntMatrix.IsHermiteNormalForm`, `IntMatrix.IsHermiteDecomposition`, `classGroupPresentation`, `relationLattice`; Completed/NumberFieldArithmetic Layers 3 and 7 (F05 is the heading only); LocalFieldsRamification Layers 0–2 with `TauCeti.map_normUnits_unitFiltration` (its README line 683; pinned `TauCeti/NumberTheory/LocalField/Norm/Unramified/Basic.lean:126`); ModularForms Layers 7–11 (its lines 708, 764, 971, 1024, 1204); EllipticCurves Layers 1, 3, 4, 6, 7; RealAlgebraicGeometry Layers 1–4; PolynomialGaloisGroups Layer 5 (factor degrees as Frobenius orbit sizes at its line 1108); AlgebraicModularFormsAndSerreWeights (ORDER.txt line 77) and HeightsRationalPointsAndObstructions (ORDER.txt line 104, declared gap `local-two-quotient`, stated at README 257–264 with the same slug as `design/plan.json`) precede this roadmap (ORDER.txt line 105); EffectiveDiophantineMethods (line 131) is cited only as a downstream consumer. Pinned Tau Ceti names found by grep: `kernelBasis`, `NumberFieldOrder.multiplierRing`, `not_dvd_index_iff`, `unitFiltration_le_range_powMonoidHom_two`, `eq_of_sturm_bound`, the `Γ₁` Hecke coefficient recurrence, `hasEntireExtension_qExpansion_coeff`, `pointCount`, `frobeniusTrace`, `pointCount_eq_card_point`, `A`, `M`, `μ`, `μX`, `μX_of_eval_f_ne_zero`, `ker_μ_eq`, `localRes`, `localCondition`, `mem_localCondition_iff`, `selmerGroupA`, `range_μ_le_selmerGroupA`, `normM`, `range_μ_le_ker_normM`, `card_ker_nsmul_two`, `mul_eval_ΨSq_eq_eval_Φ_of_zsmul`, `isOpen_range_powMonoidHom`, `badPrimes`. Pinned Mathlib names found: `IsNonarchimedeanLocalField`, `𝒪[·]`, `𝒮ℒ`, `qExpansion`, `ModularForm.L`, `CuspForm.discriminant`, `E₄`/`E₆`, `sturm_bound_levelOne_nat`, `dimension_level_one`, `DirichletCharacter.LFunction`, `Complex.digamma_apply_add_nat`, `Ideal.ramificationIdx`, `Ideal.inertiaDeg`.
- Dependency gate output, verbatim:

  ```text
  NOT IN ORDER: ComputationalNumberTheory (insert it after its last supplier)
  depcheck: 8 roadmaps, 51 edges, 1 problem(s)
  ```

  No UPWARD or CYCLE line. The gate reads the merge order of the board's main branch; the branch's `merge-order/ORDER.txt` lists ComputationalNumberTheory at line 105, directly after HeightsRationalPointsAndObstructions (line 104). Not a defect.
- Policy: title lower-case with no proper names; no `lemma` declaration or label, no `set_option`, no `def … := sorry`, no `#eval`/`#print axioms`/`True` placeholder, no pull-request numbers or process words (the words "round" and "lemma" at README lines 587, 714, 1156, 1197, 1328, 1330 are mathematical nouns); one `import Mathlib`; at most two proved examples per kept definition.
- Adversarial pass, no counterexample found: Pratt node bound (`N(n) ≤ 2 log₂ n − 1` nodes, quadratic size), strong-liar counts at `n = 9, 15, 25` (`4·#L ≤ n − 1`, equality at 9), `millerRabin_rounds_bound` at `k = 0`, `aksParameter` at `n = 2, 3, 6, 9` and `AKSAccepts` on primes with `r < n`, Pocklington with natural subtraction (`a = 0` excluded by `n > 1`), `henselLift` uniqueness including degree-zero factors and the `p = 2`, `X²` non-example, `FiniteFieldFactorCertificate.sound` as a multiset equality, `multiplierRing` of the zero lattice, `IsPMaximal` at `p = 1`, `nilpotent_iff_frobenius_zero` on the zero algebra and `k = 0`, `pRadical_multiplier_eq_iff` against Pohst–Zassenhaus, `IsPhiNewtonSide` with natural subtraction (`hd ≤ u` guards it), `phiResidualPolynomial` exact division on and above a side, `ore_residual_irreducible` with `s = 0` and `n = ed`, the `4π` criterion for odd and dyadic residue characteristic with `[CharZero L]`, `card_padicRoots_eq` for `X² − 2` at 7 and 2, `exists_millerBasis` at weights 0, 2, 12, `heckeRecurrence_discriminant_two` at `m = 1, 2`, `heckeRecurrence_zero_controls`, the saturation equivalences (both directions, including the quotient-generating variant), `mem_nsmul_iff_exists_root` with `P ≠ 0`, `dyadicHull_width` strictness, `ctTailKernel` monotonicity and the weighted threshold `α(N+1) ≥ 1` (`x r(x)` decreasing for `x ≥ 1`), the digamma/trigamma remainders via `Σ_{n≥N}(n+a)⁻² ≤ 1/(N−1+a)`, `ellipsoidPoints` at `n = 0`, `G = 0`, `R < 0`, `multiplicityGram_lift` (needs `0 < m i`, present).
- Not re-raised (pass a of this round, S01–S12 / F01–F12): complete-DVR factor Hensel ownership, the AKS cardinality contracts, the full modular integral basis for 3.4, the Turing-count inputs of 4.22, the NumberFieldArithmetic §§5.3/5.5 completion bridge for 2.23, the `isPMaximal_mono`/`mem_pRadicalLattice` generality, the omitted `ctExplicitFormula`/`exists_ctEnclosure` headline, the `translate_three` conclusion, the missing Check mirrors and the AKS rejecting Check, the Arb attribution of §§0.8–0.13, the multiplicity example, the `merge-order/ORDER.txt` hunk. Round-1 findings repaired at this head are not re-raised; the EffectiveDiophantineMethods direction (round 1 a F08 / b F01) is settled by the merge order (131 after 105).

## Not verifiable

- `Suggested.lean` as submitted: not elaborated — it imports six `TauCeti.*` modules and the review Lake setup has no compiled objects for them (the run stops at line 1 with “object file … TauCeti/AlgebraicGeometry/EllipticCurve/PointCount.olean … does not exist”). Lines 1084–1148 (`pointCount_eq_charSum`, `frobeniusTrace_eq_neg_charSum`, `pointCount_five_cubic`, `pointCount_small_character_controls`, `localImageSpan` and its three theorems) were checked statically against the pinned module sources only (binders `[Field F] [Fintype F] [DecidableEq F]`, `[DecidableEq K]`, `[W.IsElliptic] [W.IsCharNeTwoNF]`, `μ : Multiplicative W.Point →* W.M`); F02 is the one static defect found there.
- Mattuck, Theorem 7, p.114: settled uncertified citation, no text.
- The exhaustive finite classifications of 3.12–3.16 (all primes below 200, the simultaneous eigensystems) and Platt's zero and central-value datasets: only the two small witnesses (weights 26 and 38) and the gcd filters were recomputed.
- AlgebraicModularFormsAndSerreWeights R15.2, R15.3, R15.5 and HeightsRationalPointsAndObstructions §1.17: neither roadmap is on main; their section contents were not compared (the second is the declared gap).
- `merge-order/ORDER.txt` as a diff against the board's main: the clone is shallow; pass a's S12 covers it.
