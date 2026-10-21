# Design repair report

Changes are confined to `packages/SelmerIwasawaCohomologyPartII/design/README.md`, `packages/SelmerIwasawaCohomologyPartII/design/plan.json`, `packages/SelmerIwasawaCohomologyPartII/sources.toml` and this requested report. No commit or GitHub write was made.

## F01 (P1) — applied

Positive-loss basis → supplied scaled inverse and bounded-loss submodule; rank two additionally uses a primitive first-row kernel vector. §§7.3 and 8.2 now give the pairing bound m−m₀−mper−2c−mlat; §§8.3–8.4 inherit it. Added the triangular D/C and primitive-kernel controls. Evidence: EulerSystemsAndKolyvaginSystems §4.4; the faulty printed inference is ltxzz lines 883–898 and 6838–6847.

## F02 (P1) — applied differently

Compatible refinement → commutative square; Cartesian claims require the actual pullback identification, including selected components. Graph trace uses the source covering degree without Cartesianity. §4.6 pulls back to the full inverse-image cycle; even a Cartesian sh↑ square alone need not identify that cycle with one refined graph. Added the unchanged-target/proper-source control. Evidence: ltxzz lines 1149–1154.

## F03 (P1) — applied

Unrestricted characterization of maps into Q → unique lifting for maps whose inverse-image center is an effective Cartier divisor. Imported StableReduction Layer 4 and pinned affine charts; added the exceptional-point negative control. Evidence: stacks-blowup lines 3750–3764; ltxzz lines 4755–4759. Component cohomology decompositions explicitly use the equal component pairs and H_𝔗.

## F04 (P2) — applied

Unqualified auxiliary-model cohomology → supplied H_𝔗/H_𝔗,c throughout strata, weight sequences, localization and potential maps. Specified coefficients, separated supports, free component action and orbit trace; named the generic-fibre comparisons and distinguished Shimura geometric/absolute cohomology. Added the two-point 𝔽₂ control. Evidence: ltxzz lines 1637–1657, 1737–1749, 3349–3355 and PELModuli §§M4.8–M4.9.

## F05 (P2) — applied

Arbitrary exceptional/raising sets → finite sets in Conventions, admissibility and all three datum signatures, retaining enlargement, strong disjointness and excluded-support conditions. The minimum set may contain arbitrary finite bad-place configurations; only raising places are required inert. Added infinite exclusion as a negative control. Evidence: ltxzz lines 5139–5142, 5839–5841, 6195–6197; SelmerIwasawaCohomology §4.25.

## F06 (P2) — applied

Two model/semistability owners → ShimuraVarieties alone through native-shimura. §2.3 takes the model, components, link charts and generic/special comparison as inputs, retaining incidence, tangent/normal and stratum identifications. Updated Scope, residual contract and consumers. Evidence: ltxzz lines 2653–2659; the owned incidence conclusions are Theorems 5.3.4–5.5.3, lines 2823, 2901, 2985.

## F07 (P2) — not actionable in this package: all-place supplier extension required

The existing supplier theorem has the reported S_FL and small-level restrictions. Its precise domain is now explicit; old-form-dimension requests the residual all-place transfer and arbitrary transferable-level oldform comparisons, and all direct consumers reference that gap. Endpoints retain their full finite-place domain. Added the S_FL/insufficient-smallness control. Evidence: EndoscopicTransferAndUnitaryTraceComparison §§13.7, 13.9; ltxzz lines 9612–9648 and 5741–5748.

Editing this package cannot extend that supplier's theorem. The top-level plan gap names EndoscopicTransferAndUnitaryTraceComparison, §§13.7–13.9, and its exact needs; the README includes the required “What EndoscopicTransferAndUnitaryTraceComparison must provide (gap:old-form-dimension)” line. No theorem is attributed to an absent supplier target. The requested extension includes hyperspecial transfer at every allowed unramified place and sufficiently small exceptional-level transfer in every residue characteristic; it does not assert transferability of arbitrary exceptional levels. No integral descent through a possibly nonunit covering degree is assumed. The maintainer must resolve the supplier extension outside this package.

## Verification and mathematical evidence

The rank-two replacement uses no unit coefficient in the scaled-inverse columns. Put k=m−m₀>c and let D have image containing π^c A_k². The supplied C satisfies CD=π^c I. For primitive v, some coordinate of Dv has valuation at most c; order it first. Write that row π^a(u₁,u₂), with u unimodular, and take t=(−u₂,u₁). Then t is primitive, D₁t=0, and CDt=π^c t forces exp(D₂t)≥k−c. This argument applies over arbitrary ramified coefficient DVRs. It neither claims that v,t are a basis nor that v belongs to im(C).

