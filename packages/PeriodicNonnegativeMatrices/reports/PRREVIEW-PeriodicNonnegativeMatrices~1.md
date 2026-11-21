# Review of PeriodicNonnegativeMatrices (pull request #2925 at 60d7b18)

**Verdict:** needs changes

**Summary.** Needs changes, for one sentence: the docstring of `period` in `Suggested.lean` identifies the gcd of the `k` with `0 < (A ^ k) i i` with the gcd of the closed-walk lengths of the quiver for every real square matrix, which fails as soon as an entry is negative (the `1 × 1` matrix `(−1)` gives 2 against 0). All thirteen theorems survived the degenerate-case pass, every numerical value in the Checks was recomputed and agrees, and the file elaborates with `sorry` as its only warning. There is one small correction and one format note, neither blocking. Brouwer–Haemers, the source with the larger share of the locators, could not be read through a channel the project accepts, so its eight locators are unverified and a human should settle the status of that copy.

## R01 (P2) — The docstring of `period` equates two quantities that differ for a real matrix with a negative entry

The definition is declared for every `A : Matrix n n ℝ`, and its docstring in `TauCetiRoadmap/PeriodicNonnegativeMatrices/Suggested.lean` (lines 29–31) says the period "of a real square matrix" is the gcd of the lengths of the closed walks at `i` in the quiver of positive entries, "that is of the `k ≥ 1` with `0 < (A ^ k) i i`". The module docstring (line 11) likewise sets no nonnegativity. An implementer who takes the sentence at its word and tries to prove the identification with the quiver period for the declared carrier will fail.

For `A = (−1)` on one index, `Matrix.toQuiver A` has no arrow, so there is no closed walk and the gcd of the (empty) set of closed-walk lengths is `0`; but `(A ^ k) 0 0 = (−1) ^ k` is positive exactly for even `k`, so `period A 0 = Nat.setGcd {2, 4, 6, …} = 2`. The bridge between the two descriptions, Mathlib's `Matrix.pow_apply_pos_iff_nonempty_path` (`Mathlib/LinearAlgebra/Matrix/Irreducible/Defs.lean`, line 116), has the hypothesis `∀ i j, 0 ≤ A i j`. The README is correct where it states the identification with its hypothesis ("For a nonnegative `A`, `period A i` is the period of the vertex `i`", 1.1, line 94), and its Summary makes nonnegativity a standing assumption; the Lean file does not.

Smallest change: in the docstring of `period`, say "for an entrywise nonnegative `A` this is the gcd of the lengths of the closed walks at `i` in the quiver of positive entries", keeping the definition as it is. It would also help to add the word "nonnegative" where 1.1 of the README says the definition "does not assume irreducibility" (line 81), and to keep `(−1)` as a Check there.

## C01 — The second Check of 1.3 holds for every matrix

The Check "For a primitive matrix the unique labelling by `ZMod 1` is the constant one, and the only class is the whole index set" (README, line 181) is true of every matrix whatever its period, since `ZMod 1` has one element; it cannot tell the period of a primitive matrix from any other value. One that could fail: a primitive matrix has no cyclic labelling by `ZMod 2`, for instance `[[1, 1], [1, 0]]`, whose loop at the first index forces `c 0 = c 0 + 1`.

## N01 — The README cites a Mathlib pull request by number and says what adopting it would replace

