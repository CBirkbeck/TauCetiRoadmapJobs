<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13780#issuecomment-6899975720 -->
Review (claude) of f5b21e1

Verdict: needs_changes

**For the human reviewers:** this review raises 4 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) §7.4's locator supports the operator, not the strong continuity

   **Location.** `packages/HardSphereDynamicsAndKineticLimits/design/README.md:573`: "then density (`MeasureTheory.MemLp.exists_hasCompactSupport_eLpNorm_sub_le`) (GST2013 lines 1138–1140; DengHaniMa2024 lines 175–178)."

   **Claim.** The parenthesis closes the theorem that `U_t` is a strongly continuous group of isometries on `Lp`, so it reads as the locator of that theorem.

   **Witness.** GST2013 line 1140 defines the solution operator on continuous functions, `f ↦ f(Ψ_s(−t, ·))`; DengHaniMa2024 lines 175–178 define the flow operator (1.5). Neither mentions `Lp` or continuity in `t`.

   **Exact repair.** Replace the parenthesis by: "The operator `f ↦ f ∘ T_{−t}` is the solution operator of GST2013 (4.3.5), lines 1138–1140, and the flow operator of DengHaniMa2024 (1.5), lines 175–178; its strong continuity on `Lp` is proved here and is stated in neither source." This is the form §2.2, §5.3, §7.3, §9.2 and §9.4 already use for their own results. Tested on the witness: the two cited passages do contain the operator with the sign `−t`, which is all the repaired sentence attributes to them.

2. **F02** (P3) the design does not say how `HardSphere.LanfordStatement` obtains the torus instance

   **Location.** `design/README.md:85` lists the declarations of `Suggested.lean` ("the class `FlatPositionSpace`, the definitions `FlatTorus`, … `HardSphere.LanfordStatement`") and `design/README.md:812`: "Define `HardSphere.LanfordStatement d : Prop` on the unit torus `𝕋^d`".

   **Claim.** `LanfordStatement d` is statable from the listed declarations.

   **Witness.** Its statement uses the flow on `𝕋^d`, hence an instance `FlatPositionSpace d (FlatTorus L)`. The axioms of that instance (lift, injectivity on `B(0, ρ)`, local measure) are theorems of §1.3; line 85 lists no instance, and an instance with sorried fields is not allowed in `Suggested.lean`.

   **Exact repair.** State the choice at line 85 and in §10.4. Either (a) the package proves the instance of §1.3 in full, with no `sorry`, and lists it at line 85; or (b) `HardSphere.LanfordStatement` and `HardSphere.LanfordStatement.tendsto_empirical` take `[FlatPositionSpace d (FlatTorus L)]` as an instance argument, and §10.4 says the proposition is asserted for every such structure on the unit torus. Tested for (b) on the structures other than §1.3's: the cover `π ∘ B` with `B` orthogonal satisfies every axiom of §1.1 with ρ = 1/2 (`‖π(B a)‖ ≤ |B a| = |a|`; a lift `b` of ξ gives the lift `B⁻¹ b` of the same norm), and so does the cover of §1.3 with a smaller radius (the pattern of §1.2 Check 4). For `π ∘ B` the proposition is the one for §1.3's cover with datum `f⁰(x, B⁻¹ v)`, whose two bounds depend on `|v|` only; for a smaller radius only the range `ε < ρ` shrinks, which the limit ε → 0⁺ does not see. So (b) asserts nothing false; it needs one Check recording the rotated cover.

