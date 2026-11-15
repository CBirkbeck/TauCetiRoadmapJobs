# Review of InverseGaloisAndArithmeticFundamentalGroups (pull request #850 at 9432671)

**Verdict:** needs changes

## R01 (P3) — Consumer pointer names a supplier-only block

**Location:** PR description, dependencies paragraph (scratch/pull-request.md:26): “consumers of this roadmap are listed in the merge-order block, not here.”
**Claim:** The description directs readers to a consumer list that the named block does not contain.
**Witness:** The `merge-order` block (scratch/pull-request.md:41) lists 17 predecessors and ends at #850; it lists zero successors. Consumers appear in TauCetiRoadmap/InverseGaloisAndArithmeticFundamentalGroups/README.md:7531 instead.
**Repair:** Replace the quoted clause with “downstream consumers are listed in the README’s ‘Downstream consumers’ section.”

## R02 (P3) — State that the PR adds a new roadmap

**Location:** PR description, folder paragraph (scratch/pull-request.md:24): “Roadmap folder `TauCetiRoadmap/InverseGaloisAndArithmeticFundamentalGroups`”.
**Claim:** Neither the title nor the description says whether this adds a roadmap or revises one on main.
**Witness:** The base-to-head diff adds three files and 8,077 lines; the folder is absent on origin/main. There are no removed headings or declarations (scratch/pull-request.md:50).
**Repair:** Replace the folder sentence with “This PR adds the new roadmap `TauCetiRoadmap/InverseGaloisAndArithmeticFundamentalGroups`, with seven layers IG.0–IG.6, a README, `Suggested.lean` and `metadata.toml`.” Keep the following explanation of the Lean file.

## Previous findings

- R01 — repaired: the earlier supplier-gloss repair remains at README:991–995: §§2.11 and 2.16 supply the cohomological comparison; §§5.6 and 5.9 supply intersection theory. The immediately preceding report accepted this head with no open findings.

## Verified sound

| Statement | Instance | First side computed | Second side computed | Result | Change |
| --- | --- | --- | --- | --- | --- |
| Description’s consumer pointer (R01) | Listed merge-order chain | 17 predecessors; 0 successors | README names downstream consumers at 7533–7539 | Pointer fails | Point to README |
| Description’s change classification (R02) | Base-to-head folder diff | Base: 0 files in folder | Head: 3 files; +8,077/−0 lines | Addition omitted | Say “adds the new roadmap” |
| IG.6.4 regular realization specializes; cited by summary | `G=C₂`, `Y²−T`, specialize at `T=2` | `ℚ(T)(√T)`: degree 2, group order 2, constants ℚ | `ℚ(√2)`: degree 2, group order 2; polynomial discriminant 8≠0 | Agrees on this instance | None |

Untouched mathematical rows stand as in the previous review of `9432671`.

- Incremental scope: 0 changed folder lines; 0 outside-folder changes; title, prose and `roadmap-summary` compared with the 3-file addition and head.
- Sources: 0 newly changed mathematical passages or locators; the 15 seeded targets retain the previous review’s evidence and verification limits.
- Supplier repair: 4 sections reopened on main in TauCetiRoadmap/SchemeAndStackFoundations/README.md:4707, 4941, 8310, 8519; the cited content remains present.
- Signature and padding audits: previous evidence for 36 declarations and no padding retained; no signature changed.
- Gate with the supplied moved order and targeted build: all counters 0, `build=0 OK`, exit 0; the worker’s recorded gate also passes.
- Direct `lake env lean` elaboration: exit 0; 18 warnings, all `declaration uses sorry`; 0 errors.
- Dependency output: `depcheck: 245 roadmaps, 2223 edges, 0 problem(s)`.

The default-order gate reported `UPWARD` edges to ArithmeticGaloisDuality, ArithmeticGaloisRepresentations and SieveMethodsAndPrimePatterns. Those three reports use the configured order rather than this brief’s supplied moved order; all disappear with the supplied order. No order file was edited.

Overlap check: read EtaleCohomologyFoundations (finite-cover monodromy, arithmetic sequence and inertia), BelyiMaps (three-point covers), SchemeAndStackFoundations (sites, Picard and intersection theory), ArithmeticGaloisDuality (global duality), ArithmeticStatisticsPartVIII, InductionRestrictionPartII and InverseGaloisAndArithmeticFundamentalGroupsPartII; the last three consume this roadmap’s Hurwitz, lifting-invariant or reduced-multiplier objects. No ownership change in this diff; the supplied overlap report lists no conflicting head or dropped citation.

Source independence: changed passages only; 0 mathematical passages compared with 0 sources because the folder diff is empty. Largest-source locator share was not recounted; no layer was added, removed or reordered, so the contents comparison was not repeated. PR prose was checked against the head.

## Not verifiable

- Previous source limits remain: SGA 4½’s secondary curve-trace citation; Serre’s Topics in Galois Theory; Fried–Jarden; Poonen §8.2; Kollár IV.6.10; Huppert and Ribes–Zalesskii. No new source request.

## Source issues

- none

## For the human reviewers

- none
