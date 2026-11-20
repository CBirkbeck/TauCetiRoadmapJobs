# Review of SubspaceTheorem (pull request #2678 at 3d741a9)

**Verdict:** needs changes

**Summary.** Changes are needed for three findings. A Check in 7.2 asserts an inequality that is false at the first index it names. The subclass-rounding lemma of 8.7 is false when its index set is empty. Thue–Mahler over `ℤ`, which this revision adds to `Suggested.lean` as a headline, restates a target that DiophantineApproximationAndTranscendence owns, and this README's own scope table says it is not restated. There are also six small corrections and one question for the author. The human reviewers have a licence question about the cited formalization, and the source cited most (Bombieri–Gubler) could not be read.

## R01 (P2) — The Check of 7.2 claims `|U| ≤ 4 |V|` for `j ≥ 3`, but the inequality fails at `j = 3`

A Check is a test an implementer reproduces, and this one fails at its first stated case. The README says (line 1819): "`U V V V` is a prefix and `|U| ≤ 4 |V|` for `j ≥ 3`". Mathlib's `Real.ofDigits` gives digit `k` the weight `10^(−(k+1))` (`Mathlib/Analysis/Real/OfDigits.lean`, line 38), so the digit `1` sits at position `2^j`. At `j = 3`, `U` is the first `2^3 + 1 = 9` digits and `V` is a block of `⌊(2^3 − 1)/3⌋ = 2` zeros, so `4 |V| = 8 < 9 = |U|`. In general `2^j + 1 ≤ 4 ⌊(2^j − 1)/3⌋` holds exactly when `2^j ≥ 15`, so from `j = 4` on.

The stammering conclusion is unaffected. Write "for `j ≥ 4`", or "`|U| ≤ 5 |V|` for `j ≥ 2`" (the values are `5 ≤ 5`, `9 ≤ 10`, `17 ≤ 25`, …; `|V|` is `1, 2, 5, …`, strictly increasing).

## R02 (P2) — The 8.7 subclass lemma is false when the prime set `P` or the index type `ι` is empty

This is a target that the counting statements consume. As written (lines 2095–2097) it cannot be proved. When `P = ∅`, or `ι` is empty, there are no `u p i` and no `k p i`. The sum `∑ k p i / N` is then `0`, while the required lower bound `1 − #P · card ι / N` equals `1`. For nonempty `P × ι` the statement holds:

- If `b < 1`, the floor rounding of the Check works.
- If `b = 1`, every `u p i = 1`, and `k p i = N` works.

Add "for nonempty `P` and `ι`" (equivalently `#P · card ι ≥ 1`).

## R03 (P2) — Thue–Mahler over `ℤ` is planned both here and in DiophantineApproximationAndTranscendence, and the README says it is not restated here

This leaves two roadmaps on main planning the same theorem by different routes: DiophantineApproximationAndTranscendence §2.3 through its `p`-adic Subspace theorem, this roadmap through 8.3. It also makes the README contradict itself. 8.4 states "*Thue–Mahler over `ℤ`*, `finite_setOf_natAbs_eval_homogenize_eq_prod_pow` … DiophantineApproximationAndTranscendence §2.3's Thue–Mahler theorem" (lines 1977–1980). This revision adds it to `Suggested.lean` (line 588). Yet the table under "Instances owned by other roadmaps" (lines 2493–2497, row at line 2507) lists "§2.3 `finite_thueMahler` over `ℤ` | 8.4 at `K = ℚ`" among the statements that "this roadmap does not restate". On main, DiophantineApproximationAndTranscendence states `finite_thueMahler` in §2.3 for square-free forms of degree at least 3. Its §4.5 has the finiteness for forms with `a₀ ≠ 0` whose `F(X, 1)` has at least three distinct complex zeros, with an extra factor `m`.

Two repairs would work:

- **Drop the duplicate.** Remove the bullet and the declaration and keep the instance in the table. The unit version of 8.4 at `K = ℚ`, with `S` the given primes, specializes to it.
- **Keep it as a variant.** Say in one clause how it differs from DiophantineApproximationAndTranscendence's statements (it allows a root at infinity and repeated factors), and take its row out of the "does not restate" table.

## C01 — Convention 2 still says every form of the Subspace Theorem carries `[Nontrivial ι]`, but 6.1 no longer does

Convention 2 says (lines 71–74): "Every form of the Subspace Theorem carries `[Nontrivial ι]`". 6.1 (lines 1467–1469) and its declaration (`Suggested.lean` line 334) now drop it, correctly: for empty `ι` the weight is `0`, and for a one-element `ι` the domain is `0` at large levels. A reader who trusts the convention will add the hypothesis back. Would restrict the sentence to the forms stated with `approxProd`, `affineProd` or `generalProd`, and say that 6.1 needs none.

## C02 — 6.2 loses its proposed Lean name, which an open roadmap still cites

HeightsRationalPointsAndObstructions, at its open head (README lines 120 and 2115), consumes "SubspaceTheorem §6.2's `NumberField.exists_finset_submodule_of_approxProd_le`". The section survives in this revision, but the name no longer appears anywhere and 6.2 has no declaration, so that citation stops resolving. Either option would fix it:

- Declare 6.2 in `Suggested.lean` under a name the consumer can cite.
- Add one sentence to 6.2 saying it is 6.3's `exists_finset_submodule_of_approxProd_le_extension` at `F = K`, `w v = v`, so the consumer can repoint.

## C03 — The complexity Check of 7.3 reaches equality only at `n = 0`

The Check says the binary digits of `∑ 2^(−2^k)` "have complexity at most `3n + 1`, with equality for some `n` (computed for `n < 400`)" (lines 1854–1856). I recomputed the factor counts for `n < 400`: `p(1), …, p(5) = 2, 4, 6, 7, 9`, and `p(n) ≤ 2n` for every `1 ≤ n < 400`. Equality with `3n + 1` holds only at `n = 0`, where `complexity a 0 = 1` for every sequence. Would say "at most `2n` for `1 ≤ n < 400`", or drop the equality clause.

## C04 — The 1.3 Check's alternative definition of `A`-numbers coincides with the real one on all of `ℝ`

The Check says (lines 509–512) that "a definition of `A` as "`w_n` bounded" would agree here but the `limsup` of `w_n / n` is what makes the four classes exhaust `ℝ`". By `isANumber_iff` and `w_n ≥ n` for transcendental numbers, both conditions are algebraicity. So the variant agrees everywhere and the four classes still exhaust `ℝ`. The `limsup` only makes exhaustiveness hold by definition rather than by theorem. Would say that, or test a variant that fails: "`w_1 = 0`" excludes `√2`, which has `w_1 = 1`.

## C05 — The 2.1 exponential-moment estimate needs integrability of `exp (−λ x) g x`, not only of `g`

The statement assumes "a nonnegative integrable weight `g` on the line" (lines 550–553). Take `g x = 1/(1 + x²)`: it is integrable, but `exp (−λ x) g x` is not. Lean's integral of it is then `0`, so the right side is `0` for `m ≥ 1` while the left side is positive. Both applications (the indicator of `[0, 1]` and the Beta density) are supported in `[0, 1]`. Would add that hypothesis, or state the estimate with `lintegral`.

## C06 — The overview and the references say the roadmap follows Bombieri–Gubler

The overview says (line 36): "The route is Bombieri and Gubler's, Chapters 6 and 7". The references call the book "The reference for the whole roadmap" and say "the route takes 7.5.3" (lines 2741–2747). The layers are in fact the roadmap's own arrangement:

- Chapter 5 material comes after Chapter 7's.
- The proof of 7.5 precedes the statement of 7.2.
- Layer 3 orders the book's 6.4, 6.2, 7.2.7, 6.2.7, 6.5.

