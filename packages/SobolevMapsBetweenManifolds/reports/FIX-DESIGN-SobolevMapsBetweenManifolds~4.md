# Repair report: SobolevMapsBetweenManifolds design, round 4

One review, one finding (F01, P3). The finding checks out and is applied as asked. The same
pattern is repaired in two more places:

- §4.3's `*Needs:*` line also left out the coordinate-change chain rules its route uses.
- §4.2's route, and the `*Needs:*` lines of §3.2, §4.1, §4.2 and §4.3, cited only the
  preferred-chart lemma `contDiffOn_ext_coord_change` for coordinate changes between arbitrary
  charts of the maximal atlas.

Files changed: `packages/SobolevMapsBetweenManifolds/design/README.md` and
`packages/SobolevMapsBetweenManifolds/design/plan.json`. `sources.toml` is unchanged because no new
work is cited. No target was added, removed or renamed. `plan.json` still has 29 targets, 104 tests
and no gaps.

## F01 (P3) — applied

**Verified at the pin.** In Mathlib, the charted space of an open subset `W` uses
`TopologicalSpace.Opens.instChartedSpace` (`Mathlib/Geometry/Manifold/HasGroupoid.lean:284–292`,
`chartAt x := (chartAt H x.1).subtypeRestr ⟨x⟩`). So `W` has charts only at points of `W`, and each
is the restriction of `N`'s chart at that point. This settles the two directions:

- **Only if.** Since `f(M) ⊆ W`, the corestriction's representatives are `f`'s representatives at
  points of `W`, on the same domains.
- **If.** Membership in `W^{1,p}_loc(M, N)` also needs the representative at every `y₀ ∈ N ∖ W`.
  The chart at such a point can meet `f(M)`: for `tanh` with `W = (−1, 1)`, this happens at `±1` and
  at `2`.

§4.2's atlas independence does not help here. It needs an atlas covering `N`, and charts of `W`
together with charts disjoint from `f(M)` miss `∂f(M) ∖ W`. The input that works is §2.4 applied
to `(ψ ∘ ψ_y.symm) ∘ (ψ_y ∘ f ∘ φ.symm)`, with `y ∈ W`.

**Change.**

- README §4.5: added a route paragraph (charts of `W` are restrictions of charts of `N`; the
  chart at `y₀ ∉ W` is read through a chart of `W` by §2.4, with the chain rule
  `d(ψ ∘ ψ_y.symm) ∘ dψ_y = dψ` for the same weak differential; §1.3 glues).
- README §4.5: the tanh Check now covers the chart at `2`.
- README §4.5 `*Needs:*`: `§1.3, §3.3, §4.2, §4.3` → `§1.3, §2.4, §3.3, §4.2, §4.3`, plus
  `contDiffOn_ext_coord_change`.
- `plan.json` 4.5: `target:2.4` and `mathlib:contDiffOn_ext_coord_change` added to
  `prerequisites`; the statement and `tanh_corestriction` test updated to match.

**Pattern: other places with the same construction.** I searched for routes that read a
representative through a coordinate change of the target or the source.

- §4.1, §4.2, §4.6 and §8.2 already list §2.2 and §2.4.
- §4.4 reads only preferred charts of a `C¹` map, so no coordinate change is involved.
- §5.1, §5.2, §6.2 and §7.1 go through §4.3's chart formula.
- **§4.3 was an occurrence.** Its existence proof and its chart formula "for all charts of the
  maximal atlases" compare chart derivatives through coordinate changes (§2.2 on the source side,
  §2.4 on the target side), carry null sets between charts (§3.3) and glue (§1.3). Its line listed
  only §4.1 and §4.2. Changes:
  - added a one-sentence route;
  - `*Needs:*` is now `§1.3, §2.2, §2.4, §3.3, §4.1, §4.2`, plus the two coordinate-change lemmas;
  - `plan.json` 4.3 `prerequisites` updated to match.
