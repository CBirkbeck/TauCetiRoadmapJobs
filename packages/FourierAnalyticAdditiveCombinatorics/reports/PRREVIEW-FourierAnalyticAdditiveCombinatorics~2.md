# Review of FourierAnalyticAdditiveCombinatorics (pull request #2782 at f165242)

**Verdict:** accepted

**Summary.** Accepted. The one finding of the previous review is repaired: the density increment and Meshulam's theorem are now stated in `𝔽_pⁿ` for every prime `p`, in the README and in `Suggested.lean`, and I recomputed the generalised route (the increment `α²/4`, the step `log_p ≤ log₃`, the case `p = 2`, the constant `6`) and the new Check in `𝔽₅²`; all hold. Both earlier format notes are repaired. There is one small correction, to the pull request's description, and no format note; nothing is left for a human to decide beyond the final approval.

## C01 — The description's list of checked locators does not include the remark of Zhao that 2.2 now cites

The "Prior work" paragraph of the description lists the locators checked in Zhao's book ("Theorem 6.2.1 with its proof, Lemmas 6.2.4 and 6.2.6–6.2.8, …"), and 2.2 now also rests on Remark 6.2.2, p. 208, for the statement that the argument gives `O(pⁿ/n)` for every odd prime (README line 205). The remark is there and says this (Zhao2023 lines 8060–8062), so only the list is short: add "Remark 6.2.2" to it. The enumeration in `𝔽₅²` behind the new Check of 2.1 could likewise be named among the numerical checks.

## Previous findings

- R01 — repaired: "let `p` be a prime, let `A ⊆ 𝔽_pⁿ` be free of nontrivial three-term progressions with `2 · pⁿ ≤ |A|²`" (2.1) and "`|A| · n ≤ 6 · pⁿ`" (2.2); Lean over `Fin n → ZMod p` with `[Fact p.Prime]`; the scope section excludes `2|G|/rk(G)`.
- N01 — repaired: "the author's version on the author's page (last updated June 18, 2024)", which is what the copy says (Zhao2023 line 17).
- N02 — repaired: `Finset.filter` and `Fintype.card_pi` are now listed under "From Mathlib" with their files.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| Conventions: `𝔽_pⁿ = Fin n → ZMod p`, hyperplane cosets | `p = 2`; `p = 5`, `n = 2` | exponent 2: `a + a = 0 = b + b` forces `a = b`, `|A| ≤ 1`; coset `{φ = c}` has `5¹ = 5` of `25` points | true | none |
| 2.1 density increment, every prime `p` | `p = 2`; `n = 0`; `p` odd in general; random maximal sets in `𝔽₅³`, `𝔽₅⁴`, `𝔽₇³`, `𝔽₃⁴` | `p = 2`: `2 · 2ⁿ ≤ |A|² ≤ 1` fails; `∑_j (|α_j − α| + (α_j − α)) ≥ pα²/2` over `p` terms gives `α²/4`; least margin `0.030` (253 sets), `0.039` (20), `0.074` (60), `0.062` (200) | true | none |
| 2.1 Check in `𝔽₅²` | exhaustive search in `𝔽₅`, `𝔽₅²` | `50 ≤ |A|²` needs `|A| ≥ 8`; maxima `2` and `6`, e.g. `{(0,0),(0,1),(1,0),(1,1),(2,3),(4,3)}` | true | none |
| 2.2 Meshulam, constant 6, every prime `p` | `p = 2`; `n = 0`; `A = ∅`; `p ≥ 3` | `p = 2`: `n ≤ 6 · 2ⁿ`; `pⁿ⁻ᵐ < 2/α²` with `2/α² ≥ 2 > 1`, so `log_p ≤ log₃`; `2/(e ln 3) = 0.66972 < 0.67`; `−5 + log₃ 2 = −4.3691 < −4.36`; `5.67/α − 4.36 < 6/α` | true | none |
| 2.2 Check, trivial bound | general `p`; `p = 3`, `n = 6, 10` | `6pⁿ/n < pⁿ` iff `n > 6`; `729 = 729`; `35429.4 < 59049` | true | none |
| `exists_hyperplane_density_increment`, `card_mul_le_six_mul` (Lean) | elaborated types against 2.1, 2.2 | `2 * p ^ n ≤ #A ^ 2` in `ℕ`; densities `↑(#A) / ↑p ^ n` in `ℝ`; `↑(#A) * ↑n ≤ 6 * ↑p ^ n`; `[Fact (Nat.Prime p)]` present in both | agree with README | none |

