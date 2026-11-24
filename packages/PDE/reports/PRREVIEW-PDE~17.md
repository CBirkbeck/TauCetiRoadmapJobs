# Review of PDE (pull request #3027 at 0b5086d)

**Verdict:** needs changes

**Summary.** A review of the change against `main`: 133 changed lines since `aecb53a`. The two new sections were checked against Demailly's book at every locator they give, by computation on degenerate and sign-test cases, against their Tau Ceti and Mathlib suppliers at the pins, and against their two consumers: §3.2a covers upper semicontinuous subharmonic functions and §3.4a the Riesz representation on balls and Hartogs' lemma. One finding blocks: the third Check of §3.4a uses a sequence that converges at every point as its witness that `L¹_loc` convergence does not give pointwise convergence. There are six small corrections, among them a supplier kernel that is identically zero in dimension two and no stated order with the conflicting open revision #1614, and one format note. Nothing is left for a human to decide.

## R01 (P2) — The third Check of §3.4a uses a sequence that converges pointwise everywhere as its witness that `L¹_loc` convergence does not give pointwise convergence

This Check is meant to show that the conclusion of (b), `limsup_j u_{k_j}(x) ≤ u(x)`, cannot be improved to convergence at every point. Its sequence satisfies the improved form, so the Check tests nothing and asserts something false about its own example. The text (README lines 1711–1712) reads: "`u_k(x) = (1/k)log|x − (1/k)e₁|` on `ℝ²` converges in `L¹_loc` to `0`, while `u_k((1/k)e₁) = −∞`: convergence in `L¹_loc` does not give pointwise convergence."

At `x = 0`, `u_k(0) = (1/k)·log(1/k) = −(log k)/k → 0`. At `x ≠ 0`, `|x − e₁/k| → |x| > 0`, so `u_k(x) → 0`. The value `−∞` falls on a fixed point `e₁/m` only for the single index `k = m`. So `u_k → 0 = u` at every point of `ℝ²`, and the inequality of (b) is an equality everywhere.

The smallest fix replaces the example with one where pointwise convergence fails. Take a dense sequence `(q_m)` in the unit disc and `v = Σ_m 2^{−m} log|x − q_m|`. Then `v` is subharmonic and locally integrable: it is a decreasing limit of subharmonic partial sums, and `∫_B |log|x − q|| dx` is bounded uniformly in `q`. So `u_k = v/k → 0` in `L¹_loc`, while `u_k(q_m) = −∞` for every `k` and `m`, and the inequality of (b) is strict on a dense set. Two other options: keep the sequence and say what it does show (it converges at every point, but not locally uniformly near `0`), or point to the second Check, where `(1/k)log|x|` already fails to converge at the fixed point `0`.

## C01 — §3.4a's *Needs:* line names `TauCeti.ballGreenKernel` for the Green function, which at the pin is identically zero in dimension two

An implementer of the case that the first Check and the consumers use (discs in `ℂ = ℝ²`, ComplexComparisonPartII's "Riesz representation on discs") would get a zero kernel, and the formula would read `u = P[u]`. At the pin, `TauCeti.newtonianKernel` carries the factor `(n(n − 2)|B₁|)⁻¹` (`TauCeti/Analysis/PDE/FundamentalSolution/Euclidean/Basic.lean:57`), and in Lean that factor is `0⁻¹ = 0` at `n = 2`. The module docstring of `TauCeti/Analysis/PDE/GreenFunction/Ball.lean` says so and sends the planar case to the logarithmic kernel. For `log|x|`, the zero kernel would give `0 ≠ log|x|`. The prose statement is right, since it says "the Dirichlet Green function", but the *Needs:* line (README line 1718) should add `TauCeti.planarGreenKernelDisk` (`TauCeti/Analysis/PDE/GreenFunction/Disk.lean:35`) for `n = 2`. The text this section replaces cited "Tau Ceti's planar kernels" at the same place. §3.4's own *Needs:* line, which this change does not touch, has the same gap.

## C02 — §3.4a (a) is stated for `n ≥ 2`, but (b) is stated for every `n` and its route uses (a)

For `n = 1`, the route of (b) ("Then (a) and the weak compactness of the measures …") cites a statement that excludes its dimension. The formula of (a) holds for `n = 1`, and so does Demailly's Proposition 4.22, which is stated in `ℝ^m`. At the pin, `TauCeti.ballGreenKernel 1 x y = ((1 − xy) − |x − y|)/2`, the Green kernel of the interval. For `u = |x|` on `(−1, 1)`: `μ_u = 2δ₀`, `P[u] = 1`, and the formula gives `1 − 2·(1 − |x|)/2 = |x|`. Either drop `n ≥ 2` from (a), or state (b) for `n ≥ 2` and say that `n = 1` is the case of convex functions.

## C03 — The bullet of §3.2a links `TauCeti.SubharmonicOn` to the sphere form of Demailly 4.12, but that predicate is the ball form

`TauCeti.SubharmonicOn` (`TauCeti/Analysis/InnerProductSpace/Harmonic/Subharmonic.lean:74`) asks for `u x ≤ ⨍ y in ball x r, u y` for arbitrarily small `r`. That is Demailly 4.12 d), not the sphere-mean condition e) that the bullet (README lines 1492–1494) cites. The agreement still holds, because d) ⇒ e) ⇒ b) in the source. Citing 4.12 d) ⇒ b) for the agreement would let a reader match the two definitions directly.

