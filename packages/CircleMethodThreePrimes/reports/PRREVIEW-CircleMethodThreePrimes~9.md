# Review of CircleMethodThreePrimes (pull request #2543 at 96f5e8c)

**Verdict:** accepted

**Summary.** Accepted. This is an incremental re-review: the folder has not changed since `96f5e8c`, and this round reads the pull request's description against the head and against the change from main. The description now states the retitling of §3.1 and the absorbed contract subsection, so the previous small correction is repaired; every value and count it quotes was recomputed and agrees with the head. One small correction (the description's "no other statement changed" leaves out that §0.2 now covers `q = 0`) and two format notes carried from the previous review remain, none blocking. The three points for the human reviewers stand as before.

## C01 — The description says no other statement changed, but §0.2 now defines the Ramanujan sum at `q = 0` and states multiplicativity for all coprime natural moduli

A reader of the description expects every target outside its list to have "the same hypotheses and conclusion" as on main. On main, §0.2 defines `ramanujanSum q n` "for `q ≥ 1` and `n : ℤ`" and lists multiplicativity "for coprime moduli" under that restriction. At this head §0.2 (lines 132–133, 141–142) defines it for `q : ℕ`, says "for `q = 0` the sum is empty, so `c_0(n) = 0`", and states `ramanujanSum_mul` "for all coprime natural `q₁, q₂`" with "the degenerate pair `{0, 1}` included". The wider statement is true (`c_0(n) c_1(n) = 0 · 1 = 0 = c_0(n)`) and is what `Suggested.lean` already declared (`ramanujanSum (q : ℕ)`, `ramanujanSum_mul` with only `Nat.Coprime q₁ q₂`), so only the description is short. One more bullet under "Statements whose content changed" would cover it, for instance: "§0.2 now defines `c_q(n)` for every natural `q`, with `c_0(n) = 0`, and states multiplicativity for all coprime natural moduli, the pair `{0, 1}` included, as `Suggested.lean` already did; the README had `q ≥ 1`."

## N01 — The scope bullet for AutomorphicSpectralTheory (lines 517–519) still reads as if §1.16 supplied the divisor formula

That section records `S(m, 0; c) = ∑_{d ∣ (m, c)} μ(c/d) d` only among its Checks, and §0.2 here proves it. "whose Checks record the divisor formula and the values …" would match the contract at lines 599–603.

## N02 — "This roadmap owns the additive character … the distance to the nearest integer" (lines 483–484), though §0.1 identifies both with Mathlib objects

Listing the two as kept variants (wrappers on `ℝ` for `Real.fourierChar` and the norm of `UnitAddCircle`) would make the ownership list agree with §0.1 and the Mathlib contract.

## Previous findings

The previous review had no finding (R); its small correction and format notes are accounted for here.

- C01 (previous) — repaired: the description now says "§3.1 is retitled 'Reduced fractions, residue classes and the Siegel–Walfisz proposition' and now defines `SiegelWalfiszBound`, which had its own subsection … under the supplier contracts".
- N01 (previous) — not repaired: N01 above (the folder is unchanged).
- N02 (previous) — not repaired: N02 above (the folder is unchanged).

## Verified sound

