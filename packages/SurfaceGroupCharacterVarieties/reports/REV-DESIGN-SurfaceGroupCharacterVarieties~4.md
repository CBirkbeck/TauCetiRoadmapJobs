# Review of SurfaceGroupCharacterVarieties (design, round 4)

**Verdict:** needs changes

Three blocking findings (P2) and seven notes (P3). All six round-3 findings are repaired. The ten
findings of this round come from the maintainer's thirteen notes, each checked against the supplier
texts at the heads named below: every note holds at least in part, and the parts that need no change
are listed under `## Verified sound`. The blocking findings are three places where the design takes
from MordellLawrenceVenkatesh or TeichmullerGeometry a statement that the cited section does not
make. No `Suggested.lean` exists at the design stage, and elaboration is not available (this lane
does not elaborate).

Heads read: MordellLawrenceVenkatesh and TeichmullerGeometry at the heads of their open pull
requests, GroupActionsOnRiemannSurfaces at the head of its open pull request, GeometricTopology,
FreeGroupsAndLimitGroups, ClassifyingSpaces, AlgebraicTopology, ReductiveGroups and
ReductiveGroupsPartII on main (index of 2026-11-11).

## R01 (P2) — the genus, orientability and polygon model of `Σ_g` are taken from sections that do not state them

Location: `packages/SurfaceGroupCharacterVarieties/design/README.md` §3.4 sketch, lines 801–803
("`Σ_g` is homeomorphic to the standard genus-`g` model (MordellLawrenceVenkatesh §5.4), so it has
genus `g` and is orientable in the sense of TeichmullerGeometry §0.0f, both being invariant under
homeomorphisms"), lines 809–810 and 817–823 (CW structure, core curves `a₁`, `b₁` and the reflection
`r`, all cited to TeichmullerGeometry §4.3); §2.4 sketch, lines 626–627 and 631; the
TeichmullerGeometry contract, lines 255–257 and 263–265; `design/plan.json` targets 2.4, 3.4.

Claim: MordellLawrenceVenkatesh §5.4 gives a `4g`-gon model of `(Σ_g, P)`; that model is
TeichmullerGeometry's, so `Σ_g` meets the hypotheses `Surface.IsOrientable` and
`1 ≤ Surface.genus` of `dehn_nielsen_baer`; §4.3 gives, for every `g ≥ 1`, a CW structure, transverse
core curves and a polygon on which `r` acts.

Witness, three texts:

- MordellLawrenceVenkatesh §5.4's statement is the connected-sum form with the `(g, b, n)`
  criterion; a polygon appears only in its proof sketch. Its genus is not `Surface.genus`.
- TeichmullerGeometry §0.0f: "Both are invariant under homeomorphisms" refers to the boundary count
  and orientability. `Surface.genus` is defined afterwards, as the genus of the standard model
  homeomorphic to the surface.
- TeichmullerGeometry §4.3 builds the polygon on the smooth `S_g` under that roadmap's convention
  `g ≥ 2` (Conventions, first bullet), has no reflection, and names the core curves only inside the
  computation of `ε_AT`.

No section read states that a surface of genus `g` in the sense of §5.4 has `Surface.genus = g`.

Repair:

1. Add a target to §2.4: "Prove that `Σ_g` is homeomorphic to the model of TeichmullerGeometry
   §0.0f's `StandardSurface.orientable g 0`; hence `Surface.IsOrientable Σ_g` and
   `Surface.genus Σ_g = g`." Route: §0.0f's classification gives one standard model. Cellular homology
   of its `schemaRealization` (AlgebraicTopology Stage 4 items 2–3) gives `H₂ = 0` for a crosscap
   word, and `H₂ = ℤ`, `H₁ = ℤ^{2g'}` for `g'` handle blocks. MordellLawrenceVenkatesh §5.5 gives
   `H₂(Σ_g; ℤ) = ℤ[Σ_g]`, and its §5.6 gives `χ(Σ_g) = 2 − 2g` from singular homology, so `g' = g`.
2. §2.4 sketch: replace "By MordellLawrenceVenkatesh §5.4 … open two-cell" by "By the comparison
   above and §2.3's moves, `(Σ_g, P)` is homeomorphic to the `schemaRealization` of the canonical
   word with `n` points in the open disc"; write "§5.23 is the case `g ≥ 1`, `n = 1`".
