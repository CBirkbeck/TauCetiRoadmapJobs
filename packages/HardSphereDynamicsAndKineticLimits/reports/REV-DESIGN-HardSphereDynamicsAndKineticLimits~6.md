<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13780#issuecomment-6895103345 -->
Review (claude) of 691c5f2

Verdict: needs_changes

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) "pairwise disjoint" boundary pieces: the index is not said to be unordered

   **Location.** `packages/HardSphereDynamicsAndKineticLimits/design/README.md:229` and `:234`: "the boundary pieces `∂^±(i, j)` of configurations whose only contact pair is `{i, j}`" and "Boundary pieces are pairwise disjoint, disjoint from `𝒟`, and null". Plan target 3.2, API `boundary_null`.

   **Claim.** Distinct boundary pieces are disjoint.

   **Witness.** On `E`, ε = 1, `x_1 = (1, 0)`, `x_2 = 0`, `v_1 = (1, 0)`, `v_2 = 0`: `⟨v_1 − v_2, ν_12⟩ = 1` and `⟨v_2 − v_1, ν_21⟩ = ⟨(−1, 0), (−1, 0)⟩ = 1`. The state lies in `∂^+(1, 2)` and in `∂^+(2, 1)`: the two pieces are the same set.

   **Exact repair.** In the API bullet write: "`∂^±(j, i) = ∂^±(i, j)`, so a piece depends on the unordered pair and the sign; pieces with different unordered pairs or opposite signs are disjoint; every piece is disjoint from `𝒟` and null". Make the same change in the plan's `boundary_null`. Tested on the witness: the state is in the single piece `∂^+{1, 2}`, not in `∂^−{1, 2}` (the sign is 1 > 0), and the new sentence is true there.

2. **F02** (P3) "constant off a set of contact times" reads as globally constant

   **Location.** `packages/HardSphereDynamicsAndKineticLimits/design/README.md:388`: "velocities are right-continuous within `J` … and constant off a set of contact times that is finite in every bounded subinterval". The same wording is in the converse of §5.4 (line 432) and in plan targets 5.1 and 5.4.

   **Claim.** The definition of `HardSphere.IsTrajectory` admits the head-on witness (Check 2 of §5.1).

   **Witness.** Head-on witness, contact set `{1}`: `V(t) = ((−1, 0), 0)` for `t < 1` and `(0, (−1, 0))` for `t > 1`. `V` takes two values on `ℝ ∖ {1}`, so it is not constant off the set. Read literally, the clause excludes every trajectory with a collision, against Check 2.

   **Exact repair.** Write: "there is a set `𝒯 ⊆ J`, finite in every bounded subinterval of `J`, such that `V` is constant on every subinterval of `J` disjoint from `𝒯`" (in §5.4: the same sentence for the left-continuous path). The API bullet "velocities piecewise constant" already says this. Tested on the witness: `𝒯 = {1}`, and `V` is constant on `(−∞, 1)` and on `(1, ∞)`.

3. **F03** (P3) internal layer lists in `### Dependencies` are not the layers the `*Needs:*` lines cite

   **Location.** `packages/HardSphereDynamicsAndKineticLimits/design/README.md:462` ("Layers 3–4."), `:523` ("Layers 4–5."), `:665` ("Layer 7; …"), `:758` ("Layers 7–8; …"), `:841` ("Layers 7–9; …").

   **Claim.** Each line gives the layers its layer depends on.

   **Witness.** Layer 10's `*Needs:*` lines cite §1.1, §1.3, §2.1, §2.2, §7.5, §9.1, §9.5 and no section of Layer 8; the line lists Layer 8 and omits Layers 1–2. Layers 3 and 4 list every directly cited layer ("Layers 1–2", "Layers 1–3"), so the lines follow two conventions.

   **Exact repair.** List the directly cited layers, as Layers 3, 4 and 7 already do; keep the Mathlib, Tau Ceti and ClassicalErgodicTheory parts unchanged.

   - Layer 5: "Layers 2–4." (§2.1 in §5.3; §3.1–3.4; §4.1 in §5.5)
   - Layer 6: "Layers 1 and 3–5." (§1.4, §3.1 in §6.1; §4.4–4.5, §5.1–5.2 in §6.2; §5.3, §5.5 in §6.4)
   - Layer 8: "Layers 3 and 7; …" (§3.1–3.4 in §8.2–8.4; §7.1, §7.2, §7.4)
   - Layer 9: "Layers 1–3 and 7–8; …" (§1.4, §2.1, §3.1, §3.5; §7.1–7.3, §7.5; §8.1, §8.4)
   - Layer 10: "Layers 1–2, 7 and 9; …" (§1.1, §1.3; §2.1, §2.2; §7.5; §9.1, §9.5)

   Tested on the witness: the Layer 10 line then equals the set `{1, 2, 7, 9}` read off its five `*Needs:*` lines. The plan has no layer-level dependency field and needs no change.

