# Review of OrthogonalTamagawaAndLatticeMass (pull request #1222 at 12c963e)

**Verdict:** needs changes

This is a full review of `12c963e`, against the branch pins in `lake-manifest.json`: Tau Ceti `a91d3aa` and Mathlib `6b7abb3c`. There are two findings.

- **R01 (P2)** is the only blocking finding. It re-raises H01: the branch still pins `a91d3aa`, and this head now cites 50 Tau Ceti files, of which 33 do not exist there.
- **R02 (P3)** is a locator. The new rank-two headline repeats the gap that R03 of the previous review found.

The mathematics of every sampled target, headline and Check was recomputed and holds.

## R01 (P2) — The README is written against main's Tau Ceti, but the branch pins `a91d3aa`, where 33 of the 50 cited files do not exist

Re-raised: H01

**Location.**
- `lake-manifest.json` pins Tau Ceti `a91d3aafa8cd…` and Mathlib `6b7abb3c…`; main pins Tau Ceti `2fd255d` and Mathlib `1b1ccf4b`.
- `TauCetiRoadmap/OrthogonalTamagawaAndLatticeMass/README.md` line 30: "The genus, the masses and the local densities are native; the files below are in `TauCeti/NumberTheory/IntegralLattice/`."
- Line 9: "this roadmap proves none of their properties again".

**Claim.** The From Tau Ceti contract (lines 26–58) and the Tau Ceti declarations cited in §§1.1–1.4, 2.2, 3.1, 4.1 and 4.2 exist at the pin.

**Witness.** The README cites 40 Tau Ceti files by full path and 10 under `TauCeti/NumberTheory/IntegralLattice/`. `git cat-file -e` finds 17 of the 50 at `a91d3aa` and all 50 at `2fd255d`. At `a91d3aa`, `TauCeti/NumberTheory/IntegralLattice/` holds only `Diagonalization.lean` and `Localization.lean`.

**Detail.**
- **What is absent at `a91d3aa`:**
  - `Genus.lean`, `ClassNumber.lean`, `Mass.lean`, `E8Genus.lean` and `EvenUnimodularGenus.lean`;
  - the three `LocalDensity/` files and the two `Dyadic/DensityExponent/` files;
  - the four `Binary/` files and the two `BinaryQuadraticForm/Ideal/` files;
  - `Geometry/Euclidean/Volume/OrthogonalGroup.lean`, `Units/Regulator/Basic.lean`, and the `DoubleCoset/` and `Integral/CompactOpen.lean` files;
  - `PosDef/EvenUnimodular.lean` and the five `Rank24/` files;
  - nine of the root-system files: Weyl type A, Cartan type, base change, orbit, parabolic quotient, highest root, the E₈ automorphism file, the E₈ root-lattice Weyl group file, and `Coxeter/Restriction.lean`.
- **Declarations missing at the pin.** About 90 backticked declaration names exist only at `2fd255d`, among them `TauCeti.IntegralLattice.SameGenus`, `TauCeti.IntegralLattice.mass`, `Matrix.localDensity`, `TauCeti.IntegralLattice.binaryDiscriminant` and `TauCeti.specialOrthogonalGroupVolume_eq_prod`. `git grep` at `a91d3aa` finds no definition of `localDensity`, `SameGenus`, a lattice `mass`, `genusClasses`, `e8PowLattice`, `binaryDiscriminant` or `specialOrthogonalGroupVolume`. The rest were found absent with their files.
- **Growth since the last review.** At `e35529e` the README cited 27 files, 10 of them at `a91d3aa`. It now cites 50, 17 of them at the pin.
- **Effect on §1.3.** §1.3 reads `SameGenus`, `genusMass` and `localDensity` as comparisons with native objects (lines 278–305), and at the pin those native objects do not exist.

**Why the repair report's reason does not settle it.** H01's answer says the fix is a merge of `origin/main` that only the worker can make. That assigns the step correctly, but the merge has not happened at `12c963e`. This head makes the README depend on `2fd255d` for its whole genus, mass, density, binary-lattice and SO(n)-volume contract. At the pins this review must use, those contracts name nothing.

