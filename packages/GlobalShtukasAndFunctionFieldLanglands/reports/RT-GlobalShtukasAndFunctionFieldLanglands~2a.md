<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/146#issuecomment-6374694566 -->
Red team round 2 pass a (codex) of e5b7994

Verdict: needs_changes

1. **F01** (P2) The torus example still erases full level

   **Location:** `packages/GlobalShtukasAndFunctionFieldLanglands/README.md:1248`: “the no-leg cusp space is the space of functions on the finite group of isomorphism classes of Bun_T(F_q)/Ξ.”

   **Claim:** The unlevelled bundle quotient describes the no-leg cusp space under the standing arbitrary level N.

   **Witness:** For G_m on P¹/F₃, N={0,∞}, quotienting by a degree-one central lattice gives two ray classes but one unlevelled class; the function-space dimensions are 2 and 1. README:1250 computes precisely this discrepancy.

   **Exact repair text:** Replace the sentence by “For a torus every constant-term family is empty, so all cohomology is cuspidal, and the no-leg cusp space consists of functions on Bun_{T,N}(F_q)/Ξ. At empty level this specializes to Bun_T(F_q)/Ξ.” With the stated two-point level the repaired sentence gives dimension 2; at empty level it gives dimension 1. This is the remaining part of pass-a F12.

2. **F02** (P2) The nonsplit Satake repair introduces a forward prerequisite

   **Location:** `packages/GlobalShtukasAndFunctionFieldLanglands/README.md:678`: “§GS.1.13 … for the nonsplit trace comparison.”

   **Claim:** GS.1.11 is available at its position in the stated build order.

   **Witness:** GS.1.11 uses the Frobenius-equivariant coefficients constructed only in GS.1.13. GS.1.13 itself needs only GS.0.12 and GS.1.9 internally; no earlier theorem forces this order.

   **Exact repair text:** Move the entire GS.1.13 target immediately after GS.1.10, before GS.1.11, retaining target identifiers and anchors. State the order as “GS.1.9 → GS.1.10 → GS.1.13 → GS.1.11 → GS.1.12 → GS.1.14.” The norm-one torus calculation then uses an already-constructed Frobenius action. The graph remains acyclic.

3. **F03** (P2) The arithmetic gap requests already-owned inputs

   **Location:** `packages/GlobalShtukasAndFunctionFieldLanglands/README.md:84` and `packages/GlobalShtukasAndFunctionFieldLanglands/design/plan.json:7`: “Global function-field adeles and ideles, finite-level reciprocity, differential additive characters and self-dual measures”.

   **Claim:** These are missing FunctionFieldArithmetic deliverables.

   **Witness:** `TauCetiRoadmap/AutomorphicLFunctionsAndLocalFactors/README.md:2414` supplies adeles, characters and measures; 2420 and 2436 supply reciprocity. `TauCetiRoadmap/DeligneWeightsAndPurity/README.md:1275` supplies the closed-point zeta series and rationality, also requested by the gap.

   **Exact repair text:** Add the supplier contract “AutomorphicLFunctionsAndLocalFactors §AL.3, Curve additive analysis, Rank-one unramified reciprocity and Ramified rank-one curve reciprocity: use the supplied completion-valued adeles, idele-class/Picard comparison, differential characters, self-dual measures and finite-level character dictionary.” Remove these items from the arithmetic gap's needs in both README and design, and repoint their FA.2/reciprocity Needs references to these targets. Import DeligneWeightsAndPurity §1.10 for the closed-point zeta series and rationality, removing those requests too. Retain only separately specified unmet arithmetic and automorphic-support contracts; the nonabelian torsor comparison remains GS.0.7’s own target. The two-point ray Picard control still has order 2; the differential dt on P¹ still has conductor-degree sum −2. This concerns minimality of the newly declared gap, not its permitted unresolved status.

4. **F04** (P2) Satake reconstructs a generic Tannakian group without its owner

   **Location:** `packages/GlobalShtukasAndFunctionFieldLanglands/README.md:636`: “Reconstruct the Tannakian group from the coendomorphism coalgebra of this fibre functor”.

   **Claim:** The listed GS.1.9 prerequisites supply the general reconstruction step.

   **Witness:** `TauCetiRoadmap/MotivesAndAlgebraicCycles/README.md:1100` and 1114 own neutral finite-piece reconstruction, the coefficient Hopf algebra, antipode and marked equivalence. None is cited in GS.1.9's Needs.

   **Exact repair text:** “Apply MotivesAndAlgebraicCycles §§6.1–6.2 to the Satake category and its exact faithful symmetric fibre functor; establish the Satake-specific hypotheses here. Identify the resulting group by the weight functors and rank-one Levi restrictions.” Add that supplier to the contract and Needs. For G_m this reconstructs E[z,z⁻¹] with antipode z↦z⁻¹; for G=1 it reconstructs E. Keep the geometric Satake theorem here.

5. **F05** (P3) The omission explanation says an existing carrier is missing

   **Location:** `packages/GlobalShtukasAndFunctionFieldLanglands/Suggested.lean:15`: “Satake lacks the algebraic-group representation and perverse étale-sheaf categories”.

   **Claim:** Algebraic-group representation categories are absent at the supplied Tau Ceti pin.

   **Witness:** `TauCeti/Algebra/AlgebraicGroup/Representation/Comodule/Equivalence.lean:216,231` supplies `TauCeti.FGPointRepresentationCat` and `TauCeti.fgPointRepresentationCategoryEquivalence` over a commutative Hopf algebra, hence finite-dimensional rational representations over a field.

   **Exact repair text:** “Satake lacks the affine-Grassmannian and perverse étale-sheaf carriers and the associated convolution and fibre functor. Tau Ceti already supplies finite algebraic representations through FGPointRepresentationCat and its comodule equivalence.” The trivial Hopf algebra gives finite vector spaces; the missing geometric category still prevents stating Satake. No substitute theorem is requested.

6. **F06** (P2) The arithmetic Satake comparison relies on a false source map

   **Location:** `packages/GlobalShtukasAndFunctionFieldLanglands/README.md:709`: “Ric, Corollary 5.8, turns this into an isomorphism of the two L-groups.”

   **Claim:** The cited comparison supplies the change from geometric to pinned Galois action.

   **Witness:** Ric line 1051's displayed map is not multiplicative. For dual SL₂, arithmetic Frobenius with cycl=3 and u(x) upper unipotent, its value on (1,γ)(u(1),1) has coordinate u(1/3); multiplying the separate images gives u(3).

   **Exact repair text:** “For k₀=F_q or F_q(X), use the fixed half Tate character ε with ε²=cycl. Put c(γ)=(2ρ)(ε(γ)) in Ĝ. The comparison from the pinned to the geometric semidirect product is (g,γ)↦(g c(γ)⁻¹,γ). Verify its multiplication law using act_geo(γ)=act_alg(γ)∘Ad(c(γ)); this corrects the displayed map of Ric Corollary 5.8.” Retain arithmetic Satake over general k₀ with the geometric action; assert the pinned comparison when the half Tate character exists, in particular for F_q and F_q(X). Add the unipotent test: both corrected products have coordinate u(1)c(γ)⁻¹. The chosen half Tate character is essential; for k₀=ℝ and dual SL₂, cycl(complex conjugation)=−1 has no square-root character of Gal(ℂ/ℝ).

7. **F07** (P3) Two cohomology-definition Checks merely repeat its claims

   **Location:** `packages/GlobalShtukasAndFunctionFieldLanglands/README.md:851`: “At a fixed bound the sheaf is constructible”; line 852: “Refining a partition twice gives the same comparison”.

   **Claim:** GS.2.5 has three discriminating Checks for its coefficient and cohomology-system definitions.

   **Witness:** These repeat lines 835 and 846 without an instance or computed value. Only the no-leg test is an instantiated control, leaving fewer than three discriminating Checks.

   **Exact repair text:** Keep the no-leg Check and replace the other two by: “On P¹ with GL₂, empty legs, rational trivial coefficients, fixed degree zero and instability ≤2m, the classes are O(a)⊕O(−a), 0≤a≤m. H⁰_c has dimension m+1 and the transition to m+1 includes these coordinates; the union has infinite dimension.” “For two GL₂ minuscule modifications colliding at total coweight (1,1), the forgotten intermediate-lattice fibre is P¹. Its unshifted compact cohomology has ranks 1 in degrees 0 and 2; the proper partition pushforward retains both terms, whereas replacing the fibre by a point loses degree 2.” At m=0,1 the first dimensions are 1,2; the second has total rank 2 versus 1 for the incorrect point model.