Three findings, all P3; none is blocking, but each carries a repair to the README, so the verdict asks for changes. The one finding of the previous round is repaired. No supplier gap is declared and none is needed.

I edited neither the README, the plan nor the sources manifest. No maintainer notes were supplied. This is the design lane: there is no `Suggested.lean`, and elaboration is not available (this lane does not elaborate; say so in the report). No Lean command was run.

## Previous finding, checked first

The preceding review is `REV-DESIGN-HardSphereDynamicsAndKineticLimits~5` (one finding, F01, P3); its repair report is `packages/HardSphereDynamicsAndKineticLimits/reports/FIX-DESIGN-HardSphereDynamicsAndKineticLimits~6.md`.

| Round-5 finding | Status | Repaired passage and my check |
|---|---|---|
| F01 (P3), layer dependency lines omit the roadmap supplier | Repaired | Line 597: "Layers 5–6; Mathlib (…); Tau Ceti `TauCeti.Semigroups.StronglyContinuousGroup` (§7.4); ClassicalErgodicTheory §3.5 (items 1 and 3)." Line 665: "…; ClassicalErgodicTheory §3.5 (item 4)." Line 758: "…; ClassicalErgodicTheory §3.5 (item 3)." Items against the `*Needs:*` lines: item 1 in §7.2 (line 551), item 3 in §7.5 (line 589) and §9.4 (line 723), item 4 in §8.1 (line 612). They agree. |

Nothing was marked `not actionable in this package`; nothing is re-raised.

The repair also added Mathlib and Tau Ceti to the Dependencies lines of Layers 3, 4, 7, 8, 9 and 10. I compared each added name with the `*Needs:*` lines of its layer; all agree (table rows below). The repaired pattern in the rest of the design: the external suppliers are now complete in every layer, but the internal layer lists are still not the layers the `*Needs:*` lines cite. That is R03.

## Verified sound

### Coverage and principles

I read all 868 README lines, the 45 plan targets (166 planned tests, at least three per target, counted mechanically; every target has a locator), every `*Needs:*` line and the 9 manifest entries. Every `target:` prerequisite of the plan points to an earlier target (checked mechanically). `gaps` is empty.

- No route-specific shortcut: every `d ≥ 1`, every flat position space with `0 < ε < ρ`; `d ≥ 2` only where `μ_ε → ∞` is used.
- No re-planned roadmap, no upward or cyclic supply, no algorithm, no copied passage.
- No layer is named after a source's chapter and no sentence says the roadmap follows a source.
- A scan for process words, pull-request numbers, dates, machine paths, LaTeX delimiters and `lemma` found none in the README.

### Adversarial table

