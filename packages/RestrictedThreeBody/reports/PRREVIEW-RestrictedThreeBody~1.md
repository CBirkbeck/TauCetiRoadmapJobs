# Review of RestrictedThreeBody (pull request #151 at cc5f962)

**Verdict:** needs changes

The roadmap's mathematics is sound where it is stated: the rotating-frame Hamiltonian, its sign conventions, the Delaunay normalization, the frequency map, the Fourier mechanism of the homological equations and the classical normalization all recompute correctly, and its warning about the Delaunay normalization of the fixed-mass Yagasaki paper is right. The blocking findings are about ownership and about the acceptance test: the summit theorem is statable at the pins but absent, its domain hypothesis is under-specified in a way that makes the stated form false, and two lanes re-plan work that `HamiltonianSystems` (an open roadmap pull request) and `SymplecticGeometry/IntegrableSystems` (on main) already own. The gate fails on a missing `metadata.toml`.

## R01 (P2) — The summit is statable at the pins but `Suggested.lean` states nothing

**Location.** `TauCetiRoadmap/RestrictedThreeBody/Suggested.lean` lines 11–14: "this file does not invent placeholder predicates for jointly analytic parameter families, analytic torus Fourier series, Delaunay coordinate charts, or the final theorem"; `README.md` lines 114–116.

**Claim.** The final theorem cannot be stated without placeholder definitions.

**Witness.** No Delaunay chart or torus Fourier series is needed to *state* Poincaré's theorem: it is a statement about a function on an open subset of ℝ⁴. Every carrier exists at the pin: `AnalyticOnNhd` (`Mathlib/Analysis/Analytic/Basic.lean:118`), `fderiv ℝ`, `Set.Ioo`, `Set.prod`. The following statement elaborates on a scratch copy against Mathlib `9caeba1` with `sorry` as the only warning (the `#check` output is reproduced in *Verified sound*); all seven definitions have real bodies:

```lean
abbrev Phase := ℝ × ℝ × ℝ × ℝ          -- (x, y, pₓ, pᵧ)

noncomputable def planarHamiltonian (μ : ℝ) (s : Phase) : ℝ :=
  (s.2.2.1 ^ 2 + s.2.2.2 ^ 2) / 2 + (s.2.2.1 * s.2.1 - s.2.2.2 * s.1) - planarPotential μ s.1 s.2.1

/-- `{F, G} = F_x G_pₓ − F_pₓ G_x + F_y G_pᵧ − F_pᵧ G_y`, the bracket of `ω = dx∧dpₓ + dy∧dpᵧ`. -/
noncomputable def poissonBracket (F G : Phase → ℝ) (s : Phase) : ℝ :=
  let dF := fderiv ℝ F s
  let dG := fderiv ℝ G s
  dF (1, 0, 0, 0) * dG (0, 0, 1, 0) - dF (0, 0, 1, 0) * dG (1, 0, 0, 0) +
    dF (0, 1, 0, 0) * dG (0, 0, 0, 1) - dF (0, 0, 0, 1) * dG (0, 1, 0, 0)

noncomputable def keplerEnergy (s : Phase) : ℝ :=
  (s.2.2.1 ^ 2 + s.2.2.2 ^ 2) / 2 - 1 / Real.sqrt (s.1 ^ 2 + s.2.1 ^ 2)
def angularMomentum (s : Phase) : ℝ := s.1 * s.2.2.2 - s.2.1 * s.2.2.1
noncomputable def semiMajorAxis (s : Phase) : ℝ := -1 / (2 * keplerEnergy s)
noncomputable def eccentricity (s : Phase) : ℝ :=
  Real.sqrt (1 + 2 * keplerEnergy s * angularMomentum s ^ 2)

/-- Noncircular, non-collision Kepler ellipses whose annulus `a(1−e) ≤ r ≤ a(1+e)` avoids both
primaries for every `|μ| < δ`; a union of complete invariant tori of the `μ = 0` flow. -/
def innerEllipticDomain (δ : ℝ) : Set Phase :=
  {s | keplerEnergy s < 0 ∧ angularMomentum s ≠ 0 ∧ 0 < eccentricity s ∧
    δ < semiMajorAxis s * (1 - eccentricity s) ∧
    semiMajorAxis s * (1 + eccentricity s) < 1 - δ}

theorem poincare_planar_crtbp (δ : ℝ) (hδ : 0 < δ) (F : ℝ → Phase → ℝ)
    (hF : AnalyticOnNhd ℝ (fun p : ℝ × Phase => F p.1 p.2)
      (Set.Ioo (-δ) δ ×ˢ innerEllipticDomain δ))
    (hint : ∀ μ ∈ Set.Ioo (-δ) δ, ∀ s ∈ innerEllipticDomain δ,
      poissonBracket (planarHamiltonian μ) (F μ) s = 0) :
    ∀ μ ∈ Set.Ioo (-δ) δ, ∀ s ∈ innerEllipticDomain δ,
      ∃ a b : ℝ, (a, b) ≠ (0, 0) ∧
        a • fderiv ℝ (F μ) s + b • fderiv ℝ (planarHamiltonian μ) s = 0 := by
  sorry
```

