# CrystallineCohomologyPartII design repair

## F01 (P1) — applied

Supplier gap G1 → owned WV.6 targets. Base-change invariance now assumes properness, geometric normality and geometric connectedness. The RCC and CH₀ targets retain Kollár’s locator-only citations. Added the cubic-surface and elliptic-curve controls; updated the statement, API, proof, source records and coverage.

Evidence: Tan18 lines 1183–1186, Proposition A.4, arXiv v3 p. 30; ESN03 lines 70–76. Kol96 IV.3.2.5, IV.3.6, IV.3.13.3 and V.2.13 are recorded uncertified, rather than mistaken for supplier obligations. Tan18 is *Behavior of canonical divisors under purely inseparable base changes*, arXiv:1502.01381v3.

## F02 (P1) — applied differently

Supplier gap G2 → owned perfect-field existence target in WV.5/quasi-resolution. The finite normal factor has a purely inseparable function-field extension; it need not be radicial over a nonnormal target. Added cusp and split-node Checks. The proof uses the earlier plurinodal alteration input and de Jong directly, without consuming the board-only alteration design.

Evidence: dJ97 lines 798–808, Corollary 5.15, p. 620; CR12 lines 3751–3771, Definition 4.3.1 and Remark 4.3.2, p. 79; dJ96 Corollary 7.4, pp. 88–89. The normalization of a split nodal cubic is birational of degree one but has two points over the node, disproving a blanket universal-homeomorphism interpretation of the finite factor. ClassicalAdicEtaleCohomology Layer 2 supplies `PlurinodalAlteration.exists` at its indexed open head.

## F03 (P1) — applied

An unprovided request to AbelianSchemesAndArithmeticModuli A2 → the owned target WV.6/serre-bockstein-vanishing, with hypotheses, locators and three Checks. Theta-divisor congruence consumes it. Removed the request and broad A2 input; retained §A2.4 only for ample cohomology and degree. This prevents the earlier supplier from depending on these later Witt sheaves.

Evidence: BBE07 lines 1543–1546; Ser58 Théorème 2, cited uncertified; Ser58Top lines 1127–1163 explain the Witt boundaries and their exact sequences. AbelianSchemesAndArithmeticModuli §A2.4 was read at its indexed open head and states ample Riemann–Roch, not Bockstein vanishing.

## F04 (P1) — applied

The relative fibre-dimension bound for arbitrary f → the bound for proper f, plus a separate absolute bound for every separated finite-type X. Corrected the proof and the compact-support-finiteness consumer. Added the punctured-plane negative control and an absolute-dimension Check; recorded the source error.

For j: A² ∖ {0} → A², x⁻¹y⁻¹ is outside k[x,x⁻¹,y] + k[x,y,y⁻¹]. Its Teichmüller representatives are compatible at every Witt length and remain nonzero after first-coordinate reduction. Thus R¹j_*WO ≠ 0 although every nonempty fibre has dimension zero. SchemeAndStackFoundations main §2.6 explicitly assumes properness in `proper_fibreDimension_vanishing`; GNT19 Lemma 2.20 omits it.

## F05 (P1) — applied

The dimension f → 2g − f for H¹(A, WO_A)_K. The omitted part is the slope-one summand of dimension f, rather than all nonzero slopes. Repaired the section Check, layer example and corresponding plan acceptance entry; recomputed ordinary, supersingular and dimension-zero cases.

The slope-[0,1) identification and polarization symmetry give 2g total slopes, with f equal to one. BBE07 Proposition 2.10 and §5.2, together with CrystallineCohomology §CR.4.7, supply the interpretation.

## F06 (P2) — applied

New Witt-scheme and smooth top-form constructions → imports from CrystallineCohomology §§CR.4.6 and CR.3:duality.1. Deleted the duplicated affine ideal, scheme, functoriality, perfect-comparison and smooth-canonical API proposals. Kept ideal sheaves, transferred morphism properties, higher direct images, inverse limits, singular canonical systems and full product self-duality. Updated scope, prerequisites and upstream notes.

Evidence: the parent’s indexed open-head README, §CR.4.6, defines `Crystalline.wittScheme`, its affine/one/perfect comparisons and functoriality, and its affine Witt ideal; §CR.3:duality.1 states `Crystalline.crysTrace_iso` and `Crystalline.crysTrace_etale_local`. The parent’s D(t) computation agrees with W₂(F_p[t,t⁻¹]).

## F07 (P2) — applied