For the diagonal coordinate z=π^mper z_prim, v=π^m₀z_prim yields exp(loc_p₁(z))≥m−mper−c. Reciprocity constructs c₂ with second singular exponent at least m−mper−c−mlat. Pairing with t gives exponent at least max(0,m−m₀−mper−2c−mlat), while the other terms are killed by π^mdif. Thus m>m₀+mper+2c+mlat+mdif supplies the contradiction. For rank zero the corresponding threshold is m>m₀+c+mper+mlat+mdif. Constants remain independent of m; no c=0 restriction is imposed.

The dependency check exited 0 with exactly:

```text
candidate: SelmerIwasawaCohomologyPartII is not in the merge order yet; checked as if placed after IgusaVarietiesAndTorsionConcentration (the intake inserts it when its design is accepted)
depcheck: 4 roadmaps, 42 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. Neither tooling nor merge order was edited.

Additional checks:

- JSON and TOML parsing: PASS. There are 40 targets, 45 APIs, 59 target Checks, 20 gaps and 5 certified sources.
- Structural and README/plan consistency: 0 errors. Checked statements, proof sketches, API/Check names and text, at least three Checks per definition/construction, backwards target prerequisites, resolved gaps, exact direct-consumer lists and matching gap details/needs.
- Source service: stacks-blowup fetched legally and certified; Tag 0806 was read at stacks-blowup lines 3750–3764. All four existing source entries remain certified. No missing text remains.
- Pinned-library duplication check: GitHub object searches followed by reads at Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` verified `reesAlgebra`, `mem_reesAlgebra_iff` and the four affine-chart declarations in the supplier contract. No private Rees/chart construction was introduced.
- `git diff --check`: PASS, no output.
- Lean elaboration: not run. This design package has no `Suggested.lean`; none was authorized for editing, created or changed. The repairs remain README targets on the existing design-stage carriers. No Lean command was left running.

Supplier evidence was read from the content repository's main branch where present and otherwise from its new-roadmap snapshots: EulerSystemsAndKolyvaginSystems `4fb7ae99`, EndoscopicTransferAndUnitaryTraceComparison `f8f8c2b0`, PELModuli `2d82d07`, SelmerIwasawaCohomology `17f6056` and IgusaVarietiesAndTorsionConcentration `55adf55`. StableReduction Layer 4 and EtaleCohomologyFoundations §F.7 establish blowup ownership. Main-branch shape examples read were StableReduction, EtaleCohomologyFoundations and LocalGaloisGroups. QWittVectors, ArithmeticDynamics and ErdosProgressionPowers were inspected read-only; their objects supply none of the missing interfaces here.

## Adversarial mathematics pass

Each target row includes its defining clauses, named API and associated Checks. Cases outside the stated field/coefficient/geometry domains are rejected, rather than inserted into the theorem. The entries record direct boundary computations and hypothesis checks, not claims of completed formal proofs. All conclusions requiring residual contracts continue to require those contracts.

