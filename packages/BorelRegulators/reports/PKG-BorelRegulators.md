# BorelRegulators package report

The package expands the accepted six-layer design: all 26 targets, all original Checks and all worked examples are present. The README has 101 subsection Checks, four convention Checks and four Layer 5 example Checks. The 102 plan Checks occur among those subsection and example Checks; three new negative controls bring their combined count to 105. Each layer ends with Examples and Dependencies. The plan was first rendered into a prose skeleton containing every statement, hypothesis, API fact, Check, locator and prerequisite; the accepted prose supplied the proof routes and examples. No target catalogue was substituted for the README.

The deliverables are `packages/BorelRegulators/README.md`, `packages/BorelRegulators/Suggested.lean`, `packages/BorelRegulators/metadata.toml`, `packages/BorelRegulators/sources.toml`, this report, and the top-level gaps value in `packages/BorelRegulators/design/plan.json`. A parsed comparison confirms that every other plan value is unchanged. There were no edits to another package, the content checkout's source files, the library pins or the merge order.

## Headlines selected before writing Lean

| Headline | Outcome at the pins |
| --- | --- |
| Exact order and nonzero leading coefficient of continued Dedekind zeta at 1−n (§1.3) | Not statable: the global continued Dedekind function and its germ are missing. The convergent ideal series and the holomorphic remainder near one do not reach these points. |
| Chern-normalized Borel regulator, real isomorphism, torsion kernel and restriction/transfer naturality (§§2.1–2.3) | Not statable: actual higher Quillen groups, the continuous Borel class and the arithmetic comparison maps are missing. |
| Number-field period equals index (§3.1) | Stated: `TauCetiRoadmap.BorelRegulators.period_eq_index`. It uses native `CSA`, the native Brauer class and Tau Ceti's index. |
| Division algebras of every degree split at infinity (§3.2) | Stated: `TauCetiRoadmap.BorelRegulators.exists_divisionAlgebra_split_at_infinity`. It asserts dimension a² and splitting at every real and complex embedding on actual division algebras. The prescribed-local-invariant refinement needs the local invariant maps and stays in the README. |
| Rational zeta-product volume of arithmetic norm-one quotients (§§3.3–3.6) | Not statable: the algebraic norm-one group, adelic gauge and arithmetic quotient carriers are missing. |
| Compact and arithmetic primitive periods and their common compact-fibre comparison (§§4.3–4.6) | Not statable: the compact dual, these cohomology algebras and their actual invariant-form comparisons are missing. |
| Primitive-period determinant, including dₙ=0 (§5.1) | Not statable: the actual comparison between the cohomological indecomposable determinant lines is missing. |
| Exact homotopy-to-Tate lattice conversion (§5.2) | Not statable: stable SU/SO, its integral homotopy lattice and the suspended-character map are missing. |
| Integral regulator lattice, zeta covolume and S-integer/order transport (§§5.3–5.5) | Not statable: the actual higher K-groups and specified regulator are missing. |
| Point Deligne realization and Borel equals twice Beilinson (§§6.1–6.2) | Not statable: geometric Deligne cohomology and the independent universal regulator are missing. The elementary point quotient alone cannot state this comparison. |
| Pure rational Adams weight (§6.3) | Not statable: actual higher K-groups and their Adams operations are missing. |

The Lean file contains only the two statable headlines, with no new definitions, no data admissions, no API lemmas, no examples and no option overrides. The totally real even-value calculation is a clause of the general primitive determinant and an example comparing IntegralIwasawaTheory's theorem; it was not used as a replacement acceptance theorem. The statements missing carriers are named, with those carriers, in the module docstring.

## Corrections and limits of support

1. Applied all six non-blocking review notes. Section 5.5 now attributes the S-integer and order statements to transport along ArithmeticKTheory §§3.3–3.4 and the order finite-generation gap; Borel §6.4 is cited only for normalization. Section 5.2 is a statement about the transported homotopy lattice, and its exact regulator-covolume conversion is derived in §5.4 after the integral lattice is defined. Its dependencies include §2.3 and StableHomotopyKTheory §2.3, rather than an unused dependence on §5.1. Section 3.5 now requires a generator of integral invariant top forms outside S, rather than merely an integral form. The two ambiguous gap requests now name the bundles, ranges, orientation and suspension explicitly. Process wording and the eight malformed proof-route sentences were rewritten.
2. The regular representation in §4.4 first has matrix size (j+1)². Padding it to an arbitrary larger odd size is a group representation with an identity block. An assertion of a unital algebra embedding into every such size would be false: for degree two, every finite left module has F-dimension divisible by 4, whereas size 17 is required by an admissible odd choice. The faithful padded norm-one group representation has determinant Nrd(g)^(j+1)=1. Its restriction factor is (j+1)^(jN), with the original cycle Checks preserved and an additional size-17 control.
3. Symmetric-space quotients now use left K-cosets consistently with the compact-fibre bundles; the Cartan map uses right SO-cosets and the models are transported by inversion. Section 6.1 explicitly defines the point lattice through the quotient image of ℤ(n−1). The image of ℤ(n) is zero. Its weight-zero negative control explicitly concerns saturated natural subtraction and is distinguished from geometric Deligne H¹, which vanishes in weight zero.
4. Added the native algebraic/cohomological field-Brauer comparison, native index, splitting-field carrier and ideal lying-over as exact inputs. The two finite places in §3.2 may be taken over 2 and 3 and are distinct by contraction. No local invariant, degree, splitting-field, quotient, exterior-power or general lattice carrier is reconstructed.
5. Corrected pinpoint lines: `CSA` is at Mathlib/Algebra/BrauerGroup/Defs.lean:40; `BrauerGroup` is at :99; `TauCeti.Algebra.deg` is at TauCeti/Algebra/CentralSimple/Degree.lean:163; the Deligne integral-structure discussion, Burgos Remark 10.6, is on p.92. The irrelevant unresolved exclusion of ArithmeticKTheoryPartII §R17 was cut from the README.
6. The sweep also found that the native index API and SemisimpleAlgebras Layer 6 supply an index-degree splitting field but not divisibility of every finite splitting degree by the index. Section 3.1 uses that generic implication. The additional gap:splitting-degree-index assigns it to SemisimpleAlgebras, Part II, with the division-module dimension proof and arbitrary finite field extensions, including inseparable ones. This adds no new arithmetic target. There are 12 supplier gaps in the delivered plan.
7. The 11 accepted supplier gaps remain genuine requirements, not hypotheses secretly containing conclusions. Their sentences occur verbatim under their suppliers in Exact supplier contracts. The two review-requested sentence changes, the gauge-generator clarification and the added generic splitting-degree gap modify only the plan's gaps list. The frozen target entries were not edited to follow prose corrections.

The missing universal and infinitesimal constructions cannot be supported by a stand-in at these pins. `packages/MotivicEtaleKTheory/target.md`, Final targets 2–3 and 5–6, supports the ownership of higher Chern and universal Deligne realization, but supplies no numbered universal-realization layer to cite as an accomplished contract. Its point/transfer and infinitesimal extensions are therefore stated as the two accepted gaps, with no fabricated section number. The generic graded quotient, calibration, finite-range comparison, order finiteness, arbitrary finite-place masses, inner type-A structure, cyclic local-degree extension and norm-one Tamagawa theorem are likewise expressly requested of their owners.

## Duplication and ownership sweep

The content main is a4a8652e46fe27e56355bbcf74579562b503fbc3. The manifest pins are Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. I read the upstream shapes of ClassFieldTheory, ClassicalArithmeticCompletion, RepresentationTheory/SemisimpleAlgebras and Completed/NumberFieldArithmetic, and compared the metadata (`topic = "math.NT"`).

The roadmap service searched README and Suggested.lean on main and all 330 indexed open heads, including all named sibling roadmaps. The search families were: Borel/Beilinson regulators, primitive periods and determinants, arithmetic and compact-dual cohomology, homotopy lattices, period/index and Brauer comparisons, Chern calibration, graded augmentation quotients, rational gauges, Tamagawa numbers, regulator lattices/covolumes and Adams weights. Every material supplier was then read with `roadmaps show`; none was inferred only from a search hit. Main and the board packages were also searched directly by these objects. PeriodsAndSpecialValues PS.3.2a was read at the supplied board head 9f14c68 through the read-only connector. No unknown pull-request heads were sought.

