# GenericDoublePointInterpolation repair report

The first seventeen finding sections follow review r1a; the final four follow
review r1b. Their original F-identifiers and severities are preserved, including
repeated identifiers. Overlapping findings reference their first settlement.
This report records repairs and verification, not independent acceptance.

## F01 (P1) — applied

Admitted foundational data → twelve explicit lightweight definitions/aliases/instances supporting eight headline theorems. The finite-index proof, native algebra evaluation, squared ideal, linear jet map, matrices, determinant and evaluation prime have real bodies. Heavy coordinate/homogenization/quotient choices and all dependent API declarations leave Suggested.lean; the quotient is an existential headline with its actual quotient-map formula.

## F02 (P3) — applied differently

All 55 admitted examples → discriminating prose Checks in README.md, with no examples in Suggested.lean. No boundary-case theorems were added as substitutes: the binding acceptance-test rule keeps these tests in the README. Existing coordinate, jet, quotient, metric and moving-family Checks are retained and recomputed.

## F03 (P3) — applied

Fifteen subimports, two options, anonymous declaration catalogue and old namespace → one import Mathlib, no options, one target-signatures module docstring, TauCetiRoadmap.GenericDoublePointInterpolation, layer comments and mathematical declaration docstrings. README headings and links now follow the required form without changing the build order; API facts and Checks are prose.

## F04 (P3) — applied

The obsolete Mathlib revision and every link using it → 6b7abb3c7686292736be2955bd3eb9ebf63b456a, matching the content lake-manifest.json. The named polynomial, derivative, CRT, matrix, Nullstellensatz and spectrum declarations were inspected at that pin. The Tau Ceti revision a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039 remains unchanged.

## F05 (P1) — applied differently

SF.0/SF.5 and an asserted continuation → exact SchemeAndStackFoundations §§0.28, 2.6, 5.12 contracts and gaps cartier-residual, generic-contact and plane-singular-incidence. Each gap names a Part II extension in Exact supplier contracts and design/plan.json. The existing supplier does not thereby acquire these theorems; downstream Needs lines explicitly retain the gaps.

## F06 (P1) — applied

homogeneousEuler → imported MvPolynomial.IsHomogeneous.sum_X_mul_pderiv, Mathlib/RingTheory/MvPolynomial/EulerIdentity.lean:73. It already proves Euler over commutative semirings, including degree zero. Exact integer rank witnesses now cites it; only the application with nonzero/invertible degree remains a README target. The duplicate Lean theorem is deleted.

## F07 (P2) — applied differently

Omitted elementary finite-base signatures → nearExceptionRanks, sexticPlane and quarticFive on the explicitly defined affine first-jet matrix over ℚ. This states the characteristic-zero witnesses actually used by the roadmap; integer lifts from modulo-101 witnesses are the proof input described in the README. All fifteen ranks were recomputed; no geometric carrier or positive-characteristic AH theorem is substituted.

## F08 (P3) — applied

No manifest → sources.toml with one lifetime key each for BO and COU, both certified through the sources service. BO records arXiv v2; COU records the published open article. Bibliography, versions, locators, cited-for fields, hashes and legal provenance are present. No source text was copied into the repository.

## F09 (P1) — applied differently

R09.1/R09.2 → AlgebraicModuliForArithmeticGeometry §§1.1–1.2 (projective bundles, integer twists, Čech comparison), §1.7 (rankLocus), §2.1 (hilbertFunctorAsQuot), with their actual hypotheses. Squared-point/moving-hyperplane specializations are owned here. Missing general finite-flat section/direction operations are gap:finite-flat-sections; compatible mixed specialization is the separate F12 gap. Every obsolete label was replaced.

## F10 (P3) — applied differently

Ring-general nonzero/non-equality Checks → identities over every commutative ring, inequalities only over nontrivial rings, with the zero-ring result explicitly 0=0. The same correction covers the doubled-origin and quadratic nonmembership Checks exposed by F17. These controls remain prose; adding proved or admitted Lean examples would pad the acceptance file.

## F11 (P3) — applied

Unmatched helper/API names → only the twenty retained declaration names in the README, at their actual definitions or headline targets. maximalMinor and genericAffineMinor are consolidated into genericAffinePrincipalOpen; integerGridSpecialization into integerGridForMinor. Numeric scheduler, plane arithmetic, length, kernel and boundary API names leave the Lean catalogue while their mathematics remains in the README.

## F12 (P1) — not actionable in this package: the missing general specialization contract requires its supplier

A trait limit claimed to give mixed specializations → a precise Layer 2 interface and gap:mixed-bad-incidence, assigned to AlgebraicModuliForArithmeticGeometry, Part II. It specifies the bad incidence, allowed base changes, dominant mixed strata, common special fiber, flatness and tangent conditions. Both contradictions now require it. No edit here can add or prove that contract in its owner.

## F13 (P1) — applied

A full-double-only Castelnuovo statement → residual/trace and the rank inequality for every finite closed subscheme of projective space, r,d≥1. Full doubles and transverse/tangent directions are applications with computed lengths 4=1+3, 2=1+1 and 2=0+2. Positive-dimensional cubic subspace uses explicitly consume the general Cartier supplier gap. Both mixed-scheme consumers are updated.

## F14 (P2) — applied

Additional independent conditions added to an already filled residual → independence of the smaller subscheme Φ∪Σ²∪F∪η_G inside the successful setup. Its rank is u+(r+1)(q−u−e)+f+2g. Both transverse and tangent paragraphs now use subset independence. BO line 894 gives exactly this inclusion; the example computes ranks 54 or 55 inside rank 56.

## F15 (P3) — applied