| Statement | Instances tried | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Description: "Six new Check bullets, 15 in all" | Check bullets counted on main and at head | main 9 (0.1: 2, 0.2: 1, 2.1: 1, 3.1: 2, 4.1: 2, 4.4: 1); head 15 (0.2: 3, 2.1: 2, 3.2: 1, 4.4: 3) | true | none |
| Description: Ramanujan values (§0.2 Checks) | `q = 12`, `n = 1, 2, 3, 4, 6, 0`; `c₉(3)`, `c₉(1)` | defining sum and divisor formula both `0, 2, 0, −2, −4, 4`; `c₉(3) = −3`, bound `gcd = 3`; `c₉(1) = 0` | true | none |
| Description: `primeExpSum 4 0 = log 12` | `Λ(2) + Λ(3) + Λ(4)` | 2.484907 = `log 12`; primes only 1.791759 = `log 6` | true | none |
| Description: singular series values (§4.4) | Euler product over `p < 2·10⁶`; series over `q < 3000` at `N = 3`; `N = 0` | `𝔖(1) = 2.30096`, `𝔖(3) = 1.53397`, ratio 0.666667; series 1.533975; `𝔖(0) = 0`; `q³` variant factor at 2 is `7/8 ≠ 0` | true | none |
| Description: §4.6 and §4.7 error terms | `A = 1`, `B = 2A + 10 = 12` | minor arcs `(log N)^(−1)`, major `(log N)^(−1) + (log N)^(−24)`, truncation `(log N)^(−6)`; all at most `(log N)^(−A)`; with `B` fixed, `Q^(−2)` is not `O((log N)^(−A))` for `A > 2B` | true | none |
| Description: "§0.2 … No other statement changed" | §0.2 on main against head; `q₁ = 0, q₂ = 1` | main: `q ≥ 1`; head: `q : ℕ`, `c_0(n) = 0`, `c_0 c_1 = 0 · 1 = 0 = c_0`; Lean signature unchanged | one omission | C01 |
| Description: "`Suggested.lean` changes only in three docstrings" | diff against main | 9 changed lines, in the docstrings of `SiegelWalfiszBound`, `vinogradov_threePrimes`, `vinogradov_threePrimes_unconditional`; 0 declarations changed | true | none |
| Description: "ten Mathlib declarations" of the old README | main's Mathlib table; the pin | 10 names; opened at the pin: `vonMangoldt_le_log` (VonMangoldt.lean:152), `psi_le_const_mul_self` (Chebyshev.lean:485, `0 ≤ x`), `exists_int_int_abs_mul_sub_le` (DiophantineApproximation/Basic.lean:94) | true | none |
| §2.2 remark, §4.1 Checks (cited by the description's "every value was computed") | `ψ(19)`, `ψ(113)`, `r(7)`, `R(9)` | 19.26566 > 19; 117.38673 > 113; `r(7) = 1.583495 = 3 (log 2)² log 3`; `R(9) = 4` | true | none |

The rows for the untouched statements stand as in the previous review, of `96f5e8c`.

- Source locators checked against the text: none new; the folder is unchanged and the description cites no locator. The check of helfgott2015 lines 327–332 and 366–384 behind the docstrings stands from the previous review.
- Library declarations opened at the pin: 6 (`ArithmeticFunction.vonMangoldt_le_log`, NumberTheory/ArithmeticFunction/VonMangoldt.lean:152; `Chebyshev.psi_le_const_mul_self`, NumberTheory/Chebyshev.lean:485; `Real.exists_int_int_abs_mul_sub_le`, NumberTheory/DiophantineApproximation/Basic.lean:94; `sum_mul_eq_sub_sub_integral_mul`, NumberTheory/AbelSummation.lean; `Real.fourierChar_apply`, Analysis/Complex/Circle.lean:232; `UnitAddCircle.norm_eq`, Analysis/Normed/Group/AddCircle.lean:223).
- Cross-roadmap citations resolved on main: 3 (SieveMethodsAndPrimePatterns §2.4, `SieveVaughan.vaughan_identity`, README line 2112 and namespace `SieveVaughan` at `Suggested.lean` line 357; AnalyticNumberTheoryPartI §0.32, `psiAP` at `Suggested.lean` line 166 with the body copied here and `siegel_walfisz` at line 328; AutomorphicSpectralTheory §1.16 as in the previous review). One roadmap on main names this one as a consumer of Vaughan's identity (SieveMethodsAndPrimePatterns README line 4132); none consumes it, as the description says.
- Overlap check: read ExplicitCharacterSumsAndSieves, ExplicitMultiplicativeFunctions (open), SieveMethodsAndPrimePatterns, AnalyticNumberTheoryPartI, ExplicitPrimeCounting (main), as in the previous review; the third list is empty; nothing changed in the folder. Shared objects and owners are unchanged: Vaughan's identity, SieveMethodsAndPrimePatterns §2.4; `ψ(x; q, a)` and Siegel–Walfisz, AnalyticNumberTheoryPartI §0.32; the Kloosterman sum, AutomorphicSpectralTheory §1.16; all cited. No open pull request changes this roadmap or drops an id it cites.
- Dependency check: `depcheck: 200 roadmaps, 2198 edges, 0 problem(s)`; no UPWARD or CYCLE line. Nothing changes outside the folder. The automatic checks, run again on this head, all pass.
- Elaboration: `lake env lean` on `TauCetiRoadmap/CircleMethodThreePrimes/Suggested.lean` gives 18 `declaration uses sorry` warnings and nothing else; one import of Mathlib, no `set_option`. No declaration changed, so the signature comparison and the one-tactic probe of the earlier reviews stand.
- Headline theorems (minor-arc bound, asymptotic formula with the count, Vinogradov's theorem with Siegel–Walfisz discharged) are all stated; none is unstatable; unchanged.
- Description against the change from main: the removed and added headings (15 and 7), the retitled §3.1, the removed export-contract, "Ordering" and "Downstream consumers" sections, the four suppliers (none added or dropped) and the unchanged numbering 0.1–4.9 all agree with what it says.

Source independence: changed passages only; the folder has no changed passage, so 0 passages compared; largest share Davenport, *Multiplicative Number Theory*, 6 of 12 locators, whose text and contents could not be read; no layer was added, removed or reordered, so the arrangement was not compared again (helfgott2015: independent, as before).

Research link: the headline is Vinogradov's three-primes theorem (Vinogradov 1937) by Vaughan's identity (Vaughan 1977); Helfgott (2015) makes this circle method explicit to prove the ternary Goldbach conjecture. Rests on the README's references and helfgott2015 lines 327–332 and 1007–1009.

## Not verifiable

- Davenport, Iwaniec–Kowalski, Vaughan (book and 1977 note) and Vinogradov 1937: closed or not held, not read, as in the previous review.
- The description's sentence that every cited supplier section was opened by the author, and that each of the 28 declarations was elaborated with explicit arguments: statements about the author's process, not checkable from the head; the elaboration itself was repeated here.

## Source issues

- none

## For the human reviewers

- **Not tested.** Davenport (GTM 74) has the largest share of locators, 6 of 12 in `TauCetiRoadmap/CircleMethodThreePrimes/README.md`, and is closed: wording and arrangement were not compared with it.
- **Licence.** README "Prior work" (lines 472–477) names `github.com/sthubbar/lean-lab-ci` as a source ported "with its author's agreement". Its root shows a NOTICE file and no LICENSE file; its contents were not compared with `Suggested.lean`.
- **Supplier route.** The unconditional headline consumes AnalyticNumberTheoryPartI §0.32, which main proves through its §0.34, an effective exclusion of Landau–Siegel zeros. §4.9 here uses only that a constant exists, which the classical ineffective theorem gives.
