# Repair of DiracScatteringAndNonlinearFourierTransform (design, round 10)

This round answers the findings of `REV-DESIGN-DiracScatteringAndNonlinearFourierTransform~9`. The verdict was
`needs_changes`, with one P2 finding and two P3 findings. Files edited:

- `packages/DiracScatteringAndNonlinearFourierTransform/design/README.md`
- `packages/DiracScatteringAndNonlinearFourierTransform/design/plan.json`

`sources.toml` is unchanged, because no new work is cited: the new supplier is a roadmap on main, and the new
inputs are pinned declarations. No source was fetched, and `needs-references.toml` was not written. There is no
`Suggested.lean` at the design stage, so the `#check` comparison of elaborated types does not apply and was not
run. Each finding was checked against the roadmap on main (`1a19c9f`), the pinned Mathlib (`1b1ccf4`) and the
pinned Tau Ceti (`2fd255d`) before any edit. The section "For the human reviewers" of the review asks for no
edit, and none was made for it.

## F01 (P2) — applied

Verified on main. OperatorTheory/UnboundedOperators §4.8 (UO-D07), README line 845–847, states Weyl's
alternative with its independence of the spectral parameter. Line 861–867 extends the endpoint classification
to `Ju′ + V(r)u` with `J = [[0, −1], [1, 0]]` and locally integrable Hermitian `V`. Line 876 states the
alternative for Sturm–Liouville expressions. Line 886 says that §4.8 states its own local integral-equation
step. The dictionary checks out: `J = −Ω` and `J⁻¹ = Ω`, so `Ju′ + Vu = λu` is `u′ = Ω(λ − V)u`. With
`V = −Q_q` and `λ = −z` this is `−Ω(z − Q_q)`, confirmed numerically for `f = 0.7`, `g = −0.4`.

Old → new:

- Scope: "the self-adjoint Dirac operator … to a later operator-theoretic roadmap" → minimal and maximal
  operators, Green's formula, the λ-independent alternative and self-adjoint realisations go to
  UnboundedOperators §4.8, with the dictionary; §1.2's `ℂ²` case is §4.8's local statement.
- §6.4 route: "by variation of constants and §1.1" → "by the alternative of UnboundedOperators §4.8".

Further changes:

- New `### From TauCetiRoadmap.OperatorTheory.UnboundedOperators` contract, stating the alternative for
  `Ju′ + Vu` as the analogue of the one at line 876.
- A dictionary sentence with a computed witness in Conventions: `λ = −z` gives `Θ(t, z)`, and `λ = z` gives
  `Θ(t, −z)`.
- The fixed-parameter Check in §1.2: the free matrix, and its transpose under the wrong sign.
- A clause in §6.4's free-case Check: the limit-point case at `λ = −z ∈ ℂ₋`.
- §6.4 *Needs:*: §1.1 and §1.3 are removed, since no other step of §6.4 used them. UnboundedOperators §4.8 is
  added, and so is Mathlib `TendstoLocallyUniformlyOn.differentiableOn` (holomorphy of `m`, which the line
  omitted).
- The Dependencies of Layers 1 and 6 are updated.
- The UnboundedOperators bullet is deleted from Downstream consumers.
- plan.json is mirrored: `suppliers` gains `OperatorTheory/UnboundedOperators` §4.8, `consumers` loses
  UnboundedOperators, the 6.4 prerequisites, route and test are updated, and a 1.2 test is added.

One clause differs from the suggested Scope text, which drops "its spectral theorem". §4.8 does not own the
eigenfunction expansion of a Dirac operator: its text assigns spectral quantisation to a physical-model
roadmap. So the Scope keeps one sentence saying that this unitary equivalence with multiplication by `x` in
`L²(μ_q)` is outside this roadmap and is not needed by Layer 6.

## F02 (P3) — applied

Verified. At the pin, `hasFDerivAt_integral_of_dominated_of_fderiv_le`
(`Analysis/Calculus/ParametricIntegral.lean` line 222) has the hypothesis `h_diff`: for almost every integration
point, a derivative at every point of a neighbourhood. Take `q = 1_{[0,1]}` and `x = 0`. Then
`|E(t, 0)|^{−2} = e^{−2 min(t,1)}` (computed exactly at `t = 0.3, 0.9, 1, 1.5, 2`). Its one-sided derivatives at
`t = 1` are `−0.270671 = −2e^{−2}` and `0`. At `x = 0.7` they are `−0.265049` and `0`, so differentiability
fails for almost every `x`. No absolutely continuous variant of the lemma exists at the pin.

Old → new: the §6.3 route "∂ₜ ∫ |F|²|E|^{−2} = … differentiation under the integral is dominated" → an
integrated route. For each `x`, `r ↦ |E(r, x)|^{−2}` is absolutely continuous, and the fundamental theorem of
calculus gives `|E(t,x)|^{−2} − |E(s,x)|^{−2} = −2∫_s^t Re(q/E²)`. Then multiply by `|F|²`, exchange the
integrals, and apply the product law of §2.6 for each `r`.

