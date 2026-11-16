# Review of DiracScatteringAndNonlinearFourierTransform (pull request #2444 at 3798662)

**Verdict:** needs changes

## R01 (P3) — §8.7: the Check "(3) is not a consequence of (1) and (2)" is false

**Location:** `TauCetiRoadmap/DiracScatteringAndNonlinearFourierTransform/README.md` line 2289: "(3) is not a consequence of the statements (1) and (2): they allow the function `C(t) = √t` in (1) together with zeros of `E(t, ·)` at `s + (log t)/t − i/(2t)`."

**Claim:** Statement (1) says every smaller function tending to infinity keeps its approximation (line 2233; route, line 2263). With that clause, (1) and (2) do give (3). The Check's example ignores the clause.

**Witness:** For the Check's zeros take `C̃(t) = min(√t, ½ log t)`: `|Re z − s| = (log t)/t > C̃(t)/t`, so every large `t` is outside `T₀(s, C̃)`, hence in `T₁(s, C̃)`; (1) holds with `C̃`, and (2) gives (3).

**Repair:** Replace the bullet with: "- (3) also follows from (1) and (2). When `T₀(s, K)` is bounded for every `K`, the construction of §9.4's first bullet, applied to the sets `T₀(s, k)`, gives `C′(t) → ∞` such that `Q(s, C′(t)/t)` contains no zero of `E(t, ·)` for large `t`. Then `min(C(t), C′(t))` keeps the approximation of (1) and puts every large `t` outside `T₀`, so (2) applies. The route below proves (3) directly from §8.5 and §7.2, with constant boxes and without §8.6." On the Check's instance, `T(s, k) = e^k` gives `C′(t) = k < log t` for `e^k < t ≤ e^{k+1}`, so every zero lies outside the box.

## R02 (P3) — §6.8: the cited sources state only the qualitative Szegő condition

**Location:** `TauCetiRoadmap/DiracScatteringAndNonlinearFourierTransform/README.md` line 1914: "Prove that `∫ log w dΠ ≥ −2π log 2 − π‖q‖²` and the same for `w̃`; hence `log w, log w̃ ∈ L¹(Π)` … (poltoratski2024 line 263–268; mauth2022 Theorem 3 …; denisov2006 Theorem 11.1 …)"

**Claim:** None of the three cited texts states the bound with the constant `−2π log 2 − π‖q‖²`, which `szego_condition` asserts. They state only that `log w` lies in `L¹(Π)`.

**Witness:** poltoratski2024 line 265–266 states only `log w, log w̃ ∈ L¹(Π)`. mauth2022 line 702–705 states only `(log w)/(1 + t²) ∈ L¹`. denisov2006 line 3246 states only "`dσ ∈ (Szegő)`".

**Repair:** "Prove that `∫ log w dΠ ≥ −2π log 2 − π‖q‖²` and the same for `w̃`, with the constant given by the route below. Hence `log w, log w̃ ∈ L¹(Π)` and `w, w̃ > 0` almost everywhere: this is the qualitative Szegő condition of poltoratski2024 line 263–268, mauth2022 Theorem 3 line 702–707 and denisov2006 Theorem 11.1 line 3246 (with the dictionary of §13)."

## R03 (P3) — Pull request description: the Dependencies sentence names no roadmap

**Location:** Description, prose: "Dependencies (the roadmaps the README cites by name and section, and what they in turn need; the Lean imports none of them). The open pull requests that must merge first are in the merge order below."

**Claim:** The sentence announces a list that is not there. The roadmap's only roadmap supplier, AutomorphicSpectralTheory §0.5, is not named anywhere in the prose; it appears only in the generated merge-order block.

**Witness:** README line 482–490 (`From TauCetiRoadmap.AutomorphicSpectralTheory`: §0.5, consumed in §2.2 and §6.5). The description's prose names no roadmap.

