# Review of SurfaceTopology (pull request #271 at 9bd6e07)

**Verdict:** needs changes

## R01 (P1) — The proposed cellular counterexample is not cellular

**Location:** `TauCetiRoadmap/SurfaceTopology/README.md:799`. Quote: “`C₃` in a disc with one side along the boundary circle is cellular with two faces”.

**Claim:** This example contradicts the roadmap's own definition of cellularity, and does not witness the asserted necessity of the closedness hypothesis.

**Witness:** A boundary point outside the triangle has a half-disc neighbourhood in its complementary component. That component is not an open disc. `Suggested.lean:239` requires every complementary component to be homeomorphic to an open disc.

**Repair:** Delete this purported cellular counterexample. Explain that, for these compact embedded finite graphs, cellularity already forces the boundary into the support: a remaining boundary point would give the same half-disc obstruction. The boundary-supported formula can be the general statement and the closed formula its corollary. Test the actual examples: the partially boundary-supported triangle is **not** cellular, with raw counts `3−3+2=2≠1`; the whole boundary triangle is cellular, with `3−3+1=1`. Do not change cellularity to admit half-disc faces while keeping the same Euler formula.

## R02 (P1) — The marked-cover comparison cites an excluded supplier target

**Location:** `TauCetiRoadmap/SurfaceTopology/README.md:900`. Quote: “BelyiMaps §7.7 owns the specialized `TopBranchedCover n`”.

**Claim:** The mandatory comparison consumes a carrier that the cited roadmap expressly assigns elsewhere. There is no declared gap for it. This is supplier drift, independently of the passing graph scanner.

**Witness:** On main, `TauCetiRoadmap/BelyiMaps/README.md:2355` assigns all Layer 7 to `BelyiAnalyticCovers`; the same exclusion is at the reviewed head's line 2366. Section 7.7 is retained as a dependency specification.

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

**Repair:** Delete it; sources are the README's references. Preserve its bibliographic keys, editions and useful locators there, and remove the dangling file reference. This follows this job's explicit repair for `stray-files`, notwithstanding its general manifest guidance and the earlier review's request to add a manifest. This review changed neither file.

## R09 (P3) — Remove the edit outside the authorized roadmap folders

**Location:** `Completed/ConformalMapping/README.md:163`. Quote: “Elementary proof comparison”.

**Claim:** The PR changes a fifth folder not authorized by this review brief.

**Witness:** The specified exclusion-filtered `git diff --stat origin/main...HEAD` returns exactly this file, with seven insertions. The gate independently reports `outside-folder=1` for it.

**Repair:** Revert these seven lines from this PR; any change to that completed roadmap needs its own authorized scope. The four named sibling folders are not findings. No mathematics in SurfaceTopology requires this extra edit to state its suppliers.

## R10 (P3) — Supply per-definition APIs, Checks and target dependencies

**Location:** `TauCetiRoadmap/SurfaceTopology/README.md:225`, `:286`, `:370`, `:1440`. Quote: “Representative formal statements”.

**Claim:** The previous shape finding remains. The document still uses layer-wide signature catalogues and lists of intermediate results; it has no `*Needs:*` lines and no per-definition API/three-Check structure. The required Summary, Scope and ownership, Conventions, and How to read the build headings are absent in their prescribed form.

**Witness:** `GMap2.boundary`, `GMap2.EdgeOrientation`, `RotationSystem`, and the three mapping-class groups lack their individual API lists and three discriminating Checks. There are no numbered topic subsections or closing `### Examples`/`### Dependencies` sections.

**Repair:** Reorganize the retained mathematics into the required prose shape, without reducing scope. Add exact per-target inputs, including the isotopy-to-contiguity bridge used at line 1091, and replace instructions to exhibit examples by actual examples. Restrict the polygon-disc table at line 364 to `n≥1`: `n=0` has no darts, hence actual `(V,E,F,χ)=(0,0,0,0)`, not `(0,0,1,1)`. Keep the corrected twist computations. Remove draft/PR references, including Lean line 210; add declaration docstrings and matching layer headings.

## R11 (P3) — Attach exact source locators to the remaining targets

**Location:** `TauCetiRoadmap/SurfaceTopology/README.md:1377`, `:1503`, `:1552`, `:1567`, `:1630`. Quote: “Lickorish's Lemma 2, for curves and for proper arcs”.

**Claim:** Corrected Gallier–Xu locators do not resolve the global locator deficit. Many claims and proof inputs still have only a book, chapter, or paper title, with no theorem/section and printed page at the claim. The proper-arc extension is attributed as though it were the cited lemma without a verified locator for that generality.

**Witness:** Fáry, Tutte's spring embedding and the wheel theorem have no claim-level locators. The Lickorish entry supplies no printed page for the arc statement. GraphConnectivityAndFlows defines component count in Target 1.1, line 253, not Milestone 2.

**Repair:** Give exact locators and hypotheses for each theorem and source-proof step. Label an extension as a local target and provide its route if the source only states the closed-curve version. Correct component-count citations to Target 1.1. Preserve the repaired Gallier–Xu references: Definition 6.5, pp.88–91; Lemma 6.1, pp.92–95; Theorems 6.1–6.2, pp.96–97. Unavailable source text is a verification limit, not a reason to invent a theorem number.

## R12 (P3) — Remove acceptance-file padding and unused catalogue definitions

**Location:** `TauCetiRoadmap/SurfaceTopology/Suggested.lean:71`, `:75`, `:85`, `:149`, `:156`, `:235`, `:285`. Quote: “The correction term in Riemann–Hurwitz is an actual finite sum”.

**Claim:** The finite-preimage declaration is a direct library specialization, and several retained definitions are not needed by any retained headline. The file is smaller but still contains catalogue material.

**Witness:** `IsBranchedCover.finite_preimage_branch` closes with `exact B.finite_toSet.preimage' (fun y _ => hp.finite_fibers y)`, tested at the pin. `Set.Finite.preimage'` is in `Mathlib/Data/Set/Finite/Lattice.lean:213`.

**Repair:** Delete it from `Suggested.lean`; the README keeps the statement and cites that lemma. Also remove definitions used by no retained headline: component and cell-count APIs, map isomorphisms, boundary-dart/closed-map predicates, orientation structures, `BundledGMap2`, and cellular support predicates. Keep only the simple definitions needed by realization, drawing and degree headlines, plus any genuinely nontrivial small tests of those definitions. Remove the unused `TauCeti.Topology.Triangulable` import. Do not prove padding in place. The finite-preimage check remains `0` points for an empty marking and `2` points for the two branch points of `z↦z²` on the sphere.

