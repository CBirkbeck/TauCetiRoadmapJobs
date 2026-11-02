# Review of SurfaceTopology (pull request #271 at 421e114)

**Verdict:** needs changes

## R01 (P1) — The proposed cellular counterexample is not cellular

**Location:** `TauCetiRoadmap/SurfaceTopology/README.md:799`. Quote: “`C₃` in a disc with one side along the boundary circle is cellular with two faces”.

**Claim:** This example contradicts the roadmap's own definition of cellularity, and does not witness the asserted necessity of the closedness hypothesis.

**Witness:** A boundary point outside the triangle has a half-disc neighbourhood in its complementary component. That component is not an open disc. `Suggested.lean:239` requires every complementary component to be homeomorphic to an open disc.

**Repair:** Delete this purported cellular counterexample. Explain that, for these compact embedded finite graphs, cellularity already forces the boundary into the support: a remaining boundary point would give the same half-disc obstruction. The boundary-supported formula can be the general statement and the closed formula its corollary. Test the actual examples: the partially boundary-supported triangle is **not** cellular, with raw counts `3−3+2=2≠1`; the whole boundary triangle is cellular, with `3−3+1=1`. Do not change cellularity to admit half-disc faces while keeping the same Euler formula.

## R02 (P1) — The marked-cover comparison cites an excluded supplier target

**Location:** `TauCetiRoadmap/SurfaceTopology/README.md:900`. Quote: “BelyiMaps §7.7 owns the specialized `TopBranchedCover n`”.

**Claim:** The mandatory comparison consumes a carrier that the cited roadmap expressly assigns elsewhere. There is no declared gap for it. This is supplier drift, independently of the passing graph scanner.

**Witness:** On main, `TauCetiRoadmap/BelyiMaps/README.md:2355` assigns all Layer 7 to `BelyiAnalyticCovers`; the same exclusion is at this head's line 2355. Section 7.7 is retained as a dependency specification.

**Repair:** Keep the general surface branched-cover theory here and move its marked-sphere specialization to the actual downstream owner; replace the claimed upstream contract by a downstream-consumer description. Alternatively, register an exact, acyclic supplier contract under the actual owner using the required gap mechanism. Do not silently treat an excluded section as supplied. The adapter must preserve the map and weighted local degree: for `z↦z²`, the marked fibre has cardinality `1` and weight `2`, while a regular fibre has cardinality and weight `2`. The general theorem here needs no marked-cover carrier.

## R03 (P1) — The required build gate rejects a non-sorry warning

**Location:** `TauCetiRoadmap/SurfaceTopology/Suggested.lean:1`. Quote: “`import Mathlib`”.

**Claim:** The supplied gate has `build=1`. Its failure is the module-system warning, not a Lean elaboration error. The brief requires this failed build check to be reported as P1 and forbids acceptance while it fails.

**Witness:** Repeating `lake build TauCetiRoadmap.SurfaceTopology.Suggested` exits 0 but emits the same warning about importing module-system Mathlib without `module`. Direct `lake env lean` exits 0 with only six `sorry` warnings.

**Repair:** Add the module declaration appropriate to the pinned Lean version and rerun the targeted build and gate, preserving the single `import Mathlib`. A scratch copy with `module` elaborates with only `sorry` warnings. Acceptance requires the worker's build check to pass; the successful Lean exit code alone does not resolve this gate finding.

## R04 (P2) — State the Fáry headline on the available drawing carriers

**Location:** `TauCetiRoadmap/SurfaceTopology/Suggested.lean:34`; `TauCetiRoadmap/SurfaceTopology/README.md:1552`. Quote: “The combinatorial planarity headlines need plane maps and minors”.

**Claim:** Fáry's theorem does not need those missing carriers to be stated. The same drawing formulation already used for five-colouring supports its full finite-simple-graph statement.

**Witness:** The following statement elaborates at the pins in a scratch copy, using the retained `Drawing` and Mathlib's `segment`. No admitted carrier, planarity predicate, or minor encoding is needed.

```lean
theorem fary_of_noncrossing_drawing {V : Type*} [Finite V]
    (G : SimpleGraph V) (D : Drawing (Graph.ofSimpleGraph G) ℂ)
    (hD : D.IsNoncrossing) :
    ∃ E : Drawing (Graph.ofSimpleGraph G) ℂ, E.IsNoncrossing ∧
      ∀ (e : (Graph.ofSimpleGraph G).edgeSet)
        (u v : (Graph.ofSimpleGraph G).vertexSet),
        (Graph.ofSimpleGraph G).IsLink e.1 u.1 v.1 →
        E.edgeRange e = segment ℝ (E.vertex u) (E.vertex v) := by
  sorry
```

**Repair:** Add this headline (or the equivalent statement using a simple real-bodied straight-line predicate) and correct the docstring. The empty graph, `K₁`, and the triangle with coordinates `0,1,I` all meet the repaired statement; the triangle's three edge interiors are pairwise disjoint. Connectivity and cellularity are unnecessary.

## R05 (P2) — Finish the remaining mathematical definitions

**Location:** `TauCetiRoadmap/SurfaceTopology/README.md:311`, `:565`, `:855`, `:1303`. Quotes: “`def GMap2.connectedSum`”; “`def Graph.nonorientableGenus`”; “`def IsEssential`”.

**Claim:** These interfaces still do not determine their objects. Connected sum takes arbitrary, possibly empty or disconnected maps without selected components or discs. Nonorientable graph genus has no convention at genus zero. Essentiality has no peripheral or one-sided convention. The assertion that cell orientations have two choices also needs the surface hypothesis.

**Witness:** For allSwap the edge has one ⟨α₂⟩-orbit, not two. The empty map has no connected-sum disc. K₁ has nonorientable genus 0 or 1 depending on convention; the annulus core distinguishes essentiality conventions.

**Repair:** Specify connected sum on nonempty connected surface maps, with explicit embedded disc data or an independence theorem for chosen discs; give a separate component-selected operation for disconnected inputs. Choose the standard graph-genus convention explicitly, including empty graphs. Define essentiality in prose, relating its two-sided restriction to `FreeGroupsAndLimitGroups §6.0d`. For example, exclude disc-bounding and boundary-parallel curves, and state the treatment of one-sided curves. Add the corresponding positive/negative controls: `sphere#torus=torus` with `χ=0`; `K₁` has the chosen value; the annulus core is peripheral, the torus meridian is essential. State the two-choice cell-orientation API under `IsSurfaceGMap`: P has two edge orientations, allSwap only one. Also define the Whitney move equivalence `TwoIsomorphic`.

## R06 (P2) — Replace the admitted Hausdorff instance by a theorem

**Location:** `TauCetiRoadmap/SurfaceTopology/Suggested.lean:191`. Quote: “`instance GMap2.realizationT2Space ... := by sorry`”.

**Claim:** This is the gate's remaining `sorry-data=1` violation. It is a proposition-valued instance, so it does **not** recreate the previous collapsed-carrier inconsistency, but the acceptance-test rule expressly prohibits admitted instances.

**Witness:** The only admitted instance is this declaration. None of the following headline signatures needs it installed for typeclass search; changing `instance` to `theorem` in the scratch copy elaborates successfully.

**Repair:** State Hausdorffness as a named theorem with `sorry`, or include it in a realization headline. Keep the real quotient topology. This preserves the intended Hausdorff assertion on the empty map, the all-swap sphere, and the projective-plane quotient without pretending the proof is implemented.

