# Review of HypergeometricMotives (pull request #1716 at f847e92)

**Verdict:** accepted

A full review of `TauCetiRoadmap/HypergeometricMotives/README.md` (2508 lines) and `TauCetiRoadmap/HypergeometricMotives/Suggested.lean` (998 lines, 135 declarations, 46 admitted theorems) at this head. The gate passes, the dependency check reports no problem, every supplier section cited exists where it is cited, every sampled locator supports the statement it is cited for, and every value I recomputed agrees with the README. Three P3 findings remain; none blocks. No pull-request file was changed.

## Disposition of the previous review's findings

| Previous finding | Passage now and disposition |
|---|---|
| R01, geometric inputs unowned | README:1633–1706, new 5.0 constructs the subquotient, its realizations, comparisons, special fibre, signature and local restrictions from named supplier sections (`MotivesAndAlgebraicCycles` §§4.17, 5.2–5.9, 6.8, 2.6–2.8; `EtaleCohomologyFoundations` F.4–F.6; `ComplexComparisonPartII` C5.1, C5.3–C5.4, C5.6; `ResolutionOfSingularitiesCharacteristicZero` 5.2, 5.5, 6.2–6.4; `DeligneWeightsAndPurity` 4.3; `ArithmeticGaloisRepresentations` 2.4–2.7, 3.1–3.3). All resolved at the open heads (table below). Repaired. |
| R02, reciprocity with 1 ∈ A | README:487–493: reversal carries `(−1)^{m_A}`, `Φ_A(1) = 0` when `1 ∈ A`. Recomputed: `A=[1]` gives `1 − X` and `0`; `A=[2]` gives `X + 1` and `2`. Repaired. |
| R03, p-part as projection | README:538–541 and :1228 (uncancelled prime-to-`p` projections for reduction). Recomputed `([6],[3])`, `p=2`: `A_2=[2,2]`, `B_2=[1,1]`; reductions `Φ_6 ≡ Φ_3 ≡ X²+X+1`. Repaired. |
| R04, degree-zero bounds | README:596 (`d > 0` for rotation 1), :750 (`d > 0`, `p ≤ weight`), :792, :978 (`d > 0` for rank one). Repaired. |
| R05, Levelt converse at d = 1 | README:1032 (`d ≥ 2`), :1042 (`X − Y = X(1 − g_1)`). Recomputed for Legendre: `X − Y = ((0,0),(0,−4)) = X(1−g_1)`, `(1−g_1)X = ((−4,8),(0,0))`. Repaired. |
| R06, bilinear versus Hermitian | README:1067–1070, :1101–1107; `exists_invariantBilinearForm`. Recomputed `B = ((0,1),(−1,0))`: `CᵀBC = B` for both companions, `det B = 1`, `iB` has eigenvalues `±1`. Repaired. |
| R07, generator hypothesis | Suggested.lean:654 `(hω : orderOf ω = qm F)`. Repaired. |
| R08, integrality at t = 0 | README:1486 (`t ∈ F_qˣ`), :1497 (endpoint values `0` and `−1`). Recomputed `A2.2_B4`: endpoint values `0` at `1/4`, `−1` at `3/4`, interior `0,1,−1,0`. Repaired. |
| R09, bad primes at t = 1 | README:1777–1779. Repaired. |
| R10, Newton polygon domain | README:1800 (`WithTop ℝ`, `NewtonPolygons` §2.1). §§0.6 and 2.1 exist on main (`TauCetiRoadmap/NewtonPolygons/README.md:320,512`). Repaired. |
| R11, non-unit Frobenius mod ℓ | README:2051–2055. Recomputed orders `1, 8` and zero part `1`/order `4` at `ℓ = 2, 3, 5`. Repaired. |
| R12, toric variety | README:2261–2290, Suggested.lean:965–996. Recomputed `6` (torus), `9` (completion), `18` (unweighted affine). Repaired. |
| R13, bad Euler factors and poles | README:2109–2138 (all primes, polar divisor retained). Repaired. |
| R14, root-count headline | Suggested.lean:964 `cubic_root_count`. Recomputed `3 = 1 + 2` at `q=11, t=6` and `0 = 1 − 1` at `q=5, t=2`. Repaired. |
| R15, padding | `natDegree_PhiB`, `natDegree_qInf`, `natDegree_qZero`, `hypergeometricSum_degree_one` are absent from Suggested.lean. Repaired. |
| R16, shape | Layer 2 has Examples and Dependencies (README:921–930); 6.3 has Checks (:2290–2305); APIs and Checks present in every numbered section. Repaired. |

## R01 (P3) — The integrality route of 5.5 (ii) uses an unnamed input

**Location:** `TauCetiRoadmap/HypergeometricMotives/README.md:1839–1842`, "the `λ ∈ Λ` are algebraic integers, because their power sums … are integers … (an `ℓ`-adic pole … would contradict integral coefficients)".

**Claim:** Integral power sums of a multiset of `d` complex numbers make them algebraic integers; the parenthesis is the proof.

**Witness:** The step is Fatou's lemma for the rational series `∑_λ λT/(1 − λT)` (a rational power series with integer coefficients has a denominator with constant term `1`), or its `ℓ`-adic form (no pole in the open unit disc of `ℂ_ℓ` for every `ℓ` and every embedding, then "integral iff `|λ|_v ≤ 1` at all finite `v`"). Neither is in Mathlib at the pin (`grep -ril fatou` finds only measure theory), and no target or supplier section is named. The statement itself is true, and the README's own control `Λ = {(3 ± 4i)/5}` shows that purity alone does not give it.

