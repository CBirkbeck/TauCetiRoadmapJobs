# Review of PseudolineArrangementsAndOrientedMatroids (pull request #1523 at aa4a788)

**Verdict:** needs changes

Full review of `TauCetiRoadmap/PseudolineArrangementsAndOrientedMatroids/README.md` and
`TauCetiRoadmap/PseudolineArrangementsAndOrientedMatroids/Suggested.lean` at aa4a788. The gate
fails on this head (text scanners `prnum=4 sorry-data=21 residue=1 readme-ids-missing=4
target-ids=1`, build warning `build=1`); the dependency check reports 0 problems, but only because
the README has no `*Needs:*` line, so it has no edge to check. The mathematics of the roadmap is
mostly right: of the statements I computed, one is false as written (R02) and two fail on the empty
dart type (R05). The blocking problems are the Lean file (sorry'd data everywhere, a restated
carrier of another roadmap) and two supplier citations that do not resolve.

## R01 (P1) — Suggested.lean is built on sorry'd data

Location: `Suggested.lean` lines 100–107 (`Neg`), 129–135 (`ofVectors`), 143–168 (`reorient`,
`relabel`, `contract`), 212–218 (`toOrientedMatroid`), 247 (`crossX … := sorry`), 260
(`chirotope … := sorry`), 267–270 (`ofLines`), 323–329 (`mutate`), 383–384 (`wiringArrangement :=
sorry`), 464 (`nonPappus := sorry`), 515–524 (`stringCoxeterMatrix`), 539–543 (`ofIsLiftable`),
569–571, 574–576 (`cosetGMap`, `regularGMap`, proof argument `sorry`), 600–605 (`skeleton`), 625
(`instance : (Subgroup.zpowers hemiW₀).Normal := sorry`), 628–629, 644–647, 655–657.

Claim: the file states the roadmap's headline theorems against the pins.

Witness: the gate counts 21 `def`/`instance` bodies containing `sorry`; four definitions (`crossX`,
`chirotope`, `wiringArrangement`, `nonPappus`) are nothing but `sorry`. In the one-tactic probe,
`chirotope_eq_of_commutationStep` (line 399) closes by `rfl`: `wiringArrangement w hw` unfolds to the
same `sorryAx` term for every word, so the equation is `sorry = sorry`. Every theorem about
`A.chirotope`, wiring diagrams, `nonPappus`, the hemi-icosahedron and the torus therefore asserts
nothing (`exists_monotoneArrangement`, `range_signAt`, `exists_triangle_of_braidStep`,
`card_commutationClasses_five`, `nonPappus_not_isRealizable`, `hemiIcosahedron_*`,
`torusTriangulation_eulerChar`, …), and `hemiIcosahedron` mentions a sorry'd instance.

Repair: no sorry'd data and nothing that mentions one. Give real bodies where a body exists at the
pins and move the rest to the README as targets with their intended signatures: `crossX` is
`Classical.choose` on the `cross` field (symmetrised); the chirotope of an arrangement is a raw
function `A.chiFun : (Fin 3 → Option (Fin n)) → SignType` with a real body, and "it is a
chirotope" becomes a theorem; `ofVectors`, `reorient`, `relabel`, `mutate`, `toOrientedMatroid`
likewise state a raw function and the chirotope or covector axioms as theorems, or are README
targets; `stringCoxeterMatrix`'s three fields and `ofIsLiftable`'s two are routine and must be
proved, not sorried; the quotient of `H₃` is by `Subgroup.center` (normal by definition), with
`center = zpowers hemiW₀` a theorem; `nonPappus`, `wiringArrangement`, `cosetGMap`, `regularGMap`,
`torusInvolution` are README targets and the headlines that need them are named in the docstring
as not statable.

## R02 (P1) — 3.5 (i) and `range_signAt` are false: the sign of `signAt` is the negative of the covector

Location: README line 339–341 ("the range of `signAt A` is `{X ∈ L | X none = 1}`"), conventions
lines 150–155 and 3.2 (line 329); `Suggested.lean` 254–256, 281–282.

Claim: the sign vectors of points of the plane are exactly the covectors of `A.chirotope` with
`X none = 1`.

