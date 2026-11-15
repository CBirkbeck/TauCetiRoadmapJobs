# Repair report: RiemannianManifoldsWithConvexBoundary design, round 8

This round settles the two findings of `REV-DESIGN-RiemannianManifoldsWithConvexBoundary~7`.
It changes `packages/RiemannianManifoldsWithConvexBoundary/design/README.md` and
`packages/RiemannianManifoldsWithConvexBoundary/design/plan.json`. `sources.toml` is unchanged
because no new source is cited: R5c is a roadmap section, not a source.

## F01 (P2) — applied

Old: Scope listed the realisation as owned here, and R5c was not cited anywhere. New:
- Scope cites R5c items 1 and 3 and says what 3.3, 3.4 and 3.5 add.
- The RiemannianGeometry contract states R5c with its hypotheses.
- 3.5 has a comparison paragraph and a convention Check.
- R5c is added to the 3.5 *Needs:* line, the Layer 3 Dependencies, the plan supplier sections and the 3.5 prerequisites, and the plan has a new test `r5c_conventions`.

**Verified on main (1a19c9f), `TauCetiRoadmap/RiemannianGeometry/README.md`.**
- R5c heading: line 3715.
- Domain convention, lines 3749–3754: the standing manifolds are boundaryless. A relatively compact smooth domain is an open `D` with compact closure. Each point of its boundary has a chart in which `D` is `x_m > 0`.
- Item 1, lines 3870–3874: every compact Riemannian manifold with boundary is such a `D̄`. The proof glues a collar (GeometricTopology §1.1) along the boundary (§1.3) and extends the metric with K5a's Seeley extension, keeping it positive definite near `D̄`.
- *Needs:* lines 3938–3941.
- Standing convention, lines 156–157: finite-dimensional, Hausdorff, second-countable, boundaryless. Dimension `m ≥ 1`: line 3727.

No open pull request changes RiemannianGeometry (`roadmaps overlaps RiemannianGeometry`: "None"), so the id `R5c` is stable.

**Pattern repaired, beyond the cited line.**
- R5c item 3 (lines 3886–3889) states that every relatively compact smooth domain has a smooth `ρ` with `0` a regular value, `D = {ρ < 0}` and `{ρ ≤ 0}` compact. For compact `M`, `int M ⊆ M̃` is such a domain. So R5c already has 3.3's `ρ̃` up to sign and without the collar normalisation.
- I cite item 3 in the same Scope bullet, contract entry and 3.5 paragraph ("`−ρ̃` is one").
- The Scope bullet now says what is added in each place:
  - 3.3 adds the normalisation `ρ̃ ∘ c̃ = t`, which the atlas comparison uses, the non-compact case and the atlas comparison itself.
  - 3.4 extends functions and sections of `T*M ⊗ T*M` to all of `N`. R5c extends only the metric, and only to a neighbourhood of `D̄`.
  - 3.5 adds a compact, and compact connected, `M̃` (the double).
- The Layer 3 bullet of "This roadmap owns" now says that the compact collar-extension case is R5c's.

**Differences from the suggested repair.**
- R5c is in the *Needs:* line of 3.5 only, not of 3.3 or 3.4, and not in the prerequisites of plan targets 3.3.1 and 3.4.2. Their statements and routes do not use R5c, and a *Needs:* line lists what the statement and route need. The Scope clause records the difference for each.
- The 3.5 paragraph gives the chart of `M̃` as "a chart of `∂M` together with the bicollar coordinate `t`, through `c̃`". The suggested wording used "a sublevel chart of `{ρ̃ ≥ 0}`". R5c asks for a chart of the boundaryless ambient manifold, and a sublevel chart is a chart of the domain with boundary.

## F02 (P3) — applied

The second option of the finding (deletion) is applied:
- Scope: "…first-variation symmetry and completeness of compact manifolds: HopfRinow Layers 1, 2 and 4" becomes "HopfRinow Layers 1 and 2", plus a new bullet: completeness is "already in Tau Ceti as `TauCeti.Manifold.isGeodesicallyCompleteAt_of_compactSpace`".
- The Layer 4 clause is deleted from the HopfRinow contract.
- The plan's HopfRinow supplier entry drops `§Layer 4` and "compact implies complete".

