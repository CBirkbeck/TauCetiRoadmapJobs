<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/18769#issuecomment-6938023203 -->
Review (claude) of e07a8c3

Verdict: needs_changes

**Source independence:** 23 passages compared with 8 sources, none shared beyond one 8-word hypothesis that can be written one way only ("has no zero in the open disc of radius", §5.3) and runs of at most 4 words; largest share `openai2026quasiRH`, 62 of 139 locators; contents compared with `openai2026quasiRH`: independent.

**Research link:** The headline is Theorem 3.1 of OpenAI (2026), with Liu (2026) as a second account; Layers 6 and 8 are the large sieves of Goldmakher–Louvel (2013), Blomer–Goldmakher–Louvel (2014), Heath-Brown (2000) and Patterson's cubic theta function (1977) as used by Dunn–Radziwiłł (2024). Rests on the README and the sources read.

**For the human reviewers:** this review raises 4 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) §8.4: the source writes the open interval; the deviation is not stated at the locator

   Location: `design/README.md` lines 1511–1515 (§8.4): "holomorphic on `Re s ≥ 1` except for finitely
   many simple poles in `(1, 2]`, the point `2` being a pole exactly when `χ` is trivial … (`kubota1968`
   §3, p. 265 …)"; `design/plan.json` target 8.4.

   Claim: the cited page supports the statement as written.

   Witness: `kubota1968` lines 235–236 (p. 265) place the poles in the open interval `1 < s < 2`, as the
   extracted text reads. The README's own §8.3 Check has `φ(s) = (π/(s − 1)) ζ_K(s − 1)/ζ_K(s)`, with a
   pole at `s = 2`.

   Repair. The statement is right and stays. After the locator add: "`kubota1968` p. 265 writes the open
   interval `1 < s < 2`; the pole at `s = 2` for trivial `χ` is the one of §8.3's example, where
   `ζ_K(s − 1)` has its pole". The same clause in the locator of `plan.json` 8.4. Tested on the instance:
   `Γ = SL₂(ℤ[i])`, `χ = 1`: `Res_{s=2} φ = π · (π/4)/ζ_K(2) ≠ 0`.

