<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/2165#issuecomment-6424355356 -->
Red team round 2 pass a (codex) of f46473a

Verdict: needs_changes

1. **F01** (P1) The correspondence definition forces every leg to be invertible

   **Location:** packages/AnalyticStacks/README.md:133, “send vertical edges into E and every square to a pullback square”.

   **Claim:** These functors describe all correspondence simplices.

   **Witness:** In Σ₁ put a=(0,1), b=(0,0). The square (a,b;b,b) sends both outgoing arrows to W→X and both remaining arrows to id_X. It is Cartesian only if W→X is invertible. HM line 1035 specifies coordinate rectangles instead.

   **Exact repair text:** “Send the edges (i,j)→(l,j) into E, and require F(i,j)→F(l,j), F(i,k)→F(l,k) to form a Cartesian square for every i≤l≤k≤j (HM Remark 2.2.5).”

   **Retest:** For the span ∗←{0,1}→∗ the required coordinate squares at n=1 are degenerate Cartesian squares; it is admitted. Its composite has four apex points, agreeing with the existing Check.

2. **F02** (P3) The repaired trivial-pairing Check confuses faithfulness with fullness

   **Location:** packages/AnalyticStacks/README.md:1078, “it sends the skyscrapers at 0 and at 1 to the same constant object ℤ, so FM_h is not faithful”.

   **Claim:** The constant-kernel transform on ℤ×ℤ is not faithful.

   **Witness:** This transform is M↦constant(⊕ₙMₙ). Each component map is recovered by inclusion and projection, so it is faithful. However Hom(δ₀,δ₁)=0 while Hom(FMδ₀,FMδ₁) contains id_ℤ. Pass a F18 is only partly repaired.

   **Exact repair text:** “For X=Y=ℤ^Betti, Hom(δ₀,δ₁)=0, whereas Hom(FM_hδ₀,FM_hδ₁) contains the nonzero identity of the constant object ℤ. Thus FM_h is not full and cannot be an equivalence.”

   **Retest:** The two Hom groups are 0 and a group containing ℤ. The constant formalism on C₂ still has FM_h=id and remains the positive control.

3. **F03** (P2) The integral-closure target still duplicates its supplier

   **Location:** packages/AnalyticStacks/README.md:601, “what is proved here is the integral-closure step”.

   **Claim:** The equality (R,S)_■=(R,R⁺[S])_■ needs a second owner here.

   **Witness:** TauCetiRoadmap/SolidAnalyticRings/README.md:751 explicitly tells its proof to replace generators “including integral closure”, citing the same RCSolid Lemma 5.5.5. Its polynomial-pair target at line 749 already requires that integral closure.

   **Exact repair text:** “Import generator and integral-closure independence from SolidAnalyticRings §7.3 through 2.6; in particular, for every discrete animated R and S⊆π₀R, (R,S)_■=(R,R⁺[S])_■.” Remove integral closure from this roadmap's ownership claims.

   **Retest:** For R=𝔽₂[ε]/ε² and S={ε}, the supplier's finite inverse 1+εσ* makes the test automatic. The same complete category and reflector are transported by 2.6; no second proof is required. Pass a F32 is partly repaired: the repair's distinction between an API law and an explicit supplier proof obligation does not remove duplicate ownership.

4. **F04** (P2) Colimits of affinoid stacks have the wrong variance

   **Location:** packages/AnalyticStacks/README.md:749, “colimits and base change in C₀ are computed on underlying algebras”.

   **Claim:** Colimits in the chosen category of affine spectra are computed as colimits of their algebras.

   **Witness:** In the section's own finite-product example, the coproduct of two AnSpec ℚ_(p,■) has algebra ℚ_p×ℚ_p. The coproduct of the two algebras over ℚ_p is ℚ_p⊗ℚ_p ℚ_p=ℚ_p, giving one point instead of two.

   **Exact repair text:** “Colimits of animated solid ℚ_p-algebras with induced structure are computed on underlying solid algebras. Their opposite category computes finite limits of affinoids by finite colimits of algebras, and finite coproducts by finite products. Restrict these assertions to diagrams whose results belong to the chosen C₀.”

   **Retest:** The two-point coproduct has algebra ℚ_p×ℚ_p; the fibre product of two base points has algebra ℚ_p⊗ℚ_p ℚ_p=ℚ_p. Finite closure of C₀ no longer asserts closure under arbitrary colimits.

5. **F05** (P2) The tempered group and its Hopf structure are not defined

   **Location:** packages/AnalyticStacks/README.md:1141, “D([AnSpec A/ℤ^temp])”.

   **Claim:** The displayed quotient is an already specified analytic stack.

   **Witness:** The README defines only the underlying sequence algebra, with neither its solid realization nor the group ℤ^temp or its coproduct. RJRC line 2030 defines the analytic spectrum, and RJRC line 2042 supplies the group structure.

   **Exact repair text:** “Give ℓ^temp_(ℤ,K) the solid realization O(𝔾_m^an)^∨ of RJRC Definition 4.4.1, and define ℤ^temp=AnSpec(ℓ^temp_(ℤ,K)) with induced K_■-structure. Construct its Hopf maps Δ(a)_(i,j)=a_(i+j), ε(a)=a₀ and S(a)_i=a_(-i), as in RJRC Lemma 4.4.3. Both quotients in this target use the trivial action on AnSpec A.”

   **Retest and Checks to add:** For e₀, Δ(e₀)_(1,−1)=1 whereas (e₀⊗e₀)_(1,−1)=0; ε(e₀)=1 and ε(e₁)=0; S(e₁)=e_(-1). For the constant sequence 1, Δ1=1⊗1. These determine the additive group convention and distinguish it from the pointwise multiplicative monoid.

6. **F06** (P2) The Poincaré sequence does not name its differential

   **Location:** packages/AnalyticStacks/README.md:1109, “the Poincaré sequence 0 → R → R⟨T⟩^DP_≤r → R⟨T⟩^DP_≤r → 0”.

   **Claim:** This is a specific exact sequence of comodules.

   **Witness:** No arrow is specified. RC26a line 1844 uses the divided-power derivative. The zero endomorphism has the same displayed type but has kernel the whole algebra and nonzero cokernel.

   **Exact repair text:** “The first map is inclusion of constants; the second is ∂_T(T^[n])=T^[n−1] for n≥1 and ∂_T(1)=0, where T^[n]=Tⁿ/n!.”

   **Retest and Checks to add:** ∂_T(T)=1 and ∂_T(T^[2])=T, including over residue characteristic 2; its kernel is R. Its continuous right inverse is T^[n]↦T^[n+1], which preserves overconvergence for each r>0. Thus cokernel=0. Pass a F19's radius repair is sound, but its suggested arrow specification was omitted.

