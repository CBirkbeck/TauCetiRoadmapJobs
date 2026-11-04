# EffectiveBoundsPartII repair report

## F01 (P2) — applied

Review r1a. “Both counting headlines lack a carrier” → two headline signatures on arbitrary finite families of pairwise nonisomorphic number fields. Added `bounded_systems_field_class_bound` and `discriminant_field_class_bound`; updated the module docstring, build overview, §§5.5–5.6 and their Checks. The supplier still owns the quotient. No existing declaration was renamed or deleted.

## F01 (P2) — applied differently

Review r1b, overlapping r1a F01. Missing discriminant-count headline → `discriminant_field_class_bound`, using the finite-family formulation above instead of an existential covering family of embedded subfields. Both express the same unweighted bound: inject distinct representatives into the class set; conversely choose one representative per class. Hermite finiteness precedes this choice. No second counting theorem or quotient construction was added.

## F02 (P3) — applied

Review r1b. §5.2’s running-head locator → COU20 line 20 for Theorem 1, with proof at COU20 lines 381–425. Also replaced the same running-head locator in “Uniform parameters and inclusive height” by COU20 lines 421–430. COU20 line 420 is the printed-page-496 running head; it states no theorem.

## F03 (P3) — applied

Review r1b. Repaired all 29 in-word φ substitutions: 20 “isomorphism”, three “automorphism”, two “homomorphism”, one “morphism”, two “isomorphic” and one “isomorphically”. The six standalone φ symbols remain unchanged. This covers the summary, ownership, conventions, supplier contracts, Layers 1, 3, 4 and 5, and downstream consumers. No mathematical convention changed.

## Mathematical basis for the shared repair

Let S be either finite class set in §§5.5–5.6. Sending a pairwise nonisomorphic family to its classes is injective. Thus a bound on #S bounds every such family's size. Conversely, choose one representative for every member of S, indexed by Fin (#S), and apply the finite-family theorem. Representatives can be finite-dimensional intermediate fields of a fixed algebraic closure, so no universe restriction is introduced. Every number field embeds there. This proves both directions, without counting every embedding or introducing an automorphism weight.

For §5.5, the finite coefficient box and the finite field-factor sets make S finite. A surjective rational algebra map from the actual Jacobian-open algebra to a field identifies its target with a field factor: classify the source as a finite product of finite separable extensions and take the kernel of the surjection. Each factor's degree is positive; the sum of those degrees is the number of geometric points. The declared isolated-point Bézout contract bounds that sum by d^r even when other components have positive dimension. Consequently #S≤(2C+1)^(rM)d^r. Neither a free predicate standing for a model nor a hypothesis containing the counting conclusion occurs.

For §5.6, Hermite finiteness makes the inclusive exact-degree discriminant sublevel finite. Couveignes's models use one r=r(n) for all its fields. The coefficient logarithm is O((log n)^2+(log n/n)log H), and there are O(n(log n)^2) coefficient slots; the resulting logarithm is O(n(log n)^4+(log n)^3 log H). One enlarged constant gives exactly the stated exponents, with H=1 allowed. COU20 line 35, Theorem 2, p.488, and COU20 lines 385–430, §4, pp.495–496 supply the arithmetic argument. COU20 lines 425–430 also support the intermediate field-factor count.

The new statements are arithmetic counting results on the actual number-field and Jacobian-open carriers. They are not one-tactic consequences of the pins: the first needs the geometric multiplicity bound and the coefficient count; the second also needs the degree-uniform model theorem. Boundary examples remain prose Checks only.

## Source, ownership and citation verification

Read the complete legally cached published COU20 extraction, including the propositions, both headline theorems and the counting argument. Its certified publisher-open manifest entry already records this version; no new source, duplicate key or missing-reference request was needed. No source passage was copied into the package. Representative main roadmaps read for form and the continuation boundary were `Completed/EffectiveBounds/README.md` and `Completed/OrthogonalL2Bases/README.md`.

Read the cited contracts at the named open heads or on main, rather than treating review receipts as evidence:

| Supplier | Contracts resolved | Computed convention witness and consequence |
| --- | --- | --- |
| Completed/EffectiveBounds | Layers 1–2; pinned discriminant and fixed-ambient Hermite infrastructure | For ℚ(i), field discriminant −4 and absolute discriminant 4; the new count concerns classes, rather than the completed primitive-polynomial count. |
| GeometryOfNumbersAndQuadraticArithmetic, head 465728d, a new roadmap | §§0.1.2, 0.2.1, 0.2.6, 0.3.3, 1.1.2–1.1.5, 1.2.7, 1.5.21 | Diagonal/antidiagonal covolumes √2=√2; twice the primitive generator gives 2√2. Ball lower constants in dimensions 1,2,4 are 2,2,1. For 2ℤ and [−3,3], (2/3)·6=2·2=4. |
| GenericDoublePointInterpolation, supplied head d1d487c | §§0.1, 0.3, 1.3–1.4, 5.1–5.3 | In two variables at degree 2 there are 6 monomials; at one point columns (1,X) give determinant 1, swapped columns −1. The seven collinear degree-5 points have jet rank 11<21. Its parameter pullback assumes integer coefficients; the arithmetic pullback uses the pinned grid theorem over ℂ. |
| SchemeAndStackFoundations on main c44faf6 | §0.10 `jacobian_etale_algebra`; §5.12 `bezout_inequality` | X²−2 gives the field ℚ(√2); X² gives zero after localization. The system X(X−1),XY has a line and one isolated point, 1≤4. The precise arbitrary-dimensional isolated-point contract remains the existing gap. |
| ArithmeticStatisticsPartI, head 3b1a24f, a new roadmap | §0.7 “Number fields ordered by discriminant”; neighboring embedded/class-count comparison; §0.1 inclusive arithmetic-family count | Its `Embedded`, `isoSetoid`, `isoFamily` and `isoDegree` names occur at that head. A nonnormal cubic contributes three embedded fields and one class; a quadratic contributes one of each. No quotient is constructed here. |

The initial citation leads for `NumberFieldFamily.isoFamily` and `NumberFieldFamily.isoDegree` resolve in ArithmeticStatisticsPartI §0.7; they are supplier targets, not pinned declarations. A fresh citation resolver reports no missing roadmap citations and no missing Lean names. That resolver expressly says its host did not check the pinned Lake packages; the direct pin inspections below supply that part of the verification.

Object searches used the roadmap service over main and indexed open heads, the board's packages, and all 48 sibling folders whose paths the brief supplied. No supplied sibling owns these arithmetic counting theorems; GenericDoublePointInterpolation owns their interpolation input. Searches were by coefficient boxes, number-field classes, Jacobian-open models and Couveignes, and also checked the new names. Ownership against open pull requests without supplied files was not checked beyond the index searches. No foreign fully qualified declaration name was introduced.

The board also contains `packages/EffectiveBoundsCompactModels/design/README.md`, with overlapping compact-model and counting targets, but no package README or acceptance module. These repairs restore the already planned §§5.5–5.6 of EffectiveBoundsPartII; they do not create a new object or resolve that cross-package design overlap. A decision about consolidating the designs belongs to the maintainer; this round neither imports an invented supplier theorem nor changes the authorized scope.

