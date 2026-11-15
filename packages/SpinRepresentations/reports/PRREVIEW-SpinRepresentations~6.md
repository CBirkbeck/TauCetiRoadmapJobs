# Review of SpinRepresentations (pull request #1207 at 20b4750)
Folder: `TauCetiRoadmap/RepresentationTheory/SpinRepresentations/`

**Verdict:** needs changes

## R01 (P2) — Consume the implemented monomial-group theory

**Location:** `TauCetiRoadmap/RepresentationTheory/SpinRepresentations/README.md:514`: “construct `G_n`”; “Prove the normal form, multiplication signs, cardinality”.
**Claim:** Layer 1 assigns existing finite Clifford-group constructions and representation results to this roadmap.
**Witness:** Pinned `TauCeti/LinearAlgebra/CliffordAlgebra/MonomialGroup/Basic.lean:746,755,865` supplies cardinality, centre and quotient; `TauCeti/RepresentationTheory/Spin/MonomialGroup/Spinor.lean:432,449,463` supplies uniqueness and dimensions of the negative-central-character irreducibles.
**Repair:** Delete these construction targets; consume `CliffordAlgebra.monomialGroup`, `monomialGroupEquiv`, `natCard_monomialGroup`, `mem_center_monomialGroup_iff`, `monomialGroupAlgebraQuotientEquiv` and the named Spinor/Character results in the supplier contracts. Keep the n=2,3 computations as Checks and state only additional comparisons not provided there.

## R02 (P2) — Use the existing quadratic-form coordinate adapters

**Location:** `TauCetiRoadmap/RepresentationTheory/SpinRepresentations/README.md:489,545`: “build the reduction”; “prove the coordinate adapter”.
**Claim:** Diagonalization, complex sum-of-squares normalization and the matrix membership criteria are already supplied.
**Witness:** `Mathlib/LinearAlgebra/QuadraticForm/IsometryEquiv.lean:159,177`; `TauCeti/LinearAlgebra/QuadraticForm/SepClosed.lean:63`; `TauCeti/LinearAlgebra/QuadraticForm/OrthogonalGroup/Coordinate.lean:35,49` have precisely these hypotheses and conclusions.
**Repair:** Consume `QuadraticForm.isometryEquivWeightedSumSquares`, `equivalent_weightedSumSquares_units_of_nondegenerate'`, `equivalent_weightedSumSquares_of_isSepClosed`, and `TauCeti.QuadraticMap.mem_orthogonalGroup_iff_toMatrix`/`mem_specialOrthogonalGroup_iff_toMatrix`. Retain only transport of these specified isometries into the spin constructions; retain D rather than replacing it by 1 in arbitrary coordinates.

## R03 (P2) — Consume the native complex polar deformation

**Location:** `TauCetiRoadmap/RepresentationTheory/SpinRepresentations/README.md:648,660`: “Establish the following concrete polar construction”; “Own the finite-matrix positive-power adapter”.
**Claim:** The positive powers, continuity, retraction and homotopy on the complexification of a positive real form are implemented at the pin.
**Witness:** `TauCeti/LinearAlgebra/CliffordAlgebra/Spin/RealPower.lean:109` proves power membership; `TauCeti/Topology/Algebra/CliffordAlgebra/Spin/Polar.lean:99,137,170` defines the stated retraction, relative homotopy and homotopy equivalence.
**Repair:** Consume `CliffordAlgebra.leftMulMatrixRpow_complexConj_reverse_mul_self_mem_spinGroup`, `spinPolarRetraction`, `spinPolarHomotopyRel`, `spinPolarHomotopyEquiv` and their continuity/apply results. Keep the identification of the unitary part with compact real Spin and the explicit isometry/topology transport to arbitrary complex Q as the remaining comparisons.

## R04 (P2) — Delete the duplicate odd-line-sign construction

**Location:** `TauCetiRoadmap/RepresentationTheory/SpinRepresentations/README.md:775`: “both choices of line-coordinate sign and their central-summand comparison, as the **OddLineSignComparison** target”.
**Claim:** The replacement polarization, parity intertwiner, volume characters and faithful product action are already constructed.
**Witness:** `TauCeti/RepresentationTheory/Spin/LineSign.lean:125,149,171,256` supplies the all-element sign equation, Spin equivalence, opposite volume eigenvalues and `cliffordEquivEndProd`.
**Repair:** Consume `TauCeti.SpinPolarizationData.negLineCoordinate`, `spinAction_negLineCoordinate_apply`, `spinRepEquivNegLineCoordinate`, `exists_spinAction_volume_eq_algebraMap` and `cliffordEquivEndProd`; delete OddLineSignComparison as new work. Preserve the dimension-one Check: the full characters differ while their Spin restrictions agree.

## R05 (P2) — Consume both Fock equivariance identities

