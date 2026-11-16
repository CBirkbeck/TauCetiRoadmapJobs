# FIX-PKG-ComplexHessianEquations~2

One review was settled: `REV-PKG-ComplexHessianEquations`. It has one finding, F01 (P3).

## F01 (P3) — applied

The finding is correct. Both the README (§2.5) and the theorem's docstring call the Hessian-pair constant sharp and attained at `e`, but `exists_hessianPair` stated only `P.IsStructural γ`. Changes:

- `Suggested.lean`: added the conjunct `∏ j, fderiv ℝ P.f 1 (Pi.single j 1) = ((n.choose k : ℝ) ^ (1 / (k : ℝ)) / n) ^ n`. The docstring "which is attained at `λ = (1, …, 1)`" now reads "sharp: the product `∏_j ∂_j f` equals it at `λ = (1, …, 1)`".
- README §2.5: "sharp, attained at `λ = e`" now reads "sharp: `∏_j ∂_j f(e) = γ`", with the computation of `∂_j f(e)` and the locator of Lemma 4 (gpt2023 line 744–769).

Evidence:

- **The bound.** gpt2023 Lemma 4 (line 744–769) proves it. Concavity and Euler's identity give `f(μ) ≤ Σ_j μ_j ∂_j f(λ)`. Taking the infimum over `μ ∈ Γ_n` with `∏ μ_j = 1` and applying AM–GM gives `n(∏_j ∂_j f(λ))^{1/n} ≥ inf f`. Maclaurin gives `σ_k(μ)^{1/k} ≥ binom(n, k)^{1/k}` on that set, and `binom(n, k)^{1/k} = nγ^{1/n}`.
- **Attainment.** This is our own computation, not a quoted source result. At `e`, `∂_j σ_k(e) = binom(n − 1, k − 1) = (k/n)·binom(n, k)`. So `∂_j f(e) = (1/k)·binom(n, k)^{1/k − 1}·(k/n)·binom(n, k) = binom(n, k)^{1/k}/n`, and the product of the `n` partials is `γ`.

The same claim appears in two more places:

- The module docstring of `Suggested.lean` says "with its sharp structural constant". It is true now and was not changed.
- The `§2.5` Check at `(n, k) = (3, 2)` already computes the value at `e` and agrees with the change.

No other text claims a sharp or attained constant for a Lean name. Layer 8's title "Sharp `L^∞` estimates" uses the literature's name for the Guo–Phong–Tong estimates; it makes no claim about a constant, and it was left unchanged.

## Adversarial pass on the changed statement

