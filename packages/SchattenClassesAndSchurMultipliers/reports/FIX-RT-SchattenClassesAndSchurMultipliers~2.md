# FIX-RT-SchattenClassesAndSchurMultipliers~2

Repair of red-team round 2 (passes a and b) on `packages/SchattenClassesAndSchurMultipliers/`.
Only `README.md` changed; `Suggested.lean`, `metadata.toml`, `sources.toml` and `design/plan.json`
are untouched. Nine findings, eight sections (2a/F03 and 2b/F04 are the same defect).

## RT-SchattenClassesAndSchurMultipliers~2a/F01 (P3) — applied

Verified (cgpt-2023 line 380): with cubes inside one fundamental domain, `f(z) = z e` has seminorm
`0.289` and its translate by `1/2` has `1/2`. Old: "in `𝕋ⁿ` of side at most `1`". New: a torus cube
is the image of a cube of `ℝⁿ` of side `≤ 1` and may wrap. Also changed: the §10.1 invariance
bullet, a Check, §10.3 and Conventions.

## RT-SchattenClassesAndSchurMultipliers~2a/F02 (P3) — applied

Verified (cgpt-2023 lines 380, 404–406): `Q = 8^k S`, `S ⊂ [−1/2, 1/2]ⁿ`, so the side is up to `8^k`.
Old (§10.3): "to cubes of side up to `8^k/2`". New: "by the factor `8^k` to cubes of side at most
`8^k`". No other occurrence.

## RT-SchattenClassesAndSchurMultipliers~2a/F03, RT-SchattenClassesAndSchurMultipliers~2b/F04 (P3) — applied

Same defect. `1_{[0, 2]} E₁₁` has support of measure `2` and `τ₂ = 2`. Old label (§9.2 Checks):
"Tracial picture, a projection of infinite-measure support". New: "Tracial picture, a projection of
finite trace on a space of infinite measure". Values `2`, `2^{1/p}`, `1` unchanged and recomputed.

## RT-SchattenClassesAndSchurMultipliers~2a/F04 (P3) — applied differently

§9.5's route bounds the multiplier of `M_m|_{Q_R × Q_R}` by `‖S_{M_m}‖_p`, so §3.7 is now in §9.5's
*Needs*, and the route names that step. §9.3 states no norm of that multiplier: its intertwining
bullet now names the §3.1 multiplier on `L²(F)`, and its *Needs* stays as it was.

## RT-SchattenClassesAndSchurMultipliers~2b/F01 (P2) — applied

Witness confirmed: `T R E₀₀ = w₀`, `‖w₀‖₁ = ∞ > 0 · ∞`. Old (§1.4): unconditional
submultiplicativity. New: it holds except when the outer norm is `0` and the inner is `∞`, which
needs `p < 2` and `‖S‖₂ = ∞`. Also added: a §1.4 Check, and a §3.5 note that Schur multipliers have
no exception.

## RT-SchattenClassesAndSchurMultipliers~2b/F02 (P3) — applied

Old (§1.4): "`V : K → K'`, `W : H' → H`, `A ↦ V A W`". New: "`V : H → K`, `W : K → H`,
`A ↦ V A W : S₂(H) → S₂(K)`", an isometry `U : H → K`, and `B ↦ U* B U : S₂(K) → S₂(H)`. The
uses in §2.4 and §5.1 have this shape.

## RT-SchattenClassesAndSchurMultipliers~2b/F03 (P3) — applied

§3.3 (the anchor of `schurNorm`) had no Checks. Added four: a one-point space of mass `w`
(`‖S_M‖_p = |c|`); normalisation in `S_p`, not `S₂` (`1` against `√2` at `A = I/√2`); the
triangular truncation (`‖M‖_∞ = ‖S_M‖₂ = 1`, `‖S_M‖_∞ = 2/√3`); strict lower semicontinuity
(`M_k = 1_{(k,k)} → 0`, norms `1` against `0`).

## RT-SchattenClassesAndSchurMultipliers~2b/F05 (P3) — applied

`fourier_gaussian_innerProductSpace` is at the pin
(`Mathlib/Analysis/SpecialFunctions/Gaussian/FourierTransform.lean`, line 353, root namespace):
`𝓕(v ↦ e^{−b‖v‖²})(w) = (π/b)^{finrank/2} e^{−π²‖w‖²/b}` for `0 < Re b`. Added it to "From
Mathlib", to the §9.4 text (`𝓕γ_T = Tⁿ γ_{1/T}`, `b = π/T²`), to §9.4 *Needs* and to Layer 9
Dependencies. No other Gaussian Fourier transform is used.

## Checks run

- `lake env lean packages/SchattenClassesAndSchurMultipliers/Suggested.lean` (from the content
  checkout): exit 0, 11 warnings "declaration uses `sorry`" (lines 97, 107, 120, 130, 143, 165,
  177, 196, 207, 248, 277), no errors. All five `TauCeti.*` object files were present; nothing
  was built.
- Signatures: I put `#check @name` for all 19 declarations into one scratch file and elaborated it
  once. Each elaborated type matches its README statement and the worker's listing. The Lean file
  was not edited, and no binder was lost or changed.