3. **F03** (P3) the scope has no clause relating §9.5 to the correlation functions of RandomMatrices §8.1

   **Location.** `design/README.md:11` (Scope, "Left to other roadmaps") and `design/README.md:732`: "define `HardSphere.correlation ε μ f⁰ n t` by `F_n(t)(Z_n) = μ^{−n} Σ_{p ≥ 0} (1/p!) ∫ W_{n+p}(t)…`".

   **Claim.** The scope names every roadmap that states a neighbouring object and says how the kept variant differs.

   **Witness.** `TauCetiRoadmap/RandomMatrices/README.md:1141` (on main, §8.1): "Define the `k`-point correlation function relative to a reference measure `μ` by the factorial-moment identity". The README never names RandomMatrices; the overlap list has it as second closest on main (0.13).

   **Exact repair.** Add to the scope paragraph at line 11: "RandomMatrices §8.1 defines the `k`-point correlation function of an eigenvalue process through the factorial moments of its counts. For `h` a product of indicators the identity of §9.5 is that factorial-moment identity for the particle counts at time `t`, with `ρ_n = μ^n F_n(t)` relative to `(μ_X ⊗ vol)^{⊗n}`; §9.5 keeps its own definition because `F_n(t)` is a function on labelled phase space transported by the flow, with the `μ^{−n}` rescaling of the Boltzmann–Grad limit." Tested: `n = 1`, `h = 1_B` gives `E[N(B)] = μ ∫_B F_1`; `n = 2`, `h = 1_B ⊗ 1_B` gives `E[N(B)(N(B) − 1)] = μ² ∫_{B²} F_2`; at ε = 0 this is `(μ ∫_B f⁰)²`, the Poisson value, since `F_2(0) = f⁰ ⊗ f⁰`. RandomMatrices §8.1 is stated for eigenvalue counts of a random matrix, so it cannot be consumed as it stands; this is a kept variant, not a second owner.

Three findings, all P3; none is P1 or P2. Each carries an exact repair, so the verdict asks for changes: a fix round applies the three repairs before the design is accepted. No supplier gap is declared and none is needed. I edited neither the README, the plan nor the sources manifest, and fetched no source. No maintainer notes were supplied. This is the design lane: there is no `Suggested.lean`, and elaboration is not available (this lane does not elaborate; say so in the report). No Lean command was run.

## Previous findings, checked first

The preceding review is `REV-DESIGN-HardSphereDynamicsAndKineticLimits~11` (F01, F02, both P3); its repair report is `packages/HardSphereDynamicsAndKineticLimits/reports/FIX-DESIGN-HardSphereDynamicsAndKineticLimits~12.md`. Nothing was marked `not actionable in this package`; nothing is re-raised. I read the diff of the two heads: README lines 105 and 834 and the plan tests `sup_norm_torus_fails` and `poisson_variance`, nothing else.

| Round-11 finding | Status | Repaired passage and my check |
|---|---|---|
| F01, §10.5 Check 3 omitted the time | Repaired | Line 834: "`ε = 0` at `t = 0` (Poisson process with intensity `μ f⁰`; the flow is not used, `T_0` being the identity by §7.1)… `Var(π_0(h)) = μ^{−1} ∫ f⁰ h²` exactly". Recomputed: `Z = exp(μ∫f⁰)`, `F_n(0) = (f⁰)^{⊗n} Z⁻¹ Σ_p (μ∫f⁰)^p/p! = (f⁰)^{⊗n}` for every mass; §10.1 gives `μ⁻¹∫f⁰h² + (∫f⁰h)² − (∫f⁰h)²`. μ = 2, `h = 1`: `Var(N/2) = 2/4 = 1/2`. |
| F02, §1.1 Check 3 refuted only ρ > 0.1 | Repaired | Line 105: "for any radius ρ > 0: for `0 < s < min(ρ, 1/2)` the class of `(s, s)` has supremum norm `s < ρ`, while every lift `(s + m, s + n)`… has Euclidean norm at least `s√2 > s`". Recomputed at ρ = 0.05, `s = 0.01`: 0.01 against 0.014142; `|s + m| ≥ s` for `m = 0, ±1` at `s = 0.4`: 0.4, 1.4, 0.6. |

The repaired patterns elsewhere: a Check that omits a parameter it needs (every other `ε = 0` statement, lines 659, 709–713, 737, is static or names `F_n(0)`); a refutation of a class axiom by one fixed witness (line 139 compares two norms and makes no claim about a radius). None found.

## Verified sound

### Coverage and principles

I read all 872 README lines, the plan (10 layers, 45 targets, 170 tests, at least 3 per target, every target with a locator and its hypotheses; `gaps` empty) and the 9 manifest entries.

- README `*Needs:*` lines against the plan's `target:` prerequisites, compared mechanically: 0 differences over 45 targets; one `*Needs:*` line per numbered section; targets in increasing order, no prerequisite later than its target.
- The ten `### Dependencies` lines agree with the `*Needs:*` lines of their layers (checked layer by layer).
- No route-specific shortcut: every `d ≥ 1`, every flat position space, `0 < ε < ρ`; `d ≥ 2` only in §10.4 and the corollary of §10.5, with the d = 1 counterexample as a Check. No re-planned roadmap, no upward or cyclic supply, no algorithm, no copied passage, no layer named after a source's chapter, no sentence saying the roadmap follows a source.
- A scan for LaTeX delimiters, pull-request numbers, machine paths, `lemma`, `set_option`, "optional", "deferred", "removed", "so far", "checkpoint", "handoff", HTML anchors and round labels found none.
- Source locators are given as equation or theorem numbers with the line numbers of the cached extractions, the form the project uses for quoting sources.

