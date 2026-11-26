# Review of FreeGroupsAndLimitGroups (pull request #3170 at 9552dbc)

**Verdict:** accepted

**Summary.** An incremental re-review of the 150 lines changed since `f17d28c`, with the pull request's title and description read against this head. The repairs are correct: the target of §5.12 (4) is now stated on Tau Ceti's carriers, the Tau Ceti supplier contracts list what the README consumes, no definition has a `sorry` proof field, the two free-basis statements are bijectivity of the canonical maps, and the description's bullet for this folder says what the head does. Accepted, with no findings, two small corrections (the new Tau Ceti bullet under-reports what the pin proves of §§1.4–1.8, and a comment in `Suggested.lean` points at README text the change removed) and two format notes, none blocking. One licence question about a source host is left for the human reviewers.

## C01 — The new scope bullet says the maximal-root and malnormality targets "remain here" beside three cited Tau Ceti theorems, but the pinned Tau Ceti proves those targets as well

A reader of the bullet (README line 26, repeated in the contracts at line 134) concludes that the library has commutation transitivity, the trivial centre and cyclic centralizers, and lacks the rest of §§1.4–1.8. At the pin `2fd255d` it has all of it, for every `[IsFreeGroup G]`: `IsFreeGroup.commute_iff_exists_common_zpow` (`TauCeti/GroupTheory/FreeGroup/Commuting.lean:58`, the statement of §1.5), `IsFreeGroup.exists_maximalRoot` and `IsFreeGroup.centralizer_singleton_eq_zpowers` (`MaximalRoot.lean:102` and `:65`, §§1.4 and 1.6), `IsFreeGroup.isTISubgroup_zpowers`, `IsFreeGroup.maximal_isMulCommutative_zpowers` and `IsFreeGroup.isCSA` (`CSA.lean:94`, `:111`, `:160`, §1.8). I checked this against the file's own statements: on a scratch copy, `commute_iff_exists_zpow` closes with `exact IsFreeGroup.commute_iff_exists_common_zpow x y`, `zpowers_malnormal` with `exact IsFreeGroup.isTISubgroup_zpowers hu'` (its hypothesis `hu` is then unused), and `centralizer_eq_zpowers` in two lines from `exists_maximalRoot` and `centralizer_singleton_eq_zpowers`.

The items of §§1.4–1.8 are this roadmap's record and stay as they are. The smallest repair is in the bullet: name these declarations too and drop the sentence "The maximal-root identification and malnormality targets remain here", or say that they remain as the record of what the library proves. The author could also add an `*In Tau Ceti:*` line to each of §§1.4–1.8, and take the restatements with `sorry` (`exists_maximalRoot`, `commute_iff_exists_zpow`, `centralizer_eq_zpowers`, `zpowers_malnormal`, `isCSA_freeGroup`, lines 86–115) out of `Suggested.lean`, which asks an implementer for nothing there.

## C02 — A comment in `Suggested.lean` still sends the reader to a list of "shared Mathlib interface names" in the README's scope section, which this change removed

The comment before `commute_iff_exists_zpow` (lines 94–97) reads "Shared Mathlib interface names (README, Scope and ownership)" and lists `FreeGroup.centralizer_of_eq_closure`, `FreeGroup.isCyclic_centralizer`, `FreeGroup.commute_of_commute`, `FreeGroup.center_eq_top_of_subsingleton` and `FreeGroup.center_eq_bot_of_nontrivial`. The README no longer has that paragraph: its bullet now cites Tau Ceti's `IsFreeGroup.commute_of_commute` and `IsFreeGroup.isCyclic_centralizer`, and two of the five names (`centralizer_of_eq_closure`, `center_eq_top_of_subsingleton`) appear nowhere in the README or at the pins. Replace the comment by the Tau Ceti names of C01, or delete it.

## N01 — In the route and the *Needs:* line of §5.12 (4) (README lines 1361 and 1374), `homOfMapsToWordMap_eq_iff`, `homOfMapsToWordMap_mk` and `gHom_ext` are still written without their namespace

The supplier contracts (line 135) now give the full names, so the reader can resolve them; `gHom_ext` exists in more than one namespace of `TauCeti.GroupAlgGeom`, and the full name `TauCeti.GroupAlgGeom.CoordGroup.gHom_ext` in the *Needs:* line would remove the ambiguity where it is used.

## N02 — The heading `### From Tau Ceti (commit a91d3aa)` (README line 127) now stands over a bullet that says "at the pinned commit `2fd255d`"