8. **F08** (P2) The arithmetic gap's promised full contracts are absent

   Re-raised: F10. The repair correctly permits unresolved supplier work, but its stated reason calls the four gaps precise. For this gap that precision claim fails: the promised full contracts are absent.

   **Location:** `packages/GlobalShtukasAndFunctionFieldLanglands/README.md:84`: “with the full contracts labelled FA.1–FA.6 in this roadmap”; `packages/GlobalShtukasAndFunctionFieldLanglands/design/plan.json:7` repeats this promise.

   **Claim:** The aggregate gap specifies the precise hypotheses and outputs of all six arithmetic inputs.

   **Witness:** FA.1–FA.6 occur only in supplier references and Needs lines. In particular README:870 needs the Brauer local-invariant exact sequence, which the gap's needs sentence never specifies. No six full contracts follow the gap paragraph.

   **Exact repair text:** After removing the duplicate inputs in S03, replace the aggregate gap by separately stated contracts, with matching design entries: “For F=F_q(X), supply the exact sequence 0→Br(F)→⊕_v Br(F_v)→Q/Z→0, the last map being the sum of the normalized local invariants.” “For a connected finite étale Galois cover Y→U of a smooth geometrically connected curve over F_q, with group H and constant field F_(q^d), each conjugacy class C occurs at closed points of every sufficiently large compatible degree n, where compatibility means that C restricts to the nth arithmetic Frobenius on F_(q^d); incompatible degrees have no such points.” “For every split connected reductive G/F, finite full level N and central lattice Ξ with cocompact central degree image, construct proper-parabolic constant terms and prove a finite support bound, depending only on G,N,Ξ, for all cuspidal functions modulo Ξ with coefficients E, O_E or O_E/λ^s, where ℓ≠p.” Import the zeta input from DeligneWeightsAndPurity §1.10 and constant-character normalization from its §5.5 (S15), instead of requesting them again. Replace the unnamed FA.3 ramification input by the actual local assertion used in GS.0.7: for each henselian O_v and smooth connected-fibre model, H¹(O_v,𝒢)=1, using Lang and smooth henselian lifting. Keep this specialization in GS.0.7’s proof contract. Do not claim that bare labels are full contracts. The Brauer contract accepts two local invariants 1/2,1/2, whose sum is 0 in Q/Z, and rejects a single 1/2. The support contract excludes G_m with no central degree quotient, whose bundle degrees run through Z. This challenges precision, not the existence of a declared gap.

9. **F09** (P3) The new bounded-locus definition has no three Checks

   **Location:** `packages/GlobalShtukasAndFunctionFieldLanglands/README.md:233`: “Define `Bun_{G^ad}^{≤μ}` by inverse image of the degree-zero vector-bundle HN open”.

   **Claim:** The new embedding-dependent bounded-locus construction has the required discriminating controls.

   **Witness:** GS.0.6 has no Checks block. Its two example remarks cover only trivial adjoint bounds and eventual exclusion; neither tests the cofinal change of embedding or fixes a numerical threshold.

   **Exact repair text:** Add: “For G_m on P¹ every O(d), d∈Z, has adjoint instability 0; fixing d leaves one rational class.” “For GL₂ on P¹, O(1)⊕O(−1) has instability 2: it fails bound 1 and satisfies bound 2.” “For PGL₂ use the faithful adjoint representation and its direct sum with itself. On the bundle induced by O(a)⊕O(−a), a≥0, their vector-bundle slopes are (2a,0,−2a) and (2a,2a,0,0,−2a,−2a). Their maximal-slope bound has the same cutoff 2a≤b; multiplicities differ.” These give values 0, 2 and the stated two different HN polygons.

10. **F10** (P2) The first local comparison uses an element constructed later

   **Location:** `packages/GlobalShtukasAndFunctionFieldLanglands/README.md:1774`: “the spherical local excursion … equals `h_{V,v}`”; line 1776: “Identify the two-leg local convolution element”.

   **Claim:** GS.7.1 proves this comparison before constructing the local elements.

   **Witness:** The convolution element is constructed in GS.7.5 (README:1849), using GS.7.2–GS.7.4. None is a prerequisite of GS.7.1, and the proof does not define an independent earlier local element.

   **Exact repair text:** Keep global unramified restriction and its Satake eigenvalue in GS.7.1. Move its assertion identifying the spherical local convolution element, and the corresponding proof sentence, to GS.7.5 after that element is constructed; add GS.7.1 to GS.7.5's Needs. For f=1 both the completed local element and the spherical function are the unit of the volume-one Hecke algebra; for the two-leg trace they are the already-normalized h_{V,v}. No later construction is needed by the retained GS.7.1.

11. **F11** (P2) Drinfeld's finite-cover theorem is restricted to repeated curves

   **Location:** `packages/GlobalShtukasAndFunctionFieldLanglands/README.md:1262`: “For U a smooth geometrically connected curve over F_q … U^I”.

   **Claim:** This is the general finite-étale Drinfeld lemma the roadmap develops.

   **Witness:** VL line 5925, Lemma 8.11, allows any finite family of connected F_q-schemes X_i with geometric basepoints. A²×A¹ is supported by the source but cannot be an instance of the target's repeated-curve signature.

   **Exact repair text:** “For a finite family of connected F_q-schemes (X_i) with chosen geometric basepoints x_i, finite étale covers of ∏_{F_q} X_i with commuting partial-q-Frobenius lifts whose product is total q-Frobenius are equivalent to finite sets with continuous ∏_i π₁(X_i,x_i)-action. The functor sends product Galois covers and their finite product-group sets to their contracted product; prove full faithfulness and essential surjectivity in this generality (VL Lemma 8.11).” Keep U^I as the shtuka specialization. Add X₁=A², X₂=A¹, with the two-element constant-field character on the first factor: the resulting cover has degree 2, first partial Frobenius permutes the two sheets, the second fixes them, and their product is total Frobenius. No earlier owner of this scheme-level theorem was found; the v-stack Drinfeld lemma in VStackSheavesAndLisseCategories VS1 has different carriers.

12. **F12** (P2) General smooth models are silently replaced by parahoric models

   **Location:** `packages/GlobalShtukasAndFunctionFieldLanglands/README.md:118`: “(parahoric at the remaining points)”; line 233: “with connected parahoric model”.

   **Claim:** The bounded-locus prerequisite covers the arbitrary smooth affine connected-fibre models in Conventions, GS.0.1 and GS.2.1.

   **Witness:** Over O=F₃[[t]], Spec O[x,(1+tx)⁻¹] with law x+y+txy has generic fibre G_m and special fibre G_a. Its O-points are 1+tO, whereas the split-torus parahoric has O-points O×.

   **Exact repair text:** Delete the parenthetical identifying smooth models with parahoric ones. Before the parahoric specialization in GS.0.6 add: “For every smooth affine finite-type model 𝒢/X with connected fibres and reductive generic fibre, construct finite-type open exhaustions of Bun_𝒢 after fixing central degrees. Establish a faithful bundle representation with quasi-affine quotient, finite type of the reduction-of-structure-group map on bounded vector-bundle loci, and cofinality under change of representation. On connected parahoric models compare these exhaustions with the adjoint HN construction below.” Use this general target in GS.2.2; retain the parahoric hypothesis precisely where affine-flag ind-properness is used in GS.7.2. For the displayed dilatation, the general construction recovers line bundles with a trivialization at t=0: on P¹/F₃, fixed degree gives one class with trivial automorphism group, whereas the underlying unlevelled line has two automorphisms. Hein line 158 supports the general smooth-model carrier; Ric16 line 47 explicitly distinguishes parahoric models by ind-properness.

13. **F13** (P3) The restricted-shtuka locator points into the bibliography

   **Location:** `packages/GlobalShtukasAndFunctionFieldLanglands/README.md:1809`: “§9, pp. 46–47”; `packages/GlobalShtukasAndFunctionFieldLanglands/sources.toml:29` repeats it.

   **Claim:** GeL's nonsplit restricted-shtuka construction is on pages 46–47 of the explicitly cited v3.

   **Witness:** GeL line 1604 starts §9 on page 43; its parahoric-model argument is at line 1612. References begin at line 1703 on page 45; pages 46–47 contain bibliography.

   **Exact repair text:** Replace this occurrence in README and the GeL manifest locator with “§9, pp. 43–45, especially p. 43.” The repaired locator reaches the parahoric-model and ind-properness argument; the old locator reaches references only.

14. **F14** (P2) Rational DM-stack cohomology has an uncited earlier owner

   **Location:** `packages/GlobalShtukasAndFunctionFieldLanglands/README.md:523`: “on a Deligne–Mumford stack the étale site gives the same categories”; line 541: “the étale and lisse-étale theories agree”.

   **Claim:** GS.1.4 can construct the rational DM specialization from scheme suppliers alone.

   **Witness:** `TauCetiRoadmap/DeligneWeightsAndPurity/README.md:3273` already constructs rational constructible coefficients and cohomology of finite-type DM stacks; lines 3290–3293 supply atlas refinement, pullback, Frobenius and proper finiteness. GS.1.4 does not import it.

   **Exact repair text:** Add to the supplier contract and GS.1.4 Needs “DeligneWeightsAndPurity §8.24, dmStack_etaleCohomology and its atlas, refinement, pullback, Frobenius and proper-finiteness API.” Replace the independent rational DM construction by “The rational finite-type DM specialization is the supplied étale coefficient theory of DeligneWeightsAndPurity §8.24; construct its comparison with the lisse-étale theory here, compatibly with that API. This target extends it to the stated Artin stacks, coefficients and six operations.” On BC₂ the supplied sign system has H⁰=0 and the constant system H⁰=E, also at ℓ=2; the comparison must preserve this distinction. The general Artin-stack extension remains owned here.

15. **F15** (P2) Constant determinant normalization repeats an earlier theorem

   **Location:** `packages/GlobalShtukasAndFunctionFieldLanglands/README.md:1715`: “a constant rank-one twist makes det L finite order”; line 1717: “Use finiteness of the geometric determinant”.

   **Claim:** The finite geometric-image and determinant-normalization input is assigned to the generic arithmetic gap.

   **Witness:** `TauCetiRoadmap/DeligneWeightsAndPurity/README.md:1866` (§5.5) already proves finite geometric image for rank-one Weil systems and finite-determinant normalization of irreducible systems. GS.6.1 instead cites FA.4 and does not import this owner.

   **Exact repair text:** “Apply DeligneWeightsAndPurity §5.5 to det L to obtain finite geometric image and a constant Weil twist making det L finite order. For the continuous lisse input, its constant scalar is an ℓ-adic unit, so this twist extends continuously to the constant-field Galois group. The additional algebraicity and p-plainness refinement is proved here using Chin Proposition 4.3.” Add §5.5 to the supplier contract and Needs, and remove the redundant FA.4 normalization input. A rank-one system with arithmetic Frobenius 1+ℓ is normalized by (1+ℓ)⁻¹, giving determinant 1; neither requires a finite-order original scalar.

