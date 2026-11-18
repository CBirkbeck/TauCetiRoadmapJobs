# Review of MinimalSurfaces (pull request #2491 at cd32a39)
Folder: `TauCetiRoadmap/RiemannianGeometry/MinimalSurfaces/`
**Verdict:** accepted

**Summary.** Accepted. The head is the one the previous review read, and that review raised nothing, so there was nothing to repair; this round recomputed the whole roadmap independently. Every Check and worked value that was recomputed holds, the 15 sampled targets and the locators of 7.8 match the texts that could be read, and the five Lean headlines elaborate and none closes in one tactic. There are no findings and no small corrections, and one format note (the Lean statements of 4.2 and 5.1 do not assume the surface Hausdorff). Four facts are left for the human reviewers, as before.

## N01 — The Lean statements of 4.2 and 5.1 do not assume the source surface Hausdorff

`range_eq_plane_of_minimal_of_nonneg` and `exists_sq_mul_hessianCoordNormSq_le_lintegral` (`Suggested.lean` lines 55 and 89) carry `[TopologicalSpace S]` with no `[T2Space S]`, while 7.5 gets it from `[MetricSpace S]`; the README's surfaces are Hausdorff. Both statements stay true (for 5.1, identify points of S with the same image germ: the quotient is a Hausdorff surface with the same pointwise `|A|²` and no larger total curvature), so nothing breaks. Adding `[T2Space S]` to the two signatures would make the Lean and the README say the same thing.

## Verified sound