## Verified sound

The full README and Lean file were reviewed under root `README.md` and `CONTRIBUTING.md` (parent copies absent), with three main-branch shape examples. No worktree file or pin changed.

**Previous findings, rechecked first.** No readable repair report marked a finding “not actionable in this package”.

| Previous | Status and present passage |
|---|---|
| R01 admitted constructors | **Partly repaired.** Lean 179: “`Quotient G.gluingSetoid`” is real data; the sphere/torus admitted-model collapse is gone. One admitted proposition instance remains, new R06. |
| R02 annulus intersections | **Repaired.** README 1434: “both `T⁻³` and `T⁻⁴` achieve zero”; computed counts are `3→0` in each case, and `T⁻²` gives `1`. |
| R03 dependency gate | **Repaired.** Supplier and consumer descriptions are distinguished; the required check now reports `0 problem(s)`. This does not certify R02's excluded supplier contract. |
| R04 polygonal/graph ownership | **Repaired for the identified objects.** README 929: “topological interpretation of the polygon calculus”; §§2.1–2.2a and §§6.0a–6.0d resolve on main. The new work is the generalized-map adapter and its topological comparison. |
| R05 generic chains | **Repaired in ownership.** README 1009: “Consume the ordered-simplex complex”; line 1143 separates the cellular comparison. GeometricTopology Layer 11 and AlgebraicTopology Stage 4 resolve on main. Exact local dependency lists still need R10. |
| R06 five-colouring | **Repaired.** Lean 246 declares `colorable_five_of_noncrossing_drawing`; its finite, possibly disconnected graph hypotheses are retained. Fáry is the separate omission R04. |
| R07 unspecified interfaces | **Partly repaired.** README 243 adds isomorphisms as steps; 618 defines contractible edges; 858 specifies switches; 815–844 constrain local powers and degree; 1045–1050 state the H₀/H₂ claims. R05 lists remaining undetermined objects. |
| R08 capping | **Repaired.** README 632: “Capping is defined on `IsSurfaceGMap` inputs”; 638–646 give the quotient realization and boundary correspondence. The former two-dart counterexample is now excluded. |
| R09 examples/catalogue | **Partly repaired.** No admitted examples remain; the three finite examples have proofs. Unused catalogue definitions and a direct library specialization remain, R12. |
| R10 empty Lean sections | **Repaired.** The four present section comments contain actual declarations. Their headings should acquire the README layer numbers in the general shape cleanup. |
| R11 process references | **Partly repaired.** The worker's `prnum` scanner passes; Lean 210 still says “Mathlib's draft” and contains a PR number. README 678/876 retain open/draft narrative. Use timeless interface descriptions, under R10. |
| R12 shape/Checks/conventions | **Partly repaired.** README 1260–1279 now pins annulus orientation, column matrices, and inverse twist; the required per-definition shape and `n≥1` restriction are still missing, R10. |
| R13 locators | **Partly repaired.** README 1637 correctly distinguishes “Lemma 6.1” from “Theorems 6.1–6.2” and dates the author version. Remaining locators are R11. The added manifest conflicts with this job's explicit gate, R08. |
| R14 pinned inventory | **Repaired.** README 118 cites native cuts; 121–124 names the nonsingular-square Smith theorem including negative determinants. The `[-1]` instance is covered, with positive diagonal `[1]`. |

**Gate.** Failures: `sorry-data=1`, `readme-ids-missing=8`, `stray-files=1`, `outside-folder=1`, `build=1`; all reported above. Other scanners pass. Both Lean commands exit 0; the build warning remains (R03). Dependency-check output:

```text
depcheck: 205 roadmaps, 1506 edges, 0 problem(s)
```

**Signatures/probes.** All **35 named signatures** were printed with `#check @name` and compared with the README and supplied record. No binder was lost: realization retains compactness/Hausdorffness; degree retains both spaces’ compactness/Hausdorffness/connectedness. `ConnectedSpace` excludes empty targets. The six admitted propositions resisted `simp`, `rfl`, and `infer_instance`. Fáry and the Hausdorff-instance repair elaborate; the finite-preimage library-lemma probe succeeds (R04/R06/R12).

**Pinned declarations opened (15 entries).** Paths are relative to the named library at the manifest pin.

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

**Ownership.** Object searches covered pins, main, supplied open checkouts, roadmap index and board packages; no conflicting fully qualified name was found. Adapters extend existing polygon theory; R02 remains. Open PRs without supplied files were not checked.

| Supplier/consumer resolved | Exact passage and comparison |
|---|---|
| GraphConnectivityAndFlows, main | Target 1.1, lines 224–257: walks, isomorphisms, components, simple-graph transport. Target 1.2, line 268: cuts. Target 1.5, line 331: deletion/connectivity. A loop is one flow arrow but two surface darts. |
| FreeGroupsAndLimitGroups, main | §§2.1–2.1a, lines 326/368: signed darts and adapter; §2.2, 385: graph path groups; §2.2a, 409: binary/integral kernels; §§6.0a–6.0d, 1384/1403/1419/1436: polygonal carriers, normal forms, face presentations, cuts. |
| GeometricTopology, main | Layer 11, lines 849–879: realization, maps, CW structure, ordered boundary. The surface matrix comparison is distinct from this generic owner. Its separate revision is not substituted for the main supplier. |
| AlgebraicTopology, main | Stage 4, lines 499–528: native cellular chains, naturality and chain-homotopy comparison. The new matrix-to-flag comparison belongs here; singular comparison remains there. |
| PlanarTopology, supplied head | Layers 0/2: carriers, boundary invariance and count; Layer 3: finite complexes, PL maps and common subdivisions; Layer 5, lines 812–874: Radó, isotopy-to-PL, Hauptvermutung/Pachner; Layer 6, 899–1007: Euler/orientations and cover; Layer 7, 1013–1092: tame arcs/families and collars; Layer 8, 1151–1250: PL/smooth/relative isotopy. These passages were resolved afresh. |
| BelyiMaps, main and supplied head | Finite triples/ribbon graphs agree with the pin; the specialized marked-cover citation is the excluded Layer 7 contract, R02. The degree-one Walsh example needs four generalized-map darts, not two. |
| TeichmullerGeometry, supplied open head | Scope lines 12/25 and supplier contract line 65 explicitly consume SurfaceTopology's generic mapping classes and standard surfaces; its diffeomorphism-path-component comparison is distinct. |

