# Review of ArithmeticStatisticsPartI (pull request #1171 at 95df277)

**Verdict:** accepted

No findings. This is an incremental re-review of 0 changed lines since 95df277; this round read the pull request's title and description against the head. Acceptance means the folder is ready for a human's final approval; it approves and merges nothing.

## Previous findings

- none: the previous report (of 95df277) listed no finding. Its note on the generated blocks is met: the **Depends on** and **Merge order** blocks no longer name #1930 QuadraticFormsOverABase, #1222, #1504, #1691 or #1707.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Description: "binary quartic invariants with 27Δ=4I³−J²" (`README.md` Conventions; `Suggested.lean:55–58`) | `x⁴ − y⁴`, `(a,b,c,d,e) = (1,0,0,0,−1)` | `I = 12·1·(−1) = −12`, `J = 0`; `4I³ − J² = 4·(−1728) = −6912`; `27Δ = 27·(−256) = −6912` | agrees, sign fixed as the README says | none |
| Description: "relative densities that multiply in towers" (§0.1) | `α = 1/3`, `β = 1/2`; `S = T = U = ∅` | `αβ = 1/6`; empty case: `0 = 0·0` under `0/0 = 0` | agrees with the §0.1 Checks | none |
| Description: densities "survive piecewise rescaling" (§0.1, piecewise rescaling of a height) | `κ = 1`, six classes of squarefree m mod 8, `a_j` equal, `c ∈ {1,4}` | weights `Σc⁻¹`: m ≡ 1, 3 (mod 4): `1 + 1/4 = 5/4`; m ≡ 2: `1/4 + 1/4 = 1/2`. Classes 1,2,3: `3`; classes 5,6,7: `3`; ratio `3/6 = 1/2` | agrees with the §0.1 Check; `k ≥ 1` keeps the denominator positive | none |

The rows for every other statement stand as in the previous review, of `95df277`.

- **Pull request text against the head (step 8).** Title equals the README title. Each sentence of the summary block and the prose was matched to the head: real-valued `Northcott` heights and counts of classes (`README.md:178–180`); stabilizer-weighted count (:378); tower and piecewise-rescaling targets (:306, :362); `BinaryQuartic.isEligible_iff` (:804, `Suggested.lean:74`); characteristic three and no assumption on 2 or 3 (:74, :650); Mathlib's `Cubic` (:70–78); `TauCeti.summatory` (:40, :180); conjectures as propositions (:34); Tate's theorem and the full Dieudonné-order route over every `𝔽_q` with [63] (:2543–2549); consumers Parts II–VIII and AbelianVarietiesOverFiniteFields (:2607). No sentence is contradicted.
- **Changes a reader must know of.** The pull request adds the roadmap (0 headings and 0 declarations removed, nothing renumbered); the description presents the folder as a whole (README, `Suggested.lean`, `metadata.toml`) and names no revision, which is what the head shows. Suppliers: all 15 roadmap names the README cites outside the task list (EllipticCurves, SchemeAndStackFoundations, ReductiveGroupsPartII, ClassicalArithmeticCompletion, …) are folders on main at 8ad4192; the 10 open suppliers are exactly the unchecked items of the task list. "Roadmaps on main are cited by name; everything else … is a consumer" holds.
- **Validation sentence.** Rerun of the gate at this head: every check 0, `OK` (including `set_option=0`, `readme-ids-missing=0`, `round-labels=0`, `empty-sections=0`, `depcheck=0`, `outside-folder=0`); the worker's gate also reports `build=0`. `lake env lean` on `Suggested.lean`: exit 0, 13 `declaration uses sorry` warnings, nothing else.
- **Dependency check output:** `depcheck: 247 roadmaps, 2249 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- **Folder and outside files.** Head is 95df2775bd95d1053b6dd938bace55574c340831, worktree clean; the folder diff since the previous review is empty; `git diff --stat origin/main...HEAD` outside the folder is empty. No statement, signature, locator or supplier citation changed, so the signature comparison, padding probes and headline audit stand as in the previous review; no seeded-sample target falls in a changed passage, and the README flags no locator as unverified.
- **Citations.** `citations.md`: 0 cross-roadmap citations unresolved; its 15 Lean-name leads are declarations of this roadmap's own `Suggested.lean` (lines 55–285), not missing names. `overlaps.md`: no other pull request changes this roadmap, no dropped or revision-only id.
- **Ownership.** `roadmaps grep --lean-only` for `binaryDisc`, `BinaryQuartic`, `squareclassHeight`, `UnpolarizedClasses`, `monicEulerProduct`, `formIdeal`, `oddSupport`: hits only in this roadmap's file. ArithmeticStatisticsPartII's scope names Part I Layer 0 as owner of families, coefficients, invariant heights and local proportions (and §0.4, §0.12, §0.22); ArithmeticStatisticsPartV's scope names Part I §0.6 as owner of the squarefree residue counts; AnalyticNumberTheoryPartI (:3456) and PartII (:3159) list the ArithmeticStatistics parts as consumers only.

Overlap check: read ArithmeticStatisticsPartII, ArithmeticStatisticsPartV, ArithmeticStatisticsPartIII, ClassicalArithmeticCompletion, AnalyticNumberTheoryPartI, AnalyticNumberTheoryPartII; nothing shared (arithmetic families, invariant heights, squarefree residue counts: owner ArithmeticStatisticsPartI, cited as such by Parts II and V; binary-cubic carriers: owner AnalyticNumberTheoryPartII §5.4, cited here).

Source independence: changed passages only; 0 passages compared with 0 sources (the folder did not change and the description quotes no source); largest share and contents comparison stand as in the earlier full review; no layer added, removed or reordered.

## Not verifiable

- Carried from the previous reports, unchanged: Tate 1966 [75] (paywalled, uncertified); published Annals pagination of EVW; Bhargava [9] Introduction p.1332; Wood [72] §2.1 p.3; published Duke pagination for Wood [65] and BKLOS [3].
- The description's sentence on AI assistance ("GPT-6 (Codex) for the port …, with author-side red-team passes to follow") describes the authoring process; the head neither supports nor contradicts it.
- The generated **Depends on** and **Merge order** blocks are outside this check beyond the comparison of the task list with the README's suppliers above.

## Source issues

- none

## For the human reviewers

- none
