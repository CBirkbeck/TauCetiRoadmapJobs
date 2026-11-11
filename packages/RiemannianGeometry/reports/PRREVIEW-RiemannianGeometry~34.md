# Review of RiemannianGeometry (pull request #2223 at 150ca43)

**Verdict:** needs changes

## R01 (P1) — R7.9 relies on five Tau Ceti declarations and one file that do not exist at the pin

**Location.** `TauCetiRoadmap/RiemannianGeometry/README.md:3798` (`TauCeti.IsBicollar.image_subset_connectedComponentIn`), `:3824` (`TauCeti.IsBicollar.closure_eq_union_range`), `:3831–3832` (`TauCeti.contMDiff_subtypeVal_scalarRegularSublevel`, `TauCeti.isInvertible_mfderiv_subtypeVal_scalarRegularSublevel`), `:3840` (`TauCeti.isOutwardPointing_scalarRegularSublevel_iff`), `:3935` (`RegularValue/Scalar/{Sublevel,Outward}.lean`).

**Claim.** The connectedness of the collar sides, the closures `D_± = Ω_± ∪ f(Σ)`, the smoothness and invertible differential of the sublevel inclusion, and the outward-normal characterisation are written as supplied by Tau Ceti, so no target owns them.

**Witness.** In the pinned Tau Ceti tree (2fd255d), grep finds none of the five names. `RegularValue/Scalar/` holds only `Sublevel.lean` and `Submersion.lean`. The `IsBicollar` lemmas are at `LocallyFlat/Bicollar.lean:130–244`.

**Repair.** In R7.9, replace the five names with targets owned here:
- "U₊ and U₋ are images of the connected Σ×(0,ε) and Σ×(−ε,0), so each lies in a single component of M∖f(Σ)".
- "Prove `closure Ω_± = Ω_± ∪ f(Σ)`, using `TauCeti.IsBicollar.apply_mem_closure_image` and `TauCeti.IsBicollar.range_diff_range_eq_union`".
- "Prove that, with `TauCeti.scalarRegularSublevelChartedSpace`, the inclusion of a regular sublevel `{φ≤a}` is smooth with invertible differential".
- "Prove that a tangent vector v at a boundary point of `{φ≤a}` is outward (`TauCeti.IsOutwardPointing`, `Geometry/Manifold/Boundary/Orientation.lean`) exactly when `dφ(dι v)>0`".

In the *Needs:* line, change `{Sublevel,Outward}.lean` to `Sublevel.lean` and add `Boundary/Orientation.lean`.

## R02 (P2) — R7.9's two headline theorems are statable at the pins but absent from `Suggested.lean`

**Location.** `TauCetiRoadmap/RiemannianGeometry/README.md:3868`: "The headline statements are: (1) … (2) A simply connected M contains no closed embedded one-sided hypersurface." `Suggested.lean` states neither, and its module docstring does not name them.

**Claim.** Both headlines are statable with `Manifold.IsSmoothEmbedding`, Riemannian tangent spaces and `TauCeti.deRhamCohomology`. Absent from `Suggested.lean` and not named as unstatable, they are a P2 defect.

**Witness.** A copy of `Suggested.lean` with the section below added before the closing `end` elaborates under `lake env lean` with 25 `sorry` warnings (23 before) and no error.