**Verification.**
- `Completed/HopfRinow/README.md` Layer 4 (line 495) itself says to consume that Tau Ceti declaration.
- At the pin, `TauCeti/Geometry/Manifold/Riemannian/Geodesic/Compact.lean:75` declares `isGeodesicallyCompleteAt_of_compactSpace`. Its hypotheses (variable block, lines 68–71) are `FiniteDimensional`, `I.Boundaryless`, a smooth Riemannian bundle, `T2Space` and `CompactSpace`.
- 5.1's *Needs:* line and plan prerequisites already name it.

**Same pattern elsewhere.** I audited the plan's supplier sections against its `roadmap:` prerequisites by script. The only other section consumed by no *Needs:* line was DifferentialGeometry 12.2 (the gradient). On main, 12.2 (line 2848) is the section through which `TauCeti.Manifold.mgradient` comes. Target 1.2 uses that gradient in its chart formula `ν_in = grad x⁰/|grad x⁰|`.
- I added "DifferentialGeometry … 12.2 (the gradient, Tau Ceti `TauCeti.Manifold.mgradient`)" to the 1.2 *Needs:* line and to the Layer 1 Dependencies, and `roadmap:DifferentialGeometry §12.2` to the plan prerequisites of 1.2.
- I added the section rather than deleting it because this mirrors how 1.4 cites DifferentialGeometry 12.3 next to `TauCeti.Manifold.hessian`, and the Scope range 12.1–12.3 stays intact.
- After the edit, every supplier section of the plan is used by a prerequisite, and every prerequisite section is listed under its supplier.

## Checks run

**Dependency check** (exact output, after the final edit):

```text
candidate: RiemannianManifoldsWithConvexBoundary is not in the merge order yet; checked as if placed after MathematicalBilliards (the intake inserts it when its design is accepted)
depcheck: 245 roadmaps, 2233 edges, 0 problem(s)
```

The output has no UPWARD, CYCLE or `moved:` line. RiemannianGeometry and DifferentialGeometry are on main, and HopfRinow is completed on main.

**Citation resolver** (`roadmaps resolve` on the edited README):
- Cross-roadmap citations found nowhere: none. Lean names found nowhere: none.
- The tool reports "Lean names outside TauCetiRoadmap were not checked: no pinned Lake packages on this host". The one Tau Ceti name this round moves (`TauCeti.Manifold.isGeodesicallyCompleteAt_of_compactSpace`) was checked by hand at the pin, file and line above.

**Plan.**
- `plan.json` parses and keeps its formatting (one-space indent, trailing newline). The diff touches only supplier entries HopfRinow and RiemannianGeometry and targets 1.2 and 3.5.
- 6 layers and 49 targets. Every `target:` prerequisite resolves.

**README form.**
- No LaTeX delimiters, process words or machine paths in the new text.
- Eight lines exceed 102 characters. All eight are untouched lines, the same count the review reported.

**Suggested.lean.** There is none at the design stage. So the `#check @name` binder audit, the import check and elaboration have nothing to inspect, and no Lean command was run.

**Gate failures listed in the brief:** none.

