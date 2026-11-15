# Review of EllipticCurveModularity (pull request #1018 at 3593d3b)

**Verdict:** needs changes

Previous findings (review of `c45ecff`), checked first:

- R01 — repaired: `Suggested.lean:91-93` concludes `Function.Bijective (Int.castRingHom (TauCeti.AlgebraicGeometry.AbelianVariety.End A))`; README 470-471 "the canonical ring map `ℤ → End_ℚ(E)`, `n ↦ [n]`, is bijective". Gate `statement-hygiene=0`.
- R02 — repaired: `## References` is the last section (README 1989), after `## Downstream consumers` (1965), with entries for Silverman, Miyake, Milne, Ribet–Stein, Barrios, Darmon–Diamond–Taylor, González-Jiménez–Lario, Serre 1970 and Brumer–Kramer (2037-2084).
- R03 — repaired: `LFunction_LSeriesSummable` at `Suggested.lean:148` and README 1817, 1892, 1928; no `lCoeff_LSeriesSummable` remains.

## R01 (P2) — The conductor comparison of R29.4 is a second owner of supplier statements

**Location:** `TauCetiRoadmap/EllipticCurveModularity/README.md:1270-1275`: "Prove that v_ℓ(N_E) equals the Artin conductor exponent a_ℓ(V_r(E)) for every pair of distinct rational primes ℓ,r … For `WeierstrassCurve.IsSemistable ℤ E`, prove that this integer agrees with the squarefree product of bad primes."

**Claim:** Both assertions are targets proved in this layer.

**Witness:** NeronModelsAndSemistableAbelianVarieties §5.3a: "Prove that `a(V_ℓE) = f(E)` for every `ℓ ≠ p`", with `N_E := ∏_v 𝔭_v^{f(E_{F_v})}`; §5.3g: "`v_p(N_E) = 1` iff the reduction is multiplicative". README 245-247 already lists these as supplied; EllipticCurves Layer 8 (on main) owns the semistable comparison.

**Repair:** Replace lines 1268-1281 by: "**Conductor specialization.** For every elliptic E over ℚ, define N_E to be the positive generator of the conductor ideal of NeronModelsAndSemistableAbelianVarieties §5.3a. That section supplies `v_ℓ(N_E) = a_ℓ(V_r(E))` for all primes ℓ ≠ r, wild ramification at 2 and 3 included, once the restriction of `V_r(E)` to a decomposition group at ℓ is identified with the Tate module of `E` over ℚ_ℓ (ArithmeticGaloisRepresentations §§3.3 and 6.1); that identification is the target here. Its §5.3g supplies `ℓ ∣ N_E` exactly at bad primes and `v_ℓ(N_E) = 1` exactly at multiplicative primes, so for `WeierstrassCurve.IsSemistable ℤ E` the conductor is the product of the bad primes; the comparison with the conductor assembled from the 0/1 exponents of EllipticCurves Layers 4 and 4.5a is the semistable algorithmic–Artin milestone of EllipticCurves Layer 8, cited and not proved here." In the R29.4 `*Needs:*` line (1424) replace "§5.3i" by "§§5.3a, 5.3g and 5.3i". Tested on 11a1 (§5.3a Check: `f_11 = 1`, `N_E = 11`) and on `y² = x³ − x` (`f_2 = 5`, `N_E = 32`, not semistable): the three README Checks at 1288-1292 are unchanged.

## R02 (P3) — Cross-level strong multiplicity one exists at the pin and is not in the contract

**Location:** `README.md:201-205`: "Cross-level comparison from agreement at almost all **prime** indices is the stronger imported statement from ModularForms Layer 5"; `README.md:1051-1052`: "The fixed-level library theorem listed in the supplier contracts cannot replace this input."

**Claim:** At the pin the library has only the fixed-level theorem; the cross-level one is a roadmap import.

**Witness:** Tau Ceti `2fd255d`, `NumberTheory/ModularForms/Newforms/StrongMultiplicityOne.lean:451`: `HeckeRing.GL2.Newform.level_eq_and_coe_eq_of_forall_notMem_prime_eigenvalue_eq (f : Newform N k) (g : Newform M k)` … `N = M ∧ ⇑f.toCuspForm = ⇑g.toCuspForm` (Miyake 4.6.19).

**Repair:** Add the contract row "`Newform.level_eq_and_coe_eq_of_forall_notMem_prime_eigenvalue_eq` | Tau Ceti `Newforms/StrongMultiplicityOne.lean`: newforms of levels N, M with nebentypes agreeing modulo `lcm N M` and eigenvalues agreeing at all primes `p ∤ NM` outside a finite set have N = M and are the same function". Replace 201-205 by "Cross-level uniqueness of an attached form uses this theorem with both characters trivial; the fixed-level row is its equal-level case." and the last sentence of 1047-1052 by "It is the pinned theorem listed in the supplier contracts." Tested: with `F.χ = 1 = G.χ` the character hypothesis is `1.comp _ = 1.comp _`, and the eigenvalue at a good prime is the coefficient there (`EigenformAwayFromLevel.qExpansion_coeff_eq_eigenvalue`, same file, line 184 proof).

