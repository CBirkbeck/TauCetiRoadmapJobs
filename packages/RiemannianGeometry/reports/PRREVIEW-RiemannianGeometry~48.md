# Review of RiemannianGeometry (pull request #2223 at a3dee99)

**Verdict:** needs changes

## R01 (P3) — The description's list of Checks denies the defining functions that the ℝ and ℝⁿ Checks give

**Location.** Pull-request description, paragraph "The section ends with checks": "the absence of a defining function for the torus meridian, a point of `ℝ` and the unit sphere of `ℝⁿ` (noncompact `M`, one closure not compact)".

**Claim.** As written, "absence of a defining function" covers all three examples, and the text says one closure is not compact. At the head, the Checks give defining functions for the point of ℝ and the unit sphere of ℝⁿ, and on ℝ neither closure is compact.

**Witness.** `README.md:4088–4089`: "with defining function x−p, and neither closure is compact". `README.md:4091`: "`(|y|²−1)/2` is a defining function".

**Repair.** Replace the quoted passage with: "the absence of a defining function for the torus meridian, the separation of `ℝ` by a point and of `ℝⁿ` by the unit sphere, with defining functions `x−p` and `(|y|²−1)/2` (noncompact `M`: on `ℝ` neither closure is compact, on `ℝⁿ` the closure of the exterior is not)". This agrees with `README.md:4085–4094`.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result |
|---|---|---|---|
| Previous R01 (`[CompactSpace M]` in (1)) | `Suggested.lean:593–595`; README 3882, 4016–4019 | binders now `[SecondCountableTopology M] [ConnectedSpace M]`; ℝⁿ⊃Sⁿ⁻¹ Check at 4085–4094 | repaired |
| Previous R02 (compact Σ in (2)) | `Suggested.lean:582–584`; README 3856–3861, 3971–3988, 4105–4116 | `hclosed : IsClosed (range f)`, no `[CompactSpace S]`; Φ from `Coordinates.lean:146`; Möbius Check added | repaired |
| Previous R03 (Hirsch locator) | README 3935–3939, 4579–4585 | Theorem 4.6 and Lemma 4.4, matching "[74, Theorem 4.4.6]" (text line 1866) and "[74, Lemma 4.4.4]" (line 1939) | repaired |
| 1.1 item 2 (Andrews 16.2.1, p. 154) | `andrews-dg-ch16` lines 101, 104–105 | slot convention K=R(e₁,e₂,e₁,e₂); proposition on printed p. 154 | locator holds |
| 1.1 item 3 (Nicolaescu Ex. 4.2.36 p. 195, 4.2.38 p. 196) | S³ of radii 1 and 2; lines 8870–8874, 8887–8889 | a=2 and a=½; λ=s/n; Einstein union with unequal factors | holds; source omits connectedness |
| 1.1 item 4, `24r=B_Q−B_Q` | orthonormal x,y, K=1, z=y, w=x | B_Q(x,x;y,y)=16; B_Q(y,x;x,y)=0−4−4+0=−8; 16+8=24=24·1 | holds |
| 1.1 item 4 without Bianchi | r=ω⊗ω on ℝ⁴ at (e₁,e₂,e₃,e₄) | B-terms 8 and −8, so 16, while 24r=24 | negative control correct |
| 1.2 (Nicolaescu §3.3.2, (3.3.7), pp. 103–104) | lines 4593, 4604–4630, 4641; dx²+e^(2x²)dy² | transport IVP on p. 103; K=−(2+4x²), ∂ₓK(1)=−8≠0 | holds |
| 1.3 warped products (Barzen–Leymann L35–36, pp. 61–62) | dx²+e^(2x)dy²; (0,π)×_sin S², k=2, t=π/3 | −f″/f=−1; Ric(V,V)=4/3+2/3=2, Δ⁺ reading 0; their R(V,W)U flips to ours | holds |
| 1.3 bi-invariant (Andrews Cor. 16.8.5, p. 162) | lines 410, 429–431 | his R_ijkl=¼c_ijp c_klp equals ⟨R(E_j,E_i)E_k,E_l⟩ with R=−¼[[X,Y],Z] | holds |
| 1.3 O'Neill A, T and projection Checks | dx²+e^(2x)dy², e^(4x)dy²; Hopf pair; x=log 2 | Γˣ_yy=−e^(2x): T_UU=−∂x; −2∂x; K=1+3·1=4; \|∂y\|=2 | hold |
| 1.3 projective normalisation | X=[[0,−1],[1,0]]; diag(0,i); CP¹ | −½tr X²=1=\|Xe₂\|²; ½ versus 1; area π(½)²·4=π | holds |
| 2.1 Jacobi fields | great circle sin t·E; flat t²E; flat u+tv | −sin t E+sin t E=0; residual 2E≠0; data (u,v) | Checks correct |
| 2.2 frame (Bishop §6.11, Problem 6.12, p. 41) | `bishop-rg` lines 1866, 1885–1904; unit S², t=π/2; octant triangle | connection forms ¼R(x dx−x dx) vanish at p; norms 1 and 2/π; holonomy π/2 | holds |
| 2.2 metric jet (Brewin §5 p. 9, (11.1) p. 15; Nicolaescu 4.1.25–26 p. 151) | lines 363, 614, 6793–6804; unit sphere, e⊥v | g_ee=1−\|v\|²/3; sin²t/t²=1−t²/3; ∂g(q)=0 | holds |
| 2.3 rescaled metrics (Bishop Thm 6.11, p. 41) | line 1872–1875; S², λ=10 | δ−⅓R·x·x; correction O(λ_j⁻²); K(g_j)=1/100 for c=λ²=100 | holds |
| `exists_jacobi_initial_data` | flat ℝⁿ | J=u+(t−a)v: J(a)=u, D_tJ(a)=v | holds |
| `morse_index` | unit S² on [0,π] and [0,3π/2] | sum 0, Wirtinger ≥0; sum 1, f=sin(2t/3) gives (4/9−1)·3π/4<0 | holds |
| `singularHomology_loopSpace_sphere` | n=2; n=3 | 1 divides every i: ℤ in all degrees; ℤ in even, 0 in odd degrees | holds |
| `rauch_norm_ge_of_sectional_le` | S², κ=1, b<π | `curvatureSine 1 t`=sin t=\|X t\| with \|D_tX(0)\|=1 | equality, holds |
| `synge`, `synge_orientable_of_odd` | RP², flat T², RP³ | excluded by orientability, by K>0, by parity; RP³ orientable | hold |
| `guenther` | S², κ=1, r<π | both sides 2(1−cos r)·π | holds |
| `bishopGromov` | flat ℝⁿ, κ=0; circle of length L | ratio n·vol(Bⁿ) constant; min(2r,L)/r nonincreasing | holds |
| `cartanHadamard_isCoveringMap` | flat T² | exp_p:ℝ²→T² is the universal cover | holds |
| `bonnetMyers_distance`, `myers_finite_fundamentalGroup` | unit Sⁿ, λ=n−1; RPⁿ | π√1=π=diameter; π₁=ℤ/2 | hold |
| `two_distinct_geodesics` | S¹, p≠q | the two complementary arcs on [0,1] | holds |
| `killingHopf_*` | n=0; n=1 sphere; n=1 hyperbolic | point; line≠circle, so 2≤n is needed; ((0,∞),dt²/t²)≅ℝ by log | hold |
| `three_simple_closed_geodesics` | round S² | three distinct great circles | holds |
| paraboloid theorems | vertex r=0 | K=4/(1+4r²)²=4; sphere of curvature 4 has conjugate points | hold |
| `subsingleton_deRhamCohomology_one_of_ricciTensor_pos` | flat S¹; S² minus 2 points | Ric=0, b₁=1; Ric=g, noncompact, b₁=1 | hypotheses needed |
| `…_of_curvatureEndomorphism_pos` | S²×S² | Rop≥0 with mixed kernel, b₂=2 | positivity needed |
| `riemannianDist_eq_sSup_smooth` | x=y; ℝ | sSup{0}=0; clamped t−x approaches \|x−y\| | holds |
| R8.2, R8.3 | S¹ with cos dθ; N=2 | λ=d²=d(d+1−1); (x₁±ix₂)ᵈ span invariant lines | hold; bounds needed |
| `separates_of_subsingleton_deRhamCohomology_one` | ℝ⊃{p}; ℝⁿ⊃Sⁿ⁻¹; flat T² meridian | (−∞,p),(p,∞), closures add p; ball and exterior; T² excluded, [dθ]≠0 | holds |
| R7.9 (1), degenerate cases | n=1 on S¹; Σ empty | H¹_dR(S¹)≠0 is excluded; `ConnectedSpace S` forces Σ≠∅ | hypotheses needed |
| `exists_unitNormal_of_simplyConnectedSpace` | line in ℝ²; RP²⊂RP³; open Möbius band in ℝ³ | two-sided; π₁=ℤ/2 excluded; N(θ+2π)=−N(θ), excluded by `IsClosed (range f)` | holds |
| R7.9 crossing form | flat torus, ε=½ | χ(θ)−θ is ½ at both ends, slope −1; period χ(3ε/4)−χ(−3ε/4)=1 | holds |
| R7.9 at most two components | latitudes x₃=±½ on S² | 3 components, Σ disconnected | `[ConnectedSpace S]` needed |
| R7.9 `c_f` and `p_f` | Φ(tu) over a unit section ν; torus meridian | fibre {(u,0),(−u,0)}; sheets Φ(±tν); one loop swaps sheets: ℝ/2ℤ×ℝ/ℤ | holds |
| R7.9 defining functions (R01) | equator: x_(n+1), −x_(n+1), x_(n+1)³; ℝ: x−p; ℝⁿ: (\|y\|²−1)/2 | gradients e_(n+1)−x_(n+1)p=ν, −ν, 0; ∂ₓ=ν; y=ν on the sphere | Checks correct; the description contradicts them |
| R7.9 collar widths | equator of Sⁿ; unit sphere of ℝⁿ | injective iff ε≤π/2; (1+t)x injective iff ε≤1 | Checks correct |
| R7.9 noncompact closures, DG 12.5 | ℝⁿ⊃Sⁿ⁻¹ | D₋ the compact ball, D₊ not compact; DG 12.5 (main line 2939) allows compactly supported fields | holds |

