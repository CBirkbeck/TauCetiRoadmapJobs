# FIX-PKG-HardSphereDynamicsAndKineticLimits~2

One review: REV-PKG-HardSphereDynamicsAndKineticLimits, three findings (F01 P1, F02 P3, F03 P3). All three were checked against the roadmap's definitions and the pinned libraries, and all three are right. Every repair is in `packages/HardSphereDynamicsAndKineticLimits/Suggested.lean` and `packages/HardSphereDynamicsAndKineticLimits/README.md`. `metadata.toml`, `sources.toml` and `design/plan.json` are unchanged: no supplier gap is needed, and `gaps` stays `[]`.

## F01 (P1) — applied

**Changed.** In `HardSphere.weak_liouville`: `∫ t in Ioi 0, ∫ Z, W₀ (flow ε (-t) Z) * Lφ t Z + ∫ Z, W₀ Z * φ 0 Z = 0` → `(∫ t in Ioi 0, ∫ Z, W₀ (flow ε (-t) Z) * Lφ t Z) + ∫ Z, W₀ Z * φ 0 Z = 0`. README §8.2 already had the correct grouping and is unchanged.

**Evidence.** In Mathlib's `∫ x, r` notation the body is parsed at precedence 60, so it absorbs a following `+` (precedence 65). A scratch copy of the file elaborates `example … : ((∫ t in Ioi 0, ∫ Z, f t Z + ∫ Z, c Z) = 0) = ((∫ t in Ioi 0, ∫ Z, (f t Z + ∫ Z', c Z')) = 0) := rfl`. For `N ≥ 1` and `d ≥ 1` the phase space has infinite measure. So when `c = ∫ W⁰ φ(0) ≠ 0` the inner integrand is not integrable and the old statement collapses to `0 = 0`. The README's non-specular Check, which has `c ≈ −1`, satisfies the old statement and refutes the new one, as it should.

**Pattern.** I read every other integral at its elaborated type (`#check`, below), in the ten other theorems and in `partitionFunction`, `correlation`, `collisionOperator`, `IsMildBoltzmannSolution` and `LanfordStatement`. In each, the integral is the last term, is closed by `∂μ`, or sits inside parentheses, a `fun` or `|·|`. No other integral swallows a later term.

## F02 (P3) — applied

**Changed.**
- Lean: deleted `hε` and `hερ` from `flow_add` and `flow_reversal`, and `[IsFiniteMeasure (volume : Measure X)]` from `grandCanonical_flow_invariant`; updated their docstrings.
- README: the Conventions, §5.3, §5.5, §7.1 and §7.3 now state time translation, time reversal, the group law and reversibility for every real ε. §9.4 is now stated "on every flat position space". Three new Checks; §7.1's *Needs:* adds §5.3.

**Evidence.**
- Group law (`flow_add`): time translates of trajectories on ℝ are trajectories for every ε, because conditions (1)–(7) of §5.1 are invariant under translation of time. Trajectories are unique for every ε (`IsTrajectory.eqOn`). Off `G` all three maps are the identity.
- Reversal (`flow_reversal`): time reversal of trajectories holds for every ε. For `0 < ε < ρ`, `σ_M` is linear and an involution and exchanges incoming and outgoing pairs. For ε ≤ 0 or ε ≥ ρ every contact normal is `ε⁻¹ • ℓ = 0`: no lift of norm `ε ≥ ρ` lies in `B(0, ρ)`, and `ℓ(0) = 0`. So condition (5) forbids contacts, `σ_M = id` and ℛ is `(X, V) ↦ (X, −V)`. `G` is invariant under the involution ℛ.
- Invariance (`grandCanonical_flow_invariant`): the `N`-th density `(μ^N/(N! Z)) c^N (2π/β)^{dN/2} Π M(v_i) 1_𝒟̄` has the §9.2 form `Φ(H, P) 1_𝒟̄` for every `Z ∈ [1, ∞]`. When `μ_X(X) = ∞` and `μ c > 0`, the `N = 1` term `μ c (2π/β)^{d/2} μ_X(X)` is `∞` and the measure is 0. Measurability of the flow (part of `MeasurePreserving`) needs §7.1 under `0 < ε < ρ`, so `hε` and `hερ` stay.

**Pattern.** The other theorems keep `0 < ε < ρ`, because their stated routes need it:
- `measurePreserving_flow`, `volume_hardCoreSet_diff_goodSet` and `weak_liouville` go through §6.4.
- `lintegral_sum_distinct_eq_correlation` goes through §7.2 and §8.1.
- `boltzmannGrad_scaling` uses the ball volume at radius ε < ρ.

