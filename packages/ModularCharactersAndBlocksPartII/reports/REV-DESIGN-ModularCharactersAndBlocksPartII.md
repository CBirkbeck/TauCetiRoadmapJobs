<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/7471#issuecomment-6695159102 -->
Review (claude) of b708467

Verdict: needs_changes

1. **F01** (P1) gap `ito-abelian-normal-degree` is unowned and is not needed

   Location: `packages/ModularCharactersAndBlocksPartII/design/README.md` line 293 ("Supplier: none; its natural owner is a CharacterTheory Part II"), lines 1118–1120 (§8.4 route: "if `D` is abelian, Itô's theorem (recorded gap ito-abelian-normal-degree) gives `ν(χ(1)) ≤ ν(|G : D|)`"); `design/plan.json` lines 1880–1887 (`"supplier": "none"`).

   Claim: §8.4 needs Itô's theorem from an external supplier that does not exist.

   Witness: §8.3 (README lines 1096–1104) proves Reynolds' height formula `h(χ) = ν(ξ(1))` for every constituent `ξ` of `χ|_D`. If `D` is abelian every `ξ ∈ Irr(D)` is linear, so `h(χ) = ν(1) = 0` for every `χ ∈ Irr(B)`: the abelian direction of §8.4 follows from §8.3 alone. Both cited sources argue this way: reynolds line 542 (Theorem 9 "as an immediate corollary" of Theorem 8, line 531) and martinez lines 2346–2349 (Theorem 9.8 from Corollary 8.12). A gap with supplier `none` is unowned (P1 by the brief's rule), and this one asks for a fact whose only consumer is already served by §8.3 (not minimal).

   Repair: delete the gap from `plan.json` (`gaps` entry at lines 1879–1889) and from the README (lines 112–115, lines 293–297, the `*Needs:*` of §8.4 at line 1120, the Dependencies line 1141). Rewrite the §8.4 route at lines 1117–1119 as: "if all heights vanish, §8.3 gives `ν(ξ(1)) = 0` for every `ξ ∈ Irr(D)`, so every irreducible character of the `p`-group `D` is linear and `D` is abelian; if `D` is abelian, every `ξ ∈ Irr(D)` is linear and §8.3 gives `h(χ) = ν(ξ(1)) = 0` for every `χ ∈ Irr(B)`." `*Needs:* §§6.2, 8.3; Tau Ceti `TauCeti.card_irreducibleCharacters`; CharacterTheory §2.1.` Tested on the refuting instances: `A₄` at `p = 2` (`D = V₄` abelian; constituents of `χ|_{V₄}` linear; heights `0, 0, 0, 0` for degrees `1, 1, 1, 3`) and `SL(2,3)` at `p = 2` (`D = Q₈`; the two-dimensional characters restrict to `χ₂`, height `ν(2) = 1`).

2. **F02** (P1) gap `clifford-multiplicity-dvd-index` has supplier `none`

   Location: `packages/ModularCharactersAndBlocksPartII/design/README.md` lines 298–302 ("Supplier: none; its natural owner is a further InductionRestriction part"); `design/plan.json` lines 1891–1898 (`"supplier": "none"`).

   Claim: §8.3 consumes `χ(1)/θ(1) ∣ |G : N|` (isaacs Corollary 11.29) from no roadmap.

   Witness: the brief's rule: a declared gap names a supplier roadmap and section; `supplier: none` is unowned (P1). The statement is genuinely needed (§8.3 route at line 1102; martinez line 2340 uses exactly this divisibility; reynolds line 538 uses Schur's projective-degree theorem in its place) and is provided nowhere: not in InductionRestriction Layer 7 on main (`TauCetiRoadmap/RepresentationTheory/InductionRestriction/README.md` lines 721–830 give the Schur cover and the tensor factorisation but no degree divisibility), not in CharacterTheory §4.3 (`χ(1) ∣ |G|` only), and not at the pins (`TauCeti/RepresentationTheory/Induction/Clifford/Dimension.lean` line 113 gives `dim V ∣ dim W` and `[G : inertia V] ∣ dim W`, not the quotient divisibility). The `needs` sentence (plan.json line 1897) is precise and minimal.

   Repair: keep the gap and name its supplier: in `plan.json` set `"supplier": "InductionRestriction"` and `"section": "Layer 7"` (the roadmap on main that owns projective representations and the Schur cover, in whose direction the statement lies; the intake announces the gap on that roadmap's issue). In the README line 301 replace "Supplier: none; its natural owner is a further InductionRestriction part on projective representations" by "Supplier: InductionRestriction, Layer 7". The `needs` sentence stays as it is. (The alternative, owning the statement here as a target of Layer 8 with the route through InductionRestriction Layer 7's Schur cover and the divisibility of the degree of an irreducible representation by the index of a central subgroup acting by scalars, is also acceptable; the supplier form is the smaller change.)

