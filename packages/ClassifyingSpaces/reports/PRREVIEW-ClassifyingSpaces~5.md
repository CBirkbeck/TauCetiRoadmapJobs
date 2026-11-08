# Review of ClassifyingSpaces (pull request #1807 at 1745f50)

**Verdict:** needs changes

Incremental re-review of 0 changed lines in `TauCetiRoadmap/ClassifyingSpaces/` since fa7b83e (`git diff --stat fa7b83e HEAD -- TauCetiRoadmap/ClassifyingSpaces` is empty). The head adds repairs to TopologicalKTheory, BordismFormalGroups and CharacteristicClasses and drops the two out-of-folder hunks, but nothing in this folder: `README.md` and `Suggested.lean` are byte-identical to what the previous review read. A commit titled "ClassifyingSpaces: review repairs (acceptance-test Suggested.lean, module header, nerve-model comparison, π₁ direction, locators, Needs, Checks)" (bb25f39a) exists in the repository's object store but is on no branch and is not an ancestor of 1745f50, so its repairs are not part of this pull request. Every finding of the previous report about this folder therefore stands, and the gate still fails (`sorry-data=27`, `build=1`).

## R01 (P1) — `Suggested.lean` is built on sorry'd data (27 declarations) and is not an acceptance test

**Location.** `TauCetiRoadmap/ClassifyingSpaces/Suggested.lean` lines 39, 49, 54, 56, 63, 65, 74, 76, 90–96, 100, 112, 133–163, 188, 190, 206, 212; module docstring lines 9–13 ("`sorry` is permitted … these are targets, not implementations").

**Claim.** Every carrier of the file (the countable join, its base point and `G`-action, the orbit map, the presentation complex, the cellular model, every standing-hypothesis and CW instance, the resolution and the comparison chain map) is `sorry`'d data, and every theorem mentions one. Line 120 puts a `sorry` term inside the *statement* of `fundamentalGroup_classifyingSpaceMap`.

