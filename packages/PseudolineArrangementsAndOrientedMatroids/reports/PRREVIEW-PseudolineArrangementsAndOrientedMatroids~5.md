# Review of PseudolineArrangementsAndOrientedMatroids (pull request #1523 at 8a1d1ab)

**Verdict:** needs changes

Full review of `TauCetiRoadmap/PseudolineArrangementsAndOrientedMatroids/README.md` and
`TauCetiRoadmap/PseudolineArrangementsAndOrientedMatroids/Suggested.lean` at 8a1d1ab (2888 changed
lines since aa4a788). The gate passes on this head (every scanner 0, targeted build with `sorry`
the only warning); the dependency check reports `232 roadmaps, 2108 edges, 0 problem(s)` with no
UPWARD, CYCLE or `moved:` line. All thirteen findings of the previous review are repaired (the
check is itemised under *Verified sound*). The mathematics I recomputed is right in every finite
instance (chirotope axioms, covector counts, walls, flips, torus group orders, commutation classes,
signotopes, the non-Pappus configuration, the sign of `signAt`). One headline theorem is stated
without the finiteness of the ground set that its sources assume and is false without it (R01);
the rest are small.

## R01 (P2) — `exists_orientedMatroid_covectorsOf` and `isChirotope_flipFun` need `[Finite E]`

