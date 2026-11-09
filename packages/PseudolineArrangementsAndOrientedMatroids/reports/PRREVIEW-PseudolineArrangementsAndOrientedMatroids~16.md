# Review of PseudolineArrangementsAndOrientedMatroids (pull request #1523 at f542605)

**Verdict:** needs changes

This is a full review of the head, not an incremental one.

- **Previous review (of c46e43d):** six of its seven findings are repaired. R04 is partly repaired: the References entry for Grothendieck's folder 80 is still missing, and it is carried into R03 below.
- **Gate:** passes, apart from the `NOT IN ORDER` line, which is expected. The dependency check reports 0 problems.
- **Lean:** `Suggested.lean` elaborates with 51 warnings, all `sorry`, and no binder is lost.
- **Mathematics:** every headline statement I tested holds.
- **Findings:** five, all P3. None of them is blocking:
  - one lemma re-proves a Tau Ceti declaration;
  - three statements differ in generality between the README and the Lean file;
  - locators are missing at four sampled targets;
  - two Checks misstate their objects;
  - two *Needs:* lines are incomplete.

## R01 (P3) — `commute_simple_of_eq_two` re-proves a Tau Ceti lemma, and 7.5 leaves its orbit–stabiliser input uncited

**Location:**
- `TauCetiRoadmap/PseudolineArrangementsAndOrientedMatroids/Suggested.lean` line 684–691: "theorem commute_simple_of_eq_two … (h : M i j = 2) : Commute (cs.simple i) (cs.simple j)".
- It is used at lines 723, 866 and 892.
- README 7.1 line 1252–1253 lists it as proved here.
- 7.5 (line 1328–1330) uses "the correspondence between transitive actions and conjugacy classes of stabilizers" without naming it.

**Claim:** the lemma is new here, and 7.5's input has no owner.

**Witness:**
- Tau Ceti `CoxeterSystem.commute_simple_of_eq_two` (`TauCeti/GroupTheory/Coxeter/Basic.lean` line 113) has the same hypothesis `M i i' = 2` and the same conclusion.
- Tau Ceti `MonoidHom.quotientComapStabilizerEquiv` (`TauCeti/GroupTheory/GroupAction/Transitive.lean` line 156) gives `G ⧸ (stabilizer x).comap ρ ≃ X` for a transitive `ρ : G →* Perm X`, which is 7.5's input with `ρ = GMap.monodromyHom`.

**Repair:**
- **In `Suggested.lean`:**
  - delete lines 684–691;
  - add `public import TauCeti.GroupTheory.Coxeter.Basic` after line 3;
  - write `(CoxeterSystem.commute_simple_of_eq_two _ (stringCoxeterMatrix_of_far h)).map φ` at line 723, `cs.commute_simple_of_eq_two (hM i j h)` at line 866, and `CoxeterSystem.commute_simple_of_eq_two _` at line 892;
  - drop the name from docstring line 58.
- **In README 7.1:** replace "and that two simple reflections with entry `2` commute (`commute_simple_of_eq_two`)" with "; two simple reflections with entry `2` commute by Tau Ceti's `CoxeterSystem.commute_simple_of_eq_two`".
- **In 7.5:** add `MonoidHom.quotientComapStabilizerEquiv` to the *Needs:* line.
- **Supplier contracts:** add both names, with their files, under "From Tau Ceti".

**Tested:** a scratch copy with these edits elaborates with exit 0 and 51 warnings, all `sorry`.

## R02 (P3) — Three statements whose README and Lean generality differ

**Location and witness:**

- **(a) 10.2.**
  - README line 1635–1636 says that `geometricRepresentationFun_cartographic_injective` makes "the cartographic group and every string Coxeter group act faithfully".
  - `Suggested.lean` line 957–960 states it only for `stringCoxeterMatrix n 0 _`, so the string Coxeter groups with `p i ≠ 0` (H₃, say) are not covered.
- **(b) 6.3.**
  - README line 1186: "Prove `isChirotope_nonPappusFun` (it is a simple rank-3 chirotope)".
  - `Suggested.lean` line 622 states only `IsChirotope nonPappusFun`.
