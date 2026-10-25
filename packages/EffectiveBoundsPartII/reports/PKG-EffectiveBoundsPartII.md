# PKG-EffectiveBoundsPartII

The package expands the accepted design into `packages/EffectiveBoundsPartII/README.md`, `Suggested.lean`, `metadata.toml` and `sources.toml`. It retains all 26 arithmetic targets, all 51 original API facts, all 34 original Checks, and the four worked examples. The README has six layers, 26 numbered target subsections, ten API lists and 98 individual Checks. Five small definitions support four admitted headline theorems; there are no admitted data, extra imports, options or API-padding declarations.

The separate `packages/EffectiveBoundsPartII/design/review.json` and pre-existing report files were absent. The accepted review embedded in `design/plan.json`, including all 26 node verdicts and the essentially-finite-type note, was read and checked against the sources and pins. The design README was also read in full. No outside text was treated as an instruction; no suspicious instruction passage was encountered. No helper agents were used.

The upstream shape was checked against main’s `Completed/EffectiveBounds/README.md`, `TauCetiRoadmap/PolynomialGaloisGroups/README.md` and `TauCetiRoadmap/SchemeAndStackFoundations/README.md`. Metadata follows `Completed/EffectiveBounds/metadata.toml`: `topic = "math.NT"`.

## Headline theorems selected before Suggested.lean

| Headline | Acceptance status |
| --- | --- |
| δ²-short integral rational basis, Couveignes Proposition 1 | Stated: `TauCetiRoadmap.EffectiveBoundsPartII.exists_short_integral_basis`. Its basis is over ℚ, with integral values; it is not claimed to be a maximal-order basis. |
| Bounded arithmetic parameters with all conjugate first jets onto | Stated: `TauCetiRoadmap.EffectiveBoundsPartII.exists_bounded_first_jet_generators`. Includes the short basis, integer parameters, their inclusive box, the actual conjugate map and its house bound. |
| Explicit small field-component models, Couveignes Proposition 2 | Stated: `TauCetiRoadmap.EffectiveBoundsPartII.exists_explicit_small_model`. Its predicate includes the actual native quotient/localization, étaleness and the compatible surjection to the given field. |
| Logarithmic small models, Couveignes Theorem 1 | Stated: `TauCetiRoadmap.EffectiveBoundsPartII.exists_logarithmic_small_models`. One Q precedes all fields; r depends only on their degree. |
| Coefficient-box / field-component bound for unweighted ℚ-isomorphism classes | Not statable at the pins without redeclaring a supplier-owned carrier: ArithmeticStatisticsPartI’s finite-dimensional embedded-field isomorphism quotient with its discriminant height and degree is not exported by Mathlib or Tau Ceti. Named with this reason in the module docstring. |
| Cubic-logarithmic discriminant exponent, Couveignes Theorem 2 | Not statable at the pins for the same missing class carrier and invariants. The module docstring names it; no count of embedded fields or ad hoc class quotient is substituted. |

The native model predicate is an algebraic statement of the complete component conclusion, not a weaker surrogate: an étale algebra over ℚ is a finite product of finite separable fields, and its actual surjection to K, compatible with polynomial evaluation, is a projection onto a K factor after identifying that factor with K. The associated Spec map is therefore the specified open and closed irreducible component. Its source is determined by the same equations and Jacobian as the arithmetic point. No heavy scheme construction is encoded as data.

## Corrections and supplier resolution

1. Updated every library check to the repository pins: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The design’s baseline hashes are older; the read-only baseline was not edited.
2. Replaced obsolete atlas ids by resolved sections of the actual owner READMEs. GeometryOfNumbersAndQuadraticArithmetic §§1.1.3–1.1.5 now explicitly give the requested cube and intrinsic-ball estimate; no supplier gap is needed for it.
3. Resolved the design’s ArithmeticStatistics ST.0 family to ArithmeticStatisticsPartI, Layer 0, “Number fields ordered by discriminant”. The original unsplit folder is absent on main and in the open-roadmap index; the split Part I contains the exact family and isomorphism quotient. Its native quotient is not yet in the pinned libraries.
4. Corrected the Jacobian supplier description. SchemeAndStackFoundations §0.10 supplies an étale finitely presented algebra over a general ring. It does not supply unconditional finiteness there. Over ℚ the pinned `Algebra.Etale.iff_exists_algEquiv_prod` gives the finite separable field factors, including the empty product. The formally étale companion has the essentially-finite-type hypothesis noted by the embedded review; the actual presentation satisfies it. The arithmetic component map is constructed by the actual evaluation and localization universal property.
5. Registered `gap:isolated-affine-bezout` under SchemeAndStackFoundations §5.12. Main states the general two-subscheme degree inequality, but does not explicitly export the arbitrary-r affine system, sum of isolated local intersection multiplicities and simple-Jacobian-point consequence needed here. This is a supplier interface, not new intersection theory. Only `design/plan.json`’s top-level `gaps` value changed; a structural comparison with the original verified all other values identical.
6. Stated the relation kernel and transpose/Gram constructions for all r,d≥0 and integral tuples, with full rational value rank for the dimension/index conclusions. Their general statements do not need d≥5 or the first-jet dimension inequality; those hypotheses belong to the arithmetic application. Saturation only needs the torsion-free target. This exposes the generality of the accepted proof steps without adding a second proof route or target.
7. Made the scalar in saturation explicitly a nonzero integer, and imported native additive-kernel saturation. “Integral” alone could be misread as an arbitrary algebraic integer acting on the coefficient lattice.
8. Clarified that κ generates K, while the selected equations vanish at κ. The design’s shared pronoun after the equation tuple made the generation clause ambiguous.
9. Distinguished nonzero from invertible Jacobian values outside fields: in ℚ[ε]/(ε²), 2ε≠0 but (2ε)²=0, so it cannot be inverted in a field-valued evaluation. The number-field theorem explicitly has a field target. Integer evaluated derivatives are defined before rational coefficient extension; no ℚ-to-positive-characteristic map is asserted.
10. Added the conjugate-first Mathlib Gram convention: VV* is the transpose of the native row Gram matrix. Its determinant and diagonal bounds agree, while the off-diagonal entries for rows 1,i have opposite signs. Retained the absolute discriminant denominator and the actual integral basis throughout.
11. Corrected an initially proposed negative-control explanation: for d=0,n>1 natural subtraction gives 1−n=0, so it cannot by itself exhibit a false rank. The discriminating example is κ=0 in a quadratic field at d=2: actual kernel rank 2 versus M−n=1. The original degree-zero Check remains and now states what it really detects.
12. Replaced the proposed identifier catalogue by prose API facts and Checks. Every backticked own declaration in the README is one of the nine declarations actually present in Suggested.lean; no declaration was added to satisfy an API-name quota.

No accepted arithmetic target or worked example was dropped. The README could not support the design’s old claims that the GN ball interface was absent, that the unsplit ArithmeticStatistics name was still the family’s location, or that the generic SF Jacobian supplier by itself provided the full finite-product/component interface. Those claims were repaired as above. It makes no explicit numerical claim about Q and does not import the stronger numerical variant from the sibling compact-model design.

## Ownership and duplication sweep

The main checkout was verified at `b41e47bc34e30def0db01d84cc92062ed72c6e68`; each library checkout was verified at the exact manifest hash above. The roadmap tools searched main and the index of 352 open roadmap heads. GenericDoublePointInterpolation was read at `d1d487c`, GeometryOfNumbersAndQuadraticArithmetic at `465728d`, and ArithmeticStatisticsPartI at `3b1a24f`. SchemeAndStackFoundations was consumed from main, not its open revision. Searches covered the mathematical objects, coefficient slots, map kernels and targets, metric conventions, matrix products, field factors and quantifier patterns, in addition to declaration spellings. The board’s package designs and README/Lean files were searched as well.

The sweep found the same arithmetic route under `packages/EffectiveBoundsCompactModels/design/`. The accepted EffectiveBoundsPartII design explicitly identifies that earlier route name with this Part II’s arithmetic scope. The sibling design is not an additional supplier, and its explicit Q=65536 and real-H variant were not imported. This package owns the accepted 26-node arithmetic route named in this job. The new SuccessiveMinima roadmap overlaps the generic GN supplier, and ComputationalNumberTheory / ClassicalArithmeticCompletion use class-group relation lattices; neither object is claimed here. No declaration in Suggested.lean takes a fully qualified name from any readable roadmap. Ownership against the available open roadmap heads was checked; no unseen heads were sought independently.

