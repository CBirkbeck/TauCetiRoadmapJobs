# FIX-DESIGN-LorentzianGeometry~6

Repair of the two findings of `REV-DESIGN-LorentzianGeometry~5` (one P2, one P3). Both are supplier-citation repairs; no mathematical statement of this roadmap changes. Since the review, the two supplier revisions it read at their heads have merged: on main (`4ec889e`) RiemannianGeometry's heading is `## Conventions` and DifferentialGeometry Layer 2.3 names the Tau Ceti declarations of `TauCeti/Geometry/Manifold/Instances/Comap.lean`. Both old citations were therefore broken on main itself, not only at an open head; the repairs cite main as it is now and the pinned Tau Ceti.

## F01 (P2) — applied differently

`packages/LorentzianGeometry/design/README.md` line 85: `Section "Conventions and suppliers" and R1` → `Section "Conventions", which fixes the curvature convention R(X,Y)Z = ∇_X∇_Y Z − ∇_Y∇_X Z − ∇_[X,Y] Z, and R1, "Intrinsic curvature calculus and normal-coordinate jets", with its positive-definite curvature identities`. `plan.json` RiemannianGeometry `sections`: `"Conventions and suppliers"` → `"Conventions"`.

Why differently: the suggested wording ("the convention that roadmap fixes before its first section") avoided a heading because the heading differed between main and the heads. Now that revision is on main, `## Conventions` (`TauCetiRoadmap/RiemannianGeometry/README.md:127`, formula at line 140) resolves exactly, and R1 is `### R1.` at line 863 (curvature identities, `### 1.1`, line 865). The only open pull request touching RiemannianGeometry carries a stale copy of the file but changes only its `Suggested.lean` against its merge base (`git diff --stat` printed: 2 lines in `RiemannianGeometry/Suggested.lean`, none in the README), so it drops no id. Lines 29, 412, 414 and 457 cite R1 only and need no change.

## F02 (P3) — applied differently

README lines 15, 44, 60 (new), 73, 512, 517, 553; `plan.json` 4.4 and DifferentialGeometry supplier. Old: `Layer 2.3, IsCoveringMap.inducedChartedSpace`. New: Layer 2.3 in prose ("smooth structures on covers"), plus the pinned declarations it names: Tau Ceti `IsLocalHomeomorph.chartedSpaceComap`, `isManifold_`, `contMDiff_…_iff`, `isLocalDiffeomorph_`, `compatible_chartedSpaceComap` (`Comap.lean:71, 101, 155, 173, 194`) and Mathlib `IsCoveringMap.isLocalHomeomorph` (`Topology/Covering/Basic.lean:339`).

Why differently: the review proposed dropping the name and keeping prose only. On main, DifferentialGeometry 2.3 (`TauCetiRoadmap/DifferentialGeometry/README.md:1149–1170`) now states that Tau Ceti carries the subsection and that "the id names these declarations for the roadmaps that cite it". It keeps `IsCoveringMap.inducedChartedSpace` only as another roadmap's alias for `hp.isLocalHomeomorph.chartedSpaceComap (H := H)`. No declaration of that name exists at the Tau Ceti pin `2fd255d9`. What exists at the pin is cited by its exact name and file. So the Tau Ceti contract gains one bullet (lines read at the pin: the definition is a `def`, not an instance; `isManifold_chartedSpaceComap` under `[IsManifold I n B]`; the lift criterion with its `Within`/`At`/`On` forms at lines 124, 139, 147). The Mathlib contract gains `IsCoveringMap.isLocalHomeomorph` (inside `namespace IsCoveringMap`, line 308). The §4.4 construction now names the smooth structure of `M̂` as the pulled-back charts. It was "topology and smooth structure in which … mapped homeomorphically", which fixes the topology but does not fix the smooth structure. The *Needs:* line says which declaration each step uses. In `plan.json` 4.4, five `mathlib:`/`tauceti:` prerequisites were added before `roadmap:DifferentialGeometry Layer 2.3`, which stays. Same pattern elsewhere: the Scope line 15 and Layer 4 Dependencies line 553 cited Layer 2.3 for the same object and now name the Tau Ceti definition too. No other occurrence of `inducedChartedSpace` or of a covering-space smooth structure exists in the README, `plan.json` or `sources.toml` (grep: zero hits).

## Checks

**Dependency check** (command of the brief), output:

```
candidate: LorentzianGeometry is not in the merge order yet; checked as if placed after QuasiregularMaps (the intake inserts it when its design is accepted)
depcheck: 234 roadmaps, 2111 edges, 0 problem(s)
```

No UPWARD or CYCLE line. No supplier was added: the new citations are the Mathlib and Tau Ceti pins.

**Citation resolver** (`roadmaps resolve` on the edited README with the pinned packages): no cross-roadmap citation found nowhere. The Lean leads drop from 14 to 13: `IsCoveringMap.inducedChartedSpace` is gone, and the six new library names resolve at the pins. The 13 left are this roadmap's own target names (`TauCeti.Manifold.Spacetime`, `…isNull_iff`, `…hyperplane_classification` and the like), which the package-stage `Suggested.lean` will declare.

