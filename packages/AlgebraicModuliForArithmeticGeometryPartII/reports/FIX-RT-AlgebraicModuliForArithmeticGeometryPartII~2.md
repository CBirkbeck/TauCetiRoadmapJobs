# Repair report

## RT-AlgebraicModuliForArithmeticGeometryPartII~2a/F01 (P2) — applied

§5.2: completeness and H² vanishing alone → completeness, H² vanishing and flatness. Added the characteristic-three quartic square-zero counterexample, including its obstruction calculation and numerical restriction image. Also made properness, flatness and completeness explicit in §5.3's curve Check. The headline and its Lean signature already include flatness and are unchanged.

## RT-AlgebraicModuliForArithmeticGeometryPartII~2a/F02 (P3) — applied

Deleted “which precede it in the merge order” from Downstream consumers. The mathematical ownership statements and their named sections remain. A whole-document search found no other merge-process clause in the README or Lean docstrings.

## RT-AlgebraicModuliForArithmeticGeometryPartII~2b/F01 (P3) — applied

§0.5's prerequisites now include §0.4's all-fibres definition. §0.4's prerequisites no longer include §0.5; its closed-point API explicitly identifies §0.5 as the subsequent proof of that characterization. The definition, subgroup and geometric comparison precede closed-point detection, agreeing with Layer 0 Dependencies. No predicate or theorem changed.

## Mathematical verification of the repairs

HW23 line 1395 defines a lift using flatness. HW23 lines 1406–1417 give the complete-DVR obstruction and existence argument. KLE05 lines 2234–2238 identify the obstruction with degree-two cohomology of the actual square-zero ideal. For a flat DVR family the successive ideals are O_X tensor m^n/m^(n+1); this identification is precisely what fails without flatness. The proper version uses SchemeAndStackFoundations §4.10's coherent existence theorem and the existing §5.3 route. No characteristic restriction is introduced.

For the new counterexample let X=P³_k, char k=3, D=V(x₀⁴+x₁⁴+x₂⁴+x₃⁴), and I=i_*O_D. Its partial derivatives are x_j³, with no common projective zero. The hypersurface sequences for O_D and O_D(1) give h²(I)=h³(O_P³(−4))=1, h¹(O_D(1))=0 and h²(O_D(1))=h³(O_P³(−3))=0. The Euler sequence tensored with I therefore identifies H¹(T_X tensor I) with H²(I)=k.

A derivation cocycle θ gives gluing maps (a,m) ↦ (a,m+θ(a)) on split rings O_U⊕I_U, with multiplication (a,m)(b,n)=(ab,an+bm). The cocycle condition is exactly the gluing condition, so this constructs the square-zero scheme. The obstruction of O(1) is the boundary of θ under the restricted Euler sequence: lifting its transition functions gives the same degree-two cocycle. Choose θ with boundary 1, fixing the sign of the identification H²(I)=k. The units sequence then gives δ(O(n))=n·1 and image Pic(𝒳)→Pic(X) equal to 3ℤ. This uses the elementary square-zero units sequence, not the smoothness conclusion of KLE05 Proposition 5.19 for this nonflat family.

The section 1_D of I is fixed by the gluing and defines t. Multiplication by t sends (a,m) to (0,a|_D), so tO_𝒳=I and t²=0. Thus the fibre over k[[t]]/(t) is X. A coherent nilpotent thickening of the proper X is proper over k, and the resulting map to Spec k[t]/(t²), followed by its closed immersion into Spec k[[t]], is proper. The nonzero ring O_𝒳 has t²-torsion and is not flat over the DVR. Its integral numerical restriction image is 3ℤ⊂ℤ, hence its real restriction is an isomorphism, while O(1) has nonzero obstruction. The example is inside §5.2's hypotheses and outside §5.3's flatness hypothesis.

BMP23 lines 825–832 use the all-fibres definition and separately state closed-point detection. STACKS tag 00PH, Algebra line 13506, supplies the dominating DVR used by §0.5. The dependency correction changes neither that argument nor the field-extension theorem. Searched all occurrences of closed-point detection, §0.5, H² vanishing, exact lifting and flatness; the other lifting occurrences already retain the necessary assumptions, including the final Lean headline. Forward interface references in §§2.7 and 4.1 do not enter their definitions' prerequisites.

## Checks and gate outcomes

