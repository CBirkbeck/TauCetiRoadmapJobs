# Review of CharacteristicClasses (pull request #1854 at c07dda7)

**Verdict:** needs changes

This is a full review of `TauCetiRoadmap/CharacteristicClasses/` at c07dda7. The folder changed by 933 lines since c9c60d0, and no other folder in the pull request changed in that interval. Of the twelve previous findings, eight are repaired (R02–R09) and one is partly repaired (R01). Three are not repaired: R10, R11 and R12.

There are nine findings, five of them blocking:
- R01 (P1): the finite oriented Grassmannian's lifted Schubert cells now have no owner, because TopologicalKTheory was not changed when this README handed them to it.
- R02 (P2): this pull request's AlgebraicTopology rewrite took over C1.2a S0–S4 without this README letting go of them.
- R03 and R04 (P2): two passages disagree with main after merges that landed after this branch's merge base. LieGroups gained Layer 5A in #1051; TopologicalKTheory T6.4 changed in #1781.
- R05 (P2): an upward comparison with IndexTheory.

The gate still fails, on `outside-folder=2` (R08).

## R01 (P1) — The lifted oriented Schubert cells have no owner: this README gives them to TopologicalKTheory T1.6a, which still takes them from C1.1a

Location: `TauCetiRoadmap/CharacteristicClasses/README.md:21–24`: "TopK T1.6a's positive-rank finite oriented carriers (orthonormal-frame quotients by SO(n)), their lifted finite cells and coordinate maps". Also `:323–330`: "Prove that this identification carries TopK T1.6a's lifted Schubert cells … TopK T1.6a owns the finite oriented carriers".

Claim: This README's half of the previous R01 repair is done. TopologicalKTheory, carried by this same pull request, was not changed. At this head it still names C1.1a as the supplier of the oriented cover and its lifted cells. No TopologicalKTheory item constructs those cells: `grep -n lifted` finds only lines 117 and 387, and both point back at C1.1a.

So nobody owns the lifted cells, and C1.1a and T1.6a each cite the other as supplier. The dependency check reads TopologicalKTheory from main and cannot see this.

Line 21 also contradicts C1.1a. C1.1a at `:309–312` says the carrier is the pinned orientation double cover. Identifying that cover with the frame quotient by SO(n) is what C1.1a still has to prove.

Witness: `TauCetiRoadmap/TopologicalKTheory/README.md:116–117`: "CharacteristicClasses C1.1a supplies only the earlier finite oriented-cover and lifted-cell precursor". Also `:384–387`: "compare using CharacteristicClasses C1.1a's finite oriented-cover precursor … rank-colimit on those lifted cells".

Repair (preferred, because it matches this README):
- TopologicalKTheory T1.6a (`:383–387`): "For oriented real bundles of fixed positive rank n≥1 use the pinned `TauCeti.finiteOrientedGrassmannian n N` with its `Tautological` bundle and `forget` map (`Topology/Grassmannian/Oriented.lean`). Own its lifted Schubert cells, characteristic maps and coordinate maps, and the lifts of the pinned `rankStabilization` (new line first) and `ambientStabilization` (`Topology/Grassmannian/Stabilization.lean:82, 116`). Then own the fixed-rank BSO(n) colimits and `stableOrientedGrassmannian` …".
- TopologicalKTheory `:75–81` and `:116–117`: state C1.1a–b as consumers only.
- This README, `:21–22`: replace "(orthonormal-frame quotients by SO(n))" with "(the pinned `TauCeti.finiteOrientedGrassmannian`, the orientation double cover of T1.5's tautological bundle)".

Alternative: restore main's arrangement, in which C1.1a constructs the lifted cells and T1.6a consumes them. Then delete "TopK T1.6a's lifted Schubert cells" from `:323–324`.

Test: afterwards TopologicalKTheory names exactly one owner of the lifted cells, and none of its lines cites C1.1a as an input.

## R02 (P2) — Compactly supported local-coefficient cochains have two owners: AlgebraicTopology's supported-cellular supplement and C1.2a S0–S4

Location: `README.md:71–73`: "For the support lane, C1.2a consumes ordinary AT2–4 and ordinary6.1–6.2 only. The separate AT supported-cellular supplement consumes C1.2a S0–S4". Also:
- `:585–593`, the S0–S4 constructions, including the supported and mixed-support cups at `:591`;
- `:656–660` ("These foundations consume AT2–4 and ordinary AT6.1–6.2 only");
- `:662–669`.

Claim: On main, AlgebraicTopology consumed "CC C1.2a S0–S4" (main lines 1169, 1742 and 2102), an edge from a supplier back into this roadmap. This pull request's AlgebraicTopology commit c9c60d0e cut that edge by making AlgebraicTopology the owner of exactly these objects. This README was not updated. It still constructs C_K, C_c and H_c, support enlargement, cofinality, proper pullback, open extension, supported cups and jointly proper homotopy invariance, and still says AlgebraicTopology consumes them.

Witness: `TauCetiRoadmap/AlgebraicTopology/README.md:1666–1671`: "owns the compactly supported local-coefficient cochain foundation below … CharacteristicClasses C1.2a consumes the foundation for its support excision and collared-pair triangle". Then `:1674–1718` defines the same `C_K^*(X,A;L)=C^*(X,A∪(X∖K);L)` with its colimit and the same laws.

