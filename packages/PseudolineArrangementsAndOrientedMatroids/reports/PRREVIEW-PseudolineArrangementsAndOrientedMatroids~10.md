# Review of PseudolineArrangementsAndOrientedMatroids (pull request #1523 at 280b170)

**Verdict:** needs changes

This is a full review of the 774 changed lines since 4096628. The previous finding is repaired: the flag carrier, its invariants and the orientation double cover are now owned in Layer 0. The gate passes, the dependency check is clean, and `Suggested.lean` elaborates with only `sorry` warnings. No P1 or P2 finding remains. The five P3 findings below are each a short edit.

## R01 (P3) — `Suggested.lean` computes the Platonic examples of 9.4

**Location:** `TauCetiRoadmap/PseudolineArrangementsAndOrientedMatroids/Suggested.lean`.
- Line 914–930: `natCard_platonicGroups` ("`Nat.card (CoxeterMatrix.A 3).Group = 24 ∧ … = 48 ∧ … = 120`"), `cellNumbers_platonic` and `isClosedSurface_isOrientable_platonic`.
- Line 888–911: the definitions `tetrahedronGMap`, `octahedronGMap`, `cubeGMap` and `dodecahedronGMap`, which only these three theorems use.

**Claim:** the docstring (line 73–75) lists the three theorems as headlines. They are padding under the acceptance-test rule ("computes a small value"): each states values or decidable properties of five fixed finite maps.

**Witness:** the theorems state the orders `24, 48, 120` and the cell numbers `(4,6,4)` through `(20,30,12)`. The Summary (line 3–26) names no Platonic map. 9.4's Check (line 1378–1379) computes the same quotients, `24/6 = 4`, `48/8 = 6`, `120/10 = 12`.

**Repair:**
- Delete the three theorems and the four definitions. Keep `coxeterGMap` and `icosahedronGMap`, which `nonempty_iso_orientationDoubleCover_hemiIcosahedronGMap` (line 962–963) uses.
- In the docstring, delete the 9.4 bullet (line 73–75) and add `coxeterGMap`, `icosahedronGMap` to the "on …" list of the 9.5 bullet.
- In README 9.4 (line 1362–1371), keep every statement as a target in prose. Remove the backticks from the seven deleted names, because the gate's name check requires every backticked name of this roadmap to be declared.

**Tested:** I made a scratch copy of `Suggested.lean` with exactly these deletions and the docstring edit. It elaborates under `lake env lean` with 49 `sorry` warnings and no other message.

## R02 (P3) — The docstring gives the wrong missing carrier for 3.7, 8.2 and 8.4

**Location:** `Suggested.lean` line 89–90: "they lack the projective face poset of 2.5, which needs the rank of a covector." The bullet at line 86–88 gives the same reason for 2.2 and 2.4–2.6.

**Claim:** the rank of a covector is what makes these statements unstatable at the pins. It is not. The real obstruction is the map of 3.7, which cannot be given a real body: its involutions exchange one member of a maximal chain, and they are well defined, and satisfy `involutive` and `commute_of_far`, only by the theorem 3.7 asks to prove. A reader who follows the docstring would define the rank and still be unable to state 8.4.

**Witness:** against the built module, `noncomputable def covectorRank [Finite E] (χ : Chirotope r E) (X : E → SignType) : ℕ∞ := r - χ.matroid.eRk {e | X e = 0}` elaborates. So does the projective relation `SignVector.ConfLE X Y ∨ SignVector.ConfLE (-X) Y`.

**Repair:**
- Replace the reason in line 89–90 with: "the map of a projective arrangement is a `GMap2` only through the theorem of 3.7 that each member of a maximal chain of the projective face poset can be exchanged in exactly one way, so it is a heavy definition kept in the README; 8.4 (ii) also needs GraphConnectivityAndFlows Target 1.1's isomorphisms of `Graph α β`."
- For line 86–88, either delete the bullet (2.2's uniqueness clause and 2.4–2.6 are not among the Summary's end theorems), or define the rank as above and state them.

## R03 (P3) — A Mathlib declaration is credited to GraphConnectivityAndFlows

**Location:** README line 181–183, under "From GraphConnectivityAndFlows": "… and the bridge `toSimpleGraph (Graph.ofSimpleGraph H) ≃ H`, for 8.3 and 8.4."