| Object swept | Owner or retained distinction |
| --- | --- |
| Signed/root discriminants, house and product-volume mixed lattice | Native Mathlib, named in the contracts; only the weighted measure comparison is new. |
| Fixed-ambient Hermite count and primitive generators | Completed/EffectiveBounds Layer 2 and its Tau Ceti modules; no re-proof or replacement count. |
| Bounded polynomial carrier, support basis, coefficients, evaluation, derivatives | Mathlib; GenericDoublePointInterpolation §§0.1,0.3 supplies adapters and metric. |
| Generic first jets, derivative on value kernel, generic affine rank and minor | GenericDoublePointInterpolation §§1.3–1.4,5.1–5.3; retained arithmetic embedding substitution is different. |
| Gram–Hadamard, intrinsic Gram covolume, relative-index covolume | GN §0.1.2, Tau Ceti’s intrinsic Gram theorem, Mathlib’s index formula; retained arithmetic matrix identity includes abs(disc K). |
| Primitive orthogonal saturation and equal complementary covolumes | GN §§0.2–0.3; retained arithmetic transpose image includes its positive index q. |
| Second Minkowski and simultaneous witnesses | GN §§1.2.7,1.5.21; two arithmetic applications only. |
| Ordered-product root bound and intrinsic ball/cube estimate | GN §§1.1.2–1.1.5; no local scalar or convex-geometry theorem is planned. |
| Additive kernel saturation | Mathlib `AddSubmonoid.ker_saturated`; retained relation lattice is its arithmetic specialization. |
| Product span of a greater-than-half-dimensional field subspace | No same-object owner found; retained arithmetic proof works for arbitrary finite field extensions, including inseparable ones. |
| Relation lattice | New bounded integral evaluation kernel; not a class-group presentation kernel. |
| Generic Jacobian algebra and field-base classification | SF §0.10 and pinned Mathlib; only the integer-over-ℚ alias and compatible arithmetic map are here. |
| Isolated-point Bézout | SF §5.12; exact affine multiplicity consequence is the registered gap. |
| Central binomial and Catalan carriers/recurrences/lower bound | Native Mathlib; only their least admissible arithmetic index and its estimates are here. |
| Bounded ordered square integer equation systems | No identical multivariate ordered-system box found. Tau Ceti’s parent univariate primitive-polynomial count is a different object. |
| Number-field isomorphism classes, discriminant height and degree | ArithmeticStatisticsPartI, Layer 0; no duplicate carrier in Suggested.lean. |
| Explicit and logarithmic field-component models and degree-sensitive count | This accepted Part II; no distinct main/open roadmap owner found. |

The following local obligations were deleted in favor of named imports (no accepted arithmetic target was deleted):

- A new definition of the bounded polynomial space, its support basis and total-degree membership.
- Generic coefficient-coordinate and Euclidean-metric construction, and the bounded monomial count.
- Generic value/first-jet/derivative-on-kernel maps and their product-surjectivity equivalence.
- Generic affine full-rank interpolation, universal selected minor and its degree bound.
- A new finite-grid vanishing or integer-parameter-pullback theorem; the actual complex pullback uses the pinned domain grid theorem directly.
- Generic Gram–Hadamard, Gram determinant as squared covolume, and relative-index covolume theory.
- Generic primitive orthogonal covolume and intersection-lattice theory.
- Generic simultaneous successive minima, second Minkowski, ordered-product roots and intrinsic-ball geometry.
- A generic proof of torsion-free kernel saturation.
- New central-binomial and Catalan definitions, their consecutive recurrence and exponential lower estimate.
- Generic Jacobian étaleness, generic finite-étale field decomposition, and intersection/Bézout theory.
- A new field-isomorphism quotient, its discriminant/degree invariants and generic Hermite finiteness.

No notion was moved down from a later roadmap. The only merge-order adjustment reported below places this roadmap after the resolved family supplier. All downstream uses in the README are exports, with no upward supplier edge.

## Source receipt

`sources.toml` has one lifetime key, COU20, for the published paper and its arXiv counterpart. The sources service fetched the publisher’s open PDF, with status `certified`, licence class `publisher-open` and SHA-256 `8d63bd3a14f0d61f421695f1d93559d18fb674240c6dee872c23bf5902e1a104`. This equals the accepted design’s source hash. The published pagination, rather than remembered preprint numbering, was used. The entire text was read through the service’s line-numbered extraction; no source text or passage was copied into the package or report. There are no unresolved references. The initial host-classification refusal was resolved by explicitly classifying the publisher-open copy before fetching it.

| Use | Resolved locator |
| --- | --- |
| Model/count endpoints and interpretation | COU20 line 20, Theorem 1, p.487; line 35, Theorem 2, p.488 |
| Canonical metric, measure and house body | COU20 line 104, §2, p.489 |
| Integral-basis discriminant, minima and product span | COU20 lines 127,140,150, §2, p.490 |
| Short integers | COU20 line 161, Proposition 1, p.490 |
| Generic-rank arithmetic specialization and bounded parameters | COU20 lines 169,207,242, §3, pp.491–492; inclusive generic endpoint supplied by GI §5.3 |
| Rational value surjectivity | COU20 line 249, §3, p.492 |
| Coefficient metric, relation kernel, transpose and discriminant denominator | COU20 lines 255,269,278–290, §3, p.493 |
| Value height, Gram diagonal and lattice covolume bounds | COU20 lines 291,303,309, §3, pp.493–494 |
| Second Minkowski, truncation and all derivative blocks | COU20 lines 323,330,342,343,349, §3, p.494 |
| Explicit model | COU20 line 354, Proposition 2, p.495 |
| Central-binomial parameters | COU20 line 385, equation (1), p.495 |
| Logarithmic heights, coefficient counting and isolated points | COU20 lines 420,425, §4, p.496 |

The generic GN/GI/SF proofs are supplied by the exact named roadmap sections. This report does not claim an independent read of Siegel, Martinet or Fulton, nor cite those works as independently verified sources here.

## Adversarial mathematics pass

The rows below are mathematical computations, not a claim that a `sorry` build proves truth. “Retained” means the computed instance satisfies the stated hypothesis and result; “excluded” gives a concrete wrong model. Each API and each README Check has its own row. Instances outside the model range test the actual defining expression or conditional rank assertion rather than invoking the full existence theorem. Source/statement labels refer to the numbered sections of `packages/EffectiveBoundsPartII/README.md`.

### Main statements, definitions and conventions