**Headlines.** README: realization/presentation; Heffter–Edmonds–Ringel; topological normal forms; compact-surface classification; curves/mapping classes and Dehn–Lickorish; planarity; finite homology; Riemann–Hurwitz. Lean states realization charts/presentation, five-colouring and intrinsic/constant branched-cover degree. Its docstring identifies missing normal-form, classification, rotation, chain, mapping-class and Euler carriers, but Fáry is statable and absent (R04).

**Source sample.** All repeated sampled headings were inspected; none flags an unverified locator. Of 14 works attempted, Gallier–Xu (2025), Epstein and Gonthier were readable. The 2012 Gallier chapter-one extract was not used for Chapter 6.

| Sample family | Verification and limits |
|---|---|
| Representative formal statements | Native predicate/quotient signatures checked against the pin. Gallier–Xu Chapter 6 supports the polygon and classification statements: `gallier_xu` lines 3065, 3219, 3305, 3432, 3564, 3719, 3750. Other theorem locators have the limits below. |
| Proof strategy and formalization notes | Recomputed orbit-cell, quotient, normal-form, chain-sign, twist and Euler-count routes. Gallier–Xu's proof uses homology for invariance, whereas this roadmap explicitly supplies independent PlanarTopology invariants; this is an owned alternative route. Lickorish's arc extension is not certified from unread text. |
| The comparison theorems | Source generality distinguished from adapter targets. The native ribbon-graph product is `(rotW*rotB)⁻¹`; the Walsh degree-one case gives `V−E+F=2`. Damiand–Lienhardt/Lando–Zvonkin locators remain unread. |
| Consequences | Checked the claimed outputs against layers and consumers; downstream mentions do not supply missing inputs. Belyi's marked-cover contract fails R02. |
| From GraphConnectivityAndFlows | Read Target 1.1, Target 1.2 and Target 1.5 on main, including empty graphs and loops. Component count's exact owner is Target 1.1. |
| From PlanarTopology | Read the actual relative/closed hypotheses, fixed triangulation in graph tameness, and orientation-cover construction. The convention is surface-on-left boundary orientation. |
| Twist, intersection and matrix conventions | Directly computed `A`, `B`, inverses, `ABA=BAB`, winding, and intersection counts; see table. Farb–Margalit source text unavailable. |
| Natural intermediate results | Compared every listed item to preceding targets and owners; remaining unnamed predicates/API gaps are R05/R10. No algorithmic implementation is part of the mathematical deliverable. |

Gallier–Xu Definition 6.5 and Lemma 6.1 have the cited printed pages 88–95; Theorems 6.1–6.2 are pp.96–97. Connectedness is part of that book's surface setting and remains explicit here. Its empty sphere word is deliberately replaced by the shared sphere digon. Epstein Theorem 6.3 starts at `epstein1966` line 533 (p.99); Theorem 6.4 at line 604 (p.101), with its exceptional orientation assumptions. The relative proof uses fixed boundary arcs at lines 576–593. This supports the topological/PL route, not the smooth strengthening, which is a separate PlanarTopology contract. Gonthier Definition 1 and the componentwise Euler formula occur at `gonthier2008` lines 397 and 431 (pp.1385–1386); they support encoding background, not a source for every Layer 10 theorem.

**Adversarial computations.** Finite checks are not proofs. `S,D,T,P,K,A,B`: sphere, disc, torus, projective plane, Klein bottle, annulus, Möbius band. `O(g,b)`, `N(k,b)`: orientable/nonorientable models; `F_r`: rank-r free group; `𝔽₂`: field. In the change column, “=” means no additional finding, not source certification.