### Adversarial table

`E` is Euclidean space; the head-on witness is ε = 1, `x_1 = (2, 0)`, `x_2 = 0`, `v_1 = (−1, 0)`, `v_2 = 0`. Rows cover the fifteen sampled targets, the headline theorems and the targets the findings touch. I computed every value this round.

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §1.1 class | local isometry; ball image; ρ maximal on the torus | `|c| < ρ`: lift `a` of `π c` with `|a| = ‖π c‖ ≤ |c|`, injectivity gives `a = c`; `a = k(1/2 + δ)`, `a − k` both in `B(0, ρ')` for `ρ' > |k|/2` | Sound | none |
| §1.2 (sampled) | ρ = ∞; ρ = 2 | `ℓ = id`; ball of radius 100: `10⁴π = 31415.93`; radius-2 structure: ball axiom stops at 2 | Sound | none |
| §1.4 | shell; circle; packing | `π(1.21 − 1) = 0.65973`; `{0.4 ≤ ‖y‖ ≤ 0.5}` has length 0.2 against 0.4; `0.04π = 0.12566`, `7 × 0.12566 = 0.8796 ≤ 1 < 1.0053` | Sound | none |
| §2.1 | reflection formula; witness | reflection in `(ν, −ν)^⊥`: `(v, w) − ⟨v − w, ν⟩(ν, −ν)`; `v = (0, 0.9)`, `w = (0.9, 0)`: `⟨v − w, ν⟩ = −0.9`, image `((0.9, 0.9), 0)`, energy `1.62` both sides | Sound | none |
| §2.2 (sampled) | Θ²; kernel; d = 1, 2, 3 | `σ_{−ω}σ_ω = id`; `(w' − v')·(−ω) = (w − v)·ω`, `0.9 = 0.9` at the witness; `½ω_{d−1}(1 − (d−1)/(d+1)) = ω_{d−1}/(d+1)`: ½, ⅔, π/4; times `d + 1`: 1, 2, π; `π/(4π) = ¼` | Sound | none |
| §3.4 (sampled) | boost; torus; leaving `𝒟̄` | `S_t B_c(X, V) = (X + π(tV) + π(tc), V + c) = A_{π(tc)} B_c S_t`; `S_1 B_1(0, 0) = (1, 1)`, `B_1 S_1(0, 0) = (0, 1)`; `π(e_1) = π(0)`; distance 0.5 at `t = 1.5`; vector field `(V, 0)` is 1-Lipschitz | Sound | none |
| §4.1 | head-on; grazing; miss | `D = 4 − 3 = 1`, `τ = 1`; `D = 9 − 9 = 0`, `q = (1, 0)`; `D = 9 − 12 = −3`; smaller root `≥ 0` iff `⟨a, u⟩² ≥ D` iff `|a| ≥ ε` | Sound | none |
| §4.3 | route; explicit `DC` | `dY + τ dU' = w + (u − R_q u)dτ = w − 2⟨n, w⟩n = R_q w` with `dτ = −⟨n, w⟩/⟨n, u⟩`; at the witness `dτ = da_1 + du_1`, rows `(−1,0,0,0)`, `(0,−1,0,−2)`, `(0,0,−1,0)`, `(0,2,0,3)`, determinant `(−1)(3 − 4) = 1`; d = 1: `2 − a − su`, determinant 1; variable time: 0 | Sound | none |
| §4.4 (sampled) | `s = 0`; grazing set; d = 1; inelastic rule | `B_0(a, u) = (a, R_a u)` on incoming contacts, equal to the image of the outgoing state: injectivity fails exactly there; `D = 0` iff `|a_⊥| = ε`; in d = 1, `D = u²ε² > 0` for `u ≠ 0`; image dimension `(d−1) + (d−1) + 1 = 2d − 1` | Sound | none |
| §5.2 (sampled, headline) | jump without contact; backward; gluing at `b` | no contact: `σ_M = id`, no jump; `V(t−) = σ_M V(t)`; `V(t−)` outgoing would mean overlap before `t`; at `b` the jump rule comes from `[a, b]`, right continuity from `[b, c]`; `x_2(2) = (−2, 0)` | Sound | none |
| §5.4 (sampled) | direct; converse; least element; datum | `σ_M V(t) = V(t−)`; right limit of `Y` is `V(t) = σ_M Y(t)`; converse: a contact time strictly inside a piece where `Y` is constant would force `σ_M Y = Y`, a grazing pair, excluded by "incoming", so `V(t−) = Y(t)`; `σ((0), (−1, 0)) = ((−1, 0), 0)`; from the outgoing state the distance is `1 − t` | Sound; agrees with DengHaniMa2024 lines 157–166 | none |
| §6.3 | constants | `ω_d((ε + 2Rδ)^d − ε^d) ≤ 2R d ω_d (ε + 2R)^{d−1} δ` for `δ ≤ 1`; `⌈t/δ⌉ ≤ (t + 1)/δ`; `8 (12π)² (π²/2) = 576π⁴ = 56108` | Sound | none |
| §6.4 (headline) | Borel description of `G` | on a trajectory on `[0, t]` the second-nearest distance is continuous and `> ε`, so it exceeds `ε + 2Rt/m` for large `m`: the union over `m, R` is exact | Sound | none |
| §7.1 (sampled, headline) | head-on `T_3`; grazing state | `((1, 0), (−2, 0); 0, (−1, 0))`; `a = (2, 1)`: `D = 4 − 4 = 0`, `T_1 Z = Z`, `S_1 Z` has `x_1 = (1, 1)` | Sound | none |
| §7.2 (sampled, headline) | carriers; pieces | `𝒟̄ ∖ G` null; on `E`, `𝒟̄ᶜ` has infinite measure; `8 × 0.12566 = 1.0053 > 1` so `𝒟̄ = ∅`; a measurable `A ⊆ G` splits into countably many parts inside pieces, images disjoint by injectivity | Sound | none |
| §7.3 (headline) | reversal on and off `G` | on `G`: `T_t ℛZ = ℛ(Z(−t))`; off `G` both sides are `ℛZ`; boost of the grazing state: fixed `(2, 1)`, `0` against formula `(3, 1)`, `(1, 0)` | Sound | none |
| §7.4 (sampled) | group law; `p ≠ 2`; masses; `p = ∞` | `U_s U_t f = f ∘ T_{−t} ∘ T_{−s}`; `p < 2`: `‖g‖_p ≤ μ(A)^{1/p − 1/2}‖g‖_2` on the finite-measure support; `p > 2`: `‖g‖_p^p ≤ (2‖f‖_∞)^{p−2}‖g‖_2²`; `1 · 2 = 2`; gaps `≥ 1/3` summing to 1 are all 1/3, so `q_3 = 0`; sup-norm distance 1 | Sound; locator | R01 |
| §8.2 (sampled, headline) | continuity at a collision; support of `Lφ`; d = 1 box | left limit `φ(t_k, X, V(t_k−)) = φ(t_k, X, σ_M V(t_k−))` by the specular condition; `Lφ = 0` at the endpoints of the time support; τ ∈ `(0.99/1.04, 1.01/0.96) = (0.9519, 1.0521)`; `H ∈ (0.4802, 0.5204)`; defect `−1 − 0 = −1` | Sound | none |
| §8.3 (sampled) | first marginal; specular Check | `g(z_1)(1 − ω_d ε^d)∫g̃`; completions with a further contact are null, off `𝒟̄_N` both sides vanish; `e^{−1.62} = 0.19790`; `|(0.9, 0.9)| = 1.2728 > 1` | Sound | none |
| §9.2 (sampled) | density as `Φ(H, P)`; masses | `Σ|v_i − u|² = 2H − 2⟨u, P⟩ + N|u|²`; `(wλ) ∘ T_t⁻¹ = (w ∘ T_{−t})λ = wλ`; `N = 1` torus: `Z^{can} = 1`; `N = 8`, ε = 0.4: `Z^{can} = 0`; on `E`: `q_N = ∞` | Sound | none |
| §9.3 (sampled) | bounds; ε = 0; `f⁰ = 0` | terms `N ≤ 1` give `1 + μ∫f⁰`; each term `≤ (μ∫f⁰)^N/N!`; `Z = e²`, `P(N = 1) = 2e^{−2} = 0.27067`; `Z = 1`, vacuum; weights without `1/N!`: geometric series, divergent for ratio `≥ 1` | Sound | none |
| §9.4 (headline) | `c M_{β,u}` | density a function of `H` and `P` in each component; `∫f⁰ = c μ_X(X) < ∞` | Sound | none |
| §9.5 (sampled, headline) | identity; inversion; bound; Check 6 | `Σ_N (1/N!)(N!/(N−n)!)∫W_N^{(n)}h = Σ_p (1/p!)∫W_{n+p}^{(n)}h`; `Σ_{p+q=m} (−1)^p/(p! q!) = 0` for `m ≥ 1`; `Σ_{p,q} x^{p+q}/(p! q!) = e^{2x}`; `0.8 √(2π) = 2.0053 ≤ 2.5066` | Sound; scope clause | R03 |
| §9.6 (headline) | factorisation; scaling | `1 − p_ε ≤ μ ∫ F_1 1_{∪B} ≤ n μ ω_d ε^d ‖ρ⁰‖_∞`; `μ_ε ε^d = ε`; `(4π/3)(0.01) = 0.04189` | Sound | none |
| §10.2 | weak form; loss; β = 0 | swap then Θ: factor ¼ with `ψ + ψ_* − ψ' − ψ'_*`; `ω_2 = π`, mean speed `√(8/π)`; `v' = (r/2)(1, 1)`, `w' = (r/2)(1, −1)`, speeds `r/√2`, kernel `r/√2` | Sound | none |
| §10.3 (sampled) | `t = 0`; d = 1; wrong sign | `π(0) = 0`, empty integral; `σ_{±1}(v, w) = (w, v)`, `Q = 0`; `1 + 0.5 cos π = 0.5` against `1.5` | Sound | none |
| §10.4 | hypotheses against BGSS2023 (1.1.5); clauses; `t = 0` | the Lipschitz bound gives (1.1.5) with `2C₀`; almost-everywhere convergence with `∫F_n(t) = ∫F_n(0) → 1` gives the weak clause; at `t = 0`, `|F_1 − f⁰| ≤ ω_d ε ‖ρ⁰‖_∞ f⁰` uniformly | Supported by BGSS2023 lines 316–321; instance | R02 |
| §10.5 (headlines) | second moment; d = 1; wrong `F_2`; ε = 0 | `0 + m² − 2m² + m² = 0`; `Z_ε → e`, `1 − e⁻¹ = 0.63212`; `2m² − 2m² + m² = m²`; `μ⁻² · μ∫f⁰h²` at `t = 0` | Sound | none |

