<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/6943#issuecomment-6676168075 -->
Review (claude) of 3d229d9

Verdict: needs_changes

1. **F01** (P1) §9.3 "iff" is false when the centre of 𝔤 is non-zero

   - **Location.** README line 840: "`𝔮` is a parabolic subalgebra (§7.2) iff `𝔮 ⊗ ℂ ∩ [𝔤, 𝔤]_ℂ` contains `TauCeti.borelSubalgebra 𝔥 b` for some splitting Cartan subalgebra `𝔥` …" (`plan.json` target 9.3, statement field).
   - **Claim.** For a real Lie subalgebra `𝔮 ⊆ 𝔤`, parabolic ⟺ its complexification meets the semisimple part in a subalgebra containing a Borel.
   - **Witness.** `G = GL_2(ℝ)`, `𝔮 = {((a, b), (0, −a))}`, the trace-zero upper triangular matrices. It is a Lie subalgebra, `𝔮 ⊗ ℂ ∩ 𝔰𝔩_2(ℂ) = 𝔮 ⊗ ℂ` is the upper triangular Borel of `𝔰𝔩_2(ℂ)`, so the right-hand side holds. But every parabolic subalgebra `Ad(g)𝔮_{Π'}` contains `𝔷(𝔤) = ℝ·1` (because `𝔷 ⊆ 𝔪 ⊕ 𝔞 ⊆ 𝔮_{Π'}`), and `1 ∉ 𝔮`; also `dim 𝔮 = 2` while `dim 𝔮_∅ = 3`, `dim 𝔮_Π = 4`. So `𝔮` is not parabolic. The right-hand condition does not see the centre.
   - **Repair.** Add the hypothesis `𝔷(𝔤) ⊆ 𝔮` to the statement (or state it for subalgebras containing `𝔷`). With it the converse closes: the proof sketch produces `𝔮 ⊇ Ad(g)(𝔮_∅ ∩ [𝔤,𝔤])`, and `𝔮_∅ = 𝔷 ⊕ (𝔮_∅ ∩ [𝔤,𝔤])` gives `𝔮 ⊇ Ad(g)𝔮_∅`. Tested on the witness: with the added hypothesis the trace-zero Borel is excluded, and for `𝔮' = 𝔮 ⊕ ℝ·1 = 𝔮_∅` both sides hold. Add the witness as a negative-control Check of §9.3, and update the 9.3 statement in `plan.json`.

2. **F02** (P2) §6.3 and §7.3 need each other (target-level cycle)

   - **Location.** README line 626: "*Needs:* §§3.1, 5.1–5.3, 6.1–6.2, 7.3." and line 699: "*Needs:* §§3.3, 5.3, 6.1, 6.3; LieGroups Layer 1." `plan.json`: target 6.3 has prerequisite `target:7.3`, target 7.3 has prerequisite `target:6.3`.
   - **Claim.** The build order is acyclic.
   - **Witness.** §6.3 (a) is proved "by §7.3" (line 623), and §7.3 (ii) is proved from "`Q_{Π'} = L_{Π'}N_{Π'} ⊆ Q(X)` by §6.3" (line 697). The plan cannot be topologically sorted at the target level, although the layer-level Dependencies lines ("Layers 3–5" for Layer 6) hide it.
   - **Repair.** Prove §6.3 (a) inside §6.3 without §7.3: `θ(Q_{Π'}) = N_G(dθ 𝔮_{Π'})`, `𝔮_{Π'} ∩ dθ 𝔮_{Π'} = 𝔩_{Π'}`, so `Q_{Π'} ∩ θ(Q_{Π'}) ⊆ N_G(𝔩_{Π'})`; write an element as `l n` with `n ∈ N_{Π'}` (from (d), (e)) and conclude `n = 1` by the leading-term argument already used in (e). Then drop `7.3` from §6.3's `*Needs:*` line and from `plan.json` target 6.3, and keep `6.3` in §7.3's prerequisites. Alternatively move statement (a) into §7.3 and have §6.3 not state it.

