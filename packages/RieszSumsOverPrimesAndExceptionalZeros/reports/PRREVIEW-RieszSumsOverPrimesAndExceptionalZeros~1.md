# Review of RieszSumsOverPrimesAndExceptionalZeros (pull request #2877 at 370c7ee)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/RieszSumsOverPrimesAndExceptionalZeros/`
**Verdict:** needs changes

**Summary.** Changes are needed. The roadmap imports AnalyticNumberTheoryPartI §0.34 (the uniform exclusion of Landau–Siegel zeros, on main), but it then states two Checks that §0.34 refutes, and it offers as headlines two theorems that follow in a few lines from AnalyticNumberTheoryPartI §§0.18 and 0.34; I checked both derivations in Lean. In addition, the Riesz-remainder headline 1.4i (a) can be stated at the pins although the Lean file says it cannot, and none of the published theorems carries an exact source locator. There is one small correction and there are two format notes. The human reviewers have to decide about a formal-proof source that is not refereed and about cited sources that nobody could read.

## R01 (P2) — Two Checks say that hypotheses guarding against an exceptional zero cannot be removed, but AnalyticNumberTheoryPartI §0.34, which this roadmap imports, removes them

The roadmap lists "the uniform exclusion of Landau–Siegel zeros" among what it takes from AnalyticNumberTheoryPartI (overview, line 7), and it uses that result for the exception-free forms of 1.7b (iv) (line 525). Yet two Checks assert things that §0.34 refutes. The text therefore contradicts itself, and it tells the reader that two hypotheses do work they do not do.

- In the Checks of 1.7b (i), line 442, the text says "The multiplicity clause cannot be dropped". It can. Let `χ₁` be a real nonprincipal character modulo `q` with `L(β₁, χ₁) = 0` and `β₁ ∈ [1/2, 1)`. §0.34, in the imprimitive form its text states, gives `(1 − β₁) log q ≥ c_LS`. Because `ℒ ≥ log(q(|γ| + 2)) > log q`, this gives `(1 − β₁)ℒ > c_LS`. With `c = c_LS` the right side `c log(c/((1 − β₁)ℒ))/ℒ` is therefore negative, while `1 − Re ρ > 0` by `DirichletCharacter.LFunction_ne_zero_of_one_le_re`. So the conclusion also holds for a simple `β₁`. A Lean derivation of `exceptional_zero_repulsion` from that form of §0.34 elaborates at the pin, and it never uses the multiplicity hypothesis.
- In the Checks of 1.4i, line 324, the text says "The gap c_ex is needed in (b)". Assume `log f_χ ≤ (log y)^α`. Then §0.34 gives `(1 − β) log y ≥ c_LS (log y)^(1−α)`, so the Check's premise `(1 − β) log y ≤ 1` fails for every `y` above a threshold that depends on `α` alone. The exceptional term is then at most `(2/c_LS) y (log y)^α exp(−c_LS (log y)^(1−α))`, which lies within the bound of (b) once `c₁ = min(c/4, c_LS/2)`. So (b) holds without `c_ex`.

The smallest change is to say in each Check that the argument of (a), or of (i), cannot remove the gap or the clause on its own, and that AnalyticNumberTheoryPartI §0.34 makes both redundant. Dropping the two Checks would also do.

## R02 (P2) — Two of the four headline theorems of `Suggested.lean` are corollaries of AnalyticNumberTheoryPartI statements already on main

`Suggested.lean` is the acceptance test. However, `character_psi_eq_sub_exceptional` (line 47) and `exceptional_zero_repulsion` (line 70) follow from AnalyticNumberTheoryPartI's `character_psi_le` (§0.18, its `Suggested.lean` line 142) and `landau_siegel_exclusion` (§0.34, line 114). As acceptance tests they therefore test nothing of 1.4g, 0.30b, 1.7a or 1.7b (i). They also restate an object that is already planned on main: the character prime number theorem, and a repulsion that §0.34 makes empty.