**Repair:** Add the input to 5.5's Needs line as a named target ("Fatou's lemma: a rational power series over `ℚ` with integer coefficients is `P/Q` with `P, Q ∈ ℤ[T]`, `Q(0) = 1`"), with a textbook locator (for example Stanley, Enumerative Combinatorics I, Theorem 4.1.1 and its integrality corollary, or Pólya–Szegő Part VIII, Problem 157), or spell the `ℓ`-adic route with its two inputs. On the instance `Λ = {−1 ± 2i}` (Legendre, `p = 5`) the denominator is `1 + 2T + 5T²` with integer coefficients, as required.

## R02 (P3) — `local_sign_eq_one_of_odd_weight` is multiset algebra with unused hypotheses

**Location:** `TauCetiRoadmap/HypergeometricMotives/Suggested.lean:886–892`, "theorem local_sign_eq_one_of_odd_weight … (hΛ …) (htr …) (hsd …) (hfix …)".

**Claim:** This is a headline about the roadmap's objects.

**Witness:** The conclusion `(−1)^d ∏Λ = p^{wd/2}` follows from `hcard`, `hsd` and `hfix` alone: `λ ↦ p^w/λ` is a fixed-point-free involution of `Λ` (a fixed point would satisfy `λ² = p^w`), so `Λ` splits into pairs of product `p^w`, `d` is even and `∏Λ = p^{wd/2}`. The hypotheses `hΛ` and `htr`, the only ones mentioning `frobeniusTrace`, are unused; `t` is unused. It is a theorem about a free multiset, of the kind the acceptance-test rules exclude.

**Repair:** Delete it from `Suggested.lean` (the README keeps the statement at 5.5), or restate it on the roadmap's object: under `IsSelfDual D t p`, `Odd D.weight` and the proviso, the sign `ε` of `local_functional_equation` is `1`, equivalently `(D.frobeniusPolynomial t p).coeff D.degree = p^{wd/2}`. For Legendre at `5` this reads `coeff 2 = 5 = 5^{1·2/2}`; for the control `Λ = {√5, −√5}` the proviso fails and `coeff 2 = −5`.

A related note, not a finding: `levelt_rigidity_field` (Suggested.lean:414–416) carries `hunit : IsUnit gZero`, which follows from `hrel` (`gInf * gOne * gZero = 1` makes `gZero` a unit of the matrix ring); and `tameConductorExponent_inf`/`_zero` carry `hp : D.IsTame t p`, which the rank identity does not need. Both are harmless.

## R03 (P3) — Citation and attribution nits

Each item is a locator or attribution to correct; none changes a statement.

- `README.md:1201`, "Beukers–Heckman Theorem 5.8, the converse for interlacing-free data": Theorem 5.8 (`beukersheckman1989` lines 558–566) assumes the reflection subgroup is irreducible and characterizes imprimitivity by `{a_j} = a·μ_n` and `{b_j} = b·μ_p ∪ c·μ_q` with `p + q = n` coprime (or the sets exchanged). It is neither about interlacing nor a converse of the rotation-number statement. Cite it for what it says, or drop "converse".
- `README.md:1637`, "canonical toric hypersurface of Roberts–Rodriguez-Villegas (3.1)–(3.3)": (3.1) is the Euler-type family (`rrv2022` lines 249–254); the canonical variety is (3.2) (lines 268–282) and the toric model (3.3) (lines 303–310). Write (3.2)–(3.3). The "equivalently" form is correct: with their gamma sign (positive entries from the denominator, `γ = [−2,−2,1,1,1,1]` for Legendre, lines 210–213) their equation is exactly `(t/M)∏x^{p} = ∏y^{q}` in the roadmap's variables, so the roadmap's `t` is theirs.
- `README.md:131` and `:851`, the LMFDB's "extra clause `d` even": the knowl `hgm.type` (`5315c4fa` line 90) says only "orthogonal or symplectic according as `w` is even or odd". Drop the attribution or attribute the clause to the LMFDB source code.
- `README.md:147,1381`, Mathlib `gaussSum_frob`: at the pin the only declaration of that name is `MulChar.IsQuadratic.gaussSum_frob` (`Mathlib/NumberTheory/GaussSum.lean:236–260`), for quadratic characters. The general Galois action of 4.4 should cite `MulChar.ringHomComp` and `gaussSum_mulShift_eq` only, or name the Tau Ceti pattern.
- `README.md:312`, "`EtaleCohomologyFoundations` §§F.4–F.6 supplies … base change": base change is F.2.1–F.2.4 on main (`TauCetiRoadmap/EtaleCohomologyFoundations/README.md:504–612`); F.4.x is rational realization, F.5 duality, F.6 Gysin and cycle classes.
- `README.md:106`, Gross–Koblitz and Morita's Gamma deferred to the open sibling `CharacterSumsOverFiniteFields` 6.4–6.5: `DirichletPadicLFunctions` §4.5, on main and earlier in the merge order, already owns the Gross–Koblitz formula. Point the deferral there (both may be named).
- `README.md:2500`, Ono: add the locator, Theorem 1, printed p. 1210 (`ono1998` lines 341–343), the prime-field form `₂F₁(λ) = −φ(−1) a_1(p; λ)/p` that Beukers–Cohen–Mellit Theorem 1.2 restates.

## Verified sound

**Gate and order.** The worker's gate at this head: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK`. My run of the dependency check: `depcheck: 204 roadmaps, 1629 edges, 0 problem(s)`, no UPWARD, CYCLE or moved line. The merge order lists HypergeometricMotives at position 87, after its last open supplier EllipticLegendreCharacterInterfaces (86); the other open suppliers are at 14 (ResolutionOfSingularitiesCharacteristicZero), 23 (LFunctions), 38 (ComplexComparisonPartII), 41 (ArithmeticGaloisRepresentations), 69 (MotivesAndAlgebraicCycles), 75 (DeligneWeightsAndPurity); ClassicalArithmeticCompletion, ThetaSeries, NewtonPolygons, EtaleCohomologyFoundations, ModularCurves are on main, Chebotarev, PolynomialGaloisGroups, NumberFieldArithmetic and HodgeStructures are completed. The diff outside the roadmap folder is empty; the folder holds only `README.md`, `Suggested.lean`, `metadata.toml`.

