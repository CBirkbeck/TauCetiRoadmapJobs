# EffectiveClassNumbers repair findings

R01–R26 identify the merged findings in this report. Each section records its original review references: A-Fnn denotes Fnn in RT-EffectiveClassNumbers_r1a; B-Fnn denotes Fnn in RT-EffectiveClassNumbers_r1b. Overlapping findings are grouped and settled once. Severities of grouped findings use the highest reported severity. This report records repairs and their evidence, not an independent acceptance.

## R01 (P1) — applied differently

**Review references:** A-F01.

Unsquared restored Euler factor → square-supported B=(1+262X²+19321X⁴)⁻¹ and G₁₃₉=1−4εX+139X². Recomputed B(1)=19321/19584, B′/B=11 log(139)/408, both signs, four scales and contour multiplier. Section 3.4 now requires corrected constant enclosures. Evidence: C1, O85 line 212; conflicting replacement, O85 line 403.

## R02 (P1) — not actionable in this package: the primitivity adapter belongs to ImaginaryQuadraticClassNumber H1.3

**Review references:** A-F02 / A-F18 / B-F08.

Stale pins/imports → manifest pins, `.Basic` imports and pinned `Reduced`; added geometric and small-count signatures. Primitivity is a supplier obligation, registered as gap:fundamental-reduced-forms-primitive in README and the gaps-only plan. Implementing its statement in the supplier is outside this package. Pinned Reduced.lean lines 60–84 and base H1.3 establish the ownership boundary.

## R03 (P1) — applied

**Review references:** A-F03 / B-F03.

GlobalNumberFields Layer 10 → pinned `fundamentalDiscriminantChar`, ImaginaryQuadraticClassNumber H2.1 and H2.2 throughout. The former section concerns archimedean infinity types; the latter sections state the character/splitting and ζ_K=ζL contracts. Pinned Character.lean lines 34, 60, 87 and 95 supply construction, parity, primitivity and odd-prime evaluation.

## R04 (P1) — applied differently

**Review references:** A-F04 / B-F04.

Duplicate imaginary radicand/count targets → ImaginaryQuadraticClassNumber H1.1–H1.3 imports; duplicate discriminant formula → pinned `discr_eq_fundamentalDiscriminant`, Quadratic/Discriminant.lean line 50. Introduction identifies Part II while retaining the package identifier. Added the discriminant-sign equivalence and separately named real quadratic extension; updated consumers. B-F04’s suggested retention of a second discriminant-formula target would duplicate the pin.

## R05 (P2) — applied

**Review references:** A-F05 / B-F07.

Half-height convention and gap 1/4 → full x-height and gap 1/2; deleted doubling instructions throughout. Evidence: pinned CanonicalHeight/Basic.lean lines 119–120, Mathlib Height/EllipticCurve.lean and EffectiveDiophantineMethods Conventions and §§3.12–3.15. BGZ85 line 127 and its height table use this same convention.

## R06 (P1) — applied

**Review references:** A-F06.

Global totalized product as completion → separately quantified entire F with right-half-plane agreement in `oesterleTechnical`, C3 and its consumers. Reflection, central zero and decay apply to F. Product comparison is restricted to the convergence half-plane. Pinned Complex.Gamma_zero and O85 lines 218–224 show why the old continuation identification fails; a bundled example tests the zero-at-zero product.

## R07 (P1) — applied differently

**Review references:** A-F07 / B-F01 / B-F02.

Nonexistent suppliers → owned analytic-rank parity, coprime twist comparisons, full local Weil–Deligne adapter, classical Heegner construction, Galois/conjugation, Gross–Zagier and height/degree comparisons. Reused actual earlier owners. Added easy parity and coefficient signatures; conductor, root-number and Heegner carriers remain README targets. GZ86 lines 159–171 and 258–290 fix hypotheses/constants. B-F02’s Heegner restriction is settled under A-F22.

## R08 (P1) — applied

**Review references:** A-F08 / B-F05 / B-F10.

