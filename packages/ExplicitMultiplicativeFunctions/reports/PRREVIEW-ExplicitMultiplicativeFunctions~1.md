# Review of ExplicitMultiplicativeFunctions (pull request #1946 at fa74009)

**Verdict:** needs changes

Eight findings: four P1, three P2, one P3. The push gate passes at this head, the dependency check reports no problem, and `Suggested.lean` elaborates with `sorry` as the only warning. The blocking defects are in the routes the README gives for its targets: the 2013 transfer chain of 1.5 does not close, two identities of 1.1 are mistranscribed, and several route inputs have no owner. In what follows `README.md` and `Suggested.lean` mean `TauCetiRoadmap/ExplicitMultiplicativeFunctions/README.md` and `TauCetiRoadmap/ExplicitMultiplicativeFunctions/Suggested.lean`.

## R01 (P1) — The route of the 2013 transfer instance does not close, so the headline's hypothesis list is not known to suffice

- **Location.** `README.md` lines 1221–1224 (Lemma 7.2's scheme) and 1248–1272 (the instance); `Suggested.lean` line 101 (field (ii)) and lines 165–183 (`abs_moebiusSum_le_ramare`). Quote, line 1248: "The route is Lemma 7.2: `|Σ_{d ≤ D} μ(d) log² d| ≤ (0.0130 log D − 0.144) D` for `D ≥ 2 161 205` (lines 680–684), by the scheme of Lemma 7.2 for `D/K ≥ 2 160 535`".
- **Claim.** The route fails in three places.
  - (a) With `ρ = 0.0213`, `S_K/A = 0.03739` and `K = 462 848`, the scheme's bound `2γ/D + ρ((6/π²) log(D/K) + 1.166) + S_K/A` is larger than `0.0130 log D − 0.144` for every `D` from `K·2 160 535 ≈ 10^{12}` up to about `e^{729}`. This is exactly where the scheme is used. The error comes from the source (`ramare2013aa` lines 642–643).
  - (b) The scheme needs `|R₂*(y)| ≤ ρy` at every argument `y = D/ℓ ≥ K + 1 = 462 849`. The inputs give `0.0213` only from `1 435 319` (line 1265). Below that, field (i) gives only `1.80 √y log y`.
  - (c) The analytic range needs `√D ≥ x₄ = 1 520 000`, that is `D ≥ 2.3104·10^{12}`. Field (ii) stops at `2.31·10^{12}`, and lines 1258 and 1268 claim the analytic range starts there. On `(2.31·10^{12}, 2.3104·10^{12})` we have `√D ∈ (1 519 868, 1 520 000)`, where `hψ₅` does not apply.
- **Witness.** At `D = 462 848·2 160 535` (`log D = 27.631`): `0.0213·(0.60793·14.586 + 1.166) + 0.03739 = 0.2511`, which exceeds `0.0130·27.631 − 0.144 = 0.2152`. Closing needs `ρ ≤ 0.0177`, but the computed `|R₂*(463 206)|/463 206` is `0.02109`. Field (i) at `y = 463 206` gives `0.0345 y`.
- **Repair.**
  - Extend field (ii) of `RamareTransferComputations` (README 0.7 (ii), `Suggested.lean` line 101) to `462 849 ≤ D ≤ 2.3104·10^{12}`. Tested: the computed maximum of `|R₂*(y)|/y` is `0.021093` on `[462 849, 1 435 319]` and `0.0123` on `[1 435 319, 3·10^6]`.
  - Replace the uniform-ρ step by a chain that closes for every `D ≥ 10^{12}`. One option splits the `ℓ`-sum at a height `Y`, uses the computed supremum of `|R₂*(y)|/y` on `[K + 1, Y]` as a named field, and uses the analytic `ρ` beyond `Y`. Another is the larger `K` with the `10^{16}` table, as in 1.10. Record the check that the new chain gives at most `0.2152` at `D = 462 848·2 160 535` and at most `0.0130 log D − 0.144` beyond. Then give `abs_moebiusSum_le_ramare` exactly that chain's hypotheses.
  - If no closing chain is fixed, either state the conclusion through 1.10's route (Ramaré–Zuniga Alterman's Corollary 1.1), or list the theorem in the docstring with 1.10 as a statement whose hypothesis list is not known to suffice.

## R02 (P1) — Balazard's `ε₁` is mistranscribed: as written it is discontinuous and Proposition 6 fails