The other "finite measure" assumptions in the README are needed and stay: §9.2 normalises the canonical measure by `Z^{can}`, and the §9.5 bound uses `K = μ_X(X)(2π/β₀)^{d/2}`.

## F03 (P3) — applied

**Changed.** README only:
- The Tau Ceti contract bullet for `empiricalMeasureOfFintype` now also names `empiricalFiniteMeasure` and `card_smul_empiricalFiniteMeasure`.
- §10.1 adds `π_t = μ⁻¹ N · empiricalFiniteMeasure (T_t Z)` for every N ≥ 0.
- The first Check now covers every N ≥ 0, with the values at N = 0 and at N = 2. The third Check now says why the finite form is used.
- §10.1's *Needs:*, the Layer 10 Dependencies and the Scope paragraph are updated.

No Lean change.

**Evidence.** In the pinned `TauCeti/Probability/Process/EmpiricalMeasure.lean`:
- `empiricalFiniteMeasure` (line 58) is the zero measure for an empty family.
- `card_smul_empiricalFiniteMeasure` (line 75) gives `card κ • empiricalFiniteMeasure x = Σ_i δ_{x i}` with no nonemptiness hypothesis; at N = 0 it reads `0 • 0 = 0 = Σ_∅`.
- `empiricalMeasureOfFintype` (line 224) is built on `empiricalFiniteMeasure`.

## Checks

**Elaboration.** `lake env lean packages/HardSphereDynamicsAndKineticLimits/Suggested.lean`, run from the content checkout: exit 0 in 9.7 s. There are 11 warnings, all `declaration uses 'sorry'`, at lines 256, 268, 288, 295, 307, 319, 362, 384, 396, 448 and 495. No `TauCeti.*` import, so nothing had to be built first.

**Signatures.** I copied the file to scratch, appended `#check @name` for all 31 named declarations plus the parse test above, and elaborated it once (exit 0). I compared each elaborated type with the README:
- `flow_add`: `∀ {d X} [NormedAddCommGroup X] [ProperSpace X] [MeasureSpace X] [BorelSpace X] [FlatPositionSpace d X] {ε N} (s t), flow ε (s + t) = flow ε s ∘ flow ε t`. This matches §7.1, for every ε.
- `flow_reversal`: the same instance binders, `{ε N} (t) (Z), flow ε t (reversal ε Z) = reversal ε (flow ε (-t) Z)`. This matches §7.3.
- `grandCanonical_flow_invariant`: the instance binders, `0 < ε → ofReal ε < radius → …`, with no finite-measure binder. This matches §9.4.
- `weak_liouville`: conclusion `(∫ t in Ioi 0, ∫ Z, W₀ (flow ε (-t) Z) * Lφ t Z) + ∫ Z, W₀ Z * φ 0 Z = 0`. This matches §8.2.

Every other type is unchanged and agrees with the README. The definitions `partitionFunction`, `grandCanonicalDensity` and `grandCanonical` keep only `[NormedAddCommGroup X] [MeasureSpace X]`, which is all their README statements assume ("every real ε, every μ ≥ 0, every f⁰"). The signature tool's "lost binder" leads are false positives.

**Dependency direction.**

    depcheck: 245 roadmaps, 2287 edges, 0 problem(s)

There is no UPWARD, CYCLE or moved line.

**Citations.** `roadmaps resolve` on the README: no cross-roadmap citation and no Lean name found nowhere, apart from this roadmap's own `Suggested.lean` names, which are all declared. The two new Tau Ceti names were read at the pin (lines 58 and 75).

**Gate failures.** None were listed for this round.