## R07 (P3) — Remove the eight undeclared API-name claims

**Location:** `TauCetiRoadmap/SurfaceTopology/README.md:498`, `:515`, `:522`, `:623`, `:638`, `:875`, `:1148`. Quote: “`GMap2.chainEquiv_cellularFlag`”.

**Claim:** The gate reports eight `readme-ids-missing` failures. These names advertise declarations that the acceptance file does not contain.

**Witness:** The missing names are `Drawing.exists_isotopic_isPL`, `GMap2.cap_realization`, `GMap2.chainEquiv_cellularFlag`, `GMap2.chainEquiv_flagComplex`, `GMap2.contractEdge_quotient`, `eulerChar_barycentricSubdivision`, `eulerChar_eq`, and `realization_homeomorph_flagComplex`.

**Repair:** State these API requirements in prose without advertising Lean declaration names. Do not add an API catalogue to `Suggested.lean`. Preserve their content and computed examples: capping a disc changes `(χ,b)=(1,1)` to `(2,0)`, and the projective-plane chain comparison retains `H₁=ℤ/2`.

## R08 (P3) — Delete the file rejected by the roadmap-file gate

**Location:** `TauCetiRoadmap/SurfaceTopology/sources.toml:1`. Quote: “Bibliographic keys”.

**Claim:** The supplied gate reports `stray-files=1` for this file.

**Witness:** The gate's allowed roadmap-file list excludes `sources.toml` and identifies this exact path. The README references it at line 1622.

**Repair:** Delete it; sources are the README's references. Preserve its bibliographic keys, editions and useful locators there, and remove the dangling file reference. This follows this job's explicit repair for `stray-files`, notwithstanding its general manifest guidance. This review changed neither file.

## R09 (P3) — Supply per-definition APIs, Checks and target dependencies

**Location:** `TauCetiRoadmap/SurfaceTopology/README.md:225`, `:286`, `:370`, `:1440`. Quote: “Representative formal statements”.

**Claim:** The previous shape finding remains. The document still uses layer-wide signature catalogues and lists of intermediate results; it has no `*Needs:*` lines and no per-definition API/three-Check structure. The required Summary, Scope and ownership, Conventions, and How to read the build headings are absent in their prescribed form.

**Witness:** `GMap2.boundary`, `GMap2.EdgeOrientation`, `RotationSystem`, and the three mapping-class groups lack their individual API lists and three discriminating Checks. There are no numbered topic subsections or closing `### Examples`/`### Dependencies` sections.

**Repair:** Reorganize the retained mathematics into the required prose shape, without reducing scope. Add exact per-target inputs, including the isotopy-to-contiguity bridge used at line 1091, and replace instructions to exhibit examples by actual examples. Restrict the polygon-disc table at line 364 to `n≥1`: `n=0` has no darts, hence actual `(V,E,F,χ)=(0,0,0,0)`, not `(0,0,1,1)`. Keep the corrected twist computations. Remove draft/PR references, including Lean line 210; add declaration docstrings and matching layer headings.

## R10 (P3) — Attach exact source locators to the remaining targets

**Location:** `TauCetiRoadmap/SurfaceTopology/README.md:1377`, `:1503`, `:1552`, `:1567`, `:1630`. Quote: “Lickorish's Lemma 2, for curves and for proper arcs”.

**Claim:** Corrected Gallier–Xu locators do not resolve the global locator deficit. Many claims and proof inputs still have only a book, chapter, or paper title, with no theorem/section and printed page at the claim. The proper-arc extension is attributed as though it were the cited lemma without a verified locator for that generality.

**Witness:** Fáry, Tutte's spring embedding and the wheel theorem have no claim-level locators. The Lickorish entry supplies no printed page for the arc statement. GraphConnectivityAndFlows defines component count in Target 1.1, line 253, not Milestone 2.

**Repair:** Give exact locators and hypotheses for each theorem and source-proof step. Label an extension as a local target and provide its route if the source only states the closed-curve version. Correct component-count citations to Target 1.1. Preserve the repaired Gallier–Xu references: Definition 6.5, pp.88–91; Lemma 6.1, pp.92–95; Theorems 6.1–6.2, pp.96–97. Unavailable source text is a verification limit, not a reason to invent a theorem number.

## R11 (P3) — Remove acceptance-file padding and unused catalogue definitions

**Location:** `TauCetiRoadmap/SurfaceTopology/Suggested.lean:71`, `:75`, `:85`, `:149`, `:156`, `:235`, `:285`. Quote: “The correction term in Riemann–Hurwitz is an actual finite sum”.

**Claim:** The finite-preimage declaration is a direct library specialization, and several retained definitions are not needed by any retained headline. The unchanged file still contains catalogue material; the finite-preimage theorem is already proved, but remains padding.

**Witness:** `IsBranchedCover.finite_preimage_branch` closes with `exact B.finite_toSet.preimage' (fun y _ => hp.finite_fibers y)`, tested at the pin. `Set.Finite.preimage'` is in `Mathlib/Data/Set/Finite/Lattice.lean:213`.

**Repair:** Delete it from `Suggested.lean`; the README keeps the statement and cites that lemma. Also remove definitions used by no retained headline: component and cell-count APIs, map isomorphisms, boundary-dart/closed-map predicates, orientation structures, `BundledGMap2`, and cellular support predicates. Keep only the simple definitions needed by realization, drawing and degree headlines, plus any genuinely nontrivial small tests of those definitions. Remove the unused `TauCeti.Topology.Triangulable` import. Do not prove padding in place. The finite-preimage check remains `0` points for an empty marking and `2` points for the two branch points of `z↦z²` on the sphere.

## Previous findings

Each item refers to the previous report at `9bd6e07`; all passages below are at `421e114`.

- R01 — not repaired: README:799–801 still calls the partially boundary-supported triangle cellular; Suggested.lean:239 still requires open-disc complementary components. Carried as R01.
- R02 — not repaired: README:900–906 still imports BelyiMaps §7.7's marked-cover carrier; that roadmap's main-branch Layer 7 still belongs to BelyiAnalyticCovers. Carried as R02.
- R03 — not repaired: Suggested.lean:1 still starts with `import Mathlib`; the targeted build reproduces the module-system warning rejected by the supplied gate. Carried as R03.
- R04 — not repaired: Suggested.lean:34 still groups the planarity headlines under missing carriers; the Fáry statement at README:1552 is still absent. Carried as R04.
- R05 — not repaired: README:312, :565, :855, :1303 and :1530 retain the unconstrained orientation, connected-sum, nonorientable-genus, essentiality and two-isomorphism interfaces. Carried as R05.
- R06 — not repaired: Suggested.lean:191 remains an admitted Hausdorff instance. Carried as R06.
- R07 — not repaired: The eight advertised names remain in README:498, :515, :522, :623, :638, :875 and :1148; the gate reproduces all eight failures. Carried as R07.
- R08 — not repaired: `TauCetiRoadmap/SurfaceTopology/sources.toml` remains, and README:1622 still refers to it; the roadmap-file gate rejects it. Carried as R08.
- R09 — repaired: The seven added lines in `Completed/ConformalMapping/README.md` are reverted. The exclusion-filtered diff against origin/main is empty; only the two authorized roadmap folders remain.
- R10 — not repaired: README:225, :286, :370 and :1440 retain signature catalogues and aggregate intermediate results; individual APIs, three Checks and target dependencies remain missing. Carried as R09.
- R11 — not repaired: README:1366–1383, :1503, :1552 and :1567 retain the unresolved locators and arc attribution; the component-count citation still says Milestone 2. Carried as R10.
- R12 — not repaired: Suggested.lean:285 remains a one-library-lemma specialization, and the unused catalogue definitions and triangulability import remain. Carried as R11.

