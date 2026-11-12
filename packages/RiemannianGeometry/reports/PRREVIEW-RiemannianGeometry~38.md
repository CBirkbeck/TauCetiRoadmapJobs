# Review of RiemannianGeometry (pull request #2225 at a2913c5)

**Verdict:** needs changes

## R01 (P2) — R4.7 and AlgebraicTopology §4.6 both own the RPⁿ ≃ₜ `Projectivization` comparison

**Location:** `TauCetiRoadmap/RiemannianGeometry/README.md` line 2411: "Construct its comparison with AlgebraicTopology AT4.6's native `Projectivization` … compact-to-Hausdorff gives the homeomorphism. … This comparison is an owned construction"; line 2413: "Compare it with … AT's designated projective atlas".

**Claim:** AlgebraicTopology §4.6 is on main and supplies this roadmap. It owns this homeomorphism and its affine-chart comparison, and it names R4.7 as their consumer, so the object has two owners. This finding is not repaired: the parent README is byte-identical to `0ba7c9c`.

**Witness:** AlgebraicTopology `README.md` on main:
- Line 1695: "Own the homeomorphism from `TauCeti.RealProjectiveSpace n` to `Projectivization ℝ (Fin (n+1) → ℝ)` … and its smooth local comparison with the affine charts".
- Line 1709: "This supplies RiemannianGeometry R4.7's single real projective carrier".

**Repair:**
- In line 2411, replace the text from "Construct its comparison" through "not supplied by the mere generic quotient theorem." with: "Consume AlgebraicTopology §4.6's homeomorphism from `TauCeti.RealProjectiveSpace` n to `Projectivization` ℝ (Fin (n+1) → ℝ), induced by v↦[v] on the unit sphere after the `WithLp` linear homeomorphism, together with §4.6's Hausdorffness of Mathlib's quotient topology."
- In line 2413, replace the text from "In the projective chart" through "no second projective manifold/topology is installed." with: "Through that homeomorphism, §4.6's smooth comparison with the affine charts identifies the lifted smooth antipodal-cover atlas with AT's projective atlas; no second projective manifold or topology is installed."

## R02 (P2) — R4.7 and GeometricTopology §7.1 both own the hyperbolic case of Killing–Hopf

**Location:** README line 2372: "`killingHopf_hyperbolic`: a connected complete simply connected Riemannian manifold … with constant sectional curvature … −1 is isometric to … the upper half-space model". `Suggested.lean` line 388 states `killingHopf_hyperbolic`. README line 2321 says "compare with GT Layer 8's native `ModelGeometry.Space`".

**Claim:** GeometricTopology §7.1 is on main and supplies this roadmap. It proves that a complete hyperbolic manifold is ℍⁿ/Γ, that its universal cover is ℍⁿ, and that this model is identified with `TauCeti.ModelGeometry`. The curvature −1 classification therefore has two owners. This finding is not repaired.

**Witness:** GeometricTopology `README.md` on main:
- Line 6698: "a complete hyperbolic manifold is a quotient `ℍⁿ / Γ`".
- Line 6705: "A complete hyperbolic manifold has universal cover `ℍⁿ`".
- Line 6693: "Identify it with `TauCeti.ModelGeometry`".
- Line 7999 lists RiemannianGeometry among its consumers.

**Repair:**
- In R4.7 (lines 2371–2382), state the classification and the quotient description for curvature 0 and 1 only, and add: "The curvature −1 case (a complete hyperbolic manifold is ℍⁿ/Γ, with universal cover the upper half-space model) and that model's identification with `TauCeti.ModelGeometry` are GeometricTopology §7.1's, consumed here."
- In line 2321, replace "compare with GT Layer 8's native `ModelGeometry.Space` in dimension 3" with "compare the Euclidean and round models with Tau Ceti's `TauCeti.ModelGeometry.Space` in dimension 3".
- Delete `killingHopf_hyperbolic` from `Suggested.lean` (lines 383–394) and from README line 2372.
- In the `Suggested.lean` docstring at line 40, replace "the three cases of the Killing–Hopf classification" with "the Euclidean and spherical cases of the Killing–Hopf classification", and add "The hyperbolic case is GeometricTopology §7.1's."

