# Review of MorseTheory (pull request #1682 at 1647f55)

**Verdict:** needs changes

This is a full review of `TauCetiRoadmap/MorseTheory/` at head 1647f55be2c529d28eef8cc7ecbbf117ab6ffdbd. The last review read the same head, and the folder has not changed since (0 changed lines). There is one finding, and it blocks.

- R01 is the last review's R01. It re-raises the repair report's H01. Only a merge of `origin/main` into the branch can repair it. That merge is a worker or human step: it touches `lake-manifest.json` and `lean-toolchain`. Nothing in `README.md` or `Suggested.lean` needs to change before the merge.
- I reviewed the whole roadmap again: the sources sample, the adversarial pass, citations, ownership, the Lean signatures and the padding probe. No other finding survived.

## R01 (P1) — Branch not merged with main: most Tau Ceti declarations the README and `Suggested.lean` call "pinned" are missing at this head's pin

Re-raised: H01

**Location:**
- `TauCetiRoadmap/MorseTheory/README.md:38–40`: "The pinned Tau Ceti Morse library already proves a large part of Layers 1–4 and 6, and the targets it proves are consumed by the names that the Tau Ceti contract lists, not restated".
- The same claim runs through the Tau Ceti contract (lines 149–400), the "pinned" sentences of §1.1–§4.4 and §6.1, and `TauCetiRoadmap/MorseTheory/Suggested.lean:19–35`.

**Claim:** The pins have not moved since the last review.
- This head's `lake-manifest.json` pins Tau Ceti a91d3aaf, Mathlib 6b7abb3c and Lean v4.35.0-rc3.
- Main (now b0fe353) pins Tau Ceti 2fd255d, Mathlib 1b1ccf4 and Lean v4.36.0-rc2.
- The merge base is still ffcc9d31, and `git merge-tree --write-tree origin/main HEAD` reports CONFLICT in `README.md` and `Suggested.lean`.

