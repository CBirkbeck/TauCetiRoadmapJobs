<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13837#issuecomment-6899581314 -->
Review (claude) of d73ed7a

Verdict: accepted
Conditional on the announced gaps: `gcr-reductive-identity-component`, `borel-tits`

**For the human reviewers:** this review raises 1 question that a human decides (the scope of the roadmap, or a licence). It is in the section of that name at the end and does not change the verdict.

No finding. Both round-10 findings are repaired, the repaired passages survive the adversarial pass,
none of the thirteen maintainer notes holds at this head, and the 15 sampled targets hold against the
readable sources and against the suppliers at their current heads. The acceptance is conditional on
the two declared supplier gaps, `gcr-reductive-identity-component` and `borel-tits`. There is no
`Suggested.lean` at the design stage, and elaboration is `not available (this lane does not
elaborate)`.

## Verified sound

### Round-10 findings (2), each against the current text

- **F01 (§5.4 (iii) weaker than the source): repaired.** `design/README.md` §5.4 now reads "(iii) if
  `G v` is not closed there is `α ∈ 𝔭` such that `w = lim_{t→∞} exp(tα) v` exists and `G w` is
  closed, so that `w ∉ G v`". This is the clause at BohmLafuente2021 lines 81–82. The sketch proves
  (ii) first from a limit in a closed invariant `Y` (Lemma 6.2, BohmLafuente2021 line 504), then
  reruns the argument with `Y = G v̄`, the order of BohmLafuente2021 lines 580–583; it is not
  circular. The fourth Check (`(ℝ_{>0})²` on `ℝ²`) is present, and `plan.json` 5.4 carries the same
  clause, the two new locators and the test `quadrant_limit`. `sources.toml` lists both passages.
- **F02 (§4.2 named the datum of §5.1): repaired.** §4.2 now reads "For an affine group scheme `𝐆`
  of finite type over `ℝ` and an open subgroup `G^ℝ ⊆ 𝐆(ℝ)` (in particular for every real reductive
  datum `(𝐆, G^ℝ)` of the Conventions), prove that …". No Layer 4 statement names a Layer 5 section,
  and `plan.json` 4.2 has the same statement, hypotheses and the test `nonreductive_disconnected`.

Repaired patterns searched in the rest of the design:

- A limit clause without a closed-orbit condition: none. §6.5 and the contract use "a cocharacter
  limit lying in the unique closed orbit"; §§6.6, 7.1 and 7.2 use §5.4 only through (ii), (iv), (v)
  and `G = K T K`.
- A statement naming an object of a later layer: none. `plan.json` has no `target:` prerequisite in
  a later layer (32 targets scanned).

### Maintainer notes (13): none holds at this head