**Repair.** Add this section to `Suggested.lean`:
```lean
/-! ## Layer 7: Separating and two-sided hypersurfaces -/

section Hypersurfaces

variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  [FiniteDimensional ℝ E] [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  [I.Boundaryless] [TopologicalSpace M] [T2Space M] [ChartedSpace H M] [IsManifold I ∞ M]
  [RiemannianBundle (fun x : M => TangentSpace I x)]
  [IsContMDiffRiemannianBundle I ∞ E (fun x : M => TangentSpace I x)]
  {E' H' S : Type*} [NormedAddCommGroup E'] [NormedSpace ℝ E'] [FiniteDimensional ℝ E']
  [TopologicalSpace H'] {I' : ModelWithCorners ℝ E' H'} [I'.Boundaryless]
  [TopologicalSpace S] [ChartedSpace H' S] [IsManifold I' ∞ S]

/-- R7.9 (2): a closed embedded hypersurface of a simply connected manifold is two-sided. -/
theorem exists_unitNormal_of_simplyConnectedSpace [SimplyConnectedSpace M] [CompactSpace S]
    (hdim : Module.finrank ℝ E' + 1 = Module.finrank ℝ E)
    {f : S → M} (hf : Manifold.IsSmoothEmbedding I' I ∞ f) :
    ∃ ν : ∀ x : S, TangentSpace I (f x),
      ContMDiff I' I.tangent ∞ (fun x ↦ TotalSpace.mk' E (f x) (ν x)) ∧
      ∀ x, ‖ν x‖ = 1 ∧ ∀ v : TangentSpace I' x, inner ℝ (ν x) (mfderiv I' I f x v) = 0 := by
  sorry

/-- R7.9 (1): with `H¹_dR(M) = 0`, a connected closed two-sided hypersurface of a connected
closed `M` separates it into two components, each with closure itself plus the hypersurface. -/
theorem separates_of_subsingleton_deRhamCohomology_one [CompactSpace M] [ConnectedSpace M]
    (hH : Subsingleton (TauCeti.deRhamCohomology I M 1)) [CompactSpace S] [ConnectedSpace S]
    (hdim : Module.finrank ℝ E' + 1 = Module.finrank ℝ E)
    {f : S → M} (hf : Manifold.IsSmoothEmbedding I' I ∞ f) (ν : ∀ x : S, TangentSpace I (f x))
    (hν : ContMDiff I' I.tangent ∞ (fun x ↦ TotalSpace.mk' E (f x) (ν x)))
    (hν₁ : ∀ x, ‖ν x‖ = 1)
    (hν₀ : ∀ x (v : TangentSpace I' x), inner ℝ (ν x) (mfderiv I' I f x v) = 0) :
    ∃ A B : Set M, IsOpen A ∧ IsOpen B ∧ IsConnected A ∧ IsConnected B ∧ Disjoint A B ∧
      A ∪ B = (range f)ᶜ ∧ closure A = A ∪ range f ∧ closure B = B ∪ range f := by
  sorry

end Hypersurfaces
```
Name both theorems in backticks at README lines 3870 and 3876, and add them to the docstring's "Statable at the pins and stated here" list. The boundary-manifold and outward-normal parts of (1) stay in the README.

## R03 (P3) — R7.9's statements (1) and (2) have no source locator

**Location.** `TauCetiRoadmap/RiemannianGeometry/README.md:3811–3817` and `:3862–3866`. The only locator in R7.9 is "(Bott–Tu, … Ch. I, §5, for the closed form dual to a closed oriented submanifold …)".

**Claim.** That locator covers only the dual form. Neither the separation theorem nor the two-sidedness theorem cites a source.

**Witness.** R7.9 (README lines 3746–3941) contains one parenthesised locator, Bott–Tu at line 3814, and it is attached to the dual form. The description says "The source text proves statement 2 through the mod 2 intersection number", but the README names no such text.

**Repair.** After each of (1) and (2), add the exact theorem and page of a source that states it, for example the text the description calls "the source text" for (2), noting that it proves (2) through mod 2 intersection numbers. Record each source in the references.

## R04 (P3) — The defining function has one Check, and the normal collar has two

**Location.** `TauCetiRoadmap/RiemannianGeometry/README.md:3819` ("Construct a *defining function*: a smooth φ:M→ℝ with `φ⁻¹(0)=f(Σ)` … `grad φ=ν` along f") and the R7.9 **Checks**, lines 3887–3926. The defining function is tested only by `φ=x_(n+1)` on the equator.

**Claim.** Each definition needs at least three discriminating Checks. Here no Check excludes the reversed sign or a non-smooth signed distance, and no Check shows that the defining function needs separation.

**Witness.** On the equator of Sⁿ, `−x_(n+1)` has the same zero set and regular value 0 but gradient −ν, and it swaps Ω₊ and Ω₋. Only the law `grad φ=ν` excludes it, and no Check computes this.