Unqualified finite-type schemes in WV.4–WV.5 → quasi-projective finite-type k-schemes, including bases and auxiliary schemes, throughout statements, API and plan hypotheses. Generic fibres and scalar extensions use their own ground field. Projective point-count applications satisfy these hypotheses. The remaining layers keep their stated generality.

Evidence: CR12 lines 1785–1790, 2284 and 3447 impose this standing setting. No new extension of CR12 to arbitrary separated finite-type schemes is asserted. The finite-type hypothesis does not incorrectly require Spec k(η) or an infinite scalar extension to be quasi-projective over the original k.

## F08 (P2) — not actionable in this package: the earlier supplier must extend its Frobenius-factorization contract

The implicit broad supplier claim → gap:qcqs-frobenius-factorization, naming SchemeAndStackFoundations §0.26 and both required identities in one needs sentence. Added the exact README contract and updated WV.0/WV.1 consumers without narrowing them. This package cannot add the missing statement to its earlier supplier.

Evidence: main §0.26 states factorization only for schemes finite type over F_p. For A = F_p(t), B = F_p(t^{1/p}), g*: B → A sends b to b^p; the two composites are Frobenius with N = 1, although neither field is a finite-type F_p-algebra. Identity and empty-scheme cases use N = 0. A maintainer must settle the supplier extension; this repair does not claim that the supplier already states it.

## F09 (P2) — applied

The cone over arbitrary smooth projective Z → the cone over smooth projective geometrically connected Z. Added a proof of the degree-zero condition from geometrically connected fibres, allowing a nonnormal embedded cone. Added the degree-two-point counterexample; corrected the source description and added CR12 Theorem 4.7.4’s locator.

Evidence: CR12 lines 4444–4464 explicitly require geometric connectedness. For Z = Spec F_{q²}, q odd, H^{>0}(Z, WO)_ℚ = 0, but W(F_q)[1/p] → W(F_{q²})[1/p] has dimensions one and two and is not onto. The blowup has exceptional fibre Z, so condition (1) fails. For connected Z, WV.0’s proper connected-fibre criterion establishes condition (1) independently of normality of the cone.

## F10 (P3) — applied differently

Misplaced supplier references → verified owner sections throughout prerequisites, proof routes, layer dependencies and contracts. Added supported Chow groups in WV.4 and the proper-pair/excision explanation for compact-support rigid descent. Exposed the unavailable h-descent supplier as gap:h-descent-formalism, rather than treating a board design as an available earlier roadmap.

The replacements were checked against main or the indexed open head:

| Input | Exact owner and evidence |
| --- | --- |
| PD and completed PD envelopes | DerivedDeRhamCohomology §PD.6, *Universal base-compatible divided power envelope* and *Completed PD envelopes and the derived-completion comparison*. |
| Graded coherent finiteness | AdicSpacesPartIII main §F0.6, *graded-cohomology-finiteness*. EGAIII1 lines 4409–4436 verify the proper graded statement. |
| Rigid comparison maps | PadicDifferentialEquationsAndRigidCohomology §§RD.4.36–RD.4.38. |
| Nagata compactification | EtaleCohomologyFoundations main §G.2, `nagataCompactification`. |
| Mittag–Leffler lim¹ | DerivedModuleAlgebra main §1.T.1. |
| Ferrand geometric pushouts | NeronModelsAndSemistableAbelianVarietiesPartII §1.1; retained only in the comparison Check, removed as an input of the construction. |
| Finite trace | SchemeAndStackFoundations main §2.21, `trace_finite`; CR12 Proposition 2.3.4 gives the Hodge–Witt degree formula. |
| Quasi-coherent cohomological descent | EnhancedDerivedSheaves main §§E2.6, E2.8, `moduleDescent` and `descendableCover_fppf`. |
| Chow groups under field extension | MotivesAndAlgebraicCycles §2.2; use its torsion-kernel and restriction/corestriction statement. |
| Supported Chow groups | Owned definition in WV.4/proper-correspondence-category, CR11 lines 430–435, Definition 1.1.14. |
| Compact-support rigid descent | Ordinary proper descent §RD.5.74 for proper X and Y = X ∖ U, then excision §RD.4.19. |
| Parent’s extension boundary | CrystallineCohomology’s Scope and ownership, “Not here”. |

