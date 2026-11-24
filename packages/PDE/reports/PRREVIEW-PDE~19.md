# Review of PDE (pull request #3027 at e47c8ec)

**Verdict:** accepted

**Summary.** A review of the change against `main`: 143 changed lines since `b8f3652`. The two added sections, §3.2a (upper semicontinuous subharmonic functions) and §3.4a (the Riesz representation on balls and Hartogs' lemma), were checked against Demailly's book at each of its eight locators, by computation on degenerate and sign-test cases in dimensions 1, 2 and 3, against their Tau Ceti and Mathlib suppliers at the pins, and against their two consumers. The one finding of the previous review is repaired and no finding remains: accepted, with one small correction (in untouched text, for a separate pull request) and no format note. Nothing is left for a human to decide.

## C01 — Untouched text: the Tau Ceti supplier contract of `TauCetiRoadmap/PDE/README.md` (section "From Tau Ceti", line 276) names a revision that is not the pin

The section says its names and line numbers are those of Tau Ceti `358314d`, while `lake-manifest.json` pins `2fd255d`, so a reader who opens a cited file at the pin can land on the wrong line or on nothing. Two names it cites, `TauCeti.sq_le_integral_Ioi_sq_add_deriv_sq` and `TauCeti.sq_le_integral_sq_add_deriv_sq` (line 339, and again in §1.6 at line 996), occur nowhere in the pinned Tau Ceti. The change does not touch or rely on this passage (the names the new sections cite all resolve at the pin), so this is for a separate pull request: name the pinned revision and refresh the names and line numbers against it.

## Previous findings

- R01 — repaired: the third Check of §3.4a (line 1717) now takes `v = Σ_m 2^{−m} log(|x − q_m|/2)` with `(q_m)` dense in the disc and `u_k = v/k`; recomputed: each term `≤ 0` on `D`, `∫_D log(2/|x − q|) dx ≤ π·log 2 + π/2 ≈ 3.75 ≤ 2π`, `u_k → 0` in `L¹(D)`, `u_k(q_m) = −∞ < 0` for all `k`, `m`.
- C01 — repaired: the *Needs:* line of §3.4a reads "`TauCeti.ballGreenKernel` for `n ≠ 2` (it vanishes identically for `n = 2`), `TauCeti.planarGreenKernelDisk` for `n = 2`".
- C02 — repaired: (a) is stated for "a connected open `Ω ⊇ B̄(a, R)` of `ℝⁿ`" with no restriction on `n`, and the first Check adds the case `n = 1`, `u = |x|`.
- C03 — repaired: the bullet of §3.2a cites "Theorem-Definition 4.12, d) ⇒ b) and e) ⇒ b)" and says "the ball form is the agreement with `TauCeti.SubharmonicOn`".
- C04 — repaired: the description says "PDE gains §3.2a … and §3.4a …; no section of PDE is removed or renumbered, and it gains no supplier."
- C05 — repaired: the other revision of PDE (mixed and Neumann boundary conditions) has merged and this head contains `main`; no open pull request changes PDE.
- C06 — not repaired; it lies in untouched text the change does not affect, and is C01 above.
- N01 — repaired: the Mathlib contract entry gives `Mathlib/Topology/Semicontinuity/Defs.lean:317`, `Mathlib/Data/EReal/Basic.lean:35`, `Mathlib/MeasureTheory/Function/LocallyIntegrable.lean:50`, each correct at the pin.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §3.2a mean of an upper semicontinuous `u` | `log|x|` on `|x| = 1/2`; the `0`/`−∞` step function on a small sphere centred at `e₁`; `n = 1` sphere `{1 ± r}` | `log(1/2)`; a set of positive measure at `−∞` gives `−∞`; `n = 1`: `(0 + (−∞))/2 = −∞`; sending `−∞` to `0` gives `0` | holds; the third Check separates the models | none |
| §3.2a definition, `≡ −∞` included | `u ≡ −∞`; `n = 1` | `−∞ ≤ −∞`; `n = 1` gives midpoint convexity; Demailly 4.17 allows `u ≡ −∞` | agrees with the source | none |
| §3.2a (a) | `log|x|` in `ℝ²`; `−1/|x|` in `ℝ³`; `0`/`−∞` on two disjoint balls | sphere means `log r`, ball `log r − ½`; `−1/r`, `−3/(2r)`; all increase in `r`, tend to `−∞ = u(0)`; disjoint case not `L¹_loc` | holds; connectedness needed | none |
| §3.2a (b) maximum principle | `|x|²` on the unit ball; `0`/`−1` on two disjoint balls; `u ≡ −∞` | supremum `1` not attained; disjoint case attains `0`, nonconstant; `−∞` constant | holds | none |
| §3.2a bullet (4.12 d), e) ⇒ b)) | Demailly 4.12 (source lines 1523–1541, 1577–1583); `TauCeti.SubharmonicOn` | d) is the ball form along `r_ν → 0`; the Tau Ceti field is `∃ᶠ r in 𝓝[>] 0, u x ≤ ⨍ ball x r` | bullet matches both | none |
| §3.4a (a) representation, `n = 2` | `log|x|`; `|x|²` | `0 − (2π)⁻¹log(1/|x|)·2π = log|x|`; `P = 1`, `μ = 4 dx`, potential `1 − |x|²`, gives `|x|²` | holds | none |
| §3.4a (a), `n = 1` | `|x|` on `(−1, 1)` | `G(x,0) = (1 − |x|)/2` (`−G″ = δ₀`, `G(±1) = 0`), `1 − 2·(1 − |x|)/2 = |x|`; without the `1/2`: `2|x| − 1` | holds | none |
| §3.4a (a) integrability of `u` on `∂B(a,R)` | monotone sphere means with finite ball means | sphere mean at `R` ≥ sphere mean at a.e. smaller radius `> −∞` | "integrable by §3.2a" holds | none |
| §3.4a mass bound | `log|x|`, `K = {0}`, radial `ψ` | `μ(K) = 2π = ∫ u Δψ = 2πψ(0)` | holds; Demailly 4.21 proof (lines 1690–1700) | none |
| §3.4a route of (a): `L¹` convergence of Green potentials | `∫_B G_{a,R}(x, y) dx` as `y → ∂B` | `(R² − |y − a|²)/(2n) → 0`, so `y ↦ 1_B(y)G(·, y)` is continuous into `L¹` | route step sound | none |
| §3.4a (b) Hartogs' lemma | `k·log|x|`; `(1/k)log|x|`; constants `0, −1, 0, −2, …`; all `u_k ≡ −∞` | `sup_{|x|≤ρ} = k log ρ → −∞`; `L¹` norm `∝ 1/k`, `u_k(0) = −∞ < 0`; zeros converge; `≡ −∞` is the first alternative | holds | none |
| §3.4a route of (b): lower bound of means | `u ≤ C` on `B(w, ρ)`, `u(w) ≥ −c′`, sub-ball `B′` | mean over `B′` ≥ `C − (|B_ρ|/|B′|)(C + c′)` | step sound | none |
| §3.4a third Check (previous R01) | dense poles, `u_k = v/k` | `‖v‖_{L¹(D)} ≤ Σ 2^{−m}·3.75 ≤ 2π`; `u_k(q_m) = −∞`, limit `0` | true; strict on a dense set | none |
| §3.4a locators (seeded sample) | Demailly 4.19, 4.21, 4.22 a) (source lines 1652–1725, pp. 35–37) | source has `G_r ≤ 0` and `u = ∫ΔuG_r + ∫uP_r`; here `G ≥ 0` and a minus sign | verified | none |
| §3.4a *Needs:* kernels | `newtonianKernel` at `n = 1, 2` | factor `(n(n − 2)|B₁|)⁻¹`: `−1/2` at `n = 1`, `0⁻¹ = 0` at `n = 2` | the line now sends `n = 2` to the planar kernel | none |