No supplied repair report settles any of these remaining findings as “not actionable in this package”.

## Verified sound

:robot: AI review. This is an **incremental re-review of 0 changed lines since 9bd6e07**. The target folder, PlanarTopology, `lake-manifest.json` and `lean-toolchain` are unchanged. I read the normative root README and CONTRIBUTING guidance, checked the previous findings against their present passages, and examined the three neighbouring README reversions. I did not repeat the full source or mathematical review of unchanged material. Neither roadmap nor any pin was edited.

**Scope of the update.** The changes remove reciprocal references from `Completed/ConformalMapping/README.md`, `TauCetiRoadmap/BelyiMaps/README.md` and `TauCetiRoadmap/GeometricTopology/README.md`. These files now have no PR diff against origin/main. GeometricTopology's Layer 11 simplex-chain contract remains intact. BelyiMaps' excluded Layer 7 remains excluded. No new mathematical statement was added by these reversions and no new defect in SurfaceTopology's consumed contracts was established.

**Gate and elaboration.** The supplied head-specific gate fails with `sorry-data=1`, `readme-ids-missing=8`, `stray-files=1`, and `build=1`; each failure is reported above. I reran the advertised full-gate command: it reproduces the first three failures, then stops without a build result because its default context additionally reports the following false positives:

- `depcheck: NOT IN ORDER: SurfaceTopology (insert it after its last supplier)`. The brief explicitly permits placement after the last supplier; the separate candidate-order check below passes.
- `outside-folder` for `TauCetiRoadmap/PlanarTopology/README.md`, `Suggested.lean`, `metadata.toml`, and `sources.toml`. PlanarTopology is explicitly authorized as this PR's other folder; these are not SurfaceTopology findings.

The required dependency command, using the supplied candidate merge order and `--movable`, prints:

```text
depcheck: 205 roadmaps, 1506 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. SurfaceTopology still has no `*Needs:*` lines; the scanner's success does not repair R02 or R09.

The independent targeted `lake build TauCetiRoadmap.SurfaceTopology.Suggested` exits 0 and reproduces the non-sorry warning:

```text
warning: TauCetiRoadmap/SurfaceTopology/Suggested.lean: imports `Mathlib` from package `mathlib`, which is designed for use with the module system; consider adding `module` to the start of this file
Build completed successfully (8958 jobs).
```

Direct `lake env lean` on the unchanged acceptance file exits 0 with only the **six** expected `sorry` warnings. Successful elaboration does not remove the supplied gate's build-warning failure.

**Signatures and repair probes.** I reran the scratch copy with `#check @name` for all **35 named declarations**, compared the output with the supplied signatures and README contracts, and found no lost section binder. In particular, the compact-surface presentation keeps compactness and Hausdorffness; weighted degree keeps both spaces' compactness, Hausdorffness and connectedness. The native `ConnectedSpace` requires nonemptiness. A second scratch copy, with `module`, Hausdorffness changed from an instance to a theorem, the explicit Fáry statement from R04, and the one-lemma finite-preimage proof, elaborates with only `sorry` warnings. These are tested repairs, not changes to the PR. The previous one-tactic failures for the six admitted propositions are carried forward; unchanged declarations were not subjected to another full tactic search.

**Headlines checked.** The README's end results are finite-map realization/presentation, Heffter–Edmonds–Ringel, topological polygon normal forms, compact-surface classification, curves/mapping classes and Dehn–Lickorish, planarity (Kuratowski, Whitney, Mac Lane, Fáry and five-colouring), finite homology, and Riemann–Hurwitz. The acceptance file retains realization charts/presentation, five-colouring, intrinsic local exponent and positive constant weighted degree. Its docstring records the missing normal-form, classification, rotation, chain, mapping-class and Euler carriers. The independently elaborated Fáry signature still demonstrates R04.

**Pinned declarations reopened.** All **15 inventory rows** below were opened at the unchanged pins. The declarations and the limits recorded in the previous review still apply. Paths below are relative to the named library root.

| Library location | Content checked; limitation retained |
|---|---|
| Mathlib `Geometry/Manifold/ChartedSpace.lean:141` | Atlas and local charts cover the space; no separation or nonemptiness field. |
| Mathlib `Topology/Connected/Basic.lean:705` | `ConnectedSpace` extends preconnectedness with `Nonempty`. |
| Mathlib `GroupTheory/GroupAction/Defs.lean:287` | `MulAction.orbitRel` is the actual orbit setoid. Finite quotients give the cell counts. |
| Mathlib `AlgebraicTopology/SimplicialComplex/Basic.lean:154` | Every singleton belongs to an abstract complex; this is not a generalized-map incidence carrier. |
| Mathlib `Combinatorics/Graph/Connected/EdgeCut.lean:36`, `:82` | `edgeCut` and `IsEdgeCut`; a loop crosses no vertex cut. |
| Mathlib `Algebra/Module/PID.lean:255` | `Module.equiv_free_prod_directSum`, with `Module.Finite`; allows singular/rectangular presentation matrices. |
| Mathlib `Topology/Homotopy/Lifting.lean:256` | `IsCoveringMap.liftPath`, given a continuous path and a chosen lift of its initial point. |
| Mathlib `Data/Set/Finite/Lattice.lean:213` | Finite preimage of a finite set with finite fibres, used in R12's exact probe. |
| Tau Ceti `Topology/Triangulable.lean:40` | Existence of an abstract complex realization homeomorphism; no finiteness or surface condition is part of `IsTriangulable`. |
| Tau Ceti `AlgebraicTopology/SimplicialComplex/Maps.lean:36` | Native simplicial maps allow repeated vertex images; oriented chain maps must send degenerate images to zero. |
| Tau Ceti `AlgebraicTopology/SimplicialComplex/LinkStar.lean:82` | Native links; they are not a replacement for corner-occurrence links. |
| Tau Ceti `AlgebraicTopology/SimplicialComplex/Subdivision/Homeomorph.lean:221` | Native barycentric subdivision homeomorphism for abstract complexes; the map-to-complex bridge remains new. |
| Tau Ceti `Topology/Homotopy/Isotopy/Basic.lean:111`; `AmbientIsotopic/Basic.lean:58` | Isotopies and ambient isotopies of continuous maps; PL/smooth and drawing-specific transport still require their stated adapters. |
| Tau Ceti `Combinatorics/RibbonGraph/Basic.lean:49`, `:119`, `:195` | Native bipartite ribbon carrier, product order, white degree; white degree two is an additional hypothesis, not a field. |
| Tau Ceti `LinearAlgebra/Matrix/SmithNormalForm.lean:750` | Nonzero determinant, including negative determinant; no rectangular/singular claim. |