## R03 (P3) — `rationalEndomorphisms_eq_int`: the Lean carrier is wider than the README target and the bridge is not in `*Needs:*`

**Location:** `Suggested.lean:91-93`: "`(A : TauCeti.AlgebraicGeometry.AbelianVariety ℚ) (hA : A.dim = 1)`"; `README.md:492-493`: "*Needs:* EllipticCurves Layer 1, isogeny degree, dual and invariant-differential API; Mathlib rational integrality. Faltings is not needed for this assertion."

**Claim:** The listed inputs prove the headline as stated.

**Witness:** The proof sketch (README 474-482) is for a Weierstrass curve and `TauCeti.Isogeny.Hom`; the headline quantifies over every one-dimensional `AbelianVariety ℚ` with scheme endomorphisms `Additive (A ⟶ A)` (`AbelianVariety/End/Basic.lean:74`). Neither comparison is cited.

**Repair:** Append to line 493: "The headline on `AbelianVariety ℚ` also needs AbelianSchemesAndArithmeticModuli A1.6 (every abelian variety of dimension one is an elliptic curve with its group law) and FaltingsFinitenessAndIsogenyTheorems §R28.6.1(i) (`Hom_ℚ(E, E′) ≅ Hom_ℚ(E_ab, E′_ab)`, compatibly with composition and degree); these are comparisons of carriers, not Faltings's theorems." Tested on `[−2]`: §R28.6.1's first Check gives `[n] ↦ [n]` with degree `n²` on both sides, so the bijection for `E` transports to `E_ab`.

## R04 (P3) — Targets with Lean headlines are titled and called "Checks"

**Location:** `README.md:519`: "### Rational 3- and 5-isogeny Checks"; `README.md:531-532`: "The choice of these isogeny Checks follows the Imperial College London FLT project."

**Claim:** The subsection consists of Checks.

**Witness:** It states three targets with declarations `three_isogeny_j`, `five_isogeny_j`, `fifteen_isogeny_j` (`Suggested.lean:101, 107, 113`) and has its own `**Checks.**` lists (534, 568); a Check has no Lean counterpart.

**Repair:** Retitle 519 "### Rational 3-, 5- and 15-isogenies" and write 531-532 as "The choice of these three isogeny targets follows the Imperial College London FLT project." At 557 replace "global semistability is a Check" by "global semistability is a special case, recorded in the Checks below".

## R05 (P3) — Status wording

**Location:** `README.md:803`: "This is a planned supplier interface."

**Claim:** Timeless text.

**Witness:** AlgebraicModularFormsAndSerreWeights §7.5 "S-type and modularity predicates" (its README line 1598) states the predicate; "planned" records the state of another roadmap.