Misidentified class-number/Siegel sections and unconditional explicit prime bounds → ImaginaryQuadraticClassNumber H2.2/H2.4 and qualitative pinned PNT. Retained AnalyticNumberTheoryPartI §§0.9/0.33. Its §0.5 carries RosserSchoenfeldFiniteRangeInput; §§2.15 and 2.18 concern a residue upper bound and Artin regrouping. None supplies the advertised contract. Section 4.4 needs no explicit prime-count estimate.

## R09 (P1) — applied differently

**Review references:** A-F09 / B-F06.

Nonexistent strip anchor and general pole claim → actual AL.3 pole/completed-bound contracts and a named finite-self-pair polynomial-growth adapter; corrected the local-conductor citation to AL.5. B-F06 overstates absence of self-pair bounds: supplier `automorphic-l-data` explicitly includes bounds away from poles. It does exclude self-pairs from IsNicePinned. COG04 lines 3393–3411 confirm the distinction; gamma division still needs the adapter.

## R10 (P1) — applied

**Review references:** A-F10.

“a_p=0 implies factor 1” → distinguish additive reduction from good trace zero. Added `curve37` at p=5: its good factor is (1+5·5^(−2s))⁻². Direct point count gives six points over 𝔽₅, hence a₅=0; its discriminant 37 is prime to 5. The factor has a nonzero X² coefficient.

## R11 (P2) — applied

**Review references:** A-F11.

Incomplete bad-prime lists → all-type inertia/monodromy determinants, symmetric-square/Rankin–Selberg comparison and a ramified local-factor adapter. Includes potentially multiplicative, potentially good and wild primes 2,3. General bad correction is (1−p^(1−2s))L_p(Sym²,2s)/Ψ_p; good and multiplicative specializations agree. Evidence: DEL73 line 1972, (8.12.1)–(8.12.4), and the actual unramified-source restriction in AL.5.

## R12 (P1) — applied differently

**Review references:** A-F12.

Unowned partial-zeta claim in IntegralLattices B2 → owned `partialZeta_eq_epstein`, including ideal norm, inverse ideal class and unit factor. Using I=(a,(b+√D)/2), integral ideals are (α)I⁻¹, so ζ_[I]⁻¹ is the correct class. The reviewer’s unspecified class convention needed this clarification. Evidence: O85 lines 118–125, §1.2; B2 supplies only the arithmetic correspondence.

## R13 (P2) — applied

**Review references:** A-F13 / B-F11.

Third derivatives before their vanishing prerequisites → numerical first-derivative/central inputs in §2.7 and third-derivative bounds in §§2.12–2.13. Every numerical input has its own Needs. Reordered matching Lean declarations so exact vanishing precedes the third-derivative bound, then exact rank. Conductor-37 parity comes independently from its split node. Evidence: the explicit hzero binder in `centralDerivative_series` and BGZ85 formulas (10)–(12).

## R14 (P3) — applied differently

**Review references:** A-F14.

False remainder counterexample and necessary K≥x → general first-omitted-term bound for K≥0 by integrated Taylor remainder; K≥x retained only as sufficient for the alternating decreasing-term proof. At x=5,r=1,K=1, direct convergent-series evaluation gives error 2.812198127<6.25 despite increasing initial terms. BGZ85 lines 257–278 fix the kernel/series normalization.

## R15 (P2) — applied

**Review references:** A-F15.

Missing easy numerical milestones → explicit entire-L/right-half-plane-agreement signatures for `curve5077_deriv_small` and `curve37_central_bounds`. Also separated the corresponding exact vanishing and third-derivative milestones. Bounds are respectively norm <10⁻¹² and real central value in (0.72,0.73); binders are explicit. These remain theorem targets, not numerical assumptions.

## R16 (P2) — applied

**Review references:** A-F16.

Invariance modulo torsion and unspecified positivity → `curve5077_heegner_descent` and `curve5077_grossZagier_constant_lower` for a fixed minimal-degree parametrisation, both in exact-vanishing Needs. Reductions over 𝔽₉ and 𝔽₂₅ have orders 7 and 20, forcing torsion-free descent. The constant target is c>5·10⁻¹². A merely rational tensor class would permit a denominator-two height loss by four.

## R17 (P2) — applied

**Review references:** A-F17.

