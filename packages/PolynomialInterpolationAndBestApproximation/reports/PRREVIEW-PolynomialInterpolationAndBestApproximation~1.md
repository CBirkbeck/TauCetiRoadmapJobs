# Review of PolynomialInterpolationAndBestApproximation (pull request #2562 at c715e3e)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every statement was instantiated on its degenerate cases (no node, one node, `n = 0`, `a = b`, `a > b`, `δ ≤ 0`, `λ = 0`, `M = 0`) and every number printed in a Check that could be recomputed here was recomputed and agrees; the three sources were read at every locator, and the 65 library declarations opened exist at the pins under the cited names and files. There is one small correction (the Check of 1.3 credits the library with a uniqueness statement it proves only for `n ≥ 1`) and one format note (three page locators are off by one page); neither blocks. Two facts are left for the human reviewers: the main source is a set of unpublished lecture notes, and the subject is classical.

## C01 — The Check of 1.3 credits the library's extremal property with a uniqueness it gives only for `n ≥ 1`

In the second Check of 1.3 (README line 155), "By the extremal property of `T_{n+1}` in the library … every other choice of `n + 1` nodes gives this `f` a larger largest error" is stated for all `n`. The strict half of the library statement, `Polynomial.Chebyshev.leadingCoeff_eq_iff_of_forall_abs_le_one` (`Mathlib/Analysis/SpecialFunctions/Trigonometric/Chebyshev/Extremal.lean`, line 220), carries `hn : 2 ≤ n` on the degree, so for node polynomials of degree `n + 1` it covers `n ≥ 1` only; the Scope section says exactly this ("with equality, when `n ≥ 1`, only at the Chebyshev points"). The sentence itself is true for `n = 0` as well, since `|x − c|` has largest value `1 + |c|` on `[−1, 1]`, least only at `c = 0`, but not by the library. Either add "for `n ≥ 1`; for `n = 0` directly" to the Check, or drop the attribution there and keep the pointer to the Scope section.

## N01 — Three page locators into Sun's notes are off by one page