**Repair.**
1. **Worker or human.** Merge `origin/main` into the branch. This moves the pins to Tau Ceti `2fd255d` and Mathlib `1b1ccf4b`.
   - Checked at `2fd255d`: all 50 cited files exist.
   - The contract's declarations sit at the lines the README gives:
     - `Genus.lean`: 77;
     - `ClassNumber.lean`: 76 and 144;
     - `Mass.lean`: 91, 100 and 221;
     - `LocalDensity/Basic.lean`: 546;
     - `EulerProduct.lean`: 109 and 161;
     - `EvenUnimodularGenus.lean`: 64;
     - `DensityExponent/Basic.lean`: 154, 164 and 178;
     - `JordanSplitting.lean`: 189;
     - `PosDef/EvenUnimodular.lean`: 84 (`e8PowLattice`);
     - `OrthogonalGroup.lean`: 500 and 516.
   - The four `TauCeti.*` imports of `Suggested.lean` exist at both pins.
2. **Author, after the merge, inside the folder.** At `2fd255d` the Gram-level definitions restate Tau Ceti.
   - `localDensity` repeats `Matrix.localDensity`: the same count over `p ^ (r * n.choose 2)`, with values in ℚ.
   - `genusMass` repeats `TauCeti.IntegralLattice.mass` of `nativeLattice G`, and `SameGenus` repeats `TauCeti.IntegralLattice.SameGenus`.
   - Restate `genusMass_eq` and `genusMass_eq_rank_two` with `(nativeLattice G).mass` on the left. Use `Matrix.localDensity` of `G.1.map (Int.cast : ℤ → ℤ_[p])` in the products, under a local `Fact p.Prime`.
   - Then delete `SameGenus`, `genusMass` and `localDensity` from `Suggested.lean`, together with the three "Prove that … agrees with its native counterpart" bullets of §1.3. Their Checks stay as Checks of the native objects.
   - §3.1 already plans the equality of `evenUnimodularMass n` with `TauCeti.IntegralLattice.mass (TauCeti.IntegralLattice.e8PowLattice (n / 8))` (line 486). After the merge, state `evenUnimodularMass_eq` on that mass and the four class counts on `TauCeti.IntegralLattice.classNumber` of `e8PowLattice k`.
   - Keep in `Suggested.lean` only the definitions a headline still needs, and un-backtick the README names of those you delete.
   - This step was not elaborated: this review's Lean commands run only at the branch pins.

## R02 (P3) — The rank-two headline cites Conway–Sloane (2) for a formula in α_p without §12

**Location.**
- `TauCetiRoadmap/OrthogonalTamagawaAndLatticeMass/Suggested.lean` line 146: "(Conway–Sloane, equation (2), p.263, stated for `n ≥ 2`)".
- README line 323: "(Conway–Sloane, equation (2), p.263, which they state for n ≥ 2)".
- README line 274 (line 261 at `e35529e`): "(Conway–Sloane, equations (2), (3), (6))".

**Claim.** Equation (2) supports these statements as written in the densities α_p, or β_p = α_p/2.

**Witness.** Equation (2) is stated in the p-masses m_p (ConwaySloaneMass lines 187–194, p.263). α_p and its relation m_p = p^(s(n+1)/2)/α_p appear only in §12 (lines 1086–1104, p.281). The `genusMass_eq` docstring (lines 131–132) and README line 313 already add §12.

**Repair.** Append ", with the density α_p and the p-mass related in §12, p.281" to the three locators.

**Tested on A₂.** With 2m_p = p^(s(n+1)/2)/β_p, equation (2) reads (2/π)·3^(3/2)·(1/6)·(1/6)·(3/2)·L(1,χ₋₃). With L(1,χ₋₃) = π/(3√3) this is 1/12, which is `genusMass` of A₂.

This completes R03 of the previous review.

## Previous findings

