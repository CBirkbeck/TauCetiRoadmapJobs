# Review of GlaubermanZStar (pull request #1778 at 581115c)

**Verdict:** needs changes

Incremental re-review of 0 changed lines since 581115c; this round reads the pull request's title and description against the head and reruns the gate. The folder is byte-identical to the head the previous review accepted, but the gate no longer passes on it: `LocalFiniteGroupTheory` is now a name roadmaps may not cite, and the README names it as a supplier.

## R01 (P2) — supplier `LocalFiniteGroupTheory` may not be cited (gate `dropped`, 19 hits)

**Location:** `TauCetiRoadmap/GlaubermanZStar/README.md` lines 15, 45–48, 86, 135–140, 337, 352, 383, 412, 420, 440, 481–486, 607, 705, 746, 804, 824, 983; `TauCetiRoadmap/GlaubermanZStar/Suggested.lean` line 21. "### From `TauCetiRoadmap.LocalFiniteGroupTheory`".

**Claim:** L1 (the `2'`-core), L4 (`2`-groups with a unique involution) and L5 (normal `2`-complement for a cyclic Sylow `2`-subgroup) are taken from a roadmap on the never-cite list, so the three prerequisites have no admissible owner as written and the gate fails.

**Witness:** gate at 581115c: `dropped=19 … FAIL`, rule "no name of the project's dropped-names list", first hit `line 15: consumed from LocalFiniteGroupTheory and ModularCharactersAndBlocks.`

**Repair:** remove every mention of the name and repoint the three contracts; each replacement owner was opened and checked on the instances below.

- *L1 → ModularCharactersAndBlocks §0.3* (already a supplier). It defines `pPrimeCore p G` on the group (not `pPrimeCore 2 ⊤` on a subgroup) and states every fact line 137–138 lists: characteristic, a normal subgroup lies in it exactly when it is a `π`-group, `O_π(G ⧸ O_π(G)) = 1`, `O_π(N) = O_π(G) ⊓ N` for `N ⊴ G`, images under surjections. Write `O(G) = pPrimeCore 2 G` of ModularCharactersAndBlocks §0.3 at lines 45, 86, 137, 337, 352, 383, 420, 440, 705, 746, 804, 824, and delete "(there `O_{2'} = piCore {q | q ≠ 2}`)".
- *L5 → Mathlib.* Replace lines 480–481 by: "If a Sylow `2`-subgroup `S` of `G` is cyclic, then `G` has a normal `2`-complement (Mathlib `IsCyclic.isComplement'`, with `(Nat.card G).minFac = 2` since `|G|` is even); the complement `K` is normal of odd order, so `K ≤ O(G)` (ModularCharactersAndBlocks §0.3), and `|O(G)|` is odd and divides `|K| · |S|`, so `K = O(G)`". Add `IsCyclic.isComplement'` and `IsCyclic.normalizer_le_centralizer` to the Mathlib transfer row (line 120); cite §2.2 instead of "L5" at lines 412, 420, 440, 746.
- *L4 → CohomologyOfGroups §8.2* (a finite `2`-group whose abelian subgroups are all cyclic is cyclic or `QuaternionGroup (2^(s−2))`, `s ≥ 3`). Add a contract `### From TauCetiRoadmap.CohomologyOfGroups` with that statement, and in §2.2 the bridge as a target of this roadmap: "a finite abelian `2`-group with exactly one involution is cyclic, so a `2`-group with a unique involution has all abelian subgroups cyclic". Cite it at lines 47, 483–486, 607, 705, 746.
- Line 15: "consumed from ModularCharactersAndBlocks". Lines 983–985: delete the sentence beginning "LocalFiniteGroupTheory names". `Suggested.lean` lines 20–22: "centrality of `t` modulo the `2'`-core; stating it this way keeps the file independent of other roadmaps' declarations".
- The pull request's description then changes with it: the prerequisites sentence becomes "Prerequisites: ModularCharactersAndBlocks #1775, OddOrderTheorem #1777 for its generic F2 library, and CohomologyOfGroups for the `2`-groups whose abelian subgroups are cyclic", and the summary's "supply the local theorems requested by LocalFiniteGroupTheory" and "Tau Ceti's local group theory" are dropped.

