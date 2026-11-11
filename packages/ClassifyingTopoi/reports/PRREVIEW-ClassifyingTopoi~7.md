# Review of ClassifyingTopoi (pull request #1997 at ad60900)

**Verdict:** needs changes

## R01 (P1) — `Suggested.lean` does not build: `canonicalTopology` is `Sheaf.canonicalTopology`

**Location** `TauCetiRoadmap/ClassifyingTopoi/Suggested.lean` line 482: "S ∈ canonicalTopology (Sheaf J (Type u)) (Subobject.underlying.obj (U.interp φ)) → S = ⊤"; also docstring line 38 and README lines 191 and 785 ("Mathlib `canonicalTopology`").

**Claim** At the pins, Mathlib declares the canonical topology as `CategoryTheory.Sheaf.canonicalTopology`, and the file opens only `CategoryTheory`. So `GeometricFormula.IsIrreducible` fails to elaborate, and the gate's build check fails.

**Witness** `lake env lean` at the head: `482:8: error(lean.unknownIdentifier): Unknown identifier canonicalTopology`, exit 1. The declaration is in Mathlib `CategoryTheory/Sites/Canonical.lean:103`, inside `namespace Sheaf` (line 49). The worker's gate reports `build=2 FAIL`.

**Repair** Change line 482 to `    S ∈ Sheaf.canonicalTopology (Sheaf J (Type u)) (Subobject.underlying.obj (U.interp φ)) → S = ⊤` (98 characters). With that change, a probe copy elaborates with exit 0 and 25 `sorry` warnings. Write `Sheaf.canonicalTopology` in docstring line 38 and README lines 191 and 785.

## R02 (P1) — the route of 3.5 (a) uses the geometric syntactic site, which nothing owns and the Scope excludes

**Location** README lines 748–756: "Route: by 2.4 replace `E` by the topos of the geometric syntactic site `(𝒞, J_T)` of `T` (Elephant, D3.1; an essentially small version of it if needed) … `J_T` is subcanonical. By GrothendieckTopoi 6.6 (d) …"

**Claim** No layer builds the geometric syntactic category, its subcanonical topology, or `[[φ]] ≅ y {x . φ}`. Line 108 puts proof systems out of scope, and Elephant is a citation, not a supplier. The site of 2.3 is not subcanonical, so GrothendieckTopoi 6.6 (d) does not apply to it. The route of (c) ("contains every representable by the covering of (a) and (b)") rests on the same fact.

**Witness** Take `{⊤ ⊢ x₀ = x₁}` over the empty language. The `J` of 2.3 makes `(2, x₀ = x₁) ⟶ (2, ⊤)` covering. Its single matching family for `y(2, ⊤)` has four amalgamations, so `J` is not subcanonical.

**Repair** In 2.4, before its *Needs:* line, add: "Prove also that, for a classifying site `(C, J, U)` of `T`, the objects underlying the `U.interp φ` form a separating family of `Sheaf J (Type u)`, and every subobject of `U.pow n` is `U.interp ψ` for some `ψ : GeometricFormula.{u} L n` (Caramello 2012a, proof of Lemma 3.2, p. 182, for the geometric syntactic site). Route: on the site of 2.3 the sheafified representables are the `U.interp χ` with `χ` Horn. The image of a map from one of them into `U.pow n` is given on a cover by tuples of terms, hence it is the interpretation of a disjunction of `exs` of Horn formulas (2.2 (b)). The equivalence above transports both facts." Add 2.2 (b) and 2.3 to the *Needs:* of 2.4.

Replace the Route of 3.5 (a) by: "Route: if every `[[φ]]` is covered by irreducible objects, these separate `E` (2.4), and `E` is a presheaf topos by GrothendieckTopoi 6.5 (Roos) and 6.6 (b). Conversely, in a presheaf topos the irreducible objects separate (GrothendieckTopoi 6.5, 6.6 (b)). Each of them is a retract of some `[[χ]]`, hence a subobject of a power of `U`, hence some `[[ψ]]` (2.4)."

In the route of (c), replace "by the covering of (a) and (b)" with "by 2.4, each irreducible object being a retract of some `[[χ]]`".

## R03 (P1) — "`[FPModel T, Set]` classifies `T`" is an input of 3.5 (b)–(d) and 3.6 that no target owns

**Location** README lines 760–761: "Route: the classifying topos is `[FPModel T, Set]` (3.1; Caramello 2017, « Lattices of theories », Remark 14.2), under which `[[φ]]` is the functor `N ↦ [[φ]]_N`"; also lines 770 and 818 ("By 3.1 and 3.5 (d)").

