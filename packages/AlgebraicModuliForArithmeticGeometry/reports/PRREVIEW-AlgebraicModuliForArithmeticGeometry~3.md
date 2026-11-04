# Review of AlgebraicModuliForArithmeticGeometry (pull request #853 at 61d2065)

**Verdict:** needs changes

## R01 (P2) — Coherent dévissage is statable at the pins

**Location:** `TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry/Suggested.lean:20`, “Its coherent dévissage criterion needs coherent sheaves on Noetherian schemes with their supports and generic stalks.” The target is in `TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry/README.md:1060`.

**Claim:** The module docstring excludes this headline as not statable. The required carriers exist. On a Noetherian scheme, finitely presented module sheaves are coherent; support can be expressed by nonzero stalks, and the generic multiplicity-one condition by stalk length one. No new sheaf or moduli construction is needed.

**Witness:** `Mathlib/AlgebraicGeometry/Modules/Sheaf.lean:36` supplies module sheaves; `TauCeti/AlgebraicGeometry/Modules/Stalk.lean:31` supplies their stalk modules. The following signature elaborated at the pins with only its intended `sorry` warning.

```lean
import Mathlib
import TauCeti.AlgebraicGeometry.Modules.Stalk

open CategoryTheory AlgebraicGeometry TopologicalSpace

namespace ReviewProbe

theorem coherentDevissage (X : Scheme) [IsNoetherian X]
    (P : X.Modules → Prop)
    (hzero : ∀ F : X.Modules, Limits.IsZero F → P F)
    (hexact : ∀ S : ShortComplex X.Modules,
      S.X₁.IsFinitePresentation → S.X₂.IsFinitePresentation →
      S.X₃.IsFinitePresentation → S.ShortExact →
      ((P S.X₁ ∧ P S.X₂ → P S.X₃) ∧
       (P S.X₁ ∧ P S.X₃ → P S.X₂) ∧
       (P S.X₂ ∧ P S.X₃ → P S.X₁)))
    (hgeneric : ∀ Z : Set X, IsClosed Z → IsIrreducible Z →
      ∀ ξ : X, IsGenericPoint ξ Z →
      ∃ G : X.Modules, G.IsFinitePresentation ∧
        {x : X | Nontrivial (G.presheaf.stalk x)} = Z ∧
        Module.length (X.presheaf.stalk ξ) (G.presheaf.stalk ξ) = 1 ∧
        P G) :
    ∀ F : X.Modules, F.IsFinitePresentation → P F := sorry

end ReviewProbe
```

**Repair:** Add the actual headline in the roadmap namespace, with its docstring and README name, and remove its exclusion from the module docstring. Use the native stalk module import above. Length one over the local ring says precisely that the stalk is its one-dimensional residue-field module. The quantified property P is the property in the dévissage theorem, not an opaque replacement for coherent sheaves. Retain the zero-sheaf hypothesis: on the empty scheme, P constantly false otherwise defeats the theorem. On `Spec k`, a generic witness has length one, whereas an even-dimensional witness cannot satisfy that condition. These are the README's distinguishing instances, preserved by the signature.

## R02 (P2) — The dependency gate remains red, but its reported edge uses the wrong version

**Location:** `TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry/README.md:329` and `:1009`, the supplier citations “AlgebraicVectorBundles L0C”.

**Claim:** The recorded push gate fails its dependency check. The independent check reproduces the failure. This is a gate blocker under the review contract, but the reported upward dependency is a false positive against the permitted main-branch supplier.

**Witness:** `TauCetiRoadmap/AlgebraicVectorBundles/README.md:254` on main contains L0C, polynomial operations. `roadmaps show AlgebraicVectorBundles` selects main. The target explicitly identifies this as a main supplier at README line 243.

**Repair:** The worker must resolve these citations to AlgebraicVectorBundles on main and obtain a passing gate. Do not move this roadmap below the later AlgebraicVectorBundles revision, delete its legitimate main supplier, or duplicate symmetric/exterior powers here. No tooling or order file was changed in this review. The witness distinguishes the two versions: L0C exists on main independently of the later revision at order position 247. This procedural finding does not assert that the mathematics has a dependency cycle. R01 independently requires changes even if this gate failure is waived or corrected.

## R03 (P3) — API and Check labels claim declarations absent from Suggested.lean

**Location:** `TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry/README.md:327` and `:333`, for example `ProjectiveBundles.projectiveBundle.universalQuotient` and `ProjectiveBundleTests.rankOne`.

**Claim:** The README repeatedly gives backticked local Lean names to API facts and Checks that are not declarations in the acceptance test. The prescribed shape requires API bullets in prose and unnamed mathematical Checks, with local declaration names only when kept in Suggested.lean.

**Witness:** Suggested.lean has six declarations: Hilbert–Serre, the Hopf inclusion theorem, two approximation predicates, and two approximation theorems. Neither quoted API/Check name is among them; the projective-bundle carriers are explicitly excluded in its docstring.

**Repair:** Rewrite these API lists as prose bullets and remove proposed declaration labels from Checks throughout the README. Retain the computed content, including `P(L)=S`, `P(0)=∅`, and the nonflat base-change test. Do not enlarge Suggested.lean with an API catalogue or boundary-case theorems to satisfy the labels. The gate's `readme-ids-missing=0` does not catch this semantic shape violation.

## R04 (P3) — Replace the future-pin supplier contract with a timeless scope statement

**Location:** `TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry/README.md:229`, “From Tau Ceti after the pin”, and `:239`, “When the pin moves past this commit”.

**Claim:** The exact supplier contracts contain APIs from an explicitly unavailable later commit and instructions conditional on a future pin change. This is neither a contract against the pins being reviewed nor timeless roadmap prose.

**Witness:** The paragraph itself distinguishes commit `ba8b4ae` from the pinned `a91d3aa` and says that its Grassmannian scheme API is unavailable at the pin. Suggested.lean imports only the pinned Mathlib.

**Repair:** Remove the future-pin contract. State the coherent relative Grassmannian and its comparison as mathematical targets, using the actual pinned quotient-module Grassmannian and named earlier suppliers. Update the inventory when the repository really changes pins. This preserves the rank-zero, rank-one and nonflat-base-change instances; no mathematical target should wait for a future library update.

## R05 (P3) — Identify the Frobenius equation as a deduction, not Görtz's Lemma 5.8

**Location:** `TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry/README.md:962`, the citation to “§5, Lemma 5.8, pp.58–59” attached to the Frobenius-stable locus.

**Claim:** The cited lemma supplies Grassmannian graph charts. It does not state the semilinear stable-locus theorem, its Frobenius equation, or its arbitrary characteristic-p base-change assertion.

