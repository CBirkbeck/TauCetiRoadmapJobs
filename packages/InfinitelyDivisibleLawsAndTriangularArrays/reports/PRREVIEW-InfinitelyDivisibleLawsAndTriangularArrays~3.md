# Review of InfinitelyDivisibleLawsAndTriangularArrays (pull request #2970 at 76f3359)

**Verdict:** accepted

**Summary.** Accepted: this was an incremental re-review of the 108 lines changed since `c147155`, and no finding remains. The false sentence in the route of §5.3 is replaced by a correct comparison of the centred and uncentred truncated moments (the identity was recomputed and tested on two arrays), and the three small corrections and three format notes of the previous review are all repaired without new problems. There are no small corrections and no format notes. Left to the human reviewers: seven of the eight cited books could not be read, so most locators remain unverified, and the stated prior formalization was not compared with the Lean file.

## Questions for the author

- Are the page numbers given for Durrett those of the Cambridge print of the fifth edition? The author's online copy of the fifth edition (version of 11 January 2019) confirms the theorem numbers 2.2.12, 3.6.10, 3.7.1, 3.8.2, 3.8.8 and 3.8.9, but has its own pagination (Theorem 3.8.9 is on its page 191, the README gives p. 166); the print could not be read.
- §7.1 says that Kallenberg's Theorem 6.17 "omits the condition `E X₀ = 0` from the statement for `p ∈ (1, 2)` and derives it in the proof". Is that the wording of the third edition? The book could not be read; the theorem as stated here (with the condition) is right.

## Previous findings

- R01 — repaired: the route of §5.3 (lines 525–532) now uses `E((X - c)²; |X| ≤ 1) = Var(truncOne X) - c² P(|X| > 1)` and bounds the difference by `max_j (c n j)² ∑_j P(|X n j| > 1)`; no claim that `∑ c² → 0` remains.
- C01 — repaired: the route of §1.3 (lines 133–141) bounds `a n` above by nondegeneracy of `μ₀`, and treats `a₀ = a₁`, `b₀ ≠ b₁` by translation invariance.
- C02 — repaired: "Layer 8 is two independent applications: self-decomposability, of Layers 3 and 5, and the lattice `ℕ`, of Layer 2" (lines 53–54), in agreement with the `*Needs:*` lines of §8.1 and §8.2.
- C03 — repaired: the parenthesis on a scalar form in Tau Ceti is gone (lines 876–878).
- N01 — repaired: the degenerate case is a prose target of §5.4 (lines 542–545), §7.1 needs §5.4 (line 689), and §3.6 and the Dependencies of Layer 3 name Tau Ceti's Bernstein-function formula (lines 392–393, 440–443).
- N02 — repaired: the opening and the module docstring say "the targets in prose belong to the roadmap as well".
- N03 — repaired: `IsStableLaw`, `IsStableLawWithIndex` and the six theorem names, in the README and in `Suggested.lean` alike; no old name is left in either file.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 5.3 route, centred second moment identity | general expansion; `X = 1/n + 3·Bernoulli(1/n)`; `X n j = (-1)^j/√n`, `j < 2n` | `E Y² - 2c² + c²(1 - P(\|X\|>1)) = Var Y - c² P(\|X\|>1)`; both sides `n⁻⁴(1 - 1/n)` (`9·10⁻⁵` at `n = 10`); both sides `0`, error bound `0` | identity and bound true; the earlier counterexample is consistent | none |
| 5.3 route, drifts "in the same way" | `E((X - c); \|X\| ≤ 1)` | `c - c P(\|X\| ≤ 1) = c P(\|X\| > 1)`, sum `≤ max\|c\| ∑ P(\|X\| > 1) → 0` | true | none |
| 1.3 `convergence_of_types`, route | `ν n = law(a n X + b n)`; `a₀ ≠ a₁`; `a₀ = a₁`, `b₀ ≠ b₁`; negative control `μ n = δ₀`, `a n = n` | `\|φ_{μ n}(t)\| = \|φ_{ν n}(t/a n)\|`; `\|φ(u)\| = \|φ(c^k u)\| → 1`; `φ(t)(e^{itβ} - 1) = 0`; control excluded since `μ₀ = δ₀` is degenerate | route sound; agrees with Durrett's Theorem 3.8.9 | none |
| 5.4 prose target, `c = 0` | `gaussianReal b 0`; Lean binder `c : ℝ≥0` | `N(b, 0) = δ_b`; convergence in law to a constant is convergence in probability; `c = 0` admitted by the signature | true, a special case of the headline | none |
| 7.1 via the degenerate case of §5.4 | array `X_j/n`: Cauchy; symmetric tail `1/(x log x)` | `n P(\|X\| > εn) → 2/(πε) ≠ 0`; `1/(ε log(εn)) → 0`, mean `0`, variance sum `≤ 2/log n → 0` | agrees with the Checks of Layer 7 | none |
| 7.2–7.5 renamed statements (`IsStableLaw`, `IsStableLawWithIndex`, six theorems) | Cauchy, Gaussian `N(m, v)`; `#check` of all ten touched declarations | `φⁿ(t) = φ(nt)`, index `1`; `N(nm, nv) = law(√n X + (n - √n) m)`, index `2`; elaborated types unchanged apart from the names; root `IsStable` now resolves to Mathlib's | statements unchanged | none |
| 8 "applications of Layers 3 and 5, and of Layer 2" | `*Needs:*` of §8.1, §8.2 | §§3.2, 3.3, 5.2; §2.3 | agrees | none |

