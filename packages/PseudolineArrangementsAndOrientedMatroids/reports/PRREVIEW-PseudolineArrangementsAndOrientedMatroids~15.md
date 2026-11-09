# Review of PseudolineArrangementsAndOrientedMatroids (pull request #1523 at c46e43d)

**Verdict:** needs changes

This is a full review of the head, not an incremental one.

- **Previous review (of 6afeb98):** four of its six findings are repaired and two are partly repaired. The remaining parts are carried into R04 and R06 below.
- **Gate:** passes, apart from the `NOT IN ORDER` line, which is expected before the roadmap is placed in the merge order.
- **Blocking findings:** three.
  - The proof route of the new 6.4 relies on a step that fails on the simple non-Pappus arrangement (R01).
  - 4.3's headline is a special case of Matsumoto's theorem, which the pinned Tau Ceti already has (R02).
  - The unmarked topological representation of 5.5 can be stated at the pins, but it is missing from `Suggested.lean` (R03).

## R01 (P2) — 6.4's route claims that every monotone arrangement of the chirotope can be stretched

**Location:** `TauCetiRoadmap/PseudolineArrangementsAndOrientedMatroids/README.md` line 1174–1177: "Route: by 5.5 and 6.1 it suffices to stretch the monotone arrangement of the chirotope; its allowable sequence (4.1) is realized by straight lines".

**Claim:** for `|E| ≤ 8`, the monotone arrangement that 5.5 gives for `χ` has an allowable sequence that straight lines realize.

**Witness:** take the simple non-Pappus arrangement `S` (felsnergoodman2017 line 460–462) and `ℓ ∈ S`. Then `χ = S ∖ ℓ` is uniform on 8 elements, and `S` is a generic extension of it. 5.5 gives 8 wires with chirotope `S`, which is not realizable, so they are not stretchable (4.1, 3.4).

**Repair:** replace the route sentence with:

> Route: by 5.5 and 6.1 it suffices to stretch one monotone arrangement whose chirotope, with the line at infinity deleted, is isomorphic to `χ`. The generic extension of 5.5 that serves as the line at infinity has to be chosen; Goodman and Pollack choose it through allowable sequences (4.1; Felsner–Goodman 2017, §5.3, p. 134; the circular sequence depends on the choice of the point at infinity, Theorem 5.2.2, p. 130).

Then add a Check:

> The choice is needed: deleting one line `ℓ` from the simple non-Pappus arrangement (Theorem 5.3.3) leaves a uniform chirotope on eight elements; its generic extension by `ℓ` gives, through 5.5, eight wires that are not stretchable.

**Tested** on `S ∖ ℓ`:
- the restated target holds there (Theorem 5.3.2, felsnergoodman2017 line 456–457);
- the new Check states exactly the failure that the old route missed;
- Theorem 5.2.2 (felsnergoodman2017 line 234–240) is the source's remark that the circular sequence depends on `P∞`.

## R02 (P2) — 4.3 restates Tau Ceti's Matsumoto theorem and claims the pins lack it

**Location:**
- README line 909–910: "Prove `Wiring.reflTransGen_of_isWiringDiagram`: any two simple wiring diagrams on `n + 1` wires are connected by commutations and braid moves".
- README line 193–194: "Neither pin has … wiring diagrams".
- `Suggested.lean` line 503–526.

**Claim:** this connectivity is a theorem owned here, and nothing at the pins provides it.

**Witness:** `TauCeti.braidEquivalent_of_isReduced_wordProd_eq` (`TauCeti/GroupTheory/Coxeter/Matsumoto.lean` line 83), applied to `TauCeti.permCoxeterSystem (n + 1)` (`TauCeti/GroupTheory/Perm/Coxeter.lean` line 195). Its simple reflections are the adjacent swaps (line 213), and its length is the number of inversions (line 293).

