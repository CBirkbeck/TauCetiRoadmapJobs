# Review of RiemannianGeometry (pull request #2223 at 48bb54a)

**Verdict:** needs changes

## R01 (P2) — Separation (1) assumes M compact, which excludes ℝⁿ, the case the README says it extends

**Location.** `TauCetiRoadmap/RiemannianGeometry/Suggested.lean:591` `[CompactSpace M] [ConnectedSpace M]`; `README.md:3867` "Let M be connected and compact"; `README.md:3909` "(1) replaces the exactness of closed 1-forms on ℝⁿ by `H¹_dR(M)=0`".

**Claim.** Compactness of M is used only to make the closures D_± compact. The two components and their closures need only a connected, second-countable M with `H¹_dR(M)=0`. As stated, (1) covers neither Lima's ℝⁿ nor Caracciolo et al.'s non-compact simply connected X.

**Witness.** M=ℝⁿ (n≥2) and Σ=S^(n−1): `H¹_dR=0`, A is the open ball, B the exterior, and the closures add Σ. The conclusion holds, but `[CompactSpace M]` fails. For n=1, ℝ minus a point gives two half-lines.

**Repair.** Make these changes:
- `Suggested.lean:591`: replace `[CompactSpace M] [ConnectedSpace M]` by `[SecondCountableTopology M] [ConnectedSpace M]`. This was tested together with R02's change: 25 `sorry` warnings, no error.
- `README.md:3867`: replace "connected and compact" with "connected".
- `README.md:3982`: replace "In a connected closed M" with "In a connected M", and "compact smooth manifolds" with "smooth manifolds, compact when M is".
- `README.md:3995`: replace "simply connected closed M" with "simply connected M".
- `README.md:4050–4051`: replace "The circle being … only for n≥2" with "On ℝ a point leaves two half-lines; on ℝⁿ, n≥2, the unit sphere bounds the ball and the exterior, whose closure is not compact."

## R02 (P2) — Two-sidedness (2) is stated only for compact Σ, below Samelson's closed-subset theorem

**Location.** `Suggested.lean:581` `[SimplyConnectedSpace M] [CompactSpace S]`; `README.md:3844` "Σ is a compact boundaryless manifold"; `README.md:3970–3972` "The statement is H. Samelson, … for hypersurfaces that are closed subsets of ℝⁿ and … of any simply connected manifold".

**Claim.** (2) narrows Samelson's theorem to compact Σ. Its Lean form also omits the second countability of M that its tube input needs: `exists_isClosedEmbedding_normalExp_disc` requires `[SecondCountableTopology N]` (`TubularNeighborhood/Riemannian/DiscSphere.lean:46`).

**Witness.** Samelson, Proc. AMS 22: on p. 301 (text lines 10–14) a hypersurface is a closed, possibly non-compact subset; p. 302 (lines 51–52) extends to simply connected manifolds. A line in ℝ² is outside (2).

**Repair.** Make these changes:
- `Suggested.lean:581`: replace `[CompactSpace S]` by `[SecondCountableTopology M]`, and add `(hclosed : IsClosed (range f))` after `hf`. This was tested: 25 `sorry` warnings, no error.
- README "Two-sidedness": let Σ be boundaryless, not necessarily compact, with f(Σ) closed.
- README: set `c_f(u,t)=Φ(tu)`, with Φ from `TauCeti.SmoothEmbedding.exists_diffeomorph_normalBundle_riemannian_subset` (`TubularNeighborhood/Riemannian/Coordinates.lean:146`, no compactness).
- Add a Check: the open Möbius band in ℝ³ is one-sided and its image is not closed.

## R03 (P3) — Hirsch is cited by section only, though the entry it follows gives theorem numbers

**Location.** `README.md:3916–3917` "attributed, for a compact connected hypersurface, to M. W. Hirsch, *Differential Topology*, Ch. 4, §4"; reference entry `README.md:4523–4526`.

**Claim.** The locator is not exact. Caracciolo et al. cite Hirsch's Theorem 4.4.6 for this proof and Lemma 4.4.4 for "at most two components".

**Witness.** In arXiv:hep-lat/9205005v1, Remark 1 after Theorem A.2 (p. 49, text line 1866) cites "[74, Theorem 4.4.6]". Remark 3 (p. 51, line 1939) cites "[74, Lemma 4.4.4]". Reference [74] is Hirsch (line 2604).

