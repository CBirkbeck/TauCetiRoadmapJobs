# Review of RiemannianGeometry (pull request #1683 at f4a3ff8)

**Verdict:** needs changes

This is a full review of `TauCetiRoadmap/RiemannianGeometry/README.md` and `TauCetiRoadmap/RiemannianGeometry/Suggested.lean` at `f4a3ff8`. The pins are unchanged: Tau Ceti `2fd255d9` and Mathlib `1b1ccf4b`.

- The gate passes, and the dependency check reports 0 problems.
- `Suggested.lean` elaborates with exactly 22 `sorry` warnings.
- Of the previous review's four P3 findings, three are repaired. The #1187 ordering in the description is not.
- This review finds one P2 and two P3. All three concern passages earlier rounds did not flag. Two of them sit in text this pull request rewrote.

## R01 (P2) — R5b takes its form theory from two roadmaps that are not on main

**Location.** `README.md:632–636`: "Consume UnboundedOperators §4.7 (UO-D06) for the single generic closed semibounded-form representation … The abstract order is UnboundedOperators §4.7 → VariationalMethods §2.3 and §§5.1–5.2 → R5b."

The same supplier edge appears at:
- `:42–45` (scope);
- `:626–627` (contract);
- `:2932–2934` (R5b);
- `:2979–2980` (Dependencies);
- `:3621` (Downstream).

**Claim.** RiemannianGeometry is on main, so it may consume only Mathlib, Tau Ceti and roadmaps on main. R5b's Dirichlet realization of the normal Jacobi operator takes two inputs from roadmaps that exist only in open pull requests:
- the closed-form representation, from UnboundedOperators;
- the energy-space and compact-pair specializations, from VariationalMethods.

This is an upward supply. The dependency check reports 0 problems only because neither name is in the merge order or on main, so it has no edge to classify. That is a false negative.

This pull request writes these edges itself:
- it adds the scope sentence at `:42–45` and the dependency sentence at `:2979–2980`;
- it rewrites the contract at `:626–637`, replacing main's links into the two branches with bare section numbers.

**Witness.**
- Main has no `TauCetiRoadmap/VariationalMethods/` and no `TauCetiRoadmap/OperatorTheory/UnboundedOperators/`.
- §4.7 exists only at #1027's head (`OperatorTheory/UnboundedOperators/README.md:703`).
- §§2.3 and 5.1 exist only at #1028's head (`VariationalMethods/README.md:494, 839`).
- Neither roadmap appears in the merge order.

**Repair.** Move the notion down into R5b, which already constructs the Dirichlet realization, compact resolvent and eigenvalue statements itself (`:2934–2939`).
1. State as an owned R5b target the representation it actually uses: for the symmetric form a on W^(1,2)_0(D;ν) with `a(u,u)+c‖u‖²_(L²)≥α‖u‖²_(W^(1,2))`, define the self-adjoint operator A with domain {u : v↦a(u,v) is L²-bounded}. Build it from Mathlib's Lax–Milgram `IsCoercive.continuousLinearEquivOfBilin` (`Mathlib/Analysis/InnerProductSpace/LaxMilgram.lean:105`) applied to the shifted form. `(A+c)⁻¹` is compact by the compact embedding.
2. Delete the supplier names at `:626–637`, `:2932–2934`, `:2979–2980` and `:3621`.
3. The scope sentence at `:42–45` may keep naming those roadmaps as owners of the general theory, provided R5b no longer consumes it.

Tested on the README's own instance (`:2983`): for a(u,v)=2uv on ℝ, Lax–Milgram's equivalence is u↦2u. So the represented operator is 2·Id and the forcing solution is h/2, as stated there.

## R02 (P3) — Three more pinned Tau Ceti results are still planned as owned targets

**Location.**
- `README.md:1168–1170` (R2): "for C^(k+1) curves and section lifts on a `UniqueDiffOn` parameter set, prove the lift of D_tX is C^k with its fixed-chart formula near every point". `:572` repeats this regularity claim in the HopfRinow contract.
- `:1381–1382` (R3): "prove mixed covariant derivatives commute up to curvature".
- `:2990–2995` (R6): "R6 owns the normal exponential, its natural-domain openness and smoothness".