**Witness.** Worker's gate at this head and my rerun: `sorry-data=27`, the lines listed above. The worker's signatures file (27 declarations) shows `universalGSpaceBasepoint : (G : Type u) → universalGSpace G` with no `[Group G]`, so the vertex `(0, 1)` of README Stage 1 item 1 is not expressible in its own signature. `exists_isEilenbergMacLaneSpaceOne` (line 108) drops the CW clause of Scope item 1 and closes in one term from line 103 (previous report's probe; file unchanged).

**Repair.** Unchanged from the previous report: rewrite the file as the acceptance test. Keep `exists_homotopyEquiv_of_isAspherical` (correct on pinned carriers). State existence of a *CW* `K(G,1)` on pinned carriers (`T2Space`, `Topology.CWComplex (Set.univ : Set X)`, `IsEilenbergMacLaneSpaceOne G X x`); state the homology comparison for any Hausdorff CW `K(G,1)` as `Nonempty (groupHomology (Rep.trivial ℤ G ℤ) n ≅ …)` with the singular side from `AlgebraicTopology.singularHomologyFunctor` (pin: `Mathlib/AlgebraicTopology/SingularHomology/Basic.lean` line 52) and the cohomology clause of R04; state Stage 3 item 11 (maps out of a connected CW complex into a `K(H,1)` realise every homomorphism, uniquely up to homotopy rel the base point) on `FundamentalGroup`, `ContinuousMap.HomotopicRel`, `Topology.CWComplex`, `IsEilenbergMacLaneSpaceOne`. Delete the sorry'd models and everything about them; the docstring names the Milnor model, the presentation complex, the cellular tower and the chain-level comparison with `Rep.standardResolution` as the headlines not statable at the pins. The `Type`-only universe of lines 206–228 disappears with them.

## R02 (P2) — AlgebraicTopology Stage 8 and this roadmap's Stages 3–4 cite each other

**Location.** `TauCetiRoadmap/ClassifyingSpaces/README.md` lines 72–80 ("Stages 3 and 4 consume Whitehead, Hurewicz and the cellular comparison" from AlgebraicTopology Stages 4 and 8) and items 12, 16 (lines 185–195, 225–238); `TauCetiRoadmap/AlgebraicTopology/README.md` at this head, lines 93–101 ("Stage8.8b owns only its normalized comparison with those ClassifyingSpaces models"), 2057–2075 ("using its Stage 3 items11–15 and Stage 4 items16–18") and the table row at line 2424 ("8.8b normalized model comparison | AT8.8a bar model; CS Stage3 items11–15 and Stage4 items16–18 | 8.9").

**Claim.** Each roadmap lists the other as a supplier of a layer: ClassifyingSpaces Stage 3 item 12 needs AlgebraicTopology 8.5 (Whitehead) and Stage 4 item 16 needs 8.3 (Hurewicz); AlgebraicTopology 8.8b needs ClassifyingSpaces Stage 3 items 11–15 and Stage 4 items 16–18. At item level the graph is acyclic (8.3, 8.5 → CS 11–18 → 8.8b), but the supply between the two roadmaps has no single direction, which is exactly the kind of loop this pull request exists to cut.

**Witness.** The AlgebraicTopology lines quoted above, read at 1745f50 (unchanged from fa7b83e and from main). The dependency check does not see the pair: `depcheck: 225 roadmaps, 2104 edges, 0 problem(s)`.

**Repair.** Unchanged from the previous report: make ClassifyingSpaces the consumer throughout. Move the content of AlgebraicTopology 8.8b (the pointed comparison of the nerve model `|nerve (SingleObj π)|` of 8.8a with the Milnor and presentation models, normalised by `κ_bar ∘ π₁(c_G) = κ_model`, its naturality up to pointed homotopy, and the identification of both local-coefficient cohomology comparisons with the identity on `groupCohomology`) into this roadmap as a Stage 3 item after 14, with `*Needs:*` AlgebraicTopology 8.8a and item 12, plus a Stage 4 clause of item 17. AlgebraicTopology then cites this roadmap only in a consumer sentence and its table row 8.8b loses the CS entry. CharacteristicClasses line 139 ("consumes Stage 8.8b's normalized ℤ/2 model") then points at the new ClassifyingSpaces item for `ℤ/2`.

## R03 (P1) — The gate's build step fails: `Suggested.lean` imports `Mathlib` without the module-system header

**Location.** `TauCetiRoadmap/ClassifyingSpaces/Suggested.lean` lines 1–4 (`import Mathlib` and three `import TauCeti.…` lines, no `module`).

**Claim.** At the pins (`Mathlib` f6090c70, Tau Ceti 358314d4) both packages are module-system packages; the targeted build `lake build TauCetiRoadmap.ClassifyingSpaces.Suggested` emits Lake's warning "imports `Mathlib` from package `mathlib`, which is designed for use with the module system; consider adding `module`", and the gate counts it as a build failure. The previous report mentioned the message under `## Verified sound` and did not count it; the gate does, so it is recorded here.

**Witness.** Worker's gate at 1745f50: `build=1 FAIL` with that single message. `lake env lean TauCetiRoadmap/ClassifyingSpaces/Suggested.lean` exits 0 with 39 `declaration uses sorry` warnings and nothing else (Lake's warning is emitted only by `lake build`). The sibling repairs in this same pull request already use the working header: `TauCetiRoadmap/TopologicalKTheory/Suggested.lean` lines 1–4 (`module`, `public import Mathlib`, `public import TauCeti.…`) at commit 1745f502.

**Repair.** Line 1 `module`, blank line, `public import Mathlib`, one `public import TauCeti.<…>` per module actually used, the module docstring, then `@[expose] public section` before the namespace (plain `public section` breaks the two `inferInstanceAs` instances at lines 45 and 71 if any `def` carrier is kept, because the body of `universalGSpace` is no longer exposed; after R01 deletes the carriers, `public section` alone also works). Rebuild and confirm from a scratch importer that `#check @TauCetiRoadmap.ClassifyingSpaces.exists_homotopyEquiv_of_isAspherical` resolves.

## R04 (P2) — The cohomology half of the comparison with algebra is statable at the pins and absent

**Location.** `TauCetiRoadmap/ClassifyingSpaces/README.md` lines 43–45 (Scope item 4: "its cohomology with coefficients in a `G`-module is Mathlib's `groupCohomology`") and line 241; `TauCetiRoadmap/ClassifyingSpaces/Suggested.lean` has no cohomology statement.