3. **F03** (P2) The Bruhat decomposition over `W_G` needs no component condition; the O(1,1) Check for `bruhat_decomposition_linear` is false

   - **Location.** README lines 769–772: "Assume `LinearComponentCondition G 𝔞` … `bruhat_decomposition_linear`: for every `g ∈ G` there is `k ∈ K` normalizing `𝔞` with `g ∈ P k P`. If `k, k'` … then `k⁻¹k'` commutes with `𝔞`"; line 784: "… the union `P·1·P` is not `G` … This is the negative control for all three statements." Also §4.2 line 433: "Assume the component condition."
   - **Claim.** `bruhat_decomposition_linear` fails for `O(1,1)`, and the decomposition `G = ⨆ P n P` needs the component condition.
   - **Witness.** In `O(1,1)`: `K = {±1, ±d}` with `d = diag(1, −1)`, every element of `K` normalizes `𝔞 = ℝY`, `P = {±exp(tY)}`, and `d P = P d` is the other coset. So `G = P·1·P ⊔ P·d·P`, every `g` lies in some `P k P` with `k ∈ K` normalizing `𝔞`, and `P k P ∩ P k' P ≠ ∅` forces `k⁻¹k' = ±1`, which commutes with `𝔞`. The statement as written holds for `O(1,1)`. In general: `G = K P`, `K = N_K(𝔞) K⁰` (§2.2), `N_K(𝔞) = M'·N_{K⁰}(𝔞)` with `M'` the stabilizer of `Σ⁺` (simple transitivity of `W(Σ)` on positive systems), `M'` normalizes `P`, and `K⁰ P = M G⁰`; so `G = M' G⁰ = ⋃_{m' ∈ M', w ∈ W(Σ)} P m' n_w P`. Disjointness: `P n P/P = N_n n P/P` is the stable set of the `A`-fixed point `nP` under `lieExp(−tH₀)`, and `nP = n'P` iff `n⁻¹n' ∈ K ∩ P = M`. Hence `G = ⨆_{w ∈ W_G} P n_w P` for every Iwasawa triple, with the same cell coordinates `N_w × P ≅ P n_w P`. Only the indexing by `W(Σ)` and the density of the big cell `P n_{w₀} P` use the component condition (in `O(1,1)` both one-dimensional cells are open and neither is dense).
   - **Repair.** State §4.2's first two bullets over `W_G = N_K(𝔞)/Z_K(𝔞)` without the component condition, keep the `W(Σ)`-indexed form and the open-dense big cell under the condition, and move `bruhat_decomposition_linear` out of the `LinearComponentCondition` hypothesis in §8.3 (it quantifies over `k ∈ K` normalizing `𝔞`, which is the `W_G` form). Correct the `O(1,1)` Check: it refutes self-normalization in `minimalParabolic_langlands` and the "iff" of `eq_dynamicParabolic_of_le`, not `bruhat_decomposition_linear`; the `W(Σ)`-indexed union is what fails there. Tested on the instance: with the hypothesis dropped, `O(1,1)` satisfies the restated theorem as computed above; `GL_n(ℝ)` is unchanged.

4. **F04** (P2) `gap:matsumoto-components` is not needed; §9.1's Matsumoto route silently depends on §9.2 (a)

   - **Location.** README lines 111 and 807: "What ReductiveGroups must provide (`gap:matsumoto-components`) …" and "For `G = 𝐇(ℝ)`, use `𝐇(ℝ) = 𝐇(ℝ)⁰·𝐒(ℝ)` for a maximal `ℝ`-split torus `𝐒` … The elements of order two of `𝐒(ℝ)` are symmetric orthogonal matrices commuting with `𝔞` … Alternatively, `Ad(𝐇(ℝ)) ⊆ Ad(𝐇(ℂ))` gives Knapp's axiom (v) (§2.4)." `plan.json` gaps entry `matsumoto-components`, `neededBy: ["9.1"]`.
   - **Claim.** The component condition for real points of a connected reductive `𝐇` needs Borel–Tits Théorème 14.4 from ReductiveGroups.
   - **Witness.** (i) The gap asks for what this roadmap already provides: `𝐇(ℂ)` is connected, so `Ad(𝐇(ℂ)) = Int(𝔤_ℂ)` with `𝔤_ℂ = Lie(𝐇)(ℝ) ⊗ ℂ` (ALS.F.1), hence `Ad(𝐇(ℝ)) ⊆ Int(𝔤_ℂ)`, which is Knapp's axiom (v); §2.4 states that (v) implies the component condition (Knapp Ch. VII §5). This is the route Knapp uses to put real points of connected reductive groups in his class, and it is already in the README as the "alternative". (ii) The Matsumoto route as written is incomplete: an arbitrary maximal split torus `𝐒` need not commute with `𝔞`; the argument needs `𝐒 ⊇ A`, that is, that the Zariski closure of `A` is a maximal split torus, which is §9.2 (a) and rests on `gap:real-compactness-criterion`. Neither §9.2 (a) nor that gap is in §9.1's `*Needs:*` line, while §9.2 lists §9.1 as a prerequisite.
   - **Repair.** Make the axiom (v) argument the proof of §9.1 and delete `gap:matsumoto-components` from the README (lines 111, 807, 859) and from `plan.json`'s `gaps`; keep Borel–Tits 14.4 at most as a remark with its locator (`borel-tits1965` line 3750, p. 146). §9.2 (b)'s identification of the relative Weyl group then reads `N_𝐇(𝐒)(ℝ)/Z_𝐇(𝐒)(ℝ) = N_G(𝔞)/Z_G(𝔞) = W_G = W(Σ)` by §2.3 and the component condition, with no use of Borel–Tits 14.6. Tested on `SO(2,1)`: `M = {1, diag(1, −1, −1)}` meets both components, as the Check already records, and the (v) route needs no torus.

5. **F05** (P3) RootSystems Layers 1–2 are cited for material they do not contain

   - **Location.** README line 104: "Root systems, bases, positive systems, chambers, Weyl groups and their parabolic subgroups, for finite reduced crystallographic pairings, together with the Tau Ceti and Mathlib contracts it records." `plan.json` target 2.1 prerequisites `roadmap:RootSystems Layer 1`, `roadmap:RootSystems Layer 2`; Layer 2 Dependencies line 322.
   - **Witness.** `TauCetiRoadmap/RepresentationTheory/RootSystems/README.md` on main, lines 11–20: positive roots, chambers, longest elements and the Coxeter presentation "are not additional construction targets" there; its Layer 1 (line 248) is geometric roots and faithfulness of the Coxeter representation, its Layer 2 (line 432) is injectivity of the Weyl presentation. Nothing §2.1 uses is a RootSystems target; the actual inputs are Mathlib `RootPairing.Base` and Tau Ceti `RootPairing.Base.existsUnique_map_eq`, `TauCeti.stabilizer_eq_closure_wallReflections`, which §2.1 cites directly.
   - **Repair.** Replace the RootSystems supplier paragraph by the exact Mathlib and Tau Ceti declarations (already listed under "From Mathlib" and "From Tau Ceti"), or cite RootSystems only for its "Exact supplier contracts" section as the record of those declarations; drop `roadmap:RootSystems Layer 1/2` from target 2.1 and the supplier entry's `sections` in `plan.json`, or point them at what is used.

