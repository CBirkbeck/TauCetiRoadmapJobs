<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1658#issuecomment-6406939745 -->
Red team round 1 pass b (claude) of 7d8ff96

Verdict: needs_changes

1. **F01** (P2) Smoothness of tame fixed loci is attributed to a supplier section that does not state it

   Location: `packages/SheafTheoreticSmithTheory/README.md:63` ("Section 7.3 supplies tame fixed subschemes on smooth pieces"), `:1051` ("A tame finite-order automorphism has smooth fixed subschemes on a smooth stratum"), `:1053` (*Needs:* "EtaleDualityAndPerverseSheaves §7.3").

   Claim: §5.4's costalk computation uses smooth-pair purity for `Y^σ ∩ (stratum) ⊂ stratum`, so it needs the fixed subscheme of a tame automorphism of a smooth scheme to be smooth; the README says EtaleDualityAndPerverseSheaves §7.3 supplies this.

   Witness: EtaleDualityAndPerverseSheaves §7.3 at its open head (*Tame fixed subschemes*, target `tameFixedSubschemeNormalCone`) proves `Fix(N_Z(g)) = Z` and the absence of almost-fixed points, and says explicitly that neither smoothness of `X` nor reducedness of `Z` is required; no smoothness of `Z` is asserted anywhere in that section (grep of the section for "smooth", "tangent", "regular" finds only that disclaimer). The statement is owned by an earlier roadmap: ReductiveGroupsPartII §RG2.0a, *Edixhoven's tame fixed-point theorem* (`WeilRestriction.smooth_fixedPoints`), which states that the fixed scheme of an action of a finite group of order invertible on the base, on a smooth scheme, is smooth over any base.

   Repair: in the EtaleDualityAndPerverseSheaves contract (line 63) replace "Section 7.3 supplies tame fixed subschemes on smooth pieces." by "Section 7.3 supplies the full tame fixed subscheme and its normal-cone fixed points; smoothness of the fixed subscheme of a tame action on a smooth scheme is ReductiveGroupsPartII §RG2.0a, *Edixhoven's tame fixed-point theorem* (`WeilRestriction.smooth_fixedPoints`)." In §5.4's proof route (line 1051) after "its tangent is the fixed tangent subspace" add "(ReductiveGroupsPartII §RG2.0a, `WeilRestriction.smooth_fixedPoints`, applied to the open affine pieces of the stratum)". In §5.4's *Needs:* (line 1053) add "ReductiveGroupsPartII §RG2.0a" before "EtaleDualityAndPerverseSheaves §7.3". Add ReductiveGroupsPartII §RG2.0a to the Layer 5 Dependencies line and to the ReductiveGroupsPartII supplier contract (line 95). Tested on the instance that motivated the check: scalar rotation `x ↦ ζx` on `A¹` has fixed scheme `Spec F[x]/((ζ−1)x) = {0}`, smooth of codimension 1, tangent space the ζ-fixed subspace `0`; the §5.4 purity shift `i^! = i^*(−1)[−2]` then applies.

2. **F02** (P2) The exotic-tilting equivalence of MR18 Theorem 1.1 is restated without its hypotheses

   Location: `packages/SheafTheoreticSmithTheory/README.md:816` ("In the complex model the equivalence sends E_λ to the exotic tilting with label −λ and [1] to grading shift ⟨−1⟩ (MR18 Theorem 1.1, p.3 …)") and `:818` ("Use MR18 Theorem 1.1: the mixed/parity affine-Grassmannian category is related to the exotic coherent category …").

   Claim: the perversity engine is the equivalence Parity_(Ǐ)(Gr,F) ≅ Tilt(E^{G×G_m}(Ñ)) with the stated grading and label conventions, "at its full stated generality".

   Witness: MR18 line 20–23 (§1.1, p.2): the equivalence is proved for `G` a product of simply connected quasi-simple groups and general linear groups, with `p` very good for each quasi-simple factor; the good-prime perversity for arbitrary Ǧ is Corollary 1.6 (MR18 line 273) obtained in §6.5 by the central-isogeny and product reductions. The README names the reductions but never states the hypotheses of the theorem being transported, so a reader builds §4.5 "at its full stated generality" with the wrong hypothesis set (good instead of very good; arbitrary reductive instead of the restricted class).

   Repair: at line 816 replace "In the complex model the equivalence sends E_λ to the exotic tilting with label −λ and [1] to grading shift ⟨−1⟩ (MR18 Theorem 1.1, p.3, MR18 line 105)." by "In the complex model, for a dual group whose derived group is a product of simply connected quasi-simple groups and general linear groups and for p very good for each quasi-simple factor, the equivalence sends E_λ to the exotic tilting with label −λ and [1] to grading shift ⟨−1⟩ (MR18 §1.1, p.2, MR18 line 20; Theorem 1.1, p.3, MR18 line 105). Perversity for every Ĥ with p good is then deduced by the central-isogeny and product reductions (MR18 Corollary 1.6 and §6.5, MR18 line 273)." Tested on Ĥ = PGL₂ at p = 3: 3 is good for A₁ but PGL₂ is not simply connected; the theorem is applied to SL₂ (very good: 3 ∤ 2) and perversity for PGL₂ follows by the central isogeny SL₂ → PGL₂, which is the route §6.5 of MR18 takes.

