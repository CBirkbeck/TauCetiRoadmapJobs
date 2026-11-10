# Repair report: SchattenClassesAndSchurMultipliers design, round 3

Review settled: `REV-DESIGN-SchattenClassesAndSchurMultipliers~2` (seven findings: one P2, six P3).
Files edited: `packages/SchattenClassesAndSchurMultipliers/design/README.md` and
`packages/SchattenClassesAndSchurMultipliers/design/plan.json`. `sources.toml` is unchanged: no new
work is cited, and every locator used is already recorded.

## F01 (P2) — applied

Changed: in §1.1 the compression bound now holds for `1 ≤ p < ∞` only (route: `aₙ(X) ≤ liminf aₙ(P_αXP_α)`, then Fatou). At `p = ∞` only `‖X‖ ≤ liminf ‖P_αXP_α‖` holds. Added a negative-control Check. §1.2 "lower semicontinuity of §1.1" → "compression bound of §1.1 (`p < ∞`)". Mirrored in plan.json 1.1 (api, new test) and the 1.2 locator.

Evidence: `‖P_α 1 P_α‖_∞ = 1` for every `α`, while `‖1‖_∞ = ∞`; for non-compact `X` the bound fails at `p = ∞`. Other `liminf` uses were checked: §3.3 (pairing), §9.3/§9.5 (function norms) and §10.3 (`J_kA → A` in `S₂`, hence in operator norm) never use the extended-gauge bound at `p = ∞`.

## F02 (P3) — applied

Changed: the first Check of §10.1 (Rademacher example) → `f = Σ_k 1_{I_k} E_{k1}` with `I_k = [(k−1)/N, k/N)` and `N ≥ 3`. Column `(1 − 1/N)^{1/2}` at `Q = 𝕋`; row `2^{−1/2}` (Popoviciu bound, attained at `I₁ ∪ I₂`). For `N = 4`: `0.866` against `0.707`. With `|g|² = gg*` the two values swap. Mirrored in plan.json 10.1.

Evidence (plain Python): the old example near `z = 1/4` gives row² = col² = `3.0` (`N = 3`). The new one, maximised over all arcs, gives column² `0.6667`/`0.7500` and row² `0.5000` for `N = 3`/`4`. At `N = 2` both are `0.5`, hence `N ≥ 3`.

## F03 (P3) — applied differently

Changed: in §8.2 "dense in `S_p` and `S_{p'}`, from `MemLp.exists_hasCompactSupport_eLpNorm_sub_le`" → dense in every `S_q`. Finite-rank operators are `S₁`-limits of `C_c`-kernel ones (`‖u⊗v*‖₁ = ‖u‖‖v‖`), and `C_c` is dense in `L²(μ)` via three pinned lemmas, with no normality needed; the Mathlib lemma covers the normal case. Also updated: the Mathlib contract, `*Needs:*` (plus §1.1), Layer 8 Dependencies, plan.json 8.2.

Evidence: the claim is right. At the pin, `MemLp.exists_hasCompactSupport_eLpNorm_sub_le` (`Mathlib/MeasureTheory/Function/ContinuousMapDense.lean:142`) needs `NormalSpace` (line 67), `R1Space`, `WeaklyLocallyCompactSpace`, `μ.Regular` and `p ≠ ∞`.

The review splits `p < ∞` from the endpoint, which is unnecessary: §8.2 needs only `L²` density. The three lemmas are:
- `MeasurableSet.exists_isCompact_lt_add` (`MeasureTheory/Measure/Regular.lean:821`);
- `IsCompact.exists_isOpen_lt_add` (`:930`);
- `exists_continuousMap_one_of_isCompact_subset_isOpen` (`Topology/UrysohnsLemma.lean:529`, needing only `R1Space` and `LocallyCompactSpace`).

Together they give `‖φ − 1_E‖₂² ≤ μ(E∖K) + μ(U∖K)`. `μ.Regular` for finite Radon measures is the instance at `Regular.lean:902`.

## F04 (P3) — applied

Changed: §2.2 now says the gap states the trace formula on one space. Two spaces reduce to the one-space formula on `Ω ⊔ Ω'`, applied to the zero-extensions of `A` and `C` (product `AC ⊕ 0`, kernels vanishing off `Ω × Ω'` and `Ω' × Ω`). Witness on `{1} ⊔ {2}`: `Tr(AC) = 1 = k_A(1,2)k_C(2,1)`. Mirrored in plan.json 2.2.

Evidence: the AutomorphicSpectralTheory open head (its README line 276) states `kernel_trace_diagonal` for `K₁, K₂ ∈ L²(X × X)`, one space, as the review says.

## F05 (P3) — applied differently

Changed: §1.4 says that for infinite `d`, `T ⊗ id` is defined on finitely supported block matrices, and on all of `S₂(H ⊗ L)` when `‖T‖₂ < ∞`. Its `p`-norm, `‖T‖_{cb,p}`, is proved by pairing with finite-rank `B` (§1.2). Added an unbounded-`T` Check and a `d = 0` clause. §3.6's route notes `‖S_M‖₂ = ‖M‖_∞`. Mirrored in plan.json 1.4.

Evidence that the suggested route is flawed: the review proposes "the compression bound of §1.1 along `1 ⊗ P_F`". `1 ⊗ P_F` has infinite rank when `H` is infinite-dimensional, while §1.1 assumes finite-rank projections. The pairing route uses `P_F B P_F → B` in `S₁` and works at every `p`, `p = ∞` included.

## F06 (P3) — applied