| Construction or repeated fact excluded from this package's ownership | Exact owner consumed |
| --- | --- |
| Quillen K-groups, plus/Q comparison and finite-projective transfer | GeneralAlgebraicKTheory §§2.5, 3.2, 3.12, 7.7–7.8. The last section includes nonreduced Artin base-change factors with their lengths; the number-field/complex application has length 1 at each embedding. |
| Finite generation, rational localization, rational order equivalence, stable comparison and Borel ranks | ArithmeticKTheory §§3.2–3.4; its regulator-value exclusion was read. Section 5.5 transports these maps and does not reprove them. |
| Finite-type rational primitive Hurewicz and stable GL plus multiplication | StableHomotopyKTheory §§3.37, 4.14; the finite-type hypothesis is used only for arithmetic K-theory, not discrete GL(ℂ). |
| Generic compact Lie primitives, transgression, characteristic classes and Bott coefficients | CharacteristicClasses C5a.2–C5a.5, C6 items 2–3; TopologicalKTheory T4, T7 item 1. The requested graded-quotient extension stays with CharacteristicClasses. |
| Generic relative cochains, quotient manifolds, de Rham comparisons and van Est | ArithmeticLocallySymmetricSpaces ALS.F.5, ALS.0.4–ALS.0.9, ALS.5b.1; AutomorphicFormsOnReductiveGroups §§1.1–1.3; DifferentialGeometry Layers 5–6 and 8. Section 4.2 assembles the particular arithmetic/compact-dual maps. |
| Adelic group, invariant gauges, quotient integration, norm-one group, compactness and strong approximation | AdelicAlgebraicGroups §§1.2, 1.4, 2.2–2.5, 3.4 and 4.2. Generic gauge independence and restriction of scalars are imports; only the Borel normalization and zeta-volume specialization are targets here. |
| Local invariants, finite support, zero-sum realization and zero-local-invariants criterion | ClassFieldTheory Layers 5 and 10. The repeated §3.1 API assertion that all local invariants vanish exactly for the zero class was deleted; the arithmetic equality with index is new here. |
| Generic division-representative existence/uniqueness, degree, index and splitting fields | Tau Ceti, Algebra/BrauerGroup/Division.lean:69, :92; Algebra/CentralSimple/Degree.lean:163; Index.lean:99, :112, :171, :180, :255; Splitting.lean:120. The generic constructions are excluded; §§3.1–3.2 prove number-field consequences on them. |
| Algebraic/cohomological field-Brauer equivalence | `TauCeti.brauerCohomologyEquiv`, TauCeti/Algebra/CrossedProduct/Comparison.lean:267. This missing input in the design's stated route was added as an import, not a new target or gap. |
| Generic determinant functor laws and top-exterior dimension | `exteriorPower.map`, `map_id`, `map_comp`, Mathlib/LinearAlgebra/ExteriorPower/Basic.lean:260, :293, :298; `exteriorPower.finrank_eq`, ExteriorPower/Basis.lean:173. Two generic §4.1 API bullets were replaced by facts specifying the cohomological adapter and its actual maps. |
| Generic sublattice covolume/index formula | `ZLattice.covolume_div_covolume_eq_relIndex`, Mathlib/Algebra/Module/ZLattice/Covolume.lean:148. The standalone generic §5.5 API claim was replaced by its application to the order images, and the exact input was added. |
| Degree-one unit lattice and regulator | Mathlib/NumberTheory/NumberField/Units/Regulator.lean:266 and Completed/NumberFieldArithmetic. No K₁(F) lattice target is present. |
| Continued Dedekind function and functional equation | LFunctions Layer 3. Only its higher-negative-point leading coefficient and the arithmetic period consequences are developed here. |
| Universal motivic Chern/Deligne realization | MotivicEtaleKTheory's universal-realization direction, with the two accepted gaps. The point/embedding adapter and Borel comparison are the targets here. |
| Totally real Siegel–Klingen rationality | IntegralIwasawaTheory §6.0; it is compared in a Layer 5 example, not planned again. |

The generic finite-splitting-degree divisibility statement is also excluded and requested from SemisimpleAlgebras, Part II, extending Layer 6 (gap:splitting-degree-index). These are all ownership removals or exclusions found in the sweep. No accepted target was deleted. The relative period/discriminant computation for restriction of scalars of SL, its division-algebra cycles, its arithmetic zeta-period determinant and the integral regulator covolume have no competing generic owner in the inspected main/open work. K2SymbolsBrauerPartII and K3BlochGroups concern low-degree symbols, HabiroRings and HabiroCohomologyFoundations concern completions, and Polylogarithms owns its explicit symbol and analytic calibrations. None replaces these general arithmetic volume/period theorems. Their common K-theory and universal realization are imported.

The accepted ownership transfers are preserved: the number-field regulator, factor-two comparison and Adams consequence from PeriodsAndSpecialValues PS.3.2a; the complex regulator/lattice prefix from ColemanIntegration §L3.Fc.1, leaving its pairings and discriminant determinants there; and number-field period equals index from HeightsRationalPointsAndObstructions §3.6. No input is consumed from those application blocks. The general norm-one Tamagawa proof belongs to the accepted AdelicAlgebraicGroups extension; this package only specializes its gauge. No additional notion was taken from a later supplier during packaging.

## Source verification

All seven lifetime manifest keys are retained. The five certified texts were read in the operator's line-numbered cache; the formula-bearing Borel pages were also read from the cached legal PDF. No source passage, PDF or extracted source text was put into the package or report. No additional reference was needed. Weil's waiver and Beilinson's uncertified paywalled locator remain settled and were not requested again.

| Source | Read locators and what they support |
| --- | --- |
| borel1974 | Theorem 7.5, p.259, borel1974 line 934–940; SL stable generators, §11.4, pp.267–268, borel1974 line 1246–1253; Proposition 12.2, p.271, borel1974 line 1377–1380. These justify the supplier boundary, not an extra rank proof here. |
| borel1977 | §1.3, p.616, borel1977 line 122–126; §1.4, line 127–139; §1.6, p.617, line 153–163; Lemma 2.2 and Proposition 2.4, pp.617–619, line 177–236; §§3.3–3.5, pp.620–622, line 289–337; Proposition 4.3, pp.623–625, line 347–402; §5.2, pp.626–627, line 440–461; Proposition 5.4 and Theorem 5.5, pp.628–630, line 462–551; Theorem 6.2, Remark 6.3 and §6.4, pp.631–633, line 567–615. Printed pages 628–633 were visually checked for the formulas missing from extraction. |
| burgos2002 | Corollary 9.8, p.78, burgos2002 line 3140–3150; Definition 9.10 and Theorem 9.12, pp.79–80, line 3222–3259; Lemma 9.18 through Corollary 9.23, pp.84–85, line 3546–3709; Definition 9.24, p.86, line 3733–3753; point projections and integral structure, pp.91–92, line 3955–4001; Definitions 10.7–10.8 and Theorem 10.9, pp.94–97, line 4087–4241. The local proof inputs were read at Propositions 8.9, 8.10, 8.14 and Theorems 8.12, 8.15, pp.70–73, line 2865–2992, and their use at line 4172–4241. GL_b(ℂ) is connected and its underlying real group/Lie algebra are distinguished in these uses. |
| poonen2017 | Theorem 1.5.36(i), (iii)–(iv), pp.25–26, poonen2017 line 1396–1446; local-degree scaling at Theorem 1.5.34, line 1363–1379; Definitions 1.5.15–1.5.16 and Proposition 1.5.17, p.21, line 1213–1229. The global proof permits changing local cyclic extensions and does not assert arbitrary fixed dyadic prescriptions. |
| deligne_goncharov2005 | Published §1.6, pp.7–9, deligne_goncharov2005 line 282–440. The actual regulator/rational K comparison is (1.6.3)–(1.6.10); the Adams assertion is line 429–440. The published edition, rather than the differently numbered arXiv v2, is cited. |
| weil1961 | §3.3, Theorem 3.3.1, as invoked at borel1977 line 227. Waived; no claim to have read the proof. |
| beilinson1985 | §§1–2, J. Soviet Math. 30 (1985), pp.2036–2070. Uncertified historical locator only; the factor-two proof uses the certified Burgos text. |

Three source misprints in Borel's proof were recomputed. At borel1977 line 518 and line 532 the dimension/top degree must be N(j²+2j), giving 6 when N=2,j=1 rather than 3. At line 549 the restriction of the j-fold wedge has factor (j+1)^j at one embedding, giving 9 at j=2 rather than 3. The discriminant exponent in equation (8), printed p.629 (borel1977 line 510–513), has the opposite sign from the defining restriction-of-scalars factor: the required exponent is −(j+1/2), giving 4^(−3/2)=1/8 rather than 8 at Δ=4,j=1. Their ratio is Δ^(2j+1), a nonzero rational, so the rational-class conclusion is unchanged. The accepted design already uses the corrected dimension, wedge factor and compact discriminant power; the package preserves them.

## Adversarial mathematics pass

The following tables distinguish the full statements, each API law and each Check. Values were recomputed directly; finite matrix counts, phases, quotient projections and the noncommuting Cartan witness were also evaluated in a small scratch calculation. Numerical examples are tests of the stated laws, not proofs of the general theorems. Values such as an unspecified nonzero regulator coordinate t are specialized to t=3 in these calculations. In the imaginary-quadratic leading-value row, G denotes the positive alternating sum Σ_(k≥0)(−1)^k/(2k+1)², so ζ_ℚ(i)(2)=π²G/6; the functional equation gives the displayed ratio −1/2 without dividing by zero. Absolute values in table cells are written with abs to keep the tables unambiguous.

The standing context is checked separately from numerical instances: F is a characteristic-zero nontrivial field with finite ℚ-dimension; n≥2 in all higher-regulator and zeta theorems; n≥1 only for the elementary target and point quotient; a≥2 for the division/norm-one volume direction; ω≠0; q_v≥2; Γ torsion-free for manifold and fibre comparisons; finite S; finite-dimensional real spaces, Borel measures, additive Haar normalization and discrete spanning submodules before applying covolume positivity; finite-type rational homology only where supplied; regularity and ample-family hypotheses for Adams operations. The Lean theorem binders carry Field, NumberField, the degree bound, and all division/centrality/dimension structures explicitly. Number fields exclude inseparable and equal-characteristic field extensions; the general transfer supplier retains them and its nonreduced length factors.

