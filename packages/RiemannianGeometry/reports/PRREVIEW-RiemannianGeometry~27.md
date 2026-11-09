# Review of RiemannianGeometry (pull request #1683 at 7782529)

**Verdict:** needs changes

This is a full review of `TauCetiRoadmap/RiemannianGeometry/README.md` and `TauCetiRoadmap/RiemannianGeometry/Suggested.lean` at `7782529`. The pins are unchanged: Tau Ceti `2fd255d9`, Mathlib `1b1ccf4b`.

- The gate passes. The dependency check reports 0 problems.
- `Suggested.lean` elaborates with exactly 22 `sorry` warnings and nothing else.
- Of the previous review's three findings, R01 (P2) and R02 (P3) are repaired. R03 (P3, ordering against #1187) is not, and is carried over as R01 below.
- This review finds one new P3, R02. It sits in text this pull request wrote.
- No finding is blocking.

## R01 (P3) — The description still does not order this pull request against #1187

This carries over the previous review's R03, first raised as R08 five rounds earlier. No repair report marks it as not actionable.

**Location.** The pull-request description. It names #1327 and #1974 but not #1187. It still says "`ParaboloidTargets.lean` illustrates the integral estimates" and that "the new file elaborates with exactly three admission warnings using the existing local Mathlib pin `6b7abb3c…`".

**Claim.**
- #1187 ("chore: bump TauCeti to ab00ba392", head `66ed0d4`) is still open.
- It changes `TauCetiRoadmap/RiemannianGeometry/Suggested.lean`, and its head conflicts with this one there.
- Nothing says which of the two pull requests is rebased on the other.
- The folder has no `ParaboloidTargets.lean`. The pins are Mathlib `1b1ccf4b` and Tau Ceti `2fd255d9`, not the ones the description names.

**Witness.**
- `roadmaps overlaps RiemannianGeometry`: "#1187 and #1683 conflict in … `TauCetiRoadmap/RiemannianGeometry/Suggested.lean`".
- `roadmaps list` still lists #1187 with RiemannianGeometry among its folders.
- In the pinned Tau Ceti checkout, `git merge-base --is-ancestor ab00ba392 2fd255d9` succeeds.

**Repair.**
1. Add one sentence to the description: "This pull request does not wait for #1187: #1187's Tau Ceti pin `ab00ba392` is an ancestor of this head's pin `2fd255d9`, so its change to `TauCetiRoadmap/RiemannianGeometry/Suggested.lean` is superseded, and #1187 is rebased on this one."
2. Delete the `ParaboloidTargets.lean` paragraph and the sentences about the `6b7abb3c…` and `f6090c70…` pins.

Tested: the ancestor relation that justifies the stated order is the check above.

## R02 (P3) — R3.1's *Needs:* line cites an R2 target that R2 no longer owns, and a PDE "Lane A" that does not exist

**Location.** `TauCetiRoadmap/RiemannianGeometry/README.md:1571–1572`: "*Needs:* PDE Lane A (scalar weak derivatives and Sobolev calculus); R2 along-curve regularity; R3 first variation and compact-interval section spaces."

**Claim.** Neither of the first two supplier names resolves.

- **R2 along-curve regularity.** This head moved along-curve regularity out of R2, as the previous review asked: R2 now consumes Tau Ceti's theorem and states that it owns none. So the R3.1 → R2 edge points at no target. It also hides the actual input, which is a pinned Tau Ceti theorem.
- **PDE Lane A.** PDE on main has no "Lane A". Its scalar Sobolev theory is Layer 1, §§1.1–1.6, labelled A1–A6.

Neither phrase occurs in main's copy of this README, so both come from this pull request.

**Witness.**
- `README.md:1234`: "R2 owns no along-curve regularity statement".
- `TauCeti/Geometry/Manifold/VectorBundle/CovariantDerivative/AlongCurve/Regularity.lean:132`: `CovariantDerivative.contMDiffOn_alongCurveWithin`.
- `TauCetiRoadmap/PDE/README.md:675`: "## Layer 1: function spaces on a domain", with headings (A1)…(A6) at lines 677–905.