**Cross-roadmap contracts resolved this round (seven roadmaps).** Main, rather than revisions of existing roadmaps in open PRs, was used for established suppliers. The roadmap index was queried by object (`TopBranchedCover`, ordered simplex chains, generalized maps and nonorientable genus); the BelyiMaps main copy was read through `roadmaps show`. The broader unchanged ownership audit is inherited from [r2]. No new owner is introduced by this diff; SurfaceTopology continues to own generalized-map/topological adapters, not the generic polygonal or cellular theories. Open work without supplied files was not independently checked.

| Roadmap | Present passage resolved and effect |
|---|---|
| GraphConnectivityAndFlows, main | `TauCetiRoadmap/GraphConnectivityAndFlows/README.md:224`, :253, :268, :331: Target 1.1 walks/isomorphisms/components and simplification, Target 1.2 cuts, Target 1.5 deletion/connectivity. Component count belongs to 1.1, confirming R10's locator correction. |
| FreeGroupsAndLimitGroups, main | `TauCetiRoadmap/FreeGroupsAndLimitGroups/README.md:326`, :368, :385, :409, :1384, :1403, :1419, :1436: §§2.1–2.2a and 6.0a–6.0d own Serre darts, graph groups, kernels, polygonal models/moves, face presentations and cut models. Essential curves are two-sided, non-disc-bounding and non-peripheral. |
| GeometricTopology, main | `TauCetiRoadmap/GeometricTopology/README.md:849`: Layer 11 realization/maps/CW and alternating ordered boundary; the removal of the reciprocal surface references leaves this supplier unchanged. |
| AlgebraicTopology, main | `TauCetiRoadmap/AlgebraicTopology/README.md:499`: Stage 4 items 1–3, cellular groups/differential/naturality and comparison, with the stated exactness and CW hypotheses. |
| PlanarTopology, this head | `TauCetiRoadmap/PlanarTopology/README.md:144`, :504, :621, :646, :812, :930, :956, :1074, :1163, :1212: surface/atlas transport, boundary, PL and link-condition carriers, Radó/Hauptvermutung/Pachner, orientation cover/invariants, fixed-triangulation tameness, and relative TOP/PL/smooth comparisons. Its bytes are unchanged. |
| BelyiMaps, main | `TauCetiRoadmap/BelyiMaps/README.md:2355` and :2511: excluded Layer 7 and marked-cover signature. Layer 2's finite ribbon objects remain available; the mandatory §7.7 adapter remains R02. |
| TeichmullerGeometry, supplied head | `TauCetiRoadmap/TeichmullerGeometry/README.md:12`, :65: consumes SurfaceTopology Layer 9's generic mapping classes; its path-component/diffeomorphism comparison is a separate construction. It is a consumer, not an added supplier. |

**Seeded source sample.** All 15 sampled occurrences fall in unchanged passages; none requires a new source check under the incremental brief. The previous checks and their limits are carried forward for “Proof strategy and formalization notes”, “Representative formal statements”, “From PlanarTopology”, “Natural intermediate results”, “Consequences”, “From GraphConnectivityAndFlows”, “Shared simplex-chain interface”, “Separate cellular comparison”, “From layers 4, 7, and 8”, and “Vocabulary”. The supplier-dependent occurrences were resolved again as above. No new source text was fetched or certified.

The inherited readable-source evidence is Gallier–Xu (2025 author revision), Definition 6.5, pp.88–91, Lemma 6.1, pp.92–95, and Theorems 6.1–6.2, pp.96–97 (`gallier_xu` lines 3305, 3432, 3564, 3719, 3750); Epstein Theorems 6.3–6.4, pp.99–103 (`epstein1966` lines 533, 576–593, 604); and Gonthier's encoding/componentwise Euler formula, pp.1385–1386 (`gonthier2008` lines 397, 431). These are [r2]'s locator checks, not fresh readings. Unread works remain listed below.

**Adversarial table.** These **174 retained rows** carry forward [r2]’s computations for the sampled material, headline theorems and findings. Redundant per-target rows are omitted for the comment limit. There are **zero changed target statements** and no new mathematical tests. Each row cites [r2]; values are unchanged and finding numbers refer to this report. The enumeration of 570 maps, including 29 surface maps, is inherited evidence.

Notation from [r2]: `S,D,T,P,K,A,B` denote sphere, disc, torus, projective plane, Klein bottle, annulus and Möbius band; `O(g,b),N(k,b)` denote orientable/nonorientable standard models. `F_r` is a rank-r free group. “=” means no additional finding, not source certification. Finite instances do not prove the general theorems.