6. **F06** (P3) Process residue: "final target N" labels

   - **Location.** README lines 284, 373, 399, 463, 520, 561, 611, 666, 694, 817, 840 (eleven occurrences of "final target `n`").
   - **Witness.** "Final target" is the numbering of the job brief; the README defines no such list. A reader without the brief cannot resolve "final target 7".
   - **Repair.** Delete the labels, or add a numbered list of the roadmap's end theorems to the Summary and refer to it by name ("the Bruhat theorem of the Summary").

7. **F07** (P3) §7.1 third bullet carries a vacuous hypothesis

   - **Location.** README line 650: "if `g P_J g⁻¹ ⊆ P_{J'}` and `B ⊆ P_J`, then `J ⊆ J'` and `g ∈ P_{J'}`."
   - **Witness.** `B ⊆ P_J` holds for every standard parabolic (`TauCeti.TitsSystem.subgroupB_le_standardParabolic`, `Parabolic/Normalizer.lean` line 79 uses it). Borel–Tits Corollaire 5.18 (ii) (`borel-tits1965` line 1931) has no such hypothesis.
   - **Repair.** Delete "and `B ⊆ P_J`".

8. **F08** (P3) Uniqueness of the matrix polar decomposition is used but not cited

   - **Location.** README line 727: "… together with uniqueness of matrix polar decomposition gives `log p ∈ 𝔭`."
   - **Witness.** Tau Ceti has it at the pin: `Matrix.GeneralLinearGroup.existsUnique_posDef_mul_unitary`, `TauCeti/Analysis/Matrix/Polar.lean` line 76. It is not in "From Tau Ceti" nor in target 8.1c's prerequisites.
   - **Repair.** Add it to the Tau Ceti contract and to the `*Needs:*` of §8.1 / target 8.1c.

9. **F09** (P3) §9.1 attributes a Lie-theoretic datum to ALS.0.2 beyond its scope

   - **Location.** README line 807: "The datum agrees with ALS.0.2's Lie-theoretic Cartan datum."
   - **Witness.** ALS.0.2 (pull request head, README line 1246) is stated for `𝐆 = Res_{F/ℚ} G` with `G` connected reductive over a number field, not for an arbitrary connected reductive `𝐇` over `ℝ`.
   - **Repair.** Scope the sentence: "for `𝐇 = (Res_{F/ℚ} G)_ℝ` the datum agrees with ALS.0.2's", or cite ALS.0.1 (which is stated for real groups) for the involution only.

10. **F10** (P3) §8.2: `X ∈ linearLieAlgebra G` is unused in `dynamicLevi_decomposition`

   - **Location.** README line 751.
   - **Witness.** In an orthonormal eigenbasis of a symmetric `X`, `dynamicParabolic G X` is `G ∩ (block upper triangular)`, `dynamicLevi G X` is `G ∩ (block diagonal)`, and the limit `l = lim exp(−tX) g exp(tX)` lies in `G` because `G` is closed. No step uses `exp(tX) ∈ G`. For `G = SL_2(ℝ)` and `X = diag(1, 0) ∉ 𝔰𝔩_2`, all four conclusions hold.
   - **Repair.** Drop the hypothesis, or keep it and say that it is there for the consumer (§8.3) only.

