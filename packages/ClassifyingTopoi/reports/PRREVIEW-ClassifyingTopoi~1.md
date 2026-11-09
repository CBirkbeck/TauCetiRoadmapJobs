# Review of ClassifyingTopoi (pull request #1997 at 6dadd76)

**Verdict:** needs changes

Ten findings: one P1, two P2, seven P3. The gate passes on every check, `Suggested.lean` elaborates with only the 15 `sorry` warnings, and no declaration closes with one tactic. The definitions of Layer 1 and the universal property of 2.1 hold up under the adversarial pass (table below). The defects are an unowned construction underneath 2.2 and 3.1, two headline signatures that are weaker than what can be stated at the pins, and locator, citation and shape repairs.

## R01 (P1) — The syntactic site behind 2.2 and 3.1 is unowned and uses a proof system that Scope excludes

**Location.** `TauCetiRoadmap/ClassifyingTopoi/README.md` lines 344–347 (2.2 Route): "classified by presheaves on its cartesian syntactic category (objects the cartesian formulas in context up to provable equivalence, morphisms the provably functional cartesian relations)". The *Needs:* lines of 2.2 (line 352: "2.1; GrothendieckTopoi 2.5") and 3.1 (line 460: "2.1") list neither this category nor its universal property.

**Claim.** Two inputs are used, and no layer, no supplier section and no pinned declaration provides them:
- the cartesian syntactic category of a Horn or cartesian theory, together with the theorem that its models in `Sheaf K (Type u)` are the filtering functors on it;
- the normal form that rewrites every geometric theory with axioms `ψ ⊢ ⋁ᵢ ∃ xᵢ, θᵢ` (Elephant D1.3.10).

The same inputs carry 3.1, and through 3.1 they carry 3.2 (line 480) and 4.1 (line 578, "Route: 3.1"). The category is a heavy construction (a site), so it must be a target with its own signature. As written it is defined through provability, yet lines 77–78 put "proof systems for geometric logic and the completeness theorems" out of scope.

**Witness.** GrothendieckTopoi (head 7d5de30) excludes "classifying topoi of geometric theories" (its README, lines 99–100). LocallyPresentableCategories 3.1–3.5 treats only Set-valued models of finite-limit theories. Mathlib's `CategoryTheory/RegularCategory/Basic.lean:31` lists interpreting regular logic as future work.

**Repair.** Add a target to Layer 2, before 2.2. It defines, without a proof system, the classifying category of the empty theory over `L`, and proves two statements about it:
- **The category.** Either Horn formulas in context (`GeometricFormula.IsHorn`), identified when their interpretations agree in every `CatStructure` in every `Sheaf K (Type u)`; or, equivalently, the opposite of finitely presented `L`-structures.
- **(a)** For every small site `(D, K)`, the `L`-structures in `Sheaf K (Type u)` correspond to the `IsFiltering` functors of GrothendieckTopoi 2.5 on this category.
- **(b)** The normal form: in every `Sheaf K (Type u)`, the interpretation of a geometric formula is a `u`-small join of images, along projections, of Horn formulas. Prove it semantically, from the frame property of `Subobject X` in GrothendieckTopoi 1.2.

Give it the Elephant locator of the cartesian-functor theorem and Caramello2009Lattices, proof of Theorem 17.6, p. 81. Add it to the *Needs:* lines of 2.2, 3.1, 3.2 and 4.1. Replace "provable equivalence" and "provably functional" by the semantic notions (or bring a proof system into Scope as its own target). After the repair, every input of the 2.2 route is a target here or GrothendieckTopoi 2.5, and the route no longer uses anything that Scope excludes.

## R02 (P2) — 4.1 and 4.3 are stated about "some" generic ring, although the pointwise ring can be stated at the pins

**Location.** `TauCetiRoadmap/ClassifyingTopoi/Suggested.lean` lines 467–472 and 502–509: `∃ U : CatStructure FirstOrder.Language.ring … , Nonempty ((sheafToPresheaf _ _).obj U.carrier ≅ unopUnop _ ⋙ FPRing.forget) ∧ IsClassifyingSite …`. README lines 575–577 and 622–624 say the same. The Route (line 580) promises "the forgetful functor with pointwise operations".