## Verified sound

The entire README (2,025 lines) and Suggested.lean (28 lines) were read. There are 93 numbered README targets and zero Lean declarations, definitions, examples, variables or instances. The checks below are mathematical evaluations, not Lean builds. The target ledger includes an explicit calculation for every numbered target, including the conditional and conjectural statements; a successful instance does not prove a general theorem or discharge its dependencies.

### Earlier findings, individually verified

Locations in this table are in `packages/GlobalShtukasAndFunctionFieldLanglands/README.md` unless another file is named. “Repaired” concerns the earlier defect, not all other claims in its section. F10 and F17's unresolved supplier work is permitted by the declared-gap contract; only F10's precision claim is re-raised in S08.

| Earlier finding | Status | Current repaired passage and independently checked witness |
|---|---|---|
| a:F01 nonsplit Satake | Repaired | 660: “For split G”; 662 uses “twisted-conjugacy quotient”. The unramified norm-one torus has invariant cocharacters 0, so its Hecke algebra is E, not E[z,z⁻¹]. The new prerequisite order is S02. |
| a:F02 circular Hecke construction | Repaired | 955: “where all legs avoid its finite place support”; 957 assigns extension to GS.3.6. GS.3.1 now needs only the earlier action. Xue-I line 2605 separates the domains; δ₁δ₋₁=δ₀ off support. |
| a:F03 companion slopes | Repaired | 1727: “For the finite-determinant sheaf”; 1731–1733 give translated controls. Rank-one q has slope 1 before twisting and 0 afterward. LL line 11423 includes finite determinant. |
| a:F04 stale pins | Repaired | 47 names Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`; both equal `lake-manifest.json` entries. |
| a:F05 imported algebra API | Repaired | 1615: “Algebra.isMulCommutative_adjoin” and “FiniteDimensional.finiteDimensional_subalgebra”. They exist at the pin; Suggested.lean contains neither obsolete theorem. Empty generators yield the scalar subalgebra. |
| a:F06 Picard-stack duplicate | Repaired | 409: “the Picard stack supplied by SchemeAndStackFoundations §3.7”; 425 cites its gerbe and base-change API. The owner's §3.7 has those targets. For P¹/F₃ the coarse degree-zero point has mass 1, its gerbe mass 1/2. |
| a:F07 integral Eichler–Shimura | Repaired | 1136: “on a finitely generated module”; 1134 uses the “coefficient-natural Cayley–Hamilton construction”. Xue-I line 2583 states the auxiliary free-M theorem, and line 2619 rejects denominator clearing. On F₂, 2Id=0 but Id(1)=1. |
| a:F08 ramified pinning quotient | Repaired | 35: “kernel of the pinned Galois action on the full based root datum”; 1645 repeats it. The source at VL line 8299 incorrectly abbreviates this by the Dynkin diagram; the repaired full-root-datum formulation avoids that error. F₃(t)(√t) has e=2 at 0,∞ and is rejected on U=P¹. |
| a:F09 nonexistent stable lattice | Repaired | 1310: “Continuity here is imposed on the geometric kernel only”; 1986: “a lattice stable under partial Frobenius is not required”. Xue-S line 440 has this continuity convention; λ⁻ⁿ has valuation −n. |
| a:F10 missing supplier contracts | Partly repaired; original external-work disposition respected | 84–94 give five named gap slugs matching design; 71 imports “OrientedNearbyCycles.modificationBaseChange” from ClassicalAdicEtaleCohomology §5.4. Missing supplier implementation is not re-raised. S03 concerns minimality, and S08 the unsupported claim of precise FA contracts. |
| a:F11 finite versus full arithmetic Satake | Repaired | 701: “full arithmetic Satake category” uses the absolute Galois group; the finite-form functor is a “specified subfunctor”. Ric line 925 supports the category. (1+ℓ)ⁿ≠1 for n>0, whereas (−1)²=1. The separate comparison defect is S06. |
| a:F12 erased level | Partly repaired | 1164 and 1700 retain “levelled”/“ray Picard”; 1250 computes the two-point level. At 1248 the old unlevelled torus sentence survives. The same example has dimensions 2 versus 1: S01. |
| a:F13 source manifest | Repaired | `packages/GlobalShtukasAndFunctionFieldLanglands/sources.toml` contains 28 unique IDs, 27 cached legal texts and settled uncertified Del73. README:1809 cites AH19 Theorem 3.15 and Ric16 Theorem A; 1843 cites EX24 A.4/A.9. AH19 line 798 is algebraicity and level forgetting; EX24 line 1607 is composition. |
| a:F14 directness omitted | Repaired under the current acceptance rule | 1615 requires “independence and spanning”. The abstract substitute is deleted from Suggested.lean. For J=(1 1;0 1), the generalized block has dimension 2 and ordinary eigenspace dimension 1. The pinned independence theorem is cited at 1615. |
| a:F15 inverse/numerical controls | Repaired under the current acceptance rule | 1523: “f(A,A)=tr(1)=2”; wrong tr(A²)=17/4. The Euler controls at 222 give 2 versus 0, and shifted-block controls at 280–282 give 1 versus −1/2. Numerical Lean mirrors were correctly deleted under the binding rule. |
| a:F16 nonregular matrix coefficient | Repaired | 1517 distinguishes point functions from algebraic matrix coefficients and gives the absolute-value control. At a/b=−1, absolute value is 1, the character is −1. No empty regularity predicate or abstract substitute remains in Lean. |
| a:F17 mass proof input | Repaired conditionally; settled external-work disposition respected | 369: determinant-fibre proof using “determinant-trivialized SL_r quotient volume”; 94 and design declare the same volume gap. For P¹/F₃,r=2 its SL₂ volume is 1/16 and GL₂ bundle mass 1/32. Sch line 1017 gives the same mass formula. |
| a:F18 Lang owner | Repaired | 75, 261, 425 and 1272 name RG2.3.7, lang-theorem. Its current target covers smooth geometrically connected finite-type groups. Pic⁰(P¹)=1 has Lang kernel 1; the full Picard degree Z is not substituted. |
| a:F19 horocycle controls | Repaired | 909–911 give the complete r=0, rise/fall r=2, and rising r=1 tuples. Their support sizes are 0,2; the last fails endpoint equality by 1. |
| a:F20 Lean catalogue/process | Repaired | packages/GlobalShtukasAndFunctionFieldLanglands/Suggested.lean:4–23 gives mathematical headline omissions, then an empty namespace. The old unavailable-name catalogue and process instruction are absent. S05 concerns one inaccurate omission reason. |
| a:F21 nearby-cycle hypotheses | Repaired | 1815: “coherent irreducible”, “finitely presented”, “n>0 invertible on S” and “bounded constructible”. Org line 86 states these conditions. An integral leg square has dimension 2 and one generic point; two crossing components fail irreducibility. |
| b:F01 padded invariance theorem | Repaired by deletion | packages/GlobalShtukasAndFunctionFieldLanglands/Suggested.lean:26–28 is an empty namespace. The one-tactic invariant-function statement is absent, as required by the current padding rule; proving it in place would not be the required repair. |
| b:F02 escaped quotient | Repaired | 1653 puts `O(Ĝ\(ᴸG)^I/Ĝ)` inside a code span; 1044 and 1981 similarly protect shifts. The quotient backslash now survives CommonMark rendering. |

### Lean acceptance and context inventory

| File and section | Declarations / variables / instances | Headline and carrier decision | Probe |
|---|---|---|---|
| packages/GlobalShtukasAndFunctionFieldLanglands/Suggested.lean:1–28; namespace TauCetiRoadmap.GlobalShtukasAndFunctionFieldLanglands | 0 / 0 / 0 | Module docstring names rational/integral/arithmetic Satake; global-shtuka geometry and cohomology; integral Eichler–Shimura; Drinfeld descent and ind-smoothness; PGL₂ Eisenstein decomposition; global/nonsplit/modular excursion decomposition; curve companions; local parameterization, compatibility and gamma factors. | No own declaration exists to place in a `#check @name` file. No elaboration was run. |

No surviving signature can silently lose a section instance. There is one `import Mathlib`, no sorry'd data, no placeholders, no `lemma`, no `set_option`, no catalogue of own declaration names, no admitted example and no padding declaration. The geometric headlines need carriers absent from these pins; elementary numerical and abstract-algebra statements would be stand-ins. S05 corrects the claim that the representation category itself is absent. No additional statable geometric headline was identified by the pinned object search.

### Computed README statement ledger

Each row covers the section's theorem/definition and named API, using its standing hypotheses. Curve context C means smooth projective geometrically connected X/F_q, q=pᵃ≥2; reductive generic G with the specified smooth connected model; finite full level N, including nilpotents. Coefficient context E means a finite Q_ℓ-extension with ℓ≠p, O its integers and λ a uniformizer; the chosen half Tate twist is retained. Thus q=1, zero coefficient rings as fields, inseparable splitting covers and non-quasi-separated schemes as coherent bases are excluded, not silently valid test inputs. Arbitrary test schemes in moduli definitions still include square-zero thickenings. Empty legs, trivial groups, zero representations and torsion coefficients are tested where their definitions admit them. A numerical rank-zero convention does not create a geometric rank-zero theorem.

