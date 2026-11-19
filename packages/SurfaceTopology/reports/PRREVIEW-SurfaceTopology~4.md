# Review of SurfaceTopology (pull request #271 at a994be4)

**Verdict:** needs changes

**Summary.** Changes are needed: the mathematics of the stated results survived every instance I computed, but the plan has four ownership and supply defects. Layer 7 consumes an ordered-simplex chain complex that no roadmap or pinned library states; layers 8 and 9 plan again the classification, mapping class groups, Dehn twists and Lickorish's theorem that `GeometricTopology` §§1.7 and 1.7.2 own on main; the `GMap` carrier is also owned by an open roadmap; and the pinned Tau Ceti already has a homeomorphism-invariant Euler characteristic, so Riemann–Hurwitz is statable and absent. There are seven small corrections and two format notes, none blocking, and four points for the human reviewers.

## R01 (P1) — The ordered-simplex chain complex that layer 7 consumes is stated by no supplier

Layer 7 treats `K.chainComplex R` and `g.chainMap` as an input ("name that input API, not a second general chain construction here", line 1186), and the supplier table (lines 98–99) assigns "the ordered-simplex chain complex … with its alternating boundary and simplicial maps" and "its ordered-boundary comparison" to `GeometricTopology` layer 11. An implementer of the subdivision equivalence, the contiguity prism, the flag-complex comparison and `homologyMap` has nothing to build on.

On main, layer 11 of `TauCetiRoadmap/GeometricTopology/README.md` (lines 7732–7990) contains no chain complex: §11.1 cites the pinned realization, its CW structure and the stellar homeomorphism, and the only occurrences of "chain", "homology" or "ordered" in the layer are Manolescu's theorem (lines 7935–7938) and the ordered cylinder (lines 7960–7976). The open revisions of that roadmap do not add one either. The pinned `TauCeti/AlgebraicTopology/SimplicialComplex/` has no chain complex of an abstract simplicial complex.

The smallest change: state the ordered-simplex complex, its alternating boundary, the chain map of a simplicial map (zero on repeated vertices) and `∂² = 0` as targets of layer 7 here, restricted or not to dimension two as you prefer, and delete the two rows from the supplier table. Alternatively build the simplicial side on the pinned `TauCeti.cellularChainComplex` of the realization, which the "Separate cellular comparison" paragraph already uses.

## R02 (P2) — Layers 8 and 9 plan again what `GeometricTopology` §§1.7 and 1.7.2 own on main, and the README states the supply in the opposite direction

The opening says "The classification supplies `GeometricTopology`'s surface input", and the consumer table gives `GeometricTopology` layer 9 the classification and "surface mapping classes" from layers 8 and 9 here. On main it is the reverse: `GeometricTopology` §9.1 needs its own "Layer 1.7, Layer 1.7.2" (line 7595), and nothing on main cites this roadmap.

What main already states, in `TauCetiRoadmap/GeometricTopology/README.md`: §1.7 (lines 1059–1070), every compact connected surface with or without boundary is exactly one standard model, the complete invariant (Euler characteristic, boundary count, orientability), and genus `(2 − χ − b)/2`; §1.7.2 (lines 1214–1270), `Mod(F)` rel boundary and `Mod⁺(F)`, the Dehn twist `([θ], t) ↦ ([θ + φ(t)], t)` with the tube oriented by `dθ ∧ dt`, conjugation and orientation rules, `Mod(D²) = 1`, `Mod(annulus) ≅ ℤ`, `Mod⁺(T²) ≅ SL₂(ℤ)` and `Mod(T²) ≅ GL₂(ℤ)`, the action `[x] ↦ [x] + (c · x)[c]`, the cutting counts for curves and arcs, Lickorish's twist theorem by the same double induction, and the `3g − 1` set; its Check has the same matrices `[[1,1],[0,1]]` and `[[1,0],[−1,1]]`. §11.2.1 items 2 and 5 identify the smooth and topological groups. Layer 9 here states each of these again (`dehnTwist`, `dehnTwist_conj`, `mcg_disc_rel_boundary`, `mcg_annulus_rel_boundary`, `mcg_torus_plus`, `mcg_torus_full`, `cutAlong` and its counts, `dehnTwists_generate`, `exists_dehnTwist_generatingSet_card`), and layer 8 states the classification and `Surface.genus`. The open `TeichmullerGeometry` (§0.0h; its `Suggested.lean` line 450) also defines `MappingClassGroupFull` and the PL comparison, and the open `MappingClassGroupsAndCanonicalRepresentations` cites `GeometricTopology` §1.7.2 for the twist and for Lickorish (its README lines 69 and 110).

