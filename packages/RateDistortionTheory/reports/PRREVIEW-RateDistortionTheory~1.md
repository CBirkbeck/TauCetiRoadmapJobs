# Review of RateDistortionTheory (pull request #2862 at 420b650)

**Verdict:** needs changes

**Summary.** Needs changes, for one finding: an API statement of 3.1 (the expected block distortion of the product channel equals the single-letter expected distortion) is false for blocks of length `0`, which the roadmap otherwise treats as in range; adding `n ≥ 1` repairs it. All twelve headline statements survived the degenerate-case and numerical pass (junk values, empty `B`, `n = 0`, `M = 0`, `γ ≤ 0`, letters of probability zero), and `Suggested.lean` elaborates with `sorry` as the only warning. There is one small correction (a case missing from the convexity route of 1.1) and no format note. The Polyanskiy–Wu locators could not be checked against the text, which is left to the human reviewers.

## R01 (P2) — The API statement of 3.1 on the product channel fails for `n = 0`

In the API sentence of 3.1 (line 357), "the expected block distortion of the product channel of a test channel `W` … is `expectedDistortion p W d`" is stated with no restriction on `n`, in a section whose first API item and whose Check both include `n = 0`. An implementer who formalises it as written gets a false statement.

For `n = 0` there is one source word and one reproduction word, `productLaw p 0` and the product channel are both the empty product `1`, and `blockDistortion d 0` is `0 / 0 = 0`, so the left side is `0`. The right side need not be: for a fair bit, Hamming distortion and the channel that swaps the two letters, `expectedDistortion p W d = 1`. The Check of the same section says exactly this ("every code has distortion `0`"). Both uses of the statement (the route of 3.2 after "Let `n ≥ 1`", and 4.2 for large `n`) are at `n ≥ 1`, so no theorem is affected.

The smallest change: write "for `n ≥ 1`, the expected block distortion of the product channel … is `expectedDistortion p W d` (for `n = 0` it is `0`)".

## C01 — The convexity route of 1.1 does not cover a pair with `y₁ = 0 < y₂`

