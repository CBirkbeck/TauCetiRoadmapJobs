# Repair of ComplexHessianEquations (design, round 3)

This round resolves the twelve findings of the round-2 review (`reports/REV-DESIGN-ComplexHessianEquations~2.md`). Ten are applied as asked, R02 is applied differently, and R03 is marked not actionable in this package, with this package's false claim corrected. Files edited: `packages/ComplexHessianEquations/design/README.md`, `packages/ComplexHessianEquations/design/plan.json` and `packages/ComplexHessianEquations/sources.toml`. The plan still has 48 targets in eight layers. One gap remains (`weak-harnack-supersolutions`); the gap `abp-maximum-principle` is deleted.

## R01 (P1) — applied

Old → new: the non-divergence Schauder contract "Lane E item 22" → **PDE §5.6 (E25)**. The contract now restates E25's scaled seminorm estimate for `C²` solutions of `−a^{ij}∂_i∂_j u = f` (constants `m, α, λ, Λ`, `M ≥ r^α[a]_α`), plus the full `C^{2,α}(B_r)` norm via Taylor's formula along segments through the centre.

Evidence: on main, `TauCetiRoadmap/PDE/README.md` §5.3 (E22) is the divergence-form `C^{1,β}` estimate and §5.6 (E25) the non-divergence `C^{2,α}` estimate. The reviewer's witness holds: `a = 1 + |x|^α` and `u' = 1/a` give `−(au')' = 0` while `u''` is unbounded near `0`. Other places repaired: §5.2 *Needs*, §6.5 *Needs*, Layer 5 Dependencies, the plan prerequisites of 5.2 and 6.5, and the plan's PDE supplier entry. The other PDE citations moved to the section form PDE uses itself: "Lane C item 13" became §3.2 (C13) in §§4.2, 5.1, Layer 4 and Layer 5 Dependencies, and "Lane E item 23" became §5.4 (E23).

## R02 (P2) — applied differently

Old → new: the gap `abp-maximum-principle` ("PDE on its main branch plans no such statement") is **deleted**, not narrowed. The README now consumes **PDE §3.2 (C13)** with main's hypotheses (`W^{2,m}_loc ∩ C(Ω̄)`, measurable positive definite `a`, `f/D* ∈ L^m(Ω)`) and the constant-shift adapter `v = u − sup_{∂Ω} u`. §8.5 records why the integrability hypothesis holds.

Why differently: the review proposed narrowing the gap to a contact-set-only integrability extension "to preserve the gap's full advertised generality". No target uses that generality. In §8.5, which follows gpt2023 line 619–646, ABP is applied on a coordinate ball `B` to the cutoff `Hη`. `Hη` is `C²` on a neighbourhood of `B̄`, and the coefficient matrix of `tr(G·i∂∂̄·)` is continuous and positive definite on `B̄`, with `det a = 4^{−2n}(det Ĝ)²` (for `n = 1`, `Ĝ∂_z∂_z̄ = (Ĝ/4)Δ`). So `f/D*` is bounded on `B̄`, lies in `L^{2n}(B)`, and main's theorem applies. A residual gap would ask PDE for a statement nothing here consumes. Witness: on the unit ball with `u = −2 + (1 − |x|²)` and `a = I`, `Lu = −2m` and `sup_{∂Ω} u = −2`. Main's form bounds `sup u` by `0 + …`; the shifted form gives `−2 + …`. Other places: §8.5 *Needs*, Layer 8 Dependencies, plan 8.5 (prerequisite `roadmap:PDE §3.2 (C13)`), plan `gaps`, and the `gilbarg-trudinger2001` entry in `sources.toml` (Lemma 9.2 dropped).

## R03 (P2) — not actionable in this package: the hand-off needs K3Surfaces (an open pull request) to import §6.6 and a merge-order placement of this roadmap before K3Surfaces, both outside this package

Old → new in this package: "K3Surfaces … is a later consumer of Layer 6" (Scope, Downstream consumers, plan consumer) → K3Surfaces §2.1 plans the K3 equation `(ω + i∂∂̄φ)² = c·V` itself. That equation is the case `n = 2`, `F = log(V/ω²)` of §6.6, which differs in holding in every dimension, as Layer 8 needs.

Why no edit here settles it: K3Surfaces (`TauCetiRoadmap/K3Surfaces/README.md` line 534 at the head of #1285) says it owns the nonlinear estimates and existence. Moving them to an import of §6.6 is an edit to that roadmap. Which roadmap comes first is a merge-order decision. Specialization verified: `b = log(∫ω²/∫e^Fω²) = log(∫ω²/∫V) = log c`, so `e^{F+b}ω² = cV`, and the two normalizations differ by a constant, which leaves `i∂∂̄φ` unchanged.

## R04 (P1) — applied

Old → new (§6.5): "`‖φ‖_{C^{2,α}} ≤ C`; `‖φ‖_{C^{k+2,α}} ≤ C_k(X, ω, ‖F‖_{C^{k+1,α}})`" → both bounds now **assume `sup_X φ = 0`**, with dependence on `‖F‖_{C³}` and on `‖F‖_{C^{m,α}}`, `m = max(3, k+1)`. A mean-zero solution differs by `sup φ ∈ [0, osc φ]`. Smoothness needs no normalization.

Also: Layer 6's standing paragraph now says the equation is invariant under `φ ↦ φ + M`. The Check "F = 0 gives φ = 0" now carries `sup φ = 0`, and the torus negative control `φ = M`, `‖φ‖_{C^{k,α}} ≥ |M|`, is added. The §6.6 route says that the path is mean-zero normalized, that §6.5 transfers its bounds, and that `‖tF‖ ≤ ‖F‖`. twwy2015 line 134–136 is cited for the three-derivative dependence. Plan 6.5 statement, hypotheses and tests are updated. Other places checked: §§6.2–6.4 bound `osc φ`, `tr h` and `S`, which are invariant under constant shifts, and §6.6 already had `sup φ = 0`.

## R05 (P1) — applied

Old → new (§7.1, local estimate): "`Δ_t v_ξ = 4·H_{i∂∂̄u}(ξ, ξ)`" → "`Δ_t v_ξ(t) = 2·H_{i∂∂̄u}(ξ, ξ)`" for `ξ` read as a real tangent vector, by §3.1's formula `H(v, v) = (1/2)(D²u(v, v) + D²u(Jv, Jv))`. Equivalently `Δ_t v_ξ = 4Σu_{jk̄}ξ_jξ̄_k`. Added the Check `u = |z|² − 4`: `4 = 2·2 = 4·1`.

Also: the slice's subharmonicity is now tied to the pinned sub-mean-value inequality (`TauCeti.le_setAverage_ball_of_laplacian_nonneg`) and to demailly2012 line 1534. Plan 7.1.2 statement and tests are updated. Pattern search: every other use of `H_{i∂∂̄u}` or `i∂∂̄|z|²` (the Conventions, §§3.1, 5.4, 7.2) uses the Conventions' normalization and is unchanged.

## R06 (P2) — applied

Old → new: §2.1's recurrence, derivative and Euler identities now assume `1 ≤ k ≤ n`, the sum and shift identities `0 ≤ k ≤ n`, and `σ_0 = 1` with derivative `0` is separate. §2.2's degree-dependent conclusions assume `m ≥ 1`, with the linear endpoint `D_a p = p(a)` spelled out.

Details: the nesting statement now separates `k = 1` from `2 ≤ k ≤ n`. The degree-dependent conclusions are `p > 0` on the cone, concavity of `p^{1/m}`, `D_b p > 0`, the derivative rule and the half-space bound.

The nesting statement now reads `Γ_n ⊆ Γ_k ⊆ Γ_1` (`1 ≤ k ≤ n`) plus `Γ_k ⊆ Γ_{k−1}` (`2 ≤ k ≤ n`). The `⊆` proof of `Γ(σ_k, e) = Γ_k` is an induction with base `σ_1(λ + te) = σ_1(λ) + nt`. New Checks: the index range (`1 = 1·1 + 0`, `1 = 1`; at `k = 0`, `1 = 2` and `0 = 1`), degree zero, and no `Γ_0`. Plan 2.1, 2.2.1, 2.2.2 (`hessianCone_antitone`, `sigma_pos_of_mem_hessianCone`) and 2.2.3 are updated.

## R07 (P2) — applied

Old → new (§2.3): "for `g` concave and positively homogeneous of degree one … `g(μ) ≤ Σ μ_i ∂_i g(λ)`" → the inequality now holds at points `λ` where `g` is differentiable, with the route (supporting hyperplane plus Euler) and the `min(x, y)` negative control (`1 ≤ 0` at `e`; `1 ≤ 2` at `λ = (1, 2)`).

The `σ_k` form is noted as smooth on `Γ_k` and is extended by continuity to `μ ∈ Γ̄_k`, which §3.2's Gårding mixed inequality (`λ[α] ∈ Γ̄_k`) consumes. Other uses checked: §2.4's gpt2023 Lemma 4 applies it to a `C¹` admissible pair, and §3.2 to `(σ_k∘λ)^{1/k}`, smooth on `Sym_{Γ_k}`. Plan 2.3 is updated.

## R08 (P2) — applied

Old → new (§6.1): the two named formulas become stated identities in the Conventions' normalization, with notation for `Rm`, `Ric`, `s_ω`, `B_ω` and `Λ(ω) = max(0, −inf B_ω)`. The items are `∇̄'T = Rm(ω) − Rm(ω_φ)`, the trace identity, its logarithmic form with `Y ≥ 0` (the Yau–Aubin term) and Calabi's identity with explicit `Θ` and `Q`.

The trace identity is `Δ_{ω_φ} tr h = −s_ω + Δ_ω F + K + G`, with `K ≥ −Λ tr h tr h⁻¹`. Calabi's identity is `Δ_{ω_φ} S = |∇'T|² + |∇̄'T|² + 2Re⟨Θ, T⟩ − ⟨T, Q(T)⟩`. A homogeneity paragraph explains why pss2012's `(i/2)`-normalized identities transfer verbatim, with its density read as `e^F`. New Checks: ℂP¹ (`B ≡ 2`, `s = 2`, `Λ = 0`, halved for `2ω`); a curve with `Ric = −ω` (`Λ = 1`, `K = −1`); `ω_φ = sω` (`0 = −s_ω + s_ω`); and the reviewer's torus witness, extended to `x = 1/4`, where `G = 2π²a²` balances `Δ_ω F = −2π²a²`. §§6.3–6.4 now cite the logarithmic inequality and `G ≥ C_3 S`. Plan 6.1 gains statement, API and tests, and 6.3–6.4 are updated.

## R09 (P3) — applied

Old → new (§7.1 Checks): point mass "for every `r < R' < R`" → `R/2 < r < R' < R` (example `r = 3R/4`, `R' = 7R/8`, `α_1 ≈ 0.096`). The centre check is recentred on `D(R/4, R/2)` with radii `5R/16 < 3R/8`, so `α_1 = log(4/3)/(c log 4)`. The singular `C²` controls become `c·log((|z|²+ε)/(4+ε))` and `−(|x|²+ε)^{−1/2}`.

For the smooth subharmonic control, the real Laplacian is `(|x|²+4ε)(|x|²+ε)^{−5/2}`, the radial complex Hessian is `(1/4)(2ε − |x|²)(|x|²+ε)^{−5/2}`, and the exponential integrals diverge as `ε ↓ 0`. Plan 7.1.1 and 7.1.2 tests are updated.

## R10 (P3) — applied

Old → new (§2.2): the API gains two hyperbolic-polynomial bullets, the roots characterization of the cone and invariance under positive rescaling. Four Checks are added: `xy` along `(1, 1)` (roots `−2, 1`, cone `Γ_2`); `x² + y²` (roots `±i`); `x + y` (cone `Γ_1`, derivative `2` with cone `ℝ²`); and degree zero.

The `Γ_k` Checks stay, and the plan 2.2.1 tests match.

## R11 (P3) — applied

Old → new (`sources.toml` `cited_for`): `gpt2023` `1.6` → `1.5`; `spruck2005` `1.3, 1.5` → `1.2, 1.3, 1.4` (the README's §1.3 cites spruck2005 Theorem 1.4(i)); `lewis1996` `1.2, 1.3, 1.4.1, 1.4.2` → `1.2, 1.3.1, 1.3.2`. Keys, fetch metadata and access status are unchanged.

Retest: every numeric `cited_for` value was checked against the README's `###` sections and the plan's target ids, which the source is cited in. `gpt2023` gains its present citations (Conventions, 1.1, 2.3, 2.4.1–2.4.3, 3.1.2, 3.2, 3.3.2, 7.1.2, 7.2). `twwy2015` gains 5.1 and 6.5. `tian1987` loses the stale `7.1`, since it is cited only for the global estimate of 7.2. In `gilbarg-trudinger2001`, the locator becomes "Theorems 3.5, 6.2, 8.18, 9.1, Lemma 17.16" and the contract text uses the PDE §-ids.

## R12 (P3) — applied

Old → new: Mathlib `f6090c7` → `1b1ccf4b088b32fa3f23f2de1127433254a81e1e` and Tau Ceti `358314d` → `2fd255d997f47c0b5d834ee416c7015d55444ce5` (README and plan `baseline`). The three OperatorTheory contracts are replaced by Tau Ceti declarations at those pins. `TauCeti.SmoothTwoForm` is described as the `SmoothForm I M ℝ 2` abbreviation. The OperatorTheory roadmaps are removed from the plan's suppliers.

Declarations, verified at the Tau Ceti pin:
- `LinearMap.IsSymmetric.eigenvalues_eq_iSup_iInf_re_inner` (`TauCeti/Analysis/InnerProductSpace/CourantFischer.lean` line 251)
- `LinearMap.IsSymmetric.eigenvalue_mono` (line 363)
- `LinearMap.IsSymmetric.abs_eigenvalue_sub_eigenvalue_le` (line 440) and `LinearMap.IsSymmetric.abs_eigenvalues_sub_le_opNorm` (line 479)
- `LinearMap.IsSymmetric.re_trace_comp_le_sum_eigenvalues_mul_eigenvalues` (`HoffmanWielandt/Basic.lean` line 78)
- `LinearMap.IsSymmetric.sum_re_inner_apply_self_le_sum_eigenvalues` (`KyFan.lean` line 489)

Scope records that these implement OperatorTheory PD-A51–A53, PA-B32 and MAJ-A27. Same pattern: the "PDE Lane C item 12" mean value inequality is in fact pinned, as `TauCeti.le_setAverage_ball_of_laplacian_nonneg` (`Harmonic/MeanValue/Basic.lean` line 464). PDE §3.1 (C12) on main plans only the harmonic mean-value property, so this citation was also inaccurate. It is replaced in §5.4, §7.1 and the Layer 5 and 7 Dependencies, and in plan 5.4.1 and 7.1.2. Plan 7.1.1 drops it, because its circle-mean step follows from the Green–Riesz representation it already cites. Every `PD-A5x`, `PA-B32` and `MAJ-A27` citation in Layers 1, 3 and 4 and in the plan's statements, tests and prerequisites was remapped (§§1.1–1.4, Layer 1 Dependencies, §3.1, §4.1, plan 1.1, 1.2, 1.3.1, 1.3.2, 1.4, 4.1).

## Checks run

**Dependency check** (exit code 0):

```
candidate: ComplexHessianEquations is not in the merge order yet; checked as if placed after ComplexComparisonPartII (the intake inserts it when its design is accepted)
depcheck: 236 roadmaps, 2138 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line. The candidate placement is now after ComplexComparisonPartII (`merge-order/ORDER.txt` line 40), which is before K3Surfaces (line 136). The order the R03 hand-off needs is therefore available.

**Citation resolution**: `roadmaps resolve` on the edited README reports no cross-roadmap citation and no Lean name found nowhere. It did not check library names, so every backticked Mathlib and Tau Ceti name in the README was grepped at the pins, and all exist. The new names were also read in their files, including hypotheses and namespaces: `LinearMap.IsSymmetric` in CourantFischer, KyFan and HoffmanWielandt, `TauCeti` in MeanValue/Basic, and `TauCeti.PDE` in Regularity/Harnack.

**PDE citations against open work**: the head of the open PDE revision (#1614) still shows the older lane layout. `roadmaps overlaps` lists no PDE id dropped by an open pull request, and the §-ids cited here are main's. The cited content was read on main: §3.2 line 1344, §5.4 line 1965, §5.6 line 2097.

**Suggested.lean and elaboration**: there is no `Suggested.lean` at the design stage, no Lean command was run, and no `#check` comparison applies.

**Gate failures listed in the brief**: none were listed.

**Sources**: no new source was fetched and no `needs-references.toml` was written. The new locators are in texts already in the cache (twwy2015 line 134–136, demailly2012 line 1534, pss2012 line 997–1002) or are GT theorem numbers already cited on main by PDE (Theorem 6.2).

## Adversarial pass on new and changed statements

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| Tau Ceti eigenvalue contracts (§1.1–1.4) | `diag(3,0) ≤ diag(3,1)`; `S = 0`, `T = [[0,ε],[ε,0]]`; `T = diag(3,1,1)`, `w = e₂`; `F = diag(2,1)`, `B = diag(0,3)` | Loewner hypothesis `3a² ≤ 3a² + b²` gives `(3,0) ≤ (3,1)`; Weyl `ε ≤ ε`; Ky Fan `1 ≤ 3`; von Neumann `3 ≤ 6` and at `−B` `−3 ≤ −3` | Signatures fit their uses | Contracts swapped (R12) |
| Sub-mean-value contract | `f = |x|²`, `f = −|x|²` on a ball of radius `R` in `ℝ^m` | `0 ≤ mR²/(m+2)`; the second has `Δf < 0` and is excluded | Correct hypotheses | Replaces PDE C12 |
| PDE E25 contract | `−u'' = |x|^α` on `(−2,2)`; `u = x₁²`, `a = I`; E22's `a = 1 + |x|^α` | `[u'']_α = 1`; `0 ≤ C(4r^{−α} + 2r^{−α})`; `u''` unbounded under E22 | E25 supplies `C^{2,α}`, E22 does not | R01 |
| ABP adapter | `u = −2 + (1 − |x|²)`, `a = I`, unit ball; `u` harmonic | `Lu = −2m`, `sup_∂ u = −2`, shift gives `−2 + …`, main's form `0 + …`; harmonic case gives `sup u ≤ sup_∂ u` | Adapter correct and sharper | R02 |
| §2.1 index guards | `n = 1, k = 1, λ = 1`; `k = 0`; `Σσ_{k;i}` at `k = 0, n` | `1 = 1`, `1 = 1`; `1 ≠ 2`, `0 ≠ 1`; `n = n`, `0 = 0` | Guards needed and sufficient | R06 |
| §2.2 hyperbolicity and degree | `p = 1`; `x + y`; `xy` at `(2,−1)`; `x² + y²`; `Γ(σ_1,e)` at `(1,−2)` and `(1,−1/2)` | cone `ℝ^N ∋ −a`, `D_b p = 0`; root `−(x+y)/2`, `D_a p = 2`; roots `−2, 1`; roots `±i`; roots `t = 1/2` (out) and `t = −1/4` (in) | Degree `m ≥ 1` needed | R06, R10 |
| `p > 0` on `Γ(p,a)` | `xy` at `(1,2)` and `(−1,−2)` | `2 > 0` in the cone; `2 > 0` outside it (roots `1, 2`) | Only a one-way statement is claimed | R06 |
| Nesting | `k = 1` with empty conjunction; `k = 2`, `(1, −1/2)` | `Γ_0 = ℝⁿ ⊄ Γ_1` at `−e`; `σ_2 = −1/2`, so in `Γ_1 \ Γ_2` | Adjacent nesting for `2 ≤ k ≤ n` | R06 |
| Tangent inequality | `min` at `e`; `λ = (1,2)` with `μ = (2,1)` and `(1,1)`; `σ_2^{1/2}` at `(1,4), (4,1)`; `μ = (1,0) ∈ Γ̄_2` | zero convention gives `1 ≤ 0`; `1 ≤ 2`; `1 = 1`; `2 ≤ 4.25`; `4 ≥ 0` | Differentiability needed; closure extension true | R07 |
| §6.1 trace identity | torus `q = 1 − a cos 2πx`, `a = 0.3`, at `x = 0, 1/4, 0.1`; `ω_φ = sω` | `8.4597 = 8.4597`; `0 = −1.7765 + 1.7765`; `6.3262 = 5.2560 + 1.0702`; `0 = −s_ω + s_ω` | Holds, factors confirmed | R08 |
| `Λ(ω)` and `K` bound | ℂP¹; `2ω`; curve with `Ric = −ω` | `R/g = 2.0000` (finite differences), `B ≡ 2`, `Λ = 0`; `B ≡ 1`; `K = −1 = −Λ·q·q⁻¹` | Bound sharp in dimension 1 | R08 |
| Logarithmic form, `Y ≥ 0` | `n = 1`; constant `h = diag(λ₁, λ₂)` | `Y = q'²/(2q³) − q'²/(2q³) = 0`; `G = 0`, `Y = 0` | Equality cases consistent | R08 |
| Calabi identity | torus at `x = 0`; pss2012 coefficients | `Δ_{ω_φ}S = 292.09` (finite differences) against `8π⁴a²/(1−a)⁴ = 292.11`, each gradient term `146.05`; `S_PSS/S = 0.5` | Holds, homogeneity confirmed | R08 |
| §6.5 normalization | torus `F = 0`, `φ = M`; mean-zero `ε cos 2πx₁`; `k = 0` and `k = 5` | `‖φ‖ ≥ |M|`; `sup φ = ε ∈ [0, 2ε]`; `m = 3` and `m = 6` | Normalization necessary, transfer correct | R04 |
| Slice Laplacian | `u = |z|² − 4`, `ξ = 1` | `Δ_t = 4 = 2·H = 4u_{11̄}`; old formula `8` | Corrected factor | R05 |
| Point-mass Check | `R = 1, r = 3/4, R' = 7/8, w₀ = 1/2`; review's `R' = 1/16` | `M = 2π`, `α_1 = 0.0963 < 2`; `M = 0`, now excluded by `R/2 < r` | Consistent with 7.1.1 | R09 |
| Centre Check | `R = 1`, disc `D(1/4, 1/2)` | radii `5/16 < 3/8 < 1/2`, pole at distance `1/4 < 5/16`, `α_1 c = 0.2075 < 2` | Consistent | R09 |
| `u_ε` controls | `ε = 0.01`, `r = 0.05, 0.2, 0.5` | Laplacian `2432.84 / 143.108 / 8.413` matches the formula; radial Hessian `+250.44 / −8.944 / −1.668` matches, sign change at `|x|² = 2ε` | Subharmonic, not psh, `C^∞` | R09 |
| K3 specialization | `n = 2`, `F = log(V/ω²)` | `e^b = ∫ω²/∫V = c`, `e^{F+b}ω² = cV` | Exact | R03 text |

## Ownership and overlaps

- No construction was added that another roadmap could own. The §6.1 identities and the §2.2 API refine targets this roadmap already owns. A `roadmaps grep` for the Calabi identity, Aubin–Yau and bisectional curvature found no other owner, and a grep for "continuity method/path" found only K3Surfaces (R03). The Tau Ceti and PDE inputs are now cited at their owners.
- ShimuraVarieties, at the head of its open revision #933, §7.0g, plans a negative Kähler–Einstein metric by the complex Monge–Ampère argument. This roadmap only names the Kähler–Einstein equation as a Part II direction and owns nothing of it, so there is no duplication. A future Part II should cite that target.
- The open pull requests given with files were searched through the roadmap tools. `scratch/overlaps.md` lists no other pull request that changes this roadmap and no dropped id.

## For the maintainer

- **K3Surfaces (R03).** Settling the shared ownership needs K3Surfaces §2.1 (open pull request #1285) to import §6.6 for existence and the nonlinear estimates, keeping its K3-specific consequences. The candidate placement printed above (after ComplexComparisonPartII, before K3Surfaces) allows that order. This is for a human to arrange; this package now records the overlap without claiming the hand-off.
- **Names other roadmaps might cite that changed:** the gap slug `abp-maximum-principle` is deleted, the PDE citation forms changed from "Lane C/E item n" to "§x.y (label)", and the plan's suppliers no longer list OperatorTheory/PolarDecomposition, PrincipalAngles or Majorization. No section or target id of this roadmap was renumbered.
- **Possible simplification, not applied (outside the findings):** the remaining gap `weak-harnack-supersolutions` (the inhomogeneous form) might be avoidable in §5.4. On a chart ball, `−φ − B|x − x₀|² + 16Br²` is a nonnegative supersolution of the homogeneous divergence-form equation for large `B` and small `r`, so the pinned homogeneous `TauCeti.PDE.exists_ae_setAverage_rpow_rpow_inv_le_mul_value` (`Analysis/PDE/Regularity/Harnack.lean`) would suffice. A future round may adopt this after checking it.
- No suspicious instructions were found in the review, the sources or the sibling roadmaps read.
