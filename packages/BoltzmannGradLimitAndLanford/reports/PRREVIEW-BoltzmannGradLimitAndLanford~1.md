# Review of BoltzmannGradLimitAndLanford (pull request #2467 at 6b413f7)

**Verdict:** needs changes

## R01 (P1) — §1.2 transports by free motion, not by the n-particle hard-sphere flow

**Location:** `TauCetiRoadmap/BoltzmannGradLimitAndLanford/README.md:96–98`, "the correlation function of `n` particles at time `t` is its free transport from time `0` plus the time integral of the transported collision operator"; the same model at :211 and :254.

**Claim:** The BBGKY Duhamel formula transports by the backward n-particle hard-sphere flow (specular reflection among the n particles). With free transport (HardSphereDynamicsAndKineticLimits §3.4), the identity is false for n ≥ 2, and so are the Checks at :211 and :254.

**Witness:** d = 2, ε = 0.1, t = 0.2, `Z₂ = ((0.1,0),(−0.1,0); 0,(−1,0))`: backward free transport puts both particles at (0.1,0), off 𝒟̄₂, so `F₂(0) = 0` there. The flow instead returns `((0.2,0),(0,0); (−1,0),0)`. GST2013 line 1138; BGSS2023 line 1536.

**Repair:** In §1.2 replace "its free transport from time `0` plus the time integral of the transported collision operator" with "`F_n(0) ∘ T_{−t}`, its transport by the hard-sphere flow of HardSphereDynamicsAndKineticLimits §7.1 with `N = n`, plus the time integral of the collision operator transported by the same flow".

At :211 write: "With no added particle, the BBGKY pseudo-trajectory is the backward n-particle hard-sphere flow (BGSS2023 Definition 3.2.2, pp. 26–27) and the Boltzmann one is free transport. They differ for a pair that has collided."

At :254 write: "The term with no collision converges by initial chaos (HardSphereDynamicsAndKineticLimits §9.6) together with the agreement of the n-particle flow with free transport outside a small set of velocities (GST2013 Proposition 13.1.1, p. 103)."

## R02 (P1) — No target provides the mild Boltzmann solution that §5.2 must exhibit

**Location:** `README.md:139–140`, "Prove that if `f` is a mild solution of the Boltzmann equation (…), its tensor powers solve the Boltzmann hierarchy in Duhamel form"; :264, "*Needs:* §§3.2, 5.1; HardSphereDynamicsAndKineticLimits §10.4."

**Claim:** `HardSphere.LanfordStatement` asserts that a mild solution `f` exists on `[0, T₀]`. §2.2 assumes such an `f` and §3.2 yields only the hierarchy series. No target proves short-time existence of `f`, or the uniqueness for the Boltzmann hierarchy that identifies the series with `f(t)^{⊗n}`.

**Witness:** HardSphereDynamicsAndKineticLimits `Suggested.lean` lines 494–495 (`∃ f, IsMildBoltzmannSolution f₀ T₀ f ∧ …`). GST2013 takes this step (line 2081) from Theorem 1 (line 538, existence) and Theorem 7 (line 1391, uniqueness). No README layer states either.

**Repair:** Add the following subsection.

"### 3.3 Short-time existence and tensorisation

Prove that for continuous `f⁰ ≥ 0` with `f⁰(x, v) ≤ C₀ exp(−β₀|v|²/2)` there are a time `T₁ > 0`, depending only on `d`, `C₀` and `β₀`, and a mild solution `f` on `[0, T₁]` with datum `f⁰` in the sense of HardSphereDynamicsAndKineticLimits §10.3 (GST2013 Theorem 1, p. 14: a fixed point in the weighted space, with the same proof on the torus). Prove that the Boltzmann hierarchy has at most one mild solution in the weighted spaces of §3.2 (GST2013 Theorem 7, p. 37). Hence the solution of §3.2 with data `(f⁰)^{⊗n}` is `(f(t)^{⊗n})_n` on `[0, min(T₀, T₁)]` (GST2013 p. 49). *Needs:* §2.2, §3.1, §3.2; HardSphereDynamicsAndKineticLimits §10.2, §10.3."

Then add §3.3 to the *Needs* of §5.2, and state in Scope and ownership that the short-time Cauchy problem is owned here.