| Statement | Instances tried | Result | Change |
| --- | --- | --- | --- |
| Conventions: degree, twist, polarization, Frobenius, cochains | n=2; p=3 inert; sign action of C₂; (I,−1)c | Tensor rank 6, twist 2, weight −1; Frobenius 9 versus 1/9; coboundary −2; square component −I | Retain witnesses |
| Imported polynomial and DVR algebra | Degrees 1,2; ramified Oλ; zero module; non-PID coefficient ring | Reflection signs −/+; ideal powers retain ramification; zero exponent is 0; PID hypotheses cannot be dropped | No new algebra definition |
| Torus carriers and trace | Trivial Γ; free two-point C₂-orbit; L=𝔽₂; nonfree component action | Invariants of L² are diagonal; total trace 0 and orbit trace 1; nonfree trace excluded | F04 |
| Exceptional-set convention | Empty raising set; finite enlargement; all auxiliary supports excluded | Empty raising allowed; finite exclusions preserve prime supply; infinite exclusion outside domain | F05 |
| 1.5 specialInertPlace and four APIs | ℚ(i) at 3,5,2; local degree two; identity transport | 3 inert with residue size 9; split/even/ramified and wrong local degree rejected | None |
| 1.6 rankinSelbergAdmissible and four APIs | ℓ=2,3; ξ=±1; scalar 1; homothety; higher rank | Small primes and excluded eigenvalues fail; homothety preserves clauses; no rank-two cyclotomic shortcut | Finite standing minimum |
| 2.1 unitaryLevelRaisingDatum and four APIs | m=0,1,2; empty raising; infinite exclusion; changed levels | Positive exponent required; residual congruence does not give λ² congruence; P6 rechecked on level change | F05 and full-domain transfer gap |
| 2.2 unitaryBasicCorrespondence and three APIs | N=2,3; empty source; residue extension | Fibres have dimensions 0,1 and codimensions 1,1; empty source stays empty | Imported native geometry |
| 2.3 unitarySemistableStrata and three APIs | N=2 node; N=3,p=3 quartic; invert p | Two reduced branches; normal degrees +16 and −16; smooth generic fibre | F06; chart is input |
| 2.4 unitaryLinkAndIntersection | r−j=1; ℓ divides p+1; nontrivial CM orbit | p+1 points and ℙ⁰ fibre; restriction requires unit; H_𝔗 removes CM multiplicity | F04 |
| 2.5 unitaryIncidenceWeightComplex and three APIs | N=2,4; p=3; two branches; Frobenius 4 on ℤ₃ | Alternating restriction a−b; entries −16 and 4; invariants 0 versus coinvariants ℤ/3 | H_𝔗 terms; integral gap retained |
| 2.6 unitaryProductResolution and three APIs | n=2; empty center; complement; exceptional point | Dimension 3, graph codimension 2; identity off center; point has image ideal 0 and multiple possible lifts | F03; componentwise invariant decomposition |
| 3.1 localizedUnitaryCohomology | Zero localization; nonproper model; nonunit intertwiner | Zero case consistent; boundary theorem required; intertwining unit hypothesis essential | H_𝔗/support domains |
| 3.2 oddTateCycleComparison | A6.1.4 alone; add irreducibility and H(N); unipotent Frobenius | Concentration alone does not give the stronger eigenvalue/coinvariant assertions | H_𝔗 carrier |
| 3.3 evenIntegralFreeness | Zero definite support; cyclotomic reducibility; place in S_FL | First two excluded; supplied oldform theorem does not cover arbitrary S_FL configuration | F04 and F07 |
| 3.4 evenFrobeniusExclusion | N=2; eigenvalues 1,p²; ramified Oλ | Explicit hypotheses exclude those eigenvalues; primitive-link comparison remains necessary | H_𝔗; full-domain dependency inherited |
| 3.5 evenSingularComparison | Zero quotient; congruence quotient versus eigenspace; residual Frobenius exclusions | Actual nΠ quotient and filtered inertia are necessary; zero case consistent | H_𝔗 carrier |
| 3.6 evenCongruenceGaloisRealization | μ=1 and μ>1; changed basis; ramified coefficient lattice | Existence of multiplicity decomposition does not select a canonical summand | Explicit auxiliary/geometric comparison |
| 3.7 oddSpecialLevelChange | Empty P; one place; colliding rational supports | Empty change is identity; unit intertwiners compose; distinct-support condition retained | None |
| 4.1 diagonalUnitaryDatum and three APIs | n=2; incompatible levels; identity; source-only degree-d refinement | Dimensions 1,2,3; incompatible data rejected; compatible refinement need not be Cartesian | F02 |
| 4.2 diagonalGraphCycle and three APIs | Zero cycle; point graph; source degree 2; variable component degree | Trace gives 0,1,2Δ respectively; degree must be taken on the source component | F02 |
| 4.3 projectedDiagonalAbelJacobi and three APIs | n=2; zero cycle; point on ℙ¹; missing concentration | Correct coefficient degree 3; point on ℙ¹ cannot enter the proposed degree-1 edge | Keep single-row and integral hypotheses |
| 4.4 rankinSelbergPurityAndSelmer | Tensor weight for n=2; bad w∤ℓ; w dividing ℓ | Weight −1; two dual H⁰ vanishings used away from ℓ; crystalline input required above ℓ | None |
| 4.5 diagonalMultiplicityRealization | μ>1; zero tuple; one nonzero coordinate; conjugation twice | Nonzero tuple has some nonzero coordinate, with no canonical choice; conjugation transports Selmer | None |
| 4.6 diagonalRegulatorNaturality | Identity; degree 2; source-only cover; nonunit degree | Trace degree valid without Cartesian sh↑ square; pullback uses all inverse-image components; no division by degree | F02, including graph-square distinction |
| 5.1 firstReciprocityDatum and four APIs | m=0; zero quotient; two-point fibre; tensor at 𝔽₁₁,q=2 | Reject m=0 and zero support; fibre contributes 2; repeated tensor eigenvalue defeats PI7 | Finite sets and transfer gap |
| 5.2 firstGeometricReciprocity | One graph point; fibre multiplicity 2; p=3 | Orbit trace counts source multiplicities; factor (p+1)²=16 retained | Explicit torus trace domain |
| 5.3 productCohomologyConcentration | Free versus torsion factors; zero localization; twist −1 | Freeness removes Künneth Tor; only three E₂ positions under full hypotheses | H_𝔗 sequence and supports |
| 5.4 diagonalCycleBoundaryComparison and three APIs | Zero cycle; O→O by π²; unipotent block over 𝔽₃ | Cokernel class of π has exponent 1; invariants→coinvariants may be zero | H_𝔗 stratum kernels/cokernels |
| 5.5 firstExplicitReciprocity | p=3; one graph point; zero function; repeated fibres | Value 4 times the two Hecke scalars; zero and multiplicities preserved | H_𝔗/orbit trace |
| 5.6 firstReciprocityExponentEquality | Unit scalar; nonunit p+1; zero class | Unit scalars preserve exponent; nonunit case is excluded by PI2 | No loss of its domain |
| 6.1 secondReciprocityDatum and three APIs | Empty raising; m=0,2; fibre size 2; extra rigidity labels | Empty allowed; m=0 rejected; count multiplicity; no extra PI5/PI6 requirements | Finite sets and transfer gap |
| 6.2 secondGeometricReciprocity | Zero class; p=3; both parity choices | Zero respected; actual T⋆ operator and two correspondence legs retained | H_𝔗 carrier/comparison |
| 6.3 oddSpecialFiberCoinvariants | Trivial Frobenius; unipotent block; extra CM components | Weak semisimplicity needed; raw CM cohomology has extra factors | F04 |
| 6.4 secondExplicitReciprocity | O/π²→O/π; zero cycle; coefficient reduction | Image exponent 1 is at most source exponent 2; equality is not forced | Auxiliary versus absolute carrier explicit |
| 7.1 admissibleImageLift | ξ=±1; γ=(I,−1)c; simple and repeated eigenvalue 1 | ξ²−1 unit and γ² fixed-line conditions discriminate; repeated eigenvalue rejected | None |
| 7.2 auxiliaryPlaceDetection | r=1,2; zero span; multiplication by π²; triangular D/C; c=0,c≥k | Bounded exponents, nonbasis columns and primitive kernel computed; c≥k has only zero lower bound | F01 |
| 7.3 rankinSelbergLevelRaisingSystem and two annihilators | Empty raising vertex; triangular D; pairing π·π² in A₅; zero argument | First kernel kills unwanted pairing; perfect product exponent 2, nonperfect exponent 1; zero exponent 0 | F01; total detection error 2c |
| 7.4 eventualAdmissibilityFamilies | Isogenous/CM elliptic inputs; F⁺=ℚ; specified Steinberg family | Excluded inputs do not satisfy family hypotheses; no eventual statement for arbitrary relevant pairs | None |
| 8.1 rankinSelbergSelmerRankZeroOfPeriod | Zero period; positive c; unbounded m; infinite exclusion | Nonzero witness and uniform c required; explicit one-place threshold grows beyond fixed errors | Finite sets; c retained |
| 8.2 rankinSelbergSelmerRankOne | AJ=0; μ>1; triangular detection; positive c | AJ=0 supplies no lower bound; primitive kernel yields contradiction for large m | F01; no basis assumption |
| 8.3 rankTheoremsTotallyRealBase | n=2 over ℚ; n≥3 with F⁺≠ℚ; nonuniform c | H(N) removal only on stated domain; eventual admissibility does not give uniform span | Inherits corrected 2c bound |
| 8.4 rankTwoThreeRankTheorems | n=2; F⁺=ℚ; ℓ=2,3; positive c | H(2),H(3) removable; L1–L7 and span remain; small ℓ excluded | Inherits corrected primitive-kernel argument |
| 8.5 hilbertPrecursorCompatibility | Odd/even g; failed LIInd; wrong congruence; empty support | Only the exact Liu–Tian domain is consumed; no unitary theorem substituted | Existing supplier gap retained |

## Maintainer consequences

No target or API name was added, deleted or renamed. New Check names are `level_infinite_exclusion`, `product_exceptional_point`, `diagonal_refine_source_only`, `link_torus_trace_control`, `detection_primitive_kernel` and `oldform_supplier_domain`; Conventions adds `torus_two_point_control`. Existing `detection_rank_two` and `system_two_places` now discriminate positive-loss matrices.

Consumers of `auxiliaryPlaceDetection` and `twoPlaceAnnihilator` must use the scaled-inverse/primitive-kernel conclusions, with the explicit 2c pairing loss in rank one. `productResolution_ext` now requires the effective-Cartier hypothesis; `diagonalDatum_refine` promises a commutative square on general refinements; graph pullback in `diagonalRegulatorNaturality` uses the actual Cartesian graph square. `semistableStrata_localEquation` and `semistableStrata_genericFiber` identify incidence data using supplied charts/comparisons, rather than constructing the model. PeriodsAndSpecialValues inherits the corrected hypotheses and constants without a supplier cycle. F07 requires an external supplier decision; no merge-order change is requested.
