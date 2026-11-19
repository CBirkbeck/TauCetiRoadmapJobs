# Review of CircleMethodThreePrimes (pull request #2543 at 96f5e8c)

**Verdict:** accepted

**Summary.** Accepted. This is an incremental re-review: the folder has not changed since `96f5e8c`, and this round reads the pull request's description against the head and against the change from main. The description now lists the wider §0.2 (the Ramanujan sum at `q = 0`, multiplicativity for all coprime natural moduli), so the previous small correction is repaired, and every count and value it quotes was recomputed and agrees with the head. No finding and no small correction; two format notes carried from the previous review remain, neither blocking. The three points for the human reviewers stand as before.

## N01 — The scope bullet for AutomorphicSpectralTheory (lines 517–519) still reads as if §1.16 supplied the divisor formula

That section records `S(m, 0; c) = ∑_{d ∣ (m, c)} μ(c/d) d` only among its Checks, and §0.2 here proves it. "whose Checks record the divisor formula and the values …" would match the contract at lines 599–603.

## N02 — "This roadmap owns the additive character … the distance to the nearest integer" (lines 483–484), though §0.1 identifies both with Mathlib objects

Listing the two as kept variants (wrappers on `ℝ` for `Real.fourierChar` and the norm of `UnitAddCircle`) would make the ownership list agree with §0.1 and the Mathlib contract.

## Previous findings

The previous review had no finding (R); its small correction and format notes are accounted for here.

- C01 (previous) — repaired: the description now says "§0.2 (Ramanujan sums) now defines `c_q(n)` for every natural `q`, with `c_0(n) = 0` (the empty sum), and states multiplicativity in `q` for all coprime natural `q₁, q₂`, the degenerate pair `{0, 1}` included."
- N01 (previous) — not repaired: N01 above (the folder is unchanged).
- N02 (previous) — not repaired: N02 above (the folder is unchanged).

## Verified sound

| Statement | Instances tried | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Description: §0.2 now covers every natural `q` | main §0.2 against head lines 132–142; `q₁ = 0, q₂ = 1`; elaborated `ramanujanSum_mul` | main `q ≥ 1`; head `q : ℕ`, `c_0(n) = 0`; `c_0 c_1 = 0 · 1 = 0 = c_0`; Lean hypothesis only `q₁.Coprime q₂` | true | none |
| Description: "Six new Check bullets, 15 in all" | Check bullets counted on main and at head | main 9 (0.1: 2, 0.2: 1, 2.1: 1, 3.1: 2, 4.1: 2, 4.4: 1); head 15 (0.2: 3, 2.1: 2, 3.2: 1, 4.4: 3) | true | none |
| Description: Ramanujan values (§0.2 Checks) | `q = 12`, `n = 1, 2, 3, 4, 6, 0`; `c₉(3)`, `c₉(1)`, `c₄(2)` | defining sum `0, 2, 0, −2, −4, 4`, divisor formula the same; `c₉(3) = −3`, `gcd = 3`; `c₉(1) = 0`; `c₄(2) = −2` | true | none |
| Description: `primeExpSum 4 0 = log 12` | `Λ(2) + Λ(3) + Λ(4)` | 2.484907 = `log 12`; primes only 1.791759 = `log 6` | true | none |
| Description: singular series values (§4.4) | Euler product over `p < 2·10⁶`; factor at 3; `q³` variant at 2 | `𝔖(1) = 2.300962`; `𝔖(3) = 1.533974`; ratio `(3/4)/(9/8) = 2/3`; variant factor `7/8 ≠ 0`; each factor `p ∣ N` is in `[0, 1)`, so `0 ≤ 𝔖(N) ≤ 𝔖(1)` | true | none |
| Description: §4.6 and §4.7 error terms | `B = 2A + 10` | minor arcs exponent `5 − B/2 = −A`; major `−A` and `−2B = −4A − 20`; series truncation `−B/2 = −A − 5`; with `B` fixed, `Q^(−2)` is not `O((log N)^(−A))` once `A > 2B` | true | none |
| Description: §1.2, §1.1, §3.1, §4.2–§4.5 quantifiers | each section on main against head | head adds `1 ≤ M ≤ N`, `⌊N/m⌋`, absolute `C`, `q ≥ 1`, `gcd(a, q) = 1`, `2Q³ < N`, integer `N`, `Q ≥ 1`, `N ≥ 1`, `Q > 0`; conclusions identical | true | none |
| Description: "`Suggested.lean` changes only in three docstrings"; 28 declarations | diff against main; elaborated signatures | 9 changed lines in the docstrings of `SiegelWalfiszBound`, `vinogradov_threePrimes`, `vinogradov_threePrimes_unconditional`; 10 definitions and 18 theorems, 0 restated | true | none |
| Description: "ten Mathlib declarations" of the old README; library lacks the roadmap's objects | main's Mathlib table; pinned sources searched for Ramanujan sum, Vaughan, Walfisz, Kloosterman, circle method | 10 names; only hit is the Katona circle method (Combinatorics/KatonaCircle.lean:15), unrelated | true | none |
| §2 Example and §2.2 remark (cited by "every value was computed") | `N = 10` at `α = 1/2` | `−log 2520 + 6 log 2 = −3.673131` | true | none |