- **Location.** `README.md` line 975: "`ε₁(t) = 1/3 − 1/(3t) + ((4/3){t}³ − (3/2){t}² + (1/2){t})/t² − ((1/3){t}⁴ − 2{t}³ + {t}²)/t³`".
- **Claim.** In the source the factors `4/3` and `1/3` multiply whole polynomials: `(4/3)B₃({t})/t²` and `(1/3)({t}⁴ − 2{t}³ + {t}²)/t³` (`balazard2012` lines 424–426; the derivative at line 431 differentiates `4B₂({t})`). The README applies them to the leading monomials only. The function it writes does not satisfy `(4/3)φ₃ − (1/3)φ₄ = x − 1 − ε₁`. Proposition 6 (line 977) fails for it, Balazard's identity for `m` (line 983) fails, and so does the Check "`ε₁` is continuous" (line 1023).
- **Witness.** With the written formula, `ε₁(2⁻) = 1/3` but `ε₁(2) = 1/6`, and the derivative is `ε₁'(1.5) = 0.23457` instead of `1/81`. With the factors applied to the whole polynomials, `ε₁(2⁻) = ε₁(2) = 1/6` and `ε₁'(1.5) = 0.012346 = 1/81`. Both computed.
- **Repair.** Write `ε₁(t) = 1/3 − 1/(3t) + (4/3)({t}³ − (3/2){t}² + (1/2){t})/t² − (1/3)({t}⁴ − 2{t}³ + {t}²)/t³`. Add Checks for `ε₁(2⁻) = ε₁(2) = 1/6` and `ε₁'(1.5) = 1/81`; both values were computed with the corrected formula.

## R03 (P1) — Ramaré's weight passage (Lemma 8.1) has the wrong sign

- **Location.** `README.md` line 1001: "`M₀(f, D) = M_k(f, D)/log^k D + M₀(f, D₀) − M_k(f, D₀)/log^k D₀ − k ∫_{D₀}^D M_k(f, t) dt/(t log^{k+1} t)`".
- **Claim.** Abel summation against `1/log^k t`, whose derivative is `−k/(t log^{k+1} t)`, gives `+ k ∫`. The README copies the source's misprint (`ramare2013aa` line 697). The two Checks at lines 1035–1037 have a vanishing integral, so they cannot pin the sign. The bound derived in 1.5 is unaffected because it uses `|M₂|`.
- **Witness.** Take `f = 1_{n=3}`, `k = 1`, `D₀ = 2`, `D = 4`. Then `M₀ = 1`, `M₁(f, 4)/log 4 = 0.79248` and `k ∫ = 1 − log 3/log 4 = 0.20752`. The README's right side is `0.79248 − 0.20752 = 0.585 ≠ 1`; with `+ k ∫` it is `1`.
- **Repair.** Change "`− k ∫`" to "`+ k ∫`" at line 1001 and add this instance as a Check.

## R04 (P1) — Four route inputs are cited only through a source and have no owner

- **Location.** `README.md` line 1130 (1.4): "the elementary inequality … `elMarraki1995` (3.1) … cited by its locator". Line 1770 (2.6): "the source quotes from Helfgott's monograph, cited through it". Lines 2591–2592 (7.2): "a count of odd squarefree integers from Helfgott's monograph". Lines 2999–3000 (7.9): "second and fourth moments, which belong to ExplicitZetaBounds".
- **Claim.** A citation is not a supplier. None of these inputs is a target here, a named supplier section, or a named proposition of 0.7. Section 2.6 also relies on "∫_1^X |m_q| bounded as in its Lemma 5.4" and on "direct checks for `X < 47`", and 7.2 on "an interval-arithmetic check on `[1, 1573]`"; these two finite checks break the README's own rule that every finite computation is a named proposition. ExplicitZetaBounds' target list has the critical-line bound (target 7) and a second moment (target 12) but no explicit fourth moment, and 7.9 declares no gap.
- **Witness.** In ExplicitZetaBounds' board `target.md`, "second moment" occurs only in target 12 (Kadiri 2013) and "fourth moment" occurs nowhere. No layer of `README.md` states El Marraki's (3.1) or Helfgott's bounds.
- **Repair.**
  - State El Marraki's (3.1) as a target of 1.4, with its range and a route.
  - State Helfgott's odd-integer Möbius bounds, his odd squarefree count and RZA 2026's Lemma 5.4 as targets, or as gaps with a named owner.
  - Add the checks `X < 47` and `[1, 1573]` as propositions in 0.7.
  - For 7.9, declare `gap:` contracts on ExplicitZetaBounds targets 7 and 12 in both the README and `plan.json`. They must give the exact critical-line, second-moment and fourth-moment bounds that Palojärvi–Tudzi use.

## R05 (P2) — Robin's σ(n)/n headline takes no hypotheses and its inputs are not named

