# Review of SurfaceTopology (pull request #271 at 238d5da)

**Verdict:** needs changes

## R01 (P1) — Admitted constructors collapse distinct surface models

**Location:** `TauCetiRoadmap/SurfaceTopology/Suggested.lean:330`, `:568`, `:572`, `:715`. Quote: “`noncomputable def normalFormOrientable (g b : ℕ) : PolygonalSchema := sorry`”.

**Claim:** The acceptance statements distinguish the standard compact surfaces, but their constructors do not specify those surfaces. This is the gate's `sorry-data=28` failure, with a concrete inconsistency rather than merely a formatting violation.

**Witness:** In a scratch copy, `(StandardSurface.orientable 0 0).model = (StandardSurface.orientable 1 0).model` closes by `rfl`. Naming the uniqueness example then proves `False` from `Homeomorph.refl` and constructor injectivity.

**Repair:** Delete all admitted data definitions and every declaration depending on them. Retain only simple definitions with real bodies needed for statable headlines. Name realization/classification in the module docstring with the genuinely missing carriers if their models require a substantial construction. The sphere/torus test must cease to be definitionally equal; the intended invariants are respectively `(χ,b)=(2,0)` and `(0,0)`. Do not replace this data with arbitrary surface parameters or proposition fields.

## R02 (P1) — Correct the annulus intersection Check

**Location:** `TauCetiRoadmap/SurfaceTopology/README.md:1029`–`:1031`. Quote: “so only `T⁻⁴` reduces it”.

**Claim:** For the radial arc `q` and `p=T⁴q`, the inverse fourth power is asserted to be the only reduction to the intersection target. Other negative powers also suffice.

**Witness:** Write the annulus as `(ℝ/ℤ) × [0,1]`, and `pₙ(t)=([nt],t)`. Its interior intersections with `q` number `n−1` for positive integers `n`. Thus `T⁻³p=p₁` has zero intersections, versus three for `p₄`.

**Repair:** Say that negative powers are necessary in this example and that `T⁻⁴` is one possible reduction. Keep `T⁻³` as a second check: its resulting intersection count is also `0`; `T⁻²` gives `1`. The need for signed words survives this correction.

## R03 (P1) — The dependency gate remains red; its cycle is a false supply edge

**Location:** `TauCetiRoadmap/SurfaceTopology/README.md:29`, `:90`, `:465`, `:939`, `:1075`. Quote: “`GeometricTopology` layer 9”.

**Claim:** The required dependency check reports `CYCLE among: ComplexKahlerGeometry, GeometricTopology, SurfaceTopology`. This is a mandatory gate finding, **not evidence that the mathematical contracts actually require a reverse supply edge**.

**Witness:** A scratch diagnostic deleting only the analogy at line 90 still reports the cycle. Removing all GeometricTopology mentions removes one edge and the cycle. Those mentions describe consumers or an analogy, not consumed mathematics.

**Repair:** Consolidate consumer citations under `## Downstream consumers`, with the actual suppliers under `## Exact supplier contracts`, and have the worker reconcile the exact false-positive cycle before accepting the gate. Do not move classification into a consumer to satisfy this diagnostic. The printed `NOT IN ORDER` line is not a finding: placement after the last supplier is expressly allowed. The cycle also incorporates a revision of GeometricTopology; that revision is not an eligible replacement for its main-branch supplier contract.

## R04 (P2) — Import the existing polygonal-surface and graph theories

**Location:** `TauCetiRoadmap/SurfaceTopology/README.md:692`, `:740`, `:776`, `:781`, `:1167`. Quote: “The normal-form theorem is stated once”.

**Claim:** Layers 4, 6, 7 and 10 re-plan objects and theorems owned on main, without citing that owner.

**Witness:** `TauCetiRoadmap/FreeGroupsAndLimitGroups/README.md:385`, `:409`, `:1384`, `:1406`, `:1422`, `:1438` own graph path groups, binary cycle ranks, polygonal surfaces, normal forms, face presentations and combinatorial cutting, respectively.

**Repair:** Import §§2.1–2.2a and §§6.0a–6.0d by section. Keep the generalized-map adapters, realization comparisons, topological classification, mapping-class results and planarity theorems here; state their differences from the existing constructions. In particular, replace the second polygon-move/normal-form development with a comparison to that carrier and its moves. Verify the bridge on the sphere digon `(V,E,F)=(2,1,1)`, the torus word with group `ℤ²`, the projective-plane word with group `C₂`, and a two-parallel-edge graph with binary cycle dimension `1`. The new generalized-map scope remains substantial; this is repairable.

## R05 (P2) — Resolve ownership of generic simplicial chains

**Location:** `TauCetiRoadmap/SurfaceTopology/README.md:796`, `:800`, `:849`. Quote: “the oriented chain complex of a finite complex”.

**Claim:** Layer 7 proposes another general simplicial chain development while excluding the existing cellular/comparison theory from its inputs.

**Witness:** `TauCetiRoadmap/GeometricTopology/README.md:868`–`:879` on main owns the CW realization and ordered simplicial boundary comparison. `TauCetiRoadmap/AlgebraicTopology/README.md:499`–`:521` owns cellular chains, naturality and singular comparison.

**Repair:** Consume these owners and name the remaining generalized-map-to-cellular-chain comparison here. If an additional chain-level subdivision or contiguity contract is needed, give it an explicit owner and exact statement; do not silently rebuild the generic chain complex. On `[v₀,v₁,v₂]`, both boundaries must be `[v₁,v₂]−[v₀,v₂]+[v₀,v₁]`, and the next boundary must be `0`. Equality of abstract homology groups alone does not supply the requested functorial action.

## R06 (P2) — State the five-colour headline on the available carriers

**Location:** `TauCetiRoadmap/SurfaceTopology/Suggested.lean:799`; `TauCetiRoadmap/SurfaceTopology/README.md:1191`. Quote: “`theorem colorable_five_of_isPlanar (h : G.IsPlanar) : G.Colorable 5`”.

**Claim:** The five-colour headline is only a comment, although its full topological statement is already statable using the file's real drawing definitions and pinned graph types.

**Witness:** A scratch declaration with finite `V`, `G : SimpleGraph V`, `D : Drawing (Graph.ofSimpleGraph G) ℂ`, and `D.IsNoncrossing`, concluding `G.Colorable 5`, elaborates at the pins without any admitted data.

**Repair:** Keep the minimal real drawing definitions and add this named headline theorem with `sorry`; identify it in the README using the drawing characterization of planarity. Audit the other headlines similarly and list each genuinely unstatable one and its missing carrier in the module docstring. The empty graph, a triangle and a planar K₄ give chromatic numbers `0`, `3`, `4`, all at most `5`; no connectivity or cellularity assumption is needed.

## R07 (P2) — Replace unspecified interfaces with mathematical contracts

**Location:** `TauCetiRoadmap/SurfaceTopology/README.md:196`, `:478`, `:658`, `:771`, `:1177`. Quotes: “`isoClosure_reflTransGen_congr : ...`”; “the appropriate link or non-degeneracy condition”.

**Claim:** Several advertised targets cannot be implemented or refuted as stated: the isomorphism-closure theorem has no proposition, edge contraction has no admissibility definition, branched covers have no local-model laws, and the H₀ criterion has no conclusion. Equivalence of signed rotation systems and schema isomorphism also need their actual identifications.

**Witness:** For two distinct isomorphic objects and the empty relation, the displayed `isoClosure` is empty. Its reflexive-transitive closure holds from an object to itself but fails from it to its distinct isomorphic copy.

