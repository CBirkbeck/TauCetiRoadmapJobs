# FIX-PKG-MathematicalBilliards~2

Repair of the eight findings of `REV-PKG-MathematicalBilliards` (package, round 2). Files changed: `packages/MathematicalBilliards/README.md`, `packages/MathematicalBilliards/Suggested.lean`, `packages/MathematicalBilliards/sources.toml`. `design/plan.json` and `metadata.toml` are unchanged (no supplier gap is needed).

## F01 (P2) — applied

Verified: §4.1 defines a monotone twist map as a `C¹` diffeomorphism, §§3.2–3.3 and 4.3 assume `k ≥ 2`, and the `C¹` circle–ellipse table has `∂s₁/∂s = (κ(s)L − sin δ)/sin δ₁` with one-sided values `2·1 − 1 = 1` and `2·4 − 1 = 7` at the diameter state (`L = 2`, `sin δ = sin δ₁ = 1`). Summary: "homeomorphism … exact area-preserving monotone twist map … invariant measure" (all `k ≥ 1`) → homeomorphism with closed-cylinder extension and topological twist for `k ≥ 1`; diffeomorphism, exact monotone twist and invariant measure for `k ≥ 2`. Lipschitz graph and end-theorem measure invariance now say `k ≥ 2`. §2.2 Check now records the values `1` and `7`.

## F02 (P2) — applied

Verified with the reviewer's map: `h` piecewise linear through `(−1,−1), (−1/2,1/2), (0,0), (1,1)` is continuous, preserves both ends, `h(0) = 0`, and `h(−1/2) = 1/2`, so `(0, −1/2)` in the lower component goes to the upper one. §5.1 API: "when `f` preserves each end … both components are `f`-invariant" → separate bullet requiring a homeomorphism with `f(C) = C` that preserves each end (made precise for `[a, b]` and open `Y`), with the permutation-of-components route. The definition keeps arbitrary self-maps. Counterexample added as a Check. Other uses (§5.3 route, §5.2) already have homeomorphisms.

## F03 (P2) — applied

Verified: with `q = 0` the period equation forces `p = 0` and is vacuous; `s_j = jπ√2` on the unit circle has gaps `π√2 ∈ (0, 2π)` and equal tangential components `cos(π/√2)`. `ConvexTable.IsPeriodicConfiguration`: added the conjunct `0 < q` (Lean, docstring, README §6.2). With `q ≥ 1` the gaps force `0 < p < q` (proved in scratch for `p = 0`, see checks). New negative-control Check with the `(0, 0)` irrational configuration. `ConvexTable.exists_two_periodic_orbits` is unchanged (it already assumes `0 < p < q`).

## F04 (P2) — applied

Verified: Wiener's lemma is named in the Summary, is the §12.4 target, is statable with native `charFun` and `Measure.real`, has no owner on main or in an open roadmap pull request (`roadmaps grep` for "Wiener's lemma": no match), is absent at the pins (grep for Wiener in pinned Mathlib and Tau Ceti: only Wiener–Ikehara), and is not closed by `simp`, `rfl` or `exact?`. Added `tendsto_average_norm_charFun_sq` (`T⁻¹∫₀ᵀ ‖charFun σ t‖² → ∑' ξ, σ.real {ξ} ^ 2`, `[IsFiniteMeasure σ]`), named in README §12.4, the README name list and the module docstring. Layer 12 of the Lean file is now in README order (§12.1, §12.4, §12.4.1, §12.5).

## F05 (P3) — applied

Verified: §§1.4, 3.1, 7.3 were single prose paragraphs. Each now has a definition sentence and an `API:` bullet list, with the same content: §1.4 unique `(e, c)` representation and reversal, homeomorphism onto lines meeting the interior, entry-state inverse; §3.1 regularity and equivariance, first derivatives, mixed derivative, boundary one-sided derivatives `±1`; §7.3 domain `[0, t₊]`, reflection continuation, finite reflections, corner bound. Locators stay at their claims. The Checks are unchanged.

