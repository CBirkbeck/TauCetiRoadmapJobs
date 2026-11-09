# Review of AlgebraicKTheory (pull request #1142 at e4c7867)

**Verdict:** needs changes

This is a full review of `TauCetiRoadmap/AlgebraicKTheory/` at e4c7867. The folder changed by 186 lines since b340b2c. The pins are Tau Ceti 2fd255d and Mathlib 1b1ccf4. The gate passes, and nothing outside the folder changed. The three findings of the previous review are repaired (see "Previous findings" below).

There are six findings, three of them blocking. All three blocking findings come from objects that already exist at the pins:

- **R01, R02, R04.** The pinned Tau Ceti already has the elementary subgroup over an arbitrary ring, Whitehead's lemma, the stable groups GL∞ and E∞, and algebraic K₁, in `TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/{Transvection,Elementary,Stable}.lean`.
  - The README plans these again.
  - `Suggested.lean` redefines `elementary` and states two theorems the pin already proves.
  - The module docstring says GL(R) and K₁(R) are missing, so the K₁ headline calculations are absent although they are statable.
- **R03.** The 0.5 tangent-section module is a one-line kernel, so its non-freeness is statable. The docstring says it is not.

## R01 (P2) — Layers 1–2 plan the elementary subgroup, Whitehead's lemma, GL∞, E∞ and K₁, which the pinned Tau Ceti already has

**Location.**
- `TauCetiRoadmap/AlgebraicKTheory/README.md` :32: "the commutative transvection formulas that 1.1 generalizes and the SL comparison it keeps; neither pinned library has an elementary subgroup over an arbitrary ring."
- :25: "… all stated for commutative rings, are generalized to arbitrary rings with the same expressions (1.1). … build the needed generalizations in Tau Ceti".
- Scope :13: the roadmap owns "the elementary subgroups, the stable general linear group and Whitehead's lemma (Layer 1); K₁(R)".
- The targets of 1.1 (:231, "Define Eₙ(R), written `elementary`"), 1.2 (:249), 1.3 (:265) and 2.1 (:305), and the provenance bullet (:747).

**Claim.** For any `[Ring A]`, Tau Ceti at the pin has:
- the elementary matrices and their relations;
- Eₙ(A);
- the block-unipotent memberships and Whitehead's factorization;
- GL∞(A) with its universal property, and E∞(A), normal and equal to the commutator subgroup;
- K₁(A) as the abelianization, with its class map, its triviality criterion and GL∞/E∞ ≃* K₁.

The README re-plans these. It also states twice that the library lacks them.

**Witness.** Tau Ceti 2fd255d:
- `GeneralLinearGroup/Elementary.lean` :75 `TauCeti.elementarySubgroup` (any `[Ring A]`), :255 u⊕u⁻¹ elementary, :268 ⁅u,v⁆⊕1 elementary;
- `GeneralLinearGroup/Stable.lean` :155 `StableGeneralLinearGroup`, :271 E∞ normal, :293 `elementarySubgroup_eq_commutator`, :314 `AlgebraicK1`, :359 GL∞/E∞ ≃* K₁.

**Repair.**
1. Add three bullets under `### From Tau Ceti`. All are for any `[Ring A]` unless marked.
   - **`TauCeti.LinearAlgebra.Matrix.GeneralLinearGroup.Transvection`:**
     - `TauCeti.transvectionUnit` (value 1+`Matrix.single i j c`, `coe_transvectionUnit_eq_one_add_single`);
     - `TauCeti.transvectionUnit_add`, `TauCeti.transvectionUnit_inv` and `TauCeti.transvectionHom`;
     - `TauCeti.commute_transvectionUnit` (distant commutation) and `TauCeti.commutatorElement_transvectionUnit` ([xᵢⱼ(c),xⱼₗ(d)]=xᵢₗ(cd), distinct indices);
     - `Equiv.reindexGL_transvectionUnit`;
     - for commutative rings only, `TauCeti.toGL_transvection_eq_transvectionUnit` and `TauCeti.map_transvectionUnit`.
   - **`TauCeti.LinearAlgebra.Matrix.GeneralLinearGroup.Elementary`:**
     - `TauCeti.elementarySubgroup` with `TauCeti.elementarySubgroup_le_iff`;
     - `TauCeti.commutator_elementarySubgroup_self` (perfect when there are at least three indices) and `TauCeti.elementarySubgroup_le_commutator`;
     - `TauCeti.fromBlocksGL`, and `Matrix.upperBlockGL_mem_elementarySubgroup` and `Matrix.lowerBlockGL_mem_elementarySubgroup`;
     - `TauCeti.map_elementarySubgroup_le_elementarySubgroup`;
     - `TauCeti.fromBlocksGL_inv_mem_elementarySubgroup`, `TauCeti.fromBlocksGL_commutatorElement_mem_elementarySubgroup` and `TauCeti.fromBlocksGL_conj_mem_elementarySubgroup`;
     - `Equiv.map_reindexGL_elementarySubgroup`.
   - **`TauCeti.LinearAlgebra.Matrix.GeneralLinearGroup.Stable`:**
     - `TauCeti.stabilizeGL`;
     - `TauCeti.StableGeneralLinearGroup` with `.of`, `.of_injective`, `.exists_of`, `.exists_of₂` and `.lift`;
     - `.elementarySubgroup`, `.mem_elementarySubgroup_iff`, `.of_mem_elementarySubgroup_iff`, `.elementarySubgroup_normal` and `.elementarySubgroup_eq_commutator`;
     - `TauCeti.AlgebraicK1` with `.mk`, `.mk_stabilizeGL`, `.mk_eq_one_iff`, `.mk_eq_mk_iff`, `.quotientElementarySubgroupEquiv` and `.lift`.

   K₁ in the README's additive convention is `Additive (TauCeti.AlgebraicK1 R)`.
2. Fix the false library claims and the obsolete text:
   - Delete "neither pinned library has an elementary subgroup over an arbitrary ring" (:32).
   - Replace the sentence at :25 ("… are generalized to arbitrary rings … build the needed generalizations in Tau Ceti … does not wait on their merge") with a pointer to the pinned arbitrary-ring relations above.
   - Delete the provenance bullet (:747). Tau Ceti's `Elementary.lean` is the formalization, and deleting the bullet also removes the six names that `roadmaps resolve` finds nowhere.
