# Review of FourierAnalyticAdditiveCombinatorics (pull request #2782 at f165242)

**Verdict:** accepted

**Summary.** Accepted. The folder has not changed since the previous review, which accepted it; this round read the pull request's title and description against the head, sentence by sentence, and found nothing the head contradicts and no change left unstated. The one small correction of the previous review (Remark 6.2.2 of Zhao missing from the list of checked locators) is repaired. There are no findings, no small corrections and no format notes; nothing is left for a human to decide beyond the final approval.

## Previous findings

- C01 — repaired: the description's "Prior work" paragraph now reads "Theorem 6.2.1 with its proof, Remark 6.2.2, Lemmas 6.2.4 and 6.2.6–6.2.8". (The enumeration in `𝔽₅²` behind the Check of 2.1 is still not named among the numerical checks; that was offered, not asked for.)

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.1 Parseval, as the description states it (`∑_ψ |S_A(ψ)|² = |G| |A|`) | all subsets of `ℤ/N`, `N = 1, …, 9`, `∅` included | both sides agree to `10⁻⁸` on every subset; `{0,1} ⊆ ℤ/3`: `4 + 1 + 1 = 6 = 3 · 2` | true | none |
| 1.2 counting identity, trivial triples included | same subsets | `|G| N₃(A)` equals the character side to `10⁻⁷` on every subset | true | none |
| 1.3 counting lemma, no hypothesis on `|G|` | same subsets, even `N` included, `M` the largest nontrivial modulus | `|A|³ ≤ |G|(N₃ + M|A|)` on every subset; trivial group: `M = 0`, `1 ≤ 1` | true | none |
| 1.4 large character sum, nontrivial group | all progression-free subsets of `ℤ/N`, `2 ≤ N ≤ 9` | least value of `max|S_A(ψ)| − (|A|²/|G| − 1)` is `0.667 > 0` | true | none |
| 2.2 constant `6` (description: "derived in the README from the iteration") | the two numerical steps | `2/(e ln 3) = 0.66972 < 0.67`; `−5 + log₃ 2 = −4.36907 < −4.36` | true | none |
| 3.1, 3.5 values quoted in the description (`3 · 2.756ⁿ`) | `x = (√33 − 1)/8`; `n = 0, …, 6` | `x = 0.593070`, base `2.755105 < 2.756`; `m(3, n, 2n/3) = 1, 1, 3, 10, 15, 51, 168`; `3 · 168 = 504`; `m(5, 1, 4/3) = 2` | true | none |
| 4.1 Bohr-set form, Check `A = {0} ⊆ ℤ/7` | `x ∈ ℤ/7` | the only `x` with `cos(2πkx/7) ≥ 0` for `k = 1, …, 6` is `0`; `6 · 1 < 49` | true | none |

The rows of the earlier reviews for every statement stand as in the previous review, of `f165242`: the diff since then is empty.

- The pull request's text against the head: the title and each claim of the description were set beside the README and `Suggested.lean`. Agreeing: a new roadmap (the folder is not on main), topic `math.CO`; 12 `sorry`'d theorems and 3 definitions with bodies (`charSum`, `threeAPCount`, `monomialCount`); the single import `Mathlib`; the four groups of results with their hypotheses (`M ≥ 0`, nontrivial group, every prime `p`, `2 · pⁿ ≤ |A|²`, `γ = 0` allowed, `x > 0`, nonempty `A`); the list of what is not treated (README lines 492–497); no supplier roadmap.
- Source locators checked against the text: the 14 Zhao locators the description lists are at Zhao2023 lines 7911, 8006, 8058, 8060, 8129, 8144, 8158, 8176, 8703, 8720, 9687, 9742, 9751 (Theorem 7.8.3 was read in the earlier rounds), and the date of the author's version at line 17.
- Cross-roadmap citations resolved: FourierDeligneTransform §0.2 on main (README line 58 there); SamplingAndDiscreteFourierAnalysis 1.1 (Parseval's identity) and BooleanFunctionAnalysis 1.3 (Plancherel's identity) at their open heads; LinearAlgebraMethodInCombinatorics (oddtown, Fisher, Frankl–Wilson) at its open head. All are boundaries; none is a supplier.
- Dependency check: `depcheck: 182 roadmaps, 2068 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks: all passed at this head. Elaboration: `Suggested.lean` elaborates with 12 `sorry` warnings and nothing else. Elaborated signatures compared with the README: the two definitions reported as losing `[Fintype G]` or `[DecidableEq G]` (`charSum`, `threeAPCount`) do not need them; every theorem carries its binders.
- No file is changed outside the folder. Headline theorems: 12, all stated, none unstatable; the one-tactic probe stands as in the previous review (file unchanged).

Overlap check: read BooleanFunctionAnalysis (the only entry of the three closest-roadmap lists), and searched the open heads and main for Meshulam's theorem, Bogolyubov's lemma, the Ellenberg–Gijswijt theorem, the Croot–Lev–Pach lemma, cap sets and `ThreeAPFree`; nothing shared (SamplingAndDiscreteFourierAnalysis names only Meshulam's uncertainty principle, outside its scope; CoboundaryExpansion on main names Linial–Meshulam complexes, a different subject).

Source independence: changed passages only; the diff is empty, so 0 passages compared in this round; largest share Zhao2023, 13 of 18 locators; no layer added, removed or reordered, so the arrangement stands as compared before: independent.

Research link: Layer 2 is Meshulam's theorem (1995); Layer 3 is the Croot–Lev–Pach lemma (2016) and the Ellenberg–Gijswijt cap set bound (2017), which improved Bateman–Katz (2012); Layer 4 is Bogolyubov's lemma, a step of Freiman's theorem in Zhao (2023), §7.8–7.11. Rests on the README's sources, read here.

## Not verifiable

- Meshulam's paper (J. Combin. Theory Ser. A 71, 1995) was not opened; its statement is taken from CrootLevPach2016 lines 26–28 and Zhao2023 lines 8053–8062.
- The numerical checks the description reports (the enumerations and random trials of its "AI use" paragraph) were not rerun as described; the rows above are this round's own computations.

## Source issues

- **Misprint** in EllenbergGijswijt2016 at the paragraph before Proposition 2, p. 2 (line 52): the source says the degree bound `d` ranges over real numbers in `[0, 2n]`; it should be `[0, (q − 1)n]`, which is `[0, 2n]` only for `q = 3`; affects nothing.
- **Misprint** in EllenbergGijswijt2016 at Remark 3, p. 2 (line 61): the source says the conclusion for `γ = 0` holds once `n` exceeds `2 m_(d/2)`; it should be once `|A|` exceeds `2 m_(d/2)`; affects nothing.
- **Misprint** in EllenbergGijswijt2016 at the proof of Theorem 4, p. 3 (lines 102 and 120): the source says `d` is an integer and then takes `d = 2(q − 1)n/3`, which need not be one; it should allow real `d`, as its Proposition 2 does; affects nothing.

## For the human reviewers

- none