### Definitions and full target statements

| Statement | Instances tried | Values on the stated and independent sides | Result | Change |
| --- | --- | --- | --- | --- |
| §1.1 Embedding space and coordinate lattice | ℚ n=2,3; ℚ(i); t=1 | dimensions (0,1), (1,1); pair (1,−1)/(1,1); weight-3 generator −4π² divided by −4π²=1 | consistent | parity and coordinate measure explicit |
| §1.2 Restriction and full trace | ℚ(i)/ℚ, n=2,3; degree-4 tower | T(3,−3)=0; TR(3)=6=2·3; 4·3=2·(2·3)=12 | consistent | no averaging |
| §1.3 Leading coefficient and functional-equation class | ℚ n=2,3,4; n=1 control | ratios −1/2, −1/4, 3/4; at n=3 value is 0 but coefficient −ζ(3)/(4π²)≠0; at n=1 orders 0≠1 | consistent | analytic germ and n≥2 retained |
| §2.1 Specified continuous Borel class | weights 2,3; identity block | s(ch₂)(ε₂)=−4π²; s(ch₃)(ε₃)=−8π³i; divided values 1,1; extra block contributes 0 | consistent | orientation supplied by explicit calibration gap |
| §2.2 Actual arithmetic regulator | zero, torsion, rational K₅(ℚ) | r(0)=0; mr(x)=0 gives r(x)=0; localization evaluation 3=3, doubled inverse 6≠3 | consistent | actual localization map fixes the construction |
| §2.3 Real isomorphism, torsion kernel, naturality | ℚ n=2,3; ℚ(i); real quadratic n=3 | source/target dimensions (0,0),(1,1),(1,1),(2,2); TR(3)=6=2·3 | consistent | finite-type arithmetic input retained |
| §3.1 Number-field period equals index | zero class; invariants 1/2,−1/2; 1/3,−1/3 | period/index 1/1,2/2,3/3; division dimensions 1,4,9 | consistent | native period_eq_index; generic local criterion imported |
| §3.2 Division algebras split at infinity | degrees 2,3; Hamilton control | dimensions 4,9; infinite invariant 0 gives real matrix algebras; Hamilton invariant 1/2≠0 | consistent | native existence signature; places over 2 and 3 distinguish support |
| §3.3 Borel gauge and transport | ℚ(i), h=3; ℚ, ω↦2ω; h=0 | 4^(−3/2)·2³=1; infinite/finite multipliers 2,1/2 with product 1; empty product 1 | consistent | ω nonzero; all discriminant scaling at infinity |
| §3.4 Norm-one adelic mass specialization | D=(−1,3) over ℚ; degree 3; torus control | Hilbert symbols at 2,3,∞ are −1,−1,+1; dimensions 3,8 and supplied masses 1,1; torus character rank 1≠0 | consistent | Tamagawa numerical theorem explicitly a supplier gap |
| §3.5 All finite factors and Euler product | SL₂(𝔽₂), SL₂(𝔽₃), SL₃(𝔽₂); 2ω_std | 6/8=3/4; 24/27=8/9; 168/256=21/32; doubled gauge mass 3/8, correction 1/2 | consistent | generator condition and ramified factors explicit |
| §3.6 Compact quotient and exact mass identity | index-3 level; split M₂(ℚ); Δ=5 | (m/3)(3v)=mv=1; split modular quotient noncompact; unscaled factor 5^(3/2) | consistent | division and noncompact infinite group hypotheses retained |
| §4.1 Cohomological indecomposable adapter | Λ(x₃,x₅), k[u₂], k | dim H⁸=1 but dim Q⁸=0; Q²(k[u₂])=k and Q⁴=0; ∧⁰0=k with generator 1 | consistent | generic quotient/exterior laws imported |
| §4.2 Invariant-form comparisons | q=0,1,2,3,5; C₂ point stabilizer | i^q=1,i,−1,−i,i; i·(−1)=−i=i³; dim H¹(C₂,𝔽₂)=1≠0 for point | consistent | left-coset bundle and characteristic-zero/torsion-free scope explicit |
| §4.3 Compact primitive period | ℚ n=2,3; ℚ(i) n=2 | absolute classes π²,π³,π⁴/8; abs(−4π²)/π²=4; 4^(−3/2)=1/8 | consistent | no compact period cancellation at zero |
| §4.4 Compact cycles and lower-degree ideal | (j,N)=(1,1),(2,1),(1,2); a=17 | (dimension,factor)=(3,2),(8,9),(6,4); det diag(L_g,I₁₃)=1; x₃∧x₃=0 | consistent | identity-padded group representation replaces unital algebra embedding |
| §4.5 Arithmetic primitive period | j=0,1,2; F=ℚ,n=2 | cumulative classes 1,ζ_F(2),ζ_F(2)ζ_F(3); successive ratios ζ_F(2),ζ_F(3); full rank 1 although base rank 0 | consistent | all divided periods nonzero |
| §4.6 Common compact-fibre line | ℚ n=2,3; ℚ(i); lift matrix | (base,full,fibre)=(0,1,1),(1,1,0),(1,2,1); det [[1,2],[0,1]]=1 | consistent | actual identity on fibre; compatible Serre comparison is a gap |
| §5.1 Primitive determinant, including rank zero | ℚ n=2,3; ℚ(i); real quadratic n=2 | 1/(ζ(2)/π²)=6; phase exponents −2,2,0,−4 are even; Q(√5) scalar 2/75 | consistent | empty determinant included, exponent −Nn |
| §5.2 Transported compact homotopy lattice | ℚ n=2,3,5; imaginary quadratic | covolumes 1,4π,2π,2π; π₅ quotient/Cartan indices 1,2; π₉ indices 2,1 | consistent | no forward definition of regulator covolume |
| §5.3 Integral regulator lattice and covolume | rank 0; 3ℤ; 6ℤ; 3ℚ | covolumes 1,3,6; 3/m→0 in 3ℚ; ℤ+√2ℤ is nondiscrete | consistent | actual real isomorphism supplies discreteness |
| §5.4 Zeta covolume and rational bases | ℚ n=2,3; ℚ(i) n=2,3 | R=1=(−12)(−1/12)=6·(1/6); exponents −2,−3,−5; swapping two columns multiplies determinant by −1 | consistent | conversion R=(2π)^d εR′ derived here |
| §5.5 S-integer and order regulator transport | ℚ n=3,S={2}; degree 1; 3ℤ,2ℤ | K₄(𝔽₂)=0 implies equal images 3ℤ,3ℤ and ratio 1; unit ranks 0,1; lattice ratio 3/2 | consistent | source attribution corrected; transfer uses its finite-resolution domain |
| §6.1 Point quotient and embedding identification | n=1,2,3; z=1,i,1+i; weight-zero control | P₀=(1,0,1), P₁=(0,i,i), P₂=(1,0,1); quotient image ℤ(n)=0; ℤ(n−1) generator coordinate 1 | consistent | point lattice and saturated-subtraction control explicit |
| §6.2 Borel equals twice Beilinson | d=0,1,2; rank-one coordinate 3 | determinant ratios 1,2,4; 3=2·(3/2); covolumes 3=2·(3/2) | consistent | independent universal construction required |
| §6.3 Pure rational Adams weight | a=2,n=3,d=0,1,2; a=1 | scalars 8 and determinants 1,8,64; at a=1 all scalar/determinant values 1 | consistent | native Adams operation supplied, not an assumed eigenspace |

### Each API statement

Rows follow the prose API order in each subsection. The global zero-invariant criterion in the original §3.1 list is imported from ClassFieldTheory and is listed in the duplication table instead of being claimed as a target.

