# FIX-DESIGN-CompressibleEulerEquations~10

This round settles the two findings of `REV-DESIGN-CompressibleEulerEquations~9`. Both are P3 and
both are mathematically right. Two files changed: `packages/CompressibleEulerEquations/design/README.md`
and `packages/CompressibleEulerEquations/design/plan.json`. `packages/CompressibleEulerEquations/sources.toml`
is unchanged because no new work is cited. The design stage has no `Suggested.lean`, so no Lean
statement changed. Nothing was elaborated, and the `#check` comparison had no file to run on. No
target was added, removed or renumbered.

## F01 (P3) — applied differently

I checked this at the pins. Tau Ceti `2fd255d` has `TauCeti.W1p.eLpNorm_value_comp_add_sub_value_le_mul_enorm_gradient`
at `TauCeti/Analysis/Sobolev/Translation.lean:133`. Its hypothesis is `u ∈ w1p0Submodule mu ⊤ p`, and
`TauCeti.w1p0Submodule_top_eq_top` (`W1p/Density.lean:299`) removes that hypothesis for `p ≠ ∞`.

Before: no Tau Ceti contract for the estimate, and no route for the loss bound. Now: a contract
bullet naming both declarations, a loss-bound route in §4.4 with `C = √n ∫|y|φ`, both names in
§4.4's *Needs:* line, and both in plan target 4.4.

This is "differently" because the reviewer's constant `C = ∫|y|φ` does not follow from this route
for the summed `Hᵏ⁻¹` norm, and the localisation for `Λ ≠ 0` gives the full `H¹_Λ` norm on the
right, not `‖∇w‖`.

## F02 (P3) — applied

The finding holds. §6.1 is stated for any quasilinear symmetric hyperbolic system (§2.1) with a lens
function spacelike for `U₁`. §7.2 needs `Hᵏ_Λ` (§4.1) for every period group. Neither was in the list.

The "How to read the build" list now also names the §2.1 system with its symbol, `Hᵏ_Λ` (§4.1), and
the lens function with its spacelike condition (§6.1). I extended the same pattern to Layer 8: the
list now says "the initial data set and the development with its order (§8.1)", because the
maximality used in §8.2–§8.4 is defined through that order and the data set carries `Λ`, `S` and `Ū`.

## What changed, in detail

- README, "From Tau Ceti": a new bullet after the `TauCeti.Wkp.translate` bullet. It covers
  `TauCeti.W1p.eLpNorm_value_comp_add_sub_value_le_mul_enorm_gradient` (`Translation.lean:133`),
  which holds for `1 ≤ p ≤ ∞`, any additive Haar measure, and `u` in `TauCeti.w1p0Submodule μ ⊤ p`.
  It also covers `TauCeti.w1p0Submodule_top_eq_top` (`W1p/Density.lean:299`), which says that this
  closure is all of `W^{1,p}(E)` for `p < ∞`. The bullet notes that `TauCeti.W1p volume ⊤ 2` is
  `TauCeti.Wkp volume ⊤ 2 1` (`TauCeti/Analysis/Sobolev/Wkp/Basic.lean`, module docstring: `Wkp 1 = W1p`).
  It then says how the estimate gives the loss bound: with `MeasureTheory.norm_integral_le_integral_norm`
  for `Λ = 0`, and through the localisation of §4.1 for every `Λ`.
- README §4.4: a route for the loss bound.
  - For `|α| ≤ k − 1`, `w = ∂^αu ∈ H¹_Λ` and `J_εw − w = ∫ φ(y)(τ_{−εy}w − w) dy`.
  - At `Λ = 0`, the translation estimate gives `‖J_εw − w‖ ≤ ε(∫|y|φ)‖∇w‖`.
  - Every multi-index of order 1 to `k` arises as `∂ᵢ∂^α` at most `n` times, so `C = √n ∫|y|φ` works.
  - For `Λ ≠ 0`, `‖τ_hw − w‖_{L²_Λ} ≤ C′|h|‖w‖_{H¹_Λ}`.
