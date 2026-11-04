# Repair findings and verification

The first thirteen finding sections refer to review a; the final four refer to review b. Repeated IDs retain their original spelling. Overlapping bibliography findings share one repair. File references are relative to the roadmap repository; the edited package is `packages/EnriquesSurfacesAndIntegralNonexistence`.

## F01 (P2) — applied

Review a. The redundant genus-one supplier gap → K3SurfacesAndSymplecticBoundedness §6.0b, verified at the supplied head. Updated Scope, supplier contracts and §4.1; deleted only that gap from `design/plan.json`. The other six entries are unchanged. The supplier explicitly includes nonsmooth generic Jacobians, torsion, wild coefficients and the Euler comparison.

## F02 (P1) — applied

Review a. An unspecified rationality criterion under §§4.1–4.4 → the general surface criterion in NeronModelsAndSemistableAbelianVarietiesPartII §6.1. Section 4.2 now derives χ=1, R¹j_*O=O(−1), h¹=0 and h⁰(ω²)=0 using K3SurfacesAndSymplecticBoundedness §6.0b. Updated the contract and Needs; added product and K3 controls. Section 4.4 of the supplier assumes rationality.

## F03 (P1) — applied

Review a. An unassigned differential sequence → §1.17a, with construction, dual sequence, one-form/line-bundle dimensions and three computed Checks. Sections 8.1 and 8.3 consume it; §8.3 verifies every differential-obstruction hypothesis. Evidence: ESB21 line 163 through line 178, line 220; DI21 line 1043 through line 1058. SchemeAndStackFoundations §0.29 supplies Frobenius, rather than differential sheaves.

## F04 (P2) — applied

Review a. Prose-only numerical reducibility → `enriquesNumericalLattice` and `positive_cone_decomposition`, using the actual integral carrier of U⊕(−D₈⁺). All three positivity hypotheses are explicit. Added their README API and discriminating model Checks. Lang1983 line 760 states the general lattice theorem; the native constructors and integral pairing exist at the pins.

## F05 (P3) — applied

Review a. Two named symmetry computations → anonymous proof arguments of the Gram constructors. Deleted `firstGram_symmetric` and `secondGram_symmetric` from Lean and their own-name API bullets from §6.1; retained symmetry in prose. Recomputed both matrices: every entry of A−Aᵀ is zero. The four discriminant headlines and both integral carriers are unchanged.

## F06 (P3) — applied

Review a. `TauCeti.LineBundleClass` → `TauCeti.AlgebraicGeometry.LineBundleClass`. The declaration is inside both namespaces in `TauCeti/AlgebraicGeometry/LineBundle/Class.lean`, lines 41–50. Checked the neighbouring divisor, degree-zero and rigidification declarations and their namespaces; none has another incorrect fully qualified prefix. The Cartier-duality category really is directly under TauCeti.

## F07 (P3) — applied

Review a. Universal rejection of the trivial torsor → rejection over nonempty bases, plus the canonical unique torsor over the empty base. Section 2.4 retains arbitrary bases. For the empty base edge=χ=0; on any geometric Enriques fibre the inclusion of the length-two Pic^τ group scheme is nonzero, even when it has one geometric point.

## F08 (P3) — applied

Review a. Matrix-only claims to detect the integral carrier → actual carrier-membership Checks for each lattice. The standard e₁ belongs, e₁/2 does not, and integer sums/multiples remain inside. Its excluded norm is −1/2. `ofGramMatrix_carrier` identifies the carrier with the integer span of the supplied basis; unchanged matrix Checks distinguish N₁ and N₂.

## F09 (P3) — applied

Review a. Two restatements in §1.1 → scaling, reduced-support and zero-divisor negative controls. Their component comparisons are 4≠2, 2≠6 at the IV* centre, and 0≠2. These remain README Checks, without Lean padding. Base-change and multiplicity-preserving APIs are retained.

## F10 (P3) — applied

Review a. The module inventory now separately names effective-divisor reducibility, the characteristic-dependent fundamental group and characteristic-zero lifting after a finite Witt extension, identifying their missing geometric interfaces. Numerical reducibility itself is stated natively. The distinction from W₂ lifting is witnessed by π²=2 in a ramified Witt extension, which cannot map to W₂ with π reducing to zero.

## F11 (P3) — applied

Review a. Waiver/settlement narrative → mathematical bibliographic locators and explicit draft numbering. Removed both phrases from References; acquisition dispositions remain in `sources.toml`. Review b F04 shares these bibliography edits. The 2021 and 2024 locators remain distinguished.

## F12 (P3) — applied

Review a. Definition repetitions → Hopf-coproduct, point/tangent, doubled-subscheme cohomology and generic-Jacobian controls in §§1.12–1.14, 1.17 and 4.1. The exceptional classical test gives χ(O_(2C))=4, h¹=1, h⁰=5, while h⁰(Y,O_Y(2C))=1. This uses ESB21 line 220 and line 241, with DI21 line 1057; it does not adopt the misleading subscheme notation at ESB21 line 205.

## F13 (P1) — applied

Review a. The §2.2↔§2.3 proof cycle → algebraic-space representability, Artinian Picard-flatness tests, Enriques torsion finiteness, numerical quotient, then full scheme representability. Added the existing flatness gap to §2.3 and the length-three nonflat control. EHS12 was legally fetched once; Proposition 4.2/Corollary 4.3 are EHS12 line 1369 through line 1408, internal version 7, 25 February 2018.

## F01 (P2) — applied differently

Review b. The duplicate §2.20 target → ownership deferral in Scope and an exact supplier contract for NeronModelsAndSemistableAbelianVarietiesPartII §2.14. Deleted §2.20 entirely, as the binding ownership rule requires, instead of leaving a cited target stub. Repointed every consumer: §§4.6, 5.2, 5.11, 6.9 and 6.12. Retained the four-versus-three-point worked example.

## F02 (P3) — applied