Repair:
- Lines 71–75: "C1.2a consumes AlgebraicTopology's supported-cellular foundation after ordinary 6.2: the support colimit C_c^* and H_c^*, enlargement, cofinality, proper pullback, open extension, supported and mixed cups, and jointly proper homotopy invariance. C1.2a owns S5's collared-pair support excision and supported pair triangle, and the comparison of that triangle with AlgebraicTopology's supported CW-pair triangle. No AlgebraicTopology stage consumes C1.2a."
- S0–S4: keep the labels, because AffineMorseLefschetz cites "C1.2a S0–S5" (main, its lines 28, 152, 622, 931, 941 and 1494). Replace each construction with one sentence consuming the matching AlgebraicTopology item.
- Delete the construction of the supported cup and mixed-support maps at `:591`, and make `:662–669` consume AlgebraicTopology's supported cups.
- `:656–660`: "These foundations consume AT2–4, ordinary AT6.1–6.2 and AT's supported-cellular foundation, independently of AT8.5."

Test: `grep -n "consumes C1.2a" README.md` returns nothing, and both READMEs name the same single owner.

## R03 (P2) — C5.1 restates the compact splitting and root data that LieGroups Layers 5A and 6 own on main

Location: `README.md:1585–1601`: "State as this item's own input, with hypotheses G compact and connected: the orthogonal splitting `𝔤 = 𝔷(𝔤) ⊕ [𝔤,𝔤]` … the negative semidefiniteness of the Killing form … the identification of t_ss,C as a Cartan subalgebra; and the actual root-pairing isomorphism".

Claim: LieGroups #1051 (06ef467f) merged into main after this branch's merge base (eaf17b1). It added Layer 5A, which owns:
- the Ad-invariant metric B_G;
- the orthogonal splitting;
- the centerless semisimple [𝔤,𝔤] with negative-definite Killing form.

Layer 6 owns t_ss,ℂ as a Cartan subalgebra and the root and Weyl comparison. Main's own copy of this README (C5.1, main line 1349) consumes "LieGroups Layer5A and Layer6" for exactly these. At this head C5.1 claims them as its own, so they have two owners.

Witness: main `TauCetiRoadmap/RepresentationTheory/LieGroups/README.md:655–656`: "prove `𝔤 = z(𝔤) ⊕ [𝔤,𝔤]` orthogonally, that `s=[𝔤,𝔤]` is a centerless semisimple ideal, and that its Killing form is negative-definite". Also `:750`: "Prove t_ss,C is a Cartan subalgebra of the complexified semisimple summand".

Repair:
- Replace 1585–1601 with: "Consume LieGroups Layer 5A's Ad-invariant metric B_G, the orthogonal splitting `𝔤=𝔷(𝔤)⊕[𝔤,𝔤]` and the negative-definite Killing form of the centerless semisimple ideal `[𝔤,𝔤]`, and Layer 6's identification of t_ss,ℂ as a Cartan subalgebra with its root characters and Weyl comparison."
- Link Layer 5A next to Layer 6 at `:1575`.
- Keep as C5.1's own work:
  - the scalar comparison of the Haar form with the Killing form on each simple factor;
  - the transport through invariant polynomial functions;
  - the pinned Chevalley restriction.

## R04 (P2) — C1.1b's principal-bundle supplier, TopologicalKTheory T6.4, does not make the cited statement at this head; only main's newer T6.4 does, and this branch conflicts with main there

Location:
- `README.md:19`: "Its T6.4 supplies continuous principal/associated bundles and descent";
- `:332–333`: "Use TopK T6.4 for the independent continuous principal/associated-bundle category";
- `:366–368`: "Use [TopK T6.4]…'s general numerable principal/associated-bundle category and its classifier-independent cylinder homotopy invariance".

Claim: C1.1b applies T6.4 to every Hausdorff topological group G over CW bases. At this head TopologicalKTheory T6.4 is compact-Lie equivariant descent. It builds the bundle category only "needed here" and states no homotopy invariance.

The general foundation is main's T6.4, merged in #1781 (ad30d944) after this branch's merge base. It covers any topological group, numerability and homotopy invariance over X×I. `git merge-tree origin/main HEAD` reports conflicts in `TauCetiRoadmap/TopologicalKTheory/README.md` and `Suggested.lean`. The CharacteristicClasses files merge cleanly.

Witness: at this head, `TauCetiRoadmap/TopologicalKTheory/README.md:1109–1115`: "Let H be a compact Lie group … Build the continuous principal/associated-bundle category needed here". On main, `:1286–1308`: "Continuous principal-bundle foundation … for topological structure groups H … Prove homotopy invariance for a numerable principal bundle over X×I".

Repair: merge main and resolve the TopologicalKTheory conflict so that T6.4 is main's "Continuous principal-bundle foundation", with this branch's TopologicalKTheory repairs on top. Lines 19, 332 and 366 then resolve as written. If the branch's T6.4 is kept instead, C1.1b must state the general numerable principal-bundle category and its cylinder homotopy invariance as its own targets, with locators.

## R05 (P2) — C7.1's L₃ target consumes IndexTheory I7.2, a roadmap later in the merge order that consumes this one

Location: `README.md:2161–2162`: "Compare its pairing on a closed oriented twelve-manifold with IndexTheory I7.2's signature index formula."