**Location:** `TauCetiRoadmap/RepresentationTheory/SpinRepresentations/README.md:808,812`: “**SpinActionEquivariance** owns the identity”; “**PinActionEquivariance** owns the companion identity”.
**Claim:** Both displayed formulas are pinned Tau Ceti theorems, including the Pin parity sign.
**Witness:** `TauCeti/RepresentationTheory/Spin/Equivariance.lean:78,102`: `TauCeti.pinRep_mul_spinAction_ι_mul_pinRep_inv` and `TauCeti.spinRep_mul_spinAction_ι_mul_spinRep_inv` act on the same native Fock carrier.
**Repair:** Delete these two ownership claims and cite those declarations in the supplier contract and triality-form dependencies. Keep the separate smooth differential comparison.

## R06 (P2) — Consume the implemented exceptional representation comparisons

**Location:** `TauCetiRoadmap/RepresentationTheory/SpinRepresentations/README.md:982,993,1005`: “own here the identification of its two factors with the half-spin projections”; “Own here only the identification of `S`”; “own the identifications of `S⁻` with its dual”.
**Claim:** The rank-four half-spin factors, rank-five standard module and rank-six half-spin duality are all native results.
**Witness:** `TauCeti/RepresentationTheory/Spin/Exceptional/Four/HalfSpin.lean:47`, `TauCeti/RepresentationTheory/Spin/Exceptional/Five/Group.lean:65`, and `TauCeti/RepresentationTheory/Spin/Exceptional/Six/Polarized.lean:62` each supplies the group equivalence together with the asserted representation equivalence; `TauCeti/RepresentationTheory/Spin/Exceptional/Six/HalfSpinDual.lean:217` supplies the duality.
**Repair:** Consume the `exists_spinGroup_mulEquiv_specialLinearGroup_prod_and_halfSpin_equiv_stdSLRep_of_finrank_eq_four`, `exists_spinGroup_mulEquiv_symplecticGroup_and_spinRep_equiv_stdSymplecticRep_of_finrank_eq_five`, and `exists_spinGroupEquivSpecialLinearGroupOfFinrankEqSix_and_halfSpin_equiv_stdSLRep_and_dual` theorems in namespace `TauCeti`. Keep only additional specified-form comparisons and the rank-six vector/exterior-square comparison.

## R07 (P2) — Consume the real image and component theorems

**Location:** `TauCetiRoadmap/RepresentationTheory/SpinRepresentations/README.md:1048,1153`: “identify the norm-sign kernel in SO(p,q) with its identity component”; “Prove that the native group is path connected when p+q≥3”.
**Claim:** The real identity-component image, path connectedness and exceptional (1,1) component classification are already implemented on the requested topological carriers.
**Witness:** `TauCeti/Topology/Algebra/CliffordAlgebra/Spin/Real/IdentityComponent.lean:127,144`, `Connected.lean:247`, and `OneOne.lean:141,187,211` supply these results, including the two-component product model.
**Repair:** Consume `CliffordAlgebra.range_spinToSpecialOrthogonal_realCliffordForm_eq_connectedComponentOfOne`, `pathConnectedSpace_realCliffordSpinGroup`, and `realCliffordSpinOneOneContinuousMulEquiv` with their kernel/component corollaries. Keep the K(p,q) maximal-compact and real Lie-algebra adapters as separate targets.

## R08 (P2) — Import the positive-root dimension identity

**Location:** `TauCetiRoadmap/RepresentationTheory/SpinRepresentations/README.md:1547`: “Two bookkeeping pins absent from Mathlib precede the multiplicity statements”.
**Claim:** The Cartan-dimension parity identity is already in the pinned Tau Ceti library; only the further rank comparison remains here.
**Witness:** `TauCeti/Algebra/Lie/Weights/Dimension.lean:174,182` proves `dim L = dim H + 2·#Δ⁺`, for the same Cartan subalgebra and root base.
**Repair:** Replace this passage by: “Prove `LieAlgebra.rank ℂ 𝔤 = dim H`; combine it with `TauCeti.finrank_eq_finrank_cartan_add_two_mul_card_isPos` to obtain `d = l + 2·#Δ⁺`.” Record that native declaration as the parity supplier.

## R09 (P2) — Give the zero-rank norm-one comparison one owner

**Location:** `TauCetiRoadmap/RepresentationTheory/SpinRepresentations/README.md:610,620`: “**ZeroRankGeneratedNormalizerComparison** is owned here”; “Prove these statements and their comparison with the generated carriers directly”.
**Claim:** The trivial generated Spin carrier versus full even norm-one scalar group μ₂ is also owned by OrthogonalSpinGroups §1F on main; calling its proof independent leaves two owners.
**Witness:** Main `Completed/OrthogonalSpinGroups/README.md:568` states this comparison; revision #1181 retains it at `Completed/OrthogonalSpinGroups/README.md:670`. Over ℂ the compared groups have orders 1 and 2.
**Repair:** Import the generated-Spin versus even-norm-one comparison from OrthogonalSpinGroups §1F in this separate general-field branch. Retain here only the additional full twisted-normalizer identification with Kˣ, explicitly distinguishing it from the imported μ₂ comparison.