**Repair.** Add three Checks:
- Sign: on the equator of Sⁿ, `−x_(n+1)` has gradient −ν and reverses Ω_±, so the law `grad φ=ν` excludes it.
- Smoothness: on the unit S², the signed distance `arcsin x₃` to the equator equals t near it but is `π/2−r` near the north pole, which is not smooth there. This is why h is constant for |t|≥ε/2.
- Separation needed: for the torus meridian no defining function exists. φ would have no zero on the connected complement, so one sign there, contradicting φ>0 on U₊ and φ<0 on U₋.

For the collar, add: on the unit Sⁿ, `c_ν` for the equator is injective on `S^(n−1)×(−ε,ε)` exactly when ε≤π/2, because at t=±π/2 every x maps to a pole.

## R05 (P3) — The supplier contracts omit R7.9's library inputs

**Location.** `TauCetiRoadmap/RiemannianGeometry/README.md:202–707` ("### From Tau Ceti") and `:171–200` ("### From Mathlib"). The scope says: "The exact declarations are in the supplier contracts."

**Claim.** R7.9's Tau Ceti and Mathlib inputs appear only in its *Needs:* line, not in the contracts.

**Witness.** Lines 171–707 contain no occurrence of `IsBicollar`, `VectorBundleOrientationCover`, `scalarRegularSublevel`, `periodHom`, `exists_isClosedEmbedding_normalExp_disc`, `subsingleton_deRhamCohomology_one_of_simplyConnectedSpace` or `existsUnique_continuousMap_lifts` (grep count 0 each).

**Repair.** Add to "From Tau Ceti" a paragraph "For R7.9", listing each declaration with its file and what is assumed of it:
- `TauCeti.IsBicollar` (`LocallyFlat/Bicollar.lean`)
- `TauCeti.periodHom`, `TauCeti.mem_exactForms_one_iff_periodHom_eq_zero`, `TauCeti.pathClassIntegral_trans` and `TauCeti.pathClassIntegral_mk_eq_pathIntegral` (`DeRham/Period.lean`)
- `TauCeti.subsingleton_deRhamCohomology_one_of_simplyConnectedSpace` (`DeRham/SimplyConnected.lean`)
- `TauCeti.scalarRegularSublevelChartedSpace`, `TauCeti.isManifold_scalarRegularSublevel`, `TauCeti.interior_scalarRegularSublevel` and `TauCeti.boundary_scalarRegularSublevel` (`RegularValue/Scalar/Sublevel.lean`)
- `TauCeti.isManifold_boundary` and `TauCeti.IsOutwardPointing`
- `TauCeti.VectorBundleOrientationCover` with `TauCeti.VectorBundleOrientation.nonempty_iff_exists_section` and `TauCeti.VectorBundleOrientation.nonempty_iff_not_connectedSpace` (`Topology/VectorBundle/Orientation/Cover.lean`)
- `TauCeti.SmoothEmbedding.exists_isClosedEmbedding_normalExp_disc`

Add to "From Mathlib": `IsCoveringMap.existsUnique_continuousMap_lifts` in `Mathlib/Topology/Homotopy/Lifting.lean`, which lifts maps from a simply connected, locally path-connected space.

## R06 (P3) — Layer 7's introduction and the build overview do not account for R7.9

**Location.** `TauCetiRoadmap/RiemannianGeometry/README.md:3527–3532`: "R7 works on PseudodifferentialOperators P1.0's … and on ComplexKahlerGeometry K5a's … and owns the geometric Weitzenböck identities with their vanishing consequences (R7.1–R7.8)". Also `:859`: "R7 applies the supplied analytic theory to curvature identities and vanishing".

**Claim.** R7.9 sits in Layer 7, but it uses neither P1.0 nor K5a and is not a vanishing theorem. The layer's introduction and the build overview contradict it.

**Witness.** README line 3959: R7.9 "uses neither P1.0 nor K5a, and R7.6 only for its positive-Ricci corollary".