7. **F07** (P3) Several negative Checks still fail for zero inputs

   **Locations:** packages/AnalyticStacks/README.md:216, “misses the identity matrix”; :230, “constant ... is not sheafy”; :523, “perfect A▷-modules ... not closed”; :567, “R[T] is not an idempotent R-algebra”; :471, “N itself ... is not in the heart”.

   **Claim:** These exclusions are unconditional.

   **Witness:** With Λ=0 the matrix is 0 and the constant formalism is terminal, hence sheafy. With A▷=R=0, perfect modules={0} and R[T]=R[T,T′]=0. With N=0 both shifts are static.

   **Exact repair text:** Add “for Λ≠0” to the two constant-coefficient negative tests, “for a nonzero discrete ring A▷” to the perfect-module test, “for R≠0” to the polynomial test, and “for nonzero static N” to the shearing exclusion. Add: “For zero inputs these exclusions disappear: the constant formalism is sheafy, the zero perfect category is closed under sums, the zero polynomial algebra is idempotent, and the zero sheared object is in the heart.”

   **Retest:** At zero every displayed functor or module is 0 (the terminal category for D(0)); for ℤ, R=ℤ and N=ℚ the original negative witnesses remain valid.

8. **F08** (P3) Ring stacks and transmutation have no definition Checks

   **Location:** packages/AnalyticStacks/README.md:1126, “define the transmutation P(Aff) → AnStk_(/S)”.

   **Claim:** The new ring-stack and transmutation definitions have discriminating Checks.

   **Witness:** All four bullets at lines 1134–1137 concern rank, covers or vector duality. None evaluates the ring operations or transmutation on a test ring. In particular they would not detect replacing R(B) by its reduction before evaluating F.

   **Exact repair text:** Add: “For R=𝔾_a and a static test ring B, the transmutation of 𝔸¹ has points B; addition and multiplication are those of B, giving 1+1=0 and 1·1=1 over 𝔽₂. The transmutation of 𝔾_m has points B×: over 𝔽₂[ε]/ε² these are {1,1+ε}, rather than all four elements. The transmutation of Spec ℤ[T]/T² has points {b∈B:b²=0}: {0,ε} over 𝔽₂[ε]/ε² and {0} over 𝔽₂.” Cite RC26a Construction 3.2.35.

   **Retest:** The three computed sets have respectively 4, 2 and 2 elements for the dual numbers; reducing first would give 2, 1 and 1. The operations and functor now have distinct positive and negative controls.

9. **F09** (P3) The new instances have no declaration docstrings

   **Location:** packages/AnalyticStacks/Suggested.lean:124 and :126, “instance : CoeSort” and “instance : Category”.

   **Claim:** Every declaration has a mathematical docstring.

   **Witness:** Both instances begin immediately after the preceding command; neither has a `/-- … -/` comment. They were added in the repair of pass a F13.

   **Exact repair text:** Prepend, respectively, `/-- A bundled spectral space is viewed as its underlying type. -/` and `/-- Spectral spaces form a category with spectral maps and their usual composition. -/`.

   **Retest:** The instances still use the same carrier and SpectralMap identity/composition; no new theorem, padding or elaboration is required.

10. **F10** (P1) Properness alone does not preserve pseudocoherence

   **Location:** packages/AnalyticStacks/README.md:717, “for a proper map f: X → Y of derived schemes, f_* takes pseudocoherent objects ... to pseudocoherent objects”.

   **Claim:** This finiteness theorem applies to arbitrary proper maps after the paragraph expands to general discrete adic spaces.

   **Witness:** Let A=𝔽₂[x₁,x₂,…], I=(x₁,x₂,…), and f:Spec(A/I)→Spec A. The closed immersion is proper. O_X is perfect, but f_*O_X=A/I is not finitely presented, hence not pseudocoherent (TauCetiRoadmap/SchemeAndStackFoundations/README.md:656).

   **Exact repair text:** “In the derived-scheme application of this paragraph, X and Y are almost of finite type over ℤ, as in SixFF Theorem 9.7. For a proper map between such schemes, pushforward preserves pseudocoherent and coherent complexes, and preserves perfect complexes when f has finite Tor-dimension.” Retain general analytic stacks and discrete adic spaces; this qualification belongs to the finiteness assertion, not to those constructions. Cite SixFF line 3208 together with Theorem 9.18.

   **Retest:** The infinite-variable example is excluded by the stated finiteness hypothesis. For A=𝔽₂[x₁,…,x_n] and I=(x₁,…,x_n), f_*O_X has its length-n finite Koszul resolution, including n=0. A version over arbitrary bases needs a separately stated general finiteness theorem with a pseudo-coherence hypothesis on f; the cited passage does not justify dropping it.

11. **F11** (P1) Finite Tor-dimension alone does not give suaveness

   **Location:** packages/AnalyticStacks/README.md:979, “a map of derived schemes of finite Tor-dimension is suave for the solid formalism”.

   **Claim:** Every flat map of derived schemes is suave, without a presentation hypothesis.

   **Witness:** Set k=𝔽₂ and K=overline(𝔽₂), discrete. K/k is flat, of Tor-dimension 0. Its solid structure is induced since K/k is integral. K is an infinite direct sum of k, hence nondualizable; 0.9's affine criterion excludes suaveness.

   **Exact repair text:** “For a map in the solid derived-scheme formalism of 3.4, with source and target almost of finite type over ℤ, finite Tor-dimension implies suaveness. For an lci map in this setting, the dualizing complex is det(L)[χ(L)].” Cite the ambient hypothesis at SixFF Theorem 9.7 as well as Theorem 9.17. Do not apply the finite-Tor implication to arbitrary schemes or arbitrary analytic-ring maps.

   **Retest:** K/k is excluded; the finite subextension 𝔽₄/𝔽₂ has dualizable underlying module k², is finite étale, and has ω=K in degree 0. Regular quotients retain the computed shift −c. Generalization beyond the cited setting must state the presentation/perfectness hypotheses it uses.

12. **F12** (P3) The empty-family Check drops subcanonicity

   **Location:** packages/AnalyticStacks/README.md:334, “The empty family covers X iff D(X) = 0.”

   **Claim:** Vanishing of the coefficient category alone makes the empty family a cover for the !-topology defined in this section.

   **Witness:** Take C=finite sets, E=all, and the constant zero formalism. It is presentable and Künneth. At X={∗}, D(X)=0 but ∅→X is not a subcanonical covering family: the representable with two points fails descent.

   **Exact repair text:** “The empty family satisfies !-descent at X iff D(X)=0. It is a cover in the !-topology only when it is also subcanonical. For the constant zero formalism on finite sets, it has !-descent at a point but is not a cover.”

   **Retest:** The empty Čech limit of coefficient categories is 0, agreeing with D({∗}); descent for the representable two-point set would require a two-element set to equal a singleton, which fails. At X=∅ both requirements hold.