- Targeted import build: `lake build TauCeti.AlgebraicGeometry.LineBundle.Degree TauCeti.AlgebraicGeometry.LineBundle.Pullback` from the pinned content checkout exited 0: “Build completed successfully (2960 jobs).”
- Elaboration of `packages/AlgebraicModuliForArithmeticGeometryPartII/Suggested.lean` with `lake env lean` from the pinned content checkout exited 0 after adding the `module` header. Exactly ten expected “declaration uses sorry” warnings, at lines 84, 95, 131, 156, 178, 211, 249, 266, 286 and 308; no errors or module-system import warnings.
- All-declaration signature comparison: the scratch file appending one `#check @name` for each of the 18 actual declarations elaborated with exit 0 and the same ten expected sorry warnings. Compared every printed signature with the README. All required binders remain; no Lean edit was needed. The detailed comparison is below.
- Dependency check: exit 0, with exact output below. There is no UPWARD, CYCLE or moved line.

```text
depcheck: 199 roadmaps, 1367 edges, 0 problem(s)
```

`git diff --check` exited 0. Both Lean processes and the targeted build have finished.

The supplied signature failure was a missing imported object file, not a rejected target signature. The two identical module-system import warnings were resolved by adding `module` before the imports in `Suggested.lean`; no mathematical declaration changed. Elaboration and the dependency check were rerun successfully. The citation resolver reports no unresolved roadmap citations or names; its notice that it cannot inspect pinned packages was handled by reading the pinned declarations directly.

## Elaborated signature comparison

All names in this table belong to this package's namespace. There are no ambient section variables. Every name is present in the README; none changes.

| Declaration | Binders and conclusion actually retained; README agreement |
|---|---|
| NumericallyTrivial | Field k, proper structure map x, actual invertible sheaf; integral closed dimension-one test curves. §0.4. |
| RelNumericallyTrivial | Proper f and invertible sheaf, all native residue-field fibres; no Noetherian binder on the definition. §0.4. |
| numericallyTrivialClasses | Field k, X, x and IsProper x; subgroup of native LineBundleClass X. §1.1. |
| relNumericallyTrivialClasses | Proper f; subgroup of native LineBundleClass X. §1.1. |
| numericalClassGroup_free_finite | Field k and proper x; both Module.Free ℤ and Module.Finite ℤ of the additive numerical quotient. §1.2. |
| relNumericalClassGroup_free_finite | Proper f and IsNoetherian S; both free and finite over ℤ. §1.3. |
| HasTrivialNumericalGaloisAction | Both fields, Algebra k K, IsAlgClosure k K, X, x, IsProper x; actual quotient predicate. §2.7. |
| constantNumericalClasses_iff_positivePowerDescent | Same closure and properness binders; a positive d before all L, with M on X and equality in the numerical quotient. §2.10. |
| numericallyTrivial_torsion_of_algebraic_finiteField | Prime p, field k, Algebra (ZMod p) k and Algebra.IsAlgebraic; proper x, numerically trivial L; positive n killing its actual Picard class. §2.12. |
| IsContraction | Actual schemes and morphism; properness and canonical section maps in the real definition. §3.1. |
| contraction_descends_purelyInseparable | Both fields, algebra and purely inseparable extension; proper source and target maps; contraction and over-equation; proper descended target, contraction and both squares. §3.6. |
| IsProjectiveOver | Field K, scheme Y and specified structure morphism y; real homogeneous-Proj embedding definition. §3.7. |
| contraction_descends_of_constantNumericalClasses | Closure, proper source, numerical action, projective target, contraction and over-equation; projective descended target and both squares. §3.7. |
| componentGraph | Native scheme carrier, SimpleGraph on its irreducible components. §4.1. |
| constantNumericalClasses_iff_componentGraphDescent | Closure, proper x, every component dimension 1; graph isomorphism with prescribed projection-image closures. §4.2. |
| fibreComponentGraph_descends_of_constantNumericalClasses | Closure, proper smooth s, pure dimension 2, global-functions isomorphism, numerical action; proper z, contraction f over k; algebraically closed Ω, geometric point, fibre dimension 1; graph isomorphism and closures in S on both sides. §4.8. |
| residueField_eq_of_reducible_geometricFibre | All preceding surface and fibre binders plus nonirreducibility; IsIso of the actual Spec κ(a)→Spec k composite. §4.9. |
| lineBundle_lifts_completeDVR_of_h2_zero | CommRing R, IsDomain R, IsDiscreteValuationRing R, maximal-ideal IsAdicComplete, proper x, **Flat x**, zero native degree-two special-fibre cohomology, special invertible L; actual total invertible M and restriction isomorphism. §5.3. |

