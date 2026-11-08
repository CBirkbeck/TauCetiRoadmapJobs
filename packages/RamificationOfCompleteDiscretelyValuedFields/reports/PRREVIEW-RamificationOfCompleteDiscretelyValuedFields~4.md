# Review of RamificationOfCompleteDiscretelyValuedFields (pull request #1410 at bf98cae)

**Verdict:** accepted

Incremental re-review of the 77 changed lines since a15b687 (README lines 3–18, 36–48, 304–393; `Suggested.lean` lines 21–26, docstring only). Gate at this head (worker): every check passes, `build=0`. `lake env lean` of `TauCetiRoadmap/RamificationOfCompleteDiscretelyValuedFields/Suggested.lean` from the worktree: two `declaration uses sorry` warnings (lines 50 and 70) and nothing else, exit 0. Dependency check (`gate --depcheck … --movable`): `depcheck: 236 roadmaps, 2069 edges, 0 problem(s)`, no UPWARD or CYCLE line. `git diff --stat origin/main...HEAD` outside the folder: empty. No `design/plan.json`, so no declared gaps. Pins unchanged (Mathlib f6090c70, Tau Ceti 358314d4; main a0ad405e).

## Previous findings

- R01 — repaired: lines 316–323 now read "when the residue extension of `L/K` is separable (a hypothesis the residue extensions of `L/K′` and `K′/K` inherit for every intermediate field `K′`), Herbrand's theorem … under the same separability hypothesis, tower transitivity … for the same tower, `Gal(M/L) ∩ Gal(M/K)^v = …`"; the Scope bullet (lines 41–43) and Summary (lines 8–9) carry the hypothesis; the proof route (lines 346–350) says the generators exist because the residue extensions are separable; and the refuting tower is the new Check at lines 374–393. Every value in that Check recomputes (table). The jump-correspondence bullet (line 315) is correctly left without the hypothesis: it is a property of the order automorphism `ψ` alone. No new problem introduced: every consumer of the three theorems (§3a.3 line 520 under separable residue; §4a.1 line 583, §4a.2 line 623 and §4a.3 line 681 under the perfect `k` of line 563–564; the local-field agreement bullet at line 324 with finite residue fields) satisfies the hypothesis, and the supplier-contract passage "The perfect-residue Herbrand package" (lines 193–206) exports quotients and towers only over a perfect residue field.

## Verified sound

