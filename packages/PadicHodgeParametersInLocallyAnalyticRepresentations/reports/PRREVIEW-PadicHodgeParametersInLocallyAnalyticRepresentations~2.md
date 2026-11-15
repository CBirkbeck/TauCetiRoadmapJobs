# Review of PadicHodgeParametersInLocallyAnalyticRepresentations (pull request #2257 at c1ff167)

**Verdict:** accepted

Incremental re-review: the folder is unchanged since the previous review of `c1ff167` (0 lines); this round reads the pull request's title and description against that head. No finding.

## Previous findings

- R01 — repaired: the description now says "The principal supplier is LocallyAnalyticRepresentationsOfLocalGroups (§§0.9, 1.5, 1.7–1.9, 4.1, 6.1–6.2, 7.1–7.3, 8.1–8.14, 9.1–9.7, 10.1–10.7). It is a prerequisite, so this pull request merges after it."
- R02 — repaired: the description now says "`Suggested.lean` declares nothing, because no headline theorem can be stated at the pins" and "the targeted Lake build of `Suggested.lean` succeeds with no warning".

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Description: kernel dimension, "Remark 3.22(1)" (README §1.5) | n=1..4; n=3, d_K=2; general n | c_n=0,0,1,5; dim 𝔈 − dim Q = (3+7·2) − (3+6·2) = 2 = c_3·2; (n+(2^n−1)d) − (n+n(n+1)d/2) = c_n·d; DING25 line 2224 | holds; locator correct | none |
| Description: "Ding's comparison theorem (DING25 Theorem 3.21)" and the other seven locators | each number against the source | DING25 lines 2084, 2223, 2258, 2280, 2348, 2368, 2411, 2490, 2602, 2619: Thm 3.21, Rem 3.22, Cor 3.25, Prop 3.26, Prop 3.27, Rem 3.28, Cor 3.31, Thm 3.34, Thm 3.36, Cor 3.37 | all ten agree | none |
| Description: "eight groups of headline theorems" | docstring bullets of `Suggested.lean` | 8 bullets (lines 16–52); each names its missing carriers | agrees | none |
| Description: supplier section list of LocallyAnalyticRepresentationsOfLocalGroups | every id of the list at that roadmap's open head | 0.9, 1.5, 1.7–1.9, 4.1, 6.1–6.2, 7.1–7.3, 8.1–8.14, 9.1–9.7, 10.1–10.7 all present; §8.12 gives n+(2^n−1)d, §8.14 gives n, n+d, n(1+d), §9.7 gives b↦(b,−b) | agrees with README contract | none |
| Description: "Layer 5 needs three things from SmoothRepresentationsOfLocalGroups §SR.3.2 … stated over complex coefficients" | SR.3.2 on main; README gap paragraph | main `TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md:2710–2713` ("complex coefficients"), line 181 (SR.3 over ℂ); the three items equal the gap's `needs` | agrees | none |

The rows for the roadmap's own statements stand as in the previous review, of `c1ff167`.

- Title and description read against the head: the summary block (K finite over ℚ_p, E containing all conjugates, p = 2 allowed, D not necessarily étale, Emerton's closed induction, `TrivSqZeroExt`, Yoneda Ext) agrees with `README.md:3–21`, `87–109`, `180–190`; "adds the roadmap folder (README, `Suggested.lean`, `metadata.toml`)" agrees with the diffstat (3 files, 1586 insertions, nothing outside the folder); the six direct suppliers are the six `From TauCetiRoadmap.*` headings; LieHighestWeight is on main (`TauCetiRoadmap/RepresentationTheory/LieHighestWeight`) and, with PadicLocalLanglandsForGL2Qp §0.1, is cited only through LocallyAnalyticRepresentationsOfLocalGroups (`README.md:48–50`, `72–77`).
- Source locators checked this round: 10 in DING25 (the lines above); all correct.
- Cross-roadmap citations resolved this round: 39 section ids of LocallyAnalyticRepresentationsOfLocalGroups at its open head (now a pull request, no longer only a board package), SR.3.2 on main, LieHighestWeight Layers 3, 5, 7, 9 as headings and Layer 4 as a table row on main.
- Declared gap `principal-series-bernstein-completion`: same slug in the plan and at `README.md:324`; supplier named; the supplier's own request `ordered-character-map` covers 𝒥_w and the reordering identity, so this gap asks only for the completion and the isomorphism, as the README says.
- Gate: every check passed (re-run at this head). Dependency check output: `depcheck: 238 roadmaps, 2254 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the roadmap folder.
- Elaboration of `Suggested.lean`: exit 0, no output; the file has no declaration, so the one-tactic probe and the `#check` comparison have nothing to test.
- Overlap check: read TriangulineVarietyAndItsLocalModel, LocallyAnalyticRepresentationsOfLocalGroups, CompletedCohomologyAndLocalGlobalCompatibility; nothing shared (the first two are suppliers cited by section; the second states that the comparison with Galois deformations belongs to this roadmap); a search of main and the open heads for π_min found no other owner.
- Source independence: changed passages only; the folder has 0 changed lines, so no passage was compared this round; largest share DING25, 21 of 22 page-bearing locators as in the previous review; arrangement not compared again (no layer added, removed or reordered).
- Remark (untouched text, no change requested): `README.md:226` cites the value of closed induction on deformed characters as LocallyAnalyticRepresentationsOfLocalGroups "§7.3 (iv)"; at that roadmap's open head it is §7.2 (iv), and §7.3 (balanced maps) has no item (iv).

## Not verifiable

- Two entries of the README's Source corrections (the sign in the proof of Corollary 2.14, p. 19; the index sets of (3.12), (3.15), (3.33)) lie outside the sample and were not compared with the text.
- The description's account of earlier review rounds ("4 independent review rounds and 2 red-team rounds") is not a statement about the head and was not checked.

## Source issues

- none

## For the human reviewers

- Scope: every target is located in one article, DING25 (Publications Mathématiques de l'IHÉS 142, 2025, refereed, open access on Centre Mersenne); the only other reference is CEGGPS16, for the supplier contract (`README.md:1517–1524`).
- Layer 5 depends on the declared gap `principal-series-bernstein-completion` in SmoothRepresentationsOfLocalGroups §SR.3.2, which on main treats complex coefficients only (`README.md:324–335`).
- Merge readiness: five of the six direct suppliers are still open pull requests, among them the principal one, LocallyAnalyticRepresentationsOfLocalGroups, of which this roadmap cites 39 sections (`README.md:198–248`).
