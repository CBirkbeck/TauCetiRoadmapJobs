# Review of CircleMethodThreePrimes (pull request #2543 at 0e859d6)

**Verdict:** accepted

**Summary.** Accepted. There are no findings: every statement, Check and worked example holds at the values computed, the three supplier citations resolve on main, `Suggested.lean` elaborates with only `sorry` warnings, and the rewritten §4.6 error term is now correct. There are three small corrections and one format note, none blocking: an ambiguous remark in §2.2 about the constant 1; docstrings that call the threshold of Vinogradov's theorem "ineffective"; and a build guide (repeated in the description) that overstates what every section carries. The previous review left no open finding. Three points are left to the human reviewers: the closed main source, the licence of the repository named under "Prior work", and the route of the supplier's Siegel–Walfisz theorem.

## C01 — The remark closing §2.2 reads as saying the Parseval bound fails with the constant 1, but only the route through ψ(N) ≤ N fails

At the end of §2.2 (lines 239–240): "The constant `1` is not available in place of `log 4 + 4`: `ψ(19) ≈ 19.27 > 19`…". The paragraph uses `log 4 + 4` twice, once in the bound `∑_{n ≤ N} Λ(n)² ≤ (log 4 + 4) N log N` and once in `ψ(N) ≤ (log 4 + 4) N`, and the witnesses refute only the second. The first holds with constant 1 throughout the range computed: `∑_{n ≤ N} Λ(n)² ≤ N log N` for every `2 ≤ N ≤ 2·10⁷`, with largest ratio 0.940 (at `N = 19 965 521`). Its asymptotic `N log N − N + o(N)` keeps it below `N log N` beyond that. Main's text had "this way", which removed the ambiguity. The sentence would read: "This route cannot give the constant `1`, since `ψ(N) ≤ N` fails: `ψ(19) ≈ 19.27` and `ψ(113) ≈ 117.39`."

## C02 — Three docstrings of `Suggested.lean` call the constant or the threshold "ineffective", which the cited Helfgott text contradicts for the theorem as stated

`SiegelWalfiszBound` (line 135) says "The constant is ineffective." `vinogradov_threePrimes` and `vinogradov_threePrimes_unconditional` (lines 212 and 223) say "The threshold is ineffective." Both statements are existentials. Ineffectivity is a property of the classical proof through Siegel's theorem, not of the theorem. helfgott2015 lines 372–384 record effective thresholds (Mardzhanishvili 1941, Vinogradov 1947) and explicit ones (Borozdkin). Its Theorem 1.1.1 (helfgott2015 line 327) covers every odd number greater than 5. The supplier, AnalyticNumberTheoryPartI §0.32, now also states its constant as effective. The README already says this correctly (Convention 8; §3.1, line 266: "the classical proof gives no way to compute it"). The docstrings would match it with: "The threshold is existential; the classical route through Siegel–Walfisz gives no way to compute it" (and the same with "constant" at line 135).

## C03 — The build guide and the description describe the sections more uniformly than they are

"How to read the build" (lines 42–44) says each numbered section comes "with its source and its own *Needs:* line", and that "Layers 0 and 1 need only Mathlib". §§0.1, 2.2, 3.1 and 4.9 carry no source; §§4.2–4.7 rely on the layer-wide line at 324. The identification in §0.2 needs AutomorphicSpectralTheory §1.16, as the Layer 0 dependencies (line 168) say. The description repeats the first claim: "each section now states its target in prose with its hypotheses, its source and its own *Needs:* line". The smallest repair would be "each with its own *Needs:* line, and with its source where the result is not elementary", plus "Layers 0 and 1 need only Mathlib, apart from the identification in §0.2". The description sentence would change the same way.

## N01 — The "Consumed, not redefined" bullet for AutomorphicSpectralTheory (lines 515–517) reads as if §1.16 supplies the divisor formula

That roadmap records `S(m, 0; c) = ∑_{d ∣ (m, c)} μ(c/d) d` only among its Checks (its README line 1247), and §0.2 here proves it as `ramanujanSum_eq_sum_divisors`. "whose Checks record the divisor formula" would match the contract at line 598.

## Verified sound

