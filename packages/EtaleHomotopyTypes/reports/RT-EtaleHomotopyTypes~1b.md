<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1304#issuecomment-6406772245 -->
Red team round 1 pass b (claude) of 6962204

Verdict: needs changes

1. **F01** (P2) Compound supplier gap: base change and descent in one contract

   Location: `README.md` line 133 (`What EtaleCohomologyFoundations must provide (gap:nonabelian-proper-base-change)`) and `design/plan.json`, the gap with that slug.

   Claim: one `needs` sentence asks for three theorems of two kinds: proper base change for sheaves of sets and for `R¹` with ind-finite group coefficients (SGA 4 XII 5.1), proper base change for every ind-finite stack (SGA1 XIII 1.4 and 1.8), and universal effective descent along proper surjective finitely presented morphisms (SGA 4 VIII 9.4).

   Witness: the README consumes the two halves at different targets: base change for ind-finite stacks in the normal-crossings target (line 611, "Proper base change for ind-finite stacks along P → S") and descent in the finite-type and local-asphericity targets (lines 613 and 615, "Proper surjective descent of torsor stacks"). The brief's gap rule counts a compound `needs` as a defect; the intake announces one sentence on the supplier's job, so the supplier cannot deliver or dispute the two halves separately.

   Repair: split into two slugs with the same supplier and section (EtaleCohomologyFoundations §F.2.1), in both `README.md` and `plan.json`: `gap:nonabelian-proper-base-change`: "For a proper morphism, prove base change for the direct image of an étale sheaf of sets and for R¹ with coefficients in an ind-finite sheaf of groups (SGA 4 XII 5.1), and for the direct image of every ind-finite stack, including the direct image along a coherent morphism of the stack of torsors under a finite constant group (SGA1 XIII Example 1.4 and Corollary 1.8)." and `gap:proper-surjective-torsor-descent`: "Prove that proper surjective morphisms of finite presentation are of universal effective descent for étale sheaves of sets and for their torsor stacks under finite constant groups (SGA 4 VIII 9.4)." Then repoint lines 613 and 615 and the `*Needs:*` lines at 638 and 708 to the descent slug where descent is used, keeping the base-change slug at line 611.

2. **F02** (P3) Geometric product formula narrower than its source

   Location: `README.md` line 619, "let X and Y be connected finite-type K-schemes … Prove that X ×_K Y is connected and that the projections induce a continuous isomorphism".

   Claim: the target restricts Y to finite type over K; SGA1 XIII Proposition 4.6 (SGA1 line 12282 to 12289) takes Y an arbitrary connected k-scheme, with the finiteness and strong-desingularizability hypotheses on X only.

   Witness: SGA1 line 12298 to 12303: the proof obtains "f_*C_Z and R¹f_*C_Z constant" from cohomological properness and local asphericity (Propositions 1.14 and 1.16), never from a finiteness hypothesis on Y; the README's route instead takes constructibility of f′_*E from EtaleCohomologyFoundations §F.3, which is why Y is restricted. The restriction is not needed by §3.9a (whose Y₂ is of finite type), so no consumer breaks, but the library statement is below the source.

   Repair: replace "let X and Y be connected finite-type K-schemes" by "let X be a connected finite-type K-scheme and Y a connected K-scheme", and in the route replace "constructibility of f′_*E, X ×_K Y and Y being of finite type over K" by "constancy of f′_*C and R¹f′_*C for every finite group C, from cohomological properness of (C,f′) in dimension ≤ 1 and local 1-asphericity of f′ through SGA1 XIII Propositions 1.14 and 1.16 (SGA1 line 10742 and 10798), as in SGA1's proof (SGA1 line 12298 to 12303)". The homotopy-exact-sequence target then applies with its constructibility hypothesis satisfied by constancy. Tested on Y = Spec A for a strictly henselian K-algebra A (not of finite type): the formula gives π₁(X ×_K Y) = π₁(X), which the stated version cannot assert.