## R03 (P3) — The GeometricTopology contract cites layers for objects they do not hold

**Location:** README line 736: "Layer 7: the existing intrinsic curvature construction and `TauCeti.riemannianVolume`". Line 742: "Layer 8 owns the eight three-dimensional model geometries". Line 2321: "GT Layer 7’s `HyperbolicMetric`".

**Claim:** On main, GeometricTopology Layer 7 is "hyperbolic structures, volume and rigidity" (line 6673) and Layer 8 is "decompositions of 3-manifolds and geometrization" (line 7101). The three objects cited are Tau Ceti declarations at the pin. This finding is not repaired.

**Witness:** At the Tau Ceti pin:
- `TauCeti.ModelGeometry` (`Riemannian/ModelGeometry/Basic.lean:52`, eight constructors), with `Space` at `:84`.
- `TauCeti.HyperbolicMetric` (`Riemannian/Hyperbolic.lean:51`).
- `TauCeti.riemannianVolume` (`Riemannian/VolumeDensity/Volume.lean:82`).

**Repair:**
- In the GeometricTopology bullet (lines 735–745), delete "Layer 7: the existing intrinsic curvature construction and `TauCeti.riemannianVolume`."
- In the same bullet, replace "Layer 8 owns the eight three-dimensional model geometries; R4.7 compares its constant-curvature models with their native `ModelGeometry.Space` instances." with "Layer 7 §7.1 supplies R4.7's hyperbolic quotient description and the hyperbolic model-geometry identification."
- Add `TauCeti.ModelGeometry.Space` and `TauCeti.HyperbolicMetric`, with their files, to the Tau Ceti contract.
- In line 2321, replace "GT Layer 7’s `HyperbolicMetric`" with "Tau Ceti's `TauCeti.HyperbolicMetric`".

## Previous findings

- R01 — not repaired: line 2411 still reads "Construct its comparison with AlgebraicTopology AT4.6's native `Projectivization` ℝ (Fin (n+1) → ℝ) … This comparison is an owned construction".
- R02 — not repaired: README line 2372 and `Suggested.lean` line 388 still state `killingHopf_hyperbolic`, the curvature −1 case that GeometricTopology §7.1 owns.
- R03 — not repaired: line 736 still reads "Layer 7: the existing intrinsic curvature construction and `TauCeti.riemannianVolume`", and line 742 still reads "Layer 8 owns the eight three-dimensional model geometries".

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| R4.7 RPⁿ comparison (line 2411) against AlgebraicTopology §4.6 (main line 1695) | RP¹; unit vectors (1,0), (−1,0), (0,1) | (1,2) and (2,4) give one line; ±(1,0) give one point (scalar −1, absolute value 1); (1,0) and (0,1) are distinct; v↦[v] is owned twice | true; second owner | R01 |
| `killingHopf_hyperbolic` against GeometricTopology §7.1 (main lines 6698, 6705) | n=1; n=2, simply connected | n=1: (0,∞) with dt²/t² ≅ ℝ by log t. n=2: §7.1's universal cover ℍ², Γ trivial, gives the same isometry | true; second owner | R02 |
| GeometricTopology contract (lines 736–742) | main headings at lines 6673 and 7101; the Tau Ceti pin | Layer 7 is hyperbolic structures, Layer 8 is decompositions; pinned `ModelGeometry` has 8 constructors | stale locators | R03 |
| Lines 14–18, "the logarithmic cutoff at a point", against Surfaces 6.1 `logCutoffProfile` at head | ε=0.01, δ=1; r=0.005, 0.015, 0.1, 0.75, 1, 2 | ψ = 0, 0.0588, 0.5 (=λ), 0.9793, 1, 1; zero on (0,ε], λ on [2ε,δ/2], 1 on [δ,∞) | holds | none |
| Surfaces 6.1 energy, credited to the sub-roadmap by line 18 | δ=1, ε=e⁻¹⁰, Λ=10: plane, unit sphere, hyperbolic plane | 2π/Λ = 0.6283; (2π/Λ²)∫sin r/r² = 0.6232; with sinh, 0.6337; deviations −0.0051 and +0.0054, within δ²/Λ² = 0.01 | holds | none |
| Line 4039, the sub-roadmap "supplies nothing to this roadmap" | Surfaces 6.1 and 6.2 *Needs:* (lines 850, 904); contract line 208; downstream line 930 | Layer 6 uses Surfaces 1.1 and 1.4, Mathlib, Tau Ceti and DG 12.4, and no parent section; the supplier list R1, R2, R3, R4.2, R4.9.6a, R6 agrees | holds | none |