So the sentences misdescribe the plan, and a roadmap does not say it follows a source. Would describe the route by its mathematics (Schmidt's method: the geometry of numbers of parallelepipeds and Roth's lemma in several blocks of variables) and keep the book's locators at the claims.

## Questions for the author

- In the 2.2 Check (lines 594–597), which disc and which normalization give the Jensen bound `P.logHeight ≥ (32 log 2 / (e π)) D − 256 log (D + 1)` over `ℚ(2^(1/256))`? The conclusion is plausible: a lower bound linear in `D` follows from the multiplicity `D/2` at `1` and the product formula. I could not reproduce the constant.

## Verified sound

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| Conventions, untyped places | `|·|^(1/j)`, `j ≤ 4`, points `(1, q)` | factor `q^(−1/j)`, product `q^(−25/12) = H^(−2−1/12)`, equality for every `q` | sound |
| 0.1 places over a place | `ℚ(i)/ℚ` at `2`; `t = 2` power | `2 = −i(1+i)²`, `w(1+i) = 2^(−1/2)` vs `|1+i|_𝔓 = 1/2`; `|2|_𝔓 = 1/4`; `4 > 2` | sound |
| 0.4 Liouville | `K = F = ℚ`, `S₀ = {2}`, `α = 1`, `β = −1`; `ξ = √2`, `3/2` | `1/2 = 1/2`; `mulHeight₁ √2 = 2`, `1/288 ≤ 0.0858` | sound |
| 1.1 Möbius, Northcott | rational `ξ`; `(2X+1)(X−2)` | `w_1 = 0`, exponent `1` (`mahlerExponent_one_add_one`); supNorm `3` vs `2 · 2` | sound |
| 1.2 Wirsing (Lean) | `n = 0`; `w_n = ⊤` | `w_0 = w_0* = 0` at the pin, so `1 ≤ 0` fails; `⊤/⊤ = 0` | sound |
| 1.3 classes (Lean) | algebraic; transcendental; `n = 0` junk | `w_n ≤ D−1` gives `w = 0`; `w_n ≥ n` gives `w ≥ 1`; `w/2 ≤ w* ≤ w` | sound; C04 |
| 2.1 counting, tail | `m = 1, d = 0, t = 1`; `t = 0`; Chernoff `λ = 12ε` | count `1` vs bound `0`; `V_m(0) = 0`; `exp(−6mε²)` | sound; C05 |
| 2.2 auxiliary polynomial (Lean) | `m = 0` | `V₀ = 1` forces `N = 0`; constant has `logHeight 0 ≤ 0` | sound |
| 3.1 classes | `N = 1, |A| = 2`; `N = 0` | `3` labels vs `4` cells; `(c+1)/0 = 0` gives `1 < f a` | sound |
| 3.2 Roth over `K` (Lean) | `κ = 2`, `ξ = √2 − 1`; `κ = 0` | Dirichlet `p/q`, `|p| ≤ q`, infinitely many; `min ≤ 1 = H⁰` | sound |
| 3.3 forms (Lean) | `p`-adic `ε = 0`, `α = 0`, `n = p^k`; target `∞` at `β = 0` | `p^(−k) = |n|⁻¹`; `(max 1 0)⁻¹ = 1` vs `0` | sound |
| 3.4 projective Roth (Lean) | `x = (0, 1)`; `x = (q, p)` | `approxProd = 0`; `q² |α − p/q| / max²` | sound |
| 3.5 Mahler `(p/q)^k` (Lean) | `(3,1)`, `(4,2)`, `k = 0`; Ridout at `β = N q^k/p^k` | integers; left side `≤ e^(−εk) g p^(−2k)` vs `(p^k/g)^(−2−ε')` | sound |
| 3.6 counting | gap principle; window count | `h(β') ≥ c h(β) − log 4`; `h ≥ log 16/(c−1)` gives ratio `(c+1)/2` | sound |
| 3.7 moving targets (Lean) | pairs `(0,0)`, `(2,2)` over `ℚ` | `0 = o(0)`, all indices solutions; `1 + log 2 = O(log 2)` | sound |
| 4.1 domains | `2`-adic, `Q = 3/2`; real; imaginary quadratic | module `ℤ`, covolume `1` vs book `2/3`; volumes `2Q^c`, `πQ^(2c)/|a|²` | sound |
| 4.2 Minkowski over `K` | `Λ = ℤ`, `B = [−1,1]`; `λ` vs `μ` | `2 ≤ 2 ≤ 2`; `(∏μ)^d ≤ ∏λ ≤ c_K^(dn) (∏μ)^d` | sound |
| 4.3 rank (Lean) | `c = 0`; `c = −1`, `Q > 1`; `Q = 1` | `{−1,0,1}`, minimum `1`; domain `{0}`; full rank at `Q = 1` | sound |
| 4.4 Evertse's lemma | `x0 = (N,N)`, `x1 = (0,1)`, `μ = (N,1)` | hypothesis holds; conclusion `N ≤ C` false | sound |
| 5.1 unit normalization (Lean) | one-element `ι`; `S = {2}`, `(2^k)` | `u = x⁻¹` gives affine height `1`; without unit `2^k` | sound |
| 5.4 linear-form Liouville | `2`-adic, `a = z = (1,1)` | `1 ≤ 1/2` fails; factor `2` gives `1 ≤ 1` | sound |
| 5.5 penultimate minimum (Lean) | coordinate forms, exponents `(1, −2)` | `V(Q) = {y = 0}` for `Q > 1`; `V(1) = ℚ²` excluded | sound |
| 6.1 parametric (Lean) | `ι` empty; one element | weight `0`, not `< 0`; product formula gives domain `{0} ⊆ ⊥` | sound; C01 |
| 6.2 coefficients in `K` | one-element `ι` over `ℚ` | `approxProd = 1`, `H = 1`, `1 ≤ 1`; only proper subspace `0` | sound; C02 |
| 6.3 algebraic coefficients (Lean) | `K = ℚ(√2)`, point `(1, 2)` | `H_ℚ = 2`, `H_K = 4`; exponent `−(n+ε)/2` relative to `K` | sound |
| 6.4 affine (Lean) | identity `affineProd = approxProd · (∏ sup)^n` | `S`-integral: `H ≤ ∏_S sup` gives `approxProd ≤ H^(−n−ε)` | sound |
| 6.5 general position (Lean) | `X₀, X₁, X₀+X₁`; `X₀, X₁, X₀` | in general position; repeated member dependent | sound |
| 6.7 on a subspace (Lean) | `κ` empty, `U = ⊤`, `finrank 2` | `generalProd = 1`; solutions `H = 1`, finitely many lines | sound |
| 7.1 exponents (Lean) | rational `α`; `2^(1/3)` | `w_n = 0 = min(n, 0)`; `w = 1, 2, 2, …`; `min n D` contradicts `D − 1` | sound |
| 7.1 Schmidt (Lean) | `ι` empty; zero coordinate | `q^(1+ε) < 1` has no `q ≥ 1`; left side `0`, infinitely many | sound |
| 7.2 criterion | `∑ 10^(−(2^j+1))`, `j = 3` | `|U| = 9`, `|V| = 2`, `4|V| = 8 < 9` | R01 |
| 7.3 complexity (Lean) | `1`s at `2^k − 1`, `n < 400` | `p = 1, 2, 4, 6, 7, 9`; `p(n) ≤ 2n` for `1 ≤ n < 400` | sound; C03 |
| 8.1 two variables (Lean) | `{2,3}`-units; `ℚˣ` | `2−1`, `3−2`, `4−3`, `9−8`; `(n+2, −(n+1))` | sound |
| 8.2 `n` variables (Lean) | `1/2+1/3+1/6`; `(2^k, −2^k, 1)` | nondegenerate; degenerate family infinite | sound |
| 8.3 decomposable (Lean) | `xy(x+y) = 2`; `xy = 1` | `(1,1)`; `(2^k, 2^(−k))` `{2}`-integral, infinite | sound |
| 8.4 Thue, Thue–Mahler (Lean) | `x³−2y³ = ±2^a3^b`; Pell | `(2,1)` gives `6`; `x²−2y² = ±1` infinite | true; R03 |
| 8.5 hyperelliptic (Lean) | `y² = x³−2`; `y² = x²(x−1)` | `(3,5)`; `(t²+1, t(t²+1))` for every `t` | sound |
| 8.6 gcd (Lean) | `(2^k, 2^k)`, `ε = 1/2`; `b = c = 1` | `2^k−1 ≥ 2^(k/2)`; `(ab+1)(ac+1) = 2^(2k)` | sound |
| 8.7 subclasses | `P = ∅` or `ι` empty; `b < 1` | sum `0` vs bound `1`; floor rounding works | R02 |
| 9.1 Theorem A (Lean) | `N = 1`; `S = {2}`, `(2^k, 1)` | `x = 1` a solution; weight `0`, infinitely many | sound |
| 9.2 gap principle | `(1 1; 1 −1)`; `N = 3` | `|det| = 2 = 2!`; `6 > 5.196`; `|det|_2 = 1/2` | sound |
| 9.5 degree example | `T³ − 100T² − 1` | root in `(100, 101)`, conjugates of modulus about `0.1`, `H = α^(1/3) ≈ 4.64` | sound |

