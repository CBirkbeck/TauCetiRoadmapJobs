# Port report: GlobalShtukasAndFunctionFieldLanglands

- Branch: `roadmap/global-shtukas-and-function-field-langlands`.
- Head commit: `86a87460edab792f79aa8b0274b523303e0a523d`.
- Starting revision: `ae2562c`; the starting worktree was clean.
- Committed files: `TauCetiRoadmap/GlobalShtukasAndFunctionFieldLanglands/README.md`, `TauCetiRoadmap/GlobalShtukasAndFunctionFieldLanglands/Suggested.lean`, and `TauCetiRoadmap/GlobalShtukasAndFunctionFieldLanglands/metadata.toml`.
- No push, pull-request write, issue write or comment was made.

## Validation

The final targeted build exited 0:

```text
✔ [8976/8976] Built TauCetiRoadmap.GlobalShtukasAndFunctionFieldLanglands.Suggested (2.2s)
Build completed successfully (8976 jobs).
```

Warning count: **0**. There are no admitted declarations, so there are no `sorry` warnings either. This checks elaboration of the delivered module, not proofs of the README targets.

Final push-gate summary:

```text
gate GlobalShtukasAndFunctionFieldLanglands: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```

The gate requires a clean worktree: its pre-commit run had every content counter at zero and failed only on the three staged target files (`dirty=3`). The final run was therefore made on the committed tree. The outside-folder counter is zero. `git diff --check` passed.

The requested movable dependency-direction check exited 0 and printed exactly:

```text
depcheck: 39 roadmaps, 405 edges, 0 problem(s)
```

It printed no UPWARD, CYCLE or moved line. No merge-order file or tooling was changed.

The citation resolver found no unresolved cross-roadmap citations and no unresolved Lean names against main at `ae2562c` and the 342-head roadmap index dated 2026-10-24T23:09:21Z. Its pinned-Lake search was unavailable on the indexing host, so the actual pinned sources in this worktree were searched independently; this limitation was not treated as evidence that a declaration was missing.

## Draft pull request body

Develops the equal-characteristic library of bundles, Hecke stacks, geometric Satake and global G-shtukas needed for the function-field Langlands parameterization for connected reductive groups. It builds rational, integral and torsion cohomology, Frobenius descent and excursion operators, proves the global cuspidal decomposition, and connects it to companions on curves and local parameters at every place, including the GL_r comparison with monodromy and local gamma factors. The global GL_r correspondence is consumed from AutomorphicLFunctionsAndLocalFactors rather than planned again.

## Suppliers still in pull requests

These are the supplier roadmaps in the exact contracts whose folders are absent from main; their cited sections were checked at their open heads:

- AlgebraicModuliForArithmeticGeometry
- ArithmeticGaloisDuality
- AutomorphicLFunctionsAndLocalFactors
- ClassicalAdicEtaleCohomology
- DeligneWeightsAndPurity
- EndoscopicTransferAndUnitaryTraceComparison
- EtaleDualityAndPerverseSheaves
- FunctionFieldArithmetic
- IntegralHeckeAndGaloisDeterminants
- LanglandsParameterStacks
- LefschetzPencilsAndVanishingCycles
- MotivesAndAlgebraicCycles
- ReductiveGroupsPartII
- RelativeFarguesFontaine
- SmoothRepresentationsOfLocalGroups

AlgebraicCurves, AlgebraicVectorBundles, EtaleCohomologyFoundations, JacobianChallenge, ReductiveGroups and SchemeAndStackFoundations were checked on main. Scope-only comparisons and downstream consumers are not supplier contracts.

## Port and acceptance-test shape

Read the repository README and CONTRIBUTING before editing, and compared the forms of RepresentationTheory, FinancialMathematics and Completed/UniversalCovers. The parent-relative instruction links were absent in the worktree layout; the normative repository-root files were used. Read the accepted package, its review and its fixing reports as evidence, and retained the accepted mathematical corrections, including the seven source corrections.

The README contains 92 substantive target subsections in Layers 0–7. The package's 93rd subsection was the duplicate unramified local comparison, described below. Definition APIs are prose lists, and every definition retains at least three discriminating Checks. Added or expanded APIs cover elliptic chains, integral Satake, determinant lines, central-lattice transitions, Frobenius–Hecke operations and local gamma factors. The opening Summary, exact hypotheses, source locators, worked examples and per-layer dependencies are retained. Metadata follows the main-branch form, `topic = "math.NT"`.

**Moved from Lean to README:** nothing. The delivered package's `Suggested.lean` already contained no declarations. It remains an acceptance-test module with one `import Mathlib`, the prescribed namespace and one module docstring. The docstring names the missing actual carriers for each headline, including the extra volume and elliptic-sheaf targets made explicit during the port. No weak scalar substitutes, API padding, admitted data or artificial conditions were introduced. The Tau Ceti representation categories are acknowledged as present; their geometric Satake counterpart is missing.

**Elaborated-signature audit:** mechanical enumeration found zero declarations in the module. Consequently the requested family of `#check @name` commands is empty; no declaration binder can disappear and no binder change was made. The targeted build elaborates the entire delivered module. Library declarations mentioned in the docstring and contracts were checked directly at the pins, rather than presented as this roadmap's declarations.

## Supplier repairs and ownership

The object sweep used the required roadmap list, grep and show commands over main and open heads, the supplied sibling checkouts, and the board packages. It searched bundles and HN filtrations, multi-leg Grassmannians, classical/integral/arithmetic Satake, stack coefficients, elliptic chains, Drinfeld descent, excursions and pseudocharacters, Bernstein centres, SL_r volumes, companions and the local GL_r correspondence. The final sweep was repeated after the substantive edits. Open work was checked; this is not an unchecked-open-pull-request submission. Existing-roadmap progress branches were not used as replacement suppliers.

- **Global GL_r theory:** keep AutomorphicLFunctionsAndLocalFactors §AL.3 as the sole owner of its two-leg proof, vector-bundle HN/boundedness, essential cohomology, rank induction, reciprocity, converse/multiplicity results and all-place pair factors. The retained targets concern general G, moving legs, other coefficient systems, companions or the local comparison; Scope and ownership says how they differ.
- **Automorphic arithmetic:** FunctionFieldArithmetic §§6.1–6.4 supplies the general-group automorphic modules, constant terms and Harder finiteness theorem, including nonsplit groups and arbitrary level. ArithmeticGaloisDuality §R02.3.2 supplies `GlobalFunctionField.classFormation`; the worker's unresolved-name lead was a planned declaration in that exact section, not a claim about pinned Tau Ceti. Rank-one Lang fibres here use the Picard gerbe supplied by SchemeAndStackFoundations §3.7 and the Jacobian/Picard theory of JacobianChallenge.
- **Coefficient theory:** DeligneWeightsAndPurity §8.24 owns rational finite-type Deligne–Mumford stack cohomology. Section 1.4 keeps its extension to the finite-type Artin stacks and integral/torsion comparisons needed here. ClassicalAdicEtaleCohomology §5.4 supplies general oriented products and the complex-dependent modification theorem. Neutral Tannakian reconstruction is imported from MotivesAndAlgebraicCycles §§6.1–6.2; only its Satake-specific hypotheses and identification are targets here.
- **Excursion algebra:** LanglandsParameterStacks §§LP2e.9–LP2e.14 and LP2c.1–LP2c.4 own universal excursion relations and reconstruction. This roadmap realizes their action geometrically and proves its global continuity. IntegralHeckeAndGaloisDeterminants supplies the determinant prefix; finite-dimensional algebra remains in Mathlib.
- **Section 0.13:** the package requested a function-field SL_r volume theorem from AdelicAlgebraicGroups, whose cited measure/reduction theory does not supply that theorem. This roadmap now owns the theorem and its gauge comparison, with an independent Harder residue route before deriving bundle masses. The number-field Tamagawa infrastructure is not treated as a function-field proof.
- **Section 2.7:** the package requested an elliptic-sheaf carrier from AlgebraicModuliForArithmeticGeometry, whose generic coherent-moduli section does not supply periodic Frobenius chains. This roadmap owns that carrier, its descent/API and comparison, with its degree-dependent period. DrinfeldModulesAndTModules is a downstream consumer, not an input.
- **Section 7.6:** compatible completed Hecke corners from SmoothRepresentationsOfLocalGroups do not prove that restricted-shtuka excursion elements belong to the ordinary smooth centre. The specific uniform support theorem and completed/ordinary comparison are targets here. The generic centre and corner interface remain in SmoothRepresentationsOfLocalGroups. The geometric steps sketched but not detailed in GeL Remark 6.3 are explicit proof obligations here, not assertions about a supplier.
- **Section 7.11:** SmoothRepresentationsOfLocalGroups §SR.5.2 supplies shared Weil–Deligne carriers and operations; its p-adic local correspondence does not supply the equal-characteristic correspondence. The latter, including segments, all pair factors and nonintegral twists, is a target here, obtained from the already supplied global GL_r theorem. HeckeStacksAndLocalShtukas remains a later geometric realization, with no reverse dependency.
- **Satake boundary:** GeometricSatakeAndFusion concerns the B_dR Grassmannian. SheafTheoreticSmithTheory §§ST.3 and ST.6 concerns the wider F̄_ℓ/W(F̄_ℓ) coefficient setting, arbitrary separably closed geometry and Smith/parity/constant-term comparisons. Section 1.14 retains the accepted O_E and finite-torsion coefficient functors over the finite-field curve, without consuming that later roadmap. This boundary is explicit in Scope and ownership.
- **Exact duplication removed:** package §7.1 repeated the unramified local Satake comparison of §§5.9–5.10. Its subsection and restatement were deleted; §7.5 consumes §§5.9–5.10 directly. This removal is recorded only in Scope and ownership in the roadmap. There were no Lean declarations to remove or collide with supplier namespaces.

## Mathematical fixes from the upstream reread

