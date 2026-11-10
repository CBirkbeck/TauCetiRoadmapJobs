# FIX-DESIGN-HardSphereDynamicsAndKineticLimits~3

This report covers the repairs for the findings of `REV-DESIGN-HardSphereDynamicsAndKineticLimits~2`, the round-2 design review. I edited three files: `packages/HardSphereDynamicsAndKineticLimits/design/README.md`, `packages/HardSphereDynamicsAndKineticLimits/design/plan.json` and `packages/HardSphereDynamicsAndKineticLimits/sources.toml`. I checked all 13 findings against the cached source texts, the pinned Mathlib and direct computation. All 13 are correct and all are applied. None is disputed and none is out of scope for this package. No `Suggested.lean` exists at the design stage, so nothing was elaborated (this lane does not elaborate).

## REV-DESIGN-HardSphereDynamicsAndKineticLimits~2/R01 (P1) — applied

**Verified.** For one particle with d = 1, x = v = 0 and t = c = 1, `S_1 B_1 = (1, 1)` but `B_1 S_1 = (0, 1)`.

**Changed (README §3.4 API, plan 3.4).** "commutes … with the Galilean boost" now reads `S_t ∘ B_c = A_{π(tc)} ∘ B_c ∘ S_t`. I defined `A_y` and `B_c`, and kept plain commutation for relabelling and common translations. The witness is a new Check and plan test `boost_correction`.

**Pattern.** §5.3 (trajectory boost) and §5.5 (`G` boost-invariant) were already correct.

## REV-DESIGN-HardSphereDynamicsAndKineticLimits~2/R02 (P2) — applied

**Verified.** Take `x_1 = (2, 1)` and `v_1 = (−1, 0)`. Then `D = 4 − 4 = 0`, the pair grazes at t = 2, and `Z ∉ G`. Yet `T_1 Z = Z`, while `S_1 Z` has `x_1 = (1, 1)`.

**Changed.**
- §7.1 and plan 7.1 (statement and `flow_eq_freeFlow`): the free-flow identity now requires `Z ∈ G`.
- §7.3 and plan 7.3: reversal, relabelling, translations and conservation are stated exactly on the whole space. Boost covariance now requires `Z ∈ G`, with an a.e.-on-`𝒟̄` corollary; §6.4 was added to Needs.
- Two negative Checks were added: `grazing_off_G` and `boost_off_G`.

## REV-DESIGN-HardSphereDynamicsAndKineticLimits~2/R03 (P2) — applied

**Verified.** Take positions `0, 2, 20, 22` with all velocities `0.1`. Composing the two full N-particle maps moves every particle by 0.2.

**Changed.**
- §4.5 / plan 4.5: the pair map fixes every coordinate outside its pair; it maps `λ_N` on its domain to `λ_N` on its image.
- §6.2 / plan 6.2: `Φ_δ` is defined block by block per near-pair matching, with free steps for unmatched particles.
- New Checks: three particles (§4.5); four particles, giving `0.1, 2.1, 20.1, 22.1` (§6.2).

## REV-DESIGN-HardSphereDynamicsAndKineticLimits~2/R04 (P1) — applied

**Verified.** BGSS2023 line 249 carries the factor `δ_{N≥n}`. Also `Nat.descFactorial` (pinned `Mathlib/Data/Nat/Factorial/Basic.lean:332`) vanishes when n > N (line 367).

**Changed.**
- §9.5: `E[N!/(N − n)!]` → `E[Nat.descFactorial N n]`.
- §8.4: hypothesis `s ≤ N`, descFactorial count.
- §8.3: recursion for `s < N`.
- New supplier-contract bullet for `Nat.descFactorial`.
- New Checks: N=0, n=1 (vacuum); N=1, n=2 (0); N=3, n=2 (6).
- Plan 8.3, 8.4, 9.5 mirror these.

## REV-DESIGN-HardSphereDynamicsAndKineticLimits~2/R05 (P1) — applied

**Verified.** For N = d = 1 on the unit circle, `𝒟̄_1 = X × E` has infinite measure.