3. **F03** (P2) gap:finite-highest-weight-ideals asks LanglandsParameterStacks for what LP3.0 already states

   Location: `packages/SheafTheoreticSmithTheory/README.md:103` and `packages/SheafTheoreticSmithTheory/design/plan.json` gap `finite-highest-weight-ideals` ("with Hom(Δ(λ),∇(μ)) equal to the coefficient field for λ=μ and zero otherwise, all higher Δ-to-∇ Ext vanishing, …").

   Claim: these Hom/Ext computations are missing from the supplier.

   Witness: LanglandsParameterStacks §LP3.0 at its open head defines `Δ_λ = H⁰(−w₀λ)^*` and states as a target that `H^i(G, ∇_λ ⊗ ∇_μ)` is `k` for `i = 0`, `μ = −w₀λ` and zero otherwise (Jantzen II.4.13). Since `Ext^i_G(Δ_λ, ∇_μ) = H^i(G, ∇_{−w₀λ} ⊗ ∇_μ)`, this is exactly Hom(Δ(λ),∇(μ)) = k for λ = μ, 0 otherwise, and Ext^i = 0 for i > 0. The gap is therefore not minimal.

   Repair: in both the README contract and the plan gap, replace the `needs` by "Provide the finite saturated highest-weight-ideal subcategories associated to LP3.0 (finite-dimensional modules all of whose weights lie in a finite saturated set of dominant weights), existence in each of the indecomposable tiltings T(λ) with both filtrations, finite standard-to-tilting resolutions, and compatibility with field extension; the Hom and Ext computation between Δ(λ) and ∇(μ) is LP3.0's own target and is consumed, not requested." Tested on dual SL₂, p = 3, ideal {0,1,2,3}: Hom(Δ(3),∇(3)) = k and Ext¹(Δ(3),∇(1)) = 0 come from LP3.0; the resolution 0 → Δ(3) → T(3) → Δ(1) → 0 (dimensions 4 → 6 → 2) is what the narrowed gap still asks for.

4. **F04** (P2) "the étale transport theorem" is cited by seven targets but is not a target

   Location: `packages/SheafTheoreticSmithTheory/README.md:799` ("These proof inputs are the explicit transport contract the étale transport theorem."), `:816`, `:850` ("via the étale transport theorem"), `:1112`, `:1178` ("the uniform adic and étale transport theorems for O"), `:1199`, `:1244` ("The étale transport theorem includes proving the stated graded comparison").

   Claim: a theorem transporting the complex-topological parity, integral Tate Hom, lifting, Frobenius-form and semi-infinite-geometry statements of JMW14, JMW16, LL21 and MR18 to étale sheaves on the equal-characteristic Grassmannian over separably closed F exists in this roadmap.

   Witness: no bold target, section title or API bullet in the README is called "étale transport" or states this; grep for "transport" gives only the seven consuming phrases above (plus "transport the form" in §5.7). Seven proof routes rest on an undefined named theorem, and §4.4's sentence is not grammatical, so a reader cannot tell which section carries the obligation.

   Repair: add to §4.4, after the first paragraph, the target "**Étale transport.** For a finite L^+H-stable Schubert union Y ⊂ Gr_H over a separably closed F of characteristic ≠ p, with the orbit stratification and constant local systems, and Λ = k or O: the JMW stratification condition, existence and uniqueness of normalized parity extensions, the graded integral Tate Hom formula with its composition law (§4.7), the lifting functor (§4.12), the semi-infinite dimension and support statements (§6.2) and the prime-field form compatibilities (§5.7) hold in D^b_c(Y_ét; Λ) with the same proofs as in the complex topology, using proper base change, smooth base change, Künneth and purity of EtaleCohomologyFoundations §§F.2–F.3, F.5–F.6 in place of their topological counterparts (Feng24, Remark A.1, p.58, Feng24 line 2628; Theorem 4.8 proof, p.23, Feng24 line 1000)." Then replace each of the seven phrases by "§4.4, *Étale transport*", and rewrite line 799 as "These proof inputs are the content of §4.4, *Étale transport*." Tested on the P¹ instance of §4.7: End_T(O_{P¹}[1]) = k ⊕ k·h with h ∈ H²(P¹_ét; k) = k(−1) (Tate twist trivial over separably closed F), h² ∈ H⁴ = 0, the same values as in the complex topology.