| Statement | Instances tried | Computed values on the two sides | Result | Change |
| --- | --- | --- | --- | --- |
| Standing field/degree/discriminant | ℚ; ℚ(i); zero ring | (n,disc,δ)=(1,1,1),(2,−4,2); zero ring has 1=0 | Number-field n>0 and abs(disc)≥1; zero ring excluded | Explicit positive denominators |
| Canonical versus house and coefficient norms | z=1; X²−2 at √2 | house 1 versus g-norm √2; coefficient norm √5 versus evaluated value 0 | Three distinct objects | Witness repeated in relevant layers |
| Intrinsic zero-rank volume | L=0 inside its zero span, versus ambient ℝ² | intrinsic covolume 1; ambient area 0 | Ambient replacement excluded | Intrinsic span specified |
| Matrix convention | rows 1,i | VV*=[[1,−i],[i,1]], native Gram=[[1,i],[−i,1]], both det=0 and diagonal (1,1) | Transpose, not entrywise equality | Added conjugate-first adapter |
| Ordinary class count | nonnormal cubic; Galois quadratic; S₃ normal closure of X³−2 | cubic embedded/class=3/1; quadratic=1/1; normal closure n=6,#Aut=6 gives weight 1 | No automorphism weight in Nₙ(H) | Exact carrier resolved |
| §0.1 weighted measure | ℚ; ℚ(i) | body volumes 2=2¹ and 2π=2⁰(2π)¹; scaling 1 and 2 | Retained | Separate g and house |
| §0.2 canonical discriminant covolume | β=(1,i) | Gram diag(2,2), det=4=abs(−4); covolume 2=√4 | Retained | Genuine integral β required |
| §0.3 more than half short | n=1,4,5 | m=1,3,3; tail exponents 1/2,1,5/6; 2m−n=1,2,1 | All first m houses≤δ | Exact floor(n/2)+1 |
| §0.4 product span | V=K, n=1; V=ℚ in quadratic; V=k³×0 in k⁴; inseparable quadratic | ranks 1=1; 1<2 at equality 2dim V=n; 3<4 despite 6>4; products 1,t span dimension 2 in characteristic 2 | Strict inequality and field necessary; separability unnecessary | Added general controls |
| §0.5 short integral rational basis | ℚ(i); ℚ(√5) | houses (1,1)≤(4,4); (1,√5)≤(5,5), integral index 2 | House bound does not imply integral basis | Basis interpretation explicit |
| §1.1 arithmetic parameters | α=(1),u=3; α=(1,√5); α=(1,1) | κ=3; det embedding matrix=±2√5≠0 with integral index 2; repeated-column det=0 | Rational basis suffices and is necessary for equivalence | No integral inverse claim |
| §1.2 bounded first jets | ℚ,r=1,d=5; seven collinear plane points | M=6≥2,D=10, minor 1 at u=0; collinear rank 11<21 | Actual selected minor required | Complex grid with D+1 values |
| §1.3 value descent | κ=√5; κ=0 in quadratic field | rational rank 2 and integral index 2; rank 1<2 for zero tuple | Rational and integral surjectivity differ | Actual tuple/rank hypothesis |
| §2.1 relation kernel | κ=√2,d=3; κ=0,n=2,d=2; d=0 | rank 2=4−2; actual rank 2≠3−2; degree-zero rank 0 and natural 1−2=0 | Full value rank necessary | Corrected subtraction control |
| §2.2 transpose index | √5,d=2; z↦2z | q=2, covol(S)=2√26 versus covol(L⊥)=√26; 2 versus 1 on ℤ | Correct index direction | No q=1 assumption |
| §2.3 Gram/discriminant | √5,d=2; i,d=1 | det(BBᵗ)=104=520/5; 1=4/4, whereas det(VVᵗ)=−4 | Both absolute discriminant and conjugation necessary | Native transpose adapter |
| §2.4 monomial/Gram heights | r=2,d=2,C₀=1; κ=0 | M=6,H₀=1,G=6; constant monomial value 1, not 0 | Total degree and C₀≥1 necessary | Constant term retained |
| §2.5 relation covolume | √5,d=2; ℚ,κ=0,d=2 | √26≤√(520/5)=2√26; covolume 1=√1/√1 | Retained | Discriminant denominator retained |
| §3.1 short relation witnesses | X²−2; rational coefficient 1/2 | norm √5≥1; norm 1/2<1 for excluded rational lattice; two-dimensional ball lower volume 2≤π | Integer lattice and intrinsic measure necessary | Ball supplier resolved |
| §3.2 truncation | n=2,ℓ=4,G=4,norms (1,2,4,8) | product 64=4²·4; k=3,codim=1; max kept 4≤4√4=8 | Retained | Discard exactly n−1 |
| §3.3 joint gradient map | points 0,1, polynomials X(X−1),X²(X−1) | derivative matrix [[−1,0],[1,1]], det=−1; degree-zero derivative rank 0 | Jets, not just values, required | Full kernel specified |
| §3.4 one full block | diagonal in ℂ²; zero subspace | codim 1 with ranks (1,1); codim 2 with ranks (0,0) | Strict codim<n necessary | Independent block functionals |
| §3.5 common arithmetic minor | X²−2; X³−2 | derivative values ±2√2; norm of 3κ² is 108 | One selected integer minor works at every embedding | No normality hypothesis |
| §4.1 Jacobian polynomial | (X,Y) and swapped equations | determinants 1 and −1; quadratic derivative at 3 is 6 | Sign and source/target fixed | No value-for-derivative substitution |
| §4.1 arithmetic localization | X²−2; X²; dual numbers | inverse Jacobian √2/4; nilpotent inversion gives zero algebra; 2ε≠0 but (2ε)²=0 | Field nonzero / ring unit distinguished | Added nilpotent control |
| §4.2 bounded model predicate | ℚ,E=X,κ=0; whole zero locus X(X−1),XY | map is identity ℚ→ℚ,J=1; full locus has line plus point but open algebra ℚ | Actual compatible map determines component | Full native predicate stated |
| §4.2 explicit bound | n=1,r=1,d=5,δ=1; n=0; δ doubled | B=5^(5/2)√6·10⁵>1; n=0 gives 0; B(δ=2)/B(δ=1)=1024 | Junk n=0 excluded by number-field degree | Explicit positive range |
| §5.1 least binomial rank | n=0,1,2,14,15 | r=1,1,2,4,5; M=2,2,6,70,252; n=0 violates M≤0 | Definition total; theorem assumes n≥1 | Native Catalan supply |
| §5.2 logarithmic models | n=1; r(15)=5; δ=1 | 1>Q log 1=0; M=252≤4·15·6=360; log height=Q(log n)² | Eventual, uniform degree range | Same r(n) for all K |
| §5.3 coefficient box definition | r=0; d=0; C=0; r=d=2 | slots 0; r; unique zero tuple; 12 versus wrong 18 slots | All three boundaries distinguish the carrier | Ordered native tuples |
| §5.4 coefficient-box cardinality | r=1,d=2,C=1; B=3.7; r=0 | 27=3³; floor interval has 7 not 9 values; empty product 1 | Exact equality and floor iff in both directions | No ceiling substitution |
| §5.5 systems to classes | (X²−2)(X²−3); X(X−1); X² | geometric/factor/class counts 4/2/2; 2/2/1; 0/0/0 | Surjection from pairs, not injection from fields | All field factors counted |
| §5.6 final discriminant exponent | H=1,n>1; degree-one boundary | Nₙ(1)=0 and RHS=n^(Qn(log n)³)≥1; log H=0; r(1)=1>0 | No division by log H; threshold retained | Uniform quantifier order |
| Worked index example | √5,d=2 | det [[27,−2],[−2,4]]=104; det [[31,21],[21,31]]=520; 520/5=104=4·26 | Agrees with every Layer-2 identity | Expanded exact values |
| Worked gradient example | n=2,ℓ=4,k=3; cubic | codim 1<2; derivative norm 108≠0 | Agrees with Layer 3 | No Galois-action shortcut |
| Worked several-class model | two quadratics; split rational polynomial | factor degrees 2+2=4; 1+1=2; class images 2 and 1 | Agrees with §5.5 | Multiplicity accounted for |
| Worked uniform count | r=2,d=2,C=1; H=1 | 3¹²=531441; log H=0; extra factor r^r=4 | Coefficient slots and extra factor agree | Same parameters across classes |
| Supplier Haar normalization | L=2ℤ, body [−3,3]; twice measure | (2/3)·6=2·2=4; after scaling, (2/3)·12=2·4=8 | Both sides scale together | Explicit μ in contract |
| Supplier self-dual primitive intersections | diagonal and antidiagonal of ℤ² | √2=√2; nonprimitive generator gives 2√2≠√2 | Self-duality and primitivity essential | Imported GN contract |
| Supplier intrinsic ball | ℓ=1,2,4 | lower volumes 2,2,1; vertex squared norms 1,1,1; line’s ambient area 0 | Intrinsic estimate in every used span | Gap resolved by actual section |
| Supplier GI determinant convention | one point, columns (1,X) and swapped | det 1 and −1; repeated supports give duplicate row and det 0 | Rank/nonzero principal open agree | Imported GI contract |
| Supplier SF general base | tx−1 over A[t]; X²−2 over ℚ | quotient A[t,t⁻¹], not finite over A[t]; field-base algebra degree 2 | General étaleness distinct from field finiteness | Corrected description |
| Supplier isolated Bézout gap | X(X−1),XY; repeated root X² | isolated local length 1≤4 with a line; length 2≤2 but nonzero-Jacobian locus empty | Multiplicity and other components both matter | Exact gap registered |
| Characteristic controls | X²−X over 𝔽₂; X³−X over 𝔽₃ | derivatives 1 and 2 at all roots; X² over 𝔽₂ has derivative 0 | Integer derivative construction valid; number-field theorem is char 0 | Added controls, no division by small primes |