3. Keep the headings 1.1–1.3 and 2.1, because GeneralAlgebraicKTheory §§3.3–3.4, GeometryOfNumbersAndQuadraticArithmetic §6.1.7 and OperatorKTheory cite A1–A2. Reduce each section to citations of the pinned declarations plus what the pin lacks:
   - **1.1:** the ring-map formula over noncommutative rings (the pinned `map_transvectionUnit` is commutative only), and the subgroup-level SL comparison (the pin has only the elementwise `toGL_transvection_eq_transvectionUnit`).
   - **1.2:** functoriality of GL∞ and E∞ in ring maps, filtered colimits, the finitary-automorphism comparison and arbitrary finite index types.
   - **1.3:** perfectness of E∞, from `commutator_elementarySubgroup_self`.
   - **2.1:** the block-sum formula, K₁(f) (R02), K₁(0)=0, products, filtered colimits and the comparison with finite-rank abelianizations.
4. In Scope (:13), say that Layer 1 owns the ring-map, SL, lifting and functoriality statements, and Layer 2 owns K₁'s functoriality and computations, K₁ᴮ(C) and the Dieudonné determinant. The carriers are Tau Ceti's.

This is tested: a scratch file proves `elementary n = TauCeti.elementarySubgroup n R` (R04).

## R02 (P2) — The K₁ calculations of Layer 2 and the K₁ end of the Milnor sequence are statable on the pinned `TauCeti.AlgebraicK1`, but the docstring says GL(R) and K₁(R) are missing

**Location.**
- `TauCetiRoadmap/AlgebraicKTheory/Suggested.lean` :16–17: "the stable group `GL(R)` and `K₁(R)` are README targets".
- :21–22: "its `K₁` terms and its boundary need the stable group `GL(R)` and `K₁(R)`, README targets that neither library has".
- :50–51: "both groups are stable colimits over `GL(A)`, a README target".
- README :630: "the K₁ terms and δ await Layer 2 and 6.3".
- The Summary (:3) lists "the explicit K₀ and K₁ calculations of Layers 0, 2 and 7" among the end theorems.

**Claim.** GL(R) and K₁(R) are at the pin (R01). As a result, these headlines are statable and absent:
- K₁(D)≅Dˣ/[Dˣ,Dˣ] and K₁(ℤ)={±1} (2.3);
- exactness at K₁(A₁)⊕K₁(A₂) (6.4).

What is still not statable is the boundary δ, because its definition needs the patched module M(u) as an object of Proj(D).

**Witness.** In a scratch file importing `TauCeti.LinearAlgebra.Matrix.GeneralLinearGroup.Stable`, these elaborate with exit 0:
- `kOne_divisionRing`, `kOne_int` and `kOne_mayerVietoris_exact` below;
- `kOneMap`, built by `TauCeti.AlgebraicK1.lift` with a complete proof, so it carries no `sorry`.

A repaired copy of the whole file elaborates with 17 `sorry` warnings and nothing else.

**Repair.** Add the import `TauCeti.LinearAlgebra.Matrix.GeneralLinearGroup.Stable` and these declarations. The `ext`/`split_ifs` proof is the tested one.

```lean
/-- `K₁(D) ≅ Dˣ/[Dˣ,Dˣ]` for a division ring, sending the class of the `1 × 1` matrix `(d)` to
the class of `d` (Weibel, *The K-book*, Chapter III, 1.2.4 and Exercise 1.2). -/
theorem kOne_divisionRing (D : Type u) [DivisionRing D] :
    ∃ e : TauCeti.AlgebraicK1 D ≃* Abelianization Dˣ, ∀ d : Dˣ,
      e (TauCeti.AlgebraicK1.mk D 1
        (Units.map (Matrix.scalar (Fin 1) : D →+* Matrix (Fin 1) (Fin 1) D).toMonoidHom d)) =
        Abelianization.of d := by
  sorry

/-- `K₁(ℤ) ≅ ℤˣ = {±1}` by the determinant (Weibel, Chapter III, Example 1.3.5). -/
theorem kOne_int :
    ∃ e : TauCeti.AlgebraicK1 ℤ ≃* ℤˣ, ∀ (n : ℕ) (g : GL (Fin n) ℤ),
      e (TauCeti.AlgebraicK1.mk ℤ n g) = Matrix.GeneralLinearGroup.det g := by
  sorry

/-- `K₁(f)` along a ring homomorphism: entrywise application of `f` commutes with `u ↦ u ⊕ 1`. -/
noncomputable def kOneMap {R S : Type u} [Ring R] [Ring S] (f : R →+* S) :
    TauCeti.AlgebraicK1 R →* TauCeti.AlgebraicK1 S :=
  TauCeti.AlgebraicK1.lift
    (fun n => (TauCeti.AlgebraicK1.mk S n).comp
      (Units.map (f.mapMatrix : Matrix (Fin n) (Fin n) R →+* _).toMonoidHom))
    (fun m n h g => by
      have hmap : Units.map (f.mapMatrix : Matrix (Fin n) (Fin n) R →+* _).toMonoidHom
          (TauCeti.stabilizeGL R h g) = TauCeti.stabilizeGL S h
            (Units.map (f.mapMatrix : Matrix (Fin m) (Fin m) R →+* _).toMonoidHom g) := by
        ext i j
        rw [TauCeti.coe_stabilizeGL_apply]
        change f ((TauCeti.stabilizeGL R h g : Matrix (Fin n) (Fin n) R) i j) = _
        rw [TauCeti.coe_stabilizeGL_apply]
        split_ifs <;> simp [Matrix.one_apply, apply_ite f]
      simp only [MonoidHom.comp_apply, hmap, TauCeti.AlgebraicK1.mk_stabilizeGL])

/-- Exactness of `K₁(D) → K₁(A₁) × K₁(A₂) → K₁(Q)` at the middle term for a square with one
surjective leg (Weibel, Chapter III, Theorem 2.6, chapter p. 15). -/
theorem kOne_mayerVietoris_exact {A₁ A₂ Q : Type u} [Ring A₁] [Ring A₂] [Ring Q]
    (π₁ : A₁ →+* Q) (π₂ : A₂ →+* Q)
    (h : Function.Surjective π₁ ∨ Function.Surjective π₂) :
    ((kOneMap π₁).comp (MonoidHom.fst _ _) / (kOneMap π₂).comp (MonoidHom.snd _ _)).ker =
      ((kOneMap (RingHom.pullbackFst π₁ π₂)).prod (kOneMap (RingHom.pullbackSnd π₁ π₂))).range := by
  sorry
```

