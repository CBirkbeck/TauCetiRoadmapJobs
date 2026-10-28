## H01 (CBirkbeck) — applied

The unsupported imported multiplicity contract in `TauCetiRoadmap/EffectiveBoundsPartII/README.md:82` is replaced by the supplier's actual two-equidimensional-subscheme inequality; §5.5 now owns the named isolated affine point and Jacobian-open geometric-point corollaries with their component-degree induction at lines 725–729, and the field-class proof invokes that corollary at line 733. The scope, layer dependencies, worked example and counting theorem docstring in `TauCetiRoadmap/EffectiveBoundsPartII/Suggested.lean:144` agree, while the README Checks at lines 740–743 distinguish retained components, redundant points at infinity, zero and constant equations, double roots and characteristics 2 and 3.

### Evidence, scope and ownership

At main `794d0fc`, `TauCetiRoadmap/SchemeAndStackFoundations/README.md:7338` states the unweighted component-degree inequality for two equidimensional projective subschemes and reserves its multiplicity equality for proper intersection. Its §0.10 (`TauCetiRoadmap/SchemeAndStackFoundations/README.md:900`) supplies Jacobian étaleness over every commutative base. COU20 line 425 through line 430, §4, p.496, uses isolated points for the count; it does not supply the stronger imported multiplicity interface. The replacement proves the required distinct-point bound in every dimension and characteristic, with no restriction to systems produced by the arithmetic construction.

The projective degree theory remains owned by SchemeAndStackFoundations §5.12. EffectiveBoundsPartII owns only the derived system-of-equations corollary connecting it to its field-factor count; it introduces no generic degree, component or field-class carrier and no new fully qualified Lean declaration. The corollary is a proof input to the existing counting headline, so it stays in the README rather than adding an API statement to the acceptance file. No target moves to a later supplier and no supplier file is changed.

Object searches covered the roadmap index at the open heads, main, the supplied sibling roadmap trees, board packages and the pinned libraries. The other indexed isolated-point occurrence in ArithmeticStatisticsPartV §3.28 is a consumer, not a supplier of this corollary; ownership against that pull request's full contents was not checked because this brief supplies no checkout for it. `packages/EffectiveBoundsCompactModels/design/README.md` describes the same compact-model development and asks for the same missing supplier contract; it does not supply a proved or separately assigned generic theorem. The supplied sibling GenericDoublePointInterpolation at `d1d487c` has the consumed §§0.1, 0.3, 1.3–1.4, 5.1–5.3, including the complex-compatible universal minor. GeometryOfNumbersAndQuadraticArithmetic's indexed head has exactly §§0.1.2, 0.2.1, 0.2.6, 0.3.3, 1.1.2–1.1.5, 1.2.7 and 1.5.21; ArithmeticStatisticsPartI's indexed head has the Layer 0 class quotient and both `NumberFieldFamily.isoFamily` and `NumberFieldFamily.isoDegree`. Those two citation leads are supplied declarations, not missing pinned declarations. The main DiophantineApproximationAndTranscendence §2.8 owns its general number-field subspace covolume formula; the arithmetic evaluation-image index here remains a distinct specialization.

COU20 is the sole directly cited work: its certified publisher-open published text and existing manifest entry were read at COU20 lines 20, 35, 104–164, 169–380 and 381–430. No new source or manifest entry is needed. The merged Completed/EffectiveBounds and HeightsAndUnits roadmaps were read for scope and shape.

### Pinned carriers and declarations

The pins are Mathlib `6b7abb3` and Tau Ceti `a91d3aa`, as recorded by the content manifest. The object search found no existing isolated affine or Jacobian-open degree bound at those pins; the Bézout-ring declarations concern principal ideals, not intersection degrees. The native bounded module is defined as `restrictSupport R { n | (n.sum fun _ e => e) ≤ m }` in `Mathlib/RingTheory/MvPolynomial/Basic.lean:164`: it bounds total degree, without a separate bound in each variable or a field hypothesis. The native house is `‖canonicalEmbedding K α‖` in `Mathlib/NumberTheory/NumberField/House.lean:38`; it is not the weighted Euclidean norm. The actual field-base étale classification in `Mathlib/RingTheory/Etale/Field.lean:271` quantifies over a finite index type with no nonemptiness assumption, so the zero algebra is included; it does not assert finiteness over an arbitrary base ring.

