<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1304#issuecomment-6629230715 -->
Red team round 2 pass b (claude) of 69db8ae

Verdict: needs_changes

1. **F01** (P3) Five analytification interface names are not declared by ComplexComparisonPartII

   Location: `packages/EtaleHomotopyTypes/README.md:143`, "Its `complexSchemeAnalytification.complexPoints`, `complexSchemeAnalytification.fibreProduct`, `complexSchemeAnalytification.reduction`, `complexSchemeAnalytification.etaleLocalIso` and `complexSchemeAnalytification.smooth` supply"; the same names at lines 873, 881, 887 and 895.

   Claim: these five are declarations of ComplexComparisonPartII §C−1.1.

   Witness: ComplexComparisonPartII at its open head (#848), §C−1.1, its line 774 onward, declares only `complexSchemeAnalytification` and states the complex-points topology, fibre products, reduction, étale local biholomorphisms and smooth product charts in prose; none of the five dotted names occurs in that README, and the worker's resolver lists three of them as found nowhere.

   Repair: at line 143 replace "Its `complexSchemeAnalytification.complexPoints`, `complexSchemeAnalytification.fibreProduct`, `complexSchemeAnalytification.reduction`, `complexSchemeAnalytification.etaleLocalIso` and `complexSchemeAnalytification.smooth` supply the point topology, finite fiber products, nilpotent compatibility, étale local analytic isomorphisms and smooth local product charts." by "Its complex-points, fibre-product, reduction, étale-local-isomorphism and smooth-chart comparisons, stated in §C−1.1 for `complexSchemeAnalytification`, supply the point topology, finite fibre products, nilpotent compatibility, étale local analytic isomorphisms and smooth local product charts." At line 873 replace "`complexSchemeAnalytification.smooth`" by "the smooth-chart comparison of `complexSchemeAnalytification`"; at line 881 replace "(`complexSchemeAnalytification.smooth`)" by "(smooth-chart comparison of `complexSchemeAnalytification`)"; at line 887 replace "`complexSchemeAnalytification.etaleLocalIso`" by "the étale-local-isomorphism comparison of `complexSchemeAnalytification`"; at line 895 replace "(`complexSchemeAnalytification.fibreProduct` and `complexSchemeAnalytification.etaleLocalIso`)" by "(fibre-product and étale-local-isomorphism comparisons of `complexSchemeAnalytification`)". Test: the resolver's three leads vanish and the one remaining backticked name resolves at #848 line 774; the mathematics cited (points topology, fibre products, reduction, étale local isomorphisms, smooth charts, infinite affine covers) is all stated there.

2. **F02** (P3) The sheaf-of-sets half of Corollary 3.2 is narrowed to finite étale schemes

   Location: `packages/EtaleHomotopyTypes/README.md:623`, "and that every finite étale X-scheme E, as a sheaf of sets, is cohomologically proper in dimension ≤ 0 over K (SGA1 XIII Theorem 3.1(2)(a) and Corollary 3.2(1)".

   Claim: the cited Corollary 3.2(1) concerns finite étale sheaves of sets.

   Witness: SGA1 line 11940: 3.2(1) asserts dimension ≤ 0 for every sheaf of sets on a coherent k-scheme, with no desingularizability hypothesis; its proof (SGA1 line 11949–11959) reduces to constructible sheaves, and 3.1(1)(b) (SGA1 line 11652–11669) treats constructible sheaves of sets. The skyscraper at 0 of a two-element set on 𝔸¹_K has sections 2 over 𝔸¹ and 2 over 𝔸¹_A for strictly henselian A, as 3.2(1) asserts, and is not finite étale.

   Repair: replace the quoted clause by "and that (F,X) is cohomologically proper in dimension ≤ 0 over K for every sheaf of sets F on X, in particular for every finite étale X-scheme E (SGA1 XIII Theorem 3.1(1)(a)–(b) and (2)(a), Corollary 3.2(1) and (2)(b), pp. 293–303; SGA1 line 11556, SGA1 line 11562 and SGA1 line 11938)". After the sentence "The sheaf-of-sets assertion follows from the torsor assertion for a Galois closure of E and SGA1 XIII Proposition 1.13(3) (SGA1 line 10656)." add: "For a constructible sheaf of sets F on finite-type X follow SGA1's proof of 3.1(1)(b) (SGA1 line 11652 to SGA1 line 11669): embed F in a finite product of direct images of finite constant sheaves along finite-type morphisms Z_i → X (SGA 4 IX 2.14(ii), cited by locator without text), apply the finite-type dimension ≤ 0 assertion for constant sheaves on the Z_i, Proposition 1.9 for the product and 1.13(1) with the amalgamated sum G ∐_F G. An arbitrary sheaf of sets is a filtered colimit of constructible ones (SGA 4 IX 2.7.2) and direct image along the coherent X → Spec K commutes with filtered colimits (SGA 4 VII 3.3), both cited by locator without text; the qcqs limit step is unchanged." Add "IX 2.7.2, IX 2.14(ii), VII 3.3" to the SGA4 locator at line 1069 and in `sources.toml`. The Galois-category deduction in the product formula keeps using the finite étale case only.

3. **F03** (P3) The Needs line of §3.5 names §3.0a, which the base-change target does not use

   Location: `packages/EtaleHomotopyTypes/README.md:585`, "*Needs:* §3.3; §1.1; §1.5; EtaleCohomologyFoundations §F.0.2; §3.0a for completion."

   Claim: finite étale base change consumes the profinite completion of §3.0a.

   Witness: lines 581–583, the statement and route of §3.5, mention no completion; the same entry stood on the base-change target before the renumbering (commit 6962204, old §3.6, its line 595), so it is a stale dependency rather than a swap artefact.

   Repair: delete "; §3.0a for completion" at line 585, leaving "*Needs:* §3.3; §1.1; §1.5; EtaleCohomologyFoundations §F.0.2." Line 605 (§3.6) and line 720 are unchanged.

4. **F04** (P3) The docstring's reason for omitting §3.0a overstates the missing carrier

   Location: `packages/EtaleHomotopyTypes/Suggested.lean:33`, "The profinite-completion universal property for a pro-group lacks the native general pro-group carrier".

   Claim: §3.0a cannot be stated at the pins.

   Witness: with H represented by its finite quotients (README line 494), the universal property is the bijection between continuous homomorphisms out of `(ProfiniteGrp.limitCone (G ⋙ ProfiniteGrp.profiniteCompletion)).pt` and the limit over `OpenNormalSubgroup H` of the colimit over I of the Hom sets `G.obj i ⟶ H ⧸ N`, all native (`ProfiniteGrp.toFiniteQuotientFunctor`, Limits.lean line 48; limits and colimits in `Type`); no pro-group carrier is needed. The target is an adapter (SS line 369–373), not a headline, so it is rightly absent.

   Repair: replace the bullet by "* The profinite-completion universal property for a pro-group (§3.0a) is an adapter rather than a headline and is not stated; its finite-quotient form is expressible with native limits and colimits of types." Add no declaration.

## Round-1 findings at this head

Each earlier finding was checked against the head; the repaired passage is quoted (at most a few words) with its witness.

| Finding | Status | Repaired passage and witness |
| --- | --- | --- |
| a F01 (P2) abelian derived-limit headline | not applied, reason stated (input lemma SS A.7, not a headline); settled, not re-raised | README line 391 keeps the full abelian statement with `s > 0`, finiteness and `HasInjectiveResolutions`; `Suggested.lean` line 25 lists only the nonabelian part as missing |
| a F02 (P3) forward reference §3.5 → §3.6 | repaired | README line 579 "### 3.5 Finite étale base change", line 587 "### 3.6 Raw and finite étale homotopy groups"; §3.6's higher-group bullet (line 596) now cites §3.5; references at lines 605, 654, 669, 673, 681, 695, 706–712, 761, 783, 803, 1050 and `sources.toml` `cited_for` ("3.6 unibranch components") use the new numbers. One stale entry survives the swap, S03 |
| a F03 (P1) relative purity unowned | repaired | lines 157 and 159 declare gap:relative-etale-depth and gap:relative-homotopical-purity to LocalPurity §2.2 (on main, line 302 there); both slugs in `plan.json`; their `needs` match SGA2 line 6545 (flat, separable fibres, Y_s rare, alternatives a)/b)) and SGA2 line 6563 (regular morphism, alternatives a)–c)); the route at line 621 names them at the uniqueness and crossing steps where SGA1 line 12585 and 12598 invoke SGA 2 XIV 1.19 and 1.20 |
| a F04 (P2) finite-type range | repaired | line 623 "Let X be a quasi-compact quasi-separated K-scheme", line 625 same, line 627 "Let X be a connected quasi-compact quasi-separated K-scheme and Y any K-scheme", line 629 "Y a connected K-scheme … No finiteness condition and no K-rational point is required of Y"; limit routes cite StacksLimits line 791 (Lemma 7.2, 09MV) and SGA1 line 12084–12086; Checks at line 647 compute both non-finite-type instances |
| a F05 (P2) compound gap | repaired | lines 133 and 135 are two contracts; the descent slug is used at lines 623 and 625 and in the Needs at 650 and 720; the base-change slug at 621 |
| a F06 (P2) covering classification | repaired | line 73 "classify connected pointed coverings with vertex-unique lifting by subgroups of π_1(K), with pullback followed by the component of the chosen vertex"; identical in `plan.json` |
| a F07 (P3) docstring omissions | repaired | `Suggested.lean` lines 45–51 name strong desingularizability, normal-crossings and qcqs cohomological properness, the relative Abhyankar step, local 1-asphericity and 0-acyclic projections with the carriers each lacks |
| a F08 (P3) SS line anchor | repaired | line 1056 "SS line 228 and SS line 1421"; SS line 1421 is the Appendix heading |
| b F01 (P3) compound gap | repaired | same as a F05 |
| b F02 (P3) product formula with arbitrary Y | repaired | line 629 "the direct images under f of the stacks of torsors under finite groups are pulled back from Spec K, hence constant, as SGA1 uses at SGA1 line 12303"; SGA1 line 12303 says exactly that |
| b F03 (P3) limit declaration names | repaired | line 38 names `ProfiniteGrp.limitCone` and `ProfiniteGrp.limitConeIsLimit` with lines 330 and 347, verified at the pin (abbrev at 330, def at 347, `F : J ⥤ ProfiniteGrp.{max v u}`); lines 510 and 720 cite them |
| b F04 (P3) trailing sentence in a contract | repaired | line 139 ends at "Corollary 1.16)." and equals the plan's `needs` (all 29 compared by script) |
| b F05 (P3) docstring | repaired | same as a F07 |
| b F06 (P3) downstream duplication | repaired | line 1050 names AnabelianGeometryAndNonabelianChabauty §1.5 and §1.10 as supplied by §§1.9, 3.3, 3.4, 3.6, 3.9b and §3.9d; both sections exist at that roadmap's open head (its lines 3948 and 4300) and it does not cite this roadmap |