**Witness:** ref27 line 2321, Lemma 5.8, identifies a Grassmannian chart with an affine space of matrices. The equation in the target additionally uses Frobenius pullback and the zero locus of the quotient composite.

**Repair:** Keep the theorem, but label it an authored deduction from the graph chart, Frobenius naturality and the already stated zero-map locus construction; cite the latter target explicitly at the claim. Distinguish this from the ordinary coefficient-linear locus. With identity coefficients the equation remains `t^p−t`; over `𝔽₄`, `t²=t+1` gives value 1 and excludes the graph, whereas ordinary identity gives 0. Thus the repair changes attribution, not the validated formula.

## Verified sound

The worktree remained unchanged. The head was checked, the outside-folder diff was empty, and the folder's recorded gate reports no stray file, source blob, forbidden import, `set_option`, sorry'd data, admitted example, or build failure. The original module elaborated with four `sorry` warnings and no other diagnostics. All six expanded declaration signatures were elaborated and compared with the README: no section binder disappeared. All four sorried theorem probes remained unsolved after separate one-tactic alternatives `simp`, `rfl`, `infer_instance`, and `assumption`; inspection of the nearby pinned results did not supply a one-lemma proof of an entire headline. There is no padding finding against those four theorems.

The review inspected all nine layers' target statements, with detailed calculations below for the sampled targets, end-theorem families, conventions and findings. The table records finite mathematical witnesses, not formal proofs of the general claims. Repeated naturality and transport laws in Layer 4 were tested using the same nonconstant restriction and nontrivial torsor fixtures; the compact report records those fixtures and the laws they distinguish rather than reproducing hundreds of identical unit calculations.

The worker's gate totals were zero except `depcheck=1`, with `build=0` and `outside-folder=0`. The independent dependency command returned:

```text
not movable: AlgebraicModuliForArithmeticGeometry consumes AlgebraicVectorBundles (#247) and is consumed by GenericDoublePointInterpolation (#33), which comes first: moving AlgebraicModuliForArithmeticGeometry after AlgebraicVectorBundles would put a supplier after a consumer, a cycle through AlgebraicModuliForArithmeticGeometry
UPWARD: AlgebraicModuliForArithmeticGeometry (#32) -> AlgebraicVectorBundles (#247) at README lines [329, 1009]
depcheck: 163 roadmaps, 1187 edges, 1 problem(s)
```

These are the checker's order positions, not pull-request numbers. R02 explains why resolving the main supplier matters. No genuine cycle is established by this output.

**Pinned objects opened.** Paths in this inventory are relative to the respective pinned library repositories. Mathlib is pinned at `6b7abb3`; Tau Ceti at `a91d3aa`.

| Object inspected | Declaration and location | What the native object supplies, and its limit |
| --- | --- | --- |
| Scheme module sheaves | `AlgebraicGeometry.Scheme.Modules`, `Mathlib/AlgebraicGeometry/Modules/Sheaf.lean:36`; abelian instance at 47; `presheaf` at 89 | Actual sheaves and arbitrary module morphisms, not just their isomorphism classes. |
| Finite presentation | `FinitelyPresentedSheaf`, `TauCeti/AlgebraicGeometry/FinitelyPresentedSheaf/Basic.lean:48` | Full subcategory defined by the native finite-presentation predicate; on a locally Noetherian scheme this is the coherent carrier needed in R01. |
| Module stalks | `AlgebraicGeometry.Scheme.Modules.stalkModule`, `TauCeti/AlgebraicGeometry/Modules/Stalk.lean:31` | Module over the actual local-ring stalk, with a real body. The targeted module was built before the R01 probe. |
| Noetherian scheme | `AlgebraicGeometry.IsNoetherian`, `Mathlib/AlgebraicGeometry/Noetherian.lean:277` | Supplies the Noetherian scheme hypothesis in the probe; no separation hypothesis is silently inserted. |
| Quotient Grassmannian | `Module.Grassmannian`, `Mathlib/RingTheory/Grassmannian.lean:66` | Module quotient, finite/projective quotient conditions and rank at stalks; this is not a relative representing scheme. |
| Effective module descent | `ModuleCat.comonadicExtendScalars`, `Mathlib/Algebra/Category/ModuleCat/Descent.lean:59` | Faithfully flat scalar extension is comonadic. The roadmap's tensor-coordinate bridge must use this result rather than re-prove comonadicity. |
| Scalar-extension descent of finiteness | `Algebra.FinitePresentation.of_finitePresentation_tensorProduct_of_faithfullyFlat`, `Mathlib/RingTheory/Finiteness/Descent.lean:97` | This is for algebras, not the arbitrary module theorem of §3.1. The similar name is not evidence of duplication of that module target. |
| Hilbert polynomial from a numerator | `Polynomial.hilbertPoly`, `Mathlib/RingTheory/Polynomial/HilbertPoly.lean:116` | Extracts an eventual polynomial from a rational-series numerator. It does not establish rationality or finite-length graded pieces for an arbitrary finite graded module. |
| Hopf flatness already available | `TauCeti.CommHopfAlgCat.faithfullyFlat_of_dominant`, `TauCeti/Algebra/AlgebraicGroup/CommHopfAlgCat/Flat.lean:136` | Requires an algebraically closed field, finite-type algebras and reduced target group. Those restrictions do not prove the arbitrary Hopf-inclusion headline. |
| Regular rings | `IsRegularRing`, `Mathlib/RingTheory/RegularLocalRing/Defs.lean:92` | Regularity includes the requisite Noetherian condition; the formal-fibre predicate is not just reducedness or smoothness over the original residue field. |

**Ownership and supply.** Searches were by objects (relative Proj, quotient Grassmannians, coherent descent, banded gerbes, Picard sheaves, formal effectivity, logarithmic differentials, resolution), using both pinned source trees and `roadmaps grep/show` across main and indexed open work. The board package index was searched as well. No collision with any of the six fully qualified declarations in Suggested.lean was found in the searched roadmap files. Existing roadmaps supply the substrate below; the retained variants are meaningful extensions rather than a second plan for their owners.