**Repair:**
- **In the README (4.2–4.3):**
  - A simple wiring diagram is a reduced word of `Fin.revPerm` for `TauCeti.permCoxeterSystem (n + 1)`. Its word product is the product of Convention 8 (`TauCeti.permCoxeterSystem_wordProd`). It is reduced because `Fin.revPerm` has `(n + 1) n / 2` inversions (`TauCeti.permCoxeterSystem_length_eq_card_inversion`).
  - The moves are `CoxeterSystem.IsBraidMove (CoxeterMatrix.A n)`: entry `2` gives a commutation and entry `3` a braid move (`TauCeti/GroupTheory/Coxeter/BraidEquivalence.lean` line 56).
  - The connectivity is cited from `TauCeti.braidEquivalent_of_isReduced_wordProd_eq`, not proved. 4.3 keeps the translation and the counts of commutation classes.
- **Supplier contracts:** add these declarations, with their files, under "From Tau Ceti".
- **Line 193–194:** replace "wiring diagrams," with nothing, and add at the end: "; reduced words of permutations and their braid moves are Tau Ceti's".
- **In `Suggested.lean`:**
  - delete `Wiring.wordProd`, `Wiring.IsWiringDiagram`, `Wiring.CommutationStep`, `Wiring.BraidStep` and `Wiring.reflTransGen_of_isWiringDiagram`;
  - delete the 4.2–4.3 item of the docstring (line 47–48);
  - in the README, remove the backticks from these five names.

**Tested:**
- A scratch file copies the two definitions and imports `TauCeti.GroupTheory.Coxeter.Matsumoto` and `TauCeti.GroupTheory.Perm.Coxeter`. It proves the following, and elaborates with no `sorry`:
  - `(TauCeti.permCoxeterSystem (n + 1)).wordProd w = Wiring.wordProd w`, by `rw` and `congr 1`;
  - reducedness, from the inversion count;
  - `CoxeterSystem.BraidEquivalent (CoxeterMatrix.A n) w w'` for any two wiring diagrams.
- An enumeration finds 2, 16 and 768 reduced words of `w₀` on 3, 4 and 5 wires, and each count forms a single class under braid moves and commutations.

## R03 (P2) — 5.5's unmarked representation can be stated at the pins, but the docstring says it cannot

**Location:**
- `Suggested.lean` line 91–93: "5.1 (localizations), 5.4, 5.5, the poset of positions and the unmarked topological representation: they lack the localization of a single-element extension as a function on cocircuits".
- README line 1083–1084.

**Claim:** stating 5.5 needs localizations, which the file does not build.

**Witness:** the conclusion uses only `chiFun`, `relabelFun` and `reorientFun`, all declared in the file. `exists_monotoneArrangement_nonPappus` (line 649) is its instance at `nonPappusFun`, and the statement below elaborates at the pins.

**Repair:**
- In the Layer 5 section of `Suggested.lean`, after the `end Chirotope` that follows `Chirotope.levi_enlargement`, add:

  ```lean
  /-- Topological representation in rank 3, unmarked form (Layer 5.5): every simple rank-3
  chirotope on a finite type is, up to relabelling and reorientation, the chirotope of a monotone
  arrangement with the line at infinity deleted. -/
  theorem exists_monotoneArrangement_of_isSimple {E : Type*} [Finite E] (χ : Chirotope 3 E)
      (hs : χ.IsSimple) :
      ∃ (n : ℕ) (e : E ≃ Fin n) (A : MonotoneArrangement n) (R : Set (Fin n)),
        (fun t : Fin 3 → Fin n => A.chiFun (some ∘ t)) =
          Chirotope.reorientFun (Chirotope.relabelFun e χ) R := sorry
  ```

- **README 5.5:** begin the "Hence" sentence with "Hence `exists_monotoneArrangement_of_isSimple`:".
- **Headline list:** add the theorem to the docstring's headline list and to the Summary's end theorems.
- **Docstring bullet:** shorten it to "5.1 (localizations) and 5.4, the poset of positions: …".