The rows for untouched statements stand as in the previous review, of `0ba7c9c`.

- **Gate.** Re-run at a2913c5: every check is 0 and it ends `OK`. The outside-folder diffstat is empty. The change since `0ba7c9c` is 66 lines, all in `Surfaces/`, and the parent `README.md` and `Suggested.lean` are identical to `0ba7c9c`.
- **Dependency check.** `depcheck: 206 roadmaps, 1912 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- **Elaboration.** `lake env lean` on `Suggested.lean` gives 23 `declaration uses sorry` warnings (lines 109–600) and nothing else.
  - The file is unchanged, so the one-tactic probe and the `#check` binder pass stand as in the previous review.
  - The three new declarations are in `TauCetiRoadmap.RiemannianGeometry.Surfaces`, and no parent declaration shares their names.
- **Library declarations opened at the pins: 4.** `TauCeti.ModelGeometry` (`Basic.lean:52`), `ModelGeometry.Space` (`:84`), `TauCeti.HyperbolicMetric` (`Hyperbolic.lean:51`), `TauCeti.riemannianVolume` (`Volume.lean:82`).
- **Cross-roadmap citations resolved: 9.**
  - On main `7342e8f`: AlgebraicTopology lines 1695 and 1709; GeometricTopology lines 6673, 6693–6705, 7101 and 7999.
  - At this head: Surfaces lines 208, 850 and 930.
  - The overlap leads are unchanged: GeneralizedCohomology G4.0b and AT4.6 are in untouched text and were resolved by the previous review.
- **Pull request text, checked against this head.**
  - The "Edits" paragraph matches the head: the parent sentence (lines 14–18), the Surfaces downstream sentence (line 930) and the three `Surfaces/Suggested.lean` declarations (lines 313, 322 and 338).
  - The title names the added layer.
  - No sentence is contradicted, and no parent change is left unstated.
- **Seeded sample §1.1–§2.3.** It lies in untouched text, so its 24 locators stand as checked in the previous review.
- **Overlap check.** I read MinimalSurfaces, PositiveMass, CanonicalModelsAndGonality, GeometricCurrents, LorentzianGeometry and Surfaces. Shared objects and their owners:
  - The cutoff at a point: Surfaces S6. MinimalSurfaces (line 171) consumes it.
  - The cutoff at infinity: PositiveMass §3.3 and GeometricCurrents P3c (line 954).
  - CanonicalModelsAndGonality (lines 1757, 1814) uses a cutoff inside proof sketches and owns no cutoff target.
  - LorentzianGeometry consumes R1.3, R2–R3 and R5a only.
  - The RPⁿ comparison is owned by AlgebraicTopology §4.6 (R01), and the curvature −1 Killing–Hopf case by GeometricTopology §7.1 (R02).

## Not verifiable

- None in the changed text: the change adds no locator to this folder. `milnor-morse-theory` and `oneill-submersion` remain uncertified, as before.

## Source issues

- none
