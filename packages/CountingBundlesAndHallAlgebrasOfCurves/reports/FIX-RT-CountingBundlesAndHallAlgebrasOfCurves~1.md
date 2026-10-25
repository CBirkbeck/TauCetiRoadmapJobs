# CountingBundlesAndHallAlgebrasOfCurves: repair report

The finding identifiers below retain their original severities. Each paragraph identifies review r1a or r1b because those reviews reuse identifiers. Their Check-coverage findings were audited together, with separate verdicts below. No finding is disputed, and no independent acceptance is claimed.

## F01 (P1) — applied

Review r1a. Free-ring invariant positive representative → positive representative of an invariant cone class in §§9.2, 10.5 and 11.6. The degree-ten obstruction and the two representatives of q⁵ are explicit Checks. The reconstruction route now establishes independence of the class. S16 line 198 states stronger wording; monicity at S16 line 201 disproves that wording in genus two, rank two.

## F02 (P2) — applied differently

Review r1a. Undifferentiated zero fibre → Λ_sch and reduced Λ throughout Conventions, §§7.3, 8.7, 9.1–9.4 and the Lean docstring. Added the characteristic-two elliptic thickening. The proposed family wording needed correction too: rank-one θ=ε over dual numbers is nilpotent but has nonzero characteristic coefficient. Reduction comparisons use STACKS line 3033 and STACKS line 3130.

## F03 (P1) — applied

Review r1a. Reconstructed chart and zero-level quotient → imported EndoscopicTransferAndUnitaryTraceComparison §3.7 objects. Sections 7.4–7.5 now compare its strongly generated open, tangent sequence and natural duality. Scope and supplier contracts agree. The supplier explicitly constructs Q₁₂, its moment map and zero-level Higgs quotient; fixed-source bounds, Kronecker embedding, stability comparison and central deformation remain owned here.

## F04 (P3) — applied

Review r1a. Generator-membership and generic-law Checks → computed distinctions in §§4.6, 5.9, 10.1, 11.1, 11.3 and 11.5. Values include 3√2 versus 1, H_(2) coefficients 0 and 1, reciprocal one-box values (6,3) versus (6,4), three-flag indecomposability, the nonsplit genus-two HN extension, and Euler Hall products 2 versus 0. These are README Checks only.

## F05 (P3) — applied

Review r1a. Two equal-slope alleged HN factors → the single semistable class ((2,0)) in §4.7. The unequal-slope types have m>0. Their class counts are 1, while the inadmissible two-step slope-zero stratum has count 0. This agrees with the strict HN convention and S16 line 544 and GlobalShtukasAndFunctionFieldLanglands §0.5.

## F01 (P2) — applied differently

Review r1b. Injectivity-as-bijectivity → an explicit frame-cohomology vanishing target in §8.4, with full geometric semistability hypotheses, locator and three discriminating controls. S16 line 2753 assumes the missing dimension equality. The concrete non-surjective frame has dimensions 9→11; its zero-cotangent invariant pair has weight −115. No unsupported claim about arbitrary cotangent lifts is needed for this Check.

## F02 (P2) — applied

Review r1b. All-characteristic identification with restricted §3.6 → construction as §3.7's locally free open, with comparison to §3.6 only over finite fields in characteristic prime to r!. Updated the same existing gap:fixed-source-good-lines in Exact supplier contracts and only its needs sentence in design/plan.json. The supplier's §3.6 explicitly assumes characteristic prime to the Weyl order.

## F03 (P3) — applied differently

Review r1b. One mixed Check → five computed Checks for §8.9's three invariants and strict-slope Ext² condition. The proposed genus-zero test lies outside this section's g≥1 hypotheses; genus-two rank one instead distinguishes 2P(1) from the incorrect 8P(1). The elliptic rank-two mass 30 and logarithmic remainder 6 test both DT definitions and the slope-zero factor.

## F04 (P3) — applied

Review r1b. All-slope attribution to Theorem 1.2 → positive-slope attribution only, plus a slope-zero target proved by z⁰ extraction in the ordered HN product. MS14 line 96 restricts formula (4) to τ>0; MS14 line 427 includes τ=0 in the product. Nonnegative degrees ensure only slope zero survives that extraction, compatibly with Adams and Log.

## Verification outcomes

- Ran `lake env lean` on `packages/CountingBundlesAndHallAlgebrasOfCurves/Suggested.lean` from the supplied pinned content checkout. Exit 0; exactly two expected warnings, at lines 84 and 94, that the two headline declarations use `sorry`. All three imported Tau Ceti object files already existed; no build was necessary. No Lean process remains running.
- Made one scratch file containing the final declarations followed by `#check @name` for every one of the five declarations; elaborated it once. Exit 0, with the same two expected warnings. The signatures below retain every required binder. No declaration signature changed; only the module docstring changed.
- Ran the specified dependency command with `--movable`. Exit 0. Its complete output was:

