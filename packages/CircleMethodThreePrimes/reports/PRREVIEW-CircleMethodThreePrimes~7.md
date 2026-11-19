# Review of CircleMethodThreePrimes (pull request #2543 at 0e859d6)

**Verdict:** accepted

**Summary.** Accepted. There are no findings: every statement, Check and worked example was recomputed and holds, the three supplier citations resolve on main, and `Suggested.lean` elaborates with only `sorry` warnings. This head is the commit the previous review read, so its three small corrections and one format note are still open and are restated below, with one further format note; none blocks. Three points are left to the human reviewers: the closed main source, the licence of the repository named under "Prior work", and the route of the supplier's Siegel–Walfisz theorem.

## C01 — The closing remark of §2.2 reads as if the Parseval bound failed with the constant 1, but only the route through ψ(N) ≤ N does

At the end of §2.2 (lines 239–240): "The constant `1` is not available in place of `log 4 + 4`: `ψ(19) ≈ 19.27 > 19`…". The constant `log 4 + 4` occurs twice in the paragraph, in `∑_{n ≤ N} Λ(n)² ≤ (log 4 + 4) N log N` and in `ψ(N) ≤ (log 4 + 4) N`, and the two witnesses refute only `ψ(N) ≤ N` (ψ(19) = 19.2657, ψ(113) = 117.3867). The first bound does hold with the constant 1 as far as computed: the ratio `∑_{n ≤ N} Λ(n)² / (N log N)` stays below 0.936 for `2 ≤ N ≤ 5·10⁶`, and the asymptotic `N log N − N + o(N)` keeps it below 1. An implementer could take the sentence as a claim about the Parseval bound. It would be unambiguous as: "This route cannot give the constant `1`, since `ψ(N) ≤ N` fails: `ψ(19) ≈ 19.27` and `ψ(113) ≈ 117.39`."

## C02 — Three docstrings of `Suggested.lean` call the constant or the threshold "ineffective", a property of the classical proof and not of the statement

`SiegelWalfiszBound` (line 135) ends "The constant is ineffective."; `vinogradov_threePrimes` and `vinogradov_threePrimes_unconditional` (lines 212 and 223) end "The threshold is ineffective." Each statement is a plain existential, and for the three-primes theorem effective and explicit thresholds are known: helfgott2015 lines 372–384 records them (Mardzhanishvili 1941, Vinogradov 1947, Borozdkin), and its Theorem 1.1.1 (line 327) covers every odd number greater than 5. What is ineffective is the constant that the route through Siegel's theorem produces (helfgott2015 lines 366–371). The README already says this correctly (Convention 8; §3.1, line 266; §4.8, line 441). The docstrings would agree with it as: "The threshold is existential; the classical route through Siegel–Walfisz gives no way to compute it", and the same with "constant" at line 135.

## C03 — The build guide, and the description after it, say every section carries a source, and that Layers 0 and 1 need only Mathlib

"How to read the build" (lines 42–44) says each numbered section comes "with its source and its own *Needs:* line" and that "Layers 0 and 1 need only Mathlib". §§0.1, 2.2, 3.1 and 4.9 name no source, and §§4.1–4.7 rely on the one line at the head of Layer 4 (line 324). The identification in §0.2 needs AutomorphicSpectralTheory §1.16, as its own *Needs:* line (157) and the Layer 0 dependencies (168) say. The description repeats the first claim: "each section now states its target in prose with its hypotheses, its source and its own *Needs:* line". Right would be: "each with its own *Needs:* line, and with its source where the result is not elementary", and "Layers 0 and 1 need only Mathlib, apart from the identification with the Kloosterman sum in §0.2"; the description's sentence changes the same way.

## N01 — The "Consumed, not redefined" bullet for AutomorphicSpectralTheory (lines 515–517) reads as if §1.16 supplied the divisor formula

That section records `S(m, 0; c) = ∑_{d ∣ (m, c)} μ(c/d) d` only among its Checks, and §0.2 here proves it as `ramanujanSum_eq_sum_divisors`. "whose Checks record the divisor formula and the values …" would match the contract at lines 597–601.

## N02 — "This roadmap owns the additive character … the distance to the nearest integer" (lines 481–482), though §0.1 identifies both with Mathlib objects

`expTwoPiI α` is `Real.fourierChar α` coerced to `ℂ` and `distInt α` is the norm of `α` in `UnitAddCircle`, as §0.1 and the Mathlib contract say. Listing the two under "Kept variants" (wrappers on `ℝ` with values in `ℂ` and `ℝ`, kept for the statements of `Suggested.lean`) would make the ownership list agree with them.

## Verified sound

Previous review (same head, accepted): it had no finding to repair. Its C01, C02, C03 and N01 are not repaired, the folder being unchanged (0 changed lines), and are C01, C02, C03 and N01 above.