## Adversarial pass (statements added or changed)

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `weak_liouville`, repaired grouping | §8.2 fourth Check (non-specular φ, d = 1 box) with χ(0) = 1 | `c = ∫W⁰φ(0) = ∫W⁰ v_1 ≈ −1 ≠ 0`. Old form: inner integrand non-integrable, `0 = 0` holds. New form: left side `−1 ≠ 0`, so `hspec` is needed | new form discriminates | parenthesised |
| same | φ = χ(t)ψ(H) (§8.2 first Check) | `(∫_0^∞ χ')∫W⁰ψ(H) + χ(0)∫W⁰ψ(H) = (−χ(0) + χ(0))·… = 0` | holds | — |
| same | N = 0 (phase space a point of mass 1, W₀ = w) | `w∫_0^∞ φ' + wφ(0) = −wφ(0) + wφ(0) = 0` | holds | — |
| `flow_add`, every ε | ε = −1, d = 1, N = 2, x = (1, 0), v = (−1, 0) | `T_3`: positions (−2, 0); `T_1 T_2`: (−1, 0) then (−2, 0) | holds | Check added |
| same | unit circle, ε = 1/2 = ρ, N = 2 | 𝒟̄_2 = antipodal pairs; short lift 0; condition (5) reads `0 < 0`; G = ∅; T_t = id | holds | Check added |
| same | ε = 0, d = 1, N = 2, x = (1, 0), v = (−1, 0) | paths coincide at t = 1, normal `0⁻¹·ℓ(0) = 0`, Z ∉ G, all maps fix Z | holds | — |
| same | ε = 1, head-on witness | `T_2`: positions (1, 0), (−1, 0), velocities 0, (−1, 0); then `T_1`: (1, 0), (−2, 0) = `T_3 Z` | holds | — |
| `flow_reversal`, every ε | ε = −1, same data, t = 2 | `T_2(ℛZ) = T_2(1, 0; 1, 0) = (3, 0; 1, 0)`; `ℛ(T_{−2}Z) = ℛ(3, 0; −1, 0) = (3, 0; 1, 0)` | holds | Check added |
| same | unit circle, ε = 1/2, N = 2 | σ_M = id (normal 0), ℛZ = (X, −V) ∉ G; both sides ℛZ | holds | Check added |
| same | ε = 0, d = 2, x = ((1, 0), 0), v = ((−1, 0), 0) | Z ∉ G (coincidence at t = 1); ℛZ has relative motion (1, 0) + s(1, 0), which hits 0 at s = −1, so ℛZ ∉ G; both sides ℛZ | holds | — |
| same | non-matching contacts, 0 < ε < ρ (three collinear spheres, §3.2) | σ_M = id, Z and ℛZ ∉ G (condition (4)), both sides ℛZ | holds | — |
| Conventions: σ_M = id for ε ≤ 0, ε ≥ ρ | ε < 0; ε = 0; ε ≥ ρ | no contacts; normal `0⁻¹ • 0 = 0`; `‖ξ‖ = ε ≥ ρ` has no lift in B(0, ρ) since `‖π a‖ ≤ ‖a‖`, so ℓ = 0; `scatter 0 = id` | holds | stated |
| `grandCanonical_flow_invariant`, no finiteness | X = E, d = 1, μ = c = β = 1, u = 0 | N = 1 term `√(2π)·∞ = ∞`, Z = ∞, densities `x/∞ = 0`, measure 0, `map f 0 = 0` | holds | Check added |
| same | μ = 0 (any X) | `0^0 = 1`, `0^N = 0` for N ≥ 1, Z = 1, the measure is the Dirac mass at the empty configuration, which the flow fixes | holds | — |
| same | unit torus, f⁰ = M_{1,0} | Z ≤ e^μ finite, density `Φ(H, P)1_𝒟̄`, §9.2 applies | holds | — |
| §9.4 N = 1 term formula | general | `μ ∫_X∫_E c e^{−β|v−u|²/2} = μ c μ_X(X)(2π/β)^{d/2}` (Tonelli; μ_X is σ-finite: X is proper and balls of radius < ρ have finite measure) | holds | stated |
| §10.1 `π_t = μ⁻¹ N · empiricalFiniteMeasure` | N = 0; N = 2, μ = 1, points a ≠ b; μ = 0 | `0 · 0 = 0 = Σ_∅`; `2·(δ_a + δ_b)/2 = δ_a + δ_b`, mass 2 (1 without the factor N); μ = 0 gives `0⁻¹ = 0` as in `empirical` | holds | Check rewritten |

## Ownership and overlaps

No new object or target was introduced. The repairs restate three existing theorems more generally and add one Tau Ceti citation, so no ownership question arises. `scratch/overlaps.md` lists no open pull request that changes this roadmap, no dropped id and no second copy. `roadmaps grep` for `flow_add`, `flow_reversal`, `grandCanonical_flow_invariant` and `weak_liouville` finds no match outside this roadmap, on main or in any open roadmap pull request.

## For the maintainer

- No declaration was renamed. Three signatures lost hypotheses: `HardSphere.flow_add` and `HardSphere.flow_reversal` (no `hε`, `hερ`), and `HardSphere.grandCanonical_flow_invariant` (no `IsFiniteMeasure`). `HardSphere.weak_liouville` changed its conclusion's grouping. No other roadmap cites these names.
- `measurePreserving_flow` probably also holds for ε ∉ (0, ρ), by a separate degenerate argument: the flow is free transport on an invariant Borel set and the identity elsewhere. Its route goes through Alexander's theorem (§6.4), which fails there, so the hypothesis stays, as the review also concluded.
- No source was fetched, and `needs-references.toml` was not written: every locator used here was already in the manifest or is a pinned declaration.
