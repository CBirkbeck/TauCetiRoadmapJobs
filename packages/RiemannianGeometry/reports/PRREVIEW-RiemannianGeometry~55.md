# Review of RiemannianGeometry (pull request #2226 at 7fce733)

**Verdict:** needs changes

## R01 (P3) — R4.1 barrier: the README assumes n≥2, the Lean statement has no dimension hypothesis

**Location:** `TauCetiRoadmap/RiemannianGeometry/README.md` lines 2382–2383, "Let γ:[0,ℓ]→M be a unit-speed geodesic from p=γ(0) to p̄=γ(ℓ) in a Riemannian n-manifold, n≥2", and lines 2423–2426 (the sentence on the headline).

**Claim:** The README states the barrier for n≥2 only. `exists_upper_barrier_laplaceBeltrami_le` (`Suggested.lean` line 320) carries no dimension hypothesis, and the README does not say so, as it does for `bishopGromov` at line 2343.

**Witness:** n=1, M=ℝ, γ(t)=t, ℓ=2, any κ≤0: f(x)=x is smooth, f(2)=2, |x|≤x near 2, Δf=0≤(1−1)·s_κ′/s_κ=0. The Lean statement holds; n=0 has no unit-speed geodesic.

**Repair:** Append to the sentence ending at line 2426: "The Lean statement carries no dimension hypothesis: for n=1 the bound is 0 and the arclength coordinate along γ, continued past p̄, is such a function, with Laplacian 0; for n=0 no unit-speed geodesic exists."

## R02 (P3) — R5c closed principal eigenfunction: the README assumes m≥1, the Lean statement admits m=0

**Location:** `TauCetiRoadmap/RiemannianGeometry/README.md` line 3724, "Let (M,g) be a Riemannian manifold of dimension m≥1", and lines 3871–3874, "On a closed connected M the headline `exists_pos_eigenfunction_neg_laplaceBeltrami_add` states this among smooth functions".

**Claim:** R5c's standing dimension is m≥1. The closed headline (`Suggested.lean` line 547) has no `[Nontrivial E]`, unlike `exists_pos_laplaceBeltrami_eigenvalue_isLeast` at line 534, so it also asserts the case m=0, which the README does not state.

**Witness:** M a point, q=3: φ=1, μ=3 satisfy −Δφ+qφ=3=μφ with Δ=0, every u is u(pt)·φ, and μ∫u²=3∫u²=∫(|∇u|²+qu²). The Lean statement holds at m=0.