The citation service initially reported that ArcTopologyAndDescent and AdicCoefficientsAndComparisonsPartII were absent from main and open roadmap heads. Their copies in packages/ArcTopologyAndDescent/design/README.md and packages/AdicCoefficientsAndComparisonsPartII/design/README.md were then read. The former’s §§1.1, 1.3–1.4 contain the h-site and criterion; the latter’s §PA.6.11 assumes an algebraically closed field. The first becomes a named supplier gap; the second is not a dependency of the owned perfect-field proof. Establishing availability and an earlier placement of the first is not actionable in this package. The final citation scan reports no unresolved citations.

## F11 (P3) — applied

A repeated integral diagonal decomposition → only its rational-coefficient extension, importing MotivesAndAlgebraicCycles §0.6 and clearing denominators before the supported-cycle argument. Sectionwise Witt identities and preservation of surjections now cite the four pinned Mathlib theorems; removed the duplicate scalar-identity API. Updated both Frobenius-inversion and sheaf construction proofs.

Evidence at Mathlib 6b7abb3c: `WittVector.frobenius_verschiebung`, `verschiebung_mul_frobenius`, `verschiebung_frobenius` in Mathlib/RingTheory/WittVector/Identities.lean, lines 44, 99, 138; `map_surjective` in Mathlib/RingTheory/WittVector/Basic.lean, line 263. The VF identity requires `CharP R p`; the other two identities do not. MotivesAndAlgebraicCycles §0.6’s integral fixed-support input and diagonal decomposition were read at its indexed open head.

## F12 (P3) — applied

Nodal descent uses N = 2; the nonvanishing-ideal example uses a canonical curve cone; the double-cover Check requires non-finite f. The quadric is xy = z² in every characteristic. The Igusa example specifies its rational two-torsion point and action. The resolution criterion requires normal S. Repaired all repeated Checks and plan acceptance entries.

Evidence: BBE07 lines 733–734 give only q < N; lines 1712–1719 specify the Igusa data. The split node gives the explicit truncated-complex dimensions below. Serre duality gives H¹(C, ω_C) = k, whereas H¹(P¹, O(m+r)) = 0 for m,r ≥ 0. The split nodal cubic also shows why higher-direct-image vanishing alone does not imply condition (1).

## F13 (P3) — applied differently

Atlas blocks, proposed Lean names in Checks, process narrative and nonexistent continuation folders → numbered prose sections, exact supplier contracts, prose API and Checks, examples, dependencies and downstream consumers. Corrected universal-homeomorphism terminology everywhere. The proposed split is recorded only as an operator restructure proposal in plan.json; making that scope decision is not actionable in this package.

No Suggested.lean exists at this design stage, and no acceptance-test declarations were added. README formatting changes preserve the mathematical targets, their API facts and their Checks; layer order and original layer anchors remain intact. Predicates are labelled as predicates in the plan rather than data. The duplicate affine `wittIdeal` proposal was deleted with F06. The only new theorem target is the Bockstein theorem required by F03; supported Chow groups are added within the existing correspondence target as required by F10.

## F14 (P3) — applied differently

Absent source manifest and stale pins → 24 unique source records with exact locators, 16 certified and eight uncertified; the manifest passes its check. Baseline pins now match lake-manifest.json, and all 19 original declarations plus four cited Witt theorems were read at Mathlib’s actual pin. Removed the unidentifiable “Ekedahl, Toulouse 1985” attribution rather than inventing a work.

CR12’s bibliography, lines 4975–4978, identifies Ekedahl I and II as Arkiv papers; the smooth trace is imported from the parent. Serre’s Mexico paper was fetched legally from an institutional page and read at the relevant boundaries. The eight publisher-only records are Eke84, EkeII, Kol96, Tsu03, Ser58, Ax64, BS83 and Tsu04; they are explicitly uncertified and cited by locator. HW23’s record distinguishes the certified arXiv v2 text from published-only Corollary 1.3; no claim of reading that published passage remains. No unresolved reference request remains.

## Adversarial mathematics pass

The table records explicit computations for each of the 59 target statements. “Retained” records an evaluated instance, not a claim that examples prove the theorem. Source proofs and the hypotheses above determine the verdicts. The two supplier gaps remain gaps after these computations.