- README §4.4 *Needs:*: added the two Tau Ceti names "for the loss bound".
- README "How to read the build": the list of definitions the headlines need (F02).
- plan.json, target 4.4: the two names were added to `prerequisites` as `tauceti:` entries, and the
  `gain_loss` API statement now carries the loss-bound route. The file still parses: 8 layers,
  53 targets, `gaps: []`.

Searched for the same pattern ("proved here" with a pinned input left unnamed), still in §4.4:
- The contraction, gain and convergence already name their inputs.
- The `L²_Λ` symmetry is Fubini, covered by the existing "Bochner integral" Mathlib bullet.
- Friedrichs' lemma is cited to Majda1984 (Ch. 2, §2.1) and Friedrichs1954 and has no route that
  uses the translation estimate.
- §7.1 uses the loss bound only through §4.4, and that citation is still correct.

Searched for the F02 pattern (lists of the definitions the headlines need): it occurs only in "How
to read the build". plan.json has no such list.

## Adversarial pass (statements added or changed)

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| Contract: translation estimate on `W^{1,2}(E)` | `w = e^{−x²}` on `ℝ`; `h → 0`, `h = 0`, `|h|` large; `p = ∞` | `‖w′‖₂² = ∫4x²e^{−2x²} = √(π/2)`, so `‖w′‖₂ = (π/2)^{1/4} ≈ 1.1195`; for small `h`, `‖w(·+h) − w‖₂ ≈ 1.1195|h|`, equal to first order; `h = 0`: `0 ≤ 0`; as `|h| → ∞`, the left side tends to `√2‖w‖₂ = √2(π/2)^{1/4} ≈ 1.583`, which is `≤ 1.1195|h|` once `|h| ≥ 1.415`; at `p = ∞` the closure hypothesis stays (the constant `1` is not in it), but only `p = 2` is used | holds | none |
| Contract: hypothesis removed by `w1p0Submodule_top_eq_top` | `p = 2 ≠ ∞`; `p = ∞` | at `p = 2` the closure is `⊤`, so every `u ∈ W^{1,2}(E)` qualifies; at `p = ∞` the lemma does not apply, and the contract claims only `p < ∞` | holds | none |
| §4.4 loss bound, single `w`, `Λ = 0` | Fourier multiplier; `w = e^{−x²}` | `1 − φ̂(η) = ∫φ(y)(1 − cos ηy) dy ≤ |η|∫|y|φ`, since `1 − cos θ ≤ |θ|` and `φ` is even; so `‖J_εw − w‖ ≤ ε∫|y|φ · ‖ξŵ‖ = ε∫|y|φ · 1.1195` | holds | added |
| §4.4 summation constant `√n` | `n = 1`, `k = 1`; `n = 2`, `k = 2`, `u = e^{−|x|²}`; the Fourier weight at `ξ = (t, t)` | `n = 1`: every `γ` is `α + 1` exactly once, so `C = ∫|y|φ`, which agrees with the cosine Check. `n = 2`, `k = 2`: the route's sum is `π + (3π/2 + π/2 + π/2 + 3π/2) = 5π`, against `‖u‖²_{H²} = 5π` and `n‖u‖²_{H²} = 10π`. Weights at `ξ = (t, t)`: route `Σ_{|α|≤1}|ξ|²ξ^{2α} = 2t² + 4t⁴`, multi-index norm `1 + 2t² + 3t⁴`; the ratio tends to `4/3 > 1` but stays `≤ n = 2` | `√n` serves; the bare `∫|y|φ` is not justified by this route for `n ≥ 2`, `k ≥ 2` | constant stated as `√n ∫|y|φ` |
| §4.4 loss bound, `Λ ≠ 0` (localisation) | `Λ = 2πℤ`, `w = cos(mx)`; `|h| ≥ 1`; wrong `L²`-only form | `‖τ_hw − w‖²_{L²_Λ} = π|e^{imh} − 1|² = 4π sin²(mh/2) ≤ πm²h²`, so `≤ |h|‖w′‖ ≤ |h|‖w‖_{H¹_Λ}`, with `‖w‖²_{H¹_Λ} = π(1 + m²)`. For `|h| ≥ 1`: `≤ 2‖w‖ ≤ 2|h|‖w‖_{H¹_Λ}`. A bound by `C′|h|‖w‖_{L²}` alone fails: at `mh = π` the left side is `2√π` and the right side is `C′√π π/m`, which tends to `0` | holds with the `H¹_Λ` norm | stated with `‖w‖_{H¹_Λ}` |
| §4.4 loss bound, `k = 0` | `cos(mx)` | `|1 − φ̂(εm)| → 1` as `m → ∞`, while `Cε → 0` | still excluded; the route needs `w = ∂^αu ∈ H¹`, that is `|α| ≤ k − 1` | none (existing Check) |
| How to read the build: §6.1 needs §2.1 and the lens | transport `∂_tu + ∂_xu = 0` (`N = 1`, `A⁰ = 1`, `A¹ = 1`; not an Euler system); `φ = 1 − |x − t| − 2t`; `φ = 1 − |x| − t/2` | first `φ`: `σ(dφ) = (sgn(x−t) − 2) − sgn(x−t) = −2 ≤ 0`, spacelike. Second `φ`: at `x < 0`, `σ = −1/2 + 1 = 1/2 > 0`, not spacelike | §6.1 is statable only with §2.1 and §6.1 in the list | list amended |
| How to read the build: §7.2 needs `Hᵏ_Λ` | `Λ_cyl`, `n = 3`, `k = 3`; `Λ = 0` | `2k = 6 > n + 2 = 5`; `Hᵏ_{Λ_cyl}` is not Tau Ceti's `Wkp` (which is `Λ = 0` only); at `Λ = 0` it agrees with `TauCeti.Wkp volume ⊤ 2 k` up to equivalent norms (§4.1) | the §4.1 definition is needed | list amended |
| How to read the build: Layer 8 needs data set and order | §8.4(b) "maximal"; §8.2 "largest development below both" | both are defined through `≤` of §8.1, on developments of one initial data set `(t₀, Λ, S, Ū)` | needed | list amended |

