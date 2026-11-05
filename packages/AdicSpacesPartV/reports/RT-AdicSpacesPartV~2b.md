<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1098#issuecomment-6638305911 -->
Red team round 2 pass b (claude) of c8f36e6

Verdict: needs_changes

1. **F01** (P1) the Shilov proof applies the scheme-stalk argument to formal stalks

   Location: `packages/AdicSpacesPartV/README.md:697`, "(2) ⇒ (3): the local rings of the X_i at the unique preimages are integral over `A_(0,sp(x))` and isomorphisms after inverting t", where the X_i are the admissible formal blow-ups of Spf A₀ named earlier in the same paragraph.

   Claim: with X_i formal, the stalk O_{X_i, x_i} becomes A_{0,sp(x)}[1/t] after inverting t.

   Witness: X₀ = Spf A₀ itself, A₀ = ℤ₃⟨T⟩, x = η, sp(η) = (3). The formal stalk contains ℤ₃⟨T, T⁻¹⟩ ∋ u = (1 + 3/T)^{1/2} (binomial series, 3-adically convergent). u ∉ Frac(A₀): T·a² = b²(T + 3) in the PID ℚ₃⟨T⟩ compares an even with an odd T-adic order. So the stalk inverted at 3 is not A_{0,(3)}[1/3] = Frac(A₀). BH22 lines 253–281 use proper scheme models X_i → Spec A₀ and their algebraic stalks. The theorem is unrefuted; this route step is false.

   Repair: replace the quoted sentence by "Let Y_i → Spec A₀ be the proper scheme blow-ups in open ideals whose t-adic completions are the admissible blow-ups X_i (AdicSpacesPartIII R2.5, `AdmissibleBlowup.scheme`). For the unique preimage y_i of sp(x), A_{0,sp(x)} → O_{Y_i,y_i} is integral and an isomorphism after inverting t (BH22 lines 274–281); the colimit over i is integrally closed in its t-localization, hence equals A°_{sp(x)}. Its separated t-adic completion agrees with the completion of colim_i O_{X_i,x_i}, because O_{Y_i,y_i}/tⁿ = O_{X_i,x_i}/tⁿ for every n, and R2.4 (v) identifies the latter completion with K_x^+." Test: for Y₀ = Spec ℤ₃⟨T⟩ the algebraic stalk at (3) is the DVR A_{0,(3)}, whose 3-adic completion is the Gauss valuation ring; u lives only in the completion.