Witness: three lines `y = x`, `y = 1`, `y = 3 − x` (slopes strictly antitone). By 3.4 the chirotope
is `ofVectors` of `(−1, 1, 0)`, `(−1, 0, 1)`, `(−1, −1, 3)`, `(0, 0, 1)`, and its covectors are the
sign vectors `e ↦ sign ℓ(v_e)` of linear functionals. The point `(3/2, 6/5)` inside the bounded
triangle has `signAt = (−1, +1, −1; none ↦ +1)`; that vector is not a covector, while `(+1, −1, +1;
+1)` is. Computed exactly over ℚ with the cocircuit closure: 19 covectors with `none = 1`, 19
sign-vector patterns of points, the two sets differ, and the covector set equals the set of
`signAt` patterns negated on the `some` coordinates. The reason is that the functional of the
point `(x, y)` on `(−1, a, b)` is `−y + a x + b = −(y − f(x))` while it is `+1` on `(0, 0, 1)`.

Repair: either `signAt A p (some i) := sign (A.f i p.1 − p.2)` (the positive side of a pseudoline is
below it) or `signAt A p none := −1` with 3.5 (i) reading `{X ∈ L | X none = −1}`; carry the same
convention through 3.5 (iii)–(v) and 8.2, and add the triangle above as a Check with its computed
vector.

## R03 (P1) — RootSystems §3G does not exist; geometric faithfulness is unowned on main

Location: README lines 45–46, 94–96, 226, 655–656, 662, 667; `Suggested.lean` lines 25, 666, 682–687.

Claim: "RootSystems §3G owns `Function.Injective cs.geometricRepresentation` for every Coxeter
system".

Witness: RootSystems on main (`TauCetiRoadmap/RepresentationTheory/RootSystems/README.md`) has no
section 3G and no statement about `geometricRepresentation` (grep: only the faithfulness of the
Weyl-group permutation action, lines 186, 239, 267). At the head of the open revision #1278
(f33895a) the theorem is `geometric_faithfulness` in **§1.3 "Faithfulness and transport"** (its
README line 335–337); there is no §3G there either. A pull request that revises an existing roadmap
is not a dependency, so on main the prerequisite of all of Layer 10 and of
`geometricRepresentationFun_cartographic_injective` is written as supplied and is supplied by
nobody.

Repair: in `## Exact supplier contracts`, under RootSystems, declare `What RootSystems must provide
(gap:coxeter-geometric-faithfulness): injectivity of ``CoxeterSystem.geometricRepresentation`` for
every Coxeter system ``cs : CoxeterSystem M W`` on an arbitrary index type (Humphreys, Corollary
in §5.4)`, cite it from 10.1–10.2 as `gap:coxeter-geometric-faithfulness`, and drop "§3G" everywhere
(the board package has no `design/plan.json`, so the slug can only be recorded in the README; say
so). The brief's rule for a prerequisite written as supplied but existing nowhere is P1; the repair
is small.

## R04 (P2) — The flag carrier is restated, in a form SurfaceTopology does not have

Location: `Suggested.lean` lines 471–509 ("Stand-ins for SurfaceTopology"); README lines 13,
80–85 ("the form it asks #271 to adopt (see *Reciprocal changes*)"), 160–166, 227.

Claim: `GMap n D` on an arbitrary dart type is "the arbitrary-dart form agreed with that roadmap",
and the stand-in section "is deleted when #271 lands".

