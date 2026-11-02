# Review of EnriquesSurfacesAndIntegralNonexistence (pull request #1488 at e030a1b)

**Verdict:** needs changes

## R01 (P1) — Replace the nonexistent WeilConjectures export names

**Location:** TauCetiRoadmap/EnriquesSurfacesAndIntegralNonexistence/README.md:73, and the corresponding named references in the Needs lines. The contract says WC.7 supplies `IsEnriques`, `enriques_characterization`, `enriques_baseChange`, `enriques_etaleInvariants`, `numericalPicardLocalSystem`, `count_surface_of_constant_num` and `count_enriques_or_rational_genus_one`.

**Claim:** These are named supplier exports. None of these seven names occurs in the supplier's current README or Suggested.lean. This is supplier declaration drift, classified P1 by the review contract; it is not a claim that the underlying mathematics has no owner.

**Witness:** TauCetiRoadmap/WeilConjectures/README.md:1710, :1822 and :1840 contain the relevant prose targets; its Suggested.lean:145 instead begins `weilConjectures_smooth_proper`. Searching both files for the seven advertised identifiers returns no matches.

**Repair:** Cite WeilConjectures §§7.12–7.14 by their actual section titles and describe the consumed statements in prose. Remove the claims that those seven identifiers are supplier declarations, including in Needs lines. Do not introduce another Enriques predicate or point-count theorem here. The replacement resolves the mathematical contract: §7.12 has the characteristic-sensitive Enriques condition, field extension and invariants; §7.13 has the constant-Num formula; §7.14 specializes it. The replacement formula gives 1+10·2+2²=25 and 1+10·4+4²=57, exactly the two consumer checks, and retains nonclassical characteristic-two surfaces.

## R02 (P3) — Remove the two fixed-cardinality computations from Suggested.lean

**Location:** TauCetiRoadmap/EnriquesSurfacesAndIntegralNonexistence/Suggested.lean:120 and :130, `firstLattice_isotropic_card` and `secondLattice_isotropic_card`; README.md:1591 and :1615.

**Claim:** Each admitted declaration computes the number three for the isotropic classes of one fixed matrix. These are useful discriminant-form checks, but the acceptance-test rule excludes fixed small-value computations, even when their proof takes more than one tactic.

**Witness:** For each matrix the four classes have half-norm values 0, 1/2, 0, 0 in ℚ/ℤ. Exactly three values vanish. These are the same vector/spinor computations already described in README §§6.2–6.3.

**Repair:** Delete both declarations from Suggested.lean; keep the evenness and isotropic-class computations in the README, removing the claims that these two Lean names are declared. The exact rational computation gives three in both models, so no mathematical statement needs correction. The remaining discriminant-group statements can retain the native lattice definitions. Do not replace the deleted statements with proved examples or in-place proofs.

## R03 (P3) — Repair the dangling local §4.3 reference

**Location:** TauCetiRoadmap/EnriquesSurfacesAndIntegralNonexistence/README.md:1940: “§4.3 here uses the local LLR04 theorem.”

**Claim:** There is no §4.3 in this README: §4.2 is followed by §4.4.

**Witness:** README.md:1183 and :1199 delimit those two headings. The ownership paragraph at :13 places local geometric Kodaira matching in NeronModelsAndSemistableAbelianVarietiesPartII §3.11.

**Repair:** Replace the nonexistent local reference with the actual supplier §3.11, and distinguish the residue-field identification in local §4.4. This preserves the example of a torsor double fibre versus a simple Jacobian fibre: geometric Kodaira types agree after removing multiplicity; multiplicities 2 and 1 are not identified.

## Verified sound

The review covered both target files at the requested head, all 110 numbered targets and their Checks, the fifteen seeded source targets, the twelve elaborated declarations, the six admitted theorems, the six declared gaps, ownership searches, and supplier order. The findings above do not allege a false geometric endpoint. The finite-field endpoint explicitly depends on the fourteen-case completeness theorem and the three new exclusions; neither was treated as proved merely because it is planned.

**Gate and elaboration.** The worker's head-specific gate passed every rule, including targeted build, imports, sorry-data, set_option, stray-files, outside-folder edits and dependency checks. Independently running Lean on the original Suggested.lean succeeded with exactly the six expected sorry warnings. A scratch copy checked all twelve declarations with `#check @name`; the expanded types agree with the README, including the positive-cone hypotheses, nonzero dyadic argument, Fin 2 exponents and native discriminant groups. No section binder disappeared. No target file was changed.

The required dependency command returned:

