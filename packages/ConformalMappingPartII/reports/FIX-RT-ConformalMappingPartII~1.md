# ConformalMappingPartII repair report

Identifiers prefixed r1a and r1b refer to the two supplied reviews. F01–F15 follow review r1a; F16–F21 are the additional distinct findings from review r1b. Each section records its original review aliases. Overlapping findings are settled together; a merged severity is the higher severity. Changes are confined to the authorized package files and this report.

## F01 (P3) — applied

Reviews: r1a-F01 / r1b-F02.

35 admitted examples → 15 proved examples testing retained definitions, with substantial analytic boundary checks promoted to named theorem targets and documented at their README subsections. Library-only examples were deleted. No example contains `sorry`; the theorem admissions remain specifications, not verification of their truth. Evidence: direct inspection of every example and the final structural check below.

## F02 (P2) — applied

Reviews: r1a-F02 / r1b-F01.

Unqualified radius ownership → import ClassicalArithmeticCompletion §6.20 and retain the universal-cover extension. `conformalRadius.riemannMap` → `conformalRadius.eq_classical` on proper simply connected pointed open domains. Affine covariance and monotonicity are general-cover extensions agreeing with the supplier there; the totalizations remain distinct. The supplier explicitly defines its outside-class value as zero and lists all three consumed APIs.

## F03 (P3) — applied

Reviews: r1a-F03 / r1b-F07.

Nonexistent `LogMeromorphic` module → the exact Mathlib files `Mathlib/Analysis/SpecialFunctions/Integrability/Log.lean` and `PosLog.lean`. At Mathlib commit 6b7abb3c7686292736be2955bd3eb9ebf63b456a, lines 122 and 65 respectively state the named meromorphic circle-integrability theorems. Their actual hypotheses permit zeros and poles on the circle.

## F04 (P3) — applied

Reviews: r1a-F04 / r1b-F03.

17 unnamed representative signatures → their exact Lean names at the corresponding README targets. All additional boundary theorem names are also documented with their hypotheses and mathematical locators. Literal name comparison now finds no retained definition, structure or theorem absent from the README.

## F05 (P2) — applied

Reviews: r1a-F05.

Roots-only covering existence signature → add `PointedCover.exists_cover` with open, connected, pointed domain hypotheses and two distinct omitted finite points. The existing real-bodied `PointedCover` supplies every carrier. No finite-connectivity restriction is introduced; §1.1 explains the analytic construction and its supplier gap.

## F06 (P2) — applied

Reviews: r1a-F06.

Gauss equation excluding terminating numerators → arbitrary complex a,b, with only c excluded from the nonpositive integers and |x|<1. Added the entire terminating identity and the polynomial checks 1 and 1−x. Pinned terminating-radius theorems are at `Mathlib/Analysis/SpecialFunctions/OrdinaryHypergeometric.lean:149,154`; the coefficient formula at line 105 proves termination. DLMF-15-10 line 78 fixes the equation.

## F07 (P1) — not actionable in this package: ModularForms must supply Little Picard

Reviews: r1a-F07.

Unowned surface classification → owned noncompact plane-coordinate construction, with Perron, Green-function, embedding and exhaustion targets and three Checks. Uniformization line 39 states exactly this sufficient theorem. The remaining Little Picard export belongs to ModularForms under ConformalMapping’s ownership specification, but is absent from ModularForms Layer 10. Declared gap:little-picard in both authorized locations; only the supplier can settle that omission.

## F08 (P1) — applied

Reviews: r1a-F08 / r1b-F14.

Presumed puncture expansion from abstract cusp charts → `FinitePuncturedCover.cuspComparison` in §1.12, including cofiniteness, puncture/cusp correspondence, compactification and a nonzero primitive-q coefficient. Imported ComplexCurveModuli D0.4’s finite-type metric rather than rebuilding it. Repointed §§1.6, 2.5 and 5.4. Three Checks distinguish infinity, the 1/2 Schwarzian coefficient and nonprimitive width. The r1b severity was P3.