- **R01 (stale pin): not repaired.** `lake-manifest.json` still pins Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The dependence on `2fd255d` grew from 27 to 50 cited files. Held as R01 above, re-raised against H01.
- **R02 (rank-two mass formula statable but absent): repaired.**
  - `Suggested.lean` lines 147–152 state `genusMass_eq_rank_two`: the partial products `2 / Real.pi * (G.1.det : ℝ) ^ ((3 : ℝ) / 2) * ∏ p ∈ (Finset.range N).filter Nat.Prime, (localDensity G.1 p / 2)⁻¹` tend to `genusMass G`.
  - README lines 276, 323 and 464 name it, the module docstring lists it (lines 12–13), and lines 35–38 make 1.4 its proof steps.
  - `Finset.range N` (primes below N) instead of the proposed `range (N + 1)` gives the same limit.
  - The partial products at N = 2·10⁶ were recomputed: I₂ 0.1250066, A₂ 0.0833372, [[4,1],[1,6]] 0.7500620.
- **R03 (docstring locators): partly repaired.**
  - Lines 131–132 now read "(Conway–Sloane, equation (2), p.263, with the density `α_p` and the `p`-mass related in §12, p.281)".
  - Lines 174–177 now say that Belolipetsky–Gan's Theorem 3.1 "gives twice this value: their mass sums `1/|SO(L)|` over the proper classes".
  - README line 274 (formerly 261) still cites only equations (2), (3), (6), and the new rank-two locators copy the gap: R02.
- **Earlier remark on `TauCeti.specialOrthogonalGroupVolume`: acted on.** README lines 28 and 247 now consume `TauCeti.specialOrthogonalGroupVolume_eq_prod` and `TauCeti.two_mul_pi_rpow_mul_prod_Gamma_eq_two_pow_div_orthogonalGroupVolume`. Both are at `2fd255d` only, which is part of R01.

## Verified sound

### Gate, dependency check, Lean

- **Worker's gate** (`gate.md`): `OK`, every counter 0, `build=0` included.
- **My rerun of the gate on `12c963e`:** `OK`, every counter 0, including `outside-folder=0`, `stray-files=0`, `readme-ids-missing=0` and `depcheck=0`.
- **Pull request contents.** The folder holds `README.md`, `Suggested.lean` and `metadata.toml`. `git diff --stat origin/main...HEAD` outside the folder is empty.
- **Dependency check with `--movable`:**

  ```text
  depcheck: 235 roadmaps, 2266 edges, 0 problem(s)
  ```

  It printed no UPWARD, CYCLE or `moved:` line.
- **Supplier positions.**
  - In the merge order: AdelicAlgebraicGroups 52, GeometryOfNumbersAndQuadraticArithmetic 55, ArithmeticStatisticsPartV 56, EndoscopicTransferAndUnitaryTraceComparison 148, this roadmap 149.
  - On main: IntegralLattices, ReductiveGroups, Rank24LatticeConstructions, CFSGBasicProperties, SporadicOrders, ReflectionInvariantTheory, TauberianBoundaryConvergence and ImaginaryQuadraticClassNumber.
- **Elaboration.** `lake env lean` of `Suggested.lean` took 4.9 s. It printed exactly seven warnings, `declaration uses 'sorry'`, at lines 133, 147, 178, 185, 189, 193 and 197.
- **Binder audit.** One probe file ran `#check @` on all 22 declarations.
  - Every elaborated type matches its README statement. For example, `genusMass_eq_rank_two : ∀ (G : PositiveGram 2), Filter.Tendsto (fun N => 2 / Real.pi * ↑(Matrix.det ↑G) ^ (3 / 2) * ∏ p ∈ Finset.range N with Nat.Prime p, …) Filter.atTop (nhds ↑(genusMass G))`, where the exponent is the real `(3 : ℝ) / 2` of the source.
  - There is no `variable` block, so no binder can drop. Nothing changed.
- **Padding probe.** Each of the seven `sorry`s was replaced by `first | rfl | decide | norm_num | simp | infer_instance | positivity`. All seven fail with unsolved goals, so there is no padding.

### Sources: the seeded sample

All locators were read in the cached texts. Conway–Sloane is now an OCR text.

- **Milne (`MilneAG`), §24i.**
  - It starts at line 22080 (printed p.535).
  - GSpin as the even Clifford elements normalising V is at lines 22102–22103; the spinor norm and Spin as its kernel at lines 22110–22112.
  - Spin is the two-fold, simply connected cover of SO at lines 22129–22136 (p.536).
  - §24j begins at line 22149 (p.536) and continues on p.537. The README's pp.535–537 also covers the §24j split-form statement used in 0.1's route.