```text
depcheck: 204 roadmaps, 1496 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. The actual head is e030a1bced0e063ec3d08a78142060f2ff80cfd2. The outside-folder diff and final worktree status were empty.

**Principles and ownership.** This is an arithmetic/characteristic-two extension of EnriquesSurfaces, whose introduction identifies where the base stops. It does not replace that roadmap's characteristic-not-two work. The arbitrary-field, quasielliptic, algebraic-space, nonsplit and prime-two cases are retained. The three extra elliptic candidates are explicitly additional proof obligations, not discarded “bad” cases. The text contains mathematical constructions and small checks rather than an executable classification algorithm. No sorry'd data, free Prop surrogate, forbidden import, or option override occurs.

Object searches used the roadmap service over main and indexed open heads, the supplied sibling checkouts and the board packages, then the pinned libraries. Searches covered canonical covers, conductrices, numerical Picard quotients, genus-one Jacobians, finite-flat nonlifting, deformation rings, positive-cone decomposition, the Gram lattices and dyadic square classes. Board matches for the new conductrix and numerical decomposition material were this package, not independent competing owners. The copies in the package and PR are the same roadmap, not duplicate ownership. No collision of this Suggested.lean namespace with another roadmap was found. This review did not review unrelated open folders.

The ownership boundaries resolved as follows. Line numbers refer to the actual repository files, without the roadmap service's one-line display banner.

| Supplier and locator opened | Consumed object and scope checked |
| --- | --- |
| EnriquesSurfaces README §E0–E1f, aliases at line 51 and §§1.1–1.6 | Characteristic-not-two invariants, canonical cover, numerical pairing, lifting and half-fibres. No characteristic-two conclusion is imported from them. |
| WeilConjectures README §§7.12–7.14, lines 1710, 1822, 1840 | Arbitrary-field Enriques condition and constant numerical Picard count exist as prose targets; R01 concerns the nonexistent exported names. |
| K3SurfacesAndSymplecticBoundedness README §§1.1–1.3, lines 273, 302, 316; §6.0b, line 782 | Shared K3 predicate, field extension, projectivity; genus-one comparison and Euler invariants, with the general carrier imported there from NeronModelsAndSemistableAbelianVarietiesPartII. |
| NeronModelsAndSemistableAbelianVarietiesPartII README §§2.1–2.5, 2.9–2.16; §3.11, line 8729 | Regular nonsmooth generic curves are allowed; labelled graph descent does not split conjugate branches; geometric Kodaira comparison removes torsor multiplicity. |
| Same supplier §§4.1–4.3, 4.7–4.8, 4.16–4.18, lines 8882, 9037, 9295, 9337, 9367 | Wild canonical formula, restriction/vertical kernel, quasielliptic rank, unpointed Jacobians, Tsen only over algebraically closed constants. |
| Same supplier §§5.1–5.8, 6.1, 7.4, lines 9459, 9630, 9792, 10060 | Rational-fibre counts, constant-Picard criterion, rationality criterion, and the fourteen-case completeness obligation. The three extra rows are explicitly present. |
| ComplexComparisonPartII README C3.2d.2–C3.2d.5, around lines 1975–2030 | Relative Picard algebraic spaces, Picard–Brauer obstruction and finite Cartier-dual torsors; no general separatedness or automatic vanishing of obstruction. |
| AlgebraicModuliForArithmeticGeometry README §§7.6.1–7.6.1a, lines 9662–9728 | Relative Picard sheaf, base change, kernel and section splitting. |
| FiniteFlatGroupsAndIntegralPadicHodgeTheory README R07.1.34–R07.1.35, lines 2428, 2472 | Oort–Tate parameters ab=2, duality exchanging a,b, and the étale/multiplicative alternatives. The general local-group W₂ obstruction remains a declared extension. |
| InverseGaloisAndArithmeticFundamentalGroups README IG.0.3, line 666 | Finite monodromy on connected normal locally Noetherian bases; Spec ℤ satisfies these hypotheses. |
| SchemeAndStackFoundations README §§0.9, 0.11, 0.29; §§1.2–1.9; §§2.2–2.6, 2.11, 2.15, 2.20, 2.22 | Base change, Frobenius, algebraic spaces/descent, Leray/torsors, coherent duality, Kummer and Brauer inputs are named there. |
| Same supplier §§4.1–4.6, 4.10, 5.9–5.10, lines 5066–5291, 5487, 7129, 7175 | Thickenings, marked deformations, coherent existence, intersections, adjunction, RR and Hodge index. Coherent existence is not used to manufacture an algebraization. |
| AdicSpacesPartIII README F0.3, F0.7–F0.8, R2.9–R2.10, lines 1964, 3275, 3616, 7831, 8656 | Formal tower comparison, ample-line algebraization, flatness and smoothness. The proper closed-fibre-neighbourhood argument globalizes the smooth locus. |
| IntegralLattices README Layer 6, milestone 6A, line 1643 | Indefinite even unimodular classification; not definite rank-sixteen uniqueness. |
| AlgebraicVectorBundles README L1A, line 269; JacobianChallenge README Layer D, lines 218, 255 | Relative Spec and projective Picard representability; no pointed-curve constructor is substituted for a quasielliptic Jacobian. |
| LocalFieldsRamification README Layers 1–2, lines 282, 577 | Units, power classes and unramified extensions; the deep-unit threshold distinguishes mixed characteristic and is 2e+1. |
| EtaleCohomologyFoundations README F.0.2, line 200 | Finite étale Galois categories, used with the surface-specific cover argument. |

**Declared gaps.** All six slugs occur both in packages/EnriquesSurfacesAndIntegralNonexistence/design/plan.json and the README's Exact supplier contracts: numerical-contraction-descent; picard-flatness-betti; finite-local-group-w2-nonlifting; one-obstruction-regularity; differential-w2-nonlifting; fontaine-low-degree-hodge. Each names an owner, a precise domain and a consumer. None was treated as supplied merely by a nonexistent Part II section. The gap domains retain flat Pic^τ and locally constant numerical rank; the Betti equality and Henselian dimension bound; the α_(p^n) direct summand; the independent characteristic-zero lift for Witt flatness; exact-order-two ω and positivity/divisibility; and smooth proper local models at every prime, respectively. No additional duplication defect was established for these general contracts.

**Pinned library audit.** The manifest pins are Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. The following declarations and definitions were opened or matched at those pins, not inferred from newer documentation.

| Pinned file and line | What it supplies; restriction checked |
| --- | --- |
| Mathlib/RingTheory/Kaehler/Basic.lean:148 | `KaehlerDifferential`, the native local module; not a preconstructed surface differential sequence. |
| Mathlib/LinearAlgebra/StdBasis.lean:120 | `Pi.basisFun`, the coordinate basis. |
| Mathlib/NumberTheory/NumberField/ExistsRamified.lean:57 | `bijective_algebraMap_int_of_finite_of_unramified`; finite, unramified, faithful and domain hypotheses remain necessary for the stated application. |
| Mathlib/NumberTheory/Padics/Hensel.lean:459 | `hensels_lemma`; strict derivative-norm inequality, not a nonspecific “mod p root” criterion. |
| TauCeti/LinearAlgebra/IntegralLattice/Basic.lean:63, :156, :261, :295 | `IntegralLattice`, `integralForm`, `ofGramMatrix`, `integralForm_ofGramMatrix_apply`. The fields impose symmetry/integrality and a full lattice, not nondegeneracy. |
| TauCeti/LinearAlgebra/IntegralLattice/Examples.lean:83 | `hyperbolicPlane` uses diagonal zero and off-diagonal one. |
| TauCeti/LinearAlgebra/IntegralLattice/RootLattice/D8Plus/Basic.lean:164 | `d8PlusLattice`, the positive spinor-glue model; its form is negated in the proposed numerical lattice. |
| TauCeti/LinearAlgebra/IntegralLattice/Orthogonal/Sum.lean:84; Scaling.lean:261 | Orthogonal sum and negation keep the intended integral carriers. |
| TauCeti/LinearAlgebra/IntegralLattice/Discriminant/Quadratic.lean:122, :129 | `discriminantQuadraticMap` is half-norm modulo ℤ, with its representative formula. |
| TauCeti/LinearAlgebra/IntegralLattice/Overlattice/Isotropic.lean:347 | `evenIntermediateCarrierOrderIsoIsotropicSubgroup`; even intermediate carriers correspond to quadratic-isotropic subgroups. |
| TauCeti/NumberTheory/Padics/SerreSigns.lean:194, :219 | Unit decomposition into (−1)^e5^b times a square; dyadic units are squares exactly at depth three. |
| TauCeti/NumberTheory/LocalField/SquareClass.lean:128 | `card_squareClasses_padic_two` counts eight classes; it does not itself give this ordered representative theorem. |
| TauCeti/NumberTheory/LocalField/WorkedExamples/UnramifiedQuadratic.lean:53, :80, :146 | The polynomial X²+X+1, its root field and unramified instance. |
| TauCeti/Algebra/AlgebraicGroup/RootsOfUnity/Scheme.lean:82; AdditiveFrobeniusKernel/Basic.lean:164 | Native μ_n group scheme and α_p coordinate Hopf algebra; the latter uses prime p and characteristic p. |
| TauCeti/AlgebraicGeometry/LineBundle/Class.lean:50; CartierDivisor/Picard.lean:75 | Line-bundle isomorphism classes and Cartier-divisor map. These are not the numerical surface quotient. |
| TauCeti/AlgebraicGeometry/WeilDivisor/Scheme/PicZero.lean:75, :88 | Euler degree and its kernel for the stated integral Noetherian proper regular-curve domain, with the cohomological finiteness assumptions. |
| TauCeti/AlgebraicGeometry/PicardFunctor/Rigidified.lean:66 | Rigidified functor requires an actual section; no section-free representability conclusion is built into it. |
| TauCeti/AlgebraicGeometry/AffineGroupScheme/CartierDuality/FiniteLocallyFree.lean:271 | Cartier duality for finite locally free commutative affine group schemes over a commutative ring. |

The geometric Enriques predicate, numerical surface Picard quotient, canonical surface torsors and Enriques deformation stack are not supplied by those native line-bundle and group-scheme definitions. Searches for the geometric Enriques objects at both pins found no implementation that would make the docstring's omitted geometric headlines immediately statable.

**Source sample.** All fifteen requested targets were compared with the legally cached texts. Page numbers below are the manuscript's printed pages, as specified in the README. A derived statement is identified as such rather than attributed to a nonexistent theorem.

| Sample target | Text inspected and result |
| --- | --- |
| 1.19 | ESB21 Proposition 3.16, pp. 12–13, line 458: quasielliptic E₇/E₈, simple or double, forces exceptionality. The contrapositive retains both multiplicities. |
| 1.22 | ESB21 Corollary 4.3, p. 14, line 517, following Theorem 4.2: the T₂,₃,₇ configuration forces exceptionality. |
| 1.23 | MMV22 Theorem 1.2, p. 2, line 33; unique-pencil discussion line 52 and Remark 1.5 line 58: the extra-special E₈ exception and its characteristic-two restriction are retained. |
| 1.25 | MMV22 Lemma 2.1, p. 3, line 101, plus SCH23 Proposition 13.2 proof, p. 47, line 2114. The bound is a derivation using the signature and primitive half-fibres; the source's final inequality uses full fibres. |
| 2.1 | SCH23 §5, p. 14, line 583: flat proper finitely presented algebraic spaces and geometric Enriques fibres. Smoothness is a consequence, not an additional scheme hypothesis. |
| 2.9 | SCH23 Proposition 5.4, p. 15, lines 629–652: torsor twisting after one canonical covering exists. |
| 2.10 | SCH23 §5, p. 15, lines 653–658: constant full Picard versus split extension and constant Num. |
| 2.12 | SCH23 Theorem 5.6(i), p. 17, line 725, and proof line 746: nontrivial canonical class of order two. The proof of this part needs full Picard constancy, not the later Brauer-vanishing descent hypothesis. |
| 2.18 | SCH23 Theorem 5.6, pp. 16–18, line 718, with finite-field Brauer vanishing explicitly used at line 680. Pic(F_q)=0 and Br(F_q)=0 supply the specialization. |
| 3.7 | This is explicitly an added twist calculation extending SCH23 Proposition 5.5, p. 16; all eight products were computed below. It is not falsely presented as a verbatim theorem in SCH23. |
| 3.11 | SCH23 Proposition 5.5 proof, p. 16, lines 682–702. The roadmap supplies the missing comparison of independent covers through §§3.5–3.9, then retains projective scheme models over every ℤ_p. |
| 5.3 | SCH23 Proposition 11.1, p. 33, lines 1458–1489: the four quasielliptic triples and component-rank argument. |
| 7.2 | SCH23 Proposition 13.2 proof, p. 45, lines 2030–2033: four possibilities; the six vectors and involution were independently enumerated. |
| 8.4 | DI21 Theorem 7.2, pp. 23–24, lines 1026–1059; Proposition 3.3 and Corollary 3.4, pp. 11–12, lines 494–525. The roadmap supplies independent characteristic-zero lifting before asserting Witt flatness. |
| 8.5 | SCH23 Theorem 5.2, p. 14, line 599; DI21 Theorem 7.2, pp. 23–24, line 1026. The algebraic-space-to-scheme nilpotent-thickening step preserves the family scope. |

Additional checks included Lang1983 Theorems 4.1–4.2, printed p. 62, lines 757–778; EHS12 Proposition 4.2 and Corollary 4.3, pp. 31–32, lines 1369–1408; DI21 Proposition 4.2 and Theorem 4.3 proof, pp. 15–17, lines 668–752; DI21 Theorem 6.1, pp. 20–22, lines 854–870; ESB21 Proposition 2.8, pp. 6–7, lines 203–245; the two SCH23 inverse matrices and generic Picard argument, pp. 41–44, lines 1844–1976. Stacks tag 0D3D was fetched through the sources service and read at Stacks line 1008: it is openness of relative ampleness for a proper morphism of algebraic spaces. The settled unavailable texts are listed below.

**Adversarial calculations.** Each numbered target has a row below. “Consistent” means that the displayed numerical, algebraic or boundary test agrees with the statement and its hypotheses; it is not a claimed proof of a deep geometric classification. Conditional graph cases test the stated contradiction under the candidate hypotheses, without claiming that a nonexistent surface realizes them. Where several API laws use the same carrier, their identity/base-change and wrong-model tests are recorded together. The tables explicitly separate computed finite checks from source verification.

| Statement | Instances tried | Computed values on the two sides | Result; change |
| --- | --- | --- | --- |
| Conventions: full/half fibre | R·F=1; F·F′=1 | R·2F=2·1=2; (2F)·(2F′)=4·1=4 | Consistent; none |
| Conventions: signs and Frobenius | U basis e,f; a root; q=2,4 | e²=f²=0, e·f=1, (e+f)²=2; root²=−2; untwisted eigenvalues 2,4 versus twisted 1,1 | Consistent; none |
| Supplier names, R01 | Seven advertised exports; actual §§7.12–7.14 | Identifier matches 0/7; mathematical contracts present 7/7; counts 25 and 57 unchanged | Citation repair R01 |
| Numerical-descent contract | Split/nonsplit quadric; α₂ over k[ε]/ε² | Split rank 2 versus nonsplit invariant rank 1; α₂ coordinate k-length 4 versus geometric point count 1 | Hypotheses distinguish the cases |
| Picard-flatness contract | Classical/nonclassical Enriques | b₁=0=2(0−0)=2(1−1); nonflat test below has length 3≠4 | Consistent conditional contract |
| Finite-local-group contract | α₂ over W₂(k); ramified π²=2 | Unramified Oort–Tate a,b∈(2) gives ab=0≠2; ramified a=b=π gives ab=2 | W₂ obstruction does not exclude ramified lifts |
| One-obstruction contract | k[[t₁,…,t₁₂]]; W[[t₁,…,t₁₂]]/(2−t₁²) | Both regular dimension 12; first has 2=0 and is not W-flat, second has 2=t₁²≠0 and is W-flat | Independent characteristic-zero premise matters |
| Differential obstruction contract | Classical exceptional versus supersingular | ord(ω)=2 versus 1; classical h⁰(L)=h⁰(Lω)=1 | Supersingular case correctly excluded from this input |
| Fontaine contract | K3 and ℙ² over characteristic zero | h²(O_K3)=1 versus required off-diagonal 0; h²(O_ℙ²)=0 | Correct obstruction, conditional on settled source |
| 0.2 Pic^τ | μ₂, α₂, constant ℤ/2 in characteristic two | Algebra lengths 2,2,2; geometric point counts 1,1,2 | Length and points not conflated |
| 0.3 coherent invariants | Classical; ordinary/supersingular | (h¹,h²)=(0,0),(1,1); χ=1−0+0=1−1+1=1 | Consistent |
| 0.4 numerical lattice | U⊕E₈(−1); U alone | Rank 10, determinant −1, signature (1,9); U has rank 2, so fails the surface invariant | Consistent |
| 1.1 half-fibre | Smooth 2E; double IV*; zero | 2E=2E; central coefficients 2·3=6 versus twice reduced 2; 2·0=0≠2E | Three wrong-model tests discriminate |
| 1.2 curves/two-sections | Geometric root; conjugate pair; horizontal degree four | Adjunction p_a=1+(−2)/2=0; conjugate union square −2−2+2=−2 but has two geometric components; R·F=2 gives degree 4≠2 | Geometric integrality and exact degree retained |
| 1.3 canonical-type pencil | Primitive D; double 2D | D²=(2D)²=0; primitive coefficient gcd 1 versus 2; same pencil after doubling | Primitivity prevents arbitrary multiples |
| 1.4 half-fibre iff | F; 2F; 0 | Squares 0,0,0; primitive flags 1,0,0 and nonzero flags 1,1,0 | Both directions use all stated conditions |
| 1.5 reflection | C²=−2, D·C=−1 | (D−C)·C=1; (D−C)²=D²−2(−1)−2=D² | Reflection sign correct |
| 1.6 genus-one existence | U basis isotropic vector | e²=0 and divisibility gcd(1,0)=1; zero vector divisibility 0 | Numerical input consistent; geometric existence separately sourced |
| 1.7 multiple fibres | 2F versus candidate 3F | Primitive multiplicity gcd 2 versus 3; 2F has even intersection with every divisor | The target excludes multiplicity 3 |
| 1.8 integral two-section | Square −2 and square 0 | Adjunction arithmetic genera 0 and 1; degree against 2F is 2 in both | Neither branch is suppressed |
| 1.9 classical criteria | Classical; nonclassical char 2 | (ordω,h¹,number of tame doubles)=(2,0,2); nonclassical ordω=1,h¹=1 | Correct direction and characteristic split |
| 1.10 canonical bundle | Distinct tame half-fibres F₁,F₂ | 2(F₁−F₂) linearly 0; numerical class 0; canonical order 2 rather than 1 | Numerical zero is not line-bundle zero |
| 1.11 tame types | E₂/E₄ and E₁/E₃/E₅ over F₂; semistable fibre | Traces 3−n are odd for n=2,4 and even for n=1,3,5; two tame positions exclude semistable/supersingular candidates | Consistent |
| 1.12 ordinary type | μ₂ versus constant ℤ/2 | Lengths 2=2; points 1≠2; dual μ₂↦ℤ/2 | Scheme condition discriminates |
| 1.13 classical type | Constant ℤ/2 versus μ₂ | Points 2≠1; canonical order 2≠1; dual ℤ/2↦μ₂ | Consistent |
| 1.14 supersingular type | α₂ versus μ₂ | Both have one point; α₂ coproduct t⊗1+1⊗t versus μ₂ extra t⊗t; α₂ self-dual | Point count alone correctly insufficient |
| 1.15 local canonical cover | Integral degree-two torsor versus trivial product torsor | Generic degree 2; radicial geometric fibre point count 1; trivial μ₂/α₂ torsor has nonzero nilpotent t with t²=0 | Integrality excludes trivial wrong model |
| 1.16 cover cohomology | K3-like cohomology | h⁰−h¹+h²=1−0+1=2 | Correct Euler characteristic |
| 1.17 conductrix | C≠0, B=2C; reduced tree; C=0 | C²=−2, B²=−8, χ(O_B)=4; exceptional h¹=1 gives h⁰=5; reduced tree h¹=0; empty divisor h¹=0 | Thickened divisor essential |
| 1.17a differential sequence | C²=−2 versus C=0 | length(W)=12+(2C)²=4 versus 12; h⁰(O_Y(2C))=1 is not h⁰(O_2C)=5 | Corrected source notation used |
| 1.18 exceptional iff | Special double IV*/III*/II*; ordinary | Exceptional flag 1 with special double fibre; ordinary Pic^τ=μ₂ gives exceptional flag 0 | The iff uses a rational two-section, not merely a type label |
| 1.19 quasielliptic restriction | III*, II*, each multiplicity 1 and 2 | Four type/multiplicity pairs all give exceptional=1 by ESB3.16; none satisfies nonexceptional=1 | Sample consistent |
| 1.20 special multiple restriction | Rational R with R·F=1 | R·2F=2; special-double criterion forces exceptional=1, contradicting premise 0 | Consistent |
| 1.21 extra-special E₈ | T₂,₃,₇ versus affine E₈ alone | Arms 1,2,6 give 1+1+2+6=10 vertices and 9 edges; affine E₈ alone has 9 vertices | Full-graph condition discriminates |
| 1.22 E₈ implies exceptional | Full T₂,₃,₇ | Ten-vertex graph satisfies ESB4.3; resulting exceptional flag 1 rather than 0 | Sample consistent |
| 1.23 partner theorem | Nonexceptional half-fibre; unique-pencil E₈ | Partner F·F′=1 versus same pencil F²=0; full intersections 4 versus 0 | Exception retained |
| 1.24 partner pencil | Characteristic-two nonexceptional pair | Half intersection 1 gives full intersection 4 | Consistent |
| 1.25 distinct pencils | F′=F; partner; hypothetical half intersection 2 | Full products 0,4,8 respectively; equality 4 iff half product 1 | Distinctness excludes zero; both directions tested |
| 1.26 numerical decomposition | h=d=e+f; d=−h; d=0; rational h/2 | d=e+f with summand squares 0,0 and pairings 1,1; (−h)·h=−2; 0²=0; h/2 has nonintegral coordinates | Native integral carrier and positive-cone premises discriminate |
| 1.26 negative E₈ check | h=e+f, d=2e+f+r with r²=−2 | h²=2,d²=4−2=2,d·h=3; e and e+f+r have squares0,0 and pairings1,2 | Negating E₈ is essential |
| 1.26 effective/two-section application | T²>0, generic degree 2 | Two positive horizontal degrees would sum at least 4>2; exactly one remains horizontal; degree after vertical subtraction is 2−0=2 | Generic class, not just degree, preserved by vertical restriction |
| 2.1 family | k-point; empty base; nonflat square-zero test | Fibre dimension 2; empty-base condition vacuous and stable under base change; k-length 3 versus flat rank-two expected 4 in the test algebra below | Empty base is harmless; flatness required |
| 2.2 relative Picard | Connected proper geometric fibre | H⁰(O)=k has dimension 1; pullback of constants is k→k, identity | Universal-functions premise retained |
| 2.3 relative invariants | R=k[ε]/ε², R[t]/(t²,εt) versus R[t]/t² | Special fibre lengths both 2; total k-lengths 3 versus 4 | Constant fibre length alone cannot prove flatness |
| 2.4 canonical torsor | Canonical inclusion versus trivial torsor; empty base | Edge classes inclusion Pic^τ→Pic versus 0; nonempty Pic^τ has rank 2, so inclusion≠0; over empty base both maps uniquely coincide | Correct edge-class definition |
| 2.5 five-term obstruction | Section s of f | s*f*=id, so kernel f* on H² is 0; exactness gives obstruction 0 | Map directions correct |
| 2.6 injective pullback | Injective H² map | ker f*=0, hence image obstruction=0 | No arbitrary surjectivity of edge map assumed |
| 2.7 section criterion | Identity f=s=id | f*s*=id; canonical obstruction maps to 0 and was 0 | Consistent |
| 2.8 étale Pic torsion | Order-two ω, Pic(base)=0 | O⊕ω⁻¹ has rank 1+1=2; multiplication uses ω⁻²≅O | Existence uses trivialization of the square |
| 2.9 twisting | Trivial twist; twice a μ₂-class | Twist by 1 leaves class unchanged; [a]+[a]=[a²]=0; [5]≠0 over ℚ₂ | Free transitive action, not a canonical choice of origin |
| 2.10 constant/split Picard | ℝ-action e₁↦e₁+τ; split α₂ extension | Action squared e₁↦e₁+2τ=e₁; any lift e₁+cτ changes by τ≠0; α₂ geometric torsion points 1 versus constant ℤ/2 points 2 | Constant Num does not imply split or constant full Picard |
| 2.11 canonical covers | Units modulo squares with trivial Pic(base) | Unit 1 gives identity twist; 5 is nontrivial over ℚ₂; a² gives trivial class | Kummer domain and obstruction separated |
| 2.12 canonical order | Full constant Picard; α₂ case | Nonzero torsion class has order 2; α₂ has one geometric point and ω order 1, so fails full constancy | Sample consistent |
| 2.13 numerical descent | Two lifts differing by ω | Both map to same Num class; kernel has 2 elements over geometric classical field | Uniqueness is modulo ω |
| 2.14 nodal descent | Split rational curve over F₂ | P¹(F₂) has 3 points; conic Brauer obstruction 0 | Finite-field form is split |
| 2.15 fibration descent | Conic base over F₂ | Br(F₂)=0; descended base P¹ has 3 rational points | Rational base justified |
| 2.16 double-fibre descent | Classical fibration over F₂ | Exactly 2 tame double fibres among 3 rational base points; remaining count 1 | Multiplicity and base rationality retained |
| 2.17 residue-field existence | Descent of one geometric pencil | One descended pencil; its base has 3 rational points, not a selected section of the surface | No false section conclusion |
| 2.18 finite-field descent | F₂ and F₄ | Pic=0, Br=0 in both; P¹ point counts 3 and 5 | Sample does not specialize away the general field statement |
| 3.2 constant Num/count | q=2, r=1,2 | 1+20+4=25; 1+40+16=57 | Frobenius normalization correct |
| 3.3 local projectivity | ℤ₂ with a lifted point; proper algebraization | 25>0 supplies a special-fibre point; Henselian lift gives a section; closed complement disjoint from special fibre is empty | Stated section hypothesis used |
| 3.4 μ₂ branch | Pic^τ=μ₂ over ℤ₂ | Cartier dual is étale ℤ/2, degree 2 | Correct dual, not μ₂ as covering group |
| 3.5 four global twists | ℤ[1/2] units | ±2^n modulo squares gives {1,−1,2,−2}, cardinality 4 | All four retained |
| 3.6 dyadic representatives | All Fin 2 triples; x=0 negative control | Representatives {1,5,2,10,−1,−5,−2,−10}, size 8; 0/r=0 is square for all 8 | Nonzero x is essential for uniqueness |
| 3.7 global twist | Triples (000),(001),(010),(011),(100),(101),(110),(111) | r·u=1,5,4,20,1,5,4,20 respectively; 5^b(2^a)² gives exactly the same list | All eight products agree |
| 3.8 difference class | Equal covers; nontrivial twist | Difference 1 in first case; class 5 has order 2 and is not class 1 | Difference is a class, not a unique scalar |
| 3.9 remove ramification | r=−10; r=5 | u=−2 gives ru=20=5·2²; u=1 leaves 5 | Residual class is 1 or 5, not necessarily trivial |
| 3.10 K3 cover | Étale degree 2 | χ upstairs=2·1=2, connected h⁰=1 and ω=O give h²=1, h¹=0 | Correct K3 invariants |
| 3.10a fundamental group | Ordinary/char≠2; classical/supersingular char2 | Orders 2 versus 1; connected étale degree d satisfies d=χ(cover)≤2 | Local canonical cover is not an étale generator |
| 3.11 local models | Class 5 model; odd primes | z²−z−1 mod2=z²+z+1 has values 1,1 at 0,1 and derivative 1; degree2 étale; 2 is a unit at every odd prime | Unramified residual twist extends; sample consistent |
| 3.12 extension splitting | Rank n=0,1,10 | Zero obstruction for each of n basis lifts gives 0,1,10 choices of lifts to make; extension rank remains n | Uses vanishing of ℤ/2 torsors, not merely constant quotient |
| 3.13 full Picard over ℤ | Two Oort–Tate possibilities | μ₂ branch would give K3 h²(O)=1 versus Fontaine 0; surviving ℤ/2 has two geometric points | Correct conditional contradiction |
| 4.1 Jacobian adapter | Index-two torsor; quasielliptic Pic⁰; imperfect field | Torsor rational points 0 versus Jacobian identity 1; affine Pic⁰ global functions infinite-dimensional versus compactification dimension 1; u²−s becomes ε²=0 | Wrong models excluded by stated API |
| 4.2 geometric rationality | Hodge degree 1 | R¹f*O=O(−1), H¹(O)=0; ω=−F gives H⁰(ω²)=0; χ=1 | Rationality criterion's inputs present |
| 4.4 simple-fibre identification | Simple versus double torsor fibre | Multiplicities 1=1 in the hypothesis; double case 2≠1 excluded | Does not overstate local geometric comparison |
| 4.5 nonrational fibres | Closed point degree 2 | Reducible flag 1 would force residue degree 1; degree 2 therefore permits only irreducible geometric fibre | Correct contrapositive |
| 4.6 no I₀* | Central component with four outer attachments over F₂ | Four distinct required rational points versus #P¹(F₂)=3 | 4>3 contradiction |
| 4.7 graph descent | Nonsplit I₁ and I₂ | Rational point counts 4,6 versus split 2,4; component labels unchanged while conjugate branches differ | Graph descent does not imply split nodes |
| 4.8 at most one excluded tame type | Three rational base points, two tame doubles | 3−2=1 possible semistable/supersingular position | Correct bound |
| 4.9 Mordell–Weil descent | Generic line bundle of degree 2; geometric Tsen | Subtracting one two-section gives degree 2−2=0; Br(k̄(t))=0 used, not Br(F₂(t)) | Domain retained |
| 4.10 fibre counts | I₁, Ĩ₁, I₂, Ĩ₂, additive r=7 | Counts 2,4,4,6,15; additive formula 2·7+1=15 | Scheme multiplicity does not change rational points |
| 4.11 Jacobian Picard | ρ=10,q=2 | Auxiliary total 25=1+10·2+2² | Correct maximal-count input |
| 5.1 fourteen elliptic rows | All fourteen displayed rows in order | Totals 19+4+2,19+2+4,17+4+4,17+2+6,17+4+4,15+3+7,15+5+5,19+4+2,13+4+8,13+5+7,16+4+5,15+4+6,17+4+4,15+4+6; all 25 | Necessary counts agree; completeness remains supplier theorem |
| 5.2 quasielliptic rank | r₀+r₁+r∞ | 10=2+Σ(r−1)=Σr−1 gives Σr=11 | Correct rank normalization |
| 5.3 four quasielliptic rows | Six allowed symbols | 9+1+1=11 twice with distinct symbols; 8+2+1=11; 7+2+2=11; 7+2+1=10 fails | Exactly four symbol triples |
| 5.4 forced doubles | Additional IV*+E₄+Ĩ₂ | Ĩ₂ cannot be tame double; two remaining positions = two required doubles | Added nonsplit branch retained |
| 5.5 simple III* | III*+E₄+I₂; III*+E₂+Ĩ₂; III*+E₄+E₄ | First two reserve one simple semistable slot and force III* double; last has two smooth double slots | One simple-III* candidate remains |
| 5.6 forbidden rational bisection | R·F=1, R²=−2 | R·2F=2; special-double criterion gives exceptional=1 versus premise 0 | Consistent |
| 5.7 three new exclusions | Three added Jacobian rows | Counts 15+4+6=25,17+4+4=25,15+4+6=25 | Counts do NOT exclude them; new proof target correctly explicit |
| 5.8 F₂ partner | Descended F,F′ | Intersection remains 1 after extension; full intersection 4 | Correct descent invariant |
| 5.9 I₈ elimination | I₈+E₄+III candidate | Points 16+4+5=25; root rank 7 | Count alone insufficient; graph/partner proof retained |
| 5.10 II* elimination | II*+E₄+I₁; II*+II+II | Counts 19+4+2=25 and 19+3+3=25; E₈ root rank 8 | Uses exceptionality/partner geometry, not count alone |
| 5.11 no double I₄* | I₄*+E₄+E₂; quasielliptic version | Counts 19+4+2=25 and 19+3+3=25; primitive central coefficients doubled 2→4 | Multiplicity remains a separate restriction |
| 5.12 IV* elimination | IV*+E₃+IV; IV*+E₅+III | 15+3+7=25;15+5+5=25; smooth E₄ in extra row has 4 points, not the other half-fibre type | New row correctly handled in §5.7 |
| 5.13 IV elimination | D₅ and A₂ components in same fibre branch | Required additional incidence lower bound 3 versus available 2 | 3>2 contradicts the branch |
| 5.14 residual list | Fourteen elliptic plus four quasielliptic | 18 candidates minus 9 elliptic and 1 quasielliptic removals =8; 5 elliptic+3 quasielliptic | Requires both classification obligations |
| 5.15 residual multiplicities | I₁*, I₄*, semistable | Multiplicities 2,1,1 respectively | Matches tame exclusions and §5.11 |
| 6.1 firstGram/firstLattice | e₁,e₁/2,e₁+e₂,−2e₁; entries | Norms −2,−1/2,−2,−8; e₁/2 outside ℤ-span; entries (8,3)=1,(8,9)=1,(9,9)=0 | Native carrier excludes rational wrong model |
| 6.1 secondGram/secondLattice | Same vectors; fork and U entries | Same four norms; (8,3)=0,(8,8)=0,(8,9)=1,(5,6)=(5,7)=1 | Distinguishes the two matrices |
| 6.2 first discriminant headline | Exact rational inverse and mod2 rank | det=−4; rank mod2=8; inverse denominators ≤2; Smith factors 1⁸,2,2; group order 4=2² | Group structure consistent |
| 6.2 first isotropic-card headline | Four dual cosets | q=0,1/2,0,0; zero count 3=claimed 3; index of even unimodular extension √4=2 | True computation; delete from Lean under R02 |
| 6.3 second discriminant headline | D₈(−1)⊕U exact inverse | det=(4)(−1)=−4; mod2 rank8; Smith factors 1⁸,2,2; group order4 | Group structure consistent |
| 6.3 second isotropic-card headline | Four dual cosets | q=0,1/2,0,0; zero count 3=claimed 3 | True computation; delete from Lean under R02 |
| 6.4 generic Pic⁰ quotient | L=T and L of degree zero | T−(T·F)T=T−T=0; degree(L−(L·F)T)=degree L−2(L·F)=0; Pic⁰ order2 versus Pic=Pic⁰⊕ℤ infinite | Corrects source Pic/Pic⁰ slip |
| 6.5 generating two-section | Nontrivial coset in group of order2 | [R̃]≠0, 2[R̃]=0; degree2 retained; self-intersection possibilities −2,0 | Coset-preserving refinement stated |
| 6.6 spinor incidences | Four cross-tip pairs versus same-end pair | Cross-tip q=0; {0,1} and {7,8} vector-class q=1/2; weighted degree2 in each | Even overlattice excludes wrong pair |
| 6.7 square-zero calculation | C₈*+nR*+F*, n=0,1,2 | Square −2−2+2·2+2n=2n gives 0,2,4; square0 iff n=0 | Sign and factor2 agree |
| 6.8 first forbidden graph | Smooth locus of chosen half-fibre | Required distinct rational points ≥3 versus available2 | 3>2 contradiction |
| 6.9 opposite-tip argument | Remaining cross-tip orbit | Weighted degree 1+1=2; same spinor q=0; forbidden completion reached without using §6.12 | No local dependency cycle |
| 6.10 second forbidden graph | R·C₀=2,R·C₂=1 | Full fibre incidence 2+2·1=4; paired half-fibres intersection1 | Both spinor branches retained |
| 6.11 I₄* incidences | Weights (1,1,2,2,2,2,2,1,1) | Degree2 vectors: 4 doubled tips+6 tip pairs+5 internal=15; orbit sizes 1,2,2,2,4,4 sum15 | Six orbits confirmed |
| 6.12 no I₄* | Elliptic and quasielliptic I₄* candidates | Two type triples, six incidence orbits each; all use the preceding exclusions; raw counts still25 | No count-only shortcut |
| 7.1 no multiple III* | Primitive auxiliary D and C₆ | D·C₆=1; full fibre 2D gives2; two remaining III slots contain exactly one additional double fibre | Parity retained; not both additional fibres declared simple |
| 7.2 III* incidences | Weights (1,2,2,3,4,3,2,1) | Degree2 vectors 2 doubled tips+1 tip pair+3 weight2 entries=6; reversal orbit sizes1,1,2,2 | Four cases independently confirmed |
| 7.3 no simple III* | C₂ and double-terminal branches | Required full-fibre intersection ≥8 versus4; terminal construction gives2 versus minimum4 | Both contradictions use full fibres |
| 7.4 restricted configurations | I₁*+I₄; I₂*+III+III | Root ranks 5+3=8 and6+1+1=8; partner construction produces IV*/I₀*/I₄ outside the two allowed patterns | No characteristic-two lemma applied universally |
| 8.1 tangent cohomology | (0,10,0);(1,12,1) | χ=0−10+0=−10;1−12+1=−10; also −c₂+2χ(O)=−12+2=−10 | Source sign error not propagated |
| 8.2 supersingular W₂ obstruction | Pic^τ=α₂ | a,b≡0 mod2 gives ab=0 in W₂, whereas rank-two lift needs ab=2≠0 | Correct nonlifting check |
| 8.3 lifting iff | Ordinary/nonexceptional classical versus exceptional/supersingular | Obstruction h²Θ=0 versus1; ω orders1 or2 distinguished; exceptional h⁰(L)=h⁰(Lω)=1 | Separate α₂ and differential routes |
| 8.3a ramified characteristic-zero lift | V with π²=2 | 2=π², ramification2; quotient V/(π²) has 2=0 whereas W₂(k) has 2≠0 | Ramified lifting does not contradict W₂ nonlifting |
| 8.4 miniversal ring | Smooth case; regular ramified hypersurface | dim W[[t₁,…,t₁₀]]=11; dim W[[t₁,…,t₁₂]]/(2−t₁²)=12; e=1 versus2 | Dimension and ramification equivalences consistent |
| 8.5 modulo-four obstruction | ℤ/4→W₂(F̄₂) | 2≠0, 2²=0 on both; reduction is a scheme, so nilpotent thickening is a scheme | Algebraic-space scope preserved |
| 8.6 finite-field endpoint | Residual eight cases | Remove2 I₄*+4 III* cases from8, leaving2 forbidden universal patterns | Conditional proof chain closes after both classification obligations |
| 8.7 integral endpoint | Hypothetical ℤ family reduced mod4 and mod2 | Full Picard constancy=1; exceptional flag forced0; §8.6 excludes their conjunction | No exclusion of prime2 or weakening to schemes |
| SCH23 rank-two group-law control | a=1,b=2,f=g=1 over ℤ | Printed plus law gives4 with4²=16≠4; minus law gives0 with0²=0 | Sign misprint; supplier uses the minus sign |
| DI21 proof control | W₂(k)[t]/t² and W₂(k)[t]/(t²−2), characteristic two | Both free rank2 with reduction k[t]/t²; lifted t squares are 0 versus2≠0; in the second ring a lift a+bt of t has a∈2W₂, b a unit, and square 2b²≠0 | Scheme-lift uniqueness step is false; see Source issues |
| R03 local reference | Current Layer4 headings | Local §4.3 matches0; supplier §3.11 matches1; multiplicities2 and1 remain distinct | Repair reference only |

**Exact matrix and dyadic evidence.** Rational Gaussian elimination, reduction modulo two and enumeration of inverse-column cosets gave the matrix results above independently of Lean's sorry statements. For both matrices, representatives in ℚ¹⁰/ℤ¹⁰ are zero and the vectors with half-coordinates supported on {7,8}, {1,3,5,8}, {1,3,5,7}, using one-based coordinates. Their half-norms are respectively 0, 1/2, 0, 0. In particular the anisotropic class is not silently made isotropic by using full norm modulo ℤ. For N₁ the inverse additionally gives (C₁*)²=−1, (C₇*)²=(C₈*)²=−2, (R*)²=0, (F*)²=−2, C₈*·R*=0, C₈*·F*=2 and R*·F*=1.

For the dyadic convention, valuation parity distinguishes a=0 from a=1; odd unit residues modulo eight are 1,5,7,3 for (e,b)=(0,0),(0,1),(1,0),(1,1). They are pairwise distinct. The Hensel witness for u≡1 mod8 is ‖1−u‖≤1/8<1/4=‖2‖². The class-five and class-minus-three quadratic models agree because their discriminant ratio differs by the square class of −15, with −15≡1 mod16. Zero would destroy unique representation and is explicitly excluded in Lean.

**Headline coverage and padding probe.** The README's deep endpoints comprise the numerical-lattice isometry and reducibility (§§0.4,1.26); canonical-cover/Picard descent (§§2.3–2.18); global-cover comparison and integral constancy (§§3.10–3.13), including the fundamental group (§3.10a); Jacobian comparison (§§4.1–4.11); configuration exclusions and the arbitrary-characteristic restricted-configurations theorem (§§5–7); characteristic-zero lifting, W₂ criterion and miniversal ring (§§8.2–8.5); and the two nonexistence theorems (§§8.6–8.7). The native numerical decomposition, ordered dyadic representative theorem and two discriminant-group statements are present. The module docstring names the omitted geometric headline families and their missing carriers. No statable geometric endpoint was found omitted.

Each of the six admitted theorems was tried in a scratch copy with the individual tactics rfl, simp and infer_instance; none closed. The direct pinned results inspected above are not identical statements usable by a single exact: the unit decomposition does not include valuation parity or unique Fin 2 triples, and generic lattice constructors do not classify these discriminant groups. R02 follows the separate small-value/Check rule, not a claim that simp solves the cardinalities. The twelve expanded signatures contain no unbound ambient assumptions or erased section conditions.

## Not verifiable

- CDL2021 is settled as waived. The 2021 draft Theorem 6.1.10 and the separately identified 2024 locators were not independently certified from that text. MMV22's accessible Theorem 1.2 and characteristic-two exception were checked; they do not certify every older proof cited there.
- CD89 is settled as uncertified. Chapter III, Theorem 3.4.1 remains a locator-only citation. It was not requested again.
- BM1977 is settled as waived. Theorem 3 and Proposition 11 were not independently read; the corresponding foundational results are explicit mathematical targets.
- Fontaine is settled as waived. Theorem 1 and Remark (a), printed p. 3/PDF p. 4, remain the announced supplier contract; its text was not requested again.
- LLR04 is settled as uncertified. Theorem 6.6 and Remark 6.8, pp. 496–497, were not independently certified from the original. The accessible LLR2018 corrigendum and the supplier's distinction between local comparison and corrected global comparison were checked.
- The fourteen-case completeness theorem and the three additional exclusions in §5.7 are explicitly new obligations. The source does not prove them, and counts equal to 25 do not prove them. This review checks their ownership and noncircular use, not an unwritten proof. Acceptance after repairs would remain conditional on the six declared supplier contracts.
- Source access used the supplied legal cache and the sources service for Stacks tag 0D3D. No additional inaccessible work was requested, and no waived or uncertified citation was reopened. No conclusion about a source's unread passages is asserted.

## Source issues

- **Misprint** in DI21 at Proposition 7.1 proof, printed p. 23, DI21 line 1019: the source says the tangent-sheaf Euler characteristic is positive ten; it should be negative ten, since −12+2=−10; affects the proof.
- **Misprint** in ESB21 at Proposition 2.8(2), printed p. 6, ESB21 line 205: the source says the biconductrix structure sheaf has one global section; it should be the line bundle O_X(B), as the proof at line 220 computes; affects a stated result.
- **Error** in DI21 at Proposition 4.2 proof, printed p. 16, DI21 lines 696–699: the source says freeness of ordinary differentials makes all scheme lifts isomorphic; it should be a cotangent-complex deformation argument; W₂(k)[t]/t² and W₂(k)[t]/(t²−2) already give distinct flat lifts; affects the proof.
- **Gap** in SCH23 at Proposition 5.5 proof, printed p. 16, SCH23 lines 699–702: the source says existence of a local canonical cover gives good reduction of the previously chosen generic cover; it should be a comparison controlling their torsor difference before applying the good-reduction obstruction; affects the proof.
- **Misprint** in SCH23 at Proposition 12.3 proof, printed p. 43, SCH23 line 1960: the source says the entire generic Picard group equals the finite numerical quotient; it should be its degree-zero subgroup, with the infinite degree summand retained separately; affects the proof.

- **Misprint** in SCH23 at the rank-two group law following Proposition 5.3, printed p. 14, SCH23 line 614: the source says to add the bilinear term in the group law; it should be subtracted: for a=1,b=2, combining 1 with 1 must give 0, not 4; affects a stated result.
