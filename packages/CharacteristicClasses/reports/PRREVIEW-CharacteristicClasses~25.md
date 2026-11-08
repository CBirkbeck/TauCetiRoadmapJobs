# Review of CharacteristicClasses (pull request #1808 at 6fc75e4)

**Verdict:** needs changes

Incremental re-review of 0 changed lines since 925dc8b: `git diff 925dc8b HEAD -- TauCetiRoadmap/CharacteristicClasses` is empty (and so is the diff from 0439c6d), the pins are unchanged (Tau Ceti 2fd255d9, Mathlib 1b1ccf4b), and the one commit since the previous review (6fc75e4c) touches only `TauCetiRoadmap/ClassifyingSpaces/`, one of the pull request's own folders with its own review. Every passage the previous findings cite is therefore still in place; I re-verified each witness at this head and at the pin rather than redoing the full review. None of the seven findings is repaired, so each is restated below with its witness re-checked today. No new finding: the two overlap leads the worker listed resolve (see Verified sound).

## R01 (P1) — the gate's build step fails on Lake's module-system warning

Location: `TauCetiRoadmap/CharacteristicClasses/Suggested.lean:1`, `import Mathlib`; line 31 `noncomputable section`.

Claim: the worker's gate at 6fc75e4 reports `build=2 FAIL` with the same two Lake warnings as at 925dc8b and 0439c6d ("imports `Mathlib` from package `mathlib`, which is designed for use with the module system; consider adding `module`"). `lake env lean` on the file exits 0 with only the two `sorry` warnings (lines 56, 72), so this is the gate's warning rule, not an elaboration error; the brief forbids acceptance while the gate fails.

Witness: gate at 6fc75e4, `build (2)`, both lines as quoted; `Suggested.lean:1` is `import Mathlib` with no `module` header.

Repair (tested on a scratch copy in an earlier round, unchanged): line 1 becomes `module`, a blank line, `public import Mathlib`; line 31 becomes `@[expose] public section` followed by `noncomputable section`.

## R02 (P2) — the docstring's "not statable" reasons are false at the pin, and the general-base Thom-class headline is statable but absent

Location: `TauCetiRoadmap/CharacteristicClasses/Suggested.lean:10–23` ("there is no Thom-class carrier … no orientation local system on a vector bundle at the pins", "no Euler class or fundamental class of a manifold at the pins").

Claim: at Tau Ceti 2fd255d9 (re-opened today) `TauCeti.IsThomClass` is `Topology/VectorBundle/EulerClass.lean:245`, `TauCeti.eulerClass` line 356, `eulerClass_eq_zero_of_forall_ne_zero` line 383, `eulerClass_pullback` line 402; `VectorBundleOrientation.exists_singularCohomology_thomPair_fiber` is `Orientation/ThomClass.lean:121` and `exists_isThomClass` line 186, both with `[CompactSpace B]`; `VectorBundleOrientationCover.signLocalSystem` is in `Orientation/LocalSystem.lean` (docstring line 16); `TauCeti.evalFundamentalClass` is `AlgebraicTopology/Cohomology/FundamentalClass.lean:88`. Genuinely absent: a relative cup product on `TopPair` (so the Thom isomorphism is not statable), an Euler characteristic of a space as a carrier for `e(TM)[M] = χ(M)`, any infinite Grassmannian or `BU(r)` carrier. C2.1's headline, existence and uniqueness of the Thom class of an oriented real bundle over a paracompact Hausdorff base (Milnor–Stasheff Thm 10.4, first half), is statable against `TauCeti.IsThomClass` and `TauCeti.VectorBundleOrientation` in the shape of `exists_isThomClass` with the base hypothesis changed, and is absent.

Witness: `EulerClass.lean:245` `def IsThomClass (u : (thomPair F E).singularCohomology R k M (finrank ℝ F)) : Prop`; `Orientation/ThomClass.lean:186` `theorem exists_isThomClass [CompactSpace B] (hι : Fintype.card ι = finrank ℝ F)`.