Changed: §3.6's third bullet now reads "when `‖S_M‖_∞ < ∞`": the extension is C3.2-completely bounded exactly when `‖S_M‖_{cb,∞} < ∞`, with that norm. The same pattern is repaired in §1.4 (plus a Check: the transpose on `K(ℓ²(ℕ))` is bounded but not cb) and in §4.3. Mirrored in plan.json 1.4, 3.6 and 4.3.

Evidence: CStarAlgebras C3.2 on main (README lines 920–921) defines `‖u‖_cb` only for maps with a finite supremum.

## F07 (P3) — applied

The NoncommutativeGeometry consumer bullet is deleted from the README and from plan.json `consumers`. On main, NoncommutativeGeometry takes its Schatten bounds from OperatorIdeals and NoncommutativeIntegration (its supplier table, lines 443–446) and never mentions Schur multipliers.

## Checks

Dependency check, run after the last edit:

```
candidate: SchattenClassesAndSchurMultipliers is not in the merge order yet; checked as if placed after AutomorphicSpectralTheory (the intake inserts it when its design is accepted)
depcheck: 236 roadmaps, 2137 edges, 0 problem(s)
```

No UPWARD or CYCLE line.

Other checks:
- `roadmaps resolve` on the README: no cross-roadmap citation and no Lean name found nowhere. That tool did not check Mathlib names, so the six Mathlib names used in the repairs were opened at the pin by hand, with the files and lines given above.
- plan.json parses and keeps its formatting.
- No `Suggested.lean` exists at the design stage, so there was no `#check` audit and no elaboration.
- No gate failures were listed for this round.

## Adversarial pass (new or changed statements)

| Statement | Instances | Values | Result | Change |
|---|---|---|---|---|
| §1.1 compression bound | `X = 1` on `ℓ²(ℕ)`, `p = ∞`; `p = 1, 2`; `X = diag(1/(j+1))`, `p = 2, ∞`; `X` = projection onto even coordinates, `p = ∞`; `X = 0` | `∞` vs `1` (fails); `∞ ≤ α^{1/p} → ∞`; `π²/6 = liminf Σ_{n<α}(n+1)^{−2}`, `1 ≤ 1`; `∞` vs `1` (fails); `0 ≤ 0` | the `p < ∞` restriction is needed and enough | restricted |
| §1.1 new Check | `α = 4`, `p = 2` | `‖P₄‖₂ = 2`, `‖P₄‖_∞ = 1` | consistent with the bullet | added |
| §1.4 stabilisation | `T = id`, `d = ∞`; transpose on `M_n`, `L = ℓ²(ℕ)`, `p = ∞`; `‖T‖₂ = ∞`; `d = 0` | `1 = 1`; `n = ‖t‖_{cb,∞}`; `Σ‖B_k‖₂² ≤ 1/3` but `Σ‖TB_k‖₂² = ∞`; both `0` | the domain needs `‖T‖₂ < ∞` | restated |
| §1.4 pairing step | `Tr(XP_FBP_F) = Tr(P_FXP_F · P_FBP_F)`, with `‖P_FBP_F‖_{p'} ≤ ‖B‖_{p'}` and `|Tr(X(P_FBP_F − B))| ≤ ‖X‖‖P_FBP_F − B‖₁` | `→ 0` for finite-rank `B` | sound at every `p` | new route |
| §1.4 / §3.6 / §4.3 C3.2 comparison | transpose on `K(ℓ²(ℕ))`; `T = id`; transpose on `M_n`; `M = 1_{x=y}` on `ℕ` | `‖t‖_∞ = 1`, `sup_n ‖t_n‖ = ∞`; `1 = 1`; `n = n` (C3.2 Check); diagonal projection `1 = 1` | "exactly when finite" is needed | restated |
| §2.2 two-space trace | `{1} ⊔ {2}`; `ν = 0`; two copies of `[0,1]` with constant kernels `1` | `1 = 1`; `0 = 0`; `Tr` of the projection onto constants is `1 = ∫∫ 1` | sound | clause added |
| §3.6 route | `M = [[1,2],[2,1]]` | `‖S_M‖₂ = 2 = ‖M‖_∞` | sound | clause added |
| §8.2 `L²` density | `E = [0,1]`, `K = [ε, 1−ε]`, `U = (0,1)`; deleted Tychonoff plank (locally compact Hausdorff, not normal) | `‖φ − 1_E‖₂² = 2ε/3 ≤ 4ε`; Mathlib lemma unavailable, route still applies | sound without normality | restated |
| §8.2 density in `S_q` | `‖u⊗v* − u'⊗v'*‖₁ ≤ ‖u−u'‖‖v‖ + ‖u'‖‖v−v'‖` | `→ 0` | covers `q = ∞` too | restated |
| §10.1 Check | `N = 2, 3, 4`; old example near `1/4` | col² `0.5, 0.667, 0.75`; row² `0.5` each; old row² = col² = `3.0` | separates for `N ≥ 3` | replaced |

## For the maintainer

- No Lean name or cited id of this roadmap changed. No other roadmap cites SchattenClassesAndSchurMultipliers (`roadmaps grep`, previous round).
- No new target, construction or supplier: ownership is unaffected. Ownership against the open pull requests was not re-searched this round, because no new object was introduced.
- The two supplier gaps (`sigma-finite-hilbert-schmidt-kernels`, `semifinite-martingale-bmo-interpolation`) are unchanged. F04 uses only the one-space form the first gap already asks for.
- CStarAlgebras and NoncommutativeIntegration are now on main; their citations were re-read there (C3.2 lines 918–933).
- No suspicious instructions were found in the review text.
