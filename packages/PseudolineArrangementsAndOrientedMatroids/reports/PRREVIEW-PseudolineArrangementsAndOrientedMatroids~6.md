# Review of PseudolineArrangementsAndOrientedMatroids (pull request #1523 at 703fdd4)

**Verdict:** needs changes

Full review of `TauCetiRoadmap/PseudolineArrangementsAndOrientedMatroids/README.md` and
`TauCetiRoadmap/PseudolineArrangementsAndOrientedMatroids/Suggested.lean` at 703fdd4 (240 changed
lines since 8a1d1ab, the head the previous review read). The gate passes on this head (my own run
with the merge order: every scanner 0, the targeted build with `sorry` the only warning); the
dependency check reports `depcheck: 240 roadmaps, 2351 edges, 0 problem(s)` with no UPWARD, CYCLE
or `moved:` line; no file outside the folder changes (`diff --stat origin/main...HEAD` excluding
the folder is empty). All six findings of the previous review are repaired (itemised under
*Verified sound*). Both pins moved since the previous review (Tau Ceti `358314d4` → `2fd255d9`,
Mathlib `f6090c70` → `1b1ccf4b`, identical in the branch and main manifests), so every library
declaration was re-opened at the new pins, and every cross-roadmap citation re-resolved on main
and at the open heads. One citation has drifted: the supplier gap on RootSystems asks for a
theorem that RootSystems on main now plans (R01). Everything else I recomputed is right.

## R01 (P2) — `gap:coxeter-geometric-faithfulness` asks for what RootSystems §1.3 on main already plans; 10.1 restates its transport

