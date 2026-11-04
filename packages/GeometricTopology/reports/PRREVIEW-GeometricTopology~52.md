# Review of GeometricTopology (pull request #1791 at fcad6f1)

**Verdict:** needs changes

:robot: AI review of the folder `TauCetiRoadmap/GeometricTopology/` at this head. The pull request changes three lines of this README (lines 754, 884 and 892: links to the SurfaceTopology and PlanarTopology roadmaps that exist only at the head of pull request #271); every other byte of the folder, including `Suggested.lean`, the `references/` directory and the residue line, is main's. Findings R01–R08 concern the new lines and the gate at this head; R09–R31 are the unrepaired findings of the previous review of this same text (pull request #271 at 9bd6e07), re-checked against the unchanged passages and kept because they are defects of the folder as it stands at this head. The open revision pull request #903 of this folder (accepted by its last review at 309be2f) already carries these two citations with section numbers and `*Needs:*` lines (its README at lines 423–428, 806–807, 826 and 847); this three-line edit against main's text is a weaker duplicate of that and will conflict with it.

## R01 (P1) — The new SurfaceTopology citation closes a supply cycle

**Location:** `TauCetiRoadmap/GeometricTopology/README.md:754`: “classification for the splitting surface from [Surface Topology]”; also line 892: “The generalized maps of the [Surface Topology] roadmap”. **Claim:** SurfaceTopology is a supplier of Layer 9 (and informs Layer 11). **Witness:** SurfaceTopology at the #271 head (421e114) lists GeometricTopology Layer 11 as *its* supplier: its supplier-contract table row “The ordered-simplex chain complex in GeometricTopology layer 11 … | 7's finite simplicial input” (README line 90), “Consume the ordered-simplex complex and the simplicial chain maps through `GeometricTopology` layer 11” (line 1011), and “use `GeometricTopology` layer 11's CW structure on the subdivided flag complex” (line 1145). With this PR the two roadmaps cite each other: GeometricTopology L9 → SurfaceTopology L8/L9 → (SurfaceTopology L7) → GeometricTopology L11. The dependency check does not see it: SurfaceTopology is neither on main nor in `ORDER.txt`, so edges to it are outside its universe (see the probe under Verified sound: a control line citing HomotopySpheres is flagged UPWARD and CYCLE at once; lines citing SurfaceTopology add no edge). No native owner breaks the cycle: Tau Ceti at the pin has `cellularChainComplex` (`TauCeti/AlgebraicTopology/Cellular/Chains.lean:364`) but no ordered simplicial chain complex under `TauCeti/AlgebraicTopology/SimplicialComplex/`.

**Repair:** fix one direction. Since the stated purpose of this PR is that SurfaceTopology supplies GeometricTopology, the consistent repair is on the SurfaceTopology side: its Layer 7 must not consume GeometricTopology Layer 11 (it can own its own finite ordered simplicial chain complex on finite complexes, or consume the native `cellularChainComplex` directly) and its contract table must drop the two GeometricTopology rows. Until that lands, this README cannot cite SurfaceTopology; the alternative is to keep SurfaceTopology downstream and delete both new citations here. Tested on the instance: with the SurfaceTopology rows removed, the only remaining edges are GeometricTopology → SurfaceTopology and SurfaceTopology → PlanarTopology, and the two-roadmap cycle disappears.

## R02 (P2) — PlanarTopology does not supply Radó's theorem in the generality claimed

**Location:** `TauCetiRoadmap/GeometricTopology/README.md:884`: “The dimension 2 case, Rado's theorem, is handled by the [Planar Topology] roadmap.” **Claim:** triangulability of surfaces (the dimension-2 instance of the general `IsTriangulable`) is supplied there. **Witness:** PlanarTopology at 421e114 proves Radó only for compact surfaces: its Layer 5 statement carries `[CompactSpace M]` (README lines 816–822: “Every compact surface, with or without boundary, is the realization of a finite combinatorial surface”), and line 886 says “the general noncompact Radó is out of scope”. The open disc ℝ² is a surface, is triangulable (Radó 1925, Moise Thm 8.3 covers only the compact case cited there), and is not compact, so the sentence cites a supplier for a statement it does not make; the noncompact dimension-2 case has no owner.

**Repair:** write “for compact surfaces, PlanarTopology Layer 5 (`isTriangulable_of_compactSurface`)” and either make the noncompact dimension-2 case an explicit target of this layer, with the second-countability hypothesis Radó needs, or state in Scope that it is unowned. On the instance: the compact disc is then PlanarTopology's and the open disc is this roadmap's.

## R03 (P1) — The build gate fails on the module-system warning

**Location:** `TauCetiRoadmap/GeometricTopology/Suggested.lean:1`: `import Mathlib`. **Claim:** the acceptance file passes the targeted build. **Witness:** the worker's gate records `build=1 FAIL` with the single warning that `Mathlib` is designed for the module system and the file should start with `module`. The file is byte-identical to main's. A direct elaboration of a copy under `lake env lean` emits nothing (the warning is Lake's, not Lean's), so this is the gate's classification, not an elaboration failure.

**Repair:** start the file with `module`, then `public import Mathlib` (and `public section` once any declaration is added, so that headlines are not private), and rerun the targeted build until `build=0`. Never suppress the warning with an option.

## R04 (P3) — Supplier citations name no section, and the mapping-class citation still points at Layer 3

**Location:** `TauCetiRoadmap/GeometricTopology/README.md:754`, 884, 892, and 757: “(consume layer 3's surface mapping classes; …)”. **Claim:** the new links identify what is consumed. **Witness:** the three new citations are bare roadmap links with no section or target; the house rule is roadmap name plus section. The objects live at SurfaceTopology Layer 8 (`exists_standard_homeomorph`, `classification_of_surfaces`, 421e114 README lines 1205–1216) and Layer 9 (full, rel-boundary and orientation-preserving mapping classes, lines 1321–1325), and PlanarTopology Layer 5. Line 757 was not updated: this roadmap's Layer 3 is diffeomorphism-group topology and defines no surface mapping classes (previous finding R15, partly repaired by line 754 only).

**Repair:** cite “SurfaceTopology Layer 8” at line 754, “SurfaceTopology Layer 9” at line 757, “PlanarTopology Layer 5” at line 884 and “SurfaceTopology Layer 1” at line 892, after R01 is settled; the open revision #903 of this folder already states exactly these (its lines 806–807, 826, 847), so the edit belongs on that text rather than on main's.

## R05 (P3) — Decidability of the two-dimensional link condition needs a finite complex

**Location:** `TauCetiRoadmap/GeometricTopology/README.md:892`: “In dimension 2 the condition is decidable and recursion is unnecessary.” **Claim:** being a combinatorial 2-manifold is decidable. **Witness:** the locally finite triangulation of the plane by equilateral triangles has every vertex link a 6-cycle, but the condition quantifies over infinitely many vertices and admits no finite decision; the sentence holds for finite complexes (each vertex link is a finite graph, and “cycle” versus “path” is a finite check). SurfaceTopology's generalized maps, cited in the same sentence as the complementary encoding, are finite by construction (`GMap` is on `[Fintype D]`, 421e114 README line 290), so the comparison is also a statement about finite complexes.

**Repair:** “For a finite complex the condition is decidable: a vertex link is a combinatorial 1-sphere exactly when it is a cycle and a 1-ball exactly when it is a path, so no recursion is needed.” Keep the infinite plane as the negative control.

## R06 (P3) — The residue gate still fails

**Location:** `TauCetiRoadmap/GeometricTopology/README.md:534`: “layer-4-to-layer-5 handoff that lean-eval lacks”. **Witness:** the worker's gate and my rerun both report `residue=1`. **Repair:** replace the process wording by the mathematics (the knot exterior is the compact manifold with one torus boundary per component that surgery fills). Rerun the gate until `residue=0`.

## R07 (P3) — Source extracts are stray files

**Location:** `TauCetiRoadmap/GeometricTopology/references/` (25 files). **Witness:** `stray-files=1` in both gate runs. **Repair:** delete the directory; sources are the README's references, cited by theorem and page. Replace every `[extract](references/…)` link by the bibliographic locator.

## R08 (P3) — A file outside the named folders is changed

**Location:** `Completed/ConformalMapping/README.md:163–169`, the added “Elementary proof comparison — PlanarTopology” bullet. **Witness:** the prescribed filtered three-dot diff lists exactly this file, seven insertions; the brief names only `GeometricTopology` and `BelyiMaps` as this pull request's own folders. **Repair:** move the edit to its own pull request, or have the brief for this one name the folder. (The `BelyiMaps` entry of the gate's `outside-folder` is authorized and is not a finding.)

## Carried findings: the unchanged text (R09–R31)

Each of these was raised by the previous review of this text (pull request #271 at 9bd6e07); the passages are byte-identical at this head and no repair report marks any of them settled. Witnesses were re-read at the current pins and in the cached sources this round where noted.

## R09 (P1) — The foliation headline reverses the cited theorem

**Location:** README:810–824: “a witness foliation violating it”. **Witness:** a small bounding sphere has pairing 0 and −χ = −2, so the proposed inequality fails for every foliation; the source's Main Theorem is a parity-compatible class of dual Thurston norm one realized by *no* taut foliation (yazdi2016 lines 111–114), and the bound is Thurston's theorem, not his conjecture. **Repair:** define the Thurston norm and realization; target “norm-one class not realized” (Yazdi) separately from the bound; on the bounding sphere the corrected bound reads 0 ≤ 0.

## R10 (P1) — PL embeddings need not be locally flat

**Location:** README:327: “Smooth and PL embeddings are locally flat”. **Witness:** the cone on a polygonal trefoil is a PL disc in D⁴ whose vertex link complement has the nonabelian trefoil group; a flat disc's local complement group is ℤ. **Repair:** keep the smooth assertion with immersion hypotheses; the PL one needs the link condition. Trefoil cone negative, unknot cone positive.

## R11 (P1) — The JSJ definition admits redundant tori

**Location:** README:713–718: “canonicity (up to isotopy)”. **Witness:** on T³ both the empty family and one coordinate torus leave only Seifert-fibred pieces; counts 0 and 1. Native `TauCeti.IsJSJDecomposition` (`TauCeti/LowDimTopology/JSJDecomposition.lean:210`) carries the minimality law. **Repair:** consume it, or keep its minimality law in any enriched object.

## R12 (P1) — Smale is written as a topological-group isomorphism

**Location:** `Suggested.lean:43`: “Diff (sphere 3) ≃ₜ* orthogonalGroup 4”. **Witness:** O(4) is compact; Diff(S³) is not (derivative norms eᵗ along a flow). **Repair:** the canonical inclusion is a homotopy equivalence, which is `TauCeti.SmaleConjecture` (`TauCeti/Geometry/Diffeomorphism/Smale.lean:46`), statable now (R25).

## R13 (P2) — Cerf's connectedness omits orientation preservation

**Location:** README:1040: “π₀(Diff S³) = 0”. **Witness:** identity and a reflection have degrees +1 and −1 and lie in different components. **Repair:** π₀(Diff⁺S³) = 0, or π₀(Diff S³) ≅ ℤ/2.

## R14 (P1) — Concordance endpoints are replaced by mirrors

**Location:** README:609: “boundary Σ = K ⊔ K'.mirror”; 588–589. **Witness:** the trefoil cylinder has the trefoil at both ends with equal signature 2, so reflexivity fails for the mirror convention; the square knot is concordant, not isotopic, to the unknot. **Repair:** actual endpoints with the incoming orientation reversed; consume native `Concordance`/`Concordant` (`TauCeti/Geometry/Manifold/SmoothEmbedding/Concordance.lean:93,101`); reverse-mirror is the group inverse only.

## R15 (P2) — Zeeman's conjecture omits finiteness

**Location:** README:905–907: “for a contractible `2`-complex”. **Witness:** an infinite triangulated plane times I never collapses to a point in finitely many steps. Native `Contractible2Complex` (`TauCeti/AlgebraicTopology/SimplicialComplex/Zeeman.lean:62`) includes finiteness. **Repair:** finite complex, finite sequence; keep it a stated conjecture.

## R16 (P1) — The link recursion rejects dimension zero

**Location:** README:885–892, 911: “`(n-1)`-sphere … or `(n-1)`-ball”. **Witness:** a point has an empty vertex link; at n = 0 natural subtraction gives the 0-sphere (two points) or 0-ball (one point), neither empty. Native `IsCombinatorialManifold` (`…/CombinatorialManifold/Basic.lean:214`) splits zero and successor. **Repair:** consume the native split; restrict ∂Δⁿ ≃ Sⁿ⁻¹ to n ≥ 1.

## R17 (P2) — The smooth-link carrier omits immersion and multiple components

**Location:** README:483: “{ f : C^∞(circle, M) // IsEmbedding f }”. **Witness:** t ↦ t − sin t is a smooth circle homeomorphism with derivative 0 at 0; one circle cannot carry the empty link or an unlink. **Repair:** `Manifold.IsSmoothEmbedding` (`Mathlib/Geometry/Manifold/SmoothEmbedding.lean:72`, elaborated this round) on finite disjoint unions of circles.

## R18 (P2) — Quotient geometries need free actions and interiors

**Location:** README:711–731: “for a discrete `Γ ≤ Isom X`”. **Witness:** {±I} on E³ fixes 0; the quotient's vertex link is ℝP², not S². A compact cut piece has boundary; the complete geometry lives on its interior. **Repair:** free properly discontinuous actions; geometry on interiors with the finite-volume qualifications.

## R19 (P2) — Local flatness lacks a boundary model

**Location:** README:303–304: “manifolds (allowing boundary)” with full linear slices. **Witness:** the ray [0,∞) ↪ ℝ has a one-component punctured image germ at 0; a full slice has two. **Repair:** separate boundaryless, boundary-disjoint and neat variants (native `IsLocallyFlat`, `TauCeti/Geometry/Manifold/LocallyFlat/Basic.lean:376`, and `LocallyFlat/Neat.lean`).

## R20 (P2) — Heegaard existence exceeds the handlebody scope

**Location:** README:746, 751–762: “Every closed 3-manifold”. **Witness:** ℝP² × S¹ is closed and nonorientable; a union of two orientable handlebodies (boundary-sums of solid tori) along a connected surface is orientable. Scharlemann §2.1 states the triangulation input for compact connected manifolds (scharlemann2002 lines 88–91). **Repair:** state the theorem for connected closed orientable 3-manifolds, or add nonorientable handlebodies.

## R21 (P1) — The Conway route imports the wrong obstruction

**Location:** README:515–516, 601–603: “jointly with … `τ`”. **Witness:** the source proves the trace-equivalent knot K′ non-slice with Rasmussen's s and remarks τ(K′) = 0 (piccirillo2020 lines 100–104); |τ| ≤ g₄ gives only 0 ≤ g₄(K′). CombinatorialHeegaardFloer on main supplies τ, not s. **Repair:** state the trace argument and name a real owner of s, or cut the 0-shake-genus unlock.

## R22 (P1) — The supplier relationship with CombinatorialHeegaardFloer is cyclic

**Location:** README:35–39, 577–603. **Witness:** `TauCetiRoadmap/CombinatorialHeegaardFloer/README.md:227` on main consumes this roadmap's Layer 4; this roadmap consumes its τ and grid adequacy. Invisible to the dependency check for the same reason as R01 is not: both are on main, so it is a cycle among main roadmaps that the tool does not report. **Repair:** keep the foundations here; move the Floer-dependent applications to a Part II.

## R23 (P1) — Internal supplier citations name nonexistent supplies (partly repaired)

**Location:** README:720, 735, 751, 757. **Witness:** Layer 1 builds connected sums, not prime decomposition, and defines no handlebody; Layer 3 has no surface mapping classes. Line 754 now cites SurfaceTopology for the classification (repaired, subject to R01/R04); the other three remain. **Repair:** target prime decomposition with uniqueness; place handlebodies before splitting existence; cite SurfaceTopology Layer 9 at 757.

## R24 (P2) — Native objects are planned again

**Location:** `Suggested.lean:22–35`; README Layers 1–3, 5, 7–8, 11, including 853–865. **Witness:** at the pin, `PLGroupoid` (`TauCeti/Geometry/Manifold/PLGroupoid.lean:106`), `IsJSJDecomposition`, `Concordance`, `riemannianVolume` (`…/VolumeDensity/Volume.lean:76`), `IsTriangulable` (`TauCeti/Topology/Triangulable.lean:40`), `SimplicialMap.realizationMap` and the Hausdorff/quotient facts on realizations all exist; the README says Mathlib and Tau Ceti have “none” of them. **Repair:** import them in supplier contracts and keep only the genuinely missing extensions (the ordered CW comparison among them).

## R25 (P2) — Statable headlines remain absent

**Location:** `Suggested.lean:29–35`, 59: “no compiled targets to state against the pin yet”. **Witness:** a scratch theorem `: TauCeti.SmaleConjecture` elaborates with only the sorry warning this round (Verified sound). **Repair:** state Smale and audit annulus, Freedman, Mostow, virtual fibering, JSJ, geometrization and Poincaré individually; name each missing carrier in the docstring.

## R26 (P2) — Two end theorems are unnecessarily narrowed

**Location:** README:773, 914. **Witness:** Li's discrepancy is arbitrarily large (li2013 lines 66–68); non-triangulable manifolds exist in every dimension ≥ 5 (manolescu-lectures lines 7 and 15). The targets keep a strict gap and dimension five. **Repair:** quantify over the gap and over n ≥ 5; keep gap one and n = 5 as Checks.

## R27 (P2) — Executable algorithms remain deliverables

**Location:** README:471–479: “multiple algorithms for the same invariant”. **Repair:** keep the Seifert, skein, Burau and bracket constructions with agreement theorems; drop the implementation requirement; unknot 1 and trefoil t − 1 + t⁻¹ are the Checks.

## R28 (P2) — Named milestones still lack mathematical contracts

**Location:** README:286, 400–404, 562–570, 613, 687. **Witness:** no fake ℝP⁴ is constructed; Watanabe's class has no degree (the first nontrivial one is detected in A₂ ≅ ℚ through the surjection π_k BDiff(D⁴,∂) ⊗ ℚ → A_k, watanabe2018 lines 32–36); cosmetic surgery has no slope or orientation quantifiers; the homology-sphere concordance names no ambient cobordism. **Repair:** objects, hypotheses, quantifiers and locators for each.

## R29 (P3) — Incorrect source locators remain

**Location:** README:406, 568, 853–880, 1043, 1133. **Witness:** Kirby 4.34 asks whether Diff(S⁴) ≃ O(5) (kirby1997 line 5950), not Hatcher's S³ theorem; Property R is 1.16 (line 425) and 1.82 is the framed-link form (line 1638); the Acta paper is by Yazdi alone (yazdi2016 line 6), not Gabai–Yazdi; the realization/CW block has no locator (Hatcher A.1 supports its compactness clause, hatcher-at lines 22534–22535). **Repair:** correct the numbers and attribution; add locators.

## R30 (P3) — Invariant and cellular sign conventions are incomplete

**Location:** README:505–506, 601–611, 869–879. **Witness:** Δ and −Δ are both symmetric; the trefoil's one-sided signatures at an Alexander root are 0 and 2, average 1 (livingston2005 line 228 defines σ_ω as that limiting average); reflecting the interval's characteristic map turns ∂ab = b − a into a − b. **Repair:** Δ(1) = 1; pin the bracket/writhe trefoil value; oriented ball-to-simplex maps with ∂₀ = 0.

## R31 (P3) — The required shape, APIs and Checks are missing

**Location:** README:1, 177–953. **Witness:** no Summary/Scope/Conventions/supplier-contract sections, no per-target `*Needs:*` lines, no layer-closing Examples/Dependencies, definitions without three discriminating Checks. **Repair:** the README shape of the brief; the open revision #903 of this folder already has it.

## Previous findings

Of the previous review (pull request #271 at 9bd6e07): R01–R23 not repaired (text unchanged), carried here as R09–R31, with R15 partly repaired at line 754 only; R24 (residue) not repaired, here R06; R25 (stray files) not repaired, here R07; R26 (build) not repaired, here R03; R27 (ConformalMapping edit) not repaired, here R08.

## Verified sound

**Scope of this head.** `git diff --stat origin/main...HEAD` for the folder: three changed lines of `README.md` (754, 884, 892); `Suggested.lean`, `metadata.toml`, `PROGRESS.md`, `STATUS.md` and `references/` are main's (`git ls-tree` of main lists the same six entries). Other folders in the diff: `TauCetiRoadmap/BelyiMaps/README.md` (this PR's own, reviewed separately) and `Completed/ConformalMapping/README.md` (R08).

**Gate.** My rerun of the plain gate at this head:

```text
gate GeometricTopology: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=1 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=1 dirty=0 outside-folder=2 source-material=0 FAIL
  residue: line 534: layer-4-to-layer-5 handoff that lean-eval lacks.
  stray-files: TauCetiRoadmap/GeometricTopology/references/: not a roadmap file
  outside-folder: Completed/ConformalMapping/README.md
  outside-folder: TauCetiRoadmap/BelyiMaps/README.md
```

The worker's run adds `build=1` (the module warning, R03). The plain gate stops before the build.

**Dependency check.** The exact requested command on the README as it stands:

```text
depcheck: 204 roadmaps, 1651 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. To test what it sees, I appended to a scratch copy one line citing `SurfaceTopology Layer 8, PlanarTopology Layer 5, HomotopySpheres Layer 1` (HomotopySpheres is in `ORDER.txt` at position 64 and is a control):

```text
UPWARD: GeometricTopology (on main) -> HomotopySpheres (#64) at README lines [1176]
CYCLE among: GeometricTopology, HomotopySpheres, IndexTheory, StringOrientation, TangentialBordism
depcheck: 204 roadmaps, 1652 edges, 2 problem(s)
```

One edge was added for HomotopySpheres and none for SurfaceTopology or PlanarTopology: roadmaps that are neither on main nor in `ORDER.txt` are outside the checker's universe, so the cycle of R01 is a false negative of the tool, not a disagreement with it. The merge-order rule for this roadmap: it is on main, so after #271 merges only acyclicity constrains its citations of the two new roadmaps; GeometricTopology → PlanarTopology is acyclic (PlanarTopology's “Existing library prerequisites” says its use “does not assume completion of `GeometricTopology`”, 421e114 README line 81, and its Layer 8 bridge consumes the native `PLGroupoid`, line 1105), GeometricTopology ↔ SurfaceTopology is not.

**Elaboration.** `Suggested.lean` is unchanged (one `import Mathlib`, a docstring, an empty namespace): zero declarations, hence nothing to `#check`, no one-tactic probe and no padding. A scratch copy importing `TauCeti.Geometry.Diffeomorphism.Smale`, `TauCeti.LowDimTopology.JSJDecomposition` and `TauCeti.Topology.Triangulable` with `theorem smale_probe : TauCeti.SmaleConjecture := by sorry` elaborated under `lake env lean` in 31 s with exactly the sorry warning; `#check @TauCeti.SmaleConjecture : Prop` and `#check @TauCeti.IsJSJDecomposition : … (ι → C(Circle × Circle, M)) → Prop` printed; `#check @IsTriangulable` failed only because the name is namespaced (the definition is `TauCeti/Topology/Triangulable.lean:40`). No Lean process was left running.

**Pins.** `lake-manifest.json`: Mathlib `f6090c7095e1e56b3464c1daba5f24631f1290d2`, Tau Ceti `358314d4ab97483df4fc4cb8adcc02e74a8d9f5a`; the shared packages directory is at these revisions (checked with `git rev-parse` in both).

**Declarations opened at the pins** (file and line): `TauCeti.SmaleConjecture` Smale.lean:46; `IsJSJDecomposition` JSJDecomposition.lean:210; `Concordance`/`Concordant` Concordance.lean:93/101; `IsCombinatorialManifold` CombinatorialManifold/Basic.lean:214; `Contractible2Complex` Zeeman.lean:62; `IsTriangulable` Triangulable.lean:40; `PLPregroupoid`/`PLGroupoid` PLGroupoid.lean:73/106; `riemannianVolume` VolumeDensity/Volume.lean:76; `IsLocallyFlat` LocallyFlat/Basic.lean:376; `cellularDifferential`/`cellularChainComplex` Cellular/Chains.lean:333/364; `Manifold.IsSmoothEmbedding` (elaborated signature: a `ModelWithCorners` pair, `WithTop ℕ∞` smoothness, `(M → N) → Prop`). No file under `TauCeti/AlgebraicTopology/SimplicialComplex/` defines an ordered simplicial chain complex (grep for `chainComplex`, `orderedChain`, `simplicialChain`: only singular and twisted singular complexes match, under `Singular/`).

**Cross-roadmap citations resolved this round** (at main 929496d or the named head):

| Citation | Where it resolves |
|---|---|
| SurfaceTopology classification (README:754) | #271 head 421e114, Layer 8: `exists_standard_homeomorph`, `standard_homeomorph_unique`, `classification_of_surfaces` (lines 1205–1216), hypotheses `T2Space`, `CompactSpace`, `ConnectedSpace`, charted on `EuclideanHalfSpace 2`; consumer table rows for this roadmap's Layer 9 at lines 39–40 |
| SurfaceTopology generalized maps (README:892) | Layer 1 `GMap`/`GMap2` on `[Fintype D]` (lines 290–300), `IsSurfaceGMap` (319), flag-complex comparison (457) |
| SurfaceTopology → this roadmap | supplier rows at line 90; Layer 7 at 1011 and 1145 (R01) |
| PlanarTopology Radó (README:884) | Layer 5, `exists_combinatorialSurface_homeomorph` with `[CompactSpace M]` (816–822), `isTriangulable_of_compactSurface`; noncompact out of scope (886) (R02) |
| PlanarTopology → this roadmap | consumer rows only (lines 62–64); bridge theorem on native `PLGroupoid` (1105, 1184–1187); “Out of scope” leaves `PLGroupoid` and dimension ≥ 3 here (1310–1311) |
| Open revision #903 of this folder | cites SurfaceTopology Layer 8/9 and PlanarTopology Layers 5/8 with `*Needs:*` (README at 309be2f, lines 123–124, 423–428, 806–807, 826, 847); keeps the CW structure in its 11.1 (12712–12726), which AlgebraicTopology consumes (12893) |
| CombinatorialHeegaardFloer (README:35–39) | main line 227 consumes this roadmap's Layer 4 (R22) |
| ClassifyingSpaces, AlgebraicTopology | main lines 65 and 63 consume Layer 11 and the smooth/PL triangulations (consumers, as the README says) |
| DifferentialGeometry 5.5 and 12.4 (README:187, 639) | main lines 528–533 (faces of corners “the geometric-topology roadmap consumes”) and 923–930 (`TauCeti.riemannianVolume`, “no second one is defined”) |
| HopfRinow Layer 1 Levi-Civita (README:631) | `Completed/HopfRinow/README.md:40` and 303–310 |

**Sources read this round** (cache ids, line-numbered texts; nothing copied into the repository): yazdi2016 = `8e338304…` (arXiv 1603.03822v4), piccirillo2020 = `233da6e9…` (1808.02923v1), manolescu-lectures = `d17456df…` (1607.08163v3), manolescu2016 = `cad3ace3…` (1303.2354v4), watanabe2018 = `07d3cd2f…` (1812.02448v3), hatcher-at = `bebb3032…` (author page), hatcher-3m = `f3781c43…` (author page), li2013 = `90768f44…` (1106.6302v2), livingston2005 = `e7d9e5eb…` (math/0307077v4), gmm2009 = `c6dc414e…` (0910.5043v1), agol2013 = `ea8c7f39…` (1204.2810v1), km2004 = `b0376a66…` (math/0311489v5), scharlemann2002 = `a5efa71a…` (math/0007144v1), kirby1997 = `9812f2d7…` (see Not verifiable). The six arXiv fetches and the Kirby attempt went through the sources service with the brief's command; the service wrote a board-side `sources.toml` for this package as its record, which this review did not edit by hand.

**Seeded sample.** The 15 seeded labels (Unlocks, Design notes, What to build, From Mathlib / earlier layers) were taken at Layers 3, 4, 5, 6, 7, 9, 10 and 11, where the new lines and the carried findings touch them:

| Target | Source at its locator | Supports the statement as written? |
|---|---|---|
| L10 Unlocks (Gabai–Yazdi) | yazdi2016 111–114: infinitely many closed hyperbolic 3-manifolds with a parity-compatible dual-norm-one class realized by no taut foliation; 100–102 Gabai's realization at vertices | No: README asks for a violating foliation (R09); attribution single-author (R29) |
| L4 Unlocks (Piccirillo) | piccirillo2020 93 (trace equivalence), 100–104 (s-invariant; τ(K′) = 0) | No: τ is the wrong import (R21) |
| L9 Unlocks (Li) | li2013 66–68 | Narrowed (R26) |
| L11 Unlocks (Manolescu) | manolescu-lectures 7, 15; manolescu2016 title | Narrowed to n = 5 (R26) |
| L3 Unlocks (Watanabe, Kirby 4.34/4.126) | watanabe2018 32–37; kirby1997 5950–5953, 7491 | 4.34 is the S⁴ question (R29); degree unspecified (R28) |
| L7 Unlocks (Weeks, Agol) | gmm2009 52–55 (unique smallest volume closed hyperbolic, v₁ = 0.9427…, (5,1),(5,2) filling of the Whitehead link); agol2013 27–30 (9.1 virtually Haken for closed aspherical, 9.2 virtually fibred for closed hyperbolic) | Yes for the hyperbolic statements; the README's Weeks construction choice matches line 55 |
| L5 Unlocks (Property P/R) | km2004 41, 54–55 (Conjecture 1; Theorem 2: +1-surgery has a nontrivial π₁ → SO(3)); kirby1997 425 (1.16 Property R), 1638 (1.82 framed links) | Property P yes; Property R number wrong (R29) |
| L6 From earlier layers / Design notes (signature) | livingston2005 228 (σ_ω as limiting average) | Yes; ω = 1 and roots need the convention (R30) |
| L9 From Mathlib / earlier layers (existence from a triangulation) | scharlemann2002 88–91 (Moise: compact connected 3-manifolds triangulable) | Yes; orientability of handlebodies is the README's own gap (R20) |
| L11 What to build (compact subsets, CW) | hatcher-at 22532–22536 (Prop. A.1) | Yes for compactness; no locator in the README (R29) |
| L11 What to build (Radó, this PR) | PlanarTopology 816–822, 886 | Compact only (R02) |
| L9 From earlier layers (classification, this PR) | SurfaceTopology 1205–1216 | Content yes; direction no (R01) |

**Adversarial table.** N-rows are this round's computations on the changed lines and on the sampled and finding-touched targets; I-rows condense the earlier controls for the unchanged statements, recomputed where a number is shown.

| # | Statement or object | Instances tried | Values on each side | Result / change |
|---|---|---|---|---|
| N1 | Supply direction after this PR | edges GT→ST (README 754, 892), GT→PT (884); ST→GT (ST 90, 1011, 1145); PT→GT (none: PT 81, 1105) | GT→ST 2 lines, ST→GT 3 lines, cycle length 2; GT↔PT 0 reverse lines | R01 |
| N2 | Dependency-check universe | README as is; scratch copy + HomotopySpheres control + ST/PT lines | 0 problems / 1651 edges vs 2 problems / 1652 edges (one edge added, for the control only) | ST/PT edges invisible to the tool (R01) |
| N3 | Classification supplied for the splitting surface | closed orientable genus g = `StandardSurface.orientable g 0`; ℝP² | χ = 2 − 2g: g = 0 → 2, g = 1 → 0; ℝP²: χ = 1, nonorientable k = 1, excluded by the orientability invariant | content matches L9's need; b = 0 is “closed” |
| N4 | Radó via PlanarTopology | closed disc; open disc ℝ² | compact: true / false; PT's hypothesis `[CompactSpace M]` holds / fails; triangulable: true / true | R02 |
| N5 | 2-dimensional link condition | ∂Δ³; one triangle; bow-tie; infinite plane | links: four 3-cycles (closed manifold); three 1-edge paths (boundary); shared vertex has two disjoint edges (not a manifold); 6-cycles at infinitely many vertices (no finite decision) | R05 |
| N6 | Generalized-map encoding | ∂Δ³ as a `GMap2` | darts 4·6 = 24, V = 4, E = 6, F = 4, χ = 2; ST's flag-complex comparison (457) is the bridge; `[Fintype D]` forces finiteness | finite complexes only (R05) |
| N7 | Gluing data for a genus-1 splitting | identity gluing; meridian↔longitude swap | H₁ = ℤ (S¹ × S²) vs H₁ = 0 (S³) | the mapping class matters; owner is ST Layer 9, not GT Layer 3 (R04, R23) |
| N8 | Smale headline at the pin | `TauCeti.SmaleConjecture` | elaborates; π₀ on both sides has 2 elements; Diff(S³) non-compact (eᵗ derivative norms) vs O(4) compact | R12, R25 |
| N9 | Kirby numbers | 4.34, 1.16, 1.82 | Diff(S⁴) ≃ O(5)?; Property R; framed links producing #S¹×S² | R29 |
| N10 | Watanabe's class | A₁, A₂ | A₁ = 0, A₂ ≅ ℚ; surjection onto A₂ from π₂BDiff(D⁴,∂) ⊗ ℚ ≅ π₁Diff(D⁴,∂) ⊗ ℚ | degree 1 of Diff(D⁴,∂), rel boundary (R28) |
| N11 | Li's gap | gap 1, 2 | source: arbitrarily large; README existential: > 0 only | R26 |
| N12 | Manolescu | n = 5, 6 | source: both; README: n = 5 | R26 |
| N13 | Weeks volume | Weeks; identity cover | v₁ = 0.9427…; V ≤ V | positive control |
| N14 | Agol | Σ₂ × S¹, identity cover | fibre Σ₂, χ = −2; source hypotheses closed hyperbolic (9.2) / closed aspherical (9.1) | README's `ClosedHyperbolic3` matches 9.2 |
| N15 | Property P | trefoil +1; unknot 0 | nontrivial ρ: π₁ → SO(3) exists / π₁ = ℤ, S¹ × S² | conclusion shape “not simply connected” follows from Theorem 2 |
| N16 | Euler-class bound | small bounding S²; Σ₂ leaf | pairing 0 vs −χ = −2 (proposed 0 ≤ −2 false); −2 vs −2 | R09 |
| N17 | τ versus s | K′ trace-equivalent to Conway | τ(K′) = 0 ⇒ 0 ≤ g₄; s(K′) ≠ 0 is the obstruction | R21 |
| N18 | Compact subsets of a realization | one closed triangle; infinite wedge with one interior point per edge | 3 vertices suffice; chosen set closed discrete of size ℵ₀, not compact | Prop. A.1 supports the clause |
| N19 | Signature at a root | V = [[1,0],[−1,1]], θ = π/3 ± 0.001 | signatures 0 and 2; average 1; at ω = 1 the form is 0 | R30 |
| I1 | PL local flatness | cone on trefoil; cone on unknot | local complement groups: trefoil group / ℤ | R10 |
| I2 | JSJ minimality | T³ with ∅ and one coordinate torus | tori counts 0 / 1, both leave Seifert pieces | R11 |
| I3 | Cerf | identity; reflection | degrees +1 / −1 | R13 |
| I4 | Concordance endpoints | trefoil cylinder; square knot | signatures (2, 2) vs mirror (2, −2); concordance class 0 but Δ = (t − 1 + t⁻¹)² ≠ 1 | R14 |
| I5 | Zeeman finiteness | infinite plane × I | infinitely many simplices before and after any finite sequence | R15 |
| I6 | Link at n = 0 | a point | link empty vs Nat-subtraction target S⁰ (2 points) or B⁰ (1 point) | R16 |
| I7 | Knot carrier | t ↦ t − sin t; empty link; 2-unlink | derivative 0 at 0 yet an embedding; component counts 0, 2 vs one circle | R17 |
| I8 | Discrete quotient | E³/ℤ³; E³/{±I} | stabilizers trivial / order 2 at 0; link H₁ = 0 / ℤ/2 | R18 |
| I9 | Boundary local flatness | ray endpoint; line interior | punctured image-germ components 1 / 2 | R19 |
| I10 | Splitting generality | ℝP² × S¹ | nonorientable; union of orientable handlebodies orientable | R20 |
| I11 | Prime decomposition | S³ # M; L(2,1) # L(3,1) | M; π₁ = C₂ * C₃ with two prime factors | R23 |
| I12 | Alexander values | unknot, trefoil, figure-eight | 1; t − 1 + t⁻¹; −t + 3 − t⁻¹; at t = −1: 1, −3, 5 | positive controls; Δ(1) = 1 pins the sign (R30) |
| I13 | Jones mirror | right trefoil and mirror | t + t³ − t⁴ vs t⁻¹ + t⁻³ − t⁻⁴; both 1 at t = 1 | unknot normalization does not pin the mirror (R30) |
| I14 | Slopes | (0,0), (2,2), (1,0), (0,1); 1/0 | gcd 0, 2, 1, 1; field division 0 ≠ ∞ | exclude non-primitive; native one-point carrier |
| I15 | Unknot surgeries | 0, ∞, 2/1 | H₁ = ℤ, 0, ℤ/2: S¹ × S², S³, L(2,1) | positive controls |
| I16 | Volume / curvature | unit S², ℝ³; S², E², S³ | 4π vs ∞ (toReal 0); sectional 1, 0, 1 and scalar 2, 0, 6 | compactness before `toReal`; sign conventions |
| I17 | Haken | coordinate torus in T³; small S² in S³ | π₁-injective both; only the torus is essential | define essential surfaces |
| I18 | Realization / ∂Δⁿ | Δ⁰, Δ¹, Δ² | ∅, two points, circle; S⁻¹ under Nat subtraction wrong | R16 |
| I19 | Cellular boundary sign | ordered edge ab, triangle abc | ∂ab = b − a; ∂abc = bc − ac + ab; ∂² = 0; reflection gives a − b | R30 |
| I20 | S³ from two solid tori | meridian↔longitude; meridian↔meridian | H₁ = 0 / ℤ | the gluing map must be named |

**Headline inventory.** The README's end theorems: collars, tubes and connected sum (L1); Brown collaring and the annulus theorem (L2); Smale and Watanabe (L3); Reidemeister/Markov, invariant agreement, Freedman and Piccirillo (L4); Property P/R, unknot surgeries (L5); concordance group, mutation, Levine (L6); Mostow invariance, Weeks, Agol (L7); JSJ, geometrization, Poincaré (L8); Heegaard existence, rank ≤ genus, Li (L9); Euler-class bound and Yazdi (L10); triangulations, Manolescu, Zeeman as a conjecture (L11). `Suggested.lean` states none; Smale is statable now (N8), the JSJ carrier exists, and the file's docstring does not say which carrier each other headline lacks (R25). No padding exists because no declaration exists.

**Ownership against open work.** Searched by object (surface classification, mapping classes, Radó, generalized maps, ordered simplicial chains, CW structure on realizations) in main, the board packages index, and the open heads the brief lists; the owners are SurfaceTopology L8/L9/L1 and PlanarTopology L5 at 421e114, this roadmap's L11 for the ordered chains and CW structure (consumed by ClassifyingSpaces, AlgebraicTopology and SurfaceTopology), and no second builder was found. Open pull requests whose files the brief does not give were not searched beyond `roadmaps grep`/`show`.

## Not verifiable

- kirby1997: the editor's copy at the Berkeley author page is a PostScript archive the service could not render; the cached text `9812f2d7…` comes from a file-sharing link of unstated provenance that matches the published list's numbering (4.34 at line 5950, 1.16 at 425, 1.82 at 1638). I used it only to read problem numbers; a certified copy should replace it.
- Cerf (LNM 53), Brown 1962 and Kirby 1969 (Annals), Freedman 1982 and Quinn 1982 (JDG), Freedman–Quinn, Rolfsen, Hirsch, Lee GTM 218/176, Lickorish, Burde–Zieschang, Rourke–Sanderson, Hudson, Munkres, Kirby–Siebenmann, Moise, Thurston (Princeton), Ratcliffe, Candel–Conlon, Scott, Zeeman 1964, Palais 1960, Levine 2016: not read this round; the folder's `references/` extracts are not a legal substitute and are R07. Their locators are carried as previously reported, not certified.
- Livingston §3.1's even-integer claim from the earlier source register was not re-located in the cached text (no match for “even integer”); not re-examined.
- Scharlemann §2.1 gives existence for compact connected 3-manifolds through Moise; whether the README's unqualified “every closed 3-manifold” is meant with nonorientable handlebodies is the roadmap's choice (R20), not a source question.

## Source issues

- none

(The livingston2005 §3.1 item recorded by the earlier review of this text was not re-examined this round and is neither confirmed nor withdrawn here.)