In 2.2 (line 202) the sufficiency argument of Theorem 3.5.1 is on pp. 36–37 (p. 35 has only the statement); in 2.3 (line 229) the proof of Theorem 3.5.1 runs to the top of p. 39, so "pp. 35–38" would read "pp. 35–39"; in 5.2 (line 492) the value `cos(π/(n + 2))` of the first cosine moment is computed in the proof of Lemma 2.4.4 on p. 14, eqs. (2.4.5) and (2.4.7), while the statement on p. 13 gives the mass `1/2` and the bound (2.4.3).

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.1 error formula | no node; one node; `x²` at `0, 1`; `a = b` with one node; two labels at `0`, `f = 1` | `f(x) = f(ξ)` at `ξ = x`; MVT; `x² − x = (2/2!)·x(x − 1)`; `0 = junk·0`; `1 ≠ 0` | holds; `InjOn` needed | none |
| 1.2 node polynomial | `n = 0`; `n = 1` | `X = C 1 · T 1`; `(X − 1/√2)(X + 1/√2) = X² − 1/2 = T 2/2`; leading coefficient `2^(|n+1| − 1) = 2ⁿ` | holds | none |
| 1.3 Chebyshev bound | `exp`, `n = 2, 5`; `x^{n+1}` | error `0.05647`, bound `e/24 = 0.11326`; `5.180·10⁻⁵`, `1.180·10⁻⁴`; error `2⁻ⁿ` = bound | holds, sharp | C01 |
| 2.1 `Eₙ` | `E₀(x)`, `E₁(x²)`, `E₀(exp)` on `[−1, 1]`; `a > b` | `1`; `1/2`; `(e − 1/e)/2 = sinh 1`; empty interval gives `0` | holds | none |
| 2.2 de la Vallée-Poussin | `x²`, `p = 1/2`, `n = 1`; unordered points `1/2, −1, 1` for `f = x`; `a = b` | least `1/2 = E₁`; least `1/2 > E₁(x) = 0`; no strictly increasing `Fin (n+2)` family | holds; `StrictMono` needed | none |
| 2.3 alternation | `f = p`; `x²`, `p = x/2 + 23/32`; `n = 0`, `f = x` on `[0, 1]`; `[a, a]` | right side holds for `a < b`; values `25/32`, `−25/32` at `−1`, `1/4`, `−7/32` at `1`, two points only, `E₁ = 1/2`; `∓1/2` | both directions hold; `a < b` needed | none |
| 2.4 existence, uniqueness | `x²`, `n = 1`; `[a, a]` | `1/2` best; `x/4 + 1/2` at distance `3/4` (value at `−1`); on `[a, a]` every `p` with `p(a) = f(a)` | holds; `a < b` needed | none |
| 3.1 Lebesgue constant (touched by 3.2, 3.3) | nodes `−1, 0, 1`; four equispaced; one node | `1/8 + 3/4 + 3/8 = 5/4` at `1/2`; `1.63113`; `1` | holds | none |
| 3.2 Lebesgue's inequality | one node `c = 1`, `f = x`; `x³` at `−1, 0, 1` | `2 ≤ 2·1`; `2/(3√3) = 0.3849 ≤ (9/4)(1/4) = 0.5625` | holds | none |
| 3.3 Chebyshev Lebesgue constant | `n = 0, 1, 2, 3, 4, 7`; route bound on 7200 random `θ`, `n ≤ 24` | `0 ≤ 3`; `1`; `1.41421`; `1.66667`; `1.84776`; `2.20221` against `3, 3.44, 3.70, 3.88, 4.24`; no violation of `1 + 4/π + (2/π) log n` | holds | none |
| 4.1 Bernstein, trigonometric | `sin nθ`; `n = 0`; `sin 2θ` with `n = 1` | `t′(0) = n = n·1`; `0 ≤ 0`; `2 > 1` excluded by degree | holds, sharp | none |
| 4.2 Bernstein, algebraic | `T n` at `cos(π/(2n))`; `T 3` at `0`; `x = ±1`; 400 random `p`, degree `≤ 7` | `sin θ · n/sin θ = n`; `|−3| = 3`; `0 ≤ nM`; no violation | holds, sharp | none |
| 4.3 Markov | `T 2` at `1`; `n = 0`; `M = 0`; 400 random `p`; Schur step `sin(π/(2n)) ≥ 1/n` | `4 = 2²·1`; `0 ≤ 0`; `p = 0`; no violation; `(2/π)(π/(2n)) = 1/n` | holds, sharp | none |
| 5.1 modulus, scaling | `√x`, `λ = 1/2`, `δ = 1/2`; `λ = −2`; `δ < 0`; `λ = 0` | `0.5 > 0.3536` so `1 +` needed; `0 ≰ −1`; `0 ≤ 0`; `ω(f, 0) = 0 ≤ ω(f, δ)` | holds; `0 ≤ λ` needed | none |
| 5.2 Jackson | `n = 0`, `f = x` on `[0, 1]`; `a = b`; route constant; kernel `n = 1, 3, 11` | `1/2 > 6·0`; `0 ≤ 0`; `sup_{n<10⁴} = 5.93382 < 6`, limit `1 + π²/2 = 5.9348`; mass `1.0000`, moment `0.5, 0.80902, 0.97094 = cos(π/(n+2))` | holds; `1 ≤ n` needed | N01 |
| 5.3 Bernstein polynomials | `|x − 1/2|`, `n = 1, 2`; `n = 0`, `f = x` | `1/2 ≤ (3/2)(1/2)`; `x² ≤ 1/4 ≤ 3/4`; `B₀ f = f(0)`, error `1 > 0` | holds; `1 ≤ n` needed | none |

- Source locators checked against the text: 18 of 18 (14 in `sun-approx`, 3 in `shadrin-markov`, 1 in `trefethen-atap`); 15 exact, 3 off by a page (N01).
- Library declarations opened at the pins: 65 Mathlib names of the supplier contracts and the Scope section, each found in the file the README names; `TauCeti.exists_finset_deriv_eq_zero` at `TauCeti/Analysis/Calculus/LocalExtr/Rolle.lean` line 51, hypotheses as the README states them.
- No target is already in the libraries: the pinned Mathlib has the endpoint Markov bound (`Extremal.lean` line 283) and uniform convergence of Bernstein polynomials only; no modulus of continuity, Lebesgue constant, best-approximation error or interpolation error was found in Mathlib or Tau Ceti.
- Cross-roadmap citations resolved on main: SpecialFunctionsOrthogonalPolynomialsGeneral 2.5 and 5.3, MathematicalStatisticsNonparametric 5.8, SobolevPolynomialApproximation, Completed/OrthogonalL2Bases; 5 of 5.
- Automatic checks: all passed. Dependency check: `depcheck: 200 roadmaps, 2195 edges, 0 problem(s)`; no supplier roadmap is consumed.
- Elaboration of `Suggested.lean`: 14 `sorry` warnings and nothing else. One-tactic probe (`rfl`, `simp`, `infer_instance`, `simp` with the seven definitions unfolded) on a copy: 0 of 14 theorems close. The file has no `variable` block, so no binder can be lost; the 21 elaborated types were compared with the README statements and agree.
- Headline theorems of the README (interpolation error with the Chebyshev node polynomial and bound; alternation with existence and uniqueness; Markov with both Bernstein inequalities; Jackson): all stated in `Suggested.lean`; none is declared not statable.
- Pull-request text against the head: 14 theorems and 7 definitions, the single import, the constants `3`, `6`, `3/2` and the suppliers all as described; no sentence contradicted.

