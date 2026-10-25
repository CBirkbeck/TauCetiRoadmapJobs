# EffectiveBoundsPartII port report

Branch: `roadmap/effective-bounds-part-ii`.
Head commit: `f2ea326017852674cdc13e886d532e9287546821`.
Base: `6ef1bbd`; the initial worktree was clean.

The commit adds only `TauCetiRoadmap/EffectiveBoundsPartII/README.md`, `TauCetiRoadmap/EffectiveBoundsPartII/Suggested.lean` and `TauCetiRoadmap/EffectiveBoundsPartII/metadata.toml`. The top-level roadmap list, manifest, toolchain, suppliers and merge order are unchanged. No push or GitHub write was performed. This is an author mathematics and interface audit using Codex (GPT-6), not an independent review.

## Validation

The requested module build exited 0. Its exact outcome line is:

```text
Build completed successfully (8976 jobs).
```

Warning count: **6**, all warning that a declaration uses `sorry`, on the six headline theorems at Suggested.lean lines 28, 39, 112, 132, 148 and 163. No other warning or error occurred.

The final push-gate summary is:

```text
gate EffectiveBoundsPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```

The gate's precommit runs found only the uncommitted folder (`dirty`); all content, import, ownership-name, outside-folder and dependency counters were zero. The final run uses the committed, clean worktree.

The complete requested dependency-direction check output is:

```text
depcheck: 50 roadmaps, 579 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. No order or tooling change was made. Citation resolution reports no unresolved cross-roadmap citation or Lean name. Its disclaimer excludes checking pinned packages; direct source inspection supplied that check.

A single scratch signature file contains an exact copy of the final acceptance module and `#check @name` for **all 11 declarations**. It elaborated with exit 0 and the same six sorry warnings. I compared every elaborated type with README §§0.5, 1.2, 4.1–4.2, 5.1–5.2 and 5.5–5.6: all field and NumberField instances, the three explicit-model inequalities, both dependent family instances, pairwise nonisomorphism and both uniform constant quantifiers survive. No binder needed repair. The five definitions have real bodies and no implicit standing hypotheses. Suggested.lean is byte-for-byte the accepted package's file, with only `import Mathlib`; it uses no Tau Ceti declaration requiring an additional import.

The staged diff passed `git diff --check`. Metadata matches `Completed/EffectiveBounds/metadata.toml`: `topic = "math.NT"`. The port preserves **26 target subsections, 58 API bullets, 100 individual Checks and four worked examples**. Six headline theorems and five necessary definitions/abbreviations remain in Lean. There are no admitted examples, data placeholders, option overrides or extra imports. All Lean declaration names occur in the README.

## Draft pull request body

This Part II extends EffectiveBounds with compact multi-equation models of number fields. Short algebraic integers, first-jet interpolation at their conjugates and the lattice of integral polynomial relations produce equations with explicit coefficient bounds whose Jacobian-open algebra has the given field as a component. Degree-uniform logarithmic models then give Couveignes's cubic-logarithmic bound for unweighted isomorphism classes of fields of bounded discriminant.

The README specifies the arithmetic constructions, their APIs, discriminating Checks and supplier contracts. Suggested.lean states all six headline theorems against the pinned libraries, including the two counting results through finite families of pairwise nonisomorphic number fields. The counting route retains the accepted isolated-affine-Bézout contract in SchemeAndStackFoundations §5.12.

AI assistance: authored and audited using Codex (GPT-6).

## Suppliers, ownership and changes

The roadmaps consumed here that are still new-roadmap pull requests are **GeometryOfNumbersAndQuadraticArithmetic**, **GenericDoublePointInterpolation** and **ArithmeticStatisticsPartI**. SchemeAndStackFoundations is consumed from main, not its open revision. EffectiveBounds is consumed from Completed and its pinned Tau Ceti implementation. DiophantineApproximationAndTranscendence §2.8 is an ownership boundary on main, not an additional proof-route input.

No statement moved from Lean to README during this port: the accepted file already satisfies the acceptance-test rule. Both counting headlines remain; the supplier-owned class quotient is not recreated. No headline was omitted as unstatable, weakened, or replaced by an assumption of its conclusion.

The accepted review's only nonblocking spelling note is already applied in the supplied package. I verified zero `morφ` substrings and zero Greek letters embedded in Latin words; the six standalone mathematical φ symbols remain. The preceding nonblocking dependency note is also already applied: §5.5 explicitly consumes SchemeAndStackFoundations §0.10 for **every** coefficient-box system, including degree two. Historical suggestions that the counting theorems could not be stated are superseded by the accepted six-headline file; those theorems are preserved.

The final upstream reading covered the whole README again, following the format of Completed/EffectiveBounds, Chebotarev and DiophantineApproximationAndTranscendence on main. It produced these small clarifications:

1. Exact supplier contracts distinguish SchemeAndStackFoundations §5.12's actual projective degree inequality from the accepted additional isolated-intersection contract. The previous opening could be read as asserting that the full affine multiplicity export was already present. The mathematical contract and its accepted gap identifier are unchanged.
2. Scope and ownership explicitly identifies DiophantineApproximationAndTranscendence §2.8's general saturated number-field subspace lattice. The retained relation-kernel statements specialize bounded-monomial evaluation and track its integral-image index and discriminant-sensitive conjugate Gram estimate. No general subspace-height formula is replanned.
3. Removed the repeated word in §4.1's description of the selected equation tuple.
4. Used ℚ and ℂ consistently for the coefficient fields in §§0.1–1.1, reserving Q for the absolute constant and C for coefficient-box height. This removes ambiguous ASCII Q references without changing any statement.

No false identity, missing arithmetic hypothesis, vacuous statement or unsupported source generalization was found in the final mathematics pass. No supplier replacement, duplicate-target deletion or mathematical narrowing was needed during this port. Existing supplier exclusions remain recorded only in Scope and ownership: native polynomial carriers, saturation, central-binomial/Catalan objects, generic interpolation, generic lattice estimates, generic Jacobian étaleness, intersection theory, the isomorphism quotient and the completed fixed-ambient Hermite count are not targets here.

Object searches covered main, Completed, the board packages and the indexed 355 open roadmap heads using the required roadmap tools. A separate search covered the 98 README/Lean files of all **49 specifically supplied roadmap folders**. Its only relevant arithmetic-route match was GenericDoublePointInterpolation's generic input. Searches used the objects and operations (conjugate jets, monomial coefficients, kernel/transpose indices, Gram covolumes, Jacobian localization, field factors, coefficient boxes, Catalan rank and compact number-field models), not merely our names. No retained fully qualified declaration collides with a declaration on main or an indexed open roadmap head. Ownership against open heads without supplied files was checked through the index searches only; no additional checkout was sought.

The board contains the overlapping design-only `packages/EffectiveBoundsCompactModels/design/README.md`, with no accepted package README or acceptance module. This job explicitly selects the accepted EffectiveBoundsPartII package as the owner of this arithmetic continuation. That design is neither a new supplier nor a second roadmap folder in this port; its stronger numerical constant and real-cutoff variants are not imported.

### Supplier verification

| Supplier and resolved location | Actual contract read; convention witness recomputed |
| --- | --- |
| Completed/EffectiveBounds, Layers 1–2 | Integral-basis discriminant and fixed-ambient primitive-polynomial Hermite count. For ℚ(i), discriminant −4 and absolute discriminant 4; counting one class differs from counting roots of a polynomial. |
| GeometryOfNumbersAndQuadraticArithmetic §§0.1.2, 0.2.1, 0.2.6, 0.3.3 | Hermitian Gram bound, saturated bases and primitive orthogonal covolumes in a discrete full self-dual ambient lattice. Diagonal and antidiagonal covolumes √2=√2; doubled generator gives 2√2 and fails primitivity. For one vector i, Hermitian Gram determinant 1, unconjugated determinant −1. |
| GeometryOfNumbersAndQuadraticArithmetic §§1.1.2–1.1.5 | Ordered product-root bound and intrinsic cube/ball volumes. Norms (1,2,4) have product 8 and last exponent 1; dimension-two lower ball volume 2≤π; dimension-one lower volume 2, while planar measure of that interval is 0. |
| GeometryOfNumbersAndQuadraticArithmetic §§1.2.7, 1.5.21 | Simultaneous independent witnesses and upper second Minkowski using the same explicit Haar measure on body and lattice. For 2ℤ and [−3,3], (2/3)·6=2·2=4; after multiplying measure by 3, both sides become 12. Witnesses need not generate the integral lattice. |
| GenericDoublePointInterpolation §§0.1, 0.3 | Native total-degree monomials, coefficient equivalence and Euclidean metric. At r=d=2 there are 6 monomials, not 9; X²−2 has squared coefficient norm 5, evaluation 0 at √2. |
| GenericDoublePointInterpolation §§1.3–1.4 | Actual first jets, derivative map on the value kernel and their matrices. At 0, columns (1,X) give determinant 1; at points 0,1, derivatives of X²−X and X³−X² give determinant −1. |
| GenericDoublePointInterpolation §§5.1–5.3 | Nonzero selected integer minor, generic affine principal open and total degree at most dn(r+1), for r,n≥1,d≥5 and sufficient monomials. Seven collinear plane quintic jets have rank 11<21. The arithmetic substitution has complex coefficients, so it uses Mathlib's domain-valued grid theorem directly. |
| SchemeAndStackFoundations main §0.10 | `jacobian_etale_algebra`, for all square systems over a commutative ring: étale and finitely presented, without general-base finiteness. X²−2 localizes to ℚ(√2); X² to 0; tx−1 over A[t] gives A[t,t⁻¹], which is not finite when A≠0. |
| SchemeAndStackFoundations main §5.12 | `bezout_inequality` for projective subscheme degrees; the extra arbitrary-dimensional isolated-point contract is explicitly distinguished. X(X−1),XY has one isolated simple point and a line: 1≤2²=4. |
| ArithmeticStatisticsPartI, Layer 0 §0.7, “Number fields ordered by discriminant” and “Embedded and isomorphism class counts of number fields” | Embedded, isoSetoid, isoFamily and isoDegree are actual proposed supplier names. The two initial resolver leads for isoFamily and isoDegree resolve here. A nonnormal cubic has 3 embedded copies and 1 class; a quadratic has 1 and 1. |
| DiophantineApproximationAndTranscendence main §2.8, “Saturated kernel-lattice covolume” | General W∩𝓞_K^V formula, kept as that roadmap's object. Over ℚ, span(1,2) has covolume √5, and the nonprimitive generator (2,4) gives 2√5. This port instead retains the evaluation-image comparison, whose √5 arithmetic example has index 2. |