In 1.1 (lines 96–100) and in the scope section (line 506) the README names Mathlib pull request 39913, a file path in it, and says that "adopting that file replaces 1.1 and the existence part of 1.3". That sentence describes a state of affairs that will date; the mathematical content, that `period A i` is the period of the vertex `i` of `Matrix.toQuiver A` for nonnegative `A`, is already stated in the preceding sentence and stands on its own.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.1 `period` | `(−1)`; `[[0,1],[1,0]]`; `[[1,1],[1,0]]`; `1×1` zero; `[[1,0],[0,0]]` | `(−1)`: definition 2, quiver gcd 0. Others: 2,2; 1,1; 0; 1,0, as the Checks say | docstring false off nonnegative matrices | R01 |
| 1.1 `period_eq_period_of_isIrreducible` | all 25845 irreducible 0–1 patterns, `n ≤ 4`; reducible `[[1,0,0],[0,0,1],[0,1,0]]`; empty `n` | one period per pattern in every case; reducible: 1,2,2; empty: no index | holds; hypothesis needed | none |
| 1.2 `period_eq_setGcd_cycleLengths` | `[[0,1,0],[1,0,1],[1,0,0]]`; `k = 1` (`finRotate 1 = id`, a loop); `[[1,0],[0,0]]` | cycles 2, 3: gcd 1 = period 1,1,1; reducible: cycle gcd 1, period at index 2 is 0 | holds; hypothesis needed | none |
| 1.2 `period_mem_Icc` | 25845 patterns; directed `n`-cycle; `1×1` `(a)`, `a > 0` | `1 ≤ d ≤ n` always; counts by `(n, d)`: (4,4): 6, (4,3): 12, (4,2): 103, (4,1): 25575; `(a)`: 1 | holds, both bounds attained | none |
| 1.3 `exists_cyclicClasses` | 4-cycle with arrow `0 → 3`; two disjoint 2-cycles; `d = 1` | labellings `(0,1,0,1)`, `(1,0,1,0)` only; reducible: `(0,1,0,1)`, `(0,1,1,0)` not translates; `ZMod 1` trivial | holds | none |
| 1.3 `dvd_period_iff` | 25845 patterns, `m = 1 … n+2`; `m = 0` (`ZMod 0 = ℤ`) | labelling exists iff `m ∣ d` in every case; `m = 0`: no integer labelling around a closed walk, `0 ∤ d` since `d ≥ 1` | holds in both directions | none |
| 1.4 `isPrimitive_iff_period_eq_one` | 25845 patterns; `[[1,0],[0,0]]`; a matrix with a negative entry | primitive iff `d = 1` in every case; reducible: period 1, not primitive; negative entry: both sides false (each contains nonnegativity) | holds without a nonnegativity binder | none |
| 1.4 `pow_period_block` | 4-cycle with `0 → 3`; directed `n`-cycle; a non-surjective `c` | `A²` blocks `[[1,1],[1,0]]`, `[[0,1],[1,1]]`, zero off the classes, squares positive; `Aⁿ = 1`; every labelling is a translate of a surjective one, so no empty class | holds | none |
| 2.1 `exists_diagonal_conj_eq_exp_smul` | `[[0,2],[8,0]]` with `D = (1,−1)`; `d = 1` | `D A D⁻¹ = −A`, entry `D j A j k / D k`; `exp(2πi) = 1`, `D = 1` | holds | none |
| 2.1 `rootMultiplicity_charpoly_exp_mul` | 25845 patterns (exact charpoly); weighted 3-cycle; reducible `[[0,1,0],[1,0,0],[0,0,1]]` | coefficient of `X^(n−k)` zero unless `d ∣ k`, every pattern; `X³ − 8`; reducible: `(X−1)²(X+1)`, multiplicities 2 against 1 | holds; hypothesis needed | none |
| 2.2 `peripheral_spectrum` | 4-cycle with `0 → 3`; weighted 3-cycle; star `K_(1,3)`; `v = (1,−1)`, `r = −1`; `d = 1` | `X⁴ − X² − 1`: `±r` simple, others of modulus `r⁻¹`; `X³ − 8`; `X⁴ − 3X²`; left set empty, right has 2 elements; `d = 1` true, excluded by `hd` | holds | none (see the human reviewers) |
| 3.1 `period_adjMatrix` | `K₂`, `C₄`, `C₃`, `C₅`; one vertex; `K₂ ⊔ C₃` | periods 2, 2, 1, 1; one vertex: 0 and bipartite; disconnected: 2,2,1,1,1 and not bipartite | holds; both hypotheses needed | none |
| 3.2 `isBipartite_iff_neg_mem_spectrum` | one vertex; star; `C₅`; `K₄` minus an edge with `x = e_a − e_b`; `C₄ ⊔ C₃` | `r = 0`, both sides true; `−√3` a root of `X⁴ − 3X²`; `C₅`: `X⁵ − 5X³ + 5X − 2`, `−2` not a root; `A x = 0`; `−2` a root, not bipartite | holds; hypotheses needed | none |
| 3.3 `isBipartite_iff_rootMultiplicity_neg` | `P₃`; triangle; `C₃ ⊔ C₆`; empty `V` | `X³ − 2X`; `2, −1, −1`; degree-9 charpoly with `2` double and `−2` simple; charpoly `1`, all multiplicities 0 | holds in both directions | none |
| Check, 1.3 line 181 | any matrix | `ZMod 1` has one element, so the labelling is unique and constant for every matrix | true, tests nothing | C01 |

