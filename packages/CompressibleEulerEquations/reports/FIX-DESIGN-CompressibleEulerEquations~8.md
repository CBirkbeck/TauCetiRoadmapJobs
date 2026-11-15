# FIX-DESIGN-CompressibleEulerEquations~8

Repair of the two findings of `REV-DESIGN-CompressibleEulerEquations~7` (both P3). Files changed:
`packages/CompressibleEulerEquations/design/README.md`,
`packages/CompressibleEulerEquations/design/plan.json` and
`packages/CompressibleEulerEquations/sources.toml` (one locator). No work is newly cited. The design
stage has no `Suggested.lean`, so no Lean statement changed. Nothing was elaborated, and the
`#check` comparison had no file to run on.

## F01 (P3) — applied

Verified: the witness is correct (values below). Old §4.3 route: "applied componentwise to
`Φ ∘ u` for smooth `u`" and a scalar-only cutoff. New: the cut-off `Φ̃ = χΦ` (smooth, compactly
supported on `ℝ^N`, equal to `Φ` on `K`), and every approximant is composed with `Φ̃`. Added a
Check and a plan 4.3.2 test. The same pattern is repaired in two contract bullets and in §7.1.

## F02 (P3) — applied

Verified at BarGinouxPfaffle2007 lines 1006–1008 and 883–884: `D(S)` uses causal curves
inextendible at both ends. Old: "BarGinouxPfaffle2007 line 1006, Definition 1.3.5". New, in §3.3
(the definition and Slabs): "…, the two-sided Cauchy development `D(S)`, defined with causal curves
inextendible in both directions". The same clause went into §8.1, the plan locators (3.3, 3.3.3,
8.1.1) and the manifest locator.

## What changed, in detail

- README §4.3 `*Needs:*`: the composition route first builds `Φ̃ = χΦ`, extended by `0` outside
  `G`. Here `χ` is smooth on `ℝ^N`, equal to `1` on the `δ/2`-neighbourhood of `K` and supported
  in `K_δ`: it is the indicator of the `3δ/4`-neighbourhood mollified at radius `δ/8`, so its
  derivatives of order `j` are at most `(8/δ)^j` times an `L¹` norm of the kernel. `Φ̃ ∘ u = Φ ∘ u`
  because `u` takes values in `K`. The approximants `Ū + J_ε(u − Ū)` of §4.4 are composed with
  `Φ̃`. `TauCeti.hasWeakFDerivOn_gradient_of_contDiffOn` is applied to `Φ̃ ∘ u`. The scalar case
  now uses `s ↦ Φ̃(Ū + s)`, the same function as before, now defined once. A closing sentence says
  that the derivatives of `Φ̃` are bounded by those of `Φ` on `K_δ` and powers of `δ^{−1}`, which
  is the constant dependence §4.3 already states. The statement of §4.3 is unchanged.
- README §4.3 **Checks**: a new bullet, "The approximants leave `G` when `2k ≤ n`". This is the
  reviewer's witness, written with `β` for the radial profile (`λ` already denotes the scaling
  parameter in the same Checks) and `ϑ` for the angle function (`φ` is the kernel of §4.4).
  `δ = 1/4` is named for `Φ̃`.
- Pattern, README `### From Mathlib` (the `HasFDerivAt.comp`/`HasFTaylorSeriesUpToOn.comp`
  bullet): "classical derivatives of `Φ ∘ u` … for smooth `u`" → "of `Φ̃ ∘ u` … `Φ̃` the compactly
  supported cut-off of `Φ`".
- Pattern, README `### From Tau Ceti` (the `TauCeti.hasWeakFDerivOn_gradient_of_contDiffOn`
  bullet): "applied componentwise to `Φ ∘ u` for the smooth approximants `u` of §4.3" → "to
  `Φ̃ ∘ u`, `Φ̃` the compactly supported cut-off of `Φ` of §4.3, for the smooth approximants `u`
  there, which may leave the domain `G` of `Φ`".