**Repair:** State the closure theorem precisely, using isomorphisms as steps, for example the closure of `IsoRel ∨ isoClosure r`, or a quotient by isomorphism. This makes both tested reachability values true. Specify each remaining predicate with its hypotheses, operations and laws: e.g. positive local degrees, finite fibres and the local power-map model for branched covers; the exact link condition for contraction; and, over a nonzero field, `dim H₀ = 1` iff a nonempty finite surface is connected, rather than an unspecified “zero iff connected”. Arbitrary assignments of local degree to the identity map must be excluded: at a marked sphere point, assigning `e=2` would make the proposed Riemann–Hurwitz right side `1` instead of `2`.

## R08 (P2) — Restrict capping to maps whose boundary data is topological

**Location:** `TauCetiRoadmap/SurfaceTopology/README.md:483`, `:501`, `:519`. Quote: “Capping glues a disc on each boundary circle.”

**Claim:** Capping and its formula are stated for arbitrary generalized maps, although the README establishes the identification of its boundary 1-map with the topological boundary only under additional hypotheses.

**Witness:** On two darts take `α₀=id` and `α₁=α₂=swap`. The realization is a disc, with one boundary circle, but there are zero α₂-fixed darts and `G.boundaryComponentCount=0`; its orbit Euler count is `1`.

**Repair:** State capping on `IsSurfaceGMap` and require the realization to be the topological capping, including the boundary-circle correspondence. Otherwise explicitly specify a different partial side-gluing operation and do not call it capping of the surface. The test map is then excluded; a genuine triangular-disc map has boundary count `1` and satisfies `χ(cap)=2=1+1`. The current hypotheses allow the boundary test to miss the entire boundary.

## R09 (P3) — Remove admitted examples and non-headline catalogue material

**Location:** `TauCetiRoadmap/SurfaceTopology/Suggested.lean:243`, `:249`, `:272`, `:367`, `:693`–`:720`. Quote: “`example ... := by sorry`”.

**Claim:** The gate finds 11 admitted examples. They are neither proved tests nor named acceptance theorems. The file also retains many definitions only for a catalogue of future interfaces.

**Witness:** The 11 admitted examples occur at lines 243, 249, 272, 367, 693, 696, 699, 702, 711, 715 and 720. None closes in the scratch one-tactic `rfl`, `simp`, `infer_instance` probes.

**Repair:** Delete the admitted examples from `Suggested.lean`. Reintroduce only genuine statable headlines as named theorems against real definitions. Delete the other API/check-only material from `Suggested.lean`; the README keeps it. Do not prove padding in place. The sphere/torus collapse is R01.

## R10 (P3) — Remove empty Lean layer sections

**Location:** `TauCetiRoadmap/SurfaceTopology/Suggested.lean:748`, `:799`. Quote: “`/-! ## Layer 9: curves, cutting, and mapping class groups -/`”.

**Claim:** The gate's two `empty-sections` failures are headers followed exclusively by commentary.

**Witness:** There is no Lean declaration between either header and the next layer/end of namespace. The apparent theorem signatures are inside block comments.

**Repair:** Put unstatable headlines and their missing carriers in the module docstring, delete the empty section, and retain a layer header only when an actual headline follows. R06 provides a real Layer 10 declaration.

## R11 (P3) — Remove process and pull-request references

**Location:** `TauCetiRoadmap/SurfaceTopology/README.md:50`, `:77`, `:540`, `:554`, `:673`, `:1089`, `:1128`, `:1132`. Quote: “under review as”.

**Claim:** The gate reports seven `prnum` matches; the supplier introduction also embeds a pull-request reference. These are not timeless mathematical contracts.

**Witness:** The seven reported locations contain proposal numbers in the graph incidence, degree, drawing, minor and connectivity descriptions. The underlying names and design descriptions suffice to identify the mathematics.

**Repair:** Keep the exact pinned declarations and named roadmap sections; describe the adopted design without PR numbers or review status. Apply the same cleanup to `Suggested.lean:24` and its process commentary. The multigraph loop check must still read degree `2`, not incidence count `1`.

## R12 (P3) — Supply the required per-definition API, Checks and dependencies

**Location:** `TauCetiRoadmap/SurfaceTopology/README.md:1`, `:175`, `:203`, `:523`, `:1206`. Quote: “whatever `Cycle` API the schema calculus needs beyond Mathlib's”.

**Claim:** Layer-wide signature catalogues and lists of possible intermediate results do not provide the required definition-by-definition specification. There are no per-target `*Needs:*` lines; definitions such as signed rotation systems and contraction lack three discriminating Checks and an API list.

**Witness:** Layers 0–10 use “Representative formal statements” blocks, without the prescribed numbered topic subsections, per-definition API/Checks, and closing `### Examples`/`### Dependencies`. The opening lacks `**Summary.**` and the required ownership/contracts headings.

**Repair:** Reorganize into the required prose shape without reducing the mathematical scope. Give each retained definition an API and at least three actual discriminating computations. Add exact needs to each theorem and its proposed proof route. Pin twist sign using an oriented torus basis: specify which twist sends `(a,b)` to `(a,b+a)` and the resulting matrix, distinguishing it from its inverse. Replace instructions to exhibit examples with the examples themselves. Names present only in Lean comments must not be advertised as declared APIs.

## R13 (P3) — Correct and complete source locators

**Location:** `TauCetiRoadmap/SurfaceTopology/README.md:1249`, and proof-strategy/intermediate-result paragraphs throughout. Quote: “the reduction (Theorem 6.1)”.

**Claim:** The normal-form reduction is mislocated, most theorem targets have only a book/chapter reference, and the folder has no `sources.toml` recording its 14 works.

**Witness:** `gallier_xu` line 3564 gives the reduction as Lemma 6.1, printed p.92; line 3719 gives Theorem 6.1 as classification of triangulated surfaces, printed p.96. These are different results.

**Repair:** Cite Lemma 6.1, pp.92–95, for reduction, Definition 6.5, pp.88–91, for normal forms, and Theorems 6.1–6.2, pp.96–97, for classification. Identify the edition/version: the accessible author copy is dated January 8, 2025. State the sphere-digon modification explicitly because that text permits an empty sphere word. Give each other claim an exact theorem/section and page, and record all works with one stable source key each. Unreadable texts remain uncertified, not silently verified; this review does not edit a manifest.

## R14 (P3) — Update the pinned-library inventory

**Location:** `TauCetiRoadmap/SurfaceTopology/README.md:77`, `:79`, `:846`. Quotes: “and nothing else”; “only square integer matrices of positive determinant”.

**Claim:** Two categorical claims about what the pins contain are false, although the choice of the PID structure theorem for rectangular boundary matrices is appropriate.

**Witness:** `TauCeti/LinearAlgebra/Matrix/SmithNormalForm.lean:750` handles every nonzero determinant. `Mathlib/Combinatorics/Graph/Connected/EdgeCut.lean:36` already defines `Graph.edgeCut`, and line 82 defines `Graph.IsEdgeCut`.

**Repair:** Say the matrix API covers nonsingular square integer matrices, cite `Matrix.exists_smith_normal_form_of_det_ne_zero`, and retain the PID route for general boundary matrices. Cite native cuts before the additional GraphConnectivityAndFlows contracts. The matrix `[-1]` has determinant `−1` and is covered by the pinned result; a loop contributes zero to the native edge cut.

## Verified sound

The head was verified as `238d5dac9206bdb37cd0fb9cacbd964fee55b2df`; the worktree remains clean. Root `README.md` and `CONTRIBUTING.md` were read (the requested parent-relative copies are absent). Main-branch examples inspected for shape included GraphConnectivityAndFlows, FreeGroupsAndLimitGroups and Completed/OrthogonalL2Bases. No worktree source, metadata, library pin or merge-order file was changed.

