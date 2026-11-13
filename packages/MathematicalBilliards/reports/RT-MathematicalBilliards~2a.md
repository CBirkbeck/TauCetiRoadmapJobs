<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13476#issuecomment-6849279099 -->
Red team round 2 pass a (claude) of 1427b80

Verdict: needs_changes

1. **F01** (P3) The route of §3.3 takes `Λ⁻¹ ∘ R ∘ Λ = I ∘ T` from §1.4, where it is only a Check

   **Location.** `packages/MathematicalBilliards/README.md:278` (§3.3): "The orientation reversal `R(e, c) = (−e, −c)` preserves `dθ ⊗ Lebesgue` … and `Λ⁻¹ ∘ R ∘ Λ = I ∘ T` (§1.4), so `T = I ∘ Λ⁻¹ ∘ R ∘ Λ` preserves `μ_A`".

   **Claim.** The step that carries the headline `ConvexTable.measurePreserving_billiardMap` at `k = 1` is supplied by §1.4.

   **Witness.** §1.4's API has three bullets (representation, `Λ` a homeomorphism, the inverse); the identity occurs only in its third Check (README:153). §1.4 is before Layer 2, where `T` and `I` are defined, and its `*Needs:*` is §1.3. No target states the identity.

   **Repair.** In §2.4, after the first sentence, add:

   > Prove also that reversing the oriented line of a state is `I ∘ T`: for `(s, δ) ∈ A` with `T(s, δ) = (s₁, δ₁)`, `Λ(s₁, π − δ₁) = R(Λ(s, δ))`, where `Λ` is the homeomorphism of §1.4 and `R(e, c) = (−e, −c)`; that is, `Λ ∘ I ∘ T = R ∘ Λ` on `A`. Route: by §2.1, `τ(s₁) = exp(iδ₁)e` for `e = exp(iδ)τ(s)`, so `exp(i(π − δ₁))τ(s₁) = −e`, and `γ(s₁)` lies on the line of `(s, δ)`, so `(−e) × γ(s₁) = −(e × γ(s))`.

   Change the `*Needs:*` of §2.4 to "§1.4, §2.1", and in §3.3 replace "(§1.4)" after the identity by "(§2.4)". Add to §2.4's Checks: "Unit circle: `Λ(I(T(s, δ))) = Λ(s + 2δ, π − δ) = (−exp(i(s + δ + π/2)), cos δ) = R(Λ(s, δ))`." Tested: with `Λ(s, δ) = (exp(i(s + δ + π/2)), −cos δ)` both sides are `(−exp(i(s + δ + π/2)), cos δ)`; at `(0, π/3)`: `(exp(11πi/6), 1/2)`.

