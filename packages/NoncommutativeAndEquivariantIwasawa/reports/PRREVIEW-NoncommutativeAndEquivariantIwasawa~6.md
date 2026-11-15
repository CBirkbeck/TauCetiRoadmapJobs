# Review of NoncommutativeAndEquivariantIwasawa (pull request #1307 at 6f7588d)

**Verdict:** needs changes

Incremental re-review of the 34 lines changed since `e311e48` (README only; `Suggested.lean` unchanged), plus the pull request's title and description. Two P3 findings; no statement is wrong.

## R01 (P3) — One `*Needs:*` line and one locator line now cover four theorems with different needs

**Location:** `TauCetiRoadmap/NoncommutativeAndEquivariantIwasawa/README.md:2716–2718`, closing the merged §6.3: "*Needs:* 6.2 …; 3.11 …; 6.1 …; 3.14 …; TauCetiRoadmap ClassicalArithmeticCompletion §§7.63, 7.86."

**Claim:** The change folds §§6.4–6.6 into §6.3 as bold run-in parts and replaces their four `*Needs:*` lines and four "See Kakde …" lines by one of each at the end. Every consumer of one part now waits for the inputs of all four, and the theorems of README:2646, 2661 and 2677 have no locator at the claim.

**Witness:** §6.26 (README:3278, 3289) uses only the first part, whose proof (README:2652–2653) cites §3.11 and §6.2. At `e311e48` its line was "6.2; 3.11"; now it also carries 6.1, 3.14 and ClassicalArithmeticCompletion §§7.63, 7.86.

**Repair:** Restore lines 2642–2718 as at `e311e48`: four `###` subsections 6.3–6.6 (6.3 titled "Burns's reduction to one-dimensional extensions"), each with its own "See Kakde …" line after the theorem and its own `*Needs:*` line (6.3: 6.2, 3.11; 6.4: 6.2, 3.11, ClassicalArithmeticCompletion §7.63; 6.5: 6.2, 6.1, 3.11, 3.14; 6.6: 6.2, 3.11, ClassicalArithmeticCompletion §7.86), and restore the anchors in the `*Needs:*` lines of §§6.16, 6.26 and 6.34. That text passed the gate at `e311e48`. If the overview sentence of README:2644 is wanted, move it to the Layer 6 introduction, reading "§6.3 passes to the one-dimensional quotients `G/U`, §6.4 to …".

## R02 (P3) — The description announces red-team passes that the head already contains

**Location:** pull request description, Validation paragraph: "AI assistance: GPT-6 (Codex) for the port from the accepted explorer package, with author-side red-team passes to follow."

**Claim:** The sentence was written for an earlier head; the passes it promises are in the branch.

**Witness:** `git log origin/main..HEAD`: 26 of the 33 commits are titled "red-team repairs", for example `6716eea3` and `87071bd3`; three later ones are "review repairs".

**Repair:** Replace the sentence by: "AI assistance: GPT-6 (Codex) for the port from the accepted explorer package; Claude for the author-side red-team and review repairs since."

## Previous findings

- none: the review of `e311e48` had no finding to account for.

## Verified sound

