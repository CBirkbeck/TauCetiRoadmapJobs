# Review of LocallyConvexDuality (pull request #1782 at 4d1052c)

**Verdict:** accepted

Incremental re-review of 0 changed lines in the folder since 1335316 (the head merges main; the description was edited). No finding.

## Previous findings

- R01 — repaired: the description now reads "consumes NoncommutativeGeometry N1 and BanachSpaceTheory B4 (both on main) and takes the definition of nuclear space from AutomorphicSpectralTheory §0.11 and SpectralManifolds SM3 (both still open, and merging first)".
- R02 — repaired: the description no longer opens with "**Draft.**"; its first line is "A roadmap for the duality theory of locally convex spaces over ℝ and ℂ".

## Verified sound

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| Description: Layer 5 suppliers ↔ README supplier contracts and `*Needs:*` of 5.1–5.4 | the four suppliers, each at main (276e711) or its open head | Description: 4 (N1, B4 on main; §0.11, SM3 open). Head: 4 (README lines 112–128, 582, 600–602, 638, 655–656). N1 and B4 folders on main; AutomorphicSpectralTheory and SpectralManifolds absent from main, open. | agree | none |
| 5.2 nuclear space, as taken from AutomorphicSpectralTheory §0.11 and SpectralManifolds SM3 | `𝕜ⁿ`; `ℓ²`; `E = 0` | `𝕜ⁿ`: every `Ê_q → Ê_p` has rank ≤ n, a sum of ≤ n rank-one terms, nuclear. `ℓ²`: every `q ≥ p` is equivalent to the norm, `Ê_q → Ê_p` an isomorphism of `ℓ²`, not compact, not nuclear. `0`: zero map. | matches the Checks of 5.2 and §0.11's definition (strengthened seminorm quotient maps) | none |
| 5.1 Check `π ≠ ε` on `ℓ² ⊗ ℓ²` | `u = Σᵢ₌₁ⁿ eᵢ ⊗ eᵢ`, n = 1, 2, n | `ε`-norm = operator norm of the rank-n projection = 1; `π`-norm = trace norm = n. n = 1: 1 = 1; n = 2: 2 ≠ 1; ratio unbounded. | true | none |

The rows for the untouched statements stand as in the previous review, of 1335316.

- Folder change since 1335316: `git diff --stat 1335316 HEAD -- TauCetiRoadmap/LocallyConvexDuality` is empty. `git diff --stat origin/main...HEAD` outside the folder is empty: the files `changes.md` lists outside the folder (ArithmeticDirichletSeriesPartII, PerfectoidTowers, ProbabilisticAndMetricNumberTheory) come from the merge of main, so "The roadmap touches only `TauCetiRoadmap/LocallyConvexDuality/`" holds. None of the three READMEs mentions barrels, bornological spaces, the Mackey topology, (DF)-spaces or nuclear spaces (0 matches each).
- Description against the head: adds a roadmap (996 insertions, 41 headings, 20 declarations, none removed); its mathematical clauses agree with the README summary and the `Suggested.lean` docstring as recorded in the previous review; the generated depends-on block names the same two open suppliers as the prose.
- Gate: the worker's gate at 4d1052c passed every check (`build=0`). My rerun with `--base origin/main` gives 0 on every check except `depcheck: NOT IN ORDER: LocallyConvexDuality (insert it after its last supplier)`: the configured order does not list the roadmap yet, which is not a finding.
- Dependency check with the candidate order: `depcheck: 245 roadmaps, 2234 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line (AutomorphicSpectralTheory line 98, SpectralManifolds 236, LocallyConvexDuality 237).
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with thirteen `declaration uses 'sorry'` warnings (lines 73, 100, 108, 118, 152, 160, 167, 183, 193, 220, 228, 236, 243) and nothing else.
- Cross-roadmap citations resolved again, 4 of 4: NoncommutativeGeometry N1.Tensor on main (README lines 16, 27); BanachSpaceTheory B4 on main (line 239; the open revision of BanachSpaceTheory keeps the id `B4` in its Layer 4 heading); AutomorphicSpectralTheory §0.11 and §0.13 at its open head (lines 286, 328); SpectralManifolds SM3 at its open head (lines 82, 92: closed subspaces and finite sums).
- Overlap check: read SmoothBanachRepresentations, BanachSpaceTheory, Hyperfunctions; nothing shared (the overlap report lists no pull request changing this roadmap, no dropped or revision-only id, no second copy).
- Source independence: changed passages only: the folder has no changed passage; the description's edited sentence names suppliers and has no source counterpart, 0 passages to compare; largest share bourbaki1950, 19 of 47 locators; contents not compared again (no layer added, removed or reordered).

## Not verifiable

- **Grothendieck 1954**, Part I (4.1–4.5): the cached `grothendieck1954` text is a journal landing page (165 lines, no article text); cited by locator, as the description says.
- **Dierolf–Roelcke 1981, Kalton 1970, Pietsch 1972, Wengenroth 2003, Grothendieck 1950, Köthe 1969, Floret 1980**: as in the previous reviews.

## Source issues

- none

## For the human reviewers

- **Not tested.** Layer 4 rests on Grothendieck 1954 alone (5 locators, all "Part I", no page); its text was not read by any review (`grothendieck1954` is a landing page). The description asks for a functional analyst's review of this layer.