“Pass” below means the displayed values agree on that instance. Named findings and inherited supplier conditions remain in force.

| Statement / README line | Instance and context | Computed values on the two sides / negative control | Result; change |
|---|---|---|---|
| GS.0.1 / 110 | C; G=1,G_m over F₃; GL₂ on P¹ | Aut(trivial 1-torsor)=1; Aut(O)=F₃× has order 2, not 1; instability of O(m)⊕O(−m)=2m | Pass on examples; S12 model scope |
| GS.0.2 / 139 | C; G_m, g=0,1; square-zero base | h⁰(ad)=1, h¹(ad)=g, h²(ad)=0; stack dimension g−1 is −1,0; obstruction group 0 | Pass |
| GS.0.3 / 153 | C; empty, rational and doubled level; G_m/F₃ | Empty level group 1; units of F₃[ε]/ε² have 2·3=6 elements versus 2 for reduced point | Pass; nilpotents retained |
| GS.0.4 / 177 | C; n=1,2; degree-two place | Full twist adds degree 1; rank-two half twist squared tensors O(x), trivial on PGL₂; geometric degree-two point has 2 residue sections | Pass |
| GS.0.5 / 202 | C; zero/torsion, g=0,1 | χ((1,0),(1,1))=2; reverse=0; χ(O,O)=1−g; degree-two skyscraper has (0,2), slope ∞; zero sheaf has empty HN type | Pass |
| GS.0.6 / 233 | C; GL₂,P¹,degree 0; G_m | O(m)⊕O(−m) has instability 2m; for m=1 bound 1 rejects, bound 2 accepts. G_m adjoint bound is 0 for every degree d∈Z | Mathematical controls pass; S09 Checks and S12 scope |
| GS.0.7 / 249 | C; split G_m/F₃ and inner-form indexing | Bundle stabilizer and adelic stabilizer both F₃× of size 2; mass 1/2. Removing automorphisms gives 1 | Pass conditionally on arithmetic input |
| GS.0.8 / 265 | Numerical block; T=(1,−1), then T=(3,2,0) | Degree-one first line shifted slope 1−1=0; whole slope 0−(1−1)/2=0. With T=0 inequality is 1≤0, false. Block (1,3],d=4: (4−2−0)/2=1; wrong prefix gives −1/2 | Pass |
| GS.0.9 / 292 | C; P¹,O²; opposite flags at 0,∞ | Twists D=∅,{0},{∞},{0,∞} give instabilities 0,1,1,0; minimum 0 has two distinct divisor realizations | Pass; uniqueness requires positive instability |
| GS.0.10 / 317 | C; GL₂, degree-one central generator | Tensoring adds 2 to degree, quotient Z/2Z has 2 classes; degree-zero generator leaves Z infinite; semisimple centre needs Ξ=1 | Pass |
| GS.0.11 / 339 | C; rank one, q=3 then 2 | Weight 1/(q−1) times diagonal kernel q−1 equals 1: (1/2)·2=1 and 1·1=1 | Pass |
| GS.0.12 / 353 | C; identity splitting cover; pure inner forms | Identity descent returns the same torsor and stabilizer; a nontrivial kernel class α remains in component α, not the neutral component 0 | Pass; arithmetic contract retained |
| GS.0.13 / 367 | C; P¹/F₃,r=1,2; torsion degree 0,1 | Z_X(t)=1/((1−t)(1−3t)); masses r=1:1/2, r=2:1/32; SL₂ volume 1/16. Torsion constant term 1 and linear coefficient 4/2=2. Formal r=0 extension gives 3/2 versus actual 1 | Pass for r≥1; declared volume input |
| GS.0.14 / 383 | C; torus vs GL₂ | No proper parabolics: intersection of kernels is whole space; GL₂ trivial-bundle indicator has positive constant term; G_m without central quotient has degree set Z | Pass; S03/S08 contracts |
| GS.0.15 / 409 | C; Pic on P¹/F₃ | Pic⁰=1, Lang kernel 1; full Pic degrees Z. Degree-zero gerbe has automorphisms 2 and mass 1/2 versus coarse point mass 1 | Pass; supplier imported |
| GS.1.1 / 446 | C; dual numbers, G_m; GL₂ minuscule | 1+εt⁻¹ has winding exponent 0 but is not a positive loop; reduced integer-lattice model misses it. GL₂ minuscule Schubert=P¹ has dimension 1 | Pass |
| GS.1.2 / 473 | C; zero/torus/nonminuscule bounds | Weight 0 gives unit point; torus composition 1+(−1)=0; GL₂ bound (2,0) contains (1,1), not only its open orbit | Pass |
| GS.1.3 / 498 | C; empty chain and two torus modifications | Empty chain sends E to E; coweights 1 then −1 compose to 0; zero-bound identity has relative position 0 | Pass |
| GS.1.4 / 522 | C,E; BS₃ and BG_m/F₃ | BS₃ mass 1/6+1/2+1/3=1; BG_m mass Σᵢ≥1 3⁻ⁱ=1/2 from H_c^(−2i)=E(i), not a bounded finite sum | Pass; convergent trace condition essential; rational DM supplier S14 |
| GS.1.5 / 555 | C; two GL₂ minuscule steps | Collision fibre P¹: 2 dim fibre=2 equals stratum codimension 2, so semismall, not small. Off-diagonal global geometry adds codimension 1: 2<3 | Pass |
| GS.1.6 / 569 | C; n=2,r=1 and r=0 | Relative dimensions rn=2 and r(n−1)=1; at collision ab=0 is singular, while total ab=t is smooth of dimension 2; r=0 gives 0 | Pass |
| GS.1.7 / 594 | C,E; G=1,G_m,GL₂ | Frobenius +1 and −1 have same underlying 1-dimensional geometric object but distinct arithmetic traces. Torus weights 2+3=5; standard GL₂ tensor square has dimension 4=3+1 | Pass; full arithmetic data retained |
| GS.1.8 / 620 | C,E; two odd factors; ℓ=2 | Koszul sign (−1) times correction (−1)=+1. GL₂ open IC trace −q⁻¹ᐟ²; spherical normalization +q⁻¹ᐟ². In characteristic-zero 2-adic E, −1≠1 | Pass |
| GS.1.9 / 634 | C,E; trivial group and torus | G=1 gives finite vector spaces; torus weight m has fibre dimension 1; dual Hopf algebra E[z,z⁻¹] has antipode z↦z⁻¹ | Mathematical control passes; S04 owner |
| GS.1.10 / 648 | C,E; central positive loop | G_m unit a preserves the same lattice and coefficient stalk; geometric action is 1, whereas the dual weight-one character takes value a | Pass; two centres distinguished |
| GS.1.11 / 660 | C,E; split and norm-one tori | Split gives E[Z]; norm-one Frobenius action n↦−n has invariants {0}, giving E. At q=3 minuscule traces are −1/√3 versus h=+1/√3 | Pass; S02 ordering |
| GS.1.12 / 682 | Finite locally free quotient ranks 0,1,2 | ∧⁰R⁰=R; scale 2 acts by 2, inverse determinant by 1/2; swap gives −1, becoming +1 in char 2. Opposition on IH⁰,IH² is +1,−1 | Pass |
| GS.1.13 / 699 | C,E; G=1, norm-one torus; dual SL₂ | (1+ℓ)ⁿ≠1 for n>0, (−1)²=1; norm-one lattice action −1. Source comparison on (1,γ),(u(1),1) gives u(1/3) versus u(3) | S06; full/finite category distinction itself passes |
| GS.1.14 / 723 | O and k=O/λ; unit object | k⊗ᴸ_O k has H⁻¹=k and H⁰=k; perverse degree-zero tensor gives k; O⊗O=O with no Tor₁ | Pass; no false flatness assumption |
| GS.2.1 / 757 | C; G_m, empty/two/one legs | Weights 1,−1 sum 0, allowing d=d; single weight 1 forces d+1=d, impossible. id_X×Frob_S preserves degree 1 of O(1); Frobenius on X would multiply it by q | Pass |
| GS.2.2 / 782 | C; no legs, G=1,G_m | G=1 gives point; unlevelled G_m/F₃ stabilizer has order 2; rational-point full level reduces it to 1. Unbounded degree set is Z before central quotient | Bounded examples pass; S12 general-model prerequisite |
| GS.2.3 / 796 | Split C; one jet, G=1,GL₂ | Relative dimensions (Σn_i)dim G are 0 and 1·4=4; a smooth map to singular Schubert support does not force that support's tangent excess to vanish | Pass |
| GS.2.4 / 810 | C; n=2,r=1,μ=−1 | 2 deg D∞=2(−1/2)=−1=Σμ; taking D∞=0 and μ=1 gives 0≠1. A degree-two infinity contributes one chosen residue section, not two flags | Pass |
| GS.2.5 / 835 | C,E; no legs, GL₂ on P¹ | At degree 0 and instability≤2m, rational classes O(a)⊕O(−a),0≤a≤m give dim H⁰_c=m+1, hence 1,2 for m=0,1. Minuscule collision fibre P¹ has ranks 1 in degrees 0,2 versus a point's sole rank 1 | S07 replaces restated Checks |
| GS.2.6 / 860 | C; n=2 twisted zero-leg form | Local invariants 1/2+1/2=1=0 in Q/Z; one 1/2 has nonzero sum and cannot globalize | Pass conditionally; S08 exact Brauer contract |
| GS.2.7 / 874 | C; n=2,g=0; negative modification | Selected degree n(g−1)+1=−1; tensor degree-one line changes it to +1. Modification −1 agrees with 2(−1/2), not +1 | Pass conditionally on elliptic-sheaf carrier |
| GS.2.8 / 894 | C; empty flags, N>max(2g−2,0) | r=0 tuple has support dimension 0; r=2 rise/fall has 2 free legs; r=1 rise has N₁−N₀=1 and fails closing equality | Pass |
| GS.2.9 / 919 | C; degree-two point; two legs | Returning to the same residue point needs 2 iterates; degree vectors (1,0)+(0,1)=(1,1), not (1,0) | Pass |
| GS.2.10 / 943 | C,E; merge two legs | V⊠V∨ restricts to V⊗V∨, dimension d²; for d=2 this is 4, not 2. Added trivial leg contributes factor 1 | Pass |
| GS.2.11 / 955 | C,E; torus Hecke, off support | Unit acts as 1; δ₁δ₋₁=δ₀; adjoint δ₁*=δ₋₁. Support extension is deferred to GS.3.6 | Pass; former cycle removed |
| GS.3.1 / 993 | C,E; unit, zero covector, rank d | Unit pairing 1 yields Id; zero covector yields 0; evaluation after coevaluation yields dId, so d=2 gives 2Id, not Id | Pass |
| GS.3.2 / 1017 | O-module; scalar and inverse uniformizer | a∈O preserves O·m, generated by one element; λ⁻¹ iterates have valuations 0,−1,−2,…; zero vector uses witness of rank 0 | Pass |
| GS.3.3 / 1044 | PGL₂; r=0, then r=2,#I=2 | r=0 gives shift 0; fibre dimension 2−2/2=1 gives [−2](−1)+[4](2)=[2](1), not [−2](−1) | Pass; E1 correction |
| GS.3.4 / 1058 | PGL₂,E; boundary sum | Finite sum Eⁿ has rank n; union has unbounded rank. Spherical inverse double coset equals the original, so adjoint equals the same operator | Pass; constructible versus ind distinction |
| GS.3.5 / 1083 | C,E; torus and GL₂ | Torus proper-parabolic index set empty: kernel intersection=whole space. GL₂ trivial-bundle indicator has positive, not zero, constant term | Pass |
| GS.3.6 / 1110 | C,E; unit V, deg v=2, GL₂ | Unit gives operator 1; Frobenius returns after F², not F; minuscule sign changes −q_v⁻¹ᐟ² to +q_v⁻¹ᐟ² | Pass |
| GS.3.7 / 1132 | C,O; auxiliary free rank 1,2; torsion W | Rank 1: S_M−F=0; rank 2 on eigenvalues a,b: ab−(a+b)a+a²=0. In F₂, 2Id=0 but Id(1)=1 | Pass; integral theorem not denominator cancellation |
| GS.3.8 / 1160 | C,E; G_m,P¹/F₃,N={0,∞} | Ray degree-zero group (F₃×)²/F₃× has size 2; ordinary Pic⁰ has size 1. Cusp dimensions 2 versus 1 | Target passes; example at 1248 is S01 |
| GS.3.9 / 1174 | PGL₂; one fixed degree and translations | Pic⁰ keeps degree N; degree-one tensor sends it to N+1. Reusing the N projection in the N+1 summand cannot intertwine this action | Pass; E2/E3 corrections |
| GS.3.10 / 1188 | C,O; cusp rank d=0,1 | O⁰=0 finite; O¹ has one generator. E¹ is dimension 1 over E but has elements λ⁻ⁿ with unbounded negative valuation over O | Pass |
| GS.3.11 / 1204 | PGL₂,E; Eisenstein degree torus | E[z,z⁻¹]^(z↦z⁻¹)=E[z+z⁻¹] has Krull dimension 1; an isolated character has dimension 0; no total finite-dimensionality follows | Pass |
| GS.3.12 / 1218 | C,O; Hecke-module versus O-module | O[t] is generated by 1 over itself but {1,t,t²,…} is O-linearly independent; zero torsion is killed by λ⁰=1 | Pass |
| GS.3.13 / 1232 | PGL₂ parity-admissible r,#Σ∞ | (0,2): 0<2, finite type; (2,2): 2<2 false, high strata remain. (1,0) violates parity and is excluded | Pass; strict inequality |
| GS.4.1 / 1262 | C; singleton/empty leg and finite cover | Singleton returns original finite-cover category; empty finite cover has cardinality 0 on both sides; empty product group=1. Dual-number cover is not étale | Values pass; extend generality in S11 |
| GS.4.2 / 1276 | O-lisse rank 1 | Unit Frobenius preserves O and every O/λˢ; λ⁻¹ sends 1 outside O and is excluded from integral/profinite branch | Pass |
| GS.4.3 / 1290,1310 | E; two degree directions; scalar λ⁻¹ | (1,0)+(0,1)=(1,1); scalar Frobenius has nth valuation −n but geometric action 1, hence continuous geometric kernel and no stable lattice | Pass; rational variant retained |
| GS.4.4 / 1322 | C,E; merge two blocks | Coalesced Frobenius is F₁F₂, degrees 1+1 in their coordinates; empty block contributes identity F⁰=1 | Pass |
| GS.4.5 / 1334 | O; monic T²=aT+b | Span {m,Tm} suffices; T³m=(a²+b)Tm+abm. With a=b=0, T²m=T³m=0 | Pass |
| GS.4.6 / 1348 | C,E; unit coefficient, arbitrary-sheaf negative control | Specialization E→E sends 1↦1 and inverse 1↦1; a skyscraper would have generic fibre 0 versus closed fibre E, showing why the geometric theorem is needed | Pass |
| GS.4.7 / 1362 | C,O; finite stable lattice, rank 0 | Image lies in GL_d(O), all matrix entries integral; inverse determinant is a unit. For d=0 image is singleton 1 | Pass |
| GS.4.8 / 1374 | C,E; empty and merged legs | Empty legs give cusp space; inserting trivial coefficient multiplies dimension by 1; merging two rank-two dual factors gives 4, not 2 | Pass |
| GS.4.9 / 1399 | C; nonabelian Galois action | Coalescence restricts along γ↦(γ,γ). In S₃, multiplication (a,b)↦ab is not a homomorphism: (1,b)(a,1) gives ab versus ba for noncommuting a,b | Pass; diagonal direction |
| GS.4.10 / 1411 | C,E; inserted dual pair | A=diag(2,1/2): inserted (A,1) has trace 5/2 versus identity-pair trace 2; arbitrary inserted action cannot commute away | Pass |
| GS.4.11 / 1423 | C,E; change of transport c→cu | (cu)(u⁻¹Tu)(cu)⁻¹=cTc⁻¹; omitting conjugation gives cuTu⁻¹c⁻¹, generally different | Pass |
| GS.4.12 / 1435 | O[t]; λ-invertible and λ-torsion maximal ideals | O[t]/(λt−1)=E with t=λ⁻¹; O[t]/(λ,t)=k finite. First quotient is not a finite O-module; both use the correct distinct descent branches | Pass; source E6 repaired |
| GS.4.13 / 1451 | C,E; constant sheaves and infinite union | Each E has specialization 1↦1; Eⁿ ranks n are unbounded in the union. Ind-smoothness does not assert a finite rank bound | Pass |
| GS.5.1 / 1481 | C,E; zero covector/all identity tuple | ξ=0 yields 0; all γ_i=1 yield ξ(x)Id; dual pair of dimension 2 yields 2Id | Pass |
| GS.5.2 / 1505 | Algebraic matrix coefficient versus abstract one | f(A,1)=5/2; f(A,A)=2; missing inverse gives 17/4. abs(a/b) at −1 is +1, whereas the algebraic character is −1 | Pass; inverse and regularity distinguished |
| GS.5.3 / 1527 | C,E; trace/unit and norm-one torus | Trace at Id on unit coefficient=1; trace at A=5/2; norm-one spherical algebra remains E, not E[z,z⁻¹] | Pass; all-tuple reconstruction retained |
| GS.5.4 / 1539 | C,O; full compact cohomology, empty extra legs | Empty excursion gives scalar ξ(x) on retained cohomology; unit pairing gives 1; inserted coordinates act as 1, not an arbitrary γ | Pass; noncuspidal domain retained |
| GS.5.5 / 1566 | Nonabelian S₃; γ=(12),γ′=(123),γ″=1 | γ(γ′)⁻¹γ″=(13); wrong order (γ′)⁻¹γ=(23). Constant regular function 1 gives operator 1 | Pass |
| GS.5.6 / 1580 | C,E; good inertia and nonsplit Frobenius | Inertia value 1 does not change tuples; norm-one Frobenius acts by −1 on lattice while inertia acts +1 | Pass |
| GS.5.7 / 1592 | Finite cusp space; Jordan block and zero space | (J−1)e₂=e₁≠0; (J−1)²e₂=0; generalized dimension 2 versus eigen dimension 1. Zero space has sum 0=top | Pass; independence and spanning both present |
| GS.5.8 / 1619 | Rank-one pseudocharacter; all tuples | Values a,b give product ab; generator values 2 and 3 give distinct characters and therefore distinct rank-one parameters | Pass |
| GS.5.9 / 1633 | C,E; zero space, spherical adjoint | Zero space decomposes as 0; nonzero off-diagonal Jordan matrix is not normal since JJ*−J*J=diag(1,−1). Normal spherical action therefore does not force all excursion operators semisimple | Pass |
| GS.5.10 / 1645 | C; split and nonsplit torus | Split Q=1; F₃(t)(√t) gives e=2 at 0,∞ and violates U=P¹; unramified norm-one inertia=1,Frobenius=−1 | Pass |
| GS.5.11 / 1663 | O to O/λ reduction | (1 λ;0 1) reduces to Id; (1 1;0 1) remains Jordan, generalized block dimension 2 with eigenspace dimension 1 | Pass |
| GS.5.12 / 1675 | Conditional eigensheaf comparison; unit/zero | Unit trace is 1 on identity tuple; zero trace function gives 0 on both sides, so it does not establish existence of a nonzero eigensheaf | Pass as explicitly conditional |
| GS.5.13 / 1687 | Conjectural; I=∅,W=1 | Contribution is A_σ^(S_σ), not automatically A_σ; if A_σ=0 contribution=0. Nontrivial stabilizer sign action can give invariants 0 in a one-dimensional space | No use as theorem; conjecture labelled |
| GS.6.1 / 1715 | Irreducible rank-one constant character | q has weight 2; twisting by q⁻¹ gives 1 of weight 0. At q=3,ℓ=5, scalar 2 is a 5-adic unit but not a unit at the non-p place 2 | Values pass; supplier S15 |
| GS.6.2 / 1727 | Finite determinant and translated r=1,2 | Bound (r−1)²/r is 0,1/2. Rank-one q slope 1 becomes 0 after twist; rank-two interval [−1/2,1/2] shifts to [1/2,3/2] | Pass |
| GS.6.3 / 1747 | C,E; rank 1 and reducible rank 2 candidate | Rank 1 has no smaller positive ranks. χ₁⊕χ₂ has matching pair factors against χ₁,χ₂, producing lower-rank poles inconsistent with the cuspidal correspondence comparison | Pass as rank-induction argument; AL.3 supplied |
| GS.7.1 / 1774 | Local good place; unit and trace | Unit trace=1; standard trace at A=5/2; norm-one torus still has spherical algebra E | Values pass; local construction order S10 |
| GS.7.2 / 1786 | Local char p; I=∅; r=n=0 | Empty legs give BG(O_nv), with automorphisms retained; zero iteration budget reads D₋₁=nv. One partial Frobenius changes r to r−1, not r | Pass; AH19/Ric16 hypotheses checked |
| GS.7.3 / 1815 | Coherent irreducible base; empty/2-leg product | Empty product Spec k has dimension 0, one generic point; smooth connected curve square has dimension 2, one generic point; crossing components have 2 generic points and are excluded | Pass |
| GS.7.4 / 1833 | Local transport; identity and iteration budgets | Identity composite Id∘Id=Id; m=2,d=−1 gives target 1≥0; m=0,d=−1 gives −1<0 and is rejected | Pass |
| GS.7.5 / 1849 | Torsion level algebra; f=0,1 and torus | f=0 gives 0; f=1 gives volume-one unit; δ₁δ₋₁=δ₀. Pro-p congruence indices are ℓ-units because ℓ≠p | Pass; S10 placement of local comparison |
| GS.7.6 / 1874 | Integral versus arbitrary local irreducible | Unit Frobenius has valuation 0 and compact powers; λ⁻¹ has powers of valuation −n and cannot extend to compact profinite image | Pass conditionally on centre gap |
| GS.7.7 / 1890 | Completed level algebra; decay control | f(n)=λⁿ for n≥0 has support {0,…,s−1} modulo λˢ but infinite integral support. GeL Proposition 8.1 separately supplies the specific geometric action on uncompleted compact cohomology | Pass; do not infer finite support from compatibility |
| GS.7.8 / 1904 | Local–global restriction; unit, Steinberg/trivial | Trivial parameter restricts to 1 at every place; Steinberg/trivial GL₂ share Weil eigenvalues but have monodromy ranks 1,0 | Pass; semisimple conclusion appropriately limited |
| GS.7.9 / 1918 | GL₂ Weil–Deligne comparison | N_Stein has rank 1, N_trivial rank 0, despite equal semisimple Weil part abs^(1/2)⊕abs^(−1/2) | Pass |
| GS.7.10 / 1930 | Rank-one gamma, q=2; zero rep | s=0: (1−1)/(1−1/2)=0; s=2: (1−1/4)/(1−2)=−3/4. ψ(ϖ·) multiplier at s=0 is √2; two copies give 2. Zero representation gives 1 | Pass; Del73 remains uncertified |
| GS.7.11 / 1954 | Ramified GL_r; rank 1,2 | Rank-one N=0; Steinberg rank-two N has rank 1 versus trivial rank 0; full WD comparison distinguishes them | Pass conditionally on local LLC gap |