| Statement / definition | Instances tried | Computed values on the two sides | Result | Change |
|---|---|---|---|---|
| L0 bundled finite maps | Empty darts; Boolean darts | Dart cardinalities `0;2`, retained by the bundle | Consistent | Remove unused Lean bundle, R11; [r2] |
| L0 isomorphism not homeomorphism | Triangle and subdivided square discs | Dart sizes `6≠8`, realizations both D with χ=1 | Negative control works | =; [r2] |
| L1 GMap involutions/commutation | Empty; all-swap; noncommuting swaps `(01),(12)` in positions 0,2 | Empty laws vacuous; swap²=id; `(01)(12)≠(12)(01)` | Wrong permutation data excluded | =; [r2] |
| L1 cell finiteness | Empty; four-dart P | Each quotient size `0`; each size `1≤4` | Native finite-quotient instance applies | R11; [r2] |
| L1 components | Empty; D; D⊔D | Orbit counts `0;1;2` agree with topological components | Consistent | R11; [r2] |
| L1 map isomorphism | P with permuted darts; P versus T | First adjacency squares commute; second has cell vectors `(1,1,1)≠(1,2,1)` | Consistent | R11; [r2] |
| L1 orbit Euler count | S,T,P,K,empty | `4−6+4=2;1−2+1=0;1−1+1=1;1−2+1=0;0` | Matches χ under surface hypothesis | =; [r2] |
| L1 edge orientation | P loop; allSwap edge | ⟨α₂⟩-orbit counts2;1 | Two-choice assertion needs surface hypothesis | R05; [r2] |
| L1 face orientation | Triangle face; one all-fixed dart | ⟨α₀α₁⟩-orbit counts2;1 | Two-choice assertion needs surface hypothesis | R05; [r2] |
| L1 surface condition | P; all-swap; empty | P: `(noFix₀,noFix₁,noFold)=(T,T,T)`; all-swap `(T,T,F)`; empty all T | Correct folded-cell exclusion | =; [r2] |
| L1 orientability predicate | T; P; empty | Bipartite colouring exists for T; P's three adjacencies make a triangle, impossible; empty colouring exists | Correct convention | =; [r2] |
| L1 boundary map/count | D,A,B,S,empty | Boundary circles `1;2;1;0;0` | Discriminates A/B despite χ=0 | R09 APIs; [r2] |
| L1 induced boundary orientation | Standard annulus | Outer circle counterclockwise, inner clockwise; their induced homology classes sum to 0 | Surface-on-left convention agrees | =; [r2] |
| L1 genus from invariants | T,A,P,K | Orientable `(2−b−χ)/2=1,0`; nonorientable `2−b−χ=1,2` | Correct under connectedness/type hypotheses | Specify domains, R05; [r2] |
| L1 polygon-disc Check | n=0,1,2,3 | Actual vectors `n=0:(0,0,0)`; positive n:`(n,n,1)` | n=0 refutes unrestricted table | R09: n≥1; [r2] |
| L2 permutation triple convention | σ₀=(01),σ₁=(12), σ∞=(012) | `σ∞σ₁σ₀=id`; reversed order gives a nonidentity 3-cycle | Nonabelian direction pinned | =; [r2] |
| L2 Walsh construction | Degree-one triple | `1→2→4` darts through bipartite ribbon/generalized adapters; `2−1+1=2` | Corrected factor of four | =; [r2] |
| L2 clean dessin restriction | Degree-one triple; white 2-cycle | White degrees `1;2` | First is bipartite, not clean | No implicit clean hypothesis; [r2] |
| L2 schema-to-map | `aa`, commutator square | `(V,E,F)=(1,1,1);(1,2,1)` | Produces P/T and χ=1/0 | =; [r2] |
| L2 complex-to-map flag comparison | One filled triangle K | Barycentric flag complex has `(7,12,6)` versus K `(3,3,1)`; both χ=1 | Comparison is subdivision, not equality | =; [r2] |
| L2 map subdivision realization comparison | All-swap | Raw χ=1; subdivided flag χ=`3−3+2=2`; both realizations S | No false orbit-Euler preservation without surface hypothesis | =; [r2] |
| L2 triple Euler/connectivity | Two disjoint degree-one triples | Generalized counts `(4,2,2)`, χ=4, components=2 | Componentwise formula, not connected χ=2 | =; [r2] |
| L3 chamber | Empty; one dart | `0` triangles; `1` closed standard triangle | Nonempty simplex does not make empty coproduct inhabited | =; [r2] |
| L3 gluing step | Identity adjacency; swap | Interior points have no nontrivial partner; matching side points have `1` identified partner for swap | No whole-chamber collapse | =; [r2] |
| L3 generated setoid | Two adjacent chambers | Reflexive points remain; swapped side pair equivalent both directions; unrelated interiors distinct | Correct quotient relation | =; [r2] |
| L3 realization topology | Empty; one all-fixed dart | Empty space; closed triangular disc | Native quotient preserves intended objects | =; [r2] |
| L3 compactness | 0 or finitely many chambers | Finite union of compact triangles, quotient compact; empty also compact | Existing instance is genuine | =; [r2] |
| L3 Hausdorffness | Empty; all-swap; P | Empty Hausdorff; S and P have separated distinct points | True target; admitted instance forbidden | R06; [r2] |
| L3 surface charts | One all-fixed dart; all-swap; P | Realizations D,S,P; boundary components `1;0;0` | Surface hypothesis is not needed for existence of charts | =; [r2] |
| L3 boundary identification | α₀=id, α₁=α₂=swap | α₂ fixed-point count=0 but realization has boundary | Necessity of no 0/1 boundary retained | =; [r2] |
| L3 cell-Euler comparison | All-swap; P | All-swap raw1 versus topological2; P raw1=topological1 | Surface condition discriminates | =; [r2] |
| L3 orientation comparison | All-swap; P | Bipartite T/F versus topologically orientable S/P T/F | Computed direction agrees | =; [r2] |
| L3 sixfold subdivision | Empty; P; triangle D | Darts `0→0;4→24;6→36` | Correct sixfold count | =; [r2] |
| L3 subdivision preserves surface condition | P; triangle D | Subdivided `(V,E,F)=(3,6,4);(7,12,6)` and no forbidden fixes/folds | Both remain surfaces | =; [r2] |
| L3 subdivision preserves cell Euler | P; D | `1=3−6+4`; `1=7−12+6` | Verified with required hypotheses | =; [r2] |
| L3 flag injectivity after subdivision | Enumeration of 570 maps, 0–4 darts | 570 distinct valid triples tested; 0 flag-injectivity failures | Finite check, not proof | =; [r2] |
| L3 realization subdivision homeomorphism | P; D | Before/after χ=`1/1`, boundary=`0/0;1/1`, orientation=`F/F;T/T` | Necessary invariants agree | =; [r2] |
| L3 finite-map presentation | Empty; S; P; D | Presentations have `0;24;4;6` darts respectively | Empty and nonorientable cases included | =; [r2] |
| L3 flag-complex realization | Triangle disc after subdivision | Six triangles, seven vertices, χ=1; realization D | Raw incidence collapse avoided | =; [r2] |
| L4 edge subdivision | Loop and nonloop edge | Both give `ΔV=1,ΔE=1,ΔF=0`, hence Δχ=0 | Includes loops with correct subdivision | =; [r2] |
| L4 face subdivision | Disc polygon split by diagonal | `ΔV=0,ΔE=1,ΔF=1`, hence Δχ=0 | Correct | =; [r2] |
| L4 eligible edge contraction | Triangle boundary edge | `(3,3,1)→(2,2,1)`; χ=1; quotient D | Eligible boundary contraction valid | =; [r2] |
| L4 contraction quotient hypothesis | Interior diagonal joining boundary points in square | Quotient is two discs joined at a point, not a surface | Both-boundary-endpoint interior edge excluded | =; [r2] |
| L4 connected sum | S#T; (S⊔T)#S; empty | Connected χ formula `2+0−2=0`; disconnected component choice unspecified; empty has no disc | Interface incomplete | R05; [r2] |
| L4 orientation-cover construction | P; T; B; empty | Cover spaces S,T⊔T,A,empty; sheet counts2,2,2,0 | Finite construction handles all cases | =; [r2] |
| L4 orientation cover is orientable | P,K,B | Covers S,T,A all orientable=T; bases orientable=F | Correct | =; [r2] |
| L4 orientation cover Euler | P,K,B | `χcover=2,0,0=2χbase` | Correct under surface hypothesis | =; [r2] |
| L4 orientation-cover connectedness iff | Connected P versus T | Cover components `1;2`, nonorientability `T;F` | Both directions tested | =; [r2] |
| L4 orientation-cover projection | P; B | Interior fibre cardinality2; each boundary point of B also fibre2 | Genuine unramified cover | =; [r2] |
| L4 lifting boundary | B; A | Boundary counts `1→2;2→4` in orientation cover | Correct doubling | =; [r2] |
| L4 cap construction | D,A,B,empty | Outputs S,S,P,empty | Different orientability retained | =; [r2] |
| L4 cap Euler | D,A,B | `1+1=2;0+2=2;0+1=1` | χcap=χ+b | =; [r2] |
| L4 cap orientability iff | A versus B | A/S both T; B/P both F | Both directions agree | =; [r2] |
| L4 cap components | Empty; D⊔B | `0→0;2→2` | Does not connect separate components | =; [r2] |
| L4 cap realization | D | Fill its sole boundary circle: `(χ,b)=(1,1)→(2,0)` | Correct topological comparison | R07 name only; [r2] |
| L4 double | D,A,B | Doubles S,T,K; χ=`2,0,0=2χbase` | Correct | =; [r2] |
| L4 double scope | α₀=swap, α₁=α₂=id | Raw χ=2, raw doubled χ=3≠4 | Non-surface input excluded by theorem hypothesis | =; [r2] |
| L5 graph degree and loops | One loop; ordinary edge | Loop degree2 versus incident-edge count1; ordinary endpoints degree1 | Degree convention discriminates | =; [r2] |
| L5 underlying graph | P; one-face T | One vertex with1 loop; one vertex with2 loops | No isolated vertices arise from dart orbits | =; [r2] |
| L5 primitive link | Segment; circle; constant path | Segment injective; circle has only 0~1; constant path identifies 0~1/2 | Constant wrong model excluded | =; [r2] |
| L5 drawing | Triangle; coincident vertices | Three distinct vertices admitted; coincident vertices violate embedding injectivity | Correct carrier | =; [r2] |
| L5 noncrossing | Triangle; crossed quadrilateral | Distinct interiors intersection sizes0; one crossing yields1 | Predicate discriminates | =; [r2] |
| L5 support | Empty graph; triangle | Empty support; three vertices plus three arcs=S¹ | Isolated vertices included | =; [r2] |
| L5 PL drawing | Straight triangle; its ambiently bent image | First affine on3 edges; second becomes PL after suitable chart/triangulation | Relative triangulation matters | R09 exact APIs; [r2] |
| L5 cellular drawing | Equator on S; contractible loop on T | Complement `D°⊔D°`; complement includes punctured T, H₁ rank2 | Second not cellular | =; [r2] |
| L5 drawing equivalence | Relabelled triangle | Edge/vertex bijections sizes3/3 and same image; distinct literal labels | Must retain labelled equivalence data | =; [r2] |
| L5 isotopic PL replacement | Three noncrossing arcs | Same three endpoints and pairwise interior intersections0 before/after | Supplier finite-family tame hypothesis resolved | =; [r2] |
| L5 drawing-to-map | Triangle on S | `(V,E,F)=(3,3,2)`, χ=2 | Closed connected cellular case matches | =; [r2] |
| L5 drawing-to-map excluded cases | Crossed C₄; K₁ | Crossing subdivision gives `(5,6,3)`, not `(4,4,?)`; K₁ has0 darts but1 graph vertex | Noncrossing/nonempty-edge guards necessary | =; [r2] |
| L5 drawing roundtrip | Triangle on S | Graph vertices3, edges3 and faces2 retained | Incidence labels must be retained | =; [r2] |
| L5 rotation system | Isolated vertex; valence-three vertex | Empty cyclic order unique; three darts have2 cyclic orders | Isolated vertices cannot be discarded | R09; [r2] |
| L5 signed rotation switching | One tree edge; one loop | Endpoint switch changes tree twist `1→0`; loop sign gets `ε+ε=0` | Loop twist distinguishes annulus/Möbius neighbourhood | =; [r2] |
| L5 Heffter–Edmonds–Ringel | K₂ on S; isolated K₁ | K₂ rotation gives2 vertices1 edge1 face; K₁ requires explicit isolated component | General correspondence needs retained isolated-vertex data | =; [r2] |
| L5 oriented versus unoriented correspondence | Tetrahedral K₄ | Spherical rotations occur as a mirrored pair; forgetting surface orientation identifies pair | Equivalence must state orientation convention | =; [r2] |
| L5 closed Euler formula | Triangle on S | `3−3+2=2=χ(S)` | Correct | =; [r2] |
| L5 boundary-supported Euler | Boundary triangle on D | `3−3+1=1=χ(D)` | Correct | =; [r2] |
| L5 claimed closedness counterexample | Partially boundary-supported triangle in D | Raw `3−3+2=2≠χ(D)=1`; second component has boundary points | Not cellular | R01; [r2] |
| L5 power-map model | z,z²; constant map; boundary point | Exponents1,2; constant cannot satisfy positive-power identity; boundary excluded by interior chart | Data tied to actual map | =; [r2] |
| L5 branched-cover predicate | Identity; z² on disc; identity with e=2 | First two local powers1/2 valid; identity local degree1≠2 | Arbitrary exponent assignment excluded | =; [r2] |
| L5 finite branch preimage | Empty marking; sphere z² marked at0,∞ | Preimage sizes `0;2`; each fibre finite | Native finite-union theorem | R11; [r2] |
| L5 intrinsic local degree | z² with extra unramified marking | Degree at0 stays2; newly marked regular point degree1 | Marking does not alter exponent | =; [r2] |
| L5 positive weighted degree | zⁿ, n=1,2,3 on sphere | Regular sums `1,2,3`; branch sums `1,2,3` from one point of weight n | Constant positive degree | =; [r2] |
| L5 boundary weighted degree | z² on closed D | At boundary:2 points×1=2; at0:1 point×2=2 | Boundary and branch counts agree | =; [r2] |
| L5 degree degenerate domain | Empty→empty; n=0 constant | ConnectedSpace excludes empty; constant not surjective onto a surface, local exponent0 forbidden | No vacuous positive-degree witness | =; [r2] |
| L5 Riemann–Hurwitz | Sphere powers n=1,2,3 | `χX=2`; `2n−2(n−1)=2` in each case | Correct ramification subtraction | =; [r2] |
| L5 boundary Riemann–Hurwitz | Disc powers n=1,2,3 | `χX=1`; `n−(n−1)=1` | Correct with unramified boundary | =; [r2] |
| L5 unramified RH | S→P orientation cover | `2=2·1−0` | Nonorientable base covered | =; [r2] |
| L5 marked Belyi comparison | z² branch/regular fibres | Raw sizes1/2, weighted sizes2/2 | Mathematical adapter must preserve weights; supplier excluded | R02; [r2] |
| L5 orientable graph genus | K₄,K₅,K₃,₃ | Minimum genera `0,1,1` | Planar/nonplanar controls discriminate | =; [r2] |
| L5 nonorientable graph genus | K₁,empty | Positive-genus-only minimum1; sphere-inclusive convention0 | Definition not determined | R05; [r2] |
| L6 shared elementary moves | Subdivide edge; split face | Δχ=`1−1=0`; `−1+1=0` | Same moves as earlier owner | =; [r2] |
| L6 normal-form existence | Sphere,torus,P,K | Words sphere digon,commutator,`aa`,`aabb`; χ=`2,0,1,0` | Imported word calculus, new topology | =; [r2] |
| L6 sphere normal form | `aa⁻¹` | Two vertices, one edge, one face: `2−1+1=2` | Reject one-vertex source slip | Source issue below; [r2] |
| L6 boundary normal forms | Unpaired `abc`; `abac` with a paired | D χ1,b1; B χ0,b1 | Orientability T/F distinguishes | =; [r2] |
| L7 cell orientations | Directed edge; reversed edge | Boundary `v−u`; reversal `u−v=−(v−u)` | Correct sign | =; [r2] |
| L7 chain groups | Triangle D; empty | Ranks `(3,3,1)`; `(0,0,0)` | Native free modules, not arbitrary chain placeholders | =; [r2] |
| L7 boundary squared | Oriented triangle (0,1,2) | ∂₂=`e12−e02+e01`; ∂₁∂₂=`(v2−v1)−(v2−v0)+(v1−v0)=0` | Sign computation works | =; [r2] |
| L7 orientation independence | Reverse one edge basis | ∂ column/row signs conjugated by diagonal−1; homology unchanged | Actual chain equivalence required | =; [r2] |
| L7 Euler–Poincaré | T over field; P over ℚ/𝔽₂ | T:`1−2+1=0`; P:`1−0+0=1` or `1−1+1=1` | Coefficients handled correctly | =; [r2] |
| L7 H₀ | Empty,D,D⊔D | Groups `0,ℤ,ℤ²`; ranks0,1,2 | Matches components including empty | =; [r2] |
| L7 connected iff H₀ rank one | D versus empty/two discs | Rank1/T; rank0/F; rank2/F | Both directions on controls | =; [r2] |
| L7 top integral homology | T,P,K | H₂=`ℤ,0,0`; P over𝔽₂ instead has H₂=𝔽₂ | Integral coefficient qualification necessary | =; [r2] |
| L7 edge-path group | Tree; rose with2 loops | Groups `1,F₂`; no face relations for rose | Nonabelian control retained | =; [r2] |
| L7 spanning-tree presentation | Triangle graph; filled triangle | Graph gives generator a; filled face imposes a=1 | Attaching relation changes group | =; [r2] |
| L7 H₁ abelianization | Rose2; P | `F₂ab=ℤ²`; `C₂ab=C₂` | Not identity on arbitrary nonabelian group | =; [r2] |
| L7 graph rank | Tree3 vertices; parallel2-edge graph; rose2 | `E−V+1=2−3+1=0;2−2+1=1;2−1+1=2` | Correct connected formula | =; [r2] |
| L7 isomorphism chain map | Edge reversal | Sends e↦−e, boundary changes sign compatibly | Orientation data necessary | =; [r2] |
| L7 edge subdivision chain map | Edge02 split at1 | e02↦e01+e12; boundaries `v2−v0` on both sides | Correct | =; [r2] |
| L7 face subdivision chain map | Square split into two triangles | Internal diagonal appears +1 and−1, sum0 | Correct boundary cancellation | =; [r2] |
| L7 flip invariance | Two diagonals in square D | Both complexes χ1, H₀=ℤ,H₁=H₂=0 | Homology agrees | =; [r2] |
| L7 simplicial map on chains | Collapse triangle vertices0,1 together | Repeated-vertex oriented 2-simplex maps to0, not a generator | Native degeneracies respected | =; [r2] |
| L7 contiguity prism | Vertex v with distinct images f(v),g(v) | P₀(v)=[f(v),g(v)]; ∂P₀=g(v)−f(v) | Direction/sign pinned | =; [r2] |
| L7 subdivision equivalence | Triangle D | Chain ranks change `(3,3,1)→(7,12,6)`, homology stays `(ℤ,0,0)` | Not literal chain-group equality | =; [r2] |
| L7 flag-chain comparison | P | Cellular ∂₂=2,∂₁=0; H₁=ℤ/2 on both models | Detects lost multiplicity | =; [r2] |
| L7 cellular-chain comparison | T | Cellular ∂₁=∂₂=0; H₁=ℤ², matching triangulation | Existing generic theory consumed | =; [r2] |
| L7 map identity/composition | Torus A,B | Identity→I₂; composite a-after-b→AB=`[[0,1],[-1,1]]` | Composition order consistent | =; [r2] |
| L7 isotopy invariance | Torus identity and isotopic translation | Both induced H₁ matrices I₂ | Needs explicit isotopy-to-contiguity bridge | R09; [r2] |
| L7 homeomorphism induces isomorphism | Torus twist A | det A=1; A⁻¹=`[[1,-1],[0,1]]` | Correct | =; [r2] |
| L7 orientable H₁ formulas | O(0,0),O(1,0),O(0,1),O(0,3) | Ranks `0,2,0,2`; formulas `2g` or `2g+b−1` give same | Boundary branch prevents negative rank | =; [r2] |
| L7 nonorientable H₁ formulas | N(1,0),N(2,0),N(1,1) | Groups `C₂,ℤ⊕C₂,ℤ`; formulas agree | k>0 and b=0/b>0 separated | =; [r2] |
| L7 remaining degrees/coefficient extremes | Dimension3; zero coefficient ring | H₃=0; all zero-ring chain groups and homology0 | No field-rank claim over zero ring | =; [r2] |
| L8 standard-surface carrier | O(0,0),O(0,1),N(1,0),N(0,0) | S,D,P; N(0,0) not admitted | Positive crosscap count fixes duplicate sphere | =; [r2] |
| L8 standard Euler formulas | S,T,D,A,P,K,B | `2,0,1,0,1,0,0` from `2−2g−b` / `2−k−b` | All agree with cells | =; [r2] |
| L8 classification existence | P; T⊔D; empty | Models `N(1,0)`; family `[O(1,0),O(0,1)]`; empty family | No orientable-only shortcut | =; [r2] |
| L8 classification uniqueness | T versus K; T versus A; T versus genus2 | χ equal0 first two; orientation or b separates; genus2 χ=−2 | All invariants needed | =; [r2] |
| L8 homeomorphism iff invariants | Relabelled T; T versus K | Same `(0,0,T)` gives model T; `(0,0,T)≠(0,0,F)` excludes K | Both directions on controls | =; [r2] |
| L8 Dyck relation | T#P | χ=`0+1−2=−1=χN(3,0)`; nonorientable,closed | Correct | =; [r2] |
| L9 essential curve | Annulus core; torus meridian | Neither bounds disc; annulus core is boundary-parallel, meridian is not | Missing peripheral convention | R05; [r2] |
| L9 separating curve | Equator on S; meridian on T | Complement components `2;1` | Correct distinction | =; [r2] |
| L9 two-sided curve | T meridian; P core | Neighbourhoods A,B; boundary counts `2;1` | Correct one-/two-sided distinction | =; [r2] |
| L9 cut two-sided circle | S equator; T meridian | D⊔D χ2,b2; A χ0,b2; χ unchanged | Connectedness not preserved in general | =; [r2] |
| L9 cut one-sided circle | P core | D χ1,b1, matching P χ1,b0 plus1 boundary | Correct | =; [r2] |
| L9 cut proper arc | A joining boundary components; pants joining two | Outputs D,A; `(χ,b): (0,2)→(1,1);(-1,3)→(0,2)` | χ rises1; b falls1 | =; [r2] |
| L9 full mapping-class group | S,T | Groups C₂,GL₂(ℤ); reflection has determinant−1 | Orientation reversal retained | R09 individual APIs; [r2] |
| L9 orientation-preserving mapping-class group | S,T | Groups1,SL₂(ℤ); A has determinant1 | Correct difference from full group | R09; [r2] |
| L9 boundary-relative mapping-class group | D,A | Groups1,ℤ; one annulus twist corresponds to1≠0 | Boundary fixation essential | R09; [r2] |
| L9 PL/smooth comparison | D rel boundary; A rel boundary | Quotients1 andℤ in both categories | Supplier comparison read; source smooth proof not certified | =; [r2] |
| L9 positive Dehn twist definition | Collar orientation dθ∧dt | `(θ,t)→(θ+t,t)` shifts transverse endpoint by+1 | Convention fixed | =; [r2] |
| L9 torus twist action | Positive a,b with a·b=1 | Tₐ(b)=b+a; T_b(a)=a−b; matrices A,B above | Signs consistent | =; [r2] |
| L9 conjugation | Orientation-preserving exchange a↦b | F=`[[0,-1],[1,0]]`; FAF⁻¹=B | Consistent | =; [r2] |
| L9 change of coordinates | Torus a,b; separating/nonseparating genus2 curves | Torus exchange F has det1; cut component counts2 versus1 prohibit second exchange | Necessary topological type retained | =; [r2] |
| L9 intersection reduction | Annulus transverse arcs, winding4 | Intersections3; twists−2,−3,−4 give1,0,0 | Corrected minimum floor | Same; arc source unverified; [r2] |
| L9 winding formula | Winding0,1,2,3,4 | `max(|n|−1,0)=0,0,1,2,3` | Negative powers needed for reduction | =; [r2] |
| L9 braid relation | Torus A,B | `ABA=BAB=[[0,1],[-1,0]]` | Noncommuting matrices tested | =; [r2] |
| L9 finite twist generation | Closed genera1,2,3; D; A | Claimed counts `3g−1=2,5,8`; D needs0, A generator1 | Counts/exceptional models consistent | Source proof unverified; [r2] |
| L10 rotation face count | Empty; K₁; two disjoint triangles | Faces `0;1;4`, components `0;1;2` | Isolated vertices explicitly contribute1 | =; [r2] |
| L10 componentwise rotation Euler | Empty; K₁; two triangles | `V−E+F=0;1−0+1=2;6−6+4=4=2c` | Correct | =; [r2] |
| L10 planar rotation predicate | Torus K₅ plus spherical C₃ | χtotal=`0+2=2`, but `2c=4` | Nonplanar component cannot hide in sum | =; [r2] |
| L10 graph planarity definition | Empty,K₄,K₅ | Plane rotation exists T,T,F | Genus-zero convention agrees | =; [r2] |
| L10 simple graph specialization | K₄; loop graph | K₄ transports4 vertices6 edges; loop graph outside SimpleGraph | No silent loss of loops | =; [r2] |
| L10 planarity-drawing equivalence | Empty,K₄,K₅ | Noncrossing sphere drawings T,T,F, matching predicate | Both directions on controls | =; [r2] |
| L10 connected planar Euler | K₁; K₄ | `1−0+1=2`; `4−6+4=2` | Isolated connected case works | =; [r2] |
| L10 edge bound | K₃,K₄; 4 parallel edges on2 vertices | `3=3·3−6`; `6=3·4−6`; multigraph4>0 | Simplicity and V≥3 needed, retained | =; [r2] |
| L10 low-degree vertex | K₁; octahedral graph; empty | Minimum degrees0,4; empty has no vertex | Nonempty hypothesis required and retained | =; [r2] |
| L10 K₅ obstruction | K₅ | E=10 while planar bound9 | Nonplanar | =; [r2] |
| L10 K₃,₃ obstruction | K₃,₃ | E=9 while bipartite planar bound `2·6−4=8` | Nonplanar | =; [r2] |
| L10 minor direction | Contract edge of K₃; K₁ versus K₃ | K₃ contracts to K₂; K₁ cannot contain K₃ minor | Smaller object is the minor | =; [r2] |
| L10 topological minor | Subdivide one K₄ edge | Vertices4→5,edges6→7, suppress degree2 recovers K₄ | Distinguishes subdivision from arbitrary contraction | =; [r2] |
| L10 wheel/contraction step | K₅; wheel K₄ | K₅ contracts to K₄; K₄ is wheel W₃ and exception | Guard excludes shrinking K₄ below3-connectivity | Locator missing, R10; [r2] |
| L10 Kuratowski | K₄,K₅,K₃,₃ | Forbidden subdivision exists F,T,T; planar T,F,F | Correct opposite truth values | =; [r2] |
| L10 Wagner | K₄,K₅,K₃,₃ | Forbidden minor exists F,T,T; planar T,F,F | Correct opposite truth values | =; [r2] |
| L10 minor closure | K₄→K₃→K₂ | Planarity T→T→T; edge counts6→3→1 | Correct direction | =; [r2] |
| L10 peripheral cycles | K₄ triangle; K₄ 4-cycle | Triangle induced, deletion leaves one connected vertex; 4-cycle has2 chords | Only triangle is peripheral/facial | =; [r2] |
| L10 Whitney embedding uniqueness | K₄ | Two oriented rotation systems related by reflection, one unoriented sphere embedding class | 3-connectivity and orientation convention matter | =; [r2] |
| L10 2-isomorphism | K₂ versus K₂⊔isolated vertex | Cycle matroids each one coloop; graphs have2/3 vertices | Isolated-vertex exclusion necessary; move equivalence undefined | R05; [r2] |
| L10 binary cycle space | Empty; one loop; K₂; parallel2; theta | Dimensions `0;1;0;1;2` from E+c−V | Handles loops and multiple edges | =; [r2] |
| L10 binary cut/cycle orthogonality | Triangle; loop | Triangle cut (1,1,0)·cycle(1,1,1)=0 mod2; loop cut coordinate0 | Correct coefficient/sign convention | =; [r2] |
| L10 2-basis | Triangle; theta; K₅ | Triangle edge frequencies1; theta choose two cycles, frequencies≤2; K₅ has no 2-basis | Planar/nonplanar controls | =; [r2] |
| L10 Mac Lane equivalence | Empty,theta,K₅ | 2-basis exists T,T,F; planar T,T,F | Both directions on controls | =; [r2] |
| L10 Fáry | Empty,K₁,triangle,K₄ | Straight edge counts0,0,3,6; K₄ at outer (0,0),(3,0),(0,3),inner(1,1) has0 crossings | Full signature statable | R04; [r2] |
| L10 Tutte convex embedding | K₄ with outer triangle | Inner point is average `(1,1)`; all3 bounded faces are convex triangles | Proof notes specify convex outer face; theorem locator missing | R10; [r2] |
| L10 planar dual cycle/cut | Triangle and its three-parallel-edge dual | Primal cut space is even parity, dimension2; dual cycle space is the same even-parity subspace | Actual subspaces agree under edge identification | =; [r2] |
| L10 five-colour headline | Empty,K₁,K₃,K₄ | Chromatic numbers `0,1,3,4≤5` | Finite/disconnected signature has correct scope | =; [r2] |

