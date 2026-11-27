# Review of LaxEquivalenceAndFiniteDifferenceSchemes (pull request #3214 at 4759bb5)

**Verdict:** needs changes

**Summary.** Needs changes, for one sentence: the Check of 1.1 that the exact scheme `C τ = S τ` is stable is false on an incomplete normed space, which is the generality the Conventions fix for Layer 1; adding "on a Banach space" repairs it. Every theorem of 1.2–1.5 and 2.2–2.5 was recomputed (routes, thresholds, degenerate grids, both directions of each equivalence) and stands as stated, in the README and in `Suggested.lean`. There are two small corrections and one format note, none blocking. For the human reviewers: the two texts the locators point into are an unpublished book draft and lecture notes, and the refereed origin (Lax–Richtmyer 1956) is cited by attribution only.

## R01 (P2) — The Check of 1.1 that the exact scheme is stable fails on an incomplete normed space

The third Check of 1.1 (README line 107) says that `C τ = S τ` is "stable with `K` the bound of `‖S t‖` on `[0, T]`". The Conventions take `X` to be a real normed space, with completeness stated where needed, and the Check of 1.4 works on an incomplete `X`; on such a space the bound need not exist, so a reader takes from this Check that the exact scheme is always stable, and it is not.

A witness: let `X` be the finitely supported real sequences with the supremum norm, split into the blocks `span(e_(2k), e_(2k+1))`, `k ≥ 1`, and let `S t` act on the `k`-th block by `e^(−kt) (1 + t k² N)`, where `N e_(2k+1) = e_(2k)`, `N e_(2k) = 0`. This is `exp(t(−k + k² N))` on each block, so `S 0 = 1` and `S (s + t) = S s ∘ S t`; each orbit lies in finitely many blocks, so it is continuous at `0`; and `‖S t‖ = sup_k e^(−kt)(1 + k² t)` is finite for every `t` (at `t = 1/2` it is about `1.23`). So `S` is a `StronglyContinuousSemigroup X` in the sense of `TauCeti/Analysis/Semigroups/Basic.lean` (the structure asks only for these three axioms). But `‖S (1/k)‖ ≥ (1 + k)/e`: `4.05` at `k = 10`, `37.2` at `k = 100`, `368` at `k = 1000`. With `n = 1` and `τ = 1/k` this violates `‖C τ ^ n‖ ≤ K` for every `τ₀ > 0`, `K` and `T > 0`, so the exact scheme is not stable (it is consistent with `D = X` and convergent). The bound the Check invokes is Tau Ceti's `existsGrowthBound`, which is under `[CompleteSpace X]` (`GrowthBound.lean`, lines 129–136).

The smallest change: begin the Check "On a Banach space, the exact scheme …". The sentence of 1.1 that the generator form and the semigroup form of consistency agree (lines 94–97) rests on the same bound and would take the same three words. The witness above could also be added as a second negative control beside the one in 1.4: an exact scheme that is convergent and unstable.

## C01 — Stability in 1.1 is not Trefethen's (4.2.8) as it stands: the restriction to `τ ≤ τ₀` is added here

The paragraph after the definitions (line 92) says "Stability and convergence are those of Trefethen, (4.2.8) and (4.2.7)" and names one difference, in convergence. Trefethen's (4.2.8) asks for the bound for all `n` and `k` with `0 ≤ nk ≤ T` (his chapter 4 text, lines 297–299), with no upper limit on the step, whereas `IsStableScheme` asks for it only for `0 < τ ≤ τ₀`. The two differ: with `T = 2`, the family `C τ = (τ − 1)⁻¹ · 1` for `1 < τ ≤ 2` and `C τ = 1` otherwise is stable here (`τ₀ = 1`, `K = 1`) and unbounded at `n = 1`, `τ ↓ 1`. The restriction is the right one (convergence sees only small steps, so 1.4 would be false without it); the sentence should say that it is added, for example "… Trefethen asks for the bound at all steps with `n k ≤ T` and for `n k = t` exactly; here stability is asked for `τ ≤ τ₀` and convergence for `n j τ j → t`."

## C02 — The Conventions say every statement about `B⁻¹ A` assumes a nonvanishing `ρ_b`, but 2.4 is stated without it

The bullet on two-level schemes (line 61) says "Every statement about `B⁻¹ A` assumes that `ρ_b` does not vanish where it is evaluated". Theorem 2.4 makes no such assumption: for `w < 0` and `1 + 4wμ ≤ 0` it quantifies over all `N`, including those where the matrix of `b` is singular (for `w = −1/4`, `μ = 1`, `ρ_b(π) = 0` and `B` is singular on every even grid) and the step matrix is `0 · A = 0`. The route of 2.4 treats this correctly, by choosing a prime grid size on which `B` is invertible, so the theorem and its Lean statement are right; only the convention is too strong. Say "Statements 2.2 and 2.3 assume …; in 2.4 the junk value on grids where `B` is singular is harmless, as its route shows."