- Source locators checked against the text: 9. Evertse2010: Theorem A (line 176), (2.4) (line 185), Proposition 4.1 (line 407) and the proof of Theorem 2.2 (line 623). Evertse1984: Theorem 1 (line 88). AdamczewskiBugeaud2007: Theorem 1 (line 101), Condition `(∗)_w` (line 254). Evertse1996: Lemmas 18 (line 1163) and 27 (line 1520).
- Library declarations opened at the pins:
  - Tau Ceti (`TauCeti/NumberTheory/DiophantineApproximation/` unless a path is given): `mahlerExponent` (`LinearFormExponent.lean`:458); `linearFormExponent` (:127); `mahlerExponent_one_add_one` (:579); `algebraicApproximationExponent` (`AlgebraicExponent.lean`:92), which is `0` at degree `0` (:128); `irrationalityExponent` (`Exponent.lean`:46); `approxDomain` (`Subspace/ApproximationDomain.lean`:86); `IsNondegenerateSolution` (`TauCeti/NumberTheory/UnitEquation/Nondegenerate.lean`:63); `mulHeightAff` (`TauCeti/NumberTheory/Height/Affine.lean`:99).
  - Mathlib: `Real.ofDigits` (`Mathlib/Analysis/Real/OfDigits.lean`:67); `Polynomial.homogenize` (`Mathlib/Algebra/Polynomial/Homogenize.lean`:40).
  - About 55 further cited names located at the pins, none missing.