Repair: rewrite the docstring to name the carriers that exist and the three that are missing; state the general-base Thom-class existence-and-uniqueness theorem with `sorry` against `TauCeti.IsThomClass` and `TauCeti.VectorBundleOrientation` (`o : VectorBundleOrientation F E ι`, `hι : Fintype.card ι = finrank ℝ F`, `[ParacompactSpace B] [T2Space B]`, or no base hypothesis if the route is the directed-union one); keep "Thom isomorphism" and "`e(TM)[M] = χ(M)`" in the not-statable list with the correct reasons.

## R03 (P2) — C1.0, C2.1–2.2 and the DGFloer bullet plan objects the pinned Tau Ceti already has, and line 78 says the library lacks what it has

Location: `TauCetiRoadmap/CharacteristicClasses/README.md:78` ("the pinned Tau Ceti has no Serre-fibration declaration, and none is cited here by name"); lines 217–247 (C1.0); lines 825–856 (C2.1–C2.2).

Claim: at Tau Ceti 2fd255d9, `TauCeti.TopCat.serreFibrations` is `Topology/Homotopy/SerreFibration/Basic.lean:107`, and `SerreFibration/FiberBundle.lean` has `hasHomotopyLiftingProperty_cube_of_exists_trivialization` (every locally trivial map, no base hypothesis, docstring lines 18–26) and `TopCat.mem_serreFibrations_proj` (line 21). C1.0's orthonormal frame bundle by Gram–Schmidt with freeness, fibre transitivity, local trivializations and associated-bundle reconstruction is `Topology/VectorBundle/OrthonormalFrame/Basic.lean` (`OrthonormalFrameBundle`, `smul_eq_self_iff`, `exists_smul_eq_iff`, `exists_trivialization`, `associatedHomeomorph`); its orientation double cover with the two-sheet local description and the frames-mod-`SO(n)` identification is `Orientation/Cover.lean` and `Orientation/OrthonormalFrame.lean` (`toOrientationCover_eq_toOrientationCover_iff`). C2.1–C2.2's Euler naturality, vanishing on a nowhere-zero section, compact-base existence and finite Mayer–Vietoris gluing are the declarations listed in R02.

Witness: `SerreFibration/Basic.lean:107` `def serreFibrations : MorphismProperty TopCat.{u}`; README line 78 as quoted.

Repair: replace line 78 by the citation of `TauCeti.TopCat.serreFibrations`, `mem_serreFibrations_proj` and `hasHomotopyLiftingProperty_cube_of_exists_trivialization` with their files, and reduce the DGFloer bullet to what is not at the pin (the homotopy exact sequence, the spectral sequence); in C1.0 consume `OrthonormalFrameBundle`, the continuous Gram–Schmidt, `VectorBundleOrientationCover` and `toOrientationCover_eq_toOrientationCover_iff` by name and keep only the metric-change square root, the smooth versions and the DG comparison; in C2.1–C2.2 consume `IsThomClass`, `eulerClass`, `eulerClass_pullback`, `eulerClass_eq_zero_of_forall_ne_zero`, `exists_isThomClass`, `exists_singularCohomology_thomPair_fiber`, the Mayer–Vietoris and directed-union lemmas and `signLocalSystem`, keeping as targets the general-base existence, uniqueness, the local-system Thom isomorphism and the Gysin sequence.

## R04 (P2) — C6.1 and C7.1 restate the pinned series, genus polynomials and multiplicative sequences, and `Suggested.lean` redefines the L-series

Location: `README.md:1761–1773`, `README.md:1847–1850`, `Suggested.lean:34–50` (`chernRootValue`, `pontryaginRootValue`, `toddSeries`, `lSeries`).

