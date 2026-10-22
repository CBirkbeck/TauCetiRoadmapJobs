## H01 (CBirkbeck) — applied

The API catalogue became ten headline theorems and seven necessary concrete definitions in `TauCetiRoadmap/EffectiveClassNumbers/Suggested.lean:38`, including the previously unstated integrated lattice estimate at line 51; the rank-three results, uniform constants, explicit logarithmic bound, cutoff and sixteen-discriminant classification remain. All seventeen elaborated signatures were compared with their README statements: no standing hypothesis disappeared, and the two rank statements now share exactly the continuation, finite analytic order and native Mordell–Weil-rank formulation.

## H02 (CBirkbeck) — applied

The blanket reference to heavy constructions became an explicit account of the unstatable Gross–Zagier formulas, geometric Heegner-trace vanishing and all-factor symmetric-square comparison in `TauCetiRoadmap/EffectiveClassNumbers/Suggested.lean:16`, naming their missing arithmetic Heegner/Jacobian/parametrisation and Weil–Deligne/L-function carriers. Their complete mathematical targets remain in README §§2.8, 2.11 and 3.1, with no scalar height-gap or derivative-only theorem presented in their place.

## H03 (CBirkbeck) — applied

Sixty-nine theorems, eleven definitions, two instances and twenty-two value-computing examples became ten headline theorems, seven definitions, no instances and no examples in the 194-line `TauCetiRoadmap/EffectiveClassNumbers/Suggested.lean`. Boundary fields, small form counts, Euler-factor controls, kernel identities and numerical enclosures remain prose targets or Checks in README §§0.1–5.8; the standalone numerical conjuncts of the rank-three statement likewise remain in §§2.7 and 2.13.

## H04 (CBirkbeck) — applied

Proposed API identifiers became mathematical facts and subsection references throughout `TauCetiRoadmap/EffectiveClassNumbers/README.md:7`, with definition APIs retained as prose bullets and the elementary conductor-37 curve, kernels and inert-pattern predicate described without claiming Lean declarations. The concrete nonaxial count and integral statement agree at README line 276 and Lean lines 46–57, with explicit finite-count hypotheses and discriminating Checks, including integral values 1 and 3π/4 at README line 292.

## Verification

All four findings are distinct requirements from the single review paragraph, in its original order. No question requiring a separate answer was present.

The original 82 named declarations and their supplied elaborated types were compared before selecting the acceptance targets. A scratch module then elaborated `#check @name` for every one of the final 17 declarations successfully. The explicit degree-two and negative-discriminant hypotheses remain in every field theorem; the coprimality binder remains in the 55 theorem; the rational loss, positivity and real-loss comparison remain in the logarithmic theorem; and d>0, the actual discriminant, reduction and A≥0 remain in the new lattice statement. The constant in the technical theorem is still quantified before K and G. No section-binder repairs were needed; the changes concern which statements belong in the acceptance test and their agreement with prose.

The native definitions were read at Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, matching the manifest:

| Native interface | Locator and precise limitation |
|---|---|
| Maximal-order class number | `Mathlib/NumberTheory/NumberField/ClassNumber.lean:64`: `Fintype.card (ClassGroup (𝓞 K))`; not an order Picard number. |
| Analytic orders | `Mathlib/Analysis/Analytic/Order.lean:48` and line 62: the zero germ has order ⊤ and natural order 0; a nonanalytic germ also has junk natural order 0. Entire-function and finite-order conditions remain explicit. |
| Elliptic Euler series | `Mathlib/AlgebraicGeometry/EllipticCurve/LFunction.lean:79` and line 84: the all-prime formal Euler product and its totalized L-series, without analytic continuation. Only Re s>3/2 is used for agreement. |
| Rational points modulo torsion | `TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/PointModTorsion.lean:56`: `W.Point ⧸ Submodule.torsion ℤ W.Point`; the definition does not supply finite generation, freeness or a rank. |
| Reduced forms | `TauCeti/NumberTheory/BinaryQuadraticForm/Reduced.lean:60`: the reduction inequalities and boundary sign, without positive definiteness. The reduced form (0,0,1) witnesses why the new theorem needs negative discriminant. |
| Form evaluation | `TauCeti/NumberTheory/BinaryQuadraticForm/Basic.lean:116`: the actual polynomial a·x²+b·x·y+c·y², used by the counting definition. |
| Full x-coordinate height | `TauCeti/AlgebraicGeometry/EllipticCurve/CanonicalHeight/Basic.lean:119`: the doubling limit of naive x-height, with its convergence theorem at line 161; not half that height. |
| Fundamental discriminants | `TauCeti/NumberTheory/Multiquadratic/FundamentalDiscriminant/Basic.lean:68` includes 1, explicitly at line 81. Field negativity remains separate. |

Fields exclude zero rings, nilpotent thickenings and positive-characteristic coefficients. The native class groups and rational point groups are commutative: S₃ and Q₈ cannot instantiate these carriers. The new count admits arbitrary forms as a total definition, so its d=0 infinite-sublevel junk value is explicitly tested and excluded from the analytic assertion.

## Sources and ownership

All cited works were available in the supplied legal cache; O88 retains its settled waived status and locator. No new source key or missing-reference request was introduced.

