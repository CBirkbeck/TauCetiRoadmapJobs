# Review of PositivityOfDirichletSeriesWithKernels (pull request #2903 at 01b98d4)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/PositivityOfDirichletSeriesWithKernels/`
**Verdict:** accepted

**Summary.** Accepted: I found no false statement, missing hypothesis or ownership defect. I recomputed every statement, Check and worked example of Layers 6, 7 and 8 and the route of the windowed theorem in both forms, and compared 50 attributions to the formal proof with its declarations, and the nine declarations of `Suggested.lean` with the README. There is one small correction (three results are attributed to formal-proof declarations that state less) and one format note, neither blocking. The human reviewers have one scope question and two licence questions, because the roadmap's main source is a formal proof that is not refereed literature and `Suggested.lean` is visibly adapted from it.

## C01 — Three results are said to follow from formal-proof declarations whose statements do not contain them

A reader who opens the cited declaration to see what the formal proof establishes finds less than the README attributes to it, and the Conventions promise that "the form that proof establishes is recorded at the target".

- 7.1 (line 623) says of clauses (a), (c) and (d): "They follow from [FormalProof], … (`ReciprocityTheory.ChartRestriction.DS.Lap.Base.GaussianLimitHaar`)", and the docstring of `tendsto_integral_of_laplaceMethod` says the same of the whole theorem. That declaration (`ReciprocityTheory/ReductiveGroups/DiscreteSeries/LaplaceOperators/LaplaceFoundations/RaisingLoweringNormIdentities.lean`, line 98) concludes only that `f_t` is integrable and `∫ f_t ≠ 0` for all large `t`. The positivity (a) and the limit `t^(n/2) ∫ f_t → ∫ e^(−B)` of (c) are not consequences of that: they are intermediate steps inside its proof (`LaplaceFoundations/B6.lean`, the private `main_lemma_2`), with no statement of their own.
- 6.5 (c) (line 256) says the consequence, a bound for every `U ≥ 1` with the constant `C₀ C_δ` and no window hypothesis, follows from `Deduction.landau_window_key`. That declaration assumes the pole data, `0 < θ < 1` and the window hypothesis, and concludes the bound `C e^(ηU) (σ − θ)^(−k)` along the windows, which is step 2 of the form of the formal proof in 6.8, not the statement of 6.5 (c).
- 8.1 (c) (line 693) says "The statement follows from [FormalProof]" (`Formalism.FourierDecayAlt.G.StationaryPhase`); the conclusion `det H ≠ 0` is not in that declaration, which only divides by `‖H.det‖`. The route of (c) proves it from the gradient hypothesis.

All three statements are true and the routes written in the README prove them. The smallest change is in the attributions: in 7.1 and the docstring, "(d), with the integrability of `f_t`, is [FormalProof] `GaussianLimitHaar`; (a) and (c) are steps of its proof, stated here as targets"; in 6.5 (c), "the consequence is a step of the proof of `Deduction.landau_window_key`"; in 8.1 (c), "the estimate follows from …; `det H ≠ 0` is this roadmap's addition". The References entry, which calls [FormalProof] the source "of the statements of Layers 7 and 8", would then except 7.1 (a), (c).

## N01 — `HasWindows` is said to be the formal proof's predicate; it is an equivalent form of it