| Statement | Instances tried | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| 0.1 `expTwoPiI`, `distInt`, `norm_sum_expTwoPiI_le` | α = 0, 1/2, 1/4; `distInt` at 1/2, −0.3, 7; β = 0 | e: 1, −1, i. `distInt`: 1/2, 0.3, 0 (fract gives 0.7). At β = 0: sum N; `if` gives N, bare min gives 0 | holds | none |
| 0.2 `ramanujanSum`, divisor formula, `ramanujanSum_mul` | q < 60, abs(n) ≤ 30; coprime q₁, q₂ < 20 including (0, 1) | `c₁₂` at n = 1, 2, 3, 4, 6, 0: 0, 2, 0, −2, −4, 4 both ways; `c₉(3) = −3`; `c₀c₁ = 0 = c₀`; 0 mismatches | holds | none |
| 1.1 `sum_min_inv_distInt_le` | α = 0, q = 1, c = 0; X < M; q > M | LHS `X·H_M ≤ X(1 + log M)` against `C(X + M + 1) log 2M`; for X < M, `X(1 + log M) ≤ M(1 + log M)` | holds | none |
| 1.2 `norm_typeII_le` | M = N; Cauchy–Schwarz route with 1.1 at `H = ⌊N/M⌋ ≥ 1`, X = N | M = N: `⌊N/m⌋ = 0`, LHS 0. In general `abs(Σ)² ≤ ‖a‖²‖b‖²(M + C(N/q + N/M + q) log 2Nq)` | holds | none |
| 2.1 `norm_primeExpSum_le` (headline) | α = 1/2, q = 2; q > N; Checks at N = 1, 2, 4 | `S_10(1/2) = −3.67313` and `−log 2520 + 6 log 2 = −3.67313`; q > N: `(Nq)^½ > N`; `S_4(0) = log 12`, log 6 over primes only | holds | none |
| 2.2 Parseval and its remark | ψ(19), ψ(113); `∑Λ² / (N log N)` for N ≤ 2·10⁷ | 19.2657 > 19; 117.3867 > 113; largest ratio 0.940 < 1 | true; remark ambiguous | C01 |
| 3.1 reduction, `psiAP`, `SiegelWalfiszBound` | q = 1; q = 2, a = 0, 1; ψ(10; 2, 0) | difference `≤ ω(q) log x ≤ log q log x / log 2`, 0 at q = 1; ψ(10; 2, 0) = 3 log 2; `x/q` variant fails (x/2 against ψ(x; 2, 1) ∼ x) | holds | none |
| 3.2 `primeExpSum_majorArc` | (q, a, β) = (1, 0, 0), (2, 1, 0); `abs(β) N ≥ (log N)^A` | `abs(ψ(N) − N)`; `abs(N − ψ(N) + 2 log 2 ⌊log₂N⌋)`; for large β, LHS ≤ 2(log 4 + 4)N ≤ RHS | holds | none |
| 4.1 `threePrimeWeight`, `threePrimeCount`, integral form | N = 0, 3, 5, 6, 7, 9 | r = 0, 0, 0, (log 2)³, 3(log 2)² log 3; R(5, 6, 7, 9) = 0, 1, 3, 4; unordered R(9) = 2 | holds | none |
| 4.2 arcs | disjointness; Dirichlet with n = ⌊N/Q⌋ | `1/(qq′) ≥ Q⁻² > 2Q/N` since 2Q³ < N; a > q would give `a/q ≥ 1 + 1/Q > 1 + 2Q/N` | holds | none |
| 4.3 minor arcs | 2.1 with Q < q ≤ N/Q | `Nq^(−½)` and `(Nq)^½` are both ≤ `NQ^(−½)`; times `(log 4 + 4) N log N` gives `N²(log N)^(5 − B/2)` | holds | none |
| 4.4 `singularSeries`, Euler product, parity, lower bound | N = 0, 1, 3, even, odd, negative odd | 𝔖(1) = 2.30096, 𝔖(3) = 1.53397 = (2/3)𝔖(1); factor at 2 is 0 for even N, 2 for odd N; c = 1.32032; q³ variant: 7/8 | holds | none |
| 4.5 `integral_geomSum_cube`, tail bound | N = 1, 2, 5; indexing from 0 | ℕ formula gives 0, 0, 6; indexing from 0 gives C(7, 2) = 21; tail ≤ 2∫(2β)⁻³ dβ = N²/(8Q²) | holds | none |
| 4.6 major arcs (restated) | error budget with A′ = A + 4B | `N²Q³(log N)^(B − A′) = N²(log N)^(−A)`; truncation `N²Q⁻²`; `(N − 1)(N − 2)/2 − N²/2 = O(N)` | holds | none |
| 4.7 `threePrimeWeight_asymptotic` (headline) | B = 2A + 10; even N | minor arcs give exponent 5 − B/2 = −A; series truncation −B/2; even N: r(N) ≤ CN(log N)² while 𝔖 = 0 | holds | none |
| 4.8 `threePrimeCount_asymptotic`, `vinogradov_threePrimes` | even N; proper prime powers | even N: R(N) ≤ 3π(N), so R(log N)³/N² → 0; ψ − θ = O(√N) gives O(N^(3/2) log N) | holds | none |
| 4.9 `siegelWalfiszBound`, `vinogradov_threePrimes_unconditional` (headline) | supplier `siegel_walfisz` (eventual, ∃ C > 0) against ∀ x ≥ 2 | bounded x: `abs(ψ(x; q, a) − x/φ(q)) ≤ (log 4 + 5)x ≤ C x (log x)^(−A)` after enlarging C | holds | none |
| Docstrings at lines 135, 212, 223 | helfgott2015 lines 327, 366–384 | statement is ∃ N₀; effective (1941, 1947) and explicit thresholds known, N₀ = 7 | misleading | C02 |
| Build guide, lines 42–44 | §§0.1, 2.2, 3.1, 4.9; *Needs:* of §0.2 | no source in four sections; §0.2 needs AutomorphicSpectralTheory §1.16 | misdescribes | C03 |