## F06 (P3) — applied

Verified: §12.1 requires an eigenfunction to be not almost everywhere zero, so the zero constant is not an eigenfunction. Check "A constant function is an eigenfunction … excluded by 'almost everywhere constant'" → nonzero constants are eigenfunctions of eigenvalue `0` permitted by the criterion; the zero function solves every equation but is not an eigenfunction. The Check uses the one-point space, where `f = 1` works only for `a = 0` and `f = 0` for no `a`.

## F07 (P3) — applied

Verified: with counting measure on Borel `ℝ` (invariant, not σ-finite, action jointly measurable), `U_t 1_{0} = 1_{−t}` and `‖U_t 1_{0} − 1_{0}‖₂ = √2` for `t ≠ 0`, `0` at `t = 0`. The non-discriminating "not claimed" Check is replaced by this computed counterexample, with a remark that σ-finite Lebesgue measure still gives a strongly continuous group.

## F08 (P3) — applied

Verified: the cached Birkhoff1927 text is a five-line blocked-request page (Birkhoff1927 line 5), not the article. A retry through the sources service on the Project Euclid PDF URL returned the same kind of page (also five lines), so that retry was discarded and the manifest restored before editing. Under the same key: `status = "certified"`, `licence_class = "open-repository"`, `url`/`fetched_from`/`sha256` of the failed object → `status = "uncertified"`, `licence_class = "none"`, DOI URL and a `version_note`. README References adds the locator `§§1–3`. No text request was filed, because an uncertified citation is already settled.

## Checks run

- `lake env lean packages/MathematicalBilliards/Suggested.lean` (from the content checkout): exit 0, seven `declaration uses 'sorry'` warnings (the six earlier headlines plus `tendsto_average_norm_charFun_sq`), nothing else. No `TauCeti.*` build was needed.
- `#check @name` for all 16 declarations, in one scratch copy elaborated once: every type keeps its binders. Nothing has been lost: `[Fact (0 < ℓ)]` and `2 ≤ k` where they are used, `0 < ℓ`, `a < b`, the lift relation, the twist hypothesis and the nonwandering hypothesis on the graph theorem, `0 < p`, `p < q` and `p.Coprime q`, `[CompleteSpace H]` and `U.IsUnitary`, `[IsFiniteMeasure σ]` on the new theorem, and `[MeasurableVAdd₂ ℝ X]`, `[IsProbabilityMeasure μ]` and `[VAddInvariantMeasure ℝ X μ]`. The changes are the new conjunct `0 < q` inside the body of `ConvexTable.IsPeriodicConfiguration` (its type is unchanged) and the new theorem. In the same scratch file these two lemmas elaborate: `¬ T.IsPeriodicConfiguration p 0 s` and `¬ T.IsPeriodicConfiguration 0 q s`. A `first | simp | rfl | exact?` probe on the new headline fails.
- Dependency check (`gate --depcheck … --movable`):

```text
depcheck: 236 roadmaps, 2136 edges, 0 problem(s)
```

  It reports no UPWARD, CYCLE or moved line.
- `roadmaps resolve` on the README finds no cross-roadmap citation and no Lean name missing anywhere. The six names flagged earlier are local declarations, and so is the new one.
- README hygiene: no braces, `$` or backslashes outside code spans, and no process words.

