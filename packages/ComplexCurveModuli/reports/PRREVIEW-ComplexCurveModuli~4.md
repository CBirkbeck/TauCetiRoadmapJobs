# Review of ComplexCurveModuli (pull request #2548 at 4b53f57)

**Verdict:** accepted

**Summary.** Accepted, with one small correction and no format notes, none of them blocking. The previous finding is repaired. `Suggested.lean` now states uniqueness on punctured surfaces, and existence and uniqueness of hyperbolic metrics with geodesic boundary through a predicate `HasGeodesicBoundary`. All three statements are true at the pins: `TauCeti.HyperbolicMetric` includes completeness, and the Levi-Civita connection, geodesics and `ModelWithCorners.boundary` are all defined at boundary points. The one small correction is that the new geodesic-boundary condition should cite RiemannianManifoldsWithConvexBoundary §1.4, which owns the second fundamental form of the boundary. Nothing is left for the human reviewers.

## C01 — The geodesic-boundary condition of §0.4 does not cite RiemannianManifoldsWithConvexBoundary §1.4, the owner on main of the second fundamental form of the boundary

A consumer who knows that a boundary has vanishing second fundamental form, or geodesic curvature zero, has no stated bridge to `HasGeodesicBoundary`. One example is a Nielsen core in FuchsianOrbifoldsPartII, which consumes §0.4. The README then states this identification without saying where the notion lives: "so the condition says that the boundary has geodesic curvature zero" (§0.4, lines 316–317).

RiemannianManifoldsWithConvexBoundary is on main and is a legal supplier of this revision. Its §1.4 (main, lines 563–602) defines `II` of `∂M` on Mathlib's `𝓡∂ (n+1)` and proves `II_q(u, w) = ⟨∇_(dι u) W, ν_in(q)⟩` for vector fields W tangent to the boundary. Its line 103 records `II = k_g ds²` for surfaces, with the geodesic curvature of RiemannianGeometry/Surfaces 1.2. Neither roadmap is named in §0.4, in its *Needs:* line or in the supplier contracts.

Nothing is restated, so this is a missing citation, not a second owner. One sentence in the *Boundary* paragraph would close it, for example: "For a unit-speed boundary curve the tangential part of the covariant acceleration vanishes and the normal part is `II(γ′, γ′)` (RiemannianManifoldsWithConvexBoundary §1.4), so `HasGeodesicBoundary g` holds exactly when `II ≡ 0`." RiemannianManifoldsWithConvexBoundary §1.4 would then be added to the *Needs:* line and to the supplier contracts. Another option is to cite §1.4 only in the existing commentary sentence.

## Previous findings

- R01 — repaired: §0.4 now reads "Prove `exists_hyperbolicMetric_metric_eq_rescale_hasGeodesicBoundary_of_eulerChar_neg` … Prove `eq_of_metric_eq_rescale_of_hasGeodesicBoundary`". `Suggested.lean` states both (lines 152 and 166), punctured uniqueness (line 118) and `HasGeodesicBoundary` (line 139). The bordered bullet is gone from the docstring's list of results it calls not statable.

## Deferred findings

- D01 — stands.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| `eq_of_metric_eq_rescale_restrictOpenTangentSpace` (Lean 118) | genus 2, P = ∅; sphere ∖ 3 points; genus-2 metric restricted to M ∖ {p} | closed case is pinned ClosedSurface.lean:105; conformal automorphisms of the disc are isometries; the restriction is incomplete, excluded by the `complete` field | true | none |
| "no bound on \|P\|" (README 305–307, Lean 116–117) | sphere ∖ 2 points (2 = \|P\|); ℝP² ∖ 1 point (1 = 1); torus, P = ∅ | universal cover ℂ; double cover ℂ*; Gauss–Bonnet area 0; no complete hyperbolic metric in any case, so uniqueness is vacuous | true | none |
| `HasGeodesicBoundary` (Lean 139) | flat [0,1] × ℝ/2πℤ; flat unit disc; empty boundary | (0, ±t + c)″ = 0, holds; (cos t, sin t)″ has norm 1, fails; vacuous | determines geodesic boundary | none |
| Unit-speed clause of `HasGeodesicBoundary` | (0, t + t³) on the cylinder | acceleration (0, 6t) ≠ 0, so without the clause no metric with boundary qualifies | clause needed, Check true | none |
| Bordered existence (Lean 152) | pants χ = −1; annulus χ = 0; disc χ = 1; Möbius band minus a disc; empty boundary | area −2πχ = 2π, double of genus 2; area 0 and −2π are impossible; double cover has χ = −2; reduces to the closed case | true; RS 17.3 (lines 3318–3321) for oriented surfaces | none |
| Bordered uniqueness (Lean 166) | pants; pants without the geodesic hypotheses; annulus | Fermi collar dr² + ℓ²cosh²r dθ² is even in r, so both metrics double to the genus-2 double and are equal there; restrictions from two collar enlargements differ; vacuous | true; hypotheses needed, hence `[I.Boundaryless]` at :105 | none |
| §0.4 Gauss–Bonnet Check | pants, annulus | −A + ∫κ ds = 2πχ with κ = 0 gives 2π and 0 | true | none |
| §6.2 geodesic-cut metric (sample; cites §0.4 uniqueness) | once-punctured torus cut along a simple geodesic | pants with 2 geodesic boundaries and 1 cusp; its double is a torus minus 2 points, χ = −2; Lean 118 applies on the double | supported | none |
| RS 17.3 locator (§0.4 *Boundary*) | 17.1 stable type, 17.2 hyperbolic metric, 17.3 | for compact bordered W with n = 0, stable means χ < 0; geodesic boundary is in the definition; the map is a bijection, so existence and uniqueness hold | supported | none |

