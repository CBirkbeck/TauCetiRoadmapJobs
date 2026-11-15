<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13837#issuecomment-6899180456 -->
Review (claude) of a9b3eb9

Verdict: needs_changes

**For the human reviewers:** this review raises 1 question that a human decides (the scope of the roadmap, or a licence). It is in the section of that name at the end and does not change the verdict.

1. **F01** (P3) §5.4 (iii) is weaker than the cited theorem

   Location: `packages/SurfaceGroupCharacterVarieties/design/README.md`, §5.4, lines 1359–1360: "(iii)
   if `G v` is not closed there is `α ∈ 𝔭` such that `lim_{t→∞} exp(tα) v` exists and lies outside
   `G v`"; `design/plan.json`, target 5.4, clause (iii).

   Claim: this is the Hilbert–Mumford clause of BohmLafuente2021 Theorem 1.1.

   Witness: BohmLafuente2021 lines 81–82 (proof at lines 580–583): the limit has closed orbit. For
   `G = (ℝ_{>0})²` diagonal on `ℝ²`, `v = (1, 1)`, `α = diag(−1, 0)`: limit `(0, 1)`, outside `G v`,
   with non-closed orbit `{0} × ℝ_{>0}`.

   Nothing stated is false; the statement is narrower than its source, and (iii) with (iv) does not
   give the source's clause.

   Repair: in §5.4 write "(iii) if `G v` is not closed there is `α ∈ 𝔭` such that
   `w = lim_{t→∞} exp(tα) v` exists and `G w` is closed, so that `w ∉ G v`"; the same in `plan.json`
   5.4. In the sketch, after "produces `α` in (iii)", add "with the closed invariant subset taken to be
   the orbit of a norm minimizer of the closure, which is closed by (ii)". Add the Check: "`(ℝ_{>0})²`
   acting diagonally on `ℝ²`, `v = (1, 1)`: `α = diag(−1, 0)` gives the limit `(0, 1)`, outside the
   orbit but with the non-closed orbit `{0} × ℝ_{>0}`; `α = diag(−1, −1)` gives `0`, whose orbit is
   closed; a clause asking only for a limit outside the orbit accepts the first." Tested on the
   witness: here `K = 1`, `𝔭` is the diagonal matrices, `G = exp(𝔭)`; the repaired clause rejects
   `diag(−1, 0)` and is met by `diag(−1, −1)`; `{0}` is the unique closed orbit of the closed quadrant,
   as (iv) says.