The rows of the previous review for the untouched statements stand as in that review, of `c147155`.

- Source locators checked against the text: 6 Durrett theorem numbers (2.2.12, 3.6.10, 3.7.1, 3.8.2, 3.8.8, 3.8.9) in the author's online copy of the fifth edition (its text, lines 3377, 8632, 8733, 9247, 9512, 9526), with hypotheses read for 3.7.1, 3.8.8 and 3.8.9; of the sampled targets this covers §1.3. Printed pages not checked.
- Library declarations opened at the pin: the directory `TauCeti/Analysis/CompletelyMonotone/Bernstein/LevyKhintchine/` (`Basic.lean`, `Representation.lean`, `Uniqueness.lean`) named by the new `*Needs:*` line; no `IsStableLaw` in the pinned Mathlib or Tau Ceti, nor in any roadmap on main or open.
- Cross-roadmap citations: none added or changed; the paragraph on MathematicalStatisticsAsymptotic §1.2 only lost its parenthesis.
- Dependency check: `depcheck: 133 roadmaps, 1473 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the roadmap folder.
- Automatic checks: all passed. Elaboration of `Suggested.lean` at the pins: exit 0, 51 `sorry` warnings and the eleven `#check` lines, nothing else. A one-tactic probe (`simp_all` with the definitions unfolded) on the renamed self-attraction statement does not close it.
- Pull request text: the counts (49 theorems, 22 definitions, 51 `sorry`s), the suppliers and the import still describe the head; it names no declaration the change renamed.

Overlap check: as in the previous review (read SeriesOfIndependentRandomVariables, MartingaleCentralLimitTheorem, LocalLimitTheorems, MathematicalStatisticsHigherOrderAndResampling, BinomialToBlackScholes, MathematicalStatisticsAsymptotic, StandardDistributions, MathematicalStatisticsNonparametric); the change adds no object and no layer; nothing shared.

Source independence: changed passages only: 1 passage (the route of §1.3) compared with 1 source (Durrett, proof of Theorem 3.8.9, its text lines 9530–9545), none shared, and the routes of §5.3 and §7.1 follow no readable source; largest share Klenke, 32 of 102 locators; contents of Klenke not read (text and contents page unavailable); the change adds, removes or reorders no layer.

Research link: the headline targets (the Lévy–Khintchine formula, the Khintchine–Doeblin–Gnedenko limit theorem, domains of attraction) are prerequisites of Lévy processes and the Lévy–Itô decomposition (Kallenberg 2021) and of local limit and rate theorems in stable domains; this rests on the README's "Downstream consumers" and "Beyond this roadmap" sections.

## Not verifiable

- Every locator into Kallenberg, Klenke, Petrov, Loève and Resnick (Springer, paywalled) and into Billingsley and Applebaum (no legal copy found): among the sampled targets 1.1, 2.1, 2.2, 3.2, 3.3, 3.6, 3.7, 5.1, 5.2, 5.4, 6.3, 7.4, 8.1 and 8.2 are unverified at their locators, and so is the new reference to Kallenberg's proof on p. 138 in the route of §7.1.
- The printed page numbers given for Durrett (only the author's online copy, with other pagination, was read).
- The README's statement about the wording of Kallenberg's Theorem 6.17.

## Source issues

- none

## For the human reviewers

- Not tested: Klenke, *Probability Theory* (3rd ed.), has the largest share of the locators (32 of 102); its text and contents page could not be read, so wording and arrangement were not compared with it.
- Not tested: seven of the eight cited books could not be read; only Durrett's theorem numbers were confirmed, from the author's online copy of the fifth edition.
- Licence: the README's "Prior formalization" section names the Lean project CKMA (Apache 2.0, a repository of the pull request's author) as the starting point for §§2.1–2.3, 3.1–3.2 and 5.5; `Suggested.lean` was not compared with it.