Review b. An apparent supplier “Corollary 8.3” → NeronModelsAndSemistableAbelianVarietiesPartII §3.9, with SCH23 Corollary 8.3 identified as its source. Updated §§4.8 and 4.10 and §4.8's Needs. The supplier constructs the F₂ isomorphism; SCH23 line 1032 is the corollary, not a section of that roadmap.

## F03 (P3) — applied

Review b. The lower-cased proper name in the title → “Enriques”. Read the BelyiMaps and PolynomialGaloisGroups roadmaps on main; their sentence-case titles retain the proper names Belyi and Galois. No mathematical scope changed.

## F04 (P3) — applied differently

Review b. “The current Tau Ceti library already has” → “The pinned Tau Ceti library has”. The two bibliography occurrences share review a F11's repair. Acquisition commentary stays in the manifest, so the proposed extra README statement about uncertified text was not added.

## Check outcomes

- Required `lake env lean` on `packages/EnriquesSurfacesAndIntegralNonexistence/Suggested.lean`, run from the content checkout with the requested absolute file argument: exit 0. Exactly six expected `declaration uses sorry` warnings, at lines 50, 68, 115, 120, 125 and 130; no errors or other diagnostics.
- Targeted builds from the content checkout: `lake build TauCeti.LinearAlgebra.IntegralLattice.Examples` (1956 jobs), `lake build TauCeti.LinearAlgebra.IntegralLattice.RootLattice.D8Plus.Basic` (2937 jobs), `lake build TauCeti.LinearAlgebra.IntegralLattice.Orthogonal.Sum` (1956 jobs), and `lake build TauCeti.LinearAlgebra.IntegralLattice.Scaling` (1955 jobs), each exit 0. Their missing object files were built before elaboration. An initial D8Plus build launched from the board directory exited 1 because that directory has no configured toolchain; it was rerun successfully from the required content checkout without changing configuration.
- One scratch copy containing `#check @name` for all twelve declarations elaborated once: exit 0, with the same six expected warnings. Compared every expanded type to its README specification. No section binder was dropped. The new headline quantifies over the integral carrier and retains h²>0, d²>0 and d·h>0; the other five headlines retain their original hypotheses and conclusions. Six real definitions and six admitted headline theorems remain.
- Required dependency check, with the supplied order and `--movable`: exit 0. Its entire output was:

