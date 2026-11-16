# FIX-RT-ComplexHessianEquations~2

I checked all three findings of the two red-team reviews against the sources, the pins and the roadmap's own definitions, and all three hold. Two are applied as asked. The third is applied differently: the Lean change is the one asked for, but the README route differs. Following the "repair the pattern" rule, two more hypotheses of the same kind were also removed; each is named below. Files changed: `packages/ComplexHessianEquations/README.md` and `packages/ComplexHessianEquations/Suggested.lean`. `sources.toml`, `metadata.toml` and `design/plan.json` are unchanged.

## RT-ComplexHessianEquations~2a/F01 (P3) — applied

Verified. gpt2023 line 67–70 states (1.1) with `F` normalized. The unnormalized reading appears only in the proof, at (3.1)–(3.2), line 443–451. The witness holds; I recomputed it: `c = 4.5400·10⁻⁵`, `Ent_2(F̃) = 8.42·10⁻¹¹`, `Ent_2(F) = 100.0000006`, and `e^F` has mass `1`.

What changed (§8.6): "unnormalized right-hand side `e^{F̃}`, as in gpt2023 (1.1), … supplies `c̄`" → "`F̃` not normalized, as in the proof of gpt2023 Theorem 1 ((3.1)–(3.2), line 443–451): `e^{F̃} = c·e^F`, `F = F̃ − log c` normalized; `c^n ≤ Ent_p(F̃) + e^n` supplies `c̄`; the constant's entropy is `Ent_p(F)`, which `Ent_p(F̃)` does not bound". I added the reviewer's witness as a Check. The locator extends to line 451 because (3.2), the mass identity, is on line 450–451. There is no other occurrence of "(1.1)" or of an unnormalized right-hand side in the roadmap. §3.4 only bounds the mass, which is correct.

## RT-ComplexHessianEquations~2a/F02 (P3) — applied

Verified. At `m = 0` a homogeneous `p` with `eval a p > 0` is a constant `C c` with `c > 0`. Then `eval b p = c > 0`, `lineRestriction p x b = C c` splits, and both cones are `univ`, so the conclusion holds without `hm`. `garding` keeps `hm`, because its derivative clause reads `0 < 0` at `m = 0`.

What changed: `(hm : 1 ≤ m)` is deleted from `isHyperbolic_and_gardingCone_eq_of_mem`. Its docstring now says "A hyperbolic polynomial is hyperbolic …; at `m = 0` … every cone is `ℝ^N`". In README §2.2 I added the sentence the reviewer asked for, and the degree-zero Check gained "the independence of the direction survives: `Γ(1, b) = ℝ^N = Γ(1, a)`".

**The same pattern elsewhere.** `hk : 1 ≤ k` in `isHyperbolic_esymm_and_gardingCone_eq` is also unneeded. At `k = 0`, `esymm (Fin n) ℝ 0 = 1`, `IsHyperbolic 1 0 1` holds, and `gardingCone 1 1 = univ = hessianCone n 0` (the empty conjunction over `Icc 1 0`). I deleted `hk` and updated the docstring and README §2.2: the statement sentence, the degree-zero Check ("every statement about `Γ_k` assumes `k ≥ 1`" became the statements that place `Γ_k` inside `Γ_1` or use `1/k`), and the index-range Check ("`1 ≤ k ≤ n`" became "`k ≤ n`").

Every other degree or index hypothesis in the file is needed:
- `hm` in `garding`.
- `hlk` in `concaveOn_hessianQuotient`: at `l = k` the derivative clause reads `0 < 0`.
- `hkn` in `isHyperbolic_esymm_and_gardingCone_eq`: at `k > n`, `esymm = 0`.
- `hk` in `exists_hessianPair` and `exists_abs_le_hessian_degenerating`: at `k = 0` the condition `q > n/0` is vacuous in Lean, and the estimate is false for small `q`.

## RT-ComplexHessianEquations~2b/F01 (P3) — applied differently

Verified. `f = min` on `ℝ²` gives `F_f = λ_2`. At `diag(1, 0)`, `diag(0, 1)` and their midpoint the values are `0`, `0` and `1/2`, which is concave without `hf1`.

