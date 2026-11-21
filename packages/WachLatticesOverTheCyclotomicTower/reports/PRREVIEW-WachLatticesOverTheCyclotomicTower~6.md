# Review of WachLatticesOverTheCyclotomicTower (pull request #2899 at c3d9386)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/WachLatticesOverTheCyclotomicTower/`
**Verdict:** accepted

**Summary.** Accepted, with no findings: this is an incremental re-review of the one line changed since `2a190e3` (the third Check of 6.8) and of the pull request's title and description. The Check now names the element `φ(ψ(Xx))` that the route of 6.7 (4) contains, and the claim it makes was recomputed and holds; the description now states `F(ζ_p)` and the five suppliers, and agrees with the head. Two format notes are carried over, none blocking. The human reviewers still decide on scope and licence: 6.6–6.11 rest only on a formal proof announced on 20 November 2026 whose text could not be opened.

## N01 — Three citations name a paper or a range of sections where a numbered statement exists

Unchanged at this head. For 6.4 (8) (line 141), Wach 1996: the Théorème on p. 380 with Remark a) on p. 381. For `γ − 1` on `ψ`-zero parts and the complex in 6.7 (line 385), Herr 1998: Théorème 3.8 (1), p. 584, and Théorème 2.1, p. 572, in place of "§§2–4". Cherbonnier–Colmez 1999 (lines 385, 858) has no locator.

## N02 — The family index and the description say that the family "follows" a source

Unchanged at this head: the index (index README, line 9) and the description say "The family follows the formal Lean proof". Would "The theorems of the family are those of the formal Lean proof of …" do, with the sentence on generality kept?

## Questions for the author

- The References give [FormalProof] as a repository on GitHub (line 860), without a commit. At the previous round the one file tried there, at the path cited for 6.4 (1), was not found, and the announcement names archives on its author's own site ([Announcement] line 53). Which commit or archive do the fifty paths refer to? A pinned commit in the References would let a reader open them. (Not tried again this round: the change does not bear on it.)

## Previous findings

The previous report had no finding (R); its small corrections and format notes are accounted for here.

- C01 — repaired: the description now reads "containing the images of the embeddings of `F(ζ_p)`" and "The README cites five suppliers by name and section, all on main", listing the five of the supplier contracts.
- C02 — repaired: the Check of 6.8 (line 448) reads "the element `φ(ψ(Xx))` of the route of 6.7 (4) need not lie in `Xφ^*N₀`"; the route (lines 373–376) contains that element. No new problem.
- N01 — not repaired: line 141 "Wach 1996 (the criterion of (8))"; line 385 "Herr 1998, §§2–4; Cherbonnier–Colmez 1999". Written again as N01.
- N02 — not repaired: index README line 9 and the description, "The family follows the formal Lean proof". Written again as N02.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 6.8, third Check (`v_i ≥ 1` in the high type), against the route of 6.7 (4) | `v = 0`, `N₀ = k[[X]]`, `x = 1 ∈ F = φ^*N₀`; then `v ≥ 1` | `v = 0`: `ψ(X·1) = 1` (6.7 (3a), `a = 1 ↦ X⁰`), `φ(1) = 1 ∉ Xφ^*N₀ = X^{1−v}φ^*N₀`. `v ≥ 1`: `φ(ψ(Xx)) ∈ φ^*N₀ ⊂ X^{1−v}φ^*N₀` | Check true; names an element of the route | none |
| 6.7 (4), ranges used by the route (cited by the Check) | `v = 0`, `v = 1`, `v = p − 2` | `a = −v ∈ [2−p, −1]` fails only at `v = 0`; `1 − v ≥ 3 − p` holds for `v ≤ p − 2` | holds | none |

The rows for the untouched statements stand as in the previous review, of `2a190e3`.

- Changed passage: one line (README line 448); no statement, section number, supplier or Lean declaration changes. No file changes outside the folder since `2a190e3`.
- Source locators read this round: 0 (the changed line cites no source; the seeded sample falls outside it and stands as verified at `2a190e3`: 14 locators read there, 50 into [FormalProof] not read).
- Cross-roadmap citations: the five suppliers named by the description (PhiGammaModulesAndIwasawaCohomology, PadicPeriodRings, FiniteFlatGroupsAndIntegralPadicHodgeTheory, PadicHodgeTheory, PadicLocalLanglandsForGL2Qp) are folders on main and precede this roadmap in the candidate merge order (positions 34, 24, 73, 133, 35 against 444).
- Dependency check: `depcheck: 170 roadmaps, 1988 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration of `Suggested.lean`: no message, exit 0; it declares nothing, so there is no signature to compare and no one-tactic probe to run. The four headlines need the Wach lattice `N(T)`, absent at both pins; the docstring names each.
- Automatic checks: all passed in the worker's run. Run with the default order they report this roadmap as not yet listed in the merge order and the three family-index files as outside the folder, exactly the two exceptions the description states; neither is a defect (the index is the pull request's own).
- Title and description against the head: adds a new roadmap (927 lines, 23 headings, no Lean declaration): stated; hypothesis `F(ζ_p)`, the five suppliers, the three consumers, the empty `Suggested.lean`, the index files carried: all agree with the head. No sentence contradicted, no change left unstated.

Overlap check: read SelmerLengthBoundsAndLocalLifting, PhiGammaModulesAndIwasawaCohomology, PadicHodgeTheory, FiniteFlatGroupsAndIntegralPadicHodgeTheory, LengthBoundsInPadicFamilies, CongruenceModulesOfThetaLifts (as at the previous round; the change touches no owned object); nothing shared. No other open pull request changes this roadmap, and none drops an id it cites.

Source independence: changed passages only: 1 passage compared with 0 sources (it cites none and is the roadmap's own remark on its route), none shared; largest share FormalProof, 50 of 67 locators, text and layout not readable; the arrangement was not compared again (no layer added, removed or reordered).

Research link: Wach modules of crystalline representations (Wach 1996; Berger 2004) and Herr's complexes (Herr 1998); 6.10 (2) extends Berger 2004, Proposition IV.1.3. The family's other roadmaps use 6.4–6.11 towards the formal proof of the Riemann hypothesis for Dirichlet L-functions announced by Alpöge (2026). Rests on the README and the texts read.

## Not verifiable

- [FormalProof]: the fifty file paths and declaration names cited in 6.4–6.11 (the only source of 6.6, 6.8, 6.9 and 6.11); the repository named in the References is in no class of host the source service reads.
- Cherbonnier–Colmez 1999 and Fontaine 1990: not among the texts held; cited without locators, for standard facts.

## Source issues

- none

## For the human reviewers

- **Scope.** 6.6–6.11 (lattice families, counting theorem, position data and residual bound, carries) cite only [FormalProof], announced 20 November 2026 with no written proof ([Announcement] lines 45–49); no refereed source states them. 6.4, 6.5, 6.10 (2) have refereed sources.
- **Licence.** The licence of the [FormalProof] repository could not be read. The README cites fifty of its file paths and declaration names; `Suggested.lean` declares nothing, so no Lean is adapted from it.
- **Not tested.** [FormalProof] has the largest share of the locators (50 of 67); its text and file layout could not be read, so wording and arrangement were not compared with it.