No repair introduced a new mathematical error: every new Check of §3.8a was recomputed (table below) and the new route sentences agree with SGA1 line 12577–12600, 11961–11982 and 12282–12313.

## Verified sound

Read in full: `packages/EtaleHomotopyTypes/README.md` (1072 lines: 59 numbered subsections, 6 bold targets in §3.8a, 113 Check bullets, 59 Needs lines, 29 gap contracts) and `packages/EtaleHomotopyTypes/Suggested.lean` (79 lines, no declaration). Counts: 0 Lean declarations (nothing to elaborate; no `#check` comparison possible); 65 targets read; 113 Checks read, 39 recomputed with values below; 113 source line locators verified against the cached texts (SGA1 46, SS 37, I01 7, IEt 9, IStr 1, IC 2, BHH 3, DAG13 3, SGA2 2, StacksLimits 1, StacksVarieties 2), each landing on the cited statement, definition, remark or proof step; 36 pinned declaration lines read (Mathlib 24, Tau Ceti 12), every file and line as cited; 52 supplier citations resolved (sections and declaration names) on main, in Completed, or at the open head through the service; 29 gaps compared with `plan.json` by script (slugs, suppliers and `needs` identical; the plan changed only in `gaps`, 7 → 29, since the design commit).

Headline statability at the pins: the end theorems (§§3.7, 4.4–4.7, 6.8–6.9) and the intermediate ones need an étale fundamental group of a scheme, finite étale morphisms of schemes, a Pro carrier on simplicial sets, homotopy groups of Kan complexes beyond `SSet.π₀`, torsor stacks, resolution of singularities or analytification; none exists in Mathlib or Tau Ceti at the pins (greps of `Mathlib/AlgebraicGeometry`, `Mathlib/CategoryTheory`, `Mathlib/AlgebraicTopology`, `TauCeti/AlgebraicGeometry`, `TauCeti/AlgebraicTopology`, `TauCeti/CategoryTheory`: no `Pro`, no étale π₁, only `Algebra.FiniteEtale` for rings in `Mathlib/RingTheory/Etale/Finite.lean`, cubical `HomotopyGroup` for topological spaces only). The abelian half of §2.2 is statable and is settled as a non-headline (a F01). S04 corrects one reason; no headline is statable and absent, no stand-in is present, no padding exists.

