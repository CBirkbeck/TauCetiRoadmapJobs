# FIX-RT-GaussianIsoperimetryAndClusters~1

Repair of red-team round 1 (passes a and b). Nine findings: two pairs overlap, so seven sections settle them. All are applied; none is disputed. Files changed: `packages/GaussianIsoperimetryAndClusters/README.md`, `packages/GaussianIsoperimetryAndClusters/Suggested.lean` and `packages/GaussianIsoperimetryAndClusters/sources.toml`. `design/plan.json` is unchanged: its `gaps` list stays empty because no supplier gap is needed.

## RT-GaussianIsoperimetryAndClusters~1a/F01 (P2) — applied

Old: §4.7 had no Lean statement. New: `isoperimetricProfile_le_modelProfile`, `I^{(q−1)}(v) ≤ I_m^{(q−1)}(v)` for `q ≤ n + 1` on the open simplex, with explicit `E` binders. It is added to README §4.7, line 5 and the docstring, with two Checks. `hq : 2 ≤ q` is dropped: `q = 1` holds and `q = 0` is vacuous.

## RT-GaussianIsoperimetryAndClusters~1a/F02, RT-GaussianIsoperimetryAndClusters~1b/F03 (P2) — applied

Old: the pointwise mollification estimate was imported from G4, which on main says only "Establish convolution estimates". New: the G4 edge is deleted everywhere. §6.5 proves `‖∇v_ε(z)‖ ≤ ∫ ρ_ε(z − y) d|Dv_U|(y)` from pinned `TauCeti.integral_lineDeriv_mul_eq_neg_integral_mul_inner_polarDensity` and Mathlib `HasCompactSupport.hasFDerivAt_convolution_left`, both added to the contracts. I used pass a's route; pass b's is also valid.

## RT-GaussianIsoperimetryAndClusters~1a/F03 (P3) — applied

Old: the §8.1 route began with the coarea formula, which needs `n ≥ 1`. New: it opens with "for `n = 0`, `Φ(a) > 0` forces `A = E = {0}`, and the thickening `E` has measure `1 ≥ Φ(a + r)`". The §9.5 route, which needs a direction of `E`, had the same gap and gets the same repair.

## RT-GaussianIsoperimetryAndClusters~1a/F04, RT-GaussianIsoperimetryAndClusters~1b/F04 (P3) — applied

Old: a `Ledoux1996` References bullet ("Chapter 1, background") and its `sources.toml` table, `cited_for = ["References"]`; nothing else cited it. New: both are deleted. Every remaining manifest id is cited in the README.

## RT-GaussianIsoperimetryAndClusters~1a/F05 (P3) — applied

Old: §2.2 and §2.5 cited "Maggi2012 Theorem 15.9", and §2.4 "Proposition 12.15 and Theorem 12.26", as if read; the extract has only the contents (line 68–101) and the synopsis. New: each is marked "cited by locator". References separate the sections that were read from the numbers cited by locator. MilmanNeeman2022 line 756, 939 and 946 corroborate the numbers.

## RT-GaussianIsoperimetryAndClusters~1b/F01 (P2) — applied

Old: `modelMeasureMap_diffeomorph` stated injectivity, range, smoothness and the derivative, which `t ↦ t³` also satisfies. New: a fifth conjunct `∀ x i j, i ≠ j → 0 < modelInterfaceArea q i j x`, and the docstring explains the invertibility it gives. README §4.3 states it via `⟨a, L_A a⟩ = Σ A_ij (a_i − a_j)²`, with a `t³` Check.

## RT-GaussianIsoperimetryAndClusters~1b/F02 (P3) — applied

Old: the docstring of `borell_sudakov_tsirelson_multivariateGaussian` cited Ehrhard1983 Théorème 2.4, which covers `γ_n` and the ball only (line 356–359). New: it cites "Ledoux1999, (1.7), for centred laws; the mean `m` is a translation" (line 239–247). Ehrhard 2.4 moves to `borell_sudakov_tsirelson`. The README §8.1 locator list is split the same way.

## Checks run

- **Elaboration.** `lake env lean packages/GaussianIsoperimetryAndClusters/Suggested.lean`, run from the content checkout: exit 0. The output is 20 warnings "declaration uses `sorry`", one per theorem (19 before plus `isoperimetricProfile_le_modelProfile`). There are no errors and no other warnings. Every imported `TauCeti.*` object file existed, so nothing was built.
- **Mechanical `#check`.** A scratch copy with `#check @name` for all 37 declarations was elaborated once. I compared each elaborated type with its README statement. Only two types changed:
  - `@modelMeasureMap_diffeomorph` now ends with `∧ ∀ (x : ↥(simplexTangent q)) (i j : Fin q), i ≠ j → 0 < modelInterfaceArea q i j x`.
  - `@isoperimetricProfile_le_modelProfile` is `∀ {E} [NormedAddCommGroup E] [InnerProductSpace ℝ E] [FiniteDimensional ℝ E] [MeasurableSpace E] [BorelSpace E] {q}, q ≤ finrank ℝ E + 1 → ∀ {v}, (∀ i, 0 < v i) → ∑ i, v i = 1 → isoperimetricProfile (gaussianWeight E) q v ≤ ENNReal.ofReal (modelProfile q (WithLp.toLp 2 v))`. Its full instance block is kept, so no binder was lost.

  The three definitions flagged in `signatures.md` (`gaussianWeight`, `gaussianSymmetral`, `closedGaussianSymmetral`) lose only instances their bodies do not use. Every theorem that mentions them carries the full block.
- **Dependency check** (the command of the brief):

      depcheck: 239 roadmaps, 2254 edges, 0 problem(s)

  There is no UPWARD, CYCLE or moved line.
