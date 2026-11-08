# Review of ClassifyingSpaces (pull request #1807 at fa7b83e)

**Verdict:** needs changes

The pull request changes one bullet of this roadmap's Inventory (the singular homology functor is now cited to Mathlib instead of a roadmap). The brief asks for a full review of the folder as it stands at this head, so the findings below cover the whole folder; R01, R03, R04, R05, R06 and R07 describe the state of files this pull request does not otherwise touch, and R02 a mutual citation that already exists on main. The gate fails at this head (`sorry-data` 27, `outside-folder`), so the folder cannot be accepted whatever the mathematics; the mathematics itself is sound (see the table under `## Verified sound`).

## R01 (P1) — `Suggested.lean` is built on sorry'd data (27 declarations) and is not an acceptance test

**Location.** `TauCetiRoadmap/ClassifyingSpaces/Suggested.lean`, lines 39, 49, 54, 56, 63, 65, 74, 76, 90–96, 100, 112, 133–153, 160, 163, 188, 190, 206, 212 (every `def` and `instance` except `universalGSpace`, `classifyingSpace` and their topologies, which themselves unfold to sorry'd data). Module docstring lines 9–13: "`sorry` is permitted … these are targets, not implementations".

**Claim.** The file states milestone signatures, with the Milnor join, its base point, its `G`-action, the orbit map, the presentation complex, the cellular model, every standing-hypothesis instance, the CW instances, the resolution and the comparison chain map all given as `sorry`'d data.

**Witness.** Gate rule `sorry-data`: 27 hits, quoted in the gate output. `lake env lean` on the file: exit 0 with `declaration uses sorry` the only warning (39 declarations). The `#check` pass (one scratch file, all 27 names) agrees with the worker's signatures; it also shows `universalGSpaceBasepoint : (G : Type u) → universalGSpace G` with no `[Group G]`, so the vertex `(0, 1)` of the README (Stage 1 item 1) is not even expressible in its own signature. Line 120 puts a `sorry` proof term inside the *statement* of `fundamentalGroup_classifyingSpaceMap` (the base-point equation of `mapOfEq`), so that theorem's statement depends on `sorryAx`.

**Repair.** Rewrite the file as the roadmap's acceptance test, in the current form (one module docstring "Classifying spaces of discrete groups: target signatures" saying which headlines are not statable and what each lacks; no sorry'd `def`/`instance`; nothing that mentions one). Concretely:

- Keep `exists_homotopyEquiv_of_isAspherical` (uniqueness for Hausdorff CW `K(G,1)` spaces) as is: it uses only pinned carriers and is correct (table row 12).
- State existence of a *CW* `K(G, 1)` on pinned carriers only: for every `G : Type u` `[Group G]`, `∃ (X : Type u) (_ : TopologicalSpace X) (_ : T2Space X) (_ : Topology.CWComplex (Set.univ : Set X)) (x : X), IsEilenbergMacLaneSpaceOne G X x`. The present `exists_isEilenbergMacLaneSpaceOne` (line 108) drops the CW clause of Scope item 1 and closes in one `exact` from line 103 (probe: replacing its `sorry` by `⟨_, _, _, isEilenbergMacLaneSpaceOne_classifyingSpace G⟩` elaborates), so it is a corollary of sorry'd data, not a test.
- State the homology comparison for *any* Hausdorff CW `K(G, 1)`: for `[T2Space X] [Topology.CWComplex (Set.univ : Set X)]` and `IsEilenbergMacLaneSpaceOne G X x`, `Nonempty (groupHomology (Rep.trivial ℤ G ℤ) n ≅ ((AlgebraicTopology.singularHomologyFunctor (ModuleCat.{0} ℤ) n).obj (ModuleCat.of ℤ ℤ)).obj (TopCat.of X))`; this is the headline of Scope item 4 and needs no model. Likewise the cohomology clause (R03).
- State Stage 3 item 11 (maps out of a connected CW complex into a `K(H,1)` realise every homomorphism, uniquely up to homotopy rel the base point) on pinned carriers: `FundamentalGroup`, `ContinuousMap.HomotopicRel`, `Topology.CWComplex`, `IsEilenbergMacLaneSpaceOne` all exist at the pin.
- Delete the sorry'd models and everything about them (`countableJoin`, `universalGSpace…`, `classifyingSpace…`, `presentationComplex…`, `cellularClassifyingSpace…`, the resolutions and the comparison chain map); the README keeps them as targets (Stage 1 items 1–6, Stage 2 items 7–10, Stage 3 items 13–14, Stage 4 items 16 and 18). The docstring names them as the headlines not statable at the pins (the Milnor model, the presentation complex and the cellular tower are constructions whose formalisation is the library's work; the chain-level comparison with `Rep.standardResolution` needs the model). The universe restriction to `Type` in lines 206–228 then disappears with them (the README is universe-polymorphic; the file was not).