| Statement | Instances and computed values on the two sides | Result and change |
| --- | --- | --- |
| WV.0/witt-sheaf | W₂(F₂) = ℤ/4; p·1 = V(1) = 2. For I = (t), V(t) has second coordinate t, while [t]w has second coordinate divisible by t² at p = 2. I = 0 gives 0; I = O gives WO. | Imported scheme; retained sheaf kernel, F06/F11. |
| WV.0/rational-witt-sheaves | ⊕ℤ/pⁿ tensors to 0 but has nonzero isogeny image; End(ℤ_p) with p inverted is ℚ_p. At p = 2, q(ℤ/3) = 0 but 2ᴺ never kills ℤ/3. | Distinguished integer torsion from the p-primary Witt specialization; clarified the statement and extension proof. |
| WV.0/frobenius-inverted-witt | For F_p[ε]/ε², F kills the Witt kernel of reduction, so both localized reductions are ℤ_p; for ∅ both complexes are 0. | Retained; cited pinned FV/VF identities. |
| WV.0/witt-nil-invariance | At p = 2, F(W(ε)) = 0, hence 2W(ε) = VF(W(ε)) = 0. For (t_i) with t_i^(p^i) = 0, the coordinate t_(c+1) survives F^c. | Bounded-nilpotence hypothesis separates the two values. |
| WV.0/witt-universal-homeomorphism-invariance | F_p(t) ⊂ F_p(t^(1/p)): both ring composites with b ↦ b^p are Frobenius. F_{q²}/F_q instead gives Witt dimensions 2 and 1. Cusp normalization has the same K-valued H⁰. | Added field witness and named gap, F08. Geometric connectedness is essential in (ii). |
| WV.0/witt-closed-mayer-vietoris | Axes xy = 0 give H⁰ = W(k[x])_K ×_K W(k[y])_K. For the repeated cover X = X₁ = X₂, maps are a ↦ (a,a), (a,b) ↦ a−b. | Kernels and images agree; retained. |
| WV.0/witt-limit-lemmas | Proper fibre dimension 0 gives R^{>0} = 0. For j: A²∖0 → A², fibre dimension is 0 but [x⁻¹y⁻¹] gives R¹ ≠ 0. Absolute dim X = 2 still gives H^{>2} = 0. | Proper relative and general absolute bounds separated, F04. |
| WV.0/witt-finiteness-slopes | Ordinary E: slopes below 1 are {0}, dimension 1. Supersingular E: {1/2,1/2}, dimension 2. P¹ has H¹ = 0. | Agrees with the corrected abelian Check, F05. |
| WV.1/witt-fppf-descent | For F_{p²}/F_p, F_{p²}⊗F_{p²} = F_{p²}×F_{p²}; equalizer of (x,x) and (x,σx) in Witt vectors is ℤ_p. | Repointed cohomological descent, F10. |
| WV.1/affine-derived-self-products | k⊗ᴸ_(k[t])k has Tor₀ = k and Tor₁ = k; Frobenius kills the positive homotopy, leaving W(k) after inversion. | Derived and classical localized values coincide. |
| WV.1/witt-pushout | Bl₀ A² has H⁰(O) = k[x,y] and H⁰(O_E) = k, so B′ = k[x,y]×_k k = k[x,y]. For J = 1, E = ∅ and B′ = A; for J = 0, X = ∅ and B′ = A. | Construction survives both ideal extremes; Ferrand removed as proof input, F10. |
| WV.1/witt-blowup-excision | For Bl₀ A², the degree-zero sequence is 0 → A → A⊕k → k → 0 with last map restriction minus identity; its kernel is A and cokernel 0. | Retained; no sign reversal. |
| WV.1/frobenius-inverted-witt-h-descent | For the split node, normalization contributes H⁰ = K and two off-diagonal points; descent leaves H¹ = K. For Spec F_p(t), Frobenius factorization still needs the qcqs supplier extension. | Target retained with both explicit supplier gaps. |
| WV.1/rational-witt-h-descent | For xy = 0, the two branch complexes give the same fibre product as WV.0; after inverting p the H⁰ equalizer is unchanged. | Retained, conditional on the preceding descent inputs. |
| WV.2/witt-ideal-vanishing | On Bl₀ A², H¹(P¹,O(m+r)) = 0 for every m,r ≥ 0. On the canonical cone, R¹f_*I′ has H¹(C,ω_C) = k, but R¹f_*WI′_ℚ = 0. | Replaced false plane-blowup Check, F12. |
| WV.2/witt-exceptional-reduction | A tree of P¹’s has H¹(WO)_ℚ = 0; an ordinary elliptic exceptional curve has dimension 1, and a supersingular one dimension 2. | Both exceptional-fibre and direct-image values agree. |
| WV.2/witt-compact-support-cohomology | A¹⊂P¹ gives K → K, hence all H_c^i = 0. G_m gives diagonal K → K² with cokernel K in degree 1. ∅ gives 0. | Proper/open directions and excision signs agree. |
| WV.2/compact-support-finiteness | A² has H_c^i(WO_K) = 0 for all i, while H⁴_rig,c = K(−2) has slope 2 and contributes nothing below 1. | Absolute-dimension proof updated, F04. |
| WV.2/simplicial-resolution | At the split node, the normalization fibre product is P¹ ⊔ two reduced off-diagonal points. For smooth X the constant hypercover has every matching map id. | Smooth terms and matching conditions retained. |
| WV.2/witt-proper-hypercover-descent | N = 1 gives C⁰ = K, C¹ = K³, d⁰ = 0 and H¹ = K³. N = 2 imposes a = 0 and b+c = 0, so H¹ = K. | The Check now uses N = 2 and tests the failure at N = 1, F12. |
| WV.3/slope-subspace | Rank one F = p^aσ gives E^{<1} = K for a = 0, and 0 for a = 1. For slopes 0 and 1, det on E^{<1} is 1−αt, excluding the slope-one factor. | Strict threshold retained. |
| WV.3/frobenius-lift-witt-map | On ℤ_p[t] with t ↦ t^p, the section sends t to [t], with ghosts t,t^p,t^(p²). On Spf W the induced map on K is id. | PD inputs repointed to their owner, F10. |
| WV.3/rigid-to-witt-morphism | P¹ gives id: K → K in degree 0 and K(−1) → 0 in degree 2. For an ordinary elliptic curve the kernel in degree 1 is the one-dimensional slope-one line. | Comparison directions and smooth compatibility agree. |
| WV.3/simplicial-frobenius-embedding | A smooth projective X with a fixed lifted embedding uses constant simplicial objects: matching comparison maps are identities; each given closed immersion remains closed. | BBE07 Lemma 5.1 and CT03 Proposition 11.2.5 verified; Tsu04 locator remains uncertified. |
| WV.3/smooth-proper-slope-identification | For (g,f) = (0,0), (1,1), (1,0), dimensions 2g−f are 0,1,2, respectively; slope-one dimensions are 0,1,0. | Corrected every occurrence of f, F05. |
| WV.3/berthelot-bloch-esnault-comparison | P¹ has slope-below-one dimensions (1,0,0), equal to its Witt dimensions. A split proper nodal rational curve has H¹ = K of slope 0 on both sides. | Compact-support descent obtained from proper X,Y and excision, F10. |
| WV.3/affine-witt-vanishing | A¹ has all H_c^i = 0; G_m has H_c¹ = K and every other group 0, with dim G_m = 1. | Concentration does not require nonzero middle cohomology; retained. |
| WV.4/witt-canonical-system | Spec k: W_nω = W_n(k), d = 0. P¹: H¹(Wω) = W(k), trace of a point is 1. Two planes meeting at a point have depth 1 < dimension 2 and nonzero H^(−1)(K₁). | Imported smooth identification; singular CM restriction survives, F06/F07. |
| WV.4/hodge-witt-pushforward | P¹→pt sends H¹(WΩ¹) isomorphically to W(k), while H⁰(WO) maps to degree −1, hence 0. F_(A¹/k) has push-pull p·id, not id. | Degree and bidegree shifts retained with quasi-projectivity, F07/F10. |
| WV.4/hodge-witt-cycle-class | A rational point of P¹ has trace 1; the classes of 0 and ∞ are equal though the two cycles differ. | Rational equivalence, normalization and nonzero class agree, F07. |
| WV.4/proper-correspondence-category | For A¹→pt the graph is not proper over pt, while its transpose is proper over A¹. CH(T,{∅}) = 0; CH₀(P¹,{∞}) = ℤ, mapping to the degree-one generator. | Defined the support-family Chow group, F10. |
| WV.4/hodge-witt-correspondence-action | On H⁰(WO)⊕H¹(WΩ¹) of P¹, P¹×{x} acts by diag(0,1), {x}×P¹ by diag(1,0), and their sum by diag(1,1). | Pull/push direction and identity decomposition agree, F07. |
| WV.4/correspondence-vanishing | With r = 1, P¹×{x} has image only in bidegree (1,1); {x}×P¹ kills the positive bidegree but preserves H⁰(WO). N = 1 suffices. | Target/source codimensions distinguished; retained with source hypotheses. |
| WV.5/topological-finite-quotient | For xy = z², A²→X is finite of degree 2; at p = 2 the function-field extension is purely inseparable. An elliptic cone has nonzero higher WO and is excluded by quasi-resolution invariance. | Finite-type finiteness is a consequence, not the global definition of universal homeomorphism, F07/F13. |
| WV.5/quasi-resolution | Relative Frobenius of a d-dimensional smooth scheme has degree p^d and purely inseparable extension. A separable degree-two E→P¹, p odd, fails the field condition. The cusp has Y′ = A¹ and G = 1. | Owned perfect-field variant; split-node finite factor distinguished, F02/F07. |
| WV.5/finite-quotient-projector | For u = F_(A¹/k), u_*u^* = p·id; dividing by the nonzero degree makes both maps invertible. For f=u=id, β=Δ and its image is the full cohomology. | Both nontrivial-degree and identity cases agree. |
| WV.5/quasi-resolution-invariance | The quadric cone’s exceptional fibre is P¹, so H¹(E,WO)_ℚ = 0 and the higher direct image is 0. Degree-zero pullback is an isogeny. | Hypotheses include a topological finite quotient and quasi-projectivity, F07. |
| WV.5/wo-rational-singularities | For the normalization of a split nodal cubic, R^{>0} = 0 but the degree-zero quotient at the node has K-dimension 1. A smooth identity has zero quotient and higher images. | Normality added to the resolution-only corollary, F12. |
| WV.5/finite-quotients-witt-rational | A¹ and its Frobenius twist are smooth: both have the identity quasi-resolution with higher images 0. Their finite purely inseparable map has degree p. | Universal-homeomorphism invariance is compatible with the degree calculation. |
| WV.5/witt-singularity-complexes | Smooth S gives H^{>0}(WS₀,S) = 0. An ordinary elliptic cone has H¹(WS₀,S) of K-dimension 1; supersingular gives 2. | Complex distinguishes the non-WO-rational examples. |
| WV.5/quasi-birational-witt-invariance | P² and Bl_pt P² both have H⁰(WO)_K = K and H^{>0}(WO)_K = 0, although their crystalline H² dimensions are 1 and 2. | Exactly the slope-below-one part is invariant. |
| WV.5/rational-implies-witt-rational | A rational double point has R^{>0}O = R^{>0}ω = 0, hence R^{>0}WO = R^{>0}Wω = 0. In characteristic 2, three size-two Jordan blocks give dim V=6, dim V^G=3 and 6 > 3+2 = 5, so the invariant ring is not Cohen–Macaulay by the cited criterion. | Strictness example has actual nonzero invariants; no impossible fixed-point-free p-group representation is used. |
| WV.5/isolated-singularity-criterion | Conic cone gives higher exceptional Witt cohomology 0. For Z=Spec F_{q²}, higher cohomology is also 0, but degree-zero dimensions are 1→2. | Geometric connectedness and condition (1) are both tested, F09. |
| WV.5/bloch-srinivas-decomposition | For P², Δ=h₁²+h₁h₂+h₂²; take ξ×P²=h₁² and Γ=h₁h₂+h₂² supported on P²×H, N=1. For an elliptic curve over the algebraic closure of its function field, [η]−[0] has infinite order. | Integral input imported; rational denominators cleared, F11. |
| WV.5/chow-trivial-fibration-vanishing | P^n_Y→Y with Y smooth has CH₀ of every generic scalar extension equal to ℚ and R^{>0}WO=0; H^{>0}(WS₀,Y)=0 also. | Both sides vanish for this nontrivial relative example. |
| WV.6/witt-zeta-function | Point: (1−t)⁻¹. P¹: same Witt factor, while full ζ has extra (1−qt)⁻¹. A¹ and ∅ both give Witt ζ=1. | Supports and alternating signs agree. |
| WV.6/slope-zeta-identity | P¹’s reciprocal roots are 1,q with slopes 0,1, so ζ^{<1}=(1−t)⁻¹=ζ^W. A¹’s sole root q is excluded, giving 1=1. | Strict slope bound retained. |
| WV.6/ax-congruence-criterion | Φ=(1−qt)⁻¹ gives N_r=q^r and divisibility by q^r; Φ=(1−t)⁻¹ gives N_r=1, which is not divisible by q^r for q≥2. | Both directions discriminate correctly. |
| WV.6/witt-isomorphism-point-congruence | For the specified Igusa action with E₁,E₂ ordinary, H²(X,WO)_K has dimension 1, while H²(Y,WO)_K has dimension 0; the action on O-cohomology is still trivial at p=2. | Rational two-torsion and the action are explicit, F12. |
| WV.6/witt-rational-point-congruence | The projective quadric cone has q²+q+1 points; F₂ has (q+1)²; their difference is q. At q=2 the counts are 7 and 9, both 1 modulo 2. | Equation xy=z² works also at p=2, F12. |
| WV.6/low-degree-complete-intersections | A conic has q+1 points; a cubic surface has 1+aq+q², hence residue 1. For no equations and n=0, the intersection is a point with count 1. | Source degree condition retained. |
| WV.6/theta-divisor-criterion | P¹ with one point: h⁰(ω)=h⁰(ω(D))=0 and H¹(O)=0. The predicted identity is (1−t)⁻¹=(1−t)⁻¹·1. | No 0/0 or noninjective boundary is used. |
| WV.6/serre-bockstein-vanishing | For g=0, V^i(1) has last coordinate 1 and is nonzero. For g=1, W_(i+1)(k)→W_i(k) is onto, so the boundary is 0 and ker V^i=0, including supersingular curves. | New owned theorem has three independent Checks, F03. |
| WV.6/theta-divisor-congruence | In dimension 1 each theta divisor is a rational point: counts 1=1. In dimension 0 the effective zero divisor is empty: counts 0=0. | Bockstein theorem replaces the supplier request, F03. |
| WV.6/universal-chow-zero-triviality | P^n_L has CH₀=ℤ, so rational degree is ℚ→ℚ, id. For ∅ it is 0→ℚ, not surjective. A positive-genus curve over the algebraic closure of its function field has nonzero rational degree kernel. | Nonemptiness and transcendental extensions are detected. |
| WV.6/rationally-chain-connected | P^n is joined by one line; a cone by two lines through the vertex. For Spec k take U=P¹, Y=Spec k. Every map P¹→E is constant for an elliptic E. | Proper geometric hypotheses added only to base-change API, F01. |
| WV.6/rcc-chow-zero-triviality | Over an algebraically closed extension a smooth cubic surface has every point rationally equivalent to a fixed point, so CH₀=ℤ and degree=identity. For P^n the same computation gives ℤ. | Integral geometric result feeds rational universal triviality, F01. |
| WV.6/esnault-witt-vanishing | For P^n, H^(2j)_crys has slope j; every positive-degree slope below 1 part is 0. A smooth cubic surface’s H² has only slope 1, again giving 0. | Positive-degree qualification retained. |
| WV.6/esnault-point-count | P² gives 1+q+q²≡1; the quadric cone gives the same residue and its F₂ resolution differs by q. After degree-r field extension replace q by q^r. | Smooth and singular conclusions agree with the Checks. |