```text
depcheck: 34 roadmaps, 320 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line.

- `roadmaps resolve`: no cross-roadmap citation or own Lean name found nowhere. Its tool reports no pinned Lake packages on its host; all library evidence below was therefore checked directly in the specified pinned checkout.
- Exact rational matrix inversion, determinant computation, elimination modulo two and finite incidence enumeration: the computed values appear in the audit below. No inconsistent value was found.
- `git diff --check`: exit 0. The plan edit deletes only the redundant gap; the other six gap records are byte-for-byte unchanged. No gate failures were supplied in the brief, so there is no additional gate-failure repair.

## Supplier and ownership evidence

The content checkout's manifest pins Mathlib to `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti to `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Two main-branch roadmap examples were read before editing.

| Supplier | Exact interface verified |
| --- | --- |
| SchemeAndStackFoundations on main | §§0.9, 0.11 and 0.29: approximation, base change and scheme Frobenius; §§1.2–1.9: descent/spaces; §§2.2–2.4, 2.6, 2.11, 2.15, 2.20 and 2.22: cohomology/duality; §§4.1–4.6 and 4.10: deformation/algebraization; §§5.9–5.10: intersection/RR. §0.29 does not itself supply the Enriques differential sequence. |
| K3SurfacesAndSymplecticBoundedness at the supplied head | §§1.1–1.3 and §6.0b. The latter contains the general carrier, primitive fibre lattices, regular nonsmooth Jacobian construction, wild formula and Euler equality. It contains no elliptic-surface-geometry gap. |
| NeronModelsAndSemistableAbelianVarietiesPartII | §§2.1–2.5 and 2.9–2.16; §2.14 is the I₀* exclusion. §§3.7–3.11; §3.9 is the F₂ isomorphism. §§4.1–4.3 are canonical/degree/wild formulas, §4.4 assumes rationality, §§4.7–4.8 and 4.16–4.18 supply restriction, rank, quasielliptic geometry, Jacobians and Tsen. §§5.1–5.8 supply counts and the constancy criterion; §6.1 includes the general surface rationality criterion; §7.4 owns fourteen-model completeness. |
| ComplexComparisonPartII | C3.2d.2: universal-functions Picard algebraic space, without a scheme conclusion; C3.2d.4–C3.2d.5: Brauer obstruction and finite Cartier-dual torsors, including non-étale groups. |
| AlgebraicModuliForArithmeticGeometry | §§7.6.1–7.6.1a, including relativePicardSheaf, relativePicardBaseChange, relativePicardKernel and sectionPicardSplit. The extra flatness criterion remains the declared Part II gap, not an invented base-roadmap target. |
| FiniteFlatGroupsAndIntegralPadicHodgeTheory | R07.1, especially R07.1.34–R07.1.35: Oort–Tate and Cartier duality. The existing finite-local-group nonlifting gap is retained. |
| WeilConjectures | WC.7: IsEnriques and its characterization/base change/étale invariants, numericalPicardLocalSystem and both constant-Num count targets. |
| EtaleCohomologyFoundations on main | §F.0.2: finite-étale Galois category and fundamental group, with connected nonempty scheme hypotheses for a single group and the groupoid convention otherwise. |
| IntegralLattices on main and its completed part | Native lattice/discriminant theory; Layer 6 milestone 6A explicitly assumes indefinite unimodularity and classifies by signature and parity. No Lang positive-cone decomposition target was found. |
| JacobianChallenge on main | Layer D: projective geometrically integral Picard representability and the pointed smooth-curve specialization; Layers A–C underlie its curve cohomology. |
| AlgebraicVectorBundles on main | Invertible sheaves, tensor operations and L1A relative Spec. |
| LocalFieldsRamification on main | Layers 1–2: unit filtrations, square classes and unramified extensions. |
| PadicHodgeTheory | Named base supplier for the retained Part II everywhere-good-reduction gap; no claim that the base roadmap proves that extension. |

Used the prescribed roadmap grep/show/resolve tools, searched the board packages by object, and checked the supplied sibling heads. Generic interpolation, motivic K-theory, Habiro, regulator, analytic, arithmetic and other supplied sibling roadmaps contain no competing Enriques conductrix-sequence or Lang decomposition owner. The specialized conductrix sequence belongs here because it constructs the differential quotient of this roadmap's normalized canonical cover. The lattice model is a specialization of native constructors, not another lattice foundation. No ownership decision relies on an unprovided open-head checkout. No new later supplier was introduced.

Pinned declarations read directly include:

- `IntegralLattice.hyperbolicPlane`, `TauCeti/LinearAlgebra/IntegralLattice/Examples.lean:83`; `d8PlusLattice`, `TauCeti/LinearAlgebra/IntegralLattice/RootLattice/D8Plus/Basic.lean:164`; `orthogonalSum`, `TauCeti/LinearAlgebra/IntegralLattice/Orthogonal/Sum.lean:84`; negation, `TauCeti/LinearAlgebra/IntegralLattice/Scaling.lean:261`; `integralForm`, `TauCeti/LinearAlgebra/IntegralLattice/Basic.lean:156`.
- The E₈ identification is `typeE₈IsometryD8Plus`, `TauCeti/LinearAlgebra/IntegralLattice/RootLattice/D8Plus/Isometry.lean:298`. The model preserves the glued integral carrier when its form is negated.
- `ofGramMatrix` and `ofGramMatrix_carrier`, `TauCeti/LinearAlgebra/IntegralLattice/Basic.lean:261` and line 272: the carrier is the integer span of the rational basis. Symmetry is required; nondegeneracy is not.
- `DiscriminantGroup`, `TauCeti/LinearAlgebra/IntegralLattice/Discriminant/Group.lean:109`; `discriminantQuadraticMap`, `TauCeti/LinearAlgebra/IntegralLattice/Discriminant/Quadratic.lean:122`, with representative half-norm at line 129. Finiteness does not follow without nondegeneracy.
- `TauCeti.AlgebraicGeometry.LineBundleClass`, `TauCeti/AlgebraicGeometry/LineBundle/Class.lean:50`; the divisor class homomorphism at `TauCeti/AlgebraicGeometry/CartierDivisor/Picard.lean:75`; degree and degree-zero group at `TauCeti/AlgebraicGeometry/WeilDivisor/Scheme/PicZero.lean:75` and line 88; `rigidifiedPicardFunctor`, `TauCeti/AlgebraicGeometry/PicardFunctor/Rigidified.lean:66`. These are scheme line-bundle objects, not an arbitrary-family surface Picard representability theorem.
- `TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat.cartierDuality`, `TauCeti/AlgebraicGeometry/AffineGroupScheme/CartierDuality/FiniteLocallyFree.lean:271`; its namespace is directly under TauCeti.
- `KaehlerDifferential`, `Mathlib/RingTheory/Kaehler/Basic.lean:148`, is an algebraic module on commutative algebra carriers, not the global conductrix construction.
- `bijective_algebraMap_int_of_finite_of_unramified`, `Mathlib/NumberTheory/NumberField/ExistsRamified.lean:57`, retains finite, unramified, domain and faithful hypotheses; `hensels_lemma`, `Mathlib/NumberTheory/Padics/Hensel.lean:459`, retains the strict derivative inequality.
- The dyadic unit inputs are in `TauCeti/NumberTheory/Padics/SerreSigns.lean:194` and line 219. Their unit hypotheses are used after separating valuation parity.

EHS12 was fetched through the sources service from arXiv, with its single manifest key and internal date recorded. The other cited works retain their existing keys and acquisition dispositions. Settled waived/uncertified works were not reopened. The new arguments were checked against ESB21 line 163 through line 245, DI21 line 855 through line 870 and line 1035 through line 1058, SCH23 line 601 through line 610, Lang1983 line 757 through line 778, and EHS12 line 1369 through line 1408. These are locators, not copied source passages.

## Adversarial mathematics record

Each row records a numerical or structural witness, not a proof of a future geometric target. A numerical divisor vector is used only for the indicated intersection calculation and does not assert geometric realizability. In the result column, “passes” means the displayed instance agrees; the independent review remains necessary. No algorithm is added to the roadmap. The remaining geometric targets and the six supplier extensions still require their full proofs.

| Statement | Instances and values on the two sides | Result; change |
| --- | --- | --- |
| Enriques convention | Classical (h¹,h²)=(0,0) gives χ=1; nonclassical (1,1) gives χ=1; K3 χ=2 and abelian χ=0 fail. | Passes; unchanged. |
| Algebraic-space family convention | Constant Y over k[t] and k[t]/t² has geometric b₂=10 in both; P² has b₂=1; over Spec(0) there are zero fibres. | Passes; empty case retained. |
| Num versus full Picard convention | ℤ¹⁰⊕α₂ has numerical rank 10 but torsion geometric-point count 1; ℤ¹⁰⊕ℤ/2 has count 2. | Passes; unchanged. |
| Intersection sign | U: e²=f²=0, e·f=1, (e+f)²=2; negative root square −2 versus positive root square 2. | Passes; model added. |
| Full/half-fibre normalization | F·F′=1 gives (2F)·(2F′)=4; a two-section has R·F=1 and R·2F=2. | Passes; unchanged. |
| Discriminant normalization | Norms −2,−1 give half-norm classes 0,1/2; using full norm would give 0,0. | Passes; unchanged. |
| Frobenius convention | Over F₂, ten divisor eigenvalues 2 give trace 20 and 1+20+4=25; twist (1) gives ten eigenvalues 1. | Passes; unchanged. |
| Dual graph versus nodes | Split and nonsplit I₁ each have one component vertex; rational-node branch counts differ, with F₂ fibre counts 2 and 4. | Passes; unchanged. |
| Numerical-descent gap | Doubling kills torsion: 2τ=0; split quadric O(1,−1) has ample pairing 0 but ruling pairings 1,−1. | Passes; retained general quotient contract. |
| Flatness-Betti gap | (h¹,h²,b₁)=(0,0,0),(1,1,0) give 0=0; dual-number nonflat module lengths 3≠4. | Passes; now explicitly consumed in §2.3. |
| Finite-local-group gap | A finite-flat α₂ lift would have Oort–Tate parameters both divisible by 2: ab=0 in W₂, whereas required ab=2≠0. | Passes for application; general gap retained. |
| One-obstruction gap | W[[t₁,…,t₁₂]] has dimension 13; one regular equation gives 12. Quotient by 2 is regular of dimension 12 but has 2=0, illustrating why regularity alone is insufficient. | Passes; unchanged. |
| Differential-nonlifting gap | For L=ω(2C), L⊗ω=O(2C), h⁰=1=1, and L·H=2C·H>0; at C=0 it is 0. | Passes; premises now constructed. |
| Fontaine gap | K3 has h²,⁰=1 against required off-diagonal value 0; an abelian surface also has h¹,⁰>0. | Passes as contradiction input; retained gap. |
| 0.2 Pic^τ length | μ₂,α₂ in characteristic two: length 2, geometric points 1; ℤ/2: length 2, points 2. | Passes. |
| 0.3 coherent invariants | 1−0+0=1 and 1−1+1=1; both satisfy h¹=h²≤1. | Passes. |
| 0.4 numerical lattice | U⊕E₈(−1) has rank 2+8=10, signature (1,9), determinant (−1)·1=−1; U diagonal norms 0 are even. | Passes. |
| 1.1 HalfFibre | Smooth candidate E gives 2E=2E; candidate 2E gives 4E≠2E; reduced IV* centre 2≠6; zero 0≠2. | Passes; three Checks replaced. |
| HalfFibre base change/square | Under a constant-field extension central coefficients 3 and 6 remain 3 and 6; (2F)²=4F²=0 gives F²=0. | Passes. |
| 1.2 minus-two curve | Adjunction gives 2pₐ−2=−2, so pₐ=0. Two conjugate rational curves meeting once have square −2−2+2=−2 but two geometric components. | Passes; geometric integrality retained. |
| 1.2 two-section | R·F=1 gives degree 2; R·F=2 gives degree 4, rejecting the four-section. Squares −2 and 0 both allow degree 2. | Passes. |
| 1.3 canonical-type pencil | An affine I₀* vector (2,1,1,1,1) is killed by its component matrix; the all-one vector is sent to (2,−1,−1,−1,−1). | Passes; primitive multiplicities retained. |
| 1.4 nef primitive isotropic criterion | U vectors e and 2e have square 0, but gcd coordinates 1 versus 2; only e is primitive. Zero has no nonzero primitive class. | Passes. |
| 1.5 nodal reflection | In U⊕⟨r⟩, r²=−2, D=e+f+r has D²=0 and D·r=−2; reflection gives e+f−r, square 0, and extracts 2r. | Passes. |
| 1.6 genus-one existence route | e²=0, (e+f)·e=1; −e has ample pairing −1, so effectivity chooses the positive sign. | Passes numerically; geometric linear-system proof retained. |
| 1.7 multiple fibres | gcd(2,2)=2 for a double smooth/cycle divisor; double IV* centre 6 does not change total gcd 2. | Passes. |
| 1.8 integral two-section | A partner half-fibre F′ with F′²=0 has degree F′·2F=2; a rational two-section instead has square −2. | Passes. |
| 1.9 classical criteria | Pic^τ=ℤ/2 has two geometric points, canonical order 2 and h¹=0; μ₂ and α₂ have one point, canonical order 1 and h¹=1. | Passes. |
| 1.10 tame canonical formula | 2F₁∼2F₂ gives 2(F₁−F₂)=0; distinct half-fibres give the nonzero canonical 2-torsion class. | Passes. |
| 1.11 half-fibre types | Ordinary E[2](k) has two points, supersingular E[2](k) one; G_m(k) in characteristic two has only the identity of order dividing 2, while G_a is killed by 2. | Passes. |
| 1.12 OrdinaryType | μ₂ and α₂ have ring k[ε]/ε², length/points/tangent dimensions (2,1,1); their coproducts differ by nonzero ε⊗ε. | Passes; Check replaced. |
| Ordinary duality/base change | μ₂ dual has (length,points)=(2,2); α₂ dual has (2,1). Field extension preserves both Hopf coproduct formulas. | Passes. |
| 1.13 ClassicalType | k×k has (length,points,tangent)=(2,2,0); k[ε]/ε² has (2,1,1). | Passes; Check replaced. |
| Classical duality/base change | Dual of ℤ/2 is μ₂, with point count dropping 2→1 in characteristic two; α₂ remains connected. | Passes. |
| 1.14 SupersingularType | Primitive Δε has coefficient 0 on ε⊗ε; μ₂ has coefficient 1. Dual α₂ again has one point. | Passes; Check replaced. |
| 1.15 K3LikeCover | Classical/supersingular duals μ₂/α₂ have rank 2 and one geometric point; ordinary dual ℤ/2 has two and is excluded from the local construction. | Passes. |
| 1.16 local-cover cohomology | (h⁰,h¹,h²)=(1,0,1) gives χ=2=2·1; a smooth K3 cover cannot be inferred from this triple alone. | Passes. |
| 1.17 Conductrix | Generic conductor order m=1 becomes 2 if C is replaced by 2C; C=0 gives order 0 and the unit ideal. | Passes. |
| Biconductrix Cartier structure | Local t²=0 has nonzero nilpotent t, but its reduction t=0 has t=0; multiplicities are 2 versus 1. | Passes. |
| IsExceptional | Exceptional classical B=2C: B²=−8, χ(O_B)=4, h¹=1, h⁰=5; C=0 and a reduced rational tree give h¹=0. Surface h⁰(O_Y(B))=1 differs from 5. | Passes; three Checks replaced. |
| 1.17a saturated differential source | At multiplicity-one C, O(2C) has divisor coefficient 2, versus 1 for O(C); the quotient has rank 1, not rank 2 as for the zero injection. | Passes; new target. |
| 1.17a finite quotient defect | c₂=12 and B²=−8 give length(W)=12−8=4; replacing I_W by O gives 0≠4. | Passes; new target. |
| 1.17a dual/sections | ω²=O gives source ω(B); negative B quotient has no sections, so exceptional h⁰(L)=h⁰(Θ)=1, alongside h⁰(O(B))=1. C=0 gives positivity 0. | Passes; new target. |
| 1.18 exceptionality iff special fibre | A rational two-section satisfies R²=−2 and R·F=1; a square-zero two-section has 0≠−2 and cannot trigger specialness. | Passes; both directions retain specialness. |
| 1.19 quasielliptic restriction | Primitive III*/II* component counts 8/9 do not change under doubling; multiplicity flags 1 and 2 both remain under the restriction. | Passes. |
| 1.20 multiple special restriction | For double IV* and rational R, R·2F=2; dropping the rationality condition would also admit square-zero R, since 2·1=2 in both cases. | Passes. |
| 1.21 extra-special graph | Arm lengths 1,2,6 give 1+1+2+6=10 vertices and 9 edges; adjoining one curve gives 11 vertices, and a cycle raises first Betti number 0→1. | Passes. |
| 1.22 affine-E₈ exceptionality | The entire ten-vertex graph contains that same ten-vertex configuration; an eleven-vertex supergraph may contain it without satisfying the entire-graph predicate. | Passes. |
| 1.23 general half-fibre partner | F·F′=1 gives a 2-sequence; the extra-special E₈ case has one fibration, so a distinct partner count would require 2>1. | Passes. |
| 1.24 nonexceptional partner | 2F·2F′=4·1=4; nonexceptionality removes the one-fibration E₈ case. | Passes. |
| 1.25 distinct-pencil intersection | e·f=1 gives full intersection 4; e·2e=0 involves a nonprimitive vector. Two primitive proportional same-cone vectors have proportionality 1. | Passes. |
| 1.26 native model | U squares 0,0 and pairing 1; root norm −2, orthogonal U-root pairing 0. Ambient e/2 has coordinate 1/2∉ℤ. | Passes; native definition added. |
| 1.26 numerical reducibility | h=d=e+f has norms 2,2 and pairing 2; e+f splits with norms 0,0 and pairings 1,1. With root r, d=2e+f+r has norm 2 and pairing 3; e+(e+f+r) has norms 0,0 and pairings 1,2. | Passes; Lean headline added. |
| Numerical reducibility boundaries | d=−e−f has norm 2 but h-pairing −2; d=0 has norm 0. Sums of two positive h-pairings cannot equal −2 or 0. | Passes; excluded premises explicit. |
| 1.26 effective reducibility | A positive square D²=2 must have nonzero summands; D=0 gives square 0 and lies outside. An effective decomposition of zero would require ample degree 0=sum of two positive integers. | Passes. |
| 1.26 generic-coset two-section | Horizontal degree is 2; two nonzero horizontal summands would have degree at least 2+2=4. Generic Pic⁰ coset has order 2, so discarding a vertical divisor contributes class 0. | Passes. |
| 2.1 EnriquesFamily | Constant Y and its dual-number restriction keep χ=1,b₂=10; P² has χ=1 but b₂=1. Empty base has zero geometric fibres. | Passes. |
| 2.2 Picard algebraic space | For geometric Y, H⁰(O_Y)=k, so base-change comparison k⊗kK→K is the identity K→K; at the empty base both sides are zero. | Passes; no Pic^τ premise. |
| 2.3 Picard flatness | Coherent pairs (0,0),(1,1) give b₁=2(h¹−h²)=0; the second has h²=1, excluding a characteristic-independent h²=0 shortcut. | Passes; proof order repaired. |
| 2.3 torsion rank | (ℤ/2)_R and α₂_R over k[ε]/ε² have k-length 4; R[t]/(t²,εt) has k-length 3 while its sole geometric fibre has length 2. | Passes; nonflat control added. |
| 2.3 quotient/scheme step | Geometric Num has rank 10; a Pic^τ-torsor over one numerical component has finite degree 2. The zero numerical component retains μ₂/α₂ infinitesimals of length 2. | Passes; effectivity kept as Enriques target. |
| 2.4 CanonicalCoverFamily | Nonempty classical fibre: edge(trivial)=0 versus inclusion of a group of order 2; empty base: edge=χ=0. Ordinary cover group has two points, classical cover group one. | Passes; empty-base Check fixed. |
| 2.5 Leray obstruction | Empty S gives 0→0→0→0→0; with a section, s*f*=1, so a kernel element a has a=s*f*a=0. | Passes. |
| 2.6 injective criterion | Exactness gives f*δχ=0; injectivity sends this equality to δχ=0; without injectivity a nonzero kernel class is not excluded. | Passes. |
| 2.7 section criterion | Composition s*f* on H² is multiplication by 1; for a=0 both maps give 0. | Passes. |
| 2.8 étale Picard criterion | O⊕ω⁻¹ multiplication has product in ω⁻² and needs ω⁻²→O; an ω²→O map has exponent 2 rather than −2 as source. | Passes. |
| 2.9 twisting torsor | Twist classes add: a+0=a, a+(−a)=0; with H¹(S,G)=0 there is one cover class, rather than zero classes when existence is assumed. | Passes. |
| 2.10 ConstantNum | Split ℤ¹⁰⊕α₂ has quotient rank 10; real conjugation negating e₁ has invariant rank 9, not 10. | Passes. |
| ConstantPicard | Standard ℤ¹⁰⊕ℤ/2 has torsion points 2; ℤ¹⁰⊕μ₂ and ℤ¹⁰⊕α₂ in characteristic two have 1. | Passes. |
| SplitPicard | Standard section n↦(n,0) composes to n; real descent σ(e₁)=e₁+τ gives σ²(e₁)=e₁+2τ=e₁, but shifts either lift by τ≠0. | Passes. |
| Full-constancy equivalence | Standard extension satisfies (constant Num, split, constant étale torsion)=(1,1,1); α₂ extension gives (1,1,0) and fails full constancy. | Passes in both directions. |
| 2.11 unit-square cover classes | Pic(R)=0 removes the last Kummer term; units 1 and v² have identical square class 1. Over ℤ[1/2], parity/sign give four classes. | Passes. |
| 2.12 canonical order | Constant étale Pic^τ has two geometric points and nonzero ω of order 2; ordinary Pic^τ has one point and ω of order 1, violating the constancy hypothesis. | Passes. |
| 2.13 numerical descent | Representatives L and L⊗ω have the same Num class; tensoring twice gives L⊗ω²=L. Over a finite field the Brauer obstruction has value 0. | Passes. |
| 2.14 curve descent | A genus-zero curve with a degree-one bundle has h⁰=2 and maps to P¹; a nonsplit conic has minimum positive line-bundle degree 2 and fails that input. | Passes. |
| 2.15 fibration descent | A degree-one base divisor yields a rational point of degree 1; a nonsplit conic only permits even degrees, so 1∉2ℤ. | Passes. |
| 2.16 rational tame fibres | Classical pencil has two double fibres; separately descended half-fibres yield two degree-one base points, rather than a single degree-two conjugate pair. | Passes. |
| 2.17 residue-field existence | A primitive isotropic half-fibre F defines |2F| with fibre degree 2; descent base degree 1 identifies P¹ instead of a degree-two conic form. | Passes for the stated route. |
| 2.18 finite-field descent package | Pic(F_q)=0 and Br(F_q)=0; for q=2 these remain 0,0 with no integral-model assumption. | Passes. |
| 2.19 graph descent | Over F₂ any purely inseparable finite residue degree is 1; a degree-two closed point is separable, so cannot support a geometrically reducible fibre under these hypotheses. | Passes. |
| Imported I₀* exclusion | Four distinct rational attachments on central P¹ require 4 points, but #P¹(F₂)=3. Over F₃ it has 4, so this count alone gives no exclusion. | Passes; duplicate §2.20 deleted. |
| 3.2 numerical constancy/count | q=2 gives 1+20+4=25; q=4 gives 1+40+16=57. Connected finite étale ℤ domain factor has rank 1. | Passes. |
| 3.3 local projectivity | 2τ=0 permits doubling a numerical class; a section gives s*f*=1 on its obstruction group. Every open neighbourhood of a local closed point is the entire spectrum. | Passes. |
| 3.4 local canonical cover | #Y(F₂)=25>0 supplies a point; dual of μ₂ is ℤ/2 with rank 2 and two points. | Passes. |
| 3.5 four global twists | Units ±2ⁿ modulo squares give (sign,parity)∈{0,1}², cardinality 4; 2·2=4 is square, while 5 is not a unit. | Passes. |
| 3.6 dyadic representative definition | Exponent order (000,001,010,011,100,101,110,111) gives 1,5,2,10,−1,−5,−2,−10. | Passes. |
| dyadic_square_classes | Valuation parity 0/1 and odd unit residues 1,3,5,7 give 2·4=8 classes. At x=0 all eight quotients are square zero, so uniqueness fails and hx is necessary. | Passes. |
| Strong Hensel input | u≡1 mod 8 gives ‖1−u‖≤1/8<1/4=‖2‖². For u=5, 1/4<1/4 is false. | Passes. |
| 3.7 global twist identity | For exponent order above both sides give 1,5,4,20,1,5,4,20. Twists are 1,1,2,2,−1,−1,−2,−2. | Passes. |
| 3.8 difference class | Difference c=5 has (e,a,b)=(0,0,1); c=−10 has (1,1,1). Dividing a class by itself gives square class 1. | Passes. |
| 3.9 ramified factors removed | c=−10, u=−2 gives cu=20=5·2²; c=2,u=2 gives 4=1·2². | Passes. |
| Unramified model convention | z²−z−1 has discriminant 5; mod 2 it has value 1 at 0 and 1, and derivative 1. The comparison ratio −15≡1 mod 16 is square. | Passes. |
| 3.10 étale K3 cover | χ doubles 1→2; ω=O gives h⁰=h²=1, hence h¹=0. A trivial étale double cover instead has h⁰=2 and is excluded. | Passes. |
| 3.10a π₁ computation | Cover degree d=χ(O_Z)≤1−h¹+h⁰(ω_Z)≤2; μ₂→μ₂ has one nonzero endomorphism, μ₂→ℤ/2 and μ₂→α₂ have none. Group orders are 2,1,1. | Passes. |
| 3.11 good local models | The global twist removes two exponent bits, leaving b=0 or 1; the local unramified twist removes that last bit. Generic difference becomes class 1. | Passes. |
| 3.12 extension splitting | At n=0 both lattice and splitting are zero; at n=1 a section above 1 extends by m↦m·lift(1), and projection returns m. | Passes. |
| 3.13 full Picard constancy | Étale branch gives torsion geometric-point count 2; μ₂ branch would produce K3 h²,⁰=1 despite Fontaine's 0. Free rank remains 10. | Passes as contradiction route. |
| 4.1 Jacobian adapter | Smooth index-two torsor has 0 K-points, Jacobian at least its 1 identity. Quasielliptic affine Pic⁰ has dim H⁰=∞, proper completion dim H⁰=1. Section intersection 1=m·n forces m=1. | Passes; Checks replaced. |
| 4.2 Jacobian rationality | χ=1 gives deg R¹=−1, h¹=0 and P₂=h⁰(O(−2))=0; product χ=0 gives h¹=1; K3 χ=2 gives P₂=1. | Passes; circular route replaced. |
| Shared canonical/Euler formula | Product has L=O and ω=f*O(−2); χ=1 Jacobian L=O(−1) and ω=f*O(−1); χ=2 Jacobian L=O(−2) and ω=O. Equal kernel/cokernel lengths t=0,1,2 give t−t=0. | Passes; correct supplier imported. |
| 4.3 geometric Kodaira comparison | Torsor fibre 2F and Jacobian fibre F have common primitive type; schematic gcds are 2 versus 1. | Passes. |
| 4.4 simple-fibre isomorphism | On F₂ I_n components, 3−2=1 smooth point remains; on type IV, 3−1=2 remain. Primitive multiplicity 1 is distinct from torsor multiplicity 2. | Passes. |
| 4.5 nonrational fibres | Residue degree 2 over F₂ is separable, not purely inseparable; a reducible fibre would require residue degree 1. | Passes. |
| 4.6 Jacobian I₀* exclusion | Geometric-type comparison retains the four-attachment I₀* graph; 4>3 excludes the Enriques fibre and thus its Jacobian type. | Passes; consumer repointed. |
| 4.7 semistable graph descent | Split I₂ and nonsplit I₂ each have two component vertices; rational branch/node counts differ, giving counts 4 and 6 without changing the component graph. | Passes. |
| 4.8 at-most-one restriction | Three rational base points minus two ordinary/additive tame multiple fibres leaves at most 3−2=1 semistable/supersingular fibre. Smooth I₀ alone would not distinguish ordinarity. | Passes; §3.9 cited. |
| 4.9 Mordell–Weil descent | Removing degree 2m by m times a two-section gives 2m−2m=0. The argument works with square 0 or −2. Brauer group over the algebraically closed-constant function field is 0. | Passes. |
| 4.10 auxiliary counts | Split I_r gives 3r−r=2r; nonsplit I₁/I₂ give 4/6; additive r=6 gives 13; 13+4+8=25. | Passes; source of isomorphism corrected. |
| 4.11 constant Jacobian Picard | Rank ten rational surface maximal count is 1+10·2+4=25; its auxiliary fibre sum 13+4+8 also equals 25. Equality with actual Jacobian counts is used only after constancy. | Passes. |
| 5.1 fourteen elliptic cases | Additional candidates give 15+4+6=25, 17+4+4=25 and 15+4+6=25. Counts cannot reduce fourteen entries to eleven. | Passes; completeness still supplied. |
| 5.2 quasielliptic rank sum | 10=2+Σ(r−1)=2+Σr−3 gives Σr=11; allowed counts are 1,2,7,8,9,9. | Passes; I₀* consumer repointed. |
| 5.3 four quasielliptic triples | 9+1+1=11 twice for distinct symbols; 8+2+1=11; 7+2+2=11. Replacing a III by II in the last gives 10. | Passes. |
| 5.4 forced multiplicities | With one simple semistable fibre among three rational points, the other two provide the two tame double fibres; multiplicities 1,2,2. | Passes. |
| 5.5 simple III* | III*+E₄+I₂ and III*+E₂+Ĩ₂ have a forced simple semistable fibre; the III*+E₄+E₄ branch has two remaining smooth fibres and permits simple III*. | Passes. |
| 5.6 rational two-section exclusion | Intersection one with half-fibre gives full degree 2, and square −2 makes it special. Square zero has the same degree but fails rational specialness. | Passes. |
| 5.7 extra exclusions | Three candidate point sums are 25,25,25, equal to the required count. Smooth E₄ has four rational points but no rational component replacing the III/IV argument. | Passes as necessary controls; all three geometric exclusions remain proof targets. |
| 5.8 descended partner | Geometric F·F′=1 survives field descent; full-fibre degree remains 2·2·1=4. | Passes. |
| 5.9 I₈ elimination route | A newly generated I₃ or I₇ has 3 or 7 cycle components; neither occurs among the fourteen-plus-four permitted triples. | Passes as conditional route. |
| 5.10 II* elimination route | Partner intersection one meets a weight-one tip; forcing a second component of weight at least 2 gives intersection ≥2>1. | Passes as conditional route. |
| 5.11 multiple I₄* | The generated I₀* has four rational attachments versus three P¹(F₂) points. | Passes; consumer repointed. |
| 5.12 IV* | Four forced distinct points on a rational component exceed 3; in IV*+E₄+Ĩ₂ the replacement half-fibre has no such rational component. | Passes; extra branch remains §5.7. |
| 5.13 IV elimination | Same-fibre D₅/A₂ branch has adjacent weights 2 and 1, giving intersection ≥3 versus upper bound 2. | Passes. |
| 5.14 residual list | Fourteen elliptic cases reduce to five; four quasielliptic reduce to three. Residual total 5+3=8 uses the three additional exclusions. | Passes as conditional count. |
| 5.15 residual multiplicity | I₁* retains gcd 2; I₄* and semistable fibres retain gcd 1 after multiple-I₄* and tame exclusions. | Passes. |
| 6.1 firstGram | Entries (8,3)=1,(8,9)=1,(9,9)=0; all 100 differences Aᵢⱼ−Aⱼᵢ are 0. | Passes; named symmetry padding deleted. |
| 6.1 secondGram | Entries (8,8)=0,(8,9)=1,(8,3)=0,(5,6)=(5,7)=1; all symmetry differences 0. | Passes; named symmetry padding deleted. |
| firstLattice carrier | e₁∈L with norm −2; e₁/2∉L with ambient norm −1/2; e₁+e₂ and −2e₁ have norms −2 and −8. | Passes; membership Checks added. |
| secondLattice carrier | The same coordinate-membership and norm calculations give −2,−1/2,−2,−8; rational basis-pairing agreement alone would not exclude e₁/2. | Passes; membership Checks added. |
| Both matrix determinants/Smith factors | det N₁=det N₂=−4; rank mod 2=8; inverse denominator 2. Thus two nontrivial factors have product 4 and are both 2. | Passes. |
| 6.2 first discriminant group | Quotient representatives number 4, each killed by 2, so group (ℤ/2)² has order 4 rather than cyclic ℤ/4. | Passes. |
| firstLattice_isotropic_card | Enumerated native half-norm values 0,0,0,1/2; exactly 3 zeros, including zero. Even diagonal entries −2/0 give even norms. | Passes. |
| First geometric embedding | |det S|=4 and |det Num|=1 give index²=4, index=2; using the index unsquared would give 2≠4. | Passes. |
| First dual-basis identities | Diagonal entries for C₁*,C₇*,C₈*,R*,F* are −1,−2,−2,0,−2; cross pairings C₈*R*,C₈*F*,R*F* are 0,2,1. | Passes. |
| 6.3 second discriminant group | Quotient has four classes, killed by 2; determinant −4 and inverse denominator 2 agree with (ℤ/2)². | Passes. |
| secondLattice_isotropic_card | Half-norm values 0,0,0,1/2 give three isotropic classes; U contributes determinant −1 and trivial discriminant group. | Passes. |
| 6.4 generic Pic⁰ quotient | L·F=m implies generic degree 2m; subtracting mT gives degree 0. Index quotient has order 2, whereas retaining the degree summand gives an infinite group. | Passes. |
| 6.5 generating two-section | Nonzero coset has order 2; integral degree-two divisors cannot split into two horizontal components of degrees at least 2. Allowed even squares are −2 or 0 after minimality. | Passes. |
| 6.6 spinor incidences | Weighted equation has 15 solutions: 5 interior, 4 double-tip, 6 tip-pair. Isotropic nonzero cosets retain four pairs, two per spinor. | Passes. |
| 6.7 dual square | For C₈*+nR*+F*, squares at n=0,1,2 are 0,2,4=2n; square 0 forces n=0. | Passes. |
| 6.8 first forbidden graph | An integral residual half-fibre supplies 2 smooth rational points; two partner half-fibres plus the extra intersection demand 3>2. | Passes as conditional incidence test. |
| 6.9 opposite tips | F·C₀=F·C₈=1 and other entries 0 gives weighted degree 2; I₀* completion demands 4>3 points, while III* completion reaches the first forbidden graph. | Passes; consumer repointed. |
| 6.10 second forbidden graph | R·C₀=2,R·C₂=1 gives R·(C₀+2C₂+…)=2+2=4, the correct full-fibre degree for two intersecting pencils. | Passes. |
| 6.11 I₄* incidence count/orbits | Exact count 15; orbit sizes 2,2,1,2,4,4 sum to 15. All coordinates ≤2 because every weight ≥1. | Passes. |
| 6.12 I₄* elimination | Six orbit representatives cover all fifteen vectors; fork-pair I₀* branch gives 4>3 rational attachments. | Passes as conditional coverage test; consumer repointed. |
| 7.1 multiple III* | Claimed partner half-fibre intersection would be simultaneously 1 and 2; a factor-of-two omission would conceal 1≠2. | Passes as conditional incidence test. |
| 7.2 III* incidence count/orbits | Weights (1,2,2,3,4,3,2,1) give six vectors and reversal-orbit sizes 2,1,2,1, total 6. | Passes. |
| 7.3 simple III* | Middle branch lower bound 8>4; final double-tip branch full intersection 2<4. Both contradict the corresponding full-fibre bounds. | Passes as conditional incidence test. |
| 7.4 restricted configurations | For distinct partner pencils, full intersection 2 conflicts with minimum 4; no characteristic-two-only symbol restriction is substituted into this arbitrary-characteristic argument. | Passes as numerical test. |
| 8.1 tangent cohomology | 0−10+0=−10 and 1−12+1=−10; h¹=10+2h⁰ gives 10 and 12. | Passes; sequence dependency added. |
| 8.2 supersingular nonlifting | Pic⁰=α₂ has tangent dimension 1 and b₁=0; a flat W₂ lift would require 0=ab=2≠0 for its local-local Oort–Tate parameters. | Passes for application; both gaps retained. |
| 8.3 W₂ criterion | Exceptional classical: h⁰(L)=1=h⁰(L⊗ω), L·H=2C·H>0. Supersingular: ord(ω)=1≠2. Other branch: h²(Θ)=0. | Passes; all three proof branches distinguished. |
| 8.3a finite-extension lift | W[[t₁,…,t₁₀]] has dimension 11. For V=W[π]/(π²−p), π↦pa gives π²↦0 but p↦p≠0 in W₂. | Passes; inventory corrected. |
| 8.4 deformation ring | Unobstructed dimension 1+10=11; obstructed one-equation dimension 1+12−1=12. Relation p alone gives p=0 and is excluded by independent characteristic-zero lifting. | Passes. |
| 8.5 exceptional modulo four | ℤ/4→W₂(F̄₂) sends 2 to nonzero 2 with 2²=0. A hypothetical lift would remain a nontrivial length-two thickening, not a characteristic-two base. | Passes as obstruction test. |
| 8.6 finite-field endpoint | Residual 8 cases lose 2 I₄* and 4 III* rows, leaving 2 restricted configurations, which §7.4 excludes. Constant Num count is 25; full Picard imposes extra classical torsion. | Passes as conditional route count. |
| 8.7 integral endpoint | The ℤ-family's F₂ fibre has 25 points and full torsion ℤ/2; its ℤ/4 restriction supplies the length-two lifting contradiction if exceptional. | Passes as contradiction-route test. |

## Maintainer notes

The only own Lean names removed are the two symmetry computations; the own names added are `enriquesNumericalLattice` and `positive_cone_decomposition`. Other roadmaps should cite NeronModelsAndSemistableAbelianVarietiesPartII §2.14 for the deleted §2.20 theorem. The new §1.17a and all new Checks are Enriques-specific repairs, not a new general differential library.

The six supplier gaps remain explicit external obligations. No supplier was edited and no merge-order decision is requested. Full Picard scheme representability in §2.3 includes the Enriques torsion-finiteness and effective-descent arguments; the roadmap no longer treats constant fibre length, or an arbitrary étale cover by schemes, as a proof of that conclusion. The existing fourteen-case completeness and three additional configuration exclusions remain indispensable future proof obligations.

No source-acquisition request remains outstanding. No commit, push, pull-request edit, tooling edit or merge-order edit was made.