The existing `gap:isolated-affine-bezout` already appears in both the README's exact supplier contracts and the plan's top-level gaps, naming SchemeAndStackFoundations §5.12. Its arbitrary-dimensional isolated-point and multiplicity-one requirements are unchanged. No supplier obligation, merge order or plan node was edited.

The checked library revisions equal the manifest pins: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Relevant direct inspections include:

| Pinned file | Declaration / actual boundary |
| --- | --- |
| Mathlib/NumberTheory/NumberField/Discriminant/Defs.lean:36,41,50 | `NumberField.discr`, `discr_ne_zero`, `discr_eq_discr_of_algEquiv`; signed integer discriminant and rational-isomorphism invariance. |
| Mathlib/NumberTheory/NumberField/Discriminant/Basic.lean:77,124,494 | `NumberField.rootDiscr`, `NumberField.mixedEmbedding.covolume_integerLattice`, `NumberField.finite_of_discr_bdd`; the root exponent is inverse finrank, covolume uses 2^(−r₂), finiteness requires a fixed characteristic-zero field and finite-dimensional intermediate fields. |
| Mathlib/NumberTheory/NumberField/House.lean:38,41,45,51,74,93 | House, embedding supremum, sum/product bounds, integer casts and lower bound 1 for nonzero integral elements. |
| Mathlib/NumberTheory/NumberField/CanonicalEmbedding/Basic.lean:79,212,637 | Supremum norm comparison, real mixed-space dimension, and the actual mixed-embedding lattice basis. |
| Mathlib/RingTheory/MvPolynomial/Basic.lean:95,164,174 | Native support basis and total-degree submodule. Membership bounds the sum of exponents; it is not a separate bound in each variable. |
| Mathlib/Algebra/MvPolynomial/Eval.lean:572; Mathlib/Algebra/MvPolynomial/PDeriv.lean:61 | Actual algebra evaluation and ordinary partial derivatives on native polynomials. |
| Mathlib/Combinatorics/Nullstellensatz.lean:62 | `MvPolynomial.eq_zero_of_eval_zero_at_prod_finset`; finite variables, integral-domain coefficients and each variable degree strictly below its grid cardinality. |
| Mathlib/RingTheory/Discriminant.lean:127,143 | Basis discriminant nonvanishing and embedding-determinant square under the separability hypotheses. |
| Mathlib/Algebra/Module/ZLattice/Covolume.lean:115,170 | Determinant-volume and relative-index comparison for full lattices in their common intrinsic space. |
| Mathlib/GroupTheory/Subgroup/Saturated.lean:62 | `AddSubmonoid.ker_saturated`; additive torsion-free target, with natural-multiple saturation and integer saturation via additive inverses. |
| Mathlib/RingTheory/Etale/Field.lean:194,271 | Formally étale classification has an essentially-finite-type hypothesis; the étale classification gives a finite product of finite separable fields, including the empty product. It does not prove the Jacobian criterion. |
| Mathlib/Data/Nat/Choose/Central.lean:36,78,123; Mathlib/Combinatorics/Enumerative/Catalan/Basic.lean:52,126 | Native central binomial sequence, its consecutive recurrence and exponential lower bound; Catalan sequence and (r+1)Fᵣ=choose(2r,r). |
| TauCeti/NumberTheory/EffectiveBounds/HermiteCount/Basic.lean:172,202; TauCeti/Algebra/Module/ZLattice/Covolume.lean:42 | Existing effective fixed-ambient count / primitive-polynomial bound, and `ZLattice.covolume_sq_eq_det_gram`. Neither is the new class-count estimate. |

## Elaboration and binder comparison

The required `lake env lean` elaboration of `packages/EffectiveBoundsPartII/Suggested.lean`, run from the content checkout, exited **0**. Exactly six warnings say that declarations use `sorry`, at lines 28, 39, 112, 132, 148 and 163. No error or other warning occurred. The file uses only `import Mathlib`; no Tau Ceti module build was required.

A separate scratch file containing the final module and `#check @name` for every one of its eleven declarations also elaborated with exit **0**, with the same six intended warnings. Compared each elaborated type with its README statement, including dependent field instances on both new families. No section binder was lost and no existing signature needed correction.

| Declaration | Binders retained and README match | Computed instance / result |
| --- | --- | --- |
| `exists_short_integral_basis` | K in arbitrary universe, Field K, NumberField K; §0.5 | ℚ: house(1)=1=δ²; ℚ(i): 1≤4. |
| `exists_bounded_first_jet_generators` | K, Field, NumberField, r,d, r≥1,d≥5,M≥n(r+1); §1.2 | ℚ,r=1,d=5: M=6,D=10,u=0, jet determinant 1. |
| `jacobianPolynomial` | Implicit r and actual ordered integer E; §4.1 | (X,Y) gives 1; (Y,X) gives −1; empty system gives 1. |
| `JacobianOpenAlgebra` | Same r,E; §4.1 | X²−2 gives ℚ(√2); X² gives zero; empty system gives ℚ. |
| `HasBoundedModel` | K, Field, NumberField, r,d,H; §4.2 | ℚ,E=X,κ=0,H=1 satisfies all clauses; E=X²,κ=0 fails J≠0. |
| `explicitCoefficientBound` | n,r,d,δ only; §4.2 and conventions | B(1,1,5,1)=13693063.93762915; B(0,1,5,1)=0; B(1,0,0,1)=1. |
| `exists_explicit_small_model` | K, Field, NumberField, r,d and all three range hypotheses; §4.2 | E=X over ℚ has height 1≤13693063.93762915. |
| `centralBinomialRank` | n:ℕ; §5.1 | r(0),r(1),r(2),r(14),r(15)=1,1,2,4,5. |
| `exists_logarithmic_small_models` | Q before all K, Field and NumberField instances and degree threshold; §5.2 | n=15 gives r=5,M=252 and ℓ=237; log B=90.04887857805613+10 log δ. |
| `bounded_systems_field_class_bound` | r,d,C,m, r≥1,d≥1; K:Fin m→Type u, every Field and NumberField instance, pairwise nonisomorphism and actual bounded-system surjections; §5.5 | Two quadratic classes: 2≤1485172; one rational class: 1≤54; m=0: 0≤positive RHS. |
| `discriminant_field_class_bound` | Q before n,H,m,K, both dependent instances, exact degrees, inclusive discriminants and pairwise nonisomorphism; §5.6 | n>Q≥3,H≥1 gives positive bases. H=1 forces m=0; at n=2,H=3 the sublevel has one class, testing equivalence outside the eventual range. |

## Adversarial mathematics pass

The tables record the mathematics independently of elaboration. A negative control is a computed failure outside the stated hypotheses, not a counterexample to the target. All unchanged general statements retain their stated hypotheses and source locators. Numerical matrix ranks, determinants, binomial values, floors and finite counts were recomputed; symbolic field and localization calculations are given explicitly below. No claim of independent acceptance is made.