**Repair:** Append to the sentence ending at line 3874: "The Lean statement carries no dimension hypothesis: for m=0 a closed connected M is a point, Δ⁺=0, μ₁=q and φ₁=1." Alternatively add `[Nontrivial E]` to the Lean signature, as in item 4's headline.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result |
|---|---|---|---|
| §1.1 item 4, `24r=B_Q(x,w;y,z)−B_Q(y,w;x,z)` | orthonormal x,y, K=1, z=y, w=x; `r=ω⊗ω` on ℝ⁴ at (e₁,e₂,e₃,e₄) | 16−(−8)=24=24·1; without Bianchi 8−(−8)=16≠24; general: 8(2r+r(x,z,y,w)−r(y,z,x,w))=24r | holds; both Checks agree |
| §1.1 item 1, moving-frame curvature against Bishop §3.11 | bishop-rg lines 570–583 | Bishop: `R_XY=D_[X,Y]−D_XD_Y+D_YD_X`, matrix of R_XY is −Φ; ours is the negative, so matrix Φ | sign sentence correct |
| §1.2 Checks | `dx²+e^(2x²)dy²`; S³ of radius 1 and 2 | f″/f=2+4x², K=−2−4x², ∂ₓK(1)=−8; Ric=2g and g/2 | holds |
| §1.3 warped product, conformal, Lie group, O'Neill | (0,π)×_sin S^k; hyperbolic plane; ℝ^(k+1)∖0; `dx²+e^(2x)dy²`; Hopf S³→CP¹ | Ric(V,V)=(k−1)/sin²−(−1+(k−1)cot²)=k, 2 at k=2, t=π/3; K=−1; flat; T_UU=−∂ₓ; 1+3=4 | holds; Δ sign pinned |
| §1.3 normalization `−½Re tr(XY)` | X=[[0,−1],[1,0]]; X=diag(0,i) | 1=\|Xe₂\|²; ½ against 1 | holds |
| §2.1 Jacobi Checks; `exists_jacobi_initial_data` | flat u+tv; sin(t)E on S²; t²E; pin search | residual 0; −sin+sin=0; 2E≠0; pin has only `finrank_jacobiFieldSpace_le`, no existence | holds; not a duplicate |
| §2.2 jets | unit S², t=π/2; Brewin (11.1) | \|d exp(Y)\|=2/π against 1; sin²t=t²−t⁴/3+…; coefficients −⅓, −⅙ match | holds |
| §2.3 rescaled metrics | v=E_j(x)/λ_j in `δ−⅓⟨R(e_a,v)v,e_b⟩` | correction O(λ_j⁻²); curvature λ_j⁻²K by the scaling law with c=λ_j² | holds |
| `morse_index`, `indexForm` | S², [0,3π/2], sin(2t/3)E; [0,π]; constant geodesic; flat tent | (4/9)(3π/4)−3π/4=−5π/12, sum=1; I=0, index 0; multiplicities 0; value 1 | holds |
| `singularHomology_loopSpace_sphere` | n=2; n=3; n=1 | n−1=1 divides all i; ℤ in even degrees; ΩS¹ has H₀ of infinite rank, excluded by 2≤n | holds |
| `rauch_norm_ge_of_sectional_le` | radius 5/2 against κ=1; tangential D_tX(0), κ<0; n=1 | 1≤1.4695 at π/2, 1≤0 fails at 5π/2 (guard); t<sinh t (normality needed); X=0 | holds |
| `modelBallVolume`, `guenther` | n=0,1,2,3; unit S², κ=1; flat torus r=0.6 | r, r, r²/2 and 1−cos r, r³/3; 2π(1−cos r) both sides; exp not injective | holds |
| `bishopGromov` | S²; H² against κ=0; n=0, n=1 circle | 2.888, 2.224, 1.273 decreasing; 3.41, 4.34 increasing (hypothesis fails); 1/s; min(2s,L)/s | holds |
| `exists_upper_barrier_laplaceBeltrami_le` | ℝⁿ; Hⁿ n=2, ℓ=1; Sⁿ antipode κ=0; κ=1, ℓ=3π/4; n=1 | (n−1)/ℓ; coth 1=1.3130 (t/ℓ gives 1.3333); (1/π−π/3)(n−1)=−0.729(n−1)≤0.318(n−1); cot=−1; 0≤0 | holds; R01 |
| `cartanHadamard_isCoveringMap`, `bonnetMyers_distance`, `myers_finite_fundamentalGroup` | point; Nicolaescu 5.2.26 with λ=(n−1)/r²; pin search | covering of a point; π√((n−1)/λ)=πr; pin has only `finite_fundamentalGroup_of_compactSpace` | holds |
| `synge`, `synge_orientable_of_odd` | dim 0; RP², torus, RP³; dim 1 | point; excluded by orientability, positivity, parity; circle orientable | holds |
| `killingHopf_euclidean`, `killingHopf_sphere` | n=0, 1; n=1 with κ=1 | point, line; line is not S¹, excluded by 2≤n | holds |
| `two_distinct_geodesics` | circle; simply connected M | two arcs; one critical point would make the path space contractible | holds |
| `three_simple_closed_geodesics` | constant curve; multiple cover | excluded by `InjOn` on [0,T), T>0; same range | statement as in Taimanov |
| `paraboloid_geodesic_crossings`, `paraboloid_vertex_pole` | a=1; crossing at t_n; r=1 | r″(0)=1/5; det=2ab≠0 with b=a/R_n, radial a>0; ℓ(1)=1.4789, r/ℓ=0.6762<1 | holds |
| R5c closed and λ₁ headlines | circle, q=0, q=−1; point | 0,1,1,4; −1,0,0,3; μ=q, φ=1 | holds; R02 |
| `exists_rayleigh_lt_of_pos_dirichletEigenfunction` | (π/4,3π/4)⊂(0,π); {ρ₁=0}=∅; dim 0 | 4>1; D₁ clopen forces D₁=D₂, contradicting `hne`; vacuous | holds |
| Dirichlet headlines | [0,π], q=0, f=Φ=1; q=−2; q=−1 | 1+x(π−x)/2; u(π/2)=1/cos(√2π/2)=−1.65, `hpos` fails; no solution | holds |
| R7.6, R7.7 headlines | flat circle; S²∖2 points; Sⁿ; S²×S² | b₁=1 (Ric=0); b₁=1 (noncompact); ℛ_p=p(n−p); Rop≥0 with kernel, b₂=2 | holds |
| `riemannianDist_eq_sSup_smooth` | f=0; x=y | set nonempty, bounded by dist; both sides 0 | holds |
| R7.9 headlines | equator of Sⁿ; torus circle; ℝP²⊂ℝP³; point in ℝ; Möbius band | two hemispheres; period 1, connected complement; one-sided; two half-lines; range not closed | holds |
| R8.2, R8.3 headlines | S¹; S², X₃ and X₁X₂; N=2; N=4, 5 | λ=d²; 2 and 6; two invariant lines (3≤N needed); (d+1)², 14=10+4 | holds |
| R5a/R5b/R6 conventions | unit sphere; cylinder; circle focal form; arc of equator ℓ=3π/2 | B=−gν, S_ν=−Id; −1,0; I_M=1/b−1; 4/9−1=−5/9, index 1 | consistent across layers |
| Description, "Edits to the parent README" and "Suppliers" | `git diff origin/main...HEAD` on the parent files; parent ids cited by MinimalSurfaces | three text hunks and two References hunks; R1, R3, R4.1–R4.3, R4.5, R5a, R5b, R5c, R7.0, R7.6, R7.9, R8.2 | agrees with the head |