**Claim:** GraphConnectivityAndFlows Target 1.1 supplies this bridge.

**Witness:**
- The pinned Mathlib has `Graph.toSimpleGraphOfSimpleGraphIso (G : SimpleGraph α) : (toSimpleGraph (ofSimpleGraph G)) ≃g G` at `Mathlib/Combinatorics/Graph/Simple.lean` line 132–133.
- GraphConnectivityAndFlows itself (main, README line 246) proves the bridge "using the existing isomorphism".

**Repair:**
- Delete the bridge clause from the GraphConnectivityAndFlows contract.
- Add `Graph.ofSimpleGraph` and `Graph.toSimpleGraphOfSimpleGraphIso` to the "Graphs" bullet of From Mathlib (line 172–173).
- The isomorphism interface of `Graph α β` correctly stays with Target 1.1: `Mathlib/Combinatorics/Graph/Maps.lean` line 13–14 records that morphisms of `Graph` are not yet defined.

## R04 (P3) — The flag-system targets carry no source locator

**Location:** these subsections name no theorem, section or page:
- 0.3 (line 249–266) and 0.4 (284–294);
- 7.2 (1121–1131), 7.3 (1142–1150) and 7.5 (1176–1184);
- 8.1 (1208–1215);
- 9.1 (1302–1311), 9.2 (1320–1329), 9.4 (1360–1372) and 9.5 (1383–1396);
- the sampled 1.4 (372–380), 5.2 (946–949) and 6.1 (1024–1032).

Vince 1983 and Jones–Singerman 1978 (References, line 1565–1567) are cited by no target.

**Witness:** the sampled targets 7.2, 8.1 and 9.4 had nothing to check against a text. The house rule requires every theorem to have a locator.

**Repair:** add a locator at each claim. These were checked against the text:
- Wilson, *Maniplexes: Part 1: maps, polytopes, symmetry and operators*, Symmetry 4 (2012), 265–275, doi:10.3390/sym4020265, open access. I read it as `wilson2012`.
  - §5, p. 267–270 (`wilson2012` line 110–130, 187–190) covers 0.3 and 8.1. It defines flags with involutions `rᵢ`, the connection (monodromy) group and connectedness as transitivity, and isomorphisms as bijections commuting with every `rᵢ`. It proves that orientability is equivalent to the flag graph being bipartite and to the group of even words not being transitive.
  - §7, p. 272 (`wilson2012` line 263–286) covers 7.3, 9.1–9.2 and Convention 12's `ᵐᵒᵖ`. Automorphisms are the permutations commuting with every `rᵢ`, hence with the connection group. For a flag-transitive system, `αᵢ ↔ rᵢ` extends to an anti-isomorphism between the automorphism group and the connection group.
  - Wilson assumes the `rᵢ` fixed-point-free and pairwise different at every flag. Say that 8.1's argument uses only the absence of fixed darts. The sphere with a loop of 0.3 has `adj 0 = adj 1` and satisfies 8.1: its even group `{1, (03)(12)}` has two orbits, and it is orientable.
- For 0.4, 7.5, 9.4–9.5, 1.4, 5.2 and 6.1, cite the theorem of the text the statement comes from. If Vince 1983 or Jones–Singerman 1978 is that text, cite it at the claim; otherwise delete it from References.

## R05 (P3) — Two Checks misstate their object

**(a) README line 349:** "In rank 2 the full relations are the three-term relations of Convention 2 (one `x`, three `y`)."
- The relation of 1.2 has `r + 1` elements `x` and `r − 1` elements `y`, so rank 2 has three `x` and one `y`.
- Computed with `x = (b, c, d)` and `y = (a)`: `−χ(c,d)χ(b,a) + χ(b,d)χ(c,a) − χ(b,c)χ(d,a) = χab χcd − χac χbd + χad χbc`, which is exactly Convention 2's three terms.
- **Repair:** "(three `x`, one `y`)".

**(b) README line 1219:** "The empty map is orientable (any `S` works)".
- Orientability is 2-colourability of the flag graph (`GMap.IsOrientable`, 0.3). No `S` appears in this definition; the phrase is left over from the earlier SurfaceTopology definition.
- **Repair:** "(its flag graph, with no vertex, is 2-colourable)".

## Previous findings

