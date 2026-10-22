# EffectiveClassNumbers: repair dispositions

`Ann` identifies finding Fnn in the round-2 pass a; `Bnn` identifies finding Fnn in pass b. Their new findings concern distinct defects. The earlier-findings verification tables do not add findings or reopen the declared primitivity supplier gap.

## A01 (P1) — applied

Unsupported Mathlib Gamma estimates → AnalyticNumberTheoryPartI §0.23a's named log-Gamma/Stieltjes contracts, followed by uniform strip modulus bounds, recurrence shifts and balanced-quotient bounds in §3.1. Both growth and C4 consumers cite this input. Evidence: Mathlib `factorial_isEquivalent_stirling` concerns factorials; DLMF line 490 gives (5.11.9), and COG04 line 3341 begins the completed strip argument. The existing DLMF manifest key gains §3.1 and (5.11.9).

## A02 (P1) — applied

Owned general `LFunction_coeff_eq` → EllipticCurveModularity R29.4's three named coefficient/completion contracts; every consumer now cites them. Added `curve_models_minimal`, the scaled-equation negative Check and its finite point-count proof. Evidence: Mathlib `AlgebraicGeometry/EllipticCurve/LFunction.lean:44` chooses `W.minimal R`; R29.4, “The bad factors and all Dirichlet coefficients,” owns the interface. At 7 the raw counts are 9 and 8, but both intrinsic polynomials are 1+T+7T².

## A03 (P1) — applied

Docstring-only reference → the explicit `curve5077_twist7_central_bounds` signature, with differentiability and agreement with the twisted Euler series on Re s > 3/2. Its constructor parameters have discriminant 1²−4·2=−7 (Tau Ceti `QuadraticTwist/Basic.lean:169`). An independent numerical sum gives approximately 4.47675717; the rational enclosure remains the stated theorem obligation.

## A04 (P3) — not actionable in this package: merge-order edits are excluded

The branch diff does include the insertion in `merge-order/ORDER.txt`. This job expressly forbids editing that file or pull-request text. Excluding that insertion requires an intake/maintainer action outside this package. The existing order was used unchanged for the dependency check; this is an administrative disposition, not a mathematical supplier gap.

## A05 (P3) — applied

Only factorial-insensitive kernel values → the additional nonzero Check I_(0,3)(1/2)=(log 2)²/2>0. Equality and positivity are conjuncts of the first existing proved example, retaining two examples for the definition. Direct substitution gives the factor 1/2; deleting the factorial doubles the value. The definition and Mellin-transform theorem are unchanged (O85 line 255, §3.3).

## A06 (P3) — applied

“k=1 is excluded by D<0” → k=1 fails because −1 is not fundamental; the separate trivial fundamental discriminant +1 fails negativity. Indeed −1<0 but −1≡3 mod 4, contradicting both fundamental-discriminant branches. No Lean statement changes.

## A07 (P2) — applied

Nonexistent converse of `isFundamentalDiscriminant_discr` → ImaginaryQuadraticClassNumber H1.1 model construction and H1.2 discriminant transport for each listed squarefree d with −d≡1 mod 4. The original theorem remains only the forward filter for an already given quadratic field. Its elaborated conclusion contains no field-existence assertion; the final enumeration signature is unchanged.

## A08 (P2) — applied

General parity proof planned locally → consumption of AutomorphicLFunctionsAndLocalFactors AL.5 `central-sign-vanishing`. The retained `analyticRank_parity` is the elliptic adapter, translating the centre, supplying continuation/reflection and excluding L≡0 through a₁=1. The exact contract, Needs and docstring now identify this boundary. Evidence: AL.5's named interface includes Taylor parity and transport through a nonzero Gamma factor; COG04 line 3290 supplies the functional equation.

## A09 (P2) — applied

Inversion alone → dual cohomology with geometric Frobenius: arithmetic acts by A^(−transpose), hence geometric by A^transpose. Inertia and monodromy travel through the same duality in §§2.3 and 3.1. Added the 1+5T² and split 1−T Checks and the boundary target `curve37_local_polynomial_checks`. R29.4 explicitly compares cohomological invariants with homological coinvariants; DEL73 line 1972 fixes the invariant/ker-N determinant.

## B01 (P3) — applied

Failing θ(15), θ(84) proof → prime-factor multiplication/power identities, explicit erased finite sets and product evaluation. Removed the tactic after an already closed square-root goal. The resulting proved example gives 1/4 and 1/12 with no non-`sorry` diagnostic at the pins; neither mathematical definition nor statement changes.