The convention witnesses are also evaluated separately:

| Convention or changed API | Values | Result |
| --- | --- | --- |
| Arithmetic q-Frobenius normalization | Over F₄, F=(σ,2σ), F²=(1,4); v₄(1)=0, v₄(4)=1. | Slopes and the strict cutoff agree. |
| Characteristic hypothesis on VF | Over ℤ at p=2, the first coordinate of V(F(1)) is 0, whereas that of 2·1 is 2. Over F₂, both full Witt vectors equal 2 in ℤ₂. | VF=p is imported with CharP, not asserted for arbitrary coefficients. |
| Divided powers in the Frobenius-lift route | At p=2, m=2, p^(m−1)/m!=1; at m=3 it is 2/3, which is 2-integral. | Small-prime integrality survives; no good-prime restriction. |
| Alternating determinant parity | For P¹, exponents in degrees 0 and 2 are both −1, giving 1/((1−t)(1−qt)); removing slope 1 leaves 1/(1−t). | Sign witness matches WV.6. |
| Smooth canonical trace imported from the parent | Dimension 0 gives W_n(k) and trace id; dimension 1 gives trace(point)=1 and parent sign (−1)^0=1. | Same source/target and normalization. |
| General bounded torsion versus Witt torsion | An extension of ℤ/3 by ℤ/2 is killed by 6, not necessarily by a power of the chosen p=2. A Witt-module coefficient makes every prime-to-p integer invertible. | Replaced p-power exponents by nonzero integer exponents in the general Serre-class proof; p-powers remain only for Witt modules. |
| Quasi-projectivity under the constructions used | Projective X→Spec A embeds into P^n_A; if A is finite type over k this is quasi-projective over k. A generic fibre X_η is instead projective over k(η). | No finite-type assertion over the original k is imposed on infinite field extensions. |

