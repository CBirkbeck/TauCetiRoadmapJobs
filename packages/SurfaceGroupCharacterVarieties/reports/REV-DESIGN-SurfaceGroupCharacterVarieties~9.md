<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13837#issuecomment-6898344156 -->
Review (claude) of c27ad48

Verdict: needs_changes

**For the human reviewers:** this review raises 1 question that a human decides (the scope of the roadmap, or a licence). It is in the section of that name at the end and does not change the verdict.

1. **F01** (P3) the direction of NonabelianLevelStructures §5.2's action is not pinned against §7.4's

   Location: `packages/SurfaceGroupCharacterVarieties/design/README.md`, contract *From
   TauCetiRoadmap.NonabelianLevelStructures* (lines 404–406: "precomposition by `Aut(F₂)` acts on `𝔸³`
   by polynomial automorphisms through `Out(F₂)`") and §7.5, third Check (lines 1823–1824: "On it §7.4's
   action of `Out(F₂)` is by polynomial automorphisms (NonabelianLevelStructures §5.2)").

   Claim: §7.4's action and §5.2's are the same map from `Out(F₂)` to polynomial automorphisms.

   Witness: NonabelianLevelStructures §5.2 (open head) states the right action `ρ ↦ ρ ∘ φ`, "an
   anti-homomorphism"; its Check gives `r ∘ t : (a, b) ↦ (a, a⁻¹ b)` the move `(x, x y − z, y)`. §7.4's
   `[φ] · [ρ] = [ρ ∘ φ⁻¹]` gives the same class `(x, z, x z − y)`: `(2, 1, 3)` against `(2, 5, 7)` at
   `(2, 3, 5)`.

   Nothing stated is false: the only classes whose moves the README writes, `(a⁻¹, b)`, `(b, a)`,
   `(a⁻¹, a b)` and `(a⁻¹, b⁻¹)`, are involutions, on which the two conventions agree. The direction is a
   convention shared with a supplier and has no witness.

   Repair:

   - Contract, after "acts trivially)": add "§5.2's map is the right action `ρ ↦ ρ ∘ φ`, an
     anti-homomorphism; §7.4's left action of `[φ]` is §5.2's automorphism of `φ⁻¹`. The four classes
     listed are involutions, so their moves are the same in both."
   - §7.5, third Check, after "so the action is not faithful": add "The direction matters off the
     involutions: for `φ : (a, b) ↦ (a, a⁻¹ b)`, `ρ ∘ φ⁻¹ = (A, AB)` and §7.4's `[φ]` acts by
     `(x, y, z) ↦ (x, z, x z − y)`, since `tr(A²B) = tr A · tr AB − tr B`, while §5.2's move of `φ` is
     `(x, x y − z, y)`; at `(2, 2, 3)` these give `(2, 3, 4)` and `(2, 1, 2)`."
   - `plan.json`, target 7.5, test `pants_SL2C`: the same sentence.

   Tested on the Check's own pair `A = [[1,1],[0,1]]`, `B = [[1,0],[1,1]]`: `AB = [[2,1],[1,1]]`,
   `A · AB = [[3,2],[1,1]]`, so `(A, AB)` has triple `(2, 3, 4) = (x, z, x z − y)`; `A⁻¹B = [[0,−1],[1,1]]`,
   `A · A⁻¹B = B`, so `(A, A⁻¹B)` has triple `(2, 1, 2) = (x, x y − z, y)`. Both have commutator trace `3`
   (`4 + 9 + 16 − 24 − 2` and `4 + 1 + 4 − 4 − 2`), as the Fricke invariance requires.

2. **F02** (P3) "used only in §7.5" against the citation in §7.2

   Location: README Scope (line 166: "both are used here only in §7.5"), the contract (line 406: "Used
   only in §7.5, with `R = ℂ`"), Layer 7 Dependencies ("NonabelianLevelStructures §§5.1–5.2 … (§7.5)") and
   `plan.json`, `suppliers` ("Used only in 7.5").

   Claim: no section other than §7.5 cites NonabelianLevelStructures.

   Witness: §7.2, second Check (lines 1736–1738), cites "NonabelianLevelStructures §5.1, which proves the
   isomorphism over every commutative ring"; §7.2's *Needs:* line does not list it.

   Repair: in the four places write "used here only in Checks of §§7.2 and 7.5" (the Dependencies entry:
   "(Checks of §§7.2 and 7.5)"), as the README already does for SymplecticGeometry/HamiltonianReduction R5
   ("a Check of §7.1"). Tested: after the change every occurrence of "NonabelianLevelStructures" outside
   the Scope, the contract and the Dependencies lies in §7.2's Check, §7.5 or Layer 7's Examples, which
   restate §7.5.

Two findings, both P3, no P1 or P2: each comes with a repair, so the review asks for changes and a
fix round applies them. Both round-8 findings are repaired. The two declared supplier gaps
`gcr-reductive-identity-component` and `borel-tits` are precise, minimal and raise no finding.
There is no `Suggested.lean` at the design
stage and this lane does not elaborate: elaboration is `not available (this lane does not elaborate)`.

## Verified sound

**Round-8 findings** (2), each against the current text.

- F01, repaired. §7.2 second Check and §7.5 third Check: "NonabelianLevelStructures §5.1, which proves
  the isomorphism over every commutative ring". Layer 7 Examples: "`Out(F₂)` acting by polynomial
  automorphisms (NonabelianLevelStructures §5.2) … (the Fricke identity, Tau Ceti
  `Matrix.SpecialLinearGroup.trace_commutatorElement_fin_two` …)". Scope: "is over a field `k` the case
  `Γ = F₂`, `G = SL₂` of §7.2's affine quotient: the coaction invariants of `SL₂` and of `GL₂` agree,
  both conjugation actions factoring through the faithfully flat quotient maps onto `PGL₂`". The
  contract subsection, the Tau Ceti item, §7.5's *Needs:*, Layer 7's Dependencies and `plan.json`
  (target 7.5 and `suppliers`) are present. The repair's three departures from the suggested text are
  sound: the `PGL₂` argument is correct, "`Out(F₂) ≅ GL₂(ℤ)`" has no owner (NonabelianLevelStructures
  requests it as `gap:punctured-torus-nielsen`) and is no longer stated, and §5.2 is used in §7.5.
- F02, repaired. §5.2 sketch: "The pullback `φᵢ^* : O(H) → O(𝐆ᵢ) ⊗_ℝ ℂ` is an isomorphism of complex
  Hopf algebras, and its inverse carries `O(𝐆ᵢ) ⊗ 1` onto the fixed space `F`"; "`W = (φᵢ^*)⁻¹(O(𝐆ᵢ)
  ⊗ 1)`"; "`φ₁^* ∘ (φ₂^*)⁻¹ : O(𝐆₂) ⊗_ℝ ℂ → O(𝐆₁) ⊗_ℝ ℂ`". Every composite is typed; `plan.json` 5.2
  has the same route.

Repaired patterns searched in the rest of the design: a pullback used in two directions (`(f⁻¹)^*` in
§3.4 and `w^*` in §4.1 are each used one way); an object owned elsewhere and uncited (`roadmaps grep`
for character varieties, representation schemes, Kempf–Ness, real reductive data, reductive
representations: no owner other than those the Scope names); a contract item in no *Needs:* line
(none: the 32 *Needs:* lines and the 32 `prerequisites` lists of `plan.json` were compared item by
item and agree, and the 17 supplier subsections equal the `suppliers` list).

**Maintainer notes** (13). None holds at this head.

- 1: the contract derives ambient isotopy ("Used: … by §2.1 these are exactly the ambient isotopies
  of the boundaryless surface `S`"); it assumes only that §5.1 includes `Σ_g ∖ P`.
- 2: Scope and contract give §5.9 the action on finite coverings, `[p] ↦ [f ∘ p]`; the action on
  `Rep(π₁, H)` is §3.5's own definition, compared with §5.9 for `H = Sym(d)`.
- 3: Conventions, "Notation shared with suppliers", separates `Ψ_x` from §5.9's `Ψ` and `Mod^±(X)`
  from TeichmullerGeometry §3.1's `Mod±(Σ)`, with the torus witness.
- 4: contract and `plan.json` list the same ten sections (§§5.1, 5.4, 5.5, 5.6, 5.9, 5.15, 5.17,
  5.19, 5.20, 5.22); the Scope's longer ranges and §0.0d are deferrals to the owner.
- 5: `Mod_{1,0} ≅ SL₂(ℤ)` is cited to TeichmullerGeometry §5.4a (`mcg_torus_full`).
- 6: the contract states §5.4 in its connected-sum form; the polygon model is §2.4's target.
- 7: §5.23 occurs only inside the Scope's deferral range; no "case `n = 1`" is claimed.
- 8: the contract says orientability is invariant and the genus constant "by its definition".
- 9: §4.3 is cited for the attaching word and relator only; the reflection is built in §3.4.
- 10: the consumers list does not name GroupActionsOnRiemannSurfaces; the Scope describes its §3.4,
  which at its head does "Use MordellLawrenceVenkatesh §5.9's mapping class group".
- 11: §2.1 states the variant clause, the comparison map, and GeometricTopology Layer 1.7.2 as owner.
- 12: §3.4: "the group that TeichmullerGeometry §5.4 writes `Out⁺(Π)` …; its description by the action
  on `H₂` is stated here".
- 13: §§3.2–3.3 cite MordellLawrenceVenkatesh §5.19 for `Push` and its formula.

**Principles.** No copied passage, algorithm, `set_option`, sorry'd data or Lean file. No roadmap of the
never-cite list occurs in the README or `plan.json`. Greps for LaTeX delimiters, pull-request numbers,
round labels, job ids, machine paths and "optional/deferred/removed/currently" find nothing (the hits
are "around" and "background"). The layers are named by their mathematics and say nowhere that they
follow a source.

**Supplier order.** Gate output:

```text
candidate: SurfaceGroupCharacterVarieties is not in the merge order yet; checked as if placed after NonabelianLevelStructures (the intake inserts it when its design is accepted)
depcheck: 246 roadmaps, 2250 edges, 0 problem(s)
```

No UPWARD or CYCLE line. `roadmaps resolve` on the README: no cross-roadmap citation and no Lean name
found nowhere (the four names of `scratch/citations.md` are TeichmullerGeometry §0.0f's and occur at
its head). `roadmaps grep` finds no roadmap citing SurfaceGroupCharacterVarieties, so no supplier
cites it back. The overlaps file lists no pull request changing this roadmap, no dropped id, no id
only a revision defines and no second copy; main has no `SurfaceGroupCharacterVarieties` folder.
RealSemisimpleLieGroups and NonabelianLevelStructures are other authors' or open pull requests adding
new roadmap folders; the package's pull request names both in its merge-order paragraph
(RealSemisimpleLieGroups is not in the merge order).

**Supplier citations resolved this round** (headings and the cited content read at each head).

- NonabelianLevelStructures (open head): §5.1 "The integral rank-two character scheme"
  (`integral_trace_coordinates`, `R[x, y, z] ≅ 𝒪(SL₂ × SL₂)^(GL₂)`, base change), §5.2 "Outer
  automorphisms in trace coordinates" (moves of `r, s, t`, `γ₋ᵢ : (a, b) ↦ (a⁻¹, b⁻¹)` trivial).
- MordellLawrenceVenkatesh (open head): §§5.1, 5.4, 5.5, 5.6, 5.9, 5.15, 5.17, 5.19, 5.20, 5.22 exist
  under those numbers. §5.9: "`f` sends the class of a covering `p : Z → S` to the class of
  `f ∘ p`; in terms of monodromy this is precomposition with the outer automorphism `(f⁻¹)_*`";
  `Mod_{0,3} = Sym(3)` with trivial pure subgroup. §5.22: surjectivity for `g ≥ 1`.
- TeichmullerGeometry (open head): §§0.0b, 0.0d, 0.0e, 0.0f, 0.0h, 3.1, 4.2–4.5, 5.4, 5.4a, 6.1 exist.
  §0.0h: `isotopicToIdSubgroup`, `MappingClassGroupFull`, the forgetful isomorphism from Layer 1.7.2's
  `Mod(F)`. §5.4: `dehn_nielsen_baer` for a compact connected orientable surface with empty boundary
  of genus at least one, value the outer class of `FundamentalGroup.mapOfEq f`, "restricting to
  `Mod⁺(Σ) ≃ Out⁺(Π)`". §4.5: the uniformizing holonomy has Euler number `2 − 2g`, as §7.4's Check
  uses. All sixteen names the contract quotes occur at the head.
- MappingClassGroupsAndCanonicalRepresentations (open head): §§0.1, 0.2 (kernel of the permutation
  action, index `p!`, every permutation realized), 0.3, 1.4, 2.1. RealSemisimpleLieGroups §2.5 "Real
  forms of complex reductive groups". LanglandsParameterStacks §2.2 (finite generation, closed images
  and separation, unique closed orbit in every geometric fibre, universal submersiveness, for
  reducible and nonreduced schemes). ArithmeticGaloisRepresentations §1.7 **Semisimplicity over a
  perfect field**, §1.11 **Reductive quotients over fields and DVRs** and **Complete reducibility and
  closed tuples**. GroupActionsOnRiemannSurfaces §3.4.
- On main: AlgebraicTopology §§4.2 "Cellular differentials", 4.3 "Cellular comparison" (main keeps
  "Stage 4 items 1–8 are §§4.1–4.8"); ClassifyingSpaces Stage 3 items 11, 15, Stage 4 item 17;
  ReductiveGroups Layers 0, 1, 2, 3A, 5, 6, 7; ReductiveGroupsPartII §§RG2.0.1, RG2.0a.2;
  FreeGroupsAndLimitGroups §§6.1, 6.2; GeometricTopology Layer 1.7.2 ("the single owner of the mapping
  class groups of compact surfaces"); LieGroups Layer 9 with **Restricted roots and KAK**
  (`kakDecomposition`); HamiltonianReduction R5 "Gauge actions over a surface".

**Declared gaps.** `gcr-reductive-identity-component` (ArithmeticGaloisRepresentations §1.11) and
`borel-tits` (ReductiveGroups Layer 7): each `needs` is one sentence with its hypotheses (closed
subgroup, connected reductive group, algebraically closed field); the same slug is in `plan.json` and
in the supplier's contract subsection. `roadmaps grep` for "Borel–Tits" over main and the open heads
finds only the 1965 rational structure theory, not the theorem on unipotent subgroups, and no
statement that a completely reducible subgroup has reductive identity component: neither gap asks for
what is provided. No finding.

**Library declarations opened at the pins.**

- Tau Ceti: `Matrix.SpecialLinearGroup.trace_commutatorElement_fin_two`
  (`LinearAlgebra/Matrix/Trace/FinTwo.lean:231`, any `CommRing`, `⁅A, B⁆ = A B A⁻¹ B⁻¹`);
  `isotopic_iff_ambientIsotopic` (`Topology/Homotopy/Isotopy/Compact.lean:123`, with `[CompactSpace Y]
  [T2Space Y]` and a finite-dimensional real model in scope); `AmbientIsotopic.isotopic`, `setoid`
  (`Topology/Homotopy/AmbientIsotopic/Basic.lean:94, 103`); `AmbientIsotopy.isotopic`
  (`Topology/Homotopy/Isotopy/Basic.lean:281`); `finalHomeomorph_conj`
  (`Topology/Homotopy/AmbientIsotopyConj.lean:131`); `isPreconnected_iInter_of_directed`
  (`Topology/Continuum.lean:69`, `[T2Space X] [Nonempty ι]`, `Directed (· ⊇ ·)`, compact and
  preconnected members; it does not give nonemptiness, which §2.2's sketch takes from compactness);
  `Continuous.isOpenEmbedding_of_injective` (`AlgebraicTopology/Singular/InvarianceOfDomain.lean:201`,
  hypothesis `finrank ℝ E = finrank ℝ F`); `monodromyEquivalence`, `basepointMulAction`
  (`AlgebraicTopology/UniversalCover/Classification/MonodromyEquivalence.lean:158, 93`);
  `instTopologicalSpaceWithConv` (`Topology/Algebra/PointTopology/Basic.lean:110`);
  `IsLinearlyReductive` (`Algebra/Coalgebra/Comodule/LinearlyReductive.lean:249`);
  `Hom.fixedMap_surjective_of_isLinearlyReductive`
  (`Algebra/Coalgebra/Comodule/LinearlyReductive/Fixed.lean:184`);
  `IsUnitary.isSemisimpleRepresentation` (`RepresentationTheory/Continuous/InvariantComplement.lean:190`).
- Mathlib: `FundamentalGroup.mul_def` (`AlgebraicTopology/FundamentalGroupoid/FundamentalGroup.lean:44`,
  `p * q = .of (q.asHom.trans p.asHom)`, the order the Conventions state),
  `fundamentalGroupMulEquivOfPath` (`:48`), `mapOfEq` (`:85`); `homotopicMapsNatIso`
  (`…/InducedMaps.lean:67`); `quotientKerEquivRange` (`GroupTheory/QuotientGroup/Basic.lean:134`);
  `fg_of_index_ne_zero` (`GroupTheory/Schreier.lean:166`); `IsSemisimpleRepresentation`
  (`RepresentationTheory/Semisimple.lean:34`); `t2Space_quotient_mulAction_of_properSMul`
  (`Topology/Algebra/ProperAction/Basic.lean:113`); `Opens.instChartedSpace`
  (`Geometry/Manifold/HasGroupoid.lean:284`).

**Sources, seeded sample** (15 targets). The author flags no locator as unverified.

- §1.3, §3.5: LandesmanLitt2024 lines 41–50 (outer action, Definition 1.1.1 at line 45, the remark at
  lines 47–50 that the group does not naturally act on the representation variety). Hold. §2.3, §3.5:
  lines 473–475 (`PMod` of index `n!`). Holds.
- §2.1, §2.4: FarbMargalit2012 only (waived, not read); the mathematics is in the table.
- §4.1: Sikora2012 line 584 (`Hom(Γ, G)` closed in `Hom(F, G)`). Holds. §§4.1, 4.2: BCGGO2024 lines
  2706–2708 (`Hom(π₁Σ, G^ℝ)` with conjugation). Holds as the locator of the object.
- §5.1: BCGGO2024 lines 466–472. §5.2: lines 475–481 (Cartan involution for a real form, existence,
  uniqueness up to `(G^τ)⁰`). Hold. Knapp2002 waived.
- §6.2: Sikora2012 lines 262–266. Holds.
- §6.4: BateMartinRohrle2005 lines 263–264 (`H⁰` reductive, attributed to Serre's Property 4; converse
  in characteristic zero), Lemma 2.6 at line 267, Theorem 3.46 at line 861 with its proof at 863–868
  (the tuple, Corollary 3.7, the cocharacter limit); Sikora2012 line 228, Proposition 8. Hold.
- §6.5: Sikora2012 lines 572–586 (Theorem 30); BateMartinRohrle2005 Corollary 3.7, line 510. Hold.
  Richardson1988 uncertified.
- §7.2: Sikora2012 lines 823–837 (§11) and 844–845 (Example 48). Hold. §7.3: line 268, Corollary 9.
  Holds. §7.5: lines 844–845. Holds.
- Also read: BateMartinRohrle2005 lines 183–187, 355, 379–382, 814; Sikora2012 lines 363–364;
  BohmLafuente2021 lines 52–62, 77–88; BCGGO2024 lines 2708–2726. All hold.

All ten cited works are in the manifest, each README locator lies inside its manifest locator, and
the manifest has no local path. Nothing was fetched and no `needs-references.toml` was written.

**Adversarial table** (sampled targets, repaired passages, headlines, targets a finding touches).

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §1.3 action, non-descent | `ℤ²` witness; `F₂`, `ρ = id`; `Out(ℤ)` on `S₃`, `ℤ/3` | `(φψ)⁻¹ = [[1,−1],[−1,2]]`, row `(1, −1)`; `(ψφ)⁻¹ = [[2,−1],[−1,1]]`, row `(2, −1)`; `c_a · id = c_{a⁻¹} ≠ id`; `3` classes fixed, `2` generators swapped | left action; iff both ways | none |
| §1.1 inner `e` | general `g, φ`; `Q₈` | `c_g φ c_g⁻¹ = φ c_{φ⁻¹(g) g⁻¹}`; `24/4 = 6` | correct | none |
| §2.1 path component, manifold bullet, index | exponential law; `ℝ`; `S² ⊔ S²` | total map `(t, f_t(x))`, inverse `(t, f_t⁻¹(x))`; `(1 − t)x + t f(x)` increasing and onto, `2` classes; `8/2 = 4` against `2/1 = 2` | correct | none |
| §2.2 extension (used by §2.3) | `S²`, `{N, S}`; `S¹`, two points; isotopy clause at `t = 0` | `(θ, s) ↦ (−θ, −s)` swaps ends; ends at `p` go to `p` and `q`; `(0, p)` lies in every closure, so `q = p` | correct | none |
| §2.3 `σ` | `n = 0, 1`; `(0, 3)`; `(0, 2)` | index `1 = 0! = 1!`; `S₃`, `6 = 3!`; order `2 = 2!` | correct | none |
| §2.4 standard model | torus; `a a b b`; `nonorientable 5 0`; `a a⁻¹`; `a a` | `d₂ = 0`, `H₁ = ℤ²`; `d₂ = 2a + 2b`, `H₂ = 0`; `H₁ = ℤ⁴ ⊕ ℤ/2`; `d₁(a) = v₁ − v₀`, `H₁ = 0`, `H₂ = ℤ`; `d₂ = 2` | correct | none |
| §3.1–3.2 laws (used by §3.5) | change of path; composition; push | `conj[δ ⬝ δ̄'] f_δ [γ] = [δ' fγ δ̄']`; `[δ ⬝ fε ⬝ fgγ ⬝ (fε)‾ ⬝ δ̄]`; `f_const = conj [α]` | correct | none |
| §3.5 | `Rep(F₂, S₃)`; `Push(a)` on `ρ = ((1 2), (2 3))`; torus, `d = 3`; half twist | `(36 + 12 + 18)/6 = 11`; `b ↦ (1 2)(2 3)(1 2) = (1 3)`; `M(ker ρ) = {b ≡ a} = ker(ρ ∘ M⁻¹)`, `ρ ∘ M` has `{b ≡ −a}`; `p₁p₂ ↦ p₂ · p₂⁻¹p₁p₂ = p₁p₂` | correct | none |
| §4.1 | `ℤ`; `ℤ/2`, `𝔾_m`, `𝔽₂`; `ℤ²`, `GL_n` | `G`; `𝔽₂[t]/((t − 1)²)`, nonreduced; commuting pairs | correct | none |
| §4.2 | `Hom(ℤ, GL₁(ℝ))`; `Hom(ℤ/2, SO(2))`; open and closed | `ℝ^×`, component `ℝ_{>0}`; `{±1}`; finitely many conditions `ρ(s) ∈ G^ℝ`, `G^ℝ` open hence closed | correct | none |
| §5.1 | `SO(p, q)`; `Res GL_n`; `Res H` | `2` components; `dim_ℝ = 2n²`; `H(ℂ)` connected, the only open subgroup | correct | none |
| §5.2 sketch (repaired) | `GL₁`, `(𝔾_m, id)`, `(𝔾_m, inv)` | `φ₂^*(z) = t⁻¹`; `F = ℝ[z^{±1}] = (φ₂^*)⁻¹(ℝ[t^{±1}])`; `ℂ[z^{±1}] = F ⊕ iF`; `φ₁^* ∘ (φ₂^*)⁻¹ : t ↦ t⁻¹`, `φ₂ ∘ α_ℂ = id = φ₁` | typed; `α = inv` | none |
| §5.2 bijection | injective; surjective | conjugation of `(𝐆_τ, φ_τ)` is `τ`; a form is `(𝐆_τ, φ_τ)` for its own `τ` by converse and uniqueness | correct | none |
| §5.2 hypothesis | `GL₁`, `z ↦ 2/z̄` | `2/conj(2/z̄) = z`, `1 ↦ 2`, fixed set `abs z² = 2` | "automorphism" needed | none |
| §5.4 (headline) | `ℝ_{>0}` on `ℝ²`; on `ℝ`; `K` compact; minimizer of a closure | `M = {x² = y²}`; `M = {0}`, `α = −1`, limit `0`; `M = V`; a minimizer `u` has `‖u‖ ≤ ‖gu‖`, so `u ∈ M` and `Gu` is the closed orbit | agrees with BohmLafuente2021 Theorem 1.1 | none |
| §6.2 | rotation on `ℝ²`; `[[1,1],[0,1]]`; `rad(B) ⊗ k'`; Weil restriction | irreducible over `ℝ`, two characters over `ℂ`; not semisimple over either; nilpotent ideal; `w ⊗ z ↦ (zw, z̄w)` | correct | none |
| §6.3 (used by §6.4) | torus; unipotent of `SL₂`; `N(T)` | `Ad` trivial; nontrivial unipotent; `Z⁰ = T`; `R_u(Z⁰) ⊆ ker Ad = Z(G)`, no unipotents | correct | none |
| §6.4 | Borel of `SL₂`; `N(T)`; gap route | centralizer `{±1}`, `R_u ≠ 1`; fixes no line; `R_u(H⁰) ⊆ L ∩ R_u(P) = 1` | correct, conditional on the gaps | none |
| §6.5 | `ℤ`, `GL_n`; `F₂`, `(diag(2, 1/2), [[1,1],[0,1]])` | class closed iff semisimple; conjugate by `diag(t, t⁻¹)`: `[[1, t²],[0, 1]] → 1`, limit outside the orbit | correct | none |
| §6.7 (headline) | `π₁(Σ₂)`, `ρ(a₁)` unipotent; torus; `GL_r(ℂ)` | `[a₁, b₁][a₂, b₂] ↦ 1`, closure contains the trivial class; centralizer `G = Z(G)`; `GL_r × GL_r`, `(ρ, ρ̄)` | consistent | none |
| §7.1 (headline) | `ℤ`, `SL₂(ℝ)`; `F_ℕ`, `ℝ^×`; compact `G^ℝ`; closedness of `Hom(Γ, G^ℝ)` in `V` | unipotent class no point; `(ℝ^×)^ℕ` not locally compact; `M = V`; clopen in the closed `Hom(Γ, 𝐆(ℝ))` | correct | none |
| §7.2 (headline) | `ℤ`, `GL_n`; `ℤ/2`, `𝔾_m`, `𝔽₂`; `C₂` on `𝔸²` over `𝔽₂`; `F₂`, `SL₂`, `(I, I)` | `𝔸^{n−1} × 𝔾_m`; `Hom//G = Hom`, one closed orbit; `𝔽₂[x + y, xy] → 𝔽₂[x²] ≠ 𝔽₂[x]`; `(2, 2, 2)` | correct | R02 (wording) |
| Scope, `SL₂`- and `GL₂`-invariants | conjugation; left multiplication on `M₂` | `π^* ⊗ id` injective for `π` faithfully flat onto `PGL₂`; `det` is `SL₂`- and not `GL₂`-invariant | holds for conjugation | none |
| §7.3 | closure under a morphism; `ℤ ↠ ℤ/2`; `⟨a⟩ ≤ F₂` | `φ(Z)⁰ = φ(Z⁰)` reductive; elements of order dividing two are semisimple; restriction unipotent | correct | none |
| §7.5 Check (extended) | `r = (a⁻¹, b)`; `(a⁻¹, b⁻¹)`; `A = [[1,1],[0,1]]`, `B = [[1,0],[1,1]]`; `t = (a⁻¹, ab)` | `tr(A⁻¹B) = xy − z`; `tr((BA)⁻¹) = z`, abelianization `−I`; `AB = [[2,1],[1,1]]`, `ABA⁻¹B⁻¹ = [[3,−1],[1,0]]`, trace `3 = 4+4+9−12−2`; Vieta image `(2, 2, 1)`, `4+4+1−4−2 = 3`; `(tr A⁻¹, tr AB, tr B) = (x, z, y)` | correct | none |
| §7.5, direction of the action | `φ = (a, a⁻¹b)` at `(2, 3, 5)` and on `A, B` | right action `(x, xy − z, y)`: `(2, 1, 3)`, `(2, 1, 2)`; left action `(x, z, xz − y)`: `(2, 5, 7)`, `(2, 3, 4)` | conventions differ off involutions | R01 |
| Layer 7 Example, commutator | `a b a⁻¹ b⁻¹` against `a⁻¹ b⁻¹ a b` | `(ab)(a⁻¹b⁻¹ab)(ab)⁻¹ = aba⁻¹b⁻¹` | same trace | none |

Rows of rounds 7 and 8 that carry computed values and whose text no repair touched (§§2.5, 3.3, 3.4,
4.3, 5.3, 6.6, 7.4) were relied on; §§3.3 and 3.4 were read again against TeichmullerGeometry §5.4
(`Ψ_x[f]` with the constant path is the outer class of `FundamentalGroup.mapOfEq f`).

**Shape.** Summary, Scope, Conventions, contracts, build paragraph, seven layers each ending with
Examples and Dependencies, consumers, references. Every definition (§§1.2, 2.1, 3.1, 4.1, 5.1, 6.1,
7.1) has an API list and at least three Checks; `plan.json` has 32 targets with 3 to 6 tests each, and
its seven layer titles equal the README's. Layers 1–3 and 4–6 are independent and Layer 7 uses both,
so no run of layers is in an order the dependencies leave free in a source's sequence.

**Headline theorems, for the package stage.** §7.1 (topology of `𝒳(Γ, G^ℝ)`), §7.2 (complex
comparison and universal Hausdorff quotient), §6.7 (six characterizations), §5.4 (real Kempf–Ness),
§§1.3 and 3.5 (non-descent), §7.4 (the actions). At the pins §5.4 and §1.3 are statable on native
carriers; the others lack a carrier (reductive `ℝ`-groups, representation schemes, mapping class
groups) and belong in the module docstring. Padding probe and `#check` comparison: not applicable,
there is no Lean file.

**Duplication audit.** By object, over main and the open heads. The integral `F₂`, `SL₂` trace
coordinates and their `Aut(F₂)`-action are NonabelianLevelStructures §§5.1–5.2, cited; the Fricke
identity is Tau Ceti's, cited. Real forms and Cartan involutions: RealSemisimpleLieGroups §2.5, cited;
uniqueness and converse have no other owner. Representation schemes, quotients, MCG-finiteness: kept
variants of MappingClassGroupsAndCanonicalRepresentations §§1.4, 0.2, 2.1, each with its clause.
Reductive quotients of nonintegral schemes: LanglandsParameterStacks §2.2, cited. Kempf–Ness: only
TensorProductCombinatorics on main, another statement. The other roadmaps that mention character
varieties (GaugeQuiltFieldTheory, InstantonFloerTheory, CountingBundlesAndHallAlgebrasOfCurves,
PainleveEquations, IntegralHeckeAndGaloisDeterminants, GeometricTopology) do so in a reference, a
Check or a consumer clause and own none of these objects. Not a second copy.

Overlap check: read MappingClassGroupsAndCanonicalRepresentations, TeichmullerGeometry, MordellLawrenceVenkatesh, SurfaceTopology, GroupActionsOnRiemannSurfaces, GeometricTopology, BelyiMaps (the third list is empty), and also RealSemisimpleLieGroups and NonabelianLevelStructures; `PMod`, the presentation and the pure Birman sequence are MappingClassGroupsAndCanonicalRepresentations'; `Out(Γ)`, the classification by models and `dehn_nielsen_baer` are TeichmullerGeometry's; `Mod(S)`, `Push` and the Birman sequence are MordellLawrenceVenkatesh's; `Mod(F)` of a compact surface is GeometricTopology's; the real-form bridge is RealSemisimpleLieGroups'; the integral `F₂`, `SL₂` character scheme is NonabelianLevelStructures'; SurfaceTopology (never cited) and BelyiMaps share no object this roadmap owns.

**Copyright.** Wording compared at every locator read above (26 passages) and in six further
passages (Summary; §5.2 statement against BCGGO2024 lines 466–481; §5.4 statement against
BohmLafuente2021 lines 77–88; §6.1 definition against BCGGO2024 lines 2708–2711; §6.4 sketch against
BateMartinRohrle2005 lines 863–868; §7.2 statement against Sikora2012 lines 823–837). The longest
shared run is "contains exactly one closed orbit" with its subject, under a dozen words and forced by
the statement; §5.4 lists five clauses where the source lists four, in another order. Arrangement:
BCGGO2024 has the largest share; its nine sections (magical triples, their classification, real forms,
Higgs bundles, moduli, the Cayley correspondence, positive representations, tables) are not the seven
layers, and it is cited only from its §2.3 (Layer 5) and §8.1 (Layers 4, 6, 7). No table, figure or
list of examples is taken over.

Source independence: 32 passages compared with 5 sources, none shared; largest share BCGGO2024, 12 of 63 locators; contents compared with BCGGO2024: independent. FarbMargalit2012 (11 locators) is waived and was not read.

## Not verifiable

- FarbMargalit2012, Knapp2002, RichardsonSlodowy1990 (waived), Richardson1988, Goldman1984
  (uncertified): cited by locator only; the texts were not read.
- Whether MordellLawrenceVenkatesh §5.1's atlas is a `ChartedSpace` on TeichmullerGeometry's
  half-plane model: both are prose at their heads; the design records the assumption in its contract.
- How MappingClassGroupsAndCanonicalRepresentations §0.2 defines the permutation of the punctures:
  that section does not say; the design records the reading it assumes and §§2.2–2.3 prove the two
  readings agree.
- Elaboration: not available in this lane, and no Lean file exists at the design stage.
- Ownership against the open pull requests was checked with `roadmaps grep` and `roadmaps show` at the
  indexed heads only.

## Source issues

- **Misprint** in Sikora2012 at §11, line 836, printed p. 18: the source refers to a Proposition 30 for the closed-orbit characterization; it should be Theorem 30 (line 572); affects nothing.
- **Error** in BCGGO2024 at §2.3, lines 471–472, printed p. 10: the source says the real form `SO_{p,q}` has two components whenever `p` or `q` is nonzero; it should be whenever both `p` and `q` are nonzero; affects nothing.

## For the human reviewers

- **Not tested.** FarbMargalit2012 carries 11 of the 63 locators (second to BCGGO2024's 12) and is waived: the wording of Layers 1–3 was not compared with its text.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "c27ad48e9735b624167f954ef034002f4e382d94", "job": "REV-DESIGN-SurfaceGroupCharacterVarieties~9", "model": "fable", "worker": "chris-x83"} -->