**Claim.** The headline comparison has a homology and a cohomology clause; only homology (line 225, through the sorry'd model) is in the file.

**Witness.** Pinned Tau Ceti has `TopCat.singularCohomology (X : TopCat) (n : ℕ) : ModuleCat k` (`TauCeti/AlgebraicTopology/Cohomology/Basic.lean` line 94, a protected abbrev under `variable (R k M)`) and `singularCohomologyFunctor` (line 129); pinned Mathlib has `groupCohomology [Group G] (A : Rep k G) (n : ℕ) : ModuleCat k` (`Mathlib/RepresentationTheory/Homological/GroupCohomology/Basic.lean` line 184). So `Nonempty (groupCohomology (Rep.trivial ℤ G ℤ) n ≅ (TopCat.of X).singularCohomology … n)` for a Hausdorff CW `K(G,1)` `X` is statable with trivial coefficients. Local coefficients in a `G`-module are not statable (no pinned local-system cohomology of spaces).

**Repair.** Add the trivial-coefficient cohomology statement next to the homology one, over any Hausdorff CW `K(G,1)` rather than a model, and name the local-coefficient clause in the docstring as not statable and what it lacks.

## R05 (P3) — The direction of `π₁(BG) ≅ G` is announced but never pinned

**Location.** `TauCetiRoadmap/ClassifyingSpaces/README.md` lines 63–64 ("fixes a direction and must say which"), 142–144 (Stage 1 item 5, "in the direction fixed against the opposite-group convention"), 230–232 (item 16, "state which").

**Claim.** The roadmap tells the implementer a convention must be chosen but does not choose it, and gives no two-term Check that detects the wrong choice.

**Witness.** With the left action `h • (i, g) = (i, h * g)` of item 3 and `FundamentalGroup.mul_def : p * q = q.trans p` (`Mathlib/AlgebraicTopology/FundamentalGroupoid/FundamentalGroup.lean` line 41; `q` traversed first), the monodromy label `m(γ)` (the lift of `γ` from `(0, 1)` ends at `(0, m(γ))`) satisfies `m(p * q) = m(q) · m(p)`. In `S₃` with `s = (1 2)`, `t = (2 3)`: `m(ℓ_s * ℓ_t) = t s` while `m(ℓ_s) m(ℓ_t) = s t ≠ t s`. So `γ ↦ m(γ)` is not a homomorphism; `γ ↦ m(γ)⁻¹` is, sending `ℓ_s * ℓ_t` to `(t s)⁻¹ = s t`.

**Repair.** State in Stage 1 item 5 that the isomorphism `π₁(classifyingSpace G, b₀) ≃* G` sends the class of a loop whose lift from `(0, 1)` ends at `(0, g)` to `g⁻¹`, and add the `S₃` computation as a Check (the label itself fails multiplicativity). Item 16 uses the same convention for the deck action on the cellular chains; the naturality statements of items 11 and 17 inherit it.

## R06 (P3) — Locators: the presentation complex is not in Hatcher's Section 1.B, and the main targets carry no theorem locators

**Location.** `TauCetiRoadmap/ClassifyingSpaces/README.md` lines 292–294 ("Section 1.B for `K(G, 1)` spaces, their uniqueness and the presentation complex; Section 4.1 for killing homotopy groups"); items 7, 8, 9, 11, 12, 13, 16 (lines 159–238) cite no theorem or page.

**Claim.** The presentation complex with `π₁ = ⟨S | R⟩` is Hatcher Corollary 1.28 in Section 1.2; Section 1.B contains the Δ-complex `BG` (Example 1B.7), not the presentation complex.

**Witness.** `hatcher-at` line 2353 (Corollary 1.28, printed p. 52, file page 61), 3844 (Example 1B.7, p. 89), 3897 (Theorem 1B.8, p. 90), 3905 (Proposition 1B.9, p. 90), 15407 (Example 4.16, Postnikov towers, p. 354), 22534 (Proposition A.1, p. 520); printed page = file page − 9 throughout, re-read at this review.

**Repair.** In the References replace "and the presentation complex" by "Section 1.2, Corollary 1.28, p. 52 for the presentation complex". Locators at the claims: item 7 (Hatcher Cor. 1.28, p. 52); item 8 (§4.1, Example 4.16, p. 354, with cellular approximation Thm 4.8); item 9 (Prop. A.1, p. 520); item 11 (Prop. 1B.9, p. 90, noting the proof uses only `π_n(Y) = 0` for `n ≥ 2`, so it applies to `IsEilenbergMacLaneSpaceOne`, `TauCeti/AlgebraicTopology/EilenbergMacLane/Basic.lean` line 123); item 12 (Thm 1B.8, p. 90); items 13 and 16 (Brown §I.4, tom Dieck §II.1, by locator; both uncertified).

## R07 (P3) — The Inventory attributes Mathlib declarations to Tau Ceti

**Location.** `TauCetiRoadmap/ClassifyingSpaces/README.md` lines 99–100 ("`TauCeti/AlgebraicTopology/SimplicialComplex/` has abstract complexes") and 103–105 ("`TauCeti/AlgebraicTopology/UniversalCover/` … have … `IsQuotientCoveringMap`").

**Claim.** Both objects are Mathlib's at the pin.

**Witness.** `AbstractSimplicialComplex` is `Mathlib/AlgebraicTopology/SimplicialComplex/Basic.lean` line 154; `IsQuotientCoveringMap` is `Mathlib/Topology/Covering/Quotient.lean` line 36. Tau Ceti's `SimplicialComplex/` holds the realization, join, cone, subdivision and collapse; its `EilenbergMacLane/Basic.lean` holds `IsAspherical` (line 59) and `IsEilenbergMacLaneSpaceOne` (line 123); the recognition theorem is `UniversalCover/Classification/EilenbergMacLane.lean` line 84.

**Repair.** Say "Mathlib's `AbstractSimplicialComplex`; Tau Ceti's `SimplicialComplex/` adds the realization with the weak topology, the join and cone, subdivision and collapse", and "Mathlib's `IsQuotientCoveringMap`, with `TauCeti/AlgebraicTopology/UniversalCover/` supplying the universal cover and `TauCeti/AlgebraicTopology/EilenbergMacLane/` `IsAspherical`, `IsEilenbergMacLaneSpaceOne` and the recognition theorems".

## R08 (P3) — README form: no `*Needs:*` lines, no Checks lists, process words

**Location.** `TauCetiRoadmap/ClassifyingSpaces/README.md` line 58 ("now complete"), line 259 ("The first two are new"); Stage 1 item 1, Stage 2 item 7, Stage 3 item 13 (definitions with no `**Checks.**` list); every item (no `*Needs:*` line; the "Ordering" section, lines 262–271, stands in for per-layer Dependencies).

**Claim.** "now" and "new" are process narrative; the definitions (countable join, presentation complex, lifted and descended CW structures) carry no discriminating Checks; needs are stated only at stage level.

**Witness.** The lines quoted. Checks the roadmap implies but does not list: trivial group (the join is the infinite simplex, countably many vertices against one generator in degree 0 of the standard complex, lines 246–248); `ℤ` on `ℝ` (one orbit of cells over each cell of the circle); `S₃` for the direction of `π₁ ≅ G` (R05).

**Repair.** Replace "now complete" by "complete" and "are new" by "are proved here"; add a `**Checks.**` list to items 1, 7 and 13 with the three computations above and the Warsaw-circle negative control of Scope item 2 for item 12; add `*Needs:*` lines per item naming the supplier sections (AlgebraicTopology 1.4, 4.5, 8.3, 8.5; GeometricTopology Layer 11; UniversalCovers item 14; Mathlib `Topology.IsQuotientMap.locallyPathConnectedSpace`, `Rep.standardResolution`, `CategoryTheory.ProjectiveResolution.homotopyEquiv`).

## Previous findings

- R01 — not repaired: `Suggested.lean` is unchanged; `sorry-data=27` at this head (now R01).
- R02 — not repaired: AlgebraicTopology README lines 93–101, 2057–2075 and table row 2424 still name "CS Stage3 items11–15 and Stage4 items16–18" as 8.8b's supplier; this README lines 72–80 still consume Stage 8 (now R02).
- R03 — not repaired: no cohomology statement in `Suggested.lean` (now R04).
- R04 — not repaired: lines 63–64, 142–144, 230–232 still say "must say which" / "state which" (now R05).
- R05 — not repaired: References line 292 still places the presentation complex in Section 1.B; items 7–16 still without locators (now R06).
- R06 — not repaired: Inventory lines 99–100 and 103–105 unchanged (now R07).
- R07 — not repaired: "now complete" (line 58), "are new" (line 259), no `*Needs:*` lines or Checks lists (now R08).
- R08 — repaired: commit 74e527e8 restores `Completed/ArithmeticDirichletSeries/README.md` to main (`git diff origin/main HEAD` on it is empty); gate `outside-folder=0`.
- R09 — repaired: the same commit restores `TauCetiRoadmap/SymplecticGeometry/README.md` to main; line 77 now reads "boundary and sign adapters to HeegaardFloer and DGFloer", the doubled verb gone.

## Verified sound

**Change set.** `git diff --stat fa7b83e HEAD -- TauCetiRoadmap/ClassifyingSpaces`: empty. `git diff --stat origin/main...HEAD` outside the fourteen folders the brief names as the pull request's own: empty. The folder's only change against main remains the Inventory bullet at lines 96–98 (singular homology cited to Mathlib), already reviewed.

**Gate and build.** Worker's gate at 1745f50: `sorry-data=27`, `build=1` (Lake's module-system warning), everything else 0, `outside-folder=0`. My rerun from the worktree without the pull request's folder list reproduces `sorry-data=27` and reports `outside-folder=16`, which lists exactly the sibling folders the brief names as the pull request's own (AlgebraicCurves, AlgebraicTopology, BordismFormalGroups, …): a false positive of running the gate without that list, not a finding. `lake env lean TauCetiRoadmap/ClassifyingSpaces/Suggested.lean`: exit 0, 39 `declaration uses sorry` warnings, nothing else. The worker's signatures file lists 27 declarations, one with a dropped binder (`universalGSpaceBasepoint`, no `[Group G]`); the file being unchanged, the `#check` comparison of the previous report stands.

