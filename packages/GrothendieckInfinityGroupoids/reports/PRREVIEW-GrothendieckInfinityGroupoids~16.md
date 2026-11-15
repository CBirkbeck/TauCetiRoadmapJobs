# Review of GrothendieckInfinityGroupoids (pull request #1060 at c3bae70)

**Verdict:** accepted

No finding. Incremental re-review: the folder has 0 changed lines since a9a3ef1; the head merges main, and the pull request's description was rewritten.

## Previous findings

- R01 — repaired: the description now reads "weak homotopy equivalences are StableHomotopyKTheory §2.1's `IsWeakHomotopyEquivalence`, the one roadmap this roadmap consumes … The README's table of downstream consumers records the one export, `Globe`"; agrees with `README.md:144–148`, `:53–55`, `:591–597`.
- R02 — repaired: the description now reads "`Suggested.lean` states three headline theorems, each with `sorry` … the seven lemmas those definitions use … are proved"; `sorry` only at `Suggested.lean:278, 461, 496`, proofs at 153, 166, 181, 187, 204, 306, 315.
- R03 — repaired: the description now reads "is not a target, and no item states it or depends on it. A « Research context » section, which has no targets, records work on it: Henry's reduction …"; agrees with `README.md:601–643`.
- R04 — repaired: the description now reads "cites it as a source, not as the roadmap's specification, and notes that its Apache 2.0 licence permits adaptation with attribution and the licence notice"; agrees with `README.md:673–675`.

No repair introduced a new problem: the four replaced passages were read sentence by sentence against the head.

## Verified sound

| Statement | Instances | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| `piPresheaf_isWeakEquivalence_iff` (description: "Corollaries 8.9–8.11 in `TopCat`") | `∅ → *`; `* → S¹` | first: `π₀` map 0 → 1, `weTop` false; `Π` side has no 0-cell over the point, false. second: `π₁` map 1 → ℤ, false; winding-1 loop not `CellJoined` to a constant, false | iff holds on both | none |
| `PseudoCoherator.isWeakEquivalence_iff` (description: "Theorem 4.18 (1) ⇔ (2)") | `𝟙_X`; `Π(∅) → Π(*)` | first: both sides true. second: `BijectiveOnComponents` fails on both sides (no 0-cell maps to the point), both false | iff holds on both | none |
| `weTop` vs StableHomotopyKTheory §2.1 (description: "the one roadmap this roadmap consumes") | supplier on main | `IsWeakHomotopyEquivalence` at main `StableHomotopyKTheory/Suggested.lean:74`, `README.md:536`; ours `Suggested.lean:474–478`, same body on `f.hom` | supplier resolves on main | none |

The rows for the untouched statements stand as in the previous review, of `a9a3ef1`.

- Folder: `git diff a9a3ef1 HEAD` on the folder is empty. `git diff --stat origin/main...HEAD` outside the folder is empty, so the outside files in the change list are main's.
- Description: the title equals the README's H1. Every sentence of the prose was read against the head. It names the addition of a new roadmap, the one supplier, the three stated headlines and the headlines not stated (`Suggested.lean:30–34`); no sentence is contradicted.
- Cross-roadmap citations resolved, 3: StableHomotopyKTheory §2.1 on main; GeneralizedCohomology on main; HomotopyTheoryOfCategories at its open head (Layer 7 at `README.md:893`, Layer 8 at 996, 8.6 at 1090–1094, ownership row 63).
- Gate: the worker's gate at c3bae70 passes every check, including the build. My plain rerun passes every scanner; its only failing line is `depcheck: NOT IN ORDER: GrothendieckInfinityGroupoids (insert it after its last supplier)`, the not-yet-placed case. The candidate-order check prints `depcheck: 245 roadmaps, 2230 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0, with only `declaration uses sorry` at 276, 456 and 493.
- Overlap check: read HomotopyTheoryOfCategories (open head), the only roadmap on the three lists. Shared: `Globe` and globular sets, owned here (0.1) and cited by HomotopyTheoryOfCategories (`README.md:63`, 8.6). Direct, inverse and Reedy categories are owned by HomotopyTheoryOfCategories Layers 7–8 and left to it here (`README.md:53`).
- Source independence: changed passages only. The folder has none, so no README passage was compared with a source, and no layer was added, removed or reordered. Largest share: ara2013, 70 of about 107 author–year citations (count of the previous review).
- Remark (no change asked): the generated `depends-on` block lists StableHomotopyKTheory as a supplier still open; the roadmap is on main, where §2.1 was resolved.

## Not verifiable

- The published numbering of Ara 2013 (J. Pure Appl. Algebra 217, no. 7) was not compared with arXiv v2, the version the earlier rounds read. The description's locators agree with the README's.
- github.com/openai/math (the preprint, `lean/docs/312.md`, `lean/OAI/CategoryTheory/Globular/`) was not fetched. The description's account of it was checked against the README only.

## Source issues

- none

## For the human reviewers

- Licence: `README.md:634–676` describes and cites the Apache-2.0 Lean development github.com/openai/math `lean/OAI/CategoryTheory/Globular/` (`Table n`, `GlobularTheory`, `IsCoherator`). It was not fetched, so `Suggested.lean`'s declarations were not compared with it.
- Scope: the Research context section (`README.md:599–676`) rests partly on unrefereed preprints (OpenAI, 24 September 2026; Henry arXiv:1609.04622 and arXiv:1807.02627). `README.md:601` says nothing there is a target. The headline source, Ara 2013 (J. Pure Appl. Algebra), is refereed.