- Previous review (of 530ac52): no finding to recheck. The folder's change since then is main's R5c, R7.9, R4.1 barriers and Surfaces S6, merged in; `Suggested.lean` is byte-identical to main's.
- Source locators checked against the text: 14 in the sample §§1.1–2.3 (bishop-rg lines 570–583, 1872–1904; andrews-dg-ch16 lines 105, 429–431; nicolaescu-lectures lines 4630, 6793–6801, 8870–8889; spacetime-guided-tour lines 2119–2122, 2919, 2953; brewin-rnc lines 363, 614), and 14 outside it (Nicolaescu 5.1.17, 5.2.26, 6.2.6, 6.2.29, 12.2.5; Bishop 7.9, 7.11; Zhu 3.1, 3.3; Taylor 8.2.1, (8.2.2), (8.2.13), 8.4.2, 8.5.1). All page numbers agree. The README flags no locator as unverified.
- Library: 308 backticked names resolve at the pins; all 89 full file paths and the abbreviated ones exist. Opened `Jacobi/Basic.lean:59` (`IsJacobiFieldOn` includes the geodesic), `Jacobi/Space.lean:163`, `Jacobi/Conjugate.lean:171`, `DeRham/SimplyConnected.lean:104`, `UniversalCover/Compact.lean:57`, `Riemannian/Laplacian.lean:238`. No headline is proved at the pin.
- Cross-roadmap citations resolved on main: GeometricTopology 1.1, 1.3, 1.5, 1.7.1, 7.1; PDE A3, A4, A6, C13, E20 (its global clause); VariationalMethods 3.1, 4.1–4.4; DifferentialGeometry 12.5; Poincare3D 8.1; Yamabe Y9; GeometricCurrents G6; PositiveMass 2.3. GeneralizedCohomology G4.0b is on main (README line 1082); #1807 renames the G4 heading and maps it in its "Former heading and numbering" table.
- Gate: every check 0, OK, build included. `depcheck: 219 roadmaps, 1956 edges, 0 problem(s)`. Nothing changed outside the roadmap folders.
- Elaboration: `lake env lean` on `TauCetiRoadmap/RiemannianGeometry/Suggested.lean` gives 30 `sorry` warnings and nothing else. Elaborated signatures compared with the README: only the definitions `IsEndpointZeroSmoothSection` and `indexForm` drop section binders, none needed. Padding decided by reading: no declaration is a one-tactic statement, a restated definition or a Check.
- R4.9's subsections were sampled (R4.9.0 and R4.9.4 Checks: `r+2π sin r`; `arccos(3/4+cos(2s)/4)` at colatitude π/6), not recomputed statement by statement.
- Overlap check: read LorentzianGeometry, ManifoldOptimization, DGFloer, SmoothBundlesConnections, Surfaces, RicciFlow, Yamabe, and SpecialFunctionsLegendre, PositiveMass, MorseTheory; nothing shared. Each consumes R1–R8 by section; spherical-harmonic completeness is R8.2's (SpecialFunctionsLegendre 11.3 cites it), Jordan–Brouwer for continuous injections is MorseTheory's pinned input.