**Claim.** All three exist at the pin and are cited nowhere in the README. For the third, GeometricTopology on main already records Tau Ceti's Riemannian normal-exponential theorems as pinned (`TauCetiRoadmap/GeometricTopology/README.md:981–985`). So R6's ownership claim conflicts with both the library and its supplier.

**Witness** (paths under `TauCeti/Geometry/Manifold/`):
- **R2.** `VectorBundle/CovariantDerivative/AlongCurve/Regularity.lean:132`, `CovariantDerivative.contMDiffOn_alongCurveWithin`: a C^(n+1) section lift on a `UniqueDiffOn` set has a C^n covariant-derivative lift. `:56` gives the chart formula.
- **R3.** `Curvature/Surface.lean:155`: D_qD_rW−D_rD_qW = R(∂_qf,∂_rf)W.
- **R6.** `TubularNeighborhood/Riemannian/Basic.lean:58, 113` and `Regularity.lean:47, 63`: the domain, the map, openness and smoothness.

**Repair.**
1. Add to the Tau Ceti contract, in their files:
   - `CovariantDerivative.contMDiffOn_alongCurveWithin` and `CovariantDerivative.eventuallyEq_sectionCoord_alongCurveWithin` (`AlongCurve/Regularity.lean`);
   - `CovariantDerivative.alongCurve_alongCurve_sub_alongCurve_alongCurve` (`Curvature/Surface.lean`), for a C² field on a parametrized surface and any smooth connection on TM;
   - `TauCeti.SmoothEmbedding.normalExpDomain` and `TauCeti.SmoothEmbedding.normalExp` (`TubularNeighborhood/Riemannian/Basic.lean`);
   - `TauCeti.SmoothEmbedding.isOpen_normalExpDomain` and `TauCeti.SmoothEmbedding.contMDiffOn_normalExp` (`Riemannian/Regularity.lean`);
   - `TauCeti.SmoothEmbedding.mfderiv_normalExp_zeroSection_apply` (`Riemannian/Differential.lean`).
2. **R2.** Consume the regularity; keep only the reparametrization extension, and fix `:572` to match.
3. **R3.** Consume the commutator. Own only its one-sided form at the endpoints a, b, which the second variation on [a,b] needs because the pinned theorem is two-sided.
4. **R6.** Say that for embeddings the normal exponential, its domain, openness and smoothness are Tau Ceti's. R6 owns the immersion case through R5a's pullback normal bundle and its comparison with the embedding case.

Tested on the instances that refute "owned":
- **R3.** On the unit S² with f(q,r)=(sin r cos q, sin r sin q, cos r) and W=∂_rf, D_qD_rW−D_rD_qW = 0−(−sin r e_θ) = sin r e_θ. That equals R(∂_qf,∂_rf)∂_rf for K=1 in the README's sign.
- **R6.** In the flat plane Tau Ceti's `normalExp` is exp_(f p)(v) = f(p)+v, R6's own Check at `:3035`.

## R03 (P3) — The description still does not order this pull request against #1187

This carries over the previous review's R03 (originally R08 four rounds earlier). No repair report marks it as not actionable.

**Location.** The pull-request description. It names #1327 and #1974 but not #1187. It still describes a `ParaboloidTargets.lean` "with exactly three admission warnings" and Mathlib pins `6b7abb3c…`/`f6090c70…`.

**Claim.** The overlap tool, rerun against the 2026-11-09T15:27Z index, still lists `TauCetiRoadmap/RiemannianGeometry/Suggested.lean` among the files where #1187 ("chore: bump TauCeti to ab00ba392") and this head conflict. Nothing says which pull request is rebased on the other. The folder has no `ParaboloidTargets.lean`, and the Mathlib pin is `1b1ccf4b`.

**Witness.**
- `roadmaps overlaps RiemannianGeometry`: "#1187 and #1683 conflict in … `TauCetiRoadmap/RiemannianGeometry/Suggested.lean`".
- `git merge-base --is-ancestor ab00ba392 2fd255d9` succeeds in the pinned Tau Ceti checkout.