The exchange uses `MeasureTheory.intervalIntegral_integral_swap` (`MeasureTheory/Integral/Prod.lean` line 486),
the interval-integral form built on the suggested `MeasureTheory.integral_integral_swap` (line 481). The
domination is `2|F(x)|²|q(r)|e^{2∫₀ʳ|q|}`. The absolute continuity is made explicit: §1.2 gives it for
`Θ(·, x)`, followed by the Lipschitz map `w ↦ max(|w|, e^{−∫₀ᵗ|q|})^{−2}`. The Lipschitz composition uses Mathlib
`LipschitzWith.comp_absolutelyContinuousOnInterval`, and the fundamental theorem of calculus uses
`AbsolutelyContinuousOnInterval.integral_deriv_eq_sub`. Both are already in the supplier contracts.

The *Needs:* line becomes §1.2, §2.6, §3.2, §6.2 and these three declarations. A Mathlib contract bullet is
added for the swap, and a first Check gives the review's instance. The Layer 6 Dependencies replace
"differentiation under the integral" with what is now used. plan.json 6.3 is mirrored: statement,
prerequisites and a new test.

Pattern: the lemma is still cited in §1.6 and §2.1. Both uses differentiate in a holomorphic parameter (`z` in a
Dyson term, `z` in the Schwarz kernel). There the integrand is holomorphic in the parameter for almost every
integration point, so `h_diff` holds, and those citations stand. No other route differentiates an integral in
`t` (grep for `∂ₜ`: all other occurrences are pointwise ODE derivatives).

## F03 (P3) — applied

Verified. Tau Ceti `MeasureTheory.AEStronglyMeasurable.apply_of_forall_of_continuous`
(`MeasureTheory/Function/StronglyMeasurable/Caratheodory.lean` line 41, at `2fd255d`) needs two things:
almost everywhere strongly measurable sections `t ↦ g t x`, and `g t` continuous for every `t`. It concludes
that `t ↦ g t (u t)` is almost everywhere strongly measurable for almost everywhere strongly measurable `u`,
with `G` pseudo-metrizable and no separability of `X`.

Old → new: §1.7's "strongly measurable … because `Y` is a uniform limit of step functions" → "almost
everywhere strongly measurable by the Tau Ceti lemma, after replacing `F(t, ·)` by `0` on a null set of `t`,
on the ball `B` in the local form". *Needs:* "Mathlib `StronglyMeasurable` limits" → the Tau Ceti lemma.

Also added: a `### From Tau Ceti` bullet, the Layer 1 Dependencies, and the 1.7 statement and prerequisites in
plan.json.

The replacement on a null set is needed because the lemma asks for continuity at every `t`, while §1.7 assumes
the Lipschitz bound only for almost every `t`. Pattern: no other route re-derives the measurability of a
composite. The other generic *Needs:* items (Bochner integrals in §1.2, §1.3, §2.1) name carriers, not steps.

## Checks run

Dependency check (after the edits; the same output before them):

```
candidate: DiracScatteringAndNonlinearFourierTransform is not in the merge order yet; checked as if placed after AutomorphicSpectralTheory (the intake inserts it when its design is accepted)
depcheck: 245 roadmaps, 2235 edges, 0 problem(s)
```

There is no UPWARD and no CYCLE line. The new supplier, OperatorTheory/UnboundedOperators, is on main.

`roadmaps resolve` on the edited README found no cross-roadmap citations and no Lean names that are missing
everywhere.

plan.json against the README: every target statement, API statement and test statement occurs verbatim in the
README (script check). There are 57 targets and 57 `**Checks.**` blocks. `gaps` is `[]`.

Hygiene: the added lines contain no LaTeX delimiters, machine paths, process words, review or pull-request
references.

No gate failures were listed for this round.

## Adversarial pass on the changed statements

