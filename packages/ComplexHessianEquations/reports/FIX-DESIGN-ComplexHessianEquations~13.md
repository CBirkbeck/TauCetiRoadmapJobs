# Repair report: ComplexHessianEquations design, round 13

One review, two findings (both P3). Both were checked against pss2012, the roadmap's own §§5.2, 5.4 and 6.2, and the supplier contracts, and both were applied. Files changed:

- `packages/ComplexHessianEquations/design/README.md`: §§5.2, 6.2 and 6.5.
- `packages/ComplexHessianEquations/design/plan.json`: target 5.2 (statement, hypothesis, one new test) and target 6.2 (one new prerequisite).

`packages/ComplexHessianEquations/sources.toml` is unchanged: it already records the one citation the new text uses (pss2012, read at line 299–303), and no source was fetched.

## F01 (P3) — applied

**Verified.** pss2012 line 299–303 gives two ways to start the Moser iteration:
- an `L^p` bound taken from the exponential estimate of its Appendix A;
- iteration on the mean-zero `φ`, with the Poincaré inequality.

The README combined the function `ψ = sup φ − φ + 1` of the first way with the Poincaré inequality of the second, and that does not close. Integrating the identity against `ψ` gives `(1/n)∫|∂ψ|²_ω ω^n ≤ e^{sup F}∫ψ ω^n = e^{sup F}·ψ̄·∫ω^n`. Poincaré then bounds only `‖ψ − ψ̄‖²_{L²}` by a multiple of `ψ̄`, so nothing bounds the mean `ψ̄ = sup φ − φ̄ + 1`.

§5.4's first statement supplies the missing bound. Take `ω̂ = ω` and the function `φ − sup φ`: it is `C²`, has supremum `0`, and satisfies `ω + i∂∂̄(φ − sup φ) = ω_φ > 0`. So `∫(sup φ − φ)ω^n ≤ C(X, ω)`. Target 5.4.1 needs only target 3.1.2 and the pinned `TauCeti.le_setAverage_ball_of_laplacian_nonneg`, not the declared gap. It sits in Layer 5, so the new edge creates no cycle.

**Change.** §6.2 old: "…the Sobolev inequality, and the Poincaré inequality for the starting `L²` bound (pss2012 line 299–303)". New: the iteration on `ψ` starts from `‖ψ‖_{L²}`, which has three inputs:
- the `L¹` bound of §5.4, so `ψ̄ ≤ 1 + C/∫ω^n`;
- the identity integrated against `ψ`;
- Poincaré for `ψ − ψ̄`.

The pss2012 locator now says which two starts the source uses. Also added:
- "§5.4 (first statement)" on the *Needs:* line;
- `target:5.4.1` to plan 6.2;
- to the torus Check, the computed value `∫(sup φ − φ)ω² = 2ε`, `ψ̄ = 1 + ε`.

**Pattern.** Every other mention of Poincaré is still correct, because each applies it only to smooth functions:
- Scope, line 15;
- §5.3 ("used only for smooth functions (pss2012 line 299–303)");
- the RiemannianGeometry contract;
- the plan's RiemannianGeometry supplier row ("5.3, 6.2").

No other Moser iteration appears in the roadmap.

## F02 (P3) — applied

**Verified, with the review's witness recomputed in this round.** Torus `ℂ/(ℤ + iℤ)`, `L = εΔ_ω`, `u_j = j^{−2−α}cos 2πjx`, using `Δ_ω = (1/2)(∂_x² + ∂_y²)` (§3.1):
- `∂_x²u_j = −4π²j^{−α}cos 2πjx`. Its Hölder quotient between `0` and `1/(2j)` is `8π²·2^α`.
- `Δ_ω u_j = −2π²j^{−α}cos 2πjx`, and `[cos 2πj·]_α ≤ 2(πj)^α` (from `|cos a − cos b| ≤ min(2, |a − b|)`). So `‖Lu_j‖_{C^{0,α}} ≤ 2π²(1 + 2π^α)ε`.
- `‖u_j‖_{C⁰} = j^{−2−α} → 0`.