## C04 — The pull request's description does not mention the change to PDE

PDE is a roadmap on `main` with another open revision. A reader of the description cannot tell that it gains two sections, or that two other roadmaps now cite them. The aggregate count ("49 existing roadmaps receive 196 sections") covers it, but PDE is named nowhere. Text that would be right, in the "For reviewers" paragraph on the additions to general roadmaps: "PDE gains §3.2a (upper semicontinuous subharmonic functions: local integrability, monotone means, the maximum principle) and §3.4a (the Riesz representation on balls and Hartogs' lemma), with no section removed or renumbered and no new supplier; SingularHermitianMetricsAndL2Methods (§§0.2, 0.3a) and ComplexComparisonPartII (Layers C5 and C7) now cite them."

## C05 — This revision of PDE conflicts with the open revision #1614 (mixed and Neumann boundary conditions), and no order is stated

A three-way merge of the two heads over `main` conflicts in two places. One is the ownership paragraph of the scope, where both insert clauses (lines 26–44 here). The other is the paragraph that guides the reader through the build (lines 663–673 here). One of the two pull requests has to be rebased on the other before either merges. The PDE part of this pull request is three clauses and two self-contained sections, so the lighter path would be to rebase it on #1614. Whichever order is chosen would go in the description.

## C06 — Untouched text: the Tau Ceti supplier contract names a revision that is not the pin

The section "From Tau Ceti" (README line 274) says its names and line numbers are those of Tau Ceti `358314d`, but the manifest pins `2fd255d`. At the pin, some cited names are absent: `TauCeti.sq_le_integral_Ioi_sq_add_deriv_sq` and `TauCeti.sq_le_integral_sq_add_deriv_sq` (line 337) are not in `Analysis/Sobolev/Trace/Estimate.lean`. Some line numbers have also moved: `ballGreenKernel` is at `GreenFunction/Ball.lean:266`, not `:273`, and `ballPoissonKernel` is at `:360`, not `:365`. This is for a separate pull request.

## N01 — The new Mathlib contract entry (README lines 230–231) gives no file locators, unlike its neighbours