- Pattern, README §7.1 route: "with mollified data" became "with mollified data
  `Ū + J_ε(U₀ − Ū)` (§4.4)". These data take values in `K_{δ/2}` once `ε ≤ ε₀(M, K)`, because
  `‖J_ε(U₀ − Ū) − (U₀ − Ū)‖_∞ ≤ C‖·‖_{Hᵏ⁻¹_Λ} ≤ CεM` by §4.2 (`2(k − 1) > n`) and the loss bound
  of §4.4. So the coefficients `A⁰, Aⁱ, F` (defined on `G` only) are evaluated inside `G`. The
  statement of §7.1 is unchanged. The reviewer judged §7.1 unaffected, and mathematically it is.
  The route nevertheless evaluated functions defined only on `G` at mollified data without saying
  why the data stay in `G`, which is the same construction as F01. The clause supplies that step.
- README §3.3, definition paragraph and *Slabs* bullet; README §8.1: the clause of F02. In
  *Slabs* the citation now reads "the two-sided analogue is BarGinouxPfaffle2007 line 1006,
  Definition 1.3.5, the Cauchy development `D(S)`, …". The old wording, "the notion is …", would
  have called the two-sided notion the one used here. The review said §8.1 needs no change; it got
  the short clause ("the two-sided Cauchy development `D(S)`") anyway, so that every citation of
  the definition says the same.
- `design/plan.json`: the locators of 3.3, 3.3.3 and 8.1.1 now carry the F02 clause. 4.3.2 has a
  new test `approximants_leave_G` (non-example). 7.1 gains the prerequisite `target:4.4`: its route
  now cites §4.4's mollifier and loss bound, and the README's `*Needs:*` line for §7.1 already
  listed §§4.2–4.4.
- `sources.toml`, entry `BarGinouxPfaffle2007`: `locator` "Definition 1.3.5; Theorem 3.2.11" →
  "Definition 1.3.5 (the two-sided Cauchy development D(S), defined with causal curves inextendible
  in both directions); Theorem 3.2.11". No other field changed.

Pattern search for F01: every place where a function defined only on `G` (`Φ`, `A⁰`, `Aⁱ`, `F`)
is evaluated at a mollified or approximating object. §5.3 (lines on `J_ε∂^αW`) mollifies the
linear unknown `W`, not the argument of a coefficient, so it is unaffected. §5.4 mollifies `W_ε`
inside a linear ODE whose coefficients are evaluated at the given `U`, also unaffected. §7.1's
mollified data is repaired above. §7.2 and §7.3 reach the mollified data only through §7.1. §6.1
already carries its cutoff (from the previous repair).

Pattern search for F02: the other definitions of `D⁺` cited in §3.3 each carry a clause.
Minguzzi2019 says "for piecewise `C¹` causal curves". MinguzziCone2019 says "closed achronal `S`".
Chrusciel2011 says "the timelike variant", with line 1859 naming the causal one. HawkingEllis1973
§6.5 and ONeill1983 Ch. 14 are waived and could not be read, so they are left as they are.
ChristodoulouMiao2014 lines 866–872 were reopened. They define a development by past-directed
curves that terminate in the past on the initial domain. That is the future notion, so they need
no clause. BarGinouxPfaffle2007 line 3664 (Theorem 3.2.11, §6.1) cites a theorem, not the
definition, and is unaffected.