| Statement / definition | Instances tried | Computed values on the two sides | Result | Change |
|---|---|---|---|---|
| L0 bundled finite maps | Empty darts; Boolean darts | Dart cardinalities `0;2`, retained by the bundle | Consistent | Remove unused Lean bundle, R12 |
| L0 isomorphism closure | Relabel a triangle; sphere versus torus | Relabelled adjacency conjugates identically; `(χ_S,χ_T)=(2,0)` | Separates relabelling from topology | = |
| L0 one move | Edge subdivision | `(V,E,F)=(3,3,1)→(4,4,1)`; both χ=1 | Consistent | = |
| L0 move sequence | Zero moves; move then inverse | Endpoints `G,G`; net `(ΔV,ΔE,ΔF)=(0,0,0)` | Consistent | = |
| L0 congruence | Relabel, subdivide, inverse relabel | Both routes add `(1,1,0)` and retain χ | Consistent | = |
| L0 word relation versus map relation | `abab=baba`; `aabb` | First pair cyclically identical; `abab` has χ=1, `aabb` χ=0 | Correct distinction | = |
| L0 isomorphism not homeomorphism | Triangle and subdivided square discs | Dart sizes `6≠8`, realizations both D with χ=1 | Negative control works | = |
| L1 GMap involutions/commutation | Empty; all-swap; noncommuting swaps `(01),(12)` in positions 0,2 | Empty laws vacuous; swap²=id; `(01)(12)≠(12)(01)` | Wrong permutation data excluded | = |
| L1 cell orbits | Empty; all-swap; P | `(V,E,F)=(0,0,0);(1,1,1);(1,1,1)` | Distinct realization data can have equal orbit counts | = |
| L1 cell finiteness | Empty; four-dart P | Each quotient size `0`; each size `1≤4` | Native finite-quotient instance applies | R12 |
| L1 components | Empty; D; D⊔D | Orbit counts `0;1;2` agree with topological components | Consistent | R12 |
| L1 map isomorphism | P with permuted darts; P versus T | First adjacency squares commute; second has cell vectors `(1,1,1)≠(1,2,1)` | Consistent | R12 |
| L1 orbit Euler count | S,T,P,K,empty | `4−6+4=2;1−2+1=0;1−1+1=1;1−2+1=0;0` | Matches χ under surface hypothesis | = |
| L1 boundary dart | Triangle disc; P | α₂ fixes `6;0` darts | Distinguishes boundary from closed model | = |
| L1 edge orientation | P loop; allSwap edge | ⟨α₂⟩-orbit counts2;1 | Two-choice assertion needs surface hypothesis | R05 |
| L1 face orientation | Triangle face; one all-fixed dart | ⟨α₀α₁⟩-orbit counts2;1 | Two-choice assertion needs surface hypothesis | R05 |
| L1 surface condition | P; all-swap; empty | P: `(noFix₀,noFix₁,noFold)=(T,T,T)`; all-swap `(T,T,F)`; empty all T | Correct folded-cell exclusion | = |
| L1 closed surface condition | P; triangle D; empty | `(surface,noFix₂)=(T,T);(T,F);(T,T)` | Empty closed surface allowed | = |
| L1 orientability predicate | T; P; empty | Bipartite colouring exists for T; P's three adjacencies make a triangle, impossible; empty colouring exists | Correct convention | = |
| L1 chosen orientation | Connected T; P; T⊔T; empty | Numbers of choices `2;0;4;1` | Distinguishes property from chosen data | = |
| L1 boundary map/count | D,A,B,S,empty | Boundary circles `1;2;1;0;0` | Discriminates A/B despite χ=0 | R10 APIs |
| L1 induced boundary orientation | Standard annulus | Outer circle counterclockwise, inner clockwise; their induced homology classes sum to 0 | Surface-on-left convention agrees | = |
| L1 genus from invariants | T,A,P,K | Orientable `(2−b−χ)/2=1,0`; nonorientable `2−b−χ=1,2` | Correct under connectedness/type hypotheses | Specify domains, R05 |
| L1 polygon-disc Check | n=0,1,2,3 | Actual vectors `n=0:(0,0,0)`; positive n:`(n,n,1)` | n=0 refutes unrestricted table | R10: n≥1 |
| L2 combinatorial map | One ribbon edge; rotation reversed | Two signed darts paired without fixed points; reverse rotation inverts each vertex cycle | Correct carrier distinctions | = |
| L2 combinatorial-to-generalized adapter | One embedded edge on S | Two ribbon darts become four generalized darts; `(V,E,F)=(2,1,1)` | χ=2 retained | = |
| L2 oriented generalized-to-ribbon adapter | Same edge; flipped orientation | Selects 2 of 4 darts; reversal replaces rotations by inverses | Correct dependence on orientation | = |
| L2 permutation triple convention | σ₀=(01),σ₁=(12), σ∞=(012) | `σ∞σ₁σ₀=id`; reversed order gives a nonidentity 3-cycle | Nonabelian direction pinned | = |
| L2 Walsh construction | Degree-one triple | `1→2→4` darts through bipartite ribbon/generalized adapters; `2−1+1=2` | Corrected factor of four | = |
| L2 clean dessin restriction | Degree-one triple; white 2-cycle | White degrees `1;2` | First is bipartite, not clean | No implicit clean hypothesis |
| L2 polygonal schema | Empty; one disc; two discs | Components `0;1;2`, χ=`0;1;2` | Family carrier includes disconnected cases | = |
| L2 schema-to-map | `aa`, commutator square | `(V,E,F)=(1,1,1);(1,2,1)` | Produces P/T and χ=1/0 | = |
| L2 map-to-schema | P with either dart labelling | Same paired two-side word up to relabelling/cyclic reversal | Quotient by listed word symmetries required | = |
| L2 complex-to-map flag comparison | One filled triangle K | Barycentric flag complex has `(7,12,6)` versus K `(3,3,1)`; both χ=1 | Comparison is subdivision, not equality | = |
| L2 map subdivision realization comparison | All-swap | Raw χ=1; subdivided flag χ=`3−3+2=2`; both realizations S | No false orbit-Euler preservation without surface hypothesis | = |
| L2 oriented adapter roundtrips | One-edge sphere | `4→2→4` generalized darts; chosen colouring recovered | Isomorphism with retained orientation | = |
| L2 dual twice | Torus one-face map | `(1,2,1)→(1,2,1)→(1,2,1)`; α₀↔α₂ twice=id | Correct | = |
| L2 schema roundtrip | P schema `aa` | Map counts `(1,1,1)`, recovered boundary word length 2 with same-side gluing | Needs word equivalence, not literal string equality | = |
| L2 triple Euler/connectivity | Two disjoint degree-one triples | Generalized counts `(4,2,2)`, χ=4, components=2 | Componentwise formula, not connected χ=2 | = |
| L3 chamber | Empty; one dart | `0` triangles; `1` closed standard triangle | Nonempty simplex does not make empty coproduct inhabited | = |
| L3 gluing step | Identity adjacency; swap | Interior points have no nontrivial partner; matching side points have `1` identified partner for swap | No whole-chamber collapse | = |
| L3 generated setoid | Two adjacent chambers | Reflexive points remain; swapped side pair equivalent both directions; unrelated interiors distinct | Correct quotient relation | = |
| L3 realization topology | Empty; one all-fixed dart | Empty space; closed triangular disc | Native quotient preserves intended objects | = |
| L3 compactness | 0 or finitely many chambers | Finite union of compact triangles, quotient compact; empty also compact | Existing instance is genuine | = |
| L3 Hausdorffness | Empty; all-swap; P | Empty Hausdorff; S and P have separated distinct points | True target; admitted instance forbidden | R06 |
| L3 surface charts | One all-fixed dart; all-swap; P | Realizations D,S,P; boundary components `1;0;0` | Surface hypothesis is not needed for existence of charts | = |
| L3 boundary identification | α₀=id, α₁=α₂=swap | α₂ fixed-point count=0 but realization has boundary | Necessity of no 0/1 boundary retained | = |
| L3 cell-Euler comparison | All-swap; P | All-swap raw1 versus topological2; P raw1=topological1 | Surface condition discriminates | = |
| L3 orientation comparison | All-swap; P | Bipartite T/F versus topologically orientable S/P T/F | Computed direction agrees | = |
| L3 sixfold subdivision | Empty; P; triangle D | Darts `0→0;4→24;6→36` | Correct sixfold count | = |
| L3 subdivision preserves surface condition | P; triangle D | Subdivided `(V,E,F)=(3,6,4);(7,12,6)` and no forbidden fixes/folds | Both remain surfaces | = |
| L3 subdivision preserves cell Euler | P; D | `1=3−6+4`; `1=7−12+6` | Verified with required hypotheses | = |
| L3 flag injectivity after subdivision | Enumeration of 570 maps, 0–4 darts | 570 distinct valid triples tested; 0 flag-injectivity failures | Finite check, not proof | = |
| L3 realization subdivision homeomorphism | P; D | Before/after χ=`1/1`, boundary=`0/0;1/1`, orientation=`F/F;T/T` | Necessary invariants agree | = |
| L3 finite-map presentation | Empty; S; P; D | Presentations have `0;24;4;6` darts respectively | Empty and nonorientable cases included | = |
| L3 flag-complex realization | Triangle disc after subdivision | Six triangles, seven vertices, χ=1; realization D | Raw incidence collapse avoided | = |
| L4 edge subdivision | Loop and nonloop edge | Both give `ΔV=1,ΔE=1,ΔF=0`, hence Δχ=0 | Includes loops with correct subdivision | = |
| L4 face subdivision | Disc polygon split by diagonal | `ΔV=0,ΔE=1,ΔF=1`, hence Δχ=0 | Correct | = |
| L4 eligible edge contraction | Triangle boundary edge | `(3,3,1)→(2,2,1)`; χ=1; quotient D | Eligible boundary contraction valid | = |
| L4 contraction quotient hypothesis | Interior diagonal joining boundary points in square | Quotient is two discs joined at a point, not a surface | Both-boundary-endpoint interior edge excluded | = |
| L4 duality | T; tetrahedral S | `(1,2,1)→(1,2,1)`; `(4,6,4)→(4,6,4)` | Closed-surface hypothesis retained | = |
| L4 connected sum | S#T; (S⊔T)#S; empty | Connected χ formula `2+0−2=0`; disconnected component choice unspecified; empty has no disc | Interface incomplete | R05 |
| L4 cutting carriers | T nonseparating core; P one-sided core | Cut outputs A,D with boundary counts2,1 | One-sided versus two-sided must be distinguished | = |
| L4 orientation-cover construction | P; T; B; empty | Cover spaces S,T⊔T,A,empty; sheet counts2,2,2,0 | Finite construction handles all cases | = |
| L4 orientation cover is orientable | P,K,B | Covers S,T,A all orientable=T; bases orientable=F | Correct | = |
| L4 orientation cover Euler | P,K,B | `χcover=2,0,0=2χbase` | Correct under surface hypothesis | = |
| L4 orientation-cover connectedness iff | Connected P versus T | Cover components `1;2`, nonorientability `T;F` | Both directions tested | = |
| L4 orientation-cover projection | P; B | Interior fibre cardinality2; each boundary point of B also fibre2 | Genuine unramified cover | = |
| L4 lifting boundary | B; A | Boundary counts `1→2;2→4` in orientation cover | Correct doubling | = |
| L4 cap construction | D,A,B,empty | Outputs S,S,P,empty | Different orientability retained | = |
| L4 cap Euler | D,A,B | `1+1=2;0+2=2;0+1=1` | χcap=χ+b | = |
| L4 cap orientability iff | A versus B | A/S both T; B/P both F | Both directions agree | = |
| L4 cap components | Empty; D⊔B | `0→0;2→2` | Does not connect separate components | = |
| L4 cap realization | D | Fill its sole boundary circle: `(χ,b)=(1,1)→(2,0)` | Correct topological comparison | R07 name only |
| L4 double | D,A,B | Doubles S,T,K; χ=`2,0,0=2χbase` | Correct | = |
| L4 double scope | α₀=swap, α₁=α₂=id | Raw χ=2, raw doubled χ=3≠4 | Non-surface input excluded by theorem hypothesis | = |
| L5 graph degree and loops | One loop; ordinary edge | Loop degree2 versus incident-edge count1; ordinary endpoints degree1 | Degree convention discriminates | = |
| L5 underlying graph | P; one-face T | One vertex with1 loop; one vertex with2 loops | No isolated vertices arise from dart orbits | = |
| L5 primitive link | Segment; circle; constant path | Segment injective; circle has only 0~1; constant path identifies 0~1/2 | Constant wrong model excluded | = |
| L5 drawing | Triangle; coincident vertices | Three distinct vertices admitted; coincident vertices violate embedding injectivity | Correct carrier | = |
| L5 noncrossing | Triangle; crossed quadrilateral | Distinct interiors intersection sizes0; one crossing yields1 | Predicate discriminates | = |
| L5 support | Empty graph; triangle | Empty support; three vertices plus three arcs=S¹ | Isolated vertices included | = |
| L5 PL drawing | Straight triangle; its ambiently bent image | First affine on3 edges; second becomes PL after suitable chart/triangulation | Relative triangulation matters | R10 exact APIs |
| L5 cellular drawing | Equator on S; contractible loop on T | Complement `D°⊔D°`; complement includes punctured T, H₁ rank2 | Second not cellular | = |
| L5 drawing equivalence | Relabelled triangle | Edge/vertex bijections sizes3/3 and same image; distinct literal labels | Must retain labelled equivalence data | = |
| L5 isotopic PL replacement | Three noncrossing arcs | Same three endpoints and pairwise interior intersections0 before/after | Supplier finite-family tame hypothesis resolved | = |
| L5 drawing-to-map | Triangle on S | `(V,E,F)=(3,3,2)`, χ=2 | Closed connected cellular case matches | = |
| L5 drawing-to-map excluded cases | Crossed C₄; K₁ | Crossing subdivision gives `(5,6,3)`, not `(4,4,?)`; K₁ has0 darts but1 graph vertex | Noncrossing/nonempty-edge guards necessary | = |
| L5 drawing roundtrip | Triangle on S | Graph vertices3, edges3 and faces2 retained | Incidence labels must be retained | = |
| L5 rotation system | Isolated vertex; valence-three vertex | Empty cyclic order unique; three darts have2 cyclic orders | Isolated vertices cannot be discarded | R10 |
| L5 signed rotation switching | One tree edge; one loop | Endpoint switch changes tree twist `1→0`; loop sign gets `ε+ε=0` | Loop twist distinguishes annulus/Möbius neighbourhood | = |
| L5 Heffter–Edmonds–Ringel | K₂ on S; isolated K₁ | K₂ rotation gives2 vertices1 edge1 face; K₁ requires explicit isolated component | General correspondence needs retained isolated-vertex data | = |
| L5 oriented versus unoriented correspondence | Tetrahedral K₄ | Spherical rotations occur as a mirrored pair; forgetting surface orientation identifies pair | Equivalence must state orientation convention | = |
| L5 closed Euler formula | Triangle on S | `3−3+2=2=χ(S)` | Correct | = |
| L5 boundary-supported Euler | Boundary triangle on D | `3−3+1=1=χ(D)` | Correct | = |
| L5 claimed closedness counterexample | Partially boundary-supported triangle in D | Raw `3−3+2=2≠χ(D)=1`; second component has boundary points | Not cellular | R01 |
| L5 power-map model | z,z²; constant map; boundary point | Exponents1,2; constant cannot satisfy positive-power identity; boundary excluded by interior chart | Data tied to actual map | = |
| L5 branched-cover predicate | Identity; z² on disc; identity with e=2 | First two local powers1/2 valid; identity local degree1≠2 | Arbitrary exponent assignment excluded | = |
| L5 finite branch preimage | Empty marking; sphere z² marked at0,∞ | Preimage sizes `0;2`; each fibre finite | Native finite-union theorem | R12 |
| L5 intrinsic local degree | z² with extra unramified marking | Degree at0 stays2; newly marked regular point degree1 | Marking does not alter exponent | = |
| L5 positive weighted degree | zⁿ, n=1,2,3 on sphere | Regular sums `1,2,3`; branch sums `1,2,3` from one point of weight n | Constant positive degree | = |
| L5 boundary weighted degree | z² on closed D | At boundary:2 points×1=2; at0:1 point×2=2 | Boundary and branch counts agree | = |
| L5 degree degenerate domain | Empty→empty; n=0 constant | ConnectedSpace excludes empty; constant not surjective onto a surface, local exponent0 forbidden | No vacuous positive-degree witness | = |
| L5 Riemann–Hurwitz | Sphere powers n=1,2,3 | `χX=2`; `2n−2(n−1)=2` in each case | Correct ramification subtraction | = |
| L5 boundary Riemann–Hurwitz | Disc powers n=1,2,3 | `χX=1`; `n−(n−1)=1` | Correct with unramified boundary | = |
| L5 unramified RH | S→P orientation cover | `2=2·1−0` | Nonorientable base covered | = |
| L5 marked Belyi comparison | z² branch/regular fibres | Raw sizes1/2, weighted sizes2/2 | Mathematical adapter must preserve weights; supplier excluded | R02 |
| L5 orientable graph genus | K₄,K₅,K₃,₃ | Minimum genera `0,1,1` | Planar/nonplanar controls discriminate | = |
| L5 nonorientable graph genus | K₁,empty | Positive-genus-only minimum1; sphere-inclusive convention0 | Definition not determined | R05 |
| L6 shared elementary moves | Subdivide edge; split face | Δχ=`1−1=0`; `−1+1=0` | Same moves as earlier owner | = |
| L6 move inverses | Subdivide then undo | Net dart/cell changes0 | Relation must be symmetric | = |
| L6 realization of moves | D edge subdivision; T polygon split | Before/after `(χ,b,orient)=(1,1,T);(0,0,T)` | Topological adapter preserves intended invariants | = |
| L6 normal-form existence | Sphere,torus,P,K | Words sphere digon,commutator,`aa`,`aabb`; χ=`2,0,1,0` | Imported word calculus, new topology | = |
| L6 sphere normal form | `aa⁻¹` | Two vertices, one edge, one face: `2−1+1=2` | Reject one-vertex source slip | Source issue below |
| L6 polygon group comparisons | T; P; pants | Presentations `[a,b]=1`, `a²=1`, free2; groups `ℤ²,C₂,F₂` | Distinguishes abelian/nonabelian outputs | = |
| L6 boundary normal forms | Unpaired `abc`; `abac` with a paired | D χ1,b1; B χ0,b1 | Orientability T/F distinguishes | = |
| L6 disconnected normal forms | Empty; S⊔T | 0 components,χ0;2 components,χ2 | No forced connectedness | = |
| L7 cell orientations | Directed edge; reversed edge | Boundary `v−u`; reversal `u−v=−(v−u)` | Correct sign | = |
| L7 chain groups | Triangle D; empty | Ranks `(3,3,1)`; `(0,0,0)` | Native free modules, not arbitrary chain placeholders | = |
| L7 boundary squared | Oriented triangle (0,1,2) | ∂₂=`e12−e02+e01`; ∂₁∂₂=`(v2−v1)−(v2−v0)+(v1−v0)=0` | Sign computation works | = |
| L7 orientation independence | Reverse one edge basis | ∂ column/row signs conjugated by diagonal−1; homology unchanged | Actual chain equivalence required | = |
| L7 Euler–Poincaré | T over field; P over ℚ/𝔽₂ | T:`1−2+1=0`; P:`1−0+0=1` or `1−1+1=1` | Coefficients handled correctly | = |
| L7 H₀ | Empty,D,D⊔D | Groups `0,ℤ,ℤ²`; ranks0,1,2 | Matches components including empty | = |
| L7 connected iff H₀ rank one | D versus empty/two discs | Rank1/T; rank0/F; rank2/F | Both directions on controls | = |
| L7 top integral homology | T,P,K | H₂=`ℤ,0,0`; P over𝔽₂ instead has H₂=𝔽₂ | Integral coefficient qualification necessary | = |
| L7 edge-path group | Tree; rose with2 loops | Groups `1,F₂`; no face relations for rose | Nonabelian control retained | = |
| L7 spanning-tree presentation | Triangle graph; filled triangle | Graph gives generator a; filled face imposes a=1 | Attaching relation changes group | = |
| L7 H₁ abelianization | Rose2; P | `F₂ab=ℤ²`; `C₂ab=C₂` | Not identity on arbitrary nonabelian group | = |
| L7 graph rank | Tree3 vertices; parallel2-edge graph; rose2 | `E−V+1=2−3+1=0;2−2+1=1;2−1+1=2` | Correct connected formula | = |
| L7 isomorphism chain map | Edge reversal | Sends e↦−e, boundary changes sign compatibly | Orientation data necessary | = |
| L7 edge subdivision chain map | Edge02 split at1 | e02↦e01+e12; boundaries `v2−v0` on both sides | Correct | = |
| L7 face subdivision chain map | Square split into two triangles | Internal diagonal appears +1 and−1, sum0 | Correct boundary cancellation | = |
| L7 flip invariance | Two diagonals in square D | Both complexes χ1, H₀=ℤ,H₁=H₂=0 | Homology agrees | = |
| L7 simplicial map on chains | Collapse triangle vertices0,1 together | Repeated-vertex oriented 2-simplex maps to0, not a generator | Native degeneracies respected | = |
| L7 contiguity prism | Vertex v with distinct images f(v),g(v) | P₀(v)=[f(v),g(v)]; ∂P₀=g(v)−f(v) | Direction/sign pinned | = |
| L7 subdivision equivalence | Triangle D | Chain ranks change `(3,3,1)→(7,12,6)`, homology stays `(ℤ,0,0)` | Not literal chain-group equality | = |
| L7 flag-chain comparison | P | Cellular ∂₂=2,∂₁=0; H₁=ℤ/2 on both models | Detects lost multiplicity | = |
| L7 cellular-chain comparison | T | Cellular ∂₁=∂₂=0; H₁=ℤ², matching triangulation | Existing generic theory consumed | = |
| L7 map identity/composition | Torus A,B | Identity→I₂; composite a-after-b→AB=`[[0,1],[-1,1]]` | Composition order consistent | = |
| L7 isotopy invariance | Torus identity and isotopic translation | Both induced H₁ matrices I₂ | Needs explicit isotopy-to-contiguity bridge | R10 |
| L7 homeomorphism induces isomorphism | Torus twist A | det A=1; A⁻¹=`[[1,-1],[0,1]]` | Correct | = |
| L7 orientable H₁ formulas | O(0,0),O(1,0),O(0,1),O(0,3) | Ranks `0,2,0,2`; formulas `2g` or `2g+b−1` give same | Boundary branch prevents negative rank | = |
| L7 nonorientable H₁ formulas | N(1,0),N(2,0),N(1,1) | Groups `C₂,ℤ⊕C₂,ℤ`; formulas agree | k>0 and b=0/b>0 separated | = |
| L7 remaining degrees/coefficient extremes | Dimension3; zero coefficient ring | H₃=0; all zero-ring chain groups and homology0 | No field-rank claim over zero ring | = |
| L8 standard-surface carrier | O(0,0),O(0,1),N(1,0),N(0,0) | S,D,P; N(0,0) not admitted | Positive crosscap count fixes duplicate sphere | = |
| L8 standard Euler formulas | S,T,D,A,P,K,B | `2,0,1,0,1,0,0` from `2−2g−b` / `2−k−b` | All agree with cells | = |
| L8 explicit standard homeomorphisms | Sphere,torus,disc,annulus models | χ=`2,0,1,0`; b=`0,0,1,2`; orientability all T | Necessary invariants agree | Native model construction remains target |
| L8 classification existence | P; T⊔D; empty | Models `N(1,0)`; family `[O(1,0),O(0,1)]`; empty family | No orientable-only shortcut | = |
| L8 classification uniqueness | T versus K; T versus A; T versus genus2 | χ equal0 first two; orientation or b separates; genus2 χ=−2 | All invariants needed | = |
| L8 homeomorphism iff invariants | Relabelled T; T versus K | Same `(0,0,T)` gives model T; `(0,0,T)≠(0,0,F)` excludes K | Both directions on controls | = |
| L8 topological genus | S,T,P,K,A,B | Values `0,1,1,2,0,1` in respective orientable/nonorientable branches | Correct | = |
| L8 puncturing | S minus0,1,2 open discs; P minus1 | S,D,A,B; χ=`2,1,0,0`, b=`0,1,2,1` | Correct | = |
| L8 Dyck relation | T#P | χ=`0+1−2=−1=χN(3,0)`; nonorientable,closed | Correct | = |
| L9 interior simple closed curve | Torus meridian; constant loop | First embedded S¹; second noninjective | Definition distinguishes wrong model | = |
| L9 proper arc | Radial arc in A; interior-ended segment | First endpoints on∂A and interior off∂A; second fails endpoint condition | Correct intended carrier | = |
| L9 essential curve | Annulus core; torus meridian | Neither bounds disc; annulus core is boundary-parallel, meridian is not | Missing peripheral convention | R05 |
| L9 separating curve | Equator on S; meridian on T | Complement components `2;1` | Correct distinction | = |
| L9 two-sided curve | T meridian; P core | Neighbourhoods A,B; boundary counts `2;1` | Correct one-/two-sided distinction | = |
| L9 cut two-sided circle | S equator; T meridian | D⊔D χ2,b2; A χ0,b2; χ unchanged | Connectedness not preserved in general | = |
| L9 cut one-sided circle | P core | D χ1,b1, matching P χ1,b0 plus1 boundary | Correct | = |
| L9 cut proper arc | A joining boundary components; pants joining two | Outputs D,A; `(χ,b): (0,2)→(1,1);(-1,3)→(0,2)` | χ rises1; b falls1 | = |
| L9 full mapping-class group | S,T | Groups C₂,GL₂(ℤ); reflection has determinant−1 | Orientation reversal retained | R10 individual APIs |
| L9 orientation-preserving mapping-class group | S,T | Groups1,SL₂(ℤ); A has determinant1 | Correct difference from full group | R10 |
| L9 boundary-relative mapping-class group | D,A | Groups1,ℤ; one annulus twist corresponds to1≠0 | Boundary fixation essential | R10 |
| L9 PL/smooth comparison | D rel boundary; A rel boundary | Quotients1 andℤ in both categories | Supplier comparison read; source smooth proof not certified | = |
| L9 positive Dehn twist definition | Collar orientation dθ∧dt | `(θ,t)→(θ+t,t)` shifts transverse endpoint by+1 | Convention fixed | = |
| L9 torus twist action | Positive a,b with a·b=1 | Tₐ(b)=b+a; T_b(a)=a−b; matrices A,B above | Signs consistent | = |
| L9 isotopic-curve independence | Two parallel torus meridians | Both actions send b↦b+a | Same mapping-class target | = |
| L9 twist orientation dependence | Reverse curve; reverse surface orientation | Curve reversal gives A; surface reversal gives A⁻¹ | Correct distinction | = |
| L9 conjugation | Orientation-preserving exchange a↦b | F=`[[0,-1],[1,0]]`; FAF⁻¹=B | Consistent | = |
| L9 disc twist triviality | Interior circle in D | Rel-boundary mapping class0 in trivial group | Correct special case, kept in README | = |
| L9 change of coordinates | Torus a,b; separating/nonseparating genus2 curves | Torus exchange F has det1; cut component counts2 versus1 prohibit second exchange | Necessary topological type retained | = |
| L9 intersection reduction | Annulus transverse arcs, winding4 | Intersections3; twists−2,−3,−4 give1,0,0 | Corrected minimum floor | Same; arc source unverified |
| L9 winding formula | Winding0,1,2,3,4 | `max(|n|−1,0)=0,0,1,2,3` | Negative powers needed for reduction | = |
| L9 braid relation | Torus A,B | `ABA=BAB=[[0,1],[-1,0]]` | Noncommuting matrices tested | = |
| L9 homology action | Torus full and positive groups | Reflection det−1; A det1; identity I | Correct codomain distinctions | = |
| L9 finite twist generation | Closed genera1,2,3; D; A | Claimed counts `3g−1=2,5,8`; D needs0, A generator1 | Counts/exceptional models consistent | Source proof unverified |
| L10 rotation face count | Empty; K₁; two disjoint triangles | Faces `0;1;4`, components `0;1;2` | Isolated vertices explicitly contribute1 | = |
| L10 componentwise rotation Euler | Empty; K₁; two triangles | `V−E+F=0;1−0+1=2;6−6+4=4=2c` | Correct | = |
| L10 planar rotation predicate | Torus K₅ plus spherical C₃ | χtotal=`0+2=2`, but `2c=4` | Nonplanar component cannot hide in sum | = |
| L10 graph planarity definition | Empty,K₄,K₅ | Plane rotation exists T,T,F | Genus-zero convention agrees | = |
| L10 simple graph specialization | K₄; loop graph | K₄ transports4 vertices6 edges; loop graph outside SimpleGraph | No silent loss of loops | = |
| L10 planarity-drawing equivalence | Empty,K₄,K₅ | Noncrossing sphere drawings T,T,F, matching predicate | Both directions on controls | = |
| L10 connected planar Euler | K₁; K₄ | `1−0+1=2`; `4−6+4=2` | Isolated connected case works | = |
| L10 edge bound | K₃,K₄; 4 parallel edges on2 vertices | `3=3·3−6`; `6=3·4−6`; multigraph4>0 | Simplicity and V≥3 needed, retained | = |
| L10 low-degree vertex | K₁; octahedral graph; empty | Minimum degrees0,4; empty has no vertex | Nonempty hypothesis required and retained | = |
| L10 K₅ obstruction | K₅ | E=10 while planar bound9 | Nonplanar | = |
| L10 K₃,₃ obstruction | K₃,₃ | E=9 while bipartite planar bound `2·6−4=8` | Nonplanar | = |
| L10 minor direction | Contract edge of K₃; K₁ versus K₃ | K₃ contracts to K₂; K₁ cannot contain K₃ minor | Smaller object is the minor | = |
| L10 topological minor | Subdivide one K₄ edge | Vertices4→5,edges6→7, suppress degree2 recovers K₄ | Distinguishes subdivision from arbitrary contraction | = |
| L10 wheel/contraction step | K₅; wheel K₄ | K₅ contracts to K₄; K₄ is wheel W₃ and exception | Guard excludes shrinking K₄ below3-connectivity | Locator missing, R11 |
| L10 Kuratowski | K₄,K₅,K₃,₃ | Forbidden subdivision exists F,T,T; planar T,F,F | Correct opposite truth values | = |
| L10 Wagner | K₄,K₅,K₃,₃ | Forbidden minor exists F,T,T; planar T,F,F | Correct opposite truth values | = |
| L10 minor closure | K₄→K₃→K₂ | Planarity T→T→T; edge counts6→3→1 | Correct direction | = |
| L10 peripheral cycles | K₄ triangle; K₄ 4-cycle | Triangle induced, deletion leaves one connected vertex; 4-cycle has2 chords | Only triangle is peripheral/facial | = |
| L10 Whitney embedding uniqueness | K₄ | Two oriented rotation systems related by reflection, one unoriented sphere embedding class | 3-connectivity and orientation convention matter | = |
| L10 2-isomorphism | K₂ versus K₂⊔isolated vertex | Cycle matroids each one coloop; graphs have2/3 vertices | Isolated-vertex exclusion necessary; move equivalence undefined | R05 |
| L10 binary cycle space | Empty; one loop; K₂; parallel2; theta | Dimensions `0;1;0;1;2` from E+c−V | Handles loops and multiple edges | = |
| L10 binary cut/cycle orthogonality | Triangle; loop | Triangle cut (1,1,0)·cycle(1,1,1)=0 mod2; loop cut coordinate0 | Correct coefficient/sign convention | = |
| L10 2-basis | Triangle; theta; K₅ | Triangle edge frequencies1; theta choose two cycles, frequencies≤2; K₅ has no 2-basis | Planar/nonplanar controls | = |
| L10 Mac Lane equivalence | Empty,theta,K₅ | 2-basis exists T,T,F; planar T,T,F | Both directions on controls | = |
| L10 Fáry | Empty,K₁,triangle,K₄ | Straight edge counts0,0,3,6; K₄ at outer (0,0),(3,0),(0,3),inner(1,1) has0 crossings | Full signature statable | R04 |
| L10 Tutte convex embedding | K₄ with outer triangle | Inner point is average `(1,1)`; all3 bounded faces are convex triangles | Proof notes specify convex outer face; theorem locator missing | R11 |
| L10 planar dual cycle/cut | Triangle and its three-parallel-edge dual | Primal cut space is even parity, dimension2; dual cycle space is the same even-parity subspace | Actual subspaces agree under edge identification | = |
| L10 five-colour headline | Empty,K₁,K₃,K₄ | Chromatic numbers `0,1,3,4≤5` | Finite/disconnected signature has correct scope | = |