In the route of 1.1 (lines 101–106) the map `(x, y) ↦ x log (x / y)` is said to be convex on `[0, ∞) × (0, ∞)`, and the only boundary case treated is `y = 0` in the mixture, which forces `y₁ = y₂ = 0`. A pair `(a, b)` whose output mass vanishes under one channel only (`q₁ b = 0 < q₂ b`) has `(x₁, y₁) = (0, 0)`, outside the stated domain, with `y > 0`; the perspective step divides by `y₁` there. The case is harmless: then `x = (1 − λ) x₂`, `y = (1 − λ) y₂`, so `x log (x / y) = (1 − λ) x₂ log (x₂ / y₂)`, equality. One clause saying so (or stating convexity on the cone `{y > 0} ∪ {(0, 0)}`) closes the route.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 expected distortion, convexity in the channel | fair bit: identity, swap, midpoint; deterministic channel on `(1/2, 3/10, 1/5)` | `I = log 2`, `log 2`, `0` (so not concave); `I = H(p) = 1.02965` | true | C01 on the route |
| 1.2 `R`, `D_min`, `D_max`, attainment | 3-letter example; `D < D_min`; empty `B` | `D_min = 0 + 0.15 + 0.04 = 0.19`; columns `0.8, 1.05, 1.84`; `R(0.3) = 0.6036`, `R(0.79) = 0.0036`; empty set gives `sInf ∅ = 0`, not attained | true | none |
| 1.3 convexity, monotonicity | fair bit at `D = −1, 0`; `θ = 0.3` | `R(−1) = 0 < R(0) = log 2`; `R(0.29) = 0.008713 > R(0.3) = 0` | true on `[D_min, ∞)` only, as stated | none |
| 1.4 continuity at the endpoint | diagonal-`1` example, `D ↓ 1` | `R(1.05) = 0.50132`, `R(1.01) = 0.75647`, `R(1.001) = 0.98036`, `H(p) = 1.02965` | Check values confirmed | none |
| 1.5 `R(D) = 0 ⇔ D ≥ D_max` | `θ = 0.3`; `D = −1`; `p` without full support | `D_max = 0.3`, `R(0.3) = 0`; junk `R(−1) = 0` with `D_max > −1`; Jensen equality only on letters with `p a > 0` | true with `D ≥ D_min` | none |
| 1.5 `R(c) = H(p)` | `d ≡ 0`; `p = (3/5, 2/5, 0)` with third row `(−5, −5, 7)` | `R(0) = 0 ≠ log 2`; `R(0) = h(2/5) = 0.67301`, `D_min = c` | true; strictness needed | none |
| 2.1 Hamming distortion, Bernoulli law | `x = 011`, `y = 001`; `bernoulliLaw θ` | block distortion `1/3`; `D_min = 0`, `D_max = min (θ, 1 − θ)` | true | none |
| 2.2 Bernoulli closed form | `θ = 1/2, D = 0.11`; `θ = 0.3, D = 0.29`; `θ = 0`; `D = θ`; `θ = 0.1, D = 0.95` | `0.346632` both sides; `0.008713` both sides; `0 = 0`; `0 = 0`; formula `0.1266` vs `R = 0` (outside range) | true on the stated range | none |
| 2.3 uniform closed form | `m = 3, D = 0.2`; `m = 1`; `D = 1 − 1/m`; `m = 2, D = 0.6` | `0.459580` both sides; `0 = 0` (`0 · log 0`); `log m − h(1 − 1/m) − (1 − 1/m) log (m − 1) = 0`; formula `0.0201` vs `R = 0` | true on the stated range; real subtraction in `log (m − 1)` | none |
| 3.1 codes, product law, block distortion | `n = 0`; swap channel | block distortion `0`; product-channel distortion `0` against `expectedDistortion = 1` | API false at `n = 0` | R01 |
| 3.2 single-letterization | `n = 0`; empty `B`, `n ≥ 1`; `D < D_min`; `p = (0.7, 0.3)`, `d = ((0, 1), (2, 0.3))`, `n = 2` | `0 = 0`; `0 = 0`; both junk `0`; block `0.667051 = 2 · 0.333526` at `D = 0.2`, `0.197711` both at `D = 0.4` | true for every `n`, `D` | none |
| 3.3 converse | `M = 0`; `n = 0`; `n = 3, M = 2` fair bit; `n = 1, M = 2` | no encoder; `0 ≤ log M`; best distortion `1/4` (others `1/3`, `1/2`), `3 R(1/4) = 0.3924 ≤ 0.6931`; `log 2 = log 2` | true | none |
| 4.1 random-coding bound | BSC `0.1`, `M = 2`, `γ = 2, 1`; `γ ≤ 0`; `M = 0`; 40 random instances × 12 values of `γ`, exact codebook averages, zero-mass rows and entries | `0.2839`, `0.6177`; `exp (−M/γ) ≥ 1`; `E e(X, y₀)` both; least slack `0.128 > 0` | true for every real `γ`; `(1 − δ)^M ≤ e^(−M/γ) + (1 − γδ)⁺` rechecked | none |
| 4.2 achievability | `D = D_min` with `θ = 0.1`, `R = 0.5`; empty `B`; `D ≥ D_max` | `2ⁿ > e^(0.5 n)`; hypotheses hold at junk `0`, no code; one codeword suffices | true with `D > D_min`, nonempty `B` | none |

