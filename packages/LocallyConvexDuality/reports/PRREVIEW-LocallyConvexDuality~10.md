# Review of LocallyConvexDuality (pull request #1782 at 1335316)

**Verdict:** needs changes

Incremental re-review of 0 changed lines in the folder since 7bdf7f3; this round reads the pull request's title and description against the head. Both findings are about the description; neither asks for a change to a file of the folder.

## R01 (P3) — The description names two of Layer 5's four suppliers

**Location** Pull request description, first paragraph: "That last layer consumes NoncommutativeGeometry N1 and BanachSpaceTheory B4, and its statements are listed in Suggested.lean as not statable."

**Claim** The prose states the supplier set of Layer 5 as N1 and B4. At the head Layer 5 has four suppliers, and the two left out are the ones still in open pull requests and the owners of the definition of nuclear space.

**Witness** `TauCetiRoadmap/LocallyConvexDuality/README.md` lines 122–128 ("From AutomorphicSpectralTheory (§0.11) … Used in 5.2–5.4", "From SpectralManifolds (SM3) … Used in 5.2 and 5.4"), lines 600–601 and 655–656.

**Repair** Replace the sentence by: "That last layer consumes NoncommutativeGeometry N1 and BanachSpaceTheory B4 (both on main) and takes the definition of nuclear space from AutomorphicSpectralTheory §0.11 and SpectralManifolds SM3 (both still open, and merging first); its statements are listed in Suggested.lean as not statable."

## R02 (P3) — "Draft." on a pull request that is open for review

**Location** Pull request description, first line: "**Draft.**"

**Claim** The pull request is not a draft at this head, the gate passes, and the folder is settled since the review of 7bdf7f3; the line tells a reader the content is not ready for approval.

**Witness** The pull request's state at 1335316: `isDraft: false`; gate at 1335316: every check 0, `build=0`; previous review of 7bdf7f3: accepted, no finding.

**Repair** Delete the line "**Draft.**" (or, if the roadmap is not meant to be approved yet, convert the pull request to a draft and say what is still outstanding).

## Previous findings

- none: the review of 7bdf7f3 accepted with no finding (its R01 and R02 of 714da0c were recorded there as repaired; the folder is byte-identical since).

## Verified sound

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| Description: "strong duals of (DF)-spaces are Fréchet" ↔ 4.4, `DFSpace.completeSpace_strongDual`, `DFSpace.firstCountableTopology_strongDual` | `E = ℝ^(ℕ)` (finest locally convex topology); `E` normed; `E = 0`; `ℝ` indiscrete (no `T2Space`, which the metrizability statement does not assume) | `ℝ^(ℕ)`: `Bₙ = n·(ℓ¹-ball of ℝⁿ)`, `Bₙ° = {y : max_{k<n} \|y_k\| ≤ 1/n}`, a countable basis at `0` of the product topology of `ℝ^ℕ`, complete. Normed: `Bₙ° = n⁻¹·`dual ball, dual Banach. `0`: dual `0`. Indiscrete `ℝ`: all sets bounded, `Bₙ = univ`, only neighbourhood `univ`, so (DF); dual `{0}`, first countable. | true; description agrees with README 4.4 (complete and metrizable, `E` separated locally convex for completeness) | none |
| Description: "strong duals of Fréchet spaces are (DF)" ↔ 4.2, `dfSpace_strongDual` | `E = ℝ^ℕ`; `E = 𝕜` | `ℝ^ℕ`: basis `Uₙ = {\|x_k\| ≤ 1/n, k < n}`, `Uₙ° = n·(ℓ¹-ball of ℝⁿ) ⊂ ℝ^(ℕ)`, an increasing sequence exhausting the bounded sets of `ℝ^(ℕ)`. `𝕜`: dual `𝕜`, normed, (DF). The Lean hypothesis is metrizable, wider than the description's Fréchet; the description's clause is the special case. | true | none |
| Description: "metrizable ⇒ bornological; bornological ⇔ bounded linear maps are continuous" ↔ 1.2, 1.3 | Mackey 1946 Theorems 8 and 10; Bourbaki 1950 §4 | mackey1946 lines 355–360 (printed p. 527): Theorem 8, bounded maps continuous ⇔ relatively strong with boundedly closed system; lines 374–376: Theorem 10; bourbaki1950 line 269 (marker page 8 = p. 11): every metrizable space is bornological, citing p. 527. | locators correct | none |
| Description: Layer 5 suppliers (R01) | README supplier contracts and `*Needs:*` of 5.1–5.4 | head: 4 suppliers (N1 lines 112–116, B4 118–120, AutomorphicSpectralTheory §0.11 122–124, SpectralManifolds SM3 126–128); description prose: 2 | description incomplete | R01 |

