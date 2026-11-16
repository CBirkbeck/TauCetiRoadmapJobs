# FIX-RT-DynamicalDegreesOfRationalMaps~2

This round repairs red-team round 2, passes a and b: six P3 findings, none overlapping. I verified all six and applied all six. Two files changed, `packages/DynamicalDegreesOfRationalMaps/README.md` and `packages/DynamicalDegreesOfRationalMaps/Suggested.lean`. In `Suggested.lean` only docstrings changed, and every elaborated type is unchanged. `metadata.toml`, `sources.toml` and `design/plan.json` are unchanged: no source was added and no supplier gap is needed.

## RT-DynamicalDegreesOfRationalMaps~2a/F01 (P3) — applied

Old module docstring: "Invariance under the normalization lift (README §§4.3, 5.3) is the case of `dynamicalDegree_birational_conj` …". New: "Invariance of the dynamical degrees under the normalization lift (README §5.3) is the case of `dynamicalDegree_birational_conj` …". An added sentence says that the equality of the degrees under the lift (§4.3) is not a case of that theorem, which compares only the limits `λ_k`. It is an instance of model independence (§4.1), a README target.

Evidence. The witness holds. Take the cuspidal cubic with `f = id` and `k = 0`. §4.3 asserts `deg_0(f̃; ν^*O(1), ν^*O(1)) = 3 = deg_0(f; O(1), O(1))`, because `ν^*O(1) = O(3)` on `ℙ¹`. `dynamicalDegree_birational_conj` gives only `λ_0 = 1 = 1`. §4.3 is model independence with `Γ' = Γ_{f̃}`, `q_1 = ν ∘ π̃_1` (generic degree `1`) and `q_2 = ν ∘ π̃_2`. Then `(q_1^*O(1))_{Γ'} = 3 = 1·3`.

Same pattern elsewhere: README §4.3 ("model independence through the birational `Γ_{f̃} → Γ_f`"), §5.3 ("the previous item for the inverse of `ν`") and §5.4 were already correct. No other passage credits §4.3 to a statement about `λ_k`.

## RT-DynamicalDegreesOfRationalMaps~2a/F02 (P3) — applied

The route of README §5.1 used logarithms, Fekete's lemma and a lower bound from §4.5. It now runs through `Submultiplicative.tendsto_lim` on `v_n = C_k(ω)·deg_{k,ω}(f^n)`, which needs only `v_n ≥ 0`. Submultiplicativity for `m, n ≥ 1` comes from §4.4, and for `m = 0` from `v_0 = (d − k + 1)^k ≥ 1`. The *Needs:* line changed from "§§4.2, 4.4, 4.5; … `Subadditive` …" to "§§4.2, 4.4; … `Submultiplicative`, `Submultiplicative.lim`, `Submultiplicative.tendsto_lim` …". In the contract bullet, the Subadditive bullet was replaced, not appended to, since nothing uses `Subadditive` any more.

Evidence. At the pinned Mathlib, `Mathlib/Analysis/Subadditive.lean` has:
- `Submultiplicative` at line 35: `∀ m n, u (m + n) ≤ u m * u n`, all `m, n ∈ ℕ`;
- `Submultiplicative.lim` at line 44: `sInf` of `u n ^ (n : ℝ)⁻¹` over `Ici 1`;
- `Submultiplicative.tendsto_lim` at line 89, with `hbdd : ∀ n, 0 ≤ u n`.

The new route checked step by step:
- **The `§4.4` step.** §4.4 with `f_1 = f^n`, `f_2 = f^m` and all classes `ω` gives `(ω^d)·deg(f^{m+n}) ≤ (d − k + 1)^k·deg(f^n)·deg(f^m)`. Multiplying by `(d − k + 1)^k/(ω^d)²` gives `v_{m+n} ≤ v_m·v_n`.
- **The case `m = 0`.** `v_n ≤ (d − k + 1)^k·v_n`.
- **The constant.** `C_k(ω)^{1/n} → 1` because `(ω^d) > 0`.

§4.5 is still needed in §5.2, for `λ_k ≥ 1` and independence of `ω`, as that section's *Needs:* line already says.

Same pattern elsewhere:
- The Layer 5 Dependencies now name `Submultiplicative` instead of `Subadditive`.
- dinhsibony2005 line 259 writes the infimum without the constant `c_X`, which the new §5.1 Check (2b/F03) refutes. Its citation is now qualified, in README §5.1 and in the `tendsto_dynamicalDegree` docstring, as "for convergence over `ℂ`".
- The docstring also cites dangfavre2021 lines 461–463 (§1.3, after Theorem 1.3). That passage states the infimum with the constant, by exactly this submultiplicative argument.

## RT-DynamicalDegreesOfRationalMaps~2b/F01 (P3) — applied

Added a Check to README §1.3 with `f ≠ g`:
- `f = z²`, `g = id`: `W_{f,g}` is the closure of `{(x, x², x²)}`, and `(q_Y, q_Z)` maps it onto `Γ_{id}` by `x ↦ x²`, of degree `2 = e(f) ≠ e(g) = 1`.
- `f = id`, `g = z²`: `W` is the closure of `{(x, x, x²)}`, and the map is an isomorphism onto `Γ_g`, of degree `1 = e(f) ≠ e(g) = 2`.