### Pinned declaration audit

The checkouts agree with the manifest: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The following are direct inspections at those pins, with paths relative to the corresponding library repository.

| File and lines | Declarations and actual hypotheses |
| --- | --- |
| Mathlib/NumberTheory/NumberField/Basic.lean, lines 41–44 | NumberField carries characteristic zero and finite-dimensionality over ℚ, under Field. It excludes degree zero and the zero ring. |
| Mathlib/NumberTheory/NumberField/Discriminant/Defs.lean, lines 35–50 | discr, discr_ne_zero, discr_eq_discr_of_algEquiv; genuine ring-of-integers discriminant, not an arbitrary rational basis discriminant. |
| Mathlib/NumberTheory/NumberField/Discriminant/Basic.lean, lines 77–81, 124–131, 273–283, 494–500 | rootDiscr, mixedEmbedding.covolume_integerLattice, abs_discr_gt_two and finite_of_discr_bdd; product-volume normalization, degree>1 for the lower bound, and fixed-ambient finite-dimensional intermediate fields for finiteness. |
| Mathlib/NumberTheory/NumberField/CanonicalEmbedding/Basic.lean, lines 79–86, 212–219, 637–655, 815–861 | canonicalEmbedding.norm_le_iff, mixedEmbedding.finrank, latticeBasis and the existing unweighted euclidean.mixedSpace/toMixed. The latter gives squared norm 1 at a complex coordinate 1, unlike the weighted pairing's 2. |
| Mathlib/NumberTheory/NumberField/House.lean, lines 38–51, 74–98 | house, house_eq_sup', house_sum_le_sum_house, house_mul_le, house_intCast and one_le_house_of_isIntegral; the final lower bound requires both integrality and nonzero input. |
| Mathlib/RingTheory/MvPolynomial/Basic.lean, lines 95–96, 164–176 | basisRestrictSupport, restrictTotalDegree and mem_restrictTotalDegree. The definition is support on exponent vectors with sum≤d; it does not impose separate coordinate degree bounds. |
| Mathlib/Algebra/MvPolynomial/Eval.lean, lines 566–577; Mathlib/Algebra/MvPolynomial/PDeriv.lean, lines 54–72 | aeval on native polynomial algebras; pderiv and its monomial formula with exponent factor, over commutative semirings. Ring/field hypotheses are imposed when needed in the arithmetic argument. |
| Mathlib/Combinatorics/Nullstellensatz.lean, lines 62–66 | eq_zero_of_eval_zero_at_prod_finset: finite variables, integral-domain coefficients, coordinate degree strictly below grid cardinality. ℂ is permitted. |
| Mathlib/RingTheory/Discriminant.lean, lines 127–146 | discr_not_zero_of_basis and discr_eq_det_embeddingsMatrixReindex_pow_two, for finite separable field extensions and actual basis/embedding indexing; the target embedding field is algebraically closed. |
| Mathlib/Algebra/Module/ZLattice/Covolume.lean, lines 115–124, 170–185 | covolume_eq_det_mul_measureReal and covolume_div_covolume_eq_relIndex', with discrete full lattices in their common real inner-product space. Lower-rank uses must first pass to that span. |
| Mathlib/GroupTheory/Subgroup/Saturated.lean, lines 62–65 | AddSubmonoid.ker_saturated, for an additive torsion-free codomain. Nonzero integer saturation follows using inverses; multiplication by zero is excluded. |
| Mathlib/RingTheory/Etale/Field.lean, lines 267–285 | Algebra.Etale.iff_exists_algEquiv_prod, for a field base, gives a finite product of finite separable extensions, allowing an empty index. The formally étale variant carries EssFiniteType. |
| Mathlib/Data/Nat/Choose/Central.lean, lines 78–87, 123–129; Mathlib/Combinatorics/Enumerative/Catalan/Basic.lean, lines 126–127 | Native centralBinom, its recurrence and lower exponential bound; native catalan with (r+1)catalan r=centralBinom r. |
| TauCeti/NumberTheory/EffectiveBounds/HermiteCount/Basic.lean, lines 172–203 | ncard_setOf_finiteDimensional_abs_discr_le_le and hermiteCountBound, for fixed-ambient fields and a primitive-polynomial box. |
| TauCeti/Algebra/Module/ZLattice/Covolume.lean, lines 35–46 | ZLattice.covolume_sq_eq_det_gram; actual ℤ-basis of a discrete full lattice in a finite-dimensional real inner-product space, including rank zero. |

Zulip and open Mathlib searches for Couveignes/short integral bases and Jacobian étaleness produced no relevant result. This is a search receipt, not a claim of universal absence. Direct object searches at the pins determine the reuse decisions above.

