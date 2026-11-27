# Review of SecondOrderRandomFields (pull request #3226 at a3b63cc)

**Verdict:** needs changes

**Summary.** Changes are needed, for two reasons: a Check in 5.1 states a value that is false (the variogram form of `‖h‖^α` is strictly positive on the contrasts for `α = 0.5, 1`, not `0`), and Layers 1, 2 and 5.2 state, for real random fields, theorems that three other roadmaps (two on main, one open) own in a neighbouring form, while the scope section names none of them. No stated theorem was found false: every statement of `Suggested.lean` was read against the README and tested on instances, and the file elaborates with `sorry` as the only warning. There are three small corrections and two format notes, none blocking; ten of the eleven sources are paywalled, so most locators are unverified, and three questions are left to the human reviewers.

## R01 (P2) — The Check of 5.1 on twelve random points gives the smallest eigenvalue as `0` for `α = 0.5` and `α = 1`, where the form is strictly positive

A reader takes from this Check (5.1, line 681) that `‖h‖^α` is degenerate on generic point sets for every `α ≤ 2`, and an implementer who tests a definition of conditional negative definiteness against it will find a discrepancy. For `0 < α < 2` the Lévy–Khintchine form of 5.2 gives `−∑ aᵢ aⱼ ‖sᵢ − sⱼ‖^α = c ∫ |∑ aⱼ e^{i⟪ω, sⱼ⟫}|² ‖ω‖^{−d−α} dω`, which is positive for distinct points and `a ≠ 0`. Only `α = 2` is degenerate, where the form is `2‖∑ aᵢ sᵢ‖²`, of rank at most `3`.

Computed on twelve standard normal points of `ℝ³`, in an orthonormal basis of the hyperplane `∑ aᵢ = 0`: the smallest eigenvalue is `0.653` (`α = 0.5`), `0.380` (`α = 1`), `−3 · 10⁻¹⁵` (`α = 2`) and `−5.37` (`α = 2.5`). A value `0` for `α < 2` appears only when the form is projected in the full twelve-dimensional space, where the constant vector contributes a spurious zero. The smallest change: "has positive smallest eigenvalue for `α = 0.5, 1`, smallest eigenvalue `0` to rounding for `α = 2` (rank at most `3`), and a negative one for `α = 2.5`".

## R02 (P2) — Layers 1, 2 and 5.2 state theorems that MathematicalStatisticsFoundations, InfinitelyDivisibleLawsAndTriangularArrays and PowerSpectraAndWienerKhinchin own in a neighbouring form, and the scope section names none of them

Without a stated boundary the library gets the same theorem twice on different carriers, and an implementer cannot tell which statement to prove and which to derive. The three cases, each read in the other roadmap's text:

- PowerSpectraAndWienerKhinchin (open pull request #3207, a new roadmap by another author) treats families `X : ℝ → E` in a complex inner product space with `⟪X s, X t⟫` a function of `t − s`. Its README owns the spectral measure (1.0, line 70), the spectral isometry `L²(μ) → E` sending the exponentials to `X t` (1.1, line 105), the continuous density for integrable autocovariance (2.2, line 191), "differentiable in norm iff `∫ ξ² dμ < ∞`" (3.2, line 304) and the derivative's spectral measure (3.3, line 330). At `E = L²(P)`, a centred field and `ω = 2πξ`, these are the case `d = 1` of 2.1 and of the existence part of 2.2 here, and the case `m = 1` of the first equivalence and of the derivative process in 2.3. Its scope (line 406) lists strict stationarity, Gaussian processes and the random measure as not treated, so the two texts do not hand anything to each other; they both own it.
- MathematicalStatisticsFoundations §9.6 (on main, README line 1522) owns second-order stationarity of `X : ℤ → H` and the positive semidefiniteness of the autocovariance matrices; 1.3 and the last conjunct of 1.4 state the same for real random variables on a group, which includes `ℤ`.
- InfinitelyDivisibleLawsAndTriangularArrays §3.2 (on main, README lines 297–306) owns the Lévy–Khintchine representation of infinitely divisible laws on `ℝ`. For `d = 1`, (b)⇒(c) of 5.2 is its symmetric case: `e^{−γ/n}` is the characteristic function of an `n`-th root of the law with characteristic function `e^{−γ}`.

The smallest change is a paragraph in "Scope and ownership" that names the three and says, one clause each, how the statement here differs (real random variables with constant mean and covariance on an arbitrary abelian group; `ℝ^d` in place of `ℝ`; the uniqueness and centredness conjuncts of 2.2; orders `m ≥ 2` and the condition on `K^{(2m)}(0)` in 2.3) and which side derives the common case. A roadmap on main is cited from here. For the open one, either 2.1–2.3 take the case `d = 1`, `m = 1` from its sections by name, or this roadmap says it owns the random-field form and that roadmap cites it; that choice is the two authors'.

## C01 — The reason given in 3.1 for the independence of exponentials on a sphere is not a valid one

In the route for strict positive definiteness (3.1, line 462) the parenthesis argues that an analytic function vanishing on a sphere of dimension at least `1` vanishes on `ℝ^d`. Analyticity does not give this: `‖ω‖² − r²` is analytic and vanishes on the sphere. The theorem itself stands (Gneiting (2013), its text line 149, cites Sun (1993), Theorem 3.8), but an implementer who follows the sentence is stuck. A route that works: `g = ∑ cⱼ e^{i⟪xⱼ, ·⟫}` is entire on `ℂ^d` and vanishes on the real sphere, hence on the complex quadric `z·z = r²`, which is irreducible for `d ≥ 2`; on the points `r(s a + i√(s² − 1) b)` with `a ⟂ b` real unit vectors and `b` separating the `xⱼ`, the term with the least `⟪xⱼ, b⟫` dominates as `s → ∞`, so its coefficient is `0`, and induction finishes. Alternatively cite Sun's theorem for the step.

## C02 — The first conclusion of `spectralIntegral_properties` is its own hypothesis

The statement assumes `hcent : ∀ f, ∫ ω, I f ω ∂P = 0` and concludes first `∀ t, ∫ ω, I (expLp F t) ω ∂P = 0`, which is `hcent` at `f = expLp F t` (`Suggested.lean`, lines 344–345). That conjunct asks an implementer for nothing. Either drop it from the conclusion (the README's "centred" is then the hypothesis), or weaken the hypothesis to what a consumer has, for instance centredness of `I` on indicators.

## C03 — Six roadmaps named as consumers and as owners of excluded material exist nowhere

"Downstream consumers" and "Boundaries with the family" (lines 904–923 and 974–980) name GaussianFieldsSupremaAndExcursions, SpatialLinearPredictionAndLikelihood, EquivalenceOfGaussianMeasuresAndInfillAsymptotics, GaussianMarkovRandomFieldsAndTheSPDELink, SpatialCoxAndClusterProcesses and SpatialPointPatternStatistics, and assign them sample-path continuity, Dudley's bound, the Borell–TIS inequality, kriging, likelihood and equivalence of Gaussian measures. None is on main or in an open pull request (only DeterminantalPointProcesses is, and its 7.3 does cite 4.1 here), so a reader who follows these names finds nothing, and the excluded material has no owner yet. Would describe them in prose, as the Summary already does ("the spatial-statistics roadmaps on Gaussian suprema and excursion sets, …"), or say that these roadmaps are planned.

## N01 — `lemma` in `Suggested.lean`

`memLp_exp_inner_mul_I` (line 306) is declared with `lemma`; the house form is `theorem`.

## N02 — Process wording in two places

"no local source states it" (line 1082) and "Judged from the source text" (line 1090) describe how the text was prepared and not the mathematics; the first can go, the second can read "it proves".

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 covariance kernels | `Z t = X`; kernel `[[0,1],[1,0]]` | all-ones matrix, eigenvalues `2, 0`; second has eigenvalue `−1` | holds | none |
| 1.2 Gaussian law | `Fin 2`, `ρ = 1`; empty `T` | `det = 1 − ρ² = 0`, law on diagonal; empty `T`: one-point space | holds | none |
| 1.3 stationarity | `Z t = tX`; two-sided Brownian motion | `Var(Z(s+h) − Z s) = h²`; kernel `= γ(s)+γ(t)−γ(s−t)` at `γ = |h|/2` | holds | none |
| 1.4 continuity estimate | `C = cos`, `s = 0`, `h = π` | left `2`, right `√(2·1·2) = 2` | holds, sharp | none |
| 1.5 mean-square continuity | `1{t ≥ U}`; deterministic step | `E(Z t − Z s)² = |t − s|`; step: covariance `0`, mean jumps by `1` | holds | none |
| 2.1 spectral measure, density | `e^{−‖h‖²}` at `‖ω‖ = 1.3`; `cos`; rank `0` | `(4π)^{−d/2} e^{−0.4225}` = `0.18489`, `0.05216`; `(δ₁+δ₋₁)/2`; point: density `C(0)` | holds | R02 (owner) |
| 2.2 spectral representation | `W{±1} = (X ∓ iY)/2`; `W{1} = X`, `W{−1} = iY` | `E|W{1}|² = ½`, cross term `0`, `Z t = X cos t + Y sin t`; `Z 0 = X + iY` | holds | C02, R02 |
| 2.3 differentiability | `e^{−h²}`; Cauchy example; `m = 0` | `−K″(0) = 2 = ∫ω² dN(0,2)`; `E cos(Xh)/2 = e^{−|h|}/2`; `∫ω²/(1+ω²) = ∞` | holds | R02 |
| 3.1 Schoenberg, radial density | constant; `Ω₁` series | `2π^{d/2}/(Γ(d/2)(2π)^d) = (2^{d−1}π^{d/2}Γ(d/2))⁻¹`; series `= cos` | holds | none |
| 3.1 strictness | `cos` at `0, 2π`; `‖ω‖² − r²` | form `1−1−1+1 = 0` (so `d ≥ 2` needed); analytic, zero on sphere, not on `ℝ^d` | theorem holds | C01 |
| 3.2 lower bounds | simplex; `Ω₃`, `Ω₄` minima | `(d+1)(1+dφ) ≥ 0`; `sin 4.4934/4.4934 = −0.2172 > −1/3`; `−0.1323 > −1/4` | holds | none |
| 3.3 `Φ_∞` | `e^{−t}`; `e^{−t³}`; `d = 5` | density `r⁻²e^{−1/(4r²)}/√π` by `s = r²`; `φ″(0) = 0`; sup `0.1392` | holds | none |
| 3.4 truncated powers | `ℝ³`, `ν = 2`, `u = 3, 8`; `ν = 1.5`; `ℝ`, `ν = 0.9` | `0.0214540` both sides, `7.2436·10⁻⁴` both; min `−2.056·10⁻⁴` at `8.28`; `−6.85·10⁻³` at `6.07` | holds | none |
| 4.1 Matérn | `φ_{3/2,0.8}(0.9)`; `ν = 10`; `d = 0` | `2.125·e^{−1.125} = 0.68989`; max gap `0.0226`; density `1` on a point | holds | none |
| 4.2 smoothness | `ν = 0.3, 1.5, 2.5` | `Γ(0.7)/(Γ(1.3)·2^{0.6}) = 0.954`; `1/(4(ν−1)) = 0.5, 0.1667` | holds | none |
| 5.1 Check on `‖h‖^α` | 12 points of `ℝ³`, hyperplane `∑a = 0` | `0.653`, `0.380`, `−3·10⁻¹⁵`, `−5.37` for `α = 0.5, 1, 2, 2.5` | Check false at `0.5, 1` | R01 |
| 5.1 inequalities | `|h|/2`, `h²/2` | `|√γ(s+h) − √γ(s)| ≤ √γ(h)`; `γ(nh) = n²γ(h)` for `h²/2` | holds | none |
| 5.2 Schoenberg–von Neumann | bound; `c_α`; realization kernel | `(1−cos)(1+‖ω‖⁻²) ≤ 2+‖h‖²/2`; `c = 5.013, 3.342`; `Var(Zx−Zy) = 2γ(x−y)` | holds | R02 (`d = 1`) |
| 6.1 Cressie–Huang | separable; `(1−3u²)e^{−u²}` | `∫ = √π − 3√π/2 = −√π/2 < 0` | holds | none |
| 6.2 Gneiting | `β = 0`; `d = 0`; one Gaussian | constant in `u`; `σ²φ(0)`; transform `(π/r)^{d/2}e^{−ψ‖ω‖²/(4r)}` | holds | none |
| 7.1 Schoenberg on spheres | `e^{−θ}` on the circle; chordal Gaussian | `b₀ = 0.30455`, `b₁ = 0.33207`, `b₁₁ = 0.00544`; `e^{−4 sin² 0.55} = 0.33527` | holds | none |
| 7.2 circle criterion | `b_m ∝ 2^{−m}`, `m ≡ 0, 1 (mod 3)` | `ψ(2π/3) = 2/3 − 1/6 = ½`; eigenvalues `2, ½, ½`; class `2+3ℤ` met by `−1` | holds; Lean index `n − j + kn` right | none |
| 7.3 closure | `e^{−θ/k} → 1`; `d = 0` | limit kernel all ones, singular; two-point sphere | holds | none |
| 7.4 Euclidean to sphere | `e^{−θ²}`; Matérn `3/2` | `b₈ = −1.99·10⁻⁶`; `b₆ = −0.00145` | holds | none |

- Source locators checked against the text: 14, all in Gneiting (2013) (arXiv v5: (4), (5), (7), Sun's theorem, Table 2, closure, Theorem 1(a), 1(b), (13)–(15), Theorems 3, 7, 8, Examples 1, 2); statements supported; three of the README's reported misprints confirmed.
- Library declarations opened at the pin: `TauCeti.IsPositiveDefiniteSub` (`Analysis/PositiveDefinite/AddGroup.lean:135`), `IsCompletelyMonotoneOnIoi` and `IsContinuousCompletelyMonotoneOnIoi` (`Analysis/CompletelyMonotone/Basic.lean:328`, `479`), `bochner_charFun` (`Analysis/Bochner/CharFun/Bochner.lean:69`), `Matrix.PosSemidef` and `Matrix.PosDef` (`LinearAlgebra/Matrix/PosDef.lean:62`, `176`, both over finitely supported vectors); the 23 pinned `#check` lines elaborate.
- Cross-roadmap citations resolved: 16 sections (AnalyticNumberTheoryPartI §2.1a; SpecialFunctionsBessel §§2.1–2.3, 5.1; LaguerreJacobi §6.2; KernelsAndSpectralMethods 8.2; WienerChaosAndMalliavinCalculus 1.1; FactorRigidity §4.1; StochasticCalculus 1.1; higher spheres §§3.1, 4.1–4.3 and motion groups §§5.3, 6.1 at their open heads); the three local copies agree verbatim with their owners.
- Dependency check: `depcheck: 94 roadmaps, 1056 edges, 0 problem(s)`; no upward or cyclic line.
- Elaboration: `Suggested.lean` elaborates, `sorry` the only warning; 75 `sorry`, one proved helper; no `set_option`, no sorried data; signatures read against the README, no lost binder.
- One-tactic probe on a copy (`simp`, `rfl`, `infer_instance`, `exact?`): none of the 75 closes; two attempts timed out in `exact?` (uniqueness of the radial measure, radial density).
- Numerics recomputed: over 30 Check values; all agree except the one of R01.
- No change outside the folder; no library declaration found that proves a target.

Overlap check: read ScatteredDataKernelInterpolation, MarkovRandomFieldsAndAutoModels, DeterminantalPointProcesses, PowerSpectraAndWienerKhinchin, SpecialFunctionsHigherSpheres, KernelsAndSpectralMethods, MathematicalStatisticsHigherOrderAndResampling, StandardDistributions; the spectral measure, isometry, density and mean-square derivative on `ℝ` are shared with PowerSpectraAndWienerKhinchin, with no single owner (R02); the Matérn family is owned here and cited by DeterminantalPointProcesses 7.3; zonal polynomials are owned by SpecialFunctionsHigherSpheres; Gaussian scale mixtures by KernelsAndSpectralMethods 8.2; the completely monotone characterization of `Φ_∞` and the truncated powers are owned here, the earlier roadmap, and ScatteredDataKernelInterpolation 1.3–1.4 states their strict forms without citing it, which is for that roadmap to settle.

Source independence: 8 passages compared with 1 source (Gneiting (2013)), none shared beyond a dozen forced words; largest share Stein (1999), 27 of about 134 locators, text and contents not readable; contents compared with Gneiting (2013), the second largest (22): independent (its sections 2, 3, 4.1–4.5 against 3.1–3.3, 7.1–7.4 here, no one-to-one run).

Research link: Layers 3 and 7 are Schoenberg's characterizations (1938, 1942) as used by Gneiting (2013) for covariances on spheres; Layer 6 is Gneiting's (2002) nonseparable construction; Layer 4 is the Matérn model of Stein (1999). Rests on the README's citations and on the text of Gneiting (2013).

## Not verifiable

- Stein (1999), Gaetan–Guyon (2010), Adler–Taylor (2007), Matérn (1986), Bulinski–Spodarev (2013): Springer, paywalled; every locator into them is unverified (sampled targets 1.1–1.5, 2.1, 2.3, 3.2, 3.4, 4.2, 5.1).
- Chilès–Delfiner (2012), Cressie (1993): the publisher's page refused the request; unverified.
- Handbook of Spatial Statistics (2010), van Lieshout (2019): publisher's host in no licence class; unverified (6.1, 6.2 locators included).
- Gneiting (2002): publisher's page refused; Theorems 1, 2, (14) and Table 2 unverified (6.1, 6.2).
- Printed page numbers of Gneiting (2013): read in arXiv v5 (24 pages against 23 in print); theorem and equation numbers agree, pages agree from Theorem 3 on and may differ by one before it.
- The misprints the README reports in Gaetan–Guyon p. 6, the Handbook pp. 22 and 432, and Cressie §2.5.1: the texts were not readable.

Automatic checks set aside as false positives: the section heading of `Suggested.lean` that is followed only by `#check` lines was reported as a heading with no declaration under it; the lines pin library declarations, which the form allows.

## Source issues

- **Error** in Gneiting (2013) at Theorem 1(a), circle case (arXiv v5 p. 7): the source says strictness on the circle holds iff for all `0 ≤ j < n` some `b_{j+kn,1}`, `k ≥ 0`, is positive; it should be that some `b_{m,1}` with `m ≡ j` or `m ≡ −j (mod n)` is positive; affects a stated result.
- **Misprint** in Gneiting (2013) at (15) (arXiv v5 p. 7): the source says the Legendre series has terms `b_{n,2} P_n(cos θ)/(n + 1)`; it should be `b_{n,2} P_n(cos θ)`, since the normalizing value at `1` is `1`; affects nothing.
- **Misprint** in Gneiting (2013) at Table 2 and (36) (arXiv v5 pp. 5, 19): the source says the Matérn prefactor is `2^{ν−1}/Γ(ν)`; it should be `2^{1−ν}/Γ(ν)`, which gives the value `1` at the origin; affects nothing.
- **Misprint** in Gneiting (2013) at Section 2, after (8) (arXiv v5 p. 6): the source says the infimum of `sin t / t` is `−0.2127…`; it should be `−0.2172…`; affects nothing.

## For the human reviewers

- **Not tested.** Stein (1999) has the largest share of the locators (27 of about 134) and could not be read; wording and arrangement were compared only with Gneiting (2013).
- **Licence.** 54 declaration names of `Suggested.lean` coincide with names in `MSSS/RandomFields/` of github.com/bjbraams/lean-MSSS at 6826ba2, which the README (line 1088) gives as Apache-2.0 and by the pull request's author.
- **Scope.** Ten of eleven sources are textbooks, a handbook and lecture notes of spatial statistics; the refereed research articles cited are Gneiting (2002) and Gneiting (2013).
