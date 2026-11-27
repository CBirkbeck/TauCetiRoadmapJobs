# Review of GaussianChannelsAndWaterFilling (pull request #3212 at d33acd9)

**Verdict:** needs changes

**Summary.** Changes are needed on one point of generality: the golden formula of 1.1 is stated for additive channels on a finite-dimensional normed space only, while the cited theorem, the route written under it and the pinned libraries all give it for an arbitrary Markov kernel. Every other statement survived the computations below (all ten sampled targets, their Checks and their locators agree with the sources and with the Lean file). There is one format note and no small correction; nothing but the scope and one unreadable-reuse question is left to a human.

## R01 (P2) — The golden formula of 1.1 is stated for additive channels only, below the generality of its source and of its own route

An implementer who follows 1.1 proves the general theorem (the route never uses addition after its first sentence) and then records only its additive instance, so the library ends up without the statement every other channel needs; MathematicalStatisticsNonparametric 2.4 on main already carries a second special case of the same identity (its compensation identity `inv_mul_sum_klDiv_eq`, the uniform input on a finite index set), and the two instances would have no common statement.

How I know. The README itself says, in 1.1 (line 63), that the source's theorem is "for any channel", and Polyanskiy–Wu, Theorem 4.1, p. 67, is indeed stated for an arbitrary conditional law. The route (lines 66–76) introduces the kernel `κ = x ↦ ν.map (x + ·)` and from then on uses only that `ρ = μ ⊗ₘ κ`: `TauCeti.klDiv_compProd_right` (`TauCeti/InformationTheory/KullbackLeibler/ChainRule.lean`, line 125, for finite kernels on a countably generated source), the swap, `Measure.disintegrate` with `Measure.condKernel` (standard Borel, nonempty input space) and `klDiv_compProd_eq_add`. None of these needs a normed space or an addition. The general statement elaborates at the pins with `import Mathlib` alone and the roadmap's own `mutualInfo`:

    theorem lintegral_klDiv_eq_mutualInfo_add {α β : Type*} [MeasurableSpace α] [MeasurableSpace β]
        [StandardBorelSpace α] [Nonempty α] (μ : Measure α) [IsProbabilityMeasure μ]
        (κ : Kernel α β) [IsMarkovKernel κ] (Q : Measure β) [IsProbabilityMeasure Q] :
        ∫⁻ x, klDiv (κ x) Q ∂μ = mutualInfo (μ ⊗ₘ κ) + klDiv (κ ∘ₘ μ) Q

(the name is only a suggestion).

Smallest change. State 1.1 for a probability measure `μ` on a standard Borel space, a Markov kernel `κ` and a probability measure `Q`, as above, in the README and in `Suggested.lean`; keep the additive form `lintegral_klDiv_map_add_eq` as the corollary Layers 2 and 3 use (it is the general statement for the shift kernel, with `inputOutputLaw (μ.prod ν) = μ ⊗ₘ κ` and `κ ∘ₘ μ = μ ∗ ν`, the first two sentences of the present route). In the scope paragraph on MathematicalStatisticsNonparametric 2.4, add that its compensation identity is the case of a uniform input on `Fin M`, there on an arbitrary measurable space and in terms of `mutualInfoUniform`.

## N01 — Two docstring lines of `Suggested.lean` are over 100 characters