Overlap check: read IterativeMethodsForLinearSystems, SpecialFunctionsOrthogonalPolynomialsGeneral (the third list is empty); nothing shared. IterativeMethodsForLinearSystems owns the Chebyshev residual polynomial of an interval normalised at `0`, which is not stated here; both cite the same Mathlib extremal lemmas.

Source independence: 25 passages compared with 3 sources (the 18 locators and 7 proof routes: 2.2, 2.3, 3.2, 4.1, 4.3, 5.1, 5.2), none shared beyond formulas and runs of under 7 words; largest share sun-approx, 14 of 18 locators; contents compared with sun-approx: independent (Layer 1 has no counterpart section, Layer 2 draws on §3.5 and §5.2, Layer 3 on §3.7, Layer 4 on §2.1.2, Layer 5 on §2.1.3, §2.4, §3.4, §3.6, in a different order).

Research link: Layer 4 states the first-derivative case of the Markov inequality, whose proofs and extensions to higher derivatives Shadrin (2004) surveys; Layers 1 and 3 are the Chebyshev interpolation theory of Trefethen (2019), Chapter 2. Rests on the README's references and on those two texts as read; the README names no later consumer.

## Not verifiable

- `Eₙ(|x|)` for `n = 4, 8, 10` in the Check of 5.2 (`0.0676`, `0.0347`, `0.0278`): no linear-programming solver was available; `n = 1, 2` were checked by hand.
- The ranges "`n ≤ 200`" and "`n ≤ 2000`" in the Checks of 3.3: recomputed only for `n ≤ 30` (maximum at `±1`) and `n < 300` (value at `1` at most `(2/π) log n + 1`).
- The attributions made in prose without a locator (Cauchy, Chebyshev, de la Vallée-Poussin, Lebesgue, Rivlin, Bernstein, Markov, Schur, Jackson, Popoviciu): the original papers were not read.
- The pagination of the published volume containing `shadrin-markov`: the README cites the author's copy, which is what was read.

## Source issues

- **Error** in sun-approx at proof of Theorem 3.7.2, printed page 46 (sun-approx line 1564): the source says the Lebesgue function of the Chebyshev zeros is periodic in the angle with period π/n and reduces the maximum to one short interval; it should be only even in the angle: for n = 3 it is 5/3 at angle 0 and (2 + √3)/3 at angle π/3; affects the proof.
- **Gap** in sun-approx at proof of Theorem 2.1.1, printed page 6 (sun-approx line 203): the source says the critical point is one of the 2n Rolle zeros of the first derivative of the comparison function, and concludes from zeros of that derivative that the second derivative vanishes; it should be that either derivative gains an extra zero there, so the second derivative has 2n + 1 zeros in a period; affects the proof.
- **Misprint** in sun-approx at proof of Theorem 3.5.1, printed page 38 (sun-approx line 1259): the source says the signed runs must exceed n + 2, the unsigned ones exceed n + 1, and assumes fewer than n; it should be at least n + 2 signed runs, and at most n separating points in the contrary case; affects the proof.
- **Misprint** in sun-approx at Corollary 3.5.3, printed page 39 (sun-approx line 1291): the source says the error of approximation by constants is the degree-n error; it should be the degree-0 error; affects nothing.
- **Misprint** in sun-approx at eq. (2.4.6), printed page 14: the source says the denominator of the geometric sum has n + 1 in the exponent; it should be n + 2, as in the numerator; affects nothing.

## For the human reviewers

- Scope: 14 of the README's 18 locators point to `sun-approx`, lecture notes dated 2011 on the author's university page, not published; the other sources are a 2004 survey in a refereed volume and a SIAM book.
- Scope: every result is classical (the README dates them 1840 to 1935) and appears in standard textbooks; the README names no later theory or roadmap that consumes these targets.
- Licence: `sun-approx` carries a copyright mark and no licence statement; it was read from the author's page and nothing of it is reproduced in the folder.
