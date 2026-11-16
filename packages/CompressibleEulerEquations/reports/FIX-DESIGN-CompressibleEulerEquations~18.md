# FIX-DESIGN-CompressibleEulerEquations~18

The review `REV-DESIGN-CompressibleEulerEquations~17` has three findings, all P3. All three are
correct and all three were applied. Each was also repaired as a pattern; the extra places are
named under each finding. The review's `## For the human reviewers` section lists no finding,
and nothing was changed because of it.

## F01 (P3) — applied

**Old → new.**

- Scope: "three special cases of Layer 4" → "six", adding, on the circle, the continuous
  representatives of `TauCeti.CircleSobolev s A`, its algebra property and the holomorphic
  action.
- The circle contract names the three declaration pairs, with lines and how each differs.
- §4.3 *Needs:* gains the two names.

**Verdict.** The finding is correct. At the Tau Ceti pin (`2fd255d`, the `lake-manifest.json`
pin and the plan's baseline):

- `TauCeti.CircleSobolev.norm_mul_le` (`Circle/Algebra.lean:288`): `‖ab‖ ≤ C_s‖a‖‖b‖` for `s > 1/2`
  and a complete normed `ℂ`-algebra `A`. The product is pointwise on representatives
  (`toContinuousMap_mul`, line 300).
- `TauCeti.CircleSobolev.toContinuousMap_nemytskii` (`Circle/Nemytskii.lean:431`): `F ∘ u` lies
  in `H^s` for `F` holomorphic on an open `U ∋ u(x)`.
- `analyticOnNhd_nemytskii` (line 441): `u ↦ F ∘ u` is analytic.

At integer `s = k ≥ 1` these are the case `n = 1`, `Λ = Tℤ`, `N = 2`, holomorphic `Φ` of the
§4.3 algebra property and of its composition statement, both membership and continuity. Two
details:

- The range of a continuous periodic `u` is compact, so `K = u(E)` works and any `Ū ∈ K` does.
- Constants lie in `Hᵏ_Λ` for full-rank `Λ`.

I added "integer order `s = k ≥ 1`" to the reviewer's wording. Without it the claim is too
broad, because the pinned statements also cover real `s`.

**Pattern.** By the same reasoning, `TauCeti.CircleSobolev.toContinuousMap` with
`norm_toContinuousMap_le` (`Circle/Basic.lean:807,831`) is the case `n = 1`, `j = 0` of the §4.2
embedding. So the count is six, not the reviewer's five. It is named:

- in the Scope sentence;
- in the contract;
- in the §4.2 *Needs:* remark, which sits beside the existing remark on
  `TauCeti.Wkp.norm_iteratedGradient_lowerOrder_le`.

I read the module docstrings of the other circle files: `ChainRule`, `Diffeomorphism`,
`FractionalPrecomp`, `Derivative`, `Multiplier`, `Laurent` and `HardyGraph`. They state
precomposition `u ∘ φ`, differentiation, smooth multipliers and Hardy theory. None of these is a
Layer 4 statement beyond the three cases above. A smooth multiplier is a special case of the
algebra property, and I list it under that.

Plan: target 4.2 gains `tauceti:TauCeti.CircleSobolev.toContinuousMap`, target 4.3.1
`…norm_mul_le` and target 4.3.2 `…toContinuousMap_nemytskii`. These follow the existing `W1p`
entries.

## F02 (P3) — applied

**Old → new.** New Boundaries bullet, **Commutators with mollifiers on the Bessel scale**:
ComplexKahlerGeometry §5.7's `[P, J_ε] : H^r → H^{r−1}` for second-order `P` with smooth
coefficients, and its multiplier bound, against §4.4's first-order `L²` lemma for Lipschitz
coefficients and §4.3's tame products (witness `a = |sin x|`). Nothing of that roadmap is
consumed.

**Verdict.** The finding is correct. ComplexKahlerGeometry/README.md on main (`51d880d`),
lines 1964–1968, plans exactly that commutator. It has the same content at the heads of the
two open pull requests that touch that roadmap: §5.7 at lines 1974 and 1911 there, with the
commutator and the multiplier bound unchanged.

Neither statement gives the other:

- For `P = a∂ᵢ` with smooth `a`, the §5.7 statement gives only `L² → H^{−1}`, not Friedrichs'
  `L² → L²`.
- Friedrichs' lemma says nothing about second-order operators.
- `a = |sin x|` is bounded, 1-Lipschitz and `2π`-periodic, with one-sided derivatives `±1` at
  `0`.

I added the multiplier bound of the same section in one clause. It is a neighbour of the §4.3
products: its constant `C_{f,s}` depends on `f`, while §4.3's constants are independent of the
factors.

**Pattern.** I searched the roadmaps for `Friedrichs`, `J_ε`, `regulari[sz]er` and
`commutator estimate`. Most hits are the Friedrichs extension or Poincaré–Friedrichs, which are
unrelated. One more neighbour exists: IncompressibleFlows Layer 3, item 6, plans the
DiPerna–Lions commutator estimate on the unit torus for `W^{1,p}` fields and `L^q` densities with
`1/p + 1/q ≤ 1`. At `p = ∞`, `q = 2` this covers Friedrichs' lemma for `Λ = (2πℤ)^n`, after
`y = x/2π`.

I added one sentence to the existing IncompressibleFlows Boundaries bullet. It says that §4.4
holds for every rank (`Λ = 0` and `Λ_cyl` included) and that nothing is consumed.
IncompressibleFlows stays a boundary, not a supplier, which is required since the brief forbids
citing it as one. Its Layer 10 paraproduct estimates are already covered by the Besov
"Fractional orders" boundary.

## F03 (P3) — applied

**Old → new.**

- §5.3: "a constant state `Ū`" → "… `Ū ∈ K`".
- §7.1: "a compact `K ⊆ G`" → "… containing `Ū`", plus a no-loss bullet; the route applies §5.3
  on `K_δ ∋ Ū`.
- §7.2 route: `K` adjoins `ρ₀`, or `(ρ₀, s₀)` for the full system; the last Check is extended.
- §4.3 gains a Check.

**Verdict.** The finding is correct. The §4.3 composition estimate assumes `Ū ∈ K`. The routes of
§5.3 (for `A⁰(U)⁻¹ − A⁰(Ū)⁻¹` and `A⁰(U)⁻¹F(U)`) and of §7.1 (through §5.3) used it without that
hypothesis.

Recomputed:

- With `Φ = y³`, `K = {0}`, `δ = 1`, `u ≡ 0`, `Ū = a` on `Λ = 2πℤ`, the ratio is `a³/a = a²`. That
  is `4` at `a = 2` and `100` at `a = 10`, while `Φ` on `K_δ = [−1, 1]` and the secant constant
  `max(3, 0) = 3` stay fixed.
- For `K ∪ {10}` the constant is `max(3·11², 2·1000) = 2000 ≥ 100`.

The stated theorems lose nothing, because every compact `K ⊆ G` can be enlarged by `Ū ∈ G`. In
§7.1 the old `K = ∅` case had no data, since `E ≠ ∅`.

**Pattern.** I checked every use of a compact set together with a background state:

- §7.3 applies §7.1 to the switched system on `K′ × [0, 1]`, which contains `(Ū, 0)` because
  `θ = 0`. The route now says so.
- §6.1 and §2.1 (difference bound) use a compact `K` without a background state.
- §8.3 cites the hypotheses of §7.2, and those are unchanged. Only the route's `K` changed.

Every Check of §§4.3, 5.3, 7.1, 7.2 and 7.3 already has `Ū ∈ K`, or its `K′`.

Plan:

- 5.3 and 7.1 gain the hypothesis `Ū ∈ K` in their statements and hypothesis lists.
- 7.2's route has the new sets, and its test `full_background_outside_states` is extended.
- 4.3.2 gains the test `background_outside_K`.

## Adversarial pass on the changed text

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| Circle embedding = §4.2 at `n = 1`, `j = 0` | `T = 2π`, `s = k = 1`, `u = cos x` | `2k = 2 > 1 = n + 2j`. Circle norm² `2` (§4.1 Check). Constant `√(Σ(1+|m|)^{−2}) = √(π²/3 − 1) = 1.513`. Bound `1.513·√2 = 2.140 ≥ sup|cos| = 1` | holds |
| Circle algebra = §4.3 algebra at `n = 1` | `cos x · cos x = (1 + cos 2x)/2`, `s = 1` | Coefficients `1/2`, `1/4`, `1/4`. Norm² `1/4 + 2·9·(1/16) = 11/8`, so the norm is `1.173`. Bound `2²·1.513·√2·√2 = 12.1`. §4.3 needs `2k = 2 > 1` | holds |
| Nemytskii = §4.3 composition, `N = 2`, holomorphic `Φ` | `F = 1/z`, `U = ℂ∖{0}`, `u = 2 + cos x`; `u = cos x`; `Φ(y) = |y|²` on `ℝ²` | `u ∈ [1, 3] ⊆ U`, so `1/(2 + cos x)` lies in both. `cos x` hits `0 ∉ U`, so both are excluded. `|y|² = z z̄` is not holomorphic: covered by §4.3 only | consistent; §4.3 strictly more general in `Φ` |
| Integer-order qualifier | `s = 3/4` | pinned: yes. §4.3 has integer `k` only, so `s = 3/4` is not a case of §4.3 | qualifier needed (added) |
| F02 boundary: neither gives the other | `a = |sin x|`; `P = sin x·∂ₓ` | `|sin|` is 1-Lipschitz, `‖a‖_∞ = 1`, derivatives `±1` at `0`, so §4.4 applies and §5.7 does not. For smooth `a`, §5.7 at order ≤ 2 gives `H⁰ → H^{−1}` only, while §4.4 gives `L² → L²` | holds |
| Multiplier vs tame product | `n = 3`, `k = 1`, `w ∈ H¹(ℝ³)` unbounded, `f = χ` | §4.3 needs `w ∈ L^∞` and is silent; §5.7 gives a bound. For `f_m = χ sin(mx)`, `C_{f_m,1}` must grow like `m`, while §4.3's `C` does not depend on `f` | differ as stated |
| DiPerna–Lions at `p = ∞`, `q = 2` | exponent condition | `1/∞ + 1/2 = 1/2 ≤ 1`, and `L^r` with `1/r = 1/2` gives `L²`. `b = a eᵢ` gives `b·∇ = a∂ᵢ` | covers the full-rank case |
| §4.3 Check `Ū ∈ K` | `a = 2`, `10`; `K ∪ {10}` | ratios `4`, `100` against `3`. `K'_δ = [−1,1] ∪ [9,11]`: `sup 3y² = 363`, `2 sup|Φ| = 2000` | the hypothesis is needed and the enlargement suffices |
| §5.3 with `Ū ∈ K` | forcing Check; source Check; `F(u) = −u`, `K = [−1, 1]`, `Ū = 0` | `Ū = 0 ∈ [−1,1]`, `0 ∈ [0,2]`. `U = e^{−t}u₀`, `dE₀/dt = −2E₀ ≤ C E₀` | holds |
| §7.1 with `Ū ∈ K` | Burgers `−e^{−λ²x²}`, `K = [−1,0]`; `K = ∅` | `0 ∈ K`, `T* = 1.1658/λ`. With `K = ∅` there are no data, since `E ≠ ∅`, so nothing is lost | holds |
| §7.2 barotropic `K` | `Λ = 2πℤ`, data `(1, 0)`, background `(5, 0)`; `Λ = 0` simple wave | `‖−4‖² = 16·2π = 32π`. `{1, 5} × B̄(0, CM)` is compact, lies in `(0,∞) × ℝ` and contains `(5, 0)`. Simple wave: `[ρ_*, ρ^*] = [1, 3/2] ∋ ρ₀ = 1`, so `K` is unchanged. For `Λ = 0`, `ρ₀` is in the closure of the range | holds |
| §7.2 full `K` | `𝒪 = (0,∞) × (0,1)`, data `(1, 0, 1/2)`, `L = {(1, 1/2)}`, background `(1, 0, 1/4)` | `s̄ − 1/4 = 1/4`, squared norm `π/8`. `(1, 1/4) ∈ 𝒪 ∖ L`. `K = {(1,1/2), (1,1/4)} × B̄(0, CM)` (as triples) is compact, lies in `G` and contains `Ū` | holds |
| §7.2 time dependence | the dependence list | `K` depends on `[ρ_*, ρ^*]`, `ρ₀`, `v₀`, `M` and `C(n, k, Λ)`, all of which are in the statement's list | consistent |
| §7.3 route | `G = (0,2)`, `Ū = 1`, `K = {3/2}` | `K′ = [1, 3/2] ∋ 1`, so `(1, 0) ∈ K′ × [0, 1]` | holds |

## Checks run

**Dependency check** (the brief's command, run after the last edit):

```text
candidate: CompressibleEulerEquations is not in the merge order yet; checked as if placed after MathematicalBilliards (the intake inserts it when its design is accepted)
depcheck: 235 roadmaps, 2226 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line.

**Other checks.**

- **Citations** (`roadmaps resolve` on the edited README): no cross-roadmap citations or Lean
  names were found missing. The tool did not check Tau Ceti names on this host. So I checked all
  six new `TauCeti.CircleSobolev.*` names by script at their stated lines in the pinned checkout:
  all match, in namespace `TauCeti.CircleSobolev`.
- **New cross-roadmap citations** were checked on main and at the open heads:
  - ComplexKahlerGeometry §5.7 is kept, with the same content, at both open heads that touch it.
  - IncompressibleFlows Layer 3 was read at its open head.
- **`plan.json`** parses: 54 targets, `gaps: []`.
- **`Suggested.lean`**: there is none at the design stage. Nothing was elaborated, and no
  `#check` comparison was possible.
- **`sources.toml`**: unchanged, since no new source is cited. `needs-references.toml` was not
  written.
- **Ownership**: no new object was introduced. Both additions are boundary statements that
  consume nothing. Ownership against open pull requests was checked with
  `roadmaps grep`/`show`.

## For the maintainer

- No id, heading, section number or target name changed.
- Plan targets 5.3 and 7.1 have the extra hypothesis `Ū ∈ K`. No statement of §7.2 or §8.3
  changed; only §7.2's route set did.
- No other roadmap cites this one, because it is not yet on main.
- No text read during this round contained instructions.
