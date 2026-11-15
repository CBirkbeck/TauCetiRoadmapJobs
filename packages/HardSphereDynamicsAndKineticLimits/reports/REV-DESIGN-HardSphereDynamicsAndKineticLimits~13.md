<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13780#issuecomment-6900794643 -->
Review (claude) of f117d02

Verdict: needs_changes

**For the human reviewers:** this review raises 4 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) §4.3's route names the wrong differential

   **Location.** `packages/HardSphereDynamicsAndKineticLimits/design/README.md:345`: "with `w = da + τ du` the differential of `Y + τ U'` (where `(Y, U') = C(a, u)`) is `R_q w`".

   **Claim.** The differential of the function `Y + τ U'` equals `R_q w`.

   **Witness.** `Y + τ U' = a + τ u = q`, whose differential is `w + u dτ`. At the section's own witness (ε = 1, `a = (2, 0)`, `u = (−1, 0)`, `dτ = da_1 + du_1`) it is `(0, da_2 + du_2)`, while `R_q w = (−da_1 − du_1, da_2 + du_2)`.

   **Exact repair.** Replace the clause by: "with `w = da + τ du` and `(Y, U') = C(a, u)`, the combination `dY + τ dU'` of the two differentials (τ itself is not differentiated) is `R_q w`". Tested on the witness with the rows of the section's second Check: `dY = (−da_1, −da_2 − 2du_2)`, `dU' = (−du_1, 2da_2 + 3du_2)`, τ = 1, so `dY + τ dU' = (−da_1 − du_1, da_2 + du_2) = R_q w`. In general `dY + τ dU' = w + (u − R_q u) dτ = w − 2⟨n, w⟩n` with `n = q/ε` and `dτ = −⟨n, w⟩/⟨n, u⟩`. The coordinates `(dY + τ dU', dU')` named later in the same sentence are already the right ones; the statement `det DC = 1` is unaffected.

2. **F02** (P3) the plan has no test for the fourth Check of §5.2

   **Location.** `design/README.md:419` ("The proof does not use the outgoing condition, which only excludes grazing contacts…") and `design/plan.json`, target `5.2`, `tests`.

   **Claim.** Every README Check has its test in the plan.

   **Witness.** §5.2 has four Check bullets; the plan's target 5.2 has three tests (`free_unique`, `outgoing_state`, `gluing`). It is the only one of the 45 targets where the two counts differ (compared mechanically).

   **Exact repair.** Add to target 5.2 of `design/plan.json`: `{"name": "grazing_admitted", "kind": "characterisation", "statement": "The uniqueness argument does not use the outgoing condition: it gives uniqueness for the weaker notion admitting grazing contacts (σ fixes grazing pairs), e.g. the two-body path tangent at q = (1, 0) of 4.1."}`. Tested: at `a = (1, 3)`, `u = (0, −1)`, ε = 1, `D = 9 − 9 = 0`, the path touches at `q = (1, 0)` at time 3 with `⟨q, u⟩ = 0`, `R_q u = u`, so the jump rule leaves the velocity unchanged and the path is the unique candidate.

3. **F03** (P3) §7.2's `*Needs:*` line omits a prerequisite the plan lists

   **Location.** `design/README.md:556`: "*Needs:* §5.5, §6.2, §6.4, §7.1, ClassicalErgodicTheory §3.5 (item 1)." and `design/plan.json`, target `7.2`, `prerequisites`.

   **Claim.** The README's `*Needs:*` lines and the plan's prerequisites agree.

   **Witness.** The plan's target 7.2 lists `mathlib:MeasureTheory.MeasurePreserving`; the README line does not. It is the only library prerequisite that differs over the 45 targets (the `target:` prerequisites agree everywhere).

   **Exact repair.** Append ", Mathlib `MeasureTheory.MeasurePreserving`" to the `*Needs:*` line of §7.2, the form §2.1 and §3.4 use for the same declaration. Tested: the statement of §7.2 ("`T_t` is measure preserving for `λ_N`") is stated with that structure, which is in the contract (`From Mathlib`, with `measurePreserving_piCongrLeft`).

Three findings, all P3; none is P1 or P2. Each carries a repair, so the verdict asks for changes and a fix round applies the three repairs. No supplier gap is declared and none is needed. I edited neither the README, the plan nor the sources manifest, and fetched no source. No maintainer notes were supplied. This is the design lane: there is no `Suggested.lean`, and elaboration is not available (this lane does not elaborate; say so in the report). No Lean command was run.

## Previous findings, checked first

The preceding review is `REV-DESIGN-HardSphereDynamicsAndKineticLimits~12` (F01–F03, all P3); its repair report is `packages/HardSphereDynamicsAndKineticLimits/reports/FIX-DESIGN-HardSphereDynamicsAndKineticLimits~13.md`. Nothing was marked `not actionable in this package`; nothing is re-raised.

| Round-12 finding | Status | Repaired passage and my check |
|---|---|---|
| F01, §7.4's locator closed the strong continuity | Repaired | Line 573: "The operator `f ↦ f ∘ T_{−t}` is the solution operator of GST2013 (4.3.5), lines 1138–1140, and the flow operator of DengHaniMa2024 (1.5), lines 175–178; its isometry and strong continuity on `Lp` are proved here and are stated in neither source." GST2013 line 1140: `f ↦ f(Ψ_s(−t, ·))` on continuous functions; DengHaniMa2024 lines 175–178: `f ∘ H_N(t)⁻¹`. Signs agree with `T_{−t}`. The same pattern in §8.1 (line 608) is repaired too: DengHaniMa2024 (1.9)–(1.10), lines 224–234, give the law of `z(t)` on sets and `W_N(t) = S_N(t) W_{0,N}`, which is the duality for indicators only, as the sentence now says. |
| F02, how `LanfordStatement` obtains the torus structure | Repaired | Lines 85, 813, 830, 851 and the Check at 824: the properness of `𝕋^d` and `[FlatPositionSpace d 𝕋^d]` are instance arguments. I re-derived the classification the Check rests on: a cover `π'` is 1-Lipschitz, lifts to a linear `B`; `|Ba| = ‖π(Ba)‖ ≤ |a|` for small `a`; the local-measure axiom on a small ball gives `|det B| vol(A) = vol(A)`; singular values ≤ 1 with product 1 are all 1. Witness recomputed: quarter turn `B(0.3, 0) = (0, 0.3)`; `B(0, 0.5) = (−0.5, 0)`, `B(0, −0.5) = (0.5, 0)`, difference `e_1 ∈ ℤ²`. |
| F03, no scope clause for RandomMatrices §8.1 | Repaired | Line 11: "RandomMatrices §8.1 defines the `k`-point correlation function of the eigenvalue counts… §9.5 keeps its own definition…, so it is not consumed." `TauCetiRoadmap/RandomMatrices/README.md:1141–1144` on main states the factorial-moment identity for pairwise disjoint `Bⱼ`. New Check at line 738 recomputed: Poisson λ = 1, `E[N(N − 1)] = 1 = 4 · ¼`, `E[N²] = 2`. |

