<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13837#issuecomment-6897872903 -->
Review (claude) of aa2b6a1

Verdict: needs_changes

**For the human reviewers:** this review raises 1 question that a human decides (the scope of the roadmap, or a licence). It is in the section of that name at the end and does not change the verdict.

1. **F01** (P3) the `F₂`, `SL₂` trace-coordinate examples do not cite their owner

   Location: `packages/SurfaceGroupCharacterVarieties/design/README.md`, §7.2 second Check ("`Γ = F₂`,
   `G = SL₂`: `(Hom//G)(ℂ) ≅ ℂ³` through `(tr ρ(a), tr ρ(b), tr ρ(ab))` (Sikora2012 lines 844–845,
   Example 48)"); §7.5 third Check; Layer 7 Examples ("`Out(F₂) ≅ GL₂(ℤ)` acting by polynomial
   automorphisms preserving `x² + y² + z² − xyz − 2 = tr ρ([a, b])`"); Scope.

   Claim: these values are given with a source locator only, as if no roadmap or library stated them.

   Witness: NonabelianLevelStructures (open, a new roadmap folder, in the merge order right after
   MappingClassGroupsAndCanonicalRepresentations) §5.1 proves `R[x, y, z] ≅ 𝒪(SL₂ × SL₂)^(GL₂)` for
   every commutative ring `R` (`integral_trace_coordinates`); its §5.2 gives the action of `Aut(F₂)` on
   `𝔸³` through `Out(F₂)`. Tau Ceti at the pin has the Fricke identity:
   `Matrix.SpecialLinearGroup.trace_commutatorElement_fin_two`
   (`TauCeti/LinearAlgebra/Matrix/Trace/FinTwo.lean:231`).

   Repair:

   - §7.2 second Check and §7.5 third Check: add "(NonabelianLevelStructures §5.1, which proves the
     isomorphism over every commutative ring)" beside the Sikora2012 locator.
   - Layer 7 Examples: cite NonabelianLevelStructures §5.2 for the polynomial action and Tau Ceti
     `Matrix.SpecialLinearGroup.trace_commutatorElement_fin_two` for the identity.
   - Scope, the paragraph of special cases: add one sentence, "NonabelianLevelStructures §5.1's
     rank-two character scheme of `F₂` is, over a field `k`, the case `Γ = F₂`, `G = SL₂` of §7.2 (the
     `GL₂`- and `SL₂`-invariants agree, conjugation factoring through `PGL₂`); it is stated there over
     every commutative ring with explicit trace coordinates, which §7.2 does not give."
   - Add "NonabelianLevelStructures §5.1; NonabelianLevelStructures §5.2" to §7.5's *Needs:*, to Layer
     7's Dependencies, a contract subsection *From TauCetiRoadmap.NonabelianLevelStructures*, and the
     `suppliers` list of `plan.json`; add the Tau Ceti name to *From Tau Ceti*.

   Tested: a scratch copy of the README with the two citations in §7.5's *Needs:* passes the
   dependency check ("checked as if placed after NonabelianLevelStructures … 0 problem(s)") and
   `roadmaps resolve` lists no citation found nowhere. Over `ℂ` the three texts give the same value,
   `ℂ³` with coordinates `(tr A, tr B, tr AB)`; §5.2's Vieta move `(x, y, z) ↦ (x, y, xy − z)` preserves
   `x² + y² + z² − xyz − 2` (`z² − xyz` becomes `(xy − z)² − xy(xy − z) = z² − xyz`).