6.9 (a) and the docstring of `HasWindows` say "This is [FormalProof] … (`Formalism.HC.HasWindows`)". The formal predicate asks for `Y ≥ Y₀` only, without `Y ≥ 1` and without `Set.Icc`. The two are equivalent for every `S` and exponent (apply the formal one at `max(Y₀, 1)`), so "is equivalent to" would be exact.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| 6.1 Taylor coefficients | `g = 1`; `g = e^(Au)`; `1/s` altered at `−1/2`; derivative step | `a_k = z^(−k−1)`; pole on `Re s = A`; order `0`, normal form `1/s`; `a_(k+1) = −a_k′/(k+1)` | true; matches `Deduction.landau_coeff` | none |
| 6.2 Gamma kernel | `k = 0`; `λ = 4`; `λ = 1`; (e) both sides of window; (f) `l = 2 + 6/δ` | `1/a`; `φ(½) = 0.8244`, `φ(√2) = 0.9346`, `U_4(1) = 1.2071`; `φ(1) = 1`; margins `l(1+δ) − (1+δ/2)(l+2) = 1`, `(1+δ/2)(l−2) = l+1` | true; (a), (b), (e), (f) match the four cited declarations | none |
| 6.3 Landau's theorem | `f = 1`; `e^(−u)`; `sin u`; disc `B(b, r−(b−a))` | singular at `0`; converges on `Re s > −1`; analytic at `σ_c = 0`; `a′ = 2b − a − r < a` | true | none |
| 6.4 one-sided forms | `−e^(βu)`; `−u e^(βu)`; `e^(βu) cos γu`; `H = C/(s−θ) − Φ`, `g = 0` | coefficient `−1`; residue `0`, coefficient `−1`; poles `β ± iγ`; `c_H > 0` gives `−c_H`; case (i) | true | none |
| 6.5 window inequalities | `g ≥ 0, γ = 0`; `g = −1`; `A = −1`, `g = 1_(0,1)`, `σ = k = 0`; condition on `σ` | equality; `|σ+iγ|^(−k−1) − σ^(−k−1) < 0`; `2 ≤ 2`; `q(σ−θ′) ≤ σ−A′` | true; display matches `Deduction.landau_window_ineq` | C01 |
| 6.6 coefficients near a pole | `(s−ρ)^(−1)`; `(s−ρ)^(−2)`; general `j` | `(z−ρ)^(−k−1)`; `(k+1)(z−ρ)^(−k−2)`; `C(k+j−1, j−1)(z−ρ)^(−k−j)` | true; matches `landau_cauchy`, `landau_pole_asym` | none |
| 6.7 expansion point | `Z = {β ± iγ₀}`; `Z = {β}`; `F = ∅`; `ε` in case (A) | (A) only; (B) only; `D = σ − θ`; `|σ+iγ−ρ| < D − ε`, discs in `Re > θ₀` | true; matches `landau_finite`, `landau_dichotomy`, `landau_nearest` with `θ₀ = 0` | none |
| 6.8 windowed theorem | steps 2, 4, 5; rescaling `e^(−tθ₀u) g(tu)`; six Checks; equivalence with `Deduction.landau_window` | `(r′/d)^k ≥ e^(2ηU)` against `M′ + 2(e^(ηU)+I)`; transform `Φ(θ₀+s/t)/t`, residues unchanged; all as stated; both directions hold | true | none |
| 6.9 windows, Mellin, Dirichlet | `y = e^u`; `⋃_{j≥1}[2^(2^j), 2^(2^j+1)]`; `j = 0`; `c(n) = log n`; Tonelli | `[U, λU] ↦ [Y, Y^λ]`; `Y^(λ−1) ≤ 2`; `[2, 8] = [2, 2³]`; `(σ−1)^(−2)`; `σ^(−1) Σ|c(n)|n^(−σ)` | true | N01 |
| 6.10 agreement | `c = 1`; `c(n) = n^(σ_a−1)/log²(n+1)` | `ζ(s)/s` singular at `1`; converges at `σ_a`, not left of it | true; `TauCeti.LSeries.landau` exists | none |
| 7.1 Laplace's method | `e^(−(1+i)tY²)`; `(1+Y²)^(−t)`; `e^(−tY²) − e^(−t(Y−t)²)`; `dim E = 0` | modulus `2^(−1/4)√π`; `1.8426` at `t = 10`, `1.7731` at `t = 1000`, `√π = 1.7725`; integral `0`; `μ{0}·f_t(0) → μ{0}` | true | C01 |
| 8.1 stationary phase on `ℂ^n` | (a) `β = 2, a = δ = 1`; (c) `n = 1`, `x + 1/x`, `r = 0.4`, `Λ = 7`; (d) `n = 1, 2`; `n = 0` | `1/√2` both sides; `|g| ≤ 6.8`, differences `5.609·10⁻⁴ = 1.402|t|²`, `5.543·10⁻⁵ = 0.554|t|²`; `det = 3z^(−2)`; difference `0` | true; (a)–(d) match the thirteen cited declarations | C01 |
| 8.2 non-archimedean | `ℚ_3`, `M = (2/3)`, `L = ℤ_3, 3⁻¹ℤ_3, 3ℤ_3`; (d) `t = 9`, `t = 3`; (b) `m = 1` | `0.5774i`, `0.5774i`, `1/3`; `0.11577` both sides, `−1/3` against `1`; `y + 1/(1+y) − 1 = y²/(1+y)` | true; (a)–(d) match the nine cited declarations | none |
| `rightmost_pole_real_of_le` | against 6.4 (c); `g = 0`; `C < 0`, `u₀ < 0` | bound a.e. for `u ≥ u₀`; integrability in both alternatives; case (i) | matches README | none |
| `windowedLandau_simplePole`, `windowedLandau` | junk value of the interval integral; `U < 0`; derivation of the first from the formal statement and back | `g⁺e^(−θu)` integrable on `[U,(1+δ)U]`, `U > 0`, from the transform hypothesis; `U₀ ≥ 0` may be assumed; both directions hold | match 6.8 | none |
| `HasWindows` | `Y₀ < 1`; `S = [x₀, ∞)`; formal definition | `Y ≥ max(Y₀, 1)`; window inside `S` once `Y ≥ max(x₀, 1)`; equivalent | matches 6.9 (a) | N01 |
| `windowedLandau_mellin_simplePole`, `windowedLandau_mellin` | non-integrable integrand; window to Laplace variable | `|G y^(−s−1)| ≤ C₀ y^(1−Re s)`, integrable; `|C|(κ−1) log Y ≤ Y^η` | match 6.9 (b) | none |
| `tendsto_integral_of_laplaceMethod` | `t = 0` in `(√t)⁻¹ • v`; `finrank = 0`; against `GaussianLimitHaar` | irrelevant under `atTop`; factor `1`; same hypotheses, stronger conclusion | matches 7.1 (a), (c), (d) | C01 |
| `stationaryPhase_leadingTerm` | norm on `Fin n → ℂ`; measure; order of quantifiers; `S < 0` | sup norm, balls are polydiscs; `(‖β‖/2π)^n •` volume; `∃ C` before `x₀ g V a S`; vacuous | matches 8.1 (c) | none |
| `stationaryPhase_nonarchimedean` | `ι = ∅`; continuity of `ψ`; non-unit `x_k`; finiteness of roots; README setting against the formal local datum | both sides `A`; `ψ = 1` on open `𝔒`; `A x = 0` there; finite; setting satisfies every field of the datum | matches 8.2 (d) with (a) | none |