## F09 (P3) — applied differently

Reviews: r1a-F09 / r1b-F06.

CDT’s motivational paragraph as theorem support → TeschlODE (1.18), p.7 and Theorem 4.7 with proof, p.130 for companion coordinates and complex continuation. Extremality/monotonicity instead cite Schwarz equality after lifting. The Lean germ docstring identifies the supplier comparison. TeschlODE lines 438–444 and 6243–6254 were read; CDT-journal lines 275–325 do not state the claimed theorem family.

## F10 (P3) — applied differently

Reviews: r1a-F10 / r1b-F13.

Missing scalar tests → proved examples for the boundary factor −1, constant count/characteristic, pivot zero and the coefficient-one solution/non-solution pair. Inverse Schwarzian, disconnected-cover and other substantial boundary checks are named README/Lean theorem targets, as the brief permits. Native Cayley and matrix computations remain supplier agreements/prose: library-only Lean examples would contradict the example rule addressed in r1b-F04.

## F11 (P3) — applied differently

Reviews: r1a-F11.

No source manifest → eleven retained works/sections recorded with authors, title, year, exact locators, cited targets and access provenance. Redundant Abramowitz–Stegun references were replaced by the read DLMF formulas. Tsuji uses DOI 10.4099/jjm1924.21.0_1. Hempel and Kraus–Roth are explicitly uncertified primary locators; all other retained texts were read from the sources-service cache or fetches. See access details below.

## F12 (P3) — applied

Reviews: r1a-F12.

Radius preservation as an exceptional-set test → a positive membership witness: t^N=1−exp(−MN)/2, with 0<t<1, and a disc preimage supplied by surjectivity. Added `ExceptionalCuspSet.nonempty` as a named boundary target. Together with zero exclusion and rotated large values, the Checks now reject both empty and whole-disc substitutes. Radius preservation remains API, not a membership test.

## F13 (P3) — applied

Reviews: r1a-F13.

Wrong accessory and mean-estimate locators → (5.1.13), p.670; (5.1.14), p.670; its following computation, pp.670–671; and §6.2.2/(6.2.3), p.682 with (6.1.3), p.679. Verified against CDT-journal lines 2498, 2514, 2537, 3017 and 3221–3233. Hempel’s primary locator remains explicitly uncertified.

## F14 (P3) — applied

Reviews: r1a-F14 / r1b-F05.

Unused Tau Ceti Möbius import → delete it. The only import is `import Mathlib`. The scalar boundary extension and README’s native interior-factor comparison retain their mathematics; no Tau Ceti identifier occurs in a retained Lean signature or proof.

## F15 (P2) — applied

Reviews: r1a-F15.

Locally re-owned holomorphic initial-value theory → consume DiophantineApproximationAndTranscendence §5.1’s disc system/scalar existence, uniqueness and dimension theorems. Layer 0 retains the equation/germ and unscaled-jet adapters plus continuation/global comparison. Updated scope, exact contracts, §§0.1–0.4 Needs and the Lean initial-value docstring. The supplier’s §5.1 states precisely the disc theorems and evaluation equivalence.

## F16 (P3) — applied

Reviews: r1b-F04.

Library-only examples, excess examples and a closing name catalogue → remove those examples and the process/catalogue comments. Every retained example tests a roadmap definition, with at most two per definition. The two factor boundary values are combined in one example. Heavy cover, radius, inverse-coefficient and meromorphic boundary assertions now have names and matching README targets.

## F17 (P3) — applied

Reviews: r1b-F08.

Nine nonexistent ConformalMapping milestone fragments → links to its README, with the actual L2/L3/L4 Layers-list item named in the label. The main-branch file presents these milestones as bold list items rather than headings, so the removed fragments have no GitHub heading anchors.

## F18 (P3) — applied

Reviews: r1b-F09.

“Current-library inputs are ownership deferrals” → “These inputs are consumed from the pinned Tau Ceti modules named above.” Removed the temporal/process description without changing any mathematical contract.