## R03 (P1) — Layer 5 lacks the truncation-error bounds and the local uniform clause

**Location:** `README.md:246–248`, "Prove that each truncated term of the BBGKY Duhamel series converges to the corresponding term of the Boltzmann series, almost everywhere and against bounded continuous functions"; :257, "The truncation parameters of §4.2 are removed after the limit `ε → 0`".

**Claim:** Removing the truncations needs bounds on the truncated-away parts that are uniform in ε, and no target states them. The third clause of `HardSphere.LanfordStatement` says that the essential supremum on compacts of `|F^ε_1(t) − f(t)|` tends to 0. It follows from neither almost-everywhere nor weak convergence.

**Witness:** HardSphereDynamicsAndKineticLimits `Suggested.lean` lines 504–507 state the ess-sup clause. The truncation bounds are GST2013 Propositions 7.1.1, 7.2.1 and 7.3.1 (lines 2241, 2338, 2412). README Layers 3–5 contain neither.

**Repair:** Add the following subsection.

"### 3.4 Truncated series

Prove that, uniformly in ε and in `Z_n`, each Duhamel series differs by an error tending to 0 from its part with at most `k` created particles, all velocities in the ball of radius `R`, and consecutive creation times at least `δ` apart. The error tends to 0 as `k → ∞`, `R → ∞` and `δ → 0` (GST2013 Propositions 7.1.1–7.3.1 and Corollary 7.4.1, pp. 52–54). *Needs:* §3.1, §3.2."

In §5.1, add: "for `n = 1` the convergence is uniform on compact subsets of `𝕋^d × E`", with the theorem number in one of the proofs that BGSS2023 line 322 lists. Add §3.4 to the *Needs* of §5.1 and §5.2.

## R04 (P2) — §4.2 lacks the hypothesis on the initial configuration

**Location:** `README.md:219–222`, "the set of parameters for which a BBGKY pseudo-trajectory contains a recollision has measure tending to zero as `ε → 0`, and that outside it the BBGKY and Boltzmann pseudo-trajectories stay within `O(ε)`".

**Claim:** The statement is false when the n initial particles meet under backward free motion. They then collide in every pseudo-trajectory that the added particles leave undisturbed, for every small ε.

**Witness:** Torus, `x = (0.45,0.5),(0.55,0.5)`, `v = (−1,0),(1,0)`, `t = 0.1`. For every `ε < 0.1` the pair collides at backward time `0.05 − ε/2`. At time 0, particle 1 is at `(0.45 − ε, 0.5)` and its Boltzmann copy at `(0.55, 0.5)`.

**Repair:** "Prove that, for `Z_n` whose particles stay at mutual distance at least `ε₀` under backward free transport on `[0, t]` (GST2013 Definition 12.1.1, p. 94, with the time range cut to `[0, t]` on the torus), after the truncations of §3.4, the set of parameters for which a BBGKY pseudo-trajectory has a recollision has the measure bound of GST2013 Proposition 12.1.1. That bound tends to 0 when `ε ≪ a ≪ ε₀ ≪ ηδ` and then η, ε₀ → 0. Outside it the two pseudo-trajectories stay within `O(ε)`. Prove also that the excluded initial velocities have measure tending to 0 with `ε₀` (GST2013 Proposition 13.1.1, p. 103). On the torus, add the periodic recollisions (BGSS2023 Proposition 9.2.2, p. 111)."

## R05 (P2) — §2.1 "contacts at zero distance" in the §1.1 form is the zero operator

**Location:** `README.md:124–126`, "Define the limiting collision operators, with contacts taken at zero distance (GST2013, Part II), and prove that on tensor products they reduce to the Boltzmann collision operator".

**Claim:** At distance zero, the §1.1 integral places particle `n + 1` at `x_i` for every ω, so the integrand is odd in ω and the operator vanishes identically. The theorem of §2.1 then fails. The limiting operator is the gain–loss form with scattered velocities, which §2.1 does not state.

**Witness:** `∫_{S^{d−1}} ω·(w − v_i) g(Z_n, x_i, w) dω = (∫ ω dω)·(w − v_i) g(Z_n, x_i, w) = 0`. On `f^{⊗2}` this gives 0, not `Q(f, f)`. GST2013 (4.4.3), lines 1231–1241, uses the scattered velocities.

