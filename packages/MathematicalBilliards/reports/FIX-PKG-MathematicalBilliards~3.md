# FIX-PKG-MathematicalBilliards~3

Repair of the six findings of `REV-PKG-MathematicalBilliards~2` (package, round 3). Only `packages/MathematicalBilliards/README.md` changed. `Suggested.lean`, `metadata.toml`, `sources.toml` and `design/plan.json` are unchanged: no Lean statement is touched, no source is added and no supplier gap is needed.

## F01 (P2) — applied

Verified: Herman1983 line 268 (2.4.1) assumes a diffeomorphism deviating the vertical; 2.4.2 (lines 277–284, printed p. 10) proves only `≤`, from `g₁ < g₂`; 2.4.4 (lines 287–319, printed pp. 10–11) gets strictness from Lebesgue-measure preservation, using a `C¹` negative path (line 310). The README's route used `∂_yF₁`, which a topological `IsTwistLift` lacks.

Change (§5.4): "for a positive twist … `ρ(C₁) ≤ ρ(C₂)`, strictly when `F` preserves a measure with continuous positive density" → weak inequality for every positive twist lift; strict when `F` is moreover a monotone twist map (`C¹`, `∂_yF₁ > 0`) on the open strip preserving a continuous positive density. Route: weak part from `g₁ < g₂`; strictness by Herman's region argument. Check added; `§4.2` added to *Needs*.

The density is not called `ρ` there, since `ρ(C)` is the rotation number in the same paragraph. The suggested repair was correct and is applied as worded, with two clarifications that follow from Herman's argument. The region argument stays inside the compact annulus between `C₁` and `C₂`, where a continuous `∂_yF₁ > 0` gives Herman's uniform deviation. The argument uses only two properties of the measure: nonempty open sets have positive measure and curves have measure zero. So a continuous positive density works in place of Lebesgue measure.

Pattern searched: every `∂_yF`, "monotone twist", "density" and "strictly" in the README. The only other derivative-based twist claim, the Lipschitz refinement of §5.3, already assumes a monotone twist map. The billiard uses (§§5.4–5.6) have `k ≥ 2`, where §4.3 supplies the monotone twist and §3.3 the density `sin δ`.

## F02 (P3) — applied

Verified: `ConvexTable.billiardLift` reads `δ` only through `e = exp(iδ)τ(s)` (`Suggested.lean` lines 129–132), so it is `2π`-periodic in `δ`. The complement of `A` is the union of four pieces: `δ mod 2π ∈ {0} ∪ (π, 2π)`, `δ ≡ π`, and `δ ∈ (0, π) + 2πm` with `m ≠ 0`. The README listed only the first two. On the unit circle, `(0, 5π/2)` gives `e = i · i = −1` and is sent to `(π, π/2)`.

Change (§3.3): the list of pieces "`δ ∈ (π, 2π) ∪ {0}` modulo `2π` … and `δ ≡ π`" now adds "and `δ ∈ (0, π) + 2πm` for each integer `m ≠ 0`, where the lift depends on `δ` only through `exp(iδ)` and equals the map on `A` precomposed with `δ ↦ δ − 2πm`". New Check: the witness `(0, 5π/2) ↦ (π, π/2)`.

Pattern: the other descriptions of values off `A` (Conventions "Total maps", the §2.1 Check, the `billiardLift` docstring) give examples and do not claim a partition, so they are unchanged.

## F03 (P3) — applied

Verified: ChaikaForni2026 lines 95–98 (Section 1, p. 3) say that Theorem 1.3 together with ergodicity in almost every direction implies Theorem 1.2. That is the criterion for two ergodic flows with no common nonzero eigenvalue. Neither factor is assumed weakly mixing. Hochman2012 line 2627 (Proposition 6.2.1, printed p. 59, read at the page header, line 2573) states the multiplier property.

Change (§12.1 API): "(ChaikaForni2026 lines 95–98; Hochman2012, Proposition 6.2.1, line 2627, for `ℤ`-actions)" → "(Hochman2012, Proposition 6.2.1, printed p. 59, line 2627, for `ℤ`-actions; ChaikaForni2026, Section 1, p. 3, lines 95–98, uses the related spectral criterion that two ergodic flows without a common nonzero eigenvalue have an ergodic product)".