**Repair.**
1. Add one sentence: this pull request does not wait for #1187. #1187's Tau Ceti pin `ab00ba392` is an ancestor of this head's pin `2fd255d9`, so its change to this folder is superseded.
2. Delete the `ParaboloidTargets.lean` and stale-pin sentences.

## Previous findings

- **R01 (P3: Gauss formula and stereographic metric restated): repaired.**
  - The contract at `README.md:473–489` now states `CovariantDerivative.IsLeviCivitaConnection.inner_apply_eq_inner_mvfderiv` and `TauCeti.inner_mfderiv_stereographic'_symm` with their hypotheses and the dictionary x=y/2.
  - R4.7 (`:2071–2078`) consumes the Gauss formula and derives the great circles from it.
  - R5a (`:2584–2588`) consumes the flat-ambient case and keeps the Riemannian ambient.
  - R5a.2 (`:2756–2770`) cites the stereographic metric with the Jacobian factor 2², and `TauCeti.hasConstantSectionalCurvature_sphere`.
  - R4.9.6a (`:2354`) now cites the stereographic metric, `leviCivitaConnection_rescale_apply` and `scalarCurvature_rescale_of_finrank_eq_two`.
  - I opened every new declaration at the pin; each says what the README says (list below).
- **R02 (P3: sign of Δf in warped Ricci): repaired.** `README.md:923–927` adds "f⁻¹Δf=f″/f=−1 … `Ric(V,V)=(k−1)/sin²t−(−1+(k−1)cot²t)=k` … Reading Δ as Δ⁺ … `Ric(V,V)=k−2`". Recomputed: 2.0 and 0.0 at k=2, t=π/3.
- **R03 (P3: #1187 ordering): not repaired.** Carried over as R03 above.
- **R04 (P3: References locators and a long Lean line): repaired in both files.**
  - `README.md:3673–3676` adds Nicolaescu "Lemma 4.1.26, p. 151 … used by R1.4".
  - `:3711–3713` adds Barzen–Leymann "Lemma 35, pp. 61–62, and Lemma 36, p. 62 … used by R1.3".
  - `awk 'length>100'` on `Suggested.lean` prints nothing; the docstring at `:57–65` is rewrapped, longest line 95.
  - The manifest update was assigned to the worker and is still pending: `sources.toml` keeps `locator = "Theorem 9 (Killing–Hopf), p. 60"` and omits Lemma 4.1.26. This is not a finding against the folder.

## Verified sound

### Gate, dependency check, elaboration, signatures, padding

- **Gate.** `gate … --base origin/main` prints every counter 0 (`set_option=0 … statement-hygiene=0 … depcheck=0 … stray-files=0 … outside-folder=0 source-material=0`) and `OK`, exit 0. The worker's run on this head also reports `build=0`. Nothing outside the folder changes.
- **Dependency check.** `gate --depcheck … --movable` prints `depcheck: 235 roadmaps, 2259 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. R01 explains why this misses the two unmerged suppliers.
- **Elaboration.** `lake env lean TauCetiRoadmap/RiemannianGeometry/Suggested.lean` exits 0 in 26 s with 22 `declaration uses sorry` warnings and nothing else. The warnings are at lines 99, 116, 140, 151, 168, 210, 231, 248, 258, 269, 279, 310, 320, 332, 360, 393, 415, 446, 463, 488, 509 and 525.
- **Signatures.** One scratch copy carried `#check @` for all 24 declarations (22 theorems, 2 definitions). Every elaborated type keeps the binders its README statement needs:
  - `[I.Boundaryless]` throughout;
  - `[ConnectedSpace M] [CompactSpace M] [TauCeti.Orientable I M]` on `synge`;
  - `[IsRiemannianManifold I M] [ConnectedSpace M] [CompleteSpace M] [MeasurableSpace M] [BorelSpace M] [SecondCountableTopology M] [IsContinuousRiemannianBundle …]` on `guenther` and `bishopGromov`;
  - `[SecondCountableTopology M] [ConnectedSpace M]` on `riemannianDist_eq_sSup_smooth`;
  - `1 ≤ m` and `f ≠ 0` on the R8.2 theorem.

  Tangent-space norms are the Riemannian ones: Mathlib gives `TangentSpace` no norm, and the fibre norm comes from `RiemannianBundle` (`Mathlib/Topology/VectorBundle/Riemannian.lean:420–431`, scoped in `Bundle`, which the file opens). Nothing changed.
- **Padding.** In the same copy I replaced every `sorry` with `first | rfl | infer_instance | (simp; done) | (intros; simp_all; done) | (constructor <;> simp; done) | trivial | (exact fun _ => rfl) | (left; rfl) | (right; rfl) | (exact Or.inl rfl) | (exact Or.inr rfl) | decide | (exact ⟨0, by simp⟩) | (intro _ _; exact Subsingleton.intro) | positivity`. Exactly 22 errors resulted, one per theorem body, with 0 `sorry`s. No declaration restates a definition or mirrors a Check.
- **Form.**
  - Imports: `public import Mathlib` plus 16 `TauCeti.*` modules, all present at the pin.
  - No `set_option`, `lemma`, sorry'd data, `#eval` or process words. The README's only "removed" is "two points removed".
  - One module docstring, `/-! ## Layer k -/` comments, and a docstring on every declaration.
  - Every README layer ends with `### Examples` and `### Dependencies`. `modelBallVolume` has 4 Checks and `paraboloidGraph` has 3.

### Headline theorems

- **Stated:**
  - R2 initial data;
  - R3.3 loop-space homology;
  - R4.1 Rauch, Günther and Bishop–Gromov;
  - R4.4 Cartan–Hadamard;
  - R4.5 the Bonnet–Myers distance bound and finite π₁;
  - R4.6 Synge in both parities;
  - R4.7 Killing–Hopf, three cases;
  - R4.8 two geodesics;
  - R4.9 three simple closed geodesics;
  - R5a.3 paraboloid crossings and the vertex pole;
  - R7.6 Bochner b₁;
  - R7.7 positive curvature operator;
  - R7.8 distance duality;
  - R8.2 sphere eigenfunctions;
  - R8.3 irreducibility.
- **Named in the docstring as not statable:**
  - the Morse index theorem (R3) and its focal form (R6), which need an index form on piecewise C¹ sections;
  - Gauss/Codazzi/Ricci and the volume variations (R5a, R5b);
  - general ℛ_p (R7.6);
  - Takahashi (R8.4).

  At the pin I found no `indexForm`, `secondVariation`, no Gauss equation between manifolds, no `meanCurvature` and no Weitzenböck ℛ_p. Tau Ceti's `secondFundamentalForm` is for one parametrization of a vector space, not an immersion between manifolds, so these remain not statable.

### Seeded sample, read in the cache

- **1.1 Curvature identities.**
  - Andrews: `andrews-dg-ch16` line 105, Proposition 16.2.1, under the printed header "154" at line 104. The slot convention `K(σ)=R(e1,e2,e1,e2)` is at line 101.
  - Nicolaescu: `nicolaescu-lectures` line 8870, Example 4.2.36 (λ=s/n), on p. 195; line 8888, Exercise 4.2.38 (dimension ≥3), under the header "196" at line 8887.
- **1.2 Local symmetry.** `nicolaescu-lectures` line 4604 (§3.3.2) and line 4630 (equation (3.3.7)), p. 103, continued under the header "104" at line 4641.
- **1.3 Metric changes.**
  - `spacetime-guided-tour` line 2919: Lemma 35 under "=== page 61". Its items are at lines 2971–2976, under "62": `R(V,W)U=R_F(V,W)U−(‖grad f‖²/f²)(g(V,U)W−g(W,U)V)` and `R(V,X)Y=(H(f)(X,Y)/f)V`. Negating both gives `README.md:908–909`.
  - Line 2953: Lemma 36. Its items at lines 2981–2983 are the README's three Ricci formulas with dim F=k and Δ=div grad.
  - `andrews-dg-ch16` line 429: Corollary 16.8.5, under "162" at line 410. His `R_ijij=¼c_ijp c_ijp=¼|[e_i,e_j]|²` equals `⟨R(X,Y)Y,X⟩=⟨−¼[[X,Y],Y],X⟩` here.
- **2.1 Jacobi fields.**
  - `Jacobi/Exponential.lean:155`: preconnected s ⊆ `geodesicInterval`, 0∈s, X 0=0 and D_tX(0)=w give `X t = d(exp_p)_(tv)(tw)`.
  - `Jacobi/Uniqueness.lean:161`, `Jacobi/Basic.lean:246`, `Jacobi/Space.lean:163`, `Jacobi/Convexity.lean:176`, `Jacobi/Model.lean:62`.
  - `Geodesic/Smoothness.lean:252`; `Geodesic/Gauss/Basic.lean:127` (`[I.Boundaryless] [T2Space M]`, v∈`expDomain`).
  - None proves existence, so `exists_jacobi_initial_data` stands.
- **2.2 Normal-coordinate jets.**
  - `bishop-rg` lines 1885–1892: §6.11 on p. 41 (header line 1866) defines the canonical frame by radial parallel translation. Line 1893 is Problem 6.12; its connection forms at line 1904 are linear in x, so they vanish at p, as the README says.
  - `nicolaescu-lectures` lines 6793 and 6801: Proposition 4.1.25 and Lemma 4.1.26 under "4.1. METRIC PROPERTIES 151" at line 6769.
  - `brewin-rnc` line 363: `gab(x)=gab−⅓x^cx^dR_acbd−⅙x^cx^dx^e∂_cR_adbe`, under "=== page 9". Line 615 is (11.1), on page 15.
- **2.3 Euclidean limits.** `bishop-rg` line 1872: Theorem 6.11 on p. 41, `gij=δij−⅓ΣR_ihjk x^h x^k`. With c=λ_j², the cited scaling theorem gives the λ_j⁻² factor.

### Library declarations opened at the pins

- **Tau Ceti `2fd255d9`, new this round, each matching the README's description:**
  - `LeviCivita/Immersion.lean:65`: C² at x, C¹ metric, differential preserving inner products at every point;
  - `Sphere/Basic.lean:97`;
  - `Sphere/Stereographic.lean:98`: `(4/(‖y‖²+4))²`;
  - `Curvature/Conformal.lean:534`: `(f x)⁻¹(Scal−2Δφ)`;
  - `LeviCivita/Conformal.lean:260`: `(2f)⁻¹(df(v)Y+df(Y)v−g(Y,v)grad f)`;
  - `Analysis/InnerProductSpace/SecondFundamentalForm.lean:82, 107, 119`;
  - `ShapeOperator.lean:90, 100, 167, 183, 218`;
  - `SquaredDistance.lean:70, 104`;
  - `Riemannian/Induced.lean:91`.
- **Tau Ceti, opened for R02:**
  - `AlongCurve/Regularity.lean:56, 90, 132`;
  - `Curvature/Surface.lean:155`;
  - `TubularNeighborhood/Riemannian/Basic.lean:58, 113`, `Regularity.lean:47, 63`, `Differential.lean:48`.
- **Tau Ceti, checked and absent (these owned targets stand):**
  - warped-product curvature: `Riemannian/WarpedProd.lean` and `LeviCivita/WarpedProd.lean` stop at the metric and connection;
  - great-circle geodesics;
  - a Riemannian submersion carrier;
  - the injectivity radius and cut locus;
  - a null-set→volume transfer;
  - a first variation with corners: `FirstVariation.lean` is for C² families;
  - the Killing local-flow characterization: `Killing.lean:139` is the infinitesimal one;
  - the hyperboloid and Poincaré ball models;
  - the semidirect product E(n): `Isometry/Euclidean.lean` gives the affine and isotropy groups only;
  - a Friedrichs extension.
- **Mathlib `1b1ccf4b`:**
  - `Geometry/Manifold/Instances/Sphere.lean:90, 336`: `stereoToFun`'s factor `2/(1−⟨v,x⟩)` confirms y=2x;
  - `Analysis/InnerProductSpace/LaxMilgram.lean:105`.
- **Name sweep.** A script grepped all 197 backticked identifier-like tokens of the README at the pins. 167 library names resolve. The other 30 are this roadmap's own `Suggested.lean` names or notation (`T_pM`, `u_i`, `C_glue`).

### Citations and ownership

- **Resolver and overlap tool.** `roadmaps resolve` found nothing unresolved. The overlap tool lists ComplexKahlerGeometry's `#k7-projective-torus-and-hopf-examples` as dropped by #1807, #1808 and #1854. That anchor is cited only by main's copy of this README (line 300), not by this head. All three revisions map "`K7.1` → 7.1", so this head's "ComplexKahlerGeometry K7.1" stays valid.
- **Suppliers on main.** I checked each named supplier on main:
  - HopfRinow and ConformalMapping (Completed);
  - SBC B5.0–B6.0 (`SmoothBundlesConnections/README.md:1072–1306`);
  - AT8.11a `finiteSourceMappingCWType`/`basedLoopCWType`;
  - CC C2.0 `bundleDiskSphereRelCW`/`bundleDiskAttachmentCWModel`;
  - Yamabe Y9 (`:308`);
  - PDO P1.0 (`:164`) and P7a (`:1933`);
  - OT Layer 7 (`:901`);
  - G4 (`:936`);
  - K5a and K7.

  Every other named supplier is on main except VariationalMethods and UnboundedOperators (R01).
- **Ownership.** `roadmaps grep` for Bishop–Gromov, Günther, Cartan–Hadamard, Killing–Hopf, Synge, warped product, normal exponential and Rauch finds no second owner. RicciFlow (#1023), TeichmullerGeometry (#1169) and PositiveMass (#956) consume this roadmap's sections. CalibratedGeometry (#946) cites Tau Ceti's `normalExp`, which supports R02.
- **Fully qualified names.** The Surfaces sub-roadmap uses `TauCetiRoadmap.RiemannianGeometry.Surfaces`, so no fully qualified name collides.

### Adversarial table

| Statement | Instances | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §1.1 item 2, constant curvature ⇔ `R(X,Y)Z=κ(⟨Z,Y⟩X−⟨Z,X⟩Y)` | orthonormal X,Y; n=0,1 | ⟨R(X,Y)Y,X⟩=κ(1·1−0)=κ; for n≤1 there is no two-plane and both sides hold for every κ | true (Tau Ceti) | none |
| §1.1 item 4, `24r=B_Q(x,w;y,z)−B_Q(y,w;x,z)` | K=1 orthonormal pair, z=y, w=x | B_Q(x,x;y,y)=16; B_Q(y,x;x,y)=0−4−4+0=−8; 16+8=24=24K | true | none |
| §1.2 Checks | dx²+e^(2x²)dy² at x=1; unit and radius-2 S³ | K=−(2+4x²), ∂ₓK(1)=−8≠0; Ric=2g and ½g on a disjoint union | true; connectedness needed | none |
| R1.3 warped `R(V,X)Y`, `R(V,W)U` | dx²+e^(2x)dy²; (0,π)×_sin S² at t=π/3 | −f″/f=−1; vertical K=1/sin²t−cot²t=1; mixed −(−sin t)/sin t=1 | true; BL Lemma 35 negated | none |
| R1.3 warped Ric (new Check) | k=2, t=π/3 | Δ: 4/3−(−1+1/3)=2.0=k; Δ⁺: 4/3−(1+1/3)=0.0=k−2 | true; sign pinned | none |
| R1.3 Euclidean warped Check | ℝ³∖0=(0,∞)×_r S² | (k−1)g_N−(k−1)r⁻²·r²g_N=0 | true | none |
| R1.3 T-tensor Checks | dx²+e^(2x)dy²; dx²+e^(4x)dy² | Γˣ_yy=−e^(2x) ⇒ T_UU=−∂x, norm 1; Γˣ_yy=−2e^(4x) ⇒ −2∂x, norm 2 | true | none |
| R1.3 Andrews Cor 16.8.5 sign | ad-invariant metric | ⟨−¼[[X,Y],Y],X⟩=¼\|[X,Y]\|²=Andrews ¼c_ijp c_ijp | true | none |
| R1.3 O'Neill Hopf | S³→CP¹ | \|A_XY\|=½\|v[X,Y]\|=1; K_B=1+3=4 | true | none |
| R4.9.6a conformal surface law (new citation) | g₀=4(1+r²)⁻²(dx²+dy²), r=0.3 | Scal=e^(−2u)(0−2Δu) ⇒ K dA=−Δu dxdy: 3.36672 = 3.36672 | true | none |
| R5a.2 stereographic dictionary (new) | x=0; x=0.7 | 2²(4/(4x²+4))²: 4 vs 4/(1+0)²=4; 1.801721 vs 4/1.49²=1.801721 | true | none |
| R4.7 great circle (new) | γ=cos t·p+sin t·v | γ″=−γ is normal, so the tangential part is 0 | true | none |
| R6 Hessian and kernel (new citations) | unit circle, inward ν, t=½,1,2 | S_ν=1; Hess 2(1−t)=1,0,−2; at t=1 the kernel is the 1-eigenspace, dim 1 | true | none |
| `exists_jacobi_initial_data` | flat; unit great circle; a=b | u+tv: D²=0; sin t E: −sin t E+sin t E=0; `Icc a a` excluded by `hab` | true | none |
| §2.1 d exp identification | flat ℝⁿ | d exp_(tv)(tw)=tw=J(t), J(0)=0, J′(0)=w | true | none |
| §2.2 transported vs coordinate frame | unit S², t=π/2 | \|E_Y\|=1 vs \|d exp_(tT)Y\|=sin t/t=0.636620 | true; distinct away from p | none |
| §2.2 jets (Brewin, Bishop) | unit S², e⊥v | ⟨R(e,v)v,e⟩=\|v\|²; sin²t/t²=1−t²/3+…, coefficient −⅓ in both | true | none |
| §2.3 R1.5 | unit S², λ=10, ρ=1 | sin²(0.1)/0.01=0.996671 vs 1−1/300=0.996667; K(g_j)=λ⁻²=0.01 | true | none |
| `rauch_norm_ge_of_sectional_le` | radius 5/2 vs κ=1; κ<0 tangential J | t=π/2: 1≤1.469463; t=5π/2: 1≤0 fails, excluded by b<π/√κ; tangential J has t\|a\|<sinh t·\|a\| (κ=−1), so `hnormal` is needed | true | none |
| `guenther` | unit S², κ=1, r=1; n=1 | 2·(1−cos 1)·π=2.888366=2π(1−cos 1); n=1: 1·r·2=2r | true | none |
| `bishopGromov` | unit S² with κ=0 at r=1,2,π and κ=1 at r=1,2,3; ℍ² with κ=0 at r=1,2 | κ=0: 5.776732, 4.448956, 2.546479; κ=1: 6.283185 three times; ℍ²: 6.824553→8.677694, excluded (Ric=−g) | true | none |
| `modelBallVolume` | n=2, κ=1, r=π; n=0,1 | V₁(π)=2.000000=4π/2π; exponent n−1=0 gives r | true | none |
| `cartanHadamard_isCoveringMap` | flat T²; S² | ℝ²→T² covering; S² has K=1>0, excluded | true | none |
| `bonnetMyers_distance`, `myers_finite_fundamentalGroup` | unit Sⁿ, λ=n−1; RP³ | π√1=π=diam; π₁=ℤ/2 finite | true | none |
| `synge`, `synge_orientable_of_odd` | RP², flat T², RP³, S¹ | RP² excluded by orientability, T² by strict positivity; RP³ orientable with π₁=ℤ/2; n=1: the hypothesis is vacuous and S¹ is orientable | true | none |
| `singularHomology_loopSpace_sphere` | n=2, 3, 1 | n=2: ℤ in every degree; n=3: ℤ at 0,2,4, 0 at odd degrees; n=1: H₀=⊕_ℤℤ, excluded by `hn` | true | none |
| Killing–Hopf, three cases | n=0, 1, 2 | point=point; (0,∞) with dt²/t² ≅ ℝ by log; S² needs n≥2 | true | none |
| `two_distinct_geodesics` | unit circle, p=1, q=i; ℝ | e^(iπ/4)≠e^(−3iπ/4) at t=½; ℝ has one geodesic, excluded by compactness | true | none |
| `three_simple_closed_geodesics` | round S²; constant curve | three great circles, T=2π; a constant curve is not injective on [0,T), excluded | true | none |
| `paraboloid_geodesic_crossings` | a=1, a=½ (quadrature) | a=1: R₀=2.275594, t₀=6.467619≥R₀²−1=4.178330, A=π≥2 log R₀=1.644483, R₁=10.289815, det=2ar′/R₀²=0.074453>0, r″(0)=0.2. a=½: R₀=3.763459, t₀=15.343929≥13.913626, R₁=86.321884, r″(0)=1 | true | none |
| `paraboloid_vertex_pole` | radial Jacobi field vs round K=4 | r(ℓ)>0 for ℓ>0; sin(2ℓ)/2 vanishes at ℓ=π/2 | true | none |
| `subsingleton_deRhamCohomology_one_of_ricciTensor_pos` | S², flat S¹, S² minus 2 points | H¹=0; Ric=0 with b₁=1, excluded; noncompact with b₁=1, excluded | true | none |
| `subsingleton_deRhamCohomology_of_curvatureEndomorphism_pos` | S³; S²×S²; S² at p=2 | Rop=Id ⇒ H¹=H²=0; mixed kernel with b₂=2, excluded; p<n excludes H²(S²) | true | none |
| `riemannianDist_eq_sSup_smooth` | ℝ²∖{0} with (−1,0),(1,0); x=y | intrinsic distance 2 is not attained, and smoothed clamps of x₁ reach supremum 2; x=y: sSup{0}=0 | true | none |
| `eq_harmonicSphereRestriction_of_laplaceBeltrami_eq_neg_mul` | m=1 (cos θ); m=2 (X₃, X₁X₂); S⁰ | λ=1=1·1; 2=1·2, 6=2·3; on S⁰ the function (1,2) has λ=0 and lies in neither H₀ nor H₁, excluded by `hm` | true | none |
| `harmonic_irreducible` | N=2, d≥1; N=3 | (x₁±ix₂)^d span invariant lines, excluded; N=3: dim 2d+1 = Weyl dimension of dε₁ | true | none |
| R2 along-curve regularity (R02) | flat line, V(t)=t^(k+1) | D_tV=(k+1)t^k∈C^k, as Tau Ceti's theorem gives | duplicate | R02 |
| R3 mixed derivatives (R02) | S² polar, W=∂_rf | 0−(−sin r e_θ)=sin r e_θ=R(∂_qf,∂_rf)∂_rf | duplicate | R02 |
| R6 normal exponential (R02) | flat plane | Tau Ceti `normalExp`=exp_(f p)(v)=f(p)+v = R6's Check `:3035` | duplicate | R02 |
| R5b form representation (R01) | a(u,v)=2uv on ℝ | Lax–Milgram: u↦2u, operator 2·Id, forcing solution h/2 (`:2983`) | upward supplier | R01 |

## Not verifiable

- **O'Neill (1966) and Milnor, *Morse Theory*** (§§1.3, 2.1, R3, R6). Both are settled as uncertified and cited by locator. I checked O'Neill's `K_B=K+¾|[X,Y]^v|²` and Milnor's sign dictionary by computation (table), not against the text.
- **Lee and Fulton–Harris.** Settled as uncertified; outside the sample.
- **Works outside the manifest.** Homma, Azagra–Ferrera–López-Mesas–Rangel, Axler–Bourdon–Ramey, Toth–Ziller, Wang, Gage, Ma, Lauer, Grayson, Angenent, White, Allen–Layne–Tsukahara and Dobbins are all outside the seeded sample, and the README flags none of their locators as unverified.
- **Ownership against ManifoldOptimization (#1506).** Not checked: the brief gives no checkout for it.

## Source issues

- **Error** in caponio-javaloyes-morse at §1, p. 1 (lines 18–20): the source says Serre's theorem gives loop-space homology in infinitely many degrees whenever some positive-degree homology of M is nonzero, e.g. M compact; it should require M simply connected (the circle has H₁≠0, yet ΩS¹ has homology only in degree 0); affects nothing (the README's R4.8 already restricts this citation to simply connected M).
