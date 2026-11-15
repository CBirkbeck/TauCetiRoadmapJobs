<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13780#issuecomment-6896287196 -->
Review (claude) of c801bb7

Verdict: needs_changes

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) §6.3 Check says "the bound is 0" for `N = 2`; the section's constant is positive

   **Location.** `packages/HardSphereDynamicsAndKineticLimits/design/README.md:502`: "For `N = 2` the bound is 0 apart from the grazing null set." The same sentence is the plan's test `two_body` of target 6.3.

   **Claim.** The bound `C(N, ε, R, K, t) δ` of §6.3 vanishes for two particles.

   **Witness.** `N = 2`, `d = 2`, `ε = R = 1`: `C₁ = 8 · (12π)² · vol(B⁴_1) = 8 · (12π)² · π²/2 ≈ 56107.6 > 0`. What is 0 is `λ_N(F)`, since `I = ∅`.

   **Exact repair.** Replace the Check, in the README and in the plan test, by: "For `N = 2` the set `F` is null: there is no triple of distinct indices, so `I = ∅`, and only the null remainder of §6.2 fails a step. The constant is still positive (`C₁ = 8 (2R d ω_d (ε + 2R)^{d−1})² vol(B^{2d}_R)`, about 56108 for `d = 2`, `ε = R = 1`), so the bound `C δ` is not sharp there." Tested on the witness: measure 0, bound `≈ 56108 δ > 0`, and `0 ≤ 56108 δ` holds.

2. **F02** (P3) §5.5 Check refers to an incoming contact state that §5.2 does not contain

   **Location.** `packages/HardSphereDynamicsAndKineticLimits/design/README.md:452`: "The incoming contact state of §5.2 is not in `G`; the outgoing one is."

   **Claim.** §5.2 names an incoming contact state.

   **Witness.** §5.2 names one contact state only, the outgoing `v_1 = 0`, `v_2 = (−1, 0)` (line 413). The incoming state is the Scattering witness of the Conventions (line 23).

   **Exact repair.** Write: "The incoming contact state `x_1 = (1, 0)`, `x_2 = 0`, `v_1 = (−1, 0)`, `v_2 = 0` (ε = 1, the Scattering witness of the Conventions) is not in `G`; its scattered state, the outgoing contact state of §5.2 with `v_1 = 0`, `v_2 = (−1, 0)`, is." Give the plan test `incoming_excluded` the same two states. Tested: incoming, `⟨v_1 − v_2, ν_12⟩ = ⟨(−1, 0), (1, 0)⟩ = −1 < 0`, not outgoing, so no trajectory passes through it. Outgoing, `⟨(1, 0), (1, 0)⟩ = 1 > 0`; forward `x_2(t) = (−t, 0)`, distance `1 + t`; backward the left limit is `((−1, 0), 0)` and `x_1(−s) = (1 + s, 0)`, distance `1 + s`: a trajectory on ℝ.