- **(c) 9.1.**
  - `Suggested.lean` line 795 and README line 1456–1457 put `[Finite D] [Nonempty D]` on "regular ↔ the automorphism group acts transitively".
  - Neither binder is needed. If `Aut` is transitive and `g ∈ monodromy` fixes `d`, then `g` fixes every `σ d`, so `g = 1`. Conversely, a free transitive action gives right translations.
  - Witnesses: `cosetGMap ⊥` for `n ≥ 1` is infinite and regular, and its automorphism group (right multiplications) is transitive. On the empty type both sides hold.

**Repair:**

- **(a)** Replace the theorem with the following, and rename it in docstring line 76 and README line 1635:

  ```lean
  theorem geometricRepresentationFun_stringCoxeterMatrix_injective (n : ℕ) (p : Fin n → ℕ)
      (hp : ∀ i, p i ≠ 1) :
      Function.Injective (geometricRepresentationFun (stringCoxeterMatrix n p hp).toCoxeterSystem) :=
    sorry
  ```

- **(b)** Read "(it is a rank-3 chirotope; its nine points are pairwise non-proportional, so it is simple)".
- **(c)**
  - Drop `[Finite D] [Nonempty D]` from `isRegular_iff_isPretransitive_aut`.
  - Make README 9.1 read "for connected ones, regular ↔ the automorphism group acts transitively, and, for finite ones with `Nonempty D`, ↔ it has `Nat.card D` elements".
  - Make the first 9.1 Check read "the second iff needs `Nonempty D`".

**Tested:**
- The scratch copy of R01, with (a) and (c) applied, elaborates with 51 `sorry` warnings and no error.
- (a) at `p = 0` is the old statement.
- (b) was checked by enumeration: the nine points are pairwise non-proportional (table, 6.3).

## R03 (P3) — Locators missing at the sampled targets 4.2, 4.5, 5.4 and 7.1; folder 80 still has no References entry

- **4.2** (lines 913–919) has no locator.
  - **Repair:** add "(Felsner–Goodman 2017, §5.1, p. 126, wiring diagrams; §5.2, p. 132, a simple allowable sequence is a reduced decomposition of the reverse permutation; p. 133, the wiring diagram drawn from an allowable sequence)".
  - **Tested:** felsnergoodman2017 line 66–69, 356–359 and 362–373.
- **4.5** (lines 989–1000):
  - Levi's triangle theorem cites Theorem 5.4.5 with no page. **Repair:** add "p. 139" (felsnergoodman2017 line 654–656).
  - `isChirotope_flipFun` cites only "(Ringel 1956)". **Repair:** add "Felsner–Goodman 2017, p. 133, the triangle flip" (line 379–381).
  - `exists_triangle_of_flipFun` cites "(Roudneff–Sturmfels 1988)" with no theorem. **Repair:** give its theorem and page, recorded `uncertified` if paywalled.
  - **References:** the Roudneff–Sturmfels entry lacks pages. Add "153–170".
- **5.4** (lines 1095–1101): only the lexicographic extension has a locator (BLSWZ §7.2). "Its maximal elements are the localizations without zeros" and "every position lies below a generic one" have none.
  - **Repair:** give their locator in BLSWZ (uncertified), or a route. In rank 3 this is perturbing the new pseudoline off each vertex it passes through.
- **7.1 and Convention 10** (line 142–143): "Grothendieck's `n`-cartes are exactly these objects" and the cartographic group have no locator. The *Esquisse* is cited only in References ("§§2–3").
  - **Repair:** cite it at Convention 10 and at 7.1, with the section and page where `n`-cartes and the cartographic group are defined.
- **Research context** (line 1672–1675): folder 80 is still cited without a References entry. This is the open part of the previous R04.
  - **Repair:** add "A. Grothendieck, manuscript notes on pseudoline arrangements, Université de Montpellier, fonds Grothendieck, folder 80, https://grothendieck.umontpellier.fr/80.pdf".

## R04 (P3) — Two Checks misstate what they compute

- **3.5** (line 751–752): "twelve cocircuits: six with `X none = 0` … and three with `X none = 1`" adds up to 9.
  - **Witness:** the enumeration of `covectorsOf` of the lines of 3.1 gives 12 cocircuits: 6 with value 0, 3 with value 1 and 3 with value −1 at `none`.
  - **Repair:** append "and their three negatives, with `X none = -1`".