The level convention itself is tested by empty N, one point and Spec(F₃[ε]/ε²), yielding level groups 1, F₃× and a six-element unit group. Geometric Frobenius and Tate twist are tested by E(1), whose eigenvalue is q⁻¹; arithmetic Frobenius would give q. For a degree-two place the corresponding value is q⁻², not q⁻¹. The Haar normalization is tested by convolution of the unit with itself: vol(K)=1 gives 1_K*1_K=1_K. The three finiteness conventions are distinguished by O, E with λ⁻¹-action, and O[t]: respectively one integral generator, no finite stable integral witness, and one Hecke-algebra generator but infinitely many O-generators.

### Supplier, ownership and dependency ledger

All 18 primary supplier rows were resolved against the supplied main copies or the indexed current heads. The following table records sections compared, not an assertion that each supplier's future implementation exists. Object searches used the roadmap index, main, Completed, the board packages and all 26 explicitly supplied sibling heads. No new declaration can collide with another fully qualified Lean name because this package declares none.

| Supplier | Sections and contract checked | Result and normalization witness |
|---|---|---|
| ReductiveGroups | Layers 0–1, 7–9 | Hopf functors, comodules, root data and pinnings; G_m has character lattice Z even though its Dynkin diagram is empty. |
| SchemeAndStackFoundations | 1.1, 1.15–1.21; 3.7; 4.1, 4.3–4.5, 4.14 | Descent, torsors, stack carriers, Picard gerbes and deformation/Quot inputs exist. Picard-stack mass at P¹/F₃ is 1/2 versus coarse mass 1. |
| EtaleCohomologyFoundations | F.0.1–F.0.3, F.1, F.2.1–F.2.7, F.8, F.10.1–F.10.5, G.1–G.3 | Scheme étale theory, compact support and traces; E(1) has geometric eigenvalue q⁻¹. |
| AlgebraicVectorBundles | L0A–L2B, especially L0C | Locally free quotients, exterior powers and determinant. Swapping two quotient basis vectors acts by −1, hence +1 in characteristic 2. |
| AlgebraicCurves | Layers 0–5 and 12 | Function-field/curve dictionary, divisors and Riemann–Roch; deg div(dt)=−2 on P¹. |
| JacobianChallenge | D and F | Relative Picard/Jacobian and Abel–Jacobi; Pic⁰(P¹) is one point. |
| AutomorphicLFunctionsAndLocalFactors | AL.3, all eleven named curve targets in the supplier row, and Curve additive analysis | Full level, all-place pair factors, finite central character and temperedness retained. HN and GL_r correspondence are imported. Adeles, differential characters and ray reciprocity are already supplied: S03. |
| EndoscopicTransferAndUnitaryTraceComparison | 3.1 CurveBundles, 3.2 LocalLoopGrassmannian | Reductive-over-X bundle carrier and fpqc loop quotient retained; extension to arbitrary smooth models needs S12. A dual-number unit is not erased. |
| EtaleDualityAndPerverseSheaves | 0.5, 1.3; 2.3–2.5, 2.8–2.10, 2.12; 5.3, 5.6; 6.1–6.3, 6.5 | Scheme duality, cycle classes, integral perversities, smallness and correspondences exist. O/λ derived-tensored with itself has Tor₁ in degree −1; perverse truncation matters. |
| ClassicalAdicEtaleCohomology | 5.4, OrientedEtaleProduct and OrientedNearbyCycles.modificationBaseChange | Coherent irreducible base, finite presentation and bounded invertible torsion match. A crossing of two components is excluded. |
| DeligneWeightsAndPurity | 0.12, 0.15; 7.8, 7.12, 7.15 | Base extension and twists match: weight(q⁻¹)=−2. Additional existing owners 1.10, 5.5 and 8.24 were missed: S03, S14, S15. |
| LanglandsParameterStacks | LP0.1, LP1.11; LP2e.9–LP2e.14; LP2c.1–LP2c.4 | Arbitrary-group pseudocharacters, prescribed projection, reconstruction, Weil continuity and excursion data exist. GL₂ Steinberg has rank(N)=1, unlike Weil-only data. |
| IntegralHeckeAndGaloisDeterminants | IHG.0 trace injectivity; IHG.1 semisimple reconstruction | Trace injectivity needs d! invertible; algebraically closed field determinant reconstruction does not. At d=2 in F₂ the former assumption fails. |
| ReductiveGroupsPartII | RG2.3.7, RG2.5.1–RG2.5.2 | Lang theorem includes smooth geometrically connected finite-type groups and Pic⁰; dual groups and L-group actions are supplied. |
| SmoothRepresentationsOfLocalGroups | SR.0.4, SR.1.3, SR.2.1–SR.2.2, SR.3.2, SR.4.1; gap destination SR.5.2 | Bernstein, induction and Satake contracts exist; GL₂ raw qX₁+X₂ differs from normalized √q(X₁+X₂). Two acknowledged additional contracts remain gaps. |
| LefschetzPencilsAndVanishingCycles | LPV.0 | Trait nearby/vanishing cycles supply the one-dimensional input; higher-dimensional modification is assigned to ClassicalAdicEtaleCohomology. |
| RelativeFarguesFontaine | 6.5 | Beauville–Laszlo module gluing includes finite projective modules and the regular-element/completion hypotheses. In R[[t]], t is regular even when R has square-zero elements. |
| AlgebraicModuliForArithmeticGeometry | 1.3; separate elliptic-sheaf gap | Coherent Grassmannians represent locally free quotients over arbitrary base; smoothness uses locally free source. Elliptic-sheaf chains and periodicity are explicitly additional. |

