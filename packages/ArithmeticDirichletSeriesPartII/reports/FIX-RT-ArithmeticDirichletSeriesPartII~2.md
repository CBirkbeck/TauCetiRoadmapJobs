# ArithmeticDirichletSeriesPartII repair report

Finding identifiers below follow the supplied reviews: the first five sections address r2a, and the next four address r2b. Overlapping findings share one repair, but each receives its own verdict below.

## F01 (P3) — applied

82 explicit declarations → 21: three definitions, one structure, one supporting instance and 16 headline theorem signatures. Deleted 56 named API/Check declarations and all five anonymous examples. Their mathematics remains as README prose throughout HP.0–HP.5; internal references now name the corresponding rule or Check. Corrected the module heading and acceptance-file description. No deleted admission was replaced by a proof.

## F02 (P2) — applied

Analyticity of raw R → analytic continuation of its open-half-plane restriction in HP.2.2. Also changed the derivative sentence to refer explicitly to continuation. Added the boundary-update Check: R(1) = 37, R(1 + ε) = 0 for ε > 0, whereas the continuation is zero. PoleBoundary's agreements exclude the boundary; Delange's continuation argument is at delange1954 line 572.

## F03 (P2) — applied

Finite-inertia condition alone → finite inertia plus trivial complex conjugation, with last-factor discriminant indexing and the trivial map distinguished. Updated the summary, HP.4.2, HP.4 examples, HP.5.1 and downstream description. wood2019 line 1652 states the additional condition; line 1611 identifies its real-place meaning. Added ℚ(i): inertia intersection is trivial, but conjugation maps to (0, 1), excluding it.

## F04 (P3) — applied

Unresolvable sieve-roadmap ownership → a domain comparison without a supplier claim. Added OneParameterSemigroups, Part B's exact title and the HP.1.1 Check K₁(0) = 1/π ≠ K₁(2π) = 0. The roadmap service finds no SieveMethodsAndPrimePatterns; no matching owner exists in the permitted main/package copies. This comparison consumes no theorem, so it creates no supplier gap.

## F05 (P3) — applied

Dyadic local-pole control → the alternating perturbation of d₂, with b = 1 and all zero coefficients suppressed. HP.4.5 computes signed errors −1, 0, −1, 0 at cutoffs 1–4; both normalized sums tend to one. The old dyadic bound S_b(X) ≤ 2X actually gives S_b(X)/(X log X) → 0, so it did not discriminate this conclusion.

## F01 (P3) — applied

Lower-cased proper names → “arithmetic Dirichlet series and Tauberian methods” in the title. This matches the completed parent's title and the capitalization of Galois in `TauCetiRoadmap/LocalGaloisGroups/README.md:1` and `TauCetiRoadmap/PolynomialGaloisGroups/README.md:1`. No mathematical statement changes.

## F02 (P3) — applied

One shared 121–123 locator → separate locators 68–70, 117–118 and 121–123 for LaplaceConvergent, laplace and HasLaplace. Updated HP.0.1, References, the HasLaplace docstring and the existing source-manifest entry. The corresponding cached definitions begin at osele-laplace line 72, line 121 and line 125; the extraction adds four header lines. No new source key was created.

## F03 (P3) — applied differently

The five cited admissions → README Checks only, under the same removal as r2a.F01. The suggested in-place proofs would retain forbidden acceptance padding. In particular the exponential-model quotient equals one eventually by cancellation; it tests no new theorem. The endpoint sums, nonintegrability and numerical residue inequality remain precise prose Checks. No extra Lean declarations were introduced to test them.

## F04 (P3) — applied differently

Deleted the equal-order Check declaration with its unused binder as part of r2a.F01. HP.4.5 instead states the actual zero-suppressed sequences: the bound evaluates to 0 ≤ 0 at n = 0 and 1 ≤ 1 at positive n. Counts are floor X and twice floor X, with limits one and two. No replacement Lean Check was added.

## Verification of sources, ownership and suppliers

Read the target README and acceptance file completely, both finding lists, and the three main-branch models `Completed/ArithmeticDirichletSeries/README.md`, `TauCetiRoadmap/LocalGaloisGroups/README.md` and `TauCetiRoadmap/PolynomialGaloisGroups/README.md`. Main is a07e2024f391f3022520c3f8ad194912b3eab614. The pinned Mathlib and Tau Ceti checkouts match `lake-manifest.json`: 6b7abb3c7686292736be2955bd3eb9ebf63b456a and a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039.

All four works have certified legal extractions under their existing manifest keys. No additional source was needed and no missing-reference request was made. No source passage was copied into the package. Relevant passages read and compared:

| Source and locator | Verified content used here |
| --- | --- |
| delange1954 line 24, line 42; p. 213 | Real nonnegative nondecreasing α, positive abscissa, ordinary Laplace convergence; constant shifts. |
| delange1954 line 278, line 285; §§3.1–3.2, pp. 220–221 | Integral weight and shift comparison. |
| delange1954 line 329, line 343; §§3.3.1–3.3.2, pp. 221–224 | Regularized derivative and its ordinary Laplace representation. |
| delange1954 line 489, line 496, line 501, line 513; §3.3.5, p. 226 | Triangle weight, removal of damping by positivity, oscillatory limit and π normalization. |
| delange1954 line 517, line 535, line 537; §3.4, pp. 227–228 | Monotone inequalities and the derived bound. |
| delange1954 line 570, line 585, line 598; §4.1, pp. 228–229 | Continuations off the pole, uniform convergence away from zero and integrable boundary control. |
| delange1954 line 673, line 719; Lemmas 3–4, pp. 231–233 | Cutoff less than one in the logarithmic lemma; full Gamma integral when Re ρ > −1. |
| delange1954 line 818, line 821, line 831, line 870; Theorem III, pp. 235–238 | Boundary hypotheses, A/Γ(ω), positive leading coefficient; specialize ω = k + 1. |
| delange1954 line 1046; §5.3, p. 242 | Only an order-of-magnitude conclusion when the other boundary hypotheses are dropped. |
| wood2019 line 1586, line 1606, line 1611, line 1617, line 1652 | Rank convention, finite inertia, global real-place condition, last-factor discriminant and the particular series F_r. |
| wood2019 line 1692, line 1695, line 1698; §7, p. 417 | Order 2^r, logarithmic exponent 2^r − 1, trivial and non-surjective contributions. |
| gmr2019 line 1908, line 1944, line 2194, line 2199, line 2205 | Laplace-resolvent identity, holomorphic continuation and separately established uniformity. |
| osele-laplace line 72, line 121, line 125 | Three distinct definitions and their correct file-line locators. |

Ownership was searched by object using the roadmap service on main and indexed open heads, the board packages, and all thirteen explicitly supplied sibling checkouts. The only sibling hit was ComputationalNumberTheory's Fourier/Laplace normalization for its explicit-formula test functions, not a convergent one-sided function-transform predicate or Delange theorem. The main parent owns simple-pole Wiener–Ikehara and summatory functions (Layers 9, 9.2 and 4.2); those are imported unchanged. OneParameterSemigroups, Part B concerns positive measures and real Laplace arguments, not this predicate on functions with complex argument. Its exact heading was read on main. Circle Fejér approximation also appears in other work; no such approximation theorem is consumed here. No new generic construction or supplier edge was introduced.

The two actual cross-roadmap references resolve at their main versions. Neither an existing roadmap's progress pull request nor its altered contracts were used as a dependency. The completed parent sections were checked at `Completed/ArithmeticDirichletSeries/README.md:227`, `:337` and `:353`; OneParameterSemigroups, Part B starts at `TauCetiRoadmap/OneParameterSemigroups/README.md:162`.

Pinned declarations were located and their actual hypotheses inspected, rather than inferred from the resolver (whose library scan reported that it lacked pins):

