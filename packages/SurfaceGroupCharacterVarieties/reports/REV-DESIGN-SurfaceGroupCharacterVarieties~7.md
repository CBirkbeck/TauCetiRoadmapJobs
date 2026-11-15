<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13837#issuecomment-6896717732 -->
Review (claude) of 9ab3ffe

Verdict: needs_changes

**For the human reviewers:** this review raises 1 question that a human decides (the scope of the roadmap, or a licence). It is in the section of that name at the end and does not change the verdict.

1. **F01** (P2) the real-form bridge of §5.2 is also owned by an open roadmap that names this one as consumer

   Location: `packages/SurfaceGroupCharacterVarieties/design/README.md`, §5.2 ("There is a connected
   reductive `ℝ`-group `𝐆_τ` with an isomorphism `(𝐆_τ)_ℂ ≅ H` under which complex conjugation is
   `τ`"); Scope, Layer 5 bullet ("the real-form bridge from antiholomorphic involutions"); Summary;
   `design/plan.json`, target 5.2.

   Claim: this roadmap owns the identification of an antiholomorphic involution `τ` of `H(ℂ)` with
   the conjugation of an `ℝ`-form, and the comparison of Cartan involutions for `τ` with
   ArithmeticLocallySymmetricSpaces §ALS.0.1.

   Witness: `TauCetiRoadmap/RealSemisimpleLieGroups/README.md` at the head of its open pull request
   (a new roadmap folder), §2.5, **Real forms of complex reductive groups**: "`τ` is the complex
   conjugation of a real form `𝐇₀` of `𝐇`: a connected reductive `ℝ`-group with `𝐇₀ ⊗_ℝ ℂ = 𝐇` and
   `𝐇₀(ℝ) = H^τ`". Its Scope ends: character varieties of surface groups "consume §2.5 and Layer 0".
   Its route is the one of §5.2's sketch.

   What each text states, on the same hypotheses (`H` connected complex reductive, `τ` an
   antiholomorphic involutive automorphism):

   | Statement | §5.2 here | RealSemisimpleLieGroups §2.5 |
   |---|---|---|
   | an `ℝ`-form with conjugation `τ` and real points `H(ℂ)^τ` | yes | yes |
   | uniqueness of the `ℝ`-form up to unique isomorphism | yes | no |
   | a Cartan involution for `τ` (commuting, product compact) is an ALS.0.1 Cartan involution of the `ℝ`-form | yes | yes, with existence and conjugacy under `(H^τ)°` |
   | `K = H^τ ∩ H^σ` maximal compact | yes | yes, with `K × 𝔭 → H^τ` a diffeomorphism |

   Repair (the one that closes the overlap inside this package): cite the open owner and keep only
   what it lacks.

   - §5.2: replace the bridge target by a citation of RealSemisimpleLieGroups §2.5 for the existence
     of `𝐆_τ` with `𝐆_τ(ℝ) = H(ℂ)^τ`, for the identification of the Cartan involutions for `τ` with
     those of ArithmeticLocallySymmetricSpaces §ALS.0.1, and for `K` maximal compact. Keep as this
     roadmap's own target the uniqueness clause: two `ℝ`-forms of `H` with the same conjugation `τ`
     are isomorphic by a unique isomorphism over the identity of `H`, because `τ` determines the
     `ℝ`-structure `{f : f = conj ∘ f ∘ τ}` of `O(H)`. Keep the converse sentence. Keep the three
     Checks, as Checks of the consumed statement and of uniqueness.
   - Write "antiholomorphic involutive automorphism" where the text says "antiholomorphic
     involution" (Summary, Scope, §5.2), as §2.5 does. On `H = GL₁` the map `z ↦ 2/z̄` is an
     antiholomorphic involution of the manifold `ℂ^×` with `τ(1) = 2`, so no homomorphism; its fixed
     set `|z|² = 2` is no subgroup.
   - Scope: move the bridge from "owns" to "leaves to named owners". Add one kept-variant clause:
     §5.3's polar decompositions are stated for every open subgroup `G^ℝ ⊆ 𝐆(ℝ)` and for
     `G(ℂ) = U exp(i𝔲)`, where RealSemisimpleLieGroups §2.5 treats the full fixed group `H^τ`.
   - Add the contract subsection *From TauCetiRoadmap.RealSemisimpleLieGroups* (§2.5, what is
     assumed). Put it in §5.2's *Needs:*, in Layer 5's Dependencies and in `plan.json` (target 5.2
     and `suppliers`). Update the Summary and "How to read the build". Drop from the contract, the
     *Needs:* lines and `plan.json` the items that only the deleted sketch used: ReductiveGroups
     Layers 8 and 9 and the three LieGroups Layer 7 paragraphs.

   Tested: a scratch copy of the README with `RealSemisimpleLieGroups §2.5` in §5.2's *Needs:* passes
   the dependency check ("checked as if placed after MappingClassGroupsAndCanonicalRepresentations …
   0 problem(s)"), and `roadmaps resolve` finds the citation. On the design's own Checks both texts
   give the same values: `GL₁`, `τ(z) = z̄` has fixed group `ℝ^×` with two components and `K = {±1}`;
   `GL₂`, `τ(g) = J ḡ J⁻¹` has fixed group `{[[a, −b̄],[b, ā]]} = ℍ^×`.

   The other settlement keeps §5.2 here and makes RealSemisimpleLieGroups cite it. That needs a change
   to that pull request and cannot be completed in this package.

2. **F02** (P3) the manifest's `cited_for` still follows the numbering before the last repair

   Location: `packages/SurfaceGroupCharacterVarieties/sources.toml`, entries `FarbMargalit2012`
   ("2.2, 2.6: punctures versus marked points", "2.5: Birman exact sequence") and
   `LandesmanLitt2024` ("2.5: pure Birman sequence as used downstream"; locator "lines 503–515
   (Lemma 2.0.1)").

   Witness: the README has no §2.6; its §2.5 is "Changes of model"; "503" occurs `0` times in the
   README; the pure Birman sequence is now cited to MappingClassGroupsAndCanonicalRepresentations §0.3.

   Repair: in `FarbMargalit2012` write "2.2, 2.5: punctures versus marked points" and delete the
   Birman item. In `LandesmanLitt2024` delete the "2.5" item and the lines 503–515 from the locator.
   `plan.json` already agrees with the README (32 targets, every `target:` prerequisite resolves).

3. **F03** (P3) Layer 2's title names an object the layer no longer owns

   Location: README line 619, "## Layer 2: Punctured surfaces, marked points and the pure mapping
   class group"; `plan.json`, layer 2 `title`.

   Witness: Scope, "leaves to named owners": "the pure mapping class group `PMod(g, b, p)` …:
   MappingClassGroupsAndCanonicalRepresentations §§0.1–0.3". The layer's targets are §§2.1–2.5:
   isotopy classes, punctures, the permutation homomorphism, the standard model, changes of model.

   Repair: "Layer 2: Isotopy classes, punctures and marked points, and the standard model", in both
   files.

4. **F04** (P3) §5.3's non-example attributes its two equations to the wrong condition

   Location: README §5.3, third Check ("orthogonality of the columns forces `s(2c + s) = 0` and
   `s(2s − c) = 0`, hence `s = 0`").

   Witness: for `g = [[c + s, −2s],[s, c − s]]` the squared column lengths are `1 + s(2c + s)` and
   `1 + 2s(2s − c)`; the inner product of the columns is `−s(c + 3s)`. At `c = −3s`, `s = 1/√10` the
   columns are orthogonal and the first has squared length `1/2`.

   Repair: "the two columns having length one forces `s(2c + s) = 0` and `s(2s − c) = 0`, hence
   `s = 0`". With `s ≠ 0` these give `s = −2c` and `c = 2s`, so `s = −4s`; the conclusion
   `K = {±1}` stands. Mirror the wording in `plan.json` target 5.3 if its test repeats it.

5. **F05** (P3) §6.3's locators state the neighbouring equivalences, not the adjoint one

   Location: README §6.3 ("`Ad ∘ ρ` is semisimple on `𝔤` if and only if `Z⁰` is reductive
   (BateMartinRohrle2005 line 263; Sikora2012 line 228, Proposition 8 …)").

   Witness: BateMartinRohrle2005 lines 263–264 relate `G`-complete reducibility to reductivity of
   `H⁰`; Sikora2012 line 228 relates complete reducibility to a linearly reductive closure. Neither
   mentions the adjoint module. BateMartinRohrle2005 line 814, Corollary 3.42, does.

   Repair: cite "(BateMartinRohrle2005 Corollary 3.42, line 814, for the adjoint criterion, stated
   there for `p > 2h − 2`; line 263 for the characteristic-zero equivalence with reductivity of
   `Z⁰`; Sikora2012 line 228, Proposition 8)". Add the locator to the manifest entry and to
   `plan.json` target 6.3. The statement and its sketch need no change.

6. **F06** (P3) ClassifyingSpaces Stage 3 item 15 is in the contract but in no *Needs:* line

   Location: README, *From TauCetiRoadmap.ClassifyingSpaces* ("with Stage 3 items 11 and 15"); §3.4
   *Needs:* ("ClassifyingSpaces Stage 3 item 11; ClassifyingSpaces Stage 4 item 17"); `plan.json`
   `suppliers` (`Stage 3 item 11`, `Stage 4 item 17`).

   Witness: §3.4's sketch uses the naturality of the homology identification under automorphisms of
   `π₁`, which is item 15 (homotopy functoriality) with item 11.

   Repair: add "ClassifyingSpaces Stage 3 item 15" to §3.4's *Needs:*, to target 3.4's prerequisites
   and to the `suppliers` entry.

Six findings: one P2 and five P3. The four round-6 findings are repaired. The mathematics of the
design held on everything computed below. The blocking finding is an ownership overlap that the
earlier rounds did not compare: the open roadmap RealSemisimpleLieGroups states the real-form
bridge of §5.2 and names character varieties of surface groups as its consumer.

Heads read this round: MappingClassGroupsAndCanonicalRepresentations, LanglandsParameterStacks,
MordellLawrenceVenkatesh, TeichmullerGeometry, ArithmeticGaloisRepresentations,
GroupActionsOnRiemannSurfaces, ComplexComparisonPartII, ArithmeticLocallySymmetricSpaces,
InverseGaloisAndArithmeticFundamentalGroups and RealSemisimpleLieGroups at the heads of their open
pull requests; ReductiveGroups, ReductiveGroupsPartII, FreeGroupsAndLimitGroups, AlgebraicTopology,
ClassifyingSpaces, GeometricTopology, RepresentationTheory/LieGroups,
RepresentationTheory/CompactGroups, SymplecticGeometry/HamiltonianReduction, BelyiMaps and
TensorProductCombinatorics on main. There is no `Suggested.lean` at the design stage, and this lane
does not elaborate.

## Verified sound

**Round-6 findings** (4), each quoted from the repaired text.

- F01, repaired. §2.3: "Prove that `σ` is the permutation action on the punctures that defines
  MappingClassGroupsAndCanonicalRepresentations §0.2's `PMod(g, 0, n)`"; §2.4 ends with the
  citation of §0.1 "with `b = 0`"; the pure Birman target is gone and Layer 2 Examples cite §0.3;
  the consumer bullet is gone. That roadmap's §§0.1–0.3 say what the contract states (read at its
  head). R03 is the one residue.
- F02, repaired. §7.2: "For a field `k`, a connected reductive group `G` over `k` … define
  `Hom(Γ, G)//G := Spec O(Hom(Γ, G))^G`"; "For `k` of characteristic zero, prove that the
  restriction `O(G^S)^G → O(Hom(Γ, G))^G` … is surjective". LanglandsParameterStacks §2.2 extends
  finite generation, closed images, separation and the unique closed orbit "to arbitrary affine
  schemes of finite type over a field".
- F03, repaired. §2.1: "For a connected oriented surface `X`", with the `S² ⊔ S²` Check.
- F04, repaired. §7.1: "Goldman1984, §1, for the topology of `Hom(π, G)/G` for a surface group".

Repaired patterns searched in the rest of the design. An object also owned by an open roadmap:
found once more, R01. A deletion that leaves stale references: R02, R03. No other missing
connectedness hypothesis; every reference key occurs in a layer.

**Maintainer notes** (13). None gives a new finding. What refutes each in the current text:

- 1: the contract's "Used:" clause derives ambient isotopy from §2.1's manifold bullet.
- 2: Scope and contract attribute to §5.9 the action on finite coverings; the action on classes of
  homomorphisms is §3.5's own definition.
- 3: Conventions, "Notation shared with suppliers", separates `Ψ` and `Mod^±`.
- 4: contract and `plan.json` list the same eleven sections of MordellLawrenceVenkatesh, §5.22
  included; the Scope's longer list is the list of deferrals.
- 5: `Mod_{1,0} ≅ SL₂(ℤ)` is cited to TeichmullerGeometry §5.4a.
- 6: the contract states §5.4 in its connected-sum form; no polygon is cited to it.
- 7: §5.23 is no longer in the contract or in `plan.json`.
- 8: genus and orientability come from §2.4's own target.
- 9: §4.3 is cited for the attaching word and its commutator only; the reflection is built in §3.4.
- 10: no consumer bullet names GroupActionsOnRiemannSurfaces.
- 11: §2.1 states the variant clause, the comparison and GeometricTopology Layer 1.7.2 as owner.
- 12: §3.4 names `Out⁺(Π)`.
- 13: §§3.2–3.3 cite MordellLawrenceVenkatesh §5.19 for `Push`.

**Principles.** No copied passage, algorithm, `set_option`, sorry'd data or Lean file. No
never-cite roadmap is cited. Greps for pull-request numbers, round labels, machine paths, LaTeX
delimiters and "optional/deferred/removed" find nothing. No statement is narrowed below its
sources. The one re-planned object is R01.

**Supplier order.** Gate output on the design as it is:

```text
candidate: SurfaceGroupCharacterVarieties is not in the merge order yet; checked as if placed after MappingClassGroupsAndCanonicalRepresentations (the intake inserts it when its design is accepted)
depcheck: 245 roadmaps, 2238 edges, 0 problem(s)
```

No UPWARD or CYCLE line. `roadmaps resolve` lists four Lean names "found nowhere"
(`StandardSurface.eulerChar_model`, `StandardSurface.isSurface_model`,
`StandardSurface.homeomorph_unique`, `Surface.IsOrientable`): each is a name of
TeichmullerGeometry §0.0f, attributed to it in the README and present at that roadmap's head. The
overlaps file lists no pull request changing this roadmap, no dropped id and no id only a revision
defines.

**Supplier citations resolved this round** (every one in the contract).

- MappingClassGroupsAndCanonicalRepresentations §§0.1, 0.2, 0.3, and §§1.4, 2.1 for the Scope's
  three special-case clauses.
- LanglandsParameterStacks §2.2.
- MordellLawrenceVenkatesh §§5.1, 5.4, 5.5, 5.6, 5.9, 5.15, 5.16, 5.17, 5.19, 5.20, 5.22. §5.9
  gives `Sym(3)` for the three-punctured sphere and the covering action `[p] ↦ [f ∘ p]`; §5.19
  gives `γ ↦ α * γ * α⁻¹`.
- TeichmullerGeometry §§0.0b, 0.0e, 0.0f, 0.0h, 4.2, 4.3, 4.4, 4.5, 5.4 (`dehn_nielsen_baer`, value
  `FundamentalGroup.mapOfEq f`, `Mod⁺(Σ) ≃ Out⁺(Π)`), 5.4a, 6.1. Its Conventions give the
  uniformizing holonomy Euler number `2 − 2g`, as §7.4's Check has it.
- ArithmeticGaloisRepresentations §1.7 (**Semisimplicity over a perfect field**) and §1.11 (both
  named paragraphs).
- FreeGroupsAndLimitGroups §§6.1 (`S⁺(g, m)`, commutator `x⁻¹ y⁻¹ x y`), 6.2.
- ReductiveGroups Layers 0, 1, 2, 3A (3A.2, 3A.4), 5, 6, 7, 8, 9; ReductiveGroupsPartII §§RG2.0.1,
  RG2.0a.2; ComplexComparisonPartII §C-1.1; ArithmeticLocallySymmetricSpaces §§ALS.F.1, ALS.0.1.
- LieGroups Layer 7's three paragraphs and Layer 9 with **Restricted roots and KAK**
  (`kakDecomposition`); CompactGroups Layer 5; HamiltonianReduction R5; GeometricTopology Layer
  1.7.2; InverseGaloisAndArithmeticFundamentalGroups §IG.3.2; GroupActionsOnRiemannSurfaces §3.4.
- AlgebraicTopology "Stage 4 items 2–3": main now numbers these §§4.2–4.3 and keeps the mapping
  ("Stage 4 items 1–8 are §§4.1–4.8"), so the citation stands. ClassifyingSpaces Stage 3 items 11,
  15 and Stage 4 item 17.

**Declared gaps.** `gcr-reductive-identity-component` and `borel-tits`: one sentence each with its
hypotheses, the same slug in `plan.json` and in the supplier's contract subsection, supplier named.
A grep of ReductiveGroups, ReductiveGroupsPartII, ArithmeticGaloisRepresentations and
LanglandsParameterStacks finds neither statement, so neither gap asks for what is provided. No
finding.

**Library declarations opened at the pins.**

- Tau Ceti. `AmbientIsotopy` (`Topology/Homotopy/Isotopy/Basic.lean:163`), `finalHomeomorph`
  (:234), `trans` (:328), `symm` (:368), `Isotopic` (:114); `conj`, `finalHomeomorph_conj`
  (`Topology/Homotopy/AmbientIsotopyConj.lean:110, 131`); `AmbientIsotopic` and `.isotopic`
  (`Topology/Homotopy/AmbientIsotopic/Basic.lean:58, 94`); `isotopic_iff_ambientIsotopic`
  (`Topology/Homotopy/Isotopy/Compact.lean:123`, `f₀ : X ≃ₜ Y`);
  `Continuous.isOpenEmbedding_of_injective`
  (`AlgebraicTopology/Singular/InvarianceOfDomain.lean:201`, hypothesis
  `finrank ℝ E = finrank ℝ F`); `isPreconnected_iInter_of_directed` (`Topology/Continuum.lean:69`,
  `[T2Space X] [Nonempty ι]`); `monodromyEquivalence` and `basepointMulAction`
  (`AlgebraicTopology/UniversalCover/Classification/MonodromyEquivalence.lean:205, 93`);
  `PointTopology.topology` and `instTopologicalSpaceWithConv`
  (`Topology/Algebra/PointTopology/Basic.lean:83, 110`); `IsLinearlyReductive`
  (`Algebra/Coalgebra/Comodule/LinearlyReductive.lean:249`);
  `Hom.fixedMap_surjective_of_isLinearlyReductive` (`…/LinearlyReductive/Fixed.lean:184`);
  `IsUnitary.isSemisimpleRepresentation`
  (`RepresentationTheory/Continuous/InvariantComplement.lean:190`).
- Mathlib. `FundamentalGroup.mul_def` (`AlgebraicTopology/FundamentalGroupoid/FundamentalGroup.lean:44`,
  `p * q` is `q` then `p`), `fundamentalGroupMulEquivOfPath` (:48), `map` (:79), `mapOfEq` (:85);
  `homotopicMapsNatIso` (`…/InducedMaps.lean:67`); `QuotientGroup.congr`
  (`GroupTheory/QuotientGroup/Defs.lean:397`); `quotientKerEquivRange`
  (`GroupTheory/QuotientGroup/Basic.lean`); `Subgroup.fg_of_index_ne_zero`
  (`GroupTheory/Schreier.lean:166`); `groupHomology`
  (`RepresentationTheory/Homological/GroupHomology/Basic.lean:226`), `groupHomology.map`
  (`…/Functoriality.lean:157`); `Representation.IsSemisimpleRepresentation`
  (`RepresentationTheory/Semisimple.lean:34`); `t2Space_quotient_mulAction_of_properSMul`
  (`Topology/Algebra/ProperAction/Basic.lean`); `TopologicalSpace.Opens.instChartedSpace`
  (`Geometry/Manifold/HasGroupoid.lean:284`).

**Sources, seeded sample** (15 targets). The author flags no locator as unverified.

- §1.1, §2.1, §2.2, §2.4: FarbMargalit2012 only (waived, not read); the mathematics is in the
  table.
- §1.2: LandesmanLitt2024 line 42 (conjugacy classes of representations). Holds.
- §1.3: LandesmanLitt2024 lines 41–50 (outer action, Definition 1.1.1, no natural action on the
  representation variety). Holds.
- §§4.2, 4.3: BCGGO2024 lines 2706–2708 (`Hom(π₁Σ, G^ℝ)` and conjugation). Holds as the locator of
  the object; the topological statements are the roadmap's own.
- §5.4: BohmLafuente2021 lines 52–62 (definition (1)), 77–88 (Theorem 1.1), 172–176 and 179–193
  (examples), 417 (Lemma 5.1), 445 (Corollary 5.5), 518 (Lemma 6.3), 562 (Corollary 6.4), 568
  (Lemma 6.5), 1050 (Corollary A.2). All hold. RichardsonSlodowy1990 waived.
- §6.3: BateMartinRohrle2005 line 263; Sikora2012 line 228. Present, but see R05.
- §6.4: BateMartinRohrle2005 lines 263–264, 267 (Lemma 2.6), 861–866 (Theorem 3.46 and its
  reduction to topological generators); Sikora2012 line 228. Hold.
- §7.1: BCGGO2024 lines 2712–2713 (Definition 8.1); BohmLafuente2021 Theorem 1.1. Hold.
  Goldman1984 uncertified, RichardsonSlodowy1990 waived.
- §7.2: Sikora2012 lines 823–837 (quotient, universal property for affine targets, unique closed
  orbit), 844–845 (Example 48). Hold.
- §7.4: BCGGO2024 lines 2712–2726 (Example 8.2: two components, either orientation);
  LandesmanLitt2024 lines 47–50. Hold.
- §7.5: Sikora2012 lines 844–845. Holds.
- Also read: LandesmanLitt2024 lines 473–475; BCGGO2024 lines 466–481; Sikora2012 lines 262–268,
  363–364, 572–586; BateMartinRohrle2005 lines 355, 379–382, 510–512, 814. All hold.

All ten cited works are in the manifest, with no local path. Nothing was fetched and no
`needs-references.toml` was written.

**Adversarial table** (sampled targets, headlines, repaired passages, targets a finding touches).

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §1.1 transport by an inner `e` | general `g`, `φ`; `Q₈`; `ℤ²`, `diag(1, −1)` | `c_g φ c_g⁻¹ = φ ∘ c_{φ⁻¹(g) g⁻¹}`; `8/2 = 4`, `24/4 = 6`; `[[1,1],[0,1]] ↦ [[1,−1],[0,1]]` | correct | none |
| §1.2 quotient | `Rep(ℤ, S₃)`; `Rep(ℤ/2, GL₂(ℂ))`; target `1` | `3` against `6`; `3` eigenvalue multisets; `1` | correct | none |
| §1.3 action and non-descent | `ℤ²` witness; `F₂`, `ρ = id`; `Out(ℤ)` on `ℤ/3` | rows `(1, −1)` and `(2, −1)`; `c_a · id = c_a⁻¹ ≠ id`; the two generators swapped | left action; iff both ways | none |
| §2.1 path component, index | exponential law; `S²`; `S² ⊔ S²` | `(t, x) ↦ (t, f_t(x))` with inverse `(t, f_t⁻¹(x))`; index `2`; orders `8` and `2`, index `4` | correct with "connected" | none |
| §2.2 extension | `[0,1]`, `{0}`; `S¹`, two points; `P = ∅`; isotopy clause | extends; no extension, punctured neighbourhoods disconnected; identity; limit set a connected subset of `I × P` meeting every slice, `I × {q}` | correct | none |
| §2.3 `σ` | `n = 0, 1`; `(0, 2)`; `(0, 3)` | `1 = 0! = 1!`; `2 = 2!`; `6 = 3!`, as the supplier's `p!` with `b = 0` | correct | none |
| §2.4 standard model | torus; Klein bottle; `nonorientable 5 0`; sphere `a a⁻¹`; hole block | `H₂ = ℤ`, `H₁ = ℤ²`; `d₂ = 2a + 2b`, `H₂ = 0`; `H₁ = ℤ⁴ ⊕ ℤ/2`, `H₂ = 0`; `d₁(a) = v₁ − v₀`, `H₁ = 0`; free side once, `H₂ = 0` | correct | none |
| Conventions, generator inversion | `(1, 1)` | `a⁻¹b⁻¹ab p₁ ↦ aba⁻¹b⁻¹ c₁`, the supplier's relator | correct | none |
| §3.1 laws | homomorphism; change of path; composition; `id_σ` | `[δ fβ δ̄ δ fα δ̄]`; `conj[δ ⬝ δ̄'] ∘ f_δ`; `[δ fε fgγ fε̄ δ̄]`; `conj[σ]⁻¹` | correct | none |
| §3.2 lemma | `(id, f, const)`; push | `f_η = 1`, `f_δ = conj[η ⬝ δ̄]`; `f_const = conj[α]` | correct | none |
| §3.4 reflection | `z ↦ e^{2πi/g} z̄` on arc `(j, t)` | `(3 − j, 1 − t)`; `(4i, t) ∼ (4i+2, 1−t) ↦ (4j+3, 1−t) ∼ (4j+1, t)`, `j ≡ −i` | respects the gluing | none |
| §3.5 lift, covering | `(0,3)`, `S₃`; torus, `d = 3` | `(36 + 12 + 18)/6 = 11`; `M(ker ρ) = {b ≡ a} = ker(ρ ∘ M⁻¹)`; `Push(a)·ρ : b ↦ (1 3)` | correct | none |
| Layer 3 example | half twist on `F₂` | `p₁p₂ ↦ p₂ · p₂⁻¹p₁p₂ = p₁p₂`, `p₃` fixed | correct | none |
| §4.1, §4.3 | `ℤ`; trivial; `ℤ/2`, `𝔾_m`, `𝔽₂`; `(1,1)`; `(1,0)`, `GL₁` | `G`; `Spec k`; `𝔽₂[t]/((t−1)²)`; `G²`; `𝔾_m²` | correct | none |
| §5.2 bridge | `GL₂`, `τ = J ḡ J⁻¹`; `GL₁`, `z ↦ 2/z̄` | `τ² = (−1)g(−1) = g`, fixed points `[[a, −b̄],[b, ā]]`; `τ(1) = 2`, fixed set `|z|² = 2` | correct for automorphisms; duplicated | R01 |
| §5.3 Check | `u r_θ u⁻¹` | `[[c+s, −2s],[s, c−s]]`; lengths `1 + s(2c+s)`, `1 + 2s(2s−c)`; inner product `−s(c+3s)`; `e₁ ↦ (1,1)` | non-example true, wording wrong | R04 |
| §5.3 open subgroups | `θ = (gᵀ)⁻¹` on `π₀(𝐆(ℝ))` | `θ` fixes `K`, which meets every component | `G^ℝ` transpose-stable | none |
| §5.4 (headline) | `ℝ_{>0}` on `ℝ²`; `ℝ_{>0}` on `ℝ`; unipotent orbit | `M = {abs x = abs y}`; `M = {0}`, limit `0`; `2 + t⁴ → 2` | agrees with BohmLafuente2021 Theorem 1.1 | none |
| §6.2 | `rad(B) ⊗ k'`; Weil restriction | nilpotent ideal; `w ⊗ z ↦ (zw, z̄w)` | correct | none |
| §6.3 | torus; unipotent of `SL₂`; `N(T)` | `Ad` trivial; nontrivial unipotent; `Z⁰ = T` | correct; locator | R05 |
| §6.4 | Borel of `SL₂`; `N(T)` | centralizer `±1`, `R_u ≠ 1`; no fixed line | correct | none |
| §6.6 sketch | `τ(g₀) = u e^Z g₀` | `τZ = −Ad(u)Z`, `τ(e^{Z/2} g₀) = u e^{Z/2} g₀`; `Re⟨(X + iY)w, w⟩ = ⟨Xw, w⟩` | correct | none |
| §6.7 (headline) | `π₁(Σ₂)`, one unipotent; trivial `Γ`, torus | relator `1`, all six fail; irreducible, centralizer `G` | consistent | none |
| §7.1 (headline) | inverse continuity; `F_ℕ`, `ℝ^×`; `ℤ`, `SL₂(ℝ)` | `f(k'_n v_n) = f(k_n⁻¹ w_n)` tends to `0` and to `1`; `(ℝ^×)^ℕ` not locally compact; unipotent class no point | correct | none |
| §7.2 (headline), any field | `ℤ/2`, `𝔾_m`, `𝔽₂`; `ℤ`, `GL_n`; `Γ = 1` | `Hom//G = Hom = Spec 𝔽₂[t]/((t−1)²)`; `𝔸^{n−1} × 𝔾_m`; `Spec k` | covered | none |
| §7.2 closed immersion | `𝔾_m` over `𝔽₂`; `C₂` on `𝔸²` over `𝔽₂` | `𝔽₂[t^{±1}] ↠ 𝔽₂[t]/((t−1)²)`; `x + y ↦ 2x = 0`, `xy ↦ x²`, image `𝔽₂[x²] ≠ 𝔽₂[x]` | linear reductivity is the input | none |
| §7.2 same image | `ℤ`, `SL₂(ℂ)`: `U`, `1` | `tr = 2` both; `[[1,t²],[0,1]] → 1` | both directions | none |
| §7.3 | saturated closed subset; finite index | image closed under the open quotient map, restriction open; same `Z⁰` | correct | none |
| §7.4 | `ℤ`, `SO(2)`; Fuchsian locus | inversion, fixed points `±1`; Euler numbers `2 − 2g` and `2g − 2` | correct | none |
| §7.5 | `ℤ`, `PSL₂(ℝ)`; `F₂`, `SL₂(ℂ)` | no parabolic class; `ℂ³`, `x² + y² + z² − xyz − 2` | correct | none |

**Shape.** Summary, Scope, Conventions, contracts, build paragraph, seven layers each ending with
Examples and Dependencies, consumers, references. Every definition (§§1.2, 2.1, 3.1, 4.1, 5.1, 6.1,
7.1) has an API list and at least three Checks. `plan.json` has 32 targets, each with three or more
tests. The layers are named by their mathematics, apart from R03. Layers 1–3 and 4–6 are
independent and Layer 7 uses both; no source's chapter order is followed.

**Headline theorems, for the package stage.** §7.1 (topology of `𝒳(Γ, G^ℝ)`), §7.2 (complex
comparison), §6.7 (six characterizations), §5.4 (real Kempf–Ness), §§1.3 and 3.5 (non-descent),
§7.4 (the actions). At the pins §5.4 and §1.3 are statable; the others lack a carrier and belong in
the module docstring. Padding probe and `#check` comparison: not applicable, no Lean file.

**Duplication audit.** By object, over main and the open heads.

- Real forms and Cartan involutions: R01.
- Representation schemes and their quotients, the outer action, MCG-finiteness: kept variants of
  MappingClassGroupsAndCanonicalRepresentations §§1.4, 0.2, 2.1, each with its clause in the Scope.
- Reductive quotients of nonintegral schemes: LanglandsParameterStacks §2.2, cited.
- Kempf–Ness: TensorProductCombinatorics §7.3 on main is the invariant-to-moment-zero direction
  for projective flag products, another statement. No other owner of the real theorem.
- Continuous outer automorphisms of profinite groups (BelyiMaps Layer 12.7): another carrier,
  compared by TeichmullerGeometry §4.2.
- `𝒳(Γ, G^ℝ)`, reductive representations, real reductive data: no other owner found.

Overlap check: read MappingClassGroupsAndCanonicalRepresentations, TeichmullerGeometry,
MordellLawrenceVenkatesh, GroupActionsOnRiemannSurfaces, GeometricTopology, RealSemisimpleLieGroups;
the real-form bridge is shared with RealSemisimpleLieGroups, owner that roadmap after R01; `PMod`,
the presentation and the pure Birman sequence are MappingClassGroupsAndCanonicalRepresentations';
`Out(Γ)` is TeichmullerGeometry's; `Mod(S)`, `Push` and the Birman sequence are
MordellLawrenceVenkatesh's; `Mod(F)` of a compact surface is GeometricTopology's. SurfaceTopology is
on the never-cite list and was not compared.

**Copyright.** Wording compared at every locator above and in six further passages (Summary, §5.2
statement, §5.4 statement, §6.1 definition, §6.4 sketch, §7.2 statement). The longest shared runs
are what the mathematics forces, under a dozen words. Arrangement: BCGGO2024 has the largest share;
its §2.3 is cited in Layer 5 and its §8.1 in Layers 4, 6 and 7, so no run of layers maps onto its
sections. No table, figure or example list is taken over.

Source independence: 28 passages compared with 5 sources, none shared; largest share BCGGO2024,
12 of 63 locators; contents compared with BCGGO2024: independent. FarbMargalit2012 (11 locators) is
waived and was not read.

## Not verifiable

- FarbMargalit2012, Knapp2002, RichardsonSlodowy1990 (waived), Richardson1988, Goldman1984
  (uncertified): cited by locator only; the texts were not read. This includes whether
  FarbMargalit2012 Ch. 4, §4.2 is where the index `n!` of the pure group is stated.
- Whether MordellLawrenceVenkatesh §5.1's atlas is a `ChartedSpace` on the half-plane model in
  TeichmullerGeometry's sense: both are prose at their heads; the design assumes it in its
  contract.
- How MappingClassGroupsAndCanonicalRepresentations §0.2 defines the permutation of the punctures:
  that section does not say; the design records the reading it assumes in its contract.
- Elaboration: not available in this lane, and no Lean file exists at the design stage.

## Source issues

- **Misprint** in Sikora2012 at §11, line 836, printed p. 18: the source refers to a Proposition 30 for the closed-orbit characterization; it should be Theorem 30 (line 572); affects nothing.
- **Error** in BCGGO2024 at §2.3, lines 471–472, printed p. 10: the source says the real form `SO_{p,q}` has two components whenever `p` or `q` is nonzero; it should be whenever both `p` and `q` are nonzero; affects nothing.
- **Misprint** in BohmLafuente2021 at proof of Lemma 6.3, line 520, printed p. 11: the source calls the group `T = exp(𝔱)` a maximal abelian subalgebra; it should be `𝔱 ⊂ 𝔭` a maximal abelian subalgebra and `T = exp(𝔱)`; affects nothing.

## For the human reviewers

- **Not tested.** FarbMargalit2012 carries 11 of the 63 locators (second to BCGGO2024's 12) and is waived: the wording of Layers 1–3 was not compared with its text.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "9ab3ffe0b26c8c1ac9fcf0853b6b8e30b4fe3759", "job": "REV-DESIGN-SurfaceGroupCharacterVarieties~7", "model": "fable", "worker": "chris-x82"} -->
