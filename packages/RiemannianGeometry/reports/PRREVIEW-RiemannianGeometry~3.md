# Review of RiemannianGeometry (pull request #1327 at 810f49e)

**Verdict:** needs changes

RiemannianGeometry is a roadmap on main; this pull request amends R1.2 (curvature reconstruction from sectional numerators), adds a stereographic Hopf-orbit block to R3.3c, rewrites the convention bridge in R8.3, and adds `TauCetiRoadmap/RiemannianGeometry/CurvaturePolarizationTargets.lean` and `TauCetiRoadmap/RiemannianGeometry/HopfPictureTargets.lean`. `Suggested.lean` is byte-identical to main. The new mathematics is correct: every formula of the three new passages is recomputed in the table below, the polarization identity was tested numerically on a random algebraic curvature tensor, and both new Lean files elaborate at the branch's pins with only `sorry` warnings. The verdict is driven by the gate, which fails on this head (`sorry-data=4`, `blob=8`, `tex=7`), by an unowned supplier citation in R6, by two headline theorems that are statable at the pins but absent from `Suggested.lean`, and by an R8.3 supplier citation that resolves only at the head of a pull request revising an on-main roadmap.

**Previous review (of pull request #1683 at 28b0cf1), finding by finding.** This head shares none of that pull request's commits, so none of its repairs is here: R01 (sorry'd data) not repaired, the four definitions are still at lines 91, 103, 194, 213; R02 (module-system build warning) does not arise at this branch's older Mathlib pin `6b7abb3c` (the worker's gate reports `build=0`), so it is not a finding here, but it will appear if the branch is rebased onto main's pin `f6090c70`; R03 (Cartan–Hadamard and three closed geodesics absent) not repaired; R04 (R6's GeometricTopology names) not repaired, lines 1337–1348 still cite them; R05 (TeX subscripts) not repaired; R06 (blob links) not repaired and one more added at line 610; R07 (pull-request URLs) not repaired, lines 120, 165, 671; R08 (dead relative links) not repaired, and main has since fixed two of them so this branch now regresses them; R09 (V2.3, P2.3 labels) not repaired; R10 concerned `ParaboloidTargets.lean`, which this pull request does not carry; R11 (padding) not repaired; R12 (README shape, undeclared backticked names) not repaired; R13 (projective block locator) not repaired.

## R01 (P1) — R6 consumes six GeometricTopology Layer 1 declarations that exist nowhere

Location: `TauCetiRoadmap/RiemannianGeometry/README.md` lines 1337–1341 ("Consume GT Layer 1's `euclideanSquaredDistance_isProper`, `euclideanNormalEndpoint_criticalImage_isNull`, `ae_nondegenerateCriticalPoints_euclideanSquaredDistance` … `ae_isMorse_euclideanSquaredDistance`") and 1346–1348 (`euclideanChartSquaredDistanceHessian`, `euclideanChartNormalDerivativePairing`).

Claim: the properness and almost-everywhere-Morse theorems for Euclidean squared-distance functions, and the two chart lemmas, are attributed to a supplier that does not state them; they are unowned prerequisites of R6's focal/index comparison.

Witness: GeometricTopology on main (`TauCetiRoadmap/GeometricTopology/README.md`) and at the head of its open pull request contain none of the six names (grep count 0 in both); the pinned Tau Ceti `TauCeti/Geometry/Manifold/TubularNeighborhood/Euclidean.lean` has `exists_isTubularNeighborhood_normalBundle` (line 454) and no squared-distance result. GeometricTopology Layer 1 does supply the tubular neighbourhood (main line 218).

Repair: own them in R6 as targets: for a closed `C²` embedding `f : M → ℝⁿ`, `h_q = |f − q|²` is proper; the set of `q` for which `h_q` has a degenerate critical point is the image of the focal set and is Lebesgue null; for smooth `f` and almost every `q`, `h_q` is Morse (Milnor, *Morse Theory*, §6, Theorem 6.6, with Lemma 6.5 for the index and the chart Hessian/normal-derivative pairing as the two lemmas R6 already describes at lines 1331–1332). Replace the six names by R6 targets and keep GeometricTopology Layer 1 cited only for the normal bundle, tubular neighbourhood and nearest-point map.

## R02 (P2) — `Suggested.lean` carries four `sorry`'d data declarations and eight dependents

Location: `TauCetiRoadmap/RiemannianGeometry/Suggested.lean` lines 91–99 (`cOneEndpointZeroFields`, three `sorry` proof fields of a `Submodule`), 103–106 (`indexForm … := by sorry`), 194–197 (`secondFundamentalForm … := by sorry`), 213–218 (`shapeOperator … := by sorry`).

Claim: definitions with `sorry` bodies; the principles forbid sorry'd data, and the gate fails on them.

Witness: gate line `sorry-data (4)` at this head naming exactly these lines (reproduced by my rerun); `indexForm_apply` (108), `secondFundamentalForm_along_curve` (200), `inner_shapeOperator` (220), `euclideanImmersionSecondFundamentalForm` (247), `euclideanSecondFundamentalForm` (254), `euclideanSecondFundamentalForm_along_curve` (261), `euclideanShapeOperator` (273), `inner_euclideanShapeOperator` (281) mention them.

Repair: delete the four definitions and the eight dependents (and `extendIntervalField`, line 85, which then has no user). The README already states the index form (R3) and B, S (R5a) as targets with their intended signatures; heavy definitions are README targets, not sorry'd Lean data.

## R03 (P2) — two headline theorems are statable at the pins but absent from `Suggested.lean`

Location: `TauCetiRoadmap/RiemannianGeometry/Suggested.lean` (whole file); README R4 item 4 (line 742, Cartan–Hadamard) and R4.9 (line 870, three simple closed geodesic images on a smooth two-sphere).

Claim: both end theorems can be written against the carriers of this branch's pins (Tau Ceti `a91d3aa`, Mathlib `6b7abb3c`), so their absence is a defect; the file instead carries padding (R11).

Witness: a scratch probe elaborated with `lake env lean` at these pins with exactly two `sorry` warnings. Cartan–Hadamard, in the `GlobalDistance` context of lines 137–142 plus `[ConnectedSpace M] [CompleteSpace M]`: for `p : M` and `hK : ∀ x (u v : TangentSpace I x), inner ℝ (curvatureTensor x u v v) u ≤ 0`, the conclusion `IsCoveringMap (TauCeti.Manifold.riemannianExp I M p)` (`TauCeti/Geometry/Manifold/Riemannian/Geodesic/Exponential.lean:98`; `Mathlib/Topology/Covering/Basic.lean:287`). Three geodesics: for `M` with `[ChartedSpace (EuclideanSpace ℝ (Fin 2)) M] [IsManifold (𝓡 2) ∞ M]`, a `RiemannianBundle` instance, `IsContMDiffRiemannianBundle (𝓡 2) ∞ …`, an explicit `IsContMDiffRiemannianBundle (𝓡 2) 1 …` binder, and `Nonempty (Diffeomorph (𝓡 2) (𝓡 2) M (Metric.sphere (0 : EuclideanSpace ℝ (Fin 3)) 1) ∞)` (`Mathlib/Geometry/Manifold/Diffeomorph.lean:82`; sphere instances `Mathlib/Geometry/Manifold/Instances/Sphere.lean:351, 385`), the conclusion `∃ (γ : Fin 3 → ℝ → M) (T : Fin 3 → ℝ), (∀ i, 0 < T i ∧ TauCeti.Manifold.IsGeodesicCurveOn (𝓡 2) (γ i) univ ∧ (∀ t, γ i (t + T i) = γ i t) ∧ InjOn (γ i) (Ico 0 (T i))) ∧ ∀ i j, i ≠ j → range (γ i) ≠ range (γ j)`. The order-one instance binder is needed because `IsGeodesicCurveOn` (`Geodesic/Basic.lean:98`) asks for it and it is not found from the `∞` instance under the default heartbeats; no `set_option` is needed.

Repair: state both in `Suggested.lean`, each with `sorry`, and name in the module docstring the headlines that remain unstatable (Morse index theorem and Takahashi, which need the index form and a Laplacian carrier; Bochner vanishing, which needs a de Rham cohomology carrier at the pin).

## R04 (P2) — R8.3 consumes "ClassicalGroups Layer 3A", which exists only in a pull request revising an on-main roadmap

Location: `TauCetiRoadmap/RiemannianGeometry/README.md` line 1493 ("consuming ClassicalGroups Layers 3/3A/5's highest-weight classification targets"), 1503 ("For the comparison with ClassicalGroups Layer3A"), 1509 ("In Layer3A's specified isotropic basis").

Claim: ClassicalGroups lives on main as `TauCetiRoadmap/RepresentationTheory/ClassicalGroups`, whose README has Layer 3 (line 237, "maximal torus, weights, and the highest-weight classification", SOₙ/Spₙ at line 265) and no Layer 3A, no isotropic basis and no torus-coordinate convention. Layer 3A exists only at the head of ClassicalGroups' open pull request (line 703; the basis at lines 740–760), and that pull request revises an existing roadmap, which the brief says is never a dependency: an existing roadmap is cited as it is on main. ClassicalGroupsPartII at its open head has no isotropic basis either.

Witness: `grep -n '3A\|isotropic' TauCetiRoadmap/RepresentationTheory/ClassicalGroups/README.md` on main: no hit for either; at the open head, `### 3A.1 Tori, lattices and differentiation` with `u_(i+1)=e_(2i)+I e_(2i+1)`, `v_(i+1)=(e_(2i)−I e_(2i+1))/2`, torus `diag(t,t⁻¹[,1])` in the ordered basis `(u₁,…,u_r,v_r,…,v₁)` and the upper-triangular Borel for `ε_i−ε_j, ε_i+ε_j`. The dictionary R8.3 states is correct against that convention (table rows below), so the content is sound; only its owner is wrong.

Repair: cite "ClassicalGroups Layer 3" for the connected SO/Sp highest-weight classification (as on main), and state the convention R8.3 relies on as R8.3's own: the isotropic basis `u_i=e_(2i−1)+i e_(2i)`, `v_i=(e_(2i−1)−i e_(2i))/2`, torus coordinate `t_i` the eigenvalue on `u_i`, Borel the stabiliser of the flag spanned by `u₁,…,u_r` (positive roots `ε_i±ε_j`, `i<j`, and `ε_i` in odd dimension), with a textbook locator (Fulton–Harris, *Representation Theory*, Lectures 18–19, or Goodman–Wallach, *Symmetry, Representations, and Invariants*, §2.1.2, checked against the text). The sentences from "Fix the R8 Borel as `σ⁻¹(B_Classical)`" onward then read against this stated convention and need no other change.

## R05 (P3) — links pinned to repository commits (gate `blob (8)`)

Location: README lines 66 (SmoothBundlesConnections), 83 and 301 (ComplexKahlerGeometry), 94 and 1251 (VariationalMethods), 99 (UnboundedOperators), 144 (PseudodifferentialOperators), and the new line 610 (`[hs5]: https://github.com/…/blob/6fc31321…/HomotopySpheres/README.md#50-finite-ambient-spheres-and-honest-normal-rank`).

Repair: SmoothBundlesConnections and ComplexKahlerGeometry are on main: link `../SmoothBundlesConnections/README.md`, `../ComplexKahlerGeometry/README.md`. VariationalMethods, UnboundedOperators, PseudodifferentialOperators and HomotopySpheres are not on main: name the roadmap and section with no URL ("HomotopySpheres §5.0", which exists at its open head as `### 5.0 Finite ambient spheres and honest normal rank`, line 1529, and delete the `[hs5]` definition).

## R06 (P3) — TeX-only subscripts outside code spans (gate `tex (7)`)

Location: README lines 876, 882, 896, 902, 904, 912, 1101, e.g. `g_{γ(t)}` at 876 and `D_{η_def}(C)` at 902.

Repair: put each expression in a code span or write the subscript in Unicode or words; the rule is quoted in the gate output.

## R07 (P3) — pull-request URLs as citations

Location: README lines 120, 165, 671: `[HomotopySpheres …](https://github.com/TauCetiProject/TauCetiRoadmap/pull/284)`.

Claim: cross-roadmap citations name the roadmap and section, never a pull request; the number is also stale.

Witness: HomotopySpheres at its open head has §3A.1 (line 663) and Stage 4B.

Repair: "HomotopySpheres §3A.1", "HomotopySpheres Stage 4B", "HomotopySpheres" with no link.

## R08 (P3) — dead relative links, two of them regressing main

Location: README line 54 `../HopfRinow/README.md`; lines 114 and 958 `../ConformalMapping/README.md`; line 173 `../RicciFlow/README.md`.

Witness: on main HopfRinow and ConformalMapping live under `Completed/`, and main's copy of this README already reads `../../Completed/HopfRinow/README.md` (line 54), `../../Completed/ConformalMapping/README.md` (lines 114, 892); this branch is based on an older main and still carries the old paths, so merging it reverts them. RicciFlow is not on main (open pull request).

Repair: merge or rebase onto main so its three link fixes are kept; name RicciFlow without a link.

## R09 (P3) — supplier labels that the suppliers do not use

Location: README lines 94 and 1251 ("VariationalMethods V2.3–V2.4/V3–V5.2"); line 705 ("PositiveMass P2.3").

Witness: `roadmaps resolve` reports both as found nowhere (worker's `citations.md`); VariationalMethods at its open head has `### 2.3 Energy space and forcing maps`, `### 2.4 Semibounded shifts`, Layers 3–5 with `### 5.2`; PositiveMass at its open head has `### 2.3 Maximal-volume rigidity`.

Repair: "VariationalMethods §2.3–§2.4 and Layers 3–5.2"; "PositiveMass §2.3".

## R10 (P3) — form of the two new Lean files

Location: `TauCetiRoadmap/RiemannianGeometry/CurvaturePolarizationTargets.lean` lines 1–2 (`import Mathlib.Algebra.Module.LinearMap.Basic`, `import Mathlib.Basic.Real.Basic`), 14, 17 (`numerator`, `mixed` without docstrings), 32–41 (`eq_of_numerator_eq`); `TauCetiRoadmap/RiemannianGeometry/HopfPictureTargets.lean` lines 1–4 (four `Mathlib.…` imports), 19, 23 (`diskLift`, `stereo` without docstrings); README lines 215–216 and 607–608, which link or name the files but none of their declarations.

Claim: the Lean form rules apply to every `.lean` file in the folder: a single `import Mathlib` (never `Mathlib.<submodule>` lines), a docstring on every declaration, and every Lean name appearing in the README. None of the eleven names (`numerator`, `mixed`, `polarization`, `eq_of_numerator_eq`, `diskLift`, `stereo`, `hopfNorth`, `diskLift_sphere_and_chart`, `diskLift_orbit_iff`, `diskLift_orbit_surjective`, `axis_framing_derivative`) occurs in the README (grep count 0 each). Mathematically the files are sound (table rows below) but their statements are Checks (a norm computation, a chart formula, two derivative values, an orbit relation) and one one-line corollary (`eq_of_numerator_eq` follows from `polarization` by dividing by 24), not headline theorems.

Repair: fold the statements into the README as **Checks** of R1.2 and of the Hopf block (the README keeps the mathematics) and delete both files; or, if kept, replace the import lines by `import Mathlib`, add the docstrings, delete `eq_of_numerator_eq`, and name every kept declaration in R1.2 and R3.3c.

## R11 (P3) — padding in `Suggested.lean`

Location: lines 242–244 (`immersionNormal_eq_normalSubspace`, `rfl`), 306–318 (`norm_veronese`, `inner_fderiv_veronese`, `veronese_fibers`: small computations mirroring R8.5), 333–391 (`brokenNode_first`, `brokenNode_last`, `continuous_brokenNode`, `continuous_brokenDiscreteEnergy`, `isOpen_brokenEnergyDomain`, `brokenDiscreteEnergy_edge_bound`, `brokenEnergyDomain_edge_lt`: proved API lemmas), and the definitions `brokenNode`, `brokenDiscreteEnergy`, `brokenEnergyDomain`, `veronese` that no headline uses.

Repair: delete them from `Suggested.lean`; the README (R3.2, R8.5) keeps each as a target or Check.

## R12 (P3) — README shape: no `*Needs:*` lines, no Checks lists, undeclared backticked names

Location: whole README; e.g. lines 1135 (`volumeVariation_isContDiff`), 1226 (`minimalNormalSecondVariation`), 1238 (`hypersurfaceJacobiOperator`), 1260, 1270, 1276, 1278.

Claim: the house shape has `*Needs:*` lines, `## Exact supplier contracts`, `**Checks.**` lists and `### Dependencies`; without `*Needs:*` lines the dependency check has no edge from this roadmap to check (its "0 problems" is vacuous: this README cites PseudodifferentialOperators, HomotopySpheres, VariationalMethods, UnboundedOperators and LieGroupoidsPoisson, all only in open pull requests). A backticked name of this roadmap's own claims a declaration in `Suggested.lean`; the seven listed are not declared there (the gate's `readme-ids` rule does not catch them). The three new passages continue the old shape: the Hopf block and the R8.3 bridge have no Checks and no `*Needs:*` line.

Repair: unbacktick the seven names (or declare them), and give at least the sections touched here `*Needs:*` lines and Checks, e.g. R1.2: the three Check rows of the table below; R3.3c Hopf block: `j(u)∈S³`, `σ(j(u))=(Re u,Im u,0)`, `H(b)=south`, the two `dH` values; R8.3: `KR_θK=R_(−θ)`, `Ku₁=2v₁`, the two characters `e^(iθ)` and `e^(−iθ)` of `R_θ` on `(x₁∓ix₂)`.

## R13 (P3) — the projective metric block has no locator

Location: README lines 297–321 (**Projective metric examples**, a sampled target).

Claim: the curvature range [1,4], the period π, the `−½ Re tr(XY)` normalisation and `ω_g = π·ω_FS` are stated without a source and theorem number; the target could only be checked by computation (table rows below).

Repair: add the locators (O'Neill, *The fundamental equations of a submersion*, Michigan Math. J. 13 (1966), Corollary 1 for `K = K̃ + ¾|[X,Y]^v|²`, and a textbook for the Fubini–Study curvature `1 + 3⟨X,JY⟩²`), and write the explicit curvature formula into the block.

## R14 (P3) — R1.2 cites an unidentifiable course note and carries process narrative

Location: README lines 213–214 ("Derive it independently of the dense source display in Math240 `0224_028` p7, whose handwritten normalization remains qualified.").

Claim: "Math240 `0224_028` p7" names no work in the References, is not a locator into any legal source a reader can open, and "remains qualified" is process narrative; the roadmap is timeless.

Witness: `grep -n -i 'math240\|0224_028' README.md` hits only these two lines; the References (lines 1590–1622) list no such text. The verified locator for the reconstruction is Andrews, Lecture 16, Proposition 16.2.1, p. 154 (author page), which the same paragraph already cites.

Repair: delete the sentence.

## R15 (P3) — the stereographic Hopf block has no locator

Location: README lines 569–608.

Claim: a new target block (stereographic chart from `P=(0,i)`, Clifford tori, the disk `j`, the quotient `D²/∂D²→CP¹`, the framed north fibre) with no source; its only citation is HomotopySpheres §5.0, which supplies the Pontryagin–Thom side, not the picture.

Repair: add a locator for the stereographic Hopf-fibre picture (for instance Lyons, *An elementary introduction to the Hopf fibration*, Mathematics Magazine 76 (2003), with the section checked against the text), and record it in `sources.toml`.

## Verified sound

**Gate and tooling.** The gate rerun at this head reproduces the worker's result: `blob=8 tex=7 sorry-data=4`, all other counters 0 (the worker's run adds `build=0`: `lake build TauCetiRoadmap.RiemannianGeometry.Suggested` passes at this branch's pins). Dependency check: `depcheck: 204 roadmaps, 1651 edges, 0 problem(s)`, no UPWARD or CYCLE line (vacuous for this roadmap, see R12; RiemannianGeometry is on main and not listed in the merge order). Pins of `lake-manifest.json` on this branch: Tau Ceti `a91d3aa`, Mathlib `6b7abb3c` (main pins `358314d4` / `f6090c70`); every library check below is at the branch's pins. Diff outside the folder: none (`git diff --stat origin/main...HEAD` lists only the three folder files). `Suggested.lean`: no diff against main.

**Elaboration.** `lake env lean` on `CurvaturePolarizationTargets.lean`: two `declaration uses sorry` warnings (lines 22, 32), nothing else, 2.2 s. On `HopfPictureTargets.lean`: four `sorry` warnings (lines 28, 34, 40, 52), nothing else, 4.7 s (`Mathlib.Basic.Real.Basic` exists at this pin). The scratch headline probe (R03): two `sorry` warnings, 11 s, and the `#check @` types agree with the statements quoted there.

**Elaborated signatures.** All 37 declarations of `Suggested.lean` compared with the README (the worker's `signatures.md`); the 14 declarations flagged as having lost a section binder are `def`s or explicitly `omit`ted theorems whose types do not mention the binder (`IsJacobiFieldOn`, `extendIntervalField`, `cOneEndpointZeroFields`, `indexForm`, `immersionNormal`, `secondFundamentalForm`, `shapeOperator`, the three `euclidean…` definitions, `immersionNormal_eq_normalSubspace`, `brokenNode`, `brokenNode_first`, `brokenNode_last`); no `sorry`'d theorem lost a hypothesis its README statement carries. The two new files have no section-variable hypotheses beyond `[AddCommGroup V] [Module ℝ V]`, which both theorems use.

**Library declarations opened at the pins.** `TauCeti.Manifold.riemannianExp` (`Riemannian/Geodesic/Exponential.lean:98`, junk value `p` off `expDomain`), `TauCeti.Manifold.IsGeodesicCurveOn` (`Riemannian/Geodesic/Basic.lean:98`: `UniqueDiffOn`, `ContMDiffOn … 2`, vanishing `accelerationWithin`), `TauCeti.exists_isTubularNeighborhood_normalBundle` (`TubularNeighborhood/Euclidean.lean:454`), `TauCeti.instRiemannianBundleSphere` / `instIsContMDiffRiemannianBundleSphere` (`Riemannian/Sphere.lean:73, 78`), Mathlib `IsCoveringMap` (`Topology/Covering/Basic.lean:287`), `Diffeomorph` (`Geometry/Manifold/Diffeomorph.lean:82`), sphere charted-space and manifold instances (`Geometry/Manifold/Instances/Sphere.lean:351, 385, 417`). The pinned Tau Ceti has no Jacobi fields, no parallel transport and no curvature polarization: `constant_sectional_tensor_iff`, `schur` and `polarization` are not duplicates at the pin.

**Cross-roadmap citations resolved.** HomotopySpheres §5.0 exists at its open head (`### 5.0 Finite ambient spheres and honest normal rank`, line 1529; its Checks name the Hopf map with `H=+1` and the domain-reflection sign), so the comparison R3.3c asks for has a target; the `[hs5]` anchor slug matches that heading (R05 is about the link form). ClassicalGroups Layer 3A at the open head of its revision pull request: line 703, basis and torus at 740–760, antidiagonal Borel at 757–780 (R04 is about the owner). GeometricTopology Layer 1 tubular neighbourhood on main (line 218). Andrews, Lecture 16, Proposition 16.2.1 at p. 154 of the ANU lecture notes (author page, fetched): "the curvature tensor is determined by the sectional curvatures", proved by an orthonormal polarization with `K(σ)=R(e₁,e₂,e₁,e₂)`; the README's caveat about translating its slot convention is right (that convention has the sign of `r(x,y,x,y)=−Q(x,y)` in the README's slots).

**Ownership against open work.** Curvature reconstruction from sectional curvature, the Hopf stereographic picture and the SO(N) harmonic highest-weight bridge were searched by object (`roadmaps grep` for "polariz", "Clifford tor", "stereographic", "harmonic polynomial", "isotropic basis") in the roadmaps on main and the open heads this brief lists: no other roadmap states them; SmoothBundlesConnections (on main) owns the S³→CP¹ Hopf bundle itself, which R3.3c cites, and ClassicalGroups owns the classification. Ownership against open pull requests whose files the brief does not give was not checked.

**Adversarial table.** Rows cover the three new passages, the two new Lean files, the sampled targets, the headline theorems and every target a finding touches.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| R1.2 `24 r = B_Q(x,w;y,z) − B_Q(y,w;x,z)` | constant curvature +1 tensor `r=⟨z,y⟩⟨x,w⟩−⟨z,x⟩⟨y,w⟩`, random x,y,z,w in ℝ⁵ | 24r = 20.37824195, RHS = 20.37824195, difference 0 | holds | none |
| same | random sum of six Kulkarni–Nomizu squares (spans all algebraic curvature tensors) | 24r = 1503.85086871, RHS equal, difference 0; symmetry residuals 0 | holds | none |
| same, hypothesis test | tensor with skew and pair symmetry but no Bianchi (`r_const + t(x,y)t(z,w)`, t skew) | Bianchi residual 13.97; 24r = −1.76, RHS = −113.52 | fails, so `hbianchi` is load-bearing | none |
| R1.2 normalization Check | orthonormal e₁,e₂, constant curvature +1, z=y, w=x | `Q(e₁,e₂)=1`; `B_Q(e₁,e₁;e₂,e₂)=16`, `B_Q(e₂,e₁;e₁,e₂)=−8`; (16+8)/24 = 1 | matches | none |
| R1.2 `Q=0` on dependent pairs | y = 3x | `Q(x,3x)=9 r(x,x,x,x)=0` by skew | holds | none |
| `eq_of_numerator_eq` | r, s with the symmetries, `Q_r=Q_s` | `24(r−s)=0` by the identity, so r=s | holds; one-line corollary (R10) | none |
| Andrews Prop 16.2.1 slot convention | sphere, e₁,e₂ orthonormal | Andrews `K=R(e₁,e₂,e₁,e₂)=+1`; README `r(e₁,e₂,e₁,e₂)=⟨e₁,e₂⟩⟨e₁,e₂⟩−⟨e₁,e₁⟩⟨e₂,e₂⟩=−1` | opposite sign in that slot order, as the README warns | none |
| Hopf block `j(u)∈S³` | any u | `4|u|²+(|u|²−1)²=(1+|u|²)²` | holds for all u (Lean states it for all u) | none |
| `σ(j(u))=(Re u,Im u,0)` | any u | `1−Im z₁=2/(1+|u|²)>0`; `Re z₀/(…)=Re u`; `Re z₁=0` | holds, denominator positive | none |
| exceptional fibres | `z₁=0`: `(z₀,0)`, `|z₀|=1`; `|z₁|=1`: `(0,e^(iβ))` | `σ=(Re z₀,Im z₀,0)` unit circle in xy-plane; `σ=(0,0,cos β/(1−sin β))`, all of the z-axis, plus P at β=π/2 | matches | none |
| orbit meets `j(int D²)` once | `z₁≠0`, `s=|z₁|` | `ζ=−i s/z₁` unique on the circle; `|u|²=(1−s)/(1+s)∈[0,1)`; `2|u|/(1+|u|²)=√(1−s²)=|z₀|` consistent; `u` unique since `u↦2u/(1+|u|²)` is injective on the open disk | holds | none |
| boundary fibre | `|u|=1` | `j(u)=(u,0)`, the whole `z₁=0` fibre | holds | none |
| `diskLift_orbit_iff` | `|u|<1`: `z₁=−it_u`, `t_u>0`; `|u|=|v|=1` | `ζt_u=t_v` forces ζ=1, hence u=v; if `|v|=1` then `t_v=0≠t_u`; for `|u|=|v|=1`, `ζ=v/u` | both directions hold | none |
| `diskLift_orbit_surjective` | `z₁=0` | `u=z₀`, ζ=1 | holds (with the previous row) | none |
| `H=R∘h`, north fibre | `R(x,y,z)=(x,−y,−z)`; `(0,z₁)`, `|z₁|=1` | `det R=+1`; `H=(0,0,1)`; `|z₁|²−|z₀|²=1` with `|z₀|²+|z₁|²=1` forces `z₀=0` | `L={z₀=0}` | none |
| `axis_framing_derivative` | at `(0,ζ)`, directions `(ζ/2,0)`, `(iζ/2,0)` | `d(2z̄₀z₁)=2ā z₁`: `|ζ|²=1` → `(1,0,0)`; `−i` → `(0,1,0)`; third component `2Re(z̄₁b)−2Re(z̄₀a)=0` | matches; both directions lie in the normal plane `{(a,0)}` of L in TS³ | none |
| disk centre and `b` | `u=0`; `b=(1,0)` | `j(0)=(0,−i)=[0:1]`, `H=(0,0,−1)` south; `H(1,0)=(0,0,−1)` south | matches | none |
| Clifford tori | `(√(1−r²)e^(iα), r e^(iβ))`, `ζ=e^(iθ)` | both angles shift by θ | slope (1,1) | none |
| R8.3 `K` | `diag(1,−1)` per plane, N=2r or 2r+1 | `K²=I`, `KᵀK=I`, `det K=(−1)^r` | holds | none |
| `KR_θK=R_(−θ)` | one plane | `[[1,0],[0,−1]][[c,−s],[s,c]][[1,0],[0,−1]]=[[c,s],[−s,c]]` | holds | none |
| `Ku_i=2v_i`, `Kv_i=u_i/2` | `u=e₁+ie₂`, `v=(e₁−ie₂)/2` | `Ku=e₁−ie₂=2v`; `Kv=(e₁+ie₂)/2` | holds | none |
| torus coordinate of `R_θ` | `R_θu₁`, `R_θv₁` | `R_θu₁=e^(−iθ)u₁`, `R_θv₁=e^(iθ)v₁`; supplier's `t₁` is the eigenvalue on `u₁` | `t₁(R_θ)=e^(−iθ)`, `t₁(σ(R_θ))=e^(iθ)` as stated | none |
| `U_Kρ(g)U_K⁻¹=ρ(σ(g))` | `ρ(g)p(x)=p(g⁻¹x)`, `U_Kp(x)=p(Kx)`, `K⁻¹=K` | `p(Kg⁻¹Kx)=p((KgK)⁻¹x)` | holds | none |
| `U_K(x₁−ix₂)^d=(x₁+ix₂)^d` | | `(Kx)₂=−x₂` | holds | none |
| characters of `(x₁∓ix₂)^d` | `ρ(R_θ)` | `(x₁−ix₂)∘R_(−θ)=e^(iθ)(x₁−ix₂)`: character `dε₁=e^(idθ)`; `(x₁+ix₂)`: `e^(−idθ)=t₁^d` | both as stated; `(x₁+ix₂)` vanishes on `u₁`, is 1 on `v₁`, so it is the `t₁`-eigenfunctional | none |
| SO(2) case, `dim H_d` for m=1 | d=0,1,2 | `binom(1+d,d)−binom(d−1,d−2)` = 1, 2, 2 | two characters for d≥1, one for d=0 | none |
| `σ` inner or not | N=2r, r odd; N odd | `det K=−1`, K∉SO: outer; N odd: `−K∈SO`, inner | "need not be inner" is right | none |
| `schur` | n=2 (excluded), n≥3 connected | hypothesis `3≤finrank` | matches R1.3 | none |
| `bonnetMyers_distance` | unit Sⁿ, `Ric=(n−1)g`, λ=n−1 | bound π = diameter | sharp; n≥2 enforced | none |
| `riemannianDist_eq_sSup_smooth` | (0,1)⊂ℝ, f=id | sup=|x−y|=dist | holds without completeness; `[ConnectedSpace M]` in scope | none |
| `jacobi_eq_zero_of_nonpositive_curvature` | `hK=⟨R(u,v)v,u⟩≤0` | matches the K sign convention of line 28 | holds | none |
| Cartan–Hadamard probe | flat ℝⁿ, p=0 | `exp_0=id`, a covering | consistent; `IsCoveringMap` needs surjectivity, supplied by completeness | none |
| three geodesics probe | round S² | three great circles, T=2π, pairwise distinct ranges | satisfies the statement | none |
| R6 regression `I_M(X,X)=1/b−1` | unit circle, p=(1,0), γ(t)=(1−t,0), X=(1−t/b)e₂ | `∫₀^b(1/b)²dt=1/b`; inward normal η=−position gives `S_ηX=X`, `⟨SX(0),X(0)⟩=1` | matches | none |
| Projective block `K∈[1,4]` | O'Neill `K=1+¾|[X,Y]^v|²`, `|[X,Y]^v|²=4⟨X,JY⟩²` | `K=1+3⟨X,JY⟩²`; Y⊥JX gives 1, Y=JX gives 4 | attained for d≥2; d=1 constant 4 = S²(½) | none |
| Projective block, period π | `γ(t)=cos t·x+sin t·y`, y⊥x, y⊥ix | `γ(π)=−x∼x` | primitive period π | none |
| `⟨X,Y⟩=−½Re tr(XY)` | `X_v=[[0,−v*],[v,0]]` | `−½tr(X_v²)=|v|²=|X_ve₀|²` | normal homogeneous metric = round quotient | none |
| `ω_g=π·ω_FS` | CP¹=S²(½) | `4π·¼=π`, `∫ω_FS=1` | holds; `ω_g(u,Jv)=g(u,v)` | none |
| R1 bi-invariant `R(X,Y)Z=−¼[[X,Y],Z]` | `∇_XY=½[X,Y]`, Jacobi identity | `¼[[X,Y],Z]−½[[X,Y],Z]` | matches; `K=¼|[X,Y]|²≥0` | none |
| R1 conformal `Ric̃`, `Scal̃` | general n, `Δ⁺=−tr Hess` | `Ric̃=Ric−(n−2)(Hess u−du⊗du)+(Δ⁺u−(n−2)|du|²)g`; `Scal̃=e^(−2u)(Scal+2(n−1)Δ⁺u−(n−1)(n−2)|du|²)` | matches the classical formulas with the sign of Δ⁺ | none |

**One-tactic probe.** Decided by reading (the file is byte-identical to main and was probed in the previous review): no `sorry`'d theorem of `Suggested.lean` or of the two new files closes by `simp`, `rfl`, `infer_instance` or a single library lemma; the padding named in R11 is proved API and small computations, the Check-level statements of the new files are listed in R10.

**Read but not re-derived.** R3.3–R3.4, R4.1–R4.8, the whole of R4.9, R5b, R7 and the untouched parts of R8 are text this pull request does not change; they were read for gate, citation, shape and policy defects (R05–R09, R11–R13) but their analytic estimates were not recomputed in this round.

## Not verifiable

- J. M. Lee, *Introduction to Riemannian Manifolds*, 2nd ed.: the README's principal convention reference, paywalled (Springer); cited by locator only.
- J. Milnor, *Morse Theory*: JSTOR link paywalled; §6 Theorem 6.6 and Lemma 6.5 (used in the R01 repair) cited by locator only.
- "Math240 `0224_028` p7" (README line 213): not identifiable as any work; see R14.
- The projective metric block and the stereographic Hopf block (both sampled) cite no source; their mathematics was verified by computation only (table rows above); see R13 and R15.
- O'Neill, *The fundamental equations of a submersion* (1966): only the paywalled landing page through the sources service; not needed for a finding.

## Source issues

- none