- For `character_psi_eq_sub_exceptional`, take `c`, `C` and `X₀` from `character_psi_le` and put `c₁ = min(c_LS, 1)`. The first conjunct is then `character_psi_le` itself. The second conjunct is vacuous: a zero `β ∈ (1 − c₁/log N, 1)` has `β > 0` and `(1 − β) log N < c_LS`, which contradicts `landau_siegel_exclusion`. I checked this in Lean with the two statements as hypotheses, and it elaborates.
- `exceptional_zero_repulsion` follows from §0.34 with `c = c_LS`, as computed in R01. That derivation also elaborates.

The Scope paragraph (line 798) records only the other direction: "1.4g (b) with AnalyticNumberTheoryPartI §0.34 gives AnalyticNumberTheoryPartI §0.18".

The smallest change is to add the converse to that paragraph, and to replace the two declarations of `Suggested.lean` by headlines that AnalyticNumberTheoryPartI does not imply. Two candidates are the bound `π(x;a,q) ≥ x/(3φ(q) log x)` for `x ≥ q^L` of 1.7b (iv), and the Riesz-remainder bound of 1.4i (a) (R03). The README can keep 1.4g (b) and 1.7b (i) as targets with their routes.

## R03 (P2) — The Riesz-remainder headline 1.4i (a) can be stated at the pins, although the module docstring says it cannot

The docstring (lines 18–28) leaves out headline (2) of the overview. Its reason is that the exceptional zero of 1.4i needs the constant, the analytic conductor and the predicate of ZerosOfLFunctions 6.3, and that "a window with a free constant in their place would be a different statement". That reason does not hold, for three reasons:

- The file itself states 1.4g (b) with a window of free width.
- The route of 1.4i (a) (lines 286–290) shows that the choice of window costs only constants. A real zero that lies in one window but not the other has `1 − β ≥ c₃/log f_χ`, and its term lies within the error.
- The remainder `G_χ(y)` needs only Mathlib: the sum over `Finset.Icc 1 ⌊y⌋₊` of `ArithmeticFunction.vonMangoldt n * χ n * (y/n − 1)`, plus `y * (deriv χ.LFunction 1 / χ.LFunction 1)`. At level one it also needs `Real.eulerMascheroniConstant`.

So a headline that can be stated is missing. The smallest change is to state 1.4i (a) in the free-width form already used for `character_psi_eq_sub_exceptional`. Alternatively, using AnalyticNumberTheoryPartI §0.34, state its exception-free form `|G_χ(y)| ≤ C y (log 3f_χ)^5 exp(−c log y/(√(log y) + log f_χ))`, which no other roadmap states. Then correct the docstring.

## R04 (P2) — The published theorems carry no exact locator

Each result that appears in a source has to cite it with theorem and page, so that a reader can check the stated hypotheses against the published statement. Here every target is cited by chapter at best, or by the paper as a whole:

- Iwaniec–Kowalski is cited for "Chapters 5 and 18: 1.4g, 1.7b" (line 860), and Davenport for "Chapters 18–20" (line 861).
- Gallagher, Linnik, Knapowski, Stark and Lagarias–Odlyzko are cited by title only (lines 856–863).

The results affected are:

- the character prime number theorem with its factor `(log N)^4` (1.4g (b));
- the repulsion (1.7b (i)), Gallagher's theorem (1.7b (ii)) and Linnik's theorem (1.7b (iii));
- the threshold `1/(4 d! log D_E)` of Stark's quadratic-subfield lemma, used in 2.9b (iv) (a).

I could not open any of these texts (see Not verifiable).

The smallest change is to add theorem and page locators at these claims. AnalyticNumberTheoryPartI already locates two of the same results, and the author can check and reuse its locators. One is Stark's Lemma 8, pp. 145–146 (its §2.31e). The other is the character prime number theorem with the exceptional term: Iwaniec–Kowalski Theorem 5.27, and its reference [47], Theorem 5, (26), p. 374 (its §0.18).

## C01 — The worked prime `D = 193993801` does not satisfy the congruence it illustrates

The Checks of 1.4i (lines 326–330) and the Examples of Layer 1 (line 538) take `D ≡ 1 (mod 8∏_{p≤y} p)`. At `y = 20` this modulus is `77597520`, and `193993801 ≡ 38798761` modulo it. In fact `193993801` is the least prime `≡ 1` modulo `8·∏_{3≤p≤19} p = 38798760`, and the least prime `≡ 1` modulo `77597520` is `232792561`. The argument only needs `D ≡ 1 (mod 8)` and `D ≡ 1 (mod p)` for the odd primes `p ≤ y`. Writing the modulus as `8∏_{2<p≤y} p` therefore keeps the example as it is.