2. **F02** (P3) §11.3, Check on the route of `bimsissac2017`: the exponent `48` is one choice, not what the route gives

   Location: `design/README.md` lines 2205–2207: "since §11.1 gives the closed strip `[1/12, 11/12]`, it
   takes `ϵ = 11/24` and gives exponent `48`, against `12` here"; `design/plan.json` 11.3, test `bims`
   ("needs ϵ = 11/24 and gives 48").

   Claim: that route needs `ϵ = 11/24`.

   Witness: `ϵ = 21/50 > 5/12`: the open strip `(2/25, 23/25) = (0.08, 0.92)` contains
   `[1/12, 11/12] = [0.0833…, 0.9166…]`, and `4/(1 − 2ϵ) = 4/(4/25) = 25 < 48`. `bimsissac2017` lines
   598–600 and 671–675 ask only for some `ϵ < 1/2`.

   Repair: "since §11.1 gives the closed strip `[1/12, 11/12]`, every `ϵ` with `5/12 < ϵ < 1/2` is
   admissible and that route gives every exponent above `4/(1 − 5/6) = 24` (`48` at `ϵ = 11/24`, the
   analogue of the source's `ϵ = 7/16` at `7/8`, which gives `32`; there every exponent above `16`),
   against `12` here". In `plan.json`: "the bimsissac2017 route admits every ϵ > 5/12 and gives every
   exponent above 24 (48 at ϵ = 11/24), against 12". Tested: `ϵ → 5/12`: `4/(1 − 5/6) = 24 > 12`;
   `ϵ → 3/8`: `4/(1 − 3/4) = 16 > 8`.

3. **F03** (P3) Downstream consumers: one consumer is named two ways

   Location: `design/README.md` line 2233: "**AnalyticNumberTheoryPartI or AnalyticNumberTheoryPartIII,
   Part II**: `ψ(x) − x ≪ x^(11/12+ε)`".

   Claim: the consumer of the prime-counting consequence is one named roadmap.

   Witness: the scope section, lines 142–144, hands the same consequence to "Part IIs of
   ExplicitPrimeCounting, AnalyticNumberTheoryPartIII and ZerosOfLFunctions"; `design/plan.json`
   `consumers` has `AnalyticNumberTheoryPartIII` only.

   Repair: write "**AnalyticNumberTheoryPartIII, Part II**" in that bullet. Tested: the three places then
   name the same roadmap.

4. **F04** (P3) §3.1: the rescaled profile is not a profile for the same `Ω`

   Location: `design/README.md` lines 659–660 and 671–672: "A *profile* is a function `w` … whose
   logarithmic form … is smooth with support in `Ω`" and "Rescaling, `w_k(x) = w(e^k x)` … leaves
   `‖·‖_{J,sep}` unchanged".

   Claim: rescaling acts on profiles.

   Witness: `Ω = [0, 1]`, `k = 5`: `(w_k)_log(u) = w_log(u + 5)` has support in `[−5, −4]`, disjoint from
   `Ω`; the constant `≪_{J,d,Ω}` of §3.2 is stated for a fixed `Ω`.

   Repair: in the bullet write "Rescaling, `w_k(x) = w(e^k x)` (`d = 1`), gives a profile for the
   translated set `Ω − k`, multiplies `ŵ` by the unit phase `e^(ikt)` and leaves `‖·‖_{J,sep}` and every
   `p_j` unchanged, so the constants of §3.2 depend on `Ω` only up to translation". Tested: at
   `Ω = [0, 1]`, `k = 5` the support is `Ω − 5 = [−5, −4]`, and `|e^(ikt) ŵ(t)| = |ŵ(t)|`.

4 findings, all P3: none is blocking, but each carries a repair, so a fix round applies them. The 3 findings of round 4 are repaired
and the repaired passages survive the adversarial pass. No supplier gap is declared and none is needed.

Source independence: 23 passages compared with 8 sources, none shared beyond one 8-word hypothesis that can be written one way only ("has no zero in the open disc of radius", §5.3) and runs of at most 4 words; largest share `openai2026quasiRH`, 62 of 139 locators; contents compared with `openai2026quasiRH`: independent.

Research link: The headline is Theorem 3.1 of OpenAI (2026), with Liu (2026) as a second account; Layers 6 and 8 are the large sieves of Goldmakher–Louvel (2013), Blomer–Goldmakher–Louvel (2014), Heath-Brown (2000) and Patterson's cubic theta function (1977) as used by Dunn–Radziwiłł (2024). Rests on the README and the sources read.

Files read: `packages/QuasiRiemannHypothesis/design/README.md` (all 2287 lines),
`packages/QuasiRiemannHypothesis/design/plan.json` (11 layers, 55 targets, 161 tests, `gaps = []`),
`packages/QuasiRiemannHypothesis/sources.toml` (24 entries, all `certified`, no machine path). No
maintainer note exists for this roadmap. There is no `Suggested.lean` at the design stage: nothing was
elaborated (not available: this lane does not elaborate), and the one-tactic probe has nothing to run
on.

## Round 4 findings

| Id | Status | Repaired passage |
| --- | --- | --- |
| F01 (P2) | repaired | §7.3, lines 1348–1350: "for every `ε' > 0` there are `ε₀ > 0`, depending only on `ε'` and `r_max`, and a finite height order `A` such that, when the bin parameter satisfies `ε ≤ ε₀` and `(1 + T₁)^A ≤ U^(ε'/10)`"; §7.4, lines 1364–1365; §10.4, lines 1944–1945; `plan.json` 7.3, 7.4, 10.4 |
| F02 (P3) | repaired | §7.4, lines 1369–1371: "the `O(ε')` constants depend only on the floor `a₀` (they are `O(1/(2a₀ − 1))`, absolute at the source's `a₀ = 51/100`)"; Examples, lines 1384–1389 |
| F03 (P3), §5.1 | repaired | line 957: "`≪_{K,ε} N𝔯^((−σ)₊ + ε)`"; new Check, lines 972–976 |
| F03, §10.5 | repaired | lines 1996–2004: the restriction `|v_k| ≤ T₁/(2n_v(1 + max_j |a_jk|))` stated in the roadmap's words; Check, lines 2043–2047 |
| F03, consumers | repaired | lines 2237–2239: "**SieveMethodsAndPrimePatterns, Part II**", "**ExplicitMultiplicativeFunctions, Part II**" |
| F03, manifest | repaired | `sources.toml`, `liu2026improved`: `locator` begins "Part I: (1.2);" and `cited_for` has "1.2" |

The repaired patterns were looked for in the rest of the design: a loss letter naming two numbers
(Layers 9–10: `ε` is local in §§9.4, 10.2, 10.7 and `ε'` is the loss wherever a bin is in scope); a
hypothesis stated only by reference to a source (none left); a consumer named without "Part II" (R03 is
the one remaining slip of this kind); `cited_for` against the sections that cite (no mismatch: the five
entries with `cited_for = []` are background and are cited nowhere).

## Adversarial table

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §1.1 (sample) | `s − 2`; `0`; `1/(s − 1)`; product of two zero-free meromorphic functions | orders `1` at `2`; `⊤`; `−1`; `(≤ 0) + (≤ 0) ≤ 0` | holds | none |
| §1.2 | third bullet at `β* > 1/2`; family `{s − 2}` | zero with `β* − ε < Re ρ ≤ β*`; abscissa `2 ∉ [1/2, 1]`, excluded by the hypothesis | holds | none |
| §1.3 (headline) | exponents of `f_η`; Mellin strip | `max(σ₀ + ω, β* − σ) + c = C(β*) − E*`; converges for `β* − E* < Re s < B`; `β* − E* ≥ σ₀ + ω > 1/2` | holds | none |
| §1.4 (sample) | `A_η τ ≤ m/4`, then `N` | `(1 + Z^τ)^A ≤ 2^A Z^(m/4)`; `B_η − Nτ < C(β*) − m/2` | holds; source `(1 + T₁)^(A_η)`, `T₁ = Z^τ` | none |
| §2.1 (sample) | `K = ℚ, n = 2, a = 5`; `a = −1` | `(5/3) = −1`, conductor `5`; conductor `4∞` | holds | none |
| §2.4 (sample) | count; sixth powers | `6 · 6^|S| = 6^(|S|+1)`; `χ_A(π)^6 = 1` for good `A` | holds | none |
| §2.5 | `d = 1 + 3ω` | `1 − λ² + λ³ = 1 − 6ω ≡ 1 + 3ω (mod 9)`; `ω^(−1) = ω² = ω^((7−1)/3)` | holds | none |
| §3.1 (sample) | twist; rescaling; `Ω = [0, 1]`, `k = 5` | `ŵ'(t) = ŵ(t − τ)`, `(1 + |t + τ|)^J ≤ (1 + |τ|)^J (1 + |t|)^J`; phase `e^(ikt)`; support `[−5, −4]` | holds; class of profiles | R04 |
| §3.2, §3.3 | tail; `s = 0, 1` | `(1 + |t|)^N ≥ T₁^N`; `∫ (2√π)⁻¹ e^(−u²/4 + su) du = e^(s²)`: `1`, `e` | holds | none |
| §4.1 | `p = 1 + 3ω`, numerically | `|γ_j| = 1` for `j = 1, …, 5`; `γ_6 = −0.37796 = −1/√7`; `γ_3 = i` | holds | none |
| §4.3 (sample) | `p = 1 + 3ω`, numerically | `γ_2³ = 0.18898 − 0.98198i = −α(p)`; `γ_1 γ_2 = −0.65465 + 0.75593i = χ̄_p(4) γ_3 γ_2³`; `χ_p(4) = ω²`; with `χ_p(4)`: `−0.3273 − 0.9449i` | holds; the conjugate is forced | none |
| §4.4 | `1, −1, λ, −λ, −3, 1 + 3ω, 4 + 3ω` | `1, 1, i, −i, 1, i, 1`; `e(1/λ) = exp(−4πi/3) = ω`; `τ(λ, λ) = 1/i² = −1`, `τ(−1, λ) = −1` | holds | none |
| §4.2 | `K = ℚ`, `a = 3`, `b = 5` | `(3/5)(5/3) = 1`, `i√3 · √5 = i√15` | holds | none |
| §5.1 (repaired) | `2` totally split, degree `d`, `a_𝔭 = −1` | `D(0) = 2^d = N𝔯` against `2^(dε)`; `(1 + 2^(−σ₀))^d`; `Σ log N𝔭/(N𝔭^(σ₀) − 1) ≤ log N𝔯/(2^(σ₀) − 1)` | holds | none |
| §5.3 (sample) | `a = b`, `8ε ≤ ν`; trivial character | disc of radius `2 − b − 2ε` lies in `Re s > b + 2ε`; `b + ν ≤ Re s ≤ 4 − b − 6ε` covered, Euler product beyond; `|1/ζ_K| = |(s − 1)/(s + 1)| |ℒ|⁻¹ ≤ |ℒ|⁻¹` on `Re s ≥ 0` | holds | none |
| §5.4 (sample) | `K = ℚ(i)`, `χ(2) = i` mod `5`; `K = ℚ(√2)`, `α = 1 + 3√2`; local factor | `χ(9) = χ(4) = −1`; `N α = −17`, `χ(17) = χ(2) = −1`; `∏_ψ (1 − χ(p)ψ(p)p^(−s)) = (1 − χ(p)^f p^(−fs))^g` | holds | none |
| §5.5 (headline) | `ρ = 1`; `χ = χ₋₃` | `L(1, χ) ≠ 0` for `χ ≠ 1`; cofactor principal modulo `3`, `L(1, χ₋₃) = π/(3√3)` | holds | none |
| §6.3 (sample) | `K = F`, `n = 3`, `𝔠 = (9)`, `𝔞 = (10)`, `𝔟 = (1 + 3ω)` | `v((1 + x)³ − 1) = 4` at `v(x) = 2` (`3x`), cubing `U⁽²⁾ → U⁽⁴⁾` onto; `10² ≡ 2 = ω` in `𝔽₇`; `10 = 2 · 5`, both inert | holds | none |
| §7.2 | pigeonhole; discs | `(I − 1)ε ≥ 1 + ε`; heights `|t| + 2 ≤ (3i + 3)T₁` for `T₁ ≥ 2`; reflected exponent `(a − 1/2 + 6ε) + (6ε + ε₁)` | holds | none |
| §7.3 (repaired) | `r = 1`, `r = r_max`; `m = 0, 1, 2`; `ε₀ = ε'/(48 r_max)`, `ε₁ = ε'/8` | `12εr + 2ε₁ ≤ ε'/2`; `(24 − 12m)ε + 2ε₁ ≤ 3ε'/4`; `(3 + T₁)^(2C) ≤ 9^C (1 + T₁)^A`; `3/4 + 1/10 = 0.85 < 1` | holds | none |
| §7.4 (sample, repaired) | comparison; `a₀ = 51/100`; general floor on the shifted line | `δ(m − min(m, 1 − m)) = 2δ(m − 1/2)₊ ≪ ε'`; `1/(2δ) < 25`; `−5 + 2 + (3/2)(3/4) < 0` for every `a₀ ≥ 1/2`; `|M_r|² ≥ |M_r S_m|²/|S_m|²` with `min(m, 1 − m) ≤ m` | holds | none |
| §8.1 | `γ = (1 + 3ω, −3ω²; 3, 1 − 3ω)`; `a = 10`, `c = 9 + 27ω` | `det = 1`; `9 ≡ 2 = ω` in `𝔽₇`; `4⁴ ≡ 9 = ω`, `3⁴ ≡ 3 = ω²` in `𝔽₁₃`; `d ≡ 5`, `5² ≡ 4 = ω²`: `κ_P = κ̄` | holds | none |
| §8.3 | `SL₂(ℤ[i])`, `χ = 1` | `Σ_c #(ℤ[i]/c)^× N(c)^(−s) = 4ζ_K(s − 1)/ζ_K(s)`; `φ(1) = π(−1/4)/(π/4) = −1`; pole at `s = 2` | holds | none |
| §8.4 (sample) | trivial `χ`; `(Γ₂, κ_P)` | pole at `2`, eigenvalue `0`; `4/3`, eigenvalue `8/9`; source interval `(1, 2)` | holds; the source deviates | R01 |
| §8.5 | cusp count of `Γ₁(3)` | `|SL₂(𝓞/3)| = 24 · 27 = 648`; `648/2 = 324`; `3 · 9 = 27`; `12` classes | holds | none |
| §8.7 | `c = 1 + 3ω`, numerically; bounds | `g̃(c) = 0.89595 − 0.44415i`, `g̃³ = −α(c)`, `|g̃ − conj g̃| = 0.8883`; `γ_2 = χ_c(λ)² g̃ = −0.83262 − 0.55384i`; `3^(n/2+2) ≤ 3^(n/2+7/3)`, equality at `k = 3n − 3` | holds | none |
| §9.4 (sample) | `M = N = 1`; `(5.29)` | `O/2 + max(1 − O, 1 − O) = 1 − O/2`, the source's exponent in an `O`-dyad; `nb = c² m h t²`, `χ_k(nb)³ = χ_k(mh)³ 1_{(k, ct) = 1}` | holds | none |
| §10.2 (sample) | separation identity; `X = Y = Z^(1/2)`; `v = 1 + 3ω`, `v' = 4 + 3ω` | `(q_(b*) q_v X)^(−1/2) = Q^(−1/2)(q_v/Y)^(−1/2)`, `r^(−it₀) = (q_m/Q)^(−it₀)(q_v/Y)^(it₀)`; `Z^(−1/2 + 1/4 + 1/2) = Z^(1/4)`; `1/√91 = 0.1048 > 1/13`; mass `Y⁻³ · Y · Y = Y⁻¹` | holds | none |
| §10.3 (sample) | local series against the source's table, row by row; `D₂`; `j = 0` | sixth row `m ≥ r + 1_{j ≤ 1}` gives `V^(1_{j≤1})/(1 − V)`; boundary row `+η(p) q^(−x−w)` against `−η(p)(q − 1)q^(−x−w)`; `b_p³ = a_p²` (`χ_p(4)³ = 1`); `|R_p| = q^(−2.24)`, `q^(1 − 7/8 − 19/20 − 99/100) = q^(−363/200)`; `P_p(1 − V)(1 − W) = 1 − VW + …`, `J_0 ∋ −D_p`; residue `X^(1/3) Z^(s − 5/6)` | holds | none |
| §10.4 (repaired) | sieve at `K = U`, `D = U^r`, `1/2 ≤ r ≤ 1` | `max(1, (2 + 2r)/3) − δr`, convex in `r`: endpoints `1 − δ/2`, `4/3 − δ`; `R(1/50) = 1`, `R(1) = 1/2`, `R(2/3) = 2/3` | holds | none |
| §10.5 (repaired) | `n_v = 3`, `(1, −3, 0)` | `T₁/12 + 3T₁/24 = 5T₁/24 < T₁/2`; `(3i + 1) + 1/2 < 3i + 2` | holds | none |
| §10.6 | saving at `d = h` over `δ ∈ (1/50, 1]`; rate | `R + δ/2 ∈ [1, 7/6]`, rate in `[33/50, 62/75]`; saving `≥ 1/4 − δ/2 ≥ 1/12` (`δ ≤ 1/3`), `1/12` (`1/3 ≤ δ ≤ 2/3`), `β*/2 − 5/12 > 1/24` (`δ ≥ 2/3`, worst at `a = β*`); `1/24 − 62/75000 = 1021/25000` | holds | none |
| §10.7 (headline) | data of §1.3 | `C(11/12) = 1/4`; `σ = 1/4800`; `ε < ω = (β* − 11/12)/2`; `|H_η − 1| ≤ 1/2` on `Re s > 7/8 ⊃ Re s > 11/12` | holds | none |
| §11.1 (headline) | `ρ ↦ 1 − ρ̄`; `θ = 1/2` | `Re = 1 − Re ρ ≤ θ`; `Re ρ = 1/2` | holds | none |
| §11.2 (headline) | prime side; modulo `12`; `ζ_K` side | `ω(q) log x ≤ log q log x/log 2`; `5` against `2`; `x φ̃(1)(1 + o(1))` with `K` fixed, so `C_{K,θ}` | holds | none |
| §11.3 (sample, headline) | `θ = 11/12`, `7/8`; `ϵ = 11/24`, `7/16`, `21/50` | `12`, `8`; `48`, `32`, `25` | holds; the Check understates the other route | R02 |

## Verified sound

- **Principles.** No algorithm (the square-root clause of the source's corollary is excluded in the
  scope section), no `set_option`, no Lean file, no re-planned roadmap, no upward or cyclic supply. The
  `7/8` stage is a named Part II. Layers 2 and 4–7 are stated over general number fields, with the
  source's `ℚ(ω)` cases as instances.
- **Sampled sources (15 targets), read at the locator.** §1.1 (`openai2026quasiRH` lines 139–141, p. 4;
  306–309, p. 8), §1.4 (lines 3691–3710, p. 82), §2.1 (lines 453–464, p. 11; `milnecft2020` lines
  7041–7075, printed p. 158, and 11186–11243, printed p. 245), §2.4 (lines 465–470, p. 11), §3.1 (lines
  707–720, p. 17), §4.3 (lines 526–545, p. 13), §5.3 (lines 957–998, pp. 22–23), §5.4 (lines 3796–3812,
  pp. 84–85), §6.3 (`bgl2014` lines 1217–1238, p. 20; 257–262, p. 6; 305–309, p. 7; 598–599, p. 11),
  §7.4 (lines 2627–2706, pp. 59–60; `liu2026improved` line 1067), §8.4 (`kubota1968` lines 232–236,
  p. 265; 307–314, pp. 267–268; `patterson1977` lines 275–300, pp. 130–131), §9.4 (lines 1603–1633,
  p. 37; 1735–1790, pp. 39–40; 1892–1901, p. 43; 1980–1983, p. 44; `liu2026improved` line 728), §10.2
  (lines 2064–2074, p. 46; 2143–2188, pp. 48–49; 2191–2215, p. 49; `liu2026improved` lines 1111–1112),
  §10.3 (lines 2224–2287, pp. 50–51; 2294–2474, pp. 51–55; `liu2026improved` lines 950, 990, 998,
  1005), §11.3 (lines 275–287, p. 7; `tao2015` line 31; `bimsissac2017` lines 598–600, 671–675). 14
  sound, 1 with a note (R01). The author flagged no locator as unverified.
- **Library at the pins.** Mathlib (file and line under `Mathlib/`): `meromorphicOrderAt_mul`,
  `meromorphicOrderAt_ne_top_iff`, `meromorphicOrderAt_of_not_meromorphicAt`
  (`Analysis/Meromorphic/Order.lean` 466, 129, 56), `riemannZeta_ne_zero_of_one_le_re`,
  `LFunction_ne_zero_of_one_le_re`, `LFunction_apply_one_ne_zero`, `LFunction_eq_zero_iff_of_re_nonpos`
  (`NumberTheory/LSeries/Nonvanishing.lean` 417, 404, 412, 468), `differentiableAt_LFunction`,
  `LFunction_modOne_eq`, `LFunction_changeLevel`, `completedLFunction_one_sub`
  (`NumberTheory/LSeries/DirichletContinuation.lean` 91, 66, 149, 291), `mellinInv_mellin_eq`
  (`Analysis/MellinInversion.lean` 92), `gaussSum_mulShift`, `gaussSum_mul_gaussSum_eq_card`
  (`NumberTheory/GaussSum.lean` 76, 200), `borelCaratheodory`
  (`Analysis/Complex/BorelCaratheodory.lean` 109), `norm_le_interp_of_mem_verticalClosedStrip'`
  (`Analysis/Complex/Hadamard.lean` 611), `integral_boundary_rect_eq_zero_of_differentiableOn`
  (`Analysis/Complex/CauchyIntegral.lean` 313), `autAdjoinRootXPowSubCEquiv`
  (`FieldTheory/KummerExtension.lean` 277), `AlgHom.IsArithFrobAt` (`RingTheory/Frobenius.lean` 55),
  `zeta_spec` (`NumberTheory/Cyclotomic/PrimitiveRoots.lean` 91), `Real.fourier_eq`
  (`Analysis/Fourier/FourierTransform.lean` 434), `fourierInv_fourier_eq`
  (`Analysis/Fourier/Inversion.lean` 166), `integral_gaussian`
  (`Analysis/SpecialFunctions/Gaussian/GaussianIntegral.lean` 210). Tau Ceti (under `TauCeti/`):
  `heckeLFunctionC`, `heckeLFunctionC_eventuallyEq_primitive` (`NumberTheory/LFunctions/Hecke/Basic.lean`
  74, 138; the definition is `meromorphicContinuation 1` of the series, `0` when none exists),
  `PrimitiveRayClassCharacter`, `.of`, `eulerCorrection`, `differentiable_eulerCorrection`,
  `eulerCorrection_ne_zero` (`…/Hecke/Primitive.lean` 91, 135, 236, 268, 287), `sum_smul_rayClassCoeff`
  (`…/Hecke/Orthogonality.lean` 68), `meromorphicContinuation`,
  `eventuallyEq_of_meromorphic_of_eqOn_halfPlane` (`Analysis/Meromorphic/Continuation.lean` 72, 40),
  `powerResidueSymbol`, `mk_powerResidueSymbol`, `powerResidueSymbol_mk_of_pow_eq_one`,
  `powerResidueSymbol_pow_div` (`NumberTheory/NumberField/PowerResidueSymbol/Basic.lean` 66, 92, 119,
  129), `powerResidueSymbolIdeal_mul_right`, `powerResidueSymbolIdeal_neg`, `map_powerResidueSymbolIdeal`
  (`…/PowerResidueSymbol/Ideal.lean` 145, 203, 246), `IsPrimaryEisenstein` (`(3 : R) ∣ x − 2`),
  `isPrimaryEisenstein_add_mul_iff`, `existsUnique_isPrimaryEisenstein_unit_mul`
  (`…/Cyclotomic/Three/Primary.lean` 59, 118, 170), `gaussSum_powerResidueSymbol_three_pow_three_eq`,
  `cubic_reciprocity`, `cubic_reciprocity_intCast` (`…/Cyclotomic/Three/CubicReciprocity.lean` 84, 144,
  273; the first for every primitive additive character, as §4.3 uses it), `rayClassField`,
  `isAdmissibleModulus_iff_le_rayClassField` (`…/ClassFields/RayClassField.lean` 123, 167),
  `abelianConductor`, `isAdmissibleModulus_iff_abelianConductor_dvd`,
  `isAdmissibleModulus_abelianConductor` (`…/Global/AdmissibleModulus/Basic.lean` 193, 200, 208),
  `conductorExponent_eq_zero_of_isUnramified` (`…/Local/Conductor/Basic.lean` 125), `kroneckerWeber`
  (`…/ClassFields/KroneckerWeber.lean` 178), `idealClass` (`…/Global/RayClass/Basic.lean` 182),
  `toMultiplicativeIdealWeight` (`…/RayClass/Character/Weight.lean` 42). 23 and 32 names, all present.
- **Supplier citations resolved this round.** On main: ExplicitZetaBounds §3.2 (README line 1227,
  `norm_continuedL_le_rademacher` at 1243); ZerosOfLFunctions §§1.6, 3.1, 4.4, 4.5, 8.4, 8.5, 8.6 and
  Layer 9 (lines 895, 1092, 1356, 1420, 2412, 2473, 2528, 2900); LFunctions Layers 0, 4–8 (lines 346,
  859, 929, 1100, 1440, 1566); SieveMethodsAndPrimePatterns §§2.2, 2.3, 2.7, 2.9 (lines 1807, 1953,
  2250, 2403) and `SieveApplications.leastNonresidue` (line 2467, "or 0 outside odd primes", as the
  contract says); AnalyticNumberTheoryPartIII §8.2 (768); PartII §5.29 (1525); PartI §§0.34, 1.6 (883,
  1070); ThetaSeries Layer 1, 1A (423, 432); ClassicalArithmeticCompletion §§1.12, 1.23, 1.33, 1.34,
  1.38, 1.43, 1.52, 1.72, 1.75 (591, 971, 1235, 1271, 1362, 1445, 1717, 2189, 2260); ClassFieldTheory
  Layers 11, 13 and §13.1 (1781, 1924, 1926); GlobalNumberFields Layers 2 and 9 (Completed);
  AutomorphicFormsOnReductiveGroups §4.5 (704). At their heads: BianchiModularForms §§0.3–0.4 (396,
  454), MaassForms §§7.1, 7.3 (1545, 1619), CharacterSumsOverFiniteFields Layers 1–2 and §3.4 (782,
  880, 1154: the case `m = 2` there is the duplication formula `g(χ) g(χη) = χ(4)⁻¹ g(χ²) g(η)` that
  §4.3 uses), AutomorphicSpectralTheory §§0.15, 0.16, 1.15a (369, 400, 1150). `roadmaps resolve`
  reports no citation and no Lean name found nowhere.
- **Duplication by object.** Searched every roadmap, open and on main, for Kubota characters, cubic
  theta functions, Fisher–Friedberg characters, zero-free half-plane predicates, norm-composed
  characters and base-change factorizations, deleted Euler factors, zero detection, additive large
  sieves on tori or lattices, least prime ideals, Borel–Carathéodory and three-circles statements. No
  second owner. Borel–Carathéodory is Mathlib's and AnalyticNumberTheoryPartIII §8.2's, both cited;
  the three-circle method in ExplicitZetaBounds (line 3413) is a route for `ζ`, not a statement for
  Hecke families. No roadmap cites QuasiRiemannHypothesis; the board's package index lists no second
  package of this subject.

Overlap check: read ExplicitNumberFields, CongruenceSpectralGap, CharacterSumsOverFiniteFields, BianchiModularForms, ExplicitMultiplicativeFunctions (open) and ZerosOfLFunctions, LFunctions, AnalyticNumberTheoryPartIII, ExplicitZetaBounds, ExplicitPrimeCounting (main); shared: the convexity bound for records of finite-order type, owner ExplicitZetaBounds §3.2 (cited by §5.2); the Gauss sum of a residue character, owner LFunctions Layer 5 (cited by §4.1); the duplication formula, owner CharacterSumsOverFiniteFields §3.4 (cited by §4.3); the Fourier–Bessel expansion on `ℍ³`, MaassForms §7.3 for `PSL₂(ℤ[i])` and this roadmap for a general `(Γ, χ)` (scope section); nothing else shared.

- **Overlaps.** No other pull request changes this roadmap, no cited id is dropped, none is defined
  only by an open revision, no second copy; the list by results and headings is empty.
  ExplicitMultiplicativeFunctions (open, lines 587–591) and ExplicitPrimeCounting (main, lines 230,
  3181) both say that the consequences of a zero-free half-plane are not planned there, which agrees
  with the "Part II" consumers named here.
- **Supplier order.** Gate output:

      candidate: QuasiRiemannHypothesis is not in the merge order yet; checked as if placed after BianchiModularForms (the intake inserts it when its design is accepted)
      depcheck: 261 roadmaps, 2606 edges, 0 problem(s)

  No UPWARD or CYCLE line; no excluded roadmap is cited as a supplier.
- **Shape.** Eleven layers named by their mathematics, each with Examples and Dependencies; every
  section has a `*Needs:*` line; the 21 definition sections carry 3 to 6 Checks each; Unicode
  mathematics, no LaTeX delimiters; a scan for process words, pull-request numbers, anchors and machine
  paths found none; this roadmap's own names are in italics, so no backticked name claims a Lean
  declaration.
- **Headline theorems** (for the package stage): the `11/12` half-plane (§10.7), the transfer (§5.5),
  the continuation principle (§1.3), the zero strip (§11.1), the conditional least-value bound (§11.2),
  `n(p) ≤ C (log p)^12` (§11.3). All are statable at the pins with *zeroFreeRightOf* and *zeroAbscissa*
  as the only definitions.
- **Arrangement.** 62 of 139 locators are into `openai2026quasiRH`. Layers against its sections:
  1 ↔ §2 and Lemma 11.1; 2–4 ↔ parts of §§4.1–4.3; 5 ↔ §4.4 and Proposition 11.3; 6 ↔ Lemmas 6.1, 9.1
  and three other papers; 7 ↔ §8; 8 ↔ none; 9 ↔ §5; 10 ↔ §§6, 7, 9.2, 10, 11; 11 ↔ Corollary 1.2. Not
  one to one and not in order.
- **Wording.** Beside the 15 sampled locators: §2.1's two caveats with `openai2026quasiRH` lines
  462–464 (3 consecutive words); §5.3's route with lines 970–989 (the steps of the classical argument,
  at most 3 consecutive words); §5.5's route with lines 3792–3830; §6.3's definition and bullets with
  `bgl2014` lines 1231–1235 and 257–262 (formulas; 4 consecutive words); §7.4's route with lines
  2643–2706; §10.2's route with lines 2153–2188; §1.4 with lines 3691–3710; §10.3's Checks with lines
  2447–2470. No reused table, figure or list.