**Tested:**
- A scratch copy with the theorem added elaborates with 52 warnings, all `sorry`.
- On the alternating chirotope on three elements: `n = 3`, `e = id`, the lines of 3.1 and `R = ∅` give `sign (2 − 1) = 1` at `(0, 1, 2)`. For its negative, `R = Set.univ` gives `−1`.

## R04 (P3) — Locators missing at 4.1, 4.4 and 7.4; 1.4 copies a source slip; two works missing from References

**Location and repair:**
- **4.1** (sampled), line 872: "(Goodman–Pollack 1980)" has no theorem or page, and "same allowable sequence, same chirotope" has no source.
  - Add "(Felsner–Goodman 2017, Theorem 5.2.1, p. 129; half-periods from the identity to its reverse, p. 132)" (felsnergoodman2017 line 211–218 and 356–358).
  - Add: "condition (iii) is dropped because `none` is an element, so concurrent wires are allowed".
- **4.4** (sampled), line 930: "(Felsner–Weil 2001)" has no theorem number. The DOI resolves only to a paywalled page.
  - Give Felsner–Weil's theorem and page, recorded `uncertified`.
  - Add "Bergold–Egeling–Hoang 2025, p. 16:1", which states the bijection (line 44–45). Their Definition 1, p. 16:2, matches Convention 9 read in reverse.
- **7.4** (sampled), line 1266–1270: there is no locator.
  - Add "(Wilson 2012, §5, p. 268: `i`-faces as orbits of the group generated by the `rⱼ`, `j ≠ i`)" (wilson2012 line 131–133).
- **1.4** (sampled), line 395–397: "`χ_X` is a chirotope for every vector configuration `X`". This repeats a slip in the source and contradicts the Check at line 402.
  - Replace it with "(Richter-Gebert–Ziegler 2017, §6.2.3, pp. 167–168; `χ_X` is a chirotope when `X` has rank `d`, the standing assumption of §6.1.3, p. 162)" (richtergebertziegler2017 line 171–172 and 399).
- **Streinu 1997** (line 938) has no References entry.
  - Add "I. Streinu, *Clusters of stars*, Proc. 13th ACM Symposium on Computational Geometry (1997), 439–441" (felsnergoodman2017 line 1438–1439).
- **Grothendieck's folder 80** (Research context, line 1621–1624) has no References entry. This is the part of the previous review's R04 that is still open.
  - Add "A. Grothendieck, manuscript notes on pseudoline arrangements, Université de Montpellier, fonds Grothendieck, folder 80, https://grothendieck.umontpellier.fr/80.pdf".

**Tested:** each locator above was read at the stated line.

## R05 (P3) — 1.6's new sentence omits simplicity and does not say which classes are meant

**Location:** README line 441–442: "In rank 3 the classes are the isomorphism classes of pseudoline arrangements".

**Claim:** every rank-3 class is the class of a pseudoline arrangement.

**Witness:** `ofVectorsFun` of `e₁, e₂, e₃, 0` is `0` on all 18 triples containing the fourth vector, a loop, while every `chiFun` is simple (3.3). Felsner–Goodman p. 126 (line 47–50) means labelled arrangements; 4.6 counts unlabelled ones.

**Repair:** replace the sentence with:

> For simple rank-3 chirotopes, reorientation classes correspond to isomorphism classes of labelled pseudoline arrangements, and isomorphism classes to unlabelled ones, which 4.6 counts (Felsner–Goodman 2017, §5.1, p. 126, and §5.2, p. 131).

**Tested:**
- The loop example is excluded by "simple".
- On `Fin 4` both readings give one class (the 16 reorientations of the alternating chirotope).

## R06 (P3) — `GMap.eulerChar` is still backticked but no longer declared

**Location:**
- README line 763: "with `GMap.eulerChar` equal to `1`".
- README line 1310: "Its cells, `GMap.eulerChar`, `GMap.IsOrientable`".

**Claim:** `Suggested.lean` declares `GMap.eulerChar`.