**Repair:** "Define `C⁰_{n,n+1} g(Z_n) = Σ_{i ≤ n} ∫_{S^{d−1} × E} ((w − v_i)·ω)_+ [g(z_1, …, (x_i, v_i*), …, z_n, (x_i, w*)) − g(Z_n, (x_i, w))] dω dw`, with `(v_i*, w*) = σ_ω(v_i, w)` the scattering of HardSphereDynamicsAndKineticLimits §2.1 (GST2013 (4.4.3), p. 33). Prove that `C⁰_{1,2} f^{⊗2} = Q(f, f)` of HardSphereDynamicsAndKineticLimits §10.2."

## R06 (P2) — Essential-supremum spaces carry no traces for the collision operators

**Location:** `README.md:42–44`, "measured by the supremum over `n` of `μ^n` times the essential supremum of `|g_n|`"; :162–163, "the collision operators of §1.1 and §2.1 are bounded between the weighted spaces of the Conventions".

**Claim:** §1.1 evaluates `g_{n+1}` on the contact spheres `{x_{n+1} = x_i + εω}`, which form a null set. So the operator is not defined on classes modulo null sets, and §3.1 is stated between spaces it does not act on.

**Witness:** Take d = 3, the `g` of the R08 Check (operator value `π²`), and `g′ = g·1_{|x₂−x₁|≠ε}`. They agree almost everywhere, yet `C g′ = 0`. GST2013 Definition 5.1.1 (line 1314) uses continuous functions and a supremum; BGSS2023 line 1529 notes the trace.

**Repair:** "Weights. For `β > 0` and `λ ∈ ℝ`, `X_{ε,n,β}` is the space of functions continuous on `𝒟̄^ε_n` with `|g_n|_{ε,n,β} = sup |g_n| exp(β|V_n|²/2) < ∞`, and `‖G‖ = sup_n e^{λn} |g_n|_{ε,n,β}` (GST2013 Definitions 5.1.1–5.1.2, pp. 35–36)." In §1.2, state the class of functions in which the correlation functions satisfy the hierarchy (the integrated form along the flow, BGSS2023 lines 1529–1531). The letter λ also removes the clash with the fugacity `μ_ε`.

## R07 (P3) — Locators are at Part level, and three point to the wrong text

**Location:** `README.md:80, 98–99, 124, 164, 179, 205, 222, 248`, e.g. "(GST2013, Part III)" at :205 and :222, and "(GST2013, Part II; BGSS2023, §2)" at :98–99. §2.2 (:139–140) has no locator.

**Claim:** In GST2013, Part III is the short-range-potential case, the setting is ℝᵈ, and Part IV proves velocity-averaged convergence rather than almost-everywhere convergence. In BGSS2023, §2 is cumulant combinatorics. No locator names a theorem or a page.

**Witness:** GST2013 contents, lines 77 and 100 (Part III: short-range potentials; Part IV: term-by-term convergence); line 833 (particles in ℝᵈ); Definition 6.2.1, line 2041. BGSS2023 contents, line 56 (§2 is combinatorics); the BBGKY hierarchy is §3.1, line 1503.

**Repair:** Cite arXiv v2 of both sources, as follows:

- §1.1: GST2013 (4.3.2), p. 31; BGSS2023 (3.1.3), p. 25.
- §1.2: GST2013 (4.3.5)–(4.3.8), p. 32; BGSS2023 (3.1.1)–(3.1.6), pp. 25–26.
- §2.1: GST2013 (4.4.3)–(4.4.6), p. 33.
- §2.2: GST2013 pp. 33 and 49.
- §3.1: GST2013 Propositions 5.3.1–5.3.2, pp. 38–39.
- §3.2: GST2013 Theorems 6–7, p. 37, and Lemma 5.3.1, p. 39.
- §4.1: BGSS2023 Definitions 3.2.1–3.2.2, pp. 26–27 (torus); GST2013 §7.4, p. 54.
- §4.2: as in R04.
- §5.1: GST2013 §14.2, p. 112. For the almost-everywhere and local uniform forms, cite the theorem number in one of the proofs that BGSS2023 line 322 lists.