1. Refuted. The contract derives the reading instead of assuming it ("Used: the isotopies of §5.9 …
   are homotopies through homeomorphisms; by §2.1 these are exactly the ambient isotopies").
   MordellLawrenceVenkatesh §5.17 gives `Homeo⁺(S, ∂S)` the compact-open topology.
2. Refuted. Scope and contract give §5.9 the action on finite coverings only, as its Construction
   states it (`f` sends `p` to `f ∘ p`, precomposition with `(f⁻¹)_*` on monodromy). The action on
   `Rep(π₁, H)` is §3.5's own target.
3. Refuted. Conventions, "Notation shared with suppliers", separates `Ψ_x` from the symplectic `Ψ`
   and `Mod^±(X)` from TeichmullerGeometry §3.1's `Mod±(Σ)`, with the torus witness.
4. Refuted. The contract, the *Needs:* lines and `plan.json` name the same ten sections (§§5.1, 5.4,
   5.5, 5.6, 5.9, 5.15, 5.17, 5.19, 5.20, 5.22). The Scope's longer ranges and TeichmullerGeometry
   §0.0d are deferrals, not consumption; no target uses §0.0d.
5. Refuted. `Mod_{1,0} ≅ SL₂(ℤ)` is cited to TeichmullerGeometry §5.4a (`mcg_torus_full`) in the
   Layer 2 Examples; §5.22 is cited only for surjectivity.
6. Refuted. The contract states §5.4 in its connected-sum form with the `(g, b, n)` criterion; the
   polygon model is §2.4's own target on TeichmullerGeometry §0.0f.
7. Refuted. "5.23" occurs only inside the Scope's range; no "case `n = 1`" is claimed.
8. Refuted. The contract says orientability is invariant under homeomorphisms and the genus is
   constant "by its definition", which is what TeichmullerGeometry §0.0f states.
9. Refuted. §4.3 is cited for the attaching word, the relator and the native comparison only; the
   reflection is built in §3.4 on §0.0f's realization.
10. Refuted. The consumers list does not name GroupActionsOnRiemannSurfaces; the Scope only
    describes its §3.4, which at its head uses MordellLawrenceVenkatesh §5.9.
11. Refuted. §2.1 states how `Mod^±(X)` differs from `MappingClassGroupFull X`, gives the comparison
    map, and names GeometricTopology Layer 1.7.2 as "the owner of the mapping class groups of
    compact surfaces".
12. Refuted. §3.4 says the subgroup is the one TeichmullerGeometry §5.4 writes `Out⁺(Π)` and that
    "its description by the action on `H₂` is stated here"; TeichmullerGeometry §5.4 still does not
    define `Out⁺`.
13. Refuted. §§3.2–3.3 cite MordellLawrenceVenkatesh §5.19 for `Push` and its formula and derive
    only the identification with `f_{const}`.

### Principles

- No route-specific shortcut, re-planned roadmap, copied passage, algorithm, `set_option`, sorry'd
  data or Lean file.
- No roadmap of the never-cite list is cited.
- Greps for LaTeX delimiters, pull-request numbers, round labels, job ids, machine paths and
  "optional/deferred/removed/currently/so far" find nothing; the "lemma" hits are prose
  ("Schreier's lemma", "inner-automorphism lemma").
- The layers are named by their mathematics; no sentence says the roadmap follows a source.

### Supplier order

Gate output:

```text
candidate: SurfaceGroupCharacterVarieties is not in the merge order yet; checked as if placed after NonabelianLevelStructures (the intake inserts it when its design is accepted)
depcheck: 246 roadmaps, 2250 edges, 0 problem(s)
```

No UPWARD or CYCLE line. RealSemisimpleLieGroups is not in the merge order and not on main: it is
another author's open pull request adding a new roadmap folder, an allowed supplier.

The overlaps file lists no pull request changing this roadmap, no dropped id, no id only a revision
defines and no second copy. `roadmaps grep` finds no roadmap citing SurfaceGroupCharacterVarieties.

The four "Lean names found nowhere" of the citations file (`StandardSurface.eulerChar_model`,
`StandardSurface.isSurface_model`, `StandardSurface.homeomorph_unique`, `Surface.IsOrientable`) are
TeichmullerGeometry's, cited in its contract subsection: the first three are declared in its
`Suggested.lean` at its open head (lines 311, 301, 317) and all four are in its README §0.0f. They
are not claims about this roadmap's own file.

### Supplier citations resolved this round (headings and content read at each head)

- **MordellLawrenceVenkatesh** (open head). §§5.1, 5.4, 5.5, 5.6, 5.9, 5.15, 5.17, 5.19, 5.20, 5.22
  exist under those numbers in Layer LV.5.
  - §5.4: connected sum for a unique `g`; same type `(g, b, n)` iff orientation-preserving
    homeomorphic.
  - §5.5: `î` alternating, perfect for `∂S = ∅`, invariant under orientation-preserving
    homeomorphisms. §5.6: `H₁ ≃ ℤ^(2g)` for `b + n = 0`.
  - §5.9: the covering action and `(f⁻¹)_*`; `Mod_{0,3} = Sym(3)` with trivial pure subgroup.
  - §5.17: compact-open topology. §5.19: `γ ↦ α * γ * α⁻¹`, `Forget(Push α) = 1`.
  - §5.20: exactness for `χ(S) < 0`. §5.22: surjectivity for `g ≥ 1`.
- **TeichmullerGeometry** (open head).
  - §0.0b: `image_boundary`, Radó. §0.0e: compatible smoothing, comparison of the two models.
  - §0.0f: `schemaRealization`, canonical words, `classification_of_surfaces`, `Surface.genus` "the
    genus of the standard model homeomorphic to `M`", `Surface.IsOrientable` invariant.
  - §0.0h: `isotopicToIdSubgroup`, `MappingClassGroupFull`, the forgetful isomorphism for closed
    surfaces.
  - §4.2: `OuterAut`, `innerAut_normal`, `ι`. §4.3: relator `∏ [aᵢ, bᵢ]`. §§4.4, 4.5, 6.1 exist.
  - §5.4: `dehn_nielsen_baer` with the hypotheses and value the contract states.
  - §5.4a: `mcg_sphere_full`, `mcg_torus_full`, with `torusLinearHomeomorph A` acting by
    `(x, y) ↦ (ax + by, cx + dy)`, the column reading of the Conventions.
- **MappingClassGroupsAndCanonicalRepresentations** (open head). §0.1 (inversion of the handle
  generators, rank `2g + b + p − 1`), §0.2 (kernel of the permutation action, index `p!`), §0.3,
  §1.4, §2.1.
- **NonabelianLevelStructures** (open head). §5.1 (`integral_trace_coordinates`), §5.2 (right
  precomposition, an anti-homomorphism; `r, s, t` as the contract lists them).
- **RealSemisimpleLieGroups** (open head). §2.5 (`τ` is the conjugation of a connected reductive
  real form; Cartan involutions for `τ`).
- **Other open heads.** LanglandsParameterStacks §2.2 (reducible and nonreduced schemes).
  ArithmeticGaloisRepresentations §1.7 **Semisimplicity over a perfect field** and §1.11's two named
  paragraphs. ComplexComparisonPartII §C-1.1. ArithmeticLocallySymmetricSpaces §§ALS.F.1, ALS.0.1.
  GroupActionsOnRiemannSurfaces §3.4. InverseGaloisAndArithmeticFundamentalGroups §IG.3.2.
- **On main.** AlgebraicTopology §§4.2, 4.3 ("Stage 4 items 1–8 are §§4.1–4.8"). ClassifyingSpaces
  Stage 3 items 11, 15 and Stage 4 item 17. ReductiveGroups Layers 0–7 with 3A.2, 3A.4.
  ReductiveGroupsPartII §§RG2.0.1, RG2.0a.2. FreeGroupsAndLimitGroups §§6.1 (`S⁺(g, m)`,
  `[x, y] = x⁻¹ y⁻¹ x y`, `SurfaceGroup.lift`), 6.2. GeometricTopology Layer 1.7.2 ("the single
  owner"). LieGroups Layer 9 (**Restricted roots and KAK**, `kakDecomposition`).
  HamiltonianReduction R5.

### Declared gaps

- `gcr-reductive-identity-component` (ArithmeticGaloisRepresentations §1.11) and `borel-tits`
  (ReductiveGroups Layer 7).
- Each `needs` is one sentence with its hypotheses (closed subgroup, connected reductive group,
  algebraically closed field).
- Each slug is in `plan.json`, in §6.4's *Needs:* and under the supplier's contract subsection as
  "What … must provide (gap:…)".
- Neither supplier states the result at its head: a grep of ReductiveGroups for Borel–Tits and of
  ArithmeticGaloisRepresentations for reductivity of the identity component finds nothing.
- Borel–Tits on the trivial `U` gives `P = G`, `R_u(G) = 1`: no degenerate failure.

### Library declarations opened at the pins

- **Tau Ceti.**
  - `AmbientIsotopy` (`Topology/Homotopy/Isotopy/Basic.lean:163`), `trans` (`:328`), `symm`
    (`:368`), `finalHomeomorph` (`:234`), `Isotopic` (`:114`).
  - `AmbientIsotopy.conj`, `finalHomeomorph_conj` (`Topology/Homotopy/AmbientIsotopyConj.lean:110,
    131`).
  - `AmbientIsotopic`, `.isotopic`, `.setoid` (`Topology/Homotopy/AmbientIsotopic/Basic.lean:58, 94,
    103`).
  - `isotopic_iff_ambientIsotopic` (`Topology/Homotopy/Isotopy/Compact.lean:123`, namespace
    `TauCeti`).
  - `Continuous.isOpenEmbedding_of_injective`
    (`AlgebraicTopology/Singular/InvarianceOfDomain.lean:201`, with `finrank ℝ E = finrank ℝ F`).
  - `ConnectedCoveringSpace.monodromyEquivalence`, `FundamentalGroupoidAction.basepointMulAction`
    (`AlgebraicTopology/UniversalCover/Classification/MonodromyEquivalence.lean:158, 93`).
  - `isPreconnected_iInter_of_directed` (`Topology/Continuum.lean:69`, `[T2Space X] [Nonempty ι]`;
    it does not give nonemptiness, which §2.2 takes from compactness).
  - `PointTopology.topology`, `instTopologicalSpaceWithConv`
    (`Topology/Algebra/PointTopology/Basic.lean:83, 110`).
  - `Coalgebra.IsLinearlyReductive` (`Algebra/Coalgebra/Comodule/LinearlyReductive.lean:249`),
    `Comodule.Hom.fixedMap_surjective_of_isLinearlyReductive` (`…/LinearlyReductive/Fixed.lean:184`).
  - `ContRepresentation.IsUnitary.isSemisimpleRepresentation`
    (`RepresentationTheory/Continuous/InvariantComplement.lean:190`).
  - `Matrix.SpecialLinearGroup.trace_commutatorElement_fin_two`
    (`LinearAlgebra/Matrix/Trace/FinTwo.lean:231`).
- **Mathlib.**
  - `FundamentalGroup.mul_def` (`AlgebraicTopology/FundamentalGroupoid/FundamentalGroup.lean:44`,
    `p * q = .of (q.asHom.trans p.asHom)`), `fundamentalGroupMulEquivOfPath` (`:48`), `map` (`:79`),
    `mapOfEq` (`:85`).
  - `homotopicMapsNatIso` (`…/InducedMaps.lean:67`), `MulAut.congr` (`Algebra/Group/End.lean:745`).
  - `QuotientGroup.congr` (`GroupTheory/QuotientGroup/Defs.lean:397`), `quotientKerEquivRange`
    (`GroupTheory/QuotientGroup/Basic.lean:134`).
  - `Subgroup.fg_of_index_ne_zero` (`GroupTheory/Schreier.lean:166`).
  - `groupHomology` (`RepresentationTheory/Homological/GroupHomology/Basic.lean:226`),
    `IsSemisimpleRepresentation` (`RepresentationTheory/Semisimple.lean:34`).
  - `ProperSMul`, `t2Space_quotient_mulAction_of_properSMul`
    (`Topology/Algebra/ProperAction/Basic.lean:55, 113`).
  - `Opens.instChartedSpace` (`Geometry/Manifold/HasGroupoid.lean:284`),
    `ContinuousMap.compactOpen` (`Topology/CompactOpen.lean:51`).

### Sources, seeded sample (15 targets)

The author flags no locator as unverified.

- §1.2: LandesmanLitt2024 line 42 (conjugacy classes of representations). Holds.
- §§2.1, 2.4, 3.2: FarbMargalit2012 only (waived, not read); the mathematics is in the table.
- §3.3: LandesmanLitt2024 lines 41–42 (the outer action). Holds. FarbMargalit2012 not read.
- §4.3: BCGGO2024 lines 2706–2708 (the space `Hom(π₁Σ, G^ℝ)` with conjugation), the locator of the
  object. Holds.
- §5.1: BCGGO2024 lines 466–472 (real forms, possibly disconnected). Holds. Knapp2002 waived.
- §5.2: BCGGO2024 lines 466–481 (real form as an antiholomorphic involution; Cartan involution as a
  holomorphic involution commuting with `τ` with compact `στ`). Holds.
- §5.3: BohmLafuente2021 lines 52–62 (closed `G ⊂ GL(V)` with `G = K · exp(𝔭)`), line 193 (normal
  matrices). Hold.
- §6.1: BCGGO2024 lines 2708–2711. Holds.
- §6.2: Sikora2012 lines 262–266. Holds.
- §6.4: BateMartinRohrle2005 lines 263–264, Lemma 2.6 at 267, Theorem 3.46 at 861 (proof 863–870);
  Sikora2012 line 228. Hold.
- §6.5: Sikora2012 lines 572–586 (Theorem 30); BateMartinRohrle2005 Corollary 3.7 at 510. Hold.
  Richardson1988 uncertified.
- §6.6: RichardsonSlodowy1990 only (waived).
- §6.7: BCGGO2024 lines 2708–2713; BateMartinRohrle2005 Proposition 2.13 at 379, Lemma 2.12(i) at
  355; Sikora2012 lines 363–364 (Corollary 17). Hold.
- Repaired §5.4, in full: BohmLafuente2021 Theorem 1.1 at 77–88, Lemma 5.1 at 417, Corollary 5.5 at
  445, Lemma 6.2 at 504, Lemma 6.3 at 518, Corollary 6.4 at 562, Lemma 6.5 at 568, proof of (ii) at
  580–583, Corollary A.2 at 1050, examples at 172–176 and 179–193. All at their lines.
- Also read: Sikora2012 lines 268 (Corollary 9), 823–837, 844–845; BateMartinRohrle2005 lines
  183–187, 814–815; BCGGO2024 lines 2714–2726; LandesmanLitt2024 lines 473–475. All hold.

All ten cited works are in the manifest; every README locator lies inside its manifest locator; the
manifest has no local path. Nothing was fetched and no `needs-references.toml` was written.

### Adversarial table (sampled targets, repaired passages, headlines)

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §1.1 transport | `e = conj g` | `e φ e⁻¹(x) = g φ(g)⁻¹ φ(x) φ(g) g⁻¹`; `φ ∘ conj h` with `φ(h) = g φ(g)⁻¹`, `h = φ⁻¹(g) g⁻¹` | formula of the sketch | none |
| §1.1 Check | `Q₈`, `v ∈ V₄ ⊂ S₄` | `v x v⁻¹ V₄ = x (x⁻¹ v x) v⁻¹ V₄ = x V₄`; `24/4 = 6` | trivial on `Out`, not on `MulAut` | none |
| §1.2 | `Rep(ℤ, S₃)`; `Rep(ℤ/2, GL₂(ℂ))`; `Rep(1, H)`; `H = 1` | `3` classes of `6` homomorphisms; `diag(1,1), diag(1,−1), diag(−1,−1)`; one point; one point | correct | none |
| §1.3 | `F₂`, `ρ = id`; abelian `H` | `conj a · id = conj a⁻¹ ≠ id`; `c_γ · ρ = ρ` iff `ρ(γ)` centralizes `ρ(Γ)` | iff both ways | none |
| §2.1 path component | path `f_t` in the `(f, f⁻¹)` topology | uncurries to `(t, x) ↦ f_t(x)`, `f_t⁻¹(x)` continuous; total map has inverse `(t, y) ↦ (t, f_t⁻¹ y)` | correct for locally compact Hausdorff `X` | none |
| §2.1 Checks | `ℝ`; two points; `S¹`; `S² ⊔ S²` | `2`; `2`; `2`; `2 · 2 · 2 = 8`, orientation-preserving `{1, swap}`, index `4` | connectedness needed | none |
| §2.2 | `[0, 1]`, `{0}`; `S¹`, one point; isolated `p` | `(0, ε]` connected, every homeomorphism of `(0, 1]` fixes `1` and extends; `U ∖ {p}` two arcs, hypothesis fails; `U ∖ {p} = ∅` excluded | hypothesis discriminates | none |
| §2.2 isotopy | connected subset of `I × P` meeting every slice | lies in one `I × {q}`, equals it; `q = p` at `t = 0` | correct | none |
| §2.4 | `a b a⁻¹ b⁻¹`; `a a b b`; `a a⁻¹`; hole block | `d₂ = 0`, `H₁ = ℤ²`, `H₂ = ℤ`; `d₂ = 2a + 2b`, `H₂ = 0`; `d₁(a) = v₁ − v₀`, `H₁ = 0`; `d₂ ∋ h_j`, `H₂ = 0` | `H₂ = ℤ` only for `orientable g' 0`, then `rank H₁ = 2g'` | none |
| §2.5 Check | conjugation by `diag(1, −1)` on `SL₂(ℤ)` | inner by `h` would make `h⁻¹ diag(1, −1) = ±1`, of determinant `1 ≠ −1` | outer | none |
| §3.1 laws | change of path; composition; inverse | `(δ' δ̄)(δ fγ δ̄)(δ δ̄') = δ' fγ δ̄'`; `δ ⬝ fε ⬝ fgγ ⬝ (fε)‾ ⬝ δ̄`; `id_{δ ⬝ δ̄} = 1` | correct | none |
| §3.2 | `f = id`, `g = f`, track `η`; push | `f_η = id_{const} = 1`, `f_δ = conj[η ⬝ δ̄]`; `f_{const} = conj[α]`: `ᾱ ⬝ γ ⬝ α`, the reading of MordellLawrenceVenkatesh §5.19 | correct | none |
| §3.3 | shear on `T²`; `[0, 1]`; `S¹` | `(1,0) ↦ (1,1)`, `(0,1) ↦ (0,1)`: columns `[[1,0],[1,1]]`, as `torusLinearHomeomorph`; flip not isotopic to `1`, `π₁ = 1`; `ℤ/2 ≅ Out(ℤ)` | well defined; not injective in general | none |
| §3.4 reflection | `z ↦ e^{2πi/g} z̄`, arc `j`, parameter `t` | angle `(j + t) ↦ 4 − j − t = (3 − j) + (1 − t)`; `(4i, t) ∼ (4i+2, 1−t)` goes to `(4j+3, 1−t) ∼ (4j+1, t)`, `j ≡ −i` | respects the gluing | none |
| §3.5 | `Rep(F₂, S₃)`; `Push(a)`; unipotent `ρ_f` | `(36 + 12 + 18)/6 = 11`; `(1 2)(2 3)(1 2) = (1 3)`; `ρ_f ∼ ρ_{f'}` iff `f' ∈ ℂ^× f` | correct | none |
| §4.1 | `ℤ/2`, `𝔾_m`, `𝔽₂`; `ℤ`; trivial `Γ` | `t² − 1 = (t − 1)²`; `G`; `Spec k` | correct | none |
| §4.2 (repaired) | `𝔾_a`, `ℤ/2`; `μ₂`, `ℤ`; `F_∞`, `ℝ_{>0}` | `ℝ[t]/(2t) = ℝ`, point `0`; `{±1}` fixed, `{1}` clopen; `(ℝ_{>0})^ℕ` not open in `(ℝ^×)^ℕ` | holds; finite `S` needed and in scope | none |
| §4.3 | `(0,0)`; `(0,1)`; `(0,2)`; `(1,1)`; `(1,0)` | point; `G⁰`, `π₁ = 1`; `G`; `G²`; commuting pairs | correct | none |
| §5.1 | `SO(1,1)`; `Res_{ℂ/ℝ} GL_n`; `𝔾_a` | `ℝ^×`, two components; `dim_ℝ = 2n²`, connected; excluded | correct | none |
| §5.2 Checks | `τ(g) = J ḡ J⁻¹`; `(𝔾_m, inv)`; `z ↦ 2/z̄` | `τ² = J² g J⁻² = g`; fixed `[[a, −b̄],[b, ā]]`; `inv ∘ conj ∘ inv = conj`, `α = inv`; `1 ↦ 2`, fixed set `abs(z)² = 2` | correct | none |
| §5.2 uniqueness | `f = w₁ + i w₂`, `wⱼ ∈ W ⊆ F` | `f − w₁ = i w₂ ∈ F ∩ iF = 0` | `W = F` | none |
| §5.3 | open `G^ℝ ⊆ 𝐆(ℝ)`; `SO(2)` conjugated by `u` | `G^ℝ = (G^ℝ ∩ K) exp(𝔭)`, stable under `g ↦ (gᵀ)⁻¹`; image `[[c+s, −2s],[s, c−s]]`, columns `1 + s(2c+s)`, `1 + 2s(2s−c)`, `s = −4s`, `K = {±1}` | correct | none |
| §5.4 (i), (iv) | `G = 1`; finite `G ⊂ O(V)`; minimizer `v̄` of a closure | `M = V`; `M = V`; `G v̄` closed by (ii), the unique closed orbit | correct | none |
| §5.4 (iii) (repaired) | `(ℝ_{>0})²`, `v = (1,1)`; `ℝ_{>0}` on `ℝ` | `diag(a, b)`: limit iff `a, b ≤ 0`, closed orbit iff `a, b < 0`; `diag(−1, 0) ↦ (0, 1)`, orbit `{0} × ℝ_{>0}` not closed; `α = −1 ↦ 0` | source's clause | none |
| §5.4 sketch (repaired) | minimal `v`, `α ∈ 𝔭` with a limit | `Σ λᵢ ‖vᵢ‖² = 0` and `vᵢ = 0` for `λᵢ > 0` give `v ∈ ker α`, limit `v ∈ G v`, not in `Y` | (ii) before (iii) | none |
| §6.1 | `[[1,1],[0,1]]`; `diag(2, 3)`; torus | `Ad` unipotent, not semisimple; eigenvalues `1, 1, 2/3, 3/2`; `Ad = 1` | correct | none |
| §6.2 | rotation; `B ⊗ k'`; `W_ℝ ⊗ ℂ` | irreducible over `ℝ`, two characters over `ℂ`; `rad(B) ⊗ k'` nilpotent; `W ⊕ W̄` | descent always, ascent for perfect `k` | none |
| §6.3 | `Z ⊆ Z(G)`; unipotent `Z`; `N(T)` | `Ad = 1`, `Z⁰` a torus; `Ad` nontrivial unipotent; `Z⁰ = T` | iff | none |
| §6.4 | Borel of `SL₂`; `N(T)` | centralizer `{±1}`, `R_u ≠ 1`; no fixed line, completely reducible | correct, conditional on the gaps | none |
| §6.5 | `F₂`, `(diag(2, 1/2), [[1,1],[0,1]])` | conjugate by `diag(t, t⁻¹)`: `[[1, t²],[0, 1]] → 1`, limit outside the orbit | correct | none |
| §6.6 | `exp(Y) = u' exp(Z/2) g₀`, `Y ∈ 𝔭` | `exp(Y) ∈ (G^ℝ)⁰`; `exp(Y) ρ` real and minimal for `G(ℂ)`, so for `G^ℝ` | correct | none |
| §6.7 (headline) | torus `G`; `π₁(Σ₂)`, `ρ(a₁)` unipotent | no proper parabolic, centralizer `G = Z(G)`; relator `↦ 1`, closure contains the trivial class | consistent | none |
| §7.1 (headline) | `ℤ`, `SL₂(ℝ)`; `F_ℕ`, `ℝ^×`; compact `G^ℝ` | unipotent class is no point; `(ℝ^×)^ℕ` not locally compact; `M = V` | correct | none |
| §7.2 (headline) | `ℤ/2`, `𝔾_m`, `𝔽₂`; `C₂` on `𝔸²` over `𝔽₂` | `Hom//G = Hom`; `𝔽₂[x + y, xy] → 𝔽₂[x²] ≠ 𝔽₂[x]` | closed immersion needs linear reductivity | none |
| §7.3 | `ℤ/2 ↞ ℤ`; `⟨a⟩ ≤ F₂` | classes of order dividing two, closed; restriction unipotent, not reductive | correct | none |
| §7.5 | `(2, 2, 3)` | `4 + 4 + 9 − 12 − 2 = 3`; Vieta `(2, 2, 1)`: `4 + 4 + 1 − 4 − 2 = 3` | invariant | none |
| Conventions, Cartan | `diag(t, t⁻¹)` on `[[1,1],[0,1]]` | `[[1, t²],[0, 1]]`, squared norm `2 + t⁴ → 2` | correct | none |

### Shape

- Summary, Scope, Conventions, contracts, build paragraph, seven layers each ending with Examples and
  Dependencies, consumers, references.
- Every definition (§§1.2, 2.1, 3.1, 4.1, 5.1, 6.1, 7.1) has an API list and at least three Checks.
- `plan.json` has 32 targets with 3 to 6 tests each and the README's seven layer titles; its 17
  suppliers equal the 17 contract subsections.
- Layers 1–3 and 4–6 are independent and Layer 7 uses both; no run of layers follows a source's
  order.

### Headline theorems, for the package stage

- §7.1 (topology of `𝒳(Γ, G^ℝ)` and the minimal-vector model), §7.2 (complex comparison, universal
  Hausdorff quotient), §6.7 (six characterizations), §5.4 (real Kempf–Ness), §§1.3 and 3.5
  (non-descent), §7.4 (the actions).
- At the pins §5.4 and §1.3 are statable on native carriers. The others lack a carrier (reductive
  `ℝ`-groups, representation schemes, mapping class groups) and belong in the module docstring.
- Padding probe and `#check` comparison: not applicable, there is no Lean file.

### Duplication audit

By object, over main and the open heads (`roadmaps grep` for character varieties, representation
schemes, Kempf, minimal vectors, ambient isotopy classes, conjugacy classes of homomorphisms,
Dehn–Nielsen).

- Representation schemes, their quotients and MCG-finiteness occur in
  MappingClassGroupsAndCanonicalRepresentations §§1.4, 2.1 for `GL_r` over `ℂ`: kept variants, each
  with its clause in the Scope.
- The integral `F₂`, `SL₂` trace coordinates are NonabelianLevelStructures', cited.
- Kempf occurs elsewhere as the Hilbert–Mumford–Kempf criterion (LanglandsParameterStacks) and the
  projective moment-zero direction (TensorProductCombinatorics): other statements.
- "Minimal vectors" elsewhere are lattice vectors.
- MordellLawrenceVenkatesh §5.9 mentions conjugacy classes of homomorphisms in one clause of its
  Construction and states no target on them. The maintainer's notes record this roadmap as the owner
  of the action on `Hom(Γ, H)/H`.
- The remaining mentions of character varieties are a reference, a Check or a consumer clause.
- Not a second copy of a roadmap on main.

Overlap check: read MappingClassGroupsAndCanonicalRepresentations, TeichmullerGeometry, MordellLawrenceVenkatesh, SurfaceTopology, GroupActionsOnRiemannSurfaces, GeometricTopology, BelyiMaps (the third list is empty), and also RealSemisimpleLieGroups and NonabelianLevelStructures; `PMod`, the presentation and the pure Birman sequence are MappingClassGroupsAndCanonicalRepresentations'; `Out(Γ)`, the classification by models and `dehn_nielsen_baer` are TeichmullerGeometry's; `Mod(S)`, `Push` and the Birman sequence are MordellLawrenceVenkatesh's; `Mod(F)` of a compact surface is GeometricTopology's; the real-form bridge is RealSemisimpleLieGroups'; the integral `F₂`, `SL₂` character scheme is NonabelianLevelStructures'; SurfaceTopology (never cited), GroupActionsOnRiemannSurfaces and BelyiMaps share no object this roadmap owns.

### Copyright

- **Wording.** Compared at every locator read above (27 passages) and in five further passages:
  §5.2 statement against BCGGO2024 lines 466–481; §5.4 statement and sketch against
  BohmLafuente2021 lines 77–88 and 578–583; §6.1 definition against BCGGO2024 lines 2708–2711; §6.4
  sketch against BateMartinRohrle2005 lines 863–870; §7.2 statement against Sikora2012 lines
  824–837. The longest shared run is ten words, in §3.5's description of the remark at
  LandesmanLitt2024 lines 49–50: a statement of under a dozen words. The repaired clause (iii) of
  §5.4 is a one-line statement the mathematics forces; §5.4 has five clauses where the source has
  four, in another order.
- **Arrangement.** BCGGO2024 has the largest share. It is cited only from its §2.3 (Layer 5) and
  §8.1 (Layers 4, 6, 7); its sections are not the seven layers.
- **Reuse.** No table, figure or list of exercises is taken over. The two examples of §5.4 that
  carry BohmLafuente2021 locators are stated as Checks beside two of the roadmap's own.

Source independence: 32 passages compared with 5 sources, none shared; largest share BCGGO2024, 12 of 63 locators; contents compared with BCGGO2024: independent. FarbMargalit2012 (11 locators) is waived and was not read.

## Not verifiable

- FarbMargalit2012, Knapp2002, RichardsonSlodowy1990 (waived), Richardson1988, Goldman1984
  (uncertified): cited by locator only; the texts were not read.
- Whether MordellLawrenceVenkatesh §5.1's atlas is a `ChartedSpace` on TeichmullerGeometry's
  half-plane model: both are prose at their heads; the contract records the assumption.
- How MappingClassGroupsAndCanonicalRepresentations §0.2 defines the permutation of the punctures:
  that section does not say; the contract records the reading and §§2.2–2.3 prove that the two
  readings agree.
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

<!-- tauceti-roadmap-review {"agent": "claude", "head": "d73ed7ac2c368a29f56486bbdfd7473afc869f48", "job": "REV-DESIGN-SurfaceGroupCharacterVarieties~11", "model": "fable", "worker": "chris-x79"} -->