**Claim.** The existential pins only the carrier. It never says that `U`'s addition and multiplication are those of `A.Ring` at each `A`, so it is a weakened substitute for a headline that can be stated at the pins. The pull-request description's reason, that the comparison would be needed "as data", does not hold: the comparison is a real `noncomputable` body, exactly as `CatStructure.map` already uses `inv (piComparison …)`.

**Witness.** A scratch copy elaborates with no error at the pins. It defines the pointwise ring from Mathlib's `piObjIso` (`Limits/FunctorCategory/Shapes/Products.lean:33`), `Types.productIso` (`Limits/Types/Products.lean:193`) and `FirstOrder.Ring.compatibleRingOfRing` (`ModelTheory/Algebra/Ring/Basic.lean:223`), with naturality proved.

**Repair (tested).** Add the definitions below and state 4.1 as `IsClassifyingSite commRingTheory.{u} ⊥ genericRing.{u}`. State 4.3 as `IsClassifyingSite localRingTheory.{u} zariskiTopology (genericRing.{u}.map (sheafToPresheaf ⊥ (Type u) ⋙ presheafToSheaf zariskiTopology (Type u)))`. Change README 4.1 and 4.3 to match, and name `genericRing` there. The two helper facts are proof steps; they may be inlined into `naturality`.

```lean
noncomputable def ringOp (A : FPRing.{u}) {k : ℕ} (f : FirstOrder.Language.ring.Functions k)
    (x : Fin k → A.Ring) : A.Ring :=
  letI := FirstOrder.Ring.compatibleRingOfRing A.Ring
  FirstOrder.Language.Structure.funMap f x

theorem ringOp_map {A B : FPRing.{u}} (φ : A ⟶ B) {k : ℕ}
    (f : FirstOrder.Language.ring.Functions k) (x : Fin k → A.Ring) :
    (show A.Ring →+* B.Ring from φ) (ringOp A f x) =
      ringOp B f (fun i => (show A.Ring →+* B.Ring from φ) (x i)) := by
  cases f <;> simp [ringOp]

noncomputable abbrev forgetPresheaf : FPRing.{u}ᵒᵖᵒᵖ ⥤ Type u := unopUnop _ ⋙ FPRing.forget

theorem eval_productIso_piObjIso {k : ℕ} (C : FPRing.{u}ᵒᵖᵒᵖ)
    (y : (∏ᶜ fun _ : Fin k => forgetPresheaf.{u}).obj C) (i : Fin k) :
    (Types.productIso (fun _ : Fin k => forgetPresheaf.{u}.obj C)).hom
        ((piObjIso (fun _ : Fin k => forgetPresheaf.{u}) C).hom y) i =
      (Pi.π (fun _ : Fin k => forgetPresheaf.{u}) i).app C y := by
  rw [← piObjIso_hom_comp_π]; rfl

noncomputable def genericRingPresheaf :
    CatStructure FirstOrder.Language.ring (FPRing.{u}ᵒᵖᵒᵖ ⥤ Type u) where
  carrier := forgetPresheaf
  funMap {k} f :=
    { app := fun A => (piObjIso (fun _ : Fin k => forgetPresheaf.{u}) A).hom ≫
        (Types.productIso (fun _ : Fin k => forgetPresheaf.{u}.obj A)).hom ≫
        TypeCat.ofHom (fun x => ringOp A.unop.unop f x)
      naturality := by
        intro A B φ
        ext x
        change ringOp _ f (fun i => (Types.productIso (fun _ : Fin k => forgetPresheaf.{u}.obj B)).hom
            ((piObjIso (fun _ : Fin k => forgetPresheaf.{u}) B).hom
              ((∏ᶜ fun _ : Fin k => forgetPresheaf.{u}).map φ x)) i) =
          (show A.unop.unop.Ring →+* B.unop.unop.Ring from φ.unop.unop)
            (ringOp _ f (fun i => (Types.productIso (fun _ : Fin k => forgetPresheaf.{u}.obj A)).hom
              ((piObjIso (fun _ : Fin k => forgetPresheaf.{u}) A).hom x) i))
        simp only [eval_productIso_piObjIso]
        refine Eq.trans ?_ (ringOp_map φ.unop.unop f _).symm
        congr 1
        funext i
        exact NatTrans.naturality_apply (Pi.π (fun _ : Fin k => forgetPresheaf.{u}) i) φ x }
  relMap R := Empty.elim R

noncomputable def genericRing : CatStructure FirstOrder.Language.ring
    (Sheaf (⊥ : GrothendieckTopology FPRing.{u}ᵒᵖ) (Type u)) :=
  genericRingPresheaf.{u}.map (sheafBotEquivalence (Type u)).inverse
```