Discriminant <-4 → negative discriminant in `splitPrime_size`; includes all imaginary quadratic fields. Added −3 with split p=7 and −4 with split p=5, and a named Lean boundary target giving class number one and the prime ideals. The norm proof in O85 lines 152–155 does not need w=2; later decomposition targets retain d>4 where needed.

## R18 (P3) — applied differently

**Review references:** A-F19 / B-F13.

Vacuous/excess definition examples → at most two bundled examples per kept definition. Added θ(15),θ(84), F(2), negative-a kernel control, conductor-37 model tests, inert-pattern membership/composite rejection and sixteen-list membership/cardinality controls. Removed library-only fundamental-discriminant examples. Added declaration docstrings and named boundary targets where proofs need development. Each definition has at least three discriminating README Checks.

## R19 (P3) — applied

**Review references:** A-F20.

Technical Theorem 2 p.314 → C1–C4 p.314 and §3.5 Theorem 2 p.318. O85 line 355 locates the theorem; lines 212–224 locate the hypotheses. Both references now distinguish them.

## R20 (P3) — applied

**Review references:** A-F21 / B-F15.

Absent manifest and OEIS link → bibliography/provenance manifest and the legal AMS article/PDF. Every cited work is recorded, including the two added references for missing comparisons. O88 is an uncertified locator-only citation; no verification HTML is certified. LLS70 is the readable AMS extraction, notably lines 527–575 and 1123–1133.

## R21 (P1) — applied

**Review references:** A-F22.

“No inert conductor prime” → an ideal of norm N with cyclic quotient for the general maximal-order construction; the GZ86 formula separately assumes odd fundamental D prime to N and split level primes. N=27,D=−3 gives ℤ/9×ℤ/3 and is rejected. N=3 allows the cyclic construction but remains outside that formula. Evidence: GZ86 lines 159–171 and 473–499.

## R22 (P2) — applied

**Review references:** A-F23.

Unconditional one-term derivative identity → full product rule. Its simplification explicitly uses L(E,1)=0 for E₅₀₇₇; the conductor-37 argument instead uses central vanishing of its −139 twist. Both vanishings come from root number −1. The second term cannot be omitted for arbitrary entire factors; no unsupported cancellation remains in the Gross–Zagier contract.

## R23 (P2) — applied

**Review references:** A-F24.

B=250 with insufficient absolute tail → B=400, tail <10⁻¹⁵ and finite-sum enclosure <999·10⁻¹⁵. Direct evaluation of the displayed bound gives 5.2262035·10⁻¹⁰ at 250 and 5.8914290·10⁻¹⁶ at 400. The theorem remains |L′|<10⁻¹². BGZ85 line 252 reports numerical agreement, not this rational error certificate.

## R24 (P3) — applied

**Review references:** B-F09.

ModularCurves Layer 8 → Layer 10 for the compactified curve and cusps. Its prime-level scope is stated explicitly; EllipticCurveModularity R29.5 supplies the general-conductor curve/parametrisation used by the Heegner interface. Supplier Layer 10 and its Mazur interface state the cusp contract; Layer 8 is the cyclic moduli problem.

## R25 (P3) — applied

**Review references:** B-F12.

C₅₅(2)≈961.8 → ≈961.7 at both occurrences. Direct evaluation of the exact unchanged expression 165/(3−2√2) gives 961.69047558.

## R26 (P3) — applied differently

**Review references:** B-F14.

Unsourced C₅₅<55 and `primeDiscriminant_55_strict` → deletion of that route and use of `coprime_55`: log p≤165 implies p≤e¹⁶⁵<10⁷². O85 lines 444–448 and GZ86 lines 345–356 support the non-strict constant. This repair does not assert that the stronger strict theorem is false; it is unnecessary and its proposed justification was absent.

**Adversarial mathematics pass.** Definitions and their listed APIs are grouped below when the same instances check them. “Target” means the roadmap requires the proof; source support and hand checks do not replace that proof. All new hypotheses in Lean are explicit declaration binders. A Field/NumberField excludes zero-ring instances; degree two and negative discriminant remain separate hypotheses.