3. **F03** (P3) FiniteGroupInvariants listed as an import although it is later in the merge order

   Location: `packages/ModularCharactersAndBlocksPartII/design/README.md` line 108, under "Planned by other roadmaps, and imported by name and section": "FiniteGroupInvariants §6.2 owns Brauer's permutation lemma for the Galois action".

   Claim: this roadmap imports FiniteGroupInvariants §6.2.

   Witness: `merge-order/ORDER.txt` line 105 (FiniteGroupInvariants) is after line 89 (ModularCharactersAndBlocks), after which this roadmap is placed; no `*Needs:*` line consumes FiniteGroupInvariants, so nothing is imported. A later roadmap may not appear in the supplier list.

   Repair: move the sentence to the "Not owned" sentence (line 124) as "Brauer's permutation lemma for the Galois action on characters and classes, which FiniteGroupInvariants §6.2 states; §1.3 here is the version for a group automorphism, which Glauberman's argument needs." No supplier edge.

4. **F04** (P3) process word "uncertified" in the roadmap text

   Location: `packages/ModularCharactersAndBlocksPartII/design/README.md` lines 379, 486, 698, 702, 838, 1054 ("isaacs Theorem 6.32, uncertified", "navarro-2018, Chapter 2, uncertified", "feit, Chapter IV, uncertified", and three more).

   Claim: the manifest status is repeated in the prose.

   Witness: `sources.toml` already records `status = "uncertified"` for `isaacs`, `navarro-1998`, `navarro-2018`, `feit` (lines 210–267); the README's house style is timeless prose without process vocabulary.

   Repair: delete the word "uncertified" at the six locations, keeping the locators ("isaacs Theorem 6.32"); the References section's "(cited by locator: …)" already says these are cited without the text.

5. **F05** (P3) base §6.2 cited for a statement it does not make

   Location: `packages/ModularCharactersAndBlocksPartII/design/README.md` lines 253–254 ("the characterisation of defect zero (`Irr(B) = {χ}`, `|G|_p ∣ χ(1)`; a character of defect zero vanishes on `p`-singular elements)"), consumed at §8.2 line 1074 ("their central characters vanish on `p`-singular classes").

   Claim: ModularCharactersAndBlocks §6.2 supplies the vanishing of a defect-zero character on `p`-singular elements.

   Witness: the base README at its head (`TauCetiRoadmap/RepresentationTheory/ModularCharactersAndBlocks/README.md`, defect-zero bullet of §6.2) states the matrix-algebra form, `|G|_p ∣ χ(1)`, `Irr(B) = {χ}` and `IBr(B) = {χ⁰}`, but not the vanishing. It follows from the base's §3.1 (`Φ_φ` vanishes on `p`-singular elements) with `Φ_{χ⁰} = χ` when `Irr(B) = {χ}`, `IBr(B) = {χ⁰}`.

   Repair: at line 254 write "a character of defect zero vanishes on `p`-singular elements, since it is the projective character `Φ_{χ⁰}` of §3.1", and add base §3.1 to the `*Needs:*` of §8.2 (line 1081 already lists it) and of §6.4 (line 883).

6. **F06** (P3) plan and README disagree on two prerequisites

   Location: `packages/ModularCharactersAndBlocksPartII/design/plan.json` target 2.1 (prerequisite `tauceti:TauCeti.cliffordObstruction_eq_zero_iff`) against README §2.1 `*Needs:*` lines 420–421 (Mathlib `SemidirectProduct`, `LinearMap.det`; InductionRestriction Layer 7); README §2.3 line 473–474 ("Tau Ceti … `Representation.isIntegral_character`") against plan target 2.3 (`mathlib:Representation.isIntegral_character`).

   Claim: the same prerequisites are listed in both files.

   Witness: `Representation.isIntegral_character` is Mathlib (`Mathlib/RepresentationTheory/Character.lean` line 102, namespace `Representation`); `TauCeti.cliffordObstruction_eq_zero_iff` (`TauCeti/RepresentationTheory/Induction/Clifford/Obstruction.lean` line 318) is named in the README's §2.1 prose but not in its `*Needs:*`.

   Repair: in README §2.3 move `Representation.isIntegral_character` to the Mathlib items of the `*Needs:*` line; in §2.1 either add `TauCeti.cliffordObstruction_eq_zero_iff` to `*Needs:*` or drop it from plan target 2.1 (the proof route does not use it, so dropping is the smaller change).

7. **F07** (P3) the action on functions duplicates Mathlib's `arrowAction`

   Location: `packages/ModularCharactersAndBlocksPartII/design/README.md` line 327 ("Define the action of `S` on functions `Γ → ℂ` by `(s · χ)(g) = χ(s⁻¹ • g)`").

   Claim: the action is a new definition of this roadmap.

   Witness: Mathlib at the pin, `Mathlib/Algebra/Group/Action/Basic.lean` line 103, `arrowAction : MulAction G (A → B)` with `smul g F a := F (g⁻¹ • a)`, a `def` (not an instance), exactly this rule.

   Repair: at line 327 write "Take the action of `S` on functions `Γ → ℂ` to be Mathlib's `arrowAction` for the action of `S` on `Γ`, so `(s · χ)(g) = χ(s⁻¹ • g)`", add `arrowAction` to the Mathlib supplier contract (line 184 ff.) and to the `*Needs:*` of §1.1; the first API bullet (left-action laws) is then Mathlib's and can be dropped.