**Build and signatures.** The six explicitly imported Tau Ceti modules were built together successfully. Direct `lake env lean` elaboration of the target then exited 0 with only `sorry` warnings. A scratch copy named its anonymous declarations and printed all **82 declaration signatures** in one elaboration, including 5 anonymous instances and 14 examples. The surface existence example retains `TopologicalSpace`, `ChartedSpace`, `T2Space`, and `CompactSpace`; classification also retains `ConnectedSpace`. Uniqueness correctly has only the two model parameters and the homeomorphism hypothesis. No dropped standing binder was found. Eleven one-tactic probes failed to close the admitted examples; there is no substantiated extra one-tactic-padding finding.

The R01 reproduction, after naming the example at line 715 `uniqueProbe` in a scratch copy, is:

```lean
example : (StandardSurface.orientable 0 0).model =
    (StandardSurface.orientable 1 0).model := by rfl

example : False := by
  have h : StandardSurface.orientable 0 0 = StandardSurface.orientable 1 0 :=
    uniqueProbe ⟨Homeomorph.refl _⟩
  cases h
```

Both elaborate. This checks the actual defective constructors, not an invented alternative model. Separately, this full headline elaborates using only the real drawing definitions:

```lean
theorem fiveColour_of_drawing {V : Type*} [Fintype V] (G : SimpleGraph V)
    (D : Drawing (Graph.ofSimpleGraph G) ℂ) (hD : D.IsNoncrossing) :
    G.Colorable 5 := by
  sorry
```

**Gate.** The worker's head gate and the rerun both fail on `prnum=7`, `sorry-data=28`, `sorry-examples=11`, `empty-sections=2`, and the cycle diagnostic. The worker's targeted build passed; direct elaboration independently passed. No `set_option`, forbidden imports, admitted-data-free placeholder theorem, copied source file, stray file, or edit outside the five authorized roadmap folders was found. The generic rerun additionally reports six outside-folder files, all in BelyiMaps, ConformalMapping, GeometricTopology or PlanarTopology; those are expressly authorized sibling folders and are not findings.

Required dependency-check output:

```text
NOT IN ORDER: SurfaceTopology (insert it after its last supplier)
CYCLE among: ComplexKahlerGeometry, GeometricTopology, SurfaceTopology
depcheck: 163 roadmaps, 1175 edges, 2 problem(s)
```

The scratch consumer-mention diagnostic gives:

```text
NOT IN ORDER: SurfaceTopology (insert it after its last supplier)
depcheck: 163 roadmaps, 1174 edges, 1 problem(s)
```

Thus the exact cycle line above is a false-positive **supply** reading of this README's GeometricTopology references. ComplexKahlerGeometry K7, in its supplied open head at README lines 1517–1525, consumes these surface results; GeometricTopology's supplied revision mentions K7 at line 319. Neither supplies a target consumed here. The actual named suppliers are the pins, PlanarTopology and GraphConnectivityAndFlows. Existing Belyi permutation triples and ribbon graphs are consumed at the Tau Ceti pin, not through a reverse dependency on analytic Belyi work. No declared gap contract exists.

**Resolved supplier contracts.** All PlanarTopology supplier lists were read against the sibling head: Layer 0 supplies arcs/endpoints; Layer 2 boundary invariance/count at lines 411–415; Layer 3 supplies the finite surface predicate/realization at 526–541 and PL subdivision comparisons; Layer 5 supplies Radó and isotopy-to-PL at 633 and 665–675; Layer 6 supplies Euler characteristic, orientability and orientations at 741–762; Layer 7 supplies arc-family tameness and two-sided collars at 786–863; Layer 8 supplies PL/smooth isotopy comparisons at 888–960. These sections exist. `IsPLOn` itself is a pinned Tau Ceti input re-exported in that contract, not a new PlanarTopology object.

GraphConnectivityAndFlows Target 1.1 on main, lines 245–257, includes nonempty connectivity, simplification agreement and the component count, including `K₁ ↦ 1` and the empty graph `↦ 0`; the count should be cited there rather than only as Milestone 2. Target 1.2 extends native cuts. The 3-vertex-connectivity convention is present; its prototype uses `ℕ∞` and requires at least `k+1` vertices. The literal “SimpleGraph.IsVertexConnected” is proposed vocabulary, not a declaration at this Mathlib pin. BelyiMaps §2.7 exists at line 1112; its finite-carrier ownership boundary is at 170–177. Its Layers 7 and 8 are now specifications owned by BelyiAnalyticCovers, so downstream prose should follow that ownership.

Ownership searches used `roadmaps grep`, `roadmaps show`, main-branch files, board package READMEs, and the supplied open-head files. No independent existing generalized-map realization library was found at the pins. Generalized-map realization and its topological adapters are a defensible new owner here; the overlapping polygonal/path/cycle/chain constructions are R04–R05. No duplicate fully qualified declaration of this file was found in the searched roadmaps. Open-work inspection was limited to supplied heads and the supplied index; revision PRs were not treated as new eligible suppliers.