**Witness:** `eulerChar` occurs nowhere in `Suggested.lean`. The previous review's R05 asked for these backticks to be dropped; the lines were then 740 and 1273.

**Repair:**
- Line 763: "with Euler characteristic `1`".
- Line 1310: "Its cells, Euler characteristic, `GMap.IsOrientable`".

**Tested:** after the edit, `grep eulerChar` finds nothing in either file.

## R07 (P3) — Two routes rely on objects at the pins without citing them

**Location:**
- **0.4** route, line 303–304: "the cover is the bipartite double cover of the flag graph".
- **9.4–9.5**, line 1478–1479 and 1499–1500: the group orders 24, 48 and 120, and `H₃ ⧸ center ≃* A₅`.

**Witness:**
- Mathlib has `SimpleGraph.bipartiteDoubleCover` (`Combinatorics/SimpleGraph/Bipartite.lean` line 538).
- Tau Ceti's `TriangleGroup/Polyhedral.lean` has `TauCeti.TriangleGroup.natCard_two_three_three`, `natCard_two_three_four` and `natCard_two_three_five` (orders 12, 24 and 60; lines 404–424) and `equivIcosahedral : TriangleGroup 2 3 5 ≃* alternatingGroup (Fin 5)` (line 460).

**Repair:**
- **0.4 route:** read "the flag graph of the cover is Mathlib's `SimpleGraph.bipartiteDoubleCover` of the flag graph, transported along `D × Bool ≃ D ⊕ D`". Add the name to the Mathlib contract.
- **9.4–9.5:** add the four Tau Ceti names to "From Tau Ceti" and to the *Needs:* lines of 9.4 and 9.5, with this route: the rotation subgroups (generated by `s₀ s₁` and `s₁ s₂`) are these triangle groups; `H₃ ⧸ center` is the rotation subgroup, since `hemiW₀` is central and odd.

**Tested:**
- Without `hfix`, the one-dart flag system shows that the two graphs differ: the cover's flag graph has the edge `(d, 0)–(d, 1)`, while `bipartiteDoubleCover` of an edgeless graph has none.
- Doubling the triangle-group orders gives 24, 48 and 120, the orders of 9.4.

## Previous findings (review of 6afeb98)

| Finding | Status | Evidence at this head |
|---|---|---|
| R01 | repaired | Line 1083–1086: "every simple rank-3 chirotope is … the deletion … by 1.7 every rank-3 chirotope is obtained from one of these by adding loops and parallel or antiparallel copies". |
| R02 | repaired | `GMap.isConnected_iff_preconnected_flagGraph` is now in 0.3 (README line 267–272, `Suggested.lean` line 187–189). 7.4 cites it (line 1268–1269). Weichsel is at line 307–309 and in References (line 1702–1703). |
| R03 | repaired | 6.4 is restated (line 1171–1179), with `isRealizable_real_of_natCard_le_eight` and `isRealizable_rat_of_natCard_le_eight` (`Suggested.lean` line 654–662). Its new route has a defect; see R01. |
| R04 | partly | Locators were added for 1.6, 2.3, 2.5, 2.6, 2.7, 3.3, 3.5, 3.7, 4.3, 4.4, 4.5, 5.5 and 6.2. 6.3 is credited to Levi 1926. Lawrence and Knuth are removed. 3.8 (c) is proved by its own route, and Research context gives exact pages. The References entry for folder 80 is still missing; see R04. |
| R05 | partly | Both definitions are gone from `Suggested.lean`, and lines 258–260 are prose. Lines 763 and 1310 still backtick `GMap.eulerChar`; see R06. |
| R06 | repaired | Docstring line 94–100 gives 9.3's reason as "there is no abstract polytope at the pins" and lists the 8.3 and 9.4–9.6 clauses as API that the README keeps. |

## Verified sound

### Gate, order and Lean

