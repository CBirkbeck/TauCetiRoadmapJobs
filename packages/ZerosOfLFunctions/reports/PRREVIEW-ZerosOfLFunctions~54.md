# Review of ZerosOfLFunctions (pull request #3012 at 354ccb3)

**Verdict:** accepted

**Summary.** Accepted, with no findings. This is an incremental re-review of the four lines changed since `8cc0030`: the `*Needs:*` lines of 1.6 and 5.6 now name the L-functions roadmap before its Layers 3 and 5 and its Layer 7, which repairs the one small correction of the previous review, and the layers named do hold the cited declarations. The title and the description state the change as the head shows it (four `*Needs:*` lines, in 1.6, 3.1, 5.6 and 6.5). There are no small corrections and no format notes; one question about a lemma number stands, and two points are left to the human reviewers (the licence of the PrimeNumberTheoremAnd provenance, and the unread text of Davenport).

## Questions for the author

- In 6.4 (line 1341) and in the References (line 3076) the whole-strip region `Re s > 1 − 1/(R₄ (log A(χ) + n log (|Im s| + 2)))` is located at Lagarias–Montgomery–Odlyzko, Lemma 2.3. Kadiri's report (kadiri2012 lines 65–73) attaches Lemma 2.3 to the box `|Im s| < 1/(R₄ log A(χ))` of (1.5) and then says that the authors also extend the region to the whole critical strip, (1.6), with no lemma number. Is the extension part of Lemma 2.3, or does it have its own number in that paper? The paper is paywalled and cited by locator, so it could not be opened.

## Previous findings

- The previous review had no findings (no R-numbered remark), so there is none to account for.
- C01 (small correction) — repaired: 1.6 (line 488) reads "L-functions Layers 3 and 5 for the family comparisons"; 5.6 (line 1164) reads "L-functions Layers 3 and 5, and L-functions Layer 7 `heckeLFunction_ne_zero_of_one_le_re`". The repair introduces no new problem.

## Verified sound

| Statement | Instances | Values computed (each side) | Result | Change |
| --- | --- | --- | --- | --- |
| 1.6 *continuedL* and its family comparisons (the changed `*Needs:*` line) | `ζ` record at `s = 0`; supplier layers | `Λ(s) ≈ −1/s`, `Gammaℝ(s) ≈ 2/s`, limit `−1/2 = ζ(0)`; raw quotient `Λ(0)/Gammaℝ(0) = x/0 = 0`. `dedekindZetaData` in L-functions Layers 2–3, `heckeData` in Layers 5–6 | true; the layers named are the supplier's | none |
| 5.6 `Λ₀(0) ≠ 0` from nonvanishing at `s = 1` (the changed `*Needs:*` line) | `χ₋₄`, `N = 4`, odd | `Λ(1) = 2 · π⁻¹Γ(1) · π/4 = 1/2`; `Λ(0) = 1 · π^{−1/2}Γ(1/2) · L(0) = 1/2`; `ε = 1`, so `Λ(0) = ε conj Λ(1)` | true; `heckeLFunction_ne_zero_of_one_le_re` is in L-functions Layer 7 | none |

The rows for the untouched statements stand as in the previous review, of `8cc0030`.