## R08 (P3) — Checks of §1.1 are passed by the wrong models

**Location:** `README.md:87–88`, "On the product of Maxwellians of equal temperature the gain and loss parts cancel, so the operator vanishes; a definition with the normal oriented the wrong way gives a nonzero result."; :91, "the operator is a finite sum".

**Claim:** The first Check also holds with the wrong orientation, and for every position-independent function, Maxwellian or not. The third Check is false.

**Witness:** The substitution `ω ↦ −ω` shows that the reversed-normal operator is `−C`, and `∫_{S^{d−1}} ω dω = 0` gives `C g = 0` for every `g(V_{n+1})`. In d = 1 the ω-integral has two terms, but the integral over `w ∈ ℝ` remains.

**Repair:** Replace the first bullet with: "In d = 3, n = 1, `v_1 = 0`, for `g(Z_2) = 1_{|v_2| ≤ 1} 1_{(v_2 − v_1)·(x_2 − x_1) > 0}` the operator equals `∫_{|w|≤1} π|w| dw = π² ≈ 9.8696`. The reversed normal gives `−π²`, and the surface measure of the radius-ε sphere gives `ε²π²`."

Replace the third bullet with: "In d = 1, `S⁰ = {±1}`: the ω-integral is a sum of two terms, and the integral over `w ∈ ℝ` remains."

## R09 (P3) — Checks of §2.1 are false or name an undefined operation

**Location:** `README.md:132–134`, "a definition without the symmetrisation over the attached particle does not." and "On a product of Maxwellians it vanishes."

**Claim:** For n = 1 there is a single attached particle, and the operator contains no symmetrisation. The operator vanishes on the tensor power of one Maxwellian, not on products of different Maxwellians.

**Witness:** For n = 1 on `M_{1,0} ⊗ M_{1,e₁}`, the first velocity moment of `C⁰_{1,2}` is `c·E[|X|X]` with `c > 0` and `X ~ N(e₁, 2I)`. This is a nonzero multiple of `e₁`.

**Repair:** Replace the first bullet with: "On `f^{⊗2}` the first limiting operator equals `Q(f, f)` of HardSphereDynamicsAndKineticLimits §10.2; a definition that evaluates the gain term at the unscattered velocities gives 0."

Replace the second with: "On `M_{β,u}^{⊗(n+1)}` it vanishes. On `M_{1,0} ⊗ M_{1,e₁}` (n = 1) it does not: its first velocity moment is a positive multiple of `e₁`."

## R10 (P3) — Equilibrium Checks treat `F_n` as an exact tensor power

**Location:** `README.md:106–107`, "For the equilibrium grand canonical measure the correlation functions are time independent, so the collision term vanishes; a sign error in the Duhamel term breaks this."; :192, "For Maxwellian data both series reduce to their first term".

**Claim:** For n ≥ 2, the equilibrium `F_n` carries the exclusion factor `p_ε(X_n)` of HardSphereDynamicsAndKineticLimits §9.6, and the n-particle flow does not preserve it. So neither the BBGKY collision term nor the later terms of the series vanish. A term that did vanish could not detect a sign error.

**Witness:** n = 2, `x₁ − x₂ = 1.5ε e₁`, `v₁ − v₂ = −e₁`, `t = ε`. Then `F₂(t) = M⊗M p_ε(1.5ε)` and `S₂(t)F₂(0) = M⊗M p_ε(2.5ε)`. Since the excluded balls overlap only at 1.5ε, `p_ε(1.5ε) > p_ε(2.5ε)`.

**Repair:** Replace :106–107 with: "For the equilibrium datum, `F_n(t) = F_n(0)` (HardSphereDynamicsAndKineticLimits §9.4), so the collision term equals `F_n(0) − S_n(t)F_n(0)`. It is zero for n = 1 and nonzero for n = 2 at the configuration above, where reversing its sign breaks the identity."

Replace :192–193 with: "For Maxwellian data the Boltzmann series reduces to its first term; the BBGKY series does not for n ≥ 2."

## R11 (P3) — §4.2 Check: a single added particle can recollide on the torus

**Location:** `README.md:228`, "With a single added particle no recollision is possible."

**Claim:** This is false on the unit torus, where the pair can meet again through a periodic image.

