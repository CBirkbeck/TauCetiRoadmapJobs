# Review of ComputabilityTheory (pull request #2554 at ad928d0)

**Verdict:** accepted

**Summary.** Accepted, with no findings: the folder is unchanged since the last review, and this round read the pull request's description against main and the head. The description's counts and claims about `Suggested.lean` and the README hold, except two sentences: it lists the stage machine of Sacks splitting as added although main has it, and its account of main's L7 restraint does not match main's own Lean definition. There are two small corrections and two format notes (carried over), none blocking. Left to the human reviewers: Soare's book, which carries all 31 source locators, could not be read legally.

## C01 — The description lists "The stage machine of Sacks splitting" under "What the update adds", but main already has it, in the README and in `Suggested.lean`

A reader takes from this bullet that the splitting construction is specified for the first time here. Main's L9.3 already gives the routing rule (a fresh element goes to the side opposite the highest-priority pair with `x ≤ r^i(e, s)`, side zero otherwise, the search running over `e ≤ s`), and main's `Suggested.lean` already defines `pairsThrough`, `leastThreat`, `routeSide` and `sacksSplit` (lines 1107, 1111, 1127, 1135 of the file at the merge base). At the head these four definitions have the same bodies, except that `sacksSplit` reads the restraint `stageAgreementRestraint` in place of main's `agreementRestraint`; the description's own paragraph on `Suggested.lean` counts them among the 13 definitions kept, not among the three added.

What the head does add in 9.3 is the naming of the four definitions in the prose and the statement that the bounded search finds the highest-priority threatened pair among all pairs, which on main was the declaration `leastThreat_sacks`. Text that would be right: "In L9.3, the stage machine of Sacks splitting, which main already has, is named by its four definitions, and the correctness of its bounded search for the threatened pair is stated in the README."

## C02 — "Main's text took its restraint from the raw-run stage use" is true only of the library's `stageUse`, not of the one main's `Suggested.lean` defines

Main's L7 says the restraint is "represented as `some (stageUse ...)`". In main's own `Suggested.lean`, `stageUse` (line 235) is the use of `stageAt`, which runs `stage` (line 219): a bounded run that is discarded unless `e < s`, `x < s`, the output is `< s` and the use is `≤ s`, that is, Soare's stage evaluation, not the raw run. Only the pinned Tau Ceti's `TauCeti.Oracle.Single.Code.stageUse` is the use of a raw run with fuel. So a reader who opens main to check the sentence finds the opposite of what it says.

The change itself is correctly reported: the head specifies `Φ^{A_s}_{e,s}(e)` as the raw run with fuel `s`, which is what `TauCeti.LowSimple.diagRun` is (`TauCeti/Computability/Simple/Low.lean:91`, `evaln` with fuel `s`). Text that would be right: "Main's text named `stageUse`, which main's `Suggested.lean` defined on Soare's stage evaluation and the library defines on the raw run; the raw run is what the construction uses, and the head says so."

## N01 — Three *Needs:* lines disagree with the layer-level dependency statements

Carried over unchanged. The *Needs:* line of 2.3 (line 712) names no part of L1, although its first statement is about a predicate computable in `Z` in the sense of 1.1; the line of 7.3 (line 1375) names L2.2, which neither "How to read the build" (line 64) nor the Dependencies of L7 (line 1396) lists; the line of 9.1 (line 1542) names L4.5, while "How to read the build" (line 65) gives L4 to L9 only for splitting with low halves.

## N02 — L9 opens "This layer implements [S, VII.3.1–7]" (line 1479), and the description says the roadmap is "following Soare's" book

Carried over unchanged. Wording such as "This layer proves Sacks's cone-avoidance and splitting theorems and their corollaries [S, VII.3.1–7]" says the same in the roadmap's terms (likewise the openers of L3 and L4, lines 747 and 883); in the description, "with Soare's book as its main reference", as the README's summary has it.

## Questions for the author

- L5 cites the computably inseparable pair as "[S, I.3, exercises on inseparability]" (line 1003; the same locator is on main). Is the exercise among those of I.4, where c.e. sets are introduced? I could not check: the book is behind the publisher's paywall and no legal copy was found.

## Previous findings

The previous review (of `ad928d0`, the same head) raised no finding. Its other remarks:

- its C01 — repaired: the description now reads "Against main, `Suggested.lean` changes from a catalogue of prototype definitions and API statements to the roadmap's acceptance test on Tau Ceti's carriers. It keeps 28 declarations"; counts confirmed below.
- its N01 — not repaired: "*Needs:* Mathlib `Nat.rfind`, `Partrec.rfind`, `List.find?`; Tau Ceti `Primrec.list_find?`, `Nat.RecursiveIn.rfind'`" (line 712); it is N01 above.
- its N02 — not repaired: "This layer implements [S, VII.3.1–7]" (line 1479) and, in the description, "following Soare's *Recursively Enumerable Sets and Degrees*"; it is N02 above.

## Verified sound