| Statement | Instances tried | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| 0.1 `expTwoPiI`, `distInt`, `norm_sum_expTwoPiI_le`, orthogonality | α = 0, 1/2, 1/4; `distInt` at 1/2, −0.3, 7; β = 0; m = 0 | e = 1, −1, i; `round(1/2) = 1` so 1/2; 0.3 (fract gives 0.7); 0. β = 0: sum N, `if` gives N, bare `min` gives 0 | holds | none |
| 0.2 `ramanujanSum`, divisor formula, bound, `ramanujanSum_mul` | q ≤ 60, abs(n) ≤ 30; coprime q₁, q₂ < 20 with (0, 1) | 0 mismatches of sum against divisor formula; 0 violations of `≤ gcd`; 0 of multiplicativity; `c₁₂`: 0, 2, 0, −2, −4, 4; `c₉(3) = −3`; `c₀ = 0` | holds | none |
| 1.1 `sum_min_inv_distInt_le` | α = 0, q = 1, c = 0; X < M | LHS `X·H_M ≤ X(1 + log M)` against `C(X + M + 1) log 2M`; for X < M split at X: tail `X log(M/X) ≤ M/e` | holds | none |
| 1.2 `norm_typeII_le` | M = N; Cauchy–Schwarz route, 1.1 with X = N, H = ⌊N/M⌋ | M = N: `⌊N/m⌋ = 0`, LHS 0. In general square `≤ ‖a‖²‖b‖²(M + 2C(N/q + N/M + q) log 2Nq)`, using `min(M, ·) ≤ min(N/h, ·)` | holds | none |
| 2.1 `primeExpSum`, `norm_primeExpSum_le` (headline) | N = 1, 2, 4, α = 0; α = 1/2, N = 10; q > N; dyadic type II budget | 0; `log 2·e(2α)`; log 12 (primes only: log 6); −3.673131 both sides; `(Nq)^½ > N`; `√N·(N^(3/5))^½ = N^(4/5)` | holds | none |
| 2.2 Parseval, trivial bounds, remark | ψ(19), ψ(113); ratio `∑Λ²/(N log N)`, N ≤ 5·10⁶; N = 0, 1 | 19.2657 > 19; 117.3867 > 113; largest ratio 0.9352; both sides 0 at N = 0, 1 | true; remark ambiguous | C01 |
| 3.1 `psiAP`, `SiegelWalfiszBound`, reduction to classes | q = 1 (a = 0 a unit in `ZMod 1`); q = 2, a = 0, 1; ψ(10; 2, 0); x = 2 | q = 1: both sides of the reduction 0; 3 log 2 (primes only: log 2); difference `≤ ω(q) log x ≤ log q log x/log 2`; x = 2: no q, vacuous | holds | none |
| 3.2 `primeExpSum_majorArc` | (q, a, β) = (1, 0, 0), (2, 1, 0); N = 2; t ≥ √N | `abs(ψ(N) − N)`, needs `log N ≥ 1`, N ≥ 3; `S(1/2)` against −N; N = 2 vacuous; `(log t)^(B+1) ≥ (log N)^B` once `log N ≥ 2^(B+1)`; error `φ(q)·t·(log t)^(−A−B)` | holds | none |
| 4.1 `threePrimeWeight`, `threePrimeCount`, integral form | N = 0, 3, 5, 6, 7, 9 | r = 0, 0, 0, 0.33302 = (log 2)³, 1.58349 = 3(log 2)² log 3; R(5, 6, 7, 9) = 0, 1, 3, 4; unordered R(9) = 2 | holds | none |
| 4.2 arcs | disjointness; Dirichlet with n = ⌊N/Q⌋; Q < 1 (N = 2, B = 1) | gap `≥ Q⁻² > 2Q/N`; `1/(k(n+1)) < Q/(kN)` and `≤ k⁻²`; j/k > 1 forces `≥ 1 + 1/Q > 1 + 2Q/N`; Q < 1: no major arc, k ≥ 1 > Q | holds | none |
| 4.3 minor arcs | 2.1 at Q < q ≤ N/Q | `Nq^(−½)`, `(Nq)^½ ≤ NQ^(−½)`; `N^(4/5) ≤ C_B N (log N)^(−B/2)`; times `(log 4 + 4) N log N` gives exponent 5 − B/2 | holds | none |
| 4.4 `singularSeries`, Euler product, parity, lower bound, truncation | N = 0, 1, 3, 4, 15; partial sums q < 1500 | 𝔖(1) = 2.300962 (series 2.300961); 𝔖(3) = 1.533974, ratio 0.666667; 𝔖(15) = 1.415976; 𝔖(4): 6·10⁻⁷; lower constant 1.320324; q³ variant 7/8 | holds | none |
| 4.5 `integral_geomSum_cube`, tail | N = 1, 2, 5; index from 0 | triples 0, 0, 6, formula in ℕ 0, 0, 6; from 0: 21; tail `≤ 2∫(2β)⁻³ = N²/(8Q²)` | holds | none |
| 4.6 major arcs | error budget with A′ = A + 4B; arcs at the ends of I | `(1 + Q)N(log N)^(−A′)·N²·2Q³/N ≤ N²(log N)^(−A)`; truncation `N²Q⁻²`; `(N−1)(N−2)/2 − N²/2 = O(N)`; arc at 1/1 inside `[1 − Q/N, 1 + Q/N]` | holds | none |
| 4.7 `threePrimeWeight_asymptotic` (headline) | B = 2A + 10; N = 1001, 2001, 2000 | exponents 5 − B/2 = −A, −2B, −B/2 = −A − 5; r(2001) = 3.0468·10⁶ against ½𝔖N² = 3.0603·10⁶; r(2000) = 7.6·10⁴, 𝔖 = 0 | holds | none |
| 4.8 `threePrimeCount_asymptotic`, `vinogradov_threePrimes` | even N; primes below `N^(1−δ)`; proper prime powers | even N: R(N) ≤ 3π(N); `(1−δ)³ R log³N ≤ r′ + O(N^(2−δ) log³N)`; prime powers `O(N^(3/2) log³N)`; odd N: 𝔖 ≥ 1.32 gives R > 0 | holds | none |
| 4.9 `siegelWalfiszBound`, `vinogradov_threePrimes_unconditional` (headline) | supplier `siegel_walfisz` (eventual in x, ∃ C > 0, same `psiAP` body) against ∀ x ≥ 2 | on 2 ≤ x ≤ x₀: LHS `≤ (log 4 + 4)x`, RHS `≥ C x (log x₀)^(−A)`; enlarge C | holds | none |
| Docstrings, lines 135, 212, 223 | helfgott2015 lines 327, 366–384 | statements are ∃; effective and explicit thresholds recorded, every odd N > 5 | misleading | C02 |
| Build guide, lines 42–44, and the description's sentence | §§0.1, 2.2, 3.1, 4.9; *Needs:* of §0.2 | four sections without a source; §0.2 needs AutomorphicSpectralTheory §1.16 | misdescribes | C03 |