**Witness:** ε = 0.1, n = 1, with particle 2 created at `x₁ + εe₁` and backward relative velocity `8e₁`. The relative position `(0.1 + 8τ)e₁` reaches `0.9e₁ ≡ −0.1e₁` at τ = 0.1, which is a contact. BGSS2023 Proposition 9.2.2 (line 7237) treats such self-recollisions.

**Repair:** "With a single added particle no recollision occurs on ℝᵈ. On the torus a recollision needs a relative displacement of at least `1 − 2ε`, so none occurs when all velocities lie in the ball of radius `R` and `2Rt < 1 − 2ε`."

## R12 (P3) — Layer 3 Checks: one contradicts the README, one is passed by every weight

**Location:** `README.md:170–172`, "a bound without the factor `n` would give a global time, which is false." and "For Maxwellian weights the bound is uniform in `ε`."

**Claim:** The README itself says that validity on long time intervals "remains open" (:290–291). Uniformity in ε holds for every function in the Boltzmann–Grad scaling, so the second bullet excludes no wrong model.

**Witness:** GST2013 Proposition 5.3.1 (line 1452) gives the bound `C_d β^{−d/2}(nβ^{−1/2} + Σ|v_i|)` for every `g` when `Nε^{d−1} = 1`, with no Maxwellian hypothesis.

**Repair:** Replace the first bullet with: "The bound grows linearly in n: on `g = exp(−βE₀(Z_{n+1}))` at `V_n = 0`, the loss part of `C_{n,n+1}` is n times its value for n = 1, so no bound independent of n holds."

Replace the second with: "Without the rescaling `μ_ε^{−n}` the hierarchy carries the factor `μ_ε = ε^{−(d−1)}`, and the bound is not uniform in ε."

## R13 (P3) — §5.2 omits the instance argument of the proposition

**Location:** `README.md:261`, "Prove `HardSphere.LanfordStatement d` for every `d ≥ 2`".

**Claim:** The proposition depends on a structure `[FlatPositionSpace d (UnitFlatTorus d)]`. The target says neither which structure is meant nor that every structure is.

**Witness:** HardSphereDynamicsAndKineticLimits `Suggested.lean` line 489 declares `def LanfordStatement (d : ℕ) [FlatPositionSpace d (UnitFlatTorus d)] : Prop`. Its §10.4 Checks show that every structure gives the same proposition.

**Repair:** "Prove `HardSphere.LanfordStatement d` for every `d ≥ 2` and every structure `[FlatPositionSpace d (UnitFlatTorus d)]`: for the structure of HardSphereDynamicsAndKineticLimits §1.3, and hence for all of them by the Checks of its §10.4."

## R14 (P3) — Definitions without API lists, and conventions without witnesses

**Location:** §1.1 (`README.md:77–81`), §2.1 (:124–126), §4.1 (:203–205) and the Weights convention (:42–46) have no API bullets. The phrase "the integral over the sphere of contact" fixes no measure, and `μ` denotes both the fugacity (:40) and the weight parameter (:42).

**Claim:** Each definition needs an API list and Checks that compute a value. Two normalisations of the contact-sphere integral are possible: the unit sphere with `μ_ε ε^{d−1} = 1`, or the surface measure of the radius-ε sphere. They differ by the factor `ε^{d−1}`, and nothing in the README pins which is meant. §3.1 and §3.2 state no exact hypotheses on the data.

**Witness:** GST2013 (4.3.2), line 1108, has the prefactor `(N − s)ε^{d−1}` and integrates over the unit sphere. The R08 Check gives `π²` for one normalisation and `ε²π²` for the other. None of the README's Checks computes a number.

**Repair:** In §1.1, write `C^ε_{n,n+1} g(Z_n) = Σ_{i ≤ n} ∫_{S^{d−1} × E} ω·(w − v_i) g(Z_n, (x_i + εω, w)) dω dw`, where the factor `μ_ε ε^{d−1} = 1` is absorbed by the rescaling of the Conventions. Add API bullets: linearity; the pointwise bound of §3.1; the gain–loss form under the specular condition (BGSS2023 (3.1.3)).

Give §2.1 and §4.1 API bullets: the representation of each Duhamel term, and `|A_{n,m}| = n(n+1)⋯(n+m−1)` (BGSS2023 p. 26).