| Statement | Instances tried | Values computed (roadmap side / check side) | Result |
| --- | --- | --- | --- |
| 9.3 `sacksSplit`, `routeSide` (cited by the description; C01) | stage 1, `x = 0` and `x = 5` fresh | stage 0 is `∅`; `ℓ = 0`, `r = some 0` for every pair; `pairsThrough 0 = [(0,f),(0,t)]`; `x = 0`: threat `(0,f)`, side `true`; `x = 5`: none, side `false` | as described; bodies equal main's up to the restraint |
| 7.1 diagonal computation (C02) | main `stage` vs pin `diagRun`, a run with output `≥ s` | main: `none` unless `e < s ∧ x < s ∧ output < s ∧ use ≤ s`; pin: `evaln` with fuel `s`, no bound on the output | the two differ; head states the raw run |
| Description, `Suggested.lean` counts | name sets of main and head | main 187 declarations, 13 examples, 8 `Mathlib.<submodule>` imports, `set_option autoImplicit`; head 28 = 15 theorems + 13 definitions; 162 removed, 3 added; 11 Tau Ceti imports | description correct |
| Description, headline count | module docstring of the Lean file | `friedberg_muchnik`, `exists_simple_avoiding`, `sacks_splitting`, its uniform form, `low_incomparable_split`, `low_halves_of_K`, `post_sigma`, `post_delta`, `limitLemma`: 9; 9 + 6 = 15 | description correct |
| Description, L3.1 | `A` low with `∅′ ≤_T A` | then `∅″ ≤_T A′ ≡_T ∅′`, false; main line 380–382 has only "noncomputable low c.e. set is incomplete" | description correct |
| Description, L0.2 | lines 349–368 of the head; main lines 255, 265 | universal program and both fixed-point theorems: "every total oracle"; `curry` and `fixedPoint`: "every partial oracle"; main: "for every oracle" | description correct |
| Description, L4.3 and L6.3 | head lines 930–949, 1246–1252; main lines 565–578 | four parts of the Limit Lemma, three library names on the first; second style stated in 6.3 and referred to L9.1 | description correct |

The rows of the previous review for the untouched statements stand as in that review, of `ad928d0`.

- Folder change since the previous review: 0 lines; no file changed outside the folder.
- Description checked sentence by sentence against main (merge base `1b7b481`) and the head: headings (10 layers, each ending with Examples and Dependencies; tokens L0.1–L0.3, L3.1, L3.2, L6.1–L6.4, L9.1–L9.4 kept; new sections L1.1–L1.3, L2.1–L2.4, L4.1–L4.5, L5.1–L5.3, L7.1–L7.3, L8.1–L8.3), no LaTeX delimiters at the head (211 lines with them on main), 44 *In Tau Ceti:* lines, the provenance table under References.
- Library declarations opened at the pin this round: `TauCeti.LowSimple.diagRun` and `diagUse` (`TauCeti/Computability/Simple/Low.lean:91`, `:102`), `TauCeti.Oracle.Single.Code.stageUse` as used in `TauCeti/Computability/SingleOracle/Agreement.lean:144`.
- Source locators checked against the text: 0 of 31 (all to [S]); no changed passage carries one.
- Cross-roadmap citations: the README makes none. Dependency check: `depcheck: 133 roadmaps, 1473 edges, 0 problem(s)`.
- Automatic checks, run again: all passed.
- Elaboration: exit 0, 15 warnings, all `declaration uses 'sorry'`; no `set_option`, `variable` or `lemma`.
- Ownership against open work: no open pull request changes this roadmap or drops an id it cites.

Overlap check: read SatisfiabilityComplexity (the only roadmap the three lists name); nothing shared, it leaves computability and degrees to this roadmap.

Source independence: changed passages only: 0 passages compared with 0 sources, the folder being unchanged and the only source unreadable; largest share [S], 31 of 31 locators; contents not compared again (no layer added, removed or reordered).

Research link: L8 and L9 state the Friedberg–Muchnik theorem and Sacks's cone-avoidance and splitting theorems as in Soare 1987, VII.2–3, the finite-injury basis of the theory of c.e. degrees whose continuations (infinite injury, density, jump inversion) the scope names. Rests on the README's summary and scope; no source text was read.

## Not verifiable

- Every [S] locator, those of the sampled sections included: Soare 1987 is with a paywalled publisher and no legal copy was found; nothing changed in the folder, so none was due again this round.
- The table of contents of [S]: not readable, same reason.
- The four external repositories of the provenance table (README lines 1817–1820) were not opened.

## Source issues

- none

## For the human reviewers

- Not tested: [S] (Soare 1987) carries all 31 source locators (README lines 119–1657); neither its text nor its table of contents could be read legally, so wording and arrangement were not checked against it.
- Arrangement: by the README's own locators L7, L8, L9 correspond to [S] VII.1, VII.2, VII.3 in order (lines 1304, 1403, 1479); the README says they are independent of one another; main has them under these ids.
- Licence: README lines 1808–1820 allow adapting code from four external Lean repositories (computable-model-theory, friedberg-muchnik-lean, a Mathlib fork, CiL); their licences were not read in this review.
- Licence: `friedberg_muchnik`, `REPredIn` and `ComputablePredIn` (`TauCetiRoadmap/ComputabilityTheory/Suggested.lean` lines 117, 47, 52) share names with declarations the provenance table attributes to two of those repositories; the files were not compared here.
