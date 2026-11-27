# Review of PowerSpectraAndWienerKhinchin (pull request #3207 at fab5baf)

**Verdict:** needs changes

**Summary.** Changes are needed, for one sentence: the opening overview states the criterion for mean-square differentiability without the completeness of `E` that Layer 3.2 assumes, and the README's own Check in 3.2 is a counterexample to the overview's version. Every layer statement, Check and `Suggested.lean` signature I recomputed is correct, and all sampled locators into Lindgren and Hajek hold. There is one format note and nothing blocking beyond the one clause; two facts about the sources are left for the human reviewers.

## R01 (P2) — The overview states the differentiability criterion for incomplete `E`, where the Check of 3.2 refutes it

The overview fixes where completeness is assumed: "the isometry and every statement that integrates in `E` take `E` complete" (README line 13). The fourth headline then says "the family is mean-square differentiable exactly when `∫ ξ² dμ < ∞`" (lines 23–24). That statement is neither the isometry nor one that integrates in `E`, so as written it is claimed for every complex inner product space. A reader who takes the overview as the statement of the theorem gets a false one.

The third Check of 3.2 (lines 323–324) is the counterexample: `μ` Gaussian, `E` the span of the exponentials `e_t` in `L²(μ)`, `X t = e_t`. Then `∫ ξ² dμ < ∞`, but a derivative in `E` would also be the derivative in `L²(μ)`, which is `2πiξ e_t(ξ)`; this is unbounded and continuous, so it is not almost everywhere equal to a finite exponential sum, which is bounded. Layer 3.2 (line 305) and `exists_hasDerivAt_iff` both assume `E` complete, so only the overview is wrong.

Smallest change: in line 13 say "the isometry, the differentiability criterion and every statement that integrates in `E` take `E` complete", or add "for `E` complete" to the clause in line 23.

## N01 — The facts of 2.0 have no `*Needs:*` line

The normalisation `∫ F_T = 1` in 2.0 is taken from Plancherel's identity for the indicator of `[0, T]`, but 2.0 has no `*Needs:*` line and the supplier contracts name no Plancherel statement. Mathlib has it for `L²` (`MeasureTheory.Lp.norm_fourier_eq`, `Mathlib/Analysis/Fourier/LpSpace.lean`); naming it, or the route actually intended, would tell an implementer where the constant comes from.

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| 1.0 representation, sign convention | tone `exp(2πiνt) z`; `F(τ) = C(−τ)` | `C(τ) = ‖z‖² exp(2πiντ)`; `fourierAtom (−τ) ξ = exp(2πiτξ)`; atom at `ν`, unreversed gives `−ν` | holds |
| 1.0 positive definiteness | `∑ c_i conj(c_j) F(v_i − v_j)` | `= ‖∑ conj(c_i) X v_i‖²`; matches `TauCeti.IsPositiveDefiniteSub` (same conjugation side) | holds |
| 1.0 junk value | `X t = δ_t` in `ℓ²(ℝ)` | `C = 1_{0}` discontinuous, Bochner measure `0` by its `dite`; `C(0) = 1 ≠ 0` | Check true |
| 1.0 random-phase cosine | `(cos, sin)` in `ℂ²` | `⟪X s, X t⟫ = cos 2πν(t − s)`; `μ = ½δ_ν + ½δ_(−ν)` | Check true |
| 1.1 spectral isometry | `X = 0`; `e_t` in `L²(μ)`; incomplete span, Gaussian `μ` | `μ = 0`, range `0` both sides; `U = id`; indicator of `[0, ∞)` not a continuous sum | holds; completeness needed |
| 1.1 density of exponentials | `f ⊥ e_t` for all `t` | conjugate and `t ↦ −t` give the same for `conj f`; `g⁺μ = g⁻μ` | route sound |
| 2.0 Fejér form | cosine, `ν = 3/2`, `ξ = 1/3`, `T = 2` | `F_2(7/6) = 27/(98π²)`, `F_2(11/6) = 27/(242π²)`, half-sum `2295/(11858π²)`; `∫F_T = 1`; tail `≤ 2/(π²Tδ)` | Check true |
| 2.1 weak convergence | `g = 1`; incomplete `E` | left side `μ(ℝ)` for every `T`; in incomplete `E` left `0`, right `1` | holds |
| 2.2 Wiener–Khinchin | Lorentzian; `Y + W` non-continuous | `𝓕⁻F = 𝓕C`; density `2ασ²/(α² + 4π²ξ²)`, mass `σ²`; kernel `(1 − |τ|/T)⁺`; `X = Y + W` has measure `0` | holds |
| 2.3 atoms | cosine at `3/2`, at `1/2`; tone plus orthonormal noise | `Z = (½, −i/2)`, `‖Z‖² = ½`; `|k_T(x)| ≤ 1/(π|x|T)`; averages `→ ‖z‖²`, measure `0` | holds |
| Wiener's theorem via `charFun` | image under `ξ ↦ 2πξ`; cosine | `charFun ρ τ = C(τ)`; mean of `cos²` is `½ = ¼ + ¼` | citation correct |
| 3.1 filters | `h = 1_[0,1]`; tone | `|𝓕h|² = sinc(πξ)²`, `4/π²` at `½`, `4/(9π²)` at `3/2`; cross term `∫ 𝓕h e^(2πi(t−s)ξ) dμ` | holds |
| 3.2 differentiability | Lorentzian; `exp(−πτ²)`; incomplete span | `∫ξ² = ∞`; `4π²·1/(2π) = 2π = −C''(0)`; `ξ e_t` unbounded | holds with completeness; see R01 |
| 3.3 derivative process | cross term; incomplete `E` | `d/dt C(t − s) = ∫ 2πiξ e^(2πi(t−s)ξ) dμ`; limits are scalar integrals | holds without completeness |
| 4.1 sampling | edge tone at `W`, `t = 1/(4W)`; `N = 1` kernel identity | partial sums `2/((2N+1)π) z`, limit `0 ≠ iz`; `c_k = sinc(π(x − k))`; `ψ(±1) = cos πx`; sawtooth bound `≤ 1 + π` | holds |
| Layer 4 example | density `1_(−W,W)` | `C(τ) = sin(2πWτ)/(πτ) = 2W sinc(2πWτ)` | true |
| Overview, fourth headline | Gaussian span example | finite second moment, no derivative in `E` | false as worded (R01) |