- **The coordinate-change lemma was mis-cited.** `contDiffOn_ext_coord_change`
  (`ExtChartAt.lean:784`) covers only `extChartAt x ∘ (extChartAt x').symm`. For charts of the
  maximal atlas, the right lemma is `ModelWithCorners.contDiffOn_extendCoordChange`
  (`ExtChartAt.lean:379`, namespace `ModelWithCorners` from line 324, hypotheses
  `e, e' ∈ maximalAtlas I n M`). Changes:
  - added to the Mathlib supplier contract;
  - cited in §4.2's route instead of the preferred-chart lemma;
  - added to the `*Needs:*` lines of §3.2, §4.1, §4.2 and §4.3, the four sections whose statements
    quantify over charts of the maximal atlas, and to their `plan.json` prerequisites.
- **The supplier contract for `TopologicalSpace.Opens.instChartedSpace`** now records the property
  §4.5 and §7.1 use: the preferred chart of an open subset is the restriction of the ambient one.

## Checks run

**Dependency gate** (after the edits):

```
candidate: SobolevMapsBetweenManifolds is not in the merge order yet; checked as if placed after GlaubermanZStar (the intake inserts it when its design is accepted)
depcheck: 237 roadmaps, 2342 edges, 0 problem(s)
```

There is no UPWARD and no CYCLE line. No supplier changed. Every new `*Needs:*` item is a section
of this roadmap from an earlier layer (§1.3, §2.2, §2.4, §3.3) or a pinned Mathlib declaration.

**`roadmaps resolve`** on the README: no cross-roadmap citation found nowhere, and no Lean name
found nowhere. The tool did not check names outside TauCetiRoadmap on this host, so I opened the
names this round adds or cites at the Mathlib pin myself:

- `ModelWithCorners.contDiffOn_extendCoordChange`: `Geometry/Manifold/IsManifold/ExtChartAt.lean:379`.
- `contDiffOn_ext_coord_change`: `:784`.
- `TopologicalSpace.Opens.instChartedSpace` and `TopologicalSpace.Opens.chartAt_eq`:
  `Geometry/Manifold/HasGroupoid.lean:284` and `:292`.
- `TauCeti.IsNullSet`: Tau Ceti `Geometry/Manifold/Measure.lean:36`. It quantifies over preferred
  charts and Haar measures, which is why §4.3 needs §3.3 to move null sets between charts.

**Overlaps and ownership.** The overlaps listing (`roadmaps overlaps`) reports no open pull request that changes this
roadmap, no dropped id and no id that only an open revision defines. This round states no new
construction; it only changes routes and `*Needs:*` lines. So I did not search open pull requests
for new owners. The ownership checks recorded in the review still stand.

**`Suggested.lean` / `#check` elaboration.** Not applicable: the package is at the design stage
and has no `Suggested.lean`. No Lean name of this roadmap was added or removed.