Previous review: none. Elaboration: not available (this lane does not elaborate; the design stage carries no `Suggested.lean`).

Gate output (run on the candidate README against the merge order and the content checkout):

```
candidate: ModularCharactersAndBlocksPartII is not in the merge order yet; checked as if placed after ModularCharactersAndBlocks (the intake inserts it when its design is accepted)
depcheck: 240 roadmaps, 2351 edges, 0 problem(s)
```

No UPWARD or CYCLE line. The two P1 findings below are the brief's rule on declared gaps whose supplier is `none`; the mathematics of the design is sound at every sampled target and every Check I recomputed.

## Verified sound

**Principles.** No route-specific shortcut (every statement is for arbitrary finite `Γ`, solvable `S`, arbitrary `p`); the base is extended, not re-planned (Layers 6–9 start at the base's §§6.2–8.2 and own only heights, covering, Fong–Reynolds and the normal-defect-group structure, none of which the base states); one direction of supply (gate: 0 problems); own words with locators throughout; no algorithm; no Lean file at this stage, so no sorry'd data and no `set_option`.

**Suppliers resolved (every citation, every round).** ModularCharactersAndBlocks at its head (#1775): §§0.2, 1.1–1.3, 2.1–2.4, 3.1, 4.1–4.3, 5.1, 6.1–6.3, 7.1–7.2, 8.1–8.2 all exist with the content cited; `existsUnique_blockIdempotent_map_residue` (its `Suggested.lean` line 57), `IsDefectGroup` (109), `isDefectGroup_conj` (118), `isDefectGroup_iff_sylow_of_augmentation_ne_zero` (128), `brauer_first_main` (140) declared; its §8.2 names Martínez Definition 7.3 and Theorem 7.7 for covering as cited here. LocalFiniteGroupTheory at its head (#1634, a new roadmap folder): L1 `exists_conj_eq_of_isComplement'` with the hypothesis "`N` or `G ⧸ N` solvable" (README line 146–147), L3 Glauberman's lemma with transitive `G` and compatible actions, and `exists_mem_fixedPoints_mul_of_forall_mem` (lines 192–198); this roadmap uses them only for solvable `S`. CharacterTheory on main: §2.1 (sum of squares), §3.5 (`TauCeti.sum_characterTable_mul_conj`, primitive central idempotents), §3.6 (external tensor products, characters of `G × H`), §4.3 (central characters, `finrank_dvd_card`), §4.4 (`fieldOfValues_eq_map_fixedField_stabilizer`, the value law `(σ·χ)(g) = χ(g^j)`). InductionRestriction on main: Layer 1 (conjugate character `({}^s A).character x = A.character ⟨s⁻¹ x s, _⟩`), Layer 2 (induced characters, Frobenius reciprocity), Layer 5 (Clifford), Layer 7 (`cliffordObstruction`, tensor factorisation with the inverse factor set, Schur cover). FiniteGroupInvariants §6.2 at #1708 exists (R03 is about its placement only).

**Library declarations opened at the pins (file and line).** Tau Ceti: `irreducibleCharacters` (CharacterTable/Table.lean 114), `mem_irreducibleCharacters_iff` (123), `card_irreducibleCharacters` (181), `characterTable` (337), `sum_characterTable_mul_conj` (585), `ClassFunction.characterPairing` (Pairing.lean 48), `virtualCharacters` (VirtualCharacter.lean 127), `Representation.nonempty_equiv_of_character_eq` (Determined.lean 49, root namespace), `conjNormalFDRep` (Induction/Conjugate.lean 683), `conjNormalFDRep_ρ` (836), `char_conjFDRep` (485), `inertia` (Inertia.lean 94), `le_inertia` (111), `mem_inertia_iff` (100), `FDRep.cliffordCorrespondence` (Clifford/Classes.lean 125), `FDRep.clifford_restrict_dvd_finrank` (Dimension.lean 113: `dim V ∣ dim W`, `[G : inertia V] ∣ dim W`, `[G : inertia V] ∣ [G : N]`, as the README states), `FDRep.clifford_restrict_inertia_eq_top_of_coprime` (142), `clifford_restrict_character` (Decomposition.lean 305), `IsProjectiveInertiaExtension` (Obstruction.lean 87), `exists_isProjectiveInertiaExtension` (162), `cliffordObstruction_eq_zero_iff` (318), `tensorRepEquiv` (TensorFactorization.lean 329), `isIrreducible_tensorRep_iff` (ProjectiveCorrespondence.lean 223), `tmulIntertwining_bijective` (149), `IsPrimitiveRoot.cyclotomicIrreducibleCharacterAction_apply` (Cyclotomic/Action.lean 201), `FDRep.characterField` (FieldOfValues.lean 44), `Representation.centralCharacter` (CentralCharacter.lean 89), `centralCharacter_classSumCenter_mul_character_one` (162), `isIntegral_centralCharacter_classSumCenter` (180), `Representation.finrank_dvd_card` (Degree.lean 117), `Representation.primitiveCentralIdempotent` (CentralIdempotent.lean 301), `classSum` (ClassSum/Basic.lean 31), `classSumCenter` (ClassSum/Basis.lean 76), `SemidirectProduct.range_monoidHomSubgroup` (GroupTheory/SemidirectProduct.lean 33). Mathlib: `SemidirectProduct.inl_aut` (GroupTheory/SemidirectProduct.lean 138, `inl (φ g n) = inr g * inl n * inr g⁻¹` as quoted), `range_inl_eq_ker_rightHom` (175), `MulDistribMulAction.toMulAut` (Algebra/Group/Action/End.lean 229), `FixedPoints.subgroup` (GroupTheory/GroupAction/Defs.lean, namespace `FixedPoints`), the quotient instance `MulDistribMulAction (G ⧸ H) (FixedPoints.subgroup H α)` (GroupTheory/GroupAction/OfQuotient.lean 62), `MulDistribMulAction (normalizer H) H` and `Subgroup.normalizerMonoidHom` (GroupTheory/Subgroup/Centralizer.lean 177, 186), `Subgroup.exists_right_complement'_of_coprime` (SchurZassenhaus.lean 277), `IsPrimitiveRoot.autToPow` (RootsOfUnity/PrimitiveRoots.lean 791), `ZMod.chineseRemainder` (Data/ZMod/Basic.lean 889), `padicValRat` (Padics/PadicVal/Basic.lean 126), `IsAdicComplete` (AdicCompletion/Basic.lean 57), `Representation.isIntegral_character` (RepresentationTheory/Character.lean 102). No cited name is missing at the pins. Itô's theorem and the Clifford quotient divisibility are at neither pin (grep for degree-divides-index statements in `TauCeti/RepresentationTheory` and `Mathlib/RepresentationTheory`: only `Dimension.lean` 113–118, which is weaker).

**Sources: the seeded sample, read at the locators.**
- 1.1: glauberman line 94 defines `η^a(g) = η(g^{a⁻¹})`, a right action; the README's `(s · χ)(g) = χ(s⁻¹ • g)` is the corresponding left action (invariance sets coincide); hartley-turull line 302 fixes the standing hypotheses (coprime orders, `χ ∈ Irr_S(G)`). Supported.
- 1.2: glauberman line 287, Lemma 3 (a)–(c), exactly the three statements; the source proves them from Glauberman's lemma. Supported.
- 2.1: glauberman line 100, Theorem 1: absolutely irreducible `R` over a field `K`, `|A|` prime to the degree, `R^a ≅ R`, unique `R*` with `det R*(a) = 1`; proof lines 107–171 uses only Schur-type scalars and the Bezout rescaling, no root extraction and no finiteness of `G`. The README's "endomorphisms are scalars" hypothesis is what the proof uses. Supported.
- 2.2: glauberman line 234, Theorem 2 (a); line 263 names it the canonical extension; hartley-turull line 304, Definition 3.1 (determinantal order prime to `|S|`). The equivalence of the two normalisations: `o(det χ̂) = lcm(o(det χ̂|_Γ), o(det χ̂|_S))` with the first factor dividing `|Γ|`, so coprime to `|S|` iff trivial on `S`. Supported.
- 2.4: glauberman line 240, Theorem 2 (c), with the converse at line 242. Supported.
- 3.1: glauberman line 266, Lemma 2 (a)–(c) (line 272: `C_{GA}(at) = A C_T(t)`); proof line 278 uses conjugacy of complements for cyclic `A`. Supported.
- 4.1: glauberman line 481, Lemma 4 (`B` an operator group, no coprimality on `B`); line 503, Definition (a) and (b); line 524, Lemma 5. Supported.
- 4.4: glauberman lines 601, 607, 623, Corollaries 7–9, as stated. Supported.
- 4.5: glauberman line 537, Theorem 4 (a)–(c); spath-vallejo line 118–130, `π(G,A) = π(T, A/B) ∘ π(G,B)` for `B ⊴ A`, `T = C_G(B)`. Supported.
- 5.1: glauberman line 644, Theorem 5 (e), proof lines 657–668 (reduction along the series, then the central-character integrality at `n = 1`), the README's route. Supported.
- 6.2: martinez line 728, Theorem 3.4 (`|D| = p^{d(B)}` with `d(B)` the numerical defect of line 719–721), proof lines 783–831; mnst line 51–55 recalls the same statement. Supported.
- 7.1: martinez line 710, Theorem 3.3 (Min–Max), both bullets; line 984, Lemma 4.4. Supported.
- 7.2: martinez line 1652, Proposition 7.6; line 1790, Proposition 7.11; line 1642 (Problem 7.4, the idempotent sum); line 1760, Corollary 7.8; line 1763, Proposition 7.9; line 1976, Lemma 8.6. Supported.
- 7.6: martinez line 1985, Theorem 8.8; line 2295, Theorem 9.6 (`T` the stabiliser in `N_G(D)`); sambale line 499, Theorem 1.18 (extended first main theorem, the inertial index prime to `p`); sambale line 509, Theorem 1.19 (Fong–Reynolds). Supported.
- 9.2: ruhstorfer line 16 (the conjecture), line 20 (Theorem A, `ℓ = 2`), line 33 (Corollary B); martinez line 2360, Conjecture 9.9. Supported.
Also read: glauberman line 173 (Lemma 1), 299 (Theorem 3, proof 308–361), 364 (Corollary 4), 375 (Corollary 5 (a)–(b), lines 382–387), 454 (Corollary 6 (c), line 465), 636 (Theorem 5 (a)–(d)); hartley-turull line 84 (Theorem A is conditional on Condition 6.10, as the README says, completed by geck lines 29–36) and line 91 (reduction to prime order); kessar-malle line 25; mnst lines 48, 70, 73; reynolds lines 60, 133, 149, 201, 509, 531, 542; martinez lines 351–354, 373, 414, 512, 566, 583, 699, 760, 1823–1834, 1928, 2011, 2018–2030, 2131, 2161, 2222, 2264–2296, 2321, 2328–2349. All agree with the README.

**Ownership against open work.** `tauceti-roadmap roadmaps grep` over the 459 open heads and main for "Glauberman correspondence", "Fong–Reynolds", "Alperin–McKay", "Gallagher", "Brauer's permutation lemma", "Reynolds": no other roadmap states the canonical extension, Gallagher's correspondence, the Glauberman correspondence, heights, Fong–Reynolds, Reynolds' theorem or the two predicates. GlaubermanZStar (#1778) consumes the base only; OddOrderTheorem (#1777) and LocalFiniteGroupTheory use "Glauberman" for the `ZJ`, `Z*` and signalizer theorems. FiniteGroupInvariants §6.2 owns the Galois-action permutation lemma (R03). `scratch/overlaps.md`: no open pull request changes this roadmap, no cited id is dropped, no id is defined only by an open revision. Ownership against open pull requests whose files the brief did not give was not checked (the brief lists them all with files, so none).

**Adversarial table.** One row per sampled target, headline and finding-touched statement; values computed by hand.

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| §1.1 action `(s·χ)(g) = χ(s⁻¹•g)` | `C₇ ⋊ C₃`, `r ↦ r²`, `χ(r) = ζ₇` | `s⁻¹•r = r⁴` (`2·4 ≡ 1 mod 7`), `(s·χ)(r) = ζ₇⁴`; wrong model `χ(s•r) = ζ₇²` | left action; agrees with `char_conjFDRep` in the internal case (`χ(s⁻¹gs)`) | R07 (cite `arrowAction`) |
| §1.1 `Irr_S(Q₈)` for `SL(2,3)` | `S = C₃` | linear characters: trivial fixed, the three others permuted cyclically; `χ₂` fixed; `|Irr_S| = 2`, `C = {±1}` | holds | none |
| §1.2 fixed classes | `Q₈ ⋊ C₃`; `C₂` on `S₃` by a transposition; `C₂` swapping `C₂ × C₂` | `2` invariant classes `= 2` classes of `{±1}`; non-coprime: `3` fixed classes vs `2` classes of `⟨t⟩`; coset `(1,0)+C = {(1,0),(0,1)}` has no fixed point | holds; both negative controls refute the uncoprime statement | none |
| §1.3 permutation lemma | `C₂ × C₂` on `𝔽₂³` by `1+E₁₂`, `1+E₁₃` | each element fixes `4` vectors (`v₂ = 0`, resp. `v₃ = 0`) and `4` characters (`w₁ = 0`); the group fixes `2` vectors, `4` characters | single-element statement holds, group statement fails, as the Check says | none |
| §2.1 normalised extension | `Q₈`, `A = C₂` by conjugation by `i`, `ρ` two-dimensional | `ρ*(a) = c ρ(i)`, `ρ*(a)² = c² ρ(−1) = −c² = 1`, `c = ±√−1`, `det = c² det ρ(i) = −1` | no determinant-one extension; coprimality (`2, 2`) needed | none |
| §2.1, `Γ = 1`, `A = C₂` | `V = ℚ` | trivial extension `det 1`; sign extension `det −1` | uniqueness instance | none |
| §2.2 canonical extension | `SL(2,3)`, `χ₂` | order-3 element: eigenvalues `ω, ω²`, trace `−1`, `det 1`; `χ̂λ` has `det = λ²` on `C₃`, `≠ 1` for `λ ≠ 1` | unique; the equivalence "order of `det` prime to `|S|`" verified by `o(det) = lcm(o(det|_Γ), o(det|_S))` | none |
| §2.2 | `S₃ = C₃ ⋊ C₂`, `χ = 1` | extensions `1`, `sgn`; `det sgn = sgn`, `−1` on `C₂` | canonical extension `1` | none |
| §2.3 values | `SL(2,3)` | `χ̂ = 2, −2, 0, −1, 1` on the classes; `(χ̂ω)(a) = −ω ∉ ℤ`; `ℚ(ζ₄) ∩ ℚ(ζ₃) = ℚ`, `ℚ(ζ₄) ∩ ℚ(ζ₈) = ℚ(i)` | holds | none |
| §2.4 Gallagher | `Q₈`, `N = Z(Q₈)`, `θ` faithful | `−1 ∈ [Q₈,Q₈]`, `θ` does not extend; `|Irr(Q₈|θ)| = 1`, `|Irr(V₄)| = 4` | the extension hypothesis is needed | none |
| §3.1 cosets | `S₃`, `SL(2,3)`, `D₈` | `aC₃` = three transpositions, one class; `aQ₈` = classes of `a`, `−a`, sizes `4 + 4 = 8`, `C_{SL(2,3)}(a)` of order `6 = A × C`; in `D₈` the reflections split as `{a, ax²}`, `{ax, ax³}` | holds; `D₈` refutes without coprimality | none |
| §3.2 sign | `SL(2,3)` | `χ̂(a) = −1 = ε·χ*(1)`, `χ̂(−a) = 1 = ε·χ*(−1)` gives `ε = −1`, `χ* = sgn`; generator `a²`: `−a²` has order `6`, trace `1`, same `(ε, χ*)` | holds | none |
| §3.3 | `C₃ × C₃` on `Q₈` through the first factor | canonical extension `η × 1` on `SL(2,3) × C₃`; kernel element: `C_a = Q₈`, `ε = 1`, `λ = χ₂`; non-kernel: `C_a = {±1}`, `ε = −1`, `λ = sgn` | holds | none |
| §3.4 restriction formula | `SL(2,3)`, `B = 1`; `3^{1+2}_+ ⋊ C₂`; `C₃ × C₅` with `C₂` inverting `C₅` | `(2 sgn + sgn)/3 = sgn`; `(3ω − ω)/2 = ω` (and `(3ω + ω)/2 = 2ω`, so `ε'` is not unique at `|A| = 2`, as the README says); `χ|_C = ψ = λ`, `Γ = C · ker χ = C₃ · C₅` | holds; the `|A| = 2` remark is correct and needed | none |
| §4.1 series correspondence | `C₆` on `Q₈ × C₅`, two series | `C₆ ⊵ C₃ ⊵ 1`: `sgn ↦ sgn × 1 ↦ χ₂ × 1` (`ε = 1` then `−1`); `C₆ ⊵ C₂ ⊵ 1`: `sgn ↦ χ₂ ↦ χ₂ × 1` | same value; independence instance | none |
| §4.2 `p`-group | `SL(2,3)`; `3^{1+2}_+` with `(x,y,z) ↦ (−x,−y,z)` | `(2sgn + sgn)/3 = sgn`; `C = Z(Γ)`, `χ|_C = 3ω`, `(3ω − ω)/2 = ω` | holds | none |
| §4.3 | `C₉` on `C₁₉` | `u` of order `9` mod `19`; `r^u = r` only for `r = 1`, `C = 1`; `ψ_j(r^u) = ψ_j(r)` iff `19 ∣ j(u−1)` iff `j = 0`, `Irr_S = {1}` | holds | none |
| §4.4 count | `F₂₁ = C₇ ⋊ C₃` with `r ↦ r⁻¹`, `s ↦ s` | automorphism check `α(srs⁻¹) = r⁻² = α(r²)`; `C = ⟨s⟩`; the two 3-dimensional characters (orbits `{1,2,4}`, `{3,5,6}`) are swapped, the three linear ones fixed; invariant classes `{1}`, two `s`-classes: `3 = 3 = 3` | holds | none |
| §4.5 correspondence (headline) | `C₂` swapping `C₃ × C₃`; `C₂` swapping `C₂ × C₂` | `(ψ_a × ψ_a)|_diag(r,r) = ζ₃^{2a}`, so `(ψ_a×ψ_a)* = ψ_{2a}`, not `ψ_a`; `SL(2,3)`: `[χ₂|_C, sgn] = 2 ≡ −1 (mod 3)`; non-coprime: `(1,1)` and `(−1,−1)` both restrict to `1` on the diagonal with multiplicity `1` | holds; uniqueness route (prime-index `T ⊴ S`, `p`-group property) closes | none |
| §4.6 | `C₃ × C₃` swap, `α` inversion, `j = 2` | `(ψ_{−a}×ψ_{−a})* = ψ_{−2a} = ψ_{2a}∘α⁻¹`; `(ψ_{2a}×ψ_{2a})* = ψ_{4a} = ψ_a = (ψ_{2a})^{(2)}` | holds | none |
| §5.1 degree bound (headline) | `SL(2,3)`; `3^{1+2}_+`; `θ = 1` | `2 ∣ 4·1`; `3 ∣ 9·1`; reverse `|Γ:C|·1 ∤ 1` for `C ≠ Γ`; route: `[Γ⋊A : A×C] = |Γ:C|`, `χ̂(a) = ±θ*(1)` | holds | none |
| §5.2 predicate | `SL(2,3)`, abelian `Γ` | `1 ∣ 2`; `θ* = θ|_C` linear, `1 ∣ 1`; variant `θ(1) ∣ θ*(1)`: `2 ∤ 1` | holds | none |
| §6.1 defect classes | `S₃`, `p = 2` | `e_{B₀}`: coefficients `1/3 ≡ 1`, `1/3 ≡ 1`, `0`, so `e_{B₀} = 1 + r + r²`; `{1}` defect class (`λ = 1`), Sylow of `C_G(1)` of order `2`; `r + r²`: `2/3 ≡ 0`, `−1/3 ≡ 1`, `0`; defect class `Cl(r)` with `λ = 2·(−1)/2 = −1`, Sylow of `C₃` trivial; Osima at `x = r`: `2/6 = 1/3`; `e_1 = (1/6)Σg ∉ ℤ₂[G]` | holds | none |
| §6.2 Brauer on heights (headline) | `S₃`, `SL(2,3)` at `3`, `A₅` at `2` | `a = d = 1`, degrees `1,1`; block `{χ₂, χ₂ω, χ₂ω²}` separated from `{1,ω,ω²}` by `ω_χ(−1) = −1 ≢ 1 (mod 3)`, `d = 1`, `ν₃(2) = 0`; `A₅`: `B₀ = {1,3,3,5}`, `D = V₄`, `1 ∣` all, `p^a = 4 ∤ 1` refutes the wrong model | holds; route (unit `ω_χ(𝒞⁺)`, then `φ(x⁻¹)` unit from Osima with `Φ_φ(1)/|G| ∈ O`) closes | none |
| §6.3 heights | `SL(2,3)` at `2`; `D₈`; `S₃` | `ν₂(1,1,1,2,2,2,3) = 0,0,0,1,1,1,0`, `|Irr₀| = 4`; `0,0,0,0,1`; `std`: `ν = 1 = a`, `d(std) = 0`; no truncation since `a − d ≤ ν(χ(1)) ≤ a` | holds | none |
| §6.4 | `A₅` at `2`; `SL(2,3)` at `3` | `N(V₄) = A₄`, one block, degrees `1,1,1,3`, four height-zero; `N(C₃) = C₆`, two blocks of three linear characters | holds | none |
| §7.1 Min–Max | `S₃` at `2` and `3`; `G = 1` | `λ_{B₀}(𝒞_t⁺) = 3 ≡ 1`, `D_{B₀} ≤ ⟨t⟩`; `a_{B₀}(Cl r) = 1`, `D_r = 1`; `p = 3`: `λ(𝒞_t⁺) = 3 ≡ 0` (else `C₃ ≤ 1`), `λ(𝒞_r⁺) = 2 ≢ 0`, `D_r = C₃` | holds | none |
| §7.2 covering | `S₃`, `N = C₃`, `p = 2` | `ω_std(𝒞_r⁺) = 2·(−1)/2 = −1 = ζ + ζ² = ω_λ(𝒞_r⁺)`; `{λ}`, `{λ̄}` one `G`-orbit | holds | none |
| §7.3 | `S₃`, `N = C₃`, `p = 3` | block with `D = C₃` dominates both blocks of `𝔽₃[C₂]`, defect groups `1 ≤ C₃N/N = 1` | holds | none |
| §7.4 Fong–Reynolds heights (headline) | `S₃` at `2`, `b = {λ}`; `S₄`, `N = V₄`, `p = 3` | `T = C₃`, `λ^G = std`, `h(λ) = 0 = h(std) = 1 − (1 − 0)`; `T = D₈ ⊇ V₄` (stabiliser of `λ` with kernel `⟨(13)(24)⟩`), two linear extensions (`λ'((12)(34)) = −1` fixes two of four), each of defect zero at `3`, inducing to the two degree-3 characters, heights `0` | holds | none |
| §7.5 regular blocks, Fong | `S₃`, `N = C₃` | `λ_{B₀}(𝒞_t⁺) = 3 ≡ 1 ≠ 0` (not regular); `λ_std(𝒞_t⁺) = 0`; `z ↦ λ_{\{λ\}}(z_N)` is multiplicative on the basis `1, r+r², 𝒞_t⁺` (`(𝒞_t⁺)² ≡ 1 + (r + r²)` maps to `0 = 0²`), so `{λ}^G` is defined and equals the defect-zero block; `p = 3`: `|G : PN| = 2`, `P ∩ N = C₃` | holds | none |
| §7.6 extended first main | `S₃` at `2`, `3`; `S₄` at `2` | `P C_G(P) = ⟨t⟩`, index `1`; `N(C₃) = S₃`, index `2`; `V₄`: `C_{S₄}(V₄) = V₄`, stabiliser `S₄`, index `6` even, and the single 2-block of `S₄` has defect group `D₈` | holds; the index condition is needed | none |
| §8.1 | `S₃` at `2`; `SL(2,3)` at `3` | `std(t) = 0`; `χ₃ = 3, 3, −1, 0, 0, 0, 0` | holds | none |
| §8.2 canonical character | `D₈`; `C₂ × C₃` at `2`; `P = 1` | `θ = 1`, heights `{0,1}`; three blocks `{ξ × ψ}`, heights `0`; defect zero. Route: `p`-regular `x` centralises `P`, `xu` (`u ∈ P`) is `p`-regular only for `u = 1`, so the quotient map sends `Cl(x)⁺` to `Cl(x̄)⁺` injectively; two dominated defect-zero blocks have equal `λ` on `p`-regular classes and `0` on `p`-singular ones | holds | R05 (attribution) |
| §8.3 height formula | `SL(2,3)` at `2` | `χ₃|_{Q₈} = ` sum of the three nontrivial linear characters (`3, 3, −1, −1, −1`), height `ν(1) = 0`; two-dimensional characters restrict to `χ₂`, height `ν(2) = 1`; `ν(|G:D|) = ν(|G:T|) + ν(|T:N|) + ν(|N:D|)` with the middle term `0` | holds; the non-invariant `θ_ξ` case is covered by the gap as stated (general `N ⊴ T`) | none |
| §8.4 Reynolds (headline) | `A₄` at `2` (`V₄` abelian); `SL(2,3)` at `2` (`Q₈`); `D₈`; `D × H` | all constituents of `χ|_{V₄}` linear, heights `0,0,0,0`; `Q₈` nonabelian, height `1` occurs; `D₈`: degree-2 character height `1`; `D × H`: `h(ξ × ψ) = ν(ξ(1))` | holds in both directions from §8.3 alone | R01 (drop the Itô route) |
| §9.1 predicate (headline) | `S₃`; `S₄` at `2`; `G = 1` | cyclic defect groups, heights `0`; `S₄`: `a = d = 3`, degree `2` has height `1`, `D₈` nonabelian; one block of defect zero | instances hold; cited theorems correctly attributed (kessar-malle line 25, mnst line 70, ruhstorfer line 33) | none |
| §9.2 predicate (headline) | `S₃` at `2`; `A₅` at `2`; `SL(2,3)` at `3` | `N(C₂) = C₂`, `2 = 2`; `N(V₄) = A₄`, `4 = 4`; `N(C₃) = C₆`, `3 = 3` for both blocks of positive defect | instances hold | none |
| Conventions: central characters | `S₃`, `p = 2`, transpositions | `ω = 3·1/1, 3·(−1)/1, 3·0/2 = 3, −3, 0`; `λ_{B₀} = 3 ≡ 1` | witness correct | none |
| Conventions: `q ∈ O` iff `ν_p(q) ≥ 0` | `p = 2`, `3/2`, `2/3` | `ν₂(3/2) = −1`, `ν₂(2/3) = 1` | witness correct | none |
| Gaps: minimality | `ito-abelian-normal-degree` against §8.3 | abelian `D` gives `h(χ) = ν(ξ(1)) = ν(1) = 0` | redundant | R01 |

**Shape and completeness.** Nine layers, each with `### Examples` and `### Dependencies`; every definition (§§1.1, 2.2, 3.2, 4.1, 4.5, 5.2, 6.1, 6.3, 7.5, 8.2, 9.1, 9.2) has API bullets and at least three Checks, each discriminating (a wrong model named: the `χ(s•g)` convention, `p^a ∣ χ(1)`, `θ(1) ∣ θ*(1)`, `ψ_a` instead of `ψ_{2a}`, the index condition of §7.6); every theorem has its hypotheses in the sentence and a locator; every `*Needs:*` line lists items; Unicode mathematics, no LaTeX, no target tables, no process narrative except R04; no machine paths; cross-roadmap citations by name and section. No backticked name is presented as this roadmap's own (no `Suggested.lean` yet). `sources.toml` records every cited work with `cited_for`; the four paywalled texts are `uncertified` and are cited by locator only, as settled.

**Headline theorems named for `Suggested.lean` (package stage).** The README's "How to read the build" names: the canonical extension (§2.2), Gallagher's correspondence (§2.4), the `p`-group characterisation (§4.5), existence of the Glauberman bijection with its constituent, field-of-values and degree properties (§§4.5–5.1), the counting theorem (§4.4), Brauer's theorem on heights (§6.2), Fong–Reynolds preservation of heights (§7.4), Reynolds' theorem (§8.4) and the two predicates (Layer 9). All are statable at the pins: the coprime-action strand on `Γ ⋊[MulDistribMulAction.toMulAut S Γ] S`, `TauCeti.irreducibleCharacters ℂ _`, `FixedPoints.subgroup`, `LinearMap.det`; the block strand with block idempotents as primitive idempotents of `Subalgebra.center k (MonoidAlgebra k G)`, `e_χ` from `TauCeti.Representation.primitiveCentralIdempotent`, defect groups through a Brauer projection with a real body, and `padicValNat`. The base's `Suggested.lean` names cannot be imported (no roadmap module is importable), so the package gives these simple definitions its own fully qualified names under its namespace; this is expected and is not a duplication finding. The one-tactic probe and the `#check @name` comparison are package-stage items and were not run here.

## Not verifiable

- `isaacs` (Theorems 3.12, 6.15, 6.32, Corollaries 6.17, 11.29, Chapter 13), `isaacs-1973`, `navarro-1998` (Chapter 3, Theorem 5.9), `navarro-2018` (Chapter 2), `feit` (Chapter IV): paywalled, settled as `uncertified`; cited by locator only. Each is a secondary citation beside a certified one (glauberman, martinez, reynolds) that I did verify, except the gap statements (Isaacs 6.15, 11.29), which are standard and whose use in the proofs is confirmed by martinez line 2340 and reynolds line 538.
- The elaboration of a Lean file: no `Suggested.lean` exists at the design stage and this lane does not elaborate.

## Source issues

- none

<!-- tauceti-roadmap-review {"agent": "claude", "head": "b7084675f15d3116d0a073b952c986383ff5ca20", "job": "REV-DESIGN-ModularCharactersAndBlocksPartII", "model": "fable", "worker": "chris-x9"} -->