K₁(F)=Fˣ for a field is the commutative case of `kOne_divisionRing`, and it stays a README Check.

Rewrite the docstring:
- Delete :16–17's clause.
- Replace :21–22 with: "exactness at `K₁(Q)` and `K₀(D)` needs the boundary `δ([u]) = [M(u)] − [Dⁿ]`, whose definition needs the patched module `M(u)` as an object of `FiniteProjectiveRight D`, that is, the finite projectivity that `milnor_patching` proves".
- In the Layer 8 bullet, replace "both groups are stable colimits over `GL(A)`, a README target" with "the stable component group, the quotient of `TauCeti.StableGeneralLinearGroup A` by the stabilized identity components `GLₙ(A)₀`, is in neither library".

In the README:
- name `kOneMap` in 2.1;
- name `kOne_divisionRing` and `kOne_int` in 2.3;
- name `kOne_mayerVietoris_exact` in 6.4, and replace "await Layer 2 and 6.3" (:630) with this.

## R03 (P2) — 0.5's non-freeness and stable freeness are statable, but the docstring says they need a missing carrier

**Location.** `Suggested.lean` :35–37: "The real tangent-section module's nonfreeness, stable splitting and K₀ class (0.5) require the continuous section submodule cut out by the sphere projection, with its finite-projective object in `FiniteProjectiveRight`." The 0.6 bullet at :38–39 gives the same reason for the free complexified module.

**Claim.**
- The section module P={v:S²→ℝ³ | ⟨x,v(x)⟩=0} is the kernel of a native linear map.
- Non-freeness and P⊕R≅R³ are statements about this R-module over the commutative ring R=C(S²,ℝ). They need no finite-projective object.
- The non-freeness is the deep result of 0.5 (the hairy ball theorem), and the docstring itself lists it as a headline.

**Witness.** In a scratch file:
- `LinearMap.ker (∑ i, sphereCoord i • LinearMap.proj i)` elaborates;
- `simp` proves that membership is `∑ i, sphereCoord i * v i = 0`;
- `¬ Module.Free C(S², ℝ) tangentSections` elaborates, and so does the splitting;
- the K₀ class elaborates, with finite projectivity quantified.

**Repair.** Add these declarations (tested: the repaired copy elaborates):

```lean
/-- The coordinate functions `x ↦ xᵢ` on the unit sphere `S² ⊂ ℝ³`. -/
noncomputable def sphereCoord (i : Fin 3) :
    C(Metric.sphere (0 : EuclideanSpace ℝ (Fin 3)) 1, ℝ) :=
  ⟨fun x => EuclideanSpace.proj i (x : EuclideanSpace ℝ (Fin 3)),
    (EuclideanSpace.proj i).continuous.comp continuous_subtype_val⟩

/-- The tangent-section module of 0.5: continuous fields `v : S² → ℝ³` with `⟨x, v x⟩ = 0`. -/
noncomputable def tangentSections :
    Submodule C(Metric.sphere (0 : EuclideanSpace ℝ (Fin 3)) 1, ℝ)
      (Fin 3 → C(Metric.sphere (0 : EuclideanSpace ℝ (Fin 3)) 1, ℝ)) :=
  LinearMap.ker (∑ i, sphereCoord i • (LinearMap.proj i :
    (Fin 3 → C(Metric.sphere (0 : EuclideanSpace ℝ (Fin 3)) 1, ℝ)) →ₗ[
      C(Metric.sphere (0 : EuclideanSpace ℝ (Fin 3)) 1, ℝ)]
      C(Metric.sphere (0 : EuclideanSpace ℝ (Fin 3)) 1, ℝ)))

/-- The tangent-section module is stably free but not free (Weibel, *The K-book*, Chapter I,
Example 1.2.2, for the polynomial version). -/
theorem tangentSections_stablyFree_not_free :
    Nonempty ((tangentSections × C(Metric.sphere (0 : EuclideanSpace ℝ (Fin 3)) 1, ℝ)) ≃ₗ[
      C(Metric.sphere (0 : EuclideanSpace ℝ (Fin 3)) 1, ℝ)]
      (Fin 3 → C(Metric.sphere (0 : EuclideanSpace ℝ (Fin 3)) 1, ℝ))) ∧
    ¬ Module.Free C(Metric.sphere (0 : EuclideanSpace ℝ (Fin 3)) 1, ℝ) tangentSections := by
  sorry
```

In the README:
- In 0.5, name `tangentSections` with its API: membership is pointwise orthogonality, and P is the image of p. Name the theorem as well.
- The class [P]=2[R] follows from the splitting and stays a README statement.

In the docstring:
- Delete the 0.5 bullet.
- Reduce the 0.6 bullet to: "the Chern number +2 of the tangent complex line (0.6) needs the first Chern class of a complex line bundle, which neither library has". The free frame of P_ℂ is an explicit README construction, not a headline.

## R04 (P3) — `Suggested.lean` redefines the pinned elementary subgroup, and two of its theorems close by pinned lemmas

**Location.** `Suggested.lean`:
- :154–157, `def elementary … Subgroup.closure {g | ∃ (i j : n) (_ : i ≠ j) (a : R), (g : Matrix n n R) = 1 + Matrix.single i j a}`;
- :162–169, `whitehead_commutator_elementary`;
- :174–177, `elementary_le_commutator`.

**Claim.** `elementary` is `TauCeti.elementarySubgroup`, so the two theorems are pinned results restated with `sorry`.

**Witness.** In a scratch file, both of these elaborate without `sorry`:
- `elementary_eq_tauCeti : elementary (R := R) n = TauCeti.elementarySubgroup n R`, by `congr 1; ext g` and `coe_transvectionUnit_eq_one_add_single`;
- `elementary_le_commutator := by rw [elementary_eq_tauCeti]; exact TauCeti.elementarySubgroup_le_commutator hn`, and `whitehead_commutator_elementary` with `U := TauCeti.fromBlocksGL (⁅g, h⁆, 1)` and `fromBlocksGL_commutatorElement_mem_elementarySubgroup`.

**Repair.**
- Delete `elementary`, `whitehead_commutator_elementary` and `elementary_le_commutator` from `Suggested.lean`, together with the then-empty Layer A1 section.
- Replace `elementary (R := D) n` by `TauCeti.elementarySubgroup n D` in `dieudonne_determinant` (:188). Replace `elementary (R := R) (n ⊕ k)` and `elementary (R := R) n` by `TauCeti.elementarySubgroup (n ⊕ k) R` and `TauCeti.elementarySubgroup n R` in `surjective_stability` (:212) and `injective_stability` (:226–227). This is tested: the repaired copy elaborates.
- In the README, cite the two pinned theorems in 1.3 in place of the two bullets naming the deleted declarations (:267–268).
- Drop "written `elementary`" from 1.1 (:231).