| Contract | Verified pinned location and hypotheses |
| --- | --- |
| Signed field discriminant, nonvanishing, isomorphism invariance | `Mathlib/NumberTheory/NumberField/Discriminant/Defs.lean:36`, `:41`, `:50`; field and number-field instances. |
| Root discriminant, mixed covolume, Hermite finiteness | `Mathlib/NumberTheory/NumberField/Discriminant/Basic.lean:77`, `:124`, `:494`; finiteness is for finite-dimensional intermediate fields of a fixed characteristic-zero ambient field. |
| Mixed dimension and actual integral lattice basis | `Mathlib/NumberTheory/NumberField/CanonicalEmbedding/Basic.lean:212`, `:637`; `canonicalEmbedding.norm_le_iff` at `:79`. |
| House, sum, product, integer value, nonzero integral lower bound | `Mathlib/NumberTheory/NumberField/House.lean:38`, `:41`, `:45`, `:51`, `:74`, `:93`; the last requires both integrality and nonzero input. |
| Bounded monomial basis and membership | `Mathlib/RingTheory/MvPolynomial/Basic.lean:95`, `:164`, `:174`; a commutative coefficient ring suffices. |
| Product-grid vanishing | `Mathlib/Combinatorics/Nullstellensatz.lean:62`; finite variable type, integral domain, strictly larger coordinate grids. |
| Nonzero basis discriminant and embedding determinant square | `Mathlib/RingTheory/Discriminant.lean:127`, `:143`; finite separable fields and the actual embedding-index equivalence. |
| Intrinsic full-lattice determinant and relative index | `Mathlib/Algebra/Module/ZLattice/Covolume.lean:115`, `:170`; both full lattices are in the same finite-dimensional real span. |
| Saturated additive kernel | `Mathlib/GroupTheory/Subgroup/Saturated.lean:62`; additive torsion-free codomain. |
| Central-binomial definition, recurrence and growth | `Mathlib/Data/Nat/Choose/Central.lean:36`, `:78`, `:123`; includes rank zero. |
| Catalan definition and central-binomial identity | `Mathlib/Combinatorics/Enumerative/Catalan/Basic.lean:52`, `:126`. |
| Fixed-ambient effective Hermite count | `TauCeti/NumberTheory/EffectiveBounds/HermiteCount/Basic.lean:172`, `:202`. |
| Gram determinant of actual integral lattice basis | `TauCeti/Algebra/Module/ZLattice/Covolume.lean:42`; discrete full lattice in a finite-dimensional real inner-product space, including dimension zero. |

### Elaborated signatures

A scratch copy of the final module with `#check @name` for all 11 declarations elaborated successfully. Every elaborated type was compared with its README statement; all needed binders are present, none changed, and the only Lean edit is the counting theorem's explanatory docstring.

| Declaration in `TauCetiRoadmap.EffectiveBoundsPartII` | Elaborated interface compared with README |
| --- | --- |
| `exists_short_integral_basis` | Arbitrary-universe number field; rational basis, integral values, house bound δ². |
| `exists_bounded_first_jet_generators` | Explicit K,r,d, r≥1,d≥5,M≥n(r+1); the same b,u,κ occur in the house bounds and complex jet map. |
| `jacobianPolynomial` | Integer square system; rational polynomial determinant; r is implicit. |
| `JacobianOpenAlgebra` | Native rational quotient localized at that same determinant; r is implicit. |
| `HasBoundedModel` | K, field and number-field instances, r,d,H; actual integral point, bounded equations, étaleness and compatible surjection. |
| `explicitCoefficientBound` | Total function of natural n,r,d and real δ; positivity hypotheses belong to its model theorem. |
| `exists_explicit_small_model` | Explicit number field and the same r,d,dimension inequalities as §4.2. |
| `centralBinomialRank` | Total natural-valued infimum; no number-field binder is intended. |
| `exists_logarithmic_small_models` | One real Q≥3 before every number field, degree threshold, degree-only rank, all three size bounds and the model. |
| `bounded_systems_field_class_bound` | r,d≥1, natural C,m; explicit field and number-field instances for every family member, pairwise nonisomorphism and actual surjective model maps. |
| `discriminant_field_class_bound` | One Q≥3 before n,H,m and every finite family; exact degree, inclusive absolute discriminant, pairwise nonisomorphism. |