## R10 (P2) — State the remaining rank-six headline

**Location:** `TauCetiRoadmap/RepresentationTheory/SpinRepresentations/README.md:1006`; `TauCetiRoadmap/RepresentationTheory/SpinRepresentations/Suggested.lean:26`: “and of `V` with `⋀²(ℂ⁴)`”.
**Claim:** The rank-six vector/exterior-square endpoint is absent from the acceptance test although all its carriers and actions exist at the pins.
**Witness:** The scratch signature using `V ≃ₗ[ℂ] (⋀[ℂ]^2 (Fin 4 → ℂ))`, `spinToSpecialOrthogonal`, `(TauCeti.stdSLRep ℂ 4).exteriorPower 2`, and `spinGroupEquivSpecialLinearGroupOfFinrankEqSix` elaborates without extra definitions.
**Repair:** Add a Layer 6 headline asserting, for a six-dimensional complex Q and polarization P, an equivalence E satisfying `E(spinToSpecialOrthogonal Q g v) = ((TauCeti.stdSLRep ℂ 4).exteriorPower 2 (TauCeti.spinGroupEquivSpecialLinearGroupOfFinrankEqSix P hV g)) (E v)` for all g,v. This specifies the same group isomorphism as the README.

## R11 (P3) — Finish the required roadmap structure

**Location:** `TauCetiRoadmap/RepresentationTheory/SpinRepresentations/README.md:1,200,266,335`: “## What Mathlib already has (consume)”; “## The build, in layers”.
**Claim:** Previous R03 remains partly unrepaired: the required scope/contracts sections, per-target dependencies and per-layer Examples/Dependencies are absent.
**Witness:** The README has ten `### Layer` headings, zero `*Needs:*` lines, zero `### Examples` and zero `### Dependencies`; it lacks `**Summary.**`, `## Scope and ownership`, `## Exact supplier contracts` and `## How to read the build`.
**Repair:** Reorganize the existing content into the prescribed sections, use `## Layer k` and numbered mathematical subsections, move consumed results to scope/contracts, give each retained definition its API and three discriminating Checks, and add target-specific Needs plus each layer's Examples/Dependencies. Preserve the mathematical scope and numbering references.

## R12 (P3) — Correct the zero-dimensional negative control

**Location:** `TauCetiRoadmap/RepresentationTheory/SpinRepresentations/README.md:442`: “a criterion requiring nondegeneracy would be silent here”.
**Claim:** The zero-dimensional quadratic form is nondegenerate, so this Check does not distinguish a nondegeneracy restriction.
**Witness:** On V=0 the radical is {0}; the nondegeneracy predicate and both automorphism criteria are true. The following positive-dimensional zero-form example has nonzero radical and does distinguish the restriction.
**Repair:** Replace the final clause by “a criterion requiring positive dimension would wrongly exclude this case.” Retain the zero-form-on-a-line Check for the nondegeneracy distinction.

## R13 (P3) — Attach exact locators to the remaining targets

**Location:** `TauCetiRoadmap/RepresentationTheory/SpinRepresentations/README.md:374,1474,1559`: “SpinSimplyConnectedIntegrationComparison”; “Kostant's full `ρ`-decomposition … is a required, strictly stronger construction target”.
**Claim:** Several retained constructions have no theorem/section-and-page locator at their statement; a bibliography entry or a whole-paper title does not identify the supporting result.
**Witness:** L0.Bogoliubov has no literature locator; the full ρ-decomposition has only the surrounding Kostant §§1–2 citation. The integration input is identifiable as Kirillov Theorem 3.38, printed p.31, `kirillov2008` line 1113.
**Repair:** Give the Bogoliubov criteria and full ρ-decomposition precise supporting locators, distinguishing derived consequences from quoted theorems. Attach Kirillov Theorem 3.38, p.31 to the integration comparison and Conrad Theorem 6.1.17, p.197 to the pinned-isomorphism step; retain their named roadmap suppliers. Add printed pages to the seeded highest-weight/triality locators without claiming to have certified the unavailable books.

## R14 (P3) — Correct the description's remaining-work claim

**Location:** Pull-request description, prose after `roadmap-summary`: “plans only what they do not provide”.
**Claim:** This sentence is contradicted by the head's remaining-target inventory, independently of the accurate account of the removed Lean declarations.
**Witness:** `TauCetiRoadmap/RepresentationTheory/SpinRepresentations/README.md:776` still owns OddLineSignComparison; pinned `TauCeti/RepresentationTheory/Spin/LineSign.lean:125,149,256` already supplies it.
**Repair:** Complete the ownership repairs above and refresh the description to name the additional native APIs consumed: monomial groups, coordinates, polar deformation, line-sign and equivariance comparisons, exceptional representation comparisons, and real components. Until repaired, replace the sentence by “The revision consumes many native APIs; further native-result deferrals remain in the README.”

