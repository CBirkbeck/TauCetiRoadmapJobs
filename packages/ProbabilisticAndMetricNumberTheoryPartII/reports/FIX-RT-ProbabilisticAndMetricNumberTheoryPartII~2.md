# Repair of red-team round 2 (passes a and b)

Findings of review r2a (`RT-ProbabilisticAndMetricNumberTheoryPartII~2a/F01`–`F05`) and of review r2b
(`RT-ProbabilisticAndMetricNumberTheoryPartII~2b/F01`–`F04`); no two findings overlap, so each is
settled in its own section. Every witness was recomputed before the repair; all nine hold. Files
touched: `packages/ProbabilisticAndMetricNumberTheoryPartII/README.md`, `Suggested.lean`,
`sources.toml`. `metadata.toml` and `design/plan.json` are unchanged (no supplier gap is needed).

## RT-ProbabilisticAndMetricNumberTheoryPartII~2a/F01 (P2) — applied

Witness recomputed: `n = 3`, `F₁∘F₀(w) = 1/(4 − w)` fixes `2 − √3 ≈ 0.268`; `F₀∘F₁(w) = (2 − w)/(5 − 3w)`
fixes `1 − 1/√3 ≈ 0.423`, and the outer-prefix code `u u u …` is the latter. §1.4 bullet → the fixed
point of `F_u` is coded by the repetition of the reversed word; the repetition of `u` codes the fixed
point of the reversed word's map. The two-letter computation is a new §1.4 Check. Other periodic-code
uses (§3.7 support, §5.2 single letter) are unaffected.

## RT-ProbabilisticAndMetricNumberTheoryPartII~2a/F02 (P2) — applied

`T = 0`, `Δ = 0`, `f = g = 1`, `a = b = 1` satisfies every hypothesis of `birkhoff_contraction` and its
conclusion with `a′ = b′ = 1`, while `d(0, 0)` is undefined. §3.3 "Taking infima, …" → the hypothesis is
an order bound (the zero map satisfies it); the metric corollary is stated for `T` sending nonzero to
nonzero elements, with the explicit `a′ = (b + βa)/(1 + β)`, `b′ = (b + αa)/(1 + α)` route. `T = 0`
added as a Check. Lean docstring of `birkhoff_contraction` reworded (order-bound form); the statement is
unchanged, it is true as stated.

## RT-ProbabilisticAndMetricNumberTheoryPartII~2a/F03 (P2) — applied

Added `uniform_ruelle_perron_frobenius` to `Suggested.lean` (Layer 4): for `d ≥ 1`, `1 < a`, there are
`M`, `0 < θ < 1` before `σ ∈ Icc a b`, then the data of `ruelle_perron_frobenius` with decay
`M θ^m K`. README §4.3 names it and states the quantifier order; the uniform spectral separation
`λ_σ − ε` stays prose. Module docstring updated: the uniform gap moves from "not statable" to the
stated list; the uniform spectral separation and the continuation of the eigendata off the real axis
remain not statable. Difference from the proposed signature: the hypothesis `a ≤ b` is omitted (unused;
an empty interval makes the statement vacuous, recorded as a Check). Checks added: `[2, 2]`, `n = 3`
data; quantifier order on `[2, 3]`.

## RT-ProbabilisticAndMetricNumberTheoryPartII~2a/F04 (P3) — applied

Three §7.1 Checks added: `M₂ 1` has values `1`, `4` (inverse multiplier `1`, `1/4`); derivative
`2(1 + x)` with endpoint values `2`, `4`, C¹ sum norm `8`; at `s = 2`, `x = 1`, `A = 0` the conjugated
weight `(3/2)^{−2}(3/2)²/4 = 1/4 = (x + A + 1)^{−2}` versus `64/81` with the inverse multiplier.
README only.

## RT-ProbabilisticAndMetricNumberTheoryPartII~2a/F05 (P3) — applied