- Source locators checked against the text: 12 in Lindgren (printed page = PDF page − 12: Thm 4:3 p. 83, 4:4(b) p. 86, 4:6 pp. 91–93, 4:7 p. 94, §4.4.2 pp. 101–105, Ex. 4:6 p. 103, 4:12 p. 119, §2.1 p. 28, Thm 2:12 and Lemma 2.3 pp. 46–47, Thm 2:18(a) p. 54), 3 in Hajek ((8.10) p. 266, §8.2 p. 268, (8.14)); all agree.
- Library declarations opened at the pins: 9 Tau Ceti names (`TauCeti/Analysis/Bochner/BochnerTheorem.lean` lines 110, 306, 318, 334, 341 read; the rest by `#check`) and 22 Mathlib names by `#check`; all exist with the stated content.
- Cross-roadmap citations resolved on main: MathematicalStatisticsFoundations §9.6, ClassicalErgodicTheory §§2.1–2.2 (`spectralMeasureReal`, character `exp(2πitξ)`), MathematicalBilliards §12.4 and §12.4.1 (both declaration names), SamplingAndDiscreteFourierAnalysis Layer 6, Completed/OneParameterSemigroups Part C.
- Elaborated types of all 12 declarations compared with the README by `#check @name`: no binder lost, generality equal; nothing changed.
- One-tactic probe (`simp` with the definitions unfolded, `aesop`, `simp_all`) on 2.1, 3.2 and 4.1: none closes; no padding found. All eight headlines are stated.
- Automatic checks: all passed; targeted build present, `sorry` the only warning.
- Dependency check output: `depcheck: 94 roadmaps, 1054 edges, 0 problem(s)`.
- No change outside the roadmap folder.

Overlap check: read StationaryTimeSeriesAndLinearPrediction, PositiveDefiniteSequencesAndToeplitzForms, ShotNoiseAndCampbellTheorem (open), SamplingAndDiscreteFourierAnalysis, MathematicalBilliards, ClassicalErgodicTheory (main); nothing shared. Time-`ℤ` stationarity is MathematicalStatisticsFoundations' and the open time-series roadmap's (its scope excludes spectral measures); Wiener's lemma on `ℝ` and the unitary-group case of 2.3 are MathematicalBilliards', cited; sampling of random processes is excluded by SamplingAndDiscreteFourierAnalysis. The two `IsSecondOrderStationary`/`autocov` pairs lie in different namespaces.

Source independence: 12 passages compared with 2 sources, none shared; largest share Lindgren 2006, 12 of 15 locators; contents compared with Lindgren 2006: independent (Layer 2 draws on §4.2, §4.2.2 and §4.3.3, Layer 3 joins §2.4 with §4.4.2, and §§4.3.2, 4.4.1, 4.4.3–4.4.5 have no layer).

Research link: the headline targets are the spectral theory of second-order stationary processes as in Lindgren 2006, Ch. 4 (Bochner representation, spectral isometry, filters, sampling) and Hajek 2015, Ch. 8 (power spectral densities of filtered processes); this rests on the sources read, the README names no later research use.

## Not verifiable

- Whether `Suggested.lean` resembles a public formalisation other than the pinned libraries: not searched beyond the open and merged roadmaps.

## Source issues

- **Misprint** in Lindgren 2006 at Remark 4:2, printed p. 120: the source says both endpoint masses are the mass at `ω₀`; it should be the mass at `ω₀` and the mass at `−ω₀`; affects nothing.

## For the human reviewers

- Scope: 12 of the 15 locators go to Lindgren 2006, lecture notes on the author's page, not a refereed publication; the other source, Hajek 2015, is a Cambridge University Press textbook read in the author's preproduction copy.
- Scope: the README names no later theory or current research that uses its headline theorems; the subject is the classical spectral theory of stationary processes at graduate-textbook level.