Separate enumeration: **570** generalized maps on 0–4 darts, **29** surface maps; **0** failures of subdivided flag injectivity, surface-Euler preservation or orientation-cover checks. Probe results are recorded above.

## Not verifiable

Eleven cited works could not be read in full through the legal sources service:

- `damiand_lienhardt`: Taylor–Francis DOI landing page only; §§2.4, 4.3–4.5 and Definition 91 were not source-certified.
- `dehlinger_dufourd`, `lando_zvonkin`, `moise`: service returned paywalled/uncertified publisher records. Their generalized-map, dessin and PL/smooth locators remain uncertified; no new missing-text request was created for them.
- `mohar_thomassen`: JHU publisher request returned HTTP 403; embedding and planarity chapter locators unread.
- `thomassen1981`: Wiley returned HTTP 403; Kuratowski proof unread.
- `lickorish1962`: JSTOR landing page only; an institutional IISER Pune copy failed certificate validation. Lemma 2, its claimed arc extension and Theorem 1 unread.
- `lickorish1964`, `lickorish1966`: Cambridge landing pages only; generator proof and corrigendum unread.
- `farb_margalit`: publisher landing page only; author's Chicago PDF URL returned 404. Curve/twist source locators unread.
- `munkres_topology`: bibliographic lookup found no readable legal text; Chapter 12 unread.

The eight unresolved works are recorded in `needs-references.toml`; the three uncertified records are settled. Unread sources are verification limits, not evidence that their theorems are false.

## Source issues

- **Misprint** in gallier_xu at §6.1, printed p. 82 (gallier_xu line 3141): the source says the sphere word has one inner vertex; it should be two vertex classes for the two oppositely traversed sides; affects nothing.
