# Review of FourierAnalyticAdditiveCombinatorics (pull request #2782 at 5ee9b87)

**Verdict:** needs changes

**Summary.** Changes are needed, for one reason: Layer 2 (the density increment and Meshulam's theorem) is stated for `p = 3` only, although the route written in the README proves both statements, with the same constants, in `𝔽_pⁿ` for every prime `p`, and the cited sources give the theorem beyond `𝔽₃ⁿ`. Every other statement was recomputed and is true as written, all source locators agree with the texts, and `Suggested.lean` elaborates with `sorry` as its only warning. There are no small corrections and two format notes; nothing is left for a human to decide beyond the final approval.

## R01 (P2) — Layer 2 is restricted to `𝔽₃ⁿ`, while its own route proves 2.1 and 2.2 in `𝔽_pⁿ` for every prime `p` with the same constants

A library user who needs the density increment or the `O(pⁿ/n)` bound in `𝔽₅ⁿ` finds neither, and would have to redo Layer 2; the project plans the general statement, not the one prime that is convenient. The sources say the same: on the page of the cited Theorem 6.2.1, Zhao remarks that the argument gives `C_p pⁿ/n` for every odd prime `p` (Zhao2023 line 8060, Remark 6.2.2, p. 208), and Croot–Lev–Pach report Meshulam's theorem as `r₃(G) ≤ 2|G|/rk(G)` for every abelian group of odd order (CrootLevPach2016 lines 26–29, p. 1).

I reran the route of 2.1 and 2.2 with `3` replaced by a prime `p` and `ω = e^(2πi/p)`. In 2.1: 1.4 gives `|S_A| ≥ |A|²/pⁿ − 1 ≥ |A|²/(2pⁿ)` under `2pⁿ ≤ |A|²`; with `α_j = p k_j/pⁿ` one has `|S_A|/pⁿ = |∑_j (α_j − α) ω^j|/p ≥ α²/2`, so `∑_j (|α_j − α| + (α_j − α)) ≥ pα²/2` over `p` terms, and some `j` has `α_j − α ≥ α²/4`: the same increment. In 2.2: `1/α_i − 1/α_(i+1) ≥ 1/5` and `m ≤ 5/α − 5` are unchanged, and `n < 5/α − 5 + log_p 2 + 2 log_p(1/α) ≤ 5/α − 5 + log₃ 2 + 2 log₃(1/α) < 6/α` for `p ≥ 3`, since `log_p ≤ log₃` on `[1, ∞)`. For `p = 2` a set free of progressions has at most one point, so the hypothesis of 2.1 fails and `|A| · n ≤ n ≤ 6 · 2ⁿ`. So `|A| · n ≤ 6 pⁿ` holds for every prime `p`.

The smallest change: state 2.1 and 2.2 (README lines 169–218, the Summary bullet, and `exists_hyperplane_density_increment` and `card_mul_le_six_mul` in `Suggested.lean`) over `Fin n → ZMod p` for a prime `p`, with `3` replaced by `p` in the hypothesis `2 · pⁿ ≤ |A|²`, in the density `p |{a ∈ A : φ(a) = c}| / pⁿ` and in the bound `6 · pⁿ`; keep `𝔽₃³` as the Check, and add the line `log_p ≤ log₃` to the route. Then say in the scope section that Meshulam's bound `2|G|/rk(G)` for a general abelian group of odd order is not treated (or state it, if it is wanted). The pull request's description changes with it.

## N01 — The reference to Zhao's manuscript gives a date the copy no longer carries

The References say "the manuscript of January 2023 on the author's page"; the file there now describes itself as the author's version last updated June 18, 2024 (Zhao2023 line 17). All thirteen page numbers cited agree with it, so only the date would change.

## N02 — Two library names in a `*Needs:*` line are missing from the supplier contracts

`Finset.filter` and `Fintype.card_pi` (3.1, line 251) do not appear under "From Mathlib"; a line there, or dropping them from 3.1, would make the two lists agree.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| Conventions: `N₃`, `ThreeAPFree`, hyperplane cosets | `A = {0,1} ⊆ ℤ/3`; `(ℤ/2)ⁿ`; `(x,y,z) ↔ (x, d = y − x)` | `N₃ = 2`; in exponent 2, `a + a = b + b = 0` forces `a = b`, so `|A| ≤ 1` | true | none |
| 1.1 Parseval for a set | `A = ∅`, `{0}`, `G`, `{0,1} ⊆ ℤ/3` | `0 = 0`; `|G| = |G|`; `|G|² = |G|²`; `4 + 1 + 1 = 6 = 3 · 2` | true | none |
| 1.2 counting identity | `{0,1} ⊆ ℤ/3`; `{0}`; `(ℤ/2)ⁿ` | `8 − 1 − 1 = 6 = 3 · 2`; `|G| = ∑_ψ 1`; `2ⁿ|A|² = |A| · 2ⁿ|A|` | true | none |
| 1.3 counting lemma | `ℤ/5` with `A = G`, `A = {0,1}`; trivial group with `M = −1`; characters of order 2 | `125 = 5 · 25`; `8 ≤ 26.18`; `1 ≤ 0` fails without `M ≥ 0`; order-2 terms `S² |A| ≥ 0`; rest `≤ M(|G||A| − |A|²)` | true | none |
| 1.4 large character sum | `{0,1}² ⊆ 𝔽₃²`; trivial group; `A = ∅` | bound `7/9`, `|2 + 2ω| = 2`; trivial group has no `ψ ≠ 0`; `−1 ≤ ‖S‖` | true; `Nontrivial G` in Lean | none |
| 2.1 density increment | `n = 0`; `𝔽₃³`, `|A| = 8, 9`; general prime `p` | `2 ≤ |A|² ≤ 1` fails; `|A| ≥ 8` since `49 < 54 ≤ 64`; `13/36 > 12/36` forces 4 points; increment `α²/4` for every `p` | true; stated too narrowly | R01 |
| 2.2 Meshulam, constant 6 | `n = 0`, `A = ∅`; `n = 6, 10, 11`; `p ≥ 3`, `p = 2` | `1/(4 + α) ≥ 1/5`; `2/(e ln 3) = 0.6697 < 0.67`; `log₃ 2 = 0.6309`; `n = 11` margin `5.099`; `6 · 3¹⁰/10 = 35429.4` | true; stated too narrowly | R01 |
| 3.1 monomial counts | `m(3, n, 2n/3)`, `n = 0..6`; `m(2,1,2)`; `m(3,2,4)`; `m(5,1,4/3)`; `q = 0, 1` | `1, 1, 3, 10, 15, 51, 168`; `2`; `9`; `2`; `q = 1` gives `1`; complement map sends degree `> d` to `< (q−1)n − d` | true | none |
| 3.2 Croot–Lev–Pach lemma | `𝔽₃`, `n = 1`, `A = 𝔽₃`, `(1, −1, 0)`, `P = 1 − x²`; `P` of degree `≥ q` in a variable | count `3`, bound `2 · m(3,1,1) = 4`, bound without factor 2 is `2 < 3`; reduction by `t^q = t` does not raise total degree | true | none |
| 3.3 Ellenberg–Gijswijt | `γ = 0`; `α = 0`; `n = 0`; caps `n = 1..4, 6` | `γ = 0`: `(a, a, b)` solves, `|A| ≤ 1 ≤ 3m`; `2,4,9,20` against `3, 9, 30, 45`; `504`; `n = 0`: `1 ≤ 3` | true | none |
| 3.4 progressions over `𝔽_q` | `(1, 1, −2)`; `𝔽₄`; `𝔽₅`, `n = 1` | equation is `a₁ + a₂ = 2a₃`, i.e. `ThreeAPFree`; char 2 gives `|A| ≤ 1`; `3 · m(5,1,4/3) = 6` | true | none |
| 3.5 exponential bound | `x = (√33 − 1)/8`, `0.6`, `x ≥ 1`, `x = 0` | base `2.75510`, `2.75521`; `1 + x + x² ≥ 3x ≥ 3x^(2/3)`; at `x = 0`, `n ≥ 1` right side `0 < 1`; minimiser solves `4x² + x − 2 = 0` | true | none |
| 4.1 Bogolyubov, finite abelian group | `A = G`; `{0} ⊆ ℤ/7`; `A = ∅`; `R` = all characters | `R = ∅`; `6 · 1 < 49`, set is `{0}`; `∅` fails, needs nonempty; tail `≤ |A|⁴ − |A|⁵/|G| < |A|⁴` | true | none |
| 4.2 Bogolyubov over `𝔽_p` | subspace of codimension `k` in `(ℤ/2)ⁿ`; `W = ⊥`; `A = V` | `R` has `2ᵏ − 1` characters, `k · 4^(n−k) < 4ⁿ`; kernel of a character has codimension `≤ 1`; `A = V` gives `W = V`, `0 < |V|²` | true | none |

- Source locators checked against the text: 17 of 17 (Zhao2023: 12, all page numbers agree; EllenbergGijswijt2016: Proposition 2 line 55, Theorem 4 line 93 with `γ ≠ 0`, odd characteristic line 27, Corollary 5 line 138; CrootLevPach2016: Lemma 1 line 75).
- Library declarations opened at the pin: 29, all present where cited (for example `AddChar.map_neg_eq_conj` at `Mathlib/Analysis/RCLike/Basic.lean:1292`, `AddChar.sum_apply_eq_ite` at `Mathlib/Analysis/Fourier/FiniteAbelian/PontryaginDuality.lean:192`, `ThreeGPFree.image'` (additive form) at `Mathlib/Combinatorics/Additive/AP/Three/Defs.lean:153`, `Matrix.rank_diagonal` at `Mathlib/LinearAlgebra/Matrix/Rank.lean:423`, `MvPolynomial.ker_evalₗ` at `Mathlib/FieldTheory/Finite/Polynomial.lean:214`, `AddSubgroup.toZModSubmodule` at `Mathlib/Algebra/Module/ZMod.lean:102`). No pinned declaration states Parseval for sets, the counting lemma, a cap set bound or Bogolyubov's lemma.
- Cross-roadmap citations resolved: 4 of 4 (FourierDeligneTransform §0.2 on main; SamplingAndDiscreteFourierAnalysis 1.1, BooleanFunctionAnalysis 1.3 and LinearAlgebraMethodInCombinatorics at their open heads); none is a supplier.
- Dependency check: `depcheck: 182 roadmaps, 2068 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `Suggested.lean` elaborates; 12 `sorry` warnings and nothing else. Elaborated types compared with the README statement for all 15 declarations: they agree; `charSum` and `threeAPCount` do not carry `[Fintype G]`, which their bodies do not need.
- One-tactic probe on a copy: `rfl`, `simp` (with the three definitions unfolded), `infer_instance`, `omega`, `positivity`, `trivial`, `exact?` close none of the 12 theorems. No padding.
- Headline theorems (counting lemma with 1.4, Meshulam with the increment, Ellenberg–Gijswijt with 3.4 and 3.5, Bogolyubov in both forms): all stated in `Suggested.lean`; none unstatable.
- The pull request's title and description agree with the head (12 theorems, 3 definitions, `import Mathlib` only, a new roadmap).

Overlap check: the three closest-roadmap lists are empty; read FourierDeligneTransform, SamplingAndDiscreteFourierAnalysis, BooleanFunctionAnalysis, LinearAlgebraMethodInCombinatorics and Regularity; nothing shared (each Parseval identity is on its own carrier, and 1.1 here is for sets in an arbitrary finite abelian group).

Source independence: 9 passages compared with 3 sources (the routes of 2.1, 2.2, 3.2, 3.3, 3.5, 4.1, 4.2, the statement of 1.3 and the docstring of 3.2), none shared beyond formulas; largest share Zhao2023, 12 of 17 locators; contents compared with Zhao2023: independent (Layers 1, 2, 3, 4 draw on §§6.1–6.2, 6.2, 6.5, 7.8, skipping 6.3, 6.4, 6.6, 6.7 and 7.1–7.7; Layer 1 is for general groups and Layer 3 follows the Croot–Lev–Pach rank argument, not the source's slice-rank proof).

Research link: Layer 2 is Meshulam's theorem (1995); Layer 3 is the Croot–Lev–Pach lemma (2016) and the Ellenberg–Gijswijt cap set bound (2017), which improved Bateman–Katz (2012); Layer 4 is Bogolyubov's lemma, a step of Freiman's theorem in Zhao (2023), §7.8–7.11. Rests on the README's sources, read here.

## Not verifiable

- Meshulam's paper (J. Combin. Theory Ser. A 71, 1995) was not opened; its statement is taken from CrootLevPach2016 lines 26–29 and Zhao2023 line 8053.
- The Checks that report exhaustive enumeration (2.1, 3.2, 3.3, 4.1, 4.2) were not rerun; each is an instance of a statement verified by hand above.

## Source issues

- **Misprint** in EllenbergGijswijt2016 at the paragraph before Proposition 2, p. 2 (line 52): the source says the degree bound `d` ranges over real numbers in `[0, 2n]`; it should be `[0, (q − 1)n]`, which is `[0, 2n]` only for `q = 3`; affects nothing.
- **Misprint** in EllenbergGijswijt2016 at Remark 3, p. 2 (line 61): the source says the conclusion for `γ = 0` holds once `n` exceeds `2 m_(d/2)`; it should be once `|A|` exceeds `2 m_(d/2)`; affects nothing.
- **Misprint** in EllenbergGijswijt2016 at the proof of Theorem 4, p. 3 (lines 102 and 120): the source says `d` is an integer and then takes `d = 2(q − 1)n/3`, which need not be one; it should allow real `d`, as its Proposition 2 does; affects nothing.

## For the human reviewers

- none