## Source verification

COU20 is the only directly cited mathematical source. The fetched published PDF has SHA-256 `8d63bd3a14f0d61f421695f1d93559d18fb674240c6dee872c23bf5902e1a104`, matching `packages/EffectiveBoundsPartII/sources.toml`. I read the arithmetic argument through its counting conclusion and rendered published pages 488, 489 and 495. In particular, print has H≥1 in Theorem 2 and d≥5,r≥1 in Proposition 2, although text extraction renders some ≥ glyphs as >. The source line labels below retain the certified package extraction's numbering; theorem, section and published-page locators identify the same passages independently of extraction layout. No source wording was copied into the roadmap.

COU20 line 104 (§2,p.489) supports weighted canonical measure; line 127 (§2,p.490) supports the genuine-integral-basis discriminant covolume; lines 140–164 support the majority-family/product-span argument and Proposition 1. COU20 lines 207–250 (§3,p.492) support integral parameterization, the integer grid and closed immersion. COU20 lines 255–315 (§3,pp.493–494) support the relation lattice, transpose/Gram estimate and heights. COU20 lines 323–351 (§3,p.494) support short witnesses, truncation, full block and a common minor. COU20 line 354 (Proposition 2,p.495) supports the exact explicit bound. COU20 line 385 (§4,equation (1),p.495) and lines 421–430 (§4,p.496) support parameter estimates and counting. Theorems 1–2 are COU20 line 20 (p.487) and line 35 (p.488). The package's inseparable product-span generalization is justified by its written nonzero-functional proof, not by importing a trace-pairing hypothesis from the paper.

No outside text was treated as a command. No suspicious instruction requiring quotation was encountered. No helper agent was used.

## Adversarial mathematics pass

These are computed instances and negative controls, not proofs by testing. Exact ranks and Gram determinants were recomputed with rational Gaussian elimination; binomial/factorial computations were exact. Real logarithm values below are decimal approximations. The central-binomial inequalities were also tested for every 1≤n<10000. Universal proof steps were checked against the source argument and the supplier contracts. Tests outside r≥1,d≥5,M≥n(r+1) evaluate definitions or conditional algebra only.

### Conventions and acceptance definitions

| Statement | Instances tried | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Degree, signed discriminant and δ | ℚ; ℚ(i); ℚ(√5); zero ring | (n,disc,δ)=(1,1,1),(2,−4,2),(2,5,√5); 1≠0 in every field | Positive denominators; zero ring excluded | None |
| Weighted complex normalization | Complex coordinate 1; ℚ(i); real quadratic | House=1, g-norm²=2; product/canonical covolumes 1/2; real square body volumes 4/4 | Weight appears only at complex places | None |
| House versus coefficient norm | X²−2; zero polynomial | Norm²=5, max coefficient=2, value at √2=0; zero has norm=degree=0 | Objects distinguished | None |
| Embedding rows and Gram conjugation | Rows (1),(i); single i | VV* off-diagonals −i,i, native Gram i,−i; both det0; single Hermitian det1 versus unconjugated −1 | Correct transpose and conjugation | None |
| Explicit-range constants | n2,r1,d5 | M6,ℓ4,D20,C₀40δ²,H₀40⁵δ¹⁰,G6·40¹⁰δ²⁰; ℓ≥nr=2 | Natural subtraction and powers valid | None |
| Inclusive unweighted count | Nonnormal cubic; quadratic; n2,H3 | Embedded/classes=3/1 and 1/1; only discriminant −3 qualifies at H3 | No automorphism weight | None |
| Real powers and cutoffs | H1; n1; n0 input | logH=0; log1=0; B(0,1,5,1)=0 because 6/0=0 and 0⁵=0 | Junk input excluded from theorem | None |
| Integral/rational images and intrinsic rank zero | √5,d1; constants over ℚ | Rational rank2, integral index2; constant kernel has covolume1 in dimension0 | No integral-surjectivity inference | None |
| jacobianPolynomial | (X,Y); swapped equations; X²−2 at3; empty system | 1,−1; derivative6 versus value7; empty det1 | Body fixes row order and ordinary derivative | None |
| JacobianOpenAlgebra | X²−2; X²; X(X−1); r0 | ℚ(√2),0,ℚ×ℚ,ℚ | Correct localization and empty product | None |
| HasBoundedModel | ℚ,E=X,κ0,H1; singular E=X²; H<0,r≥1; r0 | Height1≤1,J1; singular J0; off-support coefficient0≤H fails; empty system can give ℚ even at H<0 | Point/equations/map tied together; no free predicate | None |
| explicitCoefficientBound | (n,r,d,δ)=(1,1,5,1),(2,1,5,√8); doubled δ; n0 | B≈13693063.9376 and 32876494803566.3; ratio1024=2¹⁰; B0=0 | Exact formula and restricted theorem agree | None |
| centralBinomialRank | n0,1,2,3,14,15,42,43,65536 | r=1,1,2,3,4,5,5,6,12 | Least positive index, not infimum0 | None |

### Targets and worked examples