`E` is Euclidean space. The head-on witness is ε = 1, `x_1 = (2, 0)`, `x_2 = 0`, `v_1 = (−1, 0)`, `v_2 = 0`. Rows cover the fifteen sampled targets, the headline theorems, the passages the repair changed and the targets the findings touch. Determinants are central finite differences with step `10⁻⁵`.

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §2.1 scattering map | ν = (1,0), `v = (0, 0.9)`, `w = (0.9, 0)`; ν = (0.6, 0.8) matrix; reflection formula | `⟨v − w, ν⟩ = −0.9`, image `((0.9, 0.9), (0, 0))`; energy `0.81 + 0.81 = 1.62 + 0`; 4×4 matrix has det −1.0; `z − 2⟨z, n⟩n/|n|²` with `n = (ν, −ν)`, `|n|² = 2`, gives `(v − cν, w + cν)`, `c = ⟨v − w, ν⟩`; `finrank Kᗮ = 1` gives `(−1)¹` | Sound | none |
| §2.2 kernel and cross-section | witness of §2.1; d = 1, 2, 3, 4 | `(w − v)·ω = 0.9`, `(w' − v')·(−ω) = (−0.9, −0.9)·(−1, 0) = 0.9`; quadrature: d = 2 gives 2.000000, d = 3 gives 3.141593 = π, d = 4 gives 4.188790 = `ω_3`; d = 1 gives `|k|`; `½ω_{d−1}(1 − (d−1)/(d+1)) = ω_{d−1}/(d+1)` | Sound | none |
| §3.1 hard-core sets | ε = 1 on `E`; unit torus ε = 0.4; `N = 1`; packing | distance 1: in `𝒟̄`, not `𝒟`; 0.5: neither; torus distance 0.1 against representatives 0.9; no pairs; `1/(0.04π) = 7.958`, so at most 7 | Sound | none |
| §3.2 contacts, normals, boundary pieces | torus ε = 0.3; three collinear points; signs; both orders of the pair | `(0.1 − 0.8, 0) ≡ (0.3, 0)`, ν = (1, 0); pairs `{1,2}`, `{1,3}` share 1; `v_i = (1,0)`: +1, `(−1,0)`: −1, `(0,1)`: 0; `∂^+(1,2)` and `∂^+(2,1)` both contain the outgoing state (both signs +1) | Statement true for unordered pairs only | R01 |
| §3.3 reversal | outgoing state `V = ((1,0), 0)`, ν = (1,0) | `σ_M V = (0, (1,0))`, `ℛ = (0, (−1,0))`, sign `⟨(1,0), (1,0)⟩ = 1 > 0`: outgoing again; `ℛ² = σ_M σ_M = id` | Sound | none |
| §3.5 collision invariants | witness of §2.1; separate reflection | `P = (0.9, 0.9)` and `H = 0.81` before and after; separate reflection of `((1,0), 0)`: `H = ½` kept, `P` from `(1,0)` to `(−1,0)` | Sound | none |
| §4.1 collision time | head-on; contact datum `|a| = ε`; `u = 0` | `D = 4 − 3 = 1`, τ = 1, `⟨q, u⟩ = −1 = −√D`; `D = ⟨a,u⟩²`, τ = 0; `D(a, 0) = 0` with no contact, covered by `⟨a, u⟩ ≥ 0` | Sound | none |
| §4.3 collision map, Jacobian | head-on; oblique `a = (3, 0.6)`; generic d = 3 and d = 4 points; d = 1 | `C = (0, 0, 1, 0)`; `DC` rows (−1,0,0,0), (0,−1,0,−2), (0,0,−1,0), (0,2,0,3), det 1.0000000; oblique: `D = 0.64`, τ = 2.2, `C = (0.184, −1.512, 0.28, 0.96)`, det 1.0000000; d = 3 at `a = (2.2, 0.5, −0.3)`, `u = (−0.9, −0.2, 0.15)`: det 1.0000000; d = 4: det 1.0000000; d = 1: `C = (2 − a, −u)`, det 1; variable time `(1 − 0.7u, −u)`, det 0 | Sound | none |
| §4.4 measure preservation of `B_s` | injectivity cases; inelastic rule | collided images have backward path meeting the sphere with `⟨q, R_q u⟩ = √D > 0`, free images do not, grazing images are tangent: three disjoint classes; incoming and outgoing contact states `(a, u)`, `(a, R_a u)` share an image, hence the exclusion; inelastic image has dimension `(d−1) + (d−1) + 1 = 2d − 1` | Sound | none |
| §5.1 trajectories | head-on witness against the constancy clause | `V` takes two values off `{1}` | Wording | R02 |
| §5.2 uniqueness (headline) | forward step; backward step; gluing at `b` | `V(t₁) = σ_M V(t₁−)` with equal positions and left limits; `V(t₁−) = σ_M V(t₁)`; glued path satisfies the first piece's jump condition and the second piece's right-continuity at `b` | Sound | none |
| §5.3 symmetries | reversal at a contact time `s`; at a least and a greatest element of `J`; head-on reversed; boost | `W(−s) = −σ_M V(s) = −V(s−)`, outgoing since `V(s−)` is incoming; left limit of `W` at `−s` is `−V(s)`, and `σ_M(−V(s)) = −V(s−)`; at `−a`: `−σ_M V(a) = σ_M(−V(a+))`; at time 3 the state `((1,0), (−2,0); 0, (−1,0))` reverses to velocities `(0, (1,0))`, contact at time −1; boosted velocities `0`, `(1,0)`, same relative data, time 1 | Sound | none |
| §6.2 short time steps | non-near pair; torus domain; block composition; contact at the end of a step | distance `> ε + 2Rδ` drops by at most `2Rδ`, stays `> ε`; `0.47 + 0.18 = 0.65 ≥ 0.5`, `0.39 + 0.09 = 0.48 < 0.5`; `|V| = √(4 · 0.01) = 0.2 ≤ 1`, positions `0.1, 2.1, 20.1, 22.1`; `τ = δ` gives an outgoing contact state, admitted by `S_{δ,R}` at the next step | Sound | none |
| §6.4 Alexander's theorem (headline) | `N = 1, 2`; the Borel description; negative times | complement empty; cylinder `D = 0` and contact set null; along a trajectory on `[0, t]` each particle's second-nearest distance is continuous and `> ε`, so its minimum exceeds `ε + 2Rδ` for small δ with `ε + 4Rδ < ρ`, and every step passes; forward trajectory of `ℛZ` reversed glues at 0 since `ℛℛZ = Z` | Sound | none |
| §7.1 group law (headline) | head-on `T_3`, `T_{−3}`; off `G` | `((2,0), 0; (−1,0), 0) ↦ ((1,0), (−2,0); 0, (−1,0)) ↦` back; `T_s T_t Z = Z = T_{s+t} Z` | Sound | none |
| §7.2 measure preservation (headline) | `N = 2` on `E`; torus `N = 8` | `𝒟̄ ∖ G` null, `𝒟̄ᶜ` of infinite measure; `8π(0.2)² = 1.0053 > 1`, so `𝒟̄ = ∅` | Sound | none |
| §7.3 symmetries (headline) | head-on reversal; off `G`; rotation of velocities; boost off `G` | `ℛT_3 Z = ((1,0), (−2,0); 0, (1,0))`; `T_{−3}ℛZ`: contact at time −1, earlier velocities `σ((1,0), 0) = (0, (1,0))`, positions `(1,0)`, `(−2,0)` at time −3: equal; off `G` both sides are `ℛZ`; rotated `v_1 = (0, −1)` from `(2, 0)` keeps distance ≥ 2; grazing state: `D = 4 − 4 = 0`, `T_1` fixes it, formula would give `(3,1)`, `(1,0)` | Sound | none |
| §7.4 Koopman group | `p = 2`, `p < 2`, `p > 2`, `p = ∞`; circle sectors | `‖U_t f − f‖² = 2‖f‖² − 2⟨U_t f, f⟩`, dominated by `‖f‖_∞|f|`; support of measure `≤ 2λ(supp f)`; `‖g‖_p^p ≤ ‖g‖_∞^{p−2}‖g‖_2²`; `‖U_t f − f‖_∞ = 1`; `N = d = 1`: mass `1 · ∞`; ε = 1/3, `N = 3`: equally spaced triples, `q_3 = 0`; cutoff integral `1 · 2 = 2` | Sound | none |
| §8.2 weak Liouville (headline) | continuity at both ends of a piece; box non-example | right end: material derivative at the incoming state gives the limit `φ(t, Z⁻)`, equal to `φ(t, Z)` by the specular condition; `τ ∈ (0.99/1.04, 1.01/0.96) = (0.9519, 1.0521)`, `H ∈ (0.4802, 0.5204)`, residual −1 | Sound | none |
| §9.1 Maxwellians | d = 1; d = 3; Tau Ceti density at `S = β⁻¹ • 1`, β = 2.5, `|x − m|² = 1.37` | `M(0) = 0.398942`; `(2π)^{3/2} = 15.749610`; pinned formula `(2π)^{−d/2}(det S)^{−1/2}e^{…}` gives 0.04528047, README formula 0.04528047; product identity from `|v − u|² + |w − u|²` conserved | Sound | none |
| §9.2 invariant and canonical measures | five random velocities in d = 3; `N = 1` torus; `N = 8`; `E` | `Σ|v_i − u|² = 2H − 2⟨u, P⟩ + N|u|²` (identity checked by expansion); `Z^{can} = 1`; `Z^{can} = 0`, undefined; mass `∞ · 1` | Sound | none |
| §9.3 grand canonical measures | ε = 0, μ = 2; `f⁰ = 0`; terms `N ≤ 1`; torus ε = 0 | `Z = e²`, `P(N = 1) = 2e^{−2} = 0.270671`; `Z = 1`; `1 + μ∫f⁰ ≤ Z`, each term `≤ (μ∫f⁰)^N/N!`; all terms `1/N! > 0`, `Z = e` | Sound | none |
| §9.4 invariance (headline) | Maxwellian; indicator profile | component density a function of `(H, P)` times `1_𝒟̄`; `g(v)g(w) = 1 ↦ 0` since `|(0.9, 0.9)| = 1.2728` | Sound | none |
| §9.5 correlation identity (headline) | resummation; inversion; circle bound | `Σ_N (1/N!) · N!/(N − n)! = Σ_p 1/p!`; `Σ_{p+q=m} (−1)^p/(p! q!) = (1 − 1)^m/m!`, only `m = 0` survives; `0.8√(2π) = 2.005303 ≤ 2.506628` | Sound | none |
| §9.6 scaling (headline) | d = 3, ε = 0.01; d = 1 | `μ_ε ε^d = ε`; `ω_3 · 0.01 = 0.041888`; `E[N] = μ∫f⁰ p_ε ≤ μ` | Sound | none |
| §10.2 collision operator | loss term d = 3; β = 0 profile | `√(8/π) = 1.595769`; `v' = (r/2)(1, 1)`, `w' = (r/2)(1, −1)`, kernel `r/√2`, divergent | Sound | none |
| §10.4 Lanford's statement | `t = 0`; Maxwellian datum; clause 1 against the source | `|F_1(0) − f⁰| ≤ ω_d ε‖ρ⁰‖_∞ f⁰`, uniform; `ρ⁰ ≤ C₀(2π/β₀)^{d/2}`; datum admissible when `C₀ ≥ max(1, (β₀/2π)^{d/2})`, Lipschitz constant 0; total masses `μ^{−n}E[descFactorial 𝒩 n] → 1` and `∫f(t)^{⊗n} = 1`, so almost-everywhere convergence gives `L¹` convergence (Scheffé) and the weak clause | Sound | none |
| §10.5 law of large numbers (headlines) | second moment; d = 1; Chebyshev step | `0 + m² − 2m² + m² = 0`; `1 − e^{−1} = 0.632121`; `Var(π) ≤ E[(π − m)²]` and `|E[π] − m| → 0`, so the cited inequality about the mean concludes | Sound | none |
| Dependencies lines (changed) | each layer's line against the union of its `*Needs:*` lines | external names agree in Layers 3, 4, 7, 8, 9, 10; §3.5 items `{1, 3}`, `{4}`, `{3}` agree; internal layers: Layer 5 cites `{2, 3, 4}` against "3–4", Layer 6 `{1, 3, 4, 5}` against "4–5", Layer 8 `{3, 7}` against "7", Layer 9 `{1, 2, 3, 7, 8}` against "7–8", Layer 10 `{1, 2, 7, 9}` against "7–9" | External parts sound; internal lists differ | R03 |