**Every supplier citation re-resolved on main `4ec889e`:** HopfRinow `Completed/HopfRinow/README.md:265` (Layer 1, "Nondegenerate Levi-Civita supplier"); DifferentialGeometry `:203` ("Boundary and corners"), `:1149` (2.3), `:2848` (12.2, `TauCeti.Manifold.mgradient`), `:2871` (12.3, `laplaceBeltrami`); PDE `:996` (§1.7, `C^{k,α}_loc(Ω)` defined in that subsection); PseudodifferentialOperators `:164` (P1.0), `:1337` (§5.4); RiemannianGeometry `:127`, `:140`, `:863`; LocalVariationalFieldTheory `:601` (§3.8), `:612` (`η=diag(+1,−1,−1,−1)`), `:150` (LVF1–LVF6).

**Overlaps.** `roadmaps overlaps LorentzianGeometry`: not on main or in an open pull request, so there is no tool output. The scratch `overlaps.md` lists none dropped. Open pull requests touching the suppliers were read by hand. The multi-roadmap Tau Ceti bump changes only the two suppliers' `Suggested.lean`. The DifferentialGeometry draft (483 lines) and the PDE revision (699 lines) are whole-file early drafts that do not revise the cited ids. Ownership of the changed object, the pulled-back charted structure: it is in the pinned Tau Ceti and DifferentialGeometry 2.3 names it, so this roadmap owns nothing new.

**`Suggested.lean` and the `#check` comparison:** not applicable. This is the design stage, and the package has no `Suggested.lean`; nothing was elaborated.

**Sources:** no new source is cited. `sources.toml` is unchanged and no `needs-references.toml` was written.

## Adversarial pass on the changed statements

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| §4.4 smooth structure of `M̂` = charts pulled back along `p` | Minkowski `ℝ²`; flat Möbius band; `M = ∅`; `n = 0` (`M = ℝ`, `g = −dt²`) | `M̂ = ℝ² ⊔ ℝ²`, each sheet's pulled-back chart is the identity chart; Möbius: `M̂ = ℝ × ℝ/2ℤ`, deck map `(t, y) ↦ (−t, y + 1)` is smooth in the pulled-back charts; `M̂ = ∅`; `n = 0`: cones are the half-lines `±ℝ_{>0}`, `M̂ = ℝ ⊔ ℝ` | holds; same model `I` (corners allowed: `Comap.lean` is for any `ModelWithCorners`) | clause added |
| "only structure up to compatibility making `p` a local diffeomorphism" | wrong model: sheet chart `x ↦ x³` on one copy over `ℝ` | in that chart `p` reads `y ↦ y^{1/3}`, derivative `(1/3)y^{−2/3}` unbounded at `0`: `p` not a local diffeomorphism, so excluded; the pulled-back chart gives `p` = identity in coordinates | uniqueness is `compatible_chartedSpaceComap` (needs `[IsManifold I n M]`, the standing `IsManifold I ∞ M`) | none |
| lift `ι̂` smooth (§4.4 *Needs:*) | Möbius quotient `π : ℝ² → M`, `[∂_t]`; `N = ∅` | `ι̂(t, x) = (t, x mod 2)`: continuous, `p ∘ ι̂ = π` smooth, so `ι̂` smooth by `contMDiff_chartedSpaceComap_iff`; continuity in general: `ι̂⁻¹(sheet of X) = {y : g(dι_y T(y), X(ι y)) < 0}`, open | holds; `N` may have its own model (`I'` in the lemma) | `*Needs:*` names it |
| covering ⇒ local homeomorphism | `IsCoveringMap.isLocalHomeomorph` at `:339` | `hf : IsCoveringMap f` is the section variable, protected theorem in `namespace IsCoveringMap` (`:308`) | holds | Mathlib contract |
| Tau Ceti contract bullet | each name printed at `Comap.lean` | `:71` `noncomputable def`, `@[instance_reducible]`, no `instance`; `:101` `[IsManifold I n B]`; `:155` `ContMDiff I' I n f ↔ Continuous f ∧ ContMDiff I' I n (p ∘ f)`; `:173` `IsLocalDiffeomorph I I n p`; `:194` compatibility under `[IsManifold I n B] [IsManifold I n M]` and `IsLocalDiffeomorph I I n p` | prose matches the declarations | bullet added |
| RiemannianGeometry convention (F01) | de Sitter `−dt² + cosh²t dx²`; Milne `−dt² + t²dx²`; round `S²` | general `a(t)`: `R(∂_t,∂_x)∂_x = aa''∂_t`, `R(∂_x,∂_t)∂_t = −(a''/a)∂_x`, `Ric_tt = −a''/a`, `Ric_xx = aa''`, `Scal = 2a''/a`: `2` (de Sitter), `0` (Milne); `S²`, `a = sin θ`: `⟨R(∂_θ,∂_φ)∂_φ, ∂_θ⟩ = −aa'' = sin²θ`, `K = 1`, as RiemannianGeometry `:140–144` requires | the two conventions agree; the README's Conventions witness (line 29) stands | citation only |

## For the maintainer

- No id of this roadmap changed. This is a design package, so no other roadmap cites it.
- The README now cites Tau Ceti's `IsLocalHomeomorph.chartedSpaceComap` family directly, at pin `2fd255d9`. A Tau Ceti bump that renames `Instances/Comap.lean` would need these lines re-pinned.
- No text read this round contained instructions.