Claim: IndexTheory is not on main. It is at position 10 of `ORDER.txt`, and at its open head it consumes "CharacteristicClasses C1–C7", Todd, L and Â classes included; I7.2 itself needs C5. The sentence makes a target of this roadmap depend on I7.2, so the two roadmaps cite each other. The dependency check reads main and cannot see this edge.

The comparison is not needed. The CP⁶ and HP³ Checks at `:2168–2175` already test L₃ against the known signatures.

Witness: IndexTheory head, `TauCetiRoadmap/IndexTheory/README.md:223–226`: "[CharacteristicClasses C1–C7] … universal rings and Todd, L and Â classes". Also `:1357`: "*Needs:* Layers 6.1–6.3; SpinGeometry G2; ComplexKahlerGeometry K5; CharacteristicClasses C5."

Repair: replace 2161–2162 with "IndexTheory I7.2 consumes L₃ for the signature theorem in dimension twelve." Test: `grep -n IndexTheory README.md` then returns only that consumer sentence.

## R06 (P3) — The README still lacks the house shape, and the sampled targets have no Checks or *Needs:* lines (previous R10, not repaired)

Location: `README.md:1` "# Characteristic classes and Chern–Weil theory"; C1.0 (`:230–292`), C2.0 (`:856–929`), C5a.1–C5a.7 (`:1690–2026`).

Claim: The README is 2388 lines long and has:
- 8 **Checks.** blocks;
- 1 *Needs:* line (`:817`);
- no `### Examples` or `### Dependencies` section.

It has no `# Roadmap:` title, **Summary.**, `## Scope and ownership`, `## Exact supplier contracts`, `## How to read the build` or `## Downstream consumers`.

These targets define objects but have no Checks:
- C1.0: the metric transport H^(−1/2) and the SO(n) subbundle;
- C2.0: the disk/sphere relative CW structure;
- C5a.1–C5a.4: j, A_forms, A_CE, H, W(g), CS_P and K_I.

Witness: `grep -c '\*\*Checks\.\*\*'` is 8 and `grep -c '\*Needs:\*'` is 1. `grep -n '^## '` lists "Carriers, scope and suppliers", "Conventions", C1–C7 and "Dependency order and references".

Repair:
- Rename the headings to the house shape.
- Gather the pinned names that are now spread through C1.0–C7 under `## Exact supplier contracts`, with From Mathlib, From Tau Ceti and From TauCetiRoadmap.X subsections.
- Add `### Examples` and `### Dependencies` to each layer.
- Give each sampled target three Checks and a *Needs:* line. These values were computed in the table below:
  - C1.0: H=diag(1,4) sends e₂ to e₂/2, of h₁-norm 1; the Sylvester eigenvalue sums are 2, 3 and 4, all positive; rank 0 has the singleton frame.
  - C2.0: rank 0 gives S(E)=∅ and Thom model X₊; TS² with cells 0, 2 gives Thom cells 2, 4; the sup-ball map sends (1,1) to (1,1)/√2.
  - C5a.1: da(X,Y)=−a([X,Y]) matches Mathlib `d₁₂_apply_apply_ofTrivial`; H¹(SU(2))=0; a torus has zero CE differential.
  - C5a.2: U(2) has weights 2 and 4.
  - C5a.3: F₀=0 and F₁=Ω; τ(−a/2π)=−θ/2π.
  - C5a.4: SU(2) gives Λ(e₃) with De₃=P.
  - C5a.6: SU(2) has Poincaré series 1+t³; U(2) has (1+t)(1+t³).
  - C5a.7: the E8 odd degrees sum to 248.

## R07 (P3) — Three statements about pinned names and the not-statable list are inaccurate

Location and repair:
- **The not-statable list is incomplete.** `Suggested.lean:44–89` omits two comparisons that `README.md:5` names as deliverables: C5a.1's de Rham/Chevalley–Eilenberg comparison for compact groups and C5a.4's Cartan–Koszul comparison. The pins have no all-degree Chevalley–Eilenberg complex. Mathlib `Algebra/Lie/Cochain.lean` and Tau Ceti `Algebra/Lie/Cohomology/LowDegree.lean` stop at 2-cochains, and neither library has a Weil algebra. Repair: add a docstring bullet naming both comparisons and these missing carriers.
- **`IsThomClass.pullback` is described as the wrong theorem.** `README.md:944–945` reads "pullback of Thom classes along fibrewise isomorphisms `TauCeti.IsThomClass.pullback`". The fibrewise-isomorphism theorem is `TauCeti.IsThomClass.singularCohomologyMap` (`Topology/VectorBundle/EulerClass.lean:269`). `IsThomClass.pullback` (`:327`) is its special case for a pullback bundle f*E. Repair: cite both, each for its own statement.
- **`HasCentralRadical` is attributed to the wrong owner.** `README.md:1590` reads "in the sense of LieHighestWeight L9's `LieAlgebra.HasCentralRadical`". This is a Mathlib class (`Mathlib/Algebra/Lie/Semisimple/Defs.lean:75`), which LieHighestWeight consumes. Repair: write "Mathlib's `LieAlgebra.HasCentralRadical`".

Witness: `grep -rn ChevalleyEilenberg` over both pinned libraries is empty. `EulerClass.lean:269` declares `theorem IsThomClass.singularCohomologyMap … (φ : thomPair F E' ⟶ thomPair F E) (g : B' → B) (ψ : ∀ b', … ≅ …)`.