| Statement | Instances tried | Computed values on the two sides | Result | Change |
| --- | --- | --- | --- | --- |
| §1.1: extensionality | ℚ(i), n=2, vectors determined by selected value 3 | (3,−3)=(3,−3); selected value 4 yields (4,−4)≠(3,−3) | consistent | no mathematical change |
| §1.1: equivalence | weight 3, real generator | (−4π²)/(−4π²)=1; inverse sends 1 to −4π² | consistent | no mathematical change |
| §1.1: dimension | ℚ n=2,3; imaginary pair | dimensions 0,1,1; integer ranks 0,1,1 | consistent | no mathematical change |
| §1.1: choice compatibility | two coordinates; conjugate representative | swap determinant −1; representative factor −1 at n=2 and +1 at n=3; absolute factors 1 | consistent | no mathematical change |
| §1.1: native compatibility | weight 2 imaginary pair; weight 3 real coordinate | native/coordinate norms (2π,1),(4π²,1), positive scale factors rather than an isometry | consistent | no mathematical change |
| §1.2: evaluation | ℚ(i)/ℚ, n=3, v=3 | R(3)=(3,3), T(3,3)=6; any map averaging to 3 fails evaluation | consistent | no mathematical change |
| §1.2: degree law | degree two extension, v=3 | TR(3)=6=[E:F]·3; identity degree gives 3=1·3 | consistent | no mathematical change |
| §1.2: functoriality | degree-2 then degree-2 tower | T composite on a constant vector gives 12=2·(2·3); identity gives 3 | consistent | no mathematical change |
| §1.3: limit | ℚ, n=3 | lim ζ(s)/(s+2)=ζ′(−2)=−ζ(3)/(4π²), while ζ(−2)=0 | consistent | no mathematical change |
| §1.3: unit property | ℚ weights 2,3,4 | orders 0,1,0; coefficients −1/12,−ζ(3)/(4π²),1/120 are nonzero | consistent | no mathematical change |
| §1.3: normalization | ℚ weights 2,4; ℚ(i) n=2 | rational ratios −1/2,3/4,−1/2; Q(i) values −G/(6π) versus G/(3π) | consistent | no mathematical change |
| §2.1: stability | trailing identity block | positive-degree reduced character of I is 0; value before/after is 1=1 in Tate coordinates | consistent | no mathematical change |
| §2.1: real structure | imaginary pair n=2; real n=3 | conjugation sends (3,−3) to itself with the twist; n=3 real coordinate 3 is fixed | consistent | no mathematical change |
| §2.1: calibration | ε₂,ε₃ | values −4π²,−8π³i have Tate coordinates 1,1; zero class gives 0 and twice class gives 2 | consistent | no mathematical change |
| §2.2: evaluation | imaginary quadratic, selected regulator value 3 | coordinates (3,−3) in even weight, (3,3) in odd weight | consistent | no mathematical change |
| §2.2: group law | torsion class of order m>0; zero class | m·r(x)=0 forces r(x)=0; r(0)=0; additivity on values 3,4 gives 7 | consistent | no mathematical change |
| §2.2: map identity | integral rational localization of nonzero K₅ class | r_Q(j(x)⊗1)=3=r(x); multiplication of inverse by 2 would give 6 | consistent | no mathematical change |
| §2.3: kernel | rational source rank one and torsion summand | nonzero free coordinate 3 maps nonzero; finite-order coordinate maps to 0 in both directions of kernel criterion | consistent | no mathematical change |
| §2.3: naturality | ℚ(i)/ℚ in weight 3 | R r(1)=(3,3)=r res(1); an averaged restriction gives (3/2,3/2) | consistent | no mathematical change |
| §2.3: transfer | ℚ(i)/ℚ | T(3,3)=6 in odd weight; T(3,−3)=0 in even weight, agreeing with target ranks 1,0 | consistent | no mathematical change |
| §3.1: local formula | empty, denominator-two and denominator-three supports | lcm values 1,2,3 equal division degrees 1,2,3; dimensions 1,4,9 | consistent | no mathematical change |
| §3.1: representatives | period 2, requested degree 6; split class requested degree 3 | M₃(D) has degree 3·2=6, dimension 36; M₃(F) has degree 3; a=0 excluded | consistent | no mathematical change |
| §3.2: existence | invariants 1/3,−1/3 at two finite places | sum 0 and unchanged by division replacement; one invariant alone has sum 1/3≠0 | consistent | no mathematical change |
| §3.2: degree | a=2,3,8 | a²=4,9,64; zero algebra dimension 0 is excluded by DivisionRing | consistent | no mathematical change |
| §3.2: splitting | a=2, infinite invariant 0 versus Hamilton invariant 1/2 | split real target M₂(ℝ) dimension 4; Hamilton dimension 4 but not split | consistent | no mathematical change |
| §3.3: measure identity | F=ℚ(i),h=3 | m∞/(ordinary complex coordinate density)=4^(−3/2)·2³=1 | consistent | no mathematical change |
| §3.3: scaling | ω↦2ω over ℚ and ℚ(i) | infinite factors 2 and 4, finite factors 1/2 and 1/4; products 1 | consistent | no mathematical change |
| §3.3: adelic compatibility | trivial group, h=0, ω=1 or 2 over ℚ | products 1·1=1 and 2·(1/2)=1; character rank is 0 | consistent | no mathematical change |
| §3.3: transport | real chart scalar 2; complex chart scalar 2 | Jacobian multipliers 2 and abs(2)²=4, respectively | consistent | no mathematical change |
| §3.4: finiteness | degree 2 or 3 norm-one group; zero-form control | supplied quotient masses 1,1>0; zero gauge would give 0≠1 | consistent | no mathematical change |
| §3.5: positivity | q=2,a=2,3; q=1 control | denominators 3/4,21/32>0; at q=1 factor 0 is excluded | consistent | no mathematical change |
| §3.5: independence | adjoin one standard q=2 place for SL₂ | correction (3/4)/(3/4)=1, so old and enlarged c_S coincide | consistent | no mathematical change |
| §3.5: level change | index-3 compact open | mass m becomes m/3; at SL₂(𝔽₂) base mass 3/4 becomes 1/4 | consistent | no mathematical change |
| §3.6: adelic identity | principal torsion-free level and index-3 sublevel | vm=1 and (3v)(m/3)=1 with the same global form | consistent | no mathematical change |
| §3.6: commensurability | arithmetic subgroups of index 2,3 | covolumes v,2v,3v; common-intersection ratios are rational, never reciprocal by mistake | consistent | no mathematical change |
| §3.6: normalization | Δ=5,h=3; Δ=4,h=3,r₂=1 | unscaled factor 5^(3/2); complex dxdy comparison factor 4^(3/2)/2³=1 | consistent | no mathematical change |
| §4.1: line structure | Λ(x₃,x₅), degree 8; coefficient field k | Q⁸=0 although H⁸=k; its exterior determinant is ∧⁰0=k with generator 1 | consistent | specialized to the cohomological adapter |
| §4.1: maps | actual quotient map scalar 2, then scalar 3, rank one | induced determinant composite 6=3·2; identity gives 1 | consistent | specialized to the cohomological adapter |
| §4.1: base change | zero/rank-one rational quotient and scalar extension | dimensions 0,1 before/after; empty generator 1⊗1 maps to 1 | consistent | no mathematical change |
| §4.2: evaluation | q=1,2,3,5 | comparison factors i,−1,−i,i; degree-(1+2) product i(−1)=−i | consistent | no mathematical change |
| §4.2: unit | degree-zero constant | j(1)=1; zero map would give 0 | consistent | no mathematical change |
| §4.2: naturality | identity block inclusion and identity subgroup restriction | constant 1 maps to 1 on both routes; odd primitive value c remains c, not size·c | consistent | no mathematical change |
| §4.2: real descent | degree 3, complex comparison value i on a real generator | i³·i=1 is real; forgetting correction leaves i nonreal | consistent | no mathematical change |
| §4.3: basis change | rank-one rational basis rescaling by 2 | determinant class multiplier abs(2)=2; rescaling by −1 gives absolute multiplier 1 | consistent | no mathematical change |
| §4.3: stability | primitive degree 3 for a=2 and a=3 | suspended character period −4π² in both sizes; absolute period ratio 1 | consistent | no mathematical change |
| §4.4: dimension | (j,N)=(1,1),(2,1),(1,2),(2,2) | N(j²+2j)=3,8,6,16, matching the full top wedge degree | consistent | no mathematical change |
| §4.4: nonvanishing | j=2, N=1 or 2 | restriction factors 3²=9 and 3⁴=81, both nonzero; the false scalar 3 fails | consistent | no mathematical change |
| §4.4: exterior ideal | Λ(x₃,x₅), earlier ideal generated by x₃ | x₃∧x₃=0 and x₃∧(x₃x₅)=0; x₃∧x₅≠0 if x₅ is not earlier | consistent | no mathematical change |
| §4.5: level independence | index-3 arithmetic restriction in stable degree | restriction followed by transfer is 3·id, hence determinant factor 3^N∈ℚˣ; rational inverse exists | consistent | no mathematical change |
| §4.5: stability | j=0,1,2 cumulative periods | 1,ζ_F(2),ζ_F(2)ζ_F(3); stabilization preserves successive nonzero classes ζ_F(2),ζ_F(3) | consistent | no mathematical change |
| §4.6: exactness | ℚ n=2 and n=3 | kernel dimensions 0 and 1; full/fibre dimensions (1,1),(1,0), so rank-nullity gives 0 and 1 | consistent | no mathematical change |
| §4.6: determinants | imaginary quadratic, base/fibre ranks 1,1 | identity comparison on fibre contributes determinant 1; det(full)=det(base)·1 | consistent | no mathematical change |
| §4.6: choice independence | lift change by twice a base generator | block matrix [[1,2],[0,1]] determinant 1; fibre scaling by 2 would give 2 | consistent | no mathematical change |
| §5.1: empty line | ℚ n=2; real quadratic n=2 | ∧⁰0 generator 1 maps to 1, and det(empty)=1 on both sides | consistent | no mathematical change |
| §5.1: functoriality | identity stabilization; finite-index rational restriction | empty comparison is 1 through both; nonempty rational line changes by a nonzero rational, e.g. 2 | consistent | no mathematical change |
| §5.1: realness | signatures (1,0),(0,1),(2,0),(1,1), weights 2,3 | E pairs (−2,2),(0,0),(−4,4),(−2,2), equal the closed formulas and all even | consistent | no mathematical change |
| §5.2: integral index | ℚ n=3,5 | Cartan indices 2,1; projection indices 1,2; composites 2 in both degrees | consistent | no mathematical change |
| §5.2: complex factor | one complex place, n=2 or 3 | one coordinate factor 2π in each weight, not (2π)² | consistent | no mathematical change |
| §5.2: rank zero | totally real even weight | d=0, ε=1, (2π)^0·1=1 | consistent | no mathematical change |
| §5.3: membership | free coordinate 3; candidate v=6 and v=1 | 6∈3ℤ with preimage 2; 1∉3ℤ since 1/3 is not integral | consistent | no mathematical change |
| §5.3: universal property | A=ℤ⊕ℤ/2 with r(k,t)=3k | quotient maps (1,0),(1,1) both to 3; torsion quotient and image are each ℤ | consistent | no mathematical change |
| §5.3: topology and span | 3ℤ and ℤ+√2ℤ in ℝ | first has gap 3 and real span ℝ; second has arbitrarily small nonzero differences and cannot be the isomorphic image of a rank-one free quotient | consistent | no mathematical change |
| §5.3: measure | basis value 3; unimodular sign change; index-2 sublattice | covolumes 3,3,6; empty case is 1 | consistent | no mathematical change |
| §5.4: special value | ℚ n=2 | R=1=(−12)(−1/12); q=−12 is nonzero but negative | consistent | no mathematical change |
| §5.4: positive value | ℚ n=2 and real quadratic Q(√5) n=2 | ratios 6 and 75/2, positive rationals, to positive-value scalars 1/6 and 2/75 | consistent | no mathematical change |
| §5.4: image | rank-one integral image 3ℤ | rational image 3ℚ equals ℚ-span(3ℤ); 3/2 lies in both, but not in 3ℤ | consistent | no mathematical change |
| §5.4: rational basis | two columns swapped; one column doubled | determinant multipliers −1 and 2; absolute multipliers 1 and 2 | consistent | no mathematical change |
| §5.5: maps | S=∅⊂{2}⊂{2,3}, ℚ,n=3 | each image 3ℤ; composite gives 3=3 on an integral generator; covolume ratios 1 | consistent | no mathematical change |
| §5.5: covolume | common sublattice 6ℤ in 3ℤ and 2ℤ | indices 2,3; covolume ratio 3/2=3/2 by the imported identity | consistent | native lattice identity applied |
| §6.1: evaluation | n=2, z=i and z=1+i | cosets agree mod ℝ; both project to i | consistent | no mathematical change |
| §6.1: inverse laws | n=2,z=1+i; n=3,z=1+i | z−P(z)=1∈ℝ(2), i∈ℝ(3); P(i)=i and P(1)=1 on the surviving axes | consistent | no mathematical change |
| §6.1: integral structure | n=3 and n=2 Tate generators | −4π² and 2πi have coordinate 1 in ℝ(n−1); ℤ(n) maps to 0 in the quotient | consistent | explicit point lattice |
| §6.1: functoriality | ℚ(i)/ℚ in weights 2,3 | point trace gives 3+(−3)=0 and 3+3=6, identical with T | consistent | no mathematical change |
| §6.2: map equality | rank-one class with Borel value 3 | Beilinson value 3/2, so 3=2·(3/2); zero Beilinson value would give 0≠3 | consistent | no mathematical change |
| §6.2: ordered determinants | ranks d=0,1,2 | ordered determinant factors 2^d=1,2,4 | consistent | no mathematical change |
| §6.2: covolume | same integral free rank-one group | Borel image 3ℤ, Beilinson image (3/2)ℤ; covolumes 3 and 3/2 have ratio 2 | consistent | no mathematical change |
| §6.3: compatibility | n=3,a=2, regulator coordinate 3 | r(ψ²x)=8·3=24=2³r(x); injectivity then identifies ψ²x=8x | consistent | no mathematical change |
| §6.3: determinant | n=3,a=2,d=0,1,2 | determinants 2^0=1,2³=8,2⁶=64; a=1 gives 1 | consistent | no mathematical change |