13. **F13** (P3) The periodic-category Check rules out degenerate hearts incorrectly

   **Location:** packages/AnalyticStacks/README.md:474, “V has no nondegenerate t-structure, so there is no V♡ and no Beilinson heart”.

   **Claim:** Periodicity prevents any t-structure and any heart usable in the preceding statement.

   **Witness:** On V=Mod_(ℚ[u,u⁻¹]), take V_(≥0)=V and V_(≤0)=0. This accessible t-structure preserves filtered colimits, its connective part contains the unit and is tensor-closed, and its heart is 0. It meets the stated hypotheses.

   **Exact repair text:** “For V=Mod_(ℚ[u,u⁻¹]) there is no nondegenerate t-structure. A chosen degenerate t-structure can have zero heart; periodicity does not supply a nondegenerate Beilinson heart. For V=D(A), A a ℚ-algebra, use its standard t-structure.”

   **Retest:** For the displayed degenerate structure, both V♡ and the category of complexes in V♡ are zero. For D(ℚ), the standard heart is ℚ-vector spaces and the two-term identity complex remains nonzero in the Beilinson heart.

## Earlier findings: verification at this head

The identifiers below refer to the previous reports, not to new findings. All 38 earlier findings were compared with the repaired files. Quotations are from the current package; the last column recomputes the witness. No earlier finding was marked “not actionable in this package” by the repair report. Three repairs remain partial (a-F18, a-F19, a-F32); the radius in a-F19 is corrected, but its requested differential is still absent. The new instance documentation defect is separately recorded above.