| Statement | Instances tried | Values on the compared sides | Result / change |
|---|---|---|---|
| §6.3 merged `*Needs:*`, README:2718 | Inputs of each part's proof against the merged line | Part 1: {3.11, 6.2}. 6.4: {3.11, 6.2, CAC 7.63}. 6.5: {6.1, 6.2, 3.11, 3.14}. 6.6: {6.2, 3.11, CAC 7.86}. Merged line: the union of six. | R01. |
| §6.5 Check, README:2693 (cited by the changed overview) | `p = 5`, `D = C₂` | `ℤ₅[C₂] ≅ ℤ₅ × ℤ₅`; torsion of the units `μ₄ × μ₄`, order 16; `μ₄ × D^ab` has order 4·2 = 8. | Agrees with the theorem's character argument; unchanged. |
| §6.6 Check, README:2711 | `p = 5`, `C_n = C₃`, trivial action | 5 has order 2 mod 3, so the `ℚ₅`-orbits are {1} and {χ, χ²}: two factors, ranks 1 + 2 = 3 = order of `C₃`. | Agrees with Proposition 35 as stated; unchanged. |
| Overview sentence, README:2644 | Its two consumer claims against the `*Needs:*` lines | §6.34 (README:3549) lists 6.3, 6.4, 6.5, 6.6; §6.16 (README:3019) lists 6.4, 6.5, 6.6 and not 6.3. | The sentence is correct. |
| Merged locator line, README:2716 | Four locators against the text | Theorem 21 `kakde line 837` (p. 19); Theorem 27 `kakde line 950` (p. 21); Theorem 33 `kakde line 1211` (p. 27); Theorem 36 `kakde line 1289` (p. 29). | All four correct; hypotheses (`μ = 0`, `K′₁` injectivity) match the README theorems. |

The rows for untouched statements stand as in the previous review, of `e311e48`.

- Source locators checked against the text: 4 (the Kakde locators of README:2716, arXiv v3 read through the sources service); section numbers §§4.1–4.4 at `kakde line 712`, 883, 1046, 1238.
- Seeded sample: none of the fifteen sampled targets (0.3, 1.12, 2.13, 3.6, 5.1, 5.4, 5.7, 6.15, 6.20, 6.21, 6.28, 6.31, 7.8, 7.23, 7.24) lies in a changed passage; not re-certified this round.
- Cross-roadmap citations resolved: 2 (ClassicalArithmeticCompletion §7.63 and §7.86, both headings on main); no other roadmap, open or on main, cites this roadmap's §§6.3–6.6 or plans the Burns–Kato reductions.
- Internal references: all eight links to the new anchor resolve to the heading at README:2642; no link to the three dropped anchors remains; §§6.4–6.6 are still cited by number at more than a dozen places and exist only as bold part titles (README:2659, 2675, 2698).
- Gate rerun at this head: every counter 0, `OK`; no change outside the folder. Dependency check: `depcheck: 245 roadmaps, 2220 edges, 0 problem(s)`, no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on `TauCetiRoadmap/NoncommutativeAndEquivariantIwasawa/Suggested.lean` gives seven `sorry` warnings and nothing else; the file is byte-identical to `e311e48`, so the signature and padding results of the earlier reviews stand.
- Pull request text against the head: the summary block and the prose agree with the README on what is added (a new folder of three files, 13 Lean declarations), the end theorems, the consumer AdelicImagesAndModularCurves (README:4467), the ClassicalArithmeticCompletion forwarding chain (README, "Local constants and completed finite-image Artin functions") and the four suppliers not on main (GeneralAlgebraicKTheory, IntegralHeckeAndGaloisDeterminants, IntegralIwasawaTheory, PadicPeriodRings); only R02 is stale. The regrouping of R01 changes no section number that the description names.
- Overlap check: read SelmerIwasawaCohomology, IntegralIwasawaTheory, IntegralIwasawaTheoryPartII, EulerSystemsAndKolyvaginSystems, PadicFamilies, PadicMeasuresIwasawaAlgebras, ClassicalArithmeticCompletion by search for the objects of the changed passage only (Burns–Kato patching, `ℚ_p`-elementary reductions); nothing shared. Their scope sections were not read again this round.

Source independence: changed passages only; 1 added passage (README:2644) compared with 1 source (`kakde line 709`–716, 883, 1046, 1238), none shared; all 4 changed locators are kakde; contents not compared again, the change adds, removes or reorders no layer.

## Not verifiable

- The limits recorded in the review of `e311e48` (Ritter–Weiss 2004 uncertified, the Deligne scan and Serre OCR, open heads outside the supplied files) are unchanged and were not reopened.

## Source issues

- none

(No new issue this round; the errata listed in the review of `e311e48` were not audited again.)

## For the human reviewers

- none