A roadmap on main is the owner. The smallest change that makes the text true: in "Relationship to other roadmaps" remove the two `GeometricTopology` layer 9 rows and the opening sentence, and say which statements of layers 8 and 9 are `GeometricTopology` §§1.7, 1.7.2 and 11.2.1; in those layers keep only what differs, each with one clause saying how (for layer 8: the models as realizations of the canonical polygonal schemas, the proof on finite invariants, existence from a generalized-map presentation; for layer 9: whatever is not in §1.7.2, such as the essentiality comparison with `FreeGroupsAndLimitGroups` §6.0d and the proper-arc reduction lemma as a statement about embeddings), and cite the rest. If the intention is instead that this roadmap becomes the owner, that is a revision of `GeometricTopology` which must merge first; this roadmap cannot presuppose it.

## R03 (P2) — Riemann–Hurwitz is statable at the pins: Tau Ceti already has a homeomorphism-invariant Euler characteristic

The module docstring of `Suggested.lean` says "Riemann–Hurwitz needs PlanarTopology's topological Surface.eulerChar", and the README says invariance "comes from the Hauptvermutung, not from comparison with singular theory" (line 194). The pinned library has `TauCeti.eulerChar (X) [FiniteCWType X] : ℤ` (`TauCeti/AlgebraicTopology/Cellular/EulerCharacteristic/FiniteCWType.lean` line 92), with `Homeomorph.eulerChar_eq` (line 132), `eulerChar_cwComplex` (the cell count of any finite CW structure, line 120) and Euler–Poincaré against singular homology (line 102). So a headline the file declares not statable is statable, and the comparison "orbit cells are the cells of the surface" of summit 1 is too.

Both elaborate against the pins on a copy of the file, with `import TauCeti.AlgebraicTopology.Cellular.EulerCharacteristic.FiniteCWType` added and the `sorry` warnings the only output:

```lean
theorem riemannHurwitz {X Y : Type} [TopologicalSpace X] [ChartedSpace (EuclideanHalfSpace 2) X]
    [TopologicalSpace Y] [ChartedSpace (EuclideanHalfSpace 2) Y] [T2Space X] [T2Space Y]
    [CompactSpace X] [CompactSpace Y] [ConnectedSpace X] [ConnectedSpace Y]
    [TauCeti.FiniteCWType X] [TauCeti.FiniteCWType Y]
    (p : X → Y) (B : Finset Y) (e : X → ℕ) (hp : IsBranchedCover p B e) (d : ℕ)
    (hd : ∀ y, ∑ x ∈ (hp.finite_fibers y).toFinset, e x = d)
    (hfin : (p ⁻¹' (B : Set Y)).Finite) :
    TauCeti.eulerChar X = (d : ℤ) * TauCeti.eulerChar Y -
      ∑ x ∈ hfin.toFinset, ((e x : ℤ) - 1) := by
  sorry
```

Instances: `z ↦ zⁿ` on the sphere gives `2 = 2n − 2(n − 1)`, on the closed disc `1 = n − (n − 1)`, the sphere over the projective plane `2 = 2·1 − 0`. The smallest change: state it (and, if you wish, `TauCeti.eulerChar G.realization = V − E + F` under `IsSurfaceGMap`), correct the docstring, and in the README say that the Euler characteristic of a realization is the pinned one; whether `Surface.eulerChar` remains a separate object is `PlanarTopology`'s to settle.

