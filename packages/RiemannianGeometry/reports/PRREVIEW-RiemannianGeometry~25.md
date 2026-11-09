# Review of RiemannianGeometry (pull request #1683 at 40cac13)

**Verdict:** needs changes

This is a full review of `TauCetiRoadmap/RiemannianGeometry/README.md` and `TauCetiRoadmap/RiemannianGeometry/Suggested.lean` at `40cac13`. The pins are unchanged: Tau Ceti `2fd255d9`, Mathlib `1b1ccf4b`.

The gate passes, and the dependency check reports 0 problems. `Suggested.lean` elaborates with exactly 22 `sorry` warnings. All four previous findings except the #1187 ordering are repaired. The four findings below are all P3; none is blocking.

## R01 (P3) — R4.7 and R5a restate two Tau Ceti results without citing them

**Location.**
- `README.md:2013–2016` (R4.7): "derive the round-sphere Levi-Civita connection by ambient tangential projection and from it the great-circle geodesics, using R1's connection identities".
- `README.md:2521` (R5a): "Prove the induced tangential connection is Levi-Civita".
- `README.md:2687–2689` (R5a.2): "Compute the unit round sphere in stereographic coordinates, with `g_ij=4δ_ij/(1+|x|²)²`, … K=1".

**Claim.** The previous review's R01 repair moved most of the restated library results into the Tau Ceti contract. Two pinned results are still planned as targets and are cited nowhere in the README:
- the Gauss formula for an isometric immersion into a real inner-product space, which gives the round-sphere connection by tangential projection;
- the round metric in stereographic coordinates.

**Witness.**
- `CovariantDerivative.IsLeviCivitaConnection.inner_apply_eq_inner_mvfderiv` (`TauCeti/Geometry/Manifold/VectorBundle/CovariantDerivative/LeviCivita/Immersion.lean:65`): `⟪∇_X Y, w⟫ = ⟪D_X(df Y), df w⟫` for a C² inner-product-preserving map into a real inner-product space. `Sphere/Curvature.lean` applies it to the sphere's inclusion.
- `TauCeti.inner_mfderiv_stereographic'_symm` (`TauCeti/Geometry/Manifold/Riemannian/Sphere/Stereographic.lean:98`) gives the factor `(4/(‖y‖²+4))²` for Mathlib's `stereographic'`. Substituting y=2x gives `4·(4/(4|x|²+4))² = 4/(1+|x|²)²`, the README's coefficient. At x=0 both sides equal 4.

**Repair.**
1. Add both declarations to the "From Tau Ceti" contract, with their files.
2. In R4.7, replace "derive the round-sphere Levi-Civita connection by ambient tangential projection" with: "Tau Ceti's Gauss formula `CovariantDerivative.IsLeviCivitaConnection.inner_apply_eq_inner_mvfderiv`, applied to the inclusion Sⁿ→ℝⁿ⁺¹, gives the round-sphere connection; R4.7 derives the great-circle geodesics from it".
3. In R5a, say that the flat-ambient case (N a real inner-product space) of "the induced tangential connection is Levi-Civita" is that Tau Ceti theorem. R5a still owns the case of a Riemannian ambient N, through the pullback ambient connection.
4. In R5a.2, cite `TauCeti.inner_mfderiv_stereographic'_symm` for `g_ij`, with the dictionary y=2x between Mathlib's chart and the equatorial chart, and `TauCeti.hasConstantSectionalCurvature_sphere` for K=1. Keep Γ and H=−position as owned computations.

## R02 (P3) — No R1.3 Check pins the sign of the Δf term in the vertical Ricci curvature of a warped product

**Location.**
- `README.md:859–860`: "`Ric(V,W)=Ric_N(V,W)−(f⁻¹Δf+(k−1)f⁻²|grad f|²) g(V,W)`", with Δ=div grad (`:854`).
- The Checks at `:864–876`.