### Every subsection Check

The Check numbers below are their positions in the delivered README. This includes the three added negative controls; no Check claims a Lean declaration.

| Statement | Instances tried | Computed values | Result | Change |
| --- | --- | --- | --- | --- |
| §1.1 Check 1 | ℚ n=2,3 | t=−t gives t=0, d=0; odd weight gives d=1 | consistent | preserved; conversion Checks refer to the lattice in §5.2 |
| §1.1 Check 2 | ℚ(i) n=2,3 | pairs (3,−3),(3,3), each with dimension 1 rather than 2 | consistent | preserved; conversion Checks refer to the lattice in §5.2 |
| §1.1 Check 3 | weight-3 Tate generator | (−4π²)/(−4π²)=1; untwisted value −4π²≠1 | consistent | preserved; conversion Checks refer to the lattice in §5.2 |
| §1.1 Check 4 | totally real, even n | V=C={0}; point fundamental domain has mass 1 | consistent | preserved; conversion Checks refer to the lattice in §5.2 |
| §1.1 Check 5 | native versus coordinate norms | weight 2: (2π,1); weight 3: (4π²,1); both scale factors positive | consistent | preserved; conversion Checks refer to the lattice in §5.2 |
| §1.2 Check 1 | ℚ(i)/ℚ n=2 | T(3,−3)=0, whereas taking only first coordinate gives 3 | consistent | preserved; conversion Checks refer to the lattice in §5.2 |
| §1.2 Check 2 | ℚ(i)/ℚ n=3 | R(3)=(3,3); TR(3)=6, whereas averaged trace gives 3 | consistent | preserved; conversion Checks refer to the lattice in §5.2 |
| §1.2 Check 3 | real quadratic and identity extension | T(2,3)=5; R(3)=(3,3); identity T(3)=3 | consistent | preserved; conversion Checks refer to the lattice in §5.2 |
| §1.3 Check 1 | ℚ n=2 | (−1/12)/(1/6)=−1/2 | consistent | preserved; conversion Checks refer to the lattice in §5.2 |
| §1.3 Check 2 | ℚ n=3 | ζ(−2)=0; ζ′(−2)=−ζ(3)/(4π²)≠0 | consistent | preserved; conversion Checks refer to the lattice in §5.2 |
| §1.3 Check 3 | ℚ n=4 | (1/120)/(1/90)=3/4 | consistent | preserved; conversion Checks refer to the lattice in §5.2 |
| §1.3 Check 4 | ℚ n=1 | actual order at 0 is 0; proposed odd-weight order would be 1 | consistent | preserved; conversion Checks refer to the lattice in §5.2 |
| §2.1 Check 1 | n=2 | (2πi)²=−4π², divided coordinate 1 | consistent | preserved; conversion Checks refer to the lattice in §5.2 |
| §2.1 Check 2 | n=3 | (2πi)³=−8π³i; ch₃=c₃/2 modulo decomposables, so replacing it by c₃ doubles the value | consistent | preserved; conversion Checks refer to the lattice in §5.2 |
| §2.1 Check 3 | identity block | positive-degree reduced character contribution 0; value before and after 1=1 | consistent | preserved; conversion Checks refer to the lattice in §5.2 |
| §2.2 Check 1 | zero and order-m torsion | r(0)=0; m·r(x)=0 with m>0 gives r(x)=0 | consistent | preserved; conversion Checks refer to the lattice in §5.2 |
| §2.2 Check 2 | nonzero K₅(ℚ) coordinate 3 | direct and localized values 3=3; doubled inverse gives 6≠3 | consistent | preserved; conversion Checks refer to the lattice in §5.2 |
| §2.2 Check 3 | imaginary pair | weight-2 (3,−3), weight-3 (3,3), satisfying simultaneous conjugation | consistent | preserved; conversion Checks refer to the lattice in §5.2 |
| §2.3 Check 1 | ℚ n=2,3 | dimensions (0,0),(1,1); zero-dimensional comparison determinant 1 | consistent | preserved; conversion Checks refer to the lattice in §5.2 |
| §2.3 Check 2 | ℚ(i); real quadratic n=3 | dimensions (1,1),(1,1),(2,2) | consistent | preserved; conversion Checks refer to the lattice in §5.2 |
| §2.3 Check 3 | ℚ(i)/ℚ | TR(3)=6=2·3 in odd weight; T(3,−3)=0 in even weight | consistent | preserved; conversion Checks refer to the lattice in §5.2 |
| §3.1 Check 1 | zero class; requested a=3; a=0 control | empty lcm 1, division dimension 1; M₃(F) dimension 9; size 0 gives zero ring and no central simple representative | consistent | preserved; conversion Checks refer to the lattice in §5.2 |
| §3.1 Check 2 | two 1/2 invariants | sum 1=0 mod ℤ; lcm=2=index; dimension 4 | consistent | preserved; conversion Checks refer to the lattice in §5.2 |
| §3.1 Check 3 | 1/3 and −1/3; one missing | sum 0, lcm 3, dimension 9; singleton sum 1/3≠0 and no global class | consistent | preserved; conversion Checks refer to the lattice in §5.2 |
| §3.1 Check 4 | degree 8; dyadic prescription | dimension 64; unramified order-8 χ₂ has χ₂(16)=χ₂(2)^4=−1, obstruction nonzero | consistent | preserved; conversion Checks refer to the lattice in §5.2 |
| §3.2 Check 1 | ℚ, finite invariants at 2 and 3 | 1/2+1/2=0 mod ℤ, real invariant 0, degree 2 and dimension 4 | consistent | preserved; conversion Checks refer to the lattice in §5.2 |
| §3.2 Check 2 | degree 3 | 1/3+(−1/3)=0, degree 3 and dimension 9; infinite invariants 0 | consistent | preserved; conversion Checks refer to the lattice in §5.2 |
| §3.2 Check 3 | Hamilton quaternion algebra | dimension 4 but real invariant 1/2, so not split at infinity | consistent | preserved; conversion Checks refer to the lattice in §5.2 |
| §3.3 Check 1 | ℚ, gauge doubled | 2 at infinity times 1/2 at 2 equals 1 | consistent | preserved; conversion Checks refer to the lattice in §5.2 |
| §3.3 Check 2 | ℚ(i),h=3 | Δ-factor 4^(−3/2)=1/8; complex additive factor 2³=8; product 1 | consistent | preserved; conversion Checks refer to the lattice in §5.2 |
| §3.3 Check 3 | trivial group | ω=1 gives masses 1,1; ω=2 gives 2,1/2; both global products 1 | consistent | preserved; conversion Checks refer to the lattice in §5.2 |
| §3.3 Check 4 | zero gauge | mass 0, not a positive rational multiple of the positive zeta product | consistent | preserved; conversion Checks refer to the lattice in §5.2 |
| §3.4 Check 1 | (−1,3) over ℚ | Hilbert symbols at 2,3,∞: −1,−1,+1; dimension 3 and supplied Tamagawa mass 1 | consistent | preserved; conversion Checks refer to the lattice in §5.2 |
| §3.4 Check 2 | degree-three division algebra | norm-one dimension 3²−1=8; supplied mass 1, not 3 | consistent | preserved; conversion Checks refer to the lattice in §5.2 |
| §3.4 Check 3 | ω↦2ω over ℚ | product multiplier 2·(1/2)=1, so masses 1=1 | consistent | preserved; conversion Checks refer to the lattice in §5.2 |
| §3.4 Check 4 | norm-one torus versus division quaternion group | dimensions 1 versus 3; geometric character ranks 1 versus 0, excluding torus | consistent | preserved; conversion Checks refer to the lattice in §5.2 |
| §3.5 Check 1 | SL₂(𝔽₂) | count 6, density 6/8=3/4=1−2^(−2) | consistent | preserved; conversion Checks refer to the lattice in §5.2 |
| §3.5 Check 2 | SL₃(𝔽₂) | count 168, density 168/256=21/32=(3/4)(7/8) | consistent | preserved; conversion Checks refer to the lattice in §5.2 |
| §3.5 Check 3 | exceptional place mass b=3/8 | correction 4b/3=1/2; deleting it changes finite mass by factor 2 | consistent | preserved; conversion Checks refer to the lattice in §5.2 |
| §3.5 Check 4 | ω=2ω_std at 2 | actual mass (1/2)(3/4)=3/8≠3/4; correction (3/8)/(3/4)=1/2 | consistent | added negative control |
| §3.5 Check 5 | q=1 control | 1−1^(−2)=0; total inverse 0; actual residue cardinalities ≥2 prevent this | consistent | preserved; conversion Checks refer to the lattice in §5.2 |
| §3.6 Check 1 | index-3 level | finite mass m/3, infinite mass 3v, product vm=1 | consistent | preserved; conversion Checks refer to the lattice in §5.2 |
| §3.6 Check 2 | Hamilton algebra at infinity | H(ℝ) compact; infinite strong-approximation noncompactness condition fails | consistent | preserved; conversion Checks refer to the lattice in §5.2 |
| §3.6 Check 3 | M₂(ℚ) | split arithmetic quotient has finite volume but is noncompact; division condition fails | consistent | preserved; conversion Checks refer to the lattice in §5.2 |
| §3.6 Check 4 | ℚ(√5),a=2 | unscaled/Borel volume factor 5^((4−1)/2)=5^(3/2) | consistent | preserved; conversion Checks refer to the lattice in §5.2 |
| §4.1 Check 1 | Λ(x₃,x₅), degree 8 | H⁸ has basis x₃x₅ and dimension 1; Q⁸ dimension 0 | consistent | preserved; conversion Checks refer to the lattice in §5.2 |
| §4.1 Check 2 | Λ(x₃) | Q³=k has dimension 1; x₃²=0 and Q⁶=0 | consistent | preserved; conversion Checks refer to the lattice in §5.2 |
| §4.1 Check 3 | A=k concentrated at zero | Q=0; its top exterior power is k and empty generator 1 | consistent | preserved; conversion Checks refer to the lattice in §5.2 |
| §4.1 Check 4 | k[u₂] | Q²=k[u₂], Q⁴=0; u₂²≠0 in H⁴, so H⁴ is not Q⁴ | consistent | preserved; conversion Checks refer to the lattice in §5.2 |
| §4.2 Check 1 | degree 0 | i⁰=1 and j(1)=1; zero map gives 0 | consistent | preserved; conversion Checks refer to the lattice in §5.2 |
| §4.2 Check 2 | degrees 1,2,3 | i·(−1)=−i=i³, so multiplicativity holds | consistent | preserved; conversion Checks refer to the lattice in §5.2 |
| §4.2 Check 3 | degrees 3,5 | i³=−i; i⁵=i; constant correction −i fails in degree 5 | consistent | preserved; conversion Checks refer to the lattice in §5.2 |
| §4.2 Check 4 | C₂ point stabilizer, coefficients 𝔽₂ | dim H^q(C₂,𝔽₂)=1 for every q≥0; ordinary point has dimension 0 for q>0 | consistent | preserved; conversion Checks refer to the lattice in §5.2 |
| §4.3 Check 1 | ℚ,n=2 | compact period class π²; abs(−4π²)/π²=4 | consistent | preserved; conversion Checks refer to the lattice in §5.2 |
| §4.3 Check 2 | ℚ,n=3 | primitive character degree gives π³, not π² | consistent | preserved; conversion Checks refer to the lattice in §5.2 |
| §4.3 Check 3 | ℚ(i),n=2 | Δ=4; 4^(−3/2)=1/8; period class π⁴/8≠0 | consistent | preserved; conversion Checks refer to the lattice in §5.2 |
| §4.4 Check 1 | j=1,N=1 | dimension 3, restriction 2; period class ζ(2) | consistent | preserved; conversion Checks refer to the lattice in §5.2 |
| §4.4 Check 2 | j=2,N=1 | dimension 8, restriction 9; cumulative class ζ(2)ζ(3); quotient ζ(3) | consistent | preserved; conversion Checks refer to the lattice in §5.2 |
| §4.4 Check 3 | j=1,N=2 | dimension 6 and restriction 4 rather than 2 | consistent | preserved; conversion Checks refer to the lattice in §5.2 |
| §4.4 Check 4 | j=1,N=1,a=17 | a−4=13, padded determinant Nrd(g)²=1; unital module dimension 17 is not divisible by 4 | consistent | added negative control |
| §4.4 Check 5 | Λ(x₃,x₅) | x₃∧x₃=0; x₃∧x₅≠0, so only the earlier-generator ideal is killed | consistent | preserved; conversion Checks refer to the lattice in §5.2 |
| §4.5 Check 1 | j=0,1 | products 1 and ζ_F(2); ratio ζ_F(2)>0 | consistent | preserved; conversion Checks refer to the lattice in §5.2 |
| §4.5 Check 2 | j=2 | ζ_F(2)ζ_F(3)/ζ_F(2)=ζ_F(3), denominator >0 | consistent | preserved; conversion Checks refer to the lattice in §5.2 |
| §4.5 Check 3 | ℚ,n=2 | compact-dual rank d=0; full primitive rank N=1, so ζ(2) survives | consistent | preserved; conversion Checks refer to the lattice in §5.2 |
| §4.6 Check 1 | ℚ,n=2 | (d,N,N−d)=(0,1,1); cancelled base determinant 1 | consistent | preserved; conversion Checks refer to the lattice in §5.2 |
| §4.6 Check 2 | ℚ,n=3 | (1,1,0); fibre determinant empty and equals 1 | consistent | preserved; conversion Checks refer to the lattice in §5.2 |
| §4.6 Check 3 | ℚ(i), both parities | (1,2,1); full determinant two rows, base determinant one row | consistent | preserved; conversion Checks refer to the lattice in §5.2 |
| §4.6 Check 4 | splitting change | det [[1,2],[0,1]]=1; replacing fibre identity by scalar 2 would give 2 | consistent | preserved; conversion Checks refer to the lattice in §5.2 |
| §5.1 Check 1 | ℚ,n=2 | comparison 1, scalar ζ(2)/π²=1/6, ratio 6∈ℚˣ | consistent | preserved; conversion Checks refer to the lattice in §5.2 |
| §5.1 Check 2 | ℚ,n=3 | raw class ζ(3)/π³; E=2, i^E=−1; converted exponent −2 | consistent | preserved; conversion Checks refer to the lattice in §5.2 |
| §5.1 Check 3 | ℚ(i),n=2,3 | N=2,d=1; E=0 in both; raw classes 2ζ_F(2)/π⁴ and 2ζ_F(3)/π⁶ | consistent | preserved; conversion Checks refer to the lattice in §5.2 |
| §5.1 Check 4 | real quadratic,n=2 | N=2,d=0,E=−4,i^E=1; Q(√5) positive scalar 2/75 | consistent | preserved; conversion Checks refer to the lattice in §5.2 |
| §5.2 Check 1 | ℚ,n=2 | d=0,ε=1; transported lattice covolume 1 | consistent | preserved; conversion Checks refer to the lattice in §5.2 |
| §5.2 Check 2 | ℚ,n=3 | d=1,ε=2; Cartan index 2 and quotient index 1; covolume 4π | consistent | preserved; conversion Checks refer to the lattice in §5.2 |
| §5.2 Check 3 | ℚ,n=5; Q₈ matrix witness | quotient index 2, Cartan index 1, covolume 2π; C(I)=I; (gh)(gh)ᵗ=ggᵗ=−I while gh≠hg | consistent | preserved; conversion Checks refer to the lattice in §5.2 |
| §5.2 Check 4 | imaginary quadratic,n=2,3 | d=1,r₁=0,ε=1; covolumes 2π,2π | consistent | preserved; conversion Checks refer to the lattice in §5.2 |
| §5.3 Check 1 | ℚ,n=2 | zero free quotient, lattice {0} in {0}, determinant and covolume 1 | consistent | preserved; conversion Checks refer to the lattice in §5.2 |
| §5.3 Check 2 | rank one,t=3 | 3ℤ covolume 3; 6ℤ covolume 6; Beilinson image (3/2)ℤ covolume 3/2 | consistent | preserved; conversion Checks refer to the lattice in §5.2 |
| §5.3 Check 3 | ℤ+√2ℤ⊂ℝ | source rank 2, target dimension 1; arbitrarily small nonzero combinations exclude discreteness | consistent | preserved; conversion Checks refer to the lattice in §5.2 |
| §5.3 Check 4 | rational image 3ℚ | 3/m→0 with 3/m≠0 for every m≥1; hence not the lattice 3ℤ | consistent | preserved; conversion Checks refer to the lattice in §5.2 |
| §5.4 Check 1 | ℚ,n=2 | R=1, leading value −1/12, factor −12; positive-value scalar 1/6, factor 6 | consistent | preserved; conversion Checks refer to the lattice in §5.2 |
| §5.4 Check 2 | ℚ,n=3 | d−Nn=1−3=−2, versus raw cohomological exponent −3 | consistent | preserved; conversion Checks refer to the lattice in §5.2 |
| §5.4 Check 3 | ℚ(i),n=2,3 | √Δ=2,d=1; exponents 1−4=−3 and 1−6=−5 | consistent | preserved; conversion Checks refer to the lattice in §5.2 |
| §5.4 Check 4 | rank-two rational bases | swap determinant −1, absolute multiplier 1; doubling a column gives multiplier 2 | consistent | preserved; conversion Checks refer to the lattice in §5.2 |
| §5.5 Check 1 | empty S | map is original regulator; image 3ℤ and ratio 1 | consistent | preserved; conversion Checks refer to the lattice in §5.2 |
| §5.5 Check 2 | a prime over 2,n=2 or 3 | residue K₂=0 or K₄=0; surjective odd localization gives identical images and unchanged rank dₙ | consistent | preserved; conversion Checks refer to the lattice in §5.2 |
| §5.5 Check 3 | ℤ→ℤ[1/2], degree 1 | unit ranks 0,1, so the higher-degree equivalence cannot extend to K₁ | consistent | preserved; conversion Checks refer to the lattice in §5.2 |
| §5.5 Check 4 | common sublattice 6ℤ | indices in 3ℤ,2ℤ are 2,3; covolume(3ℤ)/covolume(2ℤ)=3/2 | consistent | preserved; conversion Checks refer to the lattice in §5.2 |
| §6.1 Check 1 | n=2 | P₁(1)=0,P₁(i)=i; class of i survives modulo ℝ(2)=ℝ | consistent | preserved; conversion Checks refer to the lattice in §5.2 |
| §6.1 Check 2 | n=3 | P₂(1)=1,P₂(i)=0; kernel ℝ(3)=iℝ | consistent | preserved; conversion Checks refer to the lattice in §5.2 |
| §6.1 Check 3 | z=1+i,n=2,3 | projections i,1; differences 1,i in ℝ(2),ℝ(3); quotient inverse compositions are identities | consistent | preserved; conversion Checks refer to the lattice in §5.2 |
| §6.1 Check 4 | n=1 and saturated n=0 extension | P₀(1+i)=1 at n=1; saturated n=0 gives P₀(1)=1, failing annihilation of ℝ(0); geometric H¹_D at weight 0 is 0 | consistent | added negative control |
| §6.1 Check 5 | ℚ,n=2,3 | conjugation-fixed quotient dimensions 0,1; untwisted invariants would wrongly give 1 at n=2 | consistent | preserved; conversion Checks refer to the lattice in §5.2 |
| §6.2 Check 1 | ℚ,n=2 | empty determinant 1=2⁰·1, no zeta value inferred | consistent | preserved; conversion Checks refer to the lattice in §5.2 |
| §6.2 Check 2 | ℚ,n=3; imaginary quadratic,n=2,3 | d=1 and determinant factor 2 in each case | consistent | preserved; conversion Checks refer to the lattice in §5.2 |
| §6.2 Check 3 | real quadratic,n=3 | d=2, factor 2²=4 rather than 2 | consistent | preserved; conversion Checks refer to the lattice in §5.2 |
| §6.2 Check 4 | rank-one coordinate 3 | 3=2·(3/2); setting r_Be=0 instead gives 0≠3 | consistent | preserved; conversion Checks refer to the lattice in §5.2 |
| §6.3 Check 1 | ℚ,n=3,a=2 | scalar and rank-one determinant 2³=8 | consistent | preserved; conversion Checks refer to the lattice in §5.2 |
| §6.3 Check 2 | real quadratic,n=3,a=2 | scalar 8 on two coordinates; determinant 8²=64 | consistent | preserved; conversion Checks refer to the lattice in §5.2 |
| §6.3 Check 3 | ℚ,n=2,a=2 | d=0, determinant 2^(2·0)=1 rather than 4 | consistent | preserved; conversion Checks refer to the lattice in §5.2 |
| §6.3 Check 4 | a=1 | scalar 1^n=1, determinant 1^(nd)=1 for every d; no a=0 assertion | consistent | preserved; conversion Checks refer to the lattice in §5.2 |

