# Review of OrthogonalTamagawaAndLatticeMass (pull request #1222 at cd58321)

**Verdict:** needs changes

This is a full review of `cd58321`. The folder changed by 324 lines since `493e3ac`. The previous finding, the library-pin lag, is repaired. One P2 remains: the indefinite class-finiteness result of §0.3 can be stated at the pins, but the module docstring says §0.3 cannot be stated, and the theorem is missing. Four P3 corrections follow. The gate, the dependency check, elaboration, the binder audit, the padding probe, the seeded source sample and the adversarial computations are all sound; they are recorded below.

## R01 (P2) — The indefinite class-finiteness result of §0.3 can be stated at the pins, but `Suggested.lean` lists it as not statable

**Location.**
- `TauCetiRoadmap/OrthogonalTamagawaAndLatticeMass/Suggested.lean` lines 39–41: "the away-S Spin approximation and Eichler applications of 0.3: the algebraic Spin group … is missing, as is the proper spinor-genus class carrier needed by the Eichler conclusion."
- `README.md` line 194 (§0.3): "Prove Eichler's theorem … and the indefinite rank≥3 class-finiteness application (the rank≥3 half of its 4E) separately."

**Claim.** No headline of §0.3 can be stated at the pins.

**Witness.** The conclusion `L.genusClasses.Finite` needs no Spin or spinor-genus carrier. Every carrier it uses is at the pin:
- `IntegralLattice.IsIndefinite`, `LinearAlgebra/IntegralLattice/Signature.lean` line 188;
- `IntegralLattice.IsNondegenerate`, `Basic.lean` line 154;
- `genusClasses`, `NumberTheory/IntegralLattice/ClassNumber.lean` line 76.

The pin proves only the definite and binary cases: `IsPosDef.finite_genusClasses` and `IsNegDef.finite_genusClasses` (`ClassNumber.lean` lines 173 and 188), and `finite_genusClasses_of_finrank_eq_two` (`Binary/ClassNumber.lean` line 93). IntegralLattices on main (line 82) assigns this rank-≥3 statement, half of 4E, to §0.3. It is the end result of the approximation branch ("Downstream consumers", line 569).

**Repair.**
1. Add the theorem under `/-! ## Layer 0: native and scheme dictionaries -/`, before Layer 1:

   ```lean
   /-- Class finiteness for indefinite lattices of rank at least three, the application of
   Eichler's theorem in 0.3: the genus of a nondegenerate indefinite integral lattice of rank at
   least three contains finitely many isometry classes (O'Meara, 104:4–5). -/
   theorem finite_genusClasses_of_isIndefinite {V : Type*} [AddCommGroup V] [Module ℚ V]
       (L : IntegralLattice V) [L.IsNondegenerate] (hL : L.IsIndefinite)
       (hn : 3 ≤ Module.finrank ℤ L) : L.genusClasses.Finite := by
     sorry
   ```

2. Narrow the docstring bullet to the parts that really cannot be stated: Eichler's equality of proper classes with proper spinor genera, which needs the missing proper spinor-genus carrier, and the away-S Spin approximation, which needs the missing algebraic Spin group.
3. In README §0.3, name the theorem `finite_genusClasses_of_isIndefinite` with this statement.

**Tested.** The statement elaborates at the pins with the imports of the current file. A scratch file importing only `Signature` and `ClassNumber` prints only the `sorry` warning. Its elaborated type is `∀ … (L : IntegralLattice V) [L.IsNondegenerate], L.IsIndefinite → 3 ≤ Module.finrank ℤ ↥L.carrier → L.genusClasses.Finite`. `[L.IsNondegenerate]` is needed because `IsIndefinite` (0 < sigPos ∧ 0 < sigNeg) allows a radical.

## R02 (P3) — The eight-divides-the-rank lemma is cited in the wrong file

**Location.** `README.md` line 39: "(`TauCeti.IntegralLattice.eight_dvd_finrank_of_isEven_isUnimodular_isPosDef`, in the same file)". The file named just before it is `TauCeti/LinearAlgebra/IntegralLattice/PosDef/EvenUnimodular.lean`.

