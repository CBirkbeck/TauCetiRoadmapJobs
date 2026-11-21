# Review of RieszSumsOverPrimesAndExceptionalZeros (pull request #2877 at 833bd0c)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/RieszSumsOverPrimesAndExceptionalZeros/`
**Verdict:** needs changes

**Summary.** Changes are needed for one remaining point. Linnik's theorem, the Deuring–Heilbronn repulsion and Gallagher's theorem (1.7b (i)–(iii)) still cite their published sources only by title or chapter. This is the part of the previous round's locator finding that is not yet repaired; every other earlier finding is repaired. I found no false statement: the three headline theorems of `Suggested.lean`, the Checks and the worked values all recompute. There are four small corrections and no format notes:

- the effectivity claims of 1.4g (b) and 1.7b lack a supplier that delivers them;
- one Check of 2.9b states an inequality in the wrong direction;
- the description's claim about the family index does not hold at two sibling heads;
- 0.30b should cite Landau's lemma where its owner states it.

The human reviewers have to decide about the formal-proof source, which is not refereed, and about the sources that could not be read.

## R01 (P2) — Linnik's theorem, the Deuring–Heilbronn repulsion and Gallagher's theorem (1.7b (i)–(iii)) still carry no theorem or page locator

This finding is carried over from the previous review, where it was R04; it is partly repaired. These three results are the published theorems the roadmap is built to reach, and Linnik's theorem is a headline of `Suggested.lean`. Without a locator, a reader cannot set the hypotheses and the shape of the bounds stated here beside the published statements. Those are the width `c₁` of the exceptional pair, the bound `c log(c/((1 − β₁)ℒ))/ℒ`, and the relative error against `E_ψ(x)` with both exponentials.

This head adds locators in two places:

- the character prime number theorem in 1.4g (b), line 166: "Iwaniec–Kowalski, Theorem 5.27; restated as Bennett–Siksek, Theorem 5, (26)". I checked it against BennettSiksek2020 lines 793–807, and it matches.
- Stark's Lemma 8, line 693.

But 1.7b (i), (ii) and (iii) (lines 419, 471, 520) carry no citation at the statement. The References (lines 880–884) cite Gallagher 1970, Linnik 1944, Knapowski 1962 and Bombieri's Astérisque 18 by title only, and Iwaniec–Kowalski by "Chapter 18".

The smallest change is to add a theorem and page locator at (i), (ii) and (iii); a paywalled text may be cited by its locator alone. Where the README's form is its own strengthening, say which published theorem it refines. That may be the case for 1.7b (ii), whose error is relative to `E_ψ(x)` rather than to `x/φ(q)`.

## C01 — The effectivity claimed in 1.4g (b) and 1.7b (ii)–(iv) is delivered neither by the cited text nor by the route's supplier, and 2.9b says that supplier is not effective

Several statements claim effective constants:

- 1.4g (b), lines 159–166, calls `c`, `c₁`, the threshold and the implied constant effective.
- 1.7b (ii)–(iv) and the overview's headline (2) call `L` effective.

Both routes take the zero-free region from ZerosOfLFunctions 6.3–6.4 (lines 181–183 and 491). ZerosOfLFunctions says that the constants of its zero-free regions are existential (its README, lines 2637–2638), and it closes the small conductors by a finite minimum (6.4 (4e), line 1418). The Effectivity paragraph of 2.9b (iv), lines 723–727 of this roadmap, gives exactly this as the reason its counts are not effective. In addition, Bennett–Siksek, cited at line 166, calls `c` effective but the implied constant only "absolute" (BennettSiksek2020 lines 805–806).

The claims themselves are classical and true; what the text lacks is an input that delivers them. One repair is to name an effective degree-one zero-free region as the input of these routes; AnalyticNumberTheoryPartI §0.6 cites Iwaniec–Kowalski Theorem 5.26 for one. Another is to say that the effectivity rests on the cited sources and not on ZerosOfLFunctions 6.4. In either case, attribute the effectivity of the implied constant in 1.4g (b) to a text that states it.