The pin is `2fd255d`; the heading would name it, or no commit.

## Previous findings

The previous report (of `f17d28c`) had no findings. Its small corrections and format notes, for the record:

- C01 (target on local copies of the carriers) — repaired: `coordGroup_iso_iff_wordMap_iso` is stated with `TauCeti.GroupAlgGeom.GX`, `CoordGroup`, `CoordGroup.coeff`, `wordMap` and `V`, with `import TauCeti.GroupTheory.GroupAlgGeom.AlgebraicSet`.
- C02 (Tau Ceti contracts missing the four declarations) — repaired: README line 135 names the four with their files and states that no injectivity or nonemptiness is assumed.
- C03 (description: data listed as not statable) — repaired: the module docstring now lists the category of algebraic sets and the functor `Γ` of §5.12 (4) as data and README targets.
- N01 (names without namespace) — partly repaired: full names in the contracts; the route and *Needs:* line unchanged (N01 above).
- N02 (heading names another commit) — not repaired (N02 above).

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| `coordGroup_iso_iff_wordMap_iso` on Tau Ceti carriers | Elaborated type; both systems inconsistent (`S = {g}`, `T = {g}`, `ι g ≠ 1`) | All five carriers resolve to `TauCeti.GroupAlgGeom.*`, none to the file's local copies. Both `V = ∅`, both `Γ = 1`: true ↔ true | holds | none |
| same, one side empty | `S` inconsistent, `V(T) ≠ ∅` | `Γ(S) = 1`, `Γ(T) ≠ 1` under `G`; no map from nonempty `V(T)` to `∅`: false ↔ false | holds | none |
| same, `S = T = {[x,a]}` over `F(a,b)` | `w = x a`, `w' = x a⁻¹` | `V = ⟨a⟩`; composites `a^k ↦ a^k`; `x ↦ x a` an `F`-automorphism of `Γ`: true ↔ true | holds | none |
| `graphPresentation_free` as bijectivity | Rose with `n` petals, `T = ∅`, `O = {(i, true)}`; one vertex, no edge; segment with `T` = everything | `F(Fin n × Bool)/⟨e·rev e⟩` free on the `n` positive darts: lift bijective. Empty generating set, trivial group both sides | holds | none |
| `graphPresentation_abelianization` as bijectivity | Rose `n = 2`; two vertices with two parallel edges | `ℤ²` on two positive loops ↔ abelianised `F₂`; `ℤ` on the one non-tree positive dart | holds | none |
| `PolygonalComplex.vertexLink`, the added second condition | Corner `(f, i)` with ends `(rev w[i−1], w[i])` | `src(rev w[i−1]) = tgt w[i−1] = src w[i]` by `face_closed` (cyclically at `i = 0`): the two conditions are equivalent, so the dart type is unchanged as a set | holds | none |
| `SurfaceModel.boundary`, proof of `rev` from `boundary_incidence` | `linkDegree e` for a dart `e` | occurrences of `e` plus occurrences of `rev e` in face words, symmetric in `e ↔ rev e`; 1 or 2 by the link condition. The cited target is true | holds | none |
| `roseTree`, `polygon`: filled proof fields | no edges on one vertex; any word on one vertex | only the empty path, so a tree; every list is a closed path at vertex 0 | holds | none |
| Four `nonempty_` renames | statements compared with `f17d28c` | identical statements, names prefixed; README §§6.0b–6.0c use the new names | holds | none |
| Scope bullet: three `Centralizer.lean` names | `#check` at the pin | `[Nontrivial α]` centre `= ⊥`; `y ≠ 1 → Commute x y → Commute y z → Commute x z`; `x ≠ 1 → IsCyclic (centralizer {x})`, for `[IsFreeGroup G]`: as the README says | holds | C01 |
| One-tactic probe of the three changed theorems | `first \| simp \| rfl \| infer_instance \| aesop` | goals remain for all three | not padding | none |
| §1.5, §1.6, §1.8 statements against the pin | `exact` with one Tau Ceti lemma | `commute_iff_exists_zpow` and `zpowers_malnormal` close in one step, `centralizer_eq_zpowers` in two | proved at the pin | C01 |

