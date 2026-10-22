# PORT-EffectiveClassNumbers

- Branch: `roadmap/effective-class-numbers`.
- Head commit: `177f6852e873043370a4cd8f50410dfe8c376eb9`.
- Starting state: clean worktree at `a0af4de`.
- Committed content: `TauCetiRoadmap/EffectiveClassNumbers/{README.md,Suggested.lean,metadata.toml}` only.

## Validation

The specified targeted build exited 0. Exact outcome:

```text
Build completed successfully (9034 jobs).
```

Warning count: **60**, all ``declaration uses `sorry` ``; **0** other warnings and **0** errors. The final file contains 916 lines, 11 real-bodied definitions, 69 theorems, two proved instances and 22 proved examples. The 82 named declarations all occur in the README. The single `import Mathlib` and all seven individual Tau Ceti imports are unchanged and exist at the manifest pins.

Temporary compiler checks printed all 82 elaborated declaration types. I inspected the explicit degree, discriminant, primitivity, local-primality, positivity, entire-continuation, reflection and lower-derivative-vanishing binders. No section-variable or `include` block can discard a hypothesis. The checks were removed before the final successful build.

Gate summary:

```text
gate EffectiveClassNumbers: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 check-labels-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```

The content gate passed every content and outside-folder check before committing; its clean-worktree requirement reported only the three staged additions. The exact gate was therefore repeated on the committed, clean worktree.

The requested dependency-direction command exited 0. Complete output:

```text
depcheck: 11 roadmaps, 95 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line, and no merge-order edit was made. `git diff --cached --check` passed before committing. Metadata matches the main-branch convention: `topic = "math.NT"`.

## Draft pull request body

Build a reusable library of effective class-number bounds for imaginary quadratic fields, continuing ImaginaryQuadraticClassNumber from its arithmetic and ineffective finiteness results. The layers connect Goldfeld–Oesterlé analysis, two rank-three elliptic curves and classical Heegner heights to uniform logarithmic bounds, an explicit rational lower-bound constant, effective fixed-class-number cutoffs and the sixteen-field classification for class number three. Ramified conductor overlaps, dyadic character values, exceptional unit groups and the full height normalization remain explicit throughout.

AI assistance: Codex ported the accepted package and performed the supplier, mathematical, elaboration and gate checks described in this report.

## Suppliers and duplication

The direct suppliers still in open pull requests are **AnalyticNumberTheoryPartI**, **AutomorphicLFunctionsAndLocalFactors**, **EllipticCurveModularity** and **EffectiveDiophantineMethods**. They precede this roadmap in the supplied order. The remaining direct roadmap suppliers are on main: **IntegralLattices**, **ImaginaryQuadraticClassNumber**, **EllipticCurves**, **ModularForms**, **ModularCurves**, and the completed **ContourIntegration** roadmap.

I searched the 155 main-branch roadmap README files and the changed roadmap sources at all 138 open heads: 155 README files and 153 Lean files. Searches covered mathematical objects, including quadratic presentations and discriminants, primitive and reduced forms, partial zeta/Epstein sums, Liouville products, Mellin kernels, Rankin–Selberg and symmetric-square factors, Heegner points, heights and descents, prime asymptotics, Hardy functions and class-number bounds. Relevant contracts were then read in their owning sections. The ten supplied model heads were included.

The accepted ownership decisions remain: imaginary quadratic presentations, the form/class-group count, quadratic characters, zeta factorization and Siegel finiteness stay with ImaginaryQuadraticClassNumber H1–H2; general quadratic-order arithmetic stays with IntegralLattices B1–B5; general elliptic coefficients stay with EllipticCurveModularity R29.4; general sign parity stays with AutomorphicLFunctionsAndLocalFactors AL.5. No additional theorem target was removed by the fresh duplication sweep. No notion was moved from a later roadmap.

Supplier repairs:

- The package named an additional `reducedForms_primitive` supplier declaration that is absent from main. I replaced that name and the process-oriented gap paragraph with the actual H1.3 primitive-form restriction and count, spelling out the elementary fundamental-discriminant argument that makes the restriction the identity. Ownership remains H1.3; no second form/class-group count is planned here.
- `TauCeti.primeCount_univ_isEquivalent_div_log` counts prime ideals of a number field. The README now states `rationalPrimeCount_eq` before using the ordinary prime-counting function, with inclusive floor cutoffs and the pinned `Rat.HeightOneSpectrum.primesEquiv`, `IsIntegralClosure.intEquiv` and `TauCeti.primeCount_eq_card`. This does not re-plan the prime ideal theorem.
- The regulator contract now names `WeierstrassCurve.Affine.regulator` explicitly. The Dirichlet nonvanishing contract retains its nontrivial-character or non-pole hypothesis.
- The source-model comparison now names `curve139_source_isogeny`, its degree three, and its untwisted kernel. Its general quotient construction is consumed from EllipticCurves Layer 1, with twisting from Layer 5.

Mathlib open work was checked for quadratic algebras, integral elements, maximal quadratic orders, quadratic discriminants, complex embeddings, parameter uniqueness and prime splitting; the roadmap continues to use the pinned carriers and the base roadmap's comparisons. The Zulip search located the existing quadratic-field and Kummer–Dedekind design discussions. No pending upstream work is treated as a prerequisite to starting.

## Lean-to-README movement

The two examples about imported `TauCeti.reducedForms` and `TauCeti.IsReducedForm` were left as the full mathematical Checks in README §0.2, rather than retained as examples unrelated to a definition introduced here. The seven named small-count targets remain in Lean. This preserves the exact forms, boundary-sign exclusion, equality at discriminant −4 and the imprimitive −16 control. No definition, headline theorem or theorem signature was deleted or moved. Heavy constructions were already README targets.

The existing second `curve37` example now also proves that `(1,0)` and `(1,-1)` satisfy its equation, providing the two nonzero kernel points for the named model isogeny while retaining the two-example limit. All retained examples are proved.

## Mathematical and editorial fixes

These changes arose from reading the complete README again against the sources and the elaborated statements:

1. In §0.6 the partial-zeta ideal map now explicitly takes **nonzero** elements, and its fibres, rather than arbitrary unit orbits, have cardinality equal to the unit count. The zero element cannot generate a nonzero integral ideal.
2. In §0.7 the uncorrected fixed-row sum-to-integral proof sketch was false. For `(a,b,c)=(1,0,1)`, `n=1`, `A=17/16`, the integer sum is `1/16` and the real integral is `1/48`. I removed that inference, kept Oesterlé's integrated estimate, and added this negative-control Check.
3. In §1.1 positivity of `d` and `M` is explicit for the analytic-order API. In §§1.2 and 1.5 the Taylor-coefficient argument also covers the identically zero function, without calling its infinite order an even integer.
4. In §1.6 the indentation width satisfies `0 < η ≤ 1/4`; width zero would run through the pole.
5. In §2.1 the promised source-model isogeny is a named target. The untwisted point `(1,0)` has double `(1,-1)` and order three. The two different j-invariants distinguish the isogeny from an isomorphism.
6. In §2.4 the set of rational points of height below one includes the identity `O`. The nonzero-point height gap remains `1/2`. Conditional fallback prose about a larger Selmer group was replaced by the definite descent obligation; the rational degree-three isogeny itself is explicitly retained in §2.1.
7. In §2.6 the tail estimate explicitly quantifies `N > 0` and natural `r,B`. In §2.8 parametrisations are nonconstant, so their degrees and differential scalars are nonzero; the multiplication comparison requires `m ≠ 0`.
8. In §2.10 the lattice basis is chosen **adapted to the cyclic inclusion** before writing the level-37 lattice formula. An arbitrary basis does not have that form.
9. In §4.2 the nonmonotonicity control uses primes `(3,5)`, where the factors are `1/4,1/3`; `(2,3)` would not refute decreasing factors.
10. In §4.7 an unspecified effective constant yields a weaker true theorem; it does not make the theorem false. The explicit κ formula remains the required quantitative target.
11. In §0.4 the splitting example equates the **principal ideal** `(3)` with a product of prime ideals. An irrelevant real-quadratic dependency was dropped from this imaginary-quadratic norm argument.
12. A misplaced duplicate class-three-list Check was kept only with its definition in §5.8. Layer 0's dependency paragraph now includes the H1 and H2 sections it actually uses. The opening Summary, complete APIs, all distinct Checks, worked examples and all eleven bibliography entries remain.
13. The reduced-form count at discriminant −139 is explicit in §0.2 and in `reducedForms_small_counts`, before Layer 2 consumes it. This makes the Heegner trace’s class-number-three input independent of the final enumeration.

The accepted square-supported restoration at 139, both local signs, all four conductor scales, the separate C3 entire continuation, the full x-height convention, exact first-derivative vanishing before third-derivative bounds, and the non-strict constants 7000 and 55 are retained.

## Adversarial mathematics pass

Rows group a definition with its entire named API when the same boundary instances test all its claims. Every named Lean declaration and every README target family is covered. An entry saying retained describes the mathematical audit, not a completed proof of an admitted theorem.

| Statement or API family | Instances tried | Result | Change |
|---|---|---|---|
| Field, signature and discriminant conventions; `isTotallyComplex_iff_discr_neg`; `exists_positive_squarefree_radicand` | ℚ, ℚ(i), ℚ(√−3), ℚ(√5); zero ring and positive characteristic excluded by field/number-field hypotheses | Degree two makes negative discriminant equivalent to one complex place; the real radicand exceeds one | Universe convention explicit; imaginary presentations remain imported |
| `isFundamentalDiscriminant_discr` and predicate comparison | D=1,−1,−3,−4,−8,−20,5,−243,−5077 | Both predicates accept 1; quadratic fields exclude it; the two negative nonexamples fail the congruence/squarefree conditions | Retained one-way theorem |
| `two_pow_sub_one_dvd_classNumber`; `discr_of_card_primeFactors_eq_one` | d=3,4,8,20,84; t=1,2,3 | Exponent t−1 gives 1,2,4; the −1-radicand boundary uses 1 dividing h | Retained |
| Primitive restriction; `reducedForm_four_mul_c_sq_ge`; `reducedForms_small_counts` | d=3,4,8,12,16,20,23,139,907; boundary b=±a; imprimitive (2,0,2) | Equality at d=4 and imprimitive d=16; fundamental discriminants force content one; counts independently enumerated | Actual H1.3 contract; library-only examples remain README Checks |
| `ramifiedWeight` and all positivity, prime-power, prime-factor and odd-class APIs | d=0,1,15,20,84,907; prime powers; factors at 2,3,5,7,11,13 | Weights 1,1,1/4,1/3,1/12,1; multiplicities ignored; all denominators positive | Retained |
| `splitPrime_size`; `splitPrime_boundary_fields` | d=3,p=7; d=4,p=5; d=7,p=2; d=23,p=2; d=20,p=3; ramified and zero ideals | The factor 4 and unramified hypothesis are needed; norm-p prime ideals are nonzero | Principal-ideal notation and dependency corrected |
| `liouville_agreement` and quadratic-character specialization | n=0,1,4,5,6; a prime dividing d | n=0 excluded; multiplicativity handles 1; ramified values 0 differ from λ(p)=−1 | Retained |
| `partialZeta_eq_epstein` | Forms (1,1,6),(2,1,3); D=−3,−4 | Ideal norm 2 must divide the norm form; inverse class and unit factors 2,6,4 agree | Nonzero domain and fibre statement explicit |
| `dedekindZeta_eq_sum_reducedForms`; `nu_nonneg`, `nu_one`, `sum_nu_le_classNumber` | d=23; ramified prime 23; d=3,4 | ν₁+ν₂=1+2=3; ramified factor is 1+p^(−s); simplified formula requires d>4 | Retained |
| Nonaxial count, asymptotic, integrated estimate and comparison measure | (1,1,6); A=0,√d/2; all-vector versus upper-half count; fixed row (1,0,1) | First values 6,6,8,8,12,12; comparison needs its atom; Mellin value at 2 is 4π/d | False fixed-row inference replaced by negative control |
| `goldfeldCompletion` and one/two/congruence/product/order APIs | d=0 at s=1; d=2,M=3; Ψ=0; s=0,1,2 | Values 30 and 18; product scale ΛΛχ/d; totalized Γ(0) is not an entire continuation | Positive analytic-order hypotheses explicit |
| C1–C4; `oesterleTechnical` | Squares/nonsquares, zero Ψ, F=0, d=3,4, h=4, empty P(d), arbitrary auxiliary functions | Square support, simple zero, actual series identities and separate F prevent vacuous inputs; C quantified before K and G | Taylor argument covers zero F |
| `inverseMellinKernel` and complete API | m=0,1,2,3; a=0,1,−1; x≤0,1/16,1/4,1/2,1,2 | Stated API keeps m≥2; half-argument tests detect factorial and exponent; a<0 fails antitonicity | Retained |
| `positiveMellin_comparison` and cumulative variant | Zero measures; δ₁ versus (δ₁/₂+δ₃/₂)/2; signed measure; negative a | Integrated domination is weaker than cumulative domination and suffices by positive hinges; positivity is essential | Retained finite-mass and integrability binders |
| `fundamentalContour` | F=0; (s−1)³exp((s−1)²); exp((s−1)²) | Wrong sign gives 1/(2√π); missing order gives 1/2; even Taylor coefficients give removable quotient | Identically zero case explicit |
| `truncatedResidue` and contour identity | H=G=1; H(1)=0; U=2; η=0 | Expanded residue remains valid without division; strict cutoff is empty at 2; zero indentation is invalid | η>0 explicit |
| `tailThreePieces` and technical-constant estimates | dM<U; d=23; M=N/(4π²); h=4 | Absolute logarithm is necessary; reciprocal-a sum is 2; c₅=πN^(3/2)/12; m=3/2 at h=4 | Retained |
| `curve139`, `curve37`, discriminants, c₄/c₆, j, ellipticity, twists and source equation | Origins; (−156,77); (1,0),(1,−1); rational coordinate substitution; O88 model | Invariants independently computed; source equation has nonzero scale; degree-three kernel and differing j-values agree | Named source isogeny; expanded own-definition example |
| `curve5077`, discriminant/c₄, ellipticity, equation, sign-model and point APIs | (0,2),(1,0),(2,0),(0,−2); Δ=5077 | First three lie on the plus-y model, the last does not; y↦−y gives the other model | Retained |
| `analyticRank_parity` | w=±1; centre 1 versus 1/2; L identically zero | a₁=1 excludes identically zero continuation; nonzero gamma factor preserves finite order | General parity stays with AL.5 |
| `twist_LFunction_coeff`, conductor and root number | D=1,−7,−139; even D; p=2,3; shared conductor primes | Constructor trace/norm discriminant is D; ND² requires coprimality; coefficient binder expresses good reduction at divisors of D | Retained all-type local target |
| `twist_local_weilDeligne` and Frobenius convention | Trace-zero good prime 5; split multiplicative 37; double local twist | Dual geometric operator is A-transpose; factors 1+5T² and 1−T; inversion alone fails | Retained inertia and monodromy |
| `curve_local_data`; `curve_models_minimal`; `curve37_local_polynomial_checks`; `curve37_trace_five` | 2,3,5,7,37,139,5077; scaled equation at 7 | Discriminant valuations below 12; good-prime counts agree; nonminimal raw count 8 differs from minimal count 9 | Retained intrinsic polynomial comparison |
| `mordellWeilRank_eq_three`, basis, torsion and descent targets | Reduction orders 7,10 and 5,9; dependent point −2Q₂; O of height zero | Coprime counts kill torsion; Gram determinants give only lower bounds; descent remains required | O included; conditional fallback wording eliminated |
| `bgzKernel`, all APIs, both remainder bounds and boundary bounds | r=0,1,2,3; x≤0,1,2,5; K=0,1 | G₁′=−exp(−x)/x; factorial matters; integrated Taylor remainder handles initially increasing terms | Retained |
| `centralDerivative_series` and tail | r=0,1,3; n=0,1,2; B=0,250,400 | a₀=0 forced by coefficient bound; a_n/n and lower vanishing essential; B=400 tail about 5.89143·10^(−16) | N,r,B domains explicit |
| Three §2.7 numerical milestones | Entire continuation versus totalized series; conductor 37; −7 twist | Numerical bounds remain targets, not assumptions; differentiability and series-agreement binders survive elaboration | Retained |
| `heegnerTrace`, Galois, field and conjugation APIs | Principal class; class of order three; (N,D)=(37,−139),(5077,−7),(27,−3),(3,−3) | Arithmetic Artin uses inverse class; norm-27 quotient is not cyclic; ramified norm-3 construction is allowed | Cyclic condition made unambiguous |
| Gross–Zagier targets and full product rule | Odd/even D; shared N; w=±1; φ replaced by [m]φ; m=0 | Source formula uses odd coprime D and split level primes; both derivative summands needed; constant map invalidates denominators | Nonconstant φ and nonzero m explicit |
| `heegnerHeight_gap`; E5077 rational descent, height gap, constant and exact derivative | b=0 excluded; η=0 or η≥δ; O; reduction orders 7 over F₉ and 20 over F₂₅ | Actual rational descent gives relative gap 1; fixed positive quantitative constant and twist nonvanishing are required | Retained |
| η quotient, invariant/q-expansion/divisor APIs | Exponents ±1 versus ±2; cusps 0,∞; q^(−3)−2q^(−2) | Congruences require square; divisor 3(0)−3(∞), degree three | Retained |
| CM-value APIs; `heegnerTrace_37_eq_zero`; `heegnerTrace_139` | Norm-37 generators; three ideal classes; twelfth roots in degree-three H/K; arbitrary lattice basis | Common CM value gives principal divisor; base L(1)≠0 is required; lattice formula needs adapted basis | Basis choice explicit |
| Third-derivative bounds and `rankThree_139`, `rankThree_5077` | Exact L′=0 before r=3; derivative divided by 6; identically zero L | Nonzero third derivative gives finite analytic order three; arithmetic rank is independent | Retained |
| Liouville product and complete local API | Good a_p=0; multiplicative; additive; restored good factor | Trace zero at a good prime gives (1+pX²)^(−2); additive factor is 1 | Retained |
| Symmetric-square definition, all bad factors and Rankin–Selberg comparison | Good, multiplicative, quadratic-good twists, other additive and wild p=2,3 | Tensor invariants and monodromy retain the missing bad factors and motivic shift | Retained |
| `rankinSelberg_selfPair_polynomialGrowth`; `liouvilleProduct_C4` | Self-pair poles 0,1; norm translates; gamma strips across nonpositive real part | Finite growth needs gamma estimates and finite order, not completed bounds alone; zeta pole gives simple zero | Actual ANT I §0.23a contract retained |
| `liouvilleSystem`; `ramifiedTwistSystem`; local comparison | χ(−N)=±1; overlaps at 37 and139; even D and wild local characters | Plus product sign required; restored factors square-supported; finitely many local quadratic characters | Retained all ramified cases |
| Restored 139 factor and Taylor data | Both ε; coefficients at 139 and139²; s=1 | Odd coefficient 0, coefficient −262; B(1)=19321/19584; logarithmic derivative 11log139/408 | Retained accepted correction |
| `peterssonNorm_sym2`; constants 7000 and55 | M=N/(4π²); all four 139 scales and both signs | Petersson/full-factor normalization retained; corrected contour and numerical enclosures remain proof targets | Retained |
| `exceptional_5077`, `global_7000`, `coprime_55` | d=3,4; real +5077; split/inert/ramified conductor primes | Negative −5077 impossible; 7000 includes overlaps; 55 keeps coprimality | Retained non-strict constants |
| `primeMajorant` and all basic/weight/log APIs | t=0,1,2,3; c=0 and c>0; primes 2,3,5; d=84 | Empty products c; positive denominators (√p−1)²; smooth factors decrease while floor factors do not | Nonmonotonicity pair corrected |
| `explicitT_bound`; `rationalPrimeCount_eq`; nth-prime and reciprocal-root sums | Inclusive x=1,2,5/2; p₀=2,p₁=3,p₄=11; t=1 | Rational ideal norms match primes; π(p_n)=n+1; asymptotic constants 1 and2 | Rational-prime adapter named |
| `primeMajorant_log_asymptotic` | Fixed c<1,c=1,c>1; index shifts; t=0,1 outside limit | Leading constant 4; fixed log c and reciprocal-prime error negligible | Retained |
| `effectiveKappa` and all branch/positivity/monotonicity APIs | q≤0,1/4,1/2,1 and q>1 | Values 0,2^(−814),2^(−302),1/2; ceiling exponent decreases | Retained |
| `effectiveLogarithmic_bound`, `effective_cutoff`, `effective_vs_siegel` | h=1; H=0 impossible; ε≥q; q≥1; d=3,907 | log d>1 gives exponent order; exponents 604/605 follow by squaring; no effective Siegel constant inferred | Unspecified-effective-constant Check corrected |
| `classThree_prime` | d=3,4,8,23,31; p≡7 mod8 | Exceptional fields have h=1; split 2 forces p≤32 | Retained |
| Hardy function, realness, Stirling and approximate-FE targets | Odd/even character; t=0; an interval crossing zero | Odd gamma factor and continuous phase essential; an enclosure crossing zero proves no sign | Retained source hypotheses |
| `mwZero_brackets`; `montgomeryWeinberger` | Three k; dyadic values −1,−1,0; closed exclusion endpoints | Brackets match Table I; opposite Hardy signs establish zeros; MW windows overlap | Retained |
| `IsInertPrime` and projections/antitone/minimum APIs | x=0,3; p=3; prime 1333963 at 43,47; composite77683; 67/163 candidates | Primality and mod8 are essential; membership of all stated candidates independently checked | Retained |
| `smallRange_sieve`, `classThree_cutoff`, list APIs and `classThree_enumeration` | 4·43³,4·67³,4·163³; all negative fundamental D with abs(D)≤907; −243,−163 | Chain 318028,1203052,17322988; exact enumeration gives all sixteen values including −907 | Retained |

## Source checks and limits

Source-line locators here use the source extraction references recorded in the accepted package reports. I independently inspected rendered printed pages for the principal normalization and range claims: O85 line 131 (§1.3, p.312), O85 line 351 (§3.5, p.318), GZ83 line 95 (Corollary 6, p.87), GZ86 line 278 ((6.3)–(6.5), p.230), GZ86 line 329 (Proposition (7.4), p.231), BGZ85 line 127 ((7), p.475), and MW74 line 70 (Theorem, p.530), line 257 (Table I, p.537), line 299 (windows, p.538) and line 348 ((8), p.539). DLMF §5.11 was also opened at its official source. No source passage was copied.

Independent exact arithmetic covered all fundamental negative discriminants through 907, the displayed reduced-form lists and primitivity/strictness controls, all four displayed curves' invariants, small-prime point counts, the ramified weights, the 139 rational correction, the three prime-chain bounds and membership/primality of all three inert-pattern candidates. Floating-point tail checks were diagnostic only, not claimed proof certificates.

The complete descents and height enclosures, numerical central-derivative proofs, quantitative Gross–Zagier constant, corrected 7000/55 enclosures, Hardy endpoint signs, MW interval bounds and large minimum exclusions remain the intended mathematical proof targets. The build checks elaboration, not their truth.

The accepted O88 locator waiver is preserved; I do not claim to have re-read that work. Direct AMS access to LLS70 returned an access error, so its accepted certified locator decision is preserved rather than replaced by an unapproved mirror; its least-prime minimality statements were not independently re-proved. The source-model invariants and degree-three kernel were checked independently.

No unresolved port defect or upward dependency remains. No push, pull-request or issue write, supplier edit, top-level README edit, manifest/toolchain change or merge-order change was made. No suspicious instruction was acted on. All job processes have finished.



Pull request: #1406 (roadmap/effective-class-numbers at 177f685)