## Not verifiable

Carried from [r2], without reopening unchanged source requests: eleven cited works were not readable in full through the legal sources service. The locations tried below are the previous review’s attempts.

- `damiand_lienhardt`: Taylor–Francis DOI landing page only; §§2.4, 4.3–4.5 and Definition 91 were not source-certified.
- `dehlinger_dufourd`, `lando_zvonkin`, `moise`: service returned paywalled/uncertified publisher records. Their generalized-map, dessin and PL/smooth locators remain uncertified; no new missing-text request was created for them.
- `mohar_thomassen`: JHU publisher request returned HTTP 403; embedding and planarity chapter locators unread.
- `thomassen1981`: Wiley returned HTTP 403; Kuratowski proof unread.
- `lickorish1962`: JSTOR landing page only; an institutional IISER Pune copy failed certificate validation. Lemma 2, its claimed arc extension and Theorem 1 unread.
- `lickorish1964`, `lickorish1966`: Cambridge landing pages only; generator proof and corrigendum unread.
- `farb_margalit`: publisher landing page only; author's Chicago PDF URL returned 404. Curve/twist source locators unread.
- `munkres_topology`: bibliographic lookup found no readable legal text; Chapter 12 unread.

The previous review recorded eight unresolved works in its reference request; the three uncertified records are settled. This zero-line re-review makes no new missing-text request. Unread sources are verification limits, not evidence that their theorems are false.

## Source issues

The unchanged source issue below is carried from [r2]; no new source issue was found in this incremental review.

- **Misprint** in gallier_xu at §6.1, printed p. 82 (gallier_xu line 3141): the source says the sphere word has one inner vertex; it should be two vertex classes for the two oppositely traversed sides; affects nothing.

[r2]: PRREVIEW-SurfaceTopology~2.md "Previous SurfaceTopology review at 9bd6e07, Verified sound and adversarial computations"