- Cross-roadmap citations resolved:
  - DiophantineApproximationAndTranscendence on main, §§2.1, 2.5, 2.6 and 2.8, with all nine contracted declarations located.
  - SuccessiveMinima 0.1.2, 1.5 and 2.1.4.
  - HeightsAndUnits Layers 0, 1 and 4; GlobalNumberFields Layer 0.
  - One downstream citation of §6.2 from an open pull request.
- Automatic checks: every check passed. The dependency check reports `depcheck: 193 roadmaps, 2119 edges, 0 problem(s)`.
- Elaboration and signatures: `Suggested.lean` elaborates with 39 `sorry` warnings and nothing else. The one-tactic probe (`rfl`, `simp`, `trivial`, `infer_instance`) closes none of the 39. The six definitions without a section binder (`onePointApprox`, `approxSpan`, `IsGeneralPosition`, `generalProd`, `TriangleAdj`, `IsTriangularlyConnected`) only gain generality.
- The pull request's text against the head: the 49 section numbers are identical to main's; there are 45 Check blocks with 95 bullets, as stated; the seven removed admitted examples, three renamings and added headlines match the diff. There are no changes outside the folder and no machine paths.
- Ownership: searched the open heads and main for the Subspace Theorem, unit equations, Ridout and Roth over `K`.
- Overlap check: read DiophantineApproximationAndTranscendence, SuccessiveMinima and HeightsAndUnits on main, and HeightsRationalPointsAndObstructions and EffectiveDiophantineMethods at their open heads. Shared objects and their owners:
  - The `ℚ` and `ℤ` instances of Roth, the Subspace Theorem, unit and Thue–Mahler equations: DiophantineApproximationAndTranscendence §§1.6, 2.1 and 2.3; Thue–Mahler over `ℤ` is restated here (R03).
  - The quantitative parametric Subspace theorem: DiophantineApproximationAndTranscendence §2.8; 6.1 owns the qualitative form on approximation domains and says so.
  - HeightsRationalPointsAndObstructions consumes §6.2 (C02).
  - EffectiveDiophantineMethods: nothing shared.