**Lean.** `lake env lean` on `Suggested.lean` (pins: Mathlib `f6090c70`, Tau Ceti `358314d`) finishes with exactly 46 `declaration uses 'sorry'` warnings and no error. A scratch copy with `#check @name` for all 135 declarations elaborates with no error; I compared each type with its README statement. The ten binder leads of the worker's signature report are `[DecidableEq F]` and `[Fintype F]` instance arguments on definitions whose types do not mention them (`gaussSumPow`, `katzSum`, `hypergeometricSum`, `katzExpSum`, `greeneF`, `cubicDatum`, …); every theorem that needs `[Fintype F]` carries it, and no mathematical hypothesis is lost. The one-tactic probe (each admitted theorem tried with `simp; done`, `rfl`, `infer_instance`, falling back to `sorry`) leaves all 46 admitted. The file has the single `import Mathlib`, no `set_option`, `theorem` only, no `#eval`, and no sorry'd data: `primitiveData`, `hypergeometricSumRat` and `frobeniusSum` are `Classical.epsilon` of a stated property with existence headlines (`frobeniusSum_primitiveData`, `hypergeometricSumRat_spec`, `frobeniusSum_spec`). The module docstring names the six headlines that are not statable (Katz trace identification, Fedorov, the sign `ε_p`, the all-prime local comparison, the L-card, Theorem 1.5) and what each lacks; all other README headlines are stated: 1.3 `exists_unique_of_isGaloisStable`, 1.4 `gamma_defining_identity`, `gamma_unique`, `pochhammer_identity`, 1.8 `rotationNumber_eq_gcd`, 2.3–2.8 `weight_eq_sSup_sub_sInf`, `hodgeNumber_symm`, `even_weight_iff`, `two_mul_hodgeTwist`, `hodgeTwist_eq_neg_minHeight`, `even_degree_of_odd_weight`, `weight_eq_zero_iff_interlace`, 3.1 `rank_companion_pow_sub_one`, 3.4 `levelt_rigidity_field`, `levelt_irreducible_field`, 3.5–3.9 `exists_invariantForm`, `exists_invariantBilinearForm`, `signature_invariantForm`, `finite_hypergeometricGroup_iff(_weight_eq_zero)`, `det_bezout`, `card_bezoutModule`, `isImprimitive_of_rotationNumber`, 4.3–4.12 `katzExpSum_eq`, `hypergeometricSum_galois`, `katzSum_shift`, `hypergeometricSum_swap`, `hypergeometricSumRat_spec`, `gammaVectorSum_eq_hypergeometricSum`, `frobeniusSum_spec`, `frobeniusSum_integral`, `frobeniusSum_swap`, `frobeniusSum_primitiveData`, `greeneF_eq_katzSum`, 5.1–5.9 `frobeniusTrace_integral`, `frobeniusPolynomial_of_isPure`, `frobeniusPolynomial_int_of_isPure`, `abs_coeff_frobeniusPolynomial_le`, `local_functional_equation`, `tameConductorExponent_inf/_zero`, 6.1–6.3 `legendre_point_count`, `cubic_point_count`, `cubic_root_count`, `weighted_torus_point_count`. Every backticked name of the roadmap's own in the README is declared (gate `readme-ids-missing=0`, and I grepped the 60 names used in prose).

**Supplier citations resolved** (every round, at main or the open head named by the brief):

| Citation | Where found | Supports the use |
|---|---|---|
| ClassicalArithmeticCompletion 2.46, 2.60 | main `README.md:4036, 4474`: `Polynomial.companion`, `leftMulMatrix_root_eq_companion`, `det_companion`, `minpoly_companion`, `hasEigenvalue_companion_iff`; `charpoly C(f) = f` | yes, same orientation (subdiagonal ones, `−coeff` last column) |
| ClassicalArithmeticCompletion 7.12, 7.29 | `:14605` Stickelberger valuation; `:15058` Hasse–Davenport product with `χ(n)ⁿ`, trivial factor excluded, `p = 2` sign as a separate step | yes; the exponent form at README:227 is this identity with `χ = ω^m` |
| ClassicalArithmeticCompletion 1.19, 1.36, 1.46, 1.53 | `:945, 1410, 1632, 1865` cubic/quartic Gauss and Jacobi sums | yes |
| EllipticLegendreCharacterInterfaces 0.1, 5.1 | head 2b50d7a `README.md:65, 592`: `legendre λ` with coefficients `(0, −(1+λ), 0, λ, 0)`; `pointCount = q + 1 + ∑ quadraticChar(f(x))` for `a₁ = a₃ = 0`, odd characteristic | yes |
| ModularCurves 4C | main `:1100–1108`: Legendre problem over `ℤ[1/2]`, universal curve `y² = x(x−1)(x−λ)` over `ℤ[1/2][λ, 1/λ(λ−1)]` | yes |
| Chebotarev Layer 4 | completed `:205` "cyclotomic Galois characters" | yes |
| LFunctions Layer 0 | main `:346–392`: `ArithmeticLFunctionData`, gamma shifts, root number, polar divisor | yes |
| ThetaSeries 2H | main `:563–574`: `kroneckerSym`, `kroneckerChar D` for `D ≡ 0,1 (mod 4)` | yes |
| DeligneWeightsAndPurity 0.1–0.2, 4.3 | head 6045677 `:561, 601, 1365` | yes |
| HodgeStructures Layers 0–2 | completed `:271ff` (L0 pure Hodge structures, …) | yes |
| MotivesAndAlgebraicCycles 2.6–2.8, 4.17, 5.2–5.9, 6.8 | head 04e21d3 `:416, 434, 449, 873, 974–1088, 1228` (compact support, Nori category and realization, extending fibers) | yes |
| ArithmeticGaloisRepresentations 2.4–2.7, 3.1–3.3 | head 2194655 `:1807, 1903, 2009, 2086, 2498, 2583, 2652` (Weil–Deligne adapter, local factor `det(1 − X r(F) | (ker N)^{I})`, local constants with `ψ`, `dx`, Swan and Artin conductors) | yes |
| NewtonPolygons 0.6, 2.1 | main `:320, 512` (`FiniteSlopeData`, singleton at length 0, `∞` outside; coefficient polygons) | yes |
| EtaleCohomologyFoundations F.4–F.6 | main `:850–1108, 1179, 1200` | yes (base change is F.2.x, R03) |
| ComplexComparisonPartII C5.1, C5.3–C5.4, C5.6 | head decea61 `:2336, 2893, 3015, 3722` | yes |
| ResolutionOfSingularitiesCharacteristicZero 5.2, 5.5, 6.2–6.4 | head caddfb3 `:802, 842, 894, 914, 936` (embedded resolution, SNC compactification) | yes |