**Repair.** Append to line 3532: "R7.9 adds the separation and two-sidedness of closed hypersurfaces, on GeometricTopology Layer 1.5's tubes and Tau Ceti's de Rham periods, using neither P1.0 nor K5a and R7.6 only for its positive-Ricci corollary." At line 860, change "and R8 identifies" to "R7.9 adds the separation and two-sidedness of closed hypersurfaces, and R8 identifies".

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result |
|---|---|---|---|
| 1.1 item 4, `24r=B_Q(x,w;y,z)−B_Q(y,w;x,z)` | orthonormal x,y, K=1, z=y, w=x; ω⊗ω on ℝ⁴ | 16−(−8)=24=24·1; without Bianchi 8−(−8)=16≠24 | holds; Checks correct |
| 1.1 item 4 derivation | general 4-linear r | multilinearity: B_Q=4(Σ four terms); pair interchange and Bianchi: difference=8(2r+r+r)=24r | holds over any commutative ring |
| 1.2 local symmetry | dx²+e^(2x²)dy² at x=1 | K=−2−4x², ∂ₓK=−8≠0, so ∇R≠0 | Check correct |
| 1.2 Einstein constancy | unit S³; radius-2 S³; dimension 1 | a=2; a=(n−1)K=1/2; Ric=0 gives a=0 | Check correct |
| 1.3 warped curvature | (0,π)×_sin S², t=π/3; ℝ²: dx²+e^(2x)dy² | Ric(V,V)=4/3+2/3=2 (Δ⁺ reading gives 0); ⟨R(V,X)X,V⟩=−1 | matches O'Neill with opposite sign |
| 1.3 O'Neill A, T | Hopf S³→CP¹; e^(2x), e^(4x) warps | \|A_XY\|=1, K=1+3=4; T_UU=−∂x, −2∂x | Checks correct |
| 1.3 bi-invariant curvature | Andrews' R_ikjl=g(∇_k∇_iE_j−…,E_l) | his R_ijkl=¼⟨[E_i,E_j],[E_k,E_l]⟩ ⇒ ours −¼[[X,Y],Z]; K=¼\|[X,Y]\|² | sign translation correct |
| 1.3 projective normalisation | X=[[0,−1],[1,0]]; diag(0,i); CP¹ | −½tr X²=1=\|Xe₂\|; ½ vs 1; area 4π(½)²=π | Checks correct |
| 2.1 Jacobi | great circle J=sin t·E; flat J=t²E | −sin t E+sin t E=0; residual 2E≠0 | Checks correct |
| 2.2 jets | unit S², t=π/2; geodesic triangle with three right angles | transported norm 1 vs sin t/t=2/π; holonomy=area 4π/8=π/2 | Checks correct |
| 2.2 metric expansion | unit sphere, e_i⊥v | ⟨R(e_i,v)v,e_i⟩=\|v\|²; g_ii=1−\|v\|²/3; sin²t=t²−t⁴/3+O(t⁶) | matches Brewin and Bishop signs |
| 2.3 rescaled limits | v=E_j(x)/λ_j | correction O(λ_j⁻²); K(g_j)=λ_j⁻²K(g), e.g. 1/100 for λ=10 on S² | consistent with the scaling law |
| `exists_jacobi_initial_data` | flat ℝⁿ | J(t)=u+(t−a)v: J(a)=u, D_tJ(a)=v | holds |
| `morse_index` | unit S², [0,π] and [0,3π/2] | sum 0, Wirtinger ∫f′²−f²≥0; sum 1, f=sin(2t/3) gives a negative value | holds |
| `singularHomology_loopSpace_sphere` | n=2, n=3 | ΩS²: ℤ in all degrees; ΩS³: ℤ in even degrees, 0 in odd | holds |
| `rauch_norm_ge_of_sectional_le` | S², κ=1, b<π; κ=−1 tangential J=tγ′ | equality sin t; t<sinh t, so `hnormal` is needed and present | holds |
| `guenther` | S², κ=1; n=1 | both sides 2π(1−cos r); both sides 2r | holds |
| `bishopGromov` | flat ℝⁿ; circle of length L, n=1 | ratio constant n·vol(Bⁿ); min(2r,L)/r nonincreasing | holds |
| `cartanHadamard_isCoveringMap` | flat T² | exp_p: ℝ²→T² is the universal covering | holds |
| `bonnetMyers_distance`, `myers_finite_fundamentalGroup` | unit Sⁿ with λ=n−1; RPⁿ | bound π equals the diameter π; π₁=ℤ/2 | hold |
| `synge`, `synge_orientable_of_odd` | RP², RP³ | RP² nonorientable, excluded; RP³ orientable with π₁=ℤ/2 | hold |
| `two_distinct_geodesics` | S¹ of length 2π, p≠q | the two complementary arcs on [0,1] | holds |
| `killingHopf_*` | n=1 hyperbolic; n=1 sphere | ℝ≅({t>0}, dt²/t²) via log; excluded by 2≤n | hold |
| `three_simple_closed_geodesics`, paraboloid theorems | round S²; vertex r=0 | infinitely many great circles; K=4/(1+0)²=4 | hold |
| `subsingleton_deRhamCohomology_one_of_ricciTensor_pos` | S² minus 2 points; flat S¹ | Ric=g, b₁=1 (not compact); Ric=0, b₁=1 | hypotheses needed |
| `…_of_curvatureEndomorphism_pos` | S²×S² | Rop≥0 with mixed kernel, b₂=2 | positivity needed |
| `riemannianDist_eq_sSup_smooth` | x=y; ℝ | sSup{0}=0; truncated smoothings of t−x reach \|x−y\| | holds |
| R8.2, R8.3 | S¹ with cos dθ; N=2, d=1 | λ=d²=d(d+0); (x₁±ix₂) span two invariant lines | hold; bounds needed |
| R7.9 at most two components | two circles x₃=±½ on S² | three components, but Σ is disconnected | connectedness of Σ needed |
| R7.9 (1) separation | equator of Sⁿ, n≥2; torus meridian | two open hemispheres; complement connected, [ω_ν]=[dθ]≠0, period 1 | holds; H¹=0 needed |
| R7.9 `[ω_(−ν)]=−[ω_ν]` | χ(−t)=1−χ̃(t) | d(χ(−t))=−d(χ̃∘t) | holds |
| R7.9 defining function, outward normal | equator, φ=x_(n+1) | grad=e_(n+1)−x_(n+1)p, equal to ν on the equator; D₋ outward ν, D₊ outward −ν | holds |
| R7.9 (2) and the cover p_f | RP¹⊂RP², RP²⊂RP³; torus meridian | p_f is S²→RP², S³→RP³ (no section); ℝ/2ℤ×ℝ/ℤ→T², connected though f is two-sided | holds; section suffices, not needed |
| R7.9 positive-Ricci corollary | RP²⊂RP³, Ric=2g | H¹=0 but f one-sided, complement a connected ball | two-sidedness needed in (1) |