- Dependency check (the brief's command): `depcheck: 235 roadmaps, 2237 edges, 0 problem(s)`.
  There is no UPWARD, CYCLE or `moved:` line.
- `roadmaps resolve` on the README found no cross-roadmap citation and no Lean name missing.

No gate failures were listed for this round.

## Adversarial pass on the changed statements

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| §1.4 composition law | `p = 1`, `T` (norm `0`) after `R` (norm `∞`); reverse order; `p = 2`, `‖S‖₂ = 0`; transpose `t` on `M₂` at `∞` with a unitary conjugation | `∞` against `0·∞ = 0` (excluded case); `0 ≤ ∞·0 = 0`; `S = 0` on `S₂`, so `0 ≤ 0`; `2 ≤ 1·2` | holds outside the stated exclusion; the exclusion is sharp |
| §1.4 `A ↦ V A W` | `H = ℂ`, `K = ℂ²`, `V = U = e₁`, `W = U*`; §2.4 `ν = δ₀ ≪ δ₀ + δ₁` | `V a W = a E₁₁`, norm `|a| ≤ 1·1·|a|`; `U*(U a U*)U = a`; `U A U* = A E₀₀` | typed and true |
| §3.5 `‖S_{MN}‖ ≤ ‖S_M‖ ‖S_N‖` | `M = 0`, `‖S_N‖ = ∞`; `M = N` triangular truncation at `∞`; `M = N = [[1,2],[2,1]]` | `0 ≤ 0·∞ = 0`; `2/√3 ≤ 4/3`; `MN = [[1,4],[4,1]] = (5/2)J − (3/2)vvᵀ`, so `4 ≤ 2·2` | holds with no exception |
| §3.3 Checks | point of mass `w`, `M = c`; `M₂`, `A = I/√2`; triangular truncation; `1_{(k,k)}` on `ℕ` | `|c|`; `‖A‖₂ = 1`, `‖A‖₁ = √2`; random search over unitaries gives `1.15470054 = 2/√3`; `‖S_{M_k}‖_p = 1`, limit `0` | consistent with §3.1, §3.4, §4.2 |
| §9.2 Check label | `1_{[0,2]}E₁₁` on `ℝ` | `τ₂(|g|^p) = 2`, norm `2^{1/p}`, `1` at `∞` | label now matches the values |
| §9.3 intertwining | kernel identity; `m = e_a` | `1_F(s) m(s−t) ǧ(s−t) 1_F(t) = M_m(s,t)·k_{Λ_F(g)}(s,t)`; `Λ_F(g(·−a)) = D_{e_a} Λ_F(g) D_{e_a}*`, matching the §9.3 Check | true |
| §9.5 route, restriction step | `m = 1` | restricted multiplier `= id` on `L²(Q_R)`, `1 ≤ 1` | §3.7 is used and now listed |
| §9.4 Gaussian transform | `n = 1`, `T = 1`; `T = 2` | `b = π`: `e^{−πw²} = γ₁`; `b = π/4`: `2 e^{−4πw²} = 2γ_{1/2}` | matches `Tⁿ γ_{1/T}` |
| Torus cubes (Layer 10 header) | `f = z e` on `𝕋`: intervals in `[0,1)`, arc `[3/4,5/4)`, arcs `[1−h,1+h)`; translate by `1/2` | variance `≤ 1/12` (seminorm `0.289`); `7/48` (`0.382`); `1/4 − h/2 + h²/3` (`0.2033` at `h = 0.1`, `0.2450` at `h = 0.01`), sup `1/4`; translate `1/2` under the fundamental-domain reading | wrap-around definition is translation invariant; the old reading is not |
| §10.1 Checks after the change | column/row `Σ 1_{I_k}E_{k1}`; `e^{2πiz}e`; `1_{[0,1/2)}e` | `1 − Σ a_k² ≤ 1 − 1/N` and Popoviciu `≤ 1/2` for every probability vector `a`, so values unchanged; `|mean| = |sin πL/(πL)|` on every arc, `1`; `1/2` | unchanged |
| §10.1 dyadic comparison | dyadic cubes and `𝕋ⁿ` | both are torus cubes (`𝕋ⁿ` is the image of `[0,1)ⁿ`); a larger family only raises the right side | unchanged |
| §10.3 rescaling and wrapped cubes | `S = 𝕋ⁿ`; a wrapped arc of `𝕋` | side `8^k`; `π_k J_k(A)` is `ℤⁿ`-periodic since `m_k ∈ ℤⁿ`, the lift has the same average, translation of small cubes via `u_k(c_Q)` holds for every `c_Q ∈ ℝⁿ` | the source's argument covers wrapped cubes |
| §10.1 invariance bullet | reflection on `𝕋`; dilation on `𝕋` | arcs go to arcs; `z ↦ 2z` is not invertible on `𝕋`, so dilations are claimed on `ℝⁿ` only | scoped correctly |

## Sources

No new source was fetched and `sources.toml` is unchanged. I read cgpt-2023 lines 240–270 and
340–460 (Mei's BMO, the periodisation and Lemma 1.3 with its proof) from the cached text. No
`needs-references.toml` entry was added.

## Ownership

No new object or construction was introduced. The torus cube is part of this roadmap's own
Layer 10 seminorm, and the other changes are hypotheses, typings, Checks and *Needs* entries. No
ownership question arises, and no cross-roadmap citation changed.

## For the maintainer

- No section, target or Lean name changed, so the citations of other roadmaps are unaffected.
- `Suggested.lean` is unchanged (19 declarations, 11 with `sorry`).
- Gaps are unchanged: `sigma-finite-hilbert-schmidt-kernels` and
  `semifinite-martingale-bmo-interpolation`, both in `design/plan.json` and the supplier
  contracts.