- Source locators checked against the text: 8, all in `demailly-agbook` Chapter I §4 (4.12 at line 1523, 4.13 at 1542, 4.14 at 1556, 4.17 at 1625, 4.18 at 1632, 4.19 at 1652, 4.21 at 1686, 4.22 a) at 1717).
- Library declarations opened at the pins: `TauCeti.SubharmonicOn` (`Analysis/InnerProductSpace/Harmonic/Subharmonic.lean:74`), `SubharmonicOn.le_of_le_sphere` (`:189`), `newtonianKernel` (`Analysis/PDE/FundamentalSolution/Euclidean/Basic.lean:57`), `ballGreenKernel` and `ballPoissonKernel` (`Analysis/PDE/GreenFunction/Ball.lean:266,360`), `ballPoissonIntegral` (`Analysis/PDE/PoissonIntegral/Ball.lean:142`), `planarGreenKernelDisk` (`Analysis/PDE/GreenFunction/Disk.lean:35`); Mathlib `UpperSemicontinuous`, `EReal`, `MeasureTheory.LocallyIntegrableOn` at the three lines the README gives.
- Cross-roadmap citations resolved: the change cites only PDE's own §§3.1, 3.2a and 3.4; its consumers at this head, ComplexComparisonPartII (C5.4a–C5.4j, C7) and SingularHermitianMetricsAndL2Methods (§§0.2, 0.3a), cite §3.2a, §3.4a (a) and (b) for what those sections state.
- Record of the README at the merge base: 9 layers, none removed or retitled; 0 headings removed, 2 added; the 4 deleted lines are each extended in place.
- Dependency check: `depcheck: 132 roadmaps, 1467 edges, 0 problem(s)`; no UPWARD or CYCLE line. Automatic checks: all passed. No file outside the roadmap folders the pull request owns is changed.
- Elaboration: `lake env lean TauCetiRoadmap/PDE/Suggested.lean` exits with 16 warnings, all `declaration uses sorry`. `Suggested.lean` is unchanged from the merge base, so the `#check @name` comparison and the one-tactic probe were not repeated.
- Headline theorems: §§3.2a and 3.4a are supporting results for consumers, not headlines of PDE; `Suggested.lean` rightly states neither (it would need an `EReal`-valued subharmonic carrier that the pins lack).
- The description's sentence on PDE was read against the head: two sections added, none removed or renumbered, no new supplier; it agrees.