3. **F03** (P3) A library input cited without a declaration

   Location: `README.md` line 500, "*Needs:* … Mathlib compact cofiltered-limit existence", and line 708, "Mathlib group completion, finite-quotient presentation and compact cofiltered limits".

   Claim: §3.0a's route forms lim_i in `ProfiniteGrp`; the Needs line names no declaration, and the Mathlib supplier contract (lines 31–39) lists none for limits in `ProfiniteGrp`.

   Witness: at the Mathlib pin, `ProfiniteGrp.limitCone` and `ProfiniteGrp.limitConeIsLimit` (`Mathlib/Topology/Algebra/Category/ProfiniteGrp/Basic.lean`, the limit cone from line 313 and `limitConeIsLimit` at line 347) supply exactly this; the brief requires library "has" claims to carry file and name.

   Repair: add to the Mathlib contract bullet on `ProfiniteGrp` (line 38): "`ProfiniteGrp.limitCone` and `ProfiniteGrp.limitConeIsLimit` (`Mathlib/Topology/Algebra/Category/ProfiniteGrp/Basic.lean`, lines 313 and 347) supply limits of small diagrams of profinite groups with their profinite topology." and replace "Mathlib compact cofiltered-limit existence" at line 500 and "compact cofiltered limits" at line 708 by "Mathlib `ProfiniteGrp.limitCone` and `ProfiniteGrp.limitConeIsLimit`".

4. **F04** (P3) Roadmap-internal sentence inside a supplier contract paragraph

   Location: `README.md` line 137, the paragraph "What EtaleCohomologyFoundations must provide (gap:constructible-set-subsheaves): …" ends with "The comparison of the raw pro-group with the finite-étale group is §3.5, and completion for a pro-group is §3.0a."

   Claim: the contract paragraph is what the intake announces on the supplier's job; its last sentence is about this roadmap's own sections and is not in the plan's `needs` (which ends at "Corollary 1.16).").

   Witness: `design/plan.json`, gap `constructible-set-subsheaves`, `needs` field, compared mechanically: the README paragraph equals the plan sentence plus the extra sentence. The other 25 gap paragraphs equal their `needs` exactly.

   Repair: delete the sentence from line 137; the scope paragraph (line 13) and §§3.0a, 3.5 already state both facts. If a pointer is wanted, append it to the prose paragraph at line 131 instead.

5. **F05** (P3) Module docstring omits four non-statable headline targets

   Location: `Suggested.lean` lines 41–44 (the Layer 3 bullet) and `README.md` lines 609–617.

   Claim: the docstring names, for Layer 3, the product formula and "the homotopy exact sequence of fundamental groups it rests on" as not statable, but not the other four bold targets of §3.8a: strong desingularizability of every finite-type K-scheme, cohomological properness of finite-type K-schemes in dimension ≤ 1, universal local 1-asphericity, and 0-acyclicity of projections.

   Witness: none of them is statable at the pins (Mathlib has `FiniteEtale R` for rings, `Mathlib/RingTheory/Etale/Finite.lean`, no étale fundamental group of a scheme, no torsor stacks, no resolution of singularities); the brief asks that each headline that is not statable be named with what it lacks.

   Repair: add after line 44 of `Suggested.lean`: "* Strong desingularizability of finite-type schemes over an algebraically closed field of characteristic zero, cohomological properness of their torsor stacks in dimension ≤ 1, universal local 1-asphericity and 0-acyclicity of projections lack resolution of singularities, étale stacks of torsors and the strict-localization fibre predicates."