**Adversarial pass** on every changed statement:

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §4.5 (iii) "if", chart outside `W` | `f = tanh`, `W = (−1,1)`, `y₀ = 2`, and `y₀ = ±1` | `extChartAt 𝓘(ℝ,ℝ) y₀ = id`, source `ℝ ∋ tanh t`; representative at `(x₀, y₀)` is `tanh`, which is `id ∘ tanh`; `D = sech² = 1 − tanh²` | chart at a point outside `W` meets `f(M)`; §2.4 with `G = id` gives it | route + Check |
| §4.5 (iii), non-trivial coordinate change | `N = S¹ ⊂ ℂ`, `f(t) = e^{iπ tanh t}`, `W = S¹ ∖ {−1}`; projections from `1` and `−1`: `e^{iθ} ↦ cot(θ/2)`, `tan(θ/2)` | product `cot · tan = 1`, so the transition is `G(s) = 1/s`, `C¹` on `s ≠ 0`; representative in the chart at `−1` (projection from `1`, source `S¹ ∖ {1}`, meeting `f(ℝ)`) is `cot(π tanh t/2)` on `t ≠ 0` = `G(tan(π tanh t/2))`; `d/dt cot(π tanh t/2) = −csc²(π tanh t/2)(π/2)sech² t` = `G'(s) s'` = `−(1/tan²)·sec²·(π/2)sech² t` | §2.4 reproduces the derivative; formula consistent | none beyond route |
| §4.5 (iii), degenerate cases | `W = N`; `M = ∅`; `N` a `0`-manifold | `N ∖ W = ∅`, no extra chart; empty domains; chart at `y₀ ∉ W` has source `{y₀}` disjoint from `f(M) ⊆ W` | both sides hold | none |
| §4.5 (iii), same weak differential | tangent spaces of `W` and `N` (both `F`); chain rule at `y' ∈ ψ_y.source ∩ ψ.source` | `d(ψ ∘ ψ_y.symm)_{ψ_y y'} ∘ (dψ_y)_{y'} = (dψ)_{y'}` because `(ψ ∘ ψ_y.symm) ∘ ψ_y = ψ` near `y'` | the defining identity at `y₀` holds for the corestriction's field | route |
| §4.5 (ii), checked for the same gap | open cover `(Uᵢ)`, `x₀ ∉ Uᵢ` | the restricted charts `(chartAt x').restr Uᵢ`, `x' ∈ Uᵢ`, lie in the maximal atlas and cover `M`; §4.2's statement with this `𝒜` gives membership | §4.2 suffices; no omission | none |
| §4.3 route, existence | `M` Lindelöf; cover `φₖ.source ∩ f⁻¹ψⱼ.source` | `φₖ.source` second countable, so `f(φₖ.source)` is Lindelöf and countably many `ψⱼ` suffice; pieces are compared through §2.2 / §2.4 and agree a.e. by `HasWeakFDerivOn.ae_eq` in the chart at `x₀` | sound; §1.3, §2.2, §2.4 used directly | Needs + route |
| §4.3 chart formula, maximal-atlas chart | `M = N = ℝ`, `φ(x) = 2x`, `f = id` | coordinate change `y ↦ y/2`, derivative `1/2`; §2.2: `D(id ∘ (y/2)) = 1 · 1/2 = 1/2 = dψ ∘ Df ∘ dφ.symm` with `Df = 1`, `dφ.symm = 1/2` | matches the Conventions' direction witness | none |
| §4.3, null sets between charts | `B ⊆ e.source`, `e(B)` Haar-null, `e` a maximal-atlas chart | `θ = e : e.source → E` is a `C¹` local diffeomorphism and `B = θ⁻¹(e(B))`; §3.3 (i) gives null in `e.source`, then (iii) gives null in `M`; converse with `θ = e.symm` | §3.3 is the input | Needs |
| §4.2 route lemma | `e = (x ↦ 2x)`, `e' = id` on `ℝ`; `x ↦ x³` | `extendCoordChange e e' = (y ↦ y/2)`, `C^∞`; `x³ ∉ maximalAtlas` (inverse `y^{1/3}` not `C¹` at `0`) | `ModelWithCorners.contDiffOn_extendCoordChange` covers the first; the second is excluded, consistent with §4.1/§4.2's `{x ↦ x³}` Checks | citation fixed |
| §3.2 maximal-atlas clause | flat `ℝ`, chart `2x`; `g = 1/x` on `(0, ∞)` | `vol` in the chart is `(1/2) dy` (`|det| = 1/2`); `g ∘ e.symm = 2/y ∈ L^∞_loc((0,∞))` | comparable measures; same class | Needs |
| Supplier contract, open subsets | `HasGroupoid.lean:286`, `:292` | `chartAt x = (chartAt H x.1).subtypeRestr ⟨x⟩` (`rfl`) | the recorded property holds | contract clause |

**Convention witnesses recomputed.** The direction witness (`φ(x) = 2x`, `f = id`, `Df = 1`)
gives the same value through the new §4.3 route. The tanh value `Df = 1 − tanh²` is the same in
the §4.5 Check and in `plan.json`. No sign, norm, volume or Jacobian convention was touched.

## For the maintainer

- No name that other roadmaps cite changed, and no section was renumbered. QuasiregularMaps cites
  this roadmap by the headline labels T2–T4 and gap slugs, and none of these changed.
- The review's intake note still applies: this roadmap should be inserted before
  QuasiregularMaps in the merge order. That is the intake's decision, not this package's.
- The review's note about RiemannianGeometry also still applies. The transfer that the §3.1
  agreement Check names is stated at the head of RiemannianGeometry's open revision, while the
  id R4.6 exists on main. Nothing in this round changes that.
- No suspicious instructions were found in the review text.