Remarks that need no change: §9.4 Check 1 calls the equilibrium density "the special case `Φ(H, P) = e^{−H}`", omitting a positive constant, which does not affect invariance. §5.2 Check 4 says the outgoing condition only excludes grazing contacts; on a one-point interval it also excludes an incoming contact state, a case in which uniqueness is trivial.

### Seeded source sample

The author flagged no locator as unverified. I opened the three readable texts at every locator of the fifteen sampled targets.

| Target | Text opened and result |
|---|---|
| 1.2 | GST2013 lines 833–841: particles in `ℝᵈ`, free flow, the domain with strict inequality. Confirmed. |
| 2.2 | GST2013 lines 394–400 (the involution), 432–437 (unit Jacobians, (2.2.1)), 674 and 1264–1268 (the kernel). Confirmed; the cross-section value is the roadmap's, as it says. |
| 3.4 | GST2013 (4.1.1), lines 836–837; BGSS2023 (1.1.1), lines 122–123. Confirmed. |
| 4.4 | GST2013 line 883 (invariance of the measure, used); DengHaniMa2024 Proposition 1.2(3), lines 186–187. Confirmed as "statement used". |
| 5.2 | DengHaniMa2024 Proposition 1.2, lines 182–188 (existence and uniqueness off a null set); GST2013 lines 848–854. Confirmed; gluing is the roadmap's. |
| 5.4 | DengHaniMa2024 Definition 1.1, lines 140–172: `d ≥ 2`, the closed domain (1.1) at lines 150–153, scattering at every contact (1.2), left-continuous velocities at lines 164–166. Confirmed. |
| 7.1 | GST2013 Proposition 4.1.1, line 862; BGSS2023 lines 132–139; DengHaniMa2024 (1.4)–(1.5), lines 173–178. Confirmed. |
| 7.2 | GST2013 line 883; DengHaniMa2024 line 186. Confirmed. |
| 7.4 | GST2013 (4.3.5), lines 1138–1140; DengHaniMa2024 (1.5), lines 175–178. The operator only: R01. |
| 8.2 | GST2013 (4.2.1), lines 913–917, and (4.3.1), lines 947–958; BGSS2023 (1.1.3)–(1.1.4), lines 145–157. Confirmed. |
| 8.3 | GST2013 (4.2.2), lines 929–932; (4.2.3), lines 934–937; line 938. Confirmed. |
| 9.2 | BGSS2023 lines 158–160, printed p. 2 (page marker at line 144). Confirmed; the invariance is the roadmap's, as it says. |
| 9.3 | BGSS2023 (1.1.5)–(1.1.6) and the partition function, lines 167–181; DengHaniMa2024 Definition 1.3, lines 199–223. Confirmed; the bounds on `Z` are the roadmap's. |
| 9.5 | BGSS2023 (1.1.10), lines 267–277; (1.1.9), lines 241–266, with the indicator at line 249; (1.1.11), lines 279–288; the inversion formula, lines 229–237; DengHaniMa2024 (1.11), lines 235–244. Confirmed. |
| 10.3 | BGSS2023 (1.2.1)–(1.2.3), lines 292–312; GST2013 (2.1.1), lines 380–384. Confirmed; the mild form is the roadmap's. |

