# FIX-RT-HardSphereDynamicsAndKineticLimits~1

Two red-team reviews: RT-HardSphereDynamicsAndKineticLimits~1a (F01 P2, F02–F06 P3) and RT-HardSphereDynamicsAndKineticLimits~1b (F01 P2, F02–F05 P3). I checked every finding against the cited sources (GST2013, BGSS2023, DengHaniMa2024 in the sources cache), the roadmap's own Lean definitions and the pinned Mathlib. All eleven are right.

Two pairs report the same defect and are settled once: ~1a/F03 with ~1b/F03, and ~1a/F05 with ~1b/F05. ~1a/F01 and ~1b/F02 touch the same sentences but make different claims, so they have separate sections; one rewrite settles both.

Edited files: `packages/HardSphereDynamicsAndKineticLimits/README.md`, and the docstrings of `packages/HardSphereDynamicsAndKineticLimits/Suggested.lean`. No Lean statement, binder or name changed. `metadata.toml`, `sources.toml` and `design/plan.json` are unchanged (`gaps` stays `[]`).

## RT-HardSphereDynamicsAndKineticLimits~1a/F01 (P2) — applied

**Changed.** The hand-off of the proof of `HardSphere.LanfordStatement` is now restricted to `d ≥ 2`, and a Check records that the proposition is false for `d = 0`:
- README Scope: the BBGKY roadmap's end theorem is the proposition "for every `d ≥ 2`"; the proposition is defined for every `d` and is false for `d = 0`.
- README Downstream consumers: "would prove `HardSphere.LanfordStatement d` for every `d ≥ 2`".
- Lean module docstring and `LanfordStatement` docstring: "for `d = 0` it is false".
- New Check in §10.4 with the witness.

**Witness recomputed in the Lean definitions.** At `d = 0`:
- `UnitFlatTorus 0`, `E` and the phase space are points of mass 1. The fundamental domain of the empty basis is everything, and `volume` on `EuclideanSpace ℝ (Fin 0)` is the empty product.
- `Real.toNNReal (ε⁻¹ ^ (0 - 1)) = 1`.
- `hardCoreSet ε N = ∅` for `N ≥ 2` and ε > 0, so `partitionFunction = 1 + 1 = 2` for `f⁰ = 1`, and `correlation … 1 t = 1/2`.
- `(volume : Measure E).toSphere` lives on the empty sphere, so `collisionOperator = 0`. Every mild solution is therefore `1` at the single point.
- So `∫ F_1 · 1 = 1/2 ↛ 1`.

**Pattern.** The same `d` hole appears in four more places:
- Summary: "for the roadmaps that prove it" now reads "whose proof for `d ≥ 2` is not part of this roadmap".
- Conventions: "and is false for `d = 0`".
- §10.4 API: "At `t = 0` every conclusion holds" was also false at `d = 0` (it gives `1/2` against `1`). It now reads "For `d ≥ 1`, … for every mild solution with datum `f⁰` …; for `d = 0` it fails".
- §9.6 consequence: now "for `d ≥ 1`" (see ~1b/F01).

## RT-HardSphereDynamicsAndKineticLimits~1b/F02 (P3) — applied

**Verified.** `roadmaps grep -i` for `BBGKY`, `Lanford` and `Boltzmann equation` finds no match on main or in any open roadmap pull request. Among the board packages, only this one matches.

**Changed.** The claims that the proposition is proved by "the roadmap on the BBGKY hierarchy" are gone:
- Lean module docstring: "its proof … is outside this roadmap".
- `LanfordStatement` docstring: "whose proof is outside this roadmap".
- §10.4: "Its proof for `d ≥ 2` is not part of this roadmap (Scope and ownership)".
- Scope: "is the subject of a later roadmap on the BBGKY hierarchy (Downstream consumers)".
- Downstream consumers: "would prove".

The Summary's "for the roadmaps that prove it" is replaced in the same way (shared with ~1a/F01).

## RT-HardSphereDynamicsAndKineticLimits~1a/F02 (P3) — applied

**Verified.** DengHaniMa2024 lines 182–183 give existence and uniqueness only off a closed null set, on Euclidean space with `d ≥ 2`. GST2013 lines 848–854 define pathological trajectories and state no uniqueness.

**Changed.**
- README §5.2: the parenthesis "(DengHaniMa2024 lines 182–188; GST2013 lines 848–854)" is replaced by a sentence. It says that uniqueness at every state, for every real ε and every interval, and gluing are proved here and stated in neither source, and what each locator does contain.
- `IsTrajectory.eqOn` docstring: changed the same way.

**Pattern.** The other uses of lines 182–188 (§6.4 and the `volume_hardCoreSet_diff_goodSet` docstring) cite Alexander's theorem, which is at that locator. They are unchanged.

## RT-HardSphereDynamicsAndKineticLimits~1a/F03, RT-HardSphereDynamicsAndKineticLimits~1b/F03 (P3) — applied