- Source locators checked against the text: 50 declarations of [FormalProof] (every file and declaration the README names in Layers 6, 7 and 8 and the Conventions), 7 in DabrowskiFisher1997 (Proposition 1.3 (a) at line 353, (1.3) at line 376, Theorem 1.8 at lines 457–477, Corollary 1.10 at line 493, Examples 1.16 and 1.17 at lines 861 and 983, Lemma 1.20 at line 1094).
- Library declarations opened at the pins: 29 of Mathlib (among them `meromorphicTrailingCoeffAt_congr_nhdsNE`, `Mathlib/Analysis/Meromorphic/TrailingCoefficient.lean:186`; `ProbabilityTheory.gammaPDFReal`, `Mathlib/Probability/Distributions/Gamma.lean:45`; `MeasureTheory.Measure.integral_comp_smul`, `Mathlib/MeasureTheory/Measure/Haar/NormedSpace.lean:92`; `IsNonarchimedeanLocalField`, `Mathlib/NumberTheory/LocalField/Basic.lean:46`) and 2 of Tau Ceti (`TauCeti/Analysis/Contour/MeromorphicLaurent.lean:223`, `TauCeti/NumberTheory/LSeries/Landau.lean:296`); all exist as cited.
- Cross-roadmap citations resolved: 16 (ArithmeticDirichletSeriesPartII Conventions, §0.1, §0.2, §4.1; AnalyticNumberTheoryPartII §4.5c, §5.3g; MetaplecticAutomorphicForms §2.1; AsymptoticExpansions §4.4, §5.2, §13.6, Layers 5 and 6; CharacterSumsOverFiniteFields §1.4, §7.5; completed ArithmeticDirichletSeries 8.1; SpecialFunctionsGamma §10.1 and QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups §1.3 (i) at their open heads).
- Automatic checks: all passed. Dependency check output: `depcheck: 170 roadmaps, 1986 edges, 0 problem(s)`. Changes outside the folder: the three files of the family index only.
- Elaboration of `Suggested.lean`: `sorry` the only warning (8 theorems). The file has no `variable` block; the elaborated type of each of the 9 declarations was compared with its README statement and nothing changed.
- One-tactic probe on a copy (`rfl`, `simp`, `infer_instance`): none of the 8 theorems closes.
- Duplication audit: the roadmap is new; no layer or item is removed. Landau's theorem 6.3 and SpecialFunctionsGamma §10.1 are related, and the Scope section names that statement and says how 6.3 differs. No other roadmap, on main or open, states Laplace's method in several variables, stationary phase for holomorphic phases on `ℂ^n`, or the non-archimedean formula.