Witness: at the head of pull request #271 (421e114), SurfaceTopology Layer 1 declares `structure
GMap (n : ℕ) (D : Type*) [Fintype D] [DecidableEq D]` and `abbrev GMap2 (D) [Fintype D]
[DecidableEq D]` (its README, representative statements of Layer 1); its downstream-consumer table
lists GeometricTopology, BelyiMaps and a future Four Colour roadmap, not this one; the words
"pseudoline", "cartographic" and "Reciprocal" occur nowhere in it, and this README has no
section called *Reciprocal changes*. So the cited supplier form does not exist where it is cited,
and `Suggested.lean` declares a second owner of `GMap`, `GMap.Cell`, `GMap.IsConnected`, `GMap2`,
`IsClosedSurfaceGMap`, `GMap2.eulerChar`, `GMap2.IsOrientable`.

Repair: delete the stand-in section; the Layer 7–9 headlines whose statements need `GMap` are named
in the module docstring as not statable at the pins (carrier owned by SurfaceTopology). In the
README cite SurfaceTopology Layer 1 as it is (finite, decidable darts) and drop the agreement
claim; if the arbitrary-dart form is really needed, declare `gap:gmap-arbitrary-darts` with
supplier SurfaceTopology and the one-sentence needs ("`GMap n D` and its cells without the
`Fintype D` and `DecidableEq D` arguments, finiteness a hypothesis of the counting results").
Layers 7 and 9 as written (coset flag systems on `cartographicGroup n ⧸ H`, regular flag systems on
an infinite group) do need it.

## R05 (P2) — Two "iff"s fail on the empty dart type

Location: `Suggested.lean` 563–564 (`isRegular_iff_card_aut`), 596–597
(`isOrientable_iff_evenMonodromy`); README 9.1 (line 607–610), 8.1 (590–593).

Claim: for a finite connected flag system, regular ↔ `Nat.card Aut = Nat.card D`; for a connected
closed surface map, orientable ↔ the even monodromy is not transitive.

Witness: `D = Empty`, `G.adj i = 1`. `IsConnected` (`IsPretransitive` on an empty type) holds
vacuously, `IsClosedSurfaceGMap` holds vacuously, `IsRegular` holds vacuously, but `Nat.card G.Aut =
Nat.card (Perm Empty) = 1 ≠ 0 = Nat.card D`. Likewise `IsOrientable` holds with `S = ∅` while
`IsPretransitive G.evenMonodromy D` also holds vacuously, so the right-hand side is `¬ True`.

Repair: add `[Nonempty D]` to both theorems and to 8.1 and 9.1 in the README; add the empty flag
system as a negative-control Check of 9.1.

## R06 (P2) — Headlines statable at the pins are absent, and the not-statable ones are not named

Location: `Suggested.lean` module docstring lines 4–29; README 2.2 (Theorem 3.5.5), 2.6, 3.7–3.9,
4.4, 6.1, 9.3.

Claim: the file states the roadmap's headline theorems.

Witness: statable now and absent: Sylvester–Gallai for pseudolines (3.8 (a): for a simple rank-3
chirotope on a finite type with at least three elements some rank-2 flat of `χ.matroid` has exactly
two elements, statable with `Matroid.IsFlat` and `Matroid.eRk` at the pin); the Felsner–Weil
bijection 4.4 (`IsSignotope` is defined at line 420 and then used by nothing); the stretchability
criterion 6.1 (once `A.chiFun` has a body, R01). Not statable and not named in the docstring: 3.7
(the map of an arrangement), 3.9 (i)–(ii) (skeleton faithfulness and uniform reconstruction), 9.3
(regular polytopes ↔ string C-groups; no abstract polytope carrier), 2.4–2.6 (face lattice, Euler
relation; no rank of a covector), 5.4–5.5, 2.2's Theorem 3.5.5 (no rank of an `OrientedMatroid`).
The docstring is the old "suggested forms, not exhaustive" template and names none of them.

Repair: state the statable ones; rewrite the docstring in the required form ("<title>: target
signatures"; the roadmap is README.md; this file states the headline theorems against the pinned
APIs; which headlines are not statable and what each lacks).

## R07 (P2) — No target has a `*Needs:*` line; the README is not in TauCetiRoadmap form

Location: README throughout: headings `## Ownership` (39), `## Scope boundary` (64), `## Pinned
conventions` (118), `## Existing foundations` (194), `## Layer k — …` with numbered paragraphs
`k.n **Title.**` instead of `### k.n` subsections, `## Sources` (670), `## Provenance` (735).

Claim: every layer states its dependencies and every target its inputs.

Witness: `grep -c 'Needs:' README.md` is 0; the dependency check prints `205 roadmaps, 1660 edges,
0 problem(s)` because this roadmap contributes no edge at all; the gate prints `target-ids=1:
layered README states no targets`. There is no `## Exact supplier contracts` (the supplier
declarations are scattered over "Existing foundations" and "Other roadmaps"), no `## How to read
the build`, no `### Examples` or `### Dependencies` in any layer, no `## Downstream consumers`
(the two research uses at line 59–61 would go there), and `## References` is called "Sources".

Repair: the README shape of the brief: `## Scope and ownership`, `## Conventions`, `## Exact
supplier contracts` (`### From Mathlib`, `### From Tau Ceti`, `### From
TauCetiRoadmap.SurfaceTopology`, `### From TauCetiRoadmap.GraphConnectivityAndFlows`, `### From
TauCetiRoadmap.RootSystems` with the gap of R03), `## How to read the build`, `## Layer k: <title>`
with `### k.n` prose subsections each ending in a `*Needs:*` line, `### Examples` and `###
Dependencies` per layer, `## Downstream consumers`, `## References`. Re-run the dependency check
afterwards; it must then show this roadmap's edges.

## R08 (P3) — Definitions without Checks