What changed:
- `(hf1 : ContDiffOn ℝ 1 f Γ)` is deleted, together with `hΓo`, as the same pattern, and `hΓc`, which is `hf.1`.
- The docstring now says "convex set … `f` concave".
- In README §1.4 the header splits the hypotheses by item. A majorization route is added, and both Checks were added.

**Why "differently".** The route is the following, not the supergradient one:
- `κ_m(aS + bT) ≤ aκ_m(S) + bκ_m(T)` (§1.2), so `λ(aS + bT)` is majorized by `aλ(S) + bλ(T)`.
- The superlevel set `{μ ∈ Γ : f(μ) ≥ aF_f(S) + bF_f(T)}` is convex and symmetric.
- Tau Ceti `Convex.robinHood_mem` and `TauCeti.mem_of_prefixSum_le_of_sum_eq` (`TauCeti/Analysis/Convex/Majorization.lean:212` and `:338`, both checked with `#check` at the pin) put `λ(aS + bT)` in that set.

Every input of this route is §1.2 or a pinned declaration. The suggested route needs the existence of supergradients of a concave function on an open convex set, which I did not find at the pins: Tau Ceti `Analysis/Convex/Subdifferential.lean` has no existence theorem. The majorization route also needs no openness, so `hΓo` goes too. Instance: the closed orthant with `f = σ_n^{1/n}` is exactly the setting of the pinned `LinearMap.concaveOn_det_rpow` (closed PSD cone), which the old headline did not cover. That instance is now a §1.4 Check with values `0`, `0` and `1/2`.

The C¹ gradient route stays as the gradient form `dF_f(S)(T − S) ≥ F_f(T) − F_f(S)`. The half-space route for the first item stays, for open `Γ`. The last two items (positive-definite gradient, monotonicity) keep open `Γ` and `C¹` `f`, which they use. The Checks added:
- the reviewer's `min` Check, with the majorization step (`y = (1, 0)`, `d = (1/2, 1/2)`);
- a negative control: `f = max` gives `1`, `1`, and `1/2 < 1` at the midpoint.

`Convex.robinHood_mem` and `TauCeti.mem_of_prefixSum_le_of_sum_eq` were added to the §1.4 *Needs:* line, the Layer 1 Dependencies and the Tau Ceti supplier contract (one new bullet). The contract bullet on `LinearMap.concaveOn_det_rpow` now names the closed orthant.

## Checks run

- **Elaboration** (`lake env lean packages/ComplexHessianEquations/Suggested.lean` from the content checkout): exit 0. There are 17 warnings, all "declaration uses `sorry`" (lines 77, 88, 103, 116, 153, 165, 173, 181, 218, 291, 316, 334, 352, 378, 401, 427, 447), and no errors.
- **Signatures.** I put a scratch copy of the file with `#check @name` for all 31 declarations in one file and elaborated it once (exit 0). The three changed theorems elaborate as follows:
  - `concaveOn_spectralFunction : ∀ {𝕜} [RCLike 𝕜] {n} {Γ}, (∀ σ, ∀ μ ∈ Γ, μ ∘ σ ∈ Γ) → ∀ {f}, (∀ σ, ∀ μ ∈ Γ, f (μ ∘ σ) = f μ) → ConcaveOn ℝ Γ f → ConcaveOn ℝ {A | eigenvalueVector A ∈ Γ} …`
  - `isHyperbolic_and_gardingCone_eq_of_mem : IsHyperbolic p m a → b ∈ gardingCone p a → IsHyperbolic p m b ∧ gardingCone p b = gardingCone p a`
  - `isHyperbolic_esymm_and_gardingCone_eq : k ≤ n → IsHyperbolic (esymm (Fin n) ℝ k) k 1 ∧ gardingCone … 1 = hessianCone n k`

  Each matches its README statement. The other 28 declarations are unchanged. The five definitions flagged in the job's signatures lack only `[FiniteDimensional ℂ E]` or `[IsManifold …]`, which their bodies do not use, and every theorem carries both.
- **Dependency check:**

  ```
  depcheck: 250 roadmaps, 2365 edges, 0 problem(s)
  ```

  There is no UPWARD, CYCLE or `moved:` line.