**Verified.** BGSS2023 lines 211–214 impose the limit `E(N) ε^{d−1} → 1` as a normalisation. DengHaniMa2024 lines 246–249 give `≈ 1` up to `O(ε)`. Neither has the two-sided bound or the constant.

**Changed.** README §9.6 and the `boltzmannGrad_scaling` docstring now attribute:
- the limit to BGSS2023 (1.1.8), lines 211–217;
- the `O(ε)` error to DengHaniMa2024 (1.12), lines 246–252;
- the bound with `ω_d ‖ρ⁰‖_∞` to this roadmap: it is proved here and is stated in neither source.

## RT-HardSphereDynamicsAndKineticLimits~1a/F04 (P3) — applied

**Verified.** GST2013 line 841 and BGSS2023 line 139 use `> ε`. DengHaniMa2024 (1.1), line 153, uses `≥ ε`.

**Changed.** The `hardCoreSet` docstring now cites DengHaniMa2024 (1.1), lines 150–153, for the closed set. It notes that GST2013 and BGSS2023 use the open set, which differs from it by a null set for `0 < ε < ρ` (§3.1 API).

**Pattern.** README §3.1 cited all three sources for both sets. It now separates them: the closed set cites DengHaniMa2024 (1.1); the open set cites GST2013 and BGSS2023.

## RT-HardSphereDynamicsAndKineticLimits~1a/F05, RT-HardSphereDynamicsAndKineticLimits~1b/F05 (P3) — applied differently

**Changed.** The §9.6 *Needs:* line "§1.4, §8.4, §9.3, §9.5" now reads "§1.1, §3.1, §9.3, §9.5, Mathlib `EuclideanSpace.volume_ball`".

**Why it differs from both suggestions.**
- §1.1 is added, as both reviews ask: the route takes the ball volume from it.
- §1.4 (shells and packing) and §8.4 are dropped, as ~1b asks. The route uses neither directly; §8.4 enters only inside §9.5.
- §3.1 is added: the identity factors `1_{𝒟̄_{n+p}}(Z_n, Z')` into `1_{𝒟̄_n} 1_{𝒟̄_p} Π 1{‖x_i − x'_k‖ ≥ ε}`.
- `EuclideanSpace.volume_ball` is added for `vol(B(0, ε)) = ω_d ε^d`. It exists at the pin, `Mathlib/MeasureTheory/Measure/Lebesgue/VolumeOfBalls.lean:308`.

## RT-HardSphereDynamicsAndKineticLimits~1a/F06 (P3) — applied

**Changed.** The first Check of §4.4, "`s = 0`: `B_0` is the identity …", is replaced by the computed `d = 1` Check:
- ε = 1, `s = 4`, rectangle `a ∈ (2, 3)`, `u ∈ (−1, −1/2)`.
- `D = u² > 0`, and `τ = (a − 1)/(−u) < 4`.
- `B_4 = (2 − a − 4u, −u)`, of determinant 1. The image lies in `{a > 1}` and has area `1/2`.

I added one clause: the totally inelastic rule sends the whole rectangle to the single state `(1, 0)`. So the Check separates the right model from the wrong one.

## RT-HardSphereDynamicsAndKineticLimits~1b/F01 (P2) — applied

**Changed.**
- §9.6 now assumes `μ > 0` and a measurable `f⁰` with `∫ f⁰ < ∞`. These give `1 ≤ Z ≤ exp(μ∫f⁰) < ∞` and a probability measure (§9.3). The consequence now reads "for `d ≥ 1` …, in the scaling `μ_ε = ε^{−(d−1)}`".
- New negative-control Check in §9.6.
- Check of §9.5: "`ε = 0`, `μ > 0`, `∫ f⁰ = 1` …; for `μ = 0`, `n ≥ 1`, `F_n(0) = 0`".
- Check of §10.5: "for every `μ > 0` and every finite mass".

**Evidence.**
- `μ = 0`: `((0:ℝ≥0∞)^n)⁻¹ = ∞`, and every `W_{n+p}` is 0, so `F_n = ∞ · 0 = 0`, while `p_ε = 1`.
- `Z = ∞`: the measure and `F_n` vanish. The bound then reads `0.1 ≤ 0.02`.

**One correction to the witness.** In the infinite-mass instance the identity itself holds trivially: `p_ε = 0` under the zero measure. Only the bound fails there, and the Check says so. `boltzmannGrad_scaling` is unaffected: there `μ_ε > 0` and `∫ f⁰ = 1`.

## RT-HardSphereDynamicsAndKineticLimits~1b/F04 (P3) — applied

**Changed.** README Conventions now say that the exponent `d − 1` is a natural number. So at `d = 0` the Lean expression is `ε⁻¹ ^ 0 = 1`, not ε (1 against 0.1 at ε = 0.1). The scaling is used only for `d ≥ 1` and `d ≥ 2`, where the two expressions agree (1 at `d = 1`; 100 at `d = 3`, ε = 0.1). The `d = 0` Check of §10.4 uses this value.

## Adversarial pass on the changed statements