| Statement | Instances tried | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| §0.1 canonical pairing/measure/body | ℚ; ℚ(i); totally real quadratic; complex1 | Body volumes2,2π≈6.283≥4,4; scaling determinant2; gauge1 versus norm√2 | All four Checks agree | None |
| §0.2 discriminant covolume | ℚ basis1; ℚ(i) basis1,i; √5 two bases | Gram determinants1,4; covolumes1,2; basis discriminants20 versus5 with ratio2² | Genuine integral basis essential | None |
| §0.3 majority of short integers | n1,4,5 | m1,3,3; 2m−n=1,2,1; exponents1/2,1,5/6; ℚ product1≤1 | All Checks agree | None |
| §0.4 product span | K=k; V=k in quadratic; inseparable degree2; k³×0 in k⁴ | Product dimensions1=1,1<2 at equality,2=2,3<4 despite6>4 | Strict inequality and field hypothesis necessary; separability unnecessary | None |
| §0.5 exists_short_integral_basis | ℚ; ℚ(i); √5 | Houses1≤1;1,1≤4;1,√5≤5 with index2 | Rational basis, not integral basis | None |
| §1.1 integral parameters | ℚ,u3; zero tuple quadratic; √5 basis; repeated basis | κ3; zero value rank1<2; embedding determinant−2√5; repeated determinant0; D0 gives bound0=0 | Map direction and basis condition correct | None |
| §1.2 exists_bounded_first_jet_generators | ℚ,r1,d5; √2; repeated point; D3 grid; collinear plane points | M6,D10,minor1; √2 house≤320 and confluent minor64; repeated rank2<4; grid values0,0,0,6; collinear rank11<21 | Inclusive grid, complex pullback and genericity necessary | None |
| §1.3 value descent | √2; √5; zero in quadratic | Value ranks2,2,1 versus target2; integral indices1,2 in first two cases | Both rational and integral conclusions correctly scoped | None |
| §2.1 integral relation kernel | κ0,d2; constants; √2,d3; κ1/2; quadratic zero tuple | Kernel basisX,X² rank2; constants rank0; relation vectors(−2,0,1,0),(0,−2,0,1) rank2 and Gram diag5,5; 1/2∉ℤ; quadratic kernel2≠M−n1 | Integrality and full rational rank retained | None |
| §2.2 transpose image/index | √5,d1 and2; √2,d1; z↦2z | q2, covolumes√26 and2√26 at d2,1 and2 at d1; q1 for √2; doubling gives1≤2 | Index direction and intrinsic rank0 agree | None |
| §2.3 Gram/discriminant identity | √5,d2, integral and rational bases; ℚ(i) | detBBᵗ104=520/5; rational basis26=520/20; ℚ(i) numerator4, unconjugated−4 | Actual basis and conjugation necessary | None |
| §2.4 monomial heights | r=d2,C₀1; κ0; n2,r1,d5 | M6 not9,H₀1,G6; constant value1 survives at0; C₀40δ²,H₀40⁵δ¹⁰,G6·40¹⁰δ²⁰ | Constant and both exponents agree | None |
| §2.5 relation covolume | √5,d2; zero over ℚ,d2 | √26≤2√26=√(520/5)≤√520; zero tuple gives1=√(1/1) | Discriminant denominator and index agree | None |
| §3.1 short relation witnesses | √2,d3; rational1/2; index2 family; intrinsic dimensions1,2 | Norm product5≤2·5=10; rational norm1/2<1; determinant2; line volume2 versus planar0; square area2≤π and vertex norm1 | Integer lower bound and intrinsic volume essential | None |
| §3.2 truncation | n2,ℓ4; n1; ordered norms1,2,4,8,G4 | k3,codim1,tail2; n1 discards0; product64=4²·4, retained max4≤8 | Exactly n−1 discarded | None |
| §3.3 joint gradient surjectivity | Point0,d1; d0; points0,1,d3 | X↦1 rank1; constant kernel/rank0; derivative columns(−1,1),(0,1), determinant−1 | Values alone insufficient | None |
| §3.4 one full block | Diagonal in ℂ²; coordinate hyperplane in ℂ⁴; zero in ℂ² | Codim/ranks=(1;1,1),(1;1,2),(2;0,0) | Threshold n−1<n exact | None |
| §3.5 common integer minor | X³−2 at ∛2; X²−2 at ±√2; X² at0 | Norm(3κ²)=108, conjugate moduli3·2^(2/3); derivative±2√2≠0; singular derivative0 | Injective embeddings suffice without normality | None |
| §4.1 actual component map | X²−2; product quadratics; X²; swapped plane equations; empty system; dual numbers; characteristics2,3 | Inverse√2/4 and product1; four points/two factors; zero localization; determinants1/−1; empty det1; 2ε≠0 but square0; derivatives1 and2 modulo2,3 | All nine Checks agree; a ring target needs a unit | Wording only |
| §4.2 exists_explicit_small_model | ℚ,E=X; √2,E=X²−2; line-plus-point; larger height; doubledδ; n0 | 1≤1.3693·10⁷;2≤3.2876·10¹³; J(1,0)=1 and line removed; 2≤3 preserves bounds; δ ratio1024; B0=0 | Only Jacobian open asserted finite; all six Checks agree | None |
| §5.1 least rank/size estimates | n0,1,2,14,15; r0,1,2,4 Catalan ratios | r1,1,2,4,5; F1,1,2,14,42; ratios1,2,3<4; 1>3log1=0; 90≤252≤360 | Minimality and eventual logarithmic scope agree | None |
| §5.2 exists_logarithmic_small_models | n14,15; n1; δ1,2 | r4,5 and M70,252; n1 would require1≤0; at n15 logB=90.0488785781+10logδ | Q chosen before K; degree-only parameters | None |
| §5.3 bounded systems | r0; d0; C0; r=d2 | 0 slots/1 tuple; r slots/(2C+1)^r; single zero tuple;12 slots versus wrong18 | Native total-degree carrier and ordering agree | None |
| §5.4 exact coefficient-box count | r1,d2,C1; B3.7; r0,C0; r2,d0,C1 | 3³=27; floor3 gives7 choices versus ceiling9; empty count1;3²=9 | Both directions of floor equivalence valid | None |
| §5.5 bounded_systems_field_class_bound | Quartic product; split quadratic; singular quadratic; plane line-plus-point; C0; empty family | Points/factors/classes4/2/2 and2/2/1 and0/0/0;2≤1485172;1≤54;1≤4; C0 forcesm0; m0 satisfies0≤bound | Factor-to-class surjection, not injection; uses accepted contract | Supplier wording clarified |
| §5.6 discriminant_field_class_bound | H1,n>1; nonnormal cubic; n1,H1; n2,H3; empty family | N0; class weight1 versus embedded3; N1 outside threshold; N₂(3)=1, discriminant−4 excluded;0≤positive bound | Inclusive unweighted count, exact degree and uniform Q | None |
| Worked example: surviving integral index | √5,d2 | B=[[1,−1,5],[0,2,0]], Gram[[27,−2],[−2,4]],det104; V Gram[[31,21],[21,31]],det520=5·104; q2 | Agrees with §§2.1–2.5 | None |
| Worked example: all blocks | n2,relation dimension4; X²−2; X³−2 | Keep3,codim1; at codim2 both ranks can0; derivative±2√2; cubic norm108 | Agrees with §§3.2–3.5 | None |
| Worked example: several classes | Quartic product; X(X−1); X²; plane system | Derivatives∓2√2 and±2√3; classes2,1,0; plane isolated count1≤4 | Agrees with §5.5 and accepted contract | None |
| Worked example: common parameters | n14,15; n1000,Q₀100; H1 | r4,5; n1000 givesr8,M12870,rM102960; logH coefficient71122.24835, box log3 term113113.12124,factor term16.63553; logH1=0 | nlog⁴n and log³n·logH terms agree with §5.6 | None |