| Resolved supplier citation | Evidence opened | Ownership boundary used in this review |
| --- | --- | --- |
| AlgebraicVectorBundles L0C, L1A | `TauCetiRoadmap/AlgebraicVectorBundles/README.md:254`, `:269`, main | Symmetric/exterior powers and relative Spec. Its later projective direction is not permission to rebuild these. Main is a legal supplier regardless of the revision's order position. |
| SchemeAndStackFoundations §0.3 | `TauCetiRoadmap/SchemeAndStackFoundations/README.md`, relative Proj construction and `relativeProj_eq_stableReduction` | General relative Proj is supplied; the quotient convention and its dual-bundle comparison are the target's added interface. |
| SchemeAndStackFoundations §2.6 | Same README, projective-space cohomology and Serre vanishing | All integer twists and dimension zero are supplied. The nontrivial bundle determinant factor is an additional comparison, not an excuse to restrict to positive twists. |
| SchemeAndStackFoundations §§1.1, 1.11 | Same README, `qcoh_fpqc_descent` and `Spaces.QCoh` | Existing scheme descent and algebraic-space QCoh carrier are imported. The roadmap identifies aliases as aliases and adds tensor coordinates/space descent. |
| SchemeAndStackFoundations §4.14 | Same README, Hilbert/Quot target | General representability is supplied independently. §2.2 explicitly says its uniform-bound embedding is not an input back into that supplier. |
| DerivedModuleAlgebra §1.E.1 and §1.M.2 | `TauCetiRoadmap/DerivedModuleAlgebra/README.md`, inverse systems of perfect complexes and duality | Perfect-complex effectivity is imported, rather than reconstructed as a new deformation carrier. |
| EnhancedDerivedSheaves §E1.9 | `TauCetiRoadmap/EnhancedDerivedSheaves/README.md`, `perfect_proper_pushforward` | Its support, relative perfectness and properness assumptions must accompany use; §7.2's numerical fibre results apply to an already perfect complex. |
| CrystallineCohomology §CR.5:log-algebra.4 and §CR.5.1 | `TauCetiRoadmap/CrystallineCohomology/README.md`, divisorial log structure, boundary chart, log differentials and log de Rham complex | The source constructor has a regular Noetherian absolute-SNC scope. The target's regular-base plus relative-SNC hypotheses place its pairs inside it. The residue and compact-boundary comparisons are added here. |
| ResolutionOfSingularitiesCharacteristicZero §§5.1–5.6, 6.2–6.3, 7.8 | `TauCetiRoadmap/ResolutionOfSingularitiesCharacteristicZero/README.md`, named principalization, resolved-pair, relative embedded resolution, compactification and field-resolution exports | §§9.1–9.7 consume these exports on common carriers. The novel work here is the vanishing/numerical application. No general resolution reconstruction was inferred from the comparison names. |
| AdicSpacesPartII R1.3 and AdicSpacesPartIII R3.7/F0.7 | Corresponding `TauCetiRoadmap/AdicSpacesPartII/README.md` and `TauCetiRoadmap/AdicSpacesPartIII/README.md` | Scheme analytification and proper scheme GAGA feed the algebraic-space extension; the latter does not assert analytifiability of every locally separated space. |
| ModularCurves §0G; StableReduction Layers 2, 4; JacobianChallenge Layers A–D | Corresponding main README files | Locally free parameter spaces, projective geometry and relative coherent inputs are earlier supplied objects. Semilinear absolute Frobenius is distinguished from the ordinary invariant-locus construction. |

The resolver's 1,455 unresolved name leads are not 1,455 missing supplier declarations: many are this README's proposed local API names. They were not promoted to mathematical findings. Open-roadmap ownership searches were performed through the supplied index and relevant accessible heads; this does not certify unpublished work or open revisions for which no allowed file was supplied. No new supplier gap was assumed or invented.

**Headline inventory and acceptance-test coverage.**

| Headline family from the README | Acceptance-test disposition |
| --- | --- |
| Projective-bundle universal property, all-twist cohomology, coherent Grassmannians/flags, uniform quotient regularity and bounded support (§§1.1–1.7) | Geometric carriers identified as unavailable in the docstring. Hilbert–Serre is stated at line 49 in its integer-graded, Artinian-coefficient form. |
| Hom/Isom/Aut representability and coherent dévissage (§§2.1–2.3) | Parameter functors are excluded in the docstring. Dévissage is also excluded, incorrectly: R01. |
| Effective algebraic-space descent, relative Hom and Weil restriction (Layer 3) | Missing space/site interfaces are named in the docstring; no arbitrary predicate substitute is used. |
| Banded H² classification, neutrality, affine factorization and profinite finite-stage comparisons (Layer 4) | Gerbe and class-map carriers are named as missing. General Hopf-inclusion faithful flatness is stated at line 70, without reducedness, perfection or finite-type restrictions. |
| Rigidification and level removal (Layer 5) | Missing stack/inertia/quotient carriers named. |
| Pointed étale and henselian approximation (Layer 6) | Two native predicates and both deep theorems are present at lines 83, 91, 102, 114. Additional henselization/excellence formulations are named as unavailable. |
| Artin criteria, Picard representability, GAGA, component spaces, cofinite coefficient cohomology (Layer 7) | Missing space, obstruction and analytic interfaces named. |
| Formal effectivity, versality, completed atlas comparison, algebraization (Layer 8) | Missing framed deformation/formal-object groupoids named. |
| Resolution comparisons, logarithmic splitting/degeneration, adjoint vanishing, numerical very ampleness and polarized boundedness (Layer 9) | Missing supplied SNC/resolution, log-complex and intersection/positivity interfaces named. The numerical end results are not replaced by scalar inequalities in Lean. |

**Seeded source audit.** Source keys below identify the service's cached line-numbered extractions, not files added to the repository. The 89 bibliography links were submitted to the source service; three additional inline citations were looked up. Duplicate Stacks chapter links were read as the same work. No manifest was edited. There was no literal “unverified” marker found in the target README.