## R02 (P2) — AlgebraicTopology Stage 8 and this roadmap's Stages 3–4 cite each other

**Location.** `TauCetiRoadmap/ClassifyingSpaces/README.md` lines 72–80 ("Stages 3 and 4 consume Whitehead, Hurewicz and the cellular comparison" from AlgebraicTopology Stage 8 and Stage 4) and lines 185–195, 225–238; `TauCetiRoadmap/AlgebraicTopology/README.md` lines 93–101 and its dependency table row "8.8b normalized model comparison | AT8.8a bar model; CS Stage3 items11–15 and Stage4 items16–18".

**Claim.** Each roadmap lists the other as a supplier of a layer: ClassifyingSpaces Stage 3 item 12 needs AlgebraicTopology 8.5 (Whitehead) and Stage 4 item 16 needs 8.3 (Hurewicz); AlgebraicTopology 8.8b needs ClassifyingSpaces Stage 3 items 11–15 and Stage 4 items 16–18. That is a cycle between two roadmaps' layers (AlgebraicTopology Stage 8 → ClassifyingSpaces Stages 3–4 → AlgebraicTopology Stage 8). At item level the graph is acyclic (8.3, 8.5 → CS 11–18 → 8.8b), which is why no build is blocked, but the supply has no single direction and the merge order cannot place the pair.

**Witness.** The dependency check reports `depcheck: 236 roadmaps, 2070 edges, 0 problem(s)` for this README (full output under `## Verified sound`), so the tool does not see this pair; the two citations are quoted above and both already stand on main (`git show origin/main` of the AlgebraicTopology README has the same lines 93–101 and the same table row). This pull request, whose purpose is cutting loops, leaves this one.

**Repair.** Make ClassifyingSpaces the consumer throughout: move the content of AlgebraicTopology 8.8b (the pointed comparison of the nerve model `|nerve (SingleObj π)|` of 8.8a with the Milnor and presentation models, normalised by `κ_bar ∘ π₁(c_G) = κ_model`, its naturality up to pointed homotopy, and the identification of the two local-coefficient cohomology comparisons with the identity on `groupCohomology`) into this roadmap as a Stage 3 item after 14 ("the nerve model agrees", consuming AlgebraicTopology 8.8a for the construction and item 12 for the equivalence) and a Stage 4 clause of item 17, with `*Needs:*` AlgebraicTopology 8.8a. Then AlgebraicTopology cites this roadmap only in a consumer sentence, exactly as this pull request does elsewhere. (AlgebraicTopology 8.9–8.12 do not list 8.8b among their needs, and CharacteristicClasses, which consumes "8.8b's normalized ℤ/2 model", is downstream of both roadmaps, so nothing else moves.)

## R03 (P2) — The cohomology half of the comparison with algebra is statable at the pins and absent

**Location.** `TauCetiRoadmap/ClassifyingSpaces/README.md` lines 43–45 (Scope item 4: "its cohomology with coefficients in a `G`-module is Mathlib's `groupCohomology`") and line 241; `TauCetiRoadmap/ClassifyingSpaces/Suggested.lean` has no cohomology statement.