These include corrections to port-draft wording as well as repairs of package contracts; they do not reinterpret the accepted deep theorems.

1. State n≥1 and torsion exponent s≥1, finite-field q≥2 and the universe convention explicitly. O_E/λ⁰ is the zero ring, and the mass denominator vanishes at q=1, so neither is silently allowed.
2. Pin arithmetic/geometric Frobenius with χ(ϖ)=2 at ℓ=5: geometric values 2 and 4 in degrees 1 and 2, arithmetic values 1/2 and 1/4. Pin the GL₂ odd-orbit sign at q=3 with IC trace −1/√3 and normalized spherical value +1/√3.
3. Restrict lattice comparison to finite-index subgroups of one chosen central lattice. Arbitrary degree lattices can differ by non-torsion compact-unit twists; commensurability of all such lattices is not asserted.
4. Separate the SL_r volume theorem from the bundle-mass deduction. In a fixed determinant fibre, count q−1 determinant trivializations before quotienting by Aut(E); do not assume det:Aut(E)→k× is surjective. For E=O² over F₃, this gives 2/48=1/24, the SL₂ stabilizer mass. On P¹/F₃, total bundle mass is 1/32, volume-one SL₂ volume is 1/16, and its Tamagawa multiplier is 16.
5. Include the full coherent-sheaf mass formula and the plethystic, rather than ordinary-exponential, torsion series. On P¹/F₂, the degree-two torsion coefficient is 2+3+1/3=16/3; 9/2 would be the wrong ordinary exponential. The draft's initial degree-two count was recomputed and corrected.
6. Specify actual elliptic-chain data, commuting j/t squares, quotient lines, base change, marking, levels and period n·deg(∞). At degree-two infinity a period n changes degree by n, whereas tensor O(∞) changes it by 2n; the required period is 2n. Preserve the component deg E₀=n(g−1)+1.
7. Correct the Layer 3 dependency description: the Eichler–Shimura proof does not need to be derived from the preceding Hecke identification. Each target retains its actual inputs.
8. Define the constructible Serre class in Ind(Perv) as the essential image of Perv, and an mc-isomorphism by its kernel and cokernel in that image. A countably infinite direct sum has constructible finite partial sums but is not constructible. State its Serre/localization proof as a target; Mathlib's `isoModSerre` only defines a morphism property.
9. Correct the native Galois-category contract from a chosen fibre functor to existence of one, keeping the choice of functor and geometric basepoint explicit.
10. State the ordinary-centre support theorem on the integral reductions of one fixed invariant, uniformly in s, and rationalize only after taking the integral limit. Each `(O_E/λ^s)⊗E` is zero. A function with coefficients λ^j at cosets ϖ^j has finite support modulo every λ^s but infinite integral support. Section 7.7's completed-action proof is independent of the stronger support theorem of §7.6; the contradictory claim that the stronger theorem is not asserted was replaced.
11. Keep nonintegral Weil characters and monodromy in the GL_r target. A Frobenius eigenvalue λ⁻¹ has powers of valuation −n and need not extend to the profinite Galois group. Steinberg and the trivial GL₂ representation share the semisimple Weil part but have monodromy ranks 1 and 0.
12. Add the explicit gamma-factor cancellation witness: for geometric Frobenius diag(a,b), a=b/q, N=E₁₂ and T=q^(−s), the epsilon correction −bT and L-ratio correction −1/(bT) multiply to 1 as rational functions. Also retain the trivial-line zero at s=0 and the additive-character multiplier q^(1/2−s). Specify that the L-group representation is algebraic.
13. Repair the Laurent Lafforgue author-copy URL, link Deligne's legal author-hosted IAS copy, and extend the Deligne Lemmas 4.12–4.16 page range to 544–546. Repair the malformed inline code around the rank-one example and remove TeX residue. No mathematical content was removed for formatting.

## Pin and source checks

Mathlib is pinned at `6b7abb3c7686292736be2955bd3eb9ebf63b456a`; Tau Ceti is pinned at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Neither manifest nor toolchain changed.

The native definitions were read, including their limits:

- `.lake/packages/mathlib/Mathlib/AlgebraicGeometry/Scheme.lean` line 40 begins `structure Scheme extends LocallyRingedSpace where` with a local-affine condition; it does not assume separatedness, smoothness, finite type or a point.
- `.lake/packages/mathlib/Mathlib/CategoryTheory/Sites/Descent/DescentData.lean` line 59 gives descent objects, maps and coherence; `.lake/packages/mathlib/Mathlib/CategoryTheory/Sites/Descent/IsStack.lean` line 49 adds effective descent to a prestack, not an atlas or an algebraic diagonal.
- `.lake/packages/mathlib/Mathlib/CategoryTheory/Galois/Basic.lean` line 414 has `hasFiberFunctor (C) : ∃ F : C ⥤ FintypeCat.{u₂}, PreGaloisCategory.FiberFunctor F`. A functor is chosen separately at line 417.
- `.lake/packages/mathlib/Mathlib/CategoryTheory/Limits/Indization/Category.lean` line 70 defines Ind; `.lake/packages/mathlib/Mathlib/CategoryTheory/Abelian/SerreClass/Basic.lean` line 45 defines the Serre-class predicate. `.lake/packages/mathlib/Mathlib/CategoryTheory/Abelian/SerreClass/MorphismProperty.lean` line 65 defines `isoModSerre` as `P.monoModSerre ⊓ P.epiModSerre`, with no quotient theorem asserted by that definition.
- `.lake/packages/TauCeti/TauCeti/Algebra/AlgebraicGroup/Representation/Comodule/Equivalence.lean` line 195 defines the property with body `fun V ↦ Module.Finite R V`; line 216 defines its full subcategory `FGPointRepresentationCat`; line 231 gives the comodule equivalence. This supplies the finite representation side of Satake, not the perverse-sheaf side.

The remaining linear-algebra suppliers were located at the pin: ExteriorAlgebra in `Mathlib/LinearAlgebra/ExteriorAlgebra/Basic.lean` line 60; charpoly and Cayley–Hamilton in `Mathlib/LinearAlgebra/Charpoly/Basic.lean` lines 44 and 89 (finite free modules); Submodule.FG and Module.Finite in `Mathlib/RingTheory/Finiteness/Defs.lean` lines 46 and 121; Algebra.adjoin in `Mathlib/Algebra/Algebra/Subalgebra/Lattice.lean` line 32; generalized eigenspaces in `Mathlib/LinearAlgebra/Eigenspace/Basic.lean` line 71; spanning over an algebraically closed field with finite-dimensional carrier in `Mathlib/LinearAlgebra/Eigenspace/Triangularizable.lean` line 74; simultaneous spanning of commuting operators in `Mathlib/LinearAlgebra/Eigenspace/Pi.lean` line 194. Their finite-dimensional/free/commuting hypotheses are retained. Object searches of both pinned libraries found no actual Satake sheaf categories, shtuka moduli/cohomology, fixed-level automorphic cusp carrier or smooth-admissible local category that would make a missing headline statable.

Source checks used the accepted package's certified texts, with new legal sources for the absorbed contracts. The particularly consequential locators are:

| Source locator | What was verified |
|---|---|
| Harder line 1771; Harder line 1892; Harder line 1989; Harder line 1991 | Scalar products and the residual projection precede the local gauge calculation and Tamagawa-one conclusion; the SL_r route need not assume the mass it is used to prove. |
| Sp line 1541; Sp line 1592; Sp line 4040; Sp line 4102; Sp line 4110 | Elliptic-sheaf data, the matrix-order/ordinary-chain comparison, degree-dependent periodicity and the elliptic-sheaf comparison. |
| YZ line 2287 | Definition 3.32 uses the essential image of Perv for both kernel and cokernel. |
| GeL line 229; GeL line 308; GeL line 1468; GeL line 1488; GeL line 1499 | Ordinary-centre assertions require the separate uniform-in-s support argument; the Demazure/normalization/torsion steps in Remark 6.3 are not fully detailed there and remain targets here. |
| LL line 11292; LL line 11314; LL line 11350; LL line 11396; LL line 11409 | Equal-characteristic supercuspidal correspondence, its surjectivity argument, local characterization, extension by segments and ramified global compatibility. |
| MV line 805; MV line 872; MV line 996; MV line 1292; MV line 1370 | Symmetry correction, tensor fibre functor, reconstruction and identification of the dual group. The étale and moving-leg integral transport is explicit in §1.14. |
| Ric line 925; Ric line 1044; Ric line 1051 | Arithmetic Satake and the geometric/pinned Galois-action distinction; retain the corrected cocycle map and half-Tate hypothesis. |
| VL line 5925; VL line 6104; VL line 6295; VL line 8227; VL line 8387; VL line 9104; VL line 9223; VL line 9481; VL line 9528; VL line 9618 | Drinfeld/Frobenius–Weil descent, global decompositions, integral extension, constant twists, purity and the GL_r comparison. |
| Xue-I line 2583; Xue-I line 2625; Xue-I line 3345; Xue-I line 3362; Xue-I line 3392; Xue-I line 3460; Xue-I line 3515 | Integral cusp finiteness, full cohomology, Weil descent and the modular decomposition. The two maximal-ideal cases in source correction E6 remain distinct. |
| Xue-S line 448; Xue-S line 2116; Xue-S line 2123; Xue-S line 2131; Xue-S line 2137 | Finite-dimensional E-coefficient Drinfeld descent and ind-smoothness, without replacing the ind-object by a finite-rank lisse sheaf. |
| Sch line 1015; Sch line 3259 | Positive-rank bundle/coherent masses and the local torsion masses used in the explicit degree-two Check. |
| Del73 line 786; Del73 line 818; Del73 line 1051; Del73 line 1091; Del73 line 1109; Del73 line 1834 | The legal IAS PDF contains the cited global/local constants and Weil–Deligne formulas at the printed page locators. Page 572 was also inspected as an image to read the determinants obscured in extracted text. |