## Verified sound

| Previous finding | Head passage | Resolution |
|---|---|---|
| r5 R01: statement hygiene | README:913 “these four identifications are native”; Lean:140 `nonempty_kostant_isotypic` | Repaired: gate reports zero statement-hygiene hits. |
| r5 R02: padding | Lean:15 “single definition (`kostantSpinRep`)” | Repaired: seven model/matrix helpers deleted; seven remaining headlines resist probes. |
| r5 R03: shape and bad references | README:266 “Native producers and remaining comparisons”; README:250 `Module.Basis.exteriorPower` | Partly repaired: names/process headings corrected; structural remainder is R11. |
| r5 R04: negative-form supplier | README:1111 consumes `realCliffordSpinGroupEquivNeg`; README:1097 links G1.1 | Repaired: native group comparison consumed; even-algebra/topology variants distinguished. |
| r5 R05: obsolete PR text | Description: “Against main, 50 declarations are removed” | Earlier omission repaired; R14 concerns the remaining-work overclaim at this head. |

| Statement / target | Instances tried | Computed left side | Computed right side / control | Result / change |
|---|---|---|---|---|
| Clifford relation and polar convention | Q(e)=1; x=y=e | ee+ee=2 | polar(e,e)=2 | Agrees; factor two retained. |
| Exterior/Fock polarization | Hyperbolic pair w,w′; vacuum 1 | C A(1)=0; A C(1)=1 | (C A+A C)(1)=1 | Agrees with polar(w,w′)=1. |
| Word filtration / associated graded | Zero form on a line | dimensions F₀,F₁,F₂ = 1,2,2 | graded dimensions 1,1,0; ε²=0 | Agrees, including degenerate Q. |
| Clifford rank formula | n=0,1,2 | dimensions 1,2,4 | 2⁰,2¹,2² = 1,2,4 | Agrees. |
| Nontrivial-ring hypothesis | Zero ring, zero module | finrank Clifford=0 | 2⁰=1 | Correctly excluded. |
| Generator-preserving group B(Q) | Q=0 on a line; scalings 2,3 | composite ε↦6ε; inverse ε↦ε/2 | isometry composite 6; inverse 1/2 | Group convention agrees. |
| `generator_range_iff` | V=0 | W=0; only automorphism=id | unique isometry=id | Both directions true. |
| `generator_range_iff` | Q=0 on a line; ε↦2ε | image W=W | unique isometry e↦2e | Both directions true without nondegeneracy. |
| `generator_range_iff` | Positive real plane; conjugation by diag(2,1) | X↦[[0,2],[1/2,0]], outside W | no inducing isometry | Both sides false. |
| `first_word_piece_iff` | Same plane automorphism | generator image outside W | trace-zero image outside span{1,Z,X} | Both sides false. |
| `first_word_piece_iff` | Q=0 on two generators; e₁↦e₁+e₁e₂ | e₁+e₁e₂ outside W | outside F₁ | Both sides false. |
| Filtration versus parity | Cliff(4,0), u=2+ω | u e₁ u⁻¹=(5e₁−4e₂e₃e₄)/3 | odd, but degree-three coefficient −4/3 | Grading alone rejected. |
| Functoriality / scalar extension | Real line Q(x)=x²; f=−id | induced generator −e over ℝ | extended generator −e over ℂ | Comparison agrees; no descent assertion. |
| Zero-dimensional Check | V=0 | radical=0, nondegenerate=true | claimed nondegeneracy exclusion=false | R12. |
| Diagonalization / normalization | Q=diag(1,2) over ℂ | basis e₁,e₂/√2 gives diag(1,1) | native sum-of-squares target diag(1,1) | R02: supplied. |
| Matrix O/SO criterion | D=diag(1,2); coordinate swap A | AᵀDA=diag(2,1) | D=diag(1,2); unequal | R02; do not use AᵀA alone. |
| Even Clifford structure | n=0,2,4 | Clifford dimensions 1,4,16 | End dimensions 1²,2²,4² | Native statement agrees. |
| Even subalgebra / half-spin boundary | n=0,2 | even dimensions 1,2 | End(ℂ)×End(0):1; ℂ×ℂ:2 | Zero-rank exception agrees. |
| Odd Clifford structure | n=1,3 | dimensions 2,8 | ℂ×ℂ:2; M₂×M₂:8 | Native statement agrees. |
| Nondegeneracy in complex classification | Zero form on a line | nonzero ε with ε²=0 | ℂ×ℂ has no nonzero nilpotent | Correctly excluded. |
| Monomial group / quotient | n=0,1 | group orders 2,4 | quotient-algebra dimensions 1,2 | R01: supplied. |
| Monomial classes / irreducibles | n=2 | order8; classes5; centre2 | 4·1²+2²=8 | R01; nonabelian control. |
| Odd monomial classes / irreducibles | n=3 | order16; classes10; centre4 | 8·1²+2·2²=16 | R01. |
| Generated versus full zero-rank carriers | V=0 over ℂ | generated Spin order1 | even norm-one scalars μ₂ order2 | R09: shared owner; full normalizer ℂˣ. |
| Spin double-cover boundary | n=0,1 | kernel orders 1,2 | generated groups 1,{±1}; SO₁=1 | Positive-dimension restriction retained. |
| Pin surjectivity sign | Positive real line | norm-one Pin={±1}; vector image={id} | O₁={±id} | Native square hypothesis fails: −1 not square. |
| Negative real line Pin | e²=−1 | e·star(e)=1; e⁴=1 | Pin=C₄; reflection image order2 | Full O₁ image agrees. |
| Compact connectivity | n=0,1,2,3 | groups 1,μ₂,S¹,S³ | π₁:0,0,ℤ,0; n=1 disconnected | Thresholds agree. |
| Complex polar power / retraction | Spin₂ torus z=2 | g†g has eigenvalues 4,1/4 | g(g†g)⁻¹ᐟ² has eigenvalues 1,1 | R03: native construction. |
| Polar homotopy / fixed locus | z=2 and z=exp(iθ) | H₀(2)=2; H₁(2)=1 | H_t(exp(iθ))=exp(iθ) | R03; compact part fixed. |
| Bivector normalization | Q(e₁)=Q(e₂)=1; β=e₁e₂ | [β,e₁]=−2e₂; [β,e₂]=2e₁ | polar formula gives −2e₂,2e₁ | Agrees. |
| Algebraic versus differential Lie action | g(t)=exp(t e₁e₂) | vector derivative e₁↦−2e₂ | Clifford commutator e₁↦−2e₂ | Normalization agrees; smooth comparison remains. |
| Fock Clifford action | Hyperbolic pair on span{1,w} | C²=A²=0; CA+AC=id₂ | Q(w)=Q(w′)=0; polar=1 | Native construction agrees. |
| OddLineSignComparison | n=1, Q(e)=1 | c_P(e)=1; c_P⁻(e)=−1 | J=id; Spin restrictions identical | R04: native comparison. |
| Odd faithful product / volume | n=3 | volume eigenvalues λ,−λ; λ²=−1 | End₂×End₂ dimension8 | R04; one summand alone not faithful. |
| SpinActionEquivariance | Central g=−1 | conjugated c(v)=c(v) | vector action v↦v | R05: native identity. |
| PinActionEquivariance | Negative unit e, v=e, odd parity | ρ(e)c(e)ρ(e)⁻¹=c(e) | −c(reflection(e))=−c(−e)=c(e) | R05; missing sign would fail. |
| Half-spin invariance / dimensions | Half-rank 0,1,2 | (dim S⁺,dim S⁻)=(1,0),(1,1),(2,2) | positive ranks: (2ˡ⁻¹,2ˡ⁻¹) | Correct boundary separated. |
| Group irreducibility | Spin₂ on S⁺⊕S⁻ | two invariant one-dimensional lines | full S dimension2, reducible | Restriction to even-Clifford summands essential. |
| SpinHighestWeights is algebraic (seed) | Half-rank 2,3,4,5 | top degrees even,odd,even,odd | top ω_l lies in S⁺,S⁻,S⁺,S⁻ | Parity matches; source book uncertified. |
| Cartan and highest vectors | H_i=N_i−1/2 | vacuum weight −1/2; occupied slot +1/2 | top wedge weight (1/2,…,1/2) | Factor and Borel agree. |
| D low-rank exceptions | l=0,1,2,3 | S⁺ dimensions 1,1,2,4 | D₀/D₁ absent; D₂=A₁², D₃=A₃ | Missing low-rank abstract carrier recorded. |
| Tensor-power obstruction | B₁ vector weights −1,0,1 | all tensor weights integers | spin weights −1/2,+1/2 | Obstruction holds. |
| SpinGroupHighestWeightCorollary | B₀, generated Spin₁ | −1 acts by −1 on S=ℂ | Lie algebra zero acts by zero | README keeps group data beyond differential. |
| Formal spin character | l=2 | four sign weights, coefficients1 | dimension4; product (1+1)²=4 | Native Lie character agrees; lattice transport remains. |
| Spin₃ standard module | diag(2,1/2) in SL₂ | spin eigenvalues 2,1/2 | standard eigenvalues 2,1/2 | Consumed headline. |
| Spin₄ half-spin factors | (diag(2,1/2),id) | traces on S⁺,S⁻:5/2,2 | standard factor traces 5/2,2 | R06: supplied. |
| Spin₅ standard representation | diag(2,3,1/2,1/3) in Sp₄ | spin dimension4; paired eigenvalues | standard dimension4; products 1,1 | R06: supplied. |
| Spin₆ half-spin duality | SL₄ diagonal (2,1/2,1,1) | S⁺ eigenvalues (2,1/2,1,1) | dual eigenvalues (1/2,2,1,1) | R06: supplied. |
| Spin₆ vector/exterior square | Same diagonal; native half-spin equivalence | vector weights pair products | (1,2,2,1/2,1/2,1), dimension6 | R10: statable missing headline. |
| Real Clifford indexing | (p,q)=(1,0),(0,1),(0,2) | ℝ²,ℂ,ℍ; dimensions2,2,4 | residues q−p=7,1,2 | Sign convention agrees. |
| Real periodicity | Shift (p,q)↦(p+1,q+1), or p+8 | dimension factors4,256 | M₂ and M₁₆ factors4,256 | Native periodicity agrees. |
| Full cover versus norm-one Spin | Signature(1,1), z=e₁e₂ | z²=1; reverse(z)z=−1 | z in full even cover, outside Spin | Distinction agrees. |
| Real identity-component image | Signature(1,1) | Spin image positive boosts, norm sign+1 | −id has norm sign−1, outside SO₀ | R07: native image theorem. |
| Real components | Spin(1,1) | ±(cosh t+sinh t·z), two components | μ₂×ℝ, two components | R07: native model. |
| Real path connectedness | (2,1),(2,2); same-sign plane | exp(πe₁e₂)=−1 | path connects the two kernel elements | R07: native theorem. |
| NegativeFormEvenComparison | n=2, volume e₁e₂ | square −1 for positive form | square −1 for negative form | Even-algebra convention agrees. |
| K(p,q), diagonal quotient | (1,1) | μ₂×μ₂ order4; diagonal kernel2 | K order2 | Quotient is necessary. |
| K(p,q), polar dimension | (2,1),(2,2),(3,1) | dimK+pq=1+2,2+4,3+3 | dimSpin=3,6,6 | Checks agree. |
| Real Lie semisimplicity | (1,1),(2,2) | abelian dimension1; sl₂⊕sl₂ dimension6 | not semisimple; semisimple but not simple | Exceptions agree. |
| Numbering and orientation (seed) | σ=(1 3 4), node2 fixed | inverse pullback: ω₁↦ω₄↦ω₃↦ω₁ | V↦S⁺↦S⁻↦V | Cycle direction agrees. |
| Numbered Clifford Serre realization | E₄=C₃C₄, F₄=A₄A₃ | [E₄,F₄]=N₃+N₄−1 | simple coroot H₄ | Fork sign agrees. |
| Root-subgroup construction | E₄²=0; u=2,v=3 | (1+2E₄)(1+3E₄)=1+5E₄ | x₄(5)=1+5E₄ | Additivity/inverse agree. |
| Root action on V | x₁(u), pair b₂,b′₁ | b₂+u b₁; b′₁−u b′₂ | polar value −u+u=0 | Wrong plus sign gives 2u. |
| Coroot normalization | SL₂ block, z=2 | n(z)n(−1)=diag(2,1/2) | h(z) weights z,z⁻¹ | Agrees for z∈ℂˣ. |
| Coroot sign Check | h₄(1) on vacuum | eigenvalue1 | replacing n(−1) by n(1) gives −1 | Wrong normalization rejected. |
| Spin torus faithfulness | s=(2,3,5,7) | selected S weights 7,5,3/7,2/7 | recover s₄,s₃,s₂,s₁ uniquely | Injectivity discrimination works. |
| Vector torus kernel | s=(1,1,−1,−1) | vector eigenvalues all1 | full spin eigenvalues all−1 | Kernel {±1}, not trivial. |
| SpinTrialityPinnedCarrierComparison (seed) | Complex D₄; three central characters | dim group28; blocks 8+8+8 | joint central kernel1; faithful dimension24 | Generic pinning applies after owned comparisons. |
| Carrier hypothesis boundary | Empty base or arbitrary unpinned group | no applicable unique pinned comparison | Conrad 6.1.17 requires nonempty base, pinning, reductivity | README uses Spec ℂ and explicit targets. |
| Block map J₁ | F₃ on b′₄; F₁ on b′₂ | −b′₃; −b′₁ | displayed signed vector row | Both negative signs necessary. |
| Block map J₃ | F₂ b₁₂₄; F₄ b₁₃₄ | b₁₃₄; b₁ | odd-degree row, signs +,+ | Matches native lowering convention. |
| Block map J₄ | F₄ b₁₂₃₄; F₄ b₃₄ | b₁₂; 1 | even-degree row, signs +,+ | Highest/vacuum normalization matches. |
| `exists_trialityAut` | t on numbered torus, s=(2,3,5,7) | t relabels s to (7,3,2,5) | vector highest value7 = S⁺ highest value7 | Pullback intertwiner orientation agrees. |
| `exists_trialityAut`, order / outer | Three highest weights ω₁,ω₄,ω₃ | third iterate fixes each; first does not | inner twists preserve representation class | Order3 and noninner are compatible. |
| Cyclic block intertwiner | Product on V of three P₂₄ block maps | J₁ P₂₄³ J₁⁻¹=id | id_V | No unpinned scalar remains. |
| SpinSimplyConnectedIntegrationComparison (seed) | Spin₈(ℂ); contrast S¹→ℝ | π₁Spin₈=0; Lie automorphism integrates uniquely | identity Lie(S¹)→ℝ does not descend from ℝ | Kirillov 3.38 hypotheses retained. |
| `exists_trialityForm` | v=b₄, s=1, u=b₁₂₃ | top(reverse(b₄)∧b₁₂₃)=−1 | nonzero; three weights sum0 | Nonzero invariant pairing construction consistent. |
| Octonion comparison | Three octonion units | Re((1·1)·1)=1 | nonzero triality form after normalization | Carrier/isometry comparison remains a target. |
| Induced Lie action | θ=0 and adjoint θ on sl₂ | zero action; nonzero quadratic left action | trivial module; copies of Vρ | No arbitrary untied action in headlines. |
| Left multiplication versus derivation | sl₂ Clifford algebra | left: four dimension2 simples | commutator:1⊕3⊕3⊕1 | Distinct actions kept. |
| Rank / positive-root parity | sl₂, sl₂⊕sl₂ | d=3,6; rank=1,2 | 1+2·1=3; 2+2·2=6 | R08: native dimension supplier. |
| `nonempty_kostant_isotypic` | sl₂, zero Lie algebra | simple left submodule dimensions2,1 | Lρ dimensions2,1 | Compatible; zero case nonvacuous. |
| `kostant_multiplicity` | (d,l)=(3,1),(6,2),(0,0) | Clifford dimensions8,64,1 | 4·2=8; 16·4=64; 1·1=1 | Natural divisions exact in all three. |
| `kostantSpinRep` action | sl₂, Cartan element h | spin eigenvalues +1,−1 | Lρ weights +1,−1 | Quadratic lift uses correct half-factor. |
| `kostantSpinRep_multiplicity` | (d,l)=(3,1),(6,2),(0,0) | spin dimensions2,8,1 | 1·2=2; 2·4=8; 1·1=1 | Full spinor, not one half-spin summand. |
| Antisymmetrization σ | sl₂, h with κ(h,h)=8 | σ(h)²=8; σ(h∧h)=0 | alternating source forces 0 | Quantization is not multiplicative. |
| Primitive P | sl₂, sl₂⊕sl₂,0 | dimensions P=1,2,0 | dimensions I=1,3,0 | I² exclusion discriminates in rank2. |
| Primitive quadratic form | sl₂ volume ω | σ(ω)²=−8·8·(−8)=512 | exterior determinant −512 | Reversal sign retained. |
| Primitive cross terms | sl₂⊕sl₂, aω₁+bω₂ | cross anticommutator0 | Q_P=512(a²+b²) | Nondegenerate diagonal form. |
| Full ρ-decomposition / commutants | sl₂: C=M₂⊕M₂, A=diag M₂ | Comm(A)=ℂ²; Comm(ℂ²)=C, dim8 | A·Z(B)=C, dim8; A alone dim4 | Correct ordinary-commutant formulation. |
| CAR relation / normal ordering | N=1 | d₁₁²=1; F₁₁=1/2 | antisymmetric lift0; scalar shift1/2 | Agrees with native central character. |
| CAR bracket | N=2, [F₁₂,d₂₁] | d₁₁−d₂₂ | adjoint matrix bracket E₁₁−E₂₂ | Source Lemma 1 supports normalization. |
| CAR multiplicity | N=0,1,2,3 | dimensions1,2,16,512 | 1·1,2·1,8·2,64·8 | All dimensions agree. |
| CAR highest weight | N=2 | ρ=(1/2,−1/2), central shift(1,1) | ν=(3/2,1/2) | Reductive/Killing distinction retained. |
| Dual-standard Pieri | N=2, ν=(3/2,1/2) | tensor dimension2·2=4 | highest weights (1/2,1/2),(3/2,−1/2); dimensions1+3 | Both remain dominant. |
| Required README shape | Ten layers | Needs/Examples/Dependencies counts0/0/0 | each target/layer requires the corresponding entry | R11. |
| Retained-target source locations | Bogoliubov, full ρ-decomposition | zero attached exact theorem/page locators | precise supporting locators required | R13. |
| Description remaining-work assertion | OddLineSignComparison | README owns1 such target | library already supplies it | R14. |