## R05 (P3) — 0.5 derives the hairy ball theorem from Euler classes, which DifferentialGeometry 11.1 on main already supplies in the needed form

**Location.**
- README :167: "This contradicts the hairy ball theorem for S²: a nowhere-zero continuous section of TS² forces its Euler class to vanish (CharacteristicClasses C2, item 2), while oriented TS² has Euler number 1+(−1)²=2 (C7, item 3)."
- 0.5's *Needs:* :179; the contracts :67–70; the Layer 0 Dependencies :225.

**Claim.** The contradiction 0.5 needs is the hairy ball theorem for fields v:S²→ℝ³ with ⟨x,v(x)⟩=0. DifferentialGeometry 11.1 owns exactly this statement. The Euler-class route makes 0.5 wait for CharacteristicClasses' Thom/Euler theory and the smooth identification of TS² (C7 item 3).

**Witness.** DifferentialGeometry on main, `TauCetiRoadmap/DifferentialGeometry/Suggested.lean` :3093, `exists_eq_zero_of_inner_eq_zero`:
- for even n with `finrank ℝ E = n+1`, every continuous `w` on the unit sphere with `⟪w x, x⟫ = 0` vanishes;
- README :902;
- the same name and number are at the DifferentialGeometry #886 head (README :2342, `Suggested.lean` :1208).

**Repair.**
- In 0.5, take the contradiction for s₁ from DifferentialGeometry 11.1 `exists_eq_zero_of_inner_eq_zero` with E=ℝ³ and n=2.
- In 0.5's *Needs:* (:179) and the Layer 0 Dependencies (:225), replace "CharacteristicClasses C2 (item 2) and C7 (item 3)" with "DifferentialGeometry 11.1".
- Add 11.1 to `### From TauCetiRoadmap.DifferentialGeometry` (:65).
- Delete the C2 contract bullet (:69).
- In the C7 bullet (:70), keep only the use in 0.6's terminal comparison.
- 0.5's S¹ Check stays as it is: 11.1 needs n even, and S¹ has n=1.

## R06 (P3) — `RingEquiv.finiteProjectiveModulesK0Equiv` does not exist at the pin

**Location.** README :53 (contract), :127 (0.3: "Equivalence invariance is `CategoryTheory.Equivalence.finiteProjectiveModulesK0Equiv` and `RingEquiv.finiteProjectiveModulesK0Equiv`") and :147 (0.3 *Needs:*).

**Claim.** There is no declaration of that name. The ring-isomorphism case is the Morita map applied to Mathlib's restriction equivalence.

**Witness.**
- `#check @RingEquiv.finiteProjectiveModulesK0Equiv` gives "Unknown constant".
- `TauCeti/Algebra/Category/ModuleCat/CartanMap/RingEquiv.lean` declares only `ModuleCat.restrictScalarsEquivalenceOfRingEquiv_{refl,…_symm,…_trans}_finiteProjectiveModulesK0Equiv` (:106, :120, :134).
- `(ModuleCat.restrictScalarsEquivalenceOfRingEquiv e).finiteProjectiveModulesK0Equiv` elaborates.

**Repair.** At :53, :127 and :147, replace `RingEquiv.finiteProjectiveModulesK0Equiv` with "`CategoryTheory.Equivalence.finiteProjectiveModulesK0Equiv` of Mathlib's `ModuleCat.restrictScalarsEquivalenceOfRingEquiv e`". Add its functoriality lemmas from `TauCeti.Algebra.Category.ModuleCat.CartanMap.RingEquiv`:
- `ModuleCat.restrictScalarsEquivalenceOfRingEquiv_refl_finiteProjectiveModulesK0Equiv`;
- `ModuleCat.restrictScalarsEquivalenceOfRingEquiv_finiteProjectiveModulesK0Equiv_symm`;
- `ModuleCat.restrictScalarsEquivalenceOfRingEquiv_finiteProjectiveModulesK0Equiv_trans`.

## Previous findings (PRREVIEW-AlgebraicKTheory~12)

- **R01 — repaired.**
  - 0.2 (:108) now reads "its adjunction E_f ⊣ Res_f with native `ModuleCat.restrictScalars f` is Tau Ceti's `TauCeti.BalancedExtension.adjunction f`". The commutative comparison is `TauCeti.BalancedExtension.extendScalarsIso f`.
  - The contract (:54) lists `adjunction_homEquiv_apply`, `adjunction_unit_app_apply`, `adjunction_counit_app_tmul`, `extendScalarsIso`, `extendScalarsIso_hom_app_tmul` and `extendScalarsIso_inv_app_tmul`.
  - No §7.7 or §7.8 citation remains (grep: 0).
- **R02 — repaired.**
  - :57 cites `Module.Projective.exists_prod_linearEquiv_fin` (`TauCeti.Algebra.Module.Projective.FreeComplement`), which I read at its :49.
  - :56 now has "for free P and Q over a ring with the strong rank condition", matching `StableEquivalent.lean` :188.
- **R03 — repaired.**
  - The patching theorem is now stated as `milnor_patching` (docstring :25–27), through Mathlib's `CategoricalPullback` and `extendScalarsCompIso`.
  - The torsion-class reason (:28–30) now reads "it needs the patched module `M(u) …` of 6.2 and 6.3 as a right `D`-module, which neither library has".
- The previous review's remark that 6.2 should cite `CategoricalPullback` has also been adopted (:37, :584).

## Verified sound

### Gate, build, elaboration, probe, signatures and dependency check