### Adversarial mathematics pass

The following are computations and separating instances, not a claim that elaboration proves the admitted theorems. Repeated API formulations of the same statement share its row; the new geometric proof has separate rows for its induction steps.

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Degree, root discriminant and denominators | ℚ; ℚ(i); n=0 | (n,disc,δ)=(1,1,1),(2,−4,2); neither n nor disc is zero; n=0 has no number-field instance | Valid domain | None |
| Canonical pairing and measure scaling, §0.1 | One real coordinate; one complex coordinate 1 | g(1,1)=1 or 2; real determinant of complex scaling is √2·√2=2 | Correct complex weight | None |
| House-body volume, §0.1 | ℚ; ℚ(i) | 2=2¹; 2π≥4=2² | Correct measure and lower bound | None |
| House gauge versus weighted norm | Complex coordinate 1 | Gauge=1; weighted norm=√2 | Distinguishes objects | None |
| Intrinsic coefficient norm and rank-zero volume | X²−2; zero-dimensional lattice | Norm²=4+1=5; max coefficient=2; value at √2=0; covolume(empty basis)=1 | Correct conventions | None |
| Hermitian row convention | Rows 1,i | VV* has off-diagonals −i,i; native Gram has i,−i; both determinants 0 and diagonals 1,1 | Transposition preserves needed quantities | None |
| Ordinary derivative normalization | X² at 3; X³−X over 𝔽₃ | Derivative values 6 and 2, versus divided-derivative value 3 in the first case | No factorial division | None |
| Positive model range and natural subtraction | n=2,r=1,d=5; n=0,r=1,d=5 | M=6,ℓ=4≥nr=2,D=20; at n=0 real exponent ℓ/(2n)=0 | Total junk value excluded from theorem | None |
| Integral versus rational evaluation | √5 in ℚ(√5) | Rational rank=2; integer image index=2 | No integral surjectivity | None |
| Unweighted versus embedded count | Nonnormal cubic; Galois quadratic | Class counts 1,1; embedded counts 3,1 | Correct class convention | None |
| Canonical discriminant covolume, §0.2 | ℚ; ℚ(i) | Covolumes 1,2; squares 1,4 equal absolute discriminants | Correct | None |
| Integral-basis hypothesis, §0.2 | ℚ(√5), bases (1,√5) and (1,(1+√5)/2) | Basis discriminants 20 and 5; field discriminant 5 | Wrong basis excluded | None |
| Primitive orthogonal covolumes, supplier | Diagonal and antidiagonal in ℤ²; doubled diagonal | Primitive lengths √2=√2; doubled length 2√2 | Self-duality and primitivity matter | None |
| Second-Minkowski measure convention, supplier | 2ℤ and [−3,3] | Minimum 2/3; (2/3)·6=4=2·2 | Correct product direction | None |
| Ordered-product root estimate, supplier | Sequence 1,2,4,8 | Product 64; third entry 4≤64^(1/2)=8 | Tail length correct | None |
| Intrinsic ball lower bound, supplier | Dimensions 1 and 2 | Volumes 2 and π; lower bounds 2 and 2; line has ambient plane area 0 | Intrinsic measure required | None |
| Short ordered integers, §0.3 | n=1,4,5 | m=1,3,3; 2m>n gives 2>1,6>4,6>5 | Correct strict majority | None |
| Tail-house estimate, §0.3 | n=4,i=3; n=5,i=3 | Exponents 4/(2·2)=1 and 5/(2·3)=5/6≤1 | Correct δ bound | None |
| Product-span theorem, §0.4 | K=k; quadratic V=k; inseparable 𝔽₂(t)/𝔽₂(t²) with V=K | Product dimensions 1,1,2; strict inequalities 2>1,2=2,4>2 | Equality fails; inseparability allowed | None |
| Field hypothesis for product span | Algebra k⁴, ideal k³×0 | 2dim V=6>4; product span dimension 3<4 | Finite-algebra substitute rejected | None |
| Short integral rational basis, §0.5 | ℚ; ℚ(i); ℚ(√5) | Houses 1≤1; 1,1≤4; 1,√5≤5; last integral index 2 | Headline matches rational basis | None |
| Integral parameter tuple, §1.1 | α=1,u=3; u=0 | κ=3; zero tuple=0; house 3≤3 for n=δ=1,D=3 | Definition fixed by finite sum | None |
| Complex configuration equivalence, §1.1 | α=(1,√5); repeated α=(1,1) | Embedding determinants −2√5 and 0 | Basis condition essential | None |
| Reindexing parameters, §1.1 | α=(1,√5),u=(2,3), then swap both | Both tuples give 2+3√5 | Correct covariance | None |
| Bounded first jets, §1.2 | K=ℚ,r=1,d=5,u=0; quadratic zero tuple | Minor=1, rank=2, M=6,D=10; quadratic repeated values have rank 1<2 | Chosen configuration required | None |
| Grid cardinality, §1.2 | Polynomial T(T−1), D=2; D=0 | Values at 0,1,2 are 0,0,2; empty product=1 | D+1 values required | None |
| Genericity versus distinctness | Seven points (i,0), d=5 | Value/x-derivative slice dimension 6, y-derivative slice 5; rank 11<21 | Distinctness insufficient | None |
| Value descent and generation, §1.3 | κ=√2; quadratic κ=0 | Bounded rational image dimensions 2 and 1<2 | Actual jet hypothesis retained | None |
| Relation kernel definition and membership, §2.1 | κ=0,d=2; constant 1 | Kernel basis X,X²; evaluations 0,0,1 | Correct kernel | None |
| Relation rank, §2.1 | κ=√2,d=3; quadratic κ=0,d=2 | Kernel ranks 2=4−2 and 2≠3−2 | Full value rank essential | None |
| Saturation of relations, §2.1 | 2(X²−2); constant 1 | At √2 evaluations 0 and 1; dividing the zero relation by 2 preserves zero | Torsion-free target used | None |
| Scalar-extension kernel, §2.1 | κ=√2,d=3 | V has rank 2, kernel dimension 4−2=2; two disjoint-support relations have squared norms 5,5 | Correct span | None |
| Degree inclusion, §2.1 | X²−2 from d=2 to d=3 | Same coefficient vector gains a zero coordinate; value remains 0 | Correct inclusion | None |
| Integral domain of evaluation | κ=1/2 in ℚ | X evaluates to 1/2∉ℤ | Integral tuple required | None |
| Transpose source, target and injectivity, §2.2 | Map ℤ→ℤ, z↦2z | Dual map z↦2z has kernel 0, image 2ℤ⊂ℤ | Correct direction | None |
| Transpose-image index and orthogonal covolume, §2.2 | κ=√5,d=2; κ=√2,d=1 | q=2 and q=1; √104=2√26; index-one orthogonal is full | Index retained | None |
| Integral-basis change for transpose image | Swap the two rows (1,−1,5),(0,2,0) | Same image; Gram determinant 104 before and after | Unimodular invariance | None |
| Gram–discriminant identity, §2.3 | ℚ(√5), genuine β | BBᵗ=[[27,−2],[−2,4]], det=104; det(VV*)=520; 520/5=104 | Correct denominator | None |
| Conjugation in Gram identity | ℚ(i), monomials 1,X | det(BBᵗ)=1; det(VV*)=4; det(VVᵗ)=−4 | Conjugation necessary | None |
| Rational basis cannot replace β | ℚ(√5), basis (1,√5) | Coordinate Gram determinant 26=520/20; 520/5=104≠26 | Wrong discriminant excluded | None |
| Monomial-value bound, §2.4 | r=d=2,C₀=1; κ=0 | Six monomials, H₀=1,G=6; at zero the diagonal sum is 1 | Constant term included | None |
| Height exponents, §2.4 | n=2,r=1,d=5 | C₀=40δ²,H₀=40⁵δ¹⁰,G=6·40¹⁰δ²⁰ | Correct exponents | None |
| Relation covolume inequality, §2.5 | κ=√5,d=2; κ=0 in ℚ,d=2 | √26≤√(520/5)=2√26; second example covolume=1, Gram=disc=1 | Intrinsic and index directions correct | None |
| Short relation witnesses, §3.1 | X²−2; rational constant 1/2 | Norms √5≥1 and 1/2<1 | Integer coefficients required | None |
| Witness family versus integral basis | (2,0),(0,1) in ℤ² | Determinant 2; independent, integral index 2 | No false basis claim | None |
| Coefficient bound by norm, §3.1 | X²−2 | Max coefficient 2≤√5; value 0 differs | Correct metric | None |
| Truncation and codimension, §3.2 | n=2,r=1,d=5; n=1 | ℓ=4,k=3,codim=1,tail=2; n=1 retains ℓ,codim=0 | Drops exactly n−1 | None |
| Truncation norm bound, §3.2 | Norms 1,2,4,8; n=2,ℓ=G=4 | Product 64=4²·4; retained maximum 4≤4¹√4=8 | Correct exponent | None |
| Joint gradients on value kernel, §3.3 | Supports 0,1 with X(X−1),X²(X−1) | Derivative columns (−1,1),(0,1); determinant −1 | Joint rank 2 | None |
| Values alone do not give gradients | One point 0,d=0 | Value rank 1; kernel and derivative rank 0 | Jet hypothesis necessary | None |
| Retained full gradient block, §3.4 | Diagonal in ℂ²; codimension-one hyperplane in (ℂ²)²; zero subspace in ℂ² | Block ranks (1,1),(1,2),(0,0); codimensions 1,1,2 | At least one full block when codim<n | None |
| Common arithmetic minor, §3.5 | X²−2 at ±√2; X³−2 at θ | Values ±2√2; norm(3θ²)=27·4=108 | Nonzero under every embedding without normality | None |
| Jacobian polynomial definition, §4.1 | E=(X,Y); row swap; r=0 | Determinants 1,−1,1 | Correct equation/variable orientation | None |
| Functorial evaluated Jacobian | Integer X²−X over 𝔽₂; X³−X over 𝔽₃ | Derivatives 1 at both binary roots and 2 at all three ternary roots | Compatible in small characteristics | None |
| Quotient-localization carrier, §4.1 | E=X²−2; E=X² | Algebras ℚ(√2) and 0; latter inverts nilpotent 2X | Correct principal open | None |
| Compatible component map and inverse | X²−2 at √2 | Inverse derivative √2/4; (2√2)(√2/4)=1; class of X maps to √2 | Actual map fixed | None |
| General-ring extension requires a unit | X² at ε in ℚ[ε]/(ε²) | E(ε)=0,J(ε)=2ε≠0,(2ε)²=0 | Nonvanishing is insufficient outside a field | None |
| Surjection need not be isomorphism | (X²−2)(X²−3) | Two field factors, dimensions 2+2=4; each quotient field dimension 2 | One selected component only | None |
| General-base étale does not mean finite | tx−1 over A[t] | J=t; quotient=A[t,t⁻¹]; ranks not finite for nonzero A | Field-base classification used only over fields | None |
| Model predicate, §4.2 | ℚ,E=X,κ=0; fake zero function | Degree=1,height=1,J=1,algebra=ℚ; fake map sends 1 to 0≠1 | Point and compatible algebra map determine model | None |
| Model monotonicity and transport | E=X at heights 1,2 and degrees 1,5; identity field equivalence | Same coefficient 1≤1≤2, degree 1≤5, point 0 and J=1 unchanged | Correct predicates | None |
| Explicit coefficient bound, §4.2 | n=r=1,d=5,δ=1; δ=2; n=0 | B=5^(5/2)√6·10⁵>1; ratio B(2)/B(1)=2¹⁰=1024; n=0 gives B=0 | Positive only in stated range | None |
| Explicit small model theorem, §4.2 | ℚ,E=X; ℚ(√2),E=X²−2,r=1,d=5 | Heights 1 and 2; J values 1 and 2√2; M=6≥2 or 4 | Correct number-field cases | None |
| Least central-binomial rank definition, §5.1 | n=0,1,2,14,15 | Ranks 1,1,2,4,5; M=2,2,6,70,252 | Total definition and threshold correct | None |
| Catalan ratio and monomial bounds, §5.1 | r=4→5,n=15 | Ratio 42/14=3=2·9/6<4; 90≤252≤360 | Correct minimality estimate | None |
| Eventual logarithmic bound, §5.1 | n=1; n=15 | r(1)=1>3log1=0; r(15)=5<3log15≈8.124 | Eventual qualifier necessary | None |
| Rank monotonicity, §5.1 | n=1,2,14,15 | 1≤2≤4≤5 | Compatible with increasing admissibility threshold | None |
| Logarithmic model headline, §5.2 | n=15,r=d=5; δ=1,2 | M=252,ℓ=237; log B=(237/30)log237+(1/2)log252+5log6750+10logδ; doubling δ adds 10log2 | Finite threshold and uniform logarithmic estimates | None |
| Coefficient box definition, §5.3 | r=0; d=0; C=0 | Empty tuple count 1; constant tuples (2C+1)^r; zero tuple count 1 | Degenerate cases included | None |
| Coefficient slots and native degree | r=d=2 | Six monomials, twelve slots; separate degree bounds give nine monomials and admit X²Y² of degree 4 | Total degree preserved | None |
| Box monotonicity and bounded-module projection | E=X²−2, r=1 | Degree 2,height 2; fits (d,C)=(2,2),(3,3), fails d=1 or C=1 | Exact conjunction | None |
| Coefficient-box cardinality, §5.4 | (r,d,C)=(1,2,1),(2,2,1),(2,0,1),(0,0,0) | Counts 27,531441,9,1 equal formula | Correct finite product | None |
| Floor equivalence in both directions | B=3.7; coefficients ±3,±4 | 3≤3.7 and 3≤floor B=3; 4>3.7 and 4>3 | Exact integer cutoff | None |
| Projective component-degree induction base, §5.5 | ℙ² before cuts | Degree sum=1=d⁰ | Correct base | Added explicit induction |
| Contained-component step, §5.5 | First X(X−Z), then XY | Line X=0 retained with degree 1≤2·1; replacing XY by X retains it with 1≤1·1 | Handles improper intersections and d=1 | Added explicit step |
| Noncontained-component step, §5.5 | Line X=Z cut by XY | Points [1:0:1],[0:1:0], each degree 1; sum 2=2·1 | Applies supplier only to equidimensional inputs | Added explicit step |
| Removing redundant components, §5.5 | Same line and cut points | Raw sum 1+1+1=3; [0:1:0] lies on X=0; reduced component sum 2≤3≤4 | No overcounted degree invariant | Added Check |
| Zero-equation step, §5.5 | (0,Y),r=2,d=1 | Final projective line degree 1≤1²; affine isolated count 0; Jacobian 0 | No positive-degree hypersurface assumed | Added Check |
| Nonzero-constant step, §5.5 | (1,Y),r=2,d=1 | Quotient 0, degree sum 0, point count 0≤1 | Empty intersection handled | Added Check |
| Isolated affine point bound, §5.5 | X(X−1),XY; (X²−2)(X²−3) | Isolated counts 1≤2²=4 and 4=4¹ | Positive-dimensional components permitted | Added named corollary |
| Distinct points versus local lengths, §5.5 | X² in characteristic zero | Reduced isolated count 1; local length 2; Jacobian-open count 0 | Three quantities distinguished | Dropped multiplicity strengthening |
| Jacobian-open geometric-point bound, §5.5 | X(X−1),XY | J=X(2X−1); J(1,0)=1; J=0 on X=0; open point count 1≤4 | Isolated-point corollary supplies actual open | Added named corollary |
| Jacobian-open bound in characteristic 2 | X²−X; X² | Derivatives 1 and 0; open counts 2=2¹ and 0≤2 | No prime exclusions | Added Check |
| Jacobian-open bound in characteristic 3 | X³−X | Roots 0,1,2; derivative 2 at each; open count 3=3¹ | Characteristic-free geometry | Added Check |
| Geometric points to field factors, §5.5 | Quartic product; X(X−1); X² | Point counts 4,2,0; factors 2,2,0; classes 2,1,0 | Sum of positive factor degrees bounds factors | Rewired to local corollary |
| Bounded-system family headline, §5.5 | Two quadratic classes with r=1,d=4,C=6; one ℚ with r=1,d=2,C=1 | 2≤13⁵·4=1485172; 1≤3³·2=54 | Finite-family and class formulations agree | Proof repaired; signature unchanged |
| Pairwise nonisomorphism, §5.5 | Two factors ℚ×ℚ; family of two copies of ℚ | Factors=2, classes=1; duplicate family violates pairwise hypothesis | No injection from fields to systems | None |
| Empty model and family, §5.5 | C=0,r≥1; m=0 | J=0,A=0,represented classes=0; 0≤(2C+1)^(rM)d^r | Empty product and surjections handled | None |
| Restricting degree/discriminant, §5.5 | Two quadratic factors, discriminants 8 and 12, cutoff H=8 | Two represented classes become one; 1≤2 | Restriction only shrinks image | None |
| Uniform discriminant height, §5.6 | n=2,H=8,δ(ℚ(√2))=√8; H=1 | δ≤H^(1/n) is equality; log H=0 at H=1 | Inclusive cutoff and no denominator log H | None |
| Final cubic-logarithmic exponent, §5.6 | L=log n; height B=(nH^(1/n))^(aL), slots≤bnL² | Log contribution ≤ab nL⁴+ab L³log H plus box/factor terms; H=1 makes second term 0 | Same enlarged constant suffices | Geometric input repaired |
| Discriminant family headline boundary | n>Q,H=1; n=1,H=1; n=2,H=3 | First sublevel empty gives 0≤n^(Qn(log n)³); latter actual counts 1,1 are outside n>Q≥3 | No false all-degree estimate | None |
| Worked integral-index example | κ=√5,d=2 | Relation (−5,0,1) has squared length 26; transpose Gram det104; value Gram det520=5·104 | Consistent with §§2.1–2.5 | None |
| Worked common-minor example | n=2,ℓ=4,k=3; X³−2 | Codim1<2; norm J=108; deleting one more gives codim2 | Consistent with §§3.2–3.5 | None |
| Worked multi-class example | Quartic product, X(X−1), X², mixed-dimensional pair | (points,factors,classes)=(4,2,2),(2,2,1),(0,0,0); mixed case isolated count1≤4 | Consistent with repaired §5.5 | Replaced imported contract wording |
| Worked uniform-parameter example | n=14,15; r=1,…,5 | Catalans 1,2,5,14,42; ranks4,5; n=15 gives 90≤252≤360 | Consistent with §§5.1–5.6 | None |

### Build and gates

Build: exit 0; `lake build TauCetiRoadmap.EffectiveBoundsPartII.Suggested`.

`Build completed successfully (8976 jobs).`

The only six warnings are the six intended headline `sorry` declarations. Scratch signature elaboration also exited 0.

Dependency check output:

```text
depcheck: 51 roadmaps, 582 edges, 0 problem(s)
```

No UPWARD or CYCLE line was emitted.

Commit: `fe79227d` — `EffectiveBoundsPartII: review repairs (derive distinct-point Bézout corollary)`. Only the two authorized roadmap files are committed; the worktree is clean and nothing was pushed.

Full gate: exit 0.

```text
gate EffectiveBoundsPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```