### API facts

| Statement | Instances tried | Computed left value | Computed right value / exclusion | Result / change |
| --- | --- | --- | --- | --- |
| §0.1 API 1: Haar scaling | r₂=0,1 | scale factors 1,2 | 1·volume,2·volume | Retained with the exact hypotheses in that section; imported generic facts keep their supplier. |
| §0.1 API 2: all measurable sets | unit disk in ℂ | μ_can(disk)=2π | 2·area(disk)=2π | Retained with the exact hypotheses in that section; imported generic facts keep their supplier. |
| §0.1 API 3: pairing coordinates | real x=y=1; complex z=w=1 | real contribution 1; complex contribution 2 | 1·1=1; 2Re(1)=2 | Retained with the exact hypotheses in that section; imported generic facts keep their supplier. |
| §0.1 API 4: body volume | ℚ and ℚ(i) | 2 and 2π | 2¹(2π)⁰ and 2⁰(2π)¹ | Retained with the exact hypotheses in that section; imported generic facts keep their supplier. |
| §0.1 API 5: house gauge | embedded i | gauge 1 | house(i)=1 | Retained with the exact hypotheses in that section; imported generic facts keep their supplier. |
| §0.3 API 1: simultaneous witnesses | ℚ | single witness 1,product 1 | δ^(n/2)=1 | Retained with the exact hypotheses in that section; imported generic facts keep their supplier. |
| §0.3 API 2: independence and prefix dimension | ℚ,n=m=1 | rank 1; prefix rank 1 | n=m=1 | Retained with the exact hypotheses in that section; imported generic facts keep their supplier. |
| §0.3 API 3: first m house bound | n=4,m=3 | δ^(4/(2·2))=δ | δ | Retained with the exact hypotheses in that section; imported generic facts keep their supplier. |
| §0.3 API 4: full product bound | ℚ(i),witnesses 1,i | product 1 | δ^(n/2)=2 | Retained with the exact hypotheses in that section; imported generic facts keep their supplier. |
| §0.3 API 5: gauge comparison | i in ℚ(i) | house gauge 1 | house 1,versus wrong Euclidean √2 | Retained with the exact hypotheses in that section; imported generic facts keep their supplier. |
| §1.1 API 1: finite-sum integral generators | K=ℚ,α=1,u=3 | κ=3·1=3 | integer 3 | Retained with the exact hypotheses in that section; imported generic facts keep their supplier. |
| §1.1 API 2: embedding formula | α=(1,√5),u=(1,2) | τκ=1±2√5 | Σuᵢταᵢ=1±2√5 | Retained with the exact hypotheses in that section; imported generic facts keep their supplier. |
| §1.1 API 3: complex configuration equivalence | α=(1,√5) | det=−2√5 | nonzero,while repeated α gives 0 | Retained with the exact hypotheses in that section; imported generic facts keep their supplier. |
| §1.1 API 4: house bound | K=ℚ,u=D=3 | house κ=3 | nDδ²=1·3·1=3 | Retained with the exact hypotheses in that section; imported generic facts keep their supplier. |
| §1.1 API 5: basis reindex/change | α=(1,√5),u=(2,3); swap both | κ=2+3√5 | swapped sum=2+3√5 | Retained with the exact hypotheses in that section; imported generic facts keep their supplier. |
| §2.1 API 1: kernel definition | κ=0,d=2 | ev(X)=ev(X²)=0 | span(X,X²),constant 1 maps to 1 | Retained with the exact hypotheses in that section; imported generic facts keep their supplier. |
| §2.1 API 2: membership iff | κ=√2,d=2; X²−2 and 1 | degree 2,value 0; degree 0,value 1 | membership yes; no,testing both directions | Retained with the exact hypotheses in that section; imported generic facts keep their supplier. |
| §2.1 API 3: rank | κ=√2,d=3 | rank 2 | M−n=4−2=2 | Retained with the exact hypotheses in that section; imported generic facts keep their supplier. |
| §2.1 API 4: integer saturation | κ=√2,f=X²−2,a=2; f=1 | ev(2f)=0; ev(2)=2 | ev f=0; 1 not in kernel | Retained with the exact hypotheses in that section; imported generic facts keep their supplier. |
| §2.1 API 5: complex span | κ=√2,d=3 | 2 independent integer null vectors | complex value kernel dimension 4−2=2 | Retained with the exact hypotheses in that section; imported generic facts keep their supplier. |
| §2.1 API 6: degree inclusion | f=X²−2,d=2,e=3 | coefficient vector (−2,0,1) | (−2,0,1,0),same evaluation 0 | Retained with the exact hypotheses in that section; imported generic facts keep their supplier. |
| §2.2 API 1: dual map | √5,d=1,β=(1,(1+√5)/2) | rows (1,−1),(0,2) | coordinates λ(1),λ(√5) | Retained with the exact hypotheses in that section; imported generic facts keep their supplier. |
| §2.2 API 2: coordinate formula | λ=β₁-dual,κ=√5 | λ(1)=0,λ(κ)=2 | row (0,2) | Retained with the exact hypotheses in that section; imported generic facts keep their supplier. |
| §2.2 API 3: injectivity | same two rows | det 2≠0 | rank 2=rank Hom_ℤ(𝓞_K,ℤ) | Retained with the exact hypotheses in that section; imported generic facts keep their supplier. |
| §2.2 API 4: orthogonal inclusion/rank | √5,d=2 | rows (1,−1,5),(0,2,0),dot relation=0,0 | relation (−5,0,1),orthogonal rank 2 | Retained with the exact hypotheses in that section; imported generic facts keep their supplier. |
| §2.2 API 5: index and covolume | √5,d=2 | index 2,covolume 2√26 | 2·covolume(L⊥)=2√26 | Retained with the exact hypotheses in that section; imported generic facts keep their supplier. |
| §2.2 API 6: integral basis change | β₂ replaced by β₂+β₁ | unimodular matrix determinant 1 | row lattice and Gram determinant 104 unchanged | Retained with the exact hypotheses in that section; imported generic facts keep their supplier. |
| §3.1 API 1: sorted independent witnesses | L=ℤ² | norms (1,1),product 1 | 2^(2/2)covolume=2 | Retained with the exact hypotheses in that section; imported generic facts keep their supplier. |
| §3.1 API 2: relations and degree | X²−2 at √2 | degree 2,value 0 | belongs to degree≥2 relation kernel | Retained with the exact hypotheses in that section; imported generic facts keep their supplier. |
| §3.1 API 3: span and complex extension | (2,0),(0,1) | real and complex ranks 2 | integral index 2,so no integral-basis inference | Retained with the exact hypotheses in that section; imported generic facts keep their supplier. |
| §3.1 API 4: norm lower bound | integer monomial X; rational 1/2 | norm 1; norm 1/2 | integer ≥1; rational excluded | Retained with the exact hypotheses in that section; imported generic facts keep their supplier. |
| §3.1 API 5: coordinate bound | X²−2 | max absolute coefficient 2 | 2≤√5=coefficient norm | Retained with the exact hypotheses in that section; imported generic facts keep their supplier. |
| §4.1 API 1: evaluated determinant | X²−2 at 3 | derivative determinant 6 | eval polynomial 2X at 3=6 | Retained with the exact hypotheses in that section; imported generic facts keep their supplier. |
| §4.1 API 2: ring-map naturality | ℤ→𝔽₃,E=X²−X,x=1 | image of derivative 1 is 1 | 2·1−1=1 in 𝔽₃ | Retained with the exact hypotheses in that section; imported generic facts keep their supplier. |
| §4.1 API 3: extension/unit condition | X²−2 at √2; dual number 2ε | inverse √2/4; (2ε)²=0 | product with 2√2 is 1; no inverse for 2ε | Retained with the exact hypotheses in that section; imported generic facts keep their supplier. |
| §4.1 API 4: polynomial agreement | f=X at √2 | φ(class X)=√2 | f(κ)=√2 | Retained with the exact hypotheses in that section; imported generic facts keep their supplier. |
| §4.1 API 5: inverse Jacobian | X²−2 at √2 | φ(J⁻¹)=√2/4 | (2√2)(√2/4)=1 | Retained with the exact hypotheses in that section; imported generic facts keep their supplier. |
| §4.1 API 6: uniqueness | same model | X must map to √2,J⁻¹ to √2/4 | all algebra generators fixed | Retained with the exact hypotheses in that section; imported generic facts keep their supplier. |
| §4.1 API 7: surjectivity | same model | 1 and √2 in image | rational span dimension 2 | Retained with the exact hypotheses in that section; imported generic facts keep their supplier. |
| §4.1 API 8: projection factor | (X²−2)(X²−3) | algebra product degrees 2,2 | κ=√2 selects first factor,not whole product | Retained with the exact hypotheses in that section; imported generic facts keep their supplier. |
| §4.1 API 9: rational determinant specialization | X²−2 at 3 | J=2X | J(3)=6 | Retained with the exact hypotheses in that section; imported generic facts keep their supplier. |
| §4.1 API 10: quotient and localization laws | X²−2 | class(X²−2)=0 | class J is a unit,product with J⁻¹=1 | Retained with the exact hypotheses in that section; imported generic facts keep their supplier. |
| §4.1 API 11: row permutation | E=(X,Y),E′=(Y,X) | J=1,J′=−1 | same unit principal open and quotient | Retained with the exact hypotheses in that section; imported generic facts keep their supplier. |
| §4.2 API 1: same tuple/equations | K=ℚ,κ=0,E=X | Eκ=0,Jκ=1,φ=id | all four maps use X↦0 | Retained with the exact hypotheses in that section; imported generic facts keep their supplier. |
| §4.2 API 2: bound/degree monotonicity and transport | E=X²−2; H=2→3,d=2→5; κ→−κ | height 2≤2≤3,degree 2≤5 | same component,transported root −√2 | Retained with the exact hypotheses in that section; imported generic facts keep their supplier. |
| §4.2 API 3: positive bound and expansion | n=1,r=1,d=5,δ=1 | ell=5,M=6,√G=√6·10⁵ | B=5^(5/2)√6·10⁵>0 | Retained with the exact hypotheses in that section; imported generic facts keep their supplier. |
| §4.2 API 4: unique compatible map | X²−2,κ=√2 | X↦√2,J⁻¹↦√2/4 | their product constraint fixes inverse image | Retained with the exact hypotheses in that section; imported generic facts keep their supplier. |
| §5.1 API 1: least admissible existence | n=1,2,15 | r=1,2,5 | Catalan=1,2,42≥n | Retained with the exact hypotheses in that section; imported generic facts keep their supplier. |
| §5.1 API 2: minimality characterization | n=15 | F₄=14<15≤42=F₅ | r=5,no positive smaller index works | Retained with the exact hypotheses in that section; imported generic facts keep their supplier. |
| §5.1 API 3: monomial bounds | n=15,r=5 | 90≤252 | 252≤360 | Retained with the exact hypotheses in that section; imported generic facts keep their supplier. |
| §5.1 API 4: eventual logarithmic bound | n=15; n=1 boundary | 5≤5≤3log15≈8.124 | r(1)=1>0=3log1,so threshold retained | Retained with the exact hypotheses in that section; imported generic facts keep their supplier. |
| §5.1 API 5: monotonicity | n=1,2,14,15 | r=1,2,4,5 | 1≤2≤4≤5 | Retained with the exact hypotheses in that section; imported generic facts keep their supplier. |
| §5.3 API 1: native tuple subset | r=1,d=0,C=1 | constant tuples −1,0,1 | three native polynomials | Retained with the exact hypotheses in that section; imported generic facts keep their supplier. |
| §5.3 API 2: membership including zero | E=0; E=X²Y²,r=d=2 | degree 0,height 0; degree 4 | first in box; second out for d=2 | Retained with the exact hypotheses in that section; imported generic facts keep their supplier. |
| §5.3 API 3: coordinate equivalence | r=d=2 | six coefficients per equation | two equations give 12 slots | Retained with the exact hypotheses in that section; imported generic facts keep their supplier. |
| §5.3 API 4: finiteness | r=d=2,C=1 | 3 choices at each of 12 slots | 3¹²=531441 systems | Retained with the exact hypotheses in that section; imported generic facts keep their supplier. |
| §5.3 API 5: monotonicity | r=1,d=0,C=0 to d=1,C=1 | {0} has one element | subset of box with 3²=9 elements | Retained with the exact hypotheses in that section; imported generic facts keep their supplier. |
| §5.3 API 6: native bounded projection | E=X²−2,d=2 | degree 2 | membership in native total-degree submodule yes | Retained with the exact hypotheses in that section; imported generic facts keep their supplier. |