| Seeded target | Source text actually opened | Result at the locator |
| --- | --- | --- |
| 1.1 Projective quotients and all integer twists | ref43 line 1870, Lemmas 27.16.10–11, p.40; line 2137, Definition 27.21.1 and universal property, p.45 | Supports arbitrary base change and invertible twists for degree-one generated symmetric algebras. It does not make twists invertible for arbitrary graded algebras; the README retains that distinction. |
| 1.7 Determinantal and Frobenius loci | ref27 line 2321, Lemma 5.8, pp.58–59; line 2442, Proposition 5.16, pp.61–62 | Graph charts and closed flag containment are present. Frobenius-specific assertions are deductions, not statements of the cited lemma: R05. The displayed semilinear equation passes the computation below. |
| 2.2 Automorphisms and bounded quotients | ref37 line 1182, Theorem 6.5, p.30; line 1211, Theorem 6.6, pp.30–31; §5 proof of Theorem 5.2, p.26 | Proper-flat/projective hypotheses on the isomorphism locus and projective-flat source for Hom are retained. Aut is an open part of Hom; the explicit bound-dependent Quot embedding is distinguished from the supplied representing scheme. |
| 3.2 Tensor overlap and coalgebra comparison | ref48 line 227, Lemma 35.3.2; line 341, Proposition 35.3.9 | The coaction/transition identities are algebraic identities without flatness. Faithful flatness enters effectiveness, not the presentation comparison. |
| 4.6 Intrinsic centre sections and descended bands | ref15 line 1124, Lemma 8.11.8, pp.25–26 | Supports the intrinsic abelian band and evaluation. The README explicitly builds the varying-base compatibility omitted from the source's abbreviated construction. Nonabelian fibres are not silently assigned an abelian band isomorphic to all automorphisms. |
| 4.12 Object descent and inverse bandings | ref39 line 5384, Lemma 31.3, pp.122–123 | Supports full faithfulness and local-to-global essential surjectivity of band-preserving gerbe morphisms. The explicit inverse-band and coherent-mate formulas are deductions; their units and counits are retained. |
| 4.17 Local covers and chart comparisons | ref15 line 977, Definition 8.11.1, p.22 | Local inhabitation and local isomorphism give the canonical covering sieves. The README labels the precise sieve formulas as authored deductions and does not assume a global object. |
| 4.18a Orbit and modification carriers | §4.15–§4.18's transport equations; ref16, sheafification section 7.49; ref39 Lemma 31.3 | The section cites internal deductions rather than a fictitious source theorem about these particular Lean carriers. Distinct diagonal arrows survive the raw orbit relation; sheafification is not asserted to preserve emptiness of a fibre. |
| 6.0 The approximation predicate | ref88 line 1487, Theorem 16.13.1 (07QY); line 1526, Theorem 16.13.2 (07QZ) | Henselian and pointed étale forms agree with the two Lean theorems. Noetherian locality and regularity of completion fibres are explicit; congruence is quantified for every finite order. |
| 7.1a A concrete gluing failure | Authored direct-image calculation and explicit dual-number fibre product; no external theorem locator is claimed in this subsection | Recomputed directly below: the two subsets have identical projections but differ as subsets of the fibre product. This is a failure of the proposed set-valued gluing condition, not failure of module descent. |
| 7.2 Perfect-complex rank loci | ref89 line 2902, Lemma 75.26.1; line 2937, Lemma 75.26.4; line 2956, Lemma 75.26.6 (0D21), pp.64–65 | Upper semicontinuity, the single-degree open locus and lowest-degree stratum match. The README correctly uses degree a, fixing the source's H⁰ slip in the last equivalences. |
| 7.6a Scheme Picard presheaf | ref59 line 1231, Situation 99.11.1; line 1251, Lemma 99.11.2; line 1276, Lemma 99.11.4, pp.29–31 | Raw Picard classes and their fppf sheafification are distinct; base classes disappear locally. The splitting requires a section and universal global functions, which are present. |
| 9.4 Principalization and preservation | ref06 line 1071, Theorem 1.10 in the available preprint; named supplier §§5.1–5.5 and 7.8 | Introductory principalization statement and supplier contract checked. Published Theorems 11.14, 12.2, 12.4, 13.2 at pp.290–298 were not accessible in the fetched excerpt; not certified. |
| 9.7 Relative embedded resolution | Named supplier §5.6; ref06 fetched excerpt | Supplier contract and the three geometric examples checked. The cited tower (6.7) and Chapter IV locators are outside the available excerpt; not certified against the source text. |
| 9.10 Algebraic vanishing and numerical inputs | ref22 line 4174, Theorem 10.16, pp.114–116; line 4234, Corollary 10.17; line 4504, Corollary 10.23, p.124. ref19 line 293, Theorem 2.3; line 303, Theorem 2.4; line 533, Theorem 3.1; line 626, Proposition 4.6; line 644, Theorem 4.7 | Checked lift and strict degree hypotheses, compact-boundary label interchange, logarithmic differential linearity, canonical-sheaf distinction, and dependence of the numerical bound. These sources do not justify dropping W₂ lifts in positive characteristic or replacing relative SNC by absolute SNC over an arbitrary base. The roadmap does neither. |

Additional source check: ref90 line 925, Włodarczyk's author version dated 27 January 2010, Definition 3.0.10 and Steps 2a–2b, pp.19–20, agrees with §9.6's version-specific companion-ideal locator and its guarded positive-order branches. This is a mathematical supplier comparison; the report does not prescribe the source's algorithm as an implementation.

