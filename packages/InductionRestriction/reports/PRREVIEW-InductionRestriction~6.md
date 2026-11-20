# Review of InductionRestriction (pull request #2639 at 67fee23)
Folder: `TauCetiRoadmap/RepresentationTheory/InductionRestriction/`
**Verdict:** accepted

**Summary.** Accepted: no finding. This is an incremental re-review of the four lines added since `5cf368c`: two explicit anchors, before §2.1 and before §7.1, which keep the links of PseudodifferentialOperators and StableHomotopyKTheory resolving; both ids match the cited fragments character for character, and no statement changed. There is one small correction (the description still says these two anchors change) and two format notes carried from the previous review, none blocking. For the humans: Isaacs, the most-cited text, is still unread behind a paywall.

## C01 — The description says the anchors of old Layer 2.1 and of the universal central extension change; at this head they are kept

A maintainer reading the description would expect two links from roadmaps on main to break at the merge and might go and edit those roadmaps. The description says: "The anchors other roadmaps link to for Layers 0, 3 and 6 still resolve; those of old Layer 2.1 and of "Abstract universal central extensions" change." The head now carries `<a id="layer-21-almost-conjugacy-and-permutation-representations">` before §2.1 (README line 145) and `<a id="abstract-universal-central-extensions">` before §7.1 (line 552), which are exactly the fragments linked from PseudodifferentialOperators (line 2008) and StableHomotopyKTheory (line 84) on main.

Text that would be right: "The anchors other roadmaps link to still resolve: those of Layers 0, 3 and 6 by their headings, and those of old Layer 2.1 and of "Abstract universal central extensions" by explicit anchors placed before §2.1 and §7.1." The next sentence, on the paragraph after the Scope table, stays true.

## N01 — Four sections state targets with no source locator

Carried from the previous review, unchanged: §4.2, §7.3, §7.7 and §7.8 cite no text, while §7.6 cites Curtis–Reiner §11 for the same crossed systems. A locator for §§7.7–7.8 would let an implementer check the conventions against a reference; §4.2 and §7.3 are adapters and may need none.

## N02 — Two entries of the References are cited nowhere in the text

Carried, unchanged: James–Liebeck (Ch. 21) and Alperin–Bell (§16) appear only in the list of references (README lines 1074–1077). Would cite each where it is used, or say in the entry what it is background for.

## Questions for the author

- §6.1 gives "over `ℂ`: Serre, Part II, §9–10" for the basis statement, while the target is over a field of characteristic zero that need not split `G`. Does Serre's §12.1 state the basis and orthogonality of the characters of the simple `K[G]`-modules for such a field? The text is behind a paywall and was not read.
- Which results of Curtis–Reiner §11 give Clifford's theorem and the correspondence of §§5.2–5.3 over an arbitrary field, and the crossed systems of §7.6? The text could not be read (paywall), so the section-level locator was not checked.

## Previous findings

The previous review (of `5cf368c`) had no finding (no R01); its other remarks against this head:

- N01 (four sections without a locator) — not repaired: §4.2, §7.3, §7.7, §7.8 are untouched; written again as N01.
- N02 (two references cited nowhere) — not repaired: lines 1074–1077 untouched; written again as N02.
- The two questions for the author are untouched and written again.

The repair of this round (the two anchors) introduced no new problem in the README: neither id collides with a heading's generated anchor (`21-almost-conjugacy-restriction-and-quotient-invariant-adapters`, `71-abstract-universal-central-extensions`), and the mapping paragraph after the Scope table (lines 908–914) remains true.

## Verified sound

The diff changes no statement; the rows are for the two sections the new anchors stand before, and for the anchors themselves.

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| Anchor before §2.1 (line 145) | fragment in PseudodifferentialOperators line 2008 on main | cited `#layer-21-almost-conjugacy-and-permutation-representations`; id identical; heading slug differs (`21-almost-conjugacy-restriction-…`), no collision | link resolves to §2.1, which the mapping paragraph names as the new place | none |
| Anchor before §7.1 (line 552) | fragment in StableHomotopyKTheory line 84 on main | cited `#abstract-universal-central-extensions`; id identical; heading slug `71-abstract-…`, no collision | link resolves to §7.1 | none |
| Anchors of Layers 0, 3, 6 | fragments in SmoothRepresentationsOfLocalGroups 71–72, AnalyticNumberTheoryPartI 3573–3574, ClassicalArithmeticCompletion 220 | headings at lines 112, 225, 508 give `layer-0-the-functorial-core----transitivity-…`, `layer-3-the-mackey-decomposition-formula`, `layer-6-the-virtual-character-ring-artin-and-brauer-induction` | all resolve | none |
| §2.1 criterion (cited by the first anchor) | `V₄`, `H = ⟨a⟩`, `K = ⟨b⟩`; `S₃`, `⟨(1 2)⟩`, `⟨(1 3)⟩` | class `{a}`: 1 against 0, characters at `a`: 2 against 0; classes: (1,1,0) both, characters (3,1,0) both | iff holds both ways on these | none |
| §7.1 kernel and universality (cited by the second anchor) | `G = 1`; `C₂`; `A₅` | `F = ℤ`, `U = 1`; image of `U` is `[G,G] = 1 ≠ C₂`, so surjectivity needs perfect `G`; kernel of order 2 | split "every group / perfect group" is right | none |