The rows for the statements this change does not touch stand as in the previous review, of `6d27467`.

- Source locators checked against the text: RobbinSalamon2006 (arXiv v4) 17.1–17.3, lines 3298–3325 (page 78), for the new *Boundary* paragraph; 17.4 at line 3326 for §6.2.
- Library declarations opened at the pins: `TauCeti.HyperbolicMetric` (Hyperbolic.lean:51, `complete` field); `TauCeti.Manifold.IsGeodesicCurveOn` and `IsGeodesicCurve` (Geodesic/Basic.lean:100–121); Mathlib `CovariantDerivative.leviCivitaConnection` (VectorBundle/CovariantDerivative/LeviCivita.lean:360, Koszul formula through `mfderiv`, no boundaryless hypothesis); `ModelWithCorners.boundary` (IsManifold/InteriorBoundary.lean:112); `modelWithCornersEuclideanHalfSpace` (Instances/Real.lean:200); `rescale` (Conformal.lean:87, `f • g`); `eq_of_metric_eq_rescale` (ClosedSurface.lean:105, `[I.Boundaryless]`); `eq_of_scalarCurvature_rescale_eq` (CurvatureEquation.lean:166, compact and boundaryless). Nothing at the pins proves the three new theorems.
- Cross-roadmap citations resolved: FuchsianOrbifoldsPartII line 817 and TeichmullerGeometry line 567 (open heads) consume §0.4; ConformalMappingPartII (main lines 25 and 134) consumes it; RiemannianManifoldsWithConvexBoundary §1.4 (main). The change renames no heading or id.
- Automatic checks: all passed, none set aside. Dependency check: `depcheck: 200 roadmaps, 2201 edges, 0 problem(s)`. No change outside the folder.
- Elaboration: `lake env lean` of `Suggested.lean` gives seven `sorry` warnings (lines 70, 81, 100, 118, 152, 166 and 186) and nothing else. One-tactic probes (`rfl`, `simp`, `aesop`, `infer_instance`, `ext; simp_all`, `cases; simp_all`) close none of the three new theorems.
- The elaborated types of the four new declarations match README §0.4. No binder is lost, and the file was not changed.
- Checks evaluated: the two changed bullets of §0.4, both true.

Overlap check: read AnalyticStableMaps (main and its open head), TeichmullerGeometry, FuchsianOrbifoldsPartII, HeegaardFloer, DGFloer and GromovWittenTheory (main), and, for the objects this change adds, RiemannianManifoldsWithConvexBoundary and GeometricTopology. Nothing is shared. This roadmap owns bordered and punctured uniformization, which TeichmullerGeometry, FuchsianOrbifoldsPartII and ConformalMappingPartII consume. RiemannianManifoldsWithConvexBoundary §1.4 owns `II` of the boundary, and no roadmap defines a geodesic-boundary predicate, so the definition here is not a second owner (C01 asks only for the citation).

Source independence: changed passages only. 9 passages were compared with 1 source (RobbinSalamon2006 17.1–17.3, lines 3298–3325): the punctured-uniqueness sentence, the definition of geodesic boundary, the bordered existence and uniqueness sentences, the doubling route, the two new Checks, and the docstrings of `HasGeodesicBoundary` and the bordered existence theorem. The two new supplier-contract entries were set beside their pinned docstrings. Nothing is shared beyond standard terms ("holomorphic double", "closed geodesic"). Largest share: RobbinSalamon2006, 21 of 24 body locators (this change adds 17.3 once). The arrangement was not compared again, since no layer was added, removed or reordered.

Research link: Layers 3–6 are Robbin and Salamon's analytic construction of the Deligne–Mumford orbifold (2006, corrigendum 2007), and §4.5 extends it to every restricted family. AnalyticStableMaps and GromovWittenTheory build stable-map moduli and Gromov–Witten operations on it. This rests on the README's Downstream consumers and References, and on RobbinSalamon2006 §§5–6 and 17.

## Not verifiable

- Robbin–Salamon corrigendum, J. Eur. Math. Soc. 9 (2007): behind a subscription and recorded as uncertified; not needed for the changed passages.
- Robbin–Salamon 2006, journal version: behind a subscription; the README cites the arXiv v4 numbering, which was read.
- Hummel's book, cited through Robbin–Salamon §17: not consulted; the README proves those ingredients itself rather than citing them.

## Source issues

- none

## For the human reviewers

- none
