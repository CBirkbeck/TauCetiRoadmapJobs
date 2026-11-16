# Review of DiracScatteringAndNonlinearFourierTransform (pull request #2444 at 550224e)

**Verdict:** accepted

No findings.

## Previous findings

- R01 — repaired: README line 2293: "(3) follows from (1) and (2) through the last clause of (1). … `min(C(t), C′(t))` keeps the approximation of (1) and … puts every large `t` outside `T₀`, so (2) applies."
- R02 — repaired: README line 1916–1918: "with the constant that the route below gives; … The cited passages state only this qualitative consequence, the Szegő condition (poltoratski2024 line 263–268; mauth2022 Theorem 3 …; denisov2006 Theorem 11.1 …)"
- R03 — repaired: description: "Dependencies. The README consumes one other roadmap: AutomorphicSpectralTheory §0.5, the subtracted-kernel Herglotz representation …, in §2.2 and §6.5. That roadmap is an open pull request, listed in the merge order below."

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| §8.7 Check: (3) from (1) and (2) | zeros at `s + (log t)/t − i/(2t)`, `C = √t`, `t = 200` | `log t = 5.298 < √t = 14.142`, height `−0.5/t > −1/t`, so `t ∉ T₁(s, √t)`; `C′(200) = 5 < 5.298`, so no zero in `Q(s, 5/t)` | holds | none |
| §8.7 Check: the §9.4 construction | `T(s, k) = e^k`; `k < 1/2` | `T_k = max(k, e, …, e^k) = e^k`; `C′ = 5` on `(148.41, 403.43]`; `T₀(s, k) = ∅ ⊆ (0, e^k]` for `k < 1/2` | holds | none |
| §8.7(1), last clause | `C̃ ≤ C`, `C̃ → ∞` | `η_{C̃} ≤ η_C`, `e^{2C̃}η_{C̃} ≤ e^{2C}η_C`; `T₀(s, C̃) ⊆ T₀(s, C)`, `T₁(s, C) ⊆ T₁(s, C̃)`; §8.6's approximation restricts to `Q(s, C̃/t)` | holds | none |
| §5.5 `exists_nonlinearFourier_plancherel` | `q = 1_{[0,1]}`, `T = 0` and `T = 1` | `∫|F|² = 2.3926 ≤ ∫ −log(1 − |F|²) = 3.14158 (π) ≤ 4π = 12.566`; at `T = 1` the bound is `0`; `|a|² − |b|² = 1.0000` at `x = 0.4, 2` | holds | none |
| §5.5 attribution of constants | poltoratski2024 line 518–547 | Source: `log|a|` in `L¹(Π)`, `a`, `b` in `Π`-measure, no rate, no `4π`, no `L¹(ℝ)`; route: `(2‖ρ₂‖)² ≤ 4π‖q‖²_{L²(T,∞)}` | matches new text | none |
| §6.8 `szego_condition` | `q = 0`; `f = 0.7` on `[0, 1.3]` | `0 ≥ −2π log 2 = −4.3552`; `(1/π)∫ log w dΠ = −0.918466` (quadrature `−0.918466`) `≥ −2 log 2 − 0.637 = −2.023294` | holds | none |
| §6.8 attribution of constants | poltoratski2024 line 265–266; mauth2022 line 702–705; denisov2006 line 3246, 4219 | Each states only `log w ∈ L¹(Π)` or `dσ ∈ (Szegő)`, no constant; denisov2006 §13 (line 4219) is its Dirac-system section | matches new text | none |

The rows for the statements the diff does not touch stand as in the previous review, of `3798662`.

- Source locators: 8 checked against the cached texts (poltoratski2024 line 263–268, 518–547, 577, 1002–1012; mauth2022 line 702–707, 1397–1408; denisov2006 line 3246, 4219). Each supports the changed text as written. Of the sampled targets, only §8.7 is touched, and its locators still match.
- Library: 5 pinned declarations near the changed passages opened. Mathlib `MeasureTheory.TendstoInMeasure`, `TendstoInMeasure.exists_seq_tendsto_ae` and `tendstoInMeasure_of_tendsto_eLpNorm` are in `MeasureTheory/Function/ConvergenceInMeasure.lean` at lines 57, 266 and 445. Tau Ceti `TauCeti.lowerSemicontinuous_klDiv_finiteMeasure` is in `InformationTheory/KullbackLeibler/Variational.lean` line 499, and `TauCeti.rouche_exists_eq_zero_iff` is in `Analysis/Complex/Conformal/Rouche.lean` line 359.
- Cross-roadmap citations: AutomorphicSpectralTheory §0.5 resolves at its open head ("0.5 Herglotz representation"). The description's dependency sentence agrees with README lines 97 and 482–490.
- Gate: the gate, run here at this head, passes every text check (all counts 0, `OK`). The worker's gate, which includes the targeted build, passes. Dependency check: `depcheck: 255 roadmaps, 2429 edges, 0 problem(s)`. Nothing changed outside the folder.
- Lean: `lake env lean` on `Suggested.lean` gives 9 `sorry` warnings and nothing else. The file is unchanged since `3798662`, so the binder comparison and the one-tactic probe of the previous review stand.
- Overlap check: this round read RelativisticQuantumFieldTheory (Minkowski-space Dirac Green operators, not the half-line system), SchrodingerOperatorsAndSpectralTypes and SchattenClassesAndSchurMultipliers; ComplexHessianEquations, AutomorphicSpectralTheory, PDE, StochasticCalculus and OptimalTransport were read in the previous review. Shared objects and owners: the Herglotz representation (AutomorphicSpectralTheory §0.5, cited); the bounded-data half-space Poisson integral (Tau Ceti); disc Poisson maximal bounds (StochasticCalculus S6.5). No open revision drops a cited id.
- Source independence: changed passages only. 3 passages (§5.5, §6.8, §8.7) were compared with 8 sources by 5-word runs; the only shared runs are formula fragments (`Q(s, C/t)`, `log|a(t, ·)| in L¹`). No layer was added, removed or reordered, so the arrangement stands as at `3798662`: largest share poltoratski2024, 71 of 190 locators; contents compared with poltoratski2024: independent.

## Not verifiable

- None for the changed passages. The items listed at `3798662` are untouched by the change: garnett2007 is uncertified; coddingtonlevinson1955, debranges1968, remling2018 and krein1955 are waived; poltoratski2024 line 1308–1339 is garbled OCR.

## Source issues

- none

## For the human reviewers

- §9.6 is stated only at resonance-free points (README line 137–152). mnatsakanyan2022 line 9–13 and 135–137 retracts its main theorem and reports the same mistake in poltoratski2024's Lemma 11 (an earlier arXiv version). denisov2026 line 211–212 poses almost-everywhere convergence (Q2R) as an open question.
- §8.6, §8.8, §8.9 and §9.1–§9.3 feed no target of this roadmap, since §9.5 uses only §8.7(3). README line 2659–2660 assigns them to a downstream proof that almost every point is resonance-free.
- poltoratski2024, the source with the largest share, is an OCR of an image-only scan (cache header). Its formula lines 1258–1347 are partly garbled, so the wording comparison there rests on the readable words.
- garnett2007 (uncertified) and coddingtonlevinson1955, debranges1968, remling2018 and krein1955 (waived) were not read, so their 24 citations are untested for wording and support.
