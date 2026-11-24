# Review of ZerosOfLFunctions (pull request #3012 at 354ccb3)

**Verdict:** accepted

**Summary.** Accepted, with no findings. This is an incremental re-review at the head the previous review read: the folder has not changed since, and this round read the pull request's title and description against the change and the head. Every sentence of them agrees with the diff against main (four `*Needs:*` lines, in 1.6, 3.1, 5.6 and 6.5, each now naming the L-functions roadmap before its layer) and with the roadmap's layers and headline theorems. There are no small corrections and no format notes; one question about a lemma number stands, and two points are left to the human reviewers (the licence of the PrimeNumberTheoremAnd provenance, and the unread text of Davenport).

## Questions for the author

- In 6.4 (line 1341) and in the References (line 3076) the whole-strip region `Re s > 1 − 1/(R₄ (log A(χ) + n log (|Im s| + 2)))` is located at Lagarias–Montgomery–Odlyzko, Lemma 2.3. Kadiri's report (kadiri2012 lines 65–73) attaches Lemma 2.3 to the box `|Im s| < 1/(R₄ log A(χ))` of (1.5) and then says that the authors also extend the region to the whole critical strip, (1.6), with no lemma number. Is the extension part of Lemma 2.3, or does it have its own number in that paper? The paper is paywalled and cited by locator, so it could not be opened. (Carried from the previous review; the text is unchanged.)

## Previous findings

- The previous review, of this same head, had no findings (no R-numbered remark), no small correction and no format note, so there is none to account for.

## Verified sound

| Statement | Instances | Values computed (each side) | Result | Change |
| --- | --- | --- | --- | --- |
| 6.5 edges, with 5.6 `Λ₀(0) ≠ 0`: nonvanishing at `s = 1` carried to `s = 0` by the functional equation (the `*Needs:*` lines the description describes) | `χ₋₃`, `N = 3`, odd, `Λ(s) = (3/π)^{(s+1)/2} Γ((s+1)/2) L(s)` | `L(1) = π/(3√3)`, so `Λ(1) = (3/π)·π/(3√3) = 1/√3`; `L(0) = −B_{1,χ} = 1/3`, so `Λ(0) = √(3/π)·√π·(1/3) = 1/√3`; `ε = 1` | true; both sides `1/√3 ≠ 0` | none |
| 3.1 `*Needs:*`: the Hecke Mellin inputs are the supplier's Layer 6, not this roadmap's Layer 6 | layer headings of both READMEs | L-functions Layer 6 is Grossencharacters and holds `completedHeckeLFunction_eq_mellin`; this roadmap's Layer 6 is zero-free regions (line 1229), which 3.1 does not use | the description's example holds | none |

The rows for the untouched statements stand as in the previous review, of `354ccb3`.

- Changed passages since the previous review: none (0 lines in the folder, nothing outside it). The seeded sample has no target in a changed passage, so no source locator was opened this round.
- Pull request text against the head, sentence by sentence. Title: sections 1.6, 3.1, 5.6 and 6.5 are exactly the four `*Needs:*` paragraphs the diff against main changes (lines 488, 665–666, 1164, 1639–1641; 7 insertions, 6 deletions). Summary block: 1.6 names "L-functions Layers 3 and 5 for the family comparisons"; 3.1 names "L-functions Layer 6" before `completedHeckeLFunction_eq_mellin` and the three `Grossencharacter.heckeMellinTotal` inputs; 5.6 names "L-functions Layer 7 `heckeLFunction_ne_zero_of_one_le_re` at `s = 1`"; 6.5 names "L-functions Layer 3 `meromorphicOrderAt_dedekindZetaC_one`" and "L-functions Layer 5 `completedHeckeLFunction_one_sub_eventuallyEq`". The ten layer subjects it lists are the ten `## Layer` headings (0–9), and the four headline theorems it names are those of the README's opening overview (lines 14–38). Prose: the four quoted fragments are the four the diff replaces; "sections 3.3 and 3.4 need 1.6" holds (`*Needs:*` at lines 706 and 729); this roadmap's Layer 3 is convexity and its Layer 6 zero-free regions; "No statement, target or prerequisite changes" agrees with the diff (no heading, no Lean declaration, no layer removed, renamed or added).
- Cross-roadmap citations resolved again on main, in `TauCetiRoadmap/LFunctions/Suggested.lean` by its section comments: `meromorphicOrderAt_dedekindZetaC_one` (line 314) and `dedekindZetaData` (line 390) under Layer 3; `heckeData` (line 884) and `completedHeckeLFunction_one_sub_eventuallyEq` (line 924) under Layer 5; `completedHeckeLFunction_eq_mellin` (line 1955) under Layer 6; `heckeLFunction_ne_zero_of_one_le_re` (line 2028) and `meromorphicOrderAt_dedekindZetaC_one_add` (line 2034) under Layer 7.
- Comparison with the README at the merge base: no layer, item, heading or Lean declaration is removed, renamed or renumbered; nothing outside the folder changes.
- Automatic checks: run again on this head, all passed. Dependency check: `depcheck: 132 roadmaps, 1465 edges, 0 problem(s)`, no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on `TauCetiRoadmap/ZerosOfLFunctions/Suggested.lean` gives 23 ``declaration uses `sorry` `` warnings and nothing else; the file is unchanged, so the previous signature comparison and one-tactic probe stand.

Overlap check: read RiemannHypothesisStatementsAndConsequences, ExplicitZetaBounds, AnalyticNumberTheoryPartI and LFunctions (main), as in the previous review; nothing shared. The change adds no object and cites no new id. One other open pull request (the RiemannHypothesisForDirichletLFunctions follow-up) now changes this folder; the two heads merge cleanly and the description's merge-order block states the order (this one first). Its files were not given to this review, so its change to this folder was not read.

Source independence: changed passages only; nothing in the folder changed since the previous review, so there was no passage to compare (0 passages, 0 sources); no layer is added, removed or reordered, so the arrangement was not compared again (previous result: largest share davenport2000, 18 of 69 source mentions, independent).

Research link: 6.4 is the Lagarias–Montgomery–Odlyzko (1979) region used for their bound for the least prime ideal in the Chebotarev density theorem (kadiri2012 lines 65–76); 7.5 is the count made explicit by Hasanalizade–Shen–Wong (2022) and Bennett–Martin–O'Bryant–Rechnitzer (2021). Rests on the README and those sources.

## Not verifiable

- lagarias1979 Lemma 2.3 (6.4): uncertified, cited by locator; Kadiri's report of it was read in the previous review (see the question).
- The other items of the earlier reviews (Davenport, Titchmarsh, Iwaniec–Kowalski, DLMF 5.6.6, Lang, Lagarias–Odlyzko, the proof of montgomery-vaughan2006 (10.38), the PrimeNumberTheoremAnd declarations) concern untouched text and stand as recorded there; none was reopened in this round.
- The other open pull request's change to this folder: its files were not available; only the result that the two heads merge cleanly was used.

## Source issues

- none

## For the human reviewers

- **Licence.** The README's Provenance section (lines 2528–2552) maps nine sections to declarations of PrimeNumberTheoremAnd (Apache-2.0, commit `127b50e`) and asks that its authors be consulted before porting. Those declarations were not compared with `Suggested.lean`.
- **Not tested.** davenport2000 has the largest share of locators (18 of 69 mentions) and is uncertified: its text was not read, and its contents were compared only through the section titles in the README's References (line 3035).