| Statement | Instance | Roadmap side | Computed side | Result |
|---|---|---|---|---|
| 2.1 minimal-surface equation | Scherk; `u = xy`; `u = x²+y²` | 0; `−2xy`; `4 + 8(x²+y²)` | `−sec²y sec²x + sec²x sec²y = 0`; `−2·y·x·1`; `4(1+4r²) − 8r²` | holds |
| 2.1 ellipticity | matrix `(1+|p|²)δ − p⊗p` | eigenvalues 1 and `1+|p|²` | on p: `(1+|p|²) − |p|² = 1`; on `p^⊥`: `1+|p|²`; Chodosh line 2249 has the normalised form | holds |
| 2.3 `M_g` | `u = ½|x|²`; `e^(2at)`; `t⁻²` metric | `(n+(n−1)|x|²)/(1+|x|²)^(3/2)`; `−nae^(−at₀)`; n | `div(x/√(1+r²))`; `Γ^t_ii = −a`, unit normal `e^(−at)∂_t`; `Γ^t_ii = 1/t` gives n | holds |
| 2.3 linearisation | `φ_t = φ + t` at `(g_Eucl,0)` | `∂_t u_t = 1` | `Δv = 0`, `v|∂ = 1` gives `v ≡ 1`; Chodosh line 3412–3414 | holds |
| 2.4 scaling | catenoid `λ𝒞` | `|A|² = 2/(λ²cosh⁴x₃)`, `sup|A| = √2` at λ = 1 | `r sup|A|` invariant: `λr·√2/λ`; Chodosh line 3082–3137 (28.1–28.3) | holds |
| 2.5 | `u₂ = 1 + x₁/(2R)` on `B_(R/2)` | ratio 5/3, `|Dw| ≤ (2/(3R))w` | `w ∈ [3/4,5/4]`; `(2/(3R))·(3/4) = 1/(2R)` | holds |
| 3.1 monotonicity | plane at distance d; catenoid | `(1−d²/r²)^(n/2)`; limit 2 | `d/ds[sⁿ(d²+s²)^(−n/2)] = n s^(n−1)d²(d²+s²)^(−n/2−1)`; `2π sinhV coshV/(π cosh²V) → 2` | holds |
| 3.2 tangency | catenoid at `(1,0,0)`; half-space Check | `x₁−1 ≈ ½(x₃²−x₂²)`; gradients differ | `√(cosh²x₃ − x₂²)` expanded; `Du₂ = e₁ ≠ 0`; Chodosh line 2309–2311, 2386–2397 | holds |
| 3.6 | catenoid, helicoid, Clifford torus | `Δs = |∇s|²/s − 2s²`; `Δlog|A| = −|A|²`; 4 = 2|A|² | `40sinh²−8cosh² = 32sinh²−8`; `−2/(1+ρ²)²`; `0 = 0 − 4 + 2·2` | holds |
| 4.1 first contact | unit sphere, `S_t = {x₃ = t}`; graph `1−e^(−ρ²)` | `t₀ = 1`; no last contact | nonempty iff `t ≤ 1`; circles `ρ² = −log(1−t)` unbounded as `t → 1` | holds |
| 4.1 barrier | λ = 1/100, ρ = 1 | height 0.0530 | `0.01·arccosh(100) = 0.01·5.2983` | holds |
| 4.2 `range_eq_plane_of_minimal_of_nonneg` | plane `x₃ = c`; paraboloid; non-Hausdorff S | plane; excluded by `hmin` | harmonic coordinates, range `{y 2 = c}`; `Δx₃ ≠ 0`; proof is local on S plus compactness | holds; N01 |
| 5.1 `exists_sq_mul_hessianCoordNormSq_le_lintegral` | catenoids `λ𝒞`; `r ≤ 0`; `σ > r` | `ε < 8π`; vacuous | `∫|A|² = 4π∫sech² = 8π`, `2σ²/λ²` unbounded; empty ball forces S empty | holds |
| 5.2 | catenoid blow-down in `ℝ³∖{0}` | `|A| = √2λ/ρ²` → 0 on compacts | `cosh⁴(x₃/λ) = ρ⁴/λ⁴`; near axis `|x₃| ≤ λlog(2ρ/λ)` forces `ρ ≥ δ/2`; Chodosh line 3145–3198 | holds |
| 5.3 | planes `x₃ = 0`, `x₃ = x₁/i` | limit multiplicity 2, not embedded for finite i | cross along `x₁ = 0`; White line 1107–1129 (Theorem 22, immersed) | holds |
| 5.4 point picking | `f = |y|` on `[−1,1]`, `x = ½` | `M_* = ¼`, `ρ_* = ¼`, sup ¾ ≤ 1 | `(1−|y|)|y|` max at ½; `R₀−d(q) ≥ ρ_*` on `B_(ρ_*)(q_*)` gives factor 2; Chodosh line 729–740, 3204–3212 | holds |
| 5.5 | two hyperplanes at distance 2δ | ratio `2(1−δ²/R²)^(n/2)` | each disc radius `√(R²−δ²)`; `(1+ε₀)/(1−σ)ⁿ` from `B_((1−σ)R)(y) ⊂ B_R(x)` | holds |
| 6.1 index | `S²_eq ⊂ S³`; hemisphere | index 1, nullity 3; index 0, nullity 1 | `j(j+1)−2`: −2, 0×3, 4; `−Δx₃ = 2x₃ > 0` inside; Chodosh line 2663–2668 | holds |
| 6.2 catenoid | `h = 1 − v tanh v` | `Jh = 0` | `h″ = −2sech²v·h`; `cosh⁻²h″ + 2cosh⁻⁴h = 0` | holds |
| 6.4 | `S²_eq`; Clifford torus; flat `T²×{t}` | `−8π`; `−8π²`; stable | `(0+2)·4π`; `(2+2)·2π²`; `Q = ∫|∇φ|²`; Chodosh line 2685–2689 | holds |
| 6.5 Clifford torus | modes `(k,ℓ)` | index 5, nullity 4 | `2(k²+ℓ²)−4 < 0` at (0,0), (±1,0), (0,±1): 1+4; zero at (±1,±1): 4 | holds |
| 7.4 inequality | `c = ⅓` | `ΔQ ≥ |∇Q|²/Q + (6/5)Q²` | cross term `≥ −sQ/c`; `2q² + ⅓s² − (6/5)(q+s/3)² = (1/5)(2q−s)²` | holds |
| 7.4 maximum principle | `φ = ζ²`, `ζ = R² − r̃²` | `−4ζ(1+r̃Δr̃) − 8r̃² + (6/5)φQ ≤ 0` | `Δφ − |∇φ|²/φ = 2ζ(−2r̃Δr̃−2) + 8r̃² − 16r̃²` | holds |
| 7.5 `exists_sq_mul_hessianCoordNormSq_le_of_stable` | plane; half-catenoid | 0 ≤ C; `dist²|A|² ≤ ½` | `2x/(1+x)² ≤ ½ ⇔ (1−x)² ≥ 0`, `x = sinh²v`; White line 1422–1426 | holds |
| 7.6 `exists_affine_of_minimalSurfaceEquation` | `u = x²−y²`; affine | `8(y²−x²)`; 0 | `(1+4r²)·0 − (8x² − 8y²)`; second derivatives vanish | holds |
| 7.8 cones | `C_(p,q)`, n = p+q+1 | `(n²−8n+8)/4`; n = 6: −1; n = 7: ¼ | `|A_Γ|² = p·(q/p) + q·(p/q) = n−1`; `−(n−1) + (n−2)²/4` | holds |
| 7.8 Reduction | `c₀ ≥ 0`, Simons cone | `κ = ½min(λ,(1+c₀/λ)⁻¹)` | `λ = ¼`, `c₀ = 6`: `½min(¼, 1/25) = 1/50`; Simon23 line 875–895 | holds |
| 7.8 half-plane | weight `|x₂|` | `κ = 1/5` | Hardy `∫φ²/x² ≤ 4∫φ′²`: `κ(1+4) = 1` | holds |
| 8.3 cutoff | annulus `B_(2ε)∖B_ε` | `O(ε)` | area `3πε²`, `|Dη| ≤ 2/ε`, flux norm ≤ 1: `6πε sup|ζ|`; Chodosh line 3393–3435 | holds |
| 8 Example | `z ↦ (z²,z³)` | metric `(4|z|²+9|z|⁴)|dz|²`, area `2πρ²(1+o(1))` | `|2z|²+|3z²|²`; `∫_(|z|≤√ρ) 4|z|² = 2πρ²` | holds |
| 9 opening | `S²_eq`, Clifford torus in `S³` | equality in the bound | `C_g = 6−4 = 2`: `0 = 8π − 8π`; `4π² = 4π² − 0`; Chodosh line 3275–3279 | holds |
| 9.2 area count | `B_(ηr)(b) ⊂ B_r(b)` | ratio `≤ (1+o(1))(1−η²)/(1−e^(ar)η²)` | monotonicity: `Area(B_(ηr)) ≤ e^(ar(1−η))η²Area(B_r)`; Chodosh line 3344–3351 | holds |
| 10.1 Reilly | unit ball, `f = x₁² − x₂²` | both sides `−8ω_(n+1)` | `∫z² = 4|Sⁿ|/((n+1)(n+3))`: `(−16 + 8)|Sⁿ|/(n+1)` | holds |
| 10.3 `herschMap` | `|N|²` for general x, `t = ⟨a,x⟩`, `s = √(1−|a|²)` | `T_a` maps `S²` to `S²` | `(1+s)|N|² = (1+s)(1+t)²`, so `|T_a x| = 1`; `herschMap 0 = id` proved by `simp` | holds |
| 10.3 `exists_integral_herschMap_eq_zero` | `μ = δ_p` | excluded by `hnull` | `T_a(Φ(p))` unit for all a; `μ(Φ⁻¹{Φ(p)}) = 1 ≠ 0` | holds |
| 10.4 | hexagonal torus | `8π²/√3 ≈ 45.59 ≤ 16π` | dual shortest vector `2/√3`: `λ₁ = 16π²/3`, area `√3/2` | holds |
| 10.5 | `S²_eq`; Clifford torus; flat `T³` | `4π ≤ 8π`; `2π² ≤ 16π`; area `√(p²+q²)` | `(16π/k)(γ+1)` with k = 2; Chodosh line 3787–3791 | holds |
| 11.1 | spheres of radii 1 and 2 | second variation ½ | `−½ + 1`; `√(5−4cos(s/2)) = 1 + s²/4 + …` | holds |
| 11.3, 12.1 | `ℝP³`, d = 2 | `γ̃ = 2γ − 1`; no minimal sphere | `γ̃ − 1 = 2(γ−1)`; γ = 0 gives −1; a sphere has no connected double cover | holds |