## F04 (P3) — applied

Verified page by page in the cached texts. BialyMironov2022: §1.3 starts at line 96 (p. 2); Theorem 1.1 is at line 103 (p. 3); the remark after Corollary 1.3 is at lines 115–119 (p. 3); Section 2 covers lines 147–185 (p. 4); Section 3 contains lines 230–263 (p. 6). ChaikaForni2026: the abstract is lines 9–17 (p. 1); Theorem 1.3 and its lead-in are lines 95–100 (p. 3).

Change: each of the twelve listed line-only locators now gives a section, theorem or abstract and a printed page before the line numbers. These are at README lines 120, 140, 145, 250, 255, 267, 380, 412, 440, 842, 850 (as in F03) and 902. "§1.3" is written "Section 1.3" because the citation resolver misread it as a roadmap section.

Pattern: three more locators gained printed pages: the two Downstream-consumer citations (BialyMironov2022, Section 1.3 and Theorem 1.1, pp. 2–3; ChaikaForni2026, Theorem 1.1, p. 1, and Theorems 1.2–1.3, p. 3) and §4.1's "Herman1983, Appendice, line 1130", which now reads Appendice §2, printed p. 40. No line-only locator remains. The remaining Herman and Hochman locators carry section or theorem numbers.

## F05 (P3) — applied

Verified against the `*Needs:*` lines. §3.2 needs IntegrableSystems I5.0 and §3.3 needs Mathlib change of variables and the `AddCircle` measure. §5.4 and §5.5 need Mathlib translation numbers, §5.1 needs `ContinuousMap.Nullhomotopic`, and §5.6 needs CotangentLagrangian C3.1. No target of Layer 10 needs GeometricTopology §1.7, which §11.3 consumes.

Change: Layer 3 "Layers 1–2." → adds Mathlib (change of variables, `AddCircle` Haar measure, densities) and IntegrableSystems I5.0. Layer 5 → adds Mathlib (translation numbers, null-homotopy) and CotangentLagrangian C3.1 (§5.6). Layer 10 → "Mathlib manifolds.". Same pattern fixed: Layer 2 adds Mathlib (implicit function theorem, `AddCircle.equivIco`); Layer 9 adds Mathlib (`DihedralGroup`, `ErgodicVAdd`).

The other seven layers' lines were compared with their *Needs:* lines and already agree. Every roadmap named is already a supplier elsewhere in the README, so no dependency edge changes. The dependency check confirms this (below).

## F06 (P3) — applied

Verified: `f(x, y)` is a point of `AddCircle ℓ × Y`, so "`f(x, y) → a`" compares a point with a number.

Change (§5.1 API): "`f(x, y) → a` as `y → a` and `→ b` as `y → b` uniformly in `x` when `Y` is open" → "when `Y` is open, `f₂(x, y) → a` as `y → a` and `f₂(x, y) → b` as `y → b`, uniformly in `x`, for the second coordinate `f₂`". Same pattern in §4.1: "`→ b`" → "`F₂(x, y) → b`".

## Checks run

- **Elaboration.** `lake env lean packages/MathematicalBilliards/Suggested.lean`, run from the content checkout, exited 0. The output was seven `declaration uses 'sorry'` warnings, at lines 154, 193, 209, 235, 257, 268 and 287, and nothing else. The one `TauCeti.*` import (`TauCeti.Analysis.Semigroups.Group.Unitary`) was already built. The file is unchanged this round.
- **Binders.** I put `#check @name` for all 16 declarations into one scratch copy and elaborated it once (exit 0). Each elaborated type was compared with its README statement:
  - `[Fact (0 < ℓ)]` on every table declaration;
  - `2 ≤ k` on `ConvexTable.measurePreserving_billiardMap` and `ConvexTable.exists_lipschitzWith_of_isRotationalInvariantCurve`;
  - `0 < ℓ`, `a < b`, the lift relation, the twist disjunction and the non-wandering hypothesis on `isGraph_of_isRotationalInvariantCurve`;
  - `0 < p`, `p < q`, `p.Coprime q` on `ConvexTable.exists_two_periodic_orbits`;
  - `[CompleteSpace H]` and `U.IsUnitary` on `exists_tendsto_twistedAverage`;
  - `[IsFiniteMeasure σ]` on `tendsto_average_norm_charFun_sq`;
  - `[MeasurableVAdd₂ ℝ X]`, `[IsProbabilityMeasure μ]` and `[VAddInvariantMeasure ℝ X μ]` on `isWeaklyMixing_iff`.

  No binder is lost and nothing changed.