**Claim.** The README uses both Laplacian signs, Tau Ceti's Δ=div grad and Δ⁺=−div grad (`:135–138`). None of the four Checks exercises the f⁻¹Δf term with Δf≠0:
- the hyperbolic-plane and sphere Checks test only mixed and vertical sectional curvature, and the horizontal Ric(∂t,∂t);
- the Euclidean Check has Δf=f″=0.

So the formula with Δ⁺ in place of Δ passes every Check. The same holds for the "opposite sign" warning taken from Barzen–Leymann.

**Witness.** Take S³ as (0,π)×_(sin)S² (k=2), with a unit vertical V at t=π/3:
- Ric_N gives (k−1)/sin²t=4/3, the correction is −(f⁻¹Δf+(k−1)cot²t)=−(−1+1/3), and the sum is 2=k, the unit-sphere value;
- with Δ⁺, f⁻¹Δ⁺f=+1 and the sum is 4/3−(1+1/3)=0=k−2.

**Repair.** Add the Check: "On (0,π)×_(sin)S^k, the unit sphere, f⁻¹Δf=−1 and a unit vertical V has `Ric(V,V)=(k−1)/sin²t+1−(k−1)cot²t=k`; reading Δ as Δ⁺=−div grad gives k−2." Tested at k=2 and t=π/3, which gives 2 and 0.

## R03 (P3) — The description still does not order this pull request against #1187

Carried over from the previous review's R03 (originally R08 two rounds earlier). No repair report marks it as not actionable.

**Location.** The pull-request description, which names #1327 and #1974 but not #1187.

**Claim.** The overlap tool still lists `TauCetiRoadmap/RiemannianGeometry/Suggested.lean` among the files where #1187 ("chore: bump TauCeti to ab00ba392") and this head conflict. Nothing says which of the two is rebased on the other.

The description is also stale on two points:
- It describes a `ParaboloidTargets.lean` "with exactly three admission warnings", but the folder at this head has no such file.
- It cites Mathlib pins `6b7abb3c…` and `f6090c70…`, but the pin is `1b1ccf4b`.

**Witness.** `roadmaps overlaps RiemannianGeometry`: "#1187 and #1683 conflict in … `TauCetiRoadmap/RiemannianGeometry/Suggested.lean`". `git diff --stat origin/main...HEAD` lists only `README.md` and `Suggested.lean`.

**Repair.**
1. Add one sentence to the description: this pull request does not wait for #1187, whose Tau Ceti pin `ab00ba392` is an ancestor of this head's pin `2fd255d9`, so #1187's change to this folder is superseded.
2. Delete the `ParaboloidTargets.lean` and stale-pin sentences.

## R04 (P3) — Two form defects introduced in this round: References miss the new locators, and one Lean line is too long

**Location and claim.**
- **Barzen–Leymann.** `README.md:852` cites Barzen–Leymann, Lemmas 35 and 36, pp. 61–62, for the warped-product curvature. The References entry (`:3614–3617`) records only "Theorem 9, p. 60 … used by R4.7".
- **Nicolaescu.** `README.md:1238` cites Nicolaescu, Lemma 4.1.26, p. 151. The References entry (`:3580–3581`) lists only Definition 4.1.23 and Proposition 4.1.25 at p. 151.
- **Manifest.** The package's `sources.toml` records the same narrower locators: `locator = "Theorem 9 (Killing–Hopf), p. 60"`, and for Nicolaescu, Definition 4.1.23 and Proposition 4.1.25 but not Lemma 4.1.26.
- **Line length.** `Suggested.lean:58` is 118 characters ("isometry groups of Euclidean space and of the round sphere (R4.7); the almost-everywhere Morse property of the squared"), over the 100-character limit. It came from this round's docstring edit; main's copy has one long line.

**Witness.**
- `spacetime-guided-tour` line 2919 (Lemma 35, p. 61) and lines 2971–2976 (its items, p. 62).
- `spacetime-guided-tour` line 2953 (Lemma 36, p. 62) and lines 2981–2983.
- `nicolaescu-lectures` line 6801 (Lemma 4.1.26), under the printed header "4.1. METRIC PROPERTIES 151" at line 6769.
- `awk 'length>100'` on `Suggested.lean` prints line 58 only.