- Sources: 8 located results checked in 4 readable texts: Panyushev Lemma 2.2, Proposition 2.4, Example 2.5(1), pp.7–8 (lines 287,313,320); Shlyakhtenko Lemmas 1–2 and Proposition 1, pp.5–6,10 (lines 198,208,397); Kirillov Theorem 3.38, p.31 (line 1113); Conrad Theorem 6.1.17, p.197 (line 8173). Seeded book locators remain uncertified below.
- Library audit: at least 35 declaration bodies/signatures opened, including `Mathlib/LinearAlgebra/QuadraticForm/IsometryEquiv.lean:159`, `TauCeti/RepresentationTheory/Spin/LineSign.lean:125`, `TauCeti/Topology/Algebra/CliffordAlgebra/Spin/Polar.lean:137`, and every pinned witness in R01–R08; no identical headline theorem found.
- Cross-roadmap audit: 9 named contract owners checked—ClassicalGroups, LieHighestWeight, RootSystems, OrthogonalSpinGroups, QuadraticFormInvariants, LieGroups, ReductiveGroups, SpinGeometry, RepresentationTheory; RootSystems' old Layer 6 has a numbering map; no dropped-id/conflicting-head lead confirmed.
- Gate: every supplied scanner and the targeted module build passed at 20b4750; independent dependency output: `depcheck: 244 roadmaps, 2206 edges, 0 problem(s)`; no UPWARD or CYCLE; zero changes outside the permitted roadmap/family scope.
- Lean: direct elaboration succeeds with exactly 7 `sorry` warnings; all 8 elaborated declaration signatures checked with `#check @…`; zero lost binders or README/signature generality discrepancies.
- Padding: 7/7 headline probes fail to close using `simp`, `rfl` or `infer_instance`; nearby library declarations do not supply an `exact` shortcut. The rank-six additional signature elaborated with one `sorry` warning after building its two native imports; it needs no helper definition.
- Headlines: 7 remaining native-carrier theorems are present; low-rank D, smooth differential/group highest weights and full ρ-decomposition are named as unavailable in the docstring; R10 records the statable omitted rank-six endpoint.
- Previous review: 4 findings repaired, 1 partly repaired; 10 layers and all 8 Lean declarations reread, including unchanged passages.