The bounded-torsion clarification is a consequence of applying the required adversarial pass to the category described in F13: the general sheaf category admits ℤ/3 even when p=2. It corrects the existing definition’s prose and proof, adds its negative-control Check and introduces no target.

## Check outcomes

The prescribed dependency command was run with the supplied configuration, candidate and merge-order arguments. Exit status: 0. Its exact output was:

```text
candidate: CrystallineCohomologyPartII is not in the merge order yet; checked as if placed after PadicDifferentialEquationsAndRigidCohomology (the intake inserts it when its design is accepted)
depcheck: 52 roadmaps, 587 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. No prescribed gate failure was supplied with this repair job. The merge-order file and tooling were not edited.

The source-manifest check exited 0 with:

```text
packages/CrystallineCohomologyPartII/sources.toml: 0 problem(s)
```

The final citation scan reported:

```text
Checked against main (ce9dea7) and 363 open roadmap pull requests at their heads (index of 2026-10-25T15:10:46Z).
Cross-roadmap citations found nowhere: None.
Lean names found nowhere: None.
```

The scanner notes that it does not check external Lean names without installed pinned Lake packages. Those declarations were checked separately by reading their GitHub source at Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a. All 19 baseline declarations and four added Witt-theorem references were located; the relevant file and line numbers appear in the baseline, supplier contracts and F11 above. The Tau Ceti source tree at a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039 was searched by object. No new Tau Ceti declaration is used.

JSON and TOML parse successfully. Structural checks confirm 59 target sections, seven Examples/Dependencies pairs, 14 finding verdicts, 24 distinct complete source records, no unresolved target source IDs, and a matching README contract for each named supplier gap. Every definition/construction retains at least three Checks. The final `git diff --check` passes; trailing whitespace introduced in bibliography formatting was removed. No machine paths occur in the deliverable files.

Lean elaboration and the requested `#check @name` binder comparison are not applicable: this design has no Suggested.lean and the permitted edit set excludes creating one. No Lean declarations were added, deleted or elaborated, and no Lean build was run. The mathematical comparisons in this report concern the README/plan targets and the actual pinned library declaration types.