**Repair.** Replace the line with:

"*Needs:* PDE Layer 1 (A1–A6), in particular §1.1 (A1, weak derivatives and Sobolev classes on intervals) and §1.4 (A4, embeddings); Tau Ceti `CovariantDerivative.contMDiffOn_alongCurveWithin` and `CovariantDerivative.eventuallyEq_sectionCoord_alongCurveWithin` (along-curve regularity and fixed-chart formula, supplier contract); R3 first variation and compact-interval section spaces."

Tested:
- Both Tau Ceti names resolve at the pin (`Regularity.lean:132` and `:56`), and §§1.1 and 1.4 exist on main.
- R3's own *Needs:* at `:1521–1525` already cites the Tau Ceti theorem in this form.
- After the change, `grep "R2 along-curve\|PDE Lane A"` on the README returns nothing.

## Previous findings

- **R01 (P2: R5b took its form theory from UnboundedOperators and VariationalMethods): repaired.**
  - `grep "UnboundedOperators\|VariationalMethods\|UO-D06"` on both files returns nothing.
  - The scope (`README.md:42–46`) now reads "R5b owns the Dirichlet realization of the normal Jacobi operator … built on Tau Ceti's Lax–Milgram solution operator … no general closed-form representation is a target here".
  - R5b (`:3011–3064`) now states the coercive shift, the graph definition of L_D, `(L_D+c)⁻¹=S` for Tau Ceti's `IsCoercive.formSolutionOperator`, the eigenvalues κ−c, the Rayleigh minimum `‖S‖⁻¹−c` and the index statement, with four Checks.
  - The contract (`:544–560`, `:690–697`) and the Dependencies (`:3103–3107`, `:3754`) name only PDE, Tau Ceti and P1.0.
  - I opened every cited declaration at the pin; each matches (list below).
  - PDE §4.4 on main (`TauCetiRoadmap/PDE/README.md:1776–1778`) leaves the general "represented operator of a compact form pair" to VariationalMethods. R5b states only its normal-Jacobi instance on W¹,²₀(D;ν), so there is still one owner of the general object.
- **R02 (P3: three pinned Tau Ceti results planned as owned targets): repaired.**
  - **R2.** `:1228–1234` consumes the four along-curve declarations, and the HopfRinow contract `:635–637` now says they are Tau Ceti's.
  - **R3.** `:1443–1452` consumes `CovariantDerivative.alongCurve_alongCurve_sub_alongCurve_alongCurve` and owns only the one-sided form at the end parameters of each piece. The new sign Check `:1515–1519` is correct (table).
  - **R6.** `:3113–3128` consumes `normalExp`, `normalExpDomain`, `isOpen_normalExpDomain`, `contMDiffOn_normalExp` and `mfderiv_normalExp_zeroSection_apply`, and owns only the immersion case and its comparison with the embedding case.
  - The R2 move left one dangling citation: R02 above.