- **Gate**, rerun at this head with `--base origin/main`, exit 0:

  ```text
  gate AlgebraicKTheory: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
  ```

  The worker's run also reports `build=0`. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/AlgebraicKTheory'` is empty.
- **Dependency check.** The required command printed exactly `depcheck: 235 roadmaps, 2261 edges, 0 problem(s)`: no UPWARD, CYCLE or moved line. The suppliers are all earlier or on main:
  - on main: ClassicalArithmeticCompletion, DifferentialGeometry, CharacteristicClasses, TopologicalKTheory and BanachAlgebras;
  - on main and at merge-order line 8: HilbertModules;
  - this roadmap is at line 15.
- **Elaboration.** `lake env lean` on `TauCetiRoadmap/AlgebraicKTheory/Suggested.lean` exits 0 with exactly 15 "declaration uses `sorry`" warnings and nothing else.
- **One-tactic probe.** I made a scratch copy with every `sorry` replaced by `first | rfl | simp | infer_instance | decide | trivial | aesop`. It gives 15 errors, so nothing closes in one tactic. R04's two theorems close only after rewriting `elementary` to the pinned subgroup.
- **`#check @` audit.** I checked all 23 declarations in one scratch file.
  - `kZeroMap`, `extendScalarsιIso`, `extendScalarsCompIso`, `PatchingTriples` and `patchingFunctor` take one universe `u_1` for all rings, as Conventions :21 says.
  - `milnor_patching` and `kZero_mayerVietoris_exact` carry `Function.Surjective ⇑π₁ ∨ Function.Surjective ⇑π₂`.
  - `injective_stability` keeps `s + 1 ≤ Fintype.card n`.
  - Both Vaserstein theorems keep `[CompactSpace X] [T2Space X]` and `1 ≤ s`.
  - No binder is lost, and every elaborated type matches its README statement.
- **README names.** I ran `#check @` on 122 dotted backticked README names. All exist except:
  - the six provenance names at :747 (R01);
  - `RingEquiv.finiteProjectiveModulesK0Equiv` (R06);
  - the three modules without object files (`FreeComplement`, `StableEquivalent`, `CartanMap.RingEquiv`), whose declarations I read in source. `Module.Projective.exists_prod_linearEquiv_fin` is at `FreeComplement.lean` :49, and `TauCeti.StableEquivalent` with its API is at `StableEquivalent.lean` :75–:202.
- **Build of a pinned module.** `TauCeti.LinearAlgebra.Matrix.GeneralLinearGroup.Stable` had no object file, so I built it with `lake build` for the probes. It built successfully (5093 jobs).

### Library declarations opened at the pins (Tau Ceti 72, Mathlib 20)

- **Tau Ceti 2fd255d, `GeneralLinearGroup/Elementary.lean`:**
  - `elementarySubgroup` :75 and `elementarySubgroup_le_iff` :91;
  - `commutator_elementarySubgroup_self` :101 and `elementarySubgroup_le_commutator` :117;
  - `fromBlocksGL` :128 and `coe_fromBlocksGL` :139;
  - `upperBlockGL_mem_elementarySubgroup` :212 and `lowerBlockGL_mem_elementarySubgroup` :224;
  - `map_elementarySubgroup_le_elementarySubgroup` :243;
  - `fromBlocksGL_inv_mem_elementarySubgroup` :255, `fromBlocksGL_commutatorElement_mem_elementarySubgroup` :268, `map_commutator_le_elementarySubgroup` :282 and `fromBlocksGL_conj_mem_elementarySubgroup` :290;
  - `Equiv.map_reindexGL_elementarySubgroup` :313.
- **`GeneralLinearGroup/Stable.lean`:**
  - `stabilizeGL` :79, `coe_stabilizeGL_apply` :87 and the `DirectedSystem` instance :148;
  - `StableGeneralLinearGroup` :155, `of` :162, `of_injective` :180, `exists_of` :187, `exists_of₂` :193 and `lift` :208;
  - `elementarySubgroup` :225, `mem_elementarySubgroup_iff` :238, `of_mem_elementarySubgroup_iff` :251, `elementarySubgroup_normal` :271 and `elementarySubgroup_eq_commutator` :293;
  - `AlgebraicK1` :314, `mk` :321, `mk_stabilizeGL` :326, `mk_eq_one_iff` :344, `mk_eq_mk_iff` :352, `quotientElementarySubgroupEquiv` :359 and `lift` :379.

  There is no ring-map functoriality of K₁ at the pin (R02).
- **`GeneralLinearGroup/Transvection.lean`:**
  - for any `[Ring A]`: `transvectionUnit` :146, `coe_transvectionUnit_eq_one_add_single` :157, `transvectionUnit_add` :168, `transvectionUnit_inv` :176, `transvectionHom` :182, `commute_transvectionUnit` :210 and `commutatorElement_transvectionUnit` :247;
  - for `[CommRing A]`: `toGL_transvection_eq_transvectionUnit` :309 and `map_transvectionUnit` :575;
  - `reindexGL_transvectionUnit` :637.
- **`SpecialLinearGroup/Transvection.lean`:** `closure_range_toSpecialLinearGroup_eq_top` :589, `_of_field` :600, `transvectionHom` :634, `map_transvection` :702, `commute_transvection` :759 and `commutatorElement_transvection` :780.
- **`ModuleCat` files:** `CartanMap/Morita.lean` `finiteProjectiveModulesK0Equiv` :212; `CartanMap/RingEquiv.lean` :106/:120/:134 (R06); `CartanMap/Basic.lean` `finiteProjectiveModulesExactStructure_eq_split` :241; `CartanMap/ExtendScalars.lean` :88, :94, :120, :129 and :160.
- **`GrothendieckGroup/FiniteDimensionalVectorSpace.lean` :153 `finrankEquiv`.** It states `SplitK0 (FGModuleCat k) ≃+ ℤ` for fields. This is a special case of `kZero_divisionRing` in a different category, so it is not a duplicate.
- **Balanced extension, by elaboration:** `BalancedExtension.adjunction`, `adjunction_unit_app_apply`, `adjunction_counit_app_tmul`, `adjunction_homEquiv_apply`, `extendScalarsIso`, `extendScalarsIso_hom_app_tmul` and `extendScalarsIso_inv_app_tmul`, and `RingHom.finiteProjectiveModulesExtendScalars_obj_obj` and `_map_hom`.
- **Mathlib 1b1ccf4, by elaboration:**
  - `ModuleCat.restrictScalarsComp'`, `Adjunction.unit_leftAdjointUniq_hom_app` and `CategoricalPullback.CatCommSqOver.toFunctorToCategoricalPullback`;
  - `RingHom.pullback_comm_sq`, `isUnit_pullback_mk_iff`, and both `surjective_pullback…_of_surjective`;
  - `RingEquiv.mopMatrix`, `ModuleCat.matrixEquivalence`, `Module.IsUnimodular` and `Ring.jacobson_quotient_of_le`;
  - `PartitionOfUnity.exists_isSubordinate_of_locallyFinite` (`[NormalSpace X]`), `CompHaus.hasColimits` and the `Unitization` maps;
  - `Matrix.GeneralLinearGroup.transvection` (`ElementaryRowOperations.lean` :97, `[CommRing R]`), `ModuleCat.restrictScalarsEquivalenceOfRingEquiv` (`ChangeOfRings.lean` :296) and `EuclideanSpace.proj`.