6. **F06** (P3) Record the duplicated constructions in the later anabelian roadmap

   Location: `README.md` line 1038 (Downstream consumers).

   Claim: the paragraph says AnabelianGeometryAndNonabelianChabauty Layer 1 consumes raw K(π,1) recognition, finite-cover transport and the elementary-fibration sequence, but does not say which of its sections rebuild this roadmap's objects.

   Witness: AnabelianGeometryAndNonabelianChabauty at its open head, `README.md` §1.5 "The raw étale homotopy type" (construct the pro-simplicial étale homotopy type from pointed étale hypercovers, raw homotopy pro-groups, classifying map, profinite π₁ for geometrically unibranch varieties, finite-coefficient comparison) and §1.10 "Homotopy fibres of elementary fibrations" (pointed pro-homotopy fibre sequence and its long exact sequence) restate §§3.3, 3.5, 1.9, 3.4 and 3.9d here, and that README does not cite EtaleHomotopyTypes. This roadmap is the owner: it is at position 44 of the merge order and the anabelian roadmap at 197, and these objects are the subject of this roadmap. The repair belongs to the later pull request; the one-line repair here lets the intake route it.

   Repair: in line 1038 replace "AnabelianGeometryAndNonabelianChabauty Layer 1 consumes raw K(π,1) recognition, finite-cover transport and elementary-fibration homotopy sequences" by "AnabelianGeometryAndNonabelianChabauty Layer 1 consumes raw K(π,1) recognition, finite-cover transport and elementary-fibration homotopy sequences; its §1.5 (raw étale homotopy type, raw homotopy pro-groups, classifying map, profinite π₁ and finite-coefficient comparison) and §1.10 (elementary-fibration homotopy fibre sequence) are supplied by §§3.3–3.5, 1.9 and 3.9d here and are not constructed again".

Package read in full: `packages/EtaleHomotopyTypes/README.md` (1058 lines, 55 targets in 7 layers, 5 bold targets inside §3.8a, 26 declared gaps) and `packages/EtaleHomotopyTypes/Suggested.lean` (72 lines: module docstring and an empty namespace, no declaration). The checkout was at the pull request's head before reading. The earlier review (`reports/PKG-EtaleHomotopyTypes.md`) and the seven repair reports were read; the round-2 deletion of `finiteAbelianHigherLimits` as an input lemma (SS Lemma A.7, Jensen's theorem) rather than a headline is not re-raised.

## Verified sound

Counts: 0 Lean declarations (the file declares none; no binder check was possible or needed); 55 targets and the 5 bold targets of §3.8a read in full; 111 README Checks read, 46 recomputed with values (sample below); 105 source line locators verified against the cached texts (SS 38, I01 7, IStr 2, IEt 9, IC 2, BHH 3, DAG13 3, SGA1 39, StacksVarieties 2), every one landing on the cited theorem, definition, remark or proof step; 25 Mathlib and 12 Tau Ceti declaration lines read at the pins (Mathlib `6b7abb3`, Tau Ceti `a91d3aa`), all matching the cited file and line; 21 supplier citations resolved (sections and declaration names) on main or at the cited open head; 26 gaps compared with `plan.json`.