### Every API assertion

A1, A2, … identify prose bullets in their existing order within the cited subsection. Each row checks one assertion; none introduces a Lean API declaration. Equalities and membership equivalences were tested in both directions. These rows also test the defining properties against satisfying and failing examples.

| Statement | Instances tried | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| §0.1 A1 Haar normalization | ℚ(i); totally real quadratic | μ_can/μ_product=2¹=2; at r₂0 ratio1 | Correct scalar | None |
| §0.1 A2 measurable-set scaling | Disk; empty set in ℚ(i) mixed space | μ_can(disk)=2π=2·π; μ_can(∅)=0=2·0 | Both positive-volume and empty cases | None |
| §0.1 A3 pairing | Complex1,i; real2,3 | g(1,1)=2,g(1,i)=0; real pairing6 | Factor2 only complex | None |
| §0.1 A4 body volume | Signatures(1,0),(0,1),(2,0) | Volumes2,2π,4 equal2^r₁(2π)^r₂ | Correct formula | None |
| §0.1 A5 gauge=house on K | 1+i in ℚ(i); 2 in ℚ | Gauge=house=√2; gauge=house=2; weighted norm of1+i=2 | Wrong norm excluded | None |
| §0.3 A1 independent ordered witnesses | ℚ(i),1,i | Houses1,1 nondecreasing; real rank2; product1≤2 | Simultaneous independent family | None |
| §0.3 A2 first-m span | ℚ(i); n4 cutoff | For n2,m2,rank(1,i)=2; n4,m3 requires dimension3,not2 | Strict-majority dimension | None |
| §0.3 A3 embedding bounds | ℚ(i),i at both embeddings | Moduli1,1≤δ2 | Both conjugates | None |
| §0.3 A4 full product | ℚ; ℚ(i) | Products1≤1^(1/2)=1 and1≤2^1=2 | Correct n/2 exponent | None |
| §0.3 A5 gauge identification | i in ℚ(i) | Witness gauge1=house1; weighted norm√2 | Wrong gauge rejected | None |
| §1.1 A1 integral tuple | √5 basis, coefficients2,3; all-zero matrix | κ=2+3√5 is integral; κ0=0 | Finite-sum body determines tuple | None |
| §1.1 A2 embedding formula | Same tuple at two embeddings | Values2+3√5 and2−3√5 equal matrix products | Both rows | None |
| §1.1 A3 linear equivalence | Basis1,√5; repeated1,1 | Embedding determinant−2√5≠0 versus0 | Basis hypothesis excludes singular model | None |
| §1.1 A4 box house bound | ℚ,α1,D3,u3; D0 | 3≤1·3·1=3;0≤0 | Inclusive endpoint and degenerate box | None |
| §1.1 A5 reindex/change basis | Swap1,√5 with coefficients2,3; shear to1,1+√5 | Swapped coefficients3,2 give2+3√5; new coefficients−1,3 give−1+3(1+√5)=2+3√5 | Inverse coefficient direction | None |
| §2.1 A1 actual evaluation kernel | √2,d2 | X²−2↦0;1↦1; kernel generated by(−2,0,1) | Constructed kernel fixed | None |
| §2.1 A2 membership iff | X²−2;1;X³−2X at d2 | (degree,value)=(2,0),(0,1),(3,0); membership yes,no,no | Both conditions necessary; both directions | None |
| §2.1 A3 rank under full value rank | √2,d3; zero tuple quadratic,d2 | 4−2=2; zero tuple's actual kernel2≠3−2=1 | Full rational rank necessary | None |
| §2.1 A4 integer saturation | Multiply relation and constant1 by2; multiplier0 | Values0→0 and1→2; multiplier0 sends1→0 | Nonzero multiplier excludes false converse | None |
| §2.1 A5 scalar-extension kernel | √2,d3 | Two independent integral relations; complex value matrix rank2, kernel dimension4−2=2 | Dimensions and actual equations agree | None |
| §2.1 A6 degree inclusion | X²−2,d2→3; X³−2X | Vector(−2,0,1)→(−2,0,1,0),value0; degree3 relation is newly admitted | Inclusion, not equality | None |
| §2.2 A1 transpose construction | √5,d2,dual of actual integral basis | Rows(1,−1,5),(0,2,0); pairing each with(−5,0,1) gives0 | Lands in integral orthogonal | None |
| §2.2 A2 monomial coordinate | Same rows,monomials1,X,X² | First functional values1,−1,5; second0,2,0 | Coordinate formula fixed | None |
| §2.2 A3 injectivity | Same B; quadratic zero tuple | B rank2; rank-deficient tuple has rows(1,0,0),(0,0,0),killing second functional | Rank hypothesis necessary | None |
| §2.2 A4 rank and containment | √5,d2 | S rows independent rank2=n and dot relation0; L⊥ dimension2 | Correct common span | None |
| §2.2 A5 index identity/volume ratio | √5,d1,d2 | q2=[𝓞:ℤ[√5]]; ratios2/1=2 and(2√26)/√26=2 | Rank0 relation case included | None |
| §2.2 A6 integral basis independence | β=(1,(1+√5)/2)→(1,(3+√5)/2) | Gram[[27,−2],[−2,4]] det104; changed[[35,−6],[−6,4]] det104 | Unimodular row change preserves S | None |
| §3.1 A1 sorted short witnesses/product | √2,d3 | Both norms√5, product5≤2^(2/2)·5=10 | Same family satisfies both | None |
| §3.1 A2 degree/vanishing | X²−2,X³−2X at√2,d3 | Degrees2,3≤3; values0,0 | Actual relations | None |
| §3.1 A3 real/complex basis | Same two coefficient vectors | Rank2 overℚ,ℝ,ℂ; relation-space dimension2 | No integral-basis inference | None |
| §3.1 A4 nonzero integer norm≥1 | X; X²−2; rational1/2 | Norms1,√5≥1; rational norm1/2<1 | Integral lattice condition necessary | None |
| §3.1 A5 coefficient≤Euclidean norm | X²−2;0 | Coefficient moduli2,1≤√5; zero coefficients0≤0 | Correct coefficient bound | None |
| §4.1 A1 evaluated determinant | X²−2 at3; E=(X,Y) | Derivative determinant6≠equation value7; plane determinant1 | Ordinary pderiv | None |
| §4.1 A2 ring-map naturality | X²−X modulo2; X³−X modulo3 | Derivatives2x−1↦1 and3x²−1↦2; equal derivative determinants after evaluation | No factorial division | None |
| §4.1 A3 localization extension requires unit | √2; ε in dual numbers | (2√2)(√2/4)=1;2ε≠0 but(2ε)²=0 | Field nonzero sufficient, general ring nonzero insufficient | None |
| §4.1 A4 polynomial compatibility | f=1+X at√2; conjugate point | φ([f])=1+√2=f(κ); conjugate gives1−√2 | Unmarked conjugate map excluded | None |
| §4.1 A5 inverse Jacobian image | X²−2 at√2 | φ(J⁻¹)=√2/4; product with2√2=1 | Inverse forced | None |
| §4.1 A6 uniqueness | Same quotient/localization | Images X↦√2,J⁻¹↦√2/4; any candidate y satisfies2√2·y=1,so y=√2/4 | No map-choice freedom | None |
| §4.1 A7 surjection | ℚ[X] evaluation at√2; zero point quadratic | Values1,√2 span rank2; zero point image rank1<2 | Actual generator condition essential | None |
| §4.1 A8 marked factor projection | Quartic product→ℚ(√2) | Algebra dimension4→field dimension2; kernel is other dimension2 factor | Onto does not imply whole algebra isomorphic | None |
| §4.1 A9 rational/integer determinant comparison | X²−2 at√2; empty determinant | Both yield2√2; empty determinant1 maps to1 | Correct characteristic-zero specialization | None |
| §4.1 A10 quotient/localization maps | X²−2 | Class ofX²−2=0;J·J⁻¹ maps to1; sourceℚ[X]→quotient→localization | Domain and inverted element fixed | None |
| §4.1 A11 row permutation | (X,Y)→(Y,X) | Determinant1→−1; ideal(X,Y) unchanged and both quotient/localizationsℚ | Unit sign preserves principal open | None |
| §4.2 A1 shared point/equations/map | X²−2,κ√2; map using−√2 | E(κ)=0,J(κ)=2√2; changing map sendsX to−√2≠κ | Compatibility rejects mismatched point | None |
| §4.2 A2 monotonicity and equivalence transport | d2,H2→d5,H3; quadratic conjugation | Degree2≤2→2≤5,height2≤2→2≤3;J2√2→−2√2≠0;integral point preserved | Both parts hold | None |
| §4.2 A3 positivity/expansion | n1,r1,d5,δ1 | ℓ5 and B=5^(5/2)√6·10⁵≈13693063.9376>0;√G=√6·10⁵ | Exact expansion | None |
| §4.2 A4 compatible surjection unique | X²−2 at√2 | X forced to√2,inverse forced to√2/4; replacing map by0 givesφ(1)=0≠1 | No arbitrary data | None |
| §5.1 A1 nonempty least admissible set | n15;n65536 | F4=14<15≤F5=42; F11=58786<65536≤F12=208012 | Least witnesses5,12 | None |
| §5.1 A2 positivity/admissibility/minimality | n2;n15 | r2>0,2·3=6=choose4,2; s1 fails4≤2; n15 precedingF4=14<15 | Both membership and exclusion | None |
| §5.1 A3 monomial bounds | n1;n15 | 2≤2≤8;90≤252≤360 | Both inequality directions | None |
| §5.1 A4 eventual logarithmic range | n15;n1 | 5≤r5≤3log15≈8.124; n1 gives1>0=3log1 | Eventual qualifier essential | None |
| §5.1 A5 monotonicity in n | n1≤2≤14≤15 | r1≤2≤4≤5 | Correct direction | None |
| §5.3 A1 defining subset | r=d2,C1 | X²+Y hasdegree2,height1;2X hasheight2;X²Y² hasdegree4 | Both constraints discriminate | None |
| §5.3 A2 membership iff and zero | Same system; zero | Qualifies exactly when degree≤2 andheight≤1;zero hasdegree0,height0 | Both directions,zero included | None |
| §5.3 A3 coordinate identification | r=d2,C1 | Six slots/equation,two equations,twelve slots;each has3 choices | Product dimension correct | None |
| §5.3 A4 finiteness | r=d2,C1;r0;C0 | 3¹²=531441 tuples;empty tuplecount1;zero tuplecount1 | All boundary cases finite | None |
| §5.3 A5 box inclusions | r1,(d,C)=(1,1)→(2,2) | Old count3²=9,new5³=125;1+X remains;X² newly allowed | Inclusion direction correct | None |
| §5.3 A6 native bounded projection | r=d2,C1 | Each equation has six supported monomials with totaldegree≤2;X²Y² hasdegree4 and fails | Native submodule,not separate variable-degree box | None |