Additional boundary checks: ArithmeticGaloisRepresentations §§2.5–2.7 uses finite K/Q_p, so it is correctly not the equal-characteristic epsilon supplier. AdelicAlgebraicGroups AA.2.4/AA.3.1 does not already give the declared function-field SL_r quotient formula. GeometricSatakeAndFusion's perfected/mixed-characteristic carriers do not replace the arbitrary-base global equal-characteristic BD Grassmannian. HeckeStacksAndLocalShtukas' later local geometric realization is not used as a supplier. MotivesAndAlgebraicCycles §§6.1–6.2 supplies generic reconstruction: S04.

All 26 specified sibling heads were searched by objects: shtukas, bundle/Picard stacks, affine Grassmannians, Satake, Tannakian reconstruction, excursion operators, determinant normalization and local Langlands. Matches in GanGrossPrasadUnitaryGroups and SelmerIwasawaCohomologyPartII consume local Satake/parameters; Polylogarithms' real torus and K3SurfacesAndSymplecticBoundedness' Kuga–Satake exclusions are different objects. No additional competing owner in those folders was found. Board packages supplied no further owner. The omitted earlier owners are reported in S03, S04, S14 and S15.

All five gap slugs match between README and design, with named suppliers. The centre restriction, equal-characteristic GL_r correspondence, elliptic-sheaf carrier and SL_r volume are accepted conditionally. The arithmetic gap needs S03 and S08; its mere absence from a supplier is not a defect. For r=1 the SL volume formula is 1; for P¹/F₂ and r=2 it is 2⁻³/((1−1/4)(1−1/2))=1/3. Compatible completed corners alone do not eliminate the infinite λ-adically decaying support example in GS.7.7.

