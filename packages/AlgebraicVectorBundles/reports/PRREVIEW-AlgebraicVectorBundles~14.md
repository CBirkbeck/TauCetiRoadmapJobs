# Review of AlgebraicVectorBundles (pull request #3170 at 0c3be17)

**Verdict:** accepted

**Summary.** An incremental re-review of the two lines changed since `4aaba98` (the line that kept the old Layer 4 anchor, and the blank line after it, are deleted), together with the pull request's title and description read against this head. No statement changed and no finding remains: accepted, with one small correction (the description's bullet for this folder still omits the five `Suggested.lean` declarations, the second theorem and the retitled layer) and one format note (the old heading anchor is gone), neither blocking. Nothing is left for a human to decide.

## C01 — The description's bullet for this folder names no `Suggested.lean` declaration, omits the affineness criterion, and does not say that Layer 4 is retitled

The general paragraph now says correctly that "AlgebraicVectorBundles §4.2 [defines] its category and two functors, and each states its equivalence or adjunction as an existence statement". The folder's own bullet, however, still reads "AlgebraicVectorBundles, new §4.2: relative Spec as a right adjoint on quasi-compact quasi-separated schemes over `X`, with hom-equivalence from `relativeSpecHomIso`." Every other bullet whose folder gains declarations lists them; this one lists none, although the head adds five (`TauCetiRoadmap/AlgebraicVectorBundles/Suggested.lean` lines 183–218). It also leaves out the second stated theorem, that the unit at `T` is an isomorphism exactly when `T → X` is affine, and the fact that the heading of Layer 4 changes from "linear schemes as module schemes" to "linear schemes and relative Spec" (README line 580), which is a change to a roadmap already on main.

Text that would be right: "AlgebraicVectorBundles, new §4.2 (Layer 4 retitled 'linear schemes and relative Spec'; §4.1 is unchanged): relative Spec as a right adjoint on quasi-compact quasi-separated schemes over `X`, with hom-equivalence from `relativeSpecHomIso`, and the unit an isomorphism exactly for affine morphisms. `Suggested.lean`: `QcqsOver`, `qcqsFunctions`, `relativeSpecQcqs`, `nonempty_adjunction_relativeSpecQcqs`, `isIso_unit_app_iff_isAffineHom`."

## N01 — The retitled Layer 4 heading no longer keeps its old anchor

The line `<a id="layer-4-linear-schemes-as-module-schemes"></a>` before "## Layer 4: linear schemes and relative Spec" (README line 580) is deleted at this head, so a link to the heading as it is on main would land at the top of the file. No roadmap on main or at an open head links to that anchor (searched for the anchor string; the only link to this README, in HilbertModularVarietiesAndShimuraCurves line 2540, has no fragment), so nothing breaks; the line would be restored only if outside links are a concern.

## Previous findings

The previous report (at `4aaba98`) had no finding (R); its one small correction is accounted for here.

- C01 (previous) — partly repaired: the description now says "AlgebraicVectorBundles §4.2 its category and two functors, and each states its equivalence or adjunction as an existence statement"; the folder's bullet is unchanged. Written again as C01 above.

## Verified sound

### Adversarial table

The diff changes no statement; the rows are for §4.2, the first statement under the heading the change touches, on instances not used in the previous review.

| Statement | Instance | Left side | Right side | Result |
| --- | --- | --- | --- | --- |
| `isIso_unit_app_iff_isAffineHom` | `T = X`, `q = id` | `q_* 𝒪_T = 𝒪_X`, `Spec_X 𝒪_X = X`, unit the identity: iso | `id` is affine | both true |
| same | `T` the affine line over `k` with doubled origin, over `Spec k` (quasi-compact, quasi-separated, not separated) | `Γ(T, 𝒪) = k[t]`; unit `T → 𝔸¹_k` identifies the two origins: not iso | `q` not separated, so not affine | both false |
| `nonempty_adjunction_relativeSpecQcqs` | `X = Spec k`, `T` the doubled-origin line, `A = k[s]` | maps `T → 𝔸¹_k` over `k`: glue two maps `𝔸¹ → 𝔸¹` agreeing off `0`, i.e. one polynomial; `k[t]` | `Hom_k(k[s], Γ(T, 𝒪)) = Hom_k(k[s], k[t]) = k[t]` | agree |
| Layer 4 heading against its content | §4.1 (weight grading, recognition) and §4.2 (adjunction) | heading "linear schemes and relative Spec" | `Suggested.lean` line 179 section comment, same words | agree; id and subject of Layer 4 kept |

The rows for the untouched statements stand as in the previous review, of `4aaba98`.

### Counts

- Changed passage: the two deleted lines only; README and `Suggested.lean` are otherwise byte-identical to `4aaba98` in this folder. The seeded sample (1.1–4.2) has no target in the changed lines; the six Stacks locators of §4.2 and the sampled instances stand as checked at `4aaba98`.
- Record: the head keeps all four layer ids of the merge base `87e7f72` and removes no item; Layer 4 is retitled, §4.1 unchanged.
- Cross-roadmap citations: the change adds and removes none. The removed anchor is linked from no roadmap on main or at an open head.
- Library pin: Tau Ceti `2fd255d9` in `lake-manifest.json`, as the description states.
- Automatic checks: all pass at this head. Dependency check (verbatim): `depcheck: 101 roadmaps, 1133 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Elaboration: `lake env lean` on `TauCetiRoadmap/AlgebraicVectorBundles/Suggested.lean` gives seven `declaration uses 'sorry'` warnings (lines 101, 121, 135, 153, 171, 209, 216) and nothing else; no `set_option`, no sorried data. The file did not change, so the signature comparison and the one-tactic probes of the previous review stand.
- Description against the head: title ("sixteen roadmaps": this folder and fifteen others, counted); the general paragraph's sentences about this folder hold (statement, *Needs:* line with pinned names, two Checks on necessary hypotheses, category and two functors defined from pinned carriers, adjunction as an existence statement, only `sorry` warnings). The description has no summary block. Changes outside the folders the pull request names: none (the exclusion diffstat is empty).

Overlap check: read SchemeAndStackFoundations (main; open heads #2489 and #2531), FunctorOfPoints (#2465), LogPluricanonicalForms (#2122), AdicSpacesPartIII and NashBlowups through the overlap listing, which reports no shared id, no dropped id and no other pull request changing this roadmap; nothing shared beyond what the previous review recorded (the unit `T → Spec_X(q_* 𝒪_T)` of §4.2 is owned here; SchemeAndStackFoundations is later and any citation is its to add).

Source independence: changed passages only: the diff adds no prose (two lines deleted), so 0 passages compared; largest share The Stacks Project, 33 of 34 locators; contents not compared, since the diff adds, removes and reorders no layer.

Research link: Layer 3's determinant of a short exact sequence (Stacks Tags 0FJB–0FJE; Hartshorne 1977, II, Exercise 5.16) supplies the Picard-valued determinant on K₀ used by SchemeAndStackFoundations and KTheoryLowDegrees; Layers 1–2 serve AdicSpacesPartIII. Rests on the README's overview and its consumers section.

## Not verifiable

- Hartshorne, *Algebraic Geometry*, II, Exercise 5.16: recorded as uncertified; cited only in text the change does not touch.
- The open heads of SchemeAndStackFoundations, FunctorOfPoints and LogPluricanonicalForms were read through the roadmap search tools, not from full checkouts.

## Source issues

- none

## For the human reviewers

- none