## Adversarial pass on the changed statements

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| F01 witness: `u − Ū ∈ H¹(ℝ³)` | `n = 3`, `N = 2`, `k = 1`; unit ball and shell `1 ≤ |x| ≤ 2` | ball: `|∇ϑ|² = π²(1 − t²)/|x|²`, `∫ = π²(4π − 4π/3) = 8π³/3 = 82.683`; shell: `|∇ϑ| ≤ π(|t| + (2 − r)/r) ≤ 2π`, bounded; `|u − Ū| ≤ 2`, support in `|x| ≤ 2`; the point singularity at `0` has zero capacity in `ℝ³` | in `H¹` | Check |
| F01 witness: approximant at `0` | radial `φ`, support in the unit ball, `ε ≤ 1` | sphere average of `(cos πt, sin πt)`: `(½[sin πt/π]₋₁¹, 0) = (0, 0)` (Archimedes: `t` uniform on `[−1, 1]`); Monte Carlo with `2·10⁵` points: `(0.0005, 0.0016)`; `|0| = 0 < 1/2` | `J_εu(0) ∉ G` | Check |
| F01 witness: the wrong route versus `Φ̃` | `Φ(y) = 1/|y|`, `δ = 1/4` | `K_δ = {3/4 ≤ |y| ≤ 5/4} ⊆ G = {1/2 < |y| < 2}`; `Φ(0)` undefined; `0 ∉ supp χ`, so `Φ̃(0) = 0` | `Φ̃` needed, and it suffices | Check, route |
| `χ = 1_{K_{3δ/4}} ⋆ ψ_{δ/8}` | `dist(y, K) ≤ δ/2`; `χ(y) ≠ 0` | first: `B(y, δ/8) ⊆ K_{5δ/8} ⊆ K_{3δ/4}`, so `χ(y) = 1`; second: `B(y, δ/8)` meets `K_{3δ/4}`, so `dist(y, K) < 7δ/8 ≤ δ`; `|D^jχ| ≤ ‖D^jψ_{δ/8}‖_{L¹} = (8/δ)^j‖D^jψ‖_{L¹}` | `χ = 1` near `K`, support in `K_δ`, constants are powers of `δ^{−1}` | route |
| `Φ̃` smooth on `ℝ^N` | `y ∈ G`; `y ∉ G` | on `G`, `χΦ` is a product of smooth maps; `supp χ ⊆ K_{7δ/8}` is compact and inside `G`, so `ℝ^N ∖ supp χ` is open, contains every `y ∉ G`, and `Φ̃ = 0` there; the two open sets cover `ℝ^N` | smooth, compact support | route |
| `Φ̃ ∘ u = Φ ∘ u` | `u(x) ∈ K` | `χ = 1` on `K ⊆ K_{δ/2}` | equal pointwise | route |
| derivative bounds of `Φ̃` | Leibniz, order `j ≤ max(1, k)` | `D^jΦ̃ = Σ_i binom(j, i) D^iχ D^{j−i}Φ`, `|·| ≤ Σ_i binom(j, i)(8/δ)^i‖D^iψ‖_{L¹} sup_{K_δ}|D^{j−i}Φ|` | depends on `Φ` on `K_δ` and `δ^{−1}` only, as stated | closing sentence |
| scalar case, pinned hypotheses | `Φ = s²`, `K = [0, 1]`, `Ū = 0` | `F(s) = Φ̃(s) = χ(s)s²` is `C¹`; `|F′| ≤ 2(1 + δ) + (8/δ)‖ψ′‖_{L¹}(1 + δ)²`, finite, so `‖deriv F t‖₊ ≤ M` holds; `Φ` itself has `|Φ′(s)| = 2|s|`, unbounded | the pinned rule applies to `Φ̃`, not to `Φ` | route |
| `2k > n`: approximants stay near `K` | `n = 1`, `k = 1` | `‖J_εw − w‖_∞ ≤ C‖J_εw − w‖_{H¹} → 0` (§4.2 with `2k > n`, §4.4 convergence) | in `K_δ` for small `ε` | Check's last sentence |
| §7.1 data clause, exponents | `2k > n + 2`: `n = 3`, `k = 3`; `n = 1`, `k = 2` | `2(k − 1) = 4 > 3`; `2 > 1`: the embedding of §4.2 at order `k − 1`, `j = 0`, applies; §4.4 loss bound at `k ≥ 1` | `‖J_εw − w‖_∞ ≤ C₁C₂ε‖w‖_{Hᵏ_Λ}` | route |
| §7.1 data clause, uniformity | `‖U₀ − Ū‖ ≤ M`; `M = 0` | `ε₀ = δ/(2C₁C₂M)` depends on `M`, `K` (through `δ`), `n`, `k`, `Λ` only, not on `U₀`; `M = 0`: `U₀ = Ū`, mollified data `Ū`, every `ε` works | as stated | route |
| §7.1 data clause, an instance with `G ≠ ℝ^N` | barotropic Euler, `G = {ρ > 0} × ℝⁿ`, `K ⊆ {ρ ≥ ρ_min}`, `δ < ρ_min` | mollified density `≥ ρ_min − δ/2 > 0` | the coefficients `c(ρ)`, `1/ρ` are evaluated in `G` | route |
| F02: `D(S)` versus `D⁺(S)` | Minkowski `ℝ^{1+1}`, `S = {0} × (−1, 1)`, `p = (−1/2, 0)` | future part of any inextendible causal curve through `p` reaches `t = 0` at `|x| ≤ 1/2 < 1`, so `p ∈ D(S)`; the past-inextendible curve `x ≡ 0`, `t ≤ −1/2`, misses `S`, so `p ∉ D⁺(S)` | the two sets differ | clause |
| F02: why "analogue" | same `S`, `p = (1/2, 0)`, and any `p` with `t_p ≥ 0` | every past-inextendible past causal curve from `(1/2, 0)` reaches `t = 0` at `|x| ≤ 1/2`, so it is in `D⁺(S)`; its future-inextendible half needs no intersection because the past half meets `S`, so it is in `D(S)`; for `S ⊆ Σ₀` and `t_p ≥ 0`, `p ∈ D(S)` iff `p ∈ D⁺(S)` | `D(S) ∩ {t ≥ 0} = D⁺(S)`: on the half-space the two notions agree, and the citation is apt with its clause | Slabs wording |
| BGP "inextendible" | line 883–884 | "no reparametrisation extends continuously to any of the end points" | both directions, as the clause says | — |

