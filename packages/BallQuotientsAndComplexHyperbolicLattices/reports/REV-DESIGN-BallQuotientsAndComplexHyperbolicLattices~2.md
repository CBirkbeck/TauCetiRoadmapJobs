# Review of BallQuotientsAndComplexHyperbolicLattices (design, round 2)

**Verdict:** needs changes

Reviewed the 57 targets, their API bullets and Checks, the supplier contracts, plan and 16-entry source manifest. All nine prescribed repairs from the previous review are present. There are ten findings below, eight blocking (P1/P2). This is a repairable design, not a rejected scope. No design or source-manifest file was changed.

## Previous findings, checked first

Locations in this table are in `packages/BallQuotientsAndComplexHyperbolicLattices/design/README.md` unless specified otherwise. These are checks of the repairs, not acceptance of unrelated claims in the same section.

| Previous finding | Repaired passage | Verification and status |
| --- | --- | --- |
| F01 | §8.1, line 554: “is a unitary semi-character of Λ_b” | **Repaired.** The stated correction is exp(−4πi Im⟨a,a′⟩/τ). For a=1, a′=i, τ=4, χ(1+i)=−1 whereas χ(1)χ(i)=1. The automorphy-factor ratio is (−1)exp(πi)=1. Both README and plan include the example and the commutator criterion. |
| F02 | line 114: “X is smooth if X^an is a complex manifold” | **Repaired.** The opposite implication is explicitly imported from ComplexComparisonPartII C−1.1. Its current README line 1054 supplies smooth charts. The remaining comparisons are tied to the common completed local ring, not three unrelated requests. Both gap slugs occur in both files. |
| F03 | line 623: “for ℓ ≥ 3 … and also for ℓ = 2 when g ≥ 3” | **Repaired.** At (g,ℓ)=(2,2), degrees are 4<5; at (2,3), 6≥5; at (3,2), 8≥7. The negative control is present in both files. |
| F04 | line 430: “has a measurable fundamental domain F ⊂ B with pairwise disjoint translates” | **Repaired.** The Tau Ceti theorem is named in the contract, target and plan. Its hypotheses include countability, second countability, Hausdorffness, local compactness, continuous action, measurable opens and null non-free locus. These hold here; coverage is almost everywhere, as in the native fundamental-domain predicate. |
| F05 | line 399: “Mathlib matrix norms” | **Repaired.** Brouwer, `Group.ResiduallyFinite`, and ShimuraVarieties §2.8 are absent from the candidate. No replacement unsupported Brouwer input appears elsewhere. |
| F06 | line 20: “transporting it to B would need the identification of B with that symmetric space” | **Repaired.** ALS.0.5, current README lines 1364–1375, applies to discrete effective image with finite kernel without an arithmeticity hypothesis. The revised reason distinguishes the carriers. |
| F07 | line 784: “h₀(z) = ([diag(1, z/z̄, …, z/z̄)], 1)” | **Repaired.** For z≠0 its matrix satisfies gᴴJg=J; at z=2 it is I, and at z=i it is diag(1,−1,…). The old representative gave 4J at z=2. The separate full-domain problem is R01. |
| F08 | line 469: “whose proof … treats SL(ℓ,ℤ) only” | **Repaired.** WitteMorris2015 lines 2972–2988 have exactly that restriction. Lines 3445–3446 cite Borel Corollary 17.7 for the stronger forms. The general finitely generated characteristic-zero target remains owned here, not falsely attributed to that restricted proof. |
| F09 | `sources.toml`: “Épijournal de Géométrie Algébrique” | **Repaired.** The venue is no longer mojibake. Baldi–Ullmo and Witte Morris have version notes and matching years. No duplicate key was introduced. |

Pattern checks also covered other uses of χ, the curvature twist, h₀, finite-index passage, the Jacobson-ring route, and the fundamental-domain predicate. No previous repair was marked non-actionable, so no finding below re-raises a settled non-actionable item.

## R01 (P1) — The full Shimura domain need not be connected

**Location.** `packages/BallQuotientsAndComplexHyperbolicLattices/design/README.md:784`, “𝐆^ad(ℝ) = G × C” and “X is connected”; `design/plan.json`, target 11.3, including its orbit-map API.

**Claim.** For every arithmetic lattice, including n=1, the full real adjoint group has the displayed decomposition and its full conjugacy class is the ball.

**Witness.** Take the roadmap's own 𝐆=SL₂ example. Its adjoint is PGL₂. The determinant-sign map PGL₂(ℝ)→{±1} is onto, with kernel PSL₂(ℝ). The full domain is ℍ⁺ ⊔ ℍ⁻: two components, whereas B has one.

The supplier explicitly retains this distinction: pull request #933, `TauCetiRoadmap/ShimuraVarieties/README.md:155` defines the **full** real conjugacy class; §§P.1–P.2, lines 163–180, retain the two half-planes and a chosen component. BaldiUllmo2023 lines 447–449 also distinguish a chosen connected component; its §3.2 starts with n>1 at line 479.

**Exact repair.** Keep the full Shimura datum (𝐆^ad,X), identify the identity real component with G times its compact factors, choose X⁺ containing h₀, and identify X⁺≅B. Form component arithmetic groups using the positive component stabilizer as in ShimuraVarieties §§P.2, 0.5. Carry X⁺ through §§11.4–11.5 and their plan entries. Add the SL₂/PGL₂ example: conjugation by diag(−1,1) exchanges ℍ⁺ and ℍ⁻. This preserves every n≥1 and the corrected h₀; it does not discard the n=1 case.

## R02 (P2) — The target dependency graph is cyclic and not in build order

**Location.** `packages/BallQuotientsAndComplexHyperbolicLattices/design/plan.json:92`, `target:1.4`, and line 210, `target:1.2`; README §§1.2, 1.4, 1.6, 3.4.

**Claim.** The displayed layer and target order supplies every construction before its consumers.

**Witness.** Parsing all `target:` prerequisites gives the cycle 1.2→1.4→1.2. Other forward edges are 1.6→2.2 and 3.4→4.1. The inter-roadmap gate does not inspect these edges.

**Exact repair.** Separate the quotient group and Ad definition from the Cartan decomposition, connectedness and unimodularity conclusions. Define G first; prove the action, compact K and section next; then prove the latter structural conclusions. Move the metric clause of §1.6 after §2.2, and place the elliptic definition before the fixed-set theorem (or state that theorem directly for a nonidentity element fixing an interior point). Update target prerequisites and layer dependency summaries. Preserve old locators with an old→new mapping if numbering changes. Retest by a topological sort: every target must be removed, with no residual cycle. Merely deleting the 1.4 prerequisite while retaining its uses is not a repair.

## R03 (P3) — Two Checks fail explicit small instances

**Location.** `packages/BallQuotientsAndComplexHyperbolicLattices/design/README.md:232`, “is h_t·w for tanh t = −1/2”; `design/plan.json:1129`, “An infinite-index normal subgroup of a free Fuchsian group is infinitely generated.”