Lean inventory:

| Section | Declarations | Variable and instance context | Computed comparison | Result |
| --- | ---: | --- | --- | --- |
| whole module | 0 | none | README headlines needing missing carriers: all; statable headlines: 0 | docstring accurate except S04 |

Dependency gate, exact command of the brief, exit 0, complete output:

    depcheck: 205 roadmaps, 1755 edges, 0 problem(s)

No UPWARD, CYCLE or moved line. Suppliers on main: AdicSpacesPartII, AlgebraicTopology, GeneralizedCohomology, BordismFormalGroups, Orbifolds, EnhancedDerivedSheaves, SchemeAndStackFoundations, EtaleCohomologyFoundations, PerfectoidSpaces, LocalPurity; in Completed: ProfiniteProPGroups, UniversalCovers; earlier in the merge order at open heads: StableHomotopyKTheory (4), ResolutionOfSingularitiesCharacteristicZero (6), DiamondsAndVStacks (16), CrystallineCohomology (22), ComplexComparisonPartII (43); this roadmap at 44; every downstream roadmap named at line 1050 is later (50, 84, 197, 198, 222). The package is only its folder: `git diff --stat origin/main...HEAD` lists 13 files, all under `packages/EtaleHomotopyTypes/`. No pull-request number, process narrative, `lemma`, `set_option`, computational algorithm or machine path in the README, the Lean file or `sources.toml`; every target carries a locator; the Lean file has one `import Mathlib`, no declaration, no `True` placeholder.