5. **F05** (P3) Wrong Feng24 line for the §4.2 convention cited in §0.3

   Location: `packages/SheafTheoreticSmithTheory/README.md:177` ("Feng24, §4.2, p.20, Feng24 line 656").

   Claim: the parenthesized-subscript convention "(L^+G) means orbit constructibility after forgetting equivariance" is at Feng24 line 656.

   Witness: Feng24 line 656 is in §3.2 (p.15, the equivariant bounded derived category); the parenthesized-subscript convention is Feng24 line 900–901 (§4.2, p.20: a stratification arising from the orbits of a group is denoted with a parenthesized subscript).

   Repair: replace "Feng24, §4.2, p.20, Feng24 line 656" by "Feng24, §4.2, p.20, Feng24 line 900".

6. **F06** (P3) Stacks line locator attached to the wrong chapter in §0.6

   Location: `packages/SheafTheoreticSmithTheory/README.md:248` ("Tag 051E (Lemma 10.101.3), Stacks line 5207").

   Claim: Lemma 10.101.3 is at line 5207 of the Stacks extraction.

   Witness: line 5207 is Lemma 21.46.3 (tag 08G1) in the Cohomology on Sites chapter extraction (sha256 f1af633…); Lemma 10.101.3 (tag 051H, inside section 051E) is line 11356 of the Algebra chapter extraction (sha256 b035a1f…), the one the References line 1578 cites for 051E at line 11331.

   Repair: replace "Tag 051E (Lemma 10.101.3), Stacks line 5207" by "Tag 051E (Lemma 10.101.3, tag 051H), Stacks line 11356", and give the 08G1 and 0DJJ tags their own lines "Stacks line 5207" and "Stacks line 5300" in the same parenthesis.

7. **F07** (P3) `hpA` is unused in both headline theorems

   Location: `packages/SheafTheoreticSmithTheory/Suggested.lean:57` and `:68` (`(hpA : (p : A) = 0)`), docstrings at `:53` ("of characteristic p") and `:64`; `packages/SheafTheoreticSmithTheory/README.md:1453` and `:1493` ("For a commutative F_p-algebra A").

   Claim: the Tate diagonal and the unique character extension need `A` to be an F_p-algebra.

   Witness (instance showing the statements hold without it): A = ℤ, σ = id, p = 2. Then fixedSubring = ℤ, cyclicNorm a = a², cyclicTransfer a = 2a, transferIdeal = (2), and δ: ℤ → ℤ/2, a ↦ [a²] = [a] is the unique ring homomorphism of `algebra_tate_diagonal`. With κ = F₂, S = ℤ, χ = reduction (χ(2a) = 0), the unique extension in `tate_character_extension` is χ itself. In general: Nm(a+b) − Nm(a) − Nm(b) is the sum over free C_p-orbits of nonconstant words, each orbit sum a transfer, in any commutative ring; the uniqueness argument uses only char κ = p, perfectness and linear independence of characters. Neither proof route in §§8.1–8.2 uses p·1 = 0 in A.

   Repair (optional, P3 note): delete `(hpA : (p : A) = 0)` from both declarations, change the docstrings to "For a commutative ring A and a p-periodic automorphism" and "… extends uniquely to the whole ring if it kills transfers and the target is a perfect field of characteristic p", and in §§8.1–8.2 replace "For a commutative F_p-algebra A" by "For a commutative ring A (the F_p-algebra case is the one applied)"; keep the Conventions sentence about p·1 = 0 only if the hypothesis is kept.

8. **F08** (P3) gap:integral-tilting-lifts asks for finite free integral standards that ReductiveGroups §10B supplies

   Location: `packages/SheafTheoreticSmithTheory/README.md:105` and plan gap `integral-tilting-lifts` ("split highest-weight O-orders with finite free standards/costandards, …").

   Witness: ReductiveGroups §10B on main ("State induced/Weyl base change and integral Weyl lattices with their actual freeness and action equations"; "D_τΔ(λ) ≃ ∇(λ), natural biduality and the perfect integral evaluation pairing") already provides finite free Δ_O(λ), ∇_O(λ) by base change from ℤ. The gap's single sentence also bundles nine distinct obligations.

   Repair: in the README contract and the plan gap, begin the `needs` with "Using the finite free integral Weyl and induced lattices of ReductiveGroups §10B as standards and costandards," and delete "with finite free standards/costandards"; split the remainder into two gaps, `integral-highest-weight-orders` (Hom/Ext over O, finite projective generators, complete Hom modules) and `integral-tilting-lifts` (existence of lifts, Hom base change, idempotent lifting, detection and the reduction bijection, compatibilities), each with its own one-sentence `needs`.

9. **F09** (P3) The field classification of tilting modules is cited to a secondary source

   Location: `packages/SheafTheoreticSmithTheory/README.md:653` ("JMW16, §1.1 and Theorem 1.1, p.1, JMW16 line 24") and `:655` ("The field classification is the cited JMW16 theorem").

   Witness: JMW16 line 24 states Theorem 1.1 as a recalled result (existence and uniqueness of T(λ), attributed there to Ringel and Donkin); JMW16 does not prove it.

   Repair: keep the JMW16 locator and add the primary source by locator (Ringel 1991, Math. Z. 208, or Donkin 1993, Math. Z. 212; or Jantzen, Representations of Algebraic Groups, Part II, Chapter E) to `sources.toml`, recorded `uncertified` if only paywalled copies exist, and cite it at line 653 after the JMW16 locator.