## N01 — The ids 0.30b, 1.4e–1.4i, 1.7a–1.7b, 2.9b and 2.41a continue AnalyticNumberTheoryPartI's numbering (its §§0.30a, 1.4a–1.4d, 2.9a, 2.41), so a bare "1.4e" can be read as a section of that roadmap. One sentence in the Conventions saying that the numbering is this roadmap's own would prevent this.

## N02 — In the second Check of 0.30b (line 66), "Without the pole term the left side would tend to 1, with the opposite sign to 2" is hard to parse. Perhaps: "Without the pole term the left side would tend to 1, and with the pole term of opposite sign it would tend to 2."

## Questions for the author

- No target of this roadmap uses 2.41a; its consumer is GeneralizedRiemannHypothesisFromWindowBounds. RiemannHypothesisStatementsAndConsequences, at its head, leaves the Riemann hypothesis of an Artin L-function to the roadmap that constructs that L-function (AnalyticNumberTheoryPartI §2.18a). Is 2.41a meant to sit here? This is a question of placement, and the texts do not settle it.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| 0.30b (a), (b) | `q = 1, t = 0`; principal modulo 6; the chord at `Re s = 0` | `a₀(1;2) = Σ_{n≤2·10⁶} Λ(n)/n² = 0.56996` (stated ≈0.570); `F(1) = φ(6)/6 = 1/3`; chord `√5` against spacings 9.06 and 5.72 | holds | none |
| 1.4e and its corollary | `δ₀ = 1/2`; `z = x^(1/δ₀)`, `η = x⁻²` | `x^(−1+δ/δ₀) = x^(−1+2δ)`; `z/(ηQ) ≤ 1/x`; elementary error `(h+1)h log(z+h)/z` | holds | none |
| 1.4f | `x = (log Q)^(2+ε)`, `δ = δ₀ε/(2+ε)` | `x^(−1+δ/δ₀)(log Q)² = 1`; Mertens term `((2+ε)/δ₀) log log Q` | holds | none |
| 1.4g (a) | `J = 0` and `J ≥ 1`; odd `k_j` | `k_* ≥ 1` in both cases; the blocks tile `(k_*, X]`; each mismatch is at most 1 per block and zero | holds | none |
| 1.4g (b), `character_psi_eq_sub_exceptional` | `N > X^(1/2)`; `log N` on both sides of `√(log X)`; `c₁ = min(c_LS, 1)` | geometric factor ≈3.8; `(log N)^4` from `log X < log² N`; Lean derivation from §§0.18, 0.34 elaborates | true, duplicated | R02 |
| 1.4h (a)–(c) | `a = 1`, `w > 1`; `y ∈ [1, 2)` | `F′ = −ψ_χ(a/w)`; `log 4 + 4/e = 2.858`; `S_Λ = 0.75204` at `y → 3⁻`; `max ψ(n)/n = 1.03882` at 113 | holds | none |
| 1.4i (a) | exceptional term; trivial character; `y = 1` | `(δy/β)∫_y^∞ u^(β−2) du = δy^β/(β(1−β))`; `∫_1^(2·10⁶)(ψ−u)u⁻² = −1.57722`, and `−1−γ = −1.57722` | holds; statable | R03 |
| 1.4i (b) and its Checks | `χ_D`; the gap `c_ex` | `(G₁(y) − 2G₁(y/2) + y log 2)/y = 0.69317` at `10⁶`; `D ≢ 1 (mod 77597520)`; `c_ex` redundant given §0.34 | Check false; example off | R01, C01 |
| 1.7a (a), (b) | `J = 1`; `φ = 3π/(2J+1)`; roots of unity | Fejér gives `≥ J/4 − 3/4`; `Σ cos ≤ −(2J+1)/(3π) − 1/2 < −J/5`; `J = ⌈8KL⌉` gives `1 ≤ 144KLδe^(9KLx)` | holds | none |
| 1.7b convention | `q = 14`, `c₁ = 3`, `χ₋₇` | `1 − 3/log 14 = −0.137`; `L(0,χ₋₇) = −(1+2+4−3−5−6)/7 = 1`; `χ₋₇(2) = 1` | holds | none |
| 1.7b (i), `exceptional_zero_repulsion` | `χ = χ₁`, `ρ = β₁` simple; `c = c_LS` | `(1−β₁)ℒ > c_LS`, so right side `< 0 < 1 − Re ρ`; Lean derivation never uses multiplicity | true, empty given §0.34 | R01, R02 |
| 1.7b (ii)–(iv) | `β₁ ≥ 1/2`; `x ≥ q^L` | `1 − x^(β₁−1)/β₁ ≥ min(1,u)/4` once `log x ≥ 8`; `(2/3)(x−2) ≥ x/3` for `x ≥ 4` | holds | none |
| `exists_prime_modEq_le` (1.7b (iii)) | `q = 3, a = 2`; `a ≡ −1` | `p = 2 ≤ 3^L`; least `p ≡ −1 (mod q)` is `≥ q − 1`, forcing `L ≥ 1`; one-tactic probe fails | holds | none |
| 2.9b class numbers | `ℚ`, `(q)∞`; `ℚ(√3)` with both real places | `φ(q) ≤ 2q`; narrow `h = 2 = 2^(r₁)·1·1`, bound attained; `2^n·4^n = 8^n` | holds | none |
| 2.9b (ii)–(iii) | bump `Φ₀`, `X = 1000`, `h = 1/2`; constants 12 against 4 | `∫Φ₀ = 0.0070299`; `φ̃(0.9) = 1.72305 < X^(−0.1)φ̃(1) = 1.76164`; `η log X ≥ 12cS` and `≥ 9cS` | holds | none |
| 2.9b (iv), `card_primes_norm_one_mod_shortInterval_ge` | `ℚ(i)`, `M = 3`; units modulo `M` | `h_𝔪 = 8/4 = 2`; `|u − 1| ≤ 2 < M`; `ε = 1/2` with `h_𝔪 ≤ 16B` gives `B²`; Lean carriers mean imaginary quadratic | holds | none |
| 2.41a | `1 ⊕ χ₋₄`; two-dimensional representation of `S₃` | `L = ζ·L(χ₋₄)`, `L(1,χ₋₄) = π/4 ≠ 0`; converse product clause under Artin holomorphy, as stated | holds | none |