- **Location.** `Suggested.lean` lines 339–345 (`sigma_one_div_lt_robin`, which has no hypotheses). `README.md` lines 3390–3391: "the source's route is the reduction to colossally abundant numbers with explicit lower bounds for `θ`, which here are inputs from the explicit-primes roadmap."
- **Claim.** The Conventions (README lines 192–201) and the module docstring (`Suggested.lean` lines 16–21) require every prime estimate and every finite computation a proof uses to be a hypothesis of exact shape. This target names no `θ` bound, no ExplicitPrimeCounting section and no verification of the colossally abundant numbers, and 9.3's *Needs:* line lists nothing for it. As a result the README states the bound "under inputs" while the Lean statement is unconditional.
- **Witness.** The other three Layer 9 headlines carry their prime inputs and tables as hypotheses (`Suggested.lean` lines 322–324, 333 and 353–357). `robin1984` is uncertified, so its inputs cannot be read off the source.
- **Repair.** Name the `θ` input with its ExplicitPrimeCounting section, and add a 0.7 proposition for the colossally abundant numbers below the analytic range. Make both hypotheses in README 9.3 and in `sigma_one_div_lt_robin`. If the inputs cannot be fixed, delete `sigma_one_div_lt_robin` from `Suggested.lean` and name it in the docstring as resting on inputs that are not fixed.

## R06 (P2) — The Rankin-type bound has two owners, and the Downstream bullet misstates the other roadmap

- **Location.** `README.md` lines 2328–2331, where 6.1 proves `Σ_{n ≤ x} f(n) ≤ x exp(Σ_{p ≤ x}(f(p) − 1)/p)`. Lines 3501–3503: "the Rankin-type bound … of its §3.7 is the instance of 6.1 recorded there, which it imports rather than restates."
- **Claim.** At the head of pull request #1421 (ProbabilisticAndMetricNumberTheory, `e4c4e53`), §3.7 states and proves this bound itself and never cites this roadmap. One object therefore has two owners, and the Downstream bullet describes a citation that does not exist.
- **Witness.** `TauCetiRoadmap/ProbabilisticAndMetricNumberTheory/README.md` lines 4002–4007 at that head: "Rankin-type bound for multiplicative functions (case of Lemma 7.2) … Write f = 1 * h …". The string "ExplicitMultiplicativeFunctions" does not occur in that file.
- **Repair.** Keep the bound in 6.1, since this roadmap is earlier in the merge order (ORDER.txt line 273 against 275). Rewrite the Downstream bullet to say what §3.7 consumes, without claiming it already imports it. ProbabilisticAndMetricNumberTheory's pull request then replaces its §3.7 proof with a citation of 6.1.

## R07 (P2) — `gap:zeta-reciprocal-bounds` and Layer 1.9 leave the Littlewood and Korobov–Vinogradov bounds unstated

- **Location.** `README.md` lines 413–414: "`|1/ζ(σ + it)| ≤ 1237 (log t)^{11/12}`, with the Littlewood and Korobov–Vinogradov companions". Lines 1432–1433: "the two companion bounds of Littlewood and Korobov–Vinogradov shape, each valid for `x ≥ e^{4589.20}`".
- **Claim.** The contract's "needs" asks for two bounds without giving a region, constant or exponent, so it is vague. It also bundles two supplier targets (7 and 16) under one slug, so it is compound. In 1.9, two of the three stated bounds have no exact statement at all.
- **Witness.** Neither occurrence attaches a constant, a zero-free region or a range to "companions". The `needs` of `plan.json` repeats the same words.
- **Repair.**
  - Write out Lee–Leong's two companion bounds in 1.9 (`leeLeong2022` (9)–(11): region, constant, exponent, range).
  - Give the matching `1/ζ` bounds in the gap's needs sentence.
  - Split the slug into one for target 7 (`σ ≥ 1`, `t ≥ 13`) and one for target 16 (the zero-free-region bounds), in both the README and `plan.json`.

## R08 (P3) — Numerical slips in Checks and Examples

- **Location and witness.**
  - (a) Line 1389: "the linear term is `7.85·10^{−8} x`". At `T = 10^7 + 1`, 1.7's linear term is `π/(2·10^7) = 1.5708·10^{−7}`, which is larger than `1/(8.7·10^6) = 1.149·10^{−7}`. So `L = 8.7·10^6` is unreachable from that instance, and the reachable limit is `L < 6.37·10^6`, not `1.27·10^7`.
  - (b) Line 1781: `g₀(2) = (√6 − √3)/2 = 0.358719`, not `0.35876`.
  - (c) Line 1805: `m_6(30) = 1 − 1/5 − 1/7 − 1/11 − 1/13 − 1/17 − 1/19 − 1/23 − 1/29 = 0.299894`, not `0.367…` (computed).
  - (d) Line 2127: `3·0.961 t^{−1/6} ≤ 1.16` holds exactly for `t ≥ 235.68`, not `235.2`. The source says 236 (`berkaneBordellesRamare2012` line 1146), and the finite check on `[1, 236]` still covers the gap.
