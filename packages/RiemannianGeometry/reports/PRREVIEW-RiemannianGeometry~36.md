# Review of RiemannianGeometry (pull request #2225 at 0ba7c9c)

**Verdict:** needs changes

## R01 (P2) — R4.7 and AlgebraicTopology §4.6 both own the RPⁿ ≃ₜ `Projectivization` comparison

**Location:** `TauCetiRoadmap/RiemannianGeometry/README.md`.
- Line 2411: "Construct its comparison with AlgebraicTopology AT4.6's native `Projectivization` … compact-to-Hausdorff gives the homeomorphism. … This comparison is an owned construction".
- Line 2413: "Compare it with the lifted smooth antipodal-cover atlas and AT's designated projective atlas".

**Claim:** AlgebraicTopology §4.6 on main already owns this homeomorphism and its affine-chart comparison. It is a supplier of this roadmap and names R4.7 as their consumer, so the object has two owners. This README's own line 2406 already says R4.7 consumes §4.6's comparison.

**Witness:** AlgebraicTopology `README.md` on main:
- Line 1695: "Own the homeomorphism from `TauCeti.RealProjectiveSpace n` to `Projectivization ℝ (Fin (n+1) → ℝ)` induced by v↦[v] … and its smooth local comparison with the affine charts".
- Line 1709: "This supplies RiemannianGeometry R4.7's single real projective carrier".

**Repair:**
- In line 2411, replace the text from "Construct its comparison" through "not supplied by the mere generic quotient theorem." with: "Consume AlgebraicTopology §4.6's homeomorphism from `TauCeti.RealProjectiveSpace` n to `Projectivization` ℝ (Fin (n+1) → ℝ), induced by v↦[v] on the unit sphere after the `WithLp` linear homeomorphism, together with §4.6's Hausdorffness of Mathlib's quotient topology."
- In line 2413, replace the text from "In the projective chart" through "no second projective manifold/topology is installed." with: "Through that homeomorphism, §4.6's smooth comparison with the affine charts identifies the lifted smooth antipodal-cover atlas with AT's projective atlas; no second projective manifold or topology is installed."
- R4.7 keeps the descended round metric, its curvature, the orientation parity and the π₁ transport.

## R02 (P2) — R4.7 and GeometricTopology §7.1 both own the hyperbolic case of Killing–Hopf

**Location:**
- README line 2371: "Prove the Killing–Hopf universal-cover classification (`killingHopf_euclidean`, `killingHopf_sphere`, `killingHopf_hyperbolic` … or to the upper half-space model … and the quotient description by free properly discontinuous discrete smooth isometries".
- README line 2321.
- `Suggested.lean` line 388.

**Claim:** GeometricTopology §7.1 on main proves that a complete hyperbolic manifold is ℍⁿ/Γ with universal cover the half-space model, and identifies that model with `TauCeti.ModelGeometry`. GeometricTopology supplies this roadmap, so the curvature −1 classification and its quotient description have two owners.

**Witness:** GeometricTopology `README.md` on main:
- Line 6698: "a complete hyperbolic manifold is a quotient `ℍⁿ / Γ`".
- Line 6705: "A complete hyperbolic manifold has universal cover `ℍⁿ`".
- Line 6693: "Identify it with `TauCeti.ModelGeometry`".
- Line 7999 lists RiemannianGeometry among its consumers.

**Repair:**
- In R4.7 (lines 2371–2382), state the classification and the quotient description for curvature 0 and 1 only, and add: "The curvature −1 case (a complete hyperbolic manifold is ℍⁿ/Γ, with universal cover the upper half-space model) and that model's identification with `TauCeti.ModelGeometry` are GeometricTopology §7.1's, consumed here."
- In line 2321, replace "compare with GT Layer 8's native `ModelGeometry.Space` in dimension 3" with "compare the Euclidean and round models with Tau Ceti's `TauCeti.ModelGeometry.Space` in dimension 3".
- Delete `killingHopf_hyperbolic` from `Suggested.lean` and from README line 2372.
- In the `Suggested.lean` docstring, replace "the three cases of the Killing–Hopf classification" with "the Euclidean and spherical cases of the Killing–Hopf classification", and add "The hyperbolic case is GeometricTopology §7.1's."

## R03 (P3) — The GeometricTopology contract cites layers for objects they do not hold

**Location:** README:
- Line 736: "Layer 7: the existing intrinsic curvature construction and `TauCeti.riemannianVolume`".
- Line 742: "Layer 8 owns the eight three-dimensional model geometries".
- Line 2321: "GT Layer 7’s `HyperbolicMetric`".