## R08 (P3) — The pull request still changes two files outside its roadmap folders, and the gate fails (previous R11, not repaired)

Location: `Completed/ArithmeticDirichletSeries/README.md` and `TauCetiRoadmap/SymplecticGeometry/README.md`.

Witness: the gate reports "outside-folder=2 … FAIL". `git diff --stat origin/main...HEAD`, excluding the seventeen folders, lists exactly these two files (4 insertions, 4 deletions), from commits b96ce18d and 0d80dc9d.

Repair: move the two loop-cut sentences to their own pull request, or have both folders recognised as this pull request's own, so that the gate passes.

## R09 (P3) — The merge-order paragraph calls #1808 independent, though #1807 and #1808 both conflict with this folder (previous R12, not repaired)

Location: the description's merge-order paragraph: "#1101 → #1807 → this pull request … #1808 is independent of this pull request."

Witness: `overlaps.md` reports that "#1807 and #1854 conflict in … `TauCetiRoadmap/CharacteristicClasses/README.md`" and that "#1808 and #1854 conflict in … `TauCetiRoadmap/CharacteristicClasses/README.md`". The review of #1808 at 6931121 found this pull request's copy of the folder the newer one.

Repair: state that this pull request's CharacteristicClasses folder supersedes the copies in #1807 and #1808, and which branch is rebased onto which. Merging #1808 after this pull request would restore five HomotopySpheres lines. Also name the TopologicalKTheory conflict with main (R04).

## Previous findings (r37, read at c9c60d0)

- **R01 (cycle with TopologicalKTheory): partly repaired.** This README now cites T1.6a and the pinned `finiteOrientedGrassmannian` (`:21–31`, `:308–330`). TopologicalKTheory `:75–81`, `:116–117` and `:384–387` were not changed, so the cells became unowned. Now R01.
- **R02 (HomotopySpheres): repaired.** `grep -c HomotopySpheres` is 0, and the gate's `dropped` is 0. AlgebraicTopology Stage 4.5's coreflection (`:436–438`) and the pinned Spin(3) cover (`:520–526`) replace it.
- **R03 (four AlgebraicTopology names): repaired.** The citations are now:
  - "AT4.7's realization CW structure" (`:674`);
  - "AT2.5's single sup-ball-to-Euclidean-disk homeomorphism" (`:877`);
  - `relativeCWPushoutCarrier` (`:900`);
  - "homotopy-pushout gluing comparison and … `relativeCWPushoutCWModel`" (`:916–917`).

  Each resolves in AlgebraicTopology (552, 833, 850, 910, 1064).
- **R04 (pinned objects planned): repaired.** The Serre-fibration names are at `:76–95`. C1.0 consumes `OrthonormalFrameBundle` and its API (`:230–292`), C2.0 consumes `t2Space_totalSpace` (`:872–875`), and C2.1–C2.2 consume the Thom and Euler names (`:931–1009`).
- **R05 (docstring and absent headlines): repaired.** Both headlines are stated (`Suggested.lean:125, 165`), and the docstring now names the existing carriers. R07 adds one omission.
- **R06 (series restated): repaired.** C6.1 and C7.1 cite 28 pinned series and genus names, and the four definitions are deleted.
- **R07 (five non-headline theorems): repaired.** They are deleted, and the README no longer names them.
- **R08 (C5.1 planned names): repaired.** The pinned `lieCartanRestriction`, `lieChevalleyRestrictionIso`, `killingSymmetricEquiv` and siblings are cited (`:1605–1626`).
- **R09 (locators, manifest): repaired.** Locators were added at the claims:
  - Dupont FBCW A2, A7 and A8 for C5a.1;
  - Dupont CCC 8.3 and Hatcher §3.G for C5a.2;
  - Alekseev–Meinrenken §3.1 for C5a.3–C5a.5;
  - Dupont CCC 8.35 for C5a.6;
  - Hatcher 4D.3 for C5a.7.

  Cartan and Chern–Simons now appear only as attributions, each with a locator into a certified source.
- **R10 (shape, Checks): not repaired.** Now R06.
- **R11 (outside folder): not repaired.** Now R08.
- **R12 (order): not repaired.** Now R09.

## Verified sound

**Gate and build.** The worker's gate at c07dda7 reports `set_option=0 … dropped=0 … stray-files=0 … outside-folder=2 source-material=0 build=0 FAIL`. The only failure is R08.

`lake env lean TauCetiRoadmap/CharacteristicClasses/Suggested.lean` exits 0. The only warnings are `declaration uses sorry`, at 125:8, 149:8, 165:8 and 187:8. The file is 193 lines and has:
- `import Mathlib` plus two `TauCeti` modules, both used;
- no `set_option`, no sorried data and no `lemma`;
- four theorems and no definitions.

**Dependency check**, run this round:

```text
depcheck: 238 roadmaps, 2365 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line. R01 and R05 are edges the check cannot see: it reads TopologicalKTheory from main, and IndexTheory is not on main.

Two other two-way citations were checked, and in both the item-level order is acyclic:
- SpinGeometry: the order G4.1a → C3.5 → G4.3 is stated on both sides (SpinGeometry main:852; README:1445).
- GeneralizedCohomology: G4.0a consumes C1.1b (head line 1844), and C7 consumes G4.0a.

**Signatures and the probe.** `#check @name` was run on all four declarations in a scratch copy. Every binder is in the elaborated type, including `[FiniteDimensional ℝ F]` from the section and `[Module.Projective K R]`. Each type matches its README sentence (`:950–963`, `:1023–1032`, `:2318–2321`).