**Library declarations opened at the pins.** Mathlib: `gaussSum_mul_gaussSum_eq_card`, `gaussSum_mulShift_eq`, `star_gaussSum_eq`, `gaussSum_one_one` (`NumberTheory/GaussSum.lean`), `jacobiSum_eq_gaussSum_mul_gaussSum_div_gaussSum`, `gaussSum_pow_eq_prod_jacobiSum`, `jacobiSum_ringHomComp`, `jacobiSum_comm`, `MulChar.sum_eq_zero_of_ne_one` (`JacobiSum/Basic.lean`), `MulChar.exists_mulChar_orderOf_eq_card_units` (`MulChar/Lemmas.lean:173`), `MulChar.ringHomComp` (`MulChar/Basic.lean:454`), `cyclotomic_expand_eq_cyclotomic`, `cyclotomic_mul_prime_pow_eq` (`Cyclotomic/Expand.lean:156`), `cyclotomic_eq_prod_X_pow_sub_one_pow_moebius` (`Cyclotomic/Basic.lean:423`), `cyclotomic_coeff_zero` (`:533`), `eval_one_cyclotomic_prime_pow`, `eval_one_cyclotomic_not_prime_pow` (`Cyclotomic/Eval.lean`), `AddCircle.addOrderOf_div_of_gcd_eq_one`, `addOrderOf_coe_rat` (`AddCircle/Defs.lean:617`), `Nat.filter_coprime_Ico_eq_totient` (`Totient.lean:78`), `IsCyclotomicExtension.Rat.galEquivZMod`, `IsPrimitiveRoot.pow_of_coprime` (`PrimitiveRoots.lean:190`), `Polynomial.resultant`, `sylvester`, `resultant_eq_prod_roots_sub`, `resultant_ne_zero`, `discr` and `discr_of_degree_eq_two` (`Resultant/Basic.lean:51, 131, 402, 629, 935, 957`), `natDegree_multiset_prod_of_monic` (`BigOperators.lean:204`), `Multiset.prod_X_sub_C_coeff` (`Vieta.lean:101`), `charpoly_leftMulMatrix` (`Charpoly/Minpoly.lean:73`), `AdjoinRoot.powerBasis'` (`AdjoinRoot.lean:737`), `Polynomial.Splits` (`Splits.lean:35`, the map-free form the file uses), `Submodule.smithNormalForm`. Mathlib has no companion matrix, no Bézout matrix and no finite hypergeometric sum at the pin (`grep` for `def companion`, `ezout` in `RingTheory/Bezout.lean` is the Bézout-ring notion). Tau Ceti: `WeierstrassCurve.pointCount` and `pointCount_eq_card_point` (`AlgebraicGeometry/EllipticCurve/PointCount.lean:69, 86`, the latter with `[Finite …] [W.IsElliptic]`), `TauCeti.Hodge.HodgeStructureOn.hodgeNumber_symm` (`Geometry/Hodge/Dimension.lean:88`), `gaussSumOfPrimitiveRoot`, `map_gaussSumOfPrimitiveRoot` (`DirichletCharacter/GaussSum.lean:106, 130`), `IsCyclotomicExtension.card_aut_eq_totient` (`Cyclotomic/Aut.lean:53`), `EulerProductData`, the module `NumberTheory/Chebotarev/GaloisCharacter/Cyclotomic/Basic.lean`; no hypergeometric datum or sum (only the probability distribution and the regularized function, as the README says).

**Ownership against open work.** `roadmaps grep` over all open pull requests and main for hypergeometric motives, sums, data and groups, Levelt, Beukers, Bézout matrix/module and Greene finds no other owner; the only overlap is Gross–Koblitz (DirichletPadicLFunctions §4.5, R03). The LMFDB family record for `A2.2_B1.1` (API, cached `3c547c8e`) gives `hinf = ((0,−1),(1,−2))`, `h0 = ((2,1),(−1,0))`, `bezout = ((4,0),(0,−4))`, `famhodge = (1,1)`, `weight 1`, `imprim 1`, `variety_dim 3`, which are exactly the README's `C((X+1)²)`, `C((X−1)²)⁻¹`, the Bézout matrix of 3.8, the Hodge vector and `κ = 3`.