## Adversarial pass on changed and added statements

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Summary regularity split | circle `k = ∞`; circle–ellipse `C¹` table | circle `∂s₁/∂s = 1`, `∂s₁/∂δ = 2R`; `C¹` table one-sided `∂s₁/∂s` = `1`, `7` at the diameter state | differentiable claims only for `k ≥ 2`; homeomorphism and topological twist for `k ≥ 1` | summary split; §2.2 Check gets the values |
| §5.1 component invariance | rotation `(x + 1/4, y)`; shear on `AddCircle 1 × (0, 2)`, `C = {y = 1}`; `(x, −y)`, `C = {y = 0}`; reviewer's `h` | rotation and shear: the lower component maps onto itself; `(x, −y)` swaps the ends and the components (excluded by "preserves each end"); `h(−1/2) = h(1/2) = 1/2`, `(0, −1/2) ↦ (0, 1/2)` | holds for end-preserving homeomorphisms only | hypothesis added; Check added |
| `IsPeriodicConfiguration` with `0 < q` | `(1,3)` equilateral; `(1,2)` diameter; `(2,4)` doubled diameter; `(0,0)` with `s_j = jπ√2`; `p = 0`; `p = q` | `(1,3)`: components `1/2 = 1/2`; `(1,2)`: `0 = 0`; `(2,4)`: gaps `π`, `s₄ = 4π = s₀ + 2·2π`, accepted (the type-`(2,4)` object of §6.3's Check); `(0,0)`: `0 < 0` fails; `p = 0`: `s₀ < s_q = s₀` fails (proved); `p = q`: `pℓ < qℓ` fails | `0 < p < q` is forced | conjunct added |
| `tendsto_average_norm_charFun_sq` | `σ = 0`; `δ₀`; `cδ₀`; `(δ₀ + δ₁)/2`; uniform on `[0, 1]` | limits / sums: `0/0`; `1/1`; `c²/c²`; `(1 + cos t)/2 → 1/2` and `1/4 + 1/4`; `≤ 4/t² → 0` and `0`. Summable: `Σ_F σ{ξ}² ≤ σ(ℝ)²` | true; summability means the `tsum` has no junk value | theorem added |
| §1.4 API | unit circle `(0, π/2)`; its reversal; tangent line `x = 1` | `(e, c) = (−1, 0)`; reversed `(1, 0)` enters at `−1` with `τ = −i`, angle `π/2 = π − δ₁`; `x = 1` meets `Ω` only at `1` and is not in the image | consistent with §§1.3, 2.4 | bullets only |
| §3.1 API | circle radius `R` | `L = 2R sin((s₁ − s)/2R)`; `∂L/∂s₁ = cos δ`; mixed `sin δ/(2R) = sin²δ/L`; `∂L/∂s₁ → +1` at `s₁ → s` and `→ cos π = −1` at `s₁ → s + 2πR` | consistent with §6.3's rate `1` | bullets only |
| §7.3 API | square corner `π/2`; `2π/3`; reflex `3π/2`; state at a vertex; horizontal state on the bottom side | ceilings `2`, `2`, `1`; `t₊ = 0`; `t₊ = 0` | consistent with §8.1's Checks | bullets only |
| §12.5 Check | one-point space, `f = 1`, `f = 0` | `f = 1`: `1 = exp(2πiat)` for all `t` iff `a = 0`; `f = 0`: every `a`, not an eigenfunction | consistent with §12.1 and `isWeaklyMixing_iff` | Check rewritten |
| §12.3 Check | counting measure on Borel `ℝ`; Lebesgue measure | `‖1_{−t} − 1_{0}‖₂ = √2` (`t ≠ 0`), `0` (`t = 0`); Lebesgue: translations strongly continuous on `L²(ℝ)` | the finiteness hypothesis is needed in some form | Check replaced |

## For the maintainer

- New Lean name: `TauCetiRoadmap.MathematicalBilliards.tendsto_average_norm_charFun_sq`. No name that another roadmap could cite was renamed or removed. `ConvexTable.IsPeriodicConfiguration` keeps its name and signature and gains the conjunct `0 < q`.
- Ownership: this roadmap stays the owner of Wiener's lemma for finite measures on `ℝ` (§12.4). Nothing on main or in the open roadmap pull requests states it, and the pins have only Wiener–Ikehara. No other construction was added. The only remaining open-PR ownership checks are the vocabulary-closest roadmaps, which the review compared; this round added no object they own.
- `Birkhoff1927` is now `uncertified`. The `cited_for` entry is References only, so no target rests on it.
- No suspicious instructions appeared in the review text.