## Ownership and maintainer consequences

The supplied main-branch copies of AdicSpacesPartIII and DerivedModuleAlgebra were read for roadmap form. Supplier sections were checked against the supplied main checkout or the indexed open head, not against remembered atlas names. The open-head copies of CrystallineCohomology, DerivedDeRhamCohomology, PadicDifferentialEquationsAndRigidCohomology, MotivesAndAlgebraicCycles, AbelianSchemesAndArithmeticModuli, ClassicalAdicEtaleCohomology and NeronModelsAndSemistableAbelianVarietiesPartII were refreshed at the end and their text was unchanged.

Ownership searches used the roadmap service over main and available open heads, and the board packages, by Witt schemes, singular Witt cohomology, WO-rationality, quasi-resolutions, rational chains, diagonal decomposition, supported Chow groups and abelian Bocksteins. The parent owns the duplicated Witt schemes/affine ideals/smooth trace; MotivesAndAlgebraicCycles owns the integral diagonal decomposition. No earlier available owner of the singular Witt Bockstein theorem or supported Chow construction was found. The perfect-field alteration variant is owned here because the separate alteration design states only its algebraically closed-field form. No separate sibling checkout paths were supplied; ownership against additional unprovided pull-request files was not checked.

The two explicit supplier gaps remain external obligations: SchemeAndStackFoundations §0.26 must supply its qcqs two-sided Frobenius factorization; the h-descent formalism needs an available earlier supplier for the ArcTopologyAndDescent design §§1.1, 1.3–1.4. The successful dependency scan does not certify that either missing contract is already supplied. The operator must also decide the proposed separation of the parent’s convergent-coefficient and Cartier-transform directions. No new continuation folder is claimed to exist.

The stable target added for consumers is WV.6/serre-bockstein-vanishing; theta-divisor congruence consumes it. No existing target ID was renamed. The following proposed API names were deleted from the design: wittSheaf, wittSheaf_sections, the duplicated affine wittIdeal entry, mem_wittIdeal_iff, verschiebung_mem_wittIdeal, wittScheme, wittScheme_map, wittScheme_perfect, frobenius_verschiebung and wittCanonical_smooth. Their mathematical inputs are attributed to the parent or Mathlib. The retained sheaf-level wittIdeal is distinct from the deleted affine proposal. There are no implemented Lean names for downstream code to rename.

The board-package index’s embedded “Read one with:” GitHub CLI example was treated as data, not as an instruction; that example was not executed. No GitHub write, commit, push, issue edit or pull-request edit was performed. Only the three permitted design/source files and this required report were changed.