**Repair.**
1. Add to the Barzen–Leymann entry: "Lemmas 35 and 36, pp. 61–62: curvature and Ricci tensor of a warped product, with the opposite curvature sign, used by R1.3".
2. Add to the Nicolaescu entry: "Lemma 4.1.26, p. 151 (the Christoffel symbols of normal coordinates vanish at the centre, used by R1.4)".
3. The worker adds both locators to `sources.toml`.
4. Rewrap `Suggested.lean:57–58` at 100 characters.

## Previous findings

- **R01 (P2, Tau Ceti results restated in R1.1, R1.2, R1.3, R2.1, §2.2 and R4.7): repaired.**
  - R1.1 (`README.md:676–694`) now reads "Consume the existing pointwise … carriers and their identities, all Tau Ceti's (supplier contract)". It names both Bianchi identities, skew symmetry, pair interchange, the chart formula, smoothness, ∇R with its trace and naturality, and the Ricci identity. It keeps the moving-frame form as owned.
  - R1.2 (`:780–787`) consumes `CovariantDerivative.HasParallelCurvature`, `TauCeti.IsLocalRiemannianIsometry.hasParallelCurvature` and `…isLocalRiemannianIsometry_restrictOpenTangentSpace`. It keeps the parallel-transport characterization and flat ⇔ locally Euclidean as owned.
  - R1.3 (`:828–848`) cites the four scaling theorems, the three product theorems and the warped-product connection. The warped-product curvature (`:850–879`) is a genuine new target: Tau Ceti's `LeviCivita/WarpedProd.lean` stops at the connection (`:123`, `:150`).
  - R2.1 (`:1129–1137`) cites `TauCeti.Manifold.IsJacobiFieldOn.eq_mfderiv_riemannianExp` and the Gauss lemma `TauCeti.Manifold.inner_mfderiv_riemannianExp_radial`. It keeps the varying-basepoint version, which now names SBC B6.0.
  - §2.2 (`:1194–1196`, `:1236–1241`) cites `TauCeti.Manifold.normalCoordinateField` and both first-jet theorems.
  - R4.7 (`:2002–2008`, `:2026–2038`, `:2076–2079`) cites the sphere, radius-r and half-space curvature theorems, the three isometry-group results and `ext_of_mfderiv_eq`. It keeps E(n)=ℝⁿ⋊O(n), O⁺(n,1) and the local-isometry extension as owned.
  - `:1274–1277`, `:1289–1293`, `:1306–1307` and `:3529–3531` now name `Bundle.ContMDiffRiemannianMetric.sectionalCurvature_leviCivitaConnection_rescale_const` in place of "R1's constant-scaling law".
  - Contracts at `:272–338`, `:366–385` and `:437–459`.
- **R02 (P2, the R8.2 headline): repaired.**
  - `Suggested.lean:498–512` states `eq_harmonicSphereRestriction_of_laplaceBeltrami_eq_neg_mul` as proposed, and the docstring (`:42–44`) lists it.
  - README §R8.2 (`:3352`) names it, with three new Checks and the contract entries at `:503–509`.