- **Brief's gate command:** every counter is 0 except `depcheck=1`, which reads "NOT IN ORDER: PseudolineArrangementsAndOrientedMatroids (insert it after its last supplier)". That is not a defect before the roadmap is placed. The worker's gate at this head reports every counter 0, including `build=0`.
- **Dependency check** (`--order merge-order-candidate.txt --movable`): `depcheck: 240 roadmaps, 2321 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.
- **Outside the folder:** `git diff --stat origin/main...HEAD` outside the folder is empty.
- **Elaboration:** `lake env lean` on `Suggested.lean` exits 0 with 51 warnings, all "declaration uses `sorry`".
- **Binders:** `#check @name` for all 127 declarations, in one file, elaborates with no error. No binder is lost:
  - `isConnected_orientationDoubleCover_iff` keeps `[Nonempty D]` and `hfix`;
  - `natCard_cell_orientationDoubleCover` keeps `[Finite D]` and the closed-surface hypothesis;
  - `isRegular_iff_natCard_aut` and `natCard_aut_le` keep `[Finite D] [Nonempty D]` and connectedness;
  - `isChirotope_ofVectorsFun` keeps `[IsStrictOrderedRing 𝕜]` and the span hypothesis;
  - the two new 6.4 theorems keep `[Finite E]` and `IsSimple` or `IsUniform`, and the bound `Nat.card E ≤ 8`.
- **One-tactic probe:** every `sorry` was replaced by `first` over `rfl`, `simp`, `infer_instance`, `decide`, `trivial`, `norm_num`, `omega` and `exact?`, each followed by `done`. All 51 theorems still use `sorry`.
- **Headlines:** every end theorem of the Summary is stated, except:
  - 3.7 and 8.2–8.4, which the docstring names with 3.7's reason;
  - 5.5, which is R03.

### Seeded sample (15 targets)

| Target | Locator | What I checked |
|---|---|---|
| 0.1 | BLSWZ §3.7, §4.1 | not readable. Convention 1 agrees with Richter-Gebert–Ziegler pp. 165–166 (line 290–303): composition, `S(C, D)` and the order `0 < ±`. Their example reproduces as `C ∘ D = (+,+,−,+,−,+,0,−)`, `S = {5, 6}`. |
| 1.4 | Richter-Gebert–Ziegler §6.2.3 | (CHI1)–(CHI2) and the identity are at line 371–384. The gloss copies the slip at line 399; see R04. |
| 2.1 | BLSWZ Def. 4.1.1 | not readable. (L0)–(L3) are (CV0)–(CV3), p. 166 (line 309–313). |
| 2.4 | BLSWZ §4.1 | not readable. The face lattice and rank are at p. 166 (line 324–329). |
| 3.3 | Felsner–Goodman §5.2, p. 131, Fig. 5.2.5 | line 297–307 ✓ |
| 4.1 | Goodman–Pollack 1980 | not readable. Felsner–Goodman Thm 5.2.1 supplies the definition; see R04. |
| 4.3 | Felsner–Goodman Thm 5.2.8, p. 133; p. 132 | line 382–387 and 356–359 ✓. The duplication is R02. |
| 4.4 | Thm 5.2.10, p. 133 | line 405–409 ✓. The README's condition is the same, with `αₖ, αⱼ, αᵢ` in that order. The Felsner–Weil theorem number is missing; see R04. |
| 4.5 | Thm 5.5.8, p. 145; Thm 5.4.5, p. 139 | line 924–928 and 654–656 ✓ |
| 5.1 | BLSWZ Prop. 7.1.4, Thm 7.1.8 | not readable. The Check was recomputed (table). |
| 5.2 | BLSWZ §7.2 | not readable. Checked mathematically (table). |
| 6.3 | Levi 1926; Felsner–Goodman §5.3, p. 134 | line 437–440 ✓ |
| 7.4 | none | see R04 |
| 7.5 | Wilson §5, p. 270 | line 173–179 (pp. 269–270) ✓ |
| 9.2 | Wilson §7, p. 272 | line 264–266 and 282–286 ✓ (the antimorphism) |