### Every README Check

| Statement | Instances tried | Computed left value | Computed right value / exclusion | Result / change |
| --- | --- | --- | --- | --- |
| §0.1 Check 1 | ℚ interval | length [−1,1]=2 | 2¹(2π)⁰=2 | Matches the definition or supplies the stated negative control. |
| §0.1 Check 2 | Gaussian disk | weighted disk area=2π | 2·π=2π | Matches the definition or supplies the stated negative control. |
| §0.1 Check 3 | totally real field | r₂=0,scale=2⁰=1 | μ_can=volume | Matches the definition or supplies the stated negative control. |
| §0.1 Check 4 | complex coordinate 1 | house=1 | weighted Euclidean norm=√2≠1 | Matches the definition or supplies the stated negative control. |
| §0.2 Check 1 | ℚ basis 1 | Gram determinant=1,covolume=1 | abs(disc ℚ)=1 | Matches the definition or supplies the stated negative control. |
| §0.2 Check 2 | Gaussian integral basis | det diag(2,2)=4,covolume=2 | abs(−4)=4,product covolume=1 | Matches the definition or supplies the stated negative control. |
| §0.2 Check 3 | quadratic nonmaximal basis | disc(1,√5)=20 | field disc=5,index²=4,so 20=4·5 | Matches the definition or supplies the stated negative control. |
| §0.3 Check 1 | degree one | n=m=1,product=1 | δ=1 | Matches the definition or supplies the stated negative control. |
| §0.3 Check 2 | even degree four | m=3,tail denominator=4 | δ^(4/4)=δ | Matches the definition or supplies the stated negative control. |
| §0.3 Check 3 | odd degree five | m=3,tail denominator=6 | δ^(5/6)≤δ for δ≥1 | Matches the definition or supplies the stated negative control. |
| §0.4 Check 1 | one-dimensional field | 2dim V=2>1 | product span dimension=1=n | Matches the definition or supplies the stated negative control. |
| §0.4 Check 2 | equality boundary | V=ℚ,n=2,2dim V=2 | product span dimension=1<2 | Matches the definition or supplies the stated negative control. |
| §0.4 Check 3 | inseparable quadratic | t² in base field,products 1,t | span dimension=2=[𝔽₂(t):𝔽₂(t²)] | Matches the definition or supplies the stated negative control. |
| §0.4 Check 4 | zero-divisor algebra | k³×0 in k⁴,2dim=6>4 | product span dimension=3<4 | Matches the definition or supplies the stated negative control. |
| §0.5 Check 1 | ℚ basis | house(1)=1 | δ²=1 | Matches the definition or supplies the stated negative control. |
| §0.5 Check 2 | Gaussian field | houses=(1,1) | δ²=4,so both 1≤4 | Matches the definition or supplies the stated negative control. |
| §0.5 Check 3 | quadratic integral rational basis | houses=(1,√5),index=2 | δ²=5,so height bound holds without index 1 | Matches the definition or supplies the stated negative control. |
| §1.1 Check 1 | integer parameter 3 | κ=3·1=3 | house=3 | Matches the definition or supplies the stated negative control. |
| §1.1 Check 2 | zero parameter in quadratic field | two equal value rows | value rank=1<2 | Matches the definition or supplies the stated negative control. |
| §1.1 Check 3 | nonmaximal short family | det embeddings=±2√5≠0 | integral index=2,permitted | Matches the definition or supplies the stated negative control. |
| §1.1 Check 4 | repeated family | α=(1,1) | equal columns,det=0,excluded | Matches the definition or supplies the stated negative control. |
| §1.2 Check 1 | one-point arithmetic jets | matrix [[1,0],[0,1]],det=1 | rank=2,D=10,M=6 | Matches the definition or supplies the stated negative control. |
| §1.2 Check 2 | quadratic zero tuple | two identical conjugate points | two value rows equal,rank deficient | Matches the definition or supplies the stated negative control. |
| §1.2 Check 3 | finite grid degree boundary | the product of D−j over 0≤j<D equals D! | nonzero at D,but zero at all D smaller values; D=0 gives 1 | Matches the definition or supplies the stated negative control. |
| §1.2 Check 4 | collinear plane points | value/tangent slice rank=6,normal slice rank=5 | total 11<21 | Matches the definition or supplies the stated negative control. |
| §1.3 Check 1 | quadratic rational values | span(1,√2) dimension=2 | [ℚ(√2):ℚ]=2 | Matches the definition or supplies the stated negative control. |
| §1.3 Check 2 | integral index survives | rational rank of 1,√5=2 | integer image index=2,not 1 | Matches the definition or supplies the stated negative control. |
| §1.3 Check 3 | zero tuple nongenerator | rational image=ℚ,rank=1 | target quadratic rank=2 | Matches the definition or supplies the stated negative control. |
| §2.1 Check 1 | zero tuple,degree two | kernel basis X,X²,rank=2 | constant 1 evaluates to 1,excluded | Matches the definition or supplies the stated negative control. |
| §2.1 Check 2 | degree zero in quadratic field | kernel=0,image rank=1 | M=1,n=2,natural 1−2=0 does not imply rank n | Matches the definition or supplies the stated negative control. |
| §2.1 Check 3 | square-root relation basis | vectors (−2,0,1,0),(0,−2,0,1),norm²=5 each | rank=2=4−2,disjoint supports | Matches the definition or supplies the stated negative control. |
| §2.1 Check 4 | nonintegral tuple | eval X=1/2 | 1/2∉𝓞_ℚ=ℤ | Matches the definition or supplies the stated negative control. |
| §2.1 Check 5 | failed full-value rank | κ=0,n=2,d=2,actual rank L=2 | M−n=3−2=1≠2 | Matches the definition or supplies the stated negative control. |
| §2.2 Check 1 | quadratic order index | ℤ[√5] index in 𝓞_K=2 | transpose index=2 | Matches the definition or supplies the stated negative control. |
| §2.2 Check 2 | maximal quadratic image | 1,√2 form integral basis,index=1 | S=L⊥ | Matches the definition or supplies the stated negative control. |
| §2.2 Check 3 | abstract doubling map | L=0,L⊥=ℤ,S=2ℤ | covolumes 1 and 2,index=2 | Matches the definition or supplies the stated negative control. |
| §2.3 Check 1 | Gaussian conjugation | B=I₂,det(BBᵗ)=1 | det(VV*)/4=4/4=1; wrong VVᵗ det=−4 | Matches the definition or supplies the stated negative control. |
| §2.3 Check 2 | quadratic Gram calculation | 27·4−(−2)²=104 | (31²−21²)/5=520/5=104 | Matches the definition or supplies the stated negative control. |
| §2.3 Check 3 | rational rather than integral basis | coordinate Gram determinant=26 | 520/20=26,whereas wrong field denominator gives 104 | Matches the definition or supplies the stated negative control. |
| §2.4 Check 1 | total-degree monomial count | r=d=2 gives M=6,H₀=1 | G=6·1²=6,not 9 | Matches the definition or supplies the stated negative control. |
| §2.4 Check 2 | constant monomial at zero | constant value=1 | wrong C₀=0 gives H₀=0 for d>0 | Matches the definition or supplies the stated negative control. |
| §2.4 Check 3 | discriminant exponents | n=2,r=1,d=5:C₀=40δ² | H₀=40⁵δ¹⁰,G=6·40¹⁰δ²⁰ | Matches the definition or supplies the stated negative control. |
| §2.5 Check 1 | transpose comparison | covol L=√26 | covol S=2√26≥√26 | Matches the definition or supplies the stated negative control. |
| §2.5 Check 2 | discriminant denominator | √(520/5)=2√26 | omitting /5 gives √520,larger by √5 | Matches the definition or supplies the stated negative control. |
| §2.5 Check 3 | rational zero tuple | kernel basis X,X²,covolume=1 | Gram determinant=1,discriminant=1 | Matches the definition or supplies the stated negative control. |
| §3.1 Check 1 | relation coefficient norm | norm(X²−2)=√(4+1)=√5 | max coefficient=2,value at √2=0 | Matches the definition or supplies the stated negative control. |
| §3.1 Check 2 | integrality lower bound | integer monomial has norm=1 | rational constant 1/2 has norm=1/2<1 | Matches the definition or supplies the stated negative control. |
| §3.1 Check 3 | independent nonbasis | det((2,0),(0,1))=2 | real rank=2 but integral index=2 | Matches the definition or supplies the stated negative control. |
| §3.1 Check 4 | intrinsic line ball | length=2=2¹·1^(−1/2) | ambient plane area=0,wrong measure excluded | Matches the definition or supplies the stated negative control. |
| §3.1 Check 5 | intrinsic plane ball | square area=2,vertex norm²=1 | disk area=π≥2; unscaled vertex norm²=2>1 | Matches the definition or supplies the stated negative control. |
| §3.2 Check 1 | exact retained count | n=2,r=1,d=5:M=6,ell=4,k=3 | codim=4−3=1,tail length=2=n | Matches the definition or supplies the stated negative control. |
| §3.2 Check 2 | degree-one boundary | n=1,k=ell | codim=0=n−1 | Matches the definition or supplies the stated negative control. |
| §3.2 Check 3 | ordered product | 1·2·4·8=64=4²·4 | largest retained 4≤4·√4=8 | Matches the definition or supplies the stated negative control. |
| §3.3 Check 1 | linear relation gradient | at 0,X maps to 1 | derivative rank=1 | Matches the definition or supplies the stated negative control. |
| §3.3 Check 2 | constant-only values | value rank=1,value kernel=0 | derivative rank=0,so jets not onto | Matches the definition or supplies the stated negative control. |
| §3.3 Check 3 | two-point kernel derivatives | columns (−1,1),(0,1) | det=−1,rank=2 | Matches the definition or supplies the stated negative control. |
| §3.4 Check 1 | diagonal subspace | codim=1 | both block ranks=1 | Matches the definition or supplies the stated negative control. |
| §3.4 Check 2 | one hyperplane in four coordinates | codim=1 | block ranks=(1,2),one full | Matches the definition or supplies the stated negative control. |
| §3.4 Check 3 | threshold failure | zero subspace codim=2=n | block ranks=(0,0),none full | Matches the definition or supplies the stated negative control. |
| §3.5 Check 1 | nonnormal cubic | J=3θ²,Norm J=27·2²=108 | all conjugate moduli=3·2^(2/3)>0 | Matches the definition or supplies the stated negative control. |
| §3.5 Check 2 | same quadratic minor | J(√2)=2√2,J(−√2)=−2√2 | both nonzero,signs opposite | Matches the definition or supplies the stated negative control. |
| §3.5 Check 3 | singular equation | E(0)=0 for X² | J(0)=0,not invertible | Matches the definition or supplies the stated negative control. |
| §4.1 Check 1 | irreducible quadratic component | A_E≃ℚ(√2),J=2√2 | J⁻¹=√2/4,product=1 | Matches the definition or supplies the stated negative control. |
| §4.1 Check 2 | two distinct fields | geometric points=4,factors=2 | factor degrees 2+2=4 | Matches the definition or supplies the stated negative control. |
| §4.1 Check 3 | repeated root | X²=0 and J=2X nilpotent | localization inverting J is zero | Matches the definition or supplies the stated negative control. |
| §4.1 Check 4 | evaluated derivative at 3 | J(3)=2·3=6 | E(3)=7,not the Jacobian | Matches the definition or supplies the stated negative control. |
| §4.1 Check 5 | singular evaluation | X² at 0 gives J=0 | no inverse maps to a field unit | Matches the definition or supplies the stated negative control. |
| §4.1 Check 6 | row-transposition sign | J(X,Y)=1 | J(Y,X)=−1,both invertible | Matches the definition or supplies the stated negative control. |
| §4.1 Check 7 | empty determinant and zero ring | r=0 gives det=1 | in zero ring the same 1 equals 0 | Matches the definition or supplies the stated negative control. |
| §4.1 Check 8 | nonzero nilpotent Jacobian | at ε,Eε=0,Jε=2ε≠0 | (2ε)²=0,so J is not a unit | Matches the definition or supplies the stated negative control. |
| §4.1 Check 9 | small characteristic | derivatives X²−X mod2=1,X³−X mod3=2 | all their roots have nonzero derivative; X² mod2 derivative=0 | Matches the definition or supplies the stated negative control. |
| §4.2 Check 1 | explicit rational model | E=X,κ=0,J=1,height=1 | 1≤5^(5/2)√6·10⁵≈13693063.94 | Matches the definition or supplies the stated negative control. |
| §4.2 Check 2 | explicit quadratic model | E=X²−2,height=2,degree=2,J=2√2 | degree≤5,localized field=ℚ(√2) | Matches the definition or supplies the stated negative control. |
| §4.2 Check 3 | extra positive-dimensional component | X(X−1),XY has line plus point | Jacobian at (1,0)=1,open algebra=ℚ | Matches the definition or supplies the stated negative control. |
| §4.2 Check 4 | bound monotonicity and bad map | height 1≤H≤H′; zero function φ(1)=0 | algebra-map law requires φ(1)=1 | Matches the definition or supplies the stated negative control. |
| §4.2 Check 5 | root-discriminant power | δ=2 versus δ=1,n=r=1,d=5 | bound ratio=2^(2·5)=1024 | Matches the definition or supplies the stated negative control. |
| §4.2 Check 6 | junk total-function input | n=0 gives exponent ell/0=0 | remaining (0²·5·2)⁵=0,so B=0; not a field degree | Matches the definition or supplies the stated negative control. |
| §5.1 Check 1 | small least ranks | F₁=1,F₂=2 | r(1)=1,r(2)=2 | Matches the definition or supplies the stated negative control. |
| §5.1 Check 2 | degree threshold | F₄=14,F₅=42 | r(14)=4,r(15)=5 | Matches the definition or supplies the stated negative control. |
| §5.1 Check 3 | logarithm at one | r(1)=1 | 3log1=0<1 | Matches the definition or supplies the stated negative control. |
| §5.1 Check 4 | total definition at zero | n=0,least positive admissible r=1 | M=2 but 4n(r+1)=0,so size theorem excludes n=0 | Matches the definition or supplies the stated negative control. |
| §5.2 Check 1 | fixed degree parameters | r(14)=4,M=70;r(15)=5,M=252 | 90≤252≤360 at n=15; d=4 fails d≥5 | Matches the definition or supplies the stated negative control. |
| §5.2 Check 2 | eventual qualifier | r(1)=1 | Qlog1=0 | Matches the definition or supplies the stated negative control. |
| §5.2 Check 3 | height logarithm | δ=1:log bound=Q(log n)² | general δ adds Qlog n logδ,zero extra term at δ=1 | Matches the definition or supplies the stated negative control. |
| §5.3 Check 1 | no equations | r=0 gives zero slots | cardinality=(2C+1)⁰=1 | Matches the definition or supplies the stated negative control. |
| §5.3 Check 2 | constants only | d=0 gives M=1 | cardinality=(2C+1)^r | Matches the definition or supplies the stated negative control. |
| §5.3 Check 3 | zero height | C=0 forces every coefficient to 0 | one tuple,1^(rM)=1 | Matches the definition or supplies the stated negative control. |
| §5.3 Check 4 | total rather than box degree | r=d=2 gives 6 monomials×2=12 | coordinatewise bound gives 9×2=18,including degree-4 X²Y² | Matches the definition or supplies the stated negative control. |
| §5.4 Check 1 | univariate coefficient box | r=1,d=2,C=1 | 3³=27 | Matches the definition or supplies the stated negative control. |
| §5.4 Check 2 | floor conversion in both directions | B=3.7,C=3:abs(a)≤3.7 iff abs(a)≤3 | 7 coefficient choices,not ceiling’s 9 | Matches the definition or supplies the stated negative control. |
| §5.4 Check 3 | empty and constant cases | r=0 gives 1; r=2,d=0,C=1 | 3⁰=1;3²=9 | Matches the definition or supplies the stated negative control. |
| §5.5 Check 1 | several classes | two irreducible quadratics | geometric/factor/class=4/2/2 | Matches the definition or supplies the stated negative control. |
| §5.5 Check 2 | repeated class among factors | X(X−1) | geometric/factor/class=2/2/1 | Matches the definition or supplies the stated negative control. |
| §5.5 Check 3 | empty open | X² | geometric/factor/class=0/0/0 | Matches the definition or supplies the stated negative control. |
| §5.5 Check 4 | improper whole intersection | X(X−1),XY | one isolated simple point≤2²=4 plus a line | Matches the definition or supplies the stated negative control. |
| §5.6 Check 1 | height one | n>1,H=1:Nₙ(1)=0 | RHS=n^(Qn(log n)³)≥1,logH=0 | Matches the definition or supplies the stated negative control. |
| §5.6 Check 2 | embedded versus class convention | nonnormal cubic,#Aut=1 | embedded multiplicity 3 versus class contribution 1 | Matches the definition or supplies the stated negative control. |
| §5.6 Check 3 | degree-one boundary | N₁(1)=1,r(1)=1 | Qlog1=0,parameter bound not valid there | Matches the definition or supplies the stated negative control. |