**Repair:** Delete the sentence; the preceding one already names the owner and section.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
| --- | --- | --- | --- |
| Hauptmodul relations (`three_isogeny_j`, `five_isogeny_j`) | 11a1 with v = −1/11; j = 0; u = 0, v = 0 | `j·v` = (−496³/11⁵)(−1/11) = 122023936/1771561 = (496/121)³; u = −3, −27 give j = 0; `v²+10v+5` disc 80, no rational zero; u = 0 forces 729 = 0 | pass; `barrios` lines 250-259, printed p. 6: `j_{3,2}`, `j_{5,2}` as stated |
| The 15-isogeny boundary (`fifteen_isogeny_j`) | four j-values; `y²=x³−x²−8x+112` | 241³·25 = 349938025, 29³·5 = 121945, 211³·5 = 46969655; v₅ = 2,2,1,1; model: c₄ = 400, Δ = −2¹³·5⁴, j = −25/2, additive at 5 | pass; `ddt` lines 3769-3778 (p. 102), `gonzalez-jimenez-lario` lines 2890-2914 (p. 93) |
| R29.1: `exceptionalPrimes`, `exceptionalPrimes_finite` | 11a1 at 7; 26b1; `(1,0,0,−7,9)`; 162b1; p = 0, 1 | 11a1: a₃ = −1, 1−12 ≡ 3 nonsquare mod 7; 26b1: Δ = −2⁷·13, c₄ = 129; third: #E(𝔽₃) = 6, disc ≡ 6 nonsquare; 162b1: Δ = −2³·3⁴, c₄ = 225, #E(𝔽₅) = 6 | pass; `serre` lines 1266-1277 (p. 207) |
| R29.1: residual irreducibility and conductor criterion | p = 7 odd; additive ℓ, p ≥ 5; multiplicative ℓ | eigenvalues 1, 6 distinct, eigenlines 𝔽₇-rational; inertia order ∣ 24 prime to p, invariants preserved; exponent 1 iff p ∤ v_ℓ(j) | pass; `serre` lines 872-877, 1272-1275 |
| `rationalEndomorphisms_eq_int` | 1, 0, [−2]; multiplication by i on `y²=x³−x`; dim 0 | scalars 1, 0, −2, degrees 1, 0, 4; i defined over ℚ(i) only; zero ring fails injectivity, excluded by `hA` | pass; R03 on carrier |
| Curve-level residual attachment | 11a1 at p = 5, 3 | a₂ = −2: mod 5 trace 3, det 2, `X²−3X+2` = (X−1)(X−2); mod 3 trace 1, det 2, trivial representation has 2, 1 | pass; `serre` lines 880-882 (p. 198), 1278-1283 |
| Trivial character from reduction | level 5, p = 2; ζ ≠ 1, ζ^m = 1 | quadratic character values ±1 both ≡ 1 mod 2, 2 ∣ φ(5) = 4; 1+ζ+…+ζ^(m−1) = 0 reduces to m ≠ 0 | pass |
| Norm vanishing; pigeonhole | α = 2, p = 2; divisors of 6 | 2 ∈ (2), 2 ≠ 0: one characteristic insufficient; 6 has four positive divisors | pass; pins `Algebra.norm_eq_zero_iff`, `Int.eq_zero_of_abs_lt_dvd`, `Finite.exists_infinite_fiber` |
| `IsNewformOf`, `IsNewformOf.coeff_int` | n = 0, 1; 37a1 vs level 11; nontrivial character | coefficients 0, 1; a₃(37a1) = −3 vs −1; character clause fails | pass; R02 on the uniqueness input |
| Conductor specialization and comparison | 11a1; 37a1; `y²=x³−x` | 11 (Δ = −11⁵); 37; Artin 32 vs bad-prime product 2, additive at 2 | R01; `serre1970` lines 266-278 (p. 19-09), `brumer-kramer` lines 550-559 (p. 243), `ddt` lines 2151-2159 (p. 57) |
| `IsNewformOf.localPolynomial_eq`, `IsNewformOf.coeff_eq` | 11a1 at 7, 11; 37a1 at 37; `y²=x³−x` at 2 | `1+2T+7T²` (count 10); `1−T`; −c₆ = 216 ≡ 31 nonsquare mod 37, `1+T`; 1; a₄ = 2, a₆ = 2, a₁₂₁ = 1 (good recurrence would give −10) | pass; Mathlib `EllipticCurve/LFunction.lean:43` |
| `span_range_rationalTateRep` | `y²=x³−x`, r = 5; sum of two characters | 5 splits in ℚ(i): restriction to G_ℚ(i) reducible, complex conjugation swaps the lines; diagonal span has dimension 2 < 4 | pass |
| Rational Tate surjectivity | identity; `E×E→E`; [r] | identity; projection of summands; [r] bijective on V_r, cokernel r² on T_r | pass; `milne` lines 461-462 (p. 115), 725-727 (p. 122) |
| Exhaustive Γ₀ decomposition | N′ = 1, 22, Mq² | empty product, dim 0; 2·1 = 2 = genus of X₀(22); σ₀(q²) = 3 | pass; `ribet-stein` lines 1820-1830 (p. 40), 3172-3185 (p. 73); Cremona not read |
| Elliptic coefficient summability (`LFunction_LSeriesSummable`) | 11a1 over ℚ, ℚ(√17), ℚ(√5), ℚ(√2); s = 7/4, 3/2 | n = 4: 2 ≤ 6; ℚ(√17): −4 ≤ 4√2, 2+4+2 = 8 ≤ 20, rational bound 6 fails; inert: (−2)²−4 = 0; exponents 5/4, 1 | pass; pins `normCoeff_eq_sum_normFiber`, `normCoeff_convolution`, `summable_absNorm_rpow_ideal_iff`, `hasse_bound` |
| `IsNewformOf.exists_entire_completed_LSeries`, `exists_entire_completed_LSeries` | two levels N ≠ N′; 11a1 | ratio `c^(2s−2)` constant forces c = 1, so the level is determined; Fricke −1 gives w = +1 | pass |
| `modularity` | level 22 oldform; 11a1, 11a3 | new part at 22 zero, so no `Newform 22 2`; same coefficients, one form | pass |
| Twist and parametrisation Checks | twist of 11a1 by −1; 11a3; 37a1 | model from `(4Y)² = X³−4X²−160X−1264`, Δ = −11⁵·2¹², c₄ = 7936; degrees 5n²; λ of degree 1, map of degree 2 | pass |

