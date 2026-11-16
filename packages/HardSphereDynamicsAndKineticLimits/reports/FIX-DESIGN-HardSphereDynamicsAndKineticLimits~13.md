# FIX-DESIGN-HardSphereDynamicsAndKineticLimits~13

This round repairs the findings of `REV-DESIGN-HardSphereDynamicsAndKineticLimits~12`: three findings, all P3. Files changed:

- `packages/HardSphereDynamicsAndKineticLimits/design/README.md`: the Scope paragraph "Left to other roadmaps", the second paragraph of "How to read the build", §7.4, §8.1, §9.5 (one new Check), §10.4 (definition and one new Check), §10.5 (the corollary) and the first Downstream consumer.
- `packages/HardSphereDynamicsAndKineticLimits/design/plan.json`: the locators of targets 7.4 and 8.1; the statement, hypotheses and a new test `rotated_cover` of target 10.4; the statement, the corollary hypothesis and the corollary API of target 10.5; a new test `factorial_moment` of target 9.5.

`sources.toml` is unchanged and no source was fetched.

## F01 (P3) — applied

§7.4: "…then density (`…exists_hasCompactSupport_eLpNorm_sub_le`) (GST2013 lines 1138–1140; DengHaniMa2024 lines 175–178)." → "…then density (…). The operator `f ↦ f ∘ T_{−t}` is the solution operator of GST2013 (4.3.5), lines 1138–1140, and the flow operator of DengHaniMa2024 (1.5), lines 175–178; its isometry and strong continuity on `Lp` are proved here and are stated in neither source." The plan locator of 7.4 now says the same.

**Verification.** The finding is right.
- GST2013 line 1140 defines `T_s(t) : f ↦ f(Ψ_s(−t, ·))` on continuous functions.
- DengHaniMa2024 lines 175–178 define `(S_N(t)f)(z) = f(H_N(t)^{−1} z)`.
- Both have the sign `−t` of §7.4. A search of all three cached texts for "strongly continuous", "isometr", "Koopman" and "unitary group" finds nothing.
- The reviewer's text was kept, with one addition: "isometry", which is not stated in either source either.

**Pattern.** §8.1 had the same construction: a locator closing a list of properties (`‖W(t)‖_p = ‖W⁰‖_p`, symmetry, `W(t) = U_t W⁰` in `Lp`) that the cited lines do not state. It now reads:
- define `W(t) = W⁰ ∘ T_{−t}`, the density whose evolution is described by BGSS2023 (1.1.3)–(1.1.4), lines 145–157, written with the solution operator of GST2013 (4.3.5), lines 1138–1140;
- `W(t)` is the density of the law at time `t` of DengHaniMa2024 (1.9)–(1.10), lines 224–234;
- "On Euclidean space and for indicators of measurable sets, the duality is DengHaniMa2024 (1.9)–(1.10); the other properties are proved here and are stated in none of the three sources."

The locator range was widened from lines 233–234 to 224–234, because (1.9) defines `W_N(t)` as the density of the law of `z(t)` (lines 226–232). The plan locator of 8.1 is aligned.

The locators of §7.1, §7.2, §7.5 and §8.2 were reread. Each supports what it closes:
- the flow: GST2013 line 862, DengHaniMa2024 (1.4);
- measure preservation: GST2013 line 883, DengHaniMa2024 Proposition 1.2(3);
- the grand canonical phase space: BGSS2023 lines 158–166;
- the Liouville equation: GST2013 (4.2.1), (4.3.1).

## F02 (P3) — applied