## C02 — In the Checks for 2.9b (line 750), the saving guaranteed with 4 or 8 in place of 12 lies just below `4cS` or `8cS`, not just above

With `c² ≤ c₂/(4(1 + 6n))`, the second term of `η` gives `η log X ≥ 4cS · c(1 + 6n)S/(c(1 + 6n)S + 2n)`. The fraction is below `1`, so the guaranteed saving tends to `4cS` from below, and with 8 it tends to `8cS` from below. The Check's conclusion, that neither constant leaves room for the factor `S`, is unaffected. "Only just above 4cS, and with 8 just above 8cS" would read "just below 4cS, and with 8 just below 8cS".

## C03 — The description says the family index is identical in every pull request of the family, but two sibling heads carry an older text

The description says the family index "is carried, with identical content, by every pull request of the family".

- The family index matches this head in the pull requests that add RiemannHypothesisStatementsAndConsequences (#2885) and QuadraticTwistSelectionOverPrimes (#2878).
- It differs in those that add FiniteReductiveGroups (#2881) and AdelicHeightsAndSuccessiveMinima (#2883). There, lines 9–11 say "follows a complete formal proof" without the attribution, and several list entries are shorter, for example those of TensorInductionAndFiniteGroupInputs and PositivityOfDirichletSeriesWithKernels.

Whichever pull request merges second will conflict on these files. Either bring those heads to this text, or state the order and drop "identical".

## C04 — The route of 0.30b borrows its nested-disc step from inside AnalyticNumberTheoryPartI §0.30a, whose statement does not cover this case; AnalyticNumberTheoryPartIII 8.3 states the lemma that is needed

The route (lines 52–55) applies "the nested-disc argument of AnalyticNumberTheoryPartI §0.30a on the radii 3 < 15/4" to `F`, for every character, principal and imprimitive included. §0.30a, however, states its expansion only for primitive nonprincipal `χ` of conductor `q ≥ 3`, from the radii 6 and 12 (its lines 681–687), and separately for `ζ`.

AnalyticNumberTheoryPartIII 8.3 is on main. It is Landau's local logarithmic-derivative lemma, stated for any holomorphic `f`, and it gives exactly the bound that is needed. Take `R = 15/4`, `r₂ = 4/5` and `r₁ = 2/3`, so that `r₂R = 3` and `r₁R = 5/2`. Take `M = O(ℒ_t)`, which follows from `|F| ≤ C(q(|t| + 2))^B` and `|F(z)| > 1/2`. The lemma then gives `|F′/F − Σ_{|w−z|≤3} m_w/(s − w)| ≤ CM/R` on `|s − z| ≤ 5/2`. Citing it in the route and in the *Needs* line makes this input a stated result.

## Earlier findings

- R01 (two Checks refuted by AnalyticNumberTheoryPartI §0.34): repaired. The Checks now read "The route of (b) from (a) needs the gap `c_ex` … The statement of (b) does not need it" (line 341) and "The route needs the multiplicity clause … The statement does not need the clause" (line 463).
- R02 (headlines that are corollaries of AnalyticNumberTheoryPartI): repaired. `Suggested.lean` no longer states them. Its docstring (lines 20–22) says why, and the Scope (line 822) now records the converse: "Conversely, AnalyticNumberTheoryPartI §§0.18 and 0.34 give 1.4g (b)".
- R03 (1.4i can be stated at the pins): repaired. 1.4i (c) is stated as `norm_rieszRemainder_le`, and the docstring (lines 13–18) is corrected.
- R04 (locators): partly repaired. 1.4g (b) and Stark's Lemma 8 now have locators; 1.7b (i)–(iii) do not (R01 above).
- C01 (worked prime): repaired. The modulus is now `8 ∏_{2<p≤y} p` (line 347), and 193993801 is the least prime ≡ 1 modulo 38798760.
- N01 and N02: repaired (Conventions, line 22; Check of 0.30b, line 69).

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| 0.30b (a), (b) | `q = 1, t = 0`; principal modulo 6 | `−2` at distance 4 from `2`; `a₀(1;2) = −ζ′/ζ(2) = 0.5700`; `F(1) = φ(6)/6 = 1/3`; `(s−1)L ≈ 0.333339` at `1 + 10⁻⁵` | holds | C04 (citation) |
| 1.4e and corollary | `δ₀ = 1/2`; `z = x^(1/δ₀)`, `η = x⁻²` | `z^(δ−δ₀) = x^(−1+δ/δ₀)`; `z/(ηQ) ≤ 1/x` at `Q ≥ x^(1/δ₀+3)`; elementary error `≤ 2x⁻² log 2z` | holds | none |
| 1.4f | `x = (log Q)^(2+ε)`, `δ = δ₀ε/(2+ε)` | `x^(−1+δ/δ₀)(log Q)² = 1`; Mertens `(1/δ₀) log x = ((2+ε)/δ₀) log log Q` | holds | none |
| 1.4g (a) | `X = T = 2.5` (`J = 0`); odd `k_j` | `k_* = 2`; integers of `(k_j/2, k_j]` equal those of `(k_{j+1}, k_j]`; each mismatch `≤ 1` | holds | none |
| 1.4g (b) | BennettSiksek2020 Theorem 5 at `N ≥ 3`; `log N > √log X` | `δ_χ = 0` matches; `T = N`: `X/N ≤ X e^(−log X/log N)`; source: `c` effective, implied constant only absolute | holds; effectivity not delivered | C01 |
| 1.4h (a)–(c) | `a = 1, w > 1`; `y ∈ [1,2)`; `y → 3⁻` | `F′ = −ψ_χ(a/w)`; `log 4 + 4/e = 2.858`; `S_Λ = 0.752039` on `[1, 2·10⁶]`; `max ψ(n)/n = 1.03882` at 113 | holds | none |
| 1.4i (a), (c) | exceptional term; §0.34 at `f ≥ 3`; `y = 1` | `(δy/β)∫_y^∞ u^(β−2) du = δy^β/(β(1−β))`; term `≤ (2/c_LS) y (log 3f)⁵ e^(−c_LS…)`; `∫(ψ−u)u⁻² = −1−γ` | holds | none |
| 1.4i (b) and Checks | `χ_D`; `(1−β) log y ≤ 1` | `D = 193993801` prime, `k = 5`; `(G₁(y) − 2G₁(y/2))/y + log 2 = 0.69317` at `10⁶`; term `≥ y log y/e` | holds | none |
| 1.7a (a), (b) | `J = 1,…,7`, `φ = 3π/(2J+1)`; points `ω^i/(1+x)` | `Σ cos jφ = −1.0, −1.118, …, −2.118 < −J/5`; `J = ⌈8KL⌉` gives `1 ≤ 144KLδ e^(9KLx)` | holds | none |
| 1.7b convention, (i) | `q = 14`, `c₁ = 3`; `ρ = β₁` simple, `c ≤ c_LS` | `1 − 3/log 14 = −0.137`; `L(0, χ₋₇) = 1`; `(1−β₁)ℒ > c_LS`, so the right side is `< 0` | holds | R01 (locator) |
| 1.7b (ii)–(iv) | `log x ≥ 8`; `x ≥ 4` | `1 − x^(β₁−1)/β₁ ≥ min(1, (1−β₁) log x)/4`; `E_ψ ≥ c x q^(−7/4)`; `(2/3)(x−2) ≥ x/3` | holds | R01 (locator) |
| 2.9b class numbers, (i) | `ℚ, (q)∞`; `ℚ(√3)`, both real places | `φ(q) ≤ 2q`; `h_𝔪 = 2 ≤ 2²·1·1`; `2ⁿ·4ⁿ = 8ⁿ`; `c_n` window inside *IsExceptionalZero*'s range | holds | none |
| 2.9b (ii)–(iii) | constants 12, 4 and 8; `X = 1000`, `h = 1/2` | `η log X ≥ 12cS`, and `≥ 9cS` once `S ≥ 6n/(c(1+6n))`; with 4: `4cS·r < 4cS` | holds; Check wording | C02 |
| 2.9b (iv) (a)–(c) | `K = ℚ`; `ℚ(i)`, `M = 3` | `(D_K² 𝔑𝔣)^(−(1+2ε)/(2n)) ≥ B^(−(1+2ε)/n)`; `h_𝔪 ≤ 16B`; `\|i − 1\| < 3` | holds | none |
| 2.41a | `1 ⊕ χ₋₄`; two-dimensional representation of `S₃` | `L = ζ·L(χ₋₄)`, `L(1, χ₋₄) = π/4 ≠ 0`; order of `Λ` at `s` equals order at `1 − s̄` | holds | none |
| `norm_rieszRemainder_le` | `N = 1, 2`; `N > y`; probe | no primitive `χ ≠ 1` for `N ≤ 2`; `\|G_χ(y)\| ≤ C y log 3N` when `y ≤ N`; `simp` leaves goals | holds | none |
| `exists_prime_modEq_le` | `q = 3, a = 1`; `a ≡ −1` | `p = 7` needs `L ≥ 1.77`; least `p ≡ −1` is `≥ q − 1`, so `L ≥ 1`; `simp` makes no progress | holds | none |
| `card_primes_norm_one_mod_shortInterval_ge` | `ℚ(i), M = 3`; `ℚ(√−3)` | finrank 2 and totally complex means imaginary quadratic; (b) at `n = 2, ε = 1/2` with `h_𝔪 ≤ 16B` gives `16B²`; at most 2 ideals per `p` | holds | none |
| Family index | heads of #2885, #2878, #2881, #2883 | identical at #2885 and #2878; #2881 and #2883 differ at lines 9–11 and list entries | conflict | C03 |

- Source locators checked against the text: BennettSiksek2020 Theorem 5, (26), lines 793–807, and Proposition 7.1, lines 772–783. No other cited text is legally readable.
- Library declarations opened at the pin:
  - Mathlib: `Nonvanishing.lean` 404 and 412; `DirichletContinuation.lean` 149; `Liouville.lean` 47; `Chebyshev.lean` 442, 473 and 485; `SumCoeff.lean` 155; `Dirichlet.lean` 412 and 439; `ZetaAsymp.lean` 657; `Orthogonality.lean` 82; `EulerMascheroni.lean` 131; `NumberField/ClassNumber.lean` 65 and 78; `TotallyRealComplex.lean` 210.
  - Tau Ceti: `LogIntegral.lean` 141; `RayClass/Basic.lean` 130; `RayClass/ClassNumber.lean` 99; `EffectiveBounds/ClassNumber/Basic.lean` 81; `IdealCount/Basic.lean` 399.
- Cross-roadmap citations resolved:
  - On main: AnalyticNumberTheoryPartI (24 sections); ZerosOfLFunctions 1.4, 3.3–3.4, 4.3–4.4, 6.3–6.4 and 8.3–8.7; AnalyticNumberTheoryPartIII 8.3; ClassFieldTheory Layers 11 and 13; GlobalNumberFields Layers 2 and 9; ArithmeticDirichletSeries Layer 6; EffectiveBounds Layer 1.
  - At its head: RiemannHypothesisStatementsAndConsequences 8.4a, 9.2, 9.4, 9.5 and 11.1.
- Automatic checks: all passed. Rerunning the dependency check gave `depcheck: 171 roadmaps, 1990 edges, 0 problem(s)`.
- Elaboration of `Suggested.lean` gives only the three `sorry` warnings. `#check @name` for each declaration matches 1.4i (c), 1.7b (iii) and 2.9b (iv) (c), with no binder lost. The one-tactic probe closes none of them.
- Numerical values recomputed: the least prime `D`, the Fejér sums for `J ≤ 7`, `S_Λ`, `max ψ(n)/n` and the `log 2` ratio.

Overlap check: I read the open roadmaps QuadraticTwistSelectionOverPrimes, RiemannHypothesisStatementsAndConsequences, FrobeniusRestrictedRieszSums, ExplicitNumberFields and GeneralizedRiemannHypothesisFromWindowBounds, and on main AnalyticNumberTheoryPartI, ZerosOfLFunctions and AnalyticNumberTheoryPartIII. The shared objects and their owners are:

- the exception-free character prime number theorem: AnalyticNumberTheoryPartI §0.18. This roadmap keeps the exception-tolerant form, and its Scope says so.
- Riesz sums and the Riesz remainder: RiemannHypothesisStatementsAndConsequences 8.4a, cited here.
- the ray-class number inequality: also an API bullet of ExplicitNumberFields 2.5. Both forms follow from Tau Ceti's `card_rayClassGroup_mul_index`.
- Landau's local logarithmic-derivative lemma: AnalyticNumberTheoryPartIII 8.3 (C04).
- the Artin Riemann hypothesis: this roadmap, 2.41a.
- Linnik's theorem: this roadmap, 1.7b (iii).
- prime ideals of a ray class in short intervals, uniformly in the field: this roadmap, 2.9b. ZerosOfLFunctions 8.7 fixes `K` and `𝔪`, and AnalyticNumberTheoryPartI §2.49 is in terms of the discriminant of the top field.

Source independence: 6 passages compared with 1 source (BennettSiksek2020); none shares more than the forced formulas. The largest share of the reference-list citations belongs to [FormalProof], 3 of 14. There are 2 theorem-level locators: Iwaniec–Kowalski Theorem 5.27 = Bennett–Siksek Theorem 5, and Stark Lemma 8. The contents were not compared, because [FormalProof] and Iwaniec–Kowalski could not be read; the layers follow the mathematics, not a source's order.

Research link: 1.7b is Linnik's least-prime theorem (Linnik 1944), with the Deuring–Heilbronn repulsion (Knapowski 1962) and Gallagher's theorem (Gallagher 1970). 1.4g (b) is Iwaniec–Kowalski Theorem 5.27, which Bennett–Siksek (2020) use for an Erdős conjecture. 2.9b follows Lagarias–Odlyzko (1977) and Stark (1974). This rests on the README's References and on BennettSiksek2020 lines 793–807.

## Not verifiable

- Iwaniec–Kowalski, *Analytic Number Theory*: no legal copy is known to the sources service. Theorem 5.27 was checked only through Bennett–Siksek's restatement.
- Davenport1980 and Stark1974: settled as uncertified (paywalled). Stark's Lemma 8 was compared only with AnalyticNumberTheoryPartI §2.31e's account of it.
- Gallagher 1970: the sources service reports that DOI 10.1007/BF01403187 is paywalled.
- Lagarias–Odlyzko 1977: the sources service found no legal source.
- Linnik 1944, Knapowski 1962 and Bombieri, Astérisque 18: no legal copy was found in the previous round; I did not retry.
- [FormalProof] (a GitHub repository) and [Announcement] (alpo.ge): neither host is in a licence class; not read.

## Source issues

- **Misprint** in BennettSiksek2020 at Theorem 5, (26), p. 17 (arXiv v1): the source says the error term carries the factor `(log N)⁴` for every primitive `χ`, the trivial one included; it should read `(log 3N)⁴`, or exclude `N = 1`, where that factor vanishes; affects nothing.

## For the human reviewers

- Scope: lines 889–890 cite a Lean repository formalising the Riemann hypothesis, announced on 20 November 2026 at alpo.ge, as the source of 1.4e–1.4f and of the route of 1.7b (i). It is not refereed, its host is in no licence class, and I did not read it.
- Not tested: of the cited texts only BennettSiksek2020 could be read. Wording and arrangement were not compared with Iwaniec–Kowalski, [FormalProof] or the other sources.
- Design: with AnalyticNumberTheoryPartI §0.34 on main, 0.30b, 1.7a and 1.7b (i) serve only the routes of the exception-tolerant forms (README line 822). Whether to plan those routes is a design decision.
- GaloisSectionsPadicPeriodMaps (an open pull request, its README line 1516) declares the gap `linnik-polynomial-least-prime`, which asks AnalyticNumberTheoryPartI for Linnik's theorem. This roadmap states Linnik's theorem (1.7b (iii)).
