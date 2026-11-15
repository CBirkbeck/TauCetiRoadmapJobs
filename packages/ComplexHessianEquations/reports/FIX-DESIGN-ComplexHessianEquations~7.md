# FIX-DESIGN-ComplexHessianEquations~7

Repair of the seven findings of `REV-DESIGN-ComplexHessianEquations~6` (one P2, six P3). All seven were checked against the sources, the sibling roadmaps and the pins, and all seven hold. Files changed: `packages/ComplexHessianEquations/design/README.md` and `packages/ComplexHessianEquations/design/plan.json`; `sources.toml` is unchanged (no new work is cited).

## F01 (P2) — applied

Evidence: RiemannianGeometry R5c item 4 on main (README line 3893–3903; headline `exists_pos_laplaceBeltrami_eigenvalue_isLeast`, Suggested.lean line 534) owns the smooth Poincaré inequality; pss2012 line 299–303 uses it only for smooth `φ`.

Change: §5.3's `H¹` proof from K5a → R5c applied to `u − ū`, consumed; `Δ⁺ = −2Δ_ω` factor Check added; Scope, leaves-list, new RiemannianGeometry contract, §6.2 Needs, Layers 5–6 Dependencies name R5c; K5a contract drops spectral decomposition; plan 5.3/6.2 prerequisites and `suppliers` updated.

## F02 (P3) — applied

Evidence: §6.2 is stated for `n ≥ 2`; Layer 6 and §6.6 cover `n ≥ 1`.

Change: §6.3 "Combined with §6.2" → "§6.2 for `n ≥ 2`", plus `n = 1`: `ω_φ = e^F ω`. §6.5 "bounded by §6.2" → "for `n ≥ 2`", plus `n = 1` via §5.2 on `Δ_ω φ = e^F − 1`; transfer clause and §6.2 Check follow; torus Check `osc φ = a/π²`; plan 6.3, 6.5.

## F03 (P3) — applied

Evidence: gpt2023 line 809–811 assumes `χ ≤ ω_X`; its line 280–281 uses `χ ≤ (a_0 − 1)ω_X`.

Change: §8.4 "(taking `χ ≤ ω_X`)" → §7.2 with `ω̂ = a_0ω_X`, `χ ≤ (a_0 − 1)ω_X` as in §8.1, so `a_0ω_X + i∂∂̄φ_t ≥ ω_{t,φ_t} > 0`. Negative-control Check `χ = 3ω_X`, `t = 1`, `a_0 = 4` added; plan 8.4 statement and test. No other `χ ≤ ω_X` remains.

## F04 (P3) — applied

Evidence: §3.4 was the only `### k.n` subsection without *Needs:* (script check: none now); no §5.x or plan 5.x target uses Layer 4.

Change: §3.4 gains "*Needs:* §§3.2–3.3; Layer 2 §2.4."; plan 3.4.1 gains `target:3.2`; Layer 5 Dependencies "Layers 3–4" → "Layer 3". Layer 6 keeps "Layers 3–5" (§6.6 uses §4.2).

## F05 (P3) — applied

Evidence: ShimuraVarieties §7.0g at its open head (README line 1993–1995, `TauCeti.Shimura.compact_negative_ke_metric`) owns the Kähler–Einstein metric of an ample canonical bundle; merge-order line 105.

Change: the Part II bullet of Downstream consumers names ShimuraVarieties §7.0g as owner, with the Part II citing it; the Scope sentence on Kähler–Einstein metrics gains the same clause; plan's Part II consumer entry likewise.

## F06 (P3) — applied

Evidence: spruck2005 line 11069–11072: smooth concave `f`, `f_{λ_i} > 0`, open convex symmetric cone with vertex at the origin, real symmetric matrices.

Change: §1.4 locator now states that setting and that the routes need neither the cone, more than `C¹`, `𝕜 = ℝ`, nor positive partials for concavity. Non-cone Check `Γ = {μ_i > −1}`, `f = Σ log(1 + μ_i)`, `𝕜 = ℂ` added; plan 1.4 locator and test.

## F07 (P3) — applied

Change: §8.7 "Lemma 7:", "Lemma 8:", "Theorem 5:" → "The Hölder bound for the energy (gpt2023 Lemma 7):", "The `L^{p'}` bound for `Γ_k`-admissible functions (gpt2023 Lemma 8):", "The Hessian estimate (gpt2023 Theorem 5):"; Checks "Lemma 8" → "the `L^{p'}` bound"; §8.4 "Lemma 6" → "the energy bound of this section". Same pattern in §2.4 (Lemma 4 bullet named); plan 8.7.

## Pattern searches (other places)

- F01, an object owned elsewhere and planned again. `roadmaps grep` was run for Poincaré, Evans–Krylov, Tosatti–Weinkove, Aubin–Yau and Kähler–Ricci flow.
  - VariationalMethods §3.4 (main) is the abstract Hilbert-pair Poincaré connector; its line 82 leaves manifold examples to other roadmaps.
  - SobolevDifferentialForms (open) treats forms; YangMillsConnectionsAndCaloricGauge §1.5 (open) treats balls.
  - Nothing else in this roadmap is owned elsewhere.