The rows for the untouched statements stand as in the previous review, of `96f5e8c`.

- Source locators checked against the text: none new; the folder is unchanged and the description cites no locator.
- Library declarations opened at the pin: 1 again (`sum_mul_eq_sub_sub_integral_mul`, NumberTheory/AbelSummation.lean:128, hypotheses `0 ≤ a`, `a ≤ b`, differentiability on `[a, b]`, `deriv f` integrable on `[a, b]`, as the contract states); the others stand from the previous review.
- Cross-roadmap citations resolved on main: 3 (SieveMethodsAndPrimePatterns §2.4, `SieveVaughan.vaughan_identity` at README line 2112 and `Suggested.lean` lines 357–363; AnalyticNumberTheoryPartI §0.32 at README line 849, `psiAP` at `Suggested.lean` line 166 and `siegel_walfisz` at line 328, eventual in `x` with `∃ C > 0`, and README line 165 calling its constants effective; AutomorphicSpectralTheory §1.16 at README line 1232). No README on main names this roadmap as a supplier.
- Overlap check: read ExplicitCharacterSumsAndSieves, ExplicitMultiplicativeFunctions (open), SieveMethodsAndPrimePatterns, AnalyticNumberTheoryPartI, ExplicitPrimeCounting (main), as in the previous review; the third list is empty; nothing changed in the folder. Shared objects and owners are unchanged: Vaughan's identity, SieveMethodsAndPrimePatterns §2.4; `ψ(x; q, a)` and Siegel–Walfisz, AnalyticNumberTheoryPartI §0.32; the Kloosterman sum, AutomorphicSpectralTheory §1.16; all cited. No open pull request changes this roadmap or drops an id it cites.
- Dependency check: `depcheck: 200 roadmaps, 2198 edges, 0 problem(s)`; no UPWARD or CYCLE line. Nothing changes outside the folder. The automatic checks, run again on this head, all pass.
- Elaboration: `lake env lean` on `TauCetiRoadmap/CircleMethodThreePrimes/Suggested.lean` gives 18 `declaration uses sorry` warnings and nothing else; one import of Mathlib, no `set_option`. No declaration changed, so the signature comparison and the one-tactic probe of the earlier reviews stand.
- Headline theorems (minor-arc bound, asymptotic formula with the count, Vinogradov's theorem with Siegel–Walfisz discharged) are all stated; none is unstatable; unchanged.
- Description against the change from main: the removed and added headings (15 and 7), the retitled §3.1 with the absorbed contract subsection, Convention 12, the removed export-contract, "Ordering" and "Downstream consumers" sections, the four suppliers (none added or dropped) and the unchanged numbering 0.1–4.9 all agree with what it says; no statement outside its list differs in hypotheses or conclusion.

Source independence: changed passages only; the folder has no changed passage, so 0 passages compared; largest share Davenport, *Multiplicative Number Theory*, 6 of 12 locators, whose text and contents could not be read; no layer was added, removed or reordered, so the arrangement was not compared again (helfgott2015: independent, as before).

Research link: the headline is Vinogradov's three-primes theorem (Vinogradov 1937) by Vaughan's identity (Vaughan 1977); Helfgott (2015) makes this circle method explicit to prove the ternary Goldbach conjecture. Rests on the README's references and helfgott2015 lines 327–332 and 1007–1009.

## Not verifiable

- Davenport, Iwaniec–Kowalski, Vaughan (book and 1977 note) and Vinogradov 1937: closed or not held, not read, as in the previous review.
- The description's sentences that the author opened every cited supplier section and elaborated each of the 28 declarations with explicit arguments: statements about the author's process, not checkable from the head; the elaboration itself was repeated here.

## Source issues

- none

## For the human reviewers

- **Not tested.** Davenport (GTM 74) has the largest share of locators, 6 of 12 in `TauCetiRoadmap/CircleMethodThreePrimes/README.md`, and is closed: wording and arrangement were not compared with it.
- **Licence.** README "Prior work" (lines 472–477) names `github.com/sthubbar/lean-lab-ci` as a source ported "with its author's agreement". The previous review saw a NOTICE file and no LICENSE file at its root; its contents were not compared with `Suggested.lean`.
- **Supplier route.** The unconditional headline consumes AnalyticNumberTheoryPartI §0.32, which main proves through its §0.34, an effective exclusion of Landau–Siegel zeros. §4.9 here uses only that a constant exists, which the classical ineffective theorem gives.