The rows for the untouched statements (1.1–1.4, 3.1–3.5, 4.1, 4.2) stand as in the previous review, of `5ee9b87`.

- Source locators checked against the text: 3 in the changed passages (Zhao2023 Remark 6.2.2 at lines 8060–8062, printed p. 208 at line 8040; Theorem 6.2.1 at line 8058; the author's-version date at line 17), and the attribution of `2|G|/rk(G)` to Meshulam at CrootLevPach2016 lines 26–28.
- Library declarations opened at the pin: `Finset.filter` (`Mathlib/Data/Finset/Filter.lean:52`), `Fintype.card_pi` (`Mathlib/Data/Fintype/BigOperators.lean:135`), `AddChar.zmodAddEquiv` (`Mathlib/Analysis/Fourier/FiniteAbelian/PontryaginDuality.lean:116`, for every `ZMod n` with `n ≠ 0`, so for every prime), `Real.log_le_sub_one_of_pos` (`Mathlib/Analysis/SpecialFunctions/Log/Basic.lean:307`).
- Cross-roadmap citations: unchanged by the diff; the citation resolver reports none unresolved.
- Dependency check: `depcheck: 174 roadmaps, 1964 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks: all passed at this head. Elaboration: `Suggested.lean` elaborates with 12 `sorry` warnings and nothing else.
- One-tactic probe on a copy of the two restated theorems: `simp`, `rfl`, `omega`, `positivity`, `trivial`, `aesop`, `exact?` close neither. No padding.
- Headline theorems: unchanged in number (12 theorems, 3 definitions); all stated, none unstatable. No file changed outside the folder.
- The pull request's title and description agree with this head (Meshulam for every prime `p`, the bound `2|G|/rk(G)` not treated, the date of Zhao's copy), apart from C01.

Overlap check: read BooleanFunctionAnalysis (the only entry of the three closest-roadmap lists) and searched the open heads and main for Meshulam's theorem and the density increment; nothing shared (SamplingAndDiscreteFourierAnalysis names only Meshulam's uncertainty principle, as out of its scope).

Source independence: changed passages only; 4 passages compared with 2 sources (the statement and route of 2.1, the citation sentence and route of 2.2, against Zhao2023 lines 8058–8062 and 8144–8209; the Meshulam attribution against CrootLevPach2016 lines 26–28), none shared beyond formulas (longest run 4 words); largest share Zhao2023, 13 of 18 locators; no layer added, removed or reordered, so the arrangement stands as compared before: independent.

Research link: Layer 2 is Meshulam's theorem (1995); Layer 3 is the Croot–Lev–Pach lemma (2016) and the Ellenberg–Gijswijt cap set bound (2017), which improved Bateman–Katz (2012); Layer 4 is Bogolyubov's lemma, a step of Freiman's theorem in Zhao (2023), §7.8–7.11. Rests on the README's sources, read here.

## Not verifiable

- Meshulam's paper (J. Combin. Theory Ser. A 71, 1995) was not opened; its statement is taken from CrootLevPach2016 lines 26–28 and Zhao2023 lines 8053–8062.
- The enumeration behind the Check of 2.1 in `𝔽₃³` was not rerun in this round; the new one in `𝔽₅²` was.

## Source issues

- **Misprint** in EllenbergGijswijt2016 at the paragraph before Proposition 2, p. 2 (line 52): the source says the degree bound `d` ranges over real numbers in `[0, 2n]`; it should be `[0, (q − 1)n]`, which is `[0, 2n]` only for `q = 3`; affects nothing.
- **Misprint** in EllenbergGijswijt2016 at Remark 3, p. 2 (line 61): the source says the conclusion for `γ = 0` holds once `n` exceeds `2 m_(d/2)`; it should be once `|A|` exceeds `2 m_(d/2)`; affects nothing.
- **Misprint** in EllenbergGijswijt2016 at the proof of Theorem 4, p. 3 (lines 102 and 120): the source says `d` is an integer and then takes `d = 2(q − 1)n/3`, which need not be one; it should allow real `d`, as its Proposition 2 does; affects nothing.

## For the human reviewers

- none