Supplier sections resolved with their content checked against the README's description: AdicSpacesPartII §R0.19.9 (its line 7793: `Pro`, `Pro.mk`, `Pro.homEquiv`, `Pro.homEquiv_stage`, `Pro.homEquiv_naturality`; no cofinality, cofinite reindexing, universe comparison or level representation there, so the five pro gaps are minimal); DiamondsAndVStacks §D0.13 (line 1269); PerfectoidSpaces §P6.10 (line 14654, `HasKappaSmallPresentation` on `(Ind Cᵒᵖ)ᵒᵖ`); GeneralizedCohomology G2 item 1 (unpointed Kan–Quillen model and pointed undercategory, line 211 onward; no properness statement, gap minimal) and item 10; BordismFormalGroups §F6.5 (line 1526; the Cartesian Kan–Quillen monoidal model axiom at its line 1572 and the "Coherent model diagrams and stable enhancements" block at its line 2005, both inside F6.5, which has no later header before 2010); AlgebraicTopology Stage 6 (line 946, direct L-valued cochains without reflexivity at line 213) and Stage 8 (line 1602; items 2 and 3 at lines 1655–1657 and 1684; no Postnikov, Moore–Postnikov, nonabelian lim¹, Bousfield–Kan or bisimplicial-diagonal statement: lim¹ there is for countable towers of cochain complexes, line 961, so the nine topology gaps are minimal); Completed/UniversalCovers Stages 2–4; StableHomotopyKTheory §§1.19–1.23, 1.28–1.34, 2.3–2.6 (headers at lines 322–601; §1.31 "ψ(g)=hφ(g)h⁻¹ … basepoint track edge(h)" matches the αφα⁻¹ convention; no Kan-fibration criterion for the nerve of a surjection, gap minimal); Orbifolds O4-N (line 314, item 3, Čech descent for a numerable surjective submersion at 321); EnhancedDerivedSheaves §§E0.2–E0.5, E0.8, E2.6 (no Pro construction and no topological realization of hypercovers there, gaps minimal); SchemeAndStackFoundations §0.9 (`noetherian_approximation` line 856, `finite_presentation_limits` line 859), §0.10 (`IsGeometricallyUnibranch.of_etale`; `unibranch_finite_components` at line 889 is for finite locally constant sheaves only, as the README says), §§0.11, 0.12, 2.10, 2.15 (`etale_cohomology_limits`); EtaleCohomologyFoundations §F.0.1 (modules only, so the set-valued subsheaf gap is minimal), §F.0.2, §F.0.4, §F.0.A2 (quasi-compact geometrically connected over a field, algebraic closure, path-dependent sections, as described), §F.2.1 (abelian torsion proper base change only, gap minimal), §F.2.3 (ULA for constructible complexes, no 0-acyclic or 1-aspheric notion, gap minimal), §F.2.6 (finite-type X, Y over separably closed k, finite Λ with invertible annihilator), §F.3 (`VanishingCycles.etaleFiniteness` line 692 retains constructible direct images for finite-type field schemes; `VanishingCycles.lisseDirectImageTransport` line 707 for smooth proper f with finite lisse coefficients), §0.10 (`ClassicalAlgebraic.smoothBoundaryPurity`, i^!Λ ≅ Λ(−c)[−2c], giving R^0j_*A = A, R^1j_*A = A(−1), no higher terms along a smooth divisor); ComplexComparisonPartII §C−1.1 (S01), §§C5.1, C6.1–C6.3 (lines 2336, 4015, 4127, 4158); ResolutionOfSingularitiesCharacteristicZero §5.5 (line 842: every reduced finite-type characteristic-zero scheme, isomorphism over Reg, no separatedness), §§5.1–5.4, 6.1, 6.2 (line 894: smooth quasi-projective); CrystallineCohomology CR.5:log-algebra.4 (header at line 8057, "The classical Abhyankar lemma" block at line 8189 inside it, with the root covers and the tame group ∏_{ℓ≠p} ℤ_ℓ(1)^r); LocalPurity §2.2 (line 302: `restrictOpen_fullyFaithful_of_depth` and `finiteEtale_extend_of_purity` on absolute locally noetherian schemes; no relative statement, gaps minimal); ProfiniteProPGroups Layers 0, 3, 4; AnabelianGeometryAndNonabelianChabauty §§1.5, 1.10 (exist, no citation of this roadmap). The 29 gaps are precise, minimal and declared in both places; no supplier is `none`.