| Native input | Pinned file and evidence |
| --- | --- |
| Northcott | `Mathlib/Order/Northcott.lean:36`: precisely finite sublevel sets, without any positivity or monotonicity assumption on the height. |
| LSeries.term, LSeries, LSeriesHasSum | `Mathlib/NumberTheory/LSeries/Basic.lean:74`, `:164`, `:217`: the zero-index term is zero; the sum is total; the HasSum assertion carries convergence. |
| TauCeti.normLE and summatory | `TauCeti/Order/Northcott/Basic.lean:41`, `:102`: inclusive finite height cutoff and its weighted sum; neither suppresses the zero index automatically. |
| Cutoff and comparison rules | Same file, `:73`, `:107`, `:138`, `:155`, `:164`, `:177`: natural membership, evaluation, floor, nonnegativity, monotonicity and eventually constant finite discrepancies. |
| Wiener–Ikehara variants | `TauCeti/NumberTheory/LSeries/WienerIkehara/SharpCutoff.lean:301`, `:334`; `TauCeti/NumberTheory/LSeries/WienerIkehara/Variants.lean:60`, `:120`, `:135`. Continuous separately named remainder; rpow limit κ/σ with σ > 0. |
| Analytic predicates and identity theorem | `Mathlib/Analysis/Analytic/Basic.lean:110`, `:120`; `Mathlib/Analysis/Analytic/Uniqueness.lean:223`. The identity theorem requires a preconnected domain and neighborhood agreement at a point in it. |
| Laurent data | `TauCeti/Analysis/Contour/MeromorphicLaurent.lean:223`. Applied to the meromorphic quotient continuation, not the total F's arbitrary boundary values. |
| Sine integrals | `TauCeti/Analysis/Contour/WorkedExamples/HalfDisc/SineIntegral.lean:339`, `:357`. Improper interval limits π/2, not a Lebesgue integral of unsquared sinc. |
| Fubini and integral of a series | `Mathlib/MeasureTheory/Integral/Prod.lean:478`; `Mathlib/MeasureTheory/Integral/DominatedConvergence.lean:88`. Integrability on the product and finite sum of norm integrals, respectively. |
| Dominated convergence and Fatou | `Mathlib/MeasureTheory/Integral/DominatedConvergence.lean:67`; `Mathlib/MeasureTheory/Integral/Lebesgue/Add.lean:216`. Countably generated filters and the stated measurability/majorant conditions. |
| Differentiation and dilation | `Mathlib/Analysis/Calculus/ParametricIntegral.lean:286`; `Mathlib/MeasureTheory/Integral/IntegralEqImproper.lean:1208`. Local integrable derivative bound; positive dilation. |
| Exponential and Gamma integrals | `Mathlib/Analysis/SpecialFunctions/ImproperIntegrals.lean:63`, `:87`; `Mathlib/Analysis/SpecialFunctions/Gamma/Basic.lean:66`, `:422`, `:465`. Negative real part of exponent; positive real Gamma argument and positive real rate. The complex-power variant at `:372` still has a real rate, so it does not directly state integerGammaLaplace at complex s. |
| Sinc | `Mathlib/Analysis/SpecialFunctions/Trigonometric/Sinc.lean:37`, `:42`, `:44`, `:51`, `:56`, `:85`: sinc 0 = 1, quotient away from zero, evenness, bound and continuity. No squared-sinc mass/Fourier theorem found at either pin. |
| Riemann–Lebesgue and removable singularities | `Mathlib/Analysis/Fourier/RiemannLebesgueLemma.lean:206`; `Mathlib/Analysis/Complex/RemovableSingularity.lean:35`. The latter requires continuity of the chosen extension at the puncture. |
| Zeta | `Mathlib/NumberTheory/LSeries/RiemannZeta.lean:145`, `:206`, `:241`: holomorphy off one, series on Re s > 1, residue one. |
| Arithmetic convolution | `Mathlib/NumberTheory/LSeries/Convolution.lean:139`; `Mathlib/NumberTheory/ArithmeticFunction/Misc.lean:127`, `:178`, `:195`: multiplication of convergent series and the divisor identities. |
| Geometric series | `Mathlib/Analysis/SpecificLimits/Normed.lean:473`: norm of ratio less than one. |

## Adversarial mathematics pass

The rows below cover every original explicit declaration, including those now represented only by prose, and the additional conventions and proof identities. They record calculations, not a claim that an admitted theorem has been proved. E is arbitrary only for HasLaplace and its former API; scalar calculations there use E = ℂ unless specified. All other numerical functions have the real/complex carriers of the displayed signatures. “README” means the statement is retained in prose and its Lean declaration deleted.