**Claim and witness.** At w=0 the displayed Möbius map is −1/2, but the defined h_t gives −i tanh t=i/2. Separately, {1} is an infinite-index normal subgroup of the free Fuchsian group Γ(2)/{±1}≅F₂ and has zero generators.

**Exact repair.** In the first Check use g=[[cosh t,sinh t],[sinh t,cosh t]] with tanh t=−1/2, or explicitly conjugate the defined h_t by a rotation. Then both sides at 0 equal −1/2 and the fractional formulas agree for all w. In the finite-generation Check use the commutator subgroup [F₂,F₂] of Γ(2)/{±1}; it is nontrivial, normal, infinite index, and free of countably infinite rank. State the same precise example in the plan and README.

## R04 (P1) — The Jordan theorem used by the Margulis route has no supplier contract

**Location.** `packages/BallQuotientsAndComplexHyperbolicLattices/design/README.md:376`, “Jordan's theorem on finite subgroups of a compact Lie group”; target 4.4's `*Needs:*` and `design/plan.json` prerequisites omit it.

**Claim.** The quantitative Margulis conclusion follows from the listed inputs.

**Witness.** For finite H⊂K at x=0, every displacement is 0. The conclusion still requires an index bound depending only on n; “H is finite” supplies only [H:{1}]=|H|, unbounded even for cyclic groups.

A specific owner exists: pull request #1708, `TauCetiRoadmap/FiniteGroupInvariants/README.md:1645`, §10.5; lines 1649–1665 define `jordanBound` and prove `jordan_exists_abelian_normal_index_le` in characteristic zero. The pinned permutation-group Jordan theorem is a different theorem. Neither §4.4 nor any supplier row imports the needed result.

**Exact repair.** Add the named §10.5 contract and a prerequisite in both files, using K≅U(n)⊂GL_n(ℂ), and place the consumer after this supplier. This is a new-roadmap pull request by another author, not a revision dependency. Alternatively give a precise quantitative compact-neighbourhood argument as an owned intermediate target that genuinely removes the Jordan input. Do not silently reproduce the existing Jordan theorem. Test the interface on C_m⊂U(1): the abelian subgroup is C_m itself, index 1 for every m; on the standard S₃⊂U(2), A₃ is normal abelian of index 2. Rerun the supplier gate after the contract changes.

## R05 (P2) — The projective-space construction is already supplied at the actual pins

**Location.** `packages/BallQuotientsAndComplexHyperbolicLattices/design/README.md:49`, “it carries no topology or complex structure by itself, which §1.3 transports from the affine charts”; baseline lines 46, 58 and `design/plan.json:6`.

**Claim.** The projective topology and complex charts need construction here against the pinned libraries.

**Witness.** `Mathlib/Topology/Algebra/Projectivization.lean:44` defines `Projectivization.instTopologicalSpace`. `TauCeti/Geometry/Manifold/Instances/Projectivization.lean:54` and :82 define its charted-space and analytic-manifold instances, including over ℂ; :96 proves the inverse affine chart smooth/analytic.

The supplied `lake-manifest.json` pins Mathlib **1b1ccf4b088b32fa3f23f2de1127433254a81e1e** and Tau Ceti **2fd255d997f47c0b5d834ee416c7015d55444ce5**; both package checkout HEADs agree. The candidate instead records f6090c7 and 358314d. This is not just a line-number change: it changes ownership.

**Exact repair.** Consume the native topology and atlas, with the finite-coordinate reindexing/WithLp comparison needed for `Fin 1 ⊕ Fin n`. Keep only the positive-line subspace, its identification with B, and the Siegel/Cayley comparisons. Update the recorded baseline and all pinned locators; do not edit the library manifests. For n=1, the native chart sends [1:1/2] to 1/2 and its inverse sends 1/2 to [1:1/2]; restricting this chart gives exactly the intended map, without a second topology or atlas.

## R06 (P1) — Three SNC supplier declaration names no longer exist at the cited head

**Location.** `packages/BallQuotientsAndComplexHyperbolicLattices/design/README.md:110`, “`sncCompactification_open`, `sncCompactification_boundary`, `sncCompactification_projective`”.

**Claim.** These declarations are supplied by AlgebraicModuliForArithmeticGeometry §9.5.

**Witness.** At pull request #853, `TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry/README.md:10167`, §9.5 is now a prose consumption contract for ResolutionOfSingularitiesCharacteristicZero §6.2. None of the three names occurs in that README or its `Suggested.lean`.

**Exact repair.** Cite AlgebraicModuliForArithmeticGeometry §9.5's dense-open, strict-SNC-boundary and projectivity contract by section and prose, without these obsolete declaration names; retain its explicit underlying owner ResolutionOfSingularitiesCharacteristicZero §6.2. No new mathematical gap is needed: the section supplies precisely the theorem used in §10.3. Test on U=𝔾_m²: its compactification ℙ¹×ℙ¹ has the same dense open, four smooth labelled boundary components and projectivity. The repair changes the citation, not the supplied theorem. This finding concerns a missing declaration reference; it does not claim the SNC result is unowned.

## R07 (P2) — The L² equivalence needs a positive pluricanonical power

**Location.** `packages/BallQuotientsAndComplexHyperbolicLattices/design/README.md:589` and :631, “a holomorphic L² section of K_X^ℓ … extends … vanishing on D”; `design/plan.json`, targets 8.4 and 9.2.

**Claim.** L² sections are exactly logarithmic pluricanonical sections vanishing on D, with no positive-power bound in the README. The plan includes ℓ≥1 for 8.4, but not for the equivalence in 9.2.

**Witness.** Let Γ=Γ(2)/{±1}, ℓ=0, f=1. Then ∫_X |1|²vol_ω=π<∞, but the extension 1∈H⁰(ℙ¹,O) is nonzero at all three cusps. Locally ∫₀^δ dr/(r(−log r)²)=1/(−log δ)<∞.

**Exact repair.** Quantify ℓ as an integer/natural number with ℓ≥1 in the equivalences of §§8.4 and 9.2 and their plan hypotheses; retain ℓ≥2 only for the stronger boundary-separating existence assertion. Add ℓ=0, f=1 as a negative control. At ℓ=1, k=0 the radial integral is ∫dr/r=∞, whereas k=1 gives ∫r dr<∞; this tests the corrected cutoff. Mok2012 line 607 explicitly fixes a positive integer q.

## R08 (P2) — The proposed thin-part argument omits elliptic components

**Location.** `packages/BallQuotientsAndComplexHyperbolicLattices/design/README.md:450`, “components of the thin part are tubes around closed geodesics … or quotients by … parabolic groups”; also the Layer 4 Examples at line 395.

**Claim.** This two-case decomposition proves the cusp theorem for every lattice, including lattices with torsion.

**Witness.** In PSL₂(ℤ), S:z↦−1/z fixes i, so d(i,Si)=0 for every ε>0. For sufficiently small ε the local thin neighbourhood of i has stabilizer C₂, no parabolic, and no positive-length closed geodesic.