- Source locators checked against the text: 13. These are `andrews-dg-ch16` line 105 (Prop. 16.2.1, p. 154) and line 429 (Cor. 16.8.5, p. 162). `nicolaescu-lectures` lines 4604–4630 (§3.3.2, (3.3.7), pp. 103–104), 6793 and 6801 (Prop. 4.1.25, Lemma 4.1.26, p. 151), 8870 (Ex. 4.2.36, p. 195) and 8888 (Exercise 4.2.38, p. 196). `bishop-rg` lines 1872–1904 (Thm 6.11, §6.11, Problem 6.12, p. 41). `brewin-rnc` line 363 (§5, p. 9) and line 614 ((11.1), p. 15). `spacetime-guided-tour` lines 2919–2983 (Lemmas 35–36, pp. 61–62). The README's sign translations for Andrews, Brewin, Bishop and Barzen–Leymann agree.
- Library declarations opened at the pins: 20. Examples are `IsBicollar` (`Bicollar.lean:101`), `apply_mem_closure_image` (`:192`), `Sublevel.lean:473/639/652/675`, `IsOutwardPointing` (`Boundary/Orientation.lean:46`), `Cover.lean:498/533`, `DiscSphere.lean:56`, `Period.lean:148/197/313/405`, `SimplyConnected.lean:103`, `Sphere.lean:96`, `SectionalPolarization.lean:62`, Mathlib `Lifting.lean:489` and `SmoothEmbedding.lean:70`.
- Cross-roadmap citations resolved on main: 9. They are GeometricTopology 1.5 and 1.7.1 item 3, Poincare3D 8.1, DifferentialGeometry 6.1, 6.3 and 12.5, GeneralizedCohomology G4.0b (main line 1082), AlgebraicTopology §4.6 (main line 1666), and R7.6's `subsingleton_deRhamCohomology_one_of_ricciTensor_pos` (`Suggested.lean:513`).
- Leads from the overlap tool: the GeneralizedCohomology G4 anchor that #1807 drops is mapped by that head's "Former heading and numbering" table, so the citation needs no change. "§G4.0b only in an open revision" is a false lead, because G4.0b is an item on main.
- Gate at 150ca43: every check passed. Dependency check: `depcheck: 206 roadmaps, 1912 edges, 0 problem(s)`.
- `lake env lean Suggested.lean`: 23 `sorry` warnings and nothing else. `#check` leads: `IsEndpointZeroSmoothSection` and `indexForm` are defs whose consumers carry the dropped binders. The `is` "instance" entry comes from a docstring word. With R02's section added, the file gives 25 `sorry` warnings and no error.
- Padding and duplication: no `Suggested.lean` theorem is proved at the pins. Tau Ceti's Bonnet–Myers is the MCP metric-measure bound (`MeasureContraction.lean:133`), a different carrier. Tau Ceti's six-term polarization (`six_mul_apply_eq_of_cyclic_eq_zero`) is cited, and §1.1 item 4 owns only the distinct mixed form.
- Pull-request text: the "Edits" paragraph matches the four diff hunks (scope sentence, R7.9, Layer 7 Dependencies, Bott–Tu reference), and no sentence is contradicted by the head. Other open pull requests changing this roadmap (#2222, #2224, #2225, #2226) all merge cleanly with this one.

Overlap check: read Surfaces (main and #2225), MinimalSurfaces (#2226), ManifoldOptimization (#1506), DGFloerPartII (#1799), RicciFlow and DifferentialGeometry (main). The separation and two-sidedness of closed hypersurfaces is owned here (R7.9); MinimalSurfaces cites it, and GeometricTopology 1.7.1 item 3 and Poincare3D 8.1 keep distinct special cases with their own routes. The round Hopf metrics' curvature range [1,4] and period π are owned by RiemannianGeometry R1 on main; DGFloerPartII 1.3 restates them and should cite R1. De Rham periods and the divergence theorem are owned by DifferentialGeometry 6.1–6.3 and 12.5 and cited here. Ownership against all open heads was checked with `roadmaps grep` ("two-sided|one-sided hypersurface|separates"), with no other owner found.

## Not verifiable

- `milnor-morse-theory` §14, p. 77, and Lemma 14.4, pp. 80–81 (2.1): recorded as uncertified in the manifest; text not read.
- `oneill-submersion` Theorem 2 and Corollary 1 (1.3): recorded as uncertified; text not read.
- Bott–Tu, *Differential Forms in Algebraic Topology*, Ch. I, §5 (R7.9): a paywalled book with no entry in the manifest; text not read. The section title was checked from memory of the table of contents only.

## Source issues

- **Error** in nicolaescu-lectures at Exercise 4.2.38, p. 196: the source says the scalar curvature of every Einstein manifold of dimension at least three is constant, with no connectedness assumed; it should say locally constant, or constant on connected manifolds (a disjoint union of round S³ of radii 1 and 2 is Einstein); affects a stated result.
- **Misprint** in andrews-dg-ch16 at Proposition 16.2.1, p. 154: the source names the plane "generated by e1 and ej" before writing it as e_i∧e_j; it should say e_i and e_j; affects nothing.