- **Dependency direction** (after the final edit):

  ```text
  depcheck: 237 roadmaps, 2139 edges, 0 problem(s)
  ```

  There is no UPWARD, CYCLE or moved line.
- **Citations.** After the final edit, `roadmaps resolve` on the README reports no cross-roadmap citation and no Lean name found nowhere. An intermediate run flagged "BialyMironov2022, §1.3" as a roadmap citation; that was a false positive, removed by writing "Section 1.3".
- **Gate failures.** None were listed in the brief.

## Adversarial pass on changed and added statements

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| §5.4 weak monotonicity (any positive twist lift) | circle `R`, `δ = π/3` against `π/2`; shear `(x + h(y), y)` with `h` a non-`C¹` increasing homeomorphism | `g₁ = s + 2πR/3 < s + πR = g₂`, `ρ = 1/3 ≤ 1/2`; shear `g_c = x + h(c)`, `ρ = h(c)/ℓ`, ordered as `c` | holds; uses only `F₁(x, ·)` strictly increasing | route rewritten without `∂_yF₁` |
| §5.4 strict monotonicity (`C¹` twist and density) | circle (`∂_δF₁ = 2R`, density `sin δ`); billiard `k ≥ 2` (`∂s₁/∂δ = L/sin δ₁ > 0`, density `sin δ`); Herman's hypotheses | `1/3 < 1/2`, strict; on the compact annulus between the curves `∂_yF₁ ≥ c > 0` and `det DF = sin δ/sin δ₁ > 0`, so the uniform cone conditions of Herman 1.2 hold | holds; the topological case is not claimed | hypothesis added, Check added |
| §5.4 strict form with a general density | a measure `m dx dy`, `m` continuous and `> 0` | the region argument needs `μ(curve) = 0` (a continuous graph is Lebesgue-null by Fubini) and `μ(open) > 0` | holds | stated with "(§4.2)" |
| §3.3 pieces off `A` | `(0, 5π/2)`, `(0, −3π/2)`, `(0, 2π)`, `(0, 3π)` on the unit circle | `e = −1`, `−1`, `i`, `−i`: images `(π, π/2)`, `(π, π/2)`, `(0, 0)`, `(0, π)` (empty set, exit parameter `0`, `δ₁ = arccos Re(i · i) = π`); the four pieces `{0} ∪ (π, 2π)`, `{π}`, `(0, π) + 2πm` (`m ≠ 0`), `(0, π)` cover `[0, 2π)` modulo `2π` | partition complete; each piece maps continuously | third family added, Check added |
| §12.1 product with an ergodic action | Hochman2012 line 2627; ChaikaForni2026 lines 95–98 | Hochman: weak mixing ⇔ the product with every ergodic system is ergodic (`ℤ`); Chaika–Forni: no common nonzero eigenvalue ⇒ the product is ergodic | locator now matches the claim | relocated |
| §5.1 end preservation | `f(x, y) = (x, h(y))` from the §5.1 Check | `f₂ = h`, `h(y) → −1` as `y → −1` and `→ 1` as `y → 1` | well typed | `f₂` |
| Dependencies, Layers 2, 3, 5, 9, 10 | each `*Needs:*` line of the layer | items listed equal the union of the layer's *Needs* | consistent; depcheck shows 0 problems | lines rewritten |

## For the maintainer

- No Lean name changed or was added. No name that another roadmap cites changed. No section, layer or target id was renumbered.
- No new construction or target was introduced, so the ownership position of the previous round stands. No supplier was added; the suppliers named in the new Dependencies lines (IntegrableSystems I5.0, CotangentLagrangian C3.1) were already consumed in the same layers' *Needs* lines. Ownership against open pull requests was therefore not re-searched this round beyond `roadmaps resolve`, which finds nothing.
- No source was fetched and no `needs-references.toml` was written: every edit cites texts already in the manifest (Herman1983, Hochman2012, BialyMironov2022, ChaikaForni2026), read in the worker's cache.
- No suspicious instruction was found in the review text.