**Witness.** At `2fd255d9` the lemma is at `TauCeti/LinearAlgebra/IntegralLattice/Milgram.lean` line 381. Its conclusion is `8 ∣ Module.finrank ℚ V`, the rational dimension, not `finrank ℤ L`. `PosDef/EvenUnimodular.lean` only mentions it in its docstring.

**Repair.** Replace "in the same file" with "in `TauCeti/LinearAlgebra/IntegralLattice/Milgram.lean`, stated for the rational dimension `finrank ℚ V`, which equals the rank of L because L spans V".

## R03 (P3) — The Conventions put every class set under full isometries, but §§1.1 and 1.4c use proper classes

**Location.** `README.md` line 16: "All class sets below are Tau Ceti's `TauCeti.IntegralLattice.genusClasses`, whose classes are taken under full integral isometries, not determinant-one isometries."

**Witness.**
- §1.1 (lines 218–228) works with the proper double-coset set, SO(M) and m⁺.
- §1.4c (line 341) counts proper classes of primitive forms.
- The native proper class set is `TauCeti.IntegralLattice.genusProperClasses` (`ProperClassNumber.lean` line 75), summed by `properMass` (`Mass.lean` line 100).
- §1.1's own Check shows the difference: m⁺ = 1/6 against m = 1/12 for A₂.

**Repair.** Write: "The full class sets below are `TauCeti.IntegralLattice.genusClasses`, under full integral isometries; the proper class sets of §§1.1 and 1.4 are `TauCeti.IntegralLattice.genusProperClasses`, under determinant-one isometries."

## R04 (P3) — §0.0 does not name the native carrier of the matrices it studies

**Location.** `README.md` line 114 (§0.0): "every integral matrix A with AᵀGA = G has determinant ±1 … so these matrices form a subgroup of GLₙ(ℤ)".

**Witness.** That set is Tau Ceti's `Matrix.isometryMatrices G`, the submonoid `{X | Xᵀ * A * X = A}` (`TauCeti/LinearAlgebra/Matrix/IsometryMatrices/Basic.lean` line 79). The cited `TauCeti.BilinForm.isIsometry_toLin_iff_mem_isometryMatrices` is already stated through it. `isUnit_det_of_mem_isometryMatrices` (line 151 of the same file) covers only the case where det G is a unit.

**Repair.**
- State the three bullets of §0.0 on `Matrix.isometryMatrices G`: its elements are units of determinant ±1 when det G ≠ 0, and taking matrices in b is an isomorphism from `IntegralLattice.Isometry L L` onto its unit group.
- Add `Matrix.isometryMatrices` to the From Tau Ceti contract and to §0.0's *Needs* line.

## R05 (P3) — Two section comments in `Suggested.lean` do not carry the README layer titles

**Location.** `Suggested.lean` line 91, `/-! ## Layer 3: The even-unimodular mass -/`, and line 112, `/-! ## Layer 4: Classification and class-count bounds -/`.

**Witness.** The README headings are "Layer 3: even-unimodular specialization and exact arithmetic" (line 451) and "Layer 4: automorphism orders and class counts" (line 502). The Layer 1 comment does match its README title.

**Repair.** Use `/-! ## Layer 3: even-unimodular specialization and exact arithmetic -/` and `/-! ## Layer 4: automorphism orders and class counts -/`. With R01, add `/-! ## Layer 0: native and scheme dictionaries -/`.

## Previous findings

**R01 (r19), the pin lag: repaired.**
- `lake-manifest.json` now pins Tau Ceti `2fd255d997f4…` and Mathlib `1b1ccf4b088b…`, the revisions main pins.
- `Suggested.lean` no longer defines `SameGenus`, `genusMass` or `localDensity`.
- `genusMass_eq` now reads `(L.mass : ℝ) = … * (L.determinant : ℝ) ^ … * ∏' p : Nat.Primes, ((((L.gramMatrix b).map (Int.castRingHom ℤ_[p])).localDensity : ℝ) / 2)⁻¹`.
- The class counts are stated on `(IntegralLattice.e8PowLattice k).classNumber`.
- README line 9 now says "this roadmap defines no genus, class set, mass or local density of its own".