## Source, ownership and interface audit

Read the main-branch shapes of JacobianChallenge, StableReduction and AlgebraicVectorBundles before editing. Supplier citations were resolved against main where present and the accessible open heads for new roadmaps. In particular:

| Supplier | Verified contract locations |
|---|---|
| SchemeAndStackFoundations | §§0.9, 0.11, 0.23; §§1.1–1.11; §§2.1–2.3, 2.6, 2.10–2.11, 2.15, 2.22; §§3.4–3.5; §§4.9–4.12; §§5.2–5.3, 5.9–5.10. The names finite_pushforward_exact, etale_galois_comparison, lineBundleNorm, stein_factorization, proper_pushforward and c1_degree_curve occur in those sections. |
| SchemeAndStackFoundations §5.10 | Num.free_finiteRank is a named roadmap target, at README lines 7206 and 7220, for smooth projective surfaces. The supplied resolver warning is not a missing pinned theorem and requires no edit. |
| AlgebraicModuliForArithmeticGeometry | §§1.4–1.6, §2.1, Layer 3, §§7.3, 7.6.1–7.6.1a, 7.9; bigLineBundle, boundedSupportParameters and picard_infinitesimal_lifting. The latter explicitly assumes a flat small Artinian thickening. |
| ComplexComparisonPartII | §§C3.2d.2, C3.2d.4, C3.2e, C3.2f.1–C3.2f.2; universal functions remain in relative representability and Brauer comparison; projective flat geometrically integral fibres remain in the torsion-component theorem. |
| JacobianChallenge | Layers A–D: degree, coherent finiteness, relative base change and projective geometrically integral Picard representability. |
| StableReduction | Layers 1, 2 and 4; J-A2, openness of fibrewise ampleness and universal structure-sheaf contraction descent retain their stated domains. |
| AlgebraicVectorBundles | L0A–L0C and L1A–L1B: sheaves, tensor operations and relative Spec. |
| EtaleCohomologyFoundations | §F.3 proper constructibility and finite cohomology over separably closed fields with invertible finite coefficients. |
| AbundanceStatement | Layers 4A–4D and 5, retaining algebraically closed characteristic-zero projective scope. |
| ResolutionOfSingularitiesCharacteristicZero | §7.8 resolution_field, for reduced finite-type characteristic-zero schemes, with projective regular resolution. |
| Downstream consumers | EnriquesSurfacesAndIntegralNonexistence's numerical-contraction-descent and picard-flatness-betti contracts; K3SurfacesAndSymplecticBoundedness's surface-arithmetic-quotient contract; WeilConjectures WC.7's numerical divisor descent; NeronModelsAndSemistableAbelianVarietiesPartII §2.9. The family and Picard-flatness requests remain explicitly outside this package. |

Ownership was checked by object with `roadmaps grep` across main and indexed open heads and by reading the relevant accessible sibling files, with an additional board-package search. No new target or foundational construction is added: the nonflat example is a Check of this package's lifting interface. Numerical quotients of smooth projective surfaces remain with SchemeAndStackFoundations §5.10; general infinitesimal lifting remains with AlgebraicModuliForArithmeticGeometry §7.3. The six existing supplier gaps agree exactly between Exact supplier contracts and the top-level plan gaps; none changes. No dependency or ownership move is required.

The pins inspected are Mathlib f6090c7095e1e56b3464c1daba5f24631f1290d2 and Tau Ceti 358314d4ab97483df4fc4cb8adcc02e74a8d9f5a, from the supplied manifest. Mathlib's IsProper definition, `Mathlib/AlgebraicGeometry/Morphisms/Proper.lean:41`, has separation, universal closedness and local finite type; it adds no flatness. Flat is separate at `Mathlib/AlgebraicGeometry/Morphisms/Flat.lean:42`. Native fibres, residue maps, homogeneous Proj, semilocal Picard triviality, numerical radical quotients and graph connectedness were checked at those pins. Tau Ceti's Euler degree is truncated at degree two (`TauCeti/AlgebraicGeometry/LineBundle/Degree.lean:70`); coherent finiteness and curve dimension remain required for its degree interpretation. The numerical-pairing theorem supplies nondegeneracy, and the graph theorem consumes the numerical type's connected field; neither supplies the geometric input by itself.