Lines 111 and 162 of `TauCetiRoadmap/GaussianChannelsAndWaterFilling/Suggested.lean` (the docstrings of 2.3 and 3.3) run past the line limit; and its Layer 1 section comment has another title than the README's Layer 1.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.1 golden formula | `μ` uniform on `{0,1}`, `ν = (1/3, 2/3)`, `Q = (.2,.5,.3)` and uniform on `{0,1,2}` | LHS 0.379623…, RHS 0.379623…; LHS 0.462098…, RHS 0.462098… | true; additive case only | R01 |
| 1.2 Gaussian divergence on ℝ | `s = t`; `t = 0`; `s = 0` | `(a−b)²/(2t)`, the common-variance value on main; formula `ofReal(−1/2) = 0` against divergence `∞`; same for `s = 0` | true; both `≠ 0` needed | none |
| 1.3 Gaussian divergence on `ℝ^n` | `ι` empty; `S = [[P,P],[P,P+N]]`, `T = diag(P, P+N)` | `0 = 0`; `det T/det S = (P+N)/N`, `tr(T⁻¹S) = 2`, so `D/2 = log(1+P/N)/2` | true | none |
| 2.1 Gaussian input best | `P = 0`; input uniform on `{±1}`, `P = N = 1`; Cauchy input, `P = 0` | Dirac: `I = 0 = RHS`, iff holds; fourth moments `1+6+3 = 10` vs `3·2² = 12`, strict; junk variance `0`, RHS `0 < I` | true; integrability needed | none |
| 2.2 Gaussian noise worst | `∫ℓ dρ` from `E x² = P`, `E xy = P`, `E y² = P+s`; noise `−X+W`, `P=1`, `N=2`; `P = 0`; `N = 0` | `C + P(1 − s/N)/(2(P+N))`; `(P−c)/b² = P+N`; `E XZ = −1`, `I = 0 < log(3/2)/2`; `P = 0`: equality for every noise; `N = 0`: `I = ∞ ≠ 0` | true; `hP`, `hN`, `hcorr` needed | none |
| 2.3 Ihara's bound | average of `klDiv G R_x`; uniform noise on `[−√3, √3]`; `ν = δ₀` | `C − (P − Var μ)/(2(P+σ²))`; divergence `log(πe/6)/2 ≈ 0.176 > 0`; RHS `0`, `I = ∞` | true; `0 < Var ν` needed, `hν` implied by it (README says so) | none |
| 3.1 vector channel | `ι = Fin 1`, `S = 0`; Cauchy, `K = 0`; `τ = tr(A(K−C))` | RHS `ofReal(log(1/0)/2) = 0`, `I = ∞`; junk `covMatrix = 0`, RHS `0 < I`; `tr(AC)+tr(AS) = n − τ`, `τ = tr(BAB) ≥ 0` | true | none |
| 3.2 water-filling exists, unique | `N=(1,2,4)`, `P=1,4,0`; `N=(1,1,3)`, `P=2,5`; `ι` empty, `P=1` | levels `2`, `7/2`, `≤1`: `(1,0,0)`, `(5/2,3/2,0)`, `0`; `(1,1,0)`, level `10/3`: `(7/3,7/3,1/3)`; empty sum `0 ≠ 1` | true | none |
| 3.3 water-filling optimal | `P < 0`; `P = 0`; `N = (0,1)`, `P = 1` | both sides false; `F = {0}`, `p = 0` both sides; maximizer `(0,1)`, water-filling `(1,0)` | true; `N i > 0` needed | none |
| 3.4 parallel channels | `n = 0`; `N=(1,2,4)`, `P=4`; `P=1`; `n=1`, `N=0` | `P = 0`, value `0`, set `{0}`; `(7/2)(7/4) = 49/8` vs `(7/3)(5/3)(4/3) = 140/27`, `1120 < 1323`; `log 2/2`; RHS `0 < ∞` | true | none |
| `mutualInfo`, `inputOutputLaw`, `IsWaterFilling` | product law; `(X, X)`; `ν` non-unique at `P = 0` | `klDiv` of a product from itself `0`; diagonal law of `N(0,1)`: `∞`; `p = 0` for every `ν ≤ min N` | intended objects | none |