So the constant must be at least `4·2^α/((1 + 2π^α)ε)`: no single `C` serves every uniformly positive `a`.

**Change.** §5.2 old: "…for operators `Lu = Re tr(a·H_{i∂∂̄u})` with `a ∈ C^{k,α}` uniformly positive definite". New: for a Hermitian `ω`, `θ > 0` and `M`, one `C(X, ω, k, α, θ, M)` serves every `u ∈ C^{k+2,α}(X)` and every `a` that is:
- a `C^{k,α}` field of `h`-self-adjoint endomorphisms of `(TX, J)`;
- with `a ≥ θ·Id` and `‖a‖_{C^{k,α}} ≤ M`, in the finite-atlas norms of PseudodifferentialOperators §5.4.

`H_{i∂∂̄u}` is read as its operator, so `a = Id` gives `Δ_ω`.

**Differs from the suggested repair.** The review's text left open which bundle `a` is a section of. "`a ≥ θ·Id`" needs `a` to be an endomorphism field, so the statement now says so. The review's "`a = g⁻¹`" for `Δ_ω` is the same operator in coordinate form; in the endomorphism reading it is `a = Id`.

**Other places updated:**
- The witness is now a §5.2 Check (negative control) and plan test `schauder_constant_depends_on_theta`.
- Plan 5.2's statement and hypothesis now match the README.
- §6.5, the only consumer of the estimate, now says it uses `a = Id`, `θ = 1`, so its constant depends on `X`, `ω` and `α` only. This agrees with its `C(X, ω, α, ‖F‖_{C³})`.

**Pattern.** Every other constant over a class of operators already states what it depends on:
- PDE E25 contract: `m, α, λ, Λ, M`;
- the gap contract: `m, q, λ, Λ`;
- the ABP contract: `C(m)`;
- §5.4: `C(X, ω, A)`, for a fixed operator.

## Adversarial pass on the changed text

