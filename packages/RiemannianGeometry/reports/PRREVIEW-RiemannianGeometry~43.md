# Review of RiemannianGeometry (pull request #2225 at 3a609d5)

**Verdict:** needs changes

## R01 (P3) — Scope still gives R4.7 every space-form quotient and lists neither new deferral

**Location:** `TauCetiRoadmap/RiemannianGeometry/README.md` lines 38–41: "R4.7 owns the completeness of the quotient … and the space-form quotients; PseudodifferentialOperators P7a consumes these".

**Claim:** R4.7 now leaves the curvature −1 quotients to GeometricTopology §7.1 (line 2386) and the RPⁿ ≃ₜ `Projectivization` comparison to AlgebraicTopology §4.6 (line 2417). Scope still claims all space-form quotients, and lists neither deferral.

**Witness:** ℍ²/Γ for a genus-two surface group Γ is a space-form quotient. GeometricTopology `README.md` on main, line 6700, owns it: "conversely every such quotient carries a hyperbolic metric".

**Repair:** In line 41, replace "and the space-form quotients;" with "and the space-form quotients in curvature 0 and 1; GeometricTopology §7.1 owns the curvature −1 case in dimensions n ≥ 1, and AlgebraicTopology §4.6 owns the homeomorphism from `TauCeti.RealProjectiveSpace` n to `Projectivization` ℝ (Fin (n+1) → ℝ) with its affine-chart comparison;".

## R02 (P3) — The curvature −1 consumption sentence drops the n ≥ 1 guard

**Location:** README lines 2386–2388: "The curvature −1 case (a complete hyperbolic manifold is ℍⁿ/Γ, with universal cover the upper half-space model) and that model's identification with `TauCeti.ModelGeometry` are GeometricTopology §7.1's, consumed here."

**Claim:** The replaced text said the hyperbolic case needs n ≥ 1. The new sentence has no bound and is false for n = 0. No target here depends on n = 0, since line 2426 treats dimension 0 separately, but the sentence contradicts that line.

**Witness:** On a point with model `EuclideanSpace ℝ (Fin 0)`, a `TauCeti.HyperbolicMetric` exists: completeness is trivial and both sides of the curvature tensor are 0. Its upper half-space model, `UpperHalfSpace (EuclideanSpace ℝ (Fin (0−1)))`, is (0,∞), which is one-dimensional.

**Repair:** Replace the sentence with "For n ≥ 1 the curvature −1 case (a complete hyperbolic n-manifold is ℍⁿ/Γ, with universal cover the upper half-space model in ℝⁿ⁻¹×ℝ) and that model's identification with `TauCeti.ModelGeometry` are GeometricTopology §7.1's, consumed here; for n = 0 the point satisfies the curvature hypothesis vacuously and has no half-space model."

## R03 (P3) — The GeometricTopology contract now says R4.7 extends Layer 1's "geometric identities and comparison theory"

**Location:** README lines 740–742: "Layer 1: the actual normal bundle and tubular neighbourhood theorem. This roadmap extends their geometric identities and comparison theory."

**Claim:** The deleted Layer 7 clause was the antecedent of "their". The sentence now credits GeometricTopology Layer 1 with geometric identities and comparison theory, and that layer states neither.

**Witness:** GeometricTopology `README.md` on main, Layer 1 (lines 783–1305, "manifolds with boundary, gluing, tubular neighbourhoods and handles"), contains no occurrence of "curvature" and no metric comparison theorem.

**Repair:** Delete "This roadmap extends their geometric identities and comparison theory." from lines 741–742.

## R04 (P3) — The Tau Ceti contract drops `TauCeti.HyperbolicMetric`'s standing hypotheses

**Location:** README lines 563–564: "`TauCeti.HyperbolicMetric` (`Hyperbolic.lean`) is a complete smooth Riemannian metric of constant curvature −1 on a manifold."

**Claim:** At the pin the structure exists only on a preconnected T3 manifold with a finite-dimensional model, and its curvature field is the tensor form. "On a manifold" omits these, whereas the neighbouring contract entries (e.g. `ext_of_mfderiv_eq`, line 557) state their binders.

**Witness:** `#check @TauCeti.HyperbolicMetric` at the pin gives `[FiniteDimensional ℝ E] … [T3Space M] [PreconnectedSpace M] … [IsManifold I ⊤ M]`. These are `Hyperbolic.lean` lines 42–45, and the field `curvature : … IsConstantCurvatureTensor … (-1)` is at line 63.

**Repair:** Replace the sentence with "`TauCeti.HyperbolicMetric` (`Hyperbolic.lean`) is a smooth Riemannian metric, complete for its Riemannian distance, whose curvature is the constant-curvature tensor with parameter −1, on a preconnected T3 smooth manifold modelled on a finite-dimensional space."

## Previous findings

