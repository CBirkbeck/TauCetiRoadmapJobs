# Review of SpecialFunctionsGamma (pull request #2191 at b8d75ff)

**Verdict:** accepted

**Summary.** Accepted: this incremental re-review of the 109 lines changed since `96a4044` finds all six points of the previous review repaired and no new finding. The local convergence test for Fourier series that 4.6 now owns is true as stated, in the README and in Lean, and the route of Kummer's series through it recomputes; Ramanujan's integral now carries its integrability. There are no small corrections and one format note, not blocking; the two questions for the human reviewers (the licence of the prior formalization, the nine books that could not be read) stand as before.

## N01 — the local convergence test of 4.6 has no source locator

In 4.6 (`TauCetiRoadmap/SpecialFunctionsGamma/README.md`, line 867) the test is stated with a route and a Lean name but, unlike the other targets, with no citation. It is Dini's test at a point of differentiability; a locator into a standard text on Fourier series beside the name would let a reader match it.

## Previous findings

- R01 — repaired: 4.6 now states "The local convergence test. Let `f : ℝ → ℂ` be `1`-periodic and integrable on `[0, 1]` … and differentiable at `x`", owns it under the auxiliary results, and its Needs names it with four pinned Mathlib declarations.
- R02 — repaired: "the bound `|Γ(x + iy)| ≤ Γ(x)` for `x > 0` (DLMF 5.6.6; ZerosOfLFunctions 1.3a), which 7.3 extends to the negative non-integers"; 1.3a is in the supplier contract, in 7.3 and in the Check of 4.1.
- R03 — repaired: `Complex.integral_inv_Gamma_four` now concludes `Integrable (fun t : ℝ => …) ∧ ∫ t : ℝ, … = …`, as 9.3 says ("the integrand being integrable on the real line").
- R04 — repaired: the diagram has the edges `1 → 3 → 4 → 5`, `4 → 7`, `4 → 9`, `1 → 6`, `2 → 8`, `2 → 9`, `2 → 10`, which are those of the ten Dependencies sections.
- R05 — repaired: 8.2 has the Check "`Φ(±π/2) = 1 + log(π/2) = 1.4515827` … with `log(sin t/t)` in place of `log(t/sin t)` the value would be `0.5484173`".
- R06 — repaired: the description lists ExplicitZetaBounds under "On main"; its only open pull request is ExplicitNumberFields.

## Verified sound

| Statement | Instances | Values computed (left / right) | Result |
|---|---|---|---|
| 4.6 local convergence test (README and `TauCeti.tendsto_sum_fourierCoeffOn_of_differentiableAt`) | `f` = periodic `log Γ` at `x = 0.3`, `N = 4·10⁵`; `f` constant; `f = e^{2πit}`; sawtooth `π(½ − x)` at `x = 0` | partial sum `1.0957979948` / `log Γ(0.3) = 1.0957979948`; constant: `f̂(0) = c`, sum `c`; exponential: sum `e^{2πix}` for `N ≥ 1`; sawtooth: `f̂(0) = 0`, cosine coefficient `0`, sums `0` / `f(0) = π/2` | holds; the control fails only where differentiability fails |
| 4.6 Fourier coefficients in the route | `k = 1, 2` | `∫ log Γ = 0.9189385332` / `½ log 2π = 0.9189385332`; cosine `0.2500000`, `0.1250000` / `1/(4k)`; sine `0.3843739462`, `0.2473458731` both; `log(2 sin πx)`: `−0.5000000`, `−0.2500000` / `−1/(2k)` | holds |
| 4.6 the two closing series | `x = 0.3`, `N = 4·10⁵` | `Σ cos/k = −0.4812118251` / `−log(2 sin 0.3π) = −0.4812118251`; `Σ sin/k = 0.6283185307` / `π(½ − x) = 0.6283185307` | holds |
| 4.6 Kummer's series | `x = 0.3`, `N = 4·10⁵` | `−0.2059413639` / `−0.2059413639` | holds |
| 4.1 Check, 7.3 (`x > 0` from ZerosOfLFunctions 1.3a) | the strip `1 ≤ Re z < 2` | main states `‖Γ(s)‖ ≤ Real.Gamma (Re s)` for `0 < Re s`, and `‖Γ(s)‖ ≤ 1` for `1 ≤ Re s ≤ 2`; `Γ ≤ 1` on `[1, 2]` | holds |
| 8.2 Check of `Φ` | `t = ±π/2` | `1 + log(π/2) = 1.4515827053`; wrong sign `1 − log(π/2) = 0.5484172947` | holds |
| 9.3 with integrability | `(a, b, c, d) = (0.9, 0.8, 0.7, 0.8)`, sum `3.2`; `(½, 3/2, ½, 3/2)` | `|integrand| · t^{Σ−2}` at `t = 20.25, 60.25, 120.25`: `0.09854`, `0.09874`, `0.09879`, so decay `t^{2−Σ}`, integrable iff `Re Σ > 3`; second: integral `0` / `0`, integrable | holds |