The reviewer's option (b) is applied, and extended in one place:
- **Line 85.** New text: `FlatTorus` comes with its quotient norm, Borel σ-algebra and the measure of §1.3 (definitions with bodies). The structure of §1.1 on it is not declared in `Suggested.lean`, because its lift, injectivity and local-measure axioms, and the properness of the torus that the class presupposes, are theorems of §1.3. So `HardSphere.LanfordStatement` and `HardSphere.LanfordStatement.tendsto_empirical` take the properness of `𝕋^d` and `[FlatPositionSpace d 𝕋^d]` as instance arguments.
- **§10.4.** The definition is restated with these arguments.
- **§10.5.** The corollary is restated with these arguments.
- **Downstream consumers.** The BBGKY consumer proves the proposition for §1.3's structure, hence for every structure.
- **New §10.4 Check.** It records the rotated cover.
- **Plan.** Targets 10.4 and 10.5 are aligned, with the new test `rotated_cover`.

**Verification.** The finding is right. The class of §1.1 has data `π` and `ρ` with proof fields, and §1.3 proves those fields with a fundamental-domain argument. An instance with a `sorry` field is excluded from `Suggested.lean`. Proving it in full there (option (a)) would put a theorem of §1.3 into the acceptance test.

Option (b) asserts nothing false, and asserts the same proposition for every structure. I proved the classification used in the new Check:
- **The cover is linear.** A structure's cover `π'` satisfies `‖π' a‖ ≤ |a|`, so it is 1-Lipschitz and continuous. It lifts through the covering `π : E → E/ℤᵈ` to a continuous `B` with `B 0 = 0`. The map `(a, b) ↦ B(a + b) − B a − B b` is continuous with values in ℤᵈ and vanishes at `(0, 0)`, so it is 0. Hence `B` is additive, and therefore linear.
- **Norm at most 1.** `‖π b‖ = |b|` for `|b| ≤ 1/2`, since `|b − k| ≥ 1 − 1/2` for `k ≠ 0`. So `|B a| ≤ |a|` for small `a`, and by linearity for all `a`.
- **Determinant ±1.** The local-measure axiom on a small ball `A` gives `vol(A) = vol(BA) = |det B| vol(A)`.
- **Orthogonal.** All singular values are at most 1 and their product is 1, so `B` is orthogonal.
- **Radius.** `B⁻¹(±e_1/2)` both map to `π(e_1/2)`, so `ρ' ≤ 1/2`.
- **Converse.** Every pair (`π ∘ B` with `B` orthogonal, `ρ' ≤ 1/2`) satisfies the axioms.
- **Same dynamics.** The short lift is `ℓ' = B⁻¹ℓ`, so `ν' = B⁻¹ν` and `σ_{B⁻¹ν}(v, w) = B⁻¹σ_ν(Bv, Bw)`. The flow is therefore conjugated by `Φ(X, V) = (X, BV)`, which preserves `λ_N`. Hence `F'_n[f⁰] = F_n[f⁰ ∘ Φ⁻¹] ∘ Φ`. `Q` commutes with `Φ` because `σ_S` and the kernel are rotation invariant, and `f` is a mild solution for `π'` exactly when `f ∘ Φ⁻¹` is one for `π`.
- **Same bounds.** The datum bounds depend on `|v|` only, and bounded continuous test functions, null sets and compact sets are preserved by `Φ`.

**Pattern.** Every other headline is stated on a generic `[FlatPositionSpace d X]` (§5.2–§10.5 first theorem), and none fixes the torus. The same gap existed for the class's properness hypothesis, which on `𝕋^d` is also a §1.3 theorem (compactness), so it is taken as an instance argument too. This goes beyond the reviewer's text.

## F03 (P3) — applied

New sentence in the Scope paragraph, after the PointProcesses sentence: RandomMatrices §8.1 defines the `k`-point correlation function of eigenvalue counts by factorial moments on pairwise disjoint sets. For `h` a product of indicators of pairwise disjoint sets, §9.5's identity is that identity for the particle counts at time `t`, with correlation function `μ^n F_n(t)` relative to `(μ_X ⊗ vol)^{⊗n}`. §9.5 keeps its own definition (a labelled phase space transported by the flow, with the `μ^{−n}` rescaling), and RandomMatrices §8.1, stated for eigenvalue counts, is not consumed. I also added a §9.5 Check (factorial moments) and the plan test `factorial_moment`.