The new source locator lies inside the existing certified KLE05 entry. All cited works have existing certified manifest entries and cached legal texts. No new source, duplicate key, missing-reference request or manifest change is needed.

## Computed adversarial pass

The following rows cover the definitions, assertions and Checks of each numbered target, including the unchanged consumers of the repaired interfaces. Zero rings are excluded as fields but their empty spectra remain admissible schemes. Positive exponents and divisor indices are never zero. Each row records concrete values; it is not an elaboration-based truth claim.

| Statement | Instances tried and computed values on both sides | Result | Change |
|---|---|---|---|
| Conventions: degree and base field | P¹: χ(O(−1))−χ(O)=0−1=−1; O gives 1−1=0; O(1) gives 2−1=1. Over ℝ, P¹_ℂ gives 4−2=2; split base change gives 1+1=2. | Normalizations agree. | None. |
| Conventions: multiplicity and signs | Double line O(1): 3−1=2=2·1. Matrix [[−1,1],[1,−1]] has q(1,0)=−1 and q(1,1)=0. | Nilpotents and full cycles retained. | None. |
| Conventions: exponents and markings | Swap lattice: d=0 sends (1,0) to (0,0); d=1,2 give (1,0),(2,0), neither diagonal. Swapping the two marked split components sends label 1 to 2 rather than 1. | Positive exponent and source marking necessary. | None. |
| §0.1 relative curve pairing | Degrees −1,0,1 on P¹; tensor O(−1)⊗O(1) has 0=−1+1; degree-2 pullback gives 2=2·1; finite scheme gives 0. | Laws agree. | None. |
| §0.2 geometric index | P¹_ℂ/ℝ: m=1,r=2,d=2; purely inseparable constants degree p: m=p,r=1,d=p, for p=2,3; conic: d=1 although Pic degrees are 2ℤ. | Geometric factor differs from curve index. | None. |
| §0.3 field-extension test | P¹_ℝ→P¹_ℂ: degrees −1,0,1 remain −1,0,1, so both kernels are {0}. Generic line in P² over k(u): degree 1 specializes to 1. | Both implications survive. | None. |
| §0.4 absolute predicate | P¹ O(−1),O,O(1) give false,true,false; elliptic O(p−q) gives 0 although p−q≠0 in Pic; finite schemes have no curves. | Numerical is weaker than actual triviality. | None. |
| §0.4 relative predicate and subgroup | id_S: every degree is 0; pr₁ on P¹×P¹ gives b on O(a,b), so kernel ℤ×0; inverse of (a,0) gives (−a,0) and degree 0. | Definition and subgroup precede detection. | Prerequisite clarification. |
| §0.5 closed-point detection | P¹_R O(m): generic and special degrees both m, m=−1,0,1. Special-point blowup O(E): generic degree 0, exceptional degree −1. | Closed-fibre test works; generic-only test fails. | Added §0.4 dependency. |
| §0.6 proper surjective pullback | Normalized nodal cubic: degree d pulls back to d; Bl_p P² pullback hyperplane pairs 0 with E but 1 with a strict transform avoiding p. | All curve tests, not exceptional tests alone. | None. |
| §1.1 quotient and scalar extensions | P¹: ℤ/0=ℤ; identity: Pic/Pic=0; product projection: ℤ²/(ℤ×0)=ℤ; order-2 canonical class maps to 0. | Quotients and kernels agree. | None. |
| §1.2 numerical finiteness | P⁰,∅ have rank 0; P¹ and P² rank 1; elliptic squares have ranks 2+1=3, 2+2=4, 2+4=6. P¹ has dim H²(μ_ℓ)=1. | Rank-zero and finite-rank bound fit. | None. |
| §1.3 relative finiteness | Product absolute rank 2, projection rank 1, identity rank 0. Over Spec ∏ℕ k, coordinate degree functions δ_n have independent values δ_n(m), giving arbitrarily large independent sets. Two-line degrees (1,−1) sum to 0 without vanishing individually. | Noetherianity and componentwise detection matter. | None. |
| §1.4 duality and curve cone | Product pairing [[0,1],[1,0]] has determinant −1; identity has spaces 0 and cone {0}. Irrational matrix A has det 0, det(A+I)=4, det(A+I/2)=7/4. | Perfect pairing does not imply closed effective cone. | None. |
| §1.5 nefness | P¹ O(m), m=−1,0,1, is nonnef, nef, nef. E²=−1 excludes O(E). Projection O(−5,1) has fibre degree 1. | Zero and relative cases fit. | None. |
| §1.6 proper bigness | P⁰ O has h⁰=1 and top intersection 1; P¹ O has h⁰=1 versus linear growth; O(m) has m+1. Product O(m,0) has m+1 versus quadratic growth and square 0. Blowup hyperplane square 1 remains 1. | Dimension and birational comparisons fit. | None. |
| §2.1 proper Picard scheme | P¹: components ℤ with one point each; P¹_ℂ/ℝ has geometric ℤ² and rational diagonal ℤ; finite dual numbers give Pic 0; nodal rational curve has Pic⁰=G_m, tangent dimension 1. | Constants and gluing retained. | None. |
| §2.2 affinization and units | P¹ gives k; two copies give k×k; P¹ over dual numbers gives k[ε]/ε²; (1+εa)(1+εb)=1+ε(a+b). | Reduced affine hull would lose units. | None. |
| §2.3 Brauer comparison | ℂ over ℝ gives Br=0; ℝ×ℝ gives (ℤ/2)²; dual numbers over ℝ give ℤ/2; each finite semilocal algebra has Pic=0. | Degree-one and degree-two comparisons differ. | None. |
| §2.4 representative obstruction | Pointless conic: 2ℤ→ℤ has cokernel ℤ/2, killed by 2; P¹_ℂ/ℝ has constants ℂ and obstruction group 0. | Affinization, not always k. | None. |
| §2.5 torsion component | P¹ gives 0; elliptic curve dimension 1; classical Enriques gives ℤ/2; ordinary characteristic-two Enriques gives μ₂, length 2 with one geometric point. | Full scheme structure necessary. | None. |
| §2.6 numerical local system | Split P¹ gives ℤ fixed; P¹_ℂ/ℝ gives swap of ℤ²; P¹_ℝ⊔Spec ℂ still gives ℤ; S₃ products (12)(23)=(123), reversed=(132). | Zero-dimensional components invisible; abelian equivalence excludes S₃. | None. |
| §2.7 constancy predicate | Split quadric fixes (1,0),(0,1); nonsplit ruling action exchanges them; rank 0 fixes 0. Conic has fixed ℤ but image 2ℤ. | Rank alone does not define constancy. | None. |
| §2.8 norm | Degree-2 constants extension sends O(−1),O,O(1) to O(−2),O,O(2); identity extension sends d to d; a degree-2 then degree-3 tower sends d to 6d. | Rank and composition correct. | None. |
| §2.9 torsor exponent | P=0 gives class 0, and n·0=0 for n=1,2. Pointless conic's τ-torsor is already trivial, while its actual-sheaf obstruction has order 2. | Two obstructions kept distinct. | None. |
| §2.10 uniform descent | P¹ image ℤ gives d=1; conic image 2ℤ gives d=2, d=1 fails on 1; swap lattice diagonal excludes (d,0) for all d>0; zero lattice gives d=1. | Both directions and uniform quantifier verified. | None. |
| §2.11 doubled lift | ℤ/4→ℤ/2: d(1)=2 and π(2)=0=2·1. Kernel of ℤ/8→ℤ/2 has element 2 with double 4≠0, preventing factorization. | Kernel killed by 2 is essential. | None. |
| §2.12 finite-field torsion | y²+y=x³ over F₂: affine counts (2,0), total 3; y²=x³−x over F₃: counts (1,1,1), total 4. Exponents 3 and 4 kill the rational degree-zero groups. Finite X gives exponent 1. | Characteristics 2 and 3 included. | None. |
| §3.1 contraction | Identity section map is identity; blowup pushes O to O; cusp normalization has k[t²,t³]⊊k[t]; P¹_ℂ/ℝ has ℝ⊊ℂ. | Properness alone insufficient. | None. |
| §3.2 rigidity | f=blowup, g=id sends E onto dimension-1 E, so fails curve condition; g=f contracts E to a point and h=id works. | Curve condition discriminates. | None. |
| §3.3 semiampleness | P¹ O(1) generated in degree 1; torsion L^n=O gives exponent n; elliptic infinite-order degree-zero L has h⁰(L^m)=0 for every m>0; E has degree −1. | Nef does not imply semiample. | None. |
| §3.4 semiample dictionary | Product O(1,0) has section dimensions m+1 and target P¹; O_X has constant sections B in each degree, section ring B[t], Proj=Spec B; torsion uses the same Veronese target. | Constants and contractions agree. | None. |
| §3.5 finite definition | Contraction already over k has k′=k and degree 1; conjugate rulings need a degree-2 field of definition. | Source identification retained. | None. |
| §3.6 inseparable descent | k′=k gives identity target square; degree-p inseparability for p=2,3 gives one support component with multiplicity p. Separable ℂ/ℝ produces two components with only one collapsed, exchanged by conjugation. | Separable countercontrol excluded. | None. |
| §3.7 projectivity predicate | P⁰ and ∅ embed; A¹ fails properness; Spec ℂ embeds into P¹_ℝ by T₀²+T₁²=0, but not into P⁰_ℝ. Shift field map leaves t₁ transcendental over its image, so is not finite type as an algebra. | Morphism-to-base equation essential. | None. |
| §3.7 projective contraction descent | Split quadric pr₁ gives descended P¹; identity extension gives original contraction; ∅ forces empty target; nonsplit swapped ruling has (1,0)↦(0,1), failing numerical constancy. | Both descent squares and hypothesis tested. | None. |
| §3.8 ample locus | Product P¹×Y, O(1) gives locus Y; O gives empty locus since fibre degree 0; on ∅ the ample condition is vacuous and locus Y. | Positive-degree condition excludes O on P¹. | None. |
| §4.1 component graph | ∅ gives (vertices,edges)=(0,0); disjoint lines (2,0); intersecting lines (2,1); irreducible nodal curve (1,0). Normalization changes (2,0)→(2,1). | No loops; vertex bijection alone insufficient. | None. |
| §4.2 curve graph descent | Split meeting lines give trivial ℤ² and graph (2,1) on both sides; P¹_ℂ/ℝ has 2→1 vertices and nontrivial swap; P¹_ℝ⊔Spec ℂ has 3→2 but constant ℤ and fails purity. | Marking and purity necessary. | None. |
| §4.3 surface matrices | Two lines give [[1,1],[1,1]], q(1,1)=4; exceptional curve gives −1; fibre 0. Degree-2 constants double intersection 1 to 2. Inseparable divisors give p² versus reduced-support value 1, p=2,3. | Sign, residue degree and multiplicities agree. | None. |
| §4.4 surface contraction types | P¹×P¹→point has target dimension 0; blowup→P² dimension 2 and function-field degree 1; pr₁ has target dimension 1 and connected P¹ fibres. | Three cases distinguished. | None. |
| §4.5 exceptional negativity | Rational blowup E²=0−1=−1; degree-2 point gives 0−2=−2; base change E₁+E₂ gives −1−1+0=−2. A₂ q(1,1)=−2. | Whole pullback preserves value. | None. |
| §4.6 fibre Zariski lemma | I₂ matrix has q(1,0)=−2, q(1,1)=0 and radical (a,a); one-component matrix [0] has radical all ℚ; singleton proper submatrix in I₂ is [−2]. | Reducibility required for individual negativity. | None. |
| §4.7 negative-curve descent | Distinct conjugate exceptional curves: E₁²=−1, E₂·E₁=0, so (E₁−E₂)·E₁=−1; real quadric ruling has square 0 and is not forced to descend. | Uniqueness excludes conjugate exchange under constant Num. | None. |
| §4.8 fibre graphs | Blown-up rational fibre gives (2,1) on both sides; generic fibre gives (1,0), both closures S; nonsplit real conic fibre has 2→1 vertices and nontrivial numerical action. | Generic-point marking valid. | None. |
| §4.9 residue field | Reducible rational blowup fibre gives [κ(a):k]=1; smooth fibre at degree-2 point has one geometric component and fails reducibility; target point gives fibre dimension 2 and fails dimension 1. | No rationality claim for irreducible fibres. | None. |
| §4.10 labels | Blown-up rational fibre has label 1=1 after extension; irreducible fibre has 0 edges; degree-2 restriction-of-scalars ambient surface has value 2, distinguished from the rational-fibre case. | Correct ambient-field convention. | None. |
| §5.1 numerical restriction | P¹_R maps degree m to m; identity maps 0→0. Quadric over ℤ_(5): generic rulings swapped, rank 1; −1=2² in F₅, special rank 2. | Injective need not mean surjective. | None. |
| §5.2 numerical representatives | Elliptic model: degree lattice ℤ→ℤ, rational points order 5 versus special order 10; affine counts (0,1,2,0,2,2,2) plus ∞ give 10. Outside image, tenth power is O while original need not lift. | Numerical and exact lifting differ. | Added flatness to exact-lifting Check. |
| §5.2 new square-zero witness | h²(O_P³)=0, h²(I)=1; δ(O(−1)),δ(O),δ(O(1)),δ(O(2)),δ(O(3))=(2,0,1,2,0) in F₃; restriction image 3ℤ, real map multiplication 3 invertible; t²=0≠t² in k[[t]]. | Counterexample valid and nonflat. | Added Check. |
| §5.3 actual lifting | Flat P¹_R: O(−1),O,O(1) restrict identically, obstruction 0; abelian/K3 surface h²=1 fails vanishing; ∅ gives unique trivial invertible sheaf. | Flat complete lifting remains true. | Clarified curve Check hypotheses. |
| §5.4 cones | P¹_R: N¹=ℝ, curve cone ℝ≥0 on both sides; identity: spaces 0, cone {0}; quartic thickening: integral map 3ℤ⊂ℤ still gives real cone ℝ≥0. | Cone identification needs no flatness. | None. |
| §5.5 specialization | O(1) on P^n has top intersection 1 in both fibres. Three-point blowup H²=4−3=1 in both; special H·ℓ=2−3=−1, generic effective exceptional intersections 1 and pair-line intersections 0. | Direction is special nef ⇒ generic nef. | None. |
| §5.6 semiample numerical descent | Projection O(a,0) gives m=1,M=O(a); O(0,1) has fibre degree 1, excluded. Infinite-order elliptic degree-zero L has no trivial power, failing semiampleness. | Both assumptions used. | None. |
| §5.7 vertical descent | Identity gives M=L; projective bundle generically trivial degree gives relative degree 0. Blowup O(−E) has degree 1 on E while pullbacks have 0; E maps to codimension 2, excluded. | Divisor-image condition necessary. | None. |
| §5.8 extremal normalization | P¹_ℂ/ℝ gives 2/2=1; normalized H-values 1,2 give −2,−4 for D=−2H; replacing H by 3H gives 3,6 with same minimizer. | Maximum direction and positive denominator correct. | None. |
| §5.9 AHK rank | P² identity 1−0=1; blowup 2−1=1; point 0−0=0; conic cone F₂ resolution 2−1=1; threefold small resolution 2−0=2 versus Cartier rank 1. | Integer subtraction and non-ℚ-factorial distinction correct. | None. |