2. **F02** (P3) §4.2 uses the datum that §5.1 defines

   Location: README §4.2, line 1173: "For a real reductive datum `(𝐆, G^ℝ)`, prove that
   `Hom(Γ, 𝐆(ℝ)) = Hom(Γ, 𝐆)(ℝ)` is the fixed set of complex conjugation"; its *Needs:* line (1185);
   Layer 4's Dependencies; `plan.json` 4.2 (`prerequisites`).

   Claim: Layer 4 needs nothing of Layer 5.

   Witness: §5.1, line 1221: "Define a real reductive datum as in the Conventions". §4.2's statement
   names that definition; its *Needs:* and `plan.json` 4.2 list no §5.1, and Layer 4 precedes Layer 5.

   Repair: state the clause at its own generality, which uses neither reductivity nor connectedness:
   "For an affine group scheme `𝐆` of finite type over `ℝ` and an open subgroup `G^ℝ ⊆ 𝐆(ℝ)` (in
   particular for a real reductive datum, §5.1), prove that …"; the same words in `plan.json` 4.2. No
   *Needs:* line changes. Tested: `𝐆 = 𝔾_a`, not reductive, `Γ = ℤ/2`: `Hom(ℤ/2, ℂ) = {0}` is fixed by
   conjugation and equals `Hom(ℤ/2, ℝ)`; `𝐆 = 𝔾_m`, `G^ℝ = ℝ_{>0}`, `Γ = ℤ`: `ℝ_{>0}` is open and closed
   in `ℝ^×`, the fixed set of conjugation on `ℂ^×` (§4.2's first Check). In general
   `Hom(Γ, G^ℝ) = ⋂_{s ∈ S} {ρ : ρ(s) ∈ G^ℝ}`, a finite intersection of sets open and closed because an
   open subgroup is closed.

Two findings, both P3, no P1 or P2: each carries a repair, so the review asks for changes. Nothing
else is to repair; the two declared supplier gaps (`gcr-reductive-identity-component`,
`borel-tits`) are precise, minimal and declared. Both round-9 findings are repaired. None of the
thirteen maintainer notes holds at this head. There is no `Suggested.lean` at the design stage and
elaboration is `not available (this lane does not elaborate)`.

## Verified sound

**Round-9 findings** (2), each against the current text.

- F01, repaired. Contract *From TauCetiRoadmap.NonabelianLevelStructures*: "§5.2's map is the right
  action `ρ ↦ ρ ∘ φ`, an anti-homomorphism; §7.4's left action of `[φ]` is §5.2's automorphism of
  `φ⁻¹`. The four automorphisms listed are involutions, so their moves are the same in both." §7.5,
  third Check: "The direction matters off the involutions: for `ρ = (A, B)` and
  `φ : (a, b) ↦ (a, a⁻¹ b)`, `ρ ∘ φ⁻¹ = (A, A B)` and §7.4's `[φ]` acts by
  `(x, y, z) ↦ (x, z, x z − y)` … At `(2, 2, 3)` these give `(2, 3, 4)` … and `(2, 1, 2)`".
  `plan.json` 7.5 (statement and test `pants_SL2C`) and its `suppliers` entry say the same.
  NonabelianLevelStructures §5.2 at its open head: "right precomposition by Aut(F₂) induces an
  anti-homomorphism"; its first Check gives `φ ∘ (r ∘ t)` the triple `(x, x y − z, y)`.
- F02, repaired. Scope: "§5.1 is used here only in Checks of §§7.2 and 7.5, and §5.2 only in §7.5";
  the contract: "§5.1 is used only in Checks of §§7.2 and 7.5, and §5.2 only in §7.5, with `R = ℂ`";
  Layer 7 Dependencies: "NonabelianLevelStructures §§5.1–5.2 (Checks of §§7.2 and 7.5)". Every other
  occurrence of the supplier's name lies in §7.2's second Check, §7.5 or the Layer 7 Examples.

Repaired patterns searched in the rest of the design: a left action compared with a supplier's
right action (the only other supplier action, MordellLawrenceVenkatesh §5.9's `[p] ↦ [f ∘ p]`, is
pinned by §3.5's torus Check, recomputed below); a "used only in" clause contradicted by a citation
(SymplecticGeometry/HamiltonianReduction R5 is cited only in §7.1's first Check and the Layer 7
Dependencies; ClassifyingSpaces only in §3.4).

**Maintainer notes** (13). None holds at this head.

- 1: the contract derives it ("Used: … homotopies through homeomorphisms; by §2.1 these are exactly
  the ambient isotopies"); MordellLawrenceVenkatesh §5.17 at its head gives `Homeo⁺(S, ∂S)` the
  compact-open topology, and §2.1's manifold bullet proves the step.
- 2: Scope and contract give §5.9 the action on finite coverings only; §5.9's Construction reads "`f`
  sends the class of a covering `p` to the class of `f ∘ p`; in terms of monodromy this is
  precomposition with the outer automorphism `(f⁻¹)_*`". The action on `Rep(π₁, H)` is §3.5's own.
- 3: Conventions, "Notation shared with suppliers", separates `Ψ_x` from §5.9's `Ψ` and `Mod^±(X)`
  from TeichmullerGeometry §3.1's `Mod±(Σ) = π₀ Diff(Σ)`, with the torus witness.
- 4: the contract, the 32 *Needs:* lines and `plan.json` name the same ten sections (§§5.1, 5.4,
  5.5, 5.6, 5.9, 5.15, 5.17, 5.19, 5.20, 5.22, §5.22 included); the Scope's longer ranges and
  TeichmullerGeometry §0.0d are its list of what is left to the owner.
- 5: Layer 2 Examples cite TeichmullerGeometry §5.4a (`mcg_torus_full`), which at its head
  "restricts to an isomorphism of `SL₂(ℤ)` with the orientation-preserving subgroup".
- 6: the contract states §5.4 in its connected-sum form; the polygon model is §2.4's own target.
- 7: "5.23" occurs only inside the Scope's range; no "case `n = 1`" is claimed.
- 8: the contract says orientability is invariant under homeomorphisms and the genus constant "by
  its definition", as TeichmullerGeometry §0.0f states both.
- 9: §4.3 is cited for the attaching word, the relator and the native comparison only; the
  reflection is constructed in §3.4 on §0.0f's realization.
- 10: the consumers list does not name GroupActionsOnRiemannSurfaces; the Scope describes its §3.4,
  which at its head says "Use MordellLawrenceVenkatesh §5.9's mapping class group".
- 11: §2.1 states how `Mod^±(X)` differs from `MappingClassGroupFull X`, the comparison map, and
  "GeometricTopology Layer 1.7.2's `Mod(F)` … the owner of the mapping class groups of compact
  surfaces".
- 12: §3.4: "the group that TeichmullerGeometry §5.4 writes `Out⁺(Π)` …; its description by the
  action on `H₂` is stated here". TeichmullerGeometry §5.4 still writes `Out⁺(Π)` without defining it.
- 13: §§3.2–3.3 cite MordellLawrenceVenkatesh §5.19 for `Push` and its formula.

**Principles.** No copied passage, algorithm, `set_option`, sorry'd data or Lean file. No roadmap of
the never-cite list is cited (SurfaceTopology and QuaternionicModularForms do not occur). Greps for
LaTeX delimiters, pull-request numbers, round labels, job ids, machine paths, HTML anchors and
"optional/deferred/removed/currently/so far" find nothing ("round" hits are "around"; "lemma" hits
are prose, "Schreier's lemma"). The layers are named by their mathematics; no sentence says the
roadmap follows a source.

**Supplier order.** Gate output:

```text
candidate: SurfaceGroupCharacterVarieties is not in the merge order yet; checked as if placed after NonabelianLevelStructures (the intake inserts it when its design is accepted)
depcheck: 246 roadmaps, 2250 edges, 0 problem(s)
```

No UPWARD or CYCLE line. `roadmaps resolve` on the README: no cross-roadmap citation and no Lean name
found nowhere. `roadmaps overlaps`: no roadmap of this name on main or in an open pull request; the
overlaps file lists no pull request changing it, no dropped id, no id only a revision defines, no
second copy. `roadmaps grep` finds no roadmap citing SurfaceGroupCharacterVarieties.

**Supplier citations resolved this round** (headings and cited content read at each head).

- MordellLawrenceVenkatesh (open head): §§5.1, 5.4, 5.5, 5.6, 5.9, 5.15, 5.17, 5.19, 5.20, 5.22
  under those numbers, in "Layer LV.5". §5.5: `î(x, y) = ⟨D_rel⁻¹(x) ∪ D_abs⁻¹(j y), [S]⟩`, perfect
  for `∂S = ∅`, invariant under orientation-preserving homeomorphisms. §5.6: `H₁ ≃ ℤ^(2g)` for
  `b + n = 0`. §5.9: `Mod_{0,3} = Sym(3)` with trivial pure subgroup. §5.19: `γ ↦ α * γ * α⁻¹`.
  §5.20: exactness for `χ(S) < 0`. §5.22: surjectivity for `g ≥ 1`.
- TeichmullerGeometry (open head): §§0.0b (`image_boundary`, Radó), 0.0e (compatible smoothing, the
  two models), 0.0f (`schemaRealization`, canonical words `a a⁻¹`, `aᵢ bᵢ aᵢ⁻¹ bᵢ⁻¹`, `aᵢ aᵢ`,
  `cⱼ hⱼ cⱼ⁻¹`; `StandardSurface.isSurface_model`, `eulerChar_model`, `homeomorph_unique`,
  `classification_of_surfaces`, `Surface.genus`, `Surface.IsOrientable`), 0.0h
  (`isotopicToIdSubgroup`, `MappingClassGroupFull`, the forgetful isomorphism), 3.1, 4.2 (`OuterAut`,
  `innerAut_normal`, `OuterAut Q₈` of order `6`), 4.3 (relator, the genus-two Check), 4.5, 5.4
  (`dehn_nielsen_baer`, hypotheses and value as the contract states them), 5.4a (`mcg_sphere_full`,
  `mcg_torus_full`), 6.1; the Layer 5 genus-two example.
- MappingClassGroupsAndCanonicalRepresentations (open head): §§0.1 (the inversion of the handle
  generators, freeness of rank `2g + b + p − 1`), 0.2 (kernel of the permutation action, index `p!`,
  every permutation realized), 0.3, 1.4, 2.1. NonabelianLevelStructures §§5.1, 5.2.
  RealSemisimpleLieGroups §2.5 (the real form `𝐇₀` with `𝐇₀(ℝ) = H^τ`, Cartan involutions,
  `K = H^τ ∩ H^σ`, `K × 𝔭 → H^τ`). LanglandsParameterStacks §2.2 (reducible and nonreduced schemes).
  ArithmeticGaloisRepresentations §1.7 **Semisimplicity over a perfect field** (with the `𝔽_p(s)`
  example), §1.11 **Reductive quotients over fields and DVRs**, **Complete reducibility and closed
  tuples**. ComplexComparisonPartII §C-1.1. ArithmeticLocallySymmetricSpaces §§ALS.F.1, ALS.0.1.
  GroupActionsOnRiemannSurfaces §3.4.
- On main: AlgebraicTopology §§4.2, 4.3 ("Stage 4 items 1–8 are §§4.1–4.8"); ClassifyingSpaces Stage
  3 items 11, 15, Stage 4 item 17; ReductiveGroups Layers 0, 1, 2, 3A, 5, 6, 7; ReductiveGroupsPartII
  §§RG2.0.1, RG2.0a.2; FreeGroupsAndLimitGroups §§6.1 (`S⁺(g, m)`, `[x, y] = x⁻¹ y⁻¹ x y`,
  `SurfaceGroup.lift`), 6.2; GeometricTopology Layer 1.7.2 ("the single owner"); LieGroups Layer 9
  (closed transpose-stable `H ≤ GL_N(ℝ)` with finitely many components and a finite central
  covering; **Restricted roots and KAK**, `kakDecomposition`); HamiltonianReduction R5.

**Declared gaps.** `gcr-reductive-identity-component` (ArithmeticGaloisRepresentations §1.11) and
`borel-tits` (ReductiveGroups Layer 7): each `needs` is one sentence with its hypotheses, the slug is
in `plan.json`, in §6.4's *Needs:* and in the supplier's contract subsection. §1.11 at its head states
no such implication, and ReductiveGroups Layer 7 has no Borel–Tits theorem on unipotent subgroups:
neither asks for what is provided. No finding.

**Library declarations opened at the pins.**

- Tau Ceti: `AmbientIsotopy` (`Topology/Homotopy/Isotopy/Basic.lean:163`, fields
  `isHomeomorph_total'`, `map_zero_left'`; no separation axiom), `trans` (`:328`), `symm` (`:368`),
  `finalHomeomorph` (`:234`), `Isotopic` (`:114`); `AmbientIsotopy.conj`, `finalHomeomorph_conj`
  (`Topology/Homotopy/AmbientIsotopyConj.lean:110, 131`); `AmbientIsotopic`, `.isotopic`, `.setoid`
  (`Topology/Homotopy/AmbientIsotopic/Basic.lean:58, 94, 103`; `Φ.final.comp f = g`, the direction
  the Conventions state); `isotopic_iff_ambientIsotopic` (`Topology/Homotopy/Isotopy/Compact.lean:123`,
  `[CompactSpace Y] [T2Space Y] [ConnectedSpace Y]`, finite-dimensional model);
  `Continuous.isOpenEmbedding_of_injective` (`AlgebraicTopology/Singular/InvarianceOfDomain.lean:201`,
  root namespace, `finrank ℝ E = finrank ℝ F`); `isPreconnected_iInter_of_directed`
  (`Topology/Continuum.lean:69`; it does not give nonemptiness); `monodromyEquivalence`,
  `basepointMulAction` (`AlgebraicTopology/UniversalCover/Classification/MonodromyEquivalence.lean:158, 93`);
  `PointTopology.topology`, `instTopologicalSpaceWithConv` (`Topology/Algebra/PointTopology/Basic.lean:83, 110`);
  `Coalgebra.IsLinearlyReductive` (`Algebra/Coalgebra/Comodule/LinearlyReductive.lean:249`);
  `Comodule.Hom.fixedMap_surjective_of_isLinearlyReductive` (`…/LinearlyReductive/Fixed.lean:184`);
  `ContRepresentation.IsUnitary.isSemisimpleRepresentation`
  (`RepresentationTheory/Continuous/InvariantComplement.lean:190`, root namespace);
  `Matrix.SpecialLinearGroup.trace_commutatorElement_fin_two` (`LinearAlgebra/Matrix/Trace/FinTwo.lean:231`).
- Mathlib: `FundamentalGroup.mul_def` (`AlgebraicTopology/FundamentalGroupoid/FundamentalGroup.lean:44`,
  `p * q = .of (q.asHom.trans p.asHom)`), `fundamentalGroupMulEquivOfPath` (`:48`), `map` (`:79`),
  `mapOfEq` (`:85`); `homotopicMapsNatIso` (`…/InducedMaps.lean:67`); `MulAut.congr`
  (`Algebra/Group/End.lean:745`); `QuotientGroup.congr` (`GroupTheory/QuotientGroup/Defs.lean:397`);
  `quotientKerEquivRange` (`GroupTheory/QuotientGroup/Basic.lean:134`); `ConjClasses`
  (`Algebra/Group/Conj.lean:133`); `ConjAct` (`GroupTheory/GroupAction/ConjAct.lean:43`);
  `groupHomology` (`RepresentationTheory/Homological/GroupHomology/Basic.lean:226`),
  `groupHomology.map` (`…/Functoriality.lean:157`); `IsSemisimpleRepresentation`
  (`RepresentationTheory/Semisimple.lean:34`); `ProperSMul`,
  `t2Space_quotient_mulAction_of_properSMul` (`Topology/Algebra/ProperAction/Basic.lean:55, 113`);
  `Subgroup.fg_of_index_ne_zero` (`GroupTheory/Schreier.lean:166`); `Opens.instChartedSpace`
  (`Geometry/Manifold/HasGroupoid.lean:284`); `ContinuousMap.compactOpen` (`Topology/CompactOpen.lean:51`).

**Sources, seeded sample** (15 targets). The author flags no locator as unverified.

- §§1.2, 1.3: LandesmanLitt2024 lines 41–50 (outer action at 41–42, Definition 1.1.1 at 45, the
  remark at 47–50). Hold. §2.3: lines 473–475 (`PMod` of index `n!`). Holds.
- §§1.1, 2.2, 2.4, 3.2: FarbMargalit2012 only (waived, not read); the mathematics is in the table.
- §4.1: Sikora2012 line 584; BCGGO2024 lines 2706–2708. Hold. §4.2: BCGGO2024 lines 2706–2708, the
  locator of the object. Holds.
- §5.3: BohmLafuente2021 lines 52–62 (closed `G ⊂ GL(V)` with `G = K · exp(𝔭)`), line 193 (normal
  matrices). Hold.
- §5.4: BohmLafuente2021 Theorem 1.1 at lines 77–88, Lemma 5.1 at 417, Corollary 5.5 at 445, Lemma
  6.3 at 518, Corollary 6.4 at 562, Lemma 6.5 at 568, Corollary A.2 at 1050; examples at 172–176 and
  179–193. All at their lines; clause (iii) is narrower than lines 81–82 (R01).
  RichardsonSlodowy1990 waived.
- §6.4: BateMartinRohrle2005 lines 263–264, Lemma 2.6 at 267, Theorem 3.46 at 861 (proof 863–869);
  Sikora2012 line 228, Proposition 8. Hold.
- §6.5: Sikora2012 lines 572–586 (Theorem 30); BateMartinRohrle2005 Corollary 3.7 at 510. Hold.
  Richardson1988 uncertified. §6.6: RichardsonSlodowy1990 only (waived).
- §7.2: Sikora2012 lines 823–837 (§11) and 844–845 (Example 48). Hold.
- Also read: BateMartinRohrle2005 lines 183–187, 355–357, 379–382, 814–815; Sikora2012 lines
  262–269, 363–364; BCGGO2024 lines 466–481, 2708–2726. All hold.

All ten cited works are in the manifest, every README locator lies inside its manifest locator, and
the manifest has no local path. Nothing was fetched; no `needs-references.toml` was written.

**Adversarial table** (sampled targets, repaired passages, headlines, targets a finding touches).

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Conventions, action | `ℤ²`, `φ = [[1,1],[0,1]]`, `ψ = [[1,0],[1,1]]` | `φψ = [[2,1],[1,1]]`, inverse `[[1,−1],[−1,2]]`, row `(1, −1)`; `ψφ = [[1,1],[1,2]]`, inverse row `(2, −1)` | left action | none |
| §1.1 | `Q₈`; `ℤ`; `S₃`; inner `e = conj g` | `8/2 = 4`, `24/4 = 6`; `Inn(ℤ) = 1`; `6`; `c_g φ c_g⁻¹ = c_{g φ(g)⁻¹} φ = φ c_{φ⁻¹(g) g⁻¹}` | correct | none |
| §1.2 | `Rep(ℤ, S₃)`; `Rep(ℤ/2, GL₂(ℂ))`; `H = 1` | `3` classes against `6` homomorphisms; `diag(1,1), diag(1,−1), diag(−1,−1)`; one point | correct | none |
| §1.3 | `F₂`, `ρ = id`; abelian `H`; `Out(ℤ)` on `S₃`, `ℤ/3` | `c_a · id = c_{a⁻¹} ≠ id`, same class; `c_γ · ρ = ρ` iff `ρ(γ)` centralizes `ρ(Γ)`; `3` fixed, `2` swapped | iff both ways | none |
| §2.2 | `S²`, `{N, S}`; `S¹`, two points; `[0, 1]`, `{0}`; `P = ∅` | `(θ, s) ↦ (−θ, −s)` extends, swaps `N, S`; `U ∖ {p}` has two arcs, no extension; `(0, ε]` connected, every homeomorphism of `(0, 1]` extends; identity | correct | none |
| §2.2 sketch | `h(y)`, `y ∉ P ∪ U`; isotopy at `t = 0` | `h(Σ ∖ (P ∪ U))` open, disjoint from `h(U ∖ {p})`; connected subset of `I × P` meeting every slice is `I × {q}`, and `(0, p)` lies in it | correct | none |
| §2.3 | `n = 0, 1`; `(0, 2)`; `(0, 3)` | index `1 = 0! = 1!`; order `2 = 2!`; `S₃`, `6 = 3!` | correct | none |
| §2.4 | torus; `a a b b`; `nonorientable 5 0`; `a a⁻¹`; `a a`; a hole block | `d₂ = 0`, `H₁ = ℤ²`; `d₂ = 2a + 2b`, `H₁ = ℤ ⊕ ℤ/2`, `H₂ = 0`; `ℤ⁴ ⊕ ℤ/2`; `d₁(a) = v₁ − v₀`, `H₁ = 0`, `H₂ = ℤ`; `d₂ = 2`; `d₂ ∋ h_j ≠ 0` | correct | none |
| §3.1 (used by §3.2) | change of path; composition; `id_σ` | `conj[δ ⬝ δ̄'] f_δ[γ] = [δ' ⬝ fγ ⬝ δ̄']`; `[δ ⬝ fε ⬝ fgγ ⬝ (fε)‾ ⬝ δ̄]`; `[σ γ σ̄] = conj[σ]⁻¹[γ]` | correct | none |
| §3.2 | track `η`; `f ∈ Homeo₀`; push; torus | `η ⬝ gγ ⬝ η̄ ≃ fγ`, so `g_{δ ⬝ η} = f_δ`; `f_η = 1`, `f_δ = conj[η ⬝ δ̄]`; `f_const = conj[α]`, `γ ↦ α * γ * α⁻¹`; identity on `ℤ²` | correct | none |
| §3.4 reflection | `z ↦ e^{2πi/g} z̄` on the `4g`-gon | arc `j`, parameter `t` goes to arc `3 − j`, `1 − t`; `(4i, t) ∼ (4i+2, 1−t)` goes to `(4j+3, 1−t) ∼ (4j+1, t)`, `j ≡ −i`; `r² = 1`; `î(f_*u, f_*v) = ε_f î(u, v)` | correct | none |
| §3.5 direction | torus, `M = [[1,0],[1,1]]`, `ρ(u, v) = v mod 3`; `Rep(F₂, S₃)`; `Push(a)` | `M(ker ρ) = {b ≡ a} = ker(ρ ∘ M⁻¹)`, `ρ ∘ M` has `{b ≡ −a}`; `(36 + 12 + 18)/6 = 11`; `(1 2)(2 3)(1 2) = (1 3)` | correct | none |
| §4.1 | `ℤ`; `ℤ/2`, `𝔾_m`, `𝔽₂`; `ℤ²`, `GL_n` | `G`; `𝔽₂[t]/((t − 1)²)`; commuting pairs | correct | none |
| §4.2 | `Hom(ℤ, GL₁(ℝ))`; `Hom(ℤ/2, SO(2))`; `𝔾_a`, `ℤ/2` | `ℝ^×`, component `ℝ_{>0}`; `{±1}`; `{0}` fixed by conjugation | holds without reductivity | R02 |
| §5.3 | `SO(2)` conjugated by `u = [[1,1],[0,1]]`; components of `G^ℝ` | `[[c+s, −2s],[s, c−s]]`; column lengths `1 + s(2c+s)`, `1 + 2s(2s−c)`, so `s = −2c = −4s`, `s = 0`, `K = {±1}`; each component meets `K`, fixed by `g ↦ (gᵀ)⁻¹` | correct | none |
| §5.3, image | conjugation on `V` | `H = π(K) exp(dπ 𝔭)`; `π(k) exp(dπ X)` orthogonal forces `exp(dπ X) = 1`, so `H ∩ O(V) = π(K)` | hypothesis (1) met | none |
| §5.4 (headline) | `ℝ_{>0}` on `ℝ²`; on `ℝ`; `(ℝ_{>0})²` on `ℝ²`, `v = (1, 1)` | `M = {x² = y²}`; `M = {0}`, `α = −1`; `diag(−1, 0)`: limit `(0, 1)`, orbit `{0} × ℝ_{>0}` not closed; `diag(−1, −1)`: limit `0` | (iii) true, weaker than the source | R01 |
| §5.4 (v) | `ℝ_{>0}` on `ℝ²`, `Z₁ = {y = 0}`, `Z₂ = {xy = 1}` | `f = min(1, abs(xy))`: `0` on `Z₁`, `1` on `Z₂`, invariant | as Corollary 5.5 | none |
| §6.4 | Borel of `SL₂`; `N(T)`; gap route | centralizer `{±1}`, `R_u ≠ 1`; `diag(2, 1/2)` dense in `T`, no fixed line; `R_u(H⁰) ⊆ L ∩ R_u(P) = 1` | correct, conditional on the gaps | none |
| §6.5 | `ℤ`, `GL_n`; `F₂`, `(diag(2, 1/2), [[1,1],[0,1]])` | closed iff semisimple; conjugate by `diag(t, t⁻¹)`: `[[1, t²],[0, 1]] → 1` | correct | none |
| §6.6 sketch | `τ(g₀) g₀⁻¹ = u exp(Z)` | applying `τ`: `τ(u) = u⁻¹`, `τ(Z) = −Ad(u) Z`; `exp(τZ/2) u exp(Z/2) = u`; a `τ`-stable coset `U exp(W)` has `τ W = W`, `W ∈ 𝔭`; `⟨iY w, w⟩ = 0` for skew `Y`, real `w` | correct | none |
| §6.6 | rotation; `[[1,1],[0,1]]`; `diag(2, 1/2)` | closed over `ℝ` and `ℂ`; neither; closed, not in `K` | correct | none |
| §6.7 (headline) | `π₁(Σ₂)`, `ρ(a₁)` unipotent; `G`-irreducible `Z` | relator maps to `1`, closure contains the trivial class; a torus of `C_G(Z)` not in `Z(G)` would put `Z` in a proper Levi | consistent | none |
| §7.1 (headline) | `ℤ`, `SL₂(ℝ)`; `F_ℕ`, `ℝ^×`; compact `G^ℝ` | unipotent class no point; `(ℝ^×)^ℕ` not locally compact; `M = V` | correct | none |
| §7.2 (headline) | `ℤ`, `GL_n`; `ℤ/2`, `𝔾_m`, `𝔽₂`; `C₂` on `𝔸²` over `𝔽₂`; properness | `𝔸^{n−1} × 𝔾_m`; `Hom//G = Hom`; `𝔽₂[x + y, xy] → 𝔽₂[x²] ≠ 𝔽₂[x]`; `f(v_n/‖v_n‖) = f(v_n)/‖v_n‖^d → 0`, a unit minimal vector in the null cone | correct | none |
| §7.5, contract (repaired) | `r, s, t, (a⁻¹, b⁻¹)`; `t²` | `(x, y, xy − z)`, `(y, x, z)`, `(tr A⁻¹, tr AB, tr B) = (x, z, y)`, trivial; `t²(b) = a⁻¹ a b = b` | involutions; both directions agree | none |
| §7.5 direction (repaired) | `φ = (a, a⁻¹ b)`, `A = [[1,1],[0,1]]`, `B = [[1,0],[1,1]]` | `φ⁻¹(b) = ab`; `A · AB = [[3,2],[1,1]]`, triple `(2, 3, 4) = (x, z, xz − y)`; `A⁻¹B = [[0,−1],[1,1]]`, triple `(2, 1, 2) = (x, xy − z, y)`; `4+9+16−24−2 = 3 = 4+1+4−4−2` | correct | none |
| Scope, non-descent | "factors through `Out(Γ)` exactly when every homomorphism has abelian image" | same criterion as §1.3; `F₂ → S₃` onto gives a non-example | consistent | none |

Rows of rounds 7–9 that carry computed values and whose text no repair touched (§§2.1, 2.5, 3.3, 4.3,
5.1, 5.2, 6.2, 6.3, 7.3, 7.4) were relied on.

**Shape.** Summary, Scope, Conventions, contracts, build paragraph, seven layers each ending with
Examples and Dependencies, consumers, references. Every definition (§§1.2, 2.1, 3.1, 4.1, 5.1, 6.1,
7.1) has an API list and at least three Checks; `plan.json` has 32 targets with 3 to 6 tests each and
the README's seven layer titles. The 32 *Needs:* lines and the 32 `prerequisites` lists agree item by
item (compared mechanically), and the 17 contract subsections equal the `suppliers` list. Layers 1–3
and 4–6 are independent and Layer 7 uses both; no run of layers follows a source's order.

**Headline theorems, for the package stage.** §7.1 (topology of `𝒳(Γ, G^ℝ)` and the minimal-vector
model), §7.2 (complex comparison, universal Hausdorff quotient), §6.7 (six characterizations), §5.4
(real Kempf–Ness), §§1.3 and 3.5 (non-descent), §7.4 (the actions). At the pins §5.4 and §1.3 are
statable on native carriers; the others lack a carrier (reductive `ℝ`-groups, representation schemes,
mapping class groups) and belong in the module docstring. Padding probe and `#check` comparison: not
applicable, there is no Lean file.

**Duplication audit.** By object, over main and the open heads (`roadmaps grep` for character
varieties, representation schemes, Kempf–Ness, minimal vectors, real reductive data, conjugacy
classes of homomorphisms, ambient isotopy classes). Representation schemes, their quotients and
MCG-finiteness occur in MappingClassGroupsAndCanonicalRepresentations §§1.4, 2.1 for `GL_r`, `ℂ`: kept
variants, each with its clause in the Scope. The integral `F₂`, `SL₂` trace coordinates are
NonabelianLevelStructures', cited. Kempf–Ness occurs on main only in TensorProductCombinatorics (the
projective moment-zero direction, another statement). "Minimal vector" elsewhere means lattice
vectors. The remaining roadmaps that mention character varieties (PainleveEquations,
CountingBundlesAndHallAlgebrasOfCurves, IntegralHeckeAndGaloisDeterminants, InstantonFloerTheory,
GaugeQuiltFieldTheory, GeometricTopology, RealSemisimpleLieGroups) do so in a reference, a Check or
a consumer clause. Not a second copy of a roadmap on main.

Overlap check: read MappingClassGroupsAndCanonicalRepresentations, TeichmullerGeometry, MordellLawrenceVenkatesh, SurfaceTopology, GroupActionsOnRiemannSurfaces, GeometricTopology, BelyiMaps (the third list is empty), and also RealSemisimpleLieGroups and NonabelianLevelStructures; `PMod`, the presentation and the pure Birman sequence are MappingClassGroupsAndCanonicalRepresentations'; `Out(Γ)`, the classification by models and `dehn_nielsen_baer` are TeichmullerGeometry's; `Mod(S)`, `Push` and the Birman sequence are MordellLawrenceVenkatesh's; `Mod(F)` of a compact surface is GeometricTopology's; the real-form bridge is RealSemisimpleLieGroups'; the integral `F₂`, `SL₂` character scheme is NonabelianLevelStructures'; SurfaceTopology (never cited) and BelyiMaps share no object this roadmap owns.

**Copyright.** Wording compared at every locator read above (27 passages) and in six further
passages (Summary; §5.2 statement against BCGGO2024 lines 466–481; §5.4 statement against
BohmLafuente2021 lines 77–88; §6.1 definition against BCGGO2024 lines 2708–2711; §6.4 sketch against
BateMartinRohrle2005 lines 863–869; §7.2 statement against Sikora2012 lines 824–837). The longest
shared run is ten words, in §3.5's description of the remark at LandesmanLitt2024 lines 49–50 (that
the group does not naturally act on the representation variety): a statement of under a dozen words.
§5.4 has five clauses where the source has four, in another order. Arrangement: BCGGO2024 has the
largest share; its nine sections (introduction, magical triples, their classification, real forms,
Higgs bundles, moduli, the Cayley correspondence, positive representations, tables) are not the
seven layers, and it is cited only from its §2.3 (Layer 5) and §8.1 (Layers 4, 6, 7). No table,
figure or list of examples is taken over.

Source independence: 33 passages compared with 5 sources, none shared; largest share BCGGO2024, 12 of 63 locators; contents compared with BCGGO2024: independent. FarbMargalit2012 (11 locators) is waived and was not read.

## Not verifiable

- FarbMargalit2012, Knapp2002, RichardsonSlodowy1990 (waived), Richardson1988, Goldman1984
  (uncertified): cited by locator only; the texts were not read.
- Whether MordellLawrenceVenkatesh §5.1's atlas is a `ChartedSpace` on TeichmullerGeometry's
  half-plane model: both are prose at their heads; the design records the assumption in its contract.
- How MappingClassGroupsAndCanonicalRepresentations §0.2 defines the permutation of the punctures:
  that section does not say; the design records the reading it assumes and §§2.2–2.3 prove that the
  two readings agree.
- Whether ClassifyingSpaces Stage 4 item 17, stated for `BG`, is compatible with the maps of Stage 3
  item 11 for an arbitrary `K(G, 1)` CW complex: prose on main; the contract records it as assumed.
- Elaboration: not available in this lane, and no Lean file exists at the design stage.
- Ownership against the open pull requests was checked with `roadmaps grep` and `roadmaps show` at
  the indexed heads only.

## Source issues

- **Misprint** in Sikora2012 at §11, line 836, printed p. 18: the source refers to a Proposition 30 for the closed-orbit characterization; it should be Theorem 30 (line 572); affects nothing.
- **Error** in BCGGO2024 at §2.3, lines 471–472, printed p. 10: the source says the real form `SO_{p,q}` has two components whenever `p` or `q` is nonzero; it should be whenever both `p` and `q` are nonzero; affects nothing.
- **Gap** in BohmLafuente2021 at Lemma 6.3, line 518, printed p. 11: the source's statement asks only that some limit exists, which `α = 0` satisfies; it should say the limit lies in a closed orbit, as its proof and Theorem 1.1 (ii) give; affects nothing.

## For the human reviewers

- **Not tested.** FarbMargalit2012 carries 11 of the 63 locators (second to BCGGO2024's 12) and is waived: the wording of Layers 1–3 was not compared with its text.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "a9b3eb902d99aef5c66df10db2affa0269539721", "job": "REV-DESIGN-SurfaceGroupCharacterVarieties~10", "model": "fable", "worker": "chris-x30"} -->