This is Poincaré's theorem in the form of Whittaker §165 (ii) (`whittaker1937` lines 16489–16504) and Poincaré §81 (`poincare1892vol1` lines 8092–8110): a one-valued integral, analytic in the state and in `μ`, periodic in the angles, on a domain of actions "as small as we please", is a function of `H`. The conclusion "the differentials are collinear at every point" is the Jacobian conclusion of Whittaker (vi) (lines 16678–16682). The outer family (`1 + δ < a(1 − e)`) is the second component and can be a second theorem or a disjunction in the domain predicate.

**Repair.** Add these definitions and this theorem to `Suggested.lean` (it is the acceptance test; the roadmap is judged against it), and rewrite the module docstring accordingly. Replace `PlanarState` by the product carrier: a `structure` with four real fields is not a normed space, so neither `fderiv` nor `AnalyticOnNhd` can be stated on it, and its docstring already defers "equivalence with the standard four-dimensional real vector space" to a later API. State the README's item 21 in exactly this form (domain, interval, analyticity, bracket, conclusion).

## R02 (P2) — The summit's domain hypothesis is under-specified; as described, the statement is false

**Location.** `README.md` lines 218–221: "the fixed collision-free elliptic phase domain, angle uniformity, and functional independence"; lines 38–41: "on a fixed phase domain times an interval about `μ = 0`"; lines 3–7.

**Claim.** The theorem holds on a fixed collision-free elliptic phase domain.

**Witness.** On an arbitrary open subset `U` of the elliptic region the statement is false. Take any `s₀` with `X_{H₀}(s₀) ≠ 0` (every point of the elliptic region). The flow-box theorem, with analytic dependence of the flow on `(state, μ)`, gives an analytic chart `(t, c₁, c₂, c₃)` on a neighbourhood `U` of `s₀`, for all small `μ`, in which `X_{H_μ} = ∂/∂t`; the coordinate `c₁` is a first integral on `U`, jointly analytic in `(state, μ)`, and functionally independent of `H_μ`. Whittaker makes the point explicitly: the theorem concerns integrals "uniform with respect to the Keplerian variables", which "does not exclude the existence of integrals which are uniform in domains of a different character" (`whittaker1937` lines 16703–16707). Both sources require the integral for *all real values* of the two angles (Poincaré, `poincare1892vol1` lines 8096–8100; Whittaker lines 16490–16494), i.e. the domain is an action domain times the full torus, and the hypothesis is used in milestone 13 (Fourier expansion in the angles). "Angle uniformity" in item 21 does not say this, and lines 38–41 say the opposite ("a fixed phase domain").

A second omission: the domain must avoid both primaries for *every* `μ` in the interval. With `δ = 0.3`, an inner ellipse with `a(1 + e) = 0.8` is collision-free at `μ = 0` but the primary at `(1 − μ, 0) = (0.7, 0)` lies inside its annulus, so `H_μ` is not analytic on the domain. Item 9 asks for this uniformity for `U`; item 21 drops it.