Overlap check: read open OrthogonalSpinGroups (#1181), LieHighestWeightPartII (#2277), LieHighestWeight (#1797), ExceptionalThetaCorrespondencesForG2 (#1736), RepresentationTheory (#1146), and main SpinGeometry, OrthogonalSpinGroups, LieHighestWeight. Owners: quadratic groups/spinor norms and the zero-rank even-unitary comparison—OrthogonalSpinGroups; generic highest weights/Serre theory—LieHighestWeight; later highest-weight extensions—LieHighestWeightPartII; general representation theory—RepresentationTheory; geometric Clifford bundles/Dirac theory—SpinGeometry; Clifford/Fock-specific triality adapters—SpinRepresentations; exceptional theta applications—ExceptionalThetaCorrespondencesForG2. R09 identifies the remaining shared ownership; no second copy of this roadmap was found.

Source independence: 12 passages compared with 4 readable sources (Panyushev, Shlyakhtenko, Kirillov, Conrad), with no reproduced prose or clause-by-clause paraphrase found; largest share fultonharris1991, 6 of 17 locator-bearing citation groups (bibliography included). Its text and contents were unavailable, so the dominant-source wording/arrangement comparison is not certified. The readable papers' sections do not match the ten-layer build; the README's Fock→highest-weight→triality and quadratic-lift→Kostant dependencies explain those sequences. No copied source figure, exercise list or external Lean formalization identified.

## Not verifiable

- fultonharris1991, Lecture 20 §§20.1–20.3: settled uncertified; highest-weight and numbering/orientation samples cannot be checked against its text or printed pages; no new request made.
- goodmanwallach2009, Chapter 6: settled uncertified; algebraic highest-weight sample cannot be checked against the book; no new request made.
- kostant1997, §§1–2 and full ρ-decomposition: settled uncertified; exact full-decomposition locator and proof not certified; Panyushev checks only the stated spin/isotypy consequences.
- meinrenken2013, Chapters 5–10: settled uncertified; wording and locators not compared; no new request made.
- lawsonmichelsohn1989, I.2.10, I.4.3 and Tables I–II: sources-service title search did not return readable legal text; requested in the scratch reference list.
- adams1996, triality chapter: sources-service title search did not return readable legal text; requested in the scratch reference list.
- chevalley1954: DOI 10.7312/chev93056 resolved to a publisher landing page without retrieved open text; requested in the scratch reference list.
- cartan1966: sources-service title search did not return readable legal text; requested in the scratch reference list.

## Source issues

- none

## For the human reviewers

- Not tested: fultonharris1991 supplies the largest locator share; its settled uncertified status prevented comparison of the roadmap's wording and arrangement with Lecture 20 and its contents.
- Source coverage: four additional cited books were unavailable through the sources service; the four settled uncertified books were not requested again. The readable Panyushev and supplier texts do not certify every textbook locator.