| Statement | Instances tried | Computed values on the two sides | Result and change |
| --- | --- | --- | --- |
| northcott_natId | Bounds 0, 1, 2; constant zero height | Identity sublevels have cardinalities 1, 2, 3; constant zero height has infinite sublevel at 0. | Correct supporting instance retained. |
| HasLaplace | μ = 0; f = 1, s = 2; f = 1, s = 0; zero space | Values 0, 1/2, total integral 0 respectively; norm integral at s = 0 is infinite, so predicate false. Zero space gives integral/value 0. | Definition retained with all three section instances. |
| Anonymous zero Check | Zero-preserving action; artificial action z • x = 1 on ℝ | First integrand/integral 0; artificial action gives integrand 1 and violates z • 0 = 0. | README retains SMulZeroClass hypothesis. |
| HasLaplace.integral_eq | f = 1, s = 2 | Integral = z = 1/2; this is the second conjunct. | README projection. |
| HasLaplace.integrable | f = 1, s = 2 and 0 | Norm integrals 1/2 and ∞; only the former satisfies the hypothesis. | README projection. |
| HasLaplace.unique | f = 1, s = 2; proposed values 1/2 and 7 | Both hypotheses force the same value 1/2; the second proposed value cannot occur. | README uniqueness rule. |
| HasLaplace.congr_ae | f = 1; g(0) = 37, g = 1 elsewhere | Default measure gives 1/2 for both at s = 2; δ₀ gives 1 and 37, and AE equality fails. | README with same-measure AE hypothesis. |
| HasLaplace.add | f = 1, g = 3, s = 2 | 1/2 + 3/2 = 2 = transform of 4. | README, distributive action retained. |
| HasLaplace.const_smul | f = 1, s = 2; scalars 0 and i | Transforms 0 and i/2 equal scalar multiples of 1/2. | README, compatible normed actions retained. |
| HasLaplace.comp_mul_left | f(t) = t, c = 2, s = 2 | Transform of 2t is 1/2; c⁻¹ times transform of t at s/c = 1 is also 1/2. c = 0 is excluded. | README positive dilation. |
| Anonymous constant Check | s = 1, 2, 1 + i | Integrals 1, 1/2, (1 − i)/2 equal 1/s. | README Check. |
| HasLaplace_test_quadratic | s = 1, 2, 1 + i | Integrals 2, 1/4, −(1 + i)/2 equal 2/s³; Stieltjes values at 1,2 would be 2,1/2. | README Check. |
| HasLaplace_test_nonintegrable | f = 1, s = 0 | Total integral 0 but integral of norm ∞; predicate is false despite 0 = 0. | README negative control; no proof padding. |
| PoleBoundary | A = 1 or 0; a = −1, 0, 2; k = 0,1 | Model at a + 2 gives 1/2 or 1/4 with numerator 1. Zero function has numerator 0; it fails a nonzero A. | Definition retained, arbitrary boundary values allowed. |
| PoleBoundary.congr | F = 1/(s − 1), updated F(1) = 37 | F(2) = 1 for both; boundary values 0 and 37 differ, but both predicates hold. | README open-half-plane rule. |
| PoleBoundary.leading_unique | Simple model; A = 1, proposed B = 2 | (s − 1)F(s) = 1 to the right, so its limit is 1 ≠ 2. | README uniqueness. |
| PoleBoundary.order_unique | F = 1/(s − 1) | k = 0 has numerator value 1; k = 1 can have numerator s − 1 with value 0. | README retains both nonzero coefficients. |
| PoleBoundary.div_argument | F = 4/(s − 2)²; also a = 0 simple model | After division leading coefficient 4/2 = 2. At zero, 1/s becomes 1/s² instead. | README retains a > 0. |
| PoleBoundary.rescale | Same F, a = 2, k = 1 | F(2s) = 1/(s − 1)²; coefficient 4/2² = 1. | README rescaling rule. |
| PoleBoundary.mul_regular | F = 1/(s − 1)²; H = 0,1,s − 1 | Products have leading coefficients 0,1,0 at index 1; last product has actual simple pole. | README allows a vanishing regular factor. |
| PoleBoundary.mul | 2/(s − a) times 3/(s − a)² | Product 6/(s − a)³; k,l = 0,1 give new index 2 and order 3. | README product rule. |
| PoleBoundary_test_model | A = −2, a = 0, k = 1; A = 0 | F(1) = −2, F(2) = −1/2, numerator −2; zero case numerator 0. | README allows arbitrary real A. |
| PoleBoundary_test_boundary_value | Updated simple model | At 1 value 37, at 2 value 1; numerator on the right is identically 1. | README Check retained. |
| PoleBoundary_test_wrong_leading | Simple model | Right-hand normalized limit 1 differs from proposed 2. | README negative control. |
| PoleBoundary_test_dyadic | s₀ = 1 + 2πi/log 2 | F(s₀ + ε) = 1/(1 − 2^(−ε)) ∼ 1/(ε log 2), unbounded; no analytic away germ. | README negative control. |
| PoleBoundary_test_zero_not_exact | F = 0; A = 1,−1,0 | Numerator is zero on a right cap, hence at a; 0 ≠ ±1, whereas A = 0 works. | README negative control. |
| squaredSinc | λ = −1,0,1,2 at v = 0; λ = 1 at π/2 | Values −1/π,0,1/π,2/π; K₁(π/2) = 4/π³. | Definition retained; probability claims need λ > 0. |
| Anonymous kernel-origin Check | λ = 0,2 | Values 0 and 2/π equal λ/π. | README Check. |
| Anonymous kernel-zero Check | λ = 1,2 | K₁(π) = K₂(π/2) = 0; half-frequency model instead gives 4/π³,8/π³. | README Check. |
| squaredSinc_nonneg | λ = 1 and −1 at v = 0 | 1/π > 0; −1/π < 0 violates the claim without positive bandwidth. | README hypothesis retained. |
| squaredSinc_even | λ = 2, v = ±π/4 | Both values 8/π³. | README API. |
| squaredSinc_continuous | λ = 0,2; v → 0 | Limits 0,2/π equal the defined values. | README API. |
| squaredSinc_integrable | λ = 1,2 | Absolute mass is 1 in each case; tail majorants 2/(πR),1/(πR) are finite. | README API. |
| squaredSinc_mass | λ = 1,2,0,−1 | Integrals 1,1,0,−1 respectively; only first two assert mass one. | Headline retained. |
| squaredSinc_fourier | λ > 0; v = 0,π/λ,π/(2λ) | Triangle area gives λ/π; oscillatory values 0 and 4λ/π³ equal the kernel values. | Headline retained with angular frequency. |
| squaredSinc_tail | h = 1,2; h = 0 excluded | Tail bounded by 2/(πλ),1/(πλ), both → 0; h = 0 gives mass 1. | README API with strict h > 0. |
| squaredSinc_test_mass_two | λ = 2 | (2/π)(π/2) = 1. | README specialization. |
| delangeWeight | k = 0,1,2; t = 1, and t = −1 | At 1: 1 − 1/e, 1 − 2/e, 1 − 5/(2e); w₀(−1) = 1 − e < 0. | Definition retained, sign restricted to t ≥ 0. |
| Anonymous weight-origin Check | k = 0,1,2 | Outer factor t = 0 gives values 0,0,0, including 0⁰ = 1 internally. | README Check. |
| delangeWeight_continuous | t → 0, k = 0,1,2 | Expansion t/(k!(k + 1)) + O(t²); limits 0, slopes 1,1/2,1/6. | README API. |
| delangeWeight_nonneg | t = 0,1; k = 0,1 | Values 0 and 1 − 1/e or 1 − 2/e are nonnegative; t = −1,k = 0 gives 1 − e < 0. | README API. |
| delangeWeight_pos | t = 1; k = 0,1,2 | 0.63212056,0.26424112,0.08030140 > 0; t = 0 gives 0. | README strict-time hypothesis retained. |
| delangeWeight_test_double | t = −1,0,1 | t w₁(t) = 1,0,1 − 2/e, equal to 1 − (1 + t)e^(−t). | README identity. |
| delangeWeight_test_simple | t = −1,0,1 | w₀(t) = 1 − e,0,1 − 1/e on both sides. | README identity. |
| delangeWeight_test_triple | t = −1,0,1 | t²w₂(t) = 1 − e/2,0,1 − 5/(2e); omitting 1/2! doubles the nonzero values. | README factorial control. |
| delangeWeight_normalization | k = 0,1,2,3 | w_k(t)t^k = 1 − e^(−t)Σ(j ≤ k)t^j/j! → 1; value at t = 0 is 0. | Headline retained. |
| delangeWeight_shift | h = 0,±1; k = 0,2 | At h = 0 quotient 1 for t > 0; other ratios have normalized Gamma factors → 1 and (t/(t ± 1))² → 1. | Headline retained. |
| delangeWeight_shift_uniform | H = 1; k = 1 | For t > 2, t/(t + h) lies in [t/(t + 1),t/(t − 1)] → [1,1]; normalized Gamma factors also → 1 uniformly. | README API with ε before t before h. |
| delangeWeight_bound | k = 0,1,2; t = 0,1 | Normalized values 0 and 1 − 1/e,1 − 2/e,1 − 5/(2e), all ≤ 1. | README API. |
| integerGammaLaplace | a = −1,0,2; s = a + 2; k = 0,1,2,3 | Integrals 1/2,1/4,1/4,3/8 equal k!/2^(k+1); s = a + 1 + i,k = 1 gives −i/2. | Headline retained at all real a. |
| integerGammaLaplace_test_zero | s = a + 1,a + 2 | Integrals 1,1/2 equal 1/(s − a). | README specialization. |
| integerGammaLaplace_test_one | s = a + 1,a + 2 | Integrals 1,1/4 equal 1/(s − a)². | README specialization. |
| regularizedBoundaryL1 | Exact model; k = 0 with continued R(s) = s − a; k = 1 with R(s) = 1/(s − a) | Exact model H = b = 0, error 0. Linear remainder H = b = −1, error 0. Last case has log singularity with integral of −log y on (0,δ) equal δ(1 − log δ). | Headline retained; raw-value prose repaired. |
| regularizedBoundary_test_model | F = A/(s − a)^(k+1), including s = a | R = F − F = 0 even at the totalized pole; derivative and integral 0. | README Check. |
| regularizedBoundary_test_log | c = 1,y = ±1; c = 0 | At y = 1 both integral and formula equal (log 2)/2 − 1/2 + i(1/2 − π/4); at −1 the conjugate; at c = 0 value 0. | README Check with y ≠ 0. |
| delangeSmoothedLimit | α = 0,A = 0; α = e^(at)t^k,A = k!; lower model α = e^(at),k = 1,A = 0 | Limits 0,1,0; corresponding weighted factors are 0,w_k(t)t^k,w₁(t). | Headline retained without a growth assumption. |
| delangeSmoothedLimit_test_model | k = 0,1,3; λ = 1,2 | Weighted factor bounded by 1 and tends to 1; convolution limit 1 × mass 1 = 1. | README Check. |
| monotoneUnsmoothing | α = 0; α = 2e^(at)t^k | For the zero model the convolution and normalized function are both 0; for the second model both limits are 2. | Headline retained, all bandwidths quantified. |
| monotoneUnsmoothing_test_one_bandwidth | a = C = λ = 1, ε = 1/10; k = 0,2 | J = 1 + 0.1 cos 3t has extrema 1.1,0.9; triangle at frequency 3 is 0, convolution limit 1. Derivative margin ≥ 1 − 1/3 − o(1) > 0. | README counterexample. |
| monotoneUnsmoothing_test_zero | α = 1,a = 1,k = 0 | Ratio e^(−t) → 0; weighted convolution also → 0. | README specialization. |
| delangeLaplace | α = 2e^(at)t^k; k = 0,1,2,3 | Leading coefficients 2,2,4,12; dividing by k! gives 2 each time, equal to the normalized α. | Headline retained with explicit positivity and transform/boundary hypotheses. |
| delangeLaplace_test_simple | α = 2e^t | Ratio 2; A/0! = 2. | README specialization. |
| delangeLaplace_test_double | α = 3te^t | Ratio 3; A/1! = 3. | README specialization. |
| delangeLaplace_test_model | a = −1,0,2; k = 0,1,3; t > 0 | e^(at)t^k divided by itself is 1. At t = 0,k > 0 total quotient is 0, irrelevant to the limit. | README, no object-free cancellation target. |
| logSummatory_hasLaplace | c = δ₁ or δ₂, s = 2; c₀ = 37 | δ₁: F = 1, transform 1/2. δ₂: F = 1/4, transform 1/8. Changing c₀ has contribution 0. | Headline retained; Re s > 0 explicit. |
| logSummatory_test_initial | c₀ = 99,c₁ = 3,c₂ = −5 | At e⁰ = 1 sum 0 + 3 = 3 = c₁. | README cutoff Check. |
| logSummatory_test_unit_mass | δ₁, s = 2 | α(t) = 1 for t ≥ 0; transform 1/2 = F(s)/s. | README ordinary-transform Check. |
| logSummatory_test_endpoint | c₁ = 3,c₂ = −5 | At exp(log 2) = 2 sum −2 = 3 − 5; exclusive cutoff gives 3 instead. | README endpoint Check. |
| delangeDirichlet | ζ, ζ², ζ⁴; k = 0,1,3 | Numerators 1; constants 1,1,1/6 equal 1/k!. | Headline retained. |
| counting_test_ones | X = 1,2,5/2 and X → ∞ | Counts 1,2,2; ratios 1,1,4/5; floor X/X → 1. | README Check. |
| delangeDirichlet_positiveAbscissa | c_n = 1 at a = 1; c_n = n at a = 2 | Limits 1 and 1/2 equal A/(a·0!) for A = 1. | Headline retained; no extension to a = 0. |
| counting_test_abscissa_two | X = 2,3,4 | Sums 3,6,10 equal N(N + 1)/2; ratios 3/4,2/3,5/8 → 1/2. | README Check. |
| counting_test_abscissa_zero | c_n = 1/n; a = 0 | F = ζ(s + 1) has order 1; F/s has order 2 and numerator 1. Harmonic sums/log X → 1, but sums → ∞ rather than a finite constant. | README negative control. |
| finiteChange_asymptotic | Add 7 at 1; subtract 3 at 2; alter only c₀ | Eventual discrepancies 7,−3,0; each divided by X^a(log X)^k → 0 for a > 0. | Headline retained, signed coefficients allowed. |
| lowerPole_perturbation | a = 1,l = 0,k = 1; d = d₂ + (−1)^n,b = 1, zero-suppressed | Coefficient errors have magnitudes 0 at zero,1 otherwise; signed partial sums −1,0,−1,0. Normalized error → 0; both limits 1. | Headline unchanged; new discriminating README Check. |
| lowerPole_test_equal_order | c = b = 1,d = 2 on n > 0; all zero at zero | Bound 0 ≤ 0 at zero,1 ≤ 1 otherwise. At N = 1,2 counts are 1,2 and 2,4; normalized limits 1,2. | Corrected README; unused-binder declaration deleted. |
| zetaSquare_counting | n = 0,1,2,4; local prime powers | Divisor values 0,1,2,3; Σ(j + 1)z^j = (1 − z)⁻²; numerator 1, index 1, count constant 1. | Headline retained. |
| counting_test_divisor_fourfold | n = 0,1,2,4; k = 3 | d₄ values 0,1,4,10; at 4 convolution 3 + 4 + 3 = 10. Constant 1/6 differs from 1/3,1/2,1/24. | README factorial Check. |
| counting_test_insert_one | X = 1,2,4 | Original divisor sums 1,3,8; altered 8,10,15; discrepancy 7 throughout, ratio correction → 0. | README Check. |
| dyadicLocalPoleCounterexample | n = 0,1,2,3,4; s = 2; j = 0,1,2,3 | Coefficients 0,1,2,0,4; series Σ2^(−j) = 2 = F(2). First ratios 1,3/2,7/4,15/8 → 2; second 1,7/6,5/4,31/24 → 4/3. | Headline retained; other boundary poles exclude PoleBoundary. |
| dyadic_test_values | j = 0,1,2,3 | S(2^j) = 1,3,7,15 = 2^(j+1) − 1; S(3·2^j) = 3,7,15,31 = 2^(j+2) − 1. | README Check. |
| dyadic_test_residue | Residue and limiting ratios | 1/log 2 = 1.44269504 between 4/3 = 1.33333333 and 2; equivalently 1/2 < log 2 < 3/4. | README numerical control. |