- Source locators checked against the text: 7 of 7 for El Gamal–Kim (ElGamalKim lines 2019–2027, 2037–2063, 2066–2079, 2083–2113, 2117–2196, 2207–2237); 0 of 14 for Polyanskiy–Wu.
- Library declarations opened at the pin: 29 of 29 named ones found (for instance `Real.convexOn_mul_log` at `Mathlib/Analysis/SpecialFunctions/Log/NegMulLog.lean:144`, `IsCompact.tendsto_subseq` at `Mathlib/Topology/Sequences.lean:298`, `csInf_le_csInf` as the dual of `csSup_le_csSup` at `Mathlib/Order/ConditionallyCompleteLattice/Basic.lean:209`, `TauCeti.klDiv_smul_add_smul_le` at `TauCeti/InformationTheory/KullbackLeibler/Convex.lean:102`).
- Cross-roadmap citations resolved: ChannelCoding 1.1, 1.2, 1.4 (seven definitions identical to its `Suggested.lean`, `channelMutualInformation_eq_sum`, `productChannel`); EntropyAndSourceCoding 1.1 API and 1.3 `condLabelEntropy_le_binEntropy_add_mul_log`; ProbabilisticAndMetricNumberTheory §5.1a and §5.2 on main; MathematicalStatisticsNonparametric 1.3 and §2.4; MeansMajorizationAndDiscreteInequalities 6.3.
- Automatic checks: all passed. Dependency check: `depcheck: 172 roadmaps, 1999 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration of `TauCetiRoadmap/RateDistortionTheory/Suggested.lean`: 12 `sorry` warnings, no error, no other warning. Elaborated types of all declarations compared with the README: same hypotheses, nothing lost.
- One-tactic probe (`rfl`, `simp`, `infer_instance`, unfolding then `simp`) on the 12 theorems: none closes. No padding; all headline theorems of the README are stated.

Overlap check: read ChannelCoding, EntropyAndSourceCoding, DifferentialEntropyAndEntropyPower, PACBayesBounds, RenyiDivergenceAndPrivacy, MathematicalStatisticsNonparametric; nothing shared (the first two both list rate–distortion theory as outside their scope; no other roadmap, open or on main, mentions distortion measures or test channels).

Source independence: 6 passages compared with 1 source (ElGamalKim), none shared; largest share PolyanskiyWu, 14 of 21 locators, text and table of contents not readable; contents compared with ElGamalKim Lecture 3 (codes, theorem, Bernoulli example, achievability, converse): independent.

Research link: The headline targets are Shannon's 1959 coding theorem for a source with a fidelity criterion, in the forms of Polyanskiy–Wu (2024) and El Gamal–Kim (2010); it is the prerequisite of the directions the scope excludes (dispersion, side information, multiterminal coding). Rests on the README's references and ElGamalKim.

## Not verifiable

- All 14 Polyanskiy–Wu locators (Theorems 5.3, 24.3, 24.4, 24.8, 25.1, 25.2, 26.1, Remark 5.2, Definition 24.2, (24.8), (25.1), p. 490): the sources service found no legal copy (the address tried was not shown to be an author's page; the publisher's page is not open). The mathematics of each target was checked independently, and 1.2, 1.3, 2.2, 3.1, 3.3, 4.2 also against El Gamal–Kim.
- The two slips in Polyanskiy–Wu that the description reports ((26.1) and Theorem 24.4(e)): same reason.

## Source issues

- **Gap** in ElGamalKim at Lecture 3, p. 3–40: the source says the function is convex on the closed interval from `D_min` to `D_max` and hence continuous there; it should be that convexity gives continuity on the open interval only, the endpoint `D_min` needing a separate compactness argument; affects nothing.

## For the human reviewers

- **Not tested.** Polyanskiy–Wu carries 14 of the README's 21 locators; neither its text nor its table of contents could be read, so wording and arrangement were not compared with it.
- **Licence.** The README cites a prepublication copy of Polyanskiy–Wu "from the first author's page at MIT" (References, line 646); the host could not be classified as an author's page by the sources service.
- **Scope.** The headline theorems are textbook results (Shannon 1959); the sources are a published textbook and arXiv lecture notes, no research article.