The 100 README Checks were also reconciled with these target/API rows and all four worked examples. The remaining elementary comparison witnesses are: the D=0 grid polynomial is 1=0!, the unit interval has intrinsic volume 2, a dimension-two inscribed-square vertex has squared norm 1, a dimension-four cube of half-side 1/2 has squared vertex norm 1 and volume 1, and at real heights 0,0.7,3.7 the permitted absolute integer values end at 0,0,3. Thus floor and coefficient membership agree on both sides of their endpoints. Neither signed determinants nor an embedding multiplicity are exchanged for an absolute bound or a class count.

The number-field assumptions exclude characteristic-p fields, zero rings and infinite degree in arithmetic headlines. Positive-characteristic tests concern only the separately stated native integer derivative naturality and the inseparable field product-span argument. Noncompact/infinite-rank lattice models fail the discrete-full finite-dimensional body hypotheses. The zero-dimensional determinant, covolume and coefficient-box cases were tested explicitly; there is no claim about a nonabelian group, a prime-uniform denominator, a cover, a fan or an unrelated universe-bounded construction.

## Unresolved items

The accepted supplier condition **isolated-affine-bezout** remains explicit. SchemeAndStackFoundations §5.12 on main states the projective two-subscheme degree inequality; it does not expressly export the arbitrary-dimensional affine isolated-multiplicity and invertible-Jacobian multiplicity-one interface consumed in §5.5. The port preserves that accepted condition and does not claim it has been discharged, silently restrict to plane/proper intersections, or rebuild intersection theory. There are no unresolved build, gate, signature, citation or dependency-order failures.


Pull request: #1516 (roadmap/effective-bounds-part-ii at f2ea326)