**Sources at the sampled locators** (cache ids: `bcm2015` = e6de6b7e, `rrv2022` = 82247890, `beukersheckman1989` = ba23f843 GDZ scan, `greene1987` = 6c504ae1, `ono1998` = 18567454, `fedorov2018` = d8a26478, `qian2021` = 4110023d, knowls `hgm.type` 5315c4fa, `hgm.hodge_vector` 37bc16e3, `hgm.defining_parameters` d34a4980, `hgm.defining_parameter_ppart` 71f5dca8, `hgm.local_discriminant` f99b41e2, Sage source f656dd55):

| Target | Source passage | Result |
|---|---|---|
| 1.2 Cyclotomic data | `hgm.defining_parameters` line 90–96: disjoint multisets of positive integers, equal totient sums, `α` from `A` with representatives in `(0,1]` | agrees |
| 2.6 Second parity law, type | `hgm.type` line 90; original deduction checked on 1531 data | agrees (clause "`d` even" not in the knowl, R03) |
| 2.7 Swap, shift, scaling | original deduction; checked on 1531 data and the non-cyclotomic example | agrees |
| 2.9 Hodge polygon, special vector | `rrv2022` lines 898–909 (`h^{w/2,w/2}` drops by 1; two central numbers drop by 1), `hgm.hodge_vector` line 95; `NewtonPolygons` §0.6 | agrees |
| 3.1 Companion matrices | ClassicalArithmeticCompletion 2.46/2.60 (above) | agrees |
| 3.4 Levelt | `beukersheckman1989` lines 280–300 (Prop 3.3, Thm 3.5: `h_∞ = A`, `h_0 = B⁻¹`, `h_1 = A⁻¹B`, conjugacy); `qian2021` lines 628–666 (`γ_0 ↦ B⁻¹`, `γ_∞ ↦ A`, `γ_1 ↦ BA⁻¹` with one nontrivial column) | agrees; the field form is the roadmap's, as stated |
| 4.5 Rationality | original deduction from 4.4; `bcm2015` lines 404–406 (`S_q ∈ ℚ(ζ_{q−1})` when `∑(α_i − β_i) ∈ ℤ`) | agrees |
| 4.10 Swap at traces | `bcm2015` lines 488–491 (Thm 3.5) and 131–143 (Thm 1.3) | agrees |
| 4.11 Kummer pullback | Katz 1990 unreadable; identity verified by computation | agrees numerically |
| 5.1 Frobenius trace | `bcm2015` lines 76–86 (Def 1.1), `rrv2022` lines 38, 89, 142–147 ((1.3), (1.7), (2.2)); LMFDB API `A2.2_B1.1_t2.1`: `a_5 = −2`, `a_13 = 6`, conductor 32; `A2.2_B1.1_t1.2`: `a_5 = 2`, `a_13 = −6`, conductor 64 | agrees |
| 5.5 Purity consequences | `rrv2022` lines 1017–1036 ((11.1), duality `a_{p,e} = ε(p) a_{p,n−e} p^{(n−2e)w/2}`, `ε = 1` for odd `w`) | agrees |
| 5.6 Acceptance Euler factors | recomputed (below): `F_3, F_5, F_7` of `A2.2.2.2_B1.1.1.1` at `t=−1` and the five displayed coefficients at 7 of `A6.4.4.3_B12.2.2.2.1` at `t=2`; Sage test file not fetched | agrees |
| 5.7 Archimedean shifts | `rrv2022` lines 1171–1177 ((12.2), `h^± = (h^{w/2,w/2} ± (−1)^{w/2}σ)/2`) | agrees |
| 5.10 Local invariants | `rrv2022` lines 1261–1282, 1323–1327 ((13.1), degree `n − c_p`, (13.2) conjectural); ArithmeticGaloisRepresentations 2.5, 3.2 | agrees |
| 6.1 Ono | `bcm2015` lines 104–108 (Thm 1.2, odd `q`, `λ ≠ 0,1`, sign `(−1)^{(q−1)/2}`); `ono1998` lines 341–343 | agrees |