**Verification.** `TauCetiRoadmap/RandomMatrices/README.md` on main, §8.1 (lines 1133–1150), defines the correlation function relative to a reference measure through `E ∏ⱼ N(Bⱼ)(N(Bⱼ)−1)⋯ = ∫ ρ_k dμ^k` for pairwise disjoint `Bⱼ`, with `N` the eigenvalue count `N_A(B)` of a random matrix.

For `h = ⊗ⱼ 1_{Bⱼ}^{⊗kⱼ}` with the `Bⱼ` pairwise disjoint, the sum over injective `i : Fin n → Fin N` counts ordered choices of distinct particles, `kⱼ` of them in `Bⱼ`. That sum is `∏ⱼ N(Bⱼ)(N(Bⱼ)−1)⋯(N(Bⱼ)−kⱼ+1)`, so §9.5 gives the identity with `ρ_n = μ^n F_n(t)`.

The disjointness is needed. With `B₁ = B₂ = B` and `k = (1, 1)`, the injective sum is `N(B)(N(B) − 1)`, not `N(B)²`.

`roadmaps overlaps RandomMatrices` lists no open pull request that changes RandomMatrices, so the citation of §8.1 is stable. RandomMatrices is on main and is named as a neighbour, not as a supplier, so no edge is added.

## Adversarial pass on the changed text

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §7.4 locator sentence | sign of the operator in each source | GST2013 l.1140: `f(Ψ(−t, ·))`; DengHaniMa2024 (1.5): `f(H(t)^{−1}z) = f(H(−t)z)`; §7.4: `f ∘ T_{−t}`. All three agree | Sound | sentence as above |
| §7.4 "stated in neither source" | grep of the three texts for strongly continuous / isometr / Koopman / unitary group | 0 hits in each | Sound | none |
| §8.1 duality attributed to DengHaniMa2024 (1.9)–(1.10) | `φ = 1_A` | `∫ W(t) 1_A = ∫ W⁰ (1_A ∘ T_t) = N! P(T_t z⁰ ∈ A)`, which is (1.9) with `W_N(t) = S_N(t)W_{0,N}` (1.10). For signed integrable `φ` the source says nothing | Sound for indicators on Euclidean space, as stated | scope of attribution stated |
| Classification of structures on `𝕋^2` (§10.4 Check) | `B` = quarter turn; `B = diag(1, 1/2)`; `B = diag(2, 1/2)`; `B = id` with ρ' = 0.6; d = 1 with `B = −1` | quarter turn: `π(B(0.3, 0)) = π(0, 0.3)`, norm 0.3 = `|(0.3, 0)|`, lift `(0.3, 0)`. `diag(1, 1/2)`: ball of radius 0.1 has vol 0.0314159, image 0.0157080, local-measure axiom fails. `diag(2, 1/2)`: det 1 but `‖π(0.2, 0)‖ = 0.2 > 0.1 = |(0.1, 0)|`, 1-Lipschitz fails. `id`, ρ' = 0.6: `(±0.5, 0)` same class, injectivity fails. d = 1, `B = −1`: all axioms hold, datum `f⁰(x, −v)` | Only orthogonal `B` with ρ' ≤ 1/2 | Check added |
| Conjugation of the dynamics (§10.4 Check) | d = 2, quarter turn, ε = 0.2, `x_i − x_j = π(0, 0.2)`, `v_i = (−1, 0)`, `v_j = 0` under `π ∘ B` | `ℓ'` gives `(0.2, 0)`, `ν' = (1, 0) = B⁻¹(0, 1)`; incoming `⟨v_i − v_j, ν'⟩ = −1`; after scattering `0`, `(−1, 0)`; conjugated: `Bv_i = (0, −1)`, `⟨(0, −1), (0, 1)⟩ = −1`, `σ_ν` gives `0`, `(0, −1) = B(−1, 0)` | Sound | none |
| Free transport witness (§10.4 Check) | `x = π(0)`, `v = (1, 0)`, time 0.3 | under `π ∘ B`: `π(B(0.3, 0)) = π(0, 0.3)`; under `π` with `Bv = (0, 1)`: `π(0, 0.3)` | Equal | none |
| Radius witness (§10.4 Check) | radius 0.6 under `π ∘ B` | `π(B(0, 0.5)) = π(−0.5, 0)`, `π(B(0, −0.5)) = π(0.5, 0)`; difference `e_1 ∈ ℤ²`; both points have norm 0.5 < 0.6 | Injectivity fails | none |
| Instance arguments of `LanfordStatement` | is each argument satisfiable? | properness: `𝕋^d` is the image of the compact cube `[0, 1]^d`, compact metric, hence proper; structure: §1.3's `π` with ρ = 1/2 | Both hold, so no vacuity | stated at line 85 and in §10.4 |
| Scope clause and §9.5 Check (factorial moments) | `n = 1`, `h = 1_B`; `n = 2`, `h = 1_B ⊗ 1_B`; disjoint `B₁, B₂`; ε = 0, `t = 0`, μ = 2, `∫ f⁰ = 1`, `∫_B f⁰ = 1/2` | `E[N(B)] = μ ∫_B F_1`; `N(B) ~ Poisson(1)`: `E[N(B)(N(B) − 1)] = 1 = μ²(∫_B f⁰)² = 4 · 1/4`; `E[N(B)²] = 1 + 1 = 2` ≠ 1 (all pairs). Disjoint: `E[N(B₁)N(B₂)] = λ₁λ₂ = μ² ∫_{B₁}f⁰ ∫_{B₂}f⁰` | Sound; distinctness and disjointness both needed | Check and test added |
| `F_2(0) = f⁰ ⊗ f⁰` at ε = 0 used by the new Check | mass 1 | `Z = e^{2}`, `F_2(0) = f⁰⊗f⁰ · Z⁻¹ Σ_p 2^p/p! = f⁰⊗f⁰` | Agrees with §9.5 Check 2 and §10.5 Check 3 | none |