Claim: `RingTheory/PowerSeries/CharacteristicSeries.lean` defines `TauCeti.hirzebruchLSeries` (line 245) and `TauCeti.aHatSeries` (line 147) with the displayed-quotient, evenness and coefficient lemmas; `MultiplicativeSequence.lean` defines `PowerSeries.multiplicativeSequence` (line 110) with the root description, Whitney convolution, the even-series description in the squared roots and `multiplicativeSequence_three_right` (line 373); `GenusPolynomials.lean` proves `Td₁–Td₃`, `L₁`, `L₂`, `Â₁`, `Â₂` (`multiplicativeSequence_cartier_hirzebruchLSeries_two`, line 121). The file's `lSeries` equals `TauCeti.hirzebruchLSeries ℚ` (proved without `sorry` in an earlier round's scratch probe); `chernRootValue`/`pontryaginRootValue` are `MvPolynomial.esymm` at the roots and their squares.

Witness: `CharacteristicSeries.lean:245` `noncomputable def hirzebruchLSeries : A⟦X⟧`; `Suggested.lean:50` `def lSeries : PowerSeries ℚ := PowerSeries.rescale 2 toddSeries - PowerSeries.X`; README line 1771–1773 "`toddSeries` is Mathlib's Bernoulli series with B'₁=1/2, and `lSeries` is its rescaling by 2 minus x".

Repair: in C6.1 and C7.1 cite these declarations by name and file under the Tau Ceti supplier contract and keep as targets only what is absent (the degree-twelve `L₃`, the bundle-level `Td(E)`, `L(E)`, `Â(E)` with their Whitney laws, the Chern character); in `Suggested.lean` delete `toddSeries`, `lSeries`, `chernRootValue` and `pontryaginRootValue` (see R05 for the theorems that use them).

## R05 (P3) — the two sorried theorems are not headlines

Location: `Suggested.lean:56–65` (`lSeries_root_coefficient_six`), `Suggested.lean:72–78` (`twice_even_product_correction_eq_zero`).

Claim: the first computes one small value (`K₃` of the L-series, `(2e₁³ − 13e₁e₂ + 62e₃)/945`, obtainable from the pinned `multiplicativeSequence_three_right`, `coeff_hirzebruchLSeries` and the squared-root descent); the second is a theorem about two arbitrary power series over an arbitrary commutative ring whose conclusion is algebra on its hypothesis. Neither names an object of the roadmap. Neither closes in one tactic (earlier probe), so they are not one-line padding, but the headline rule excludes both.

Witness: `Suggested.lean:56` and `:72`, the only two `sorry` declarations of the file (elaboration output at this head: warnings at 56:8 and 72:8 only).

Repair: delete both from `Suggested.lean` (the README keeps the `L₃` identity in C7.1 and the 2-torsion correction in C3.3 as targets); the file then states the Thom-class theorem of R02 and otherwise says in its docstring what is not statable.

## R06 (P3) — C5.1 cites LieGroups "Layer5A", which exists only in an open revision

Location: `README.md:1378`, "[LieGroups Layer5A and Layer6](../RepresentationTheory/LieGroups/README.md)".

Claim: LieGroups on main at this review's content checkout (`TauCetiRoadmap/RepresentationTheory/LieGroups/README.md`) has Layers 0–9 and no "5A" (the string does not occur in the file: `grep -c 5A` returns 0). "Layer 5A" exists only in the open revision of LieGroups (pull request #1051), and a revision of an existing roadmap is never a dependency.

Witness: `grep -c 5A` on the main-branch LieGroups README returns 0; README line 1378 as quoted.

Repair: cite the main-branch section that owns the invariant positive form and the centre/semisimple splitting (Layer 6 and the compact-group conventions), or, if main has no owner, state the compact invariant form and orthogonal splitting as a C5.1 input with its hypotheses.

## R07 (P3) — the pull request changes two files outside its roadmap folders

Location: `Completed/ArithmeticDirichletSeries/README.md:331` and `TauCetiRoadmap/SymplecticGeometry/README.md:77` (one "supplies" → "consumes" wording change each; gate `outside-folder=2`).

Claim: neither folder is named as the pull request's own, so each is a finding under the brief's rule. The two changes are the same ones raised on this pull request's other folder reviews; this needs no edit inside `TauCetiRoadmap/CharacteristicClasses/`.