| Statement | Instances tried and values on both sides | Result / change |
| --- | --- | --- |
| §0.1 pairing, canonical measure, house-body volume and gauge | ℚ: 2=2¹; ℚ(i): scaling determinant 2, disk volume 2π≥4; z=1 has gauge 1 and squared g-norm 2. | Correct; unchanged. |
| §0.2 discriminant covolume | ℚ(i), β=(1,i): Gram diag(2,2), determinant 4, covolume 2=√4. In ℚ(√5), rational-basis discriminant 20 versus field discriminant 5, ratio 4=2². | Actual integral-basis condition excludes wrong replacement; unchanged. |
| §0.3 ordered short half-family | n=1: product 1≤1. n=4,m=3: exponent 4/(2·2)=1; n=5,m=3: 5/(2·3)=5/6. | Strictly more than half retained; unchanged. |
| §0.4 product-span theorem | K=k,V=K gives dimensions 1=1. V=k in a quadratic gives product dimension 1<2 at equality 2dim V=n. In k⁴,V=k³×0 gives 3<4 despite 6>4. Inseparable degree-two field with V=K has product span dimension 2. | Field and strict inequality necessary; separability unnecessary; unchanged. |
| §0.5 short integral rational basis | ℚ houses 1≤1; ℚ(i) houses 1,1≤4; ℚ(√5) houses 1,√5≤5 with integral index 2. | Correct; unchanged. |
| §1.1 integral parameters and complex equivalence | α=(1,√5) gives determinant −2√5; parameters (0,1) give √5. α=(1,1) gives determinant 0. At n=1,D=3,κ=3 has house 3≤3. | Basis hypothesis and map direction correct; spelling repaired. |
| §1.2 arithmetic first jets | ℚ,r=1,d=5 gives M=6,D=10 and determinant 1 at 0. For the two conjugates ±√2, confluent four-column determinant is (2√2)^4=64. At coincident supports it is 0. | Surjectivity tied to actual embeddings; unchanged. |
| §1.3 value descent | √2: rational value dimension 2=degree. √5: rational dimension 2 but integral index 2. Zero tuple in a quadratic: dimension 1<2. | Rational/integral distinction correct; spelling repaired. |
| §2.1 relation kernel | κ=√2,d=3 gives rank 2=4−2 and Gram diag(5,5). κ=0 in a quadratic,d=2 gives rank 2≠3−2. d=0 gives kernel dimension 0. | Rank hypothesis retained; unchanged. |
| §2.2 transpose and index | √5,d=2 gives q=2, covol(S)=2√26=2covol(L⊥); √2,d=1 gives q=1. Multiplication by 2 on ℤ gives covolumes 2 versus 1. | Inclusion/index direction correct; unchanged. |
| §2.3 Gram/discriminant identity | √5 gives det(BBᵗ)=104=520/5; rational-basis substitution gives 26=520/20. ℚ(i) gives 1=4/4 whereas det(VVᵗ)=−4. | Conjugation and genuine integral basis retained; unchanged. |
| §2.4 monomial height | r=d=2,C₀=1 gives M=6,H₀=1,G=6. n=2,r=1,d=5 gives C₀=40δ²,H₀=40⁵δ¹⁰,G=6·40¹⁰δ²⁰. | Constant monomial and exponents correct; unchanged. |
| §2.5 relation covolume | √5 gives √26≤√(520/5)=2√26; κ=0 in ℚ gives 1≤√(1/1)=1. | Discriminant denominator and direction correct; unchanged. |
| §3.1 short relations | Intrinsic ball lower bounds at ℓ=1,2 are 2 and 2≤π. At √2,d=3 independent relation norms √5,√5 have product 5≤2·5=10. | Intrinsic measure and independent-witness convention correct; unchanged. |
| §3.2 truncation | n=2,ℓ=4 gives k=3 and codimension 1. Norms (1,2,4,8),G=4 give product 64=4²·4 and largest retained norm 4≤8. | Exactly n−1 discarded; unchanged. |
| §3.3 joint derivatives on kernel | At 0,d=1, X↦1; at d=0 rank 0. At 0,1 the derivative matrix of X(X−1),X²(X−1) is [[−1,0],[1,1]], determinant −1. | Full first jets required; unchanged. |
| §3.4 full retained block | Diagonal ℂ⊂ℂ² has codimension 1 and projection ranks 1,1. Hyperplane in ℂ⁴ has codimension 1 and ranks 1,2. Zero in ℂ² has codimension 2 and ranks 0,0. | Strict codimension threshold correct; unchanged. |
| §3.5 arithmetic common minor | X²−2 gives ±2√2. For θ³=2, Norm(3θ²)=3³·Norm(θ)²=27·4=108. X² at 0 gives 0. | Field-embedding injectivity propagates nonvanishing without normality; spelling repaired. |
| §4.1 Jacobian-open map | X²−2: (2√2)(√2/4)=1. X²: inverting nilpotent 2X gives zero. X(X−1): two ℚ factors. Dual numbers: (2ε)²=0 despite 2ε≠0. | Nonzero suffices in field targets; units required for general targets; spelling repaired. |
| §4.2 explicit models and bound | ℚ,E=X has height 1≤13693063.93762915. Plane system X(X−1),XY has J=X(2X−1), J(1,0)=1 and a line removed by localization. Doubling δ multiplies B by 1024. | Same κ,E and compatible map; no full-zero-locus dimension claim; spelling repaired. |
| §5.1 least rank | Catalan values at 0,…,5 are 1,1,2,5,14,42; r(0),r(1),r(2),r(14),r(15)=1,1,2,4,5. At n=1 the false all-degree bound reads 1≤0. | Eventual threshold retained; unchanged. |
| §5.2 logarithmic models | n=14 gives r=4,M=70; n=15 gives r=5,M=252, 90≤252≤360. For n=15, log B=90.04887857805613+10 log δ; at δ=1 the latter term is 0. | Uniform r(n) retained; theorem and proof locators repaired. |
| §5.3 bounded systems | r=0: 0 slots, 1 system; d=0: r slots; C=0: 1 system. r=d=2 gives 12 slots, versus incorrect 18. | Native polynomial subset determines the object; spelling repaired. |
| §5.4 cardinality and floor | r=1,d=2,C=1 gives 27; r=2,d=0,C=1 gives 9; r=0 gives 1⁰=1. B=3.7 gives seven integer choices, versus nine for ceiling. | Both directions of floor equivalence correct; unchanged. |
| §5.5 represented field classes / new finite-family headline | X⁴−5X²+6 gives 4 points, 2 factors, 2 classes, with 2≤13⁵·4=1485172. X(X−1) gives 2 points, 2 factors, 1 class, 1≤54. X² gives 0 throughout. | Added exact native-family signature and matching Checks. |
| §5.6 discriminant count / new finite-family headline | H=1,n>1 gives N=0 and log H=0. For n=2,H=3 only squarefree parameter D=−3 survives: discriminant −3 and N=1. A nonnormal cubic contributes 1 class versus 3 embedded copies. | Added exact finite-family signature, equivalence and boundary Checks; inclusive cutoff retained. |

### Individual API statements

Each ordinal follows the API bullet order in its README subsection.