The rows of the previous review for the untouched statements stand as in the previous review, of `5cf368c`.

- Changed passages: 4 lines, 2 anchors; both ids compared with the citing fragments on main (2 of 2 identical); the 3 heading-derived fragments rechecked (3 of 3 resolve).
- Cross-roadmap citations resolved: 5 citing roadmaps on main opened at the cited lines; each consumes this roadmap, none is a supplier.
- Library declarations opened at the pins: none new; the diff names none.
- Source locators checked: none fall in the changed passages (the seeded sample's sections are untouched and stand as verified or as listed under Not verifiable in the previous review).
- Elaboration of `Suggested.lean` at this head: 13 `sorry` warnings and nothing else; the file is unchanged since `5cf368c`, so the signature comparison and the one-tactic probe of the previous review stand.
- Dependency check: `depcheck: 181 roadmaps, 2068 edges, 0 problem(s)`; no UPWARD or CYCLE line. The automatic checks all passed. Changes outside the folder: none.
- The overlap report now lists no dropped id for this pull request (the previous round listed these two anchors).
- Description read against the head: one sentence contradicted (C01); the rest agrees (a revision of the roadmap on main, 28 Checks in 16 sections, suppliers Mathlib and Tau Ceti only).

Overlap check: read ModularCharactersAndBlocksPartII, ModularInduction and CharacterTheory on main and ModularInduction, MetaplecticAutomorphicFormsPartII, ArtinRepresentations, CharacterTheory and FiniteGroupInvariants at their open heads, as in the previous review; nothing shared. The diff adds no object.

Source independence: changed passages only: 2 added passages (HTML anchors, no prose) compared with 0 sources, none shared; largest share Isaacs, 7 of 21 locators, whose text could not be read; the diff adds, removes or reorders no layer, so the contents were not compared again (previous result: independent, from chapter titles only).

Research link: §7.1 is the universal central extension that Weibel (2013, Ch. III, Theorems 5.4–5.5) uses for the Kervaire–Steinberg identification `K₂(R) ≅ H₂(E(R); ℤ)`, consumed by StableHomotopyKTheory §3.29; Layers 5 and 7 feed ModularCharactersAndBlocksPartII. Rests on Weibel2013 lines 1970–1987 and the README's Downstream consumers.

## Not verifiable

- Isaacs, *Character Theory of Finite Groups*, Ch. 6 and Ch. 11 (§§5.1–5.3, 7.2, 7.4–7.6): paywalled, not recorded for this roadmap; not read.
- Curtis–Reiner, *Methods of Representation Theory I*, §§10–11 (§§0.1, 3.1, 5.1–5.3, 7.6): paywalled; not read.
- Serre, *Linear Representations of Finite Groups*, Part II (§§2.3, 4.1, 4.3, 6.1): paywalled; not read.
- Mackey, Amer. J. Math. 73 (1951), 576–592 (§3.1): paywalled; not read.
- James–Liebeck and Alperin–Bell (References only): paywalled; not read.
- How the hosting site renders an `<a id>` element inside a README was not tested in a browser; the ids were compared as text with the linked fragments.

Automatic checks set aside as false positives: the citation resolver lists eight names as found nowhere, of which seven are declared in this head's `Suggested.lean` (six `AbstractUCE` names and `Gassmann.normalInvariantEquiv`) and the eighth is the roadmap's own namespace; the signature check flags a dropped `[Group G]` on `AbstractUCE.derived`, the commutator subgroup of the free group on the set `G`, which uses no group structure on `G`.

## Source issues

- **Gap** in Weibel2013 at Ch. III, Recognition Theorem 5.4, p. 37: the source says uniqueness of the map out of `[F,F]/[R,F]` follows from Lemma 5.3.3, without showing that group perfect as the lemma requires; it should be noted that perfect `G` gives `F = [F,F]·R`, so every commutator of `F` is a commutator of elements of `[F,F]` modulo `[R,F]`; affects the proof.

## For the human reviewers

- Not tested: Isaacs, *Character Theory of Finite Groups*, has the largest share of the locators (7 of 21 in the README body) and could not be read legally; wording was not compared with it, and its contents only at the level of chapter titles.