The prescribed movable dependency check was run without modifying the package or merge order. Its complete output was:

    depcheck: 27 roadmaps, 248 edges, 0 problem(s)

It returned exit status 0, with no UPWARD or CYCLE line. This checks roadmap order; it does not catch the intra-roadmap forward dependencies S02 and S10. No cyclic dependence was found in the explicitly named internal targets.

### Pinned-library ledger

Both manifest revisions equal the README pins. These 19 named Mathlib declarations were located and their assumptions read. Paths begin at the pinned library root.

| Names | Pinned file and line | Scope verified |
|---|---|---|
| AlgebraicGeometry.Scheme | Mathlib/AlgebraicGeometry/Scheme.lean:40 | Scheme carrier, not an algebraic stack |
| CategoryTheory.Pseudofunctor.DescentData; IsStack | Mathlib/CategoryTheory/Sites/Descent/DescentData.lean:59; Mathlib/CategoryTheory/Sites/Descent/IsStack.lean:49 | Effective descent; no atlas or representability |
| CategoryTheory.GaloisCategory | Mathlib/CategoryTheory/Galois/Basic.lean:412 | Abstract Galois-category axioms |
| ExteriorAlgebra | Mathlib/LinearAlgebra/ExteriorAlgebra/Basic.lean:60 | Exterior algebra on a module |
| LinearMap.charpoly; aeval_self_charpoly | Mathlib/LinearAlgebra/Charpoly/Basic.lean:44, 89 | Commutative base and finite free module |
| Submodule.FG; Module.Finite | Mathlib/RingTheory/Finiteness/Defs.lean:46, 121 | Finite generation over the specified semiring |
| Algebra.adjoin; isMulCommutative_adjoin | Mathlib/Algebra/Algebra/Subalgebra/Lattice.lean:32, 757 | Generated subalgebra and commuting-generator input |
| Module.End.genEigenspace | Mathlib/LinearAlgebra/Eigenspace/Basic.lean:71 | Kernel powers including extended-natural stabilization index |
| Module.End.iSup_maxGenEigenspace_eq_top | Mathlib/LinearAlgebra/Eigenspace/Triangularizable.lean:74 | Finite dimension and splitting/algebraic-closure hypotheses |
| Module.End.iSup_iInf_maxGenEigenspace_eq_top_of_iSup_maxGenEigenspace_eq_top_of_commute; independent_iInf_maxGenEigenspace_of_forall_mapsTo | Mathlib/LinearAlgebra/Eigenspace/Pi.lean:194, 90 | Commuting family for spanning; invariant-submodule and torsion-free/domain conditions for independence |
| FiniteDimensional.finiteDimensional_subalgebra | Mathlib/LinearAlgebra/FiniteDimensional/Basic.lean:634 | Finite-dimensional ambient algebra |
| CategoryTheory.Ind | Mathlib/CategoryTheory/Limits/Indization/Category.lean:70 | Ind-completion carrier |
| CategoryTheory.ObjectProperty.IsSerreClass; isoModSerre | Mathlib/CategoryTheory/Abelian/SerreClass/Basic.lean:45; Mathlib/CategoryTheory/Abelian/SerreClass/MorphismProperty.lean:65 | Serre class and kernel/cokernel morphism property for localization |

Two additional Tau Ceti declarations refute the omission explanation: TauCeti.FGPointRepresentationCat and TauCeti.fgPointRepresentationCategoryEquivalence in TauCeti/Algebra/AlgebraicGroup/Representation/Comodule/Equivalence.lean:216,231. The section has a commutative base ring and commutative Hopf algebra; finite generation over a field supplies finite-dimensional algebraic representations. It does not supply Satake's geometric category.

### Source locator ledger

The manifest has 28 unique work keys: 27 legally cached texts read and one settled uncertified work, Del73. The following 192 concrete locator checkpoints were located and compared with the target's statement or proof input. Repeated references count once here. T/P/L/C/D/R/N denote theorem, proposition, lemma, corollary, definition, remark and notation; C1.8 in VL denotes Construction 1.8. Matching a locator does not certify every proof step. Errors found in those passages are recorded below; OCR limits are recorded separately.

