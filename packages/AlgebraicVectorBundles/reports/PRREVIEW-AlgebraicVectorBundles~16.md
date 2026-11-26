# Review of AlgebraicVectorBundles (pull request #3170 at 9552dbc)

**Verdict:** accepted

**Summary.** An incremental re-review of an unchanged folder: the README and `Suggested.lean` are those the previous review read, so this round reads the pull request's title and description against the head. Every sentence of the description about this folder agrees with the head: the new §4.2, the retitled Layer 4, the unchanged §4.1, the five `Suggested.lean` declarations and the updated dependency, scope and build-order lists. No finding and no small correction; one format note (the old heading anchor of Layer 4), not blocking. Nothing is left for a human to decide.

## N01 — The retitled Layer 4 heading does not keep its old anchor

"## Layer 4: linear schemes and relative Spec" (README line 580) has no `<a id="layer-4-linear-schemes-as-module-schemes"></a>` line before it, so a link to the heading as it is on main would land at the top of the file. No roadmap on main links to that anchor (searched for the anchor string), so nothing breaks; the line would be added only if outside links are a concern.

## Previous findings

The previous report (at `9552dbc`) had no finding (R) and no small correction; its format note is accounted for here.

- N01 (previous) — not repaired: README line 580 is the bare heading "## Layer 4: linear schemes and relative Spec"; written again as N01 above.

## Verified sound

### Adversarial table

The diff changes no statement; the rows are for §4.2, which the description's bullet cites, on instances not used in the earlier reviews.

| Statement | Instance | Left side | Right side | Result |
| --- | --- | --- | --- | --- |
| `isIso_unit_app_iff_isAffineHom` | `T = X ⊔ X` over `X` (fold map) | `q_* 𝒪_T = 𝒪_X × 𝒪_X`, `Spec_X(𝒪_X × 𝒪_X) = X ⊔ X`, unit the identity: iso | preimage of affine `U` is `U ⊔ U`, affine | both true |
| same | `T` = affine line with doubled origin over `Spec k` (Noetherian, so qcqs) | `Γ(T, 𝒪) = k[t]`; unit `T → 𝔸¹_k` sends both origins to `0`: not injective, not iso | `T` not separated, so not affine | both false |
| `nonempty_adjunction_relativeSpecQcqs` | `X = Spec k`, `T = ℙ¹_k`, `A = k[s]` | maps `ℙ¹_k → 𝔸¹_k` over `k`: constants, `k` | `Hom_k(k[s], Γ(ℙ¹, 𝒪)) = Hom_k(k[s], k) = k` | agree |
| Description bullet against the head | five declaration names; heading; §4.1 | names in the description | `Suggested.lean` lines 183, 190, 200, 209, 216; README line 580; no hunk of the diff against the base lies in §4.1 (lines 582–614) | agree |

The rows for the untouched statements stand as in the previous review, of `9552dbc`.

### Counts

- Changed passage: none; the folder is identical to the head the previous review read. The seeded sample (1.1–4.2) has no target in changed lines; the locators of §4.2 stand as checked earlier.
- Record: against the merge base `87e7f72` the head keeps all four layer ids and removes no item; Layer 4 is retitled, §4.1 has no changed line, §4.2 and five declarations are added (83 insertions, 10 deletions).
- Description against the head, sentence by sentence for this folder: "sixteen roadmaps" (this folder and fifteen others); pin `2fd255d` (Tau Ceti `2fd255d9…` in `lake-manifest.json`); statement, *Needs:* line with pinned names and two Checks on a necessary hypothesis (README lines 616–640); category and two functors defined from pinned carriers, adjunction stated as an existence statement (`Suggested.lean` lines 183–210); hom-equivalence from `relativeSpecHomIso`, unit an isomorphism exactly for affine `T → X` (README lines 624–631); dependency, scope and guide lists updated (diff hunks at README lines 48, 71, 92, 646, 690). The description has no summary block; the merge-order block is generated and outside this check.
- Changes outside the folders the pull request names: none (the exclusion diffstat is empty).
- Automatic checks: all pass at this head. Dependency check (verbatim): `depcheck: 94 roadmaps, 1056 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Elaboration: `lake env lean` on `TauCetiRoadmap/AlgebraicVectorBundles/Suggested.lean` gives seven `declaration uses 'sorry'` warnings (lines 101, 121, 135, 153, 171, 209, 216) and nothing else; no `set_option`, no `lemma`, no sorried data. The file did not change, so the signature comparison and the one-tactic probes of the earlier reviews stand.

Overlap check: read SchemeAndStackFoundations (main; open heads #2489 and #2531), FunctorOfPoints (#2465), LogPluricanonicalForms (#2122), AdicSpacesPartIII and NashBlowups through the overlap listing, which reports no shared id, no dropped id and no other pull request changing this roadmap; nothing shared beyond what the earlier reviews recorded (the unit `T → Spec_X(q_* 𝒪_T)` of §4.2 is owned here).

Source independence: changed passages only: the folder did not change, so 0 passages compared; largest share The Stacks Project, 33 of 34 locators; contents not compared, since the diff adds, removes and reorders no layer.

Research link: Layer 3's determinant of a short exact sequence (Stacks Tags 0FJB–0FJE; Hartshorne 1977, II, Exercise 5.16) supplies the Picard-valued determinant on K₀ used by SchemeAndStackFoundations and KTheoryLowDegrees; Layers 1–2 serve AdicSpacesPartIII. Rests on the README's overview and its consumers section.

## Not verifiable

- Hartshorne, *Algebraic Geometry*, II, Exercise 5.16: recorded as uncertified; cited only in text the change does not touch.
- The description's sentences about the fifteen other folders: each has a review of its own and they were not read here.
- Links to the old Layer 4 anchor from open pull requests' heads were not searched (main only).

## Source issues

- none

## For the human reviewers

- none