- **R03 (P3: ordering against #1187): not repaired.** Carried over as R01.

## Verified sound

### Gate, dependency check, elaboration, signatures, padding

- **Gate.** `gate … --base origin/main` prints every counter 0 (`set_option=0 … statement-hygiene=0 … depcheck=0 … stray-files=0 … outside-folder=0 source-material=0`) and `OK`, exit 0. The worker's run on this head also reports `build=0`. `git diff --stat origin/main...HEAD` outside the folder is empty.
- **Dependency check.** `gate --depcheck … --movable` prints `depcheck: 235 roadmaps, 2261 edges, 0 problem(s)`, exit 0, with no UPWARD, CYCLE or `moved:` line.
  - The previous review's false negative (two suppliers off main) no longer applies: no supplier outside main is named.
  - I checked every relative link (25 targets) and every plain supplier name on main. RicciFlow, CalibratedGeometry, PositiveMass and SpectralManifolds, which are not on main, occur only as consumers or as owners of deferred results.
- **Elaboration.** `lake env lean TauCetiRoadmap/RiemannianGeometry/Suggested.lean` exits 0 in 24 s. There are 22 `declaration uses sorry` warnings, at lines 103, 120, 144, 155, 172, 214, 235, 252, 262, 273, 283, 314, 324, 336, 364, 397, 419, 450, 467, 492, 513 and 529, and nothing else. Only the module docstring changed since the previous head.
- **Signatures.** One scratch copy carried `#check @` for all 24 declarations (22 theorems and the definitions `modelBallVolume` and `paraboloidGraph`). Each elaborated type keeps the binders its README statement needs:
  - `[I.Boundaryless]` throughout;
  - `[ConnectedSpace M] [CompactSpace M] [TauCeti.Orientable I M]` on `synge`;
  - `[IsRiemannianManifold I M] [ConnectedSpace M] [CompleteSpace M] [MeasurableSpace M] [BorelSpace M] [SecondCountableTopology M] [IsContinuousRiemannianBundle …]` on `guenther` and `bishopGromov`;
  - the order-1 and order-2 bundle instances on the Killing–Hopf, two-sphere and paraboloid sections;
  - `1 ≤ m` and `f ≠ 0` on the R8.2 theorem.

  The types agree with the worker's `signatures.md`; nothing changed.
- **Padding.** In the same copy I replaced every `sorry` with `first | rfl | infer_instance | (simp; done) | (intros; simp_all; done) | (constructor <;> simp; done) | trivial | decide | positivity | (exact fun _ => rfl) | (left; rfl) | (right; rfl) | (exact ⟨0, by simp⟩) | (intro _ _; exact Subsingleton.intro) | (exact Subsingleton.intro) | (intro t ht; positivity) | (exact le_rfl) | (simp_all; done)`. Exactly 22 errors resulted, one per theorem body, with 0 `sorry`. No declaration restates a definition, mirrors a Check or treats a boundary case.
- **Form.**
  - Imports: `public import Mathlib` plus 16 `TauCeti.*` modules, all present at the pin.
  - No `set_option`, `lemma`, sorry'd data, `#eval` or process words.
  - The new text's "current" (`:2973`) means a geometric current.
  - Every layer ends with `### Examples` and `### Dependencies`.
  - R5b's new L_D has three API bullets and four Checks. Check 1 excludes the inverse convention, Check 2 the sign error `S⁻¹+c`, and Check 4 separates the form domain from the operator domain, so the graph definition fixes the object.

### Headline theorems

- **Stated in `Suggested.lean`:**
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
  - the Morse index theorem (R3) and its focal form (R6);
  - Gauss/Codazzi/Ricci and the volume variations (R5a, R5b);
  - ℛ_p vanishing (R7.6);
  - Takahashi (R8.4).

  At the pin there is no `indexForm`, `secondVariation`, `meanCurvature` or Weitzenböck term. `TauCeti.secondFundamentalForm` (`TauCeti/Analysis/InnerProductSpace/SecondFundamentalForm.lean:82`) is for one parametrization of a vector space, so these remain not statable.

### Seeded sample, read in the cache

- **1.1 Curvature identities.**
  - `andrews-dg-ch16` line 105: Proposition 16.2.1, under the printed header "154" at line 104. The slot convention `K(σ)=R(e1,e2,e1,e2)` is at line 101.
  - `nicolaescu-lectures` line 8870: Example 4.2.36 (λ=s/n), under the header "195" at line 8852.
  - Line 8888: Exercise 4.2.38 (dimension ≥3, constant scalar curvature), under the header "196" at line 8887.
- **1.2 Local symmetry.** `nicolaescu-lectures` line 4604 is §3.3.2, and line 4630 is equation (3.3.7), the initial-value problem ∇_(d/dt)u=0. They lie on printed p. 103, continued under the header "104" at line 4641.
- **1.3 Metric changes.**
  - `spacetime-guided-tour` line 2919: Lemma 35, on page 61.
  - Its items at lines 2971–2976, under page 62, are `R(V,W)U=R_F(V,W)U−(‖grad f‖²/f²)(g(V,U)W−g(W,U)V)` and `R(V,X)Y=(H(f)(X,Y)/f)V`. Negating both gives `README.md:968–969`.
  - Line 2953: Lemma 36. Its items at lines 2981–2983 are the README's three Ricci formulas.
  - Line 2845: Theorem 9, p. 60.
  - `andrews-dg-ch16` line 429: Corollary 16.8.5, under the header "162" at line 410.
- **2.1 Jacobi fields.**
  - `IsJacobiFieldOn` (`TauCeti/Geometry/Manifold/Riemannian/Jacobi/Basic.lean:59`) carries the equation `D_t²V+R(V,γ′)γ′=0` and C² regularity of the lift.
  - `Uniqueness.lean:161`: preconnected s, equal value and covariant derivative at one parameter.
  - `Exponential.lean:155`: s ⊆ `geodesicInterval`, 0∈s, X 0=0 and D_tX(0)=w give `X t = d(exp_p)_(tv)(tw)`.
  - `grep "^theorem exists"` in `Jacobi/` is empty, so `exists_jacobi_initial_data` is not a duplicate.
  - The Milnor locators are under Not verifiable.
- **2.2 Normal-coordinate jets.**
  - `bishop-rg` lines 1885–1892: §6.11 on p. 41 (page marker at line 1865) defines the canonical frame by radial parallel translation.
  - Line 1893 is Problem 6.12. Its connection forms at line 1904 are linear in x, so they vanish at p.
  - `nicolaescu-lectures` lines 6772, 6793 and 6801: Definition 4.1.23, Proposition 4.1.25 and Lemma 4.1.26, under the header "4.1. METRIC PROPERTIES 151" at line 6769.
  - `brewin-rnc` line 294 is §5, "The metric in Riemann normal form". Line 363 gives `g_ab−⅓x^cx^dR_acbd−⅙x^cx^dx^e∂_cR_adbe` on page 9, and lines 614–615 give (11.1) on page 15.
  - Tau Ceti `Geodesic/Normal/Coordinates.lean:84, 270, 292` match the contract.
- **2.3 Euclidean limits.** `bishop-rg` lines 1872–1875: Theorem 6.11 on p. 41, `g_ij=δ_ij−⅓ΣR_ihjk x^h x^k`. With c=λ_j², `sectionalCurvature_leviCivitaConnection_rescale_const` gives the factor λ_j⁻².
- **Also checked:**
  - `petersen-wink-bochner` lines 39–40: Corollary, p. 1.
  - `kwong-volume-comparison` line 1766: Theorem 10, between the page 27 and 28 markers.
  - `lyons-hopf` lines 391, 415 and 449: Investigations (L) and (M) and Figure 10 on arXiv PDF pp. 13–15, as cited. The printed page numbers are 12–14.
  - Note for the worker, not a finding: `sources.toml` still records `lyons-hopf` at "arXiv v1 pp. 11–14".

### Library declarations opened at the pins

- **Tau Ceti `2fd255d9`, R5b** (`TauCeti/Analysis/InnerProductSpace/Variational/`):
  - `Spectrum.lean:103` `formSolutionMap`, `:113` `apply_formSolutionMap` (`B (S h) v = ⟪h, J v⟫`), `:119` `eq_formSolutionMap`, `:138` `formSolutionOperator` (`J ∘ formSolutionMap`);
  - `:193` compact when J is, `:199` symmetric when B is, `:219` nonnegative;
  - `:265` kernel `(range J)ᗮ`;
  - `:550` `exists_hilbertBasis_forall_apply_eq_smul_inner` (`[CompleteSpace H]`, J compact with dense range, B symmetric; κ>0, `B (u x) v = κ ⟪J u, J v⟫`);
  - `Rayleigh.lean:134` `isLeast_rayleighQuotient` (J compact, B symmetric, J≠0).
  - Each matches `README.md:544–560`.
  - `TauCeti/Analysis/PDE/Spectrum/Basic.lean:140, 291, 544` is the scalar Euclidean Dirichlet case, not R5b's bundle operator on a Riemannian domain.
- **Tau Ceti, R2 and R3** (`TauCeti/Geometry/Manifold/VectorBundle/CovariantDerivative/`):
  - `AlongCurve/Regularity.lean:56, 132`;
  - `AlongCurve/Chart.lean:69`;
  - `AlongCurve/Basic.lean:353` (D_t(X∘φ)=φ′·(D_tX)∘φ, φ differentiable within s′, `MapsTo φ s' s`);
  - `Curvature/Surface.lean:155` (`D_qD_rW−D_rD_qW=R(∂_qf,∂_rf)W` for a C² lift at (u,v), any smooth connection, full parameter lines).
- **Tau Ceti, R6** (`TauCeti/Geometry/Manifold/TubularNeighborhood/Riemannian/`):
  - `Basic.lean:58, 113`;
  - `Regularity.lean:47`, openness for a C¹ source;
  - `Regularity.lean:63`, C^m when m+1≤n;
  - `Differential.lean:48`, `mfderiv` at the zero section is `df(u)+normalRepresentative v` for 1+1≤n.
- **Tau Ceti, checked and absent (these owned targets stand):** a Jacobi existence theorem; an index form; an immersion second fundamental form or mean curvature; a Riemannian Rauch, Günther, Bishop–Gromov, Cartan–Hadamard, Synge or Ricci Bonnet–Myers theorem.
  - `MeasureTheory/OptimalTransport/MetricMeasure/MeasureContraction.lean` proves an MCP(K,N) diameter bound, a different hypothesis from `bonnetMyers_distance`.
- **Mathlib `1b1ccf4b`:** `Analysis/InnerProductSpace/LaxMilgram.lean`, the base of the Tau Ceti solution map.
- **Name sweep.** A script grepped all 244 identifier-like backticked tokens of the README at the pins.
  - 227 resolve to library declarations or are this roadmap's own `Suggested.lean` names.
  - Of the other 17, 12 are notation (`T_pM`, `C_glue`, `b_gap`).
  - The remaining 5 are supplier targets found on main: AT8.11a `finiteSourceMappingCWType` and `basedLoopCWType`, AT4.4 `reducedSuspensionSphereHomeomorph`, and CC C2.0 `bundleDiskSphereRelCW` and `bundleDiskAttachmentCWModel`.
  - `roadmaps resolve` finds no unresolved citation.

### Citations and ownership

- **PDE ids.** The ids R5b cites (A1–A6, D16–D19, E20–E22) exist at `TauCetiRoadmap/PDE/README.md:677–1927`.
- **Overlap tool.**
  - It lists no id this roadmap cites that an open pull request drops.
  - It lists no id only an open revision defines.
  - It lists no id this pull request drops that others cite.
  - The only conflicting pull request is #1187 (R01).
- **Ownership.**
  - `roadmaps grep` for the normal Jacobi operator finds only CalibratedGeometry (#946), which cites R5b as owner (`CalibratedGeometry/README.md:357, 1460`).
  - The Surfaces sub-roadmap (`Surfaces/README.md:310, 756`) uses Tau Ceti's `SmoothEmbedding.normalExp` and R6's focal theory, which is consistent with the new R6 split.
  - Downstream citations of R2, R3 and R6 (OptimalTransport #950, RicciFlow #1023, HomotopySpheres #1287, AlgebraicTopology #1652/#1797, MorseTheory #1682) cite sections, not the moved regularity statements.
  - The Surfaces sub-roadmap uses the namespace `TauCetiRoadmap.RiemannianGeometry.Surfaces`, so no fully qualified name collides.

### Adversarial table

| Statement | Instances | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §1.1 item 4, `24r=B_Q(x,w;y,z)−B_Q(y,w;x,z)` | K=1 orthonormal, z=y, w=x; r=ω⊗ω on ℝ⁴ | B_Q(x,x;y,y)=16 and B_Q(y,x;x,y)=0−4−4+0=−8, so 24=24K; ω⊗ω: 8−(−8)=16≠24, because its cyclic sum is 1 | true; the negative control is correct | none |
| §1.1 item 2, constant curvature ⇔ tensor | orthonormal x,y; n≤1 | ⟨R(x,y)y,x⟩=κ(1·1−0)=κ; for n≤1 there is no 2-plane and both sides hold for every κ | true (Tau Ceti) | none |
| §1.2 Checks | dx²+e^(2x²)dy² at x=1; unit and radius-2 S³ | K=−(2+4x²)=−6 and ∂ₓK=−8; Ric=2g and ½g | true; connectedness is needed | none |
| §1.3 warped `R(V,X)Y` | dx²+e^(2x)dy² | −f″/f=−1, which is Barzen–Leymann's +H(f)/f negated | true | none |
| §1.3 warped `Ric(V,V)` | (0,π)×_sin S², k=2, t=π/3 | Δ: 4/3−(−1+1/3)=2=k; Δ⁺: 4/3−4/3=0 | true; the sign is pinned | none |
| §1.3 Euclidean warped Check | ℝ³∖0=(0,∞)×_r S² | (k−1)g_N−(k−1)r⁻²·r²g_N=0 | true | none |
| §1.3 T-tensor Checks | e^(2x)dy², e^(4x)dy² | Γˣ_yy=−e^(2x) gives T_UU=−∂x, norm 1; Γˣ_yy=−2e^(4x) gives −2∂x, norm 2 | true | none |
| §1.3 Andrews sign | ad-invariant metric | ⟨R(X,Y)W,Z⟩=−¼⟨[[X,Y],W],Z⟩=¼⟨[X,Y],[Z,W]⟩, Andrews' ¼c_ijp c_klp | true | none |
| §1.3 O'Neill Hopf | S³→CP¹ | \|v[X,Y]\|=2, \|A_XY\|=1, K_B=1+3=4; CP¹ radius ½, area 4π/4=π | true | none |
| §2.1 Checks | flat u+tv; sphere sin t·E; flat t²E | D²J=0; −sin t E+sin t E=0; residual 2E≠0 | true | none |
| `exists_jacobi_initial_data` | flat; great circle; a=b | data (u,v) for u+tv; (0,E) for sin t·E; `Icc a a` excluded by `hab` | true; no pinned existence | none |
| §2.1 d exp identification | flat ℝⁿ | d exp_(tv)(tw)=tw=J(t), J(0)=0, J′(0)=w | true | none |
| §2.2 transported vs coordinate frame | unit S², t=π/2; flat | \|E_Y\|=1 vs sin t/t=0.636620; flat: both e_i | true | none |
| §2.2 holonomy Check | octant triangle on unit S² | rotation = K·area = 4π/8 = π/2 | true | none |
| §2.2 jets (Brewin, Bishop) | unit S², e⊥v | sin²t/t²=1−t²/3+…, coefficient −⅓·K\|v\|² in both | true | none |
| §2.3 R1.5 | unit S², λ=10, ρ=1 | sin²(0.1)/0.01=0.996671 vs 1−1/300=0.996667; K(g_j)=λ⁻²=0.01 | true | none |
| R3 commutator Check (new) | S², f=(sin r cos q, sin r sin q, cos r), W=∂_rf | D_qD_rW−D_rD_qW=0−(−sin r e_θ)=sin r e_θ; R(∂_qf,∂_rf)∂_rf=1·∂_qf−0=sin r e_θ | true | none |
| R3 index Checks | L=π, 3π/2 | I=(π²/L−L)/2 = 0 and −5π/12=−1.309 | true | none |
| R3.1 *Needs:* (R02) | grep of README and PDE on main | R2 `:1234` "owns no along-curve regularity"; PDE has A1–A6 and no "Lane" | dangling | R02 |
| `rauch_norm_ge_of_sectional_le` | radius 5/2 sphere vs κ=1 | t=π/2: 1≤1.469463; t=5π/2: 1≤0 fails, excluded by b<π | true | none |
| `guenther` | unit S², κ=1, r=1; n=1; n=0 | 2·(1−cos 1)·π=2.888366 on both sides; n=1: 2r=2r; n=0: 0≤vol | true | none |
| `guenther`, injectivity form | complete M, cut time c(v)<r | two minimizers at c(v), or a non-minimizing γ_v(t), t<r, each give exp(tv)=exp(sw) with sw≠tv in the ball | the hypothesis equals r≤inj(p) | none |
| `bishopGromov` | unit S², κ=0 at r=1,2,π; ℍ² | 2.888, 2.224, 1.273, nonincreasing; ℍ²: 3.41→4.34, excluded since Ric=−g | true | none |
| `modelBallVolume` | n=2, κ=1, r=π; n=0,1; scaling | V=2=4π/2π; V=r; ∫₀^(cr)(c s_κ)^(n−1)c=cⁿV | true | none |
| `cartanHadamard_isCoveringMap` | flat T²; S² | ℝ²→T² is a covering; S² has K=1, excluded | true | none |
| `bonnetMyers_distance`, `myers_finite_fundamentalGroup` | unit Sⁿ, λ=n−1; RP³ | π√1=π=diam; π₁=ℤ/2 finite | true | none |
| `synge`, `synge_orientable_of_odd` | RP², T², RP³, a point | excluded by orientability, positivity and parity respectively; a point is simply connected | true | none |
| `singularHomology_loopSpace_sphere` | n=2,3,1 | n=2: ℤ in every degree; n=3: ℤ in even degrees, 0 in odd; n=1 excluded (H₀ free of infinite rank) | true | none |
| Killing–Hopf, three cases | n=0,1,2 | point≅point; line≅line by log on (0,∞); S² needs n≥2 | true | none |
| `two_distinct_geodesics` | unit circle, p=1, q=i; ℝ | e^(iπ/4)≠e^(−3iπ/4) at t=½; ℝ excluded by compactness | true | none |
| `three_simple_closed_geodesics` | round S²; a constant curve | three great circles, T=2π; a constant curve is not injective on [0,T) | true | none |
| `paraboloid_geodesic_crossings` | a=1, a=½ (quadrature) | a=1: R₀=2.275594, t₀=6.467619≥R₀²−1=4.178330, π≥2log R₀=1.644483, R₁=10.289815, det=0.074453>0, r″(0)=0.2; a=½: R₀=3.763459, t₀=15.343929≥13.913626, R₁=86.321884, r″(0)=1 | true | none |
| `paraboloid_vertex_pole` | radial Jacobi field vs round K=4 | r(ℓ)>0 for ℓ>0; sin(2ℓ)/2 vanishes at π/2 | true | none |
| R5b Check 1 (new) | V=H=ℝ, Q=2uv, c=0 | solution h/2, S=½Id, L_D=2Id; the inverse convention gives ½Id | true | none |
| R5b Check 2 (new) | Q=−uv, c=1,2,3 | c=1: B=0, not coercive; c=2: S=Id, L_D=1−2=−1; c=3: S=½Id, L_D=2−3=−1; S⁻¹+c=3 | true | none |
| R5b Check 3 (new) | equator arc, ℓ=3π/2 and π | (2/3)²−1=−0.556, (4/3)²−1=0.778, so index 1 = n−1 for n=2; ℓ=π: least eigenvalue 0 | true | none |
| R5b Check 4 (new) | (0,π), tent φ, s(π−s) | Q(φ,v)=2v(π/2), not L²-bounded; −(s(π−s))″=2 | true | none |
| R5b `(L_D+c)⁻¹=S` (new) | graph pair (Ju,f) | B(u,v)=Q(u,v)+c⟨Ju,Jv⟩=⟨f+cJu,Jv⟩, so `formSolutionMap(f+cJu)=u` and S(f+cJu)=Ju | true | none |
| R5b least eigenvalue (new) | Rayleigh at the pin | min B(v,v)/‖Jv‖² = ‖S‖⁻¹ = λ₁+c | true | none |
| R6 normal exponential (new citation) | flat plane; unit circle, inward | (p,v)↦p+v; tangent derivative 1−t, kernel of dimension 1 at t=1 | true | none |
| R6 `I_M` regression | unit circle, X=(1−t/b)(0,1) | ∫\|X′\|²=1/b and ⟨S X(0),X(0)⟩=1 give 1/b−1; D_tX(0)+SX(0)=(0,1−1/b)∈ν iff b=1 | true | none |
| R6 Hessian | unit circle, inward, t=½,1,2 | 2(1−t)=1,0,−2; index/nullity (0,0),(0,1),(1,0) | true | none |
| R7.0 Bochner identity | f=x² on ℝ | −8+8+0=0=2⟨2x,d(−2)⟩; without the factor 2: −4≠0 | true | none |
| `subsingleton_deRhamCohomology_one_of_ricciTensor_pos` | S², flat S¹, S² minus 2 points | H¹=0; Ric=0 with b₁=1, excluded; noncompact with b₁=1, excluded | true | none |
| `subsingleton_deRhamCohomology_of_curvatureEndomorphism_pos` | S³, S²×S², S² at p=2 | Rop=Id; mixed kernel with b₂=2, excluded; p<n excludes H²(S²) | true | none |
| R7.7 ⌊n/2⌋ range | α>β/2>0, p≤n/2 | (p−1)β≤2(p−1)α≤(n−2)α<(n−1)α | true | none |
| `riemannianDist_eq_sSup_smooth` | ℝ²∖{0} with (±1,0); x=y | distance 2, not attained, equals the supremum 2; sSup{0}=0 | true | none |
| `eq_harmonicSphereRestriction_…` | S¹ cos θ; S² X₃, X₁X₂; S⁰ | λ=1=1·1; 2=1·2, 6=2·3; on S⁰ the function (1,2) is excluded by `hm` | true | none |
| R8.1 polar Laplacian | p homogeneous of degree d | Δp=r^(d−2)(d(d−1)+md)h−r^(d−2)Δ⁺h=r^(d−2)(d(d+m−1)h−Δ⁺h) | true | none |
| `harmonic_irreducible` | N=2,3,4 | (x₁±ix₂)^d span invariant lines; 2d+1; C(d+3,3)−C(d+1,3)=(d+1)² | true | none |
| R8.5 five-coordinate map | unit S² | squared norm (a+b+c)²=1; λ/m=6/2 gives 3g | true | none |
| R5a.2 paraboloid H, stereographic Γ | v=0; φ=log2−log(1+\|x\|²) | (2+0)/1=(f_xx+f_yy)/2=2; ∂_jφ=−2x_j/(1+\|x\|²) gives the stated Γ | true | none |
| R4.9.6a/b flow identities | small cap of radius r; k_t=k_ss+k³+Kk | ∫k+Area=2π cos r+2π(1−cos r)=2π; E₀′=−2E₁+∫k⁴+2∫Kk²; E₁′=−2E₂+7∫k²k_s²−2∫Kkk_ss | true | none |

## Not verifiable

- **Milnor, *Morse Theory*.** Settled as uncertified. This covers §2.1's §14 p. 77 and Lemma 14.4, R3's Theorems 15.1 and 14.1, and R6's Lemmas 6.5 and 6.9. I checked the sign dictionary and index values by computation (table), not against the text.
- **O'Neill (1966)** (§1.3). Settled as uncertified. I checked `K_B=K+¾|[X,Y]^v|²` on the Hopf example only.
- **Lee and Fulton–Harris.** Settled as uncertified; outside the sample.
- **Works outside the manifest.** Homma, Azagra–Ferrera–López-Mesas–Rangel, Axler–Bourdon–Ramey, Toth–Ziller, Wang, Gage, Ma, Lauer, Grayson, Angenent, White, Allen–Layne–Tsukahara and Dobbins are outside the seeded sample, and the README flags none of their locators as unverified.
- **Ownership against ManifoldOptimization (#1506).** Not checked: the brief gives no checkout for it.

## Source issues

- **Misprint** in andrews-dg-ch16 at Proposition 16.2.1, p. 154 (line 110): the source says the notation e_i∧e_j denotes the oriented plane generated by e_1 and e_j; it should say generated by e_i and e_j; affects nothing.
- **Error** in caponio-javaloyes-morse at §1, p. 1 (lines 18–20): the source says Serre's theorem gives infinitely many nonzero loop-space homology degrees whenever some positive-degree homology of M is nonzero, e.g. M compact; it should require M simply connected (the circle has H₁≠0, yet its based loop space has homology only in degree 0); affects nothing (R4.8 already restricts this citation to simply connected M).