**Claim.** The headline comparison has a homology and a cohomology clause; only homology (line 225, and only through the sorry'd model) is in the file.

**Witness.** Pinned Tau Ceti has `TopCat.singularCohomologyFunctor` and `TopCat.singularCohomology R k M n` (`TauCeti/AlgebraicTopology/Cohomology/Basic.lean` lines 90–131, `#check` elaborated), and pinned Mathlib has `groupCohomology (A : Rep k G) (n : ℕ) : ModuleCat k` (`Mathlib/RepresentationTheory/Homological/GroupCohomology/Basic.lean` line 184). So `Nonempty (groupCohomology (Rep.trivial ℤ G ℤ) n ≅ (TopCat.of X).singularCohomology (ModuleCat.of ℤ ℤ) ℤ (ModuleCat.of ℤ ℤ) n)` for a Hausdorff CW `K(G,1)` `X` is statable with trivial coefficients; local coefficients in a `G`-module are not (no pinned local-system cohomology), and the docstring should say so.

**Repair.** Add the trivial-coefficient cohomology statement next to the homology one (as in R01, over any Hausdorff CW `K(G,1)` rather than a sorry'd model), and name the local-coefficient clause in the docstring as not statable.

## R04 (P3) — The direction of `π₁(BG) ≅ G` is announced but never pinned

**Location.** `TauCetiRoadmap/ClassifyingSpaces/README.md` lines 62–64 ("the identification `π₁(BG) ≅ G` fixes a direction and must say which"), lines 142–144 (Stage 1 item 5, "in the direction fixed against the opposite-group convention"), lines 230–232 (item 16, "state which").

**Claim.** The roadmap tells the implementer that a convention must be chosen but does not choose it, and gives no two-term Check that would detect the wrong choice.

**Witness.** With the left action `h • (i, g) = (i, h * g)` of item 3 and Mathlib's `FundamentalGroup.mul_def : p * q = q.trans p` (`Mathlib/AlgebraicTopology/FundamentalGroupoid/FundamentalGroup.lean` line 41, `q` traversed first), the monodromy label `m(γ)` (the loop's lift from `(0, 1)` ends at `(0, m(γ))`) satisfies `m(p * q) = m(q) · m(p)`. In `S₃` with `s = (1 2)`, `t = (2 3)`: loops `ℓ_s, ℓ_t` with labels `s, t` give `m(ℓ_s * ℓ_t) = t s`, while `m(ℓ_s) m(ℓ_t) = s t ≠ t s`. So `γ ↦ m(γ)` is not a homomorphism; the only monodromy-built isomorphism is `γ ↦ m(γ)⁻¹`, sending `ℓ_s * ℓ_t` to `(t s)⁻¹ = s t`.

**Repair.** State in Stage 1 item 5: the isomorphism `π₁(classifyingSpace G, b₀) ≃* G` sends the class of a loop whose lift from `(0, 1)` ends at `(0, g)` to `g⁻¹` (equivalently, it is the inverse of the monodromy label), and add the `S₃` computation above as a Check (a wrong model, the label itself, fails multiplicativity). Item 16 then uses the same convention for the deck action on the cellular chains, and the Stage 3 item 11 and Stage 4 item 17 naturality statements inherit it.

## R05 (P3) — Locators: the presentation complex is not in Hatcher's Section 1.B, and the main targets carry no theorem locators

**Location.** `TauCetiRoadmap/ClassifyingSpaces/README.md` lines 292–294 ("Section 1.B for `K(G, 1)` spaces, their uniqueness and the presentation complex; Section 4.1 for killing homotopy groups"); items 7, 8, 9, 11, 12, 13, 16 (lines 159–238) cite no theorem or page.

**Claim.** The presentation complex with `π₁ = ⟨S | R⟩` is Hatcher Corollary 1.28 in Section 1.2; Section 1.B contains the Δ-complex `BG` (Example 1B.7), not the presentation complex.

**Witness.** `hatcher-at` line 2353 (Corollary 1.28, printed p. 52, in §1.2); lines 3844–3860 (Example 1B.7, p. 89); 3897 (Theorem 1B.8, p. 90); 3905 (Proposition 1B.9, p. 90); 15407–15416 (Example 4.16, Postnikov towers, p. 354, the attach-cells-to-kill-`π_n` step); 22534 (Proposition A.1, p. 520).

**Repair.** In the References, replace "and the presentation complex" by "Section 1.2, Corollary 1.28, p. 52 for the presentation complex". Put locators at the claims: item 7 (Hatcher, Cor. 1.28, p. 52); item 8 (Hatcher, §4.1, Example 4.16, p. 354, with cellular approximation Thm 4.8); item 9 (Hatcher, Prop. A.1, p. 520); item 11 (Hatcher, Prop. 1B.9, p. 90, noting that the proof uses only `π_n(Y) = 0` for `n ≥ 2` and so applies to `IsEilenbergMacLaneSpaceOne`, whose definition does not ask for a contractible universal cover as Hatcher's does, see `TauCeti/AlgebraicTopology/EilenbergMacLane/Basic.lean` line 123); item 12 (Hatcher, Thm 1B.8, p. 90); item 13 and item 16 (Brown, §I.4, and tom Dieck, §II.1, with their numbered statements once those texts are readable; both are uncertified below).

## R06 (P3) — The Inventory attributes Mathlib declarations to Tau Ceti

**Location.** `TauCetiRoadmap/ClassifyingSpaces/README.md` lines 99–100 ("`TauCeti/AlgebraicTopology/SimplicialComplex/` has abstract complexes") and 103–105 ("`TauCeti/AlgebraicTopology/UniversalCover/` … have … `IsQuotientCoveringMap`").

**Claim.** Both objects are Mathlib's at the pin.

**Witness.** `AbstractSimplicialComplex` is `Mathlib/AlgebraicTopology/SimplicialComplex/Basic.lean` line 154; `IsQuotientCoveringMap` is `Mathlib/Topology/Covering/Quotient.lean` line 36 (the UniversalCovers roadmap says it is "built on Mathlib's `IsQuotientCoveringMap`"). Tau Ceti's `SimplicialComplex/` directory holds the realization, join, cone, subdivision and collapse, not the abstract complexes.

**Repair.** Say "Mathlib's `AbstractSimplicialComplex`; Tau Ceti's `SimplicialComplex/` adds the realization with the weak topology, the join and cone, subdivision and collapse", and "Mathlib's `IsQuotientCoveringMap`, with `TauCeti/AlgebraicTopology/UniversalCover/` supplying the universal cover and `TauCeti/AlgebraicTopology/EilenbergMacLane/` `IsAspherical`, `IsEilenbergMacLaneSpaceOne` and the recognition theorems" (`EilenbergMacLane/Basic.lean` lines 59 and 123; `UniversalCover/Classification/EilenbergMacLane.lean` line 84).

## R07 (P3) — README form: no `*Needs:*` lines, no Checks lists, process words

**Location.** `TauCetiRoadmap/ClassifyingSpaces/README.md` line 58 ("now complete"), line 259 ("The first two are new"); Stage 1 item 1, Stage 2 item 7, Stage 3 item 13 (definitions with no `**Checks.**` list); every item (no `*Needs:*` line; the "Ordering" section at lines 262–271 stands in for per-layer Dependencies).

**Claim.** "now" and "new" are process narrative; definitions carry no discriminating Checks (the countable join, the presentation complex, the lifted and descended CW structures), and a target's needs are stated only at stage level.

**Witness.** The lines quoted. The Checks the roadmap already implies but does not list: trivial group (the join is the infinite simplex, countably many vertices against one generator of the standard complex in degree 0, line 246–248); `ℤ` on `ℝ` (one orbit of cells over each cell of the circle); `S₃` for the direction of `π₁ ≅ G` (R04).

**Repair.** Replace "now complete" by "complete", "are new" by "are proved here"; add a `**Checks.**` list to items 1, 7 and 13 with the three computations above plus the Warsaw-circle negative control already in Scope item 2 for item 12; add `*Needs:*` lines per item naming the supplier sections (AlgebraicTopology 1.4, 4.5, 8.3, 8.5; GeometricTopology Layer 11; UniversalCovers item 14; Mathlib `Topology.IsQuotientMap.locallyPathConnectedSpace`, `Rep.standardResolution`, `CategoryTheory.ProjectiveResolution.homotopyEquiv`), so that an implementer who proves an item another way is not blocked behind a whole stage.

## R08 (P3) — Edit outside the pull request's folders: `Completed/ArithmeticDirichletSeries/README.md`

**Location.** `Completed/ArithmeticDirichletSeries/README.md` line 331 (one sentence rewritten so that `LFunctions` is named as a consumer).

**Claim.** The brief lists the folders this pull request owns; this file is in none of them, and the gate's `outside-folder` check fails on it.

**Witness.** `git diff --stat origin/main...HEAD` outside the named folders: `Completed/ArithmeticDirichletSeries/README.md | 2 +-`; gate output `outside-folder: Completed/ArithmeticDirichletSeries/README.md`.

**Repair.** Either add the folder to the pull request's declared scope so that it gets its own review, or move the one-line change to a pull request of its own.

## R09 (P3) — Edit outside the pull request's folders: `TauCetiRoadmap/SymplecticGeometry/README.md`

**Location.** `TauCetiRoadmap/SymplecticGeometry/README.md` line 77.

**Claim.** Same as R08. The rewritten sentence also now reads "boundary and sign adapters consumed by HeegaardFloer and consumed by DGFloer", a doubled verb.

**Witness.** `git diff --stat origin/main...HEAD` outside the named folders: `TauCetiRoadmap/SymplecticGeometry/README.md | 2 +-`; gate output `outside-folder: TauCetiRoadmap/SymplecticGeometry/README.md`.

**Repair.** As R08, and write "consumed by HeegaardFloer and by DGFloer".

## Verified sound

**Gate and build.** The worker's gate at this head: `sorry-data=27`, `outside-folder=2`, and a `build` item whose only message is Lake's warning that `Suggested.lean` imports `Mathlib` without `module`; `lake env lean TauCetiRoadmap/ClassifyingSpaces/Suggested.lean` exits 0 with `declaration uses sorry` as the only warning (39 occurrences), so the file elaborates and the Lake message is not a defect of the file (the roadmap rules require `import Mathlib` as written). My rerun of the gate reproduces the same failing checks. `#check @name` for all 27 declarations in one scratch file, elaborated once: every type agrees with the worker's signatures file; the one dropped binder is reported in R01. `#print axioms` on `exists_homotopyEquiv_of_isAspherical`: `propext, sorryAx, Classical.choice, Quot.sound`.

**Dependency check.** Output, verbatim: `depcheck: 236 roadmaps, 2070 edges, 0 problem(s)`. No UPWARD or CYCLE line for this roadmap. Its suppliers (UniversalCovers in `Completed/`, AlgebraicTopology, GeometricTopology, ProfiniteCohomology) are all on main. The AlgebraicTopology–ClassifyingSpaces mutual citation of R02 is not reported by the tool.

**Cross-roadmap citations resolved (6).** UniversalCovers item 14 (recognition of `K(G,1)` from a weakly contractible universal cover; "Constructing a `K(G, 1)` for an arbitrary group is outside this roadmap"), lines 146–151 of `Completed/UniversalCovers/README.md`; its deck convention `Deck(proj) ≃* (π₁)ᵐᵒᵖ`, line 95. GeometricTopology Layer 11 (`TauCetiRoadmap/GeometricTopology/README.md` lines 831–880 on main): realization with weak topology, induced maps of simplicial maps, restriction to a subset of vertices, `|K|` Hausdorff and a quotient of the disjoint union of closed simplices, compact subsets inside a finite restriction, realized cones contracting to the apex, the classical CW structure ordered by an injective-on-simplices map `o` with cellular boundary `Σ (−1)ʲ [v₀,…,v̂ⱼ,…,vₙ]`, "the classifying-space roadmap consumes it for the cellular chains of the countable join": every item this roadmap cites is there. AlgebraicTopology at the pull-request head: Stage 1 item 4 (based van Kampen with group-presentation corollaries), Stage 4 (cellular approximation, cofibrations, Hausdorff CW conventions at lines 148–160), Stage 8 items 3 (absolute Hurewicz) and 5 (Whitehead for Hausdorff CW complexes, then spaces of CW type). ProfiniteCohomology exists on main. The cited roadmap sections exist as cited; the only direction problem is R02.

**Library declarations opened at the pins (12).** `TauCeti.IsAspherical` (`EilenbergMacLane/Basic.lean` 59: path-connected and `π_(n+2)` subsingleton), `TauCeti.IsEilenbergMacLaneSpaceOne` (123: aspherical and `Nonempty (FundamentalGroup X x ≃* G)`), recognition `isEilenbergMacLaneSpaceOne` (`UniversalCover/Classification/EilenbergMacLane.lean` 84), `IsAspherical.of_homotopyEquiv` and `IsEilenbergMacLaneSpaceOne.of_homotopyEquiv` (`EilenbergMacLane/HomotopyEquiv.lean` 46, 60), `AbstractSimplicialComplex.Realization` with its vertex map (`SimplicialComplex/Realization/Basic.lean` 389), `AbstractSimplicialComplex.join` (`Join/Basic.lean` 170), `IsQuotientCoveringMap` (`Mathlib/Topology/Covering/Quotient.lean` 36: quotient map, continuous action, `f e₁ = f e₂ ↔ e₁ ∈ orbit e₂`, a neighbourhood whose translates are pairwise disjoint), `Topology.IsQuotientMap.locallyPathConnectedSpace` (`Topology/Connected/LocallyPathConnected.lean` 249), `Rep.standardComplex` / `Rep.standardResolution` (`RepresentationTheory/Homological/Resolution.lean` 169, 323) with `standardComplex.d` sending `(g₀,…,gₙ)` to `Σᵢ (−1)ⁱ (g₀,…,ĝᵢ,…,gₙ)` (line 179), `classifyingSpaceUniversalCover` (line 86, `[n] ↦ Gⁿ⁺¹` with the diagonal action), `CategoryTheory.ProjectiveResolution.homotopyEquiv` (`CategoryTheory/Abelian/Projective/Resolution.lean` 180), `groupHomology`/`groupCohomology` (`GroupHomology/Basic.lean` 228, `GroupCohomology/Basic.lean` 184), Shapiro's lemma files for both, `AlgebraicTopology.singularHomologyFunctor` (`SingularHomology/Basic.lean` 52). The pinned Tau Ceti has no `AlgebraicTopology/ClassifyingSpace/` directory and no `universalGSpace`, `killHomotopyGroups`, `cwComplexPreimage` or `PresentationComplex`, so the file's declarations duplicate nothing at the pin (the implementations `STATUS.md` links to are later than the pin).

**Ownership.** Searched main and the open pull requests (`roadmaps grep`, readme-only) for the countable join, Milnor's join, the presentation complex and `K(G,1)`: CharacteristicClasses (in this pull request) builds Milnor's join for compact Lie groups and cites this roadmap for discrete groups (its lines 145–147, 335); AlgebraicTopology 8.8a builds the nerve model `|nerve (SingleObj π)|`, a third model that already stands on main and is the subject of R02; GeometricTopology uses presentation complexes in its own group-theoretic layers without constructing `K(G,1)` spaces. No second owner of the two models, the uniqueness theorem or the resolution comparison. Ownership against open pull requests whose files the brief does not list was not checked beyond that grep.

**Seeded sample, "Both models are wanted" (README lines 14–20).** The paragraph rests on Milnor's join (Milnor 1956, not readable; Segal 1968 §3, `segal-1968` lines 116–123, describes `(G*G*…)/G` as Milnor's universal space and identifies it with the realization of a nerve) and on Hatcher §1.B for the cellular side: Example 1B.7 (p. 89) builds `BG = EG/G` as a Δ-complex with `π₁ = G` and `EG` contractible; Theorem 1B.8 (p. 90) says the homotopy type of a CW `K(G,1)` is determined by `G`; Proposition 1B.9 (p. 90) realises every homomorphism `π₁(X,x₀) → π₁(Y,y₀)` by a pointed map unique up to homotopy rel `x₀`, for `X` a connected CW complex and `Y` a `K(G,1)`. The paragraph's claims (uniform existence through the join; the cellular model as the one later homological arguments use; "the comparison is the theorem that makes the classifying space well defined") are supported; the hypotheses it needs (CW type on both sides) are those of Scope item 2. One locator defect: Hatcher's §1.B does not contain the presentation complex (R05).

**Adversarial table.** One row per statement; "value" gives what was computed on each side.

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| 1.1 countable join: faces = nonempty finite sets meeting each index at most once | all `A i = ∅`; `G = 1`; `G = ℤ/2` | empty type: no faces, a legal complex; `G = 1`: vertices `(i,1)`, every finite set a face, the infinite simplex; `G = ℤ/2`: `{(0,0),(0,1)}` is not a face, `{(0,0),(1,1)}` is | sound | none |
| 1.2 weak contractibility when infinitely many `A i ≠ ∅` | `A i = ∅` for all `i`; `A i ≠ ∅` for finitely many `i`; constant `G` | all empty: no points, hypothesis fails; finitely many: `A₀ = {a,b}`, others empty, realization = two points, not path-connected, hypothesis fails; constant `G`: a compact image lies in indices `F`, pick `j ∉ F`, `K_F * {(j,1)}` is a cone, loop contracts | sound; the hypothesis is the sharp one | none |
| 1.3 action free, orbit map a quotient covering | `h ≠ 1` fixing a point; `U_{(i,g)} ∩ h·U_{(i,g)}` | `h·x = x` forces `h` to fix the carrier's vertex set and `h·(i,g) = (i,hg) ≠ (i,g)`: free; `h·U_{(i,g)} = U_{(i,hg)}`, a point in both has a carrier containing `(i,g)` and `(i,hg)` at one index: empty for `h ≠ 1` | sound (matches Mathlib's `disjoint` field) | none |
| 1.4 standing hypotheses | realization; orbit space | closed simplex convex ⇒ locally path-connected; quotient of the disjoint union ⇒ `IsQuotientMap.locallyPathConnectedSpace` (pin line 249) twice; simply connected cover ⇒ loops in an evenly covered set lift to a sheet and contract | sound | none |
| 1.5 `π₁(BG) ≅ G` direction | `S₃`, `s = (12)`, `t = (23)` | `m(ℓ_s * ℓ_t) = ts`, `m(ℓ_s)m(ℓ_t) = st`; label map not multiplicative; `m⁻¹` is | convention unpinned | R04 |
| 1.6 strict functoriality | `φ = id`; `ψ ∘ φ` | `(i,g) ↦ (i,φ g)` is simplicial, equivariant, descends; identity and composition hold on vertices hence on realizations | sound | none |
| 2.7 presentation complex, `π₁ = PresentedGroup R` | `R = ∅` (wedge of circles); `S = ∅` (a point) | free group on `S` (Hatcher Cor. 1.28); trivial group | sound | locator only (R05) |
| 2.8 attaching `(n+1)`-cells along generators of `π_n`, `n ≥ 2` | `k < n`; `k = n`; `n = 1` | `π_k` unchanged for `k ≤ n−1` by cellular approximation (new cells have dimension `≥ k+2`); `π_n` surjected onto from `π_n(Y)` and every generator dies, so `π_n(Y') = 0`; `n = 1` also works (normal closure of a generating set is everything) but is item 7's case | sound | none |
| 2.9 tower colimit | stage `m` versus later stages | later stages attach cells of dimension `≥ m+2`, which fix `π_m`; `π₁` fixed from the start; sphere images compact ⇒ in a finite stage (Hatcher A.1) | sound | none |
| 3.11 maps out of a connected CW complex into a `K(H,1)` | Hatcher's hypothesis (contractible universal cover) versus `IsEilenbergMacLaneSpaceOne` | the proof extends over cells of dimension `≥ 3` using `π_{n−1}(Y) = 0` only (free null-homotopy of a sphere map equals based null-homotopy when the group vanishes); over 2-cells using the given homomorphism | sound at the roadmap's generality | locator (R05) |
| 3.12 uniqueness, both of CW type | `G = 1`; point versus Warsaw circle | contractible CW complexes, equivalence exists; the Warsaw circle is not a CW complex, excluded; the equivalence is pointed only on the forward map, which is what the Lean `hF : F.toFun x = y` says | sound | none |
| 3.13 CW structures along a free quotient covering | `ℤ` on `ℝ` over `S¹`; `E = ℝ² ∖ {0}` under `(x,y) ↦ (2x, y/2)` | `ℝ`: 0-cells `ℤ`, 1-cells `(n,n+1)`, one orbit over each cell of the circle; the hyperbolic action has a non-Hausdorff quotient but admits no free cellular structure (a free cellular action gives a Hausdorff quotient by the equivariant skeleton-wise neighbourhood construction), so it is outside the hypothesis, not a counterexample | sound | none |
| 3.14 the two models agree | `G = 1` | both contractible CW complexes | sound | none |
| 4.16 augmented cellular chains of `E` as a free resolution | `G = 1`; `G = ℤ` | `G = 1`: `E = B` contractible, acyclic; `G = ℤ`: `ℝ`'s cellular chains `ℤ[ℤ] → ℤ[ℤ]` with `d = t − 1`, augmentation `ℤ[ℤ] → ℤ`, exact | sound | convention of the deck action pinned by R04 |
| 4.17 `H_n(BG;ℤ) ≅ groupHomology` | `ℤ`, `n = 1`; `ℤ/2`, `n = 1,2,3` | `ℤ` both sides; `ℤ/2, 0, ℤ/2` on both sides (`RP^∞`) | sound | none |
| 4.18 join → standard complex is a chain map, not an isomorphism | `G = 1`, degree 0; face `j` | degree 0: `ℤ^(ℕ)` versus `ℤ`, not isomorphic; the ordered cellular boundary `Σ(−1)ʲ[…v̂ⱼ…]` (GeometricTopology Layer 11) maps to `Σ(−1)ʲ(…ĝⱼ…)`, which is `standardComplex.d` (pin line 179); `h·(i,g) = (i,hg)` matches the diagonal action | sound | none |
| 4.19 Checks | `H₁(BG) = G^{ab}`; `H₂(ℤ/n;ℤ)` | Hurewicz degree one; `0` on both sides | sound | none |
| Lean `subsingleton_homotopyGroup_universalGSpace` | `N = Fin 2`; `N = Fin 1` | `Fin 2` nontrivial, covers `π₂`; `Fin 1` excluded by `[Nontrivial N]`, covered by the `SimplyConnectedSpace` instance | sound | deleted by R01 |
| Lean `classifyingSpaceProj_eq_iff` (`∃!`) | `x = y` | unique `g = 1` by freeness | sound | deleted by R01 |
| Lean `exists_homotopyEquiv_of_isAspherical` | `by simp` probe; `#print axioms` | `simp` makes no progress; axioms `propext, sorryAx, Classical.choice, Quot.sound` | not padding; keep | none |
| Lean `exists_isEilenbergMacLaneSpaceOne` | one-term probe | closes by `⟨_, _, _, isEilenbergMacLaneSpaceOne_classifyingSpace G⟩` | corollary of sorry'd data; lacks the CW clause | R01 |

## Not verifiable

- Milnor, "Construction of universal bundles, II", Ann. of Math. 63 (1956): the DOI resolves to JSTOR, paywalled; no open copy found by the sources service. Cited for Stage 1 by locator only (uncertified). Segal 1968 §3 (open, Numdam) describes the same construction and was read instead.
- Brown, *Cohomology of Groups*, GTM 87, §I.4 and Chapters I–III: Springer, paywalled; no open copy. Cited by locator only.
- tom Dieck, *Transformation Groups*, de Gruyter 1987, §II.1: paywalled; no open copy. Cited by locator only.
- Schwamberger–Vogt, "Dold spaces in homotopy theory", AGT 9 (2009): the DOI resolves to msp.org, a host in no licence class for the sources service, and no arXiv version was found; the Warsaw-circle claim (trivial homotopy groups, not contractible) is standard and was checked by hand (loops cannot cross the `sin(1/x)` arc, so every homotopy group vanishes; Čech `H¹ = ℤ`, a homotopy invariant, so it is not contractible), but the locator into the paper is not confirmed.

These four texts are listed in the job's `needs-references.toml`.

## Source issues

- none