The rows of the previous review for untouched statements stand as in that review, of `f17d28c`.

- Changed lines read: 55 inserted, 95 deleted, in `README.md` (scope bullet, two contract bullets, §§6.0a–6.0c) and `Suggested.lean`; no layer or heading added, removed or retitled against the merge base.
- Library declarations opened at the Tau Ceti pin `2fd255d`: `FreeGroup/Centralizer.lean:55, 65, 105, 125, 132`; `Commuting.lean:58`; `MaximalRoot.lean:65, 78, 102`; `CSA.lean:94, 111, 160`; `ProperPower.lean:31`; `GroupTheory/CSA.lean:41`; the four `CoordGroup` names and `CoordGroup.coeff` under `#check`.
- Source locators read: IFT lines 214–235 (§2.4, pp. 5–6). Seeded sample: of the sampled targets only §1.6 is touched by the change (the scope bullet says the pin overlaps it); its statement was checked against `MaximalRoot.lean:65` and proved from it on a scratch copy. The changed passages add no source locator.
- Cross-roadmap citations: the change adds none. No id dropped or cited from an open revision.
- Elaboration: exit 0, 73 warnings, each "declaration uses `sorry`", no error; no definition has a `sorry` field. Dependency check: `depcheck: 94 roadmaps, 1058 edges, 0 problem(s)`, no UPWARD or CYCLE line.
- Pull request text: the FreeGroupsAndLimitGroups bullet matches the head item by item (the criterion of §5.12, filled proof fields, the vertex link, five example definitions dropped and kept in README prose, two bijectivity statements, four `nonempty_` names, the Tau Ceti citation replacing the proposed Mathlib interface); the nine removed and five added declarations are all accounted for.
- Order: the two earlier revisions of this roadmap conflict with this head in both files; the description fixes the order, this pull request last.
- Nothing is changed outside the pull request's own folders.

Overlap check: read SurfaceTopology, AutomorphismsOfFreeGroups and FinitenessAndDualityOfGroups (open), and SequentCalculusAndCutElimination, GraphConnectivityAndFlows and RandomGraphs (main); nothing shared. AutomorphismsOfFreeGroups leaves primitive elements, Stallings graphs, conjugacy and centralizers in free groups to this roadmap. The two open revisions of this roadmap were not available as files in this round.

Source independence: changed passages only. 6 passages (the scope bullet, the two contract bullets, the §6.0a sentence on the three polygons, the module docstring bullet, the docstring of `coordGroup_iso_iff_wordMap_iso`) compared with 1 source (IFT §2.4, lines 214–235), none shared; ALG not read. Largest share IFT, 59 bracketed citations, unchanged by the diff; no layer added, removed or reordered, so the arrangement was not compared.

Research link: §5.12 is the Baumslag–Myasnikov–Remeslennikov correspondence between algebraic sets and coordinate groups (ALG, 1999), which underlies the README's results on coordinate groups of irreducible algebraic sets as limit groups (Layer 8) and Kharlampovich–Myasnikov's implicit function theorem (IFT, §2.4; Layer 11). Rests on the README summary and references and on IFT lines 214–235.

## Not verifiable

- ALG (Baumslag–Myasnikov–Remeslennikov 1999), §3.5, Theorem 4 and Corollary 9, cited for §5.12 (2): not among the texts recorded for this roadmap. No other copy was sought. The changed passages cite no ALG locator.

## Source issues

- none

## For the human reviewers

- Licence: ALG, VAR-II, SUBGROUPS and MRS-REGULAR (README references) are cited from copies at web.stevens.edu/algebraic/alexeim/…, described as authors' copies. An earlier review reported the sources service refusing that host; this review did not retry it.