- Previous review: it raised no finding, small correction or format note at this same head, so there is nothing to mark as repaired.
- Source locators read against the text: 31, in Chodosh (author's page, version of 15 September 2025), White (arXiv:1308.3325v4), Simon23 (arXiv:2101.06401v2) and Simon21 (arXiv:2101.06404v2). They cover the Chodosh and White locators of all 15 sampled targets and every locator of 7.8.
- Pinned declarations opened: `TauCeti.Manifold.hessian` and `laplaceBeltrami` (`TauCeti/Geometry/Manifold/Riemannian/Laplacian.lean:135, 238`), `TauCeti.riemannianVolume` (`VolumeDensity/Volume.lean:82`), `mgradient` (`Gradient/Basic.lean:73`), `integral_mul_laplaceBeltrami` (`DivergenceTheorem.lean:312`), `laplaceBeltrami_nonpos_of_isLocalMax` (`MaximumPrinciple.lean:75`), `laplaceBeltrami_norm_sq_mgradient` (`Bochner.lean:171`), `noRetraction_diskBoundary` (`AlgebraicTopology/Singular/BrouwerFixedPoint.lean:71`), `eulerChar` and `eulerChar_eq_mul_of_isCoveringMap` (`AlgebraicTopology/Cellular/EulerCharacteristic/FiniteCWType.lean:123`, `Covering.lean:140`), `FiniteHolomorphicMap.ofMeromorphic` (`Analysis/Complex/RiemannSurface/SphereMap.lean:243`); Mathlib `BoundedContinuousFunction.arzela_ascoli`, `fourierBasis`, `IsCompact.exists_isMaxOn`, `tendsto_integral_of_dominated_convergence`, `HasStrictFDerivAt.implicitFunctionOfProdDomain`.
- Cross-roadmap citations resolved on main: GeometricCurrents G6 (strong one-sided maximum principle, Simons' identity and inequality, monotonicity), PDE §3.2/C13, §3.3/C14, §5.3/E22, §5.4/E23, §5.6/E25, PositiveMass §3.1 (Gauss–Bonnet with the closed case), parent R1.5, R3, R5a.2, R5b, R5c, R7.0, R7.9, R8.2, Surfaces S1–S6, AlgebraicTopology §7.1, §7.3, §8.7, PseudoholomorphicCurveAnalysis §2.4, §7.2, SmoothBundlesConnections B5.0, UnboundedOperators UO-D07, HopfRinow (Completed). Every supplier is on main. CanonicalModelsAndGonality §8.4, at its open head, cites 10.3–10.4 as the scope section says.
- Automatic checks: all pass on this head. The dependency check prints `depcheck: 210 roadmaps, 2262 edges, 0 problem(s)`, with no UPWARD or CYCLE line. Nothing outside the folder changes against the base.
- Elaboration: `Suggested.lean` gives five `sorry` warnings and nothing else. `#check @` of the seven declarations matches the README statements; no binder is lost.
- Padding probe: on a probe copy of the file each of the five theorems was tried with `rfl`, `simp`, `infer_instance` and `aesop`; none closes. The two definitions are needed to state 5.1, 7.5 and 10.3.
- Description against the head: every sentence holds (README only, 104 insertions and 5 deletions; one heading added, 7.8; `Suggested.lean` unchanged; no supplier added).

Overlap check: read GeometricCurrents, LorentzianGeometry, PDE, HeegaardFloer, ManifoldOptimization (open) and RiemannianGeometry, Surfaces, PositiveMass (main), with Varifolds (main) found by object. Shared objects and owners: Simons' identity and inequality, the interior tangency principle and varifold monotonicity are GeometricCurrents G6's, consumed here; the linear elliptic theory is PDE's; Gauss–Bonnet for closed surfaces is PositiveMass §3.1's; immersion geometry, second variation and the Schrödinger spectral theory are the parent's R5a–R5c; the minimizing Simons cone is GeometricCurrents G7's and appears here only as a Check; strict stability is owned here alone (Varifolds 9.4 leaves it out). No open pull request changes this roadmap or drops an id it cites.

Source independence: 14 passages compared with 4 sources (Chodosh, White, Simon23, Simon21), none shared beyond formulas and standard terms; largest share Chodosh, 59 of about 167 locators; contents compared with Chodosh: independent. Layer 5 (its §§28–30) precedes Layer 6 (§§23–24), Layer 8 (§32) precedes Layer 9 (§31, forced by the needs of 9.1), Layers 2 and 7 each draw on three non-adjacent sections, and Layer 11 and 7.8's definitions have no counterpart. [CM], the second-largest share, could not be read.

Research link: Layers 8–12 reach the Choi–Schoen compactness theorem (1985); 7.4–7.5 give Schoen's curvature estimate (1983) by Lynch's route (2026 preprint); 7.8 is the strict stability of Simon (2021, 2023), used there for hypersurfaces with prescribed singular set. Rests on the README and on Simon21 and Simon23, which were read.

## Not verifiable

- [CM] (AMS GSM 121): no legal copy found (publisher page only); its locators in 2.1, 2.4, 3.2, 5.1, 5.2 and 6.1 were not read. The statements were checked against Chodosh and White instead.
- [ChoiSchoen] and [SY]: Springer, paywalled; the locators of 5.1, 8.3, 10.5 and 6.4 into them were not read.
- [Simons] (JSTOR) and [Schoen] (Annals of Mathematics Studies 103): no open copy found; the locators of 6.1 and 7.5 into them were not read.

## Source issues

- **Misprint** in Simon23 at the note after 1.2, p. 4: the source says the left side of 1.2 is the second variation of area; it should be the right side; affects nothing.
- **Misprint** in Chodosh at the proof of Lemma 28.1, p. 70: the source gives the eigenvalue `1 + |∇w|²` of the induced metric multiplicity n; it should be multiplicity 1; affects nothing.
- **Misprint** in Chodosh at the proof of Corollary 19.6, p. 54: the source writes the contact set as the intersection of the first hypersurface with itself; it should be the intersection of the two hypersurfaces; affects nothing.
- **Misprint** in Chodosh at the opening of §32, p. 77: the source defines the blow-up sequence as dilates of its own terms; it should be dilates of the fixed hypersurface; affects nothing.

## For the human reviewers

- Licence: [Chodosh] is read from the author's Stanford page (web.stanford.edu/~ochodosh), a host the sources service does not classify; it was treated as an author page.
- Scope: the route of 7.4 follows [Lynch], an unrefereed preprint (arXiv:2611.12758v1, 2026; README lines 376 and 1527). The theorem it serves, 7.5, is Schoen's published estimate.
- Scope: no item of this roadmap consumes 7.8 (README lines 1745–1746 and 1763–1764); the uses its sources name are Simon's (Simon21, Simon23).
- Not tested: [CM] has the second-largest share of the locators (about 31 of 167) and no legal copy, so wording and arrangement were not compared with it.