Also read: GST2013 lines 45–112 (contents), 208–216, 376–402, 486–493, 662–698, 826–960, 1206–1230, 2066–2082, 5438–5441; BGSS2023 lines 114–372, 476–484, 3536–3540; DengHaniMa2024 lines 134–300.

### Pinned declarations

Pins of `lake-manifest.json`, the plan's baseline: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`, Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. Opened this round, paths relative to each library:

- Tau Ceti: `TauCeti/Probability/Distributions/Gaussian/Density.lean:82` (`multivariateGaussianPDFReal`), `:51` (`multivariateGaussian_eq_withDensity`); `TauCeti/Analysis/Semigroups/Group/Basic.lean:74` (`StronglyContinuousGroup`: `toFun : ℝ → X →L[ℝ] X`, `map_zero'`, `map_add'`, `continuousAt_zero'`; a real normed space, no completeness); `TauCeti/Probability/Process/EmpiricalMeasure.lean:224` (`empiricalMeasureOfFintype`, `[Fintype κ] [Nonempty κ]`, a `ProbabilityMeasure`); `TauCeti/Dynamics/Flow/OfLipschitz.lean:59` (`flowOfLipschitz`, `LipschitzWith K v`, `[CompleteSpace E]`, a `Flow ℝ E`).
- Mathlib: `MeasureTheory/Measure/Lebesgue/VolumeOfBalls.lean:308`; `Analysis/Normed/Group/Quotient.lean:168` (`norm_mk`, `infDist`), `:222` (`instNormedCommGroup`, `[IsClosed]`, additive name by `to_additive`); `Topology/Algebra/OpenSubgroup.lean:377` (`[T1Space]`, `[DiscreteTopology U]`); `MeasureTheory/Constructions/Polish/Basic.lean:119`, `:148`, `:154`, `:649` (`QuotientGroup.borelSpace`, `[N.Normal] [IsClosed]`); `Topology/MetricSpace/ProperSpace.lean:66`; `Algebra/Module/ZLattice/Basic.lean:93`, `:434`, `:645` (`ZLattice.isAddFundamentalDomain`); `Algebra/Module/ZLattice/Covolume.lean:73`, `:85`; `MeasureTheory/Group/FundamentalDomain.lean:731`, `:754`, `:801`; `MeasureTheory/Measure/Haar/Quotient.lean:75`, `:222` (`[LocallyCompactSpace G]`); `Analysis/Fourier/AddCircleMulti.lean:173`; `Topology/Instances/AddCircle/Real.lean:55`; `MeasureTheory/Function/Jacobian.lean` (both names, module docstring lines 43–45); `Analysis/InnerProductSpace/Projection/Reflection.lean:52`, `Projection/FiniteDimensional.lean:59` (`(−1) ^ finrank 𝕜 Kᗮ`); `MeasureTheory/Measure/Lebesgue/EqHaar.lean:172`, `:231` (`det f ≠ 0`), `:527` (`[Nontrivial E]`); `LinearAlgebra/Matrix/Determinant/Basic.lean:734`; `MeasureTheory/Constructions/HaarToSphere.lean:52`, `:88`; `Analysis/SpecialFunctions/Gaussian/FourierTransform.lean:330` (`0 < b`); `Probability/Distributions/Gaussian/Real.lean:47` (`v : ℝ≥0`); `Probability/Distributions/Gaussian/Multivariate.lean:166`; `Probability/Distributions/Poisson/Basic.lean:40` (`r : ℝ≥0`); `MeasureTheory/Constructions/Pi.lean:732`; `MeasureTheory/Function/LpSpace/Basic.lean:595`, `:611`; `MeasureTheory/Function/ContinuousMapDense.lean:142`; `MeasureTheory/Integral/IntervalIntegral/FundThmCalculus.lean:1140` (`a ≤ b`, `ContinuousOn f (Icc a b)`); `Probability/Moments/Variance.lean:398` (`[IsFiniteMeasure μ]`, `MemLp X 2 μ`); `Data/Nat/Factorial/Basic.lean:367`, `:424` (`k ≤ n`); `MeasureTheory/MeasurableSpace/Constructions.lean:871`; `MeasureTheory/Measure/Sum.lean:30`; `Dynamics/Flow.lean:85`.