Verified on main: `TauCetiRoadmap/DifferentialGeometry/README.md` item 10.5 lists its own
`exists_fixedPoint_closedBall` and cites no AlgebraicTopology fixed-point theorem (the only
`AlgebraicTopology` mentions there are Tau Ceti module paths). Scope bullet → the parenthesis
"(DifferentialGeometry Layer 10.5 consumes it)" is removed; the AlgebraicTopology Stage 2, item 7
citation and the Layer 3 use are unchanged.

## RT-ProbabilisticAndMetricNumberTheoryPartII~2b/F01 (P3) — applied

Verified at the open head of ArithmeticDirichletSeriesPartII (`93f5273`): headings `### 0.1`, `### 1.1`,
`### 3.1`, `### 3.2`; no `HP` anywhere in its README or `Suggested.lean`; the six consumed declarations
exist. All 24 occurrences → `§0.1`, `§1.1`, `§3.1`, `§3.2`, `§§…` in lists, and `HP.3` → "its Layer 3"
(Scope, Conventions, supplier heading, §2.5, §6.2, §6.4, §6.5, Layer 2 and Layer 6 Dependencies).

## RT-ProbabilisticAndMetricNumberTheoryPartII~2b/F02 (P3) — applied

Verified at Tau Ceti `358314d`: `TauCeti/Data/Matrix/BirkhoffContraction.lean` has
`TauCeti.hilbertProjectiveDist` (line 76, `⨆ i, ⨆ j, log (x i * y j / (y i * x j))`),
`Matrix.projectiveDiameter` (214) and `Matrix.hilbertProjectiveDist_mulVec_le` (362, positive matrix on
`[Finite ι] [Fintype κ]`, positive vectors). Scope bullet, "From Tau Ceti" (was "No declaration … is
consumed"), §3.3 positive-vector bullet, matrix Check (`projectiveDiameter = log 4`), §3.3 *Needs:* and
Layer 3 Dependencies now cite them; `birkhoff_contraction` stays.

## RT-ProbabilisticAndMetricNumberTheoryPartII~2b/F03 (P3) — applied

Verified: the published display (5.1) prints `1 ≤ i ≤ n − 2` (GMR19 line 2401, p.801); arXiv v3 prints
`1 ≤ i ≤ n − 3` (arXiv v3 line 2043, between the page markers 44 and 45, footer "44" at line 2076), so
the display is on arXiv v3 **p.44**, not p.46 as the finding says; the proof of (5.1) on p.46 (line
2112) treats `i = 1, …, n − 2`. Notes on the sources → the sentence leaves the p.801 bullet and becomes
its own arXiv v3 bullet with p.44. `sources.toml` GMR19 `locator` and `version_note` record the arXiv
display at p.44.

## RT-ProbabilisticAndMetricNumberTheoryPartII~2b/F04 (P3) — applied

Verified at Tau Ceti `358314d`: `IsCompactOperator.finiteDimensional_genEigenspace_nat`
(`Compact/Eigenspace.lean:132`, `μ ≠ 0`, finite-order `genEigenspace`, any complete nontrivially normed
field) and `IsCompactOperator.finiteDimensional_ker_one_sub` (`RieszTheory.lean:161`, complete field),
`isClosed_range_one_sub` (173) and `finiteDimensional_quotient_range_one_sub` (194), the last two with
`[IsRCLikeNormedField 𝕜] [CompleteSpace X]`. §3.5 compact-`T` Check now ends by naming them; "From Tau
Ceti", §3.5 *Needs:* and Layer 3 Dependencies list them as the `r = 0` consistency check.

## Checks run

- Elaboration: `lake env lean …/Suggested.lean` from the content checkout, exit 0, 16 warnings, all
  "declaration uses `sorry`" (15 previous headlines plus `uniform_ruelle_perron_frobenius`); no error,
  no other warning. Imports unchanged (`Mathlib` only), no `set_option`. Re-run after the header
  repair below: exit 0, the same 16 `sorry` warnings, nothing else.
- `#check @name` for all 25 declarations in a scratch file (the module body followed by the checks),
  elaborated once. Each printed type was compared with its README statement: unchanged for the 24
  previous declarations (same types as the elaborated signatures supplied with the job); `uniform_ruelle_perron_frobenius`
  elaborates to `∀ d, 1 ≤ d → ∀ a b, 1 < a → ∃ M θ, 0 < θ ∧ θ < 1 ∧ ∀ σ ∈ Icc a b, ∃ c, 0 < c ∧ ∃ h ν,
  IsEigenprobability d σ c ν ∧ ContDiffOn ℝ 1 h Δ ∧ (∀ x ∈ Δ, 0 < h x) ∧ ∫ h ∂ν = 1 ∧ (∀ x ∈ Δ, L_σ h x =
  c h x) ∧ ∀ f K, C1BoundedOn d f K → ∀ m, C1BoundedOn d (c^{-m} L_σ^m f − h ∫ f ∂ν) (M θ^m K)`, with
  `M`, `θ` before `σ` as §4.3 states. No section variables exist, so no binder can be dropped.
- Dependency check:

  ```text
  depcheck: 238 roadmaps, 2195 edges, 0 problem(s)
  ```

  No UPWARD, CYCLE or moved line.
- Citation resolver on the README: no cross-roadmap citation and no Lean name found nowhere.

## Adversarial pass on the new and changed statements

| Statement | Instances tried | Values computed | Result / change |
|---|---|---|---|
| §1.4 fixed point of `u` is coded by the reversed word | `n = 3`, `u = [(0,1),(1,1)]`; palindrome `u = [(0,1)]` | `F₁∘F₀(w) = 1/(4−w)`, root of `w² − 4w + 1`: `2 − √3 = 0.2679`; `F₀∘F₁(w) = (2−w)/(5−3w)`, root of `3w² − 6w + 2`: `1 − 1/√3 = 0.4226`; both in `[0, 1/2]`. Palindrome: both codes give the root of `w² − 3w + 1`, `(3 − √5)/2 = 0.382` (§5.2 value) | reversed-word statement correct; Check added |
| §3.3 order-bound route, `a′`, `b′` formulas | `K = [[2,1],[1,2]]`, `f = (1,1)`, `g = (1,2)`, `a = 1`, `b = 2` | `T(g − f) = (1,2)`, `T(2f − g) = (2,1)`, `α = 1/2`, `β = 2`, `log(β/α) = log 4 = Δ`; `a′ = 4/3`, `b′ = 5/3`; `(4/3)(3,3) = (4,4) ≤ (4,5) ≤ (5,5)`; `log(5/4) = 0.2231 ≤ tanh(log 4/4)·log 2 = 0.2310` | pass |
| §3.3 derivative bound `(√β − √α)/(√β + √α)` | `y = e^{log(b/a)}`, maximise `y(β−α)/((y+α)(y+β))` | maximum at `y = √(αβ)`, value `(β−α)/(√α+√β)² = (√β−√α)/(√β+√α) = tanh(log(β/α)/4)`; at `α = 1/2`, `β = 2`: `1/3` | pass |
| `birkhoff_contraction` with `T = 0` | `C₁ = C₂ = ℝ_{≥0}`, `Δ = 0`, `f = g = 1`, `a = b = 1` | hypotheses: `0 − 1·0 = 0 ∈ C₂`, `log 1 = 0 ≤ 0`, `g − f = 0 ∈ C₁`; conclusion `a′ = b′ = 1`, `log 1 = 0 ≤ tanh 0 · 0 = 0`; `d(0,0)` undefined | theorem true; metric corollary restricted to nonzero images |
| `birkhoff_contraction`, degenerate `g = af` | `T(g − af) = 0` | `Tg = aTf`, `a′ = b′ = a`, `log 1 = 0 ≤ tanh(Δ/4) log(b/a)` since `b ≥ a` (from `(b − a)f ∈ C₁`, salience) | pass; route sentence covers it |
| `uniform_ruelle_perron_frobenius`, one-point interval | `d = 1`, `a = b = 2` | `c = 1`, `ν₂ = 2 dw₁`, `h₂ = 1/(2 log 2 (1 − w₁))`, `∫ h₂ dν₂ = (1/log 2)·∫₀^{1/2} dw/(1−w) = 1`; `L₂ h₂ = h₂` (§2.1 Check) | pass |
| same, empty and negative cases | `a > b`; `K < 0`; `m = 0` | `Icc a b = ∅`, statement vacuous; `K < 0` admits no `f` since `0 ∈ Δ` for `d ≥ 1`; `m = 0`, `f = h`: remainder `h − h·1 = 0`, bound `M·K ≥ 0` | pass; `a ≤ b` omitted as unused, empty case is a Check |
| same, quantifier order | `[2, 3]` | pointwise constants `θ_σ → 1` satisfy §3.7 at each `σ`, not the uniform statement | Check added |
| §7.1 multiplier Checks | `s = 2`; `x = 0, 1`; `A = 0` | `M₂1`: `1`, `4`; inverse `1`, `1/4`; derivative `2`, `4`, C¹ norm `8`; weight `(4/9)(9/4)/4 = 1/4 = 2^{−2}`; inverse direction `(4/9)·4·(4/9) = 64/81` | pass |
| Tau Ceti matrix Check | `K = [[2,1],[1,2]]`, columns `(2,1)`, `(1,2)` | `hilbertProjectiveDist((2,1),(1,2)) = log(2·2/(1·1)) = log 4`, diagonal terms `0`, negative cross term `log(1/4)`; `projectiveDiameter = log 4`; `tanh(log 4/4) = (2−1)/(2+1) = 1/3`; `d((3,3),(4,5)) = log(5/4)` | pass; cited |
| Tau Ceti compact-operator Check | compact `T`, `p = ‖·‖`, `k = 1`, `R = ‖T‖`, `r = 0` | `‖Tf‖ ≤ ‖T‖ p(f) + 0`; `T(B₁)` relatively compact; cited theorems need `μ ≠ 0` and, for range and cokernel, `ℝ` or `ℂ` scalars and completeness, all present over `ℂ` on a Banach space | pass; cited |
| ArithmeticDirichletSeriesPartII labels | its open head | headings at its lines 269, 429, 742, 791; `HP` count 0 | relabelled |
| Notes on the sources, (5.1) index | published line 2401; arXiv line 2043 with page markers 2023 (44), 2077 (45) | published `n − 2`; arXiv `n − 3`, on p.44 | own bullet, p.44 |

## Worker check repaired

- Warning "imports `Mathlib` from package `mathlib`, which is designed for use with the module
  system; consider adding `module`" on `TauCetiRoadmap/ProbabilisticAndMetricNumberTheoryPartII/Suggested.lean`.
  The file now opens with `module`, a blank line and `public import Mathlib`, and the line
  `@[expose] public section` precedes `noncomputable section` (the header form of
  `TauCetiRoadmap/CoboundaryExpansion/Suggested.lean` on main). No declaration, docstring, README
  line or manifest entry changed.

## For the maintainer

- `Suggested.lean` gains one declaration, `uniform_ruelle_perron_frobenius`; no name was renamed or
  deleted, so no citation by another roadmap changes.
- The "From Tau Ceti" contract is no longer empty: seven pinned declarations are consumed as
  consistency checks (Birkhoff contraction for positive matrices, Riesz theory of compact operators).
- The finding r2b/F03 gives the arXiv page as p.46; the display (5.1) is on arXiv v3 p.44 (its proof
  begins on p.46). The README and manifest cite p.44.
- Ownership against open pull requests: the sibling checkouts named in the brief were searched by
  object in round 1 for every carrier; the only new statement here, the uniform
  Ruelle–Perron–Frobenius theorem for this roadmap's own transfer operators, has no other possible
  owner. Open pull requests without a checkout in the brief were not searched.
- No text was listed in `needs-references.toml`; every cited source was read from the cache.