### Other locators read

- **2.3:** p. 125, line 40–41.
- **2.5:** Theorem 6.2.4, p. 169 (richtergebertziegler2017 line 463–468), and Felsner–Goodman p. 126, line 47–49.
- **2.6, 3.7:** Theorem 5.4.1, p. 138, line 581–583.
- **2.7, 3.5 (i), 5.5:** Theorem 6.2.4, p. 169. The converse needs "without loops", which 5.5 now has.
- **6.4:** Theorems 5.3.2–5.3.3, p. 135 (line 456–462), and Ringel's simplification, p. 134 (line 443–445).
- **0.4:** Weichsel Theorem 1, p. 49 (weichsel1962 line 108–109) ✓.
- **0.3, 8.1:** Wilson pp. 268–270 (line 111–136, 187–190) ✓.

### Library declarations opened at the pins

**Tau Ceti:**

| Declaration | File | Line |
|---|---|---|
| `TauCeti.braidEquivalent_of_isReduced_wordProd_eq` | `GroupTheory/Coxeter/Matsumoto.lean` | 83 |
| `TauCeti.braidEquivalent_iff_wordProd_eq` | `GroupTheory/Coxeter/Matsumoto.lean` | 128 |
| `CoxeterSystem.IsBraidMove` | `GroupTheory/Coxeter/BraidEquivalence.lean` | 56 |
| `CoxeterSystem.BraidEquivalent` | `GroupTheory/Coxeter/BraidEquivalence.lean` | 63 |
| `TauCeti.permCoxeterSystem` | `GroupTheory/Perm/Coxeter.lean` | 195 |
| `TauCeti.permCoxeterSystem_wordProd` | `GroupTheory/Perm/Coxeter.lean` | 213 |
| `TauCeti.permCoxeterSystem_length_eq_card_inversion` | `GroupTheory/Perm/Coxeter.lean` | 293 |
| `TauCeti.BraidGroup.transposition` | `GroupTheory/SpecificGroups/Braid/Basic.lean` | 264 |
| `Fin.sign_revPerm` | `GroupTheory/Perm/Inversion.lean` | 81 |
| `TauCeti.TriangleGroup.natCard_two_three_three` | `GroupTheory/TriangleGroup/Polyhedral.lean` | 404 |
| `TauCeti.TriangleGroup.natCard_two_three_four` | `GroupTheory/TriangleGroup/Polyhedral.lean` | 414 |
| `TauCeti.TriangleGroup.natCard_two_three_five` | `GroupTheory/TriangleGroup/Polyhedral.lean` | 424 |
| `TauCeti.TriangleGroup.equivIcosahedral` | `GroupTheory/TriangleGroup/Polyhedral.lean` | 460 |

The contract names in `GroupTheory/Coxeter/Geometric.lean` are at lines 125, 161, 458, 479, 485, 525 and 553.

**Mathlib:**

| Declaration | File | Line |
|---|---|---|
| `SimpleGraph.bipartiteDoubleCover` | `Combinatorics/SimpleGraph/Bipartite.lean` | 538 |
| `SimpleGraph.Preconnected` | `Combinatorics/SimpleGraph/Connectivity/Connected.lean` | 234 |
| `CoxeterSystem.IsReduced` | `GroupTheory/Coxeter/Length.lean` | 80 |
| `CoxeterSystem.alternatingWord` | `GroupTheory/Coxeter/Basic.lean` | 397 |

### Cross-roadmap citations (main at 154c04a)

- **RootSystems §1.3:** at README line 515, with `geometric_faithfulness` in its `Suggested.lean` line 73 ✓.
- **GraphConnectivityAndFlows Target 1.1:** at README line 224 ✓.
- **SchubertGeometry** (an open pull request) cites the same Tau Ceti Matsumoto theorem (its README line 101 and 742). This corroborates R02.

### Ownership and overlaps