**Repair:** "Dependencies: AutomorphicSpectralTheory §0.5 (the subtracted-kernel Herglotz representation, consumed in §2.2 and §6.5), an open pull request listed in the merge order below. OperatorTheory/UnboundedOperators §4.8, OperatorTheory/ToeplitzOperators, StochasticCalculus S6.5 and AsymptoticExpansions §10.1 (on main) and AutomorphicSpectralTheory §1.6 are cited only in a Check or to delimit scope. The Lean imports none of them."

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| §1.1 Grönwall | `α = 2`, `β = 1_{[0,1]}`, `u = 2e^{min(t,1)}`; `β ≡ −1`, `u ≡ ½`, `α = 1`; `α < 0` | Equality in hypothesis and bound; `½ > e^{−1} = 0.368`, so `β ≥ 0` is needed; route gives `αe^{∫β}` for every real `α` | holds | none |
| §1.2 `linear_caratheodory` | `P = t^{−1/2}`; `a = b`; `P = 1/t`; Tau Ceti pin | `y₀e^{2√t}` solves it; `Icc = {a}` forces `Y(a) = y₀`; non-integrable `1/t`: every `ct` solves; pin needs `‖M‖ ≤ K` a.e. | holds, not at pin | none |
| §2.2 positive harmonic | `u = P[δ₀]`, `u = Im z` | `πy·u(iy) = 1 = ν(ℝ)`; `F = −1/(πz)` has triple `(0, 0, δ₀/π)`, `ν = πν_F`; `F′ = i(−i) = 1` | holds | none |
| §3.1 `existsUnique_diracFundamentalSystem`, `diracCoeff` | `−Ω(z − Q)` expanded; `q = 0`; `f = c, z = 0`; `q = 1 + i` | `[[f, −z−g],[z−g, −f]]` matches; `M = [[cos, −sin],[sin, cos]]`; `A = e^{ct}`; `‖M(1,0)‖ = e^{√2} = 4.113`, row-sum `4.915` | holds | none |
| §3.3 Hermite–Biehler | free case; Christoffel–Darboux rederived | `|E|² − |E#|² = 2 sinh 2ty = 4y∫₀ᵗ cosh 2sy ds`; `M(λ)*ΩM(z) − Ω = (z − λ̄)∫M*M` | holds | none |
| §4.1 scattering matrix, `scatteringA/B` | conjugation by `U = [[1, i],[1, −i]]`; `q = c, z = 0` | `z` terms cancel and `q` lands in entry (2,1); `a = cosh|c|T`, `b = (c/|c|) sinh|c|T`; `c = 0.7+0.4i`, `T = 1.3`: `1.6014`, `1.0860+0.6206i` | holds | none |
| §4.4 `nonlinear_plancherel` | `q = 1_{[0,1]}`; `t = 0`; first order | Simpson `∫ log|a(1,x)| = 1.5707963` vs `π/2 = 1.5707963`; `a(0,·) = 1`, both sides `0`; `½∫|∫q e^{2ixs}|² = (π/2)∫|q|²` | holds; source constant 1 wrong | none |
| §5.4–5.5 `exists_nonlinearFourier_plancherel` | `q = 0`; `T = 0`; composition law | Both sides `0`; `∫|F|² ≤ π‖q‖² ≤ 4π‖q‖²`; `|q⌃* − ρ₁| ≤ |ρ₂|(1+|ρ₁|)` rederived from the §4.1 concatenation law | holds | none |
| §6.4 Weyl function | free case, `t = 1.7`, `z = 0.6+0.25i`; `f = 1` on `[0,1]` | radius `1/sinh 0.85 = 1.0459`, centre `1.4470i`, `i` interior; `m(i) = i/(1+√2 tanh√2) = 0.44318i` from `N² = 2` | holds | none |
| §6.5 `exists_isSpectralMeasureOf`, `IsSpectralMeasureOf` | `q = 0`; wrong normalisation `μ/π`; Dirichlet side | `Im(−Ẽ/E) = 1 = 0·Im z + P[dx]`; `μ/π` gives `1/π ≠ 1`; `Im(E/Ẽ) = 1/|Ẽ|²` on `ℝ` since `Im(EẼ̄) = 1` | holds | none |
| §6.6 `spectralMeasure_isometry`, `spectralMeasure_unique` | free case; `q = c1_{[0,T]}`, `t ≥ T`; `ν = 2dx` | Both sides `∫|F|²dx`; `|E(t,x)| = |E(T,x)|`, so `μ = dx/|E(T,·)|²` works; `2dx` gives twice the norm | holds | none |
| §6.8 `szego_condition` | `q = 0`; route chain; `f = 0.7` on `[0,1.3]` | `0 ≥ −2π log 2`; `∫log w_T dΠ ≥ −2π log 2 − 2∫log|a| ≥ −2π log 2 − π‖q‖²`; `2.6 − 2 log 5.808 = −0.9186` | holds; locators qualitative | R02 |
| §8.1 boxes, `γ` | `p = 1`; range of `|γ(p) sin(a+ip)|²` | `γ(1) = 1.41421/1.90443 = 0.7426`; minimum `tanh p` at `a = 0`, maximum `coth p` at `sin²a = 1` | holds | none |
| §8.2 universality | free case; real `λ`; source (6.1) | ratio `1`; `Sinc_t(λ,λ) = t/π`; poltoratski2024 line 632–635 has the same `w(s)‖K‖²_μ/‖Sinc‖²₂ → 1` on `Q(s,C/t)` | holds | none |
| §8.4 uniform proximity | free case; source (6.6) | Difference `0`; poltoratski2024 line 756–760 has the same `o(t)` bound over `λ, z ∈ Q(s,C/t)` | holds | none |
| §8.7(3) and its Check | zeros at `s + (log t)/t − i/(2t)`; `C̃ = min(√t, ½ log t)` | Zeros lie outside `Q(s, C̃/t)`, so all large `t` are in `T₁(s, C̃)`; (1) and then (2) give (3) | Check false | R01 |
| §8.8 joint approximation | approximants with `t(ũ − u) = Φ` | Determinant `2i cos Φ/√(ww̃)`; `ũ = u`, `ww̃ = 0.63`: `2.52i ≠ 2i`; restriction to `T₁ ∩ T̃₁` matches mauth2022 line 3142 | holds | none |
| §8.9 matching | (2.2) at `s`; `w = 0.7`, `w̃ = 0.9`, `ty = 1.5` | `|κ|² sinh(2ty′) = 2`, so `|κ| = γ(ty′)`; source factor gives `2.0820i` (`ty′ = 1.52`), `2.4448i` (`1.6`) | holds; source misprint | none |
| §9.2 trigonometric evaluation | `s = 0.3`, `(50, .31, .03)`, `(60, .305, .025)`, `α = e^{0.4i}, e^{−1.1i}` | direct `a = 0.26848+0.96349i` = closed form; `b = −0.014788−0.013213i` = closed form; `|a|²−|b|² = 1.0000000000` | holds | none |
| §9.5 asymptotics | approximants; `f = c1_{[0,T]}`, `x = 0` | `|a|² → (1/w+1/w̃+2)/4`, `|b|² → (1/w+1/w̃−2)/4`, difference `1`; `(e^{2cT}+e^{−2cT}+2)/4 = cosh² cT` | holds | none |
| §9.6 `tendsto_truncation_of_isResonanceFree` | limit denominator; `f ≡ 1`, `s = ½` | `|1/√w + iβ/√w̃|² = 1/w+1/w̃+2 > 0`, so `a(T,·) ≠ 0` on `|z−s| < C/T`; `s = ½` resonance-free, `‖M(t,½)‖ ~ e^{(√3/2)t}` | holds; `hf` needed | none |
| `IsResonanceFree` | `T₀ < 0`; `t = 0` | For `t ∈ (T₀, 0)`, `C/t < 0`: empty box; at `t = 0` the box is `{s}`, where `E = 1`, `Ẽ = −i` | equals README §9.4 | none |