- Previous review (of the pull request that added this roadmap): no open finding, so there was nothing to repair.
- Source locators checked against the text: 1 of 12 (helfgott2015 Chapter 1, lines 327 and 362–384, for §4.8: supports the existential threshold of Vinogradov's first proof). The 11 others (Davenport ×6, Iwaniec–Kowalski ×3, Vaughan's book ×1, Vaughan 1977 ×1) are listed under Not verifiable.
- Library declarations opened at the pin: `Chebyshev.psi` (NumberTheory/Chebyshev.lean:70), `Chebyshev.psi_le_const_mul_self` (:485), `ArithmeticFunction.vonMangoldt_le_log` (NumberTheory/ArithmeticFunction/VonMangoldt.lean:152), `Real.exists_int_int_abs_mul_sub_le` (NumberTheory/DiophantineApproximation/Basic.lean:94), `sum_mul_eq_sub_sub_integral_mul` (NumberTheory/AbelSummation.lean:128, RCLike 𝕜), `Real.fourierChar_apply` (Analysis/Complex/Circle.lean:232), `UnitAddCircle.norm_eq` (Analysis/Normed/Group/AddCircle.lean:223), `HasProd` (Topology/Algebra/InfiniteSum/Defs.lean:107). No Ramanujan sum, Vaughan identity, Siegel–Walfisz or circle method in Mathlib or Tau Ceti at the pins.
- Cross-roadmap citations resolved on main, 3: AnalyticNumberTheoryPartI §0.32 (README 849; `psiAP` Suggested 166, same body; `siegel_walfisz` Suggested 328); SieveMethodsAndPrimePatterns §2.4 (README 2041; coefficient energies; `SieveVaughan.vaughan_identity` Suggested 363, which also holds at n = 0); AutomorphicSpectralTheory §1.16 (README 1232–1257, no Lean name). Also resolved: ContourIntegration (Completed), ImaginaryQuadraticClassNumber, ZerosOfLFunctions, AnalyticNumberTheoryPartI §1.2. No roadmap on main or at an open head consumes this one.
- Overlap check: read ExplicitCharacterSumsAndSieves, ExplicitMultiplicativeFunctions and QuasiRiemannHypothesis (open), SieveMethodsAndPrimePatterns, AnalyticNumberTheoryPartI and ExplicitPrimeCounting (main), plus ExponentialSumsAndCircleMethodPartII, AnalyticNumberTheoryPartIII and CharacterSumsOverFiniteFields. Shared objects and their owners: Vaughan's identity (SieveMethodsAndPrimePatterns §2.4, cited here); ψ(x; q, a) and Siegel–Walfisz (AnalyticNumberTheoryPartI §0.32, cited, local `psiAP` copy declared as such under another namespace); the integer-modulus Kloosterman sum (AutomorphicSpectralTheory §1.16, cited; CharacterSumsOverFiniteFields §7.3 compares with it). AnalyticNumberTheoryPartI §1.2a uses type I and II bounds only for its Möbius coefficients, as this roadmap's scope says. The third list is empty, and no other pull request changes or drops an id of this roadmap.
- Automatic checks: the gate on this head returns every check 0, OK. Dependency check output: `depcheck: 200 roadmaps, 2198 edges, 0 problem(s)` (no UPWARD or CYCLE line). Suppliers sit at merge-order lines 54, 62 and 104; the roadmap itself is on main.
- Elaboration: `lake env lean TauCetiRoadmap/CircleMethodThreePrimes/Suggested.lean` gives 18 `declaration uses sorry` warnings and nothing else. All 28 elaborated signatures were compared with their README statements and agree; the file has no section variables. One-tactic probe on a copy of the file: 11 theorems tried with `simp` or `exact`, none closed, so there is no padding.
- Description sentences checked against the head, 14: the count of 15 Checks (six new, matching); the §4.6 correction and its error terms; the §1.2 hypotheses; the quantifier changes in §§3.1, 4.2, 4.3, 4.5; the supplier subsections; "nothing consumed from Tau Ceti"; the nine Mathlib declarations; "`Suggested.lean` is unchanged" (empty diff); "no roadmap consumes this one"; the effective form of §0.32. Only the "its source" sentence is contradicted (C03).