Evidence. The three existing Checks have `f = g`, so the wrong statement "degree `e(g)`" passes them. Recomputed: `U = ℙ¹` in both cases, and the function-field map `K(Γ_g) ≅ K(Y) → K(X)` is `f^*`, of degree `e(f)`. This agrees with the §4.4 route, where `(B^d) = e(f_1)(L_2^d)` and `(A^kB^{d−k}) = e(f_1)·deg_k(f_2)`: the degree of `q_2` and of `(q_2, q_3)` is `e(f_1)`.

## RT-DynamicalDegreesOfRationalMaps~2b/F02 (P3) — applied

Added a Check to README §4.1 on the direction of the cycle pullback. For `f = z²` on `ℙ¹` and `M = O(1)`, `π_2^*M = O(2)` on `Γ_f ≅ ℙ¹`, so `f^*(M) = 2·[point]`. Its degree is `2 = deg_{1,H}(f) = e(f)·(M)`, as §4.2 says. The reversed operator `π_{2*}(c_1(π_1^*M) ∩ [Γ_f])` pushes forward a rational point and gives degree `1`.

Evidence. For `f = id` both operators give `[point]`, `√2·[point]` and `0`, so the existing Check does not separate them. With `f = z²` they give `2 ≠ 1`. The value `2` agrees with §4.2: `deg_d = e(f)·(M^d) = 2·1`.

## RT-DynamicalDegreesOfRationalMaps~2b/F03 (P3) — applied

Added a Check to README §5.1. On `ℙ^d` with `d ≥ 1`, take `ω = (1/2)·H` and `f = id`:
- `deg_{k,ω}(f^n) = 2^{−d}` and `λ_k = 1`;
- without the constant, the infimum is `2^{−d} < 1`, attained at `n = 1`;
- with `C_k(ω) = (d − k + 1)^k·2^d`, the terms are `((d − k + 1)^k)^{1/n}`, of infimum `1`.

The suggested text was corrected on one point. It said the infimum `1` is attained "for `k = 0`, a limit for `k ≥ 1`". In fact it is attained for `k = 0` and for `k = d`, where `(d − k + 1)^k = 1`, and it is a limit for `1 ≤ k ≤ d − 1`.

Evidence. Without the constant, the infimum agrees with `λ_k` on every existing Check: `a^k` for morphisms of `ℙ^d`, and `1` in dimension `0`. Recomputed: `0 < 2^{−d} < 1`, so `n ↦ (2^{−d})^{1/n}` increases to `1` and its infimum is its value at `n = 1`. For `d = 2`: without the constant the infimum is `1/4`, while with it the terms for `k = 1` are `2^{1/n}`, of infimum `1`. The restriction `d ≥ 1` is needed: in dimension `0`, `(ω^0) = χ(O)` does not depend on `ω`, and nothing is separated.

## RT-DynamicalDegreesOfRationalMaps~2b/F04 (P3) — applied

The contract bullet "For the statements of `Suggested.lean`" now lists `AlgebraicGeometry.Scheme.canonicallyOverPullback` (Mathlib/AlgebraicGeometry/Pullbacks.lean:816). It is the `T`-structure on `pullback (M ↘ S) g` through `pullback.snd`, used by `mixedDegree_baseChange` for `Γ_f ×_K Spec K'`. README §4.3 now says "over `K'` (through its second projection, Mathlib's `Scheme.canonicallyOverPullback`)".

Evidence. At the pin, line 816 reads `instance canonicallyOverPullback : (pullback (M ↘ S) f).CanonicallyOver T where hom := pullback.snd (M ↘ S) f`. I also checked it in Lean: in a scratch file, two `example`s elaborate by `rfl`. In the first, the instance that `inferInstance` finds for `(pullback (G ↘ Spec K) (Spec.map (algebraMap K K'))).Over (Spec K')` is `Scheme.canonicallyOverPullback.toOverClass`. In the second, its structure morphism is `pullback.snd _ _`. `Suggested.lean` is unchanged here.

## Checks