## R03 (P2) — 2.2 and 3.1 are stated for `L : Language.{u, u}`, which excludes the roadmap's own languages when `u ≥ 1`

**Location.** README lines 89–91: "the existence theorems 2.2 and 3.1 take `L : FirstOrder.Language.{u, u}`". `Suggested.lean` line 222 (`exists_isClassifyingSite {L : FirstOrder.Language.{u, u}}`) and line 289 (`isOfPresheafType_of_isHorn {L : FirstOrder.Language.{u, u}}`).

**Claim.** `FirstOrder.Language.ring`, `FirstOrder.Language.empty` and `intervalLanguage` are all `Language.{0, 0}`. So for `u ≥ 1`, 3.1 cannot be applied to `commRingTheory.{u}` (the Route of 4.1) or to `objectTheory.{u}` (3.2 *Needs:* 3.1), and 2.2 cannot be applied to `intervalTheory.{u}`. The sources cover every small language, so the signature is narrower than they support.

**Witness.** In the scratch copy, `isOfPresheafType_of_isHorn _ h : IsOfPresheafType commRingTheory.{1}` fails: "has type `IsOfPresheafType.{?u, ?u, ?u}` … expected `IsOfPresheafType.{0, 0, 1}`". `exists_isClassifyingSite` fails the same way for `intervalTheory.{1}`.

**Repair (tested).** State both theorems for languages in any universes, with sites in `Type (max u₁ u₂ u)`, and update Convention 1 to match:
```lean
theorem exists_isClassifyingSite {L : FirstOrder.Language.{u₁, u₂}}
    (T : GeometricTheory.{max u₁ u₂ u} L) :
    ∃ (C : Type (max u₁ u₂ u)) (_ : SmallCategory C) (J : GrothendieckTopology C)
      (U : CatStructure L (Sheaf J (Type (max u₁ u₂ u)))), IsClassifyingSite T J U := sorry
theorem isOfPresheafType_of_isHorn {L : FirstOrder.Language.{u₁, u₂}}
    (T : GeometricTheory.{max u₁ u₂ u} L) (hT : T.IsHorn) : IsOfPresheafType T := sorry
```
Both elaborate. `isOfPresheafType_of_isHorn.{0, 0, 1} _ h` now proves `IsOfPresheafType commRingTheory.{1}`, and `exists_isClassifyingSite.{0, 0, 1} _` gives a classifying site of `intervalTheory.{1}` in `Type 1`.

## R04 (P3) — Tau Ceti's infinitary formulas are not cited, and no bridge to them is planned

**Location.** README line 152: "**From Tau Ceti.** Nothing is consumed."; 1.1–1.2 (lines 184–215) define their own infinitary syntax and its `Realize`.

**Claim.** The pinned Tau Ceti already has `L_{∞ω}` syntax and set-theoretic semantics, and the README neither cites them nor says how `GeometricFormula` differs.

**Witness.** `FirstOrder.Language.BoundedFormulaInf` (`TauCeti/ModelTheory/Infinitary/Syntax.lean:75`) and `BoundedFormulaInf.Realize` (`Infinitary/Semantics.lean:76`). There `⊓` is `(φ.imp ψ.not).not` (`Syntax.lean:27`), `ex` is derived (line 149), and disjunctions branch over one fixed carrier `ι`.