**Claim:** On main, GeometricTopology Layer 7 is "hyperbolic structures, volume and rigidity" and Layer 8 is "decompositions of 3-manifolds and geometrization". Its scope (lines 125–126) says the model geometries and hyperbolic metrics are Tau Ceti's at the pin, and none of its layers constructs curvature.

**Witness:** These are Tau Ceti declarations at the pin:
- `TauCeti.ModelGeometry` (`TauCeti/Geometry/Manifold/Riemannian/ModelGeometry/Basic.lean:52`, eight constructors), with `Space` at `:84`.
- `TauCeti.HyperbolicMetric` (`Riemannian/Hyperbolic.lean:51`).
- `TauCeti.riemannianVolume` (`Riemannian/VolumeDensity/Volume.lean:82`).

**Repair:**
- In the GeometricTopology bullet (lines 735–745), delete "Layer 7: the existing intrinsic curvature construction and `TauCeti.riemannianVolume`."
- In the same bullet, replace "Layer 8 owns the eight three-dimensional model geometries; R4.7 compares its constant-curvature models with their native `ModelGeometry.Space` instances." with "Layer 7 §7.1 supplies R4.7's hyperbolic quotient description and the hyperbolic model-geometry identification."
- Add `TauCeti.ModelGeometry.Space` and `TauCeti.HyperbolicMetric`, with their files, to the Tau Ceti contract.
- In line 2321, replace "GT Layer 7’s `HyperbolicMetric`" with "Tau Ceti's `TauCeti.HyperbolicMetric`".

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §1.1 item 4, `24r=B_Q(x,w;y,z)−B_Q(y,w;x,z)` | K=1 orthonormal pair, z=y, w=x; ω-form on ℝ⁴; coefficient of st | 16−(−8)=24·1; ω: 8−(−8)=16≠24, Bianchi sum 1≠0; B_Q=8(r(x,y,z,w)+r(x,z,y,w)), difference 24r | holds | none |
| §1.1 items 2–3: Andrews 16.2.1 p.154; Nicolaescu Ex. 4.2.38 p.196, Ex. 4.2.36 p.195 | source text; dimensions 1 and 0 | sectional curvatures determine R; Einstein in dim ≥3 ⇒ constant Scal, λ=s/n; dim 1: Ric=0, a=0 | holds | none |
| §1.2 local symmetry and Einstein factor; Nicolaescu (3.3.7) pp.103–104 | `dx²+e^(2x²)dy²`; unit and radius-2 S³ | K=−2−4x², ∂ₓK(1)=−8; a=2 and ½; transport is the solution of the initial-value problem | holds | none |
| §1.3 warped curvature; Barzen–Leymann Lemmas 35–36, pp.61–62 | `dx²+e^(2x)dy²`; (0,π)×_sin S² at t=π/3; ℝ³∖0 | −f″/f=−1; vertical K=1/sin²t−cot²t=1; Ric(V,V)=4/3+2/3=2 (Δ⁺ misreading gives 0); vertical Ric 0 | holds; source sign of R reversed | none |
| §1.3 conformal, bi-invariant, O'Neill and projective items; Andrews Cor. 16.8.5 p.162 | trace of Ric̃; Hopf S³→CP¹; T for e^(2x), e^(4x); X=[[0,−1],[1,0]], diag(0,i) | trace gives `2(n−1)Δ⁺u−(n−1)(n−2)\|du\|²`; ⟨R(eᵢ,eⱼ)eₖ,eₗ⟩=−¼c_ijp c_klp; K=1+3=4; T_UU=−∂x, −2∂x; 1=1; ½ vs 1 | holds | none |
| §2.1 Jacobi Checks | flat u+tv; great circle sin t·E; flat t²E | D²=0; −sin t·E+sin t·E=0; residual 2E≠0 | holds | none |
| §2.2 frame and jets; Bishop §6.11, Problem 6.12 p.41; Brewin §5 p.9, (11.1) p.15; Nicolaescu 4.1.25–4.1.26 p.151 | unit S², T⊥Y, t=π/2; octant triangle | \|d exp\|=sin t/t=0.637 vs 1; sin²t=t²−t⁴/3+2t⁶/45; Brewin g_aa=1−t²/3 ⇒ +K\|v\|²; holonomy π/2 | holds | none |
| §2.3 rescaled limits; Bishop Thm 6.11 p.41 | unit S², λ=10 and 100, unit x⊥ | (λ sin(1/λ))²=0.996671 vs 1−1/(3λ²)=0.996667; 0.9999667 both; K(λ²g)=λ⁻²K | holds | none |
| `exists_jacobi_initial_data` | flat geodesic; constant geodesic | X=u+(t−a)v in both; data (u,v); solution space 2n | holds | none |
| `IsEndpointZeroSmoothSection`, `indexForm` | sin(πt)E, tE, tent on [0,1]; unit S² | in; X(1)=E≠0; not smooth at ½; I=(π²−1)/2=4.435 | holds | none |
| `morse_index` | S² great circle on [0,π] and [0,3π/2]; X=sin(2t/3)E | Ioo(0,π) has no conjugate: 0; π of multiplicity 1: index 1; I=π/3−3π/4=−5π/12<0 | holds | none |
| `singularHomology_loopSpace_sphere`; Hatcher 4J.1 p.471, 3C.8 p.288 | n=2, 3; n=1 | ℤ in every degree; ℤ in even degrees, 0 in odd; n=1 excluded, H₀(ΩS¹) of infinite rank | holds | none |
| `rauch_norm_ge_of_sectional_le` | unit S², κ=1; sphere of radius 1.1, t=2.2π | sin t=\|X\|, equality; \|X\|=0<sin(2.2π)=0.588, excluded by b<π | holds; `hmodel` needed | none |
| `synge`, `synge_orientable_of_odd` | RP², T², RP³, dimension 0 | nonorientable, π₁=ℤ/2; K=0; orientable, π₁=ℤ/2; a point | holds | none |
| `modelBallVolume`, `guenther` | (κ,n)=(0,2),(1,2),(−1,2); unit S², r=1; n=1 | r²/2, 1−cos r, cosh r−1; 2π(1−cos 1)=2.888 on both sides; 2r on both | holds | none |
| `bishopGromov` | unit S² with κ=0; H² with κ=−1 | ratio 5.777 (r=1) ≥ 4.449 (r=2); constant 2π | holds | none |
| `cartanHadamard_isCoveringMap` | flat T²; ℝⁿ; dimension 0 | ℝ²→T² covering; identity; a point | holds | none |
| `bonnetMyers_distance`, `myers_finite_fundamentalGroup` | unit S³ (λ=2); RP³; RP² | π√(2/2)=π=diameter; diameter π/2; π₁=ℤ/2 finite | holds | none |
| `two_distinct_geodesics` | unit circle, p=1, q=−1 | e^(iπt) and e^(−iπt) are i and −i at t=½ | holds | none |
| `killingHopf_euclidean`, `killingHopf_sphere` | n=0, 1, 2 | point; line≅ℝ; unit S²; the line is not a circle, excluded by n≥2 | holds | none |
| `killingHopf_hyperbolic` | n=1; simply connected n≥2 against GeometricTopology §7.1 | (0,∞) with dt²/t² ≅ ℝ by log t; §7.1's universal cover ℍⁿ gives the same isometry | true; second owner | R02 |
| `three_simple_closed_geodesics` | round S²; ellipsoid with axes 1<2<3 | three coordinate great circles; three principal ellipses | holds | none |
| `paraboloid_geodesic_crossings` | `ds²=(1+4r²)dr²+r²dθ²`, c=r²θ′=1 | r_min=1; dθ/dr ~ 2/r at ∞, total angle infinite; K(0)=4, K(1)=0.16 | holds | none |
| `paraboloid_vertex_pole` | meridian Jacobi length r(ℓ); sphere with K=4 | dr/dℓ=1/√(1+4r²)>0, so r>0 for ℓ>0; sin(2ℓ)/2=0 at π/2, excluded | holds | none |
| `subsingleton_deRhamCohomology_one_of_ricciTensor_pos` | flat S¹; S² minus two points; round S² | b₁=1 with Ric=0; b₁=1, noncompact; b₁=0 | holds | none |
| `subsingleton_deRhamCohomology_of_curvatureEndomorphism_pos`; Petersen–Wink Corollary p.1 | Sⁿ; S²×S²; n=2 | Rop=Id, Hᵖ=0; b₂=2 with Rop≥0; p=1 is Bochner | holds | none |
| `riemannianDist_eq_sSup_smooth` | ℝ with x=0, y=3; (0,1) | a smoothed clamp gives 3; the 1-Lipschitz bound gives ≤; incomplete case unchanged | holds | none |
| `eq_harmonicSphereRestriction_of_laplaceBeltrami_eq_neg_mul`; Taylor (8.2.13), 8.2.1 p.399 | S¹ with d=3; S² with d=2; S⁰ | cos 3θ=Re(x₁+ix₂)³, λ=9; x₁x₂, λ=6; S⁰ excluded by m≥1 | holds | none |
| `harmonic_irreducible`; Taylor 8.5.1 p.421 | N=3, d=1; N=2, d=1; d=0 | dimension 3, irreducible; lines x₁±ix₂ with characters e^(∓iθ); constants | holds | none |
| R4.7 RPⁿ comparison (line 2411) | RP¹ lines; AlgebraicTopology §4.6 line 1695 | (1,2) and (2,4) give one point; (1,0) and (0,1) are distinct; the same map v↦[v] is owned twice | true; second owner | R01 |
| GeometricTopology contract (lines 736–745) | GeometricTopology Layer 7 and 8 headings on main | Layer 7 is hyperbolic structures, Layer 8 is decompositions; `ModelGeometry`, with its 8 constructors, is pinned in Tau Ceti | stale | R03 |
| This pull request's change, lines 14–20 | Surfaces Layer 6 headings; Surfaces contract line 208 | Layer 6 is the logarithmic cutoff; it consumes no new parent section; the line 4049 consumer list is still right | holds | none |