Every name exists with the hypotheses the contract states. The 17 names in `scratch/citations.md` are this roadmap's own `HardSphere.*` names, expected at the design stage.

### Duplication, ownership and overlap

`scratch/overlaps.md` lists no other pull request changing this roadmap, no dropped id, no id that only a revision defines and no second copy; the folder is not on main and is not one of the two board packages on other branches. Object searches over main and the open heads (`roadmaps grep`, index of 2026-11-15T19:10:32Z):

- "hard sphere": ClassicalErgodicTheory (three lines: outside its scope, a consumer of its §3.5) and MathematicalBilliards (one downstream remark). "Boltzmann–Grad", "BBGKY", "Lanford", "grand canonical", "Maxwellian", "collision operator", `FlatPositionSpace`, `HardSphere.`: no match anywhere.
- "flat torus": examples only (GeometricTopology, DGFloer, QuasiregularMaps, RiemannianGeometry and others on main) and MathematicalBilliards §10.3 and §10.5; no roadmap owns `E ⧸ L` with its quotient norm and Haar measure.
- "correlation function": RandomMatrices §8.1 on main (R03) and PointProcesses; "Janossy", "Papangelou": PointProcesses only, named in the scope as the owner of the unlabelled theory and never as a supplier.

Cross-roadmap citations resolved this round:

- ClassicalErgodicTheory §3.5, at the head of its open pull request: "Flows defined almost everywhere", on a standard Borel space with a σ-finite measure; item 1 (conull flows, identity extension, group law everywhere), item 3 ("invariant iff each component restriction is"), item 4 (`(Φ t)_* ν = μ.withDensity (W ∘ Φ (-t))`); its conventions define a measurable flow as a jointly measurable `AddAction ℝ X`. The contract at README lines 73–79 says the same. Its §0.2 assumes "a finite invariant measure", as README line 13 says. It names the `N`-particle hard-sphere flow as outside its scope and as a consumer; it cites nothing of this roadmap.
- MathematicalBilliards §10.3 (Check "area `4 · 1 = 4`"), §10.5 ("Flat tori", "`Λ = 2ℤ + 2iℤ`: area `4`") and §12.3 (a jointly measurable action of `ℝ` on a probability space, `Lp ℂ 2`), at its open head.
- ProbabilisticAndMetricNumberTheory §4.9a, on main: `scalarLpKoopman_strong` for a continuous action on an R₁ space with a locally finite measure, `p ≠ ∞`, as README line 13 says.
- StandardDistributions Layer 5 and ComplexTori (on main) and OneParameterSemigroups (completed, on main) are named only as owners.

This roadmap is the owner of the hard-sphere objects because no roadmap on main or open states them.

