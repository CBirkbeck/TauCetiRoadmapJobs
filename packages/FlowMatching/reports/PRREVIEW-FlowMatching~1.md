# Review of FlowMatching (pull request #2501 at 2a73dce)

**Verdict:** accepted

**Summary.** Accepted: no statement, Check or formula of the roadmap was found false. Every theorem was instantiated on degenerate and closed-form cases, every source locator was read at its place, and every cited library declaration and supplier section was opened. There are three small corrections (one numerical Check accurate to two decimals only, one measurability step of the velocity–score identity that no supplier provides, one Mathlib lemma cited in a form whose hypothesis the roadmap's fields do not satisfy) and two format notes; none blocks. Three points are left for the human reviewers: the subject and its sources, an overlap with an open roadmap on Liouville's formula, and the author's own repository named as provenance.

## C01 — The numerical Check of 5.2 is accurate to two decimals only

In the third Check of 5.2 (README lines 647–649) the four numbers are given as `0.211 ≤ 0.314 ≤ 0.332 ≤ 0.469`. A reader who recomputes them to test an implementation of the bound gets different third decimals and cannot tell whether the statement or the Check is off. The printed values are also not consistent with each other: the last two are `((e^{1.6} − 1)/1.6)^{1/2} ε = 1.5718 ε` and `e^{0.8} ε = 2.2255 ε` for the same `ε`, and `0.469/2.2255 = 0.2107` while `0.332/1.5718 = 0.2112`.

Recomputed (fourth-order Runge–Kutta with 100 steps on 30001 Gaussian quantiles, monotone coupling for `W₂`; the same to three decimals with 200 steps on 4001 quantiles): `W₂ = 0.2113`, the bound of the theorem `0.3159`, the two bounds of the display `0.3330` and `0.4715`, with `ε = 0.2118`. The chain of inequalities holds. Replace the values by `0.211 ≤ 0.316 ≤ 0.333 ≤ 0.471`.

## C02 — The velocity–score identity of 3.1 needs the score to be measurable in time and space jointly, which no supplier states

In the velocity–score bullet of 3.1 (README lines 383–391) the field `n t = −β t • noisyScore μ₁ (α t) (β t)` is used as a marginal velocity, and a marginal velocity is by the definition of 2.1 measurable on `ℝ × E`. DenoisingDiffusion 3.1, the cited supplier, proves that `smoothedDensity μ₀ c s` is positive and smooth in `y` for each fixed `(c, s)`, and 3.2 is an almost-sure identity for fixed `(c, s)`; neither says anything about the dependence on `(c, s)`. An implementer following the *Needs* line (README lines 416–419) is left with a step that nothing provides.

The step is easy: `(c, s, y) ↦ smoothedDensity μ₀ c s y` and its gradient in `y` are continuous on `s > 0` by dominated convergence, so `(t, x) ↦ noisyScore μ₁ (α t) (β t) x` is measurable for measurable `α`, `β`. Add one clause saying that this joint continuity is proved here.

## C03 — `dist_le_of_trajectories_ODE` assumes a Lipschitz bound at all times, and the roadmap's fields have one only on `[a, b]`

The *Needs* lines of 1.1 and 1.2 (README lines 117–118 and 145–146) and the Mathlib contract (lines 741–743) cite `dist_le_of_trajectories_ODE`, whose first hypothesis is `∀ t, LipschitzWith K (v t)` (`Mathlib/Analysis/ODE/Gronwall.lean`, line 228). By the Conventions a field is `K`-Lipschitz only for `t ∈ Icc a b`, so the lemma does not apply as cited. The form that does is `dist_le_of_trajectories_ODE_of_mem` (same file, line 208), with `∀ t ∈ Ico a b, LipschitzOnWith K (v t) (s t)`; cite that one, with `s t = univ`.

## N01 — The second Check of 1.1 writes two curves as if they were flows

Line 109–110: "both `φ t x = x` and `φ t x = t²` describe integral curves from `x = 0`" means the curves `t ↦ 0` and `t ↦ t²`; as written the first reads as the identity flow, which is not a flow of `2 √|x|`. The same example is worded correctly in the Check of 1.4.

## N02 — A sentence that dates the text

Line 665, "No roadmap on main consumes this one", is true on the day it was written only; the sentence after it carries the content of the section.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| 1.1 Flows (`IsFlowOn`, `exists_isFlowOn`, `IsFlowOn.bijective`) | `v = t•x` on `[0,2]`; `a > b`; `a = b`; right shift on finitely supported sequences; `2√|x|` | flow `e^{t²/2}x`, Lipschitz `e² ≤ e⁴`; `Icc` empty, identity is a flow; curve `Σ tⁿ/n! e_n` leaves the space; curves `0`, `t²` both solve | true; completeness and Lipschitz needed |
| 1.1 Picard–Lindelöf route | ball radius `r`, step `1/(2K+1)` | `(M + Kr)/(2K+1) ≤ r` iff `M ≤ (K+1) r`, true for `r ≥ 2M` | route sound |
| 1.2 Liouville (`IsFlowOn.det_fderiv`) | `B t = [[cos t,1],[−2t,3/10]]` on `[1/5,17/10]`; `v = −x/(1−t)`; `a = b`; dimension 0 | `∫tr B = 1.242996`, `exp = 3.46598`; `(1−t)ⁿ` both sides; `det id = 1 = e⁰`; `1 = 1` | true; sign `+` pinned |
| 1.3 Pushforwards solve the equation | constant field; Cauchy law with `v = x`; `a ≥ b` | translation flow; `∫‖v‖ = e^t ∫|x| dμ = ∞`; `Ioo` empty, fields trivial; bound `C + K e^{K(b−a)}‖x‖` | true; first moment needed |
| 1.4 Solutions are pushforwards (`eq_map_of_isContinuityEquation`) | Dirac curve; `2√|x|` with `δ₀` and `δ_{t²}`; `a = b`; mollified field | `γ t = φ t (γ a)`; two solutions, one flow value `0`; identity; error `≤ Kε sup‖∇ψ‖ e^{K(T−a)} ∫ mass` | true; Lipschitz needed |
| 1.5 Density form (`IsFlowOn.map_withDensity`) | `v = x`, Gaussian `p`; sign `+` in the exponent; non-measurable `p` | `q = N(0,e^{2t})`, `log q(e^t x) = log p x − t`; mass `e^{2∫tr B}`; change of variables holds for every `g` | true |
| 2.1 Marginal velocity, existence, mixture theorem | one point; two points `±1`; crossing particles; non-integrable `w` | `w = u`; `w = x/t`, wrong `w = 0` gives `0 ≠ 1/2`; `2x/(2t−1)`; junk integral excluded since the flux has finite variation | true; definition determines `w` a.e. |
| 2.2 Conditional flow-matching identity | two-point with `v = 0`; wrong `w = 0`; left side infinite | `1 = 1 + 0`; `0 ≠ 2`; both right terms finite would force `v − u ∈ L²` | true in `[0, ∞]` |
| 3.1 Velocity–noise, denoiser, score identities | linear schedule; Gaussian target `m = 3/2, s = 2, t = 3/10, x = 7/10`; trigonometric; mixture target | coefficient `(1−t)/t`; `28/17` both ways; `s = −x + (2/π)tan·w`, `0 = 0` against `−2 sin y`; `0.9205` against `5.3652` | true; junk `deriv` cancels on both sides |
| 3.1 Gaussian conditional path | `m t = t`, `σ t = 1 − t` | `u = (x₁ − x)/(1 − t)` from both formulas | agrees with lipman2023 (15) |
| 3.2 Transport by the flow (`map_interpolant_eq_map_flow`) | Gaussian target `s = 2`; two-point on `[a,1]` and `[0,1]` | coefficient `(5t−1)/(5t²−2t+1)`: max `5/4` at `3/5`, min `−1` at `0`; `φ = tm + √v_t x`, `φ₁ = m + sx`; no map splits `δ₀` | true |
| 3.3 Convex costs (`integral_flow_sub_le`) | `c = ‖·‖²`, `m = 3/2, s = 2`; `c` affine; `π = 0` | `13/4 ≤ 29/4`; equality; `0 ≤ 0`; constant term `∫₀¹ dt/(2t²−2t+1) = π/2` | true |
| 4.1 Fokker–Planck to continuity equation | `A = g²•id`; `M x y = ⟨e₁,y⟩•x`; `ψ = x₁x₂`, `A = E₁₂`; non-symmetric `A`; zeros of `p` | `g²∇p`; rows `e₁`, columns `2e₁`; `1` and `0`; `BΣ + ΣBᵀ = −2Σ + (A+Aᵀ)/2`; both sides `0` | true; row convention as in song2021 (37) |
| 4.2 Probability-flow marginals | Ornstein–Uhlenbeck, `λ = 1, σ² = 2, s₀² = 4`; stationary; variance-preserving | `s_t' = −λ s_t + σ²/(2 s_t)` both sides; `s_t² = 1 + 3e^{−2t}`; `w = −λ m_t`; `s_t = 1` | true |
| 5.1 Comparison of two flows (`IsFlowOn.dist_le_integral`) | affine pair; `K = 0`; `K = 4/5`, `c = 1 + s²` without the weight | equality; `t − a`; `1.9442` against `4/3` | true |
| 5.2 Wasserstein bound (`wassersteinEDist_map_flow_le`) | affine pair, mass `M`; `a = b`; `a > b`; `sin x + t` against `(4/5)tanh x + (9/10)t` | `M^{1/p}T` both sides; `0 ≤ 0`; unconstrained; `0.2113 ≤ 0.3159 ≤ 0.3330 ≤ 0.4715` | true; Check digits corrected in C01 |

- Source locators checked against the text: 11 of 11, in 6 sources (lipman2023 lines 140–163, 176–189, 223–226, 706–769; liu2022 lines 504–536, 544–586; albergo2023 lines 394–401, 418–429, 1612–1675; benton2024 lines 181–211; chen2018 lines 197–203; song2021 lines 376–383, 943–1023).
- Library declarations opened at the pins: 13 of Mathlib and 15 of Tau Ceti, all present with the hypotheses the contracts give, except the point of C03; no declaration of either library states a target of this roadmap (no determinant formula for a flow, no uniqueness theorem for the continuity equation, no stability bound for pushforwards by flows).
- Cross-roadmap citations resolved on main: OptimalTransport 8.7, 8.8, 9.1, 11.8; DenoisingDiffusion 3.1, 3.2 and Layers 2 to 4; DiracScatteringAndNonlinearFourierTransform 1.4; StochasticCalculus 9.1, 9.4, 10.2; DifferentialGeometry Layer 3. All make the statements they are cited for.
- Dependency check: `depcheck: 213 roadmaps, 2278 edges, 0 problem(s)`; no UPWARD or CYCLE line; all four suppliers are on main.
- Elaboration of `TauCetiRoadmap/FlowMatching/Suggested.lean`: exit 0, 16 warnings, all `sorry`; no `set_option`, no sorry'd data, one `import Mathlib` and two Tau Ceti modules that exist at the pin. The automatic checks all passed.
- Elaborated types of the 24 declarations compared with the README statements: the 16 theorems keep every binder; the 8 definitions drop only instances their bodies do not use. Nothing changed.
- One-tactic probe (`rfl`, `simp`, `infer_instance`, `constructor <;> simp`) on a copy of the file: none of the 16 theorems closes. The four headline theorems of the Summary are all stated; nothing is padding.
- The title and description agree with the head: a new roadmap, four suppliers named, no change outside the folder.

Overlap check: read ScoreBasedDiffusion, LangevinAndHamiltonianMonteCarlo, OneStepMethodsForODEs, OptimalTransport, DenoisingDiffusion, DiracScatteringAndNonlinearFourierTransform; nothing shared with them. ScoreBasedDiffusion leaves the probability-flow equation, flows and flow matching to this roadmap by name; LangevinAndHamiltonianMonteCarlo 3.4 owns volume preservation for Hamiltonian fields only; OneStepMethodsForODEs constructs no solution. Outside the three lists, the open roadmap IncompressibleFlows (Layer 3, item 1) plans Liouville's formula for flows of jointly `C¹` time-dependent fields in differential form; 1.2 here assumes continuity in time only and is not a case of it, and that roadmap may not be cited as a supplier, so this roadmap owns its statement (reported to the human reviewers).

Source independence: 17 passages compared with 6 sources (the 11 locators and 6 further passages: the "in words" paragraph of 2.1, the routes of 3.2, 3.3, 4.1 and 5.2, and the docstring of 1.5), none shared; largest share lipman2023, 3 of 11 locators; contents compared with lipman2023: independent (only 2.1 → 2.2 follows its §3.1 → §3.2, an order the *Needs* line of 2.2 forces).

Research link: Layers 2 and 3 state the flow-matching theorems of Lipman, Chen, Ben-Hamu, Nickel and Le (2023) and Liu, Gong and Liu (2022); Layer 4 the probability-flow equation of Song et al. (2021); Layer 5 the Wasserstein error bound of Benton, Deligiannidis and Doucet (2024). Rests on the README's citations, each read at its locator.

## Not verifiable

- none

## Source issues

- **Misprint** in albergo2023 at Proposition 4, equation (28), first line, p. 7: the source says the score is minus `x` minus `(2/π) tan(πt/2)` times the velocity; it should be minus `x` plus `(2/π) tan(πt/2)` times the velocity, as (F.4) and the second line of (28) give; affects a stated result.

## For the human reviewers

- Scope: all six sources are machine-learning papers (three ICLR, one NeurIPS, one TMLR; liu2022 is cited as an arXiv preprint). Ten of the fourteen sections end "proved here", the sources stating the results without regularity hypotheses.
- Overlap: the open roadmap IncompressibleFlows, Layer 3 item 1, also plans Liouville's formula for flows, for jointly `C¹` fields. Section 1.2 here is more general in time regularity and does not name it; which roadmap owns the common case is undecided.
- Licence: `TauCetiRoadmap/FlowMatching/README.md` lines 723–726 name the author's repository lean4-mlir (BSD-3) as provenance and say it has no proofs of this material. The repository was not opened; the Lean statements were not compared with it.