Also read: Thm 1.3 and Assumption 1.4 (lines 131–146), Thm 1.5 (152–167, `gcd = 1`, `Mλ ≠ 1`), Cor 1.6 (172–175), Cor 1.7 (185–188), Thm 2.5 (319–324), Prop 2.6, Lemma 2.7 (332–350), the Katz sum (373–377), Prop 3.1 (386–388), Thm 3.3 (435–440), Thm 3.4 (470–478), Thm 4.2 (573–578), Prop 4.3 (617–626, hypothesis `gcd = 1` only), Def 5.1 (701); BH Thm 4.3 (355–359, inversion-stable parameters), Thm 4.5 (399–407, `|p − q| = |∑(−1)^{j+m_j}|` with `α, β ∈ [0,1)` sorted), Def 4.6, Cor 4.7, Thm 4.8 (444–475); Greene Def 2.4 (`(A over B) = B(−1)/q · J(A, B̄)`, line 125), Def 3.5, Thm 3.6, Def 3.10, Thm 3.13 (189–232); Fedorov Thm 1 (line 152, `h^p = #{k : ρ(k) = p}`, `ρ(k) = #{j : α_j < β_k} − k`); RRV §2 (lines 170–241: `q_0 = ∏(T − e^{−2πiβ})`, `h_0` its companion, `γ` sign, `Q(0) = det h_1`), §3 (243–391), §4 (392–467: primitive subspace, image in `H^κ(X̄)`, Tate summand, twist `j`), §10 (970–998); Sage `cyclotomic_to_gamma` (positive entries from the numerator, line 341–373, the README's sign), `padic_H_value`'s `D = −min zigzag = (w + 1 − m[0])/2` (1435–1436), `sign` (1602–1644) with `_sign_param` (494–504), which is the README's four-case discriminant recipe.

**Adversarial pass.** Exact arithmetic except Gauss sums (double precision; every value recognised as a rational with denominator at most `q²`, imaginary parts below `10⁻⁸`). "Agrees" means the computed instance matches the README; it is evidence, not a proof.

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| 1.1 representatives, `N` | `α={1/2}, β={0}`; `({1/4,3/4},{1/2,1})` | `rep 0 = 1`, `rep0 0 = 0`; `N = lcm(4,4,2,1) = 4` | agrees |
| 1.2 `Φ_A`, constant terms | `A=[2,2]`, `[1,1]`, `[1]`, `[4]`, `[2,1]` | `(X+1)²`, `(X−1)²`, `X−1`, `X²+1`; `Φ(0) = 1,1,−1,1`; `X²+1 − (X²−1) = 2` | agrees |
| 1.3 dictionary | `[4]`, `[6]`/`[3]` under `u=5`, `[10,6,3,2]`/`[14,1,1,1]` | `{1/4,3/4}`; `1/6 ↦ 5/6`; `lcm = 210`, `d = 9` | agrees |
| 1.4 `γ`, `M`, Pochhammer | 16 data; `n = 1,2,3` on 5 data | `[−1⁸,2⁴]`, `M = 256`; `[−15,−10,−6,1,30]`, `M = 1007769600000`; `([1],[2])`: `[−2,1,1]`, `M = 1/4`; identity `2, 8/3, 16/5` for `([1],[2])`, `1/4, 9/64, 25/256` for Legendre, all 15 equal | agrees |
| 1.5 reversal, `Φ_A(1)` | `[1]`, `[2]`, `[1,1]`, `[2,2]` | `1−X`/`0`; `X+1`/`2`; `+`/`0`; `+`/`4` | agrees |
| 1.6 wild primes | Legendre; `([6,4,4,3],[12,2,2,2,1])` | `{2}`; `{2,3}` | agrees |
| 1.7 `p`-parts | `([6],[3],2)`; `([18,12],[8,3,2,1,1,1],2)`, `(…,3)`; Legendre at 3 | `([2,2],[1,1],∅)`; `([4,4,2⁵],[8,1⁵],[2])`; `([9,3],[1⁸],[3])`, prime-to-2 cancelled `([9,3],[1⁸])`, uncancelled `([9,3,3],[3,1⁸])`; `(∅,∅,[1,1])` | agrees |
| 1.8 rotation number | `([4],[2,1])`, `([9],[3,3,1,1])`, `A2.2.2.2`, Legendre; `α`-only control | stabilizer orders `2,3,1,1` = gcd of `γ`; control `2` versus true `1` | agrees |
| 1.9 primitive datum | `([4],[2,1])`, `([9],[3,3,1,1])` | `γ/2 = [−1,−1,2]` = `([2],[1])`; `([3],[1,1])` | agrees |
| 1.10 interlacing | Bober, Legendre, `({1/4,3/4},{1/2,1})` | true; false (`Z(1/2) = 2`); true | agrees |
| 2.1 walk, block form | Legendre, `A2.2_B4`, `({1/2},{1})` | heights `0,1,2,1,0` → `{0,1}`; `0,−1,0,1,0` → `{−1,0}`; `Z(1/2)=1, Z(1)=0` | agrees |
| 2.2–2.8 laws | all 1531 ordered cyclotomic data with entries `≤ 10`, `|A| ≤ 3`, `d ≤ 6` | block = walk, `∑h = d`, no interior zero, palindrome, both parity laws, `2δ + m_A + m_B = w+1`, `δ ≥ 0`, `δ = −m` for `1 ∉ A`, `δ(swap) = δ`, swap reverses `h`, `w = max Z − min Z − 1`, `w = 0 ⟺` interlace: 0 violations | agrees |
| 2.2 Hodge vectors | 12 worked data | `(1,1)`, `(1,1,1,1)`, `(1,1)` with `m = −1`, `(8)`, `(1,2,3,2,1)`, `(2,6,2)`, `(2,2)`, `(1,2,2,2,1)` from `−2,−1,−1,0,0,1,1,2`, `(2)`, `(3,3)`, `(2,1,2,2,1,2)`; `δ = 0,0,1,0,1,0,0,2,0,0,3` | agrees |
| 2.7 non-cyclotomic swap | `({1/10,1/5,1/2},{3/10,3/5,7/10})` | `(1,2)` ↦ `(2,1)` | agrees |
| 2.9 polygon, special vector | `(1,1,1,1)`, `(1,2,3,2,1)`, `(8)`, Legendre | vertices `(0,0),(1,0),(2,1),(3,3),(4,6)`; special `(1,0,0,1)` sum 2; `(1,2,2,2,1)` sum 8, end `(9,18)`; `(7)`; `(0,0)` | agrees |
| 3.1 rank formula | `C(X+1)`, `k = 1,2`; `C((X−1)²)` | ranks `1, 0`; `rank(C−1) = 1` | agrees |
| 3.2/3.4 Levelt triple | Legendre | `h_∞ = ((0,−1),(1,−2))`, `h_0 = ((2,1),(−1,0))` (= LMFDB record), `X − Y = ((0,0),(0,−4)) = X(1−g_1)`, `(1−g_1)X = ((−4,8),(0,0))`, `rank(g_1−1) = 1`, `det g_1 = 1` | agrees |
| 3.5 invariant form | Legendre `B = ((0,1),(−1,0))`; `([1],[2])` | `CᵀBC = B` for `h_∞`, `h_0`; `det B = 1`; `iB` eigenvalues `±1`; `(1)` symmetric | agrees |
| 3.6 defect | `([2],[1])`, Legendre, `A2.2.2.2`, Bober, `([1],[2])`, `([4],[2,1])` | `1, 0, 0, 8, 1, 2` (`= d` exactly in the weight-0 cases) | agrees |
| 3.8 Bézout | `X+1, X−1`; `A6.4.4.4.3_B10.2.2.2.2.2.2`; 6 random monic pairs `d ≤ 4`; generating function at 2 points; Legendre | `(−2) = Res`; `det = −191102976 = (−1)^{45}·191102976`, `Res = +191102976 = 2^{18}3^6`, Smith `1,1,1,1,2,2,16,16,432,432`; all 6 identities; both points; `((4,0),(0,−4))` = LMFDB | agrees |
| 3.9 imprimitivity | `C(X²+c)` | `e₁ ↦ e₂`, `e₂ ↦ −c e₁` | agrees |
| 3.10 reduction | `([6],[3])` mod 2 | uncancelled prime-to-2 projections `([3],[3])`, both `X²+X+1` | agrees |
| 4.3 `H_q`, Gauss sums | Legendre `q=5`, `t=2,3`; `q=13`, `t=2,7`; `([1],[2])` `q=5`; `g(0)`, `g(m)g(−m)` | `−2, 2`; `6, −6`; `0,−1,1,−1 = φ(t(t−1))`; `g(0) = −1`, `g(m)g(−m) = ω(−1)^m·5` | agrees |
| 4.5 rationality | `({1/4},{0})`, `q=5`; Legendre under `ω^u`, `ψ^c` | `0, −1, i, −i`; all eight choices give `−2` | agrees |
| 4.6 shift, swap | `𝔽_5`, `a={0}`, `b={2}`, `μ=1`, `t=2`; `t=0`; Legendre swap | both `−2.236 = −√5`, printed factor `+√5`; `0` versus `−√5/4`; `−2 = −2` | agrees |
| 4.7 gamma form | `A2.2_B4` `q=3,11,5`; gamma = Def 1.1 on Legendre `q=5,13`, `A2.2.2.2` `q=3,5,7,13`, `A3_B1.1` `q=7`; `A3_B1.1` `q=5`; `A6.4.4.3` `q=7` | `−2/3`, `−6/11`, `0`; equal in all 7 cases; `H(2,3,4) = −3, 0, 3`; `−6/49` | agrees |
| 4.8 Landau | `A2.2_B4`, Legendre, Bober, `A6.4.4.3` | interval values `0,1,−1,0`, endpoints `0` at `1/4`, `−1` at `3/4`, `λ = 1`; `0,2,0`, `λ = 0`; `0`; `2 = δ` | agrees |
| 4.9 integrality | `A6.4.4.3`, `t=2`, `q=5,7,11,13`; `A2.2.2.2` | `q²H = −10, −6, −82, 6`; `12, −16, −4` | agrees |
| 4.11 Kummer | `([4],[2,1])` `q=5,13`; `([9],[3,3,1,1])` `q=19`; all `t ∈ Fˣ` | identity holds at every `t` (zero when `t` is not an `r`-th power) | agrees |
| 4.12 Greene comparison | `q=5,7`, `n=1`, `(a;b) ∈ {(1,2;3),(2,3;1),(1,3;2)}`, every `x` with `S_q ≠ 0`; control `a=(1,3)`, `b=(0,3)`, `x=2`, `q=7` | ratio `1.0` in all 20 cases; control ratio `−0.07+0.37i` | agrees |
| 5.1 traces | Legendre `q=5,25`; `A2.2_B4` `q=3,9`; `A2.2.2.2` `t=−1`, `q=3,5,7,13`; `t=2, 1/2` at `5,7`; LMFDB API | `−2, −6`; `−2, −2`; `0,−4,0,−84`; `12,−16` and `−12,−16`; API `a_5 = −2` (t2.1), `+2` (t1.2) | agrees |
| 5.2/5.6 Euler factors | `A2.2.2.2` `t=−1`: `a_9 = −12`, `a_25 = 276`, `a_49 = −476`; `A6.4.4.3` at 7: `a_7 = −6`, `a_49 = 666`, `a_343 = 307224`, `a_2401 = −4833646` | `coeff 2 = 6, −130, 238` (= `F_3, F_5, F_7`); `coeff 2 = −315 = −45·7`, `coeff 3 = −104370 = −2130·7²`, `coeff 4 = 643468 = 268·7⁴` | agrees |
| 5.4 Newton polygon | `F_3 = 1 + 6T² + 729T⁴` | valuations `0,·,1,·,6`, slopes `1/2,1/2,5/2,5/2`; roots satisfy `|T|² = 1/27` | agrees |
| 5.5 purity, duality | Legendre `p=5`; `A2.2.2.2` `F_5`; controls | `Λ = −1±2i`, `|λ| = √5`, sums `−2,−6`, `ε = 1`; `coeff 3 = 4·5³ = 500`, `coeff 4 = 5⁶`; `{±√5}`: `F = 1−5T²`, `ε = −1`; `{(3±4i)/5}` rational sums, non-integral | agrees |
| 5.8 determinant | `A4_B2.1`, `t=−8`, `p=5` | `a_5 = 0`, `a_25 = 2`, `F_5 = 1−T²`, `ε = −1`; `Disc = −4·72`, `d₀ = −2`, `(−2/5) = −1 = (−1)^2 ε`; Sage recipe = README's four cases | agrees |
| 5.9 tame exponents | `A4.2.2_B3.1.1`, `p=7`, `t = 7³, 7, 7⁻⁴, 7⁻², 7⁻¹`; Legendre `t=−3`, `p=3` | `c = 1,3,1,3,4`, degrees `3,1,3,1,0`; `rank(h_0 − 1) = 1` | agrees |
| 5.11 semisimple orders | `1+2T+5T²` at `ℓ = 2,3,5`; `1`; `1+5T²` at 5 | radical `X+1`, order 1; order 8; zero part 1, invertible order 4; `1`; zero part 1, order 1 | agrees |
| 5.12 discriminant | `1+2T+5T²` | `disc(X²+2X+5) = −16`, field `ℚ(i)`, `−4` | agrees |
| 5.7 shifts | `(1,1),σ=0`; `(1,2,3,2,1),σ=1,−3`; `(2,6,2),σ=2` | `μ=∅,ν={1/2}`; `{0},{2,1,1,0}`; `{1,1,1},{2,1,1}`; `{0,0},{1,1,0,0}`; `card μ + 2 card ν = d` in all | agrees |
| 5.0 Checks | `([1],[2])`, `t=9/8`; `j = (κ−w)/2`; Legendre at `t=2` | chart `x+y=1`, `xy=2/9`: `(1/3,2/3)`, `(2/3,1/3)`; `j = min(r,s)−1−δ = 1, 1, 3, 0` for Legendre, `A2.2_B4`, `A2.2.2.2`, `([1],[2])`; `y²=x(1−x)(x−2) ≅ y²=x³−x`, LMFDB conductor 32 (API), `t=1/2`: 64 | agrees |
| 6.1 Ono | `(q,λ) = (5,2),(13,2),(13,7),(7,2),(7,3)`; all `λ ∉ {0,1}`, `p ∈ {5,7,11,13,17}` | counts `8, 8, 20, 8, 4`, `H = −2, 6, −6, 0, −4`; identity in every case | agrees |
| 6.2 cubic, root count | `q=5`, `λ=1,2,4`; all `λ` for `q=5,7,11,13`; roots `(11,6)`, `(5,2)`, all `t` for `q=5,7,11,13` | `9,3,6 = 6 − H(27λ)`, `H = −3,3,0`; all; `3 = 1+2`, `0 = 1−1`; all (also `N = 2 = 1 + H` at `t = 1`) | agrees |
| 6.3 torus | `p=(3)`, `q=(1,1,1)`: `𝔽_5` `λ=1`, `𝔽_2`, `𝔽_3` `λ=1,2`, `𝔽_7` `λ=3`; `(2),(2)`; `(1),(1)`; four other exponent lists | `6 = 16/5 + 56/20`, completion `9`; `1 = 1/2 + 1/2`; `0, 3` (characteristic dividing an exponent); `9`; `1` at `λ=1`, `0` at `λ=2`; `1, 0`; `𝔽_2`: `1`; unweighted affine `18`; all formula values equal | agrees |

**Shape.** Every numbered section has a definition with an API list and at least three discriminating Checks (including negative controls), theorems carry their hypotheses and a locator, every layer ends with Examples and Dependencies, cross-roadmap citations name sections, no pull-request numbers or process words (gate `prnum=0`, `round-labels=0`, `residue=0`), mathematics in Unicode.

## Not verifiable

- **Katz 1990** (8.2.7, 8.2.1, §5.6, Theorems 8.4.2, 8.8.1–8.8.2) and **Katz 1996**: monographs, no legal text found by the service. The sum identities were checked against Beukers–Cohen–Mellit and by computation; the trace identification and local monodromies of 5.0 rest on the citation.
- **Levelt 1961** (thesis): not found; the theorem was read in Beukers–Heckman Theorem 3.5, which attributes it there.
- **Watkins 2015** (Magma notes, determinant recipe): not found; read in Sage's public source instead, whose `sign` cites Watkins §11.1.
- **Jouve–Rodriguez Villegas 2014**: the arXiv text (97429203) is cached but the README cites it for context only; not checked line by line.
- **LMFDB knowls** `hgm.levelt_matrices`, `hgm.zigzagplot`, `hgm.rotation_number`, `hgm.good_prime`, `hgm.monodromy`, `hgm.bezout_module`: the host returned a browser-check page; the five other knowls and the family/motive API records were readable. The Levelt matrices and Bézout matrix of the family record agree with the README.
- **Bulk LMFDB and enumeration claims**: the 541/231/438 good-pair convention counts, the 53 tame pairs and 24 contradictions, the 131 orthogonal pairs, the 612 sign cases, the 1593/3186/5192 data enumerations and the 22526 Greene cases were not reproduced; my own enumeration is the 1531-data check above, with 20 Greene cases.
- **Sage test suite** value `test_good_euler`: not fetched; the first five coefficients `1, 6, −315, −104370, 643468` of the degree-8 factor at 7 were recomputed from traces at `7, 49, 343, 2401`, so the displayed half of that factor is verified in full.
- The six headline theorems named in the module docstring as not statable (Katz's trace identification, Fedorov, `ε_p`, the all-prime comparison, the L-card, Theorem 1.5) are plans; numerical agreement of traces is not a verification of the geometric construction of 5.0.

Texts that could not be read are listed in the scratch `needs-references.toml`; the review is complete without them.

## Source issues

- **Gap** in bcm2015 at Corollary 1.7, printed p. 4: the source says the point count identity holds for every `λ ∈ 𝔽_q`; it should require `λ ≠ 0` (and its proof through Theorem 1.5 also `27λ ≠ 1`), since at `λ = 0` the curve is two lines with `2q` projective points while the right side is `q + 1 − 1/(1−q)`; affects a stated result.
- **Gap** in bcm2015 at Theorem 3.3, printed p. 10: the source says `q^λ H_q(α, β | t)` is an algebraic integer with no condition on `t`; it should require `t ∈ 𝔽_qˣ`, as its proof through Proposition 3.1 does, since at `t = 0` the sum is `1/(1−q)` (Legendre, `q = 5`: `−1/4`); affects a stated result.
- **Error** in bcm2015 at Theorem 3.4, printed p. 11: the source says the shift multiplier is `ω(t)^{μ(q−1)}`; it should be `ω((−1)^d t)^{μ(q−1)}` (over `𝔽_5` with `α = {0}`, `β = {1/2}`, `μ = 1/4`, `t = 2` the printed factor gives `+√5` against `−√5`); affects a stated result.