3. §3.4 sketch: cite the new target for the hypotheses of `dehn_nielsen_baer`; cite §0.0f's
   `schemaRealization` (one vertex, `2g` edges, one two-cell) for the CW structure; replace the
   core-curve sentence by "`î` is perfect (§5.5) on `H₁(Σ; ℤ) ≅ ℤ^{2g} ≠ 0`, hence nonzero"; define
   `r` as the map induced by `z ↦ e^{2πi·4/(4g)} z̄` on the disc of §0.0f's realization.
4. Contracts: add MordellLawrenceVenkatesh §5.6; in the §0.0f entry name `schemaRealization`,
   `StandardSurface.orientable`, `classification_of_surfaces` and
   `Surface.eulerChar_eq_two_sub_two_mul_genus`, and write "`Surface.IsOrientable` is invariant under
   homeomorphisms, and `Surface.genus` is constant on homeomorphism classes by its definition"; keep
   §4.3 only for the attaching word and its commutator convention. Mirror in `plan.json` (2.4, 3.4,
   suppliers) and in the *Needs:* lines of §§2.4, 3.4.

Tested. Torus: word `a b a⁻¹ b⁻¹`, `d₂ = 0`, `H₂ = ℤ`, `H₁ = ℤ²`, and `χ = 0 = 2 − 2·1`, so `g' = 1`.
Klein bottle: word `a a b b`, `d₂ = (2, 2)`, `H₂ = 0`, excluded by `H₂(Σ_g) = ℤ`. Reflection for
`g = 1`: `z ↦ z̄` sends arc `0` to arc `3` and arc `1` to arc `2` with `t ↦ 1 − t`; the glued pair
`(4i, t) ∼ (4i + 2, 1 − t)` goes to `(4j + 3, 1 − t) ∼ (4j + 1, t)`, `j ≡ −i`, which §0.0f's gluing
identifies, so `r` descends for every `g ≥ 1`. Perfectness: on `ℤ²` a perfect alternating form has
`î(e₁, e₂) = ±1`.

## R02 (P2) — §3.5 compares `Ψ_x` with an action that MordellLawrenceVenkatesh §5.9 does not define