- Source locators: 74 checked against the cached texts (poltoratski2024 38, mauth2022 9, romanov2014 9, taothiele2012 6, killipsimon2003 5, mnatsakanyan2022 3, denisov2006 2, denisov2026 2). Of the 15 sampled targets, 14 were verified; §2.2's locator is garnett2007, which is uncertified.
- Library: 103 declarations opened at the pins (63 Mathlib, 40 Tau Ceti), all at the cited file and line. `TauCeti.exists_continuousOn_eq_forall_mem_Icc_eq_picard` (`Analysis/ODE/Caratheodory.lean` line 196) needs `‖M‖ ≤ K` almost everywhere.
- Cross-roadmap citations: 7 resolved: AutomorphicSpectralTheory §0.5 and §1.6 at its head; OperatorTheory/UnboundedOperators §4.8 (UO-D07), OperatorTheory/ToeplitzOperators Layers 2–5, StochasticCalculus S6.5 and AsymptoticExpansions §10.1 on main. All 10 leads in the citations list are declarations of `Suggested.lean`.
- Gate: the worker's gate passes. The dependency check prints `depcheck: 252 roadmaps, 2396 edges, 0 problem(s)`. The pull request changes nothing outside the folder.
- Lean: `lake env lean` on `Suggested.lean` gives 9 `sorry` warnings and nothing else. I compared the elaborated types of all 19 declarations with their README statements: no binder is lost, so nothing changed. The one-tactic probe (`rfl`, `simp`, `infer_instance`, `constructor <;> simp`) closed 0 of the 9 theorems.
- Overlap check: read SchattenClassesAndSchurMultipliers, ComplexHessianEquations, SchrodingerOperatorsAndSpectralTypes, AutomorphicSpectralTheory, GaussianIsoperimetryAndClusters, PDE, StochasticCalculus, OptimalTransport. Shared: the Herglotz representation (owner AutomorphicSpectralTheory §0.5, cited); the bounded-data half-space Poisson integral (owner Tau Ceti/PDE §3.4, Check here); disc Poisson maximal bounds (owner StochasticCalculus S6.5; half-plane here); `InformationTheory.klDiv` (Mathlib).
- Source independence: 74 locator passages and a scan of the whole README for 7-word runs shared with 8 sources (116 runs); none is shared beyond formulas, titles and mathematical phrases of at most 8 words. Largest share: poltoratski2024, 71 of 190 source citations. Contents compared with poltoratski2024: §§8.2–8.8 follow its Lemmas 2–7 in order, an order forced by the Needs chain 8.2→8.3→…→8.8; Layers 1–6 and §§9.4–9.6 are the roadmap's own. Result: independent.