Plain Python, values computed this round.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Conventions dictionary `J = −Ω`, `V = −Q_q`, `λ = −z` | `J·Ω`; coefficient at `f = 0.7`, `g = −0.4`, `z = 0.6 + 0.25i` | `JΩ = 1`; `Ω(λ − V) = −Ω(z − Q_q)` entrywise to `10⁻¹⁵` | holds | added with witness |
| Dictionary witness, free case | `t = 1.3`, `z = 0.6 + 0.25i`; `λ = −z` vs `λ = z` | `exp(λΩt)` = `[[0.74879−0.23261i, −0.74075−0.23514i], [0.74075+0.23514i, 0.74879−0.23261i]]` = `[[cos, −sin], [sin, cos]]`; `λ = z` gives the transpose | holds; the wrong sign is separated | Conventions sentence, §1.2 Check |
| §1.2 fixed-parameter Check | `V = 0`; `V` integrable Hermitian; `z = 0` | as above; `z = 0` gives `M = 1`; `‖Ω(λ − V)‖ ≤ |λ| + ‖V‖` integrable | holds | Check added |
| §1.7 composite measurability | `F = P(t)x + G(t)`; `F` discontinuous in `x` only for `t` in a null set | the linear field has continuous `F(t, ·)` and measurable sections; the null-set case needs the replacement by `0`, after which the sections are unchanged a.e. | holds; the lemma applies after the modification | route sentence, *Needs:* |
| §6.3 integrated identity | `q = 1_{[0,1]}`: `x = 0`; `x = 0.7`, `s = 0.3`, `t = 1.6` | `x = 0`: `e^{−2min(t,1)}` exact; one-sided derivatives `−0.2706706`, `0`. `x = 0.7`: left side `−0.3916705841`, right side (Simpson) `−0.3916705841`; derivatives at `1`: `−0.265049`, `0` | holds; the pinned parametric lemma does not apply | route replaced, Check added |
| §6.3 statement (unchanged), recomputed | `q = 1_{[0,1]}`, `s = 0.5`, `F(x) = (sin(x/4)/x)² ∈ PW_{0.5}` | `∫|F|²/|E(t,·)|²` = `0.0218754203` at `t = 0.5, 1.0, 1.5`; `∫|F|² = 0.0327249 = (2π/3)/64` | holds; the weights matter | none |
| §6.3 domination | `|q(r)||E(r,x)|^{−2}` | `≤ |q(r)| e^{2∫₀ʳ|q|}` by §3.2; `∫_s^t |q| e^{2∫₀ʳ|q|} dr ≤ e^{2∫₀ᵗ|q|}∫_s^t|q| < ∞` | holds | none |
| §6.4 limit point via §4.8 | free case at `t = 1.3`, `z = 0.6 + 0.25i`; hypothetical limit circle at `z = 0` | `Φ + iΘ = (ie^{itz}, e^{itz})` to `10⁻¹⁶`; `Φ − iΘ = (−ie^{−itz}, e^{−itz})`, `|e^{−itz}| = 1.384031 = e^{t Im z}`; at `z = 0`, `q = c`: `|Θ||Φ| = e^{ct}e^{−ct} = 1`, not integrable | holds; one line of `L²` solutions at `λ = −z ∈ ℂ₋` | route, *Needs:*, Check clause |
| §6.4 step "`Φ(·, z₀) ∈ L²`" | nested closed discs `D_t(z₀)`, `t > 0` | `⋂_t D_t(z₀) ≠ ∅` by compactness; for `w` in it, `∫₀ᵗ|Φ + wΘ|² ≤ Im w/Im z₀` for every `t` | holds | made explicit in the route |
| Supplier contract `intervalIntegral_integral_swap` | hypotheses at the pin | `μ` s-finite (`variable [SFinite μ]`, Prod.lean line 347); integrability on `(volume.restrict (uIoc a b)).prod μ` | as stated | contract bullet |
| Supplier contract `apply_of_forall_of_continuous` | hypotheses at the pin | `X` topological, `G` pseudo-metrizable, continuity of every `g t`, a.e. strongly measurable sections and `u` | as stated | contract bullet |

## Ownership and overlaps

- `roadmaps grep` over main and the open heads, by object. "Dirac system", "`Ju′ + V`" and "two-component":
  only UnboundedOperators §4.8 owns the Dirac expression's operator theory. "limit point": UnboundedOperators
  §4.8 on main. NoncompactQuantumSymmetry (open) uses a limit-point endpoint of one Schrödinger expression, and
  that is not shared. "Weyl–Titchmarsh": a reference in UnboundedOperators only. "inverse scattering": no
  match. "eigenfunction expansion": other objects (LaguerreJacobi, NoncompactQuantumSymmetry, PDE,
  OrthogonalL2Bases). So the deferrals that remain in Scope have no owner on main.
- The board package SchrodingerOperatorsAndSpectralTypes cites UnboundedOperators UO-A–UO-E but not UO-D07. It
  does not mention Dirac systems and does not overlap.
- `scratch/overlaps.md`: no open pull request changes this roadmap, no cited id is dropped, no id is defined
  only by an open revision, and there is no second copy.
- This roadmap now consumes UnboundedOperators §4.8 and is no longer listed as its supplier, so the two texts
  no longer hand the integral-equation step to each other.
- PDE §6.2 and StochasticCalculus stay as prospective consumers. Neither owns an integrable-kernel Grönwall
  inequality or a Carathéodory theorem: PDE line 264 consumes Mathlib's Picard–Lindelöf and Grönwall, and
  StochasticCalculus line 2958 is the constant-rate form. This roadmap consumes neither, so there is no cycle.

## For the maintainer

- New supplier edge: DiracScatteringAndNonlinearFourierTransform → OperatorTheory/UnboundedOperators §4.8. The
  roadmap is on main, so the merge order is unaffected.
- UnboundedOperators states the Dirac endpoint classification as "the analogous … endpoint classification
  API" of its Sturm–Liouville alternative. The supplier contract here spells out that analogue. If
  UnboundedOperators is revised, the Dirac form of its limit-point/limit-circle bullet is the statement this
  roadmap relies on.
- No name of this roadmap that another roadmap cites has changed. No section was renumbered.
- Ownership against open pull requests was checked with `roadmaps grep` over the heads indexed on
  2026-11-15.