In §3.2, state the hypothesis `sup_n e^{λ₀ n} |F_n(0)|_{ε,n,β₀} < ∞`, and state the conclusion as GST2013 Theorems 6–7 do (the solution is bounded by twice the initial norm).

## Verified sound

| Statement | Instances tried | Values computed (left / right) | Result | Change |
|---|---|---|---|---|
| §1.1 collision operator | d=3, n=1, v₁=0, g=1_{\|v₂\|≤1}1_{post} | unit sphere π²≈9.87; radius-ε surface ε²π²; reversed normal −π²; on M^{⊗2}: 0 for both orientations | normalisation unpinned; Check 1 does not discriminate | R08, R14 |
| §1.1 Check 3 | d=1, n=1 | ω-sum has 2 terms; ∫_ℝ dw remains | "finite sum" false | R08 |
| §1.2 Duhamel form | d=2, ε=0.1, t=0.2, Z₂=((0.1,0),(−0.1,0);0,(−1,0)) | free transport: both at (0.1,0), F₂(0)=0; flow: ((0.2,0),(0,0);(−1,0),0), F₂(0)>0 | false for n≥2 | R01 |
| §1.2 Check 2 | n=2, x₁−x₂=1.5εe₁, v₁−v₂=−e₁, t=ε | F₂(t)=M⊗M p_ε(1.5ε) > S₂(t)F₂(0)=M⊗M p_ε(2.5ε) | collision term ≠ 0 | R10 |
| §2.1 limiting operator | zero-distance §1.1 form on f^{⊗2} | ∫ω dω=0 gives 0; gain–loss form (GST2013 (4.4.3)) gives Q(f,f) | underdetermined | R05 |
| §2.1 Check 2 | n=1, M_{1,0}⊗M_{1,e₁} | claimed 0; first moment c·E[\|X\|X], X~N(e₁,2I): positive multiple of e₁ | false | R09 |
| §2.2 tensorised solutions | n=1; f=M_{β,0} | C⁰_{1,2}f^{⊗2}=Q(f,f), so the equation is mild Boltzmann; M^{⊗n} stationary on both sides | holds; no locator | R07 |
| §3.1 continuity | loss part on e^{−βE₀}, V_n=0, n vs 1 | n·c vs c; GST2013 (5.3.1): C_dβ^{−d/2}(nβ^{−1/2}+Σ\|v_i\|) ≤ C(β)n/(β−β′) for β−β′≤1 | holds; Check 1 overclaims | R12 |
| §3.2 short-time bounds | quantifier order vs supplier `Suggested.lean` line 490; GST2013 Theorem 6 | ∀C₀,β₀ ∃T₀ ∀f⁰ on both sides; GST2013: ‖F‖≤2‖F(0)‖ | holds; data hypothesis unstated | R14 |
| §4.1 trees, pseudo-trajectories | n=2, m=2; m=0 with Z₂ of the §1.2 row | \|A_{2,2}\|=2·3=6, as BGSS2023 line 1564; m=0: hard-sphere flow (BGSS2023 line 1586), not free transport | Check 1 false | R01 |
| §4.2 recollisions | torus, x=(0.45,0.5),(0.55,0.5), v=(−1,0),(1,0), t=0.1 | the pair collides at 0.05−ε/2 for all ε<0.1; particle 1 at (0.45−ε,0.5) vs Boltzmann (0.55,0.5) | false without a good-configuration hypothesis | R04 |
| §4.2 Check 1 | torus, ε=0.1, one added particle, relative speed 8 | 0.1+8τ reaches 0.9≡−0.1 at τ=0.1: recollision | false on the torus | R11 |
| §5.1 term-by-term | GST2013 Theorem 8 / Definition 6.2.1 vs README vs supplier `Suggested.lean` line 504 | GST2013: velocity-averaged, locally uniform off diagonals; README: a.e. and weak; also needed: ess-sup on compacts for n=1 | gap | R03, R07 |
| §5.2 `LanfordStatement` (headline) | d=0; Maxwellian datum; t=0 | d=0: F₁=1/2 vs f=1 (supplier Check), excluded by d≥2; Maxwellian: M^{⊗n} on both sides; t=0: by §9.6; ∃f: no target | route incomplete | R02, R03, R13 |
| Weights (Conventions) | d=3, g of the §1.1 row vs g·1_{\|x₂−x₁\|≠ε} | weighted ess-sup distance 0; operator values π² vs 0 | operator undefined on classes | R06 |