**Repair.** In both places write "Ch. 4, §4, Theorem 4.6 (Caracciolo et al.'s [74, Theorem 4.4.6]), and Lemma 4.4 for at most two components".

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result |
|---|---|---|---|
| Previous R01 (five absent Tau Ceti names) | grep of README at head | 0 hits for each name; targets now at 3880–3884, 3923–3926, 3934–3939 | repaired |
| Previous R02 (headlines absent) | `Suggested.lean:567–602` | both theorems present, named at README 3986, 3993 and docstring 47–49 | repaired |
| Previous R03 (no locators) | Lima, Caracciolo A.2/Remark 3, Samelson p. 302 added | Caracciolo and Samelson match their texts; Hirsch only by section | partly (R03) |
| Previous R04 (Checks) | lines 4016–4031, 4042–4046 | width, sign, cube, signed-distance and torus Checks present and recomputed below | repaired |
| Previous R05 (contracts) | lines 178–186, 681–751 | every listed declaration found at the pin with the stated hypotheses | repaired |
| Previous R06 (Layer 7 text) | lines 941, 3615–3617 | both sentences present | repaired |
| 1.1 item 4, `24r=B_Q−B_Q` | orthonormal x,y, K=1, z=y, w=x | B_Q(x,x;y,y)=16, B_Q(y,x;x,y)=0−4−4+0=−8; 16+8=24=24·1 | holds |
| 1.1 item 4 without Bianchi | r=ω⊗ω on ℝ⁴ at (e₁,e₂,e₃,e₄) | 8−(−8)=16, while 24r=24 | negative control correct |
| 1.1 items 2–3 (Andrews 16.2.1, Nicolaescu 4.2.36/4.2.38) | slot convention; S³ radii 1 and 2 | K=R(e₁,e₂,e₁,e₂) (line 101); a=2 and a=1/2 | Checks correct |
| 1.2 local symmetry | dx²+e^(2x²)dy² at x=1 | K=−(2+4x²), ∂ₓK=−8≠0 | Check correct |
| 1.3 warped curvature | dx²+e^(2x)dy²; (0,π)×_sin S², t=π/3 | ⟨R(V,X)X,V⟩=−1; Ric(V,V)=4/3+2/3=2, Δ⁺ reading gives 0 | matches Barzen–Leymann after sign flip |
| 1.3 bi-invariant (Andrews 16.8.5) | his R_ijkl=¼c_ijp c_klp | equals ⟨R(E_j,E_i)E_k,E_l⟩ with R=−¼[[X,Y],Z], by ad-invariance | sign translation correct |
| 1.3 O'Neill, Hopf | dx²+e^(2x)dy², e^(4x); complex line Y=JX | T_UU=−∂x, −2∂x; K=1+3·1=4; CP¹ area π | Checks correct |
| 1.3 projective normalisation | X=[[0,−1],[1,0]]; diag(0,i) | −½tr X²=1=\|Xe₂\|²; ½ versus 1 | Check correct |
| 2.1 Jacobi | great circle sin t·E; flat t²E | −sin t E+sin t E=0; residual 2E≠0 | Checks correct |
| 2.2 jets (Bishop 6.11, Problem 6.12) | unit S², t=π/2; right-angled triangle | transported norm 1, coordinate 2/π; holonomy=area=3π/2−π=π/2 | Checks correct |
| 2.2 metric expansion (Brewin §5, (11.1)) | unit sphere, e⊥v | ⟨R(e,v)v,e⟩=\|v\|², g_ee=1−\|v\|²/3; sin²t/t²=1−t²/3 | signs agree |
| 2.3 rescaled limits | v=E_j(x)/λ_j; S², λ=10 | correction O(λ_j⁻²); K(g_j)=1/100 | consistent |
| `exists_jacobi_initial_data` | flat ℝⁿ | J=u+(t−a)v: J(a)=u, D_tJ(a)=v | holds |
| `morse_index` | unit S² on [0,π] and [0,3π/2] | sum 0 and Wirtinger ≥0; sum 1, f=sin(2t/3) gives (4/9−1)·3π/4<0 | holds |
| `singularHomology_loopSpace_sphere` | n=2, n=3 | ℤ in every degree; ℤ in even degrees, 0 in odd | holds |
| `rauch_norm_ge_of_sectional_le` | S², κ=1; κ=−1 with tangential tγ′ | equality sin t; t<sinh t, so `hnormal` is needed | holds |
| `synge`, `synge_orientable_of_odd` | RP², flat T², RP³ | excluded by orientability, by K>0, by parity; RP³ orientable | hold |
| `guenther` | S², κ=1, r<π | both sides 2π(1−cos r) | holds |
| `bishopGromov` | flat ℝⁿ; circle of length L | ratio n·vol(Bⁿ); min(2r,L)/r nonincreasing | holds |
| `cartanHadamard_isCoveringMap` | flat T² | exp_p: ℝ²→T² is the universal cover | holds |
| `bonnetMyers_distance`, `myers_finite_fundamentalGroup` | unit Sⁿ, λ=n−1; RPⁿ | bound π equals the diameter; π₁=ℤ/2 | hold |
| `two_distinct_geodesics` | S¹ of length 2π, p≠q | the two complementary arcs | holds |
| `killingHopf_*` | n=1 sphere; n=1 hyperbolic | the line is not a circle, so `2≤n` is needed; ((0,∞), dt²/t²)≅ℝ by log | hold |
| `three_simple_closed_geodesics` | round S² | infinitely many great circles | holds |
| paraboloid theorems | vertex r=0 | K=4/(1+4r²)²=4 | hold |
| `subsingleton_deRhamCohomology_one_of_ricciTensor_pos` | flat S¹; S² minus 2 points | Ric=0 with b₁=1; Ric=g with b₁=1 | hypotheses needed |
| `…_of_curvatureEndomorphism_pos` | S²×S² | Rop≥0 with mixed kernel, b₂=2 | positivity needed |
| `riemannianDist_eq_sSup_smooth` | x=y; ℝ | sSup{0}=0; clamped t−x gives \|x−y\| | holds |
| R8.2, R8.3 | S¹ with cos dθ; N=2 | λ=d²=d(d+0); (x₁±ix₂)ᵈ span invariant lines | hold; bounds needed |
| R7.9 at most two components | latitudes x₃=±½ on S² | 3 components, Σ disconnected | `[ConnectedSpace S]` needed |
| R7.9 crossing form | flat torus, ε=½ | χ(θ)−θ is ½ at both ends, slope −1; period χ(3ε/4)−χ(−3ε/4)=1 | holds |
| R7.9 `[ω_(−ν)]=−[ω_ν]` | 1−χ̃(−t) is a cutoff | d(χ̃(−t))=−d(1−χ̃(−t)) | holds |
| R7.9 defining function and outward normals | equator, φ=x_(n+1); −x_(n+1); x_(n+1)³ | grad=e_(n+1)−x_(n+1)p=ν; −ν; 0 on the equator | Checks correct |
| R7.9 collar width | c_ν=(cos t·x, sin t) | injective for ε≤π/2; at t=π/2 all x map to the pole | Check correct |
| R7.9 p_f and the RP cases | torus meridian; RP²⊂RP³; RP¹⊂RP² | ℝ/2ℤ×ℝ/ℤ connected; S(ν_f)≅S² and p_f=S³→RP³; Möbius tube, S²→RP² | hold |
| `separates_…` (R01) | ℝⁿ⊃S^(n−1); ℝ⊃{0} | ball and exterior; two half-lines; `[CompactSpace M]` fails in both | true but narrowed |
| `exists_unitNormal_…` (R02) | line in ℝ²; open Möbius band in ℝ³ | two-sided but non-compact; one-sided with non-closed image | `IsClosed (range f)` is the right hypothesis |

