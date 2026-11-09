# Review of ReductiveGroups (pull request #1676 at 1b262ae)

**Verdict:** needs changes

This is a full review of `TauCetiRoadmap/ReductiveGroups/` at `1b262ae969b4d3898ddb77c4ba44546b9ba92039`. Since `e6ddc5b`, the head the previous review read, only `README.md` changed (+417/−223). `Suggested.lean`, the pull-request description and `lake-manifest.json` are unchanged.

- The gate passes and the dependency check is clean. `Suggested.lean` elaborates with exactly eight `sorry` warnings, and no declaration closes with one tactic.
- The seeded sample (§1.1, §8.1, §8.2) is at the cited locators, as are the locators the README changed this round.
- Four of the previous review's seven findings are repaired: R03's list of restated theorems, R04, R05 and R07. Three are not: R01 (the pin), R02 (the Levi headline) and R06 (the description).
- Six findings, four of them blocking:
  - **R01 and R02 carry over.** The pin finding has grown: this round's repairs cite 39 more names that exist only at main's Tau Ceti.
  - **R03 is new.** The Bruhat decomposition, as a Tits system on `G(k)`, is statable at both pins but is neither stated nor named as unstatable.
  - **R04 is new.** The README still restates a set of pinned constructions as targets. Several exist even at the branch pin, including the Hopf/points equivalence that §1.1 (a seeded target) restates and the 9B carriers it calls "without native counterpart".
  - **R05** is a P3 coarse dependency cycle introduced by the repaired §3A.6 route. **R06** carries the unchanged description.

**Paths.** `README.md` and `Suggested.lean` mean `TauCetiRoadmap/ReductiveGroups/…`. Tau Ceti paths are relative to the `TauCeti/` source root.