## N01 — A locator is available for the weighted family in 2.4

2.4 says the weighted family and its threshold are proved here, which is true of the proof; the family itself with weight in `[0, 1]` is posed in Trefethen, Exercise 4.4.1, p. 170 (the "theta method"), without an answer. Citing it would let a reader find the classical name and see that the case `w ∉ [0, 1]` is the part with no source.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.1 definitions and Checks | `X = ℝ`, `C τ = 1 + τ`; `T = 0`; exact scheme on incomplete `X` | `(1+τ)ⁿ ≤ e^T` on `nτ ≤ T`; `T = 0` forces `n = 0`, `‖1‖ ≤ 1`; exact scheme: `‖S(1/k)‖ ≥ (1+k)/e` | third Check false without completeness | R01 |
| 1.1 against Trefethen (4.2.7), (4.2.8) | family equal to `(τ−1)⁻¹` on `(1, 2]` | stable with `τ₀ = 1`; `‖C τ‖ → ∞` as `τ ↓ 1`, so not (4.2.8) | definitions differ by `τ₀` | C01 |
| 1.2 `norm_pow_apply_sub_le` | Euler `T = τ₀ = 1`, `τ = 1/2`, `n = 2`; `n = 0`; `ℝ²` control | error `e − 9/4 = 0.468`; bound `e²(e−2)/2 = 2.65`; `n = 0`: `0 ≤ KcTτ^p` as `K ≥ ‖1‖`, `c ≥ 0`; control `τ²(2ⁿ−1)` | holds; telescoping terms have `kτ, (n−1−k)τ ≤ T` | none |
| 1.3 `norm_add_pow_le` | `C = 1`, `B = Lτ`; `B = τ^(1/2)` | `(1+LT/n)ⁿ ↑ e^(LT)`; word count `K ∑ binom(n,j)(KLτ)^j = K(1+KLτ)ⁿ`; `(1+√τ)^(T/τ) ~ e^(T/√τ)` | holds; `L ≥ 0` from `τ > 0` | none |
| 1.4 `IsConvergentScheme.isStableScheme` | rank-one perturbation on finitely supported sequences | `(C τ − 1)² = 0`; `‖C τ e_k‖ = max(1, 1/τ)`; `C τ x = x` once `1/τ` exceeds the support | holds; completeness needed | none |
| 1.5 `isConvergentScheme_iff_isStableScheme` | `C τ = 1` against `e^t`; 1.2 with `p = 0`, `c = ε` | `|1 − e^τ||e^t x| ≥ τ|x|`; `‖Cⁿx − S(nτ)x‖ ≤ KεT` for `τ ≤ min(τ₀, δ/2)` | holds; route's inputs exist under `[CompleteSpace X]` | none |
| 2.1 `stencilSymbol`, `stencilMatrix` | `a = 2δ₋₁ + 3δ₀ + 7δ₂`; `N = 1, 2` | `circulant v` entry `v(i−j)` gives `∑ a_m u(j+m)`; eigenvalue on `e^(2πijk/N)` is `ρ_a(2πk/N)`; `N = 2`: `δ₁ = δ₋₁` | orientation and symbol sign agree | none |
| 2.2 `norm_toEuclideanCLM_pow` | explicit heat `μ = 1` on `ZMod 2`; `ZMod 3`; `n = 0` | `Q = [[−1,2],[2,−1]]`, eigenvalues `1, −3`, norm `3 = |1−4μ|`; `ZMod 3`: `1, 1−3μ`; `n = 0`: `1 = 1` | holds; `v̂(k) = ρ_a(θ_k)` with Mathlib's `e(−jk/N)` | none |
| 2.3 `exists_forall_norm_pow_le_iff` | `a = δ₀`, `b = δ₀ − δ₁` | left side true (`0`-inverse, powers `1, 0`); right side false: `2 − 2cos(0.1) = 0.00999 < 1` | hypothesis needed; both directions hold with it | none |
| 2.4 weighted heat | `w = 0, μ = −1`; `w = −1/4, μ = 1`; `1 + 4wμ ≤ 0` | `g(π) = 5`, `−2 ≤ 1`; `s* = −1/(4wμ)`, `ρ_a(s*) = −4μs* ≠ 0`; `2(1−2w)μ ≥ 2μ+1 > 1`; `ρ_a + ρ_b = 2 − 4(1−2w)μs` | iff holds for all real `w`, `μ ≥ 0` | C02 (convention only) |
| 2.5 transport | upwind `ν = 1.01`, `−0.01`, `2` on `ZMod 2`; LW `ν = 1`; centred on `ZMod 4` | upwind `|ρ|² = 1 − 4ν(1−ν)s`: `1.0404` at `θ = π`; norm `3`; LW `|ρ|² = 1 − 4ν²(1−ν²)s²`, coefficients `(1,0,0)`; centred `(1+ν²)^(n/2)` | three equivalences hold; Lean stencils match | none |

