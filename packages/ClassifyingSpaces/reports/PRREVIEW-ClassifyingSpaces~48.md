# Review of ClassifyingSpaces (pull request #1807 at 92defa2)

**Verdict:** needs changes

Full review of `TauCetiRoadmap/ClassifyingSpaces/README.md` and `TauCetiRoadmap/ClassifyingSpaces/Suggested.lean`. The folder has not changed since 9753a7d. But commit 9753a7d1 rewrote this pull request's own AlgebraicTopology folder, and that rewrite is the source of R01. Two findings block (P2) and five are P3.

## R01 (P2) — Hatcher 1B.9 has two owners in this pull request, and the bar-model comparison has none

**Location.** `TauCetiRoadmap/ClassifyingSpaces/README.md` lines 79–82: "is the case of items 1.1 and 1.2 … and is owned here, not in the algebraic-topology roadmap. This roadmap consumes nothing from the algebraic-topology roadmap". Also lines 71–79 and 934–941 (AlgebraicTopology Stage 8 items 8a/8b own the nerve comparison and consume Layer 1), and `Suggested.lean:81`.

**Claim.** This roadmap owns Proposition 1B.9 for an arbitrary path-connected Hausdorff CW source (items 1.1–1.2). AlgebraicTopology 8.8b owns the normalised comparison of its bar model with the pinned models, consuming Layer 1.

**Witness.** At this head, `AlgebraicTopology/README.md` lines 99–107 and 2541–2566 give 8.8b the classification: "ClassifyingSpaces consumes that classification … owns no second proof". Lines 94–99 and 2535 hand ClassifyingSpaces the bar comparison. `AlgebraicTopology/Suggested.lean:655` implies this headline.

**Probe.** A scratch file copying `exists_mapOfEq_eq_of_isAspherical_cwComplex` (with `X : Type u`, `Y : Type v`, no vertex hypothesis) closes this file's `exists_continuousMap_mapOfEq_eq_of_isAspherical` with one term, `at_exists_mapOfEq_eq_of_isAspherical_cwComplex x _hY φ`. It elaborates with only the copied `sorry`.

So within one pull request:
- the same theorem is stated twice;
- each README names the other as the consumer of 1B.9;
- the normalised bar-model comparison is assigned by each README to the other, so nobody owns it.

At the previously accepted head 3adc047, AlgebraicTopology said "Stage8.8b owns only its normalized comparison with those ClassifyingSpaces models" and had no such declaration.

**Repair.** Choose one owner and make both folders say the same thing before this pull request merges.