- Source locators checked against the text: 17. These are `andrews-dg-ch16` lines 101, 105 and 429; `nicolaescu-lectures` lines 4604–4630, 6793, 6801, 8870 and 8888; `bishop-rg` lines 1872–1904; `brewin-rnc` lines 363 and 614; `spacetime-guided-tour` lines 2919–2983; arXiv:hep-lat/9205005v1 lines 1846–1848, 1866–1867 and 1937–1939 (pp. 49, 51); Samelson, Proc. AMS 22, lines 10–19 and 51–52 (pp. 301–302).
- Library declarations opened at the pins: 36. Tau Ceti: `Bicollar.lean:101/171/192`, `Period.lean:90/148/197/313/405`, `SimplyConnected.lean:103`, `Sublevel.lean:473/639/652/675`, `Charts.lean:321`, `Boundary/Orientation.lean:46`, `Cover.lean:84/164/298/498/533`, `SmoothEmbedding/Basic.lean:158`, `DiscSphere.lean:56`, `Riemannian/Coordinates.lean:146`, `NormalSpace/Basic.lean:59`, `Riemannian/Basic.lean:113`, `RegularValue.lean:92`, `Path.lean:74`, `Sphere.lean:96`, `Torus.lean:87`, `Circle.lean:173`, `JordanBrouwer.lean:218`. Mathlib: `SmoothEmbedding.lean:70`, `Covering/Basic.lean:287`, `FundamentalGroupoid/SimplyConnected.lean:41`, `Homotopy/Lifting.lean:489`, `VectorBundle/Riemannian.lean:431–451`.
- Cross-roadmap citations resolved: 10. On main: GeometricTopology 1.5 (line 974) and 1.7.1 item 3 (line 1140), Poincare3D 8.1 (line 894), DifferentialGeometry 6.1, 6.3 and 12.5 (lines 2413, 2438, 2936), AlgebraicTopology 4.6 (line 1666), GeneralizedCohomology G4.0b. At open heads: #1807 maps the dropped G4 anchor in its "Former heading and numbering" table (line 488). The `roadmaps resolve` lead "AT4.6" is §4.6.
- Gate at 48bb54a: every check passed. Dependency check: `depcheck: 206 roadmaps, 1912 edges, 0 problem(s)`. Nothing changed outside the folder.
- `lake env lean Suggested.lean`: 25 `sorry` warnings and nothing else. `#check` of both R7.9 theorems shows every section binder present. `#synth` confirms that `‖·‖` and `inner` on `TangentSpace I x` come from the `RiemannianBundle` instance. The copy with R01 and R02 applied gives 25 `sorry` warnings and no error.
- Padding and duplication: no library match for either R7.9 theorem. Tau Ceti `LocallyFlat/Separation.lean` proves the converse (separating implies two-sided), and `JordanBrouwer.lean:218` covers only spheres in spheres, so neither restates R7.9.
- Pull-request text: the "Edits", "How it is built" and "Boundaries" paragraphs match the eight diff hunks against main. No sentence is contradicted by the head. #2222, #2224, #2225 and #2226 merge cleanly with this head.

