<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1304#issuecomment-6391679933 -->
Review (claude) of a872370

Verdict: needs changes

1. **F01** (P1) Seven design gaps have supplier `none` and are not stated in the README

   **Location.** `design/plan.json`, top-level `gaps`, entries `G1`–`G7`. They have no `supplier`/`section` field. `README.md` states only the eight named-supplier gaps (lines 50, 56, 58, 64, 74, 76, 82, 92) and never mentions G1–G7.

   **Claim.** Under the brief's rule, a declared gap with supplier `none` is unowned. Plan and README also disagree about which gaps are declared.

   **Witness.** For each record, the README itself already owns the statement or names its supplier:
   - G1 (properness) → §0.3. Its premise is false: IStr line 538–539 (Remark 4.16, arXiv v1) says the I01 Prop. 17.1 proof is wrong and that the technique of the Thm 4.15 proof (IStr lines 504–535) repairs it.
   - G2 (Bousfield–Kan convergence) → §2.3, citing BK by locator. The same need is declared a second time inside `gap:unstable-limits-and-coefficients` (line 58).
   - G3 (Fr Prop. 5.9) → §3.4.
   - G4 (AM Thm 11.1) → §3.5.
   - G5 (Fr Thm 11.5) → §3.8.
   - G6 (analytification carrier) → the README already contracts ComplexComparisonPartII §C−1.1 (line 90), which states `complexSchemeAnalytification` at its open head (its line 754 ff.).
   - G7 (strictification) → §6.9, which already makes the strict functor and the strict Aut(ℂ)-diagram a target.

   **Repair.**
   - Retire G1–G5 and G7 as gaps. Each is a target this roadmap owns, with a locator; BK, AM and Fr are settled `uncertified` citations. This roadmap's own targets must not also be filed as gaps.
   - Close G6 by citing ComplexComparisonPartII §C−1.1 `complexSchemeAnalytification` as the supplier.
   - Leave one declaration of the BK need: either G2 is retired and the BK clause stays in a split AlgebraicTopology slug (see R05), or the reverse.
   - If the package stage may not retire design-stage gap records, this finding needs a human decision. The seven records are stale, and the README already owns or cites each one.

2. **F02** (P2) The only declaration in `Suggested.lean` is an input lemma, not a headline

   **Location.** `Suggested.lean` lines 79–89, `finiteAbelianHigherLimits`. Also README line 327: "The headline `finiteAbelianHigherLimits` states this on a native functor A : I ⥤ AddCommGrpCat". And line 38: "The derived-limit acceptance theorem uses …".

   **Claim.** The declaration states SS Lemma A.7 (SS line 1573), a homological-algebra input to Theorem A.8. It is not one of the end theorems in the README Summary (line 3: cohomology transport, arithmetic orbit bijections, maps into K(π,1) products, Betti–étale comparison). It is not about any object this roadmap constructs either: no pro-space, Mat, Et or pro-covering appears in it. The brief says a headline names the roadmap's objects, and a statement that is not a headline is padding.

   **Witness.** The elaborated type (from `#check @…finiteAbelianHigherLimits`) mentions only `SmallCategory`, `IsCofiltered`, `HasInjectiveResolutions`, `AddCommGrpCat`, `Limits.lim` and `Functor.rightDerived`, all of them Mathlib's.

   The statement itself is sound:
   - It is true. The README's route works: reindex to a cofinite directed set, embed A ↪ A* with A*_i = ∏_{j≤i} A_j, which is lim-acyclic, then use compactness and dimension shifting.
   - It is not vacuous. `HasInjectiveResolutions (I ⥤ AddCommGrpCat)` is not inferable at the pin (instance search fails), but it holds mathematically for a Grothendieck category.
   - It is not one-tactic padding: `simp` makes no progress, and `exact?` returns only the theorem itself.

   **Repair.**
   - Delete `finiteAbelianHigherLimits` from `Suggested.lean`.
   - Keep §2.2 in the README as a target, and remove its sentence calling the theorem "the headline".
   - Remove the README line 38 paragraph about the "derived-limit acceptance theorem".
   - The module docstring then lists every headline as not statable, with its missing carrier, exactly as the current per-layer list does. Its Layer 2 bullet "The abelian higher-derived-limit assertion is stated below" goes.
   - Tested: the file with only the docstring and the namespace elaborates trivially.

3. **F03** (P2) §3.0a rebuilds profinite completion without citing Mathlib, Tau Ceti or ProfiniteProPGroups

   **Location.** README line 430: "define its profinite completion by its finite quotient maps, using a small skeleton of finite groups". Checks at lines 439–441 (constant ℤ, constant S₃). Docstring lines 35–36: "lacks the native general pro-group carrier and its finite-quotient completion construction".

   **Claim.** The finite-quotient completion of a group, its universal property and the finite-quotient presentation of a profinite target all exist at the pins. The README names none of them, so the group-level construction is silently rebuilt.

   **Witness.**
   - Mathlib: `ProfiniteGrp.profiniteCompletion` (`Mathlib/Topology/Algebra/Category/ProfiniteGrp/Completion.lean`:191), `ProfiniteGrp.ProfiniteCompletion.homEquiv` (:205) and `.adjunction` (:215).
   - Mathlib: `ProfiniteGrp.toFiniteQuotientFunctor` and `ProfiniteGrp.continuousMulEquivLimittoFiniteQuotientFunctor` (`…/ProfiniteGrp/Limits.lean`:48, :138).
   - Tau Ceti: `TauCeti.ProfiniteCompletion.continuousMonoidHomEquiv` (`TauCeti/Topology/Algebra/Group/Profinite/Completion.lean`:179) and `etaFn_bijective_of_finite` (:68).
   - ProfiniteProPGroups Layer 0 (its README line 164) consumes exactly these.
   - The constant-ℤ and constant-S₃ Checks are the group case of these declarations.

   **Repair.**
   - Cite the declarations above under "From Mathlib" and "From Tau Ceti".
   - Define the completion of a small pro-group G = (G_i) as the limit in `ProfiniteGrp` of `profiniteCompletion` applied levelwise. Derive the universal property from the levelwise adjunction plus the finite-quotient presentation of H.
   - Rewrite the docstring bullet to say that only the pro-group carrier is missing.
   - Tested on constant ℤ: lim of a constant diagram is ℤ̂, and Hom_cont(ℤ̂, C₂) has 2 elements = Hom(ℤ, C₂).