Ownership by object: the service grep over 441 open heads and main for "rigid hypercover", "strongly center-free", "p-profinite completion" and "Isaksen" finds only EllAdicHomotopyTypesAndWeights (#1644, merge order 198), which consumes this roadmap by name (its lines 13, 95–99) and declares a gap on it; it builds no second rigid type. InverseGaloisAndArithmeticFundamentalGroups, MotivicEtaleKTheory and ArithmeticKTheoryPartII do not cite this roadmap at their heads; the "consumes" sentences at line 1050 are this roadmap's description of them, not citations. No sibling checkout named in the brief constructs the étale homotopy type, pro-coverings, the Isaksen model or the relative outer-Hom adapters. The move of pro-group completion (§3.0a), strong center-freeness and relative outer Hom (§4.0a), open image (§4.0b) and raw effacement and products (§§3.9b–3.9c) into this roadmap is legitimate: no earlier roadmap states them.

Adversarial table (values computed on both sides):

| Statement | Instances | Left side | Right side | Result |
| --- | --- | --- | --- | --- |
| §3.8a normal crossings, c.p. ≤ 1 | U = Gₘ, F = C₂, A = K[t]^sh at 0 | Tors(U): Kummer classes 1, z, so 2 | A[z,z⁻¹] factorial so Pic = 0; units A^×z^ℤ with A^× 2-divisible, so 2 | agree |
| same | D = ∅; U = ∅ | ℙ¹ and ℙ¹_A simply connected: 1 class; empty torsor: 1 object | same | agree |
| §3.8a i_*Φ not a torsor stack | U = Gₘ ⊂ ℙ¹, F = C₂, stalk at 0 | L = Frac of the strict henselization, L^× = A^× t^ℤ, L^×/2 = ℤ/2: 2 classes, Aut = C₂ | torsor stack over a strictly henselian ring: 1 class | not a torsor stack, as stated |
| §3.8a relative normal crossings needed | S = 𝔸¹, D: z² = s | fibre s ≠ 0: Gₘ, 2 classes | fibre s = 0: 𝔸¹, 1 class; 1.14 with u smooth would force equality | hypothesis needed |
| §3.8a strictly henselian reformulation | K = ℝ, Z = Spec ℝ, A = ℂ, F = C₂ | H¹(ℝ,C₂) = 2 | H¹(ℂ,C₂) = 1, yet (C₂, id) is c.p. over ℝ | reformulation needs K separably closed, as stated |
| §3.8a descent along normalization | nodal cubic N, F finite | X₂ = diagonal ∪ {(0,∞),(∞,0)}; descent datum one g ∈ F up to conjugation: F/conj | Hom(ℤ̂,F)/conj = F/conj; same after ⊗A since ℙ¹_A simply connected | agree |
| §3.8a locally 0-acyclic | 𝔸¹ → 𝔸¹, x ↦ x², at 0 | strict-local fibre over a geometric generic point: Ω[x]/(x² − s) = Ω × Ω, 2 points | required: 1 connected point | fails, as stated |
| §3.8a criterion needs local 0-acyclicity | Spec κ ⊔ Spec L → Spec R, R a DVR | geometric fibres: 1 point each; two-element sheaf: 2 sections on Spec R, 4 upstairs | strict-local fibre at Spec κ over the geometric generic point: L ⊗ κ = 0, empty | not locally 0-acyclic, not 0-acyclic, as stated |
| §3.8a 0-acyclicity on all sheaves of sets | X′ = {xy = t} ∖ {0} over A | A[x,y]/(xy−t) ↪ A[x,x⁻¹] so a domain; Jacobian (y,x) ≠ 0 on X′; closed fibre two punctured lines | skyscraper of 2 points at the closed point: 2 sections on Spec A, 4 on X′; constant sheaves: 2 and 2 | constant sheaves do not detect it, as stated |
| §3.8a projections 0-acyclic | X = ∅; X = 2 points; X connected | sections of a 2-element sheaf on Y: 2 | on X × Y: 1; 4; 2 | only connected X works |
| §3.8a product formula | X = Gₘ, Y = Spec K(t) | π₁(Gₘ ⊗ K(t)) = ℤ̂(1) ⋊ G_K(t) with trivial cyclotomic action, split by 1 | ℤ̂(1) × G_K(t) | agree, no K-point used |
| same | X = Spec K[t₁,t₂,…], Y = Gₘ; Y = Spec K | FEt(X) = 2-colim FEt(𝔸ⁿ) trivial, so 1 × ℤ̂(1); identity | same | agree |
| §3.8a five-lemma step | general X, Y | left square: π₁(X_b) → π₁(X×Y) → π₁(X)×π₁(Y) equals (iso, trivial) by exactness and the fibre comparison | right square: projection to π₁(Y) | middle map iso; compact so homeomorphism |
| §3.8a connectedness via Stacks 0385/0363 | X geometrically connected, Y connected | π₀(X ×_K Y) ≅ π₀(Y) = 1 (StacksVarieties line 372) | X connected over separably closed K is geometrically connected (line 387) | agree |
| §3.8a hypotheses versus SGA1 4.1/4.2 | README's (C,f) ≤ 1 for all C, f′_*E constructible for all étale S′ and finite étale E | 4.2 (SGA1 line 12162) asks finite étale S′ and E a quotient of a Galois cover; 1.13(3) (line 10656) gives (Q/G,f′) ≤ 0 from (G,f′) ≤ 1 and (F,f′) ≤ 0 | README hypotheses imply the source's | agree |
| §3.8a base change of c.p. ≤ 1 (1.5(c)) | S′ → S | SGA1 line 10366–10368: ≤ 1 is stable under base change, ≤ 0 and ≤ −1 are not | README uses only ≤ 1 | citation correct |
| §3.8a relative Abhyankar: root cover | étale-locally P′ = S′[x₁,…,xₙ], D = {x₁⋯x_r = 0} | X′₁ = S′[T₁,…,T_r,x_{r+1},…]: smooth over S′, fibres normal hence geometrically unibranch | SGA2 line 6545 alternative b) applies | gap:relative-etale-depth applies as stated |
| §3.8a relative Abhyankar: DVR step | maximal point y of Y′₁ | Y′₁ flat over S′ so y lies over a maximal point s of S′; (X′₁)_red = X′₁ ×_{S′} S′_red at y is smooth over the field O_{S′_red,s} of dimension 1 | a DVR | agree with SGA1 line 12598–12600 |
| §3.8a relative purity Check | S′ = Spec K[ε]/ε², X = 𝔸²_{S′}, Z zero section; 𝔸¹_K, Z = 0 | codim 2: alternative a); covers of X ∖ Z = covers of 𝔸²_K ∖ 0 = trivial | codim 1, étale depth of Spec K is 0, homotopical depth < 3: no alternative; Kummer t ↦ t² does not extend | both as stated |
| §3.8a qcqs limit step | X = lim X_i | Tors(X,F) = 2-colim Tors(X_i,F) by `finite_presentation_limits` | Tors(X ⊗ A,F) = 2-colim Tors(X_i ⊗ A,F); stage equivalences pass to the colimit | sound |
| §3.8a universal local 1-asphericity | X = Spec K ⊔ Spec K; nodal cubic at the node | strict-local fibres are points; strictly henselian local scheme | nonempty, connected, no finite torsors | holds, connectedness not needed here |
| §3.8a characteristic p control | w^p − w = xz on 𝔸² | class of xz not of the form f(x) + g(z) modulo h^p − h (mixed monomial not a p-th power) | H¹(𝔸²,𝔽_p) ≠ H¹(𝔸¹)² | π₁(𝔸²) ≠ π₁(𝔸¹)², as stated |
| §3.8a Gₘ² Check | X = Y = Gₘ | 1 → ℤ̂(1) → π₁(Gₘ²) → ℤ̂(1) → 1 split by y ↦ (1,y) | ℤ̂(1)² | agree |
| §3.6 Check 4 | ℙ¹ over K̄, char 0 | H³(ℙ¹,ℤ) ≅ H²(ℙ¹,ℚ/ℤ) = colim ℤ/n(−1) = ℚ/ℤ(−1); no class dies on finite covers | pro-H₂ = (ℤ/n(1)): Hom to ℚ/ℤ is colim ℤ/n(−1) = ℚ/ℤ(−1), each map through a finite subgroup; Ext(H₁,ℚ/ℤ) = 0 | consistent |
| §3.6 higher-group route | normal integral X_i, coefficient V a ℚ-vector space | stalk of R^q j_*V at x̄ is H^q(Frac O^sh, V) = 0 for q > 0 (Galois cohomology is torsion), so H^q(X_i,V) = 0 | a pro-homomorphism H_n → A with zero composite to A ⊗ ℚ lands in A_tors at a finer level; H^n(X_i,A_tors) = colim over finite subgroups; UCT natural in coefficients | finite image, as stated |
| §3.6 unibranch components | P an F-torsor, P₀ a component, x any point | over the domain O^sh_{X,x}, P = ∐_F Spec O^sh and P₀ = |T| copies | generic fibre of P₀ is Spec L with [L:K] = |T| at every x | SGA1 I 10.10 applies |
| §3.0a Check 5 | ℤ ←×2 ℤ ←×2 ⋯ | lim(ℤ₂,×2) = ∩2ⁿℤ₂ = 0, ℓ ≠ 2 automorphism: ∏_{ℓ≠2}ℤ_ℓ; Hom to C₃: 3 | colim Hom(ℤ,C₃) along ×2 (invertible mod 3) = C₃: 3; completing 0 gives 1 | agree |
| §2.1 Check 3 | diagram * → {0,1}, * ↦ 0 | on the chain a→b, d⁰(c)_{a→b} = c_b = 1 | d¹(c)_{a→b} = f(c_a) = 0 | (*,1) has no Tot_1 extension, as stated |
| §2.4 Check 2 | X = {x₀,x₁,a} | horn Λ²₀ in Δ[1] with d₂ = (0,1), d₁ = (0,0) needs a monotone (v₀,v₁,v₂) with v₁ = 1, v₂ = 0 | impossible | not a Kan fibration; SS A.2.3 "trivial fibration" refuted |
| Conventions: transport order | (12) in S₃ by (123) then (12) | (123)(12)(132) = (23); (12)(23)(12) = (13) | combined conjugator (12)(123) = (23); (23)(12)(23) = (13) | consistent |
| §2.2 cofilteredness | I = (a → c ← b), A_a = A_b = 0, A_c = ℤ/2 | lim¹ = coker(0 → ℤ/2) ≠ 0 | cofiltered I: cofinite directed presentation, vanishing | hypothesis present and needed |
| §4.7 orbit product | geometric kernel π₁(Y₁,k̄) × π₁(Y₂,k̄) acting componentwise | orbits of a product group on a product set = product of orbit sets | Y₁ × Y₂ geometrically unibranch: X^ν × Y^ν → X × Y finite birational universal homeomorphism from a normal scheme (char 0) | §4.4 applies to the product |
| §3.9c Künneth degrees | q ≥ 2 class in H^q(Y₁ × Y₂) | summands with i ≥ 2 or j ≥ 2 killed by K(π,1); (1,1) summands killed by covers of a factor since H¹ = Hom(π₁,A) | Tor terms have i + j = q + 1 ≥ 3 | all killed on a common cover |
| §6.2 Check 2 | BC_q, q ≠ p | H^n(BC_q,𝔽_p) = 0 for n ≥ 1; Hom(C_q,P) = 1 for a p-group P | maps into every p-finite K agree with those from a point | completion contractible |
| §6.4 Check 3 | ∐_ℕ Spec ℂ | Mat of the pro-finite-set completion is discrete βℕ; all functions βℕ → 𝔽_p | H⁰_et = 𝔽_p^ℕ = continuous functions βℕ → 𝔽_p, strictly smaller | as stated |
| §5.1 route | T = ∅; gluing on D(e) | zero ring, Spec empty, both Hom sets singletons | C(T)[1/e] → C({e ≠ 0}) injective (f = 0 off Z(e) forces fe = 0) | uniqueness on the distinguished cover sound |
| §1.1 Check 3 | Sing(S¹) → * | a vertex lift Δ[0] → Δ[1] has many 1-simplex lifts | covering needs exactly one | not a covering |
| Supplier convention | StableHomotopyKTheory §1.31 | track edge(h) for ψ = hφh⁻¹ | README transport α φ α⁻¹ | agree |