## Verified sound

### Gate, dependency check, elaboration, binder audit, padding probe

- **Gate.** The worker's `gate.md` reports `OK`. My rerun at `cd58321` also prints `OK`, with every counter 0, including `outside-folder`, `stray-files`, `statement-hygiene`, `readme-ids-missing`, `sorry-data` and `set_option`.
- **Other changes.** `git diff --stat origin/main...HEAD` outside the folder is empty.
- **Dependency check** (`--movable --pr 1222`) printed:

  ```text
  depcheck: 233 roadmaps, 2263 edges, 0 problem(s)
  ```

  There is no UPWARD, CYCLE or `moved:` line. In `ORDER.txt` this roadmap is at line 149. Its open suppliers come earlier: AdelicAlgebraicGroups (52), GeometryOfNumbersAndQuadraticArithmetic (55), ArithmeticStatisticsPartV (56) and EndoscopicTransferAndUnitaryTraceComparison (148). Every other supplier is on main.
- **Elaboration.** `lake env lean` of `Suggested.lean` at the pins took 4.0 s. It printed exactly seven ``declaration uses `sorry` `` warnings, at lines 64, 82, 106, 116, 122, 127 and 133, and nothing else.
- **Binder audit.** The file has no `variable` or `include`. I put `#check @` on all eight declarations in one scratch copy and elaborated it once. Each type matches its README statement:
  - `genusMass_eq` takes `L.IsPosDef`, `3 ≤ n` and `b : Basis (Fin n) ℤ L`, with a `tprod` over `Nat.Primes`;
  - `genusMass_eq_rank_two` takes `Filter.Tendsto` of the partial products over `Finset.subtype Nat.Prime (Finset.range N)`;
  - `evenUnimodularMass_eq` takes `IsPosDef`, `IsEven`, `IsUnimodular` and `0 < finrank ℤ L`.
- **Padding probe.** I attempted each of the seven theorems with `first | rfl | (simp; done) | (norm_num; done) | decide | infer_instance | exact?`. None closed:
  - line 72 hit a `whnf` heartbeat timeout;
  - `exact?` failed at lines 89, 110, 117 and 123;
  - lines 129 and 135 hit the recursion limit.

  `bernoulliFullMass` is the one definition, with a real body, and `evenUnimodularMass_eq` needs it.

### Library declarations opened at the pin (Tau Ceti `2fd255d9`)

- **Quoted.**
  - `mass` (`Mass.lean` 91) is a `finsum` of `(Nat.card (Isometry c.out c.out))⁻¹` over `genusClasses`, with junk 0 for an infinite genus or an infinite O(M).
  - `genusClasses` (`ClassNumber.lean` 76) is the classes of lattices in the ambient V of the same genus. `classNumber` (144) is its `Nat.card`.
  - `localDensity` (`LocalDensity/Basic.lean` 546) is the `limUnder` of `localDensityCount r / p^(r·(card n).choose 2)`.
  - `gramMatrix` (`Gram.lean` 80) is `toMatrixAux e L.integralForm`, which is B and not B/2. `determinant` is at line 222.
  - `IsPosDef` (`Signature.lean` 171) is `L.form.toQuadraticMap.PosDef` on V.
  - `e8PowLattice` (`PosDef/EvenUnimodular.lean` 84) lives on `Fin (8 * k) → ℚ`.
  - `IntegralLattice.carrier` spans V (`Basic.lean` 63–73).
- **File:line citations of the From Tau Ceti contract: all 16 exact.**
  - `Genus.lean` 77;
  - `ClassNumber.lean` 76 and 144;
  - `Mass.lean` 91, 100 and 221;
  - `E8Genus.lean` 65;
  - `LocalDensity/Basic.lean` 546;
  - `EulerProduct.lean` 109 and 161;
  - `EvenUnimodularGenus.lean` 64;
  - `PosDef/EvenUnimodular.lean` 84;
  - `DensityExponent/Basic.lean` 154, 164 and 178;
  - `JordanSplitting.lean` 189.