Additional rows cover the conventions, continued objects and intermediate displayed identities, including every changed mathematical statement.

| Statement | Instances tried | Computed values on the two sides | Result and change |
| --- | --- | --- | --- |
| Inclusive cutoff and zero suppression | c₀ = 99,c₁ = 3,c₂ = −5; X = −1,0,1,2 | S(X) = 0,0,3,−2. At X = 0 the native carrier includes zero, but its suppressed weight is zero. | Convention agrees with all counting targets. |
| Ordinary versus Stieltjes transform | Constant one and t²; s = 2 | Ordinary values 1/2,1/4; Stieltjes values 1,1/2. | Factor 1/s is fixed by two different functions. |
| Positive scale and junk denominators | a = 1,2; k = 0,1; X > 1; X = 1,k = 1 | X^a(log X)^k is positive for X > 1. At X = 1,k = 1 it is zero, and the totalized quotient is zero. | Limit statements only use eventual positive denominators. |
| Absorbing the regular analytic term | z = s − a; F = 1/z + 2 | Numerator 1 + 2z has value 1 at z = 0 and yields F = 3 at z = 1. | PoleBoundary represents Delange's integer-exponent form. |
| Raw remainder versus continuation | a = A = 1,k = 0; updated F(1) = 37 | R(1) = 37, R(1 + ε) = 0; continuation value and right limit are both 0. H on the right is 0 and its L¹ error is 0. | Raw-analyticity claim repaired; consumers use only right-half-plane derivatives. |
| Continuation of derivatives off a | Updated model at s₀ = 1 + i | Raw R(s₀) may be chosen 37; continued R and continued R′ are 0. Right-hand derivatives are 0. | Wording now refers to continued R′, not a derivative of arbitrary boundary data. |
| Norm majorant near the pole | ε,u ≥ 0; ε = 0,u = y = 1 | Norm √2 equals (u + abs y)/√2 = √2. More generally norm² ≥ u² + y² ≥ (u + abs y)²/2. | Correct direction and constant. |
| Borderline regularization | k = j = 1; δ = 1, y > 0 | ∫₀¹ u/(u + y)² du = log((1 + y)/y) + y/(1 + y) − 1; at y = 1 value log 2 − 1/2. | Logarithmic growth; ∫₀^δ −log y dy = δ(1 − log δ) is finite. |
| Triangle and squared-sinc normalization | λ = 1; v = 0,π/2 | Triangle integral 2 and 8/π²; division by 2π gives 1/π and 4/π³. | Mass/Fourier conventions agree across HP.1–HP.3. |
| Integration by parts for kernel mass | R = π; then R → ∞ | Boundary term −sin²π/π = 0; ∫₀^π sin²w/w² = ∫₀^π sin 2w/w. At infinity the half-line limit is π/2, whole-line mass after division by π is 1. | Uses exactly the supplier's positive frequency 2. |
| Fourier sign and angular conversion | y = 2π,w = 1; v = 0,1/4 | Inverse phase exp(iyv) gives 1,i; forward phase exp(−2πivw) gives 1,−i. Reflection/inversion restores 1,i. | Correct inverse Fourier formula, not the forward sign. |
| Damped smoothing identity | t = 2,T = 3; original y = 1 and reflected y = −1 | exp(i(t − T)) = exp(−i); reflected Laplace/Fourier factors exp(2i)exp(−3i) = exp(−i). | Even triangle justifies the frequency reflection in HP.2.3. |
| Lower incomplete Gamma identity | t = 1; k = 0,1,2 | Normalized integrals 1 − 1/e,1 − 2/e,1 − 5/(2e) equal w_k(1); external t^k = 1. At t = 0 both normalized quantities are 0. | Correct factorial and total origin. |
| Positive cutoff in the weight | Cutoffs 1,1/2; k = 0,1 | Normalized forms 1 − e^(−Lt), 1 − (1 + Lt)e^(−Lt) both → 1 for L > 0. L = 0 gives zero. | Cutoff one is valid for pure integer powers. |
| Gamma induction factor | a = 0,s = 2; exponents 0,1,2 | Integrals 1/2,1/4,1/4 satisfy I₁ = (1/2)I₀ and I₂ = (2/2)I₁. | Correct recurrence and denominator order. |
| Regularized transform and its minus sign | R(s) = 1/(s − a),k = 1; s − a = 1 | −∫₀¹ R′(s + u)u du = log 2 − 1/2 = ∫₀∞ e^(−t)w₁(t)dt. | The negative derivative becomes a positive weight. |
| Removal of damping/model term | α = β = e^(at)t^k; λ = 1,2 | Difference transform and H are zero; bounded normalized model tends to 1, giving undamped convolution limit 1 at either mass-one kernel. | No assumed growth bound is needed. |
| Unsmoothing window comparison | a = 1,h = log 2; limiting J = 1 and window mass m = 1/2 | Retained-window lower bound tends to e^(−h)m = 1/4, below full convolution limit 1; as h → 0 and m → 1 both approach 1. | Direction of monotone inequality and order of limits agree. |
| Division/rescaling constant across HP.0, HP.4 and the parent | a = 2,k = 0 or 3,A = 1 | Rescaled coefficients 1/2 or 1/16; multiplying by a^k = 1 or 8 gives 1/2 in both cases. Final constants 1/2 and 1/12 equal A/(a·k!). | Parent's k = 0 constant κ/σ = 1/2 agrees. |
| Negligibility at the larger logarithmic scale | Dyadic b; X = 8 and X → ∞ | S_b(8) = 15 ≤ 16 = 2X; S_b(X)/(X log X) ≤ 2/log X → 0 despite different S_b(X)/X subsequential limits. | Explains why the former perturbation Check was replaced. |
| Signed perturbation, including zero | n = 0,1,2,3,4 | c = 0,1,2,2,3; d = 0,0,3,1,4; b = 0,1,1,1,1. Absolute errors are exactly b; cumulative errors 0,−1,0,−1,0. | Both normalized sums tend to 1; corrected Check has actual sequences. |
| Wood finite inertia and the real place | Last-factor characters of ℚ(i) and ℚ(√5), r = 1 | Both images lie in {0} × C₂ and meet C₂ × {0} in {(0,0)}. Conjugation images (0,1) and (0,0); discriminants 4 and 5. | First excluded, second allowed as a homomorphism by the described conditions. |
| Wood rank/order/factorial | r = 1,2 | Targets C₂²,C₂³; orders 2,4; indices k = 1,3; constants A/1!,A/3! = A,A/6. | All repeated examples now refer to the totally real series. |
| Separating a finite contribution | Trivial map, or adding 7 at n = 1 | Summatory change is a constant 1 or 7 for X ≥ 1; divided by X(log X)^k it tends to 0. | Matches finite-change theorem without an arithmetic supplier claim. |
| Renewal application does not imply uniformity | α_n(t) = e^t + e^n, fixed n | Normalized count = 1 + e^(n−t) → 1 for each n, while its error has supremum ∞ over n at each t. | HP.3.2 remains a theorem for one function; consumer proves uniformity separately. |

