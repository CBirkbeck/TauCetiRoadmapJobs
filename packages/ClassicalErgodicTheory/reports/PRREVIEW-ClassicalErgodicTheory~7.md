# Review of ClassicalErgodicTheory (pull request #2231 at 1966f38)

**Verdict:** needs changes

## R01 (P3) — Auer2024 page fits arXiv version 3, while the citation is dated 2024

**Location:** `TauCetiRoadmap/ClassicalErgodicTheory/README.md`:
- line 1063: "Auer2024, Theorem 3, p. 5, for the time-1 map of a continuous action of `ℝ^d` on a metric space";
- line 2453: "arXiv:2408.15238 (2024), Theorem 3".

**Claim:** Only version 3 (25 Sep 2025) has Theorem 3 on p. 5. Both 2024 versions print it on p. 6. Also, for `d > 1` Auer's restricted action is a `ℤ^d`-action, not a time-1 map.

**Witness:** Version 3 is the cached text: Auer2024 line 212, printed p. 5. Versions v1 (27 Aug 2024) and v2 (26 Nov 2024) on arXiv print Theorem 3 on p. 6. Auer2024 line 193: the restriction is the time-1 map only when `d = 1`.

**Repair:**
- Line 1063: "Auer2024, Theorem 3, p. 5 of arXiv version 3, for a continuous action of `ℝ^d` on a metric space and its restriction to `ℤ^d`, the time-1 map when `d = 1`, …".
- Line 2453: "arXiv:2408.15238v3 (2024, revised 2025), Theorem 3, p. 5 (…)".

## Previous findings

- R01 — repaired. Line 1058 now cites "Hochman2012, Corollary 6.6.4, p. 70, … Definition 6.1.1, p. 56" for 1 ⇔ 3, and line 1063 cites "Auer2024, Theorem 3" for 1 ⇔ 4 ⇔ 5. Lines 1874 and 1880 cite "Walters1982, Theorem 8.2" and "Theorem 8.4". The new Auer page problem is this report's R01.

## Verified sound

| Statement | Instances | Values computed | Result |
| --- | --- | --- | --- |
| §3.2, 1 ⇔ 3 (`weakMixingVAdd_real_iff_exists_atomless_spectralMeasure`) | circle flow at speed 1, `f = e₁` | `⟪e₁, U_t e₁⟫ = e^{−2πit}`, so `σ = δ_{−1}`, an atom. The diagonal flow preserves `x − y`, so it is not ergodic | both sides false |
| §3.2, 1 ⇔ 3 (Hochman2012, Cor 6.6.4, line 3141, p. 70; `ℤ` case) | fair shift, `f = 1_{x0=0} − ½` | `⟨f, Uⁿf⟩ = ¼` at `n = 0` and `0` otherwise, so `σ_f = ¼·Haar`, atomless. Weakly mixing by Example 6.1.4 | both sides true |
| §3.2, 1 ⇔ 3 without ergodicity | trivial flow on two points, `f = (1, −1)` | `⟪f, U_t f⟫ = 1`, so `σ = δ₀`, an atom. The flow is not ergodic, hence not weakly mixing | both false: the flow form needs no ergodicity hypothesis |
| §3.2, 1 ⇔ 4 ⇔ 5 (`weakMixingVAdd_real_iff_weakMixing`; Auer2024, Thm 3) | circle flow at speed 1, `t = 1` and `t = 1/2` | The flow is not weakly mixing. Time 1 is the identity; time 1/2 fixes `e₂`; neither is ergodic | all false; Auer's footnote 5 uses the same flow |
| §3.2, rescaling to `t < 0` | `t = −1/2`, sets `A` and `B` | `(1/T)∫₀ᵀ \|c_{A,B}(−s/2)\| ds = (2/T)∫₀^{T/2} \|c_{B,A}(u)\| du`: the same limits over all pairs | holds |
| §3.2: Auer's two-sided average against item 2 | `f, g ∈ L²₀` | `(1/2T)∫_{−T}^{T} \|⟨f, g∘Φ_t⟩\| = ½(one-sided(f, g) + one-sided(g, f))` | equivalent |
| §6.2 upper semicontinuity (Walters1982, Thm 8.2) | full 2-shift with Bernoulli `(1−1/k, 1/k)` → `δ_{0^∞}`; the union of the `X_k` from §8.2 | Shift: `H(1/k) → 0 ≤ 0`. Union: maximal measures of `X_k` tend to the Dirac at the added point, with `log λ_k → log 2 > 0` | holds when expansive; fails without expansiveness |
| §6.2 Jacobs (Walters1982, Thm 8.4) | `ν = ½δ_{0^∞} + ½·Bernoulli(½, ½)` | Directly, `H_ν(ξⁿ)/n → (log 2)/2`. `∫⁻ h dρ = ½·0 + ½ log 2` | equal |
| §8.2 item 5 (Walters1982, Thms 9.14–9.15) | identity on `{a, b}`, `φ = (1, 0)`, `ν = pδ_a + (1−p)δ_b` | `P = 1`. With `ψ = (0, c)`, `0 < c < 1`, the condition `(1−p)c ≤ 0` forces `p = 1`. Tangent and equilibrium sets are both `{δ_a}` | holds |
| §8.2 item 5, converse without upper semicontinuity | the Misiurewicz-type `X` of §8.2, `φ = 0` | `P` is finite, convex and 1-Lipschitz, so a tangent functional exists. It is invariant (Thm 9.11, per Chung2013 line 1679). There is no equilibrium state | converse fails, so the hypothesis is needed |
| §8.2 Check (Walters1982, Thm 9.16, as cited in Chung2013, pp. 21, 23) | full 2-shift, `φ = (0, log 2)` on `x 0` | `P = log 3`, `p = (1/3, 2/3)`, and `H(p) + ∫φ = log 3 − (2/3)log 2 + (2/3)log 2 = log 3` | holds; Chung2013 lines 1302, 1467 |