2. **F02** (P2) a declared gap asks for what its supplier already provides

   Location: `packages/AdicSpacesPartV/README.md:133–135`, "The quasi-excellent functor assigns to every reduced noetherian quasi-excellent ℚ-scheme a finite sequence" and "What ResolutionOfSingularitiesCharacteristicZero must provide (gap:generically-reduced-functorial-resolution): Extend its §§7.5–7.6 marked strong resolution functor from reduced to generically reduced"; also :147, :886 and `design/plan.json` gaps.

   Claim: ResolutionOfSingularitiesCharacteristicZero §§7.5–7.6 cover only reduced schemes.

   Witness: at the head of its pull request (#1199, caddfb3, read through `roadmaps show`), §7.5 reads "for every generically reduced noetherian quasi-excellent ℚ-scheme X there is a finite sequence of blowups in closed regular centres … isomorphism over the entire regular locus", §7.6 "for every generically reduced noetherian quasi-excellent ℚ-scheme … functorial for every regular morphism", and its Check lists A = ℚ[x,e]/(e², xe), the very example README:147 says needs the gap. TEMKIN12 line 99, Theorem 1.2.1, is itself stated for generically reduced schemes.

   Repair: in the contract paragraph write "The quasi-excellent functor assigns to every generically reduced noetherian quasi-excellent ℚ-scheme a finite sequence … (§§7.5–7.6)"; delete the `gap:generically-reduced-functorial-resolution` paragraph, its entry in `design/plan.json`, and its mentions at :147 and in the §5.3 *Needs:* line; in §5.3's route replace "including its generically reduced extension" by "(§§7.5–7.6, stated for generically reduced schemes)". In `gap:countable-resolution-invariants` replace "reduced resolution functor" by "generically reduced resolution functor". Test: K⟨x,y⟩/(y², xy) is handled by the supplier's §7.5 Check directly; K⟨ε⟩/(ε²) stays excluded by its §7.8 Check.

3. **F03** (P2) regularity of the completed scalar extension is not proved by the cited route

   Location: `packages/AdicSpacesPartV/README.md:268–270`, "The completion comparison at classical points and geometric regularity of the resulting fibres are the affine route (TEMKIN12 line 1504 …; CONRAD99 line 274, Lemma 1.1.5)".

   Claim: regularity of A → A′ = A ⊗̂_K K′ follows from Conrad's completed-local-ring comparison at classical points.

   Witness: STACKS 07C0 tests regularity at every maximal m′ of A′ over its contraction p = m′ ∩ A. For A = ℚ_p⟨T⟩, K′ = ℂ_p and m′ = (T − t) with t transcendental, \|t\| ≤ 1, p = (0) is not maximal; CONRAD99 Lemma 1.1.5(2) (lines 277–281) treats only m ∈ Max(A). TEMKIN12 line 1506 asserts ground-field compatibility without proof. The statement is true: DUCROS09 (A. Ducros, Les espaces de Berkovich sont excellents, arXiv 0706.0666v4) Théorème 3.1(c) with Proposition 2.2, lines 1769–1787, gives regular fibres of X_L → X for analytically separable L/k, and line 105 says every complete extension of a perfect field is analytically separable.

   Repair: replace the quoted sentence by "Flatness is CONRAD99 Lemma 1.1.5(1). For every prime t of Spec A and every point s of Spec A′ over t, the fibre O_{A′,s} ⊗ κ(t) is regular by DUCROS09 Proposition 2.2 applied to the reduced closure of t (Théorème 3.1(c), arXiv v4 pp. 39–40); in characteristic zero every complete extension K′/K is analytically separable (DUCROS09 line 105) and regularity of fibres is geometric. Conclude with gap:regular-map-composition-descent (locality at maximal ideals)." Add DUCROS09 to `sources.toml` (open repository, arXiv 0706.0666v4; published Ann. Inst. Fourier 59 (2009), 1407–1516, Numdam) and to the References list. Test: the fibre over (0) for A = ℚ_p⟨T⟩, K′ = ℂ_p is a localization of ℂ_p⟨T⟩ ⊗ Frac(ℚ_p⟨T⟩), regular by the cited theorem, which the classical-point comparison never reaches.

4. **F04** (P2) §6.4 restates the analytic atlas on G(K) that ReductiveGroupsPartII RG2.0.2 owns on main

   Location: `packages/AdicSpacesPartV/README.md:981`, "Give G(F), with its evaluation topology on affine Zariski charts, the maximal compatible F-analytic atlas", for every complete nontrivially normed characteristic-zero F; and :1047, "ReductiveGroupsPartII RG2.0.2 … can consume §6.4 for the locally compact characteristic-zero specialization".

   Claim: this roadmap owns the algebraic-point atlas in all cases, and RG2.0.2 consumes it.

   Witness: `TauCetiRoadmap/ReductiveGroupsPartII/README.md:640–651` on main (an accepted roadmap, hence a supplier here) is the target *smooth-group-analytic-charts*: "Let K be a nondiscrete locally compact field of characteristic zero and G = Spec H a smooth affine finite-type K-group … Give G(K) an analytic manifold structure of dimension d with the evaluation topology … the group product and inverse are analytic". ℝ, ℂ and all local fields, the fields of every Check of §6.4 except ℂ_p, are its case. A roadmap on main cannot consume a later one.

   Repair: in §6.4 write "For locally compact F this atlas, its evaluation topology and the analyticity of multiplication and inversion are ReductiveGroupsPartII RG2.0.2, smooth-group-analytic-charts, consumed here; §6.4 extends the construction to every complete nontrivially normed characteristic-zero F (ℂ_p in §6.6) by the same étale coordinates and proves that over locally compact F the two atlases are compatible." Add "ReductiveGroupsPartII RG2.0.2" to §6.4's *Needs:* and to the supplier contracts; replace the sentence at :1047 by "ReductiveGroupsPartII RG2.0.2 owns the locally compact case; §6.4 is its extension to non-locally-compact complete fields, compatible with it." Test: the G_m chart w = z − 1 over ℚ_p is RG2.0.2's; its extension to ℂ_p is §6.4's.

5. **F05** (P2) §6.1 and `analytic_constantRank` at F = ℝ duplicate AbelianSchemesAndArithmeticModuliPartII B2.10, which is earlier in the merge order

   Location: `packages/AdicSpacesPartV/README.md:922`, "Let F be a complete nontrivially normed field of characteristic 0" and `Suggested.lean:69`, `(F : Type*) [NontriviallyNormedField F] [CompleteSpace F] [CharZero F]`; and :1047, "AbelianSchemesAndArithmeticModuliPartII B2.10 can consume the F = ℝ case of §6.1 for its real-analytic constant-rank theorem".

   Claim: B2.10 is a downstream consumer of §6.1.

   Witness: `merge-order/ORDER.txt` lists AbelianSchemesAndArithmeticModuliPartII at line 141 and AdicSpacesPartV at line 208. Its B2.10 (`rev/1405/.../AbelianSchemesAndArithmeticModuliPartII/README.md:1612–1624`) states "Extend that result here to each finite k ≥ 1 and to real-analytic regularity: … a C^k map … of constant differential rank r has local C^k coordinate isomorphisms putting f in the form (u,v) ↦ (u,0)", transported to manifolds. The F = ℝ instance of `analytic_constantRank` is that theorem, planned twice by two open pull requests; the earlier one cannot consume the later.

   Repair: state §6.1 and the Lean headline for nonarchimedean F: add `[IsUltrametricDist F]` after `[CharZero F]` in `analytic_constantRank` and write at :922 "Let F be a complete nontrivially normed nonarchimedean field of characteristic 0"; in the downstream paragraph write "LieGroupoidsPoisson G0.1 owns the real smooth normal form and AbelianSchemesAndArithmeticModuliPartII B2.10 the real finite-C^k and real-analytic normal forms; §6.1 is the nonarchimedean analytic counterpart and consumes neither." The sources cited (SCHNEIDER11, HK2) are nonarchimedean, and §6.5 uses only nonarchimedean F. Test: the §6.1 Checks (ℚ_p, 𝔽_p((t)) control, F⁰) are unchanged; the real example (x,y) ↦ (x,x²) in the Layer 6 Examples is then B2.10's.

6. **F06** (P2) the affinoid case of §§5.3–5.4 over K ⊇ ℚ_p is built by DiamondsAndVStacks D6.9, earlier in the merge order

   Location: `packages/AdicSpacesPartV/README.md:1045–1046`, "DiamondsAndVStacks D6.4–D6.5 can consume the finite-extension point classification of §§3.1–3.2 … Its D6.9 constructs the analytification of the algebraic affinoid resolution … that analytic resolution is the affinoid case of §§5.3–5.4"; §5.3 route at :884 "Analytify the centre ideals to obtain rigid blow-up sequences".

   Claim: DiamondsAndVStacks is a consumer, and the affinoid analytic resolution is this roadmap's.

   Witness: `merge-order/ORDER.txt` line 16 is DiamondsAndVStacks (line 208 AdicSpacesPartV). At its head (#820, through `roadmaps show`, D6.9) it states: "For S = Spec A with A a reduced K-affinoid algebra and K ⊇ ℚ_p complete, use … `resolution_affinoid` to choose f₀. D6.9 proves the analytic comparison: Y = Y₀ ×_{Spec A} Spa(A, A°) is smooth over K, and f : Y → Spa(A, A°) is proper and surjective, and is an isomorphism over the smooth locus". That is §5.4 for affinoid S over K ⊇ ℚ_p.

   Repair: in §5.3's route write "On a chart Spa(A_i) with K ⊇ ℚ_p the analytified tower, its smoothness, properness, surjectivity and isomorphism over the smooth locus are DiamondsAndVStacks D6.9, consumed; for the remaining characteristic-zero K prove the same chart statement here by D6.9's argument (RigidAnalyticGeometry §8.1 for smoothness, §0.4 for the image). This roadmap owns the gluing, the markings and the non-quasi-compact hypersequence." Add "DiamondsAndVStacks D6.9 (affinoid analytic resolution, K ⊇ ℚ_p)" to §5.3's *Needs:* and to the supplier contracts. Replace :1045–1046 by "DiamondsAndVStacks (earlier in the merge order) owns the affinoid analytic resolution over K ⊇ ℚ_p and the diamond point functor; its D6.4–D6.5 and D6.9 are suppliers of comparisons, not consumers of §§3.1–3.2 or §§5.3–5.4." Test: the cusp chart K⟨t²,t³⟩ over ℚ_p is D6.9's; over K = ℂ((t)) with the t-adic norm it is this roadmap's.

7. **F07** (P2) two declared gaps bundle independent prerequisites

   Location: `packages/AdicSpacesPartV/README.md:113` (`gap:regular-local-flat-transfer`, two clauses) and :115 (`gap:regular-map-composition-descent`, three clauses); the same entries in `design/plan.json`.

   Claim: each slug is one contract.

   Witness: the five clauses are five Stacks lemmas with different hypotheses: 00OF (flat local descent of regularity, no fibre condition), 031E (ascent, needs a regular closed fibre), 07QI (composition, needs noetherian fibre rings), 07NT (descent along a faithfully flat target), 07C0 (locality at maximal ideals). §2.1 uses only the first two, §0.5 the last three; a supplier discharging one clause leaves the slug open.

   Repair: replace the two contracts, in README and `design/plan.json`, by five contracts on SchemeAndStackFoundations §0.21: `gap:regular-local-flat-descent` "For a flat local homomorphism R → S of noetherian local rings, if S is regular then R is regular."; `gap:regular-local-flat-ascent` "For a flat local homomorphism R → S of noetherian local rings, if R and S/m_R S are regular then S is regular."; `gap:regular-map-composition` "For ring maps A → B → C with C noetherian, if A → B and B → C are regular then A → C is regular."; `gap:regular-map-faithfully-flat-descent` "For ring maps A → B → C with B, C noetherian, if A → C is regular and B → C is faithfully flat then A → B is regular."; `gap:regular-map-maximal-locality` "For a ring map A → B with B noetherian, if A → B_n is regular for every maximal ideal n of B then A → B is regular." Update each *Needs:* line to the clauses it uses. Test: §0.5's domain route uses composition, faithfully-flat descent and locality; §2.1 uses descent and ascent; the cusp B → B[1/x] still shows faithful flatness cannot be weakened.

8. **F08** (P3) the normalization lift does not embed fraction rings

   Location: `packages/AdicSpacesPartV/README.md:304`, "Hence a/s ↦ g^*(a)/g^*(s) embeds the elements of Ã^ν into the total ring of fractions of B".

   Claim: the induced map on total fraction rings is injective.

   Witness: X = Spa(K × K), Y = Spa K the first component, g the inclusion. Every nowhere dense Zariski closed subset of every open of X is empty, so the hypothesis holds; the map K × K → K kills (0, 1). The lift exists (it is the projection), so only the word is wrong.

   Repair: "Hence a/s ↦ g^*(a)/g^*(s) is a well-defined homomorphism from the total ring of fractions of A_red to that of B (g^*(s) is a nonzerodivisor); it sends Ã^ν to elements integral over B, which lie in B by normality. It need not be injective."

9. **F09** (P3) the universal property is narrower than CONRAD10 Corollary 2.1.2

   Location: `packages/AdicSpacesPartV/README.md:301`, "such that, for every open U ⊆ X, the preimage of each nowhere dense Zariski closed subset of U is nowhere dense in g⁻¹(U)".

   Claim: this is the universal property of the normalization.

   Witness: CONRAD10 line 165, Corollary 2.1.2, needs only that g⁻¹ of the non-normal locus N(X) is nowhere dense. For Y = Spa K mapping to a smooth point of the cuspidal disc, g⁻¹(N(X)) = ∅ and the lift exists (p is an isomorphism there), but the package's hypothesis fails for Z = {that point}. The §1.1 bullet is true but drops the general form the source supports.

   Repair: keep the §1.1 bullet with its algebraic route and add after §1.7's Checks: "Universal property (Conrad). For reduced rigid spaces, a morphism g : Y → X with Y normal and g⁻¹(N(X)) nowhere dense, N(X) the non-normal locus, factors uniquely through p : X^ν → X: the lift exists over X − N(X) and its coordinates, integral over A on affinoids, are bounded, so §1.7 extends them (CONRAD10 line 165, Corollary 2.1.2, p. 4). *Needs:* §1.1; §1.2; §0.3; §1.7." Test: the smooth-point example lifts; the origin of XY = 0 still fails (N(X) is the origin).

10. **F10** (P3) the Shilov-boundary equivalence (1) ⇔ (4) has no route and no primary source

   Location: `packages/AdicSpacesPartV/README.md:697`, "Use the rank-one comparison map to the Banach spectrum … as in Bhatt–Hansen Proposition 2.2(4)".

   Claim: BH22 supplies the equivalence with the Shilov boundary.

   Witness: BH22 line 294 proves (1) ⇔ (4) only by citing Berkovich, Spectral theory and analytic geometry over non-Archimedean fields, Proposition 2.4.4; the package's route for (4) is a citation of a citation.

   Repair: add to the route "(1) ⇔ (4): the image of the rank-one locus in `Huber.GelfandSpectrum` A is the whole Banach spectrum, and the Shilov boundary is the preimage of the generic points of Spec Ã under the reduction map (Berkovich 1990, Proposition 2.4.4, uncertified)"; add a `sources.toml` entry BERKOVICH90 (AMS Mathematical Surveys and Monographs 33, 1990, DOI 10.1090/surv/033, status uncertified, locator Proposition 2.4.4) and cite it at §4.2.

11. **F11** (P3) the affinoid completed-local-ring comparison is cited to sections that state the scheme comparison

   Location: `packages/AdicSpacesPartV/README.md:208`, "an affinoid subdomain inclusion is flat with the same completed local rings at classical points (RigidAnalyticGeometry §8.1; AdicSpacesPartII R1.5)"; the same pair at :258, :483 and :527.

   Claim: §8.1 and R1.5 supply Â_m ≅ Ô_{X,x} ≅ B̂_n for an affinoid subdomain Spa B ⊆ Spa A.

   Witness: `TauCetiRoadmap/AdicSpacesPartII/README.md:9575–9583` (R1.5) and `TauCetiRoadmap/RigidAnalyticGeometry/README.md:702–705` (§8.1) compare a scheme X with X^an or X^ad at classical points. The affinoid-stalk comparison "A_𝔪/𝔪^n ≃ 𝒪_{Sp A,x}/𝔪_x^n and its completion" is `RigidAnalyticGeometry/README.md:412–414`, Layers 3–4, which §0.2, §0.5 and §2.3 do not list for this step.

   Repair: at each of the four places write "(RigidAnalyticGeometry Layers 3–4, local-ring comparison; RigidAnalyticGeometry §8.1 and AdicSpacesPartII R1.5 for schemes)" and add "RigidAnalyticGeometry Layers 3–4" to the *Needs:* lines of §0.2 and §2.3.

12. **F12** (P3) `IsUnitGaussPoint` has no discriminating Checks

   Location: `packages/AdicSpacesPartV/README.md:639–640`, "using `IsUnitGaussPoint` to specify the valuation class on the native polydisc"; `Suggested.lean:37–46`.

   Claim: the definition is tested.

   Witness: the three §3.4 Checks test the closure theorem; none tests the predicate against its nearest wrong models. Values: at the radius-r Gauss point η_r, r < 1, the pair (1, T) gives v(1) ≤ v(T) false while the unit Gauss norms give 1 ≤ 1 true; at T = 0 the pair (π + T, 1) gives \|π\| ≤ 1 and 1 ≤ 1, both true, but (1, π + T) gives 1 ≤ \|π\| false against 1 ≤ 1; for n = 0 every pair reduces to \|f\| ≤ \|g\| in K and the unique point qualifies.

   Repair: add these three bullets to §3.4's Checks, in those words.

## Round-1 findings at this head

The scratch copies of the round-1 reviews and of their repair report are one-line placeholders. The board carries them under the roadmap's former name: `packages/AdicSpacesPartV/reports/RT-AdicSpacesPartIIPartII~1a.md` (F01–F07), `RT-AdicSpacesPartIIPartII~1b.md` (r1b/F01–F03) and `FIX-RT-AdicSpacesPartIIPartII~1.md`. Each finding was re-verified against `packages/AdicSpacesPartV/README.md` at this head.

| Finding | Status | Repaired passage (README line) and witness |
|---|---|---|
| r1a/F01 finite residue, n = 0 | repaired | :639 "If L̃ is finite and n ≥ 1 the conclusion fails; in dimension 0 it holds over every L." D⁰(L) = {η}; over 𝔽_q with n = 1, {\|T^q − T\| ≥ 1} ∋ η misses O_L. |
| r1a/F02 Hodge loci vs closed images | repaired | :808 "these pieces are not asserted to be Zariski closed." HK2 lines 2699–2707 give compact incidence images; lines 2714–2717 exclude each proper Hodge locus pointwise. |
| r1a/F03 faithfully flat descent of regular maps | repaired | :115 `gap:regular-map-composition-descent`, same slug and needs in `design/plan.json`; STACKS 07NT (More on Algebra line 5169) is the descent clause. Granularity: S07. |
| r1a/F04 André localization | repaired (applied differently) | :117 `gap:complete-local-formal-smoothness-regular`; STACKS 07PM (More on Algebra line 5812) (4)⇒(1) needs no quasi-excellence. ANDRE74 removed from README and `sources.toml`. |
| r1a/F05 five non-discriminating Checks | repaired | :188 (K × K, two classical points, \|T(T−1)\|_η = 1); :250 (Tᵖ − t, residue degree p; rank-2 free square map); :358 (idempotents 0, 1 only); :422 (Y = first disc ≠ M); :438 (L ⊗_K L ≅ L × L). |
| r1a/F06 formal reconstruction unowned | disputed, accepted | AdicSpacesPartIII R2.4 (v) at `TauCetiRoadmap/AdicSpacesPartIII/README.md:5003–5006` states both the homeomorphism d(X) → lim \|X′\| and (d(X), O⁺) ≅ lim (X′, O_{X′}). The substituted route has a new false step: S01. |
| r1a/F07 local regularity transfer | repaired | :113 `gap:regular-local-flat-transfer` (descent 00OF, Algebra line 12590; ascent 031E, line 12687). K → K[ε]/(ε²): source regular, fibre not regular, target not regular, both clauses consistent. |
| r1b/F01 surjectivity of sp at non-closed points | repaired | :677 route through R2.4 (v), R2.5 `admissibleBlowUp.isProper_surjective_specialFibre`, pro-constructible fibres, `TopCat.nonempty_limitCone_of_compact_t2_cofiltered_system`. For p = (Y) ⊂ K̃[X,Y] the limit point is the Gauss point of Y = 0. Sound. |
| r1b/F02 Nagata and regularity inputs | repaired (applied differently) | :111 `IsNagata.integralClosure_finite` (§0.20, supplier README:1329) and `Excellence.IsQuasiExcellentRing.isNagata` (:1334); :304 "the total ring of fractions of A_red is a reduced localization". Regularity transfers are the three gaps. |
| r1b/F03 universal property of normalization | partly repaired | :301 hypothesis strengthened to all nowhere dense Zariski closed subsets of all opens; :304 algebraic route. The route is sound (checked on the cusp and on XY = 0) but its wording overclaims injectivity (S08) and the statement is narrower than its source (S09). |

No repair introduced an error other than S01; the three new gaps are precise and declared identically in README and `design/plan.json`.

## Verified sound

Declarations read: 4 of 4 (`IsUnitGaussPoint`, `gaussPoint_mem_closure_rationalPoints`, `analytic_constantRank`, `analytic_germ_eq_zero_of_subfield`). Targets read: all 39 numbered subsections, the scalar-extension target of §0.5, the hypersequence definition of §5.2, the conventions, the eight supplier-contract blocks, the downstream and worked-example sections. Locators verified against the cached texts: 56 line ranges (HK2 8, CONRAD99 14, BH22 9, TEMKIN12 7, CONRAD10 3, POINEAU13 4, CONRAD06 1, STACKS 7 across the Morphisms, Algebra and More on Algebra chapters, DUCROS09 3), listed in the ledger below. Checks tested by computation: 168 (every bullet of §§0.1–6.6 and of the five imported-interface blocks); none false. Sibling citations resolved at main or at the open head: 73 (RigidAnalyticGeometry 13, AdicSpacesPartII 23, AdicSpacesPartIII 12, AdicEtaleGeometry 1, SchemeAndStackFoundations 8, StableReduction 1, ReductiveGroups 1, ResolutionOfSingularitiesCharacteristicZero 5 at #1199, DiamondsAndVStacks 3 at #820, ReductiveGroupsPartII 1, AbelianSchemesAndArithmeticModuliPartII 1 at #1405, LieGroupoidsPoisson 1, AdmissiblePairsAndPadicHodgeStructures 1 at #1511). All exist with the hypotheses cited except as in S02, S04–S06 and S11.

Dependency check, run on this head without edits:

```text
depcheck: 208 roadmaps, 1704 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. The direction defects of S04–S06 live in the Downstream consumers prose, which the check does not read.

Policy: `git diff --stat origin/main...HEAD` touches only `packages/AdicSpacesPartV/`; the README and the Lean docstrings contain no pull-request number, process word, algorithm or `set_option`; `theorem` throughout; one `import Mathlib` plus `TauCeti.AlgebraicGeometry.AdicSpace.Spa.Polydisc.Basic`, which exists at the pin; every target carries a locator; every Lean name occurs in the README and every own backticked name of the README is declared. The eight declared gaps have the same slug, supplier and needs sentence in README and `design/plan.json`; none has supplier `none`.

Headlines and padding: the README's headline theorems are Gauss-point closure (stated), functorial rigid resolution and connectedness of the resolution (named in the docstring as unstatable: no rigid-space or blow-up carrier at the pins; Tau Ceti has `spa`, `closedPolydisc` and `PreAdicSpace` but no rigid category, coherent ideals or smoothness), analytic manifolds of rational points (unstatable, no rational-point atlas), the constant-rank normal form (stated), subfield detection in coordinates (stated) and on G(C) (unstatable, no algebraic-group point manifold). One-tactic probe: `IsUnitGaussPoint` has a real body and is needed; `gaussPoint` at the pin is one-variable with no closure statement; Mathlib has `Manifold.IsSubmersionAt` as a definition with its rank criterion still a TODO (`Mathlib/Geometry/Manifold/Submersion.lean:63–87`) and no constant-rank theorem; no subfield identity theorem exists at the pin. No padding.

Elaborated signatures: the worker's elaboration failed (missing Tau Ceti object file), so I compared the four declarations' explicit binders with the README statements by reading; the round-1 repair report records an exit-0 elaboration of this unchanged file. I ran no Lean.

### Declaration table

| Declaration, section | Variable and instance context | Instances and computed values | Result |
|---|---|---|---|
| `IsUnitGaussPoint`, §3.4, Suggested.lean:37 | K nontrivially normed, ultrametric, NonarchimedeanRing; n; η in `closedPolydisc n K` (subtype of `Spv` of the unit-weight restricted subring) | (f,g) = (π+T, 1): Gauss norms (1, 1), both sides true; (T, π): v(T) ≤ v(π) ↔ 1 ≤ \|π\|, false on both sides at η; at T = 0 the left side is true, so T = 0 is excluded; η_r, r < 1: (1,T) separates (S12); n = 0: comparison of \|f\|, \|g\| in K. `MvPowerSeries.gaussNorm` is a real iSup, finite on restricted series | fixes the valuation class; `gaussNorm_mul` (NormMulClass, unit polyradius) makes it a valuative relation |
| `gaussPoint_mem_closure_rationalPoints`, §3.4, :51 | plus CompleteSpace K, Infinite (K°/K°°); x ∈ Spa(K, K°), a singleton (the trivial valuation is not continuous; overrings of K° are K°, K) | n = 0: range = {η} = closure; K = ℚ_p, n = 1: {\|Tᵖ − T\| ≥ 1} contains η (value 1) and no a ∈ ℤ_p (\|aᵖ − a\| ≤ 1/p), so the infinitude binder is needed and present; residue 𝔽̄_p: ζ with ζ̄ ∉ {0,1} meets {\|T\| ≥ 1} ∩ {\|T − 1\| ≥ 1}; normalization: \|g\|_η ∈ \|K^×\| is attained, so g ∈ K°⟨T⟩ with ḡ ≠ 0 after scaling | true; closure in the subspace topology of `Spv`, whose basic opens are Huber's (`ValuationSpectrum/Basic.lean:146`) |
| `analytic_constantRank`, §6.1, :68 | F complete, char 0 (any absolute value: S05); k ≤ m, k ≤ n; charted spaces over Fin m → F, Fin n → F with analytic `IsManifold`; `ContMDiffAt ω` at a; eventual rank k | (x,y) ↦ (x,x²): derivative columns (1,2x), (0,0), rank 1; ψ(u,v) = (u, v − u²) gives (x,0); k = 0: locally constant, true in char 0; m = n = k = 0: empty tuples; x ↦ x² at 0: ranks 0 then 1, hypothesis fails; Tᵖ over 𝔽_p((t)): rank 0 but πⁿ ↦ πⁿᵖ ≠ 0, excluded by CharZero; `mfderiv` junk values do not enter since ω-smoothness at a is analyticity near a | true; `hkn` is implied by the rank hypothesis (note only) |
| `analytic_germ_eq_zero_of_subfield`, §6.6, :100 | E, C complete nontrivially normed, char 0, `NormedAlgebra E C` (isometric by `norm_algebraMap'`); m; `AnalyticAt C f 0`; vanishing on an E-neighbourhood | m = 0: both sides f(0) = 0; E = C: trivial; ℝ ⊂ ℂ, m = 1: real vanishing kills every Taylor coefficient; ℚ_p ⊂ ℂ_p: vanishing on p^kℤ_p forces the lowest nonzero coefficient to vanish; z(z − a), a ∉ E: vanishes at 0 only, hypothesis fails; iterated derivative ∂^α g(0) = α!c_α with α! ≠ 0 | true; CharZero is used by the stated route, not by the statement (a Weierstrass-type argument would remove it; note only) |

### Adversarial pass on README targets

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| Conventions :25–33 | dim ∅; Dⁿ; T ↦ T² at a; blow-ups of (1), (0), (T) | ⊥; n at every point including η; 2a; id, ∅, id with a marked centre | consistent across layers |
| §0.1 | V(T); V(1), V(0); K⟨T⟩/(T²); T(T−1); subdisc of radius \|ϖ\| | {T = 0} as Spa(K): one point, η ∉ since \|T\|_η = 1; ∅, \|X\|; whole point; K × K, two points, \|T(T−1)\|_η = 1; closed with interior, not Zariski closed | sound; radicals glue by reduced restriction |
| §0.2 | Dⁿ at η; Spa L; ∅; K × K⟨T⟩; cusp; Spa(K, K⁺) rank 2 | n; 0; ⊥ = ⊥ = ringKrullDim 0; local 0 and 1, global 1; local 1 vs tangent 2; topological 1 vs ring 0, outside the finite-type hypothesis | sound; chains in \|D\| have length ≤ 1 (η ≻ type 5), equal to ringKrullDim |
| §0.3 | V(T) in D; axis of XY = 0; Spa(K × K) point; ∅; prime-avoidance step | 0 < 1, (T) ⊄ (0): all five hold; (Y) minimal, axis contains an open: all fail; open point fails; all hold for Z = ∅; g ∈ ∩_{j≠i} p_j − p_i exists | (c) ⇔ (e) at non-classical points via components through the point: sound |
| §0.4 | ∅ → X; id; closed immersion; P¹ × D → D; Tᵖ − t over 𝔽_p((t)); T ↦ T²; ℂ_p projective line covers | ∅/0; X/O_X; image = V(I); H⁰ = O_D; one point of residue degree p; free of rank 2, image D; inner discs have sup \|p\| < 1 in outer coordinates | sound given gap:adic-proper-kiehl-proper |
| §0.5 | K⟨T⟩ → K⟨T,T⁻¹⟩; evaluation at 0; K → K(a^{1/p}); smooth disc at (Tᵖ − a); K → K′ char 0; K⟨T⟩ → K′⟨T⟩ | regular; Tor₁ ≠ 0, not flat; fibre L[ε]/(εᵖ), not regular; L⟨T⟩ regular; separable fibres; K[[T]] → K′[[T]] | domain route sound with the three gaps; scalar-extension route insufficient (S03) |
| §1.1 | cusp; XY = 0; polydisc, Spa K, ∅; K⟨T⟩/(T²); nodal cubic; universal property on the cusp, on the origin of XY = 0, on Spa(K × K) | t ↦ (t²,t³), bijective not iso; two discs, two points over 0; identity; Spa K; commutes with analytification; Y/X ↦ t; two lifts, hypothesis fails; projection, non-injective (S08) | construction sound (CONRAD99 Cor. 1.2.3, Lemma 2.1.1) |
| §1.2 | cusp; one axis into XY = 0; X ⊔ Spa K → X | satisfied with Z = cusp; other axis not nowhere dense; preimage of Z contains a component | sound (Thm 2.1.2 verified) |
| §1.3 | disc, annulus; K × K; ∅; Spa K; XY = 0; canonical topology on classical points | idempotents {0,1}; two components; preconnected not connected; one; connected with two irreducible components; disjoint canonical opens yet connected | sound; clopen = V(idempotent) |
| §1.4 | XY = 0; nodal cubic; XY = c; ∅; Spa L; two discs; dim on irreducible X | 2 components, 1 connected; 1 global component, 2 branches, t = ±1; irreducible; none; one; not irreducible; every affinoid open has all components of dimension d | sound (Thm 2.2.4, Cor. 2.2.7–2.2.9 verified) |
| §1.5 | closed disc; open disc; XY = 0; ∅ | proper Zariski closed = finite classical set (supports are maximal); infinite discrete allowed; union of axes; excluded by nonemptiness | sound (Lemma 2.2.3) |
| §1.6 | V(XY) in D²; subdisc; D ⊔ D; Spa L | 1 < 2; full dimension but not Zariski closed; Y = component ≠ M; only ∅ and X | sound |
| §1.7 | idempotent; 1/T on punctured disc; Y/X on cusp; ℚ₃(√2) | extension idempotent; \|π\|^{−n} unbounded; bounded by 1, extends to K⟨t⟩ only; L ⊗ L = L × L | sound (CONRAD10 Thm 2.1.1 via Bartenwerfer) |
| §1.8 | punctured disc; nodal cubic minus node; XY = 0 minus origin; Spa L | connected; connected; disconnected, not irreducible; one component; e² − e vanishes on a dense open of reduced X, hence is 0 | sound |
| §2.1 | cusp; XY = 0; polydisc, Spa K, ∅; Spec K[x,y]/(y² − x³); K⟨T⟩/(T²) | {0}; {0}; ∅; analytified origin; all of X | sound with gap:regular-local-flat-transfer |
| §2.2 | nodal cubic; k⟨T⟩[Y]/(Yᵖ − a); Spa K; K(a^{1/p}) | X minus node; L⟨T⟩ regular, not smooth; Ω = 0; dim Ω = 1, regular, not smooth | sound (CONRAD99 lines 1008–1011) |
| §2.3 | Dⁿ at 0; z², char ≠ 2; Spa K; K⟨T⟩/(T²); A¹; cusp | Kⁿ; 2a, zero only at 0; 0; K with dim 0; K; 2 > 1 | sound |
| §2.4 | plane ∪ line in D³; cusp; dimension 0; ∅; double point | 2 → 0 → ⊥; 1 → 0 → ⊥; one stratum; none; needs reduction | sound; d + 1 bound from strict local drop |
| §2.5 | z² in char ≠ 2 and char 2; constant; id of Dⁿ; r = 0; r too large | D − {0}, r_max 1; rank 0 everywhere; V, 0; n; empty minor 1; empty locus | sound |
| §3.1–3.2 | Spa K; Galois L/K degree n; disc; completed algebraic closure; G_a, G_m Grassmannians | one class; n representatives, one class; classes ↔ Max K⟨T⟩; excluded; only 0 (HK2 lines 1462–1464); ℤ | classes with image x are all equivalent by amalgamation over k(x): sound |
| §3.3 | ℤ_p in the ℚ_p-disc; η; √p; n = 0; ball \|T − a\| ≤ \|π\|ᵏ | closed; {\|Tᵖ − T\| ≥ 1} misses ℤ_p; {\|T² − p\| ≤ \|p\|²} misses ℤ_p (values 1 or \|p\|); one point; clopen ball | sound (`classicalPoint_injective_of_isField`, complete, T3) |
| §3.4 | residue 𝔽̄_p; 𝔽_p; n = 0 | ζ in the neighbourhood; {\|T^q − T\| ≥ 1} with no O_L-point; D⁰ = {η} | sound; `MvPolynomial.funext` needs an infinite domain, present |
| §4.1 | K⟨T⟩; XY = c; K; power-bounded ring of K⟨T⟩; residue disc; p = (Y) in K̃[X,Y] | sp(η) = (0), sp(a) = (T − ā); two generic points from the boundary circles; point to point; K°⟨T⟩, Gauss norm < 1; all to (T); limit point is the X-Gauss point with Y = 0 | surjectivity route sound (singletons pro-constructible; constructible topology compact Hausdorff; cofiltered limit nonempty) |
| §4.2 | disc η; XY = c; p + T² in ℚ_p⟨T⟩; K[ε]/(ε²); zero algebra; K⟨ε⟩/(ε²); formal stalk of ℤ₃⟨T⟩ at (3) | singleton fibre at η, residue disc at 0; fibres (1,\|c\|), (\|c\|,1); max(\|p\|,1) = 1; \|ε\| = 0 at every seminorm; empty; completion K°; contains √(1 + 3/T) ∉ Frac (S01) | theorem sound; route step false |
| §4.3 | polydisc; annulus; Spa L; zero algebra; p + T²; classical point; finite injective A → B | {η}; two; one; none; 1 at η; closed image; for Shilov x, dim B̃/q = d, contraction p has dim Ã/p = d, minimal | sound |
| §4.4 | η_{a,r}; Spa L; classical point in dimension > 0; disc types | Shilov in its subdisc; 0 = 0; 0 < dim; type 2 only, type 5 rank 2 | sound |
| §4.5 | η of Dⁿ; classical; irrational radius; Spa L | n ≤ n; 0 ≤ d; 0 ≤ 1; 0 ≤ 0 | sound (POINEAU13 line 184) |
| §4.6 | type 3; type 2; classical on D; isolated point of K⟨T⟩ × K; x on two d-dimensional components | 0 < 1; 1 = 1; 0 ≠ 1; 0 = 0; trdeg ≤ dim of the reduced intersection < d | sound; Cor. 4.18 needs x on a unique component, which Abhyankar supplies |
| §4.7 | finite subsets of D; Hodge loci; all classical points of D | miss type 2; each proper locus nowhere dense; empty intersection for any cardinality | sound |
| §5.1 | bidisc at origin; (1); (0); A² and (x,y); disc at (T) | exceptional P¹; X; ∅; same two charts; identity with marked centre; exceptional divisor of a nonzerodivisor is nowhere dense | sound (CONRAD06 Def. 4.1.1) |
| §5.2 | length 0; unit and zero centres; translation; Cartier centre; curves y² = x^{2n+1} | id; identity stage removed, empty total space; pulls back; nonempty marked stage; exponent drops by 2, n steps, 0 for n = 0; no uniform bound on the union | sound (TEMKIN12 §§2.2, 5.3.2) |
| §5.3–5.4 | cusp; smooth X; ∅; XY = 0; zero-ideal blow-up; double point; π⁻¹(S^{sm}) density | one stage; none; none; two discs, disconnected; empty source excluded; Spa K → T proper surjective; pulled-back Cartier divisors stay nonzerodivisors on reduced stages | sound with gap:countable-resolution-invariants; ownership S02, S06 |
| §6.2 | G_m at 1, c = p; radius 1; cusp; dimension 0; non-rational point | \|T\| = 1 on \|T − 1\| ≤ 1/p; contains 0; no disc; Spa F; base change needed | sound |
| §6.3 | ℚ_p-disc; Spa F; ∅; G_m; ℚ_p(√p); ℂ_p | ℤ_p; point; empty; F^×; dimension 1 over E′, 2 over ℚ_p; no finite ℚ_p-dimension | sound; Hausdorffness not claimed |
| §6.4 | G_m over ℝ ⊂ ℂ; GL₂; μ₃; G_m over ℚ_p ⊂ ℂ_p | inverse 1 + w, inversion −w/(1+w), derivative −1; \|det g − 1\| < 9/32; singleton charts; same formulas, constant map excluded | mathematics sound; ownership S04 |
| §6.5 | D² → D; z²; GL₂ → P¹ at ∞ | (u,v) ↦ u; derivative 0 at 0; coordinate c/a with differential δc | sound with gap:represented-smooth-homogeneous-quotient |
| §6.6 | pᵏℤ_p; z(z − a); m = 0; ℝ_{>0} ⊂ ℂ; finite étale G | all coefficients 0; fails; f(0) = 0; disc about 1; φ(1) = 0 | sound |

### Imported-interface Checks and gaps

Analytic inversion (:48–51): T − T² + 2T³ inverts T + T² to O(T⁴), Catalan coefficients integral, radius 1; d(Tᵖ)₀ = 0; F⁰. Classical points (:70–75): Eisenstein T² − p, \|T\| = p^{−1/2}; Spa L one point; transcendental t excluded; A/(T) = K, K × K. Formal localization (:103–106): K̃[T] → (K°/ϖ)[T] homeomorphism with nilpotent kernel K°°/ϖ; dual numbers, one point each side; countable union of discs. Regularity (:121–124): K[t]_(t) → K[[t]]; K → K[ε]/(ε²); cusp B → B[1/x] not faithfully flat; (t + ct²)² = t² ≠ 0. Scheme resolution (:141–147): empty tower; cusp; dual numbers; exponents 2n + 1; K⟨x,y⟩/(y², xy). All pass. Gaps: adic-proper-kiehl-proper (AdicSpacesPartIII README:10960–10968 takes Kiehl-properness as a hypothesis for general K) precise and minimal; formal-affinoid-localization (R2.4 has no quasi-paracompact realization) precise; countable-resolution-invariants (no countable label set at #1199) precise; represented-smooth-homogeneous-quotient (ReductiveGroups README:234–243 states representability as a theorem with hypotheses) precise; complete-local-formal-smoothness-regular precise and minimal; generically-reduced-functorial-resolution is S02; the two transfer gaps are S07.

### Pinned inputs

`TauCeti/AlgebraicGeometry/AdicSpace/Spa/Polydisc/Basic.lean:72` (`closedPolydisc` = `spa (powerBoundedSubring _)`), :148 (`classicalPoint`, needs complete T3 coefficients and power-bounded coordinates), :156, :182; `Polydisc/GaussPoint.lean:236` (one-variable `gaussPoint`, no closure statement); `RingTheory/MvPowerSeries/TateAlgebra/Basic.lean:279` (`IsRestricted.gaussNorm_mul`, NormMulClass, positive polyradius); `RingTheory/Huber/Restricted/GaussNorm.lean:80`, :87; `RingTheory/Huber/PowerBounded.lean:117`, :433, :494; `ValuationSpectrum/Basic.lean:146` (Spv topology from Huber's basic opens). Mathlib: `RingTheory/MvPowerSeries/GaussNorm.lean:57` (real iSup); `Analysis/Calculus/FDeriv/Analytic.lean:141`; `InverseFunctionTheorem/FDeriv.lean:117`; `Analysis/Analytic/Inverse.lean:656`; `Geometry/Manifold/Submersion.lean:171`, `Immersion.lean:190`; `Algebra/MvPolynomial/Funext.lean:82`; `CategoryTheory/CofilteredSystem.lean:73` (Konig limit); `IsManifold/Basic.lean:207`, :777, :1033; `ContMDiff/Defs.lean:181`; `MFDeriv/Defs.lean:336`; `RingTheory/KrullDimension/Basic.lean:26`; `Topology/KrullDimension.lean:37`; `RegularLocalRing/Defs.lean:51`; `IntegralClosure/IntegrallyClosed.lean:74`; `Ideal/Height.lean:35`; `LinearAlgebra/Matrix/Rank.lean:132`; `Topology/Defs/Basic.lean:238`; `MetricSpace/Ultra/Basic.lean:46`; `Nonarchimedean/Basic.lean:47`; `Normed/Module/Basic.lean:271`. No `IsNagata`, `IsQuasiExcellent` or `GelfandSpectrum` exists at the pin: the six resolver leads are planned supplier declarations (SchemeAndStackFoundations README:1329, :1334; AdicSpacesPartIII README:5390, :12487–12498).

Ownership by object (`roadmaps grep` over main and the open index): weakly Shilov points, rigid normalization, Riemann extension, global rigid components and Gauss-point closure occur elsewhere only in consumers (AdmissiblePairsAndPadicHodgeStructures, ClassicalAdicEtaleCohomologyPartII) or in unrelated algebraic settings (DirectSummandsAndBigCohenMacaulay). AdicSpacesPartIV on main (étale sites, families, dagger geometry) owns none of these objects. The three overlaps found are S04–S06.

### Locator ledger

HK2 lines 217–221 (§1.1, p. 5), 691–705 (Def. 2.2.1, Rem. 2.2.2, p. 15), 711–727 (Lemma 2.2.3, pp. 15–16), 1458–1464 (Ex. 5.0.5, p. 32), 1596–1606 (§5.3, p. 35), 2578–2618 (Thm 9.1.3 proof, pp. 57–58), 2663–2707 (Prop. 9.3.4, pp. 59–60), 2710–2735 (Lemma 9.3.5, p. 60). CONRAD99 lines 274–281 (Lemma 1.1.5), 329–342 (§1.2), 406–414 (Cor. 1.2.3), 435–446 (Lemma 2.1.1), 451–470 (nowhere density, Thm 2.1.2), 528–550 (§2.1 components), 599–606 (Lemma 2.2.1), 648–655 (after Def. 2.2.2), 658–672 (Lemma 2.2.3), 673–676 (Thm 2.2.4), 725–732 (Cor. 2.2.7), 734–754 (Cor. 2.2.8–2.2.9), 800–805 (Thm 2.3.1 proof), 1005–1022 (Lemma 3.3.1 proof). BH22 lines 228–233 (Ex. 2.1), 235–294 (Prop. 2.2), 243 (A₀), 295–299 (Rem. 2.3), 310–316 (Def. 2.4–2.5), 319–327 (Ex. 2.6, Lemma 2.8), 329–345 (Prop. 2.9), 346–352 (Cor. 2.10), 567–574 (Thm 2.29 proof). TEMKIN12 lines 99–108 (Thm 1.2.1), 110–122 (Rem. 1.2.2), 428–443 (§2.2.1), 1483–1488 (regularity = smoothness for rigid spaces), 1504–1521 (Thm 5.2.2), 1534–1548 (§5.3.2, Rem. 5.3.1), 1563–1575 (Thm 5.3.2). CONRAD10 lines 154–161 (Thm 2.1.1), 165–167 (Cor. 2.1.2), 189–215 (Lemma 2.1.3). POINEAU13 lines 180–184 (Notations, p. 271), 705–717 (Lemme 4.4, p. 284), 857–866 (Cor. 4.15, p. 287), 893–898 (Cor. 4.18, p. 288). CONRAD06 lines 1937–1960 (Def. 4.1.1, pp. 1096–1097). STACKS Morphisms line 3743 (054L); Algebra lines 12590 (00OF), 12687 (031E); More on Algebra lines 5129 (07C0), 5146 (07QI), 5169 (07NT), 5812 (07PM). DUCROS09 lines 105, 1769–1787 (Thm 3.1, Prop. 2.2), 1816–1823 (Thm 3.3). Every locator supports the claim as stated, with the source issues below and the gaps S03 and S10.

## Not verifiable

- SCHNEIDER11 (Corollary 5.8, Proposition 5.9, Lemma 9.2, Proposition 9.3, Remark 9.4): settled uncertified; cited by locator only, not reopened.
- BARTENWERFER76: the cached text for the GDZ copy is the repository's landing page, not the article, so the §3 locator of the Riemann extension theorem cannot be certified here; CONRAD10 Theorem 2.1.1 (lines 154–161) states it with the attribution and was verified.
- Berkovich 1990, Proposition 2.4.4 (S10): paywalled; not read.
- Lean elaboration: not run (read-only pass); the worker's elaboration failed on a missing Tau Ceti object file, so the comparison of binders with the README was done by reading the declarations.
- The round-1 reviews were read from the board's report files under the former roadmap name; their scratch copies are placeholders. No settled `not actionable in this package` item exists, so nothing is re-raised.
- Ownership against open pull requests whose files the brief did not supply was checked only through `roadmaps grep` and `roadmaps show` (DiamondsAndVStacks #820, ResolutionOfSingularitiesCharacteristicZero #1199), not by reading those heads in full.
- The consumers AdmissiblePairsAndPadicHodgeStructures (#1511) and ClassicalAdicEtaleCohomologyPartII (#1549) cite this roadmap by the labels RZ.0–RZ.5 and slugs such as `gauss-point-in-closure`, which this README no longer carries; that drift is theirs to repair and is not counted here.

## Source issues

- **Misprint** in HK2 at §1.1, printed p. 5 (line 219): the source says the local vanishing condition intersects the closed set with an unintroduced C; it should be the intersection with the affinoid open U; affects nothing.
- **Error** in CONRAD99 at the paragraph after Definition 2.2.2, printed p. 14 (line 648): the source says the local ring at a point is irreducible iff a unique global irreducible component passes through it; it should say a unique local branch, since the integral nodal cubic has one component and two branches at its node; affects a stated result.
- **Misprint** in CONRAD99 at Lemma 2.1.4 proof, printed p. 12 (line 564): the source says Z and Z minus X cover X; it should be Z and X minus Z; affects the proof.
- **Misprint** in BH22 at Proposition 2.2, proof of (1) ⇒ (2), printed p. 6 (lines 266–270): the source says the localized canonical reduction is a rank-one valuation ring with pseudo-uniformizer t; it should be the localization of A° at the inverse-image prime, completed where needed; affects the proof.
- **Misprint** in BH22 at Proposition 2.2 proof, printed p. 6 (line 243): the source says the chosen subalgebra is contained in itself; it should be contained in A°; affects nothing.
- **Gap** in TEMKIN12 at Theorem 5.2.2, printed p. 33 (line 1506): the source asserts compatibility with ground field extensions for rigid spaces without proof or reference; it should cite regularity of A → A ⊗̂ K′ (Ducros, Théorème 3.1); affects the proof.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "c8f36e6302f237bb973f8054f9cfdbee5f9be64b", "job": "RT-AdicSpacesPartV~2b", "model": "fable", "worker": "chris-x12"} -->