- R01 — repaired: line 2417: "Consume AlgebraicTopology §4.6's homeomorphism from `TauCeti.RealProjectiveSpace` n to `Projectivization` ℝ (Fin (n+1) → ℝ) … together with §4.6's Hausdorffness". Line 2419 consumes §4.6's affine-chart comparison.
- R02 — repaired: line 2376: "Prove the Killing–Hopf universal-cover classification in curvature 0 and 1"; `killingHopf_hyperbolic` is deleted, and the `Suggested.lean` docstring (lines 39, 51) defers it to GeometricTopology §7.1. The repair introduced this report's R01 and R02.
- R03 — repaired: line 746: "Layer 7 §7.1 supplies R4.7's hyperbolic quotient description and the hyperbolic model-geometry identification". Lines 560–564 add the two Tau Ceti entries, and line 2325 cites them as Tau Ceti's. The repair introduced R03 and R04.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `killingHopf_euclidean` (Lean 369; README 2376) | n=0; n=1 with ((0,∞), dt²/t²); flat 2-torus | point ↔ `Fin 0` point; s=log t gives \|ds\|=dt/t, an isometry onto ℝ; torus has π₁=ℤ², so it is excluded | holds | none |
| `killingHopf_sphere` (Lean 379; README 2376) | n=1 line; n=2: S², RP² | line: curvature condition vacuous, length ∞ ≠ 2π, so `hn` is needed; S²: K=1; RP²: K=1, π₁=ℤ/2, excluded | holds with `2 ≤ n` | none |
| Curvature −1 sentence (2386) | n=0 point; n=1; n=2 genus 2 | n=0: the metric exists but the half-space model is 1-dimensional; n=1: ℍ¹≅ℝ, circles ℝ/⟨t↦eᴸt⟩; n=2: area 2π\|χ\|=4π | false at n=0 | R02 |
| Scope line 41 against GeometricTopology §7.1 | ℍ²/Γ, Γ a genus-2 group; S³/(ℤ/5) | the hyperbolic quotient is owned at main line 6700; the lens space is R4.7's (curvature 1) | overclaim | R01 |
| AlgebraicTopology §4.6 consumption (2417–2419) | RP¹: (1,0), (−1,0), (0,1), (3,4)/5 | ±(1,0) ↦ [1:0], scalar −1 with \|−1\|=1; (0,1) ↦ [0:1]; (3,4)/5 ↦ [3:4]; owner AT main line 1695 | matches the supplier | none |
| `ModelGeometry.Space` entry (560–563) | spherical, euclidean, hyperbolic | sphere(0,1) ⊂ `EuclideanSpace ℝ (Fin 4)`; `EuclideanSpace ℝ (Fin 3)`; `UpperHalfSpace (EuclideanSpace ℝ (Fin 2))`; 8 constructors | matches the pin | none |
| `HyperbolicMetric` entry (563–564) | two disjoint copies of ℍ²; compact genus 2 | disjoint union: complete, K=−1, but `PreconnectedSpace` fails, so there is no instance; genus 2: `ofCompactSpace` applies | binders omitted | R04 |
| GeometricTopology contract (740–746) | Layer 1 text, main lines 783–1305; §7.1, lines 6685–6720 | Layer 1: 0 curvature or comparison statements; §7.1: ℍⁿ/Γ, universal cover ℍⁿ, `ModelGeometry` identification | stale pronoun | R03 |

The rows for untouched statements stand as in the previous review, of `a2913c5`.

- **Gate.** Re-run at 3a609d5: every check is 0 and it ends `OK`. The outside-folder diffstat is empty.
- **Dependency check.** `depcheck: 206 roadmaps, 1912 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. GeometricTopology names RiemannianGeometry only as a consumer (main lines 214 and 7999), so consuming §7.1 creates no cycle.
- **Elaboration.** `lake env lean` on `Suggested.lean` gives 22 `declaration uses sorry` warnings (lines 112–590) and nothing else.
  - The removed import `Hyperbolic.UpperHalfSpace.Basic` is no longer referenced.
  - The `#check` binders of `killingHopf_euclidean` and `killingHopf_sphere` keep `ConnectedSpace`, `CompleteSpace` and `SimplyConnectedSpace`.
- **Library declarations opened at the pins: 3.** `TauCeti.ModelGeometry` (`ModelGeometry/Basic.lean:52`), `ModelGeometry.Space` (`:84`), `TauCeti.HyperbolicMetric` (`Hyperbolic.lean:51`, with `#check`).
- **Cross-roadmap citations resolved: 12.**
  - AlgebraicTopology on main, lines 1666 and 1688–1712, and at #1807, lines 1827 and 1857.
  - GeometricTopology on main, lines 6673, 6685–6720, 214 and 7999, and §7.1 at #1797, line 8484.
  - ConformalMappingPartII on main, lines 136, 266, 343 and 365; RicciFlow `Suggested.lean`, line 49.
- **Source locator rechecked: 1.** `spacetime-guided-tour` line 2845, Theorem 9 on page 60, still supports the curvature 0 and 1 cases as stated. The seeded sample §1.1–§2.3 lies in untouched text and stands as checked before.
- **Pull request text.** Checked against this head. The "Edits to the parent roadmap from its review" paragraph matches all three parent changes and the dropped `killingHopf_hyperbolic`. No sentence is contradicted.
- **Overlap check.** Read GeometricTopology, AlgebraicTopology, ConformalMappingPartII, MinimalSurfaces (it does not cite R4.7), LorentzianGeometry and RicciFlow.
  - The curvature −1 Killing–Hopf case is owned by GeometricTopology §7.1, and the RPⁿ ≃ₜ `Projectivization` comparison by AlgebraicTopology §4.6.
  - LorentzianGeometry consumes only R4.7's hyperboloid, and RicciFlow only the spherical quotients.
  - Remark: ConformalMappingPartII on main (lines 343 and 365) cites "R4.7 Killing–Hopf" for curvature −1 in dimension 2. That citation now resolves through line 2386's pointer to GeometricTopology §7.1.

## Not verifiable

- None in the changed text. `milnor-morse-theory` and `oneill-submersion` remain uncertified, as before.

## Source issues

- none
