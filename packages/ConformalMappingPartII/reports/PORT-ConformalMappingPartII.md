# PORT-ConformalMappingPartII

Branch: `roadmap/conformal-mapping-part-ii`.
Head commit: c94888cd5b20bce1df7fd9eebcdaf15649e96c42.
Base verified: clean worktree at `a0af4de`.

## Validation

The designated module build exited 0. Exact outcome:

```text
Build completed successfully (8976 jobs).
```

There are **44 warnings**, all `declaration uses sorry`, with zero errors and zero other warnings. The 500-line module retains 3 structures, 13 real-bodied definitions, 44 theorem targets and 15 proved examples. The sole import is `import Mathlib`; no Tau Ceti import is needed by these signatures. All 60 named declarations were also checked in their elaborated forms by a temporary type-audit variant built with the same authorized module-build command. Its 44 admissions were its only warnings. The final file contains none of the temporary audit commands.

Exact push-gate summary (exit 0):

```text
gate ConformalMappingPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 check-labels-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```

Exact dependency-check output:

```text
depcheck: 12 roadmaps, 96 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line is present. The diff contains only `TauCetiRoadmap/ConformalMappingPartII/README.md`, `TauCetiRoadmap/ConformalMappingPartII/Suggested.lean` and `TauCetiRoadmap/ConformalMappingPartII/metadata.toml`. Whitespace checks pass. The final worktree is clean.

## Draft pull request body

Extend the conformal-mapping library from planar Riemann maps and analytic continuation to holomorphic universal covers of hyperbolic plane domains, their Schwarzian equations and quantitative disc growth. The roadmap develops complex linear equations, hypergeometric inverse germs, cusp geometry and disc-local Nevanlinna theory, culminating in the Gamma formula for the roots-of-unity covering radius and an effective mean-growth bound uniform in the level. These reusable interfaces supply analytic size and growth inputs for arithmetic holonomy and algebraicity criteria.

AI assistance: Codex (GPT-6) performed the port, supplier and duplication sweep, mathematical self-review and validation.

## Dependencies still in pull requests

None. Every direct roadmap supplier is on main, including ClassicalArithmeticCompletion, DiophantineApproximationAndTranscendence, ComplexCurveModuli, RiemannianGeometry, PDE, ConformalMapping, FuchsianOrbifolds and DifferentialGeometry; UniversalCovers is in Completed. Open revisions and progress reports for those roadmaps are not dependencies.

## Lean and README allocation

Nothing moved from the supplied Lean file into the README: every retained statement already uses pinned carriers or a real-bodied light definition. All 60 named declarations and all 15 proved examples remain. Only the covering-existence docstring changes to describe the repaired supplier route. Germ-space linear equivalences, continued hypergeometric branches, surface constructions and measured group regions retain their full README specifications. The opening Summary, definition APIs, discriminating Checks, worked examples, exact hypotheses and layer dependencies are preserved. Supplier agreements now sit with Exact supplier contracts, and API catalogues are written as prose.

## Supplier replacements and duplication removals

The object-level sweep found that the package's interior zero-removal target is already supplied by native canonical decomposition. Deleted that standalone target, renumbered the remaining Layer 3 subsections, and recorded ownership only in Scope and ownership. Consume `MeromorphicOn.exists_canonicalDecomp` and `Complex.CanonicalDecomp.divisor_eq_divisor`; the exact contract distinguishes codiscrete equality, normal-form extension, interior zeros and boundary zeros. The retained boundary-parameter Blaschke factor and finite-product wrapper compare to the reciprocal native canonical factor and `TauCeti.unitDiscMoebius`. Evidence: MathlibCanonicalDecomposition line 314 and MathlibCanonicalDecomposition line 390.

Preserved the accepted ownership decisions for native cover charts, Cayley coordinates, generic power descent, Herglotz, pre-Schwarzians, Shimizu, measured fundamental domains and cusp data. Preserved ClassicalArithmeticCompletion §6.20 for the simply connected radius and DiophantineApproximationAndTranscendence §5.1 for disc initial values. No supplier theorem is copied into Lean and no new competing carrier is introduced.

The package's conditional Little Picard contract names no actual ModularForms export. The port replaces that unsupplied dependency with explicit targets using suppliers already on main: pull ComplexCurveModuli D0.4's complete curvature −1 metric on the twice-punctured plane to its native universal cover, apply RiemannianGeometry R4.3/R4.7, and prove the oriented isometry is biholomorphic. A bounded entire lift and native Liouville then exclude the plane alternative for every hyperbolic plane domain. The full noncompact surface coordinate construction and the infinitely connected case remain. This does not add a second modular-uniformization or Little Picard programme. No notion moved from a later roadmap.

Searched all main and completed roadmaps by mathematical object and screened 318 open pull requests. Inspected the heads of 278 possible roadmap changes; for truncated patches, fetched the full README by ref or blob. Progress and infrastructure changes, and revisions of an existing roadmap, supply no new dependency. Examined the ten supplied model heads as well. EllipticIntegrals treats real elliptic specializations; QSeriesPartitionsAndMockModularForms treats basic q-series; FormalConnectionsOpers treats formal opers; GlobalHolomorphicFunctions treats entire products; AnalyticNumberTheoryPartI and ZerosOfLFunctions treat slit-plane Gamma/Stirling theory. None states the local Gauss, zero-balanced connection or log-Gamma Taylor identities retained here. ArithmeticDynamics' conformal-radius use is a dynamical application of univalent maps. No further overlap requires removal.

Also searched open Mathlib work and Lean Zulip by object. The MathlibSchwarzianDesign line 23 and MathlibSchwarzianDesign line 35 rational normalization and scalar spelling agree with the retained definition. It is design guidance, not an imported module or an unfulfilled supplier. Mathlib already supplies canonical decomposition at the manifest pin, so it is consumed immediately.

## Upstream reread fixes

- Replaced the unsupplied Little Picard premise with the finite-type metric-to-cover adapter and the general orientation-preserving isometry comparison. Added positive and negative orientation, curvature and area controls. The construction uses no general-cover existence theorem as its own premise. Sources: McMullenRS line 371; Uniformization line 27; ComplexCurveModuli line 50; RiemannianGeometry line 663 and RiemannianGeometry line 745; MathlibLiouville line 126.
- Deleted the duplicate zero-removal target and stated the native decomposition's exact nonzero-germ and normal-form contract. Boundary zeros remain and the identically zero function is treated separately. Source: MathlibCanonicalDecomposition line 314.
- Made the global ODE solution space a space of restrictions to the domain. Arbitrary values of scalar representatives outside the domain otherwise create an infinite-dimensional space. The Lean statement already uses equality on the domain. Source: TeschlODE line 8110.
- Expanded the inverse-Schwarzian prose from the germ at zero to every local inverse away from the omitted roots, matching the existing Lean signature. Source: CDT-journal line 3071.
- Specified sphere inversion at zeros of the cover as the value infinity, with its reciprocal coordinate, instead of allowing totalized scalar inversion to masquerade as a sphere map. Source: CDT-journal line 3046.
- Reconciled the matrix-convention half rotation with the positive-angle scalar signature: the two arguments differ by a root-of-unity rotation and give identical Nth powers. The accepted inverse-rotation correction remains. Sources: CDT-journal line 2775 and CDT-journal line 3480.
- Corrected extraction anchors for surface Dirichlet, Green and hyperbolic metric normalization: Uniformization line 196, Uniformization line 313 and McMullenRS line 6959. Retained printed theorem/page locators. Added accessible author links without introducing machine paths.
- Strengthened the companion-matrix sign and boundary Blaschke negative controls, and explicitly included the identically zero meromorphic representative among constant-counting tests. Their existing Lean examples already cover these scalar cases. Sources: TeschlODE line 8110; MathlibCanonicalDecomposition line 53; MathlibDivisor line 40.

## Adversarial mathematics pass

Each subsection row includes its definitions, API assertions, named Lean boundary targets and worked examples. All 44 elaborated theorem types were inspected: required domain, level, radius and nonvanishing hypotheses are explicit binders or fields of a real-bodied structure. There are no unused section hypotheses to disappear. Coefficients are ℂ or ℝ throughout; zero rings, residue characteristics and mixed-characteristic tests do not apply. Order zero is excluded by the equation record; roots-cover geometric statements exclude levels zero and one. Heavy surface, germ and group objects stay in the README.

| Statement | Instances tried | Result | Change |
| --- | --- | --- | --- |
| Conventions: scalar field, positive ODE order, unscaled jets | n=0,1,2,3; y=z² | n=0 excluded; second derivative 2, not coefficient 1 | Keep proved jet test; add companion sign control |
| Conventions: pointed domains and radius | empty set, disconnected two-disc union, disc, punctured plane | Pointed cover requires an actual surjective covering; two omissions distinguish the hyperbolic class | Keep explicit domain controls |
| Conventions: measures and totalized rational expressions | mean of 1; centre zero; root denominator | Mean 1; field junk values do not remove analytic poles | Keep probability means and pole guards |
| Conventions: orientation and effective constants | quarter-turn; opposite matrix lift; N=2 versus large N | Radius norm unchanged; projective lift sign immaterial; finite small levels still needed | Keep orientation and finite-completion obligations |
| Native Cayley contract | 0, 1/2, boundary 1 | i, 3i, zero denominator | Native supplier; sharpen sign tests |
| Native covering atlas contract | disc, annulus, overlapping sheets | Biholomorphic disc projection; noninjective annulus projection; identity transitions | Consume native atlas and topology |
| 0.1 equation, solution predicate, initial jet and companion | y′=0, y″=0, y′+y=0; vector (0,1) | Constants and affine maps; exp(−z) passes and 1 fails; wrong vector fails system | Retain all APIs; pin minus sign |
| 0.2 solution germs and initial-jet equivalence | jets c, (u,v), (0,0,2) | Constant, u+v(z−x₀), z² germs | Consume disc IVP; retain germ adapter |
| 0.3 continuation | constant coefficients; 1/z coefficient off zero; path through zero | Continuation exists along regular paths; singular path excluded | Retained |
| 0.4 global initial values | disc; simply connected slit domain; arbitrary outside values | Unique solution restriction and n-dimensional restricted space | Clarify restriction carrier |
| 0.5 punctured solution germs and meromorphic basis | ordinary point; xy′+y=0; x²y′+y=0 | Analytic basis; pole order one; exp(1/x) is single-valued but essential | Keep full n-element basis and finite-pole condition |
| 0.6 simultaneous pole clearing | ramified p−p(α); several algebraic images | Sufficient vanishing order clears the finite basis; minimal polynomials handle conjugates | Retained |
| 1.1 noncompact coordinate | plane, disc, sphere | First two admit coordinates; compact sphere excluded | Retain general noncompact theorem |
| 1.1 surface Perron | bounded constant family; harmonic replacement; unbounded positive constants | Harmonic envelope; local upper bound essential | Retain PDE transport and surface construction |
| 1.1 surface Dirichlet | constant data; Re z; annulus with 0/1 boundary values | c; Re z; log norm/log R | Keep boundary attainment and arbitrary surface topology |
| 1.1 surface Green function | radius-R disc; changed holomorphic coordinate; boundary | log(R/norm z); harmonic change of regular part; zero boundary | Correct extraction locator |
| 1.1 disc embedding, exhaustion and injective limit | disc exhaustion; plane exhaustion; normalized derivative | Nonconstant limit; plane alternative remains possible before exclusion | Retain normal-family bounds and collision exclusion |
| 1.1 twice-punctured metric-to-cover adapter | three punctures; punctured plane with cylindrical metric | Complete curvature −1 gives disc; curvature zero does not | Add explicit adapter; close supplier gap |
| 1.1 oriented isometry comparison | identity; conjugation; scaled conformal coordinates | Identity holomorphic; orientation reversal antiholomorphic | Add named comparison and controls |
| 1.1 general pointed-cover existence | disc; two omitted values; infinitely connected domain | Affine projection and bounded entire lift exclude plane in every case | No finite-connectivity restriction |
| 1.2 PointedCover, rotations, lifts and derivative | identity, dilation, square, disconnected union | First two pass; square ramifies; disconnected target fails surjectivity | Retain all named boundary targets |
| 1.3 radius and classical comparison | disc, radius-two disc, φ=z/2; one omission | 1,2, reciprocal derivative 2; one omission excluded | Preserve extension and distinct totalizations |
| 1.4 extremality | constant map; F(az), norm a below/equal to 1 | Zero derivative; strict inequality; equality for rotation lift | Retained |
| 1.5 radius monotonicity | radius-one into radius-two disc; equal domains | 1≤2; equality for identity inclusion | Retained |
| 1.6 projective deck realization | disc, annulus, finite punctures | Free discrete action with actual quotient; trivial disc deck group | Retain generic supplier comparisons |
| 1.7 metric comparison | vector 1 at zero; metric scaled by c; pullback by z/2 | Squared length 4; curvature −1/c; incomplete control has radial length log 3 | Name shared oriented-isometry input |
| 1.7 cusp comparison and API | {0,1,infinity}; primitive q versus q_m | Three cusps, area 2π; simple q term versus order m | Keep quotient-area transfer and primitive stabilizer |
| 1.8 RootsCover and orientation | N=1,2,3; zero; quarter-turn; radial endpoint | Level one excluded; interior omits roots; quarter-turn derivative imaginary positive | Keep existence and radial-limit targets |
| 1.9 nonvanishing cover derivative | zero and nonzero disc points | Local biholomorphism forbids critical points | Retained |
| 1.10 root equivariance and matrix sign | N=2 oddness; N=3 at τ=2i; negative matrix lift | Inverse-Cayley value ζ₃⁻¹/3; lift negation unchanged | Preserve accepted sign correction |
| 1.11 power descent and ramification API | leading term az; roots ±z at N=2; nonzero lift of zero | G′(0)=a^N; root-independent value; zero order N away from chosen branch | Consume native descent; retain specialization |
| 1.12 descended derivative | N=2,3; rotated source derivative | Complex derivative a^N and norm norm(a)^N | Retained |
| 2.1 Schwarzian and pre-Schwarzian API | 2z+1, z², 1/z; critical point zero | 0; −3/(2z²); 0 off pole; critical value has no univalence interpretation | Retain two proved examples and inverse target |
| 2.2 chain rule | affine composition; f holomorphic at g(x), not merely x | Squared derivative weight and evaluation point essential | Keep corrected hypotheses |
| 2.3 Möbius invariance | translation, dilation, inversion; determinant zero or pole | Invariance on nonsingular chart only | Retained |
| 2.4 Schwarzian ODE | w=z, w=z² off zero; independent affine solutions | Q=S/2; quotient reconstructed up to Möbius normalization | Retained |
| 2.5 accessory formula | three distinct finite punctures; unpunctured infinity | Logarithmic cusp gives coefficient 1/2; Schwarzian rational | Retain actual sphere-cover construction |
| 2.6 infinity constraints | coefficients of X⁻¹, X⁻², X⁻³ | Three stated sums cancel; O(X⁻⁴) remains | Retained |
| 2.7 symmetric accessory parameters | N=2,3; F=0 in companion coordinate | Stated residues satisfy constraints; companion value is infinity | Make sphere inversion explicit |
| 2.8 inverse Schwarzian | N=2 at zero; other inverse branches; X=1/x | Value 3/2; branch independence; x⁻⁴ weight | Match prose to general Lean signature |
| 2.9 inverse equation | N=2 at zero; arbitrary fundamental basis | Coefficient agrees with S/2; quotient needs normalization | Retained |
| 3.1 boundary-compatible factor | a=0,1,−1; cancelled boundary pole | z,−1,1; raw 0/0 gives wrong boundary value | Sharpen negative controls |
| 3.2 finite products | empty family; zero of order 2; boundary-only family | 1,z²,−1; strict disc image requires positive interior multiplicity | Retained |
| Native zero removal | g=z²; g=z−1; g=0 | Interior zero clears; boundary zero remains; zero germ excluded | Delete duplicate standalone target |
| 3.3 normalized logarithm/Herglotz | 1, exp(az); boundary zero; R=0 | L=0 or az; zero-free and positive-radius hypotheses essential | Retain native formula plus log construction |
| 3.4 derivative Herglotz | exp(az); nonunit constant | a; zero; normalization constant disappears | Retained |
| 3.5 quotient phase | G=i; G=1 | Integral exponential 1; phase i needed to recover i | Retained |
| 3.6 radial smoothing | boundary zero; zero-free map; zero function | Nearby outer circle handles isolated boundary zeros; zero case separate | Repoint to native decomposition |
| 3.7 quotient representation | g=0,1,i; boundary zeros; ε>0 | Constants allow h=1; smoothing provides closed-disc neighborhood | Retained |
| 3.8 quotient optimality | g=h=1; isolated zeros of h | Equality zero; a.e. log identity and Jensen give lower bound | Retained |
| 4.1 Gauss equation and terminating cases | parameters (0,1,1), (−1,1,1), c=0; x outside unit disc | 1 and 1−x solve globally; c=0 excluded | Keep explicit complex parameter types |
| 4.2 transformed equation | N=2; exponents at 0,1,infinity | Exponents 0,1/N; repeated 1/2; repeated −1/(2N) | Retained |
| 4.3 hypergeometric solutions | N=2; leading terms; denominator parameters | Leading x^(1/N),1; positive denominator parameters | Retained |
| 4.4 inverseRatio and coefficient API | N=2 at zero; cube coefficient; root rotation | Value 0; derivative 1; cubic coefficient 1/4 | Retain named initial/cubic targets |
| 4.5 inverse matching | two germ compositions; source phase; zero | Prefactor F′(0)⁻¹; norm prefactor only in oriented case | Retained |
| 4.6 zero-balanced continuation | k=0; a=1/2; shifted logarithm branch | Constant −log x−2γ−2ψ(a); ordinary Gamma prefactor required | Retained |
| 4.7 digamma control | k=1; a=1/4,1/2,3/4; k increasing | Positive decreasing difference; at a=1/2 value 2log 2−1 | Retain k+1 index |
| 4.8 uniform connection tail | x→0; parameter endpoints; parameter gap 1/N | Uniform tail and parameter derivative supply required 1/N | Retained |
| 5.1 Gamma radius and API | N=0,1,2,3; N→infinity | Arithmetic 1,0 at excluded levels; stated small-level values; limit 1 | Keep geometric range N≥2 |
| 5.2 positivity | N=2; general N≥2 | All Gamma arguments positive; denominator nonzero | Retained |
| 5.3 alternative Gamma formula | N=2,3; reflection and duplication | Same radius values with nonzero factors | Retained |
| 5.4 boundary ratio | real x→1 from below; N=2 | Leading logarithms give stated Gamma ratio; inverse reaches unit circle | Retained |
| 5.5 cover-radius formula | N=2,3; arbitrary source phase | Norm equals gammaRadius independently of phase | Retained |
| 5.6 log-Gamma Taylor identity | z=0; z and −z; real interval | Constant zero; linear term −γz; real branch agrees with positive Gamma log | Retain local identity, not global Stirling construction |
| 5.7 odd-zeta expansion | first two odd indices; cancellation of even powers | ζ(3)/(2N³), 3ζ(5)/(8N⁵), positive convergent terms | Retained |
| 5.8 positive remainder | N=2; first exponential cross term | ζ(3)²/(8N⁶)>0; tail bounded uniformly by C/N⁶ | Retained |
| 6.1 ideal polygon | N=2,3; side-pairing witness | Ideal 2N-gon of area 2π(N−1); vertices alone insufficient | Retained |
| 6.2 primitive translation | N=2; generator versus its mth power | Width 2; full stabilizer needed for primitive q | Retained |
| 6.3 free deck presentation | N=2; finite-order rotation fixing i | Rank N; nontrivial elliptic rotation not a deck element | Retained |
| 6.4 power stabilizer and API | N=2; quotient rotation; actual Cayley conjugation | Index N; exact order N; actual actions intertwined | Retained |
| 6.5 maximal power invariance | root-of-unity quotient; based elliptic stabilizer | Locally constant quotient is constant; adjust by rotation to get deck map | Retained |
| 6.6 quadrilateral | N=2; Cayley vertex images | Area π; general area 2π−2π/N | Retained |
| 6.7 half-rotation identity | zero; both half-angle signs; omitted roots | Values 1 at zero; both signs give same Nth power; denominator nonzero | Explain Lean/README convention agreement |
| 6.8 triangle supergroup and API | N=2; square of extra generator; reflection | Area π/2; index 2; antiholomorphic reflection excluded | Retained |
| 7.1 counting and API | constants 0,1; 1/z; pole on radius circle | 0; log r negative; boundary weight zero | Explicitly include zero representative |
| 7.2 characteristic and API | constants including 0; z; 1/z | Positive-log norm; 0; centre count cancels proximity | Retained |
| 7.3 counting positivity | regular centre; centre pole; infinite order | Nonnegative weights under centre-order guard; centre pole invalidates claim | Retained |
| 7.4 zero-count criterion and scalarSpike | assigned value 2; deleted limit 1; boundary pole | Zero divisor does not imply pointwise continuity; boundary pole permitted | Keep continuity guard and named negative control |
| 7.5 local Jensen | az,1/z; zero germ | Means log norm(a)+log r and −log r; zero germ excluded | Retained |
| 7.6 inversion identity | az and inverse; centre pole | Difference is log norm of trailing coefficient | Retained |
| 7.7 proximity translation | f=0; a=0,1; circle zeros | Positive-log triangle estimate finite with totalized logs | Retained |
| 7.8 translated first main theorem | f unequal/equal constant a; removable wrong point value | Equal germ excluded; trailing coefficient, not scalar centre value | Retained |
| 7.9 characteristic powers | exponent 0,1,2; f=1/z | Zero at exponent 0; signed centre terms scale | Retained |
| 7.10 radial monotonicity | 0,1,z; small radii | Positive-log submean is nondecreasing even with zeros | Retained |
| 8.1 cusp ratio | N=2; M=M₀; x→0 on a branch | Gamma prefactor cancels; derivative control gains 1/N | Retained |
| 8.2 cusp height | ε close to 0 or 1; M=M₀; large N | Positive lower bound with stated threshold | Retained |
| 8.3 horoball geometry | identity at D=1; opposite matrix lift | Centre 1/2, diameter 1; sign invariant; a²+c²>0 | Retained |
| 8.4 two-entry Shimizu | c nonzero; c=0; lift sign | Native inequality handles first case; full stabilizer handles second | Retained |
| 8.5 exceptional set and API | zero; preimage of t^N=1−exp(−MN)/2; large value | Zero excluded; positive membership; large value in rotated set and outside original | Retain all three named controls |
| 8.6 horoball exclusion | r→0,1; M=N/(1−r); N>A | Diameter at most A(1−r)/N below 1−r | Retained |
| 8.7 maximum growth | arbitrary cover phase; r→1; small N | Phase preserves circle supremum; theorem only asserts large-level range | Retained |
| 9.1 kernel mean | w=R; r→0 | 1/(R²−r²) tending to 1/R² | Retained |
| 9.2 logarithm L1 mean | 1; exp(az) | Mean log zero; positive/negative parts equal; factor 2 | Retained |
| 9.3 entropy/logarithmic mean | H=0,1; value A on measure p | p log A bounded using −p log p≤1/e | Retained |
| 9.4 logarithmic derivative | 1, exp(az); r→0; boundary zero | Constants harmless; zero-free/radius guards essential | Retained |
| 9.5 radius transfer | r<1/4, r=1/4, r=3/4 | ρ<R; gap at least (1−r)/4; R=7/8 at 3/4 | Retained |
| 9.6 logarithmic derivative of 1−F^N | zero; N=2; small r | Normalized zero-free function; radial transfer removes 1/r | Retained |
| 9.7 pivot and API | x=0,1,2; N=2 | 0, totalized 0,4/3; order −1 at root | Retained |
| 9.8 partial fractions | N=2,x=2; root input | 4/3 with coefficient 1/N; root excluded | Retained |
| 9.9 pivot chain | zero; leading F(z)=az+O(z^(N+1)) | Both sides zero; leading −a^N z^N; denominators nonzero | Retained |
| 9.10 pivot lower characteristic | r→0; N=2; f−1 at zero | Unit trailing coefficient; lower bound NT−log 4 | Retained |
| 9.11 effective fixed-level estimate | N=2; r≤1/4; boundary limit | All-radius explicit C_N required; asymptotic alone insufficient | Retained |
| 9.12 three mean estimates | all three rational functions; small r | Translation and inversion errors at most log 4 | Retained |
| 9.13 logarithmic derivative at one | zero; omitted value one | g(0)=1 and g zero-free; derivative sign immaterial to proximity | Retained |
| 9.14 logarithmic-derivative divisor | simple zero at centre or elsewhere; inverse ratio | Pole orders one agree; F/F′ holomorphic | Retained |
| 9.15 derivative reciprocal bound | zero; simple zeros; N=2 | No derivative zeros; inversion constant controlled by positive radius | Retained |
| 9.16 pivot upper characteristic | zero; omitted roots; boundary limit | Composed factors holomorphic; no hidden pole-count term | Retained |
| 9.17 large-level mean | N/(N−1); outer radius (1+r)/2 | Ratio≤2 for N≥2; maximum bound controls L_N | Retained |
| 9.18 finite completion | empty small-level list; nonempty list | Maximum with large-level constant works in both cases | Retained |
| 9.19 uniform mean-growth endpoint | three functions; N=2,3; source rotations; r→0,1 | One absolute constant and all radii; circle mean rotation invariant | Retained |

## Source identifiers and limits

The inherited source identifiers CDT-journal, Uniformization, McMullenRS, TeschlODE and the DLMF section identifiers refer to the works in `packages/ConformalMappingPartII/sources.toml`; references retain the source theorem, equation and printed-page locators. Newly checked line anchors use the legal author/institutional PDF or HTML extractions. No source passage was copied. Hempel and Kraus–Roth retain their accepted uncertified primary-locator dispositions; the accessible CDT invocations remain attached to those proof targets. Tsuji's live institutional PDF timed out during this pass, so its manifest certification was not silently recertified.

Local source identifiers used above: MathlibCanonicalDecomposition = `Mathlib/Analysis/Complex/CanonicalDecomposition.lean`; MathlibLiouville = `Mathlib/Analysis/Complex/Liouville.lean`; MathlibDivisor = `Mathlib/Analysis/Meromorphic/Divisor.lean`; ComplexCurveModuli = `TauCetiRoadmap/ComplexCurveModuli/README.md`; RiemannianGeometry = `TauCetiRoadmap/RiemannianGeometry/README.md`. MathlibSchwarzianDesign identifies the open Mathlib `Mathlib/Analysis/Calculus/Schwarzian/Basic.lean` design inspected by its head patch. All local supplier checks use Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` and Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, exactly as in the unchanged manifest.

## Instruction-like source text

The generic build documentation contains commands outside this task's allowed Lean command set. RootREADME line 340 (`README.md`) and Contributing line 215 (`CONTRIBUTING.md`) contain:

```text
lake exe cache get
lake build
```

These were treated as source data for command authorization and were not run. Only the task's designated module build was used. No other suspicious instruction passage was acted on.

## Unresolved

No port blocker remains. The 44 admitted theorem targets and the README's surface, analytic continuation and explicit-constant constructions are specifications for library work, not completed proofs. No push, pull request, issue or external message was made. No suspicious instruction passage was followed. The source package, top-level roadmap list, manifest, toolchain and merge-order file were not edited.


Pull request: #1407 (roadmap/conformal-mapping-part-ii at c94888c)
