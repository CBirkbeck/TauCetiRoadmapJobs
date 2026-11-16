# FIX-PKG-DimerModelsAndLozengeTilings~3

Repair of the four findings of `REV-PKG-DimerModelsAndLozengeTilings~2` (all P3). Files changed:
`packages/DimerModelsAndLozengeTilings/README.md` and `packages/DimerModelsAndLozengeTilings/sources.toml`.
`Suggested.lean`, `metadata.toml` and `design/plan.json` are unchanged.

## F01 (P3) — applied

Layer 7 `### Dependencies`: "Layers 1, 2, 5, 6." → "Layers 1, 2, 4 (the weak topology of 4.4, for
7.3), 5, 6; Mathlib `ProbabilityTheory.uniformOn` and the compactness of `ProbabilityMeasure`."
Verified: the *Needs:* lines of Layer 7 are 7.1 {1.5, 2.5}, 7.2 {7.1, Mathlib `ProbabilityTheory.uniformOn`},
7.3 {4.4, 5.3, 5.4, 6.1, 7.2, Mathlib compactness of `ProbabilityMeasure`}; their union is Layers 1,
2, 4, 5, 6. Both Mathlib items exist at the pin (`Mathlib/Probability/UniformOn.lean` line 60,
`def uniformOn`; `Mathlib/MeasureTheory/Measure/Prokhorov.lean` line 176,
`instance [CompactSpace E] : CompactSpace (ProbabilityMeasure E)`).

Pattern: every other layer's dependency line was compared with the union of its *Needs:* lines.
Layer 3 (1.4, 1.5, 2.8 → Layers 1–2), 5 (Layer 4 plus 1.5, 2.10 for 5.4), 6 (1.6, 2.5, 4.3, 5.x →
1, 2, 4, 5), 8 (7.1 → Layer 7), 9 (4.4, 6.2, 6.3, 7.3, 8.4, 8.5 → contained in "Layers 4–8"), 10
(2.4, 2.7, 4.4, 5.2, 5.4, 9.7 → 2, 4, 5, 9) all list every layer they need. Layer 7 was the only
omission.

## F02 (P3) — applied

README 7.3: "gorin2021 Section 3.3" → "gorin2021 Section 13.4, lines 4689–4694, for the weighted
torus computation of its Theorem 4.11 read as a local limit". Verified: gorin2021 Section 3.3 runs
from line 1353 to line 1511 (Lecture 4 starts at line 1512); it sets up torus tilings and proves the
four-determinant count (Theorem 3.10, line 1458), with no limit and no Gibbs property. Section 13.4
(heading at line 4689) says at lines 4690–4694 that the local limit of a domain with a given slope
identifies the measure, and that the torus computation of Lecture 4 (Theorem 4.11, line 1853) is
such a local limit. That supports the weighted half of 7.3; the uniform half keeps kenyon2009 lines
844–866 and kos2006 Theorem 2.1. The reviewer's wording was made more precise: it now names the
section and the theorem.

Pattern: "Section 3.3" now occurs once, in 7.1 ("gorin2021 Section 3.3, lines 1353–1392"), for the
definition of torus tilings and their height changes, which those lines contain. The
`torusLimit_mem_gibbsInvariant_slope` docstring in `Suggested.lean` does not cite gorin2021 and needs
no change. The gorin2021 `cited_for` record in `sources.toml` now covers 7.1 and 7.3 (see F04).

## F03 (P3) — applied

README 5.4, first Check: "(a plane tiling has an edge in every face, so both cylinders are empty
unless `F = ∅`, when `ω = ω'`)" → "(for `F ≠ ∅` the window `E` contains the three edges of a face,
on which a plane tiling has an edge, so neither cylinder contains the empty configuration and both
have mass `0`; for `F = ∅`, `ω = ω'`)". Verified: the cylinder `{η | ∀ e ∈ E, η e = ω e}` contains
`ω`, so it is never empty. The new wording also gives the step the old text skipped: `E` contains a
whole face.

Pattern: the README was searched for "cylinder(s) is/are empty", "empty cylinder" and "empty
configuration". The two uses of "the empty cylinder" (7.3 and 10.1) mean the cylinder over the
empty window, which is the whole space, so the claim that the limit has mass one is correct as
written. The 10.1 Check about the point mass at the empty configuration is a separate statement and
is correct. No other occurrence.

## F04 (P3) — applied

README References, georgii2011: "for 4.2 and 4.6" → "for 4.2, 4.6 and 5.4". Verified: the README
cites georgii2011 Theorem 14.15 in 4.2, 4.6 and 5.4 (and in the `Suggested.lean` docstrings of
`gibbsInvariant_isExtreme` and `lozengeGibbsInvariant_isExtreme`). `sources.toml` already lists
"4.2, 4.6, 5.4".

Pattern: the same kind of gap (a bibliographic record that leaves out a section citing the work)
was found in the `cited_for` record of gorin2021 in `sources.toml`. Sections 1.1, 1.6, 4.6, 7.1, 7.3,
10.1 and 10.2 cite gorin2021 but were not listed. The record now reads "1.1-1.5 …", adds "1.6
extreme slopes, for the row tilings", "4.4, 4.6, 5.2-5.4 …", "7.1, 7.3 torus tilings and their
height changes; the weighted torus computation read as a local limit (Section 13.4)" and "10.1-10.2
local limits of uniform tilings of growing regions". The README References line for gorin2021
lists locators, not sections, and already covers Lecture 13 (lines 4491–4786). No other work's
record is incomplete: georgii2011 is now complete, and thurston1990 is cited only in 2.9.