| Statement | Instance and computed values | Result / change |
| --- | --- | --- |
| §0.1 API 1: Haar scaling | ℚ(i): scale 2¹=2, so a unit-area square has canonical area 2. | Holds with stated hypotheses; no mathematical change. |
| §0.1 API 2: Measurable-set identity | Empty set: 0=2·0; unit disk in ℂ: 2π=2·π. | Holds with stated hypotheses; no mathematical change. |
| §0.1 API 3: Pairing weights | Real (1,1) contributes 1; complex (1,1) contributes 2. | Holds with stated hypotheses; no mathematical change. |
| §0.1 API 4: House-body volume | ℚ: 2; ℚ(i): 2π; real quadratic: 4. | Holds with stated hypotheses; no mathematical change. |
| §0.1 API 5: Gauge agrees with house | At i∈ℚ(i), embedding moduli 1,1 give gauge=house=1; at 0 both are 0. | Holds with stated hypotheses; no mathematical change. |
| §0.3 API 1: Ordered independent witnesses | ℚ: singleton 1 has rank 1 and product 1≤δ^(1/2)=1. | Holds with stated hypotheses; no mathematical change. |
| §0.3 API 2: Prefix dimension | For a quadratic, 1 and an irrational integral element span dimension 2; a singleton spans 1. | Holds with stated hypotheses; no mathematical change. |
| §0.3 API 3: First m embedding bounds | ℚ(i): m=2, all moduli 1≤δ=2; n=5 tail exponent is 5/6≤1. | Holds with stated hypotheses; no mathematical change. |
| §0.3 API 4: Product bound | ℚ(i): product 1≤2^(2/2)=2. | Holds with stated hypotheses; no mathematical change. |
| §0.3 API 5: Witness gauge | At i the gauge is 1 and weighted Euclidean norm √2. | Holds with stated hypotheses; no mathematical change. |
| §1.1 API 1: Integral finite sum | α=(1,√5),u=(2,3): κ=2+3√5, an integral element. | Holds with stated hypotheses; no mathematical change. |
| §1.1 API 2: Embedding sum | The same tuple has images 2+3√5 and 2−3√5, exactly the two sums. | Holds with stated hypotheses; no mathematical change. |
| §1.1 API 3: Invertible complex configuration map | Embedding determinant for (1,√5) is −2√5≠0; repeated (1,1) gives 0. | Holds with stated hypotheses; no mathematical change. |
| §1.1 API 4: Parameter house bound | ℚ,D=3,u=3: house 3≤1·3·1=3; u=0 gives 0≤3. | Holds with stated hypotheses; no mathematical change. |
| §1.1 API 5: Reindexing and basis change | Swapping (1,√5) and (2,3) gives 3√5+2=2+3√5. Replacing basis (1,√5) by (1,1+√5) sends (2,3) to (−1,3), preserving −1+3(1+√5)=2+3√5. | Holds with stated hypotheses; no mathematical change. |
| §2.1 API 1: Kernel definition | At κ=0,d=2, (a,b,c) maps to a; kernel is a=0. | Holds with stated hypotheses; no mathematical change. |
| §2.1 API 2: Kernel membership iff | X²−2 at √2: degree 2≤3 and value 0, so it belongs; X has value √2≠0 and is excluded. | Holds with stated hypotheses; no mathematical change. |
| §2.1 API 3: Rank with value surjectivity | At √2,d=3: rank kernel 2=M−n=4−2. | Holds with stated hypotheses; no mathematical change. |
| §2.1 API 4: Saturation | At 0, if 2(a+bX+cX²) evaluates to 0, then 2a=0 in ℤ, hence a=0. Multiplier 0 would falsely admit 1. | Holds with stated hypotheses; no mathematical change. |
| §2.1 API 5: Complex span comparison | At √2,d=3, both conjugate evaluations vanish on X²−2 and X³−2X; their independent span and the value kernel both have complex dimension 2. | Holds with stated hypotheses; no mathematical change. |
| §2.1 API 6: Degree inclusion | X²−2 lies in both degree-2 and degree-3 kernels, with coefficient inclusion (−2,0,1)↦(−2,0,1,0) and value 0. | Holds with stated hypotheses; no mathematical change. |
| §2.2 API 1: Transpose map | For β=(1,(1+√5)/2), the two dual basis maps give rows (1,−1,5),(0,2,0). | Holds with stated hypotheses; no mathematical change. |
| §2.2 API 2: Transpose coordinates | At exponent 1 the same dual values are −1 and 2, since √5=−1+2β₂. | Holds with stated hypotheses; no mathematical change. |
| §2.2 API 3: Transpose injectivity | These two rows are independent (minor 2≠0); rank is 2. | Holds with stated hypotheses; no mathematical change. |
| §2.2 API 4: Image lies in orthogonal | Both rows pair to 0 with (−5,0,1); image and orthogonal have rank 2. | Holds with stated hypotheses; no mathematical change. |
| §2.2 API 5: Index/covolume | For √5,d=2: [L⊥:S]=2=[𝓞:image], and √104=2√26. | Holds with stated hypotheses; no mathematical change. |
| §2.2 API 6: Integral basis invariance | Swap β entries: transpose rows swap, determinant sign reverses and Gram determinant stays 104. | Holds with stated hypotheses; no mathematical change. |
| §3.1 API 1: Independent ordered product witnesses | At √2,d=3 the two relation norms √5,√5 are ordered; product 5≤2·5=10. | Holds with stated hypotheses; no mathematical change. |
| §3.1 API 2: Degree and vanishing | X²−2 and X³−2X have degrees 2,3≤3 and values 0,0 at √2. | Holds with stated hypotheses; no mathematical change. |
| §3.1 API 3: Real and complex basis | Vectors (−2,0,1,0),(0,−2,0,1) have independent pivots 1,1, hence span rank 2 over both fields. | Holds with stated hypotheses; no mathematical change. |
| §3.1 API 4: Nonzero integer-vector norm | X has norm 1; rational constant 1/2 has norm 1/2 and is excluded. | Holds with stated hypotheses; no mathematical change. |
| §3.1 API 5: Coefficient domination | X²−2: largest modulus 2≤√5; constant 1 attains 1=1. | Holds with stated hypotheses; no mathematical change. |
| §4.1 API 1: Jacobian determinant evaluation | E=X²−2,κ=3 gives det[6]=6, not E(3)=7. | Holds with stated hypotheses; no mathematical change. |
| §4.1 API 2: Naturality under ring maps | √2↦−√2 sends 2√2 to −2√2, both nonzero. Modulo 2, derivative 2X maps to 0, so noninjective maps need not preserve nonvanishing. | Holds with stated hypotheses; no mathematical change. |
| §4.1 API 3: Localization evaluation and units | At √2, inverse is √2/4 and product 1; in dual numbers 2ε≠0 but its square 0 excludes a unit. | Holds with stated hypotheses; no mathematical change. |
| §4.1 API 4: Compatibility on polynomials | For f=X+1 at √2, both quotient-map evaluation and direct evaluation equal √2+1. | Holds with stated hypotheses; no mathematical change. |
| §4.1 API 5: Image of inverse Jacobian | At √2, J⁻¹ maps to √2/4; using −√2/4 would give product −1. | Holds with stated hypotheses; no mathematical change. |
| §4.1 API 6: Uniqueness of compatible map | For X²−2, agreeing on X=√2 forces inverse Jacobian √2/4; the conjugate map X↦−√2 fails that specified evaluation. | Holds with stated hypotheses; no mathematical change. |
| §4.1 API 7: Surjectivity | The images of 1 and X are 1,√2, a dimension-2 rational basis of the target. | Holds with stated hypotheses; no mathematical change. |
| §4.1 API 8: Component projection | For (X²−2)(X²−3), projection of the two-field product onto either factor is onto; dimensions are 4→2. | Holds with stated hypotheses; no mathematical change. |
| §4.1 API 9: Rational/integer determinant compatibility | For E=(X,Y), both give 1; for the reversed equations, both give −1 over ℚ. | Holds with stated hypotheses; no mathematical change. |
| §4.1 API 10: Quotient and localization maps | For X²−2, its quotient class is 0 and (class 2X)·(class X/4)=1; source is ℚ[X], then the quotient, target A_E. | Holds with stated hypotheses; no mathematical change. |
| §4.1 API 11: Row transposition and principal open | For (X,Y) versus (Y,X), determinants 1 and −1 define identical opens. For X² the Jacobian 2X gives the zero localization, whereas inverting 1 would retain the nonzero dual-number algebra. | Holds with stated hypotheses; no mathematical change. |
| §4.2 API 1: Same point and equations throughout | E=X²−2 at √2 has E(κ)=0,J=2√2; falsely substituting κ=√3 gives E(κ)=1. | Holds with stated hypotheses; no mathematical change. |
| §4.2 API 2: Monotonicity and transport | E=X²−2 has degree/height 2/2, so satisfies bounds 2/2 and 5/3. Conjugation sends κ=√2 to −√2, preserving E=0 and changing J to −2√2. | Holds with stated hypotheses; no mathematical change. |
| §4.2 API 3: Positivity and expansion of explicit bound | n=1,r=1,d=5,δ=1: ℓ=5 and both formulas give 5^(5/2)√6·10⁵=13693063.93762915>0. | Holds with stated hypotheses; no mathematical change. |
| §4.2 API 4: Unique compatible surjection | At √2, agreement on X forces φ(X)=√2 and φ(J⁻¹)=√2/4, whose product with 2√2 is 1. | Holds with stated hypotheses; no mathematical change. |
| §5.1 API 1: Least admissible positive index | n=1: r=1; n=2: r=2; n=15: r=5. | Holds with stated hypotheses; no mathematical change. |
| §5.1 API 2: Positivity, admissibility, minimality | n=15: r=5>0,15·6=90≤252; at s=4,15·5=75>70. | Holds with stated hypotheses; no mathematical change. |
| §5.1 API 3: Monomial interval | n=15: 90≤252≤360; n=1:2≤2≤8. | Holds with stated hypotheses; no mathematical change. |
| §5.1 API 4: Eventual size bounds | At n=65536, r=12 and 5≤12≤3log65536≈33.271; n=1 would give 1≤0 and is excluded by the eventual threshold. | Holds with stated hypotheses; no mathematical change. |
| §5.1 API 5: Monotonicity | r(1)=1≤r(2)=2≤r(14)=4≤r(15)=5. | Holds with stated hypotheses; no mathematical change. |
| §5.3 API 1: Native subset membership | r=1,d=2,C=1 admits X²−1 (height 1,degree 2) and rejects 2X (height 2). | Holds with stated hypotheses; no mathematical change. |
| §5.3 API 2: Zero polynomial included | At C=0 the zero polynomial has degree 0≤d and every coefficient 0≤0. | Holds with stated hypotheses; no mathematical change. |
| §5.3 API 3: Coefficient product equivalence | r=2,d=2 gives 2·6=12 independent slots; r=0 gives 0 slots and one empty assignment. | Holds with stated hypotheses; no mathematical change. |
| §5.3 API 4: Finiteness | r=1,d=2,C=1 gives 3³=27; r=d=C=0 gives 1. | Holds with stated hypotheses; no mathematical change. |
| §5.3 API 5: Box inclusions | X at bounds d=1,C=1 remains at d=2,C=2; shrinking C to 0 rejects its coefficient 1. | Holds with stated hypotheses; no mathematical change. |
| §5.3 API 6: Projection to degree submodule | For E=(X²,Y), both degrees 2 and 1≤2; X²Y² has degree 4>2 and is rejected. | Holds with stated hypotheses; no mathematical change. |