**Dependency check.** Output, verbatim: `depcheck: 225 roadmaps, 2104 edges, 0 problem(s)`. No UPWARD or CYCLE line for this roadmap. Its suppliers (UniversalCovers in `Completed/`, AlgebraicTopology, GeometricTopology, ProfiniteCohomology) are all on main. The AlgebraicTopology–ClassifyingSpaces layer-level mutual citation (R02) is below the tool's resolution.

**Cross-roadmap citations resolved at this head (4 roadmaps).** The worker's `roadmaps resolve` found no unresolved citation or Lean name. AlgebraicTopology at 1745f50: lines 93–101 and 2057–2075 (8.8a/8.8b) and the dependency table rows 2424 and 2427 read for R02; CharacteristicClasses at 1745f50 line 139 (consumes 8.8b's ℤ/2 model), lines 140 and 272 (cites ClassifyingSpaces for discrete groups, builds Milnor's join only for compact Lie `G`); GeometricTopology Layer 11 and UniversalCovers item 14 as in the previous report (both on main, unchanged).

**Library declarations opened at the pins (12).** `IsAspherical` and `IsEilenbergMacLaneSpaceOne` (`TauCeti/AlgebraicTopology/EilenbergMacLane/Basic.lean` 59, 123); recognition theorem `isEilenbergMacLaneSpaceOne` (`UniversalCover/Classification/EilenbergMacLane.lean` 84); `TopCat.singularCohomology` and `singularCohomologyFunctor` (`TauCeti/AlgebraicTopology/Cohomology/Basic.lean` 94, 129); `groupCohomology` (`Mathlib/RepresentationTheory/Homological/GroupCohomology/Basic.lean` 184); `groupHomology` (`GroupHomology/Basic.lean` 228); `AlgebraicTopology.singularHomologyFunctor` (`SingularHomology/Basic.lean` 52); `FundamentalGroup.mul_def` (`FundamentalGroupoid/FundamentalGroup.lean` 41); `AbstractSimplicialComplex` (`SimplicialComplex/Basic.lean` 154); `IsQuotientCoveringMap` (`Topology/Covering/Quotient.lean` 36); `Rep.standardResolution` (`Homological/Resolution.lean` 323). Pinned Tau Ceti `TauCeti/AlgebraicTopology/` has no `ClassifyingSpace/` directory, so the file's carriers duplicate nothing at the pin.

**Ownership.** `roadmaps grep -i --readme-only 'countable join|Milnor.{0,20}join|presentation complex'` over the open heads and main: no roadmap other than this one constructs Milnor's countable join for a discrete group or the presentation-complex `K(G,1)`; CharacteristicClasses builds the join for compact Lie groups and cites this roadmap; GeometricTopology (several open heads) uses presentation complexes inside its own group-theoretic layers and names "the classifying-space roadmap" as the consumer of its Layer 11 cellular chains; FourManifolds uses a finite presentation complex as input. AlgebraicTopology 8.8a's nerve model is the third model and the subject of R02. Ownership against open pull requests whose files the brief does not list was not checked beyond that grep.

**Seeded sample, "Both models are wanted" (README lines 14–20).** Re-read at this head against `hatcher-at`: Example 1B.7 (line 3844, p. 89) builds `BG = EG/G` as a Δ-complex with `π₁ = G` and `EG` contractible; Theorem 1B.8 (line 3897, p. 90) says the homotopy type of a CW `K(G,1)` is determined by `G`; Proposition 1B.9 (line 3905, p. 90) realises every homomorphism `π₁(X,x₀) → π₁(Y,y₀)` by a pointed map unique up to homotopy rel `x₀`, for `X` a connected CW complex and `Y` a `K(G,1)`; and against `segal-1968` lines 116–123, which describe Milnor's `(G*G*…)/G` as the universal space and identify it with the realization of a nerve. The paragraph's claims (uniform existence through the join; the cellular model as the one later homological arguments use; the comparison makes "the" classifying space well defined) are supported with the CW-type hypotheses of Scope item 2. The one locator defect is R06.

**Adversarial table.** No statement changed since fa7b83e, so every row is carried from the previous report (PRREVIEW-ClassifyingSpaces~1), with its computed values restated.

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| 1.1 countable join: faces = nonempty finite sets meeting each index at most once | all `A i = ∅`; `G = 1`; `G = ℤ/2` | empty type: no faces, a legal complex; `G = 1`: every finite set of `(i,1)` a face, the infinite simplex; `G = ℤ/2`: `{(0,0),(0,1)}` not a face, `{(0,0),(1,1)}` a face | sound (previous report) | none |
| 1.2 weak contractibility when infinitely many `A i ≠ ∅` | all empty; finitely many nonempty; constant `G` | no points (hypothesis fails); `A₀ = {a,b}`, rest empty: two points, not path-connected (hypothesis fails); constant `G`: compact image in indices `F`, `j ∉ F`, `K_F * {(j,1)}` a cone, loop contracts | sound; hypothesis sharp (previous report) | none |
| 1.3 action free, orbit map a quotient covering | `h ≠ 1`; `U_{(i,g)} ∩ h·U_{(i,g)}` | `h·(i,g) = (i,hg) ≠ (i,g)`: free; a point of both has a carrier containing `(i,g)` and `(i,hg)` at one index: empty | sound (previous report) | none |
| 1.4 standing hypotheses | realization; orbit space | convex closed simplex ⇒ locally path-connected; `IsQuotientMap.locallyPathConnectedSpace` twice; simply connected cover ⇒ semilocally simply connected | sound (previous report) | none |
| 1.5 `π₁(BG) ≅ G` direction | `S₃`, `s = (12)`, `t = (23)` | `m(ℓ_s * ℓ_t) = ts`, `m(ℓ_s)m(ℓ_t) = st`; label not multiplicative; `m⁻¹` is | convention unpinned | R05 |
| 1.6 strict functoriality | `φ = id`; `ψ ∘ φ` | `(i,g) ↦ (i,φ g)` simplicial, equivariant, descends; identity and composition on vertices hence on realizations | sound (previous report) | none |
| 2.7 presentation complex, `π₁ = PresentedGroup R` | `R = ∅`; `S = ∅` | free group on `S` (Hatcher Cor. 1.28, line 2353); trivial group | sound | locator (R06) |
| 2.8 attaching `(n+1)`-cells along generators of `π_n`, `n ≥ 2` | `k < n`; `k = n`; `n = 1` | `π_k` unchanged for `k ≤ n−1` (new cells of dimension `≥ k+2`); every generator of `π_n` dies, `π_n(Y') = 0`; `n = 1` is item 7's case | sound (previous report) | none |
| 2.9 tower colimit | stage `m` versus later | later cells of dimension `≥ m+2` fix `π_m`; compact sphere images in a finite stage (Hatcher A.1, line 22534) | sound | none |
| 3.11 maps into a `K(H,1)` from a connected CW complex | Hatcher's hypothesis versus `IsEilenbergMacLaneSpaceOne` | extension over cells of dimension `≥ 3` uses only `π_{n−1}(Y) = 0`; over 2-cells the given homomorphism | sound at the roadmap's generality | locator (R06) |
| 3.12 uniqueness, both of CW type | `G = 1`; point versus Warsaw circle | contractible CW complexes equivalent; Warsaw circle not CW, excluded; the Lean `hF : F.toFun x = y` is pointedness of the forward map only | sound (previous report) | none |
| 3.13 CW structures along a free quotient covering | `ℤ` on `ℝ`; `ℝ² ∖ {0}` under `(x,y) ↦ (2x, y/2)` | `ℝ`: 0-cells `ℤ`, 1-cells `(n,n+1)`, one orbit over each cell of `S¹`; the hyperbolic action has a non-Hausdorff quotient and no free cellular structure, outside the hypothesis | sound (previous report) | none |
| 3.14 the two models agree | `G = 1` | both contractible CW complexes | sound | none |
| 4.16 augmented cellular chains of `E` as a free resolution | `G = 1`; `G = ℤ` | `G = 1`: `E = B` contractible, acyclic; `G = ℤ`: `ℤ[ℤ] → ℤ[ℤ]`, `d = t − 1`, augmentation `ℤ[ℤ] → ℤ`, exact | sound | deck convention via R05 |
| 4.17 `H_n(BG;ℤ) ≅ groupHomology` | `ℤ`, `n = 1`; `ℤ/2`, `n = 1,2,3` | `ℤ` both sides; `ℤ/2, 0, ℤ/2` both sides (`RP^∞`) | sound | none |
| 4.18 join → standard complex is a chain map, not an isomorphism | `G = 1`, degree 0; face `j` | `ℤ^(ℕ)` versus `ℤ`, not isomorphic; ordered boundary `Σ(−1)ʲ[…v̂ⱼ…]` ↦ `Σ(−1)ʲ(…ĝⱼ…)` = `standardComplex.d`; `h·(i,g) = (i,hg)` matches the diagonal action | sound (previous report) | none |
| 4.19 Checks | `H₁(BG) = G^{ab}`; `H₂(ℤ/n;ℤ)` | Hurewicz degree one; `0` both sides | sound | none |
| Lean `subsingleton_homotopyGroup_universalGSpace` | `N = Fin 2`; `N = Fin 1` | `Fin 2` covers `π₂`; `Fin 1` excluded by `[Nontrivial N]` | sound | deleted by R01 |
| Lean `classifyingSpaceProj_eq_iff` (`∃!`) | `x = y` | unique `g = 1` by freeness | sound | deleted by R01 |
| Lean `exists_homotopyEquiv_of_isAspherical` | `simp` probe; `#print axioms` (previous report) | no progress; `propext, sorryAx, Classical.choice, Quot.sound` | not padding; keep | none |
| Lean `exists_isEilenbergMacLaneSpaceOne` | one-term probe (previous report) | closes by `⟨_, _, _, isEilenbergMacLaneSpaceOne_classifyingSpace G⟩` | corollary of sorry'd data; lacks CW clause | R01 |

## Not verifiable

- Milnor, "Construction of universal bundles, II", Ann. of Math. 63 (1956): JSTOR, paywalled; cited by locator only (uncertified). Segal 1968 §3 (`segal-1968` lines 116–123) read instead.
- Brown, *Cohomology of Groups*, GTM 87, §I.4 and Chapters I–III: settled as uncertified in the manifest; cited by locator only.
- tom Dieck, *Transformation Groups*, 1987, §II.1: paywalled, no open copy; cited by locator only.
- Schwamberger–Vogt, "Dold spaces in homotopy theory", AGT 9 (2009): msp.org host outside the sources service's licence classes, no arXiv version found; the Warsaw-circle claim is standard and was checked by hand in the previous report; the locator into the paper is not confirmed.

## Source issues

- none