The map directions in the proof routes are explicit: parameter coefficients go to embedding configurations; bounded evaluation goes from polynomials to 𝓞_K or K; its transpose goes from the integral dual of 𝓞_K to coefficient vectors; joint differentiation goes from the full relation kernel to all embedding blocks; quotient/localization evaluation goes from A_E to K; Spec reverses that last direction; the counting map goes from (system, factor) pairs to classes. The computations above test the direction at each interface. No source citation is used as an unstated proof-route supplier. All routes use earlier layer targets, the exact contracts, or native declarations.

Hypothesis review also checked the cases that do not instantiate these objects: a zero ring is not a field, number-field degree zero cannot occur, and an inseparable extension is allowed only in the independent field product-span statement, not in the number-field embedding construction. The noncompact-group and non-Hausdorff-space probes do not instantiate any group-topology theorem here; the actual lattice/body supplier contracts explicitly have discreteness, fullness, finite dimension, compactness and an additive Haar measure. No generic topological or group-theoretic theorem is owned by this roadmap. Finite coefficient sets and small finite indices keep the constructions within the universes displayed in the native signatures.

The API comparison did not identify an unused hypothesis that changes the package scope. Algebraic identities in §§2.1–2.3 were stated at their actual full-rank generality instead of retaining model-size hypotheses they do not use. The proof of the logarithmic model does use the degree threshold; the concrete n=1 counterexample rules out dropping it. The final count’s H≥1 condition ensures a positive real-power base and permits H=1 without dividing by log H.