- **8.4 (ii)** (line 1438): "48 label-compatible automorphisms (`S₃ × (ℤ/2)³`)".
  - **Witness:** `S₃` permutes the three parallel pairs, so the group is the wreath product `(ℤ/2)³ ⋊ S₃ ≅ ℤ/2 × S₄`. Its centre has order 2, while the centre of `S₃ × (ℤ/2)³` has order 8.
  - **Repair:** "(the wreath product of `ℤ/2` by `S₃`)". The count 48 is unchanged.

## R05 (P3) — Two *Needs:* lines miss targets that their statements use

- **3.7** (line 790): *Needs:* "0.3, 2.5, 2.6". The statement uses relabelling and reorientation (1.5) and "chirotopes up to reorientation" (1.6).
  - **Repair:** "0.3, 1.5, 1.6, 2.5, 2.6".
- **4.5** (line 1001): Levi's triangle theorem counts "triangular cells of the projective face poset" (2.5), which is not listed.
  - **Repair:** add 2.5.

## Previous findings (review of c46e43d)

| Finding | Status | Evidence at this head |
|---|---|---|
| R01 | repaired | Line 1210–1214: "The generic extension of 5.5 that serves as the line at infinity has to be chosen …". The Check at line 1224–1228 is on `S` minus a line. |
| R02 | repaired | Convention 8 (line 128–136) and 4.3 (line 934–944) cite `TauCeti.braidEquivalent_of_isReduced_wordProd_eq`. The contracts are at line 189–195, and line 210–212 is corrected. No `Wiring.wordProd`, `IsWiringDiagram`, `CommutationStep`, `BraidStep` or `reflTransGen_of_isWiringDiagram` is left in `Suggested.lean`. |
| R03 | repaired | `exists_monotoneArrangement_of_isSimple` is at `Suggested.lean` line 592–596, in README 5.5 (line 1117), in the Summary (line 17–19) and in docstring line 52. The docstring bullet is shortened (line 89). |
| R04 | partly | 1.4 (line 414–416), 4.1 (line 891–897), 4.4 (line 962–964, 972), 7.4 (line 1310–1311) and Streinu (line 1700) are added. Folder 80 has no References entry; see R03. |
| R05 | repaired | Line 460–463: "For simple rank-3 chirotopes, reorientation classes correspond to …". |
| R06 | repaired | `grep eulerChar` finds nothing in either file. |
| R07 | repaired | `SimpleGraph.bipartiteDoubleCover` is in 0.4 (line 321–323, 329) and in the contract (line 183). The Tau Ceti triangle groups are in 9.4 (line 1520–1524, 1531–1532), 9.5 (line 1548–1550, 1559–1560) and the contract (line 196–199). |

## Verified sound

### Gate, order and Lean

- **Brief's gate command:** every counter is 0 except `depcheck=1`, which reads "NOT IN ORDER: PseudolineArrangementsAndOrientedMatroids (insert it after its last supplier)". That is not a defect before placement. The worker's gate at this head has `build=0`.
- **Dependency check** (`--order merge-order-candidate.txt --movable`): `depcheck: 237 roadmaps, 2282 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.
- **Outside the folder:** `git diff --stat origin/main...HEAD` outside the folder is empty.
- **Elaboration:** `lake env lean` on `Suggested.lean` exits 0 with 51 warnings, all "declaration uses `sorry`" (51 sorried theorems).
- **Binders:** `#check @name` for all 123 declarations, in one scratch file importing the built module, elaborates with exit 0. Each type was compared with its README statement. No binder is lost:
  - `isConnected_orientationDoubleCover_iff` keeps `[Nonempty D]` and `hfix`;
  - `natCard_cell_orientationDoubleCover` keeps `[Finite D]` and `hS`;
  - `isOrientable_iff_not_isPretransitive_evenMonodromy` keeps `[Nonempty D]`, `hG` and `hS`;
  - `natCard_aut_le` keeps `[Finite D] [Nonempty D]`;
  - `isChirotope_ofVectorsFun` keeps `[IsStrictOrderedRing 𝕜]` and the span hypothesis;
  - the 6.4 theorems keep `[Finite E]`, `IsSimple` or `IsUniform`, and the bound 8.

  The only differences from the README are R02.