**Changed.** The §7.4 Check "constant on a finite-measure `𝒟̄`" is replaced by the infinite-measure example plus the invariant cutoff `1_{H≤1/2}`, which has p-th integral 2 (plan test `energy_cutoff`). The Layer 7 Examples line "finite measure `λ_N|𝒟̄`" now reads: σ-finite and infinite, finite on torus energy shells.

**Pattern.** The other "finite measure" uses (§9.2, §9.4, §9.5) refer to position space and are correct.

## REV-DESIGN-HardSphereDynamicsAndKineticLimits~2/R06 (P2) — applied

**Verified.** In the counterexample, `Lφ(1, Z) = M` is unbounded, and `χ(t)H` is unbounded.

**Changed (§8.2, plan 8.2).**
- Multipliers: bounded measurable `a(t, P, H)`, differentiable in t with bounded measurable `∂_t a`; `L(aφ) = a Lφ + (∂_t a) φ`.
- The collision-time witness gets a cutoff `θ(H)`, equal to 1 at H = 1/2, so its values ±1 are kept; the uncut `Lφ = M` is a negative control.
- `ψ` measurable.

**Pattern.** The non-specular example `χ(t)⟨v_1, e_1⟩` was also unbounded, so it now carries `θ(H)` as well.

## REV-DESIGN-HardSphereDynamicsAndKineticLimits~2/R07 (P2) — applied

**Verified.** With β = 0 and `g = 1_{|v|≥1}`, the gain integrand on an open cone equals `r/√2`, so the integral diverges.

**Changed.**
- §10.2: explicit hypotheses `g` measurable, `C ≥ 0`, `β > 0`, routed via energy conservation; the weak form takes measurable `ψ` of polynomial growth; the β = 0 example is a new Check.
- §9.5: `C₀ ≥ 0`, `β₀ > 0`.
- Plan 10.2 and 9.5 mirror this.

**Pattern.** §10.3 and §10.4 already state β > 0.

## REV-DESIGN-HardSphereDynamicsAndKineticLimits~2/R08 (P2) — applied

**Verified.** The integrated density in the witness is `0.8√(2π)/Z ≈ 2.0053/Z`, which is larger than the claimed `1/Z`.

**Changed (§9.5).** The integrated bound now carries the factor `K^m` with `K = μ_X(X)(2π/β₀)^{d/2}`. A convergence route was added: the series of absolute values is at most `(μC₀)^n e^{−β₀|V_n|²/2} exp(2μC₀K)/Z`. The witness is a new Check, `2.0053/Z ≤ 2.5066/Z`. Plan 9.5 (`correlation_inversion`, test `volume_factor`) mirrors this.

## REV-DESIGN-HardSphereDynamicsAndKineticLimits~2/R09 (P2) — applied

**Verified.** In d = 1, `μ_ε = 1`, `Z_ε → e` and `P(N ≠ 1) → 1 − e^{−1} ≈ 0.63212`.

**Changed.**
- §10.5: equilibrium Check for `d ≥ 2`; d = 1 non-example Check.
- Layer 10 Examples: `d ≥ 2`, plus a d = 1 sentence.
- Pattern repair: `HardSphere.LanfordStatement.tendsto_empirical` assumes `d ≥ 2`. In d = 1, `Q ≡ 0`, so `LanfordStatement 1` is not excluded, while `μ_ε = 1` defeats its conclusion.
- Plan 10.5 mirrors it.

## REV-DESIGN-HardSphereDynamicsAndKineticLimits~2/R10 (P2) — applied

**Verified.** If `f⁰ = 0`, then `f⁰/∫f⁰` is `0/0`. With ε = 0, μ = 1 and `∫f⁰ = 1`, `Z = e` is a genuinely infinite series.

**Changed (§9.3).**
- `∫f⁰ = 0` gives the vacuum law (`Z = 1`, `N = 0` a.s.) for every ε ≥ 0.
- The conditional i.i.d. law requires `∫f⁰ > 0`, on positive-probability events.
- New Checks: zero density, zero diameter.
- Plan 9.3: "finite sum … for 0 < ε < ρ"; `grandCanonical_zero` updated; tests `zero_density`, `zero_diameter`.