| Earlier finding | Current repaired passage and location | Verdict | Witness at this head |
|---|---|---|---|
| a-F01 | packages/AnalyticStacks/README.md:373, “when M is perfect” and “when B is a perfect A-module” | repaired | B=ℤ[T] is not perfect over ℤ, so the exceptional comparison is no longer claimed; B=ℤ[T]/T² is ℤ² and dualization commutes with the comparison. |
| a-F02 | packages/AnalyticStacks/README.md:414, “is not D-suave” | repaired | For 𝔸¹/ℤ the underlying ℤ-module ℤ[T] is nondualizable in the algebraic formalism; for ℙ¹, ω=O(−2)[1], rather than O. |
| a-F03 | packages/AnalyticStacks/README.md:541, “surjective with nilpotent kernel” | repaired | ℤ→ℚ has kernel 0 but is not surjective and is excluded; R[ε]/ε²→R passes. |
| a-F04 | packages/AnalyticStacks/README.md:462, “equipped with an accessible t-structure compatible with filtered colimits” | repaired | The heart condition now has a specified t-structure. Periodic ℚ[u,u⁻¹] cannot be silently treated as D(ℚ) with its usual connective structure; its new negative Check needs S13. |
| a-F05 | packages/AnalyticStacks/README.md:279, “pushforward π₂_*” | repaired | A 2×2 matrix goes to its two column sums; π₂* goes in the opposite direction and duplicates rows. |
| a-F06 | packages/AnalyticStacks/README.md:420, “exterior algebra on Bⁿ[1]” | repaired | For n=2 the homotopy ranks are 1,2,1 and total rank 4, not 2; n=0 gives B. |
| a-F07 | packages/AnalyticStacks/README.md:632, “surjective on π₀ with nilpotent kernel and induced structure” | repaired | The nilpotent quotient has the same rational lattice; ℤ[T]→ℤ[T,T⁻¹] has zero kernel but is excluded. |
| a-F08 | packages/AnalyticStacks/README.md:903, “n ≥ 1 and m ≥ 1” | repaired | At m=0 the power is A with π₀A, recorded separately; at n=2,m=1 both bounds equal 2. |
| a-F09 | packages/AnalyticStacks/README.md:979, “d = χ(L_(X/Y))” and “det(L_(X/Y))[d]” | repaired for the shift | The line gives degree +1; the regular quotient gives degree −1. The unrelated missing scheme-domain hypothesis is S11. |
| a-F10 | packages/AnalyticStacks/README.md:1052, “colimit diagrams of commutative monoids” | repaired | The old fiber sequence 0→0→ℤ is not a cofiber sequence and is now excluded: its cofiber would be 0, whereas the dual of ℤ is G_m≠0. |
| a-F11 | packages/AnalyticStacks/README.md:141, “its final object ∗ is also final in C_E” | repaired | For finite sets and injective admissible maps, 2→1 is not admissible; the strong monoidal claim is excluded. |
| a-F12 | packages/AnalyticStacks/README.md:721, “EtaleCohomologyFoundations §§G.1–G.3” | repaired | G.2 states Nagata over qcqs bases, and G.3 common refinements; 𝔸¹→ℙ¹→Spec ℤ is admitted. |
| a-F13 | packages/AnalyticStacks/Suggested.lean:138, “theorem spectralStoneDuality” | repaired | Spectral spaces with 0,1,2 discrete points have compact-open lattices of size 1,2,4. Both native categories are present; S09 concerns only two missing docstrings. |
| a-F14 | packages/AnalyticStacks/README.md:844, “E5:presentability.4 (`dualizable_filteredColimit`” | repaired | The named theorem exists at supplier packages/AnalyticStacks/README.md:1758. Extension of scalars has restriction as right adjoint, and restriction preserves colimits. |
| a-F15 | packages/AnalyticStacks/README.md:143, “lax symmetric monoidal” | repaired | A functor selecting the two-point set sends the unit to 2 rather than 1; its unit comparison is a span, not an equivalence. |
| a-F16 | packages/AnalyticStacks/README.md:761, “Fun_(D(A▷(∗)))” | repaired | For A=𝔽_p the relative self-tensor is 𝔽_p; tensoring over ℤ instead gives π₁=𝔽_p. |
| a-F17 | packages/AnalyticStacks/README.md:903, “k-connective fibre with k > 0” | repaired | For 𝔽_p→𝔽_p[T], k=−1, the reconstructed π₀ is 𝔽_p[T^p]; the example is outside the repaired range. |
| a-F18 | packages/AnalyticStacks/README.md:1078, “need not induce a duality” but “not faithful” | partly repaired | Constant C₂ formalism now supplies the positive case. The ℤ example fails fullness, not faithfulness: S02. |
| a-F19 | packages/AnalyticStacks/README.md:1109, “r > 0” | partly repaired | ‖e₁‖_r=r>0; r=0 would assign a nonzero vector norm 0. The unspecified differential remains S06. |
| a-F20 | packages/AnalyticStacks/README.md:1128, “coproduct over n ≥ 0” | repaired | Rank-one atlas has empty pullbacks to ranks 0 and 2; the all-rank union supplies both. |
| a-F21 | packages/AnalyticStacks/README.md:464, “η² = 0” | repaired | Two successive identity differentials have composite 1 and are excluded; a two-term complex has next differential 0, so d²=0. |
| a-F22 | packages/AnalyticStacks/README.md:607, “the first space is R and the second R ×_(π₀R) R⁺” | repaired | T↦1/2 into (ℚ,ℤ) belongs only to the first mapping space; T↦1 belongs to both. |
| a-F23 | packages/AnalyticStacks/README.md:267, “for a nonzero ring Λ” | repaired | At Λ=0 the infinite sum is 0 and dualizable. Other zero-input Checks have the same unrepaired pattern: S07. |
| a-F24 | packages/AnalyticStacks/README.md:108, “0.3 ... built before ... 0.2”; packages/AnalyticStacks/README.md:763 uses 1.1,1.2,2.2 | repaired | 0.3 no longer needs Corr; 3.7 no longer needs 3.8; 3.8 consumes 3.7. No directed cycle remains. |
| a-F25 | packages/AnalyticStacks/README.md:36, “any compact open subgroup K” | repaired | ∏_ℓℤ_ℓ has no open pro-p subgroup, but δ=1; GL₂'s upper Borel gives p⁻¹ with the supplier's convention. |
| a-F26 | packages/AnalyticStacks/README.md:1058, “n ≥ 1” | repaired | For n=1,2, R[T]/(Tⁿ−1) has ranks 1,2; n=0 gives R[T,T⁻¹], not finite locally free. |
| a-F27 | packages/AnalyticStacks/README.md:133, “i ≤ k and l ≤ j” | repaired for order | Σ₁ is the span apex with arrows to both endpoints. The additional “every square” error is S01. |
| a-F28 | packages/AnalyticStacks/README.md:420, “j_* ... derived I-complete”; “j_! ... I-power torsion” | repaired | For (ℤ,(p)), j_*1=ℤ_p while j_!1=(ℚ_p/ℤ_p)[−1]; their essential images differ. |
| a-F29 | packages/AnalyticStacks/README.md:828, “these are not targets here” | repaired | Nuclear 0 and the unit, closure and basic nuclearity now come from RefinedTraceMethods §4.3; the Hom-criterion bridge remains a declared gap. |
| a-F30 | packages/AnalyticStacks/README.md:682, “(ℚ_p/ℤ_p)[−1]” | repaired | The quotient generators satisfy pe₀=0, pe_(n+1)=e_n; assigning e_n↦p^(−n−1) mod ℤ_p respects both. A degree-zero ℤ_p dual would not. |
| a-F31 | packages/AnalyticStacks/README.md:349, “K(ℚ, 2)” | repaired | D_! of the space is Mod_(𝔽_p); the point-pulled diagonal gives Mod_(𝔽_p[ℚ]), whose regular representation is nontrivial. |
| a-F32 | packages/AnalyticStacks/README.md:601, “generator independence is imported” but “proved here ... integral-closure step” | partly repaired | The supplier's same Lemma 5.5.5 proof obligation includes integral closure: S03. |
| a-F33 | packages/AnalyticStacks/README.md:1118–1120, “sup_n |a_n|rⁿ” with coefficient tests | repaired | e₀ has norm 1; e₁ has norm r; for |π|=1/2, a_n=πⁿ gives (r/2)ⁿ; a_n=π^⌈√n⌉ decays at r=1 but at no r>1. |
| b-F01 | packages/AnalyticStacks/README.md:541, “surjective with nilpotent kernel” | repaired | Same counterexample and corrected range as a-F03. |
| b-F02 | packages/AnalyticStacks/README.md:632, “surjective on π₀” | repaired | Same localization exclusion as a-F07. |
| b-F03 | packages/AnalyticStacks/README.md:682, “(ℚ_p/ℤ_p)[−1]” | repaired | Same degree −1 quotient and generator relations as a-F30. |
| b-F04 | packages/AnalyticStacks/README.md:384, “when π_*(A) is countable, with no hypothesis on B” | repaired | Mat16 Proposition 3.31 is separated from RCSolid Lemma 6.4.3's countably presented relative algebra criterion and index bound. No countability of B is inserted into Mat16. |
| b-F05 | packages/AnalyticStacks/README.md:1165, “hypercover-inversion” | repaired as an identifier | This matches the downstream identifier in its available third design review. The consumer's actual current plan is absent from this checkout; its contract's acceptance is not independently certified here. |

## Sampled adversarial computations

All seven named signatures were compared with the supplied elaborated-type artifact. There is one universe parameter u, no standing `variable` block, and no hidden section hypotheses to retain. Four real definitions support 0.3; a real structure and two supporting instances support 2.10. The two admitted headline theorems are sampled below. Generated structure projections are not counted as separately authored declarations.

The full pass covered all 60 numbered target sections and 209 Check bullets. The table retains sampled computations across the layers; every finding above retains its refuting witness and repair retest. Hypotheses including induced structures, smallness, compactness, truncation, Künneth and the declared nuclear gap remain in force. A retained result means these computations found no additional counterexample, not that a future ∞-categorical proof was formalized.

| Statement / section / context | Instances tried; computed values | Result / change |
|---|---|---|
| `restrictedDiagonalMap_isEquivalence_hoFunctor`; 0.3(1); ∀ X Q, [Q.Quasicategory] | For Q=terminal both homotopy categories have one object and one arrow. For X=empty, both mapping simplicial sets are terminal for every Q. The nondegenerate statement is SixFF Theorem 4.8 / LZ12b Theorem 4.27, not those controls. | Quasicategory hypothesis and universal Q occur explicitly. Precomposition has the contravariant direction. Deep headline; no one-tactic/pinned-lemma proof found. |
| `spectralStoneDuality`; 2.10; u only, ∃ equivalence e then ∀ X | Opens: ∅↦1-element lattice, ∗↦2, discrete pair↦4, Sierpiński↦3-chain. A map ∗→2 pulls an open back to ∅ or ∗, reversing lattice direction. M₃ cannot occur: distributivity fails. | Both categories use u; opposite is on lattices. No missing Hausdorff assumption: Sierpiński must be included. Deep headline, no padding. |
| Conventions: determinant, grading, modulus and exponential | For a rank-two bundle, det has rank 1; det(V[1])=(det V)∨ and χ(V[1])=−2. t has weight −1; t⁻¹ℤ[−1] has weight +1. Borel conjugation multiplies the unipotent lattice index by 1/p, not p. exp(XT) has second coefficient T^[2]; δ₀↦1, δ₁↦1+T. | The same values recur in 1.6, 4.2, 6.3–6.6 and 7.5. |
| 0.2 correspondence category, tensor and self-duality | Σ₀=point, Σ₁=three-object span. The all-squares rule rejects ∗←2→∗ since 2×_∗2 has 4 rather than 2 points. Coordinate squares admit it. Composite ∗←2→∗ twice has apex 4; identity apex 1 preserves it. Product of a one- and two-point object has 2 points. Selecting 2 as the image of the source unit is lax, not strong. Finite injections fail the extra final-object hypothesis. | S01; repaired order and monoidal hypotheses are retained. |
| 0.12 Künneth equivalences, finite subfamilies and !-topology | ℤ[1/p]∩ℤ_p=ℤ inside ℚ_p and ℤ[1/p]+ℤ_p=ℚ_p, giving the fracture square. ℤ→ℤ[1/p] kills 𝔽_p. Empty coefficient descent compares D(X) with 0. In constant zero coefficients on finite sets, this is 0=0 at a point but two-point representables have 2≠1 sections across the empty family. | S12 distinguishes descent from a subcanonical cover. |
| 1.4 formal completions, self-intersections and two embeddings | Open locus completion is that open. At I=(p), completion of ℤ_p is ℤ_p, of ℚ_p is 0; torsion image of ℤ_p is (ℚ_p/ℤ_p)[−1]. At a two-coordinate origin π_*=ℤ,ℤ²,ℤ in degrees 0,1,2. At I=(0), completion is the whole scheme; at I=(1), it is empty. Formal-line ω has degree +1, zero-section ω degree −1. | Repaired n-generators and j_*/j_! formulas retained. |
| 1.5 affine group classifying stacks and comodules | Trivial G gives D(A). G_m coaction on a weight-n vector is m↦m⊗Tⁿ. For G_a/𝔽_p, a comodule retraction φ of the unit would have φ(1)=1, while the primitive T relation forces φ(1)=0. Countable flat cover still descends. For S₃ or Q₈ constant finite groups, comodules retain the full group action, not its abelianization. | Retract criterion is sufficient, not silently necessary; flat atlas hypotheses retained. |
| 1.7 formal line, exterior coalgebra, shearing and heart | Self-intersection has π₀=π₁=ℤ, π₂=0. Weight one ℚ[−1] shears to static ℚ; weight one ℚ shears to ℚ[1]. Two-term id differential has d²=0; three consecutive ℚ's with two identity arrows give d²=1. Opposite direction requires Ext²_ℚ=0. Periodic modules do not supply a nondegenerate heart; integral complete-filtered description still applies over 𝔽₂. | Square-zero repair sound; zero static N defeats one negative Check, S07; the periodic-heart exclusion needs S13. |
| 2.8 discrete Huber pairs, integral closure, maps and descent | T↦1/2 into (ℚ,ℤ) is allowed from (ℤ[T],ℤ), forbidden from (ℤ[T],ℤ[T]); T↦0 is allowed from both. For ε²=0 over 𝔽₂, (εT)²=0, hence εT is integral over 𝔽₂. Finite inverse of 1−εσ* is 1+εσ*. Nilpotent quotients distinguish compactness from projectivity. | Mathematical tests retained, but integral-closure proof has an existing owner: S03. |
| 3.4 schemes, discrete adic spaces, finiteness and localization | Affine line: f_!O has π₋₁=T⁻¹ℤ[[T⁻¹]], whereas f_*O has π₀=ℤ[T]. Proper schemes over ℤ/p^s have the usual finite coherent cohomology. (A,ℤ)_■ equals A_■ for integral A=𝔽₂,ℤ[i],ℤ[ε]/ε² but differs for A=ℤ[T], witnessed by Laurent series. At I=0 the completion term is id and open complement 0; at I=1 these interchange. Infinite-variable closed immersion pushes a perfect unit to a non-finitely-presented module. | S10; localization directions and coefficient comparison are sound on their stated domain. |
| 3.6 induced ℚ_p stacks | Finite products give n-point stacks and D^n. Two-point coproduct has algebra ℚ_p², whereas algebra coproduct of two copies of ℚ_p is ℚ_p. ℚ_p⟨T⟩ imposes T-solidity and is not induced. Locally constant functions on ℕ∪{∞} exclude pⁿ, although continuous functions include it. | S04; induced-site versus solid-Tate-site distinction retained. |
| 4.2 classifying groups, fine maps and duality | For Borel diag(p,1), K conjugates to unipotent lattice pℤ_p, hence δ=1/p. Finite C₂,S₃,Q₈ over ℚ have averaging idempotents (1/|G|)Σg and degree-zero invariants; C₂ over 𝔽₂ and S₃ over 𝔽₃ have infinite cohomological dimension. ℤ_p over 𝔽_p gives ω=𝔽_p[1]. A countably generated infinite free pro-p group has cd=1 but infinite H¹, so not Poincaré. | Order inversion, second countability and Poincaré hypotheses are not interchangeable. |
| 5.2 cotangent base change, colimits, transitivity and connectivity | Base-changing ℤ[T] to 𝔽₂[T] carries dT to dT. ℤ[T]→ℤ→ℤ gives the conormal shift [1]. Both solidification and complementary idempotent localization have L=0. Sym⁰(ℤ[2])=ℤ, m=1 returns ℤ[2], Sym²(ℚ[2])=ℚ[4]. The characteristic-p derivative kernel is 𝔽_p[T^p], so negative-degree connectivity cannot be silently admitted. Identity map has zero fibre in every degree. | Repaired m≥1,n≥1,k>0 hypotheses and induced-structure qualification retained. π₀ equivalence here is of analytic rings, not just underlying abstract rings. |
| 6.3 regular immersions, finite Tor and lci duality | Origin of 𝔸^c has RHom=ℤ[−c], c=0,1,2. ℤ→𝔽_p gives degree −1. Nonregular (x²,xy) quotient has nonzero Ext¹ and Ext², not an invertible single-degree dual. Polynomial line has det L[χ]=O[1]. Infinite algebraic extension over 𝔽₂ is flat but underlying infinite free solid module is nondualizable. | Shift repair retained; missing domain restriction is S11. |
| 6.4 solid line and cohomological smoothness | ω_line=ℤ[T][1] and ω_section=ℤ[−1], whose composite tensor is ℤ[0]. f_!f^!1=T⁻¹ℤ[[T⁻¹]]; trace(T⁻¹)=1, trace(T⁻²)=0. Constant-coefficient extraction would give 0 on both, so is not the counit. Étale inversion of T has ω=1[0]. | Normalization witnessed, including opposite regular-immersion sign. |
| 6.6 solid Serre duality and coherent comparison | Rank 0: ω=O. Rank 1: det L[1]=L[1]. Rank 2: ω=O[2], whereas L[2]=O²[2] is not invertible. For ℙ¹/ℤ, H⁰(O)=ℤ pairs with H¹(O(−2))=ℤ; O[1] would give H¹(O)=0. ℙ¹ over ℤ[x₁,x₂,…] retains the solid formula; the cited bounded-below Noetherian f^! theorem does not cover that base. | Distinguishes general solid theorem from supplier's restricted coherent comparison. |
| 7.2 categorical Cartier duality, Fourier kernel and base change | Trivial monoids give identity. Constant C₂ formalism also gives identity for trivial pairing. For ℤ^Betti trivial pairing, Hom(δ₀,δ₁)=0 but the transformed Hom contains id_ℤ; component maps are recoverable by inclusions/projections, so faithfulness survives. For finite locally free groups, O(G)^∨=O(G^D) including μ₂/𝔽₂. | S02; no prime-to-order restriction may be added to finite flat Cartier duality. |
| 7.5 formal, divided-power, overconvergent and locally analytic additive dualities | X²-dual↦T^[2], not T²/2 inside ℤ[T]. ‖e₀‖=1,‖e₁‖=r. For a_n=πⁿ, |π|=1/2, weighted term=(r/2)ⁿ; r=2 fails, r<2 passes. π^⌈√n⌉ passes radius 1 but no larger radius. At p=2 radius factor=1/2; at p=3 it is 3^(−1/2). δ₀↦1,δ₁↦1+X. The needed derivative sends T^[2]↦T and T↦1 in all characteristics. | S06; radius and sequence repairs supply discriminating boundary tests. |
| 7.6 ring stacks, transmutation, bundles and gerbes | Rank 0 gives identity; rank-one atlas misses ranks 0 and 2; union of frame atlases meets both. Rank-one duality recovers 7.5. Scalar λ acts on St⊗St by λ², on St⊗St∨ by 1. For transmutation over 𝔽₂[ε]/ε²: A¹ has 4 points, G_m has 2 units, T²=0 has {0,ε}; reduction first gives 2,1,1. | Frame-atlas repair retained; add missing ring-operation/transmutation Checks, S08. |
| 7.7 multiplicative and overconvergent classifying stacks | A=0 gives zero categories. Constant sequence 1 has r^|n|→0 for 0<r<1; p^(−n²) has p^(n²)r^|n|→∞ for every r>0. Product weights multiply r·s. Convolution 1⋆1 would require summing infinitely many ones and diverges. Additive Hopf convention instead gives Δe₀(1,−1)=1, εe₀=1, εe₁=0, Se₁=e_−1. | Sequence algebra is not enough to define the quotient group; S05. |

## Supplier, ownership and build-order audit

The authoritative main copy is at 546d9e45; open heads explicitly supplied in the brief were used instead of main for SolidAnalyticRings and RefinedTraceMethods. The roadmap service's index is dated 2026-10-26T17:46:35Z. Its resolution check reported no unresolved cross-roadmap citations or Lean names; this was treated as an index check, with the substantive contracts read separately. Library declarations were checked locally at Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039.

| Supplier or ownership boundary | Resolved contract and witness |
|---|---|
| EnhancedDerivedSheaves | E0.2–E0.8, E1.3/E1.8, E2.6–E2.7, E3.1–E3.4, E4.1, E5:abstract.1–5, E5:presentability.1–4, E5:descent, E5:animation.1/.4, E5:cotangent-export.1–2 exist. TauCetiRoadmap/EnhancedDerivedSheaves/README.md:1758 states `dualizable_filteredColimit` with the strong continuity needed here; restriction of module scalars preserves colimits. Hypercompletion and convergence of Postnikov towers are distinguished at lines 2293 and 2375. |
| BordismFormalGroups | F6.5 is the categorical-equivalence/Joyal-model supplier named by EnhancedDerivedSheaves E0.2, at TauCetiRoadmap/EnhancedDerivedSheaves/README.md:191. AnalyticStacks owns the restricted-diagonal theorem, not the underlying model structure. |
| DerivedModuleAlgebra | §§0.K.1, 0.4, 0.6, 0.12–0.14 and 1.E.0 resolve to the claimed Koszul, cotangent and perfect-complex targets. TauCetiRoadmap/DerivedModuleAlgebra/README.md:1151 retains the regular-sequence hypothesis: the quotient by (x²,xy) does not acquire a one-term conormal complex. |
| SchemeAndStackFoundations | §§1.15, 1.18–1.22, 2.18–2.20 and 5.5 resolve. TauCetiRoadmap/SchemeAndStackFoundations/README.md:4123 and :4128 retain the bounded-below Noetherian domain of the proper/smooth upper-shriek comparisons; :4275 separately treats relative dualizing complexes for flat locally finitely presented maps. The arbitrary non-Noetherian counterexample to unqualified finiteness is already at :656 (S10). |
| EtaleCohomologyFoundations | G.1–G.3 exist at TauCetiRoadmap/EtaleCohomologyFoundations/README.md:57, :105 and :139: compactifications, Nagata over qcqs bases, and common refinements. No Noetherian assumption was silently added to this supplier. |
| DerivedDeRhamCohomology | §§1.14–1.16 and 1.18–1.19 exist. TauCetiRoadmap/DerivedDeRhamCohomology/README.md:729 grades F^i by −i with deg(t)=1. The package's weight convention gives weight(t)=−1. A degree-one filtered piece therefore has weight +1 here and degree −1 there. |
| AdicSpaces / AdicSpacesPartII | AdicSpaces §§2.1–2.2/3.1 and AdicSpacesPartII §§R0.16/R1.1 exist. TauCetiRoadmap/AdicSpaces/README.md:358 and :455 supply Huber pairs and rational localization. The rigid affinoid discussion at TauCetiRoadmap/AdicSpacesPartII/README.md:8427 keeps its complete rank-one nonarchimedean base; it is not evidence for an arbitrary-topology version. |
| SolidAnalyticRings | §§1.5, 2.1–2.4 and 7.1–7.4 exist at the supplied open head. Its §7.3 already owns generator and integral-closure independence (S03). Its §7.4 comparison is conditional on its own light-measure-site comparison contract; AnalyticStacks uses it only in comparison Checks. The general light analytic-ring definition, arbitrary analytic-ring cotangent complex and stack geometry are not its spectral-solid construction. |
| RefinedTraceMethods | §§4.1–4.3 exist at the supplied open head. TauCetiRoadmap/RefinedTraceMethods/README.md:1594 defines nuclearity by trace-class maps from compact objects, and :1628 supplies closure. The mapping-spectrum criterion is not silently assumed to be present: it is the declared gap below. |
| SmoothRepresentationsOfLocalGroups | SR.0.1, SR.0.2, SR.0d.1–.2 and SR.1.1 exist. Its modulus convention at TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md:176 gives p⁻¹ for conjugation by diag(p,1) on the upper unipotent lattice, matching this package. Derived smooth invariants, not just their abelian heart, are supplied. |
| LocallyAnalyticDistributions | §1.1 exists at TauCetiRoadmap/LocallyAnalyticDistributions/README.md:775. Convention 5 at :67 sends δ_a to (1+T)^a, hence δ₀ to 1 and δ₁ to 1+T. This is the unbounded analytic transform; the pinned Mathlib transform treats bounded measures. |
| VStackSheavesAndLisseCategories | VS1.1, VS2.2, VS3.1 and VS4.2 resolve. VS2.2 at TauCetiRoadmap/VStackSheavesAndLisseCategories/README.md:710–738 supplies cutoff analytic measures and the integer-solid spectrum. The common light presentation and general-ring hypotheses are explicit; no equality of the entire cutoff and light sites is asserted here. |
| DiamondSixOperations | Layers S0–S4 resolve to the concrete étale six operations on small v-stacks. These are ownership boundaries, not inputs reconstructing the generic correspondence formalism. |
| Downstream interfaces | packages/MotivesAndAlgebraicCyclesPartII/design/README.md:2132 and :2138 name AS.0 and AS.1; packages/AutomorphicBundlesPartII/design/README.md:716 names G-solid. Their operator descriptions and filtered support functors remain downstream obligations. RationalAnalyticPrismatization's available third design review uses `hypercover-inversion`; its current plan is not available, as recorded below. |

There are twelve directly named supplier roadmaps, plus the two boundary/transitive owners BordismFormalGroups and DiamondSixOperations. Every cited section family above was resolved at its current supplied copy. Ownership searches used the roadmap service, main's active and completed folders, board packages, and all 49 supplied sibling folders. Searches were by objects (restricted nerves, smashing spectra, summability structures, solid Huber rings, Fredholm rings, nuclear objects, analytic measures and Cartier kernels), followed by declaration-name searches. The broad service search reached its result cap; narrower object searches and local searches were used before drawing conclusions. The one remaining duplicate construction is S03. No other owner for the general correspondence calculus, light analytic stack geometry, or spectral-space category equivalence was found. None of the seven fully qualified Lean names occurs in another readable roadmap.

The declared gap has the same slug `nuclear-hom-criterion` in packages/AnalyticStacks/design/plan.json:2991 and packages/AnalyticStacks/README.md:92. The plan's detail and the README both quantify over compactly generated presentably symmetric monoidal stable categories with compact unit, over X, and over every compact P. The supplier is RefinedTraceMethods §4.3, not `none`. It asks only for the equivalence between two specified nuclearity criteria; it neither repeats an existing local target nor asks for the entire nuclear theory. It is an accepted conditional input, not a finding.

Read-only dependency-gate output:

```text
depcheck: 56 roadmaps, 651 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. Internally, 0.3 precedes 0.2 by the explicit build instruction; 3.7 consumes 1.1/1.2/2.2 and 3.8 consumes 3.7, so the former realization cycle is absent. Layer 5 depends on Layer 2; the later smoothness and duality constructions consume it. No move of a target from a later supplier was needed in this pass.

## Headline and padding audit

The six end theorems explicitly named in the summary are 0.6, 3.3, 3.8, 4.2, 6.6 and 7.6. The file also identifies the deep enabling results 0.3(1–2), 0.5, 0.12, 0.13 and 2.10, giving twelve headline statements in total.

| Headline | Acceptance-file disposition |
|---|---|
| 0.3(1), restricted diagonal | Stated as `restrictedDiagonalMap_isEquivalence_hoFunctor`, on native simplicial sets, internal Homs and homotopy categories; four supporting definitions have real bodies. |
| 2.10, spectral Stone duality | Stated as `spectralStoneDuality`; the small supporting bundle uses native spectral spaces, spectral maps and bounded distributive lattices. |
| 0.3(2), restricted-nerve gluing | Named in the module docstring; missing quasicategorical pullbacks and the corresponding restricted nerves. |
| 0.5, construction principle | Named; missing Cat∞, ∞-operads and the coherent correspondence category. |
| 0.6, extension to sheaves | Named; additionally needs sheaves of anima and ∞-topoi. |
| 0.12, Künneth descent | Named; needs presentable ∞-categories with their tensor product. |
| 0.13, D-stacks | Named; needs left exact localizations of ∞-topoi. |
| 3.3, analytic-stack formalism | Named; needs analytic rings, !-able maps, and the localized stack ∞-topos. |
| 3.8, algebraic-stack realization | Named; needs algebraic stacks in the !-topology and their enhanced quasi-coherent categories. |
| 4.2, classifying-stack duality | Named; needs light condensed anima, the formalism and derived smooth representations. |
| 6.6, solid Serre duality | Named; needs solid Huber rings, analytic cotangent complexes and exceptional inverse image. |
| 7.6, stacky Cartier duality | Named; needs kernels of Künneth formalisms, ring stacks and transmutation. |

Pinned searches confirm the distinction between the native 1-categorical carriers and the absent enhanced carriers. In particular, Mathlib/AlgebraicTopology/Quasicategory/Basic.lean:41 is a horn-filling class; it supplies no limit structure. Mathlib/Condensed/Light/Module.lean:42 and :85 are ordinary sheaf categories, not the module ∞-categories. Mathlib/Topology/Spectral/Basic.lean:38 includes T0, compactness, quasi-sobriety and quasi-separatedness; it does not require Hausdorffness. TauCeti/AlgebraicGeometry/AffineGroupScheme/CartierDuality/FiniteLocallyFree.lean:271 gives finite locally free commutative Cartier duality, not the stacky analytic duality. The two admitted statements are substantive theorems rather than computations, definition unfoldings or single pinned-lemma applications. No padding deletion and no additional statable missing headline were identified.

## Verified sound

- Read all 1,197 README lines and all 144 Suggested.lean lines. Reviewed all 38 earlier findings: 35 repaired, three partly repaired, as itemized above. The report has 13 new findings: three P1, four P2 and six P3.
- Read seven named Lean declarations (four definitions, one structure, two theorems) and both supporting instances: nine authored declarations inspected. Compared all seven supplied elaborated named signatures with their README claims; no lost standing binder or universe mismatch was found. The two anonymous instances were inspected directly.
- Read all 60 numbered target sections, their API statements, conventions and downstream promises. Evaluated the 209 README Check bullets; sampled computations and all identified failures are retained above. Applicable tests include zero coefficients, empty objects, rank zero, characteristics 2 and 3, inseparable extensions, nonreduced rings, non-Noetherian bases, nonabelian finite groups, and size bounds. Numerical phenomena absent from the statements, such as division by a residue cardinality q−1, were not invented as tests.
- Resolved 490 explicit source-line occurrences to 463 distinct source/line anchors across 26 texts; read their locator contexts and the relevant theorem or proof passages. Gest's excluded scope was checked against its lecture headings at Gest lines 18–23. All 27 cited texts are available in the legal cache; no new missing reference is requested. Source defects are separated below from defects of the repaired package.
- Checked twelve direct supplier roadmaps, two additional ownership/transitive boundaries, and three downstream citation families with the limitation stated below. Checked all 49 supplied sibling directories by object searches, as well as main, Completed and board packages. Source/section resolution does not substitute for the explicit hypothesis checks in the supplier table.
- The declared nuclear gap is precise, owned, minimal in the checked sources, and present in both intake locations. The dependency gate reports zero problems. The library pins match the manifest. The package uses the permitted single `import Mathlib`, the proper namespace, `theorem`, real definitions and two honest theorem admissions; no `set_option`, sorry'd data, free predicate stand-in, computational algorithm, or duplicate fully qualified declaration was found.
- `git diff --stat origin/main...HEAD` reports nine files, 2,080 insertions and 11 deletions, all within packages/AnalyticStacks. This review changed only its report and scratch notes; the final status check showed the new report as the only package working-tree change. No Lean command, git mutation, build, network posting or source edit was performed.

## Not verifiable

- Elaboration was not rerun: the task's read-only prohibition on Lean builds takes precedence over its generic scratch-elaboration instruction. The supplied seven-signature artifact was compared instead. No claim is made that this review independently reproduced the worker's elaboration.
- RationalAnalyticPrismatization's current design plan and package README are not present. The downstream `hypercover-inversion` identifier is confirmed in its available design review, but the currently accepted complete contract cannot be certified from that review alone. MotivesAndAlgebraicCyclesPartII and AutomorphicBundlesPartII interfaces were checked in their available design READMEs, not in nonexistent merged package READMEs.
- The declared nuclear Hom-criterion bridge is a future supplier obligation. Its precision and ownership are verified; its future proof is not. Likewise, comparison Checks relying on SolidAnalyticRings §7.4 retain that supplier's stated site-comparison condition.
- These are mathematical counterexample and source checks, not formal proofs of all planned ∞-categorical theorems. No source was inaccessible or behind an unresolved paywall, and no quoted statement was certified from memory alone.

## Source issues

- **Error** in RCSolid at Proposition 2.1.6, printed page 8, RCSolid line 368: the source says every light profinite set is injective; it should be every nonempty light profinite set is injective; affects a stated result.
- **Error** in RCSolid at Proposition 4.4.5, printed page 41, RCSolid line 1968: the source says a nilpotent kernel suffices for the asserted invariance; it should be a surjection with nilpotent kernel; affects a stated result.
- **Misprint** in RCSolid at Remark 5.1.5, printed page 47, RCSolid line 2275: the source says the open localization is the quotient by itself; it should be the quotient by the complementary closed subcategory; affects a stated result.
- **Error** in RCSolid at Corollary 5.4.4, printed page 60, RCSolid line 3024: the source says reversing all Zariski opens produces a spectral space for every scheme; it should be Hochster duality for qcqs schemes using compact opens, with locale language for greater generality; affects a stated result.
- **Error** in RCSolid at Proposition 5.4.11, printed page 62, RCSolid line 3132: the source says the solidification functor preserves all colimits into analytic rings; it should be nonempty colimits, or colimits relative to the integer-solid base; affects a stated result.
- **Error** in RCSolid at Proposition 5.5.6, printed page 65, RCSolid line 3284: the source says the Huber-pair functor preserves all colimits into analytic rings; it should be nonempty colimits, or colimits relative to the integer-solid base; affects a stated result.
- **Misprint** in RCSolid at Proposition 5.6.4, printed page 67, RCSolid line 3379: the source says the numerator generators are indexed up to g; it should be indexed up to n; affects nothing.
- **Misprint** in RCSolid at Lemma 6.3.10, printed page 86, RCSolid line 4246: the source says the original index set is contained in the finite selection; it should be the finite selection is contained in the original index set; affects a stated result.
- **Misprint** in RCSolid at Remark 6.4.1, printed page 91, RCSolid line 4474: the source says the functor category is linear over D(ℤ); it should be linear over D(A(∗)); affects a stated result.
- **Misprint** in RCSolid at Proposition 6.4.7, printed page 93, RCSolid line 4569: the source says δ is the dualizing object; it should be the codualizing object; affects nothing.
- **Misprint** in RCSolid at the proof of Proposition 6.4.7, printed page 93, RCSolid line 4571: the source says source-locality reduces the target to an affine scheme; it should be target-locality; affects the proof.
- **Misprint** in RCSolid at Lemma 6.4.13, printed page 96, RCSolid line 4687: the source says the kernel is taken for a map from π₀A to π₀A; it should be for the map from π₀A to π₀B; affects a stated result.
- **Misprint** in RCSolid at Lemma 6.4.15, printed page 96, RCSolid line 4705: the source says the closed-immersion pushforward has target D(Z); it should be D(X); affects a stated result.
- **Error** in RCSolid at Lemma 7.2.10, printed page 103, RCSolid line 5034: the source says a nilpotent kernel alone gives invariance; it should be surjectivity on π₀ with nilpotent kernel and the indicated induced structure; affects a stated result.
- **Misprint** in RCSolid at Lemma 7.4.5, printed page 109, RCSolid line 5315: the source says the positive-connectivity power bound has no restriction on the power; it should be restricted to m≥1, with the zeroth power equal to the base; affects a stated result.
- **Error** in RCSolid at Corollary 7.4.6, printed page 109, RCSolid line 5324: the source says the n+2m−2 exterior-power connectivity bound applies for n≥0; it should be n≥1, since ∧²ℤ²=ℤ is not 2-connective; affects a stated result.
- **Misprint** in HM at Definition 4.5.1(b), printed page 70, HM line 3515: the source says the prim dual is a right adjoint; it should be a left adjoint; affects a stated result.
- **Misprint** in HM at Lemma 4.5.8(ii), printed page 71, HM line 3576: the source says source-locality of primness uses suave covering maps; it should be prim covering maps, as in the preceding object-locality criterion; affects a stated result.
- **Error** in HM at Example 5.3.21, printed page 98, HM line 4914: the source says smooth representations over ℤ[1/p] of pro-p groups are semisimple; it should be exactness of invariants, with averaging providing the needed retract; affects the proof.
- **Misprint** in ALRS at Remark 2.9.2, printed page 36, ALRS line 1902: the source says the differential decreases the weight in the displayed shearing convention; it should be increases the weight; affects a stated result.
- **Error** in ALRS at Remark 6.5.6, printed page 163, ALRS line 8825: the source says the smooth dualizing object is the shifted cotangent complex; it should be the shifted determinant of the cotangent complex; affects a stated result.
- **Misprint** in RC26a at Lemma 3.1.1, printed page 30, RC26a line 1482: the source says the direct sum of weight components is indexed by natural numbers; it should be indexed by integers; affects a stated result.
- **Misprint** in RC26a at the proof of Lemma 3.2.18(2), printed page 36, RC26a line 1811: the source says the Y^(n−k) divided-power term has denominator k!; it should be (n−k)!; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "f46473a1fd1a799764a39b3e39c2f4b0ced2d056", "job": "RT-AnalyticStacks~2a", "model": "gpt-6-astra", "worker": "chris-3"} -->