### Individual README Checks

Each ordinal follows the final README Check order. This covers all 100 Checks, including the two added bullets and the expanded duplicate/empty-family controls.

| Statement | Instances and computed values | Result / change |
| --- | --- | --- |
| §0.1 Check 1 | ℚ: interval length 2=2¹, versus wrong 1. | Pass, including excluded negative controls; no change. |
| §0.1 Check 2 | ℚ(i): canonical disk volume 2π=2·π, versus wrong π. | Pass, including excluded negative controls; no change. |
| §0.1 Check 3 | Real quadratic: r₂=0, scale 1 and house-square volume 4=4. | Pass, including excluded negative controls; no change. |
| §0.1 Check 4 | Complex coordinate 1: gauge 1, squared g-norm 2, norm √2. | Pass, including excluded negative controls; no change. |
| §0.2 Check 1 | ℚ: Gram determinant 1, covolume 1=√1. | Pass, including excluded negative controls; no change. |
| §0.2 Check 2 | ℚ(i): Gram diag(2,2), determinant 4, canonical covolume 2 versus product covolume 1. | Pass, including excluded negative controls; no change. |
| §0.2 Check 3 | ℚ(√5): basis discriminants 20 and 5; their ratio 4 is index²=2². | Pass, including excluded negative controls; no change. |
| §0.3 Check 1 | ℚ: n=m=1,ω₁=1,δ=1,product 1≤1. | Pass, including excluded negative controls; no change. |
| §0.3 Check 2 | n=4: m=3,2m=6>4; third exponent 4/(2·2)=1. | Pass, including excluded negative controls; no change. |
| §0.3 Check 3 | n=5: m=3,third exponent 5/(2·3)=5/6≤1. | Pass, including excluded negative controls; no change. |
| §0.4 Check 1 | K=k,V=K: 2dim V=2>1,product-span dimension 1. | Pass, including excluded negative controls; no change. |
| §0.4 Check 2 | Quadratic,V=ℚ: 2dim V=2=n,product-span dimension 1<2. | Pass, including excluded negative controls; no change. |
| §0.4 Check 3 | 𝔽₂(t)/𝔽₂(t²),V=K: products 1·1=1 and 1·t=t span dimension 2. | Pass, including excluded negative controls; no change. |
| §0.4 Check 4 | k⁴,V=k³×0: dimension 3,2dim=6>4,product-span dimension 3<4. | Pass, including excluded negative controls; no change. |
| §0.5 Check 1 | ℚ: basis 1,house 1=δ²; n=0 would force 1=0 and cannot be a field. | Pass, including excluded negative controls; no change. |
| §0.5 Check 2 | ℚ(i): houses 1,1≤δ²=4. | Pass, including excluded negative controls; no change. |
| §0.5 Check 3 | ℚ(√5): houses 1,√5≤δ²=5; integral index 2. | Pass, including excluded negative controls; no change. |
| §1.1 Check 1 | ℚ: α=1,u=3 gives κ=3·1=3. | Pass, including excluded negative controls; no change. |
| §1.1 Check 2 | Zero parameters in a quadratic: κ=0 and repeated value rows (1,0,…) have rank 1<2. | Pass, including excluded negative controls; no change. |
| §1.1 Check 3 | ℚ(√5): (1,√5) has integral coordinate determinant 2 and index 2; still rational rank 2. | Pass, including excluded negative controls; no change. |
| §1.1 Check 4 | Repeated (1,1): embedding matrix all ones, determinant 0. | Pass, including excluded negative controls; no change. |
| §1.2 Check 1 | ℚ,r=1,d=5: M=6≥2,D=10,u=0,jet columns (1,X) give determinant 1. | Pass, including excluded negative controls; no change. |
| §1.2 Check 2 | Quadratic,zero tuple: two identical value rows and two identical derivative rows; full jet rank 2<4. | Pass, including excluded negative controls; no change. |
| §1.2 Check 3 | For D=2, T(T−1) has values 0,0,2 at 0,1,2; for D=0,empty product 1 has value 1=0!. | Pass, including excluded negative controls; no change. |
| §1.2 Check 4 | Seven points (i,0),d=5: horizontal value/derivative rank 6 plus vertical rank 5 gives 11<21. | Pass, including excluded negative controls; no change. |
| §1.3 Check 1 | At √2, values 1,√2 have rational rank 2=degree. | Pass, including excluded negative controls; no change. |
| §1.3 Check 2 | At √5, values span rank 2 over ℚ but integral image has index 2 in 𝓞_K. | Pass, including excluded negative controls; no change. |
| §1.3 Check 3 | At 0 in a quadratic, all values lie in ℚ and rank is 1<2. | Pass, including excluded negative controls; no change. |
| §2.1 Check 1 | At 0,d=2: kernel vectors (0,1,0),(0,0,1),rank 2; constant 1 maps to 1≠0. | Pass, including excluded negative controls; no change. |
| §2.1 Check 2 | At d=0: kernel rank 0; in degree 2 field,constant image dimension 1<2 despite natural subtraction 1−2=0. | Pass, including excluded negative controls; no change. |
| §2.1 Check 3 | At √2,d=3: relation vectors (−2,0,1,0),(0,−2,0,1),rank 2=4−2,norm squares 5,5 and dot product 0. | Pass, including excluded negative controls; no change. |
| §2.1 Check 4 | At κ=1/2, X maps to 1/2∉ℤ, excluding an evaluation into 𝓞_ℚ. | Pass, including excluded negative controls; no change. |
| §2.1 Check 5 | At 0 in a quadratic,d=2: actual kernel rank 2,whereas M−n=3−2=1. | Pass, including excluded negative controls; no change. |
| §2.2 Check 1 | At √5,d≥1: image ℤ+ℤ√5,index 2; transpose also index 2. Higher powers add no new integral lattice. | Pass, including excluded negative controls; no change. |
| §2.2 Check 2 | At √2,d≥1: 1,√2 form an integral basis,index 1 and S=L⊥. | Pass, including excluded negative controls; no change. |
| §2.2 Check 3 | ℤ→ℤ,z↦2z: kernel dimension 0,covolume 1; orthogonal ℤ,covolume 1; image 2ℤ,covolume 2. | Pass, including excluded negative controls; no change. |
| §2.3 Check 1 | ℚ(i),κ=i: B=I₂,det(BBᵗ)=1; det(VV*)=4,4/4=1; det(VVᵗ)=−4. | Pass, including excluded negative controls; no change. |
| §2.3 Check 2 | ℚ(√5): BBᵗ=[[27,−2],[−2,4]],det=104; VV*=[[31,21],[21,31]],det=520; 520/5=104. | Pass, including excluded negative controls; no change. |
| §2.3 Check 3 | Rational basis (1,√5): Gram diag(26,1),det=26; 520/20=26≠520/5=104. | Pass, including excluded negative controls; no change. |
| §2.4 Check 1 | r=d=2,C₀=1: M=6 not 9,H₀=1,G=6. | Pass, including excluded negative controls; no change. |
| §2.4 Check 2 | κ=0: constant monomial value 1,all positive-degree monomial values 0; false C₀=0 would give H₀=0<1. | Pass, including excluded negative controls; no change. |
| §2.4 Check 3 | n=2,r=1,d=5: D=20,C₀=40δ²,H₀=40⁵δ¹⁰,G=6·40¹⁰δ²⁰. | Pass, including excluded negative controls; no change. |
| §2.5 Check 1 | √5,d=2: L generated by (−5,0,1),norm √26; transpose covolume √104=2√26. | Pass, including excluded negative controls; no change. |
| §2.5 Check 2 | Same example: √(520/5)=2√26 rather than √520. | Pass, including excluded negative controls; no change. |
| §2.5 Check 3 | κ=0 over ℚ,d=2: orthonormal kernel X,X²,covolume 1; value-Gram determinant and discriminant both 1. | Pass, including excluded negative controls; no change. |
| §3.1 Check 1 | X²−2: coefficient norm √5,maximum coefficient 2,evaluated value 0. | Pass, including excluded negative controls; no change. |
| §3.1 Check 2 | Integer monomial X has norm 1; rational constant 1/2 has norm 1/2<1 and lies outside the lattice. | Pass, including excluded negative controls; no change. |
| §3.1 Check 3 | Vectors (2,0),(0,1) have real rank 2 and determinant 2,integral index 2 rather than 1. | Pass, including excluded negative controls; no change. |
| §3.1 Check 4 | Intrinsic line: interval volume 2=2¹·1^(−1/2); its area in a plane is 0. | Pass, including excluded negative controls; no change. |
| §3.1 Check 5 | ℓ=2: cube half-side 1/√2,area 2,vertex norm 1; disk area π≥2; half-side 1 gives vertex norm √2>1. | Pass, including excluded negative controls; no change. |
| §3.2 Check 1 | n=2,r=1,d=5: M=6,ℓ=4,k=3,codimension 1 and last retained tail length 2. | Pass, including excluded negative controls; no change. |
| §3.2 Check 2 | n=1: k=ℓ,discard count 0 and codimension 0; discarding one gives codimension 1=n. | Pass, including excluded negative controls; no change. |
| §3.2 Check 3 | Norms (1,2,4,8): product 64=4²·4; largest retained value 4≤4^(4/4)√4=8. | Pass, including excluded negative controls; no change. |
| §3.3 Check 1 | At 0,d=1: kernel span X and derivative X↦1,rank 1. | Pass, including excluded negative controls; no change. |
| §3.3 Check 2 | At 0,d=0: value rank 1,kernel dimension 0 and derivative rank 0. | Pass, including excluded negative controls; no change. |
| §3.3 Check 3 | At 0,1: columns (−1,1),(0,1),determinant −1,rank 2. | Pass, including excluded negative controls; no change. |
| §3.4 Check 1 | n=2,r=1: diagonal in ℂ² has codimension 1 and ranks 1,1. | Pass, including excluded negative controls; no change. |
| §3.4 Check 2 | n=r=2: first-coordinate hyperplane in ℂ⁴ has codimension 1 and block ranks 1,2. | Pass, including excluded negative controls; no change. |
| §3.4 Check 3 | Zero in ℂ²: codimension 2=n,block ranks 0,0. | Pass, including excluded negative controls; no change. |
| §3.5 Check 1 | θ³=2: Norm(θ)=2,Norm(3θ²)=27·4=108; each conjugate derivative modulus 3·2^(2/3). | Pass, including excluded negative controls; no change. |
| §3.5 Check 2 | X²−2: derivative values 2√2,−2√2,both nonzero. | Pass, including excluded negative controls; no change. |
| §3.5 Check 3 | X² at 0: derivative 0,so no field-valued localization map. | Pass, including excluded negative controls; no change. |
| §4.1 Check 1 | X²−2 at √2: inverse √2/4 and product (2√2)(√2/4)=1; localized algebra has degree 2. | Pass, including excluded negative controls; no change. |
| §4.1 Check 2 | (X²−2)(X²−3): four roots,two degree-2 factors; derivative values −2√2 and 2√3 retain both. | Pass, including excluded negative controls; no change. |
| §4.1 Check 3 | X²: derivative 2X squares to 0 in quotient; inverting it forces 1=0,so no map onto ℚ. | Pass, including excluded negative controls; no change. |
| §4.1 Check 4 | X²−2 at 3: evaluated derivative 6 versus polynomial value 7. | Pass, including excluded negative controls; no change. |
| §4.1 Check 5 | X² at 0: evaluated derivative 0,no inverse mapping to a unit. | Pass, including excluded negative controls; no change. |
| §4.1 Check 6 | (X,Y): determinant 1; reversed system (Y,X): determinant −1,same quotient and localization. | Pass, including excluded negative controls; no change. |
| §4.1 Check 7 | r=0: empty determinant 1; in zero ring the same 1 equals 0. | Pass, including excluded negative controls; no change. |
| §4.1 Check 8 | Dual numbers: ε²=0,E(ε)=0,J(ε)=2ε≠0 but (2ε)²=0,so not a unit. | Pass, including excluded negative controls; no change. |
| §4.1 Check 9 | 𝔽₂: derivative of X²−X is 1,of X² is 0; 𝔽₃: derivative of X³−X is −1=2. | Pass, including excluded negative controls; no change. |
| §4.2 Check 1 | ℚ,r=1,d=5: M=6,ℓ=5,E=X at 0,height 1≤13693063.93762915,J=1. | Pass, including excluded negative controls; no change. |
| §4.2 Check 2 | ℚ(√2),E=X²−2: degree 2≤5,height 2,J=2√2≠0 and component algebra degree 2. | Pass, including excluded negative controls; no change. |
| §4.2 Check 3 | X(X−1),XY: J=X(2X−1),J(1,0)=1; J vanishes along line X=0,so open algebra is ℚ. | Pass, including excluded negative controls; no change. |
| §4.2 Check 4 | Raising H from 2 to 3 preserves height-2 equations; zero function sends 1 to 0≠1 and is not a field-target algebra map. | Pass, including excluded negative controls; no change. |
| §4.2 Check 5 | n=1,r=1,d=5: δ↦2δ multiplies B by 2^(2·5)=1024. | Pass, including excluded negative controls; no change. |
| §4.2 Check 6 | n=0,r=1,d=5,δ=1: ℓ=6,real division 6/0=0,6^0=1 and positive-degree factor 0⁵=0,so B=0. | Pass, including excluded negative controls; no change. |
| §5.1 Check 1 | n=1: r=1,Catalan 1; n=2: r=2,Catalan 2; choose(2,1)=2,choose(4,2)=6. | Pass, including excluded negative controls; no change. |
| §5.1 Check 2 | r(14)=4,r(15)=5 because F₄=14,F₅=42. | Pass, including excluded negative controls; no change. |
| §5.1 Check 3 | r(1)=1>3log1=0. | Pass, including excluded negative controls; no change. |
| §5.1 Check 4 | n=0: smallest positive admissible index 1,so r(0)=1. | Pass, including excluded negative controls; no change. |
| §5.2 Check 1 | n=14: r=4,M=70; n=15: r=5,M=252 and 90≤252≤360; only the latter has d≥5. | Pass, including excluded negative controls; no change. |
| §5.2 Check 2 | n=1: any Q gives Qlog1=0<r(1)=1. | Pass, including excluded negative controls; no change. |
| §5.2 Check 3 | δ=1: height logarithm Q(log n)²; doubling δ adds Qlog n·log2,with no division by logδ. | Pass, including excluded negative controls; no change. |
| §5.3 Check 1 | r=0: 0 coefficient slots,one empty tuple,cardinality 1. | Pass, including excluded negative controls; no change. |
| §5.3 Check 2 | d=0: M=1,r slots and (2C+1)^r choices. | Pass, including excluded negative controls; no change. |
| §5.3 Check 3 | C=0: exactly one zero tuple for every d. | Pass, including excluded negative controls; no change. |
| §5.3 Check 4 | r=d=2: M=6,total slots 12; coordinatewise degree would give 9 per equation and 18 overall,including forbidden degree-4 X²Y². | Pass, including excluded negative controls; no change. |
| §5.4 Check 1 | r=1,d=2,C=1: 3³=27. | Pass, including excluded negative controls; no change. |
| §5.4 Check 2 | B=3.7: floor 3,integers −3,…,3 give 7; ceiling 4 would give 9. | Pass, including excluded negative controls; no change. |
| §5.4 Check 3 | r=0: count 1,also at C=0; r=2,d=0,C=1: 3²=9. | Pass, including excluded negative controls; no change. |
| §5.5 Check 1 | X⁴−5X²+6: 4 points,2 factors,2 classes; distinct discriminants 8,12; at r=1,d=4,C=6,2≤13⁵·4=1485172. | Counting formulation tested; README expanded. |
| §5.5 Check 2 | X(X−1): 2 points,2 rational factors,1 class. Two copies violate hsep via the identity equivalence; one gives 1≤3³·2=54. | Counting formulation tested; README expanded. |
| §5.5 Check 3 | X²: 0 geometric points,0 factors,0 represented classes. | Counting formulation tested; README expanded. |
| §5.5 Check 4 | Plane line-plus-point system: isolated count 1≤2²=4 despite the line. | Counting formulation tested; README expanded. |
| §5.5 Check 5 | m=0: 0≤positive RHS; at C=0,r≥1,Jacobian=0 and A_E=0,so a nonempty family cannot have field-target surjections. | Counting formulation tested; README expanded. |
| §5.6 Check 1 | H=1,n>1: N=0,m=0,logH=0; n>Q,H≥1 makes both real-power bases positive,so 0≤RHS. | Counting formulation tested; README expanded. |
| §5.6 Check 2 | Nonnormal cubic: automorphism cardinality 1,embedded multiplicity 3/1=3,class contribution 1. | Counting formulation tested; README expanded. |
| §5.6 Check 3 | n=1,H=1: class count 1 but r=1>Qlog1=0; degree threshold excludes this parameter inference. | Counting formulation tested; README expanded. |
| §5.6 Check 4 | n=2,H=3: squarefree D=−3 gives discriminant −3; D=−2,−1,2,3 give −8,−4,8,12 and are excluded; class count and maximal distinct-family size both 1. | Counting formulation tested; README expanded. |