The same issue occurs at the order-three cone point. Mok2012 lines 309 and 340 explicitly assume torsion-freeness in the recalled argument; they do not prove this omitted case for orbifolds.

**Exact repair.** Retain the all-lattice theorem, but specify and supply the torsion-sensitive thin-part/cusp argument, including finite elliptic stabilizers and the compactness assertions it actually needs. Correct the Layer 4 summary accordingly. If using the general Garland–Raghunathan route, state its needed intermediate conclusions here with the existing general source locators instead of the two-case torsion-free assertion. Do not reduce first by §§6.2–6.4: that would make finite generation and Selberg depend on the cusp theorem used to prove them. Add the two modular cone neighbourhoods as negative controls to the two-case classification and positive controls to the corrected orbifold treatment.

## R09 (P1) — The native proper-discontinuity contract is misstated

**Location.** `packages/BallQuotientsAndComplexHyperbolicLattices/design/README.md:51`, “it implies neither freeness nor finite stabilisers in a non-Hausdorff space, and §5.2 proves both for G-actions”.

**Claim.** Native proper discontinuity needs Hausdorffness to imply finite stabilizers, and the discrete-action argument also gives freeness.

**Witness.** Put K=L={x}. Singletons are compact in every topology, and {γ:γK∩L≠∅}=Stab(x). The pinned `ProperlyDiscontinuousSMul.finite_stabilizer'` at `Mathlib/Topology/Algebra/ConstMulAction.lean:566` has no Hausdorff assumption. C₂ acting by w↦−w is properly discontinuous, not free.

**Exact repair.** Say that proper discontinuity always gives finite stabilizers, citing that declaration (and the subgroup form :601); freeness follows here only after imposing torsion-freeness, as in §7.2. Remove the claim that §5.2 proves freeness or reproves the generic finite-stabilizer theorem. The C₂ example then has stabilizer of cardinality 2 at 0, and a torsion-free discrete subgroup has stabilizer cardinality 1.

## R10 (P3) — The functoriality locator does not state functoriality

**Location.** `packages/BallQuotientsAndComplexHyperbolicLattices/design/README.md:741` and `design/plan.json`, target 10.6: “BaldiUllmo2023 line 102 to line 104”.

**Claim.** The locator supports algebraicity, finiteness, degree, boundary extension and composition for all finite-index lattice inclusions.

**Witness.** BaldiUllmo2023 lines 102–104, printed p.3, only explain finite-index reduction to torsion-free lattices for the paper's two main statements. They contain no finite morphism, degree or compactification statement.

**Exact repair.** Identify §10.6 as the consequence proved here of §§9.5, 10.4–10.5 and the finite-quotient contracts. Give the normal-core quotient argument, generic free-orbit degree calculation and cusp-extension argument explicitly; retain the Baldi–Ullmo locator only as motivation for finite-index reduction, not as the theorem locator. Alternatively supply an exact primary locator for the full assertion. The normal-core route gives degrees 6 and 12 for Γ(2)/{±1} and the image of Γ(3), respectively, and degree 1 for the identity inclusion.

## Verified sound

### Coverage, principles and shape

All 57 README targets and all corresponding plan statements, API entries and tests were read. The previous computed rows were used as a starting point, not its blanket assurances. Uncovered Cartan Checks, connected/full Shimura domains, internal prerequisites, zero powers and the native contracts were reviewed afresh. The tables below include the fifteen seeded targets, the headline results and every target touched by a finding; they are computed controls, not proofs of the theorems.

The scope is a general library for all n≥1 and all lattices, with arithmetic and neat hypotheses only where identified. No computational algorithm, copied source passage, route-specific arithmetic substitute, forbidden supplier, source instruction, local machine path or PR number was found in the design text. The design does not re-plan the Fuchsian theory or Baily–Borel: its retained work is the higher-dimensional geometry and comparisons. The ownership exceptions are R04, R05 and R09.

The README has the requested summary, scope, conventions, supplier contracts, reading guide, twelve numbered layers with Examples and Dependencies, consumers and references. Every one of the 57 targets has at least three Checks; the repaired §8.1 has four. Its ten definition-kind plan targets have API entries. There are 57 target-level `*Needs:*` lines. Missing precision, build order and stale names are listed above rather than counted as a clean shape result. Apart from the cited supplier identifiers, its own proposed names are in the plan, not backticked API promises in the README. No `Suggested.lean` is present at this design stage.

### Computed adversarial table

In rows marked “holds”, the displayed test or calculation holds; the label does not certify unread books. “Prior row rechecked” means the former computed instance was recomputed, rather than relying on an earlier prose summary.