### Conventions, supplier requirements and additional examples

| Statement | Instances tried | Computed values on the two sides | Result | Change |
| --- | --- | --- | --- | --- |
| Signature/positive discriminant convention | ℚ, ℚ(i), ℚ(√5) | (N,r₁,r₂,Δ)=(1,1,0,1),(2,0,1,4),(2,2,0,5); N=r₁+2r₂ in each | consistent | explicit native inputs |
| Tate convention and representative signs | weights 2,3; pair exchanged | (2πi)¹=2πi, (2πi)²=−4π²; divided conjugate signs −1,+1; measure multipliers 1,1 | consistent | no change |
| Determinant/covolume conventions | 3ℤ,6ℤ; rank zero; two-column swap | covolumes 3,6,1; signed determinant multiplier −1, absolute multiplier 1 | consistent | t≠0 explicit for a line lattice |
| Integer exponent convention | ℚ,n=3; ℚ(i),n=2 | d−Nn=−2,−3; natural subtraction would give 0,0 and false exponents | consistent | integer powers specified |
| Chern/suspension convention | u² and −u³ | ch(u)=−v, so ch(u²)=v² and ch(−u³)=v³; Tate-divided evaluations 1,1 | consistent | explicit orientation in gap |
| Conventions Check 1 | weight-two imaginary pair; weight-three real generator | (3,−3), real even coordinate 0; −4π² divided by −4π²=1 | consistent | preserved |
| Conventions Check 2 | q=1,2,3,5; ℚ,n=3 phase | i·(−1)=−i=i³; i⁵=i; E=2 gives −1∈ℚˣ | consistent | preserved |
| Conventions Check 3 | line and empty lattice | 3ℤ→3,6ℤ→6, zero-dimensional lattice→1 | consistent | nonzero line parameter explicit |
| Conventions Check 4 | ℚ ω↦2ω; complex chart; ℚ(i),h=3 | 2·(1/2)=1; abs(2)²=4; 4^(−3/2)·2³=1 | consistent | preserved |
| Coset direction/Cartan representative convention | g=diag(i,−i), h=[[0,1],[−1,0]] | g²=h²=−I; gh=−hg; ggᵗ=(gh)(gh)ᵗ=−I; arbitrary representative g is not well defined on the coset | consistent | left/right models explicitly transported |
| Field/characteristic/universe scope | zero ring; char 2; imaginary quadratic real embeddings | zero ring has no Field instance; ℤ/2 has no NumberField instance; ℚ(i) has zero real embeddings and two complex ones, giving one selected pair | consistent | no vacuous replacement carrier |
| All maps have specified domains | identity extension and zero coefficient | restriction/trace on V give 3=3; zero cochain coefficients give the zero vector space; an unrelated scalar-2 map gives 6≠3 | consistent | actual maps rather than arbitrary equivalences |
| Gap: stable-finite-range | N=1,q=5; N=2,q=3 | a−1>20 gives a≥22; a−1>24 gives a≥26; both imply the required conservative stable inequality | consistent | kept with ArithmeticKTheory §3.4 |
| Gap: integral-chern-calibration | n=2,3 | ε₂=u² and ε₃=−clutch(u³); divided character values 1,1; unscaled evaluations −4π²,−8π³i | consistent | self-contained suspension/orientation request |
| Gap: cyclic-local-degrees | a=2,8; local invariants 1/2,1/8 | 2·(1/2)=1≡0 and 8·(1/8)=1≡0; fixed unramified χ₂ of order 8 gives obstruction χ₂(16)=−1 | consistent | variable local extensions required |
| Gap: inner-type-a-structure | a=2,3 | geometric split models SL₂,SL₃ have dimensions 3,8; norm-one torus dimension 1 is excluded | consistent | generic structure stays upstream |
| Gap: adelic-rational-masses | index-2 open at SL₂(ℤ₂); doubled gauge | masses (3/4)/2=3/8; doubled gauge also gives 3/8; both positive rational | consistent | all finite places and generator qualification |
| Gap: classical-tamagawa-proof | degree-two division group; gauge 2ω | numerical mass required 1; gauge product 2·(1/2)=1; no regulator quantity used | consistent | kept with AdelicAlgebraicGroups |
| Gap: order-finite-generation | ℤ[2i]⊂ℤ[i]; candidate dense image | ring index 2 does not compute a K-image index; ℤ+√2ℤ has finite generation but nondiscrete image, whereas the real-isomorphism plus finite-generation route gives a lattice | consistent | no unsupported inference from rational dimension alone |
| Gap: universal-deligne | point in weights 1,2,3 | complex point real H¹ dimensions 1,1,1; real point fixed dimensions 1,0,1; unit 2 at weight 1 normalizes to log 2≠0 | consistent | independent normalization, no conclusion as hypothesis |
| Gap: infinitesimal-classifying-comparison | point; dual-number matrix I+εX | normalized constant cosimplicial complex N⁰=ℝ,N^q=0 for q>0; (I+εX)(I+εY)=I+ε(X+Y) since ε²=0, retaining tangent dimension 4 for GL₂ | consistent | infinitesimal model not replaced by its reduced point |
| Gap: graded-indecomposable-api | Λ(x₃,x₅); ordinary cotangent control | x₃x₅=−x₅x₃≠0; dim Q⁸=0 but dim H⁸=1; ordinary commutative Ideal.Cotangent cannot directly serve as this graded functor | consistent | generic extension belongs to CharacteristicClasses Part II |
| Gap: multiplicative-serre-comparison | ℚ,n=2; fibre map scalar 2 control | base/full/fibre ranks (0,1,1); required fibre determinant 1, alternative 2 would not cancel | consistent | self-contained bundles and stable range |
| Regular-representation determinant identity | D splits to M_d, d=2,3 | left action is d copies of the defining action: det L_g=(det g)^d=1 on SL_d; wedge factors 2¹=2 and 3²=9 | consistent | identity padding preserves determinant |
| Cycle bound supplies total-degree range | j=1,N=1,a=17; j=2,N=1,a=37 | top degrees 3,8; a−1=16>12 and 36>32, respectively | consistent | range needed for period extraction explicit |
| Two finite places exist | primes above (2),(3) in O_F | contractions are distinct ideals (2)≠(3), so the primes differ; invariant sum 1/a−1/a=0 | consistent | lying-over input added |
| Nonreduced transfer control | E=𝔽_p(t), F=𝔽_p(t^p), F′=E | E⊗_F E≅E[ε]/ε^p has one residue factor of length p; transfer/base-change multiplicity p, versus p distinct factors of length 1 in separable degree p | consistent | the generic supplier retains lengths; number fields are separable |
| Layer 5 totally real example Check 1 | ℚ,n=2 | (−1/12)/(−1/2)=1/6; reciprocal 6; 6·(1/6)=1 | consistent | preserved |
| Layer 5 totally real example Check 2 | ℚ,n=4 | (1/120)/(3/4)=1/90; reciprocal 90; 90·(1/90)=1 | consistent | preserved |
| Layer 5 totally real example Check 3 | n=2k,N=1,2 | d=0; exponents −2k,−4k; at k=1,Q(√5), scalar √5ζ_F(2)/π⁴=2/75>0 | consistent | preserved |
| Layer 5 totally real example Check 4 | ℚ(i),n=2 | r₂=d=1, so determinant has one row rather than zero; raw scalar 2ζ_F(2)/π⁴ and converted class 2ζ_F(2)/π³ | consistent | preserved |