Scope of the pass: the whole of `packages/SheafTheoreticSmithTheory/README.md` (1580 lines, 65 bold targets in 9 layers) and the whole of `packages/SheafTheoreticSmithTheory/Suggested.lean` (79 lines, 6 declarations), read line by line; every cross-roadmap citation resolved on main or at the cited open head; every library locator checked at the pins; every source line locator opened in the cached extraction; the dependency gate run. No file outside this report and the scratch worklist was written; no Lean was run (the brief gives no Lean command for this pass; the elaborated signatures supplied with the job were used instead and compared with §§8.1–8.2).

The settled finding F01 of the last repair report (plan gaps G1–G5 with supplier `none`) is not re-raised: the reason given there is correct under the package rules (a package may only append to the plan's `gaps` list; it cannot reclassify or delete the five design-stage records), so the disposition is a human/design-owner action, not a package defect.

## Verified sound

- Declarations read: 6 of 6 (`fixedSubring`, `cyclicTransfer`, `cyclicNorm`, `transferIdeal`, `algebra_tate_diagonal`, `tate_character_extension`). Each elaborated type in the supplied signatures file was compared with §8.1/§8.2: binders agree; no section variable was lost; `σ ^ p = 1` uses the pinned `Group (RingAut R)` instance (`Mathlib/Algebra/Ring/Aut.lean:39`); `RingHom.eqLocus` is at `Mathlib/Algebra/Ring/Subring/Basic.lean:867`. Both theorems are true as typed (proofs sketched in R07; the orbit argument needs p prime, supplied by `[Fact p.Prime]`, and the n = 4 control of §8.1 confirms primality is used). Not padding: both are the roadmap's algebraic headlines; the four definitions are the minimal native-carrier definitions needed to state them. No `lemma`, no `set_option`, single `import Mathlib`, no sorry'd data, no `True` placeholder.
- Targets read: 65 of 65 (0.1–0.6, 1.1–1.6, 2.1–2.10, 3.1–3.5, 4.1–4.12, 5.1–5.8, 6.1–6.9, 7.1–7.6, 8.1–8.3); every target has a locator; no pull-request numbers or process words in README or docstrings.
- Headline coverage: the sheaf, Satake, parity, norm, constant-term, descent and integral headlines are correctly declared not statable (no enhanced equivariant étale categories, affine Grassmannians, perverse/parity categories, rational representations of reductive group schemes or Tate quotients exist at the pins); the two algebraic headlines are stated. Nothing statable is missing.
- Library locators verified at the pins (17): `WittVector.isDiscreteValuationRing` (DiscreteValuationRing.lean:148), `quotientPEquiv` and `isAdicCompleteIdealSpanP` (Complete.lean:105,116), `Module.free_of_flat_of_isLocalRing` (LocalRing/Module.lean:299, with `[Module.Finite]` and `[Flat]`), `tateCohomologyFunctor`/`tateCohomology` (TateCohomology/Basic.lean:140–146), `frobeniusEquiv` (Perfect.lean:121), `linearIndependent_monoidHom` (LinearIndependent/Basic.lean:502, `[MulOneClass G] [CommRing L]`), `RingHom.eqLocus` (:867); Tau Ceti `H0IsoNormQuotient` (LowDegree.lean:151), `tateCohomologyIsoEven/Odd` (Periodic.lean:167,200), `periodicIsoOfGenerator` (:302) and its two composition identities (:322,332), `periodicIso` (:346, chooses a generator, as the README says), `isFinite_projection` and `isFinite_projection_of_finiteType` (Affine.lean:66,73). `FixedPoints.subring` exists at the pin (`Mathlib/Algebra/Algebra/Subalgebra/Operations.lean:98`) for a `MulSemiringAction`; the eqLocus definition is an acceptable specialisation for a single automorphism.
- Source line locators opened and verified: Feng24 62 of 62 cited lines (all land on the named definition, lemma, display or section except the one in R05); LL21 5 of 5; JMW14 4 of 4; JMW16 4 of 4 (Theorem 1.8 p.3 and Theorems 5.1, 5.3 p.16 also exist); MR18 2 of 2 (conventions Θ∘[1] ≅ ⟨−1⟩∘Θ and Θ(E_λ) ≅ T_{−λ} confirmed at lines 110–114); MV07 5 of 5 (Theorem 14.1 covers k = Q_ℓ, Z_ℓ, Z/ℓⁿ, F_ℓ over any algebraically closed base, so the k = F̄_p and W(k) extension is rightly a target here); Stacks 6 of 6 across the four chapter extractions (one misattached, R06); Braden03 1 of 1 (normal variety over algebraically closed k, weakly equivariant or T-constructible over C: the README's hedge is correct); TV16 2 of 2 (the twist convention W^(p) = W ⊗_{(k,Frob)} k with wλ⊗μ = w⊗λ^pμ and λ∗w = λ^{1/p}·w matches §8.3 exactly; (3.4.1) is the character bijection with the same proof as §8.2). Feng's BC = BC^(p) ∘ Frob_p^{-1} (line 1204) and CT_H[deg_H] = ⊕ Rp_ν! i_ν^*[⟨2ρ_H,ν⟩] (lines 2603–2609) match the README's direction and sign.
- Sibling and main citations resolved (14 roadmaps, 41 section/target citations): EnhancedDerivedSheaves §§0.1–0.4, E1.3, E1.4, E3.4, E5:abstract (stable quotients and idempotent completion are in E5:abstract.4, monoidal localization in E5:abstract.3); EtaleCohomologyFoundations F.1 (Tor amplitude and geometric-stalk criterion present), F.2–F.3, F.3.0 (dimension bound), F.5, F.6, 0.8, 0.10; SchemeAndStackFoundations §§0.23a, 1.17 (its gluing theorem is for projective Y, so the admissible gap is genuinely needed), 1.21, 1.23; ModularCurves 0C (free constant-group action with invariant affine cover, finite locally free quotient); ReductiveGroups Layers 1, 4, 9, 10A, 10B; DeformationAndDerivedPatchingAlgebra §7.5 (Kaplansky freeness without finite generation, nilpotent-ideal lifting); EtaleDualityAndPerverseSheaves §§0.1, 0.2, 2.2, 2.4, 2.5, 3.1 (O_E finite over Q_ℓ: the W(k) gap is needed), 3.2, 5.2 (`curveEulerPoincareSwan`, with the Artin–Schreier Check), 7.3 (but see R01); GlobalShtukasAndFunctionFieldLanglands §§1.1–1.3, 1.5, 1.8, 1.9, 1.14 at head 1490 (curve over a finite field; §1.14 over F̄_q with O_E: the geometric-field gap is needed); GeometricSatakeAndFusion GS0 `equalCharacteristicSchubertModels` (ordinary finite-dimensional Schubert models over F_q before perfection, as cited); ReductiveGroupsPartII RG2.0a *weil-restriction-separable-splitting*, RG2.5.1 *langlands-dual-group*, *galois-action-on-dual-group*, RG2.5.2 *dual-isogenies-and-products* (all present); LanglandsParameterStacks LP3.0 (but see R03); AInfCohomology §AI.7.2 `AInf.Trace.tateDiagonal` (spectral, as the Scope says). RefinedTraceMethods (later in the order) consumes that spectral diagonal and does not build the algebra one.
- Ownership by object (`roadmaps grep` on main and all open heads): "parity sheaf" and "equivariantization" occur nowhere else; "Smith" occurs only as a reference in SmoothRepresentationsOfLocalGroups and GlobalShtukas; hyperbolic localization is explicitly excluded from EtaleDualityAndPerverseSheaves (its scope line) and is built on diamonds/v-stacks in VStackSheavesAndLisseCategories and GeometricSatakeAndFusion, not for étale sheaves on schemes; tilting modules occur in GeometricSatakeAndFusion only as a consumer note. This roadmap is the owner of the sheaf Tate quotient, Smith operation, étale parity/Tate-parity theory, cyclic norm, BC and the algebra diagonal.
- Dependency gate: `tauceti-roadmap … gate --depcheck … --name SheafTheoreticSmithTheory --order … --movable` printed `depcheck: 56 roadmaps, 646 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line. `roadmaps resolve` on the README: no cross-roadmap citation and no Lean name found nowhere. `git diff --stat origin/main...HEAD` touches only `packages/SheafTheoreticSmithTheory/`.
- Declared gaps: all five named-supplier gaps have the same slug in `plan.json` and the README; `admissible-invariant-quotient-gluing`, `witt-adic-uniform-operations` and `grassmannian-arbitrary-geometric-field` are precise and not already provided (checked against SchemeAndStackFoundations 1.17, EtaleDualityAndPerverseSheaves 3.1–3.2, GlobalShtukas 1.1–1.3 and EndoscopicTransfer §3.2, whose loop Grassmannian is over a finite field or its closure). The other two are R03 and R08.
- Checks tested by computation: 47 (listed in the table below); all true and discriminating; every definition of §8.1 has at least three.

### Adversarial pass (values computed)

Throughout k = F̄₃, O = W(k), A = k[u]/u³, u = σ−1, N = u², Tate pairs are (even, odd).

| Statement | Instances tried | Values computed on each side | Result / change |
|---|---|---|---|
| Conventions: differentials, shifts, Frobenius witnesses | regular A; k[1]; α ∈ F₉; β ∈ F₂₇ | N = 1+(1+u)+(1+u)² = 3+3u+u² = u²; 1−σ = −u; H^{−1}(k[1]) = H⁰(k) = k. α³ = −α = Fr⁻¹α. β³ = β+1, β⁹ = (β+1)³ = β+2 = β−1, β²⁷ = β; x³−x−1 at 0,1,2 is −1,−1,5≡−1 | sound |
| 0.1 datum, goodness | A₁, G₂; p = 2 | highest-root coefficients 1 and (3,2); 3 ∤ 1, 3 | 2; p = 2: A_k = k[u]/u², N = 2+u = u; Tate(k) = (k,k), Tate(O) = (O/2, ker 2/0) = (k,0), Tate(k[C₂]) = (0,0) | sound |
| 0.2 admissible actions | ζ-scaling on A¹; rotation on X³; trivial | equalizer F[x]/((ζ−1)x) = F[x]/(x) since ζ−1 unit; fixed tuples (a,a,a) on every test ring incl. ε; U = G_m → G_m, x ↦ x³, basis 1,x,x², derivative 3x² a unit; trivial: U = ∅ | sound (smoothness owner: R01) |
| 0.3 equivariant categories | point; free 3-orbit; ⊕k[2n] | D(A) on a point; q_*k = A rank 3 with N e₀ = e₀+e₁+e₂ vs trivial k³ with N = 0; H^{−2n}(⊕k[2n]) = k for all n | sound |
| 0.4 flat modules | A, k, A^(ℕ) | k[C₃] ≅ k[u]/u³ via σ ↦ 1+u, (1+u)³ = 1+u³ = 1; Tor₁^A(k,k) = k; A^(ℕ) rank ℵ₀ | sound |
| 0.5–0.6 flat/perfect, stalk detection | C = [A →u A] | ker u = (u²) ≅ k, coker = A/(u) ≅ k; C ⊗ k = [k →0 k], amplitude [0,1]; family k[2n] has no common interval | sound (locator R06) |
| 1.1 Tate quotients, conservativity | A, k, O at a point | T*A = 0; T*k = (k,k); T*O = (k,0); kernel equality Perf_c = Flat^b ∩ D^b_c gives conservativity, not fullness | sound |
| 1.2 periodicity | C₃, σ ↦ σ⁻¹ | H¹(C₃;F₃) generator σ ↦ 1 pulls back to σ ↦ −1 = 2; Bockstein natural, H² class ×2 = ×(−1); dimensions stay 1 | sound |
| 1.3 Tate sheaves | two points | sections k ⊕ k, restrictions = projections; colim_n H^{j+2n} stabilizes to Ĥ^j by cup with the period class | sound |
| 1.4 LES | 0 → O →³ O → k → 0 | T⁰O = k →(3 = 0) T⁰O → T⁰k = k iso; T¹O = 0 → T¹k = k → T²O = k →(0) T²O; boundary iso | sound |
| 1.5 trivial-action formulas | O^r, k ⊕ k[1], A | (k^r, 0); (k², k²); (0,0) | sound |
| 1.6 stratified integral category | O, O[1], O², skyscraper on P¹ | (k,0), (0,k); O²/3 = k²; skyscraper stalk ranks 1,0 not locally constant | sound |
| 2.1 Tor bounds | A¹ → pt; G_m ⊂ A¹ | RΓ_c(A¹,A) = A(−1)[−2]; i*Rj* k on the Kummer torsor = [A →u A], H⁰ = k, H¹ = k(−1), so relative dimension 0 bound fails | sound |
| 2.2 locally finite type supports | ⊔_ℕ pt; ⊔_n A^n | RΓ_c = ⊕_ℕ k not ∏; H_c^{2n}(A^n) = k(−n) unbounded | sound |
| 2.3 free quotients | 3 permuted points | q_*k = A, N e₀ = e₀+e₁+e₂ ≠ 0; trivial action gives N = 3 = 0 | sound |
| 2.4–2.5 nearby stalks, i! → i* | ζ-scaling at 0; identity; A^n | cone = C, T*C = 0 though H⁰, H¹ ≠ 0; identity cone 0; i^!k on A^n = k(−n)[−2n] | sound |
| 2.6 Smith | trivial, free, fixed origin | T*; 0 (empty fixed locus); (k,k) at 0 | sound |
| 2.7–2.9 operations, compatibility | free orbit → pt; id with scalar 2; proper vs A¹ → pt | RΓ_c = A, T*A = 0; id_!k = k, T*k ≠ 0; scalar 2 ↦ 2; RΓ(A¹,k) = k vs RΓ_c = k(−1)[−2] | sound |
| 2.10 localization | pt ⊔ free 3-orbit | RΓ_c = k ⊕ A, Tate (k,k) ⊕ (0,0) = fixed point alone | sound |
| 3.1 Satake extension | torus; PGL₂ | χ₁χ₋₁ = χ₀; dual SL₂ standard weights ±1, dim 2; MV07 14.1 stops at F_ℓ, Z/ℓⁿ, Z_ℓ, Q_ℓ | sound |
| 3.2 standards | SL₂, p = 3, λ = 0, 3 | Δ(0) = ∇(0) = k; dim Δ(3) = dim ∇(3) = 4, head L(3) vs socle L(3); T(3) dim 4+2 = 6 | sound |
| 3.3 tiltings | trivial group; T_O(3); zero; torus | End_O(O) ⊗ k = k; rank 6 → dim 6, Δ_O(3) rank 4 → non-tilting; 0 has no highest line; torus: every module tilting | sound (gap scope R08) |
| 3.4 tensor closure, characters | V ⊗ V, D = diag(1,2), U | 4 = 3 + 1 = dim T(2) + dim T(0); (DU)₁₂ = 1, (UD)₁₂ = 2 | sound |
| 3.5 generation | torus; Δ(3) | Ext^{>0} = 0 on torus; 0 → Δ(3) → T(3) → Δ(1) → 0, 4 → 6 → 2 | sound (gap minimality R03) |
| 4.1 JMW condition | A¹, P¹, elliptic E | H^{>0}(A¹) = 0; H⁰(P¹) = Λ, H²(P¹) = Λ(−1), H¹ = 0; H¹(E) rank 2 fails | sound |
| 4.2 parity | 1-dim stratum; O/3 at pt; k ⊕ k[1] | k[1] has degree −1 ≡ 1 = dim mod 2; O/3 not O-free; degrees 0 and −1 both occur | sound |
| 4.3 uniqueness | O, O², O[1] at pt | End(O) = O local; M₂(O) has diag(1,0); O[1] restricts in degree −1 | sound |
| 4.4 Grassmannian parity | torus pt; GL₂ P¹; AS sheaf | Λ; Λ[1]; H¹(A¹, L_ψ(x³)) dim 2 vs constant 0 (JMW16 Theorem 1.4 is in the Ǧ(O)-equivariant category, as cited) | sound (R04 names the transport) |
| 4.5 perversity engine | GL₂ P¹; G₂ at 3; PGL₂ at 3 | k[1] perverse, Satake image dim 2; 3 | 3 in (3,2) bad; PGL₂ via SL₂ (3 ∤ 2 very good) and the isogeny reduction | hypotheses missing: R02 |
| 4.6 external products | r = 1, 2; E ⊕ E; E ⊠ 0 | shifts 1, 2; dense ranks 1; E ⊕ E rank 2 decomposable; 0 | sound |
| 4.7 graded Hom | O_{P¹}[1]; point | indices 0,1 with H⁰(P¹) = k, H²(P¹) = k; h² ∈ H⁴ = 0; point: index 0 only (LL21 4.6.1 line 641: ⊕_{i∈Z} Hom(FF, FG[2i])) | sound |
| 4.8 Tate parity | O, O[1], A, k at pt | (k,0), (0,k), (0,0), (k,k) | sound |
| 4.9 Tate indecomposables | O; O_{P¹}[1]; O² | k; k[h]/h² local; M₂(k) not local | sound |
| 4.10 ordinary reduction | Hom(O,O); I ⊂ O[C₃] | k = k; I^{C₃} = 0 (cN has augmentation 3c), (I/3I)^{C₃} = k·u² | sound |
| 4.11–4.12 normalization, lifting | O, O[1], O[2]; scalar 2; h | only O normalized; T*O[2] ≅ T*O; L(2) = 2, L(h) = 0, L(T*O) = k | sound |
| 5.1 fixed Grassmannian | (ν,ν,ν); dims at p = 3, 2 | fixed tuples constant; 3 vs 1 (same parity), 2 vs 1 (opposite) | sound |
| 5.2 norm | unit; scalar α; E ⊕ F | Nm(1) = 1; α³ = −α; 8 = 2 pure + 6 mixed words | sound |
| 5.3 stalk filtration | basis e₀,e₁; odd constant word | 8 = 2 fixed + 2 orbits of 3; cycle sign (−1)² = 1 (p = 2: −1) | sound |
| 5.4 Smith parity | O, A at fixed pt; shifts | (k,0), (0,0); 3·1 − 1 = 2 even; smooth fixed locus needed for purity | owner miscited: R01 |
| 5.5 additivity | (f+g)^⊗3; a = 3; a = α | 2 pure + 2 transfers of 3; 3̄³ = 0; ᾱ³ = −α | sound |
| 5.6–5.8 twist, form, BC | α, β; identity on torus generator | D(Fr⁻¹β) = (β−1)³ = β; D(Frβ) = (β+1)³ = β−1; BC^(p)(βf) = (β+1)BC^(p)(f), BC(βf) = βBC(f); BC(0) = 0 | sound |
| 6.1 constant terms | torus; unit; nonmonodromic diagonal | ρ = 0, CT = id; CT^norm(unit) = Λ at 0; stalk k vs costalk k[−2] | sound |
| 6.2 extreme weights | GL₂, λ = (1,0) | ⟨ρ, λ + w₀λ⟩ = ⟨(½,−½),(1,1)⟩ = 0, one point; ν = (2,−1) empty | sound |
| 6.3 normalized CT | GL₂ minuscule, E = Λ[1] | ν₊ = (1,0): RΓ_c(A¹,Λ[1]) = Λ(−1)[−1], ⟨2ρ,ν₊⟩ = 1, degree 0; ν₋: Λ[1][−1] degree 0; square multiplicities 1,2,1 | sound |
| 6.4 Smith/CT | ⟨2ρ,ν⟩ = ±1, p = 3, 2 | 3·(±1) − (±1) = ±2; p = 2: ±1 not removable | sound |
| 6.5 CT and lifting | torus objects; h | Hom(k,k[2i]) = 0 for i ≠ 0; CT(h) = 0 = L(h); scalar 2 fixed | sound |
| 6.6 torus BC | (2,−1,4); α; β | 5; α; β (wrong direction β−1) | sound |
| 6.7–6.9 objectwise and natural comparison | V^⊗3 for SL₂; D, U | (x+x⁻¹)³ = x³+3x+3x⁻¹+x⁻³ = ch T(3) + ch T(1), dim 8; DU ≠ UD | sound |
| 7.1 conservativity | 0; minuscule generator | CT(0) = 0; lowest-weight component rank 1 | sound |
| 7.2 exactness | 0→k→k²→k→0; Δ(3) | 6 mixed terms Tate-zero; weights ±3, ±1 give 2,4,2 | sound |
| 7.3 equivariantization | Γ = 1; S₃; ∏_ℕ C₂ | u₁ = 1; (P₁₂P₂₃)³ = 1, P₁₂P₂₃ ≠ P₂₃P₁₂; sign character trivial on dense ⊕, −1 somewhere, kernel not open | sound |
| 7.4 descent | trivial; 3-cycle | BC; u_γ γ(u_γ) γ²(u_γ) = 1 | sound |
| 7.5–7.6 integral comparisons | unit; h; scalar 2 | O → k; F_T(h) = h ≠ 0 = I_k L(h); 2³ ≡ 2 mod 3 both sides | sound |
| 8.1 diagonal, `fixedSubring`, `cyclicTransfer`, `cyclicNorm`, `transferIdeal` | trivial σ; k³ rotation; ε² = 0; p = 0, 1, 2; n = 4 on F₂[x,y] | Δ(x) = x³; Tr(1,0,0) = (1,1,1) so T⁰(k³) = 0; Δ(ε) = 0; Tr₀ = 0, Nm₀ = 1, Tr₁ = Nm₁ = id; p = 2: aσb + bσa = Tr(aσb); Nm₄(x+y) − Nm₄(x) − Nm₄(y) = x⁴ + y⁴ = (x+y)⁴ ≠ 0 with Tr₄ = 0; A = ℤ, σ = id, p = 2: δ = reduction mod 2 | sound; `hpA` unused: R07 |
| 8.2 character extension | trivial σ on F₃[x]; k³; F₃[x] → F₃(t) | Fr⁻¹χ(a³) = χ(a); 1 ∈ Tr(k³) so no χ; χ(x³) = t has no cube root (v_t = 1) | sound; `hpA` unused: R07 |
| 8.3 twist | k[x] with F₃[x] form; W = k | x ↦ x³, scalars fixed; a⊗μ ↦ a³μ balances (aλ)⊗μ = a⊗λ³μ; tautological a ↦ a³ moves α | sound |

## Not verifiable

- The downstream consumer `SmithTheoryAndModPFunctoriality` and "the local cyclic base change development" named at `README.md:1554` exist neither on main, at any open head, nor on the board; `ShtukaTateCohomologyAndGlobalBaseChange` exists only as a design named in `packages/GlobalShtukasAndFunctionFieldLanglandsPartII/design/README.md`. These are consumers, not suppliers, so no direction defect follows; their existence could not be checked.
- The `cited_for` fields of `sources.toml` were not individually matched to targets (the manifest records locators per work, not per target); the Fields chapter entry (0CKK/0CKL, linear independence of characters) is recorded in References and the manifest but cited by no target, which is harmless.
- Mathematical claims whose carriers do not exist (relative Smith localization §2.9, modular Satake §3.1, the perversity engine §4.5, the natural comparison §6.9) were tested on the computed instances above, not proved; their proof routes were checked for owned inputs.
- Ownership against open pull requests was checked through the roadmap index (367 pull requests at their heads) with `roadmaps grep`; pull requests not carrying a roadmap folder are not indexed and were not checked.

## Source issues

- none

<!-- tauceti-roadmap-review {"agent": "claude", "head": "7d8ff9612c5adf798f62b1853b493a0e785d0fd9", "job": "RT-SheafTheoreticSmithTheory~1b", "model": "fable", "worker": "chris-k"} -->