- **Paraphrases checked against the statements.**
  - `hasProd_inv_half_localDensity_of_card_eq_two_mul_add_two` uses the Kronecker character of `4((−1)^(m+1) det A)` and needs m ≠ 0, as line 38 says.
  - `localDensity_smul` gives the factor `p^(v_p(c)·(n+1).choose 2)`.
  - `tendsto_localDensityCount_div_of_card_eq_two_mul_add_two` gives ε = ((−1)^(m+1) det A | p).
  - `sum_inv_natCard_isometry_eq_mass_iff` takes families in the ambient V; hence the `SameGenus.exists_isometry` step (`ClassNumber.lean` 133).
  - `SameGenus.isPosDef_iff`, `isEven_iff` and `determinant_eq` are at `Genus.lean` 130, 141 and 166.
  - `SameGenus.dyadicJordanProfile_eq` is at `JordanSplitting.lean` 223.
  - `isUnimodular_iff_isUnit_determinant` is at `Unimodular.lean` 196.
  - `two_mul_pi_rpow_mul_prod_Gamma_eq_two_pow_div_orthogonalGroupVolume` is at `OrthogonalGroup.lean` 516.
  - `OrthogonalCompactOpens.integral` is at `CompactOpen.lean` 71, and `finiteAdelicSpecialOrthogonalDoubleCoset` at `DoubleCoset/Basic.lean` 70.
- **Name scan.** All 191 backticked README identifiers were grepped as declarations at the pins. The only ones absent are this roadmap's own (declared in `Suggested.lean`) and the GeometryOfNumbersAndQuadraticArithmetic names, which resolve at its head.
- **Checked absences.** These support the not-statable list:
  - no Haar or Tamagawa measure under `NumberTheory/QuadraticForm/OrthogonalGroup`;
  - Spin carriers only for the split types B and D (and a triality D₄);
  - no spinor genus;
  - `DyadicJordanProfile` records only ranks and the type-I set, so it carries neither Cho's refinement I^e_1/I^e_2 nor the Witt type of V̄_i.

### Sources: the seeded sample, read at the locators in the cache