## REV-DESIGN-HardSphereDynamicsAndKineticLimits~2/R11 (P3) — applied

**Verified.** I derived the derivative by hand: `dτ = da_1 + du_1`, `dq = (0, da_2 + du_2)`. The rows `(−1,0,0,0)`, `(0,−1,0,−2)`, `(0,0,−1,0)`, `(0,2,0,3)` give determinant 1.

**Changed (§4.3, plan 4.3).**
- The random finite-difference Check is replaced by this explicit derivative and by `det DB_3 = 1` at fixed s = 3.
- The text now says s is held fixed.
- New Check: in d = 1, the fixed-time map has determinant 1 while the variable-time map `(1 − 0.7u, −u)` has determinant 0.

## REV-DESIGN-HardSphereDynamicsAndKineticLimits~2/R12 (P3) — applied

**Changed (§10.3, plan 10.3).**
- `T ≥ 0` is now stated, and the plan now has "there are C, β > 0".
- New API: the a.e. initial value, restriction to `[0, S]`, and the characteristic form.
- The cosine non-example replaces the non-discriminating sign Check: 0.5 M(1) versus the required 1.5 M(1).

**Strengthened.** In d = 1, `σ_ω(v, w) = (w, v)`, so `Q ≡ 0`. The cosine example therefore tests the definition itself, not only "Q replaced by 0".

## REV-DESIGN-HardSphereDynamicsAndKineticLimits~2/R13 (P3) — applied

**Verified.**
- GST2013 line 855 cites "[2, Proposition 4.3]". Lines 5439–5440 identify [2] as Alexander1976, and Lanford is [34] (line 5507).
- BGSS2023 line 316 cites Lanford as [47] (bibliography line 8236). GST2013 line 667 cites [34].

**Changed.**
- §6.4 and plan 6.4: "Lanford1975 Proposition 4.3" → "Alexander1976 Proposition 4.3, reference [2] of GST2013 line 855".
- References: Lanford only for the convergence theorem.
- `sources.toml`: Alexander1976 locator "Proposition 4.3, pp. 217–232" (scheme theorem); Lanford1975 locator names the convergence theorem, `cited_for = ["10.4"]`.
- Both keys are kept and neither text was requested again.

## Checks run

Dependency gate:

```text
candidate: HardSphereDynamicsAndKineticLimits is not in the merge order yet; checked as if placed after QuasiregularMaps (the intake inserts it when its design is accepted)
depcheck: 236 roadmaps, 2132 edges, 0 problem(s)
```

There is no UPWARD and no CYCLE line. The roadmap is not yet in the merge order, which is expected at the design stage.

Other checks:
- **Citations.** `roadmaps resolve` on the README found no cross-roadmap citation and no roadmap Lean name that resolves nowhere. Its library-name lookup was unavailable on this host, so I opened every newly cited Mathlib name at the pin: `Nat.descFactorial` (line 332), `Nat.descFactorial_eq_zero_iff_lt` (line 367) and `Nat.descFactorial_eq_div` (line 424) in `Mathlib/Data/Nat/Factorial/Basic.lean`, inside `namespace Nat`, and `GaussianFourier.integral_rexp_neg_mul_sq_norm` (`Mathlib/Analysis/SpecialFunctions/Gaussian/FourierTransform.lean:330`, which requires `0 < b`).
- **Plan structure.** `plan.json` has 45 targets and 159 tests, with at least three tests per target. Every `target:` prerequisite points to an earlier target. The file is written in its original format.
- **Gate failures.** None were listed, so none were repaired.
- **`Suggested.lean`.** There is none in this package at the design stage, so there are no `#check` signatures to compare and no binder audit. No Lean command was run. No new declaration names were introduced: the backticked roadmap names in the README are unchanged.
- **Ownership.** `roadmaps grep -i 'hard.sphere|BBGKY|Lanford|Galilean boost'` returned "no match on main or in any open roadmap pull request". The repairs add no new carrier; the only new library object, the falling factorial, is Mathlib's and is cited. The closest roadmaps in `scratch/overlaps.md` are unchanged from the review's assessment.
- **Sources.** No new source was needed and no `needs-references.toml` was written.