I indexed the 88 backticked `TauCeti.`-prefixed names in the README against both Tau Ceti trees (the tree at 2fd255d is extracted from the package's git):
- 76 exist only at 2fd255d;
- 12 exist at both pins (`IsBicollar`, `IsBicollared`, the two `IsBicollar` side lemmas, `brownBicollaring`, `boundaryChartedSpace`, `isManifold_boundary`, `sectionZeroChartedSpace`, `natCard_zerothHomotopy_sphere_compl_range_eq_two`, `manifoldMorseIndex_neg_add_manifoldMorseIndex_eq_finrank` and the two finite-CW singular-homology lemmas);
- none exists only at a91d3aaf.

Several Tau Ceti names in the root namespace also exist only at 2fd255d: `IsLocalExtr.mem_criticalPoints`, `IsOpen.image_of_continuousOn_of_injOn`, `Homeomorph.coe_apply_mem_frontier_iff`, `Homeomorph.radialExtension`, `Submodule.free_of_isPrincipalIdealRing`, and the `ContMDiffMap` strong-Whitney names.

At the pin that the build and the gate use, this has three consequences:
1. **The deferred targets have no owner.** Every target of Layers 1–4 and 6 that the README defers as pinned is absent at a91d3aaf. Examples: `TauCeti.criticalPoints`, `TauCeti.BoundarylessModel`, `TauCeti.exists_sublevelDeformation`, `TauCeti.IsMorse.exists_relCWComplex_sublevel_deformation`, `TauCeti.lsCategoryCount_univ_le_totalCriticalCount`, `TauCeti.exists_isMorse_isProperMap_bddBelow`, and Reeb's `TauCeti.IsMorse.nonempty_homeomorph_sphere_of_totalCriticalCount_eq_two`. The same holds for the §4.4 inputs: invariance of domain and `TauCeti.nonempty_homeomorph_sphere_of_union_closedBall`.
2. **A statable headline is missing.** §3.2's headline, a proper Morse function bounded below on every manifold here, is statable at a91d3aaf. I elaborated `∃ f : M → ℝ, TauCeti.IsMorse I f ∧ IsProperMap f ∧ BddBelow (Set.range f)` in a scratch file at this pin: one `sorry` warning, nothing else. No theorem of `Suggested.lean` implies it, and the file omits it as "pinned".
3. **The docstring names missing declarations.** `Suggested.lean:20` names `TauCeti.criticalPoints I f`, and lines 22–35 name eleven declarations as proved. None of them exists at a91d3aaf.

The gate passes only because `Suggested.lean` imports four modules that exist at both pins.

**Witness:** At a91d3aaf, `TauCeti/Geometry/Manifold/Morse/` has 4 entries (`Basic`, `Index`, `Prod`, `Sphere/`). At 2fd255d it has 35, among them `CriticalPoints.lean`, `Reeb.lean`, `Deformation.lean` and `GradientFlow.lean`.

**Why H01's reason does not settle it:** H01 is right that a repair job cannot do the merge, because it touches `lake-manifest.json` and `lean-toolchain`. But nobody has done the merge, so at the pin the build uses the contract is still false, and no edit to the two roadmap files can repair that. The branch also conflicts with main in both files, so it cannot merge as it stands.

**Exact repair (for the worker or a human, not a repair job):**
1. Merge `origin/main` (b0fe353) into the branch, resolving `README.md` and `Suggested.lean` to this head's text. This brings in Tau Ceti 2fd255d, Mathlib 1b1ccf4 and Lean v4.36.0-rc2.
2. In `Suggested.lean`:
   - import `TauCeti.Geometry.Manifold.Morse.CriticalPoints` and `TauCeti.Geometry.Manifold.Riemannian.Gradient.Basic`;
   - write `x ∈ TauCeti.criticalPoints I f` for the zero set, `(TauCeti.criticalCount I f j).toNat` for the counts, `TauCeti.totalCriticalCount I f = 2` for the two-point hypothesis and `-TauCeti.Manifold.mgradient I f` for the field. At 2fd255d these are the definitional bodies: `criticalPoints` at `CriticalPoints.lean:87`, `totalCriticalCount` and `criticalCount` at 342 and 348 (`encard`), `mgradient` at `Gradient/Basic.lean:73`;
   - delete the sentence at lines 19–20 that explains the zero-set spelling;
   - add Reeb's theorem and the pinned alternating inequalities to the docstring's list of consumed headlines.
3. Re-elaborate the file and re-run the gate at the new pins.
4. Update the pull request's title and description. They still announce "Palais–Smale compactness and nonproper gradient convergence" and a file `PalaisSmaleTargets.lean`. README lines 74–79 place Palais–Smale theory outside this roadmap, and no such file exists.

Tested at 2fd255d by reading the sources: every contract entry I opened carries the hypotheses the README states (list under Verified sound). I cannot run Lean at main's pins from this worktree.

## Previous findings

- **R01 (merge main into the branch): not repaired.** The head is unchanged, the merge base is still ffcc9d31, and `lake-manifest.json` still pins Tau Ceti a91d3aaf. README line 38 still reads "The pinned Tau Ceti Morse library already proves a large part of Layers 1–4 and 6". This is R01 above.

## Verified sound

**Gate, dependencies, elaboration and signatures.**
- The worktree is clean at 1647f55. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/MorseTheory'` is empty. Inside the folder only `README.md` and `Suggested.lean` differ from main.
- Gate rerun on this head: every check is 0 and the gate prints `OK`, matching `scratch/gate.md`.
- Dependency check output: `depcheck: 239 roadmaps, 2355 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line. MorseTheory and every roadmap it cites are on main: DifferentialGeometry, AlgebraicTopology, GeometricTopology, CharacteristicClasses, ComplexKahlerGeometry, ComplexManifolds, DGFloer, HeegaardFloer, RiemannianGeometry and SymplecticGeometry/ConvexityToric.
- `lake env lean TauCetiRoadmap/MorseTheory/Suggested.lean` prints only 7 `declaration uses sorry` warnings, at lines 68, 94, 109, 124, 145, 159 and 173.
- I put `#check @name` for all 8 declarations in one scratch file, with universes printed. Every elaborated type matches `scratch/signatures.md` and its README statement:
  - the five manifold theorems carry the standing binders (finite-dimensional E, boundaryless I, T2, `IsManifold I ∞`, second countable);
  - `omit` drops these binders from Brown's theorem and the two-open-cell lemma, whose statements do not mention M;
  - `bettiNumber.{u}` takes k and X in one universe, and `strong_morse_inequalities` puts k in M's universe, as the Conventions say;
  - in `exists_morseCWModel`, X lives in an independent universe u_7. That is harmless: the model has countably many cells, so it exists in every universe.
  Nothing changed after the check.
- **One-tactic probe.** On a scratch copy I replaced each `sorry` by `first | rfl | simp | infer_instance | aesop | trivial | decide | exact ⟨_, rfl⟩ | omega`. All 7 theorems fail (errors at lines 75, 103, 116, 136, 152, 164 and 184), so there is no padding. No declaration restates a definition or mirrors a Check.

**Library declarations opened (file and line at the pin).**
- At a91d3aaf (the head's pin):
  - `TauCeti.IsMorse` is `IsMorseOn I f univ`. Its smoothness clause gives the `IsMorse` headlines C^∞.
  - `IsBicollar` is a structure with fields `isOpenEmbedding` and `apply_zero` (`#print`), exactly as README lines 386–393 say.
  - `JordanBrouwer.lean:212`, `natCard_zerothHomotopy_sphere_compl_range_eq_two`: for a continuous injection of the unit sphere of a finite-dimensional E into the unit sphere of F with `finrank F = finrank E + 1`, the complement has `Nat.card` of path components 2. This matches README lines 364–369.
  - `Morse/Index.lean:105` (`manifoldMorseIndex_le_finrank`), and lines 140 and 154 (`manifoldMorseIndex_neg_add_manifoldMorseIndex_eq_finrank`, under chart-Hessian nondegeneracy and its critical-point form). These match README lines 144–146.
  - `MFDeriv/Chart.lean:149`, `MDifferentiableAt.mvfderiv_eq_fderiv_comp_extChartAt_symm`.
  - The vector-space files `Analysis/Calculus/Morse/{Basic,NormalForm,Generic,GradientFlow,Convergence,Linearization,ExponentialConvergence,SpectralSplitting}`, `exists_congruence_of_symmetric_family` (`NormalForm.lean:217`) and `sqrtNearOne` (`Normed/Algebra/SquareRoot.lean:78`) all exist, as Layers 5–6 cite them.
  - No Morse–Bott predicate exists in Tau Ceti or Mathlib at either pin, so the docstring is right that Layer 5 is not statable.
- At 2fd255d (main's pin, read from the extracted tree):
  - `criticalPoints` (`CriticalPoints.lean:87`) is `{x | mvfderiv I f x = 0}`. `totalCriticalCount` (342) and `criticalCount` (348) are `encard` values.
  - `mgradient` (`Riemannian/Gradient/Basic.lean:73`) is `rieszDual x (mvfderiv I f x)`, so the §6.1 headline's field is its body, as README lines 1461–1463 say.
  - `exists_tendsto_maximalIntegralCurve_neg_mgradient` (`GradientFlow.lean:261`) needs `T2Space`, `IsManifold I 2`, `BoundarylessManifold`, a C¹ metric, C² f, a compact K holding the forward part of the maximal curve, and finitely many critical points in K. `exists_riemannianEDist_le_mul_exp_maximalIntegralCurve_neg_mgradient` (`ExponentialConvergence.lean:303`) needs a nondegenerate limit and gives `∀ᶠ t in atTop`. The §6.1 headline's C^∞ hypotheses imply all of these, and README lines 1471–1485 supply them.
  - `IsMorse.nonempty_homeomorph_sphere_of_totalCriticalCount_eq_two` (`Reeb.lean:148`, under compact, T2 and `IsManifold I ∞`) is implied by `nonempty_homeomorph_sphere_of_two_criticalPoints`, as README line 1116 says.
  - `nonempty_homeomorph_sphere_of_union_closedBall` (`Hemisphere.lean:377`) takes two closed sets covering X, each homeomorphic to a closed ball of F, with intersection carried onto the unit sphere, and `finrank E = finrank F + 1`. This matches README lines 378–385.
  - `IsOpen.image_of_continuousOn_of_injOn` (`InvarianceOfDomain.lean:160`), `Continuous.isOpenEmbedding_of_injective` (201), `Homeomorph.coe_apply_mem_frontier_iff` (257).
  - `ContMDiffMap.exists_isMorse_mem_ball_sub_compl` and `exists_isMorse_isProperMap_mem_ball` (`Generic/Strong.lean:110, 279`), `Submodule.free_of_isPrincipalIdealRing` (`LinearAlgebra/FreeModule/PID.lean:42`), `LSCategoricalCover.pad` (`Topology/Homotopy/LusternikSchnirelmann.lean:182`, needing `[Nonempty X]`, as README line 1046 says).
  - `BoundarylessModel` (`ModelTransport/Boundaryless.lean`).
- In Mathlib at the head's pin:
  - `onePointEquivSphereOfFinrankEq` (`Compactification/OnePoint/Sphere.lean:34`, for `finrank V + 1 = card ι`) and `Homeomorph.onePointCongr` (`OnePoint/Basic.lean:629`), as README lines 128–131 say;
  - `EuclideanSpace.instChartedSpaceSphere` (`Instances/Sphere.lean:351`), `finrank_real_of_complex` (`LinearAlgebra/Complex/FiniteDimensional.lean:56`), `Module.finrank_pi` (`Dimension/Constructions.lean:289`), `norm_iteratedFDerivWithin_comp_le` (`ContDiff/Bounds.lean:346`) and `riemannianEDist` (`Riemannian/PathELength.lean:207`).
- No Betti-number definition exists at either pin or in another roadmap's `Suggested.lean` (the roadmap grep finds only this roadmap's `bettiNumber`, on main and at this head), so `bettiNumber` duplicates nothing.

**Cross-roadmap citations, resolved on main (b0fe353).**
- AlgebraicTopology:
  - Stage 4 item 4 owns `diskBoundaryRelCW` and the coproduct relative CW construction, and names "MorseTheory M2 consumes these disk pairs".
  - Item 5 owns `relativeCWPushout`, `homotopyPushoutGluingComparison`, `cofibrationTowerHomotopyEquivalence`, the compact-subset finite-stage factorization and `cwSubcomplexTowerUnion`.
  - Item 6 is the real projective space.
  - Stage 6 item 1 has the integral and PID universal-coefficient sequence. `lsCupLength` and the bound `lsCupLength X R+1 ≤ lsCategoryCount X X` appear at lines 1117–1123, after item 2.
- DifferentialGeometry: Layer 3 (line 371) and Layer 5 with `boundaryOrientation_spec` (503, 509). §10.2 Sard and §12.2–§12.3, with the gradient through `rieszDual` and the Hessian, are inside Layers 10 and 12 (877, 910).
- GeometricTopology Layer 1 (177); CharacteristicClasses C2 (728); ComplexKahlerGeometry K7 (1405); ComplexManifolds Milestone 1 (172; the anchor at README line 1120 resolves).
- DGFloer: Layer 1 item 3 and `SpectralObject` (lines 225 and 391).
- HeegaardFloer Lane M (70); RiemannianGeometry R3 (82, 89, 113); SymplecticGeometry/ConvexityToric T2 (73).

**Consumers and dropped ids.**
- HeegaardFloer on main cites `#m2-compact-band-deformation-handles-and-cells` and `#m5-morsebott-normal-bundles-and-attachments` (lines 647 and 1064). README lines 462–468 map every old anchor to the new heading. The two headings (lines 577 and 1349) compute to the mapped targets.
- Open consumers cite the labels M1–M6, which the layer headings keep: MorseNovikov (#1161), RicciFlow (#1023, M1–M3 including "the handle homeomorphism", still §2.2), DGFloer (#963) and HomotopySpheres (#284, M5).
- `scratch/overlaps.md` lists no other dropped id and no other pull request changing this roadmap.

**Ownership against open pull requests.**
- No open roadmap owns the Morse CW model, the ℕ[t] identity, the degenerate two-critical-point sphere theorem or the trapped-curve convergence. MorseNovikov, RicciFlow, DGFloer and HomotopySpheres consume these by label.
- Brown's generalized Schoenflies theorem is also planned in GeometricTopology's open revision (#903, §2.2, README line 1329; line 7895 says MorseTheory consumes it). FourManifolds (#936, line 223) declares `gap:brown-schoenflies` on GeometricTopology. MorseTheory on main already owns the theorem (main README lines 73 and 668), and GeometricTopology on main has no Schoenflies section. #903 revises an existing roadmap, so it can never be a supplier. This folder therefore needs no change; #903 and #936 should cite MorseTheory §4.4 (M4.1).

**Sources: the seeded sample.** Printed page = PDF page − 13 in `cohen-iga-norbury` and − 10 in `nicolaescu-invitation`. In the operator's cached copy of `milnor-1963` (sha256 prefix 65731a25, two-page spreads), PDF page 9 is pp. 12–13, page 13 is pp. 20–21 and page 21 is pp. 36–37. The manifest records `milnor-1963` as uncertified (settled).

| Target | Locator in the README | Checked at | Result |
| --- | --- | --- | --- |
| 1.1 | none (pinned construction) | — | citation of pinned names only; R01 |
| 1.2 | none (pinned definitions) | — | R01 |
| 1.3 | CIN Thm 5.3, pp. 36–37; Cor 5.4, p. 38 | cohen-iga-norbury lines 1322–1330 (PDF 49), 1423–1430 (PDF 51) | exact: normal form at a nondegenerate point; critical set discrete |
| 2.1 | Lee Cor 5.14, Prop 5.38 | uncertified (settled) | — |
| 2.2 | Milnor 1963 Thm 3.1, p. 12 | milnor-1963 cache lines 2225–2277 (PDF 9) | exact: a<b, compact critical-free band ⇒ diffeomorphic sublevels, deformation retract |
| 2.2 | Nicolaescu Thm 2.2.3, pp. 38–42; Rem 2.2.5, p. 42 | nicolaescu-invitation lines 1950–1959 (PDF 48), 1962–1966, 2177–2180 (PDF 52) | exact: homeomorphic to lower sublevel plus a λ-handle; compact band with one critical point; several points on one level |
| 2.3 | Milnor 1963 Lemma 3.6, pp. 20–21 | milnor-1963 cache lines 3623–3645 (PDF 13) | exact (Whitehead: homotopic attaching maps) |
| 2.4 | Milnor 1963 Thm 3.5, p. 20; CIN Thm 5.7, pp. 40–41 | milnor-1963 cache lines 3565–3592; cohen-iga-norbury lines 1519–1521 (PDF 53) | each M^a compact (⇔ proper and bounded below), one λ-cell per index-λ point; CIN for closed M |
| 3.1 | Hirsch Ch. 2 §1; Ch. 6 Thm 1.2 | uncertified (settled) | — |
| 3.2 | Milnor 1963 Cor 6.7, p. 36 | milnor-1963 cache lines 6228–6241 (PDF 21) | exact: a nondegenerate function with every M^a compact |
| 4.1 | CIN Cor 5.11 and proof, p. 42 | cohen-iga-norbury lines 1569–1596 (PDF 55) | exact; c_k=d_(k+1)+b_k+d_k gives Q's ranks; index misprint under Source issues |
| 4.2 | Weber Thm 1.1, p. 2; proof pp. 2–3 | weber-conley lines 62–67, 73–76 | C² on a closed manifold; cat = least ℓ≥1 nullhomotopic open sets (unnormalized) |
| 4.3 | CIN Application 5.13, p. 43 | cohen-iga-norbury lines 1617–1619 (PDF 56) | Morse, two critical points ⇒ homeomorphic to Sⁿ |
| 4.4 | Milnor 1959 Thm 1(3), p. 440; Cor 1, p. 442 | milnor-1959 lines 72–76, 117–119 | exact: union of two opens diffeomorphic to ℝⁿ; homeomorphic to Sⁿ |
| 4.4 | Brown 1960 Thms 0–4, pp. 74–76; Thm 5, p. 76 | brown-1960 lines 25–36, 37, 60–63, 69–71, 84–85, 101–113 | exact; the n=1 gap of Thm 5's proof is under Source issues, and the README treats m=1 separately |
| 5.1 | CIN Thms 15.1, 15.4, 15.6–15.7, pp. 143, 146–148 | cohen-iga-norbury lines 4986–5000 (PDF 156), 5091–5096 (PDF 159), 5142–5170 (PDF 160) | exact; 15.6's "E²" is the README's E¹ |
| 6.1 | CIN Thm 4.6, pp. 27–29 | cohen-iga-norbury lines 1022–1032 (PDF 40) | closed M, limits are critical points; the README attributes trapping and decay to the pins |

**Adversarial table.** I computed every value this round.

| # | Statement | Instances | Values on each side | Result | Change |
| --- | --- | --- | --- | --- | --- |
| 1 | §1.1 model transport | self-model ℝ²; half-line model | df=(1,0) stays (1,0); range [0,∞) ≠ ℝ, so boundarylessness is needed | Checks exact | R01 (`BoundarylessModel` absent at a91d3aaf) |
| 2 | §1.2 Hessians, counts | −x²+y²; f=0 and f=x² on ℝ; constant on S¹; point | diag(−2,2), λ=1, one point; λ(f)+λ(−f): 0+0=0≠1 and 0+1=1; encard ⊤ (`Nat.card` would give 0); count 1, index 0 | nondegeneracy needed for the index sum, and stated | R01 |
| 3 | §1.3 normal form, seminorm comparison | x³−tx; δx² on [−1,1]; τ(y)=y/2 on K=[−2,2] | f′=3x²−t: none for t<0, ±√(t/3) for t>0; suprema δ, 2δ, 2δ; (g∘τ)^(j)=(1/2)^j g^(j)(y/2): sup_K (1,1,1/2) vs sup_τK (1,2,2), C=1; reverse map 2^j, C=2^k | sound | none |
| 4 | §2.1 levels, faces | f=x on ℝ² at 0; f=x on [a,b]; dim 0 | inclusion derivative v↦(0,v), range span e₂ = ker(1,0); df(outward)=+1 at b, −1 at a; ℕ subtraction 0−1=0 | sound | R01 |
| 5 | §2.2 restriction, adapted fields | band [1,4] for x²; z=√2x; −u²+v²; retractions r, r′ | X=−1/(2x): df(X)=2x·(−1/(2x))=−1, from x=2 reaches 1 at t=3=f(2)−1, equals −2x/(4x²); z′=−z ⇔ x′=−x, df(X)=−2x²; field (−z₁,−z₂) gives df=z₁²−z₂²>0 at z₂=0; i∘r′≃id rel M_a ⇒ r≃r∘i∘r′=r′ rel M_a | sound | none |
| 6 | §2.3 chart change | (x²−1)², c=1, ε=1/2; RP² top point; Q∘T=Q | 1−x²(2−x²)=(x²−1)²; α(1)=±√(1−1/√2)=±0.5412, f=1/2; {f≤1/2}={0.5412≤\|x\|≤1.3066}, two components; 2−f=(2X²+Y²)/(1+X²+Y²); AᵀJA=J gives A_uuᵀA_uu=I+A_vuᵀA_vu≥I, so the polar part h and P≥I exist | sound | none |
| 7 | `exists_morseCWModel` | S² height; x² on ℝ; f=x on ℝ; ∅; discrete ℕ with f(n)=n | cells (1,0,1); one 0-cell; f=x proper, unbounded below, no critical points, so X=∅ ≄ ℝ; empty X; ℵ₀ 0-cells; Milnor's "each M^a compact" ⇔ proper ∧ `BddBelow` (min of f on a nonempty M^a bounds f below) | `BddBelow` necessary and present | none |
| 8 | §3.1 strong topology | tolerance e^(−x²) vs constant 0.01; δψ on (0,1) | e^(−x²)<0.01 for \|x\|>√(ln 100)=2.146; δψ(x)=δ>x for 0<x<min(δ, plateau) | strong ≠ compact-open; restriction needs clopen | none |
| 9 | §3.2 exhaustion | x² with \|g−f\|<1; discrete ℕ constant; ∅ | g≥−1 and {g≤b}⊆{x²<b+1} compact; fibre ℕ not compact; empty map proper, vacuously Morse | sound | R01 (missing statable headline) |
| 10 | `strong_morse_inequalities` | RP² over ℚ, 𝔽₂; c=(2,0,0,2), b=(1,0,0,1); ∅ | ℚ: C−B=t+t²=(1+t)t, ranks d₁=0, d₂=1 ⇒ Q=t; 𝔽₂: B=C, Q=0; q₁=S₁(c)−S₁(b)=(0−2)−(0−1)=−1<0; S_n+S_(n−1)=x_n ⇒ c_j−b_j=q_j+q_(j−1); 0=0 | ℕ[t] encodes the strong inequalities; truncation at dim M exact since q_n=0 for n≥m | none |
| 11 | `bettiNumber` | point; RP², j=1; discrete ℕ | (1,0,0,…); 0 over ℚ, 1 over 𝔽₂; H₀=k^(⊕ℕ), finrank junk 0 | junk value documented | none |
| 12 | §4.2 bound, cup length | S¹; T²; RP²; S¹⊔S¹; ∅; point | 2≥2≥1+1; 4≥3≥2+1; 𝔽₂ 3≥3≥2+1, ℚ 3≥3≥0+1; 4=2+2 vs normalized 1+1≠3; 0+1≤0 fails; 1≥1≥0+1 | nonemptiness needed, and stated | none |
| 13 | §4.3 applications | h−h³/3 on S²; c=(2,1,1); odd m; CP¹ | s=1−h: f=2/3−s²+s³/3, s≈r²/2 ⇒ f≈2/3−r⁴/4, Hessian 0; χ=2−1+1=2, c(−f)=(1,1,2); χ=(−1)^m χ ⇒ χ=0 for odd m; values 0 and 1, indices 0 and 2 | sound | none |
| 14 | `nonempty_homeomorph_sphere_of_two_criticalPoints` | h² on S^m; m=0, two points; one point; two copies of S² | df=2h·dh: equator plus poles, count ⊤ (m≥2) or 4 (m=1), 2 critical values; all points critical, sphere in ℝ¹={±1}; count 1≠2; ≥4 | sound | none |
| 15 | `exists_twoEuclideanOpenCover_of_two_criticalPoints` | round S¹, f=h; band argument | ‖grad h‖=\|sin θ\|=√(1−h²), η=√3/2, (b−a)/η²=2/(3/4)=8/3; staying in the band to time T drops f by ≥η²T>b−a, a contradiction | sound | none |
| 16 | `exists_closedBall_homeomorph_closure_of_bicollar` | m=0; m=1 co-rotating collar arcs; equator | S^(−1)=∅, empty b an open embedding, A={1}, B={−1}, closures ≃ {0}, "false ↔ ‖0‖=1" holds; at m=1 Brown's proof finds no complementary domain of h(S⁰×1) avoiding h(S⁰×0); latitude θ(±1)=±π/4 | true on the native predicate | none |
| 17 | `nonempty_homeomorph_sphere_of_two_euclidean_opens` | S¹ as two arcs; m=0 point; ℝ^m; X∖D=∅ | arcs glued at two endpoints ≃ S¹; 1 point vs #S⁰=2, so `0 < m` needed; not compact; X=D⊆U would make U≃ℝ^m compact; C⊆V compact ⇒ closed in `OnePoint V` | sound | none |
| 18 | §5.1 Morse–Bott | y² vs y⁴; negative Möbius line; RP² | ker Hess=span e₁=TC vs ℝ²; H₀(S¹;ℤ^w)=ℤ/2 vs ℤ; E¹=(ℤ,ℤ,ℤ), d=2, E²=(ℤ,ℤ/2,0) | sound | none |
| 19 | `exists_compactTrapped_gradient_limit` | x²; metric 4dx²; endpoint curve; e^(−x) | γ=x₀e^(−2t), E=x₀²e^(−4t), tail \|x₀\|e^(−2t); grad=x/2, distance 2\|x₀\|e^(−t/2); right derivative at 0 is −2x₀, left 0, so compare at t₁=1: Γ(s)=x₀e^(−2−2s)=γ(1+s) for s≥−1; constants C·e^(μt₁), c=μ; γ′=e^(−γ)>0, no trap | statement true; pinned hypotheses at 2fd255d implied | none |
| 20 | R01 citations | README `TauCeti.` names at a91d3aaf vs 2fd255d | 76 only at 2fd255d, 12 at both, 0 only at a91d3aaf; Morse directory 4 vs 35 entries; §3.2 statement elaborates at a91d3aaf | contract unresolvable at the head's pin | R01 |

## Not verifiable

- **`hirsch-differential-topology` and `lee-smooth-manifolds`:** uncertified and settled; cited by locator.
- **`milnor-1963`:** settled as uncertified in the manifest. I checked its locators against the operator's cached copy (sha256 prefix 65731a25), which the sources service fetched earlier.
- **Thomas Mark, Math240 Homework 11:** no legal text, and the work is not in the manifest. The README uses it only for bibliographic attribution.
- **Elaboration at main's pins:** I may run Lean only from this worktree, at the head's pins. I compared 2fd255d by reading its sources, extracted from the package's git into my scratch directory.
- **Ownership against the open pull requests the brief names without files** (among them ManifoldOptimization #1506, which `scratch/overlaps.md` lists as close in vocabulary): not checked.

## Source issues

- **Misprint** in cohen-iga-norbury at Corollary 5.11, p. 42: the source says the alternating sums over k have summands c_i(f) and b_i(M) with the fixed index i; it should be c_k(f) and b_k(M); affects nothing.
- **Misprint** in cohen-iga-norbury at Application 5.13, proof, p. 43: the source says the lower disc is the preimage of [t₁,a], around a minimum called P; it should be the preimage of [t₀,a], around the minimum S; affects nothing.
- **Misprint** in cohen-iga-norbury at Theorem 15.6, p. 147: the source says the E² term of the filtration spectral sequence is the sum of the relative homologies of the disc bundles; in standard indexing that is the E¹ term, E² being its homology under d¹; affects nothing.
- **Gap** in brown-1960 at Theorem 5, proof, p. 76: the source says to take the complementary domain of h(S^(n−1)×1) avoiding h(S^(n−1)×0), which for n=1 with co-rotating collar arcs does not exist; it should assume n≥2 or treat n=1 separately; affects the proof.
