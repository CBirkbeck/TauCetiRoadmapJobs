<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13837#issuecomment-6798198182 -->
Review (claude) of fac7e28

Verdict: needs_changes

1. **F01** (P3) the third Check of §5.3 is false

   Location: `packages/SurfaceGroupCharacterVarieties/design/README.md` §5.3, Checks, third bullet ("The
   embedding of `SL₂(ℝ)` conjugated by `[[1,1],[0,1]]` is not transpose-stable: it carries `SO(2)` to a
   subgroup not contained in `O(2)`, and the norm is not `K`-invariant"); `design/plan.json` target 5.3,
   test `non_stable_embedding`.

   Claim: the embedding `g ↦ u g u⁻¹` of `SL₂`, `u = [[1,1],[0,1]]`, is not a Cartan-compatible
   realization.

   Witness: `u ∈ SL₂(ℝ)`, so the image is `u SL₂(ℝ) u⁻¹ = SL₂(ℝ)`, which is transpose-stable. The
   Conventions define `K = G^ℝ ∩ O(N)`, here `SO(2)` again, and the trace norm is invariant under it.
   The element `u [[0,−1],[1,0]] u⁻¹ = [[1,−2],[1,−1]]` has transpose `[[1,1],[−2,−1]]`, of determinant
   `1`, still in the group.

   Repair: replace the bullet (and the `plan.json` test) by a proper subgroup: "The torus `SO₂` embedded
   as `u SO₂ u⁻¹`, `u = [[1,1],[0,1]]`, is not transpose-stable: `u r_θ u⁻¹ = [[c+s, −2s],[s, c−s]]` with
   `c = cos θ`, `s = sin θ`, and for `θ = π/2` its transpose `[[1,1],[−2,−1]]` is not of this form. Here
   `K = G^ℝ ∩ O(2) = {±1}` and `𝔭 = 0`, so `K exp(𝔭) ≠ G^ℝ`, and the norm of `ℝ²` is not preserved:
   `‖u r_{π/2} u⁻¹ e₁‖² = 2`."

   Tested on the instance: `[[c+s, −2s],[s, c−s]]` is orthogonal only when `2cs + s² = 0` and
   `4s² − 2cs = 0`, that is `s = 0`; `u⁻¹ [[1,1],[−2,−1]] u = [[3,5],[−2,−3]]` is not a rotation; the Lie
   algebra `ℝ·[[1,−2],[1,−1]]` contains no nonzero symmetric matrix.

2. **F02** (P3) §5.4 (v) plans `G = K T K`, which RepresentationTheory/LieGroups Layer 9 states

   Location: README §5.4, statement (v) ("for a maximal abelian `𝔱 ⊆ 𝔭` and `T = exp(𝔱)`, `G = K T K`")
   and proof sketch ("the `K T K` decomposition (proved from the conjugacy of maximal abelian subalgebras
   of `𝔭` under `K`)"); `plan.json` target 5.4.

   Claim: the decomposition is a target of this roadmap, proved here.

   Witness: `TauCetiRoadmap/RepresentationTheory/LieGroups/README.md`, Layer 9, **Restricted roots and
   KAK**: "First prove Ad(K)a=p … this yields G=K exp(a_bar_plus) K (`kakDecomposition`)", for closed
   transpose-stable matrix groups with finitely many components. The *Needs:* line of §5.4 already names
   Layer 9.

   Repair: in (v) write "by RepresentationTheory/LieGroups Layer 9, **Restricted roots and KAK**
   (`kakDecomposition`, with `Ad(K)𝔱 = 𝔭`), `G = K T K` for `T = exp(𝔱)`; prove that any two disjoint
   closed `T`-invariant subsets …"; delete the parenthesis in the sketch; add "`G = K exp(𝔭)` closed in
   `GL(V)` is transpose-stable (`(k exp X)ᵀ = exp(X) k⁻¹`) with finitely many components (`K` compact),
   so it is a model of Layer 9" to the sketch; name the paragraph in the LieGroups contract. Mirror in
   `plan.json`.

   Tested: `ℝ_{>0}` on `ℝ` (the design's Check): `K = 1`, `T = G`, `G = K T K`. `SL₂(ℝ)`: `𝔱 = ℝ·diag(1,−1)`,
   closed chamber `t ≥ 0`, `exp(chamber) ⊆ T`, so `K exp(chamber) K = G` gives `K T K = G`.

3. **F03** (P3) TeichmullerGeometry §0.0e is cited without its smoothness hypothesis, and §0.0b is used but not cited

   Location: README contract, TeichmullerGeometry entry ("§0.0e (a surface without boundary charted on the
   half-plane model `𝓡∂ 2` is read as one charted on the boundaryless model `𝓡 2`, and conversely)"); §2.1,
   comparison bullet ("a smooth structure `F` on `Σ_g` (one exists by TeichmullerGeometry §0.0e)"); §3.4
   sketch.

   Claim: §0.0e gives the two-model comparison for the topological surface `Σ_g` and a smooth structure
   on it.

   Witness: TeichmullerGeometry §0.0e at its head: "For a smooth surface `S` charted on the boundaryless
   model …"; "Conversely, a smooth `𝓡∂ 2` surface with empty boundary has an `𝓡 2` atlas"; "Every PL
   structure is compatible with some smooth structure on its space". The PL structure of a topological
   compact surface is §0.0b there (Radó), which the design cites nowhere.

   Repair: contract entry: "§0.0b (Radó: every compact surface carries a PL structure), §0.0e (every PL
   structure is compatible with some smooth structure on its space; a smooth surface without boundary
   charted on `𝓡∂ 2` has an `𝓡 2` atlas with the same smooth maps, and conversely)". §2.1: "for a closed
   surface `Σ_g`, which carries a smooth structure `F` (TeichmullerGeometry §§0.0b, 0.0e) whose atlas with
   empty boundary is read on the boundaryless model by §0.0e". Add §0.0b to the *Needs:* of §§2.1, 2.4,
   3.4, to the Dependencies of Layers 2 and 3 and to `plan.json`.

   Tested on `Σ_0 = S²`: the tetrahedral PL structure, smoothed after one subdivision (TeichmullerGeometry
   §0.1's Check), gives a boundaryless atlas; `TauCeti.isotopic_iff_ambientIsotopic` then applies and
   `Mod^±(S²) ≅ MappingClassGroupFull(S²)` has order `2` on both sides.

No blocking finding, and three findings (P3), each with a repair to apply: one false Check in §5.3, one supplier
statement restated in §5.4 (v), and one supplier section cited without its hypothesis. All ten
round-4 findings are repaired, and the thirteen maintainer notes are each settled by those repairs.
The two declared gaps, `gcr-reductive-identity-component` and `borel-tits`, are sound contracts and
raise no finding. No `Suggested.lean` exists at the design stage, and elaboration is not available
(this lane does not elaborate).

Heads read: MordellLawrenceVenkatesh, TeichmullerGeometry, GroupActionsOnRiemannSurfaces,
ArithmeticGaloisRepresentations, ArithmeticLocallySymmetricSpaces, ComplexComparisonPartII and
InverseGaloisAndArithmeticFundamentalGroups at the heads of their open pull requests; GeometricTopology,
FreeGroupsAndLimitGroups, AlgebraicTopology, ClassifyingSpaces, ReductiveGroups, ReductiveGroupsPartII,
RepresentationTheory/LieGroups, RepresentationTheory/CompactGroups and
SymplecticGeometry/HamiltonianReduction on main; `packages/MappingClassGroupsAndCanonicalRepresentations`
in the board checkout.

## Verified sound

**Round-4 findings** (10), each quoted from the repaired text.

- R01, repaired: "Prove that for every `g ≥ 0` the closed surface `Σ_g` … is homeomorphic to
  TeichmullerGeometry §0.0f's model `StandardSurface.model` of `StandardSurface.orientable g 0`"; §3.4:
  "`Surface.IsOrientable Σ_g` and `Surface.genus Σ_g = g ≥ 1` (§2.4) are the hypotheses of
  `dehn_nielsen_baer`"; "`î` … is nonzero, being perfect (§5.5) on `H₁(Σ; ℤ) ≅ ℤ^{2g} ≠ 0`"; "`r` … the
  map induced by `z ↦ e^{2πi/g} z̄`". The route by `H₂`, `H₁` instead of `χ` is sound (table).
- R02, repaired: "For every group `H`, define the action of `Mod^±_{g,n}` on `Rep(π₁(Σ_{g,n}, x), H)` as
  `Ψ_x` (§3.3) followed by §1.3's action"; "Prove that for `H = Sym(d)`, on the classes of transitive
  homomorphisms and on `Mod_{g,n}`, it is MordellLawrenceVenkatesh §5.9's action `[p] ↦ [f ∘ p]`".
- R03, repaired: §2.1, "every homotopy `I × X → X` through homeomorphisms starting at the identity is
  an ambient isotopy … hence open by invariance of domain"; contract, "Used: the isotopies of §5.9 …
  are homotopies through homeomorphisms; by §2.1 these are exactly the ambient isotopies".
- R04, repaired: "§5.22 (for `g ≥ 1` the symplectic representation `Mod(S_g) → Sp(2g, ℤ)` is
  surjective), §5.23 (for a closed surface of genus `g ≥ 1` …)"; Examples, "`Mod_{1,0} ≅ SL₂(ℤ)`
  (TeichmullerGeometry §5.4a, `mcg_torus_full` restricted to the orientation-preserving subgroup".
- R05, repaired: Conventions, "**Notation shared with suppliers.** `Ψ_x` is the outer action of §3.3;
  MordellLawrenceVenkatesh's `Ψ` … is the symplectic representation".
- R06, repaired: the consumer bullet is gone; Scope, "The mapping-class action of
  GroupActionsOnRiemannSurfaces §3.4 … is … the restriction of §3.5's action".
- R07, repaired: "it identifies `Mod^±(Σ_g)` with GeometricTopology Layer 1.7.2's `Mod(F)` … the owner
  of the mapping class groups of compact surfaces". What it left open is R03 above.
- R08, repaired: "This subgroup, transported along TeichmullerGeometry §4.2's `ι : Π ≃* π₁`, is the
  group that TeichmullerGeometry §5.4 writes `Out⁺(Π)`".
- R09, repaired: "by MordellLawrenceVenkatesh §5.19, `Push(α)` acts by `MulAut.conj [α]`, which is
  `f_{const}` for its end map by §3.2".
- R10, repaired: "its action on the closed set `M ∩ Hom` is proper".

**Maintainer notes** (13). None gives a new finding; what refutes each at the current text:

- 1: the "Assumed" clause is replaced by a "Used" clause derived from §2.1's manifold bullet.
- 2: Scope, contract and `plan.json` now attribute to §5.9 only the action on finite coverings.
- 3: the Conventions bullet on shared notation separates both symbols.
- 4: the contract and `plan.json` list the same twelve MordellLawrenceVenkatesh sections, §5.22
  included; the Scope lists what is left to owners, a different list (§§5.10–5.12, 5.18, 5.21 and
  TeichmullerGeometry §0.0d are in no *Needs:* line).
- 5: `Mod_{1,0} ≅ SL₂(ℤ)` is cited to TeichmullerGeometry §5.4a.
- 6: the contract states §5.4 in its connected-sum form with the `(g, b, n)` criterion.
- 7: "§5.23 is the case `g ≥ 1`, `n = 1`".
- 8, 9: genus and orientability come from the new §2.4 target; §4.3 is kept for the attaching word.
- 10: the bullet is deleted.
- 11: §2.1 states the variant clause, the comparison and Layer 1.7.2 as owner.
- 12: §3.4 names `Out⁺(Π)`.
- 13: §3.3 cites §5.19.

**Principles.** No route-specific shortcut (§6.4's restriction to topologically finitely generated `Z`
is the settled repair of round 1, with the general implication a declared gap). No re-planned roadmap
beyond R02. No copied passage: the cited lines of the five readable sources were compared with the
README. No algorithm, no Lean file, no `set_option`, no sorry'd data. None of the never-cite roadmaps
is cited. Greps for pull-request numbers, round labels, machine paths and LaTeX delimiters find
nothing. The layers are named by their mathematics; Layers 1–3 and 4–6 are independent and Layer 7
uses both, as the dependency lines force.

**Supplier order.** Gate output:

```text
candidate: SurfaceGroupCharacterVarieties is not in the merge order yet; checked as if placed after TeichmullerGeometry (the intake inserts it when its design is accepted)
depcheck: 223 roadmaps, 1974 edges, 0 problem(s)
```

No UPWARD or CYCLE line. `roadmaps resolve` on the README: no cross-roadmap citation and no Lean name
found nowhere (the worker's four leads are TeichmullerGeometry's own names, present in its
`Suggested.lean` and §0.0f). Overlaps: no open pull request changes this roadmap; no cited id is
dropped or defined only by a revision.

**Supplier citations resolved this round** (section read, content compared with the contract).

- MordellLawrenceVenkatesh §§5.1, 5.4, 5.5, 5.6, 5.9, 5.15, 5.16, 5.17, 5.19, 5.20, 5.22, 5.23. §5.16 is
  in the contract and in no *Needs:* line (it enters through §5.20); no change needed.
- TeichmullerGeometry Conventions, §§0.0b, 0.0e, 0.0f, 0.0h, 3.1, 4.2, 4.3, 4.4, 4.5, 5.4, 5.4a, 6.1, and
  `dehn_nielsen_baer` in its `Suggested.lean` (hypotheses: empty boundary, `Surface.IsOrientable`,
  `1 ≤ Surface.genus`, value on a homeomorphism fixing `x₀` through `FundamentalGroup.mapOfEq`).
- GeometricTopology Scope and Layer 1.7.2; FreeGroupsAndLimitGroups §§6.1, 6.1a, 6.2; AlgebraicTopology
  §§1.4, 1.5, 4.2, 4.3 through its table "Stage 1 items 1–6 are §§1.1–1.6", "Stage 4 items 1–8 are
  §§4.1–4.8"; ClassifyingSpaces items 11, 15, 17.
- ArithmeticGaloisRepresentations §1.7 **Semisimplicity over a perfect field** (with the `F_p(s)`
  example) and §1.11's two paragraphs (with the `C₂` Check); ArithmeticLocallySymmetricSpaces §§ALS.F.1,
  ALS.0.1; ComplexComparisonPartII §C-1.1; ReductiveGroupsPartII §§RG2.0.1, RG2.0a.2; ReductiveGroups
  Layers 0–9 and 3A.2, 3A.4; LieGroups Layer 7's three paragraphs and Layer 9; CompactGroups Layer 5;
  HamiltonianReduction R5; InverseGaloisAndArithmeticFundamentalGroups §IG.3.2.

**Declared gaps.** `gcr-reductive-identity-component` (ArithmeticGaloisRepresentations §1.11) and
`borel-tits` (ReductiveGroups Layer 7): one sentence each with its hypotheses, the same slug in
`plan.json` and under the supplier's contract. Neither is provided today: §1.11 states the definition,
the `GL(V)` case and the closed-tuple criterion only, and a search of ReductiveGroups for Borel–Tits
finds no statement. No finding: both stand as declared contracts.

**Library declarations opened at the pins.** Mathlib: `FundamentalGroup.mul_def`
(`AlgebraicTopology/FundamentalGroupoid/FundamentalGroup.lean:44`, `p * q` is `q` then `p`),
`fundamentalGroupMulEquivOfPath` (:48, `Iso.conj` of the path class), `FundamentalGroup.map` (:79),
`mapOfEq` (:85), `homotopicMapsNatIso` (`FundamentalGroupoid/InducedMaps.lean:67`),
`QuotientGroup.quotientKerEquivRange` (`GroupTheory/QuotientGroup/Basic.lean:134`),
`Subgroup.fg_of_index_ne_zero` (`GroupTheory/Schreier.lean:166`),
`Representation.IsSemisimpleRepresentation` (`RepresentationTheory/Semisimple.lean:34`),
`t2Space_quotient_mulAction_of_properSMul` (`Topology/Algebra/ProperAction/Basic.lean:113`). Tau Ceti:
`TauCeti.AmbientIsotopy` (`Topology/Homotopy/Isotopy/Basic.lean:163`: a continuous map `I × Y → Y`,
total map a homeomorphism, identity at `0`; no separation axiom), `TauCeti.AmbientIsotopic`
(`Topology/Homotopy/AmbientIsotopic/Basic.lean:58`, `Φ.final ∘ f = g`), `TauCeti.Isotopic`
(`Isotopy/Basic.lean:114`), `TauCeti.isotopic_iff_ambientIsotopic` (`Isotopy/Compact.lean:123`),
`finalHomeomorph_conj` (`Topology/Homotopy/AmbientIsotopyConj.lean:131`),
`Continuous.isOpenEmbedding_of_injective` (`AlgebraicTopology/Singular/InvarianceOfDomain.lean:201`,
hypothesis `finrank ℝ E = finrank ℝ F`), `TauCeti.ConnectedCoveringSpace.monodromyEquivalence`
(`AlgebraicTopology/UniversalCover/Classification/MonodromyEquivalence.lean:158`, base path-connected,
locally path-connected, semilocally simply connected), `TauCeti.FundamentalGroupoidAction.basepointMulAction`
(same file, :93), `TauCeti.isPreconnected_iInter_of_directed` (`Topology/Continuum.lean:69`),
`Hom.fixedMap_surjective_of_isLinearlyReductive` (`Algebra/Coalgebra/Comodule/LinearlyReductive/Fixed.lean:184`),
`TauCeti.PointTopology.instTopologicalSpaceWithConv` (`Topology/Algebra/PointTopology/Basic.lean:110`).

**Sources, seeded sample** (15 targets). No locator is flagged unverified by the author.

- §§1.1, 2.1, 2.4, 2.6: FarbMargalit2012 only (waived); the mathematics is in the table.
- §1.3, §3.5: LandesmanLitt2024 lines 41–50 (outer action, action on conjugacy classes, Definition
  1.1.1, no natural action on the representation variety), lines 473–475 (`PMod`, index `n!`), lines
  503–515 (Lemma 2.0.1).
- §4.1: Sikora2012 line 584; BCGGO2024 lines 2706–2708.
- §5.2: BCGGO2024 lines 466–481 (real forms, Cartan involutions for a real form).
- §5.3: BohmLafuente2021 lines 52–62 (the definition `G = K exp(𝔭)`), line 193 (normal matrices).
- §5.4: BohmLafuente2021 lines 77–88 (Theorem 1.1), 417 (Lemma 5.1), 445 (Corollary 5.5), 518 (Lemma
  6.3), 562 (Corollary 6.4), 568 (Lemma 6.5), 1050 (Corollary A.2), 172–176 and 179–193 (examples).
  The design's (iii), "the limit lies outside `G v`", follows from Theorem 1.1 (ii): the limit has
  closed orbit and `G v` is not closed.
- §6.3, §6.4: BateMartinRohrle2005 lines 263–264, 267 (Lemma 2.6), 861–864 (Theorem 3.46); Sikora2012
  line 228 (Proposition 8).
- §6.6: RichardsonSlodowy1990 only (waived); the sketch was recomputed (table).
- §6.7: BCGGO2024 lines 2708–2713; Sikora2012 lines 363–364 (Corollary 17), 572–586 (Theorem 30);
  BateMartinRohrle2005 lines 355 (Lemma 2.12), 379–382 (Proposition 2.13), 510 (Corollary 3.7).
- §7.5: Sikora2012 lines 844–845 (Example 48), 823–837 (§11).

All ten cited works are in the manifest, with no local path. No fetch was needed and no
`needs-references.toml` was written.

**Ownership against open work** (`roadmaps grep --readme-only` over main and the open heads, by
object).

- Kempf–Ness: TensorProductCombinatorics on main only (projective, complex, one direction); the real
  linear theorem is owned here.
- Representation scheme or variety: three unrelated hits (hermitian representation schemes, Galois
  deformation). Character variety: six roadmaps mention one, none builds `𝒳(Γ, G^ℝ)`.
- Real reductive groups: ArithmeticLocallySymmetricSpaces and LieGroups Layer 9 own Cartan involutions
  and the decompositions, cited here (R02 for `K T K`); the datum `(𝐆, G^ℝ)` with an open subgroup is
  this roadmap's.
- `π₁(Σ_g ∖ P) ≅ S⁺(g, n)`: FreeGroupsAndLimitGroups §6.1a builds the combinatorial comparison and says
  "No comparison with a topological fundamental-group carrier is required"; the topological statement
  of §2.4 is owned here.
- Pure mapping class group, pure Birman sequence: MordellLawrenceVenkatesh §§5.9, 5.20 (cited); the
  board package `packages/MappingClassGroupsAndCanonicalRepresentations` states its own `PMod(g, b, p)`,
  Birman sequence, standard presentation and fixed-determinant representation schemes (its §§0.1, 0.2,
  0.5, 1.4) and does not name this roadmap. This roadmap is the owner: it is placed after
  TeichmullerGeometry, before that package in the merge order, and that package's red-team reports
  leave the move of its §§0.2–0.4 open until this design is accepted. The consumer bullet is the plan
  of record; the citation is owed by that package, not by this design. For the maintainer: settle it
  on that package when this design enters the merge order.

**Adversarial table** (sampled targets, headlines, repaired passages, and every target a finding
touches).

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Conventions, product and `conj` | wedge of two circles | `[a]*[b] = [b ⬝ a]`; `conj[u][γ] = [ū ⬝ (γ ⬝ u)]` from `mul_def` | as stated | none |
| Conventions, action witness | `ℤ²`, `φ`, `ψ` | `(φψ)⁻¹ = [[1,−1],[−1,2]]`, row `(1,−1)`; `(ψφ)⁻¹ = [[2,−1],[−1,1]]`, row `(2,−1)` | left action | none |
| §1.1 kernel and transport | `Q₈`; `e = conj g`; `ℤ²`, `diag(1,−1)` | `8/2 = 4`, `24/4 = 6`; `eφe⁻¹ = φ ∘ conj(φ⁻¹(g)g⁻¹)`; `[[1,1],[0,1]] ↦ [[1,−1],[0,1]]` | correct | none |
| §1.3 action and non-descent | `F₂`, `ρ = id`; `H` abelian; `ℤ/3` | `conj a · id = conj a⁻¹ ≠ id`; trivial; inversion swaps the two generators | iff both ways | none |
| §2.1 path component | `ℝ`; two points; `S¹`; `[0,1]` | orders `2, 2, 2, 2`; composition continuous for locally compact middle space | correct | none |
| §2.1 manifold bullet (new) | `ℝ`, `x + t`; `S¹ × ℝ` twist; `ℝ`, `(1−t)x + t arctan x` | inverses `y − t`, `(θ − 2πtσ(s), s)` continuous; last family not surjective at `t = 1`, so not through homeomorphisms; `finrank(ℝ × E) = 1 + finrank E` both sides | correct | none |
| §2.1 comparison with owners | `S²`; `T²` | `2, 2, 2`; `GL₂(ℤ)` three times | correct; hypothesis of §0.0e | R03 |
| §2.2 extension | `S²`, `{N,S}`; `S¹`, two points; `[0,1]`, `{0}`; `[0,1]`, `{0,1}`; `P = ∅` | rotation by `π`; no extension, hypothesis fails; `(0,1]` fixes `1`, extends; flip extends swapping; identity | correct | none |
| §2.2 isotopy clause | `I × P` | connected subset meeting every slice equals `I × {q}`; `H(I × U) ⊆ I × V` gives continuity at `(t, p)` | correct | none |
| §2.4 standard model (new) | `g = 0, 1, 2`; Klein bottle; `N₅`; `RP²`; disc | `d₂ = 0`, `H₂ = ℤ`, `H₁ = 0, ℤ², ℤ⁴`; `d₂ = 2a + 2b`, `H₁ = ℤ ⊕ ℤ/2`; `ℤ⁴ ⊕ ℤ/2`; `d₂ = 2`; `d₂ = h ≠ 0` | only `orientable g 0` matches | none |
| §2.4 presentations | `(1,0)`, `(0,3)`, `(1,1)`, `(0,1)` | `ℤ²`; `F₂`, abelianized loops `(1,0), (0,1), (−1,−1)` pairwise non-conjugate; `F₂`; trivial | correct | none |
| §2.5 pure Birman | `(0,3)`, `(1,1)`, `(1,0)`, `(0,2)` | `F₂ ≅ PMod_{0,4}`; `F₂ → PMod_{1,2} → SL₂(ℤ)`; `Push = 1`; `ℤ → 1` | correct | none |
| §2.6 changes of model | `e = id`; `e` a transposition in `Mod_{0,3}`; `diag(1,−1)` on `SL₂(ℤ)` | identity; conjugation in `S₃`; `A = ±D` forces `det A = −1`, so not inner | correct | none |
| §3.1 laws | change of path; composition; `id_σ` | `δ'δ̄(δ fγ δ̄)δδ̄'`, `u = δ ⬝ δ̄'`; `δ ⬝ fε ⬝ fgγ ⬝ fε̄ ⬝ δ̄`; `[σγσ̄] = conj[σ]⁻¹[γ]` | correct | none |
| §3.2 lemma | `f ∈ Homeo₀`; push | `f_η = 1`, `f_δ = conj[η ⬝ δ̄]`; `f_const = conj[α]`, the class of `ᾱγα`, §5.19's `α * γ * α⁻¹` | correct | none |
| §3.3 `Ψ_x` | `S¹`; `T²` shear; `[0,1]` | `ℤ/2`; columns `(1,1)`, `(0,1)`, the value of `mcg_torus_full`'s Check; not injective | correct | none |
| §3.4 reflection `r` | `schemaPoint m j t = exp(2πi(j+t)/m)`, `m = 4g`; `g = 1, 2` | `(j, t) ↦ (3 − j, 1 − t)` mod `4g`; `(4i,t)∼(4i+2,1−t) ↦ (4j+3,1−t)∼(4j+1,t)`, `j ≡ −i`, flags differ | descends | none |
| §3.4 sign step | projection formula; torus `A` | `f_*u = ε(f⁻¹)^*a ∩ [Σ]`; `î(f_*u, f_*v) = ε² · ε · î(u, v) = ε î(u, v)`; `det A` | correct | none |
| §3.4 index two | torus; sphere | `SL₂(ℤ) = ker det`; `Out(1) = 1`, index one | correct | none |
| §3.5 coverings | torus, `d = 3`; `d = 1` | `M(ker ρ) = {b ≡ a} = ker(ρ ∘ M⁻¹)`; `ρ ∘ M` gives `{b ≡ −a}`; trivial | direction fixed | none |
| §3.5 non-descent | `(0,3)`, `S₃`; `H` abelian; Burnside | `(1 2)(2 3)(1 2) = (1 3)`; trivial; `(36 + 12 + 18)/6 = 11` | iff both ways | none |
| §4.1 representation scheme | `ℤ`; `F_m`; trivial `Γ`; `ℤ/2`, `𝔾_m`, `𝔽₂` | `G`; `G^m`; `Spec k` (empty tensor product); `𝔽₂[t]/((t−1)²)` | correct | none |
| §5.2 real-form bridge | `GL₁`; `GL₂`, `τ = J ḡ J⁻¹`; `(gᵀ)⁻¹` | `z̄` and `z̄⁻¹`; `τ² = id` as `J J̄ = −1` is central, fixed points `[[a,−b̄],[b,ā]]`; holomorphic, fixed group `O_n(ℂ)` | correct | none |
| §5.3 realization | `G^ℝ` open in `𝐆(ℝ)`; image in `GL(V)` | `(k exp X)ᵀ = exp(X) k⁻¹ ∈ G^ℝ`; `ρ(k exp X)` orthogonal forces `exp ρ(X) = 1` | theorem correct | none |
| §5.3 third Check | `u SL₂(ℝ) u⁻¹`; `u SO₂ u⁻¹` | `= SL₂(ℝ)`, transpose-stable, `K = SO(2)`; `[[c+s,−2s],[s,c−s]]`, `K = {±1}`, `𝔭 = 0` | Check false | R01 |
| §5.4 Kempf–Ness (headline) | `ℝ_{>0}` on `ℝ²`; scaling on `ℝ`; compact `G`; hypothesis | `M = {abs x = abs y}`; `M = {0}`, `α = −1`, limit `0 ∉ G v`; `M = V`; `G = K exp(𝔭)` gives `𝔤 = 𝔨 ⊕ 𝔭` | equals BohmLafuente2021 Theorem 1.1 | none |
| §5.4 (v) | `ℝ_{>0}`; `SL₂(ℝ)` | `K = 1`, `T = G`; `K exp(chamber) K ⊆ K T K` | supplier's statement | R02 |
| §6.2 scalar extension | rotation; unipotent; `diag(2,3)` on `𝔤𝔩₂(ℂ)` | irreducible over `ℝ`, two characters over `ℂ`; neither; `1, 1, 2/3, 3/2`, doubled on `ℝ⁸` | both directions | none |
| §6.3 | torus; `U ⊂ SL₂`; `N(T)` | weight spaces; unipotent, not semisimple; `Z⁰ = T`, `𝔤` semisimple | iff both ways | none |
| §6.4 | `N(T)`; Borel; binary dihedral | no fixed line, `Z⁰ = T`; `R_u(B) ≠ 1`, centralizer `±1`; irreducible | correct as restricted | none |
| §6.6 closed real orbits | sketch, second direction | `τ(u) = u⁻¹`, `τZ = −Ad(u)Z`; `exp(τZ/2) u exp(Z/2) = u`; polar part `W` of the coset has `τW = W`, so `W ∈ 𝔭` | correct | none |
| §6.7 six characterizations (headline) | trivial `Γ`; genus-two unipotent; Borel-dense `F₂`; `GL_r(ℂ)` | all hold; all fail; `[[1,t²],[0,1]] → 1`; `(ρ, ρ̄)` | correct | none |
| §7.1 (headline) | `F_ℕ`, `ℝ^×`; `ℤ`, `SL₂(ℝ)`; inverse continuity | not locally compact; unipotent class not a point of `𝒳`; `f(k'_n v_n) → 0` and `→ 1` | correct | none |
| §7.2 (headline) | `ℤ`, `GL_n`; `F₂`, `SL₂`; properness | `𝔸^{n−1} × 𝔾_m`; `ℂ³`; a unit minimal vector in the null cone would be `0` | correct | none |
| §7.3 | `ℤ/2 ↞ ℤ`; `⟨a⟩ ≤ F₂` | elements of order dividing two; unipotent restriction not reductive | correct | none |
| §7.4 | `ℤ`, `SO(2)`; Fuchsian locus | inversion, fixed points `±1`; `e = 2 − 2g` and `2g − 2`, the values of TeichmullerGeometry §§4.4, 6.1 | correct | none |
| §7.5 | `ℤ`, `GL₁(ℝ)`; `ℤ`, `PSL₂(ℝ)`; `F₂`, `SL₂(ℂ)` | `ℝ^×`; no parabolic class; `x² + y² + z² − xyz − 2 = tr ρ([a,b])` | correct | none |

**Shape.** Summary, Scope, Conventions, contracts, build paragraph, seven layers each ending with
Examples and Dependencies, consumers, references. Every definition (§§1.2, 2.1, 3.1, 4.1, 5.1, 6.1, 7.1)
has an API list and at least three Checks; every theorem states its hypotheses and has a locator;
every *Needs:* line is itemised.

**Headline theorems, for the package stage.** The character variety theorem (§7.1), the complex
comparison (§7.2), the six characterizations (§6.7), the real Kempf–Ness theorem (§5.4), the outer
action and its non-descent (§§1.3, 3.5), the pure Birman sequence (§2.5), the real-form bridge (§5.2).
At the pins §5.4 and §1.3 are statable; the others lack a carrier (representation scheme, affine
quotient, real reductive datum, punctured mapping class group) and belong in the module docstring.
Padding probe and `#check` comparison: not applicable, no Lean file.

## Not verifiable

- FarbMargalit2012, Knapp2002, RichardsonSlodowy1990 (waived), Richardson1988, Goldman1984
  (uncertified): cited by locator only; the texts were not read.
- `packages/MappingClassGroupsAndCanonicalRepresentations` was read in the board checkout, not at the
  head of a pull request of its own; it is in neither the board index nor the open roadmap pull
  requests.
- Whether RepresentationTheory/LieGroups Layer 9's model class covers every group of §5.4 was checked
  on the hypotheses as written there (closed, transpose-stable, finitely many components), not on a
  Lean signature.
- Elaboration: not available in this lane, and no Lean file exists at the design stage.

## Source issues

- **Misprint** in Sikora2012 at §11, line 836, printed p. 18: the source refers to a Proposition 30 for the closed-orbit characterization; it should be Theorem 30 (line 572); affects nothing.
- **Error** in BCGGO2024 at §2.3, lines 471–472, printed p. 10: the source says the real form `SO_{p,q}` has two components whenever `p` or `q` is nonzero; it should be whenever both `p` and `q` are nonzero; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "fac7e2805c4378fe4b32170dcd537cae13bb3b6e", "job": "REV-DESIGN-SurfaceGroupCharacterVarieties~5", "model": "fable", "worker": "chris-x10"} -->