- **Elaboration.** `lake env lean packages/DynamicalDegreesOfRationalMaps/Suggested.lean`, run from the content checkout, gives 19 warnings `declaration uses 'sorry'`, at lines 91, 142, 156, 183, 196, 215, 239, 258, 283, 334, 347, 357, 367, 377, 387, 401, 421, 438 and 448. There are no errors and no other messages. All imported `TauCeti.*` modules were already built.
- **Signatures.** One scratch file holds a copy of the module followed by `#check @name` for all 32 declarations. I elaborated it once and compared each type with the job's signature list after normalising the namespace prefix: 32 of 32 are identical. This is expected, since only docstrings changed. No binder was lost, and each type still matches its README statement.
- **Dependency check.** Output: `depcheck: 241 roadmaps, 2258 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.
- **Citations.** `roadmaps resolve` on the README finds no cross-roadmap citation and no Lean name missing. Every name added this round is a Mathlib declaration read at the pin: `Submultiplicative`, `Submultiplicative.lim`, `Submultiplicative.tendsto_lim`, `Scheme.canonicallyOverPullback` and `pullback.snd`.
- **Ownership.** No construction was added this round, so no ownership search was needed. No supplier citation changed.

## Adversarial pass on the new and changed statements

| statement | instances tried | values computed | result | change |
| --- | --- | --- | --- | --- |
| Docstring: §5.3 normalization is `dynamicalDegree_birational_conj` with `φ = ν^{−1}` | cuspidal cubic, `f = id`; nodal cubic, `f = id` | `λ_0 = λ_1 = 1` on `X` and on `ℙ¹` in both; `φ ∘ id ∘ φ^{−1} = id` on `X̃` | true | new wording |
| Docstring: §4.3 is model independence, not the theorem on `λ_k` | cuspidal cubic, `k = 0` | `Γ' = Γ_{f̃} ≅ ℙ¹`, `e(q_1) = 1`, `(q_1^*O(1)) = 3 = 1·deg_0(f) = 3` | true | new sentence |
| §5.1 route, `v_{m+n} ≤ v_m v_n` | `(x², y)` on `ℙ²`, `k = 1`, `H`; Cremona `k = 1`; `ω = H/2`, `f = id`; `d = 0` | `C = 2`, `v_n = 2^{n+1}`, `2^{m+n+1} ≤ 2^{m+n+2}`; `v = (2, 4, 2, 4, …)`, `v_2 = 2 ≤ 16`, `v_3 = 4 ≤ 8`, `v_4 = 2 ≤ 4`; `v_n = (d−k+1)^k ≤ (d−k+1)^{2k}`; `v_n = 1` | true | new route |
| §5.1 route, the case `m = 0` | `k = 0`; `k = d`; `d = 2`, `k = 1` | `v_0 = 1`; `v_0 = 1`; `v_0 = 2`; `v_n ≤ v_0 v_n` since `v_n ≥ 0` | true | new |
| §5.1 route, limit of `v_n^{1/n}` equals `λ_k` | Cremona: `v_n^{1/n}` | `4, √2, 4^{1/3}, 2^{1/4}, …`; infimum over `n ≥ 1` is `1 = λ_1`, approached along even `n` | true | — |
| Contract: `Submultiplicative.tendsto_lim` hypotheses | `u ≡ 0`; `u_n = 2^{n+1}` | `lim = 0`, `0^{1/n} = 0` for `n ≥ 1`; `u_0 = 2`, `lim = inf 2^{(n+1)/n} = 2` | as stated at line 89 | bullet replaced |
| §1.3 Check `f = z²`, `g = id` | — | `W = {(x, x², x²)}`, `(q_Y, q_Z)` is `x ↦ x²` onto the diagonal: `2 = e(f)`, `e(g) = 1`, `e(g∘f) = 2` | separates `e(f)` from `e(g)` | added |
| §1.3 Check `f = id`, `g = z²` | — | `W = {(x, x, x²)} ≅ Γ_g`: `1 = e(f)`, `e(g) = 2`, `e(g∘f) = 2` | separates `e(f)` from `e(g)` and from `e(g∘f)` | added |
| §4.1 Check on the direction of `f^*` | `f = z²`, `M = O(1)` | `π_2^*M = O(2)`, `f^*M = 2[pt]`, degree `2 = e(f)(M)`; reversed `π_{2*}[pt]`, degree `1` | separates | added |
| §5.1 Check on the constant | `d = 1`; `d = 2`, `k = 0, 1, 2`; `d = 0` | `d = 1`: terms `1` for `k = 0, 1`, while the infimum without the constant is `1/2`; `d = 2`: without the constant `1/4`, with it `1`, `2^{1/n}`, `1`; `d = 0`: `(ω^0) = 1` for every `ω`, so nothing separates (hence `d ≥ 1`) | true; corrected the "attained" clause | added |
| Contract and §4.3: `canonicallyOverPullback` | `rfl` tests on the instance and on `↘` | both elaborate | true | added |
| dinhsibony2005 citation qualified to convergence | its line 259 against the new Check | its infimum without `c_X` gives `2^{−d} ≠ 1` | qualification needed | README §5.1, Lean docstring |

## Notes for the maintainer

- No Lean name changed. Other roadmaps cite no id of this roadmap that changed. No section, layer or target was renumbered.
- §5.1 no longer depends on §4.5. The order of Layer 4 and Layer 5 is unchanged, because §§5.2–5.3 still use §4.5.
- Both reviews raise a question about dang2020 line 842, which cites Lazarsfeld's book as Theorem 2.2.13 for the bigness criterion. dangfavre2021 line 423 cites Lazarsfeld, Theorem 2.2.15 for Siu's inequality, the number the README uses. The book itself is uncertified and was not read, so the README is unchanged.
- No suspicious instructions were found in the review texts.