| Statement | Instances tried | Values computed on the two sides | Result / change |
| --- | --- | --- | --- |
| Form, action and scale conventions; 1.1 | h_t, S swapping coordinates, 2I | h_tᴴJh_t=diag(1,−1), det=1; h_t·0=−i tanh t; SᴴJS=−J; (2I)ᴴJ(2I)=4J | Correct exclusions and action sign. |
| 1.2 quotient/Ad | n=1,2; diag(1,ζ,1), ζ³=1 | SU kernel sizes 2,3; Ad spectrum 1 (five times), ζ and ζ̄ (twice each); scalar iI maps to 1 | Holds; dependency cycle R02. |
| 1.3 Cayley and native chart | 0,−1,1; (0,1/2); (0,2) | C gives i,0,∞; ρ=3=(3/4)/(1/4); outside gives ρ=−3; inverse gives (0,1/2) | Formulas hold; native atlas already exists, R05. |
| 1.4 section/denominators | w=(1/2,0,…), w=0 | γ=2/√3, c/a=1/2; (γ−1)/r²→1/2; at 0 g_w=I; \|a\|²−\|b\|²=1 excludes a+bᵀw=0 | Holds; split dependencies R02. |
| 1.5 N and pinned Heisenberg law | (1,0),(i,0); general p,q | products (1+i,−2),(1+i,2), commutator T_−4; under z=−t/4+pq/2 the product coordinate is z+z′+pq′ | Holds, including n=1 where horizontal rank=0. |
| 1.5 dilation; 1.6 comparison | s=1/2; modular lattice | a_sT₁a_s⁻¹=T_1/4; ρ′=ρ/4; ω-area=π/6 versus curvature−1 area π/3 | Holds; metric comparison must follow 2.2. |
| 2.1 Cartan and its Check | f(z)=z/2; z+z²; tanh t=−1/2 | derivatives 1/2 and 1; second map on unbounded ℂ is not identity; claimed Möbius value −1/2 versus h_t·0=i/2 | Theorem controls hold; Check fails, R03. |
| 2.2 Kähler form | n=1; n=2, w=(r,0) | h=(1−r²)^−2; in n=2 diagonal entries (1−r²)^−2,(1−r²)^−1, determinant (1−r²)^−3; volume coefficient 4(1−r²)^−3 | Correct determinant and 2^n volume normalization. |
| 2.3 Ricci and curvature | n=1; 2ω; anisotropic diagonal at n=2 | −i∂∂̄log det h=−(n+1)ω; K(ω)=−2, K(2ω)=−1; swap exchanges coefficients (1,2) with (2,1) | Correct scale and uniqueness up to positive scalar. |
| 2.4 distance/completeness | w=tanh t e₁; geodesic s | RHS=cosh²t, d=√2\|t\|; speed at s=0 is √2·1/√2=1; d→∞ as r→1 | Holds. |
| 2.5 contraction | (ζ,0), (ζ,ζ)/√2, (ζ/2,ζ/2), 2ζ | derivative norms 1,1,1/√2,2; squared metric factors 1,1,1/2,4; last map leaves B | Holds; distinguishing norms from quadratic forms. |
| 3.1 sub-balls | m=0; w₁=1/2; null span | dimension 0 and trivial PU(1,0); form (3/4)\|z₀\|²−\|z₂\|², signature (1,1); null line has form 0 and no positive line | Holds. |
| 3.2 totally geodesic | w₂=w₁²; real plane | at 0 tangent is w₂=0 but second derivative is 2, not 0; real plane has real dimension 2, complex tangent dimension 0 | Excludes curved complex curve and real-only case. |
| 3.3 classification | n=1; union of two axes in B² | closed dimension-one irreducible analytic subset of B is B; axes union has two irreducible components, each with zero second fundamental form | Correct irreducibility requirement. |
| 3.4 fixed sets | diag(1,ζ,1), diag(1,ζ,ζ), ζ≠1 | fixed equations w₁=0 and (w₁,w₂)=(0,0), dimensions 1 and 0; axes intersect in {0} | Holds; forward elliptic definition R02. |
| 4.1 types | T_t, a_s, finite rotation | infimum displacements 0 unattained, √2\|log s\| attained, 0 attained; fixed boundary counts 1,2; rotation has interior fixed point | Holds for nonidentity elements. |
| 4.2 displacements | T_t at ρ=\|t\|/2; n_(a,0) at (0,iy) | d=√2 asinh(1); cosh(d/√2)=1+\|a\|²/(2y), giving d~√2\|a\|/√y; horosphere distance=\|log(N₂/N₁)\|/√2 | Holds. |
| 4.3 discrete boundary group | a_1/2 and T₁ | conjugates T_(4^−k) are distinct and approach identity; each cyclic subgroup separately is discrete | Correct negative control. |
| 4.4 quantitative virtual nilpotence | C_m⊂U(1), S₃⊂U(2), dense F₂ | all at-origin displacements 0; abelian normal indices 1,2; trivial-subgroup index m unbounded; dense F₂ not virtually nilpotent | Need actual uniform input, R04. |
| 4.5 horospherical lattice | ⟨n_(1,0),n_(i,0)⟩; ⟨n_(1,0)⟩ | horizontal ranks 2 and 1; first centre=4ℤ, second centre intersection=0; only first is cocompact; n=1 horizontal rank=0 | Holds; general finite-holonomy source is uncertified. |
| 5.1/5.3 lattice and measure | PSL₂(ℤ), Γ(2)/±1, trivial group | volumes π/6, 6π/6=π, ∞; ∫_N^∞ρ^−(n+1)dρ=N^−n/n versus ∫₀¹ρ^−(n+1)dρ=∞ | Holds. |
| 5.2 and native contract | irrational rotation; C₂ rotation; singleton compact sets | stabilizer cardinalities ∞ and 2; singleton transporter equals stabilizer without T₂; C₂ free locus=B−{0} in n=1 | Target discrete action holds; contract false, R09. |
| 5.3 repaired F-domain | Γ trivial; C_m rotation | non-free locus ∅ or {0}; volumes of those loci 0; sector angle 2π/m has disjoint translates after deleting null boundaries | Tau Ceti hypotheses met; coverage is a.e. |
| 6.1 torsion/cusps | PSL₂(ℤ), its cone points, a compact quotient | one cusp class; heights of elliptic points 1 and √3/2; displacement of stabilizer at each point=0; compact case has zero cusps | Cusp theorem controls hold; thin-part route R08. |
| 6.2 presentation | PSL₂(ℤ); F₂ and its trivial subgroup | presentation C₂*C₃ has 2 generators and 2 relations; {1} has index ∞ in F₂ but 0 generators | Correct headline; plan Check R03. |
| 6.3 eigenvalue Selberg | {±1}⊂GL₁(ℚ); Γ(3); μ∞ | normal subgroup {1} has index 2 and sole eigenvalue 1; writing A=I+3B gives tr A=2−9det B, excluding all torsion traces; μ∞ has no proper finite-index subgroup | General target passes these controls. |
| 6.4 neat | order-4 screw parabolic; Γ(3) | screw has infinite order but Ad eigenvalue i; Γ(3) parabolics have only eigenvalue ratios 1; finite-order nonidentity has a ratio ≠1 of finite order | Correct distinction from torsion-free. |
| 7.1 quotient | {1}; ±1 on ℂ²; complex reflection | B; invariants x²,xy,y² with relation ac=b²; reflection invariants w₁,w₂² give smooth quotient | Normality and torsion/smoothness distinctions hold. |
| 7.2 torsion-free quotient | Γ(3); PSL₂(ℤ) at i | sphere minus 4 points has π₁=F₃; local degree for S at i=2 versus covering degree locally 1 | Correct torsion-free requirement, general discrete Γ allowed. |
| 7.3/7.4 finite quotient and comparison | Γ(2)/±1 normal in PSL₂(ℤ) | quotient group S₃ of order 6; three-punctured sphere quotient j-line; elliptic coordinate w↦w^m has local degree m | Holds, including nonabelian finite quotient. |
| 8.1 repaired semi-character | a=1,a′=i,τ=4 | t_(a+a′)=−2, χ(a+a′)=−1, χ(a)χ(a′)=1; multiplier correction exp(πi)=−1, product ratio 1 | Repaired F01 valid. |
| 8.1 metric/negativity | u,a arbitrary; n=1 | log μ multiplier cancels: (4π/τ)(2Re⟨a,u⟩+\|a\|²)−(8π/τ)Re⟨a,u⟩−(4π/τ)\|a\|²=0; curvature coefficient −4π/τ; n=1 torus dimension 0, χ=1 | Correct; positivity in zero tangent dimension is vacuous as intended. |
| 8.2 compactification | Γ(2)/±1; compact neat Γ | D has 3 points in n=1, normal fibre ℂ; compact case D=∅ and X^M=X | Holds. |
| 8.3 asymptotic | q=e^−R, n=1 | ρ=τR/(2π); metric coefficient 1/(2\|q\|²R²); radial volume integral=1/R up to fixed angular constant | Correct 1/4 in ω and finite cusp volume. |
| 8.4/9.2 power cutoff | ℓ=0,1 and f=q^k | radial power r^(2k−1)(−log r)^((ℓ−1)(n+1)); (0,0) integrable, (1,0) divergent, (1,1) integrable | Missing ℓ≥1, R07. |
| 8.5 subvariety volume | n=k=1; flat cylinder | ∫₀^δ dr/(r log²r)=1/(−log δ)<∞; ∫₀^δ dr/r=∞; ν∧ν=0 | Poincaré-growth control holds. |
| 9.1 jets and repaired genus | order k=0,1,2; g=2,3 | weight r^−2n−2 gives radial exponents −3,−1,1: forces order≥2; degrees 4<5,6≥5,8≥7 at (2,2),(2,3),(3,2) | Correct positive-power and finite-jet route. |
| 9.2 boundary sections | Γ(2)/±1, ℓ=2,3 | E=O(1); h⁰(E^ℓ)=3,4; h⁰(E^ℓ(−D))=0,1; curvature input (ℓ−1)(n+1)=2,4 | Boundary-separating claim holds; equivalence needs R07. |
| 9.3 projective embedding | Γ(2)/±1 | E²=O(2); [s:t]↦[s²:st:t²], degree onto conic 1; K=O(−2) has h⁰=0 | Correct role of log twist. |
| 9.4/9.5 minimal model | compact Γ; PSL₂(ℤ); Γ(2)/±1 | boundary sizes 0,1,3; quotients ℙ¹ and its affine open; finite S₃ quotient sends 3 cusps to 1 | General construction compatible with controls. |
| 9.6 curves | Γ₀(11) | squares mod 11={1,3,4,5,9}; −1=10 and −3=8 nonsquares; index=12, cusps=2, genus=1+12/12−2/2=1 | Holds. |
| 10.1 hyperbolic embedding | \|q\|=r=e^−R | circle length=√2π/R→0; radial distance from fixed height grows (log R)/√2→∞; two different cusp tails separated by twice such distances | Holds; torsion quotient ℂ has zero Kobayashi pseudodistance. |
| 10.2 extension | cusp map; exp(1/q) into j-line | cusp limit is 0 in compactifying q-coordinate; along q=1/k, −1/k exponential limits ∞ and 0 | Correct torsion-free restriction. |
| 10.3/10.4 algebraicity/uniqueness | identity; exp; cusp normalization | identity algebraizes with degree 1; exp has essential singularity at ∞; ℂ[t²,t³]⊊ℂ[t], although normalization map is bijective on points | Correct marked uniqueness and normality requirements. |
| 10.5 finite-boundary uniqueness | ℂ*, nodal cubic, toroidal boundary | ℙ¹ adds 2 normal points; nodal cubic identifies 0 and ∞ to 1 nonnormal point; toroidal boundary dimension n−1>0 for n≥2 | Correct controls. |
| 10.6 functoriality | index 6, index 12, identity | generic fibres 6,12,1; SL₂ index 24 drops to projective index 12 | Mathematics consistent; source locator R10. |
| 11.1/11.2 arithmetic | Picard form; definite conjugate real place | h(1,1,0,…)=0, hence isotropic; a K-rational isotropic vector would remain nonzero under a definite embedding, impossible | Correct noncompact/compact tests. |
| 11.3 h₀ and connectedness | z=2,i; 𝐆=SL₂ | h₀(2)=1, h₀(i) acts as −1 on tangent; types (−1,1); PGL₂ determinant-sign image size=2, full domain components=2 versus B=1 | F07 repaired; full-domain assertion R01. |
| 11.4 Baily–Borel | modular curve; Picard surface | boundary cardinality 1 for X(1); cusp boundary dimensions 0, codimensions 1 and 2 | Comparison valid after using X⁺ in R01. |
| 11.5 Borel embedding | n=1, [1:w] | form value=1−\|w\|²; w=0,1,2 give 1,0,−3; compact dual dimension=1 | Positive component embedding holds. |
| 12.1/12.2 special image | full sub-ball; Picard sub-ball; trivial stabilizer | m=n gives degree 1 and normalization identity; w₂=0 gives m=1; trivial stabilizer in PU(1,m) has infinite covolume | Correct lattice condition and finite normalization controls. |
| 12.3 converse | n=1; neat finite cover | only positive-dimensional closed irreducible W is S_Γ; finite cover of degree d multiplies volume by d, hence finite iff original finite | Correct dimension/volume controls. |
| 12.4 dimension inequality | B×{s}, B×S, {x₀}×S | (dim W,dim U)=(n,0),(2n,n),(n,0); each gives dim U=dim W−n | Correct non-atypical equalities, including n=1. |
| Two supplier gaps | cusp, node, affine line | cusp normalization t↦(t²,t³); node normalization has 2 points over 0; affine line completion ℂ[[t]] regular in both categories; t=y/x on cusp is continuous but not in its local ring | Precise README contracts; normality is essential. |

