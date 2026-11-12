# Review of DiracScatteringAndNonlinearFourierTransform (design, round 6)

**Verdict:** needs changes

Five findings: one P2 (blocking) and four P3. Both findings of round 5 are repaired, the repair's
new local form of §1.7 is correct, the dependency check shows no UPWARD or CYCLE line, and every
pinned declaration the README cites exists at its stated file and line. The blocking finding is a
duplication the earlier rounds did not see: §6.7 restates as this roadmap's own a relative entropy
that Mathlib and Tau Ceti have at the pins, with its variational formula and weak semicontinuity.

## R01 (P2) — §6.7 restates the relative entropy the pinned libraries have

Location: `packages/DiracScatteringAndNonlinearFourierTransform/design/README.md` line 1503–1518
("define the relative entropy `S(σ | ν) = −∫ log(dσ/dν) dσ` when `σ ≪ ν` and `−∞` otherwise", with
the bound, variational formula and semicontinuity as API); Scope line 48 ("the relative entropy of
measures"); plan.json 6.7 (`kind: definition`, `name: relativeEntropy`).

Claim: the relative entropy of finite measures, its bound `S ≤ log ν(X)`, its variational formula
and its joint weak semicontinuity are this roadmap's to state.

Witness: at the pins, Mathlib `InformationTheory.klDiv` (`InformationTheory/KullbackLeibler/Basic.lean`
line 56) and `InformationTheory.mul_log_le_klDiv` (line 355); Tau Ceti
`TauCeti.klDiv_eq_iSup_boundedContinuousFunction_integral_sub_integral_exp_sub_one` and
`TauCeti.lowerSemicontinuous_klDiv_finiteMeasure` (`InformationTheory/KullbackLeibler/Variational.lean`
line 457, 499). For finite measures `S(σ | ν) = ν(X) − σ(X) − klDiv σ ν`.

Repair (tested on §6.7's own Checks: `ν = 2σ` gives `klDiv = 1 − log 2`, so `S = 2 − 1 − (1 − log 2) = log 2`;
`ν = δ₁` gives `klDiv = ∞`, `S = −∞`; `νₙ = (1 + sin nθ)dθ/2π` gives `klDiv = log 2 ≥ 0 = klDiv(σ ‖ σ)`):

- In §6.7, replace the definition by a notation: "write `S(σ | ν) = ν(X) − σ(X) − klDiv σ ν` (Mathlib
  `InformationTheory.klDiv`), which is `−∫ log(dσ/dν) dσ` when `σ ≪ ν` and `−∞` otherwise
  (killipsimon2003 (5.9))". Delete the first three API bullets and cite instead: the bound is
  `InformationTheory.mul_log_le_klDiv` at `σ(X) = 1` (`klDiv ≥ ν(X) − 1 − log ν(X)`); the variational
  formula is the pinned bounded-continuous form with `F = e^f`; upper semicontinuity of `S` is
  `TauCeti.lowerSemicontinuous_klDiv_finiteMeasure` together with continuity of the total mass under
  weak convergence. Keep the Killip–Simon locators as the source of the notion.
- Keep the transport bullet as the section's one target, a theorem: `klDiv σ ν = ν(X) − 1 − (1/π)∫ log w dΠ`
  when `log w ∈ L¹(Π)`, and `∞` otherwise. Retitle the section "The entropy of a spectral measure
  against the Poisson measure".