Source independence: 5 passages compared with 1 source (helfgott2015 lines 366–371 against §4.8; 1007–1012 against the §2.1 route; 1108–1116 against the §1.1 route; line 1110 against the §0.1 bound; 471–490 against Convention 9 and §4.1), none shared beyond forced names and formulas. Largest share is Davenport, *Multiplicative Number Theory*, with 6 of 12 locators; its text and contents could not be read, so wording and arrangement were not compared with it. The layer order 0 → 1 → 2 and 3 → 4 is forced by the *Needs:* lines (2.1 needs 1.1 and 1.2; 3.2 needs 3.1; 4.3 and 4.6 need Layers 2 and 3).

Research link: the headlines are Vinogradov's three-primes theorem (Vinogradov 1937), with Vaughan's 1977 minor-arc method. This is the circle method that Helfgott (2015) makes explicit to prove the ternary Goldbach conjecture. Rests on the README's references and helfgott2015 Chapter 1, lines 329–405 and 1007–1009.

## Not verifiable

- Davenport, *Multiplicative Number Theory*, Chapters 25–26 (locators in §§0.2, 1.1, 1.2, 2.1, 3.2, Layer 4): closed (Springer); the public contents page redirects to an authorisation page.
- Iwaniec–Kowalski, *Analytic Number Theory*, §§13.5 and 19.4: closed; the AMS book pages return 403.
- Vaughan, *The Hardy–Littlewood Method*, Lemma 2.2 and Chapter 3: closed (Cambridge); not fetched.
- Vaughan, C. R. Acad. Sci. Paris 285 (1977) and Vinogradov, Dokl. Akad. Nauk SSSR 15 (1937): no legal copy located.

## Source issues

- none

## For the human reviewers

- **Not tested.** Davenport (GTM 74), the source with the largest share of locators (6 of 12 in `TauCetiRoadmap/CircleMethodThreePrimes/README.md`), is closed: wording and arrangement were not compared with its text or contents.
- **Licence.** README "Prior work" (lines 470–475) names `github.com/sthubbar/lean-lab-ci` as a source whose material is restated "with its author's agreement". Its root shows no LICENSE file; the description says Apache 2.0 parts keep their notices. No matching file names were seen.
- **Supplier route.** The unconditional headline consumes AnalyticNumberTheoryPartI §0.32, which on main is routed through its §0.34, an effective exclusion of Landau–Siegel zeros for every conductor. §4.9 here assumes only that a constant exists, which the classical ineffective proof gives.