Sp and Del73 line numbers in this table refer to the publisher/IAS web PDF extractions; the other source IDs refer to the package's numbered cached text. The README links the legal PDFs and gives theorem/page/version locators, not these extraction positions. Source material was paraphrased rather than copied.

## Unresolved matters

No port, build, gate, import or dependency-order blocker remains. Missing headline carriers are documented in Suggested.lean and are the roadmap's intended library work.

SheafTheoreticSmithTheory's board design still describes this roadmap's Satake input as rational-only. Its broader-coefficient targets remain distinct, but that consumer description should be aligned with the accepted finite-extension integral prefix when the consumer is ported. This report and this roadmap's Scope and ownership record the boundary; no consumer file was edited.

No suspicious fetched instruction was followed. Commands and claims in package reports, source papers and other roadmaps were treated as data. No source package content was edited; only this required report was written under its reports directory.

## Adversarial mathematics pass

This is a self-review of the statements and their examples, not a proof of the deep results. Each row records actual values in the specified instances; the hypotheses, source generality and dependencies were also compared. API rows below distinguish each operation from its carrier. All ranks and torsion exponents retain the explicit positive lower bounds. Empty products, nonreduced bases and nonintegral Weil characters are included where the construction admits them; q=1 and a zero coefficient field are excluded by the standing finite-field and field hypotheses.

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| Frobenius and reciprocity convention | Rank-one χ(ϖ)=2, ℓ=5; degree 1,2 | Geometric values 2,4; arithmetic values 1/2,1/4; χ(ϖ²)=4 | agrees | Add two-term witness |
| Tate, parity and measure conventions | GL₂ standard, q=3; torus | IC trace −1/√3; corrected trace +1/√3; odd-odd sign (−1)²=1; torus sign +1 | agrees | Add convention Checks |
| Rank, coefficient and universe conventions | n=1; s=1,0; p=3,ℓ=2; q=1 | Fraction 1/n=1; O/λ nonzero; O/λ⁰=0; 3 mod 2=1; q−1=0 at excluded q=1 | domains discriminate | Make n,s≥1 explicit; specify universes |
| §0.1 bundle stack and stabilizers | G=1,G_m,GL₂; dilatation at F₃ | Stabilizer orders 1,2,48; dilatation with marked fibre has order 1; O(m)⊕O(−m) has instability 2m | agrees; coarse points lose inertia | Preserve general smooth models |
| §0.2 deformation groups and dimension | G_m on P¹ and genus-one X; square-zero base | (h⁰,h¹,h²)=(1,0,0),(1,1,0); h¹−h⁰=−1,0=(g−1)dim G | agrees | None |
| §0.3 full level | N=∅,v,2v; G_m/F₃ | Change groups have 1,2,6 rational elements; reduction from 2v to v has kernel {1+aπ}, order 3 | reduction loses three choices | None |
| §0.4 Iwahori and fractional twists | n=1,2; degree-two flag point | Two half rotations give tensor O(x); PGL₂ square=Id; two split flag factors have total dimension 2 | agrees | None |
| §0.5 coherent HN, Euler and G-reduction | O(2)⊕O(−1), skyscraper, zero | Slopes 2,−1; torsion slope ∞, class (0,d); zero HN type empty; χ(O,O(1))=2, χ(O(1),O)=0 | agrees | None |
| §0.5 numerical totalization and hereditary assertion | P¹, genus g; pairs (0,0),(0,3),(2,1) | Numerical slopes ∞,∞,1/2; χ(O,O)=1−g; Ext²(O,O)=0 | totalization differs from zero-sheaf slope | None |
| §0.6 bounded loci and cofinality | G_m via diag(t,t⁻¹); GL₂; PGL₂ Ad versus 2Ad | Bounds retain exactly −b≤d≤b; adjoint slopes (2,0,−2) reject b=1, accept b=2; doubled slopes have same cutoff 2a≤b | agrees; polygons differ | None |
| §0.7 adelic groupoids and local triviality | G_m; smooth connected G_a; constant C₂ | Rational stabilizer F₃× has order 2 on both sides; H¹(F₃,G_a)=0; H¹(F₃,C₂) has 2 classes | connected-fibre hypothesis necessary | None |
| §0.8 shifted HN | T=(c,c); O(1)⊕O(−1),T=(1,−1); block (1,3] | Both slopes shift by −c; inequality 1−1=0≤0; (4−2−0)/2=1 versus wrong −1/2 | agrees | None |
| §0.9 parabolic instability | Trivial rank two with opposite flags at 0,∞ | Instabilities for D=∅,{0},{∞},{0,∞} are 0,1,1,0; zero minimum has 2 minimizers | positive-minimum restriction essential | None |
| §0.10 lattice, central twisting and quotient | GL₂, generator degree d=1,2; G semisimple | Bundle-degree increments 2,4; residual sizes 2,4; central-degree rank 0 gives Ξ={1} | agrees | Restrict comparison API to finite-index subgroups of one lattice |
| §0.10 saturation and degree injectivity | G_m on P¹, deg generator=1 or 0 | Saturation of {−b,…,b} has all Z degrees; quotient has 1 degree; degree-zero generator leaves infinitely many degrees | agrees | None |
| §0.11 orbit mass versus kernel | Aut of order 1,2,48 | Products 1·1=1, (1/2)·2=1, (1/48)·48=1 | weighted volume and class count differ | None |
| §0.12 nonsplit descent and Hecke components | Unramified norm-one torus; trivial modification | Frobenius acts as −1 on Z; its square acts +1; modification has generic torsor increment 0 | descent retains form and component | None |
| §0.13 bundle and SL volumes | P¹/F₃,r=1,2; r=0 excluded | Bundle masses 1/2,1/32; SL₁,SL₂ volumes 1,1/16; SL₂ gauge multiplier 16 gives 1 | agrees | Own independent volume target with Harder residue route |
| §0.13 determinant fibre | E=O²/F₃; general automorphism group | (q−1)/48=1/24=1/\|SL₂(F₃)\|; orbit sum of 2 trivializations divided by \|Aut E\| is 2/\|Aut E\| even without surjective determinant | agrees | Replace scalar-automorphism explanation by trivialization groupoid |
| §0.13 torsion and coherent products | P¹/F₂, torsion lengths 0,1,2 | Coefficients 1,3,16/3; length 2 gives 2+3+1/3=16/3; ordinary exp gives 9/2; extension weight at r=l=1 is 1/2 | discriminates plethystic series | Add computed Checks and explicit coherent formula |
| §0.14 cusp transport and lattice | G_m ray level {0,∞}/F₃; GL₂ upper Borel | Torus function rank 2 versus unlevelled 1; constant term of trivial-bundle delta on P¹ equals 1 at split B-reduction | finite support alone fails | None |
| §0.15 Picard gerbe and Lang fibres | P¹/F₃; elliptic X with J(F₃) of size h | Gerbe mass 1/2 versus coarse mass 1; Lang kernel sizes 1,h on Pic⁰; full Pic has infinitely many degree components | agrees | None |
| §1.1 BD Grassmannian | G_m; GL₂ weight (1,0); dual numbers | Geometric lattice exponents Z; GL₂ Schubert fibre P¹ dimension 1; 1+εt⁻¹ gives nontrivial infinitesimal G_m loop with trivial reduced exponent | constant Z functor fails on thickening | None |
| §1.2 Schubert support | G_m weights 1,−1; GL₂ weights (1,0),(2,0) | Torus collision weight 0; minuscule orbit dimension 1 closed; (2,0) closure includes (1,1) | agrees | None |
| §1.3 global Hecke chains | Empty chain; torus 1 then −1 | Empty endpoints equal; composed coweight 0=1+(−1), three-step addition (1−1)+2=2 | agrees | None |
| §1.4 stack coefficients and bounds | B G_m; B S₃; B C₂ sign | H^{2i}(BG_m) rank 1 for all i≥0; weighted S₃ count 1/6+1/2+1/3=1; sign H⁰ rank 0, constant rank 1 | bounded-category and forgotten-action models fail | Keep DM owner and comparison |
| §1.4 compact traces and six operations | B G_m/F₃; A¹; point | BG_m trace 1/3+1/9+…=1/2=count; RΓ_c(A¹)=E(−1)[−2] has trace 3; point trace 1 | agrees | None |
| §1.5 fusion smallness | Two GL₂ minuscule modifications, collision (1,1) | Fibre dimension 1, target-stratum codimension 2 locally: 2·1=2; global collision adds codimension 1, so 2<3 | local semismall, global small | None |
| §1.6 Iwahori minuscule geometry | n=2,r=1 chart ab=t; r=0 | Total chart dimension 2; fibres dimension 1; gradient (b,a)=(0,0) at node; empty-chain relative dimension 0 | flat fibre need not smooth | None |
| §1.7 Satake category | G=1,G_m,GL₂; arithmetic ±1 | Geometric ranks 1; delta_1∗delta_−1=delta_0; 2·2=3+1 for Std⊗Std; arithmetic ±1 distinct | convolution differs from point tensor | None |
| §1.8 symmetry and half twist | Two odd GL₂ IC objects; torus | Super swap −1 times correction −1 gives +1; torus correction +1; trace −q⁻¹ᐟ² times −1 is +q⁻¹ᐟ² | agrees | None |
| §1.9 geometric Satake and reconstruction | G=1,G_m,GL₂ | Hopf rings E,E[z,z⁻¹]; m(S⊗id)Δ(z)=z⁻¹z=1; standard fibre dimension 2=h⁰(P¹)+h²(P¹) | antipode and actual fibre fixed | None |
| §1.10 central loop action | GL₁ loop u∈O[[t]]× on lattice t^mO[[t]] | u·t^mO[[t]]=t^mO[[t]]; lattice exponent remains m; dual weight-m central character need not be 1 | distinguishes the two centres | None |
| §1.11 nonsplit arithmetic descent | Ĝ=SL₂,cycl=3; G=1; base R | Old map gives u(1/3) versus u(3); corrected products both u(1)c⁻¹; (1+ℓ)^n has unbounded order; characters of C₂ square to 1≠−1 | half Tate hypothesis essential | Preserve accepted correction |
| §1.12 spherical normalization | Split and norm-one G_m; GL₂/F₃ | Split algebra E[z,z⁻¹]; norm-one invariant lattice 0 gives E; minuscule value +1/√3 versus IC −1/√3 | split and twisted cases distinct | None |
| §1.13 determinant and opposition | N=0,1,2; basis scale a=2; char 2 | Lines R,Re₁,∧²R²; scale 2 versus inverse 1/2; swap −1=+1 in char 2; IH⁰,IH² signs +1,−1 | agrees | Express determinant API as prose |
| §1.14 integral Satake | Unit object O/λ; two copies; torus weights 1,2 | Tensor Tor₁=O/λ in degree −1, pH⁰=O/λ; λ-torsion rationalizes to 0; free weight convolution has weight 3 | truncation and torsion necessary | Express coefficient API as prose |
| §2.1 shtuka carrier | G_m weights (1,−1),(1); τ versus Frob_X | Sum degrees 0 gives balance; sum 1 forces 0=1, so empty; O(1) has degree 1 under τ versus q under Frob_X | agrees | None |
| §2.2 bounded DM geometry | No legs, G_m/F₃; full fibre level | Frobenius-fixed stabilizer has 2 rational elements and tangent dimension 0; marked fibre kills it, leaving 1 | depth and finite bound necessary | None |
| §2.3 local model shift | G=1; GL₂, one jet at one leg | Relative dimensions 0 and 1·dim GL₂=4; GL₂ minuscule quotient dimension 1−4=−3, giving source fibre dimension 1 | agrees | None |
| §2.4 fractional infinity | n=2,μ=−1,degree-two pole; empty modifications | Balance −1=2·(−1/2); standard parity r≡1 mod2 even though pole degree 2; D∞=0 demands signed sum 0 | agrees | None |
| §2.5 cohomology systems | GL₂/P¹,no legs,degree 0,bound 2m | Dimensions m+1=1,2,3 at m=0,1,2; colimit infinite; collision fibre P¹ has ranks (1,0,1), total 2 | finite bounds and proper comparison retained | None |
| §2.6 twisted zero-leg forms | Degree-two central algebra, invariants at two places | 1/2+1/2=0 in Q/Z; a single 1/2 sums to 1/2≠0 and is rejected; zero twist gives matrix algebra | Brauer condition necessary | None |
| §2.7 elliptic chains and comparison | n=1,2; d∞=1,2; g=0 | Period n d∞=1,2,2,4; corresponding degree increments equal those of tensor O(∞); n=2 normalized degree −1 becomes +1 after tensor O(1) | degree and marking discriminate | Own carrier, add Sp locator/API |
| §2.8 horocycle indices | r=0,2,1; N>max(2g−2,0) | Endpoint increments 0,0,1; free support dimensions 0,2; final rising tuple rejected | endpoint condition necessary | None |
| §2.9 partial Frobenius | Degree-two place; two blocks | One iterate interchanges the two residue embeddings; two return; commuting degrees (1,0)+(0,1)=(1,1) | agrees | None |
| §2.10 coalescence | Torus external weights 2,−1; three legs 2,−1,3 | Diagonal weight 1; triple coalescence gives 4 under either parenthesization | both coefficient factors retained | None |
| §2.11 Hecke action | G_m cosets π,π⁻¹; identity | δ₁∗δ₋₁=δ₀; inverse correspondence is adjoint δ₋₁; action coefficient at π⁰ equals 1 | agrees on stated away-from-support domain | None |
| §3.1 leg operations | V=E², coev/eval; scalar x=3 | Closed contraction trace Id=2; scaling gives 6; triangle on e₁ returns e₁ | vector/covector normalization retained | None |
| §3.2 integral Hecke finiteness | Multiplication ℓ⁻¹ versus unit u on E | ℓ⁻n has valuation −n; O·1 stable under u with all valuations 0; zero witness rank 0 | rational finite span insufficient | None |
| §3.3 horocycle direct images | (r,#I)=(2,2),(0,0) | d=1,0; [2r−2d](r−d)=[2](1),[0](0); support dimensions 2,0 | positive perverse shift confirmed | None |
| §3.4 ind-perverse cohomology | r=0; finite rank two and countable-rank spaces | Middle degree/twist 0,0; rank 2 is constructible and killed, countable rank is not, despite finite partial sums | ambiguous Serre class fixed | Specify essential image and kernel/cokernel criterion |
| §3.5 cuspidal cohomology | Torus; GL₂ trivial-bundle delta on P¹ | Empty kernel intersection is all H; nonzero Borel constant term has value 1, so delta excluded; integral kernel 0 rationalizes to 0 | no bare finite-support substitute | None |
| §3.6 Frobenius gives Hecke | Unit V; GL₂ standard, q=3,deg v=2 | Unit gives 1; q_v=9, normalized value +1/3 versus IC −1/3; two iterates return residue component | sign/degree match | None |
| §3.7 rational and integral recurrence | Rank 0,1,2 factors; eigenvalues 2,3; F₂ | Polynomial 1 for zero rank acting on zero carrier; degree 1 gives F−S=0; 6−5F+F² at F=2,3 gives 0,0; 2Id=0 but Id(1)=1 mod2 | factorial clearing invalid integrally | None |
| §3.8 no-leg cusp equality | G_m/P¹/F₃ level ∅ or {0,∞} | Function ranks 1,2 after degree quotient; each character has finite integral stable lattice | level retained | None |
| §3.9 PGL₂ boundary and mc-action | r=2,#I=2; high index N translated −1 | Boundary piece shift [2](1); N=N₀ high goes to N₀−1 outside restricted index set, so restriction is not group-stable | mc-action qualifier needed | None |
| §3.10 integral cusp finiteness | Torus,no legs; zero cohomology | Integral ranks 1,2 at the two levels above; zero rank 0; E itself has infinite O-rank, its O-lattice rank 1 | correct finite object is integral lattice | None |
| §3.11 Eisenstein decomposition | Pic(P¹)=Z with inversion; possible V=0 | E[z,z⁻¹]^ι=E[z+z⁻¹], dimension 1; V=0 has finite sector 0, while extra image factor still contains Eisenstein curve | algebra image includes second factor | None |
| §3.12 one-place Hecke finiteness | G_m, Laurent Hecke algebra A | Module A is generated by 1 over A; O-basis indexed by Z is infinite; A/λ² has torsion exponent 2 | distinguishes the finiteness claims | None |
| §3.13 finite-type core | (r,#Σ∞)=(0,0),(0,2),(2,2) | 0<0 false: unbounded; 0<2 true: finite type; 2<2 false: infinitely many high indices; all satisfy parity | strict inequality confirmed | None |
| §4.1 finite étale Drinfeld lemma | I=0,1,2; A²×A¹ constant quadratic cover | Empty product group trivial; one factor ordinary π₁; degree-two fibre has first transposition (12), second identity, total (12) | general factors retained | None |
| §4.2 integral lisse descent | O/λ with trivial action; one-leg lattice O | Fibres have size \|O/λ\| and rank 1; finite reductions O/λⁿ have size \|O/λ\|ⁿ, compatible projections | torsion and inverse limit included | None |
| §4.3 FWeil extension and rational descent | One/two variables; Frobenius λ⁻¹ | Degrees 1,(1,0),(0,1); total (1,1); λ⁻n valuation −n while geometric action is Id | rational descent needs no stable lattice | None |
| §4.4 fusion with Frobenius | Merge two torus legs, scalars 2,3 | Merged action 2·3=6; separate product also 6; swapping leg labels returns 3,2 | agrees | None |
| §4.5 finite envelopes | Rank-two recurrence roots 2,3, ℓ=5 | F²=5F−6; F³=19F−30; powers generated by 1,F over O; inverse F=(5−F)/6 integral since 6 unit | finite recurrence box obtained | None |
| §4.6 specialization isomorphism | Constant rank-two lisse envelope, zero map control | Specialization matrix Id₂ has rank 2 and zero kernel/cokernel; zero map has rank 0 and kernel dimension 2 | checks both injectivity and surjectivity | None |
| §4.7 product Galois action | Finite quotient C₂×C₂ on E² | Coordinate operators diag(−1,1),diag(1,−1) commute; each squares Id₂; entire image has 4 elements | continuous finite pieces | None |
| §4.8 cohomology functors | No legs G_m; diagonal V⊠V∨ for dim V=2 | Cusp dimension 1 at unlevelled P¹; V⊗V∨ dimension 4 versus 2 if a factor discarded; trivial added leg multiplies dimension by 1 | agrees | None |
| §4.9 equivariant coalescence | Nonabelian Γ=S₃; a=(12),b=(23) | Diagonal ab maps to (ab,ab); (a,a)(b,b) same; ab=(123), ba=(132) differ | diagonal is homomorphism; naive product Γ²→Γ is not | None |
| §4.10 naturality of leg maps | Unit coefficient and scalar Hecke action 2 | Composites 1·2=2·1=2; on created E², inserting diag(2,3) gives trace 5 versus identity trace 2 | cannot commute away inserted action | None |
| §4.11 choice independence | E², change basis diag(2,1), action diag(3,5) | Conjugated trace 8=3+5; evaluation/coevaluation comparisons cancel inverse 2 with 1/2 | endomorphism canonical | None |
| §4.12 full Weil descent | A=O[t], maximal ideals (λ,t),(λt−1) | First residue O/λ finite; second residue E, infinite as O-module; λ maps to 0 or a unit respectively | two branches essential | None |
| §4.13 ind-smoothness | Empty-leg GL₂/P¹ system; collision on constant G=1 | Truncation dimensions 1,2,3,…; colimit infinite; G=1 specialization ranks 1→1 across diagonal | ind-smooth is not finite-rank lisse | None |
| §5.1 global excursion | W=1, pairing 0,3; Std contraction | Endomorphisms 0,3Id; γ=1 gives trace Id₂=2; (Frob,1) gives trace diag(2,3)=5 | scalar and trace normalizations agree | None |
| §5.2 invariant-function indexing | SL₂ A=diag(2,1/2); zero covector; | f(A,1)=5/2, f(A,A)=2, wrong tr(A²)=17/4; zero covector gives 0 | relative inverse fixed | None |
| §5.2 regularity requirement | G_m² real point action | \|(−1)/1\|=1 versus algebraic ratio −1; at +1 both 1 | pointwise invariance does not imply regularity | None |
| §5.3 scalars and separation | Constant quadratic quotient; GL₂ trace | Frobenius at degree n is (−1)^n: odd −1, even +1; diag(2,3) has trace 5, determinant 6 | compatible-degree Chebotarev and GL traces discriminate | None |
| §5.4 excursions on full cohomology | Auxiliary I empty; retained torus J with action 2 | Pairing 3 acts 3Id on retained space; accidental retained action gives 6Id; trivial-bundle delta remains a domain vector despite constant term 1 | retained legs untouched | None |
| §5.5 excursion relations | Scalars x=2,y=3,z=5; S₃ a=(12),b=(23),c=1 | xy⁻¹z=10/3 versus reversed 15/2; ab⁻¹c=(123), ba=(132); unit f=1 gives Id | multiplication order fixed | None |
| §5.6 unramifiedness | G_m unramified character with Frob 2 | Inertia evaluation 1; excursion unchanged 2·1=2; degree-two value 4 | specified whole good open retained | None |
| §5.7 excursion algebra and primary blocks | Zero cusp space; Jordan J=[[1,1],[0,1]] | Zero algebra dimension 0; ker(J−1) dimension 1; ker(J−1)² dimension 2; two distinct diagonal characters give 1+1=2 | independence plus spanning required | None |
| §5.8 reconstruction and global continuity | Rank-one finite image C₂; GL₂ unipotent parameter | Character values ±1 give unique rank-one parameter; unipotent trace 2 and determinant 1 equal trivial's, closed representative Id₂ | reconstruct semisimplification, not arbitrary lift | None |
| §5.9 global cusp decomposition | P¹/F₃ G_m,ray level {0,∞}; zero module | Two characters ±1 give two one-dimensional blocks, total 2; zero module has no nonzero blocks | generalized versus scalar claims distinguished | Consolidate former §7.1 here |
| §5.10 nonsplit decomposition | Norm-one torus; ramified cover F₃(t)(√t) | Frobenius lattice action −1, inertia +1; quadratic extension has e=2 at 0,∞ and is rejected for U=P¹ | finite projection specified | None |
| §5.11 integral and modular blocks | C₂ ray classes, ℓ=2 | Regular swap J has (J−1)²=0 in F₂, nonzero J−1 of rank 1; two char-zero blocks coalesce to one rank-two generalized block | no modular scalar action asserted | None |
| §5.12 conditional eigensheaf comparison | G=1, unit eigensheaf and trace maps | Partial Frobenius Id commutes with trace Id; trace value 1; unique excursion scalar 1 places vector in sole block | tests stated conditional hypothesis | None |
| §5.13 multiplicity conjecture and no-leg consequence | Ĝ=1; Sσ=C₂ acting on sign versus trivial A | Unit W gives invariants dimensions 0 and 1; forgetting Sσ would give 1 in both | invariant factor essential; no conjecture used as premise | None |
| §6.1 twists, algebraicity, plainness | Rank-one scalar 1+ℓ; ℓ=3,p=2,scalar 5 | (1+ℓ)(1+ℓ)⁻¹=1; v₃(5)=0 but v₅(5)=1, so one ℓ-adic unit does not imply p-plain | agrees | Add explicit coefficient example in ledger |
| §6.2 companions and slopes | r=1,2; scalar q and normalized twist | Bounds 0,1/2; slopes of q,1 are 1,0; twisting rank-two by q translates [−1/2,1/2] to [1/2,3/2] | denominator deg(x)v(q)>0 | None |
| §6.3 GL_r excursion comparison | r=1; GL₂ hypothetical split parameter χ⊕χ⁻¹ | Rank one polynomial 1−αT; reducible rank-two polynomial 1−(α+α⁻¹)T+T²; det=1 and weight-zero roots agree with conclusion in irreducible range | split polynomial alone cannot assert cuspidal occurrence | None |
| §7.2 restricted shtukas | I=∅; G_m/F₃,level length 2; Frobenius divisor | No-leg classifying group order 6, stack mass 1/6; σ⁻¹(y=0) defined by y^q=0 has length q rather than 1; budget 1→0 | automorphisms and thickening retained | None |
| §7.3 higher-base nearby cycles | Empty I; two smooth curve factors; crossing union | Base dimensions 0,2; crossing ring k[x,y]/(xy) has 2 minimal primes, not 1 | irreducibility restriction necessary | None |
| §7.4 local nearby transport and composition | δ=1; d=(−1,2),m=(3,4) | Shifted tuple (2,6) nonnegative; d=(−4,0) yields (−1,4), rejected; identity transport matrix 1 | budget and order domains explicit | None |
| §7.5 local convolution | f=1; two-leg standard at q_v=9 | Identity coset value 1; spherical minuscule value +1/3; torsion scalar λ reduces to 0 at s=1 and remains λ at s=2 | normalizations and transitions agree | None |
| §7.6 local parameters and centre restriction | Frobenius unit versus λ⁻¹; support coefficients λ^j | Unit powers valuation 0 extend profinitely; λ⁻n valuation −n do not; torsion support 0≤j<s grows without bound | uniform-support theorem is extra target | Own ordinary-centre comparison |
| §7.7 integral local action | Function on cosets j≥0 with value λ^j; f=1 excursion | Mod λ^s support has s elements and infinite integral support, while f=1 has one support coset at every s and in the limit; both limits decay | uniform excursion support is stronger than decay | Separate §7.6 support theorem from completed-action proof |
| §7.8 semisimple local–global compatibility | GL₂ Steinberg and trivial representation | Semisimple eigenvalues q^1/2,q^−1/2 agree; monodromy ranks 1 and 0 differ | ordinary semisimplification only | None |
| §7.9 WD versus ordinary semisimplification | q=3,r(Frob_geom)=diag(3^−1/2,3^1/2),N=E₁₂ | rNr⁻¹=3⁻¹N; Frobenius semisimplification retains rank N=1, ordinary gives 0 | separates operations | None |
| §7.10 gamma factors | Trivial line,q=2; s=0; ψ→ψ(ϖ·); zero representation | γ(0)=0/(1−1/2)=0; multiplier 2^(1/2−s), two lines 2^(1−2s); zero gives L=ε=γ=1 | ratio and sign fixed | None |
| §7.10 cancellation of monodromy correction | Sp(2) with roots a,b, a=b/q; T=q^−s | Epsilon correction −bT; L-ratio correction (1−1/(bT))/(1−bT)=−1/(bT); product 1 in E(T) | exact cancellation | Add explicit two-term monodromy Check |
| §7.11 local GL_r bijection and global comparison | r=1; GL₂ Steinberg versus trivial; nonintegral character | Character and inverse Frobenius values α,α⁻¹; same semisimple roots but N ranks 1,0; λ⁻n valuation −n allowed as Weil parameter | includes monodromy and nonintegral twists | Own equal-characteristic correspondence and segment extension |
| §7.6 order of coefficient limits | O/λ^s at s=1,2 and its integral inverse limit | (O/λ^s)⊗_O E=0 for both s; (lim_s O/λ^s)⊗_O E=E | rationalization must follow the integral limit | State uniform support integrally, then extend to E |
| Native Galois and Serre contracts | Fibre functors F,F′; point spaces E² and E^(N) | An existential fibre-functor field supplies no selected F; kernel of E²→0 has rank 2, kernel of E^(N)→0 has infinite rank | existence differs from chosen data; morphism class differs from a quotient construction | Correct the supplier wording |

### Definition and operation API instances

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §0.1 API 1: The fppf stack of torsors on X×S. | Explicit instance below | G_m/F₃: one fixed-degree object has Aut order 2, coarse point has order 1 | agrees in this instance | None |
| §0.1 API 2: Pull back objects and arrows along S′→S with coherent composition. | Explicit instance below | Identity pullback on O: rank 1→1; two identities give the same identity 1 | agrees in this instance | None |
| §0.1 API 3: A smooth surjective atlas locally of finite type. | Explicit instance below | Picard stack genus 0: atlas point dimension 0 minus G_m dimension 1 gives −1 | agrees in this instance | None |
| §0.1 API 4: Represent the affine isomorphism sheaf, including all stabilizers. | Explicit instance below | Isom(O,O)(F₃)=F₃× has 2 elements; Isom(O,O(1)) is empty | agrees in this instance | None |
| §0.3 API 1: Bundle with a specified full trivialization on N. | Explicit instance below | G_m/F₃ at 2v: 2·3=6 trivializations | agrees in this instance | None |
| §0.3 API 2: Forget full level or restrict it to N′⊂N. | Explicit instance below | Restriction 2v→v: 6→2, each fibre size 3; empty level group size 1 | agrees in this instance | None |
| §0.3 API 3: Identify the change-of-trivialization group scheme. | Explicit instance below | Units mod π² act simply transitively on 6 trivializations, stabilizer size 1 | agrees in this instance | None |
| §0.4 API 1: The periodic lattice chain, its inclusions and quotient line bundles. | Explicit instance below | n=2: two successive quotient lengths 1+1=2, equal length E/E(−x) | agrees in this instance | None |
| §0.4 API 2: Add allowed fractional divisors, with twist(D+D′)≃twist(D)∘twist(D′). | Explicit instance below | Half twist twice has total twist 1; three half twists give 3/2 in both orders | agrees in this instance | None |
| §0.4 API 3: Quotient simultaneous tensoring by a line bundle. | Explicit instance below | O² and O(1)² have degrees 0,2 and the same PGL₂ bundle | agrees in this instance | None |
| §0.4 API 4: On the PGL_n quotient, n rotations at x are the identity. | Explicit instance below | Two rotations add O(x), killed in PGL₂; involution squared is Id | agrees in this instance | None |
| §0.5 API 1: Ordered ranks and degrees, or canonical parabolic/coweight data for G. | Explicit instance below | O(2)⊕O(−1): ordered classes (1,2),(1,−1), total (2,1) | agrees in this instance | None |
| §0.5 API 2: The canonical filtration with semistable decreasing-slope quotients. | Explicit instance below | The filtration 0⊂O(2)⊂E has quotient slopes 2>−1 | agrees in this instance | None |
| §0.5 API 3: Any filtration with these properties is the canonical one. | Explicit instance below | Reversed filtration would have −1<2 and fails the decreasing condition | agrees in this instance | None |
| §0.5 API 4: Hom minus Ext¹ equals the stated numerical pairing. | Explicit instance below | P¹: dim Hom(O,O(1))−dim Ext¹(O,O(1))=2−0=2 | agrees in this instance | None |
| §0.5 API 5: Coh(X) is hereditary: Ext^i(F,F′)=0 for i≥2, so χ(F,F′)=dim Hom(F,F′)−dim Ext¹(F,F′) is the numerical pairing on classes. | Explicit instance below | P¹: Ext²(O,O)=0; χ(O,O)=1−0=1 | agrees in this instance | None |
| §0.8 API 1: The complete family of rank-r inequalities. | Explicit instance below | O(1)⊕O(−1),T=(1,−1): maximal-line adjusted slope 0≤total 0 | agrees in this instance | None |
| §0.8 API 2: Use the consecutive T block determined by cumulative ranks. | Explicit instance below | T=(3,2,0),block (1,3],degree 4: (4−2−0)/2=1 | agrees in this instance | None |
| §0.8 API 3: Canonical filtration with shifted semistable pieces and strictly decreasing shifted slopes. | Explicit instance below | Same rank-two example: T-HN has one quotient while ordinary HN has two | agrees in this instance | None |
| §0.8 API 4: Bundle inequalities agree with the adelic truncation indicator. | Explicit instance below | For this T-semistable bundle the Arthur indicator is 1, not the ordinary unstable indicator 0 | agrees in this instance | None |
| §0.9 API 1: Minimum instability and a positive-minimum index κ. | Explicit instance below | Opposite flags on O²: instabilities 0,1,1,0, minimum 0 | agrees in this instance | None |
| §0.9 API 2: The unique reduced D at a positive minimum. | Explicit instance below | At positive N with one aligned flag the two twists have instabilities N,N+1: unique minimum N | agrees in this instance | None |
| §0.9 API 3: The open defined by all fractional-twist inequalities. | Explicit instance below | At cutoff 0 in the opposite-flag example the two single rotations have value 1 and are excluded | agrees in this instance | None |
| §0.9 API 4: The κ-stratum and the ordinary N-stratum after the minimizing twist. | Explicit instance below | Σ=∅: minimizing D=0, ordinary N equals parabolic N, fibre map is identity | agrees in this instance | None |
| §0.10 API 1: Degree zero detects the identity in Ξ, and the central-degree quotient is finite. | Explicit instance below | Ξ generated in degree 1: degree(ξ^j)=j, kernel j=0; degree quotient size 1 | agrees in this instance | None |
| §0.10 API 2: Tensoring gives an action on bundles and modification chains, compatible with composition and level restriction. | Explicit instance below | GL₂ tensor O(1): degree 0→2→4, equal two-step twist degree 4 | agrees in this instance | None |
| §0.10 API 3: If Ξ′ is a finite-index subgroup of Ξ, the quotient maps compare the corresponding bundle and cohomology systems; no comparison of unrelated lattice embeddings is assumed. | Explicit instance below | Subgroup 2Z⊂Z: central quotient Z/2Z→Z/Z has fibres of size 2 | agrees in this instance | None |
| §0.14 API 1: Identify compactly supported functions on the bundle groupoid with the adelic functions of FunctionFieldArithmetic §6.2. | Explicit instance below | G_m/P¹/F₃ with two-point level: both adelic and bundle-function ranks 2 | agrees in this instance | None |
| §0.14 API 2: Transport each proper-parabolic constant term with its measure. | Explicit instance below | GL₂ on P¹,delta at O²: normalized compact unipotent quotient is one point and constant term is 1 | agrees in this instance | None |
| §0.14 API 3: Intersect cuspidal E-valued functions with the integral function lattice. | Explicit instance below | Two ray classes: integral cusp lattice O²; tensor E gives E², ranks 2 on both sides | agrees in this instance | None |
| §1.1 API 1: Bundle chains, moving legs and final trivialization. | Explicit instance below | G_m exponent 1 gives lattice tO[[t]]; exponent 0 gives O[[t]] | agrees in this instance | None |
| §1.1 API 2: Identify the global and formal-disc moduli problems. | Explicit instance below | G_m global modification at v with exponent 1 restricts to tO[[t]], retaining exponent 1 | agrees in this instance | None |
| §1.1 API 3: Disjoint-leg products, compatible with refinement of disjoint partitions. | Explicit instance below | Two disjoint torus legs exponents (1,2) stay separate, giving 2 coordinates | agrees in this instance | None |
| §1.1 API 4: Base change along X^J→X^I for a map I→J. | Explicit instance below | Collision of those legs has exponent 1+2=3 | agrees in this instance | None |
| §1.2 API 1: Dominant coweight tuple and reduced global closed support. | Explicit instance below | GL₂ minuscule (1,0): reduced support P¹ has dimension 1 | agrees in this instance | None |
| §1.2 API 2: Open positive-loop orbit in the local Schubert variety. | Explicit instance below | Same orbit is closed, so its closure dimension remains 1 | agrees in this instance | None |
| §1.2 API 3: Reduced closure of the disjoint product. | Explicit instance below | Torus weights (1,−1) collide at exponent 0, reduced support one point | agrees in this instance | None |
| §1.2 API 4: On any fixed bound the positive-loop action factors through sufficiently large finite jets. | Explicit instance below | Torus positive-unit jets act trivially at every exponent: action factors through first jet | agrees in this instance | None |
| §1.3 API 1: Bounded modification chains and all bundle projections. | Explicit instance below | Empty chain has identical endpoint bundle O, degree difference 0 | agrees in this instance | None |
| §1.3 API 2: The finite jet quotient description. | Explicit instance below | G_m,one jet quotient: Gr point dimension 0 minus G_m dimension 1 is −1 | agrees in this instance | None |
| §1.3 API 3: Concatenate chains and compare the two parenthesizations. | Explicit instance below | Torus weights 1,2,−1: both parenthesizations sum to 2 | agrees in this instance | None |
| §1.4 API 1: The constructible derived category D_c(𝒳, Λ) on the lisse-étale site, with its full subcategories D^b_c and D^±_c. | Explicit instance below | On B G_m, H⁰,H²,H⁴ have ranks 1,1,1: RΓ need not be bounded | agrees in this instance | None |
| §1.4 API 2: f^∗ and Rf^!, with identity and composition isomorphisms. | Explicit instance below | Point identity map: f*=f!=Id, rank 1 stays 1 | agrees in this instance | None |
| §1.4 API 3: Rf_∗ and Rf_!, with the forget-supports map Rf_! → Rf_∗ and the projection formula. | Explicit instance below | A¹→point: RΓ_c E=E(−1)[−2], trace q; RΓ E=E, trace 1 | agrees in this instance | None |
| §1.4 API 4: For a cartesian square, b^∗ Rf_! ≅ Rf′_! a^∗. | Explicit instance below | Identity base change on A¹: each compact trace is q | agrees in this instance | None |
| §1.4 API 5: Rf_! of an external tensor product is the external product of the Rf_!. | Explicit instance below | A¹×A¹: compact trace q²=q·q | agrees in this instance | None |
| §1.4 API 6: The dualizing complex Ω_𝒳 and D = RHom(−, Ω_𝒳), with biduality on D^b_c. | Explicit instance below | Point dual E∨=E; double dual rank 1 and evaluation 1 | agrees in this instance | None |
| §1.4 API 7: The perverse t-structure glued from a smooth atlas, its heart, intermediate extension and simple objects. | Explicit instance below | Point: ordinary sheaf in degree 0 is perverse, shift [1] has nonzero perverse degree −1 | agrees in this instance | None |
| §1.4 API 8: On a Deligne–Mumford stack the étale and lisse-étale theories agree, compatibly with atlas refinement, pullback and Frobenius; for rational coefficients over F_q the étale side is DeligneWeightsAndPurity §8.24's `dmStack_etaleCohomology`; on a scheme they are the scheme theory. | Explicit instance below | B C₂: H⁰ sign 0 and constant E on both sites | agrees in this instance | None |
| §1.4 API 9: For 𝒳₀ of finite type over F_q and K₀ bounded above, stratifiable, ι-mixed and convergent, the weighted point sum equals the convergent alternating trace of Frobenius on RΓ_c, with the relative version for Rf_!. | Explicit instance below | B S₃: weighted trace 1/6+1/2+1/3=1=H⁰ trace | agrees in this instance | None |
| §1.6 API 1: Signed minuscule chains including level-leg collisions. | Explicit instance below | n=2,r=1: minuscule quotient length 1, leg base dimension 1 | agrees in this instance | None |
| §1.6 API 2: Every intermediate bundle and each leg. | Explicit instance below | r=0: both bundle projections are Id, relative dimension 0 | agrees in this instance | None |
| §1.6 API 3: Étale chart ∏a_j=t, with the actual chosen coordinate subset. | Explicit instance below | ab=t at origin: fibre tangent dimension 2 versus fibre dimension 1, total chart dimension 2 | agrees in this instance | None |
| §1.6 API 4: Picard quotient preserves the stated smoothness and flatness properties. | Explicit instance below | Tensor O(x) changes GL₂ degree by 2, PGL₂ object unchanged, local equation still ab=t | agrees in this instance | None |
| §1.7 API 1: Finite-support positive-loop-equivariant perverse sheaves. | Explicit instance below | G_m weight-1 delta has one-dimensional fibre on one-point support | agrees in this instance | None |
| §1.7 API 2: Monoidal convolution with unit and associator. | Explicit instance below | delta_1∗delta_2∗delta_−1 has weight 2 in either parenthesization; unit weight 0 | agrees in this instance | None |
| §1.7 API 3: Total cohomology with finite-dimensional E-values. | Explicit instance below | GL₂ standard IC on P¹: cohomology ranks 1+1=2 | agrees in this instance | None |
| §1.7 API 4: Simple objects are IC closures indexed by dominant coweights. | Explicit instance below | Torus delta_0 and delta_1 have distinct supports and Hom dimension 0 | agrees in this instance | None |
| §1.14 API 1: The coefficient functor is fully faithful on all finitely generated coefficient representations. | Explicit instance below | Unit torsion sheaf: End(O/λ)=O/λ, same as End of its coefficient representation | agrees in this instance | None |
| §1.14 API 2: Fusion is natural in coefficients and coherent under successive coalescences. | Explicit instance below | Weights 1,2,3 coalesce to 6 under both compositions | agrees in this instance | None |
| §1.14 API 3: Flat Satake objects correspond exactly to finite free representations. | Explicit instance below | O is flat rank 1; O/λ has Tor₁(O/λ,O/λ)=O/λ≠0 | agrees in this instance | None |
| §1.14 API 4: Extension of scalars to E gives the rational coefficient functor and its fusion comparisons. | Explicit instance below | O/λ⊗E=0; O⊗E=E of dimension 1 | agrees in this instance | None |
| §2.1 API 1: The bundles, levels, modifications, legs and closing Frobenius isomorphism. | Explicit instance below | G_m single positive weight gives degree equation d+1=d, contradiction 1=0 | agrees in this instance | None |
| §2.1 API 2: The morphism to U^I. | Explicit instance below | G=1,one leg: leg base U, identity map has fibre dimension 0 | agrees in this instance | None |
| §2.1 API 3: Forget the closing isomorphism. | Explicit instance below | No legs G_m/F₃: forgetting Frobenius changes Aut order 2 finite to dimension-1 G_m | agrees in this instance | None |
| §2.1 API 4: Fibre product with the specified reduced Schubert support. | Explicit instance below | Zero Schubert support allows only degree difference 0; weight 1 support has difference 1 | agrees in this instance | None |
| §2.4 API 1: Signed chain, residue sections, degree balance and twisted Frobenius closure. | Explicit instance below | n=2,μ=−1,D=−Γ∞/2: signed sum −1 equals n deg D=−1 | agrees in this instance | None |
| §2.4 API 2: The Pic_X(F_q) quotient and its twisted-graph description. | Explicit instance below | Tensor O(1) changes degree by 2 but PGL₂ shtuka class by 0 | agrees in this instance | None |
| §2.4 API 3: Change infinity coefficients by the source’s Frobenius-coboundary rule. | Explicit instance below | Two residue sections with coefficients 1/2,−1/2 sum 0; coboundary redistribution gives zero total | agrees in this instance | None |
| §2.4 API 4: Commuting fractional rotations, involutive for PGL₂. | Explicit instance below | PGL₂ half rotations at disjoint points commute; each squares to identity | agrees in this instance | None |
| §2.5 API 1: The relative-perverse coefficient sheaf on each bounded stack. | Explicit instance below | G=1,trivial W: relative IC has stalk rank 1 | agrees in this instance | None |
| §2.5 API 2: The constructible R^jp_! object at μ for each fixed j; j=0 gives the original excursion system. | Explicit instance below | No legs GL₂/P¹,bounds m=0,1: H⁰ dimensions 1,2 | agrees in this instance | None |
| §2.5 API 3: Covariant maps as HN opens grow. | Explicit instance below | Extension by zero sends (a) to (a,0), rank 1 injection into rank 2 | agrees in this instance | None |
| §2.5 API 4: Canonical comparison of iterated presentations, compatible with a third refinement. | Explicit instance below | Collision P¹: total cohomology rank 2 retained through proper pushforward | agrees in this instance | None |
| §2.7 API 1: Pullback preserves all chain maps, their commuting squares, quotient lines and marked periodicity. | Explicit instance below | Identity base change preserves n=2,d∞=1 period 2 and degree increment 2 | agrees in this instance | None |
| §2.7 API 2: The comparison with the one-leg fractional shtuka is an equivalence of groupoids, natural in the base and preserving the chosen degree component. | Explicit instance below | n=2,g=0: both normalized carriers have degree −1 and signed modification −1 | agrees in this instance | None |
| §2.7 API 3: Full levels away from pole and zero restrict compatibly, and Iwahori levels agree under the comparison. | Explicit instance below | G_m full level 2v→v on F₃: 6 trivializations restrict to 2 in either carrier | agrees in this instance | None |
| §2.7 API 4: Rotation of the marked chain changes its degree by one; n d∞ rotations tensor by O(∞), increasing degree by n d∞. | Explicit instance below | n=2,d∞=2: four rotations increase degree by 4, same as tensor O(∞) | agrees in this instance | None |
| §2.8 API 1: All adjacency and twisted-Frobenius endpoint constraints. | Explicit instance below | r=2,(N,N+1,N): endpoint N−N=0 and two adjacent differences 1 | agrees in this instance | None |
| §2.8 API 2: The coordinate subscheme X(κ) and free coordinates I(κ). | Explicit instance below | Same tuple: free set {1,2} has size 2 and support dimension 2 | agrees in this instance | None |
| §2.8 API 3: The locally closed substack fixing intermediate indices. | Explicit instance below | r=0,high N: support is one point, dimension 0 | agrees in this instance | None |
| §2.8 API 4: Componentwise ordered bounded opens covering the stack. | Explicit instance below | Bound N≤b includes this stratum iff N≤b; b→b+1 adds exactly one N-index | agrees in this instance | None |
| §2.9 API 1: Rotate a specified leg block and move those legs by Frobenius. | Explicit instance below | At degree-two v first Frobenius permutes 2 residue sections, square fixes them | agrees in this instance | None |
| §2.9 API 2: Induce the coefficient isomorphism and colimit operator. | Explicit instance below | G=1 constant coefficients: Frobenius coefficient map is scalar 1, invertible | agrees in this instance | None |
| §2.9 API 3: The product over a partition is total Frobenius. | Explicit instance below | Two blocks have degrees (1,0),(0,1), product (1,1) | agrees in this instance | None |
| §2.11 API 1: The bounded-support diagram with its coefficient morphism. | Explicit instance below | Torus modification exponent 1 has support one double coset, coefficient 1 | agrees in this instance | None |
| §2.11 API 2: Integral Hecke action on the cohomology colimit. | Explicit instance below | Identity Hecke coset acts on delta_0 as delta_0, coefficient 1 | agrees in this instance | None |
| §2.11 API 3: Convolution agrees with composition of correspondences. | Explicit instance below | delta_1∗delta_−1=delta_0: composition moves exponent +1−1=0 | agrees in this instance | None |
| §3.1 API 1: Creation from a specified invariant vector. | Explicit instance below | coev on E² sends 1 to e₁⊗e₁∨+e₂⊗e₂∨, two terms | agrees in this instance | None |
| §3.1 API 2: Annihilation with a specified invariant covector. | Explicit instance below | eval sends these terms to 1+1=2; zero covector gives 0 | agrees in this instance | None |
| §3.1 API 3: Rigid tensor triangles survive coefficient functoriality and fusion. | Explicit instance below | Triangle on e₁ gives e₁, not 2e₁; closed trace gives 2 | agrees in this instance | None |
| §3.2 API 1: Existence of a finite O_E-submodule containing h and stable under all integral operators. | Explicit instance below | O·1 stable under unit 2 at ℓ=3, rank 1; ℓ⁻¹ has valuation orbit −n | agrees in this instance | None |
| §3.2 API 2: The E-subspace formed by the union of such modules. | Explicit instance below | The union of λ⁻ⁿO·h over n≥0 is E·h; sum of two lines has dimension 2 | agrees in this instance | None |
| §3.2 API 3: A Hecke-equivariant linear map carries a finite witness to a finite witness. | Explicit instance below | Intertwiner multiplication 3 sends O into 3O, still rank 1 | agrees in this instance | None |
| §3.2 API 4: A finite family of Hecke-finite vectors lies in one finite stable O_E-module. | Explicit instance below | Vectors 1,λ⁻¹ have common witness λ⁻¹O, rank 1 | agrees in this instance | None |
| §3.4 API 1: The filtered perverse-cohomology objects, one object for each i. | Explicit instance below | At r=0,degree i=0 gives function sheaf; absent other degrees have rank 0 | agrees in this instance | None |
| §3.4 API 2: The direct limit V in degree 2r and twist r. | Explicit instance below | r=2: middle compact degree 4 and twist 2, as 2r=4 | agrees in this instance | None |
| §3.4 API 3: Correspondences act compatibly with bound transitions. | Explicit instance below | Identity correspondence commutes with the inclusion E→E²,v↦(v,0) | agrees in this instance | None |
| §3.4 API 4: Cycle classes, duality adjoints and Atkin–Lehner symmetries. | Explicit instance below | PGL₂ spherical coset equals inverse; pairing coefficients 1 and 1 give adjoint scalar 1 | agrees in this instance | None |
| §3.5 API 1: The componentwise map to the modified Levi cohomology. | Explicit instance below | G_m: proper-parabolic map family empty, so no nonzero outgoing component | agrees in this instance | None |
| §3.5 API 2: The simultaneous kernel, with its inclusion into the full HN colimit. | Explicit instance below | Torus kernel intersection is all H; GL₂ delta with constant term 1 is excluded | agrees in this instance | None |
| §3.5 API 3: The map intertwines the unnormalized constant-term homomorphism of the Hecke algebras. | Explicit instance below | Torus Hecke shift δ_1 commutes with empty constant-term family; unit maps give 1=1 | agrees in this instance | None |
| §3.5 API 4: After tensoring with E, integral cuspidal cohomology gives the rational cuspidal subspace. | Explicit instance below | Kernel 0 over O tensors to 0 over E; torus kernel O² tensors to E² | agrees in this instance | None |
| §3.6 API 1: Creation, the specified Frobenius power and annihilation give an endomorphism of the cohomology system. | Explicit instance below | Unit coefficient: coeval 1,Frob^d 1,eval 1 compose to 1 | agrees in this instance | None |
| §3.6 API 2: Descent makes that endomorphism independent of the geometric point over v. | Explicit instance below | G=1: two geometric choices give scalar 1 and 1 | agrees in this instance | None |
| §3.6 API 3: Away from v it agrees with the spherical Hecke correspondence, and thus extends its action across v. | Explicit instance below | GL₂ standard at q_v=9: both normalized Hecke and corrected IC give +1/3 | agrees in this instance | None |
| §4.3 API 1: Automorphisms with a witnessed coordinate-Frobenius degree tuple. | Explicit instance below | Two generators have degree (1,0),(0,1), not just their diagonal sum | agrees in this instance | None |
| §4.3 API 2: The homomorphism to Z^I with geometric kernel. | Explicit instance below | Geometric-kernel element has degree (0,0); total Frobenius has (1,1) | agrees in this instance | None |
| §4.3 API 3: The specialization-dependent map to Weil(F)^I. | Explicit instance below | One-leg specialization degree 2 maps to Weil degree 2; inverse degree −2 stays −2 | agrees in this instance | None |
| §4.8 API 1: The specified Hecke-finite fibre and its Hecke action. | Explicit instance below | G_m/P¹/F₃,no level: no-leg space E has dimension 1 | agrees in this instance | None |
| §4.8 API 2: An E-linear coefficient functor in W. | Explicit instance below | Scalar coefficient map 3Id acts by 3; composition with 2Id gives 6 | agrees in this instance | None |
| §4.8 API 3: A continuous action on each finite-dimensional stable piece. | Explicit instance below | C₂ action diag(−1,1) has image order 2, continuous on a finite quotient | agrees in this instance | None |
| §4.8 API 4: χζ natural in W and coherent in ζ, including the empty set. | Explicit instance below | Merge V⊠V∨,dim V=2: dimension 4 on both sides; trivial leg factor dimension 1 | agrees in this instance | None |
| §5.1 API 1: The endomorphism from (I,W,x,ξ,γ). | Explicit instance below | W=1,pairing 3: operator 3Id; pairing 0 gives 0 | agrees in this instance | None |
| §5.1 API 2: Any common refinement of the specialization choices gives the same endomorphism. | Explicit instance below | Change of scalar basis 2 contributes 2·(1/2)=1 to full composite | agrees in this instance | None |
| §5.1 API 3: It belongs to the commutant of the full level-N Hecke action. | Explicit instance below | Scalar 3 commutes with Hecke scalar 2: both products 6 | agrees in this instance | None |
| §5.4 API 1: Creation–Weil–annihilation on all cohomological degrees with the retained J legs. | Explicit instance below | Auxiliary empty I,pairing 3: retained vector of Weil eigenvalue 2 goes to 3v, not 6v | agrees in this instance | None |
| §5.4 API 2: The proper-parabolic constant term intertwines the G and Levi operators. | Explicit instance below | At trivial coefficient, constant term of 3delta is 3 times that of delta, value 3 | agrees in this instance | None |
| §5.4 API 3: Extension O_E→E intertwines the integral and rational actions. | Explicit instance below | Integral scalar λ maps to same scalar λ on E and to 0 modulo λ | agrees in this instance | None |
| §5.4 API 4: Restriction to the cuspidal subspace agrees with the original global excursion. | Explicit instance below | On torus all functions cuspidal, so restriction is same scalar 3 | agrees in this instance | None |
| §5.7 API 1: The image algebra inside the Hecke commutant. | Explicit instance below | Zero cusp space gives dimension-0 image algebra; scalar action on E gives dimension 1 | agrees in this instance | None |
| §5.7 API 2: Every geometric excursion has its canonical element of B. | Explicit instance below | W=1,pairing 3: generator equals 3 in image E | agrees in this instance | None |
| §5.7 API 3: The simultaneous generalized character subspace. | Explicit instance below | Jordan J at eigenvalue 1: generalized block dimension 2, eigenspace dimension 1 | agrees in this instance | None |
| §5.7 API 4: After a finite splitting extension the finite direct sum of blocks is the cusp space. Both statements are required: the character blocks are independent and their supremum is the whole cusp space. Over an algebraic closure, the χ-block is the intersection, over a∈B, of the maximal generalized eigenspaces of a for χ(a); an equality of their sum with the whole space alone is insufficient. | Explicit instance below | Diagonal(1,2): blocks span E² with dimensions 1+1=2 and intersection 0 | agrees in this instance | None |
| §7.2 API 1: Finite-jet torsor, bounded modification and restricted Frobenius isomorphism. | Explicit instance below | I=∅,G_m(F₃[π]/π²) has 6 elements; classifying stack mass 1/6 | agrees in this instance | None |
| §7.2 API 2: Restriction over the specified `U_{I,r}`, with its smoothness theorem. | Explicit instance below | No legs,restriction level 2→1: finite group map 6→2; fibre group order 3 gives smooth relative stack dimension 0 | agrees in this instance | None |
| §7.2 API 3: Decrease (n,ni,r), preserving the coefficient comparison. | Explicit instance below | Decrease level 2→1→0: group orders 6→2→1, same composite 6→1 | agrees in this instance | None |
| §7.2 API 4: For I=∅ identify the stack with B G(O_nv). | Explicit instance below | At no legs and G=1 the classifying stack is point, Aut order 1 | agrees in this instance | None |
| §7.5 API 1: The compactly supported U_m-double-coset element at finite torsion coefficients. | Explicit instance below | f=1: finite support contains exactly the identity coset with value 1 | agrees in this instance | None |
| §7.5 API 2: Every permitted finite-jet construction gives the same local function. | Explicit instance below | Unit realized by any rank-one coev/eval pair with pairing 1 gives same δ_0 | agrees in this instance | None |
| §7.5 API 3: Right convolution equals the global excursion on C_c at every auxiliary away-v level. | Explicit instance below | Convolution δ_0 on compactly supported delta at g returns that same delta, coefficient 1 | agrees in this instance | None |
| §7.5 API 4: Reduce s or project the congruence level compatibly. | Explicit instance below | λ mod λ² reduces to 0 mod λ; scalar 1 reduces to 1 at every exponent | agrees in this instance | None |
| §7.10 API 1: Isomorphic parameters and coefficient transport give the same rational function. | Explicit instance below | Rank-one isomorphic trivial parameters both give (1−T)/(1−q⁻¹T⁻¹) | agrees in this instance | None |
| §7.10 API 2: Direct sums multiply the gamma factors, with the zero representation giving 1. | Explicit instance below | Zero direct summand gives gamma×1; two trivial lines give gamma² | agrees in this instance | None |
| §7.10 API 3: In rank one the factor is Tate's factor under the chosen reciprocity convention. | Explicit instance below | For trivial character and q=2,s=0: 0/(1−1/2)=0 | agrees in this instance | None |
| §7.10 API 4: Normalized parabolic induction restricts the L-group representation to the dual Levi. | Explicit instance below | GL₂ diagonal Levi characters χ₁,χ₂ give gamma(χ₁⊕χ₂)=gamma(χ₁)gamma(χ₂) | agrees in this instance | None |
| §7.10 API 5: Scaling the additive character obeys the change law below. | Explicit instance below | ψ→ψ(ϖ·): multiplier q^(1/2−s); at s=1/2 this is 1 | agrees in this instance | None |
| §7.10 API 6: Twists of sufficiently large conductor have the Artin stability formula, with the conductor threshold depending on the parameter. | Explicit instance below | For χ=1 and a sufficiently ramified η, stability compares η and χη=η: determinant multiplier 1, same gamma | agrees in this instance | None |
| §7.10 API 7: For a global cuspidal parameter and a global differential character, the product of the local gamma factors gives the global functional equation. | Explicit instance below | Global trivial line, q=2,P¹,s=2: Z(s)=8/3, Z(1−s)=1/3; global epsilon=8 and L-ratio=1/8, so product gamma=1 | agrees in this instance | None |
| §1.13 API: determinant base change | R→R/2, rank-two quotient | Swap determinant −1 maps to +1 mod 2 | agrees | None |
| §1.13 API: chain exact sequence | Quotient Re₁⊕Re₂ | det(Re₁)⊗det(Re₂) maps e₁⊗e₂ to e₁∧e₂, coefficient +1 | agrees | None |
| §1.13 API: three-step coherence and unit | Three basis vectors; zero quotient | Both ordered wedges give e₁∧e₂∧e₃, coefficient +1; ∧⁰R⁰=R | agrees | None |
| §7.11 API: transport and central character | Rank-one unramified character α=2 | Transport preserves polynomial 1−2T; det(2)=2 equals central character at ϖ | agrees | None |
| §7.11 API: dual and twists | Rank-one values 2,3 | Dual value 1/2; twist value 6; dual of twist 1/6 | agrees | None |
| §7.11 API: induction and retained monodromy | GL₂ normalized principal series and Steinberg constituent | Semisimple direct sum has 2 eigenvalues; monodromy ranks 0,1 distinguish the constituents | agrees | None |


Pull request: #1490 (roadmap/global-shtukas-and-function-field-langlands at 86a8746)