Overlap check: read IncompressibleFluids, HamiltonJacobiAndConservationLaws, IncompressibleFlows, CompressibleEulerEquations, SchattenClassesAndSchurMultipliers (open) and ComplexHessianEquations, YangMillsConnectionsAndCaloricGauge, SobolevPolynomialApproximation (main); the list by results is empty; nothing shared. A search of all roadmaps for Hartogs' lemma and the Riesz measure of a subharmonic function finds PDE as the only owner; ComplexComparisonPartII and SingularHermitianMetricsAndL2Methods cite it.

Source independence: changed passages only; 11 passages (both statements, the routes of (a) and (b) in each section, the bullet, the Checks, the Examples sentence) compared with 1 source (`demailly-agbook` Ch. I §4), none shared beyond standard names; Hörmander could not be read; largest share of the README's locators Gilbarg–Trudinger, about 31 of some 170 author citations; contents not compared (no layer added, removed or reordered).

Research link: Layers 3–5 are the classical elliptic theory of Gilbarg–Trudinger (1983). The new §§3.2a and 3.4a supply the subharmonic-function input (Demailly's book, Ch. I §4; Hörmander 1990, Theorem 4.1.9) to the pluripotential theory of ComplexComparisonPartII. Rests on the README's overview and references and on `demailly-agbook`.

## Not verifiable

- Hörmander, *The Analysis of Linear Partial Differential Operators I*, Theorem 4.1.9 (§3.4a (b)): a Springer book with no legal open copy and no text in the sources cache, so the locator was not opened. The statement was checked by computation and its compactness half against Demailly 4.21.
- The seeded sample targets other than §3.4a (1.3, 1.4, 1.5, 1.6, 2.1, 2.2, 2.3, 3.1, 5.1, 5.2, 6.6, 6.8, 6.9, 7.3) lie in text the change neither touches nor affects, and are outside a review of the change.

## Source issues

- **Misprint** in demailly-agbook at Theorem 4.18, proof, p. 35 (line 1649): the source derives `u⋆ρ_ε ≥ u` from (4.19), a corollary stated after 4.18 and deduced from it; it should be formula (4.11) with the sub-mean-value inequality 4.12 b); affects nothing.

## For the human reviewers

- none