- **Overlaps tool:** no open pull request changes this roadmap, and no id is dropped in either direction.
- **Same objects:** `roadmaps grep` for chirotope, pseudoline, oriented matroid, signotope, wiring diagram, maniplex, cartographic group and hemi-icosahedron hits only this pull request.
- **"Orientation double cover"** hits are the manifold covers of RiemannianGeometry, TeichmullerGeometry and others, a different object.
- **SurfaceTopology** (closest in vocabulary) is on the never-cite list, as the previous review found.

### Adversarial table

The values were computed in exact arithmetic. Rows marked "r14" are statements that did not change since 6afeb98; their values are the ones the previous review computed.

| Statement | Instances | Values on each side | Result | Change |
|---|---|---|---|---|
| 0.1 Convention 1 | `X = (+,0)`, `Y = (−,+)`; Richter-Gebert–Ziegler's `C`, `D` | `X ∘ Y = (+,+)` and `Y ∘ X = (−,+)`, with `sep = {e₁}`; `C ∘ D = (+,+,−,+,−,+,0,−)`, with `S = {5,6}` | sound | none |
| 0.3 `isConnected_iff_preconnected_flagGraph` | projective plane; sphere with a loop; one dart; `Fin 2` with identities; empty | monodromy orbits against flag-graph components: 1/1, 1/1, 1/1, 2/2, 0/0 | true | none |
| 0.4 route | one dart with identities | the cover's flag graph has an edge; `bipartiteDoubleCover` of the edgeless graph has none, so `hfix` is needed | sound | R07 |
| 1.4 Check | `(1,0), (0,1), (1,1), (1,2)`; `v = 0` | `1·1 − 1·(−1) + 2·(−1) = 0`, signed terms `1, 1, −1`; zero function | sound, gloss false | R04 |
| 1.6 sentence | `e₁, e₂, e₃, 0` | value `0` on all 18 triples containing the loop; every `chiFun` is simple | false as stated | R05 |
| 2.1 Check | `0, (±,±)`; `X = (+,+)`, `Y = (+,−)`, `e₂` | needs `(+,0)`, which is absent | sound | none |
| 2.2 Check | `(1,0), (1,1), (0,1)` | 6 cocircuits `±(0,+,+), ±(−,0,+), ±(−,−,0)`; 13 covectors | sound | none |
| 2.4 Check | tope `(+,+)` | lower interval of 4 elements; the chain `0 < (+,0) < (+,+) < ⊤` has 3 steps, which is `r + 1` | sound | none |
| 2.6 Check | alternating chirotope on 5 elements | `20 − 40 + 22 = 2` | sound | none |
| 3.3 Check | lines of 3.1; concurrent lines | `sign (2 − 1) = 1`, swapped `−1`; concurrent `0` | sound | none |
| 3.4 Check | lines of 3.1 | determinants `1` and `1` | sound | none |
| 4.1 Check | slopes `(1,0,−1)`, intercepts `(0,1,3)` and `(0,1,4)` | crossings `1, 3/2, 2` and `1, 2, 3`, the same order; `χ(0,1,2) = +` for both | sound | R04 |
| 4.3 | 3, 4, 5 wires | reduced words of `w₀`: 2, 16, 768; braid classes 1, 1, 1; commutation classes 2, 8, 62; Tau Ceti derivation elaborates | true, duplicated | R02 |
| 4.4 | `[0,1,0]`; `Fin 4`, `Fin 5` | local sequences `(1,2), (0,2), (0,1)`, all in natural order; signotopes 8 and 62, equal to the commutation classes | sound | R04 |
| 4.5 (r14) | alternating chirotope on 5 elements | triangles 123, 234, 345, 145, 125, each element on 3 of them | sound | none |
| 5.1 Check | `(1,0), (0,1)`, `v none = (1,1)` | `(0,+) ↦ (0,+,+)`, `(−,0) ↦ (−,0,−)`; localization `1, −1` | sound | none |
| 5.2 Check | `v none = ±v e`; a loop `e` | `σ = ±(Y ↦ Y e)`; for the loop, `0` | sound | none |
| 5.5 corollary | `e₁, e₂, e₃, 0` | now restricted to simple chirotopes, with 1.7 adding the loop back | repaired | none |
| 5.5 unmarked statement | alternating chirotope on 3 elements, and its negative | `R = ∅` gives `1`, `R = Set.univ` gives `−1` | true, can be stated | R03 |
| 6.2 Check | rows of 6.3; `det A = 2` | `C = (13,2,5), (15,3,8), (2,1,3)`, determinant `0`; determinant `−60` | sound | none |
| 6.3 | `pappusPoints` | of 84 triples, exactly the 9 listed are collinear | sound | none |
| 6.4 targets | `\|E\| = 3, 4, 5`; `nonPappusFun` | `det(e₁, e₂, e₃) = 1`; `(1, i, i²)`: every increasing triple `+1`; non-Pappus: simple on 9 elements and not realizable | true, bound sharp | none |
| 6.4 route | `S ∖ ℓ`, with `S` the simple non-Pappus arrangement | `χ` is uniform on 8 elements and realizable; the generic extension `S` is not realizable | false step | R01 |
| 6.4 `hs` | non-simple `χ` | not needed for truth, since 1.7 realizes loops as `0` and parallel copies as multiples; it is kept as in the source | note | none |
| 7.4 Checks | tetrahedron | `24 / 6 = 4` vertices; two vertices share no flag, and both meet their edge | sound | R04 |
| 7.5 Checks | `H = ⊤`, `⊥`; empty | one fixed flag; a free action; the empty system has no subgroup | sound | none |
| 9.2 Check | right multiplications | `x ↦ x h g`, so `r_g ∘ r_h = r_{hg}` | sound | none |
| 9.4–9.5 (r14) | `H₃` | order 120; `w₀ = −I`, odd and central; `(6, 15, 10)` | true | R07 |
| 9.6 | `n = 2, …, 7` | 24, 108, 192, 300, 432, 588 against `12n²`; `n = 2` fails, as the Check says | sound | none |
| 1.5, 2.3, 2.7, 3.5, 3.6, 3.8 (a), 5.3, 6.1, 7.2–7.3, 8.1, 9.1, 10.2 (r14) | as in the r14 table | as computed there; the statement text is unchanged | sound | none |