- Source locators checked against the text: 20. These are `andrews-dg-ch16` lines 101, 105 and 429; `nicolaescu-lectures` lines 4604–4630, 6793, 6801, 8870 and 8888; `spacetime-guided-tour` lines 2919, 2953 and 2971–2983; `bishop-rg` lines 1872, 1885–1892 and 1893–1904; `brewin-rnc` lines 363 and 614; arXiv:hep-lat/9205005v1 text lines 1846–1848, 1866–1867 and 1937–1939 (pp. 49, 51); Samelson, Proc. AMS 22, text lines 10–23 and 51–52 (pp. 301–302).
- Library declarations opened at the pins: 33. Tau Ceti: `Coordinates.lean:146`, `DiscSphere.lean:56`, `DeRham/NormedSpace.lean:64`, `DeRham/SimplyConnected.lean:103`, `DeRham/Basic.lean:127`, `Cover.lean:84/164/298/498/533`, `Bicollar.lean:101/171/192`, `Sublevel.lean:473/639/652/675`, `Boundary/Charts.lean:321`, `Boundary/Orientation.lean:46`, `Period.lean:148/197/313/405`, `RegularValue.lean:92`, `Torus.lean:87`, `Sphere.lean:96`, `Circle.lean:173`, `SmoothEmbedding/Basic.lean:158`, `LocallyFlat/Separation.lean:285`. Mathlib: `Homotopy/Lifting.lean:489`, `SmoothEmbedding.lean:70`, `Covering/Basic.lean:287`, `FundamentalGroupoid/SimplyConnected.lean:41`.
- Cross-roadmap citations resolved on main: 10. These are GeometricTopology 1.5 (line 974) and 1.7.1 (line 1101); Poincare3D 8.1 (line 894); DifferentialGeometry 6.1 (line 2413), 6.3 with periods (line 2438) and 12.5 (line 2936); GeneralizedCohomology G4.0b (line 1082); AlgebraicTopology §4.6 (line 1667), which is the `roadmaps resolve` lead "AT4.6" at README 2506; TangentialBordism B1.6.
- Gate rerun at a3dee99: every check is 0. Dependency check: `depcheck: 206 roadmaps, 1912 edges, 0 problem(s)`. Nothing changed outside the folder.
- `lake env lean Suggested.lean`: 25 `sorry` warnings and nothing else. `#check` of both R7.9 theorems shows every section binder. The two binder leads in `signatures.md` are the defs `IsEndpointZeroSmoothSection` and `indexForm`, which drop only binders their bodies do not use.
- Padding and duplication: the R7.9 theorems have no library match and no one-tactic closure. Tau Ceti's `LocallyFlat/Separation.lean:285` and GeometricTopology's Brown bicollaring item at the #1797 head (README line 2078) prove the converse, that a separating hypersurface is bicollared.
- Pull-request text: the "Edits" list matches the 8 README hunks and 2 Lean hunks against main, and every other sentence agrees with the head. #2222, #2224, #2225 and #2226 merge cleanly, and none of them carries R7.9. MinimalSurfaces (#2226, line 246) cites the closed-M special case.
- Overlap leads: G4.0b is defined on main (GeneralizedCohomology line 1082), so it is not "only an open revision". #1807 maps the dropped G4 anchor in its "Former heading and numbering" table (line 488).