Headline statability: every end theorem of the README (§§3.7, 4.4–4.7, 6.8–6.9) and every intermediate theorem was tested for carriers at the pins. None is statable: `ProfiniteGrp`, `Ind`, `SSet`, `KanComplex`, `ModelCategory`, singular sets, `Sheaf.H`, right-derived functors and the profinite completion exist, but there is no `Pro` on simplicial sets with a homotopy pro-local system, no étale fundamental group of a scheme (only `Algebra.FiniteEtale` for rings), no analytification, no torsor stacks and no homotopy groups of Kan complexes beyond `SSet.π₀`. The abelian part of §2.2 is statable with native carriers; it is SS Lemma A.7 (Jensen's theorem), an input to §2.3, and its round-2 removal as a non-headline stands. The docstring's reasons were checked bullet by bullet; R05 records the one omission.

Dependency gate, exact command of the brief, exit 0, complete output:

    depcheck: 56 roadmaps, 647 edges, 0 problem(s)

No UPWARD, CYCLE or moved line. Every supplier named in a `*Needs:*` line or supplier table is on main (AdicSpacesPartII, AlgebraicTopology, GeneralizedCohomology, BordismFormalGroups, Orbifolds, EnhancedDerivedSheaves, SchemeAndStackFoundations, EtaleCohomologyFoundations, PerfectoidSpaces, ProfiniteProPGroups, Completed/UniversalCovers) or earlier in the merge order at an open head (ResolutionOfSingularitiesCharacteristicZero at 6, CrystallineCohomology at 22, ComplexComparisonPartII at 43, StableHomotopyKTheory at 4, DiamondsAndVStacks). Downstream consumers are all later (InverseGalois… 50, MotivicEtaleKTheory 84, AnabelianGeometry… 197, EllAdicHomotopyTypesAndWeights 198, ArithmeticKTheoryPartII 222).

Supplier sections resolved, with the statement checked against what the README claims of it: AdicSpacesPartII §R0.19.9 (`Pro(C) = Ind(Cᵒᵖ)ᵒᵖ`, `Pro.homEquiv`, `Pro.homEquiv_stage`, `Pro.homEquiv_naturality`, finite limits); AlgebraicTopology Stage 6 item 1 (direct L-valued cochains, double dual needs fibrewise reflexivity), Stage 8 items 2 (Kan homotopy groups), 3 (Hurewicz), 8 (nonabelian classifying spaces); GeneralizedCohomology G2 item 1 (unpointed and pointed Kan–Quillen model, mapping simplicial sets, tensors, cotensors) and item 10 (mapping-path replacements and homotopy fibres); BordismFormalGroups §F6.5 (monoidal model axiom for the fixed Cartesian Kan–Quillen base; "Coherent model diagrams and stable enhancements" with `N((M^C)^cf) ≃ Fun(S, N(M^cf))`); Orbifolds O4 item 3, O4-N (realization descent for the Čech nerve of a numerable surjective submersion with actual local sections and a subordinate partition of unity); EnhancedDerivedSheaves §§E0.2–E0.5, E0.8, E2.6; SchemeAndStackFoundations §§0.9–0.12 with `IsGeometricallyUnibranch.of_etale` and `unibranch_finite_components` (finite locally constant sheaves only, as the README says), §§2.10, 2.15; EtaleCohomologyFoundations §§F.0.1, F.0.2, F.0.4, F.0.A2 (quasi-compact geometrically connected, algebraic closure, path choices retained), F.2.1, F.2.3, F.2.6, §0.10 (exterior algebra on Kummer classes at r branches, so R¹j_*A = A(−1) on a smooth divisor for finite A), §F.3 with `VanishingCycles.lisseDirectImageTransport` (smooth proper f, finite lisse coefficients); ComplexComparisonPartII §C−1.1 with `complexSchemeAnalytification` on all locally finite-type complex schemes and its `.complexPoints`, `.fibreProduct`, `.reduction`, `.etaleLocalIso`, `.smooth`, §§C5.1, C6.1, C6.2, C6.3; ResolutionOfSingularitiesCharacteristicZero §§5.1–5.5 (5.5: reduced finite-type, isomorphism over Reg, no separatedness or quasi-projectivity), 6.1, 6.2 (smooth quasi-projective, projective strict-SNC); CrystallineCohomology CR.5:log-algebra.4 "The classical Abhyankar lemma" (regular local X, root covers, tame π₁ = ∏_{ℓ≠p} ℤ_ℓ(1)^r); StableHomotopyKTheory §§1.19–1.23, 1.28–1.34 (edge(h) followed by edge(g) goes to gh, right-to-left permutation composition, free homotopy for conjugate homomorphisms with track edge(h)), §§2.3–2.6 (Hurewicz fibre homotopy equivalent, Serre fibre weakly equivalent, δ a homomorphism for n ≥ 1, π₁-orbits are the fibres of π₀F → π₀A with stabilizer im(π₁A)); DiamondsAndVStacks §D0.13; PerfectoidSpaces §P6.10; ProfiniteProPGroups Layers 0, 3, 4; Completed/UniversalCovers Stages 2–4.

Pinned declarations read with their hypotheses: `TopCat.toSSetIsoConst` needs only `TotallyDisconnectedSpace`; `CategoryTheory.Sheaf.H` needs `HasSheafify` and `HasExt` and is `Ext` from the constant `ULift ℤ` sheaf; `nonempty_sections_of_finite_cofiltered_system` and `TopCat.nonempty_limitCone_of_compact_t2_cofiltered_system` take `IsCofilteredOrEmpty J`; `ProfiniteGrp.ProfiniteCompletion.homEquiv` is `(completion G ⟶ P) ≃ (G ⟶ ↧P)` in one universe, and `TauCeti.ProfiniteCompletion.continuousMonoidHomEquiv` allows a second universe for the target; `Functor.additive_of_preserves_binary_products` needs binary products, preservation of them and of zero morphisms; `TauCeti.LocalCoefficientSystem` is `FundamentalGroupoid X ⥤ ModuleCat R`; `twistedCochainComplex` is `linearYonedaObj` of the twisted chains (Hom into M); `exists_forall_map_eq_of_finite` and `…_of_compact_t2` are over a directed preorder with `InverseSystem`; `IsProP.exists_continuousMulEquiv_pi_padicInt_prod_pi_zmod` takes the pro-p predicate and topological finite generation.

Ownership by object (roadmap service, main and 367 open heads): "strongly center-free", "rigid hypercover", "Isaksen", "p-finite space", "homotopy pro-local system" occur nowhere else; "étale homotopy type" and "elementary fibration" occur in later roadmaps only (R06; InverseGaloisAndArithmeticFundamentalGroups at #850 uses the étale type and outer actions as consumer, with no second construction of relative outer Hom or strong center-freeness). The notions moved down from later roadmaps (pro-group completion §3.0a, strong center-freeness and relative outer Hom §4.0a, open arithmetic image §4.0b, raw effacement and products §§3.9b–3.9c) are owned here legitimately; no earlier roadmap states them. Ownership against open pull requests was checked through the service index and the sibling checkouts named in the brief.

Policy: the diff against `origin/main` touches only `packages/EtaleHomotopyTypes/`; no pull-request number, process word, `lemma`, `set_option` or computational algorithm in the README or the Lean file; every target carries a locator; `sources.toml` has 15 entries (9 certified, 6 uncertified by locator), no machine path. The gap table of `plan.json` matches the README on 26 slugs and suppliers (R04 is the one textual overrun).

Sampled adversarial table (computed on each side):

| Statement | Instance | Left side | Right side | Result |
| --- | --- | --- | --- | --- |
| Conventions: transport by α is φ ↦ αφα⁻¹, right-to-left composition | (12) conjugated by (123) then by (12) in S₃ | (123)(12)(123)⁻¹ = (23); (12)(23)(12) = (13) | conjugator (12)(123): sends (12) to (13) | consistent; inverse convention gives (13) at the first step, excluded |
| §0.2 Check 4 | i: ∂Δ[1] → Δ[1], p: BC₂ → * | fibre of Map(Δ[1],BC₂) → BC₂ × BC₂ over (b,b) is ΩBC₂, π₀ = C₂ | endpoint inclusion: fibre is the based path space, contractible | non-trivial versus trivial, as stated |
| §0.4 second sentence | pointed f with U(f) iso in Ho(Pro) | fibrant pointed replacements, U(f) a homotopy equivalence, hence a weak equivalence | weak equivalences of Pro(SSet)_* are those of Pro(SSet) | iso in the pointed category |
| §0.5 vs I01 18.4 | coefficient class | README: every abelian local system | I01 §4: local systems are functors ΠX → Ab | agree |
| §1.2 Check 3 | U = 0 ⊂ ℤ on Sing S¹ | universal cover ℝ, fibre ℤ, infinite | finite-cover restriction would have no object | as stated |
| §1.9 Examples | pointed maps BC₂ → BS₃ | Hom(C₂,S₃): trivial + 3 transpositions = 4 | conjugacy classes: 2 | 4 pointed, 2 unpointed |
| §2.2 abelian claim | I = a → c ← b (not cofiltered), A_a = A_b = 0, A_c = ℤ/2 | lim¹ = coker(0 → ℤ/2) = ℤ/2 ≠ 0 | cofiltered I: cofinal cofinite directed poset, Jensen gives lim^s = 0 | cofiltered hypothesis is needed and present |
| §2.3 Examples | tower ℤ ←×2 ℤ ←×2 ⋯ | lim = 0, lim¹ = ℤ₂/ℤ ≠ 0 | holim B(ℤ,×2) has π₀ = lim¹, disconnected | profiniteness needed, as stated |
| §2.4 Check 2 | X = {x₀,x₁,a} | Cyl₂(X) = two points ⊔ Δ[1] over a | horn Λ²₀ in Δ[1] with faces (0,1), (0,0) needs 0 ≤ 1 ≤ 0: no filler | projection not a Kan fibration; refutes SS "trivial fibration" |
| §2.10 and Layer 4 Example | X = BC₃ → BC₂ trivial, Y = BS₃ → BC₂ sign | relative pointed maps = Hom(C₃,A₃) = 3; A₃ acts trivially | S_X = C₂ (abelian Q), Δ_XY = S₃, transposition swaps the two isomorphisms: 2 orbits | 3 versus 2, negative control for center-freeness |
| §3.0a Check 5 | ℤ ←×2 ℤ ←⋯, completion | lim(ℤ̂,×2) = ∏_{ℓ≠2} ℤ_ℓ (the ℤ₂ coordinate is ∩2ⁿℤ₂ = 0) | Hom_cont(−,C₃) = Hom(ℤ₃,C₃) = 3; colimₙ Hom(ℤ,C₃) along ×2 = C₃, 3 | 3 = 3; completion of the abstract limit 0 gives 1 |
| §3.0a Check 2 | constant ℤ | ℤ̂ → C₂: 2 maps | Hom(ℤ,C₂) = 2 | agree |
| §3.5 bullet 2, unibranch components | P₀ ⊂ P a component of a G-torsor, X geometrically unibranch | over O^sh_{X,x} (a domain) P splits as ∐_G Spec O^sh, each piece irreducible | fibre cardinality of P₀ at x̄ = cardinality over the geometric generic point = [L:K] | constant finite fibres, SGA1 I 10.10 applies |
| §3.5 Check 1 | nodal cubic over ℂ | ℤ-torsor: infinite chain of ℙ¹, image of raw π₁ → ℤ infinite | completion ℤ̂ = π₁^ét | unibranch hypothesis needed |
| §3.5 Check 4 | ℙ¹ over K̄, char 0 | H³(ℙ¹,ℤ) ≅ H²(ℙ¹,ℚ/ℤ) = ℚ/ℤ(−1), no class dies on finite covers (all split) | pro-H₂ = (ℤ/n(1)), Hom to ℚ/ℤ factors through a finite subgroup | route uses only the latter, as stated |
| §3.8a definitions vs SGA1 1.2 | sheaf of sets E | README: dimension ≤ 0 means bijective base change | SGA1 line 10214–10227: ≤ −1 injective, ≤ 0 bijective | agree (numbering shifted from stacks) |
| §3.8a, 1.5(c) citation | base change of cohomological properness | README cites 1.5(c) for base change along Y → Spec K | SGA1 line 10366–10368: dimension ≤ 1 is stable under base change (not ≤ −1, ≤ 0) | citation correct; only the ≤ 1 case is used |
| §3.8a Check (normal-crossings complements) | U = Gₘ, F = C₂, A strictly henselian at t = 0 | H¹(Gₘ,C₂) = ℤ/2 (1, z) | A[z,z⁻¹] UFD so Pic = 0; units A^× z^ℤ, A^× 2-divisible; classes 1, z | 2 = 2 |
| §3.8a Check (i_*Φ not a torsor stack) | 0 ∈ ℙ¹, F = C₂ | stalk at 0: C₂-torsors over Frac(O^sh), Galois group ℤ̂(1): 2 classes, Aut = C₂ | stalk at u ∈ U: 1 class | a torsor stack has 1 class everywhere; excluded |
| §3.8a Check (relative normal crossings needed) | P = ℙ¹_S, D: z² = s over S = 𝔸¹ | fibre at s ≠ 0: Gₘ, 2 classes; at s = 0: 𝔸¹, 1 class | 1.14 with u smooth would force equal stalks | hypothesis needed |
| §3.8a Check (x ↦ x²) | strict-local fibre at 0 over the geometric generic point | K(x)/K(x²) degree 2 splits into 2 points | locally 0-acyclic needs 1 connected point | not locally 0-acyclic; fibre x² = 0 not reduced, consistent with the gap |
| §3.8a Check (constant sheaves do not test 0-acyclicity) | X′ = {xy = t} ∖ {0} over strictly henselian A | A[x,y]/(xy−t) is a domain (injects into A[x,x⁻¹]); Jacobian (y,x) ≠ 0 on X′ | skyscraper at the closed point: 2 sections on Spec A, 2² = 4 on X′ | not 0-acyclic; definition through all sheaves of sets needed |
| §3.8a Check (characteristic p) | w^p − w = xz over 𝔽̄_p | xz ≡ f(x) + g(z) mod (h^p − h) forces c₁₁ = −1, c_{pp} = (−1)^p, …, an infinite chain | h is a polynomial | impossible; π₁(𝔸²) ≠ π₁(𝔸¹)² |
| §3.8a, SGA1 4.1 hypotheses | README hypothesis set | (C,f) c.p. ≤ 1 for all finite C, f′_*E constructible, f locally 0-acyclic and 0-acyclic | SGA1 line 12120–12127: (E,f′) c.p. ≤ 0 and f′_*E constructible, same acyclicity; 1.13(3) (line 10656–10660) derives ≤ 0 for Q/G from ≤ 1 for G and ≤ 0 for F | README hypotheses imply the source's |
| §3.8a, SGA1 4.6 | Y arbitrary connected | source hypotheses on X only | README adds finite type on Y | R02 |
| §3.9a Check 3 | Y₁ = Y₂ = Spec ℝ over ℝ | C₂ ×_{C₂} C₂ = diagonal, 2 elements | direct product would have 4 | as stated |
| §3.9c Check 3 | Gₘ² over ℂ, prime p | H^*(Gₘ²,𝔽_p) dimensions 1, 2, 1 | (z,w) ↦ (z^p,w^p) multiplies degree-one classes by p = 0 | classes killed |
| §3.9d Examples | 𝔸² ∖ {0} → ℙ¹ with fibre Gₘ | ℙ(𝒪 ⊕ 𝒪(−1)) minus zero and infinity sections, D finite étale of degree 2 | π₁(𝔸² ∖ 0) = 1 (purity), π₂ = 0, boundary π₂(ℙ¹) = ℤ̂(1) → π₁(Gₘ) = ℤ̂(1) iso (Hopf) | left injectivity fails, as stated |
| §4.0a Check 4 | Q = C₂, G = C₂, H = C₂ × C₂, second projection | maps over Q: t ↦ (0,t), (t,t) | t ↦ (t,0) has image in the kernel | 2 relative maps |
| §4.0a Check 5 | H = ℤ_p, Q = 1 | pℤ_p open (index p); {0} not open | finite target: every image open | predicate is openness, not surjectivity |
| §4.0b Check 3 | Spec ℚ(i) over ℚ | image G_{ℚ(i)}, index 2, open | surjectivity false | as stated |
| §5.1 Check 2 | T = ∅; T ≠ ∅ and X = ∅ | Hom(∅,X) = 1 and C(∅,X(ℂ)) = 1; Hom(Spec C(T), ∅) = ∅ = C(T,∅) | nonzero-ring assumption would exclude the first | as stated |
| §5.1 route detail | Spec C(T) → X lands in open U | primes p ⊂ m_t, φ(p) generizes φ(m_t) ∈ U, U open | lands in U | reduction to affine pieces sound |
| §5.3a Check 3 | ∅ → Spec ℂ | smooth, not surjective | realization empty versus point | surjectivity needed |
| §6.2 Check 2 | BC_q, q ≠ p | H^*(BC_q,𝔽_p) = 𝔽_p in degree 0 | p-completion contractible | as stated |
| §6.5 vs DAG13 | finite type criterion | README: H⁰ = 𝔽_p via the unit, H¹ = 0, finite-dimensional H^m | DAG13 line 4146–4150: conditions (1)–(3); Def 3.3.2: finite type = simply connected with topologically finitely generated π_n; Prop 3.3.8: H^*(X) → H^*(Mat X) iso | agree |
| §6.6 Check 1 and Layer 6 Example | ∐_ℕ Spec ℂ graded | Et_p^gr = discrete ℕ, H⁰ = 𝔽_p^ℕ | ungraded: π₀ = βℕ, all functions βℕ → 𝔽_p, strictly more than the continuous ones | grading needed, as stated |

Hypotheses confirmed present where needed: cofilteredness in §2.2; connected pointed in §§0.4, 1.2, 1.8–1.9; profinite π_n in §§2.3, 2.7; path-connected Y, B and surjective π₁^top in §§2.8–2.10; noetherian geometrically unibranch in §3.5's second assertion and §§3.9b–3.9d, 4.1–4.7 (through Y); characteristic zero and algebraically closed K in §3.8a; separably closed K for the strictly henselian reformulation; geometrically connected factors in §3.9a; strongly center-free G_k in §§4.4–4.7; finite abelian coefficients where Artin comparison or Künneth is used; H⁰ = 𝔽_p and H¹ = 0 in §§6.5, 6.8.

## Not verifiable

- FGV (Lemma A.7, Definition A.8, Example A.10, Appendix A.2.2–A.2.3, properties (i)–(iii)), BK (XI 5.2, XI 7.1, IX 5.1, IX 5.4), AM (Theorems 4.3 and 11.1), Fr (Proposition 5.9, Theorem 11.5), SGA5 I 3.1.5 and SGA4 (VIII 9.4, IX 1.6(ii), 2.9, 2.11, XII 5.1, XV 1.11, 1.16, 2.1, 4.1): settled as uncertified in the manifest; cited by locator only. The statements attributed to them were checked for internal consistency with SS, I01, IEt and SGA1, which cite the same results, but not against their text.
- Printed page numbers for SGA1 (the arXiv edition carries margin numbers of the original and its own pagination) and for the BHH postprint were checked only where a running header or margin number sits within a few lines of the cited line (SGA1 pp. 262, 265, 272, 274, 283, 311, 317; SS pp. 823, 825–829, 859, 866; I01 pp. 7–9); the others are consistent with the line order.
- The pro-Hurewicz step of §3.5 bullet 4 ("proved levelwise from AlgebraicTopology Stage 8, item 3 after cofinite reindexing") needs the Artin–Mazur reindexing argument beyond ordinary Hurewicz at each level, since the levels of the pro-universal cover are not simply connected; the route sentence is compressed but the target is a target, not a supplier claim, so it is not raised.
- Lean elaboration was not run (no Lean commands are given to this pass; the file has no declaration).
- EllAdicHomotopyTypesAndWeights (merge order 198) was not available as a sibling checkout; the service grep found no construction of the étale homotopy type there.

## Source issues

- **Misprint** in SS at Theorem A.8, proof, printed page 857 (SS line 1619): the source labels the product of the X_{i₀} over chains of length n as the n-th partial totalization; it should be the degree-n term of the cosimplicial replacement, the partial totalization being the mapping space from the n-skeleton of Δ with its compatibility equations; affects the proof.
- **Error** in SS at Appendix A.2.3, printed page 858 (SS line 1651–1652): the source says the projection from the relative cylinder X∧I to X is a trivial fibration in the two-point undercategory; it should say it is a weak equivalence with cofibration endpoint inclusions, since over a third vertex the fibre is Δ[1], which is not Kan; affects the proof (the path-set description still follows from the cylinder-object property).
- **Misprint** in SGA1 at XIII Proposition 4.6, proof, printed page 311 (SGA1 line 12307): the source says the composite from the fundamental group of the fibre through that of the product ends in the fundamental group of Y and is an isomorphism; it should end in the fundamental group of X, through the first projection; affects nothing.
- A previous review's "Error in SGA1 at XIII Proposition 4.1" was re-examined at SGA1 line 12120–12122: the parenthetical equivalence is stated under the standing hypothesis "locally 0-acyclic" and is correct there; it is not a source issue.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "6962204", "job": "RT-EtaleHomotopyTypes~1b", "model": "fable", "worker": "fable-rt202"} -->