Location: README §3.5, lines 855–857 ("the action of `Mod_{g,n}` on `Rep(π₁(Σ_{g,n}, x), H)` of
MordellLawrenceVenkatesh §5.9 … is `Ψ_x` (§3.3) followed by §1.3's action"); Scope, lines 49–51 and
70–72; the contract, lines 242–243; §3.3, lines 767–769; Summary and How to read; `plan.json`
target 3.5 and the MordellLawrenceVenkatesh supplier entry.

Claim: §5.9 gives, for every group `H`, an action of `Mod(S)` on conjugacy classes of homomorphisms
`π₁(S) → H`, by precomposition with `(f⁻¹)_*`.

Witness: §5.9 at its head lists four actions: on `H₁`, on isotopy classes of curves, on finite
coverings through `Out(π₁ S)`, and `Forget`. Conjugacy classes of homomorphisms `π₁(S) → G` occur
once, in its Construction, with `G` unquantified and no formula; `(f⁻¹)_*` is attached to coverings
only.

Repair:

1. §3.5, first sentence: "For every group `H`, define the action of `Mod^±_{g,n}` on
   `Rep(π₁(Σ_{g,n}, x), H)` as `Ψ_x` (§3.3) followed by §1.3's action,
   `[f] · [ρ] = [ρ ∘ Ψ_x[f]⁻¹]`. Prove that for `H = Sym(d)` and transitive `ρ` it is
   MordellLawrenceVenkatesh §5.9's action `[p] ↦ [f ∘ p]` of `Mod_{g,n}` on isomorphism classes of
   connected coverings of degree `d`, under the monodromy correspondence." Delete "and use this
   formula to extend it".
2. Scope, lines 49–51: "the action of `Mod^±_{g,n}` on conjugacy classes of homomorphisms, defined as
   `Ψ_x` followed by Layer 1's action, and its agreement with MordellLawrenceVenkatesh §5.9's action
   on finite coverings". Scope, lines 70–72, and the contract: "its action, through `Out(π₁ S)`, on
   isomorphism classes of finite coverings, `[p] ↦ [f ∘ p]`, which on monodromy is precomposition
   with `(f⁻¹)_*`".
3. §3.3: delete "and on conjugacy classes of homomorphisms". Summary and How to read: "defines", not
   "identifies". Mirror in `plan.json`.

Tested on the design's own Check: torus, `Ψ[f] = M = [[1,0],[1,1]]`, `ρ(u, v) = v mod 3`. The cover
`f ∘ p` has subgroup `M(ker ρ) = {b ≡ a}`, and `ρ ∘ M⁻¹ : (a, b) ↦ b − a` has the same kernel; the
right action `ρ ∘ M` has kernel `{b ≡ −a}`. So the comparison with coverings fixes the direction.

## R03 (P2) — the contract assumes that the isotopy of MordellLawrenceVenkatesh §5.9 is ambient isotopy

Location: README lines 249–250 ("Assumed: the isotopy relation of §5.9 is ambient isotopy
(Conventions)"); §2.2, lines 565–567 ("so `Mod_{g,n}` of MordellLawrenceVenkatesh §5.9 is the
orientation-preserving subgroup of `Mod^±(Σ_{g,n})`"); `plan.json` target 2.2.

Claim: §5.9's isotopy classes are classes for `TauCeti.AmbientIsotopic`.

Witness: §5.9 says "isotopy classes" and "isotopies being required to fix `∂S` pointwise", with no
definition. §§5.17–5.19 use paths in `Homeo⁺(S, ∂S)` with the compact-open topology. §§2.3, 2.5,
3.3 and 3.5 rest on the identification.

Repair:

1. §2.1, new API bullet: "For a topological manifold `X` without boundary, charted on a
   finite-dimensional real normed space, every homotopy `I × X → X` through homeomorphisms starting
   at the identity is an ambient isotopy: extended by its end maps to `ℝ × X`, its level-preserving
   total map is a continuous bijection of a manifold without boundary, hence open by invariance of
   domain."
2. Contract: replace the "Assumed" clause by "Used: the isotopies of §5.9 on `S = Σ_g ∖ P` are
   homotopies through homeomorphisms, the paths of §5.17's `Homeo⁺(S, ∂S)`; by §2.1 they are the
   ambient isotopies of `S`." Add the same clause to the Conventions bullet on isotopy and to §2.2's
   sentence on `Mod_{g,n}`.

Tested on `(g, n) = (0, 2)`, `S = S¹ × ℝ`: for `H_t(θ, s) = (θ + 2πt σ(s), s)`, `σ` a continuous step
from `0` to `1`, the inverse family `(θ − 2πt σ(s), s)` is jointly continuous, so the total map is a
homeomorphism and `H` is an ambient isotopy, as the bullet asserts. The weaker reading through
embeddings is not available: on `ℝ`, `x ↦ (1 − t)x + t arctan x` is a homeomorphism for `t < 1` and
not surjective at `t = 1`.

## R04 (P3) — the MordellLawrenceVenkatesh contract omits §5.22; two citations point at Checks or at a narrower statement

Location: README lines 236–250 (contract); line 695 ("`Mod_{1,0} ≅ SL₂(ℤ)`
(MordellLawrenceVenkatesh §5.22)"); lines 247–248 and 631 (§5.23).

Claim: the contract lists what is consumed; §5.22 gives `Mod(T²) ≅ SL₂(ℤ)`; §5.23 gives the free
basis for every genus.

Witness: §5.22 is in the *Needs:* of §3.5, in the Dependencies of Layers 2 and 3 and in `plan.json`,
not in the contract. Its theorem is surjectivity onto `Sp(2g, ℤ)`; the isomorphism is a Check
there. §5.23's free basis is stated for genus at least one.

Repair: add "§5.22 (for `g ≥ 1` the symplectic representation `Mod(S_g) → Sp(2g, ℤ)` is surjective)"
to the contract; cite `Mod_{1,0} ≅ SL₂(ℤ)` to TeichmullerGeometry §5.4a (`mcg_torus_full`, the
orientation-preserving subgroup) through §2.1; write "for `g ≥ 1`" in the §5.23 entry. Tested:
`mcg_torus_full` restricts `GL₂(ℤ)` to `SL₂(ℤ)` by `det`, the value §2.6's Check uses; for `g = 0`,
`n = 1` the group is trivial, which §2.4's third Check already computes.

## R05 (P3) — two symbols mean something else in the suppliers

Location: README §3.3, line 762 (`Ψ_x`); Conventions, lines 162–164 (`Mod^±`).

Claim: the notation agrees with the suppliers'.

Witness: MordellLawrenceVenkatesh §5.9 and §5.22 write `Ψ : Mod(S) → Aut(H₁(S; ℤ), î)` for the
symplectic representation, which §3.5's second Check uses. TeichmullerGeometry §3.1 defines
`Mod±(Σ) := π₀ Diff(Σ)`.

Repair: add to the Conventions "`Ψ_x` is the outer action of §3.3; MordellLawrenceVenkatesh's `Ψ` is
the symplectic representation, written here as the action on `H₁`. `Mod^±(X)` is topological (§2.1);
TeichmullerGeometry §3.1's `Mod±(Σ) = π₀ Diff(Σ)` is identified with it on closed surfaces by
§§0.0h and 2.1." Tested: torus, both groups are `GL₂(ℤ)`, and the shear maps to `[[1,0],[1,1]]` under
`Ψ_x` and under the action on `H₁`.

## R06 (P3) — GroupActionsOnRiemannSurfaces does not consume this roadmap

Location: README lines 1552–1553; `plan.json` `consumers`.

Claim: that roadmap takes §§1.3 and 3.3 from here.

Witness: GroupActionsOnRiemannSurfaces at its head, line 887: it uses "MordellLawrenceVenkatesh
§5.9's mapping class group of a finite-type punctured surface" and its outer action; a search of its
README for this roadmap's name finds nothing.

Repair: delete the consumer bullet and the `plan.json` entry; add to the Scope paragraph after the
deferrals: "The mapping-class action of GroupActionsOnRiemannSurfaces on classes of surface-kernel
epimorphisms, taken there from MordellLawrenceVenkatesh §5.9, is the case `H` finite, restricted to
surjections, of §3.5." Tested: `Rep(F₂, S₃)` has `11` classes, the surjective ones a subset stable
under `ρ ↦ ρ ∘ φ⁻¹`.

## R07 (P3) — §2.1 does not name the owner of the mapping class group of a compact surface

Location: README Scope, lines 34–37; §2.1, lines 509–511 and 530–535.

Claim: on closed surfaces `Mod^±` is compared with its owner.

Witness: GeometricTopology on main, Scope: "Layer 1.7.2 is the single owner of the mapping class
groups of compact surfaces". §2.1 compares `Mod^±(Σ_g)` with TeichmullerGeometry §0.0h only, which
in turn identifies `MappingClassGroupFull` with Layer 1.7.2's `Mod(F)` on closed surfaces.

Repair: append to §2.1's comparison bullet "and, composed with TeichmullerGeometry §0.0h's forgetful
isomorphism, with GeometricTopology Layer 1.7.2's `Mod(F)` for any smooth structure `F` on `Σ_g`,
the owner of the mapping class group of a compact surface"; add GeometricTopology Layer 1.7.2 to the
Scope deferrals. Tested: `S²`, order `2` in all three; `T²`, `GL₂(ℤ)` in all three.

## R08 (P3) — §3.4's `H₂` clause does not say how it relates to `Out⁺(Π)` of TeichmullerGeometry §5.4

Location: README §3.4, lines 796–797.

Claim: the index-two subgroup acting trivially on `H₂(π₁(Σ, x); ℤ)` is this roadmap's own
statement.

Witness: TeichmullerGeometry §5.4: "restricting to `Mod⁺(Σ) ≃ Out⁺(Π)`", with `Out⁺` defined
nowhere in that README.

Repair: add one clause to §3.4: "this subgroup, transported by `ι` of TeichmullerGeometry §4.2, is
the group that §5.4 there writes `Out⁺(Π)`; the description by the action on `H₂` is stated here".
Tested: torus, the subgroup is `SL₂(ℤ) = ker det`, the image of `Mod⁺(T²)` in `mcg_torus_full`.

## R09 (P3) — §3.3 states as its own a formula of MordellLawrenceVenkatesh §5.19

Location: README §3.3, line 771 ("and sends `Push(α)` to `MulAut.conj [α]`"); §3.2's first Check.

Claim: the formula is proved here.

Witness: §5.19, fourth API bullet: "endpoint point-pushing acts on based loops by `γ ↦ α*γ*α⁻¹`".

Repair: "…lifts `Ψ_x`; by MordellLawrenceVenkatesh §5.19, `Push(α)` acts by `MulAut.conj [α]`, which
is `f_{const}` for its end map (§3.2)". Tested: `MulAut.conj [α] [γ]` is the class of `ᾱ ⬝ γ ⬝ α`,
and `α * γ * α⁻¹ = (ᾱ.trans γ).trans α` under `FundamentalGroup.mul_def`.

## R10 (P3) — §7.1's sketch calls `M ∩ Hom` a cone

Location: README line 1393: "its action on the closed cone `M ∩ Hom` is proper".

Claim: `M ∩ Hom(Γ, G^ℝ)` is a cone.

Witness: `Γ = ℤ`, `G^ℝ = SO(2)`: `M ∩ Hom` is the set of pairs `(g, g⁻¹)`, of norm `2`, not stable
under scaling.

Repair: "on the closed set `M ∩ Hom`". Tested on the same instance: the set is compact, and `K`
acts properly on it.

## Verified sound

**Round-3 findings**, each quoted from the repaired text.

- R01, repaired: "`Out(Γ)` is TeichmullerGeometry §4.2's `OuterAut Γ`, the quotient of `MulAut Γ` by
  the normal subgroup `Inn(Γ)`"; §1.1 keeps only `Γ ⧸ Z(Γ) ≃* Inn(Γ)` and the transport.
- R02, repaired: "It differs from TeichmullerGeometry §0.0h's `MappingClassGroupFull X` by requiring
  the level-preserving total map of an isotopy to be a homeomorphism"; §3.4 "corresponds, under
  §2.1's isomorphism … to TeichmullerGeometry §5.4's `dehn_nielsen_baer`". What the repair left
  open is R01, R07 and R08 above.
- R03, repaired: "For a real reductive datum `(𝐆, G^ℝ)` and a finitely generated group `Γ`, define";
  §§7.3, 7.4 likewise; the `(ℝ^×)^ℕ` Check is present.
- R04, repaired: "preconnected (`TauCeti.isPreconnected_iInter_of_directed`)", with the family
  `U ∩ P = {p}`.
- R05, repaired: the "Assumed … fixes the fundamental class" clause is gone; the sketch derives
  `î(f_* u, f_* v) = ε_f î(u, v)`.
- R06, repaired: "write `w_n = g_n v_n` with `g_n = k_n t_n k'_n`".

**Maintainer notes** (13). Raised: 1 (R03), 2 (R02), 3 (R05), 4 in part, 5 and 7 (R04), 6, 8 and 9
(R01), 10 (R06), 11 in part (R07), 12 (R08), 13 (R09). Parts that need no change:

- Note 4, §§5.10–5.12, 5.18, 5.21 and TeichmullerGeometry §0.0d: the Scope lists what is left to
  owners, the contract what is consumed; no *Needs:* line uses these sections.
- Note 11, first half: §2.1 states the variant clause and the comparison isomorphism on compact
  connected manifolds, and the maintainer's record assigns the general group to this design.

**Principles.** No route-specific shortcut (§6.4's hypothesis is the settled repair of round 1); no
copied passage (the cited lines of five sources compared with the README); no algorithm; no Lean
file, so no `set_option` or sorry'd data; none of the never-cite roadmaps is cited; no process
words, pull-request numbers, LaTeX delimiters or machine paths (grepped). Two lines exceed the house
width (623, 1549); not a finding.

**Supplier order.** Gate output:

```text
candidate: SurfaceGroupCharacterVarieties is not in the merge order yet; checked as if placed after TeichmullerGeometry (the intake inserts it when its design is accepted)
depcheck: 229 roadmaps, 2064 edges, 0 problem(s)
```

No UPWARD or CYCLE line. The worker's citation list has one lead, `Surface.IsOrientable`: it is
TeichmullerGeometry §0.0f's own name, not a library name, so no finding. Overlaps: no open pull
request changes this roadmap, no cited id is dropped or defined only by a revision.

**Supplier citations resolved this round.** MordellLawrenceVenkatesh §§5.1, 5.4, 5.5, 5.6, 5.9,
5.15, 5.16, 5.17, 5.19, 5.20, 5.22, 5.23; TeichmullerGeometry Conventions, §§0.0e, 0.0f, 0.0h, 0.1,
3.1, 4.2, 4.3, 5.4, 5.4a; GeometricTopology Scope and Layer 1.7.2; ClassifyingSpaces items 11, 15,
17; FreeGroupsAndLimitGroups §6.1 (`[x, y] = x⁻¹ y⁻¹ x y`); ArithmeticGaloisRepresentations §1.7
**Semisimplicity over a perfect field** and §1.11's two paragraphs; ArithmeticLocallySymmetricSpaces
§ALS.0.1; ReductiveGroupsPartII §§RG2.0.1, RG2.0a.2; ComplexComparisonPartII §C-1.1; ReductiveGroups
Layers 0–7 and 3A.2, 3A.4; LieGroups Layer 7's three paragraphs; HamiltonianReduction R5;
InverseGaloisAndArithmeticFundamentalGroups §IG.3.2.

**Declared gaps.** `gcr-reductive-identity-component` and `borel-tits`: one sentence each with its
hypotheses, the same slug in `plan.json` and the README, a named supplier and section. No finding.

**Library declarations opened at the pins.** Mathlib: `FundamentalGroup.mul_def`
(`AlgebraicTopology/FundamentalGroupoid/FundamentalGroup.lean:44`),
`FundamentalGroup.fundamentalGroupMulEquivOfPath` (:48, `Iso.conj` of the path class),
`FundamentalGroup.mapOfEq` (:85), `FundamentalGroupoidFunctor.homotopicMapsNatIso`
(`FundamentalGroupoid/InducedMaps.lean:67`), `MulAut.conj` and `MulAut.congr`
(`Algebra/Group/End.lean:721`, `:745`), `QuotientGroup.congr` (`GroupTheory/QuotientGroup/Defs.lean:397`),
`QuotientGroup.quotientKerEquivRange` (`QuotientGroup/Basic.lean:134`),
`Subgroup.fg_of_index_ne_zero` (`GroupTheory/Schreier.lean:166`),
`Representation.IsSemisimpleRepresentation` (`RepresentationTheory/Semisimple.lean:34`),
`groupHomology.map` (`RepresentationTheory/Homological/GroupHomology/Functoriality.lean:157`),
`t2Space_quotient_mulAction_of_properSMul` (`Topology/Algebra/ProperAction/Basic.lean:113`). Tau
Ceti: `TauCeti.AmbientIsotopy` (`Topology/Homotopy/Isotopy/Basic.lean:163`, total map a
homeomorphism, starts at the identity), `.finalHomeomorph` (:234), `.trans` (:328), `.symm` (:368),
`.conj` and `.finalHomeomorph_conj` (`Topology/Homotopy/AmbientIsotopyConj.lean:110`, `:131`),
`TauCeti.AmbientIsotopic.isotopic` and `.setoid` (`Topology/Homotopy/AmbientIsotopic/Basic.lean:94`,
`:103`), `TauCeti.isotopic_iff_ambientIsotopic` (`Topology/Homotopy/Isotopy/Compact.lean:123`),
`TauCeti.isPreconnected_iInter_of_directed` (`Topology/Continuum.lean:69`),
`TauCeti.Coalgebra.IsLinearlyReductive` (`Algebra/Coalgebra/Comodule/LinearlyReductive.lean:249`),
`TauCeti.Comodule.Hom.fixedMap_surjective_of_isLinearlyReductive` (`…/LinearlyReductive/Fixed.lean:184`),
`TauCeti.PointTopology.topology` and `.instTopologicalSpaceWithConv`
(`Topology/Algebra/PointTopology/Basic.lean:83`, `:110`),
`ContRepresentation.IsUnitary.isSemisimpleRepresentation`
(`RepresentationTheory/Continuous/InvariantComplement.lean:190`).

**Sources, seeded sample** (15 targets). No locator is flagged unverified by the author.

- §§1.1, 2.1, 2.2, 3.1, 3.2, 3.4: FarbMargalit2012 only (waived); the mathematics is in the table.
- §2.5: LandesmanLitt2024 lines 503–515, Lemma 2.0.1 with the pure Birman row at line 512.
- §3.5: LandesmanLitt2024 lines 41–50 (outer action, Definition 1.1.1, no natural action on the
  representation variety) and 473–475 (`PMod`, index `n!`).
- §4.3: BCGGO2024 lines 2706–2708 (`Hom(π₁Σ, G^ℝ)` and conjugation).
- §6.2: Sikora2012 lines 262–266.
- §6.4: BateMartinRohrle2005 lines 263–264, 267 (Lemma 2.6), 861–864 (Theorem 3.46); Sikora2012
  line 228 (Proposition 8).
- §6.7: BCGGO2024 lines 2708–2713; Sikora2012 lines 363–364 (Corollary 17), 572–586 (Theorem 30);
  BateMartinRohrle2005 lines 355 (Lemma 2.12), 379–382 (Proposition 2.13).
- §7.1: BCGGO2024 lines 2712–2713 (Definition 8.1); BohmLafuente2021 lines 52–62, 77–88.
- §§7.2, 7.5: Sikora2012 lines 823–837 (§11), 844–845 (Example 48).

All ten cited works are in the manifest, with no local path. No fetch was needed and no
`needs-references.toml` was written.

**Ownership against open work** (`roadmaps grep --readme-only` over main and the open heads).
`character variet`: GaugeQuiltFieldTheory, InstantonFloerTheory, CountingBundlesAndHallAlgebrasOfCurves,
IntegralHeckeAndGaloisDeterminants, GeometricTopology, PainleveEquations; none builds
`𝒳(Γ, G^ℝ)`. `PMod|pure mapping class`: one sentence each in GrothendieckTeichmuller,
MordellLawrenceVenkatesh §5.9 (a Check) and GroupActionsOnRiemannSurfaces; no owner. The board's
package index (three packages) holds nothing related. Other objects were searched in round 3 and
not again.

**Adversarial table** (sampled targets, headlines, and every target a finding touches).

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §1.1 kernel and transport | `Q₈`; `e = conj g`; `ℤ²`, `e = diag(1,−1)` | `8/2 = 4`, `24/4 = 6`; `eφe⁻¹(y) = gφ(g)⁻¹φ(y)φ(g)g⁻¹ = φ∘conj(φ⁻¹(g)g⁻¹)(y)`; `[[1,1],[0,1]] ↦ [[1,−1],[0,1]]` | correct | none |
| Conventions, action witness | `ℤ²`, `φ`, `ψ` | `φψ = [[2,1],[1,1]]`, inverse row `(1,−1)`; `ψφ = [[1,1],[1,2]]`, inverse row `(2,−1)` | left action | none |
| §2.1 path component, compact case | `ℝ`; two points; `S¹`; `[0,1]` | orders `2`, `2`, `2`, `2`; compact `I × X` to Hausdorff is closed | correct | none |
| §2.1 versus §5.9's isotopy | `S¹ × ℝ` twist; `ℝ`, `(1−t)x + t arctan x` | inverse family continuous; not surjective at `t = 1` | assumption unstated in supplier | R03 |
| §2.1 versus owners | `S²`, `T²` | `2`, `GL₂(ℤ)` in `Mod^±`, `MappingClassGroupFull`, Layer 1.7.2 | owner unnamed | R07 |
| §2.2 extension theorem | `S²`, `{N, S}`; `S¹`, two points; isolated `p`; `y ∈ Σ ∖ P` | rotation by `π`; no extension; `U ⊆ {p}` gives `U ∖ {p} = ∅`, so `p` is not isolated and `Σ ∖ P` is dense; `h(Σ ∖ (P ∪ U))` open, disjoint from `h(U ∖ {p})` | correct | none |
| §2.2 isotopy clause | `I × P`, `P` finite | connected subset of `I × P` lies in one `I × {q}`; meets every slice; `q = p` at `t = 0` | correct | none |
| §2.4 presentations | `(1,0)`, `(0,3)`, `(1,1)`, `(0,1)` | `ℤ²`; `F₂`; `F₂`; trivial, outside §5.23 (`g ≥ 1`) | citations | R01, R04 |
| §2.5 pure Birman | `(0,3)`, `(1,1)`, `(1,0)`, `(0,2)` | `F₂ ≅ PMod_{0,4}`; `F₂ → PMod_{1,2} → SL₂(ℤ)`; `Push = 1`; `ℤ → 1` | correct | none |
| §3.1 laws | change of path; composition; inverse; `id_σ` | `δ'δ̄(δ fγ δ̄)δδ̄'`; `δ ⬝ fε ⬝ fgγ ⬝ fε̄ ⬝ δ̄`; `id_{δ ⬝ δ̄} = 1`; `[σγσ̄] = conj[σ]⁻¹[γ]` | correct | none |
| §3.2 lemma | `f ∈ Homeo₀`; push | `f_η = 1`, `f_δ = conj[η ⬝ δ̄]`; `f_const = conj[α]`, class of `ᾱγα` | correct; equals §5.19 | R09 |
| §3.3 `Ψ_x` | `S¹`; `T²` shear | `ℤ/2`; columns `(1,1)`, `(0,1)` | correct; symbol clash | R05 |
| §3.4 comparison with `dehn_nielsen_baer` | torus; Klein bottle; sphere | `H₂ = ℤ`, `H₁ = ℤ²`, `g' = 1`; `d₂ = (2,2)`, `H₂ = 0`; `2 → 1` | hypotheses unowned | R01 |
| §3.4 reflection `r` | `g = 1`; general `g` | arcs `0 ↔ 3`, `1 ↔ 2`, `a ↔ b`; `4i + j ↦ 4(−i) + 3 − j` | descends | R01 (citation) |
| §3.4 sign and `H₂` clause | torus `A`; `S²` | `î(Au, Av) = det A · î(u, v)`; `î = 0`, `H₂(1) = 0` | correct for `g ≥ 1` | R08 |
| §3.5 definition of the action | torus triple cover | kernels `{b ≡ a}` and `{b ≡ −a}` | supplier action undefined | R02 |
| §3.5 non-descent | `(0,3)`, `S₃`; `ℤ/3`; Burnside | `(1 2)(2 3)(1 2) = (1 3)`; trivial; `66/6 = 11` | iff both ways | none |
| §3.5 unipotent Check | genus two, `f`, `cf` | conjugation by `diag(c, 1)` scales `f`; orbit of a primitive class modulo `±` infinite | correct | none |
| §4.3 | `(1,0)`, `(0,3)`, `(0,0)`, `(1,1)` | commuting pairs; `G²`; point; `G²` | correct | none |
| §5.4 Kempf–Ness (headline) | `ℝ_{>0}` on `ℝ²`; scaling on `ℝ`; compact `G` | `M = {abs x = abs y}`; `M = {0}`, `α = −1`; `M = V` | equals BohmLafuente2021 Theorem 1.1 | none |
| §6.2 | rotation; unipotent; `diag(2,3)` | irreducible over `ℝ`, two characters over `ℂ`; neither; eigenvalues `1, 1, 2/3, 3/2` | both directions | none |
| §6.4 | `N(T)`; Borel; trivial `Z` | no fixed line, `Z⁰ = T`; `R_u(B) ≠ 1`; both sides hold | correct as restricted | none |
| §6.7 | trivial `Γ`; torus; genus-two unipotent; Borel-dense `F₂`; `GL_r(ℂ)` | all six hold; all hold; all fail; `[[1,t²],[0,1]] → 1`; `(ρ, ρ̄)` | correct | none |
| §7.1 | `F_ℕ`, `ℝ^×`; trivial `Γ`; `ℤ`, `SO(2)`; inverse continuity | not locally compact; point; `M ∩ Hom` compact of norm `2`, not a cone; `f(k'_n v_n) → 0` and `→ 1` | correct; one word wrong | R10 |
| §7.2 | `ℤ`, `GL_n`; `F₂`, `SL₂`; properness | `𝔸^{n−1} × 𝔾_m`; `ℂ³`; `f_i(v_n/‖v_n‖) = f_i(v_n)/‖v_n‖^{d_i} → 0` | correct | none |
| §7.3 | `ℤ/2 ↞ ℤ`; index-two subgroup of `F₂` | elements of order dividing two, closed; rank `3` | correct | none |
| §7.5 | `ℤ`, `GL₁(ℝ)`; `ℤ`, `PSL₂(ℝ)`; `F₂`, `SL₂(ℂ)` | `ℝ^×`; no parabolic class; `x² + y² + z² − xyz − 2` | correct | none |

**Shape.** Summary, Scope, Conventions, contracts, build paragraph, seven layers each ending with
Examples and Dependencies, consumers, references. Every definition (§§1.2, 2.1, 3.1, 4.1, 5.1, 6.1,
7.1) has an API list and at least three Checks; every theorem has a locator; layer names are
mathematical and the order follows the dependency lines.

**Headline theorems, for the package stage.** The character variety theorem (§7.1), the complex
comparison (§7.2), the six characterizations (§6.7), the real Kempf–Ness theorem (§5.4), the outer
action and its non-descent (§§1.3, 3.5), the pure Birman sequence (§2.5), the real-form bridge
(§5.2). At the pins, §5.4 and §1.3 are statable and belong in `Suggested.lean`; the others lack a
carrier (representation scheme, affine quotient, real reductive datum, punctured mapping class
group) and must be named in the module docstring. Padding probe and `#check` comparison: not
applicable, no Lean file.

## Not verifiable

- FarbMargalit2012, Knapp2002, RichardsonSlodowy1990 (waived), Richardson1988, Goldman1984
  (uncertified): cited by locator only; the texts were not read.
- MappingClassGroupsAndCanonicalRepresentations is in the merge order after TeichmullerGeometry but
  is neither on main nor in an open pull request, so the consumer entry could not be checked.
- Which Euler characteristic MordellLawrenceVenkatesh §5.6 and TeichmullerGeometry §0.0f share is not
  displayed in either text; R01's route uses homology ranks, which both state.
- Elaboration: not available in this lane, and no Lean file exists at the design stage.

## Source issues

- **Misprint** in Sikora2012 at §11, line 836, printed p. 18: the source refers to a Proposition 30 for the closed-orbit characterization; it should be Theorem 30 (line 572); affects nothing.
- **Error** in BCGGO2024 at §2.3, line 471, printed p. 10: the source says the real form `SO_{p,q}` has two components whenever `p` or `q` is nonzero; it should be whenever both `p` and `q` are nonzero; affects nothing.