11. **F11** (P3) Package-stage notes on `Suggested.lean`

   No `Suggested.lean` exists at the design stage (the design report describes one; its listed names are the README's backticked own names, which is consistent). Two headlines are statable at the pins in the matrix model and should be stated, or named as absent in the docstring, when the file is written:

   - the Tits system of §4.3 in matrix form: `∃ T : TauCeti.TitsSystem G, T.subgroupB = P ∧ T.subgroupN = N_G(𝔞)` for a self-adjoint linear `G` with `LinearComponentCondition` (`TauCeti.TitsSystem` exists at the pin, `TauCeti/GroupTheory/TitsSystem/Basic.lean` line 50);
   - the classification of standard parabolic subalgebras (§5.2–5.3) in matrix form: every Lie subalgebra of `linearLieAlgebra G` containing the non-negative `ad H₀`-eigenspace sum is the non-negative eigenspace sum of some `Y ∈ 𝔞`, and two such agree iff the centralizers agree.

Files reviewed: `packages/LieGroupsPartII/design/README.md`, `packages/LieGroupsPartII/design/plan.json`, `packages/LieGroupsPartII/sources.toml`. No earlier review of this design exists. The design is Part II of `TauCetiRoadmap/RepresentationTheory/LieGroups` (main), cites LieGroups Layers 0–4, 7, 9, RootSystems, ReductiveGroups Layer 7/7b (main), and ArithmeticLocallySymmetricSpaces ALS.F.1, ALS.0.1–0.3 (read at the head of its open pull request). Four findings need repair before the package stage (one P1, three P2); the remaining notes are P3.

## Verified sound

**Gate.** Run on the design README:

```
candidate: LieGroupsPartII is not in the merge order yet; checked as if placed after ArithmeticLocallySymmetricSpaces (the intake inserts it when its design is accepted)
depcheck: 242 roadmaps, 2366 edges, 0 problem(s)
```

No UPWARD or CYCLE line. `roadmaps resolve` reports no cross-roadmap citation and no Lean name found nowhere (the two names its earlier run flagged, `LocallySymmetric.realPoints_lieGroup` and `LocallySymmetric.IsCartanInvolution.transposeInverse`, are planned names of ALS.F.1 and ALS.0.1 at the head of the ArithmeticLocallySymmetricSpaces pull request, README lines 582–602 and 1187–1189).

**Principles.** No route-specific shortcut; the abstract Tits-system theory is consumed from Tau Ceti, not re-planned (checked declaration by declaration below); supply is downward (LieGroups, RootSystems, ReductiveGroups on main; ALS at position 62 before the candidate's insertion point); no copied passages (the convention paragraph on `Σ⁺ ∪ Σ_{Π'}` is the author's own and names the two equations (1)); no computational algorithm; no Lean file yet, so no sorry'd data or `set_option` to check.

**Ownership.** AutomorphicFormsOnReductiveGroups §2.3a (pull request head, README lines 371–385) plans the minimal parabolic, its Langlands decomposition, rank one and the Borel–Tits comparison for real points of connected reductive groups. It is later in the merge order (position 63) than the candidate's insertion point, cites LieGroups Layer 9 and ReductiveGroups Layer 7 and not this roadmap, and its §§2.3–2.4 consume general parabolics it does not build. This roadmap owns the objects at the wider generality of a reductive Cartan datum (e.g. `Mp_2(ℝ)`, `ℝ × S¹` with a tilted datum, which are not real points of algebraic groups), places itself before that roadmap, and records §2.3a as a consumer contract; I accept that as the ownership decision. That §2.3a should become an import is a note for its author, not a finding here. `roadmaps grep` over main and the 459 open pull requests for "minimal parabolic", "Langlands decomposition", "standard parabolic subalgebra", "self-adjoint linear", "dynamicParabolic", "restricted Weyl group", "indivisible" found no other roadmap building these objects for real Lie groups (hits on main: FlagVarieties, SchubertGeometry, ReductiveGroupsPartII, all algebraic). The board packages index lists none of RootSystemsPartII, ReductiveGroupsPartIII, LieHighestWeightPartII or the orbit-method roadmap as board packages at this snapshot. Tau Ceti has no Lie-group-level parabolic or Langlands objects (grep over the pin: only matrix polar decompositions and `GeneralLinearGroup/MaximalCompact.lean`).

**Supplier citations resolved.**

- LieGroups (main): Layer 0 `lieExp`, `oneParameterSubgroup`; Layer 1 `Ad`, `conj_lieExp` (Suggested.lean 141, 149); Layer 2 `lieSubalgebraOfSubgroup` (172), `isEmbeddedLieSubgroup_of_isClosed` (213); Layer 3 `lieMap`, `lieMap_lieExp`, `monoidHom_eq_of_lieMap_eq` (242–252); Layer 4 `exists_monoidHom_of_lieHom` (356); Layer 7 `Complexification` (485); Layer 9 `CartanInvolution` (660), `IsRealReductive`, `IwasawaData` (684), `iwasawaDecomposition` (735), `kakDecomposition` (745), restricted root system (README 448–466). The README's reading that `CartanInvolution` records only compact fixed set and reductivity is correct (fields at 660–672), and its `SU(2)` instance does satisfy those fields while the base's `cartan_polar_decomposition` fails on it; the design consumes Layer 9 only for a reductive Cartan datum, which is the right handling.
- ReductiveGroups (main) Layer 7 (README 627–689) states parabolic `k`-subgroups, Levi decompositions, `P = P_G(λ)`, `U_G(λ)`, `L = Z_G(λ)`, relative root system, Bruhat decomposition and Tits systems; Layer 7b (732–778) the parabolic double-coset theorem. Citations resolve.
- ArithmeticLocallySymmetricSpaces (pull request head 360d0bc): ALS.F.1 (lines 580–604), ALS.0.1 (1167–1230), ALS.0.2 (1246–1285), ALS.0.3 (1287–1300) say what the README attributes to them (R09 scopes one sentence).
- Tau Ceti at `2fd255d`: `TitsSystem` (`GroupTheory/TitsSystem/Basic.lean` 50; axioms match the README's list at line 82), `bruhatCell` (`Bruhat/Basic.lean` 100), `existsUnique_mem_bruhatCell` (`Bruhat/Uniqueness.lean` 111), `bruhatCell_injective` (35), `disjoint_bruhatCell_iff` (99), `standardParabolic` (`Parabolic/Basic.lean` 48), `mem_standardParabolic_iff` (152), `coe_standardParabolic` (160), `subgroupB_eq_top_iff` (206), `standardParabolic_eq_of_subgroupB_le` and `standardParabolicOrderIso` (`Classification.lean` 146), `normalizer_eq_of_subgroupB_le` (66), `normalizer_standardParabolic` (77), `parabolicDoubleCosetEquiv` (`DoubleCoset.lean` 199), `parabolicTitsSystem` (`TitsSystem.lean` 110), `ofRankOne` (`RankOne.lean` 63), `coxeterSystem` (`Coxeter.lean` 178), `RootPairing.Base.existsUnique_map_eq` (`Weyl/Bases.lean` 170), `stabilizer_eq_closure_wallReflections` (`FundamentalDomain.lean` 201, hypotheses at 148 as the README states), `glTitsSystem` (`Diagonal/TitsSystem.lean` 195, on `GL (Fin (n+1))`), `glTitsSystemWeylGroupMulEquivPerm` (270), `iwasawaHomeomorph` (`Iwasawa.lean` 224), `Matrix.GeneralLinearGroup.existsUnique_iwasawa` (280), `upperTriangularGroup`, `upperUnitriangularGroup`, `posDiagonalSubgroup`, `unitaryNormalizerPosDiagonalQuotientMulEquivPerm` (`RestrictedWeylGroup.lean` 230), `GL2Borel.mem_doubleCoset_weyl_iff` (`Bruhat.lean`), `existsUnique_pos_antitone_and_eq_unitary_mul_diagonal_mul_unitary` (`Cartan.lean` 65), `maximal_isCompact_iff` (`MaximalCompact.lean` 158), `Cocharacter.parabolic` (`Dynamic/Parabolic.lean` 154: conjugate `l(T) g l(T)⁻¹` extends over the origin, as the README's convention witness says), `levi` (245), `unipotent` (277), `limit` (208), `borelSubalgebra` (`Weights/Borel.lean` 439; hypotheses `IsKilling`, finite-dimensional, Cartan subalgebra, `IsTriangularizable`, a `Base`). The claim that Tau Ceti lacks "`g B g⁻¹ ⊆ P_J ⇒ g ∈ P_J`" is confirmed by grep over `GroupTheory/TitsSystem`.
- Mathlib at `1b1ccf4`: `LieGroup` (`Geometry/Manifold/Algebra/LieGroup.lean` 72), `LeftInvariantDerivation` (47), `LieAlgebra.center` (`Abelian.lean` 282), `derivedSeries` (`Solvable.lean` 69), `IsSolvable` (259), `IsSemisimple` (`Semisimple/Defs.lean` 105), `LinearMap.BilinForm` (`BilinearMap.lean` 539), `Subgroup.normalizer`, `Subgroup.centralizer` (`Centralizer.lean` 30), `DoubleCoset.doubleCoset` (37), `DoubleCoset.Quotient` (79), `RootPairing` (`Defs.lean` 81), `IsReduced` (`Reduced.lean` 50), `Base` (`Base.lean` 68; its `coroot_mem_or_neg_mem` field is exactly the obstruction the README names for `BC₁`), `weylGroup` (`WeylGroup.lean` 55), `NormedSpace.exp`, `Matrix.exp_transpose` (113), `Matrix.exp_conj` (185), `GeneralLinearGroup`, `unitarySubgroup` (`Unitary.lean` 273), `SpecialLinearGroup`, `orthogonalGroup` (`UnitaryGroup.lean` 318), `symplecticGroup` (`SymplecticGroup.lean` 102), `ConnectedComponents` (`Clopen.lean` 500), `connectedComponentIn` (505), `Bornology.IsBounded` (101), `Filter.Tendsto`, `LieDerivation.IsKilling.exists_eq_ad` (`Derivation/Killing.lean` 108, under `[Module.Finite R L] [LieAlgebra.IsKilling R L]` as stated), `LieAlgebra.ad`.

**Sources (seeded sample and flagged locators).** `borel-tits1965` (Numdam, certified; printed page = PDF page + 53): Théorème 4.15 at line 1488 (p. 90–91) ✓; Corollaire 5.9 at 1802 (p. 98) ✓, including simple transitivity of the relative Weyl group on minimal parabolics containing `S`; Théorème 5.15 at 1868 (p. 100) ✓; Proposition 5.17 at 1924, Corollaires 5.18–5.20 at 1930–1955 (pp. 101–102) ✓ (5.18 (ii) is the statement of §7.1; 5.19 the normalizer statement; 5.20 the double cosets); Proposition 9.3 at 2938 (p. 126) ✓, hypotheses "`k` locally compact of characteristic zero, `H` a closed `k`-subgroup", and the direction (ii) ⇒ (i) is what the gap asks; Théorème 14.4 at 3750 (p. 146) ✓ "`G` connected over `ℝ`, `S` maximal `ℝ`-split, `G_ℝ = (G_ℝ)⁰·S_ℝ`"; Corollaire 14.6 at 3771 ✓; §14.7 at 3775–3821 (pp. 147–148) ✓, stated for semisimple `G` as the README says. `brown-fisher-hurtado2022` §3.1, lines 499–534: equation (1) with `Σ⁺ ∪ Span(−Π′)` and the citation of Knapp Proposition 7.76 ✓. `brown-rodriguezhertz-wang2022` §1.2, lines 122–157: equation (1) with `Σ⁺ ∪ Span(Π′)`, Knapp Proposition 7.76 and Lemma 7.73 ✓. `bradlow-collier-garciaprada-gothen-oliveira2024` Introduction, lines 72–74 and 196–206 (`P_Θ`, the four families) ✓. The manifest records every cited work; `knapp2002`, `warner1972`, `wallach1988`, `bourbaki-lie4-6` are settled uncertified and cited by section. No manifest entry was changed and nothing was fetched.

**Declared gaps.** `minimal-parabolic-orderings` and `real-compactness-criterion` are precise (one Borel–Tits theorem each, with the direction and hypotheses named), minimal (nothing on main, in Tau Ceti or in this roadmap provides them; ReductiveGroups Layer 7 on main does not state them over `ℝ`), and declared with the same slug in `plan.json` and the README. `matsumoto-components` is precise and declared but not minimal (R04).

**Adversarial pass.** Rows for the sampled targets, the headline statements and the targets a finding touches.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 definiteness witness | `GL_2(ℝ)`, `B = tr(XY)` | `tr(diag(1,−1)²) = 2`; `tr(Y²) = −2` for `Y = ((0,1),(−1,0))` | holds | — |
| 1.1 polar field is not implied by the base | `SU(2)`, `θ = Ad(diag(i,−i))` | `exp(tY) = ((cos t, sin t),(−sin t, cos t))`, `exp(πY) = −1 ∈ U(1)`; `(1, πY)` and `(−1, 0)` collide | base fields hold, datum fails | — |
| 1.1 `S¹`, `ℝ^×`, compact | — | `lieExp(1) = 0`; `(±1,t) ↦ ±e^t` bijective; `𝔭 = 0` | as stated | — |
| 1.1 `K ∩ G⁰ = K⁰`, finitely many components | general | `G⁰ = K⁰·exp 𝔭`, uniqueness of the polar factor; `π₀(G) = π₀(K)` finite | holds | — |
| 1.2 formula `σ'σ = e^{2 ad X}` | `𝔰𝔩_2(ℝ)`, `g = diag(2, 1/2)` | `σ'σ = Ad(ggᵀ) = Ad(diag(4,1/4))`; `X = diag(log 2, −log 2)`; `e^{ad X} = Ad(g)` | holds; `X/2` fails | — |
| 1.3 split-centre hypothesis | `ℝ × S¹`, `θ_c(t,s) = (−t, s − 2ct)` | `θ_c² = id`; fixed `{0}×S¹`; `𝔭_c = {(x,cx)}`; polar `(s,(x,cx)) ↦ (x, s+cx)` bijective; abelian | unconditional conjugacy false; stated form holds | — |
| 1.3 proof: `𝔷∩𝔨 = 𝔷∩𝔨'` | general | both equal the Lie algebra of the maximal torus `T` of `Z(G⁰)⁰`: `exp(2tX_p) ∈ T` bounded forces `X_p = 0` | holds | — |
| 1.3 cocycle step | `ℝ ⋊ ℤ/2`, `θ_a(t,ε) = (−t+aε, ε)` | `c_{(b,0)}(t,1) = (t+2b, 1)`; `c_b θ_0 c_b⁻¹(t,1) = (−t+4b, 1)`, so `b = a/4`; `Ad(ε) = −1` on `𝔷`, so the cocycle is not a homomorphism and averaging is needed | holds | — |
| 2.1 `BC₁`, `BC₂`, `A₂` | — | coroot of `2λ` is `λ^∨/2 ∉ ℕλ^∨`; `BC₂` positive system for `v = (2,1)`: simple `{e₁−e₂, e₂}`, `Φ ∩ span{e₂} = {±e₂, ±2e₂}`, `|W| = 8`; `A₂` stabilizer `{1, s_{α₁}}` | holds | — |
| 2.3 `N_G(𝔞) = N_K(𝔞)A` | general; `GL_n` | `θ(g)⁻¹g = exp(2X)` normalizes `𝔞` ⇒ `[X,𝔞] ⊆ 𝔨 ∩ 𝔞 = 0` ⇒ `X ∈ 𝔞`; monomial = signed permutation × positive diagonal | holds | — |
| 2.3 `O(1,1)` | — | `d Y d = −Y` for `d = diag(1,−1)`; `W_G = ℤ/2`, `W(∅) = 1` | differ | — |
| 2.4 equivalences | general | `G = K exp 𝔭`, `K = N_K(𝔞)K⁰`, so `G/G⁰ ≅ N_K(𝔞)/N_{K⁰}(𝔞)`; `W_G = W(Σ) ⋊ Stab(Σ⁺)` | holds | — |
| 2.4 `Aut(𝔰𝔩_3(ℝ))` | `σ(X) = −Xᵀ`, `w₀` antidiagonal | `σAd(w₀)` is `B_θ`-orthogonal (`tr(XᵀY) = tr(XYᵀ)`); acts on `𝔞` by `−w₀`, swapping `e₁−e₂`, `e₂−e₃`; `−1 ∉ W(A₂)`; `|W_G| = 12` | condition fails | — |
| 2.4 `O(p,q)` | `p > q`; `p = q` | `M ∋ diag(ε,k',ε)`; block determinants `(Πε·det k', Πε)`: four values iff `p > q` | holds iff `p ≠ q` | — |
| 3.1 component condition passes to `L` | general | `k₀ ∈ K⁰ ∩ L`; `(K∩L)⁰`-conjugate into `N_{K⁰}(𝔞)`; its class fixes `𝔰` pointwise, lies in `⟨s_β : β|_𝔰 = 0⟩`, realized in `(K∩L)⁰` | holds | — |
| 3.2 factor order | `SL_2(ℝ)`, `((−2,3),(0,−1/2))` | `= (−1)·diag(2,1/2)·((1,−3/2),(0,1))` | holds | — |
| 3.3 (d), (f) | `SL_2(ℝ)`; `O(1,1)`; general | `K ∩ MAN = M` by Iwasawa uniqueness; `(𝔫⊕𝔫̄)^⊥ = 𝔪⊕𝔞`, `𝔭 ∩ (𝔪⊕𝔞) = 𝔞`; `O(1,1)`: `[G:P] = 2` | holds; (f) needs the condition | — |
| 3.3 (e) nilradical vs `B`-orthogonal | `GL_2(ℝ)` | nilradical of `𝔟` is `ℝE₁₂ ⊕ ℝ·1`; `𝔟^{⊥} = ℝE₁₂` | orthogonal form correct | — |
| 4.1 `𝔭 ∩ 𝔮_∅ = 𝔞` and fixed points | general | `2m + n + dθn = 0 ⇒ m = n = 0`; `Ad(k⁻¹)H₀ ∈ 𝔞` regular ⇒ `Ad(k⁻¹)𝔞 = 𝔞` | holds | — |
| 4.2 cells | `SL_3`, `SU(2,1)` | `dim P = 5`, `5 + ℓ(w)`; `SU(2,1)`: `dim P = 1+1+3`, big cell `5 + 3 = 8` | holds | — |
| 4.2 hypothesis | `O(1,1)`; general | `G = P ⊔ dP`, `d ∈ N_K(𝔞)`; general: `G = M'G⁰`, cells are stable sets of distinct `A`-fixed points | decomposition over `W_G` holds without the condition | R03 |
| 4.3 generation, `GL_n`, `SL_2`, compact | — | `⟨P, N_G(𝔞)⟩ ⊇ N̄`, `G⁰`, `M`; `Aut(𝔰𝔩_3)`: order 12 vs two reflections; `S = ∅ ⟺ B = ⊤` | holds | — |
| 5.1 `SL_3`, `SU(n,1)`, `GL_n` | — | `𝔮_{α₁}` blocks `(2,1)`; `−2λ ∈ Σ ∩ span{λ}`; `2^{n−1}` compositions; `𝔞_Π = 𝔷_𝔭` | holds | — |
| 5.2 classification | `𝔮_∅ ⊕ ℝE₃₁`; `SL_2(ℂ)`; general | `[E₁₂, E₃₁] = −E₃₂`; `[i·diag(1,−1), zE₂₁] = −2iz E₂₁`; `(ad X)² : 𝔤^β → 𝔤^{−β}` is an isomorphism (`𝔰𝔩_2` weights `2 → −2`), so one non-zero vector of `𝔮 ∩ 𝔤^{−β}` gives all of `𝔤^{−β}` | holds; the `M`-action in the sketch is not needed | — |
| 5.3 eigenspaces | `diag(1,1,−2)`; `X = 0`; regular `X` | `α₁(X) = 0`, `α₂(X) = 3`; `β(X) = 0` for negative `β` iff support `⊆ Π'` | holds | — |
| 6.1 overgroups | `GL_3`; `O(1,1)` | `|W_{Π'}| = 1,2,2,6`; `𝔮_∅ = 𝔤`, `N_G(𝔤) = G ≠ P`; `N_𝔤(𝔮_{Π'}) = 𝔮_{Π'}` since `[Y,𝔞] = ℝY ⊄ 𝔮` for `Y ∈ 𝔤^{−β}`, `β ∉ Σ_{Π'}` | holds | — |
| 6.2 `⁰L` | `ℝ^×`; `GL_n`; `ℝ×S¹`; general | `{±1}`; `|det| = 1`; `{0}×S¹` for all `c`, `A_L = {(t,ct)}`; `L₁ = K_L·exp(𝔭∩[𝔩,𝔩])` is a subgroup, `L = L₁ × A_L`, the `A_L`-coordinate is a continuous homomorphism, so `⁰L = L₁` | holds | — |
| 6.3 (c) | general; `Π' = ∅`, `Π` | `K ∩ L ⊆ ⁰L` (compact image in `ℝ_{>0}`); `𝔞 ∩ 𝔪_{Π'} = 𝔞 ∩ [𝔩,𝔩]` maximal abelian in `𝔭 ∩ [𝔩,𝔩]`; `M_∅ = M`, `A_Π = A_G` | holds | — |
| 6.3 / 7.3 dependency | plan | `6.3 → 7.3 → 6.3` | cycle | R02 |
| 7.1 bullets | `GL_3(k)`; `S = ∅` | 5.18 (ii) with `θ = ∅` gives bullet 1; `B ⊆ P_J` always | holds; one vacuous hypothesis | R07 |
| 7.2 types | `SL_3` | `𝔮_{α₁}` stabilizes `⟨e₁,e₂⟩`, `𝔮_{α₂}` stabilizes `⟨e₁⟩` | holds | — |
| 7.3 sign witness and (i) | `GL_2`, `X = diag(1,0)`; general | `((a, e^{−t}b),(e^{t}c, d))` bounded iff `c = 0`; block `E_μ → E_λ` scaled by `e^{t(μ−λ)}` | holds | — |
| 7.3 (ii) | general; `Aut(𝔰𝔩_3)`, `X₀ = diag(1,0,−1)` | `X ∈ 𝔞_{Π'}` so `L ⊆ Z_G(X)`; off-diagonal blocks vanish ⇒ `n = 1`; `σAd(w₀)X₀ = X₀`, `σAd(w₀) ∉ MA` | holds under the condition; fails without | — |
| 7.3 vs `TauCeti.Cocharacter.parabolic` | `λ(t) = diag(t,1)` | `((a,tb),(t⁻¹c,d))` extends iff `c = 0`; `λ(e^{−s}) = exp(−sX)` | conventions agree | — |
| 8.1 finiteness, transpose | `{diag(2^k,2^{−k})}`; unitriangular `2×2` | `linearLieAlgebra = 0`; `K = {1}`, `𝔭 = 0`; `diag(2,3)^t ∉ {diag(2^k,3^k)}` | both fields needed | — |
| 8.1 polar sketch | general | `p = gᵀg`, `p^r ∈ G⁰`; `φ : K⁰ × 𝔭 → G⁰` has closed open image (`d exp` invertible as `ad X` has real spectrum); `log p = (1/r) log p^r ∈ 𝔭` by uniqueness | holds; uniqueness lemma uncited | R08 |
| 8.2 `dynamicLevi_decomposition` | `((2,3),(0,5))`, `X = diag(1,0)`; skew `X`; `X ∉ 𝔤` | limit `diag(2,5)`, `u = ((1,3/2),(0,1))`; rotations bounded, `U = 1`, `L = {aI + bX}`; conclusions hold for `SL_2`, `X = diag(1,0)` | holds; `X ∈ 𝔤` unused | R10 |
| 8.3 `minimalParabolic_langlands` | `O(1,1)`; general | `P = MA`, `G = KP` holds, `P` normal of index 2, not self-normalizing; regular `H₀` ⇒ `Σ⁺ = {β(H₀) > 0}`, `Q(H₀) = Q_∅ = P` | holds; `O(1,1)` refutes self-normalization only | — |
| 8.3 `bruhat_decomposition_linear` | `O(1,1)` | `k ∈ {±1, ±d}`, cells `P`, `dP`; meeting cells give `k⁻¹k' = ±1` | holds without the condition | R03 |
| 8.3 `eq_dynamicParabolic_of_le` | `O(1,1)`; `SL_3`, `X = diag(1,1,−2)`, `Y = 2X`, `diag(1,0,−1)` | `Q(0) = G ≠ Q(Y) = P`, same centralizer `𝔤`; `P ⊆ Q(X)` forces `β(X) ≥ 0` (`exp(e^{−tβ(X)}Y_β)`), and `Z_𝔤(X) = 𝔪 ⊕ 𝔞 ⊕ ⨁_{Σ_{Π'(X)}}` | iff holds under the condition; fails for `O(1,1)` | — |
| 8.3 `LinearComponentCondition` | `GL_n`; `O(p,q)` | `connectedComponentIn G m = mG⁰`; `diag(−1,1,…,1)` | matches §2.4 | — |
| 9.1 component condition | `SO(2,1)`; general | `M = {1, diag(1,−1,−1)}` (solved `gY = Yg` with `g = diag(k, det k)`); `Ad(𝐇(ℂ)) = Int(𝔤_ℂ)` gives axiom (v) | holds by (v); Matsumoto route under-specified | R04 |
| 9.2 (a) | general; `SO(2,1)` | Zariski closure of `A` is irreducible, of symmetric matrices, split, with Lie algebra an abelian subspace of `𝔭` containing `𝔞`; `𝐒 = {a² − b² = 1}`, `a = −1` gives `diag(1,−1,−1)`, `[𝐒(ℝ):A] = 2` | holds with the gap | — |
| 9.2 Check `𝔾_m × SO(2)` | — | `Hom_ℝ(SO(2), 𝔾_m) = Hom_ℝ(𝔾_m, SO(2)) = 0`; twisted form compact iff inversion on `𝔾_m` and identity on `SO(2)` | holds | — |
| 9.3 "iff" | `GL_2(ℝ)`, `𝔮 = {((a,b),(0,−a))}`; `SU(2)`; `SL_2(ℂ)` | `𝔮 ⊗ ℂ ∩ 𝔰𝔩_2(ℂ)` is a Borel, `1 ∉ 𝔮`, `dim 𝔮 = 2 < 3`; `𝔱_ℂ` contains no Borel; `X⊗z ↦ (zX, zX̄)` sends upper triangular to a sum of Borels | false without `𝔷 ⊆ 𝔮` | R01 |
| Context / generality | all | each theorem names datum, triple, and the condition where used; README and planned Lean forms agree in Layer 8 | checked | — |

**Shape.** Summary, Scope and ownership, Conventions (with computed sign witnesses), Exact supplier contracts, How to read the build, nine layers each with Examples and Dependencies, Downstream consumers, Worked examples, References: present. Every definition has an API list and at least three Checks (1.1: 6; 2.1: 3; 3.2: 4; 5.1: 3; 6.1: 4; 6.2: 5; 7.2: 4; 8.1: 5; 8.2: 4; 8.3: 4); every theorem has hypotheses in the sentence and a locator; no LaTeX delimiters, no process words other than R06. Elaboration: not available (this lane does not elaborate; there is no `Suggested.lean` at the design stage).

## Not verifiable

- `knapp2002` (Ch. VI §§2, 4–5; Ch. VII §§2, 4–7, Lemma 7.73, Proposition 7.76), `warner1972` (Ch. 1 §§1.1–1.2), `wallach1988` (Ch. 2 §§2.1–2.2), `bourbaki-lie4-6` (Ch. IV §2, Ch. VI §1): settled uncertified, cited by locator; the chapter-level locators were not checked against a text. The proposition numbers 7.73 and 7.76 agree with the two certified Annals papers that cite them.
- Elaboration of a Lean file: none exists at the design stage and this lane does not elaborate.
- Ownership against open pull requests whose files the brief did not give me was checked only through `roadmaps grep` and `roadmaps show`; the ArithmeticLocallySymmetricSpaces and AutomorphicFormsOnReductiveGroups texts were read at their heads with `roadmaps show`.

## Source issues

- none

<!-- tauceti-roadmap-review {"agent": "claude", "head": "3d229d95f5201c378755394d8b1b923c76f03d11", "job": "REV-DESIGN-LieGroupsPartII", "model": "fable", "worker": "chris-x18"} -->