- **One-tactic probe:** every `sorry` was replaced by `first | rfl | (simp; done) | infer_instance | trivial | (norm_num; done) | omega | (aesop; done) | decide`. All 51 theorems fail, at 51 distinct lines. `exact?` was not run.
- **Headlines:** every end theorem of the Summary is stated, except 3.7, 8.2 and 8.4, which the docstring names with their missing carrier (the map of a projective arrangement is a heavy definition). The 9.5 and 9.6 computations stay as headlines, as earlier rounds settled.

### Seeded sample (15 targets)

| Target | Locator | Result |
|---|---|---|
| 1.2 | BLSWZ Def. 3.5.3, Lemma 3.5.4 | not readable. The three-term form agrees with richtergebertziegler2017 line 371–384 ((CHI1)–(CHI2), p. 167). |
| 2.5 | RGZ Thm 6.2.4, p. 169; FG §5.1, p. 126 | ✓ richtergebertziegler2017 line 463–468; felsnergoodman2017 line 47–50 |
| 2.6 | FG Thm 5.4.1, p. 138 | ✓ line 581–583. BLSWZ §4.6 is not readable. |
| 3.5 | RGZ Thm 6.2.4, first half | ✓ line 465–466 (arrangement → covectors) |
| 4.2 | none | R03; supporting text at felsnergoodman2017 line 66–69 and 356–373 |
| 4.5 | FG Thm 5.5.8, p. 145; Thm 5.4.5 | ✓ line 924–928 (simple arrangements, triangle flips). Thm 5.4.5 (line 654–656) is on p. 139 and holds for every arrangement of `n ≥ 3` pseudolines (not a pencil, line 40), matching "simple chirotope". The page and the R–S locator are missing (R03). |
| 5.4 | BLSWZ §7.2 | not readable; R03 |
| 5.5 | RGZ Thm 6.2.4, p. 169 | ✓ line 466–468 (without loops, which "simple" covers). The monotone form comes from 3.6. |
| 6.2 | FG §5.3, p. 134 | ✓ line 437–442, which is where Pappus makes the arrangement non-stretchable, as the README says |
| 7.1 | none | R03 |
| 7.5 | Wilson §5, p. 270 | ✓ wilson2012 line 175–179 (transitive actions of Coxeter string groups) |
| 9.1 | Wilson §7, p. 272 | ✓ line 269–270 (reflexible = `Aut` transitive) and 282–286 (antimorphism) |
| 9.2 | Wilson §7, p. 272 | ✓ as 9.1 |
| 9.4 | Coxeter–Moser Ch. 8; McMullen–Schulte 2E11; Wilson §7 | Wilson ✓ line 277–281 (types; dodecahedron `{5,3}`). The books are not readable. |
| 9.5 | Coxeter–Moser; McMullen–Schulte | not readable; mathematics checked in the table |

**Other locators read:**
- **1.6:** p. 126 (line 49–50) and p. 131 (line 297–307).
- **4.1:** Thm 5.2.1, p. 129 (line 211–218), with conditions (i)–(iii) as described.
- **6.4:** Thm 5.3.2–5.3.3, p. 135 (line 456–462), and p. 130 (line 234–236).
- **4.3:** p. 133 (line 382–387).
- **4.6:** Table 5.6.1 (line 957 gives 1, 1, 1, 4; line 959 gives 2, 8, 62 for the Euclidean counts).
- **0.3, 0.4, 7.2, 8.1:** Wilson §5 (line 110–136, 173–190), including fixed-point-free, pairwise different `rᵢ` (line 115–116), as 8.1 says.

### Library declarations opened at the pins

Pins: Mathlib `1b1ccf4`, Tau Ceti `2fd255d`.

**Tau Ceti:**