## F19 (P3) — applied

Reviews: r1b-F10.

Generic geometric re-statements → exact pinned inputs for origin-fixing rotations, Dirichlet domains, covolume/cofiniteness, native cusp data, precise horodisc invariance, Shimizu height bounds and triangle/ideal-region areas. Layers 1, 6 and 8 now identify the roots-specific comparisons. The displayed rotation is explicitly `rotation (-Real.pi / N)` in Tau Ceti’s convention.

## F20 (P3) — applied

Reviews: r1b-F11.

Expanded Schwarzian presented without its native first-order object → express it as P′−P²/2 with P=`logDeriv (deriv f)`. Added the pre-Schwarzian module and exact composition input to the contracts/Needs. At the Tau Ceti pin, `TauCeti/Analysis/Complex/Conformal/PreSchwarzian.lean:72` states its chain rule; no Schwarzian theorem itself was found there.

## F21 (P3) — applied

Reviews: r1b-F12.

Silent departure from CDT’s matrix sign → explicit correction after the matrix in §1.8. CDT-journal lines 2357–2364 put ζ_N beside that matrix. Under the stipulated left action, N=3 and τ=2i give inverse-Cayley value −1/6−(√3/6)i=ζ₃⁻¹/3, proving the roadmap’s sign. The matrix and all dependent group presentations retain that convention.

## Mathematical audit

Each numbered subsection below includes its stated API. Named Lean boundary targets and the proved examples are covered in the corresponding rows. Complex scalar coefficients make positive-characteristic, zero-ring and mixed-characteristic tests inapplicable; order zero is excluded by `LinearEquation.positiveOrder`. All needed domain, radius, nonvanishing and level hypotheses occur in the declarations themselves, rather than unused section variables. Surface and group construction targets stay in the README where they require substantial new objects.