- **Negative searches at both pins:** no stable range, covering dimension, Steinberg group, Dieudonné determinant or hairy-ball theorem. The README's ownership of Layers 4–5, 4.3 and 2.3's determinant is correct.

### Cross-roadmap citations resolved

**Suppliers, on main (3090489):**
- ClassicalArithmeticCompletion §7.23 (:14930): `SplitK0.of P = SplitK0.of Q` iff `StableEquivalent`. Not at the pin (no `SplitK0` criterion in `StableEquivalent.lean`).
- DifferentialGeometry 5.1, the outward-first orientation (README :509, `Suggested.lean` :1735), and 11.1 (R05).
- CharacteristicClasses C2 item 2 (:822–825, vanishing with a nowhere-zero section) and C7 item 3 (:1851–1860: x^⊥ identification, Euler number 1+(−1)ⁿ, e=c₁).
- TopologicalKTheory Conventions (:150–168):
  - D₀ first, and L with transition z, so β=[L]−1;
  - the Koszul symbol conj z has class −β.

  These agree with 7.1's M(z) with b=z·a. T1 is at :170 and T4 at :1036/:1092.
- BanachAlgebras Layer 2, which it calls A2 (:15, :440; logarithms at :569).
- HilbertModules H2 (:179; finitely generated projective Hilbert structures and polar decomposition at :226–:237) and H5 (:418–:424, the compact-X section-module comparison).

**Consumers, at their heads:**
- GeneralAlgebraicKTheory #1212: §§3.14, 4.16, 4.17 and 8.7 consume 2.2, 3.2–3.3 and A6, with the orientation `u x̄=ȳ` (:1641).
- GeometryOfNumbersAndQuadraticArithmetic #851: §6.1.7 (`ringKTheoryModels`) and §6.10 (`plusConstructionComparison`), :244.
- OperatorKTheory #866: consumes A0, A1–A2, A6 and A8 (:275–:284).

`roadmaps overlaps` reports nothing. No open pull request changes this roadmap or drops an id it cites.

### Ownership against open pull requests (`roadmaps grep` over main and all 457 heads, by object)

- **Covering dimension.** On main, no roadmap defines it. Only HigherToposTheory #1901 does, as `TopologicalSpace.HasCoveringDimLE`, and that roadmap is not in the merge order. PRREVIEW-AlgebraicKTheory~7 settled that this roadmap (merge-order line 15) is the earlier owner. Scope :15 records the split, and repointing is that roadmap's review.
- **Milnor patching.** NeronModelsAndSemistableAbelianVarietiesPartII #870 §1.3 states a flat-module patching equivalence for commutative rings and its finite-projective restriction. That restriction is the commutative case of `milnor_patching`. This roadmap is earlier, so citing it is #870's repair. No other head declares `patchingFunctor`, `PatchingTriples` or `milnor_patching`.
- **Algebraic K₀ and K₁.**
  - NoncommutativeGeometry N2 on main (:213–:216) constructs both for its algebras.
  - Its open revision #1143 (:107–:111) cites Tau Ceti's `ExactK0` and `AlgebraicK1` for them.
  - Once R01 is repaired, this roadmap also cites Tau Ceti, so the object has one owner. The Scope's claim (:17) that N2 consumes Layers 0–3 holds at #1143, not on main; that is the revision's matter.

### Seeded sample: locators checked in the cache

| Target | Locator | Cache | Result |
|---|---|---|---|
| 0.1 | Tau Ceti `finiteProjectiveModules`, `exists_prod_linearEquiv_fin` | `CartanMap/Basic.lean`; `FreeComplement.lean` :49 | Correct, no literature locator needed |
| 0.3 | Weibel II §2, division-ring example before Lemma 2.1; K₀(ℤ) p. 5; §2.8 and Example 2.8.1 p. 13 | weibel-kbook-II lines 204–207 (p. 5), 226; 549–566 (pp. 12–13) | Correct |
| 0.5 | Weibel I Example 1.2.2 | weibel-kbook-I lines 100–110 (p. 3): polynomial version over the coordinate ring of S² | Correct as "the polynomial example" |
| 0.6 | direct construction, motivated by Weibel I.1.2.2 | the same lines | Correct as stated |
| 0.7 | Weibel I (4.9.1) | weibel-kbook-I lines 1476–1479 (p. 32): two real bundles of each rank on S¹, and complex bundles on S¹ trivial | Correct |
| 1.1 | Weibel III Commutators 1.3, (1.3.1), p. 4 | weibel-kbook-III lines 158–168 | Correct; the index conditions match |
| 1.2 | Weibel III §1, p. 1 | lines 18–28 | Correct |
| 1.3 | Weibel III Lemma 1.3.2, Whitehead 1.3.3, (1.3.4) | lines 171–195 (p. 4): ⁅g,h⁆ as a product of three diag(x,x⁻¹) | Correct |
| 2.1 | Weibel III Definition 1.1 and the next paragraph, p. 1 | lines 33–39 | Correct |
| 2.3 | Weibel III 1.2.4, Exercise 1.2 | lines 109–115 (p. 3), 497–502 (p. 10, semilocal determinant onto R×/W(R)) | Correct; source issue below |
| 4.3 | Engelking §3.1 p. 208, Theorem 3.1.4 p. 209, Theorem 3.1.8 p. 212, Theorem 3.2.10 p. 233 | engelking-1978 lines 7642, 7699, 7792, 8582 (PDF pages 212, 213, 216, 237; printed = PDF − 4) | Correct; 3.1.8 is the countable sum theorem, which covers finite closed covers |
| 4.5 | Vaserstein Theorems 5 and 7, p. 20; lemma-definition and d(X), p. 19 | vaserstein-1971 lines 114–124, 138–141 (p. 19), 157–166 (d′, p. 20), 167–170 (Theorem 5, real), 179–186 (Theorem 7, complex) | Correct; source issue below |
| 5.2 | Weibel III Definition 5.2 p. 35; Corollary 5.6.1 p. 39; Theorem 5.7.1 p. 40; Matsumoto 6.1 and Corollary 6.1.1, p. 48 | lines 1857–1861, 2044–2048, 2096–2098, 2454–2463 | Correct |
| 6.1 | Weibel I §2.6, pp. 11–12 | weibel-kbook-I lines 504–534 | Correct |
| 6.2 | Weibel I Theorem 2.7, p. 12; Stacks 0D2J; Stacks 0DVN | weibel-kbook-I lines 536–553; stacks-0D2J lines 389–397 (one surjective leg), 578–581 (Lemma 6.9, the equivalence); stacks-0DVN lines 106–116 (inverse M₁×_φM₂) | Correct |