It could read: `UpperSemicontinuous` (`Mathlib/Topology/Semicontinuity/Defs.lean:317`), `EReal` (`Mathlib/Data/EReal/Basic.lean:35`), `MeasureTheory.LocallyIntegrableOn` (`Mathlib/MeasureTheory/Function/LocallyIntegrable.lean:50`).

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §3.2a mean of an upper semicontinuous `u` (infimum of continuous majorants, `∫u⁺ − ∫u⁻` or `−∞`) | `log|x|` on the circle `r = 1/2`; the `0`/`−∞` step function, small sphere centred at `e₁` | `log(1/2) ≈ −0.693`; half the sphere at `−∞` gives mean `−∞`; the model sending `−∞` to `0` gives `0` | holds; its Check separates the two models | none |
| §3.2a definition, `≡ −∞` included | `u ≡ −∞`; Demailly 4.12 b), 4.17 | `−∞ ≤ −∞`; 4.17 reads "u ≡ −∞ or u ∈ L¹_loc", so `−∞ ∈ Sh(Ω)` | agrees with the source | none |
| §3.2a (a): `L¹_loc`, null `−∞` set, monotone means tending to `u(x)` | `log|x|` in `ℝ²`; `−|x|⁻¹` in `ℝ³`; disjoint balls with `0`/`−∞` | sphere `log r`, ball `log r − ½`; sphere `−1/r`, ball `−3/(2r)`; all increase to `−∞ = u(0)`; disjoint case not `L¹_loc` | holds; connectedness needed | none |
| §3.2a (b) maximum principle | `|x|²` on `B(0,1)`; disjoint balls with `0`/`−1` | supremum `1` not attained; disjoint case attains `0`, nonconstant | holds; connectedness needed | none |
| §3.2a bullet: local sphere sub-mean along `r_ν → 0` implies subharmonic | Demailly 4.12 e) ⇒ a) proof (lines 1577–1583); `SubharmonicOn` at `Subharmonic.lean:74` | the source's proof is the e) ⇒ a) comparison; Tau Ceti uses ball averages, which is 4.12 d) | true; locator imprecise | C03 |
| §3.4a (a) positive Riesz measure and representation | `log|x|` on the unit disc; `|x|²` on the unit disc; reversed sign | `P = 0`, `G(x,0) = (2π)⁻¹log(1/|x|)`, `μ = 2πδ₀` give `log|x|`; `Δ = 4`, `P = 1`, potential `1 − |x|²` give `|x|²`; reversed sign gives `2` at `0` | holds | none |
| §3.4a (a) with the cited Tau Ceti kernel, `n = 2` | `newtonianKernel 2`, hence `ballGreenKernel 2` | factor `(2·0·π)⁻¹ = 0`, kernel `≡ 0`; the formula would give `log|x| = 0` | supplier pointer wrong for `n = 2` | C01 |
| §3.4a (a) at `n = 1` | `u = |x|` on `(−1,1)`; `ballGreenKernel 1` | `G(x,0) = (1 − |x|)/2`, `μ = 2δ₀`, `P[u] = 1`, gives `|x|` | holds; (b)'s route needs it | C02 |
| §3.4a mass bound `μ_u(K) ≤ ∫ u Δψ ≤ ‖Δψ‖_∞‖u‖_{L¹(supp ψ)}` | `log|x|`, `K = {0}`, radial `ψ` | `μ(K) = 2π`, `∫ u Δψ = 2πψ(0) = 2π`, an equality | holds; matches 4.21 proof (lines 1690–1700) | none |
| §3.4a (b) Hartogs dichotomy and `limsup` | `k log|x|`; `(1/k)log|x|`; constants `0, −1, 0, −2, …` | `sup_{|x|≤ρ} = k log ρ → −∞`; `L¹` norm `∝ 1/k → 0`, `u_k(0) = −∞ < 0`; the zero subsequence converges | holds | none |
| §3.4a third Check | `u_k = (1/k)log|x − e₁/k|` at `0`, at `x ≠ 0`, at `e₁/m` | `−(log k)/k → 0`; `→ 0`; `−∞` only when `k = m` | pointwise limit `0` everywhere; Check false as a witness | R01 |
| Sample 3.2a locators | Demailly 4.12, 4.13, 4.14, 4.17, 4.18 (lines 1523–1651, pp. 33–35) | each statement holds at the generality restated; conventions agree | verified | none |
| §3.4a locators | Demailly 4.19, 4.21, 4.22 a) (lines 1652–1725, pp. 35–37) | Green kernel `≤ 0` there, `≥ 0` here: the formula's sign is converted correctly | verified | none |
| §3.1 as cited (Weyl's lemma, mean values) | README line 1323; the pinned mean-value declarations | Weyl's lemma is a target there; the mean-value property is pinned | resolves | none |

- Source locators checked against the text: 8 (Demailly, *Complex Analytic and Differential Geometry*, version of 21 June 2012, read from the author's page, Ch. I §4, items 4.12, 4.13, 4.14, 4.17, 4.18, 4.19, 4.21, 4.22 a)); Hörmander's Theorem 4.1.9 is not readable.
- Library declarations opened at the pins: `TauCeti.SubharmonicOn` (`Analysis/InnerProductSpace/Harmonic/Subharmonic.lean:74`), `SubharmonicOn.le_of_le_sphere` (`:189`), `newtonianKernel` (`Analysis/PDE/FundamentalSolution/Euclidean/Basic.lean:57`), `ballGreenKernel`, `ballGreenKernel_pos` (`n ≠ 2`), `ballPoissonKernel` (`Analysis/PDE/GreenFunction/Ball.lean:266,321,360`), `ballPoissonIntegral` (`Analysis/PDE/PoissonIntegral/Ball.lean:142`), `planarGreenKernelDisk` (`Analysis/PDE/GreenFunction/Disk.lean:35`); Mathlib `UpperSemicontinuous`, `EReal`, `MeasureTheory.LocallyIntegrableOn` (lines in N01). The pinned Mathlib has no subharmonic-function carrier, and Tau Ceti only the continuous one.
- Cross-roadmap citations resolved: the change cites only PDE §3.1 and §3.4. Its consumers at this head are ComplexComparisonPartII (13 citations of §§3.2a, 3.4a) and SingularHermitianMetricsAndL2Methods (§§0.2, 0.3a and its contract). None of the ids the change cites is dropped by an open pull request.
- Record of the README at the merge base: all 9 layer ids and titles are kept. The 4 deleted lines are each extended in place, so no item is removed.
- Automatic checks: all passed. Dependency check: `depcheck: 132 roadmaps, 1467 edges, 0 problem(s)`. PDE cites none of its new consumers, so supply runs one way.
- Elaboration: `lake env lean TauCetiRoadmap/PDE/Suggested.lean` exits 0 in 12 s with 16 warnings, all `declaration uses sorry`. The change touches no Lean declaration, so neither the `#check @name` comparison nor the one-tactic probe was repeated.
- Overlap simulation: a three-way merge of this head and #1614 over `main` leaves 2 conflict hunks (C05).
- Headline theorems: §§3.2a and 3.4a are supporting results for consumers, not headlines of PDE (whose end theorems are the three pillars of the Dirichlet problem). `Suggested.lean` is unchanged and correctly omits them.

Overlap check: read IncompressibleFluids, HamiltonJacobiAndConservationLaws, IncompressibleFlows, CompressibleEulerEquations and SchattenClassesAndSchurMultipliers (open), and ComplexHessianEquations, YangMillsConnectionsAndCaloricGauge and SobolevPolynomialApproximation (main); the results list is empty. ComplexHessianEquations §7.1 owns the Green representation of `C²` functions on planar discs, which §3.4a does not restate (its route takes the smooth formula from §3.4). PDE alone owns the upper semicontinuous subharmonic functions, their Riesz measures on balls and Hartogs' lemma: ComplexComparisonPartII and SingularHermitianMetricsAndL2Methods cite them, and ArithmeticDynamics §2.4 assumes Radon Riesz measures without proving them.

Source independence: changed passages only, 11 passages (both statements, the routes of (a) and (b) in each section, the bullet, the Checks, the Examples sentence) compared with 1 source (Demailly Ch. I §4); the longest shared run is 5 common words ("on the sphere and on"); Hörmander could not be read; largest share of the README's locators Gilbarg–Trudinger, about 30 of some 170 author citations; contents not compared (no layer added, removed or reordered).

Research link: Layers 3–5 are the classical elliptic theory of Gilbarg–Trudinger (1983) on which current regularity theory builds. The new §§3.2a and 3.4a supply the subharmonic-function input (Demailly's book, Ch. I §4; Hörmander's Theorem 4.1.9) to the pluripotential theory of ComplexComparisonPartII. Both points rest on the README's overview and references.

## Not verifiable

- Hörmander, *The Analysis of Linear Partial Differential Operators I*, Theorem 4.1.9 (§3.4a (b)): Springer, with no legal open copy, so the locator was not checked. The statement was checked by computation, and its compactness half against Demailly 4.21.
- The other seeded sample targets (1.4, 1.6, 1.7, 2.2, 2.4, 5.1, 6.1, 6.2, 6.8, 7.3, 8.1, 8.2, 8.3) lie in text that the change neither touches nor affects, so they are outside a review of the change.

## Source issues

- **Misprint** in demailly-cadg at Theorem 4.18, proof, p. 35 (line 1649): the source derives `u⋆ρ_ε ≥ u` from (4.19), a corollary proved after 4.18 from 4.18 itself; it should cite (4.11) with 4.12 b); affects nothing.

## For the human reviewers

- none