| Statement | Instances tried | Result | Change |
|---|---|---|---|
| Native Cayley agreements | 0, 1/2, boundary 1 | i, 3i, zero denominator at boundary | Supplier agreement retained |
| Lifted atlas agreements | Disc, annulus, overlapping sheets | Identity cover; noninjective annulus projection; identity transitions | Retained native atlas |
| Conventions: jets and measures | y=x²; constant circle function 1 | Second derivative 2; circle mean 1 | Proved jet example; probability normalization retained |
| Conventions: radius and groups | N=1, N=2, ±SL₂ lift | N=1 excluded geometrically; lift sign immaterial | Radius totalization and rotation correction explicit |
| §0.1 equation, solution, jets, companion API | y′=0; y″=0; y′+y=0; v=(0,1) | Constants; affine functions; exp(−z) passes and 1 fails; wrong vector fails | Local owner imported; proved predicate/jet tests |
| §0.2 germ equivalence/initial value | Jets (u,v), (0,0,2) | u+v(z−x₀), z²; equality only as germs | Supplier comparison |
| §0.3 path continuation | y′=0; punctured-domain equation | Constants continue; endpoint can depend on homotopy | Exact source, path hypotheses retained |
| §0.4 global jets/dimension | Plane; simply connected disc; punctured domain | Unique on domain in simply connected cases only | Named global target; explicit simply-connected binder |
| §0.5 meromorphic basis and identity monodromy | Ordinary point; c/z; exp(1/z) | Pole bounds 0,1; essential singularity disproves converse | Retained full-basis and regularity distinctions |
| §0.6 simultaneous pole clearing | p regular/nonconstant; conjugate algebraic images | High minimal-polynomial powers clear finite bounds | Retained no Galois-saturation restriction |
| §1.1 noncompact coordinate and Perron API | Closed radius-R disc Green function; plane; disc; sphere | log(R/|z|); plane/disc coordinates; sphere excluded by noncompactness | Owned analytic construction; Little Picard supplier gap |
| §1.1 covering existence | Disc; twice-punctured plane; infinitely connected domain; once-punctured plane | First three eligible; last lacks two omitted points | Added full Lean existence signature |
| §1.2 cover/lift/rotation API | Identity, square, disconnected two-disc union | Identity passes; square ramified; disconnected target impossible | Named boundary targets; exact rotation input |
| §1.3 radius API | Balls of radii 1,2; φ(z)=z/2; punctured plane | Radii 1,2; reciprocal derivative 2; no hyperbolic interpretation for last | Imported simply connected owner and comparison |
| §1.4 extremality | Identity lift; contraction l(z)=z/2 | Equality vs strict derivative bound | Schwarz equality source; existing explicit holomorphy/nonzero context |
| §1.5 monotonicity | Concentric balls; equal domains | 1≤2; equality | General-cover extension agrees with supplier |
| §1.6 roots cover/orientation API | N=2; precomposition by iz; real approach to 1 | Target omits ±1; derivative becomes imaginary; 1 is a limit | Named cusp/orientation targets; cusp comparison |
| §1.7 nonzero derivative | Identity vs square | Cover is étale; square is not | Retained |
| §1.8 rotations and matrices | N=2,3; τ=2i | Inverse disc rotation for displayed left-action matrix | Explicit source-sign correction |
| §1.9 power descent API | N=2, z and −z; nonzero lift of zero | Root independence; ramification of order N at noncentral lifts | Retained native descent specialization |
| §1.10 descended derivative | F(z)=az+O(z^(N+1)) | G′(0)=a^N | Retained nonzero derivative/level guards |
| §1.11 projective deck realization | Disc identity; punctured sphere | Trivial group vs free properly discontinuous action | Generic projective action consumed |
| §1.12 finite-puncture cusp comparison API | Three punctures including infinity; primitive width; width mw | Area 2π; coefficient c≠0 and Schwarzian 1/2; q_m gives order m | Added comparison and three discriminating Checks |
| §2.1 Schwarzian and expanded API | 2z+1, z², 1/z; critical point 0 | 0, −3/(2z²), 0 on guarded domains | Proved affine/square tests; named inverse target; native pre-Schwarzian |
| §2.2 chain rule | f(z)=z², g(z)=2z | Weight 4, not 2 | Retained nonzero derivative hypotheses |
| §2.3 Möbius invariance | Affine map; inversion | Schwarzian unchanged where denominator is nonzero | Retained determinant/domain guards |
| §2.4 Schwarzian ODE | w=z; w=z² off 0 | y″=0; solutions z^(3/2), z^(−1/2) on chosen branch | Square root branch and independence retained |
| §2.5 accessory principal parts | Primitive logarithmic cusp; infinity unpunctured | Double coefficient 1/2; decay O(X⁻⁴) at infinity | Added actual puncture comparison; corrected locator |
| §2.6 infinity constraints | Expansion of 1/(X−p), 1/(X−p)² | Coefficients X⁻¹,X⁻²,X⁻³ yield the three displayed sums | Corrected locator |
| §2.7 symmetric accessory constants | N=2; roots sum zero | m₀=0, c=−(N+1)/(2N) | Corrected locator |
| §2.8 inverse rational Schwarzian | N=2 at zero | S(ψ₂)(0)=3/2 | Named Lean target; rational denominator guard retained |
| §2.9 inverse equation | N=2; normalized vs arbitrary basis | Nonzero coefficient at zero; arbitrary basis changes quotient by Möbius map | Retained matching condition |
| §3.1 boundary factor API | a=0,1,−1; z at cancelled pole | z,−1,1 | Proved checks; no unused native import |
| §3.2 finite product API | Empty data; multiplicity 2 at 0; boundary-only data | 1, z², −1 | Two proved examples; strict-disc hypothesis retained |
| §3.3 zero removal | g=z²; g=z−1 | Interior zeros removed; boundary zero may remain | Retained open-disc zero-free conclusion |
| §3.4 normalized analytic logarithm | g=1; g=exp z; g=i | L=0; L=z; last fails normalization | Native Herglotz plus log construction distinguished |
| §3.5 derivative integral | g=1, exp z | 0,1 | Retained interior radius/zero-free guards |
| §3.6 phase | Constant i | Integral exponential 1, phase restores i | Retained |
| §3.7 radial smoothing | Boundary zero z−1 | Enlarged circle avoids that zero | Retained ε/neighborhood distinction |
| §3.8 quotient representation | g=0,1,i | Constant multiplier suffices | Named Lean target retained |
| §3.9 quotient optimality | g=h=1 | Both sides 0 | Retained a.e. logarithmic identity |
| §4.1 Gauss equation | (a,b,c)=(0,1,1),(−1,1,1); c=0 | 1,1−x solve globally; denominator pole excluded | Removed numerator exclusions; terminating targets/Checks |
| §4.2 transformed equation | x=u^N; N=2 | Coefficients by two chain-rule differentiations agree | Branch hypothesis retained |
| §4.3 hypergeometric solutions | N=2; exponents at 0 | Leading powers x^(1/2),1 | Compatible branches and initial-jet matching retained |
| §4.4 inverse ratio API | u=0; N=2 cubic term | J(0)=0, J′(0)=1, J₂‴(0)=3/2 | Proved constant-term example; named coefficient targets |
| §4.5 actual inverse | F′(0)=a; source rotation | Prefactor a⁻¹, not a | Named matching theorem; both germ compositions retained |
| §4.6 zero-balanced continuation | k=0; a=1/2 | −log x−2γ−2ψ(a); ordinary Γ(2a) factor | DLMF normalization verified |
| §4.7 digamma coefficients | k=1,a=1/2 | ψ(2)−ψ(3/2)=2log2−1>0 | Correct k+1 convention retained |
| §4.8 uniform tails/parameter derivative | a=1/4,3/4; small x | Compact parameter interval avoids poles; difference gains 1/N | Retained parameter-derivative requirement |
| §5.1 Gamma expression/API | N=1,2,3 | 0 totalized; stated Γ(1/4), Γ(1/6) values | Proved level-one example; named special values |
| §5.2 positivity | Smallest Gamma argument at N=2 | Positive, denominators nonzero | Retained N≥2 |
| §5.3 alternative Gamma expression | N=2 | Reflection/duplication agrees with original expression | Retained |
| §5.4 inverse boundary limit | Real x→1− | Logarithms cancel in ratio; inverse reaches modulus-one boundary | Added puncture comparison dependency |
| §5.5 exact radius | N=2,3 and arbitrary cover phase | Norm independent of phase, agrees with Gamma values | Named target |
| §5.6 log-Gamma Taylor series | z=0; coefficients z,z² | 0; −γ and ζ(2)/2 | DLMF formula plus log(1+z) verified |
| §5.7 odd-zeta series | k=1,2 | ζ(3)/(2N³), 3ζ(5)/(8N⁵) | Retained positivity and absolute convergence |
| §5.8 positive remainder | Exponential of first odd term | Positive ζ(3)²/(8N⁶) contribution | Named bound with positive remainder retained |
| §6.1 ideal polygon | N=2 | Ideal quadrilateral area 2π | Native Dirichlet domain consumed |
| §6.2 primitive translation | N=2 | h₂=2 | Native CuspDatum/full stabilizer |
| §6.3 free presentation | N=2; rotation generator | Rank 2; rotation torsion cannot be a deck element | Retained projective/torsion-free distinction |
| §6.4 power stabilizer API | N=2; rotation coset | Index 2; general coset exact order N | Retained actual conjugated action |
| §6.5 full invariance group | Powers equal at every point | Ratio is constant root of unity; reduces to deck group | Retained global invariance hypothesis |
| §6.6 quadrilateral | N=2 | Area π | Native Gauss–Bonnet and ideal limit consumed |
| §6.7 half rotation | Both exp(±πi/N) | Same reciprocal identity; applying twice restores value | Denominators nonzero by omitted roots |
| §6.8 triangle supergroup API | N=2; reflection | Area π/2, index 2; antiholomorphic reflection excluded | Native area input; actual orientation-preserving group retained |
| §7.1 local counting API | 1/z; constant; pole on circle | log r<0; 0; 0 boundary weight | Proved constant example; named boundary targets |
| §7.2 characteristic API | Constant c including 0; z; 1/z | log⁺|c|; 0; 0 by cancellation | Proved general constant example |
| §7.3 regular-centre positivity | Centre pole vs regular germ | Pole has negative count; guard is essential | Retained meromorphic-order guard |
| §7.4 zero-count criterion and scalarSpike API | Spike values 2/1; boundary pole | Order/count zero does not force continuity; boundary pole permitted | Proved scalar values; named meromorphic boundary target |
| §7.5 local Jensen | f(z)=az, a≠0; reciprocal | log r+log|a|; pole sign reversed | Retained trailing coefficient and centre term |
| §7.6 first main inversion | f=1/z; f=0 | Difference 0 for first; zero germ excluded for second | Retained nonzero-germ guard |
| §7.7 translation proximity | f=0, a=0, a=1 | Totalized log⁺ gives valid finite bound | Retained |
| §7.8 translated first main | f=a; f−a with simple zero | First excluded; trailing coefficient required in second | Explicit non-top order binder retained |
| §7.9 characteristic powers | n=0,1,2; centre pole | Zero at n=0; linear multiplicities | Retained natural-power generality |
| §7.10 radial monotonicity | Constant function; h(z)=az | Equality; nondecreasing positive logarithm | Retained holomorphy and positive radii |
| §8.1 inverse cusp asymptotics | a± in [1/4,3/4] | Parameter difference 1/N controls difference of tails | Retained uniform constants with M₀>0 |
| §8.2 small cusp height | Fundamental quadrilateral, N large | Height proportional to N²M | Retained region/threshold, no arbitrary lift hypothesis |
| §8.3 transported horoball | g=1,D=1; lift −g | Centre 1/2, diameter 1; unchanged | Native geometry input; denominator a²+c²>0 |
| §8.4 Shimizu application | c≠0; c=0 | h|c|≥1; full stabilizer gives a=±1 | Exact native inputs; separate c=0 argument retained |
| §8.5 exceptional-set API | 0; t^N=1−exp(−MN)/2; large values | Exclusion; actual membership; rotated membership | Replaced nondiscriminating Check; named targets |
| §8.6 horoball exclusion | M=N/(1−r), N>A | Diameter ≤A(1−r)/N<1−r | Retained effective threshold |
| §8.7 maximum growth | N≥N₀; r→1 | Log bound CN/(1−r); no unsupported small-level claim | Named target |
| §9.1 kernel mean | w=R real, r→0 | 1/(R²−r²), tending to 1/R² | Retained R>r>0 |
| §9.2 logarithm L¹ | g=1, exp z | 0; positive/negative means equal | Retained g(0)=1 and zero-free guard |
| §9.3 logarithmic mean | H=0,1; t=exp(−1) | Zero cases; maximal entropy contribution 1/e | Retained probability measure |
| §9.4 logarithmic derivative | g=1; R↓r | 0≤log2+1/e; denominator requires strict inequality | Named target, explicit radii |
| §9.5 small-radius transfer | r<1/4; r=3/4 | ρ=1/4<R; R=7/8 for second | Retained correct outer radius |
| §9.6 omitted-value derivative | F(z)=az+O(z^(N+1)) | f′/f=−Na^N z^(N−1)+higher terms | f(0)=1 and zero-free retained |
| §9.7 pivot API | x=0,2,1 at N=2 | 0,4/3,totalized 0 with actual pole | Proved values; named pole target |
| §9.8 partial fractions | N=2,x=2 | (2/2)(1+1/3)=4/3 | Retained factor 1/N and omitted-root guard |
| §9.9 chain identity | z=0; leading term | Both zero; product −a^N z^N | Nonzero N,F′,f denominators retained |
| §9.10 pivot lower bound | Small r; T≥0 holomorphic covers | Additive −log4 is harmless; scales by N | Retained |
| §9.11 fixed-level effectivity | Finite list of N; r≤1/4; r→1 | Boundary asymptotics alone do not cover small radii/effectivity | Full estimate remains a target; no invented supplier theorem |
| §9.12 three mean estimates | Constant term F^N−1=−1 | Leading-coefficient modulus 1; differences ≤log4 | Corrected source locator |
| §9.13 derivative at omitted one | 1−F(0)=1 | Zero-free logarithm normalized correctly | Retained |
| §9.14 logarithmic derivative divisor | Simple zero of F at 0 | F′/F has simple pole; F/F′ holomorphic | Retained nonzero F′ |
| §9.15 reciprocal derivative bound | Centre coefficient of F′/F | Trailing coefficient 1; radius positivity supplies bounded constant | Retained local first main input |
| §9.16 pivot upper bound | Holomorphic factors; z=0 | Vanishing pivot causes no proximity singularity | Retained |
| §9.17 large-N mean absorption | N≥2 | N/(N−1)≤2 | Retained threshold and uniform constant |
| §9.18 small-level completion | Empty finite list; nonempty list | Maximum with large-level C covers both cases | Retained fixed-level effectivity requirement |
| §9.19 uniform mean growth | All three powers; source rotation | Same circle means; every N≥2 covered after finite completion | Named endpoint and explicit quantifiers |