**Adversarial pass.** Rows for the changed statements carry computed values; rows for untouched statements carry forward the previous report (r3 at a15b687), which computed them.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Herbrand's theorem with separable residue (line 316–319) | `K = F_2(s)((t))`, `M = K(y, w)`, `y² − y = s t⁻²`, `w² − w = t⁻¹`, `H = Gal(M/K(y))` (the Check) | residue extension `F_2(s^(1/2))/F_2(s)` inseparable, so the hypothesis excludes it; there `G^(1/2)H/H = G/H ≅ C_2` and `(G/H)^(1/2) = (G/H)_1 = 1` | hypothesis separates exactly the refuting instance | none |
| same | `M = ℚ_2(ζ_8)`, `H = Gal(M/ℚ_2(√2)) = {1, 7}`, `v = 1` | `G^1 = G_1 = G`, image `G/H ≅ C_2`; `(G/H)^1 = (G/H)_(ψ(1)) = (G/H)_1`, `ψ_(L/K)(1) = 1`, `(G/H)_1 = Gal(L/K)` since `σ(√2) − √2 = −2√2` has `v_L = 3` | agrees | none |
| same, degenerate `H` | `H = G`; `H = 1` | `(G/G)^v = 1 = G^v G/G`; `(G/1)^v = G^v` | agrees | none |
| residue hypothesis inherited by `L/K′`, `K′/K` (line 316–317) | `k ⊆ k_(K′) ⊆ k_L` with `k_L/k` separable | subextension and top of a separable extension are separable | correct | none |
| tower transitivity with separable residue (line 320–322) | the Check tower `M ⊃ L₁ = K(y) ⊃ K` at `u = 1` | `φ_(M/K)(1) = 1`, `φ_(L₁/K)(φ_(M/L₁)(1)) = φ_(L₁/K)(1) = 1/2` | excluded by the hypothesis | none |
| same | `ℚ_2(ζ_8) ⊃ ℚ_2(√2) ⊃ ℚ_2` (Check line 371) | `ψ_(L/K)(3) = 4`, `ψ_(M/L)(4) = 1 + 3·2 = 7 = ψ_(M/K)(3)`; wrong order `ψ_(L/K)(5) = 8` | agrees | none |
| intersection formula (line 323) | the Check tower at `v = 1` | `H ∩ G^1 = H ∩ G_1 = H`; `ψ_(L₁/K)(1) = 2`, `ψ_(M/L₁)(2) = 3`, `H^2 = H_3 = 1` | excluded by the hypothesis | none |
| same | `ℚ_2(ζ_8)` tower, `v = 3` | `H ∩ G^3 = H ∩ G_4 = 1`; `H^(ψ_(L/K)(3)) = H^4 = H_(ψ_(M/L)(4)) = H_7 = 1` | agrees | none |
| Check line 374–378: `G = C_2 × C_2` | the three nonzero classes | `t⁻¹`: `v(a² − a) ∈ 2ℤ_(<0) ∪ ℤ_(≥0)`, never `−1`; `s t⁻²` and `t⁻¹ + s t⁻²`: `v(a) = −1`, `a_(−1)² = s ∉ F_2(s)²` | correct | none |
| Check: `π₀ = 1/w` Eisenstein | divide `w² − w = t⁻¹` by `w²` | `1 − π₀ = t⁻¹π₀²`, so `π₀² + tπ₀ − t = 0`; coefficients `t, −t ∈ 𝔪`, constant `∉ 𝔪²` | correct | none |
| Check: `z = ty`, integer ring `A[π₀, z]`, residue `F_2(s^(1/2))`, `e = 2`, `v_M(t) = 2` | `O_(L₂) = A[π₀]`, `O_(L₂)[z]/(π₀) = F_2(s)[Z]/(Z² − s)` | `z² = t²(y + s t⁻²) = tz + s`; the quotient is a field of degree `2 = [M : L₂]`, so `O_(L₂)[z]` is a DVR with uniformizer `π₀`, `f(M/L₂) = 2`, `e(M/L₂) = 1`; `e(M/K) = 2·1`, `v_M(t) = 2` | correct | none |
| Check: not monogenic over `A` | `O_M/(t)` with basis `1, π₀, z, π₀z` | `π₀² ≡ 0`, `z² ≡ s`: `(a + bπ₀ + cz + dπ₀z)² = a² + c²s ∈ F_2(s)`; a one-generator `k`-algebra `k[x̄]` with `x̄² ∈ k` has dimension `≤ 2 < 4` | correct | none |
| Check: lower indices | `σ: y ↦ y + 1`; `τ: w ↦ w + 1`; `στ` | `lowerIndex` is `⨅_x addVal(σx − x)` (`RamificationGroup.lean:347`), attained on `A`-algebra generators: `σπ₀ = π₀`, `σz − z = t` (`v = 2`); `τz = z`, `τπ₀ − π₀ = π₀/(1+π₀) − π₀ = −π₀²/(1+π₀)` (`v = 2`); `στ`: both displacements `v = 2` | all three `= 2`; `G_0 = G_1 = G`, `G_2 = 1` | none |
| Check: `G^v = G` for `v ≤ 1` | `ramificationGroupReal u = G_⌈u⌉` (`:680`) | `G_u = G` for `u ≤ 1`, `φ(u) = u` on `[−1, 1]`, `ψ(v) = v`, `G^v = G_v = G` | correct | none |
| Check: quotient `Gal(L₁/K)` | `B₁ = A[z]`, `σ̄z = z + t` | `B₁/(t) = F_2(s)[Z]/(Z² − s)` a field, `e(L₁/K) = 1`, `v_(L₁)(t) = 1`, `i(σ̄) = 1`; `(G/H)_1 = 1`; integrand `1/2` on `(0, ∞)`, `φ_(L₁/K)(u) = u/2`; `(G/H)^(1/2) = (G/H)_1 = 1` vs `G^(1/2)H/H = G/H` | correct | none |
| Check: `M/L₁` | `X² + tX − t` over `O_(L₁)`, `t` a uniformizer of `L₁` | totally ramified, `O_M = O_(L₁)[π₀]`, `i_H(τ) = v_M(τπ₀ − π₀) = 2`: `H_0 = H_1 = H`, `H_2 = 1`; `φ_(M/L₁)(1) = 1`, `φ_(M/L₁)(3) = 2`, so `ψ_(M/L₁)(2) = 3` | correct | none |
| Check: class formula | class of `σ̄` is `{σ, στ}`, `e(M/L₁) = 2` | `(2 + 2)/2 = 2 ≠ 1 = i(σ̄)` | correct | none |
| Check: subgroup formula still holds | `H_i = H ∩ G_i` | `H_1 = H ∩ G = H`, `H_2 = H ∩ 1 = 1` | correct | none |
| Check agrees with the §3a.1 Check at line 290 | `p = 2` | `y^p − y = s t^(−p)`, `z^p − t^(p−1)z = s` become `y² − y = s t⁻²`, `z² − tz = s`; same `B = A[z]`, `σ(z) = z + t`, `#G_0 ≠ e` | the roadmap agrees with itself | none |
| `ψ` carries upper jumps to lower jumps (line 315, no hypothesis) | any finite action | `G^v = G_(ψ(v))` with `ψ` an order automorphism of `[−1, ∞)`: `v` is a jump of `G^•` iff `ψ(v)` is one of `G_•` | holds without separability | none |
| Hilbert's formula (`Suggested.lean` 50) | `ℚ_2(ζ_8)/ℚ_2`; trivial `G`; Artin–Schreier; tame `K(ζ_p)/K`; non-complete `A` | unchanged since the previous report (its rows 1–5) | agrees | none |
| `IsInvariant ⇒ FaithfulSMul A B`, `IsLocalHom`, `Module.Finite`; junk values; separable residue needed for Hilbert | as in the previous report (rows 6–8) | unchanged statement | sound | none |
| Hasse–Arf lower form (`Suggested.lean` 70) | `ℚ_2(ζ_8)`, `ℚ_3(ζ_9)`, `j = 0`, quaternion `Q_8`, upper-jump equivalence | unchanged since the previous report (rows 9–13) | agrees | none |
| completion reduction; `φ` on `[−1, 0]`, `ψ(n) ∈ ℕ` | as in the previous report (rows 14–15) | unchanged | sound | none |
| §3a.3 route via `K_0 = L^(G_0)`; residue enlargement (EGA 0.(10.3.1)); graded norms (serre1961 (20), (23), Prop 8) | as in the previous report (rows 19–21) | unchanged | sound | none |
| §4a.1 Check 574 area; `G_K^(0+) = P_K`; `K^ur` as the `e = 1` compositum; §4a.2 integral formula; §4a.3 Checks; Krasner step; `Breve E` agreement and its proof | as in the previous report (rows 22–29) | unchanged (line numbers shifted by `+20` after line 373) | sound | none |