Also checked:
- **Vaserstein** Theorem 1 and Theorem 2 (p. 18, lines 51–67) and Lemma 3 (Jacobson radical, line 62).
- **Weibel I:**
  - Ex. 1.5 (lines 144–157): (Sₙ) eliminates the first entry, and parts (a)–(d) are as cited.
  - Ex. 1.12(v) (line 257).
- **Weibel III:**
  - Remark 1.2.3 (p. 3);
  - Remark 1.2.5 (normality for n≥d+2 with sr=d+1, that is n≥s+1);
  - Exercise 1.3(a) (GLₙ=GL_{d+1}Eₙ for n>d+1);
  - Theorem 2.6 (p. 15).

### Adversarial table

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| `kZero_divisionRing` | 𝔽₂; ℍ | [D]↦1, [D²]↦2; [ℍ]↦1, and over a division ring every object is free of a dimension | True |
| `kZero_int` | ℤ; control ℤ[√−5] | [ℤⁿ]↦n; the control has K₀=ℤ⊕ℤ/2 (𝔭=(2,1+√−5), 𝔭⊕𝔭≅A², [𝔭]≠[A]) | True |
| `kZeroMap` (0.3) | id on ℤ; ℤ→ℚ; k→M₂(k); R→0 | [ℤ]↦[ℤ]; [ℤⁿ]↦[ℚⁿ]; [k]↦[M₂(k)]=2[e₁₁M₂(k)]; K₀(0)=0 | Correct map |
| `extendScalarsιIso` | f:ℤ→ℚ, P=ℤ², swap | identity of ℚ², naturality is the swap of ℚ²; the −1 twist is excluded because the components are `eqToIso` of `_obj_obj` | Determined |
| `extendScalarsCompIso` | h=rfl; ℤ→ℤ→𝔽₅ twist c=2 | the identity; 1⊗(1⊗p)↦2·(1⊗(1⊗p))≠1⊗(1⊗p) since 2≠1 in 𝔽₅, so the unit equation of `leftAdjointUniq` excludes it | Determined |
| `patchingFunctor` | ℤ→𝔽₅←ℤ at P=D | (ℤ,ℤ,1), not (ℤ,ℤ,2), whose patched module {(a,b) : 2a≡b mod 5} is not free | Correct orientation |
| `milnor_patching` | Q=0, A₁=A₂=ℤ; ℤ→𝔽₅←ℤ; π₂=id; control ℤ→ℚ←ℤ | Proj(ℤ×ℤ)≃Proj(ℤ)×Proj(ℤ), since α between zero modules is unique; M(2) is in the essential image; D≅A₁. Control: D=ℤ, and (ℤ,ℤ,2)≇(ℤ,ℤ,1) because v=2u has no solution in units u,v∈{±1} | True; the hypothesis is needed |
| `kZero_mayerVietoris_exact` | ℤ→𝔽₅←ℤ; ℤ→ℤ/6←ℤ; Q=0; cusp | im f₀={(n,n)}=ker(x−y); g₀=(x−y,x−y), kernel the diagonal; f₀ an isomorphism and g₀=0; im f₀ = the diagonal | True; f₀ not injective (ℤ/2), g₀ not onto |
| `kZero_arithmeticSquare` | x=[D], [M(2)]−[D] | e[D]=(1,0) with f₀[D]=(1,1)≠0; the torsion class has f₀=0 and first coordinate 0; ker f₀≅𝔽₅ˣ/{±1}=ℤ/2 | True |
| `kZero_cuspSquare` | x=[D], δ[1+t], 5δ[1+t] | f₀[D]=(1,1); f₀δ=0; 5δ=0; coker g₁=1+t𝔽₅≅ℤ/5 (Qˣ=𝔽₅ˣ×(1+t𝔽₅), image 𝔽₅ˣ) | True |
| `HasStableRangeLE` | s=0; ℤ with s=1; field with s=1 | (1) unimodular, the empty row needs 1=0; (2,5): 2·3+5·(−1)=1 but 2+5c∉{±1}; c=0 or c=1 makes a₀+a₁c a unit | Correct |
| `surjective_stability` | field, s=n=k=1 | g=diag(det g,1)·e with e=diag(det g,1)⁻¹g∈SL₂=E₂ | True |
| `injective_stability` | field, n=1, k=1; zero ring s=0 | diag(d,1)∈E₂ forces det=d=1, so g=1∈E₁; trivial | True; bound n≥s+1 as in Remark 1.2.5 |
| `hasStableRangeLE_one_of_isSemisimpleRing` | 𝔽₂[x]/(x²); zero ring; control ℤ | (x,1+x)↦x+(1+x)·1=1; Jac = whole ring, quotient 0 semisimple; ℤ/Jac(ℤ)=ℤ not semisimple, and (2,5) fails | True |
| `hasStableRangeLE_of_ringKrullDim_le` | ℤ with d=1; ℤ[x] with d=2; zero ring | ≤2 holds, ≤1 fails; ≤3; ⊥≤d | True |
| `HasCoveringDimensionLE` (4.3) | [0,1] with d=0, 1; ∅; finite discrete; Hilbert cube | {[0,2/3),(1/3,1]} has no order-1 open refinement (connectedness); d=1 holds; empty refinement; singletons; contains [0,1]^(d+1), value ⊤ | Correct |
| complex Vaserstein iff | pt, s=1; [0,1], s=1; S², s=1, 2; ∅; Hilbert cube | sr 1 vs 0≤1; ⌊1/2⌋+1=1 vs 1≤1; sr 2, so false/false at s=1 (2≤1 fails) and true/true at s=2 (2≤3); both true; both false | True; `1≤s` needed: at s=0, ℂ fails stable range 0 while `2·0−1=0` (truncated subtraction) gives the true dim pt ≤ 0 |
| real Vaserstein iff | [0,1], s=1, 2; S², s=2, 3 | sr 2: false vs 1≤0 false, true vs 1≤1; sr 3: false vs 2≤1, true vs 2≤2 | True |
| `dieudonne_determinant` | 𝔽₃, n=2; 𝔽₂, n=2; ℍ, n=1 (control) | order 48/24=2=#𝔽₃ˣ with kernel SL₂(𝔽₃)=E₂(𝔽₃); GL₂(𝔽₂)=E₂(𝔽₂) onto the trivial group; kernel = unit quaternions ≠ E₁=1 | True for n≥2 |
| `whitehead_commutator_elementary` (R04) | ℍ, n=1, g=i, h=j | [i,j]=(ij)²=k²=−1, diag(−1,1)∈E₂(ℍ); also the pinned `fromBlocksGL_commutatorElement_mem_elementarySubgroup` | True, pinned |
| `elementary_le_commutator` (R04) | 𝔽₂, card 3 and 2 | E₃(𝔽₂) simple of order 168; E₂(𝔽₂)≅S₃⊄A₃=[S₃,S₃] | True for card≥3, pinned |
| `elementary` = `TauCeti.elementarySubgroup` (R04) | the generators | `transvectionUnit hij a` has value 1+`single i j a` (`Transvection.lean` :157); the closures agree, as proved in the probe | Equal |
| `kOne_divisionRing` (R02) | 𝔽₂; ℍ | K₁(𝔽₂)=1 against GL₂(𝔽₂)ᵃᵇ=ℤ/2, so the stable carrier excludes the finite-rank model; mk(i)↦1 since i is a unit quaternion ∈[ℍˣ,ℍˣ], and mk(2)↦class of 2≠1 (norm 4) | True |
| `kOne_int` (R02) | mk(−1), mk(diag(−1,−1)) | det=−1 and det=1; the latter is consistent with diag(−1,−1)∈E₂(ℤ) | True |
| `kOneMap`, `kOne_mayerVietoris_exact` (R02) | f=id; ℤ→𝔽₅←ℤ; Q=0 | mk↦mk; g₁(x,y)=xy⁻¹ on {±1}², ker={(1,1),(−1,−1)}=image of mk(−1_D)=(−1,−1); K₁(A₁×A₂)=K₁(A₁)×K₁(A₂) | True (Weibel III Theorem 2.6) |
| 0.5, `tangentSections` (R03) | x=(0,0,1); splitting; control S¹ | membership ⇔ Σxᵢvᵢ=0 (proved by `simp`); p(x)=diag(1,1,0), rank 2; p(v+fx)=v, ⟨x,v+fx⟩=f; on S¹ free on (−x₁,x₀) | Statable, true |
| 0.5 route (R05) | DifferentialGeometry 11.1 with E=ℝ³, n=2; S¹, n=1 | finrank 3=n+1 with n even, so s₁ nowhere zero with ⟨s₁(x),x⟩=0 is impossible; n odd gives no conclusion, matching the S¹ Check | Supplier fits |
| 0.6 frame | north pole; (1,0,0); general | u=(1,i,0)/√2, v=(i,1,0)/√2, conj(u)·v=0, conj(v)·v=1; u=(0,i,0), v=(0,0,−i); conj(w)·w=2−(x₀²+x₁²)=1+x₂²>0, and the Hermitian norm of x×conj u is 1 by Lagrange's identity with x real | Correct |
| 0.7 Möbius | u(t+1); p; det B; χ | u(t+1)=−u(t), tr p=1, p²=p; det B(t+1)=−det B(t), which has a zero by IVT; χ(t+1)=e^{iπ}χ(t)=−χ(t), modulus 1; u_perp(t+1)=−u_perp(t) | Correct |
| 1.1 relations | ℤ: e₁₂(2), e₂₃(3); M₂(k) coefficients a=E₁₂, b=E₂₁ | commutator e₁₃(6), reversed e₁₃(−6); e₁₃(E₁₁)≠e₁₃(E₂₂); the pinned `commutatorElement_transvectionUnit` has the order c*d | Agree with the pin |
| 1.2 | diag(−1)∈GL₁(ℤ) against diag(−1,1); GL∞(0) | equal via `of_stabilizeGL`; trivial | Correct |
| 1.3 factorization | T=−1, n=1 | [[1,−1],[0,1]][[1,0],[1,1]]=[[0,−1],[1,1]], times [[1,−1],[0,1]] gives [[0,−1],[1,0]], whose square is −I | Correct |
| 2.1 | K₁(0); 𝔽₂ | 0; K₁(𝔽₂)=0 against GL₂(𝔽₂)ᵃᵇ=ℤ/2 | Correct |
| 5.2 | M₀(ℤ); relative sequence for (ℤ,5ℤ) | K₂(M₀(ℤ))=0≠ℤ/2; K₂(𝔽₅)=0 and K₁(ℤ,5ℤ)→K₁(ℤ) zero, so K₁(ℤ,5ℤ)=0 | Correct |
| 6.1 | ℤ×_𝔽₅ℤ; cusp; Q=0 | Dˣ={±(1,1)}; D≅𝔽₅[t²,t³] through p₁; D=A₁×A₂ | Correct |
| R06 | `#check` | `RingEquiv.finiteProjectiveModulesK0Equiv` is unknown; the replacement elaborates | Name wrong |
| Docstring "GL(R), K₁(R) missing" (R02) | the pin | `Stable.lean` :155, :314 exist | False |
| Docstring 0.5 reason (R03) | the scratch definition | a 3-line `LinearMap.ker` | False |

## Not verifiable

- **Milnor, *Introduction to Algebraic K-Theory*, and Bass, *Algebraic K-Theory*.** Both are settled as uncertified, so they are cited by locator only. The locators I checked rest on Weibel and Vaserstein, which I read.
- **Stacks chapter numbers.** The cached Deformation Problems PDF does not print its chapter number, so the "93" in "Stacks 93.4" is unchecked. Tag 0DVN, which I read, is unambiguous.

## Source issues

- **Misprint** in weibel-kbook-III at Division rings 1.2.4, printed p. 3: the source attaches the exception n=2, D=𝔽₂ to GLₙ(D)/Eₙ(D)≅Dˣ/[Dˣ,Dˣ]; it should attach it to Eₙ(D)=[GLₙ(D),GLₙ(D)], since for 𝔽₂ both sides of the quotient statement are trivial; affects nothing.
- **Error** in vaserstein-1971 at Theorems 5 and 7, printed p. 20: the source states the formulas for every topological space; they fail for X=∅, where d(∅)=∞ (p. 19) but the zero ring C(∅) has finite stable rank; it should require X nonempty; affects nothing (the roadmap reads them for nonempty X).
