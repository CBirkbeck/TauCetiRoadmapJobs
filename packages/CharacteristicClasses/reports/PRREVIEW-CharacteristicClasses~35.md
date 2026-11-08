# Review of CharacteristicClasses (pull request #1808 at a3b1e14)

**Verdict:** needs changes

Full review: the folder changed by 305 lines since 60a92ec. Of the previous review's eight findings, six are repaired and two are not (previous R07 and R08, now R03 and R04). One new blocking finding (R01) comes from a gate rule that did not exist when the previous review ran; one new P3 (R02) concerns the pin claim behind the new ℝP headline.

## R01 (P2) — HomotopySpheres is cited five times, twice as a supplier, and the gate refuses the name

Location: `TauCetiRoadmap/CharacteristicClasses/README.md:24–27` ("HomotopySpheres §3A and §4A supplies the earlier compactly generated substrate and consumes these classifiers"), `:325` ("their HomotopySpheres classifier comparison"), `:431` ("Consume the CompactlyGenerated inclusion/compact-generation adjunction of HomotopySpheres"), `:514–516` ("together with HomotopySpheres §4A's quaternion-conjugation dictionary S³/{±1}≃SO(3) as the only HomotopySpheres input").

Claim: HomotopySpheres is on the project's list of roadmaps never cited as suppliers, and the worker's gate at this head fails with `dropped=5` on exactly these lines (`scratch/gate.md`; my run of the gate reproduces the five lines). Lines 431 and 514–516 consume it: the compact-generation adjunction and the SU(2)→SO(3) dictionary. Both inputs are owned elsewhere, by roadmaps this README already cites:
- the coreflection `k`, right adjoint of Mathlib's `CompactlyGenerated.compactlyGeneratedToTop`, is AlgebraicTopology 4.5 at this head (`TauCetiRoadmap/AlgebraicTopology/README.md:136–138, 764–774`); HomotopySpheres' own head says so too (#1287, `README.md:144–147`: AlgebraicTopology Stage 4 owns `i ⊣ k`), so HomotopySpheres was never the owner;
- `Ad : SU(2) → SO(3)`, surjective with kernel `{±1}`, is LieGroups Layer 5 on main (`RepresentationTheory/LieGroups/README.md:479–485`); `SU(2) = Sp(1) ≃ S³` is GeneralizedCohomology G4.0a at this head (`GeneralizedCohomology/README.md:1783, 2012–2013`), which C7 already consumes.

Witness: gate line `dropped: line 431: CompactlyGenerated inclusion/compact-generation adjunction of HomotopySpheres`; the five lines above; AlgebraicTopology head line 136: "Stage 4.5 owns the compact-generation coreflection `k`".

Repair (each line tested against the gate's rule, which is a plain name match):
- 24–27: delete the sentence "HomotopySpheres §3A and §4A supplies … finite oriented-cover construction." and write instead: "AlgebraicTopology 4.5 supplies the compact-generation coreflection on which the stable colimits are formed; the stable O/SO and ΩBSO comparisons are downstream consumers, not inputs to the finite oriented-cover construction."
- 325: "and their classifier comparison."
- 431–432: "Consume AlgebraicTopology 4.5's compact-generation coreflection `k`, right adjoint of Mathlib's `CompactlyGenerated.compactlyGeneratedToTop`, with its counit;".
- 514–516: "together with LieGroups Layer 5's double cover `Ad : SU(2) → SO(3)` with kernel `{±1}` and GeneralizedCohomology G4.0a's identification `SU(2) = Sp(1) ≃ S³`. Prove π₂(SO(k))=0 for every k: π₂(SO(2))=π₂(S¹)=0, π₂(SO(3))=π₂(S³)=0 by that double cover, …".
After the edit the gate's `dropped` count is 0 (no other line names the roadmap: `grep -c HomotopySpheres` gives 5, all listed above).

## R02 (P3) — the ℝP headline's docstring and README attribute to the pin a smooth-action instance it does not have

Location: `Suggested.lean:36–39` ("The antipodal map is analytic (`contMDiff_neg_sphere`), so the pinned `TauCeti.instIsManifoldQuotient` makes these charts an analytic, hence smooth, atlas"); `README.md:2260–2264`, the same sentence.

Claim: `TauCeti.instIsManifoldQuotient` (`Geometry/Manifold/Instances/Quotient.lean:242`) takes `[ContMDiffConstSMul I n G M]` (line 205) as an instance argument. No instance `ContMDiffConstSMul (𝓡 m) _ ℤˣ (sphere 0 1)` exists at Tau Ceti 2fd255d9: `IntUnitsAction.lean` provides only the `MulAction`, `ContinuousConstSMul` and `IsCancelSMul` instances (lines 59, 84, 92), and `Geometry/Manifold/Algebra/SMul.lean` has only generic ones. So the pinned instance does not fire: `IsManifold (𝓡 2) ∞ (orbitRel.Quotient ℤˣ S²)` is not synthesized and `Manifold.IsImmersion.id` is not available for ℝP². The headline statement itself is unaffected: `Manifold.IsImmersion` quantifies its charts over `IsManifold.maximalAtlas I n` (`LocalSourceTargetProperty.lean:84–85`), which is defined without the instance, and with the instance supplied the identity is an immersion, so the statement is neither ill-typed nor vacuous.

Witness: scratch `Probe3.lean`: `example : ContMDiffConstSMul (𝓡 2) ω ℤˣ (sphere (0 : EuclideanSpace ℝ (Fin (2+1))) 1) := inferInstance` fails ("failed to synthesize"); after a local instance whose field is proved by `Int.units_eq_one_or`, `one_smul`/`contMDiff_id` for `g = 1` and `TauCeti.Sphere.neg_one_smul`/`contMDiff_neg_sphere` for `g = −1` (five lines), the examples `IsManifold (𝓡 2) ω (quotient)`, `IsManifold (𝓡 2) ∞ (quotient)` and `Manifold.IsImmersion.id` all elaborate.

Repair: in both places replace "so the pinned `TauCeti.instIsManifoldQuotient` makes these charts an analytic, hence smooth, atlas" by "the smooth-action instance `ContMDiffConstSMul (𝓡 m) ω ℤˣ Sᵐ` is a target of this item, proved from `contMDiff_neg_sphere` for `g = −1` and `contMDiff_id` for `g = 1`; with it the pinned `TauCeti.instIsManifoldQuotient` makes these charts an analytic, hence smooth, atlas, and the pinned `Manifold.IsImmersion.id` applies". No change to the theorem.

## R03 (P3) — another open pull request rewrites this folder, and no order is stated (previous R07 not repaired)

Location: pull request description, merge-order paragraph: "#1101 (ModularCurves) → #1807 (the other loops) → **this pull request**".

Claim: #1854 (same author) conflicts with this pull request in `TauCetiRoadmap/CharacteristicClasses/README.md` and `Suggested.lean` (worker's `overlaps.md`), and the description, unchanged since the previous review, does not order the two. At #1854's head `Suggested.lean` still declares `chernRootValue`, `pontryaginRootValue`, `toddSeries`, `lSeries` and the five series theorems (lines 50–113 of `roadmaps show CharacteristicClasses --pr 1854 --file Suggested.lean`), which this head deleted. Merging #1854 last would undo this head's repairs.

Witness: `overlaps.md`: "#1808 and #1854 conflict in … `TauCetiRoadmap/CharacteristicClasses/README.md`, `TauCetiRoadmap/CharacteristicClasses/Suggested.lean`".

Repair: state the order with #1854 in the merge-order paragraph and rebase the later of the two onto the earlier, so that the rebased branch carries this head's version of the folder.

## R04 (P3) — the pull request still changes two files outside its roadmap folders (previous R08 not repaired)

Location: `Completed/ArithmeticDirichletSeries/README.md:331` and `TauCetiRoadmap/SymplecticGeometry/README.md:77`.

Claim: neither folder is one of the fifteen the brief names as the pull request's own, so each change is a finding under the brief's rule. The worker's gate at a3b1e14 reports `outside-folder=2` on exactly these files.

Witness: `git diff --stat origin/main...HEAD` outside the fifteen folders lists the two files (2 insertions, 2 deletions); `git log origin/main..HEAD` on them shows `e591d103` and `61e5385e`.

Repair: rebase so that commits `e591d103` and `61e5385e` drop out, or name the two folders as the pull request's own in the description.

## Previous findings

- **R01 — repaired.** C1.1a (README 285–299) now consumes by name `TauCeti.VectorBundleOrientation.prod` ("orders the first factor first and retains both signs in rank0"), `TauCeti.VectorBundleOrientationCover.prodMap`, `VectorBundleOrientation.nonempty_iff_exists_section` and `VectorBundleOrientationCover.signLocalSystem`, and constructs only the Stiefel-quotient comparison. C2.0 (README 826–829) cites the instance `TauCeti.FiberBundle.t2Space_totalSpace` with its Hausdorff base and fibre hypotheses. All five names elaborate at the pin (scratch `Probe2.lean`).
- **R02 — repaired.** `Suggested.lean:161–169` states `eulerClass_eq_zero_iff_exists_ne_zero` as the review proposed, with `ULift ℤ` coefficients. The docstring (lines 41–84) now names the Gysin sequence, the exterior Hopf isomorphism and the Chern-character theorems as not statable, with their missing carriers, and the C4.2 bullet (70–75) names `TauCeti.deRhamCohomology` and `CovariantDerivative.curvatureOperator` as present and the Chern–Weil form and comparison map as absent; both names elaborate. The ℝP non-immersion, which the previous review listed as not statable because of a chart clash, is now stated on the orbit-space carrier instead (R02 above concerns only its pin wording).
- **R03 — repaired.** README 1008 reads `TauCeti.Manifold.Orientation.toVectorBundleOrientation`; 1013 reads `Orientation.localOrientation` "of `H_(n+1)(F,F∖0;ℤ)` … positive dimension only"; `Suggested.lean:63` repeats the first. Both elaborate.
- **R04 — repaired.** README 903–911 now reads "with coefficients `Hom(C(−;R),M)` for R a projective K-module, that an orientation o of E and an orientation ω of the model fibre F determine, for every class g of `H^n(F,F∖0;R,M)`, exactly one class … a generator g gives the Thom class", matching `Suggested.lean:121–137`.
- **R05 — repaired.** README 1531–1535 cites `ContRepresentation.isUnitarizable` over 𝕜=ℝ (its statement at `Compact/Unitarizable.lean:241–244` is the self-adjoint positive `S` with `(π g)† ∘ S ∘ π g = S`, as paraphrased); 1543–1549 replaces `isSemisimple_of_nondegenerate` by the instance `LieAlgebra.IsKilling.instSemisimple` (`Mathlib/Algebra/Lie/Killing.lean:76`, hypotheses `IsKilling` and `Module.Finite`) and records the extra atom hypothesis of the criterion; 1558–1577 consume `TauCeti.lieCartanRestriction`, `LieSubalgebra.lieChevalleyRestrictionIso`, `coe_lieChevalleyRestrictionIso_apply`, `lieChevalleyRestrictionIso_mem_homogeneousSubmodule_iff`, `TauCeti.killingSymmetricEquiv`, `map_dualMap_killingSymmetricEquiv`, `killingSymmetricEquiv_lieModuleDerivation` and `map_killingSymmetricEquiv_lieInvariants`. All elaborate; the LieHighestWeight L7 names are gone (README 127–130 now cites L1 and L9 only).
- **R06 — repaired.** C1.0 (251–256) cites Dupont, Fibre Bundles, Propositions 2.20–2.21 and Example 4.3; C2.0 (822–824, 838–840) Milnor–Stasheff §18 and Cohen Chapter 3 §2 (2.4)/Proposition 3.7; C5.1 (1519) and C5a.2 (1727–1731) Dupont CCC Proposition 8.3 and Hatcher §3.G; C5a.1 (1653–1655, 1684–1687) Dupont Propositions A2, A7, Theorem A8; C5a.3 (1784–1790) Alekseev–Meinrenken §3.1 (10) and Dupont Theorem 9.5/Lemma 9.6; C5a.4 (1829–1835) and C5a.5 (1892–1894) Hatcher 3C.4 and CCC Theorem 8.1; C5a.6 (1904–1905) CCC Corollary 8.35; C5a.7 (1941–1943, 1955–1956) Hatcher 4D.3 and §3.G. The manifest records `hatcher-at` and `alekseev-meinrenken-chern-weil` as certified. Every locator was read (Verified sound).
- **R07 — not repaired.** The description still orders only #1101 → #1807 → this pull request; now R03.
- **R08 — not repaired.** The two outside-folder files are still changed; now R04.

## Verified sound

**Gate and build.** The worker's gate at a3b1e14: `set_option=0 … sorry-data=0 … imports=0 … statement-hygiene=0 forbidden=0 dropped=5 readme-ids-missing=0 … depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=2 source-material=0 build=0 FAIL`; the failures are R01 and R04. My run of the gate (`--base origin/main`) reproduces the five `dropped` lines and reports `outside-folder=25` (the sibling folders of the stacked branch, which the worker's fifteen-folder run excludes). `lake env lean` on `Suggested.lean`: exit 0 in 7 s, warnings only `declaration uses sorry` at 121:8, 145:8, 161:8, 183:8. The file is a module (`public import Mathlib` plus two existing `TauCeti.*` modules), `theorem` only, no `set_option`, no sorried data, 189 lines. Dependency check this round:

```text
depcheck: 245 roadmaps, 2492 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. `roadmaps resolve`: no cross-roadmap citation and no Lean name found nowhere.

**Signatures.** `signatures.md` compared with the README: theorem 1 keeps `[Module.Projective K R]`, `hι`, `[FiniteDimensional ℝ F]`, `[FiberBundle F E]`, `[VectorBundle ℝ F E]`; theorem 3 keeps `[T2Space B]`, `[Topology.CWComplex univ]`, `hdim`, `hn` and `hu`; theorem 4 uses no section variable. No binder is lost, and each elaborated type matches its README sentence (C2.1 903–911, C2.2 976–984, C7.3a 2252–2256).

**Padding probe.** Scratch copy with each `sorry` replaced by `first | rfl | simp | infer_instance | (exact?)`: theorem 2 fails every alternative (`exact?` could not close the goal); theorems 1, 3 and 4 are left with their original goals after `simp` normalisation (for theorem 4, `simp` only rewrites `𝓘(ℝ, EuclideanSpace ℝ (Fin _))` as `𝓡 _`). None restates a definition, mirrors a Check or computes a value.

**Pinned declarations opened** (Tau Ceti 2fd255d9, Mathlib 1b1ccf4b). A scratch file with 74 `#check @name` lines over 48 built Tau Ceti modules: every name resolves except `CliffordAlgebra.isCoveringMap_realCliffordSpinDoubleCoverZero_rightHom` and `CliffordAlgebra.pathConnectedSpace_realCliffordSpinGroupZero_add_two`, whose modules `Topology/Algebra/CliffordAlgebra/Spin/{Covering,Connected}.lean` have no object file on this worker; the first is declared at `Covering.lean:108` inside `namespace CliffordAlgebra` (line 48), the second's module `Connected.lean` opens the same namespace (line 43) and this passage (C3.5) is unchanged from the heads accepted earlier. Opened by file and line:
- `Manifold.IsImmersion` (`Immersion.lean:802`, complement in the model's universe), `IsImmersionAtOfComplement` (191), `LocalPresentationAt` with `domChart ∈ IsManifold.maximalAtlas I n M` (`LocalSourceTargetProperty.lean:84`), `IsImmersion.id` (972, needs `IsManifold`).
- `MulAction.instChartedSpaceQuotient` (`Instances/Quotient.lean:50`; properly discontinuous, continuous, cancellative action on a T2 locally compact space), `contMDiff_neg_sphere` (`Instances/Sphere.lean:465`), `ContMDiffConstSMul` (`Algebra/SMul.lean:91`).
- `TauCeti.instIsManifoldQuotient` (`Geometry/Manifold/Instances/Quotient.lean:242`, variables 200–219), `TauCeti.RealProjectiveSpace` (`UniversalCover/RealProjective/Basic.lean:60`; `rfl` to `orbitRel.Quotient ℤˣ (sphere 0 1)` in the probe), `TauCeti.Sphere.instMulActionIntUnitsSphere`, `instContinuousConstSMulIntUnitsSphere`, `instIsCancelSMulIntUnitsSphere`, `neg_one_smul` (`IntUnitsAction.lean:59, 84, 92, 79`); `ProperlyDiscontinuousSMul ℤˣ S²` synthesizes (finite group).
- `ContRepresentation.isUnitarizable` (`Compact/Unitarizable.lean:241`), `LieAlgebra.IsKilling.instSemisimple` (`Killing.lean:76`), the Chevalley and Killing names of C5.1 (`HighestWeight/ChevalleyRestriction.lean`, `Killing/CartanRestriction.lean`, `Killing/SymmetricAlgebra.lean`).
- `TopCat.singularCup` (`Cohomology/Cup.lean:203`, one bilinear map per pair of degrees, as the C5a.5 docstring bullet says), `TauCeti.deRhamCohomology`, `CovariantDerivative.curvatureOperator`.
- The Thom and Euler names of C2.1–C2.2 (`Orientation/ThomClass.lean`, `MayerVietoris/{Basic,DirectedUnion}.lean`, `EulerClass.lean`), `Bundle.Trivialization.mapOrientation` (`Orientation/Basic.lean:81`), the frame and cover names of C1.0–C1.1a, the Serre-fibration names, `LieModule.Cohomology.d₁₂_apply_apply_ofTrivial`, the series and genus-polynomial names of C6.1 and C7.1.
- Mathlib's `CompactlyGenerated.compactlyGeneratedToTop` (`Topology/Category/CompactlyGenerated.lean:78`); no adjunction with it is declared in that file at the pin, consistent with AlgebraicTopology 4.5 owning `k`.

**Cross-roadmap citations resolved** (main 3b3f7ef or the head named): LieGroups Layers 1, 5, 6 (main 261, 358, 383; the SU(2)→SO(3) cover at 479–485); CompactGroups Layers 0–1 (main 205, 226); LieHighestWeight L1/L9 and `HasCentralRadical` (main 30, 153, 295); LieGroupoidsPoisson §G1.3a (main 18); ReflectionInvariantTheory §§1–4 (main 7, 19, 40, 68); SpinGeometry G4.1a/G4.1b (main 397, 425); SchubertGeometry S9.6 (main 128); MorseNovikov N6 (main 807–869); GeometricTopology Layers 1, 3, 10, 11 (main 177, 357, 786, 831); TopologicalSheafCohomology TS1.1–TS1.2 (main 7–11); ConvexityToric T2 (main 73); MorseTheory M5 (main 857); RiemannianGeometry R3 (main 82–89); AffineMorseLefschetz A4.0 (main 13); SmoothBundlesConnections B1.4, B2, B6 (main 31–160); DGFloer Layer 1 item 2 and 1.2 (main 140–192); IndexTheory I7.2 (#1077 head, line 1338; earlier in the merge order); at this head: AlgebraicTopology 4.5, `supBallEuclideanDiskHomeomorph` 383, `relativeCWPushout` 640, `homotopyPushoutGluingComparison` 654, `relativeCWPushoutCWModel` 712, `simplicialRealizationCW` 846; TopologicalKTheory T1.5a 304, T1.6a 364, T6.4 72–79, T7.0 1186; GeneralizedCohomology G4.0a/G4.0b 39–41, 1782–1801; ComplexKahlerGeometry K4 444, K7.1 1407. Overlaps: no id this README cites is dropped by an open pull request, none it drops is cited elsewhere; the lead "SpinGeometry §G4.1a only at #1674" is false (main line 397); the order with #1807 is stated and #1854 is R03.

**Ownership.** The ℝP non-immersion and the Euler primary-obstruction theorem are stated by no roadmap on main and by no open roadmap pull request (`roadmaps grep -i 'isImmersion' --lean-only` and `'eulerClass_eq_zero_iff'` hit only this folder). The sibling labels `bundleDiskSphereRelCW` and `cechSingularCWTypeComparison` are cited by RiemannianGeometry and ComplexComparisonPartII and stay here. Nothing here is also owned by AlgebraicTopology #1652/#1663 or TopologicalKTheory #1781/#1807 at their heads.

**Sources read at their locators** (printed page = `=== page` marker where given):
- hatcher-at: Theorem 3C.4, line 12343 (p. 294; commutative associative Hopf algebra over a characteristic-0 field, finite type, exterior ⊗ polynomial), Corollary 4D.3, line 18734 (p. 443; `H*(U(n);ℤ)=Λ[x₁,…,x_{2n−1}]`, `H*(SU(n);ℤ)=Λ[x₃,…]`, via `U(n−1)→U(n)→S^{2n−1}`), §3.G table, line 14232 (SU(n): 2,…,n) and 14239 (E8: 2, 8, 12, 14, 18, 20, 24, 30).
- dupont-ln: Proposition 2.20, line 532 (local orthonormal trivialization by Gram–Schmidt); 2.21, line 566 (orthogonal frame bundle, right O(n) action, equivariant local diffeomorphisms); Example 4.3, line 976 (metric = reduction to O(n), orientation = reduction to GL⁺); Proposition A2, line 2627 (invariant forms on G/H and `Alt(g/h)^H`, with the same alternating-sum differential as README 1650–1652); Proposition A7, line 2713 (invariant inner product by averaging); Theorem A8, line 2752 (invariant forms compute de Rham cohomology for compact connected G); Theorem 9.5, line 2244 and Lemma 9.6, line 2264 (connection independence through the homotopy operator on M×ℝ).
- dupont-ccc: Theorem 8.1, line 3514 (`I(G) ≅ H*(BG)`, compact G); Proposition 8.3, line 3548 (`I(G) ≅ I(T)^W`, compact connected G); Corollary 8.35, line 3989 (Borel, `H*(BG) ≅ H*(BT)^W`, real coefficients).
- alekseev-meinrenken-chern-weil: §3.1, line 332; equation (10), line 368 (`Wg = Sg* ⊗ Λg*`); line 373 (basic cohomology is `(Sg*)^inv`).
- cohen-fiber-bundles: (2.4) `T(ζ)=D(ζ)/S(ζ)`, line 2950 (printed p. 86, Chapter 3 §2); Proposition 3.7, line 2979 (p. 87) with the boundary decomposition `S(ζ×η) = S(ζ)×D(η) ∪ D(ζ)×S(η)` in its proof (line 2988, p. 88).
- zentner-instanton-sheet2: Exercise 2, lines 45–61 (`p₁(su(E)) = −4c₂(E) + c₁(E)²`, `su(E)⊗ℂ ≅ End₀(E)`).
- hatcher-vbkt §1.2 and tomdieck-at 14.4.3: unchanged since the previous review, which read them.

**Adversarial table** (values computed this round; sampled targets, headlines and every target a finding touches):

| Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- |
| `existsUnique_singularCohomology_thomPair_fiber` (L121) | B = ∅ | `H^r(∅,∅)=0`, both clauses vacuous, `u=0` unique | true |
| same | B = pt, `o=ω` / `o=−ω` | `u=g` / `u=−g`; two linear trivializations differ by `sign det` (`VectorBundle/ThomClass.lean:522`) | consistent |
| same | rank 0, two points, opposite signs | `u=(g,−g)`; a constant class gives `(g,g)` or `(−g,−g)` | unique, as Check 2 says |
| same | `K=𝔽₂`, `g=0` | `−g=g`, the orientation is irrelevant; `u=0` | true |
| same | `R` not projective | excluded by `[Module.Projective K R]`; README 903 now says "R a projective K-module" | agree |
| `exists_isThomClass_of_orientation` (L145) | `K` the zero ring; Möbius line; `S¹×ℝ`, `K=ℤ` | zero module, `span=⊤`; no orientation, vacuous; fibre restriction generates `H¹(ℝ,ℝ∖0)≅ℤ` | true |
| `eulerClass_eq_zero_iff_exists_ne_zero` (L161) | B = ∅; B = pt, rank n ≥ 2 | both sides true; `H^n(pt)=0` so `e=0`, any nonzero vector is a section | true |
| same | TS² (rank 2, cells 0 and 2); `S²×ℝ²` | `e=2≠0`, no section (hairy ball); `e=0`, constant section | both directions |
| same | realified O(1) on CP¹; oriented rank 2 on S¹ | `e=c₁(O(1))=h`, `⟨h,[CP¹]⟩=1`, no section; `H²(S¹)=0`, bundle trivial since SO(2) is connected | Checks correct |
| same | su(F) on HP¹: rank 3, dimension 4 | `H³(S⁴)=0` so `e=0`; `p₁=−4u≠0` forbids `ε¹⊕P` | `hdim` necessary |
| same | n = 1, n = 0 (excluded by `hn`) | oriented line bundle over a 1-complex is trivial, `e=0`, section; rank 0: `e=u≠0` on B ≠ ∅ and no nonzero vector in `0` | holds; `hn` harmless |
| same | coefficients `ULift ℤ` | `Hom_ℤ(C⊗ULift ℤ, ULift ℤ)` is the ordinary integral cochain complex | ℤ-cohomology |
| `not_exists_isImmersion_realProjectiveSpace` (L183) | k = 1: ℝP² → ℝ² | an immersion of a closed 2-manifold into ℝ² is open; compact open image = ℝ²; also `w̄₁=a≠0` needs normal rank ≥ 1 > 0 | true |
| same | k = 2: ℝP⁴ → ℝ⁶ | `(1+a)⁻⁵=(1+a)³=1+a+a²+a³`, `w̄₃=a³≠0`, normal rank 2 < 3 | true |
| same | k = 3: ℝP⁸ → ℝ¹⁴ | `(1+a)⁷=Σ_{j<8}a^j`, `w̄₇=a⁷≠0`, normal rank 6 < 7 | true |
| same | k = 0 (excluded by `hk`) | target `ℝ⁰`; no linear iso `ℝ×F ≃ 0`, so no immersion; route needs `m−1≥1` | `hk` reflects the route |
| same | junk subtraction; smoothness | `2^(k+1)−2 ≥ 2` for `k≥1`; `∞ = (⊤:ℕ∞)` | no junk value |
| same | non-vacuity | with the five-line smooth-action instance, `IsImmersion.id` elaborates on the quotient (Probe3) | not vacuous; R02 |
| C1.0 metric change (sample) | `f_i=H^(−1/2)e_i` | `h₁(f_i,f_j)=h₀(H^(1/2)e_i,H^(−1/2)e_j)=δ_ij`; Sylvester eigenvalues `λ_i^(1/2)+λ_j^(1/2)>0` | correct |
| C1.0 orientation cover (sample) | pinned iff | same image ↔ differ by `det>0` (`OrthonormalFrame.lean:120`) | agree |
| C1.1a sum convention | `VectorBundleOrientation.prod` | first factor first, rank 0 keeps both signs (`Orientation/Prod.lean:78`) | as README 288 |
| C2.0 cells (sample) | rank 0; empty base; sup-ball map | `S(E)=∅`, model `X₊`; a point; `‖(‖v‖∞/‖v‖₂)v‖₂=‖v‖∞` | correct; Cohen 3.7 proof gives the boundary |
| C2.3 pairing | `TauCeti.Manifold.Orientation.toVectorBundleOrientation`, `Orientation.localOrientation` | both resolve; the latter needs dimension `n+1`, as README 1013–1016 says | agree |
| C5.1 Killing of `[𝔤,𝔤]` | 𝔤 = 𝔷 ⊕ I | `κ_𝔤(x,y)=tr_𝔷(ad x ad y)+tr_I(ad x ad y)=0+κ_I(x,y)`; compact ⇒ `κ≤0` with kernel 𝔷 ⇒ `κ_I<0` ⇒ `IsKilling` ⇒ `instSemisimple` | correct |
| C5.1 unitarian trick | pinned statement | `S` self-adjoint, `re⟪Sv,v⟫>0`, `(π g)†∘S∘π g=S` (Unitarizable.lean:241–244) | as README 1532–1535 |
| C5a.1 CE (sample) | degree 1 | `(da)(X₀,X₁)=(−1)^(0+1)a([X₀,X₁])`; Dupont A2 line 2632 same sum | agree |
| C5a.1 Koszul (sample) | degree 1 | `(L_Xa)(Y)−(L_Ya)(X)=−2a([X,Y])=2da(X,Y)` | correct |
| C5a.2 rational structure (sample) | `θ↦exp(iθ)` | `(i/2π)·ia=−a/2π` (Conventions 197) | agree |
| C5a.2 degrees (sample) | SU(n); E8 | `Σ_{d=2}^{n}(2d−1)=n²−1=dim SU(n)`; `2+8+…+30=128`, exterior `3+15+…+59=248=dim E8`, 8 generators = rank | Hatcher 3.G |
| C5a.3 Weil curvature (sample) | `θ_t=tθ` | `t(Ω−½[θ,θ])+½t²[θ,θ]=tΩ+((t²−t)/2)[θ,θ]`; `t=0,1` give `0,Ω`; rank one `CS=−θ/2π` | correct |
| C5a.4 Koszul (sample) | degrees; trivial group | `|e_i|=2d_i−1`, `D(e_i)=P_i` of degree `2d_i`; empty system gives ℝ; 3C.4 hypotheses met (finite type, char 0) | consistent |
| C5a.5 page (sample) | `z_i∈E^(0,2d_i−1)` | `d_(2d_i)` lands in `E^(2d_i,0)`; `π₁(BK)=π₀(K)=0` | well-formed |
| C5a.6 Poincaré (sample) | SU(3), U(2), trivial | `(1+t³)(1+t⁵)`: top 8, Betti 4; `(1+t)(1+t³)`: top 4; `P(−1)=0`; trivial `1` | agree; Cor 8.35 real |
| C5a.7 degrees (sample) | U(n) integral; `SU(2)/N(T)` | `Λ_ℤ[x₁,…,x_{2n−1}]` (4D.3); `H⁰=ℤ,H²=ℤ/2` of ℝP² | agree |
| C5a.7 exercise (sample) | strict upper triangular, n = 2 | 1-dimensional abelian; centre = 𝔤 ⊄ `[𝔤,𝔤]=0` | counterexample holds |
| C7.AdjointHopf basis (sample) | three matrices | each `A*=−A`, trace 0, independent | basis of su(2) |
| C7.AdjointHopf Check (sample) | `Z=diag(1,−1)` | `X=(Z−Z*)/2=0`, `Y=(Z+Z*)/(2i)=diag(−i,i)`, `X+iY=Z` | correct |
| C7.AdjointHopf roots (sample) | `0,x−y,y−x` | `e₂=−(x−y)²`, `p₁=(x−y)²=c₁²−4c₂`; Zentner line 50 | agree |
| C7.AdjointHopf on HP¹ (sample) | `c₁=0`, `⟨u,[HP¹]⟩=1` | `⟨p₁(E),[HP¹]⟩=−4`; `ε¹⊕P` gives `p₁=e(P)²=0` | no section, not stably trivial |
| C7.1 L₃ | `q₃=2⁶B₆/6!` | `64/30240=2/945`; `q₁q₂−3q₃=−13/945`; `q₁³−3q₁q₂+3q₃=62/945` | correct |
| C7.1 Checks | CP⁶; HP³; HP² | `(2170−1911+686)/945=1`; `(496−624+128)/945=0`; `p=1+2u+7u²`, `(49−4)/45=1` | match signatures |
| C7.3 Whitney correction | L on ℝP⁴ | `p₁(L⊕L)=−c₁(L_ℂ)²=−y²≠0` in `H⁴(ℝP⁴;ℤ)=ℤ/2`, `p(L)=1` | detects |
| C7.3a ring | `(1+a)^(m+1)(1+a)^(m−1)` | `=(1+a)^(2m)=1+a^(2m)=1` since `2m>m`; `(1+a)^(m−1)=∏_{i<k}(1+a^(2^i))=Σ_{j<m}a^j` | correct |
| C3.3 Wu | `Sq¹w_j` | `C(j−2,0)w₁w_j+C(j−1,1)w_(j+1)=w₁w_j+(j−1)w_(j+1)` | agree |
| C3.6 involution | antipodal map on `S^(2r)` bundle | `e↦−e`, fixed subring `R[p₁,…,p_(r−1),e²]` | correct |
| C1.1d table | `[S¹,O(2)]`, `[S¹,O(k≥3)]`, `[S²,O(k)]` | `ℤ⋊ℤ/2`, `(ℤ/2)²`, `0⋊ℤ/2=ℤ/2` | agree |
| C1.1d π₂(SO(3)) | via SU(2)→SO(3) | kernel `{±1}` (LieGroups main 482), `π₂(S³)=0` | owner on main; R01 |

## Not verifiable

- Milnor–Stasheff §4 (Theorem 4.8, the non-immersion of ℝP^(2^k)), §10 Theorem 10.4, §12 (the Euler class as the primary obstruction), §14, §15 Theorem 15.3, §18 (the cell structure of the Thom space), §19 and Appendix C; Milnor, *Topology from the Differentiable Viewpoint* §6; Milnor, *Construction of Universal Bundles II* §§2–3; Bott–Tu §§6, 11–14, 20–23. The manifest settles all four as uncertified; they are cited by locator and I did not read the text.
- The two `CliffordAlgebra` names of C3.5 could not be elaborated on this worker (no object file for their modules); they were checked in the pinned source only.

## Source issues

- **Misprint** in zentner-instanton-sheet2 at Exercise 2, page 1: the source says "skey-adjoint" for the endomorphisms defining su(E); it should be "skew-adjoint"; affects nothing.