- Source independence: 10 passages compared with 4 sources; none shared beyond forced formulas and definitions. The largest share is Bombieri–Gubler, about 51 of 180 source mentions. Contents were compared with Bombieri–Gubler through the section numbers the README cites, and the arrangement is independent: Chapter 5 comes after Chapter 7, 7.5 comes before 7.2, and Layer 3 orders 6.4, 6.2, 7.2.7, 6.2.7, 6.5.
- Research link: Layer 6 is Schmidt's Subspace Theorem in Schlickewei's `S`-adic form (1972, 1977), and Layer 9 is the elementary half of Evertse's quantitative theory (2010). 7.3 is Adamczewski–Bugeaud's complexity theorem (2007) and 8.6 the Corvaja–Zannier gcd bounds (2003–2005), both applications of the theorem. This rests on the README's references, Evertse2010 §2 and AdamczewskiBugeaud2007 Theorem 1.

## Not verifiable

- Bombieri–Gubler, *Heights in Diophantine Geometry* (Cambridge, 2006): the locators of 0.1, 0.4, 2.1, 3.1, 3.5, 3.6, 3.7, 4.1, 6.2 and 6.3. The book has no open copy and none is held locally.
- Bugeaud, *Approximation by Algebraic Numbers* (Cambridge, 2004), Chapter 3, for 1.1 and 1.3: no open copy, none held locally.
- Mahler 1932 (Crelle 166), for 1.3: the DOI lands on a publisher host with no open copy.
- Koksma 1939, for 1.3: Springer paywall.
- Mahler 1957, Davenport–Roth 1955 and Ridout 1958 (Mathematika), Schmidt 1972 (Annals), Schlickewei 1977 (Arch. Math.) and Morse–Hedlund 1938 (Amer. J. Math.): publisher paywalls.
- The Jensen constant of the 2.2 Check, which I could not recompute.

## Source issues

- **Misprint** in Evertse2010 at Proposition 4.1, p. 12: the statement bounds the max norm `‖x‖` of the solutions in the window; it should bound the height `H(x)`, as the proof's set `T` and its use in Theorem 2.1 do; affects nothing.

## For the human reviewers

- **Licence.** The README's Provenance section (lines 2361–2372) maps every milestone to `rwst/Subspace-Theorems` at `09835cb` (Apache 2.0, "by the author of this roadmap"). `Suggested.lean` was not compared with that repository.
- **Not tested.** Bombieri–Gubler, the source with the largest share of locators, could not be read legally. The wording comparison did not cover it, and contents were compared only through the section numbers the README cites.
