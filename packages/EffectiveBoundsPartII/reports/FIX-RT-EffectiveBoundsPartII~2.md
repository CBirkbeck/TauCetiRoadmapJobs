# EffectiveBoundsPartII repair report

## F01 (P3) — applied

§5.5’s selected-system dependency → explicit SchemeAndStackFoundations §0.10 input for every box system. Updated the proof route, Needs line, Layer 5 dependency summary and existing degree-two Check. The Check now computes J(0)=−1 and J(1)=1. No theorem, definition, parameter range or Lean signature changed.

The finding belongs to pass b. Pass a establishes no new finding. Both reviews’ historical round-one entries describe completed repairs, not additional outstanding findings: both counting headlines remain present, the Theorem 1 locator remains COU20 line 20, and the word-corruption witness remains absent.

Evidence: SchemeAndStackFoundations on main, `TauCetiRoadmap/SchemeAndStackFoundations/README.md:900`, §0.10, supplies the localized-Jacobian algebra’s étaleness and finite presentation for arbitrary square polynomial systems. Its statement does not impose d≥5 or require a chosen arithmetic point. Pinned `Mathlib/RingTheory/Etale/Field.lean:271`, `Algebra.Etale.iff_exists_algEquiv_prod`, then supplies a finite product of finite separable fields over ℚ. For E=X²−X, J=2X−1 and ℚ[X]/(E)≃ℚ×ℚ; J maps to (−1,1), a unit. Thus localization preserves both factors, while only one isomorphism class is represented. The box contains 3³=27 systems, and 1≤27·2=54. This example is outside §4.1’s d≥5 range.

The whole-roadmap search covered Jacobian étaleness, finite-product classification, arbitrary box systems, component counts and their consumers. The exact contract already states the general input. Sections 4.1–4.2 use selected systems correctly; §5.6 and its worked example consume §5.5. The other occurrence requiring repair was Layer 5’s dependency summary. No general étaleness target was introduced here.

### Required checks and gate outcomes

- From the pinned content project, ran `lake env lean` on `packages/EffectiveBoundsPartII/Suggested.lean`: exit 0; exactly six intended proof-placeholder warnings, at lines 28, 39, 112, 132, 148 and 163; no errors. The file imports only Mathlib, so no Tau Ceti module build was needed.
- Created one scratch copy with `#check @name` for every declaration, then elaborated it with `lake env lean`: exit 0; the same six warnings and eleven elaborated signatures. Compared all signatures against §§0.5, 1.2, 4.1–4.2, 5.1–5.2 and 5.5–5.6. No binder was lost and nothing needed changing. Both family instance binders survive; both absolute constants precede the field or family binders.
- Ran the specified dependency check with `--movable`: exit 0. Complete output:

```text
depcheck: 50 roadmaps, 579 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. This is the supplied order’s result, not a quotation of either review’s earlier order receipt. Neither the order nor the tooling was changed.

- Citation resolution found no missing cross-roadmap citations or Lean names. Its disclaimer excludes pinned package checks; these were performed directly as recorded below.
- `git diff --check`: exit 0, no output. No gate failures were supplied with this job and none required repair.
- Compared all eleven own Lean names with the README: all remain present; no names were added, deleted or renamed. Six headline theorems and five needed definitions remain; no Check or API declaration was added to Lean.

### Source, supplier and ownership verification

The content checkout is main at 5078569. Its manifest pins Mathlib at 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti at a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. Read Completed/EffectiveBounds and the relevant SchemeAndStackFoundations sections as main-branch format and ownership references. Read the complete package README and Lean file and the cached published COU20 text. COU20 is the only work cited directly by this package; its manifest entry remains certified publisher-open. No additional source or missing-reference request was needed.

Re-resolved the actual contracts rather than substituting a different open revision of an existing main roadmap:

| Supplier | Locations read and mathematical match |
| --- | --- |
| Completed/EffectiveBounds | Layers 1–2: integral-basis/discriminant infrastructure and effective fixed-ambient Hermite count, distinct from the new multiequation bound. |
| GeometryOfNumbersAndQuadraticArithmetic | Exact indexed head through `roadmaps show`: §0.1.2 Gram–Hadamard; §§0.2.1, 0.2.6 saturated/orthogonal bases; §0.3.3 self-dual primitive covolumes; §1.1.2 ordered product roots; §§1.1.3–1.1.5 intrinsic cube/ball volumes; §1.2.7 simultaneous attaining witnesses; §1.5.21 upper second Minkowski with one explicit Haar measure. |
| GenericDoublePointInterpolation | Supplied head, §§0.1, 0.3, 1.3–1.4, 5.1–5.3: native monomial coordinates and metric; actual first jets; value-kernel derivative surjectivity; universal minors and degree bounds; generic full-rank open. The complex arithmetic substitution uses the domain-valued grid theorem, not the narrower integer-coefficient parameter pullback. |
| SchemeAndStackFoundations | Main §§0.10 and 5.12: arbitrary square-system Jacobian étaleness, and the stated projective two-subscheme Bézout inequality. The latter is not represented as already providing the complete isolated-system multiplicity statement. |
| ArithmeticStatisticsPartI | Exact indexed head, §0.7 and its two named anchors: Embedded, isoSetoid, isoFamily, isoDegree and the separate embedded multiplicity. This settles both names highlighted in the supplied citation leads: they are supplier targets, not missing Mathlib declarations. |

Direct pin inspection included the following statement bodies and their hypotheses:

| Pinned file (repository-relative) | Declarations and locators |
| --- | --- |
| Mathlib/NumberTheory/NumberField/Discriminant/Defs.lean | discr (35), discr_ne_zero (41), discr_eq_discr_of_algEquiv (50). |
| Mathlib/NumberTheory/NumberField/Discriminant/Basic.lean | rootDiscr (77), mixedEmbedding.covolume_integerLattice (124), finite_of_discr_bdd (494). The last counts finite-dimensional intermediate fields of a fixed characteristic-zero ambient field. |
| Mathlib/NumberTheory/NumberField/House.lean | house (38), house_eq_sup' (41), house_sum_le_sum_house (45), house_mul_le (51), house_intCast (74), one_le_house_of_isIntegral (93). The last needs both integrality and nonzero input. |
| Mathlib/NumberTheory/NumberField/CanonicalEmbedding/Basic.lean | canonicalEmbedding.norm_le_iff (79), mixedEmbedding.finrank (212), mixedEmbedding.latticeBasis (637). The house definition is the supremum norm, not the weighted mixed-space inner-product norm. |
| Mathlib/RingTheory/MvPolynomial/Basic.lean | basisRestrictSupport (95), restrictTotalDegree (164), mem_restrictTotalDegree (174): total degree, not coordinatewise degree. |
| Mathlib/Combinatorics/Nullstellensatz.lean | eq_zero_of_eval_zero_at_prod_finset (62): finite variables, integral domain and each degree strictly below its grid cardinality. |
| Mathlib/RingTheory/Discriminant.lean | discr_not_zero_of_basis (127), discr_eq_det_embeddingsMatrixReindex_pow_two (143): finite separable extension and actual basis/embedding indexing. |
| Mathlib/Algebra/Module/ZLattice/Covolume.lean | covolume_eq_det_mul_measureReal (115); covolume_div_covolume_eq_relIndex' (170): both discrete full lattices in the same real space. |
| Mathlib/RingTheory/Etale/Field.lean | Algebra.Etale.iff_exists_algEquiv_prod (271): field base and finite product, including the empty product. The formally étale variant requires essential finite type. |
| Mathlib/GroupTheory/Subgroup/Saturated.lean | AddSubmonoid.ker_saturated (62): additive torsion-free target. |
| Mathlib/Data/Nat/Choose/Central.lean | centralBinom, succ_mul_centralBinom_succ (78), four_pow_le_two_mul_add_one_mul_centralBinom (123). |
| Mathlib/Combinatorics/Enumerative/Catalan/Basic.lean | catalan and succ_mul_catalan_eq_centralBinom (126). |
| TauCeti/NumberTheory/EffectiveBounds/HermiteCount/Basic.lean | ncard_setOf_finiteDimensional_abs_discr_le_le (172), hermiteCountBound (202): fixed ambient fields and primitive-polynomial box. |
| TauCeti/Algebra/Module/ZLattice/Covolume.lean | ZLattice.covolume_sq_eq_det_gram (42): actual integral basis, finite-dimensional real inner-product space and intrinsic full lattice. |

Object searches used `roadmaps grep`, main and board files, the pinned packages, and all 49 supplied sibling folders. The supplied sibling matches for the arithmetic argument identify GenericDoublePointInterpolation’s interpolation input. No new carrier or theorem ownership was created by this repair: generic étaleness remains SchemeAndStackFoundations’ input. Ownership against open pull requests without supplied files was not checked; the required index searches were used only as leads. The board’s design-only EffectiveBoundsCompactModels overlaps this arithmetic scope, and this package’s design introduction explicitly identifies that route name with this Part II. This report makes no independent placement or design-ownership decision about that overlap.

The existing `gap:isolated-affine-bezout` still has matching slug, needs, supplier and section in the README and the top-level plan gaps list. It asks SchemeAndStackFoundations §5.12 for isolated multiplicities in arbitrary affine dimension, including other positive-dimensional components, and multiplicity one where the square Jacobian is invertible. No edit to this package can supply the other roadmap’s export. That declared prerequisite remains a maintainer-visible supplier obligation; neither review raises its already declared status as a new finding. No plan or source-manifest edit was necessary.

### Adversarial mathematics ledger: targets and acceptance definitions

All entries below were recomputed in this repair. Numerical tests are witnesses and negative controls, not replacements for the source arguments. “Retain” means the tested statement needs no mathematical change. The explicit-model range is r≥1, d≥5, M≥n(r+1), n≥1, δ≥1. Tests outside it evaluate the displayed objects or conditional linear algebra only. Section numbers identify each statement; the six Lean headline names are attached to their corresponding rows.

| Statement | Instances tried and values computed | Result; change |
| --- | --- | --- |
| §0.1 canonical pairing, measure and house body | ℚ: interval volume 2=2¹. ℚ(i): scaling determinant 2, disk volume 2π≥4; z=1 has house 1, squared g-norm 2. | Retain; COU20 line 104. |
| §0.2 integral discriminant/covolume | β=(1,i): Gram diag(2,2), det 4, covolume 2. For √5, basis discriminants 20 and 5, ratio 4=2². | Retain; COU20 line 127. |
| §0.3 short strict-majority family | n=1 gives product 1≤1; n=4,m=3 gives tail exponent 1; n=5,m=3 gives 5/6≤1; both have 2m>n. | Retain; COU20 line 140. |
| §0.4 products span | K=k,V=K: product dimension 1. V=k in a quadratic: 2dim V=n but product dimension 1<2. Inseparable degree 2 with V=K has products 1,t spanning dimension 2. In k⁴, k³×0 has 6>4 but product dimension 3. | Retain strict inequality and field hypothesis; COU20 line 150. |
| §0.5 exists_short_integral_basis | ℚ: 1≤1. ℚ(i): 1,1≤4. √5: 1,√5≤5 with integral index 2. | Retain rational basis, not maximal-order basis; COU20 line 161. |
| §1.1 parameter equivalence and bound | α=(1,√5): embedding det −2√5. α=(1,1): det 0. Over ℚ, u=3 gives κ=3; u=0 gives 0; column reversal sends (2,3) and (1,√5) to the same 2+3√5. | Retain; COU20 line 207. |
| §1.2 exists_bounded_first_jet_generators | ℚ,r=1,d=5: M=6,D=10,u=0 gives identity 2×2 jet minor. √2 with u=(0,1): D=20, house √2≤320, confluent determinant (2√2)⁴=64. Repeated supports give rank 2<4. | Retain actual conjugate jets; COU20 line 242. |
| §1.3 value descent | κ=√2: rational rank 2. κ=√5: rational rank 2, integral index 2. κ=0 in a quadratic: rank 1<2. | Retain; COU20 line 249. |
| §2.1 relation kernel | √2,d=3: coefficient vectors (−2,0,1,0),(0,−2,0,1), Gram diag(5,5), rank 2=4−2. Quadratic κ=0,d=2: actual rank 2 versus M−n=1. | Retain full-value-rank hypothesis; COU20 line 255. |
| §2.2 transpose index/covolume | √5,d=2: index 2, covol(L)=√26, covol(S)=2√26. Abstract doubling map: kernel covolume 1, dual image covolume 2. | Retain inequality 1≤2; COU20 line 269. |
| §2.3 Gram/discriminant | B rows (1,−1,5),(0,2,0): Gram [[27,−2],[−2,4]], det 104; V Gram [[31,21],[21,31]], det 520; 520/5=104. For i: 4/4=1, unconjugated numerator −4. | Retain conjugation and actual integral basis; COU20 line 278. |
| §2.4 monomial/diagonal bounds | r=2,d=2,C₀=1: six values ≤1, G=6. n=2,r=1,d=5: C₀=40δ²,H₀=40⁵δ¹⁰,G=6·40¹⁰δ²⁰. κ=0 still gives constant value 1. | Retain C₀≥1; COU20 line 291. |
| §2.5 relation covolume | √5,d=2: √26≤√(520/5)=2√26≤√520. κ=0 over ℚ,d=2: 1≤√(1/1)=1. | Retain discriminant denominator; COU20 lines 285, 309. |
| §3.1 independent short relations | √2,d=3: witness norm product 5≤2·5=10. Intrinsic ℓ=1 ball volume 2; ℓ=2 cube volume 2≤π. Rational vector 1/2 has norm 1/2<1 and is excluded. | Retain; COU20 line 323. |
| §3.2 truncation | n=2,ℓ=4: k=3, codim 1, last tail 2. Norms 1,2,4,8 have product 64=4²·4 and retained maximum 4≤8. n=1 discards 0. | Retain exactly n−1 discarded; COU20 line 330. |
| §3.3 joint derivative surjectivity | At 0,d=1: X↦1, rank 1. At d=0: kernel and derivative rank 0. At 0,1,d=3: kernel derivative columns (−1,1),(0,1), det −1. | Retain first-jet hypothesis; COU20 line 342. |
| §3.4 one full block | Diagonal in ℂ²: codim 1, ranks (1,1). Coordinate hyperplane in ℂ⁴: codim 1, ranks (1,2). Zero in ℂ²: codim 2=n, ranks (0,0). | Retain strict codimension threshold; COU20 line 343. |
| §3.5 common integer minor | X²−2: conjugate derivative values ±2√2. θ³=2: norm(3θ²)=27·4=108. X² at 0: derivative 0. | Retain injective-embedding argument without normality; COU20 line 349. |
| §4.1 component map | X²−2: inverse derivative √2/4, product 1. Product of two quadratics: two factors. X²: zero localization. In dual numbers (2ε)²=0 but 2ε≠0. | Retain unit hypothesis for ring targets; COU20 line 354. |
| jacobianPolynomial | (X,Y) gives det 1; swapped equations give −1; X²−2 at 3 gives 6 rather than 7; empty determinant gives 1. | Retain real body and equation-row convention. |
| JacobianOpenAlgebra | X²−X gives ℚ×ℚ; X² gives 0; X²−2 gives ℚ(√2); empty system gives ℚ. | Retain native quotient/localization. |
| HasBoundedModel | ℚ,E=X,κ=0,r=d=H=1 has degree 1,height 1,J=1 and identity map. E=X²,κ=0 fails J≠0. H<0,r≥1 fails even the zero coefficient bound 0≤H. | Retain linked point, equations and map. |
| explicitCoefficientBound | B(1,1,5,1)=13693063.93762915; B(2,1,5,√8)=32876494803566.277; δ doubled gives ratio 1024. At n=0,r=1,d=5: exponent 6/0=0, remaining 0⁵ gives B=0. | Retain total function; n=0 is outside theorem hypotheses. |
| §4.2 exists_explicit_small_model | ℚ,E=X: 1≤13693063.93762915. √2,E=X²−2: 2≤32876494803566.277. For (X²−X,XY), J=X(2X−1), J(1,0)=1; line X=0 disappears after localization. | Retain finite Jacobian-open conclusion; COU20 line 354. |
| §5.1 centralBinomialRank and bounds | n=0,1,2,3,14,15,42,43 give r=1,1,2,3,4,5,5,6. Catalan values r=1,…,6 are 1,2,5,14,42,132. At n=15: 90≤252≤360; n=1: 1>3log 1=0. | Retain positive infimum and eventual logarithmic estimates; COU20 line 385. |
| §5.2 exists_logarithmic_small_models | n=15,r=5,M=252: log B=90.04887857805613+10log δ. At n=14,r=4,M=70 the d≥5 condition fails. At δ=1 the added logarithmic term is 0. | Retain uniform Q before K; COU20 line 20 and lines 381–425. |
| §5.3 bounded systems | r=0 has 0 slots and 1 tuple; d=0 has r slots; C=0 has 1 tuple. r=d=2 gives 12 slots versus the wrong coordinatewise 18. | Retain; COU20 line 425. |
| §5.4 exact box count/floor | (r,d,C)=(1,2,1): 3³=27. (2,0,1): 3²=9. r=0: 1⁰=1. B=3.7: floor 3, seven integer choices in both formulations. | Retain; COU20 line 425. |
| §5.5 bounded_systems_field_class_bound | Quartic product: four points, two factors/classes, 2≤1485172. X²−X: J(0)=−1,J(1)=1,two factors,one class,1≤54. X²: zero points/factors/classes. Plane line-plus-point: 1≤4. C=0 gives m=0. | Apply F01 to all-system étaleness inputs; count unchanged; COU20 lines 425–430. |
| §5.6 discriminant_field_class_bound | H=1,n>1 gives m=0. n=2,H=3 gives exactly one class of discriminant −3; discriminant −4 is excluded. Nonnormal S₃ cubic: three embedded images, one permitted representative. Log bound terms become nlog⁴n and log³n·log H. | Retain unweighted inclusive count and uniform quantifiers; COU20 line 35 and lines 425–430. |

### API assertion ledger

Within each section, A1, A2, … follow the README API bullet order. Each assertion is tested separately; the API remains prose. “Retain” in the last column records no mathematical edit.

| Statement | Computed witness, comparison or excluded model | Result; change |
| --- | --- | --- |
| §0.1 A1, scaled Haar measure | ℚ(i): scale 2¹=2, unit square measures 2 versus 1. | Retain. |
| §0.1 A2, measurable-set identity | Complex unit disk: μ_can=2π=2·π; empty set: 0=2·0. | Retain. |
| §0.1 A3, pairing weights | Real 1 gives 1; complex 1 gives 2; complex i with itself gives 2. | Retain. |
| §0.1 A4, house-body volume | Totally real quadratic: 4; imaginary quadratic: 2π. | Retain. |
| §0.1 A5, house gauge | i in ℚ(i): gauge=1=house(i), while g-norm=√2. | Retain. |
| §0.3 A1, ordered independent family | ℚ(i),1,i: houses (1,1), rational rank 2, product 1≤δ¹=2. | Retain. |
| §0.3 A2, prefix dimension | Same quadratic: m=2 and span dimension 2; repeated (1,1) has rank 1. | Retain. |
| §0.3 A3, prefix embedding bounds | Same basis: every modulus 1≤δ=2. | Retain. |
| §0.3 A4, product bound | ℚ: 1≤1; ℚ(i): 1≤2. | Retain. |
| §0.3 A5, witness gauge | i: house 1 and g-norm √2 give distinct values. | Retain. |
| §1.1 A1, finite integral sum | α=(1,√5), u=(2,3): κ=2+3√5, integral. | Retain. |
| §1.1 A2, embedding formula | Two conjugates of that κ: 2+3√5 and 2−3√5. | Retain. |
| §1.1 A3, equivalence | Embedding matrix det −2√5≠0; repeated basis gives det 0. | Retain. |
| §1.1 A4, house bound | n=2,D=3,δ²=5: house(2+3√5)=2+3√5≈8.7082≤30. | Retain. |
| §1.1 A5, basis/parameter transport | Swapping α and coefficients leaves 2+3√5; replacing second basis vector by 1+√5 changes coefficients to (−1,3), again 2+3√5. | Retain. |
| §2.1 A1, kernel | At κ=0,d=2: f=a+bX+cX² maps to a; kernel has coordinates (0,b,c). | Retain. |
| §2.1 A2, membership iff | At √2,d=2: X²−2 evaluates 0 and has degree 2; 1 evaluates 1; X³−2X has degree 3 and is excluded. | Retain both directions. |
| §2.1 A3, rank | At √2,d=3: kernel dimension 2=4−2. | Retain. |
| §2.1 A4, saturation | If 2f(√2)=0 then f(√2)=0; f=1 has 2≠0. Negative multiplier −2 gives the same result. | Retain. |
| §2.1 A5, complex kernel | At ±√2,d=3: value matrix rank 2, nullity 2, spanned by the two displayed integer relations. | Retain. |
| §2.1 A6, degree inclusion | X²−2 lies in kernels at d=2 and d=3 with coefficients (−2,0,1) and (−2,0,1,0). | Retain. |
| §2.2 A1, transpose source/target | √5,d=2: dual integral-basis generators map to (1,−1,5) and (0,2,0). | Retain. |
| §2.2 A2, coordinate values | β₂=(1+√5)/2 gives √5=−1+2β₂, so the X column is (−1,2). | Retain. |
| §2.2 A3, injectivity | Those two rows have independent first two coordinates with minor 2≠0. | Retain. |
| §2.2 A4, orthogonality and rank | Dotting either row with (−5,0,1) gives 0; both rows have rank 2. | Retain. |
| §2.2 A5, index/covolume | Relative determinant 2; covol(S)/covol(L⊥)=(2√26)/√26=2. | Retain. |
| §2.2 A6, integral basis change | Swapping the two coordinate rows changes orientation by −1; Gram determinant remains 104 and span/covolume remain S,2√26. | Retain. |
| §3.1 A1, independent sorted witnesses | √2,d=3: equal norms √5, rank 2, product 5≤10. | Retain. |
| §3.1 A2, equation conditions | X²−2 and X³−2X both vanish at √2; degrees 2 and 3≤3. | Retain. |
| §3.1 A3, scalar-extension bases | Their coefficient matrix has a 2×2 identity minor, hence real/complex rank 2. | Retain. |
| §3.1 A4, lower norm | X has norm 1; nonintegral constant 1/2 has norm 1/2 and is excluded. | Retain. |
| §3.1 A5, coefficient bound | X²−2: maximum coefficient 2≤√5. | Retain. |
| §4.1 A1, determinant evaluation | X²−2 at 3 gives derivative determinant 6. | Retain. |
| §4.1 A2, naturality | At √2 and its conjugate, images of 2√2 are ±2√2, both nonzero; reducing integer −2 modulo 3 gives 1 in either evaluation order. | Retain. |
| §4.1 A3, extension/unit condition | (2√2)(√2/4)=1; in dual numbers (2ε)²=0 so it is not a unit despite 2ε≠0. | Retain. |
| §4.1 A4, polynomial compatibility | For f=1+X² at √2, both quotient-map evaluation and direct value are 3. | Retain. |
| §4.1 A5, inverted element | At √2 the inverse maps to √2/4, product with J is 1. | Retain. |
| §4.1 A6, uniqueness | Once X maps to √2, the equations force J⁻¹↦√2/4; sending it to 0 would give 1↦0. | Retain. |
| §4.1 A7, onto map | Images of 1,X in the quadratic are 1,√2, rational rank 2. | Retain. |
| §4.1 A8, chosen factor projection | For the quartic product, first projection sends X to √2 and second to √3; each image has degree 2, whole algebra dimension 4. | Retain. |
| §4.1 A9, characteristic-zero compatibility | Integer derivative 2X at 3 gives 6; rationalized derivative gives 6. | Retain. |
| §4.1 A10, quotient/localization laws | In X²−2, E maps to 0 and J·J⁻¹ maps to 1; for X², inverting nilpotent 2X forces 1=0. | Retain. |
| §4.1 A11, equation permutation | (X,Y) gives J=1, swapped equations give J=−1; both quotient/localizations are ℚ. | Retain. |
| §4.2 A1, same construction data | At √2, E=X²−2 vanishes; replacing κ by 0 gives E(0)=−2 and fails the predicate. | Retain. |
| §4.2 A2, monotonicity/transport | Same quadratic model satisfies (d,H)=(2,2) and (3,3). Conjugating κ to −√2 preserves coefficient height 2 and changes J to −2√2. | Retain. |
| §4.2 A3, positive B/expansion | n=1,r=1,d=5,δ=1: ℓ=5 and B=5^(5/2)√6·10⁵=13693063.93762915>0; √G=√6·10⁵. | Retain. |
| §4.2 A4, unique compatible surjection | For X²−2 at √2, X↦√2 and J⁻¹↦√2/4; alternative J⁻¹↦0 violates J·J⁻¹=1. | Retain. |
| §5.1 A1, least admissible positive index | n=2: r=1 fails 4≤2, r=2 satisfies 6≤6. | Retain. |
| §5.1 A2, minimality | n=15: r=4 fails 75≤70; r=5 satisfies 90≤252. | Retain. |
| §5.1 A3, monomial interval | n=15,r=5: 90≤252≤360. | Retain. |
| §5.1 A4, eventual estimate | n=15 gives r=5≤3log 15≈8.12415; n=1 would give 1≤0 and is excluded from an all-n claim. | Retain eventual quantifier. |
| §5.1 A5, monotonicity | n=14,15,42,43 give r=4,5,5,6; equality across 15→42 is allowed. | Retain. |
| §5.3 A1, box definition | X²−X lies in Box(1,2,1); X²−2 fails the coefficient bound 2≤1. | Retain. |
| §5.3 A2, membership iff/zero | Zero polynomial has degree 0 and coefficients 0; X³ fails degree≤2 despite coefficients≤1. | Retain. |
| §5.3 A3, coordinate product | r=d=2 gives 6 monomials times 2 equations =12 coordinates. | Retain. |
| §5.3 A4, finiteness | C=1 at r=d=2 gives 3¹²=531441 tuples. | Retain. |
| §5.3 A5, inclusions | X²−2 belongs at (d,C)=(2,2) and (3,3), but not at (1,2) or (2,1). | Retain. |
| §5.3 A6, native bounded module | X²−X has degree 2≤2; X³ has degree 3>2 and fails that submodule membership. | Retain. |

### All README Checks

C1, C2, … refer to the bullet order within each section. Every Check is listed, including the expanded F01 witness. Each result is a recomputation from the definitions; excluded instances record the value that defeats the proposed wrong model.

| Check | Instance and computed values on the relevant sides | Result; change |
| --- | --- | --- |
| §0.1 C1 | ℚ house interval [−1,1] has length 2; half-length gives 1. | Retain. |
| §0.1 C2 | ℚ(i) disk: product area π, canonical measure 2π. | Retain. |
| §0.1 C3 | Totally real quadratic: r₂=0, factor 2⁰=1 and square volume 4 in both measures. | Retain. |
| §0.1 C4 | z=1: gauge 1; g(1,1)=2, so norm √2. | Retain. |
| §0.2 C1 | Basis (1) of ℚ: Gram det 1, covolume 1, discriminant 1. | Retain. |
| §0.2 C2 | Basis (1,i): Gram diag(2,2), det 4, canonical covolume 2, product covolume 1. | Retain. |
| §0.2 C3 | √5: disc(1,√5)=20, disc(1,(1+√5)/2)=5; 20/5=2². | Retain. |
| §0.3 C1 | n=m=1,ω=1,δ=1: house product 1=δ^(1/2)=1. | Retain. |
| §0.3 C2 | n=4,m=3: 2m=6>4 and exponent 4/(2·2)=1. | Retain. |
| §0.3 C3 | n=5,m=3: 2m=6>5 and exponent 5/(2·3)=5/6≤1. | Retain. |
| §0.4 C1 | Degree 1 and full subspace: 2dim V=2>1; product span dimension 1. | Retain. |
| §0.4 C2 | Rational line in degree 2: 2dim V=2=n but product span dimension 1<2. | Retain. |
| §0.4 C3 | 𝔽₂(t)/𝔽₂(t²): 1·1=1,1·t=t, independent products have rank 2. | Retain inseparable example. |
| §0.4 C4 | k³×0 in k⁴: 2dim V=6>4 but product span dimension 3. | Retain negative control for field hypothesis. |
| §0.5 C1 | ℚ: integral rational basis 1 has house 1=δ²; field degree 0 is impossible. | Retain. |
| §0.5 C2 | ℚ(i): houses 1,1≤2²=4. | Retain. |
| §0.5 C3 | √5: houses 1,√5≤5; determinant in the integral basis is 2, so index 2. | Retain. |
| §1.1 C1 | α=1,u=3 gives κ=3·1=3. | Retain. |
| §1.1 C2 | Zero parameters in a quadratic give two identical value rows (1,0,…), rank 1<2. | Retain. |
| §1.1 C3 | Basis (1,√5): rational rank 2, integral coordinate determinant 2; admissibility does not require determinant ±1. | Retain. |
| §1.1 C4 | Candidate (1,1): embedding matrix [[1,1],[1,1]], det 0. | Retain. |
| §1.2 C1 | ℚ,r=1,d=5: M=6,D=10; at κ=0, columns 1,X yield identity jet matrix and det 1. | Retain. |
| §1.2 C2 | Quadratic repeated zero: value rank 1; full value-and-derivative rank 2<4. | Retain. |
| §1.2 C3 | D=2: T(T−1) has values 0,0,2 at 0,1,2; D=0: empty product 1 has value 1=0!. | Retain D+1 grid. |
| §1.2 C4 | Seven plane points (i,0),d=5: f(X,0) contributes rank 6 and ∂Yf(X,0) rank 5; total 11<21. | Retain. |
| §1.3 C1 | κ=√2: 1,√2 span rational dimension 2. | Retain. |
| §1.3 C2 | κ=√5: rational dimension 2, integer image ℤ+ℤ√5 has index 2. | Retain. |
| §1.3 C3 | κ=0 in a quadratic: every rational value lies in ℚ, rank 1<2. | Retain. |
| §2.1 C1 | At κ=0,d=2: kernel basis X,X², rank 2; 1 evaluates to 1 and is excluded. | Retain. |
| §2.1 C2 | d=0: integer constants inject and kernel rank 0. In a quadratic, value rank 1<2 despite natural 1−2=0. | Retain. |
| §2.1 C3 | √2,d=3: relations (−2,0,1,0),(0,−2,0,1), each norm²=5, dot product 0, rank 2. | Retain. |
| §2.1 C4 | κ=1/2: evaluating X gives 1/2∉ℤ, so no indicated integral-target map. | Retain. |
| §2.1 C5 | Quadratic κ=0,d=2: actual kernel rank 2, claimed unconditional M−n would be 3−2=1. | Retain. |
| §2.2 C1 | √5,d≥1: image ℤ[√5], index 2; transpose image has relative index 2. Powers reduce using (√5)²=5. | Retain. |
| §2.2 C2 | √2,d≥1: values include integral basis 1,√2; index 1, so S=L⊥. | Retain. |
| §2.2 C3 | z↦2z: kernel 0 has intrinsic covolume 1, orthogonal ℤ has covolume 1, dual image 2ℤ has covolume 2. | Retain direction 1≤2. |
| §2.3 C1 | κ=i: B=I₂, det(BBᵗ)=1, det(VV*)=4, ratio 1; det(VVᵗ)=−4. | Retain. |
| §2.3 C2 | √5,d=2: Gram entries 27,−2,4 give det 104; value Gram entries 31,21 give 520; 520/5=104. | Retain. |
| §2.3 C3 | Using rational basis (1,√5): coordinate Gram diag(26,1), det 26; 520/20=26 whereas 520/5=104. | Retain genuine integral basis. |
| §2.4 C1 | r=d=2 has six monomials; C₀=1 gives H₀=1, G=6 rather than 9. | Retain. |
| §2.4 C2 | κ=0 gives constant value 1 and positive-degree values 0; d>0,C₀=0 would assert 1≤0. | Retain. |
| §2.4 C3 | n=2,r=1,d=5: D=20,C₀=40δ²,H₀=40⁵δ¹⁰,G=6·40¹⁰δ²⁰. | Retain. |
| §2.5 C1 | √5,d=2: relation generator (−5,0,1) has norm √26; transpose rows have covolume √104=2√26. | Retain. |
| §2.5 C2 | Same data: √(520/5)=2√26, compared with the weaker √520. | Retain. |
| §2.5 C3 | ℚ,κ=0,d=2: orthonormal relations X,X² give covolume 1; value Gram and discriminant are each 1. | Retain. |
| §3.1 C1 | X²−2: coefficient norm √5, maximum modulus 2, evaluated value 0. | Retain three distinct quantities. |
| §3.1 C2 | X has norm 1; nonintegral constant 1/2 has norm 1/2<1. | Retain. |
| §3.1 C3 | Vectors (2,0),(0,1): real rank 2, absolute determinant/index 2, not 1. | Retain. |
| §3.1 C4 | Intrinsic line unit ball length 2=2¹·1^(−1/2); ambient plane area 0. | Retain. |
| §3.1 C5 | ℓ=2 cube half-side 1/√2 gives area 2 and vertex norm 1; disk area π≥2. Half-side 1 gives vertex norm √2>1. | Retain. |
| §3.2 C1 | n=2,r=1,d=5: M=6,ℓ=4,k=3, codim 1, final retained tail length 2. | Retain. |
| §3.2 C2 | n=1: k=ℓ, discarded 0, codim 0<1; discarding another gives codim 1. | Retain. |
| §3.2 C3 | Norms 1,2,4,8: product 64=4²·4; retained maximum 4≤4¹·√4=8. | Retain. |
| §3.3 C1 | At 0,d=1: kernel span X, derivative of X is 1, rank 1. | Retain. |
| §3.3 C2 | At 0,d=0: value rank 1 but kernel and derivative rank 0. | Retain. |
| §3.3 C3 | At 0,1: derivatives of X(X−1),X²(X−1) are (−1,1),(0,1); det −1. | Retain. |
| §3.4 C1 | Diagonal in ℂ²: dimension 1,codim 1; each coordinate projection has rank 1. | Retain. |
| §3.4 C2 | Hyperplane x₁=0 in ℂ⁴: dimension 3,codim 1, two rank-two blocks have projected ranks 1 and 2. | Retain. |
| §3.4 C3 | Zero subspace in ℂ²: codim 2=n, both projected ranks 0. | Retain. |
| §3.5 C1 | θ³=2: norm θ=2, norm(3θ²)=3³·2²=108; each conjugate modulus 3·2^(2/3). | Retain. |
| §3.5 C2 | X²−2: J at ±√2 is ±2√2≠0. | Retain. |
| §3.5 C3 | X² at 0: J=0, so field localization evaluation is impossible. | Retain. |
| §4.1 C1 | X²−2: J(√2)=2√2 and inverse √2/4 multiply to 1; localized field degree 2. | Retain. |
| §4.1 C2 | Quartic product: four roots, J at positive quadratic roots −2√2 and 2√3; both degree-two factors survive. | Retain. |
| §4.1 C3 | X² quotient: (2X)²=0; inverting 2X gives 1=0 and the zero algebra. | Retain. |
| §4.1 C4 | X²−2 at 3: derivative 6, equation value 7. | Retain. |
| §4.1 C5 | X² at 0: derivative 0; its image cannot be an invertible element of ℚ. | Retain. |
| §4.1 C6 | (X,Y) derivative matrix I₂ gives 1; swap rows to get det −1; the localization in either case is ℚ. | Retain. |
| §4.1 C7 | r=0: empty determinant 1, empty quotient/localization over ℚ is ℚ; in the zero ring its value satisfies 1=0. | Retain. |
| §4.1 C8 | Dual numbers: E(ε)=ε²=0,J(ε)=2ε≠0,(2ε)²=0; J is not a unit. | Retain. |
| §4.1 C9 | In 𝔽₂, (X²−X)'=1 and (X²)'=0; in 𝔽₃, (X³−X)'=−1=2. | Retain. |
| §4.2 C1 | ℚ,r=1,d=5: M=6,ℓ=5,δ=1; E=X has height 1≤13693063.93762915,J=1. | Retain. |
| §4.2 C2 | √2,r=1,d=5: E=X²−2 has degree 2≤5,height 2,J=2√2 and B≈3.28765·10¹³. | Retain. |
| §4.2 C3 | E=(X²−X,XY): J=X(2X−1), J(1,0)=1; the X=0 line has J=0. After localization X=1,Y=0, giving ℚ. | Retain. |
| §4.2 C4 | Height 2 remains ≤3; a proposed zero function would send 1 to 0≠1 in the field. | Retain. |
| §4.2 C5 | n=1,r=1,d=5: B at 2δ divided by B at δ is 2¹⁰=1024. | Retain. |
| §4.2 C6 | n=0,r=1,d=5,δ=1: M=6,ℓ=6,real exponent 6/0=0 and factor 0⁵=0; total B=0. | Retain total function, excluded theorem input. |
| §5.1 C1 | n=1: r=1 from Catalan 1; n=2: r=2 from Catalan 2, central coefficients 2 and 6. | Retain. |
| §5.1 C2 | F₄=14,F₅=42; r(14)=4,r(15)=5. | Retain. |
| §5.1 C3 | r(1)=1,3log 1=0, so 1>0. | Retain eventual qualifier. |
| §5.1 C4 | n=0: admissible positive r include 1, and no positive natural below 1 exists; infimum 1. | Retain. |
| §5.2 C1 | n=14: r=4,M=70; n=15: r=5,M=252 with 90≤252≤360. Only the latter has d≥5. | Retain. |
| §5.2 C2 | n=1 yields r=1 but Qlog 1=0 for every Q. | Retain degree threshold. |
| §5.2 C3 | log((nδ)^(Qlog n))=Qlog²n+Qlog n log δ; at δ=1 second term 0. | Retain. |
| §5.3 C1 | r=0: no equation slots, exactly one empty tuple, cardinality 1. | Retain. |
| §5.3 C2 | d=0: M=1; r=2,C=1 gives 3²=9 constant pairs. | Retain. |
| §5.3 C3 | C=0: every coefficient 0, exactly one system regardless of d. | Retain. |
| §5.3 C4 | r=d=2: M=6 and rM=12; coordinatewise bound would give 18 and would include X²Y² of degree 4. | Retain. |
| §5.4 C1 | r=1,d=2,C=1: three slots with three choices each give 27. | Retain. |
| §5.4 C2 | B=3.7,floor B=3: integer interval −3,…,3 has seven elements; ceiling 4 gives nine. | Retain exact floor equivalence. |
| §5.4 C3 | r=0: exponent 0 and count 1, also at C=0; r=2,d=0,C=1: 3²=9. | Retain. |
| §5.5 C1 | Quartic product: four simple geometric points, degrees 2+2=4,two classes with discriminants 8,12; bound 13⁵·4=1485172≥2. | Retain. |
| §5.5 C2 | X²−X: roots 0,1,J values −1,1; two ℚ factors and one class; bound 3³·2=54≥1. Two ℚ copies fail pairwise nonisomorphism. | Applied: explicitly test all-system étaleness at d=2<5. |
| §5.5 C3 | X²: J nilpotent before localization, zero algebra afterward; 0 points,0 factors,0 classes. | Retain. |
| §5.5 C4 | (X²−X,XY): line plus point before localization; just (1,0) afterward; isolated count 1≤2²=4. | Retain. |
| §5.5 C5 | Empty family: m=0≤positive box bound. C=0,r≥1: E=0,J=0,localization 0, so m=0 necessarily. | Retain. |
| §5.6 C1 | H=1,n>1: class count 0; H-power is 1 and log H=0. Empty families give 0≤the positive displayed bound. | Retain. |
| §5.6 C2 | S₃ cubic: three embeddings and one automorphism give three embedded fields, but one isomorphism class. | Retain. |
| §5.6 C3 | n=1,H=1: N=1 while r=1>Qlog 1=0. | Retain eventual domain. |
| §5.6 C4 | n=2,H=3: ℚ(√−3),disc −3 is included; ℚ(i),disc −4 is excluded; maximum nonisomorphic family size 1. | Retain inclusive cutoff and family equivalence. |

### Conventions, supplier witnesses and examples

These rows also cover the conventions reused by several layers; the numerical values agree with every occurrence of the same object. Generic finite-algebra countermodels are not substituted into statements about fields.

| Statement | Instances and computed values | Result; change |
| --- | --- | --- |
| Degree/discriminant and denominators | ℚ: n=1,disc=1,δ=1. ℚ(i): n=2,disc=−4,δ=2. √5: disc=5,δ=√5. Thus n and abs(disc) are nonzero; 0-degree is excluded. | Retain. |
| Short rational basis versus actual integral basis | √5 coordinate determinant 2 and basis discriminants 20=4·5; using it in place of β would change 104 to 26. | Retain. |
| Complex metric scale | A complex coordinate multiplies two real axes by √2, determinant 2; ℚ(i) has product covolume 1 and canonical covolume 2. | Retain. |
| Native coefficient norm and intrinsic measure | X²−2 has norm²=5,max coefficient 2,value 0; a line unit ball has length 2 but ambient plane area 0. Rank-zero covolume is 1. | Retain. |
| First derivatives and row indexing | X² at 3 has value 9 and derivative 6; at 0 columns 1,X give det 1, swapped columns det −1. There are n(r+1) rows. | Retain ordinary derivatives. |
| Gram conjugation convention | Rows (1),(i): VV*=[[1,−i],[i,1]], native Gram=[[1,i],[−i,1]], both det 0,diagonals 1,1. Single row i has Hermitian determinant 1 versus unconjugated −1. | Retain. |
| Positive model range | n=2,r=1,d=5: M=6,ℓ=4≥nr=2,D=20,C₀=40δ²; k=3≥r. Outside it, n=0 gives the total B value 0 without a model assertion. | Retain. |
| Self-dual primitive covolume input | ℤ(1,1) and ℤ(1,−1) have covolumes √2; ℤ(2,2) has 2√2 and fails primitivity. | Retain self-duality and saturation. |
| One Haar measure for Minkowski | L=2ℤ,K=[−3,3]: λ=2/3,volume 6,covolume 2,so λ·volume=4=2·covolume. Twice the measure gives 8=8. | Retain common measure. |
| Ordered-root tail convention | (1,2,4): total product 8; tail powers are 1³=1,2²=4,4¹=4,all≤8. Last exponent is 1, never 1/0. | Retain. |
| Intrinsic ball supplier | ℓ=1 lower volume 2; ℓ=2 lower volume 2≤π; ℓ=4 lower volume 1. Half-side 1 in dimension 2 gives norm √2>1. | Retain supplied general bound. |
| General-base Jacobian contract | R=ℚ[t],E=tX−1: J=t becomes a unit, quotient R[t⁻¹] is étale but not a finite R-module; specializes at t=1 to ℚ with J=1. | Retain distinction between ring and field base. |
| Isolated-point gap | Quartic product: four multiplicity-one points≤4. Plane (X²−X,XY): isolated point length 1≤4 with line elsewhere; Jacobian there is 1. | Retain existing supplier gap. |
| Ordered boxes and inclusive floor | r=d=2,C=1: 3¹²=531441 tuples; r=0:1. Real B=3.7 gives exactly seven integers; B=0 gives one. | Retain. |
| Unweighted classes/universe | Non-Galois cubic: embedded/class counts 3/1; quadratic:1/1; ℚ:1/1. Lifting representatives changes none of degree,discriminant or family size. | Retain arbitrary field universe and unweighted convention. |
| Layer 0 example | ℚ(i): canonical covolume²=2²=4=abs(disc),houses 1≤4; rational-line products still span dimension 1<2. | Retain. |
| Layer 1 example | √5 basis gives embedding determinant −2√5 and integral index 2; seven collinear quintic supports have rank 11<21. | Retain. |
| Layer 2 example | √5: covolumes √26 and 2√26,Gram det 104=520/5; ℚ(i): Hermitian/unconjugated determinants 4 and −4. | Retain. |
| Layer 3 example | n=2,ℓ=4,k=3 gives codim 1; chosen derivative values ±2√2 differ in sign and remain nonzero; coefficient norm √5. | Retain. |
| Layer 4 example | X²−2 gives one quadratic factor; quartic product two; X² none. Inverse derivative at √2 is √2/4 and product 1. | Retain. |
| Layer 5 example | Least ranks at n=1,2,14,15 are 1,2,4,5; box count at r=d=2,C=1 is 531441; quartic product has two classes while X²−X has one. | Retain. |
| Worked example: integral index | β-coordinate rows (1,−1,5),(0,2,0) give Gram [[27,−2],[−2,4]],det 104; q=2 and √104=2√26; value det 520=5·104. | Retain; COU20 lines 255–290. |
| Worked example: all blocks | A codim-one subspace of a four-dimensional relation space cannot lie in the kernel of an onto map to ℂ², whose kernel has codim 2. Chosen quadratic derivatives are ±2√2; cubic derivative norm is 108. | Retain; COU20 lines 330–351. |
| Worked example: several classes | Quartic derivative factors −2√2,2√3 retain both fields; X²−X gives two factors/one class; X² gives 0; plane system has J(1,0)=1. | Retain; COU20 lines 363–380 and 425–430. |
| Worked example: uniform parameters | F₁,…,F₅=1,2,5,14,42. log B=Q₀log²n+(Q₀/n)log n log H; rM of size nlog²n gives nlog⁴n and log³n log H; H=1 sets the second term to 0. | Retain; COU20 line 385 and lines 421–430. |

Source checks covered all primary target locators and their continuation paragraphs: COU20 lines 104, 127, 140, 150, 161, 195, 207, 242, 249, 255, 259, 269, 278–290, 291, 303, 309, 323, 330, 342–351, 354–380, 385 and 421–430; Theorems 1–2 start at lines 20 and 35. The extraction’s inequality glyphs are not used to change weak inequalities into strict ones: for example, x=1 has house 1 and ℚ’s house body has volume exactly 2. Its tensor-product and “sphere” terminology at lines 266 and 324 do not change the roadmap’s integral scalar extension and closed-ball statements.

### Maintainer consequences

Only `packages/EffectiveBoundsPartII/README.md` and this report changed. `Suggested.lean`, metadata, sources and the plan remain unchanged. The general supplier is already a dependency; the repair introduces no new edge to a later roadmap and renames no consumer-facing declaration. The isolated-affine-Bézout supplier obligation remains explicit and unchanged. Both counting proofs use it; this repair and its elaboration do not certify that supplier’s eventual proof. No commits, network writes or edits to other roadmaps were made, and no Lean process was left running. A fresh independent review remains required.
