# Review of DGFloerPartII (pull request #1799 at ca56e15)

**Verdict:** needs changes

Full review of `TauCetiRoadmap/DGFloerPartII/README.md` (1103 lines) and
`TauCetiRoadmap/DGFloerPartII/Suggested.lean` (69 lines) at the same head the previous review
read; the folder is unchanged since then, but main and the open pull requests have moved. The
gate passes every check, the dependency check reports no UPWARD or CYCLE line, the Lean file
elaborates with only its eight `sorry` warnings, the nine elaborated signatures equal the README
statements, none of the eight theorems is padding, and the seeded source sample checks out
against the cached texts. Six findings: the standing ownership finding against main (R01, not
repairable in this folder, discharged by sequencing), a headline list that drops a hypothesis its
own Checks show necessary (R02), a supplier citation that an open revision of DifferentialGeometry
breaks (R03), and three P3 repairs (a Check false at `n = 1`, a quotient convention that differs
from the suppliers', a link anchor an open revision renames). The previous review's "G2.10"
finding is withdrawn: GeneralizedCohomology on main does define G2 item 10.

Source ids: `bdho-cotangent` is the base package's manifest id for the source paper
(arXiv:2404.07953v3, cached, 139 pages; a passage before the marker `=== page N ===` is on printed
page `N − 6`), `hatcher-at` the base package's id for Hatcher's *Algebraic Topology* (the full
book, 560 pages), and "CSS" the cached arXiv:2012.13634v1. This folder has no `sources.toml`;
this review records none (a fetch attempt for Ziller 1977 went into a scratch manifest only).

## R01 (P2) — Two owners on main: DGFloer Layer 11 still plans this roadmap's Layer 4

**Location.** `TauCetiRoadmap/DGFloerPartII/README.md` lines 32–39 ("The base roadmap … owns
every other numbered statement of the source") and Layers 1.3–1.4, 2, 3.1–3.2 and 4.

**Claim.** This roadmap owns abundance, fibered families, covering by diffeomorphisms, Lemma
6.35, homogeneous and projective spaces, Theorem G, the homogeneous carriers, the explicit degrees,
the projective based-loop energy and the multiple-realization step of Theorem B.

**Witness.** `TauCetiRoadmap/DGFloer/README.md` on main at eaf17b1 (2026-11-07): the Scope
bullet at lines 52–60 says "Layer 11.3 constructs Lemma 6.35's complete odd-rank
`π_(n−1)(SO(n))` torsion proof and both proofs of Proposition 6.34", and Layer 11 (heading at
line 1577) holds items 1–6: abundance and Theorem H (1579), fibered families (1581), covering by
diffeomorphisms with the seven low-rank values and the `n ≥ 17` splitting (1620–1631, the Lemma
6.35 bullet at 1624–1627), homogeneous spaces (1632), projective spaces (1645), Theorem G (1647). The base's open revision
(DGFloer at fc27fe2b) reduces Layer 11 to 11.1–11.3 (lines 3050–3091), says "DGFloerPartII
consumes this roadmap and supplies nothing to it" (line 53) and lists what DGFloerPartII consumes
(lines 3140–3142); it has not merged. The cross-PR grep for "abundant with 2-spheres", "covered
by diffeomorphisms", `π₈(SO(9))`, `Stiefel₂` and "rotation family" finds the objects only in this
folder, in DGFloer on main and in the superseded revision #963; the two other "rotation family"
hits (StringOrientation line 924, GeometricTopology line 2702) are unrelated circle families.

**Repair.** Nothing to edit in this folder. The pull request lands after the base's revision that
removes Layer 11 items 1–6, Layer 1 items 7–8, Layer 5 item 7 and the Layer 10 item 5
realization bullet from DGFloer; the pull request's merge-order block already lists that revision
first. Until it lands, main would carry two plans for every target of Layer 4, so the finding
stays blocking and is discharged by the sequencing alone. Every citation this README makes into
the base resolves under both numberings ("Layer `k` item `j`" on main is `k.j` at the revision
head: 1.1–1.6, 2.1–2.3, 3.4, 4.5, 5.1–5.6, 6.3–6.5, 10.2–10.5, 11.1–11.3), so no citation edit
is needed after the base lands. Re-raised: R01 of the previous review (same reason, same state).

## R02 (P2) — Theorem I's list drops the "not aspherical" hypothesis of Propositions 6.29 and 6.33

**Location.** README lines 12–13 (Summary: "compact Lie groups other than tori, manifolds covered
by diffeomorphisms, homogeneous spaces") and lines 984–987 (4.5: "this is **Theorem I** within
the scope boundary: spheres, sphere bundles over highly connected bases, compact connected Lie
groups other than tori, manifolds covered by diffeomorphisms, homogeneous spaces satisfying
Proposition 6.36, and `CPᵈ`, `HPᵈ`").

**Claim.** Every manifold covered by diffeomorphisms is abundant with 2-spheres.

**Witness.** `bdho-cotangent` lines 438–441: Theorem I(ii) is "manifolds that are not a `K(π,1)`
and that are covered by diffeomorphisms". The roadmap's own Checks refute the sentence as written:
4.3's fourth Check (line 916) says `T^r` is covered by diffeomorphisms through left translation,
and 4.1's first Check (line 775) says `T^r` is not abundant since `c°_HZ(D*T^r) = ∞`. Computed:
`T^r = ℝ^r/ℤ^r` acts on itself by translation, `ev(τ_v) = v`, so `A = [T^r] ∈ H_r(Diff(T^r))`
has `ev_*A = [T^r]` (covered); `π_k(T^r) = 0` for `k ≥ 2`, so `Ω²T^r` is contractible, no class of
degree `> r` or with nonzero reduced shriek exists, and `T^r` is not abundant. The `ℓ`-covered case
needs the stronger hypothesis of Proposition 6.33 (`bdho-cotangent` lines 5059–5062). 4.3 itself
states both propositions with their hypotheses (lines 857–859); only the two summary lists drop
them.

**Repair.** In both lists write "manifolds that are not aspherical and are covered by
diffeomorphisms (Proposition 6.29), or `ℓ`-covered with `π₂ ≠ 0` or a first nonzero `π_k`,
`k ≥ 3`, that is not `ℓ`-torsion (Proposition 6.33)". Tested on `T^r`: aspherical, so excluded;
on `S³ = SU(2)`: `π₃ = ℤ`, included, as 4.1's second Check says.

## R03 (P2) — DifferentialGeometry Layer 10 is dropped by its open revision; the degree moves to a later roadmap

**Location.** README line 86 (supplier table: "The Brouwer degree | DifferentialGeometry Layer
10"), lines 247–249 ("**DifferentialGeometry** Layer 10: the Brouwer degree, only through DGFloer's
homological degree interface (1.4)"), line 416 (1.4 *Needs:* "DifferentialGeometry Layer 10
through that interface") and line 465 (Layer 1 Dependencies).

**Claim.** DifferentialGeometry Layer 10 supplies the degree that 1.4 computes.

**Witness.** The open revision of DifferentialGeometry (#886, head at its checkout) has layers
0–5, 5.6 and 12 only (headings at lines 288–1204) and no Layer 10; its "Relation to sibling
roadmaps" (lines 1378–1382) says DeRhamCohomologyAndDuality "owns … the Brouwer mapping degree
with finite-parameter relative transversality, and the hairy ball theorem". DeRhamCohomologyAndDuality
(#1768, head d5b0c05a, README line 8: "the Brouwer degree (layer 10)") is merge-order line 380,
after DGFloerPartII at line 67, so this roadmap may not cite it. On main, DifferentialGeometry
Layer 10 exists (line 877), and DGFloer's own contract (main lines 130–135) takes the degree
interface from AlgebraicTopology Stage 6 item 5, "the homological characterization
`f_*[S] = deg(f) · [Q]` and its comparison with DG10's smooth degree" (AlgebraicTopology main line
1560: "the homological characterization and duality formulas for the shared manifold degree").
The overlap report lists this id as dropped by #886 at lines 86, 416 and 465.

**Repair.** Delete the four DifferentialGeometry citations and consume the degree where the base
already takes it: in 1.4's *Needs:* write "DGFloer Layer 1 item 1 and Layer 0, with the
homological degree interface the base takes from AlgebraicTopology Stage 6 item 5"; drop the
table row at line 86 and the bullet at lines 247–249 (its second sentence about partitions of
unity is already in the Mathlib contract at lines 140–142 and the table row at line 85); in the
Layer 1 Dependencies replace "DifferentialGeometry Layer 10" by "AlgebraicTopology Stage 6 item 5".
The 1.4 statement "The degree is a mapping degree in the sense of DGFloer's homological degree
interface" (line 413) already says this. Tested: the dependency check reads roadmap names, and
AlgebraicTopology is on main.

## R04 (P3) — "`U(n)` … not tori" is false for `n = 1`

**Location.** README lines 917–918 (4.3, fourth Check: "`SU(2)`, `SO(3)` and `U(n)` are not tori
and are abundant") and line 1028 (Layer 4 Examples: "`U(n)`").

**Claim.** `U(n)` is a non-torus compact connected Lie group, hence abundant by Proposition 6.31.

**Witness.** `U(1) = S¹ = T¹` is a torus; it is aspherical, so Proposition 6.29 does not apply and
it is not abundant (a point-fibre `Ω²S¹` is contractible). For `n ≥ 2`, `π₃(U(n)) = ℤ`, so `U(n)`
is not aspherical and the Check holds.

**Repair.** Write "`U(n)` for `n ≥ 2`" in both places (and, if wanted, add "`U(1) = T¹` is the
torus case" as the negative control).

## R05 (P3) — The projective quotient convention of 1.3 is not the suppliers'

**Location.** README lines 350–354 (1.3, "Projective quotients": "pin the supplied quotient
comparison `U(d+1)/(U(1) × U(d)) → CPᵈ` to `[g] ↦ [g e₀]`, including subgroup blocks, basepoint
… pin its `Sp(d+1)/(Sp(1) × Sp(d))` comparison to `[g] ↦ [g e₀]_ℍ`").

**Claim.** The supplied comparisons have stabilizer blocks `U(1) × U(d)`, `Sp(1) × Sp(d)` and base
point the first coordinate line.

**Witness.** The suppliers fix the opposite order and the last coordinate line:
`TauCetiRoadmap/RiemannianGeometry/README.md` main lines 287–289 (R1 consumes "the classical
quotient comparison with `U(d+1)/(U(d)×U(1))`, with base point the last coordinate line, matching
the ordered blocks and the HP convention") and `TauCetiRoadmap/GeneralizedCohomology/README.md`
main lines 1186–1189 (G4.0b: "For HP use the last coordinate line: embed `Sp(n)×Sp(1)` in that
ordered block decomposition and pin the cyclic coordinate permutation"). Computed: with `P` the
permutation matrix exchanging `e₀` and `e_d`, `P(U(1) × U(d))P⁻¹ = U(d) × U(1)` and
`[g] ↦ [g e₀]` on the left quotient corresponds to `[gP⁻¹] ↦ [gP⁻¹ e_d]` on the right one, so the
two comparisons differ by this conjugation; neither is "the supplied comparison pinned" to the
other's data.

**Repair.** Either state 1.3 in the suppliers' convention (stabilizer `U(d) × U(1)`, respectively
`Sp(d) × Sp(1)`, base point the last coordinate line `e_d`, `[g] ↦ [g e_d]`), or keep `e₀` and say
in one clause that the identification is the supplied comparison composed with conjugation by
the coordinate permutation exchanging `e₀` and `e_d`, as G4.0b itself pins for the Grassmannian
convention. The Conventions bullet "Orientations of homogeneous carriers" (lines 109–113) then
names the same block order.

## R06 (P3) — The ComplexKahlerGeometry link anchor is renamed by its open revision

**Location.** README line 221: `[K7.1–K7.2](../ComplexKahlerGeometry/README.md#k7-projective-torus-and-hopf-examples)`.

**Claim.** The anchor resolves in ComplexKahlerGeometry.

**Witness.** On main the heading is "## K7. Projective, torus, and Hopf examples" (line 1405), so
the anchor resolves today. At the head of the open revision #1398 the heading is "## Layer 7:
projective, torus, and Hopf examples" (line 2152) with subsections "### 7.1 Projective charts and
orientation (K7.1)" (2154) and "### 7.2 Projective bundles, forms and cohomology (K7.2)" (2211):
the ids K7.1 and K7.2 survive, the fragment does not. The overlap report lists the same anchor as
dropped by #1807 as well.

**Repair.** Link the README without a fragment, `[K7.1–K7.2](../ComplexKahlerGeometry/README.md)`,
which resolves on main and at both heads; the section ids in the text stay.

## Previous findings

- R01 (two owners on main) — not repaired, and not repairable in this folder: DGFloer on main at
  eaf17b1 still carries Layer 11 items 1–6 (lines 1577–1650) and the Scope bullet at lines 52–60;
  the base's revision at fc27fe2b has not merged. Re-raised above as R01.
- R02 ("GeneralizedCohomology has no section G2.10") — withdrawn, no change needed.
  `TauCetiRoadmap/GeneralizedCohomology/README.md` on main (last changed 2026-10-20, before both
  previous reviews) has, inside G2 (heading line 211, next heading G3 at line 663), the items
  "8. **Multiplicative infinite-loop construction**" (432), "9. **General topological-group
  classifiers**" (467) and "10. **Mapping-path replacements and homotopy fibres**" (533), which
  constructs `MappingPathSpace f`, `MappingPathFiber f k`, the continuous lifting function of a
  Hurewicz fibration and its Serre comparison (lines 533–562): exactly "the mapping-path
  replacement and raw lifting maps" the README cites at lines 216, 219, 281, 283 and 463. The
  previous witness read only items 1–7 (lines 213–405). DGFloer at fc27fe2b cites the same
  "GeneralizedCohomology G2.10" (line 988).

## Verified sound

**Gate and build.** The worker's gate at ca56e15: every scanner zero, `depcheck=0`, `build=0`,
`outside-folder=0`. Rerun of the dependency check:

    depcheck: 239 roadmaps, 2350 edges, 0 problem(s)

`lake env lean` of `TauCetiRoadmap/DGFloerPartII/Suggested.lean` emits exactly eight `declaration
uses sorry` warnings (lines 37, 40, 43, 47, 51, 55, 59, 66) and nothing else, in 13 s. No file
outside the folder is changed (`git diff --stat origin/main...HEAD` excluding the folder is
empty). Module header `module` / `public import Mathlib` / `@[expose] public section`; no
`lemma`, no `set_option`, no `TauCeti.*` import, no sorry'd data. Pins: Mathlib f6090c70, Tau Ceti
358314d4.

**Signatures.** A scratch probe importing the built module elaborated `#check @name` for all nine
declarations; the types equal the worker's signature file and the README 4.3 statements: `SO n`
is `Matrix.specialOrthogonalGroup (Fin n) ℝ`; the seven low-rank groups are `0`, `ℤ/2`, `0`,
`(ℤ/2)²`, `ℤ/2`, `ℤ/2`, `ℤ/2` as `Subsingleton` or `Nonempty (… ≃* Multiplicative (ZMod 2 …))`;
`isOfFinOrder_pi_SO : ∀ k, Odd (k + 3) → ∀ x : π_ (k + 2) (SO (k + 3)) 1, IsOfFinOrder x` is "for
every odd `n ≥ 3`, `π_(n−1)(SO(n))` is torsion" with `n = k + 3`. The file has no section
variables, so no binder can drop. Generality of README and Lean agree; nothing changed.

**Padding probe.** The same probe stated each of the eight theorems as an `example` closed by
`first | infer_instance | simp | rfl`; all eight fail (every one falls through to `rfl`), so none
is padding. Headline list: Lemma 6.35 (stated, 4.3); Theorem B (3.3), Theorems G and H (4.6, 4.1),
Theorem I and Propositions 6.29–6.39 (4.2–4.5), the degree of 1.4: named in the module docstring
as not statable, and the pins confirm it: no mapping degree in Mathlib (the grep for `Brouwer` and
"mapping degree" hits only `Mathlib/Order/*`), Tau Ceti's only degree is the complex local degree
of `TauCeti/Analysis/Complex/Conformal/LocalDegree.lean`, Tau Ceti's `SpecialOrthogonal` files are
the algebraic group scheme, and no DG Morse, `Diff(M)` or sphere mapping-space carrier exists.

**Library declarations at the pins** (elaborated in the probe or opened at the file): `HomotopyGroup.Pi`
with `π_ n X x : Type` and `Group (π_ 2 (SO 3) 1)` elaborating; `Matrix.specialOrthogonalGroup :
(n) [DecidableEq n] [Fintype n] (R) [CommRing R] → Submonoid (Matrix n n R)`
(`Mathlib/LinearAlgebra/UnitaryGroup.lean:313`), with `TopologicalSpace (SO 3)` elaborating;
`IsOfFinOrder : {G} [Monoid G] → G → Prop`; `SmoothPartitionOfUnity` and
`exists_contMDiffMap_zero_one_of_isClosed` on `[FiniteDimensional ℝ E] [IsManifold I ⊤ M]
[T2Space M] [SigmaCompactSpace M]`, as the contract at lines 140–142 says;
`ContinuousMap.compactOpen`; `LieGroup` (`Mathlib/Geometry/Manifold/Algebra/LieGroup.lean:72`);
`Circle` (`Mathlib/Analysis/Complex/Circle.lean:53`). Tau Ceti: `TauCeti.IsAspherical (X)
[TopologicalSpace X] (x : X) : Prop` at `TauCeti/AlgebraicTopology/EilenbergMacLane/Basic.lean:59`;
`HomotopyGroup.pathLoopSpaceMulEquiv` at `TauCeti/Topology/Homotopy/HomotopyGroup/LoopSpace.lean:361`;
`LocalCoefficientSystem (R) [Ring R] (X : TopCat)` at `TauCeti/AlgebraicTopology/LocalCoefficient.lean:43`.

**Cross-roadmap citations resolved** (on main at eaf17b1 or at the named head):

- DGFloer on main: Layer 11 with the finite cover and torus criterion inside item 3; the Scope
  and Layer 11 passages quoted in R01; the degree contract at lines 130–135. At the revision head
  fc27fe2b: 1.1–1.6 (545–946), 2.1–2.3 (994–1080), 3.4 (1215), 4.5 (1349), 5.1–5.6 (1439–1561),
  6.3–6.5 (1654–1699), 10.2–10.5 (2955–3015), 11.1–11.3 (3057–3091); line 1409 names
  "DGFloerPartII Layer 2 item 4" and line 2973 says the fibered families "are DGFloerPartII's".
- TangentialBordism at d91d208d: B5.1–B5.7 (lines 1001–1420), B6.3 "Homology realization and its
  sharp range" (2317). It consumes DGFloer Layer 1 items 2–4 (lines 156, 870, 989), not this
  roadmap: no cycle.
- HomotopySpheres at 52ebd6f8: 3A.1 (663), 3A.2 (678), 3B.3 "The James map" (859), 4A.1 (1204),
  4B.2–4B.5 (1351–1379), 4B.8 "All stable orthogonal groups" (1435), 5.0 (1529), 5.1.3 (1671).
  It consumes DGFloer Layer 1 items 2 and 4 (lines 147, 414, 1005), not this roadmap.
- GeneralizedCohomology main: G2 item 10 (533, see the withdrawn finding), G4 (936) with item 0
  holding G4.0a/G4.0b (938–1082, the HP convention at 1186–1189), items 3–5 (1224–1246), G5
  (1373). ComplexKahlerGeometry main: K7 (1405), K7.1 (1407), K7.2 (1445). LieGroups main
  (`TauCetiRoadmap/RepresentationTheory/LieGroups/README.md`): Layer 2 "the closed-subgroup (Cartan)
  theorem" (275). SmoothBundlesConnections main: B1.4 (421, anchor matches), B2.2 (605), B2.5
  (802), B6.2 (1668), B6.3 (1716). RiemannianGeometry main: R1 (179) with the Hopf quotient
  metrics at 279–296 ("primitive unit-speed geodesic period π … `CP¹` and `HP¹` have constant
  curvature 4 and are round spheres of radius ½"), R2 (300), R3 (347) with R3.3 (526). MorseTheory
  main: M5 (857). GeometricTopology main: Layer 1 tubular neighbourhoods and collars (206–221),
  Layer 3 `Diff(M)` with the `C^∞` topology (357–388, `O(n+1) → Diff(Sⁿ)` at 388).
  AlgebraicTopology main: Stage 2 (326), Stage 4 item 4 with `reducedSuspensionSphereHomeomorph`
  and `compactReducedSuspensionCarrierComparison` (544–580), Stage 6 (946) with item 5 (1560),
  Stage 8 (1602). DifferentialGeometry main: Layer 10 (877; see R03).
- Merge order: DGFloerPartII is line 67, directly after HomotopySpheres (66), after
  SmoothBundlesConnections (8) and TangentialBordism (10); every other supplier is on main. The
  worker's citation check finds no cross-roadmap citation and no Lean name unresolved; every
  backticked name of the roadmap's own (the eight theorems and `SO`) is declared in `Suggested.lean`.

**Overlaps.** The three items of the overlap report are R03 (DifferentialGeometry Layer 10) and
R06 (the K7 anchor at #1398 and #1807); no open pull request changes this roadmap; no id this
pull request drops is cited elsewhere (it adds a new folder).

**Seeded source sample** (every target named in the brief), against `bdho-cotangent`, `hatcher-at`
and CSS:

| Target | Locator | Checked |
| --- | --- | --- |
| 1.2 Sphere model and James ring | Prop 6.18, line 4685, printed p. 107 (polynomial ring, "not graded commutative"); proof 4688–4719 (`d_n([p] ⊗ a) = [q] ⊗ a·x`, `x^k` generates `H_(k(n−1))`); `hatcher-at` §4.J line 20245 (James reduced product), Example 3C.7 line 12554 (Pontryagin product of `J(Sⁿ)`) | statement and locators as the README says |
| 1.3 Homogeneous examples | Prop 6.38 proof 5221–5227 (homogeneous metric, complex line a totally geodesic round `S²`, frame `(v, Iv)`), Prop 6.39 proof 5252–5256 (`HPⁿ`, quaternionic line isometric to a round `S⁴`); `hatcher-at` Example 4.53 line 16593 (Stiefel manifolds, §4.2); RiemannianGeometry R1 main 279–296 | carriers and metrics as stated; the quotient block convention is R05 |
| 1.4 Degrees of explicit maps | second proof of Prop 6.34, lines 5122–5139, printed p. 117 (`f(u, θ)` the rotation in the oriented plane `⟨p, u⟩`, two regular preimages `(u, θ)`, `(−u, 2π − θ)`, degree `1 + (−1)^(n−1)`, involution degree `1` odd / `−1` even); Prop 6.17 proof 4736–4773 (`τ[(u, v), θ] = (u, u cos θ + v sin θ)`, degree `±2` for even `n`) | as stated; the source's closing "Proposition 6.29" at line 5139 is a misprint for 6.33 (Source issues) |
| 2.1 Critical manifolds | Prop 6.39 proof 5277–5287 (critical manifolds `C_k ≅ T¹_pHPⁿ`, dimension `4n − 1`, index `2(k−1)(2n+1) + 3`, Ziller Thm 3), Prop 6.38 proof 5239 (`T¹_pCPⁿ`, dimension `2n − 1`, index `1`) | formulas agree with the README and with the conjugate-point count in the table |
| 2.3 `ΩHPᵈ` | Prop 6.39 proof 5288–5310 (perfectness by Ziller Thm 8, `H_(4n+2)(Ω_pHPⁿ) ≅ ℤ` from `H_(4n−1)(T¹_pHPⁿ)`, class twice a generator) | as stated |
| 2.4 Fibre representatives | path-loop fibration and DG Morse spectral sequence, Prop 6.18 proof 4712–4719; BDHO Chapter 5 (cited, not in the cache) | the total-space route is the source's; the roadmap's own Checks are in the table |
| 2.5 Primary differentials | Prop 6.18 proof 4714–4717 (`d_n : E_(n, k(n−1)) → E_(0, (k+1)(n−1))` an isomorphism) for the sphere case | the projective differentials are the README's own targets, checked in the table |
| 3.1 Rational realization | proof of Thm 5.14, lines 4273–4277 (Thom: `N·α = φ_*[S]`, `d = Nb`) | as stated |
| 3.4 Corollaries D, E | Cor D lines 265–292, printed p. 7–8 (`ω_σ = ω_Q + π^*dσ`, `Ψ(p, q) = (p + σ(q), q)` a symplectomorphism to the standard bundle, "does not alter the projection"), Cor E 304–307 | transport unchanged; the sign Check recomputed in the table |
| 4.1 Abundance, Theorem H | Def 1.7 lines 415–423, Def 6.11 lines 4517–4523 (printed p. 104), Thm 6.12 lines 4525–4546 (`α′ = α − σ_* ev_* α` when `deg α = n`), Prop 6.13 lines 4608–4616 | definition and route identical |
| 4.2 Fibered families | Def 6.14 lines 4621–4632, Prop 6.15 4633–4643, Ex 6.16 4645–4680, Prop 6.17 4681, Rem 6.19 4792–4796, Ex 6.20 4797–4835 (`Σ_p = Sⁿ ∩ ⟨u(p), v(p)⟩^⊥`), Prop 6.21 4836–4845, Prop 6.23 4849–4856 (`n` even and `B` `2n`-connected; `n ≡ 3 (mod 4)`, `B` `(n+1)`-connected, two vertical fields), Rem 6.24 4857, proof 4907–4917 (Serre comparison through degree `n − 2`) | hypotheses identical |
| 4.3 Covering by diffeomorphisms | Def 6.26 line 4919, Prop 6.29 4935–4937 ("covered … not a `K(π,1)`"), Ex 6.30 5015–5019, Prop 6.31 5037, Def 6.32 5051, Prop 6.33 5059–5062, Prop 6.34 5063, Lemma 6.35 5073–5094 (printed p. 116: `ℤ₄` at 5076, splitting "for `n ≥ 16`" at 5078, summary "for `n ≥ 17` odd" at 5093); CSS line 222 (stabilization `π₈SO₉ → π₈SO = ℤ/2` split with kernel `ℤ/2`), line 249 (`π₈SO₈ = (ℤ/2)³`) | as stated; the missing "not a `K(π,1)`" in the two summary lists is R02 |
| 4.4 Homogeneous spaces | Prop 6.36 lines 5142–5200 (`H` closed of positive dimension, `j_![G] = [H]`), Ex 6.37 5201–5210 (`SO(2)` action class, Pontryagin square) | as stated |
| 4.5 Projective spaces, Theorem I | Thm I lines 430–445 (printed p. 11), Props 6.38–6.39 lines 5218–5311 | the `CaP²` omission is declared; R02 for item (ii) |
| 4.6 Theorem G | hypotheses lines 5354–5364 (printed p. 123), Thm 7.1 5366–5372, Ex 7.4 5382–5396, Prop 7.5 5404, kernel bound 5415–5418, Lemma 7.6 5467–5475 (collapse `Q → (Y × Dᵏ)/(Y × ∂Dᵏ)`), Lemma 7.7 5503–5505 (`d ≥ 2`, `Y` `(d+1)`-connected) | hypotheses identical, including `ℓ = 2k − 2` / `k − 1` and the closed orientable `(n−k)`-manifold `S` |

**Adversarial table** (values computed in this review; the headline statements, every sampled
target and every target a finding touches are included).

| Statement | Instances tried | Values | Result | Change |
| --- | --- | --- | --- | --- |
| Theorem I list, "covered by diffeomorphisms" | `T^r`; `S³` | `T^r`: left translation gives `ev_*[T^r] = [T^r]` (covered), `π_k = 0` for `k ≥ 2`, `Ω²T^r` contractible, no class of degree `> r` or with nonzero reduced shriek: not abundant; `S³`: `π₃ = ℤ`, not aspherical, abundant | the list admits a non-example | R02 |
| 4.3 Check "`U(n)` not tori" | `n = 1`; `n = 2` | `U(1) = S¹ = T¹`, aspherical; `π₃(U(2)) = π₃(S³ × S¹) = ℤ` | false at `n = 1` | R04 |
| 1.3 quotient convention | `d = 1`, `P` exchanging `e₀, e₁` | `P(U(1) × U(d))P⁻¹ = U(d) × U(1)`; `[g e₀]` on one side is `[gP⁻¹ e_d]` on the other | differs from RG R1 / G4.0b by a conjugation | R05 |
| 1.4 `R(p, u; θ)` matrix | `p = e₀`, `u = e₁`, `θ = π/2` | `R e₀ = e₁`, `R e₁ = −e₀`, `R e_j = e_j` (`j ≥ 2`); `det = 1`; `θ = 0` gives `I`; period `2π` | agrees with lines 118–122 | none |
| 1.4 degree of `ev_p ∘ f` | `n = 1`, `p = e₀` | `f(e₁, θ)e₀ = cos θ e₀ + sin θ e₁` (degree `+1`), `f(−e₁, θ)e₀ = cos θ e₀ − sin θ e₁` (degree `−1`); `S⁰ = ∂[−1, 1]`: `+1` at `e₁`, `−1` at `−e₁`; total `1·1 + (−1)(−1) = 2 = 1 + (−1)⁰` | agrees | none |
| 1.4 involution degree | general `n` | antipode of `S^(n−1)`: `(−1)^n`; `θ ↦ −θ`: `−1`; product `(−1)^(n+1) = (−1)^(n−1)`; source: `1` odd, `−1` even | agrees | none |
| 1.4 preimages | `q ∉ {±p}`, `q = c p + w`, `w ⊥ p` | `(u, θ) = (w/|w|, arccos c)` and `(−u, 2π − θ)`: `cos(2π−θ) p + sin(2π−θ)(−u) = c p + w` | exactly two | none |
| 1.4 `H₂(SO(3)) = 0`, `H₃(SO(4)) = ℤ²` | `ℝP³`, `S³ × ℝP³` | `H_*(ℝP³) = ℤ, ℤ/2, 0, ℤ`; Künneth degree 3: `ℤ ⊗ ℤ ⊕ ℤ ⊗ ℤ ⊕ Tor = ℤ²` | agrees | none |
| 1.4 Stiefel-domain map `τ` | `n` even, fibre over `u` | `τ_u(v, θ) = u cos θ + v sin θ` on `S^(n−2) × S¹ → S^(n−1)`, two preimages, involution degree `(−1)^(n−1)·(−1) = +1` for even `n`: fibre degree `±2` | agrees with source 4763–4773 | none |
| 1.3 dimensions | `n = 3, 2`; `d = 1` | `dim V_(3,2) = 3 = dim SO(3)`; `V_(2,2) = O(2)` two components, `SO(2)/SO(0)` one; `dim U(n)/U(n−2) = n² − (n−2)² = 4n − 4` | agrees | none |
| 1.3 curvature and periods | `CP¹` radius `1/2`; radius `1` | great circle `2π·(1/2) = π`, curvature `1/r² = 4`, area `4πr² = π`, `ω_g = π ω_FS` with `∫ ω_FS = 1`; radius `1`: period `2π`, area `4π`, energy `∫|γ̇|²` scales by `r²`, ratio `4`; `CPᵈ`: `K(X, Y) = 1 + 3⟨JX, Y⟩² ∈ [1, 4]` | agrees | none |
| 1.3 quaternionic fields | `S³ ⊂ ℍ` | `⟨z, Iz⟩ = 0` (`I` skew); `⟨Iz, Jz⟩ = ⟨z, −IJz⟩ = ⟨z, −Kz⟩ = 0`; Radon–Hurwitz: `S^(4k+1)` has exactly one field | agrees | none |
| 1.2 ring `H_*(ΩSⁿ)` | `n = 2, 3` | `ΩS² ≃ S¹ × ΩS³`: `ℤ` in every degree, `x² ≠ 0`, `|x| = 1`; graded commutativity would give `x² = −x²`, `2x² = 0`, `x² = 0` in a torsion-free group; `n = 3`: `ℤ` in even degrees | agrees | none |
| 2.1 indices by conjugate points | `CPᵈ`, `HPᵈ`, `k`-fold circle | curvature-`4` directions (`1`, resp. `3`) vanish at `mπ/2`, `0 < m < 2k`: `2k − 1` points; curvature-`1` directions (`2d − 2`, resp. `4d − 4`) at `mπ`, `0 < m < k`: `k − 1` points; `(2k−1) + (k−1)(2d−2) = 2d(k−1) + 1`; `3(2k−1) + (k−1)(4d−4) = 4dk + 2k − 4d + 1 = 2(k−1)(2d+1) + 3` | agrees | none |
| 2.1 nullity | `C_k` | `dim T¹_pCPᵈ = 2d − 1`, `dim T¹_pHPᵈ = 4d − 1` | agrees | none |
| 2.2 cell degrees vs `S¹ × ΩS^(2d+1)` | `d = 1, 2` | `b_k = a_k + 2d − 1 = 2dk`; degrees `0, 1, 2d, 2d+1, 4d, 4d+1, …` = `ℤ` in `2dk`, `2dk + 1`; `a_(k+1) − b_k = 1` | agrees; no lacunarity | none |
| 2.2 Hopf product `π_*` | `ΩS⁵` vs `ΩS³`, `CP²` | `π₁(ΩCP²) = π₂(CP²) = ℤ = π₁(S¹)`; `π₂(ΩS⁵) = π₃(S⁵) = 0 = π₃(CP²)`; `π₂(ΩS³) = π₃(S³) = ℤ` | wrong model excluded | none |
| 2.3 cell degrees vs `S³ × ΩS^(4d+3)` | `d = 1, 2` | `b_k = 2(k−1)(2d+1) + 3 + 4d − 1 = 2k(2d+1)`; `d = 2`: `3, 10, 13, 20`, gap `3`; `d = 1`: `6k − 3`, `6k`: `ℤ` in degrees `3k` | agrees | none |
| 2.4 `CP¹` total-space sequence | `E² = H_*(S²) ⊗ H_*(ΩS²)` | columns `0, 2`, each `ℤ` in every row; contractible total space forces `d²: E_(2,q) → E_(0,q+1)` iso for all `q` | agrees | none |
| 2.5 total degrees and `CP²` | `d = 2` | `E_(2d,1)`: `2d + 1 → 2d`; `E_(4d,3)`: `4d + 3 → 4d + 2`; `CP²`: `H_*(ΩCP²) = ℤ` in `0, 1, 4, 5, 8, 9`; `E_(2,3) = 0`, so `g ∈ E_(0,4)` dies only by `d₄` from `E_(4,1) = ℤ`; `E_(0,5)` by `d₂` from `E_(2,4) = ℤ`; `E_(2,1)` by `d₂` from `E_(4,0)` | agrees | none |
| 2.6 dimensions and the class | `CPᵈ`, `HPᵈ` | `dim T¹_pCPᵈ = 2d − 1`, `β_*` lands in degree `2d = b₁`; `dim Σ = 8d + 1` (source 5262) so `dim Σ_p = 4d + 1`, `β_*` lands in `4d + 2 = b₁`; fibrewise degree `±2` (source 5307) | agrees | none |
| 3.1 torsion class | `α` of order `N` | `Nα = 0 = f_*[∅]`: statement holds with `S = ∅`; Theorem B's `π_(U*)α = b[Q]`, `b ≠ 0`, has infinite order, so `S ≠ ∅` there | agrees | none |
| 3.1 clearing denominators | general | `Σ (a_i/b_i)[f_i] ↦ α ⊗ 1`; `D = lcm(b_i)`; `Σ c_i f_(i*)[S_i] − Dα` torsion of order `m`; `N = mD`, negative `c_i` by reversing orientation | route sound | none |
| 3.2 embedding | `U = ℝⁿ`, `φ = id`, `ρ = 1`; overlap of two charts | `e(x) = (1, x)`; where `ρ_i > 0` the ratio `(ρ_i φ_i)/ρ_i = φ_i` is a smooth left inverse, so `de` is injective | agrees | none |
| 3.3 hypotheses | `T^r`, `ℝP³`, `S²` | `π_ℓ(T^r) = 0` for `ℓ ≥ 2` (excluded; `c°_HZ = ∞`); `π₃(ℝP³) = ℤ`; `π₂(S²) = ℤ`; source 4267–4269 has the same alternatives | agrees | none |
| 3.4 magnetic sign | `T*ℝ²`, `σ = q₁ dq₂`, `ω_can = −dλ_can` | `Ψ'_σ(q, p) = (q₁, q₂, p₁, p₂ − q₁)`; `Ψ'^*_σ λ_can = p₁ dq₁ + (p₂ − q₁) dq₂ = λ_can − π^*σ`; `−d` of it `= dq₁ ∧ dp₁ + dq₂ ∧ dp₂ + dq₁ ∧ dq₂ = ω_can + π^*dσ`; `Ψ'^*_(−σ) ω_can = ω_can − π^*dσ`; `Ψ'^*_(−σ)(ω_can − π^*dσ) = ω_can − 2π^*dσ`; `+dλ_can` would give `ω_can − π^*dσ`; `Q = S¹`: `dσ = 0` | agrees with lines 732–742 and DGFloer 6.3 | none |
| 4.1 products | `deg α = dim M` | `deg(α × [N]) = dim M + dim N`, shriek `j_!α × 1 ≠ 0`; constant spheres `σ_*[Q]` have reduced shriek `0` | agrees | none |
| 4.2 degrees | `Sⁿ` even, `S^(4k−1)`, `S²` | `n + (2n − 3) = 3n − 3`; `n + (n − 2) = 2n − 2`; `Σ_p = O(2)`, `α ∈ H₃` | agrees | none |
| 4.2 `Σ_p` for odd spheres | `n = 3` | `u(p)^⊥ ∩ v(p)^⊥` has dimension `n − 1 = 2`, unit sphere `S¹ = S^(n−2)`; `H₁(Ω²S³) = π₁(Ω²S³)^ab = π₃(S³) = ℤ` | agrees | none |
| 4.2 Serre comparison | `B` `2n`-connected | `π_i(Ω²B) = π_(i+2)(B) = 0` for `i ≤ 2n − 2`; differentials into `E_(0,q)`, `q ≤ 2n − 3`, start at `E_(r, q−r+1)`, `2 ≤ r ≤ 2n − 2`, all zero; `(2n−1)`-connected allows `r = 2n − 1` at `q = 2n − 3` | agrees | none |
| 4.3 `π₂(SO(3))` | double cover `S³ → SO(3)` | `π₂(S³) = 0` | agrees | none |
| 4.3 `π₈(SO(9)) = (ℤ/2)²` | `SO(8) → SO(9) → S⁸` | `∂: π₈(S⁸) → π₇(SO(8)) = ℤ²` injective (tangent bundle of `S⁸`, Euler number `2`), so `(ℤ/2)³ = π₈(SO(8)) ↠ π₈(SO(9))`: exponent `2`; CSS: split onto `ℤ/2` with kernel `ℤ/2`, order `4` | `(ℤ/2)²`, refutes the source's `ℤ₄` | source issue |
| 4.3 Stiefel term | odd `n` | `V_(n+2,2) → S^(n+1)` with fibre `Sⁿ`; connecting map `χ(S^(n+1)) = 2`: `π_n(V_(n+2,2)) = ℤ/2`; `V_(n+2,2)` is `(n−1)`-connected so `π_(n−1)(V) = 0` and `π_(n−1)(SO(n+2)) = π_(n−1)(O)` is stable (`n − 1 < n + 1`) | the extension `ℤ/2 → π_(n−1)(SO(n)) → π_(n−1)(O)` is right; the splitting is the target | none |
| 4.3 splitting below range | `n = 7, 3` | formula: `π₆(O) ⊕ π₇(V_(9,2)) = 0 ⊕ ℤ/2`, `π₂(O) ⊕ π₃(V_(5,2)) = 0 ⊕ ℤ/2`; actual `π₆(SO(7)) = 0`, `π₂(SO(3)) = 0` (`S⁷`, `S³` parallelizable) | negative controls right | none |
| 4.3 stable term | odd `n ≥ 17` | `π_(n−1)(O) = ℤ/2` iff `n − 1 ≡ 0, 1 (mod 8)`, `n − 1` even, so `n ≡ 1 (mod 8)`: `17, 25, …` give `(ℤ/2)²`, other odd `n ≥ 19` give `ℤ/2`; `n = 9, 11, 13, 15`: `(ℤ/2)², ℤ/2, ℤ/2, ℤ/2`, matching the listed values | agrees | none |
| 4.3 Lean torsion statement | `k = 0, 1, 6` | `k = 0`: `Odd 3`, `π₂(SO(3)) = 0`; `k = 1`: `Odd 4` false, excludes `π₃(SO(4)) = ℤ²`; `k = 6`: `Odd 9`, `π₈(SO(9)) = (ℤ/2)²`, every element of order `≤ 2` | hypothesis necessary and sufficient | none |
| 4.3 first proof | odd `n` | `π_n(SO(n+1)) → π_n(Sⁿ) = ℤ → π_(n−1)(SO(n))` torsion: kernel of `∂` nonzero, some `α` with `ev_*α = ℓ[Id]`, `ℓ > 0`; `π_n(Sⁿ) = ℤ` not `ℓ`-torsion so 6.33 applies | agrees with source 5095–5121 | none |
| 4.3 second proof | `n = 3` | `A ∈ H₃(SO(4)) ≅ ℤ²`, `(ev_p)_*A = 2[S³]`; the section `S³ → SO(4)` (left quaternion multiplication) gives `ℓ = 1`; `π₃(S³) = ℤ` not `2`-torsion | both proofs conclude; the source's "6.29" at 5139 should be 6.33 | source issue |
| 4.4 `S² = SO(3)/SO(2)` | `α ∈ H₀(Ω²S²)` | `j_!: H₃(SO(3)) → H₁(SO(2))`, `[SO(3)] ↦ [SO(2)]`; `α′ ∈ H₁`, degree `1 = dim H + deg α`; `β_*α′ = x² ≠ 0` by 1.2 | agrees | none |
| 4.4 nonorientable | `SO(3)/O(2) = ℝP²` | `h = diag(A, det A)`, `A` a reflection, acts on `T_[e₃]ℝP² ≅ Hom(ℓ, ℓ^⊥)` by `(det A)·A`, of determinant `(det A)³ = −1`: `χ = −1`; coorientation sign `−1`; product `+1` | consistent with the twisted shriek claim | none |
| 4.4 `dim H = 0` | `H` finite | `(Φ_H)_*([H] × α)` has degree `deg α`, shriek of degree `0`, reduced condition can fail | hypothesis necessary | none |
| 4.5 `d = 0` | `CP⁰`, `HP⁰` | points: `Map(S², pt) = pt`, no class of degree `> 0`, degree-`0` class has reduced shriek `0` | excluded, as stated | none |
| 4.6 dimension bounds | `k` even, odd; `Y` a point | `Y` `ℓ`-connected closed orientable of dimension `n − k > 0` has `H_(n−k)(Y) = ℤ`, so `n − k ≥ ℓ + 1`: `n ≥ 3k − 1` (even), `n ≥ 2k` (odd); `k = n` (`Y` a point) violates both | agrees; source gap recorded | none |
| 4.6 Example 7.4 | `Q′ = Tⁿ`, `k ≥ 3` | `π₂(Tⁿ # (S^k × Y)) = 0` for `k ≥ 3`, `Y` `(2k−2)`-connected; `Q` rationally essential (the `Tⁿ` summand) | agrees with 5389–5396 | none |
| 1.1 `k`-products | Dowker's CW pair | product topology ≠ CW (= `k`) topology | witness right | none |
| 1.5 collapses | `N = ∅`; a framed point | constant map, degree `0`; degree `±1` with sign from the framing | agrees | none |
| Suggested.lean carriers | `SO 0`, `SO 3` | `Matrix.specialOrthogonalGroup (Fin 0) ℝ` a point (unused); `TopologicalSpace (SO 3)` and `Group (π_ 2 (SO 3) 1)` elaborate | no junk value reaches a statement | none |

**Vacuity, context and generality.** Every target quantifies over the roadmap's objects
(`Map(S², Q)`, `Diff(M)`, `Ω_pB`, `SO(n)`); no statement is over free data. The Lean file has
no section variables. The README's "for every odd `n ≥ 3`" equals the Lean `Odd (k + 3)`. The 2.2
route avoids a false lacunarity claim by the rank count. The 4.4 extension of Proposition 6.36 to
nonorientable `G/H` is scoped with `ev^*or_M` and `dim H > 0`.

**Ownership against open pull requests.** Checked with the cross-PR grep (464 open pull requests
at the index of 2026-11-07) for the objects, not the names (see R01): only DGFloer on main and the
superseded revision #963 state them; #1798 names DGFloerPartII as their owner. No other open pull
request builds them. Ownership of the quotient comparisons of 1.3 against RiemannianGeometry R1
and GeneralizedCohomology G4.0b: those build the quotients and metrics, this roadmap the
identifications, as the Scope says (R05 is a convention, not a second owner).

## Not verifiable

- W. Ziller, *The free loop space of globally symmetric spaces*, Invent. Math. 41 (1977), Theorems
  3 and 8 (2.1 and the Layer 2 Dependencies): the sources service resolves DOI 10.1007/BF01390161
  only to a paywalled Springer page (`uncertified`, recorded in a scratch manifest only); GDZ was
  not searched. The index formulas were recomputed from conjugate points (table, row 2.1) and
  agree with the source paper's `k = 1` values and its `2(k−1)(2n+1) + 3` at line 5285.
- R. Bott, *The stable homotopy of the classical groups*, Ann. of Math. 70 (1959): not in the
  cache (JSTOR); background for Layer 2 only.
- Milnor–Stasheff, *Characteristic Classes*, Chapter 5, and Steenrod, *The Topology of Fibre
  Bundles*, Part I §7: not in the cache; the chapter titles match the use (Stiefel manifolds).
- The "[Jap87, Appendix A, Tables 6.VII, 6.VIII]" the source cites for Lemma 6.35: not in the
  cache; the values were checked by exact sequences and CSS (table).
- BDHO, *Morse homology with differential graded coefficients*, Chapters 5–13 (Layer 2
  Dependencies): the base package's cached text was not re-read for this review; the DG Morse
  inputs are consumed from DGFloer Layer 5 and are not restated here.

## Source issues

- **Error** in bdho-cotangent at proof of Lemma 6.35, printed page 116: the source says
  `π₈(SO(9)) = ℤ₄`; it should be `ℤ/2 ⊕ ℤ/2` (a quotient of `π₈(SO(8)) = (ℤ/2)³` of order 4 by
  Crowley–Schick–Steimle's split stabilization); affects nothing (the lemma needs only torsion).
- **Misprint** in bdho-cotangent at second proof of Proposition 6.34, printed page 117: the source
  says the proof concludes by Proposition 6.29 after showing `Sⁿ` is `2`-covered; it should be
  Proposition 6.33, the `ℓ`-covered form, with `π_n(Sⁿ) = ℤ` not `2`-torsion; affects nothing.
- **Gap** in bdho-cotangent at §7 preamble, printed page 123: the source says `ℓ`-connectivity of
  `Y` forces `n − k ≥ 2k − 1` (even `k`) or `n − k ≥ k` (odd `k`); it should add `dim Y > 0`,
  since a point is `ℓ`-connected for every `ℓ` and the bound fails for `k = n`; affects nothing.