The `signatures.md` entry "`ContMDiffConstSMul` (instance, line 37)" is an artefact of the docstring, not a declaration.

The one-tactic probe tried `rfl`, `simp`, `infer_instance`, `exact TauCeti.VectorBundleOrientation.exists_isThomClass hι o K` and the pinned section-vanishing lemma, each followed by `done`. It closes none of the four theorems. None is padding.

`exists_isThomClass_of_orientation` follows from `existsUnique_…_fiber` by the same 15-line argument that the pin uses for its compact case (`Orientation/ThomClass.lean:186–209`). It is the classical integral form of Milnor–Stasheff 10.4, so it is kept as a headline.

**Pinned declarations opened** (Tau Ceti 2fd255d9, Mathlib 1b1ccf4b; file:line):
- Orthonormal frames and the orientation cover:
  - `OrthonormalFrameBundle` (OrthonormalFrame/Basic.lean:109), `smul_eq_self_iff` (160), `exists_smul_eq_iff` (172), `continuous_iff` (232), `Trivialization.orthonormalFrame` (323), `orthonormalFrameBundle` (402), `exists_trivialization` (499), `associatedHomeomorph` (564);
  - `pullbackHomeomorph` (OrthonormalFrame/Pullback.lean:97), `Continuous.gramSchmidtNormed_bundle` (GramSchmidt.lean:128);
  - `toOrientationCover` (Orientation/OrthonormalFrame.lean:80), `toOrientationCover_eq_toOrientationCover_iff` (120), `orientationCoverHomeomorph` (309);
  - `deck` (Orientation/Cover.lean:164), `trivializationHomeomorph` (262), `isCoveringMap_proj` (298), `ncard_fiber` (340), `nonempty_iff_exists_section` (498), `nonempty_iff_not_connectedSpace` (533);
  - `prod` and `prodMap` (Orientation/Prod.lean:78, 147), `tautologicalOrientation` (Orientation/Tautological.lean:39), `signLocalSystem` and `signLocalSystemIso` (Orientation/LocalSystem.lean:75, 139), `mapOrientation` (Orientation/Basic.lean:81);
  - `finiteOrientedGrassmannian`, `forget`, `Tautological` and `encard_univ_fullRank` (Grassmannian/Oriented.lean:44–71).
- Thom and Euler classes:
  - `thomPair` (EulerClass.lean:108), `IsThomClass` (245), `IsThomClass.neg` (258), `IsThomClass.singularCohomologyMap` (269), `IsThomClass.pullback` (327), `eulerClass` (356), `eulerClass_naturality` (368), `eulerClass_eq_zero_of_forall_ne_zero` (383), `eulerClass_pullback` (402), `eulerClass_trivial_eq_zero` (412);
  - `exists_singularCohomology_thomPair_fiber` and `exists_isThomClass` (Orientation/ThomClass.lean:121, 186; `[CompactSpace B]`);
  - `existsUnique_singularCohomology_thomPairOver_iUnion` and `isZero_singularCohomology_thomPair` (MayerVietoris/DirectedUnion.lean:227, 301);
  - `exists_singularCohomology_thomPairOver_biUnion`, `singularCohomology_thomPairOver_biUnion_ext` and `exists_isThomClass_of_compactSpace` (MayerVietoris/Basic.lean:561, 519, 612; the last needs `[Subsingleton Kˣ]`).
- Serre fibrations and homotopy extension:
  - `serreFibrations` (SerreFibration/Basic.lean:107), `mem_serreFibrations_iff_cube` (143), `IsCoveringMap.mem_serreFibrations` (179);
  - `hasHomotopyLiftingProperty_cube_of_exists_trivialization`, `mem_serreFibrations_of_exists_trivialization` and `mem_serreFibrations_proj` (FiberBundle.lean:325, 365, 395);
  - `t2Space_totalSpace` (FiberBundle/Separation.lean:37), `hasHomotopyExtensionProperty_base` (Extension/CWComplex.lean:142), `HasHomotopyExtensionProperty.image` (Extension/Basic.lean:275).
