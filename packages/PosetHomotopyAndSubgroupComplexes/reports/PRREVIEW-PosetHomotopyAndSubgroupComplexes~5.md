# Review of PosetHomotopyAndSubgroupComplexes (pull request #2296 at 2961439)

**Verdict:** needs changes

## R01 (P3) — The description says Quillen's conjecture appears only in Research context

**Location:** pull request description, after the Layer 4 list: "Quillen's conjecture appears only in Research context."

**Claim:** The head contradicts the sentence: §4.6 names the conjecture in its statement's locator and in a Check.

**Witness:** `TauCetiRoadmap/PosetHomotopyAndSubgroupComplexes/README.md:864–865` "(Quillen 1978, Corollary 12.2, for the case of solvable groups of Conjecture 2.9)"; `:875–877` "as Conjecture 2.9 predicts … the statement without it is the open conjecture".

**Repair:** Replace the sentence in the description by: "Quillen's conjecture is not a target. §4.6 names it (Quillen 1978, Conjecture 2.9) as the statement whose solvable case Corollary 12.2 proves, and Research context records its status." No change to the folder.

## Previous findings

- none: the review of `3e08670` listed no finding (its six bullets were repairs of an earlier round, all recorded as repaired); the folder is unchanged since (0 lines).

## Verified sound

| Statement | Instances tried | Computed first side | Computed second side | Result | Change |
| --- | --- | --- | --- | --- | --- |
| §4.6 `exists_normal_of_contractibleSpace` (R01 touches it) | `𝔖₃`, p = 2; `𝔖₄`, p = 3 and 2; `𝔄₅`, p = 2 | `A_p`: 3 points; 4 points; contains normal `V₄`, conical; 15 + 5 subgroups in 5 components | Normal `p`-subgroup: none; none; `V₄`; none (`𝔄₅` not solvable) | Non-contractible whenever solvable and `O_p = 1`; `𝔄₅` outside the hypothesis | none |
| §4.7 `eulerChar_pSubgroupPoset_modEq` (cited by the description) | `𝔖₄`, p = 2; `𝔄₅`, p = 2; `𝔖₃`, p = 2; trivial group | `𝔖₄`: 19 vertices (9 + 7 + 3), 39 edges (15 + 15 + 9), 21 triangles, χ = 1; `𝔄₅`: 20 − 15 = 5; 3; 0 | Moduli 8; 4; 2; 1 | 1 ≡ 1 mod 8; 5 ≡ 1 mod 4 and 5 ≢ 1 mod 8; 3 ≡ 1 mod 2; 0 ≡ 1 mod 1 | none |
| §4.5 `not_connectedSpace_iff` (cited by the description) | `𝔖₃`, p = 2; `𝔖₄`, p = 2 | Components: 3; 1 | `M = C₂`: conjugates meet in 1; every proper `M ⊇ D₈` is `D₈`, and `D₈ ∩ gD₈g⁻¹ ⊇ V₄` | Disconnected ⇔ strongly 2-embedded subgroup, both instances | none |

Rows for the other statements stand as in the previous review, of `3e08670`.

- Change since `3e08670`: 0 lines in the folder; `git diff origin/main...HEAD` outside the folder is empty at this head (the files listed as changed outside are main's, brought in by the merge).
- Gate: every check 0 (worker's run at `2961439`), including the targeted build. Elaboration: `lake env lean` on `Suggested.lean` gives exactly 20 `declaration uses sorry` warnings and nothing else.
- Dependency check output: `depcheck: 245 roadmaps, 2231 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Cross-roadmap citations resolved again, 5 of 5: StableHomotopyKTheory §2.31 `quillenTheoremA` (main, `TauCetiRoadmap/StableHomotopyKTheory/README.md:915–917`); HomotopyTheoryOfCategories 2.1 and 2.4 (open head `a61ddd4`, README lines 446–448 and 500–502: `IsBasicLocalizer`, `IsAsphericalFunctor`, `Winfty`, `mem_of_isAsphericalFunctor`); OddOrderTheorem §1.1 and §1.4 (open head `f65b2b3`, README lines 316–329 and 478–489: `O_p`, `m_p`, `m_p(H) ≤ m_p(G)`).
- Description against the head, sentence by sentence: new-folder status, the four layer summaries, the ownership and consumption lists, the Tau Ceti supplier list, both suppliers still open and StableHomotopyKTheory on main, the 3.4 (b) not-statable note, the source locators (Quillen, Brown, McCord, Barmak, Stong, Minian–Piterman) and the two Research-context paragraphs all agree with the README and the docstring; R01 is the one sentence that does not. No heading, declaration or supplier was removed, so no mapping is owed.
- Overlaps: no other open pull request changes this folder, no cited id is dropped, no second copy on main. Main was searched for beat points, McCord's theorems, the fibre lemma, Brown–Quillen and strongly `p`-embedded subgroups: no owner (the four hits are unrelated uses).
- Sources: no locator was added or changed, so none was re-read this round; the previous review's checks stand.

Overlap check: read StratifiedSpacesAndTameTopology, HomotopyTheoryOfCategories, FinitenessAndDualityOfGroups, KanQuillen and PlanarTopology (no roadmap on main is listed); nothing shared. FinitenessAndDualityOfGroups §8 owns divisibility of `χ` of a simplicial set with a finite group action (Brown 1974) and leaves the subgroup posets out of its scope, naming this roadmap; §3.5 and §4.7 here are the congruence to 1 of Brown 1975 on finite posets, a different statement on a different carrier. Localizer Theorem A stays with HomotopyTheoryOfCategories, `p`-core and `p`-rank with OddOrderTheorem.

Source independence: changed passages only; the diff changes no passage, so 0 passages were compared with 0 sources this round; largest share remains `quillen1978`, 13 of 39 locators as counted at `e1b39b5`, its text and contents unread; no layer was added, removed or reordered, so the earlier arrangement check stands.

## Not verifiable

- `quillen1978`, Propositions 2.4 and 5.2, Corollary 12.2, Conjecture 2.9: the DOI resolves only to a paywalled publisher page; the numbering was corroborated in the previous review through `piterman2021`, not against Quillen's text.
- The description's "Checks run" paragraph (an older local Mathlib with stubbed Tau Ceti declarations): the author's environment cannot be reproduced; at the pins the file elaborates as stated above.

## Source issues

- none

## For the human reviewers

- **Not tested.** `quillen1978` has the largest share of locators (13 of 39); its text and table of contents remain unavailable, so wording and arrangement were not compared with it.
- **Licence.** `mccord1966` and `barmak2011` were read, in earlier reviews, on a third party's University of Edinburgh page rather than an author or publisher page; redistribution permission remains unverified.
- **Licence.** `diaz_ramos2023` (arXiv:2303.15613) is an unpublished preprint; `TauCetiRoadmap/PosetHomotopyAndSubgroupComplexes/README.md:940` labels it as such and no target rests on it.