**Claim** 3.1 only defines presheaf type and proves the Horn case. No target proves that the classifying topos of a presheaf-type theory is `[FPModel T, Set]` with `[[φ]]` going to `N ↦ [[φ]]_N`. No target proves that a presented model is finitely presentable, a fact (b) uses and the last Check of 3.5 attributes to (b). 3.6 gets the identification from (d), whose route uses (b), and the route of (b) assumes it, so the routes are circular.

**Witness** Caramello2017Lattices line 2321 (Remark 14.2) derives the identification from Diaconescu's theorem and `Ind`. Line 2430 shows that `N ↦ [[φ]]_N` preserves filtered colimits. The README contracts LocallyPresentableCategories 1.5 "for the Examples of Layer 3" only (line 222).

**Repair** In 3.5, before (b), add: "(a′) For `T` of presheaf type, `FPModel T` is essentially small. A small category equivalent to `(FPModel T)ᵒᵖ`, with the trivial topology and the generic model whose carrier is `N ↦ N.carrier`, classifies `T`, and the interpretation of `φ` is `N ↦ [[φ]]_N`. A set-model presented by a formula is finitely presentable (Caramello 2017, « Lattices of theories », Remark 14.2, p. 65, and §14.2, p. 68, in the numbering of arXiv:0905.0299v1). Route: for a classifying site `(C, ⊥, U)`, GrothendieckTopoi 2.5 makes the set-models the flat functors on `C`, that is `Ind` of `Cᵒᵖ` (LocallyPresentableCategories 1.5). The finitely presentable objects of `Ind` are the retracts of representables, since the identity factors through a stage. Presheaves on a category and on its Cauchy completion agree (Borceux–Dejean 1986, Theorem 1 (4), p. 134). `N ↦ [[φ]]_N` preserves filtered colimits."

Then:
- In (b), (c) and the 3.6 introduction, cite "(a′)" in place of "3.1" and "3.1 and 3.5 (d)".
- In the last Check of 3.5, replace "by (b) no formula presents it" with "by (a′) no formula presents it".
- Add LocallyPresentableCategories 1.5 to the *Needs:* of 3.5, to the Dependencies of Layer 3 and to its supplier contract (line 222), with the use "for 3.5 and the Examples of Layer 3".

## R04 (P2) — 3.6 (a) in Lean drops the classification of `T'` by `Sh((FPModel T)ᵒᵖ, J)`, which is statable

**Location** `Suggested.lean` lines 579–583 and docstring lines 34–37: "Not stated: README 3.6, the `J`-homogeneity of a model in an arbitrary sheaf topos and the classification by `Sh((FPModel T)ᵒᵖ, J)`, lacking the object of homomorphisms"

**Claim** The classification needs no object of homomorphisms; it can be stated through a small site equivalent to `(FPModel T)ᵒᵖ`. Without it the conclusion does not tie `T'` to `J`: README 3.6 (a) states that `Sh((FPModel T)ᵒᵖ, J)` classifies `T'`, and the Lean statement keeps only the set-models.

**Witness** Caramello2012Yoneda line 335 (Theorem 4.6) states the classification. For `J` of the pointless Fourman–Grayson quotient (surjections `ℕ ↠ ℝ`) of a propositional Horn theory, no set-model is homogeneous: `T ∪ {⟨0, .top, .bot⟩}` passes, though `Sh(J)` is nondegenerate.

**Repair** Replace the statement by:

```lean
theorem exists_quotient_isSetModel_iff_isHomogeneous {T : GeometricTheory.{u} L}
    (hT : IsOfPresheafType T) (J : GrothendieckTopology (FPModel T)ᵒᵖ) :
    ∃ T' : GeometricTheory.{u} L, T ⊆ T' ∧
      (∀ M : SetModel T, T'.IsSetModel M.carrier ↔ M.IsHomogeneous J) ∧
      ∃ (C : Type u) (_ : SmallCategory C) (e : C ≌ (FPModel T)ᵒᵖ)
        (U : CatStructure L (Sheaf (e.functor.inducedTopology J) (Type u))),
        IsClassifyingSite T' (e.functor.inducedTopology J) U :=
  sorry
```

This elaborates with exit 0, together with R01's change. In the docstring, replace "and the classification by `Sh((FPModel T)ᵒᵖ, J)`" with nothing. Replace "the case of sets, in its elementary form, is stated" with "the case of sets, and the classification of the quotient by a small site equivalent to `(FPModel T)ᵒᵖ`, are stated".