| Target | Locator | What the text shows |
| --- | --- | --- |
| 0.0 | IntegralLattices §§0B/0E | IntegralLattices (main) line 455: 0A–0G name native rows; line 405: `Matrix.PosDef` row, label 0E. |
| 0.1 | Milne §24i, pp.535–536 | `MilneAG` line 22080: §24i heading, printed p.535. Lines 22119–22136, p.536: the μ₂ sequence, kernel ±1, simply connected cover. Line 22149: §24j begins. |
| 0.1a | Cho v3 §4.1, p.16 | `Cho` line 753, inside the page-16 block (lines 747–813): §4.1, the reductive quotient of the special fibre. |
| 0.2 | none external | Internal targets; Checks computed below. |
| 0.3 | O'Meara 104:4–5; AdelicAlgebraicGroups AA.4.2 | O'Meara uncertified (see Not verifiable). AA.4.2 at #792, line 4581: strong approximation needs G′(F_S) noncompact for every F-simple factor, as §0.3 says. |
| 1.1 | Belolipetsky–Gan v2 §2, pp.2–3 | `BelolipetskyGan` line 68 (p.2): G = SO(V,q), standing assumption on dimension. Lines 83–99 (p.3): the double-coset indexing and the mass. |
| 1.2 | Conway–Sloane (2), (3), (6), §12 p.281; Belolipetsky–Gan §2 p.3 | `ConwaySloaneMass` line 192: (2) on printed p.263. Line 200: (3). Line 334: (6) on p.266. Lines 1086–1104: §12 on p.281, with α_p = N(pʳ)/p^(r n(n−1)/2) and m_p = p^(s(n+1)/2)/α_p. `BelolipetskyGan` line 103 (p.3): the two real Haar measures. |
| 1.3 | Conway–Sloane (2) p.263, §12 p.281 | Line 190: (2) for positive definite forms of dimension n ≥ 2. Line 318: the initial 2 is τ(SO). With m_p = p^(s(n+1)/2)/α_p, the factor ∏2m_p gives 2R_n D^((n+1)/2) ∏(α_p/2)⁻¹, the README's form (confirmed numerically in rows 1–3). |
| 2.1 | Cho v3 Thm 3.7, p.15 | `Cho` line 744, inside the page-15 block (697–746): G smooth, G(R) = Aut for étale R. |
| 2.2 | Cho Def 2.1(c) p.3; §2.3 p.5; Rem 2.6 p.6; Rem 2.8 p.6; Lemma 4.2, Rem 4.3 p.18; Thm 4.12 p.24; Lemma 5.1, Thm 5.2 pp.24–25; Rem 5.3(i) p.25 | Lines 117 (p.3), 208 (p.5), 240 and 264 (p.6, block 224–266), 883 and 889 (p.18, block 879–923), 1191 and 1223 (p.24, block 1183–1230), and 1253 (p.25), each with the cited statement. |
| 3.1 | Belolipetsky–Gan Thm 3.1 p.4; Cor 5.3 p.7; p.11; Conway–Sloane §9(iv) p.274 | `BelolipetskyGan` line 163 (p.4 block 140–182), line 288 (p.7 block 264–304: even unimodular), line 451 (p.11: λ = 1). `ConwaySloaneMass` lines 710–711: printed 274, (iv) unimodular lattices. |
| 3.2 | Mathlib `bernoulli` | Recomputed: B₁ = −1/2, B₄ = −1/30, B₃₈ = 2929993913841559/6. |
| 4.1 | Fomin–Reading v3 §2.5, Fig. 2.8, p.24; Chenevier–Lannes v2 Ch. II Cor. 3.6, p.41 | `FominReading` line 846: §2.5. Lines 913–925: Figure 2.8 lists Dₙ 2ⁿ⁻¹n!, E₆ 2⁷3⁴5, E₇ 2¹⁰3⁴5·7, E₈ 2¹⁴3⁵5²7, before the page-25 marker at line 926. `ChenevierLannes` line 1589: Corollaire 3.6 (rank 16: D₁₆⁺ or E₈⊕E₈), on PDF p.46; line 1587 shows printed p.40 ending, so this is printed p.41. |
| 4.2 | Chenevier–Lannes Thms 3.16–3.17, p.48; Borcherds norm-zero table | `ChenevierLannes` lines 1886–1893, PDF p.53 = printed 48. `BorcherdsTables` lines 6–74: the Leech entry /8315553613086720000, a1.24 /244823040, d4.6 /2160 and the other 21 rows used in row 9 below. |
| 4.3 | none external | Values computed in row 10. |

The README flags no locator as unverified.

### Adversarial table (values computed in this review)

Local densities α_p were counted by brute force over matrices mod pʳ: the number of X with XᵀAX ≡ A, divided by p^(r·n(n−1)/2).

