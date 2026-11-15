# Repair of DiracScatteringAndNonlinearFourierTransform (design, round 9)

This round answers the findings of `REV-DESIGN-DiracScatteringAndNonlinearFourierTransform~8`. The verdict was
`needs_changes`, with five P3 findings and no P1 or P2. Files edited:

- `packages/DiracScatteringAndNonlinearFourierTransform/design/README.md`
- `packages/DiracScatteringAndNonlinearFourierTransform/design/plan.json`

`sources.toml` is unchanged, because no new work is cited. There is no `Suggested.lean` at the design stage, so
the `#check` comparison does not apply. Each finding was checked against the cited source lines, the pinned
Mathlib (`1b1ccf4`) and the README's own definitions before it was edited. The section "For the human reviewers"
of the review asks for no edit, and none was made for it.

## F01 (P3) — applied

Verified. poltoratski2024 line 1360–1369 bounds the integral of `log|a_{t₁→t₂}|` over `J(s)`, not the
integrand. By §9.2, `|a|² = 1 + (sin² Re e + sinh² Im e)/N²`, so `|a| = 1` where `e = 0`. Computed values:
`log|a| = 0` at `p = s` and `0.000379` at shift `0.1` (`υ = 1`, `Im e = 0`). The mean over `[−0.1, 0.1]` is
`0.000126`.

Old → new: "`log|a_{t₁→t₂}| ≥ c_m > 0` on `ℝ ∩ Q(s, C/2ⁿ⁺¹)`" → "`∫_{J(s)} log|a_{t₁→t₂}| ≥ c_{m,C}|J(s)|`". The
route now names the sweep `e(p) = e(s) + (t₂ − t₁)(p − s) + o(1)`, of length `C/(3m)`. It also names
`log|a| ≥ 0` on `ℝ` (§4.3), which the index-two cover needs.

Further changes:

- §4.3 is added to the *Needs:* line of §9.3.
- The witness is added as a fourth Check.
- plan.json 9.3 is mirrored: statement, test and prerequisites.
- §8.9's application sentence now says that §9.3 applies §8.9 at points `p ∈ J(s)` with the numbers `w(s)` and
  `w̃(s)`, so that it matches the new route.

## F02 (P3) — applied

Verified. `E(0, ·) = 1` has `|E#| = |E|`, so it is not Hermite–Biehler (§3.3 Check), and §6.1 defines `B(E)`
only for Hermite–Biehler `E`. §6.2 and §6.3 are stated for `t > 0`.

Old → new in §6.6: "for every `t ≥ 0`" → "for every `t > 0`", and the uniqueness clause "for all `t`" → "for
all `t > 0`". Uniqueness is unaffected, because `k_ε = sin(εx)/x ∈ PW_ε` for every `ε > 0`. A `t = 0` Check is
added (`PW_0 = {0}`). plan.json 6.6 is mirrored: statement, hypothesis "t > 0, F ∈ PW_t", and test. No other
statement about `B(E(t,·))` quantifies over `t ≥ 0`: the only other `t ≥ 0` statements are §2.7, §3.1, Layer 4
and §6.4's disc, and none of them uses `B(E)`.

## F03 (P3) — applied

Verified. In §6.4 the identity appeared only as a Check, yet §6.5's compact-support and truncation bullets and
§6.8's `w_T = |E(T, ·)|^{−2}` and Examples all rely on it.

Old → new: a new §6.4 API bullet says that if `q = 0` a.e. on `(T, ∞)`, then `m = −Ẽ(T, ·)/E(T, ·)` on `ℂ₊`. Its
proof: for `t ≥ T`, `u − iv = e^{−i(t−T)z}(Ẽ(T) + wE(T))` and `u + iv = e^{i(t−T)z}(Ẽ#(T) + wE#(T))`. The
old Check becomes a computed test (below). plan.json 6.4 is mirrored: a new api entry, and the test is replaced.

The new Check was computed by numerical integration for `f = 1` on `[0, 1]` at `z = i`:

- `m(i) = i/(1 + √2 tanh √2) = 0.443190i`.
- `u − iv = 0` at `t = 1`, to `3·10⁻¹⁶`.
- `∫₀^∞|Φ + mΘ|² = 0.401791 + 0.041399 = 0.443190 = Im m(i)`.
- `w = m + 0.01` gives `|u − iv| = 0.0491` at `t = 1`, so the solution grows.
- The boundary points `−D/C = 0.591892i` and `−B/A = 0.385819i` are a diameter apart (`2 × 0.103037`).

The formula also reproduces the masses of §6.5's Check: `0.537329`, `0.443190`, `0.415910`, `0.414219`.

## F04 (P3) — applied

Verified, and the pattern is wider than the four lines named. A script compared every layer's *Needs:* lines
with its Dependencies line. Changes, old → new:

| Layer | Added to the Dependencies line |
|---|---|
| 1 | contraction mapping, chain rule, `EuclideanSpace` coordinates, strongly measurable limits |
| 2 | Bochner integration, analyticity, Euclidean model of `ℂ`, differentiation under the integral, Lebesgue decomposition, convergence in measure; Tau Ceti Jensen bound |
| 3 | Mathlib (`2 × 2` determinants, `Matrix.toEuclideanCLM`) |
| 4 | "Layer 1 (§1.3, §1.6)"; Tau Ceti (half-plane primitives); Mathlib (Riemann–Lebesgue) |
| 5 | Tau Ceti (Young); Mathlib (locally uniform limits, convergence in measure, Fourier kernel) |
| 6 | "Layer 1 (§1.1–§1.3)" (§6.3 needs §1.2); boundary Cayley map, lower semicontinuity of entropy; differentiation under the integral, Lebesgue decomposition, characteristic functions |
| 7 | Layer 1 (§1.6) |
| 8 | §2.1; Mathlib (quantitative inverse function theorem, mean value inequality) |
| 9 | Mathlib (Borel–Cantelli, Taylor, `sinh`) |

The same pattern also appeared in "How to read the build", which said "Layer 6 uses Layer 5 only for the
Szegő condition". No Layer 6 *Needs:* names §5, and §6.8 uses §4.4. Old → new: "Layer 6 does not use Layer 5:
the Szegő condition needs only … §4.4 and the truncations of §6.5". plan.json has no per-layer dependency field.

## F05 (P3) — applied differently

Verified at the pin:

| Declaration | File, line |
|---|---|
| `Real.tendsto_integral_exp_smul_cocompact` | `RiemannLebesgueLemma.lean` 205 |
| `ApproximatesLinearOn.surjOn_closedBall_of_nonlinearRightInverse` | `ApproximatesLinearOn.lean` 143, in namespace `ApproximatesLinearOn` |
| `HasStrictFDerivAt.toOpenPartialHomeomorph` | `InverseFunctionTheorem/FDeriv.lean` 118 |
| `taylor_mean_remainder_lagrange` | `Taylor.lean` 330 |

Old → new in the *Needs:* lines:

- §4.2: "Mathlib Riemann–Lebesgue lemma" → `Real.tendsto_integral_exp_smul_cocompact`.
- §9.5: "Taylor expansions of `Real.sinh`" → `taylor_mean_remainder_lagrange` and `Real.contDiff_sinh`
  (`DerivHyp.lean` 317).
- §8.9: "inverse function theorem for holomorphic maps" → three declarations:
  - `ApproximatesLinearOn.surjOn_closedBall_of_nonlinearRightInverse`;
  - `ContinuousLinearEquiv.toNonlinearRightInverse` (`Normed/Operator/Banach.lean` 66), which supplies its
    right-inverse argument;
  - `Convex.norm_image_sub_le_of_norm_fderiv_le'` (`MeanValue.lean` 550), whose conclusion is the
    `ApproximatesLinearOn` hypothesis.

All of these are added to `### From Mathlib` with their file and line, and mirrored in plan.json 4.2, 8.9 and
9.5. §8.9's route now gives the quantitative step on the disc of radius `c/t`.

Why "differently": `HasStrictFDerivAt.toOpenPartialHomeomorph` is not named. It is qualitative and gives no
radius, so it cannot yield `|a − s| ≤ D₂ε/t` with `D₂` uniform in `t`. Two declarations the review did not list
are named instead, because the quantitative lemma needs them.