The rows for the untouched statements stand as in the previous review, of 7bdf7f3.

- Folder change since 7bdf7f3: `git diff --stat 7bdf7f3 HEAD -- TauCetiRoadmap/LocallyConvexDuality` is empty. `git diff --stat origin/main...HEAD` outside the folder is empty, so "The roadmap touches only `TauCetiRoadmap/LocallyConvexDuality/`" holds.
- Gate: the worker's gate at 1335316 passed every check. My rerun with `--base origin/main` gives 0 on every check except `depcheck: NOT IN ORDER: LocallyConvexDuality (insert it after its last supplier)`, which is the configured order not listing the roadmap yet and is not a finding.
- Dependency check with the candidate order: `depcheck: 247 roadmaps, 2238 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line (AutomorphicSpectralTheory line 98, SpectralManifolds 236, LocallyConvexDuality 237).
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with thirteen `declaration uses 'sorry'` warnings (lines 73, 100, 108, 118, 152, 160, 167, 183, 193, 220, 228, 236, 243) and nothing else, so "gives only `sorry` warnings" holds; 13 theorems and 7 definitions, the 20 declarations the change lists.
- Cross-roadmap citations resolved again, 4 of 4: NoncommutativeGeometry N1.Tensor on main (README lines 16, 27), BanachSpaceTheory B4 on main (line 239), AutomorphicSpectralTheory §0.11 and §0.13 at its open head (lines 286, 328), SpectralManifolds SM3 at its open head (line 27). The generated depends-on block names the same two open suppliers.
- Source locators checked against the text this round: 3 (mackey1946 lines 355–360 and 374–376, bourbaki1950 line 269). The description's remaining mathematical clauses (barrels, complete bornological ⇒ barrelled, Mackey–Arens for an arbitrary pairing, Grothendieck's completeness theorem, strong duals of bornological spaces, 5.1–5.4 not statable) agree with the README summary (lines 3–20) and the `Suggested.lean` docstring (lines 19–45).
- Overlap check: read SmoothBanachRepresentations, BanachSpaceTheory, Hyperfunctions; nothing shared (the overlap report lists no pull request changing this roadmap, no dropped or revision-only id, no second copy; Hyperfunctions keeps HF2.AnalyticPreparation.FunctionalDuality, README lines 43–46).
- Source independence: changed passages only: the folder has no changed passage; the description's 2 prose paragraphs compared with 2 sources (bourbaki1950 lines 231–302, mackey1946 lines 354–376), none shared; largest share bourbaki1950, 19 of 47 locators; contents not compared again (no layer added, removed or reordered).

## Not verifiable

- **Grothendieck 1954**, Part I (4.1–4.5): the cached `grothendieck1954` text is a journal landing page, no article text; cited by locator, as the description says.
- **Dierolf–Roelcke 1981, Kalton 1970, Pietsch 1972, Wengenroth 2003, Grothendieck 1950, Köthe 1969, Floret 1980**: as in the previous reviews.

## Source issues

- none

## For the human reviewers

- **Not tested.** Layer 4 rests on Grothendieck 1954 alone (5 locators, all "Part I", no page); its text was not read by any review (`grothendieck1954` is a landing page). The description asks for a functional analyst's review of this layer.