| # | Statement | Instances | Values on each side | Result | Change |
| --- | --- | --- | --- | --- | --- |
| 1 | `genusMass_eq` | I₃ | counts 6144, 49152 at 2³, 2⁴ → α₂ = 12; 48, 1296 at 3, 9 → α₃ = 16/9; 2R₃ = π⁻²; right side π⁻²·(1/6)·(π²/8) = 1/48 = 1/(2³·3!) | True | none |
| 2 | `genusMass_eq`, even rank (new) | I₄ | 3145728 solutions mod 8 → α₂ = 12; 2R₄ = π⁻⁴; good factors (1 − p⁻²)², product (π²/8)²; right side π⁻⁴·(1/6)·π⁴/64 = 1/384 = 1/(2⁴·4!) | True | none |
| 3 | `genusMass_eq` | E₈ | 2R₈ = 135/(8π¹⁶); ∏β⁻¹ = 2⁻⁸ζ(2)ζ(4)²ζ(6) = 2⁻⁸π¹⁶/45927000; product 135/94058496000 = 1/696729600 = native `mass_typeE₈RootLattice` | True | none |
| 4 | `3 ≤ n` hypothesis | ⟨1⟩ | 2R₁ = 2; β₂ = 2, β_p = 1 at odd p; expression 1 against native mass 1/2 (`mass_eq_inv_two_of_finrank_eq_one`) | Hypothesis needed | none |
| 5 | `genusMass_eq_rank_two` | I₂; A₂; [[4,1],[1,6]]; diag(1,3) | α₂ = 8 (counts 64, 128); A₂: α₂ = α₃ = 12 (96, 192; 108, 324); [[4,1],[1,6]]: α₂ = 4 (32, 64); diag(1,3): α₂ = 4, α₃ = 12; partial products to 2·10⁶: 0.1250066, 0.0833372, 0.7500620, 0.2500116 → 1/8, 1/12, 3/4, 1/4 | Match README Checks | none |
| 6 | `genusMass_eq_rank_two` (new) | diag(1,2); diag(1,5); diag(2,2) | diag(1,2): α₂ = 16 (512, 1024 at 2⁵, 2⁶), (2/π)·2^(3/2)·(1/8)·π/(2√2) = 1/4, partial 0.2500031; diag(1,5): α₂ = 8, α₅ = 20, partial 0.2500132 → 1/4; diag(2,2): α₂ = 8·2³ (`localDensity_smul`), 8·(1/32)·(2/π)·(π/4) = 1/8 = mass of the genus of ℤ² | True | none |
| 7 | `evenUnimodularMass_eq` and its hypotheses | n = 8, 16, 0; I₈; U ⊕ U | `bernoulliFullMass 4` = 1/696729600 = native E₈ mass; `bernoulliFullMass 8` = 691/277667181515243520000; m = 0 gives 0 against mass 1; I₈ (odd) mass 1/10321920 ≠ 1/696729600; U ⊕ U native mass 0 against `bernoulliFullMass 2` = 1/576 | Each hypothesis needed | none |
| 8 | `rank16_classNumber` | 2·696729600², 2¹⁵·16! | 1/970864271032320000 + 1/685597979049984000 = M₁₆ exactly; either term alone is smaller | True | none |
| 9 | `rank24_classNumber` | 23 Borcherds rows × Weyl orders, plus Leech | Σ = 1027637932586061520960267/129477933340026851560636148613120000000 = M₂₄ exactly; every row of rank 24; 15 rows have a D/E factor; A₁²⁴ order 4107449023856640, share 3.0675%; 24! variant 0.96933·M₂₄; \|W(D₄)\| = 384 variant 0.99885·M₂₄ | True; README Checks match | none |
| 10 | `rank32`/`rank40` bounds | 2M₃₂, 2M₄₀ | 80618465.871… (strictly between 80618465 and 80618466) > 10⁷; 8.786·10⁵¹ ∈ (8·10⁵¹, 9·10⁵¹) > 10⁵¹ | True | none |
| 11 | §4.1 Weyl orders | D₄, D₆, E₆, E₇, E₈ | 2³·4! = 192; 2⁵·6! = 23040; 72·720 = 51840; 126·23040 = 2903040; 240·2903040 = 696729600, matching Fomin–Reading lines 916–919 | True | none |
| 12 | §0.0 Checks | G = diag(1,2), A = [[1,1],[0,1]]; A = diag(2,1) | AᵀGA = [[1,1],[1,3]]; diag(2,1)ᵀ G diag(2,1) = diag(4,2), det 8 ≠ 2; solutions of AᵀGA = G: a² + 2c² = 1, b² + 2d² = 2 → 4 sign matrices, 2 of determinant 1 | True | none (R04 names the carrier) |
| 13 | §0.1a orders | f = 2, 4 binary; odd r = 1; r = 0 | 2(2−1) = 2, 2(2+1) = 6; 6, 10; 2·(2²−1) = 6; split formula at r = 0: 2·1·0 = 0 against 1 | True; r = 0 exclusion needed | none |
| 14 | §1.4a character | A₂; diag(1,3) | g²Δ = 4·(−3) = −12 = −4·3; Δ = −12 = 2²·(−3), χ₋₃(2) = −1, factor 1 − (−1)/2 = 3/2 | True | none |
| 15 | §1.4c local identity | Δ = −23; diag(1,5) | (1/2)(1 − 1/2)·(1/46) = 1/184 = √23/(8·23√23); (1/4)(1/10) = 1/40 = √20/(8·5√5·2) | True | none |
| 16 | §1.4c narrow comparison | D = 5, 12 | s = 4: h⁺/h = 1, R⁺/R = 2; s = 2: h⁺/h = 2, R⁺/R = 1; h⁺R⁺ = 2hR in both | True | none |
| 17 | §0.3 class finiteness | the statement of R01 | elaborates at the pins; the pin has only the definite and rank-2 cases | Statable, absent | R01 |
| 18 | `eight_dvd_…` citation | its file and conclusion | `Milgram.lean` 381, `8 ∣ finrank ℚ V` | Wrong file | R02 |