Overlap check: read GeneralizedRiemannHypothesisFromWindowBounds, BesselPoincareSeriesAndGramBounds, RiemannHypothesisStatementsAndConsequences, TensorInductionAndFiniteGroupInputs, FrobeniusRestrictedRieszSums, ArithmeticDirichletSeriesPartII, AnalyticNumberTheoryPartIII, AsymptoticExpansions; `HasLaplace`, `PoleBoundary`: ArithmeticDirichletSeriesPartII; one-variable Laplace's method and stationary phase: AsymptoticExpansions; `HasWindows` and the windowed theorem for general transforms: this roadmap.

Source independence: 59 passages compared with 3 sources (50 statements of [FormalProof], which is Lean code without prose, 7 of DabrowskiFisher1997, 2 of Announcement), none shared beyond formulas and names; largest share [FormalProof], 57 of about 72 locators; contents compared with [FormalProof] (its directory `Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems`): independent, the order 6.1, 6.2, 6.5, 6.6, 6.7, 6.8 being forced by the `*Needs:*` line of 6.8, with 6.3, 6.4, 6.10 absent from that source and Layers 7 and 8 drawn from two other parts of it. Hormander1990 could not be read.

Research link: Layer 6's windowed theorem is the criterion by which the formal proof of Alpöge (2026) passes from window bounds to zero-free half-planes (`Deduction.lemmaL`); 8.2 (c), (d) extend the `p`-adic stationary phase of Dąbrowski–Fisher (1997); 8.1 (c) is a case of Hörmander's Theorem 7.7.5. Rests on the README's sources and on the texts read.

## Not verifiable

- Hormander1990, Theorems 7.7.1 and 7.7.5 (8.1 (b), (c)): recorded as uncertified, text not read; the orders `C^(2n+2)`, `C^(3n+4)` and the uniformity of the constant are taken on the README's word.
- Landau 1905, Widder Chapter II and Montgomery–Vaughan §15.1 (6.1, 6.3, 6.4): not among the cached texts; 6.3 and 6.4 were checked by their proofs instead.
- KaczorowskiPintz1986 (context for 6.8): recorded as uncertified, text not read; no statement rests on it.

## Source issues

- none

## For the human reviewers

- **Scope.** 57 of about 72 locators point to [FormalProof], a public Lean repository announced in Announcement (2026), not refereed literature; the windowed theorem 6.8 has no other source. Layers 7 and 8 also cite Hormander1990 and DabrowskiFisher1997.
- **Licence.** `Suggested.lean` is adapted from [FormalProof]: `tendsto_integral_of_laplaceMethod` and `stationaryPhase_leadingTerm` share hypotheses and binder names with `GaussianLimitHaar` and `Formalism.FourierDecayAlt.G.StationaryPhase` (`Formalism/HermitianCurvature/StatementG.lean`). I found no licence file for that repository.
- **Licence.** [FormalProof] has no entry in the roadmap's source manifest; I read it from the copy the operator holds, which records the repository's commit `e50d098`.