The smaller edit keeps the direction this README takes. That is also the direction on main (main's `TauCetiRoadmap/AlgebraicTopology/README.md` lines 93–100: 8.8b consumes ClassifyingSpaces) and the one in the stacked revision of AlgebraicTopology (#1808, its README lines 101–110, 2231–2253 and table line 2656: "8.8b normalized model comparison | AT8.8a bar model; ClassifyingSpaces Layer 1 items 1.1–1.3"). Concretely:
1. In this pull request's `TauCetiRoadmap/AlgebraicTopology/README.md`, rewrite lines 94–107, 505 and 2533–2566 so that 8.8b consumes ClassifyingSpaces Layer 1 items 1.1–1.3 and owns the normalised bar comparison, as lines 71–79 here say.
2. Delete `exists_mapOfEq_eq_of_isAspherical_cwComplex` from `TauCetiRoadmap/AlgebraicTopology/Suggested.lean`.
3. Leave this README's lines 71–88 and 934–944 as they are.

The alternative is for AlgebraicTopology to own 1B.9. Then delete this file's first headline and items 1.1–1.2, cite AlgebraicTopology 8.8b, and drop "consumes nothing from the algebraic-topology roadmap". AlgebraicTopology must then precede this roadmap.

After the first repair, a search of the pull request for an `IsAspherical` target with `HomotopicRel f g {x}` should find only `ClassifyingSpaces/Suggested.lean:89`.

## R02 (P2) — Every headline requires the base point to be a vertex, because the route needs it

**Location.** `Suggested.lean` lines 83, 101, 121 and 137: `(_hx : x ∈ Topology.RelCWComplex.skeletonLT (Set.univ : Set X) 1)`. README Conventions lines 173–181: "the routes move base points by a homotopy prescribed on the discrete `0`-skeleton … which contain the base point only when it is a vertex".

**Claim.** The four headlines, and Layer 2's standing hypothesis (README line 707), assume the CW base point is a `0`-cell.

**Witness.** Hatcher's 1B.9 allows any base point (`hatcher-at` lines 3905–3907). AlgebraicTopology's `Suggested.lean:655`, in this pull request, has no vertex hypothesis. The pinned cellular model's `0`-skeleton is one point (`TauCeti.skeletonLT_one_cellularClassifyingSpace`), so no point of a `1`-cell qualifies.

The general statement is true, and the restriction exists only for the chosen route. The README says so at lines 177–181, which is a route-specific narrowing of headlines.

**Repair.** Delete `_hx` from the four declarations, from 1.1–1.3, and from the Layer 2 standing hypothesis. Then:
1. Add a Layer 1 target: for every point `x` of a Hausdorff CW complex `X`, `TauCeti.HasHomotopyExtensionProperty ({x} : Set X)`. Source: Hatcher, Proposition 0.16, p. 15 (`hatcher-at` line 818), after subdividing the closed cell through `x` so that `x` becomes a `0`-cell. Alternatively, prove it through a pinned `TauCeti.NDRPair` on a disc about `x` in its cell.
2. Reduce items 1.1–1.3 for a non-vertex `x`: choose a vertex `v` and a path `α` from `x` to `v`. Apply the vertex case at `v` to `φ` composed with the base-point change along `α⁻¹`. Then move the base point back along `α` using the new target, as 1.1 already does at a vertex.
3. Reduce Layer 2 without any new homotopy extension: `ofRepresentation x (A.ρ.comp Ψ)` is isomorphic to `ofRepresentation v (A.ρ.comp (Ψ ∘ β_α⁻¹))`. This follows from 2.3's transport bullet, with transport along `α` as intertwiner, and `TauCeti.LocalCoefficientSystem.ofRepresentationMonodromyIso`. Then apply the vertex case to `(v, Ψ ∘ β_α⁻¹)`.

Test case: on the cellular model with `x` on a `1`-cell, the repaired headlines apply and are true, by subdivision. The current ones do not apply.

## R03 (P3) — The reason given for one universe misdescribes `Rep`

**Location.** README line 249–250: "because Mathlib's `Rep k G` keeps `k` and `G` in one universe". The same reason appears at lines 190–191 and at `Suggested.lean` lines 57–58.

**Claim.** `Rep k G` forces `k` and `G` into one universe.

**Witness.** At the pin, `Mathlib/RepresentationTheory/Rep/Basic.lean:30` declares `structure Rep (k : Type u) (G : Type v)`, so the universes are independent. The constraint actually comes from `groupHomology` (`Mathlib/RepresentationTheory/Homological/GroupHomology/Basic.lean:79`, `variable (k G : Type u)`) and from `groupCohomology` (`GroupCohomology/Basic.lean:73`).

**Repair.** In all three places, replace the reason with: "because Mathlib's `groupHomology` and `groupCohomology` take `k` and `G` in one universe, and the pinned comparisons for Milnor's model keep the representation there too (`Rep.{u, u, u} k G`)".

## R04 (P3) — The Proposition 1B.9 locator drops Hatcher's hypothesis on `Y` and the proof's page

**Location.** README lines 24–26 and 519–521 ("Hatcher's Proposition 1B.9 in full generality"; "Hatcher, Proposition 1B.9, p. 90, existence clause"). Line 176: "(p. 90, where the base point is a `0`-cell of the maximal tree)". `Suggested.lean` lines 72–73.

**Claim.** The source states the result for an arbitrary aspherical target, on p. 90. (A `TauCeti.IsAspherical` space need not have a universal cover.)

**Witness.** Hatcher's `Y` is a `K(G, 1)` with a contractible universal cover (`hatcher-at` line 3800, p. 87). The proof uses that cover for cells of dimension greater than 2 (lines 3928–3931, p. 91). The maximal tree is on p. 91 (lines 3938–3949).

**Repair.** At each of these places write: "Hatcher, Proposition 1B.9, p. 90, proof pp. 90–91, stated for `Y` with a contractible universal cover (p. 87). The extension over `n`-cells, `n ≥ 3` (p. 91), uses only `π_{n−1}(Y) = 0`, which is the hypothesis here and of the pinned `TauCeti.exists_mapOfEq_cellularClassifyingSpace`." In line 176, change the page to p. 91.

## R05 (P3) — Layer 2's comparison theorems have no source locator

**Location.** README items 2.1 (lines 713–749), 2.2 (771–791) and 2.3 (809–882).

**Claim.** Items 2.1–2.3 state the comparison of a CW `K(G, 1)`'s (co)homology, with trivial and with local coefficients, with group (co)homology, along with its naturality and Bockstein compatibility.

**Witness.** No locator appears at any of these claims. The only related source is Brown, cited in References (line 961) for the algebraic definition of group (co)homology alone. The sampled targets 2.1–2.3 therefore have nothing to check against.

**Repair.**
- At 2.1 and 2.2, add the locator of the topological interpretation of group (co)homology through a `K(G, 1)` in the source the roadmap already records (`brown-cohomology`, Chapter II, Section 4, cited by its locator).
- At 2.3, add Brown, Chapter III, Section 1, together with Hatcher, Section 3.H, p. 328 (`hatcher-at` lines 14326–14362). That passage defines the twisted chains as `C_n(X̃) ⊗_{ℤ[π]} M`, and the pinned `TauCeti.cellularResolutionOfIsAspherical` turns them into a resolution.
- The Brown chapter numbers could not be checked (see *Not verifiable*). Cite the section the author holds.

## R06 (P3) — A Conventions Check gives the wrong pinned resolution for the circle

**Location.** README lines 240–243: "`G = ℤ`, the circle as `K(ℤ, 1)`: with the resolution `ℤ[ℤ] → ℤ[ℤ] → ℤ` of the pinned `TauCeti.cellularClassifyingSpaceResolution`".

**Claim.** For the presentation `⟨t | ⟩`, the pinned resolution has two terms.

**Witness.** `TauCeti.killingAttachingMaps` (`…/Homotopy/KillHomotopyGroups.lean:118–128`) attaches, at step `k + 1` with `2 ≤ k`, a `(k + 1)`-cell along every generalized `k`-loop, constant loops included. So the pinned model of `⟨t | ⟩` has `3`-cells, and the resolution is nonzero in degree `3`.

**Repair.** Restate the Check as: "in degrees `1 → 0`, the pinned `TauCeti.cellularClassifyingSpaceResolution` of `⟨t | ⟩` is multiplication by `t − 1` on `ℤ[ℤ]`; the other convention gives `t⁻¹ − 1`". On the refuting instance, the degree-3 term is the free module on the attached `3`-cells, which is not zero. That is consistent with the restated Check, which says nothing about degree 3.

## R07 (P3) — House shape: one API not in bullets, one sentence without a verb

**Location.**
- README line 774: "Its API: independence of the choice of `c_X` … ; agreement … ; naturality …". Item 2.2's API is one run-on sentence.
- Lines 224–225: "so the map wrapping the circle around a loop `γ` with `m(γ) = −1`." The sentence has no main verb.

**Claim.** The README follows the house shape, where a definition lists its API as bullets that each state one fact.

**Witness.** Items 2.1 (lines 718–736) and 2.3 (lines 815–865) use bullets. Item 2.2 does not. Line 225 ends the sentence on a noun phrase.

**Repair.**
- Split 2.2's API into five bullets: independence of `c_X`, agreement on `BG`, naturality in `(X, Ψ)`, naturality in `M`, and Bockstein compatibility. Each bullet names its pinned input.
- Change line 224–225 to "… sends the counterclockwise loop to `1`, so it wraps the circle once around a loop `γ` with `m(γ) = −1`."

## Verified sound

**Gate and build.**
- The worker's gate at 92defa2 passed every check, including `build`.
- I reran it bare. Its only failures are the 21 `outside-folder` hits, all in this pull request's own folders (AlgebraicCurves, AlgebraicTopology, BordismFormalGroups, CharacteristicClasses, ComplexKahlerGeometry, …); none falls outside the listed set.
- `lake env lean` on `Suggested.lean` gives exactly four warnings, all `declaration uses 'sorry'`, at lines 81, 98, 118 and 134.

**Dependency check.** `depcheck: 239 roadmaps, 2325 edges, 0 problem(s)`. There is no UPWARD or CYCLE line. This roadmap names no roadmap supplier, so its routes use only the pins. The contradiction in R01 lives in prose about consumers, which the check does not read.

**Signatures.**
- I elaborated `#check @` for each of the four declarations. The types match `scratch/signatures.md`, and there are no section `variable`s (only `universe u`), so no binder is lost.
- Each type matches its README statement: 1.1+1.2 at README 519–621; 1.3 at 644–648; the two 2.3 headlines at 826–829.
- `[PathConnectedSpace X]` in the Layer 2 headlines is not redundant even though `IsAspherical` contains it: `LocalCoefficientSystem.ofRepresentation` takes it as an instance (`TauCeti/AlgebraicTopology/LocalCoefficient/Representation.lean`).

**Padding probe.** Each headline was replaced by `first | (simp; done) | rfl | infer_instance | exact?`. All four fail (`exact?` could not close the goal). None is padding.

**Library names.** All 186 qualified backticked names in the README compile under `#check` at the pins, with 0 errors. All 30 file paths exist at the pins, and all four relative links resolve. Declarations I opened and read:
- `TauCeti.IsAspherical`: `EilenbergMacLane/Basic.lean:59`. It is "path-connected and `π_(n+2)` subsingleton at `x`", so it includes path-connectedness.
- `TauCeti.IsEilenbergMacLaneSpaceOne`: `:123`.
- `TauCeti.exists_mapOfEq_cellularClassifyingSpace`: `S` and `Z` in one universe; hypothesis only `π_k` subsingleton at `z`.
- `TauCeti.homotopicRel_skeletonLT_one_of_forall_homotopicRel`: its hypothesis `HomotopicRel … {0, 1}` forces `f = g` on the `0`-skeleton, which is exactly why 1.2 builds `g'`.
- `TauCeti.homotopicRel_singleton_of_mapOfEq_eq_of_cwComplex`: needs `0`-skeleton `= {x₀}`.
- `TauCeti.hasHomotopyExtensionProperty_skeletonLT`: `Topology/Homotopy/Extension/CWComplex.lean:128`. The definition at `Extension/Basic.lean:97` quantifies targets in the source's universe; for closed sets this is lifted by `exists_extension_of_isClosed`.
- `ContinuousMap.IsWeakHomotopyEquivalence.exists_comp_homotopic`, `ContinuousMap.IsWeakHomotopyEquivalence.homotopyEquiv` and `TauCeti.IsAspherical.isWeakHomotopyEquivalence_iff`.
- `TauCeti.IsAspherical.exists_homotopyEquiv`: one universe; base-point change along `γ`.
- `TauCeti.killHomotopyGroupsFundamentalGroupMulEquiv` and `TauCeti.isEilenbergMacLaneSpaceOne_killHomotopyGroups`: need `T2` and path-connectedness.
- `TauCeti.exists_isEilenbergMacLaneSpaceOne_cellularClassifyingSpace`.
- `TauCeti.classifyingSpaceFundamentalGroupMulEquiv_apply_eq_iff`: `ClassifyingSpace/EilenbergMacLane.lean:77`; end point `⟨0, g⁻¹⟩`.
- `IsQuotientCoveringMap.associatedLocalSystemFiberIso_hom_coinvariantsTensorMk`: `LocalCoefficient/QuotientCovering/Exact.lean:68`, `r • ρ(fiberEquivGroup e e')⁻¹ a`, with `fiberEquivGroup e e' = g` exactly when `g • e = e'` (`QuotientCovering/Basic.lean:114`).
- `TauCeti.LocalCoefficientSystem.ofRepresentation`, `…monodromyRepresentation_ofRepresentation`, `…pullback_monodromyRepresentation`, `TauCeti.Groupoid.natIsoOfEnd` and `TauCeti.Groupoid.eq_natIsoOfEnd`.
- `TauCeti.classifyingSpaceTwistedHomologyIsoGroupHomology` and `…CohomologyIsoGroupCohomology`: signatures match headlines 3 and 4 term for term.
- `TauCeti.singularChains`: `Singular/ModuleChains/Basic.lean:59`, which is Mathlib's `singularChainComplexFunctor` at `ModuleCat.of k k`. So "by definition" at README line 252 holds.
- `TauCeti.torusSingularHomologyIsoGroupHomology` and `TauCeti.wedgeCirclesSingularHomologyIsoGroupHomology`: each is the composite of the pinned equivalence's induced map with the Milnor iso. The equivalences realise their identifications after a pinned base-point path, as Layer 1 *Examples* says.

**Layer 2 is not a restatement of the general pinned comparisons.** `IsQuotientCoveringMap.twistedHomologyIsoGroupHomology` (`Singular/Twisted/GroupHomology.lean:376`) and its siblings need a contractible free quotient cover. For an arbitrary Hausdorff CW `X`, the universal-cover instance `TauCeti.UniversalCover.isQuotientCoveringMap` (`UniversalCover/Action.lean:162`) needs `SemilocallySimplyConnectedSpace X`, and the pin does not have that for CW complexes; only specific instances exist. The Milnor-model route of Layer 2 avoids this.

**Sources (sample).**
- 1.1 and 1.2: Hatcher, Proposition 1B.9, at `hatcher-at` lines 3905–3907, printed p. 90 (file page 99), with the proof continuing to p. 91. Statement and page are correct; the hypothesis on `Y` and the proof page are R04.
- 1.3: Hatcher, Theorem 1B.8, line 3897, p. 90. The pointed form with a prescribed isomorphism is the deduction at lines 3908–3911.
- Proposition 0.16 is at line 818, p. 15. Proposition 4.22 is at line 15549, p. 357.
- Segal 1968, §3 is at `segal-1968` lines 95–126 (p. 107). It relates `BG` to Milnor's `(G * G * …)/G`.
- 2.1, 2.2 and 2.3 have no locator (R05).
- The README flags no locator as unverified.

**Adversarial pass.**

| Statement | Instances tried | Values on each side | Result |
|---|---|---|---|
| Headline 1 (1.1+1.2) | `X = pt`, `Y` any | `π₁ = 1`, `f = const y`; uniqueness: any two pointed maps from a point agree | holds |
| Headline 1 | `X = S²`, `Y = S²` (negative control, README 585–588) | identity and constant both induce `1 → 1`; degrees 1 ≠ 0 | uniqueness fails without asphericity, so the hypothesis is needed |
| Headline 1 | `Y` = Warsaw circle (aspherical, not CW, no universal cover) | all `π_n = 0`; maps from a CW complex into a weakly contractible space are null-homotopic, so uniqueness holds | holds; more general than Hatcher's `Y` (R04) |
| Headline 1 | `X` = cellular model, `x` on a 1-cell | `_hx` false (0-skeleton `= {c₀}`); the general statement is true by subdivision | narrowed (R02) |
| Headline 1 | AlgebraicTopology `Suggested.lean:655` | `exact` closes this headline | duplicate (R01) |
| 1.1 route | `e_* ∘ ℓ^δ = β_τ ∘ (e∘ℓ)_* = ι_*` and `e_* = ι_* ∘ ψ` | `ψ ∘ ℓ^δ = id`, so `β_{g∘δ} ∘ (g∘ℓ)_* = g_* ∘ ℓ^δ = φ∘ψ∘ψ⁻¹ = φ` | consistent |
| 1.1 Check 3 | `F₂`, conjugation by `λ ≠ 1` | `Z(F₂) = 1`, so `c_λ ≠ id` | holds |
| 1.2 route | `X = [0,1]`, `σ_v = id`, `f` of degree 1, `g` constant | `K_v` has degree 1; `g'∘σ_v ≃ (g∘σ_v)·K_v` has degree 1 `= deg f`; `f ≃ g rel {0}` | holds |
| Headline 2 (1.3) | `X = Y = pt` | `F = id` | holds |
| Headline 2 | point vs Warsaw circle | both `K(1,1)`; not homotopy equivalent | both CW hypotheses needed, as stated |
| Headline 2 | `S¹ → S¹`, `e = −1`, base point 1 | reflection `z ↦ z̄` fixes 1 and induces `−1` | holds |
| Headline 2 | `G = 1` | aspherical CW complex with `π₁ = 1` is contractible (Whitehead) | holds |
| π₁(BG) ≃ G direction | `S₃`, `s = (1 2)`, `t = (2 3)` | `m(ℓ_sℓ_t) = ts`; `γ ↦ m(γ)⁻¹` gives `(ts)⁻¹ = st` = product of images; `γ ↦ m(γ)` gives `ts ≠ st` | inverse forced |
| π₁(BG) ≃ G direction | `ℤ` additive | lift ends at `(0,1)` ↦ `−1` | consistent with `apply_eq_iff` (`⟨0, g⁻¹⟩`) |
| 2.3 step 2 | fibre iso at `e₀` | `a ⊗ (g•e₀) ↦ g⁻¹•a`; transport `a ⊗ e₀ ↦ a ⊗ m(γ)•e₀ ↦ m(γ)⁻¹•a = A(Ψ_BG γ)a` | monodromy `= A ∘ Ψ_BG` |
| 2.3 Check | `G = ℤ`, `A = k` via unit `u` | lift ends at `(0,−1)` ↦ `ρ(1) = u`; non-inverted reading gives `u⁻¹` | detects when `u² ≠ 1` |
| Headline 3 | `G = 1`, `X` contractible | `H₀ = A`, `Hₙ = 0` for `n > 0` on both sides | holds |
| Headline 3 | `G = ℤ`, `X = S¹`, `A = k` via `u` | `H₀ = k/(u−1)k`, `H₁ = ker(u−1)` on both sides | holds |
| Headline 3 | `X = S² ∨ S¹`, `A = ℤ` trivial (non-aspherical) | `H₂(X) = ℤ` vs `H₂(ℤ, ℤ) = 0` | asphericity needed, as the docstring says |
| Headline 3 | `G = ℤ/2`, `A` = sign | `t − 1 = −2`, `N = 0`: `H₀ = ℤ/2`, `H₁ = 0`, `H₂ = ℤ/2` vs trivial `ℤ/2, ℤ/2, 0` | Check correct |
| Headline 3 | `k` the zero ring | both sides 0 | holds |
| Headline 4 | `N = 0` | both sides 0 | holds |
| Headline 4 | infinite-rank `A` | `Hom_k(C ⊗_{kπ} A, N) ≅ Hom_{kπ}(C, Hom_k(A, N))`, no finiteness needed | holds |
| 2.1 Check | `ℤ/m` | coinvariant complex `ℤ ←0− ℤ ←m− ℤ ←0− ℤ`: `H₁ = ℤ/m`, `H₂ = 0` | correct |
| 2.2 Check | `ℤ/2`, `0 → ℤ/2 → ℤ/4 → ℤ/2 → 0` | `Hom(ℤ/2, ℤ/2) → Hom(ℤ/2, ℤ/4)`: injective, orders 2 and 2, so bijective; `δ: H¹ → H²` injective, orders 2 and 2, so an iso | correct |
| 2.3 transport Check | `k²`, swap, `u = diag(1,−1)` | `swap∘u (a,b) = (−b, a)`, `u∘swap (a,b) = (b, −a)` | intertwining fails when `2 ≠ 0` |
| Deck-action Check | pinned resolution of `⟨t | ⟩` | degree 3: free on the 3-cells attached along every 2-loop ≠ 0 | false as stated (R06) |
| Universe convention | `Rep.{w,u,v} (k : Type u) (G : Type v)` | independent universes; the constraint is in `groupHomology` | wrong reason (R03) |

**Citations resolved.**
- `[algebraic-topology roadmap]` Stage 8 items 8a/8b exist at this head (`AlgebraicTopology/README.md` lines 2508–2566); the content conflicts (R01).
- CharacteristicClasses line 790 consumes "the classifying space of ℤ/2 through AT8.8b's normalized model comparison", as README line 943–944 says. Its lines 159 and 424 describe the countable-join model accurately.
- FreeGroupsAndLimitGroups line 29 links `#stage-2-the-cellular-model`. The heading is gone, but README lines 102–133 give the old → new map for Stage 2, item 7 (`TauCeti.PresentationComplex R`), which the overlap rule accepts.
- ProfiniteCohomology and Completed/UniversalCovers exist on main.

**Overlaps (`scratch/overlaps.md`).**
- #1187 (pin bump) and #1854 conflict with this head. The description states that no open pull request merges before this one.
- #1808 is stacked after this one, as the description says.
- No id this README cites is dropped elsewhere.

**Ownership against open pull requests.** I checked the AlgebraicTopology heads available (#1854 via `roadmaps show`, #1808, #1652, #1663) and searched all roadmaps for `1B.9` and `1B.8`. Apart from AlgebraicTopology, only TeichmullerGeometry (#1169) cites 1B.9, as a consumer. #1797 has no checkout and was not checked.

## Not verifiable

- `brown-cohomology` (uncertified, paywalled): the chapter and section numbers proposed in R05's repair (II.4, III.1) are from memory of the book's structure and were not checked against the text.
- `schwamberger-vogt-2009` §2 (uncertified): the Warsaw-circle example at README lines 656–657 is cited by locator. The mathematical claim was checked independently (adversarial table).
- `milnor-1956` (uncertified): cited only as the origin of the pinned model; nothing in the roadmap depends on its content.
- #1797's AlgebraicTopology: no checkout, so not checked.

## Source issues

- none