The repaired patterns elsewhere: a locator that closes more than its source states (I reread the locators of §3.3, §4.1, §4.3–4.5, §6.1, §7.1, §7.2, §8.2, §9.2, §9.6, §10.1, §10.2 against the texts: each either supports its statement or is marked "statement used", "derived here" or "stated in none of the sources"); a statement on `𝕋^d` that needs the §1.3 instance (only §10.4 and the corollary of §10.5 fix the torus; every other headline is on a generic `[FlatPositionSpace d X]`). None found.

## Verified sound

### Coverage and principles

I read all 874 README lines, the plan (10 layers, 45 targets, 172 tests, at least 3 per target; `gaps` empty) and the 9 manifest entries.

- README `*Needs:*` lines against the plan, compared mechanically: `target:` prerequisites agree for all 45 targets; library prerequisites differ once (R03); Check and test counts differ once (R02). One `*Needs:*` line per numbered section; no prerequisite is later than its target. The ten `### Dependencies` lines agree with the `*Needs:*` lines of their layers.
- No route-specific shortcut (`d ≥ 1`, every flat position space, `0 < ε < ρ`; `d ≥ 2` only in §10.4 and the corollary of §10.5, with the d = 1 counterexample as a Check), no re-planned roadmap, no upward or cyclic supply, no algorithm, no layer named after a source's chapter, no sentence saying the roadmap follows a source.
- A scan for LaTeX delimiters, pull-request numbers, machine paths, `lemma` (two hits, both the source's "Lemma 4.1.1"), `set_option`, "optional", "deferred", "removed", "so far", "checkpoint", "handoff", HTML anchors and round labels found nothing.
- The 24 backticked names of this roadmap's own in the README are the class, the 12 definitions and the 11 theorems that line 85 lists for `Suggested.lean`; no other own name is backticked.
- Remarks that need no change. §7.4's statement is at the natural generality for its object; the scope paragraph says why ClassicalErgodicTheory §0.2 (finite measure), MathematicalBilliards §12.3 (probability space) and ProbabilisticAndMetricNumberTheory §4.9a (continuous action) do not cover it. §10.4 asks for a continuous datum with a Lipschitz bound, the intersection of the hypotheses of GST2013 Theorem 4 (continuous) and BGSS2023 (1.1.5); the Lipschitz bound gives (1.1.5) with `2C₀`. §10.5's route ends with Chebyshev for the variance while the centred quantity is the second moment about `∫ f h`; the difference `E π − ∫ f h → 0` closes it, and a route is not mandatory.

### Adversarial table

`E` is Euclidean space; the head-on witness is ε = 1, `x_1 = (2, 0)`, `x_2 = 0`, `v_1 = (−1, 0)`, `v_2 = 0`. I computed every value this round.

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §1.1 class | isometry below ρ; ball image; sphere | `|c| < ρ`: lift `a'` of `π c`, `|a'| = ‖π c‖ ≤ |c|`, injectivity gives `a' = c`; `π(B(a, r)) = B(π a, r)` both inclusions for `r ≤ ρ`; sphere of radius `r < ρ` is `π` of a null set | Sound | none |
| §1.2 (sampled) | ρ = ∞; ρ = 2 | `ℓ = id`; `10⁴π = 31415.93`; radius-2 structure satisfies all axioms, ball axiom stops at 2 | Sound | none |
| §1.3, §1.4 | torus norms; packing; shell | `‖π(½, ½)‖ = 0.7071`; `2ℤ × ℤ`: covolume 2, ρ = ½; `π/16` against `π/32`; `0.04π = 0.12566`, `7 × = 0.8796 ≤ 1 < 1.0053`; circle shell length 0.2 against 0.4 | Sound | none |
| §2.1, §2.2 | reflection; Θ²; kernel; d = 1, 2, 3 | `(v, w) − ⟨v − w, ν⟩(ν, −ν)`; witness `((0.9, 0.9), 0)`, energy 1.62 both sides; `(w' − v')·(−ω) = (w − v)·ω = 0.9`; `½ω_{d−1}(1 − (d−1)/(d+1))(d+1) = ω_{d−1}`: 1, 2, π; `π/(4π) = ¼` | Sound | none |
| §3.1 (sampled) | closed/open; torus distance; packing threshold | `0, (1, 0)` in `𝒟̄_2 ∖ 𝒟_2`; `π(0.05, 0)`, `π(0.95, 0)` at distance 0.1 < 0.4; ε = 1.5 on the circle: `1/(2 · 0.75) = ⅔ < 1` yet `𝒟̄_1` is everything; ε = 1: threshold 1, largest distance ½ | Sound | none |
| §3.3 (sampled) | ℛ²; outgoing state; no contact | `−σ_M(−σ_M V) = V`; `σ_M((1, 0), 0) = (0, (1, 0))`, `ℛ` gives `(0, (−1, 0))`, `⟨v_1 − v_2, ν⟩ = 1 > 0` again; `−V` gives `−1 < 0` | Sound; GST2013 (4.4.1), lines 1219–1227 | none |
| §3.4 (sampled) | group law; torus; boost | `π(e_1) = π(0)`; `S_2(0, (1, 0)) = ((2, 0), (1, 0))`; distance 0.5 at `t = 1.5`; `S_1B_1(0, 0) = (1, 1)`, `B_1S_1(0, 0) = (0, 1)`, `A_1B_1S_1 = (1, 1)` | Sound | none |
| §4.1 (sampled) | head-on; grazing; miss; `u = 0`; larger root | `D = 4 − 3 = 1`, τ = 1, `⟨q, u⟩ = −1`; `D = 9 − 9 = 0`, `q = (1, 0)`; `D = 9 − 12 = −3`; `D(a, 0) = 0` with `⟨a, u⟩ = 0`: first no-contact case; smaller root ≥ 0 iff `|u|²(|a|² − ε²) ≥ 0`; larger root 3 at `(−1, 0)` | Sound | none |
| §4.2 | head-on; oblique; semigroup at contact | `B_3 = ((3, 0), (1, 0))`; `D = 0.64`, τ = 2.2, `R_q u = (0.28, 0.96)`, norm 1; from an incoming contact `B_r B_0 = B_r` | Sound | none |
| §4.3 (sampled) | `dτ`, `dq`, `DC` from the definitions; d = 1; route | `dD = −2du_1`, `dτ = da_1 + du_1`, `dq = (0, da_2 + du_2)`, `dU' = (−du_1, 2da_2 + 3du_2)`, `dY = (−da_1, −da_2 − 2du_2)`, determinant `(−1)(−1)(−3 + 4) = 1`; d = 1: `C = (2ε − a, −u)`, determinant 1; variable time: 0; `d(Y + τU') = (0, da_2 + du_2) ≠ R_q w` | Statement sound; route wording | R01 |
| §4.4 (sampled) | `s = 0`; contact exactly at `s`; grazing set; `u = 0`; inelastic rule | `B_0(a, u) = (a, R_a u)` on incoming contacts, the image of the outgoing state: the only non-injectivity; a free preimage of `(q, R_q u)` would be inside the ball just before `s`; `D = 0` iff `|a_⊥| = ε` for `u ≠ 0`, empty in d = 1; `{u = 0}` null; dimension `2d − 1` | Sound | none |
| §4.5 (sampled) | head-on; three particles; determinants | `w = (−1, 0)`, `v_2(t) = (w − u(t))/2`: 0 then `(−1, 0)`, `h = (−2, 0)`, `x_2 = (−2, 0)`, `x_1 = (1, 0)`; `0.1, 2.1, 20`; `2^d` cancels; `|a'| ≤ |a| + 2Rs < ρ` | Sound | none |
| §5.2 (sampled, headline) | forward; backward; gluing at `b`; grazing | `V(t) = σ_{M(t)}V(t−)` at every `t`, so the supremum of the agreement set is not attained short of the end; `V(t−) = σ_M V(t)`; `x_2(2) = (−2, 0)`; at `a = (1, 3)`, `u = (0, −1)`: `R_q u = u` | Sound | R02 (plan only) |
| §5.5 | `N = 2` exceptional set | all six sign cases of `(|a| − ε, ⟨a, u⟩, D)`; `a = (−2, 1)`, `u = (−1, 0)`: `D = 4 − 4 = 0`, tangency at time −2 at `(0, 1)` | Sound | none |
| §6.1 (sampled) | count; `N = 2`; `N = 3` | `N³` triples, two shells `ω_d((ε + η)^d − ε^d)` (needs `ε + η < ρ`), `N − 2` free positions; `I = ∅`; `π(2η + η²)` | Sound; own form of GST2013 Lemma 4.1.1 | none |
| §6.2, §6.3 | relative speed; constants; `N = 2` | `|v_i − v_j| ≤ √2 R ≤ 2R`; non-near pairs stay `> ε`; `(ε + 2Rδ)^d − ε^d ≤ 2Rd(ε + 2R)^{d−1}δ`; `⌈t/δ⌉ ≤ (t + 1)/δ`; `8(12π)²(π²/2) = 576π⁴ = 56108`; `(2, 1)`: `√5 ≤ 3`, grazes at 2 > δ, then `(1, 1)` grazes at 1 ≤ δ | Sound | none |
| §6.4 (headline) | Borel description; negative times | second-nearest distance continuous and `> ε` on `[0, t]`, so the union over `m, R` is exact; `ℛ(ℛZ) = Z` glues at 0 | Sound | none |
| §7.1–7.3 (headlines) | `T_3`; grazing state; reversal; carriers | `((1, 0), (−2, 0); 0, (−1, 0))`; `D = 4 − 4 = 0`, `T_1Z = Z` against `x_1 = (1, 1)`; `ℛT_3Z = T_{−3}ℛZ = ((1, 0), (−2, 0); 0, (1, 0))`; `𝒟̄ᶜ` of infinite measure on `E` | Sound | R03 (Needs line) |
| §7.4 | group law; `p ≠ 2`; masses | `U_sU_tf = f ∘ T_{−t−s}`; support of `U_tf − f` has measure ≤ twice that of `supp f`; gaps ≥ ⅓ summing to 1 are all ⅓ | Sound | none |
| §8.2 (sampled, headline) | left limit; support of `Lφ`; box | `r ↦ φ(t_k + r, S_rY)` differentiable at 0 at the incoming state `Y`, so the left limit is `φ(t_k, Y) = φ(t_k, X, σ_MV)`; `Lφ = 0` at the end of the time support; τ ∈ `(0.9519, 1.0521)`, `H ∈ (0.4802, 0.5204)`, defect `E v_1 − E v_2 = −1` | Sound | none |
| §8.3, §8.4 | marginal; count | `g(z_1)(1 − ω_dε^d)∫g̃`; `e^{−1.62} = 0.19790`, `1.2728 > 1`; `3 · 2 = 6` against 9; `descFactorial 1 2 = 0` | Sound | none |
| §9.2 (sampled) | density; masses | `Σ|v_i − u|² = 2H − 2⟨u, P⟩ + N|u|²`; `(wλ) ∘ T_t⁻¹ = (w ∘ T_{−t})λ = wλ`; `Z^{can} = 1`, `0`, `∞` | Sound | none |
| §9.3, §9.4 (headline) | bounds; Poisson; profile | `1 + μ∫f⁰ ≤ Z ≤ e^{μ∫f⁰}`; `2e^{−2} = 0.27067`; `ρ(−¼) = 1` against `ρ(0) = 1.5` | Sound | none |
| §9.5 (headline) | inversion; bound; new Check | `Σ_{p+q=m}(−1)^p/(p!q!) = 0` for `m ≥ 1`; `Σ x^{p+q}/(p!q!) = e^{2x}`; `0.8√(2π) = 2.0053 ≤ 2.5066`; λ = 1: 1 against 2 | Sound | none |
| §9.6 (sampled, headline) | factorisation; bound; scaling | both sides are `(f⁰)^{⊗n}1_{𝒟̄_n}Z⁻¹Σ_p(μ^p/p!)∫Πf⁰ 1[admissible]`; `1 − p_ε ≤ nμω_dε^d‖ρ⁰‖_∞`; `μ_εε^d = ε`; `(4π/3)(0.01) = 0.04189`; d = 1: `1 − 2ε‖ρ⁰‖_∞ ≤ E N ≤ 1` | Sound | none |
| §10.1 (sampled) | mean; second moment; empty | `μ⁻¹ · μ∫F_1h`; `μ⁻²(μ∫F_1h² + μ²∫F_2 h⊗h)`; zero measure at `N = 0` | Sound | none |
| §10.2 (sampled) | weak form; loss; β = 0 | swap then Θ: `½`, then `¼` with `ψ + ψ_* − ψ' − ψ'_*`; `ω_2 = π`, `√(8/π) = 1.5958`; `v' = (r/2)(1, 1)`, `w' = (r/2)(1, −1)`, kernel `r/√2` | Sound | none |
| §10.3 | d = 1; wrong sign | `σ_{±1}(v, w) = (w, v)`, `Q = 0`; `1 + 0.5cos π = 0.5` against 1.5 | Sound | none |
| §10.4 | clauses against BGSS2023 Theorem 1; `t = 0`; structures | almost-everywhere convergence with `∫F_n(t) = ∫F_n(0) → 1` gives the weak clause; `|F_1(0) − f⁰| ≤ ω_dε‖ρ⁰‖_∞f⁰`; classification as in the table above | Supported by BGSS2023 lines 316–321 | none |
| §10.5 (headlines) | second moment; d = 1; wrong `F_2` | `0 + m² − 2m² + m² = 0`; `1 − e⁻¹ = 0.63212`; `m²` | Sound | none |

### Seeded source sample

The author flagged no locator as unverified. I opened the three readable texts at every locator of the fifteen sampled targets.

| Target | Text opened and result |
|---|---|
| 1.2 | GST2013 lines 833–841: particles in `ℝᵈ`, free flow, the open domain. Confirmed. |
| 3.1 | GST2013 lines 839–841 (strict), BGSS2023 lines 137–142 (strict, torus), DengHaniMa2024 (1.1), lines 150–153 (closed). Confirmed. |
| 3.3 | GST2013 (4.4.1)–(4.4.2), lines 1219–1227. Confirmed. |
| 3.4 | GST2013 (4.1.1), lines 836–837; BGSS2023 (1.1.1), lines 122–123. Confirmed. |
| 4.1 | GST2013 lines 846–847 and 1210–1216: the pre-collisional sign condition and "distance decreasing up to the collision time". They support the sign criterion; the formula for τ is the roadmap's elementary computation. Confirmed. |
| 4.3, 4.4 | GST2013 line 883 (invariance of the measure, used without proof); DengHaniMa2024 Proposition 1.2(3), lines 186–187. Confirmed as "statement used". |
| 4.5 | GST2013 lines 875–887 (the step on `[0, δ]`). Confirmed. |
| 5.2 | DengHaniMa2024 Proposition 1.2, lines 182–188; GST2013 lines 848–854. Confirmed; gluing is the roadmap's. |
| 6.1 | GST2013 Lemma 4.1.1, lines 864–874: the set of line 873 with `2Rδ` for η and `C ρ^{d(N−2)} δ²`. Confirmed; the explicit constant is the roadmap's. |
| 8.2 | GST2013 (4.2.1), lines 911–918, and (4.3.1), lines 941–958; BGSS2023 (1.1.3)–(1.1.4), lines 145–157. Confirmed. |
| 9.2 | BGSS2023 lines 158–160, printed p. 2 (page marker at line 144). Confirmed. |
| 9.6 | BGSS2023 (1.1.8), lines 211–217; DengHaniMa2024 (1.12), lines 246–252 (error `O(ε)`). Confirmed. |
| 10.1 | BGSS2023 (1.2.4)–(1.2.5), lines 324–334; (1.2.6), lines 335–340; (1.2.7), lines 352–369. Confirmed. |
| 10.2 | BGSS2023 (1.2.1)–(1.2.3), lines 292–312 (kernel `((w − v)·ω)_+`); GST2013 (2.1.2), lines 385–393, and (2.2.1), lines 432–437 (factor ¼); DengHaniMa2024 (1.13)–(1.14), lines 258–282 (kernel `((v − v_1)·ω)_+`). Confirmed. |

Also read: GST2013 lines 42–118 (contents), 205–217, 376–440, 486–493, 662–698, 826–960, 1134–1142, 1204–1230, 1262–1269, 2066–2082, 5437–5441; BGSS2023 lines 114–372, 476–484, 3536–3540; DengHaniMa2024 lines 134–300.

### Pinned declarations

Pins of `lake-manifest.json`, equal to the plan's baseline: Mathlib `1b1ccf4b088b`, Tau Ceti `2fd255d997f4`. Every declaration of the two contracts was found at the pin, paths relative to each library:

- Tau Ceti: `TauCeti/Probability/Distributions/Gaussian/Density.lean:82`, `:265`; `TauCeti/Analysis/Semigroups/Group/Basic.lean:74`; `TauCeti/Probability/Process/EmpiricalMeasure.lean:224` (a `ProbabilityMeasure`); `TauCeti/Dynamics/Flow/OfLipschitz.lean:59` (`LipschitzWith K v`, a `Flow ℝ E`).
- Mathlib: `MeasureTheory/Measure/Lebesgue/VolumeOfBalls.lean:308`; `Analysis/Normed/Group/Quotient.lean:168`, `:222` (`[IsClosed]`, additive by `to_additive`); `Topology/Algebra/OpenSubgroup.lean:377` (`[T1Space]`); `MeasureTheory/Constructions/Polish/Basic.lean:119`, `:148`, `:154`, `:649`; `Topology/MetricSpace/ProperSpace.lean:66`; `Algebra/Module/ZLattice/Basic.lean:93`, `:434`, `:645`; `Algebra/Module/ZLattice/Covolume.lean:73`, `:85`; `MeasureTheory/Group/FundamentalDomain.lean:59`, `:731`, `:754`, `:801`; `MeasureTheory/Measure/Haar/Quotient.lean:75` (stated for `Γ.op`), `:222` (`[LocallyCompactSpace G]`, `[IsFiniteMeasure μ]`); the additive name `measurePreserving_quotientAddGroup_mk_of_AddQuotientMeasureEqMeasurePreimage` is used at `MeasureTheory/Integral/IntervalIntegral/Periodic.lean:94`; `Topology/Instances/AddCircle/Real.lean:55`; `Analysis/Fourier/AddCircleMulti.lean:173`; `MeasureTheory/Function/Jacobian.lean:1096`, `:1184`; `Analysis/InnerProductSpace/Projection/Reflection.lean:52`, `Projection/FiniteDimensional.lean:59`; `MeasureTheory/Measure/Lebesgue/EqHaar.lean:172`, `:231` (`det f ≠ 0`), `:527` (`[Nontrivial E]`); `LinearAlgebra/Matrix/Determinant/Basic.lean:734`; `MeasureTheory/Constructions/HaarToSphere.lean:52`, `:88`; `Analysis/SpecialFunctions/Gaussian/FourierTransform.lean:330` (`0 < b`); `Probability/Distributions/Gaussian/Real.lean:47`; `Probability/Distributions/Gaussian/Multivariate.lean:166`; `Probability/Distributions/Poisson/Basic.lean:40`; `MeasureTheory/Constructions/Pi.lean:732`; `MeasureTheory/Function/LpSpace/Basic.lean:595`, `:611`; `MeasureTheory/Function/ContinuousMapDense.lean:142`; `MeasureTheory/Integral/IntervalIntegral/FundThmCalculus.lean:1140`; `Probability/Moments/Variance.lean:398`; `Data/Nat/Factorial/Basic.lean:332`, `:367`, `:424`; `MeasureTheory/MeasurableSpace/Constructions.lean:871`; `MeasureTheory/Measure/Sum.lean:30`; `Dynamics/Flow.lean:85`; `Analysis/InnerProductSpace/PiL2.lean:114`.

The 17 names in `scratch/citations.md` are this roadmap's own `HardSphere.*` names, expected at the design stage.

### Duplication, ownership and overlap

`scratch/overlaps.md` lists no other pull request changing this roadmap, no dropped id, no id that only a revision defines and no second copy; the folder is not on main (`TauCetiRoadmap/` has no such folder) and is not one of the two board packages on other branches. Object searches over main and the open heads (`roadmaps grep`, index of 2026-11-15T20:06:47Z):

- "hard sphere": ClassicalErgodicTheory (three lines: outside its scope, a consumer of its §3.5) and MathematicalBilliards (one downstream remark). "Boltzmann–Grad", "BBGKY", "Lanford", "Boltzmann equation", "Maxwellian", "grand canonical", "collision operator", `FlatPositionSpace`, `FlatTorus`, `HardSphere.`: no match anywhere. "specular": one line on main (SymplecticGeometry/CotangentLagrangian, a chord reflection). "Liouville equation": an unrelated ordinary differential equation.
- "flat torus": examples in Riemannian and topological roadmaps on main, and MathematicalBilliards §10.3 and §10.5; no README on main mentions `AddQuotientMeasureEqMeasurePreimage` or `E ⧸ L`, so no roadmap owns the quotient with its norm and Haar measure.

Cross-roadmap citations resolved this round:

- ClassicalErgodicTheory §3.5, at the head of its open pull request: "Flows defined almost everywhere", a standard Borel space with a σ-finite measure; item 1 (conull flows, identity extension, "the group law everywhere"), item 3 ("invariant iff each component restriction is"), item 4 (`(Φ t)_* ν = μ.withDensity (W ∘ Φ (-t))`). Its §0.2 assumes "a finite invariant measure", as README line 13 says. It names the `N`-particle hard-sphere flow as outside its scope and as a consumer, and cites nothing of this roadmap.
- MathematicalBilliards §10.3 ("area `4 · 1 = 4`"), §10.5 ("`Λ = 2ℤ + 2iℤ`: area `4`") and §12.3 (a jointly measurable action of `ℝ` on a probability space, `Lp ℂ 2`), at its open head.
- ProbabilisticAndMetricNumberTheory §4.9a on main, `TauCetiRoadmap/ProbabilisticAndMetricNumberTheory/README.md:6363`: `scalarLpKoopman_strong` for a group "acting continuously on an R₁ space", μ locally finite, `p ≠ ∞`.
- RandomMatrices §8.1 on main (lines 1133–1150), StandardDistributions Layer 5 (line 547) and ComplexTori on main, OneParameterSemigroups under `Completed/`: all exist where cited.

This roadmap is the owner of the hard-sphere objects because no roadmap on main or open states them.

Overlap check: read ClassicalErgodicTheory, MathematicalBilliards, RandomMatrices and ProbabilisticAndMetricNumberTheory (cited sections and scope) and searched PointProcesses, RelativisticQuantumFieldTheory, HamiltonianSystems and OptimalTransport for the objects above (third list empty); conull flows, their disjoint unions and the transport of densities: owner ClassicalErgodicTheory §3.5, cited here; the translation-surface structure of `ℂ/Λ`: owner MathematicalBilliards §10.5, not restated; Koopman strong continuity for finite measures or continuous actions: owners ClassicalErgodicTheory §0.2, MathematicalBilliards §12.3 and ProbabilisticAndMetricNumberTheory §4.9a, not shared for the infinite measure `λ_N|𝒟̄`; correlation functions of eigenvalue counts: owner RandomMatrices §8.1, a different carrier, named in the scope; unlabelled point processes: owner PointProcesses, not restated and not cited as a supplier; nothing else shared.

### Supplier order

```text
candidate: HardSphereDynamicsAndKineticLimits is not in the merge order yet; checked as if placed after MathematicalBilliards (the intake inserts it when its design is accepted)
depcheck: 244 roadmaps, 2235 edges, 0 problem(s)
```

No UPWARD or CYCLE line. ClassicalErgodicTheory is another author's open pull request that adds a new roadmap folder, which this roadmap may consume; it is not in `merge-order/ORDER.txt`, so the check does not see the edge. By reading, the direction is one way: its §3.5 needs MathematicalBilliards §§8.2–8.3 and nothing of this roadmap. No roadmap of the never-cite list is cited as a supplier (PointProcesses is named only as the owner of a neighbouring subject).

### Headline theorems

Named for the package stage: `HardSphere.IsTrajectory.eqOn` (§5.2), `HardSphere.volume_hardCoreSet_diff_goodSet` (§6.4), `HardSphere.flow_add` (§7.1), `HardSphere.measurePreserving_flow` (§7.2), `HardSphere.flow_reversal` (§7.3), `HardSphere.weak_liouville` (§8.2), `HardSphere.grandCanonical_flow_invariant` (§9.4), `HardSphere.lintegral_sum_distinct_eq_correlation` (§9.5), `HardSphere.boltzmannGrad_scaling` (§9.6), `HardSphere.tendsto_empirical_of_correlation` and `HardSphere.LanfordStatement.tendsto_empirical` (§10.5). Each names the roadmap's objects. The padding probe and the `#check` comparison have nothing to run on at this stage.

### Copyright, licences and scope

- **Wording.** Beside the locators of the sampled targets I compared seven further passages with the source text: §5.5's sentence on pathological data with GST2013 lines 851–854; §6.1 with GST2013 lines 867–874; §8.3's inheritance of the specular condition with GST2013 lines 933–938; §10.4 with BGSS2023 lines 316–321; §10.5's route with BGSS2023 lines 352–371; §9.3's sentence on exchangeability with BGSS2023 lines 184–187; the right-continuity convention with DengHaniMa2024 lines 164–166. No run of more than four words is shared (terms of art), and no sentence follows a source clause by clause.
- **Arrangement.** GST2013 has the largest share: 52 of the 129 occurrences of a source key in the README (BGSS2023 44, DengHaniMa2024 24). Its contents (lines 42–118): Chapters 1–3 the low density limit, the Boltzmann equation and the main results; Chapter 4 the `N`-particle flow, the Liouville equation, its weak form and the hierarchies; Chapters 5–7 estimates and convergence; Part III potentials. Layers 1–4 and 9 have no counterpart; Layers 5–7 expand its §4.1; the collision operator, in its Chapter 2, is in Layer 10. No run of layers maps one to one onto a run of its chapters or sections. The order of Layers 7 to 10 is forced: §8.1 needs §7.2, §9.5 needs §8.1 and §8.4, §10.1 needs §9.5.
- **Reuse.** No table, figure, list of examples or numerical data is taken from a source.

Source independence: 22 passages compared with 3 sources, none shared; largest share GST2013, 52 of 129 locators; contents compared with GST2013: independent.

## Not verifiable

- Alexander1976 Proposition 4.3 and AlexanderThesis1975 Chapter 1: settled uncertified; only the attribution in GST2013 (line 855, bibliography lines 5437–5440) was read.
- Lanford1975, CIP1994, Spohn1991, Uchiyama1988: settled uncertified; not read, not requested again.
- Lean elaboration, the one-tactic padding probe and the `#check` comparison: not available (this lane does not elaborate), and there is no `Suggested.lean`. Library names were checked by reading the pinned sources, not by elaboration.
- The truth of `HardSphere.LanfordStatement` beyond its agreement with BGSS2023 Theorem 1, its `t = 0` case and its equilibrium case: the proof belongs to a later roadmap.
- The dependency check's verdict on the ClassicalErgodicTheory edge: the tool does not see it; the direction was checked by reading.
- The two board packages on other branches (AnalyticNumberTheory, LawrenceVenkateshMethod) were not opened; neither is in this subject.

## Source issues

- **Misprint** in GST2013 at (4.4.1), printed p. 33: the source says the starred velocities are the pre-image of the pair under (4.1.1), the free flow; it should be under the reflection law (4.1.2); affects nothing.
- **Gap** in GST2013 at Proposition 4.1.1, proof, printed p. 28: the source uses invariance of Lebesgue measure under the partially built flow without proving it for a collision step; it should first establish the unit Jacobian of the two-body step; affects the proof.
- **Error** in DengHaniMa2024 at Proposition 1.2(3), printed p. 4: the source says the flow maps are diffeomorphisms off one closed null set; it should say measure-preserving bijections, since each time-`t` map jumps across the data colliding exactly at `t`; affects a stated result.

## For the human reviewers

- Supplier: ClassicalErgodicTheory is another author's open pull request and is not in the merge order; the item numbers of its §3.5 are fixed only when it merges.
- Scope: `HardSphere.LanfordStatement` (README §10.4) is a proposition whose proof is left to a roadmap on the BBGKY hierarchy; searches for "BBGKY" and "Lanford" found no such roadmap on main or open.
- Licence: the three texts read are arXiv copies. Six cited works are recorded `uncertified` in `sources.toml` and were not read.
- Scope: BGSS2023 is Ann. of Math. 198 and GST2013 an EMS monograph; DengHaniMa2024 is cited in its arXiv version (v3), and I did not check whether it has appeared.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "f117d02d458baed3c4b713f79b1ce8666e991985", "job": "REV-DESIGN-HardSphereDynamicsAndKineticLimits~13", "model": "fable", "worker": "chris-x91"} -->