- Source locators checked against the text: 17, in 8 sources (`serre` 6, `milne` 2, `ribet-stein` 2, `barrios` 2, `ddt` 2, `gonzalez-jimenez-lario` 1, `serre1970` 1, `brumer-kramer` 1).
- Library declarations opened at the pins (Mathlib `1b1ccf4`, Tau Ceti `2fd255d`): 27, among them `EllipticCurve/LFunction.lean:43, 79, 84`, `Padics/HeightOneSpectrum.lean:109, 144, 155, 183`, `LSeries/Deriv.lean:161`, `LSeries/Convolution.lean:164`, `Newforms/StrongMultiplicityOne.lean:127-472`, `Newforms/OrthogonalBasis.lean:267`, `Newforms/FullEigenform.lean:128`, `AbelianVariety/End/Basic.lean:74`.
- Cross-roadmap citations resolved at the open heads or on main: 46 sections in 14 roadmaps, all present under the cited numbers and titles; the tool's three unresolved names are two declarations of this file and `ContinuousRep.IsAbsolutelyIrreducible` of ArithmeticGaloisRepresentations §1.7.
- Gate on this head: every counter 0, build passes. Dependency check: `depcheck: 246 roadmaps, 2251 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the folder.
- Elaboration of `Suggested.lean`: thirteen `declaration uses sorry` warnings and nothing else. The 21 elaborated signatures were compared with the README; no binder is lost (the `with` entry of the generated declaration list is line 29 of the module docstring, not a declaration).
- One-tactic probe on a scratch copy (`rfl`, `simp`, `simp` with the definitions unfolded, `infer_instance`, `trivial`): none of the 13 theorems closes; no padding.
- Pull request text: title, summary block and prose read against the head; it adds a roadmap not on main and says which files; no sentence is contradicted.
- Overlap check: read EllipticCurveModularityPartIIGL2TypeAbelianVarieties, EllipticCurveModularityPartII, AlgebraicModularFormsAndSerreWeights, ClassicalSerreModularity, SerreWeightAndLevelOptimisation, ModularForms, EllipticCurves, EllipticCurvePeriodsAndModularParametrizations; the stable-cyclic-subgroup predicate and `End_ℚ(E) = ℤ` are also stated in EllipticCurveModularityPartII §5.0a (`HasCyclicIsogeny`, third API bullet of `NonCM`): owner EllipticCurveModularity R29.1, the later Part II cites it; elliptic conductor comparison: owner NeronModelsAndSemistableAbelianVarieties §§5.3a, 5.3g and EllipticCurves Layer 8 (R01); summability: owner EllipticCurveModularity R29.6, cited by the Periods roadmap §3.1.
- Source independence: 11 passages compared with 8 sources, none shared (longest common run 5 words, a formula apart); largest share `serre`, 22 of about 60 locators; contents compared with `serre` (§§1–4, the roadmap draws on §2.8–2.9, §3.1, §3.3, §4.6–4.7): independent, the six layers do not map onto its sections and their order is forced by the `*Needs:*` lines R29.1 → R29.2 → R29.3 → R29.4 → R29.5.

## Not verifiable

- Cremona, *Algorithms for modular elliptic curves*, §2.6 pp. 24–25, §2.7 Lemma 2.7.1 p. 26, §2.15.1 pp. 47–48 (two sampled targets cite it): not in the sources cache; the sources service could not reach the author's page (network failure).
- Silverman AEC (III.1, III.4–III.5, III.9, V.1.1, VII.1, VII.5), Miyake Theorem 4.6.19, Faltings 1983 §5, Carayol §§0.5–0.8, Deligne–Serre Lemme 6.11, Khare–Wintenberger Theorems 1.2 and 9.1: not in the sources cache; cited by locator only.
- The Cremona labels 274a1 and 162b1 of the models `(1,0,0,−7,9)` and `(1,−1,1,−5,5)`, and the cubic `x³−3x²+3` dividing the 7-division polynomial of the second: invariants and point counts recomputed, labels and the division polynomial not.

## Source issues

- **Error** in gonzalez-jimenez-lario at §19.1, printed p. 93: the source says the four noncuspidal rational points of X₀(15) are CM points; it should be non-CM points, since the j-invariants it lists are not integers; affects nothing.

## For the human reviewers

- Licence: README lines 531-532 and 815-816 say the isogeny targets and the coefficient-map interface follow the Imperial College London FLT project; I did not compare `three_isogeny_j`, `five_isogeny_j`, `fifteen_isogeny_j` with that repository's declarations.
- Licence: `serre` was read from its author's Collège de France page and `milne` as a scan of the 1986 Springer chapter on the author's site; both hosts treated as author pages.
- Scope: the three isogeny targets of R29.1 (README lines 519-574) are used by no later layer, since Σ_E contains 3 and 5 by its first clause; their sources are refereed or standard (Barrios, Darmon–Diamond–Taylor).