The rows for statements the diff leaves untouched stand as in the previous review, of `92f201c`.

- **Source locators checked against the text: 8.**
  - Hochman2012: Definition 6.1.1 (line 2434, printed p. 56) and Corollary 6.6.4 (line 3141, printed p. 70).
  - Auer2024: Theorem 3 (line 212, p. 5 of v3; p. 6 of v1 and v2, fetched from arXiv), its definition of weak mixing (lines 108–112) and the `d = 1` remark (line 193).
  - Chung2013: lines 1302 and 1467 (Walters1982, Thm 9.16) and line 1679 (Thm 9.11).
- **Cross-roadmap citations resolved:**
  - MathematicalBilliards design: §12.1 (line 800, whose API lists the `L²` form and time rescaling), §12.4.1 (line 848) and §12.5 (line 860).
  - ArithmeticDynamics §2.7 at ae79f44 (line 2548).
- **Signatures:** `Suggested.lean` is unchanged since `92f201c`. The elaborated signatures of the two §3.2 theorems carry `[MeasurableVAdd₂ ℝ X]`, `[IsProbabilityMeasure μ]` and `[VAddInvariantMeasure ℝ X μ]`.
- **Gate:** the worker's gate passed. My rerun's only failure is `depcheck: NOT IN ORDER: ClassicalErgodicTheory`, against the default order file. Against the candidate order: `depcheck: 206 roadmaps, 1901 edges, 0 problem(s)`, with no UPWARD or CYCLE line. The roadmap is at line 408 of that order, after MathematicalBilliards at line 407.
- **Elaboration:** `lake env lean` gives 39 warnings, all `declaration uses sorry`, and no error.
- **Scope of the change:** nothing changed outside the folder. The diff touches only `README.md` (14 insertions, 7 deletions).
- **Pull request text:** the title and description still match this head. The change adds locators and two references, and no supplier, heading or declaration.
- **Overlap check:** I read ProbabilisticAndMetricNumberTheory, ArithmeticDynamics, PointProcesses, Equidistribution, ProbabilisticAndMetricNumberTheoryPartII, Exchangeability, OptimalTransport and StochasticCalculus; the third list is empty. None of them states tangent functionals of pressure, atomless spectral measures of flows, weak mixing of time-1 maps, Jacobs' formula or semicontinuity of the entropy map. The change adds no owned object, and shared objects keep the owners recorded at `e4df427`.

## Not verifiable

- Walters1982 is uncertified and was not read: Theorems 8.2, 8.4, 9.14 and 9.15 are unchecked against the book. Secondary citations agree: arXiv 1809.10022 (Thm 8.2), arXiv 2406.01712 (Thm 8.4), arXiv 2009.07212 (Thms 9.14–9.15, equilibrium states equal tangent functionals) and arXiv 1710.02816 (Thm 9.15).

## Source issues

- **Misprint** in Hochman2012 at Corollary 6.6.4, proof, p. 70: the source subtracts `(∫f)(∫g)` from the integral of `f · Tⁿ f`; it should be the integral of `f · Tⁿ g`; affects nothing.
- **Gap** in Hochman2012 at Corollary 6.6.4, proof, p. 70: the source takes the decay of `|∫ f′ · Tⁿ g′|` from the hypothesis, but Proposition 6.6.3 covers vectors of a single cyclic subspace; it should first project `g′` onto the cyclic subspace of `f′`; affects the proof.