- **Repair.**
  - (a) Use `1.5708·10^{−7}` and rewrite the conclusion: with zeros to `10^7 + 1`, no `L ≥ 6.37·10^6` is reachable.
  - (b) Write `0.35872`.
  - (c) Write `0.2999`.
  - (d) Write `235.7`.

## Verified sound

**Gate and build.** I re-ran the push gate at this head: every check is 0 and the result is OK. The dependency check (`gate --depcheck … --movable`) prints `depcheck: 242 roadmaps, 2452 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line. `lake env lean` on `Suggested.lean` gives exactly 13 `sorry` warnings (lines 165–352) and no other message.

**Signatures.** I appended `#check @name` for all 13 theorems to a scratch copy of `Suggested.lean` and compared each elaborated type with its README statement. None depends on a section `variable`, so no binder was dropped, and the README and Lean generality agree; no change resulted.

**Padding probe.** I replaced each `sorry` by `first | rfl | (simp; done) | (norm_num; done) | positivity | infer_instance | exact le_rfl`. All 13 failed, so nothing is padding. Each of the 13 definitions is used by a headline.

**Headlines.** Every headline the Summary names is stated, or named in the docstring as not stated (1.10 and the preprint rows).

**Library declarations, at the pins.**
- 57 Mathlib names from the supplier contracts resolve by `#check`: the Abel-summation, harmonic and Euler–Mascheroni lemmas, `hasSum_zeta_two`, the `d6`/`d9` decimal bounds, the `DirichletCharacter.LFunction` facts, `EulerProduct`, `Polynomial.bernoulli`, `Nat.primesLE`, `Nat.primesBelow`, `Nat.nth_prime_zero_eq_two`, `primorial`, and the `Chebyshev` and `ArithmeticFunction` lemmas.
- 15 Tau Ceti names resolve. Twelve resolve by `#check`, including `TauCeti.LFunctions.mertensConstant`, which `#print` shows is the `limUnder` of `primeSummatory K (1/N𝔭) − log log x`. Three are in modules with no build, so I read them in the source at the pin:
  - `TauCeti.sigma_le_rpow_mul_tsum`, `TauCeti/NumberTheory/ArithmeticFunction/DivisorBounds.lean:52`;
  - `Nat.primeCounting_nth_prime`, `TauCeti/NumberTheory/PrimeCounting.lean:90`;
  - `Nat.tendsto_prod_primesLE_filter_notMem_one_sub_inv_inv_atTop`, `TauCeti/NumberTheory/SumPrimeReciprocals.lean:57`.
- I also read `localArithmeticFactor` (`EulerProduct/Basic.lean:144`) and `sum_Icc_rpow_mul_eq` (`AbelSummation.lean:252`).