## Not verifiable

- garnett2007 (Ch. I §§3–5, Ch. II §§1–4, cited in §2.2–§2.8): uncertified (paywalled), not read.
- coddingtonlevinson1955 (§1.1–§1.7), debranges1968 (§6.1, §6.6), remling2018 (§6.4, §6.6) and krein1955: waived, not read.
- poltoratski2024 (9.3)–(9.4), line 1308–1339: the OCR is garbled and the sign of `b_{t₁→t₂}` cannot be read. §9.2's formulas were checked by direct computation instead.

## Source issues

- **Error** in poltoratski2024 at (5.5), p. 14: the source says the `L¹` norm of `log|a(t,·)|` equals `‖f‖²` on `(0,t)`; it should be `(π/2)‖f‖²` in its normalisation (5.2); affects a stated result.
- **Error** in poltoratski2024 at the Parseval identity for `f̂`, p. 15: the source says the `L¹` norm of `log(1 − |f̂|²)` equals `‖f‖²`; it should be `π‖f‖²`; affects a stated result.
- **Error** in mauth2022 at (4) and the identity after it, p. 5: the source prints constant `1` for `‖log|a(t,·)|‖₁` and `½‖log(1 − |f†|²)‖₁`; both should be `(π/2)‖f‖²`; affects a stated result.
- **Misprint** in poltoratski2024 at Lemma 8, (8.5), p. 29: the source keeps the factor `γ(ty)` at the new height `y′`; (2.2) at `s` forces `γ(ty′)`; affects a stated result.
- **Misprint** in mauth2022 at Lemma 45, (58), p. 62: the source keeps `γ(ty)` at height `y′` and claims the determinant is `2i`; that holds only when `y′ = y`, and `γ(ty′)` is right; affects the proof.
- **Misprint** in poltoratski2024 at the proof of Lemma 5, p. 22: the source says `|λ − z| ≤ 1/t` on `Q(s, C/t)`; the bound is `2√2 C/t`; affects nothing.
- **Misprint** in poltoratski2024 at Lemma 7, p. 27, and mauth2022 Lemma 43, p. 60: the source compares the height `p(t)` with `C(t)`; it should be compared with `C(t)/t`; affects nothing.

## For the human reviewers

- §9.6 is stated only at resonance-free points (README line 137–152). mnatsakanyan2022 line 9–13 and 135–137 retracts its main theorem and reports the same mistake in poltoratski2024's Lemma 11 (an earlier arXiv version). denisov2026 line 211–212 poses almost-everywhere convergence (Q2R) as an open question.
- §8.6, §8.8, §8.9 and §9.1–§9.3 feed no target of this roadmap, since §9.5 uses only §8.7(3). README line 2652–2653 assigns them to a downstream proof that almost every point is resonance-free.
- poltoratski2024, the source with the largest share, is an OCR of an image-only scan (cache header). Its formula lines 1258–1347 are partly garbled, so the wording comparison there rests on the readable words.
- garnett2007 (uncertified) and coddingtonlevinson1955, debranges1968, remling2018 and krein1955 (waived) were not read, so their 24 citations are untested for wording and support.