**Repair.** In Scope, cite these two declarations. Say in one clause why a positive syntax is kept: Tau Ceti's `⊓` and `ex` go through implication and negation, which inverse images do not preserve, and its disjunctions share one carrier. Add a 1.2 target `GeometricFormula.toInf` with `realize_toInf` (the two `Realize` agree), with *Needs:* Tau Ceti `BoundedFormulaInf.Realize`.

## R05 (P3) — The API that the 2.3–2.5 routes use is not a target, and 2.5 promises a characterization nowhere stated

**Location.** README line 267 (`CatStructure.map`, no API list). Lines 372–373 (2.3 Route): "(ii) shows that `G ⋙ F` and `F ⋙ G` are isomorphic to the identities". Lines 420–422: "by 2.1 it says that the categories of models … are equivalent, naturally along inverse images".

**Claim.** To get from (ii) to `G ⋙ F ≅ 𝟭`, the 2.3 route needs `(U.map F).map G` to be `Isomorphic` to `U.map (F ⋙ G)`, and `U.map (𝟭 _)` to be `Isomorphic` to `U`. The 2.4 transport and the independence claim of 2.5 need `Isomorphic` to be an equivalence relation that preserves `IsModel`. None of these is stated. The 2.5 sentence is a theorem with no target, and the roadmap defines no category of models in which to state it.

**Witness.** The README has 16 `**Checks.**` blocks and no API list. The pull-request description itself appeals to "the transport is `U.map F`" for naturality in `(D, K)`.

**Repair.** Under 1.3 and 1.4, add API bullets in prose for:
- `Isomorphic` is reflexive, symmetric and transitive;
- `IsModel` is invariant under `Isomorphic`;
- `map` along the identity, and along a composite `F ⋙ G`, up to `Isomorphic`;
- `map` preserves `Isomorphic`.

Add them to the *Needs:* lines of 2.3–2.5. In 2.5, delete the "categories of models … naturally" clause, or turn it into a target once a category of models is defined. With these in place, the naturality question in the description has a precise answer: naturality in `(D, K)` follows from the composite bullet.

## R06 (P3) — The 4.1 route uses Mathlib facts about finitely presented rings without citing them

**Location.** README lines 578–582: "with the finitely presented rings as finitely presentable set-models; every finitely presented ring is isomorphic to an object of `FPRing`".

**Claim.** One direction of the first identification is at the pin, and so is essential smallness of finitely presented ring maps. Neither is cited.

**Witness.** `CommRingCat.isFinitelyPresentable_under` and `CommRingCat.isFinitelyPresentable_hom` (`Mathlib/Algebra/Category/Ring/FinitePresentation.lean:169, 175`), and `essentiallySmall_of_le` (`Mathlib/Algebra/Category/CommAlgCat/FiniteType.lean:118`). No converse ("finitely presentable ⇒ finitely presented") was found at the pin.

**Repair.** Cite the three declarations in the Mathlib contract and in the *Needs:* line of 4.1. State the converse, and the identification of the classifying category of `commRingTheory` with `FPRing.{u}ᵒᵖ`, as part of the new target of R01.

## R07 (P3) — The Borceux–Dejean step needs Theorem 1 (3), not (4)

**Location.** README line 505 ("Theorem 1 (4), p. 134, and Proposition 2, p. 135") and line 435 ("Theorem 1 (4) and Proposition 2").

**Claim.** The argument goes:
1. An equivalence of presheaf topoi preserves absolutely presentable presheaves (Proposition 2).
2. A category in which idempotents split is equivalent to its Cauchy completion. This is item (3).

Item (4) says that presheaves on `C` and on its Cauchy completion are equivalent, which this direction does not use.

**Witness.** BorceuxDejean1986 lines 99–106 (Theorem 1, p. 134): item (3) is the equivalence criterion and item (4) is the presheaf equivalence. Lines 134–135 (Proposition 2, p. 135) are as cited.

**Repair.** In both places, write "Theorem 1 (3), p. 134, and Proposition 2, p. 135". The `ZMod 4` / `ZMod 2 × ZMod 2` Check of 3.3 then follows from exactly the cited items.