The source-key dictionary for the checks and errata is: ref14, [Stacks, Cohomology of Schemes](https://stacks.math.columbia.edu/download/coherent.pdf); ref15, [Stacks, Gerbes](https://stacks.math.columbia.edu/tag/06NY); ref16, [Stacks, Sheafification](https://stacks.math.columbia.edu/tag/00ZG); ref19, [Demailly, Effective Bounds for Very Ample Line Bundles](https://www-fourier.univ-grenoble-alpes.fr/~demailly/manuscripts/very_ample.pdf); ref22, [Esnault–Viehweg, Lectures on Vanishing Theorems](https://page.mi.fu-berlin.de/esnault/books/esvibuch.pdf); ref27, [Görtz, Algebraic Geometry III, 26 May 2024](https://math.ug/alggeom3-ws2324/pdf/AG3-WS2324-Goertz-20240526.pdf); ref37, [Nitsure, Construction of Hilbert and Quot Schemes](https://arxiv.org/abs/math/0504590); ref39, [Berkeley Math 274, Stacks notes](https://stacky.net/files/written/Stacks/Stacks.pdf); ref43, [Stacks, Constructions](https://stacks.math.columbia.edu/download/constructions.pdf); ref48, [Stacks, Descent for Modules](https://stacks.math.columbia.edu/tag/023F); ref59, [Stacks, Picard Functor](https://stacks.math.columbia.edu/tag/0D24); ref88, [Stacks, Smoothing Ring Maps](https://stacks.math.columbia.edu/download/smoothing.pdf); ref89, [Stacks, Derived Categories of Spaces](https://stacks.math.columbia.edu/download/spaces-perfect.pdf); ref90, [Włodarczyk, Simple Hironaka Resolution, author version](https://www.math.purdue.edu/~wlodarcz/Hiron-Complexity/complexity.pdf).

**Computed adversarial witnesses: 127 rows.** In the result column, “retained” means the actual roadmap hypothesis or distinction survives the test, not that a general theorem has been proved by testing. Cₙ is written additively when values are displayed; D denotes `k[ε]/(ε²)`.

| Statement or convention | Instance | Values on the two sides / competing model | Result and change |
| --- | --- | --- | --- |
| §1.1 quotient projectivization | E=0 over a nonempty field point | Invertible quotients: 0; points of P(0): 0 | Retained; remove only the undeclared Check label in R03. |
| §1.1 rank-one universal quotient | E=L | P(L)=S; tautological quotient line=L, not L⁻¹ | Quotient convention retained. |
| §1.1 integer twists | P(L), exponents 2 and −3 | L²⊗L⁻³=L⁻¹=O(−1); O(0)=O | Negative exponents retained. |
| §1.2 zero-dimensional projective space | P⁰ over k, m=−7 | H⁰(O(−7))=k, dimension 1; positive-degree-only formula would give 0 | Dimension-zero exception retained. |
| §1.2 projective-line cohomology | P¹, m=−2, −1, 2 | h¹(O(−2))=1; h¹(O(−1))=0; h⁰(O(2))=3 | Both boundaries retained. |
| §1.2 determinant twist | E=O(1)⊕O on P¹ | R¹π_*O(−2)=det(E)⁻¹=O(−1), not O(1) | Sign retained. |
| §1.3 coherent quotient ranks | k², ranks 0,1,3 | Gr(0,2)=point; dim Gr(1,2)=1; Gr(3,2)=empty | Rejects unsigned/truncated rank formulas. |
| §1.3 Grassmannian dimension | Gr(2,4) | Graph chart has 4 entries; 2(4−2)=4 | Retained. |
| §1.3 Plücker relation | Rows (1,0,a,b),(0,1,c,d) | Minors (1,c,d,−a,−b,ad−bc); (ad−bc)+bc−ad=0 | Ordered signs retained, also in characteristic 2. |
| §1.4 flags | Full flags in k³ | Dimension 1·2+1·1=3; successive projective fibres give 2+1=3 | Retained. |
| §1.5 regularity | O(a) on P¹ | H¹(O(a+m−1))=0 iff a+m≥0 | Threshold checked in both directions. |
| §1.5 quotient/kernel bound | Length-d quotient of O on P¹ | Quotient higher cohomology=0 for all twists; kernel O(−d) is m-regular iff m≥d | Kernel bound cannot be replaced by quotient bound. |
| Hilbert–Serre | k[x,y], usual grading | Length in degree d≥0 is d+1; series=(1−T)⁻²; eventual P=d+1 | Full headline, not merely a numerical polynomial identity. |
| Hilbert–Serre with nonreduced coefficients | A=D, M=A[x] | Each piece has A-length 1, series=(1−T)⁻¹; k-vector dimension is 2 | Correct coefficient-ring length convention retained. |
| Hilbert–Serre, no variables | Length-ℓ module concentrated in degree −2 | Shifted numerator=ℓ; eventual polynomial=0, degree −∞<0 | Negative generators and e=0 retained. |
| Hilbert–Serre, zero module/ring | M=0 | Every length=0; numerator=P=0; both series sides 0 | No nonzero-module hypothesis needed. |
| §1.7 determinantal structure | Matrix [ε] over D, rank≤0 | Ideal=(ε), not (0); every geometric fibre has rank 0 | Scheme structure retained. |
| §1.7 incidence with impossible rank | Zero source, rank-one target quotient condition | Required quotient of zero has no points; defining ideal is unit | No natural-subtraction shortcut. |
| §1.7 absolute Frobenius | Identity semilinear matrix; t∈𝔽₄ with t²=t+1 | t²−t=1; ordinary identity invariant equation=0 | Correct separation; attribution repair R05. |
| §1.7 zero semilinear operator | Φ=0 | Quotient composite=0 on every line; zero ideal=(0) | Entire parameter scheme, as claimed. |
| §1.7a coefficient transport | p=3,N=3,j=2, coefficient 5 | Source coefficient at 2 maps to target coefficient 5 at 6; no coefficient cubing | Retained. |
| §1.7a total-function boundaries | p=0, input (a,b); N=0 | Output degree-zero coefficient=a+b; empty source outputs 0 | Junk-value cases are specified. |
| §2.1 Hom/Aut | P¹ over k | Aut=PGL₂, dimension 3; polarized O(1) stabilizer is again PGL₂ | No fixed trivialization of O(1) is being represented. |
| §2.2 zero quotient | Hilbert polynomial 0 | Universal quotient=0; Grassmannian rank 0 gives one point | Bound-dependent comparison retained. |
| §2.3 dévissage zero hypothesis | Empty scheme, P=false | Integral closed tests: none; two-of-three implications true; P(0)=false | Zero hypothesis is essential; R01 repair retains it. |
| §2.3 dévissage generic hypothesis | Spec k, P=even dimension | P(0)=true; two-of-three=true; length-one G=k has P=false | Generic hypothesis excludes the wrong property. |
| §2.3 dévissage positive model | Spec k, P=finite dimension | Generic length=1; every coherent sheaf kⁿ has length n<∞ | Native probe has the intended generality. |
| §3.1 pullback need not be exact | ℤ→𝔽₂, multiplication by 2 | Original kernel=0; pulled map=0 on 𝔽₂, kernel=𝔽₂ | Nonflat control retained. |
| §3.2 coalgebra comparison | Canonical S⊗R M datum | d(s⊗m)=s⊗1⊗m; counit gives s⊗m; both iterated coactions give s⊗1⊗1⊗m | No flatness used in coordinates. |
| §3.2 transition and inverse | d(n)=Σaᵢ⊗nᵢ | θ(n⊗b)=Σaᵢ⊗bnᵢ; ψ(s⊗n)=Σsnᵢ⊗aᵢ; on canonical tensors each composite returns the original tensor | Factor order retained. |
| §3.3 effectiveness | ℤ→𝔽₂ | Scalar extension of multiplication by 2 is zero although original map≠0 | Presentation equivalence does not imply effective descent without faithful flatness. |
| §3.4 Weil restriction rank zero | Empty finite source | Sections set has one element; restriction is the base | Empty source retained. |
| §3.4 Weil restriction split source | Two copies of Spec k | Res(X)=X×X; for A¹ dimensions 2=1+1 | Distinguishes Hom over base from a section condition. |
| §3.4 nonétale finite flat source | Spec D→Spec k; X=A¹_D | A section is a+bε; restriction has two coordinates, A²_k | Finite locally free is not narrowed to étale. |
| §4.1 gerbe versus inhabited stack | Point site, discrete two-object groupoid | Objects=2; cross-Isom=∅ | Fails local connectedness, as required. |
| §4.2 band versus centre | BS₃ | Aut size=6; centre size=1 | Nonabelian groupoid has no centre evaluation isomorphism onto all automorphisms. |
| §4.2 band identification | BC₃, original versus inverse band | Generator maps to 1 versus 2 | Fixed band retains an identification, not just existence. |
| §4.3 derived classification | Zero coefficient sheaf | H²=0; banded class set has one element | No spurious neutralization choices remain. |
| §4.3 root gerbe | O(1), O(3) on P¹, μ₃ band | Classes 1 and 0 mod 3; root degrees would be 1/3 and 1 | First nonneutral, second neutral. |
| §4.20 positive connecting convention | Lifts b₀₁=2,b₁₂=3,b₀₂=1 | Boundary=2+3−1=4; reverse torsor orientation gives −4 | Positive translation convention retained. |
| §4.20 torsor lifting obstruction | C₂-topos, 0→ℤ→ℤ→ℤ/2→0 | Hom(C₂,ℤ)=0; nontrivial torsor class 1 maps to 1∈H²(C₂,ℤ)=ℤ/2 | Local objects do not imply neutrality. |
| §4.4 profinite finite-type failure | Quotients ℤ̂→ℤ/m! | Quotient orders m! are unbounded | No finite-type or finite-presentation conclusion is inferred for the limit gerbe. |
| §4.6 centre sections | BC₃ on point | Centre and object automorphisms both C₃, cardinality 3 | Evaluation is an isomorphism in the abelian connected case. |
| §4.6 disconnected negative control | BC₃⊔BC₃ | Section group C₃² has 9 elements; evaluation target has 3; kernel has 3 | Gerbe hypothesis cannot be dropped. |
| §4.7–§4.9 restriction fixtures | C₄→C₂→C₂, first reduction and then identity | 1↦1↦1; 2↦0↦0; compatible profiles=4 versus independent profiles=16 | Restriction coherence and noninjectivity retained. |
| §4.21 nonconstant slice | μ₃ over ℝ and ℂ | Section cardinalities 1 and 3 | A constant coefficient replacement fails. |
| §4.10 Isom torsor action | C₃ torsor, p=1,a=2 | a·p=0; difference(1,0)=2; difference(p,p)=0 | Action/difference directions retained. |
| §4.10 difference cocycle | C₃ points 0,1,2 | Difference(0,2)=2=1+1 | Positive, not inverse, translation. |
| §4.11 band-preserving full faithfulness | Identity BC₃→BC₃ | Isom map 0,1,2↦0,1,2; kernel size 1, image size 3 | No conclusion imposed for arbitrary unbanded maps. |
| §4.12 object descent | Identity BC₃ with local anchor changed by 1 | Recovered arrow remains a; anchor terms +1 and −1 cancel | Choice independence of the recovered arrow retained. |
| §4.12 inverse banding | Identity on BC₃ with inverse functor | 1 transported through unit and counit remains 1; an inverse-band substitution gives 2 | Inverse equivalence must preserve the specified band. |
| §4.13 modifications | Identity strong transformation of BC₃ | Natural automorphisms are C₃, hence 3, not a singleton | All modifications are retained. |
| §4.14–§4.16 diagonal transport | C₃, chart isomorphism a=1 | a+p−a=p; for p=2 the output is 2 | Diagonal independence works; not generalized to arbitrary endpoints. |
| §4.16 endpoint transport | Endpoint changes a=1,b=2, p=0 in C₃ | b+p−a=1, not p=0 | Both endpoints matter outside diagonal transport. |
| §4.17 object cover | Constant empty fibre on point; constant discrete Bool | Covering-sieve candidates are ∅ and maximal respectively | No global object is selected from local inhabitation. |
| §4.17 isom cover | Discrete Bool: false/true and false/false | Isom sieves ∅ and maximal respectively | Distinguishes inhabited fibres from gerbes. |
| §4.17 overlap cover | BC₃, two restrictions to one point | Isom set has 3 elements; overlap sieve maximal | Construction needs supplied local objects, not chosen universal overlaps. |
| §4.18a raw orbit carrier | Identity BC₃ | Conjugation orbits of arrows are {0},{1},{2}; 1≠2 in quotient | Distinct diagonal arrows survive. |
| §4.18a modification inverse | C₃, modification +1 then −1 | p↦p+1↦p, all three values restored | Functor retains modifications and inverses. |
| §4.18a empty fibre | Empty groupoid | Raw pairs=∅ and raw orbits=∅ | No claim that sheafified sections are empty. |
| §4.19 affine factorization | BC₄→BC₂ reduction | Kernel C₂; middle gerbe BC₂; residual faithful map identity | Quotient factor and kernel distinguished. |
| Hopf inclusion faithful flatness | k→k[t]/tᵖ with primitive t, p=2 or 3 | Free k-rank p; nonreduced source group; faithful flatness true | Reducedness would wrongly exclude this valid case. |
| Hopf inclusion faithful flatness | k[tᵖ]⊂k[t], additive Hopf structures in char p | Basis 1,t,…,tᵖ⁻¹; module rank p, both flat and faithful | Inseparability is allowed. |
| Hopf inclusion without hypotheses | k→k, identity | Rank 1, tensor functor identity | Boundary valid but not the content of the headline. |
| §5.1 rigidification | BC₄ by central C₂ | Original inertia size 4; quotient inertia size 2 | Quotient, not annihilation of all inertia. |
| §5.1 subgroup normality | S₃, subgroup generated by (12) | Conjugation by (123) gives subgroup generated by (23), unequal | Arbitrary nonnormal subgroup excluded. |
| §5.1 non-smooth subgroup | Bμ₂→point in characteristic 2 | μ₂ tangent dimension 1; quotient stack is point | Smoothness of the inertia subgroup is not silently required. |
| §5.3 pointwise versus fppf surjectivity | Squaring Gₘ over ℝ | −1 has no ℝ-square root but has one over ℂ | Rational-point surjectivity is not substituted for fppf surjectivity. |
| §5.4 normalization and reduction | Node xy=0; Spec D | Normalization splits into two branches; reduction of D is k | Reduced and nonreduced inputs distinguished. |
| §5.4 schematic image | Spec ℤ[1/p]→Spec ℤ | Image closure all Spec ℤ; fibre at p empty | Image formation need not commute with this nonflat base change. |
| §6.0 approximation predicate | A=k, maximal ideal 0 | For n≥1 congruence modulo 0 is equality; n=0 modulus is unit ideal | Quantification over all n is material. |
| §6.0 complete local positive model | A=k[[t]] | Completion=A; choose ψ=φ; difference 0 at every order | Native predicate has expected complete case. |
| §6.1 need for henselianity | A=ℚ[t]_(t), z²=1+t | Formal z=1+t/2−t²/8+…; no rational-function square root since ord_(t+1)(1+t)=1 | Henselian conclusion not asserted for this A. |
| §6.1 pointed étale alternative | Same equation, derivative 2z at z≡1 | Residue derivative=2≠0; localized étale algebra carries z and maps to the completion | Pointed-neighbourhood theorem survives where an A-valued solution fails. |
| §7.1a gluing failure | D×ₖD, diagonal D versus whole fibre product | Both projections surject to D; dimensions 2 versus 3; (ε,0) lies only in whole product | Concrete injectivity failure retained. |
| §7.2 Betti semicontinuity | [k[t] —t→ k[t]], degrees 0,1 | Off t=0: (β₀,β₁)=(0,0); at 0: (1,1); Euler 0 on both | Derived fibres, not ordinary cohomology fibres. |
| §7.2 single-degree locus | k in degree 0, i=0,r=1; i=1,r=1 | First locus is point; second empty | All degrees must be controlled. |
| §7.2 lowest-degree stratum | Same two-term t-complex, a=0,r=1 | Rank-one stratum V(t); after t=ε kernel=(ε) is not free rank one over D | Universal base-change condition is essential. |
| §7.2 nonzero degree | k[−1], a=b=1,r=1 | H¹=k, rank 1; H⁰=0, rank 0 | README fixes the source's H⁰ misprint. |
| §7.2 universal functions | Proper geometric fibre Spec D versus Spec k | h⁰(D)=2 versus h⁰(k)=1 | Connectedness alone cannot replace geometric reducedness/function hypothesis. |
| §7.3 module Hom | F=k[t,x]/(x), G=k[t,x]/(x−t) | A map is z with tz=0; generic fibre 0, special fibre A¹ | Representing affine Hom space need not be flat. |
| §7.3 module Isom | Same modules | Requires z invertible and tz=0; empty generic fibre, special fibre Gₘ | Proper supports and flat modules do not make Isom flat. |
| §7.3 Picard infinitesimal lifting | Smooth curve genus g, small kernel I=k | H²=0; lift torsor dimension g; scalar automorphism dimension 1 | Automorphisms not erased by passing to classes. |
| §7.4 proper GAGA | Proper point over complete K | Coherent modules on both sides are finite K-vector spaces; H⁰=K, Hʲ=0 for j>0 | Identity comparison and degree convention retained. |
| §7.5 inseparable normalization | k[t]⊂k[u], t=uᵖ | Finite rank p; relative differentials generated by du, hence not étale | Finiteness retained without separability; generic étaleness requires it. |
| §7.5 coefficient integrality | (T−x)ᵖ=Tᵖ−xᵖ in char p | Intermediate coefficients=0; constant coefficient=−xᵖ lies in V if x lies in prolongation | Multiplicities retained in inseparable case. |
| §7.5 empty valuation family | No Vᵢ | Intersection in F=F; integral closure in finite E is E; intersection of empty prolongation family=E | Empty convention agrees. |
| §7.5 K/O exact sequence | M=O, uniformizer π | Class π⁻¹ nonzero; π·[π⁻¹]=0; socle dimension 1 | Injection uses inverse uniformizer, not π. |
| §7.5 cofiniteness | M=(K/O)² | Socle dimension 2; Matlis dual O² has 2 generators | No finite residue-field/cardinality assumption. |
| §7.6a raw Picard presheaf | Identity P¹→P¹, evaluated on identity | Raw Pic=ℤ; relative sheaf=0 since base classes become locally trivial | Raw and relative objects distinguished. |
| §7.6a field and empty tests | Spec k, empty scheme | Pic groups both trivial; one line-class each | Degenerate classes do not introduce spurious generators. |
| §7.6 section splitting | X=P¹ₖ, base point | Pic(X)=ℤ; Pic(base)=0; kernel of section pullback=ℤ | Claimed split sequence agrees. |
| §8 framed lifts | A¹, x=0, dual numbers | Lifts x↦aε indexed by a∈k; all reduce to 0 | Framing retains first-order information. |
| §8 completion versus special fibre | Formal point x=0 versus x=ε | Equal mod maximal ideal; unequal mod its square | Completion is not a single fibre. |
| §8 effectivity warning | t mod tⁿ in k[t]/tⁿ | Each truncation nilpotent; limit t∈k[[t]] not nilpotent | Formal effectivity is a hypothesis/theorem, not automatic from setwise truncations. |
| §8 versal atlas versus hull | Smooth A¹→point | Atlas tangent dimension 1; deformation tangent dimension 0 | Smooth atlas need not be a minimal hull. |
| §8 non-smooth inertia | μₚ-torsor zᵖ=1+ε over D | Every (a+bε)ᵖ=aᵖ; no solution with ε coefficient 1 | Smoothness cannot be dropped from the relevant lifting step. |
| §8 coarse versus stack deformation | Sign quotient x↦x² over D, char≠2 | Every x=aε maps to 0; coarse first-order t=ε exists | Coarse completed space is not the deformation groupoid. |
| §9.4 unit principalization | Ideal O | F=0; weak transform=O; multiplier ideal=O | Supplier contract retained. |
| §9.4 generic nonzero condition | Ideal zero on one component, unit on another | Zero-component total transform remains zero, never invertible | Input excluded for the stated reason. |
| §9.4 canonical-degree comparison | Smooth degree-δ hypersurface, dimension p | ω=O(δ−p−2); proposed target twist identical | Adjunction check passes; general source certification limited below. |
| §9.5 boundary labels | Gₘ²⊂P¹×P¹ | Four boundary components, with crossings at four corners | Labels are not collapsed into two factors. |
| §9.5 Cartier separation | 2[0],3[0] | F=2[0]; residuals 0,[0]; both difference-identity sides 3[0] | Residual multiplicity retained. |
| §9.6 companion positive branch | Mark b=3, residual order c=2 | Complementary mark b−c=1; companion includes (N,2)+(M,1) | No zero or negative mark. |
| §9.6 companion other branch | b=2,c=3 | Companion (N,3); no monomial mark b−c=−1 | Guarded branch retained. |
| §9.7 resolved pair | y=x², boundary x=0 | At origin tangent covectors dy,dx independent; restricted boundary (x) reduced | Point preserved. |
| §9.7 unresolved pair | y=x², boundary y=0 | Restricted equation x²; intersection multiplicity 2 | Cleanup may modify origin. |
| §9.7 excluded component | X=(x=0), E=(x=0) | Restricted boundary equation 0, not a Cartier equation | Exclusion retained. |
| §9.10 log differential | A¹, D=(x), characteristic p | d(x)=x dlog x≠0; d(xᵖ)=p xᵖdlog x=0 | Base-linear, not O-linear. |
| §9.10 residue convention | Crossing xy=0 | resₓ(dlog x∧dlog y)=dlog y; reverse order gives −dlog y | Two-form sign fixed. |
| §9.10 absolute-only SNC | k=ℚ[t], X=Spec k over itself, D=(t) | Ω¹log=k/(t); I_DΩ¹log=0; Ω¹log⊗I_D=k/(t) | Relative-SNC hypothesis excludes false tensor comparison. |
| §9.10 singular base | k=ℚ[u,v]/(v²−u³), X=A¹ₖ | Local dimension 2; embedding dimension 3 | Regular-base condition is not redundant. |
| §9.10 compact tensor comparison | A¹, B=(x) | I_BΩ¹log free on x dlog x=dx; Ω¹log⊗O(−B) same rank-one module | Correct under relative charts. |
| §9.10 compact Frobenius quotient | p=2, B=(x) | Quotient complex k·x→k·x dlog x has differential 1 | Acyclic but not zero termwise. |
| §9.10 compact Frobenius quotient | p=3 | Basis x,x² gives differential diagonal (1,2), invertible | Small-characteristic check passes. |
| §9.10 compact splitting labels | P¹ with one point B | Degree pieces O(−1),Ω¹; sole Hodge group H¹Ω¹=k | Twisted label gives total degree 2. |
| §9.10 untwisted splitting labels | Same point as A, B empty | Degree pieces O,O(−1); sole Hodge group H⁰O=k | Total degree 0 differs from compact case. |
| §9.10 cyclic-cover eigensummand | z²=x³, i=1 | Floor(3/2)=1; normalized generator z/x; residue 1/2 | Floor sign and fractional residue agree. |
| §9.10 adjoint vanishing | P¹, L=O(m), m>0 | ω⊗L=O(m−2); h¹=0 | At m=0, h¹(O(−2))=1, so positivity matters. |
| §9.10 multiplier ideal | (x²), c=1/2 and 1/3 | Floor(2c)=1 and 0; ideals (x) and O | Floor applied after multiplying multiplicity. |
| §9.10 crossing multiplier | (xy), c=1 | Ideal (xy), not O or (x,y) | Both components retained. |
| §9.10 canonical sheaf distinction | Normal cone over an elliptic curve | GR sheaf is properly contained in dualizing sheaf; nonrational exceptional contribution is nonzero | README correctly avoids the source's blanket identification. |
| §9.10 mixed intersection | P², L=H, nef divisor aH | H'²=a²; (H'·L)²/L²=a² | Equality and denominator L²=1 checked. |
| §9.11 numerical very ampleness | P¹,L=O(1), v=1,w=−2 | m=1 gives mv=1=w+3; h⁰=2=mv+1 | Degree-one projective line retained. |
| §9.11 dimension zero | Geometrically integral point | Exponent 1; h⁰=1; degree 1 | Explicit separate boundary, not a Lean padding theorem. |
| §9.11 polarized boundedness | Abelian surface with principal polarization | L²=2,K·L=0; power m has degree 2m² | Bound depends on the fixed numerical data, not a selected Hilbert polynomial. |