- **R01 (flag carrier, invariants, double cover and gap taken from SurfaceTopology): repaired.**
  - README line 34–36 now reads "Owned here. Sign vectors, and the flag carrier `GMap n D` on arbitrary dart types with its cells, components, isomorphisms, Euler characteristic, closed-surface predicate, orientability and orientation double cover (Layer 0)".
  - 0.3 and 0.4 are new targets. `Suggested.lean` line 137 declares `structure GMap (n : ℕ) (D : Type*)` on `Equiv.Perm` with real fields.
  - `grep -c SurfaceTopology` gives 0 on both files, and no `gap:` remains.
  - Each sub-item of the repair is done:
    - 8.2 `*Needs:*` is now 0.4, and 9.5 consumes 0.4.
    - The ribbon-graph and classification-of-surfaces contracts are gone.
    - The Summary (line 8–9), Convention 10 and 12, How to read the build (line 195–207), the Layer 8 title and every Dependencies paragraph are rewritten.
    - 7.5, 9.1 and 9.2 are stated in `Suggested.lean` (`GMap.exists_iso_cosetGMap`, `GMap.exists_normal_iso_cosetGMap`, `GMap.nonempty_iso_ofMonodromy` with `[Nonempty D]`, and the others).
  - The gate's `dropped` counter is 0.

## Verified sound

**Gate, order and elaboration.**
- **Brief's gate command** (configured order): every counter 0 except `depcheck=1`, "NOT IN ORDER: PseudolineArrangementsAndOrientedMatroids (insert it after its last supplier)". That line is not a defect.
- **Same gate with `--order` set to the candidate order and `--build`:** `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK`.
- **Dependency check** (`gate --depcheck … --movable`): `depcheck: 230 roadmaps, 2318 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. The folder is at line 397 of the candidate order.
- **Changes outside the folder:** `git diff --stat origin/main...HEAD` outside the folder is empty.
- **Elaboration:** `lake env lean` on `Suggested.lean` exits 0 with 52 warnings, all "declaration uses `sorry`".
- **Binder check:** `#check @name` for all 134 declarations, in one scratch file importing the built module, elaborates with 0 errors. I compared the elaborated types of the new declarations with their README statements; none lost a binder. In particular:
  - `natCard_cell_orientationDoubleCover` keeps `[Finite D]` and `IsClosedSurface`;
  - `isConnected_orientationDoubleCover_iff` keeps `[Nonempty D]` and the no-fixed-dart hypothesis;
  - `isOrientable_iff_not_isPretransitive_evenMonodromy` keeps `[Nonempty D]`, `IsConnected` and `IsClosedSurface`;
  - `isRegular_iff_natCard_aut` keeps `[Finite D] [Nonempty D]`.
- **Auto-bound implicits:** the lakefile leaves `autoImplicit` at Lean's default. A census of every binder name in the 134 elaborated types finds only declared names (`n, D, E, r, W, M, α, m, E', D', B, p, hp, T, G'`), so no auto-bound implicit occurs.
- **`eulerChar` arithmetic:** `#print GMap.eulerChar` shows subtraction in `ℤ`, `↑(Nat.card …) - ↑(Nat.card …) + ↑(Nat.card …)`. The torus value `n² − 3n² + 2n² = 0` is therefore not truncated.
- **One-tactic probe:** every one of the 52 `sorry` was replaced by `first | rfl | simp | infer_instance | trivial | decide`. All 52 fail, at exactly the 52 probe lines.

**Seeded source sample.**
- **3.8:** verified.
  - Kelly–Rottenberg, Pacific J. Math. 40 (1972), MSP open archive (`kellyRottenberg1972` line 191–198): Theorem 3.6 on p. 621 gives at least `3n/7` simple points. The abstract (line 23–31) restricts to arrangements not all through one point; the README's rank 3 excludes pencils.
  - Bokowski–Pokora, arXiv:1607.05864v4 (`bokowskiPokora2018` line 86–94): Theorem 1.3 is Melchior's equality for essential arrangements of `n ≥ 3` pseudolines, and Corollary 1.4 gives `t₂ ≥ 3`.
  - The README route follows: `1 = f₀ − f₁ + f₂ ≤ f₀ − f₁/3` from `2f₁ ≥ 3f₂`, so `∑(3 − ν(v)) = 3f₀ − f₁ ≥ 3`.