## Sources, pinned libraries and supplier evidence

Mathlib and Tau Ceti checkouts were read at the exact manifest revisions: 6b7abb3c7686292736be2955bd3eb9ebf63b456a and a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. Object searches distinguished the native pre-Schwarzian, Herglotz, power descent, logarithmic integrability, divisor and geometric group inputs from the additional comparisons here. In particular, `TauCeti/Analysis/Complex/Conformal/RiemannMapping/Existence.lean:96` quantifies over a plane subset, so it cannot supply a coordinate on an abstract cover. Rotation rigidity is declared in `TauCeti/Analysis/Complex/Conformal/UnitDisc/Automorphism/Rotation.lean:72` and re-exported by `.Classification`.

Main-branch ownership was checked in ConformalMapping, UniversalCovers, FuchsianOrbifolds, ClassicalArithmeticCompletion §6.20, DiophantineApproximationAndTranscendence §5.1 and ComplexCurveModuli D0.4. The five specified open sibling folders were searched read-only by mathematical object; none supplies the missing abstract coordinate or puncture comparison. ArithmeticDynamics mentions a conformal-radius estimate but introduces no competing radius definition for these targets.

The added analytic construction is supported by Uniformization line 39 (Theorem 1), lines 152–159 (Perron/Dirichlet), 213–219 (Green function), 253–257 (bordered embedding), 383–390 (exhaustion), and 462–503 (normalized limit embedding). These are locators into the legally fetched v2, not borrowed text. McMullenRS lines 318–336 give the triply punctured sphere model motivating the Little Picard supplier contract.