## Not verifiable

- Displays of `openai2026quasiRH` that the OCR drops or garbles: the separation norm of its §4.3, the
  displays (5.36), (6.2), (7.3)–(7.4), (7.6) and (7.10)–(7.11), and conjugation bars throughout. The
  README's formulas were instead recomputed (table: §§3.1, 4.3, 9.4, 10.2, 10.3).
- `kubota1968` (28): the display is lost in the extraction; the identity `Φ(s) Φ(2 − s) = I` was read
  from `patterson1977` (3.12).
- Sections outside the sample whose sources were not reopened this round: `patterson1977` §§7–9 and
  Table III (§§8.6–8.7), `kubota1969` (§§8.1, 8.5), `goldmakherlouvel2013`, `heathbrown2000`,
  `baierbansal2018`, `maynardpratt2024`, `guthmaynard2026`, `lamzourilisound2015`, `gaozhao2024`,
  `dunnradziwill2024`. Their statements were tested by computation where the table has a row.
- The two source issues recorded in round 4 (`dunnradziwill2024` Remark 5.1, `goldmakherlouvel2013`
  Remark 3) were not reopened.
- Agreement of arXiv numbering with the published versions of `dunnradziwill2024`,
  `goldmakherlouvel2013`, `bgl2014`, `lamzourilisound2015`: no published text was read.