**Pins.**
- The branch pins Tau Ceti `a91d3aaf` and Mathlib `6b7abb3c` (this head's `lake-manifest.json`). These are the pins the brief defines.
- Main pins Tau Ceti `2fd255d9` and Mathlib `1b1ccf4b`.

## Previous findings at this head

- **Previous R01 (P2, pin): not repaired, and wider.** `lake-manifest.json` still pins `a91d3aaf`. `Suggested.lean:61–63` still says the manifest's revision lacks `Parabolic.Basic`. The README now cites 39 more Tau Ceti names that exist only at `2fd255d`. Raised again as R01.
- **Previous R02 (P2, Levi headline): not repaired.** `Suggested.lean:57–64` is unchanged: "the parabolic predicate is the missing carrier here and the decomposition is not stated". Raised again as R02.
- **Previous R03 (P2, restated pinned theorems): repaired for every item it listed.** In each case the target is now consumed and only the remainder stays a target. I opened each declaration at `2fd255d` (rows in the table):
  - Lie–Kolchin (`README.md:239–247`, `:1377–1384`);
  - the torus and reductive quotients (`:248–250`, `:1384–1385`, `:1397–1400`);
  - pseudo-reductivity and `Res_(K/k) 𝔾_m` (`:251–278`, `:3419–3448`);
  - exp/log and contractibility (`:279–295`, `:1447–1462`);
  - binary forms and the matrix-monoid criterion (`:296–321`, `:3677–3702`, `:3751–3762`);
  - the dynamic subgroups (`:221–238`, `:1861–1869`).

  The audit of the remaining layers that R03 asked for is R04 below.
- **Previous R04 (P3, Fadell–Neuwirth): repaired.** `README.md:3909–3912` now reads "§II, Theorem 3, p. 114, for the forget-last-point fibration, and Theorem 1, Theorem 2 and Corollary 2.1, pp. 111–113".
  - In `fadell-neuwirth`, Theorem 3 is at line 129, p. 114: `F_{m,n} → F_{m,r}` with fibre `F_{m+r,n−r}`.
  - Corollary 2.1 is at line 99, p. 113: for `M = ℝ^r`, `π_i(F_{0,n})` is a sum of `π_i` of wedges of `S^{r−1}`, so `PConf_n(ℂ)` is aspherical.
  - "Corollary 2.1" is better than the previous review's suggestion. Corollary 2.2 (line 104) is about compact surfaces, and `ℂ` is not compact.
  - "(cited by title)" is gone from the reference.
- **Previous R05 (P3, unnamed supplier in §3A.6): repaired.** `README.md:1245–1255` names CompactGroups Layer 1 and LieGroups Layer 7 (*Representations and holomorphic descent*, *Compact-real-form pairs and algebraic morphisms*). It also adds a *Needs:* line. Both sections exist on main (`RepresentationTheory/CompactGroups/README.md:226–247`, `RepresentationTheory/LieGroups/README.md:1013,1031`). The new edge creates R05 below.
- **Previous R06 (P3, description and order): not repaired.** The description is byte-identical to the one the previous review read. Raised again as R06.
- **Previous R07 (P3, run-together tokens): repaired.**
  - With code spans removed, the pattern `(Layer|rank|norm|degree|order|value|of|at|…)[0-9]` matches 0 lines, against 75 at `e6ddc5b`.
  - The formulas the finding named now sit in code spans (`README.md:1450–1451`, `:1952`). `sum_` no longer occurs outside code spans.

## R01 (P2) — the branch pins Tau Ceti `a91d3aaf`, where 123 of the README's Tau Ceti names do not exist (39 of them added this round)

**Location.**
- `README.md:221–338` (supplier contracts), `:1377–1400`, `:1447–1462`, `:1861–1869`, `:3419–3448`, `:3677–3702`, `:3751–3762`.
- `Suggested.lean:32–44`: "Proved in the pinned Tau Ceti … `TauCeti.SchemeAction.isLocallyClosed_orbit` …".
- `Suggested.lean:61–63`: "The Tau Ceti revision this file's manifest pins does not contain the module `TauCeti.Algebra.AlgebraicGroup.Parabolic.Basic`".

**Claim.** The declarations the README and the module docstring cite exist at the pins.

**Witness.**
- I took every backticked dotted name in the README and indexed declarations in both Tau Ceti trees: 123 Tau Ceti names exist at `2fd255d` and not at `a91d3aa`.
- The 39 added this round include:
  - `TauCeti.Algebra.WeilRestriction.multiplicativeGroupPoints`;
  - `TauCeti.pseudoReductiveCommHopfAlgProperty`;
  - `TauCeti.FiniteTypeCommHopfAlgCat.torus_coinvariants_unipotentRadical`;
  - `IsNilpotent.log`;
  - `TauCeti.UpperUnitriangular.expCoordinateEquiv`;
  - `TauCeti.SpecialLinear.binaryForms`;
  - `BialgHom.parabolicCoordinateAlgEquiv`.
- In `Suggested.lean`'s docstring, `TauCeti.FiniteField.frobeniusPoints`, the five `SchemeAction` names and `isIso_…_of_reductive` are also absent at `a91d3aa`.
- No sentence of the README names the revision it cites.

**Repair.** The worker merges `origin/main` into the branch. The folder cannot do this itself.
- `git merge-tree --write-tree HEAD origin/main` at this head reports only the two modify/delete conflicts, on `OrbitGeometryTargets.lean` and `SpectralWeylTargets.lean`. Keep the deletions. `README.md` and `Suggested.lean` merge cleanly.
- The manifest then pins `2fd255d`/`1b1ccf4b`, and every name above resolves.
- Then delete `Suggested.lean:61–64` and apply R02.

## R02 (P2) — the Levi-of-parabolic headline is still named as not statable

**Location.**
- `Suggested.lean:57–64`: "the parabolic predicate is the missing carrier here and the decomposition is not stated".
- `README.md:1850–1856`: "In the form of Layer 6A's complement, this headline reads …".

**Claim.** The headline cannot be stated.

**Witness.**
- At `2fd255d`, `TauCeti.HopfIdeal.IsParabolic` is a library declaration (`Algebra/AlgebraicGroup/Parabolic/Basic.lean`).
- #1797's head states exactly this headline on it, as `IsParabolic.exists_levi_complement` in that head's `ReductiveGroups/Suggested.lean`.
- The previous rounds elaborated the same signature at the branch pin with the predicate's 9-line body copied locally.

**Repair.** After R01:
1. Add `import TauCeti.Algebra.AlgebraicGroup.Parabolic.Basic`.
2. Add the following to the Layer 7 section, and delete `Suggested.lean:57–64`.
3. Keep `:65–70` (diagonalizable groups, the `k`-radical) as their own paragraph.

```lean
/-- Levi decomposition of a parabolic subgroup over an arbitrary field: for a parabolic `P` of
a connected reductive `G`, with `U` its `k`-unipotent radical, a Hopf ideal `J` of `O(P)` cuts
out a Levi `k`-subgroup `L`, so that `O(P)^U → O(P) → O(P)/J = O(L)` is bijective
(Conrad–Feng, Example H.1.2, p. 238, and Proposition 12.3.1, p. 127). -/
theorem IsParabolic.exists_levi_complement {k : Type v} [Field k]
    (H : TauCeti.FiniteTypeCommHopfAlgCat.{v, v} k)
    (hred : TauCeti.reductiveCommHopfAlgProperty k H)
    (I : TauCeti.HopfIdeal k H) (hP : TauCeti.HopfIdeal.IsParabolic k H.obj I) :
    ∃ J : TauCeti.HopfIdeal k (TauCeti.FiniteTypeCommHopfAlgCat.quotient H I),
      Function.Bijective ((Ideal.Quotient.mkₐ k J.toIdeal).comp
        (TauCeti.FiniteTypeCommHopfAlgCat.unipotentRadicalDefiningIdeal
          (TauCeti.FiniteTypeCommHopfAlgCat.quotient H I)).coinvariants.val) := by
  sorry
```

Tested on `B ⊂ GL₂` over `𝔽₂(s)`, on `P = G`, and with the wrong `J = (a−1, d−1)` (table).

## R03 (P2) — the Bruhat decomposition is statable at both pins but is neither stated nor named as unstatable

**Location.**
- `README.md:1824–1826`: "Prove the Bruhat decomposition `G(k) = ⨆_{w∈W} B(k) w B(k)` and the double-coset identification `B\G/B ≃ W` here (Milne, §21.h, p. 446; Theorem 21.45, p. 438, for Tits systems)".
- `Suggested.lean:46–101`, the "Not statable" list, which does not mention it.

**Claim.** Every headline statable at the pins is stated, and every other one is named in the docstring. Bruhat is a headline: LieGroups names this roadmap's Layer 7 the "single owner" of the generic Bruhat theorem and applies it "as a `TauCeti.TitsSystem`" (`RepresentationTheory/LieGroups/README.md:1081`, `:1428–1430`).

**Witness.**
- The carriers exist at `a91d3aa`:
  - `TauCeti.TitsSystem` (`GroupTheory/TitsSystem/Basic.lean:50`);
  - `TauCeti.CommHopfAlgCat.quotientPointsSubgroup` (`Algebra/AlgebraicGroup/HopfIdeal/Points/Basic.lean:181`);
  - `TauCeti.HopfIdeal.IsBorelOverAlgClosed`, `TauCeti.HopfIdeal.IsMaximalTorus` and `TauCeti.reductiveCommHopfAlgProperty`.
- The abstract decomposition is pinned as `TauCeti.TitsSystem.existsUnique_mem_bruhatCell` (`Bruhat/Uniqueness.lean:111`).
- The statement below elaborated from a scratch file at the branch pin in 14 s, with one `sorry` warning. I first built `TauCeti.Algebra.AlgebraicGroup.Borel.Basic` and `TauCeti.GroupTheory.TitsSystem.Basic`, as the brief allows.
- The source theorem is Milne (2017), Proposition 21.75, p. 448, with the setting of Example 21.47, p. 439. §21.h, p. 446, proves the scheme-level cells. Theorem 21.45 is the abstract consequence.

**Repair.**
1. Add the imports `TauCeti.Algebra.AlgebraicGroup.Borel.Basic`, `TauCeti.Algebra.AlgebraicGroup.HopfIdeal.Points.Basic` and `TauCeti.GroupTheory.TitsSystem.Basic`, and the theorem below, to the Layer 7 section.
2. In `README.md:1824–1826`, name `StructureAcceptance.bruhat_titsSystem`. Cite "Milne, Proposition 21.75, p. 448 (Example 21.47, p. 439)". Consume `TauCeti.TitsSystem.existsUnique_mem_bruhatCell` for the double-coset decomposition rather than restating it.

```lean
/-- Bruhat decomposition: over an algebraically closed field, for a connected reductive `G`, a
Borel subgroup `B` and a maximal torus `T ⊆ B`, the rational points `B(k)` and the normalizer of
`T(k)` in `G(k)` form a Tits system in `G(k)` (Milne, Algebraic Groups, Proposition 21.75,
p. 448); `G(k) = ⨆_{w ∈ W} B(k) w B(k)` follows by `TauCeti.TitsSystem.existsUnique_mem_bruhatCell`. -/
theorem bruhat_titsSystem {k : Type v} [Field k] [IsAlgClosed k]
    (H : TauCeti.FiniteTypeCommHopfAlgCat.{v, v} k)
    (hred : TauCeti.reductiveCommHopfAlgProperty k H)
    {I J : TauCeti.HopfIdeal k H.obj}
    (hB : TauCeti.HopfIdeal.IsBorelOverAlgClosed k H I)
    (hT : TauCeti.HopfIdeal.IsMaximalTorus k H.obj J)
    (hTB : I.toIdeal ≤ J.toIdeal) :
    ∃ S : TauCeti.TitsSystem
        (TauCeti.HopfAlgebra.points (R := k) (H := H.obj) (CommAlgCat.of k k)),
      S.subgroupB = TauCeti.CommHopfAlgCat.quotientPointsSubgroup H.obj I (CommAlgCat.of k k) ∧
      S.subgroupN = Subgroup.normalizer
        (TauCeti.CommHopfAlgCat.quotientPointsSubgroup H.obj J (CommAlgCat.of k k) : Set _) := by
  sorry
```

Tested:
- **`GL₂`.** With `B` upper triangular (`I = (c)`) and `T` diagonal (`J = (b, c)`), `N` is the monomial matrices, `B ∩ N = T` and `s B s` is lower triangular, not in `B`.
- **`𝔾_m`.** `B = T = G`, so `W = 1` and `S = ∅`.
- **Without `hTB`.** Take `T′ = gTg⁻¹` with `g = [[1,0],[1,1]]`. Then `B ∩ N(T′)` is the scalars times `⟨[[−1,1],[0,1]]⟩`. Conjugating by `t′ = g·diag(a,d)·g⁻¹` with `a ≠ d` moves the line `⟨e₁⟩` that every element of `B` fixes, so `B ∩ N(T′)` is not normal in `N(T′)` and axiom (T1) fails. The hypothesis is needed.

The name occurs nowhere on main or in the open heads (`roadmaps grep`).

## R04 (P2) — the README restates as targets constructions the pinned Tau Ceti already has; some exist at both pins, others only at main's

**Claim.** What Tau Ceti states at the pin is cited in *Exact supplier contracts*, not restated (adversarial item 9). Each declaration below is absent from the README; I opened each one.

**At the branch pin `a91d3aa` (and at `2fd255d`):**
- **Layer 0** (`README.md:672–684`: "package … as the anti-equivalence …", "Prove the counit and unit identifications …", "Prove the third equivalence with representable group-valued functors").
  - `TauCeti.commHopfAlgCatOpEquivAffineGroupSchemeCat S : (CommHopfAlgCat S)ᵒᵖ ≌ AffineGroupSchemeCat S` and `TauCeti.AffineGroupSchemeCat.hopfSpecCoordinateHopfAlgebraIso` (`AlgebraicGeometry/AffineGroupScheme/Equivalence.lean:43,82`), over any commutative ring.
  - `TauCeti.CommHopfAlgCat.pointsFunctor_faithful`, `pointsFunctor_full` and `essImage_pointsFunctor`, where the essential image is exactly the corepresentable functors (`Algebra/AlgebraicGroup/CommHopfAlgCat/Yoneda.lean:259,499,668`).
- **§1.1, a seeded target** (`README.md:783–788`: "Construct the inverse … by evaluation at the universal point … Prove … that the two operations are inverse, preserving … morphisms"; also `README.md:17–18`, "Layer 1.1 owns … the action-to-coaction direction").
  - `TauCeti.HopfAlgebra.pointRepresentationEquivComodule` (`Algebra/AlgebraicGroup/Representation/Comodule/Basic.lean:769`). Its module docstring states that the coaction is recovered "by evaluating at the universal point `id_H`" and that the constructions are inverse "without any finiteness, freeness, projectivity, flatness, or nontriviality hypothesis".
  - `TauCeti.pointRepresentationCategoryEquivalence` (`…/Comodule/Equivalence.lean:165`) gives the equivalence of categories.
- **Layer 3** (`README.md:944–947`: "the anti-equivalence between closed subgroup schemes of `Spec A` and Hopf ideals"). `TauCeti.CommHopfAlgCat.hopfIdealOrderIsoClosedSubgroup` (`Algebra/AlgebraicGroup/HopfIdeal/Scheme/Classification.lean:257`), an order isomorphism over any commutative ring.
- **Layer 4, Jordan decomposition** (`README.md:1309–1312`, Milne 9.18 and functoriality).
  - `TauCeti.HopfAlgebra.Point.jordanDecomposition`, `jordanDecomposition_spec` and `isSemisimple_isUnipotent_unique` (`Algebra/AlgebraicGroup/Representation/JordanDecomposition/Basic.lean:98,225,261`).
  - `jordanDecomposition_mapDomain` (`…/Naturality.lean:67`).
  - These hold for `K`-points with `K` any perfect extension of any field `k`, more generally than the target.
- **Layer 4, tori** (`README.md:1331–1336`: "X* and X_* are free of the same rank with the pairing perfect"; `:1321–1323`, Milne 12.23).
  - `TauCeti.TorusCommHopfAlgCat.instCharacterCocharacterPairingIsPerfPair` and `finrank_cocharacterLattice_eq_characterLattice` (`Algebra/AlgebraicGroup/Torus/Cocharacter/Basic.lean:52,85`).
  - The character-lattice functor is an equivalence of tori with Galois lattices over a perfect field (`Torus/CharacterLattice/Equivalence.lean`, "Milne … Theorem 12.23").
- **Layer 6** (`README.md:1510–1512`: "Develop the radical, the centre `Z(G)`, the derived group `G_der`, central isogenies, and the simply connected and adjoint forms").
  - The definitions are pinned: `TauCeti.CommHopfAlgCat.centerDefiningIdeal` (`Center/Basic.lean:301`), `derivedDefiningIdeal` (`Derived/Basic.lean:72`), `IsCentralIsogeny` (`Isogeny/Basic.lean:77`) and `TauCeti.simplyConnectedSemisimpleCommHopfAlgProperty` (`SimplyConnected/Basic.lean:67`).
  - `README.md:1553–1554` ("Provide both definitions and the char-0 equivalence so downstream work can pick either") contradicts `:1529–1535`, which already consumes both predicates and `TauCeti.reductiveCommHopfAlgProperty_iff_linearlyReductive`.
- **Layer 9B carriers** (`README.md:3210–3270`).
  - The README says "For the `G₂` and `F₄` carriers construct `τ` as follows" (`:3239`) and "Construct the toral-closure carriers that have no native counterpart: the short-root `G₂` and `F₄` carriers above, and the tripled `D₄` carrier" (`:3257–3258`).
  - At the branch pin, `TauCeti.G2ShortRoot.PrimeField.specialIsogenyHom` exists, with `specialIsogenyHom_comp_self` (the Frobenius square) and `specialIsogeny_rootSubgroupPoints` (`Algebra/Lie/G2/ShortRoot/PrimeField/SpecialIsogeny.lean`).
  - So does `TauCeti.F4ShortRoot.PrimeField.specialIsogenyHom`, with `specialIsogenyHom_comp_self` (`Algebra/Lie/F4/ShortRoot/PrimeField/QuotientSpecialIsogeny.lean:284`).
  - Both carriers are proved reductive and smooth (`…/PrimeField/Reductive.lean`, `Smooth.lean`).
  - `TauCeti.D4Tripled.groupScheme` is the tripled `24`-dimensional `D₄` toral closure in `GL₂₄` over `ℤ`, with its triality automorphism (`Algebra/Lie/D4/Tripled/GroupScheme.lean`, `Triality.lean`). "No native counterpart" is false.
  - `TauCeti.UniversalEnvelopingAlgebra.kostantElementarySubgroup` (`Kostant/RootSubgroup/Elementary/Basic.lean:144`) is the elementary group `E(A)` on an admissible lattice, functorial in `A`. It is the matrix-realization side of 9B's "Elementary generators" (`README.md:3168–3191`).
  - `kostantToralGroupScheme` (`Kostant/RootSubgroup/Scheme/ToralClosure/Basic.lean`) is an explicit Kostant group scheme over `ℤ`. It is relevant to "The Chevalley–Demazure construction" (`README.md:3076–3078`).

**After R01, at `2fd255d` only:**
- **§9A.1a–1b.**
  - `Matrix.ShellLieAlgebra` (`Algebra/Lie/NormTwoShell/Basic.lean:90`) is the carrier `Q × (Φ →₀ ℤ)` of `README.md:2597–2607`, with `Matrix.ShellLieAlgebra.lie_jacobi` (Jacobi over `ℤ`).
  - `Matrix.SignCover`, `SignCover.tau` and `commutatorElement_signCover` (`LinearAlgebra/Matrix/OrderedSignCover.lean:181–222`) cover `:2581–2595`.
  - `coverLieEquiv` (`NormTwoShell/CoverLift.lean:269`) covers `:2706–2716`.
  - `TauCeti.WeightedCycle.fixedEquivTorsion` (`LinearAlgebra/WeightedCycle/Basic.lean:156`) is "a positive cycle contributes A, a negative cycle A[2]" (`:2801–2808`).
  - `Module.Basis.fixedSubmoduleBaseChange_surjective_iff` (`WeightedCycle/Family/BaseChange.lean:154`): "surjective exactly when there are no negative cycles or the coefficient ring has zero 2-torsion". This is `:2970–2973`.
  - `SimpleGraph.IsAcyclic.exists_graphCartanMatrix_sum_orbit` (`Combinatorics/SimpleGraph/OrbitCartan.lean:34`) is "`d_O = 2` or 1" (`:2833–2835`).
  - `foldedCartanMatrix` and `isSerreSystem_folded` (`LinearAlgebra/Matrix/Cartan/Folding/Basic.lean:91`, `NormTwoShell/Folding.lean:249`).
  - `typeAShellLieEquiv` (`NormTwoShell/TypeA.lean:333`).
- **Layer 7.**
  - `BialgHom.parabolicLeviFppfQuotientIso` (`Dynamic/Levi/Quotient.lean:177`): `P(λ)/U(λ) ≅ Z(λ)`.
  - `injOn_conjugate_leviDefiningHopfIdeal` (`Dynamic/Conjugation.lean:334`): freeness of the `U(λ)`-action on dynamic Levis.
- **Layer 7a.**
  - `MonoidHom.exists_fixed_inv_mul_of_surjective_commutatorMap` and `exists_fixed_lift_of_surjective_commutatorMap` (`GroupTheory/FixedSubgroup/Lang.lean:76,96`) are the fixed-coset lifting of `README.md:2055–2059`, in the mirror convention `t·F(t)⁻¹`.
  - `TauCeti.FiniteField.rationalPointsMulEquivFixedSubgroupGeometricFrobenius` (`Frobenius/FiniteField.lean:434`).

**Witness.** The declarations above, opened at the pins named. I tested `jordanDecomposition` on `g = [[2,1],[0,2]]` over `ℚ`, and `fixedEquivTorsion` on an orbit of length 2 with signs `(1,−1)` (table).

**Repair.** List each declaration, with its file and hypotheses, in *Exact supplier contracts*. Delete the restated targets and keep as targets only what the library leaves open:
- **Layer 0:** the scheme-point and descent adapters.
- **§1.1:** only the transport to invariants. Delete the ownership clause at `README.md:17–18`.
- **Layer 3:** the kernel description of `f : G → H` and Milne 5.34 beyond the pinned cases.
- **Layer 4:**
  - Jordan decomposition over an imperfect field;
  - multiplicative type with torsion;
  - "split iff trivial Galois action".
- **Layer 6:** the structure theorems, not the definitions. Delete `:1553–1554`.
- **9B:**
  - identify the `G₂`, `F₄` and `D₄` carriers with the pinned simply connected groups;
  - the kernel of `τ`;
  - `GE_G(A)` and its comparison with `E(A)`.
- **9A.1a–1b:** the integral comparisons with the full `Y` and with 9A.1.
- **Layer 7:** transitivity on Levis and the comparison with `IsParabolic`.
- **Layer 7a:** the bijection `H^σ/J^σ ≃ (H/J)^σ`, with an explicit convention change.

The search covered `Algebra/AlgebraicGroup`, `Algebra/Coalgebra`, `Algebra/Lie`, `AlgebraicGeometry/AffineGroupScheme`, `LinearAlgebra`, `Combinatorics/SimpleGraph` and `GroupTheory` at both pins.

## R05 (P3) — the new §3A.6 route makes Layer 3A consume LieGroups Layer 7, which consumes Layer 7C, which lists all of 3A: a coarse cycle

**Location.**
- `README.md:1253–1255`: "*Needs:* … for the `U(n)` specialization only, CompactGroups Layer 1 and LieGroups Layer 7".
- `README.md:1990`: Layer 7C's *Dependencies*, "Layers 2–5, 5P, 3A and 7".
- `README.md:1926`: Layer 7's *Dependencies*, "Layers 2–5 and 3A".
- `README.md:1299–1302`: Layer 3A's *Dependencies*, which omit CompactGroups and LieGroups Layer 7.

**Claim.** Layer-level dependencies contain no cycle, and every layer lists its dependencies.

**Witness.**
- `RepresentationTheory/LieGroups/README.md:1427–1428` says LieGroups Layer 7 "uses … ReductiveGroups Layers 0–4, 6 and 7C".
- So the chain is: 3A (via 3A.6) → LieGroups 7 → ReductiveGroups 7C → 3A.
- Layers 7 and 7C use only the pinned orbit theorems of §§3A.1–3A.5 (`README.md:1829`, `:1954`), never 3A.6.
- The depcheck does not flag edges between main roadmaps, so it shows nothing here.

**Repair.**
1. Change "3A" in `README.md:1926` and `:1990` to "§§3A.1–3A.5 (the pinned orbit theorems and the complex charts)".
2. Add to `README.md:1299–1302`: "for §3A.6's `U(n)` specialization only, CompactGroups Layer 1 and LieGroups Layer 7".

Tested on `n = 1`: `z ↦ z^m` extends to `t ↦ t^m` on `𝔾_m`, and nothing in 7 or 7C uses it.

## R06 (P3) — the description is unchanged: no order with five conflicting pull requests, false validation claims, and two owners of Lang's theorem

**Location.** The pull-request description, byte-identical to the previous round.

**Witness.**
- **Conflicting pull requests.** The overlap index lists #1332, #1797, #1807, #1808 and #1854 as conflicting with this head. #1797's head states `IsParabolic.exists_levi_complement` and `IsMaximalTorus.exists_conjugate_eq`, which this head does not.
- **Validation claims.** "Existing roadmap bytes are preserved" is false: the folder diff against main is +2898/−2432 lines, with seven files deleted. "One intentional admitted presentation target" is false too: `Suggested.lean` admits eight.
- **Lang ownership.** On main, `ReductiveGroupsPartII/README.md:61–62` calls RG2.3 "the single owner in Tau Ceti of Lang's theorem", and its `Suggested.lean:212` states `lang_surjective`. This head makes Layer 7a the owner (`README.md:15–17`, `:43–44`). No open pull request changes Part II (`roadmaps grep`).

**Repair.**
- State which of these pull requests is rebased on which, and whether this one takes #1797's Levi statement or #1797 takes this one's.
- Close or retarget #1332 if this pull request supersedes it.
- Replace the validation paragraph with what the head contains.
- Name the ReductiveGroupsPartII revision that makes RG2.3.7 consume Layer 7a.

## Verified sound

**Head, scope, gate.**
- Head `1b262ae9…`; the worktree is clean.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/ReductiveGroups'` is empty.
- Gate re-run: every check 0, `OK`.

**Dependency check** (`--movable`, content main, the board's `ORDER.txt`): `depcheck: 239 roadmaps, 2324 edges, 0 problem(s)`. There is no UPWARD or CYCLE line, and ReductiveGroups is not in `ORDER.txt`, since it is on main.

**Elaboration.**
- `lake env lean` on `Suggested.lean`: exit 0 in 73 s.
- Exactly eight warnings, all "declaration uses `sorry`", at lines 120, 133, 153, 175, 191, 213, 377 and 386.

**Signatures.** I ran `#check @name` on all 18 declarations in one scratch copy. Each elaborated type matches its README statement, with no lost binder:
- `[CharZero k]` and `AlgebraicClosure k`;
- `[IsAlgClosed k] [CharP k p]` with `hsm` and `hconn`;
- `[IsAlgClosed k]` with two `IsMaximalTorus` hypotheses;
- `[Finite k]` with `[IsAlgClosed K]` and `hF`;
- `2 ≤ n`.

**Padding probe.** On a scratch copy, each `sorry` was replaced by `first | rfl | (simp; done) | infer_instance | trivial | decide | (simp_all; done) | exact?`. All eight fail: six because `exact?` cannot close the goal, and two (`exists_conjugate_eq_of_isMaximalTorus`, `lang_surjective`) with a `whnf` heartbeat timeout. Nothing is padding.

**Seeded sample.**
- **§1.1** (`README.md:773–885`), in `jantzen-1985` (printed page = scan page − 5):
  - the comodule map, §2.8, line 1100;
  - flatness assumed from 3.2 on, line 1487;
  - induction, §3.3, line 1507;
  - §3.9, Proposition a)–c), lines 1690–1707, p. 60. Part b) embeds every module into `I ⊗ k[G]` exactly as the README routes it, and part c) is "cofree is not injective";
  - §4.2, line 1923, p. 69;
  - §4.7 Lemma, line 2001, p. 73;
  - the Hochschild complex `Cⁿ = M ⊗ k[G]^⊗n`, §4.14, line 2105, p. 77; §4.16, line 2153, p. 79.

  The cofree Check is right: on the trivial group, `2ℤ → ℤ`, `2 ↦ 1`, does not extend. §1.1's action-to-coaction target is pinned (R04).