**Pinned declarations opened.** Mathlib pin `6b7abb3c7686292736be2955bd3eb9ebf63b456a`; Tau Ceti pin `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The following 18 entries were opened at those pins, not inferred from newer documentation:

| Declaration/object | Pinned file and line | Relevant content |
|---|---|---|
| `Cycle` | `Mathlib/Data/List/Cycle.lean:406` | List rotation quotient; repeated labels allowed. |
| `ChartedSpace` | `Mathlib/Geometry/Manifold/ChartedSpace.lean:141` | Atlas and charts covering points; no Hausdorffness, compactness or nonemptiness field. |
| `ConnectedSpace` | `Mathlib/Topology/Connected/Basic.lean:705` | Includes `Nonempty`, excluding the empty classification input. |
| `Module.equiv_free_prod_directSum` | `Mathlib/Algebra/Module/PID.lean:255` | Finitely generated module over a PID/domain; free part plus prime-power torsion. |
| `Graph.edgeCut` / `Graph.IsEdgeCut` | `Mathlib/Combinatorics/Graph/Connected/EdgeCut.lean:36` | Native edge boundaries and their image predicate (line 82). |
| `SimpleGraph.degree` | `Mathlib/Combinatorics/SimpleGraph/Finite.lean:241` | Cardinality of the finite neighbour set. |
| `IsCoveringMap.liftPath` | `Mathlib/Topology/Homotopy/Lifting.lean:256` | A chosen lift of a continuous interval path. |
| `AbstractSimplicialComplex.Realization` | `TauCeti/AlgebraicTopology/SimplicialComplex/Realization.lean:67` | Native carrier, with topology at 136. |
| `SimplicialMap` | `TauCeti/AlgebraicTopology/SimplicialComplex/Maps.lean:36` | Maps preserving faces. |
| `barycentricSubdivisionRealizationHomeomorph` | `TauCeti/AlgebraicTopology/SimplicialComplex/Subdivision/Homeomorph.lean:221` | Native abstract-complex subdivision homeomorphism. |
| `IsTriangulable` | `TauCeti/Topology/Triangulable.lean:40` | Existence of a realization homeomorphism. |
| `TauCeti.Isotopic` | `TauCeti/Topology/Homotopy/Isotopy/Basic.lean:111` | Existence of an isotopy of continuous maps; no boundary-relative condition built in. |
| `TauCeti.AmbientIsotopic` | `TauCeti/Topology/Homotopy/AmbientIsotopic/Basic.lean:58` | Ambient version, distinct from the preceding predicate. |
| `TauCeti.PermutationTriple` | `TauCeti/Combinatorics/PermutationTriple/Basic.lean:75` | Product order `σinf * σ1 * σ0 = 1`; connectedness at 427 also requires nonzero degree. |
| `PermutationTriple.eulerChar` / `genus` | `TauCeti/Combinatorics/PermutationTriple/EulerCharacteristic.lean:66` | Orbit counts minus degree; genus at 204 and connected identity at 243. |
| `TauCeti.BipartiteRibbonGraph` | `TauCeti/Combinatorics/RibbonGraph/Basic.lean:49` | Surjective endpoints exclude isolated vertices; fibre rotations are cycles; Euler characteristic at 234. |
| `Matrix.exists_smith_normal_form_of_det_ne_zero` | `TauCeti/LinearAlgebra/Matrix/SmithNormalForm.lean:750` | Square nonsingular matrices, including negative determinant. |
| `AddCircle.prodFundamentalGroupMulEquiv` | `TauCeti/AlgebraicTopology/UniversalCover/Torus/FundamentalGroup.lean:45` | Two nonzero periods, product fundamental group `ℤ × ℤ`; no generalized-map comparison follows automatically. |

**Seeded source sample.** The 15 seeded labels repeat without section numbers; all their occurrences in Layers 0–10 were inspected. No explicitly unverified locator marker was found. Fourteen bibliography entries were attempted through the sources service. Three full texts were obtained: Gallier–Xu (author copy), Gonthier (publisher copy), Epstein (institutional copy). They support the following limited certifications:

| Sample material | Locator actually read | Outcome |
|---|---|---|
| Layer 6 definitions and normal-form route | `gallier_xu` lines 3065–3081, 3432–3441, 3564–3579 | Definition 6.1 p.80; Definition 6.5 pp.88–89; Lemma 6.1 pp.92–95. Connectedness is part of the source carrier. Empty sphere convention differs; R13. |
| Layers 7–8 consequences and invariant calculations | `gallier_xu` lines 2956–3005, 3719–3752 | Proposition 5.9 pp.76–78; Theorems 6.1–6.2 pp.96–97. Torsion, boundary cases and classification invariants agree. This does not certify the unread Munkres locator. |
| Layer 9 PL/topological proof input | `epstein` lines 604–610, 778–790 | Theorem 6.4 p.101 has explicit exceptional-surface/orientation conditions; Appendix A4 p.106 supplies PL approximation. These do not independently certify the relative smooth claims or the Lickorish arc extension. |
| Hypermap convention and map-colouring background | `gonthier` lines 397–419, 431–440 | Definition 1 p.1385 and Euler discussion p.1386 use a finite permutation model and componentwise spherical identity. Not a proof of the entire Layer 10 suite. |
| “From PlanarTopology”, “From GraphConnectivityAndFlows” | The local supplier sections resolved above | The named mathematical inputs exist as contracts; no missing-section finding inferred from the name scanner alone. |
| Remaining sampled proof strategies/intermediate results | The bibliography locations listed under Not verifiable | No source-text certification claimed. Missing exact locators are R13. |

**Headline inventory.** (1) generalized-map realization and existence of presentations; (2) oriented and signed Heffter–Edmonds–Ringel; (3) schema normal forms; (4) compact-surface classification and complete invariants; (5) change of coordinates and Dehn–Lickorish generation; (6) Kuratowski, Wagner, Whitney, Mac Lane, Tutte, Fáry and five-colouring. The Lean file has no named admitted headline theorems: its apparent milestones are anonymous examples or commented signatures. Realization/classification currently depend on admitted heavy carriers; the five-colour headline demonstrably does not. A per-headline statability explanation is missing.

**Adversarial computations.** In the table below, `S`, `P`, `T`, `K`, `D`, `A`, `B` denote sphere, projective plane, torus, Klein bottle, disc, annulus and Möbius band. `F₂` means the field with two elements. “Pass” means no change from this finite-instance check of the intended mathematical object, not certification of an admitted implementation. An “underspecified” row records that the missing contract prevents checking the actual target. Rows marked R01 compare the real Lean constructors, not the intended objects.

Independent permutation enumeration covered **570** generalized maps on 0–4 darts, including **29** surface maps. In all 570 cases subdivision had injective flag triples; in all 29 surface cases its Euler count was preserved; in all 570 cases the tested orientation cover was orientable and doubled the orbit Euler count. Explicit eight- and twelve-dart polygon examples were also computed. The 200-row table retains sampled evidence, headline results and every row associated with a finding; routine definition and API rows are omitted from this public report.


| Statement (README line) | Instances | Computed values on the two sides / controls | Result; change |
|---|---|---|---|
| `GMap2.eulerChar` (126) | P / T / K / A / B / empty | 1−1+1=1; 1−2+1=0; 0; 0; 0; 0 | pass |
| `isoClosure` (193) | universal isomorphism, empty relation | closure has 0 pairs; cannot connect the two objects | R07: include isomorphism steps |
| `isoClosure_reflTransGen_congr` (196) | same example | RTC(0,0)=true; RTC(0,1)=false | R07: state corrected proposition |
| `GMap2` (220) | empty / allSwap / P | 0 / 2 / 4 darts; α₀α₂=α₂α₀ in all three | pass |
| `GMap.Cell` (222) | P / T / D | (V,E,F)=(1,1,1) / (1,2,1) / (3,3,1) | pass |
| `GMap2.EdgeOrientation` (240) | interior edge / boundary edge | 2 α₂-orbits / 2 α₂-orbits; folded allSwap has only 1 | R01; restrict intended two-choice claim |
| `GMap2.FaceOrientation` (241) | monogon / torus face | 2 α₀α₁-orbits in each; singleton identity map has 1 | R01; specify surface hypotheses |
| `IsSurfaceGMap` (246) | P / allSwap / empty | true / false / true; empty has 0 components | pass |
| `IsClosedSurfaceGMap` (250) | P / D / allSwap | true / false / false | pass |
| `GMap2.IsOrientable` (254) | P / T / K / D / empty | false / true / false / true / true | pass |
| `GMap2.boundary` (261) | D / A / B / P | boundary circles 1 / 2 / 1 / 0 | intended values; R01 |
| `GMap2.boundaryComponentCount` (262) | D / A / B / P | boundary circles 1 / 2 / 1 / 0 | intended values; R01 |
| `GMap2.Orientation.boundary` (266) | oriented annulus | outer winding +1, inner winding −1; total boundary class 0 | pass; add sign Check, R12 |
| `GMap2.orientableGenus` (268) | S / T / A | (2−χ−b)/2 = 0 / 1 / 0 | pass |
| `GMap2.nonorientableGenus` (270) | P / K / B | 2−χ−b = 1 / 2 / 1 | pass |
| `CombinatorialMap.toGMap2` (312) | one-edge sphere | 2 oriented darts → 4 flags; χ=2 on both sides | intended value; R01 |
| `PermutationTriple.toWalshMap` (331) | degree 0 / identity degree 1 | Walsh dart counts 0 / 2; χ=0 / 2 | intended values; R01 |
| `PermutationTriple.toGMap2` (334) | identity degree 1 | 4 flags; (V,E,F)=(2,1,1); χ=2 | intended values; R01 |
| `PermutationTriple.isClosedSurfaceGMap_toGMap2` (336) | degrees 0,1 | empty closed=true; one-edge sphere closed=true | intended values; R01/R09 |
| `CombinatorialMap.toPermutationTriple` (343) | σ=(012), α=(01)(23) on 4 darts | σinf=(123); σinf*α*σ=id; reversed product=(02)(13) | convention checked; add witness R12 |
| `CombinatorialMap.toBipartiteRibbonGraph` (344) | one-edge sphere | 2 edge-ends → ribbon graph B=2,W=1,E=2,F=1; χ=2 | intended values; R01 |
| `BipartiteRibbonGraph.toCombinatorialMap` (345) | same graph / degree-one white vertex | white degree 2 gives swap; degree 1 excluded | intended values; R01 |
| `PermutationTriple.eulerChar_toGMap2` (347) | identity degrees 0,1,2 | 0=0; 2=1+1+1−1; 4=2+2+2−2 | intended equality; R01/R09 |
| `PermutationTriple.isConnected_toGMap2` (349) | identity degrees 0,1,2 | false↔false; true↔true; false↔false | pass |
| `BipartiteRibbonGraph.eulerChar_toCombinatorialMap` (351) | two ends, one edge after suppression | 2+1−2+1=2=2−1+1 | intended equality; R01/R09 |
| `PolygonalSchema` (356) | abc / aaa / unused label | occurrence counts (1,1,1) / 3 / 0; last two forbidden in prose | Lean carrier admits all; R07 |
| `PolygonalSchema.toGMap2` (361) | aa / abc / empty word | 4 / 6 / 0 flags; empty word does not represent S | intended conversion; R01/R07 |
| `GMap2.toSchema` (366) | P / T | face words aa / abAB; χ=1 / 0 | intended conversion; R01/R04 |
| `GMap2.realization` (395) | allSwap / singleton identity / empty | two triangles give S / one triangle gives D / empty | mathematical check; Lean R01 |
| `GMap2.realizationChartedSpace` (403) | triangle vertex / glued-edge interior | link interval / circle; local half-disc / disc | mathematical check; Lean R01 |
| `GMap2.boundary_realization` (407) | triangular D / P | boundary is 3 sides / empty; α₂-fixed-side image agrees | pass |
| `IsSurfaceGMap.eulerChar_eq` (414) | P / T / allSwap | 1=1 / 0=0; allSwap would give 2≠1, excluded | pass |
| `IsSurfaceGMap.isOrientable_iff` (416) | P / T / B | false↔false / true↔true / false↔false | pass |
| `GMap2.barycentricSubdivision` (425) | allSwap / P / T | darts 12 / 24 / 48; VEF (3,3,2)/(3,6,4)/(4,12,8) | pass |
| `GMap2.eulerChar_barycentricSubdivision` (431) | P / T / D | 3−6+4=1; 4−12+8=0; 7−12+6=1 | pass |
| `GMap2.flagComplex_isSimplicial_of_subdivided` (435) | allSwap / P / T | distinct triples 12=12 / 24=24 / 48=48 flags | pass |
| `GMap2.realization_homeomorph_flagComplex` (438) | allSwap / P | Euler counts 2=2 / 1=1; no duplicate subdivided triples | pass |
| `exists_gmap_of_compactSurface` (445) | empty / tetrahedral S / D | presentations use 0 / 24 / 6 flags | instance check; Lean R01/R09 |
| `GMap2.subdivideEdge` (476) | triangle boundary edge | VEF (3,3,1)→(4,4,1); χ=1→1 | pass |
| `GMap2.subdivideFace` (477) | triangular D, insert central vertex | VEF (3,3,1)→(4,6,3); χ=1→1 | pass |
| `GMap2.contractEdge` (478) | interior diagonal of a triangulated quadrilateral | non-loop=true; naïve identification degenerates adjacent triangles | underspecified admissibility; R07 |
| `GMap2.dual` (479) | T / D | T VEF=(1,2,1)→(1,2,1); D α₂ fixed becomes α₀ fixed | pass |
| `GMap2.connectedSum` (480) | T#P / S#S | χ=0+1−2=−1 / 2+2−2=2; crosscap genus 3 / sphere | pass |
| `GMap2.cutAlong` (481) | T nonseparating core / S equator | A (χ,b)=(0,2) / two discs total (2,2) | R04: import combinatorial owner |
| `GMap2.orientationDoubleCover` (482) | P / K / T | (D,χ,components)=(8,2,1)/(16,0,1)/(16,0,2) | pass |
| `GMap2.cap` (483) | D / A / B | S / S / P; χ=2 / 2 / 1 | R08: specify surface-map domain |
| `GMap2.double` (484) | D / A / B | S / T / K; χ=2 / 0 / 0 | pass |
| `GMap2.dual_eulerChar` (489) | sphere digon | 2−1+1=1−1+2=2 | pass |
| `GMap2.orientationDoubleCover_isOrientable` (491) | P / K / empty | cover bipartitions exist: true / true / true | pass |
| `GMap2.orientationDoubleCover_eulerChar` (493) | P / K / allSwap | 2=2×1 / 0=2×0 / 2=2×1 | pass |
| `GMap2.orientationDoubleCover_isConnected` (495) | P / K / T | cover components 1 / 1 / 2; T excluded by nonorientability | pass |
| `GMap2.orientationDoubleCover_isCovering` (498) | B / P | two points in each fibre; B has 2 lifted boundary circles | pass |
| `GMap2.cap_eulerChar` (501) | D / nonsurface (id,swap,swap) | 2=1+1 / topological cap χ2 versus orbit χ1+b0 | R08: add surface hypothesis |
| `GMap2.cap_isOrientable` (503) | A / B | true↔true / false↔false | surface cases pass; R08 |
| `GMap2.cap_isConnected` (504) | D / A | components 1→1 / 1→1 | surface cases pass; R08 |
| `GMap2.double_eulerChar` (508) | D / B / (swap,id,id) | 2=2×1 / 0=2×0; invalid map gives 3≠2×2, excluded | pass |
| `Graph.degree` (544) | one loop / parallel pair / isolated vertex | 2 / 2 at each end / 0 | pass |
| `Graph.degree_eq_nonloopIncidenceCount_add` (545) | one loop / loop plus one ordinary edge | 2=0+2×1 / 3=1+2×1 | pass |
| `GMap2.underlyingGraph` (551) | T / P / empty | one vertex with 2 loops / 1 loop / no vertices or edges | pass |
| `IsPrimitiveLink` (555) | segment / simple loop / constant path | injective=true / endpoints-only collision=true / false | pass |
| `Drawing` (562) | K₁ / crossed C₄ | 1 injective placement / 4 placements, edge crossing allowed | pass |
| `Drawing.IsNoncrossing` (569) | crossed C₄ / triangle | one intersection of distinct interiors / zero: false / true | pass |
| `Drawing.IsCellular` (574) | equatorial C₃ / K₄ inside torus disc | 2 open-disc faces / one punctured-torus face: true / false | pass |
| `Drawing.exists_isotopic_isPL` (583) | already straight triangle | identity ambient isotopy; 3 edges→3 edges | pass |
| `Drawing.toGMap2` (596) | equatorial C₃ / crossed C₄ / K₁ | VEF (3,3,2) / (5,6,3)≠(4,4,3) / edge count0 excluded | pass |
| `Drawing.toGMap2_realization` (601) | equatorial C₃ | two triangular faces glued to S; χ=3−3+2=2 | pass |
| `Drawing.faceCount` (614) | equator / K₁ sphere / empty sphere drawing | 2 / 1 / 1; last is not cellular | pass |
| `RotationSystem` (628) | one loop / K₁ | 2 loop darts with one cyclic order / unique empty local order | pass |
| `SignedRotationSystem` (629) | one loop | untwisted capped annulus→S; twisted capped band→P | R07: define switching equivalence |
| `cellularDrawings_equiv_gmaps` (636) | one-edge K₂ / K₁ | K₂ sphere has VEF(2,1,1); K₁ cannot be a map graph, excluded | pass |
| `orientedCellularDrawings_equiv_rotationSystems` (642) | K₂ / K₁ | one class each; unique rotations in each case | pass |
| `cellularDrawings_equiv_signedRotationSystems` (646) | one loop | 2 classes: S and P; 2 untwisted/twisted schemes | pass |
| `eulerFormula_cellular` (652) | S with triangle / torus two-loop bouquet | 3−3+2=2 / 1−2+1=0 | pass |
| `IsBranchedCover` (658) | sphere identity, assigned e=1 / e=2 | identity local degree is 1, not 2 | underspecified laws; R07 |
| `riemannHurwitz` (661) | zⁿ on S, n=1,2,3; S→P cover | 2=2n−2(n−1); 2=2×1−0; n=0 not finite cover | pass |
| `Graph.genus` (665) | K₄ / K₅ / K₃,₃ | minimum orientable genera 0 / 1 / 1 | pass |
| `Graph.nonorientableGenus` (666) | K₅ / K₃,₃ / empty graph | first two embed in P (k=1); empty convention unspecified | R07: specify positive-k or Euler-genus convention |
| `ElementarySchemaMove` (702) | abc boundary / subdivision a→uv | once-label count 3→4; χ changes by +1−1=0 | pass |
| `SchemaMove` (710) | renaming a to b | one-edge label bijection; incidence and χ unchanged | R07: also include zero-move isomorphisms |
| `normalFormOrientable` (715) | (g,b)=(0,0),(1,0),(0,1) | intended words aA / abAB / chC; χ2 / 0 / 1 | R01/R04: actual Lean models coincide |
| `normalFormNonorientable` (716) | (k,b)=(1,0),(2,0),(1,1) | aa / aabb / aachC; χ1 / 0 / 0 | R01/R04 |
| `IsNormalForm` (717) | abAB / aa / abc | orientable=true / nonorientable=true / normal=false | pass |
| `schema_reduces_to_normalForm` (719) | abc / abac / abcABC | disc / B / T; invariants (1,1)/(0,1)/(0,0) preserved | intended values; import owner R04 |
| `SchemaMove.realization_homeomorph` (723) | edge subdivision of disc | D≃D; χ1=1; boundary count1=1 | pass |
| `GMap2.chainComplex` (759) | P / T over ℤ | C₂→C₁→C₀: ℤ --2→ ℤ --0→ ℤ / ℤ --0→ ℤ² --0→ ℤ | pass |
| `GMap2.d_comp_d` (761) | triangle [012] | (v₂−v₁)−(v₂−v₀)+(v₁−v₀)=0 | pass |
| `GMap2.homology` (763) | P over ℤ / F₂ / zero ring; i=3 | H₁=ℤ/2 / F₂ / 0; H₃=0 | intended values; R01 |
| `GMap2.eulerPoincare` (769) | P over ℚ / F₂; T over ℚ | 1=1−0+0 / 1=1−1+1; 0=1−2+1 | pass |
| `GMap2.homology_zero_iff_connected` (771) | S / S⊔S / empty over ℤ | H₀ ranks1 / 2 / 0; H₀=0 does not characterize connectedness | R07: no proposition supplied |
| `GMap2.homology_two_iff_orientable` (772) | T / K / P / D | H₂(ℤ)=ℤ / 0 / 0 / 0; D excluded by closedness | pass |
| `GMap2.edgePathGroup` (776) | T / P / pair of pants | ⟨a,b:[a,b]⟩=ℤ² / ⟨a:a²⟩=C₂ / free rank2 | R04: reuse face-group owner |
| `GMap2.edgePathGroup_presentation` (777) | triangular D, two-edge tree | 1 non-tree generator, 1 killing relator → trivial group | pass |
| `GMap2.abelianization_edgePathGroup` (779) | P / pair of pants | C₂ab=C₂=H₁ / F₂ab=ℤ²=H₁; F₂ itself nonabelian | pass |
| `Graph.edgePathGroup_free` (781) | K₂ / parallel pair / theta / two-loop rose | ranks E−V+1=0 / 1 / 2 / 2; rose words ab≠ba | R04: existing §2.2 |
| `GMap2.chainMap_subdivideEdge` (788) | e:v₀→v₂ split at v₁ | e→e₀₁+e₁₂; boundary v₂−v₀ on both sides | pass |
| `GMap2.chainMap_subdivideFace` (789) | triangle split into three | sum of 3 boundaries cancels 3 inner edges; outer boundary unchanged | pass |
| `GMap2.chainMap_flip` (790) | two triangulations of square | χ4−5+2=1 both; boundary is same 4-cycle | R07: specify chain map, not only ranks |
| `AbstractSimplicialComplex.chainComplex` (800) | one 2-simplex | chain ranks 3,3,1; ∂₂=(1,−1,1) | R05: existing owner |
| `SimplicialMap.chainMap` (802) | collapse edge [01] to vertex0 | [01]→0; [1]−[0]→0 | pass |
| `Subdivides.chainEquiv` (805) | interval subdivision | C ranks(2,1)→(3,2); H₀ rank1=1, H₁=0=0 | pass |
| `SimplicialMap.homotopy_of_contiguous` (806) | constant maps to two interval ends | difference v₁−v₀=∂[01]; chain homotopy coefficient1 | pass |
| `GMap2.chainEquiv_flagComplex` (808) | P | cellular ∂₂=2; subdivided complex H₁=C₂,H₂=0 | comparison target justified; R05 inputs |
| `GMap2.homologyMap` (817) | T identity / positive a-twist | I₂ / [[1,1],[0,1]]; b→b / b+a | sign must be specified, R12 |
| `homology_normalFormOrientable_closed` (833) | g=0,1,2 | H₁ ranks0,2,4 = 2g | pass |
| `homology_normalFormOrientable_boundary` (835) | (g,b)=(0,1),(0,2),(1,1) | ranks0,1,2 = 2g+b−1; b=0 excluded | pass |
| `homology_normalFormNonorientable_closed` (837) | k=1,2,3 | C₂ / ℤ×C₂ / ℤ²×C₂; k=0 excluded | pass |
| `homology_normalFormNonorientable_boundary` (839) | (k,b)=(1,1),(1,2),(2,1) | free ranks1,2,2 = k+b−1; no 2-torsion | pass |
| `StandardSurface` (868) | orientable0,0 versus orientable1,0 | constructor equality=false; intended χ2≠0 | pass |
| `StandardSurface.schema` (874) | sphere versus torus | actual schema/model equality=true by rfl; intended χ2≠0 | fail; R01 |
| `StandardSurface.model` (875) | sphere versus torus | actual schema/model equality=true by rfl; intended χ2≠0 | fail; R01 |
| `StandardSurface.eulerChar` (876) | g=0,1,2; b=0,3 | 2,0,−2 / −1,−3,−5; integer subtraction retained | pass |
| `Sphere2` (880) | intended sphere | χ=2, b=0, orientable=true | actual admitted model R01 |
| `Torus` (881) | intended torus | χ=0, b=0, H₁=ℤ² | actual admitted model R01 |
| `Disc` (882) | intended closed disc | χ=1, b=1, H₁=0 | actual admitted model R01 |
| `Annulus` (883) | intended annulus | χ=0, b=2, H₁=ℤ | actual admitted model R01 |
| `sphere2_homeomorph` (884) | intended sphere / unit sphere | (χ,b)=(2,0)=(2,0) | instance agreement; R01/R09 |
| `disc_homeomorph` (885) | intended disc / closed complex ball | (χ,b)=(1,1)=(1,1) | instance agreement; R01/R09 |
| `torus_homeomorph` (886) | intended torus / Circle² | H₁ ranks2=2; b0=0 | instance agreement; R01/R09 |
| `annulus_homeomorph` (887) | intended annulus / Circle×[0,1] | H₁ ranks1=1; b2=2 | instance agreement; R01/R09 |
| `exists_standard_homeomorph` (894) | S,D,T,K | parameters O(0,0),O(0,1),O(1,0),N(2,0) | intended statement; R01/R09 |
| `standard_homeomorph_unique` (897) | actual sphere and torus constructors | homeomorphism premise=true by refl; equality=false | fail; proves False, R01 |
| `classification_of_surfaces` (901) | S versus T models | intended unique labels (0,0)/(1,0); actual models equal | fail at admitted models; R01 |
| `homeomorph_iff_invariants` (904) | T/K; T/A; T/genus2 | triples (0,true,0)/(0,false,0)/(0,true,2)/(−2,true,0) | pass |
| `Surface.genus` (911) | S,T,P,K,A,B | 0,1,1,2,0,1 from χ and b; division occurs only orientably | pass |
| `model_orientable_homeomorph_sdiff_discs` (919) | S minus0,1,2 discs | S,D,A; χ2,1,0; b0,1,2 | pass |
| `model_nonorientable_homeomorph_sdiff_discs` (923) | P minus0,1 discs | P,B; χ1,0; b0,1 | pass |
| `IsEssential` (963) | T core / disc-bounding curve / boundary-parallel curve | true / false / false | R07: explicitly choose peripheral convention |
| `cutAlong` (969) | T core / S equator / P one-sided core | A / D⊔D / D; new boundary counts2 / 2 / 1 | pass |
| `eulerChar_cutAlong` (970) | T core / S equator / P core | 0=0 / 1+1=2 / 1=1 | pass |
| `boundaryComponentCount_cutAlong` (971) | T core / S equator | 2=0+2 / 2=0+2; P core excluded | pass |
| `cutAlongArc` (975) | annulus radial / pair-of-pants connecting arc | D / A; b2→1 / 3→2 | pass |
| `eulerChar_cutAlongArc` (976) | A / pair of pants | 1=0+1 / 0=−1+1 | pass |
| `boundaryComponentCount_cutAlongArc` (977) | A / pair of pants | 1=2−1 / 2=3−1; b≥2 from hypothesis | pass |
| `MappingClassGroupFull` (981) | S / T | C₂ / GL₂(ℤ); reflection determinant−1 admitted | pass |
| `MappingClassGroupRel` (983) | D / A | trivial / ℤ; twist n has winding n, boundaries fixed | pass |
| `MappingClassGroupPlus` (985) | S / T | trivial / SL₂(ℤ); reflection determinant−1 excluded | pass |
| `MappingClassGroupPL.toTop_bijective` (995) | annulus twists n∈ℤ | class n→n; kernel{0}; image all ℤ | pass |
| `MappingClassGroupSmooth.toTop_bijective` (998) | compatible smooth annulus | smooth twist n→topological twist n; kernel{0}, imageℤ | pass |
| `mcg_disc_rel_boundary` (1002) | disc identity and Alexander contraction | both classes=0; group cardinality1 | pass |
| `mcg_annulus_rel_boundary` (1003) | twists T⁰,T¹,T² | winding0,1,2; T¹T¹→2=1+1 | pass |
| `mcg_sphere_plus` (1004) | oriented sphere | identity class only, cardinality1 | pass |
| `mcg_sphere_full` (1005) | sphere reflection r | r²=id; orientation signs ±1; cardinality2 | pass |
| `dehnTwist` (1008) | annulus core / disc-bounding curve | mapping classes1 / 0 | R12: positive sign not pinned |
| `dehnTwist_conj` (1013) | annulus f=id / (θ,r)↦(−θ,1−r) | T=T; second map swaps boundary circles and is excluded | pass |
| `dehnTwist_eq_of_isotopic` (1016) | parallel annulus cores | twist winding1=1 | pass |
| `change_of_coordinates` (1020) | torus meridian / longitude | [[0,−1],[1,0]] has det1, sends meridian to longitude | pass |
| `exists_twists_reduce_intersection` (1034) | annulus p=T⁴q | interior intersections3; T⁻⁴p=q up to perturbation gives0 | source arc extension unverified |
| `MappingClassGroupFull.actH₁` (1043) | torus twist / reflection | matrices [[1,1],[0,1]] / [[−1,0],[0,1]] | pass |
| `mcg_torus_plus` (1044) | standard two twists | A=[[1,1],[0,1]], B=[[1,0],[−1,1]]; detA=detB=1 | pass |
| `mcg_torus_full` (1046) | add reflection R=diag(−1,1) | detR=−1; R²=I; both determinant signs represented | pass |
| `dehnTwists_generate` (1052) | D / A / T | generated groups trivial / ⟨1⟩=ℤ / ⟨A,B⟩=SL₂(ℤ) | pass |
| `exists_dehnTwist_generatingSet_card` (1056) | closed g=1,2 | 3g−1=2,5; g=0 excluded (ℕ value would be0) | pass |
| `RotationSystem.faceCount` (1103) | K₁ / two disjoint triangles / empty | 1 / 4 / 0 componentwise capped faces | pass |
| `RotationSystem.eulerChar` (1104) | same graphs | 1−0+1=2 / 6−6+4=4 / 0 | pass |
| `PlaneMap` (1112) | two triangles / toroidal K₅ plus triangle | χ4=2×2 accepted; χ2≠2×2 rejected | pass |
| `Graph.IsPlanar` (1114) | empty / K₁ / K₄ / K₅ | true / true / true / false | pass |
| `isPlanar_iff_exists_drawing_sphere` (1115) | empty / K₄ / K₅ | true↔true / true↔true / false↔false | pass |
| `eulerFormula_plane` (1119) | K₁ / K₄ | 1−0+1=2 / 4−6+4=2 | pass |
| `edge_bound_of_isPlanar` (1121) | triangle / K₄ / 3 vertices with 4 parallel edges | 3≤3 / 6≤6; 4>3 excluded by simplicity | pass |
| `exists_vertex_degree_le_five` (1123) | K₁ / octahedron / empty | 0≤5 / 4≤5; empty has no vertex, excluded | pass |
| `not_isPlanar_K5` (1125) | K₅ | E10>3V−6=9; nonplanar=true | pass |
| `not_isPlanar_K33` (1126) | K₃,₃ | E9>2V−4=8 (bipartite); nonplanar=true | pass |
| `SimpleGraph.IsContraction` (1129) | K₃ edge contracted / K₁→K₃ | K₂ obtained=true / cannot gain vertices=false | pass |
| `SimpleGraph.IsMinor` (1130) | K₄ contains triangle / K₃ contains K₄ | true / false; direction larger→smaller | pass |
| `exists_edge_delete_or_contract_isVertexConnected` (1136) | K₅ / wheel K₄ | K₅/e=K₄, connectivity3; wheel case excluded | pass |
| `exists_contractible_edge` (1138) | K₅ / K₄ | K₅/e=K₄ has4 vertices; K₄/e=K₃ has3, excluded | pass |
| `isPlanar_iff_no_K5_K33_topologicalMinor` (1142) | K₄ / K₅ / K₃,₃ | true↔(true∧true); false↔false; false↔false | pass |
| `isPlanar_iff_no_K5_K33_minor` (1147) | same graphs | true↔true / false↔false / false↔false | pass |
| `isPeripheral_iff_isFacial` (1153) | K₄ triangle / 4-cycle | triangle induced and nonseparating=true=facial; 4-cycle chorded=false=false | pass |
| `planeMap_unique_up_to_equivalence` (1157) | K₄ | 16 labelled rotation choices; 2 spherical mirror rotations; quotient1 | pass |
| `cycleMatroid_iso_iff_twoIsomorphic` (1161) | K₂ plus isolated vertex versus K₂ | same one-coloop matroid; isolated-vertex graph excluded | pass |
| `Graph.cycleSpace` (1167) | one loop / parallel pair / K₂ | F₂ / span(1,1) / {0} | R04: import existing cycle kernel |
| `Graph.cutSpace` (1168) | one loop / parallel pair / K₂ | {0} / span(1,1) / F₂ | pass |
| `cycleSpace_finrank` (1171) | empty / loop / K₂ / theta | 0=0+0−0; 1=1+1−1; 0=1+1−2; 2=3+1−2 | R04: existing rank formula |
| `cycleSpace_orthogonal_cutSpace` (1173) | parallel pair / one loop | span(1,1)⊥=span(1,1) / F₂⊥={0} | pass |
| `dual_cycleSpace_eq_cutSpace` (1174) | plane K₂ / plane loop | dual loop cycles F₂=cut(K₂); dual K₂ cycles0=cut(loop) | pass |
| `Graph.HasTwoBasis` (1177) | triangle / theta / K₅ | edge frequencies1 / at most2 / no 2-basis | pass |
| `isPlanar_iff_hasTwoBasis` (1179) | triangle / theta / K₅ | true↔true / true↔true / false↔false | pass |
| `exists_straightLine_drawing` (1183) | K₃ | vertices(0,0),(1,0),(0,1); distinct edge interiors have0 intersections | pass |
| `exists_convex_drawing` (1187) | K₄ with triangular outer face | inner vertex(1,1) in triangle(0,0),(3,0),(0,3); 3 bounded faces convex | pass |
| `colorable_five_of_isPlanar` (1191) | empty / triangle / K₄ | chromatic numbers0,3,4 ≤5 | R06: statable headline absent |
| GMap.instFiniteCell (Lean80) | empty/P | cell cardinalities0/1; quotient finite=true | pass |
| GMap.Components (Lean86) | empty/P/T⊔T | orbit counts0/1/2 | pass |
| allSwap (Lean135) | Bool swaps | orbit χ1 versus realized χ2; surface condition=false | pass |
| projectivePlane (Lean145) | four stated permutations | each squares to id; α₀α₂ commute; χ1, nonorientable | pass |
| BundledGMap2 (Lean194) | P/T | D cardinalities4/8; bundling permits both | pass |
| BundledGMap2.realization (Lean359) | bundled P | same realization as unbundled by unfolding | R01: depends on admitted carrier |
| Subdivision and orientation conventions | 570 maps;29 surface maps | flag failures0; surface χ failures0; cover χ/orientation failures0 | finite enumeration passes |
| Cycle equality Check (README201) | abab,baba,aabb | abab=baba true; abab=aabb false | pass |
| Dessin product convention | S₃ σ₀=(01),σ₁=(12) | σinf=(012); correct product id; reversed order gives(021) | pass; add explicit Check |
| Schema round trips (README376) | reverse one face of a two-face sphere | same unoriented surface map; relative face-sign pattern changes | R07: specify face reorientation/permutation quotient |
| Dual involution (README375) | P and T | (α₂,α₁,α₀) reversed again=(α₀,α₁,α₂) | pass |
| Layer1 full table (README287) | tetrahedron/P/T/K/D/A/B | VEF=(4,6,4)/(1,1,1)/(1,2,1)/(1,2,1)/(3,3,1)/(2,3,1)/(2,3,1) | χ2,1,0,0,1,0,0 |
| Disc n-gon Check (README292) | n=0,1,2,3 | empty gives F0,χ0; positive n give F1,χ1 | R12: state n≥1 |
| Boundary-induced orientation | annulus, both boundary circles | outer+1; inner−1; sum0 | R12: retain convention |
| Layer8 sharpness Check | T/genus2; T/K; T/A | χ0≠−2; orientation true≠false; b0≠2 | all three invariants necessary |
| Dyck identity | T#P versus N₃ | χ−1=2−3; b0=0; nonorientable both | pass |
| Annulus inverse-twist Check (README1029) | T⁴q followed by T⁻³ | Tq has0 interior crossings with q; T⁻⁴ is not the only reducer | R02: remove literal “only” |
| No nonemptiness silently assumed | empty GMap vs classification carrier | IsSurfaceGMap=true; components0; ConnectedSpace empty=false | pass |
| Finite coefficients | P over F₂/F₃; zero ring | ∂₂=0/2/0; H₂=F₂/0/0 | ℤ H₂ criterion not extended to F₂ |


## Not verifiable

Eleven of the fourteen bibliography works were not read in full. The following are source-text limits, not additional mathematical findings. The review is complete; none of these texts is represented as verified. All fetches used the sources service, with no paywall bypass. Eight unresolved requests remain in `needs-references.toml`; the three service-uncertified works below are not requested again.

| Source | Uncertified material and where access was attempted |
|---|---|
| `damiand_lienhardt` | §§2.4, 4.3.4.2 pp.106–107, 8.3.2.1 p.331, Definition 91; Taylor & Francis DOI landing page and author's publication listing yielded no full text. |
| `dehlinger_dufourd` | Generalized-map realization/classification route; DOI `10.1016/j.tcs.2004.05.003`, service classified publisher access as uncertified. |
| `lando_zvonkin` | Map/hypermap correspondence; DOI `10.1007/978-3-540-38361-1`, uncertified. The attempted LaBRI author PDF connection also failed. |
| `mohar_thomassen` | Chapter 2 and planarity/embedding results; Johns Hopkins DOI `10.56021/9780801866890` returned HTTP 403. |
| `thomassen` | Kuratowski proof, pp.225–241; Wiley DOI `10.1002/jgt.3190050304` returned HTTP 403. |
| `lickorish1962` | Lemma 2, Theorem 1, pp.531–540, especially the proper-arc/relative-boundary extension; IISER Pune institutional copy failed certificate verification. |
| `lickorish1964` | Lemmas 3–5, §3, pp.769–778; Cambridge publisher access page, no full open text obtained. |
| `lickorish1966` | Correction, pp.679–681; Cambridge publisher page/abstract did not expose the full argument. |
| `farb_margalit` | Chapters 1–4; publisher DOI landing page and UChicago author copy attempted; the latter returned HTTP 403. |
| `munkres` | *Topology* (2000), chapter 12; bibliographic service search found no legal full text. |
| `moise` | PL/surface topology background; Springer DOI access classified uncertified by the service. |

The accessible Gallier–Xu copy is dated 2025; certification above is for that version's locators. No comparison with an unread earlier edition is claimed. Epstein's theorem does not by itself certify the stronger relative smooth statements; the local PlanarTopology contracts were resolved separately. The finite computations and successful Lean elaboration do not certify the unspecific interfaces identified in R07.

## Source issues

- **Misprint** in gallier_xu at §6.1, printed p.82 (`gallier_xu` lines 3141–3142): the source says the sphere digon has one inner vertex; it should be two vertices, one for each oppositely oriented occurrence, giving `V−E+F=2−1+1=2`; affects nothing.