| Gap: splitting-degree-index | ℍ over ℝ split by ℂ; split M₃(ℚ); purely inseparable degree-p field extension | index/degrees (2,2),(1,2),(1,p), giving divisibilities 2∣2,1∣2,1∣p; division-module equation d²k=d[L:K] at d=2,L=ℂ gives 4=4 | consistent | generic extension requested from SemisimpleAlgebras Part II |

No numerical counterexample remains to a delivered statement. The important negative controls are retained as negative controls: a rank-zero real regulator does not prove the zeta value; a dense rational regulator image is not a lattice; finite generation alone does not give a discrete subgroup; an integral non-generating gauge has the wrong standard local mass; a unital division-algebra representation cannot have arbitrary padded size; a merely dimension-matched comparison does not fix the fibre scalar; the zero or rescaled regulator fails its independent calibration; and the torus, split nondivision algebra, characteristic-two stabilizer, weight-one field group and weight-zero projection lie outside the hypotheses where indicated.

## Elaboration and explicit-binder audit

The prescribed `lake env lean` elaboration was run from the content checkout on `packages/BorelRegulators/Suggested.lean`, using its absolute tool argument. Before elaboration the missing object files were built with exactly the two permitted targeted commands, `lake build TauCeti.Algebra.CentralSimple.Index` and `lake build TauCeti.Algebra.BrauerGroup.Group`. Both builds completed successfully (3373 and 3387 dependency jobs, respectively); no bare build, update or cache command was run.