COU §3 p.491 for polynomial maximal minors → pp.491–492, separating generic matrix rank (COU lines 195–204) from polynomial minors and the integer box (COU lines 242–248). The selected integer universal determinant is explicitly identified as the algebraic reformulation proved here.

## F16 (P3) — applied differently

Missing native-construction controls → three determinant Checks (1, −1, repeated-support 0) and three evaluation-prime/spectrum Checks (origin kernel, distinct 0/1 kernels, zero-coordinate Spec k). Unused parameterScheme and evaluationSchemePoint wrappers leave Suggested.lean; their native Spec operations remain described in prose. No extra examples or boundary theorems are added.

## F17 (P2) — applied

Field-only prose for ring constructors → commutative-ring jet algebra, squared union ideal, bounded jet/value/derivative maps and matrix. Field hypotheses remain explicit for comaximality, distinct-point CRT, length and rank. Nontriviality controls were propagated as in F10. The new firstJetMatrix body actually uses and retains CommRing, correcting the dropped binder in the supplied signature audit.

## F01 (P3) — applied differently

The nine easy admitted API consequences → README API facts or exact pinned imports, with no replacement proofs in Suggested.lean. Euler is settled by r1a F06. Coordinate extensionality, multiplicativity, well-poisedness unfolding, isometry, coordinate-degree consequence and the three evaluation/spectrum consequences are all removed from the acceptance catalogue, including the two proposed simp/rfl exceptions.

## F02 (P3) — applied

evaluationPrime’s admitted IsPrime field → RingHom.ker_isPrime directly. Mathlib/RingTheory/Ideal/Maps.lean:845 proves primality of a kernel into a domain; the evaluation target is a field. The retained abbreviation elaborates with its Field binder and no admitted data. Its three README Checks are covered under r1a F16.

## F03 (P3) — applied

All five display-math blocks → Unicode formula paragraphs. The pattern repair also removes every TeX-only subscript/superscript fragment outside code. All heading changes have matching internal-link updates; the worker’s removed anchor tags remain absent. Package scanning reports latex=0 and tex=0.

## F04 (P3) — applied

Algebraically closed affine endpoints → every characteristic-zero field in the opening theorem, nonzero-minor, principal-open, generic interpolation, grid and pullback statements. The redundant four signatures are consolidated into the retained endpoint/grid headlines. The route takes a witness over an algebraic closure, descends its integer polynomial and uses the integer grid over k. Projective geometry retains its stated algebraic closure hypothesis.

## Gate failures and exact check outcomes

- **missing sources.toml:** added the schema-v1 manifest and legally fetched both cited works. Manifest validation returns sources=0. COU’s first URL request needed the publisher-open class; the successful service request settled it. No missing reference remains.
- **set_option=2:** both options deleted; final count 0.
- **latex=20:** all display delimiters removed; final count 0.
- **tex=22:** every TeX-only fragment replaced by Unicode or ordinary functional notation; final count 0.
- **sorry-data=13:** all admitted data removed or replaced by real definitions; final count 0.
- **sorry-examples=55:** every admitted example removed; final count 0. Their discriminating mathematics stays in README Checks.
- **imports=1:** the header is the single line import Mathlib; final count 0.
- **mathlib-subimports=15:** all fifteen subimports removed; final count 0.
- **no-import-mathlib=1:** import Mathlib is present; final count 0.

Final elaboration of packages/GenericDoublePointInterpolation/Suggested.lean
from the pinned content checkout: **exit 0; zero errors; eight intended
“declaration uses sorry” warnings, all on headline theorems; no other warnings**.
No TauCeti module import is needed, so no targeted supplier build was required.

A separate scratch module appends `#check @name` for **all twenty declarations**
to the final file and elaborates once at the same pins: **exit 0**. Each type was
compared with its README target. The eight headlines retain the field,
characteristic-zero, injectivity, dimension, minor-nonvanishing and degree
hypotheses they require. The twelve definitions/aliases/instances retain exactly
their type parameters. In particular firstJetMatrix retains `[CommRing R]`,
whereas the supplied old signature had lost it. No standing section hypotheses
remain to disappear accidentally.

| Declaration group | Elaborated hypotheses retained |
| --- | --- |
| Bounded, jetAlgebra, doubleIdeal, firstJetMap, firstJetMatrix | CommRing; the explicit dimension/degree/point parameters |
| Monomials, monomialsFintype, JetRows | Natural indices only |
| WellPoised, evaluationPrime | Field and point/dimension parameters |
| universalJetMatrix, selectedMinor | Explicit integer polynomial coefficient ring; natural indices/column embedding |
| doublePointQuotient | Field and injective tuple; specified quotient map |
| nearExceptionRanks, sexticPlane, quarticFive | ℚ and the exact finite rank lists |
| univariateHermiteRank | Arbitrary Field, injective tuple, every degree |
| genericAffinePrincipalOpen | Field, CharZero, r,n≥1, d≥5, dimension inequality |
| integerGridForMinor | Field, CharZero, arbitrary r,n,d, nonzero selected minor |
| parameterPullback | Field, CharZero, finite parameter type, nonzero pullback, individual degree bounds |

The required dependency command completed with **exit 0** and exactly:

```text
depcheck: 14 roadmaps, 103 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. Neither merge order nor tooling changed.
The source checkout’s top-level gate expects a TauCetiRoadmap layout and cannot
scan a board package directly; its initial missing-files diagnostic was a layout
mismatch. The worker’s actual package scanner was then invoked on this package
with the configured options, source validation and gap-reference check. It
completed with **exit 0** and exactly:

```text
gate GenericDoublePointInterpolation: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 depcheck=0 missing-files=0 sources=0 gaps=0 OK
```

Citation resolution finds **no missing cross-roadmap citation and no missing own
Lean name**. Its library-name phase cannot find the configured pins automatically;
the library declarations were therefore checked directly at the content pins.
Internal heading links resolve and no anchor tags were reintroduced.
The final whitespace check, git diff --check, also returns exit 0.

## Sources, ownership and mathematical limits

The legal sources read are BO (arXiv math/0701409v2) and COU (the publisher’s
open article). The new manifest entries preserve the service’s extraction
provenance and hash; no local cache path appears in the package. Relevant
passages read include BO lines 22–40, 127–141, 217–277, 279–317, 374–412,
481–592, 628–665, 765–839, 880–905, 943–977 and 983–990; COU lines 179–204,
242–248 and 255–268. The general Cartier application is explicitly an algebraic
extension supplied via its gap, rather than attributed to BO as a separately
stated general theorem.

SchemeAndStackFoundations was checked on the supplied main checkout, at §§0.28,
2.6 and 5.12. AlgebraicModuliForArithmeticGeometry was read using roadmaps show
at its indexed open head, at §§1.1–1.2, 1.7 and 2.1. The absent R09/SF continuation
claims are not treated as exports. Ownership searches used roadmaps grep across
main and indexed open heads, the board’s packages, and the supplied sibling
checkouts. The neighboring computational-number-theory, conformal, class-number,
abelian-scheme, unitary, Iwasawa, q-series, K3, cohomology, Coleman, Witt-vector,
progression and dynamics roadmaps do not own first-jet interpolation or the
Horace specializations. General ideal/sheaf and moduli work is assigned to its
existing owners; this package owns the polynomial adapters and interpolation
specializations. ComplexTori and PadicMeasuresIwasawaAlgebras on main were read
for roadmap form. No declaration uses another roadmap’s fully qualified name.

Pinned native definitions were also inspected by object: bounded polynomials
are restrictSupport on exponents of total weight at most d
(Mathlib/RingTheory/MvPolynomial/Basic.lean:164); they include the zero polynomial.
The native square-zero algebra multiplies two infinitesimals to zero. Its use
here does not assert distinct supports, a field, or a reduced quotient.
PrimeSpectrum kernels acquire primality from the domain target, not from an
admitted field. The supplied Tau Ceti total-degree results are in
TauCeti/RingTheory/MvPolynomial/RestrictTotalDegree.lean:39,52,72 and are imported
as existing mathematics in the supplier contracts rather than re-planned.

The inherited named consumer EffectiveBoundsCompactModels was also checked by
roadmaps show, main/Completed/board file searches and the merge order: it is
absent. Its unsupported ownership attribution is replaced by a statement about
arithmetic callers supplying their own parametrizations; no new consumer or
supplier is invented. IntegralLattices exists on main and in Completed.

There are **five explicit supplier gaps**. The missing mixed-incidence diagram
is not proved by these edits, nor by the modular computations below. F12 is
therefore recorded as not actionable here; the owner must supply the stated
contract or a human must choose another proof route. The other gaps similarly
record required general theorems without pretending that an existing owner
already states them. The package-stage design/plan.json did not exist; the new
file contains only the authorized top-level gaps list.

## Adversarial mathematics pass

The following rows give actual values, not a claim of formal proof. “Consistent”
means the displayed instances agree with the corrected statement; unbounded
geometry and arithmetic retain their cited proof obligations. Exact modular
ranks give integer nonzero minors and hence rational/characteristic-zero lower
bounds; they establish no general positive-characteristic AH theorem.

| Statement | Instances and computed values on both sides | Result | Change |
| --- | --- | --- | --- |
| Summary | r=2,n=7,d=5: m=N=21; collinear rank=11; r=n=1,d=5, minor=1 and origin jets rank=2 | Consistent generic claim | Field endpoint |
| Binomial count of bounded monomials | r=0 or d=0: 1=choose(d,d)=choose(r,0); r=d=2: 6=choose(4,2), coordinatewise model gives 9 | Consistent | Explicit finite adapter |
| Dimension of bounded polynomials | Over ℚ, (r,d)=(0,3),(2,0),(2,2): dimensions 1,1,6 = binomial counts 1,1,6 | Consistent | No new Lean padding |
| Coefficient coordinates | 2+3x² ↔ (2,0,3,0); inverse sum=2+3x²; d=0, C(7) ↔ (7) | Consistent | README equivalence |
| Fixed-degree homogenization | 1+x at d=2 ↦ X₀²+X₀X₁; X₀=1 returns 1+x; zero ring gives 0=0 | Consistent | Nontriviality for inequality |
| Homogeneous forms and twisting sections | P¹,d=2 has 3 monomials/sections; X₀X₁ on X₀=1 gives x, on X₁=1 gives X₀/X₁ | Consistent convention | Exact section supplier |
| Coefficient Gram form | G(x,y)=0, G(x,x)=1; G(2+x,2+x)=4+1=5; G(C2,C3)=6 | Consistent | Metric remains README |
| First-jet algebra evaluation | At 0, x ↦ (0,1), x² ↦ (0,0); at 3, x² ↦ (9,6); over F₂ derivative of x²=0 | Consistent | Real algebra map |
| Kernel of one first jet | k[x],P=0: kernel=(x²), x ↦ (0,1)≠0; r=0: kernel=0 and map k→k is identity | Consistent | No admitted kernel data |
| Distinct point ideals and their powers | k=ℚ,P=0,Q=1: x−(x−1)=1; squares comaximal via 1=(3−2x)x²+(1+2x)(x−1)²; P=Q gives sum (x) | Consistent | Field explicit |
| Squared union ideal | n=0: ideal=top, quotient=0; P=0: (x²); P=(0,0): still (x²), not (x⁴); zero ring gives zero ideals | Consistent | Ring constructor / field CRT |
| Double-point quotient comparison | P=(0,1): x(x−1) ↦ ((0,−1),(0,1)), nonzero with square0; r=2,n=1: dimensions 3=1+2; n=0: 0=0 | Consistent | Existential specified equivalence |
| Length of distinct double points | n=0: 0=0(r+1); n=1,r=2: 3=1·3; repeated P=(0,0) in A¹ has length2≠2·2 | Consistent | Injectivity retained |
| Bounded first-jet evaluation | At 0 in A², 1,x,y give I₃; at 3 in A¹, x² gives (9,6); d=0 derivatives=0; zero-ring target=0 | Consistent | Ring-general real linear map |
| Value projection | x at (0,1) gives (0,1); at 0, value(x)=0 while derivative=1; n=0 kernel=whole space | Consistent | Ring-general |
| Derivatives of vanishing polynomials | At 0: x ↦ 1, x² ↦ 0; d=0 value kernel=0; over zero ring x²=0 | Consistent | Nontrivial negative control |
| Surjectivity through the value kernel | One point, d=1: value rank1, kernel-gradient rank r, jet rank r+1; d=0: gradient rank0<r for r≥1 | Both directions consistent | README API |
| Monomial first-jet matrix | r=n=d=1,P=0 gives I₂; d=0 column=(1,0); r=n=d=2 gives 6×6; x² at 3 gives (9,6) | Consistent | Real body retains CommRing |
| Full row rank criterion | One point in A¹,d=1: rank2=2 and onto; d=0: rank1<2 and not onto; n=0: rank0=0 and onto | Both directions consistent | Field-only rank |
| Well-poised double points | One support,d=1: rank r+1, predicate true; r≥1,d=0: rank1<r+1, false; collinear seven:11<21, false | Consistent | All tuples allowed in predicate |
| Restriction to projective double points | At [1:0:0], degree1 sections 1,x,y give (value,dx,dy)=I₃; degree0 gives rank1<length3 | Consistent chart normalization | Exact suppliers |
| Restriction rank of a finite scheme | Simple point/constants: h=1; D=0: h=0; double point in A², d=1: h=3=length | Consistent | Actual section map |
| Restriction rank on disjoint unions | Constants on {0,1}: rank1=rank at 1 (1)+rank of zero kernel at 0 (0); linear polynomials:2=1+1 | Consistent | Kernel specified |
| Finite-scheme residual and trace | A³,H=(z): double point lengths4=1+3; transverse direction2=1+1; tangent direction2=0+2; empty0=0+0 | Consistent | General finite X; Cartier gap |
| Castelnuovo dimension bound | At d=1 in P³: double point h=4≥1+3=4; transverse h=2≥1+1=2; tangent h=2≥0+2=2; empty0≥0 | Consistent | Mixed schemes admitted |
| Ordinary Horace criterion | r=2,d=3,u=2: q=3 gives trace4≤4,residual5≤6,rank9=min(10,9); q=4 gives4≥4,8≥6,rank10=min(10,12) | Both ranges consistent | Full-double hypotheses explicit |
| Independent subschemes | One double origin,d=1 has rank3; its reduced subscheme rank1; enlarged cubic sample rank remains full column rank10 at q≥4 | Consistent | No change of object |
| Curvilinear criterion at one support | X=2·0 in A²: D=span(1,x,y) gives ranks3 and2 on directions; D=span(1,x) gives2<3 and y-direction1<2; D=0 fails simple-point test0<1 | Both directions consistent | Length≤2 includes simple point |
| Curvilinear reduction | Two reduced supports, D=constants: whole rank1<2 although each local rank1=1; curvilinear union has rank1<2; full Hermite d=3 gives4=2+2 | Consistent | Tests all unions, not only one support |
| Rank in flat point families | Matrix[t] has rank1 at generic t and0 at t=0; over k[ε]/ε² ideal(ε)≠0 though geometric rank0 | Consistent | Finite locally free, arbitrary base |
| Proper limits of curvilinear failures | A fixed direction along δ(t)=(a,t) has generic/special length2=2; [s:t] axis limits[0:1]≠[1:0] | Trait statement consistent | No mixed conclusion from properness |
| Compatible bad-incidence specialization interface | e=0: rank<0 locus empty; mixed F={1},G={2}: residual direction lengths1+2=3,trace1+0=1; [s:t] axis limits differ | Existence remains a supplier gap | No unsupported compatible section |
| Exact integer rank witnesses | Integer[2] has nonzero residue2 mod101 and rank1 over ℚ; integer[101] reduces0, so converse fails; F=x²+y² at (1,2): xFx+yFy=2+8=10=2F | Consistent | Euler imported; degree nonzero |
| Quadrics with prescribed singular points | P², q=0,1,2,3: vanishing dimensions6,3,1,0=choose(4−q,2); q=2 rank5<6; char2 square x² has zero partials | Consistent | Characteristic-zero geometry retained |
| Low-degree near-exception ranks | Cubic ranks9,10,20,30,35,120 and quartic ranks12,15,32,35,65,70 equal min(N,q(r+1)); all twelve reproduced mod101 | Consistent | nearExceptionRanks |
| Veronese tangents and double-point conditions | r=1,d=2,v=(1,0): tangent span{x₀²,x₀x₁}, annihilator span{x₁²}; dimensions2+1=3; d=0 excluded | Consistent | d≥1 / characteristic zero |
| Terracini span for the Veronese family | Conic in P²,q=1: affine tangent rank2; q=2: tangent span rank3, secant projective dimension2=3−1 | Consistent | Generic-contact supplier gap |
| Contact curve in the defective plane case | d=4,q=5: double conic has 2ℓ=4 and q=ℓ(ℓ+3)/2=5; d=2,q=2: double line has2ℓ=2,q=2 | Consistent | Plane-incidence supplier gap |
| Plane contact numerical reduction | d=5: q=7>floor(2·5/2)=5 at ℓ=2; d=6: q=9=3·6/2; d=7: q=12>9; sweep d≤100 has no other d≥5 | Consistent | README arithmetic |
| Exact sextic plane critical ranks | q=9:27=min(28,27); q=10:28=min(28,30); both actual matrix ranks reproduced mod101 | Consistent | sexticPlane |
| Plane interpolation input | d=2,q=2: actual5<expected6; d=4,q=5:14<15; d=6,q=9,10:27,28=expected | Consistent | Complete exceptions kept |
| Three-subspace cubic base rank witnesses | r=5,6,7: actual full ranks56,84,120=choose(r+3,3); three supports per space and frame/incidence ranks recomputed | Consistent | Mathematical rank witnesses |
| Three-subspace cubic recursion | r=8: vector frame dimensions6, pair spans9, triple span9; source cubic dimension165, trace dimension120, residual quadrics killed by three general spaces | Consistent source specialization | General Cartier gap for positive-dimensional unions |
| Two-subspace cubic base rank witnesses | r=5:3+3+3=9 double supports, actual rank56; r=7:5+5+3=13, actual rank120; all on/outside incidences tested | Consistent | Finite witnesses retained in README |
| Two-subspace cubic recursion | r=8→5: r−5=3 specialized supports per original space, leaving3 each; 3 ambient supports move to third space; kernel uses9 remaining supports | Consistent | Source Prop5.3; excludes r=4 |
| One-subspace cubic base rank witnesses | r=5:3 on +6 off + length2 remainder, transverse trace length1; actual rank56. r=7:7 on+8 off, rank120 | Consistent | All incidence conditions retained |
| One-subspace cubic recursion | r=5: (r+1)(r−2)/6=3 on,6 off,δ=2,trace1; r=7:r(r−1)/6=7 on,8 off,δ=0 | Consistent | Finite-flat remainder required |
| Cubic critical-count remainder | r=2: q=3,δ=10−9=1; r=5:q=9,δ=56−54=2; r=7:q=15,δ=120−120=0; 0≤r<2000 matches residue formula | Consistent | No natural underflow |
| Cubic maximal-rank input | r=4,q=6,7,8: actual ranks30,34,35; expected30,35,35; exceptional q=7 remains excluded | Consistent | Full exceptional count kept |
| Quartic P⁵ critical rank | Actual rational-lift matrix rank126 mod101=choose(9,4)=21·6; supports distinct | Consistent | quarticFive |
| Horace trace-size inequality | r=2,d=4,q=0 gives u=−5,e=0,lhs−5≤4; r=3,d=6,q=21 gives u=9,e=1,lhs12≤21 | Consistent; 205397 instances | Integer quotient retained |
| Horace residual-size inequality | r=2,d=4,q=0:6≤15; r=3,d=6,q=21:35≤44 | Consistent; same sweep | No natural subtraction |
| Large-dimensional quartic residual bound | r=10,d=4,q=91: u=71,e=5,residual15≥11=r+1 | Consistent; same sweep | r≥10 retained |
| Nonnegative critical Horace data | r=2,d=4,q=5: u=2,e=1,q−u−e=2; r=3,d=6,q=21:9,1,11; noncritical q=0 gives u=−5 | Consistent | Critical hypothesis essential |
| Mixed residual rank in degree d−1 | r=3,d=6,q=21,u=9,e=1: 11 off-H doubles plus one H-double have rank44+3=47, dimension56−47=9 | Consistent with predecessor | Source Step1 retained |
| Injective residual restriction to H | Same instance: degree4 source dimension35 versus11·4=44 conditions; kernel0, so degree5 divisible-by-H kernel also0 | Consistent | Correct predecessor AH(3,4,11) |
| Killing a residual system with simple points | Same residual system dimension9: nine general reduced points lower kernel9→0; full rank47+9=56 | Consistent | Reduced H / general points |
| Underfilled trace with simple remainder | Same instance: u=9 plane doubles rank27, e=1 simple point gives28=N(2,6); deleting that point gives27 | Consistent | Simultaneous nonempty opens required |
| Moving supports and hyperplanes | A²:δ(t)=(a,t),H_t=(y=t); δ(0)=(a,0); full local basis1,x−a,y−t length3 and restricted basis1,x−a length2 at t=0 and t≠0 | Consistent | Specializations owned here |
| Transverse curvilinear limit rank | r=3,d=6,q=21,f=1,g=0: residual9+44+1=54 inside length/rank56; trace27+1=28 | Consistent | Subset rank, not extra condition |
| Tangent directions in the moving residual | Same with f=0,g=1: special residual9+44+2=55 inside56; nearby rank≥55; trace27 | Conditional on mixed diagram | Gap explicitly consumed |
| Underfilled differential Horace contradiction | f=1,g=0:54+28=82; f=0,g=1:55+27=82; required threshold4·20+2=82 contradicts rank<82 | Arithmetic consistent; diagram gap | General finite Castelnuovo + explicit diagram input |
| Overfilled partial-length reduction | r=3,d=10,q=72:u=22,e=2,ν=0; length70·4+0·4+2·3=286=N(3,10); r=3,d=6,q=22:ν=−2,ordinary branch | Consistent | Integer ν, branch retained |
| Overfilled differential Horace contradiction | r=3,d=10,q=72,ν=0: F empty, G size2; residual22+192+4=218,trace66,sum284=4·70+4 | Conditional on mixed diagram | Selected trace; explicit diagram input |
| Differential Horace induction step | r=3,d=6,q=21 predecessors(2,6,9),(3,5,12),(3,4,11); (u,e)=(9,1); conclusion rank84=min(84,84) | Consistent with BO6.4 | No claim that trait properness proves the step |
| Univariate Hermite interpolation | n=0:rank0=min(d+1,0); one point,d=0:1=min(1,2); two distinct points,d=1,2,3:2,3,4; F₂/F₃/F₁₀₁ checks retain same ranks | Consistent | All fields; condition2n≤d+1 |
| Quartic P⁷ ordinary Horace input | N(6,4)=210=30·7; N(7,3)=120; q=41 residual328−210=118≤120, q=42 residual336−210=126≥120 | Both Horace ranges consistent | Dimension6 hypothesis retained |
| Quartic induction inputs | r=5:(u,e)=(14,0) hits exceptional(4,4,14), so independent rank126 base used; r=9,q=71,72:(54,4),(55,5),residual13,12≥10 | Consistent | Special r=5/r=7 handling retained |
| Exception-avoiding induction schedule | r=3,d=5,q=14:(2,5,7),(3,4,7),(3,3,7), none exceptional; r=3,d=6,q=21:(2,6,9),(3,5,12),(3,4,11);285 critical sweep cases avoid list | Consistent finite sweep | Unbounded source obligation retained |
| Generic characteristic-zero double-point rank | r=1,d=5,q=3:rank6=min(6,6); r=2,d=5,q=7:generic21=min(21,21), collinear11<21 | Consistent | Generic not every distinct tuple |
| Passing to the dense affine chart | P¹,d=1: [1:0],[1:1] are chart points; each value/derivative system transforms by invertible trivializations; one point rank2=2 | Consistent | Algebraic-closure witness stage only |
| Universal first-jet matrix | r=n=d=1: [[1,T],[0,1]]; d=0 derivative row0; x² at T=3 yields value9, derivative6, including after reduction mod2/3 | Consistent | Real polynomial matrix over any ring |
| Nonzero maximal minor | r=n=1,d=5, columns1,x give Δ=1≠0; r=2,n=7,d=5,collinear data give rank11<21 and every full minor0 | Consistent | Characteristic-zero field; integer descent |
| Degree of a first-jet minor | r=1,n=2,d=3:Δ=(b−a)^4, total degree4≤12=md and each degree4≤12; Δ=0 has totalDegree0≤12 | Consistent | Coordinate bound imported consequence |
| Principal-open full-jet locus | Δ=1 gives D(1)=whole spectrum, all evaluated minors1; Δ=0 gives D(0)=empty; Δ=(b−a)^4: at(0,1) value1, at(0,0) value0 | Both directions consistent | Conditional for any field/selected minor |
| Generic affine Hermite interpolation | r=n=1,d=5: m2≤6, Δ1, all points rank2; r=2,n=7,d=5: m21=N21 but special collinear rank11 | Consistent | All characteristic-zero fields |
| Bounded integer specialization | r=1,n=2,d=3:B=12, tuple(0,1) lies in[0,12]² and Δ=1; n=0:Δ1,B0,empty tuple; r=0,n=1:single constant jet rank1 | Consistent | No closure or positive n needed |
| Polynomial parameter pullback | θ=(0,u),Δ=(b−a)^4:pullback u^4, degree4, u=1 in[0,4] gives1; θ=(u,u) gives0 and fails hypothesis; empty parameters with θ=(0,1) give constant1 | Consistent | Nonzero pullback essential |
| Special collinear configurations fail | Seven points(i,0),d=5: value/x slice rank6 plus y slice rank5 gives11; actual modulo101 matrix rank11≠21 | Consistent | Prose negative control |
| Bounded / native zero degree | r=0:V=R; d=0:constants; zero polynomial has native totalDegree0≤d | Consistent | Native submodule, no new polynomial carrier |
| Monomials and monomialsFintype | r=0,d=3:one vector; r=2,d=0:one; r=2,d=2:six; each exponent≤d by sum bound | Consistent | Proof body has no sorry |
| JetRows and value/derivative convention | r=2,n=2:2·(1+2)=6 rows; 1,x at origin give(1,0),(0,1) | Consistent | None=value, Some=partial |
| Selected minor / sign | Columns(1,x):det1; swapped(x,1):det−1; two supports(0,1), degree3:det1; repeated(0,0):det0 | Consistent | Three discriminating Checks |
| Evaluation prime / spectrum point | Origin:T↦0,1↦1 so T∈ker,1∉ker; point1:T↦1, T−1↦0; nr=0:kernel0,Spec k one point | Consistent | Native ker_isPrime proof |
| Characteristic and exponent normalization | At0, x² derivative0; at3 derivative6; overF₂ derivative0,overF₃ value at3=0; no factorial inversions | Consistent | Ring formula retained |
| Euler normalization and forbidden degree | x²+y² at(1,2):10=2·5; d=0 constant1 has all partials0 but value1; characteristic2 x² at1 has partial0,value1 | Consistent | Only invertible positive degree forces value |
| Complete exceptional list | Actual ranks at(2,2,2),(2,4,5),(3,4,9),(4,3,7),(4,4,14):5,14,34,34,69 versus expected6,15,35,35,70 | Consistent | No exceptional predecessor assumed |
| Independence versus maximal rank | Plane cubic q=4: rank10, source10,target12; map injective and not onto; single double,d=1:rank3=target3 | Consistent | Overfilled conclusions use injectivity |
| Integer division and total-function controls | r=2,d=4,q=0:u=−5,e=0 (not natural0); zero polynomial degree0; n=0 determinant1; e=0 bad locus empty | Consistent | No truncated negative dividends |
| Distinct supports over rings | Overℤ,(x)+(x−2)=(x,2), evaluation at0 mod2 kills it, so1 absent; overℚ same sum contains1 | Consistent | Field CRT and nontrivial controls |
| Metric / integral lattice normalization | 2+x has integer coordinate vector(2,1), squared norm5; x,y coordinate dot product0; constants2,3 give6 | Consistent | Orthonormal native monomials |
| Parameter pullback zero/empty cases | Pullback u^4 at0=0,at1=1; identically0 pullback has no witness; constant1 on empty parameter set evaluates1 | Consistent | Nonzero pullback / B+1 grid |
| Square-zero multiplication convention | (a,u)(b,v)=(ab,av+bu): (2,1)(3,4)=(6,11); (0,1)²=(0,0) | Consistent | Reduced/triple-jet models excluded |

Each separately listed API identity is also tested below; values refer to the
same native object as its target row.

| API statement | Computed witness | Result | Change |
| --- | --- | --- | --- |
| c_d(f)(α)=coeff_α(f). | For f=2+3x², the x² coordinate is3=coeff(x²,f). | Consistent on the displayed instance | README API only |
| c_d⁻¹(a)=Σ over α∈A(r,d) of a_α X^α. | For a=(2,0,3,0), the inverse and monomial sum are both2+3x². | Consistent on the displayed instance | README API only |
| f=g iff c_d(f)=c_d(g). | f=g=2+3x² gives equality on both sides; g=2+4x² gives false on both sides because3≠4. | Consistent on the displayed instance | README API only |
| X^α maps to X₀^(d−Σα)X^α. | d=2,α=1:x maps to X₀X₁=X₀^(2−1)X₁. | Consistent on the displayed instance | README API only |
| Setting X₀=1 is the inverse on degree-d homogeneous forms. | X₀X₁ at X₀=1 gives x; homogenizing x back to degree2 gives X₀X₁. | Consistent on the displayed instance | README API only |
| H(d+e)(fg)=H_d(f)H_e(g), for f∈V_d and g∈V_e; targets have different degrees. | f=1+x,g=x,d=e=1:both sides are X₀X₁+X₁². | Consistent on the displayed instance | README API only |
| G(f,g)=Σ coeff_α(f)coeff_α(g). | f=2+x,g=3−x:both sides give6−1=5. | Consistent on the displayed instance | README API only |
| For real f≠0, G(f,f)>0. | f=2+x≠0:G(f,f)=4+1=5>0; f=0 gives0 and is excluded. | Consistent on the displayed instance | README API only |
| For the transported Euclidean norm, c_d is an isometry and the integral coordinates are Z^A(r,d). | f=2+x,g=0:both distances are√5; the coordinate vector(2,1) lies in ℤ². | Consistent on the displayed instance | README API only |
| fst(jetAlgebra_P(f))=eval P f. | f=x²,P=3:both scalar projections give9. | Consistent on the displayed instance | README API only |
| snd(jetAlgebra_P(f))(j)=eval P(pderiv j f). | f=x²,P=3:both derivative projections give6. | Consistent on the displayed instance | README API only |
| jetAlgebra_P(X_j)=(P_j,e_j). | P=3:the variable maps to(3,1)=(P,e); P=0 gives(0,1). | Consistent on the displayed instance | README API only |
| doubleIdeal(P)=(⋂ ker(eval P_i))². | P=0:both ideals are(x²); n=0:both ideals are top. | Consistent on the displayed instance | README API only |
| Over a field with injective P, doubleIdeal(P)=⋂ (ker(eval P_i))². | P=(0,1) over ℚ:both sides are(x²(x−1)²); repeated P fails injectivity. | Consistent on the displayed instance | README API only |
| Permuting the finite tuple leaves doubleIdeal unchanged. | P=(0,1) and its swap:both ideals are(x²(x−1)²). | Consistent on the displayed instance | README API only |
| The class of f maps to its tuple of native first jets. | f=x at P=(0,1):both quotient and jet images are((0,1),(1,1)). | Consistent on the displayed instance | README API only |
| Multiplication is the native square-zero multiplication in each factor. | f=x,g=1+x at3:product jets(3,1)(4,1)=(12,7); jet(x+x²)=(12,7). | Consistent on the displayed instance | README API only |
| A tuple permutation commutes with the induced product-factor permutation. | f=x,P=(0,1):both swapped images are((1,1),(0,1)). | Consistent on the displayed instance | README API only |
| J(f)_i(None)=eval P_i f. | f=x²,P=3:the None coordinate and evaluation are9=9. | Consistent on the displayed instance | README API only |
| J(f)_i(Some j)=eval P_i(pderiv j f). | f=x²,P=3:the Some coordinate and partial evaluation are6=6. | Consistent on the displayed instance | README API only |
| The α column is P_i^α in the value row and α_jP_i^(α−e_j) in derivative row j; zero exponent gives zero. | α=2,P=3:value9=3² and derivative6=2·3; α=0 derivative0=0. | Consistent on the displayed instance | README API only |
| valueMap(f)(i)=eval P_i f. | f=x,P=(0,1):both value tuples are(0,1). | Consistent on the displayed instance | README API only |
| valueMap is the None-row projection of J. | J(x) at(0,1)=((0,1),(1,1)); its None projection=(0,1)=valueMap(x). | Consistent on the displayed instance | README API only |
| f∈ker(valueMap) iff every f(P_i)=0. | f=x(x−1) has values(0,0), so both sides true; g=x has(0,1), so both sides false. | Consistent on the displayed instance | README API only |
| The (i,j) coordinate is ∂_j f(P_i). | f=x(x−1),P=(0,1):both gradient tuples are(−1,1). | Consistent on the displayed instance | README API only |
| It equals the Some-row projection of J on ker(valueMap). | For the same f,J(f)=((0,−1),(0,1)); Some projection=(−1,1)=kernel derivative. | Consistent on the displayed instance | README API only |
| Permuting points permutes the derivative target coordinates. | Swapping P=(0,1) sends derivative tuple(−1,1) to(1,−1) on both sides. | Consistent on the displayed instance | README API only |
| The None row at α equals P_i^α. | α=2,P=3:None matrix entry9=3². | Consistent on the displayed instance | README API only |
| The Some j row equals α_jP_i^(α−e_j), with zero when α_j=0. | α=2,P=3:Some entry6=2·3; α=0,P=0:entry0=0. | Consistent on the displayed instance | README API only |
| firstJetMatrix(P,d)·c_d(f)=J(P,d)(f). | Columns(1,x,x²) at3 send coefficients(2,0,3) to(29,18)=J(2+3x²). | Consistent on the displayed instance | README API only |
| WellPoised(P,d) iff Surjective(J(P,d)). | One point,d=1:both predicates true (rank2=2); d=0:both false (rank1<2). | Consistent on the displayed instance | README API only |
| WellPoised is unchanged under a permutation of points. | Two supports(0,1),d=3:rank4; swapping supports also rank4, so both predicates true. | Consistent on the displayed instance | README API only |
| If d≤e and WellPoised(P,d), then WellPoised(P,e). | Two supports(0,1):degree3 rank4 and degree4 rank4, hence onto in both degrees. | Consistent on the displayed instance | README API only |
| h(X,D)=dim D−dim ker(D→H⁰(X,O(d)\|X)). | X=double origin in A²,d=1:rank3=dimD3−kernel0; constants:rank1=1−0. | Consistent on the displayed instance | README API only |
| h(X,D)≤min(dim D,length X). | The same X has length3; constants give1≤min(1,3)=1; zero system gives0≤min(0,3)=0. | Consistent on the displayed instance | README API only |
| h(∅,D)=0. | X=empty gives0=0 for constants and for the zero linear system. | Consistent on the displayed instance | README API only |
| δ_i(0)=γ_i and H_i(0)=H. | δ(t)=(a,t),H_t=(y=t):at0 these are(a,0) and(y=0)=H. | Consistent on the displayed instance | README API only |
| The double-point and restricted double-point families have constant ranks r+1 and r over the distinct-support open. | A² moving point:full quotient basis1,x−a,y−t has length3 and restricted basis1,x−a length2 at0 and1. | Consistent on the displayed instance | README API only |
| Any parameter base change pulls back the same squared-ideal incidence family. | After t=s²,the full ideal is(x−a,y−s²)² on both pullbacks; at s=0 both fibers have length3. | Consistent on the displayed instance | README API only |
| Evaluating Tᵢⱼ=P_ij in k gives firstJetMatrix(P,d). | Universal x² column at T=3 gives(9,6)=native x² column at P=3. | Consistent on the displayed instance | README API only |
| The value entry is the product of T_i coordinates to exponent α. | One-variable α=2 at T=3:value entry9=3²; α=0:entry1. | Consistent on the displayed instance | README API only |
| The derivative entry is α_j times the exponent-decremented monomial, zero when α_j=0. | α=2 at T=3:derivative6=2·3; α=0:derivative0; at T=0,α=1:derivative1. | Consistent on the displayed instance | README API only |

The affine finite-rank computations used distinct integer-coordinate lifts and
exact arithmetic modulo 101, obtaining the twelve neighboring ranks, sextic
ranks 27/28 and quartic-five rank 126. Seven additional homogeneous subspace
matrices attained ranks (56,84,120), (56,120), (56,120). Every sample value row
was evaluated at a single actual point on its specified integer frame;
frame ranks, pair/triple spans, distinct projective supports, on/off-subspace
conditions and the transverse remainder direction were tested as well.
These checks explain the characteristic-zero witnesses and do not replace
formal determinant proofs.

The arithmetic sweep tested 205,397 division instances with 2≤r≤30,4≤d≤12,
all q≤min(ceiling,1000), together with both critical counts. It found zero
violations of the three bounds or critical nonnegativity. The exception
scheduler was tested on 285 critical instances with r≥3,d≥5. Plane degree
reduction was computed through d=100 and cubic remainder arithmetic through
r=1999. These finite sweeps are evidence against errors; BO Lemma 6.3,
Theorem 6.4 and the final induction remain the sources for unbounded statements.

## Maintainer consequences

No supplier, sibling, merge-order, pin, tool, issue or pull-request file was
changed; metadata.toml is unchanged. No commit or network write was made.
The worker’s anchor removal is preserved.

Names that may affect callers: the namespace is now
TauCetiRoadmap.GenericDoublePointInterpolation. The kept endpoint is
genericAffinePrincipalOpen; genericAffineMinor/maximalMinor are consolidated
there. integerGridSpecialization is consolidated into integerGridForMinor.
The admitted doubleQuotient choice is replaced by the existential
doublePointQuotient theorem; callers must choose its equivalence when needed.
All nonheadline API declarations, numeric/boundary theorems and examples were
removed from Suggested.lean, while their intended mathematics remains in README
prose. New finite-rank headlines are nearExceptionRanks, sexticPlane and
quarticFive. The source/supplier gaps must remain visible to downstream consumers.
A fresh independent pass is still required; this report does not supply one.