**Repair.** In Scope, Conventions and item 21: the phase domain is `D_δ = {E < 0, 0 < e < 1, δ < a(1 − e), a(1 + e) < 1 − δ}` (or its outer analogue `1 + δ < a(1 − e)`), a union of complete `μ = 0` invariant tori, and the integral is assumed analytic on `(−δ, δ) × D_δ`. Add the flow-box local integral as a negative-control Check on item 21. The statement of R01 incorporates both.

## R03 (P2) — Lane A1 re-plans `HamiltonianSystems`

**Location.** `README.md` lines 122–133 (A1 items 1–3): "define the standard symplectic form, Hamiltonian vector field, coordinate Poisson bracket, and first-integral predicate … Prove Hamilton's equations, bilinearity/antisymmetry/Jacobi … Define canonical changes of variables on named open sets and prove transport".

**Claim.** This roadmap builds flat canonical Hamiltonian mechanics.

**Witness.** The open roadmap `HamiltonianSystems` (a new roadmap folder by another author) owns exactly these objects: Layer 1 "Hamiltonian vector fields and the Poisson bracket" (`poissonBracket`, bilinearity, Jacobi, `X_{{F,G}} = −[X_F, X_G]`), Layer 2 "dynamics" (conservation along integral curves, first integrals as `{F, H} = 0`, canonical transformations between open subsets transporting Hamiltonians, brackets, integral curves and first integrals, and the canonical model on `(Fin n → ℝ) × (Fin n → ℝ)` and `Fin (2 * n) → ℝ` with Hamilton's equations in coordinates). Its *Relation to sibling roadmaps* section names this roadmap and assigns A1's list to its own Layer 2 item *Canonical coordinates*, leaving to this roadmap only "real-analytic Hamiltonians and first integrals on a domain, and functional independence of first integrals with its transport under canonical transformations". `SymplecticGeometry` on main (*Dependencies and single ownership*) likewise records `HamiltonianSystems` as the owner of `poissonBracket`, `IsSymplecticMap`, conservation and symplectic flows. Tau Ceti already has `SymplecticForm`, `cotangentSymplecticForm` and `stdSymplecticForm` (checked at the content checkout's Tau Ceti pin `a91d3aa`, `TauCeti/Geometry/Symplectic/AlmostComplex.lean:343`, `Cotangent/Basic.lean:80`, `StandardCompatible.lean:83`; this pull request's own manifest pins no Tau Ceti at all, see *Not verifiable*).

**Repair.** Delete A1 items 1–3 as targets. Add `## Exact supplier contracts` with a `From TauCetiRoadmap.HamiltonianSystems` subsection consuming Layer 1 (Hamiltonian vector field, Poisson bracket and its laws) and Layer 2 (conservation, first integrals, canonical coordinates on `Fin (2 * n) → ℝ`, canonical transformations between open subsets), in that roadmap's conventions, which are this roadmap's. Keep as this roadmap's own targets only: the analytic first-integral family on a domain, functional independence, and transport of independence under a canonical transformation. The "Suggested homes" bullet `TauCeti/Dynamics/Hamiltonian/` goes with it.

## R04 (P2) — Lane B1 item 7 and B2 items 10–11 re-plan `SymplecticGeometry/IntegrableSystems`

**Location.** `README.md` lines 154–156 ("Build the planar Kepler Hamiltonian … Prove conservation of energy and angular momentum and the elliptic-orbit relations"), 166–170 ("Construct `(L,G,ℓ,g)` … Prove the inverse formulas, local canonicality, `2π` periods … `HKepler = -α²/(2L²)`"), 169–170 (frequency map).

**Claim.** Kepler, its elliptic-orbit relations and its action normalization are built here.

**Witness.** `SymplecticGeometry/IntegrableSystems` on main, §I4 (its Kepler bullet): planar central force with polar canonical coordinates `(r, θ, p_r, L)`, `{H, L} = 0`, Kepler with Runge–Lenz, eccentricity `e = √(1 + 2Eℓ²/(mκ²))`, orbit equation and collision domain, "elliptic bounded noncollision invariant tori", radial action `I_r = κ√(m/(−2E)) − |ℓ|`, `H = −mκ²/(2(I_r + |I_θ|)²)`, period `2π√(m/κ) a^{3/2}` and frequencies `Ω_r = mκ²/(I_r + |I_θ|)³`, `Ω_θ = sgn(I_θ) Ω_r`. With `m = κ = 1`, `I_r + |I_θ| = L` and `I_θ = G`: these are items 7, 10 (except the explicit angles) and 11. §I2 owns local action-angle coordinates (Liouville–Arnold) and §I2.0 the period-`2π` circle charts.

**Repair.** Cite `SymplecticGeometry/IntegrableSystems §I4` for the Kepler Hamiltonian, conservation, eccentricity, the elliptic noncollision tori, `L`, `G`, `H_Kepler = −α²/(2L²)` and the frequencies, and §I2/§I2.0 for action-angle charts and `2π`-periodic angles. Keep as this roadmap's own target only the explicit Delaunay chart `(L, G, ℓ, g)` (mean anomaly and argument of perihelion as analytic functions of the state, inverse formulas, analyticity on the noncircular locus), saying in one clause that it differs from I2's abstract chart by fixing the angles explicitly. Item 8 (rotating frame) and item 9 (uniform domain) stay.

## R05 (P3) — Gate failure: `metadata.toml` missing

**Location.** `TauCetiRoadmap/RestrictedThreeBody/` has only `README.md` and `Suggested.lean`; gate line `metadata=1 … FAIL`.

**Witness.** All 132 roadmap folders on main carry `metadata.toml` with one line `topic = "math.XX"` (e.g. `TauCetiRoadmap/EllipticIntegrals/metadata.toml`: `topic = "math.CA"`).

**Repair.** Add `TauCetiRoadmap/RestrictedThreeBody/metadata.toml` with `topic = "math.DS"`. No acceptance while the gate fails.

## R06 (P3) — Both sorried theorems are padding

**Location.** `Suggested.lean` lines 46–54: `planarPotential_zero`, `planarPotential_primaryExchange`.

**Witness.** On a scratch copy at the pin, `planarPotential_zero` closes with `simp [planarPotential]` and `planarPotential_primaryExchange` with `simp only [planarPotential]; ring_nf` (one tactic each, no errors). Both are convention checks that compute a value; the second's docstring says so ("This is a convention check").

**Repair.** Delete both from `Suggested.lean`; the README keeps them as Checks of the potential (they are good ones: see the table).

## R07 (P3) — Library objects planned instead of cited

**Location.** `README.md` lines 95–97 ("must be audited at implementation time before introducing a new torus Fourier API"), 106–107 ("analytic Fourier series on a finite-dimensional torus, including uniqueness"), 98–99, 137–140.

**Witness.** At Mathlib `9caeba1`, `Mathlib/Analysis/Fourier/AddCircleMulti.lean` has `UnitAddTorus.mFourier` (line 49), `mFourierCoeff` (246), the Hilbert basis `mFourierBasis` (265) with `mFourierBasis_repr` (275) and `hasSum_mFourier_series_L2` (285), and `hasSum_mFourier_series_of_summable` (319), i.e. the multivariate Fourier series, L² uniqueness and uniform convergence under summable coefficients, on the period-1 torus. Joint analyticity is `AnalyticOnNhd ℝ` on a product set (R01). What is genuinely missing is the analytic class (exponential decay of coefficients, termwise differentiation in angles and actions) and the period-`2π` rescaling.

**Repair.** An `## Exact supplier contracts` section with `From Mathlib` naming these declarations and `AnalyticOnNhd`, `HasFPowerSeriesOnBall`, `ODE_solution_unique`, and `From Tau Ceti` naming `SymplecticForm` and its cotangent models; A2 items 5–6 then plan only the analytic additions. "Audited at implementation time" is a deferral: resolve it now.

## R08 (P3) — Shape and policy

**Location.** Whole `README.md`.

**Witness.** No `*Needs:*` line, no `**Checks.**` bullet, no `### Dependencies` or `### Examples`, no `## Scope and ownership`, `## Exact supplier contracts`, `## How to read the build` or `## Downstream consumers` (0 of each; the gate's text scanners do not check these). Process narrative: "Suggested homes" (22–29), "the repository pin when this roadmap was written" with a hard-coded Mathlib commit (86–88; main has since moved its pin), "Add theorem signatures … only when" (114–116), "The previously proposed route contained an invalid bridge" (261), "mergeable roadmap" (280), "Seek expert review" (252), "repeat the Mathlib, Tau Ceti pull-request, and Lean Zulip searches" (305–306). The *Future direction* section (257–280) is a deferral with a research discussion; its mathematical point (pullback under `p_x = p_ξ/ε` need not preserve meromorphy at `ε = 0`, witnessed by `exp(F)`) is correct but belongs to a one-sentence exclusion.

**Repair.** Restructure in the house shape: Scope and ownership (with the fixed-mass theorem, the spatial problem and differential Galois theory as named exclusions in one sentence each), Conventions, Exact supplier contracts (R03, R04, R07), How to read the build, Layers with `### k.n` prose, each definition with API bullets and at least three Checks, each theorem with hypotheses and a locator and a `*Needs:*` line, `### Examples`/`### Dependencies` per layer, Downstream consumers, References. Delete the process sentences and the commit hash.

## R09 (P3) — Locators

**Location.** `README.md` lines 284–301, 213–217.

**Witness.** Poincaré is cited by title only, with "must be pinned to exact volume/sections during milestone 20" (a deferral). The locators are: *Méthodes nouvelles* I, Chapter V "Non-existence des intégrales uniformes", §81 (hypotheses and the expansion, printed pp. 233–234, `poincare1892vol1` lines 8079–8124), §82–§83 (the Poincaré-set argument and the degenerate-Hessian case), §86 "Application au problème des trois Corps" (the restricted problem with `x₁ = L, x₂ = G`, printed pp. 250–251, lines 8646–8668), and *Acta Math.* 13 (1890) p. 259. Whittaker §165 is Chapter XIV, pp. 380–385 in the 2nd edition (1917), which is the edition I could read; the README cites the 4th (1937) without pages. Arnold, *MMCM*, and Meyer–Hall–Offin are cited without chapter, and neither proves Poincaré's nonexistence theorem; the standard modern treatment is Arnold–Kozlov–Neishtadt, *Mathematical Aspects of Classical and Celestial Mechanics*, Ch. 6 §1 (Poincaré's theorem and the Poincaré set), or Kozlov, *Symmetries, Topology and Resonances in Hamiltonian Mechanics*, Ch. IV §1. Yagasaki's fixed-mass paper is cited by an arXiv HTML link (line 69, 259) rather than by id/DOI.

**Repair.** Pin each cited claim to these locators; cite Lane C's abstract theorem to Arnold–Kozlov–Neishtadt or Kozlov; cite the fixed-mass paper as arXiv:2106.04925 (and its journal version if any); record every source in `sources.toml`.

## Verified sound

**Gate and dependency check.** The worker's gate: every scanner 0 except `metadata=1` (R05). Dependency check output:

```
depcheck: 156 roadmaps, 1060 edges, 0 problem(s)
```

No UPWARD or CYCLE line. The README cites no roadmap, so the check is trivially clean; the merge order lists `RestrictedThreeBody` last (line 353). `HamiltonianSystems` (R03) is an open new-folder pull request not yet in the order; citing it is permitted and places this roadmap after it. The three-dot diff against the merge base shows no change outside `TauCetiRoadmap/RestrictedThreeBody/` (the branch is based on `e1bd0a9`; main has moved on since, including its library pins, which is not a finding).

**Elaboration.** `lake env lean` on a copy of `Suggested.lean`: two `declaration uses sorry` warnings and nothing else. `#check @planarPotential`, `@planarHamiltonian`, `@PlanarState` give `ℝ → ℝ → ℝ → ℝ`, `ℝ → PlanarState → ℝ`, `Type`, matching the README's formulas; no section binders exist to be lost. One-tactic probe: both theorems close (R06). The candidate summit of R01 elaborates; its `#check`:

```
poincare_planar_crtbp : ∀ (δ : ℝ), 0 < δ → ∀ (F : ℝ → Phase → ℝ),
  AnalyticOnNhd ℝ (fun p => F p.1 p.2) (Set.Ioo (-δ) δ ×ˢ innerEllipticDomain δ) →
  (∀ μ ∈ Set.Ioo (-δ) δ, ∀ s ∈ innerEllipticDomain δ,
      poissonBracket (planarHamiltonian μ) (F μ) s = 0) →
  ∀ μ ∈ Set.Ioo (-δ) δ, ∀ s ∈ innerEllipticDomain δ,
    ∃ a b, (a, b) ≠ (0, 0) ∧ a • fderiv ℝ (F μ) s + b • fderiv ℝ (planarHamiltonian μ) s = 0
```

**Library declarations opened at Mathlib `9caeba1`.** `AnalyticOnNhd`, `AnalyticOn` (`Mathlib/Analysis/Analytic/Basic.lean:118,123`); `HasFPowerSeriesOnBall`; `ODE_solution_unique` (`Mathlib/Analysis/ODE/ExistUnique.lean`, as the README says); `ContDiffOn`; `VectorField.lieBracket` (`Mathlib/Analysis/Calculus/VectorField.lean`); the torus Fourier declarations listed in R07; `Matrix.SymplecticGroup` does not exist under that name (the file is `Mathlib/LinearAlgebra/SymplecticGroup.lean`); no Hamiltonian or Poisson-bracket declaration exists in Mathlib at the pin (grep). Tau Ceti: see *Not verifiable*.

**Sources read.** `yagasaki2025newproof` (arXiv:2111.11031v2): Theorem 1.1 (line 65) states Poincaré's result for (1.1)/(1.2): no real-analytic first integral independent of the Hamiltonian depending real-analytically on `μ` near `μ = 0`; its equations (1.1) and `H₂` (lines 23–30) are the README's conventions exactly; its Delaunay frequency `ω₁ = 1/I₁³` (line 361) and angle period `2π` (α = 1) agree with the README. `yagasaki2024restricted` (arXiv:2106.04925v7) §3, lines 643–690 and 751–781: checked the README's warning (table row 8). `whittaker1937` (2nd ed. 1917) §165 (i)–(vii), lines 16455–16707: hypotheses (ii), the Hessian trick (i), the class/density condition (vi), the Jacobian conclusion, the closing remark on domains. `poincare1892vol1` §81 (lines 8079–8124) and §86 (lines 8646–8668): hypotheses "pour toutes les valeurs réelles des y, … valeurs suffisamment petites de μ, … domaine D … aussi petit qu'on le veut"; the restricted problem with `x₁ = L, x₂ = G`, `F₀` with zero Hessian handled by the device of n° 43. Seeded sample: Gate A (coefficient extraction at orders `μ⁰`, `μ¹`) is Poincaré §81 equations (2)–(3), lines 8115–8122; Gate B (canonical Delaunay chart, `2π` periods, analytic family) is the standard normalization, recomputed in rows 6–8; Gate C (abstract theorem with density/rank hypotheses) is Whittaker (v)–(vi) and Poincaré §82–§83; Gate D (the summit) is Whittaker (vii)/Poincaré §86 and Yagasaki Theorem 1.1, with the domain qualification of R02. Both classical sources leave the coefficient nonvanishing to "the well-known expansion" (see *Source issues*), which the README's items 19–20 correctly treat as the bottleneck.

**Cross-roadmap resolution.** `HamiltonianSystems` read at its open head (via the roadmaps tool); `SymplecticGeometry` and `SymplecticGeometry/IntegrableSystems` read on main at `44f5967`. A grep of all 365 open pull requests and main for Kepler, Delaunay, three-body, disturbing function, Poincaré set and restricted problem found only `HamiltonianSystems` (its paragraph on this roadmap) and `IntegrableSystems` I4; no other roadmap owns the Delaunay chart, the disturbing function or Poincaré's theorem, so this roadmap is the owner of Lanes C and D and of items 8, 9, 12 and the explicit Delaunay chart.

**Adversarial table.**

| # | Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|---|
| 1 | `planarPotential 0 x y = 1/√(x²+y²)` | generic `(x,y)`; `(0,0)` | `0/√((x−1)²+y²) + 1/√(x²+y²)`; at the origin both sides `0` (Lean `1/0 = 0`) | true, one tactic | R06 (padding) |
| 2 | primary exchange `U_{1−μ}(−x,−y) = U_μ(x,y)` | `μ = 0.3, (x,y) = (0.5, 0)` | LHS `0.7/0.8 + 0.3/0.2 = 2.375`; RHS `0.3/0.2 + 0.7/0.8 = 2.375` | true, one tactic | R06 |
| 3 | Hamilton's equations of `H_μ` | differentiate | `ẋ = pₓ + y`, `ẏ = pᵧ − x`, `ṗₓ = pᵧ + ∂U/∂x`, `ṗᵧ = −pₓ + ∂U/∂y`; equals `yagasaki2025newproof` lines 23–24 | agrees | none |
| 4 | primaries at `(1−μ,0)`, `(−μ,0)` with masses `μ`, `1−μ` | centre of mass; separation | `μ(1−μ) + (1−μ)(−μ) = 0`; separation `1`; `r₁² = (x−1+μ)²+y²` is the distance to mass `μ` | consistent | none |
| 5 | `μ = 1` endpoint | `planarPotential 1 x y` | `1/√(x²+y²) + 0`: one primary of mass 1 at `(0,0)` | consistent with row 2 | none |
| 6 | `H₀ = −1/(2L²) − G` in the rotating frame | `pₓy − pᵧx = −G` | `H₀ = H_Kepler − G`; `ω = (∂H₀/∂L, ∂H₀/∂G) = (1/L³, −1)`; `DH₀ ≠ 0` everywhere | agrees with README lines 79–80, 169 | none |
| 7 | Delaunay normalization `L = √(αa)`, `G = L√(1−e²)`, `H = −α²/(2L²)` | `α = 1, a = 1, e = 0.6` | `L = 1`, `G = 0.8`, `H = −1/2 = −α/(2a)`; `∂H/∂L = 1 = a^{−3/2}` | agrees | none |
| 8 | README line 68: Yagasaki (fixed-mass) §3 normalization is incompatible | `α = 1−μ`, `I₁² = a` (`yagasaki2024restricted` (3.7), lines 646–668) | `∮p_r dρ = 2π(√(1−μ)·I₁ − I₂)`, so the angle `θ₁ = ∂χ/∂I₁` advances `2π√(1−μ)` per radial period, not `2π`; at `μ = 0.75` it is `π`. The paper's `2π/ω₁ = 2πI₁³/(1−μ)` versus its (3.5) `2πa^{3/2}/√(1−μ)` differ by `√(1−μ)` | README's warning is correct | Source issue below |
| 9 | item 13: `F₀` depends only on actions | `k ≠ 0`, `(L,G)` generic | order-0 equation gives `(k·ω(L,G))·F₀,k = 0`; `k·ω = k₁/L³ − k₂` vanishes only on the curve `L³ = k₁/k₂`, so `F₀,k = 0` on a dense open set, hence everywhere by continuity | true (analyticity not even needed) | none |
| 10 | item 14: `(k·DF₀) H₁,k = 0` at a resonance | `k = (1,2)`, `L³ = 1/2` | `{H₀,F₁}_k = i(k·ω)F₁,k = 0`; `{H₁,F₀}_k = i(k·DF₀)H₁,k`; so `k·DF₀ = 0` when `H₁,k ≠ 0` | true | none |
| 11 | item 15: collinearity from one resonance vector | `n = 2`, `k = (1,2)`; `n = 3` | in `ℝ²`, `k^⊥ = span{(2,−1)}` is a line containing `DF₀` and `DH₀`: collinear; in `ℝ³` one `k` gives a plane, no collinearity | true for the planar scope only | none (scope is planar) |
| 12 | item 16: `F₀ = φ∘H₀` locally | level sets of `H₀` | `DH₀ = (1/L³, −1) ≠ 0`; level sets `G = −h − 1/(2L²)` are graphs, connected on a product neighbourhood; `φ` analytic by the implicit function theorem | true with the stated connected-fibre hypothesis | none |
| 13 | item 17: classical normalization terminates | `dF∧dH = Σ μ^m Ω_m`, first nonzero `m` | replacing `F` by `(F − φ(H))/μ` lowers `m` by one; after `m` steps `dF₀∧dH₀ ≠ 0`, contradicting row 12 | finite, sound | none |
| 14 | summit on "a fixed phase domain" | small ball `U` around a non-equilibrium point | flow-box chart gives an analytic integral `c₁` on `U`, analytic in `μ`, independent of `H_μ` | false unless the domain is a union of full tori | R02 |
| 15 | uniform collision-freeness | `δ = 0.3`, inner ellipse with `a(1+e) = 0.8` | primary at `(0.7, 0)` lies in the annulus `[a(1−e), 0.8]`: `H_μ` singular on the domain | item 21 lacks the bound | R02 |
| 16 | Lean junk values | `planarPotential` at a primary | `μ/0 + (1−μ)/r₂ = (1−μ)/r₂`, finite junk; domains exclude it | acceptable, docstring says so | none |
| 17 | Yagasaki 2025 Theorem 1.1 vs the README summit | lines 65–67 | same objects (planar (1.1), analytic in state and `μ` near `0`, independent of `H`); Yagasaki states no domain | README is the more precise form once R02 is applied | none |

## Not verifiable

- **Tau Ceti at this pull request's pin.** The worktree's `lake-manifest.json` pins only Mathlib `9caeba1` and no Tau Ceti package (main pins Tau Ceti `a91d3aa`), so the README's "Pointwise linear symplectic forms in Tau Ceti" could not be checked at *this* pin; it is true at the content checkout's pin `a91d3aa` (`TauCeti/Geometry/Symplectic/AlmostComplex.lean:343`). The Tau Ceti Hamiltonian-flow modules that `HamiltonianSystems` cites at a later commit (`TauCeti/Geometry/Symplectic/Hamiltonian/`) do not exist at `a91d3aa`.
- **Whittaker, 4th edition (1937).** Only the 2nd edition (1917) scan is legally available; §165 was checked there (Chapter XIV, pp. 380–385). The section number is stable across editions but the pages were not checked in the 4th.
- **Arnold, *MMCM*; Meyer–Hall–Offin.** Cited without chapter; copyrighted textbooks with no legal open copy; not opened.
- **Published version of `yagasaki2024restricted`.** Read as arXiv:2106.04925v7; no journal version was located, so the numbering of "§3" is the preprint's.

## Source issues

- **Error** in yagasaki2024restricted at §3, eqs. (3.6)–(3.10) and the period relation after (3.11), printed pp. 14–17: the source treats θ₁ = ∂χ/∂I₁ as 2π-periodic with 2π/ω₁ = 2πI₁³/(1−μ); it should be 2π√(1−μ)-periodic (its own (3.5) gives the period 2πa^{3/2}/√(1−μ)), so the standard action is √(1−μ)·I₁; affects the proof (the resonance bookkeeping of §3, not the form of the result).
- **Gap** in poincare1892vol1 at §86 (Application au problème des trois Corps), printed pp. 250–251: the source says the secular coefficients of the disturbing function do not all vanish, by inspection of its well-known expansion; it should be a proved nonvanishing and density statement on a named action domain; affects the proof.
- **Gap** in whittaker1937 at §165 (vii), printed p. 385 (2nd ed.): the source says the coefficient condition is found to hold "on determining H₁ by actual expansion", with no computation; it should be proved on a named domain; affects the proof.