4. **F04** (P2) Three declared gaps ask for what is already provided

   **Location.** README lines 56, 58, 92 (`gap:ordinary-simplicial-homotopy`, `gap:unstable-limits-and-coefficients`, `gap:analytic-smooth-local-sections`).

   **Witness.**
   1. `ordinary-simplicial-homotopy` asks AlgebraicTopology Stage 8 for "the proper simplicial Kan–Quillen model on native simplicial sets". GeneralizedCohomology §G2.1 on main already owns it (its README line 220: build the unpointed Kan–Quillen model structure from Mathlib's boundary and horn generators).
   2. `unstable-limits-and-coefficients` asks for three things that already exist or are already requested:
      - "higher abelian derived limits": Mathlib `Functor.rightDerived` (`Abelian/RightDerived.lean`:108) applied to `Limits.lim` (`Limits/HasLimits.lean`:555), which `Suggested.lean` itself uses;
      - "arbitrary abelian local-coefficient cohomology": Tau Ceti `TauCeti.LocalCoefficientSystem.twistedCochainComplex`/`twistedCohomology` (`TauCeti/AlgebraicTopology/Cohomology/Twisted/Basic.lean`), extended to L-valued cochains by AlgebraicTopology Stage 6 (its README lines 202–215 and 1012);
      - the BK statements, which repeat G2.
   3. `analytic-smooth-local-sections` asks ComplexComparisonPartII for local analytic sections of smooth surjections. Its §C−1.1 API `complexSchemeAnalytification.smooth` (its README line 756) identifies an analytified smooth morphism locally with a projection from an analytic open of the base times an open polydisc. That gives local sections through every point and manifold charts for smooth schemes.

   **Repair.**
   - Cite GeneralizedCohomology §G2.1 for the Kan–Quillen model, and keep only properness and simplicial enrichment, if G2.1 lacks them, as a gap against GeneralizedCohomology.
   - Delete "higher abelian derived limits", "arbitrary abelian local-coefficient cohomology" and the duplicated BK clause from the AlgebraicTopology gap. Cite the Mathlib and Tau Ceti declarations instead.
   - Delete `analytic-smooth-local-sections`. In §5.3 and "From ComplexComparisonPartII", cite `complexSchemeAnalytification.smooth`.

5. **F05** (P2) Compound or vague gap needs

   **Location.** README lines 50, 74, 76, 82, and what remains of lines 56 and 58 after R04.

   **Witness.**
   - `pro-simplicial-reindexing` bundles four deliverables. The last, "comparison of the small geometric-point indexing choices", is scheme geometry, not generic Pro theory (AdicSpacesPartII R0.19.9 is stated for a small C and has no schemes).
   - `rigid-components-and-curve-families` joins two unrelated deliverables. Its "elementary-fibration input" does not say whether a definition or an existence theorem is wanted, while Scope (line 15) excludes existence.
   - `coherent-pro-spaces` lists four deliverables, including coherent diagram rectification.
   - `topological-hypercover-realization` lists three; "analytic étale refinement" is complex-analytic, outside EnhancedDerivedSheaves §E2.6 (topos hypercovers and sheaf descent).
   - The remainders of `ordinary-simplicial-homotopy` (Postnikov truncations, Whitehead/Moore–Postnikov obstruction theory, covering classification) and of `unstable-limits-and-coefficients` (Reedy homotopy limits, nonabelian lim¹, BK convergence) are each several theorems.

   **Repair.**
   - Split each gap into one-statement slugs with hypotheses, each addressed to the owner of that object. For example: `pro-level-representations` (AdicSpacesPartII R0.19.9), `elementary-fibration-carrier` (SchemeAndStackFoundations, definition only), `nonabelian-lim1` and `bk-tower-convergence` (AlgebraicTopology).
   - Move geometric-point indexing and analytic étale refinement to targets here (§3.1, §5.3), or to ComplexComparisonPartII.
   - Update the README contract lines and the plan `gaps` with the same slugs.

6. **F06** (P3) Garbled substitutions and typos

   **Location and witness.**
   - "pro-covering" has been replaced by "§1.1" at lines 182 ("A §1.1 is a pro-morphism isomorphic to a levelwise simplicial covering"), 186 (twice), 228, 236, 520 and 530. The defined term is missing.
   - "§materialization–2.2" (line 504) and "§materialization–2.3" (line 881) should read "§§1–2.2" / "§§1–2.3".
   - "Apply Ethe supplied covering base-change result" (line 522).
   - "Record the exact native infinity-category and universe interface as supplier contract the coherent Pro supplier contract" (line 774).
   - Scope (line 13) lists SchemeAndStackFoundations §2.5, which no target or contract consumes; the contracts at line 80 list §§0.9–0.12, 2.10, 2.15.

   **Repair.** Restore "pro-covering" and define it at line 182. Fix the two section references, the typo and the sentence at line 774. Drop §2.5 from Scope or add the consuming target.

7. **F07** (P3) Line locators that point at the wrong text

   **Witness and repair** (the corrected line comes after each arrow):
   - §0.1: I01 line 260 is in §3 (simplicial preliminaries) → I01 line 281 (§4) / 340 (Def. 5.1).
   - §0.2: I01 line 398 is inside the proof of Lemma 5.5 → I01 line 412 (Def. 6.1) and 423 (Thm 6.4).
   - §1.1: SS line 1430 is a page marker → SS line 1457 (Def. A.1).
   - §1.6: SS line 1810 → SS line 1833 (Lemma A.14).
   - §3.1: IEt line 572 is the coskeleton convention in §4 → IEt line 599 (Def. 5.1), 624 (Def. 5.3), 634 (Prop. 5.5).
   - §3.4: IEt cites Fr Prop. 5.9 at IEt line 271 (p. 6, mod-p setting). The remark after Thm 2.10 (IEt lines 331–333, p. 7) asserts the comparison without a citation. Cite both lines separately.
   - §3.5: SS line 214 is the Isaksen-model sentence → profiniteness is at SS lines 228–229 (p. 822), and completion = SGA1 π₁ at SS lines 373–375 (p. 826). "Appendix A.3" supports only the BG identification.
   - §3.6: SS line 228 → SS line 237 (Lemma 2.1) and 269 (Lemma 2.2).
   - From Mathlib (line 33–34): `SSet.KanComplex` is at line 40 (not 41), `hornFilling` 45 (46), `TopCat.toSSetObjEquiv` 56 (57), `SSet.toTop` 65 (66), `TopCat.toSSetIsoConst` 97 (99).

8. **F08** (P3) §3.9 effacement criterion is stated more generally than its locator

   **Location.** Line 546: "For a connected noetherian geometrically unibranch pointed scheme X, prove that vanishing of every raw πₙ … is equivalent to …" (SS line 417).

   **Witness.** SS line 418 states the criterion only for a connected, geometrically unibranch variety over a field.

   **Repair.** Say that SS proves the variety case. The scheme-level statement is this roadmap's own argument, from AM Thm 4.3 (uncertified) and §3.5's profiniteness. Alternatively, restrict to varieties, which is all §4.7 uses.

9. **F09** (P3) §3.9 has one Needs line for three theorems with different needs

   **Location.** Line 556.

   **Witness.** The finite-étale product formula (first paragraph) needs only EtaleCohomologyFoundations §§F.0.2, F.0.A2, SGA1 XIII 4.6 and ResolutionOfSingularitiesCharacteristicZero §§5.1–5.2, 6.1–6.2. The single Needs line puts it behind §§1.2, 1.8–1.9 and 3.4–3.6.

   **Repair.** Split §3.9 into three subsections (product formula; effacement and detection; K(π,1) products), each with its own Needs line. This also gives §4.7 an exact edge.

10. **F10** (P3) §4.0b Check 3 tests the product formula, not open image

   **Location.** Line 596: "Over ℂ, two copies of Gₘ have fundamental group ℤ̂² …".

   **Repair.** Move it to the §3.9 product formula. As a third open-image Check, use X = Spec ℚ(i) over ℚ: the image is G_{ℚ(i)}, of index 2, so the map is not surjective.

11. **F11** (P3) Mathlib's König lemmas for cofiltered categories are not cited

   **Location.** Line 43: "Reindexing supplies the required directed presentation."

   **Witness.** Mathlib states compatible-family existence directly for cofiltered categories, so no reindexing is needed:
   - `nonempty_sections_of_finite_cofiltered_system` (`Mathlib/CategoryTheory/CofilteredSystem.lean`:79);
   - `TopCat.nonempty_limitCone_of_compact_t2_cofiltered_system`.

   **Repair.** Cite them next to the Tau Ceti directed-preorder versions, and use them in §§2.2 and 3.1.

12. **F12** (P3) §2.2 Needs line and the injective-resolution wording

   **Location.** Line 331 (Needs) and line 327 ("with a chosen native injective-resolution structure").

   **Witness.**
   - The Needs line cites "AlgebraicTopology Stage 8 and its ordinary simplicial contract" (Kan–Quillen, Postnikov), not the derived-limit contract. It also omits Mathlib `Functor.rightDerived` and `Limits.lim`, which the statement uses.
   - `HasInjectiveResolutions` is a `Prop` class (`Mathlib/CategoryTheory/Preadditive/Injective/Resolution.lean`:70), not chosen data.

   **Repair.** List the Mathlib statement inputs and the nonabelian-lim¹ slug from R05. Say "assuming injective resolutions exist".

13. **F13** (P3) "degreewise finite-dimensional" is ambiguous for simplicial schemes

   **Location.** Lines 807 and 845.

   **Witness.** DAG13 Thm 3.4.12(3) (DAG13 line 4150) requires Hⁿ to be finite-dimensional in each cohomological degree. For a simplicial X, "degreewise" also reads as "for each Xₙ".

   **Repair.** Write "Hᵐ_et(X,F_p) is finite-dimensional for every m".

14. **F14** (P3) §5.3's second assertion has no stated hypotheses but §6.7 depends on it

   **Location.** Line 716: "More generally the comparison zigzag uses analytic descent for étale hypercovers of complex varieties, including singular varieties". §6.7 (line 828) applies it to rigid hypercovers whose pieces are locally of finite type, infinite disjoint unions and not quasi-projective. §5.2 defines Sing_an only for simplicial quasi-projective schemes.

   **Repair.** State it as a target: for an étale hypercover U_• → X of a quasi-projective complex scheme whose pieces are locally of finite type, the diagonal of Sing applied to §C−1.1's analytification of U is weakly equivalent to Sing(X^an). Its Needs are the topological realization slug from R05 and `complexSchemeAnalytification.etaleLocalIso`.

   ---

Scope of this review: `packages/EtaleHomotopyTypes/README.md` (892 lines), `Suggested.lean` (91 lines), `metadata.toml`, `sources.toml`, and the top-level `gaps` of `design/plan.json`. Pins: Mathlib `6b7abb3c`, Tau Ceti `a91d3aaf` (content `lake-manifest.json`); content main `ae2562c`; open roadmap pull requests read at their heads through `tauceti-roadmap roadmaps show/grep`. No package file was edited; no source was fetched, so `sources.toml` is unchanged.

Dependency check (run as the brief prescribes), full output:

    depcheck: 43 roadmaps, 437 edges, 0 problem(s)

No UPWARD, CYCLE or moved line.

Elaboration: `lake env lean packages/EtaleHomotopyTypes/Suggested.lean` from the content checkout: one warning, `declaration uses 'sorry'` at line 82; nothing else. No `TauCeti.*` import, so no Tau Ceti object file was needed.

---

## Adversarial pass

Every row records values computed by hand on explicit instances; "src" means checked against the cited source line.

| Statement | Instances tried | Left side / construction (computed) | Right side / comparison (computed) | Result, change |
| --- | --- | --- | --- | --- |
| Conv. transport α φ α⁻¹ (line 23) | α=(123), β=(12), φ=(12) in S₃ | α φ α⁻¹=(23); then β(23)β⁻¹=(13) | βα=(12)(123)=(23); (23)(12)(23)=(13); (132)(12)(123)=(13) | consistent with §2.5, §4.0a and StableHomotopyKTheory §1.28; none |
| Conv. Kummer class on Gₘ (line 90) | n=3, positive loop | monodromy of z^{1/3} multiplies by ζ₃ | ζ₃ ↦ 1 in ℤ/3 | consistent; none |
| §0.1 homotopy pro-local systems | c Sing S¹; c{0,1}; sign system on S¹ | π₁=ℤ, π_{n≥2}=0; \|π₀\|=2; cellular d(a)=(−1)a−a=−2a | H⁰=0, H¹=ℤ/2 (sign); constant d=0: H⁰=ℤ, H¹=ℤ | Examples line 172 agree; none |
| §0.2 Isaksen model | S²→*; K=∏K(ℤ,n)→(P_mK) | π₂: ℤ vs 0; π_n(P_mK)=ℤ for m≥n | not a w.e.; pro-isomorphic π_n, but level m misses π_{m+1}=ℤ | Checks hold; src I01 lines 412–425; locator R07 |
| §0.3 properness | levelwise degree-2 covering of the S¹ factor; w.e. c(S¹×K(ℤ,2))→(P_m(S¹×K(ℤ,2))) | pullback π₁=2ℤ, π₂=ℤ | target π₁=2ℤ, π₂=ℤ (pro-constant) | w.e. preserved; IStr line 538 exists (refutes G1 premise) |
| §0.4 connected detection | id c(S¹); c(BC₂)→c(BS₃) by (12) | π₁: ℤ→ℤ identity | π₁: C₂→S₃ not onto | w.e. / not w.e. as stated; none |
| §0.5 local-coefficient detection | BC₃→* with F₂ coefficients; S¹→* | H^*(BC₃;F₂)=F₂ in degree 0 = H^*(*) | Π₁: C₃ vs 1; H¹(S¹;ℤ)=ℤ vs 0 | finite constant F₂ alone does not detect; criterion with Π₁ does; none |
| §1.1 pro-coverings | identity; degree-2 cover of S¹; Sing S¹→* | fibres 1 and 2; deck 1 and C₂ | lifts of Δ[0]→Δ[1] with fixed endpoint: uncountably many | Checks hold; term garbled (R06) |
| §1.2 sub-pro-group cover | S¹: U=ℤ, 2ℤ, 0; maps S¹→S¹ of degree 3 and 4 | covers of degree 1, 2, ∞ | 3ℤ⊄2ℤ: no lift; 4ℤ⊂2ℤ: lift | src SS line 1475; none |
| §1.3 covering invariance | id c(S¹); Postnikov w.e. of S¹×K(ℤ,2) | connected covers ↔ subgroups nℤ | same set on both sides | src SS line 1484; none |
| §1.4 coverings are fibrations | c(ℝ)→c(S¹) | levelwise covering; matching maps are coverings | strong fibration | src SS line 1493; none |
| §1.5 base change | W=X=Y=cS¹, γ=id, W′ = degree-2 cover | γ′=id on cS¹′ | deck C₂ acts on H¹(S¹′;ℤ)=ℤ by +1 on both sides | equivariant; src SS line 1512; none |
| §1.6 B*G | G=1; G=C_p over ℕ; G=(ℤ/p^r) | G*_n=C_p^{n+1}; B*G_n has π₁=C_p, π_{≥2}=0 | π₁(BG)=(ℤ/p^r)_r, lim=ℤ_p, not constant | src SS line 1833; locator R07 |
| §1.7 full faithfulness | G′=C₂, G=S₃ | \|Hom(C₂,S₃)\|=4 | strict pointed maps BC₂→BS₃: 4 (fixed by 1-simplices); homotopy classes 4 | src SS line 1866; none |
| §1.8 maps into BG | X=cS¹, G=C₃; X=cS², any G | Hom(ℤ,C₃)=3; Hom(1,G)=1 | [S¹,BC₃]_*=3; [S²,BG]_*=1 | src SS line 1912; none |
| §1.9 classifying morphism | point; cS¹; cS² | π_{≥2}=0, 0, π₂=ℤ | c_X iso, iso, not iso | src SS lines 1953–1964; none |
| §2.1 Mat | diagram *→{0,1}, *↦0; cK with K two points | Tot₀ has 2 tuples, Tot₁ has 1 ((*,0)) | π₀(Mat cK)=2 | Checks hold; src I01 lines 637–653 |
| §2.2 and `finiteAbelianHigherLimits` | constant ℤ/2 over ℕᵒᵖ; ℤ/2ⁿ with projections; ℤ/2 with zero maps; finite subsets of ℝ with (ℤ/2)^F; negative controls ℤ ←×2 ℤ and n=0 | lim¹ = 0, 0, 0 (zero maps: (a_n) ↦ (a_n) is onto) and 0 by the A* argument | ℤ←×2ℤ: lim¹=ℤ₂/ℤ≠0 (finiteness needed); n=0: lim⁰=ℤ/2≠0 (hn needed) | true; src SS line 1573; headline status R02 |
| §2.3 Theorem A.8 | B(C_{p^r}); B(ℤ ←×2 ℤ) | π₁^top=ℤ_p, lim¹=0, path-connected | π₀(holim)=lim¹=ℤ₂/ℤ: disconnected, so the profinite hypothesis matters | src SS line 1611; none |
| §2.4 Cyl₂ | X={x₀,x₁}; X={x₀,x₁,a} | Cyl₂=X (2 vertices); 4 vertices, 1 nondegenerate edge | horn Λ²₀ (0→1, 0→0) needs edge 1→0: absent, not a Kan fibration | README correct; SS line 1652 erratum below |
| §2.5 transport | (BC₂,BS₃); (S¹,BC₃) | orbit of (12) = {(12),(23),(13)}, size 3 | C₃ abelian: orbits of size 1 | src SS lines 1675, 1713; none |
| §2.6 orbits = unpointed | X=BC₂, Y=BS₃ | 4 pointed classes | 2 S₃-orbits = 2 conjugacy classes of homomorphisms | src SS line 1683; none |
| §2.7 pointed lift | Y=BC_p with an automorphism; Y=B(ℤ←×2ℤ) | profinite case: Mat connected, lift exists | non-profinite case: Mat disconnected, hypothesis fails | src SS line 1693; none |
| §2.8 relative surjection | B=BC₂; Y=BS₃ (sign); X=BC₃ (trivial map) | 3 pointed relative maps | 2 unpointed relative maps | surjective; src SS line 1736 |
| §2.9 relative isomorphism | X=Y=BS₃ over BC₂ | 6 pointed relative automorphisms (Inn S₃) | 1 orbit = Out(S₃) trivial | consistent; none |
| §2.10 Δ-orbits | instance of §2.8 | S_X=C₂, Δ=S₃: 2 orbits | geometric kernel A₃: 3 orbits | matches Layer 4 Examples; none |
| §3.0a completion | trivial; constant ℤ; constant S₃; (C_{p^r}) | 1 element; Hom_cont(ℤ̂,C₂)=2 | Hom(ℤ,C₂)=2; S₃ unchanged (finite); pro-system unchanged | true, but duplicates Mathlib in the constant case (R03) |
| §3.1 rigid covers | k algebraically closed; A¹_ℂ→Spec ℂ | connected étale separated over k is Spec k: 1 lift | ordinary pullback: 1 component; rigid: one copy per geometric point (infinitely many) | src IEt lines 599–633; locator R07 |
| §3.2 rigid hypercovers | Čech nerve of Spec k′→Spec k; empty augmented object | U₁ = U₀×U₀ matching | U₀=∅ is not surjective onto nonempty X | src IEt line 740; none |
| §3.3 Et | Spec k^sep; F_q; simplicial BC_p | point; BẐ with π₁=(ℤ/n)_n | diag π₀ = BC_p (π₁=C_p); X₀ alone gives π₁=1 | src IEt lines 340–352; none |
| §3.4 cohomology | Spec ℂ; Spec ℝ with ℤ/2 and with ℤ | H⁰=ℤ, higher 0; H^m(BC₂;ℤ/2)=ℤ/2 for all m | H^m_et(Spec ℝ,ℤ/2)=H^m(C₂,ℤ/2)=ℤ/2; H²(C₂,ℤ)=ℤ/2 = H²(BC₂;ℤ) | true including non-torsion A; locator R07 |
| §3.5 raw vs finite π₁ | Spec F_q; Spec k | completion of raw π₁ = Ẑ = π₁^SGA1 | Et(Spec k) ≃ BG_k | src SS lines 228, 373; locator R07 |
| §3.6 finite étale base change | Spec ℂ⊔Spec ℂ → Spec ℂ with X=A¹; Spec ℂ→Spec ℝ | Et(A¹⊔A¹): 2 contractible components | Et(A¹)×2 points; EC₂→BC₂ of degree 2 | src SS lines 237, 269; locator R07 |
| §3.7 Galois transport | k=ℝ, X=Y=Gₘ, A=ℤ/3 | H¹(Gₘ,ℂ;ℤ/3)=Hom(Ẑ(1),ℤ/3), conjugation acts by −1 | the transported isomorphism must commute with −1 (an abstract isomorphism need not) | src SS line 288; none |
| §3.8 elementary fibration | Gₘ×Spec k → Spec k (char 0); P¹×Y→Y | kernel Ẑ(1), π₂(Y)=0: short exact, split by 1∈Gₘ(k) | P¹ fibres are not affine: not elementary | src SS lines 434–462; none |
| §3.9 products, effacement | Gₘ×Gₘ over ℂ; Y₂=Spec k; P¹; Spec k | π₁=Ẑ²; fibre product over G_k with G_k = π₁(Y₁) | H²(P¹,ℤ/2)=ℤ/2 survives all (trivial) covers; F_p-dimensions 1,2,1, H² class dies under (z^p,w^p) | true; src SS lines 414–432, 474–478, SGA1 line 12282; R08, R09 |
| §4.0a strongly center-free | S₃; 1; ℤ₂; Q=C₂, G=C₂, H=C₂×C₂ | Z(A₃)=C₃≠1, so S₃ is excluded; 1 admitted; ℤ₂ excluded | relative homomorphisms (0,t),(t,t): 2, kernel conjugation trivial: 2 classes | Checks hold; src SS line 326; none |
| §4.0b open image | Spec k′, [k′:k]=d separable; purely inseparable k′; Spec ℚ(i) over ℚ | image G_{k′}, index d; index 1 | index 2: not surjective | true; SS line 365 asserts without proof; R10 |
| §4.1 pointed lifting | k=ℂ, X=Spec ℂ, Y=Gₘ | Hom(1,Ẑ)=1 pointed | 1 unpointed | surjective; src SS line 329 |
| §4.2 isomorphism lift | k=ℝ, X=Y=Gₘ,ℝ, identity | pointed identity | lifts | src SS line 340; none |
| §4.3 geometric orbits | k=ℝ, Y=Gₘ,ℝ, X=Spec ℝ | sections (a,c) of Ẑ(1)⋊C₂: all a∈Ẑ(1) | Ẑ(1)-conjugation gives a ↦ a+2b: 2 orbits = H¹(C₂,Ẑ(1)) (points 1, −1) | surjection; bijection not claimed since C₂ is abelian; src SS line 342 |
| §4.4 orbit bijection | BC₃/BS₃ over BC₂ model; G_k=C₂ | stabilizer C₂≠1, Δ=S₃ | 3 geometric orbits vs 2 unpointed classes | center hypothesis necessary; src SS line 352 |
| §4.5 outer map | k=ℂ, X=Y=Gₘ, z ↦ zⁿ | Hom_out(Ẑ,Ẑ)=Ẑ | the map induces multiplication by n | agrees with the scheme map; src SS line 384 |
| §4.6 open image | z ↦ zⁿ, n≠0; constant map | image nẐ, open | image 0, not open: excluded | src SS line 396; none |
| §4.7 product maps | k=ℂ, Y₁=Y₂=Gₘ, X=Gₘ; X=∅ | Hom(Ẑ,Ẑ²)=Ẑ² | Ẑ×Ẑ; empty source: 1=1×1 | src SS line 467; none |
| §5.1 evaluation | T=pt with A¹; T=∅; T≠∅ with X=∅; T=[0,1] with Gₘ | ℂ=ℂ; Spec 0=∅: 1=1; 0=0 | 1+t ≥ 1 is a unit; t vanishes at 0, not a unit | Checks hold; FGV not readable |
| §5.2 Betti diagonal | constant A¹; simplicial BC_p | Sing ℂ contractible; D has \|ℂ\| components | diagonal BC_p, π₁=C_p | none |
| §5.3 smooth descent | {0,1}→*; A¹→pt | Čech degree n: 2^{n+1} points | realization contractible; (A¹)^{n+1} contractible | true; R14 for the second assertion |
| §6.1 p-finite | ∅; 2 points; BC_p; BC_q; ∏K(F_p,n); BS₃ at p=3 | 0 and 2 components, admitted; BC_p admitted | BC_q excluded; no truncation bound; S₃ is not a 3-group | src BHH line 2427; none |
| §6.2 p-completion | BC_q (q≠p); 2 points; ℕ | H^{n≥1}(C_q;F_p)=0, Hom(C_q,P)=1, so contractible | 2 components kept; βℕ as a profinite set | none |
| §6.3 model comparison | K=BC_q | completion contractible | a constant space is not p-profinite | src BHH lines 2505–2512; none |
| §6.4 Et_p | Spec ℂ; ∐_ℕ Spec ℂ | H⁰=F_p; H⁰_et=F_p^ℕ (cardinality 𝔠) | Mat has π₀=βℕ, H⁰ = F_p^{βℕ} (cardinality 2^𝔠) | Check holds; none |
| §6.5 finite type | K(ℤ/p,2)^; BC_p | H⁰=F_p, H¹=0, finite: H² map F_p→F_p identity | H¹(BC_p)=F_p≠0: hypothesis fails | src DAG13 lines 3708, 3736, 4146; R13 |
| §6.6 graded realization | ∐_ℕ Spec ℂ graded; no grades | discrete ℕ, H⁰=∏F_p=F_p^ℕ | ∅ | none |
| §6.7 zigzag | Spec ℂ; BC_p | 1 ↦ 1 on H⁰ | BC_p at both ends, H¹ identity | none; R14 |
| §6.8 mod-p comparison | P¹_ℂ, p=2; BC_p | H^*_et = F₂, 0, F₂ | H^*(Sing P¹;F₂) = F₂, 0, F₂ | holds; FGV not readable |
| §6.9 automorphisms | conjugation on Gₘ; σ, τ on A¹ points | i ↦ −i; loop of degree −1; action −1 on Ẑ(1) | z ↦ σ(τ(z)) | Checks hold; FGV not readable |

Binder audit: `#check @TauCetiRoadmap.EtaleHomotopyTypes.finiteAbelianHigherLimits` in a scratch copy elaborates to exactly the README §2.2 hypotheses (I, `SmallCategory`, `IsCofiltered`, `HasInjectiveResolutions (I ⥤ AddCommGrpCat)`, A, finiteness, n, 0<n). There is no section `variable`; nothing was dropped and nothing changed.

## Verified sound

- **Sources, seeded sample (15 targets) and flagged items.**
  - §0.2: I01 lines 412–437 (Defs 6.1–6.3, Thm 6.4).
  - §1.8: SS line 1912 (Prop. A.16).
  - §2.1: I01 lines 637–653 (Prop. 8.2, Cor. 8.3, Prop. 8.4) and SS lines 1602–1607.
  - §2.6: SS line 1683 (Thm A.10).
  - §2.8: SS lines 1736–1742 (Thm A.13(a)).
  - §3.0a: SS lines 369–375.
  - §3.4: SS line 288 (Prop. 2.3); IEt lines 271 and 331–333 (locator repaired in R07).
  - §3.5 (R07).
  - §3.6: SS lines 237, 269.
  - §3.7: SS line 288.
  - §3.9: SS lines 414–432 and 474–478; SGA1 line 12282 (XIII Prop. 4.6, hypothesis (a) = strong desingularizability, matching the README).
  - §4.0b: SS lines 361–366.
  - §4.6: SS lines 391–400.
  - §6.1: BHH lines 2427–2434 and 2454–2498.
  - §6.8: FGV, not readable (uncertified).
  - Also checked beyond the sample:
    - SS: Lemma A.7 (line 1573), Thm A.8 (1611), A.4/A.5/A.6 (1493–1525), A.14/A.15 (1833, 1866), Def. A.17/Cor. A.18 (1953);
    - I01: Cor. 7.5 (578), Prop. 18.4 (1658);
    - IStr: Thm 4.15 proof and Remark 4.16 (494–539);
    - IEt: Defs 5.1–5.3, Prop. 5.5, Defs 6.2–6.4 (599–640, 740–760);
    - DAG13: Def. 3.3.2, Prop. 3.3.8, Thm 3.4.12 (3708, 3736, 4146).
  - In total 15 sampled targets plus 17 further locators. Every hypothesis matched except where noted in R07 and R08.
- **Library declarations opened at the pins (file:line).**
  - Mathlib: `SSet` (SimplicialSet/Basic.lean:33); `SSet.KanComplex` (KanComplex.lean:40); `hornFilling` (:45); `HomotopicalAlgebra.ModelCategory` (ModelCategory/Basic.lean:43); `TopCat.toSSet`, `toSSetObjEquiv`, `SSet.toTop`, `sSetTopAdj`, `toSSetIsoConst` (SingularSet.lean:50, 56, 65, 73, 97; the last assumes `TotallyDisconnectedSpace` only); `Scheme.smallEtaleTopology` (Sites/Etale.lean:50); `Sheaf.H` (SheafCohomology/Basic.lean:56, needs `HasSheafify` and `HasExt`); `Functor.rightDerived` (:108); `Limits.lim` (:555); `additive_of_preserves_binary_products` (:231); `ContinuousMap.evalAlgHom` (Algebra.lean:853); `compRightAlgHom` (:700); `Ind` (Indization/Category.lean:70); `Functor.diag` (Products/Basic.lean:292); `Functor.uncurry` (Currying.lean:37).
  - Tau Ceti: `LocalCoefficientSystem` and its `pullback`, `pullbackIdIso`, `pullbackCompIso`, `transport` (LocalCoefficient.lean:43, 75, 102, 136, 252); `exists_forall_map_eq_of_compact_t2`/`_of_finite` (InverseSystem.lean:78, 96); `IsTopologicallyFinitelyGenerated` (Generation.lean:73); `IsProP.exists_continuousMulEquiv_pi_padicInt_prod_pi_zmod` (StructureTheorem.lean:59, hypotheses as stated).
  - All Mathlib names were also elaborated with `#check` at the pin: 25 names, 0 errors.
  - Absence claims checked: no Pro category, no Galois category of schemes and no analytification in Mathlib/AlgebraicGeometry; no `FiniteEtaleScheme` or étale π₁ in Tau Ceti; no locally connected instance for noetherian schemes. The docstring's "not statable" list is accurate apart from the R03 wording.
- **Cross-roadmap citations resolved** (13 suppliers, all found):
  - On main: AdicSpacesPartII R0.19.9 (line 7793, carrier `(Ind Cᵒᵖ)ᵒᵖ`, double-limit Hom); PerfectoidSpaces P6.10 (14654); AlgebraicTopology Stages 6, 8 (946, 1602); Completed/UniversalCovers Stages 2–4; Orbifolds O4-N item 3 (line 314 ff., numerable surjective submersion Čech descent); EnhancedDerivedSheaves E0.2–E0.5, E0.8, E2.6 (191–376, 2293; bounded-below descent at E2.6 line 27); SchemeAndStackFoundations 0.9–0.12, 2.10, 2.15 (848–969, 3631, 3867); EtaleCohomologyFoundations F.0.2, F.0.4, F.0.A2, F.2.6 (200, 248, 368, 645); ProfiniteProPGroups Layers 0, 3, 4.
  - At open heads: DiamondsAndVStacks D0.13 (1256); StableHomotopyKTheory 1.19–1.23, 1.28–1.34 (305–488); ComplexComparisonPartII C−1.1, C5.1, C6.1–C6.3 (700, 2338, 4048–4169); ResolutionOfSingularitiesCharacteristicZero 5.1, 5.2, 6.1, 6.2 (673–771).
  - Downstream roadmaps exist: InverseGaloisAndArithmeticFundamentalGroups and AnabelianGeometryAndNonabelianChabauty (open pull requests); MotivicEtaleKTheory (open pull request and board); EllAdicHomotopyTypesAndWeights and ArithmeticKTheoryPartII (board packages).
  - All suppliers are earlier in ORDER.txt or on main; the depcheck agrees.
- **Supply direction and declared gaps.**
  - `surjective-nerve-fibration` is precise, minimal and statable by StableHomotopyKTheory, which has the groupoid-nerve material (§1.33) but not this criterion.
  - The eight named gaps appear with identical slugs in the README and the plan.
  - The package owns real content: 55 targets, every one with exactly one Needs line (checked by script); every definition has an API list and at least 3 Checks; every layer ends with Examples and Dependencies.
- **Ownership by object.**
  - Searched main, 346 open roadmap pull requests and the board packages for rigid hypercovers, étale topological type, strongly center-free, p-finite spaces, pro-simplicial sets, derived limits of finite systems, profinite completion of pro-groups and Kan–Quillen.
  - No other owner of the étale-homotopy objects; AnabelianGeometry and InverseGalois are consumers.
  - Duplications found: R03 and R04 (Kan–Quillen, Mathlib derived limits, twisted cohomology, `complexSchemeAnalytification.smooth`).
  - The fully qualified name `TauCetiRoadmap.EtaleHomotopyTypes.finiteAbelianHigherLimits` occurs in no other roadmap.
- **Policy.** No LaTeX delimiters; no pull-request numbers; no `set_option`; a single `import Mathlib`; `theorem` only; the module docstring has the required form.

## Not verifiable

- FGV (Appendix A.2.1–A.2.3, Lemma A.7, Example A.10; §§5.1–5.3, 6.2–6.9): paywalled, settled as `uncertified`. Statements were checked only for internal consistency and on the instances in the table.
- BK XI 5.2, XI 7.1, IX 5.1, IX 5.4 (§2.3); AM Thms 4.3 and 11.1 (§§3.5, 3.9); Fr Prop. 5.9 and Thm 11.5 (§§3.4, 3.8): uncertified, settled, not read.
- SGA5 I 3.1.5 (definition of strong desingularizability) was not read. Whether ResolutionOfSingularitiesCharacteristicZero §§5.1–6.2 give exactly that property was checked only at section-title level.
- Isaksen's published correction (IStr as published, Remark 4.14) was not read; the arXiv v1 Remark 4.16 was.

## Source issues

- **Error** in SS at Appendix A.2.3, p. 858 (SS line 1652): the source says the projection from the relative cylinder X∧I to X is a trivial fibration; it should say a weak equivalence (over a third unmarked point the fibre is Δ[1], which is not Kan); affects nothing.
- **Misprint** in SS at the proof of Theorem A.8, p. 857 (SS line 1619): the source labels the product over chains of length n as Tot_n; it should be the n-th cosimplicial degree, with Tot_n its partial totalization; affects nothing.
- **Misprint** in SS at the proof of Theorem A.13, p. 861 (SS line 1782): the source writes the loop group at the point x of Y; it should be the loop group at y; affects nothing.
- **Gap** in SS at the proof of Proposition 2.4(c), p. 825 (SS line 365): the source asserts that the image of the arithmetic fundamental group in G_k is open without argument; it should cite finiteness of the components over k̄ and their open stabilizer; affects the proof.
- **Misprint** in DAG13 at Theorem 3.4.12, p. 92 (DAG13 line 4146): the source introduces a field k of characteristic p that never appears; it should omit that clause; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "a872370", "job": "REV-PKG-EtaleHomotopyTypes", "model": "opus", "worker": "fable-rev77"} -->