| Statement | Instances tried | Values computed on each side | Result; change |
| --- | --- | --- | --- |
| §6.2 identity integrated against `ψ` | Stokes on `ψ·i∂̄φ ∧ Σ`; `j = n − 1` term; sign of `e^F − 1` | `∫ψ i∂∂̄φ∧Σ = −∫i∂ψ∧∂̄φ∧Σ = ∫i∂ψ∧∂̄ψ∧Σ` (`∂̄ψ ∧ ∂̄φ ∧ Σ` has bidegree `(n−1, n+1)`, so it is `0`); `i∂ψ∧∂̄ψ∧ω^{n−1} = (1/n)tr_ω(i∂ψ∧∂̄ψ)ω^n` (§3.1); `ψ ≥ 1`, so `ψ(e^F − 1) ≤ e^{sup F}ψ` | Holds |
| §6.2 `L¹` input from §5.4 | `ψ' = φ − sup φ`, `ω̂ = ω`; torus `ℂ²/ℤ⁴`, `φ = ε cos 2πx_1` | `ω + i∂∂̄ψ' = ω_φ > 0`, `sup ψ' = 0`; `∫(ε − ε cos 2πx_1)·2 dvol = 2ε`, `∫ω² = 2`, `ψ̄ = 1 + ε` | Holds; added to the Check |
| §6.2 starting `L²` bound | `‖ψ‖² = ‖ψ − ψ̄‖² + ψ̄²·vol`, with `|dψ|²_g = 2|∂ψ|²_ω` (§3.1: `u = x` on `ℂ` gives `1` and `1/2`) | `‖ψ − ψ̄‖² ≤ 2λ_1⁻¹‖∂ψ‖² ≤ 2nλ_1⁻¹e^{sup F}(C + ∫ω^n)/n!`; `ψ̄ ≤ 1 + C/∫ω^n`; bound depends on `n`, `sup F`, `ω` | Holds; matches `C(n, sup F, ω)` |
| §6.2 without the `L¹` input (old route) | `ψ̄` free | Poincaré gives `‖ψ − ψ̄‖² ≤ c·ψ̄`, which is compatible with `ψ̄ → ∞` | The review's claim is confirmed |
| §6.2 dependency direction | target 5.4.1's prerequisites | `target:3.1.2`, `tauceti:TauCeti.le_setAverage_ball_of_laplacian_nonneg`; no gap; 5.4.1 is before 6.2 | No cycle, no new gap |
| §5.2 Schauder, witness | `L = εΔ_ω`, `u_j = j^{−2−α}cos 2πjx`, `j → ∞` | `‖u_j‖_{C^{2,α}} ≥ 8π²·2^α`; `‖Lu_j‖_{C^{0,α}} ≤ 2π²(j^{−α} + 2π^α)ε ≤ 2π²(1 + 2π^α)ε`; `C ≥ 4·2^α/((1 + 2π^α)ε)` | Old statement false; repaired, added as a Check |
| §5.2 Schauder, repaired | `a = ε·Id`: `θ = ε`, `M = ε‖Id‖`; real symbol of `a^{jk̄}∂_j∂_k̄` | Lower bound `∝ 1/θ`, allowed; symbol `−a(ζ, ζ)`, `ζ_j = (ξ_{x_j} − iξ_{y_j})/2`, ellipticity `≥ θ|ξ|²/4` times metric factors, which gives E25's `λ, Λ, M` in charts | Holds |
| §5.2 `a` not Hermitian | `Re tr(aA)` for `h`-self-adjoint `A` | `Re tr(aA) = tr(((a + a*)/2)A)`, so only the self-adjoint part acts; with self-adjoint `a`, `tr(aA)` is real | Statement takes `a` self-adjoint; `Re` is harmless |
| §5.2 `a = Id` | trace of the operator of `H_{i∂∂̄u}` | `= Σλ_j[i∂∂̄u] = Δ_ω u` (Conventions) | §6.5 consumer covered, `θ = 1` |
| §5.2 higher `k` | differentiate: `∂(Lu) = L(∂u) + (∂a)·H` | needs `‖a‖_{C^{k,α}} ≤ M`, which is now in the statement | Holds |

## Checks run

Dependency check, run after the final edit (exit 0):

```text
candidate: ComplexHessianEquations is not in the merge order yet; checked as if placed after ComplexComparisonPartII (the intake inserts it when its design is accepted)
depcheck: 246 roadmaps, 2243 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line.

- `roadmaps resolve` on the README: no cross-roadmap citation and no Lean name found nowhere.
- `plan.json` parses. The diff touches only targets 5.2 and 6.2. Target 5.2 now has four tests. Target 6.2's new prerequisite `target:5.4.1` comes earlier in the plan. The gap list is unchanged.
- The README edits have no LaTeX delimiters, no process wording and no new backticked roadmap-owned names.
- No `Suggested.lean` exists at the design stage, so there was no `#check` comparison and no Lean command was run.

## Ownership and suppliers

No new supplier and no new target. The new citations are both internal:
- §6.2 now cites §5.4, this roadmap's own target 5.4.1;
- §5.2 now names PseudodifferentialOperators §5.4, which is already in the supplier contracts ("the Banach spaces `C^{k,α}` of sections of a bundle over a compact base, with finite-atlas norms").

No object changed owner. Ownership against open pull requests needed no new search, because no new object was introduced.

## Notes for the maintainer

- No name that other roadmaps cite changed. Section numbers and plan ids are unchanged.
- The review's "For the human reviewers" section (the licences of demailly2012, lewis1996 and spruck2005; scope) was not acted on.
- No suspicious text was found in the review or in the sources read.