| Declaration | File | Line |
|---|---|---|
| `CoxeterSystem.commute_simple_of_eq_two` | `GroupTheory/Coxeter/Basic.lean` | 113 |
| `MonoidHom.quotientComapStabilizerEquiv` | `GroupTheory/GroupAction/Transitive.lean` | 156 |
| `TauCeti.braidEquivalent_of_isReduced_wordProd_eq` | `GroupTheory/Coxeter/Matsumoto.lean` | 83 |
| `CoxeterSystem.IsBraidMove` | `GroupTheory/Coxeter/BraidEquivalence.lean` | 56 |
| `CoxeterSystem.BraidEquivalent` | `GroupTheory/Coxeter/BraidEquivalence.lean` | 63 |
| `CoxeterSystem.BraidEquivalent.wordProd_eq` | `GroupTheory/Coxeter/BraidEquivalence.lean` | 180 |
| `TauCeti.permCoxeterSystem` (on `CoxeterMatrix.A (n - 1)`, so `n + 1` gives `A n`) | `GroupTheory/Perm/Coxeter.lean` | 195 |
| `TauCeti.permCoxeterSystem_wordProd` | `GroupTheory/Perm/Coxeter.lean` | 213 |
| `TauCeti.permCoxeterSystem_length_eq_card_inversion` | `GroupTheory/Perm/Coxeter.lean` | 293 |
| `TauCeti.BraidGroup.transposition` (`i : Fin (n - 1)`) | `GroupTheory/SpecificGroups/Braid/Basic.lean` | 264 |
| `TauCeti.TriangleGroup` (a presented group) | `GroupTheory/TriangleGroup/Basic.lean` | 80 |
| `TauCeti.TriangleGroup.natCard_two_three_three` | `GroupTheory/TriangleGroup/Polyhedral.lean` | 404 |
| `TauCeti.TriangleGroup.natCard_two_three_four` | `GroupTheory/TriangleGroup/Polyhedral.lean` | 414 |
| `TauCeti.TriangleGroup.natCard_two_three_five` | `GroupTheory/TriangleGroup/Polyhedral.lean` | 424 |
| `TauCeti.TriangleGroup.equivIcosahedral` | `GroupTheory/TriangleGroup/Polyhedral.lean` | 460 |
| `CoxeterMatrix.geometricForm` | `GroupTheory/Coxeter/Geometric.lean` | 125 |
| `CoxeterMatrix.geometricReflection` | `GroupTheory/Coxeter/Geometric.lean` | 161 |
| `CoxeterMatrix.isLiftable_geometricReflection` | `GroupTheory/Coxeter/Geometric.lean` | 458 |
| `CoxeterSystem.geometricRepresentation` | `GroupTheory/Coxeter/Geometric.lean` | 479 |
| `CoxeterSystem.geometricRepresentation_simple` | `GroupTheory/Coxeter/Geometric.lean` | 485 |
| `CoxeterSystem.orderOf_simple_mul_simple` | `GroupTheory/Coxeter/Geometric.lean` | 525 |
| `CoxeterSystem.orderOf_simple` | `GroupTheory/Coxeter/Geometric.lean` | 553 |
| `TauCeti.BipartiteRibbonGraph` | `Combinatorics/RibbonGraph/Basic.lean` | 49 |
| `TauCeti.PermutationTriple` | `Combinatorics/PermutationTriple/Basic.lean` | 76 |