### Seeded source verification

All sixteen cited works have manifest entries. Eight cached extractions are readable; eight entries are settled `uncertified` and were not fetched again. Line locators below refer to the supplied extraction; page numbers refer to the displayed preprint/paper pagination, not to the published Mok chapter's 331–354 pagination. No source was fetched, renamed, or added.

| Seeded target | Text inspected and scope actually supported |
| --- | --- |
| 2.2 | Mok2012 lines 249–254, §1.2 equation (1), p.6, supplies the Siegel potential. BaldiUllmo2023 lines 586–601, pp.14–15, is Poincaré growth, not the coefficient/determinant formula. Those formulas were differentiated independently above. |
| 2.3 | Mok2012 lines 515–516, p.12, is a negative-curvature compactification statement, not a curvature-normalization theorem. Goldman1999 Ch.3 is the explicit but uncertified curvature source. The scale and Ricci value were recomputed. |
| 3.3 | BaldiUllmo2023 lines 478–506, §3.2, p.12, describes Hermitian subdomains for n>1 and their stabilizers; it is not a separate theorem about arbitrary irreducible analytic subsets. The latter is the roadmap's stated continuation/dimension argument using §§3.1–3.2 and K3. Goldman Ch.3 remains uncertified. |
| 4.3 | Mok2012 lines 338–342, p.8, expressly states that a parabolic and hyperbolic element cannot share a boundary point. Torsion-freeness is used for its following stronger identification of the stabilizer, which this roadmap does not import. |
| 4.5 | Mok2012 lines 373–472, pp.9–11, concerns a cusp of the torsion-free finite-volume quotient in its standing setup. Its horizontal-rank argument is not a proof for arbitrary cocompact Δ⊂M·N with finite holonomy; that general input is the cited Raghunathan Ch.VIII, uncertified. The semi-character omission in Mok is not copied here. |
| 7.2 | Mok2012 lines 309–311, p.8, treats a torsion-free lattice and its Kähler quotient. The roadmap's stronger arbitrary-discrete-subgroup assertion is justified by its named quotient/completeness inputs, not by attributing infinite-covolume generality to these source lines. |
| 8.3 | Mok2012 §1.2 equations (1)–(8), lines 240–304, pp.6–7; Proposition 1 at line 295 has the δ^−2(−logδ)^−(n+1) estimate. BaldiUllmo2023 Definition 3.3.4 and Theorem 3.3.5 at lines 586 and 600 give precisely the growth comparison. |
| 9.1 | Mok2012 Theorem 2, lines 495–514, p.12, requires complete Kähler geometry and positive twisted curvature. Lines 681–772, pp.16–17, regularize weights; lines 817–901, pp.18–20, force first-order vanishing and separate points. Finite simultaneous jets follow by disjoint chart cutoffs with the stronger exponent n+1. |
| 9.5 | Mok2012 Main Theorem, lines 546–562, p.13, supplies projective algebraicity in its smooth boundary setting. MilneSVI Remark 3.13(a), lines 1722–1724, p.39, treats arithmetic torsion quotients. BaldiUllmo2023 Theorem 3.1.12, lines 455–465, p.11, proves algebraicity in its real-Shimura setting. Arbitrary torsion here is an owned finite-quotient deduction; it is not the literal hypothesis of Mok's theorem. |
| 9.6 | FuchsianOrbifolds Layer 4, current README lines 604–646, supplies the compactified analytic curve and finite-index maps; combine with §§7.4,9.5. MilneSVI lines 1690–1694, p.38, is the arithmetic n=1 illustration, not all Fuchsian lattices. |
| 10.1 | Kiernan1972 §2, lines 57–75, p.348, gives distance decrease and the sequence criterion for hyperbolic embedding. Deng2020 lines 61–63, p.2, is explicitly arithmetic. The ball covering argument supplies the nonarithmetic distance statement. |
| 10.2 | Kiernan1972 Theorem 1, lines 111–116, p.349, and Theorem 2, lines 157–160, p.350; read the shrinking-circle/coordinate argument and the normal-crossing induction. The proof uses the distance-decrease and boundary-separation properties established in 10.1. MilneSVI Lemma 3.15, lines 1746–1748, p.39, is the arithmetic instance; Borel1972 is uncertified. |
| 10.6 | BaldiUllmo2023 lines 102–104, p.3: fails as an exact locator for this theorem, R10. The degree controls were computed separately. |
| 11.4 | MilneSVI Theorem 3.12 and Remark 3.13, lines 1686–1689 and 1722–1733, pp.38–39, distinguish torsion and the rank-one boundary. Mok2012 lines 123–128, p.3, explicitly describes the ball boundary as finitely many points. BailyBorel1966 Theorem 10.11 remains uncertified. |
| 12.2 | BaldiUllmo2023 Corollary 3.4.6, lines 686–702, p.17, proves algebraicity; lines 433–434, p.11, assert analytic closedness and line 474, p.12, total geodesy. Finiteness, normalization and compactified extension are the roadmap's additional argument, not claims literally contained in that corollary. |