### Conventions, defining expressions and worked examples

| Statement | Instances and computed values | Result / change |
| --- | --- | --- |
| Number-field degree and denominator convention | ℚ has n=1 and discr=1; ℚ(i) has n=2 and discr=−4. Thus n≠0 and absolute discriminants 1,4 are nonzero. Degree 0 would give field dimension 0 and force 1=0. | Positive denominators in every arithmetic target; unchanged. |
| Root discriminant and its powers | ℚ: δ=1; ℚ(i): δ=4^(1/2)=2,δ²=4; ℚ(√5): δ=√5,δ²=5. | Signed discriminant is made absolute before real powers; unchanged. |
| Mixed-space measure versus coefficient measure | ℚ(i) has product covolume 1 and canonical covolume 2; the coefficient vector of X²−2 has squared norm 5 and evaluated value 0. | Neither metric can replace the other; unchanged. |
| Complex inner-product direction | Rows 1,i give VV*=[[1,−i],[i,1]] and native Gram=[[1,i],[−i,1]], both determinant 0 and diagonal 1,1. The full embedding matrix of ℚ(i) gives det(VV*)=4 versus det(VVᵗ)=−4. | Two-row convention and discriminant witness agree in supplier and consumer; unchanged. |
| Ordinary derivative normalization | X² at 3 gives 6, versus factorial-normalized derivative 3; over 𝔽₂ the derivative of X² is 0 and of X²−X is 1. | No factorial division or good-prime restriction; unchanged. |
| Model-range parameters | At n=2,r=1,d=5: M=6,ℓ=4,D=20,C₀=40δ²,H₀=40⁵δ¹⁰,G=6·40¹⁰δ²⁰. Hence ℓ≥nr=2 and k=ℓ+1−n=3≥1. | Subtraction and real exponents in positive range; unchanged. |
| Total-function boundary of the coefficient bound | At n=0,r=1,d=5,δ=1: exponent 6/0=0 and B=0; at n=1,r=d=0,δ=1: M=1,ℓ=0,0^0=1 and B=1. | Definition is total; existence theorem excludes these parameters. |
| Model predicate at empty/negative parameters | For r=d=0,K=ℚ, the empty system gives J=1 and A_E=ℚ even for H<0 because there are no equation coefficients. For r≥1,H<0, any outside-support coefficient is 0 and 0≤H fails. | Predicate's actual boundary agrees with its body; no existence theorem at negative H. |
| Zero ring, zero polynomial and unit test | Zero polynomial has total degree 0 and all coefficients 0. In a zero ring, empty determinant 1=0. For r≥1 with zero equations, det J=0, localization has 1=0 and cannot surject onto a field. | Generic definitions allow the zero ring; number fields are nontrivial. |
| Empty lattice and intrinsic volume | Zero lattice in its zero-dimensional span has covolume 1; a unit interval in a surrounding plane has ambient area 0 but intrinsic length 2. | Rank-zero and lower-rank measures remain distinct; unchanged. |
| Class equivalence versus embedded multiplicity | For θ³=2 the normal closure has nonabelian Galois group S₃, with field stabilizer of order 2: 6/2=3 embedded cubic subfields but one class. For ℚ(√2), the cyclic group C₂ yields one embedded subfield and one class. | Pairwise absence of rational algebra equivalences removes all repeated embeddings; unchanged counting convention. |
| Inclusive integer height and coefficient floor | H=3 includes discriminant −3 because 3≤3; H=2 excludes it. Coefficient B=3.7 admits integers −3,…,3 (seven); B=0 admits only 0. | Equality at cutoff retained; no division by log H. |
| Universal constant and eventual bounds | log1=0 whereas r(1)=1. At n=15, r=5,M=252 and log B=90.04887857805613+10logδ; these data alone do not certify n>Q for the unspecified constant. | No numerical Q or all-degree estimate introduced. |
| Worked example: integral index | Coordinate rows (1,−1,5),(0,2,0) have Gram determinant 104. Relation (−5,0,1) has norm √26. Thus covol(S)=√104=2√26, q=2 and det(VV*)=520=5·104. | Saturation, transpose index and discriminant formula agree; unchanged. |
| Worked example: all gradient blocks | ℓ=4,n=2,k=3 gives codimension 1. If the joint derivative map has rank 2, its kernel has dimension 2, so a three-dimensional retained space cannot be contained in it. The equation X²−2 gives derivatives ±2√2; X³−2 gives norm 108. | All-block argument and common arithmetic minor agree; spelling correction only. |
| Worked example: several classes | X⁴−5X²+6 has derivatives 2X(2X²−5), giving −2√2 and 2√3 in the two factors. X(X−1) has two rational factors of one class. X² has no retained factor. Plane system X(X−1),XY retains one point, 1≤4. | Same components used by old and new counting formulations; unchanged example. |
| Worked example: uniform height | At n=15,r=5, rM=1260 and factor bound r^r=3125. At H=1, the height contribution involving log H is exactly 0; at H>1 it contributes Q₀(rM/n)log n·log H. | Logarithmic orders give the two displayed exponents; running-head locator repaired. |