- Elaboration: no Lean file at the design stage; this lane does not elaborate.

## Source issues

- **Misprint** in openai2026quasiRH at the proof of Lemma 6.2, printed p. 49: the source says, in the OCR text, that the fractions are separated by `min(1, r₊)/Y`; it should be `min(1, 1/r₊)/Y`, from the bound `1/(r₊Y)` just before; affects the proof.
- **Error** in kubota1968 at §3, printed p. 265: the source says, as extracted, that the poles of the Eisenstein series on `Re s ≥ 1` lie in the open interval `(1, 2)`; it should be `(1, 2]`, the trivial character having a pole at `2`; affects a stated result.

## For the human reviewers

- Scope: the primary source `openai2026quasiRH` is an unrefereed, machine-written preprint;
  `liu2026improved` and `openai2026quasiRHalt` are unrefereed too. No refereed source states the
  headline (`sources.toml`, first three entries).
- Licence: `openai2026quasiRH` and `openai2026quasiRHalt` are read from a public code repository
  recorded as `author-page`; the repository's licence was not read.
- Licence: `liu2026improved` line 25 reports a Lean formalisation of its result; the package's
  `Suggested.lean` should be compared with it when it exists.
- Not tested: the cached text of `openai2026quasiRH` is an OCR of an image-only scan; displayed
  formulas and conjugation bars are missing, so wording was compared on prose and formulas by
  computation only.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "e07a8c35136dcd0082d91def1f183534edc63bfe", "job": "REV-DESIGN-QuasiRiemannHypothesis~5", "model": "fable", "worker": "chris-x29"} -->