## Checks

- Dependency check:

  ```text
  candidate: CompressibleEulerEquations is not in the merge order yet; checked as if placed after MathematicalBilliards (the intake inserts it when its design is accepted)
  depcheck: 246 roadmaps, 2241 edges, 0 problem(s)
  ```

  No UPWARD or CYCLE line. The new *Needs:* items are pinned Tau Ceti declarations and add no
  roadmap edge.
- `roadmaps resolve` on the edited README: no cross-roadmap citation and no Lean name found nowhere.
  The tool says it could not check names outside TauCetiRoadmap on this host. I checked the two
  new names by hand at the Tau Ceti pin `2fd255d` (the rev in `lake-manifest.json`):
  - `TauCeti.W1p.eLpNorm_value_comp_add_sub_value_le_mul_enorm_gradient`: `Translation.lean:133`,
    inside `namespace TauCeti`.
  - `TauCeti.w1p0Submodule_top_eq_top`: `W1p/Density.lean:299`, inside `namespace TauCeti`.
  - `TauCeti.w1p0Submodule`: `W1p/Zero.lean:134`.
  - `TauCeti.W1p`: `W1p/Basic.lean:372`.
- The worker's single citation lead, `LinearSystem.IsSymmetricHyperbolic` (README line 103), is
  SymmetricHyperbolicSystems' declaration of §1.2 at its head. It is not a defect.
- `plan.json` parses: 8 layers, 53 targets, `gaps: []`.
- `Suggested.lean`: none at the design stage, so there was no `#check` comparison and no
  elaboration.
- Sources: no new citation, so nothing was fetched and `needs-references.toml` was not written.

## Gate failures

None listed for this round.

## Notes for the maintainer

- No name that another roadmap cites changed. No roadmap cites CompressibleEulerEquations.
- Ownership: no construction was added. The new inputs are pinned Tau Ceti declarations, so the
  ownership picture of round 9 (LorentzianGeometry and SymmetricHyperbolicSystems as suppliers) is
  unchanged. Open pull requests were not searched again for new objects because none was stated.
- The review's "For the human reviewers" section (merge order of the two suppliers, Majda1984 not
  tested, the LukNotes licence, characteristic data) lists no finding, and nothing was changed
  because of it.
