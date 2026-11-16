<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/17370#issuecomment-6904449172 -->
Red team round 1 pass a (claude) of f78c7d9

Verdict: needs_changes

**For the human reviewers:** this review raises 1 question that a human decides (the scope of the roadmap, or a licence). It is in the section of that name at the end and does not change the verdict.

1. **F01** (P2) the invariant subalgebra and its finiteness exist at the pin; the package says the pins have no affine quotient and plans them again

   **Location.**
   - `packages/SurfaceGroupCharacterVarieties/README.md:393-396`: "the pins have no genus of a
     topological surface, … no `G`-complete reducibility and no affine quotient."
   - `packages/SurfaceGroupCharacterVarieties/README.md:1980-1988` (§7.2): "define
     `Hom(Γ, G)//G := Spec O(Hom(Γ, G))^G`, the coaction invariants … Prove that every `G`-invariant
     morphism … factors uniquely through the quotient map".
   - `packages/SurfaceGroupCharacterVarieties/Suggested.lean:57-58`: "the pins have neither the
     representation scheme `Hom(Γ, G)` … nor the affine quotient `Spec O(X)^G`".

   **Claim.** The pinned libraries have no invariant ring `O(X)^G` of an affine group action, so §7.2
   defines it, proves its universal property, and takes its finite generation in characteristic zero
   from a sibling.

   **Witness.** Pinned Tau Ceti, `Algebra/Bialgebra/ComoduleAlgebra.lean`: class
   `TauCeti.ComoduleAlgebra` (line 88), `TauCeti.ComoduleAlgebra.coinvariants : Subalgebra R A`
   (line 136), `range_le_coinvariants_iff` (line 171);
   `Algebra/Bialgebra/ComoduleAlgebra/LinearlyReductive.lean:148`, `finiteType_coinvariants`.

   What the pin does and does not give (read at the pin):
   - `coinvariants R H A` is the subalgebra of `a` with `coact a = a ⊗ 1`, for a **right** comodule
     algebra `A` over a bialgebra `H`; it is `Spec`-free (an algebra, not a scheme).
   - `range_le_coinvariants_iff` is the universal property of §7.2's first "Prove" clause: an algebra
     map into `A` lands in the coinvariants exactly when it is invariant.
   - `finiteType_coinvariants` gives finite generation for a finite-type commutative comodule algebra
     over a field and a linearly reductive `H` (`TauCeti.Coalgebra.IsLinearlyReductive`), which with
     the already cited `TauCeti.reductiveCommHopfAlgProperty.linearlyReductive` is §7.2's finite
     generation in characteristic zero.
   - It does not give: finite generation in positive characteristic, closed images and separation of
     invariant closed subsets, the unique closed orbit in a fibre (these stay with
     LanglandsParameterStacks §2.2), or the representation algebra of a finitely generated group with
     its conjugation coaction (this roadmap's §4.1).

   The headline "`𝒳(Γ, G(ℂ)) ≅ (Hom(Γ, G)//G)(ℂ)`" stays not statable, but for one reason, not two:
   only the representation algebra with its conjugation comodule-algebra structure is missing.

   **Repair.**
   1. `README.md`, `### From Tau Ceti`, after the sentence on
      `TauCeti.Comodule.Hom.fixedMap_surjective_of_isLinearlyReductive`, add:
      "`TauCeti.ComoduleAlgebra` (a right comodule algebra `A` over a bialgebra `H`, the coordinate
      form of a right action of `Spec H` on `Spec A`), `TauCeti.ComoduleAlgebra.coinvariants` (the
      subalgebra of `a` with `coact a = a ⊗ 1`) and `TauCeti.ComoduleAlgebra.range_le_coinvariants_iff`
      (an algebra map into `A` has image in the coinvariants exactly when it is invariant),
      `Algebra/Bialgebra/ComoduleAlgebra.lean`; `TauCeti.ComoduleAlgebra.finiteType_coinvariants`
      (over a field, the coinvariants of a finite-type commutative comodule algebra over a linearly
      reductive bialgebra are of finite type), `Algebra/Bialgebra/ComoduleAlgebra/LinearlyReductive.lean`."
   2. `README.md:393-396`: replace "and no affine quotient" by "and no representation algebra of a
      finitely generated group; the invariant subalgebra of a comodule algebra is
      `TauCeti.ComoduleAlgebra.coinvariants`".
   3. `README.md` §7.2, first sentence: replace "define `Hom(Γ, G)//G := Spec O(Hom(Γ, G))^G`, the
      coaction invariants of §4.1's conjugation action" by "make `O(Hom(Γ, G))` a
      `TauCeti.ComoduleAlgebra` over `O(G)` by the coaction of the right action `ρ · g = g⁻¹ ρ g`
      (§4.1), and define `Hom(Γ, G)//G := Spec` of
      `TauCeti.ComoduleAlgebra.coinvariants k O(G) O(Hom(Γ, G))`"; replace "Prove that every
      `G`-invariant morphism from `Hom(Γ, G)` to an affine `k`-scheme factors uniquely through the
      quotient map" by "Every `G`-invariant morphism from `Hom(Γ, G)` to an affine `k`-scheme factors
      uniquely through the quotient map (`TauCeti.ComoduleAlgebra.range_le_coinvariants_iff`)"; after
      "so LanglandsParameterStacks §2.2 gives:" add "(in characteristic zero the finite generation is
      the pinned `TauCeti.ComoduleAlgebra.finiteType_coinvariants`)". Add the three pinned names to
      §7.2's `*Needs:*` line and to Layer 7's Dependencies.
   4. Add to §7.2's Checks the convention witness: "for `G = 𝔾_m` acting on `𝔸¹` by scaling,
      `coact x = x ⊗ t` and the coinvariants are `k`; for the conjugation action of a commutative `G`
      the coaction is `a ↦ a ⊗ 1` and the coinvariants are all of `O(Hom(Γ, G))` (the `𝔽₂` Check
      above)".
   5. `Suggested.lean:56-60`: replace "the pins have neither the representation scheme `Hom(Γ, G)` of
      a finitely generated group as an affine scheme nor the affine quotient `Spec O(X)^G`" by "the
      pins have the invariant subalgebra of a comodule algebra
      (`TauCeti.ComoduleAlgebra.coinvariants`) but not the representation algebra of a finitely
      generated group with its conjugation coaction, a construction of this roadmap (Layer 4.1)".

   Tested on the refuting instance: after the repair every README sentence about `O(X)^G` names the
   pinned declaration, and the only carrier the docstring calls missing (the representation algebra)
   is absent from the pinned Mathlib and Tau Ceti (no hit for a representation scheme or variety in
   either).