- **§8.1** (`README.md:2475–2497`): `conrad-rgs` Definition 5.1.1, line 5651, p. 136. Conditions 1–3 are at lines 5654–5659, imposed on possibly disconnected `S` (lines 5661–5667). The `SL₂/𝔽₂` centre has length 2.
- **§8.2** (`README.md:2499–2517`): `conrad-rgs` Definition 6.1.1, line 7725, and Remark 6.1.2, line 7738, both p. 186. "Evident notion of isomorphism" is on p. 187 (line 7754). The `Spec(k×k)` Check is Remark 6.1.2.

**Locators changed this round.**
- Milne 2017, read from the author's page through `sources fetch` with no manifest:
  - Theorem 16.33 begins on p. 335; (a)–(d) are on p. 336. `README.md:1387–1390` is right.
  - Remark 12.56 is on p. 249.
- `conrad-feng`:
  - Proposition 12.3.1, line 5345, p. 127 (simple transitivity, and the unique Levi containing a maximal torus);
  - Definition H.1.1 and Example H.1.2, lines 10356–10359, p. 238. Example H.1.2 recalls at line 10375 that every parabolic `k`-subgroup is some `P_G(λ)`, as `README.md:1872–1873` says.
- `fadell-neuwirth` (previous R04): see above.

**Library declarations opened.**
- At `a91d3aa`:
  - `Torus/Maximal.lean:50`, `Borel/Basic.lean:148`, `HopfIdeal/Points/Basic.lean:181`, `TitsSystem/Basic.lean:50`;
  - `Representation/Comodule/Basic.lean:769`, `Comodule/Equivalence.lean:165`;
  - `AffineGroupScheme/Equivalence.lean:43,82`, `CommHopfAlgCat/Yoneda.lean:259,499,668`;
  - `HopfIdeal/Scheme/Classification.lean:257`, `JordanDecomposition/Basic.lean:98–261`, `Naturality.lean:67`;
  - `Torus/Cocharacter/Basic.lean:52,85`, `Torus/CharacterLattice/Equivalence.lean`;
  - `Isogeny/Basic.lean:77`, `SimplyConnected/Basic.lean:67`, `Center/Basic.lean:301`, `Derived/Basic.lean:72`;
  - `Connected/ComponentGroup/FiniteEtale.lean:66–81`, which is over algebraically closed `k` only, so `README.md:982` stays a target;
  - `G2/ShortRoot/PrimeField/SpecialIsogeny.lean`, `F4/ShortRoot/PrimeField/QuotientSpecialIsogeny.lean:284`, `F4/…/Reductive.lean`, `D4/Tripled/GroupScheme.lean`;
  - `Kostant/RootSubgroup/Elementary/Basic.lean:144`, `Kostant/…/ToralClosure/Basic.lean:170`.