Witness: `git diff --stat origin/main...HEAD` outside the named folders lists exactly these two files, 2 insertions and 2 deletions (re-run at 6fc75e4).

Repair: rebase the branch so that the two commits drop out (they are not part of this pull request's change), or list the two folders as the pull request's own.

## Previous findings

- R01 — not repaired: `Suggested.lean:1` is still `import Mathlib` without `module`; gate at 6fc75e4 `build=2 FAIL` with the same two Lake warnings.
- R02 — not repaired: `Suggested.lean:10–23` still says no Thom-class carrier, orientation local system, Euler class or fundamental class exists; no Thom-class theorem is stated.
- R03 — not repaired: README line 78 still "the pinned Tau Ceti has no Serre-fibration declaration"; C1.0 and C2.1–C2.2 unchanged.
- R04 — not repaired: README lines 1761–1773 and 1847–1850 unchanged; `Suggested.lean:34–50` still defines `toddSeries`, `lSeries`, `chernRootValue`, `pontryaginRootValue`.
- R05 — not repaired: `lSeries_root_coefficient_six` (line 56) and `twice_even_product_correction_eq_zero` (line 72) are still the file's only sorried statements.
- R06 — not repaired: README line 1378 still cites "LieGroups Layer5A and Layer6"; LieGroups on main has no Layer 5A.
- R07 — not repaired: the same two outside-folder files (`Completed/ArithmeticDirichletSeries/README.md`, `TauCetiRoadmap/SymplecticGeometry/README.md`) are still in the diff against main; gate `outside-folder=2`.

## Verified sound

**Scope of this round.** Incremental re-review of 0 changed lines since 925dc8b: the folder is byte-identical, so there are no changed passages, no touched Lean statements and no changed citations to review in full; the seeded sample (C1.0, C2.0, C5a.1–C5a.7, C7.AdjointHopfObstruction) falls in no changed passage and its rows are carried forward below. The only commit since the previous review (6fc75e4c) changes `TauCetiRoadmap/ClassifyingSpaces/README.md` and `Suggested.lean`, one of the pull request's own folders; CharacteristicClasses cites ClassifyingSpaces nowhere in its README, so that change touches no supplier citation of this folder.

**Gate and build.** Worker's gate at 6fc75e4: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=2 source-material=0 build=2 FAIL` (the two failures are R01 and R07). `lake env lean TauCetiRoadmap/CharacteristicClasses/Suggested.lean` at this head, run this round: exit 0, two `sorry` warnings (56:8, 72:8), nothing else. Dependency check, run this round:

```text
depcheck: 240 roadmaps, 2378 edges, 0 problem(s)
```

no UPWARD, CYCLE or `moved:` line for CharacteristicClasses. The worker's `roadmaps resolve` found no dangling citation or Lean name. Signatures: the 7 declarations' elaborated types (worker's `signatures.md`) are unchanged from the previous round; none lost a section binder (both theorems carry their own binders; the four definitions mention every variable of their types). The worker's signature transcript reports a parse error at its line 82 (`#check @,`): that is the worker's scanner reading "class, curvature form" in the module docstring (line 23) as a `class` declaration, a tool artifact and not a defect of the file. No `set_option`, no sorried data, single `import Mathlib`.

**Pins re-opened this round** (Tau Ceti 2fd255d9, the manifest pin of this head, confirmed by `git rev-parse HEAD` in the package): `TauCeti.IsThomClass` `Topology/VectorBundle/EulerClass.lean:245`; `TauCeti.eulerClass` `:356`; `eulerClass_eq_zero_of_forall_ne_zero` `:383`; `eulerClass_pullback` `:402`; `VectorBundleOrientation.exists_singularCohomology_thomPair_fiber` `Orientation/ThomClass.lean:121` and `exists_isThomClass` `:186` (both `[CompactSpace B]`); `VectorBundleOrientationCover.signLocalSystem` `Orientation/LocalSystem.lean` (docstring line 16); `TauCeti.evalFundamentalClass` `AlgebraicTopology/Cohomology/FundamentalClass.lean:88`; `TauCeti.TopCat.serreFibrations` `Topology/Homotopy/SerreFibration/Basic.lean:107`; `mem_serreFibrations_proj` and `hasHomotopyLiftingProperty_cube_of_exists_trivialization` `SerreFibration/FiberBundle.lean` (docstring lines 18–30); `OrthonormalFrame/Basic.lean`, `OrthonormalFrame/Pullback.lean`, `Orientation/Cover.lean`, `Orientation/OrthonormalFrame.lean` present; `TauCeti.hirzebruchLSeries` `RingTheory/PowerSeries/CharacteristicSeries.lean:245`, `aHatSeries` `:147`; `PowerSeries.multiplicativeSequence` `MultiplicativeSequence.lean:110`, `multiplicativeSequence_three_right` `:373`; `multiplicativeSequence_cartier_hirzebruchLSeries_two` `GenusPolynomials.lean:121`. Each witness of R02–R04 therefore holds at this head's pin.

**Overlap leads, checked this round.** (1) "SchubertGeometry S9.6 (README lines 1696, 1750): #1224 no longer defines it at its head": false lead. On main, SchubertGeometry's `## S9` section carries the normalizer comparison as its item 6 (README line 120, with the `SU₂`/`ℝP²` test, and line 128 names "S9.6" as the single owner); at #1224's head the same content is `### 9.6 Cellular and normalizer comparison` (line 1249) under `## Layer 9 … (S9)` (line 1082), with the Checks `K/N(T)=ℝP²`, `H⁰=ℤ, H¹=0, H²=ℤ/2` (lines 1258–1262) that lines 1696 and 1750 consume, and its own text still says "S9.6" (line 1273). The id resolves at both heads; no citation breaks. (2) "SpinGeometry G4.1a (lines 1223, 1242, 2022): only #1674 defines it": false lead. SpinGeometry on main defines **G4.1a. Topological frame adapters** at README line 397 (and refers to it at 437, 447); #1674 and #1780 carry the same id (lines 696 and 709). Not a dependency on a revision. (3) #1807 and #1854 conflict with #1808 in `ClassifyingSpaces/` and `RigidAnalyticGeometry/`, not in this folder; the order #1807 → #1808 is stated in the pull request's merge-order paragraph. (4) Closest roadmaps in vocabulary (AlgebraicTopology #1652/#1663, TopologicalKTheory #1781/#1807/#1854): the ownership comparison of the previous full review (AlgebraicTopology 8.5–8.12 and TopologicalKTheory T1.1–T7.4 cited as suppliers, nothing both own) is carried forward, since neither this folder nor the cited sections changed.

**Cross-roadmap citations re-resolved this round.** LieGroups on main: Layers 0–9 by heading, no Layer 5A (R06). SchubertGeometry S9.6 and SpinGeometry G4.1a as above. The previous rounds' resolutions (AlgebraicTopology 8.5/8.8/8.8b/8.9/8.10/8.12 at this pull request's head; TopologicalKTheory T1.6d; CKG K7.1/K7.2; ReflectionInvariantTheory §§1–4; LieGroupoidsPoisson §G1.3a; DGFloer Layer 1 item 2; MorseNovikov N6; AffineMorseLefschetz A4.0; MorseTheory M5; RiemannianGeometry R3; ConvexityToric T2; GeometricTopology Layers 1, 3, 10, 11; SmoothBundlesConnections B1.4/B6; LieHighestWeight L7; CompactGroups Layer 0; TopologicalSheafCohomology TS1.1–TS1.2; SpinGeometry G4.1b; TopologicalKTheory T1.1/T1.5a/T1.6a–d/T6.4/T7.4; GeneralizedCohomology G4.0a/G4.0b; HomotopySpheres §3A/§4A; IndexTheory I7.2) are carried forward: the README's citations did not change.

**Sources.** The manifest records all eleven cited works. Locators carried forward unchanged, three re-read in the cache this round: zentner-instanton-sheet2 Exercise 2 line 45 (the `U(2)` bundle and its `su(E)` subbundle); cohen-fiber-bundles line 3590 (`w̄(RP^{2k}) = 1 + a + … + a^{2k−1}`, the C7.3a input); dupont-ccc Theorem 8.1 line 3514 (Cartan: `I(G) → H(BG)` an isomorphism for compact `G`, the C5a.5 input); tomdieck-at 14.4.3 line 14467 (the Milnor space). The rest as in the previous report: hatcher-vbkt §1.2 (pages 26–30, "Clutching Functions" line 844, Example 1.10 line 879); zentner lines 45–61; tomdieck 9.5 line 9942; dupont-ccc Proposition 8.3 line 3548, Lemma 8.30 line 3848, Appendix line 4110; dupont-ln §9 line 2097; may-concise Chapter 16 line 5203; cohen-fiber-bundles §2.2 line 904, Theorem 3.22 line 3480, §4.2 line 3568, Proposition 3.27 line 3583.

**Adversarial table.** No statement changed, so every row is carried from the previous reports (r17 computed, r23 carried) with its computed values repeated; the rows for the seeded sample, the headlines and the targets the findings touch are listed in full.

| Statement | Instances | Values | Result |
| --- | --- | --- | --- |
| Conventions: CE degree-one differential `da(X,Y) = −a([X,Y])` versus Mathlib | trivial coefficients | pinned `d₁₂_apply_apply_ofTrivial : d₁₂ f x y = −f⁅x,y⁆` (Cochain.lean:118) | agree (r17) |
| Conventions: Euler form of `[[0,−α],[α,0]]` | rank 2 | `Pf(F/2π) = −dα/2π`; `c₁ = (i/2π)(i dα) = −dα/2π` | `e = c₁`, as stated (r17) |
| Conventions: `c₁(O(1)) = h`, `∫_{CP¹}h = 1` | CKG `O(1)` curvature `−2πiω_FS` | Chern form `ω_FS`, integral 1 | agree (r17) |
| C1.0 metric change `H`, `h₁(u,v) = h₀(Hu,v)` (sample) | two metrics | `h₁(H^{−1/2}u, H^{−1/2}v) = h₀(u,v)`; Sylvester eigenvalues `λ_i^{1/2}+λ_j^{1/2} > 0` | correct (r17) |
| C1.0 orientation cover = frames/SO(n) (sample) | pinned statement | `toOrientationCover p = toOrientationCover q ↔ ∃ g, 0 < det g ∧ q = g•p` | agrees; duplicated (R03) |
| C1.1d `[Sⁿ, GL_k(ℝ)]` | `k=1,2,≥3`; `n=0,1,2` | `π₀ = ℤ/2`; `π₁(O(k)) = 0, ℤ, ℤ/2`; `π₂ = 0` | all rows agree (r17) |
| C1.1d calibration | `O(−1)`, `TS²` | `⟨c₁(O(−1)),[CP¹]⟩ = −1`; `χ(S²) = 2` | as stated (r17) |
| C2.0 cell dimensions (sample) | rank 0, empty base | `S(E) = ∅`, `D(E) = X`, cells `(q+0)`, Thom model `X ⊔ pt`; empty base: cofibre of `∅→∅` is a point | as stated (r17) |
| C2.0 `supBallEuclideanDiskHomeomorph` (sample) | `v ↦ (‖v‖∞/‖v‖₂)v` | `‖image‖₂ = ‖v‖∞`; inverse `‖·‖∞ = ‖w‖₂` | direction consistent (r17) |
| C2.1 Thom class existence (headline, R02) | compact base; general base | pinned `exists_isThomClass` needs `[CompactSpace B]` (ThomClass.lean:186); general base absent at pin | statable, absent (R02) |
| C2.2 odd-rank Euler `2e = 0` | orientation reversal | `e(−E) = −e(E) = e(E)` | correct (r17) |
| C3.3 Whitney correction `p_k(E⊕F)` | general | `Σp_ap_b + (−1)^kΣc_{2a+1}c_{2b+1}` | correct (r17) |
| C3.3 `p_r = e²` sign | rank `2r` | orientation sign `(−1)^r` | as stated (r17) |
| C3.6 rings | `R` with `2` a unit | `H*(BSO(2);R) = R[e]`, `p₁ = e²` | consistent (r17) |
| C5.2 Euler integral of `G/T` | `SU(2)` | `|W| = 2 = χ(S²)` | agree (r17) |
| C5.4 `H*(BO(n);ℚ)` | `n = 0..3` | `ℚ`, `ℚ`, `ℚ[p₁]`, `ℚ[p₁]` | agree (r17) |
| C5a.1 `H¹(K;ℝ) = ann([g,g])` (sample) | closed 1-forms | `da(X,Y) = −a([X,Y])`, no exact 1-forms | correct (r17) |
| C5a.1 `2d = Σ e^a ∧ L_{e_a}` (sample) | trivial coefficients | Koszul `d = ½Σ ε(e^a)L_{e_a}`; invariant tensors closed | correct (r17) |
| C5a.1 Haar average (sample) | bi-invariance | `L_h*Aω = Aω` | left-invariant image (r17) |
| C5a.2 generator count and weights (sample) | rank `K`, central directions | `d=1` central generators, weights `2d_i` | consistent with RIT §3 line 60 (r17) |
| C5a.2 rational structure (sample) | `θ ↦ exp(iθ)` | `dχ(a) = ia`, `(i/2π)(ia) = −a/2π` | agrees with Conventions (r17) |
| C5a.3 Weil differential (sample) | `θ_t = tθ` | `F_t = tΩ + ((t²−t)/2)[θ,θ]` | correct (r17) |
| C5a.3 `d_W CS_P = P(Ω)` (sample) | degree `d ≥ 1` | `∫₀¹ (d/dt)P(F_t)dt = P(Ω) − P(0)`, `P(0) = 0` | correct (r17) |
| C5a.3 rank one (sample) | `P = −a/2π` | `CS_P = −θ/2π` | matches `τ(−a/2π)` (r17) |
| C5a.4 Koszul model (sample) | `|e_i| = 2d_i − 1`, `D e_i = P_i` | quotient by `I_+`: `Λ(e_i)` | consistent (r17) |
| C5a.5 transgression page (sample) | `z_i ∈ E^{0,2d_i−1}` | `d_{2d_i}` lands in `E^{2d_i,0}` | well-formed (r17) |
| C5a.5 `π₁(BK) = π₀(K)` (sample) | connected `K` | `0` | trivial local coefficients (r17) |
| C5a.5 Cartan isomorphism input (sample) | compact `G` | dupont-ccc Thm 8.1 line 3514: `I(G) → H(BG)` iso, compact hypothesis present | locator holds (re-read r25) |
| C5a.6 Poincaré series (sample) | `U(2)`, `SU(2)`, `SU(n)` | degrees `1,3`; `3`; `3,…,2n−1`, `Σ(2d_i−1) = n²−1`; `χ = 0`, trivial group `1` | agree (r17) |
| C5a.7 `E₈` (sample) | exponents `1,7,…,29` | degrees sum `248 = dim E₈` | agree (r17) |
| C5a.7 `SU(2)/N(T) = RP²` (sample) | integral cohomology | `ℤ, 0, ℤ/2`; #1224 head §9.6 Check line 1258 gives the same triple | agrees (re-resolved r25) |
| C5a.7 strict upper triangular (sample) | `n = 2` | abelian, centre = all, derived = 0 | counterexample as stated (r17) |
| C7.1 `L₃` coefficient (R04/R05) | `q₃ = 2⁶B₆/6!` | `q₃ = 2/945`; `q₁q₂ − 3q₃ = −13/945`; `q₁³ − 3q₁q₂ + 3q₃ = 62/945` | `(62p₃ − 13p₁p₂ + 2p₁³)/945` correct (r17) |
| `lSeries_root_coefficient_six` (R05) | `r = 0`; `r = 1` | `0 = 0`; `2x⁶/945 = 2p₁³/945` | true; not a headline (R05) |
| `lSeries = hirzebruchLSeries ℚ` (R04) | all coefficients | `B'(2X) − X = B(2X) + X` | proved in Lean (r17 scratch) |
| `twice_even_product_correction_eq_zero` (R05) | `k = 0`; general | `0`; `Σ_{i odd}P_iQ_{2k−i}` doubled is `0` by `hodd` | true; free-variable algebra (R05) |
| C7.2 half-spin character | `r` roots | `∏(e^{x/2} − e^{−x/2})`, sign `(−1)^r` | as stated (r17) |
| C7.3 `p₁(L⊕L)` on `RP⁴` | tautological `L` | `p₁ = −y² ≠ 0` in `ℤ/2`; `p(L) = 1` | detects the correction (r17) |
| C7.3a `w̄(RP^{2^k})` | `m = 2^k` | `(1+a)^{2m} = 1` in degree `≤ m`; `w̄_{m−1} = a^{m−1}`; cohen line 3590 `1 + a + … + a^{2k−1}` | agrees (re-read r25) |
| C7.AdjointHopfObstruction roots (sample) | `End₀(F)` | roots `0, ±(x−y)`; `p₁ = c₁² − 4c₂` | agrees with Zentner Ex. 2 lines 45–58 (re-read r25) |
| C7.AdjointHopfObstruction on `HP¹` (sample) | `c₁(F) = 0`, `⟨u,[HP¹]⟩ = 1` | `⟨p₁(E),[HP¹]⟩ = −4`; `e, w₁, w₂, w₃ = 0` | as stated (r17) |
| C7.AdjointHopfObstruction no section (sample) | `E = ε¹ ⊕ P` | `p₁(E) = p₁(P) = e(P)² = 0 ≠ −4u` | correct (r17) |
| C7.AdjointHopfObstruction Check (sample) | `Z = diag(1,−1)` | `X = 0`, `Y = diag(−i,i)`, `X + iY = Z` | correct (r17) |
| C7.AdjointHopfObstruction basis (sample) | three matrices | each skew-Hermitian, traceless, independent | basis of `su(2)` (r17) |
| C2.3 Checks | `S²`, antipodal, constant | `2`, `−2`, `0` | correct (r17) |
| C2.3a tetrahedron | `4−6+4` | `2`; triangle `0` | correct (r17) |

**Headlines and padding.** Unchanged: the README's headlines (Thom isomorphism and Euler class, `e(TM)[M]=χ(M)`, the universal rings, Borel's theorem and universal Chern–Weil, the singular/de Rham comparison, the genus series) are as before; of these only the general-base Thom-class existence-and-uniqueness is statable at the pin and it is absent (R02); the two stated theorems are not headlines (R05) and the four definitions restate pinned objects (R04). The one-tactic probe of the earlier round (neither sorried theorem closes by `simp`, `rfl`, `infer_instance` or a single `exact`) stands since the file is unchanged.

**Shape.** Unchanged: the README keeps the existing main-branch form of this roadmap (`## Carriers, scope and suppliers`, `## Conventions`, `## C1 … C7`, `## Dependency order and references`), which this pull request does not reshape; not raised, as before.

## Not verifiable

- Milnor–Stasheff §§9–15, 18–19, Appendix C and Theorem 15.3; Milnor, *Topology from the Differentiable Viewpoint* §6; Milnor, *Construction of Universal Bundles II* §§2–3: settled uncertified in the manifest; cited by locator, text not read.
- Bott–Tu §§6, 11–14, 20–23: recorded uncertified by DOI; Springer book, no legal text.
- The `L₃` coefficient was recomputed from `B₆ = 1/42` and the pinned `K₃` formula rather than read from the uncertified text.

## Source issues

- none