- Source locators: the README's 11 source locators (GST2013 9, BGSS2023 2) were checked against the arXiv v2 texts. A further 24 numbered statements were opened for the witnesses (GST2013 18, BGSS2023 6).
- Library: `MeasureTheory.eLpNormEssSup` is at `Mathlib/MeasureTheory/Function/LpSeminorm/Defs.lean:77` at the pin. The pinned Mathlib and Tau Ceti have no hard-sphere, BBGKY or hierarchy objects (the only "Boltzmann" hits are optimal-transport entropy).
- Cross-roadmap citations: 17 ids of HardSphereDynamicsAndKineticLimits (16 sections and Layer 2) at its open head and 9 Lean names in its `Suggested.lean` (lines 58–489) all resolve. None is missing.
- Gate: the worker's gate at 6b413f7 passes. My rerun against the public merge order flags only `NOT IN ORDER` (the roadmap is at the design stage). The dependency check with the candidate order prints `depcheck: 261 roadmaps, 2596 edges, 0 problem(s)`; the supplier is at line 442 and this roadmap at line 443. The diff outside the folder is empty.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with no messages. There are no declarations, so the `#check @name` comparison had nothing to compare.
- `Suggested.lean`: every headline needs the supplier's carriers, which are absent at the pins, and the docstring names each headline with the carrier it lacks. There is no padding, so nothing needed the one-tactic probe.
- Description: every sentence was read against the head. None is contradicted beyond the locators of R07.
- Wording: 7-word runs shared with GST2013 or BGSS2023 are reference titles and standard phrases only (e.g. "a mild solution of the Boltzmann equation").

Overlap check: read HardSphereDynamicsAndKineticLimits (the only entry in the open-vocabulary and results lists; the list of roadmaps on main by vocabulary is empty). The one shared object is `HardSphere.LanfordStatement`: HardSphereDynamicsAndKineticLimits §10.4 owns the statement, and this roadmap owns the proof, as that roadmap's Scope and Downstream consumers assign. A search of all roadmaps for BBGKY, Boltzmann hierarchy, pseudo-trajectory and recollision finds no other owner.

Source independence: 17 passages compared with 2 sources, none shared beyond titles and standard phrases. The largest share is GST2013's, with 9 of 11 locators. Contents compared with GST2013: independent. Layers 1–5 correspond to §4.3, §4.4, Ch. 5, §7.4 with Ch. 12, and Ch. 13–14, in an order forced by the Needs lines (3.1 needs 1.1 and 2.1; 3.2 needs 1.2 and 2.2; 5.1 needs 3.2 and 4.2). The layers merge some of GST2013's chapters and omit Ch. 6 and §7.1–7.3.

Research link: Layer 5 proves Lanford's theorem (Lanford 1975) in the grand canonical form on the torus. Bodineau–Gallagher–Saint-Raymond–Simonella (2023) state it as Theorem 1, the law of large numbers that their fluctuation and large-deviation theorems refine. Layers 1–4 are the BBGKY and pseudo-trajectory method of Gallagher–Saint-Raymond–Texier (2013). This rests on BGSS2023 lines 313–323 and the README's Research context section.

## Not verifiable

- Lanford1975 (Springer, Lecture Notes in Physics 38): the publisher's copy is paywalled and was not fetched. No target cites it.
- The published versions of GST2013 (EMS 2013) and BGSS2023 (Ann. of Math. 198): their numbering was not compared. arXiv v2 was read, and the README states no version.
- The proofs that BGSS2023 line 322 lists, and the treatment of traces it cites at line 1530: not fetched. R03 and R06 name them only as places to find a locator.

## Source issues

- **Misprint** in GST2013 at Lemma 6.2.2, p. 49: the source says the hard-sphere sequence is bounded in the space of Definition 10.2.3, which is the potential-case space; it should be Definition 5.1.4, the hard-sphere space; affects nothing.

## For the human reviewers

- none