## R08 (P3) — Chapter- and book-level locators for theorem-level claims

**Location.** "Mac Lane–Moerdijk, Chapter VIII" cited alone at lines 479, 502, 534, 577, 601–602 and 625; "Chapter X" at lines 189, 240, 275, 316 and 341; "Makkai–Reyes 1977" (whole book) at line 341; "Hakim 1972" (whole book) at line 625.

**Claim.** Each of these targets is a single theorem (object classifier, torsors, intervals, rings, Zariski sheaf, local rings, existence), and the citation names only a chapter or a whole book.

**Witness.** Springer's public abstract of Mac Lane–Moerdijk Chapter VIII places the ring classifier at Proposition 5.1, so section-level numbers exist.

**Repair.** Give the section and theorem (or proposition) number for each claim, recorded as `uncertified` where the text is paywalled. For example, 4.1 becomes "Mac Lane–Moerdijk, VIII, Proposition 5.1".

## R09 (P3) — The size Check of 2.2 is false for small types in `Type (u + 1)`

**Location.** README lines 363–366: "over a language with a type in `Type (u + 1)` of `0`-ary relation symbols and no axiom, the symbols give pairwise distinct subobjects … while `Sheaf J (Type u)` … has a `u`-small set of them".

**Claim.** The argument needs more symbols than any `u`-small set can hold. A small type living in `Type (u + 1)` does not supply that.

**Witness.** Take `ULift.{u+1} Bool` as the symbols. There are two of them, and the theory is classified at universe `u` (presheaves on the arrow category, squared), so the Check's conclusion fails.

**Repair.** Write "a type of symbols not equivalent to any type in `Type u`, for instance `Type u` itself". With `Type u` as symbols, the distinct subterminals inject `Type u` into a `u`-small set, which is impossible.

## R10 (P3) — "B G" is right `G`-sets here and left `G`-sets in GrothendieckTopoi, with no bridge

**Location.** README lines 113–120 (Conventions 4 and 5) and 499–501 (3.3): the topos of right `G`-sets, `AsSmall.{u} (SingleObj G)` with `⊥`. Convention 4 cites "the 2-cells from the canonical point of B G" of GrothendieckTopoi 2.2.

**Claim.** GrothendieckTopoi's `B G` is `Action (Type u) G`, that is left `G`-sets, presheaves on `(SingleObj G)ᵒᵖ`. Its canonical point and 2-cells are stated on that model, so Convention 4's witness compares two different categories.

**Witness.** GrothendieckTopoi README (head 7d5de30), line 367: "the classifying topos `B G` is `Action (Type u) G` … presheaves on the opposite of `SingleObj G`".

**Repair.** Add one clause to Convention 5: presheaves on `SingleObj G` are equivalent to GrothendieckTopoi's `Action (Type u) G` through `g ↦ g⁻¹`, and that equivalence carries the forgetful functor to the canonical point. Convention 4's count, `G` in both places, is then a comparison across that equivalence.

## Verified sound