**Cross-roadmap citations resolved, at the stated heads.**
- ExplicitPrimeCounting at `98329b3`: §§1.1, 1.3 (`ButheVerified`, line 800), 1.6, 1.7, 3.1, 3.2 (`1.03883`; `θ > x(1 − 1/(2 log x))` from 563), 3.3 (`0.006409`), 3.5 (`x ≥ 17`), 4.2 (`0.0067/log x` from `1.52·10^6`), 4.3 (Vanlalngaia `1/log³ x` from 24 284 with `B = mertensConstant ℚ`; Axler's `f(x)`), 4.7 (line 2442 leaves the product forms here), 5.3, 6.1 (row `(1, 0.000213, 10^{10})`) and 6.3 (`c_θ ≤ 1/840`). That is 14 sections. None of the six gaps the README declares is already provided there.
- AnalyticNumberTheoryPartI at `2b9b7af`: §§0.8, 0.11, 0.19, 0.21, 0.26, 0.34, 3.1, 3.7, 3.9, 3.11, 3.12, 3.22, 3.22a, 3.22b, 3.23a (`divisorError` and `BBRFiniteInput`, whose conjuncts 1 and 4 are as quoted) and 3.35/3.35a, 17 in all.
- SieveMethodsAndPrimePatterns at `39cf901`: §0.5 (`HasLogSieveDimension`) and §1.1.
- ZerosOfLFunctions Layer 9 (`AllOnCriticalLine`, on main).
- ExplicitZetaBounds' board targets 7 and 16 exist.
- ExplicitNumberFields cites §§7.5, 7.9, 8.1, 9.1 and 9.4, all present here.
- Ownership against the open pull requests listed in the brief: searched by object (Stieltjes constant, superior highly composite numbers, Hall–Tenenbaum, Möbius summatory bounds, Balazard, Nicolas–Robin, Levin–Fainleib, the `n/φ(n)` bound). The only second owner found is R06. `overlaps.md` reports no dropped ids and no other pull request changing this roadmap; I confirmed both.

**Declared gaps.** All 17 slugs of `plan.json` have ExplicitPrimeCounting or ExplicitZetaBounds as supplier. Eleven are cited as supplied, and each matches an existing ExplicitPrimeCounting section. Six are stated as contracts: `psi-initial-range`, `mertens-reciprocal-axler`, `psi-relative-bklnw`, `psi-tilde-difference` and `psi-log-power` are precise and minimal; `zeta-reciprocal-bounds` is vague (R07).

**Sources sampled.**
- 0.2: `ramare2015mc` lines 224–230, 248–274 and 329. The `31/105` misprint was confirmed; `34/105` is consistent with the `0.260` bound on the same line.
- 1.5: `ramare2013aa` lines 50–65, 171–197, 203–265, 349–414, 471–583 and 587–759.
- 5.1: `ramare1995` lines 334–366 (statement shape, `t > 0`, the constant `0.9105`) and `trudgian2015` lines 433–450 (`U = 2AH(0)`, misprint noted).
- 5.2 and 7.4: `berkaneBordellesRamare2012` lines 64–75, 182–197 and 1125–1159; `cullyHugillTrudgian2021` lines 62–71 and 193–242; `trudgian2015` lines 415–432.
- 5.4: `akhileshRamare2017` lines 135–171, 202–224 and 319–339.
- 7.6: `cipu2015` lines 621–654.
- 9.2: `teo2026` lines 100–116, 1792–1830 and 1916–1930; `nicolasRobin1983` lines 10–15 and 159–172.
- 9.3: `nicolas2008` lines 40–68, 232–236 and 397–443; `ivic1977` lines 19–24 and 49–52.
- Also read: `balazard2012` lines 140–149, 300–330 and 418–482; `ramare2015corr` lines 13–32; `tao2010` lines 111–120; `ramare2013facm` lines 21–62; `robin1983aa` lines 26–48 and 440–464; `hurst2018` lines 420–426.
- The README flags no locator as unverified.

**Adversarial table.** Statements are checked numerically to the ranges shown; "ends" means both ends of every unit or prime interval.

| Statement | Instances | Values (left / right) | Result | Change |
|---|---|---|---|---|
| 1.5 `abs_moebiusSum_le_ramare` | threshold; route chain; hypotheses | `|M(1 078 853)| = 349 ≤ 349.915`, `|M(1 078 852)| = 350`; no violation on `[1 078 853, 1.2·10^7]`; chain at `D = K·2 160 535`: `0.2511` against `0.2152`; field (v) `−3.48518`; (vi) slack `191.75` at 2 161 205; (iii) `−147.7678`; (iv) `161.66 ≤ 162.46`; (vii) slack `0.153`; ψ, ψ̃, μ² hypotheses hold to `1.2·10^7` | route fails | R01 |
| 1.1 `ε₁` | `t = 2⁻, 2, 1.5` | written: `1/3` against `1/6`, `ε₁' = 0.2346`; corrected: `1/6 = 1/6`, `1/81` | false | R02 |
| 1.1 Lemma 8.1 | `f = 1_{n=3}`, `k = 1`, `D₀ = 2`, `D = 4` | left `1`; README right side `0.585`; with `+k∫`: `1` | false | R03 |
| 1.1 Selberg identity `μ log² = μ ⋆ (Λ⋆Λ − Λ log)` | Dirichlet series; `n = p, p², pq` | `(1/ζ)'' = (1/ζ)(2(ζ'/ζ)² − ζ''/ζ)`, both sides equal | sound | — |
| 1.2 MacLeod | `x = 1118, 199` | `|M(1118)| = 14 > 13.975`; `|M(n)| − n/80` max `5.5125` at 199; `(x+1)/80 + 11/2` attained with equality | sound | — |
| 1.3 thresholds | 617 972/3, 2 160 534/5 | `|M| = 262/261`, `498/497`; ratios `0.99674`, `0.99950` | sound | — |
| 2.1 Tao (headline) | `S = ∅, {2}, {2,3}`; 200 random sets of primes | `1, 1/2, 1/3`; maximum `|m_S(x)|` over `x ≤ 2·10^5` is `1.0000` (at `x = 1`); `m(13) = −2323/30030` | sound | — |
| 2.2 Balazard (headline) | `x = 1, 2`; `x ≤ 10^6`, ends | `1 ≤ 3.67`; `0.5 ≤ 1.583`; minimum slack `8.2·10^{−5}` | sound | — |
| 2.3 thresholds | rows `1/20, 1/65, 1/100, 1/25` | last violations at `3354, 96 017, 1418, 3461`; Theorem 1.2 last at `463 420` | sound | — |
| 2.6 Theorem 1.3 and constants | `X = 2, 4` | `0.34657 ≤ 0.69315`; `0.88606 ≤ 1.38629`; `g₀(2) = 0.358719`, `ξ = 0.963809` | slip; unowned inputs | R04, R08 |
| 2.7 RZA Corollary 1.2 | `X = 617 990` | bound `4.329·10^{−4}` against `|m| = 4.3107·10^{−4}`; last violation at 617 988 | sound | — |
| 3.1 `m̌` bound (headline) | `x = 1, 2`; `x ≤ 10^6`, ends | polynomial `−1` with `5 − 4γ` (`−2` with `6 − 4γ`); `x`·polynomial lies in `[−1.071149, 0.460758]`; minimum slack `9.5·10^{−5}` | sound | — |
| 3.2 rows | `0.213` from 2; `1/396`, `1/714` | `[1,2)` violates, peak `1/4` at `√e`; last intervals `3161`, `9548`; Corollary 1.6 last at `6, 43, 221` | sound | — |
| 5.1 comparison (headline) | `h = δ`; re-derived `u, v, w` and `U, V` | `H = 1`, `H' = H'' = 0`; weighted: `U = 2AH(0)`, error factor `(2 − α)/(1 − α)`, `2.5` and `8/3` | sound | — |
| 5.2 model (headline) | `t = 10^6`; `[1, 6·10^5]`; `(0, 1)` | `0.478901` against `γ² − 2γ₁ = 0.478810` (`γ² − γ₁ = 0.405994` excluded); maximum `0.65418` at `t → 2⁻`; `sup |P| t^{1/3} = 1.640819`; `t^{2/5}`: `1.050286`; `|P(0.01)| = 5.7663 > 5.3842` | sound | R08 (d) |
| 5.4 hyperbola refinement | `g = δ`, `g = μ`; source lines | main terms `log D + γ` and `1`; statement matches lines 135–167, 202–224 | sound | — |
| 6.3 Hall–Tenenbaum (headline) | `f = δ`, `f = 1` | `1 ≤ x/log x`; `B = 1.982335`, `A + B + 1 = 4.3686` | sound | — |
| 6.4 Bordellès | `f = 1`; `f = τ` at `x = 2`; `f = μ²` | `⌊x⌋ ≤ x`; `3 ≤ 4`; `2 > 1.5` (the hypothesis is needed) | sound | — |
| 6.1 Rankin instance | other open roadmap | ProbabilisticAndMetricNumberTheory §3.7 proves it itself | two owners | R06 |
| 7.1 squarefree | `x = 351 115, 380, 2⁻, 441 353⁻` | `R = 21.676 > 21.591`; `−0.1032287`; `−0.152632`; real `0.02767` last interval 441 352 | sound | — |
| 7.3 Riesel–Vaughan | `H̄(−1/3)`, `A₃` | `251.012` (primes to `2·10^8` with tail); `u = 0.378695`; `1.641H̄/u = 1087.71`; `A₃ = −6.023476` | sound | — |
| 7.4 divisor remainder | `x = 12, 1980, 5460, 5559, 7560⁻, 9994` | `0.960695`; `22.339 > 22.249`; `31.391 > 29.557`; `−0.705`; `−35.037` against `34.519`; `−2.530` | sound | — |
| 7.6 `2^ω` | constants; `x = 10, 10^5`; `[1, 10^6]`, ends | `v = 1.394800`, `w = 0.410666`, `V = 0.786872`, errors `4.6015, 4.2454`; `5.3913`, `23`; `56.7584 ≤ 56.8590`, `778 581`; 0 violations of the 9 bounds | sound | — |
| 7.9 Tudzi | `P₃`; `x = 100`; `[2, 3·10^6]` | constant `0.48633`; `1445.95` against `1471`; minimum slack `2.64` at `x = 2` | sound; fourth moment unowned | R04 |
| 8.1 RS product (headline) | hypothesis; four bounds | `|E| ≤ 1/log³ x` on `[24 284, 1.2·10^7]` (slack `5.4·10^{−7}`); 0 violations on `(1, 4·10^5)`; at 24 284: `1.0125·10^{−3} ≤ 4.892·10^{−3}` | sound | — |
| 8.1 Axler (headline) | hypothesis; threshold | lower bound on `(1, 1.2·10^7]` with margin `2.1·10^{−5}`; margin at 392 686 `< 0`, at 392 687 `+4.7·10^{−13}`; no violation up to `10^7` | sound | — |
| 9.1 Robin `ω` (headline) | table; analytic step | `k log θ/θ` maximum `1.3840127` at `k = 9`; shortfall maximum `1.20337` at `k = 31`; `log(kℓ) ≤ 1.3841ℓ` from `k = 27` (at `k = 26`: `4.41788 > 4.41423`); the `p_k` bound holds to `1.2·10^7` | sound | — |
| 9.2 Nicolas–Robin (headline) | `n = 6 983 776 800, 5040`; `[3, 10^7]` | `f₂ = 1.53794`, `1.48485`; maximum `1.531905` at 4 324 320; superior highly composite number at `ε = 0.3` is 5040 | sound | — |
| 9.3 Robin `σ` (headline) | `n = 12`; `[3, 10^7]` | `0.6482136 < 0.6483`; maximum at 12, 0 violations | true, no hypotheses | R05 |
| 9.3 Ivić, Eum–Koo | `n = 6, 12, 21` | `12 > 9.063`; `28 < 28.290`; `32 > 31.2314`; odd failures `{3, 5, 7, 9, 15, 21}` | sound | — |
| 9.4 RS `n/φ` (headline) | primorials, `p_k ≤ 3·10^6` | `2.5063692797` at `k = 9`, next `2.4980918` at `k = 8`; `θ` hypothesis holds on `[563, 1.2·10^7]` | sound | — |
| Examples of Layer 2 | `m_6(30)` | `0.299894` against the printed `0.367` | slip | R08 (c) |

## Not verifiable

These are settled as uncertified, so they are cited by locator only; I did not request them (per the brief).
- `chirreHelfgott2025` (1.7; I checked only its arithmetic).
- `ramareZunigaAlterman2026` (2.6), `ramareZunigaAlterman2025` (1.10 and 2.7).
- `bordelles2012` Theorem 4.28 (6.4), `rieselVaughan1983` Lemmas 1–2 (5.2 and 7.3).
- `tudzi2025` and `palojarviTudzi2026` (7.9), `durasNicolasRobin1999` (9.2).
- `robin1984`, `axlerNicolas2023` and `eumKoo2015` (9.3).
- `plattTrudgian2018` (5.2, fourth form), `hallTenenbaum1988` (6.3).
- `rosserSchoenfeld1962` and `axler2018` (8.1 and 9.4 locators).

Other items I could not check:
- `ramare1995` Lemma 3.2: the Numdam text extraction lacks the display formulas, so I could check only the statement's shape.
- Field (ii) of `RamareTransferComputations` (needs `Λ⋆Λ` to `2.31·10^{12}`).
- `MoebiusTableVerified 0.571 10^{16}` beyond `1.2·10^7`.
- Teo's superior-highly-composite tables, which I took as printed.

## Source issues

- **Error** in ramare2013aa at Lemma 4.5, printed p. 6: the source says `|Σ_{n≤x} Λ(n)/n − log x + γ| ≤ 0.0067/log x` from `x ≥ 23`; it should be from about `1.515·10^6` (at 23: `0.0529 > 0.0021`; last failure below `1.2·10^7` at 1 514 844); affects the proof of Lemma 6.1.
- **Error** in ramare2013aa at Lemma 6.4, printed p. 11: the source says `∫_1^{10^8}(ψ(t) − t)dt/t = −129.559`; it should be `−147.7678` (computed exactly); affects nothing.
- **Misprint** in ramare2013aa at (7.1), printed p. 11: the source says the term is `+2γ`; it should be `−2γ`, from (3.4); affects nothing.
- **Misprint** in ramare2013aa at (7.2), printed p. 12: the source says the boundary term is `+R₂*(K)M(D/K)`; it should be `−R₂*(K)M(D/(K+1))`; affects the proof.
- **Error** in ramare2013aa at the proof of Lemma 7.2, printed p. 12: the source says `2γ/D + 0.0213((6/π²)log(D/K) + 1.166) + 0.03739 ≤ 0.0130 log D − 0.144` for `D/K ≥ 2 160 535`; it should be a chain that closes, since this one is false for `10^{12} ≤ D ≤ e^{729}` (`0.2511` against `0.2152` at `D = K·2 160 535`); affects the proof of a stated result (Theorem 1.1).
- **Gap** in ramare2013aa at the proof of Lemma 7.2, printed p. 12: the source says it applies (6.3) at arguments `D/d ≥ K = 462 848`, but Lemma 6.1 holds only from `1 435 319`; it should verify `|R₂*(y)| ≤ 0.0213y` on `[462 849, 1 435 319]` (true there: maximum `0.02109`); affects the proof.
- **Misprint** in ramare2013aa at Lemma 8.1, printed p. 13: the source says `− k∫ M_k(f,t)dt/(t log^{k+1}t)`; it should be `+ k∫`; affects nothing (used in absolute value).
- **Misprint** in ramare2013aa at the proof of Theorem 1.1, printed p. 14: the source says the boundary term is `−3.48`; it should be `+|M(D₀) − M₂(μ,D₀)/log²D₀| ≤ 3.49` (value `3.4852`); affects nothing.
- **Misprint** in ramare2015mc at (1.7), printed p. 1364: the source says `|m₂(10)| = 31/105`; it should be `34/105`; affects nothing.
- **Misprint** in ramare2015mc at Lemma 3.2 and its proof, printed p. 1369: the source says the middle coefficient is `6 − 4γ`; it should be `5 − 4γ` (the identity gives `−1` at `x = 1`); affects nothing.
- **Error** in ramare2015mc at Theorem 1.2 and Corollary 1.3, printed p. 1361: the source says the rows `1/20` from 1426, `1/65` from 60 298 and `1/100` from 694; it should be 3355, 96 018 and 1419; affects a stated result.
- **Error** in ramare2015corr at Theorem 1.5, printed p. 2383: the source says `|m̌(x) − 1| log x ≤ 0.213` for `x ≥ 1`; it should be for `x ≥ 2` (value `1/4` at `x = √e`); affects a stated result.
- **Error** in balazard2012 at §7 after Proposition 7, printed p. 10: the source says `∫_1^∞ ε₁(t)dt/t² = 271/360 − γ`; it should be `3/4 − γ` (numerically `0.17277`); affects nothing.
- **Misprint** in berkaneBordellesRamare2012 at Corollary 2.2, printed p. 4: the source says the constant is `γ² − γ₁`; it should be `γ² − 2γ₁`; affects a stated result.
- **Error** in berkaneBordellesRamare2012 at Corollary 2.2, printed p. 4: the source says `1.16` holds for all `t > 0`; it should be `t ≥ 1` (on `(0, 1)` the bound needs `1.641`); affects a stated result.
- **Error** in berkaneBordellesRamare2012 at Theorem 1.1, printed p. 1: the source says `0.397` holds from `x ≥ 5560`, with sharpness witness 5559; it should be from real `x ≥ 7560`, with integer witness 5460; affects a stated result.
- **Error** in berkaneBordellesRamare2012 at Theorem 1.2, printed p. 2: the source says `|Δ(9994)| > 0.80·9994^{1/3} log 9994` shows sharpness; it should be withdrawn, since `Δ(9994) = −2.530`; affects nothing.
- **Error** in berkaneBordellesRamare2012 at §13, printed p. 19: the source says the error is at most `0.60` on `[1, 2]`; it should be `0.654` (as `t → 2⁻`, with `γ² − 2γ₁`); affects nothing.
- **Error** in cipu2015 at Lemma 4.2(a), printed p. 214: the source says `−0.103229√x ≤ P(x)` for real `x ≥ 1`; it should be for integers only (the real infimum is `−0.152632`); affects the proof of Lemma 4.3.
- **Error** in cipu2015 at Lemma 4.2(c), printed p. 214: the source says `|P(x)| ≤ 0.036438√x` for `x ≥ 82 005`; it fails at `x = 351 115` (`21.676 > 21.591`); affects a stated result.
- **Error** in cipu2015 at Lemma 4.2(d), printed p. 214: the source says `0.02767√x` for real `x ≥ 438 653`; it should be for integers, or for real `x ≥ 441 353`; affects a stated result.
- **Error** in trudgian2015 at Lemma 14, printed p. 10: the source says the divisor model with `1.16` holds for all `t > 0`; it should be `1.641` on `t > 0`; affects a stated result (the constants of Lemma 13).
- **Misprint** in teo2026 at §6.2 against Table 16, printed pp. 41 and 44: the source says `λ₁(3) = 1.5810` in §6.2 and `1.5882` in Table 16; one value is a misprint; affects nothing (both are below `1.5914`).