```text
depcheck: 51 roadmaps, 597 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. The notation gate reported `tex=1` in §8.9’s genus-two Check; the raw exponent notation was replaced by the ASCII code span `q^(g-1)`, preserving the computed values 2P(1) and 8P(1). The citation resolver reported no missing roadmap citations or Lean names; its library disclaimer was addressed by direct searches at the pins. `git diff --check` passed.

The content checkout equals its origin/main at c57bdc02fc2a4b1643df71b4a3a14b20fdad247f. The manifest pins Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. The resolver's older indexed main label was not used as evidence of absence. Main-branch supplier sections present in the supplied checkout were read there; the named open supplier texts were resolved with `roadmaps show`, and the supplied sibling heads were read directly.

| Declaration | Elaborated context compared with README | Computed control | Outcome |
|---|---|---|---|
| bundleDegree | Explicit field k, scheme X in its universe, X over Spec k, fixed rank r and native fixed-rank sheaf | P¹: O(1) gives 2−1=1; O(1)⊕O(−1) gives 2−2=0; genus-two O² gives −2−2(−1)=0 | Matches §0.2; no lost binder |
| IsAbsolutelyIndecomposable | Same k,X,over-structure,r,E; pullback to the algebraic closure, then native Indecomposable | O: true; O²: false via diag(1,0); zero: false | Matches §0.2; nonzeroness retained |
| absIndecCount | Explicit k,X,over-structure,r,d; Nat.card of a Skeleton of a full subcategory | P¹/F₃ in ranks 0,1,2: 0,1,0; line mass 1/2 differs from class count 1 | Matches §0.2; arbitrary-scheme total function makes no finiteness assertion |
| nilpotent_matrix_count | Explicit finite field K and n:Nat, native square matrices | q=2,n=0,1,2: 1,1,4; q=3,n=2: 9; powers give 1,1,4,9 | Matches §1.4; natural subtraction at n=0 gives exponent 0 |
| absIndecCount_eq_of_degree | Explicit finite field; proper, smooth of relative dimension 1, geometrically connected structure morphism; all r:Nat and integer d,d′ | P¹ ranks 0,1,2 at d=−1,1 give 0=0,1=1,0=0; elliptic rank one gives P(1)=P(1) | Matches §10.4; every geometric hypothesis survives |

The two headline statements are not one-tactic consequences found at the pins. Native carriers and definitions were read at Mathlib `CategoryTheory/Limits/Shapes/BinaryBiproducts.lean:1096`, `CategoryTheory/Skeletal.lean:74`, `CategoryTheory/ObjectProperty/FullSubcategory.lean:39`, and Tau Ceti `AlgebraicGeometry/VectorBundle/FixedRank.lean:69,104`, `AlgebraicGeometry/Cohomology/EulerCharacteristic.lean:105`, `AlgebraicGeometry/LineBundle/Basic.lean:131`. In particular, native Indecomposable excludes zero; Skeleton quotients by isomorphism; truncated Euler characteristic does not include a finiteness hypothesis. The nilpotent count is distinct from Mathlib `LinearAlgebra/Matrix/GeneralLinearGroup/Card.lean:120`'s count of units.

Also checked Mathlib's radical theorems at `RingTheory/Artinian/Ring.lean:54`, `RingTheory/Artinian/Module.lean:641`, finite-domain theorem at `RingTheory/LittleWedderburn.lean:176`, Young diagrams and transpose, and Tau Ceti's module local-endomorphism theorem at `RingTheory/KrullSchmidt/Indecomposable.lean:266`, direct-sum comparison at `RingTheory/KrullSchmidt/DirectSum.lean:154`, arms and legs at `Combinatorics/Young/HookLength/Basic.lean:136,140`. The finite-length hypothesis is supplied on Hom modules, not imposed on the coherent category. Only actual cells enter arm/leg products.

## Ownership, sources and consequences

Object searches used `roadmaps grep`, the supplied main tree, board packages and the supplied sibling checkouts. Searches of open roadmap signatures found no competing declaration with any of the five kept names. The generic chart and zero-level quotient are owned by EndoscopicTransferAndUnitaryTraceComparison §3.7; the local frame-vanishing condition is a new input to this roadmap's numerical-framing comparison, not a second chart construction. No other owner was found for the curve counting identities or their positivity corrections. NilpotentOrbits' adjoint nilpotent variety is a different object from this global Hitchin fibre.

The cross-roadmap sections consumed were checked: AlgebraicVectorBundles L0A–L2B; QuiverRepresentations Layers 1–2; ArtinAlgebras Layer 0; SchemeAndStackFoundations §§1.18–1.21, 2.18, 2.20, 3.3, 3.6–3.7, 4.1, 4.5, 4.14; AlgebraicModuliForArithmeticGeometry §§1.3, 4.19; EndoscopicTransferAndUnitaryTraceComparison §§3.6–3.7; AutomorphicSpectralTheory §§6.22c, 6.24; GlobalShtukasAndFunctionFieldLanglands §§0.1, 0.5–0.6, 0.13; FunctionFieldArithmetic §§0.2–0.3, 5.1–5.4; ClassicalGroupsPartII CG.0.4–CG.0.5, CG.2.4–CG.2.6; ReductiveGroupsPartII RG2.3.7; HabiroNahmSeries §5.1; HabiroCyclotomicCompletions §1.1; QSeriesPartitionsAndMockModularForms §§2.4, 3.5; ArithmeticStatisticsPartVIII §5.17; LefschetzPencilsAndVanishingCycles §5.11; DeligneWeightsAndPurity §§0.10, 0.12, 0.16–0.18, 1.7, 7.15, 8.8–8.11, 10.5; EtaleDualityAndPerverseSheaves §§0.4, 0.6–0.7; CompactSupport Layers 6–8; EllAdicRealization Layers 7–9; TraceFormula Layers 11–12; CohomologicalPointCounting's combined endpoint; ComplexComparisonPartII C6.3–C6.6. Contracts requesting extensions remain gaps, rather than claims that these suppliers already prove the extensions. Additional open work without provided files was checked only through the supplied index; its inaccessible contents were not independently audited.

All eight gap slugs still agree between README and plan. No new supplier or direction change was introduced. The existing fixed-source-good-lines gap now has a satisfiable all-field carrier contract; implementing that contract is still work for its named supplier and cannot be completed by editing this package. No supplier file or merge-order file was changed.

The source anchors used in the roadmap were reopened in the legal cached texts. Relevant corrections follow from S16 line 198 and S16 line 201 (positive class versus representative), S16 line 2512 and S16 line 2753 (generation versus frames), MS14 line 96 and MS14 line 427 (slope-zero attribution). S16 line 3045 through S16 line 3095 supports the BB route after the explicit reduction and degree-shift distinctions. HN10 Theorem 3.1 and GlobalShtukasAndFunctionFieldLanglands §0.5 require strictly decreasing HN slopes. ACK07 line 1088 retains its regularity hypotheses; it is not substituted for the frame-vanishing target. BTL12 line 876 restricts algebraic tensor closure to the chosen subalgebra. The earlier source corrections listed by both reviews are already reflected in the untouched targets and were not reversed.

STACKS is the only added source key. The sources service fetched its legal project PDF; Tags 04DZ and 03SI were read at STACKS line 3033 and STACKS line 3130. M20, FH58 and HES81 remain the settled uncertified locator-only citations; none was requested again. No additional missing text blocks this repair. Source text was not copied into the package.

No Lean name was added, deleted or renamed. Consumers of the prose geometry must distinguish Λ_sch from Λ and positive representatives from invariant classes; their point-count and cohomology formulas are unchanged. The §8.4 vanishing step is now an explicit theorem target, with no claim that the source supplies its missing proof. The immutable design catalogue and plan outside top-level gaps were left untouched as required. There was no commit, push or external write.

## Computed adversarial mathematics pass

Each row records concrete controls for a statement or definition and its associated API and conventions. These finite computations test meaning, signs, boundaries and consistency; they do not prove the general targets. Unless indicated otherwise, the curve is smooth projective geometrically connected over a finite field, q≥2. Nonfields, nonproper curves and arbitrary nonflat family base changes are outside those hypotheses. The nonreduced family examples below deliberately test the newly separated functors.

| Statement | Instances tried | Values on the two sides / wrong-model control | Result and change |
|---|---|---|---|
| Conventions: Euler form and Hall order | P¹, O and O(1) | χ(O,O(1))=2; χ(O(1),O)=0; quotient-left twists differ by q | Retained |
| Conventions: all-coefficient Adams | q=2, reciprocal pair (−1,−2) | P(1)=6; ψ₂(1−Σα+q)=1−1−4+4=0; ψ₂((q−1)⁻¹)=1/3, versus wrongly fixed values 6 and 1 | Retained |
| Conventions: geometric Frobenius | E:y²+y=x³ over F₂,F₄,F₆₄ | #E=3,9,81; α-sums 0,−4,−16 give 1+q−Σα=3,9,81 | Retained |
| Conventions: dimensions, twists and signs | Rank one, g=2; an affine line | D=2, coarse dim 4, stack dim 3, core dim 2; affine compact degree 2 and eigenvalue q, not q⁻¹ | Reduced core made explicit |
| 0.1 coefficient rings | g=0; g=1,q=2,a=3 | R₀=Q[q±1]; a+q/a=11/3 after either flip, but a changes 3→2/3; denominator at ψ₂ is 1/3 | Retained |
| 0.2 native degree | P¹ O(1), O(1)⊕O(−1); genus-two O² | 2−1=1; 2−2=0; −2−2(−1)=0 | Retained |
| 0.2 geometric predicate | O, O², zero | End(O_kbar)=kbar has only idempotents 0,1; O² has diag(1,0); zero fails nonzeroness | Retained |
| 0.2 native cardinality | P¹/F₃ ranks 0,1,2, d=−1 and 1 | Each degree gives counts 0,1,0; line class count 1 differs from mass 1/2 | Retained |
| 0.2 decorated coherent counts | P¹/F₂ torsion degree 1 and 2; degree-two closed support | Absolute torsion counts 3 and 3; nonrational simple support splits into 2 geometric summands and contributes 0 | Retained |
| 0.2 field extension of HN | O(2)⊕O(−1), torsion, zero | Slopes (2,−1) stay (2,−1); torsion has one slope +∞ before and after splitting; zero has 0 factors | Retained |
| 0.3 residues | h=1−z/u, u≠0; h⁻¹,h⁻²,1 | (rRes,dRes)=(1,−1),(0,−1),(0,0), because dz/z=−dh/(1−h) | Retained; excludes u=0 |
| 1.1 additive Hom transfer | M=O²,N=O on P¹; M=0 | End(M)=M₂(k); Hom(M,N)=k² with commutant k=End(N); zero maps to zero | Retained; opposite-ring action preserved |
| 1.2 decomposition | 0,O,O²; k[t]/t² over F₂ | Summand counts 0,1,2; residue k for O; M₂(k) not local; t²=0 and (1+t)²=1 | Retained |
| 1.3 radical blocks | N=k[t]/t², M=N² over F₂ | Radical dimensions 1 and 4; quotient M₂(F₂) has 16 elements; tI squares to 0 | Retained; 2-copy radical would have wrong dimension 2 |
| 1.4 nilpotent enumeration | n=0,1,2 over F₂; n=2 over F₃ | Counts 1,1,4,9 equal q^(n(n−1)); GL counts 1,1,6,48 | Retained; zero/unit matrices distinguished |
| 1.5 radical cancellation | Zero; line/F₃; O²/F₂; dual-number block/F₂ | Ratios 1,1/2,4/6,2/2 equal residue formulas 1,1/2,2/3,1 | Retained |
| 1.6 descent neutrality | G_m/F₃; dual-number units/F₂; constant C₂/F₃ | Neutral H² in all three cases; numbers of forms 1,1,2; rational unit counts 2,2,2 | Retained; disconnected uniqueness excluded |
| 1.7 Frobenius orbit | Orbit of size e=2 over extensions of degrees 1,2 | Fixed absolute classes 0,2; divisor sum 0,2; descended class is twice the summand class | Retained |
| 1.8 coprime residue | Class (2,1); local algebra k[t]/t² | Residue degree divides gcd(2,1)=1; c+bt has scalar c and nilpotent bt; End dimension 2 need not be 1 | Retained |
| 1.9 HN cutoff | Rank-one degrees −1,0,1; g=2,r=2,d=3 | Cutoff indicators 0,1,1; threshold 2 and 3>2; genus-one allowed HN gap 0 | Retained strict bound and genus-zero separation |
| 1.10 count normalizations | P¹ ranks 1,2 in degrees −1,0,1 | Counts 1,0 in each degree; dual and degree-one twist give 1=1 and 0=0 | Retained; no rational-point premise added |
| 2.1 homotopy-fibre Fubini | Id:BS₃→BS₃; S₃ acting on three letters; empty | Fibre mass 1 gives 1/6=1/6; action mass 3/6=1/2; empty mass 0 | Retained; nonabelian control |
| 2.2 nilpotent pairs | Zero; line/F₃; k[t]/t² | Masses 1,1/2,1; Id on the line has every positive power Id≠0; multiplication by t squares to 0 | Retained |
| 2.3 tower exponential | One absolute line species, q=2, multiplicities 0,1,2 | Euler coefficients 1,1,4/6 equal exp coefficients 1,1,1/2+1/6 | Retained |
| 2.4 Jordan class | θ=0; one size-two block; length-two torsion | α₁=[F]; r₂=1 gives weighted rank 2, not 1; torsion weighted degree 2 despite rank 0 | Retained |
| 2.5 flags and total cutoff | One step; repeated zero step; O(−1)⊂O(−1)⊕O(1) | One-step fibre 1; zero quotient forces equal steps; total degree 0 but minimum slope −1, so cutoff indicator 0 | Retained |
| 2.6 Jordan flag functors | Zero field; size-two block | Flags H₁=H and (H₁,H₂)=(0,H); nonnegative cutoff agrees for F and F/im θ in each case | Retained |
| 2.7 Jordan masses | One step; α₂=O; α₁=O,α₂=O(1) on P¹ | Exponents (d,d′,d″)=(0,0,0),(−1,−1,0),(−3,−3,0); q=2 masses 1,1/2,1/8 for π | Retained Euler order |
| 3.1 Hall operations | O,O on P¹/F₂; zero | Product coefficient 3v; Δ′ coefficient v/2; unit coefficient 1; v²=2 | Retained |
| 3.2 Green pairing | Same rank-two split bundle | (δ_Oδ_O | δ_(O²))=3v/6=v/2; tensor pairing of Δ′ gives v/2 | Retained automorphism denominator |
| 3.3 characteristics and torsion factor | r=2,l=1; negative torsion degree | Hall factor v² times v⁻²=1; negative-degree characteristic 0 | Retained |
| 3.4 flag mass | O⊂O² on P¹/F₂ | Three flags / six automorphisms =1/2; v⁻¹(v/2)=1/2 | Retained |
| 4.1 Eisenstein series | Rank 0 and rank-one degrees −1,0,1 | Bundle rank-zero series 1; torsion degree-one coefficient 1 on κ(x); line coefficients 1 in all three degrees | Retained; bilateral series distinguished |
| 4.2 Hecke shifts | r=0,1,2 at q=2 | Empty factor 1; arguments 2⁻¹ᐟ²z/w; z/(2w),z/w | Retained |
| 4.3 coproduct shifts | r=0; rank split (1,1),g=0 | E₀⊗E₀; prefactor q⁻¹ᐟ² and arguments q¹ᐟ²z,q⁻¹ᐟ²z | Retained |
| 4.4 Eisenstein residue | r=1; r=2,g=1 | Empty residue and V₁⁻¹V₁=1; chain rRes h⁻¹=1 versus dRes −1 | Retained |
| 4.5 HN relation | O(1)⊕O(−1) on P¹ | Euler 3, prefactor q⁻¹ᐟ², degree shifts q⁻¹; product q⁻¹ᐟ²q⁻¹q³ᐟ²=1 | Retained negative quotient on left |
| 4.6 spherical algebra | P¹/F₂, O², κ(x), O | Line-square value 3√2 versus rank-two characteristic 1; torsion generator values 1,0 on κ(x),O | Replaced membership-only Checks |
| 4.6 completion | O(m)⊕O(−m),m≥0 | Distinct HN maxima m=0,1,2,…; full class characteristic 1 on infinitely many objects | Added explicit support test |
| 4.7 spherical HN type | P¹ one-step (2,0); slopes 1,−1; alleged slopes 0,0 | Rational class counts 1,1,0; valid types m,−m for m>0 give infinitely many class-(2,0) bundles | Corrected equal slopes |
| 4.8 generic form | Rank-one masses, q=2,3 | P(1)/(q−1)=P(1),P(1)/2; one-step flag v cancels against v⁻¹ | Retained; generic descent remains a target |
| 4.9 universal counts and torsion | P¹/F₂, coefficients through z | N₀=1+3z; [T]N=1+4z; [Tz](N/N₀)=4−3=1 | Retained; zero-class mass 1 differs from full rank-zero series |
| 5.1 regional pairings | One line slot at w=0 and w=∞; zero bundle slot | V₁/(1−zw) has coefficients V₁ for d≥0; −V₁/(1−zw) has coefficients V₁ for d<0; zero slot contributes 1 | Retained expansion regions |
| 5.2 torsion separation | One rank-one slot on P¹/F₂ | zw coefficient #P¹(F₂)/(2(2−1))=3/2; missing total-rank shift gives 3 | Retained |
| 5.3 bilateral pairing | Ranks (1,2); one rank slot | Shifts q⁻¹ and q¹ᐟ²; one-slot degree coefficient V_r on each side | Retained order |
| 5.4 denominator clearing | (1−z)⁻¹ expanded at 0 and ∞ | Multiplication by 1−z gives 1 and 1; difference gives 0 | Retained; no product of unrestricted distributions |
| 5.5 rank-one shuffle | s=1; s=2 sign | Positive rational function V₁/(1−zw); negative −V₁/(1−zw), giving positive V₁ coefficients in its own region; (−1)²=1 | Retained |
| 5.6 block residues | Tuple (1); tuple (2),g=2 | No residue/prefactor 1; a(2)=−1/2 and chain z₂/z₁=q⁻¹; b(2)=0 | Retained |
| 5.7 generic Jordan weights | r₂=1 and deg α₂=1; empty rank tuple on P¹/F₂ | Underlying weight T²z², not Tz; rank-zero torsion coefficient is 3z, not 0 | Retained weighted size and torsion tails |
| 5.8 positive-arm product | λ=(1),(2),(1,1),(3) | Products 1,ζ(q⁻¹z),1,ζ(q⁻¹z)ζ(q⁻¹z²); arm lengths of (3) are 2,1,0 | Retained zero-arm exclusion |
| 5.9 kernels | Empty, one box; g=1,q=2,pair (−1,−2) | Empty JH=1; J_(1)=6,H_(1)=(1−z)⁻¹; normalized product 6/(1−z) | Retained J normalization |
| 5.9 weighted substitution | λ=(2) versus (1) | H_(2)=(1−z²)⁻¹ has z,z² coefficients 0,1; H_(1) has 1,1; poles ±1 versus 1 | Added discriminating Check |
| 5.10 Jordan partition identity | Empty and one box on P¹/F₂ | Torsion factor 1+3z; one-box bundle factor (1−z)⁻¹; raw rank-one z coefficient 1+3=4 | Retained |
| 6.1 generating identity | T⁰,T¹ after torsion cancellation | 1=1; coefficient P(1)/((q−1)(1−z)) on both sides; extra torsion would change constant z coefficient to 3 | Retained |
| 6.2 periodic extraction | r=2,b₀=2,b₁=3; characteristic 2 excluded | Residues at 1,−1: −5/2,1/2; negative Fourier sums give 2,3; in characteristic 2 denominator becomes (1−z)² | Retained nonzero r hypothesis |
| 6.3 universal residue | r=1 | A(z)=P(1)/(1−z); differential residue −P(1), negative extraction P(1) | Retained |
| 6.4 rank-two formula | Empty tuple at q=2; pair (−1,−2) | 1/3−1/12−1/4=0; P=6,U=15,V=0,S=5/6 gives 6(5−4)=6 | Retained apparent-pole cancellation |
| 6.5 regular origin | Rank one; q⁻¹; paired product | A(0)=1; q⁻¹ has a pole; α₁α₂ and q both give 0 | Retained distinction from Laurent evaluation |
| 6.6 origin partition formula | r=1,g=1,2; ranks 1–4 at g=2 and 3 | r=1 residue −1 gives 1; genus-two constants 1,2,6,22; genus-three 1,3,15,95 | Retained negative residue extraction |
| 7.1 positive exact category | O(−1)⊂O²→O(1) on P¹; line; L² | Positivity indicators 0,1,1; line stable, L² semistable but not stable; zero belongs to the exact subcategory | Retained; not an abelian full subcategory |
| 7.1 coherent derived Hom | T=k_x,zero field; elliptic (O,0)→(O,η) | T self-Ext dimensions 1,2,1 versus naive 1,1,0; Id maps to +η, giving an acyclic line-pair complex | Retained derived columns and differential sign |
| 7.2 natural preservation criterion | W=ke₁ in k²; matrices [[1,1],[0,2]], [[1,0],[1,2]] | Lower-left entries 0,1; preservation and image-factorization indicators true,false on both sides | Retained both directions |
| 7.3 coarse geometry and Hitchin weights | Rank one,g=2; rank-two scaling by t | Coarse/stack/core dimensions 4,3,2; trace scales t, determinant t² | Retained |
| 7.3 reduced versus scheme fibre | g=1,r=2,d=1,p=2 | charpoly(t−aI)=t²+a²; fibre equation a²=0 versus reduction a=0; both have dimension 1 and same field-valued points | Corrected geometric carrier |
| 7.3 Lagrangian interpretation | Same elliptic surface, local form du∧da | On k[u,a]/(a²), derivative of a² is 0 and du∧da survives; on a=0 it vanishes | Restricted assertion to reduction |
| 7.3 family nilpotence | Rank one over k[ε]/(ε²) | θ²=ε²=0, but charpoly=t−ε≠t; θ=0 satisfies both conditions | Corrected family API; nilpotence alone is insufficient |
| 7.3 reduction comparison | Spec k[a]/(a²)→Spec k | One field-valued point, one component, H⁰=Q_ℓ and higher geometric H^i=0 on both | Added precise invariance input |
| 7.4 imported chart comparison | g=2,r=2,d=1,d₁=5,d₂=24 | l₁=9; one-line kernel rank 9−2=7, degree −45−1=−46; changing frames leaves one sheaf class | Imported carrier, retained fixed-source comparison |
| 7.4 evaluation condition | deg L₁=−5, deg M=2 nonspecial, deg B=4 | F=L₁M⊕B has deg 1, h⁰(L₁⁻¹F)=1+8=9 and h¹=0; M has basepoints, so evaluation is not onto | Retained negative control for supplied-open identification |
| 7.5 tangent and zero-level compatibility | Line in genus g, N=l₁²+l₂² | Exact-sequence dimensions g,N+g−1,N,1 have alternating sum 0; zero-level fibre has dimension g=dim H⁰(Ω) | Imported zero-level quotient, retained natural-duality comparison |
| 7.6 moment map | Scalar one-arrow x=2,y=3; x=y=1 in characteristic 2; y=0 | Moments (6,−6),(1,1),(0,0); total traces 0,0,0 | Retained annihilator target and sign |
| 8.1 numerical frames | g=2,r=2,d=1; elliptic r=1,d=0 | (B,d₁,l₁,d₂,l₂,C)=(−3/2,5,9,24,47,423); elliptic (0,2,2,7,7,14) | Retained |
| 8.1 kernel generation | Same genus-two frame | μ_min(K)≥−16, so μ_min+24≥8>3; for source subspaces same lower bound −16 | Retained fixed source, not arbitrary source rank |
| 8.1 determinant cutoff | l₁=9,l₂=47; zero/full; l₁=1 | gcd(9,47)=1; determinants at (0,0),(9,47) are 0; proper nonzero determinants have absolute value ≤423; l₁=1 still gcd 1 | Retained exclusions and sufficient p bound |
| 8.2 King sign | Totals (2,3), pairs (1,1),(1,2); actual frame (9,47) | δ=−1,+1; degree-one subline vector (5,24) gives 216−235=−19 | Retained sign; full vector has δ=0 |
| 8.3 indecomposable moment fibre | Local End dimension h; χ=(1−g)r²; proper projector | Fibre size q^(h−χ); weight (q−1)q^(h−χ)/((q−1)q^(h−1))=q^(1−χ); projector has λ=−δ≠0 for p>C | Retained equivalence on framed sheaves |
| 8.4 generation versus frame bijection | g=2,r=2,d=1,F=L₁⊕B,deg B=6 | l₁=9 but h⁰=1+10=11 and h¹=2; first frame 9→11 can be injective | Added explicit frame-vanishing target |
| 8.4 unstable intermediate point | Same F at zero cotangent | B-pair dimensions 8,29; δ=9·29−47·8=−115 | Negative control is unstable; no arbitrary-lift assertion added |
| 8.4 vanishing is sufficient for bijectivity | Elliptic F=O,deg L₁=−2 | h⁰=2,h¹=0; an injective 2→2 frame has cokernel 0 | Positive control |
| 8.4 vanishing is insufficient for generation | §7.4 genus-two M example | h⁰=9,h¹=0 but evaluation cokernel nonzero | Separate generation conclusion retained |
| 8.4 small-characteristic semistability | Elliptic/F₂,r=1,d=0 | One-dimensional U₁ generates 5 dimensions: opposite sign weight 7−2·5=−3; full U₁ generates 7; p=2≤14 | Retained all-characteristic statement |
| 8.4 effective submersion | Two-arrow (dim V₁,dim V₂)=(1,2) over F₃ | Moment (2,−I₂); ambient differential rank 4, central restriction image dimension 1; full g* dimension 5 | Retained effective dual, not full dual |
| 8.5 slope versus King stability | g=2,r=2,d=1; sublines of degrees 1 and 0 | Slopes exceed/below 1/2; section determinants −19 and +19, respectively | Retained both directions with tight-pair target |
| 8.6 central family | Rank one,g=2; t≠0 | Every fibre has q²P(1) points; rescaling by t then t⁻¹ multiplies cotangent coordinate by 1 | Retained central restriction before quotient |
| 8.7 BB counting | Y=A¹×A² over F₃ | #Y=27=3·9; #Y₀=#Y₁=9; ranks 3,2 | Retained smooth-family formula |
| 8.7 opposite strata | Characteristic-two elliptic Higgs surface | Reduced core Pic¹ has opposite affine rank 0; thickened fibre has extra square-zero a, not an affine rank-zero bundle | Opposite theorem uses reduced core |
| 8.8 large-characteristic count | Rank one,g=2; P¹ ranks 1,2 | q²P(1)=q^D A; 1=1; 0=0 | Retained p>C for this route |
| 8.9 I_K^+ definition | q=2,r=1,g=1 with P(1)=3; g=2 | I^+=6 and 2P(1); reversed genus-two factor gives 8P(1) | Added in-scope normalization tests |
| 8.9 rank-two I_K^+ | E/F₂,degree 0 | Distinct rational lines: 3·4=12; doubled lines: 3·16/6=8; self-extensions: 3·4/2=6; degree-two orbits: 3·4/3=4; total 30 | Added nontrivial mass test |
| 8.9 Ω_K^+ definition | Same E, ranks 1,2,degree 0 | Rank-one Ω^+=6; rank-two remainder 30−18−6=6; Adams term is (4·9/3)/2=6 | Added Adams/logarithm control |
| 8.9 untruncated Ω_K | Same E; rank one d=−1; genus-two rank one d≥0 | Ω=6 in elliptic ranks 1,2 at degree 0; Ω(1,−1)=6 while positive-series coefficient is 0; genus-two Ω=2P(1) | Added separation of definitions |
| 8.9 strict-slope integration | μ(E)<μ(F); E=F=(O,0) | Ext² dimensions 0 and 1; only slope-zero factor survives z⁰ extraction from d≥0 product | Restricted source attribution and proved zero-slope comparison |
| 8.10 all-characteristic count | E/F₂,F₄; rank one and coprime rank two | A=3,9; qA=6,36; stable masses 6,12; multiplying by q−1 gives 6,36 | Retained q, not characteristic p |
| 9.1 BB shifts and purity | Rank one,g=2; g=1,r=2,d=1,p=2 | (m,b,D)=(2,0,2),(1,0,1); compact shifts 4 and 2; reduced and scheme-core cohomology both H^n(Pic) | Propagated reduction |
| 9.2 positive invariant class | Rank one,g=1 | (1+α₁)(1+α₂)=1+α₁+α₂+q; diagonal leading coefficient 1 in degree 2 | Retained grouping of specialized monomials |
| 9.2 invariant-representative obstruction | g=2,r=2,d=1 | D=5; top degree 10; 10=4e has no integer solution; average of the two top monomials has coefficients 1/2 | Corrected free-ring invariance |
| 9.2 equality of cone representatives | α₁⁵α₂⁵ and α₃⁵α₄⁵ | Both equal q⁵ and both diagonals are t¹⁰; their polynomial difference is nonzero before the relations | Independence asserted for class only |
| 9.3 compact Poincaré polynomial | Rank one,g=1,2; point versus two points | Signed t²(1−t)²,t⁴(1−t)⁴; top degrees 4,8; compact ranks 1,2,1 for elliptic space; H⁰ ranks 1 versus 2 for the finite schemes | Retained chosen lisse-open comparison |
| 9.4 reciprocal trace and components | Rank one,g=2; two exchanged components; elliptic rank two,p=2 | q²∏(1−α⁻¹)=P(1), top degree 4, dimension 1; exchanged representation dimension 2,trace 0; elliptic thick/reduced counts both 3 | Propagated reduction; no trace-to-dimension inference |
| 10.1 Mellit kernel | q=2,g=1,a=−1 and a=−2 | H₁=3(z+1),2(z+2); values at z=1 are 6,6, at z=0 are 3,4; Ω(T=0)=1,H(T=0)=0 | Added distinct full-kernel controls |
| 10.1 actual versus formal tuple | E/F₂ | Actual α-sum 0 gives H₁(1)=3; formal pair sum −3 gives 6 | Added curve-specialization control |
| 10.2 regular deformation | Empty partition; constant regular sequence | f_empty=1; f_(n+1)(1,x)=1=f_n(qx); u⁰ coefficient 1 | Retained; only elementary controls for locator-only theorem |
| 10.3 Laurent integrality | One-box H₁; 1/(1+z) | H₁ Laurent polynomial, value 6 at 1 for formal pair; rational control value 1/2 at 1 but pole at −1 | Retained distinction between local and global regularity |
| 10.4 degree independence | P¹ ranks 0,1,2; genus-one all positive ranks; periodic control | Counts 0,1,0 at every degree; genus-one P(1); (2+3z)/(1−z²) has eventual coefficients 2,3 and pole −1 | Retained global pole-removal input |
| 10.5 positivity in every degree | g=2,r=2,d=0,1 | Equal universal classes; both origin values 2; top q⁵ and diagonal t¹⁰; invariant-free-ring obstruction remains 10≠4e | Transferred class positivity, not invariant representative |
| 11.1 parabolic objects | No marks; rank one; three versus two flags on O² | No marks recover A; each rank-one flag count 1; three-flag End=kbar versus two-flag End=kbar×kbar with projector (1,0) | Added flagged indecomposability test |
| 11.2 parabolic universality | Rank one; two-step mark on P¹; q=2,1 | Universal rank-one value P(1); opposite flag Euler forms 0,1 with Hom dimensions 0,1; (q−1)⁻¹=1 at 2 and pole at 1 | Retained localized conclusion |
| 11.3 exact HN versus splitting | g=2,r=2,d=1,extension of O by O(P) | h⁰(O(P))=h¹(O(P))=1; nonzero extension stays nonzero over kbar; exact slopes 1,0; split/non-split absolute indicators 0,1 | Added computed extension |
| 11.3 slope-cut definition | Rank one,d=−1,0 at ν=0; above nonsplit bundle at ν=1/2 | Counts 0,P(1); μ_min=0<1/2 so indicator 0 despite average 1/2 | Replaced generic-law Checks |
| 11.4 slope universality | ν=0,rank one,d=−1,0 and dual degrees 1,0 | Lower counts 0,P(1); dual upper counts 0,P(1) | Retained K_g scope |
| 11.5 Euler Hall and primitives | P¹_C,torsion degree-one versus line | Products on O(d+1): χ(P¹)=2 versus 0; commutator 2; primitive torsion direct-sum value 1+0=1 | Added Hall-order witness |
| 11.5 tensor closure and primitive unit | Scalar c; infinite diagonal on a positive-dimensional parameter space | Primitive equation forces c=2c, so c=0; n distinct diagonal evaluations form an n×n identity matrix of rank n, excluding uniformly finite tensor rank | Retained algebraic tensor closure as a theorem for the spherical subalgebra |
| 11.6 conjectural interfaces | Rank-one root multiplicity; length-one flags; q⁻¹ control | Proposed multiplicity 1 equals origin 1; flag count P(1); q⁻¹ has no finite origin value | Conjectures only; positive class formulation propagated |
| Worked examples | Rank one,g=2; genus-two frame; origin constants | #H=q²P(1); P_c=t⁴(1−t)⁴; reciprocal q²∏(1−α⁻¹)=P(1); frame weight −19; constants 1,2,6,22 | Recomputed with unchanged signs, shifts and count formulas |

The changed definitions have both satisfying and failing models: invariant cone classes versus free-ring invariants; vanishing characteristic coefficients versus merely nilpotent families; surjective evaluations versus isomorphic Hom frames; absolutely indecomposable flagged objects versus decomposable underlying bundles. Their distinctions appear as actual values above. No denominator was evaluated at q=1, u=0, or a vanishing residue denominator in a target claiming that evaluation exists.

| Supplier contract / convention | Computed boundary control | Audit result |
|---|---|---|
| Coherent Serre duality, smooth curve restriction | At smooth k[t], Ext¹(k,k) and Hom(k,k) dimensions 1,1; at a nodal cubic node, 2,1 | Smoothness retained; gap:coherent-ext-serre-duality unchanged |
| Strong generation | On P¹, h¹(O(−1))=0 but h⁰(O(−1))=0 and evaluation is zero; degree-two elliptic line has h¹=0 and two generating sections | Both vanishing and evaluation required; gap:degree-only-strong-generation unchanged |
| Fixed-source chart adapter | r=2,p=2 gives p dividing r!=2; §3.6 unavailable, §3.7 carrier available | Existing gap corrected, no characteristic excluded from this roadmap |
| Character quotient versus finite-inertia quotient | Stable scalar stabilizer has dimension 1; effective stabilizer dimension 0 | gap:reductive-character-git retained |
| Complete Adams calculus | log(1+T) second coefficient −1/2, Exp(T) second coefficient 1; ψ₂((q−1)⁻¹) at q=2 gives 1/3 | gap:complete-adams-series retained; ordinary log not substituted |
| Macdonald admissibility | H₁(z)=3z+3 has integral coefficients; 1/(1+z) has denominator and pole −1 | gap:macdonald-admissibility retained; local regularity insufficient |
| Density and radial multiplier | Normalized multiplier 1; raw multiplier q₀^m; q−q₀ vanishes at fixed q₀ but not all q₀^m | gap:universal-curve-weil-density retains radial coordinate and auxiliary ℓ≥5 |
| Affine bundle compact shift | A¹ has only H_c²=Q_ℓ(−1), trace q; G_m has alternating compact trace q−1 | gap:affine-bundle-compact-shift retains degree 2a and twist −a |