- Spin, manifolds and Lie theory:
  - `isCoveringMap_realCliffordSpinDoubleCoverZero_rightHom` (Spin/Covering.lean:108), `realSpinThreeHomeomorphQuaternionSphere` (Spin/SimplyConnected.lean:124), `pathConnectedSpace_realCliffordSpinGroupZero_add_two` (Spin/Connected.lean:106), `realCliffordSpinLastLocalSection` (Spin/SphereSection.lean:142);
  - `instIsManifoldQuotient` (Geometry/Manifold/Instances/Quotient.lean:242, under `[ContMDiffConstSMul I n G M]`), `RealProjectiveSpace` (UniversalCover/RealProjective/Basic.lean:60);
  - `eulerChar` (Cellular/EulerCharacteristic/FiniteCWType.lean:123), `evalFundamentalClass` (Cohomology/FundamentalClass.lean:88), `Manifold.Orientation.toVectorBundleOrientation` (Geometry/Manifold/Orientation/Basic.lean:109), `localOrientation` (LocalHomology/Orientation/Linear.lean:138), `FiniteRankBundleCore.ofBundle` (FiniteRank/Basic.lean:209);
  - `isUnitarizable` (Compact/Unitarizable.lean:241), `lieCartanRestriction` (Killing/CartanRestriction.lean:203), `map_dualMap_killingSymmetricEquiv` (247), `killingSymmetricEquiv` (Killing/SymmetricAlgebra.lean:60) with its `_lieModuleDerivation` (94) and `map_…_lieInvariants` (110), `lieChevalleyRestrictionIso` with `coe_…_apply` and `…_mem_homogeneousSubmodule_iff` (HighestWeight/ChevalleyRestriction.lean:151, 163, 177);
  - `SymmetricAlgebra.lieInvariants` (SymmetricAlgebra/LieModule.lean:171), `linearInvariants` (CentralCharacter/Linear.lean:100), `deRhamCohomology` (DeRham/Basic.lean:127), `CovariantDerivative.curvatureOperator` (Curvature/Basic.lean:89), `classifyingSpace` (ClassifyingSpace/Basic.lean:73), `singularCup` (Cohomology/Cup.lean:203).
- Series (RingTheory/PowerSeries):
  - `multiplicativeSequence` (MultiplicativeSequence.lean:110) and its nine API names (160–373), checked against the K₃ formula;
  - `hirzebruchLSeries` (CharacteristicSeries.lean:245, `rescale 2 B + X`), `aHatSeries` (147) and their quotient, coefficient and evenness lemmas (101–296);
  - the genus polynomials `…_bernoulli'PowerSeries_one/two/three`, `…_cartier_hirzebruchLSeries_one/two` and `…_cartier_aHatSeries_one/two` (GenusPolynomials.lean:65–158), whose stated values equal C7.1's Td₁–Td₃, L₁, L₂, Â₁ and Â₂.
- Mathlib:
  - `instChartedSpaceQuotient` (Instances/Quotient.lean:50), `IsImmersion` (Immersion.lean:802) and `IsImmersion.id`, `ContMDiffConstSMul` (Algebra/SMul.lean:91), `contMDiff_neg_sphere` (Instances/Sphere.lean:465);
  - `d₁₂_apply_apply_ofTrivial` (Lie/Cochain.lean:118, `= −f⁅x,y⁆`), `IsKilling.instSemisimple` (Lie/Killing.lean:76), `InvariantForm.isSemisimple_of_nondegenerate` (InvariantForm.lean:194), `InvariantForm.orthogonal` (73), `HasCentralRadical` (Semisimple/Defs.lean:75);
  - `exists_embedding_euclidean_of_compact`, `sSetTopAdj`, `cechComplexFunctor`, `esymmAlgEquiv`, `symmetricSubalgebra`, `compactlyGeneratedToTop`.
- **Absent at the pins**, which confirms the docstring's not-statable list: a relative cup on `TopPair`; a graded singular cohomology ring; a de Rham/singular comparison; a Chern–Weil map; Chern, Stiefel–Whitney or Pontryagin classes; topological K-theory; an infinite Grassmannian; an all-degree Chevalley–Eilenberg complex.

**Cross-roadmap citations resolved:**
- At this head:
  - AlgebraicTopology Stages 2.5 (552), 4.5 (133, 757, 833, 850, 910), 4.7 (1064), 4.8 (1091), 5.5, 6.0 (1427), 8.2, 8.3, 8.5 (2221, 2258, 2296), 8.8b (2434), 8.9–8.12 (2591, 2629, 2668, 2788), and the supported-cellular supplement (1654–1722);
  - TopologicalKTheory T1.3, T1.4, T1.5, T1.5a (307), T1.6a (381) with its colouring lemma, rank-one RP∞/CP∞ (669), T3.4, T4.8, T6.4 (1109), T7.4;
  - GeneralizedCohomology G4.0a (1782–1783, 1844);
  - MorseNovikov N6.
- On main c58403c:
  - SpinGeometry G4.1a (397), G4.1b (425), G4.3 and G4.4 (52). The `overlaps.md` lead "G4.1a only at #1674" is false.
  - LieGroups Layers 1, 5A, 6; CompactGroups Layers 0–1; LieHighestWeight Layers 1 and 9; LieGroupoidsPoisson §G1.3a (636); ReflectionInvariantTheory §§1–4; TopologicalSheafCohomology TS1.1–TS1.2; SchubertGeometry S9.6 (line 120); AffineMorseLefschetz A4.0; MorseTheory M5; RiemannianGeometry R3; ConvexityToric T2.
- At #1077's head: IndexTheory I7.2 (1338), for R05.