Overlap check: read Surfaces (main, #2225), LorentzianGeometry (#2232), MinimalSurfaces (#2226), ManifoldOptimization (#1506), PositiveMass (main, #2247), RicciFlow, DifferentialGeometry, GeometricTopology (main, #1797), Poincare3D and TangentialBordism (main). Separation and two-sidedness of smooth hypersurfaces are owned only by R7.9; MinimalSurfaces consumes R7.9. GeometricTopology 1.7.1 (topological surfaces in ℝ³) and Poincare3D 8.1 (spheres in closed simply connected 3-manifolds) keep distinct statements that R7.9 says it does not consume, and Brown's converse is GeometricTopology's. De Rham periods and the divergence theorem belong to DifferentialGeometry 6.3 and 12.5 and are cited here. The other roadmaps share no object with R7.9.

## Not verifiable

- `milnor-morse-theory` §14, p. 77, and Lemma 14.4, pp. 80–81 (2.1): recorded as uncertified in the manifest; text not read.
- `oneill-submersion` Theorem 2 and Corollary 1 (1.3): recorded as uncertified; text not read.
- Bott–Tu, *Differential Forms in Algebraic Topology*, Ch. I, §5 (R7.9): paywalled book; text not read.
- Lima, Amer. Math. Monthly 95 (1988), 39–42 (R7.9): paywalled; text not read.
- Hirsch, *Differential Topology*, Ch. 4, §4, Theorem 4.6 and Lemma 4.4 (R7.9): paywalled book; the numbers were checked only against Caracciolo et al.'s reference [74].

## Source issues

- **Error** in nicolaescu-lectures at Exercise 4.2.38, p. 196: the source says every Einstein manifold of dimension at least three has constant scalar curvature, with no connectedness; it should say locally constant, or constant on connected manifolds (round S³ of radii 1 and 2); affects a stated result.
- **Misprint** in andrews-dg-ch16 at Proposition 16.2.1, p. 154: the source names the plane generated by e1 and ej before writing it as e_i∧e_j; it should say e_i and e_j; affects nothing.
- **Misprint** in Caracciolo–Edwards–Pelissetto–Sokal (arXiv:hep-lat/9205005v1) at Theorem A.2, p. 49: the source says the complement of every closed codimension-one submanifold of a simply connected manifold is disconnected; it should assume the submanifold nonempty; affects nothing.