Also read the repaired Selberg locator at WitteMorris2015 Theorem 4.8.4, pp.70–71, and its notes at p.81; the semi-character formulas at Mok2012 pp.4–5,9–11; and MilneSVI's uniqueness argument, pp.39–40. The known uncertified books and articles are listed below rather than described as verified. No unverified source was silently upgraded to certified.

### Pinned declarations and object audit

The content checkout is 9897cdb; the supplied lake manifest and library checkouts use the pins recorded in R05. Library files were opened directly because `roadmaps resolve` reported that its own environment did not have pinned Lake packages. The following locators are at the actual pins; shortened filenames in a row retain the directory of the preceding full filename.

| Native object or input | Declaration and file opened | Contract checked |
| --- | --- | --- |
| Indefinite diagonal | `Matrix.indefiniteDiagonal`, `Mathlib/Algebra/Lie/Classical.lean:175` | `Sum.elim` of 1 and −1, no unitary-group structure implied. |
| Definite unitary matrices | `Matrix.unitaryGroup`, `Mathlib/LinearAlgebra/UnitaryGroup.lean:105` | Native unitary submonoid; not the signature-(1,n) group. |
| Projective carrier | `Projectivization`, `Mathlib/LinearAlgebra/Projectivization/Basic.lean:48`; `instTopologicalSpace`, `Mathlib/Topology/Algebra/Projectivization.lean:44` | Quotient of nonzero vectors; topology is supplied, without automatic separation hypotheses. |
| Projective charts | `Projectivization.instChartedSpace`, `instIsManifold`, `contMDiff_affineChart_symm`, `TauCeti/Geometry/Manifold/Instances/Projectivization.lean:54`, :82, :96 | Native finite-coordinate analytic atlas; R05. |
| Disc and Schwarz | `Complex.UnitDisc`, `Mathlib/Analysis/Complex/UnitDisc/Basic.lean:30`; `Complex.dist_le_div_mul_dist_of_mapsTo_ball`, `Mathlib/Analysis/Complex/Schwarz.lean:189` | Disc carrier; differentiability and maps-to-ball hypotheses. The cited radial inequality itself permits normed complex source/target spaces, even though its use here is on a complex line. |
| Proper action | `ProperlyDiscontinuousSMul`, `Mathlib/Topology/Algebra/ConstMulAction.lean:534`; `finite_stabilizer'` :566 and `finite_stabilizer` :601 | Compact-transporter finiteness, no freeness; finite stabilizers do not need T₂. |
| Discrete subgroup bridges | `Subgroup.properlyDiscontinuousSMul_iff`, `Mathlib/Topology/Algebra/Group/DiscontinuousSubgroup.lean:28`; `Subgroup.properlyDiscontinuousSMul_of_tendsto_cofinite`, `Mathlib/Topology/Algebra/Group/Subgroup.lean:155`; `properlyDiscontinuousSMul_iff_properSMul`, `Mathlib/Topology/Algebra/ProperAction/CompactlyGenerated.lean:95` | Discreteness/continuity and ambient topological hypotheses retained. |
| Fundamental domains and Haar | `MeasureTheory.IsFundamentalDomain`, `Mathlib/MeasureTheory/Group/FundamentalDomain.lean:69`; `covolume` and `covolume_eq_volume` in that file; `MeasureTheory.Measure.isMulLeftInvariant_eq_smul_of_innerRegular`, `Mathlib/MeasureTheory/Measure/Haar/Unique.lean:889` | Null measurability, a.e. coverage/disjointness; Haar uniqueness requires finite measure on compacts and inner regularity. |
| Commensurability | `Subgroup.Commensurable`, `Mathlib/GroupTheory/Commensurable.lean:58` | Finite relative index in both directions, not equality or inclusion. |
| Normalization | `AlgebraicGeometry.Scheme.Hom.normalization`, `Mathlib/AlgebraicGeometry/Normalization.lean:122` | Relative normalization of the specified morphism; normalizing the identity is not ordinary normalization. |
| Ring inputs | `IsJacobsonRing`, `isJacobsonRing_of_finiteType`, `finite_of_finite_type_of_isJacobsonRing`, `Mathlib/RingTheory/Jacobson/Ring.lean:60`, :681, :691; `Ideal.height_le_spanFinrank`, `Mathlib/RingTheory/Ideal/KrullsHeightTheorem.lean:282` | Finite-type/Jacobson and proper-ideal hypotheses; these are not a general Selberg or intersection theorem by themselves. |
| Compact K | `TauCeti.Matrix.isCompact_unitaryGroup`, `TauCeti/Topology/Algebra/UnitaryGroup.lean:104` | Finite matrices over RCLike; sufficient for U(n). |
| Complete metric | `TauCeti.completeSpace_ofRiemannianMetric_of_isPretransitive_isom`, `TauCeti/Geometry/Manifold/Riemannian/Homogeneous.lean:79` | Finite real dimension, T₃, C¹ manifold, continuous Riemannian bundle, pretransitive isometry action. |
| Several-variable analyticity | `DifferentiableOn.analyticOnNhd_of_finiteDimensional`, `TauCeti/Analysis/Complex/CauchyIntegralPolydisc.lean:351` | Open set, finite-dimensional source, complete target; ℂⁿ satisfies them. |
| Quotient charts | `TauCeti.isLocalDiffeomorph_quotientMk`, `TauCeti/Geometry/Manifold/Instances/Quotient.lean:253` | Free (`IsCancelSMul`), properly discontinuous smooth action, T₂ and locally compact manifold. |
| Measurable domain | `MeasureTheory.Measure.exists_isFundamentalDomain_of_properlyDiscontinuousSMul`, `TauCeti/MeasureTheory/Group/ProperlyDiscontinuous.lean:100`; `TauCeti.freeLocus`, `TauCeti/Topology/Algebra/GroupAction/FreeLocus.lean:36` | Actual null-complement hypothesis checked for 5.3; repaired F04. |
| Heisenberg and volume | `TauCeti.HeisenbergGroup`, `TauCeti/GroupTheory/SpecificGroups/Heisenberg.lean:58`; `TauCeti.riemannianVolume`, `TauCeti/Geometry/Manifold/Riemannian/VolumeDensity/Volume.lean:82` | Product (x+x′,y+y′,z+z′+xy′); volume comes from the metric Gram density. |