## R02 (P3) — the description's validation sentence does not describe this head

**Location:** pull request description, "Validation: `lake env lean TauCetiRoadmap/GlaubermanZStar/Suggested.lean` passes (five admitted targets), including the involution-section constancy and character alternative with explicit induction and central-character congruence conventions."

**Claim:** the file has four admitted theorems, and neither the character-value alternative nor any induction convention is stated in it.

**Witness:** elaboration at 581115c gives four `declaration uses sorry` warnings (lines 38, 48, 59, 82); the fifth declaration is the definition `InPrincipalTwoBlock`; README line 191: "states the four headline theorems … with the one definition they need".

**Repair:** "Validation: `lake env lean TauCetiRoadmap/GlaubermanZStar/Suggested.lean` passes with four admitted headline theorems (the Z* theorem in its isolated and Sylow forms, Brauer–Suzuki, and the involution-section constancy) and one definition, the central-character congruence criterion for the principal `2`-block."

## Previous findings

- none — the review of 581115c listed no finding.

## Verified sound

| Statement | Instances | Values | Result |
| --- | --- | --- | --- |
| R01, L1 at ModularCharactersAndBlocks §0.3 (`pPrimeCore 2 G`) | `S₃`; `A₄`; a `2`-group; odd order | `C₃`; `1`; `1`; `G` (that README's Checks, lines 384–390) | same object as `O(G)` of Conventions line 85; the carrier is the group, not `⊤` |
| R01, L5 by `IsCyclic.isComplement'` | `F₂₀`, Sylow `C₄`; `C₆`; `A₅` (Sylow `V₄`); `|G|` odd | `minFac 20 = 2`, kernel `C₅`; `minFac 6 = 2`, kernel `C₃`; not cyclic, no claim; no involution, §2.2 vacuous | hypotheses met exactly where §2.2 uses it |
| R01, complement `K = O(G)` | `F₂₀`: `K = C₅`; `S₃`: `K = A₃` | `K ≤ O(G)`, `|O(G)|` odd dividing `5 · 4`, so `5`; dividing `3 · 2`, so `3` | holds |
| R01, L4 by CohomologyOfGroups §8.2 plus bridge | `Q₈`; `D₈`; `C₂ × C₂`; `C₄` | abelian subgroups `⟨i⟩, ⟨j⟩, ⟨k⟩, ⟨−1⟩, 1` cyclic; `5` involutions; `3` involutions; `1` involution, cyclic | bridge needed and true; `D₈`, `V₄` excluded |
| `glauberman_zStar` (cited by the description's summary) | `S₃`, `t = (12)`; `A₅`, `(12)(34)` | `N = A₃`, commutators are `3`-cycles or `1`; conjugate `(13)(24)` commutes, hypothesis fails | description's first sentence agrees with the statement |
| R02, count of admitted declarations | `Suggested.lean` at this head | `4` theorems with `sorry`, `1` definition with a body | "five admitted targets" is wrong |

Rows for all other statements stand as in the previous review, of `581115c`.

- Gate, run from the worktree at this head: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=19 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 FAIL` (the worker's run adds `build=0`). The only failing rule is `dropped` (R01).
- Dependency check (movable): `depcheck: 244 roadmaps, 2229 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. CohomologyOfGroups is earlier in the merge order than OddOrderTheorem, so R01's repair adds no upward edge.
- Elaboration: `lake env lean` on `TauCetiRoadmap/GlaubermanZStar/Suggested.lean`: four `declaration uses sorry` warnings (lines 38, 48, 59, 82), nothing else. The worker's signature listing reports a parse error at "line 92" and a declaration `in`; the file has 90 lines and elaborates cleanly, so both are artefacts of that listing (it reads the word after "Theorem 1," in a docstring). `InPrincipalTwoBlock` does not carry `[Finite G]`, which its type does not mention; the constancy theorem carries it.
- Library declarations opened at the pin: `IsCyclic.normalizer_le_centralizer` and `IsCyclic.isComplement'` (`Mathlib/GroupTheory/Transfer.lean` lines 312, 343). `pPrimeCore`, `piCore` and a normal-`p`-complement predicate do not occur in the pinned Mathlib or Tau Ceti.
- Cross-roadmap citations resolved this round: ModularCharactersAndBlocks §0.3 at its open head `8379fba` (README lines 353–390); CohomologyOfGroups §8.2 at its open head `6447a96` (README lines 2642–2652); OddOrderTheorem at `f65b2b3` names this roadmap as consumer of its §2.4 (README lines 93, 1630). The worker's three "Lean names found nowhere" (README lines 142, 158, 167) are contract headings naming sub-roadmap folders, not declarations.
- Pull request text, sentences checked against the head: title; the three summary paragraphs (Z* statement against `glauberman_zStar`; factorization, simple groups and `χ(t) = ±χ(1)` against §5.1–§5.2, README lines 40–41 and 954–961; "no existing roadmap consumes them yet" against line 983; no odd-order or classification hypothesis against lines 66–69); "Add a roadmap" (the folder is not on main: 3 files, 1106 insertions, 0 deletions); the import boundaries paragraph against lines 49–64. Only the validation sentence is contradicted (R02). Nothing changed outside the folder.
- Duplication: `roadmaps grep` for the `2'`-core, normal `p`-complements and "cyclic or generalized quaternion" over the open heads and main; the owners found are those of R01's repair. OddOrderTheorem §1.1 also defines `π`-cores; that is between it and ModularCharactersAndBlocks, not an object of this roadmap.
- Remark: the description's "Tau Ceti's … modular blocks" means the roadmap ModularCharactersAndBlocks; the pinned library has no block theory, as the README's contract table already shows.

Overlap check: read OddOrderTheorem, ModularCharactersAndBlocks, FiniteGroupInvariants, CharacterTheory, FiniteGroupExtensionSplitting (and LocalFiniteGroupTheory, not citable); the `2'`-core is ModularCharactersAndBlocks §0.3's, the Dade/induction comparison OddOrderTheorem F2 §2.4's, isolation, `Z*(G)` and Brauer–Suzuki this roadmap's; none of them states the Z* or Brauer–Suzuki theorems.

Source independence: changed passages only; the diff is empty, so 0 passages compared with 0 sources; no layer added, removed or reordered, so the arrangement was not compared again (largest share of locators `waldecker2013`, as before).

## Not verifiable

- `brauer_suzuki1959`: the cached text is still a placeholder; the statement on p. 1757 stands checked against `waldecker2013` lines 510–512, as in the previous review.
- `glauberman1966`, `suzuki1986`: settled uncertified; cited by locator only.
- The seeded sample: no passage changed, so no locator was reopened this round.
- The description's "Roadmap topic validation, whitespace checks and pinned source-link checks pass": those checks are not among the commands this review may run.

## Source issues

- none

## For the human reviewers

- Licence: README lines 1005–1013 cite the AxiomMath CFSG repository (stated Apache-2.0, commit `69cb972f`) as prior art; `Suggested.lean` was not compared with its files this round.
- Not tested: `glauberman1966` and `suzuki1986`, the sources of the main theorem and of the Layer 2 proof, are uncertified; wording and arrangement were never compared with their text.
- The never-cite list now holds `LocalFiniteGroupTheory` (open draft #1634, another author); R01 moves its three contracts to ModularCharactersAndBlocks, CohomologyOfGroups and Mathlib. Whether that roadmap stays uncitable is the project's decision.
