# Review of LangevinAndHamiltonianMonteCarlo (pull request #2503 at 8c1ebcd)

**Verdict:** needs changes

**Summary.** Changes are needed for one reason only: a numerical value in the third Check of 4.1 is impossible for the objects as defined (it exceeds an elementary upper bound), and an accepted text may not assert a false value. Every theorem, identity and other Check was recomputed and holds, all cited locators were read in the sources and agree, and `Suggested.lean` elaborates with `sorry` as the only warning. There is one small correction (Tau Ceti's symplectic Hamiltonian-flow results at the pin are not cited) and two format notes; two facts are left for the human reviewers.

## R01 (P2) — The common flow value `1.0351839` in the third Check of 4.1 exceeds the upper bound `∫ φ d(targetMeasure U) ≈ 1.0177`, so it cannot be the value of either flow

An implementer who uses this Check as a regression value for `hmcKernel` and `targetMeasure` will not reproduce it and cannot tell whether the definition or the Check is at fault.

In the Check of 4.1 with `U q = (q² − 1)²`, `g q = sin 3q + 1/2`, `h = 1/10`, `n = 3` (README line 484), the text says the flows "agree to seven digits (`1.0351839`), with mean acceptance `0.751`". The kernel is Markov and `ψ q = 1/(1 + (q + 0.7)²) ≤ 1`, so `hmcKernel ψ ≤ 1` and the flow `∫ φ · (hmcKernel ψ)` against `targetMeasure U` is at most `∫ exp(−(q − 0.4)²) exp(−(q² − 1)²) dq = 1.01769` (one-dimensional quadrature; the total mass of the target is `1.97373`). Recomputing both flows with the README's definitions (the unnormalized target, standard Gaussian momentum, three leapfrog steps, acceptance `min 1 (exp (H z − H (f z)))`) gives `0.5043097` for each, agreeing to ten digits, with mean acceptance `0.75098`. So the symmetry and the acceptance rate are right and only the quoted value is wrong; normalizing the target (`0.25551`) or dropping the Gaussian constant (`1.2641`) does not give `1.0351839` either.

The smallest change: replace `1.0351839` by `0.5043097`, or state the test functions and measure for which `1.0351839` was computed if they differ from the ones written.

## C01 — Tau Ceti at the pin already has Hamilton's equations, conservation of energy and the canonical symplectic form on `V × V`, and the README neither cites them nor says how 3.1 and 2.2 differ

The scope section sends "Hamiltonian mechanics on symplectic manifolds" to SymplecticGeometry and lists only `ODE.globalSolution` and the Wasserstein distance as consumed from Tau Ceti, so a reader concludes that nothing about Hamiltonian flows exists at the pin. It does, on finite-dimensional vector spaces:

- `TauCeti.stdSymplecticForm` with `stdSymplecticForm_apply` (`TauCeti/Geometry/Symplectic/StandardCompatible.lean`, line 72) is the form `⟪u.1, w.2⟫ − ⟪u.2, w.1⟫` of 2.2;
- `stdSymplecticForm_hamiltonianVectorField` (`TauCeti/Geometry/Symplectic/Hamiltonian/Standard.lean`, line 42) gives the field `(b, −a)` from the partial gradients, which for `hamiltonian U` is `hamiltonianField g`;
- `TauCeti.SymplecticForm.hamiltonianFlow_conserves` (`TauCeti/Geometry/Symplectic/Hamiltonian/Flow.lean`, line 52) is conservation of a differentiable Hamiltonian along the flow of a Lipschitz Hamiltonian field, the flow being `TauCeti.flowOfLipschitz`, whose time maps are `ODE.globalSolution` (`TauCeti/Dynamics/Flow/OfLipschitz.lean`, line 59);
- `TauCeti.SymplecticForm.apply_fderiv_hamiltonianFlow` (same file, line 76) is symplecticity of the flow for a `C²` Hamiltonian.

The first target of 3.1 is more general (any solution curve, no finite dimension, no Lipschitz hypothesis, no completeness), so it stays; no measure-preservation statement exists at the pin, so 3.4 stays. The change is one sentence in 3.1 or in the scope section naming these declarations and saying in a clause how 3.1 differs, and an entry under "From Tau Ceti".

## N01 — Layer titles differ between the two files

The README has "Layer 2: the leapfrog map" and "Layer 3: Hamiltonian flow and the accuracy of the leapfrog map"; `Suggested.lean` has "the leapfrog integrator" and "the accuracy of the integrator". The docstring of `wassersteinEDist_ulaKernel_pow_le` cites "Dalalyan 2017" where the README has "Dalalyan 2017b".

## N02 — The `## Provenance` section speaks of "the author of this roadmap" and of what is "known to the author"

A README is read without its history; the same paragraph is already in the pull request's description. It could say only that the linked repository runs such chains as programs and proves nothing about them, or be dropped.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.1 `mhKernel_isReversible_iff` | two points `Q x = δ_{1−x}`, `a = (1, 1/2)`, `π = (1, 2)`; `ℤ/3` shift; non-measurable `a` | flows `1 = 1`; `1/3` vs `0` on both sides of the iff; kernel `= Kernel.id`, both sides true | holds; rejection term `∫_{A∩B} r dπ` symmetric, cancelled on finite-measure pieces | none |
| 1.1 `isMarkovKernel_mhKernel` | `a = 2`; `a` not measurable | mass `2 + 0 = 2`; kernel `Kernel.id`, mass `1` | bound `a ≤ 1` needed, measurability not | none |
| 1.2 `mhKernel_mhAcceptance_isReversible` | `u = p x q x y`, `v = p y q y x` with `u = 0 < v`, `u = v = 0`, `v = ∞`; `p 0 = ∞` | `a·u = min u v` in each case (`0`, `0`, `u`); flows `0` vs `1/2` when `p 0 = ∞` | holds; finiteness needed | none |
| 1.3 `involutiveKernel_isReversible_iff` (sampled) | swap on two points, `π = (1, 2)`; shift on `ℤ` | `a 0 = 2 a 1` both sides; `a = 1` gives `1` vs `2`; shift: measure invariant, flows `1` vs `0` | holds; involution needed | none |
| 1.3 Jacobian form (sampled) | `f x = 1/x` on `(0, ∞)`, `j = x⁻²`, `p = 1` | density `min(1, x⁻²)` maps to `min(1, y²) y⁻² = min(y⁻², 1)`; `j (f x) j x = 1` | holds | none |
| 1.4 `auxKernel_isReversible` (sampled) | `K = δ_{(y, x)}`; `ℤ/3 × {±1}`, `K = δ_{(x+y, −y)}`; `δ_1` in place of `ρ` | kernel `= π`; symmetric walk; shift (flows `1/3` vs `0`) | holds | none |
| 2.1 leapfrog, iterates (sampled) | `g = id`, `h = 1`, `(1, 0)`; `leapfrog g (−h)` after `leapfrog g h` | `(1/2, −3/4)`, then `(−1/2, −3/4)`; other order `(1/2, −1)`; composite `= (q, p)` | agrees with MathematicalStatisticsFoundations 9.4 `(0.5, −0.75)` | none |
| 2.2 `det_fderiv_leapfrog`, `leapfrog_symplectic` (sampled) | `g = id`; rotation field on `ℝ²`, `h = 1` | `(1 − h²/2)² − h(−h + h³/4) = 1`; Euler `1 + h²`; form `0 ↦ 9/8 + 9/8 = 9/4` | holds; symmetry needed | none |
| 2.3 `quadraticModifiedEnergy_leapfrog` (sampled) | scalar `A = a`, all `h`; `h = 1` at `(1, 0)`; `h = 2`; rotation `A`, `h = 1/2` | invariant `p² + k q²`, `k = a(1 − h²a/4)`, factor `c² + h²k = 1`; `3/8 = 3/8`, `H`: `1/2 → 13/32`; iterates `(2, −1), (−4, 1), (6, −1)`; `−1/32` vs `3/32` | holds | none |
| 3.1 conservation, time reversal (sampled) | `g = id`; field `(p, +q)` | `q² + p²` constant; `cosh 2t`; `η(t) = S γ(−t)` has `η' = (−p, −g q)` | holds | C01 |
| 3.2 local errors (sampled) | `U = q²/2` from `(0, 1)` and `(1, 0)`; `ε = 1/2`; `L = 0` | `ε − sin ε ~ ε³/6`; `0.010676 ≤ 0.015625`; trapezoid constant `Λ ε³/12`, `Λ = M V² + L√L V`; both `0` | holds | none |
| 3.3 `leapfrog_iterate_error_le` | recursion constants; `ε = 0.1`, `n = 10`; `L = 0`; `n = 0` | `ρ = (θ/2 + s)² ≤ exp θ`; `τ/θ ≤` bracket (`2 ≤ 3`); errors `0.000351`, `0.000827`, `B = 0.004439`; `0 ≤ 0` | holds | none |
| 3.4 Liouville (sampled) | `g = id`, `g = 0`, damped field | rotation and shear, determinant `1`; damped: `exp(−c t)` | holds; route needs only Lipschitz `g` | none |
| 4.1 `hmcKernel_isReversible` (sampled) | Gaussian, `n = 1`; wrong sign; non-gradient drift; `n = 0` | acceptance `0.920834 = 1 − (2/π) arctan(1/8)`; `E q² = 1.39090` vs `1.00000`; flows `0.5043097 = 0.5043097`, acceptance `0.75098`; `Kernel.id` | theorem holds; one quoted value false | R01 |
| 4.2 `exactHmcKernel_isReversible` (sampled) | `t = π/2, π, 2π`; `U = 0` | `γ`, `δ_{−q}`, `Kernel.id`; `N(q, t²)` reversible for Lebesgue | holds | none |
| 5.1 `ulaKernel` (sampled) | `g = 0`, `h = 1/2`; `h ≤ 0`; non-measurable `g` | `N(x, I)`; `δ_{x − h g x}`; `0` for `h ≠ 0`, `Kernel.id` for `h = 0` | as stated | none |
| 5.2 `wassersteinEDist_ulaKernel_le` (sampled) | `diag(1, 4)`, `h = 2/5`, `1/2`; `m = −1`; `ν = 2 δ_0` | factors `3/5, −3/5`; `−1 > 1/2`; `1 + h`; `h(L − m) ≤ 2(1 − h m)` iff `h(m + L) ≤ 2`; `∞` vs `0` | holds | none |
| 5.3 invariant law, second moment (sampled) | `U = (m/2)‖x − c‖²`; `h = 0`; `U = 0`; `h = 1/2` on `diag(1, 4)` | `v = 1/(m(1 − hm/2))`, `4/3` at `m = 1`, `h = 1/2`; `d v ≤ 2d/m`, equality at `h = 1/m`; no invariant law in the last two | holds | none |
| 5.4 `wassersteinEDist_ulaKernel_pow_le` (sampled) | `k = 0`; `h = 0`; Gaussian case `k ≤ 40`; `m = 0` | `r(1 − r^k)/(hm) + 1 = (1 − r^{k+1})/(hm)`; inequality true for all `k`; `0.08465 ≤ 0.14677`; `√(2hkd)` vs `0` | holds | none |
| 5.5 `malaKernel_isReversible`, `hmcKernel_one_eq_malaKernel` (sampled) | `h = 0`; `ε < 0`; `2h` for `4h` | `Kernel.id`; `y − x + h g x = ε p`, `x − y + h g y = −ε p'`; `0.7788` vs `0.6065` | holds | none |

- Source locators checked against the text: 31, in six sources (Bou-Rabee–Sanz-Serna arXiv:1711.05337v1, 19; Neal arXiv:1206.1901v1, 4; Dalalyan arXiv:1704.04752v2, 3; Durmus–Moulines arXiv:1605.01559v4, 3; Neklyudov et al. arXiv:2006.16653v1, 1; Tierney, Technical Report 606, 4 including equations (1) to (3)); all agree.
- Library declarations opened at the pins: 20 of Mathlib and 16 of Tau Ceti (every name in the supplier contracts), plus the four of C01; all exist with the stated hypotheses. `Kernel.IsReversible` is `Mathlib/Probability/Kernel/Invariance.lean`, line 58; the power of a kernel is the monoid of `Mathlib/Probability/Kernel/Composition/Comp.lean`, line 238.
- Cross-roadmap citations resolved on main: MathematicalStatisticsFoundations 9.4, StochasticCalculus 9.1, 10.1, 10.2, OptimalTransport 11.9, MarkovChainsAndRenewal, SymplecticGeometry, DenoisingDiffusion; all present and saying what is cited.
- Dependency check: `depcheck: 211 roadmaps, 2258 edges, 0 problem(s)`; no upward or cyclic edge. No change outside the roadmap folder.
- Automatic checks: all passed. `Suggested.lean` elaborated: 23 `sorry` warnings and nothing else; no `set_option`, no sorried data, imports as required.
- One-tactic probe (`rfl`, `simp`, `infer_instance`) on a copy: none of the 23 theorems closes. The elaborated types of all 38 declarations were compared with the README; the nine dropped binders are `[BorelSpace E]`, `[InnerProductSpace ℝ E]` or `[MeasurableSpace X]` on definitions that do not need them.
- Headline theorems of the README (reversibility criteria of 1.1 to 1.4, 4.1, 4.2, 5.2, 5.3, 5.4, 5.5, with 2.2, 2.3, 3.1 to 3.4): all statable and stated; nothing is padding.
- Numerical Checks recomputed: 3.2, 3.3, 4.1 (three), 5.3, 5.4, 5.5; all agree except the value of R01.

Overlap check: read MarkovChainMixing, ScoreBasedDiffusion, OneStepMethodsForODEs, FlowMatching, FirstOrderOptimization (open), MathematicalStatisticsFoundations, OptimalTransport, StochasticCalculus (main); the leapfrog step, the flip and the finite Metropolis–Hastings kernel are owned by MathematicalStatisticsFoundations 9.4 and cited; OneStepMethodsForODEs and MarkovChainMixing each leave the samplers to this roadmap; FirstOrderOptimization owns gradient-descent rates and this roadmap keeps only the one-step contraction of 5.2; nothing else shared. Liouville's theorem also occurs in the open HamiltonianSystems (smooth Hamiltonian, symplectic vector space), which may not be cited as a supplier; 3.4 is the Lipschitz, non-smooth case and is kept here. Ownership was also searched in the board's packages: nothing.

Source independence: 16 passages compared with 6 sources, none shared; largest share Bou-Rabee–Sanz-Serna 2018, 23 of 48 locators; contents compared with its Sections 2 to 5: independent (Layer 1 draws on its 5.3, Layer 2 on 3.3 and 4, Layer 3 on 2 and 3.2, Layer 4 on 5.4 and 5.5, Layer 5 on nothing in it; the order differs and is forced by 4.1 needing 1.3, 1.4 and 2.1).

Research link: the README's sources: Layer 5 states the discrete parts of the Wasserstein guarantees of Dalalyan (2017) and Durmus–Moulines (2019) for the unadjusted Langevin algorithm; Layers 1 to 4 give the reversibility of Hamiltonian Monte Carlo as in Neal (2011) and Bou-Rabee–Sanz-Serna (2018), with Tierney's (1998) criterion.

## Not verifiable

- The published versions (Acta Numerica, Bernoulli, COLT proceedings, Annals of Applied Probability) were not compared with the preprints; the README cites the preprint numbering explicitly, and that is what was checked.
- The origin of the value `1.0351839` (R01): no normalization tried reproduces it.

## Source issues

- none

## For the human reviewers

- **Scope.** Liouville's theorem is stated here (3.4, Lipschitz force on `E × E`) and in the open roadmap HamiltonianSystems, Layer 2 (smooth Hamiltonian on a symplectic vector space). Neither contains the other, and HamiltonianSystems may not be cited as a supplier.
- **Licence.** The README's `## Provenance` links the author's repository `brettkoonce/lean4-mlir` (BSD-3) and says it contains programs and no proofs; the repository was not opened, and nothing in `Suggested.lean` suggests adaptation from it.