| Statement or definition/API | Instances tried | Result | Change |
|---|---|---|---|
| `isTotallyComplex_iff_discr_neg`; negative presentation import; `exists_positive_squarefree_radicand` | ℚ(i), ℚ(√−3), ℚ(√5), degree one | Signature identity r₁+2r₂=2 and discriminant sign give the equivalence; real radicand must exceed 1 | Import imaginary classification; separate real extension |
| Pinned `discr_eq_fundamentalDiscriminant`; `isFundamentalDiscriminant_discr` | −1→−4, −3→−3, −5→−20, 5→5; −243,−5077 | Squarefree/mod-4 transport agrees; D=1 excluded | Supplier transport rather than duplicate imaginary classification |
| `two_pow_sub_one_dvd_classNumber`, `discr_of_card_primeFactors_eq_one` | −4,−8,−3,−20; three ramified primes | t=1 gives 1∣h; −20 gives 2∣2; t=3 forces 4∣h | Preserve −1-radicand boundary case |
| Primitive reduced forms and unweighted class-number count | −4,−12,−16,−20,−23 | Fundamental hypothesis excludes the imprimitive controls; maximal-order count belongs to H1.3 | Named supplier gap; no duplicate count target |
| `reducedForm_four_mul_c_sq_ge`, `reducedForms_small_counts` | (1,0,1), (2,0,2), forms for 12,20,23,139,907 | d=4c² forces a=c,b=0; gcd=1 forces d=4. Counts 2,2,3,3 for 12,20,23,907 | Strictness conditions explicit; boundary targets and direct examples |
| `ramifiedWeight` and positivity, ≤1, prime-power, prime-factor congruence, odd-class API | d=0,1,907,15,84; p=2,3,5,7 | θ(15)=1/4, θ(84)=1/12; factors 1/3,1/4,1/3,3/8, all positive | Nonempty-product bundled tests |
| `splitPrime_size`, `splitPrime_boundary_fields` | d=3,p=7; d=4,p=5; d=7,p=2; d=23,p=2; ramified p | Principal prime power has nonzero irrational coefficient; bound holds with extra units; ramified case excluded | Generalized negative-discriminant binder |
| `liouville_agreement` | n=1,4,6; n=0; prime dividing d | Multiplicativity gives +1 at 4,6; χ(0), ramified values do not meet the hypotheses | Correct H2.1 supplier |
| `partialZeta_eq_epstein` | Principal q=(1,1,6); q=(2,1,3); d=3,4 | Norm denominator a gives q(1,0)=2, not 4; map (α)I⁻¹ fixes inverse class; units are 2,6,4 | New bridge, exact class convention |
| `dedekindZeta_eq_sum_reducedForms`, `nu_nonneg`, `nu_one`, `sum_nu_le_classNumber` | d=23, ramified p=23, d=3,4 | ν₁=1,ν₂=2; ramified Euler factor 1+23^(−s); w=2 simplification excludes extra-unit fields | Import H2.2 and owned partial-zeta bridge |
| `nonaxialCount_eq_zero`, `nonaxialCount_asymptotic`, `integral_nonaxialCount_le` | q=(1,1,6), A=√d/2; full vectors versus n≥1 | Values 6,6,8,8,12,12; half-ellipse area πt/√d; comparison measure at s=2 gives 4π/d and needs its π/2 atom | Source O85 §1.3 retained; full analytic proof remains a target |
| `goldfeldCompletion` and one/two/congr/product/order API | d=0; d=2,M=3; Ψ=0; s=0,1,2 | Product centre 30, F(2)=18 for unit factors; d,M>0 needed for order; totalized Gamma zero is not continued completion | Separate C3 F; product theorem restricted to right half-plane |
| C1–C4 | n=p versus p²; |α′|=√p; d=3,4; odd/even central orders | C1 forces nonsquares zero; denominators at s=1 nonzero since √p/p<1; reflection raises order ≥3 to ≥4 | Entire continuation explicit; d>4 retained for technical theorem |
| `inverseMellinKernel` and support/nonnegative/antitone/convex/Mellin API | m=0,1,2,3; a=0,1,−1; x≤0,1/16,1/4,1/2,1,2 | m≥2 and Re s>a required; negative-a example increases; a=1 doubles the half-argument value | Two bundled normalization/support tests |
| `positiveMellin_comparison`, cumulative variant | μ=δ₁, ν=(δ₁/₂+δ₃/₂)/2; signed μ; empty finite product | Integrated domination holds without pointwise domination; hinge representation and positivity give comparison; empty product is equality | Preserve integrated hypothesis |
| `fundamentalContour` | F=e^((s−1)²); F=(s−1)³e^((s−1)²); reflection identity | Missing central order gives integral 1/2; wrong reflection sign gives nonzero Gaussian integral | C3 continuation is the input |
| `truncatedResidue` | H=G=1; G(1)=0; strict cutoff U=2 | Expanded derivative residue is log d; division by G(1) used only for nonzero local product; U=2 gives empty product | Preserve expanded Lean residue |
| `tailThreePieces`, `oesterleTechnical` | h=1,4; P(d)=∅; dM<U; local roots at norm bound | h=4 needs m=3/2; absolute logarithm and γ normalization required; constant quantified before K,G,F | New F binder; source O85 lines 355–367 |
| `curve139`, `curve37`, all model/invariant/twist/source-equation API | Origin; (−156,77); invariants and rational coordinate substitution | Δ₁₃₉=266864328286957, c₄=3091360,c₆=5392722952; curve37 Δ=37,c₄=160,c₆=−2008; point substitution agrees | Additional curve37 and coefficient tests; O88-specific comparison uncertified |
| `curve5077`, discriminant/c₄/ellipticity/equation/minus-y/points API | (0,2),(1,0),(2,0),(0,−2) | First three lie on plus-y model; last belongs to minus-y model; Δ=5077,c₄=336 | Height convention aligned |
| `analyticRank_parity` | w=±1; zero/identically-zero functions; arbitrary supplied conductor | Euler series has a₁=1 so entire L is not identically zero; reflection determines parity after analytic nonzero factor at 1 | Owned general theorem with separate entire Λ |
| `twist_LFunction_coeff`, `twist_conductor`, `twist_rootNumber`, `twist_local_weilDeligne` | D=1; coprime D=−7,−139; good→additive, additive→good; wild p=2,3 | Exclude split D=1; constructor trace/norm discriminant is D; conductor ND² is only coprime case; local tensor handles overlaps | Full local target; no invented conductor carrier |
| `curve_local_data`, `curve37_trace_five` | Good 3,5,7; 139 additive; 5077 nonsplit | a₃,a₅ for 5077 are −3,−4; curve37 has a₅=0 with six points, a₁₃₉=−4 with 144 points, and split multiplicative reduction at 37 since −c₆≡11²; curve139 orders at 3,7 are 5,9; nonsplit node gives a₅₀₇₇=−1 | Separate good trace-zero control |
| `mordellWeilRank_eq_three` | Dependent point −2Q₂; rational torsion reductions; positive Gram matrices | Dependent replacement gives determinant zero; coprime reduction counts kill rational torsion; descent upper bound remains required | Preserve independence/descent distinction; normalize heights |
| `bgzKernel` and zero/nonpositive/positive/derivative/upper/Mellin/series API, `bgzKernel_boundary_bounds` | r=0,1,2,3; x≤0,1,2 | G₀=e^(−x); G′₁=−e^(−x)/x; factorial needed for r=2,3; positive-x assumption excludes convention points | Bundled nonpositive tests; positive boundary target |
| Kernel series/integral remainders | x=5,r=1,K=1; K=0; Y=e^(r−1) | Integrated exp Taylor remainder gives first-omitted bound for every K≥0; integral-tail monotonicity starts at stated Y | Corrected false counterexample and unnecessary K restriction |
| `centralDerivative_series`, `centralDerivative_tail`, `LFunction_coeff_eq` | r=0,+ sign; r=1,3,− sign; n=0,1,2; good/additive/multiplicative recursion | a₀=0 forced by bound; n=2 term has a₂/2; third derivative requires lower vanishing; geometric tail includes r! | Per-input dependencies and error budget |
| `curve5077_deriv_small`, `curve5077_twist7_central_bounds`, `curve37_central_bounds` | B=250,400; twist α>1/80,B=2048; central real values | First tail fails at 250, works at 400; nonvanishing brackets are 4–5 and 0.72–0.73; rational enclosures remain proof targets | Added easy Lean milestones; no exact zero inferred numerically |
| `heegnerTrace`, field/Galois/conjugation API | Principal ideal; class of order 3; N=27,D=−3; N=37,D=−139; N=5077,D=−7 | Arithmetic Artin sends x_a to x_{b⁻¹a}; trace invariant; cyclic quotient fails at 27; construction distinct from formula’s odd/coprime conditions | Explicit inverse convention and negative control |
| `grossZagier_heegnerTrace`, `grossZagier_ellipticCurve` | h(K)=1,3; ψ=1; φ replaced by [m]φ; D=−3,−4 | 8π²/(hu²√d), relative H/K/ℚ heights and deg φ factors agree with GZ86 (6.3)–(6.5); even D excluded from this source form | Owned formulas, exact polarisation/differential normalization |
| Product rule and `heegnerHeight_gap` | a=0; b=0 excluded; η=0 or η≥δ; δ≤0 | Full product rule has two terms; scalar gap deduction remains valid and forces η=a=0; a negative/zero gap cannot meet a strict smallness hypothesis | Vanishing hypotheses explicit |
| `curve5077_height_gap`, descent/constant targets, `curve5077_deriv_eq_zero` | O excluded; P₁ height≈0.6682; denominator 2; reductions over 𝔽₉,𝔽₂₅ | Rational gap 1/2; relative K gap 1 requires actual rational descent; reduction orders 7,20 force torsion-free K-points; c positivity alone insufficient | Both quantitative prerequisites named, fixed parametrisation |
| η quotient invariant/q-expansion/divisor API | Exponents ±1 versus ±2; cusps 0,∞; first two terms | Congruences require square; divisor 3(0)−3(∞); q⁻³−2q⁻² fixes cusp order and sign | Correct ModularCurves supplier layer |
| `etaQuotient37_cm_value`, `_eq`, `heegnerTrace_37_eq_zero`, `heegnerTrace_139` | Norm (3+√−139)/2=37; degree-three H/K; roots of unity | Only ±1 among twelfth roots in H; common CM value gives principal trace divisor; nonzero untwisted L(1) and zero twisted L(1) select product-rule term | Heegner supplier and omitted term corrected |
| Third-derivative and exact-rank milestones for both curves | Vanishing before r=3; divided derivative versus raw derivative | Enclosures 18.42–18.44 and 1.73–1.74 concern L‴/6, exclude zero and give finite order exactly 3 with parity; arithmetic rank is separate | Moved to §§2.12–2.13; Lean dependency order aligned |
| Liouville twist/product definition and `liouvilleProduct_eulerFactor` | Good a_p=0; multiplicative a_p=±1; additive a_p=0 | Product square-supported; good trace-zero factor (1+pX²)⁻² differs from additive 1 | Corrected local distinction |
| Sym² definition, `sym2_localFactor_comparison`, `sym2_rankinSelberg_comparison` | Good roots α,β; multiplicative; ramified quadratic twist of good; wild additive | Frobenius roots α²,p,β² at good p; χ²=1 retains Sym² under quadratic twist; inertia/monodromy determinant covers every type | General correction R_p and unitary shift u=w−1 explicit |
| `rankinSelberg_selfPair_polynomialGrowth`, `liouvilleProduct_C4` | Self-pair poles 0,1; norm translates; s=1+it | Self-pair is excluded from IsNicePinned but has completed bounds away from poles; finite polynomial growth requires separate pole/gamma/finite-order argument; ζ(2s−1) gives a simple zero | Owned adapter; no inference from completed boundedness alone |
| `liouvilleSystem`, `ramifiedTwistSystem`, `ramifiedTwist_local_comparison` | χ(−N)=±1; all good/multiplicative/additive pairs under ramified twist; 139 signs ± | Plus product sign is necessary; regained roots give square-supported Ψ and numerator G; finite local quadratic characters give finitely many cases, including 2,3 | Corrected ramified system with full local obligations |
| `peterssonNorm_sym2`, `oesterleConstant_139`, `oesterleConstant_5077` | Squarefree N; all four 139 scales; both ε | c₁=4π(f,f)∏p/(p−1), with the required 1/N in Sym²/Petersson comparison; restored B rescales c₁ and shifts c₂ as stated; c₅∝M^(3/2) | Recompute contour/tail inputs; retain constants as targets, not certified intermediate tables |
| `exceptional_5077`, `global_7000`, `coprime_55` | d=3,4; real +5077; d prime; 37 split/inert/ramified | −5077≡3 mod4 impossible; positive 5077 is real; split branch uses norm obstruction; 55 retains its coprimality hypothesis | Delete unsupported strict-constant route |
| `primeMajorant` and zero/one/succ/pos/monotone/weight/log APIs | t=0,1,2,3; c=0,positive; d=84 | Denominator (√p−1)²>0 for p≥2; floor factors not monotone but smooth majorant is; C₅₅(2)=961.69047558; θ(84)C(3)≥c | Consolidated examples; rounded value corrected |
| `explicitT_bound`, nth-prime/sum asymptotics, `primeMajorant_log_asymptotic` | Zero-based primes 2,3,11; finite index shifts | Empty product gives prime endpoint 55; PNT inversion and partial summation give constants 1,2,4 respectively; no explicit finite prime bound needed | Remove conditional Rosser–Schoenfeld input |
| `effectiveKappa` and branch/positive/monotone APIs | q≤0,1/4,1/2,1,2 | Values 0,2⁻⁸¹⁴,2⁻³⁰²,1/2; ceiling and integer exponents agree, positive q ensures positivity | Two bundled examples |
| `effectiveLogarithmic_bound`, `effective_cutoff`, `effective_vs_siegel` | h=1; q≥1; ε≥q; d=3; q=1/2 | log d>1 makes larger loss weaker; κ=1/2 handles q≥1; cutoff exponents 604,605 follow by squaring and eˣ≤4ˣ; Siegel constant remains ineffective | Correct H2.2/H2.4 suppliers |
| `classThree_prime`, Hardy/phase/Stirling/approximate-functional-equation targets | −4,−8; p≡7 mod8; χ₋₃ at t=0; odd versus even gamma | Exceptional h=1 fields excluded; split 2 gives p≤32; odd gamma uses (s+1)/2 and correct real phase; Stirling needs its argument-dependent remainder | Character supplier corrected; analytic proof obligations retained |
| `mwZero_brackets`, `montgomeryWeinberger` | k=17923,115147,123204; dyadic values −1,−1,0; closed range endpoints | Fundamental conductors and MW74 Table I values lie in brackets; endpoint signs and interval exclusions remain explicit proof targets, not assumed numerical data | Correct character/cast supplier |
| `IsInertPrime`, projections/antitone API, three least-prime targets | x=0,3; p=3; composite 77683; candidate prime patterns through 43,47,67,163 | Small-x convention retains mod8; q=p gives zero and rejects; candidates have prescribed Legendre values; minima are supported by LLS70 Table III | Positive, negative and dyadic tests bundled |
| `smallRange_sieve`, `classThree_cutoff` | 907,10¹²,10²⁵⁰⁰; prime chain | 4·43³=318028,4·67³=1203052,4·163³=17322988; least-pattern chain reaches 1432817816347>10¹²; 165/log10≈71.6586 | Non-strict log bound suffices; endpoints covered |
| `classThreeDiscriminants`, card/membership/negative API, `classThree_enumeration` | All fundamental −d with d≤907; −243,−163; −23,−31,−907 | Independent exact enumeration gives exactly sixteen listed discriminants; −163 is a class-one negative control and −243 nonfundamental | Two direct bundled definition examples |