Location: README 0.1, 1.1, 1.3–1.5, 2.1–2.5, 2.7, 3.1–3.3, 4.1, 4.2, 4.4, 5.1, 5.4, 6.1, 7.1–7.5,
8.1, 8.3, 9.1–9.3, 9.6, 10.1.

Claim: each definition has at least three discriminating Checks.

Witness: the word "Check" occurs at lines 406, 432 and 480 only (3.8, 3.9, 4.5), one Check each;
every other definition has none.

Repair: a `**Checks.**` list per definition, three bullets each. Values computed in this review
that can seed them: the triangle of R02; the alternating chirotope on five elements has exactly
the five cyclically consecutive triples as triangles (flipping any of the other five triples gives
7200 three-term violations); the torus group of 9.6 has order 24 ≠ 48 at `n = 2` (the product
`ρ 1 * ρ 2` has order 3 there), which is why `n ≥ 3` is needed; the empty flag system of R05; for
three elements the labelled skeleton of 3.9 (ii) has 48 label-compatible automorphisms against 24
map automorphisms, which is why "at least four elements" is needed; `IsSimple` is unsatisfiable in
rank 1 with two or more elements.

## R09 (P3) — Gate text failures: pull-request numbers, process residue, external Lean names, module warning

Location: README 45, 48, 83, 96, 223–227, 360, 655 (`#271`, `#1278`, GitHub pull links; also the
code block at 32–37); 227 ("stand-in"); 389, 415, 419–420 ("what is still to be compared", "until
that comparison is proved here"); 210–212 (`IsConnected.eulerChar_le_two`,
`IsConnected.two_sub_two_mul_genus` presented as names of this roadmap), 757 (`triangle_map`, an
external file's name); `Suggested.lean` line 1 (`import Mathlib` without `module`).

Witness: gate `prnum=4 residue=1 readme-ids-missing=4 build=1 FAIL`; the build warning is "imports
`Mathlib` … designed for use with the module system; consider adding `module`".

Repair: cite SurfaceTopology and RootSystems by name and section only; timeless wording for 3.8
and 3.9 (state the targets and their route, not what is "still to be compared"); write the Tau Ceti
names under `### From Tau Ceti` with their full `TauCeti.…` prefix and the external names in prose;
write the Lean file as `module` / `public import Mathlib` / `public import
TauCeti.GroupTheory.Coxeter.Geometric` / `@[expose] public section` (TypeAHeckeAlgebras on main is
the precedent), which the gate's import rule accepts.

## R10 (P3) — Padding in Suggested.lean

Location: `Suggested.lean` 59–66 (`compose_assoc`, `neg_compose`, `compose_comm_iff`,
`confLE_compose`), 115–116 (`matroid_isBase_iff`), 331–332 (`mutate_apply`), 394–396
(`chirotope_isUniform`), 411–413 (`card_commutationClasses_five`), 466 (`nonPappus_isSimple`), 536
(`isLiftable`), 550 (`range_monodromyHom`), 617 (`card_H₃_group`), 631–633
(`hemiIcosahedron_isClosedSurface`, `_isConnected`), 676–680 (`geometricRepresentationFun_simple`),
691–695 (`orderOf_cartographic_simple_mul_simple_succ`); unused definitions 110 (`matroid`), 161
(`contract`), 170 (`ReorientationEquivalent`), 197 (`IsCocircuit`), 416–423 (`AtMostOneSignChange`,
`IsSignotope`, unless 4.4 is stated), 560 (`residueRel`), 569 (`cosetGMap`), 600 (`skeleton`), 613
(`HasIntersectionProperty`); 450–455 (`pappus`).

Witness: one-tactic probe on a scratch copy (`lake env lean`, 40 sorried theorems):
`matroid_isBase_iff` closes by `rfl`; `mutate_apply` is `rfl` in the file; three theorems are
already proved by `simp`/`rw` from one Tau Ceti lemma; `card_commutationClasses_five` and
`card_H₃_group` compute values (62 and 120, both checked: 768 reduced words of the longest
element of `S₅` fall into 62 commutation classes); the nine definitions listed are used by no
theorem of the file. `pappus` is a theorem on bare `Fin 3 → Fin 3 → K` matrices whose conclusion is
algebra on its hypotheses, not a statement about the roadmap's objects.

Repair: delete them from `Suggested.lean`; the README keeps each as an API bullet or Check (Pappus
stays as the input of 6.3).

## R11 (P3) — README and Lean disagree on indexing and hypotheses

Location: `Suggested.lean` 27–28 and 362–366 (words in `Fin n` on `n + 1` wires) against README
158–160 (`List (Fin (n − 1))` on `n` wires); `ofVectors` (129) elaborates without
`[IsStrictOrderedRing 𝕜]` (signatures file, "Looks dropped") while the conventions (138–139) state
the ordered-field hypothesis; `crossX` (247) has no `i ≠ j`; `IsSimple` docstring (118) "for rank at
least two" with no hypothesis.

Repair: write the README's wiring convention in the `n + 1` form; carry `[IsStrictOrderedRing 𝕜]`
explicitly on `ofVectors` or drop it from the convention (the sign of a determinant needs only
`LinearOrder`); state `i ≠ j` on `crossX` or say in the README that the diagonal value is junk.

## R12 (P3) — 3.8 (b) and 3.9 (i) rest on an unpublished external Lean repository

Location: README 389–393, 415–420, 735–763 (`## Provenance`, file and line pointers L283, L569,
L624, L286, L1684, "Transport: …").

Claim: the classification of 3.8 (b) and the faithfulness 3.9 (i) are targets with a source.

Witness: the README itself says (line 419–420) "the edition's files are evidence for (i) and (ii),
not a proof of them"; the only locators for 3.8 (b) and 3.9 (i) are lines of
`Folder80Maps2.lean`/`Folder80Maps3.lean` in a GitHub repository and pages of an unpublished
manuscript (folder 80, pp. 20–28, 39–54). 3.9 (ii) has a published route (Bose–Everett–Wismath;
Eppstein 2014 Lemma 1, cb7bf7ab lines 121–134; Whitney); (i) and 3.8 (b) have none. The repository
README's "Porting existing work" asks that such work be coordinated and its licence checked
before reuse, which is a human decision; the roadmap should not depend on it.

Repair: state 3.8 (b) and 3.9 (i) as targets with the proof route in the roadmap's own terms (the
incidence argument of 3.8 (b) is short enough to sketch: simple vertex `a ∩ b`, two more vertices
of `a`, the fifth element sorted by the vertices of `{a, b, c, d}` it meets), keep a one-paragraph
provenance without file pointers or transport instructions, and say in `## Scope and ownership`
that the non-uniform skeleton question is not a target.