Overlap check: read Surfaces (main, #2225), LorentzianGeometry (#2232), MinimalSurfaces (#2226), ManifoldOptimization (#1506), DGFloerPartII (#1799), RicciFlow, DifferentialGeometry, GeometricTopology, Poincare3D and TangentialBordism (main); separation and two-sidedness are owned only by R7.9 (MinimalSurfaces consumes it; GeometricTopology 1.7.1 item 3 and Poincare3D 8.1 keep distinct special cases; TangentialBordism B1.6's separating hypersurfaces are regular level sets), de Rham periods and the divergence theorem are DifferentialGeometry 6.1–6.3 and 12.5's (cited here), and LorentzianGeometry, DGFloerPartII and ManifoldOptimization consume R1–R3 and R5a.

## Not verifiable

- `milnor-morse-theory` §14, p. 77, and Lemma 14.4, pp. 80–81 (2.1): recorded as uncertified in the manifest; text not read.
- `oneill-submersion` Theorem 2 and Corollary 1 (1.3): recorded as uncertified; text not read.
- Bott–Tu, *Differential Forms in Algebraic Topology*, Ch. I, §5 (R7.9): paywalled book with no manifest entry; text not read.
- Lima, Amer. Math. Monthly 95 (1988), 39–42 (R7.9): paywalled. Only the zbMATH Open record of Zbl 0647.57022 was read, and it agrees with the README's description of the route.
- Hirsch, *Differential Topology*, Ch. 4, §4 (R7.9): paywalled book; the numbering in R03 is taken from Caracciolo et al.'s reference [74].

## Source issues

- **Error** in nicolaescu-lectures at Exercise 4.2.38, p. 196: the source says every Einstein manifold of dimension at least three has constant scalar curvature, with no connectedness; it should say locally constant, or constant on connected manifolds (a disjoint union of round S³ of radii 1 and 2 is Einstein); affects a stated result.
- **Misprint** in andrews-dg-ch16 at Proposition 16.2.1, p. 154: the source names the plane generated by e1 and ej before writing it as e_i∧e_j; it should say e_i and e_j; affects nothing.
- **Misprint** in Caracciolo–Edwards–Pelissetto–Sokal (arXiv:hep-lat/9205005v1) at Theorem A.2, p. 49: the source says the complement of every closed codimension-one submanifold of a simply connected manifold is disconnected; it should assume the submanifold nonempty (the empty one leaves X connected); affects nothing.