## Not verifiable

- **BLSWZ, *Oriented Matroids*** (cited for 0.1, 1.1–1.2, 1.5, 1.7, 2.1–2.2, 2.4, 2.6, 3.6, 5.1–5.2, 5.4): a paywalled CUP book. I cross-checked it against Richter-Gebert–Ziegler where that text states the same thing.
- **Felsner–Weil 2001:** the sources service resolves the DOI only to a paywalled page.
- **Paywalled journals:** Goodman–Pollack 1980a, 1980b and 1984 (the service treats DOI prefix 10.1016 as paywalled), Levi 1926, Ringel 1956, Roudneff–Sturmfels 1988, Felsner 1997, Richter 1989, Csima–Sawyer 1993, Björner–Edelman–Ziegler 1990, Bose–Everett–Wismath 2003 and Whitney 1932.
- **Books:** McMullen–Schulte, Coxeter–Moser, Humphreys and Bondy–Murty.
- **Handbook chapters 5 and 6:** I read them in the editors' preliminary versions (July and August 2017). The page numbers above are those printed there.

## Source issues

- **Error** in richtergebertziegler2017 at §6.2.3, p. 168: the source says `χ_X` is a chirotope for every `X` in `(ℝ^d)^n`; it should require `X` of rank `d`, the standing assumption of §6.1.3, p. 162; affects nothing.
- **Misprint** in felsnergoodman2017 at Theorem 5.3.1, p. 134: the source says "an arrangement A or pseudolines"; it should read "of pseudolines"; affects nothing.