## R13 (P3) — Locator slips

Location: README 668–669 and 720–721 ("Humphreys §5.3, Corollary 5.4").

Witness: in Humphreys (cache df121192) §5.3 constructs the representation (line 4224–4236); the
corollary "the representation is faithful" is the Corollary of Theorem 5.4 in **§5.4** (line
4386). Also `Felsner–Weil 2001` and `Felsner 1997` are cited for the signotope and local-sequence
theorems of 4.4 and resolve only to paywalled pages: record them as uncertified in the manifest
(Bergold–Egeling–Hoang 2025, 0bf2529b line 44–45, confirms the Felsner–Weil bijection in print).

Repair: "§5.4, Corollary to Theorem 5.4"; mark the two Elsevier/Springer locators uncertified.

## Verified sound

**Gate and build.** Worker's gate at aa4a788 as in R09; my run with `--order
merge-order-candidate.txt`: the same scanner counts, `depcheck=0`, `FAIL`. Dependency check
(`gate --depcheck … --movable`): `205 roadmaps, 1660 edges, 0 problem(s)`, no UPWARD, CYCLE or
`moved:` line (no edges from this README, R07). Pins: Tau Ceti `358314d4` and Mathlib `f6090c70`
in both the branch and main manifests. Targeted build passes with `sorry` warnings plus the module
warning. Elaborated signatures: the worker's 114 `#check` types read against the README (one
dropped binder, R11).