The rows for the untouched statements stand as in the previous review, of `96a4044`.

- Automatic checks: the worker's run on this head reports every check passed, the targeted build included; no file outside the folder changed. Dependency check: `depcheck: 218 roadmaps, 2360 edges, 0 problem(s)`, no UPWARD or CYCLE line.
- Elaboration: `lake env lean` of `Suggested.lean` gives 82 `sorry` warnings and nothing else; 88 declarations, 82 theorems, as the description says. No `set_option`, no `lemma`, no machine path.
- Signatures: the elaborated types of the two touched theorems were compared with 4.6 and 9.3; they agree (periodicity, interval integrability on `0..1`, `DifferentiableAt ℝ f x`; `Integrable ∧ equality`). No binder lost.
- One-tactic probe (`rfl`, `simp`, `norm_num`, `infer_instance`) on a probe copy of the file, for the new theorem and for `Complex.integral_inv_Gamma_four`: neither closes.
- Library declarations opened at the pin, 5: `Mathlib/Analysis/Fourier/AddCircle.lean:352–358` (`fourierCoeffOn`: the coefficient `(1/(b − a)) ∫ₐᵇ fourier (−n) · f`, which at `[0, 1]` is the README's `f̂(k)`), `Mathlib/Analysis/Fourier/RiemannLebesgueLemma.lean:244`, `Mathlib/Analysis/SpecificLimits/Normed.lean:930`, `Mathlib/Analysis/Complex/AbelLimit.lean:162`; `TauCeti/Analysis/Fourier/` (`FourierCoeffOn.lean`, `SineSeries.lean`, `RiemannLebesgue.lean`, `AbsolutelyContinuous.lean`): uniqueness, Parseval and coefficient identities only, no pointwise convergence theorem. Mathlib has only `has_pointwise_sum_fourier_series_of_summable` (`AddCircle.lean:503`). The new target is not proved at the pins.
- Cross-roadmap citations resolved, 1 new: ZerosOfLFunctions 1.3a on main (`TauCetiRoadmap/ZerosOfLFunctions/README.md:769–773`). Ownership of the convergence test: no roadmap on main or open states pointwise convergence of Fourier series; AnalyticNumberTheoryPartIII 7.3 (main) is the inversion of a Fourier integral at a point of bounded variation, a different statement.
- Overlap check: read SpecialFunctionsGeneralizedHypergeometric, SpecialFunctionsBessel, SpecialFunctionsConfluent, SpecialFunctionsLegendre, SpecialFunctionsStruve, SpecialFunctionsHypergeometric, SpecialFunctionsParabolicCylinder, SpecialFunctionsAiry as in the previous review; the change adds one shared object, DLMF 5.6.6 for `x > 0`, owner ZerosOfLFunctions 1.3a, now cited. No open pull request changes this roadmap or drops an id it cites.
- Source independence: changed passages only: 3 passages (the test and route of 4.6, the scope sentence on 5.6.6, the Check of 8.2) compared with 1 source (DLMF §§5.6, 5.9), none shared; largest share DLMF, 61 of 140 locators; no layer added, removed or reordered, so the contents were not compared again (previous result: independent).
- Research link: the README names no research article; its sources are textbooks and the DLMF. Layer 10 states the Selberg, Aomoto, Mehta and Dyson integrals for all parameters, which RandomMatrices 5.2–5.3 (on main) and Forrester 2010, Ch. 4, use as normalisation constants of β-ensembles; rests on the README.

## Not verifiable

- Andrews–Askey–Roy, Thm. 1.7.1, p. 29 (Kummer's series, the sampled target in the changed text): no open copy; the identity and each Fourier coefficient of the route were recomputed instead.
- The other book locators stand unverified as listed in the previous review (Andrews–Askey–Roy, Temme, Olver, Paris–Kaminski, Beals–Wong, Lebedev, Forrester, Remmert, Duverney); the change touches none of them.
- The description's paragraph on Tau Ceti main ("merged after that pin"): only the pinned Tau Ceti is available to this review.

## Source issues

- none

## For the human reviewers

- **Licence.** The README section "Prior formalization" names the author's `lean-DLMF` repository (stated there as Apache-2.0) as source material for every layer; `Suggested.lean` was not compared with that repository's declarations.
- **Not tested.** Nine of the eleven cited books could not be read (list under Not verifiable, here and in the previous review); wording and arrangement were compared with DLMF Chapter 5 and Whittaker–Watson Ch. XII only.