## Exact pin and binder checks

Thirty-seven exact Mathlib identifiers named in the README were checked in a single scratch Lean file using `#check`; it elaborated with no warnings or errors. Tau Ceti declarations were read directly at their pinned source locations, with their full hypotheses; they are not imported into Suggested.lean because no stated signature uses them. The roadmap resolver reported no missing cross-roadmap citations or Lean names, but expressly did not check external library names because its own host had no pinned Lake packages. The manual pinned-source review and the scratch Lean name check supply that missing verification; no library-availability claim relies on the resolver alone.

| Native object / declaration | Exact pinned location and inspected content | Computed instance |
| --- | --- | --- |
| Signed discriminant, nonvanishing and isomorphism invariance | `Mathlib/NumberTheory/NumberField/Discriminant/Defs.lean`, lines 36,41,50; actual ring-of-integers discriminant, not an arbitrary order | ℚ(i): −4; absolute value 4; different presentations preserve −4 |
| `NumberField.rootDiscr` | `Mathlib/NumberTheory/NumberField/Discriminant/Basic.lean`, lines 77–84; absolute discriminant to inverse positive degree | ℚ: 1; ℚ(i): 4^(1/2)=2 |
| `NumberField.mixedEmbedding.mixedSpace` | `Mathlib/NumberTheory/NumberField/CanonicalEmbedding/Basic.lean`, line 186; product of real-place real functions and complex-place complex functions | dimensions 1 for ℚ and 2 for ℚ(i); native norm is the supremum norm |
| `NumberField.mixedEmbedding.finrank` | same file, line 212; real dimension equals rational field degree | (r₁,r₂)=(0,1): 0+2=2 |
| `NumberField.mixedEmbedding.latticeBasis` | same file, line 637; real basis formed from the actual integral-basis images | Gaussian basis (1,i) yields a full rank-two lattice |
| `NumberField.mixedEmbedding.covolume_integerLattice` | `Mathlib/NumberTheory/NumberField/Discriminant/Basic.lean`, line 124; standard product volume, factor (2⁻¹)^r₂ | ℚ(i): (1/2)√4=1 |
| `NumberField.house` and embedding/sum/product/intCast API | `Mathlib/NumberTheory/NumberField/House.lean`, lines 38,41,45,51,74; `NumberField.canonicalEmbedding.norm_le_iff` in canonical embedding file, line 79 | house(i)=1, house(3)=3, house(i²)=1≤1·1, house(1+i)=√2≤2 |
| `NumberField.one_le_house_of_isIntegral` | House file, lines 93–98; both integrality and nonzero assumptions | house(1)=1; house(0)=0 so nonzero is necessary |
| `MvPolynomial.restrictTotalDegree` and membership | `Mathlib/RingTheory/MvPolynomial/Basic.lean`, lines 164,174; support exponent sum, no variablewise degree replacement | r=d=2: XY allowed, X²Y² excluded (degree 4) |
| `MvPolynomial.basisRestrictSupport` | same file, line 95; basis indexed by the specified exponent subset | r=0: one constant basis monomial, not zero |
| Native `MvPolynomial.aeval` and `MvPolynomial.pderiv` | `Mathlib/Algebra/MvPolynomial/Eval.lean`, line 572, and `Mathlib/Algebra/MvPolynomial/PDeriv.lean`, line 61; exact names elaborated; genuine algebra evaluation and formal derivation | X² at 3 has value 9 and derivative value 6; constant derivative 0 |
| `MvPolynomial.eq_zero_of_eval_zero_at_prod_finset` | `Mathlib/Combinatorics/Nullstellensatz.lean`, line 62; finite variables, integral domain and strict degree/cardinality inequalities | T(T−1) vanishes on {0,1} but equals 2 at 2, so degree 2 needs 3 values |
| `Algebra.discr_not_zero_of_basis` | `Mathlib/RingTheory/Discriminant.lean`, line 127; finite separable extension and actual basis | (1,i) has discriminant −4≠0 |
| `Algebra.discr_eq_det_embeddingsMatrixReindex_pow_two` | same file, line 143; separability, embedding-index equivalence and square determinant | Gaussian embedding determinant −2i has square −4 |
| `ZLattice.covolume_eq_det_mul_measureReal` | `Mathlib/Algebra/Module/ZLattice/Covolume.lean`, line 115; discrete full lattice, actual basis and explicit Haar measure | 2ℤ: determinant 2 times unit reference domain length 1 gives 2 |
| `ZLattice.covolume_div_covolume_eq_relIndex'` | same file, line 170; nested discrete full lattices in one real inner-product space | 2ℤ⊆ℤ: ratio 2/1=2=index |
| `AddSubmonoid.ker_saturated` | `Mathlib/GroupTheory/Subgroup/Saturated.lean`, line 62; additive-group domain and additive torsion-free codomain | doubling ℤ→ℤ has kernel 0; 2x=0 implies x=0 |
| `Nat.centralBinom` and consecutive recurrence | `Mathlib/Data/Nat/Choose/Central.lean`, lines 36,78 | r=1: 2·6=2·3·2=12 |
| `Nat.four_pow_le_two_mul_add_one_mul_centralBinom` | same file, line 123; all natural r including zero | r=0:1≤1; r=2:16≤5·6=30 |
| Native `catalan` and `succ_mul_catalan_eq_centralBinom` | `Mathlib/Combinatorics/Enumerative/Catalan/Basic.lean`, lines 52,126 | r=4: (4+1)·14=70=choose(8,4) |
| `Ideal.Quotient.mk`, `Localization.Away` | `Mathlib/RingTheory/Ideal/Quotient/Defs.lean`, line 83, and `Mathlib/GroupTheory/MonoidLocalization/Away.lean`, line 140; exact names and algebra instances elaborated inside the real model definition | X²−2 maps to zero; 2X maps to a unit; X² model localizes to zero |
| `Algebra.Etale.iff_exists_algEquiv_prod` | `Mathlib/RingTheory/Etale/Field.lean`, line 271; field base, arbitrary commutative algebra, finite product of module-finite separable field extensions | product of two quadratic fields has rational dimension 4; empty product has dimension 0 |
| Essentially finite type companion | same file, line 194; `Algebra.FormallyEtale.iff_exists_algEquiv_prod` has `EssFiniteType`, whose class is in `Mathlib/RingTheory/EssentialFiniteness.lean`, line 40 | ℚ[X]/(X²−2)[1/(2X)] is finitely presented and dimension 2 |
| `NumberField.finite_of_discr_bdd` | `Mathlib/NumberTheory/NumberField/Discriminant/Basic.lean`, line 494; finite-dimensional intermediate fields of fixed field A, characteristic zero | discriminant cutoff 1 contains only the degree-one field |
| Tau Ceti fixed-ambient count | `TauCeti/NumberTheory/EffectiveBounds/HermiteCount/Basic.lean`, lines 172,202; `NumberField.ncard_setOf_finiteDimensional_abs_discr_le_le`, `NumberField.hermiteCountBound` | abstract D=C=1 bound is (2·1+1)²·1=9; this is not the new degree-sensitive estimate |
| Tau Ceti intrinsic Gram covolume | `TauCeti/Algebra/Module/ZLattice/Covolume.lean`, line 42; normed real inner-product space, finite dimension, Borel structure, discrete full lattice and integral basis | empty basis: 1²=det(empty)=1; 2ℤ:2²=4 |