Location: `Suggested.lean` line 243–244 (`theorem exists_orientedMatroid_covectorsOf (χ : Chirotope
r E) : ∃ L : OrientedMatroid E, L.covectors = covectorsOf χ`), line 452–453
(`isChirotope_flipFun`, no `[Finite E]`); README 2.2 line 434–436 ("prove … the covectors of a
chirotope form an `OrientedMatroid`"), 4.5 line 843–845.

Claim: for every chirotope on every type `E`, the finite compositions of cocircuit vectors satisfy
the elimination axiom (L3).

Witness: a realizable rank-3 chirotope on an infinite `E`, `ofVectorsFun` of the line vectors
`(-1, s, c)` for the lines `e : y = 0`, `a₁ : y = 1 + x`, `a₂ : y = 1 − x`, `b₁ : y = −1 + x`,
`b₂ : y = −1 − x`, and `fₙ : y = n² x − n`, `gₙ : y = n² x + n` for `n ≥ 2` (the chirotope axioms
are finitary, so this is a `Chirotope 3 E`). Let `X` be the cocircuit vector of the vertex
`p = a₁ ∩ a₂ = (0, 1)` and `Y` that of `q = b₁ ∩ b₂ = (0, −1)`, signed so that `X ℓ = sign (ℓ(p))`,
`Y ℓ = sign (ℓ(q))` for every line `ℓ` (both signs are in `covectorsOf`). Computed:
`sep X Y = {e}`, and `X fₙ = Y fₙ`, `X gₙ = Y gₙ`, all nonzero (every `fₙ`, `gₙ` is above the
segment from `p` to `q` on the axis `x = 0`). Elimination at `e` needs `Z ∈ covectorsOf` with
`Z e = 0` and `Z fₙ = X fₙ`, `Z gₙ = X gₙ` for all `n`. `Z e = 0` forces every cocircuit in `Z`'s
list to vanish at `e`, so the first nonzero one is `± sign(p₁)` for a vertex `p₁` on `e`, and
`Z ℓ = ± sign (ℓ(p₁))` wherever that is nonzero. The vertices on `e` are `(±1, 0)` and `(±1/m, 0)`.
For `p₁ = (1/m, 0)`: `fₙ` with `n > m` crosses `e` at `1/n ∈ (0, 1/m)`, so `fₙ` separates `p₁` from
the origin but not from `p`, forcing the sign `−1`, while every `gₙ` (crossing at `−1/n < 0`) does
not separate them and forces `+1`; symmetrically for `(−1/m, 0)` and `(±1, 0)`. No `Z` exists, so
`covectorsOf χ` is the covector set of no `OrientedMatroid E` (checked exactly over `ℚ`: with
the lines up to `n = 39` only the two end vertices `±1/39` survive, and they fail at `n = 40`). The classical theory (BLSWZ Definition 4.1.1, Proposition 3.7.2) is for finite ground
sets, and so are Ringel 1956 and Roudneff–Sturmfels 1988 for the flip theorem; for an infinite `E`
the topes and walls of `covectorsOf` are not the classical cells (the same arrangement shows that
the sign vector of a point at which crossings accumulate is no finite composition of cocircuits),
so `isChirotope_flipFun` is not supported by its sources either.

Repair: `theorem exists_orientedMatroid_covectorsOf [Finite E] (χ : Chirotope r E) : …` and
`theorem isChirotope_flipFun [Finite E] (χ : Chirotope 3 E) …` (the converse at line 457 already
has it); in the README state 2.2's theorem and 4.5's flip theorem "for a finite `E`", say in
Convention 4 that `covectorsOf` is the classical covector set for finite `E`, and add the
arrangement above as a negative-control Check of 2.2 (sep is `{e}`, no composition with a vertex on
`e` matches `X` on all `fₙ` and `gₙ`). Every other theorem of the file that quantifies over the
covectors already carries `[Finite E]` (`three_le_ncard_walls`, `exists_unique_circularOrder`,
`exists_isFlat_ncard_eq_two`, `exists_triangle_of_flipFun`, `reflTransGen_mutationStep`,
`levi_enlargement`).

## R02 (P3) — 2.7's converse fails on fewer than two elements

Location: README line 518–520 ("every circular order on `E × ℤˣ` preserved by the antipode, with
exactly `|E| − 1` elements strictly between `a` and `−a` for each `a`, comes from a unique simple
rank-2 chirotope").

Claim: the correspondence is a bijection for every finite `E`.

Witness: `E = Fin 1`: `E × ℤˣ` has two elements, the only circular order is preserved by the
antipode and has `|E| − 1 = 0` elements strictly between `a` and `−a`, but there is no
`Chirotope 2 (Fin 1)` (no injective pair, so `exists_ne_zero` fails); likewise `E` empty. The
forward direction is fine: a simple rank-2 chirotope has a basis, so `|E| ≥ 2`.

Repair: state the converse for `|E| ≥ 2` and add `E = Fin 1` as a negative-control Check.

## R03 (P3) — Build order: 3.9 needs 8.3, and 4.3 needs 4.5

Location: README line 732 (`*Needs:* 1.6, 3.7, 8.3; …`), line 755–757 ("Layers 1–2, 8.3, …; 3.9
uses 3.7 and 8.3"), line 807 (`*Needs:* 4.2, 4.5`), line 883 ("4.3 uses 4.2 and 4.5").

Claim: layers and subsections are in build order.

Witness: 8.3 (the skeleton of a `GMap2`) lives in Layer 8, five layers after the target 3.9 that
consumes it, while 8.2 in turn consumes 3.7; 4.5 (triangle flips, `Chirotope.Triangle`) is used by
4.3 ("a braid move is a legal mutation: the three wires it reverses are the walls of a triangle
(4.5)") two subsections earlier. 8.3 needs only SurfaceTopology Layer 1 `GMap.Cell`,
GraphConnectivityAndFlows Target 1.1 and Mathlib `Graph`, nothing from Layers 4–8.

Repair: move the skeleton definition into Layer 3 as a subsection before 3.9 (keeping 8.3's
Checks), or move 3.9 to Layer 8; and either place triangle flips before the moves (4.3 ↔ 4.5) or
move the "braid move is a legal mutation" clause of 4.3 into 4.5. Re-read the three Dependencies
lines afterwards.

## R04 (P3) — Levi's triangle theorem is narrowed below its source

Location: README line 848–850 ("in a uniform rank-3 chirotope on at least three elements every
element is a wall of at least three triangular cells … (Levi 1926)").

Claim: Levi's theorem is about uniform chirotopes.

Witness: Felsner–Goodman 2017, Theorem 5.4.5 (340a6c28 line 654–656): in any arrangement of
`n ≥ 3` pseudolines, simple or not, every pseudoline borders at least three triangles, hence at
least `n` triangles. In the roadmap's terms that is every simple rank-3 chirotope on at least three
elements (3.7 gives its projective arrangement); the uniform case is a special case.

Repair: state it for simple rank-3 chirotopes on a finite `E` with `3 ≤ |E|`, and keep the
alternating chirotope on five elements (each element a wall of exactly three of the five
triangles) and the near-pencil on four elements as Checks.

## R05 (P3) — The docstring's reason for not stating Theorem 3.5.5 is wrong; the existence half is statable

Location: `Suggested.lean` line 60–62 ("2.2, the representation of every `OrientedMatroid` of rank
`r` by a chirotope (BLSWZ Theorem 3.5.5) … lack[s] the rank of a covector and of an
`OrientedMatroid`"); README line 439–440.

Claim: the theorem is not statable at the pins.

Witness: `theorem exists_chirotope_covectorsOf [Finite E] (L : OrientedMatroid E) : ∃ (r : ℕ)
(χ : Chirotope r E), L.covectors = covectorsOf χ` mentions no rank, every carrier in it is in the
file, and it is true as stated (for `L = {0}` take `r = 0`: a `Chirotope 0 E` has no cocircuit
vector, so `covectorsOf χ = {0}`; for `r ≥ 1` it is BLSWZ Theorem 3.5.5 with Proposition 3.7.2).

Repair: state that form in Layer 2 and drop the sentence from the docstring (the uniqueness up to
sign and the equality of ranks stay README API bullets of 2.2).

## R06 (P3) — 3.6 names no route, and its `*Needs:*` line cannot be its route's

Location: README line 639–645 (3.6: statement, locators, `*Needs:* 1.5, 3.3`).

Claim: the topological representation in rank 3, the deepest target of Layer 3, is planned.

Witness: 3.6 cites BLSWZ Theorem 5.2.1 and Chapter 6 and Goodman–Pollack 1984 but gives no route;
its `*Needs:*` line lists only the two targets its statement mentions, while every known proof
passes through either the cyclic order of the contraction at `none` (2.7), the sweep or allowable
sequence of a rank-3 chirotope with a marked element (4.1) or single-element extensions (Layer 5,
whose 5.5 consumes 3.6, so that route would be a cycle). 3.8 and 3.9 each name their route; 3.6 is
the one target of the layer that does not.

Repair: one or two sentences naming the route (for instance: contract at `none`, read the slope
order from 2.7, build the sweep of 4.1 by induction on the elements and draw it piecewise
linearly, then compare chirotopes through 3.3) and list those inputs on the `*Needs:*` line, none
of them from Layer 5.

## Verified sound

**Previous findings.** F01–F13 of the review at aa4a788, checked against the head: F01 no sorry'd
data (gate `sorry-data=0`; `crossX` by `Classical.choose` at line 288, `chiFun` line 311,
`covectorsOf` line 237, `ofLines` proved line 325–336, `stringCoxeterMatrix` proved line 535–553,
`torusInvolution` proved line 575–581, quotient by `Subgroup.center` line 571) — repaired. F02
`signAt (some i) = sign (f i p.1 − p.2)` line 300, README Convention 6 and 3.2's triangle Check —
repaired (recomputed: `(3/2, 6/5)` has `(+, −, +; +)`, which is a covector, and `(−, +, −; +)` is
not). F03 `gap:coxeter-geometric-faithfulness` under RootSystems, README line 194–198, no "§3G" —
repaired. F04 stand-ins deleted, SurfaceTopology Layer 1 cited in its finite-decidable form (README
line 175–183) with `gap:gmap-arbitrary-darts` (185–188) — repaired. F05 `Nonempty D` in 8.1 and
9.1 with the empty flag system as negative control (README 1175, 1232, 1181, 1240) — repaired. F06
Sylvester–Gallai (line 369), Felsner–Weil (418), stretchability (499), walls (247), non-Pappus
(518–529) stated; docstring in the required form listing the unstatable headlines (58–79) —
repaired (R05 corrects one reason). F07 house shape with `*Needs:*` on every target, `### Examples`
and `### Dependencies` per layer, `## Exact supplier contracts`, `## How to read the build`,
`## Downstream consumers`, `## References`; the dependency check now has this roadmap's edges —
repaired (R03 is a new order defect inside it). F08 three Checks per target (counted: 54 targets,
162 bullets) — repaired. F09 `prnum=0 residue=0 readme-ids-missing=0`, `module` header — repaired.
F10 padding removed; the 27 sorried theorems all fail the one-tactic probe — repaired. F11 wiring
convention in the `n + 1` form (Convention 8, `Wiring.wordProd` line 381), `[IsStrictOrderedRing]`
carried on `isChirotope_ofVectorsFun` and `IsRealizable`, `crossX` junk value documented,
`IsSimple` docstring — repaired. F12 routes of 3.8 (b) and 3.9 (i) in the roadmap's own terms, no
file pointers, the non-uniform question excluded in Scope — repaired. F13 Humphreys "§5.4,
Corollary to Theorem 5.4" (README 196, 1479) — repaired and verified (df121192 line 4386 is in
§5.4, line 4390 opens §5.5).

**Gate and dependency check.** Worker's gate at 8a1d1ab: every counter 0, `build=0`, OK. My run of
the scanners with `--order merge-order-candidate.txt`: every counter 0, OK. Dependency check
(`gate --depcheck … --movable`): `depcheck: 232 roadmaps, 2108 edges, 0 problem(s)`; no UPWARD,
CYCLE or `moved:` line. Pins: Tau Ceti `358314d4`, Mathlib `f6090c70`, identical in the branch and
main manifests. Other changes outside the folder: none (`diff --stat` empty).

**One-tactic probe.** Scratch copy with `by first | rfl | (simp; done) | infer_instance | trivial
| (decide; done) | (norm_num; done)` on all 27 sorried theorems: 27 fail (errors at lines 170, 188,
192, 244, 249, 256, 319, 322, 344, 349, 353, 361, 370, 402, 420, 452, 458, 469, 489, 503, 517,
521, 528, 566, 571, 587, 602). No padding; no declaration restates a Check or computes a value.

**Elaborated signatures.** The 73 types in the worker's signatures file read against the README:
none lost a section binder; the two statements without `[Finite E]` are R01, the rest agree with
their README statements (hypotheses `2 ≤ n` on `exists_chirotope_chiFun` and `range_signAt`, none
on `isUniform_chiFun_iff` and `isPathConnected_cell`, general position `hgen` on 3.6 and 6.1,
`3 ≤ n` on `card_torusGroup`, `[Finite B]` on `geometricRepresentationFun`).

**Library declarations opened at the pins.** Mathlib: `Matroid.ofIsBaseOfFinite`
(Combinatorics/Matroid/IndepAxioms.lean 523, arguments `hE`, `IsBase`, `exists_isBase`,
`isBase_exchange`, `subset_ground`, as used at line 147–150), `Matroid.eRk` (Rank/ENat.lean 78),
`CircularOrder` and `sbtw := btw a b c ∧ ¬ btw c b a` (Order/Circular.lean 150, 123),
`Fin.revPerm` (Data/Fin/Rev.lean 37), `Equiv.optionCongr` (Logic/Equiv/Option.lean 36),
`CoxeterMatrix.H₃` (GroupTheory/Coxeter/Matrix.lean 268, `!![1,3,2; 3,1,5; 2,5,1]`),
`CoxeterMatrix.B` (125: entry `4` between indices `n − 1` and `n − 2`, so between `1` and `2` for
`n = 3`, as 9.4's Check says), `CoxeterMatrix.A` (107), `reindex` (90), `CoxeterMatrix.Group`
(Basic.lean 108), `CoxeterSystem.lift` (329), `lengthParity` (Length.lean 145), `Graph`
(Combinatorics/Graph/Basic.lean 90), `toSimpleGraph`/`ofSimpleGraph` (Simple.lean 100/119),
`crossProduct` (LinearAlgebra/CrossProduct.lean 47), `conjAlgEquiv` (Algebra/Algebra/Equiv.lean
981), `linearEquivFunOnFinite` (LinearAlgebra/Finsupp/Defs.lean 60), `MonoidHom.ofClass`
(Algebra/Group/Hom/Defs.lean 406). Tau Ceti: `GroupTheory/Coxeter/Geometric.lean` `geometricForm`
(125), `geometricReflection` (161), `isLiftable_geometricReflection` (458),
`geometricRepresentation` (479), `geometricRepresentation_simple` (485),
`orderOf_simple_mul_simple` (525), `orderOf_simple` (553); its header (line 94–99) says
faithfulness is not proved there, and no roadmap on main or at the open heads mentions
`geometricRepresentation`, so the gap is unowned on main as the README says;
`Combinatorics/RibbonGraph/EulerCharacteristic.lean` `even_eulerChar` (35),
`IsConnected.eulerChar_le_two` (41), `Genus.lean` `IsConnected.two_sub_two_mul_genus` (59);
`PermutationTriple/Regular.lean` `IsRegular` (66); `Topology/JordanCurve/Basic.lean`
`IsJordanCurve` (108). No `GMap` in Tau Ceti at the pin, as the docstring says.

**Cross-roadmap citations resolved.** SurfaceTopology at the head of pull request #271 (read through
`roadmaps show`): Layer 1 `structure GMap (n : ℕ) (D : Type*) [Fintype D] [DecidableEq D]` with
`adj`, `involutive`, `commute_of_far` (its README line 290–293), `abbrev GMap2` (296), `GMap.Cell`
as the orbit quotient of `closure {adj j | j ≠ i}` (298–299, matching Convention 12), `GMap2.Iso`
(301), `GMap2.eulerChar` (307), `IsSurfaceGMap` = no dart fixed by `adj 0` or `adj 1` and
`adj 2 d ≠ adj 0 d` (322–323), `IsClosedSurfaceGMap` adds `adj 2 d ≠ d` (326–327, as Layer 8's
intro says), `GMap2.IsOrientable` by a set `S` (330–331: the empty map is orientable, as 8.1's
Check says), `Components` (603, 1047); Layer 2 `toBipartiteRibbonGraph`, `toCombinatorialMap`,
`eulerChar_toCombinatorialMap` (420–428); Layer 4 `orientationDoubleCover` and
`orientationDoubleCover_eulerChar = 2 * eulerChar` (571, 588–589); Layer 8 the classification
(1173). GraphConnectivityAndFlows on main, §1.1 "Undirected walks, isomorphisms, and representation
bridges" (README line 224–256): the isomorphism interface (230) and `toSimpleGraph
(Graph.ofSimpleGraph H) ≃ H` (246) as cited. RootSystems on main: Layer 3 "the missing Coxeter
combinatorics" (line 274), Layers 2 and 4 Weyl groups and the longest element (245, 296, 316) as
Scope says. BelyiMaps on main owns `PermutationTriple` and the ribbon-graph carrier (its README 12,
43, 58). Ownership: `roadmaps grep` over main and the 451 open pull requests for chirotope,
oriented matroid, signotope, cartographic group, string C-group, abstract polytope,
hemi-icosahedron, wiring diagram, allowable sequence and pseudoline matches only this roadmap, so
it owns all of them; the shared objects are `GMap` (SurfaceTopology) and the geometric
representation (Tau Ceti). The two gaps are precise and minimal: `gap:gmap-arbitrary-darts` asks
exactly for the carrier without `Fintype`/`DecidableEq`, which Layers 7 and 9 need (coset flag
systems on an infinite quotient), and `gap:coxeter-geometric-faithfulness` for the one theorem
absent at the pin. There is no board package and no `design/plan.json` for this pull request, so the
slugs are recorded in the README only, as the previous review asked.

**Sources: the seeded sample and the rest (15 targets).** 1.2: BLSWZ Lemma 3.5.4/§3.6 not readable;
the statement checked by computation (rank 1 two opposite terms; alternating chirotope on five,
`x = (1,2,3,4)`, `y = (1,5)`: terms `0, −1, 1, −1`). 1.3: `Matroid.ofIsBaseOfFinite` at the pin as
above. 1.7: BLSWZ §3.4, §7.1 not readable; Checks consistent (parallel classes `{1,2}, {3}, {4}`,
loop). 3.1: no external locator; `crossX = 1, 3/2, 2` recomputed. 3.3: Convention 7 recomputed
against the determinant (4688 random instances, 0 disagreements). 3.6: BLSWZ 5.2.1/Ch. 6 and
Goodman–Pollack 1984 not readable (R06). 4.5: Felsner–Goodman Theorem 5.4.5 (340a6c28 line 654–656)
and 5.5.8 Ringel (924–928) read; Roudneff–Sturmfels and Ringel 1956 not readable; flips computed.
4.6: Table 5.6.1 (340a6c28 line 951–957: simple projective arrangements `1, 1, 1, 4, 11, 135, 4382`
for `n = 3..9`) and OEIS A006248 (e72916bc line 19, 25) read. 5.1: BLSWZ 7.1.4, 7.1.8 not readable;
the rank-2 Check recomputed (`(0,+,+)`, `(−,0,−)`). 6.3: Ringel 1956 not readable; the configuration
recomputed (below). 7.1: Mathlib `H₃` as above; Grothendieck's cartographic group `⟨σ₀, σ₁, σ₂ |
σᵢ² = (σ₀σ₂)² = 1⟩` with the oriented subgroup of index 2 (318e4b2c line 338–347). 8.2:
SurfaceTopology Layer 4 as above; counts below. 9.1: no source; the empty case checked. 9.5: group
theory recomputed (orders 10, 4, 6 of the stabilisers, `60/10, 60/4, 60/6`). 10.2: Tau Ceti
`orderOf_simple_mul_simple` and Humphreys' Corollary (df121192 line 4386). Also read: Kelly–Rottenberg
Theorem 3.6 `λ ≥ 3n/7` (a5f2dd27 line 191–193), Bokowski–Pokora Theorem 1.3 and Corollary 1.4
`t₂ ≥ 3` (46d6099b line 86–94), Eppstein Lemma 1 and the Bose–Everett–Wismath step (cb7bf7ab line
121–134), Vakil Theorem 3.1 (80e61142 line 263), Bergold–Egeling–Hoang on the Felsner–Weil
bijection (0bf2529b line 44–45), OEIS A006245 `1, 1, 2, 8, 62, 908` (360d0d6c line 25).

**Adversarial table.**

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 2.2 `exists_orientedMatroid_covectorsOf` | infinite realizable `E` above | `sep X Y = {e}`; for every vertex `(±1/m, 0)`, `(±1, 0)` on `e` the forced signs on `fₙ` (`n > m`) and `gₙ` disagree; no `Z` | **false** without `[Finite E]` | R01 |
| 2.2 same, finite | alternating chirotope on 5; three independent vectors; `(1,0),(1,1),(0,1)` in rank 2 | L0–L3 hold on all 83 covectors (`1 + 20 + 40 + 22`); 27 covectors; 13 covectors, 6 topes | sound | none |
| 1.1 axioms, alternating on 5; `nonPappusFun`; `ofVectorsFun pappusPoints`; the `−1` variant | all `x`, `i ≠ j`, `a,b,c,d` | 0 three-term violations each, exchange holds | sound | none |
| 1.1 Check 2 | rank 2 on 4, `χ13 = −1` | terms `χ12χ34, −χ13χ24, χ14χ23 = 1, 1, 1` | Check sound | none |
| 1.2 Check 3 | alt5, `x = 1234`, `y = 15` | `0, −1, 1, −1` | sound | none |
| 1.5 dual Check | rank 1 on `Fin 3` | signs of `(2,0,1), (1,0,2), (0,1,2)` = `+, −, +` | sound | none |
| 1.6 Check | rank 2 on 3 | `ε₁ε₂·ε₁ε₃·ε₂ε₃ = (ε₁ε₂ε₃)² = 1 ≠ −1` | sound | none |
| 2.3 `three_le_ncard_walls` | alt5; 3 elements; `(1,0,0),(2,0,0),(0,1,0),(0,0,1)` | min walls 3, 10 triangles; 8 topes with 3 walls; max walls 2 | sound; simplicity needed | none |
| 2.6 counts | alt5; rank 2 on 2; rank 1 | `20 − 40 + 22 = 2`; `4 − 4 = 0`; `2` | sound | none |
| 2.7 forward | `E = {1,2}`, `χ12 = 1`; order `(1+),(2+),(1−),(2−)` | the four cases of `a.1 ≠ b.1` all agree with `sbtw a b (−a)`; reversed order disagrees | sound | none |
| 2.7 converse | `E = Fin 1`, `E = ∅` | circular order exists, `|E| − 1 = 0` between `a` and `−a`; no `Chirotope 2 E` | **false** | R02 |
| 3.1 `crossX`, `IsSimple` | `y = x, 1, 3 − x`; `y = x, 0, −x`; `a = (−1, 1)` | `1, 3/2, 2`, simple; `0, 0, 0`, not simple; `f₀ − f₁ = −2x > 0` left of `0` | sound | none |
| 3.2 `signAt` sign | `(3/2, 6/5)`; `(0, 1)` on `y = 0` | `(+, −, +; +) ∈ L`, `(−, +, −; +) ∉ L`; `sign(0 − 1) = −1` | sound | none |
| 3.3 `tupleSign` | `(0,1,2), (1,0,2), (2,1,0), (1,2,0), (0,0,1)` | `1, −1, −1, 1, 0` = sign of the sorting permutation | sound | none |
| 3.3 `chiFun` is a chirotope, `n = 2`; `n = 1` | `Option (Fin 2)`, `Option (Fin 1)` | one basis `{0, 1, none}`, simple; no injective triple, `chiFun ≡ 0` | `2 ≤ n` needed and present | none |
| 3.3 `isUniform_chiFun_iff` | `n = 0, 1, 2`; `n ≥ 3` | both sides vacuous/true; both reduce to `crossX i j ≠ crossX j k` | sound | none |
| 3.4 `chiFun_ofLines` | 300 random integer arrangements, 2–6 lines; the three lines | `sign det = sign (x_jk − x_ij)` on 4688 instances; `det = 1`, `det` with `none` `= 1` | sound | none |
| 3.5 (i) | three lines; `n = 2`; `n = 0, 1` | 19 covectors with `none = 1`, point patterns ⊆ them; 9 = 9; `L = {0}` while `signAt` has a value | sound, `2 ≤ n` present | none |
| 3.5 Check 3 | three lines | 12 cocircuits: 6 with `none = 0`, 3 with `none = 1`; closure of the triangle = 7 cells | sound | none |
| 3.6 | `n = 2`, `χ = −alt` | `R = {none}` | sound | none |
| 3.8 (a) | 3 independent; 3 + loop; rank 2 on 3 | pairs are the rank-2 flats; every rank-2 flat has 3 elements; only flat is `E` | hypotheses right | none |
| 3.9 (ii) | `n = 3`, `n = 4` | 48 vs 24; 24 = 24 (octahedral graph) | "at least four" needed, present | none |
| 4.2 `wordProd`, `IsWiringDiagram` | `[0,1,0]`, `[1,0,1]`, `[0,0,1]`, `[0,1,0,1,1]`, `n = 0` | `revPerm`, `revPerm`, `swap 1 2`, `revPerm` with 5 letters, `[]` | sound | none |
| 4.3 counts | 3, 4, 5 wires | `(2, 2), (16, 8), (768, 62)` | sound | none |
| 4.4 signotopes | `Fin 4`, `Fin 5`; `(+, −, +, +)` | 8, 62; two sign changes | sound | none |
| 4.4 signotope ⇔ GP3 with `none` | sorted `i<j<k<l`, `x = (i,·,·), (j,·,·), (k,·,·), (l,·,·)` | forbidden patterns `(+,−,+)` on `(ijk,ijl,ikl)`, `(ijk,ijl,jkl)`, `(ijk,ikl,jkl)`, `(ijl,ikl,jkl)` ⇔ at most one sign change | convention consistent | none |
| 4.4 local sequences | `[0,1,0]` | wire 0: `1, 2`; wire 1: `0, 2`; wire 2: `0, 1` | sound | none |
| 4.5 flips | alt5, all 10 triples; `{1,3,5}` | legal exactly at `123, 125, 145, 234, 345`, 7200 violations each otherwise; terms `(1, 1, 1)` | sound | none |
| 4.5 Levi's triangle theorem | source generality | Felsner–Goodman 5.4.5: any arrangement, `n ≥ 3` | narrowed to uniform | R04 |
| 4.6 Check 2 | `Fin 4` | incidence matrix `J − I` over `𝔽₂` has `det ≡ 1`: 16 distinct reorientations | sound | none |
| 5.3 Levi | `Y, Z` sharing a zero at `e`; `Z = −Y`; `|E| = 3` | parallel extension at `e` gives both; same point; vertex + triangle point | sound | none |
| 6.1 ⇒ | realization with `(v a)₀ = 0` (a vertical line) | `det(v a, v b, (0,0,1)) = y ≠ 0`, so general position allows it; an affine rotation (fixing `(0,0,1)`) and signed rescaling (reorientation) make every line `(−1, a, b)`; `det g < 0` absorbed by reorientation on `univ` | sound | none |
| 6.2 Pappus | `pappusPoints`; `A 0 = A 1`; `det A = 2` | `C = (13,2,5), (15,3,8), (2,1,3)`, `det 0`; `det 0`; `det C = −60` | sound | none |
| 6.3 | all 84 triples; all 126 quadruples; all 36 pairs | the nine listed lines, no four collinear, no proportional pair | sound | none |
| 7.1 | `p = ![3, 5]`; `n = 1`; `p i = 1` | `H₃`; `!![1,0;0,1]`; `off_diagonal` fails | sound | none |
| 7.2 `IsLiftable` | entries `1`, `2`, `0` | `(f i)² = 1`, commutation, no relation | sound | none |
| 7.3 Checks | `D = Empty`; `Bool` with swap; `Fin 3` with `swap 0 1` | 1 automorphism vs 0 darts; 2 = 2; 2 < 3 | sound | none |
| 8.1 | `D = Empty` | `IsOrientable` with `S = ∅`, even part transitive vacuously | `Nonempty D` needed, present | none |
| 8.2 counts | 3, 4, 5 elements | `(3,6,4)/(6,12,8)`, `(6,12,7)/(12,24,14)`, `(10,20,11)/(20,40,22)`; `χ = 1`, `2` | sound | none |
| 9.1 | `D = Empty` | regular vacuously, `Nat.card Aut = 1 ≠ 0` | `Nonempty D` needed, present | none |
| 9.2 Convention 12 | `r_g ∘ r_h` | `x ↦ x h g = r_{hg}` | `Gᵐᵒᵖ` right | none |
| 9.4 | `A 3`, `B 3`, `H₃` | `24/6, 48/8, 120/10 = 4, 6, 12`; `B 3` has `4` at `(1,2)` | sound | none |
| 9.5 | `H₃ ≅ A₅ × ℤ/2`, `c = s₀s₁s₂` of order 10 | `c⁵ = w₀ = −1`, centre of order 2; `6 − 15 + 10 = 1` | sound | none |
| 9.6 `torusInvolution` | `n = 2..6` | involutive, `ρ₀ρ₂` commute; orders of `ρ₀ρ₁, ρ₁ρ₂, ρ₀ρ₂` = `3, 6, 2` (`3, 3, 2` at `n = 2`); group orders `24, 108, 192, 300, 432` | sound, `3 ≤ n` present | none |
| 10.1 Gram entries | `M i j = 0`, `M i i = 1` | `−cos 0 = −1`, `−cos π = 1` | sound | none |
| 10.2 | `n = 0` | group of order 2, acts on `ℝ` by `−1` | sound | none |
| `Chirotope 0 E`, `IsSimple` in ranks 0, 1 | empty tuple; `|E| ≥ 2` | `±1`; forces `E = ∅`, `|E| ≤ 1` | consistent with docstring | none |
| `Triangle` with `a = b` | `flipFun a a c` | `range t = {a, c}` never for injective `t`, flip `= χ` | harmless | none |

**Build order (R03) aside, the layer dependencies are consistent:** every `*Needs:*` line cites
targets of the same or an earlier layer except 3.9 → 8.3 and 4.3 → 4.5.

## Not verifiable

- BLSWZ, *Oriented Matroids* (CUP): Definition 3.5.3, Lemma 3.5.4, Theorem 3.5.5, §3.4, §3.6,
  §3.7, Definition 4.1.1, §4.1, §4.6, Theorem 5.2.1, Chapter 6, Proposition 7.1.4, Theorem 7.1.8,
  §7.2: no legal copy in the cache and none found by the service; cited by locator.
- McMullen–Schulte, *Abstract Regular Polytopes* §2A, §2E, Theorem 2E11; Coxeter–Moser §8.4;
  Bondy–Murty Theorem 10.28; Knuth, *Axioms and Hulls*: no legal copy.
- Folkman–Lawrence 1978; Lawrence 1982; Levi 1926; Ringel 1956; Goodman–Pollack 1980 and 1984;
  Felsner–Weil 2001; Felsner 1997; Roudneff–Sturmfels 1988; Björner–Edelman–Ziegler 1990; Whitney
  1932; Bose–Everett–Wismath 2003; Jones–Singerman 1978; Vince 1983: paywalled or JSTOR/Wiley/World
  Scientific; cited by locator only. Felsner–Goodman 5.4.5 and 5.5.8, Eppstein's Lemma 1 and
  Bergold–Egeling–Hoang line 44–45 confirm the statements attributed to Levi, Ringel,
  Bose–Everett–Wismath and Felsner–Weil respectively.
- Grothendieck's Montpellier manuscripts (folder 80): unpublished; cited only as context.
- Ownership against open pull requests was checked only through `roadmaps grep` and the sibling
  checkouts named in the brief.

## Source issues

- none
