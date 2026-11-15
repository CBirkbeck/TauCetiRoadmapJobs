<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13837#issuecomment-6895229094 -->
Review (claude) of 32c7618

Verdict: needs_changes

**For the human reviewers:** this review raises 1 question that a human decides (the scope of the roadmap, or a licence). It is in the section of that name at the end and does not change the verdict.

1. **F01** (P2) three Layer 2 targets are also owned, more generally, by an open pull request

   Location: `packages/SurfaceGroupCharacterVarieties/design/README.md`, Scope ("the pure mapping class
   group `PMod_{g,n}` of index `n!` … the presentation of `π₁(Σ_g ∖ P)` by the orientable surface group
   `S⁺(g, n)` … the pure Birman exact sequence"); §2.3; §2.4, second target; §2.5; Downstream consumers,
   first bullet; `design/plan.json`, targets 2.3, 2.4, 2.5 and `consumers`.

   Claim: this roadmap owns these objects, and MappingClassGroupsAndCanonicalRepresentations consumes
   them from §§2.3, 2.4, 2.5.

   Witness: `TauCetiRoadmap/MappingClassGroupsAndCanonicalRepresentations/README.md` at #2266. Line 47
   (Scope) owns "the identification of the presented surface group with the fundamental group of a
   surface with punctures and boundary, the algebraic pure mapping class group, … the pure form of the
   Birman exact sequence". Its §0.1 (line 611) proves the presentation for `Σ_{g,b,p}`; §0.2 (line 665)
   defines `PMod(g, b, p)` with index `p!`; §0.3 (line 741) proves the pure sequence for
   `χ(Σ_{g,b,p}) < 0`. It names this roadmap nowhere. Each statement contains this design's as the case
   `b = 0`.

   Why now: rounds 1–4 recorded that roadmap as "readable nowhere", and round 5 read a board package. It
   is now an open pull request in the merge order, and neither side has raised the overlap.

   Repair (the one that closes the overlap inside this package): cite the open owner and delete the
   duplicates.

   - §2.3: keep only what is new, namely that §0.2's permutation action on the punctures is the action
     on `P` of §2.2's extension `h̄`, well defined on classes because extended isotopies fix `P`
     pointwise. Cite MappingClassGroupsAndCanonicalRepresentations §0.2 for `PMod`, surjectivity and the
     index `n!`. Keep the three Checks as Checks of the comparison.
   - §2.4: keep the first target (the homeomorphism of `Σ_g` with the standard model, genus and
     orientability), which no other roadmap states. Replace the second target by a citation of that
     roadmap's §0.1 with `b = 0`, keeping one sentence on the convention: its `surfaceGroup g n` is
     FreeGroupsAndLimitGroups' `S⁺(g, n)` transported by inverting the handle generators.
   - §2.5: delete the target; where the pure sequence is used (Layer 2 Examples, §2.6's Checks) cite
     that roadmap's §0.3.
   - Scope: move the three objects from "owns" to "leaves to named owners"; add the kept-variant clauses
     the Scope still lacks: that roadmap's §0.2 outer action of `PMod(g, 0, n)` is the restriction of
     `Ψ_x` (§3.3); its §2.1 finiteness is finiteness of an orbit of §3.5's action for `H = GL_r(ℂ)`; its
     §1.4 `R_r(Γ)` and `M_r(Γ)` are the case `G = GL_r`, `k = ℂ` of §§4.1 and 7.2.
   - Delete the first Downstream-consumers bullet (a roadmap this one cites cannot also be listed as
     consuming the same sections), update Summary, "How to read the build", the *Needs:* and
     Dependencies lines of Layers 2–4, and mirror in `plan.json`.

   Tested: a scratch copy of the README with the consumer bullet removed and
   `MappingClassGroupsAndCanonicalRepresentations §0.3` in a *Needs:* line passes the dependency check
   ("checked as if placed after MappingClassGroupsAndCanonicalRepresentations … 0 problem(s)"); that
   roadmap cites nothing here, so no cycle arises. On `(g, n) = (0, 3)` both texts give `PMod` trivial,
   index `6`, and `PMod(0, 4) ≅ F₂`.

   The other settlement keeps this roadmap as owner (its filed slot is before that roadmap): then
   §§2.3–2.5 must be restated for type `(g, b, p)` and #2266 must cite them. That needs a change to #2266
   and an ownership note from the maintainer; it cannot be completed in this package.

2. **F02** (P2) §7.2 defines the affine quotient in characteristic zero only and restates a supplier's theorem

   Location: README §7.2 ("For a field `k` of characteristic zero … define `Hom(Γ, G)//G` … of finite
   type with the universal property …; over an algebraically closed field its points are the closed
   orbits, and two points have the same image exactly when their orbit closures meet"); Scope ("the
   affine quotient `Hom(Γ, G)//G` over fields of characteristic zero"); `plan.json` target 7.2.

   Claim: finite type and the closed-orbit fibres of `Hom(Γ, G)//G` are proved here, for characteristic
   zero, by restriction from `G^S//G`.

   Witness: `TauCetiRoadmap/LanglandsParameterStacks/README.md` at #1202, §2.2 (line 590), merge order
   line 80: it extends "finite generation, closed images and separation of invariant closed subsets, and
   the unique closed orbit in every geometric fibre, to arbitrary affine schemes of finite type over a
   field", reducible and nonreduced ones included, for a connected reductive group. `Hom(Γ, G)` is such a
   scheme over every field.

   Repair: define `Hom(Γ, G)//G := Spec O(Hom(Γ, G))^G` for a connected reductive `G` over any field `k`.
   Cite LanglandsParameterStacks §2.2 for finite generation, closed images, separation and the unique
   closed orbit in each geometric fibre. Keep as this roadmap's own theorem, for characteristic zero
   only, that `O(G^S)^G → O(Hom(Γ, G))^G` is surjective, so that `Hom(Γ, G)//G` is a closed subscheme of
   `G^S//G`; keep the `𝔽₂` Check as the negative control of that clause alone. The complex comparison is
   unchanged. Add the supplier to the contract, the Scope, §7.2's *Needs:*, Layer 7's Dependencies and
   `plan.json`.

   Tested on the design's own §4.1 Check: `Γ = ℤ/2`, `G = 𝔾_m` over `𝔽₂` gives
   `Hom = Spec 𝔽₂[t]/((t − 1)²)` with trivial action, so `Hom//G = Hom`, of finite type with one closed
   orbit. The repaired definition covers it; the present one excludes it, and the integral case of
   ArithmeticGaloisRepresentations §1.11 does not apply to it.

3. **F03** (P3) the index-two bullet of §2.1 needs connectedness

   Location: README §2.1, last API bullet ("For an oriented surface, the orientation-preserving
   homeomorphisms contain `Homeo₀(X)` and their image `Mod(X)` has index at most two in `Mod^±(X)`").

   Witness: `X = S² ⊔ S²`. `Mod^±(X)` has order `8` (reverse either sphere, or swap them); the
   orientation-preserving classes are the identity and the swap, order `2`; the index is `4`.

   Repair: "For a connected oriented surface …". On `S²` the index is `2`; on `S² ⊔ S²` the bullet no
   longer applies.

4. **F04** (P3) Goldman1984 is listed but cited nowhere

   Location: README References, last entry ("background for `Hom(π, G)/G`; cited by its locator");
   `sources.toml`, entry `Goldman1984`, locator §1.

   Witness: the key occurs `0` times in the README outside References; every other key has a locator in
   a layer.

   Repair: cite it where the manifest says it is used, in §7.1 after the definition of `𝒳(Γ, G^ℝ)`:
   "(Goldman1984, §1, for the topology of `Hom(π, G)/G`)". Otherwise remove the reference; the manifest
   entry stays as recorded.

Four findings: two P2 and two P3. The three round-5 findings are repaired and the mathematics of the
design is sound on everything computed below. Both blocking findings are overlaps with open roadmap
pull requests that the earlier rounds could not read or did not compare: since round 5,
MappingClassGroupsAndCanonicalRepresentations has become an open pull request (#2266) that plans three
of this design's Layer 2 targets at greater generality, and LanglandsParameterStacks (#1202) states
the quotient facts that §7.2 restates in characteristic zero only.

Heads read this round: MordellLawrenceVenkatesh (#1231), TeichmullerGeometry (#1169),
GroupActionsOnRiemannSurfaces (#1728), MappingClassGroupsAndCanonicalRepresentations (#2266),
LanglandsParameterStacks (#1202) and ArithmeticGaloisRepresentations at the heads of their open pull
requests; RepresentationTheory/LieGroups, FreeGroupsAndLimitGroups and ReductiveGroups on main. No
`Suggested.lean` exists at the design stage; this lane does not elaborate.

## Verified sound

**Round-5 findings** (3), each quoted from the repaired text.

- F01, repaired: §5.3, "the circle `𝐆 = SO(2)` embedded by `r_θ ↦ u r_θ u⁻¹` … has image
  `{[[c + s, −2s],[s, c − s]]}` … `K exp(𝔭) = {±1} ≠ G^ℝ`". Recomputed below.
- F02, repaired: §5.4, "The decomposition `G = K T K` used throughout is LieGroups Layer 9,
  **Restricted roots and KAK**". Layer 9 on main states `Ad(K)a = p` and `kakDecomposition` for closed
  transpose-stable matrix groups with finitely many components
  (`TauCetiRoadmap/RepresentationTheory/LieGroups/README.md` lines 1201–1203, 1354–1362).
- F03, repaired: §2.1, "A closed surface `Σ_g` carries a smooth structure `F`: a PL structure by
  Radó's theorem (TeichmullerGeometry §0.0b) and a smooth structure compatible with it (§0.0e)". Both
  sections say this at #1169; the converse model comparison there asks for empty boundary, which the
  new bullet supplies through `image_boundary`.

Repaired patterns searched in the rest of the design: no other conjugated embedding; no other
decomposition planned that Layer 9 states; no other use of §0.0e without smoothness. The pattern of
round 4's R06 (a consumer that does not name this roadmap) recurs in the first consumer bullet: R01.

**Maintainer notes** (13). None gives a new finding; what refutes each at the current text:

- 1: the contract's "Used" clause derives ambient isotopy from §2.1's manifold bullet.
- 2: Scope, contract and `plan.json` attribute to §5.9 only the action on finite coverings; §5.9 at
  #1231 says the same.
- 3: the Conventions bullet "Notation shared with suppliers" separates `Ψ` and `Mod^±`.
- 4: the contract and `plan.json` list the same twelve sections, §5.22 included; the Scope's list is
  the list of deferrals.
- 5: `Mod_{1,0} ≅ SL₂(ℤ)` is cited to TeichmullerGeometry §5.4a.
- 6: the contract states §5.4 in its connected-sum form.
- 7: "§5.23 is the case `g ≥ 1`, `n = 1`".
- 8, 9: genus and orientability come from §2.4's own target; §4.3 is kept for the attaching word.
- 10: the bullet is gone.
- 11: §2.1 states the variant clause, the comparison and GeometricTopology Layer 1.7.2 as owner.
- 12: §3.4 names `Out⁺(Π)`.
- 13: §3.3 cites §5.19.

**Principles.** No copied passage, algorithm, `set_option`, sorry'd data or Lean file. No never-cite
roadmap is cited. Greps for pull-request numbers, round labels, machine paths, LaTeX delimiters and
"optional/deferred" find nothing. The narrowing found is R02; the re-planned objects are R01.

**Supplier order.** Gate output on the design as it is:

```text
candidate: SurfaceGroupCharacterVarieties is not in the merge order yet; checked as if placed after TeichmullerGeometry (the intake inserts it when its design is accepted)
depcheck: 245 roadmaps, 2236 edges, 0 problem(s)
```

No UPWARD or CYCLE line. `roadmaps resolve`: no cross-roadmap citation and no Lean name found nowhere.
Overlaps file: no open pull request changes this roadmap; no cited id is dropped or defined only by a
revision.

**Supplier citations resolved this round.**

- MordellLawrenceVenkatesh §§5.1, 5.4, 5.5, 5.6, 5.9, 5.15, 5.16, 5.17, 5.19, 5.20, 5.22, 5.23: each
  present with the content the contract states (§5.5's `î` perfect for `∂S = ∅`; §5.19's
  `γ ↦ α * γ * α⁻¹`; §5.22 surjectivity only; §5.23 for `g ≥ 1`).
- TeichmullerGeometry Conventions, §§0.0b, 0.0e, 0.0f, 0.0h, 4.2, 5.4 (`dehn_nielsen_baer`: empty
  boundary, `Surface.IsOrientable`, genus at least one, value `FundamentalGroup.mapOfEq f`), 5.4a.
- LieGroups Layer 7's three paragraphs and Layer 9's two; FreeGroupsAndLimitGroups §§6.1, 6.1a, 6.2;
  ArithmeticGaloisRepresentations §1.11, **Reductive quotients over fields and DVRs** (integral affine
  varieties only, which is what makes R02's supplier the right one).
- Not re-opened this round, relied on from round 5's list: AlgebraicTopology, ClassifyingSpaces,
  ReductiveGroupsPartII, ComplexComparisonPartII, ArithmeticLocallySymmetricSpaces, CompactGroups,
  HamiltonianReduction, InverseGaloisAndArithmeticFundamentalGroups.

**Declared gaps.** `gcr-reductive-identity-component` and `borel-tits`: one sentence each with
hypotheses, same slug in `plan.json` and in the supplier's contract subsection, supplier named. A grep
of ReductiveGroups on main for Borel–Tits finds no statement, so the gap asks for nothing already
provided. No finding.

**Library declarations opened at the pins.** Tau Ceti: `TauCeti.isotopic_iff_ambientIsotopic`
(`Topology/Homotopy/Isotopy/Compact.lean:123`; `[ChartedSpace E Y] [CompactSpace Y] [T2Space Y]
[ConnectedSpace Y]`, `E` finite-dimensional real normed), `TauCeti.AmbientIsotopy`
(`Isotopy/Basic.lean:163`), `finalHomeomorph` (:234), `trans` (:328), `symm` (:368), `conj` and
`finalHomeomorph_conj` (`AmbientIsotopyConj.lean:110, 131`), `TauCeti.AmbientIsotopic`
(`AmbientIsotopic/Basic.lean:58`), `.isotopic` (:94), `.setoid` (:103), `TauCeti.Isotopic`
(`Isotopy/Basic.lean:114`), `Continuous.isOpenEmbedding_of_injective`
(`AlgebraicTopology/Singular/InvarianceOfDomain.lean:201`, hypothesis `finrank ℝ E = finrank ℝ F`),
`TauCeti.isPreconnected_iInter_of_directed` (`Topology/Continuum.lean:69`, `[T2Space X] [Nonempty ι]`),
`basepointMulAction` (`UniversalCover/Classification/MonodromyEquivalence.lean:93`),
`Hom.fixedMap_surjective_of_isLinearlyReductive` (`Comodule/LinearlyReductive/Fixed.lean:184`),
`ContRepresentation.IsUnitary.isSemisimpleRepresentation`
(`RepresentationTheory/Continuous/InvariantComplement.lean:190`), `TauCeti.PointTopology.topology`
(`Topology/Algebra/PointTopology/Basic.lean:83`). Mathlib: `FundamentalGroup.mul_def`
(`FundamentalGroupoid/FundamentalGroup.lean:44`), `fundamentalGroupMulEquivOfPath` (:48), `mapOfEq`
(:85), `homotopicMapsNatIso` (`InducedMaps.lean:67`), `MulAut.conj` and `MulAut.congr`
(`Algebra/Group/End.lean:721, 745`), `QuotientGroup.congr` (`QuotientGroup/Defs.lean:397`),
`quotientKerEquivRange` (`QuotientGroup/Basic.lean:134`), `Subgroup.fg_of_index_ne_zero`
(`Schreier.lean:166`), `groupHomology` (`GroupHomology/Basic.lean:226`), `groupHomology.map`
(`Functoriality.lean:157`), `IsSemisimpleRepresentation` (`RepresentationTheory/Semisimple.lean:34`),
`t2Space_quotient_mulAction_of_properSMul` (`ProperAction/Basic.lean:113`),
`TopologicalSpace.Opens.instChartedSpace` (`Geometry/Manifold/HasGroupoid.lean:284`).

**Sources, seeded sample** (15 targets). The author flags no locator as unverified.

- §1.3: LandesmanLitt2024 lines 41–50 (outer action, classes, Definition 1.1.1, no natural action on
  the representation variety). Holds.
- §§2.1, 2.2, 3.1, 3.2: FarbMargalit2012 only (waived, not read); the mathematics is in the table.
- §2.3: LandesmanLitt2024 line 474 (index `n!`). Holds.
- §3.3: LandesmanLitt2024 lines 41–42. Holds.
- §3.4: FarbMargalit2012 Theorem 8.1 (waived); TeichmullerGeometry §5.4 read instead.
- §4.1: Sikora2012 line 584 (`Hom(Γ, G)` closed in `Hom(F, G)`); BCGGO2024 lines 2706–2708. Hold.
- §5.1: BCGGO2024 lines 466–472 (real forms, possibly disconnected). Holds. Knapp2002 waived.
- §5.2: BCGGO2024 lines 475–481 (Cartan involution for a real form: commuting, product compact).
  Holds.
- §6.1: BCGGO2024 lines 2708–2711. Holds.
- §6.4: BateMartinRohrle2005 line 263 (Serre's property and the characteristic-zero converse), line
  267 (Lemma 2.6), lines 861–866 (Theorem 3.46 and its reduction to finitely many topological
  generators); Sikora2012 line 228. Hold.
- §6.5: Sikora2012 lines 572–586 (Theorem 30, resting on Richardson's Theorem 3.6);
  BateMartinRohrle2005 line 510 (Corollary 3.7). Hold. Richardson1988 uncertified.
- §7.5: Sikora2012 lines 844–845 (Example 48). Holds.
- Also read: BohmLafuente2021 lines 52–62, 77–88, 172–193, 417, 445, 518, 562, 568, 1050; Sikora2012
  lines 262–268, 363–364, 823–837; BateMartinRohrle2005 lines 355, 379–382; LandesmanLitt2024 lines
  473–475, 503–515; BCGGO2024 lines 2712–2726. All hold.

All ten cited works are in the manifest, with no local path. No fetch was needed and no
`needs-references.toml` was written.

**Adversarial table** (sampled targets, headlines, repaired passages, targets a finding touches).

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §1.1 kernel, transport | `Q₈`; `ℤ`; `S₃` | `8/2 = 4`, `24/4 = 6`; `Inn(ℤ) = 1`; `|Inn(S₃)| = 6` | correct | none |
| §1.3 action, non-descent | `ℤ²` witness; `F₂`, `ρ = id`; `ℤ/3` | `(φψ)⁻¹` row `(1, −1)`, `(ψφ)⁻¹` row `(2, −1)`; `conj a · id = conj a⁻¹ ≠ id`; inversion swaps the two generators | left action; iff both ways | none |
| §2.1 path component | exponential law | path ⇔ `(t, x) ↦ f_t(x)`, `f_t⁻¹(x)` both continuous ⇔ total map a homeomorphism | correct | none |
| §2.1 new bullet (F03) | `Σ_g` with a second atlas; `P = ∅` | identity carries `∂ = ∅` to `∂ = ∅`; open subset inherits the `ℝ²` charts | correct | none |
| §2.1 index bullet | `S²`; `S² ⊔ S²` | index `2`; orders `8` and `2`, index `4` | false without "connected" | R03 |
| §2.2 extension | `[0,1]`, `{0}`; `S¹`, two points; `P = ∅` | extends, fixing `0`; punctured neighbourhoods disconnected, no extension; identity | correct | none |
| §2.2 sketch | `y ∉ U`, `U` compact | `h(Σ ∖ (P ∪ U))` open, disjoint from `h(U ∖ {p})` | limit set inside `P`, one point | none |
| §2.3 index | `n = 0, 1`; `(0, 2)`; `(0, 3)` | `1, 1`; `2`; `6`; the open owner's §0.2 gives the same with `b = 0` | correct, duplicated | R01 |
| §2.4 presentation | `(1, 0)`; `(0, 3)`; `(1, 1)` | `ℤ²`; `F₂`, `p₃ = (p₁p₂)⁻¹`; `F₂` | correct, duplicated | R01 |
| §2.5 pure Birman | `(0, 3)`; `(1, 1)`; `(1, 0)`; `(0, 2)` | `F₂ ≅ PMod_{0,4}`; `F₂ → PMod_{1,2} → SL₂(ℤ)`; `Push = 1`; `ℤ → 1` | correct, duplicated | R01 |
| §3.1 laws | change of path; composition; inverse; `id_σ` | `[δ'δ̄(δ fγ δ̄)δδ̄']`, `u = δ ⬝ δ̄'`, `conj[u]`; `[δ fε fgγ fε̄ δ̄]`; `δ ⬝ δ̄ ≃ const`; `conj[σ]⁻¹` | correct | none |
| §3.2 lemma | `(id, f, const)`; push | `f_η = id_const = 1`, `f_δ = conj[η ⬝ δ̄]`; `f_const = conj[α]` | correct | none |
| §3.3 `Ψ_x` | torus shear | `e₁ ↦ (1,1)`, `e₂ ↦ (0,1)`: `[[1,0],[1,1]]` | correct | none |
| §3.4 reflection | `z ↦ e^{2πi/g} z̄` on `exp(2πi(j+t)/4g)` | `(j, t) ↦ (3 − j, 1 − t)`; `(4i,t)∼(4i+2,1−t) ↦ (4j+3,1−t)∼(4j+1,t)`, `j ≡ −i` | respects gluing | none |
| §3.5 coverings, lift | torus, `d = 3`; `(0,3)`, `S₃` | `M(ker ρ) = {b ≡ a} = ker(ρ ∘ M⁻¹)`; `(36 + 12 + 18)/6 = 11` | correct | none |
| §4.1 scheme | `ℤ`; trivial; `ℤ/2`, `𝔾_m`, `𝔽₂` | `G`; `Spec k`; `𝔽₂[t]/((t−1)²)` | correct | none |
| §5.1 datum | `SO(1,1)`; `PGL₂` | `a² − b² = 1`, two components; `PSL₂(ℝ)` open of index two | correct | none |
| §5.2 bridge | `GL₂`, `τ = J ḡ J⁻¹` | `J ḡ J⁻¹ = [[s̄, −r̄],[−q̄, p̄]]`, fixed points `[[a, −b̄],[b, ā]]` | correct | none |
| §5.3 Check (F01) | `u r_θ u⁻¹` | column norms `1 + s(2c+s)`, `1 + 2s(2s−c)`; `s ≠ 0` gives `s = −4s`; `(1,1)`, squared norm `2` | true non-example | none |
| §5.4 (headline) | `ℝ_{>0}` on `ℝ²`; conventions witness; pair `(A, 1)` | `M = {abs x = abs y}`; `2 + t⁴ → 2`; `[A, Aᵀ] = diag(1, −1) ≠ 0` | agrees with BohmLafuente2021 Theorem 1.1 | none |
| §5.4 `K T K` (F02) | `ℝ_{>0}`; model check | `K = 1`, `T = G`; `(k exp X)ᵀ = exp(X)k⁻¹`, `π₀(G)` bounded by `π₀(K)` | Layer 9 applies | none |
| §6.2 | Weil restriction | `w ⊗ z ↦ (zw, z̄w)` complex-linear into `W ⊕ W̄` | correct | none |
| §6.4 | Borel of `SL₂`; `N(T)` | centralizer `±1`, `R_u ≠ 1`; no fixed line | correct | none |
| §6.5 | Borel-dense `F₂` | `[[1,t²],[0,1]] → 1` | orbit not closed | none |
| §6.7 (headline) | trivial `Γ`; centralizer criterion | reductive, irreducible only for a torus, centralizer `G`; non-central torus `S` in `C_G(Z)` puts `Z` in `C_G(S)` | consistent | none |
| §7.1 (headline) | `ℤ`, `SL₂(ℝ)`; `F_ℕ`, `ℝ^×` | unipotent class not a point; `(ℝ^×)^ℕ` not locally compact | correct | none |
| §7.2 (headline) | `ℤ`, `GL_n`; `ℤ/2`, `𝔾_m`, `𝔽₂` | `𝔸^{n−1} × 𝔾_m`; nonreduced point, finite type, excluded by "characteristic zero" | comparison correct; quotient narrowed | R02 |
| §7.3 | saturated closed subset; finite index | closed image under the open quotient map; same identity component | correct | none |
| §7.4 | `ℤ`, `SO(2)` | inversion, fixed points `±1` | correct | none |
| §7.5 | `ℤ`, `PSL₂(ℝ)`; `F₂`, `SL₂(ℂ)` | no parabolic class; `ℂ³`, `κ = tr ρ([a,b])` invariant under `Out(F₂)` | correct | none |

**Shape.** Summary, Scope, Conventions, contracts, build paragraph, seven layers each ending with
Examples and Dependencies, consumers, references. Every definition (§§1.2, 2.1, 3.1, 4.1, 5.1, 6.1,
7.1) has an API list and at least three Checks; `plan.json` has 34 targets, each with three or more
tests. The layers are named by their mathematics; Layers 1–3 and 4–6 are independent and Layer 7 uses
both.

**Headline theorems, for the package stage.** §7.1, §7.2, §6.7, §5.4, §§1.3 and 3.5, §5.2. At the pins
§5.4 and §1.3 are statable; the others lack a carrier and belong in the module docstring. Padding
probe and `#check` comparison: not applicable, no Lean file.

**Duplication audit.** By object, over main and the open heads: R01 and R02 are the two results. The
representation scheme (§4.1) and the outer action (§§3.3, 3.5) are stated here at greater generality
than in #2266 (§§1.4, 0.2, 2.1 there), so they stay here as kept variants once the Scope says so
(R01's repair). Kempf–Ness, real reductive data and `𝒳(Γ, G^ℝ)`: no other owner found.

Overlap check: read MappingClassGroupsAndCanonicalRepresentations, TeichmullerGeometry,
MordellLawrenceVenkatesh, GroupActionsOnRiemannSurfaces, GeometricTopology, ReductiveGroups; `PMod`
with its index, the presentation of punctured surface groups and the pure Birman sequence are shared
with MappingClassGroupsAndCanonicalRepresentations, owner that roadmap after R01; `Out(Γ)` is
TeichmullerGeometry's; `Mod(S)`, `Push` and the Birman sequence are MordellLawrenceVenkatesh's;
`Mod(F)` of a compact surface is GeometricTopology's; nothing shared with BelyiMaps. SurfaceTopology
is on the never-cite list and was not compared.

**Copyright.** Wording compared at every locator above and in six further passages (Summary, §2.2
sketch, §5.3 sketch, §5.4 statement, §6.1 definition, §7.1 sketch). The longest shared runs are
statements the mathematics forces, under a dozen words. Arrangement: FarbMargalit2012 has the largest
share; its chapters cited are 8, 1, 2, 4, 8 across Layers 1–3, in no run, and Layers 4–7 do not cite
it. No table, figure or example list is taken over.

Source independence: 27 passages compared with 5 sources, none shared; largest share
FarbMargalit2012, 14 of 66 locators; contents compared with FarbMargalit2012's public chapter list:
independent; its text is waived and was not read.

## Not verifiable

- FarbMargalit2012, Knapp2002, RichardsonSlodowy1990 (waived), Richardson1988, Goldman1984
  (uncertified): cited by locator only; the texts were not read.
- Whether MordellLawrenceVenkatesh §5.1's atlas is a `ChartedSpace` on the half-plane model in
  TeichmullerGeometry's sense: both are prose at their heads; the design assumes it in its contract.
- Elaboration: not available in this lane, and no Lean file exists at the design stage.

## Source issues

- **Misprint** in Sikora2012 at §11, line 836, printed p. 18: the source refers to a Proposition 30 for the closed-orbit characterization; it should be Theorem 30 (line 572); affects nothing.
- **Error** in BCGGO2024 at §2.3, lines 471–472, printed p. 10: the source says the real form `SO_{p,q}` has two components whenever `p` or `q` is nonzero; it should be whenever both `p` and `q` are nonzero; affects nothing.

## For the human reviewers

- **Not tested.** FarbMargalit2012 has the largest share of the locators (14 of 66) and is waived: the wording was not compared with its text, and the arrangement only with its public chapter list.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "32c7618cbdfd014da71a7aceca0226c53d9b65f6", "job": "REV-DESIGN-SurfaceGroupCharacterVarieties~6", "model": "fable", "worker": "chris-x82"} -->