- Changed passages: two `*Needs:*` lines (1.6, line 488; 5.6, line 1164), each read in full with its section. No statement, Check, heading or Lean declaration changes; the seeded sample has no target in either line.
- Cross-roadmap citations resolved on main, in the L-functions roadmap: Layer 3 is Dedekind zeta, Layer 5 finite-order Hecke L-functions, Layer 7 intrinsic nonvanishing (README headings); in its `Suggested.lean`, `dedekindZetaData` line 1053 (section "Layers 2--3"), `heckeData` line 1632 (section "Layers 5--6"), `heckeLFunction_ne_zero_of_one_le_re` line 2680 (section "Layer 7"). The layer dependency lists of this roadmap agree: "L-functions Layers 0, 3, 5" (line 522) and "L-functions Layers 0, 3, 5 and 7" (line 1226).
- The two lines the earlier commit changed (3.1, line 665; 6.5, lines 1639–1641) were read again with the diff against main: `completedHeckeLFunction_eq_mellin` is in L-functions Layer 6 (line 2550 there), `meromorphicOrderAt_dedekindZetaC_one` line 977, `completedHeckeLFunction_one_sub_eventuallyEq` line 1670, `meromorphicOrderAt_dedekindZetaC_one_add` line 2688.
- Comparison with the README at the merge base: 13 lines in four `*Needs:*` lines; no layer, item, heading or Lean declaration is removed, renamed or renumbered. Nothing outside the folder changes.
- Pull request text against the head: the title names 1.6, 3.1, 5.6 and 6.5, and the description's four quoted fragments are the four fragments the diff against main replaces; its two examples hold (this roadmap's Layer 6 is zero-free regions, its Layer 3 convexity, and 3.3 lists 1.6 in its `*Needs:*`, line 729); "No statement, target or prerequisite changes" agrees with the diff. Nothing to correct.
- Automatic checks: all passed when run again on this head. Dependency check: `depcheck: 133 roadmaps, 1474 edges, 0 problem(s)`, no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on `Suggested.lean` gives 23 ``declaration uses `sorry` `` warnings and nothing else; the file is unchanged since `8cc0030`, has no `variable`, `include` or `set_option`, so the previous signature comparison and one-tactic probe (0 of 23 close) stand.

Overlap check: read RiemannHypothesisStatementsAndConsequences, ExplicitZetaBounds, AnalyticNumberTheoryPartI and LFunctions (main), and LFunctions (open revision), SpecialFunctionsGamma and LiCoefficientsArithmeticFormula (open), as in the previous review; nothing shared. The change adds no object and no citation of a new id; no open pull request changes this roadmap or drops an id it cites.

Source independence: changed passages only; the two changed lines are lists of supplier layers and declaration names with no source locator and no prose to compare (0 passages, 0 sources); no layer is added, removed or reordered, so the arrangement was not compared again (previous result: largest share davenport2000, 18 of 69 source mentions, independent).

Research link: 6.4 is the Lagarias–Montgomery–Odlyzko (1979) region used for their bound for the least prime ideal in the Chebotarev density theorem (kadiri2012 lines 65–76); 7.5 is the count made explicit by Hasanalizade–Shen–Wong (2022) and Bennett–Martin–O'Bryant–Rechnitzer (2021). Rests on the README and those sources.

## Not verifiable

- lagarias1979 Lemma 2.3 (6.4): uncertified, cited by locator; Kadiri's report of it was read instead (see the question).
- The other items of the previous review (Davenport, Titchmarsh, Iwaniec–Kowalski, DLMF 5.6.6, Lang, Lagarias–Odlyzko, the proof of montgomery-vaughan2006 (10.38), the PrimeNumberTheoremAnd declarations) concern untouched text and stand as recorded there; none was reopened in this round.

## Source issues

- **Error** in kadiri2012 at §1, (1.6), printed p. 2: the source says Lagarias–Montgomery–Odlyzko prove that a Hecke L-function has no zero in the whole-strip region (1.6), which near the real axis lies inside the box (1.5); it should be no zero other than the possible exceptional zero that (1.5) allows; affects nothing.

## For the human reviewers

- **Licence.** The README's Provenance section (lines 2528–2552) maps nine sections to declarations of PrimeNumberTheoremAnd (Apache-2.0, commit `127b50e`) and asks that its authors be consulted before porting. Those declarations were not compared with `Suggested.lean`.
- **Not tested.** davenport2000 has the largest share of locators (18 of 69 mentions) and is uncertified: its text was not read, and its contents were compared only through the section titles in the README's References (line 3035).