Source independence: 16 passages compared with 6 sources (bishop-rg, andrews-dg-ch16, nicolaescu-lectures, spacetime-guided-tour, brewin-rnc, zhu-ricci-comparison), none shared beyond formulas and phrases the mathematics forces; largest share milnor-morse-theory, 12 of 64 page locators, whose text is uncertified and was not read; contents compared with its published table of contents (Parts I–IV, §§1–24): independent, the roadmap citing §14–§17 in Layers 2–3 and §6 in Layer 6.

## Not verifiable

- milnor-morse-theory (§14, Lemma 14.4, Theorems 14.1, 15.1, 17.3, §6): uncertified, text not read.
- oneill-submersion, lee-irm, fulton-harris: uncertified, text not read.
- Lynch, arXiv:2611.12758v1 (R4.1 barrier); Gilbarg–Trudinger; Axler–Bourdon–Ramey; Bott–Tu; Lima; Samelson; Caracciolo et al.; Hirsch; Morse: not in the sources cache, outside the sample, not read.
- eschenburg-comparison §3, pp. 13–14: the cached extraction returned no searchable text for "Rauch" or "3.3"; not checked.

## Source issues

- **Error** in caponio-javaloyes-morse at §1, p. 1 (lines 18–20): the source says Serre's theorem gives loop-space homology in infinitely many degrees whenever some positive-degree homology of M is nonzero, for instance M compact; it should be assumed that M is simply connected, the circle being a counterexample; affects a stated result.

## For the human reviewers

- **Licence.** Lynch, arXiv:2611.12758v1, cited at README line 2463 for the barrier comparison, is an unpublished preprint absent from the roadmap's source manifest.
- **Licence.** spacetime-guided-tour (arXiv:2606.02616, an unpublished expository text) is the cited source for Killing–Hopf (README line 2733) and for flatness (line 1105, which also names Lee, Theorem 7.10).
- **Scope.** `paraboloid_geodesic_crossings` is sourced to an examples sheet (wilson-dg-examples-3, Problem 14, README line 3475); the README states which parts the headline adds.
- **Not tested.** milnor-morse-theory has the largest share of locators (12 of 64) and is uncertified: its wording was not compared; only its published table of contents was.