### Cross-roadmap citations resolved

- **On main.**
  - IntegralLattices: assignment table lines 80–88 (4D/4E, 7B, 7C, 7F, 7H, 7I, 7D to OTM), §§0B/0E (line 455), 6D (line 2076).
  - OrthogonalSpinGroups (Completed): Layers 0–3 and §3A.
  - The `roadmaps resolve` scan of this README finds no cross-roadmap citation unresolved on main or at the open heads.
- **At open heads.**
  - GeometryOfNumbersAndQuadraticArithmetic (#851): §2.2 heading (line 508); 2.4.6 (line 620); `genusMass` 3.3.3 (line 1076); 3.3.4 (line 1089); `finiteOrthogonalOrder` under "Reductive-quotient orders and canonical local volume" (line 1211); `IntegralQuadraticLattice.ofCarrier`, `orthogonalTamagawa_two`, `orthogonalMassGaugeScale`, `compactOrthogonalGaugeVolume`, `orthogonalPinnedGaugeJacobian` and `orthogonalIntegralRealGaugeCompatibility` (all found at that head). This resolves the one lead in `citations.md`.
  - AdelicAlgebraicGroups (#792): AA.1.3's squaring Check (line 1301), AA.2.4 (line 2011), AA.4.2 (line 4581).
  - ArithmeticStatisticsPartV (#1175): "Siegel count of indefinite binary quadratic forms" (line 575).
  - EndoscopicTransferAndUnitaryTraceComparison (#999): §6.5 (line 2167).

### Ownership and overlaps

- **`overlaps.md`.** No open pull request changes this roadmap, drops an id it cites, or is its only definer.
- **IntegralLattices revision #617.** It keeps the same OTM assignment (its lines 100–106).
- **LatticePackingsAndPerfectForms (#1723).** Lines 156–160 defer the mass, the class counts and the automorphism orders here.
- **Other owners of the D/E Weyl orders.** A scan of every open head for E₆ and E₇ Weyl orders found no second owner: the hits for 51840 are |Sp₄(𝔽₃)|, and HypergeometricMotives only cites Weyl groups.
- **Names.** No declaration of `Suggested.lean` shares a fully qualified name with another roadmap.

## Not verifiable

- **O'Meara, *Introduction to Quadratic Forms*, 104:4–5 (§0.3, and the docstring of R01's repair).** The manifest records it as uncertified and settled; it is cited by its locator alone.
- **Conway–Sloane equation (2) and the §12 formula for m_p.** The text is an OCR of a scan (`ConwaySloaneMass` lines 191 and 1102–1104 are garbled). Their form was read from the surrounding text (lines 187–199, 318 and 1107–1108) and fixed by the numerical rows 1–3 and 5–6, which agree with known masses.

## Source issues

- none