**One-tactic probe.** Scratch copy with `by first | rfl | (simp; done) | infer_instance | trivial`
on all 40 sorried theorems: 38 fail, 2 close (`matroid_isBase_iff` by `rfl`;
`chirotope_eq_of_commutationStep` by `rfl` through the sorry'd `wiringArrangement`, R01).

**Library declarations opened at the pins.** Tau Ceti `GroupTheory/Coxeter/Geometric.lean`:
`geometricForm` (125, Gram entries `−cos(π / M i i')`, `−1` at an entry `0`),
`geometricReflection` (161), `geometricReflection_mul_self` (185), `geometricForm_geometricReflection`
(194), `isLiftable_geometricReflection` (458), `geometricRepresentation` (479),
`geometricRepresentation_simple` (485), `simple_mul_simple_pow_eq_one_iff` (511),
`orderOf_simple_mul_simple` (525, `orderOf = M i i'`), `simple_injective` (531), `orderOf_simple`
(553); its header says faithfulness is not proved there. `Combinatorics/RibbonGraph`:
`even_eulerChar` (EulerCharacteristic.lean 35), `IsConnected.eulerChar_le_two` (41), `genus`
(Genus.lean 41), `IsConnected.two_sub_two_mul_genus` (59), `blackDegree`/`whiteDegree` (Basic.lean
187/195), `Iso` (346); `PermutationTriple/Regular.lean`: `IsRegular` (66),
`automorphismGroupMulEquivMonodromyGroupMulOpposite` (240; the `ᵐᵒᵖ` convention the README
matches). Mathlib: `CoxeterMatrix.H₃` (Coxeter/Matrix.lean 268: `!![1,3,2; 3,1,5; 2,5,1]`, the string
matrix with `p = ![3, 5]` as the README says), `CoxeterMatrix.reindex` (90), `CoxeterSystem.lift`
(Basic.lean 329, on the subtype of `IsLiftable` families), `toCoxeterSystem_simple` (190),
`lengthParity` (Length.lean 145), `IsReflection` (Inversion.lean 66), `Graph` (Combinatorics/Graph/
Basic.lean 90), `Graph.Simple` (Simple.lean 76), `toSimpleGraph`/`ofSimpleGraph` (100/119),
`Matroid.ofIsBaseOfFinite` (Matroid/IndepAxioms.lean 523), `IsCocircuit` (Circuit.lean 569),
`eRank` (Rank/ENat.lean 74), `cIoo` (Order/Circular.lean 306), `crossProduct` and `⨯₃`
(LinearAlgebra/CrossProduct.lean 47/61). `TauCeti.IsJordanCurve` exists
(Topology/JordanCurve/Separation.lean) as the README says it is not used.

**Cross-roadmap citations resolved.** SurfaceTopology: only in pull request #271 (mccorvie, new
roadmap, head 421e114), read through `roadmaps show`; its Layer 1, Layer 2 (`toCombinatorialMap`,
`toBipartiteRibbonGraph`, `eulerChar_toCombinatorialMap`), Layer 4 (`orientationDoubleCover`,
`orientationDoubleCover_eulerChar = 2 * eulerChar`) exist as cited, in the finite-decidable form
(R04). GraphConnectivityAndFlows is on main; its §1.1 "Undirected walks, isomorphisms, and
representation bridges" supplies the graph-isomorphism interface the README calls "Target 1.1".
BelyiMaps is on main. RootSystems: R03. Ownership: `roadmaps grep` over main and the 440 open pull
requests for chirotope, oriented matroid, pseudoline, cartographic group, string C-group, abstract
polytope, hemi-icosahedron, signotope, allowable sequence, Folkman finds nothing outside this
roadmap, so this roadmap is the owner of all of it; the only shared objects are the `GMap` carrier
(R04) and the geometric representation (R03). Open pull requests whose files the brief does not
give were searched only through `roadmaps grep`.