- Source locators checked against the text: 11 in Polyanskiy–Wu (Definition 3.1 p. 42, (2.7) and (2.8) p. 23, Exercise I.8, Theorem 2.8 p. 28, Example 3.3 p. 48, Theorem 4.1 p. 67, Corollary 4.2 p. 68, Theorem 5.11 parts 2 and 3 p. 100, Theorem 20.12 p. 401, Theorem 20.14 p. 402) and 1 in Boyd–Vandenberghe (Example 5.2, pp. 245–246); all agree.
- Library declarations opened at the pins: `TauCeti.klDiv_compProd_right` (`ChainRule.lean` 125), `TauCeti.covMatrix` (`Covariance.lean` 72), `posSemidef_covMatrix` (119), the trace formula (131), `multivariateGaussian` and its Dirac junk value (`Multivariate.lean` 166–172), `klDiv_compProd_eq_add` (`ChainRule.lean` 203), `Measure.condKernel`, `variance_of_not_memLp` (`Variance.lean` 134); the other 45 cited names were found by name at the pins.
- No Gaussian divergence, mutual information of a joint law or water-filling statement exists in the pinned Mathlib or Tau Ceti.
- Cross-roadmap citations resolved on main: MathematicalStatisticsNonparametric 1.3 (`klDiv_pi`, `klDiv_gaussianReal`, `klDiv_multivariateGaussian`) and 2.4, DiffusionReverseStepKLBound 1.2, DenoisingDiffusion 1.1, KalmanFiltering, ProbabilisticAndMetricNumberTheory §5.2.
- Dependency check: `depcheck: 94 roadmaps, 1054 edges, 0 problem(s)`; no change outside the folder.
- Elaboration: `Suggested.lean` elaborates with `sorry` as its only warning (10 warnings); `#check @name` on the three definitions shows no lost binder; the one-tactic probe (`rfl`, `simp`, `infer_instance`) closes none of the 10 theorems.
- Headline theorems (2.1, 2.2, 3.1, 3.2–3.4) are all stated in `Suggested.lean`; nothing is padding.
- The automatic checks all passed on this head.

Overlap check: read DifferentialEntropyAndEntropyPower, ChannelCoding, HypothesisTestingExponents, RateDistortionTheory, SequentialAnalysis, DiffusionReverseStepKLBound, DenoisingDiffusion, RenyiDivergenceAndPrivacy; nothing shared. DifferentialEntropyAndEntropyPower and ChannelCoding both leave the capacity of the Gaussian channel outside their scope; the Gaussian divergences on main are the common-variance and isotropic cases, which the scope section names; the golden formula for a uniform finite index is MathematicalStatisticsNonparametric 2.4's (R01).

Source independence: 12 passages compared with 2 sources, none shared beyond the two seven-word slogans that name 2.1 and 2.2; largest share Polyanskiy–Wu, 13 of 15 locators; contents compared with Polyanskiy–Wu: independent (Layer 1 draws on its Chapters 2–4, Layer 2 on Chapters 5 and 20, Layer 3 on Section 20.4 and Boyd–Vandenberghe; no run of chapters is followed).

Research link: The headline targets are the Gaussian saddle point and water-filling capacity of Polyanskiy–Wu (2024), Theorems 5.11 and 20.14, and the bound of Ihara (1978) as their Theorem 20.12; rests on the README's sources, read in the text.

## Not verifiable

- Whether a public Lean formalisation states the same declarations: no repository was searched; the description says none was used.

## Source issues

- **Error** in Polyanskiy–Wu at Theorem 5.11, part 2, p. 100: the source says that under a bound on the variance of the input, equality holds only for the centred Gaussian input; it should be every Gaussian input of that variance, with any mean; affects a stated result.

## For the human reviewers

- Scope: the roadmap's sources are a 2024 Cambridge University Press textbook and Boyd–Vandenberghe; its headline theorems are textbook results (Shannon's Gaussian capacity, water-filling, Ihara 1978). Whether that is research-level scope is yours to decide.
- Licence: the Polyanskiy–Wu text was read from the first author's own page (a prepublication PDF of 16 August 2024); reuse from other Lean formalisations was not tested.