**Mathlib:** 51 contract names (`Matroid.restrictSubtype`, `Matroid.restrict_closure_eq`, `Graph.toSimpleGraphOfSimpleGraphIso`, `SimpleGraph.bipartiteDoubleCover`, `CoxeterMatrix.reindex`, `LinearEquiv.conjAlgEquiv`, …) were `#check`ed in one file, which exits 0. The rest (`SignType`, `Submodule.span`, `Subgroup.closure`, `Subgroup.center`, `ZMod`, …) occur in the elaborated `Suggested.lean`. Evaluated entries:
- `(CoxeterMatrix.B 3).M 1 2 = 4` (so `B 3` is the octahedron, as 9.4's Check says);
- `CoxeterMatrix.H₃.M 0 1 = 3` and `M 1 2 = 5`;
- `(CoxeterMatrix.A 3).M 0 1 = 3`.

### Cross-roadmap citations (main at db5e748)

- **RootSystems §1.3:** at `TauCetiRoadmap/RepresentationTheory/RootSystems/README.md` line 515. `geometric_faithfulness` is in its `Suggested.lean` line 73, for every `CoxeterSystem` on an arbitrary index type, and the transport through `Finsupp.linearEquivFunOnFinite` is stated there ✓.
- **GraphConnectivityAndFlows Target 1.1:** at its README line 224 ✓.
- **BelyiMaps:** Layer 4 is triangle groups (its line 1325) ✓.
- **ConformalMapping:** `Completed`, with `TauCeti.IsJordanCurve` used at the pin ✓.

### Ownership and overlaps

- **Overlaps tool:** no other open pull request changes this roadmap, and no id is dropped in either direction.
- **Same objects:** `roadmaps grep` for chirotope, oriented matroid, pseudoline, signotope, wiring diagram, maniplex, flag system, cartographic group, hemi-icosahedron, string C-group, abstract polytope, Sylvester–Gallai and Pappus finds only this pull request.
- **SurfaceTopology (#271):** it declares `structure GMap (n : ℕ) (D : Type*) [Fintype D] [DecidableEq D]` (`TauCetiRoadmap/SurfaceTopology/README.md` line 289). It is on the never-cite list and not in the merge order, while this roadmap is. So this roadmap is the owner, and the README's "no roadmap on main owns flag systems" is accurate. The duplicate is for SurfaceTopology to resolve.
- **Tau Ceti's `PermutationTriple` regular theory** (`GroupTheory/TriangleGroup/Regular.lean`) is the oriented hypermap analogue on a different carrier. Convention 12 cites it.

### Adversarial table

Values were computed by hand or by enumeration in exact arithmetic.

| Statement | Instances | Values on each side | Result | Change |
|---|---|---|---|---|
| 0.3 `isConnected_iff_preconnected_flagGraph` | projective plane `(01)(23), (03)(12), (02)(13)`; one dart; `Fin 2` with identities | orbits against flag-graph components: 1/1, 1/1, 2/2. The triangle `0, 1, 3` is an odd cycle. | true | none |
| 0.4 three theorems | projective plane; sphere with a loop; one dart; empty | `(1,1,1)↦(2,2,2)`, connected; `(1,1,2)↦(2,2,4)`, 2 components. One dart: connected and orientable, with a connected cover, so `hfix` is needed. Empty: needs `Nonempty`. Odd words fixing a dart need a fixed letter, so closed surfaces double. | true | none |
| 1.2 full GP | alternating chirotope on 5, `x = 1234`, `y = 15`; rank 1 | terms `0, −1, 1, −1`; `−χx₂χx₁` and `+χx₁χx₂` | true | none |
| 1.4 `isChirotope_ofVectorsFun` | `(1,0),(0,1),(1,1),(1,2)`; `v = 0`; `r = 0` | `1·1 − 1·(−1) + 2·(−1) = 0`, signed terms `1, 1, −1`; zero function; constant `1` | true | none |
| 1.5 reorientation, relabelling | alternating chirotope on 3, `A = {1}`, `A = univ` | `−1`; `(−1)³χ = −χ` | true | none |
| 2.2 `exists_orientedMatroid_covectorsOf` | `(1,0),(1,1),(0,1)`; infinite family of 2.2 | 6 cocircuits `±(0,+,+), ±(−,0,+), ±(−,−,0)`, 13 covectors. Infinite: the required `Z` has `−` on `fₙ`, the vertex `(1/m,0)` has `+` for `n > m`, so (L3) fails and `[Finite E]` is needed. | true | none |
| 2.3 `three_le_ncard_walls` | alternating chirotope on 5; `(1,0,0),(2,0,0),(0,1,0),(0,0,1)` | 22 topes with wall counts `{3:10, 4:10, 5:2}`; triangles `012, 014, 034, 123, 234` (0-indexed). Non-simple: at most 2 walls. | true | none |
| 2.5 projective face poset | 3 elements | 3 vertices, 6 edges, 4 cells, `3 − 6 + 4 = 1`. Antisymmetry: `X ≤ᶜ Y`, `−Y ≤ᶜ X` forces `Y = 0`. | true | none |
| 2.6 Euler | alternating chirotope on 5; rank 2 on 2; rank 1 | `20 − 40 + 22 = 2`; `4 − 4 = 0`; `2 = 1 + 1`; `n(n−1)`, `2n(n−1)`, `n(n−1)+2` at `n = 5` | true | none |
| 2.7 `exists_unique_circularOrder` | `E = {1,2}`, `χ12 = 1` | arcs: `(2,+)` lies in `((1,+),(1,−))` and `(1,−)` lies in `((2,+),(2,−))`, which forces the order `(1,+),(2,+),(1,−),(2,−)` | true | none |
| 3.3 `exists_chirotope_chiFun`, `isUniform_chiFun_iff` | lines of 3.1; concurrent lines; `n = 1` | `sign(2−1) = 1`, swapped `−1`; concurrent `0`; `n = 1` gives zero, so `n ≥ 2` | true | none |
| 3.4 `chiFun_ofLines` | lines of 3.1; general `i<j<k` | dets `1, 1`; `det(rowᵢ,rowⱼ,(0,0,1)) = aᵢ − aⱼ > 0`; the triple det, times positive factors, equals `crossX j k − crossX i j` | true | none |
| 3.5 `range_signAt`, `isPathConnected_cell` | lines of 3.1 with `none` | 51 covectors, 19 with `none = 1`; `(+,−,+,+) ∈ L`, `(−,+,−,+) ∉ L`; cocircuits 6/3/3 by value at `none`. Cells are intersections of half-lines over `x`. | true; Check wording | R04 |
| 3.6 `exists_monotoneArrangement` | `n = 2`; parallel at `none` | `±chiFun`, `R = {none}`; general position needed since `chiFun(·,·,none) = 1` | true | none |
| 3.7 map of an arrangement | 3 and 4 elements | `(3,6,4)` with 24 flags; `(6,12,7)` with 48 flags, `4·3 + 3·4 = 24` | true | R05 |
| 3.8 (a) `exists_isFlat_ncard_eq_two` | 3 elements; with a loop | three 2-element flats; flats of 3, so loopless is needed | true | none |
| 3.8 (b)–(c) | `e₁, e₂, e₃, e₁+e₂+e₃, e₁+e₂, (1,2,5)` | `(1,2,5)` lies in no span of two of the others; in `Q ∪ {δ}`, `δ` has 2 vertices, while `Q, ℓ, δ` works | true | none |
| 4.2 Convention 8 | `[0,1,0]`, `[0,0,1]`, `[0,1,0,1,1]` | `s₀s₁s₀ = revPerm`; `swap 1 2`; wires 0 and 1 are swapped 3 times (simulated) | true | R03 |
| 4.3 | 3, 4, 5 wires | 2, 16, 768 reduced words (Stanley: `6!/45 = 16`, `10!/4725 = 768`) | true | none |
| 4.4 `isSignotope_iff_exists_monotoneArrangement` | `Fin 4`, `Fin 5`; `(+,−,+,+)` | 8 and 62 (FG Table 5.6.1, line 959); two sign changes; the condition is invariant under `s ↦ −s` | true | none |
| 4.5 flips, Ringel, Levi | alternating chirotope on 5, all 10 triples, Lean GP3 quantifier (468750 instances each); near-pencil on 4 | triangles: 0 violations; non-triangles: 7200 each; each element is on 3 of the 5 triangles; near-pencil: 6 triangles, walls 4/4/4/6 | true | R03, R05 |
| 5.3 `levi_enlargement` | `Z = −Y`; two vertices on `e` | same point; parallel to `e` (allowed, no simplicity in the conclusion) | true | none |
| 5.4 positions | `e₁, e₂, e₃`; `v none = e₁` | `2³ = 8` generic positions; localization `0, 0, det(e₂,e₃,e₁) = 1`, below `e₁ + ε(a e₂ + b e₃)` | true | R03 |
| 5.5 `exists_monotoneArrangement_of_isSimple` | alternating chirotope on 3 | `n = 3`, `e = id`, `R = ∅`: `sign(2−1) = 1`; for the negative, `R = univ` | true | none |
| 6.1 `isRealizable_iff_exists_ofLines` | `y = 0`, `y = 1` | `det[(−1,0,0),(−1,0,1),(0,0,1)] = 0` | true | none |
| 6.2 Pappus | rows of 6.3; degenerate data; `det A = 2` | `C = (13,2,5),(15,3,8),(2,1,3)`, det `13 − 58 + 45 = 0`; `(15,3,6),(15,3,8),(0,0,2)`, det 0; det `−90 + 30 = −60` | true | none |
| 6.3 three theorems | `pappusPoints`, `nonPappusFun` and its `−1` variant | 9 collinear triples of 84, exactly those listed. GP3 has 0 violations over all `9³·6·9⁴` instances, exchange holds, and all pairs are in a basis. `C k ∝ v₆₊ₖ` since `det(P₁,P₂,P₄) = 2 ≠ 0`. | true | R02 (b) |
| 6.4 two theorems | `\|E\| = 3`; non-Pappus | `det(e₁,e₂,e₃) = 1`; simple on 9 and not realizable, so the bound is sharp | true | none |
| 7.1 definitions | `stringCoxeterMatrix 2 ![3,5]` | entries `3, 5, 2` = Mathlib `H₃` (evaluated) | true | R01, R03 |
| 7.2 `exists_monoidHom_stringCoxeterMatrix_iff` | `p i = 0` | `x⁰ = 1` imposes nothing; the far entries are 2 | true | none |
| 7.3 three theorems | `Bool` with the swap; `Fin 3`, `swap 0 1`; empty | `2 = 2`; centralizer 2 < 3; empty: 1 automorphism > 0 | true | none |
| 7.5 `exists_iso_cosetGMap`, `nonempty_iso_cosetGMap_iff` | `H = ⊤`, `⊥`; empty | one fixed flag; a free action; no subgroup | true | R01 |
| 8.1 | projective plane; empty; one dart | even part `{(02)(13), (03)(12), (01)(23)}`, transitive; empty and one dart as the Checks say | true | none |
| 8.4 (ii) Check | 3 elements | 48 = `\|ℤ/2 ≀ S₃\|`; centre 2 against 8 for `S₃ × (ℤ/2)³` | count true, group false | R04 |
| 9.1 four theorems | `cosetGMap ⊥`; tetrahedron; 4 lines; empty | infinite, regular, `Aut` transitive; 24/24; 48/24, not regular; empty regular with 1 automorphism | true; binders unneeded | R02 (c) |
| 9.2 three theorems | right multiplications; `\|G\| = 4`, `ρ` constant | `r_g r_h = r_{hg}`; index 2, two components | true | none |
| 9.4 | `A₃`, `B₃`, `H₃` | `2·12, 2·24, 2·60`; vertices `24/6, 48/8, 120/10` = 4, 6, 12 | true | none |
| 9.5 four theorems | `H₃ ⧸ Z` | `(s₀s₁s₂)⁵ = −1`, odd and central; 60 flags; `(6,15,10)`, `6 − 15 + 10 = 1`; cover `(12,30,20)`; `s₀s₂ ∉ Z`, so a closed surface | true | none |
| 9.6 `card_torusGroup`, `cellNumbers_torusGMap` | `n = 2..7` (enumerated) | 24, 108, 192, 300, 432, 588 against `12n²`; orders `(3,6,2)` for `n ≥ 3`, `(3,3,2)` at 2; cells `(n², 3n², 2n²)`; parity homomorphism exists | true, `n ≥ 3` needed | none |
| 10.2 | `n = 0`; general `p` | order 2, acts by `−1`; the generalised statement elaborates | true | R02 (a) |

## Not verifiable

- **BLSWZ, *Oriented Matroids*** (1.1–1.2, 1.5, 1.7, 2.1, 2.4, 2.6 in general rank, 5.1–5.2, 5.4): a paywalled CUP book. The "(B2')" label of 1.2 could not be checked.
- **Paywalled journals:** Roudneff–Sturmfels 1988 (Springer; pages 153–170 confirmed from secondary reference lists), Ringel 1956, Levi 1926, Felsner–Weil 2001 and Goodman–Pollack 1980/1984.
- **Books:** Grothendieck's *Esquisse* (no copy whose legality I could confirm), Coxeter–Moser, McMullen–Schulte and Humphreys.
- **Handbook chapters 5 and 6:** read in the editors' preliminary versions (July 16 and August 10, 2017) through the sources service. Pages are those printed there.
- **Sources manifest:** the package's `sources.toml` records only `ahos2013`. This review fetched `felsnergoodman2017`, `richtergebertziegler2017` and `wilson2012` into a scratch manifest and edits no manifest.

## Source issues

- **Error** in richtergebertziegler2017 at §6.2.3, p. 168: the source says `χ_X` is a chirotope for every vector configuration in `(ℝ^d)^n`; it should require `X` of rank `d`, as assumed in §6.1.3, p. 162; affects nothing.
- **Misprint** in felsnergoodman2017 at Theorem 5.3.1, p. 134: the source says "an arrangement A or pseudolines"; it should read "of pseudolines"; affects nothing.