## B02 (P3) — applied

Unclosed casts after `Real.log_pow` → normalization of those casts in both auxiliary logarithm equalities. The endpoint/non-antitonicity example now elaborates, including the strict comparison (log 2)/4<(log 2)/2. Its statement is unchanged.

## B03 (P3) — applied

Premature normalization of the product denominator → structural simplification of the two finite products before numerical normalization and `ring`. The same C₅₅(2), C₅₅(3) equalities now elaborate. No nonvanishing hypothesis or inverse identity is assumed.

## B04 (P3) — applied

Applying a goal-location normalization after contradiction closed the goal → a branch that finishes the contradictory primality case before normalizing membership. Both the 43-inert and 47-inert assertions for 1333963 now elaborate as the existing proved example. The predicate and thresholds are unchanged (LLS70 line 527, Table III).

## B05 (P3) — applied

Redundant `simpa` and trailing `rfl` → `simp` for Γ(2)=1 and the sufficient κ normalization script. The final full-file run emits neither linter warning; the mathematical statements are unchanged.

## B06 (P3) — applied

Two admitted elementary targets → proved theorems with unchanged names and signatures. `effectiveKappa_pos` splits its three defining branches; `curve139_source_equation` uses the affine-equation identity and the nonzero multiplier −64/139³ in both directions. Both proofs elaborate against Mathlib. The latter equation is the model at GZ86 line 329, Proposition (7.4).

## Adversarial mathematics pass

The table covers the definitions, their named API families, theorem targets and conventions in README order. “Retained” records the mathematical checks below; it is not independent acceptance. Historical numerical theorem targets remain proof obligations, rather than assumptions inferred from approximations.