### Seeded source sample

I opened the three readable texts at every locator of the fifteen sampled targets. The author flagged no locator as unverified. No source was fetched and the manifest was not changed.

| Target | Text opened and result |
|---|---|
| 2.1 | GST2013 lines 843–847 (reflection law (4.1.2)) and 1222–1227 ((4.4.1)); BGSS2023 lines 125–131 ((1.1.2)); DengHaniMa2024 lines 157–163 ((1.2)). Confirmed. |
| 3.1 | GST2013 lines 839–841 (strict inequality); BGSS2023 lines 137–142; DengHaniMa2024 lines 150–153 (closed domain (1.1)). Confirmed. |
| 3.2 | BGSS2023 lines 148–152: boundary pieces with sign `±(v_i − v_j)·(x_i − x_j) > 0` and all other pairs apart. Confirmed. |
| 3.5 | GST2013 (2.1.3), lines 396–399. Confirmed. |
| 4.3, 4.4 | GST2013 line 883 (invariance of the measure, used without proof); DengHaniMa2024 Proposition 1.2(3), lines 186–187. Both support "statement used in"; the Jacobian computation is the roadmap's, recomputed above. |
| 5.3 | GST2013 (1.1.1), lines 211–215; BGSS2023 lines 184–187; GST2013 lines 835–847, printed p. 27 (page 28 begins at line 857). Confirmed. |
| 6.2 | GST2013 lines 875–887: each particle meets at most one other on a step. The source takes `δ < ε/2`; the roadmap's `ε + 4Rδ < ρ` is its own and is what its pair maps need. |
| 6.4 | GST2013 Proposition 4.1.1 at lines 862–863, proof 875–910; line 855 cites "[2, Proposition 4.3]"; bibliography lines 5439–5440; BGSS2023 lines 132–139; DengHaniMa2024 lines 182–188. Confirmed. |
| 7.3 | The locators of 5.3, and GST2013 lines 396–399. Confirmed. |
| 7.4 | GST2013 lines 1138–1140, (4.3.5); DengHaniMa2024 lines 175–178, (1.5): pullback by the inverse-time flow. Confirmed. |
| 9.1 | GST2013 (2.2.5), lines 489–492, with `θ = 1/β`, density 1. Confirmed. |
| 9.2 | BGSS2023 lines 158–160 (the fixed-`N` formalism). Confirmed; the README says the invariant densities are derived here. |
| 9.3 | BGSS2023 (1.1.5)–(1.1.6), lines 167–181; DengHaniMa2024 Definition 1.3, lines 199–223. Confirmed. |
| 10.4 | BGSS2023 Theorem 1, lines 316–321; GST2013 Theorem 4 and Remark 3.1.1, lines 668–696; Theorem 8, lines 2069–2080. Confirmed. The Lipschitz hypothesis replaces the gradient bound of (1.1.5), line 168. |