| Source | Checkpoints read |
|---|---|
| VL | D1.6 (VL line 2222); N1.7 (VL line 2231); C1.8 (VL line 2251); D1.12 (VL line 2363); L1.14 (VL line 2473); T1.17 (VL line 2574); R1.19 (VL line 2634); R1.20 (VL line 2698); R1.21 (VL line 2720); P2.6 (VL line 2813); P2.8 (VL line 2865); D2.14 (VL line 3213); L3.1 (VL line 3388); P3.3 (VL line 3403); P3.4 (VL line 3427); D4.1 (VL line 3499); D4.5 (VL line 3651); D4.7 (VL line 3664); P4.12 (VL line 3704); P4.14 (VL line 3756); L5.3 (VL line 3836); P6.2 (VL line 4004); P7.1 (VL line 5453); L8.11 (VL line 5925); L8.12 (VL line 5998); R8.18 (VL line 6104); D8.19 (VL line 6163); R8.21 (VL line 6267); N8.22 (VL line 6283); P8.23 (VL line 6295); P8.27 (VL line 6424); P8.31 (VL line 6672); P8.32 (VL line 6766); C8.34 (VL line 6963); D9.3 (VL line 7207); L9.4 (VL line 7208); P9.7 (VL line 7344); L10.1 (VL line 7407); L10.2 (VL line 7576); L10.4 (VL line 7631); L10.6 (VL line 7768); P10.8 (VL line 7804); P10.10 (VL line 7858); §11 reconstruction (VL line 8045); L11.9 (VL line 8071); T11.11 (VL line 8227); L12.1 (VL line 8260); §12.1 L-group (VL line 8299); R12.2 (VL line 8319); T12.3 (VL line 8387); T12.16 (VL line 8666); §13 integral theory (VL line 9096); P15.1 (VL line 9481); L16.2 (VL line 9528); L16.4 (VL line 9618) |
| LL | T I.13 (LL line 1667); correction remark (LL line 1710); T VI.9 (LL line 9090); P VI.11 (LL line 9140); P VII.4 (LL line 11350); C VII.5 (LL line 11409); T VII.6 (LL line 11421) |
| GeL | T0.1 (GeL line 50); R0.3 (GeL line 111); T1.1 (GeL line 193); P1.3 (GeL line 263); L1.4 (GeL line 278); P2.16 (GeL line 641); L2.17 (GeL line 684); L2.20 (GeL line 797); P3.2 (GeL line 901); R3.12 (GeL line 1178); L4.2 (GeL line 1193); L6.2 (GeL line 1422); R6.3 (GeL line 1468); §7.2 (GeL line 1538); §7.3 (GeL line 1555); P8.1 (GeL line 1593); §9 (GeL line 1604); T9.1 (GeL line 1637) |
| MV | L6.1 (MV line 805); P6.3 (MV line 872); T7.3 (MV line 996); P11.1 (MV line 1292); T12.1 (MV line 1370) |
| Ric | T5.1 (Ric line 925); P5.6 (Ric line 1044); C5.8 (Ric line 1051); C5.9 (Ric line 1055) |
| YZ | D3.1 (YZ line 1063); D3.2 (YZ line 1161); D3.3 (YZ line 1176); P3.4 (YZ line 1213); D3.5 (YZ line 1340); L3.7 (YZ line 1444); P3.14 (YZ line 1876); P3.15 (YZ line 1893); L3.16 (YZ line 1897); L3.17 (YZ line 1900); L3.19 (YZ line 1941); C3.20 (YZ line 1981); L3.21 (YZ line 1992); C3.22 (YZ line 2036); D3.23 (YZ line 2051); L3.24 (YZ line 2062); D3.25 (YZ line 2071); L3.26 (YZ line 2106); C3.27 (YZ line 2114); L3.28 (YZ line 2139); C3.29 (YZ line 2239); L3.30 (YZ line 2250); C3.31 (YZ line 2256); D3.32 (YZ line 2287); L3.33 (YZ line 2296); L3.34 (YZ line 2325); R3.35 (YZ line 2362); §3.5.4 (YZ line 2367); L3.36 (YZ line 2392); T3.41 (YZ line 2509); P5.17 (YZ line 4021) |
| Yu | T3.3.1 (Yu line 859); (3.3.5) (Yu line 893); (3.3.6) (Yu line 902) |
| Xue-I | T1.1.5 (Xue-I line 218); §2.3.8 (Xue-I line 736); D2.3.10 (Xue-I line 787); R2.3.11 (Xue-I line 796); D2.3.12 (Xue-I line 857); T3.2.1 (Xue-I line 942); P3.2.2 (Xue-I line 953); P3.2.7 (Xue-I line 987); P4.2.6 (Xue-I line 1304); P5.0.2 (Xue-I line 1588); T5.0.4 (Xue-I line 1630); C5.0.5 (Xue-I line 1635); P6.1.2 (Xue-I line 1723); P6.2.12 (Xue-I line 2058); P6.3.3 (Xue-I line 2231); P7.2.6 (Xue-I line 2583); P7.2.10 (Xue-I line 2616); R7.2.11 (Xue-I line 2619); §7.2.12 (Xue-I line 2625); P8.1.2 (Xue-I line 3345); L8.2.2 (Xue-I line 3356); L8.2.4 (Xue-I line 3362); P8.2.6 (Xue-I line 3392); Construction8.3.3 (Xue-I line 3460); L8.3.5 (Xue-I line 3487); P8.4.2 (Xue-I line 3515) |
| Xue-S | §1.2.9 (Xue-S line 440); L1.2.10 (Xue-S line 448); L1.2.11 (Xue-S line 450); P1.3.4 (Xue-S line 526); L1.3.11 (Xue-S line 572); T4.2.3 (Xue-S line 1966); L6.0.9 (Xue-S line 2116); P6.0.10 (Xue-S line 2123); T6.0.12 (Xue-S line 2131); P6.0.13 (Xue-S line 2137) |
| Var | L A.12 (Var line 1310); P A.13 (Var line 1324) |
| Hein | P1 (Hein line 158) |
| Schieder | T2.3.3 (Schieder line 433); §2.4.1 (Schieder line 465) |
| Chau | T4.1.2 (Chau line 806) |
| Sch | T4.1 (Sch line 1015); Appendix A (Sch line 3259) |
| Zhu | §0.1.4 determinant (Zhu line 126); §0.2 (Zhu line 162) |
| LY | L3.3 (LY line 406) |
| Feng | §5.2.3 (Feng line 1614) |
| Chin | P4.3 (Chin line 514); T4.6 (Chin line 559) |
| KZ | §5.3.1 (KZ line 2353) |
| Org | T1.1 (Org line 86); T6.1 (Org line 801) |
| LO-I | T2.3.3 (LO-I line 357); T5.5.6 (LO-I line 1619); T5.7.5 (LO-I line 2179) |
| LO-II | T7.5 (LO-II line 670); T7.7 (LO-II line 765); T11.4 (LO-II line 1041); T12.1 (LO-II line 1074) |
| LO-P | T4.2 (LO-P line 179); T5.1 (LO-P line 194); T8.2 (LO-P line 366) |
| Sun | T1.1 (Sun line 71); T4.2 (Sun line 1381) |
| EX24 | T A.4 (EX24 line 1564); T A.9 (EX24 line 1607) |
| Ric16 | T A (Ric16 line 47) |
| AH19 | T3.15 (AH19 line 798) |

Counts: 0 package Lean declarations; 93 numbered README targets with computation rows; 139 explicit Check bullets read and assessed, including the nondiscriminating ones in S07; 192 source checkpoints; 18 primary supplier rows resolved, plus the additional boundary/ownership checks above; all 26 specified sibling heads searched.

The head was confirmed as e5b7994. The read-only diff against origin/main contains seven files, all under packages/GlobalShtukasAndFunctionFieldLanglands, with 2,844 inserted lines. README and Suggested.lean contain no set_option, admitted data, algorithmic target, extra import, lemma declaration or pull-request number. No package file was edited during this pass except this report. No Lean command or build was run. There are no own declaration signatures for a #check probe, so binder loss, universe drift, duplicate own names and one-tactic padding have an empty inventory here. The module's false missing-carrier claim is nevertheless S05.

## Not verifiable

- Del73: the manifest's settled uncertified status is respected. The printed locators in GS.7.10 were retained; its source text was not requested or certified. The rank-one gamma and character-scaling calculations in the target ledger are independent checks.
- GeL: the OCR text substantially damages the diagrams in Proposition 3.2 and Lemmas 4.1–4.3. The proposition's domains, nonnegative iteration budgets and global comparison were read, but every arrow and displayed index in those diagrams was not certified. The relevant printed page for Proposition 8.1 was viewed independently, confirming that its specific action is on uncompleted compact cohomology; it is not merely a completion statement.
- FunctionFieldArithmetic: no eligible supplier text was available for FA.1–FA.6. The five explicit gap contracts were compared with design and earlier owners. Their future implementation is not certified and is not itself a finding.
- Conditional eigensheaf comparison GS.5.12 and conjectural Arthur description GS.5.13: the stated conditional/conjectural status was checked. The missing partial-Frobenius compatibility in VL Proposition 15.1 and the conjecture's existence claims were not treated as proved results.
- Downstream consumer descriptions do not certify future consumers' implementation. Ownership was checked against all 26 supplied open-head folders and the indexed owners discussed above; no unavailable consumer text was assumed as an input.

## Source issues

- **Misprint** in YZ at §3.5.4, printed page 38 (YZ line 2367): the source says the boundary perverse summand has a negative support-dimension shift and twist; it should be the positive shift and half-dimension twist obtained from Corollary 3.29; affects the proof.
- **Error** in YZ at §3.5.4, printed page 38 (YZ line 2367): the source says a fixed-degree rank-one shtuka map is a torsor under the entire Picard group; it should be a Pic⁰(k)-torsor, with all degree translates needed for the full Picard action; affects the proof.
- **Misprint** in YZ at §3.5.4, printed page 38 (YZ line 2367): the source says every translated summand uses the original degree-sequence projection; it should be the projection belonging to that translated summand; affects the proof.
- **Error** in YZ at Lemma 3.19(2), printed page 29 (YZ line 1945): the source says reconstruction by positive fractional twists works for every effective divisor supported on the flags; it should be restricted to reduced divisors, since a double flag rotation is an integral tensor twist; affects a stated result.
- **Misprint** in Feng at §5.2.3, printed page 36 (Feng line 1614): the source says the Frobenius–Weil kernel fixes the algebraic closure of F_q despite the curve being over F_ℓ; it should be the closure of the actual constant field F_ℓ; affects a stated result.
- **Error** in LL at the correction following Theorem I.13, printed pages 31–32 (LL line 1710): the source says the earlier book's trace formula omitted polynomial factors in its lower-rank exponential terms; it should be polynomial-times-exponential terms, cancelled only after comparison with cohomological traces; affects the proof; corrected in print at LL Theorem I.13 and the following correction.
- **Error** in Xue-I at the proof of Lemma 8.2.4, printed page 55 (Xue-I line 3362): the source says every maximal-ideal quotient A/mⁿ is finite torsion over O_E; it should be split into λ∈m and λ∉m cases, using rational geometric continuity in the latter; affects the proof.
- **Error** in Ric at Corollaries 5.8–5.9, printed page 22 (Ric line 1051): the source says conjugating the first coordinate by the cyclotomic cocharacter gives the semidirect-product comparison; it should be right multiplication by an inverse lift, with a half Tate character when required; affects the proof.
- **Error** in VL at §12.1, printed page 149 (VL line 8299): the source says the finite L-group quotient is determined by the action on the Dynkin diagram; it should be determined by the full based root datum, retaining torus Galois action; affects a stated result.
- **Error** in GeL at §9, printed page 43 (GeL line 1607): the source says the finite L-group quotient is determined by the Dynkin-diagram action; it should be determined by the full based root datum, including the central torus; affects a stated result.
- **Misprint** in LO-II at Theorem 7.7(1), printed page 23 (LO-II line 767): the source says duality's essential image belongs to the constructible category of an undefined A; it should be the constructible category of the original stack X; affects nothing.
- **Misprint** in LO-P at the proof of Theorem 5.1, printed page 7 (LO-P line 200): the source says the nonpositive truncation also belongs to perverse degrees at least one; it should be the other, positive truncation that belongs there; affects the proof.
- **Gap** in VL at Proposition 15.1, printed pages 173–174 (VL line 9491): the source says the trace morphisms commute with partial Frobenius but explicitly notes that this argument is unwritten; it should be supplied before asserting the eigensheaf comparison unconditionally; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "e5b799433e5bd3f16db5672bc12838e56f26fae2", "job": "RT-GlobalShtukasAndFunctionFieldLanglands~2a", "model": "gpt-6-astra", "worker": "chris-6"} -->