## Not verifiable

- **Full Bierstone–Milman 1997 locators (ref06).** The service found the legal arXiv excerpt `alg-geom/9508005v2`, containing Chapter I, not the full published article. Consequently the sampled §9.4/§9.7 claims at published pp.290–298, tower (6.7), and later proof steps were not verified against those pages. DOI/publisher lookup and a search for a legal full author/institutional copy did not provide one. The named supplier exports were read, and the explicit examples were computed; neither replaces the missing source check.
- **Bierstone–Milman 1989 (ref05).** The DOI lookup failed; the explicit AMS PDF URL returned an HTML journal page rather than the article text. A service “certified” transport status for that response is not certification of the theorem. Its theorem locators remain unread.
- **Chow–van der Waerden (ref18).** The GDZ item was fetched, but the needed printed pages are image-only and the service extraction does not provide readable theorem text. OCR is unavailable. Satz 1, pp.695–697, remains uncertified here; Grothendieck's later boundedness citation was readable.
- **Atiyah–Macdonald (ref91).** The service found no legal text for Chapter 11, Theorem 11.1, p.117. The Hilbert–Serre signature and its mathematical boundary cases were checked independently; the precise textbook page was not.
- **Settled paywalled locators.** ref10 (Bresciani), ref29 (Groechenig–Wyss–Ziegler, mirror-symmetry paper), and ref92 (Hartshorne, Chapter I, Theorem 7.7) resolved as `uncertified`. They are recorded as source-access limits, not requests to bypass a paywall and not new missing-text requests.
- The independent-universe sheafification assumptions in §4.18a were checked as explicit assumptions and against the matched-universe instance described by the roadmap, not by elaborating the README's proposed 1,000-line carrier-signature catalogue. Only Suggested.lean, its expanded signatures, the padding probes and the native dévissage probe were elaborated. No claim is made that every proposed README Lean signature already compiles.
- No newer-than-pin API in the future Tau Ceti paragraph was used as evidence; R04 removes that paragraph's role as an exact supplier contract. The review does not certify unseen work in open pull requests without an allowed checkout.