| Statement | Instances | Values (left / right) | Result |
|---|---|---|---|
| §9.6 identity, `μ > 0`, `∫f⁰ < ∞` | `d = 0`, `μ = 2`, `∫f⁰ = 1`, `n = 1` | `Z = 3`; `F_1 = f⁰/3`; `f⁰ p_ε = f⁰ · (1/3)` | holds |
| same | `n = 0` | `F_0(0) = Σ_p P(N = p) = 1`; `1 · 1 · p_ε(∅) = 1` | holds |
| same | `μ = 0` (excluded) | `F_1 = 0` / `M(0) = 0.39894` | fails: hypothesis needed |
| same | `Z = ∞` (excluded) | `0 = 0.1 · 0` (identity holds) | identity holds trivially |
| §9.6 bound | `d = 0`, `μ = 2`, `m = 1` | `(2/3) f⁰ ≤ 2 f⁰` | holds |
| same | `Z = ∞`, `v = 0.5` | `0.1` / `0.02` | fails: hypothesis needed |
| §9.6 consequence, `d ≥ 1` | `d = 1`; `d = 3`, ε = 0.01; `d = 0` (Lean μ = 1) | bound `2nε‖ρ⁰‖ → 0`; `ω_3 ε = 0.0419`; `F_1 = f⁰/2 ↛ f⁰` | `d ≥ 1` needed |
| §9.5 Check, `ε = 0` | `μ = 2`, `∫f⁰ = 1`; `μ = 0`, `n = 1`; `μ = 0`, `n = 0` | `Z = e²`, `F_n = (f⁰)^{⊗n}`; `0`; `F_0 = 1 = (f⁰)^{⊗0}` | as stated |
| §10.5 Check, Poisson | `μ = 2`, `∫f⁰ = 1`, `h = 1`; infinite mass | `Var = 1/2 = μ⁻¹∫f⁰`; `F_1 = F_2 = 0` | as stated |
| `LanfordStatement 0` (new Check) | `f⁰ = 1`, `C₀ = 1`, β₀ = 1 | `Z = 2`, `∫F_1 = 1/2`; `∫f(t) = 1` | false: Check correct |
| §10.4 API at `t = 0` | `d = 1`; `d = 2`; `d = 0` | `‖F_1(0) − f⁰‖_{∞,K} ≤ 2εC₀²(2π/β₀)^{1/2} → 0`; `≤ πεC₀²(2π/β₀) → 0`; `1/2` against `1` | `d ≥ 1` needed |
| Conventions `μ_ε` | `d = 0, 1, 3`, ε = 0.1 | `1` / `0.1`; `1` / `1`; `100` / `100` | as stated |
| §4.4 new Check | corners `(2, −1)`, `(3, −1/2)`, `(2.5, −0.75)` | `τ = 1, 4⁻, 2`; images `(4, 1)`, `(1⁺, 1/2)`, `(2.5, 0.75)`; area `1/2` both sides; inelastic image area 0 | correct |
| §9.6 `*Needs:*` | route items | ball volume (§1.1 and `EuclideanSpace.volume_ball`); factorisation of the hard-core indicator (§3.1); `Z`, measure (§9.3); `F_n` and identity `n = 1` (§9.5) | complete |

The corner `(3, −1/2)` is a limit point, not in the open rectangle: `τ → 4` and the image tends to `(1, 1/2)`. This is consistent with the open image lying in `{a > 1}`.

## Checks run

- **Elaboration.** `lake env lean packages/HardSphereDynamicsAndKineticLimits/Suggested.lean`, run from the content checkout: exit 0. The only output is 11 `declaration uses 'sorry'` warnings, at lines 261, 273, 293, 300, 312, 324, 367, 389, 403, 455 and 503. No `TauCeti.*` import.
- **Binders.** I put `#check @name` for all 31 named declarations into one scratch copy and elaborated it once: no error. With docstrings stripped, the code is identical to the version before this round, so every elaborated type is unchanged.
  - Each theorem carries `[FlatPositionSpace d X]` and `[MeasureSpace X]` where its body uses them.
  - `hardCoreSet`, `scatter`, `partitionFunction`, `grandCanonicalDensity` and `grandCanonical` keep fewer instances, as their README statements do.
  - So the 23 "lost binder" leads in `signatures.md` are false.
- **Dependency check.**

      depcheck: 251 roadmaps, 2381 edges, 0 problem(s)

  No UPWARD, CYCLE or `moved:` line.
- **Citations.** `roadmaps resolve` on the README lists no cross-roadmap citation and no Lean name found nowhere. The 26 leads listed earlier were this roadmap's own declarations, all declared in `Suggested.lean`.

## For the maintainer

- **Names.** No Lean name changed; no other roadmap cites anything that moved. No new construction was added, so ownership is unchanged; the reviewers' ownership greps found no second owner. No new source was needed, and `needs-references.toml` was not written.
- **Lanford's theorem.** The proposition `HardSphere.LanfordStatement d` is still defined for every `d`. The README now says it is false for `d = 0`. Its truth for `d = 1` is not claimed anywhere.
- **Untrusted text.** Neither review contains instructions addressed to the worker.