- Source locators checked against the text: 1 of 12 (helfgott2015 Chapter 1, lines 327–332 and 362–384, for §4.8: Vinogradov's first proof gives an existential threshold). The README flags none as unverified; the other 11 are under Not verifiable.
- Library declarations opened at the pin, 9: `Chebyshev.psi` (NumberTheory/Chebyshev.lean:70), `Chebyshev.psi_le_const_mul_self` (:485, `0 ≤ x`), `ArithmeticFunction.vonMangoldt_le_log` (NumberTheory/ArithmeticFunction/VonMangoldt.lean:152), `Real.exists_int_int_abs_mul_sub_le` (NumberTheory/DiophantineApproximation/Basic.lean:94), `sum_mul_eq_sub_sub_integral_mul` (NumberTheory/AbelSummation.lean:128), `Real.fourierChar_apply` (Analysis/Complex/Circle.lean:232), `UnitAddCircle.norm_eq` (Analysis/Normed/Group/AddCircle.lean:223), `round` (Algebra/Order/Round.lean:48, half up), `HasProd` (Topology/Algebra/InfiniteSum/Defs.lean:107). No Ramanujan sum, Vaughan identity, Siegel–Walfisz or prime exponential sum in Mathlib or Tau Ceti at the pins.
- Cross-roadmap citations resolved on main, 3 suppliers: AnalyticNumberTheoryPartI §0.32 (README 849; `psiAP` at Suggested 166, same arguments and body; `siegel_walfisz` at 328); SieveMethodsAndPrimePatterns §2.4 (README 2041–2152: incomplete logarithm, `0 ≤ λ_V ≤ log`, the identity, the energies; `SieveVaughan.vaughan_identity` at Suggested 363); AutomorphicSpectralTheory §1.16 (README 1232–1257, no Lean name). Also resolved: AnalyticNumberTheoryPartI §1.2 (README 951), ImaginaryQuadraticClassNumber, ZerosOfLFunctions, ContourIntegration (completed). The one name reported as found nowhere, `SieveVaughan.vaughan_identity`, is the supplier roadmap's declaration.
- Overlap check: read ExplicitCharacterSumsAndSieves and ExplicitMultiplicativeFunctions (open), SieveMethodsAndPrimePatterns, AnalyticNumberTheoryPartI and ExplicitPrimeCounting (main), and also ExponentialSumsAndCircleMethodPartII (open; a geometric circle method over function fields); the third list is empty. Shared objects and owners: Vaughan's identity, SieveMethodsAndPrimePatterns §2.4, cited; ψ(x; q, a) and Siegel–Walfisz, AnalyticNumberTheoryPartI §0.32, cited, with a declared local copy of `psiAP` under this roadmap's namespace; the Kloosterman sum, AutomorphicSpectralTheory §1.16, cited. The Ramanujan sum, the singular series, the type I and II bounds for additive twists and the three-primes theorem are stated by no other roadmap, open or on main. No open pull request changes this roadmap or drops an id it cites.
- Dependency check: `depcheck: 200 roadmaps, 2198 edges, 0 problem(s)`; no UPWARD or CYCLE line. The roadmap is on main and its three suppliers are on main (merge-order lines 54, 62, 104). Nothing changes outside the folder. The automatic checks all pass on this head.
- Elaboration: `lake env lean` on `TauCetiRoadmap/CircleMethodThreePrimes/Suggested.lean` gives 18 `declaration uses sorry` warnings and nothing else; no `set_option`, no sorried data, one `import Mathlib`. The 28 elaborated signatures were compared with the README statements (casts of `a / q`, `singularSeries ↑N`, natural division in `N / m`) and agree; the file has no section variables. One-tactic probe on a copy: all 18 sorried theorems tried with `rfl` and `simp`, none closed; no padding.
- Headline theorems (minor-arc bound, asymptotic formula with the count, Vinogradov's theorem, with Siegel–Walfisz for all x ≥ 2) are all stated in `Suggested.lean`; none is unstatable.
- Description against the head: 15 Checks counted (0.1: 2, 0.2: 3, 2.1: 2, 3.1: 2, 3.2: 1, 4.1: 2, 4.4: 3); the §4.6 restatement, the §1.2 hypotheses, the supplier subsections, the removed tables and "`Suggested.lean` is unchanged" all agree; it says the roadmap is revised in form. Only the sentence in C03 is contradicted.

Source independence: 6 passages compared with 1 source (helfgott2015 lines 366–371 against §4.8; 327–332 against the docstring of `vinogradov_threePrimes`; 1007–1012 against the route of §2.1; 1108–1116 against the route of §1.1; line 1110 against the bound of §0.1; 470–492 against Convention 9 and §4.1), none shared beyond forced formulas and names; largest share Davenport, *Multiplicative Number Theory*, 6 of 12 locators, whose text and contents could not be read, so wording and arrangement were not compared with it; contents compared with helfgott2015 (lines 60–112): independent. The order of the layers is forced by the *Needs:* lines (2.1 needs 1.1 and 1.2; 3.2 needs 3.1 and 2.1; 4.3 and 4.6 need Layers 2 and 3).

Research link: the headline is Vinogradov's three-primes theorem (Vinogradov 1937) by Vaughan's identity (Vaughan 1977); Helfgott (2015) makes this circle method explicit to prove the ternary Goldbach conjecture. Rests on the README's references and helfgott2015 lines 327–332 and 1007–1009.

## Not verifiable

- Davenport, *Multiplicative Number Theory*, Chapters 25–26 (§§0.2, 1.1, 1.2, 2.1, 3.2 and Layer 4): a closed Springer text, not among the texts held for this roadmap; not read.
- Iwaniec–Kowalski, *Analytic Number Theory*, §§13.5 and 19.4 (§§2.1, 3.2, Layer 4): closed (AMS), not held; not read.
- Vaughan, *The Hardy–Littlewood Method*, Lemma 2.2 (§1.1): closed (Cambridge), not held; not read.
- Vaughan, C. R. Acad. Sci. Paris 285 (1977) (§2.1), and Vinogradov, Dokl. Akad. Nauk SSSR 15 (1937) (References): not held, and no open copy was looked for beyond the texts held.
- The sampled sections 0.1, 2.2, 3.1, 4.9 carry no locator; their statements were checked by computation only (table above).

## Source issues

- none

## For the human reviewers

- **Not tested.** Davenport (GTM 74) has the largest share of locators, 6 of 12 in `TauCetiRoadmap/CircleMethodThreePrimes/README.md`, and is closed: wording and arrangement were not compared with it.
- **Licence.** README "Prior work" (lines 470–475) names `github.com/sthubbar/lean-lab-ci` as a source ported "with its author's agreement". Its root shows a NOTICE file and no LICENSE file; its contents were not compared with `Suggested.lean`.
- **Supplier route.** The unconditional headline consumes AnalyticNumberTheoryPartI §0.32, which main proves through its §0.34, an effective exclusion of Landau–Siegel zeros. §4.9 here uses only that a constant exists, which the classical ineffective theorem gives.
