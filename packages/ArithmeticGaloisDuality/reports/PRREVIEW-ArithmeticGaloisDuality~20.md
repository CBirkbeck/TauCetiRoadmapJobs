# Review of ArithmeticGaloisDuality (pull request #3184 at 4ea5e62)

**Verdict:** accepted

**Summary.** An incremental re-review: the folder is unchanged since the last review of `4ea5e62`, so this round read the title and the description against the head and against the change from `main`. They describe the change correctly: the two new statements (§D7.3, §R02.4.4), the clause of §D7.7.3, what moved out of *Nakamura cochain tensor comparisons*, and "`README.md` only" all agree with the diff. No finding; one small correction to the description and two format notes carried from the previous review, none blocking. Nothing is left for a human to decide.

## C01 — The description says the revision of SelmerIwasawaCohomology citing §D7.3 "follows separately", but it is open and the same description refers to it

Under *Why*: "A revision of SelmerIwasawaCohomology that cites the first statement follows separately." Three paragraphs earlier the description already speaks of "the open revision of SelmerIwasawaCohomology" and its §2.23a. That revision is open and cites §D7.3 (*Cochain tensor comparison for profinite groups*) twice, in the items on base change of local conditions, as well as §D7.7.3 on the *Needs:* line of its §2.23a. A reader is left unsure whether a second revision is meant. Text that would be right: "The open revision of SelmerIwasawaCohomology cites the first statement."

## N01 — *Uniform vanishing of cocycles of bounded exponent* (§R02.4.4, README line 3086) still carries no source locator

Nothing is unsupported, since the proof sketch is complete from the cited targets, but its neighbours each end with a locator. A parenthesis naming Milne, *Arithmetic Duality Theorems*, I §4, Lemma 4.9, p. 56 for the number-field finiteness (the locator *Finiteness of `H¹(G_{K,S}, M)`* already has), and saying that the uniform form and the function-field argument are the roadmap's own, would let a reader place the statement.

## N02 — The *In Tau Ceti* note of §R02.4.4 (README lines 3155–3168) names a library commit later than the pinned one

At the Tau Ceti commit this repository pins (`2fd255d`) the directory `TauCeti/NumberTheory/NumberField/RestrictedRamification/` and the file `TauCeti/Topology/Algebra/Group/OpenSubgroup/BoundedIndex.lean` do not exist, so a reader who searches the pinned library for the three theorems finds nothing. The note (and the description, which repeats the hash) is true of `2a9233e5`; saying "later than the pinned commit" would make that plain until the pin reaches it.

## Previous findings

- The previous review, of this same head, had no finding (no R-numbered point).
- Its C01 (the description cited SelmerIwasawaCohomology §2.23a as if on `main`) is repaired: the description now reads "The open revision of SelmerIwasawaCohomology uses it in this form in its §2.23a", and §2.23a exists at that revision's head with §D7.7.3 on its *Needs:* line.
- Its N01 and N02 are not repaired (the folder did not change); written again above under the same numbers.

## Verified sound

| Statement | Instance | Computed: one side | Computed: other side | Result |
|---|---|---|---|---|
| Uniform vanishing (§R02.4.4), as the description states it | `G = U = C₄`, `m = 2`, `B = ℤ/2` trivial | `Hom(C₄, ℤ/2)` has order 2; `V = N = C₂`, open normal, `⊆ U` | cocycles = `Hom(C₄, ℤ/2)`; both vanish on `C₂`; `H¹(C₄/C₂, ℤ/2) = ℤ/2 = H¹(C₄, ℤ/2)` | holds |
| Same, exponent hypothesis | `G = U = C₄`, `m = 2`, `B = ℤ/4` (so `mB ≠ 0`) | `N = C₂` as above | identity `C₄ → ℤ/4` is a cocycle, value 2 on the generator of `C₂` | excluded by `mB = 0`, as the description's "of exponent `m`" says |
| Cochain tensor comparison (§D7.3), as the description states it | `G = C₂`, `A = 𝔽₂[ε]/(ε²)`, `ρ = A`, `M = 𝔽₂`, `n = 1` | `C¹(C₂, A) ⊗_A 𝔽₂`: `A² ⊗ 𝔽₂`, dimension 2 over `𝔽₂` | `C¹(C₂, 𝔽₂)`: functions on 2 points, dimension 2; map `c ⊗ 1 ↦ c mod ε` onto | isomorphism; `C¹ = A²` free, flat |