- Add the four declarations to "From Mathlib" and "From Tau Ceti", and to the Scope deferral list
  ("the relative entropy of finite measures, its variational formula and weak lower semicontinuity to
  Mathlib and Tau Ceti"); drop "the relative entropy of measures" from the Layer 6 ownership bullet;
  extend §6.7's *Needs:* and plan.json 6.7 (`kind: theorem`, `prerequisites`) and §6.8's wording
  ("§6.7 transfers the bound") accordingly. §6.8's inequality is unchanged: lower semicontinuity and
  `ν_T(X) → ν(X)` give `∫ log w dΠ ≥ lim sup ∫ log w_T dΠ`.

## R02 (P3) — §9.8 cites Mauth's Theorem 6 for a statement it does not make

Location: `design/README.md` line 2025–2026 ("mauth2022 Theorem 2 line 216 and Theorem 6 line 4121 for
the equivalence with the absence of resonances"); plan.json 9.8 `locator`.

Claim: mauth2022 Theorem 6 states the equivalence of the theorem with the absence of resonances.

Witness: mauth2022 line 4121–4125: Theorem 6 says that `a(t, s)` converges exactly when the integral
`∫₀ᵗ f b a# e^{−2its}` converges. The reduction to the absence of resonances is Theorem 5 (line 3820)
and the proof at line 3851–3862, which combines it with Corollary 6.

Repair: write "mauth2022 Theorem 2 line 216, and Theorem 5 line 3820 with the proof at line 3851–3862
for the reduction to the absence of resonances"; the same in plan.json 9.8.

## R03 (P3) — §5.6 cites a Plancherel exercise for the elementary rules

Location: `design/README.md` line 1312–1313 ("taothiele2012 line 687–688 for the discrete model");
plan.json 5.6 `locator`.

Claim: taothiele2012 line 687–688 is the discrete analogue of the translation, modulation and
first-order rules.

Witness: taothiele2012 line 687–688 is an exercise: the Plancherel identity of Lemma 6 becomes the
linear one to quadratic order. The rules are Lecture 1 Lemma 1, (5) and (7), line 225–240; the linear
approximation `a ≈ 1`, `b ≈ Σ Fₙzⁿ` is line 210–220.

Repair: write "taothiele2012 Lecture 1 Lemma 1 (5), (7) line 225–240 and line 210–220 for the discrete
model"; the same in plan.json 5.6. The sources.toml locator already names "Lecture 1 §1 Lemmas 1–3".

## R04 (P3) — §2.2 cites Mauth's Lemma 3 for the converse of what it states

Location: `design/README.md` line 658 ("(mauth2022 Lemma 3 line 390; garnett2007, Ch. I §3,
uncertified)"); plan.json 2.2 `locator`.

Claim: mauth2022 Lemma 3 supports the representation `u = c Im z + P[ν]` of a positive harmonic
function.

Witness: mauth2022 line 390–392: Lemma 3 says the Poisson extension of a positive Poisson-finite
measure is harmonic in `ℂ₊`. That is §2.1's harmonicity bullet, not the representation theorem.

Repair: in §2.2 cite only "garnett2007, Ch. I §3, uncertified" (the route through the pinned
Nevanlinna representation is stated and self-contained); move "mauth2022 Lemma 3 line 390" to the
harmonicity bullet of §2.1; mirror in plan.json 2.1 and 2.2.

## R05 (P3) — Scope hands the disc Hardy space to a roadmap although Tau Ceti has it

Location: `design/README.md` line 79 ("the disc Hardy space `H²(𝔻)` and its Toeplitz operators to
OperatorTheory (ToeplitzOperators T1)").

Claim: the owner of the disc Hardy space is a roadmap.

Witness: pinned Tau Ceti `TauCeti.hardySubmodule` and `TauCeti.HardySpace`
(`Analysis/Fourier/Hardy/Basic.lean` line 39, 43), with `Hardy/DiskFunction.lean`,
`Hardy/ReproducingKernel.lean`, `Hardy/BoundaryUniqueness.lean` and `Hardy/Toeplitz.lean`.

Repair: write "the disc Hardy space `H²(𝔻)` to Tau Ceti (`TauCeti.HardySpace`,
`Analysis/Fourier/Hardy/`), and its further Toeplitz theory to OperatorTheory (ToeplitzOperators T1)";
the clause "neither is consumed" stands, since §2.6 is the half-plane space with Lebesgue measure.

## Verified sound

**Repairs of round 5, finding by finding.**

- **F01 (P3), the Riccati locator of §4.5 — repaired.** Line 1153–1156 now reads "For the
  Krein-system analogue, the Riccati equation of the Schur function of the system restricted to a tail
  `[s, ∞)`, see denisov2006 §9 Lemma 9.1 (157)–(158) line 2510–2521, and Lemma 9.2 line 2544–2556 for
  its solution as the ratio of the two components of a linear system". Read at denisov2006 line
  2510–2521 (Lemma 9.1, `d f_r/dr = −iλ f_r + A − A f_r²`) and line 2544–2556 (Lemma 9.2: `f = y₁/y₂`
  for `y₁′ = −iλy₁ + Ay₂`, `y₂′ = Ay₁`, with `|y₁| ≤ |y₂|`). `(195)` and `3256` occur nowhere in the
  README, plan.json or sources.toml; the References entry names "§9 Lemmas 9.1–9.2, (157)–(158)". The
  departure (the citation on the Riccati claim, not on `det G = 1`) is right.
- **F02 (P3), uniqueness on the interval — repaired.** §1.2 line 399–405: "there is a `Y : ℝ → E`,
  continuous on `[a, b]`, with … for every `t ∈ [a, b]`, and that any two such functions agree on
  `[a, b]`", and the converse "agrees on `[a, b]` with these solutions"; §1.7 line 543–545 likewise on
  `I`; a new §1.2 Check (line 424–426) records the instance. No "exactly one" remains.
- **The repair's own change to §1.7 (local form) — correct.** With `φ(t) = (∫m)exp(∫L)`,
  `φ′ ≥ m + Lφ`, so the Picard iterates stay in `B` when `φ(t₀ + τ) ≤ r`; two `B`-valued solutions
  agree by §1.1; under strict inequality a first exit time `t*` gives
  `‖Y(t*) − x₀‖ ≤ φ(t*) < r`, a contradiction. The new Check (line 572–577) was recomputed: on
  `B = [−1, 1]`, `L = 0`, `m = 1_{[0,1)}`, `(∫₀² m)e⁰ = 1 = r`; `min(t, 1)` and `t ↦ 1 + (t − 1)²` on
  `[1, 2]` (derivative `2(t − 1) = 2√(Y − 1)`) both solve. The case `r = 0` makes the strict clause
  empty. The global bound `‖Y − x₀‖ ≤ |∫m| exp|∫L|` holds with equality-type instance `F = x`:
  `|x₀|(e^t − 1) ≤ |x₀| t e^t`.

**Principles.** No route-specific shortcut (complex potentials in Layers 1–6; real in 7–9, as the
source's argument is written, stated in Scope). No roadmap re-planned; one supplier, downward. Own
words with locators; no passage copied in the sampled sections. No algorithms. No `Suggested.lean` at
the design stage, so no sorry'd data, no `set_option`, and the padding probe and `#check` comparison do
not apply. Organisation: nine layers named by their mathematics; Layers 7–9 follow dependencies
(§7.2 → §8.7 → §8.8 → §9.3 → §9.6 → §9.8), which force the order. Grep of the README: no LaTeX
delimiters, no pull-request numbers, no machine paths, no process words, no `lemma` outside "Lemma n"
citations. Every layer ends with Examples and Dependencies; every definition read this round has its
API and at least three Checks. plan.json: `gaps: []`, one supplier, pins `1b1ccf4b` and `2fd255d9`
equal to `lake-manifest.json` and to the checked-out package revisions.

**Gate** (run this round on the candidate README):

```
candidate: DiracScatteringAndNonlinearFourierTransform is not in the merge order yet; checked as if placed after MathematicalBilliards (the intake inserts it when its design is accepted)
depcheck: 232 roadmaps, 2072 edges, 0 problem(s)
```

No UPWARD or CYCLE line. AnalyticNumberTheoryPartI §0.23 exists on main
(`TauCetiRoadmap/AnalyticNumberTheoryPartI/README.md` line 644, "Finite-order Hadamard factorization":
`f = z^m exp(h) ∏ E_n(z/α)`, `n = ⌊ρ⌋`, `deg h ≤ n`, `Σ|α|^{−n−1} < ∞`), as the contract states it; it is
earlier in the merge order. Declared gaps: none, none needed. `scratch/overlaps.md`: no open pull
request changes this roadmap, no cited id dropped, none defined only by an open revision.
`scratch/citations.md`: nothing found nowhere.

**Ownership against open work** (`roadmaps grep` over main and the open heads): "Hermite–Biehler",
"de Branges", "non-linear Fourier", `H²(ℂ₊)`: no match anywhere. "Paley–Wiener": automorphic
Paley–Wiener theorems only (AutomorphicSpectralTheory and Part II, EndoscopicTransfer…). "Weyl
function": a reference title in UnboundedOperators, no target. "Carathéodory solutions":
AsymptoticExpansions cites the pinned `TauCeti/Analysis/ODE/`. "nontangential": StochasticCalculus
S6.5 (circle, finite measures), which the Scope already names. "Liouville's formula":
IncompressibleFlows, for flows of vector fields, not the linear integrable-coefficient case.
"relative entropy": OperatorAlgebraDynamics and Subfactors (matrix and von Neumann), OptimalTransport
§11.1 (open), and the pinned libraries (R01). The board packages index lists no related package.
Sweep of the pinned Tau Ceti and Mathlib for the objects of Layers 2–7 (Paley–Wiener, outer, Blaschke,
Hermite–Biehler, nontangential, propagator, integrable Grönwall, Riccati): only
`Analysis/ODE/DysonSeries.lean` (cited), `Analysis/Fourier/Hardy/` (R05) and
`InformationTheory/KullbackLeibler/` (R01).

**Pinned declarations opened this round.** A script opened all 47 Mathlib and 31 Tau Ceti locators of
"Exact supplier contracts" at the stated file and line: each line declares the cited name (among them
`AbsolutelyContinuousOnInterval` 155, `ODE_solution_unique_of_mem_Ioo` 279,
`MeasureTheory.Lp.fourierTransformₗᵢ` 51, `Matrix.toEuclideanCLM` 101, `poissonKernel` 54,
`TauCeti.eqOn_of_forall_mem_Icc_eq_picard` 219, `Matrix.hasFDerivAt_det` 110 in `namespace Matrix`,
`TauCeti.halfSpacePoissonKernel` 122,
`TauCeti.tendsto_halfSpacePoissonIntegral` 297, `TauCeti.exists_isFiniteMeasure_eq_nevanlinnaKernel_add`
436, `TauCeti.eqOn_const_ball_of_tendsto_circleMap` 198). Also `TauCeti.boundaryCayley`
(`Analysis/Complex/UpperHalfPlane/Cayley.lean` 316), `TauCeti.bijOn_sub_I_div_add_I_upperHalfPlaneSet`
(171), and Mathlib's Riemann–Lebesgue lemma (`Analysis/Fourier/RiemannLebesgueLemma.lean`).

**Sources, seeded sample** (each read at the cited line):

- §1.3: romanov2014 line 213–224 (Harnack estimate, `det ≡ 1`, chain rule `M(b) = N(b)M(a)` at 223–224): as cited.
- §1.7: coddingtonlevinson1955 Ch. 2 §1, waived; checked by its route and Checks (above).
- §2.1: poltoratski2024 line 250–254 (Poisson measure, Poisson-finite), 610–614 (Poisson extension); mauth2022 line 378–392: as cited.
- §3.1: poltoratski2024 line 136–166 (system (1.1), `f + ig` on the diagonal, Neumann and Dirichlet solutions), (2.1) line 204; mauth2022 (5)–(6) line 546–563, Lemma 14 line 565; romanov2014 (12) line 758: as cited.
- §5.1: denisov2006 Theorem 11.1 line 3246–3255 (uniform in `Im λ > ε`, (194)), §13 (245)–(248) line 4219–4258; poltoratski2024 line 518–529: as cited.
- §5.5: poltoratski2024 line 518–544 (convergence in measure, `L¹(Π)` for `log|a|`, `a`, `b` in `Π`-measure); mauth2022 Lemma 19 line 711: as cited. The `L²` bound and the `L¹(ℝ)` statement are the roadmap's own, with a route that closes (table).
- §5.6: poltoratski2024 line 561–567 (modulation/shift and rescaling): as cited; taothiele2012: R03.
- §6.4: romanov2014 Theorem 15 line 2217–2261, Lemma 23 line 2370: as round 5 read them.
- §6.5: poltoratski2024 line 255–264; mauth2022 line 692–701; romanov2014 line 2275–2281 (`m_X`, `m` Herglotz, `μ_X`, `μ`): as cited.
- §7.1: poltoratski2024 line 307–346; mauth2022 line 446–453: as round 5 read them; values recomputed there.
- §8.7: poltoratski2024 Corollary 3 line 1002–1012 (parts 1 and 2, `T₁` defined at 997–1001); mauth2022 Corollary 6 line 1397–1408: as cited (one misprint, Source issues).
- §9.1: poltoratski2024 line 1183–1210 (definition through `M(t₂)M(t₁)⁻¹`, Parseval), (9.3) line 1316–1320: as cited; the README's constant `π/2` is its stated normalisation.
- §9.4: poltoratski2024 line 1380–1388 (the modified potential), (9.8) line 1476–1481, line 1518–1520: as cited; the README's `π/|s|` is the correct period of `e^{2iβs}` where the source says "about `2π`".
- §9.6: poltoratski2024 line 1173–1539 ("Special case", the general case by two insertions, "Final step" at 1534–1539): as cited.
- §9.8: poltoratski2024 Theorem 1 line 578–586 with the strong form, line 54–57 (bounded eigenfunctions); mauth2022 Theorem 2 line 216: as cited; Theorem 6: R02.
- No locator is flagged unverified by the author.

**Adversarial table** (plain Python; systems by fourth-order Runge–Kutta, 3000–6000 steps; integrals by the trapezoid rule).

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §1.1 Grönwall | `α < 0`: `u = αe^t`, `β = 1`; `β = −1`, `u = 1/2`, `α = 1` | `v′ ≤ β(α + v)` gives `u ≤ αe^{∫β}` for every real `α`; `1/2 > e^{−1} = 0.368` | holds; `β ≥ 0` needed | none |
| §1.2 uniqueness on `[a, b]` | `[0, 1]`, `P = F = 0`; `Y ≡ 0`, `1_{(2,3)}` | equal on `[0, 1]`, `0 ≠ 1` at `5/2` | holds as restated | none |
| §1.3 time ordering | `A` on `[0, 1)`, `B` on `[1, 2]` | numerical `N(2, 0) = [[1, 1], [1, 2]] = e^B e^A`; `e^A e^B = [[2, 1], [1, 1]]` | holds | none |
| §1.3 laws | scalar `p` | `N = exp∫_s^t p`; `N(t, r)N(r, s) = N(t, s)`; `∂_s N = −Np(s)`; `‖N − 1‖ ≤ e^{∫|p|} − 1` | holds | none |
| §1.7 local form | repair's instance; `F = x²`, `τ = 0.1` | residuals `0`; `Y₂(2) = 2 ∉ B`; `τe^{4τ} = 0.14918 < 1`, `1/(1 − 0.1) = 1.1111 ≤ 2` | holds | none |
| §2.1 kernel and Schwarz integral | `h = 1/(1 + x²)`, `z = 2i`; `δ₀` | `P[h](2i) = 1/3 = Re(i/3i)`; `P[δ₀](i) = 1/π`; round 5's rows (mass `1.0000000000`, Cayley `4/5`) stand | holds | none |
| §3.1 fundamental matrix | free; `f = c`; `q = ic`; `q = 1 + i`; smooth complex | coefficient `[[f, −z − g], [z − g, −f]]`; `exp` gives `[[cos, −sin], [sin, cos]]`, `diag(e^{ct}, e^{−ct})`, `(cosh, −sinh)`; `M(1, 0) = [[3.5465, −1.3683], [−1.3683, 0.8099]]`; `det M = 1 + 5·10⁻¹⁵`; `|E| = 1.8406`, `|E#| = 0.5733` | holds | none |
| §3.1 Christoffel–Darboux | derivative | `∂ₜ(M(λ)*ΩM(z)) = (z − conj λ)M(λ)*M(z)`, using `Q* = Q`, `Ω² = −1` | holds | none |
| §3.2 identities | algebra | `EẼ# − ẼE# = 2i(AD − BC)`; `E′ = −izE + qE#`; `∂ₜ log E = −ix + q e^{−2iφ}` on `ℝ` | holds | none |
| §4.1 dictionary | smooth complex potential, `t = 1.7`, `z = 0.6 + 0.25i` | `a = 1.0632064 + 0.1442646i`, `b = 0.0749608 + 0.2463022i` from both sides; `det G = 1 − 3·10⁻¹⁶i` | holds | none |
| §4.1 rules | `q = 0.4cos 5s + 0.3i`, `z = 0.3 + 0.1i`, `t₀ = 0.6`, `ξ = 0.7`, `λ = 1.9` | translation `−0.163906 + 0.141527i` both sides; modulation `−0.156698 + 0.029471i`; dilation `−0.096418 + 0.254132i`; real reflection `−0.050374 + 0.044817i` | holds | none |
| §5.1 bounds | `q = 1_{[0,1]}`, `z = 5i` | `a = 1.0933679`, `log a = 0.0892628 ≤ 0.2`; `‖r‖₂ ≤ 2 · (1/2y)‖q‖`; tail `(∫_t^∞ e^{−4ys})^{1/2} = e^{−2yt}/(2√y)` | holds | none |
| §5.1 limit at `i∞` | first-order `r₁` | `y∫q(s)∫₀ˢ e^{−2y(s−u)} conj q(u) → ½‖q‖²`; correction `≤ y‖q‖ · ‖q‖³/(2y²) → 0` | holds | none |
| §5.3 boundary law | `ρ₁ = ρ₂ = 1/2`, `u = 1` | `q⌃* = 4/5`; `1 − 16/25 = 9/25 = (3/4)²/(25/16)` | holds | none |
| §5.5 `L²` bound | `q = 0.8` on `[0, 2]`, `T = 1` | `‖q⌃* − ρ₁‖² = 0.8747 ≤ 4π(0.64) = 8.0425`; `|q⌃* − ρ₁| = |ρ₂|(1 − |ρ₁|²)/|1 + uρ₂ conj ρ₁| ≤ |ρ₂|(1 + |ρ₁|)` | holds | none |
| §5.5 `a` in `Π`-measure | `g = 1/a₂`, `|g| ≤ 1` | `∫|1 − g|² dΠ ≤ 2π − 2π Re g(i)`, since `P[g*](i) = g(i)` | holds | none |
| §5.4 identity | `q = 0.8` on `[0, 2]` | `∫ −log(1 − |q⌃*|²) = 4.0191` on `[−300, 300]`; `π‖q‖² = 4.0212` | holds | none |
| §5.6 first order | `q = 0.4cos 5s + 0.3i`, `L = 0.40057` | bound `0.04337 = (sinh L − L) + L(cosh L − 1)`; errors `0.0084`, `0.0096`, `0.0011`; split `ρ − b₀ = (b − b₀)/a + b₀(1/a − 1)` | holds | none |
| §5.6 Fourier convention | kernel | `e^{2ixs} = e^{−2πisw}` at `w = −x/π` | holds | none |
| §6.5 densities | `f = 0.7` on `[0, 1.3]`; `x = 0`, `0.4` | `m(0) = 0.162026i = ie^{−1.82}`, `w̃(0) = 6.171858`; at `0.4`: `Im m = 0.179720 = 1/|E|²`, `w̃ = 2.429372 = 1/|Ẽ|²`, `w w̃ = 0.4366 < 1`, `Re m = 0.2042 ≠ 0` | holds | none |
| §6.7 as `klDiv` | `ν = 2σ`; `δ₁`; `(1 + sin nθ)dθ/2π` | `2 − 1 − (1 − log 2) = 0.693147 = log 2`; `∞ ↦ −∞`; `klDiv = log 2 ≥ 0` | pinned object | R01 |
| §7.1 | round 5's rows | `|θ′(0.7)| = 2.2331505` both sides | holds | none |
| §8.1 sets | zeros `s − i/(2t)`, `s − 2i/t` | first in `Q(s, 1/t)` with `t Im = −1/2 ≥ −1`; second in `Q(s, 3/t)` with `t Im = −2 < −1` | Checks hold | none |
| §8.7 passage (1) → (2) | `p = 6`, `A = 0.7 + 0.3i` | `γ(p) sin(A + ip) = 0.869606 + 1.032425i`; `ie^{−iA} = 0.869603 + 1.032429i`; free case `e^{−itz} + i·i·e^{−itz} = 0` | holds | none |
| §9.1 formulas | `f = 0.8cos 3t + 0.3`, `t₁ = 0.7`, `t₂ = 1.9`, `z = 0.6 + 0.25i` | formula `a = 1.0260541 − 0.0202505i`, `b = −0.1523108 + 0.0518761i`; direct solve of `f(t₁ + ·)`: the same to `10⁻¹³`; `t₁ = 0` reduces to §4.1 | holds | none |
| §9.2 closed forms | README data, `α₁ = e^{0.4i}`, `α₂ = e^{−1.1i}` | `a = 0.2684837 + 0.9634883i`, `b = −0.0147884 − 0.0132132i` both ways; `|a|² − |b|² = 1.0000000000`; (2.2) `= 2i` | holds | none |
| §9.4 insertion | same `f`, `β = 0.37` | `E* = 1.6375364 − 1.0265894i = e^{−iβz}E(t₁)`, `Ẽ* = −0.6387801 − 0.6667419i = e^{−iβz}Ẽ(t₁)`; `υ* = Im θ₁ = υ`; `α₁*² e^{2is(t₁+β)} = α₁² e^{2ist₁}`, so the ratio picks up `e^{2iβs}` | holds | none |
| §9.5 expansion | algebra | `Δ₁ = Δ + 2CΔ²/S`, `Δ₂ = Δ + 4CΔ²/S`, difference `2CΔ²/S²`; `2cosh 1/sinh² 1 = 2.2346`, `8.305`, `0.572` | holds | none |
| §9.7 limits | `w = 0.7`, `w̃ = 0.9` | `conj β − β = 2i√(w w̃)`; `|a|² → 1.1349206 = (1/w + 1/w̃ + 2)/4`, `|b|² → 0.1349206` | holds | none |
| §9.8 headline | route | limit `(1/√w − iβ/√w̃)/(1/√w + iβ/√w̃)`, denominator of modulus² `1/w + 1/w̃ + 2 > 0`; `a(T, ·) ≈ −iα(…)/2 ≠ 0` on the disc, so `b/a` is holomorphic there for large `T`; `A² + C² = |E|²` bounded gives bounded eigenfunctions | holds | none |

**Headline theorems for the package stage** (no Lean file at this stage): the non-linear Carleson
theorem with its strong form (§9.8), the non-linear Plancherel identities (§4.4, §5.4), the Szegő
condition (§6.8), the Carathéodory theorems with a holomorphic parameter (§1.2, §1.6) and the
outer-multiplier theorem (§2.8).

## Not verifiable

- garnett2007 (paywalled, `uncertified`) and coddingtonlevinson1955, debranges1968, remling2018,
  krein1955 (waived): cited by locator only.
- The full §9 argument of poltoratski2024 version 14 between the sampled statements (§9.1, §9.4, §9.6,
  §9.8 this round; §9.3 in round 5): the "General case" continuity argument was read, not re-derived.
- Elaboration: not available (this lane does not elaborate; there is no `Suggested.lean` at the design
  stage).

## Source issues

- **Misprint** in mauth2022 at Corollary 6, printed p. 29 (line 1404–1406), and again in the proof of the main theorem, printed p. 74 (line 3857–3862): the source says the approximant of `E(t, z)` is a multiple of `e^{itz}`; it should be `e^{−itz}`, as the free case `E = e^{−itz}` shows; affects a stated result.
- **Misprint** in poltoratski2024 at §9, printed p. 39 (line 1518–1520): the source says `e*` makes a full turn as `β` ranges over an interval of length about `2π`; it should be length `π/|s|`, the period of `e^{2iβs}`; affects nothing.