## Checks

Dependency check (command of the brief), output after the edits:

```text
candidate: HardSphereDynamicsAndKineticLimits is not in the merge order yet; checked as if placed after MathematicalBilliards (the intake inserts it when its design is accepted)
depcheck: 246 roadmaps, 2241 edges, 0 problem(s)
```

- No UPWARD or CYCLE line.
- `plan.json` parses as JSON and was rewritten in its original formatting. A round-trip of the original was byte-identical before the edit.
- No `*Needs:*` line, prerequisite, target id or Lean name changed, so the README and plan prerequisites agree as before.
- No new backticked Lean name of this roadmap was introduced.

Lean: this is the design stage. The package has no `Suggested.lean`, so no `#check` comparison or elaboration was run and no Lean command was used. When `Suggested.lean` is written, the `#check @HardSphere.LanfordStatement` and `#check @HardSphere.LanfordStatement.tendsto_empirical` comparisons must show the two instance arguments (`ProperSpace` and `FlatPositionSpace d` on the unit flat torus) as binders.

Gate failures: none were listed for this round.

## For the maintainer

- **Names and ids.** No name, section number or id changed. No other roadmap cites this one.
- **Lean form for the package stage.** `HardSphere.LanfordStatement` and its corollary take `[ProperSpace 𝕋^d]` and `[FlatPositionSpace d 𝕋^d]` as instance arguments. The instance of §1.3 is not declared in `Suggested.lean`.
- **Ownership.** No new supplier. RandomMatrices §8.1 (on main) is named in Scope as a neighbouring definition that is not consumed. The correlation functions of §9.5 stay owned here.
- **Not checked.** Ownership against open pull requests for the new scope clause was checked only for RandomMatrices, with `roadmaps overlaps RandomMatrices` (no open pull request changes it).
- **Review text.** No suspicious instruction was found in it.