The rows of the previous review for the statements themselves stand as in that review, of `4ea5e62`; the diff since then changes no statement.

- Title and description read against the head and the diff from `main` (261 lines, `README.md` only): every sentence of the prose checked; 1 out of date (C01); the title's two section numbers are right (README lines 5034 under §D7.3, 3086 under §R02.4.4).
- Description's claims about the change confirmed in the diff: the Checks `M = A`, `M = A/I` and the `ℤ_p[[T]]` example leave *Nakamura cochain tensor comparisons* and reappear (as `A⟦T⟧`) under the new statement; its *Needs:* line now names the new statement in place of *Adic continuous-map flatness*; `Suggested.lean` unchanged; no heading or layer removed.
- Citations resolved: ShortGRH/SelmerBoundsForAnticyclotomicTwists §2.1 on `main` (README lines 330–331 carry the quoted method; the file does not name ArithmeticGaloisDuality, as the description says); SelmerIwasawaCohomology on `main` (§2.23 then §2.24, no §2.23a) and at its open revision (§2.23a present; §D7.3 cited twice); PerfectoidTowers §P9.0 *Comparison with the canonical carrier for compact coefficients* on `main` (README line 1637), already a supplier at the merge base.
- Library: Tau Ceti pin `2fd255d` opened; the two files of the *In Tau Ceti* note are absent there (N02).
- Seeded sample: none of its fifteen targets lies in a changed passage (no passage changed since the reviewed head); not reopened.
- Dependency check: `depcheck: 94 roadmaps, 1066 edges, 0 problem(s)`; no UPWARD or CYCLE line. No file changed outside the folder. The automatic checks all pass.
- Elaboration: `lake env lean` on `TauCetiRoadmap/ArithmeticGaloisDuality/Suggested.lean` gives 12 `sorry` warnings and nothing else; the file is identical to `main`'s.
- Other open pull requests changing this folder: one merges cleanly with this head; the other is ordered after this one by the description's merge-order paragraph. No id dropped on either side.

Overlap check: read SelmerIwasawaCohomology (main and its two open revisions), NoncommutativeAndEquivariantIwasawa, InverseGaloisAndArithmeticFundamentalGroups; nothing shared. Both new statements are stated here only; the open revision of SelmerIwasawaCohomology cites §D7.3 and §D7.7.3.

Source independence: changed passages only; none changed since the reviewed head, so 0 passages compared this round (the previous review compared 5 with Nekovář, none shared); largest share MilneADT, 86 of about 190 source mentions; contents not compared, since no layer is added, removed or reordered.

Research link: §D7.3 is the degreewise base change beneath Nekovář's Selmer complexes (2006, §3.4) and Nakamura's comparisons for rank-two universal deformations (arXiv 2006.13647, Appendix B); the Poitou–Tate and Euler-characteristic formulas are the duality inputs of Selmer-group and deformation-theoretic arguments. Rests on the README's summary and on Nekovář §3.4 and §6.2 as read.

## Not verifiable

- Neukirch–Schmidt–Wingberg, VIII §1 and §3, the locators of the function-field targets the new proof cites: no text held; untouched statements.
- Nekovář §4.2.1–4.2.9 and Pottharst §1, the locators of *Cohomological finiteness and perfect amplitude*: untouched, not reopened this round.
- The description's account of how the text was drafted and re-read (which models, how many corrections) is not something the files show.

## Source issues

- none

## For the human reviewers

- none