3. **F03** (P3) four `*Needs:*` lines omit the section that defines an object their statement or route uses

   **Location.** `packages/HardSphereDynamicsAndKineticLimits/design/README.md:404` (§5.1), `:631` (§8.2), `:644` (§8.3), `:739` (§9.5), and the `prerequisites` of plan targets 5.1, 8.2, 8.3, 9.5.

   **Claim.** Each line lists what its statement and route need.

   **Witness.** Closure of the plan's prerequisites: closure(8.3) = {1.1, 3.1, 3.2}, yet line 635 uses `σ_M` (§3.3). Closure(5.1), (8.2) lack 3.5; lines 394, 622 use `P`, `H`. Closure(9.5) lacks 7.3, which §9.2 cites for the same conservation.

   **Exact repair.** This is the pattern the last repair treated for sections cited by number, here for objects used without a number.

   - §5.1: `*Needs:* §3.1–3.5.` (the API bullet "Conservation" uses `P` and `H` of §3.5); plan 5.1 gains `target:3.5`.
   - §8.2: add `§3.5` (the multiplier `a(t, P(V), H(V))` and "σ_M preserves `P` and `H`"); plan 8.2 gains `target:3.5`.
   - §8.3: add `§3.3` (the specular condition is `W(X, V) = W(X, σ_M V)`); plan 8.3 gains `target:3.3`.
   - §9.5: add `§7.3` (the route's "conservation of `H`" under `T_t`); plan 9.5 gains `target:7.3`.

   Tested mechanically on the plan with the four edges added: closure(8.3) contains 3.3; closure(5.1), (6.2), (6.3), (7.3), (8.2) contain 3.5; closure(9.5) contains 7.3 and 3.5. Every added prerequisite is an earlier target. No layer set changes (Layer 5 stays {2, 3, 4}, Layer 8 {3, 7}, Layer 9 {1, 2, 3, 7, 8}), so no `### Dependencies` line changes.

Three findings, all P3; none is P1 or P2. Each carries a repair to apply, so the verdict asks for changes: R01, R02 and R03 below, with their exact repairs. The three findings of the previous round are repaired. No supplier gap is declared and none is needed.

I edited neither the README, the plan nor the sources manifest, and fetched no source. No maintainer notes were supplied. This is the design lane: there is no `Suggested.lean`, and elaboration is not available (this lane does not elaborate; say so in the report). No Lean command was run.

## Previous findings, checked first

The preceding review is `REV-DESIGN-HardSphereDynamicsAndKineticLimits~6` (F01, F02, F03, all P3); its repair report is `packages/HardSphereDynamicsAndKineticLimits/reports/FIX-DESIGN-HardSphereDynamicsAndKineticLimits~7.md`. Nothing was marked `not actionable in this package`; nothing is re-raised.

| Round-6 finding | Status | Repaired passage and my check |
|---|---|---|
| F01, boundary pieces indexed by ordered pairs | Repaired | Line 229: "so `∂^±(j, i) = ∂^±(i, j)`: a boundary piece is determined by the unordered pair `{i, j}` and the sign". Line 234: "pieces with different unordered pairs or with opposite signs are disjoint". Line 242 is the negative control. Recomputed: `⟨v_1 − v_2, ν_12⟩ = 1 = ⟨v_2 − v_1, ν_21⟩`. Plan 3.2 has the test `pair_order`. |
| F02, "constant off a set of contact times" | Repaired | Line 389: "there is a set `𝒯 ⊆ J`, finite in every bounded subinterval of `J`, such that `V` is constant on every subinterval of `J` disjoint from `𝒯`". Line 433 uses the same clause in the converse. Head-on witness: `𝒯 = {1}`, `V` constant on `(−∞, 1)` and on `(1, ∞)`. |
| F03, internal layer lists | Repaired | Lines 463, 524, 666, 759, 842. I recomputed the union of the sections cited by each layer's `*Needs:*` lines: {2,3,4}, {1,3,4,5}, {3,7}, {1,2,3,7,8}, {1,2,7,9}. Each equals its line. Layers 3, 4, 7 give {1,2}, {1,2,3}, {5,6}, also equal. |

Adversarial pass on the passages the repair changed or added:

- **§3.2, "of the configurations of `𝒟̄`".** BGSS2023 lines 149–150 require every other pair at distance `> ε`; the new wording gives the same set. With `N = 3`, ε = 1, positions `(1, 0)`, `0`, `(0.5, 0)`: distances 1, 0.5, 0.5, the state is outside `𝒟̄` and outside every piece.
- **§5.4, contact times are locally finite.** If a contact time `t`, not the least element of `J`, were outside `𝒯`, then `V` is constant on some `(t − h, t]`; with `a = ℓ(x_i(t) − x_j(t))`, `|a| = ε`, `⟨a, u⟩ > 0`: `|a − h u|² = ε² − 2h⟨a, u⟩ + h²|u|² < ε²` for small `h`, and `‖π b‖ ≤ |b|` gives an overlap at `t − h`. Sound.
- **§5.4, `Y` constant off the contact times of `Z`.** On a subinterval without contact time `σ_M = id`, so `Y = V`; at a point of `𝒯` that is no contact time, `V(t) = σ_M V(t−) = V(t−)` and right-continuity make `V` continuous. Sound. The repair report's example (`J = [0, 2]` from the outgoing state, `𝒯 = ∅`, `Y(0) = ((−1, 0), 0)` against `(0, (−1, 0))` on `(0, 2]`) shows why the clause names contact times and not `𝒯`.
- **§5.4, converse.** A contact time of the left-continuous path outside `𝒯`, not the greatest element, would give an overlap just after it (incoming, constant velocity); so the contacts lie in `𝒯` and at most one endpoint, and the image path satisfies §5.1 with the set `𝒯 ∪ {contact times}`. Sound.
- **The four extended `*Needs:*` lines (§5.2, §6.4, §7.3, §10.4).** Each added section is cited in the statement or route of its target; the plan prerequisites equal the README lines for all 45 targets (checked mechanically, 0 differences). The same pattern for objects used without a section number is R03.

## Verified sound

### Coverage and principles

I read all 869 README lines, the 45 plan targets (167 tests, at least 3 per target, every target with a locator; counted mechanically), every `*Needs:*` line and the 9 manifest entries. Every `target:` prerequisite points to an earlier target. `gaps` is empty and no prerequisite is a `gap:`.

- No route-specific shortcut: every `d ≥ 1`, every flat position space, `0 < ε < ρ`; `d ≥ 2` only where `μ_ε → ∞` is used (§10.4, §10.5), with the `d = 1` counterexample as a Check.
- No re-planned roadmap, no upward or cyclic supply, no algorithm, no copied passage, no layer named after a source's chapter, no sentence saying the roadmap follows a source.
- A scan for LaTeX delimiters, pull-request numbers, dates, machine paths, `lemma`, "optional", "deferred", "removed", "current", "review", round labels and HTML anchors found none. "verbatim" (line 520) and "follows" (lines 124, 604) are mathematical uses.
- Shape: the headings are in the house order; ten layers, each with `### Examples` and `### Dependencies`; all 45 numbered sections have at least three Checks and exactly one `*Needs:*` line (counted mechanically).

### Adversarial table

`E` is Euclidean space. The head-on witness is ε = 1, `x_1 = (2, 0)`, `x_2 = 0`, `v_1 = (−1, 0)`, `v_2 = 0`. Rows cover the fifteen sampled targets, the headline theorems and the targets the findings touch. Determinants are central finite differences with step `10⁻⁶`, computed this round.

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §2.1 scattering map | ν = (1,0), `v = (0, 0.9)`, `w = (0.9, 0)`; head-on `v = (1,0)`, `w = (−1,0)`; swap | `c = ⟨v − w, ν⟩ = −0.9`, image `((0.9, 0.9), (0, 0))`, energy `0.81 + 0.81 = 1.62 + 0`; head-on `c = 2`, image `((−1,0), (1,0))`; `⟨v' − w', ν⟩ = c − 2c = −c`; `σ_ν(w, v) = (w + cν, v − cν)` | Sound | none |
| §2.2 cross-section (used by §10.2) | d = 2, 3 by quadrature; d = 1 | d = 2: 2.0000000; d = 3: 3.1415927 = `ω_2`; d = 1: `|k|`; `(w' − v')·(−ω) = (w − v)·ω` | Sound | none |
| §3.1 hard-core sets | ε = 1 on `E`; unit torus ε = 0.4; `N = 1`; packing | distance 1: in `𝒟̄`, not `𝒟`; 0.5: neither; torus distance 0.1 against 0.9 for representatives; `1/(0.04π) = 7.96`, at most 7 | Sound | none |
| §3.2 boundary pieces (changed) | both orders of the pair; a third particle at distance 0.5 | signs 1 and 1; state outside `𝒟̄` excluded | Sound | none |
| §3.4 free transport | boost identity; torus; non-example | `S_t B_c(X, V) = (X + π(tV) + π(tc), V + c) = A_{π(tc)} B_c S_t(X, V)`; d = 1: `(1, 1)`, `(0, 1)`, `(1, 1)`; `S_1(π0, e_1) = (π e_1, e_1) = (π0, e_1)`; `(2,0) − 1.5(1,0) = (0.5, 0)`, distance 0.5 | Sound | none |
| §3.5 collision invariants | witness of §2.1; separate reflection | `P = (0.9, 0.9)`, `H = 0.81` before and after; separate reflection of `((1,0), 0)`: `H = ½` kept, `P` from `(1,0)` to `(−1,0)` | Sound | none |
| §4.1 collision time (used by §4.2, §5.5) | head-on; grazing; miss; grazing state of §7.1 | `D = 1`, τ = 1; `a = (1,3)`: `D = 9 − 9 = 0`, τ = 3; `a = (2,3)`: `D = 9 − 12 = −3`; `a = (2,1)`: `D = 4 − 4 = 0` | Sound | none |
| §4.2 two-body map | head-on `s = 3`; oblique; incoming contact datum; semigroup at `s = τ`; reversal | `B_3 = ((3,0), (1,0))`; oblique `D = 0.64`, τ = 2.2, `q = (0.8, 0.6)`, `R_q u = (0.28, 0.96)`; `|a| = ε`, `⟨a,u⟩ < 0`: `D = ⟨a,u⟩²`, τ = 0, `B_0 = (a, R_a u) ≠ id`; `B_r(q, R_q u)` free since `⟨q, R_q u⟩ = √D > 0`, equal to `B_{τ+r}`; reversed datum hits `q` with `⟨q, −u'⟩ = −√D`, returns `(a, −u)` | Sound | none |
| §4.3 collision map, Jacobian | head-on; oblique; d = 3 at `a = (2.5, 0.4, −0.3)`, `u = (−1.1, −0.2, 0.1)`; d = 1; route | `C = (0, 0, 1, 0)`, `DC` rows (−1,0,0,0), (0,−1,0,−2), (0,0,−1,0), (0,2,0,3), det 1.0000000; oblique `C = (0.184, −1.512, 0.28, 0.96)`, det 1.0000000; d = 3 det 1.0000000; d = 1: `(2 − a − su, −u)`, det 1, variable time `(1 − 0.7u, −u)`, det 0; `dY + τ dU' = w − 2⟨n, w⟩n = R_q w` from `dτ = −⟨q, w⟩/⟨q, u⟩`, head-on: `(−w_1, w_2)` | Sound | none |
| §5.1 trajectories (changed) | `N = 1`; head-on; `𝒯 = {1/n}` on `(0, 1)`; left-continuous variant | no pairs, all clauses vacuous or `σ_M = id`; `𝒯 = {1}`, jump `σ((−1,0), 0) = (0, (−1,0))`; infinite in a bounded subinterval, excluded; `⟨(−1,0), (1,0)⟩ = −1`, not outgoing | Sound | R03 for the `*Needs:*` line |
| §5.2 uniqueness (headline) | forward at the supremum `s*` of agreement; backward at a jump time `s` | left limits agree at `s*`, so `V_i(s*) = σ_M V_i(s*−)` agree; `Z_1(s) = Z_2(s)` by right-continuity, so `V_i(s−) = σ_M V_i(s)` agree | Sound | none |
| §5.5 good set | `N = 2` on `E`, all cases of `(|a|, ⟨a,u⟩, D)`; triple contact | `|a| > ε`: `D < 0` or `u = 0` good, `D > 0` good (one non-grazing collision, past or future), `D = 0`, `u ≠ 0` bad; `|a| = ε`: `⟨a,u⟩ > 0` good, `≤ 0` bad (includes `u = 0`); three pairs sharing particles, no matching | Sound | R02 for the wording of Check 2 |
| §6.1 near-triple estimate | `N = 2`; `N = 3`, d = 1, `K = [0, 10]`, ε = 1, η = 0.5 (positions only, Monte Carlo, 4·10⁵ samples); shell area | `I = ∅`; measured 11.15 against `27 · 10 · (2 · 0.5)² = 270`; `π((1 + η)² − 1) = π(2η + η²)` | Sound | none |
| §6.3 iteration | step count; shell bound; `δ > 1`; `N = 2` | `⌈t/δ⌉ ≤ (t + 1)/δ` for `δ ≤ 1`; `ω_d((ε + 2Rδ)^d − ε^d) ≤ 2R d ω_d (ε + 2R)^{d−1} δ`; `λ(F) ≤ μ_X(K)^N vol(B_R) ≤ (…) δ`; `C₁ ≈ 56107.6` against measure 0 | Statement sound; Check 4 misworded | R01 |
| §6.4 Alexander's theorem (headline) | `N = 1, 2`; Borel description; negative times | complement empty; cylinder `D = 0` and contact set null; along a trajectory on `[0, t]` the second-nearest distance of each particle is continuous and `> ε`, so every step of size `t/m` passes for large `m`; reversed forward trajectory of `ℛZ` ends at `ℛℛZ = Z` | Sound | none |
| §7.1 group law (headline) | head-on `T_3`, `T_{−3}`; off `G` | `((2,0), 0; (−1,0), 0) ↦ ((1,0), (−2,0); 0, (−1,0)) ↦` back; identity on both sides | Sound | none |
| §7.2 measure preservation (headline) | `N = 2` on `E`; torus `N = 8` | `𝒟̄ ∖ G` null, `𝒟̄ᶜ` of infinite measure; `𝒟̄ = ∅` | Sound | none |
| §7.3 symmetries (headline) | head-on reversal; off `G`; grazing boost | `ℛT_3 Z = ((1,0), (−2,0); 0, (1,0))`; `T_{−3}ℛZ`: contact at time −1, earlier velocities `σ((1,0), 0) = (0, (1,0))`, positions `(1,0)`, `(−2,0)`: equal; off `G` both sides `ℛZ`; `D = 0`, `T_1` fixes the state, formula would give `(3,1)`, `(1,0)` | Sound | none |
| §8.2 weak Liouville (headline) | continuity at both ends of a piece | right end: limit `φ(t, Z⁻)` at the incoming state, equal to `φ(t, T_t Z)` by the specular condition; left end: right-continuity from the material derivative at the outgoing state | Sound | R03 for the `*Needs:*` line |
| §9.1 Maxwellians | d = 1; d = 3; pinned density at `S = β⁻¹ • 1` | `M(0) = 0.3989423`; `(2π)^{3/2} = 15.7496099`; `(2π)^{−d/2} (β^{−d})^{−1/2} = (β/2π)^{d/2}`; `Σ|v − u|²` conserved from `v + w` and `|v|² + |w|²` | Sound | none |
| §9.4 invariance (headline) | Maxwellian; indicator profile | density a function of `(H, P)` times `1_𝒟̄`; `|(0.9, 0.9)| = 1.2728 > 1`, product `1 ↦ 0` | Sound | none |
| §9.5 correlation identity (headline) | resummation; inversion; ε = 0; circle bound | `Σ_N (1/N!) · N!/(N − n)! ∫W_N^{(n)} h = Σ_p (1/p!) ∫W_{n+p}^{(n)} h`; `Σ_{p+q=m} (−1)^p/(p! q!) = 1, 0, 0, 0, 0` for `m = 0..4`; `μ^{−n} Σ_p μ^{n+p}/(p! e^μ) = 1`; `0.8√(2π) = 2.0053026 ≤ 2.5066283` | Sound | R03 for the `*Needs:*` line |
| §9.6 chaos and scaling (headline) | exact factorisation; d = 3, ε = 0.01; d = 1 | `F_n(0) = (f⁰)^{⊗n} 1_{𝒟̄_n} · Z⁻¹ Σ_p (μ^p/p!) ∫ Π f⁰ 1[admissible, none within ε of `X_n`]`, the stated probability; `1 − p_ε ≤ μ n ω_d ε^d ‖ρ⁰‖_∞`; `ε^{−(d−1)} ω_d ε^d = ω_d ε`, `ω_3 · 0.01 = 0.0418879`; d = 1: `1 − 2ε‖ρ⁰‖_∞ ≤ E[N] ≤ 1` | Sound | none |
| §10.1 empirical measure | first and second moment | `μ⁻¹ · μ∫F_1 h`; `μ⁻²(μ∫F_1 h² + μ²∫F_2 h⊗h)`; `h = 1`: `N/μ` | Sound | none |
| §10.4 Lanford's statement | clause 1 against the source | masses `μ^{−n}E[descFactorial N n] = ∫F_n(0) → 1` (§9.6) and `∫f(t)^{⊗n} = 1`, so the almost-everywhere clause gives the weak clause; the hypotheses imply BGSS2023 (1.1.5) with `2C₀` | Consistent with the source | none |
| §10.5 law of large numbers (headlines) | second moment; d = 1 | `0 + m² − 2m² + m² = 0`; `1 − e⁻¹ = 0.6321206` | Sound | none |
| Dependencies lines (changed) | union of each layer's `*Needs:*` sections | the ten sets above, each equal to its line | Sound | none |

### Seeded source sample

I opened the three readable texts at every locator of the fifteen sampled targets. The author flagged no locator as unverified.

| Target | Text opened and result |
|---|---|
| 2.1 | GST2013 lines 843–847 ((4.1.2)) and 1222–1227 ((4.4.1)); BGSS2023 lines 125–131 ((1.1.2)); DengHaniMa2024 lines 157–163 ((1.2)). Confirmed. |
| 3.1 | GST2013 lines 839–841 (strict inequality); BGSS2023 lines 137–142; DengHaniMa2024 lines 150–153 (closed domain). Confirmed. |
| 3.4 | GST2013 lines 836–837 ((4.1.1)); BGSS2023 lines 122–123 ((1.1.1)). Confirmed. |
| 3.5 | GST2013 (2.1.3), lines 396–399. Confirmed. |
| 4.2 | GST2013 lines 842–847; BGSS2023 lines 133–136. Confirmed; the map `B_s` is the roadmap's own. |
| 4.3 | GST2013 line 883 (invariance of the measure, used without proof); DengHaniMa2024 lines 186–187. Both support "statement used in"; the Jacobian is recomputed above. |
| 5.1 | GST2013 lines 836–847; BGSS2023 lines 122–131; DengHaniMa2024 lines 140–172 (Definition 1.1, left-continuous velocities at line 166). Confirmed. |
| 5.5 | GST2013 lines 851–854 (pathological trajectories). Confirmed. |
| 6.1 | GST2013 Lemma 4.1.1, lines 867–874 (the lemma is announced at 864). Confirmed; the source states the bound with an unnamed constant, the explicit form is the roadmap's. |
| 6.3 | GST2013 lines 875–898; `t/δ` an integer at line 876; the factor `(1 + jδ)^{d(N−2)}` with `R^{d(N−2)}` at lines 893–896, which is `(r + jRδ)^{d(N−2)}` at `r = R`. Confirmed. |
| 7.3 | GST2013 (1.1.1), lines 211–215; BGSS2023 lines 184–187; GST2013 lines 835–847, printed p. 27 (printed p. 28 begins at line 857); lines 396–399. Confirmed. |
| 9.1 | GST2013 (2.2.5), lines 489–492, with `θ = 1/β` and density 1. Confirmed. |
| 9.5 | BGSS2023 (1.1.10), lines 267–277; (1.1.9), lines 241–266, the indicator at line 249, printed p. 3; (1.1.11), lines 279–288; the inversion formula, lines 229–237; DengHaniMa2024 (1.11), lines 235–244. Confirmed. |
| 9.6 | BGSS2023 (1.1.8), lines 211–217; DengHaniMa2024 (1.12), lines 246–252. Confirmed; the two-sided bound is the roadmap's. |
| 10.1 | BGSS2023 (1.2.4)–(1.2.5), lines 324–334; (1.2.6), lines 335–340; the second moment, lines 352–369. Confirmed. |

Also read: BGSS2023 lines 148–152 (§3.2), 158–181 (§7.5, §9.2, §9.3), 316–321 and 344–349 (§10.4, §10.5); GST2013 lines 394–400, 432–437, 674, 1264–1268 (§2.2), 668–674 and 687–696 (§10.4), 5437–5440; DengHaniMa2024 lines 182–188, 199–223.

### Pinned declarations

Pins: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`, Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5` (the manifest's revisions, the checkouts' heads and the plan's baseline agree). Every Mathlib and Tau Ceti name of the supplier contracts was resolved this round. Paths are relative to each library.

- `Mathlib/MeasureTheory/Measure/Lebesgue/VolumeOfBalls.lean:308`; `Mathlib/Analysis/Normed/Group/Quotient.lean:222` (`instNormedCommGroup`, with `IsClosed`; additive by `to_additive`); `Mathlib/Topology/Algebra/OpenSubgroup.lean:377` (with `T1Space`); `Mathlib/MeasureTheory/Constructions/Polish/Basic.lean:119`, `:148`, `:154`, `:649`; `Mathlib/Topology/MetricSpace/ProperSpace.lean:66`.
- `Mathlib/Algebra/Module/ZLattice/Basic.lean:93`, `:434`, `:645`; `Mathlib/Algebra/Module/ZLattice/Covolume.lean:73`, `:85`; `Mathlib/MeasureTheory/Group/FundamentalDomain.lean:731`, `:754` (`addProjection_respects_measure`), `:801`; `Mathlib/MeasureTheory/Measure/Haar/Quotient.lean:75`, `:222`; `Mathlib/Topology/Instances/AddCircle/Real.lean:55`; `Mathlib/Analysis/Fourier/AddCircleMulti.lean:173`.
- `Mathlib/MeasureTheory/Function/Jacobian.lean:1096`, `:1184`; `Mathlib/Analysis/InnerProductSpace/Projection/Reflection.lean:52`; `Mathlib/Analysis/InnerProductSpace/Projection/FiniteDimensional.lean:59`; `Mathlib/MeasureTheory/Measure/Lebesgue/EqHaar.lean:172`, `:231` (`det f ≠ 0`), `:527` (`Nontrivial E`); `Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean:734`; `Mathlib/MeasureTheory/Constructions/HaarToSphere.lean:52`, `:88`.
- `Mathlib/Analysis/SpecialFunctions/Gaussian/FourierTransform.lean:330` (`0 < b`); `Mathlib/Probability/Distributions/Gaussian/Real.lean:47`; `Gaussian/Multivariate.lean:166`; `Poisson/Basic.lean:40` (parameter in `ℝ≥0`); `Mathlib/MeasureTheory/Constructions/Pi.lean:732`; `Mathlib/MeasureTheory/Function/LpSpace/Basic.lean:595`, `:611`; `Mathlib/MeasureTheory/Function/ContinuousMapDense.lean:142`; `Mathlib/MeasureTheory/Integral/IntervalIntegral/FundThmCalculus.lean:1140`; `Mathlib/Probability/Moments/Variance.lean:398` (`IsFiniteMeasure`, `MemLp X 2`); `Mathlib/Data/Nat/Factorial/Basic.lean:332`, `:367`, `:424`; `Mathlib/MeasureTheory/MeasurableSpace/Constructions.lean:871`; `Mathlib/Dynamics/Flow.lean:85`.
- `TauCeti/Probability/Distributions/Gaussian/Density.lean:82` (the formula the README quotes, `S : Matrix ι ι ℝ`), `:265` (`S.PosDef`); `TauCeti/Analysis/Semigroups/Group/Basic.lean:74` (fields `map_zero'`, `map_add'` for all real `s, t`, `continuousAt_zero'`; a real normed space, no completeness); `TauCeti/Probability/Process/EmpiricalMeasure.lean:224` (a `ProbabilityMeasure`, `[Nonempty κ]`); `TauCeti/Dynamics/Flow/OfLipschitz.lean:59` (namespace `TauCeti`, a Banach space, returns `Flow ℝ E`).

Every name exists, in the namespace the README gives, with the hypotheses the contract states. Mathlib also has `MeasureTheory.Lp.compMeasurePreserving_continuous` (`Mathlib/MeasureTheory/Function/LpSpace/ContinuousCompMeasurePreserving.lean:54`), for continuous measure-preserving maps; the hard-sphere flow is not continuous, so §7.4 does not restate it.

### Duplication, ownership and overlap

`scratch/overlaps.md` lists no other pull request changing this roadmap, no dropped id, no id that only a revision defines and no second copy; the folder is not on main. Object searches over main and the open heads (index of 2026-11-15):

- "hard sphere": only ClassicalErgodicTheory (outside its scope, and a consumer of its §3.5) and MathematicalBilliards (a downstream remark).
- Lanford, Maxwellian, grand canonical, collision operator, `FlatPositionSpace`, `HardSphere.`: no match anywhere. "Boltzmann": only the Boltzmann entropy of OptimalTransport.
- Flat tori: examples in GeometricTopology, DGFloer and MathematicalBilliards (`ℂ/Λ` as a translation surface); ComplexTori on main is the complex Lie group. No roadmap owns `E ⧸ L` in dimension `d` with its quotient norm and Haar measure.
- Correlation functions: RandomMatrices §8.1 (eigenvalue counts on a reference measure) and PointProcesses (densities of factorial moment measures of unlabelled point measures). The function here is a formula on labelled configurations with the `μ^{−n}` rescaling.

The one cross-roadmap supplier, ClassicalErgodicTheory §3.5, was read at the head of its open pull request. Its heading is "Flows defined almost everywhere"; item 1 is conull flows with the identity extension, item 3 disjoint unions with "invariant iff each component restriction is", item 4 `(Φ t)_* ν = μ.withDensity (W ∘ Φ (-t))`; its standing hypotheses are a standard Borel space and a σ-finite measure, and its measurable flow is a jointly measurable `AddAction ℝ X`. The contract at README lines 73–79 says the same. Its §0.2 assumes a finite invariant measure, as the scope paragraph says. StandardDistributions is on main and OneParameterSemigroups under `Completed/`; both are cited through pinned Tau Ceti declarations. The 17 names of `scratch/citations.md` are this roadmap's own declarations for the package stage (README line 85). No roadmap of the never-cite list is cited as a supplier: PointProcesses is named only as the owner of a deferred subject.

Overlap check: read ClassicalErgodicTheory, MathematicalBilliards, PointProcesses, OptimalTransport, RandomMatrices, StochasticCalculus (third list empty); conull flows, their disjoint unions and the transport of densities: owner ClassicalErgodicTheory §3.5, cited here; Koopman strong continuity for a probability or finite invariant measure: owners MathematicalBilliards §12.3 and ClassicalErgodicTheory §0.2, not shared (infinite measure here); correlation functions of unlabelled point processes: owners PointProcesses and RandomMatrices §8.1, not restated; nothing else shared.

### Supplier order

```text
candidate: HardSphereDynamicsAndKineticLimits is not in the merge order yet; checked as if placed after MathematicalBilliards (the intake inserts it when its design is accepted)
depcheck: 245 roadmaps, 2229 edges, 0 problem(s)
```

No UPWARD or CYCLE line. ClassicalErgodicTheory is another author's open pull request that adds a new roadmap folder (it is not on main), which this roadmap may consume. It is not in `merge-order/ORDER.txt`, so the check does not see the edge. By reading: ClassicalErgodicTheory cites nothing of this roadmap and names the hard-sphere flow only as a consumer; its supplier MathematicalBilliards is the last line of the order. The order is MathematicalBilliards, ClassicalErgodicTheory, HardSphereDynamicsAndKineticLimits.

### Headline theorems

Named for the package stage: `HardSphere.IsTrajectory.eqOn` (§5.2), `HardSphere.volume_hardCoreSet_diff_goodSet` (§6.4), `HardSphere.flow_add` (§7.1), `HardSphere.measurePreserving_flow` (§7.2), `HardSphere.flow_reversal` (§7.3), `HardSphere.weak_liouville` (§8.2), `HardSphere.grandCanonical_flow_invariant` (§9.4), `HardSphere.lintegral_sum_distinct_eq_correlation` (§9.5), `HardSphere.boltzmannGrad_scaling` (§9.6), `HardSphere.tendsto_empirical_of_correlation` and `HardSphere.LanfordStatement.tendsto_empirical` (§10.5). Each names the roadmap's objects. The padding probe and the `#check` comparison have nothing to run on at this stage.

Remarks that need no change:

- §4.2: the semigroup law `B_{s+r} = B_r ∘ B_s` holds on the incoming contact states too (`B_s(a, u) = (a + s R_a u, R_a u)` there); the stated restriction is harmless.
- §5.2, Check 4 says the outgoing condition "only excludes grazing contacts"; it also excludes an incoming contact at a greatest element of `J`. The uniqueness argument uses neither.
- §1.4 closes with both locators after the packing sentence; GST2013 line 873 supports the shells and BGSS2023 line 165 the emptiness for large `N`.

### Copyright, licences and scope

- **Wording.** Beside the fifteen sampled locators I compared seven further passages with the source text: the Summary's sentence on the law of large numbers and §10.5 with BGSS2023 lines 341–349; §5.5 with GST2013 lines 851–863; §6.3's route with GST2013 lines 875–898; §7.3's sentence on indistinguishability with GST2013 lines 211–215; §9.3's conditional i.i.d. statement with BGSS2023 lines 184–187; §9.5's prose with BGSS2023 lines 227–240; §10.4 with BGSS2023 lines 316–321. The longest shared run is three words ("concentrate on the", "leading to … pathological"). No sentence follows a source clause by clause.
- **Arrangement.** GST2013 has the largest share, 48 of the 114 source citations in the body. Its contents (lines 45–110): Chapter 1 the low density limit, Chapter 2 the Boltzmann equation, Chapter 3 main results, Chapter 4 the `N`-particle flow, the Liouville equation and hierarchies, Chapters 5–7 estimates and convergence. Layers 1–4 have no counterpart; Layers 5–7 expand its §4.1; the collision operator, which the source puts in Chapter 2, is in Layer 10. No run of layers maps one to one onto a run of its chapters or sections. The order of Layers 7 to 10 is forced: §8.1 needs §7.2, §9.5 needs §8.1 and §8.4, §10.1 needs §9.5.
- **Reuse.** No table, figure, list of examples or numerical data is taken from a source; the worked examples and non-examples are the roadmap's own.

Source independence: 22 passages compared with 3 sources, none shared; largest share GST2013, 48 of 114 locators; contents compared with GST2013: independent.

## Not verifiable

- Alexander1976 Proposition 4.3 and AlexanderThesis1975 Chapter 1: settled uncertified; only the attribution in GST2013 (line 855, lines 5437–5440) was read.
- Lanford1975, CIP1994, Spohn1991, Uchiyama1988: settled uncertified; not read, not requested again.
- Lean elaboration, the one-tactic padding probe and the `#check` comparison: not available (this lane does not elaborate), and there is no `Suggested.lean`.
- The truth of `HardSphere.LanfordStatement` beyond its agreement with BGSS2023 Theorem 1, its `t = 0` case and its equilibrium case: the proof belongs to the BBGKY roadmap and was not reconstructed.
- The dependency check's verdict on the ClassicalErgodicTheory edge: the tool does not see it; the direction was checked by reading.
- Ownership against open pull requests was checked through the indexed heads (475 pull requests, index of 2026-11-15). The two board packages on other branches (AnalyticNumberTheory, LawrenceVenkateshMethod) were not opened; neither is in this subject.

## Source issues

- **Misprint** in GST2013 at (4.4.1), printed p. 33: the source says the starred velocities are the pre-image of the pair under (4.1.1), the free flow; it should be under the reflection law (4.1.2); affects nothing.
- **Gap** in GST2013 at Proposition 4.1.1, proof, printed p. 28: the source invokes invariance of Lebesgue measure under the partially constructed flow without proving it for the collision step; it should establish the unit Jacobian of the two-body step first; affects the proof.
- **Error** in DengHaniMa2024 at Proposition 1.2(3), printed p. 4: the source says the flow maps are diffeomorphisms off one closed null set; it should say measure-preserving bijections, smooth on the pieces with a fixed collision sequence; affects a stated result.

## For the human reviewers

- Licence: the three texts read are arXiv copies. Six cited works are recorded `uncertified` and were not read; two (Alexander1976, Uchiyama1988) are open on Project Euclid, but the service received a bot-protection page (`sources.toml`).
- Scope: the subject has a refereed literature (BGSS2023 is Ann. of Math. 198; GST2013 is an EMS monograph). DengHaniMa2024 is cited in its arXiv version (v3); I did not check whether it has appeared.
- Supplier: ClassicalErgodicTheory is another author's open pull request. This roadmap's pull request has to name it in its merge-order paragraph, and the item numbers of its §3.5 are fixed only when it merges.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "c801bb778a52facc808df97ed27acd031d97ded2", "job": "REV-DESIGN-HardSphereDynamicsAndKineticLimits~7", "model": "fable", "worker": "chris-x82"} -->