- **4.5:** verified in Felsner–Goodman, Handbook ch. 5, from the editor's page (`felsnerGoodman2017`).
  - Theorem 5.4.5, p. 139 (line 654–656): every pseudoline borders at least 3 triangles, for `n ≥ 3`. The glossary (line 40) excludes pencils from "arrangement".
  - Table 5.6.1, p. 146 (line 957): `1, 1, 1, 4` simple arrangements for `n = 3, …, 6`, which is 4.6.
  - Theorem 5.1.1, p. 126 (line 84–87): Levi's enlargement lemma for points not on a common member, which is 5.3's second clause.
- **9.6 "Not a target":** AHOS Theorem 3.1, p. 9 (`ahos2013` line 298–303), with "finite connected simple graph" at line 78. The README says "simple" and gives `K₄` → hemicube (line 305–307).
- **Sampled targets without a source locator (R04):** 1.4, 5.2, 6.1, 7.2, 8.1 and 9.4. Their Checks and statements were computed instead (table).
- **Sampled targets with paywalled locators (see Not verifiable):** 0.1, 1.7, 2.4, 2.6, 5.1 (BLSWZ) and 9.6 (Coxeter–Moser §8.4).
- **0.2:** elementary; its Checks were computed.

**Library declarations opened at the pins.**
- **Mathlib, Coxeter groups:**
  - `CoxeterMatrix.B` (`GroupTheory/Coxeter/Matrix.lean` 122–128): the `4` sits at `(n−1, n−2)`, i.e. `(2, 1)` for `n = 3`, so `B 3` has type `{3,4}`.
  - `CoxeterMatrix.H₃` (260–263) and `CoxeterMatrix.reindex` (90–96, entries `M (e.symm i) (e.symm j)`).
  - `CoxeterSystem.simple_mul_simple_pow` (`Basic.lean` 226), `CoxeterMatrix.IsLiftable` (296) and `CoxeterSystem.lift` (330). Mathlib has no lemma that commutes two simple reflections with entry `2`, so `commute_simple_of_eq_two` is not a duplicate.
- **Mathlib, graphs:**
  - `SimpleGraph.IsBipartite` (`Bipartite.lean` 288) is an abbreviation for `Colorable 2`, so `GMap.IsOrientable` agrees with it.
  - `Graph.Simple` (`Graph/Simple.lean` 76), `Graph.toSimpleGraph` (100), `Graph.ofSimpleGraph` (119) and `Graph.toSimpleGraphOfSimpleGraphIso` (132, R03).
  - `Graph/Maps.lean` 13–14: graph morphisms are not yet defined.
- **Mathlib, other:** `crossProduct` (`CrossProduct.lean` 47) and `Matroid.dual` (`Dual.lean` 109).
- **Tau Ceti:**
  - `TauCeti.PermutationTriple` (`Combinatorics/PermutationTriple/Basic.lean` 76), `automorphismGroup_eq_centralizer_monodromyGroup` (526), `automorphismGroupMulEquivMonodromyGroupMulOpposite` (`Regular.lean` 253–254, `≃* t.monodromyGroupᵐᵒᵖ`). Convention 12's "as in Tau Ceti's `PermutationTriple`" is accurate.
  - `TauCeti.BipartiteRibbonGraph` (`RibbonGraph/Basic.lean` 49).
  - A grep of both pins for `GMap`, cartographic, flag graph, chirotope, pseudoline, oriented matroid and signotope finds only the unrelated `DGMap`/`FGMap` identifiers.

**Cross-roadmap citations, all on main (f2eaf12).**
- **RootSystems** (`TauCetiRoadmap/RepresentationTheory/RootSystems/README.md`): Layer 1 at line 428, §1.3 at 515, `geometric_faithfulness` at 517 (`Suggested.lean` 73), the `Finsupp.linearEquivFunOnFinite` transport at 539, and Layer 2 at 614.
- **GraphConnectivityAndFlows** Target 1.1: README line 224, with the isomorphism interface at 230.
- **No consumer:** no roadmap on main cites this one.
- **Citations tool:** reports no cross-roadmap citation found nowhere. All 65 Lean-name leads are this roadmap's own names, declared in `Suggested.lean`.