## R05 (P3) — GrothendieckTopoi 1.2 is cited for images it does not state

**Location** README line 212: "1.2 (images, epimorphisms and coproducts in `Sheaf J (Type u)`, and the frame property of its subobject lattices)"; line 372: "GrothendieckTopoi 1.2 (images, epimorphisms and coproducts in `Sheaf J (Type u)`)".

**Claim** At its head, GrothendieckTopoi 1.2 states limits, colimits, balancedness, regular epimorphisms and frame subobject lattices, but not images. Images come from Mathlib, which the README's Mathlib contract already lists.

**Witness** GrothendieckTopoi README §1.2 at its open head (119dbd3) contains no statement about images. Mathlib `CategoryTheory/Sites/Subsheaf.lean:275`: `instance : Limits.HasImages (Sheaf J (Type max v u))`.

**Repair** In lines 212 and 372, replace "images, epimorphisms and coproducts" with "epimorphisms and coproducts". Add `HasImages (Sheaf J (Type u))` to the Mathlib names in the *Needs:* of 1.4 (line 373). In the description, replace "1.2 (images and the frame property of subobject lattices)" with "1.2 (epimorphisms, coproducts and the frame property of subobject lattices)".

## R06 (P3) — doubled list markers break the (a)–(d) lists of 3.5 and 3.6

**Location** README line 757: "- - (b) `GeometricFormula.isIrreducible_iff_exists_presentedBy`"; line 830: "- - (a) `exists_quotient_isSetModel_iff_isHomogeneous`".

**Claim** Each line renders as an empty bullet with a nested bullet inside it, so (b) of 3.5 and (a) of 3.6 are out of line with their siblings.

**Witness** In CommonMark, `- - x` is a list item whose only content is a nested list containing `x`.

**Repair** Delete the first "- " on lines 757 and 830.

## R07 (P3) — the description's gate and headline sentences do not match the head

**Location** Description, "Acceptance test": "The worker's gate gives 0 on every check." and "Every headline of the README that is statable at the pins is stated. The one that is not is README 2.2 (a)".

**Claim** At ad60900, the gate fails (`build=2`) and the file does not elaborate (R01). The docstring names a second part that is not stated (3.6), and R04 shows that part of it is statable. The paragraph saying 3.5 and 3.6 "have not been elaborated locally" is superseded.

**Witness** `gate.md`: `build=2 FAIL`, `Suggested.lean:482:8: Unknown identifier canonicalTopology`; docstring lines 31–37 list two parts that are not stated.

**Repair** After R01–R04, replace both sentences with: "The worker's gate gives 0 on every check, the build included. At the pins (Mathlib `1b1ccf4`, Tau Ceti `2fd255d`), `lake env lean` gives 25 `sorry` warnings and no error, and no theorem closes by one tactic. Every headline that is statable at the pins is stated. Two parts are not: README 2.2 (a), which lacks GrothendieckTopoi's `IsFiltering`, and, in 3.6 (a), homogeneity in an arbitrary topos, which lacks the object of homomorphisms (Caramello 2012b, Definition 4.4)." Delete the paragraph beginning "The 7 theorems and 7 definitions of 3.5 and 3.6". Name LocallyPresentableCategories 1.5 as used by 3.5 (R03).

## Previous findings