Hypotheses confirmed present where needed: cofiltered I in §2.2; connected pointed in §§0.4, 1.2, 1.8–1.9; profinite π_n in §§2.3, 2.7; path-connected Y, B with surjective π₁ in §§2.8–2.10; noetherian geometrically unibranch in §3.6's second assertion and §§3.9b–3.9d, 4.1–4.7; algebraically closed K of characteristic zero throughout §3.8a; separably closed K for the strictly henselian reformulation; connected X for 0-acyclic projections; geometrically connected factors in §3.9a; strongly center-free G_k in §§4.4–4.7; finite abelian coefficients where Artin comparison and Künneth enter; H⁰ = 𝔽_p and H¹ = 0 in §§6.5, 6.8.

## Not verifiable

- BK (XI 5.2, XI 7.1, IX 5.1, IX 5.4), AM (4.3, 11.1), Fr (5.9, 11.5), FGV (Appendix A), SGA5 (I 3.1.5) and SGA4 (VIII 9.4, IX 1.6(ii), 2.9, 2.11, 2.7.2, 2.14(ii), VII 3.3, XII 5.1, XV 1.3, 1.11, 1.16, 2.1, 4.1) are settled uncertified; their statements were checked only against SGA1's and SS's own uses of them, not against their text. The definition of strong desingularizability and the "désingularisable (EGA IV 7.9.1)" reference at SGA1 line 11985 could not be compared with their sources.
- Lean elaboration was not run (no Lean command is given to this pass; the file declares nothing).
- Printed page numbers were checked only where a page marker sits near the cited line (SGA1 pp. 262, 265, 272, 274, 282, 289, 293, 303, 311, 317; SGA2 pp. 176–177; SS pp. 822–829, 853–866).
- Ownership against open pull requests was checked through the service index (441 heads) and the sibling checkouts named in the brief, not against pull requests without files.