2. **F02** (P3) §5.2's sketch uses `φᵢ^*` in two directions

   Location: README §5.2, proof sketch ("The pullback `φᵢ^*` identifies `O(𝐆ᵢ) ⊗_ℝ ℂ` with `O(H)`, and
   it carries `O(𝐆ᵢ) ⊗ 1` onto the fixed space `F`"; "`W = φᵢ^*(O(𝐆ᵢ) ⊗ 1)`"; "`φ₁^* ∘ (φ₂^*)⁻¹`
   restricts to an isomorphism of real Hopf algebras `O(𝐆₂) ≅ O(𝐆₁)`").

   Claim: one map `φᵢ^*` serves both sentences.

   Witness: `φᵢ : (𝐆ᵢ)_ℂ → H` pulls back to `φᵢ^* : O(H) → O(𝐆ᵢ) ⊗_ℝ ℂ`. With that direction
   `φ₁^* ∘ (φ₂^*)⁻¹ : O(𝐆₂) ⊗ ℂ → O(𝐆₁) ⊗ ℂ` composes, but `φᵢ^*(O(𝐆ᵢ) ⊗ 1)` does not typecheck; with
   the opposite direction the composite does not.

   Repair: write "The pullback `φᵢ^* : O(H) → O(𝐆ᵢ) ⊗_ℝ ℂ` is an isomorphism, and its inverse carries
   `O(𝐆ᵢ) ⊗ 1` onto the fixed space `F`"; "`W = (φᵢ^*)⁻¹(O(𝐆ᵢ) ⊗ 1)`"; "Hence
   `(φ₁^*)⁻¹(O(𝐆₁) ⊗ 1) = F = (φ₂^*)⁻¹(O(𝐆₂) ⊗ 1)`". The composite `φ₁^* ∘ (φ₂^*)⁻¹` stays. Tested on
   the section's own Check: `H = GL₁`, `(𝔾_m, id)` and `(𝔾_m, inv)`, `O(H) = ℂ[z^{±1}]`,
   `φ₂^*(z) = t⁻¹`, `F = ℝ[z^{±1}]`, `(φ₂^*)⁻¹(ℝ[t^{±1}]) = ℝ[z^{±1}] = F`, and
   `φ₁^* ∘ (φ₂^*)⁻¹ : t ↦ t⁻¹`, so `α = inv`, as the Check says.

Two findings, both P3, each with a repair to apply; no P1 or P2. The six round-7 findings are
repaired. The two declared supplier gaps `gcr-reductive-identity-component` and `borel-tits` are
precise, minimal and declared in both files; they are contracts, not findings. There is no
`Suggested.lean` at the design stage, and this lane does not elaborate: elaboration is `not
available (this lane does not elaborate)`.

## Verified sound

**Round-7 findings** (6), each against the current text.

- F01, repaired. §5.2: "RealSemisimpleLieGroups §2.5 supplies an `ℝ`-form `(𝐆_τ, φ_τ)` with
  conjugation `τ`"; the section keeps "*Uniqueness.*" and "*Converse.*". Scope lists the bridge
  under "leaves to named owners" with the §5.3 kept-variant clause; the contract has *From
  TauCetiRoadmap.RealSemisimpleLieGroups*; §5.2's *Needs:*, Layer 5's Dependencies and `plan.json`
  (target 5.2, `suppliers`) name §2.5. ReductiveGroups Layers 8–9, LieGroups Layer 7 and
  CompactGroups Layer 5 occur nowhere. At its head, RealSemisimpleLieGroups §2.5 states the form
  `𝐇₀` with `𝐇₀(ℝ) = H^τ`, the Cartan involutions as complexifications of ALS.0.1's, conjugacy
  under `(H^τ)°`, `K = H^τ ∩ H^σ` maximal compact and `K × 𝔭 → H^τ`; it states no uniqueness. Its
  Scope names character varieties of surface groups as consumers of §2.5.
- F02, repaired. `sources.toml`: FarbMargalit2012 "2.2, 2.5: punctures versus marked points", no
  Birman item; LandesmanLitt2024 locator "lines 41–50 (Definition 1.1.1); lines 473–475".
- F03, repaired. "## Layer 2: Isotopy classes, punctures and marked points, and the standard
  model", the same in `plan.json`.
- F04, repaired. §5.3: "the squared lengths of the two columns are `1 + s(2c + s)` and
  `1 + 2s(2s − c)`, so columns of length one force …".
- F05, repaired. §6.3: "BateMartinRohrle2005 Corollary 3.42, line 814, for the adjoint criterion …
  stated there for `p > 2h − 2` and holding in characteristic zero by lines 183–187; line 263 …".
  Read: line 814 is the adjoint criterion, lines 183–187 the characteristic-zero remark, lines
  263–264 reductivity of `H⁰` and its converse.
- F06, repaired. §3.4 *Needs:* has "ClassifyingSpaces Stage 3 item 15"; `plan.json` 3.4 and
  `suppliers` too. On main item 15 is "Homotopy functoriality".

Repaired patterns searched in the rest of the design: an object owned by an open roadmap and not
cited (found once, R01); contract items in no *Needs:* line (none new; `plan.json` `suppliers` and
the contract list the same sections for all sixteen suppliers); "antiholomorphic involution" (only
the deliberate non-example of §5.2).

**Maintainer notes** (13). None gives a finding at this head.

- 1: the contract's "Used:" clause reads §5.9's isotopies as paths in `Homeo⁺(S, ∂S)` (§5.17) and
  derives ambient isotopy from §2.1's manifold bullet; nothing is assumed.
- 2: Scope and contract attribute to §5.9 the action on finite coverings; the action on
  `Rep(π₁, H)` is §3.5's definition.
- 3: Conventions, "Notation shared with suppliers", separates `Ψ_x` from §5.9's `Ψ` and `Mod^±(X)`
  from TeichmullerGeometry §3.1's `Mod±(Σ)`.
- 4: contract and `plan.json` both list §§5.1, 5.4, 5.5, 5.6, 5.9, 5.15, 5.17, 5.19, 5.20, 5.22;
  the Scope's longer lists (with §0.0d) are deferrals.
- 5: `Mod_{1,0} ≅ SL₂(ℤ)` is cited to TeichmullerGeometry §5.4a (`mcg_torus_full`).
- 6: the contract states §5.4 in its connected-sum form; the polygon model is §2.4's own target.
- 7: §5.23 is cited by no contract item, *Needs:* line or `plan.json` entry.
- 8: the contract says orientability is invariant and the genus constant "by its definition", as
  §0.0f does.
- 9: §4.3 is cited for the attaching word and commutator only; the reflection is built in §3.4.
- 10: no consumer bullet names GroupActionsOnRiemannSurfaces; the Scope describes its §3.4 as a
  restriction of §3.5, which that section's text supports.
- 11: §2.1 states the variant clause, the comparison map and GeometricTopology Layer 1.7.2.
- 12: §3.4: "the group that TeichmullerGeometry §5.4 writes `Out⁺(Π)` …; its description by the
  action on `H₂` is stated here".
- 13: §§3.2–3.3 cite MordellLawrenceVenkatesh §5.19 for `Push` and its formula.

**Principles.** No copied passage, algorithm, `set_option`, sorry'd data or Lean file. No roadmap
of the never-cite list is cited. Greps for LaTeX delimiters, pull-request numbers, round labels,
machine paths and "optional/deferred/removed/current" find nothing. §6.4 states the equivalence
for topologically finitely generated `Z`, as round 1 required for its route; the direction used
for every closed subgroup is the declared gap.

**Supplier order.** Gate output:

```text
candidate: SurfaceGroupCharacterVarieties is not in the merge order yet; checked as if placed after MappingClassGroupsAndCanonicalRepresentations (the intake inserts it when its design is accepted)
depcheck: 245 roadmaps, 2241 edges, 0 problem(s)
```

No UPWARD or CYCLE line. RealSemisimpleLieGroups is an open pull request of another author adding
a new roadmap folder and is not in the merge order: the package's pull request must name it in its
merge-order paragraph. The overlaps file lists no pull request changing this roadmap, no dropped
id and no id only a revision defines. The four names of `scratch/citations.md`
(`StandardSurface.eulerChar_model`, `StandardSurface.isSurface_model`,
`StandardSurface.homeomorph_unique`, `Surface.IsOrientable`) are TeichmullerGeometry §0.0f's and
occur at its head.

**Supplier citations resolved this round.**

- MordellLawrenceVenkatesh (open head): §§5.1, 5.4, 5.5, 5.6, 5.9, 5.15, 5.17, 5.19, 5.20, 5.22.
  §5.9: covering action `[p] ↦ [f ∘ p]`, monodromy precomposed with `(f⁻¹)_*`; §5.19:
  `γ ↦ α * γ * α⁻¹`; §5.17: compact-open topology and isotopy extension; §5.20: `χ(S) < 0`.
- TeichmullerGeometry (open head): §§0.0b (`image_boundary`, PL structures), 0.0e (compatible
  smoothings, the two models), 0.0f (`schemaRealization`, the cell structure "one open disc, one
  open edge per class of sides and one vertex per vertex class", `classification_of_surfaces`,
  `Surface.genus`), 0.0h (`isotopicToIdSubgroup`, `MappingClassGroupFull`, the forgetful
  isomorphism), 4.2 (`OuterAut`, `innerAut_normal`, `ι`), 4.3, 4.4–4.5, 5.4 (`dehn_nielsen_baer`,
  value `FundamentalGroup.mapOfEq f`), 5.4a (`mcg_sphere_full`, `mcg_torus_full` with
  `(x, y) ↦ (ax + by, cx + dy)`), 6.1.
- MappingClassGroupsAndCanonicalRepresentations (open head): §§0.1, 0.2 (index `p!`), 0.3, and
  §§1.4, 2.1 for the Scope's clauses. LanglandsParameterStacks §2.2 (finite generation, closed
  images, separation, unique closed orbit in geometric fibres, universal submersiveness).
  ArithmeticGaloisRepresentations §1.7 **Semisimplicity over a perfect field** and §1.11's two
  named paragraphs. ArithmeticLocallySymmetricSpaces ALS.F.1, ALS.0.1. ComplexComparisonPartII
  §C-1.1. RealSemisimpleLieGroups §2.5. GroupActionsOnRiemannSurfaces §3.4.
  InverseGaloisAndArithmeticFundamentalGroups §IG.3.2.