- F06, a locator whose setting is narrower than the statement. §1.3 cites lewis1996, which is stated for Hermitian matrices (line 61–81) with the real case at line 144, so it covers `RCLike 𝕜`. §§5.4 and 7.2 already carry their qualifiers.
- F02: no other route uses §6.2 at `n = 1`. The continuity path of §6.6 is for `n ≥ 2`, and §6.4 depends on §6.3.

## Adversarial pass on changed statements

| Statement | Instances tried | Values computed | Result; change |
| --- | --- | --- | --- |
| §5.3 Poincaré, consumed from R5c | circle of length `2π`, `u = sin`; torus `ℂ/(ℤ+iℤ)`, `u = cos 2πx`; wrong model `Δ⁺ = −4Δ_ω`; two components | `π = 1⁻¹·π`; `Δ_ω u = −2π²u`, `λ₁(Δ⁺) = 4π²`, `∫u² = 1/2 = 2π²/4π²`; wrong model gives `1/2 ≤ 1/4`, false; `±1` gives `du = 0`, `u − ū ≠ 0` | Holds; factor Check added |
| §5.3 means | `ω^n = n!·dvol_g` | means differ by the factor `n!/n! = 1` | Holds |
| R5c contract | real dimension `2n ≥ 2`, smooth `g` from smooth `ω`; `f = u − ū` | `∫f = 0`, `∇f = ∇u` | Hypotheses of the headline are met |
| §6.3 at `n = 1` | `ω_φ = e^F ω` | `tr h = e^F ≤ e^{sup F}`; `e^{−‖F‖}ω ≤ ω_φ ≤ e^{‖F‖}ω` | Holds |
| §6.5 at `n = 1` | torus, `e^F = 1 − a cos 2πx` | `Δ_ω φ = −a cos 2πx`, `φ = (a/2π²)(cos 2πx − 1)`, `sup φ = 0`, `osc φ = a/π²`, `ω_φ = (1 − a cos 2πx)ω > 0` | Holds |
| §6.5 transfer | `sup φ = 0` | `mean φ ∈ [−osc φ, 0]` | Holds |
| §8.4 background | `χ = 3ω_X`, `t = 1`, `i∂∂̄φ_t = −2.5ω_X`; `χ = 0` | `4 − 2.5 = 1.5 > 0`, `2 − 2.5 < 0`, `a_0 = 4`: `1.5 > 0`; `χ = 0`: any `a_0 > 1`, `ω_t = tω_X ≤ a_0ω_X` | Holds; Check added |
| §1.4 outside the cone | `Γ = {μ_i > −1}`, `A = diag(−1/2, 1)`, `B = diag(1, −1/2)`; `(−1/2, −1/2)` against `(−2, −2)` | `det(Id + A) = 0.5·2 = 1`, `F = 0` for both; midpoint `det = 1.25² = 1.5625`, `F = 0.446 > 0`; `∇F = (Id + T)⁻¹ > 0`; `(−2, −2) ∉ Γ` | Holds; Check added |
| §1.4 concavity without positive partials | swap `τ` of `i, j`, `μ_i > μ_j` | `0 = f(τμ) − f(μ) ≤ (∂_i f − ∂_j f)(μ_j − μ_i)` gives `∂_i f ≤ ∂_j f`; `f = −σ_1` concave with `∂ = −1` | The route uses concavity only; qualifier is correct |
| §3.4 Needs | `χ = ω_X`, MA | `∫ω_{t,φ}^n = (1 + t)^n V = c_t^n V`, so `c_t^n/V_t = 1/V` | §3.2 is needed; added |

## Checks run

Dependency check, run after the last edit (exit 0):

```text
candidate: ComplexHessianEquations is not in the merge order yet; checked as if placed after ComplexComparisonPartII (the intake inserts it when its design is accepted)
depcheck: 245 roadmaps, 2231 edges, 0 problem(s)
```

The output has no UPWARD, CYCLE or `moved:` line. RiemannianGeometry is on main. ShimuraVarieties (line 105) is named only as the owner of an object outside this roadmap, not as a supplier.

`roadmaps resolve` on the README found no cross-roadmap citation or Lean name that resolves nowhere. Pinned names it could not check were checked at the pins by hand:
- `TauCeti.Manifold.laplaceBeltrami` is at `TauCeti/Geometry/Manifold/Riemannian/Laplacian.lean` line 238, namespace `TauCeti.Manifold`.
- `exists_pos_laplaceBeltrami_eigenvalue_isLeast` is at `TauCetiRoadmap/RiemannianGeometry/Suggested.lean` line 534 on main.

`plan.json` parses, and its formatting is unchanged apart from the edited entries.

Lean: this is the design stage. No `Suggested.lean` exists, no Lean command was run and no `#check` comparison applies.

Ownership against open pull requests was checked with `roadmaps grep` at the heads of the index of 2026-11-15 (see the pattern searches).

## Gate failures

None were listed for this round.

## For the maintainer

- New supplier edge: RiemannianGeometry R5c (on main). This roadmap is new, so no other roadmap cites a changed name, and no section number moved.
- The Part II named in Downstream consumers must cite ShimuraVarieties §7.0g for the Kähler–Einstein metric of an ample canonical bundle.
- The DifferentialGeometry Layer 12 contract names `laplaceBeltrami` and `integral_mul_laplaceBeltrami`, which are implemented at the Tau Ceti pin as `TauCeti.Manifold.*`. The citation resolves and was left as it is.
- No suspicious instructions were found in the review text.