- **Citations** (`roadmaps resolve`): no cross-roadmap citation and no Lean name found nowhere. I checked the two new Tau Ceti names at the pin with `#check` (signatures as described in the contract).

## Adversarial pass on the changed statements

| Statement | Instances tried | Values on each side | Result |
| --- | --- | --- | --- |
| `concaveOn_spectralFunction`, no `hf1`, `hΓo` or `hΓc` | `f = min`, `Γ = ℝ²`; `A = diag(1,0)`, `B = diag(0,1)` | `F_f = λ_2`: `0`, `0`, midpoint `1/2 ≥ 0`; `y = (1,0)`, `d = (1/2,1/2)`, partial sums `1/2 ≤ 1`, `1 = 1` | true |
| same | closed orthant, `f = (μ_1μ_2)^{1/2}` (not open) | `0`, `0`, `1/2`; `diag(4,1)`, `diag(1,4)`: `2`, `2`, `5/2` | true; matches `LinearMap.concaveOn_det_rpow` |
| same, `hf` needed | `f = max` (convex) | `λ_1`: `1`, `1`, midpoint `1/2 < 1` | excluded by `hf` |
| same, `hfs` needed | `f(μ) = μ_1` (concave, not symmetric) | `λ_1`: `1`, `1`, midpoint `1/2 < 1` | excluded by `hfs` |
| same, `hΓs` needed | `Γ = {μ_2 ≤ 0}`; `A = diag(1,0)`, `B = [[1/2,1/2],[1/2,1/2]]`, both `λ = (1,0)` | midpoint eigenvalues `(2 ± √2)/4 = 0.854, 0.146`, `λ_2 > 0` | excluded by `hΓs` |
| same, degenerate | `n = 0`; `n = 1`; `Γ = ∅` | at most one point; `F_f = f`; empty domain | true |
| `isHyperbolic_and_gardingCone_eq_of_mem`, no `hm` | `m = 0`, `p = C 2`, `b = (−1, 0)` | `eval b p = 2 > 0`, `C 2` splits, `univ = univ` | true |
| same | `p = x + y`, `a = (1,1)`, `b = (2,−1)` | `p(b) = 1`, root `−(x_1 + x_2)`, both cones `{x_1 + x_2 > 0}` | true |
| same | `N = 0`, `m ≥ 1` | `p = 0`, `eval a p = 0`, `hp` fails | vacuous, as intended |
| same, `hb` needed | `p = xy`, `b = (1, 0)` | `p(b) = 0`, not `> 0` | excluded by `hb` |
| `isHyperbolic_esymm_and_gardingCone_eq`, no `hk` | `k = 0`, any `n` (including `n = 0`) | `esymm 0 = 1`, degree `0`, `eval 1 1 = 1`, `gardingCone 1 1 = univ = hessianCone n 0` | true |
| same | `n = 2`, `k = 1`; `n = 3`, `k = 2` at `−e` | cone `{x_1 + x_2 > 0}`; `3(t − 1)²`, root `1 ≥ 0`, `σ_1(−e) = −3` | both sides agree |
| same, `hkn` needed | `n = 1`, `k = 2` | `esymm = 0`, `eval = 0` | excluded |
| §8.6 rescaling | `F̃` normalized; reviewer's two-valued `F̃` | `c = 1`, `1 ≤ Ent_p + e^n`; `c = 4.54·10⁻⁵ ≤ 8.42·10⁻¹¹ + e`, `Ent_2(F) = 100` | sentence true; Check added |
| §8.6 normalization of `F` | `∫ e^{nF} = c^{−n}∫ e^{nF̃} = c^{−n}·c^nV` | `V` | true |

## Ownership, sources and other roadmaps

- No new object or target was introduced, so there was no new ownership question. The new route consumes two pinned Tau Ceti declarations. `roadmaps grep` finds the three changed Lean names nowhere outside this package, on main or at any open head.
- No source was added and none is missing. `needs-references.toml` was not written.
- No text read during the job asked for any action; there is nothing suspicious to report.
- For maintainers: the three changed theorems now carry fewer hypotheses, so any later consumer may apply them more widely. No other roadmap cites them.