**Required checks.**

- Elaborate `Suggested.lean`: **not available**, as specified in the brief. No Lean command, build, cache download or inferred-type scratch elaboration was run. Written binder scopes, native carriers and every imported file were checked against the manifest pins; proof-script elaboration remains unverified.
- Dependency gate: **exit 0**. Exact output:

```text
depcheck: 5 roadmaps, 31 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. The pre-existing merge-order modification was left untouched.

- `git diff --check -- packages/EffectiveClassNumbers`: exit 0, no output.
- Textual consistency: every Lean declaration name occurs in the README; the 36 README-only API targets are described with their mathematics in the corresponding Lean docstrings. No Lean declaration, binder, proof body or example changed in the format repair. No stale fictional suppliers, old local count/radicand names or deleted strict-bound name remain. One `import Mathlib`; all seven individual Tau Ceti import files exist at the pin; no `set_option`, admitted data, admitted examples or `lemma` declarations. Every kept definition has at most two proved example declarations. These are static checks, not Lean elaboration.
- Direct arithmetic checks: discriminants/invariants and small good-prime point counts; θ(15), θ(84); six reduced-form counts and the entire class-three list through 907; prescribed Legendre values of the LLS candidates; all three prime-chain inequalities; the 139 local/Taylor corrections; derivative-tail error budgets; the remainder counterexample and the 961.7 rounding. Numerical scratch checks are diagnostics, not claimed rational Lean certificates.

**Format validation.** The 26 merged finding sections use unique `R01`–`R26` identifiers and preserve all 39 original review references and their verdicts. TeX brace indices and powers outside code were normalized to parenthesized notation (124 occurrences); 52 HTML anchors were deleted. O88 changed from the invalid `unavailable` status to `uncertified`, with licence class `none`, preserving its locator-only status and the absence of readable text. Mathematical targets and Lean code are unchanged.

- Package text scanners: exit 0; all 19 counts are zero, including `tex=0`, `residue=0`, and `readme-ids-missing=0`.
- Report parser: 26 sections, 26 unique IDs; all 39 original review IDs retained exactly once in the section reference lines.
- Source-manifest validation: exit 0, no problems.
- Comment-stripped Lean token comparison: unchanged. Protected-file hashes for the merge order, metadata and design plan: unchanged.

**Sources and remaining prerequisites.**

All nine original works and the added DEL73/COG04 references were requested through the sources service. Ten readable texts have certified provenance entries. O88 is recorded as `uncertified` with licence class `none`: the DOI lookup/landing page does not deliver a readable article, so it is cited by locator alone. The existing missing-reference file retains its lookup history; the manifest status settles the citation under the brief’s rules. No source text, machine path or access-check HTML is in the package. O88-specific model/isogeny provenance is not certified by this repair; independent O85/GZ86/BGZ85 support settles the findings that use their overlapping mathematics.

The primitive-reduced-form supplier adapter is **not actionable in this package**: only ImaginaryQuadraticClassNumber H1.3 can add that contract to its own roadmap. It is now declared exactly as gap:fundamental-reduced-forms-primitive, with the same slug, supplier, section and one-sentence need in the README and the new gaps-only `packages/EffectiveClassNumbers/design/plan.json`. The package identifier has not been renamed; its mathematical identity as ImaginaryQuadraticClassNumber, Part II is stated in the introduction. No existing roadmap is replanned.

No numerical proof of the Gross–Zagier constant, the 7000/55 intermediate enclosures, the complete rank-three descent, MW endpoint signs/window exclusions or the largest inert-pattern minimum is claimed here. They are explicit mathematical targets with their prerequisites, rather than supplied data or unsupported imported contracts. The finite-growth adapter includes the finite-order/global-integral proof obligation; a functional equation alone is not used to infer growth.

Consumer-visible changes: `splitPrime_size` now takes negative discriminant rather than discriminant below −4; `curve5077_height_gap` concludes 1/2; `oesterleTechnical` takes the separate entire F and convergence-half-plane agreement; `goldfeldCompletion_product` carries the same half-plane restriction. `primeDiscriminant_55_strict` is deleted and its only internal consumer uses `coprime_55`. Local README `exists_squarefree_radicand`, `discr_eq_fundamentalDiscriminant_radicand`, `classNumber_eq_card_reducedForms` and owned `reducedForms_primitive` were replaced by the named base-roadmap contracts/gap; all internal consumers were updated. Newly stated parity, coefficient, numerical and boundary signatures appear in the README. No edits were made to supplier roadmaps, tooling, pull-request text or the merge order; no commit was created.