- **R03 (P3, #1187 ordering): not repaired.** Carried over as R03 above.
- **R04 (P3, R7.7 verbless sentence): repaired.** `README.md:3199–3204` now reads "then Ric≥(n−1)α, so the criterion holds with λ=(n−1)α and Λ=β for 1≤p≤⌊n/2⌋, since then (p−1)β≤2(p−1)α≤(n−2)α<(n−1)α … Poincaré duality b_p=b_(n−p) covers the remaining interior degrees". This is correct: β<2α, and 2(p−1)≤n−2 exactly when p≤n/2.

## Verified sound

### Gate, dependency check, elaboration, signatures, padding

- **Gate.** `gate … --base origin/main` prints every counter 0 (`set_option=0 … statement-hygiene=0 … depcheck=0 … stray-files=0 … outside-folder=0 source-material=0`) and `OK`, with exit 0. The worker's run on this head also reports `build=0`. Nothing outside the folder changes.
- **Dependency check.** `gate --depcheck … --movable` prints `depcheck: 235 roadmaps, 2258 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- **Elaboration.** `lake env lean TauCetiRoadmap/RiemannianGeometry/Suggested.lean` exits 0 with 22 `declaration uses sorry` warnings and nothing else. The warnings are at lines 95, 112, 136, 147, 164, 206, 227, 244, 254, 265, 275, 306, 316, 328, 356, 389, 411, 442, 459, 484, 505 and 521.
- **Signatures.** I elaborated `#check @` for all 24 declarations (22 theorems, 2 definitions) in one scratch file, which exits 0. The signature tool's 25th entry, "instance `is`" at line 355, is the docstring word. Each type keeps the binders its README statement needs:
  - Synge, Bochner and Meyer: `[I.Boundaryless] [T2Space M] [CompactSpace M]`; `synge` also has `[ConnectedSpace M] [TauCeti.Orientable I M]`;
  - `guenther` and `bishopGromov`: `[IsRiemannianManifold I M] [ConnectedSpace M] [CompleteSpace M] [MeasurableSpace M] [BorelSpace M] [SecondCountableTopology M] [IsContinuousRiemannianBundle …]`;
  - `two_distinct_geodesics`: `[CompactSpace M] [ConnectedSpace M]` and `1 ≤ finrank`;
  - the new R8.2 theorem: `1 ≤ m`, `ContMDiff (𝓡 m) 𝓘(ℝ,ℝ) ∞ f`, `f ≠ 0`, with the global round-metric instances `instRiemannianBundleSphere` and `instIsContMDiffRiemannianBundleSphere` (`Sphere/Basic.lean:77, 82`) and `laplaceBeltrami` = `divergence ∘ mgradient` (`Laplacian.lean:238`).

  Nothing changed.
- **Padding.** I replaced every `sorry` with `first | rfl | infer_instance | (simp; done) | (intros; simp_all; done) | (constructor <;> simp; done) | trivial | (exact fun _ => rfl) | (left; rfl) | (right; rfl) | (intro _ _; exact Subsingleton.intro) | (exact ⟨0, by simp⟩) | (exact Or.inl rfl) | (exact Or.inr rfl) | decide`. The file then has exactly 22 errors, one per theorem body, and 0 `sorry`s. No declaration restates a definition or mirrors a Check.
- **Form.**
  - Imports: `public import Mathlib` plus 16 `TauCeti.*` modules, all present at the pin; the two new ones are `Riemannian.Laplacian` and `Analysis.MvPolynomial.Sphere`.
  - No `set_option`, `lemma` or sorry'd data.
  - One module docstring, `/-! ## Layer k -/` comments, and a docstring on every declaration.
  - The one exception is the line length in R04.

### Headline theorems

From the README:
- **Stated and statable:**
  - R2 initial data;
  - R3.3 loop-space homology;
  - R4.1 Rauch, Günther and Bishop–Gromov;
  - R4.4 Cartan–Hadamard;
  - R4.5 Bonnet–Myers distance and finite π₁;
  - R4.6 Synge, both parities;
  - R4.7 Killing–Hopf, three cases;
  - R4.8 two geodesics;
  - R4.9 three simple closed geodesics;
  - R5a.3 paraboloid crossings and vertex pole;
  - R7.6 Bochner b₁;
  - R7.7 positive Rop;
  - R7.8 distance duality;
  - R8.2 sphere eigenfunctions (new);
  - R8.3 irreducibility.
- **Named in the docstring as not statable:**
  - the Morse index theorem (R3) and its focal version (R6);
  - Gauss/Codazzi/Ricci and the volume variations (R5a, R5b);
  - general ℛ_p vanishing and parallelism (R7.6);
  - Takahashi (R8.4).

  At the pin, I found no index-form carrier, second fundamental form between manifolds, Weitzenböck ℛ_p or mean curvature into a sphere: there are no hits for `indexForm`, `secondFundamentalForm`, `shapeOperator`, `meanCurvature` or `weitzenb` under `TauCeti/Geometry`.
- **Named as Tau Ceti's:** the scalar Bochner identity, Lichnerowicz, Fischer, and the items listed in R01 of the previous review.

### Seeded sample, read in the cache

- **1.1 Curvature identities.**
  - `andrews-dg-ch16` line 105: Proposition 16.2.1, under the printed header "154" at line 104. Line 101 gives the slot convention `K(σ)=R(e₁,e₂,e₁,e₂)`.
  - `nicolaescu-lectures` line 8870: Example 4.2.36, λ=s/n, on printed p. 195.
  - `nicolaescu-lectures` line 8888: Exercise 4.2.38, dimension ≥3, under the header "196" at line 8887.
  - All new Tau Ceti citations resolve and say what the README says: `Bianchi.lean:83` (`cov.torsion = 0`), `:102`; `Metric.lean:111` (C² fibre metric); `SecondBianchi.lean:127`; `Coordinates.lean:149`; `Smoothness.lean:65`; `Derivative.lean:348`; `ContractedBianchi.lean:394`; `SecondCovariantDerivative.lean:76, 92`; `Isometry/LocallySymmetric.lean:85`.
- **1.2 Local symmetry.**
  - `nicolaescu-lectures` line 4604 (§3.3.2, p. 103) and line 4630 (equation (3.3.7)), continued under the header "104" at line 4641.
  - `Curvature/LocallySymmetric.lean:102, 169, 221`; `Isometry/LocallySymmetric.lean:140`; `Isometry/Restriction.lean:64`.
  - No parallel-transport characterization of `HasParallelCurvature` exists at the pin (`hasParallelCurvature_iff` at `:106` is pointwise and `…_iff_curvatureOperator` at `:113` is a product rule on vector fields; neither mentions transport), so the owned target stands.
- **1.3 Metric changes.**
  - `spacetime-guided-tour` lines 2919 and 2971–2976: Lemma 35, pp. 61–62. Its items are, in O'Neill's sign:
    - `R(V,X)Y=(H(f)(X,Y)/f)V`;
    - `R(V,W)U=R_F(V,W)U−(‖grad f‖²/f²)(g(V,U)W−g(W,U)V)`.

    Negating both gives the README's `:857–858`.
  - Lines 2953 and 2981–2983: Lemma 36. These are the README's three Ricci formulas with dim F=k.
  - Andrews: `andrews-dg-ch16` line 429, Corollary 16.8.5, under the header "162" at line 410.
  - `Scaling.lean:160, 275, 288, 298`; `LeviCivita/Prod.lean:82`; `Curvature/Prod.lean:124, 153, 176`; `LeviCivita/WarpedProd.lean:150`, whose formula matches `README.md:333–335`; `Isometry/LeviCivita.lean:130`.
  - O'Neill is under Not verifiable.
- **2.1 Jacobi fields.**
  - `Jacobi/Exponential.lean:155`: preconnected `s ⊆ geodesicInterval`, `0 ∈ s`, `X 0 = 0`, `D_tX(0)=w` give `X t = d(exp_p)_(tv)(tw)`.
  - `Gauss/Basic.lean:127`: `[I.Boundaryless] [T2Space M]` and `v ∈ expDomain`.
  - Neither proves existence from initial data, so `exists_jacobi_initial_data` stands. The only dimension result in `Jacobi/Space.lean` is `finrank_jacobiFieldSpace_le` (`:163`).
  - Milnor is under Not verifiable.
- **2.2 Normal-coordinate jets.**
  - `bishop-rg` lines 1885–1892: §6.11, the canonical frame by radial parallel translation, under the header "41" at line 1866.
  - `bishop-rg` line 1893: Problem 6.12.
  - `nicolaescu-lectures` line 6793 (Proposition 4.1.25) and line 6801 (Lemma 4.1.26), both on printed p. 151.
  - `brewin-rnc` line 363: the third-order metric expansion, on p. 9.
  - `brewin-rnc` lines 614–615: (11.1), on p. 15.
  - `Normal/Coordinates.lean:84, 270, 292` match the README.
- **2.3 Euclidean limits.**
  - `bishop-rg` line 1872: Theorem 6.11, p. 41, `g_ij=δ_ij−⅓ΣR_ihjk x^h x^k`.
  - The cited scaling theorem, with c=λ_j², gives the λ_j⁻² factor.

### Other library declarations opened at the pins

- **Tau Ceti `2fd255d9`, under `TauCeti/Geometry/Manifold/`:**
  - `Riemannian/`:
    - `Sphere/Basic.lean:61, 77, 82`; `Sphere/Curvature.lean:202, 209`; `Sphere/Radius.lean:104`; `Sphere/Stereographic.lean:98` (R01);
    - `Hyperbolic/UpperHalfSpace/Curvature.lean:139`; `Hyperbolic/UpperHalfSpace/Basic.lean:488`;
    - `Isometry/Sphere/Classification.lean:93, 163`; `Isometry/Euclidean.lean:123, 145`; `Isometry/UpperHalfSpace.lean:397`; `Isometry/Ext.lean:112`; `Isometry/Local.lean:70–197`; `Isometry/Curvature.lean:141`;
    - `Laplacian.lean:238`; `FirstVariation.lean:212, 288` (smooth variations only, so R3's corner formula stands); `Killing.lean:214, 365`; `Examples/OpenUnitBall.lean`, which is the incomplete real interval, not the Poincaré ball, so R4.7's ball metric target stands.
  - `VectorBundle/CovariantDerivative/LeviCivita/Immersion.lean:65` (R01).
- **Tau Ceti outside `Geometry/Manifold`:** `TauCeti/Analysis/MvPolynomial/Sphere.lean:115`.
- **Mathlib `1b1ccf4b`:** `ContinuousMap.subalgebra_topologicalClosure_eq_top_of_separatesPoints` (`Topology/ContinuousMap/StoneWeierstrass.lean:264`).
- **Absent at the pin:** a covering theorem for local Riemannian isometries (no `IsCoveringMap` under `Riemannian/`), cut locus, injectivity radius, warped-product curvature and great-circle geodesics. These owned targets stand.

### Citations and ownership

- **Resolver.** `roadmaps resolve` found no unresolved citation or Lean name. Every backticked Tau Ceti name added in this round resolves at the file given.
- **Overlap tool.** It reports:
  - no id that an open pull request drops;
  - no id that only an open revision defines;
  - no dropped id cited elsewhere;
  - one conflicting pull request, #1187 (R03).
- **Search of the open heads.** `roadmaps grep` over the open heads and main finds no other owner of warped-product curvature, the sphere-eigenfunction theorem or any headline declaration name. PositiveMass §1.2 (#956) and QuantumFoundations §9.3 (#1771) consume "RiemannianGeometry R8.1–R8.2" and own none of it. PositiveMass's `j(j+n−2)` on `S^(n−1)` agrees with d(d+m−1) at m=n−1.
- **Fully qualified names.** No `Suggested.lean` declaration reuses a fully qualified name from a roadmap I can read.

### Adversarial table

| Statement | Instances | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §1.1 item 4, `24r=B_Q(x,w;y,z)−B_Q(y,w;x,z)` | 3 random Kulkarni–Nomizu tensors on ℝ⁴; K=1 orthonormal pair; skew ω | 12.688764=12.688764, 1.808274=1.808274, 4.446743=4.446743, Bianchi residual <1e−12; K=1: 16−(−8)=24=24·1; ω: 8−(−8)=16≠24 | true; Bianchi needed | none |
| §1.1 item 2 low dimensions | n=0, 1 | no two-plane; every κ satisfies both sides | consistent with Tau Ceti | none |
| §1.2 Checks | `dx²+e^(2x²)dy²` at x=1; unit and radius-2 S³ | K=−2−4x², ∂ₓK(1)=−8; Einstein a=2 and a=1/2 on the disjoint union | true; connectedness needed | none |
| R1.3 warped curvature `R(V,X)Y`, `R(V,W)U` | dx²+e^(2x)dy²; (0,π)×_(sin)S² at t=π/3 | −f″/f=−1; vertical K=4/3−1/3=1, mixed K=sin t/sin t=1 | true, signs agree with BL Lemma 35 negated | none |
| R1.3 warped Ricci | S³=(0,π)×_(sin)S²; ℝ³∖0=(0,∞)×_r S²; k=0 | vertical Ric=2=k (Δ⁺ gives 0); Euclidean vertical (k−1)−(k−1)=0; horizontal Ric(∂t,∂t)=k=2; k=0 reduces to M | true; Δ sign unpinned by Checks | R02 |
| R1.3 conformal and Lie | flat n=2, u=−log y; bi-invariant metric | Scal̃=y²·2·(−1/y²)=−2=2K; Andrews' +¼c c is −¼[[X,Y],Z] in README sign | true | none |
| R1.3 O'Neill | Hopf S³→CP¹ | \|A_XY\|=1, K_B=1+3=4 | true | none |
| `exists_jacobi_initial_data` | flat; unit great circle; a=b | u+tv residual 0; −sin t E+sin t E=0; `Icc a a` excluded by `hab` | true | none |
| §2.1 Tau Ceti identification | flat ℝⁿ | d exp_(tv)(tw)=tw = J(t) with J(0)=0, J′(0)=w | true | none |
| §2.2 frame Checks | unit S², t=π/2; octant triangle; basis (2e₁,…) | at t=π/2, \|d exp_(tT)(Y)\|=sin t/t=0.636620 vs transported norm 1; holonomy π/2 = area π/2; norm 2 vs 1 | true | none |
| §2.2 jets | unit S², e⊥v | ⟨R(e,v)v,e⟩=\|v\|²; sin²t=t²−t⁴/3+…; Brewin and Bishop coefficient −⅓ | true | none |
| §2.3 R1.5 | unit S², λ=10, ρ=1 | sin²(0.1)/0.01=0.996671 vs 1−1/300=0.996667; K(g_j)=1/λ²=0.01 | true | none |
| `rauch_norm_ge_of_sectional_le` | radius 5/2 vs κ=1 at t=π/2 and 5π/2 | 1≤1.469463; at 5π/2, 1≤0 fails, excluded by `hmodel` | true | none |
| `guenther` | unit S², κ=1, r=1 | 2·(1−cos 1)·π=2.888366 both sides | true | none |
| `bishopGromov` | unit S², κ=0 and 1; ℍ², κ=0 | vol/V₀=5.776732, 4.448956, 2.546479 at r=1, 2, π (nonincreasing); vol/V₁=6.283185 constant; ℍ²: 6.824553→8.677694, excluded (Ric=−g) | true | none |
| `cartanHadamard_isCoveringMap` | flat T²; S² | ℝ²→T² covering; S² has K=1>0, excluded | true | none |
| `bonnetMyers_distance`, `myers_finite_fundamentalGroup` | unit Sⁿ, λ=n−1; RP³ | π√1=π=diam; π₁=ℤ/2 finite | true | none |
| `synge`, `synge_orientable_of_odd` | RP², RP³, flat T² | RP² excluded by orientability; RP³ orientable, π₁=ℤ/2; T² excluded by K=0 | true | none |
| `singularHomology_loopSpace_sphere` | n=2, 3, 1 | n=2: 1∣i, ℤ in every degree; n=3: ℤ at i=0,2,4, 0 at odd i; n=1 excluded (H₀ free of infinite rank) | true | none |
| Killing–Hopf (three cases) | n=0, 1, 2 | point=point; line=line, (0,∞) with dt²/t² ≅ ℝ by log; S² needs n≥2 | true | none |
| `two_distinct_geodesics` | unit circle, p=1, q=i; ℝ | e^(iπ/4)≠e^(−3iπ/4) at t=1/2; ℝ has one geodesic, excluded by compactness | true | none |
| `three_simple_closed_geodesics` | round S² | three great circles, T=2π, injective on [0,2π) | true | none |
| `paraboloid_geodesic_crossings` | a=1, a=1/2 (recomputed by quadrature) | a=1: R₀=2.275594, t₀=6.467619≥R₀²−1=4.17833, A=π≥2 log R₀=1.644483, R₁=10.289815, r″(0)=0.2. a=1/2: R₀=3.763459, t₀=15.343929, R₁=86.321884, r″(0)=1 | true | none |
| `paraboloid_vertex_pole` | radial Jacobi vs round K=4 | r(ℓ)>0 for all ℓ>0; round zero at ℓ=π/2 | true | none |
| `subsingleton_deRhamCohomology_one_of_ricciTensor_pos` | S², flat S¹, S²∖{2 pts} | H¹=0; Ric=0, b₁=1, excluded; noncompact b₁=1, excluded | true | none |
| `subsingleton_deRhamCohomology_of_curvatureEndomorphism_pos` | S³; S²×S²; S² at p=2 | Rop=Id gives H¹=H²=0; mixed kernel, b₂=2, excluded; p<n excludes H²(S²)=ℝ | true | none |
| `riemannianDist_eq_sSup_smooth` | ℝ²∖{0}, (−1,0) to (1,0) | intrinsic distance 2, not attained; supremum 2 via smoothed clamps of x₁ | true without completeness | none |
| `eq_harmonicSphereRestriction_of_laplaceBeltrami_eq_neg_mul` (new) | m=1 (cos θ, cos 3θ); m=2 (X₃, X₁X₂, X₁²); m=0; f=0 | λ=1=1·1, 9=3·3; 2=1·2, 6=2·3; X₁² mixes 6 and 0, not an eigenfunction; m=0: (1,2) on S⁰ has λ=0 but is in neither H₀ nor H₁, excluded by `hm`; f=0 allows any λ, excluded by `hf0`; with Δ⁺ X₃ would give λ=−2 | true | none |
| `harmonic_irreducible` | N=2, 3; d=2 | N=2: two invariant lines (x₁±ix₂)^d, excluded; N=3, d=2: dim 5, irreducible | true | none |
| R7.7 repaired sentence | n=5, p=2; unit Sⁿ | (p−1)β≤2α≤3α<4α; p(n−p) both sides | true | none |
| R01 stereographic | x=0; y=2x | 4=4; 4(4/(4\|x\|²+4))²=4/(1+\|x\|²)² | duplicate of Tau Ceti | R01 |
| R01 Gauss formula | Sⁿ⊂ℝⁿ⁺¹ | Tau Ceti `Sphere/Curvature.lean` derives ∇_(X_a)X_b=−⟨b,p⟩X_a from it | duplicate of Tau Ceti | R01 |

## Not verifiable

- **O'Neill (1966), §1.3; Milnor, *Morse Theory*, §2.1 and R6.** Both are settled as uncertified and cited by locator. I checked O'Neill's `K_B=K+¾|[X,Y]^v|²` and Milnor's sign dictionary by computation (table), not against the text.
- **Lee and Fulton–Harris.** Settled as uncertified; outside the sample.
- **Works outside the manifest and the cache.** These are not recorded in the package's `sources.toml`: Homma, Azagra–Ferrera–López-Mesas–Rangel, Axler–Bourdon–Ramey, Toth–Ziller, Wang, and the R4.9 curve-shortening papers. All are outside the seeded sample, and none of their locators is flagged unverified.
- **Ownership against ManifoldOptimization (#1506).** Not checked: the brief gives no checkout for it.

## Source issues

- none