| Statement or API family | Instances and boundaries tried | Result | Change |
|---|---|---|---|
| Quadratic-field and fundamental-discriminant conventions; §0.1 sign/radicand transports | ℚ, ℚ(i), ℚ(√−3), ℚ(√5); D=1, −1, −243, −5077 | Degree-two and sign hypotheses separate the cases; −1 is not fundamental. H1.1–H1.2 construct the imaginary models. | A06, A07 |
| `isFundamentalDiscriminant_discr`; genus divisibility; one ramified prime | d=3,4,8,20; t=1,2 | 2^(t−1) divides h; for d=20 it is 2, not 4. The radicand −1 boundary is handled separately. The discriminant theorem is one-way. | A07 |
| Reduced-form bound, primitive count, `reducedForms_small_counts` | d=4,12,16,20,23,139,907 | Equality at (1,0,1) and imprimitive (2,0,2); boundary sign removes (2,−2,3). Counts are 1,2,2,2,3,3,3 respectively. The existing H1.3 primitivity gap remains necessary. | Additional elaboration repair below |
| `ramifiedWeight` and its APIs | d=0,1, prime powers,15,20,84,907 | Empty product 1; θ(15)=1/4, θ(20)=1/3, θ(84)=1/12; largest prime and distinct factors matter. All factors are positive. | B01 |
| `splitPrime_size`, boundary fields | d=3,p=7; d=4,p=5; d=7,p=2; d=23,p=2; d=20,p=3 | The norm computation includes the extra-unit fields. Dropping 4 fails at d=7,p=2; unramifiedness makes the two prime ideals distinct. | Retained |
| `liouville_agreement` | n=1,4,6; a prime dividing d; n=0 excluded | Empty prime-factor set uses χ(1)=1; coprimality excludes χ(p)=0 versus λ(p)=−1. | Retained |
| `partialZeta_eq_epstein`, reduced-form zeta decomposition and ν APIs | Forms (1,1,6),(2,1,3); d=3,4,23 | Norm-2 ideal requires division by 2; inverse class and unit factors 6,4,2 are distinct. For d=23, ν₁+ν₂=3. | Retained |
| Nonaxial count and integrated bound | (1,1,6); t<c; A=√d/2; axial/all-vector variants | First values 6,6,8,8,12,12. The boundary integral is zero; the comparison atom gives Mellin value 4π/d at s=2. | Retained |
| `goldfeldCompletion` and its APIs | d=0 at 1; d=2,M=3 at 1,2; Ψ=0; s=0 | Values 30 and 18 discriminate the powers. Totalized Gamma gives zero at 0, whereas the separately supplied continuation need not. Product scale is ΛΛχ/d. | B05 proof cleanup |
| C1–C4 and `oesterleTechnical` | n=1, squares/nonsquares; zero Ψ; d=3,4; arbitrary auxiliary data | Simple-zero input excludes Ψ=0; d>4 is explicit in the technical theorem. Series, coefficient and Euler-product hypotheses tie every auxiliary function to the system. | A01 supplies missing analytic input |
| `inverseMellinKernel` and its APIs | m=2,3; x=1/2,1,2; a=0,1,−1 | Interior factorial is now tested at a nonzero value; endpoints vanish; negative a fails antitonicity. Re s>a protects Mellin integrability. | A05, B02 |
| Positive Mellin comparison and cumulative adapter | Zero measure; δ₁ versus (δ_(1/2)+δ_(3/2))/2; signed measure; a<0 | Integrated domination permits the two-atom example without pointwise domination. Signed measures and negative a fail the intended positivity/hinge argument. | Retained |
| `fundamentalContour` | F=0; (s−1)³exp((s−1)²); exp((s−1)²) | The two negative controls have normalized integrals 1/(2√π) and 1/2. Plus reflection, sufficient vanishing and strip decay are all explicit. | Retained |
| `truncatedResidue`, contour indentation and strict cutoff | H=G=1; U=2; totalized quotient at 1 | Residue is log d; strict cutoff gives an empty product. The removable extension avoids the false value 0/0. Local denominators are nonzero on Re s≥3/4. | Retained |
| Three remainder estimates and technical constant | dM<U; d=23; M=N/(4π²) | Absolute logarithm is needed; Σ1/a=2; (2π⁴/3)M^(3/2)=πN^(3/2)/12. Uniformity excludes dependence of C on K or G. | Retained |
| `curve139`, `curve37`, source equation and invariant APIs | (0,0), (−156,77); c₄,c₆,Δ; rational coordinate substitution | Invariants are (3091360,5392722952,37·139⁶) and (160,−2008,37). The equation difference scales by −64/139³, a nonzero rational. | B06 |
| `curve5077` and its equation/point APIs | (0,2),(1,0),(2,0); (0,−2); sign change of y | The three plus-y points satisfy the equation; (0,−2) fails it. Δ=5077, c₄=336; negating y gives the other source model. | Retained |
| `analyticRank_parity` | Root signs ±1; L≡0; centre 1 versus 1/2 | a₁=1 excludes the zero function; Gamma is analytic/nonzero near 1. General parity is AL.5's; only the elliptic adapter remains. | A08 |
| Twist coefficient/conductor/sign targets | D=1; trace/norm (1,2); even fundamental D; primes ramified in D | Parameter discriminant is D; D=1 is excluded from a quadratic field. Coprime conductor formula is separate from shared-prime local theory, including 2 and 3. | A03, A09 |
| `twist_local_weilDeligne` and determinant convention | Good trace-zero p=5; split multiplicative p=37; double local twist; wild primes | Dual geometric operator is A^transpose. The determinants are 1+5T² and 1−T; inversion alone gives 1+T²/5. Inertia/monodromy remain present. | A09 |
| `curve_local_data`, `curve_models_minimal`, local polynomial Checks | p=2,3,5,7,37,139,5077; scaled equation at 7 | Discriminant valuations 0,1,6 are below 12. Counts give a₅=0, a₇=−1. Scaling creates a singular raw reduction, without changing the intrinsic polynomial. | A02, A09 |
| Arithmetic ranks and torsion | Coprime reduction orders 7,10 and 5,9; dependent point −2Q₂ | Coprime orders kill torsion; a positive 3×3 height determinant proves only the lower bound. The descent upper bound is separately required. | Retained |
| `bgzKernel` and its APIs/remainders | r=0,1,2,3; x≤0; x=1,2,5; K=0,1 | Boundary convention is separated from positive x. G₁′=−exp(−x)/x fixes normalization; the integrated Taylor remainder works when initial terms increase. | Retained |
| `centralDerivative_series` and tail | r=1,3; r=0 plus-sign form; n=0,1,2; B=400 | Coefficient bound forces a₀=0; lower vanishing is explicit for r=3. The a_n/n factor matches Table 2. B=400 gives tail about 5.89143·10^(−16). | Coefficient consumers use A02 contract |
| §2.7 numerical milestones | Entire L versus totalized series; −7 twist; conductor 37 | Entire/right-half-plane binders are retained. Twist central sum is about 4.47675717 with geometric tail below 10^(−8); a small first derivative alone implies no exact vanishing. | A02, A03 |
| `heegnerTrace` and its API | Trivial class and order-three class; (N,D)=(37,−139),(5077,−7),(27,−3) | Arithmetic Artin action uses the inverse. The norm-27 quotient is ℤ/9×ℤ/3, not cyclic; the norm-3 quotient is cyclic. | Retained |
| Gross–Zagier targets and base-change product rule | Odd/coprime D versus even/shared D; w_E=±1; φ replaced by [m]φ | Formula retains its source hypotheses; relative height doubles rational height. Scaling φ changes trace height and degree by m². Both product-rule terms are present. | Retained |
| Height-gap principle and E₅₀₇₇ specialization | b=0 excluded; η=0 or η≥δ; rational descent; orders 7 over 𝔽₉ and 20 over 𝔽₂₅ | The algebraic principle is proved; the full rational-height gap is 1/2 and relative gap 1. The fixed positive constant and twist nonvanishing are necessary. | A03 supplies the missing signature |
| η-quotient, divisor and CM-value APIs | Exponents ±1 versus ±2; q^(−3)−2q^(−2); class number 3 | Unsquared quotient fails the congruences. Divisor is 3(0)−3(∞); degree-three H excludes the requisite quadratic root-of-unity extensions. | Retained |
| Heegner trace vanishing and rank-three end targets | Nonzero conductor-37 central value; exact L′=0 before L‴; zero entire function | Divisor argument gives an exact zero. Nonzero third derivative gives finite order 3, separately from arithmetic rank. | A02 coefficient consumers |
| Liouville product and symmetric-square local APIs | Good a_p=0; multiplicative; additive quadratic twist of good; wild types | Good trace zero gives (1+pX²)^(−2), not 1. Restored Sym² roots survive the quadratic twist; all bad types use the determinant. | A09 convention propagated |
| Finite self-pair growth and `liouvilleProduct_C4` | Self-pair poles 0,1; norm-twisted poles; Gamma strips with nonpositive real part; abs(Im s)≥1 | Pole removal applies to the actual self-pair. Uniform Gamma bounds after recurrence and balanced quotient cancellation support polynomial finite growth and exponential C4 decay. | A01 |
| Coprime and ramified modular systems | χ(−N)=±1; simultaneous overlaps at 37,139; shared wild primes | Plus reflection is a hypothesis. Corrected Ψ remains square-supported; local finite character sets yield finitely many scales for fixed f. | A09 convention propagated |
| Restored factor at 139 | Both signs ε; coefficients at 139 and 139²; s=1 | B=(1+262X²+19321X⁴)^(−1), B(1)=19321/19584, B′/B=11 log(139)/408. Odd coefficient vanishes. | Retained |
| Petersson normalization and constants 7000/55 | M=N/(4π²); all four 139 scales; prime d | c₁=4π(f,f)∏p/(p−1), c₅=πN^(3/2)/12. Every corrected constant enclosure is a theorem obligation; 55 needs no strict improvement. | Retained |
| `exceptional_5077`, `global_7000`, `coprime_55` | −5077 versus +5077; d=3,4; split/inert/ramified conductor primes | −5077≡3 mod 4 is impossible; the real +5077 is outside negativity. The 7000 bound includes all overlaps; 55 retains coprimality. | Retained |
| `primeMajorant` and APIs/weight domination | t=0,1,2,3; c=0; d=84; primes 2,3 | Empty products give c; denominator (√p−1)² is positive. Smooth factors decrease, whereas floor factors need not. | B03 |
| Elementary growth, `explicitT_bound`, prime asymptotics | t=1; p₀=2; first five primes; c=55,7000 | Prime-discriminant endpoint is 55; π(p_n)=n+1. The qualitative PNT gives the missing (log n)^(−1/2) factor; constants do not affect the asymptotic. | Retained |
| `effectiveKappa` and APIs | q≤0; q=1/4,1/2,1; q>1 | Values 0, 2^(−814), 2^(−302), 1/2; the ceiling exponent decreases with q. Positive-branch proof is elementary. | B05, B06 |
| Effective logarithmic theorem, cutoff and Siegel comparison | h=1; H=0; ε≥q; q≥1; d=907 | H=0 is impossible, h≥1 handles q≥1, and log d>1 gives exponent monotonicity. Exponents 604/605 follow by squaring; no effective Siegel constant follows. | Retained |
| Class-three prime reduction | d=3,4,8,23,31; p≡7 mod 8 | Small exceptional fields have h=1; p≡7 mod 8 forces p≤32, retaining 23 and 31. | Retained |
| Hardy function and Gamma phase targets | Odd versus even Gamma factor; t=0; an enclosure straddling zero | Γ((s+1)/2) and its continuous phase are required. A sign-straddling enclosure proves no zero. | Retained |
| Montgomery–Weinberger zero brackets/exclusion | Three conductors; χ(2)=−1,−1,0; range endpoints | Odd-prime and dyadic data specify the intended character. Opposite endpoint signs, not a small complex value, prove existence; closed exclusion intervals cover their boundaries. | Retained |
| `IsInertPrime` and minimum APIs | x=0,3; p=3; 1333963 at 43,47; composite 77683 | Small-x convention is explicit, (−3/3)=0 rejects x=3, and primality rejects the smaller composite. Table III's least-prime column is the relevant one. | B04 |
| Small-range exclusion, cutoff, `classThreeDiscriminants` and enumeration | 4·43³,4·67³,4·163³; d≤907; −243,−163; endpoint −907 | Chain thresholds are 318028,1203052,17322988. Independent reduced-form enumeration through 907 gives exactly the sixteen listed discriminants. Construction of each field uses H1.1–H1.2. | A07 |