## Check outcomes and gate repairs

- Required elaboration: ran `lake env lean` on `packages/ArithmeticDirichletSeriesPartII/Suggested.lean` from the pinned content checkout. Exit 0; exactly 16 `declaration uses sorry` warnings, no errors or other diagnostics. The object file for `TauCeti.Order.Northcott.Basic` already existed, so no targeted module build was needed. No Lean command remains running.
- Elaborated signatures: generated one scratch file containing the revised module and `#check @name` for all 21 explicit named declarations, then elaborated it once from the same checkout. Exit 0, the same 16 expected warnings and all 21 types printed. Compared each type with the README: no lost binder and no changed theorem signature. HasLaplace retains its universe-polymorphic E, NormedAddCommGroup, real NormedSpace and complex SMul; the smoothed theorem retains its arbitrary real A, the end theorems retain positive A, and every positive-abscissa/majorant hypothesis remains explicit.
- README/Lean agreement: all 21 retained names occur in the README; all 56 deleted named declarations have no remaining exact-name occurrence there. There are no `_test_` names, anonymous examples, sorried data or options in the acceptance file. Its only imports are `Mathlib` and the actual summatory module.
- Citation resolver: no cross-roadmap citations found nowhere and no Lean names found nowhere. Its statement that external library names were not checked was not treated as verification; the pinned inputs were read directly as recorded above. The five supplied citation leads are settled: the four PoleBoundary API names are prose rules, and the proposed HigherPoleTauberian namespace is plain text rather than a promised declaration.
- Report-heading gate failure: qualified IDs such as r2a.F01 → F01 in all nine finding headings. The opening paragraph preserves review attribution. All nine headings match the required syntax and their review's ID and severity; every verdict is preserved. No metadata, plan, supplier-gap or merge-order change was necessary.

The required dependency command with the supplied name, order and `--movable` exited 0 with exactly:

```text
depcheck: 14 roadmaps, 101 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line.

## Maintainer consequences

The headline names, signatures, layer locators HP.0–HP.5 and supplier direction are unchanged. Deleted names identify API lemmas and Check mirrors only; every one is named in the mathematical table above, with its README statement preserved. No other roadmap was edited or assigned a new target. Wood applications must distinguish the totally real F_r from variants with nontrivial complex conjugation. The earlier settled placement question concerning ArithmeticStatisticsPartV is not reopened. No commit or external write was made. These repairs still require the fresh independent review specified by the brief.