Also read: GST2013 lines 394–400 and 432–437 for §2.2; BGSS2023 lines 479–483 and 3539 for §9.4; lines 344–349 for §10.5.

### Pinned declarations

Pins: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`, Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5` (the checkouts' heads, equal to the plan's baseline). Every Mathlib and Tau Ceti name of the supplier contracts was resolved this round. Paths are relative to each library.

- `Mathlib/MeasureTheory/Measure/Lebesgue/VolumeOfBalls.lean:308`; `Mathlib/Analysis/Normed/Group/Quotient.lean:168` (`norm_mk`), `:222` (`instNormedCommGroup`, with `IsClosed`; additive by `to_additive`); `Mathlib/MeasureTheory/Constructions/Polish/Basic.lean:649` (`QuotientGroup.borelSpace`, with `N.Normal` and `IsClosed`), `:119`, `:148`, `:154`; `Mathlib/Topology/Algebra/OpenSubgroup.lean:377`; `Mathlib/Topology/MetricSpace/ProperSpace.lean:66`.
- `Mathlib/Algebra/Module/ZLattice/Basic.lean:93`, `:434`, `:645`; `Mathlib/Algebra/Module/ZLattice/Covolume.lean:73`, `:85`; `Mathlib/MeasureTheory/Group/FundamentalDomain.lean:731`, `:755` (additive name `addProjection_respects_measure`), `:801`; `Mathlib/MeasureTheory/Measure/Haar/Quotient.lean:75` (fundamental domain of `Γ.op`), `:222` (`LocallyCompactSpace`, `IsFiniteMeasure`); `Mathlib/Topology/Instances/AddCircle/Real.lean:55`; `Mathlib/Analysis/Fourier/AddCircleMulti.lean:173`.
- `Mathlib/MeasureTheory/Function/Jacobian.lean:1096`, `:1184`; `Mathlib/Analysis/InnerProductSpace/Projection/Reflection.lean:52` (in `namespace Submodule`); `Mathlib/Analysis/InnerProductSpace/Projection/FiniteDimensional.lean:59`; `Mathlib/MeasureTheory/Measure/Lebesgue/EqHaar.lean:172`, `:231` (`det f ≠ 0`), `:527` (`Nontrivial E`); `Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean:734`; `Mathlib/MeasureTheory/Constructions/HaarToSphere.lean:52`, `:88`.
- `Mathlib/Analysis/SpecialFunctions/Gaussian/FourierTransform.lean:330` (`0 < b`); `Mathlib/Probability/Distributions/Gaussian/Real.lean:47`, `Gaussian/Multivariate.lean:166`, `Poisson/Basic.lean:40` (parameter in `ℝ≥0`); `Mathlib/MeasureTheory/Constructions/Pi.lean:732`; `Mathlib/MeasureTheory/Function/LpSpace/Basic.lean:595`, `:611`; `Mathlib/MeasureTheory/Function/ContinuousMapDense.lean:142` (`R1Space`, `WeaklyLocallyCompactSpace`, `μ.Regular`, `p ≠ ∞`, and the file's `NormalSpace` variable at line 67); `Mathlib/MeasureTheory/Integral/IntervalIntegral/FundThmCalculus.lean:1140`; `Mathlib/Probability/Moments/Variance.lean:398` (deviation from the mean, `IsFiniteMeasure`, `MemLp X 2`); `Mathlib/Data/Nat/Factorial/Basic.lean:332`, `:367`, `:424`; `Mathlib/MeasureTheory/MeasurableSpace/Constructions.lean:871`; `Mathlib/Dynamics/Flow.lean` (`Flow`).
- `TauCeti/Probability/Distributions/Gaussian/Density.lean:82` (takes `S : Matrix ι ι ℝ`; the formula the README quotes), `:265` (`S.PosDef`); `TauCeti/Analysis/Semigroups/Group/Basic.lean:74` (fields `map_zero'`, `map_add'` for all real `s, t`, `continuousAt_zero'`; real normed space, no completeness); `TauCeti/Probability/Process/EmpiricalMeasure.lean:224` (a `ProbabilityMeasure`); `TauCeti/Dynamics/Flow/OfLipschitz.lean:59` (namespace `TauCeti`).

Every name exists, in the namespace the README gives, with the hypotheses the contract states.

### Duplication, ownership and overlap

`scratch/overlaps.md` lists no other pull request changing this roadmap, no dropped id, no id that only a revision defines and no second copy. Object searches over main and the open heads (index of 2026-11-15):

- "hard sphere": only ClassicalErgodicTheory (its lines 72, 1160, 2440: outside its scope, and a consumer of its §3.5) and MathematicalBilliards (a downstream remark, its line 971).
- Lanford, Boltzmann–Grad, Boltzmann equation, collision operator, Maxwellian, grand canonical, `FlatPositionSpace`, `HardSphere.`: no match anywhere.
- "specular": MathematicalBilliards' `Suggested.lean` docstring (polygonal tables) and SymplecticGeometry/CotangentLagrangian on main (chords); neither states the scattering map of two spheres.
- Flat tori: MathematicalBilliards §10.5 is `ℂ/Λ` as a translation surface; ComplexTori on main is the complex Lie group; the other hits are examples. No roadmap owns `E ⧸ L` in dimension `d` with its Euclidean quotient norm and Haar measure, so this roadmap is the owner.
- Koopman strong continuity: ClassicalErgodicTheory §0.2 (its line 385: "`μ` is a finite invariant measure") and MathematicalBilliards §12.3 ("on a probability space"). The measure here is infinite; the scope paragraph's sentence is correct.
- Correlation functions: RandomMatrices §8.1 (main) defines them for eigenvalue counts on ℝ and ℂ; PointProcesses defines them as densities of factorial moment measures of unlabelled point measures. The function here is a formula on labelled configurations with the `μ^{−n}` rescaling; the scope paragraph leaves the image in point measures to PointProcesses.

The one cross-roadmap supplier, ClassicalErgodicTheory §3.5, was read at the head of its open pull request (README lines 1159–1203). The heading is "Flows defined almost everywhere"; item 1 is conull flows with the identity extension, item 3 disjoint unions with "invariant iff each component restriction is", item 4 `(Φ t)_* ν = μ.withDensity (W ∘ Φ (-t))`; its standing hypotheses are a standard Borel space and a σ-finite measure, and its measurable flow is "a jointly measurable `AddAction ℝ X`" (its line 101). The contract at README lines 73–79 says the same. StandardDistributions (Layer 5, "multivariate distributions", its line 547) is on main and OneParameterSemigroups is under `Completed/`; both are cited through pinned Tau Ceti declarations. The 17 names of `scratch/citations.md` are this roadmap's own declarations for the package stage (README line 85).

Overlap check: read ClassicalErgodicTheory, MathematicalBilliards, PointProcesses, RelativisticQuantumFieldTheory, HamiltonianSystems, OptimalTransport, RandomMatrices, StochasticCalculus (third list empty); conull flows, their disjoint unions and the transport of densities: owner ClassicalErgodicTheory §3.5, cited here; Koopman strong continuity for a finite invariant measure: owners ClassicalErgodicTheory §0.2 and MathematicalBilliards §12.3, not shared (infinite measure here); correlation functions of unlabelled point processes: owners PointProcesses and RandomMatrices §8.1, not restated; nothing else shared.

### Supplier order

```text
candidate: HardSphereDynamicsAndKineticLimits is not in the merge order yet; checked as if placed after MathematicalBilliards (the intake inserts it when its design is accepted)
depcheck: 245 roadmaps, 2229 edges, 0 problem(s)
```

No UPWARD or CYCLE line. ClassicalErgodicTheory is another author's open pull request that adds a new roadmap folder, which this roadmap may consume. It is neither on main nor in `merge-order/ORDER.txt`, so the check does not see the edge. I checked the direction by reading: ClassicalErgodicTheory cites nothing of this roadmap and names the hard-sphere flow only as a consumer; its own supplier MathematicalBilliards is the last line of the order. The order is MathematicalBilliards, ClassicalErgodicTheory, HardSphereDynamicsAndKineticLimits. No roadmap of the never-cite list is cited as a supplier: PointProcesses is named only as the owner of a deferred subject.

### Shape and headline theorems

The headings are in the house form; ten layers, each with `### Examples` and `### Dependencies`. Every numbered section has at least three Checks and a `*Needs:*` line (counted mechanically), every theorem its hypotheses and a locator.

Headline theorems named for the package stage: `HardSphere.IsTrajectory.eqOn` (§5.2), `HardSphere.volume_hardCoreSet_diff_goodSet` (§6.4), `HardSphere.flow_add` (§7.1), `HardSphere.measurePreserving_flow` (§7.2), `HardSphere.flow_reversal` (§7.3), `HardSphere.weak_liouville` (§8.2), `HardSphere.grandCanonical_flow_invariant` (§9.4), `HardSphere.lintegral_sum_distinct_eq_correlation` (§9.5), `HardSphere.boltzmannGrad_scaling` (§9.6), `HardSphere.tendsto_empirical_of_correlation` and `HardSphere.LanfordStatement.tendsto_empirical` (§10.5). Each names the roadmap's objects. The padding probe and the `#check` comparison have nothing to run on at this stage.

Remarks that need no change:

- §10.5 names Chebyshev's inequality, which bounds the deviation from the mean, while the route's second moment is about `∫ f h`. The step is sound (table row); a proof by Markov's inequality on the second moment is equally open to the implementer.
- §10.4 adds continuity of `f⁰`, which BGSS2023 (1.1.5) does not state and GST2013 Theorem 4 does. The proposition is the weaker, safer one.
- The letter `Z` denotes both a configuration and the partition function of §9.3; the context separates them.

### Copyright, licences and scope

- **Wording.** Beside the fifteen sampled locators I compared six further passages with the source text: §6.3's route with GST2013 lines 875–898; §5.5's sentence on pathological trajectories with lines 851–854; §2.2's sentence on unit Jacobians with lines 432–434; §7.5 with BGSS2023 lines 158–166; §10.5 with lines 341–349; §10.4 with lines 316–321. The longest shared run is three words ("with specular reflection", "unit Jacobian determinants" in part). No sentence follows a source clause by clause.
- **Arrangement.** GST2013 has the largest share, 44 of 102 locators. Its contents (lines 45–108): Chapter 1 the low density limit, Chapter 2 the Boltzmann equation, Chapter 3 main results, Chapter 4 the `N`-particle flow, Liouville equation and hierarchies, Chapters 5–7 estimates and convergence. Layers 1–4 have no counterpart; Layers 5–7 expand its §4.1; the collision operator, which the source puts first (Chapter 2), is in Layer 10. No run of layers maps one to one onto a run of its chapters or sections. The order of Layers 7 to 10 is forced: §8.1 needs §7.2, §9.5 needs §8.1 and §8.4, §10.1 needs §9.5.
- **Reuse.** No table, figure, list of examples or numerical data is taken from a source; the worked examples and non-examples are the roadmap's own.

Source independence: 21 passages compared with 3 sources, none shared; largest share GST2013, 44 of 102 locators; contents compared with GST2013: independent.

## Not verifiable

- Alexander1976 Proposition 4.3 and AlexanderThesis1975 Chapter 1: settled uncertified; only the attribution in GST2013 (line 855, lines 5437–5440) was read.
- Lanford1975, CIP1994, Spohn1991, Uchiyama1988: settled uncertified; not read, not requested again.
- Lean elaboration, the one-tactic padding probe and the `#check` comparison: not available (this lane does not elaborate), and there is no `Suggested.lean`.
- The truth of `HardSphere.LanfordStatement` beyond its agreement with BGSS2023 Theorem 1, its `t = 0` case and its equilibrium case: the proof belongs to the BBGKY roadmap and was not reconstructed.
- The dependency check's verdict on the ClassicalErgodicTheory edge: the tool does not see it; the direction was checked by reading.
- Ownership against open pull requests was checked through the indexed heads (475 pull requests, index of 2026-11-15) for the objects listed above. The board packages on other branches were not opened; none has a name in this subject.

## Source issues

- **Misprint** in GST2013 at (4.4.1), printed p. 33: the source says the starred velocities are the pre-image of the pair under (4.1.1), the free flow; it should be under the reflection law (4.1.2); affects nothing.
- **Gap** in GST2013 at Proposition 4.1.1, proof, printed p. 28: the source invokes invariance of Lebesgue measure under the partially constructed flow without proving it for the collision step; it should establish the unit Jacobian of the two-body step first; affects the proof.
- **Error** in DengHaniMa2024 at Proposition 1.2(3), printed p. 4: the source says the flow maps are diffeomorphisms off one closed null set; it should say measure-preserving bijections, smooth on the pieces with a fixed collision sequence; affects a stated result.

## For the human reviewers

- Licence: none of the three texts read is behind a paywall (arXiv). Six cited works are recorded `uncertified` and were not read; two of them (Alexander1976, Uchiyama1988) are open on Project Euclid but the service received a bot-protection page (`sources.toml`).
- Scope: the subject has a refereed literature (BGSS2023 is Ann. of Math. 198; GST2013 is an EMS monograph). DengHaniMa2024 is cited in its arXiv version (v3); I did not check whether it has appeared.
- Supplier: ClassicalErgodicTheory is a draft pull request of another author. The merge-order paragraph of this roadmap's pull request has to name it, and §3.5's item numbers are fixed only when that pull request merges.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "691c5f29d783b6fd1b7bbf41f80c170508ef8c28", "job": "REV-DESIGN-HardSphereDynamicsAndKineticLimits~6", "model": "fable", "worker": "chris-x55"} -->