## Adversarial pass (changed text only)

| Statement | Instances tried | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Layer 7 dependency line | union of the *Needs:* lines of 7.1, 7.2, 7.3 | 7.1: {1.5, 2.5} → L1, L2; 7.2: {7.1} → L7, plus `uniformOn`; 7.3: {4.4, 5.3, 5.4, 6.1} → L4, L5, L6, plus compactness | new line = {1, 2, 4, 5, 6} + Mathlib: agree | F01 |
| Other layers' dependency lines | Layers 3, 5, 6, 8, 9, 10 | unions {1,2}, {1,2,4} (5.4), {1,2,4,5}, {7}, {4,6,7,8} ⊆ "4–8", {2,4,5,9} | each line contains its union | none |
| 7.3 locator | gorin2021 Section 3.3 against Section 13.4 | 3.3 = lines 1353–1511, Theorem 3.10 at 1458, no limit; 13.4 heading at 4689, torus-as-local-limit at 4692–4694, Theorem 4.11 at 1853 | new locator supports the weighted half of 7.3 | F02 |
| 5.4 Check, `F ≠ ∅` | `ω = ω' = M₃`, `F = {(0,3)}`, `E` = the five edges of `W(0)` and `B(0)` | `M₃ ∈ [M₃]_E` (not empty); the empty configuration fails `η(0,3) = true`; `δ_∅[M₃]_E = 0 = δ_∅[M₃]_E` | the identity holds, the cylinders are not empty | F03 |
| 5.4 Check, why `E` contains a face | Lean `TriFace.edges` | `⟨v,0⟩, ⟨v,2⟩ ∈ W(v)`, `⟨v,1⟩ ∈ W(v−(1,0))`: every edge lies in a face; the hypothesis puts all three edges of that face in `E`; a plane tiling has exactly one true edge among them | the empty configuration fails one coordinate | F03 |
| 5.4 Check, `F = ∅` | `∀ e ∉ ∅, ω e = ω' e` | `ω = ω'` by function extensionality; both sides give the same cylinder | trivially equal | F03 |
| 5.4 Check, concentration clause | `δ_∅` | `δ_∅{ω non-tiling} = 1 ≠ 0` | excluded by the second clause, as the Check says | none |
| georgii2011 bibliography line | README citing sections; `sources.toml` | README: 4.2 (4.2 text), 4.6 (4.6 text), 5.4 (5.4 text); `sources.toml`: "4.2, 4.6, 5.4" | agree | F04 |
| gorin2021 `cited_for` | README sections citing gorin2021 | 1.1, 1.2, 1.4–1.6, 2.1–2.2, 2.5–2.9, 3.1–3.3, 4.4, 4.6, 5.1–5.4, 6.1–6.3, 7.1, 7.3, 8.1–8.5, 9.1–9.3, 9.5, 9.7, 10.1–10.2 against the new record | every section covered | `sources.toml` |

## Checks

- **Elaboration.** `lake env lean packages/DimerModelsAndLozengeTilings/Suggested.lean`, run from the
  content repository: exit 0. 17 warnings, each `declaration uses sorry`, at lines 115, 168, 184,
  198, 234, 245, 331, 343, 375, 387, 409, 422, 453, 490, 503, 523, 553. No other message. The file is
  unchanged in this round. Its only `TauCeti.*` import, `TauCeti.MeasureTheory.Group.ErgodicExtreme`,
  was already built.
- **Signatures.** I put `#check @name` for every named declaration (57) in one scratch copy of the
  file and elaborated it once. All 57 elaborated. The only errors came from four malformed `#check`
  lines that my extraction script produced for two anonymous `instance` declarations (they have no
  name to check). The elaborated types agree with `scratch/signatures.md`, for example
  `torusLimit_mem_gibbsInvariant_slope` keeps `0 ≤ s`, `0 ≤ t`, `s + t ≤ 1`, `StrictMono φ` and the
  cylinder-convergence hypothesis. No binder was lost and no statement changed.
- **Dependency check** (`gate --depcheck … --movable`):

      depcheck: 246 roadmaps, 2241 edges, 0 problem(s)

  No UPWARD, CYCLE or `moved:` line.
- **README / Lean agreement.** No Lean name was added, removed or renamed. The README edits add only
  the Mathlib names `ProbabilityTheory.uniformOn` and `ProbabilityMeasure`, which are pinned library
  declarations and not names of this roadmap.

## Gate failures

None were listed for this round.

## For the maintainer

- No name that other roadmaps could cite changed. No section, layer or target was renumbered, and
  no supplier, `*Needs:*` line or gap changed (`design/plan.json` keeps `"gaps": []`).
- Ownership: this round adds no construction, so no ownership question arises. The audit of
  round 2 (over the roadmaps on main and the open heads) still applies.
- Sources: no new source was fetched. Every new locator is in the cached gorin2021 text, and
  `needs-references.toml` was not written.
- I found no instruction-like text in the review. Its "For the human reviewers" section was read
  as data and nothing was changed because of it.