- **Cho v3 (`Cho`):**

  | Item | Line | Page |
  | --- | --- | --- |
  | Definition 2.1(c), zero lattice modular of parity type II | 117 | p.3 |
  | §2.3 | 208 | p.5 |
  | Remark 2.6 with the I^o/I^e/II and I^e₁/I^e₂ assignment, and bound/free | 240–256 | p.6 |
  | Remark 2.8 | 264 | p.6 |
  | Theorem 3.7 | 744 | p.15 |
  | §4.1 (Z_i, V̄_i, φ_i to O(V̄_i)_red) | 753–760 | p.16 |
  | Lemma 4.2 (α = free I^e₁ count, β = #{j : L_j type I, L_(j+2) type II}) | 883–887 | p.18 |
  | Remark 4.3 image table | 889–897 | p.18 |
  | Theorem 4.12 | 1191 | p.24 |
  | Lemma 5.1 | 1223 | p.24 |
  | Theorem 5.2 (β_L = [O:SO]⁻¹ f^N f^(−dim O) #𝒢̃(κ), N = N_Q − N_M with the +c term) | 1249–1251 | p.25 |
  | Remark 5.3(i) | 1253 | p.25 |

- **Belolipetsky–Gan v2 (`BelolipetskyGan`).**
  - §2 has the genus definition (line 66), the d ≥ 3 standing assumption (lines 68–70) and the double-coset indexing with L_α = V ∩ αL̂ (lines 75–80), p.2.
  - The mass is the sum of 1/#Γ_α with Γ_α ⊂ SO(F), and equals the quotient volume, at lines 83–99, p.3.
  - γ_G is at lines 113–120, p.3: at d = 3 it is (2π)² = 4π² = s₃V₃.
  - Theorem 3.1, line 163, p.4, has the parahoric hypothesis and τ(G) = 2.
  - Corollary 5.3, λ_L = 1 for even unimodular L, is at line 288, p.7. λ_(L_even) = 1 is at line 451, p.11.
- **Conway–Sloane (`ConwaySloaneMass`).**
  - Equation (2) is for n ≥ 2, over all primes 2, 3, …, at lines 187–194, p.263. The p-mass and equation (3) are at lines 195–211.
  - Equation (6), the standard p-mass, is at lines 330–337, p.266. On that page, lines 318–323 say the leading 2 is τ(SO) and becomes 1 in dimensions 0 and 1.
  - §9(iv), unimodular masses from (2) at d = 1, is at line 711, p.274.
  - §12 is at lines 1086–1104, p.281: α_p = N(p^r)/p^(rn(n−1)/2) for XᵀAX ≡ A, which is `localDensity`, and m_p = p^(s(n+1)/2)/α_p.
- **Fomin–Reading v3 (`FominReading`).** §2.5 starts at line 846. Figure 2.8, lines 913–925, p.24, gives 2ⁿ⁻¹n!, 2⁷3⁴5 and 2¹⁰3⁴5·7.
- **Chenevier–Lannes v2 (`ChenevierLannes`).** Corollaire 3.6, the two rank-16 lattices, is at line 1589, printed p.41. Théorèmes 3.16–3.17 are at lines 1886–1893, printed p.48.
- **Borcherds (`BorcherdsTables`).** Leech /8315553613086720000 (line 6), A₁²⁴ /244823040 (line 9), A₂¹² /190080 (line 11), D₄⁶ /2160 (line 19), A₁₁D₇E₆ /2 (line 33).
- **0.0, 0.2, 1.4, 3.2 and 4.3** cite no external text. Their supplier and library citations are below.

### Library declarations opened

- **At the branch pin `a91d3aa` (Tau Ceti):**
  - `IntegralLattice.ofGramMatrix`, `IntegralLattice.Isometry`, `IsEven` and `IsUnimodular`; `Suggested.lean` elaborates on these.
  - `git grep` finds no `localDensity`, `SameGenus` or lattice `mass` definition (R01).
- **At main's `2fd255d` (Tau Ceti):**
  - `IntegralLattice.SameGenus` (`Genus.lean` 77): signatures equal and `localIntegralForm p` equivalent at every prime.
  - `mass` and `properMass` (`Mass.lean` 91 and 100): `finsum` of `(Nat.card (Isometry c.out c.out))⁻¹` over `genusClasses`.
  - `properMass_eq_two_mul_mass` (154), with hypotheses `genusClasses.Finite` and `0 < finrank`.
  - `sum_inv_natCard_isometry_eq_mass_iff` (221).
  - `Matrix.localDensity` (`LocalDensity/Basic.lean` 546), valued in ℚ with normalisation `p ^ (r * n.choose 2)`.
  - `localDensityCount_div_pow_of_det_ne_zero` (599), for `2 v_p(2 det A) < r`.
  - `localDensity_pos` (614) and `localDensity_of_isEmpty` (623).
  - The two unramified limits (711, 737), with ε = ((−1)^(m+1) det A | p).
  - `localDensity_smul` (`Smul.lean` 128), with factor `p^(v_p(c)·(n+1).choose 2)`.
  - The two good-prime Euler products (`EulerProduct.lean` 109 and 161, `m ≠ 0`, Kronecker character of `4(−1)^(m+1) det A`).
  - `IsPosDef.sameGenus_of_isEven_of_isUnimodular` (`EvenUnimodularGenus.lean` 64) and `e8PowLattice` (`PosDef/EvenUnimodular.lean` 84).
  - `specialOrthogonalGroupVolume_eq_prod` (`OrthogonalGroup.lean` 500), the product over j = 2..n of 2π^(j/2)/Γ(j/2).
  - `two_mul_pi_rpow_mul_prod_Gamma_eq_two_pow_div_orthogonalGroupVolume` (516).
  - `binaryNormForm` (`NormForm.lean` 43, coefficients (A, 2b, C)), `binaryContent` and `binaryDiscriminant` (173, 177; primitive-part discriminant), and `binaryContent_sq_mul_binaryDiscriminant` (192, = −4·determinant).
  - `binaryDiscriminant_neg_of_isPosDef` (250) and `not_isSquare_binaryDiscriminant_of_anisotropic` (303).
  - `binaryNumberFieldOrder_conductor` (124) and `binaryNumberFieldOrder_eq_maximal_iff` (133, `Int.IsFundamentalDiscr`).
  - `card_specialOrthogonalGroup_of_binaryDiscriminant_neg` (`NormOne.lean` 104), `posDefProperClassEquivPic` (55) and `properClassEquivNarrowPic` (106, `0 < D`, nonsquare).
  - No Spin group scheme for an arbitrary form, no adelic orthogonal Tamagawa measure and no spinor-genus carrier exist at either pin, so the docstring's not-statable list holds after the merge too.
- **Mathlib `6b7abb3c`:**
  - `DirichletCharacter.LFunction_changeLevel` (`DirichletContinuation.lean` 149: `χ ≠ 1 ∨ s ≠ 1`, factor ∏_(p ∣ N)(1 − χ(p)p^(−s))) and `differentiable_LFunction` (97).
  - `LFunction_ne_zero_of_one_le_re` (`Nonvanishing.lean` 397).
  - `NumberField.tendsto_sub_one_mul_dedekindZeta_nhdsGT` (`DedekindZeta.lean` 77).
  - `Int.IsFundamentalDiscr` (`FundamentalDiscriminant.lean` 41).

### Cross-roadmap citations resolved

- **IntegralLattices, on main.**
  - 2C, 2G, 3C, 3E, 3F, 3I, 4A–4E, N0, N1, 5A, 6C–6E, 6G, 7A–7I, 9B and B1–B8 are all labels at the lines found.
  - B8 (line 1369) gives m = h⁺(gen L)/(2w), which matches §1.4c's h(Δ)/(2w|Pic[2]|).
  - The owner table (lines 82–88) assigns 4D, 7B, 7C's Haar bullet, 7D, 7F, 7H and 7I here.
- **GeometryOfNumbersAndQuadraticArithmetic, at its head.**
  - Line 42 is the boundary paragraph.
  - §2.2 `IntegralQuadraticLattice.ofCarrier` is at line 512 (the citations tool's one lead; it is a README target there), 2.4.6 at line 620 and §3.3.3 at line 1076.
  - §3.3.4 (line 1089) is for a totally positive form over a totally real field, with compatible measures and convergent vol(K_f).
  - `orthogonalTamagawa_two` is at line 1124; `orthogonalMassGaugeScale` (2^(−⌊n/2⌋) in odd rank, 1 in even) and `compactOrthogonalGaugeVolume` at lines 1141–1143; `orthogonalPinnedGaugeJacobian` at 1145; `orthogonalIntegralRealGaugeCompatibility` at 1147; `finiteOrthogonalOrder` at 1211.
- **AdelicAlgebraicGroups, at its head.** The AA.1.3 squaring-map Checks are at lines 1301–1304. The additive normalisations vol(𝒪_v) = 1, dx and 2 dx dy are its convention at line 242. §4.2 "Strong approximation and arithmetic closures" starts at line 4263.
- **ArithmeticStatisticsPartV, at its head.** "Siegel count of indefinite binary quadratic forms" is at line 575.
- **EndoscopicTransferAndUnitaryTraceComparison, at its head.** §6.5 is at line 2167.
- **Overlaps.** `overlaps.md` lists no pull request that changes this roadmap and no dropped id. The open revision of IntegralLattices (#617) still assigns the rank-2 conditional product (its line 2950) and the 7D–7I rows here.

### Ownership

- `roadmaps grep` over the open heads for this roadmap's objects found no second owner. That covered the mass formula, Cho's model, the rank-16/24 class counts and the Weyl group orders of types D, E₆ and E₇.
- LatticePackingsAndPerfectForms (its head, lines 152–156) defers the mass formula, class counts and automorphism orders here.
- `genusMass` differs from GeometryOfNumbersAndQuadraticArithmetic §3.3.3's by namespace. Its duplication of Tau Ceti's `mass` after the merge is part of R01's repair.

### Adversarial table

All values were computed this round: densities by brute-force counts, products by sieve to 2·10⁶, and Bernoulli numbers by the recurrence in exact rationals.

| # | Statement | Instances | Values on each side | Result | Change |
| --- | --- | --- | --- | --- | --- |
| 1 | 0.0 congruence Checks | G = diag(1,2), A = [[1,1],[0,1]]; [1] vs [2] | AᵀGA = [[1,1],[1,3]]; det diag(2,1) = 2; unit 1×1 squares 1 ≠ 2 | True | none |
| 2 | 0.0 order Checks | diag(1,2); empty matrix | \|O\| = 4 sign matrices, \|SO\| = 2; empty: 1 | True | none |
| 3 | 0.1 Checks | V = 0; x²+y²; x²+y²+z²; rank 4, d = 1 vs 2 | C⁰ norm-one {±1}, native Spin {1}; N((3+4i)/5) = 1; spinor norm 1·2 = 2, not a square; SL₁(H)² vs Res_(ℚ(√2)/ℚ) | True | none |
| 4 | 0.1a orders | xy, x²+xy+y² over 𝔽₂; f = 4; z²+xy; r = 0 | 2 = 2(2−1); 6 = 2(2+1); 6 and 10; 6 = 2(4−1); split formula at r = 0 gives 0, not 1 | True | none |
| 5 | 0.2 transpose Check | C = diag(1,4), M = [[0,1/2],[2,0]] | MCMᵀ = diag(1,4); MᵀCM = diag(16,1/4); M² = I, so M⁻ᵀ = Mᵀ and AᵀCA = C | True | none |
| 6 | 1.1 Checks | A₂; [[4,1],[1,6]]; [[2,1],[1,12]]; I₃ rotation at 3 | \|O(A₂)\| = 12, \|SO\| = 6, m⁺ = 1/6 = 2·(1/12); proper classes 1/2+1/2+1/2 = 3/2 = 2·(1/4+1/2); 9/25+16/25 = 1, det 1 | True | none |
| 7 | 1.2 gauge and Checks | n = 3, 4; Frobenius metric; tB; U at 2 | V₃ = 2π·4π = 8π², s₃V₃ = 4π² = BG γ_G; V₄ = 16π⁴; (√2)³ factor; D^((n+1)/2) gains t^(n(n+1)/2) and ∏β⁻¹ loses it; reflection in (1,1) is [[0,−1],[−1,0]], det −1 | True | none |
| 8 | `localDensity` Checks (1.3) | ⟨1⟩, ⟨2⟩, U at 2; I₃ at 2, 3 | counts 4, 8, 64 (r = 4) give 4, 8, 4; I₃: 6144/2⁹ = 49152/2¹² = 12; 48/27 = 1296/729 = 16/9 | Match | none |
| 9 | `SameGenus` Checks | [1],[2],[9]; I₈ vs E₈ | b/a must be a unit square at every p, so a = b; 9/1 is not a unit at 3; E₈ even vs I₈ odd at ℤ₂, equivalent at odd p and over ℚ | True | none |
| 10 | `genusMass` Checks | empty; [[4,1],[1,6]]; I₃; E₈ | 1; 1/4 + 1/2 = 3/4; 1/(2³·3!) = 1/48; 1/696729600 | True | none |
| 11 | `genusMass_eq`, I₃ (n = 3) | 2R₃ = 1/π², β₂ = 6, good product π²/8 | (1/π²)(1/6)(π²/8) = 1/48 = `genusMass` | True | none |
| 12 | `genusMass_eq`, I₄ (n = 4, new) | brute force α₂(I₄): 3145728/2¹⁸ = 12, β₂ = 6; 2R₄ = π⁻⁴; good product (π²/8)² | π⁻⁴·(1/6)·π⁴/64 = 1/384 = 1/(2⁴·4!) | True | none |
| 13 | `genusMass_eq`, E₈ | 2R₈ = 135/(8π¹⁶); ∏β⁻¹ = 2⁻⁸ζ(2)ζ(4)²ζ(6) | 135/(8·256·45927000) = 1/696729600 | True | none |
| 14 | `genusMass_eq` rank hypothesis | ⟨1⟩ (n = 1) | expression 2·1·(1/2) = 1 vs mass 1/2; Conway–Sloane p.266: 2 becomes 1 in dimension 1 | `3 ≤ n` needed | none |
| 15 | `genusMass_eq_rank_two` | I₂: α₂ = 8 (128 at r = 4) | (2/π)(1/4)(π/4) = 1/8; product 0.1250066 | Converges to 1/\|O(ℤ²)\| | R02 locator |
| 16 | `genusMass_eq_rank_two` | A₂: α₂ = α₃ = 12 | (2/π)·3√3·(1/36)·π/(2√3) = 1/12; product 0.0833372 | True | R02 |
| 17 | `genusMass_eq_rank_two` | [[4,1],[1,6]]: α₂ = 4, α₂₃ = 92 (48668/23²) | (2/π)·23√23·(1/92)·3π/(2√23) = 3/4; product 0.7500620 | True | R02 |
| 18 | `genusMass_eq_rank_two`, parity control | diag(1,3): α₂ = 4 (64, 128, 256 at r = 4, 5, 6), α₃ = 12 | limit 1/4 = 1/\|O\|; product 0.2500116; A₂'s value 1/12 differs | True | none |
| 19 | `genusMass_eq_rank_two`, genus index | diag(1,5): α₂ = 8, α₅ = 20; [[2,1],[1,3]] same densities, other genus | 1/4 each; products 0.2500132 and 0.2500132 | True | none |
| 20 | 1.4a Checks | A₂, diag(1,1), [[4,1],[1,6]], diag(1,3), U | content 2, Δ = −3 = −4·3/4; Δ = −4; content 2, Δ = −23; Δ = −12 = 2²(−3), χ₋₃(2) = −1, factor 3/2; Δ = 1 (split) | True | none |
| 21 | 1.4b Checks | D = −3, −4; trivial character | deleting 2: ×3/2; χ₋₄(2) = 0: ×1; ∏(1−1/p)⁻¹ diverges | True | none |
| 22 | 1.4c local identity | A₂; −23; diag(1,3); diag(1,5) | (1/36)(3/2) = 1/24 = √3/(8·3√3); 1/184 = 1/(8·23); (1/12)(3/2) = 1/8 = 2√3(3/2)/(8·3√3); 1/40 = √20/(8·5√5·2) | True | none |
| 23 | 1.4c class numbers | h(−12); D = 5, 12 | 1·2·(3/2)/3 = 1; N(ε) = −1, so h⁺R⁺ = 1·2R; ε = 2+√3 totally positive, so h⁺ = 2h, R⁺ = R | True | none |
| 24 | 2.1 Checks | ⟨1⟩ over ℤ₂; rank 2 over 𝔽₄ | #𝒢̃(𝔽₂) = 2 vs x² = 1 over 𝔽₂ with 1 point; kernel 4¹ = 4 | True | none |
| 25 | 2.2 Cho density | ⟨1⟩, ⟨2⟩, U, [[1,1],[1,2]] | (1/2)·2^(N−dim O)·#𝒢̃ = β_L, α₂ = 2β_L: 2¹·2 = 4; 2²·2 = 8; 2¹·2 = 4; brute force 8 for [[1,1],[1,2]] | Match | none |
| 26 | 2.2 types | free [[1,1],[1,2]]; [[1,1],[1,0]]; with ⟨2⟩ adjoined | dim B₀/Z₀ = 1 (odd, I^e₁); 0 (I^e₂); bound, so no refinement (Cho line 250) | True | none |
| 27 | 2.3 Checks | A₂, −23 genus, E₈ | 1/12, 3/4; E₈ β₂ = 2⁸(1−2⁻⁴)∏(1−2^(−2i)); without the 2⁸ the result is 256/696729600 | True | none |
| 28 | `bernoulliFullMass`, `evenUnimodularMass_eq` | m = 0, 4, 8 | 0 (division by zero); 1/696729600; 691/277667181515243520000; BG Theorem 3.1 gives twice (proper mass) | True | none |
| 29 | 3.2 recurrence | k = 1; B₃₈ | 1 + 2(−1/2) = 0; B₃₈ = 2929993913841559/6 | True | none |
| 30 | `rank16_classNumber` | the two orders | 1/970864271032320000 + 1/685597979049984000 = M₁₆ exactly | True | none |
| 31 | 4.1 Weyl orders | D₄, E₆, E₇; wrong walls | 192; 72·720 = 51840; 126·23040 = 2903040; θ pairs only with α₂ (E₆) and α₁ (E₇); wrong walls 138240, 6531840 | True | none |
| 32 | `rank24_classNumber` mass sum | 23 rows + Leech | Σ 1/(\|W\|·factor) + 1/\|Co₀\| = 1027637932586061520960267/129477933340026851560636148613120000000 = M₂₄ exactly; 15 rows with D or E | True | none |
| 33 | 4.2 A₁²⁴ Check | 2²⁴·244823040 | 4107449023856640, 3.0675% of M₂₄ | True | none |
| 34 | `rank32/40` bounds; 4.3 rank zero | M₃₂, M₄₀; n = 0 | 2M₃₂ = 80618465.87; 2M₄₀ = 8.786·10⁵¹; 2M ≤ h would read 2 ≤ 1 | True | none |
| P | Pin (R01) | 50 cited Tau Ceti files | 17 at `a91d3aa`, 50 at `2fd255d` | Defect | R01 |

### Headline inventory

- **Stated:** `genusMass_eq`, `genusMass_eq_rank_two`, `evenUnimodularMass_eq`, `rank16_classNumber`, `rank24_classNumber`, `rank32_classNumber_lower_bound` and `rank40_classNumber_lower_bound`.
- **Named as not statable:**
  - 0.1 (no Spin scheme for an arbitrary form);
  - 1.2–1.3 measure identities (no adelic orthogonal measure);
  - 0.1a;
  - 2.1–2.2 (no smooth dyadic model);
  - 0.3 (no spinor-genus carrier).

  Each was checked at both pins.
- **1.4:** the docstring names its comparisons as proof steps of `genusMass_eq_rank_two`, which matches README §1.4.
- **Padding:** none (probe above).

## Not verifiable

- O'Meara, *Introduction to Quadratic Forms*, 104:4–5 (§0.3): the manifest records it as uncertified and settled, so it is cited by its locator only.
- Lean at main's pins: this review's Lean commands run at the branch pins. The restatement on native objects in step 2 of R01's repair was checked against the declarations' source at `2fd255d`, not elaborated.

## Source issues

- none
