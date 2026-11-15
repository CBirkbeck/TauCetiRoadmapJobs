# Review of PosetHomotopyAndSubgroupComplexes (pull request #2296 at c665200)

**Verdict:** accepted

## Previous findings

- R01 — repaired: the description now reads "Quillen's conjecture is not a target. §4.6 names it (Quillen 1978, Conjecture 2.9) as the statement whose solvable case Corollary 12.2 proves, and Research context records its status."

## Verified sound

| Statement | Instances tried | Computed first side | Computed second side | Result | Change |
| --- | --- | --- | --- | --- | --- |
| §4.6 `exists_normal_of_contractibleSpace` (cited by the repaired sentence) | trivial group and `C₃`, p = 2; `Q₈`, p = 2; `𝔄₄`, p = 3; `D₁₀`, p = 2 | `A_p`: empty, realization `∅`, not contractible; one point `⟨−1⟩`, contractible; four Sylow `C₃`, discrete; five reflection subgroups, discrete | Nontrivial normal `p`-subgroup: none; `Z(Q₈)`; none (normal subgroups `1`, `V₄`, `𝔄₄`); none (trivial centre, five Sylow 2-subgroups) | Implication holds in all five; empty case vacuous since `ContractibleSpace ∅` fails | none |
| Conjecture 2.9 as README:931–932 and the description state it (not a target) | `Q₈`, p = 2; `𝔄₄`, p = 2; `𝔄₅`, p = 3 | `S_p`: `⟨−1⟩`, three `C₄`, `Q₈` (maximum, cone); three `C₂`, `V₄` (maximum, cone); ten Sylow `C₃`, discrete | Normal `p`-subgroup: `Q₈`; `V₄`; none (`𝔄₅` simple) | Contractible exactly where a normal `p`-subgroup exists; `𝔄₅` is non-solvable, outside 4.6 | none |

Rows for the other statements stand as in the previous review, of `2961439`.

- Change since `2961439`: 0 lines in the folder; `git diff --stat origin/main...HEAD` outside the folder is empty (the four files listed as changed outside are main's, brought in by the merge of `1a19c9f`).
- Gate: the worker's run at `c665200` gives 0 on every check, the targeted build included. Re-run here: every scanner 0; the gate's depcheck reports only `NOT IN ORDER: PosetHomotopyAndSubgroupComplexes` against the public order file (awaiting insertion after its last supplier, not a finding).
- Dependency check against the candidate order: `depcheck: 245 roadmaps, 2233 edges, 0 problem(s)`; no UPWARD or CYCLE line (OddOrderTheorem at line 408, this roadmap at 409).
- Elaboration: `lake env lean` on `Suggested.lean` gives exactly 20 `declaration uses 'sorry'` warnings (the 20 theorems) and nothing else; the 6 definitions have real bodies.
- Cross-roadmap citations resolved again, 5 of 5: StableHomotopyKTheory §2.31 `quillenTheoremA` (main, README:915–917); HomotopyTheoryOfCategories 2.1, 2.4 (head `a61ddd4`, lines 446–449, 500–502); OddOrderTheorem §1.1, §1.4 (head `f65b2b3`, lines 316–332, 478–492).
- Library declarations opened, 3: Mathlib `ContractibleSpace` (`Mathlib/Topology/Homotopy/Contractible.lean:52`, requires `Nonempty (X ≃ₕ Unit)`), `Geometry.SimplicialComplex.space` (`Mathlib/Analysis/Convex/SimplicialComplex/Basic.lean:77`); Tau Ceti `AbstractSimplicialComplex.Realization` (`TauCeti/AlgebraicTopology/SimplicialComplex/Realization/Basic.lean:71`).
- Description against the head, sentence by sentence: the repaired sentence agrees with README:864–865, 875–877 and 931–941; both open suppliers are still open and StableHomotopyKTheory is on main; no heading, declaration or supplier changed. Remark: its Quillen list omits Propositions 1.9 and 2.6, which README:100 cites only for the out-of-scope join formula; no change asked.
- Overlaps: no other open pull request changes this folder, no cited id is dropped, no second copy on main. Main and the open heads were searched for beat points, McCord, the fibre lemma, strongly `p`-embedded subgroups, Brown–Quillen, homological Sylow and subgroup complexes: every hit is unrelated (CohomologyOfGroups' "homological Sylow" concerns stable classes in `Hₙ(P, M)`).

Overlap check: read StratifiedSpacesAndTameTopology (`96086c5`), HomotopyTheoryOfCategories (`a61ddd4`), FinitenessAndDualityOfGroups (`b7910ae`), KanQuillen and PlanarTopology (no roadmap on main is listed); nothing shared. FinitenessAndDualityOfGroups leaves Brown's refinements through the poset of finite subgroups out of its scope and names this roadmap among its consumers; localizer Theorem A stays with HomotopyTheoryOfCategories, `p`-core and `p`-rank with OddOrderTheorem.

Source independence: changed passages only; the diff changes no passage of the folder, so 0 passages were compared with 0 sources this round; largest share remains `quillen1978`, 13 of 39 locators as counted at `e1b39b5`, its text and contents unread; no layer was added, removed or reordered, so the earlier arrangement check stands.

## Not verifiable

- `quillen1978`, Propositions 2.4 and 5.2, Corollary 12.2, Conjecture 2.9: the DOI resolves only to a paywalled publisher page; the numbering was corroborated through `piterman2021`, not against Quillen's text.
- The description's "Checks run" paragraph (an older local Mathlib with stubbed Tau Ceti declarations): the author's environment cannot be reproduced; at the pins the file elaborates as stated above.

## Source issues

- none

## For the human reviewers

- **Not tested.** `quillen1978` has the largest share of locators (13 of 39); its text and table of contents remain unavailable, so wording and arrangement were not compared with it.
- **Licence.** `mccord1966` and `barmak2011` were read, in earlier reviews, on a third party's University of Edinburgh page rather than an author or publisher page; redistribution permission remains unverified.
- **Licence.** `diaz_ramos2023` (arXiv:2303.15613) is an unpublished preprint; `TauCetiRoadmap/PosetHomotopyAndSubgroupComplexes/README.md:940` labels it as such and no target rests on it.