Overlap check: read ClassicalErgodicTheory, MathematicalBilliards, RandomMatrices and ProbabilisticAndMetricNumberTheory (cited sections and scope) and searched PointProcesses, RelativisticQuantumFieldTheory, HamiltonianSystems, OptimalTransport and StochasticCalculus for the objects above (third list empty); conull flows, their disjoint unions and the transport of densities: owner ClassicalErgodicTheory §3.5, cited here; the translation-surface structure of `ℂ/Λ`: owner MathematicalBilliards §10.5, not restated; Koopman strong continuity for finite measures or continuous actions: owners ClassicalErgodicTheory §0.2, MathematicalBilliards §12.3 and ProbabilisticAndMetricNumberTheory §4.9a, not shared for `N ≥ 2`; correlation functions of eigenvalue counts: owner RandomMatrices §8.1, a different carrier (R03 asks for the clause); unlabelled point processes: owner PointProcesses, not restated; nothing else shared.

### Supplier order

```text
candidate: HardSphereDynamicsAndKineticLimits is not in the merge order yet; checked as if placed after MathematicalBilliards (the intake inserts it when its design is accepted)
depcheck: 246 roadmaps, 2241 edges, 0 problem(s)
```

No UPWARD or CYCLE line. ClassicalErgodicTheory is another author's open pull request that adds a new roadmap folder, which this roadmap may consume; it is not in `merge-order/ORDER.txt`, so the check does not see the edge. By reading, the direction is one way. No roadmap of the never-cite list is cited as a supplier.

### Headline theorems

Named for the package stage: `HardSphere.IsTrajectory.eqOn` (§5.2), `HardSphere.volume_hardCoreSet_diff_goodSet` (§6.4), `HardSphere.flow_add` (§7.1), `HardSphere.measurePreserving_flow` (§7.2), `HardSphere.flow_reversal` (§7.3), `HardSphere.weak_liouville` (§8.2), `HardSphere.grandCanonical_flow_invariant` (§9.4), `HardSphere.lintegral_sum_distinct_eq_correlation` (§9.5), `HardSphere.boltzmannGrad_scaling` (§9.6), `HardSphere.tendsto_empirical_of_correlation` and `HardSphere.LanfordStatement.tendsto_empirical` (§10.5). Each names the roadmap's objects. The padding probe and the `#check` comparison have nothing to run on at this stage; R02 is the one point about the Lean form that the design can settle now.

### Copyright, licences and scope

- **Wording.** Beside the locators of the fifteen sampled targets I compared six further passages with the source text: §5.5's sentence on pathological data with GST2013 lines 851–854; §6.1 with GST2013 lines 867–874; §10.4 with BGSS2023 lines 316–321; §10.5's first theorem with BGSS2023 lines 341–349; §9.3's sentence on exchangeability and conditional independence with BGSS2023 lines 184–187; the right-continuity convention with DengHaniMa2024 lines 164–166. No run of more than four words is shared (terms of art), and no sentence follows a source clause by clause.
- **Arrangement.** GST2013 has the largest share: 52 of the 128 occurrences of a source key in the README (BGSS2023 44, DengHaniMa2024 23). Its contents (lines 45–112): Chapters 1–3 the low density limit, the Boltzmann equation and the main results; Chapter 4 the `N`-particle flow, the Liouville equation, its weak form and the hierarchies; Chapters 5–7 estimates and convergence. Layers 1–4 and 9 have no counterpart; Layers 5–7 expand its §4.1; the collision operator, in its Chapter 2, is in Layer 10. No run of layers maps one to one onto a run of its chapters or sections. The order of Layers 7 to 10 is forced: §8.1 needs §7.2, §9.5 needs §8.1 and §8.4, §10.1 needs §9.5.
- **Reuse.** No table, figure, list of examples or numerical data is taken from a source.

Source independence: 21 passages compared with 3 sources, none shared; largest share GST2013, 52 of 128 locators; contents compared with GST2013: independent.

## Not verifiable

- Alexander1976 Proposition 4.3 and AlexanderThesis1975 Chapter 1: settled uncertified; only the attribution in GST2013 (line 855, bibliography lines 5439–5440) was read.
- Lanford1975, CIP1994, Spohn1991, Uchiyama1988: settled uncertified; not read, not requested again.
- Lean elaboration, the one-tactic padding probe and the `#check` comparison: not available (this lane does not elaborate), and there is no `Suggested.lean`.
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

<!-- tauceti-roadmap-review {"agent": "claude", "head": "f5b21e1f37ddabc2e489c1c0188a13fa621b4c43", "job": "REV-DESIGN-HardSphereDynamicsAndKineticLimits~12", "model": "fable", "worker": "chris-x81"} -->