- **Gate and build.** The gate, re-run on this head, ends `source-material=0 OK`. `lake env lean` on `Suggested.lean` gives 23 `declaration uses 'sorry'` warnings, at lines 109–600, and nothing else. Nothing outside the folder changes except the pull request's own `Surfaces/`.
- **Dependency check.** It printed `depcheck: 206 roadmaps, 1912 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- **Padding and signatures.**
  - All 23 theorems survive the one-tactic probe `first | rfl | simp | infer_instance | trivial | norm_num | positivity | decide | aesop`, run on a scratch copy.
  - I compared `#check @name` against the README for all 27 declarations. Only `IsEndpointZeroSmoothSection` and `indexForm` drop binders, and their bodies do not use them; `morse_index` carries those binders.
- **Source locators checked against the cached text: 24.** Andrews 2, Nicolaescu 5, Barzen–Leymann 3, Bishop 3, Brewin 2, Hatcher 2, Taylor 5, Kwong 1 (Thm 10(2), p.27), Petersen–Wink 1.
- **Library declarations opened at the pins: 28.** No headline is proved at the pin. The closest is `TauCeti.Manifold.norm_le_norm_mfderiv_riemannianExp_of_sectionalCurvature_nonpos` (`Jacobi/Comparison.lean:50`), which is only the case κ≤0, s_κ=t. Tau Ceti's six-term polarization (`SectionalPolarization.lean:62`) is a different combination from §1.1 item 4's.
- **Cross-roadmap citations resolved.**
  - GeneralizedCohomology G4.0b is on main at line 1082. #1807 keeps G4.0b and maps G4 to Layer 4 (its line 488), so the anchor it drops is mapped.
  - AlgebraicTopology "Stage k" and "AT4.6" resolve through main lines 12–45, with §4.6 at line 1666.
  - Also resolved: DifferentialGeometry 5.6 (line 2049), ComplexKahlerGeometry K7.1 (line 2700), RicciFlow line 1660.
- **Overlap check.** I read ManifoldOptimization, MinimalSurfaces, DGFloerPartII, SmoothBundlesConnections, DGFloer, Surfaces, RicciFlow and PositiveMass. Shared objects and their owners:
  - The Dirichlet index count of the normal Jacobi form: owned by R5b. MinimalSurfaces MS6.1 (#2226) restates it in a wider form; that belongs to #2226's review.
  - The second fundamental form and submersions: owned here; ManifoldOptimization defers to this roadmap.
  - Jacobi fields and the index form: owned by R2–R3; DGFloer and DGFloerPartII consume them.
  - Rauch, Günther and Myers: owned by R4; RicciFlow consumes them and owns Klingenberg's estimate.
  - The logarithmic cutoff at a point: owned by Surfaces S6. PositiveMass §3.3 owns the cutoff at infinity.

## Not verifiable

- `milnor-morse-theory`: §14 p.77, Lemma 14.4 pp.80–81 and Theorem 15.1 p.83 (§2.1, `morse_index`). The manifest records it as uncertified (paywalled), so it is cited by locator only.
- `oneill-submersion`: Theorem 2 and Corollary 1 (§1.3). The manifest records it as uncertified (no PDF), so it is cited by locator only.

## Source issues

- none