## Checks run

Dependency check (`gate --candidate … --only CompressibleEulerEquations`), after the last edit:

```text
candidate: CompressibleEulerEquations is not in the merge order yet; checked as if placed after MathematicalBilliards (the intake inserts it when its design is accepted)
depcheck: 245 roadmaps, 2229 edges, 0 problem(s)
```

No UPWARD or CYCLE line.

`roadmaps resolve` on the edited README found no cross-roadmap citation and no Lean name that is
missing everywhere. Lean names outside TauCetiRoadmap were not checked by the tool ("no pinned Lake
packages on this host"). No new library name was introduced this round, so there was nothing to
open at the pins. The worker's one lead, `LinearSystem.IsSymmetricHyperbolic`, no longer appears;
it is the SymmetricHyperbolicSystems supplier's declaration, as the earlier rounds and the review
established.

`plan.json` parses, and so does `sources.toml`. A pattern search of the added lines found no LaTeX
delimiters, process words or machine paths.

Elaboration and the `#check @name` comparison: not run, because the design stage has no
`Suggested.lean`.

No gate failures were listed for this round.

## Notes for the maintainer

- Ownership: nothing new is owned. The cut-off `Φ̃` is route text inside §4.3, and the §7.1 clause
  is route text built from §4.2 and §4.4. No supplier edge changed, no notion moved down, and the
  ownership checks of earlier rounds stand. Ownership against open pull requests was not
  re-searched this round because no new object was introduced.
- No id was renumbered or dropped, and no name that other roadmaps cite changed. No source is
  missing, so `needs-references.toml` was not created.
- The review's "For the human reviewers" section (two texts named LorentzianGeometry, the
  suppliers' absence from the merge order, Majda1984 uncertified, the LukNotes licence) lists no
  finding. Nothing was changed because of it.
- The review contained no instructions beyond its findings; nothing suspicious.