**Signatures and padding.** `git diff a15b687 HEAD -- Suggested.lean` touches only the module docstring (lines 21–26): both theorem statements are byte-identical to the previous head, and the worker's `signatures.md` shows the same two elaborated types as the previous report (DVRs `A`, `B`, `Algebra.IsInvariant A B G`, `FaithfulSMul G B`, separable residue, no completeness; `IsMulCommutative G` for Hasse–Arf; no binder lost). The previous report's one-tactic probe (both fail) therefore stands; neither is padding. The docstring now says the quotient and tower theorems are for separable residue extension, matching README lines 316–322.

**Headlines.** Unchanged: Hilbert's formula and the lower-numbering Hasse–Arf stated; the Herbrand functions with quotient and tower theorems (now for separable residue extension), the residue-enlargement, proalgebraic-unit and graded-norm targets, the absolute upper filtration, `ψ_(L/K)` and the completed unramified comparison named in the docstring as not statable at the pins (no Herbrand function on `TauCeti.IsLocalRing.ramificationGroup`; Tau Ceti's `herbrandOrderIso` … `upperRamificationGroup` assume `IsNonarchimedeanLocalField`, `TauCeti/NumberTheory/LocalField/Herbrand/Basic.lean` variable block at line 100).

**Library declarations opened at the pins** (Tau Ceti 358314d4): `TauCeti.IsLocalRing.ramificationGroup` (`TauCeti/RingTheory/LocalRing/RamificationGroup.lean:114`, `Ideal.inertia` of `𝔪^(i+1).toNat`), `lowerIndex` (:347, infimum over all of `S`), `ramificationGroupReal` (:680, `G_⌈u⌉`), `sum_min_lowerIndex_natCast` (:516), `subgroupOf_ramificationGroup` (:557); the rest as in the previous report.

**Cross-roadmap citations resolved** (main a0ad405e): unchanged since the previous report; the diff adds no citation. The worker's `roadmaps resolve` lists nothing found nowhere. Ownership against open heads: the diff adds no construction; the previous report's search (no second builder of Hasse–Arf, the absolute upper filtration, proalgebraic unit groups or the completed unramified comparison among the open heads and main) stands.

**Sampled targets.** "The perfect-residue Herbrand package" (lines 193–206) exports §3a.2's quotients and towers for perfect residue fields only, consistent with the new hypothesis. "Residue enlargement and preservation of ramification" (line 419), "Proalgebraic units and norm-kernel components" (line 440), "Graded norms and filtered norm-kernel components" (line 474) and "Agreement with `Breve E` on a local field" (line 694) are untouched by the diff; their locators (EGA III 0.(10.3.1) printed p. 20 and the completion remark p. 23; serre1961 n° 3.4–3.5 printed pp. 132–136 and §§1–2 pp. 106–120; Brinon–Conrad Exercise 1.4.4 p. 10 and Lemma 13.1.6 p. 201; ReductiveGroupsPartII §RG2.0.4) were read at the previous round and nothing cited by them changed. The §3a.2 locators (lines 332–336) are unchanged: serre1961 n° 3.1 Propositions 3–4, printed p. 128 (cache lines 856–950), are for a totally ramified extension over an algebraically closed residue field, where the separable-residue hypothesis holds automatically.

## Not verifiable

- Serre, *Local Fields* (GTM 67), IV §3 Proposition 14 (line 332): Springer, paywalled; the manifest records it `uncertified`; no legal copy on the operator's machine. Chapter IV's standing hypothesis there is a separable residue extension, which is exactly the hypothesis the repair adds.

## Source issues

- none