DLMF-15-8 lines 516–520 and DLMF-15-2 lines 145–149 give the continued zero-balanced series and its bold-function normalization. DLMF-5-7 lines 127–132 and 252–256 give the log-Gamma and digamma formulas. Restoring Γ(2a), substituting b=a,m=0 and setting the series variable to 1−x gives the README’s signs and k+1 index. DLMF-15-10 line 78 gives the Gauss equation.

TeschlODE was read from an existing sources-service author-page cache; its header identifies the legal author URL and its page-footer notices identify the publisher-permitted preliminary version. The live refetch returned HTTP 502. The manifest records the cache hash and timestamp, with that limitation. The exact lines used are 438–444 and 6243–6254; no missing text is needed for these locators.

Hempel’s publisher page identifies the PDF as subscriber-only. Its primary theorem locators are therefore explicitly uncertified; the accessory formulas actually read are CDT-journal lines 2491–2537. Kraus–Roth was recorded by the sources service as uncertified. Tsu52 was fetched legally and its formula checked on the rendered printed page 25 after a sources-service OCR pass (Tsu52 line 1017 in that OCR extraction; Theorem 11). For p punctures the coefficient of logarithmic boundary growth is 1/(p−2), with an additive bounded remainder. For ℂ∖μ_N, p=N+1. This is a fixed-level asymptotic; effectivity and the small-radius bound remain owned targets, consistent with CDT-journal lines 3011–3015.