## Check outcomes and additional elaboration repairs

- The first required `lake env lean` invocation on `packages/EffectiveClassNumbers/Suggested.lean` stopped at a missing compiled Tau Ceti import. The permitted targeted builds all exited 0: `TauCeti.NumberTheory.Multiquadratic.FundamentalDiscriminant.Basic`, `.Character`, `TauCeti.NumberTheory.BinaryQuadraticForm.Reduced`, `TauCeti.AlgebraicGeometry.EllipticCurve.QuadraticTwist.Basic`, `.MordellWeil.PointModTorsion`, and `TauCeti.Analysis.Contour.Residue.Basic`. `CanonicalHeight.Basic` was built as a dependency of `PointModTorsion`.
- Full-import elaboration then exposed the previously unverified reduced-form example: kernel reduction of its finite-set equality got stuck. Its statement is unchanged; `native_decide` proves this small finite calculation. The newly expanded kernel example also needed `sq_pos_of_pos` after normalization; that positivity proof is now explicit.
- The final required `lake env lean` invocation from the content checkout exited **0**. Its exact diagnostic totals are **0 errors and 60 warnings**, all `declaration uses 'sorry'`; there are no other diagnostics. All 24 examples and the two instance bodies are proved.
- A scratch copy with `#check @name` also exited **0**. The elaborated types retain differentiability and right-half-plane agreement for `curve5077_twist7_central_bounds`, primality for `curve_models_minimal` and `curve37_local_polynomial_checks`, and every ellipticity, conductor, continuation and reflection binder of `analyticRank_parity`. The unchanged types of the two newly proved B06 theorems were also checked.
- The required dependency check exited **0**, using the unchanged board order. Its complete output was:

```text
depcheck: 9 roadmaps, 73 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. `git diff --check` exits 0. Both TOML files parse; all 82 named Lean declarations appear in the README. The file has one `import Mathlib`, seven individually used pinned Tau Ceti imports, 11 real-bodied definitions, 69 theorems, two proved instances and 24 proved examples. Each definition retains at most two examples; no `set_option`, sorried data or prohibited command was introduced.

## Maintainer consequences

The only new Lean names are `curve5077_twist7_central_bounds`, `curve_models_minimal` and `curve37_local_polynomial_checks`; all appear in the README. No existing Lean name or signature was deleted or changed. The README-only general target `LFunction_coeff_eq` was deleted; citations to it should use EllipticCurveModularity R29.4's coefficient contract. General parity stays with AL.5; the local name `analyticRank_parity` remains its elliptic adapter. Gamma input now explicitly comes from AnalyticNumberTheoryPartI §0.23a. All these suppliers precede this package; no ownership moves to a later roadmap were needed.

The already declared `gap:fundamental-reduced-forms-primitive` remains identical in the README and the plan. No new supplier gap is required, and `design/plan.json` and `metadata.toml` are unchanged. The eleven unique source keys remain; O88 is settled locator-only and no missing-reference request is reopened. Source texts were read from the legal cache; DLMF's existing locator/use metadata is the only manifest change.

The merge-order insertion still needs the outside-package action described under A04. This repair changes only `packages/EffectiveClassNumbers/README.md`, `Suggested.lean`, `sources.toml` and this report. No commit, push, pull-request edit or message to another service was made. Numerical central sums and elementary counts were independently sanity-checked; the roadmap's admitted analytic enclosures, descents and large exclusion theorems remain library proof targets. These dispositions and successful checks do not replace the required fresh independent review.