Location: README line 58–60 ("The faithfulness of the geometric representation of an arbitrary
Coxeter system is owned by no roadmap on main; it is the supplier gap
gap:coxeter-geometric-faithfulness below"), line 197–201 (`**From RootSystems.** What RootSystems
must provide (gap:…)`, "RootSystems is the owner of Coxeter combinatorics on main (Layer 3
there); its Layers 2 and 4 are named in Scope"), line 1377, 1381–1386 (10.1: "define
`geometricRepresentationFun cs`, the representation on `B → ℝ` obtained by conjugating with
`Finsupp.linearEquivFunOnFinite` … Prove that on `cs.simple i` it is the conjugate of
`M.geometricReflection i`, and that it is injective, from gap:…"), line 1417; `Suggested.lean`
line 79–80 and 613–615.

Claim: no roadmap on main owns the faithfulness of `CoxeterSystem.geometricRepresentation` for an
arbitrary Coxeter system, so it is declared as a gap, and the transport to function coordinates is
this roadmap's.

Witness: main commit `03a683f6` ("RootSystems: faithful standard Coxeter geometric
representation", merged 2026-11-04, an ancestor of this head) puts RootSystems at
`TauCetiRoadmap/RepresentationTheory/RootSystems/`. Its README §1.3 "Faithfulness and transport"
(line 335–337): "Prove `geometric_faithfulness`: ρ is injective for every Coxeter system", with
Humphreys §5.4, Corollary, and its `Suggested.lean` line 59–61: `theorem geometric_faithfulness
{I W : Type*} [Group W] {M : CoxeterMatrix I} (cs : CoxeterSystem M W) : Function.Injective
cs.geometricRepresentation`, exactly the gap's `needs`. The same §1.3 (line 356–358) also owns the
transport: "For finite I, transport to `I → ℝ` through `Finsupp.linearEquivFunOnFinite`; the
transported representation is exactly Tρ(w)T⁻¹, with the same simple-generator formula", which is
10.1's definition and its two API bullets. RootSystems on main has Layers 1–3 (line 248, 432, 504:
geometric roots and faithful representations; the marked Weyl presentation; classification), no
Layer 4, and its Scope (line 11–20) says Coxeter combinatorics, longest elements and chambers are
consumed from Mathlib and Tau Ceti, not owned there. A gap that asks for what a roadmap on main
already provides is a finding of the brief's own list; so is a construction two roadmaps own.

Repair: delete the gap and cite the owner. In `## Exact supplier contracts` replace the
`**From RootSystems.**` paragraph by a plain contract: RootSystems §1.3 `geometric_faithfulness`
(injectivity of `cs.geometricRepresentation` for every Coxeter system on an arbitrary index type)
and §1.3's transport of the representation to `I → ℝ` along `Finsupp.linearEquivFunOnFinite` for
finite `I`, with its simple-generator formula, for 10.1 and 10.2. In Scope replace line 58–60 by
"RootSystems (on main) owns the general Coxeter geometric sign and faithfulness theorems (its
Layer 1) and the marked Weyl presentation (its Layer 2); the faithfulness of the geometric
representation is consumed from its §1.3." Rewrite 10.1 as consumption: "The representation in
function coordinates `geometricRepresentationFun cs` is RootSystems §1.3's transport of
`cs.geometricRepresentation` along `Finsupp.linearEquivFunOnFinite`; it is injective by
`geometric_faithfulness` there", keep its three Checks, and set `*Needs:* Tau Ceti
`CoxeterSystem.geometricRepresentation`, `CoxeterSystem.geometricRepresentation_simple`;
RootSystems §1.3.` Replace "Its faithfulness is gap:…" (line 1377), the 10.2 sentence "through
10.1" and the Layer 10 Dependencies line ("Layer 7, Tau Ceti and RootSystems §1.3. 10.2 uses
10.1."), and in `Suggested.lean` the docstring sentence at line 79–80 ("The proof of 10.1–10.2
consumes RootSystems §1.3 `geometric_faithfulness`, which is not at the pins") and the docstring
of `geometricRepresentationFun_cartographic_injective` (line 613–615). The definition
`geometricRepresentationFun` may stay in the Lean file as the carrier that makes the headline
statable (the file cannot import RootSystems' module), with its docstring saying it is
RootSystems §1.3's transport. Nothing else cites the gap (grep of `gap:coxeter` gives exactly the
lines above); the dependency check accepts a citation of a roadmap on main whatever its position.

## Verified sound

**Previous findings (review at 8a1d1ab), checked passage by passage.**

- R01 — repaired. `Suggested.lean` line 245–246 `theorem exists_orientedMatroid_covectorsOf
  [Finite E] (χ : Chirotope r E)`, line 467 `theorem isChirotope_flipFun [Finite E]`; README 2.2
  line 437–438 "for a finite `E` the covectors of a chirotope form an `OrientedMatroid`",
  Convention 4 line 102–104 ("for a finite `E` it is the classical covector set (BLSWZ
  Proposition 3.7.2), and for an infinite `E` it can fail (L3)"), and the negative-control Check
  at line 454–460 with the lines `e, a₁, a₂, b₁, b₂, fₙ, gₙ`. Recomputed: at the vertex
  `(1/m, 0)` on `e`, `fₙ(1/m, 0) = n(1 − n/m) < 0` for `n > m` and `gₙ(1/m, 0) = −(n²/m + n) < 0`,
  while `X fₙ = sign(1 + n) = +` and `X gₙ = sign(1 − n) = −` at `(0, 1)`: the multiplier must be
  `−1` on `fₙ` and `+1` on `gₙ`, as the Check says.
- R02 — repaired. README line 529–531 "for `|E| ≥ 2`, that every circular order … comes from a
  unique simple rank-2 chirotope", Check line 545–547 (`E = Fin 1`: no injective pair, computed).
- R03 — repaired. 3.9 is now 8.4 (line 1207–1238, text unchanged, `*Needs:* 1.6, 3.7, 8.3`);
  the braid-move clause moved from 4.3 (line 786–788: "That a braid move is a legal mutation is
  proved in 4.5", `*Needs:* 4.2`) into 4.5 (line 829–833, `*Needs:* 1.5, 2.2, 2.3, 4.2, 4.3`);
  the three Dependencies lines (line 740–741, 872–873, 1247–1248) and the supplier contracts
  (line 182, 195) follow. Every `*Needs:*` line now cites only earlier targets.
- R04 — repaired. Line 833–836: "in a simple rank-3 chirotope on a finite `E` with `3 ≤ |E|`
  every element is a wall of at least three triangular cells …, so there are at least `|E|` of
  them (Levi 1926; Felsner–Goodman 2017, Theorem 5.4.5)"; the near-pencil Check (line 848–850)
  recomputed below (4, 4, 4, 6).
- R05 — repaired. `Suggested.lean` line 248–252 `theorem exists_chirotope_covectorsOf [Finite E]
  (L : OrientedMatroid E) : ∃ (r : ℕ) (χ : Chirotope r E), L.covectors = covectorsOf χ`; README
  line 442–445 with the rank-0 case; docstring line 61–63 now lists only the uniqueness up to
  sign and the equality of ranks as unstated. Checked: `Chirotope 0 E` exists for every `E`
  (the two constant functions on the empty tuple; every axiom is vacuous or trivial), and
  `covectorsOf` of it is `{0}` (no `Fin 0`), so `L = {0}` is covered.
- R06 — repaired. Line 660–664: the route (contract at `none`, slope order from 2.7, sweep by
  induction with the local sequence, piecewise-linear drawing, comparison through 3.3), "No
  target of Layers 4 or 5 is used", `*Needs:* 1.5, 1.7, 2.7, 3.3`; Dependencies line 741.

**Gate and dependency check.** Worker's gate at 703fdd4: every counter 0, OK. My run
(`gate … --base origin/main --order merge-order-candidate.txt`): `set_option=0 … depcheck=0
metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`, exit 0. Dependency check
(`gate --depcheck … --movable`): `depcheck: 240 roadmaps, 2351 edges, 0 problem(s)`, no UPWARD,
CYCLE or `moved:` line.

**One-tactic probe.** Scratch copy with every `sorry` replaced by `by first | rfl | (simp; done) |
infer_instance | trivial | (decide; done) | (norm_num; done) | (exact Finite.of_fintype _)`,
elaborated with `lake env lean`: 28 errors at the 28 sorried theorems (lines 171, 189, 193, 246,
251, 256, 263, 326, 329, 359, 364, 368, 376, 385, 417, 435, 467, 473, 484, 504, 518, 532, 536, 543,
581, 586, 602, 617). No declaration closes; none restates a definition, mirrors a Check or
computes a value. The file has 29 occurrences of `sorry`: 28 theorems and the docstring's mention.

**Elaborated signatures.** The worker's 73 types read against the README: none lost a section
binder; `[Finite E]` now on `exists_orientedMatroid_covectorsOf`, `exists_chirotope_covectorsOf`
and `isChirotope_flipFun`; `crossX` is a field of `MonotoneArrangement` with `crossX_comm`,
`crossX_self` and `cross` (so two arrangements with the same `f` are equal: `crossX i j` for
`i < j` is the unique crossing abscissa, symmetry and the diagonal fix the rest);
`exists_unique_circularOrder` uses `@SBtw.sbtw _ c.toSBtw` with no `letI` (and the uniqueness is
real: in any circular order on `E × ℤˣ` satisfying the condition, the open arc from `a` to `−a` is
`{b | b.1 ≠ a.1 ∧ χ(a, b) = 1}`, of size `|E| − 1`, and these arcs for all `a` determine the
cyclic order: `b` precedes `c` inside the arc of `a` iff `c` lies in the arc of `b`).

**Library declarations opened at the new pins.** Mathlib `1b1ccf4b`: `Matroid.ofIsBaseOfFinite`
(Combinatorics/Matroid/IndepAxioms.lean 524), `Matroid.eRk` (Rank/ENat.lean 79), `Matroid.dual`
(Dual.lean 109), `Matroid.IsFlat` (Closure.lean 94), `CircularOrder` (Order/Circular.lean 151),
`SBtw` (108), `Fin.revPerm` (Data/Fin/Rev.lean 40), `Equiv.optionCongr` (Logic/Equiv/Option.lean
36), `CoxeterMatrix.H₃` (GroupTheory/Coxeter/Matrix.lean 260), `CoxeterMatrix.B` (123),
`CoxeterMatrix.A` (107), `CoxeterMatrix.Group` (Basic.lean 109), `reindexGroupEquiv` (128),
`toCoxeterSystem` (164), `IsLiftable` (296), `lengthParity` (Length.lean 129), `Graph`
(Combinatorics/Graph/Basic.lean 90), `Graph.Simple` (Simple.lean 76), `toSimpleGraph` (100),
`ofSimpleGraph` (119), `crossProduct` (LinearAlgebra/CrossProduct.lean 47), `conjAlgEquiv`
(Algebra/Algebra/Equiv.lean 977), `linearEquivFunOnFinite` (LinearAlgebra/Finsupp/Defs.lean 60),
`MonoidHom.ofClass` (Algebra/Group/Hom/Defs.lean 406), `MulAction.orbitRel`
(GroupTheory/GroupAction/Defs.lean 287), `MulAction.IsPretransitive`
(Algebra/Group/Action/Pretransitive.lean 60), `Function.Involutive.toPerm` (Logic/Equiv/Basic.lean
774). Tau Ceti `2fd255d9`: `GroupTheory/Coxeter/Geometric.lean` `geometricForm` (125),
`geometricReflection` (161), `isLiftable_geometricReflection` (458), `geometricRepresentation`
(479), `geometricRepresentation_simple` (485), `orderOf_simple_mul_simple` (525), `orderOf_simple`
(553); the only injectivity there is `simple_injective` (531), so faithfulness is still not at the
pin; `Combinatorics/RibbonGraph/EulerCharacteristic.lean` `even_eulerChar` (35),
`IsConnected.eulerChar_le_two` (41), `Genus.lean` `IsConnected.two_sub_two_mul_genus` (59);
`PermutationTriple` (PermutationTriple/Basic.lean 76); `IsJordanCurve` (Topology/JordanCurve/
Basic.lean 107). A word grep of the Tau Ceti pin for GMap, chirotope, signotope, pseudoline,
oriented matroid, cartographic and polytope finds only transport polytopes: the carriers are not
at the pin, as the docstring says.

**Cross-roadmap citations resolved.** SurfaceTopology at the head of #271 (`421e114`, unchanged
since the previous review): Layer 1 `structure GMap (n : ℕ) (D : Type*) [Fintype D] [DecidableEq D]`
with `adj`, `involutive`, `commute_of_far` (its README line 290–293), `abbrev GMap2` (296),
`GMap.Cell` as the orbit quotient of `closure {adj j | j ≠ i}` (298–299), `GMap2.Iso` (301),
`GMap2.eulerChar` (307), `IsSurfaceGMap` = no dart fixed by `adj 0` or `adj 1` and
`adj 2 d ≠ adj 0 d` (322–323), `IsClosedSurfaceGMap` adds `adj 2 d ≠ d` (326–327), `GMap2.IsOrientable`
by a set `S` (330–331); Layer 2 `toBipartiteRibbonGraph`, `toCombinatorialMap`,
`eulerChar_toCombinatorialMap` (420–428); Layer 4 `orientationDoubleCover` (571) and
`orientationDoubleCover_eulerChar = 2 * eulerChar` (588–589); Layer 8 the classification (1173).
`gap:gmap-arbitrary-darts` is still precise and minimal (the carrier without `Fintype`/`DecidableEq`,
which 7.5's coset flag systems on `cartographicGroup n ⧸ H` need). GraphConnectivityAndFlows on
main §1.1 (README 224–246): the isomorphism interface (230) and `toSimpleGraph (Graph.ofSimpleGraph
H) ≃ H` (246). BelyiMaps on main owns `PermutationTriple`, dessins, ribbon graphs and triangle
groups (its README 5, 12, 14, 33). RootSystems on main: R01. Ownership: a grep of main and of the
open heads (the `rev/` checkouts) for chirotope and oriented matroid matches only this roadmap;
`roadmaps grep` over the 460 open pull requests for signotope, pseudoline, cartographic, string
C-group, abstract polytope, hemi-icosahedron, wiring diagram and allowable sequence matches
nothing else; no roadmap cites PseudolineArrangementsAndOrientedMatroids (Downstream consumers is
right). `geometricRepresentation` is cited by RootSystems (#1196 and main) and EnriquesSurfaces
#1286 (its own `coxeterGeometricFaithful`); RootSystems' Scope settles that boundary in its
favour, and it is the owner on main.

**Sources: the seeded sample (15 targets) and the rest.** 1.4: BLSWZ §3.5 not readable; the
Plücker Check recomputed (`p12 p34 − p13 p24 + p14 p23 = 1·1 − 1·(−1) + 2·(−1) = 0`, terms
`1, 1, −1`). 2.1: BLSWZ Definition 4.1.1 not readable; the five-vector (L3) failure recomputed
(`sep = {e₂}`, no `Z` with `Z e₂ = 0`, `Z e₁ = +`). 2.2: BLSWZ Theorem 3.5.5, Proposition 3.7.2
not readable; counts recomputed (13 covectors and 6 topes in rank 2; 27 covectors on three
elements; the infinite-`E` Check above). 2.6: §4.6 not readable; `20 − 40 + 22 = 2`, `4 − 4 = 0`,
`2 = 1 + 1`. 3.6: BLSWZ 5.2.1 and Goodman–Pollack 1984 not readable; the route is the standard
sweep construction and uses only 1.5, 1.7, 2.7, 3.3. 3.7: no external locator; flag counts
`24 = 4·6`, `48 = 4·12`, Euler characteristic `3 − 6 + 4 = 1`, `6 − 12 + 7 = 1`. 4.2: no external
locator; `wordProd [0,1,0] = revPerm` on three wires. 4.3: OEIS A006245 (cache 360d0d6c line 25:
`1, 1, 2, 8, 62, 908, …`) read; `(16, 8)` and `(768, 62)` recomputed in the earlier round. 4.4:
Felsner–Weil 2001 and Felsner 1997 paywalled; Bergold–Egeling–Hoang (cache 0bf2529b line 44–45)
confirms the bijection; 8 and 62 signotopes recomputed earlier. 4.5: Felsner–Goodman 2017
Theorem 5.4.5 (cache 340a6c28 line 654–656: any arrangement of `n ≥ 3` pseudolines, every
pseudoline borders at least 3 triangles, hence at least `n` triangles) and Theorem 5.5.8 (line
924–928, Ringel's homotopy theorem); the glossary (line 37–41) defines an arrangement as not a
pencil, which rank 3 guarantees (a pencil has no basis). 7.4: no external locator; the tetrahedron's
`{1,2}`-residues have sizes `6, 6, 6, 6` (computed on `S₄` with left multiplication by the
adjacent transpositions; `{0,2}`: six of size 4, `{0,1}`: four of size 6). 7.5: no external
locator; `H = ⊤`, `H = ⊥` and the empty case as stated. 9.6: Coxeter–Moser §8.4 not readable;
group orders recomputed below. 10.1: Tau Ceti as above; Gram entries `−cos(π/2) = 0`,
`−cos π = 1`, `−cos 0 = −1`. 10.2: `orderOf_simple_mul_simple` at the pin; Humphreys §5.4,
Corollary (cache df121192 line 4386–4389, §5.5 opens at line 4390), now RootSystems §1.3's
locator too. Also read: Kelly–Rottenberg Theorem 3.6 (a5f2dd27 line 191–193), Bokowski–Pokora
Theorem 1.3 and Corollary 1.4 for essential arrangements (46d6099b line 86–94), Eppstein Lemma 1
with the Bose–Everett–Wismath step (cb7bf7ab line 121–134), Table 5.6.1 (340a6c28 line 951–957),
OEIS A006248 (e72916bc line 25: `1, 1, 1, 1, 1, 4, 11, 135, 4382, …`), Grothendieck's cartographic
group (318e4b2c line 338–347).

**Adversarial table.**

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 10.1–10.2 faithfulness, ownership | RootSystems on main §1.3 | `geometric_faithfulness : Function.Injective cs.geometricRepresentation` for every `cs`; transport to `I → ℝ` stated there | supplier exists, gap asks for it | R01 |
| 2.2 `exists_orientedMatroid_covectorsOf` | `[Finite E]`; the infinite arrangement | `(1/m,0)`: `fₙ < 0` (`n > m`), `gₙ < 0`; `X fₙ = +`, `X gₙ = −`: no `Z` | false without finiteness, now carried | none |
| 2.2 `exists_chirotope_covectorsOf` | `L = {0}` on any `E`; `E = ∅` | `r = 0`: `Chirotope 0 E` has two members, `covectorsOf = {0}` | sound | none |
| 2.1 (L3) Check | five vectors on two elements, `X = (+,+)`, `Y = (+,−)` | `sep = {e₂}`, candidates with `Z e₂ = 0`, `Z e₁ = +`: none | Check sound | none |
| 2.2 counts | `(1,0),(1,1),(0,1)`; three independent; alt5 | `13` covectors, `6` topes; `27`; `83 = 1 + 20 + 40 + 22` | sound | none |
| 2.3 `three_le_ncard_walls` | three lines; alt5; near-pencil | walls per tope all `3`; `3,…,5` with ten triangles; all `3` | sound | none |
| 2.7 converse | `E = Fin 1` | no injective pair, so no `Chirotope 2 (Fin 1)` | `|E| ≥ 2` needed, present | none |
| 2.7 uniqueness | arcs `{b : χ(a,b) = 1}` | size `|E| − 1`; `b` before `c` iff `c` in arc of `b` | order determined | none |
| 3.1 `crossX` field | `ofLines`, `i = j`; `i > j` | `0`; `(b j − b i)/(a i − a j)` symmetric | data determined by `f` | none |
| 3.4 `chiFun_ofLines` | 200 random integer arrangements, 2–6 lines, 1257 triples | `sign(crossX jk − crossX ij) = sign det` on all; `det` with `(0,0,1)` row `= 1` on all pairs | sound | none |
| 3.6 route | `n = 2`, `χ = −alt` | `R = {none}`; inputs 1.5, 1.7, 2.7, 3.3 only | sound | none |
| 4.5 Levi's triangle theorem | near-pencil `y=0, y=x, y=−x, y=1`; three lines; alt5; pencil of 3 plus `y=1`, `y=2x+5` | 6 projective triangles, element walls `4,4,4,6`; `4,4,4` of 4; `3,3,3,3,3` of 5; `3,4,3,4,4` of 6 | sound for simple non-uniform too | none |
| 4.5 flips | alt5, all 10 triples | legal exactly at `123, 125, 145, 234, 345` (earlier round) | sound | none |
| 7.4 residues | tetrahedron on `S₄` | `{1,2}`-orbits `6,6,6,6` (4 vertices); `{0,2}` six of 4 (edges); `{0,1}` four of 6 (faces) | sound | none |
| 8.4 (ii) Check | three elements | `S₃ × (ℤ/2)³ = 48` vs `24` map automorphisms | "at least four" needed | none |
| 9.6 `torusGroup` | `n = 2, 3, 4, 5` | orders `24, 108, 192, 300`; `(ρ₀ρ₁, ρ₁ρ₂, ρ₀ρ₂)` of orders `(3,3,2)` at `n = 2`, `(3,6,2)` after | `3 ≤ n` needed, present | none |
| 10.1 Gram entries | `m = 2, 1, 0` | `0, 1, −1` | sound | none |
| 1.4 Plücker Check | `(1,0),(0,1),(1,1),(1,2)` | `1 − (−1) + (−2) = 0`, terms `1, 1, −1` | sound | none |
| 3.7 counts | 3 and 4 elements | `(3,6,4)`, 24 flags, `χ = 1`; `(6,12,7)`, 48 flags, `χ = 1` | sound | none |

## Not verifiable

- BLSWZ, *Oriented Matroids* (CUP): Definition 3.5.3, Lemma 3.5.4, Theorem 3.5.5, §3.4, §3.6,
  §3.7, Definition 4.1.1, §4.1, §4.6, Theorem 5.2.1, Chapter 6, Proposition 7.1.4, Theorem 7.1.8,
  §7.2: no legal copy in the cache and none found by the service; cited by locator.
- McMullen–Schulte §2A, §2E, Theorem 2E11; Coxeter–Moser §8.4; Bondy–Murty Theorem 10.28; Knuth,
  *Axioms and Hulls*: no legal copy.
- Folkman–Lawrence 1978; Lawrence 1982; Levi 1926; Ringel 1956; Goodman–Pollack 1980 and 1984;
  Felsner–Weil 2001; Felsner 1997; Roudneff–Sturmfels 1988; Björner–Edelman–Ziegler 1990; Whitney
  1932; Bose–Everett–Wismath 2003; Jones–Singerman 1978; Vince 1983: paywalled; cited by locator.
  Felsner–Goodman 5.4.5 and 5.5.8, Eppstein's Lemma 1 and Bergold–Egeling–Hoang line 44–45
  confirm the statements attributed to Levi, Ringel, Bose–Everett–Wismath and Felsner–Weil.
- Grothendieck's Montpellier manuscripts (folder 80): unpublished; cited only as context.
- Ownership against open pull requests was checked through `roadmaps grep` and the `rev/`
  checkouts named in the brief.

## Source issues

- none