**Ownership and overlaps.**
- **Overlaps tool:** no open pull request changes this roadmap; no id is dropped in either direction; and no cited id is defined only by an open revision.
- **`roadmaps grep` hits:**
  - `GMap`, "generalized map", "orientation double cover" and "cartographic group" hit only:
    - SurfaceTopology (#271), which also builds `GMap` but is on the never-cite list, so ownership here is the only admissible settlement;
    - Orbifolds on main, whose generalized maps are morphisms of orbifolds;
    - mentions of SurfaceTopology in the BelyiMaps and GeometricTopology revision, which own nothing here.
  - "flag system", "chirotope", "pseudoline", "oriented matroid", "signotope", "abstract polytope" and "string C-group" hit only this pull request.

**Headline theorems (README Summary) and their status in `Suggested.lean`.**
- Stated:
  - 0.4: the three double-cover theorems;
  - 2.2 `exists_orientedMatroid_covectorsOf`;
  - 2.3 `three_le_ncard_walls`;
  - 3.8 (a) `exists_isFlat_ncard_eq_two`;
  - 3.5 `range_signAt`, `isPathConnected_cell`;
  - 3.6 `exists_monotoneArrangement`;
  - 4.4 `isSignotope_iff_exists_monotoneArrangement`;
  - 4.5 `reflTransGen_mutationStep`;
  - 5.3 `levi_enlargement`;
  - 6.1 `isRealizable_iff_exists_ofLines`;
  - 6.3: the three non-Pappus theorems;
  - 7.5 `exists_iso_cosetGMap`, `nonempty_iso_cosetGMap_iff`;
  - 9.1 `exists_normal_iso_cosetGMap`, `nonempty_mulEquiv_aut_cosetGMap`;
  - 9.5: the hemi-icosahedron;
  - 9.6 `card_torusGroup`, `cellNumbers_torusGMap`.
- Not stated: 8.4 (i)–(ii), named in the docstring. Its stated reason is R02.
- No statable headline is absent.

**Adversarial table.** Every value below was computed this round, except where a row says it is carried. Covector, flag-system, signotope, torus and Pappus values come from short enumeration scripts in the scratch directory.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 0.1 compose, sep, ConfLE (sampled) | `X = (+,0)`, `Y = (−,+)`; `0` vs `(−,−)`; `(−,0)` vs `(0,0)`; reorientation on `{e₁}` | `X∘Y = (+,+)`, `Y∘X = (−,+)`; `sep X Y = sep Y X = {e₁}`; `0 ≤ᶜ (−,−)` true but pointwise false; `(−,0) ≤ (0,0)` pointwise true but `≤ᶜ` false; both routes give `(−,+)` | sound | none |
| 0.2 restriction and extension (sampled) | `E' = {e₁}` | `(+,−) ↦ (+) ↦ (+,0) ≠ (+,−)`; `(0,0) ∘ (−,0) = (−,0)`; extension by `+` gives `(−,+)` vs `(−,−)` | sound | none |
| 0.3 cells and orientability | projective plane on 4 darts; `adj 1 := adj 0`; `adj 0 = adj 2`; one dart; empty | `(1,1,1)`, `χ = 1`, flag graph `K₄` with triangle `0,1,3`, not orientable; `(1,1,2)`, `χ = 2`, 4-cycle, orientable; `(1,2,1)`, not a closed surface; one dart: `(1,1,1)`, orientable, not closed; empty: `(0,0,0)` | sound | none |
| 0.4 `isOrientable_orientationDoubleCover` | any `G` | colouring by the `Bool` coordinate; every `adj i` flips it | sound | none |
| 0.4 `isConnected_orientationDoubleCover_iff` | projective plane; sphere with a loop; one dart; empty | cover of the projective plane has 1 component; cover of the sphere has 2; one dart: `G` connected and orientable, yet its cover is connected (so `hfix` is needed); empty: same (so `Nonempty` is needed); proof: odd closed walk and transitivity, plus the invariant `c(d) xor b` | sound | none |
| 0.4 `natCard_cell_orientationDoubleCover` | projective plane; sphere with a loop; `adj 0 = adj 2`; one dart | `(2,2,2)`; `(2,2,4)`; `(2,4,2)`; one dart stays at `(1,1,1)` (fixed darts break doubling) | sound; the `adj 2 ≠ adj 0` clause is not needed (note only) | none |
| 1.2 rank-2 Check | `r = 2` | 3 `x`, 1 `y`; the terms match Convention 2 | Check wrong | R05 |
| 1.4 `isChirotope_ofVectorsFun` (sampled) | `(1,0),(0,1),(1,1),(1,2)`; `v = 0`; `r = 0` | minors `1,1,1,−1,2,−1`, `1 + 1 − 2 = 0`, signed terms `1, 1, −1`; `v = 0` gives the zero function; `r = 0`: `det` of the empty matrix is `1` | sound; no locator | R04 |
| 1.7 simplification (sampled) | `(1,0,0),(2,0,0),(0,1,0),(0,0,1),(0,0,0)`; rank 0 | classes `{1,2},{3},{4}` and loop `5`; rank 0: all loops, simple chirotope on `∅` is `±1` | sound | none |
| 2.2 `covectorsOf` | alternating on 5; rank-2 example; three independent | `83 = 1 + 20 + 40 + 22`; 13 covectors with 6 topes; 27 | sound | none |
| 2.3 `three_le_ncard_walls` | alternating on 5; `(1,0,0),(2,0,0),(0,1,0),(0,0,1)` | wall counts 10×3, 10×4, 2×5; triangles 123, 125, 145, 234, 345; non-simple: 8 topes, all with 2 walls | sound | none |
| 2.4 face lattice (sampled) | nine vectors; `{0, X, −X}` | `0 < (+,0) < (+,+) < ⊤` has length 3 `= r + 1`; `0 < X < ⊤` has length 2; lower interval of `(+,+)` has 4 elements and no `±` pair | sound | none |
| 2.6 Euler relation (sampled) | alternating on 5; rank 2 on 2 elements; rank 1; `r = 0` | `20 − 40 + 22 = 2`; `4 − 4 = 0`; `2 = 1 + 1`; `r = 0` gives `0` against `1 + (−1)^0 = 2`, so `r ≥ 1` is needed | sound | none |
| 3.5 `range_signAt` | three lines of 3.1 | 19 covectors with `none = 1`; `(+,−,+,+)` in, `(−,+,−,+)` out; 12 cocircuits: 6 with `0`, 3 with `1`, 3 with `−1` at `none` | sound | none |
| 3.8 (a) Sylvester–Gallai (sampled) | three independent; plus a loop; sources | flats are the pairs; with a loop every rank-2 flat has 3 elements; Melchior `3f₀ − f₁ ≥ 3`; Kelly–Rottenberg 3.6 and Bokowski–Pokora 1.3/1.4 read | sound | none |
| 4.3–4.4 wiring diagrams and Felsner–Weil | `m = 3, 4, 5` | signotopes 2, 8, 62; equal to the sets read off all 2, 16, 768 words; commutation classes 2, 8, 62 | sound | none |
| 4.5 flips and Levi (sampled) | alternating on 5; near-pencil on 4 | 0 three-term violations at the five triangles, 7200 at each other triple; `{1,3,5}` gives terms `+,+,+`; source Theorem 5.4.5; near-pencil walls `4, 4, 4, 6` | sound | none |
| 5.1 localization (sampled) | `(1,0),(0,1)`, `none = (1,1)` | `(0,+,+)` and `(−,0,−)`; localization `1, −1`, odd, nowhere `0` | sound | none |
| 5.2 parallel extension (sampled) | `v none = ±v e`; `e` a loop | `Y ↦ Y e` and `Y ↦ −Y e`; loop: localization `0` | sound; no locator | R04 |
| 6.1 stretchability (sampled) | `GL₃` normalisation; `y = 0`, `y = 1` | send `v none` to `(0,0,1)`; a rotation makes every first coordinate nonzero; rescale by `−1/x` (a reorientation); the sign of `det` is absorbed by reorienting on `univ` (`r = 3` odd); parallel lines give `det 0` | sound; no locator | R04 |
| 6.2–6.3 Pappus and non-Pappus | `pappusPoints`; degenerate `A`; `det A = 2` | `C = (13,2,5),(15,3,8),(2,1,3)`, `det 0`; `(15,3,6),(15,3,8),(0,0,2)`, `det 0`; `−60`; exactly 9 collinear triples | sound | none |
| 7.2 `exists_monoidHom_stringCoxeterMatrix_iff` (sampled) | `n = 0`; `p i = 0`; tetrahedron | `n = 0`: right side vacuous, `ψ(s₀) = adj 0` exists; `x⁰ = 1`; type `(3,3)` factors through `A 3` | sound; no locator | R04 |
| 7.3 surjectivity, freeness, bound | empty; `Bool` swap; `Fin 3` with swap 01 | 1 automorphism vs 0 flags; `2 = 2`; `2 < 3` | sound | none |
| 7.5 classification | `H = ⊤`; `H = ⊥`; empty; conjugate subgroups | 1 flag; the regular action; no subgroup; transitive `G`-sets `G/H ≅ G/K` iff conjugate | sound | none |
| 8.1 even monodromy (sampled) | projective plane; tetrahedron; sphere with a loop; one dart; empty | odd closed walk `0,1,3`, so the even part is transitive; 2 orbits of 12; even group `{1,(03)(12)}` with 2 orbits, orientable; one dart: orientable and transitive (so `hS` is needed); empty (so `Nonempty` is needed) | sound; Check wording | R05, R04 |
| 9.1 regular flag systems | empty; tetrahedron; four lines | 1 automorphism, 0 flags; `24 = 24`; 48 flags, 24 automorphisms | sound | none |
| 9.2 `ofGroup` | group of order 4, `ρ` constant at an involution | index 2, two components | sound | none |
| 9.4 Platonic maps (sampled) | `B 3` entry `(1,2) = 4`; `revPerm` | vertex stabilisers 6, 8, 10 give `4, 6, 12` vertices; `(4,6,4)`, `(6,12,8)`, `(8,12,6)`, `(12,30,20)`, `(20,30,12)` | values sound; padding | R01, R04 |
| 9.5 hemi-icosahedron | `H₃/Z` | `60/10 = 6`, `60/4 = 15`, `60/6 = 10`, `χ = 1`; `w₀` has odd length 15, so not orientable; cover isomorphism `g ↦ (gZ, parity g)` | sound | none |
| 9.6 torus (sampled) | `n = 2, 3, 4, 5` | orders 24, 108, 192, 300; `(3,3,2)` at `n = 2`, `(3,6,2)` for `n ≥ 3`; cells `(9,27,18)`, `(16,48,32)`, `(25,75,50)`; linear parts have `det −1 ≠ 1` for `n ≥ 3`, so orientable | sound | none |
| Docstring line 86–90 | `covectorRank` one-liner | elaborates at the pins | wrong reason | R02 |
| Contract line 181–183 | `Graph.toSimpleGraphOfSimpleGraphIso` | present at `Graph/Simple.lean` 132 | duplicated | R03 |
| 10.1–10.2 faithfulness (carried from r8) | `n = 2`, `M = (0,0,2)`; `n = 0` | Gram `[[1,−1,0],[−1,1,−1],[0,−1,1]]`; `(s₀s₁)ᵏα₀` unbounded; `n = 0` acts by `[−1]` | sound | none |

## Not verifiable

- **BLSWZ, *Oriented Matroids*** (§3.4–§3.7, §4.1, §4.6, Proposition 7.1.4, Theorem 7.1.8): cited for 0.1, 1.7, 2.4, 2.6 and 5.1. No legal copy found; the publisher (CUP) is paywalled. Those targets were checked by computing their Checks instead.
- **Coxeter–Moser §8.4** (9.6; Springer), **McMullen–Schulte §2A and Theorem 2E11** (9.3; CUP), **Humphreys §5.4–§5.5** (9.3, 10.1; CUP): paywalled.
- **Ringel 1956, Roudneff–Sturmfels 1988, Levi 1926, Goodman–Pollack 1980/1984, Felsner–Weil 2001, Björner–Edelman–Ziegler 1990:** paywalled journal articles. They are cited by author and year only; Levi's two lemmas were checked through Felsner–Goodman Theorems 5.1.1 and 5.4.5.
- **Vince 1983:** the sources service resolves the DOI only to a paywalled page.
- **Jones–Singerman 1978:** paywalled.
- **Grothendieck, *Esquisse d'un programme*:** no copy on a host the sources service accepts as legal. So Convention 10's "Grothendieck's `n`-cartes are exactly these objects" is unchecked. If the Esquisse defines `n`-cartes as finite or connected, the word "exactly" overclaims for `GMap n D` on an arbitrary `D`.
- **Ownership against open pull requests** was checked with the overlaps tool and `roadmaps grep`, as listed above.

## Source issues

- none