## R04 (P2) — The carrier `GMap n D` has a second owner in an open pull request

Layer 1 here defines `GMap`, `GMap2`, cells, components, isomorphisms, the Euler characteristic, the closed-surface predicate, orientability and (layer 4) the orientation double cover. The open roadmap `PseudolineArrangementsAndOrientedMatroids` (pull request #1523) lists exactly these as "Owned here" for its "flag carrier `GMap n D` on arbitrary dart types" (`TauCetiRoadmap/PseudolineArrangementsAndOrientedMatroids/README.md` lines 37–39 and 141–143 at its head), with the same field `adj` and the same commutation condition `i + 2 ≤ j`, and says no other roadmap owns generalized maps. Two libraries of the same structure would be built.

This roadmap is the one the merge order lists, so the natural settlement is that it owns the carrier and the other cites it. For that to work the carrier must admit the other's inputs: the structure here takes `[Fintype D] [DecidableEq D]` in its signature although no field uses them. The smallest change: state `GMap n D` for an arbitrary type `D`, with finiteness as a hypothesis of the statements that count (cells, Euler characteristic, realization), and say in "Relationship to other roadmaps" that this roadmap owns the carrier and those six items.

## C01 — The description does not say that the consumer claims rest on an unmerged revision of `GeometricTopology`

"The reciprocal cross-references in neighbouring roadmap READMEs are preserved separately in draft #1791." A reader must know more than this: on main `GeometricTopology` owns the surface classification and the mapping class groups itself (R02), so the README's consumer table is true only after that draft. The text that would be right says so, or, after R02, says that this roadmap consumes `GeometricTopology` §§1.7 and 1.7.2.

## C02 — Three sentences on invariance describe a library without the cellular–singular comparison

"When the comparison becomes available it will be a bridge theorem" (line 198), and "does not contemplate a comparison theorem with Mathlib's `SingularHomology`" (line 196). The pinned `TauCeti.cellularSingularHomologyIso` (`TauCeti/AlgebraicTopology/Cellular/Comparison.lean` line 108) is that comparison for a CW complex, and layer 7's own "Separate cellular comparison" maps the generalized-map complex to `TauCeti.cellularChainComplex`; composed, they give the bridge. Say that the bridge to singular homology is the composite of that target with the pinned isomorphism.

## C03 — The Check on duality points at the wrong comparison theorem

"`dual (dual G) ≃ G` is checked on the closed maps in the layer 1 table (comparison theorem 5)" (line 744). Theorem 5 of layer 2 is the schema round trip; double duality is theorem 4.

## C04 — The list of layer 6 examples reads as if `abca⁻¹b⁻¹c⁻¹` were the Klein-bottle normal form

"Realize the shared reductions of `abab⁻¹` and `aabb` to the Klein-bottle normal form, `abca⁻¹b⁻¹c⁻¹`, the triangular disc, and `abac` to the Möbius-band form" (lines 1147–1149). The hexagon `abca⁻¹b⁻¹c⁻¹` has two vertices, three edges, one face and is orientable: `χ = 0`, a torus. Say what it reduces to.

## C05 — Three results have one form in the README and another in the Lean file

The README gives `def GMap2.realizationChartedSpace`, "the structure, not an existence statement", and `instance : T2Space`; the Lean file states `exists_realizationChartedSpace : Nonempty (ChartedSpace …)` and the theorem `realizationT2Space`. Fáry's theorem is `exists_straightLine_drawing (h : G.IsPlanar)` in the README and `fary_of_noncrossing_drawing` in Lean, a name the README does not mention (the five-colour theorem has both forms recorded). Record the Lean forms in the README as you did for five-colouring.

## C06 — `GeometricTopology` layer 4 does not state the discipline attributed to it

"it follows the discipline `GeometricTopology` layer 4 states for knot presentations: pick a hub, do not aim for the complete graph on presentations" (line 144). A search of that README on main for "hub" and "complete graph" finds nothing. Give the section, or state the discipline as this roadmap's own.

## C07 — Layer 10 defines its scope as a chapter of a source

"The intended scope is **Mohar and Thomassen, *Graphs on Surfaces*, chapter 2**, together with Fáry's theorem and Wagner's theorem" (line 1679). A roadmap's scope is its own list of results, which the list of intermediate results at the end of the layer already gives; say that, and keep the book as the reference for the individual theorems.

## N01 — Six names in code font are declared nowhere

The names of the PL-drawing isotopy theorem (layer 5), the capping realization theorem and the contraction quotient theorem (layer 4), the two chain equivalences with the flag complex (layer 7) and the realization–flag-complex homeomorphism appear in code font in the prose, so a reader cannot tell a proposed name from a declaration. Say they are proposed names.

## N02 — Process words and pull-request references

"This prototype" and "mathlib4 #43687" in the docstrings of `Suggested.lean` (lines 20 and 150), "this form is compiled in Suggested.lean" (README line 1832), and the links to open Mathlib pull requests date the text; name the Mathlib design in words.

## Questions for the author

- Does Lickorish's Lemma 2 include the condition that each twist curve meets `q` fewer times than `p` does, which `exists_twists_reduce_intersection` carries as hypothesis `h`? The 1962 paper could not be read.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| L0 `moveSequence_false_iff` | object to itself; relabelled triangle; triangle vs three points | `ReflTransGen` of a setoid is the setoid: T, T, F | holds | none |
| L0 `moveSequence_iff_iso_or_move` | `r x y` alone; `s, r, s` | `r` is `isoClosure` with `a'=x, b'=y`; `isoClosure` is three steps of the right side | both directions | none |
| L1 `aa` map (conventions) | `α₀=(12)(34), α₁=(14)(23), α₂=(13)(24)` | each pair generates V₄, transitive: `(V,E,F)=(1,1,1)`, `χ=1`; no bipartition (2,4 same and different) | projective plane | none |
| L1 `IsSurfaceGMap` | all-swap on `Bool`; `projectivePlane` | all-swap: conditions (T,T,F), orbit count 1, realization sphere `3−3+2=2`; `aa`: (T,T,T) | third condition needed | none |
| L1 example table | monogon, digon discs; annulus `aba⁻¹c`; Möbius `abac` | `(1,1,1)`, `(2,2,1)`, `χ=1`; `(2,3,1)` twice, `χ=0`, orientable T / F | table correct, `n ≥ 1` | none |
| L1 `card_edgeOrientation`, `card_faceOrientation` | interior edge, boundary edge, 2-dart face; all-swap edge | `⟨α₂⟩`-orbits 2, 2; `⟨α₀α₁⟩`-orbits 2; all-swap 1 | hypothesis needed and present | none |
| L2 triangular disc, `toCombinatorialMap` | `α₀=(01)(23)(45)`, `α₁=(12)(34)(50)`, `α₂=id` | orientation side has 3 darts; no fixed-point-free involution on 3 | closedness needed | none |
| L2 Walsh map, degree-one triple | `n=1` | Walsh darts 2, generalized darts 4; `V=2,E=1,F=1`, `χ=2 = 1+1+1−1` | agrees with pinned `eulerChar` | none |
| L2 white-degree-two ribbon graphs | `B` black, `W` white, `2W` edges, `F` faces | `B+W−2W+F = B−W+F` | Euler characteristics agree | none |
| L3 `gluingStep` | weight `i` zero, `α_i` | side opposite vertex `i` contains the cells `j ≠ i`, which `α_i` keeps | correct side glued | none |
| L3 `exists_realizationChartedSpace` | one dart all fixed; `α₀=id, α₁=α₂=swap`; all-swap | triangle; disc (two triangles on two adjacent sides); sphere | no hypothesis needed | none |
| L3 `boundary_realization` | `α₀=id, α₁=α₂=swap` | disc with no `α₂`-fixed dart | first two conditions needed, present | none |
| L3 `eulerChar_barycentricSubdivision` | closed surface map; all-swap | `V+E+F−6E+4E = V−E+F`; all-swap `1` vs `3−3+2=2` | hypothesis needed, present | none |
| L3 flag injectivity after subdivision | any map, dart `(d, σ)` | face cell is `d`; corner and side types 0,1,2 are preserved, so `σ` is recovered | holds for every map | none |
| L3 `exists_gmap_of_compactSurface` | empty `M`; disconnected `M` | `D = Empty`; no connectedness in the statement | consistent | none |
| L4 `orientationDoubleCover_eulerChar` (no hypothesis) | all-swap; one fixed dart; orbit graphs of two involutions | `2 = 2·1`; `2 = 2·1`; paths and even cycles are bipartite, every cell lifts twice | holds for every map | none |
| L4 `double_eulerChar` counterexample | `α₀=swap, α₁=α₂=id` | `χ = 2−1+1 = 2`; double `2−1+2 = 3 ≠ 4` | as stated | none |
| L4 connected sum formulas | `S#T`; `D#D`; `(S⊔T)#T` both selections | `2+0−2=0`; `χ=0, b=2`; `{0,0}` and `{2,−2}`, two components each | as stated | none |
| L4 capping | disc, annulus, Möbius band | `(1,1)→2`, `(0,2)→2`, `(0,1)→1` | `χ + b` | none |
| L4 Check on duality | — | theorem 4, not 5 | mislabelled | C03 |
| L5 `boundary_subset_support_of_isCellular` | `C₃` on the whole boundary of a disc; one side on it | first: `3−3+1=1`; second: outer component has boundary points, not an open disc | true; uses finiteness for closed support | none |
| L5 `eulerFormula_cellular` | `K₁` in sphere; two `K₁` in two spheres; annulus with two loops and a spoke; empty graph in sphere | `2`; `4`; `2−3+1=0`; not cellular | holds without connectivity | none |
| L5 crossed `C₄` | bow-tie in the sphere | crossing as vertex: `5−6+3=2` | noncrossing needed | none |
| L5 `IsBranchedCover.local_degree_unique` | `z ↦ z²` with an extra regular marked value | exponent at 0 is 2 in both; boundary exponents 1 | true | none |
| L5 `IsBranchedCover.exists_degree` | `zⁿ` on sphere and disc; identity with `e=2` | sums `n` at regular and branch fibres; identity fails the local model | true, positive | none |
| L5 `riemannHurwitz` | `zⁿ` sphere; disc; `S² → ℝP²` | `2=2n−2(n−1)`; `1=n−(n−1)`; `2=2·1` | true; statable at the pins | R03 |
| L5 graph genera | empty, `K₁`, `K₅`, `K₃,₃` | `(0,0)`, `(0,0)`, `(1,1)`, `(1,1)` | conventions determine values | none |
| L5 switching of signed rotations | tree edge; loop | twist changes by `ε(u)+ε(v)`: 1→0; loop `2ε=0` | as stated | none |
| L6 normal forms | digon `aa⁻¹`; `abac`; `abca⁻¹b⁻¹c⁻¹` | `(2,1,1)`, `χ=2`; `(2,3,1)`, nonorientable; `(2,3,1)`, orientable: torus | sentence ambiguous | C04 |
| L7 shared simplex chains | supplier section on main | no chain complex in `GeometricTopology` layer 11 | unowned | R01 |
| L7 normal-form homology | `O(1,0)`, `O(0,3)`, `N(1,0)`, `N(2,0)`, `N(1,1)` | `ℤ²`, `ℤ²`, `ℤ/2`, `ℤ⊕ℤ/2`, `ℤ` from the four formulas | correct | none |
| L7 `Graph.edgePathGroup_free` | tree; two parallel edges; rose of two loops | `1−(V−E)`: 0, 1, 2 | correct | none |
| L8 classification, complete invariant | `T` vs genus two; `T` vs `K`; `T` vs annulus | `χ` 0 vs −2; orientability; `b` 0 vs 2 | all three needed; statement owned on main | R02 |
| L8 `StandardSurface.eulerChar` | `S, T, D, A, P, K, B` | `2,0,1,0,1,0,0` | correct | none |
| L9 twist matrices | `a·b=+1`, `T([θ],t)=([θ+t],t)`, `dθ∧dt` | `T_a b = b+a`, `T_b a = a−b`; `ABA=BAB=[[0,1],[−1,0]]` | consistent; identical to `GeometricTopology` §1.7.2 | R02 |
| L9 signed words | `p = T⁴q` on the annulus | interior crossings `p₄:3`, `p₂:1`, `p₁:0`, `p₀:0`; positive powers `≥ 3` | as stated | none |
| L9 cutting counts | `T` meridian; `ℝP²` core; arc in annulus | `(0,0)→(0,2)`; `χ` 1→1, `b` 0→1; `(0,2)→(1,1)` | correct | none |
| L9 essentiality | annulus core; torus meridian; Möbius core | boundary-parallel; essential two-sided; essential one-sided | agrees with `FreeGroupsAndLimitGroups` §6.0d | none |
| L10 `PlaneMap` condition | two triangles; toroidal `K₅` beside a triangle; `K₁` | `χ=4=2·2`; `0+2=2≠4`; `1−0+1=2` | componentwise | none |
| L10 `cycleSpace_finrank` | loop; two parallel edges; `K₂` | `1+1−1=1`; `2+1−2=1`; `1+1−2=0` | natural subtraction safe | none |
| L10 Whitney twist example | four-cycle with two leaves at one vertex | degrees `{4,2,2,2,1,1}→{3,3,2,2,1,1}`, same four cycle edges | as stated | none |
| L10 2-isomorphism hypothesis | empty graph vs `K₁` | both cycle matroids empty; no move relates them | hypothesis needed, present | none |
| L10 five-colour, Fáry (Lean) | `Drawing` of `ofSimpleGraph G` in `ℂ`; empty `V` | arcs injective, meet only at common ends: a plane embedding; empty graph colourable | true statements | none |
| `GMap` carrier | open roadmap #1523 | same structure, fields and owned items | two owners | R04 |

- Source locators checked against the text: 20 (Gallier–Xu 8, Epstein 2, Moffatt–Oh 2, Damiand–Lienhardt 8 against its contents and list of figures only).
- Library declarations opened at the pins: 18, among them `PermutationTriple` (`Basic.lean` 75, 83; `EulerCharacteristic.lean` 66), `BipartiteRibbonGraph` (`RibbonGraph/Basic.lean` 49, 195, 234), `Matrix.exists_smith_normal_form_of_det_ne_zero` (750), `Set.Finite.preimage'` (213), `Graph.edgeCut`, `Graph.IsEdgeCut` (36, 82), `Graph.ofSimpleGraph` (119), `IsCoveringMap.liftPath` (256), `TauCeti.eulerChar` (92), `TauCeti.cellularSingularHomologyIso` (108); the pinned Mathlib has no minor or contraction of a `SimpleGraph`, so Kuratowski and Wagner are not statable.
- Cross-roadmap citations resolved: `FreeGroupsAndLimitGroups` §§2.1, 2.1a, 2.2, 2.2a, 6.0a–6.0d; `GraphConnectivityAndFlows` Targets 1.1, 1.2, 1.5; `AlgebraicTopology` stage 4 items 1–3 (now §§4.1–4.3, mapped there); `BelyiMaps` §§2.7, 7.7; `PlanarTopology` layers 0, 2, 3, 5, 6, 7, 8 at this head; `GeometricTopology` layers 9 and 11 (R01, R02).
- Dependency check: `depcheck: 200 roadmaps, 2191 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration of `Suggested.lean` at the pins: eight `sorry` warnings and nothing else. `#check @name` on all 26 declarations: no section binder lost, each type compared with its README statement; nothing changed.
- One-tactic probe on the eight sorried theorems (`exact inferInstance`, `rfl`, `trivial`, `simp`): none closes. No padding.
- Headlines: realization (stated: Hausdorff, charts, presentation), five-colour and Fáry (stated), local degree and global degree (stated); Heffter–Edmonds–Ringel, normal forms, classification, Dehn–Lickorish, Kuratowski, Whitney, Mac Lane named in the docstring as not statable, correctly; Riemann–Hurwitz named as not statable, incorrectly (R03).
- Earlier findings at 421e114: the non-cellular counterexample, the marked-cover supplier, the module warning, Fáry, the underdetermined definitions, the admitted instance, the stray manifest and the padding are repaired; the undeclared names are reduced from eight to six (N01); the locators are added for Fáry, Tutte and the wheel theorem.

Overlap check: read GeometricTopology (main), FreeGroupsAndLimitGroups (main), GraphConnectivityAndFlows (main), TeichmullerGeometry (open), PseudolineArrangementsAndOrientedMatroids (open); the classification, mapping class groups, Dehn twists and Lickorish's theorem are GeometricTopology's (R02), `MappingClassGroupFull` is also TeichmullerGeometry's, `GMap` is shared with PseudolineArrangementsAndOrientedMatroids and should be this roadmap's (R04); polygonal models and graph connectivity are cited, not restated.

Source independence: 7 passages compared with 4 sources (Gallier–Xu, Moffatt–Oh, Epstein, the contents of Damiand–Lienhardt), none shared; largest share Mohar–Thomassen, about 20 of about 110 locators by line; its text and contents could not be read, so the arrangement was compared only with the section list the README itself gives for its chapter 2, which layer 10 does not follow in order.

Research link: Layer 9 is Lickorish's twist theorem (1962, 1964); layer 10 is Kuratowski by Thomassen (1981), Whitney (1933), Tutte (1963) and Fáry (1948); layer 5 the Heffter–Edmonds–Ringel correspondence of Mohar–Thomassen (2001). Rests on the README's references and its four-colour motivation (Gonthier 2008).

## Not verifiable

- Damiand–Lienhardt: only the publisher's preview (contents and list of figures) is readable; §2.4, §4.3.4.2, §8.3.2.1 and Definition 91 were checked for section and page, not for content.
- Mohar–Thomassen: publisher page only; Theorem 1.4.3, Lemma 1.4.4, chapter 2 and pp. 87–93 unread.
- Tutte 1963: the linked copy is on a host of no known licence class and was not fetched; (9.2), §6 and (10.8)–(10.9) unread.
- Fáry 1948: the repository's landing page gave no file; §1 and Lemma 2 unread.
- Whitney 1933, Lickorish 1962: JSTOR landing pages only. Lickorish 1964 and 1966, Thomassen 1981, Lando–Zvonkin, Dehlinger–Dufourd, Munkres, Moise: not readable from a legal source.

Automatic checks set aside as false positives: the 55 hits of the rule against naming a roadmap the project has dropped from its plan all name `PlanarTopology`, which this pull request itself adds and whose folder was read at this head.

## Source issues

- **Misprint** in gallier_xu at §6.1, printed p. 82 (gallier_xu line 3141): the source says the one-face complex with boundary `aa⁻¹` has a single inner vertex; it should be two vertices, since `V − 1 + 1 = 2`; affects nothing.
- **Gap** in moffatt_oh at the Introduction, p. 1 (moffatt_oh line 24): the source says Whitney's theorem holds for all graphs; it should be for graphs without isolated vertices (the empty graph and `K₁`); affects nothing.

## For the human reviewers

- Merge order: this roadmap consumes `PlanarTopology` in layers 3, 5, 7, 8, 9 and 10; that roadmap is not on main, is on the project's list of dropped names, and is added by the same pull request.
- Scope: layer 7 builds homology from finite boundary matrices with invariance through the Hauptvermutung, while the pins have singular homology and `TauCeti.cellularSingularHomologyIso`; the description presents this as the author's chosen elementary route.
- Not tested: Mohar–Thomassen, the source with the largest share of locators, and the body of Damiand–Lienhardt could not be read; wording and arrangement were not compared with them.
- Licence: the README links Tutte 1963 to a copy on a third party's course page (README line 1917), whose status I could not settle.