| Statement | Instances tried | Values computed (left / right) | Result | Change |
|---|---|---|---|---|
| attainment conjunct of `exists_hessianPair` | `(n, k) = (1, 1)` | `f(μ) = μ^1`, `∂f = 1`; product `1` / `(1^1/1)^1 = 1` | holds | conjunct added |
| same | `(2, 1)` | partials `1, 1`, product `1` / `(2/2)^2 = 1` | holds | — |
| same | `(2, 2)` | `∂_j (μ_1μ_2)^{1/2}` at `e` is `1/2`; product `1/4` / `(1/2)^2 = 1/4` | holds | — |
| same | `(3, 2)` | `σ_2(e) = 3`, `∂_jσ_2(e) = 2`, `∂_j f = (1/2)·3^{−1/2}·2 = 3^{−1/2}`; product `3^{−3/2} ≈ 0.19245` / `(√3/3)^3 = 3^{−3/2}` | holds | — |
| same | `(4, 2)` | `σ_2(e) = 6`, `∂_jσ_2(e) = 3`, `∂_j f = 3/(2√6) = √6/4` / per-factor `6^{1/2}/4 = √6/4` | holds | — |
| same | `k = n` | `∂_j f(e) = 1/n` / `1^{1/n}/n = 1/n` | holds | — |
| bound and attainment agree | `(3, 2)` at `λ = (2, 1, 1) ∈ Γ_2` | `σ_2 = 5`, partials `2/(2√5), 3/(2√5), 3/(2√5)`, product `9/(20√5) ≈ 0.2012` ≥ `γ ≈ 0.1925` | consistent: `γ` is a minimum, not only a bound | — |
| degenerate inputs | `k = 0`; `n = 0`; `k > n` | excluded by `hk : 1 ≤ k` and `hkn : k ≤ n` (these force `n ≥ 1`). Without `hkn`, `σ_k ≡ 0` and `f = 0^{1/k} = 0`, so the product `0` ≠ `γ` | hypotheses needed and present | — |
| junk value of `fderiv` | base of `rpow` at `e` | `eval 1 (esymm k) = binom(n, k) > 0`, so `x ↦ x^{1/k}` is smooth there and `fderiv` is the genuine derivative, not the junk `0` | holds | — |
| plausible wrong constant | `(binom(n, k)/n)^n` without the `1/k` power, at `(3, 2)` | `(3/3)^3 = 1` against the computed `0.192` | rejected by the new conjunct, which fixes the constant exactly | — |
| membership of `e` | `1 ∈ hessianCone n k` | `σ_j(e) = binom(n, j) > 0` for `1 ≤ j ≤ k ≤ n` | `e` lies in the cone, so attainment is inside `Γ_k` | — |
| README restatement | `binom(n − 1, k − 1) = (k/n)·binom(n, k)` at `(3, 2)`, `(4, 2)` | `2 = (2/3)·3`; `3 = (2/4)·6` | holds | README §2.5 |

## Checks run

- **Elaboration.** Ran `lake env lean packages/ComplexHessianEquations/Suggested.lean` from the content checkout. It exits 0 with 18 warnings, all `declaration uses 'sorry'`, one per theorem. There are no errors. The file still has no `set_option`, no `lemma` and no sorried data, and its imports are unchanged.
- **Signature check.** I copied `Suggested.lean` to a scratch file and appended `#check @name` for all 32 declarations and the 11 fields of `AdmissiblePair`, then elaborated it once.
  - `exists_hessianPair` elaborates to the README statement with the new last conjunct `∏ j, (fderiv ℝ P.f 1) (Pi.single j 1) = (↑(n.choose k) ^ (1 / ↑k) / ↑n) ^ n`.
  - All 7 manifold theorems keep `[FiniteDimensional ℂ E]`, `[IsManifold 𝓘(ℂ, E) ∞ X]`, `[T2Space X]` and `[CompactSpace X]`: `eq_of_isNormalizedSolution`, `existsUnique_yau`, `exists_formPowIntegral_exp_le` and the four Layer 8 theorems.
  - Five definitions lack some of these binders: `hermitianForm`, `ddbarHermitianForm`, `IsRelEigenvalueVector`, `formPow` (keeps `IsManifold`) and `IsNormalizedSolution`. Their bodies do not need them, and every theorem that uses them carries them. No change was needed.
  - No other signature changed.
- **Dependency check.** Output of `gate --depcheck`: `depcheck: 242 roadmaps, 2263 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.
- **README–Lean agreement.** No Lean name was added or removed. `exists_hessianPair` is still named in README §2.5, and the README statement now has the same content as the Lean conjunct.
- **Sources.** The only new locator is gpt2023 line 744–769 (Lemma 4). The manifest's `gpt2023` entry already lists `2.5` in `cited_for`, so `sources.toml` is unchanged. No new source was needed, and `needs-references.toml` was not written.

## Gate failures

None were listed for this round.

## For the maintainer

- `exists_hessianPair` keeps its name and gains one conjunct at the end. Nothing in this roadmap destructures its conclusion. A consumer elsewhere that reads the `IsStructural` component now finds it as the left part of a final `∧`.
- No new object was introduced, so the repair raises no ownership question. Ownership against open pull requests was not re-checked this round, beyond confirming that no new carrier was added.
- `plan.json` and `metadata.toml` are unchanged.
