# Review of GraphReconstruction (pull request #3130 at b373666)

**Verdict:** needs changes

**Summary.** Changes are needed for one reason only: the last sentence of the route of 2.2 (Nash-Williams' lemma) writes the exponent identity with the wrong difference, an equation that is false whenever `F ≠ G`; the repair is one symbol. Every stated result, definition and Check was recomputed and found correct, including the README's counts on small graphs and all locators into Gardner's notes and slides. There is one format note and no small correction. Three points are left for the human reviewers: the single-source concentration on one textbook section read through a third party's course notes, Kelly's paper not read, and the two outside Lean developments.

## R01 (P2) — The route of 2.2 ends with the equation `e(G) − e(X) = e(G) − e(F)` at `X = G`, which is false unless `F = G`

An implementer who follows the route to fix the sign reads, in the last sentence of the route of 2.2 (README line 309), "With `e(G) − e(X) = e(G) − e(F)` at `X = G` this is the claim." At `X = G` the left side is `0`, so the sentence asserts `e(G) = e(F)`. The README's own example refutes it: for `G = P₃ ⊔ K₁` and `F = ⊥` the left side is `0` and the right side is `2`. The exponent in the displayed sum two paragraphs above is `e(X) − e(F)`, and it is that exponent which becomes `e(G) − e(F)` at `X = G`; the sign in the statement of the lemma, and every computed value in the Checks (`10 − 8 = 2`, `6 − 8 = −2`, `2 − 0 = 2`; `−6, 6, −6, 6` for `K₁,₃`), agree with this reading, so the stated result is not affected.

The smallest change: write "With `e(X) − e(F) = e(G) − e(F)` at `X = G` this is the claim."

## N01 — One Tau Ceti name is given without its namespace

In the Conventions, under Copies (README line 51), `card_injective_hom_eq_labelledCopyCount` appears bare; everywhere else it is `SimpleGraph.card_injective_hom_eq_labelledCopyCount`, which is the declaration's name at the pin.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.0 `IsHypomorphic`, `IsReconstructible` | all iso classes, `n ≤ 6`, multiset decks; `K₂` vs `2K₁`; relabelling `H.comap τ` | deck collisions: only `n = 2` (`K₂`, `2K₁`); 1, 2, 4, 11, 34, 156 classes for `n = 1..6` | Check true; identity-labelled form equals multiset form | none |
| 1.1 `kelly_lemma` | `n = 0`; `W` empty; `|W| ≥ n`; `K₂`/`2K₁` with `F = K₂`; `K₃`, `F = P₃` | `n = 0`: `0 = 0`; `W = ∅`: `n·1 = n`; `F = K₂`, `n = 2`: counts `1` vs `0`, labelled `2` vs `0`; `K₃`: `3`, `6` | true; `|W| < n` needed | none |
| 1.2 `isHypomorphic_parameters` | `n = 2` pair; `n = 3` single edge; all classes `3 ≤ n ≤ 6` | `(n−2)e = ∑ e(G−v)`; `K₂ ⊔ K₁`: one connected card, `G` disconnected; "connected iff ≥ 2 connected cards" holds on all 205 classes | true; `3 ≤ n` needed | none |
| 1.3 `isReconstructible_of_isRegularOfDegree` | `r = 0`; `K₂` (`n = 2`); count of labelled regular graphs | `2 + 8 + 14 + 172 = 196` for `n = 3..6`; `K₂` 1-regular, hypomorphic to `2K₁` | true; route handles `r = 0` separately | none |
| 2.0 `IsEdgeHypomorphic`, `IsEdgeReconstructible`, `arrowCount` | edge decks, all classes `n ≤ 6`; `P₄ ⊔ K₁` vs `P₃ ⊔ K₂`; edgeless `G` | collisions only at `m = 2` and `m = 3` for `n = 4, 5, 6`; decks `{2K₂⊔K₁, P₃⊔2K₁, P₃⊔2K₁}` vs `{2K₂⊔K₁, 2K₂⊔K₁, P₃⊔2K₁}`; degrees `(2,2,1,1,0)`, `(2,1,1,1,1)` | Checks true; bijection clause excludes the set-only variant | none |
| Conventions, arrow counts on `P₃ ⊔ K₁`, `2K₂` | `F = ⊥`, one edge, `G`, by inclusion–exclusion on `S₄` | `24 − 8 − 8 + 2 = 10`, `24 − 16 = 8`; `8 − 2 = 6`, `8 − 0 = 8`; `2`, `0`; `aut = 2` | agrees with README and with Gardner's notes pp. 9–10 | none |
| 2.1 `kelly_lemma_edge` | `e(G) = 0`; `e(F) = e(G)`; `e(F) > e(G)`; `F = G` on the 2-edge pair | empty sum `0 = 0`; `G − e` has `e(G) − 1 < e(F)` edges so right side `0`; counts `1` vs `0` | true; `e(F) < e(G)` needed | none |
| 2.2 `nash_williams_lemma` | all non-isomorphic edge-hypomorphic pairs `n ≤ 4`, every `F ≤ G`; `K₁,₃`, `F = ⊥`; three hypothesis-dropping cases | differences `2, −2, 2`; `K₁,₃`: `0 − 6 = −6 = (−1)³·6`; no `F ≤ G`: `0` vs `−2`; edgeless vs one edge: `6 − 6 = 0` vs `6`; 72 = 3·(4+4+8+8) | statement true; last sentence of route false (R01) | R01 |
| 2.3 `isEdgeReconstructible_of_criteria` | all `(G, F ≤ G)`, `n ≤ 4`; `k = 0`; the 2-edge pair | (i) holds for 159 pairs, (ii) for 76, all with `G` edge-reconstructible; `k = 0`: `2·aut < aut` false; `2·24 < 4·2` false | true; `2^(k−1)` even-size subsets for `k ≥ 1` | none |
| 2.4 `isEdgeReconstructible_of_many_edges` | `n = 0, 1`; `n = 4`; `n = 7`; `K₄`, `C₄`; parity of `n(n−1)` | `n ≤ 1`: `0 < 0` false in all three; `n = 4`: `m ≥ 4, 6, 9`; `7·log₂7 ≈ 19.65 < 20`, `2²⁰ = 1048576 > 7⁷ = 823543`; `n^n ≥ 2·n!` for `n ≥ 2` | true; natural subtraction at `n = 0` harmless | none |
| Lean vs README | elaborated types of all 12 declarations | binders `[Fintype V] [DecidableEq V]` present on all 7 theorems; the 4 definitions that drop them do not need them; casts in `ℤ` and `ℝ` as README says | same generality | none |

- Source locators checked against the text: 11 (Lemma 2.20, Corollary 2.22, Exercise 2.7.5, Lemma 2.24 and Exercise 2.7.13(a), Theorem 2.25, Lemma 2.26, Theorem 2.27, Corollary 2.28 and Exercise 2.7.8, Figure 2.13 in GardnerBM27Notes lines 63–251; slides 3, 5, 10–12, 13–16 in GardnerBM27Slides lines 20–876). All agree.
- Library declarations opened at the pin: Mathlib `Combinatorics/SimpleGraph/Copy.lean` 95, 114, 135, 159, 506, 527, 550; `Maps.lean` 181, 685, 700; `DeleteEdges.lean` 160, 181; `DegreeSum.lean` 101; `Finite.lean` 144, 652; `Acyclic.lean` 464, 537, 555; `Connectivity/Connected.lean` 340, 364; `Data/Fintype/EquivFin.lean` 345; `Data/Fintype/CardEmbedding.lean` 40; `Data/Nat/Factorial/Basic.lean` 362; `Data/Nat/Choose/Basic.lean` 111; `Analysis/SpecialFunctions/Log/Base.lean` 150; Tau Ceti `Combinatorics/SimpleGraph/Moebius.lean` 53, 58; `Counting.lean` 116, 131.
- Duplication by object: no declaration on hypomorphism, decks, reconstructibility or arrow counts in the pinned Mathlib or Tau Ceti; no roadmap on main or open states any of these results.
- Cross-roadmap citations resolved: 2 (DenseGraphLimits, completed, uses Mathlib's labelled copy count; Regularity has its own labelled induced copy count); neither is a supplier.
- Dependency check: `depcheck: 122 roadmaps, 1385 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the roadmap folder.
- Elaboration: `Suggested.lean` elaborates with seven `sorry` warnings and nothing else. One-tactic probe (`done`, `rfl`, `simp`, `omega`) on a scratch copy: none of the seven theorems closes. Headlines (Kelly's lemma in both forms, shared parameters, regular graphs, Nash-Williams' lemma and criteria, Lovász and Müller): all stated; no padding found.
- Automatic checks: all passed; none set aside.
- Overlap check: read MatchingPolynomial, MatchingTheory, CocliquesColouringsAndTheta, GraphColouring, HamiltonianCycles, Regularity (and GraphSymmetryAndCayleyGraphs 2.2, vertex-deleted characteristic polynomials); nothing shared.

Source independence: 16 passages compared with 2 sources (GardnerBM27Notes, GardnerBM27Slides), none shared beyond forced formulas and a definition of about a dozen words; largest share Bondy–Murty §2.7 as reproduced in GardnerBM27Notes, 11 of 17 locators; contents compared with that section's numbered results: the roadmap's seven targets follow their order, which the dependency lines 1.2 → 1.3 and 2.1 → 2.2 → 2.3 → 2.4 force, omit Corollary 2.21 and Theorem 2.25 and add connectedness, the labelled and hypothesis-free forms and the logarithmic bound: independent. The book itself and Kelly1957 were not read.

Research link: The headline targets are the published results of Lovász (1972), Müller (1977) and Nash-Williams (1978) towards the edge reconstruction conjecture, and Kelly's lemma (1957) towards the reconstruction conjecture, both open; rests on the README's references and scope section and on GardnerBM27Notes (Conjectures 2.19, 2.23).

## Not verifiable

- Kelly (1957), p. 961, Lemma 1 (pp. 961–962) and Lemma 2 (p. 962): the journal's page is on a host the sources service does not classify; the text was requested and not read.
- Bondy–Murty, *Graph Theory*, §2.7 itself: paywalled; its numbered results were checked only as reproduced in Gardner's notes and slides.
- Lovász (1972), Müller (1977): paywalled, cited for attribution only; Nash-Williams (1978): a book chapter, not looked for.
- The README's descriptions of the google-research preprint and of `ReconstructionConjecture.lean` in formal-conjectures: neither was opened. Of SamuelSchlesinger/reconstruction-conjecture only the repository's front page was read (decks matched by a vertex bijection, induced copies: as the README says).
- Ownership against open pull requests was checked through the roadmap search over all open heads, not by reading each.

## Source issues

- **Misprint** in GardnerBM27Notes at the Note after Theorem 2.7.A, p. 7: the source says the three-set formula subtracts the intersection of the first and third sets twice; it should be the first–third and second–third intersections once each; affects nothing.
- **Misprint** in GardnerBM27Notes at the Note before (2.6), p. 10: the source says the intermediate graph lies between `F` and `G` under the name `K`; it should be `X`, as in the rest of the note; affects nothing.
- **Misprint** in GardnerBM27Notes at the first Note, p. 1: the source says the conjecture is due to P. H. Kelly; it should be P. J. Kelly; affects nothing.
- **Error** in GardnerBM27Slides at Lemma 2.26, proof, slide 10: the source says the sum of `|G → H|_X` over `F ⊆ X ⊆ G` is `aut(G)` times the number of copies of `F` in `H`; it should be `aut(F)` times that number; affects nothing.
- **Error** in GardnerBM27Slides at Theorem 2.27, proof, slide 15: the source says more than half of the intermediate graphs have `e(G) − e(X)` even when `e(G) − e(F)` is even; it should be exactly half whenever `e(G) − e(F) ≥ 1`; affects nothing.
- **Misprint** in GardnerBM27Slides at Theorem 2.27, proof, slide 14: the source says the bound in the second starred inequality has base `e`; it should be base `2`; affects nothing.
- **Misprint** in GardnerBM27Slides at Theorem 2.27, proof, slide 16: the source says the sign exponent is `e(G) − e(F)` after substituting `X` for `F`; it should be `e(G) − e(X)`; affects nothing.

## For the human reviewers

- **Scope/sources.** 11 of the README's 17 locators point to one textbook section (Bondy–Murty §2.7), read only through R. Gardner's course notes and slides on his own university page (README lines 507–513); the book was not opened.
- **Licence.** Gardner's notes reproduce the book's numbered statements and quote it; the README cites the book "as reproduced in" them. Whether those notes are an acceptable place to read the book's statements is yours to decide.
- **Not tested.** Kelly (1957) could not be read; its three locators (README lines 115–116, 147–148) are unchecked.
- **Reuse.** The README names two public Lean developments (lines 446–453). SamuelSchlesinger/reconstruction-conjecture shows no licence on its front page; its definitions there differ in shape from `Suggested.lean`. The formal-conjectures file was not opened.
- **Scope.** The scope section names an unpublished 2026 preprint from google-research as context (README lines 441–445); no statement rests on it.