## Adversarial pass on the changed statements

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §9.3 integral bound | `υ = 1`, `Im e = 0`, `e(s) = 0` | `log|a| = 0` at `p = s`, `0.000379` at `0.1`; mean `0.000126` | pointwise false, integral true | F01 |
| §9.3 constant `c_{m,C}` | windows of length `L = 0.1, 1, 3` centred at a zero of `sin` | mean of `sin²` is `0.000833`, `0.0793`, `0.4765` (`½ − sin L/(2L)`); `log(1 + y) ≥ y/(1 + y_max)` | positive constant | none |
| §9.3 sweep | `|J(s)| = 2C/2ⁿ⁺¹`, `t₂ − t₁ = 2ⁿ/(3m)` | range `[−C/(6m), C/(6m)]`, length `C/(3m)` | holds | none |
| §9.2 modulus identity | algebra | `sinh²(ε₂ + 2υ) − sinh² ε₂ = sinh 2υ sinh(2υ + 2ε₂)`, so `|a|² = 1 + (sin² ε₁ + sinh² ε₂)/N²` | holds | none |
| §6.4 compact support | free case, any `T` | `−Ẽ/E = (i e^{−iTz})/e^{−iTz} = i = m` | holds | F03 |
| §6.4 compact support | `f = 1` on `[0, 1]`, `z = i` | `m(i) = 0.443190i`; `u − iv = 3·10⁻¹⁶`; `∫ = 0.401791 + 0.041399 = Im m(i)` | holds | F03 |
| §6.4 wrong models | `−D/C`, `−B/A`, `m + 0.01` | `0.591892i`, `0.385819i` (boundary: equal moduli `0.73083`, `0.28197`); `|u − iv| = 0.0491` | excluded | Check |
| §6.4 compact support at `T = 0` | `q = 0` on `(0, ∞)` | `−Ẽ(0)/E(0) = −(−i)/1 = i` | free case | none |
| §6.6 at `t = 0` | `E(0, ·) = 1` | `|E#| = |E|`; `B(E)` undefined; `PW_0 = {0}` | excluded by `t > 0` | F02 |
| §6.6 uniqueness for `t > 0` | `k_ε = sin(εx)/x`, `e^{iax}k_ε` | in `PW_ε`, `PW_{ε + |a|}` for every `ε > 0` | unaffected | none |
| §8.9 quantitative step | `|g″| ≲ t²`, `|g′(s)| ≥ t√(ww̃)/cosh²(5C)` | `|g′ − g′(s)| ≤ |g′(s)|/2` on radius `c/t`; image contains radius `|g′(s)|r/2`; target within `O(ε)` (`|cos(…)| ≥ sinh 1`) | `r = O(ε/t)` | route text |
| §9.5 Taylor input | `F_υ = sinh x/sinh(υ + x)` at order two | `F(0) = 0`, `F′(0) = 1/S`, `F″(0)/2 = −C/S²` | matches route | none |

## Checks

Dependency check (run after the last edit):

```
candidate: DiracScatteringAndNonlinearFourierTransform is not in the merge order yet; checked as if placed after AutomorphicSpectralTheory (the intake inserts it when its design is accepted)
depcheck: 245 roadmaps, 2233 edges, 0 problem(s)
```

The output has no UPWARD and no CYCLE line.

Other checks:

- **Citations.** `roadmaps resolve` reports no cross-roadmap citation and no Lean name found nowhere. That tool
  does not check names outside TauCetiRoadmap. The six Mathlib names added this round were each opened at the
  pin, at the file and line cited.
- **plan.json.** The file parses. The statement, api and tests of 4.2, 6.4, 6.6, 8.9, 9.3 and 9.5 each appear
  verbatim in the README (after whitespace normalisation).
- **Style of the added lines.** No LaTeX delimiters, process words or machine paths.

## For the maintainer

- No cross-roadmap citation and no supplier changed. No id cited by other roadmaps was renamed or dropped.
- This round adds no new target, construction or owned object, only API, Checks and Mathlib citations, so it
  needed no ownership search against open pull requests.
- No source text was copied, and no suspicious instructions were found in the review text.