- **`roadmaps resolve`** on the README: no cross-roadmap citation and no Lean name is found nowhere. The earlier lead `Cluster.perimeter_eq_iff_halfSpaces` is declared in `Suggested.lean`.
- **Name agreement.** Every declaration of `Suggested.lean` appears backticked in the README, and the new name is in line 5 and §4.7.
- **Ownership.** `roadmaps grep` for multi-bubble, double-bubble, simplicial cluster and model profile found no match on main or in any open roadmap pull request. The removed G4 citation leaves no other roadmap relying on this package's text.

## Adversarial pass on the changed and added statements

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| `isoperimetricProfile_le_modelProfile` | `q = 2`, `n = 1`, `v = (1/2, 1/2)` | left `I(1/2) = 0.398942` (§7.4); right `A^m_12(0) = e^{−W(0)}·μHE[0]{0} = φ(0) = 0.398942` (`μHE[0] = μH[0]`, a point has mass 1) | equality, holds |
| same | `q = 2`, `v = (Φ(1), 1 − Φ(1)) = (0.841345, 0.158655)` | `Ψ(tu)_1 = Φ(−t)` gives `t = −1`, right `φ(1) = 0.241971`; left `I(0.841345) = 0.241971` | equality |
| same | `q = 3`, `n = 2`, `v = (1/3, 1/3, 1/3)` | right `3 × 0.199471 = 0.598413` (tripod); left at most that | holds |
| same | `q = 1`, `v = (1)`; `q = 0` | `Ψ(0) = (1)`, empty sum `0`; left: cluster `(E)` with perimeter `0`, so `0 ≤ 0`; `q = 0`: `hsum` reads `0 = 1` | holds; vacuous |
| same, without `hqn` | `n = 0`, `q = 2`, `v = (1/2, 1/2)` | no `2`-cluster, left `∞`; right `0.398942` | false, so `hqn` is needed (README Check) |
| same, without `hv` | `n = 2`, `v = (1/2, 1/2, 0)` | left `0.398942`; right `0` (`v` is outside the range of `Ψ`) | false, so `hv` is needed (README Check) |
| same, without `hsum` | `q = 3`, `n = 2`, `v = (1/2, 1/2, 1/2)` | no cluster, left `∞`; right `0` | false, so `hsum` is needed |
| `modelMeasureMap_diffeomorph`, fifth conjunct | `q = 2`, `x = 0.7u` | the face is `{x}`, area `φ(0.7) = 0.312254 > 0`; derivative along `u` is `−0.312254` | holds |
| same | `q = 3`, `x = 0` | each area `1/(2√(2π)) = 0.199471 > 0`; `DΨ(0) = −0.423142 Id` | holds |
| same, with `i = j` allowed | `q = 2` | the set is a closed half-line, which has uncountably many points under the counting measure `μHE[0]`; the integral is the junk `0`, and `0 < 0` is false | `i ≠ j` is needed |
| same, why positivity gives invertibility | `q = 3`, `A_12 = A_13 = 0 < A_23` | `L_A(2, −1, −1) = 0` | all areas positive implies `L_A` positive definite on `E^{(q−1)}` |
| §6.5 pointwise mollification bound | `u = χ_{(−∞,0)}` on `ℝ` | `Du = −δ_0`, `σ(0) = −1`; `(u ∗ ρ)′(x) = −ρ(x)`; the formula gives `∫ ρ(x − y)(−1) dδ_0 = −ρ(x)` | sign and equality as stated |
| §6.5 limit step | `v = Φ(1 + z)` (tilted half-plane), bump mollifier | `∫ φ ‖∇v_ε‖` is `0.218612`, `0.219652`, `0.219695` at `ε = 0.5`, `0.1`, `0.01`; the limit `∫ φ(1 + z)φ(z) dz = 0.219696` | matches the first term of the §6.5 Check |
| §8.1, case `n = 0` | `A = {0}`, `r = 1`, `a = 0`; `A = ∅` | `thickening 1 {0} = {0}`, `1 ≥ Φ(1) = 0.841345`; `A = ∅`: no real `a` has `Φ(a) ≤ 0` | holds; vacuous |
| §9.5, case `n = 0` | `A = B = {0}`, any `θ`, `a`, `b` | `θA + (1 − θ)B = {0}`, `1 ≥ Φ(θa + (1 − θ)b)` | holds |
| §9.5, Check recomputed | `[−1, 1]`, `[−3, 3]`, `θ = 1/2` | `1.690143 ≥ 1.628704` | unchanged |
| §8.1 citations | Ehrhard1983 line 358–359; Ledoux1999 line 221–224 and 239–247 | Ehrhard: `γ_n`, Borel `A`, ball `B_n(0, r)`. Ledoux (1.5): standard measure. Ledoux (1.7): centred law, ellipsoid `M(B_2)` | the split by statement is correct |

## For the maintainer

- `design/plan.json` (outside the `gaps` list, which I may not edit) still lists `roadmap:GeometricMeasureTheory G4` among the suppliers. The README no longer cites G4, and the dependency check reads the README.
- One name is new: `TauCetiRoadmap.GaussianIsoperimetryAndClusters.isoperimetricProfile_le_modelProfile`. One statement is strengthened: `modelMeasureMap_diffeomorph` has a fifth conjunct, so any `.2.2.2` projection on it now yields a conjunction. No other roadmap cites either name.
- The `Ledoux1996` key is removed from `sources.toml`. No text cites it.
- No source was fetched and `needs-references.toml` was not written: every locator used is in a cached text or a settled entry.
- No suspicious instructions were found in the reviews or the other files read.