The acceptance file exited 0. There were exactly **2 `sorry` warnings**, **0 errors** and **0 other messages**. With the diagnostic path rendered repository-relative, the output was:

```text
packages/BorelRegulators/Suggested.lean:45:8: warning: declaration uses `sorry`
packages/BorelRegulators/Suggested.lean:54:8: warning: declaration uses `sorry`
```

One scratch file containing the acceptance declarations followed by `#check @name` for every declaration was elaborated once successfully. It also checked the native CSA/Brauer/index/splitting and exterior-power/lattice inputs. There were two admission warnings and the requested type displays, with no error or other warning. Comparing the two elaborated types with the README confirmed:

- The period-index theorem quantifies over F, Field F, NumberField F and A : CSA in the same universe; the conclusion is the actual Brauer order equal to the native index. NumberField did not silently disappear.
- The division-existence theorem retains F, Field F, NumberField F, a : ℕ and the hypothesis 2≤a; it existentially binds the actual division ring, F-algebra, centrality and finite dimension. Its two splitting clauses use the algebra structures induced by the quantified embeddings F→ℝ and F→ℂ. No needed binder disappeared.

No Lean signature needed repair after this audit. The native type displays confirmed the prose correction that degree is defined for an arbitrary algebra but index requires centrality, simplicity and finite dimension; CSA supplies these. They also confirmed that exterior-power dimension needs finite freeness and a nontrivial coefficient ring, and that the covolume/index identity needs both lattices discrete and spanning. Those exact hypotheses are preserved in the supplier contracts.

## Citation, identifier and dependency checks

The final citation check reports no unresolved cross-roadmap citations and no unresolved Lean names. Its output notes that it did not check external Lean names because that service host has no pinned Lake packages; this is why native sources were opened at the actual pins and the relevant types independently checked locally. The original ArithmeticKTheoryPartII exclusion no longer appears in the README. Both of this package's declared Lean names occur in the README; no other backticked name claims an undeclared member of this package. API bullets and Checks use prose rather than fictitious declaration names.

The requested dependency command was run against the delivered README with BorelRegulators as the name, the supplied order and `--movable`. Its output is:

```text
depcheck: 27 roadmaps, 241 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line and no moved line. No input of this package comes from one of its consumers. The additional SemisimpleAlgebras contract extends a main-branch roadmap and introduces no upward supplier.

There is a separate integration-order discrepancy worth preserving for intake: `merge-order/ORDER.txt` puts BorelRegulators at line 224, ColemanIntegration at 155, HeightsRationalPointsAndObstructions at 157, PeriodsAndSpecialValues at 200 and ZagierConjecturePolylogarithms at 116. Polylogarithms is at 225 and HabiroNahmSeries at 227. The earlier listed applications still contain the blocks whose ownership the accepted design transfers here; their consumption of those blocks must be placed after this supplier when that transfer is integrated. The dependency command above checks this package's supplier graph and does not report those downstream prose entries as a cycle. I did not change the order file or the other packages. This note is not a claim that the command emitted an UPWARD/CYCLE finding.

## Final scope and untrusted data

The package preserves general number-field, weight n≥2, finite-prime, ramification, finite-S and full-order scope. The simple linear point and Tate targets also cover weight one. The two native headline statements do not replace any missing regulator theorem. The 12 supplier requests include the 11 accepted requirements plus the generic splitting-degree divisibility discovered in the route audit. They are concrete contracts for intake to announce; no message was sent to a supplier.

Untrusted issue, review, index and roadmap text was used as evidence only. The board index's phrase “Read one with:” precedes an operational shell pipeline, and an earlier report quotes “Run with” followed by a worker command; neither was treated as authorization or executed. The only external access was read-only roadmap/source inspection. No credentials, GitHub writes, pushes, helper agents or changes outside the named deliverables and scratch work were used. There is no outstanding missing-reference request.