## Adversarial pass on the changed text

| Statement | Instances tried | Values computed (both sides) | Result / change |
|---|---|---|---|
| §3.4 `S_t B_c = A_{π(tc)} B_c S_t` | d=1, x=v=0, t=c=1; t=0; c=0 | (1,1)=(1,1); plain `B_1S_1`=(0,1). t=0: both `B_c`. c=0: `S_t`=`S_t` | Holds; plain commutation refuted (Check) |
| §7.1 `T_tZ=S_tZ`, `Z∈G` | grazing a=(2,1),u=(−1,0); head-on t=0.5, t=−1; N=1 | Grazing: D=0, Z∉G, `T_1` gives x_1=(2,1), `S_1` gives (1,1) (excluded). Head-on: x_1=(1.5,0) both; t=−1: x_1=(3,0) both. N=1: G is everything | Holds with hypothesis |
| §7.3 covariance, `Z∈G` | head-on, c=(1,0), t=3; grazing boosted | LHS: boosted state collides at τ=1, so at t=3 positions (4,0),(1,0), velocities (1,0),0. RHS: (1,0)+(3,0), (−2,0)+(3,0), velocities (1,0),0, equal. Off G: (2,1),0 vs (3,1),(1,0) | Holds on G, fails off G (Check) |
| §7.3 exact identities off G | ℛ, relabel, translate on Z∉G | Both sides equal the symmetry applied to Z (T_t = id there; G invariant, §5.5) | Exact |
| §4.5 pair map fixes others | N=3: 0,2,20 at v=0.1, ε=R=1, η=4, s=1; N=2 head-on s=3 | `‖x_1−x_2‖+2Rs`=4<∞, 2Rs=2≤η: gives (0.1, 2.1, 20). Head-on: x=(1,0),(−2,0), unchanged | Holds |
| §6.2 block step map | 4 particles 0,2,20,22, v=0.1, ε=R=δ=1; N=3 with one free particle; N=1 | `|V|`=0.2; near pairs at distance 2≤3, others ≥18. `Φ_1`: 0.1, 2.1, 20.1, 22.1, equal to the trajectory; full-map composition gives +0.2. N=3: (0.1,2.1,20.1). N=1: free step | Holds |
| §8.3 recursion `s<N` | N=2: s=1 and s=2 | s=1: `W^{(1)}=∫W_2 dz_2`. s=2: level 3 does not exist | Hypothesis needed |
| §8.4 count `s≤N` | (N,s) = (3,2), (1,2), (0,0), (N,0) | descFactorial: 6; 0 (truncated quotient 1); 1; 1, with `W^{(0)}=∫W_N=1` | Holds |
| §9.5 `∫F_n=μ^{−n}E[descFactorial N n]` | f⁰=0, n=1; ε=0, ∫f⁰=1, μ=2, n=1 and 2 | Vacuum: 0=0 (old formula μ^{−1}). Poisson(2): E[N]=2 gives 1; E[N(N−1)]=4, ×μ^{−2} gives 1 = ∫(f⁰)^{⊗2} | Holds; old formula off by 1/Z |
| §9.5 integrated bound `K^m` | circle, ε=.1, μ=C₀=β₀=1, n=m=1, v_1=0; m=0; ε=0 with f⁰=C₀e^{−β₀v²/2} | 2.0053/Z ≤ 2.5066/Z; m=0 gives the unintegrated bound; ε=0 is attained with equality | Holds and is sharp |
| §9.5 series bound | μ=C₀=1, K=√(2π) | Σ (μC₀K)^{p+q}/(p!q!) = exp(2√(2π)) ≈ 150.6, finite | Holds |
| §9.3 vacuum / ε=0 | f⁰=0; ε=0, μ=1, ∫f⁰=1; ε=0, μ=2, N=3 | Z=1, P(N=0)=1, Po(0)=δ_0. Z=e≈2.71828, infinite series. P(N=3)=e^{−2}·8/6≈0.18045>0 | Holds; clauses separated |
| §7.4 Check / Layer 7 Example | N=d=1 circle; torus N=2, d=1, ε=.1, r=1/2 | λ(𝒟̄_1)=∞; ∫1_{H≤1/2}=2 and invariant. Shell measure 0.8π≈2.513 ≤ vol(B²(0,1))=π | Holds |
| §8.2 multiplier rule | a=sin t/(1+H); a=H; oblique σ witness | `L(aφ)=aLφ+cos t/(1+H)·φ`, bounded. a=H is unbounded (excluded). P=(.9,.9) and H=.81 preserved by σ | Holds with boundedness |
| §8.2 cutoff witness | head-on, H=1/2 before and after; uncut with v_1=Me_1 | θ=1 on the trajectory: φ is χ(t)(2−t), then χ(t)t, with one-sided derivatives χ'(1)∓χ(1). Uncut: Lφ(1,Z)=M | Admissible; negative control |
| §8.2 non-specular with θ | single collision at τ | ∫χ'v+…+χ(0)v = χ(τ)(v−v') | Value unchanged, now admissible apart from the specular condition |
| §10.2 needs β>0 | d=2, β=0, g=1_{|v|≥1}; β=1, g=e^{−|v|²/2}, d=3, v=0 | v'=(r/2)(1,1), w'=(r/2)(1,−1), speeds r/√2, kernel r/√2, integral diverges. Loss: π·8π≈78.96, finite; normalised version M(0)π√(8/π) agrees | Hypothesis needed |
| §4.3 explicit DC | ε=1, a=(2,0), u=(−1,0); s=3 | dτ=da_1+du_1; det DC=(−1)(−1)(−3+4)=1. DB_3 rows (−1,0,−3,0),(0,5,0,7),(0,0,−1,0),(0,2,0,3), det 1. B_3=(3,1) matches §4.2 | Holds |
| §4.3 fixed versus variable time | d=1, a>1, u<0 | Fixed s: (2−a−su,−u), det 1. Variable time: (1−.7u,−u), det 0 | Check discriminates |
| §10.3 API | t=0; S=0; d=1 cosine datum | f(0)=f⁰ a.e.; [0,0]={0}. True free solution at y=1/4, v=1, t=1/4 gives 1.5M(1)≈.36296; wrong sign gives .5M(1)≈.12099; M datum gives M both ways | Holds; Check discriminates |
| §10.3 `Q≡0` in d=1 | v=1, w=−1, ω=±1 | σ gives (−1,1)=(w,v); g(v')g(w')−g(v)g(w)=0 | Holds |
| §10.5 d≥2 | d=1 circle; d=2; d=3, ε=.1 | d=1: Z→e, P(N=1)→.36788, P(N≠1)→.63212. d=2: μ=1/ε→∞. d=3: μ=100 | Hypothesis needed; corollary scoped |
| §6.4 attribution | GST2013 lines 855, 5439–5440, 5507; BGSS2023 lines 316, 8236 | [2] is Alexander CMP 49; [34] and [47] are Lanford LNP 38 | Attribution corrected |

## For the maintainer

- **Renames.** No roadmap or Lean name that another roadmap could cite was renamed. Several plan-internal test names changed: 4.3 `finite_difference` → `explicit_derivative`, `fixed_time`; 7.4 `constant` → `energy_cutoff`; 10.3 `wrong_direction` → `wrong_direction_cosine`.
- **Statement changes.**
  - §7.1 and §7.3: the free-flow identity and boost covariance now require `Z ∈ G`.
  - §6.2 and §4.5: the step-map and pair-map statements changed.
  - §10.5: the Lanford corollary now requires `d ≥ 2`.
  - A future roadmap on the BBGKY hierarchy that proves `HardSphere.LanfordStatement` should cite these forms.
- **Manifest.** In `sources.toml`, the Alexander1976 locator scheme changed from page to theorem (Proposition 4.3), and Lanford1975 is now cited only for 10.4. Both remain settled uncertified, and neither text was requested again.
- **Untrusted text.** No suspicious instruction was found in any source or review text.
- **Ownership against open pull requests.** I checked by object, using `roadmaps grep` over main and the indexed open heads. The repairs introduce no object another roadmap could own.