- At `2fd255d`:
  - `RingTheory/WeilRestriction/Basic.lean`, `…/Smooth.lean:60`, `MultiplicativeGroup/WeilRestriction/Basic.lean:65`, `…/Connected.lean:233`;
  - `PseudoReductive/Basic.lean:80–221`, `Solvable/UnipotentRadical.lean:88`, `Solvable/LinearlyReductive.lean:86`, `MultiplicativeType/LinearlyReductive.lean:61`;
  - `RingTheory/Nilpotent/Log.lean:48,184,189`, `UpperUnitriangular/Exponential.lean:166`, `GeneralLinear/Unipotent/Exponential.lean:186`, `Contractible.lean:48`;
  - `SpecialLinear/BinaryForm/Basic.lean:293,719,736`, `BinaryForm/Dual.lean:126,156`;
  - `WeightedCycle/Basic.lean:156`, `WeightedCycle/Family/BaseChange.lean:154`, `SimpleGraph/OrbitCartan.lean:34`, `NormTwoShell/Basic.lean:90`, `GroupTheory/FixedSubgroup/Lang.lean:76,96`.

**Cross-roadmap citations.**
- `roadmaps resolve`: the 14 "found nowhere" names are this roadmap's own `Suggested.lean` declarations.
- On main:
  - CompactGroups Layer 1 and LieGroups Layer 7's two cited bullets exist;
  - LieGroups and CompactGroups do not consume 3A.6 (except via R05's coarse lines);
  - CompactGroups cites no ReductiveGroups target.
- Neither pin has a Lang theorem for general `G`, `GE_G(k) = G(k)`, Milne 22.43, Nagata beyond the solvable case, or the SL polynomial presentation (`SpecialLinear/Basic.lean` says "no polynomial presentation"). These headlines are this roadmap's.

**Adversarial table** (values computed this round).

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| `linearlyReductive_iff_reductive_identityComponent` | constant `S₃`/ℚ; `𝔾_a`/ℚ; `O₂`/ℚ | Maschke T ↔ `(G_k̄)°=1` reductive T; `[[1,a],[0,1]]` fixes `ke₁`, no complement F ↔ `R_u=𝔾_a` F; T ↔ `SO₂≅𝔾_m` T | Pass |
| same, control | constant `ℤ/p`/`𝔽_p` | `k[u]/(u^p)` indecomposable: F; `G°=1` reductive: T; excluded by `[CharZero k]` | Pass |
| `linearlyReductive_iff_torus` | `𝔽̄_p`: `𝔾_m`, `SL₂`, `𝔾_a`, trivial | T↔T; `⟨x^p,y^p⟩⊂R_p` uncomplemented F ↔ F; F↔F; T ↔ rank-0 torus T | Pass |
| same, control | `μ_p` | LR (12.54), connected, `k[u]/(u^p)` not reduced, so not a torus; excluded by `hsm` | Pass |
| `exists_levi_complement` | `B⊂GL₂`/ℚ; `𝔾_a`; `GL₂` | `[[a,b],[0,d]]·[[1,c],[0,1]]=[[a,ac+b],[0,d]]` ⇒ `O(B)^U=ℚ[a^±,d^±]`, `J=(b)` bijective; radical ideal 0, coinvariants ℚ, `J=(t)`, ℚ→ℚ; radical ideal = augmentation, `J=0`, identity | Pass |
| same, wrong `J` | `B`, `J=(a−1,d−1)` | `a−1 ↦ 0`: not injective | Pass |
| `exists_conjugate_eq_of_isMaximalTorus` | `SL₂`/ℂ, `u=[[1,1],[0,1]]`; `GL₂×μ_p`; constant `S₃` | `u·diag(t,t⁻¹)·u⁻¹=[[t,t⁻¹−t],[0,t⁻¹]]`, `g=u`; tori `T×1`, conjugate by `GL₂(k̄)`; only torus trivial, `g=1` | Pass |
| same, control | `SL₂`/ℝ, diagonal vs `SO₂` | unbounded vs compact real points; excluded by `[IsAlgClosed k]` | Pass |
| `lang_surjective` | `𝔾_a`/𝔽₂, `θ²+θ+1=0`; `𝔾_m`/𝔽₂; transcendental `a∈K` | `θ²−θ=1`; `θ⁻¹θ²=θ`; `T^q−T−a` has a root in `K` | Pass |
| same, control | constant `C₂`/`𝔽_q` | Frobenius trivial on points, every Lang value 1, misses the other element; excluded by `hconn` | Pass |
| `exists_coordinatePresentation` | `n=0,1,2`; ℤ/4 | `det(∅)−1=0`, ℤ; `x−1`, ℤ; `ad−bc−1`; `[[1,1],[0,1]]⁻¹` upper right `−1=3` | Pass |
| `plane_braid` | `n=0,1,2`; `n=2,i=0,t=½` | `Fin(n−1)` empty, both groups 1; `π₁(Conf₂)=ℤ=B₂`; `½−e^{iπ/2}/2=½−I/2`, `½+I/2` (start 1 → upper half-plane: counterclockwise) | Pass |
| `permutation_nonsplit` | `n=2`; `n≤1` | `B₂=ℤ→C₂` parity: section sends `τ` to `m` with `2m=0`, `m=0` even, not odd; `Perm(Fin 1)=1` splits, excluded by `2≤n` | Pass |
| `bruhat_titsSystem` (R03) | `GL₂`/`k̄`; `𝔾_m` | `I=(c)≤J=(b,c)`; `N` monomial, `B∩N=T`, `W=S₂`, `sBs` lower triangular ⊄ `B`; `B=T=G`, `W=1`, `S=∅` | Statable: R03 |
| same, without `hTB` | `T′=gTg⁻¹`, `g=[[1,0],[1,1]]` | `B∩N(T′)` = scalars·`⟨[[−1,1],[0,1]]⟩`; `t′e₁=(a,a−d)`, so for `a≠d` the conjugate is not in `B`: (T1) fails | Hypothesis needed |
| Levi of parabolic (R02) | `B⊂GL₂`/`𝔽₂(s)`; `P=G` | `O(B)^U=k[a^±,d^±]`, `J=(b)` bijective over the imperfect field; radical trivial, `J=0` | Statable: R02 |
| §1.1 (sample) | weight-one line of `𝔾_m`/ℤ; trivial group | `1↦1⊗t`, at `2∈ℚˣ` ×2; `d¹(t−1)=t⊗(t−1)−(t⊗t−1⊗1)+(t−1)⊗1=0`; `2ℤ→ℤ, 2↦1` does not extend: cofree ℤ not injective | Pass |
| §8.1 (sample) | `SL₂` vs `PGL₂`; `SL₂`/𝔽₂ | root `2e` vs generator; centre `𝔽₂[t]/(t−1)²`, length 2 | Pass |
| §8.2 (sample) | `x_α(2t)`/ℤ and /ℚ; `Spec(k×k)` | `2E₁₂` not a generator of `ℤE₁₂`; a different pinning over ℚ; `B⁺⊔B⁻` signs `(+,−)`, not a constant `Φ⁺` | Pass |
| Jordan (R04) | `g=[[2,1],[0,2]]`/ℚ; `[[0,1],[a,0]]`/`𝔽₂(a)` | `g_s=2I`, `g_u=[[1,½],[0,1]]`; `x²−a=(x−√a)²`, `g_s` only over `k(√a)` (pinned `K` perfect) | Pinned: R04 |
| 9A.1b cycles (R04) | orbit of length 2, signs `(1,−1)`; A₃ outer orbit; A₄ middle orbit | fixed `(v,v)` with `v=−v` ⇒ `A[2]` = `torsionBy (∏a−1)=torsionBy (−2)`; nonadjacent, degree 0, `d_O=2`; adjacent, degree 1, `d_O=1` | Pinned: R04 |
| 9B carriers (R04) | `B₂`, `G₂`, `D₄` tripled | `τ*α=β`, `τ*β=2α`, `(τ*)²=2`; `G₂` string `b−2a,…,b+a`, constant ±3; `24=8+8+8`, triality orbits of size 3 | Pinned: R04 |
| 16.33 locator | Milne 2017 | (a)–(c) p. 336 after the statement head on p. 335; (d) p. 336 | Pass |
| Fadell–Neuwirth (old R04) | `n=3`; `M=ℝ²` | Thm 3: `F_{0,3}→F_{0,2}`, fibre `F_{2,1}=ℂ∖{z₁,z₂}`; Cor 2.1: `π_i` of a wedge of circles is 0 for `i≥2` | Repaired |
| §3A.6 (R05) | `U(1)` | `z↦z^m` extends to `t↦t^m`, regular on `𝔾_m` | Route sound; coarse cycle: R05 |
| 9B.1 chart | `SL₂`, `Ω=D(a)`; `SL₂(ℤ/4)` | `u₋(c/a)·diag(a,a⁻¹)·u₊(b/a)` lower right `(1+bc)/a=d`; `x(1)x₋(−1)x(1)=[[0,1],[−1,0]]≡[[0,1],[3,0]]` | Pass |
| 10D chart | `SL₂/N⁺` | `s_a·n(t)=[[a,at],[c,ct+a⁻¹]]`, `t=−1/(ac)` gives `s_c`; `u_c=u_a+1/(ac)` | Pass |
| 9A.1b checks | E₆ reversal; `γY=[[0,−1],[1,−1]]` | `24+2·24=72`, `24+24+4=52`; `det(γY−I)=3`, Smith `diag(1,3)`, `(1,−1)` fixed mod 3 | Pass |
| 9A.1a-L check | A₂, `g=−1` | `w₀(−α₁)=α₂`, `d=w₀∘(−1)` = flip, `g=w₀∘flip` | Pass |

## Not verifiable

- **Lean at main's pins.** The brief allows Lean only from this worktree, which pins `a91d3aa`. R02's statement was checked at the branch pin in earlier rounds, with the predicate body copied; R03's elaborated at the branch pin.
- **Duplication audit (R04).** I and two locate-only helpers searched the directories listed in R04 at both pins; I opened every declaration listed. Not compared:
  - `RepresentationTheory/` beyond `Induction` and `CharacterTable`;
  - `Derived/` beyond its definitions;
  - `Topology/Algebra/PointTopology/`, whose module says it does not assert that charts are open embeddings.
- **Other heads.** #1332, #1797, #1807, #1808 and #1854 were read through the overlap index, `roadmaps show` (#1797's `Suggested.lean`) and `roadmaps grep`.
- **Cited by locator only:**
  - Waterhouse, Borel and Springer (settled as uncertified);
  - Jantzen 2003, Conrad–Gabber–Prasad, Lang 1956, Steinberg 1968, Howlett–Lehrer, Dipper–Du, Carter, Serre, Gassmann.
- **Cached but not re-read this round:** `sga1`, `riche`, `gros-kaneda`, `brieskorn`, `salvetti`, `callegaro`, `heden`, `dudas-michel`, `frenkel-kac`, `mcninch`, `conrad-adelic`, `fox-neuwirth`, `birman-brendle`. Their passages are unchanged, and earlier rounds checked them.
- **Manifest mismatch.** The key `milne-iag` records Milne's 2015 notes, but the README cites the 2017 book (`iAG2017.pdf`). I read the 2017 text from the author's page without recording it; this review edits no manifest.

## Source issues

- **Error** in Milne, *Algebraic Groups* (2017), at Remark 12.56, p. 249: the source says that in characteristic `p` an algebraic group is linearly reductive iff `G°` is a torus and `p` does not divide `(G:G°)`; it should be `G°` of multiplicative type (`μ_p` is connected and linearly reductive by 12.54, but not a torus); affects nothing.