**Ownership.** `roadmaps grep` was run over main and the open heads for "Weil algebra", "Gysin sequence", "Chern–Weil homomorphism" and "primary obstruction". Outside the three copies of this folder (#1807, #1808, #1854), the topological objects appear only as consumers. The Gysin hits in the p-adic, étale and Lefschetz roadmaps concern other cohomologies.

**Sources read at their locators** (cache line, printed page):
- dupont-ln:
  - Proposition 2.20 (532, p. 15): local isometric trivializations by Gram–Schmidt;
  - Proposition 2.21 (566, p. 16): FO(V), the right O(n)-action with orbits FO(V_p), equivariant charts;
  - Example 4.3 (976, p. 32): a metric is a reduction to O(n), an orientation a reduction to GL⁺;
  - Proposition 9.1 (2138), Proposition 9.3 (2195), Theorem 9.5 (2244) and Lemma 9.6 (2264, pp. 78–79);
  - Proposition A2 (2627, p. 93): invariant forms ≅ Alt(g/h)^H, with exactly the README's differential;
  - Proposition A7 (2713, p. 95) and Theorem A8 (2752, p. 96; G compact and connected).
- dupont-ccc:
  - Chapter 4, Exercise 3, (4.15)–(4.17) (2247–2264, pp. 69–70): `TP(θ)=k∫P(θ∧U_s^(k−1))` with `U_s=sΩ+½(s²−s)[θ,θ]`;
  - Theorem 8.1 (3514, p. 114), Proposition 8.3 (3548, p. 115) and Corollary 8.35 (3989, p. 130), all with real coefficients.
- hatcher-vbkt: §1.1, p. 16 (636–647), S(E) and D(E); §1.2, p. 26 (1017–1033), the Gram–Schmidt retraction GL_n→O(n); §3.2, p. 88 (3426–3443), the Thom class of (D(E),S(E)) and the Euler class.
- cohen-fiber-bundles: Chapter 3 §2, (2.4) (2950, pp. 86–87) and Proposition 3.7 with its proof (2979–2992, pp. 87–88), including S(ζ×η)=S(ζ)×D(η)∪D(ζ)×S(η).
- alekseev-meinrenken §3.1 (332–373, pp. 9–10): W g = Sg*⊗∧g* as equation (10), the Koszul algebra, F^θ=dθ+½[θ,θ], and the basic subcomplex (Sg*)^inv with zero differential.
- hatcher-at: Theorem 3C.4 (12343), Corollary 4D.3 (18734), and the §3.G table (14230–14239: SU(n) 2,…,n; E8 2,8,12,14,18,20,24,30).
- zentner-instanton-sheet2: Exercise 2 (45–61): `p₁(su(E))=−4c₂(E)+c₁(E)²`.

At every sampled target the source supports the statement as written, with the reservations listed under Source issues.

**Adversarial table** (values computed this round):

| Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- |
| `existsUnique_…_thomPair_fiber` (L125) | B=pt rank 1; K=𝔽₂; rank 0 on two components | o=ω gives u=g, o=−ω gives −g; over 𝔽₂, −g=g so both clauses agree; rank 0: H⁰(pt,∅)=K and u=(1,−1); uniqueness: on each trivializing set fibre restrictions determine the class (`…_biUnion_ext`, s singleton), and the `iUnion` ∃! glues | true; not one-tactic |
| `exists_isThomClass_of_orientation` (L149) | B=ℝ trivial; K the zero ring; Möbius line | pullback of the generator, fibre restriction a generator; H=0 and span{0}=⊤; no orientation exists, so hypotheses unsatisfiable | true; corollary of L125 by the pin's argument |
| `eulerClass_eq_zero_iff_exists_ne_zero` (L165) | TS²; S²×ℝ²; O(1)_ℝ on CP¹; su(F) on HP¹; B=∅ | e=2, no section; e=0, constant section; e=1, none; rank 3 with a 4-cell violates `hdim`, e∈H³(S⁴)=0, yet no section; both sides true | true; `hdim` necessary |
| `not_exists_isImmersion_…` (L187) | k=1,2,3; ℕ subtraction; vacuity | targets 2, 6, 14; w̄_(m−1)=a^(m−1): (1+a)³=1+a+a²+a³ mod 2 gives a³≠0 on ℝP⁴; 2^(k+1)≥4, so no truncation; quotient charts are smooth-compatible (target instance), so the identity is an immersion and the statement is not vacuous | true |
| C1.0 metric transport | H=diag(1,4); Sylvester; non-commuting metrics | h₁(e₂/2,e₂/2)=4·¼=1; eigenvalue sums 1+1, 1+2, 2+2 > 0; H₁^(1/2)H₂^(1/2) not symmetric | correct |
| C1.0 cover = frames/SO(n) | pinned iff; n=1 | same image ⇔ q=op g•p with det g>0; O(1)/SO(1) gives 2 points | agrees with the pin |
| C1.1a carrier | r=N; r=0; added-line sign | `encard_univ_fullRank`=2 matches "two orientations"; `r : ℕ+` excludes 0, as the README does; (−1)^(n−1): −1 for n=2, +1 for n=3 | correct; ownership is R01 |
| C1.1d [Sⁿ,O(k)] table | k=2, n=1; k≥3; n=2 | J R(θ) J⁻¹=R(−θ) gives ℤ⋊ℤ/2; π₁=ℤ/2 with trivial action gives (ℤ/2)²; π₂(O(k))=0 gives ℤ/2 | correct |
| C1.2a S0–S4 vs AlgebraicTopology | definition of C_K; H¹_c(ℝ) | both use C*(X,A∪(X∖K);L); x² acts on H¹_c(ℝ;ℤ)=ℤ by 0 in AlgebraicTopology's Check, consistent with S3 | same object, two owners (R02) |
| C2.0 cells | rank 0; TS² (cells 0, 2); v=(1,1) | S(E)=∅, D(E)=X, Thom model X₊; Thom cells 2, 4 give H̃*(Th)=ℤ in degrees 2 and 4, matching the Thom isomorphism; image (1,1)/√2 has ‖·‖₂=1=‖v‖∞ | correct |
| C2.1 Checks | Möbius over 𝔽₂ and over ℤ | `[Subsingleton (ZMod 2)ˣ]` gives a Thom class; the connected cover gives no orientation (`nonempty_iff_not_connectedSpace`) | correct |
| Euler-form convention | block [[0,−α],[α,0]] | Pf=−α gives −dα/2π; c₁=(i/2π)(i dα)=−dα/2π | e=c₁ |
| C2.3 pullback identity | identity, antipodal and constant maps on S² | 2·1=2; (−1)·2=−2; 0, against Lefschetz number 1 | correct |
| C5a.1 CE complex | degree 1; 2d=Σeᵃ∧L; SU(2); torus | (−1)^(0+1)a([X,Y]) equals Mathlib −f⁅x,y⁆; (L_X a)(Y)−(L_Y a)(X)=−2a([X,Y])=2da(X,Y); H¹=ann(g)=0; [g,g]=0 gives H¹=g* | correct |
| C5a.2 rational structure | U(2); θ↦e^(iθ) | invariant degrees 1, 2 give weights 2, 4 and rank 2 generators; (i/2π)(ia)=−a/2π | correct |
| C5a.3 Weil algebra | F_t; endpoints; Bianchi; rank one | t(Ω−½[θ,θ])+½t²[θ,θ]=tΩ+½(t²−t)[θ,θ], Dupont's U_s; F₀=0, F₁=Ω; d_WΩ=[Ω,θ]=−[θ,Ω]; CS_P=P(θ)=−θ/2π | correct |
| C5a.4 Koszul model | SU(2); trivial group | K_I=ℝ[P]⊗Λ(e₃), De₃=P; quotient Λ(e₃)=H*(S³;ℝ); empty system gives ℝ | consistent |
| C5a.5 transgression page | z_i∈E^(0,2d_i−1) | d_(2d_i) lands in E^(2d_i,0); π₁(BK)=π₀(K)=0 | well formed |
| C5a.6 Poincaré series | SU(2), U(2), SU(3), trivial | 1+t³; (1+t)(1+t³), Betti 4, top degree 4; (1+t³)(1+t⁵), top 8; P(−1)=0; trivial group 1; Σ(2d_i−1)=2N+r=dim K | correct |
| C5a.7 degrees | U(n); E8; SU(2)/N(T); n=2 triangular | Σ(2d−1)=n²; 3+15+23+27+35+39+47+59=248; ℝP²: H⁰=ℤ, H²=ℤ/2; 1-dimensional abelian, centre ⊄ [g,g]=0 | correct |
| C5.1 splitting | SU(2) Killing form | κ(e₁,e₁)=−8<0, as in LieGroups 5A's Check | same object as LieGroups 5A (R03) |
| C6.1 series | L, Td, Â; coefficients | 2x/(e^(2x)−1)+x=x coth x; e^(x/2)·(x/2)/sinh(x/2)=x/(1−e^(−x)); 4·(1/6)/2=1/3; 16·(−1/30)/24=−1/45 | equal to the pins |
| C7.1 L₃ | q₃; K₃; CP⁶; HP³; HP² | 64·(1/42)/720=2/945; −7/945−6/945=−13/945 and 35+21+6=62 (over 945); (2170−1911+686)/945=1; p(HP³)=1+4u+12u²+8u³ gives (496−624+128)/945=0; (49−4)/45=1 | correct; pinned K₃ form |
| C7.AdjointHopf | Z=diag(1,−1); roots; HP¹; a section | X=0, Y=diag(−i,i); e₂(0,x−y,y−x)=−(x−y)² so p₁=c₁²−4c₂; ⟨p₁,[HP¹]⟩=−4; ε¹⊕P gives p₁=e(P)²=0 since H²(S⁴)=0, a contradiction | correct; Zentner line 50 |

## Not verifiable

- Milnor–Stasheff §10 Theorem 10.4 (the C2.1 headlines), §12 (the C2.2 headline), §18 Lemma 18.1 (C2.0's Thom-space cells), §4 (the C7.3a headline), §19 and Theorem 15.3. Also Milnor, *Topology from the Differentiable Viewpoint* §6; Milnor, *Construction of Universal Bundles II* §§2–3; and Bott–Tu. All are settled `uncertified` in the manifest and cited by locator, and their texts were not read. The mathematics of those headlines was checked independently: the table above and the pinned compact-base proofs.
- tom Dieck 14.4.3 (C1.1b) and May Chapter 16 (C1.2b) are outside the seeded sample and were not read this round.

## Source issues

- **Misprint** in cohen-fiber-bundles at Proposition 3.7, p. 87: the source puts the second bundle η over X and the product bundle over X∧Y; it should put η over Y and ζ×η over X×Y, with only the Thom space a smash product; affects nothing.
- **Misprint** in zentner-instanton-sheet2 at Exercise 2, p. 1: the source calls the endomorphisms defining su(E) "skey-adjoint"; it should say skew-adjoint; affects nothing.
- **Gap** in zentner-instanton-sheet2 at Exercise 2(b), p. 1: the source derives the integral identity p₁(su(E))=c₁²−4c₂ through the Chern character, which determines classes only modulo torsion; it should use the integral splitting principle (roots 0, ±(x−y)) or assume torsion-free H⁴; affects the proof.