2. **F02** (P2) The product theorem of §12.1 has no hypotheses and no route, and needs §12.3 and §12.4.1

   **Location.** `packages/MathematicalBilliards/README.md:873` (§12.1, API): "The product of a weakly mixing action with an ergodic one is ergodic (Hochman2012, Proposition 6.2.1, printed p. 59, line 2627, for `ℤ`-actions; …)".

   **Claim.** A theorem on `ℝ`-actions, promised as API of §12.1, whose `*Needs:*` line names only Mathlib. The open roadmap ClassicalErgodicTheory cites it ("§12.1's … with ergodicity of the product of a weakly mixing action and an ergodic one", its supplier subsection "From TauCetiRoadmap.MathematicalBilliards").

   **Witness.** The bullet names no action on the product, no measure and no measurability. The cited proof (Hochman2012 lines 2664–2669) finishes "from ergodicity of `S`", the Cesàro convergence of the correlations of the ergodic factor: for `ℝ` this is §12.4.1 at `a = 0` on the Koopman group of §12.3, both after §12.1.

   **Repair.** Delete the bullet from §12.1's API and add in its place: "The multiplier property (the product with an ergodic action is ergodic) is proved in §12.5." At the end of §12.5, before its Checks, add:

   > Prove the multiplier property: let `ℝ` act on `X` and on `Y` with `MeasurableVAdd₂`, with invariant probability measures `μ` and `ν`, and on `X × Y` by `t +ᵥ (x, y) = (t +ᵥ x, t +ᵥ y)` (Mathlib's product action). If `IsWeaklyMixing μ` and `ErgodicVAdd ℝ Y ν`, the product action is ergodic for `μ.prod ν` (Hochman2012, Proposition 6.2.1, printed p. 59, line 2627, for `ℤ`-actions). Route: for `f₁, f₂ ∈ L²(μ)` and `g₁, g₂ ∈ L²(ν)` the correlation of `f₁ ⊗ g₁` with `f₂ ⊗ g₂` at time `t` is a product `a(t) b(t)`; by §12.1, `T⁻¹∫₀ᵀ |a(t) − (∫f₂) conj(∫f₁)| dt → 0`; `b` is bounded and `T⁻¹∫₀ᵀ b(t) dt → (∫g₂) conj(∫g₁)` by §12.4.1 with `a = 0` for the Koopman group of `Y` (§12.3), whose fixed vectors are the constants by ergodicity. Products span a dense subspace of `L²(μ ⊗ ν)`, so an invariant square-integrable function is orthogonal to every function of integral `0`. *Needs:* §12.1, §12.3, §12.4.1; Mathlib `ErgodicVAdd`, `MeasureTheory.Measure.prod`.

   Add to §12.5's Checks: "For `X` a point the product is `Y`, ergodic. Weak mixing is needed: for `X = Y = AddCircle 1` with the translation flow, ergodic and not weakly mixing, `e₁(x) conj(e₁(y))` is invariant under the product flow (`exp(2πit) exp(−2πit) = 1`) and not constant." Tested on both instances: one point gives `a(t) = (∫f₂) conj(∫f₁)` exactly; the two-circle instance has `a(t) = exp(2πit)` for `f₁ = f₂ = e₁`, whose modulus `1` does not average to `0`, so the hypothesis fails as it must.

3. **F03** (P3) Layer 10's "Dependencies" line omits Tau Ceti

   **Location.** `packages/MathematicalBilliards/README.md:800` (Layer 10, Dependencies): "Mathlib manifolds."

   **Claim.** Layer 10 depends on Mathlib only.

   **Witness.** README:728 (§10.1 `*Needs:*`): "Tau Ceti `TauCeti.smulGroupoid`, `TauCeti.mem_smulGroupoid_iff`, …"; README:786 (§10.5 `*Needs:*`): "Tau Ceti `TauCeti.hasGroupoid_smulGroupoid_quotient_subgroup`".

   **Repair.** Replace the line by: "Mathlib manifolds; Tau Ceti's groupoid of maps locally given by a group action, with its restriction, smoothness and quotient theorems (`TauCeti/Geometry/Manifold/SMulGroupoid.lean`), in §10.1 and §10.5."

4. **F04** (P3) The References entry for Herman1983 omits a cited section

   **Location.** `packages/MathematicalBilliards/README.md:963`: "Chapitre I (1.2, 2.2, 2.4, 3.1, 3.4, 5.2) and the Appendice by A. Fathi".

   **Claim.** The entry lists the sections of Herman1983 that the roadmap cites.

   **Witness.** README:326 (§4.2) cites "Herman1983, Chapitre I, §4.3, Remarque, printed p. 27, lines 762–769" (verified at Herman1983 lines 762–769); 4.3 is not in the entry, and 3.1 is listed but cited by no target.

   **Repair.** Replace the parenthesis by "(1.2, 2.2, 2.4, 3.4, 4.3, 5.2)".

One P2 (S02) and three P3 (S01, S03, S04). No statement of `Suggested.lean` was found false; all eight round-1 findings are repaired.

## Round-1 findings at this head

| Id | State | Witness at 1427b80 |
|---|---|---|
| RT~1a/F01 (strong continuity missing from the acceptance test) | repaired | `packages/MathematicalBilliards/Suggested.lean:269` `theorem continuous_compMeasurePreserving_vadd … (f : Lp ℂ 2 μ) : Continuous fun t : ℝ => Lp.compMeasurePreserving …`; README §12.3 "Prove `continuous_compMeasurePreserving_vadd`"; listed in the module docstring and in the declaration list of "How to read the build". |
| RT~1a/F02 (translation groupoid rebuilt) | repaired, one residue (S03) | README §10.1: "The translation groupoid is `TauCeti.smulGroupoid (Multiplicative ℂ) ℂ`"; the supplier bullet lists the seven Tau Ceti declarations, all found in `TauCeti/Geometry/Manifold/SMulGroupoid.lean` at the pin. The Layer 10 "Dependencies" line was not updated (S03). |
| RT~1a/F03 (unfolding without stabiliser) | repaired | README §11.4: "`Π_θ` induces a bijection from `S_P^θ/K_θ` onto `M_θ ∖ Σ` with `Π_θ ∘ φ_θ^t = F^t ∘ Π_θ`"; recomputed below (square, `θ = 1`: `|K_θ| = 2`, `|G·θ| = 2`, mass `4`). |
| RT~1a/F04 (least-period Check) | repaired | README §6.2: "let `m` be the least positive integer with `F^m(x₀) = x₀ + (jℓ, 0)` … The return times form the subgroup `mℤ`". |
| RT~1b/F01 (`2 ≤ k` in the invariant measure) | repaired; the new route has an unowned step (S01) | `Suggested.lean:162–164` has no `hk`; README §3.3 "for every table `γ` (of class `C^k`, `k ≥ 1`)". |
| RT~1b/F02 (`hcop`) | repaired | `Suggested.lean:246–249`: `{p q : ℕ} (hp : 0 < p) (hpq : p < q)`; README §6.4 "The coprime case is the content". |
| RT~1b/F03 (orientation, isotopy) | repaired | README §4.1 API: "the restriction of `F` to a boundary line is an injective continuous map of `ℝ` commuting with `x ↦ x + ℓ`, hence increasing and onto"; §5.2 names the lift condition and adds the Check `(−x − y, y)`. |
| RT~1b/F04 (Herman 3.4.3 locator) | repaired | README §4.4: "This is the standard definition, stated here; Herman1983, Chapitre I, 3.4.3, lines 425–432, does not define the set". Herman1983 lines 425–432 agree. |

No repair introduced a false statement. Two repairs left the defects S01 and S03.

## Verified sound

**Counts.** Declarations read: 17 of `Suggested.lean` (9 definitions, 8 theorems) and its one proved `example`. README: all 974 lines, 52 numbered subsections, 186 Check bullets read; every Check with a numerical value recomputed (the table below records the ones that pin a convention or a formula). Locators verified against the cached texts: 30 (Herman1983 10, BialyMironov2022 7, Hochman2012 8, ChaikaForni2026 5). Sibling citations checked on main or at the open head: 11 (CotangentLagrangian C3.1 twice, IntegrableSystems I5.0 and I5.4, RiemannianGeometry/Surfaces §3.1 with `integral_signedCurvature_add_sum_exteriorAngle_eq_two_pi`, GeometricTopology §2.3 and §1.7, FactorRigidity §8.2, ProbabilisticAndMetricNumberTheory §4.9a and §4.6, `exists_billiard_periodic_reflection`). Pinned declarations checked by grep: 33 Mathlib names and 22 Tau Ceti names of the supplier contracts, all present in the files named (`MeasureTheory.measurePreserving_vadd` is the `to_additive` form of `measurePreserving_smul` in `Mathlib/MeasureTheory/Group/Action.lean`).

**Dependency check** (output): `depcheck: 206 roadmaps, 1896 edges, 0 problem(s)`. No UPWARD, CYCLE or `moved:` line.

**Policy.** `git diff --stat origin/main...HEAD` touches only `packages/MathematicalBilliards/`. No pull-request number or process wording in the README or the docstrings; no `lemma`, `set_option`, `#eval`, `#print`, `True` placeholder or sorry'd data. Imports: `import Mathlib` and `TauCeti.Analysis.Semigroups.Group.Unitary`, which exists at the pin. Supplier gaps: none declared and none needed (`design/plan.json` has `"gaps": []`).

**Binders.** I ran no Lean. I compared the 17 elaborated types of the worker's signature listing with the README statements: each carries its hypotheses in its own signature (the file has no `variable` block), and each agrees with the README's generality: `measurePreserving_billiardMap` for every `k`; `exists_lipschitzWith_of_isRotationalInvariantCurve` with `2 ≤ k`; `isGraph_of_isRotationalInvariantCurve` with `0 < ℓ`, `a < b`, the lift relation, the twist disjunction and non-wandering on the open annulus; `exists_tendsto_twistedAverage` with `[CompleteSpace H]` and `U.IsUnitary`; `isWeaklyMixing_iff` and `continuous_compMeasurePreserving_vadd` with `MeasurableVAdd₂`, `IsProbabilityMeasure` and `VAddInvariantMeasure`.

**Headlines and padding.** README end theorems: invariance of `sin δ dδ ds` (stated), Birkhoff's graph theorem (stated, with the billiard Lipschitz form), two Birkhoff orbits (stated), measure preservation and reversibility of the polygonal flow, the unfolding theorem (both named in the module docstring as not statable: the flow, `Z_P` and `S_P` are constructions of Layers 7–11), the eigenfunction criterion (stated). The three further Layer 12 theorems are theorems on library carriers, none following from one library lemma: no Wiener lemma, no mean ergodic theorem for a one-parameter group and no continuity of `Lp` pullbacks without topology exists at the pins (searched by object). No padding found.

**Ownership.** Searched main and the open heads by object (`billiard`, `translation surface`, `flat structure`, `cone angle`, `weak mixing`, `Wiener`, `non-wandering`, `twist map`, `invariant curve`, `Koopman`, `rotation number`). ClassicalErgodicTheory (open) imports this roadmap's §§12.1–12.5 and Layers 7–8 and plans none of them; TeichmullerGeometry (open) plans no translation surfaces. CotangentLagrangian C3.1 owns the smooth billiard map and is cited, not restated. No second owner and no shared fully qualified name.

**Adversarial pass.**

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| `ConvexTable` (§1.1) | unit circle; clockwise circle; stadium; `C¹` circle–ellipse | `1 − cos(t − s) > 0` off `2πℤ`; `cos(t − s) − 1 < 0`; `0` along a segment; ellipse `x² + 4y² = 1` has curvature `a/b² = 4` at `(±1, 0)` against `1` | sound; injectivity and minimal period follow from the strict inequality |
| §1.2 curvature criterion | ellipse; `exp(2iu) + exp(iu)` | `h″(s) = κ(s)`; `Im(conj γ′ · γ″) = 9 + 6cos u ≥ 3`, turning `4π`, not injective | sound |
| `ConvexTable.billiardLift` (§2.1) | unit circle `(0, π/2)`; `δ = 0`; `δ = π`; `δ ∈ (π, 2π)`; `δ = 5π/2` | set `{sin t ≤ 0} = [π, 2π)`, `s₁ = π`, `δ₁ = arccos 0 = π/2`; set `(s, s + ℓ)`, `s₁ = s`, `δ₁ = 0`; `∅`, `sInf ∅ = 0`; set `(s, s₁′]`, infimum `s`, `δ₁ = arccos(cos δ)`; `e = −1`, image `(π, π/2)` | sound; the Borel pieces of §3.3 cover `AddCircle ℓ × ℝ` |
| §2.2 derivatives | circle; `C¹` table at the diameter from `(1, 0)` | `∂Φ/∂s₁ = sin δ₁`, `∂Φ/∂s = sin δ − κL`, `∂Φ/∂δ = −L`; circle `1` and `2R`; one-sided `2·1 − 1 = 1`, `2·4 − 1 = 7` | sound |
| §2.4 time reversal | circle | `I F I(s, δ) = (s + ℓ − 2Rδ, δ) = τ_ℓ F⁻¹(s, δ)`; `(I T)² = (s + ℓ, δ)` | sound |
| §3.1–3.2 | circle; ellipse `(2cos u, sin u)` from `(2, 0)`, `δ = π/4` | `L_{s s₁} = sin δ/(2R) = sin²δ/L`; exit `(6/5, 4/5)`, chord `4√2/5`, `cos δ₁ = 11/√146`, `sin δ₁ = 5/√146`, `det = √73/5` | sound |
| `phaseMeasure`, `measurePreserving_billiardMap` (§3.3) | circle; fixed direction | `Λ = (exp(i(s + δ + π/2)), −cos δ)`, Jacobian `sin δ`; `d(e × γ(s))/ds = e × τ(s) = −sin δ`; `Λ(I T) = R(Λ)`; mass `2ℓ` | true as typed; route step unowned (S01) |
| `IsTwistLift` (§4.1) | shear; rotation `(x + 1/4, y)`; inverse of a positive twist | `F₁ = x + y` increasing; constant in `y`; `(F⁻¹)₁(X, ·)` injective and `g_a⁻¹ > g_b⁻¹`, so decreasing | sound; "negative twist iff inverse is `IsTwistLift`" holds |
| §4.2 exactness | shear; standard map; `(x + y, y + c)` | `S = y²/2`, `h = (X − x)²/2`, `−∂₁h = ∂₂h = 1` at `(1, 2)`; `S = −ε cos(2πx)/(2π) + Y²/2`; flux `c` | sound |
| §4.3, conventions of §3.2 against I5.0 and C3.1 | circle | `y = −cos δ`: `−∂₁(−L) = −cos δ = y`, `∂₂(−L) = −cos δ₁ = Y`; C3.1 has `v = ∂_s S`, `S = −‖χ(t) − χ(s)‖`, `v = cos δ` | consistent with both suppliers |
| `nonwanderingSet` (§4.4) | identity; `x ↦ x + 1`; `(x, y²)` | all points; empty; the two boundary circles | sound |
| §5.2 Birkhoff–Fathi | shear with `U = AddCircle 1 × [0, 1)`; the `sin 8πt` curve; values of the graph | frontier `{y = 1}`; `dx/dt = 1 + 0.8π cos 8πt < 0` somewhere; `U` contains the boundary circle (it is the manifold boundary of `U`), hence a collar, so `ψ > a` | sound, including the target `Ioo a b`; Herman1983 lines 1150–1154 have the same hypotheses |
| `isGraph_of_isRotationalInvariantCurve` (§5.3) | circle curves `y = c`; `a = b`; rotation by `1/4` | graph of the constant; excluded by `hab`; not a twist (`F₁` constant in `y`) | true as typed |
| Lipschitz bound of §5.3 | conjugated shear `G = Φ F Φ⁻¹`, `Φ(x, y) = (x, y + φ(x))`; circle | curve slope `φ′`; bounds `φ′ + 1` and `φ′ − 1`; `max(|φ′ + 1|, |φ′ − 1|) ≥ |φ′|`; circle `±1/(2R)` against `0` | sound |
| §5.4 rotation numbers | circle `δ = π/3`, `2π/3`; `α = √2/2`, `q = 7`, `p = 5`; the two lifts with fixed points | `1/3`, `2/3 = 1 − 1/3` (`g_I = g⁻¹ + ℓ`); `5 − 7α ≈ 0.0503`, `g₂⁷ ≥ g₁⁷ + ε` by monotonicity; both `0` with `g₁ < g₂` | sound; the rational strict case is Herman1983 2.4.4, lines 287–319 |
| §5.6 | `ψ(s + 2Rψ(s)) = ψ(s)` | a nonconstant continuous `ψ` takes a value `c` with `c/π ∉ ℚ`, whose level set is invariant under a dense rotation | sound |
| `ConvexTable.IsPeriodicConfiguration` (§6.2) | equilateral; `(0, π/2, π)`; `s_j = jπ√2`; `q = 1` | `1/2 = 1/2`; `0 ≠ 1/√2`; gap `π√2 < 2π`, excluded by `0 < q` with the period equation; no configuration (`pℓ ∈ (0, ℓ)` impossible) | sound |
| `ConvexTable.exists_two_periodic_orbits` (§6.3–6.4) | ellipse `(1, 2)`, `(2, 4)`; wholly collapsed `(1, 3)`; run-end variation | `W = 8`, `4`; doubled axes, gaps `ℓ/2`; `2p(q − p)ℓ/q = 4ℓ/3`; rates `1 − cos δ`, `1 + cos δ > 0` | true as typed; I5.4 states the cup-length bound and the continuity property used |
| §7.1–7.3 | square; square with hole; corner angles `π/2`, `2π/3`, `3π/2`, `π` | angle sums `2π`, `8π = (8 − 2 + 2)π`; `⌈π/α⌉ = 2, 2, 1, 1` | sound |
| §8.1–8.3 | square `((1/2, 1/2), 1)`; `((1/2, 1/4), exp(iπ/4))` | times `1/2`, `1`, `2`: `(1, 1/2)`, direction `−1`, back; line `y − x = −1/4` meets no lattice point | sound |
| §9.1–9.3 | square; `π/8` triangle; hole rotated by `θ ∉ πℚ` | `N = 2`; `N = lcm(2, 8, 8) = 8`; infinite; `conj d · σ(v) = ζ² conj(conj d · v)` with `ζ^{2N} = 1`, so `Re((conj d · v)^N)` is invariant | sound |
| §10.2–10.3 | octagon; cone disc `k = 3`; torus with `k = 1` | `8 · 3π/4 = 6π`; `∫₀^r 2πρ^{2k−1}dρ = πr^{2k}/k`, `3πρ²` for `r = (3ρ)^{1/3}`; `π/16`, `π/4` | sound |
| §11.1–11.3 | square, triangle, `π/8` triangle, L, square with hole | vertex classes `1`; `1`; `4, 1, 1`; `χ = 0, 0, −2, −2, −8`; `2g − 2 = Σ(|G|/(2n_v))(m_v − 1)`; gluing `gσ_S x + g(x₀ − σ_S x₀) = gx` on `S` | sound |
| §11.4 unfolding | square `θ = 1`; boundary states; fixed points of relabelling | fibre of `Π_θ` over `(x, v)` is `K_θ h₀`, over a side state `K_θ h₀ ∪ K_θ h₀σ_S`, one `K_θ`-orbit in `S_P`; `k = hσ_S h⁻¹` fixes `θ` only if `θ = ±hd` | sound |
| `IsWeaklyMixing` (§12.1–12.2) | two points; half-torus; one point | `1/4`; average of `||1/2 − t| − 1/4|` is `1/8`; `0`, and `⟨1, i⟩ − i = 0` | sound |
| `continuous_compMeasurePreserving_vadd` (§12.3) | circle `e₁`; counting measure on `ℝ` | `‖U_t e₁ − e₁‖ = 2|sin πt|`; `√2` for `t ≠ 0` (excluded, not finite) | true; the differentiation step uses Fubini and invariance only |
| `tendsto_average_norm_charFun_sq` (§12.4) | `δ₀`; `(δ₀ + δ₁)/2`; Lebesgue on `[0, 1]` | `1`; `1/4 + 1/4`; `(2 − 2cos t)/t²`, `4/π²` at `π`, limit `0`; `Σ σ({ξ})² ≤ σ(ℝ)²` so the `tsum` is the sum | true |
| `exists_tendsto_twistedAverage` (§12.4.1) | `e₁` with `a = 0`, `1`; identity group | `A_N⁰ e₁ = 0`; `A_T¹ e₁ = e₁`, `⟨e₁, U_{1/4} e₁⟩ = i`, atom at `2π = 2π · 1`; `(1 − exp(−2πiaT))/(2πiaT) → 0` | true; sign of the twist and the factor `2π` agree with `charFun` |
| `isWeaklyMixing_iff` (§12.5) | one point; torus character; `f = 0` | both sides hold; eigenvalue `⟨λ*, θ⟩`; constant | true |
| §12.6 | square `θ = 1`; `χ + χ ∘ ρ` | `exp(πiu)`, eigenvalue `1/2`; frequencies `λ*`, `rλ*` distinct off the axis, same eigenvalue since `rθ = θ` | sound |

## Not verifiable

- KatokHasselblatt1995, Tabachnikov2005, ChernovMarkarian2006, BoldrighiniKeaneMarchetti1978, ZemlyakovKatok1975, KerckhoffMasurSmillie1986 (waived) and MasurTabachnikov2002, Birkhoff1927 (uncertified): cited by locator, texts not read. The statements resting on them (§§1.3, 2.2, 6.1–6.4, 7–9, 11) were checked by computation, not against the texts.
- Hochman2012, Proposition 6.2.1, "printed p. 59": the extraction has no page marker between pages 59 and 61; line 2627 is correct, the page is inferred.
- The claim of §10.1 that the instance `ContMDiffConstSMul 𝓘(ℂ) ω (Multiplicative ℂ) ℂ` is not found at the pins: instance synthesis needs Lean, which this pass does not run. No declaration of that instance was found by grep.
- The elaborated types were read from the worker's listing, not regenerated.
- Step (ii) of §6.4 (a locally Lipschitz increasing field pointing into `P_ε`) was checked at the two boundary models only (rates `1 ± cos δ` and `2p(q − p)ℓ/q`), not as a full construction.

## Source issues

- **Misprint** in Hochman2012 at Lemma 6.1.6, items 2 and 3, printed p. 57 (lines 2478–2479): the source says the two Cesàro averages are equal to zero; it should be that they tend to zero as `N → ∞`; affects nothing.
- **Misprint** in Hochman2012 at the proof of Proposition 6.2.1, printed p. 60 (lines 2653–2668): the source pairs `g₂` with its own translate and integrates `f₂` against `ν`; it should be `g₁` against the translate of `g₂`, and `f₂` against `μ`; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "1427b8031576532f4eadf6a35068c3aaf3f76400", "job": "RT-MathematicalBilliards~2a", "model": "fable", "worker": "chris-x18"} -->