- On main: ReductiveGroups Layers 0, 1 (§1.1, comodule invariants against point-fixed vectors),
  2, 3A (3A.2, 3A.4), 5, 6, 7; ReductiveGroupsPartII §§RG2.0.1, RG2.0a.2; FreeGroupsAndLimitGroups
  §§6.1 (`S⁺(g, m)`, `[x, y] = x⁻¹ y⁻¹ x y`), 6.2; AlgebraicTopology §§4.2–4.3 (main keeps "Stage 4
  items 1–8 are §§4.1–4.8"); ClassifyingSpaces Stage 3 items 11, 15, Stage 4 item 17;
  GeometricTopology Layer 1.7.2; LieGroups Layer 9 with **Restricted roots and KAK**
  (`kakDecomposition`); HamiltonianReduction R5.

**Declared gaps.** `gcr-reductive-identity-component` (ArithmeticGaloisRepresentations §1.11) and
`borel-tits` (ReductiveGroups Layer 7): one sentence each with its hypotheses, the same slug in
`plan.json` and in the supplier's contract subsection. A search of all heads and main for
"Borel–Tits" and for reductivity of the identity component of a completely reducible subgroup
finds neither statement, so neither asks for what is provided. No finding.

**Library declarations opened at the pins.**

- Tau Ceti: `AmbientIsotopy`, `finalHomeomorph`, `trans`, `symm`
  (`Topology/Homotopy/Isotopy/Basic.lean:163, 234, 328, 368`); `conj`, `finalHomeomorph_conj`
  (`Topology/Homotopy/AmbientIsotopyConj.lean:110, 131`); `AmbientIsotopic`
  (`Topology/Homotopy/AmbientIsotopic/Basic.lean:58`); `isotopic_iff_ambientIsotopic`
  (`Topology/Homotopy/Isotopy/Compact.lean:123`); `Continuous.isOpenEmbedding_of_injective`
  (`AlgebraicTopology/Singular/InvarianceOfDomain.lean:201`); `isPreconnected_iInter_of_directed`
  (`Topology/Continuum.lean:69`, `[T2Space X] [Nonempty ι]`);
  `ConnectedCoveringSpace.monodromyEquivalence`, `basepointMulAction`
  (`AlgebraicTopology/UniversalCover/Classification/MonodromyEquivalence.lean:158, 93`);
  `PointTopology.topology`, `instTopologicalSpaceWithConv`
  (`Topology/Algebra/PointTopology/Basic.lean:83, 110`);
  `Hom.fixedMap_surjective_of_isLinearlyReductive`
  (`Algebra/Coalgebra/Comodule/LinearlyReductive/Fixed.lean:184`);
  `IsUnitary.isSemisimpleRepresentation`
  (`RepresentationTheory/Continuous/InvariantComplement.lean:190`).
- Mathlib: `FundamentalGroup.mul_def`, `fundamentalGroupMulEquivOfPath`, `map`, `mapOfEq`
  (`AlgebraicTopology/FundamentalGroupoid/FundamentalGroup.lean:44, 48, 79, 85`);
  `homotopicMapsNatIso` (`…/InducedMaps.lean:67`); `MulAut.congr` (`Algebra/Group/End.lean:745`);
  `QuotientGroup.congr` (`GroupTheory/QuotientGroup/Defs.lean:397`); `quotientKerEquivRange`
  (`GroupTheory/QuotientGroup/Basic.lean:134`); `fg_of_index_ne_zero`
  (`GroupTheory/Schreier.lean:166`); `groupHomology.map`
  (`RepresentationTheory/Homological/GroupHomology/Functoriality.lean:157`);
  `IsSemisimpleRepresentation` (`RepresentationTheory/Semisimple.lean:34`);
  `t2Space_quotient_mulAction_of_properSMul` (`Topology/Algebra/ProperAction/Basic.lean:113`);
  `Opens.instChartedSpace` (`Geometry/Manifold/HasGroupoid.lean:284`).

**Sources, seeded sample** (15 targets). The author flags no locator as unverified.

- §§1.1, 2.1, 2.2, 2.4, 2.5: FarbMargalit2012 only (waived, not read); the mathematics is in the
  table.
- §1.2: LandesmanLitt2024 line 42. Holds. §1.3: lines 41–50 (outer action, Definition 1.1.1, no
  natural action on the representation variety). Holds.
- §3.3: LandesmanLitt2024 lines 41–42. Holds. FarbMargalit2012 waived.
- §§4.2, 4.3: BCGGO2024 lines 2706–2708 (`Hom(π₁Σ, G^ℝ)` with conjugation). Holds as the locator
  of the object.
- §§5.1, 5.2: BCGGO2024 lines 466–472 and 475–481 (real forms as fixed points, Cartan involutions
  for a real form). Hold. Knapp2002 waived.
- §5.3: BohmLafuente2021 lines 52–62 (definition (1)), line 193. Hold.
- §5.4: BohmLafuente2021 lines 77–88 (Theorem 1.1), 172–176, 179–193, 417 (Lemma 5.1), 445
  (Corollary 5.5), 518 (Lemma 6.3), 562 (Corollary 6.4), 568 (Lemma 6.5), 1050 (Corollary A.2).
  All hold. RichardsonSlodowy1990 waived.
- §6.2: Sikora2012 lines 262–266. Holds.
- Also read: LandesmanLitt2024 lines 473–475; Sikora2012 lines 228, 268, 584, 823–837, 844–845;
  BateMartinRohrle2005 lines 183–187, 263–267, 355, 379–382, 510–512, 814, 861–866. All hold.

All ten cited works are in the manifest, with no local path. Nothing was fetched and no
`needs-references.toml` was written.

**Adversarial table** (sampled targets, repaired passages, headlines, targets a finding touches).

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §1.1 transport by inner `e` | general `g, φ`; `Q₈`; `ℤ²`, `diag(1, −1)` | `c_g φ c_g⁻¹ = c_{g φ(g)⁻¹} φ = φ c_{φ⁻¹(g) g⁻¹}`; `8/2 = 4`, `24/4 = 6`; `[[1,1],[0,1]] ↦ [[1,−1],[0,1]]` | correct | none |
| §1.2 quotient | `Rep(ℤ, S₃)`; `Rep(ℤ/2, GL₂(ℂ))`; `H = 1` | `3` against `6`; `3` eigenvalue multisets; `1` | correct | none |
| §1.3 action, non-descent | `ℤ²` witness; `F₂`, `ρ = id`; `Out(ℤ)` on `ℤ/3` | `(φψ)⁻¹ = [[1,−1],[−1,2]]`, row `(1, −1)`; `(ψφ)⁻¹ = [[2,−1],[−1,1]]`, row `(2, −1)`; `c_a · id = c_{a⁻¹}`; generators swapped | left action; iff both ways | none |
| §2.1 path component, index | exponential law; `ℝ`; `S² ⊔ S²` | total map `(t, f_t(x))`, inverse `(t, f_t⁻¹(x))`; `2` classes; orders `8` and `2`, index `4` | correct | none |
| §2.2 extension | `S¹`, two points; `S²`, `{N, S}`; `P = ∅`; isotopy clause | end at `p` sent to end at `q`, no extension; rotation by `π` swaps `N, S`; identity; limit set connected in `I × P`, contains `(0, p)`, so `I × {p}` | correct | none |
| §2.4 standard model | torus; `a a b b`; `nonorientable 5 0`; `a a⁻¹`; hole block | `d₂ = 0`, `H₁ = ℤ²`; `d₂ = 2a + 2b`, `H₁ = ℤ ⊕ ℤ/2`, `H₂ = 0`; `ℤ⁴ ⊕ ℤ/2`; `d₁(a) = v₁ − v₀`, `H₁ = 0`; `d₂ ∋ h_j`, `H₂ = 0` | correct | none |
| §2.5 changes of model | `e = id`; two choices `e, e'`; `diag(1, −1)` on `SL₂(ℤ)` | identity; differ by `[e'⁻¹ e]`, inner; `A⁻¹ diag(1, −1)` central would force `det = −1` | correct | none |
| §3.1–3.2 laws | change of path; `H : id ≃ f`, track `η`; push | `[δ' fγ δ̄'] = [ū (δ fγ δ̄) u]`, `u = δ ⬝ δ̄'`; `fγ ≃ η̄ γ η`, `f_η = 1`; `f_const = conj [α]` | correct | none |
| §3.3 `Ψ_x` | `S¹`; torus shear; `[0, 1]`; change of base point | `ℤ/2 ≅ Out(ℤ)`; `(1,0) ↦ (1,1)`, `(0,1) ↦ (0,1)`, matrix `[[1,0],[1,1]]`; `π₁ = 1`, `2` classes; two paths differ by an inner `e`, identity on `Out` | correct | none |
| §3.4 reflection | `z ↦ e^{2πi/g} z̄`, `g = 1` and general | arc `j ↦ 3 − j`, `t ↦ 1 − t`; `(4i, t) ∼ (4i+2, 1−t) ↦ (4j+3, 1−t) ∼ (4j+1, t)`, `j ≡ −i` | respects the gluing | none |
| §3.5 | `Rep(F₂, S₃)`; torus, `d = 3`; half twist | `(36 + 12 + 18)/6 = 11`; `M(ker ρ) = {b ≡ a} = ker(ρ ∘ M⁻¹)`; `p₁p₂ ↦ p₂ · p₂⁻¹p₁p₂` | correct | none |
| §4.2 | `Hom(ℤ, GL₁(ℝ))`; `Hom(ℤ/2, SO(2))`; open and closed | `ℝ^×`, component `ℝ_{>0}`; `{±1}`; finitely many conditions `ρ(s) ∈ G^ℝ` | correct | none |
| §4.3 | `(1,0)`, `GL₁`; `(0,3)`; `(1,1)`; `(0,0)` | `𝔾_m²`; `G²`, `ρ(p₃) = (ρ(p₁)ρ(p₂))⁻¹`; `G²`; point | correct | none |
| §5.1 | `SO(p, q)`; `Res GL_n`; `Res H` | `2` components; `dim_ℝ = 2n²`; `H(ℂ)` connected, only open subgroup | correct | none |
| §5.2 uniqueness | `GL₁`, `(𝔾_m, id)`, `(𝔾_m, inv)` | conjugation of the second: `z ↦ conj(z⁻¹)⁻¹ = z̄`; `φ₂ ∘ α = φ₁` gives `α = inv` | unique over `H` only | R02 (notation) |
| §5.2 quaternion Check | `g = [[a, −b̄],[b, ā]]` | `J ḡ = [[−b̄, −a],[ā, −b]]`, `J ḡ J⁻¹ = [[a, −b̄],[b, ā]]`; `τ² = J² g J⁻² = g` | correct | none |
| §5.2 Cartan clause | `GL_n`, `τ = conj`; `τ = (ḡᵀ)⁻¹` | `στ` fixes `U(n)`, `K = O(n)`; `σ = 1`, `H^τ = U(n)` | agrees with the supplier's `SL_n` Check | none |
| §5.2 hypothesis | `GL₁`, `z ↦ 2/z̄` | `2/conj(2/z̄) = z`, `1 ↦ 2`, fixed set `abs z² = 2` | "automorphism" needed | none |
| §5.3 Check | `u r_θ u⁻¹` | `[[c+s, −2s],[s, c−s]]`; lengths `1 + s(2c+s)`, `1 + 2s(2s−c)`; `s = −2c`, `c = 2s` give `s = −4s` | `K = {±1}` | none |
| §5.4 (headline) | `ℝ_{>0}` on `ℝ²`; on `ℝ`; `K` compact; `V = 0` | `M = {abs x = abs y}`; `M = {0}`, `α = −1`, limit `0`; `M = V`; `M = 0` | agrees with BohmLafuente2021 Theorem 1.1 | none |
| §6.1 | `diag(2, 3)`; unipotent | `Ad` eigenvalues `1, 1, 2/3, 3/2`; nontrivial unipotent | correct | none |
| §6.2 | rotation on `ℝ²`; `rad(B) ⊗ k'`; Weil restriction | irreducible over `ℝ`, two characters over `ℂ`; nilpotent ideal; `w ⊗ z ↦ (zw, z̄w)` | correct | none |
| §6.3 locator | BateMartinRohrle2005 lines 814, 183–187, 263 | adjoint criterion for `p > 2h − 2`; characteristic zero; `H⁰` reductive | locator correct | none |
| §6.5 | `F₂`, `diag(2, 1/2)`, `[[1,1],[0,1]]` | conjugate by `diag(t, t⁻¹)`: `[[1, t²],[0, 1]] → 1` | orbit not closed | none |
| §6.7 (headline) | `GL_r(ℂ)`; Borel-dense `ρ` | `G ≅ GL_r × GL_r`, `(ρ, ρ̄)`; centralizer the centre, not reductive | consistent | none |
| §7.1 (headline) | `ℤ`, `SL₂(ℝ)`; `F_ℕ`, `ℝ^×`; `Γ = 1` | unipotent class no point; `(ℝ^×)^ℕ` not locally compact; point | correct | none |
| §7.2 (headline) | `ℤ/2`, `𝔾_m`, `𝔽₂`; `C₂` on `𝔸²` over `𝔽₂`; `F₂`, `SL₂` | `Spec 𝔽₂[t]/((t−1)²)`; `𝔽₂[x + y, xy] → 𝔽₂[x²] ≠ 𝔽₂[x]`; `ℂ³`, owner elsewhere | correct | R01 |
| Layer 7 Example | Vieta move | `(xy − z)² − xy(xy − z) = z² − xyz` | invariant | R01 |
| gap route | `H ⊆ N_G(R_u(H⁰)) ⊆ P`, Levi `L ⊇ H` | `R_u(H⁰) ⊆ L ∩ R_u(P) = 1` | sound | none |

Rows of round 7 that carry computed values and whose text no repair touched (§§2.3, 3.4's sign
argument, 4.1, 6.4, 6.6, 7.3, 7.4, 7.5) were relied on.

**Shape.** Summary, Scope, Conventions, contracts, build paragraph, seven layers each ending with
Examples and Dependencies, consumers, references. Every definition (§§1.2, 2.1, 3.1, 4.1, 5.1, 6.1,
7.1) has an API list and at least three Checks. `plan.json` has 32 targets, each with three or
more tests; its layer titles equal the README's. The layers are named by their mathematics; Layers
1–3 and 4–6 are independent and Layer 7 uses both.

**Headline theorems, for the package stage.** §7.1 (topology of `𝒳(Γ, G^ℝ)`), §7.2 (complex
comparison and universal Hausdorff quotient), §6.7 (six characterizations), §5.4 (real
Kempf–Ness), §§1.3 and 3.5 (non-descent), §7.4 (the actions). At the pins §5.4 and §1.3 are
statable; the others lack a carrier and belong in the module docstring. Padding probe and `#check`
comparison: not applicable, no Lean file.

**Duplication audit.** By object, over main and the open heads (`roadmaps grep` for Kempf–Ness,
minimal vectors, character varieties, representation schemes, reductive representations, outer
actions, `ℝ`-forms).

- `F₂`, `SL₂` trace coordinates: NonabelianLevelStructures §§5.1–5.2 and a pinned Tau Ceti
  identity; R01.
- Real forms and Cartan involutions: RealSemisimpleLieGroups §2.5, cited; uniqueness and converse
  have no other owner.
- Representation schemes, their quotients, the outer action, MCG-finiteness: kept variants of
  MappingClassGroupsAndCanonicalRepresentations §§1.4, 0.2, 2.1, each with its clause in the Scope.
- Reductive quotients of nonintegral schemes: LanglandsParameterStacks §2.2, cited.
- Kempf–Ness: only TensorProductCombinatorics on main, another statement. `𝒳(Γ, G^ℝ)`, reductive
  representations into real groups, real reductive data: no other owner.
- Not a second copy: main has no `SurfaceGroupCharacterVarieties` folder.

Overlap check: read MappingClassGroupsAndCanonicalRepresentations, TeichmullerGeometry,
MordellLawrenceVenkatesh, SurfaceTopology, GroupActionsOnRiemannSurfaces, GeometricTopology (the
third list is empty), and also RealSemisimpleLieGroups and NonabelianLevelStructures; `PMod`, the
presentation and the pure Birman sequence are MappingClassGroupsAndCanonicalRepresentations';
`Out(Γ)`, the classification by models and `dehn_nielsen_baer` are TeichmullerGeometry's;
`Mod(S)`, `Push` and the Birman sequence are MordellLawrenceVenkatesh's; `Mod(F)` of a compact
surface is GeometricTopology's; the real-form bridge is RealSemisimpleLieGroups'; the integral
`F₂`, `SL₂` character scheme is NonabelianLevelStructures' (R01); SurfaceTopology (never cited)
shares no object this roadmap owns.

**Copyright.** Wording compared at every locator read above and in six further passages (Summary,
§5.2 statement, §5.4 statement, §6.1 definition, §6.4 sketch, §7.2 statement). The longest shared
runs are what the mathematics forces, under a dozen words. Arrangement: BCGGO2024 has the largest
share; its §2.3 is cited in Layer 5 and its §8.1 in Layers 4, 6 and 7, so no run of layers maps
onto its sections. No table, figure or list of examples is taken over; two of BohmLafuente2021's
examples are Checks in the roadmap's own form, with locators.

Source independence: 30 passages compared with 5 sources, none shared; largest share BCGGO2024,
12 of 63 locators; contents compared with BCGGO2024: independent. FarbMargalit2012 (11 locators) is
waived and was not read.

## Not verifiable

- FarbMargalit2012, Knapp2002, RichardsonSlodowy1990 (waived), Richardson1988, Goldman1984
  (uncertified): cited by locator only; the texts were not read.
- Whether MordellLawrenceVenkatesh §5.1's atlas is a `ChartedSpace` on the half-plane model in
  TeichmullerGeometry's sense: both are prose at their heads; the design assumes it in its
  contract.
- How MappingClassGroupsAndCanonicalRepresentations §0.2 defines the permutation of the punctures:
  that section does not say; the design records the reading it assumes.
- Elaboration: not available in this lane, and no Lean file exists at the design stage.

## Source issues

- **Misprint** in Sikora2012 at §11, line 836, printed p. 18: the source refers to a Proposition 30 for the closed-orbit characterization; it should be Theorem 30 (line 572); affects nothing.
- **Error** in BCGGO2024 at §2.3, lines 471–472, printed p. 10: the source says the real form `SO_{p,q}` has two components whenever `p` or `q` is nonzero; it should be whenever both `p` and `q` are nonzero; affects nothing.
- **Misprint** in BohmLafuente2021 at proof of Lemma 6.3, line 520, printed p. 11: the source calls the group `T = exp(𝔱)` a maximal abelian subalgebra; it should be `𝔱 ⊂ 𝔭` a maximal abelian subalgebra and `T = exp(𝔱)`; affects nothing.

## For the human reviewers

- **Not tested.** FarbMargalit2012 carries 11 of the 63 locators (second to BCGGO2024's 12) and is waived: the wording of Layers 1–3 was not compared with its text.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "aa2b6a1898545f08cacae4cf2bb1bd17bff6942e", "job": "REV-DESIGN-SurfaceGroupCharacterVarieties~8", "model": "fable", "worker": "chris-x83"} -->