- Source locators checked: the README has no locator at theorem level. Nine cited works were tried through the sources service, and none is legally readable.
- Library declarations opened at the pin:
  - Mathlib: `Nonvanishing.lean` 404 and 412; `DirichletContinuation.lean` 149; `Dirichlet.lean` 412 and 439; `Orthogonality.lean` 82; `Liouville.lean` 47; `Chebyshev.lean` 442, 473 and 485; `SumCoeff.lean` 155; `ZetaAsymp.lean` 657; `EulerMascheroni.lean` 131; `NumberField/ClassNumber.lean` 65 and 78; `TotallyRealComplex.lean` 210; `MulChar/Basic.lean` 443.
  - Tau Ceti: `LogIntegral.lean` 141; `RayClass/Basic.lean` 130; `RayClass/ClassNumber.lean` 99; `EffectiveBounds/ClassNumber/Basic.lean` 81; `IdealCount/Basic.lean` 399.
- Cross-roadmap citations resolved:
  - On main: AnalyticNumberTheoryPartI (23 sections); ZerosOfLFunctions 1.4, 3.3–3.4, 4.3–4.4, 6.3, 6.4 (4b), (4e), (4f) and 8.3–8.7; ClassFieldTheory Layers 11 and 13; GlobalNumberFields Layers 2 and 9; ArithmeticDirichletSeries Layer 6; EffectiveBounds Layer 1.
  - At its open head: RiemannHypothesisStatementsAndConsequences 8.4a, 9.2, 9.4, 9.5 and 11.1.