Object searches covered indefinite form-preserving matrices, projectivization topology/charts, free/proper quotients, covolume and fundamental domains, complete homogeneous metrics, holomorphic analyticity, Selberg/eigenvalues, Zassenhaus/Margulis and finite linear Jordan subgroups. They found no native indefinite unitary group or general eigenvalue Selberg theorem. Searches were narrowed to avoid confusing Schur–Zassenhaus and Jordan permutation theorems with the needed Lie/linear-group results. R05 and R09 are native ownership corrections; the remaining general quotient and measure objects are appropriately imported.

### Supplier and overlap resolution

Read the board package index before ownership conclusions: the three other board packages are AnalyticNumberTheory, LawrenceVenkateshMethod and LogicAndDefinabilityInNumberTheory. None is the owner of a complex-ball construction. Open-head searches were performed with `roadmaps grep` and `roadmaps show`; ownership was not inferred from the local board branch. The closest-roadmap scopes checked were #2026 ArithmeticFuchsianGroups (quaternionic/arithmetic PSL₂ theory, README lines 3–44), #432 KleinianGroups (real hyperbolic three-space, lines 39–85), #1696 FuchsianOrbifoldsPartII (Nielsen cores and quadratic-class comparisons, lines 3–25), #933 ShimuraVarieties, and #848 ComplexComparisonPartII. None supplies the nonarithmetic ball compactification. The Jordan search found #1708, giving R04.

The provided overlap report has no competing head changing this roadmap, no dropped numbered section it cites, and no dependency on numbering found only in an open revision. Directly reading the updated #853 found the declaration-name drift in R06 despite those clean automated results. ComplexKahlerGeometry explicitly preserves K1–K8 via an old→new mapping at its README lines 363–366; these citations are valid, not drift. GeometricTopology on main now includes the real-hyperbolic Margulis theorem (README line 6910); it is not the complex-hyperbolic result and is not evidence of a new supplier dependency. VonNeumannAlgebras is now on main, with the lattice material in Layer 9; the former review's ambiguity about its two PRs is resolved.

Resolved supplier sections, with the actual content read:

- `TauCetiRoadmap/FuchsianOrbifolds/README.md`, Layers 0–4: effective proper PSL₂ action, elliptic quotient charts, cusps/q-coordinates, compactified curve; Layer 4 at 604–646 includes finite-index maps and degree. This roadmap only compares the n=1 specialization.
- `Completed/ConformalMapping/README.md`, Layer 2: disc Schwarz–Pick and automorphisms, with its curvature−1 upper-half-plane comparison. `Completed/HopfRinow/README.md`, Layers 0–4 at 229–495: intrinsic distance, geodesics, normal neighborhoods and completeness.
- `TauCetiRoadmap/RiemannianGeometry/README.md`, R4.7 at 2382–2404: quotient metric, completeness and local-isometry uniqueness; R5a supplies the second fundamental form. Much of its quotient construction is now pinned and imported by that supplier.
- `TauCetiRoadmap/ComplexKahlerGeometry/README.md`, K1–K4 and K6.0, using its retained labels: type calculus, analytic germs and irreducible components, Riemann/Hartogs on manifolds, Chern and canonical-bundle geometry, and the positive `(n,k)` curvature bound. Its sign convention agrees with g(u,v)=ω(u,Jv); no singular-normal extension is silently taken from its manifold theorem.
- `TauCetiRoadmap/ComplexManifolds/README.md:238`, :267, :296, :319: Milestones 4–7, respectively free quotients, compatible open gluing, topological gluing hypotheses, and bundle cocycles. Finite gluing is not claimed to be Hausdorff without the supplier's hypotheses; precise cusp neighborhoods provide the intended separated gluing.
- `TauCetiRoadmap/VonNeumannAlgebras/README.md:2861`, Layer 9: finite-covolume discrete lattices and Weil's formula, including uniform/nonuniform cases and Haar rescaling.
- #848 `TauCetiRoadmap/ComplexComparisonPartII/README.md`, C−1.1–C−1.2 (analytic spaces, analytification, smooth charts and completed stalks), C0.6 at 1460 (analytic normalization), C1.4 at 1678 (positive weighted L² estimate and canonical twist), C1.6 at 1850, C1.9 at 1966, C4.1 at 2667, C4.2 at 2689, C4.4 at 2730. The named `ComplexAnalyticSpace`, `complexSchemeAnalytification`, `completedAnalyticStalkComparison`, `analyticSetGeometry`, `weightedDolbeaultEstimate`, `projectiveComplexGaga`, `remmertProperImage`, `remmertSteinExtension`, `projectiveChowNonreduced`, `properSourceMorphismAlgebraicity`, `algebraicGraphRegular` are supplier targets, not claims about pinned declarations.
- #933 `TauCetiRoadmap/ShimuraVarieties/README.md`: P.1–P.2 at 154–180, P.6 at 232–234, 0.4 at 299, 1.2 at 391, 2.7 at 659, 3.3 at 769, 3.4a at 807, 3.5 at 919. All eight cited `TauCeti.Shimura.*` identifiers remain targets there. Its component convention exposes R01.
- #792 `TauCetiRoadmap/AdelicAlgebraicGroups/README.md`, §3.4 at 3184–3371: `Reduction.IsSArithmetic`, `Reduction.arithmetic_finite_volume_iff`, `Reduction.levelArithmetic`, character obstruction and anisotropic cocompactness. Semisimplicity in §11.1 removes the character obstruction.
- #966 `TauCetiRoadmap/PELModuli/README.md:3663`, M5.5: unitary rational datum and signature; the pure-datum conclusion at 3684 retains connectedness and SV3. The imaginary-quadratic (1,n) example meets them. #1038 `TauCetiRoadmap/ShimuraData/README.md:528`, §3.8: compact dual and Borel embedding, retaining chosen component as required by R01.
- #853 `TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry/README.md:8674`, §5.4: normalization and finiteness over Nagata bases; §9.5 at 10167: SNC compactification by explicit import. ℂ is an excellent field. The theorem is present; the three purported declarations are not (R06).
- `TauCetiRoadmap/SchemeAndStackFoundations/README.md:2761`, §1.17: `finiteGroupQuotient_projective`, with projectivity over a Noetherian base, finite surjective quotient and invariant structure sheaf. No freeness or invertibility of the group order is required by this supplier.
- #871 `TauCetiRoadmap/ArithmeticLocallySymmetricSpaces/README.md:1364`, ALS.0.5: proper action, discrete effective image and finite kernel. It is cited only to delimit ownership, not used as a hidden arithmeticity assumption.