**Gate and build.**
- The worker's gate and a hand-run gate both pass: every check is 0.
- The dependency check against the candidate order reports "239 roadmaps, 2352 edges, 0 problem(s)", with no UPWARD, CYCLE or `moved:` line. GrothendieckTopoi (#1520) and LocallyPresentableCategories (#1926) are new-roadmap pull requests that are not yet in the order, so they create no edge there. This roadmap merges after them, as its description states.
- `lake env lean` on `Suggested.lean` gives 15 warnings, all "declaration uses `sorry`", and no errors.
- The branch pins equal main's: Mathlib `1b1ccf4`, Tau Ceti `2fd255d`.
- The module form (`module`, `public import Mathlib`) matches 18 roadmaps on main.

**Signature pass.**
- I compared the elaborated types of all 59 declarations with the README. Nothing changed.
- The seven "dropped binder" leads are false positives: `[Category.{v} E]` appears in each type as `Category.{u_3, u_4} E`.

**Padding probe.**
- Each of the 15 `sorry`s was replaced by `first | rfl | simp | infer_instance | trivial | decide`; none closed.
- Every definition is used by a headline.

**Headline theorems** (README Summary). All are stated:
- 1.2 `realize_hom`; 1.3 `isModel_ofStructure_iff`; 1.4 `IsModel.map`;
- 2.2 `exists_isClassifyingSite`; 2.3 `exists_equivalence`; 2.4 `exists_quotient_topology` and `exists_quotient_theory`;
- 3.1 `isOfPresheafType_of_isHorn`; 3.2 `isClassifyingSite_genericObject`; 3.3 `isClassifyingSite_genericTorsor` and `moritaEquivalent_torsorTheory_iff`; 3.4 `isClassifyingSite_genericInterval`;
- 4.1, 4.2 `isSheaf_forget_zariskiTopology`, 4.3.

Only 4.1 and 4.3 are stated in a weakened form (R02). 2.2 and 3.1 are too narrow in universe (R03).

**Sources read.**
- Caramello2009Lattices, arXiv v1, read from the arXiv PDF. Its text layer is glyph-coded and was decoded locally.
  - §2.1, Proposition 2.1, p. 5 (the two-dimensional Yoneda lemma): supports the 2.3 route.
  - Definition 3.5, p. 14: Morita equivalence as equivalent classifying topoi. This matches `MoritaEquivalent`.
  - Theorem 3.6, p. 15 (quotients ↔ subtopoi), with its proof on pp. 16–18 (new axioms ↔ epimorphic families; the topology is generated over `J_T`): supports 2.4 as written.
  - Remark 3.7, p. 19: the classifying topos of a quotient on the cartesian syntactic site, from axioms `ψ ⊢ ⋁ ∃ θᵢ` with `ψ` and `θᵢ` cartesian. This matches the 2.2 Route.
  - Theorem 17.6, p. 81: cartesian `T`, with the proof invoking Elephant D1.3.10 for the normal form. This matches the citation in 2.2 and 3.1.
  - The pull request's "numbering of arXiv:0905.0299v1" qualifier is accurate.
- BorceuxDejean1986 (Numdam): Theorem 1 on p. 134 and Proposition 2 on p. 135, page numbers correct; the item number is R07.

**Adversarial table** (values computed by hand; the rows marked Lean were checked in a scratch copy).

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| Conv. 2 / 1.1 `ex` binds the last variable | ℤ, `ex (var 0 = var 1 * var 1)` at `x₀ = 4` and `2` | 4 = 2·2: true. a·a = 2 with \|a\| ≤ 1 gives 0 or 1: false (Lean). Binding the first variable is true everywhere | sound |
| 1.1 `bot` | ℤ, context 0 | `∃ i : PEmpty` is false (Lean). In `Type`, the image of `∅ → X` is ∅ | sound |
| 1.2 `realize_hom` | ℤ ⊂ ℚ, `ex (var 0 * var 1 = 1)` at 2 | ℤ: 2y = 1 has no solution, so false. ℚ: y = 1/2, so true. The negation would flip from true to false | sound |
| 1.2 `IsSetModel` | `{⟨0, ⊤, ex ⊤⟩}` on `PEmpty` and `PUnit` | false, true (Lean) | sound |
| 1.3 `interp` (`equal`, `iSup`) | `Bool`, diagonal; `{0} ∨ {0}` on ℤ | 2 of 4 pairs; the image has 1 element while the coproduct has 2 | sound |
| 1.3 `IsHom` and `Isomorphic` | `n ↦ 2n` on ℤ; identity of `Bool`, `P = ∅` to `P = {true}` | `funMap` at 1: 2 ≠ 1. ∅ ⊆ {true} but {true} ⊄ ∅, so a homomorphism one way only | sound |
| 1.4 `IsModel.map` | `X ↦ X × X`, `X ↦ Bool × X` | constants `(f,f)`, `(t,t)`, and `(f,t)` is neither; \|(1 ⊔ 1)²\| = 4 against 2; `Bool × 1` has 2 elements, so not left exact | sound |
| 2.1 `IsClassifyingSite` | `{⊤ ⊢ ⊥}`; `Discrete Bool` with `U` terminal | A left exact left adjoint from the one-object topos forces 0 ≅ 1, so (ii) is vacuous. With the two evaluations, a component `PUnit ⟶ PEmpty` would be needed and there is none, while `𝟙 PUnit` is a homomorphism: (ii) fails as claimed | sound; naturality in `(D, K)` needs R05 |
| 2.2 existence | ring and interval languages at `u = 1`; `ULift.{u+1} Bool` symbols | the theorem does not apply (Lean); 2 symbols are classified at universe `u` | R03, R09; route R01 |
| 2.3 uniqueness | `G = ℤ/2` | Aut of the generic torsor = centre = {0, 1}: two isomorphisms `U.map 𝟭 ≅ U` | sound |
| 2.4 duality | `T ∪ {⊤ ⊢ ⊥}`; subsingletons ⊂ objects | the empty sieve covers, so `J' = ⊤`. Models are subterminals, with points `PEmpty` and `PUnit` (Sierpiński) | sound |
| 2.5 `MoritaEquivalent` | `FinSet` against `FinInj` | `Fin 2 → Fin 1` is not mono; an idempotent injection e with e∘e = e is the identity; both categories are Cauchy complete, so the topoi are not equivalent | sound (R07) |
| 3.1 Horn | `commRingTheory`; `ℤ/2 × ℤ/2` at `x = (1, 0)` | all 8 axioms are `⊤ ⊢ equal`. `x` and `1 − x = (0, 1)` are non-units, so not local | sound (R03) |
| 3.2 `genericObject` | value at `3`; variance | `Fin 3`. `Psh(FinSet) ≃ [FinBool, Set]` classifies Boolean algebras | sound |
| 3.3 torsors | `ℤ/2` acting trivially on a point; `𝔖₃`, a = (12), b = (23) | inhabited and transitive, but `1·* = 0·*` is not free. `ab ≠ ba`, so precomposition is not natural | sound |
| 3.3 Morita iff | `ZMod 4` against `(ZMod 2)²`; idempotents | element orders {1, 2, 4, 4} against {1, 2, 2, 2}. e² = e in a group gives e = 1 | sound |
| 3.4 interval | `(σ0, σ1)` at level `⦋0⦌`; level `n` | pairs (0,0), (0,1), (1,1), and (1,0) is absent. For a ≤ b put h = a + b: σ0∘h = a and σ1∘h = b, so the image is pointwise ≤. \|Hom(⦋n⦌, ⦋1⦌)\| = n + 2 ≥ 2, so `0 ≠ 1` | sound |
| 4.1 `FPRing` | `⟨0,⊥⟩`, `⟨0,⊤⟩`, `⟨1,⊥⟩`; `E₁₂`, `E₂₁` | ℤ is initial, 0 is terminal, ℤ[X] represents the forgetful functor. E₁₂E₂₁ = E₁₁ ≠ E₂₂ | sound (R02) |
| 4.2 Zariski | zero ring; ℤ with {2, 3}; `{ℤ → ℤ[1/2]}` | `span ∅ = ⊥ = ⊤`, so the empty sieve covers. 3 − 2 = 1, and the equalizer into ℤ[1/6] is ℤ. Matching families = ℤ[1/2] but amalgamations = ℤ, so not a cover | sound |
| 4.3 local rings | ℤ at 3; ℤ/6 at 3; ℤ/4; the zero ring | 3 and −2 are non-units. In ℤ/6, 3 and 4 are non-units. ℤ/4 is local. The zero ring satisfies 0·0 = 1, and only `0 = 1 ⊢ ⊥` excludes it | sound |
| Conv. 4 against GrothendieckTopoi Conv. 4 | 2-cell `g ⟶ f` ↔ `f* ⟶ g*` | matches GrothendieckTopoi README line 127 | sound (R10) |

**Library declarations opened at the pins.** Mathlib:
- `Language.ring` (`ModelTheory/Algebra/Ring/Basic.lean:59`), `compatibleRingOfRing` (:223);
- `Language.empty` (`ModelTheory/Basic.lean:76`);
- `Hom.map_fun`, `Hom.map_rel`, `Functions.apply₁`, `Subobject.exists`, `imageSubobject`, `equalizerSubobject`, `piComparison`, `IsTerminal.isTerminalObj`, `sheafBotEquivalence`, `FintypeCat.Skeleton.incl`, `AsSmall.equiv`, `SimplexCategory.δ`, `SimplexCategory.σ`, `SimplexCategory.isTerminalZero`, `unopUnop`, `Presheaf.IsSheaf` (each checked with `#check`);
- `Sheaf.instHasColimitsOfShape` (`Sites/Limits.lean:214`); the `HasImages` instance (`Sites/Subsheaf.lean:275`);
- `SingleObj.comp_as_mul` (`SingleObj.lean:76`); `TypeCat.ofHom` (`Types/Basic.lean:129`);
- `piObjIso` (`Limits/FunctorCategory/Shapes/Products.lean:33`); `Types.productIso` (`Limits/Types/Products.lean:193`);
- `Scheme.zariskiTopology` and `subcanonical_zariskiTopology` (`AlgebraicGeometry/Sites/BigZariski.lean:51, 57`). This is the big site on schemes, so it is not a duplicate of the small site on `FPRingᵒᵖ`.

Tau Ceti: `BoundedFormulaInf` (`ModelTheory/Infinitary/Syntax.lean:75`) and `Realize` (`Semantics.lean:76`). Tau Ceti has no homomorphism-preservation theorem, so 1.2 is not a duplicate.

**Cross-roadmap citations resolved** (all present):
- GrothendieckTopoi at #1520 head 7d5de30:
  - sections 1.1, 1.2, 2.1, 2.2 (with its Sierpiński and `B G` Checks), 2.4, 2.5, 4.1, 4.2 and 6.1; Conventions 1 and 4; Out of scope (lines 99–100);
  - `IsGrothendieckTopos` (`Suggested.lean:102`), `GeometricMorphism` (172), `GeometricMorphism.homEquivInverse` (227), `IsFiltering` (292), `nonempty_geometricMorphism_equiv_isFiltering` (313), `nonempty_point_equivalence` (443).
- LocallyPresentableCategories at #1926 head 92720fe: 1.5, 3.1 and 3.5, and its Scope (lines 86–89).
- On main: AdicSpacesPartIV README line 1670, ClassifyingSpaces, DGAInfinity, HilbertModules and GrothendieckEulerForms.
- Reverse supply: no roadmap on main or at any open head cites ClassifyingTopoi.

**Ownership.** `roadmaps grep` over main and the 466 open heads finds no second owner for "classifying topos", "geometric formula", "syntactic site", "presheaf type", "Horn theory", "object classifier", "Zariski topos" or "local ring object". `overlaps.md` reports no dropped ids and no competing changes.

## Not verifiable

- Mac Lane–Moerdijk, *Sheaves in Geometry and Logic*, Chapters VIII and X: paywalled (Springer). Only the public chapter abstract was read; it confirms the ring classifier at VIII, Proposition 5.1. The other section numbers and the interval statement were not checked, and the open "scanned copy" that searches return was not used.
- Johnstone, *Elephant*, D1.1, D1.2, D1.3.10 and D3.1: paywalled (OUP). D1.3.10 is confirmed only as Caramello cites it (p. 81).
- Makkai–Reyes (LNM 611), Hakim (1972), Moerdijk (LNM 1616) and Joyal–Tierney (Mem. AMS 309): paywalled. The last two are cited only in Scope and Research context.
- Caramello, OUP 2017 book numbering: paywalled. Locators were checked against arXiv v1, as the README specifies.

## Source issues

- **Misprint** in Caramello2009Lattices (arXiv v1) at the proof of Theorem 17.6, p. 81 (cache line 7954): the source writes the classifying topos of a cartesian theory as the covariant functor category on its cartesian syntactic category; it should be presheaves on that category, `[C^cart_T op, Set]`, equivalently `[f.p. T-mod(Set), Set]`; affects nothing.