## Adversarial pass on the changed statements

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| 3.5 comparison: for compact `M`, `int M` is a relatively compact smooth domain of the collar extension `M̃` | closed unit disc, `c(q, t) = (1 − t/2)q`; `M = [0, 1]` (`n = 0`), `c(0, t) = t/2`; closed `M` (`∂M = ∅`) | Disc: `c̃(q, t) = (1 − t/2)q` on `\|t\| < 1`, `M̃ = {\|x\| < 3/2}`, closure of `{\|x\| < 1}` is the compact disc. The chart `(t, θ)` gives `int M = {t > 0}`. Interval: `M̃ = (−1/2, 3/2)`, `t = 2x` near `0`, `int M = (0, 1) = {t > 0}` there, `m = 1 ≥ 1`. Closed `M`: `M̃ = M`, `D = M`, R5c's closed case | holds | paragraph |
| Coordinate convention (R5c last, Mathlib first) | disc chart near `(1, 0)`, `\|θ\| < π/2` | Mathlib order `(x⁰, x¹) = (t, θ)`: `int M = {x⁰ > 0}`. R5c order `(θ, t)`: `{x_2 > 0}`. Misread `{θ > 0}` contains `t < 0` points, i.e. points with `\|x\| > 1` | the misreading is excluded | Check |
| Sign of R5c's defining function against `ρ̃` | disc; closed `M`; interval | `−ρ̃ = 2(\|x\| − 1) < 0` on `3/4 < \|x\| < 1`. `−ρ̃ ≡ −1` equals R5c's `ρ₂ = −1` for a closed manifold (RiemannianGeometry line 3887). `−ρ̃ = −2x < 0` on `(0, 1/4)` | `−ρ̃` meets R5c's sign, `ρ̃` does not | Check |
| Contract: `{ρ ≤ 0} = D̄` for R5c's `ρ` | `ρ = \|x\|² − 1` on `ℝ²`; `ρ = (x² − 1)(x − 3)²` on `ℝ` (regular value fails) | First: `D` the open disc, `{ρ ≤ 0}` the closed disc `= D̄`. Second: `{ρ ≤ 0} = [−1, 1] ∪ {3}`, `D̄ = [−1, 1]`, `ρ′(3) = 0` | equality needs the regular value, as stated | parenthesis |
| Non-compact and compact-extension cases lie outside R5c | `[0, ∞)`, `c(0, t) = t`; double of the disc | `M̃ ≅ (−1, ∞)`, `ρ̃ = x` on `(−1/2, 1/2)`, `M` not compact. `DM = S²` compact: R5c asserts no compactness of the ambient manifold | 3.5's own statement still needed | Check, Scope clause |
| 5.1 "global if `N` is compact" after dropping HopfRinow Layer 4 | `N = S²` (double of the disc); `N = {\|x\| < 3/2}` | `S²`: compact, Hausdorff, boundaryless, so complete by the pinned declaration and the flow on `SN` is global. Open disc: the geodesic from `0` with `v = e₁` leaves at `t = 3/2`, so the flow is not global | the hypothesis is needed; the pin suffices | none |
| 1.2 chart formula with 12.2's gradient | `g = [[1, a], [a, 1]]`, `a = 1/2` | `grad x⁰ = g⁻¹e⁰ = (1, −a)/(1 − a²) = (4/3, −2/3)`, `\|grad x⁰\|² = 1/(1 − a²) = 4/3`, quotient `(2/√3, −1/√3)`, as the 1.2 Check says | holds | Needs line |

## Ownership and overlap

This round adds no new object; it replaces ownership claims by citations of RiemannianGeometry R5c on main. Main is earlier than every open roadmap. The closest-roadmap comparison of the round-7 review covered ManifoldOptimization, LorentzianGeometry and SmoothBundlesConnections (open), and RiemannianGeometry, MinimalSurfaces, Surfaces and HopfRinow (main). It found R7.9 and R5c as the only shared objects, and both are now cited. I did not repeat the search over the open heads, since nothing new is stated.

## For the maintainer

- No identifier of this roadmap that others cite changed. No section, layer or target was renumbered or renamed. The plan gains one test (`r5c_conventions` under 3.5) and three prerequisites (R5c on 3.5, DifferentialGeometry §12.2 on 1.2).
- The plan's supplier sections changed as follows:
  - HopfRinow: from `§Layer 1, §Layer 2, §Layer 4` to `§Layer 1, §Layer 2`.
  - RiemannianGeometry: from `§R5a, §R7.9` to `§R5a, §R5c, §R7.9`.
- R5c's presentation is a proof step inside its scalar principal eigenfunction item, not a numbered target. If RiemannianGeometry ever moves that step into its own item, the citations here should follow it.
- The review text contained no instructions to act on outside the job.