The required gate output was:

```text
candidate: BallQuotientsAndComplexHyperbolicLattices is not in the merge order yet; checked as if placed after ShimuraData (the intake inserts it when its design is accepted)
depcheck: 224 roadmaps, 2040 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line for the **declared external** graph. This does not repair the internal cycle (R02) or the undeclared input (R04). The read-only `roadmaps resolve` run found no unresolved cross-roadmap names in its aggregate index, but expressly did not check pinned names in its environment; direct source opening above is the evidence used here.

The two declared gaps remain legitimate contracts. `normality-analytification` is the completed-local-ring comparison with normality, regularity and normalization consequences; `normal-riemann-extension` is the continuous extension theorem on a normal analytic source, with a nowhere-dense analytic exceptional subset. The README states the hypotheses and examples; plan slugs and supplier sections match. No earlier source read here supplies the missing singular-space statements outright. They are not counted as unowned prerequisites.

### Headline acceptance-test audit

The headline list from the summary and scope is: Aut(B)=PU(1,n) (§2.1); invariant complete negative-curvature metric (§§2.2–2.4); totally geodesic classification (§3.3); Margulis and cusp structure (§§4.4,6.1); finite generation/presentation and eigenvalue Selberg/neat finite index (§§6.2–6.4); analytic and toroidal quotients (§§7.1–8.2); L² jets and projective minimal compactification (§§9.1–9.5); extension, Borel algebraicity and marked uniqueness (§§10.2–10.5); finite-index functoriality (§10.6); arithmetic Shimura/Baily–Borel comparison (§§11.3–11.4); and Γ-special/totally geodesic equivalence with the graph dimension framework (§§12.2–12.4). The excluded Baldi–Ullmo finiteness and Ax–Schanuel conclusions are consumers, not missing headlines here.

This is a **design** review: there is no `Suggested.lean`, so no missing-declaration or padding verdict is asserted about a nonexistent package file. Elaboration: **not available (this lane does not elaborate; say so in the report)**. No Lean command was run; there was no `#check @name` pass and no executable one-tactic probe, and therefore no claim of a passing build or of “sorry is the only warning”. No admitted data, forbidden import, `set_option`, or padding declaration exists in this design package.

For the package worker, Cartan uniqueness is statable on native bounded open connected subsets of finite-dimensional complex spaces with derivatives; eigenvalue Selberg is statable using native linear groups, finite generation, roots of unity, eigenvalues and finite index. They must not be omitted merely because the ball-quotient analytic-space carrier is missing. Quotient compactification/algebraicity headlines need analytic-space/analytification and geometric bundle carriers still described by suppliers; the module docstring must name any unavailable headline individually. Native projective topology/charts cannot now be listed as missing. These are acceptance-test checks to perform when a Lean file exists, not a request to add one during this design review.

## Not verifiable

- Goldman1999 Ch.3; Raghunathan1972 Ch.VIII and XIII; Borel1969 §17 Corollary 17.7; Alperin1987 pp.269–273; Borel1972 Theorem A; BailyBorel1966 Theorem 10.11; SiuYau1982 main theorem; Cartan1957 pp.90–102: their manifest entries are settled uncertified. Their exact text and pagination were not independently certified, and no request was reopened. In particular the general finite-holonomy theorem in §4.5 rests on an unread general locator, not on the narrower Mok passage.
- The source cache contains Mok's IMR2009-4 preprint, not the published chapter layout. The manifest and README correctly identify the version; published-page correspondence beyond the chapter's bibliographic range was not checked.
- No Lean elaboration, one-tactic proof execution or elaborated-type inspection is available in this lane. Static reading and the computed mathematics above do not substitute for a future package build.
- Open-work ownership was checked against the supplied 432-head index and the identified board-package index. Later changes outside that snapshot were not inspected. No outside PR or issue was written.

## Source issues

- **Misprint** in Mok2012 at §1.1 equation (1), printed p.4, line 144: the source says the horizontal pairing is bilinear; it should be conjugate-linear in its first argument for the displayed action to preserve the height; affects a stated result.
- **Error** in Mok2012 at §1.1 equations (5)–(6), printed p.5, and §1.3 (II), printed p.9: the source says every vertical component is an integral multiple of τ and omits a multiplier; it should be a coset t_a+τℤ with the unitary semi-character factor; affects a stated result.
- **Gap** in Mok2012 at Theorem 1, printed p.11, lines 476–484: the source says torsion-freeness suffices for the displayed torus-boundary construction; it should require unipotent cusp stabilizers or justify the extra finite-cover descent; affects the proof.
- **Misprint** in Mok2012 at §2.2, printed p.14, line 604: the source says the divisor twist is O(−D); it should be O(D), consistent with its Main Theorem and logarithmic frame; affects nothing.
- **Misprint** in Mok2012 at §2.2, printed pp.16,18–19, lines 718,824,879: the source says to apply Theorem 1 for the L² equation; it should refer to Theorem 2, the stated L² existence estimate; affects nothing.
- **Misprint** in Mok2012 at §2.2, printed p.20, lines 895–896: the source says s=u−χe^k has value e^k where u vanishes and χ=1; it should use s=χe^k−u, or value −e^k; affects nothing.
- **Misprint** in MilneSVI at Remark 3.13, printed p.39, lines 1727,1734: the source says both successive items are labelled (c); it should label the second one (d); affects nothing.
