# Review of Varifolds (pull request #2443 at 2a4c677)

**Verdict:** accepted

## Previous findings

- R01 — repaired: `Suggested.lean` lines 46–51, "On each copy, `EMetricSpace.ofRiemannianMetric` gives the Riemannian extended distance with `IsRiemannianManifold` (its `T3Space` hypothesis transported from `M` along `TauCeti.WithMetric.homeomorph`) … What is missing is the identification of §1.2"
- R02 — repaired: `Suggested.lean` line 180, `/-! ## Layer 3: push-forward, blow-ups and tangent spaces -/`, the title of README line 779.
- R03 — repaired: description, "Dependencies, all roadmaps on main (the Lean imports none of them): GeometricMeasureTheory G2; GeometricCurrents G1, G2, G5 and G6; RiemannianGeometry R4 item 1, R5a and R5a.2; HopfRinow (Completed) Layers 0–2."

## Verified sound

| Statement | Instances tried | Values, one side | Values, other side | Result | Change |
|---|---|---|---|---|---|
| §1.2 map `G_k^g → G_k^h`, the carrier the changed bullet names as missing | h = diag(1, 4) and h = 4e on ℝ², u = (1, 1), k = 1 | h-projection onto span u sends e₁ to u/5; e-projection sends it to u/2 | h = 4e: ratio 4/8, so u/2: the identity | holds: the map is not the identity on projections, and the pins have none | none |
| `EMetricSpace.ofRiemannianMetric` on `TauCeti.WithMetric g` | M = ℝ, g = e^{2t}dt², points 0 and 1 | distance on the copy: ∫₀¹ eᵗ dt = e − 1 ≈ 1.718 | `[EMetricSpace M]` gives 1, so the copy needs its own distance | holds; the probe gets `T3Space` from `(homeomorph g).symm.t3Space` and `IsRiemannianManifold` from `inferInstance` | none |
| `chartC2Topology` as `g_i → g` in C² on compact sets | g_i = (1 + 1/i)²e; g_i = (1 + i⁻² sin(i y₁))e on ℝ² | first: sup of orders 0, 1, 2 of g_i − e is 2/i + 1/i², 0, 0, all → 0 | second: i⁻², i⁻¹, 1, so C¹ convergence holds and C² fails, and the sequence is excluded | holds; Topology.lean:112 controls orders ≤ 2 uniformly on compact chart sets | none |
| `rectifiable_compactness` on the copy, and the varying form of §7.4 | g_i = (1 + 1/i)²e, V_i the g_i-varifold of a line L, k = 1 | the §1.2 map is the identity (h = c²g); ‖V_i‖(B₁(0)) = 2(1 + 1/i); Θ_{g_i} = 1 | the limit v(L, 1) has mass 2 and Θ = 1, and is rectifiable and stationary, as §7.4 concludes | holds; the probe instantiates `rectifiable_compactness` at `WithMetric g` | none |

The rows for untouched statements stand as in the previous review, of a85c365.

- Source locators checked against the text: 4, for the sample targets that the changed bullet cites (1.2, 7.4, 7.6). They are Simon1983 line 7301–7305 and AgnolettoCorreaHoyosDaSilvaNardulli2025 line 151–156 (1.2), Simon1983 line 7886–7898 (42.7) and Simon1983 line 7899–7912 (42.8). Each supports the statement as written.
- Library declarations opened at the pins: 7.
  - `EMetricSpace.ofRiemannianMetric` (`Mathlib/Geometry/Manifold/Riemannian/Basic.lean:546`, taking `[T3Space M]`), with its `IsRiemannianManifold` instance at lines 533–537.
  - `Homeomorph.t3Space` (`Mathlib/Topology/Separation/Regular.lean:476`) and `Homeomorph.secondCountableTopology` (`Mathlib/Topology/Homeomorph/Lemmas.lean:36`).
  - `TauCeti.WithMetric.homeomorph` (`TauCeti/Geometry/Manifold/Riemannian/WithMetric.lean:126`).
  - `Bundle.ContMDiffRiemannianMetric.chartC2Topology` (`TauCeti/Geometry/Manifold/VectorBundle/Riemannian/Topology.lean:270`).
  - `TauCeti.Manifold.ContMDiffNondegenerateMetric.leviCivitaConnection` (`…/LeviCivita/Nondegenerate/Existence.lean:102`).
- Probe: a copy of `Suggested.lean` with `#check` of these names and one `example` gives 0 errors. On `TauCeti.WithMetric g`, the example builds the instances the bullet describes, adds `SecondCountableTopology` along `homeomorph`, and instantiates `grassmannBundle` and `rectifiable_compactness`.
- Statability: neither pin has a map between the Grassmann bundles of two metrics. The Tau Ceti files that mention Grassmann are algebraic, and nothing under `Mathlib/Geometry` mentions it. The varying-metric form's other inputs exist, so the bullet names the one carrier the pins lack.
- Cross-roadmap citations in the description's dependency paragraph, resolved on main (ef3d21f): 14 of 14. They are GeometricMeasureTheory G2; GeometricCurrents G1, G2, G5, G6; RiemannianGeometry R4, R5a, R5a.2, R5b; MinimalSurfaces 3.1, 3.3; HopfRinow Layers 0–2.
- Gate: every check passes. Dependency check: `depcheck: 255 roadmaps, 2429 edges, 0 problem(s)`.
  - Elaboration (`lake env lean`): 15 `declaration uses sorry` warnings and nothing else.
  - The diff touches only a docstring and a section comment, so no declaration's type changed, and the previous `#check @name` comparison and one-tactic probe stand.
  - The seven Lean layer comments match README Layers 1–4 and 6–8.
- Pull request text, checked against this head: no sentence is contradicted. Since a85c365 no layer, heading, declaration or supplier was added, removed or renumbered.
- Remark (untouched text): the README's `From Tau Ceti` contract does not list `TauCeti.WithMetric` or `chartC2Topology`. The docstring now names both for Layer 7's varying-metric setting.

Overlap check: scope of GaussianIsoperimetryAndClusters, HyperbolicDynamicsAndThermodynamicFormalism, ManifoldOptimization, LorentzianGeometry, RealSemisimpleLieGroups (open) and GeometricCurrents, RiemannianGeometry, MinimalSurfaces (main) as read in the previous review. The change adds no object. Owners are unchanged: unoriented Grassmann bundle, GeometricCurrents G6; auxiliary varifold's monotonicity, G6 (compared in 9.3); smooth convex hull, MinimalSurfaces 3.3; first volume variation, RiemannianGeometry R5a.2. This round, `varifold` occurs in no other open roadmap; on main it occurs only in GeometricCurrents, GeometricMeasureTheory and MinimalSurfaces, all cited here.

Source independence: changed passages only, 2 passages (the rewritten docstring bullet and the Layer 3 section comment) compared with 2 sources (Simon1983 lines 7296–7310 and 7882–7912; AgnolettoCorreaHoyosDaSilvaNardulli2025 lines 150–158). Nothing is shared beyond standard names. Largest share: Simon1983, 90 of 148 locators (the README is unchanged). Contents not compared again, since no layer was added, removed or reordered; the previous comparison with Simon1983's contents found them independent.

## Not verifiable

- Allard1972, Section 6 (cited with Simon1983 for 7.4 and 7.6), is uncertified in the manifest (paywalled) and was not read.
- The displays of the Simon1983 42.8 proof that 7.6's route follows (around line 7978) are illegible in the extraction, as in the previous review.

## Source issues

- none

## For the human reviewers

- none