The existing supplier-gap statements were also tested at their interfaces:

| Statement | Instances and computed values | Result | Change |
|---|---|---|---|
| Finite-point numerical detection | Two disjoint lines, O(1)⊔O(−1): total Euler difference 0, component degrees 1 and −1; P¹_R O(m): selected special degree m. | Componentwise contract discriminates. | None. |
| Proper birational section comparison | Bl_p P², hyperplane: both h⁰(m)=binom(m+2,2), difference 0≤C·m; dimension-0 birational integral map is an isomorphism and difference 0. | No top-intersection theorem requested twice. | None. |
| Proper Picard nonflat descent | Nodal rational curve has Pic⁰=G_m versus 0 for its normalization; dual-number proper scheme has Pic group 0 but nonreduced constants of dimension 2. | Gluing and nilpotents not discarded. | None. |
| Proper Hilbert tangent | Exceptional (−1)-curve: h⁰(O_E(−1))=0; a line in P² has normal O(1) with h⁰=2. | Tangent contract distinguishes rigidity. | None. |
| Exceptional degree witnesses | Blowup at rational point: O(E)·E=−1, coefficient a gives −a, zero iff a=0; at degree-2 point gives −2a, same kernel. | Degree formulation independent of numerical quotient. | None. |
| Projective nef/big criterion | P⁰: top intersection 1, h⁰=1; P¹ O: top 0, h⁰=1; P² O(1): top 1, h⁰=(m²+3m+2)/2. | Growth degree and positivity agree. | None. |

No source text was copied into the roadmap or this report. No Lean declaration was added, deleted or renamed; no downstream cited name changes. No supplier contract, source manifest, metadata or plan change is needed. The README repairs, Lean module header and this report are submitted; no commit or network write was made.