## Source issues

- **Misprint** in SGA1 at XIII Proposition 1.12(2), printed p. 270 (SGA1 line 10603): the source puts the dimension ≤ 1 hypothesis on the stack Φ being proved about; it should be on Φ₁, the first term of the exact diagram; affects the proof.
- **Misprint** in SGA1 at XIII Proposition 4.6 proof, printed p. 310 (SGA1 line 12297): the source invokes Corollary 3.5 for universal local 1-asphericity of the structure map; it should invoke Corollary 3.4; affects the proof.
- **Misprint** in SGA1 at XIII Proposition 4.6 proof, printed p. 311 (SGA1 line 12307): the source says the composite from the fibre group through the product group ending in the group of Y is an isomorphism; it should end in the group of X; affects nothing.
- **Misprint** in SGA1 at XIII Proposition 5.5, printed p. 317 (SGA1 line 12568): the source names the complement of the divisor Y and its complement U, reversing 5.4's convention; it should be Y the support of D and U its complement; affects a stated result.
- **Misprint** in SGA2 at XIV Lemma 2.1.1, printed p. 178 (SGA2 line 6596): the source says the displayed inequality is an inequality exactly when the two invariants agree; it should say it is an equality exactly then; affects nothing.
- **Error** in SS at Appendix A.2.3, printed p. 858 (SS line 1651): the source says the projection from the relative cylinder to X is a trivial fibration in the two-point undercategory; it should say a weak equivalence, since for a third vertex the fibre is Δ[1], not Kan; affects the proof.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "69db8ae91e98b75620bf7486282e2219e940b983", "job": "RT-EtaleHomotopyTypes~2b", "model": "fable", "worker": "chris-x13"} -->