- Source locators checked against the text: 14 (Trefethen (4.2.4)–(4.2.8), Theorems 3.3, 3.4, 4.1, 4.2, 4.3, 4.8, Examples 4.4.1–4.4.4, Tables 4.4.1–4.4.2, the Trotter remark; Chern Theorems 2.2 and 4.1 and the heat example), all at the stated pages.
- Library declarations opened at the pins: 24 (Tau Ceti `StronglyContinuousSemigroup`, `map_natCast_mul`, `realOperator_def`, `existsGrowthBound`, `HasGrowthBound.bound`, `tendsto_realOperator_apply`, `ofBounded`; Mathlib `banach_steinhaus`, `Matrix.toEuclideanCLM`, `l2_opNorm_toEuclideanCLM`, `l2_opNorm_diagonal`, `CStarRing.norm_mul_coe_unitary`, `norm_coe_unitary_mul`, `Matrix.circulant`, `circulant_single_one`, `ZMod.dft_apply` and the elementary ones), all present with the stated hypotheses.
- Cross-roadmap citations resolved: 2 (SamplingAndDiscreteFourierAnalysis §1.1 `dft_inner`, §2.1 `dftMatrix_mul_circulant`, on main, statements as quoted) and OneParameterSemigroups Part A (completed).
- Dependency check: `depcheck: 94 roadmaps, 1054 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the roadmap folder. Automatic checks: all passed. Elaboration of `Suggested.lean`: eight `sorry` warnings, nothing else. The 13 elaborated signatures were compared with the README statements: no binder lost, generality equal.
- One-tactic probe on a copy of the file (`simp`, `rfl`, `infer_instance`, `norm_num`, `aesop`, `simp` with the definitions unfolded, `exact?`): none of the eight theorems closed. All eight headline theorems of the README are stated; none is absent or stood in for.

Overlap check: read ExponentialIntegrators, SymmetricHyperbolicSystems, SamplingAndDiscreteFourierAnalysis (and OneStepMethodsForODEs, LinearMultistepMethods by search); nothing shared. SymmetricHyperbolicSystems owns Friedrichs' scheme on the lattice `hℤⁿ` by the energy method and no abstract scheme predicates; SamplingAndDiscreteFourierAnalysis owns Parseval and the circulant diagonalisation, cited here.

Source independence: 8 passages compared with 2 sources, none shared; largest share Trefethen's text, 12 of 19 locators; contents compared with its chapters 3 and 4: independent (Layer 1 draws on §4.2 only and orders it by dependency, 1.2 → 1.5; Layer 2 combines §3.5 and §4.4 on a different carrier). Lax–Richtmyer 1956 could not be read.

Research link: The headline is the equivalence theorem of Lax and Richtmyer (1956); Layer 2 is von Neumann's criterion as in Trefethen (1996, §4.4) and Chern (2018, §2.2). The README's scope section offers Layer 1 to later convergence proofs for discretisations of linear evolution equations. Rests on the README and on the two texts read.

## Not verifiable

- Lax and Richtmyer, Comm. Pure Appl. Math. 9 (1956): paywalled at the publisher, no open copy; the README cites it by attribution and DOI only, with no locator, so nothing depends on its text.
- Whether a public Lean formalisation of these statements exists was not searched beyond the pinned libraries and the open roadmaps.

## Source issues

- **Error** in Trefethen 1996 (chapter 4 file) at (4.2.8) and Theorem 4.1, pp. 156–157: the source says stability is a bound for all steps with `nk ≤ T`, and equates it with convergence as `k → 0`; it should be restricted to steps below some `k₀`, since convergence does not see large steps; affects a stated result.

## For the human reviewers

- Scope: the two texts all locators point into are an unpublished book draft (Trefethen, author's page, chapters dated 1994, proofs of Theorems 4.1–4.3 marked not yet written) and lecture notes (Chern 2018). The refereed origin, Lax–Richtmyer 1956, is cited without locators.
- Not tested: Lax–Richtmyer 1956 could not be read; the README's attributions to it ("due to Lax and Richtmyer") were not checked against its text.