A second scratch file included the actual Suggested.lean text and `#check @name` for every one of its nine declarations. It elaborated once successfully with the same four intended proof warnings. The printed types were compared individually with the README. Every field, number-field, r≥1, d≥5 and monomial-dimension hypothesis is explicit in the relevant theorem; none disappeared through unused section variables. `HasBoundedModel` explicitly retains both `[Field K]` and `[NumberField K]`, and its quotient/localization data are tied to its own E and κ. The two integer parameter bounds elaborate in ℤ; the coefficient bound and all real logarithmic powers elaborate in ℝ. `JacobianOpenAlgebra` is a genuine Type-valued alias of native carriers and all data definitions have real bodies. No binder repair was needed after this mechanical check. During initial elaboration, a parenthesis in the localization alias was corrected and the natural infimum definition was marked noncomputable; neither changed its mathematics.

## Elaboration outcome

The required `lake env lean` invocation targeting `packages/EffectiveBoundsPartII/Suggested.lean` was run from the content checkout, with the required absolute file argument. It exited successfully. No Tau Ceti import is used by that file, so no targeted module build was needed. There were exactly **4** `sorry` warnings and **0** other warnings or errors. With only the location prefix normalized to the package-relative path, the messages were:

```text
packages/EffectiveBoundsPartII/Suggested.lean:26:8: warning: declaration uses `sorry`
packages/EffectiveBoundsPartII/Suggested.lean:37:8: warning: declaration uses `sorry`
packages/EffectiveBoundsPartII/Suggested.lean:110:8: warning: declaration uses `sorry`
packages/EffectiveBoundsPartII/Suggested.lean:130:8: warning: declaration uses `sorry`
```

The nine own names all occur in the README, and the README’s own-identifier audit found **0 missing claims**. The single import is `import Mathlib`; there are four `sorry` proof bodies, no `set_option`, no admitted examples and no admitted data. Source manifest validation returned `0 problem(s)`. The plan comparison changed only the top-level `gaps` list. Deliverables contain no machine paths, copied source text or edits to the content repository or merge order.

## Dependency-check output

The required dependency check, with `--movable`, completed successfully. Its output is reproduced verbatim:

```text
moved: EffectiveBoundsPartII moved in the merge order from #99 to #123, right after its last supplier ArithmeticStatisticsPartI; checked as moved (the worker moves it there when it submits)
depcheck: 48 roadmaps, 539 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. The reported move is the permitted placement after the actual field-family supplier; the merge-order file was not edited.