2. **F02** (P3) `Fuch` names one component here and both components in the source cited for it

   **Location.** `packages/SurfaceGroupCharacterVarieties/README.md:2143-2147`: "the classes of
   discrete faithful representations of Euler number `2 − 2g` form a subset `Fuch` of
   `𝒳(π₁(Σ_g), PSL₂(ℝ))` in bijection with `Teich(Σ_g)` … (BCGGO2024 lines 2714–2726, Example 8.2)".

   **Claim.** The set called `Fuch`, as in the cited example, is in bijection with `Teich(Σ_g)`.

   **Witness.** BCGGO2024 lines 2714–2718: there `Fuch(PSL₂ℝ)` is all classes of discrete faithful
   representations, two components, matching Teichmüller space for either orientation. The README's
   `Fuch` is one of the two; the citation supports the bijection only for the pair.

   **Repair.** Replace "form a subset `Fuch` of `𝒳(π₁(Σ_g), PSL₂(ℝ))` in bijection with
   `Teich(Σ_g)`" by "form a subset `Fuch⁺` of `𝒳(π₁(Σ_g), PSL₂(ℝ))`, one of the two components of
   BCGGO2024's `Fuch(PSL₂ℝ)` (Example 8.2, lines 2714–2718), in bijection with `Teich(Σ_g)`", and in
   the Layer 7 Examples (`README.md:2186`) replace "The Fuchsian locus of §7.4" by "The locus `Fuch⁺`
   of §7.4". Tested: with Euler number `2 − 2g` on `Fuch⁺` and `2g − 2` on its reflection-conjugate
   (TeichmullerGeometry §4.4's sign Check), the union is the source's two-component set.

Two findings: one P2 (a pinned Tau Ceti object the package says the pins lack, and re-plans), one
P3 (a name that clashes with the source cited for it). No false statement was found in
`Suggested.lean` or among the README targets; the computed record is in the table under
`## Verified sound`.

## Verified sound

Counts: 24 declarations of `Suggested.lean` read (all); README read in full (2232 lines, 32
numbered targets, 33 Checks blocks); 54 locators into the five cached sources verified at their
lines (LandesmanLitt2024 5, BCGGO2024 6, Sikora2012 10, BohmLafuente2021 22, BateMartinRohrle2005
11), none wrong; all 120 Check items read and evaluated, none found false, the ones with numerical
or matrix content recomputed (values in the table below); the sibling citations of every supplier
subsection resolved at main or at the open heads (the sections are listed under **Suppliers**),
none missing; every Tau Ceti name of the supplier contract and the Mathlib names the Lean file and
the Conventions rely on opened at the pins, all present with the stated meaning.

**Dependency check** (output of the `gate --depcheck` command of the brief, run on the head):

    depcheck: 235 roadmaps, 2237 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line. RealSemisimpleLieGroups is an open pull request of another
author that adds a new folder, which the brief allows as a supplier; it names this subject only
among its consumers, so there is no cycle.

**Elaborated signatures.** No Lean was run in this pass. The worker's elaborated signatures of all
24 declarations were compared with the README statements: no difference in binders, universes or
instance arguments. The four flagged "dropped `[FiniteDimensional ℝ V]`" are the definitions
`symmetricPart`, `IsRealReductiveLinearGroup`, `minimalVectors`, `linearOrbit`, whose bodies do not
use finite dimension; all five theorems about them carry the binder. Not a defect.

**Adversarial table.**

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| `innerAut_range_normal`, `Out` | `Q₈`, `ℤ`, `ℤ²` | `|Aut Q₈| = 24`, `|Inn| = 4`, `|Out| = 6`; `Out(ℤ) = ℤ/2`; `Out(ℤ²) = GL₂(ℤ)`; no such instance or quotient at the pins | sound |
| `exists_outAction_iff_commute` | `Γ = H = F₂`, `ρ = id`; `H` abelian; `Γ = 1` | `conj a · id = conj a⁻¹ ≠ id`, right side fails at `(a, b)`; abelian: both sides hold; law `(φψ)·ρ = φ·(ψ·ρ)` on `ℤ²` gives `(1, −1)` both ways, `(2, −1)` reversed | sound, both directions |
| `existsUnique_homeomorph_extension` | `P = ∅`; `[0,1]`, `P = {0}`; `[0,1]`, `P = {1/2}`; `S¹`, two points; isolated `p` | identity; `(0,1]` extends; hypothesis fails (punctured interval disconnected) and the half-swap has no extension; isolated `p` excluded since `IsConnected` needs nonempty; density of `Pᶜ` follows, so `∃!` | sound |
| `existsUnique_ambientIsotopy_extension` | same, and the role of the homeomorphic total map | `F⁻¹(I × K)` compact gives uniform control near `I × {p}`; image of `I × (U ∖ {p})` connected, at `t = 0` inside `V_p`, so limit `p` for every `t` | sound; relies on `isHomeomorph_total'` of the pinned structure |
| `exists_outerAction` | `S¹` (conjugation, rotation by `π`), `T²` shear, `[0,1]` flip | `−1`, `+1`; shear `↦ [[1,0],[1,1]]`; `π₁ = 1`; `f_{δ'} = conj[δ ⬝ δ̄'] ∘ f_δ`, `(f∘g)_{δ ⬝ fε} = f_δ g_ε`, `id_σ = conj[σ]⁻¹` recomputed from `mul_def` (`p * q` is `q` then `p`) | sound |
| `pointwiseTopology`, `conjOrbit` | `Γ = F₂`, `ℤ/2` | product topology of `G²`; `{±1}` discrete in `SO(2)`; no topology on `Γ →* G` at the pins | sound |
| `symmetricPart`, `IsRealReductiveLinearGroup` | `GL(V)`, `SO(V)`, unitriangular `N`, irrational line in `T²`, `V = 0`, `G = ⊥` | `Sym(V)`; `0`; `K exp 𝔭 = {1} ≠ N`; polar holds but not closed; trivial | sound; the wrong model "𝔭 = 𝔤" is excluded by `N` |
| `minimalVectors_eq_normMinimizers` | `ℝ_{>0}` on `ℝ`; `(λx, λ⁻¹y)`; compact `G` | `{0}`; `{|x| = |y|}`; `V`; `d'(0) = 2⟨Av, v⟩`, `d'' ≥ 0` | sound |
| `isClosed_linearOrbit_iff`, `linearOrbit_inter_minimalVectors` | same; half-axes; hyperbola branches | half-axis: no minimal vector, not closed; branch `xy = 1`: meets `M` in `K w = {w}`, closed | sound |
| `exists_tendsto_closed_linearOrbit` | `(ℝ_{>0})²` on `ℝ²`, `v = (1,1)` | `diag(−1, 0) ↦ (0,1)`, orbit not closed; `diag(−1,−1) ↦ 0`, closed; the conclusion needs only one good `α`; conjugating a split one-parameter group into `𝔭` moves the limit inside the closed orbit | sound |
| `existsUnique_closed_linearOrbit` | same | `{0}` is the only closed orbit in the closed quadrant | sound |
| `adjointRepresentation`, `IsReductiveRep` | `𝔾_m`; `SL₂(ℝ)` unipotent; `diag(2,3)` in `GL₂` | trivial; nontrivial unipotent, not semisimple; eigenvalues `1, 1, 2/3, 3/2` | sound |
| `isReductiveRep_tfae` | unipotent `ℤ → SL₂(ℝ)`; rotation; `diag(2, 1/2)`; `G^ℝ` a proper open subgroup | all four fail; all four hold; all hold; component group of `𝐆(ℝ)` is a 2-group, so `G^ℝ` is normal and its orbits are open and closed in a closed `𝐆(ℝ)`-orbit | sound |
| `reductiveConjSetoid`, `CharacterVariety`, its topology | `Γ = 1`; `ℤ → SL₂(ℝ)`; `F_∞ → ℝ^×` | point; semisimple classes only; `(ℝ^×)^ℕ`, not locally compact | sound |
| `characterVariety_t2_locallyCompact_secondCountable` | torus; compact `G^ℝ`; subspace-quotient versus closure-relation topology | `Hom(Γ^{ab}, G^ℝ)`; `Hom/G`; `M/K → Hom^red/G → X//G ≅ M/K` are continuous both ways, so the topologies agree | sound |
| `characterVariety_universalHausdorffQuotient` | `ℤ → GL_n(ℂ)`; whether the three laws fix `q` | characteristic polynomial; continuity, invariance and Hausdorffness force `q(ρ) = [ρ^{ss}]`; `F` is constant on orbit closures since `Z` is T1 | sound |
| `exists_outAction_characterVariety` | `𝔾_a` over `ℝ`, `Γ = ℤ`; `F₂ → SL₂(ℂ)` | `x ↦ −x`; `(x, y, z) ↦ (x, z, xz − y)` at `(2,2,3)` gives `(2,3,4)`, commutator trace `3` before and after | sound |
| §3.5 non-descent | `(0,3)`, `S₃`; torus; `(0,0)` | `(1 2)(2 3)(1 2) = (1 3)`; both sides hold; both hold; Burnside `66/6 = 11` | sound |
| §5.3 non-example | `u SO(2) u⁻¹` | `[[c+s, −2s],[s, c−s]]`, column norms `1 + s(2c+s)`, `1 + 2s(2s−c)`, so `K = {±1}` | sound |
| §5.2 quaternionic form | `τ(g) = J ḡ J⁻¹` | `τ² = 1`; fixed points `[[a, −b̄],[b, ā]]` | sound |
| §3.4 reflection of the `4g`-gon | positions `4i, 4i+2` | go to `4j+3, 4j+1` with `j ≡ −i`, the `b`-pair, parameters matching | sound |
| §7.5 trace moves | `A = [[1,1],[0,1]]`, `B = [[1,0],[1,1]]` | `(2,2,3)`, `(2,2,1)`, `(2,3,4)`, `(2,1,2)`, all of commutator trace `3` | sound |

**Suppliers.** TeichmullerGeometry §§0.0b, 0.0e, 0.0f, 0.0h, 4.2–4.5, 5.4, 5.4a, 6.1 (names
`OuterAut`, `innerAut_normal`, `MappingClassGroupFull`, `isotopicToIdSubgroup`,
`dehn_nielsen_baer`, `mcg_sphere_full`, `mcg_torus_full`, `StandardSurface.*`, `Surface.genus`,
`Surface.IsOrientable`, `classification_of_surfaces`, `image_boundary` all present at its head, with
the hypotheses the README restates); MordellLawrenceVenkatesh §§5.1, 5.4, 5.9, 5.17, 5.19 (the
push acts by `γ ↦ α * γ * α⁻¹`, coverings by `(f⁻¹)_*`, as used);
MappingClassGroupsAndCanonicalRepresentations §§0.1–0.3, 1.4, 2.1; NonabelianLevelStructures
§§5.1–5.2 (right action, the three moves, as restated); ArithmeticGaloisRepresentations §§1.7, 1.11
(both bold paragraphs); LanglandsParameterStacks §2.2; ArithmeticLocallySymmetricSpaces §§ALS.F.1,
ALS.0.1; RealSemisimpleLieGroups §2.5; LieGroups Layer 9 with **Restricted roots and KAK** and
`kakDecomposition`; FreeGroupsAndLimitGroups §§6.1–6.2 (commutator `x⁻¹y⁻¹xy`); ReductiveGroups
Layers 1–7 including 3A and 5P; ReductiveGroupsPartII §§RG2.0.1, RG2.0a.2; ComplexComparisonPartII
§C-1.1; AlgebraicTopology Stage 4 items 2–3 (its README maps them to §§4.2–4.3); ClassifyingSpaces
Stage 3 items 11, 15 and Stage 4 item 17; GeometricTopology Layer 1.7.2; HamiltonianReduction R5.

**Ownership.** Searched all roadmaps on main and at the open heads for the character variety, the
representation scheme, the real Kempf–Ness theorem, minimal vectors and the outer automorphism
group. No second owner: RealSemisimpleLieGroups and GeometricTopology name character varieties
only as consumers; TensorProductCombinatorics has the complex projective Kempf–Ness direction, a
different statement; `OuterAut` is TeichmullerGeometry's and `Out` here is declared in this
roadmap's own namespace. The overlap of §§4.1, 7.2, 3.3 with
MappingClassGroupsAndCanonicalRepresentations §§1.4, 0.2, 2.1 is stated in the Scope as
general-versus-special case and was not raised again.

**Declared gaps.** The three slugs agree between `design/plan.json` and the README. Each is
precise and none is already provided: no statement of `ker(Ad) = Z(G)` or of Borel–Tits in
ReductiveGroups or ReductiveGroupsPartII, none of the reductive identity component in
ArithmeticGaloisRepresentations §1.11.

**Headlines and padding.** Headlines stated: non-descent (§1.3), extension over punctures (§2.2),
`Ψ_x` (§3.3), real Kempf–Ness (§5.4), four of six characterizations (§6.7), topology of `𝒳`
(§7.1), universal Hausdorff quotient (§7.2), outer action (§7.4). The six named as not statable
were checked at the pins: no genus or orientation of a topological surface (the pinned genera are
of knot cobordisms and curves), no Zariski closure of a set of points as a subgroup, no
`G`-complete reducibility, no representation algebra; the affine quotient is the subject of R01.
No declaration is padding by the one-tactic probe; the six definitions each serve a stated
headline.

**Policy.** The pull request changes only the package folder. No pull-request number, process
word, `lemma`, `set_option`, `#eval`, `#check` or sorry'd data. Every target has a locator.

**Note (not a finding).** In `existsUnique_homeomorph_extension` the conjunct `IsCompact U` of the
neighbourhood-basis hypothesis is implied by the rest in a compact Hausdorff space (the closure of
a member inside a smaller neighbourhood is compact and its punctured set stays connected), so it
neither narrows the statement nor is needed.

Source independence: 14 passages compared with 5 sources, none shared beyond statements the mathematics forces (BohmLafuente2021 Theorem 1.1 (ii)–(iii), each under twenty words); largest share Sikora2012, 14 of 82 locators; contents compared with Sikora2012 (§§1–14): independent, since only Layers 4, 6, 7 touch its §§5, 3, 11, in a different order and with the real theory of Layers 5–7 absent from it.

## Not verifiable

- Richardson1988 Theorem 3.6 (uncertified), RichardsonSlodowy1990 §§4, 7, 9 (waived),
  FarbMargalit2012 chapter and section locators (waived), Knapp2002 Ch. VI §§1–2 (waived),
  Goldman1984 §1 (uncertified): cited by locator only; the texts were not read, so the section
  numbers and the wording were not compared.
- That every declaration elaborates under the defaults: no Lean was run; the worker's elaborated
  signatures were taken as the record.
- Ownership against open pull requests whose files the brief does not give was checked only
  through the roadmap search tool's index of 2026-11-16.

## Source issues

- **Error** in BCGGO2024 at §2.3, printed page 10 (lines 471–472): the source says the real form `SO(p,q)` has two components whenever `p` or `q` is nonzero; it should be whenever both are nonzero, `SO(n)` being connected; affects nothing.
- **Misprint** in Sikora2012 at §11, printed page 18 (lines 835–836): the source refers to "Proposition 30" for closed orbits and complete reducibility; it should be Theorem 30; affects nothing.
- **Misprint** in BohmLafuente2021 at the proof of Lemma 6.3, printed page 12 (line 520): the source calls the group `T = exp(𝔱)` a maximal abelian subalgebra; it should say `𝔱 ⊂ 𝔭` is a maximal abelian subalgebra and `T = exp(𝔱)`; affects nothing.

## For the human reviewers

- **Not tested.** Five of ten sources (Richardson1988, RichardsonSlodowy1990, FarbMargalit2012, Knapp2002, Goldman1984; 24 of 82 locators) are cited by locator without text; wording and arrangement were not compared with them (`sources.toml`).

<!-- tauceti-roadmap-review {"agent": "claude", "head": "f78c7d9d61b6b5c1a373b9ad5eef65d1d063e3de", "job": "RT-SurfaceGroupCharacterVarieties~1a", "model": "fable", "worker": "chris-x55"} -->