## Required checks and final scope

- Acceptance module elaboration: **exit 0**, six intended `sorry` warnings and no errors, as detailed above.
- All eleven explicit `#check @name` signatures: **exit 0**; all expected field instances, range assumptions and dependent-family hypotheses retained. No implicit-hypothesis repair was needed.
- Required dependency check: **exit 0**, with exact output:

```text
depcheck: 49 roadmaps, 558 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line in this run against the supplied merge order. No tooling or order file changed.

- `git diff --check`: **exit 0**, no output.
- Spelling search: in-word φ occurrences **29 → 0**; standalone φ occurrences **6 → 6**. No stale “four headlines”, missing-carrier claim or COU20 running-head locator remains in either edited deliverable.
- README/Lean name agreement: all **11** own declarations occur in the README, including both new headlines; no prior name was removed. The import remains the single `import Mathlib`; no admitted data, boundary theorem, extra definition, `set_option` or padding was introduced.
- Source manifest, metadata and design plan are unchanged. The existing supplier gap is unchanged. No gate failure was supplied in the brief beyond the review findings; the two citation leads were resolved as supplier targets, not treated as mathematical defects.

Only `packages/EffectiveBoundsPartII/README.md`, `packages/EffectiveBoundsPartII/Suggested.lean` and this report were edited. There are no commits or external writes. All launched Lean and roadmap-check processes have finished. The changes require the fresh independent review specified in the brief; this repair report is not acceptance. Downstream users gain two headline names and lose none. The maintainer should retain the existing Bézout supplier obligation and decide the separately recorded design overlap without treating either as discharged by these acceptance signatures.
