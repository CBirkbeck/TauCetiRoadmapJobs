# FIX-DESIGN-ComplexHessianEquations~15

Review resolved: `REV-DESIGN-ComplexHessianEquations~14` (two findings, both P3). Files edited: `packages/ComplexHessianEquations/design/README.md` and `packages/ComplexHessianEquations/design/plan.json`. `sources.toml` was not changed.

## F01 (P3) — applied

Verified: `σ_2(λ) = λ_1λ_2` is homogeneous of degree two (`σ_2(2, 8) = 16 = 2²·4`). In general `σ_n` on `ℝⁿ` is homogeneous of degree `n`. The Check's own value `8 = 2·F(T)` is Euler's identity for degree two.

§1.5 Check, old → new: "For the non-homogeneous `f = σ_n` on `ℝ²` … carries the degree." → "For `f = σ_n` on `ℝ²`, which is homogeneous of degree two and not of degree one, at `T = diag(1, 4)`: `∇F(T) = det(T)·T⁻¹ = diag(4, 1)` and `tr(∇F·T) = 8 = 2·F(T)`. The Euler identity carries the degree, so the degree-one hypothesis is used." The matching plan test `euler_degree_two` (target 1.5) now says the same.

Pattern search: "non-homogeneous" and "homogeneous" in the README and `plan.json`. The only other homogeneity claims are §1.4's "`f = σ_n`, which is not concave", §2.3's `min(x, y)` and §2.4's `max_j λ_j`. All three are correct, so nothing else changed.

## F02 (P3) — applied

Verified. In §6.1, `Q(T)(v) = [Ric(ω_φ)^♯, T(v)] − T(Ric(ω_φ)^♯v)` is linear in `T`. Its coefficient `Ric(ω_φ)^♯ = ω_φ⁻¹(Ric(ω) − i∂∂̄F)` is bounded once `C⁻¹ω ≤ ω_φ ≤ Cω`. So `|Q(T)| ≤ C·S^{1/2}`, not `C·S`. pss2012 line 1067–1068 treats `R'` as known and `∇'h h⁻¹` as `O(S^{1/2})`, which gives (7.5) at line 1070.

§6.4 route, old → new: "`Q(T)` of order `S`" → "`Q(T)`, which is linear in `T` with the bounded coefficient `Ric(ω_φ)^♯ = ω_φ⁻¹(Ric(ω) − i∂∂̄F)`, of order `S^{1/2}` (pss2012 line 1067–1070 …), so that `2 Re⟨Θ, T⟩_{ω_φ} ≥ −C(S + 1)` and `|⟨T, Q(T)⟩_{ω_φ}| ≤ CS`".

I also added a Check to §6.4 (plan test `c3_Q_size`) showing that `Q(T)` has size `S^{1/2}`, and widened the plan locator to line 1067–1081. The statement of §6.4 is unchanged.

Pattern search: "of order", "`S^{1/2}`" and "`O(S`" in both files. Line 551 is the only size claim. The §6.1 degree paragraph ("`Θ` and `Q` carry one inverse metric more than `T`") agrees with `Q(T) = Ric(ω_φ)^♯·T`.

## Adversarial pass on the changed text

| Statement | Instances tried | Values computed on each side | Result; change |
| --- | --- | --- | --- |
| §1.5 Check (degree two) | `f = σ_2` at `T = diag(1, 4)`, `λ(T) = (4, 1)`; spectral gradient against `det(T)·T⁻¹`; scaling `r = 2` | `∂_1f = λ_2 = 1` on eigenvector `e_2`, `∂_2f = λ_1 = 4` on `e_1`, so `∇F = diag(4, 1)`; `det(T)·T⁻¹ = 4·diag(1, 1/4) = diag(4, 1)`; `tr(diag(4, 1)·diag(1, 4)) = 8`, `F(T) = 4`, ratio `2`; `σ_2(2, 8) = 16 = 4·4` | Holds; wording fixed |
| §1.5 Euler clause (degree one) | `σ_2^{1/2}` at `diag(1, 4)` | `tr(diag(1, 1/4)·diag(1, 4)) = 2 = F(T)` | Holds; unchanged |
| §6.4 size of `Q(T)` | scaling `T ↦ 2T`; `n = 1` | `Q(2T) = 2Q(T)`, `S(2T) = 4S`; `n = 1`: `Q(T) = −s_{ω_φ}T`, `abs(Q(T))² = s_{ω_φ}²S` | `S^{1/2}` holds; route wording fixed |
| §6.4 size of `Θ` | `∇' = ∇ + T`, applied to `Rm(ω)` and to `Ric(ω_φ)^♯` | `abs(∇'Rm) ≤ abs(∇Rm) + C·abs(T)`, `abs(∇'Ric^♯) ≤ C(‖Rm(ω)‖_{C¹} + ‖F‖_{C³}) + C·abs(T)`: order `1 + S^{1/2}` | Holds |
| §6.4 inequality chain | `abs(Θ)·abs(T)` | `C(1 + S^{1/2})S^{1/2} = C(S^{1/2} + S) ≤ C(1/2 + 3S/2)`; `abs(⟨T, Q(T)⟩) ≤ CS`; so `Δ_{ω_φ}S ≥ −C_1S − C_2` | Holds |
| §6.4 new Check | torus `ℂ/(ℤ + iℤ)`, `g_{1̄1} = 1/2`, `φ = (a/2π²)cos 2πx`, at `x = 1/4` | `q = 1`, `q' = 2πa`, `q'' = 0`; `(log q)'' = 0 − 4π²a²`; `g'^{11̄} = 2/q`, `∂∂̄F = F''/4`, so `s_{ω_φ} = −Δ_{ω_φ}F = −(log q)''/(2q) = 2π²a²`; `S = q'²/(2q³) = 2π²a²`; `⟨T, Q(T)⟩ = −4π⁴a⁴`; matches `Δ_ωF = −2π²a²` from the §6.1 Check at the same point | Holds; Check added |
| §6.4 new Check, wrong model | "order `S`" | would allow `abs(⟨T, Q(T)⟩) ~ S^{3/2}`, which no `−C_1S − C_2` absorbs | Excluded by the Check |

## Checks run

Dependency check on the candidate (exit 0):

```text
candidate: ComplexHessianEquations is not in the merge order yet; checked as if placed after ComplexComparisonPartII (the intake inserts it when its design is accepted)
depcheck: 241 roadmaps, 2249 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line. `plan.json` still parses as JSON.

`Suggested.lean`: this package is at the design stage and has no `Suggested.lean`, so there was no `#check` comparison and no elaboration. No Lean name was added to or removed from the README.

## For the maintainer

- No cross-roadmap citation, supplier or gap changed, and no target was added, renamed or removed. Only one Check, one proof-route sentence, one added Check and two plan tests changed, plus the 6.4 plan locator. Other roadmaps are not affected.
- Ownership: no new construction was introduced, so there was nothing new to check against open pull requests.
- I found no suspicious text in the review or the source lines I read (pss2012 line 1040–1085).
