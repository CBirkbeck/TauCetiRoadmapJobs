# Review of MappingClassGroupsAndCanonicalRepresentations (pull request #2266 at 9acc4f0)

**Verdict:** accepted

**Summary.** Accepted: this incremental re-review of the 11 lines changed since `b09679c` found no finding. Both small corrections of the previous review are repaired as proposed, the repairs introduce no new problem, and the title and description agree with this head. There are no small corrections and no format notes; one question on a Farb–Margalit sign remains open because the book could not be read. Two points are left to the human reviewers: the status of the authors' erratum page, and the fact that the roadmap corrects two statements of a published paper.

## Questions for the author

- In §0.3 (README lines 267–268, unchanged) the homology formula is cited as "Farb–Margalit, Proposition 6.3, stated for the left twist, with the opposite sign". The README's own formula is right (on `ℝ²/ℤ²` oriented by `dθ ∧ dt`, the twist `(θ, t) ↦ (θ + f(t), t)` about `a = {t = 0}` sends `[b]` to `[b] + [a]` and `î(a, b) = +1`). Does the printed Proposition 6.3 read `T_a^k([b]) = [b] + k·î(b, a)[a]`, as "the opposite sign" requires, or `[b] + k·î(a, b)[a]`? In the second case the remark should say the printed formula agrees in form and the difference lies in the orientation convention. What stopped me: the book is cited by locator only and its text was not read.

## Previous findings

The previous review (of `b09679c`) had no finding; its two small corrections are accounted for here.

- C01 — repaired: §11.6 (line 2645) now reads "the non-flatness asserted in Landesman–Litt, Remark 9.2.5, p. 49, made precise here; the authors' erratum withdraws that remark together with its complete-intersection inference"; the corrections list (line 3540) names both deletions.
- C02 — repaired: "Downstream consumers" (lines 2876–2878) lists SurfaceGroupCharacterVarieties with §§0.1–0.3, 1.4 and 2.1, and the description's consumer sentence now names it with the same sections.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §11.6 non-flatness and its attribution (changed passage; sampled target) | `ℤ_p[[x]]/(p)`; `R[1/p] = 0` with residue field `F`; a point of nonzero `R[1/p]`; LL24 and LL-P04 at the locators | `𝔽_p[[x]]`: regular ring modulo one regular element, `p`-torsion, so complete intersection and not flat. `R ≠ 0` killed by a power of `p`: not flat, hence not a power series ring. Point over finite `E` gives a lift to `GL_r(O_E)`, arithmetic on the geometric group, against §11.3. LL24 lines 2071–2076 (page 49) assert non-flatness; LL-P04 line 2891 deletes Remark 9.2.5 and the last sentence of 9.2.6 | true; attribution now matches both sources | none |
| "Downstream consumers", SurfaceGroupCharacterVarieties bullet (added) | its head's citations of this roadmap | §§0.1–0.3 at its README lines 99–102, 130, 491, 525–531, 1910 (presentation, pure group, Birman sequence); §1.4 at lines 833, 855, 1596; §2.1 at lines 719, 781 | bullet agrees with the consumer's head and with the scope section (lines 3038–3046) | none |

The rows for the untouched statements stand as in the previous review, of `b09679c`.

- Source locators checked against the text: 2 (LL24 Remark 9.2.5, page 49, lines 2071–2076; LL-P04 lines 2889–2891); both agree with the changed sentences.
- Cross-roadmap citations resolved: the five sections of this roadmap named in the new consumer bullet, against SurfaceGroupCharacterVarieties at its open head; consistent. The bullet names a consumer, so it adds no supplier edge.
- Dependency check: `depcheck: 199 roadmaps, 2190 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration of `Suggested.lean` (unchanged since `b09679c`): six `declaration uses sorry` warnings (lines 202, 219, 234, 250, 259, 272), nothing else; single `import Mathlib`, no `set_option`.
- Pull request text read against this head: it says the pull request adds the roadmap (the folder is not on main; 3839 added lines, no heading or declaration removed); the folder holds the three files named; six theorems in the Lean file; all 23 roadmaps listed "on main" are on main or under `Completed/`; the three listed "still open" are not on main and are cited by the README; the supplier list equals the `### From` subsections of the supplier contracts; the four consumers named are those of the README. No sentence contradicted, nothing a reader must know left unstated.
- Files changed outside the folder: none.
- Automatic checks: all passed on this head.

Overlap check: read SurfaceGroupCharacterVarieties (its citations of §§0.1–0.3, 1.4, 2.1 here); the other closest roadmaps (MordellLawrenceVenkatesh, TeichmullerGeometry, MixedHodgeModulesAndIrregularHodgeTheory, InverseGaloisAndArithmeticFundamentalGroups, LefschetzPencilsAndVanishingCycles, PainleveEquations) stand as read in the previous review, the change touching nothing they share. Representation schemes for `GL_r` over `ℂ` and MCG-finiteness: owner this roadmap, SurfaceGroupCharacterVarieties owns the general group scheme and states the comparison. Nothing has two owners.

Source independence: changed passages only; 3 passages (the §11.6 attribution, the corrections-list entry, the consumer bullet) compared with 2 sources (LL24, LL-P04), none shared; largest share LL24, about 95 of about 200 locators; contents compared with LL24: independent, as in the previous review (no layer added, removed or reordered).

Research link: the headline targets are the main theorems of Landesman–Litt, *Canonical representations of surface groups* (Annals 2024): finiteness for `r² < g + 1`, the Putman–Wieland results and arithmetic finite monodromy; inputs are Landesman–Litt 2022, Klevdal–Patrikis 2020, Esnault–Groechenig 2018 and Mochizuki 2006. Rests on the README's references and on LL24, LL22 and KP20 as read.

## Not verifiable

- Farb–Margalit, Proposition 6.3 (§0.3): cited by locator only, text not read; hence the question above.
- The description's count of earlier review rounds: not checkable from the repository.
- The locators outside the changed passages were not opened again; they stand as in the previous review.

## Source issues

- **Error** in LL24 at Remarks 9.2.5–9.2.6, p. 49: the source says non-flat deformation rings are not complete intersections; it should not draw that inference, flatness being independent; affects a stated result; corrected in print at LL-P04 line 2889.

## For the human reviewers

- **Licence.** LL-P04 is an author's web page, not a publication; LL-P04 line 2635 says its review and audit are AI-generated and that one author spot-checked and edited the erratum. The README relies on it for seven corrections (README lines 3508–3547).
- **Scope.** The README states that two results of a published paper are false as printed (LL22 Corollary 6.1.2 and Lemma 7.5.1; README's list of corrected source statements) and restates them with added hypotheses. The previous review recomputed the counterexamples; no published correction was found.