There are no outstanding missing-reference entries. Failed initial DLMF fetches were replaced by successful institutional fetches; the unused failed Rainer reference is not cited. No source extraction or source file was copied into the package.

## Check outcomes and maintainer notes

- Elaborate `Suggested.lean`: **not available**, as specified. No Lean command was run, so the new proof scripts and signatures still need worker elaboration. No elaborated-type or kernel-verification claim is made.
- Required dependency check: exit 0, exact output:

```text
depcheck: 6 roadmaps, 38 edges, 0 problem(s)
```

No UPWARD or CYCLE line was emitted. The check was run against the specified package README, roadmap name and merge order. No tooling or merge-order change was made by this repair.

- Structural checks: 499 Lean lines; 3 real-bodied structures, 13 real-bodied definitions, 44 named theorem signatures and 15 proved examples. One import, `import Mathlib`; no admitted example, admitted data, `set_option`, placeholder proposition or retained name missing from the README. No more than two examples test any single retained definition. Manifest parses as TOML with all eleven entries carrying the required bibliographic fields, locator, target and status. The supplier-gap JSON parses and contains only the top-level `gaps` list. Whitespace diff check passed.
- `metadata.toml` is unchanged. The gap-only `design/plan.json` is new because this package had no design file; no other design fields were introduced. `merge-order/ORDER.txt` was already dirty when inspected and was left untouched.
- `gauss_equation` loses its `ha` and `hb` binders. A caller supplying those positional arguments must update; the theorem is mathematically stronger. No original named Lean theorem was renamed or deleted. The README API name `conformalRadius.riemannMap` is replaced by `conformalRadius.eq_classical`; consumers should use ClassicalArithmeticCompletion’s derivative theorem through that comparison.
- The missing Little Picard supplier contract is **not actionable in this package** and requires a human/supplier decision. It is recorded as gap:little-picard both under Exact supplier contracts and in the top-level gaps list. ModularForms must not acquire a dependency on this consumer to provide that input. The general covering milestone remains a target, with no simply connected or finite-connectivity shortcut.
- The actual finite-puncture/cusp adapter belongs here, before the accessory parameters; ComplexCurveModuli’s finite-type metric theorem and FuchsianOrbifolds’ abstract cusp compactification are consumed separately. The comparison does not assume the roots-cover polygon from Layer 6.
- These repairs are not an independent acceptance. A fresh review must assess the remaining supplier gap, the mathematical targets and the worker’s subsequent elaboration.

### Submission-format repair

Finding headings now use F01–F21, with the original review aliases preserved in each body; dispositions and mathematical repairs are unchanged. The six TeX residues use Unicode index notation. Eight theorem targets are now explicitly marked as README-only, and the three imported radius APIs carry their supplier namespace. No theorem was added, deleted or renamed; `Suggested.lean` is unchanged by this formatting repair.

The Harvard source URL contains a legitimate website path segment named `home`, which the private-path checker misclassified. Percent-encoding its initial letter as `%68ome` preserves the same URL resource and provenance without matching a machine-path pattern.

Targeted text checks: 21 finding sections parsed; zero TeX residues; zero missing README identifiers; zero Lean declaration names absent from the README; zero private-path matches in the README, report and manifest. The manifest parses with eleven source entries. Whitespace diff check passed. The required dependency check was rerun with exit 0 and exactly the output recorded above, with no UPWARD or CYCLE line. Elaboration remains **not available**; no Lean command was run.