The missing-text records are consolidated for the worker. This review is finished with findings and a verdict; it is not suspended awaiting those texts.

## Source issues

- **Error** in ref14 at Lemmas 30.12.6 and 30.12.8 (01YI, 01YM), printed pp.31–33: the source says the dévissage implications suffice without separately requiring the zero sheaf; it should be require P(0), or exclude the empty scheme; affects a stated result.
- **Error** in ref37 at proof of Theorem 6.5, printed p.30: the source says a relatively very ample bundle has globally generated pushforward after a positive power; it should be use relative evaluation generation, since identity P¹ with O(−1) disproves global generation; affects the proof.
- **Misprint** in ref27 at proof of Proposition 5.17, printed p.62: the source says the standard basis of ℤⁿ ends at e_(n−1); it should be end at e_n; affects the proof.
- **Misprint** in ref39 at proof of Lemma 31.3, printed p.122: the source says the torsor-Isom map is invertible by Lemma 31.3 itself; it should be cite the elementary equivariant-map-between-torsors fact; affects the proof.
- **Misprint** in ref89 at Lemma 75.26.6 (0D21), clauses (4)(b)–(c), printed p.65: the source says H⁰ controls the lowest-degree rank stratum for arbitrary amplitude [a,b]; it should be Hᵃ in both clauses; affects a stated result.
- **Misprint** in ref19 at proof of Theorem 2.4(a), printed p.10: the source says H⁰ vanishes for q≥1; it should be Hᵠ vanishes for q≥1; affects the proof.
- **Error** in ref19 at the paragraph before Theorem 3.1, printed p.11: the source says the pushforward of a resolution's canonical sheaf is always the usual dualizing sheaf; it should be distinguish the Grauert–Riemenschneider sheaf, which may be smaller for nonrational singularities; affects a stated result.
- **Misprint** in ref19 at proof of Theorem 4.7, printed p.15: the source says L^(p−1) intersected with a p-dimensional component is a positive numerical degree; it should be L^p intersected with that component; affects the proof.