- Automatic checks: all passed. I reran the dependency check, which reported `depcheck: 171 roadmaps, 1990 edges, 0 problem(s)`.
- Elaboration of `Suggested.lean` gives only the four `sorry` warnings. `#check @name` for all four declarations matches the README statements, with no binder lost. The one-tactic probe (`simp`, `rfl`, `infer_instance`, a trivial witness) closes none of them.
- Lean derivations, in throwaway files outside the pull request, both elaborate: `character_psi_eq_sub_exceptional` from AnalyticNumberTheoryPartI's `character_psi_le` and `landau_siegel_exclusion`, and `exceptional_zero_repulsion` from the imprimitive form of §0.34.
- Numerical values computed independently: `∫Φ₀`, `φ̃(0.9)`, `S_Λ`, `max ψ(n)/n`, `∫(ψ−u)u⁻²`, the `log 2` ratio, `a₀(1;2)` and the least primes `D`.
- The family index files are identical in this pull request and in the sibling pull requests that add RiemannHypothesisStatementsAndConsequences, QuadraticTwistSelectionOverPrimes and GeneralizedRiemannHypothesisFromWindowBounds.

Overlap check: I read the scopes of the open roadmaps QuadraticTwistSelectionOverPrimes, RiemannHypothesisStatementsAndConsequences, GeneralizedRiemannHypothesisFromWindowBounds, ExplicitNumberFields and LiCoefficientsArithmeticFormula, and of AnalyticNumberTheoryPartI, ZerosOfLFunctions and AnalyticNumberTheoryPartIII on main. The list of roadmaps closest by results is empty. The shared objects and their owners are:

- the character prime number theorem: AnalyticNumberTheoryPartI §0.18 (R02);
- Riesz sums and the Riesz remainder: RiemannHypothesisStatementsAndConsequences 8.4a, cited here;
- the ray-class number inequality: also an API bullet of ExplicitNumberFields 2.5; both forms follow from Tau Ceti's `card_rayClassGroup_mul_index`, so there is no conflict;
- the Artin Riemann hypothesis: this roadmap (2.41a);
- Linnik's theorem: this roadmap (1.7b (iii)).

ZerosOfLFunctions 8.7 is uniform only for fixed `K` and `𝔪`, so it does not overlap 2.9b.

Source independence: 0 passages compared with 0 sources, because no cited text could be read legally. There are no locators at theorem level. At the level of the reference list, the largest share is [FormalProof], which is cited for 1.4e, 1.4f and the route of 1.7b (i) (3 of 13 citations). The contents were not compared.

Research link: 1.7b is Linnik's least-prime theorem (Linnik 1944), with the Deuring–Heilbronn repulsion (Knapowski 1962) and Gallagher's density method (Gallagher 1970). 2.9b follows Lagarias–Odlyzko (1977) and Stark (1974). This rests on the README's References; I read none of the sources.

## Not verifiable

- Iwaniec–Kowalski, *Analytic Number Theory*: the AMS landing page is on a host the sources service does not classify; not read.
- Davenport, *Multiplicative Number Theory*: Springer, behind a paywall; not read.
- Gallagher 1970 and Stark 1974 (Inventiones): their Springer DOIs are behind a paywall; not read.
- Lagarias–Odlyzko 1977: the author-page URL returned 404; not read.
- Linnik 1944, Knapowski 1962, and Bombieri, Astérisque 18: the sources service found no legal copy.
- [FormalProof] (a GitHub repository) and [Announcement] (alpo.ge): neither host is in a licence class; not read.
- For these reasons no locator of the ten sampled targets could be checked. None of them carries a locator at theorem level anyway (R04).

## Source issues

- none

## For the human reviewers

- Lines 864–865 cite, as the source of 1.4e–1.4f and of the route of 1.7b (i), a repository formalising the Riemann hypothesis, announced on 20 November 2026 on alpo.ge. The family index says the family follows that proof. Neither is refereed, and I read neither.
- Not tested: no cited text could be read legally, so neither the wording nor the arrangement was compared with any source. Locators exist only at the level of the reference list; the most-cited source is [FormalProof].
- With AnalyticNumberTheoryPartI §0.34 on main, 0.30b and 1.7a serve only 1.7b (i), which follows from §0.34 directly (R02). Whether to plan the Deuring–Heilbronn route anyway is a design decision.
- GaloisSectionsPadicPeriodMaps (open pull request, its README line 1516) declares the gap `linnik-polynomial-least-prime`, which asks AnalyticNumberTheoryPartI for Linnik's theorem. This roadmap states it (1.7b (iii)).