**Sources (15 sampled locators, all read at the locator).** bokowski-pokora2018 (arXiv
1607.05864, cache 46d6099b): Theorem 1.3 is Melchior's equality `∑_{r≥2}(3 − r) t_r = 3 +
∑_{j≥3}(j − 3) p_j` (line 86–92) and Corollary 1.4 is `t₂ ≥ 3` (93–94), as the README says.
eppstein2014 (arXiv 1308.0066, cb7bf7ab): Lemma 1 (121–134): unique embedding of an arrangement
graph; the added vertex joined to vertices of degree < 4 gives a 3-connected planar graph by Bose et
al.; pseudolines are the paths through opposite edges. vakil2006 (arXiv math/0411469, 80e61142):
Theorem 3.1 (263) "every singularity type appears on some incidence scheme", attributed to Mnëv.
felsner-goodman2017 (Handbook ch. 5 preprint, 340a6c28): 5.1.1 Levi enlargement (84–87, two
points not on a common member), 5.4.5 Levi's triangle theorem (654–656, `n ≥ 3`, every pseudoline
borders ≥ 3 triangles, hence ≥ n), 5.5.8 Ringel's homotopy theorem (924–928), Table 5.6.1 (951–959:
simple projective arrangements 1, 1, 1, 4, 11, 135, 4382 for n = 3..9; simple Euclidean 2, 8, 62, 908).
oeis-a006245 (360d0d6c line 25: 1, 1, 2, 8, 62, 908, …) and oeis-a006248 (e72916bc line 25: 1, 1, 1,
1, 1, 4, 11, 135, 4382, …, "simple arrangements of pseudo-lines in the projective plane", line 19).
kelly-rottenberg1972 (msp.org PJM 40-3, a5f2dd27): Theorem 3.6 (191–193) `λ ≥ 3n/7`. humphreys
(df121192): reflections (4224–4228), the homomorphism (4233–4236), faithfulness corollary (4386–4389;
R13 for the section number). grothendieck-esquisse (Schneps' page, 318e4b2c): §2 lines 338–347, the
cartographic group `C₂ = ⟨σ₀, σ₁, σ₂ | σᵢ² = (σ₀σ₂)² = 1⟩` with the oriented group of index 2
generated by even products, matching `cartographicGroup 2` and 8.1. bergold2025 (LIPIcs 332,
0bf2529b 44–45): the Felsner–Weil bijection between pseudoline arrangements and 3-signotopes.
Mathlib `H₃` as above. radtke2023 (arXiv 2310.19711) fetched; cited only as a research use.

**Adversarial table.**

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 0.1 composition laws | `X = (+,0)`, `Y = (−,+)` | `X∘Y = (+,+)`, `Y∘X = (−,+)`, `sep X Y = {e₁}` | commute ↔ `sep = ∅` holds | none |
| Chirotope axioms, `nonPappus` (6.3) | all `x ∈ 9³`, `i ≠ j`, `a,b,c,d ∈ 9⁴` | three-term violations 0 (and 0 for `ofVectors P`); the nine three-point lines are exactly those listed; no four collinear | sound | none |
| 3.4 convention `(−1, a, b)`, `(0, 0, 1)` | symbolic | `det = (aᵢ−aⱼ)(aⱼ−aₖ)(crossXⱼₖ − crossXᵢⱼ)` (both sides the same six monomials); `χ(i,j,none) = sign(aᵢ − aⱼ) = +1` | sound | none |
| 3.5 (i) `range signAt` | lines `y=x`, `y=1`, `y=3−x` | 19 covectors with `none=1`; 19 point patterns; sets differ; equal after negating `some` coordinates; triangle point `(3/2, 6/5)` ↦ `(−,+,−,+)` ∉ L | **false** | R02 |
| 2.6 counts for uniform rank 3 | n = 3, 4 | `6, 12, 8` (octahedron) and `12, 24, 14`; `χ = 2` on the sphere, `1` projectively | sound | none |
| 2.3 no bigons | 3 concurrent elements; 3 concurrent + 1 | `χ ≡ 0`, not a chirotope; 4 vertices, 9 edges, 6 cells, all triangles | sound | none |
| 2.7 uniqueness of the circular order | `2|E|` points | each open arc `(a, −a)` has `|E| − 1` points, so `−a` is antipodal; the reversed order would need `S_{−a} = S_a` | sound | none |
| 4.2 wiring diagrams | 2 wires | `w = [0]`, `wordProd = Fin.revPerm`, length `1 = 2·1/2` | sound | none |
| 4.3 commutation classes | n = 5 | 768 reduced words of `w₀`, 62 classes (union-find over commutations) | sound | none |
| 4.5 flip Check | alternating chirotope on 5 | flipping `{1,3,5}`: terms `(1, 1, 1)`; flips at `123, 234, 345, 145, 125` give 0 violations, the other five 7200 each | Check sound; triangles are the cyclically consecutive triples | R08 seed |
| 4.5 `Triangle` with repeated `a = b` | rank-3, `walls = {a, b}` | `flipFun` changes no injective tuple | harmless | none |
| 6.2 Pappus degenerate | `Aᵢ ∥ Bⱼ`, `A = B` | `C = 0`, `det = 0` | sound | none |
| 7.2 `isLiftable` | `M i i = 1`, far `2`, adjacent `0` | `(adj i)² = 1`; `(adj i adj j)² = 1 ↔ commute` given involutive; `(…)⁰ = 1` | sound | none |
| 8.1 orientability iff | `D = Empty` | LHS `True` (`S = ∅`), RHS `¬ True` | **false** | R05 |
| 9.1 regular iff card | `D = Empty` | `IsRegular` vacuous; `Nat.card Aut = 1`, `Nat.card D = 0` | **false** | R05 |
| 9.2 `regularGMap_aut` without `hgen` | `ρ` generating a proper `H` | centraliser of left-`H` is larger than `Gᵐᵒᵖ` | hypothesis needed, present | none |
| 9.4 Platonic counts | orders 24, 48, 120 | `(24/6, 24/4, 24/6) = (4,6,4)`, `(6,12,8)`, `(12,30,20)` | sound | none |
| 9.5 hemi-icosahedron | quotient of order 60 | `60/10, 60/4, 60/6 = 6, 15, 10`, `χ = 1`, skeleton `K₆` (6 vertices of degree 5) | sound | none |
| 9.6 torus `ρ` | n = 2..7 | involutive ✓; orders of `ρ₀ρ₁, ρ₁ρ₂, ρ₀ρ₂` = `3, 6, 2` for n ≥ 3; group order 108, 192, 300, 432, 588 = `12n²`; n = 2 gives 24 ≠ 48 (`ρ₁ρ₂` of order 3) | sound, `n ≥ 3` needed | R08 seed |
| 9.6 Euler characteristic | n ≥ 3 | `n² − 3n² + 2n² = 0` | sound | none |
| 9.3 polytope ranks | rank `n + 1` | ranks `−1..n+1`, maximal chains `n + 3` elements, graded of length `n + 2` | sound | none |
| 10.2 orders at the string matrix | entry 0, entry 2 | `orderOf_simple_mul_simple` gives 0 (infinite) and 2 | sound (proved in the file) | none |
| 3.6 reduction | contraction at `none` | a simple rank-2 chirotope is relabel-reorientation equivalent to the alternating one (cyclic arrangement), which is the far-left order | consistent | none |
| 3.9 (ii) hypothesis | n = 3; n = 4 | labelled skeleton automorphisms 48 (`S₃ × (ℤ/2)³`) vs 24 map automorphisms; n = 4: 24 = 24, octahedral graph `K₂,₂,₂`, 6 vertices, 12 edges | "at least four" needed and present; Check sound | R08 seed |
| 3.8 Checks | complete quadrangle; 3 lines; near pencil | each of the 6 lines meets 2 triple + 1 double point (3 vertices); any 5 of the 6 keep 2 triple points; 3 lines: 2 vertices each; pencil lines: 2 vertices | sound | none |
| 3.8 (a) Melchior from Euler | symbolic | `1 = f₀ − f₁ + f₂ ≤ f₀ − f₁/3` ⇒ `∑_v (3 − ν(v)) ≥ 3` | sound | none |
| 1.6 odd rank | r = 3 | `(−1)³ = −1` | sound | none |
| 1.3 `IsSimple` in rank 1 | `|E| ≥ 2` | the parallel clause has no witness | unsatisfiable (docstring says rank ≥ 2) | R11 note |
| 5.3 Levi | `Y, Z` on a common element | the new element may be parallel to it; README's second clause handles it | sound | none |
| `Chirotope` at r = 0 | empty tuple | `χ ∅ ≠ 0` required; consistent | degenerate ok | none |

## Not verifiable

- BLSWZ, *Oriented Matroids* (CUP): Definition 3.5.3, Lemma 3.5.4, Theorem 3.5.5, §3.4, §3.6, §3.7,
  Definition 4.1.1, §4.1, §4.6, Theorem 5.2.1, Chapter 6, Proposition 7.1.4, Theorem 7.1.8, §7.2:
  the service finds no legal copy ("no legal source found"); cited by locator only.
- McMullen–Schulte, *Abstract Regular Polytopes* (CUP) §2A, §2E, Theorem 2E11: no legal copy.
- Coxeter–Moser §8.4; Bondy–Murty Theorem 10.28; Felsner–Weil 2001; Felsner 1997; Goodman–Pollack
  1980 and 1984; Folkman–Lawrence 1978; Lawrence 1982; Vince 1983; Björner–Edelman–Ziegler 1990;
  Ringel 1956; Roudneff–Sturmfels 1988: the DOI resolves only to a paywalled page (uncertified).
- Levi 1926; Whitney 1932 (JSTOR); Jones–Singerman 1978 (Wiley); Bose–Everett–Wismath 2003 (World
  Scientific); Knuth, *Axioms and Hulls*: no legal source found by the service. Eppstein's Lemma 1
  quotes the Bose–Everett–Wismath statement used in 3.9 (ii).
- Grothendieck's manuscripts (folders 72, 79, 80, 86, 154) and the external Lean repository: not
  published sources (R12).

## Source issues

- none