- Source locators checked against the text: 6 of 14 (all of Boyle: Definition 3.2 and the following paragraph, p. 3; Propositions 3.3, 3.5, 3.6, p. 4; Theorem 3.9 (2), p. 5); the 8 locators into Brouwer–Haemers were not read.
- Library declarations opened at the pin: 20 in Mathlib (among them `Matrix.IsIrreducible`, `Matrix.IsPrimitive`, `Matrix.toQuiver` and `Matrix.pow_apply_pos_iff_nonempty_path` in `Mathlib/LinearAlgebra/Matrix/Irreducible/Defs.lean`, lines 78–116; `Nat.dvd_setGcd_iff`, `Mathlib/NumberTheory/FrobeniusNumber.lean`, line 98; `SimpleGraph.two_colorable_iff_forall_loop_even`, `Mathlib/Combinatorics/SimpleGraph/Coloring/Constructions.lean`, line 175) and 13 in Tau Ceti (`TauCeti/LinearAlgebra/Matrix/PerronFrobenius/Irreducible.lean`, lines 72–245; `Positive.lean`, lines 268 and 305; `TauCeti/NumberTheory/FrobeniusNumber.lean`, lines 36 and 50; `TauCeti/Probability/MarkovChain/Period.lean`, lines 136 and 154); all exist with the hypotheses the README gives.
- No matrix period, cyclic classes, peripheral spectrum or bipartite-spectrum statement was found in the pinned Mathlib or Tau Ceti, nor in any roadmap on main or open; `Mathlib/Combinatorics/Quiver/` at the pin has no periodicity file.
- Cross-roadmap citations resolved: 5 (ClassicalErgodicTheory §8.4 item 3 and §8.6 item 1, SpectralGraphBounds §1.3 and KernelsAndSpectralMethods §1.4 at their open heads; MarkovChainsAndRenewal Layer 3 on main); each says what the README says of it.
- Dependency check: `depcheck: 171 roadmaps, 1988 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks: all passed. Elaboration of `Suggested.lean`: 13 warnings, each `declaration uses sorry`, no error; no `set_option`, single `import Mathlib`, the one definition has a real body. Elaborated signatures compared with the README statements: they agree, no binder lost.
- One-tactic probe on a scratch copy (`rfl`, `simp`, `infer_instance`, `simp_all [period]`, `decide`, `exact?`, `aesop`): none of the 13 theorems closes. All 13 headline statements of the README are stated; none is declared unstatable.
- The pull request's title and description agree with the head (a new roadmap, 13 theorems and one definition, `import Mathlib` only, no supplier that is not on main); no change outside the folder.

Overlap check: read SpectralGraphBounds, StronglyRegularAndMooreGraphs, MatchingPolynomial, ExpanderConstructions, GraphColouring, and also ClassicalErgodicTheory, KernelsAndSpectralMethods, MarkovChainMixing and MarkovChainsAndRenewal; nothing shared. The primitive case of the peripheral statement is owned by ClassicalErgodicTheory §8.6 item 1 and is excluded here by `d ≥ 2`; MarkovChainMixing 2.1 relates primitivity of a transition matrix to the kernel period of Tau Ceti, a different object from the matrix period of 1.1.

Source independence: 11 passages compared with 1 source (Boyle), none shared; largest share Brouwer–Haemers, 8 of 14 locators, whose text and table of contents could not be read; contents compared with Boyle §3 only: the order 1.1 → 1.3 → 1.4 → 2.1 → 2.2 is the one the `*Needs:*` lines force, 1.2, the divisor characterization of 1.3 and Layer 3 are not in it, and the route of 2.2 is not its route: independent.

Research link: rests on the README. The cyclic classes of 1.3 are the spectral decomposition of irreducible subshifts of finite type (ClassicalErgodicTheory §8.4 item 3); Layers 2 and 3 are the Perron–Frobenius statements of Brouwer–Haemers, Spectra of Graphs (Springer), Theorem 2.2.1 and Proposition 3.4.1, as the README cites them, used throughout spectral graph theory.

## Not verifiable

- Brouwer–Haemers, *Spectra of Graphs*: §2.2 and Theorem 2.2.1 (iii) with its proof, pp. 29–31, and §3.4 with Proposition 3.4.1, p. 46 (cited in 1.1, 1.3, 1.4, 2.1, 2.2, 3.1, 3.2, 3.3). The sources service did not accept the cited host as an author's page, and the published book is behind a paywall; the text was requested, not read.
- The contents of Mathlib pull request 39913 (the quiver period, its vertex independence, a cyclic partition, the file name) as described in 1.1: not in the pinned Mathlib, and not opened.
- The description's account of the author's own exhaustive checks on weighted patterns and on graphs with up to 6 vertices: not repeated beyond the 25845 irreducible 0–1 patterns with at most 4 indices and the values in the Checks.

## Source issues

- **Misprint** in Boyle at Proposition 3.5, proof, p. 4: the source says a diagonal block is the product of the blocks indexed `i` through `i + p`; it should be `i` through `i + p − 1`, a product of `p` blocks; affects nothing.
- **Misprint** in Boyle at Theorem 3.9, proof, p. 5: the source says the product `A₁A₂A₃` is a diagonal block of `A`; it should be a diagonal block of `A³`; affects nothing.
- **Misprint** in Boyle at Theorem 2.2, proof, Step 1, p. 2: the source says the induced map on the simplex sends `v` to `v` divided by its norm; it should be `Av` divided by the norm of `Av`; affects nothing.
- **Gap** in Boyle at Proposition 3.5, proof, p. 4: the source says the diagonal blocks of `A^p` must be irreducible of period one, without argument; it should be derived, as the README's route for 1.4 does; affects the proof.

## For the human reviewers

- **Not tested.** Brouwer–Haemers carries 8 of the 14 locators (README, References, lines 592–596); its text and table of contents were not read, so wording and arrangement were not compared with it.
- **Licence.** The README cites Brouwer–Haemers from a file on a page it attributes to the first author (README, line 593); the sources service could not classify that host. The published book is Springer, Universitext.
- **Scope.** The second source, Boyle's notes (README, lines 597–599), is an unpublished seven-page course text on its author's page; it carries the locators of 1.2–1.4 and part of 2.1–2.2. The statements are standard Perron–Frobenius theory.
- **Scope.** The hypothesis `2 ≤ period A i` of `peripheral_spectrum` is, by the README's own account (lines 296–299), unused by the route and present only because the case `d = 1` belongs to ClassicalErgodicTheory §8.6 item 1, a roadmap that is still an open pull request.