- R01 of a2de104 (4.2's sheaf input): repaired. README lines 76–82 now read "**Supplied by Tau Ceti and Mathlib.** The global sections functor `Scheme.Γ` is a sheaf for every subcanonical topology on schemes …". 4.2 (lines 954, 962–963) and the contracts (lines 193–195, 205–207) name `isSheaf_Γ`, `Scheme.zariskiTopology`, `subcanonical_zariskiTopology` and `ΓSpecIso`. SchemeAndStackFoundations is mentioned 0 times in the README, the Lean file and the description.
- R02 of a2de104 (the dependency-check sentence): repaired. The description now reads "The merge order lists ClassifyingTopoi, and the dependency check reports no problem: nothing is UPWARD or a CYCLE." The sentence before it fails now (R07).

## Verified sound

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 `GeometricFormula.bot`, torsion disjunction | `bot`; `⋁_{k : ULift ℕ} (k+1)·x₀ = 0` in `ℤ/6`, `ℤ` | `∃ i : PEmpty` false; `ℤ/6` at `1`: `6·1 = 0` (`k = 5`); `ℤ`: only at `0` | holds | — |
| 1.2 `realize_hom` | `ℤ ↪ ℚ`, `ex (x₀·x₁ = 1)` at `2`; empty `M`, `ex top` | false in `ℤ`, true in `ℚ` (`1/2`), positive direction only; empty `M`: hypothesis false | holds | — |
| 1.2 `realize_toInf` | `bot`; torsion at `⟨ULift ℕ, 5⟩`, `⟨Bool, b⟩` | `bot`: all branches `⊥`, false; `ℤ/6` at `1` realized by `k = 5`; `⟨Bool, b⟩` branch is `⊥` | holds | — |
| 1.3 `isModel_ofStructure_iff` | `PEmpty`, `T = {⟨0, top, ex top⟩}`; `PUnit` | `PEmpty`: `⊤ ≤ image(∅ ⟶ PUnit) = ⊥` false and `IsSetModel` false; `PUnit`: both true | holds | — |
| 1.4 `IsModel.map` | `X ↦ X × X` on `Bool`, `{⊤ ⊢ x = c₀ ∨ x = c₁}`; `X ↦ Bool × X` | `(false, true)` is neither constant, excluded by `IsLeftAdjoint`; `Bool × PUnit` not terminal, excluded by left exactness | holds | — |
| 2.1 `IsClassifyingSite` | `{⊢ ∃x ⊤, ⊤ ⊢ x = y}`, `Discrete Bool`, `⊥`, `U` terminal | (i) holds; `F ⟶ G` needs `PUnit ⟶ PEmpty`: none; `𝟙 PUnit` a homomorphism: (ii) fails | correctly not classifying | — |
| 2.2 classifying category | `commRingTheory`, `(x₀)` vs `(x₀·x₀)` | identified from `(1, x₀² = x₀)`; from `(1, ⊤)` at `2`: `2 ≠ 4`; hom-sets `ℤ[x]/(x²−x)`, `ℤ[x]` | holds | — |
| 2.2 (b) `exists_interp_eq_iSup_exs` | `top`, `bot`, `and (ex θ) ψ`, torsion | `ι = PUnit, m = 0`; `ι = PEmpty`; `ex (and θ ψ')` by Frobenius; torsion forces `ι = ULift ℕ` | holds | — |
| 2.3 `exists_isClassifyingSite` | empty theory, empty language; `0`-ary symbols indexed by `Type u` | `J = ⊥` on a category `≃ FinSetᵒᵖ`; subterminals of a `u`-site are `u`-small, the symbols are not: needs `Type (u+1)` | holds | — |
| 2.4 `exists_equivalence` | `torsorTheory (ℤ/2)`; `{⊤ ⊢ bot}` | `x ↦ g·x` commutes (abelian): two isomorphisms `U.map 𝟭 ≅ U`; degenerate topoi equivalent | holds, iso not unique | — |
| 2.5 `exists_quotient_topology`, `exists_quotient_theory` | `T ∪ {⊤ ⊢ bot}`; `J' = J`; subsingletons | `J' = ⊤`, degenerate; `T' = T`; two points `PEmpty`, `PUnit`: Sierpiński topos | holds | — |
| 2.6 `MoritaEquivalent` | objects vs decidable objects | `FinSet` and finite injections, both Cauchy complete; `Fin 2 ⟶ Fin 1` not mono: inequivalent (BorceuxDejean1986 lines 99, 134) | holds | — |
| 3.1 `isOfPresheafType_of_isHorn` | `ℤ/2 × ℤ/2`, `x = (1,0)`; `{⊤ ⊢ bot}` | `x`, `1 − x` non-units, so local rings are not product-closed; `{⊤ ⊢ bot}` of presheaf type (empty category), not Horn | holds, sufficient only | — |
| 3.2 `isClassifyingSite_genericObject` | object `3`; `FintypeCat.Skeleton` as site | value `Fin 3`; wrong variance gives functors on `FinSetᵒᵖ`, finite Boolean algebras | holds | — |
| 3.3 `isClassifyingSite_genericTorsor` | `𝔖₃`, `(12)`, `(23)`; `ℤ/2` acting on a point | `ab ≠ ba`: precomposition not natural; one-point set inhabited, transitive, not free, excluded by `g·x = 1·x ⊢ bot` | holds | — |
| 3.3 `moritaEquivalent_torsorTheory_iff` | `ℤ/4` vs `(ℤ/2)²`; trivial groups | order-4 element only in `ℤ/4`; one point each, automorphisms `G` separate; trivial: both `Type u` | holds | — |
| 3.4 `isClassifyingSite_genericInterval` | `σ 0`, `σ 1`; monotone `a ≤ b : [n] → [1]` | `0,1,2 ↦ 0,0,1` and `0,1,1`; `s = a + b` is a preimage iff `a ≤ b`; vertex `1` gives `(0, 1)` | holds | — |
| 3.5 `GeometricFormula.IsIrreducible` | objects: `∃y ⊤`, `⊥`, `(1, ⊤)` | `N ↦ N` onto `N ↦ [N ≠ ∅]` has no natural section (swap on `2`); empty sieve covers initial; representable irreducible | holds | — |
| 3.5 `SetModel.IsPresentedBy` | `(2, ⊤)`; `φ = ⊥` | `Hom(2, N) = N²`; without `φ.Realize ξ`, `⊥` would present every model | holds, requirement needed | — |
| 3.5 (a) `isOfPresheafType_iff_forall_covered` | `{⊤ ⊢ bot}`; objects, `∃y ⊤` | degenerate: no irreducibles, empty family epi onto initial, both sides true; `[[∃y ⊤]]` covered by `[[(1, ⊤)]]` | statement holds, route unowned | R02 |
| 3.5 (a) route vs the 2.3 site | `{⊤ ⊢ x₀ = x₁}`, empty language | cover `(2, x₀ = x₁) ⟶ (2, ⊤)`; `y(2, ⊤)`: 4 amalgamations of 1 family, not subcanonical | 6.6 (d) inapplicable | R02 |
| 3.5 (b) `isIrreducible_iff_exists_presentedBy` | objects: `(0, ⊥)`, `(0, ∃y ⊤)`, `(2, x₀ = x₁)` | neither; neither (`M ≠ ∅` has ≥ 2 maps to `2`); both (one-element set) | statement holds, route unowned | R03 |
| 3.5 (c) `exists_isPresentedBy_irreducible_of_isFinitelyPresentable` | `ℤ[1/2]`, `ℚ` | `(1, (1+1)·x₀ = 1)` presents `ℤ[1/2]`; `ℚ` not finitely generated, excluded by `hM` | statement holds, route unowned | R03 |
| 3.5 (d) `nonempty_equivalence_irreducible_fpModel`, `isIdempotentComplete_irreducible` | torsors; `{⊤ ⊢ bot}` | one object per side, automorphisms `≅ G`, only idempotent `1`; both sides empty | statement holds, route unowned | R03 |
| 3.6 `SetModel.IsHomogeneous` | sieve on `op 2` of `h` with `h 0 = h 1`; `J = ⊥` | `y : 2 → M` factors iff `y 0 = y 1`, so homogeneous iff `|M| ≤ 1`; `⊥`: `f = 𝟙`, `u = y` | holds (Caramello2012Yoneda line 386) | — |
| 3.6 (a) `exists_quotient_isSetModel_iff_isHomogeneous` | `J = ⊥`, `⊤`; Fourman–Grayson `J` | `T' = T`; `T ∪ {⊤ ⊢ bot}`; no homogeneous set-model, so `T ∪ {⊤ ⊢ bot}` passes, while `Sh(J)` is nondegenerate | Lean weaker than README | R04 |
| 3.6 (b) `isSetModel_iff_isIrreducibleObject` | subsingletons `n ≥ 2`, `1`, `∅`; `ℤ/6`, `ℤ/4` | injection `2 → n`: pullback misses `𝟙`; `ℤ/6`: cover at `3`, `4` (`4 − 3 = 1`), no unit; `ℤ/4` local | holds; proof via `y = 𝟙_M` checked | — |
| 4.1 `finitePresentation_of_isFinitelyPresentable` | `ℤ`, `ℤ[x]/(x²−x)`, `ℚ` | finitely presented; `≅ ℤ × ℤ`; `ℚ` not finitely generated, so not finitely presentable | holds | — |
| 4.1 `isClassifyingSite_genericRing` | transport by `x ↦ x + 1`; `E₁₂`, `E₂₁` | zero `1`, `a ⊕ b = a + b − 1` at `ℤ`, excluded by pinned operations; `E₁₁ ≠ E₂₂` | holds | — |
| 4.2 `isSheaf_forget_zariskiTopology` | zero ring; `ℤ`, `{2, 3}`; `{ℤ → ℤ[1/2]}` | `span ∅ = ⊤`, one element; `3 − 2 = 1`, equalizer `ℤ`; `span {2} ≠ ⊤` | holds | — |
| 4.3 `isClassifyingSite_localRingTheory` | `ℤ`, `x = 3`; zero ring | `3`, `−2` non-units; `0·0 = 1` in the zero ring, so `0 = 1 ⊢ bot` is needed | holds | — |
| Build | `lake env lean` at the pins | head: exit 1 at `482:8`; with `Sheaf.canonicalTopology`: exit 0, 25 `sorry`; with R04 too: exit 0 | fails | R01 |

- Source locators checked against the text: 27. Caramello2017Lattices lines 104, 471, 483, 638, 1285, 2321, 2393, 2417, 2430, 2480, 2928; Caramello2012Syntactic lines 239, 254, 260, 428, 446, 457, 555, 591; Caramello2012Yoneda lines 321, 335, 372, 386; Caramello2014Extensions lines 5076, 5095; BorceuxDejean1986 lines 99, 134. Every page and number the README gives for these matches the text.
- Library declarations opened at the pins: 13. Mathlib: `Sites/Canonical.lean:103`, `Sites/InducedTopology.lean:50`, `Presentable/Finite.lean:49`, `Sites/Subsheaf.lean:275`, `Ring/FinitePresentation.lean:169, 175`, `CommAlgCat/FiniteType.lean:118`, `BigZariski.lean:51, 57`, `Scheme.lean:602`, `ModelTheory/Bundled.lean:73` (`ModelType` requires `Nonempty`, so `SetModel` is no duplicate). Tau Ceti: `StructureSheaf.lean:72, 103`.
- Cross-roadmap citations resolved: 19. GrothendieckTopoi at its open head (119dbd3), 15: 1.1, 1.2, 2.1, 2.2 `homEquivInverse`, 2.4, 2.5 `IsFiltering` and `nonempty_geometricMorphism_equiv_isFiltering`, 4.1, 4.2, 6.1 `nonempty_point_equivalence`, 6.5, 6.6 (a)–(d) with `IsIrreducibleObject`, `IsRigidTopology` and both named theorems, Conventions 1 and 4, Out of scope. LocallyPresentableCategories at its open head (c3ec7a6), 4: 1.5, 3.1, 3.5, scope.
- Gate rerun on ad60900: every text check 0, `OK` (that run has no build step). The worker's gate: `build=2 FAIL` (R01). Dependency check: `depcheck: 206 roadmaps, 1896 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- Elaboration: head exit 1 with one error and 25 `sorry` warnings; R01's probe exit 0 with 25 `sorry`. I ran `#check @` on the 11 declarations of 3.5 and 3.6 and compared them with the README: the binders match. The 7 "looks dropped" leads in the signatures file are false positives, since each elaborated type carries its `Category` instance.
- One-tactic probe (`simp`, `rfl`, `infer_instance`, `trivial`, `aesop`) on all 25 theorems: none closes, and no declaration is padding.
- Ownership: overlaps none. An object grep of main and the open heads for presheaf type, `T`-irreducible formulae, homogeneous models and rigid topologies finds no other owner. `git diff --stat origin/main...HEAD` outside the folder is empty, and `metadata.toml` has `topic = "math.CT"`.

## Not verifiable

- Mac Lane–Moerdijk, VIII.2–VIII.8 and X.1–X.6 (1.1–4.3): Springer (doi:10.1007/978-1-4612-0927-0), paywalled per the sources service.
- Johnstone, Elephant, D1.1–D1.4, D1.3.10, D3.1 (1.1–3.5): OUP landing page returned HTTP 403, and the service found no legal copy.
- Makkai–Reyes, LNM 611, pp. 272–297 (2.3): Springer (doi:10.1007/BFb0066201), paywalled.
- Hakim 1972, Chapitre III, §3 (4.3): Springer, paywalled.
- Caramello2017Lattices p. 81 (proof of Theorem 17.6): the normal form is legible (line 2934), but the Elephant D1.3.10 citation is not legible in the OCR text.

## Source issues

- **Misprint** in Caramello2017Lattices at Definition 14.5, p. 68: the source says the generators need only be elements of the model's sorts, not that they satisfy the formula there; it should require that they satisfy it in `M`, since otherwise `⊥` presents every model, against the uniqueness remark that follows; affects nothing.
- **Misprint** in Caramello2014Extensions at Remark 6.27 (iii), p. 110: the source says it uses "Remark 6.27(a)"; it should say Remark 6.27 (i), the remark's parts being numbered (i)–(iii); affects nothing.