| Mathematical input | Source verification |
|---|---|
| Weight and genus convention; technical hypotheses and uniform constant | O85 line 88, line 94, line 205, line 337 and line 355; Theorems 1–2, pp. 310, 318–319. |
| Nonaxial count, half-ellipse normalization and integrated estimate | O85 line 126–140; §1.3, p. 312. |
| Constants 7000 and 55, with coprimality for 55 | O85 line 444–448; §5.1, p. 321; GZ86 line 352–358, I §8, p. 232. |
| Analytic and arithmetic rank of E₁₃₉ | GZ86 line 329–331; I Proposition (7.4), p. 231; GZ83 line 95–111 for the geometric argument. |
| E₅₀₇₇ model, arithmetic rank, height normalization and third derivative | BGZ85 line 51–60, line 139–159 and line 295–317; GZ86 line 352–354. The change y↦−y matches the GZ86 model. |
| Explicit positive exponent loss and effective finiteness | GZ86 line 340–349, I Theorem (8.1) and (8.2), p. 232; O85 line 368–375. The displayed κ and cutoffs are derived in README §§4.6–4.8, not attributed as source formulas. |
| Exclusion theorem and earlier small-range input | MW74 line 70–77, Theorem, p. 530; LLS70 line 1035–1043 and Table III, p. 440, for the inert patterns. |
| Remaining analytic and local conventions | G77 line 30–39; DLMF §5.11(i) (5.11.9), §5.11(ii); DEL73 line 1972–1980, §8.12, p. 572; COG04 Lecture 9 §§3–6, pp. 71–74. |

Every cross-roadmap supplier was resolved against the actual content main, or the indexed head for a new folder absent from main. Existing main files take precedence over the index's shorter cached presentations. Main `ImaginaryQuadraticClassNumber` and `Completed/EffectiveBounds` were also read for roadmap shape.

| Supplier | Verified contract |
|---|---|
| IntegralLattices on main | Layer B, B1, B2, B5; actual main README lines 1003, 1032 and 1167. Its negative-discriminant minus-b form/ideal convention is compared with the plus-b partial-zeta ideal here. |
| ImaginaryQuadraticClassNumber on main | H1.1–H1.3, H2.1–H2.4, H3.1; its four cited Lean declarations occur in its Suggested.lean lines 44, 51, 56 and 63. The extension imports this arithmetic, count, CM and ineffective finiteness rather than rebuilding them. |
| EllipticCurves on main | Layers 1,4,5,6: Vélu quotient, local minimality/reduction, twists and Mordell–Weil/descent/height input. |
| ModularForms and ModularCurves on main | Petersson theory in Layer 3; η, Δ and Ligozat in the worked examples; arithmetic X₀(N) and cusps in ModularCurves Layer 10. |
| Completed ContourIntegration on main | Layer 2 and the pinned native residue theorem; only the specialized contour identities remain here. |
| AnalyticNumberTheoryPartI | §§0.9,0.23a,0.33. Both `gammaRemainder.slit_logGamma` and `gammaRemainder.stieltjes_integral` are named intermediate supplier targets in §0.23a, not allegedly installed library declarations. |
| AutomorphicLFunctionsAndLocalFactors | AL.3 pole, functional equation, nonvanishing and all-factor datum sections; AL.5 central parity and unramified-source twist conductor comparison. Its twist contract is not applied to already ramified representations. |
| EllipticCurveModularity | R29.3–R29.6; `IsNewformOf.localPolynomial_eq`, `localPolynomial_completion_eq_padic` and `IsNewformOf.coeff_eq` are explicitly specified in R29.4. Continuation agrees with the all-prime series in R29.6. |
| EffectiveDiophantineMethods | §§0.11,3.2–3.7,3.12–3.15,3.17–3.22; the full x-height normalization and its relative/absolute distinction were read explicitly. |

The three citation leads supplied with the job are therefore valid supplier citations rather than missing pinned declarations. Searches by object covered the pinned libraries, main roadmaps, board packages, the indexed open-roadmap heads and all twelve supplied sibling folders: ComputationalNumberTheory, ConformalMappingPartII, AbelianSchemesAndArithmeticModuliPartII, GanGrossPrasadUnitaryGroups, SelmerIwasawaCohomologyPartII, QSeriesPartitionsAndMockModularForms, K3SurfacesAndSymplecticBoundedness, CohomologyComparisonsPartII, ColemanIntegrationPartII, QWittVectors, ErdosProgressionPowers and ArithmeticDynamics. The new counting definition and integrated estimate express this roadmap's Oesterlé nonaxial-count target; no other searched owner constructs that count or its shifted integrated majorant. Generic lattice counts, CM arithmetic, form reduction and modularity retain their cited owners. No supplier was added, no ownership was moved upward, and none of the seventeen fully qualified names duplicates a declaration in another readable roadmap.

Dependency check output:

```text
depcheck: 13 roadmaps, 100 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line.

## Adversarial mathematics pass

Each row records a statement or defining convention, an actual instance and its values. Decimal integral and L-value calculations are numerical cross-checks, not proofs of exact vanishing, ranks, minima or exhaustion; those retain the cited proof obligations. The complete finite reduced-form count through 907 and the integer/rational calculations are exact. General library carriers, supplier ownership and hypotheses were checked separately below.

| Statement | Instances tried | Values on the two sides | Result | Change |
|---|---|---|---|---|
| Quadratic field/discriminant convention | ℚ, ℚ(i), ℚ(√−3), ℚ(√5) | (degree,D)=(1,1),(2,−4),(2,−3),(2,5) | Degree and sign separate the intended fields | Prose retained |
| Fundamental-discriminant convention | D=1,−3,−4,−243,−5077 | Predicate values true,true,true,false,false; signs +,−,−,−,− | D<0 remains separate | Prose retained |
| Character convention, including 2 | D=−23,−907,−4 | χ(2)=1,−1,0; D mod 8=1,5,4 | Splitting, inertia and ramification distinguished | Prose retained |
| Liouville normalization | n=1,2,4,6 | λ=1,−1,1,1 | Multiplicity matters for λ | Prose retained |
| Reduced-form boundary | (2,2,3),(2,−2,3),(13,±9,19) | Reduced=true,false,true,true | Boundary sign removes exactly one duplicate | Prose retained |
| Relative full height | Rational P over ℚ and quadratic K | ĥ_K(P)/ĥ_ℚ(P)=2, while (O)-height/full height=1/2 | Both factors distinguished | Prose retained |
| Completion normalization | d=2,M=3,Ψ=2,G=5,s=1,2 | F=30,180; d^s error gives 60,360 | d^(s−1) retained | Definition kept |
| Motivic centre/root sign | z=s−1, z³,z⁴ | (−z)³=−z³; (−z)⁴=z⁴ | Centre 1 and parity distinguished | Prose retained |
| Coefficient domination convention | Ψ coefficients at n=2,4,9 for E₅₀₇₇ | 0≤0, 0≤4, 3≤6 | Coefficient bounds, rather than value bounds | Prose retained |
| Effective-constant convention | q=1/2,1/4 | κ=2^(−302),2^(−814) | Constants explicitly rational and uniform | Definition kept |
| Discriminant-sign adapter §0.1 | ℚ(i),ℚ(√5) | Totally complex=true,false; D<0=true,false | Both directions agree | Lean API removed; prose retained |
| Real-radicand extension §0.1 | ℚ(√5),ℚ | radicand 5 gives X²−5, degree 2; ℚ has degree 1 | Degree-one negative control | Prose retained |
| Field discriminant comparison §0.1 | D=−3,−20,5 | All fundamental; none equals 1 | Real and imaginary branches preserved | Lean API removed |
| Genus divisibility §0.1 | D=−4,−20,−84 | (t,h)=(1,1),(2,2),(3,4); powers 1,2,4 divide 1,2,4 | Using 2^t instead fails already at −20 | Lean API removed |
| One-prime classification §0.1 | D=−4,−8,−23,−243 | First three have one prime and qualify; −243 is nonfundamental | Fundamental hypothesis essential | Lean API removed |
| Last-coefficient bound §0.2 | (1,0,1),(2,0,2),(13,9,19) | (d,4c²)=(4,4),(16,16),(907,1444) | Strictness needs primitivity and d≠4 | Lean API removed |
| Unweighted form counts §0.2 | d=3,4,8,12,16,20,23,139,907 | Counts 1,1,1,2,2,2,3,3,3 | Imprimitive 12,16 differ from primitive counts | Value targets moved to Checks |
| `ramifiedWeight` | d=0,1,907,15,84 | θ=1,1,1,1/4,1/12 | Largest prime, distinct factors, empty products fixed | Kept |
| Weight positivity and upper bound | d=15,84 | 0<1/4≤1 and 0<1/12≤1 | Positive, bounded by one | API prose |
| Prime-power weight | d=4,8,907 | θ=1,1,1 | Multiplicities ignored | API prose |
| Weight prime-factor invariance | d=42,84 | Both prime-factor sets={2,3,7}; both θ=1/12 | Agreement | API prose |
| Odd-class-number weight | D=−23,−907 | h=3,3; t=1,1; θ=1,1 | Genus consequence agrees | API prose |
| Split-prime bound §0.4 | (d,h,p)=(3,1,7),(4,1,5),(7,1,2),(23,3,2) | d versus 4p^h: 3≤28,4≤20,7≤8,23≤32 | Extra units included; factor 4 essential at 7 | Lean API removed |
| Exceptional split fields §0.4 | ℚ(√−3),ℚ(i) | Norms N(2+√−3)=7, N(2+i)=5; h=1,1 | Explicit split prime witnesses | Check retained |
| Character–Liouville agreement §0.5 | D=−907,n=4,5,6; D=−23,n=23 | First pair values (1,1),(−1,−1),(1,1); ramified pair (0,−1) | Coprimality and n>0 retained | Generic arithmetic surrogate removed |
| Partial zeta normalization §0.6 | q=(2,1,3), vector (1,0) | q=2, N(2)/N(I)=4/2=2; no denominator gives 4 | Norm denominator fixed | Prose retained |
| Exceptional unit normalization §0.6 | D=−3,−4,−23 | w=6,4,2; half-Epstein factor 1/2 differs from 1/6,1/4 | d>4 retained in simplified decomposition | Prose retained |
| Reduced-form zeta decomposition §0.6 | D=−23, small coefficients | ν₁=1,ν₂=2; at ramified 23 local factor=1+23^(−s) | Sign symmetry and ramified term retained | Prose retained |
| Coefficient nonnegativity §0.6 | n=1,2,3 for D=−23 | ν=1,2,0 | Nonnegative integers | API prose |
| Coefficient at one §0.6 | D=−23 | Principal form contributes 1, other forms 0; ν₁=1 | Normalization fixed | API prose |
| Small-coefficient sum §0.6 | D=−23 | floor(√23/2)=2; ν₁+ν₂=3=h | Equality case | API prose |
| `nonaxialCount` | q=(1,0,1), t=0,1,2 | N=0,1,3; with both signs of n, counts at 1,2 become 2,6 | Correct half-lattice | Added simple definition |
| Count monotonicity §0.7 | q=(1,0,1),t=0,1,2 | 0≤1≤3 | Finite positive-definite sublevels used | API prose |
| Count vanishing §0.7 | q=(1,1,6),t=2,5,6 | N=0,0,2; c=6 | Threshold witnessed | API prose |
| Count local integrability §0.7 | q=(1,0,1),[0,2] | Jumps at 1,2; integral=1 | Finite step function | API prose |
| `integral_nonaxialCount_le` | q=(1,0,1),A=0,2; q=(2,0,2),A=6 | LHS/RHS=0/0,1/(3π/4),8/(4π) | Boundary and imprimitive cases included | Headline added; Check states 3π/4 |
| Integral estimate, d=23 §0.7 | q=(1,1,6),(2,1,3), A=12 | LHS=20,26; RHS=45.2815306634 in both cases | Positive margins 25.2815 and 19.2815 | Headline checked |
| Integral estimate sweep §0.7 | 1≤a≤8,−a≤b≤a,a≤c≤16, all reduced; 0≤A≤100 | 40038 endpoint/stationary evaluations; minimum RHS−LHS=0 | No negative margin | Headline checked |
| Count junk values §0.7 | q=(0,0,1),t=1 | Infinitely many points; Nat.card=0; d=0 | Excluded by explicit d>0 in theorem | Negative-control Check added |
| Comparison measure §0.7 | d=23,s=2 | Mellin value 4π/23≈0.54636; without atom 2π/23≈0.27318 | Atom contributes half the transform | Prose retained |
| Fixed-n lattice error §0.7 | q=(1,0,1),n=1,A=17/16 | Discrete sum 1/16; real integral 1/48 | Termwise sum≤integral is false | Check retained |
| `goldfeldCompletion` | d=2,M=3,Ψ=G=1,s=1,2,0 | Values 3,18,0; continued value at 0 is not prescribed | Real body, half-plane agreement | Kept |
| Completion congruence §1.1 | Ψ=2,G=5 and same factors | Both central values 30 | Equality transports pointwise | API prose |
| Completed-product identity §1.1 | d=2,N=Nχ=4π²,M=1/2,s=2,L=Lχ=1 | Product expression 1/2; ΛΛχ/d=1/2 | Factor 1/d necessary | API prose |
| Completion analytic order §1.1 | d=2,M=3,ΨG=(s−1)³ | Remaining factor at centre=3≠0; orders 3=3 | Positive d,M keep factor nonzero | API prose |
| C1 square support §1.2 | n=1,2,4,9 | Majorant coefficients 1,0,4,6 | n=0 ignored by LSeries | Hypotheses kept in technical theorem |
| C2 local denominators §1.2 | p=2, s=1, roots of maximal modulus | Factor modulus≥1−1/√2≈0.292893>0 | No division by zero at centre | Hypotheses kept |
| C3 even vanishing §1.2 | F=z⁴exp(z²), z=0,1,−1 | F=0,e,e; order 4 | Reflection plus order≥3 forces even order | Prose retained |
| C4 simple zero §1.2 | Ψ=z, Ψ=0 at centre | Derivatives 1,0 | Identically zero Ψ fails C4 | Hypotheses kept |
| Inverse Mellin kernel definition §1.3 | (a,m,x)=(0,2,1/2),(1,2,1/2),(0,3,1/2) | log2,2log2,(log2)²/2 | Power and factorial distinguished | Definition moved to prose |
| Kernel support §1.3 | x=0,1,2, m=3 | Values 0,0,0 | Endpoints and exterior vanish | API prose |
| Kernel positivity §1.3 | a=0,m=3,x=1/2 | Value (log2)²/2≈0.240227>0 | Nonzero interior | API prose |
| Kernel antitonicity §1.3 | a=−1,m=2,x=1/16,1/4 | Values log2/4<log2/2 | a≥0 cannot be dropped | API prose |
| Kernel convexity §1.3 | a=0,m=2,x=1/4,1/2,3/4 | I(1/2)=0.693147≤(1.386294+0.287682)/2=0.836988 | Midpoint inequality witnessed | API prose |
| Kernel Mellin formula §1.3 | a=0,m=2,3,s=1,2 | Transform values 1,1/4 for m=2; 1,1/8 for m=3 | Matches (s−a)^(−m) | API prose |
| Positive Mellin comparison §1.4 | μ=δ₁,ν=(δ_(1/2)+δ_(3/2))/2, x=1,a=0,m=2 | Kernel integrals 0,log2/2; at T=5/4 cumulative integrals 1/4,3/8 | Integrated domination suffices | Lean helper removed |
| Signed-measure negative control §1.4 | μ=−δ_(1/2),ν=0 | Kernel integrals −log2,0 | Positivity required | Check retained |
| Fundamental contour §1.5 | Even F=z⁴exp(z²), odd F=z³exp(z²) | Normalized integrals 0,1/(2√π)≈0.282095 | Plus sign required | Generic function theorem removed |
| Contour order condition §1.5 | F=exp(z²) | Order 0; residue 1; normalized right integral 1/2 | Missing vanishing changes result | Check retained |
| Truncated residue §1.6 | H=G=1,d=2 | Residue log2=H(1)G(1)log2+0+0 | Centre normalization agrees | Lean helper removed |
| Removable quotient §1.6 | γΨ=s−1 | Extension at 1=1; totalized quotient at 1=0 | Extension must be separate | Check retained |
| Strict prime cutoff §1.6 | U=2 versus U>2 | G_U=1 versus inclusion of G₂ | Empty product at U=2 | Check retained |
| Three-piece tail §1.7 | M=N/(4π²), d=23 | (2π⁴/3)M^(3/2)=πN^(3/2)/12; Σ1/a=1+1/2+1/2=2 | Power of M and form sum fixed | Prose retained |
| `oesterleTechnical` | E₅₀₇₇ analytic system,K=ℚ(√−23) | χ(5077)=−1,χ(−5077)=1; P(d)=∅; LHS log23≈3.13549≤55·3=165 | Uniform C precedes K,G in signature | Kept |
| Technical theorem h=4 branch §1.8 | h=4,t=3 | m=1 gives t≤2m false (3≤2); m=3/2 gives 3≤3 | Exceptional choice retained | Check retained |
| `curve139` | Point (−156,77), origin; invariants | Equation 6006=6006; origin 0≠−6220110; Δ=266864328286957 | Correct signs and nonsingularity | Kept |
| E₁₃₉ invariants §2.1 | Twist by −139 | c₄=3091360=139²·160; c₆=5392722952=(−139)³(−2008) | Odd twist sign fixed | API prose |
| E₃₇ model §2.1 | (1,0),(1,−1),(0,0) | Equation values 0=0,0=0,0≠1; Δ=37,c₄=160,c₆=−2008 | Kernel points and nonexample fixed | Definition in prose |
| Source coordinate change §2.1 | (X,Y)=(−156,77) | (x,y)=(162/139,620/19321); −139y² equals x³+10x²−20x+8 | Forward/inverse nonzero denominators | API prose |
| O88 isogeny versus isomorphism §2.1 | E₃₇,E₀ | j=4096000/37 versus 1404928000/50653; kernel size 3 | Isogeny, not isomorphism | API prose |
| `curve5077` | (0,2),(1,0),(2,0),(0,−2) | LHS/RHS=6/6,0/0,0/0,2/6; Δ=5077,c₄=336 | Plus-y model fixed | Kept |
| Minus-y isomorphism §2.2 | (0,2)↦(0,−2) | 2²+2=6 and (−2)²−(−2)=6 | Same point under map | API prose |
| Analytic-rank parity §2.3 | Local orders 3,4 | (−1)^3=−1; (−1)^4=1 | Motivic reflection parity | Helper removed |
| Coprime twist coefficients §2.3 | E₃₇ twisted by −139 at p=3,5,7,11,13 | a_p=−1,0,−1,3,−4, agreeing with χa_p(E₃₇) | Twist linked to native coefficients | Helper removed |
| Twist conductor/root number §2.3 | E₃₇,D=−139 | 37·139²=714877; χ(−37)w=−1 | Conductor and sign separated from Δ | Prose retained |
| Trace/norm twist convention §2.3 | D=−7,−139 | (trace,norm)=(1,2),(1,35); trace²−4norm=−7,−139 | Norm argument is not D | Prose retained |
| Local Frobenius convention §2.3 | Good trace-zero p=5; split p=37 | 1+5T² versus inverse-only 1+T²/5; split 1−T versus 1−37T | Dual and Frobenius direction fixed | Check retained |
| Native local data §2.3 | E₅₀₇₇ at 5077,E₁₃₉ at139 | a_p=−1,0; Euler polynomials 1+T,1 | Nonsplit/additive distinguished | Helper removed |
| Minimal models §2.3 | E₃₇,E₁₃₉,E₅₀₇₇ | Nonzero Δ valuations 1,6,1; each <12 | Minimality route preserved | Helper removed |
| Nonminimal equation §2.7 | E₃₇ and 7-scaled model | Raw projective counts 9,8; intrinsic a₇=−1 and polynomial 1+T+7T² for both | Raw singular count cannot replace minimal one | Helper removed |
| Arithmetic ranks §2.4 | E₁₃₉,E₅₀₇₇ | Good reduction orders (5,9),(7,10); gcd=1,1; ranks 3,3 from cited descent | No torsion obstruction; descent retained | API prose |
| Height independence §2.4 | BGZ approximate 3×3 Gram matrix | Determinant 0.417151829697>0; cited regulator≈0.41714356 | Rounding scale agrees; determinant alone gives only lower rank bound | Prose retained |
| Dependent-point control §2.4 | Q₂ and −2Q₂ | Duplicate span has Gram determinant 0 | Excludes mistaken independence | Check retained |
| BGZ kernels definition §2.5 | G₀(1),G₃(0),G₁(−1) | e^(−1),0,0 | Branches preserved | Definition in prose |
| Kernel positive bounds §2.5 | (r,x)=(1,1),(3,2) | 0.2193839344<0.3678794412;0.00354412763<0.0169169104 | Both positive and below bounds | API prose |
| Kernel derivative §2.5 | (r,x)=(1,1),(2,1),(3,2) | Numerical derivative −0.3678794442,−0.2193839376,−0.00713241796; RHS −0.3678794412,−0.2193839344,−0.00713241789 | Finite-difference agreement | API prose |
| Kernel Mellin inversion §2.5 | r=0,1 at positive x | Γ transform gives e^(−x); Γ(s)/s gives G₁(1)=0.2193839344 at x=1 | Exponential and integral cases distinguished | API prose |
| Kernel residue series §2.5 | r=0 and r=1,x=5 | P₀=1 gives e^(−5); r=1,K=1 gives −γ−log5+5≈2.81334642 | Zeroth case retained, r=1 approximant distinct | API prose |
| Kernel series remainder §2.5 | r=1,x=5,K=1 | Error 2.81219812707<25/4=6.25 | Increasing initial terms do not refute remainder bound | API prose |
| Kernel integral tail §2.5 | r=1,x=1,Y=1 | Actual tail G₁(1)=0.2193839344≤e^(−1)=0.3678794412 | Endpoint Y=e^0 covered | API prose |
| Central derivative series §2.6 | E₅₀₇₇,r=1,n=2 | Summand 2(−2/2)G₁(2α)≈−2.6538; omission of 1/n doubles it | Coefficient denominator fixed | Generic-sequence Lean statement removed |
| Derivative-series tail §2.6 | E₅₀₇₇,r=1,B=400 | Geometric bound 5.89142902809·10^(−16)<10^(−15) | Stated B sufficient | Prose retained |
| First-derivative enclosure §2.7 | E₅₀₇₇,r=1 | Numerical series −8.27·10^(−17), threshold 10^(−12) | Consistent; does not prove zero | Prose retained |
| Conductor-37 central interval §2.7 | E₃₇ | 0.72<0.725681061936<0.73 | Nonzero central value | Prose retained |
| −7-twist central interval §2.7 | E₅₀₇₇,D=−7 | N_D=5077·49=248773; cited value≈4.4768 lies in (4,5) | Coprime plus-sign branch | Prose retained |
| Classical Heegner construction §2.8 | (N,D)=(37,−139),(5077,−7) | Norm (9+139)/4=37; h=3,1 | Cyclic split cases exist | Full carrier in README |
| Heegner Galois inverse §2.8 | Class b of order3, principal class | Orbit 1→b²→b→1; principal orbit length1 | Inverse convention fixed | API prose |
| Heegner trace field/conjugation §2.8 | h=1,w_E=−1,torsion correction0 | σP=P; trace over degree1 sum=P | Rational descent sign agrees | API prose |
| Cyclicity negative control §2.8 | N=27,D=−3;N=3,D=−3 | Quotient ℤ/9×ℤ/3 versus ℤ/3 | Ramified exponent3 excluded, exponent1 allowed | Check retained |
| Gross–Zagier trace normalization §2.8 | h=3 and trace averaged by 3 | Height ratio 1/9; unaveraged height factor 1 | Sum/average distinguished | Full formula remains prose |
| Elliptic Gross–Zagier scaling §2.8 | φ replaced by [2]φ | P↦2P, height×4,deg×4,C²×4; c·height unchanged | Constant covariance correct | Full formula remains prose |
| Base-change derivative product rule §2.8 | Values (L,L′,L_D,L_D′)=(0,2,3,5),(2,3,0,5) | Derivative 6 and10; dropping wrong summand gives0 in second case | Both branches retained | Prose retained |
| Height-gap principle §2.8 | c=2,b=3,δ=1,η=0,1 | η=0 permits a=0 and norm0<2;η=1 gives norm2<2 false | Exact threshold excludes nonzero height | Bare-scalar Lean theorem removed |
| E₅₀₇₇ rational height gap §2.8 | P₁=(1,0),O | Heights≈0.66820517 and0; threshold1/2 | O must be excluded | Prose retained |
| Rational Heegner descent §2.8 | Good inert primes3,5 over quadratic K | Orders E(𝔽₉)=7,E(𝔽₂₅)=20;gcd=1 | K-torsion correction is0 | Prose retained |
| Quantitative Gross–Zagier constant §2.8 | Stated enclosures | norm product<5·10^(−12); cδ>5·10^(−12), δ=1 | Strict interval separates height0 from ≥1 | Prose retained |
| Exact first derivative E₅₀₇₇ §2.8 | Height-gap conclusion and numerical series | Exact target0; series≈−8.27·10^(−17) | Approximation consistent, not used as exact proof | Prose retained |
| η-quotient definition/invariance §2.9 | Exponents (2,−2) and (1,−1),N=37 | Congruence sums −72,72≡0 mod24 versus −36≡12 | Square necessary | Prose retained |
| η-quotient q-expansion §2.9 | First two coefficients | q^(−3)(1−2q+…); coefficients1,−2 | Pole order3, leading sign fixed | API prose |
| η-quotient divisor §2.9 | Cusps0,∞ | Orders+3,−3;sum0 | Degree3 map | API prose |
| CM twelfth-power identity §2.10 | λ=(3+√−139)/2 | Norm37; u(x_a)^12=λ^12 | Conjugate-ideal convention gives norm37 | Prose retained |
| Equality of three CM values §2.10 | [H:K]=3, roots i,ζ₃ | Extension degrees2 do not divide3; remaining roots±1 | Root-of-unity ambiguity reduced to sign | Prose retained |
| Conductor-37 geometric trace vanishing §2.11 | Three Heegner points,pole degree3 | div(u−c)=x₁+x₂+x₃−3∞; class0 | Trace in Jacobian is zero | Missing native carrier documented |
| Exact first derivative E₁₃₉ §2.11 | L(E₃₇,1)≈0.725681 and zero trace | Product L(E₃₇,1)L′(E₁₃₉,1)=0; numerical derivative≈1.21·10^(−16) | Nonzero factor yields exact target0 | Prose retained |
| `rankThree_139` | Native E₁₃₉ and its continuation | Third derivative/6≈18.4294373629∈(18.42,18.44); arithmetic rank3=analytic rank3 in GZ86 line329 | Nonzero third derivative agrees with finite order3 | Kept |
| `rankThree_5077` | Native E₅₀₇₇ and its continuation | Third derivative/6≈1.73184990012∈(1.73,1.74); ranks3=3, GZ86 line352 and BGZ85 line149 | Both ranks retained; interval separate | Kept, numerical conjuncts moved to prose |
| Identically-zero rank control | L=0 | analyticOrderAt=⊤; analyticOrderNatAt=0; a₁(E)=1≠0 | Explicit finiteness and series equality exclude zero function | Both hypotheses kept |
| Liouville local product §3.1 | Good a₅=0,p=5; additive a_p=0 | Factors (1+5X²)^(−2) versus1 | Trace zero does not imply missing degree-two factor | API prose |
| Symmetric-square local factors §3.1 | Good roots α,β; multiplicative root1 | Roots α²,p,β² versus1 | Full local determinant retained | Missing carrier documented |
| Rankin–Selberg shift §3.1 | w=2s,s=1 | u=w−1=1; ζ(u) pole cancels self-pair pole | Motivic/unitary shift agrees | Full comparison remains prose |
| Self-pair growth adapter §3.1 | Pole model A(u)=1/[u(u−1)] | u(u−1)A=1 off poles, removable values1 | Both poles must be removed | Prose retained |
| Liouville simple zero §3.1 | s=1+z, ζ(1+2z) | Reciprocal leading term2z; Ψ′(1)=2L(Sym²f,2)/ΠR_p(1) | Factor2 retained | Prose retained |
| Coprime modular system §3.2 | D=−23,−7,N=5077 | χ(−N)=+1,−1 | Sign hypothesis separates cases | Prose retained |
| Ramified local comparison §3.3 | Ramified quadratic twist of good V, then twist again | Local degrees2→0→2; additive/additive gives0→0 | Multiplying zero-extended coefficient cannot recover degree2 | Prose retained |
| Restored square-supported factor §3.3 | E₁₃₉ at139 | α+β=−4ε,αβ=139; α²+β²=−262; denominator1+262X²+19321X⁴ | Odd powers cancel | Prose retained |
| Restored factor at centre §3.3 | X=1/139 | B(1)=19321/19584;B′/B=11log139/408≈0.1330372874 | Both Taylor corrections retained | Prose retained |
| Four conductor scales §3.3 | Neither,only37,only139,both divide d | 37·139²,√37·139²,37,√37, each divided by4π² | No shared-prime branch omitted | Prose retained |
| Petersson normalization §3.4 | M=N/(4π²),Ψ′=2L₂/ΠR | MΨ′=(N/(2π²))(8π³/N)(f,f)Πp/(p−1)=4π(f,f)Πp/(p−1) | Constants agree | Prose retained |
| Explicit constants §3.4 | N=5077,local restored139 factor | M≈128.6;B(1)=19321/19584≈0.986571;tail multiplier denominator1−1/√139>0 | Corrected cases remain proof obligations | Prose retained |
| Discriminant exclusion §3.5 | D=−5077,+5077 | Residues3,1 modulo4; fundamental=false,true | Negativity essential | Elementary Lean theorem removed |
| `global_7000` | (d,h)=(3,1),(4,1),(20,2),(907,3) | Weighted logs1.098612,1.386294,0.998577,6.810142 versus7000,7000,14000,21000 | All fields, including ramified weights | Kept |
| `coprime_55` | Same four fields;d divisible5077 | Weighted logs as above versus55,55,110,165; for d=4·5077 gcd=5077 | Coprimality separates excluded branch | Kept |
| Prime majorant definition §4.1 | c=55,t=0,1,2,3 | 55,55,961.690475583,7178.15543206 | Range t−1 is correct | Definition in prose |
| Majorant positivity/monotonicity §4.1 | c=55,t=1,2; c=0 | 55<961.690475583; zero sequence0 | Sign hypotheses explicit | API prose |
| Majorant recursion §4.1 | t=1,2 | C(2)/C(1)=17.4852814;C(3)/C(2)=7.46410162 | Prime2 then prime3 | API prose |
| Weight domination §4.2 | d=84,c=1 | θC=10.8759930789≥1 | Smooth majorant rather than floor monotonicity | API prose |
| Elementary majorant growth §4.2 | c=1,t=2,p=2 | log17.48528≈2.861<16√2≈22.627;prime bound2.861<8/√2≈5.657 | Bound holds at smallest prime | API prose |
| t-dependent class-number bounds §4.3 | D=−23,h=3,t=1 | log23≈3.13549≤55·3=165 and≤7000·3 | Prime endpoint agrees with weighted results | Helper removed |
| Rational-prime count adapter §4.4 | x=1,2,5/2 | Both counts0,1,1 | Inclusive cutoff | API prose |
| n-th-prime asymptotic §4.4 | n=0,1,4 | p=2,3,11;π(p)=1,2,5=n+1 | Finite indexing distinct from asymptotic | API prose |
| Reciprocal-square-root prime sum §4.4 | n=5 | Sum≈2.41;2√(5/log5)≈3.525 | Slow finite approach, no finite equality asserted | API prose |
| Majorant logarithm asymptotic §4.5 | Different c at same t | logC_7000−logC_55=log(7000/55)≈4.846 | Fixed additive difference negligible in limit | API prose |
| `effectiveKappa` | q=−1,0,1/4,1/2,99/100,1,2 | 0,0,2^(−814),2^(−302),2^(−49),1/2,1/2 | All branches and ceiling tested | Kept |
| κ positivity §4.6 | q=1/4,1 | 2^(−814)>0,1/2>0 | Positive-loss domain | API prose |
| κ monotonicity §4.6 | q=1/4,1/2,99/100,1 | 2^(−814)<2^(−302)<2^(−49)<1/2 | Jump at1 has right direction | API prose |
| κ exponent derivation §4.6 | q=1/2,1/4 | δ=1,1/3;46+ceil(256/δ)=302,814 | Rational formula agrees with derivation | API prose |
| `effectiveLogarithmic_bound` | d=907,h=3,q=ε=1/2; q=ε=1 | LHS≈3.2027232138·10^(−91)<3;LHS=1/2<3 | Strict bound and large-loss branch | Kept |
| Real loss ε≥q §4.7 | d=907,q=1/2,ε=1 | LHS=2^(−302), smaller than2^(−302)√log907 | logd>1 has correct direction | Hypotheses kept |
| `effective_cutoff` | H=1,3,0 | Exponents2^605,9·2^605; h=0 contradicts positive native class number | Real and integer cutoffs; zero-class case excluded by h=H | Kept |
| Effective/Siegel comparison §4.9 | d=907,h=3 | L(1,χ)=3π/√907≈0.312944616;κ(1/2)√log907≈3.20·10^(−91) | Normalizations agree, no effective Siegel constant inferred | Prose retained |
| Prime-discriminant reduction §5.1 | D=−4,−8,−23,−31 | h=1,1,3,3; primes23,31≡7 mod8 and≤32 | Dyadic exceptions handled before reduction | Helper removed |
| Hardy function definition §5.2 | t=0,χ=χ_(−3) | Phase0;Z(0)=L(1/2,χ)≈0.4808 real | Odd gamma shift starts at3/4 | Definition in prose |
| Hardy zero equivalence §5.2 | t=0 and a zero heightγ | Phase multiplier modulus1;nonzero central value stays nonzero;0 stays0 | Both directions hold | API prose |
| Hardy Stirling phase §5.2 | t=0,χ odd | Γ((3/2)/2)=Γ(3/4)>0,phase0;Γ(1/4) is different | Odd gamma argument fixed | API prose |
| Hardy expansion truncation §5.2 | Enclosures [−2,−1],[−1,1] | First forces negative sign,second permits0 | Straddling zero is insufficient | API prose |
| Three zero brackets §5.3 | k=17923,115147,123204 | Midpoints0.030986,0.003158,0.010650; widths2·10^(−6);dyadic χ=−1,−1,0 | Character parity and brackets preserved | Numerical-input Lean theorem removed |
| `montgomeryWeinberger` | d=1000000002660=4·3·5·16666666711 | Fundamental D=−d,t=4;h≡0 mod8 whereas3≡3 mod8 | Valid field inside range cannot have h=3 | Kept |
| MW range endpoints §5.4 | d=10^12 and10^2500 | Both have repeated square factors and fail fundamental-discriminant test | No spurious endpoint field | Hypotheses unchanged |
| Inert-pattern definition §5.5 | x=0,p=3; x=3,p=3; composite77683 | Predicate true,false,false; Legendre at3 in second case=0 | Primality and small-x convention retained | Definition in prose |
| Inert-pattern antitonicity §5.5 | p=1333963,x=43,47 | Both membership values true | Larger x imposes more conditions | API prose |
| Least inert primes §5.5 | p=1333963,51599563,1432817816347 | All prime and3 mod8; Legendre at3,5 gives−1,−1 for each | Membership cross-check; minimality remains cited proof target | Value theorems moved to prose |
| Small-range exclusion §5.6 | Threshold chain | 4·43³=318028;4·67³=1203052<1333963;4·163³=17322988<51599563;1432817816347>10^12 | Exact transitions, no gap | Prose retained |
| Class-three cutoff §5.7 | h=3,prime discriminant | logp≤165;165/log10≈71.6585895<72;907<10^12<10^2500 | Two exclusion ranges cover p>907 | Corollary in prose |
| `classThreeDiscriminants` | Complete fundamental enumeration3≤d≤907 | Exactly16 absolute values:23,31,59,83,107,139,211,283,307,331,379,499,547,643,883,907 | No extra or missing finite member | Kept |
| List membership/negativity §5.8 | D=−907,−163,−243; all listed D | Membership true,false,false; maximum D=−23<0 | Endpoint, wrong class number and order discriminant separated | API prose |
| `classThree_enumeration` | D=−23,−31,−907,−163,−20 | (h=3,list membership)=(true,true),(true,true),(true,true),(false,false),(false,false) | Both directions tested; global exhaustion supplied by cutoff | Kept |

## Final validation

Commit `323dd362` changes only `TauCetiRoadmap/EffectiveClassNumbers/README.md` and `TauCetiRoadmap/EffectiveClassNumbers/Suggested.lean`; the worktree is clean and nothing was pushed.

`lake build TauCetiRoadmap.EffectiveClassNumbers.Suggested`: exit 0, with the ten expected admitted-headline warnings and no errors. Exact final outcome:

```text
Build completed successfully (8987 jobs).
```

Final gate: exit 0. Exact summary line:

```text
gate EffectiveClassNumbers: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```
