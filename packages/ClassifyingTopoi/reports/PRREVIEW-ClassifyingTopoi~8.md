# Review of ClassifyingTopoi (pull request #1997 at f2f3bc1)

**Verdict:** needs changes

## R01 (P1) — the route of 3.5 (a) uses the geometric syntactic site, which nothing owns and the Scope excludes

**Location** README lines 748–756: "Route: by 2.4 replace `E` by the topos of the geometric syntactic site `(𝒞, J_T)` of `T` (Elephant, D3.1; an essentially small version of it if needed) … `J_T` is subcanonical. By GrothendieckTopoi 6.6 (d) …"

**Claim** No layer builds the geometric syntactic category, its subcanonical topology, or `[[φ]] ≅ y {x . φ}`. Line 108 puts proof systems out of scope, and Elephant is a citation, not a supplier. The site of 2.3 is not subcanonical, so GrothendieckTopoi 6.6 (d), which still assumes `J.Subcanonical` at its head 24c3553, does not apply to it. The route of (c) ("contains every representable by the covering of (a) and (b)") relies on the same fact.

**Witness** Take `{⊤ ⊢ x₀ = x₁}` over the empty language. The `J` of 2.3 makes `(2, x₀ = x₁) ⟶ (2, ⊤)` covering. Its single matching family for `y(2, ⊤)` has four amalgamations (`Hom(2, 2)`), so `J` is not subcanonical.

**Repair** In 2.4, before its *Needs:* line, add: "Prove also that, for a classifying site `(C, J, U)` of `T`, the objects underlying the `U.interp φ` form a separating family of `Sheaf J (Type u)`, and every subobject of `U.pow n` is `U.interp ψ` for some `ψ : GeometricFormula.{u} L n` (Caramello 2012a, proof of Lemma 3.2, p. 182, for the geometric syntactic site). Route: on the site of 2.3 the sheafified representables are the `U.interp χ` with `χ` Horn. The image of a map from one of them into `U.pow n` is given on a cover by tuples of terms, hence it is the interpretation of a disjunction of `exs` of Horn formulas (2.2 (b)). The equivalence above transports both facts." Add 2.2 (b) and 2.3 to the *Needs:* of 2.4.

Replace the Route of 3.5 (a) with: "Route: if every `[[φ]]` is covered by irreducible objects, these separate `E` (2.4), and `E` is a presheaf topos by GrothendieckTopoi 6.5 (Roos) and 6.6 (b). Conversely, in a presheaf topos the irreducible objects separate (GrothendieckTopoi 6.5, 6.6 (b)). Each of them is a retract of some `[[χ]]`, hence a subobject of a power of `U`, hence some `[[ψ]]` (2.4)."

In the route of (c), replace "by the covering of (a) and (b)" with "by 2.4, each irreducible object being a retract of some `[[χ]]`".

## R02 (P1) — no target owns "`[FPModel T, Set]` classifies `T`", an input of 3.5 (b)–(d) and 3.6

**Location** README lines 760–761: "Route: the classifying topos is `[FPModel T, Set]` (3.1; Caramello 2017, « Lattices of theories », Remark 14.2), under which `[[φ]]` is the functor `N ↦ [[φ]]_N`"; also lines 770 and 818 ("By 3.1 and 3.5 (d)").

**Claim** 3.1 only defines presheaf type and proves the Horn case. No target proves that the classifying topos of a presheaf-type theory is `[FPModel T, Set]` with `[[φ]]` going to `N ↦ [[φ]]_N`. No target proves that a presented model is finitely presentable, although (b) uses this and the last Check of 3.5 attributes it to (b). 3.6 gets the identification from (d), whose route uses (b), and the route of (b) assumes the identification, so the routes are circular.

**Witness** Caramello2017Lattices line 2321 (Remark 14.2) derives the identification from Diaconescu's theorem and `Ind`. Line 2430 shows that `N ↦ [[φ]]_N` preserves filtered colimits. The README contracts LocallyPresentableCategories 1.5 "for the Examples of Layer 3" only (lines 221–222).

**Repair** In 3.5, before (b), add: "(a′) For `T` of presheaf type, `FPModel T` is essentially small. A small category equivalent to `(FPModel T)ᵒᵖ`, with the trivial topology and the generic model whose carrier is `N ↦ N.carrier`, classifies `T`, and the interpretation of `φ` is `N ↦ [[φ]]_N`. A set-model presented by a formula is finitely presentable (Caramello 2017, « Lattices of theories », Remark 14.2, p. 65, and §14.2, p. 68, in the numbering of arXiv:0905.0299v1). Route: for a classifying site `(C, ⊥, U)`, GrothendieckTopoi 2.5 makes the set-models the flat functors on `C`, that is `Ind` of `Cᵒᵖ` (LocallyPresentableCategories 1.5). The finitely presentable objects of `Ind` are the retracts of representables, since the identity factors through a stage. Presheaves on a category and on its Cauchy completion agree (Borceux–Dejean 1986, Theorem 1 (4), p. 134). `N ↦ [[φ]]_N` preserves filtered colimits."

Then:
- In (b), (c) and the 3.6 introduction, cite "(a′)" in place of "3.1" and "3.1 and 3.5 (d)".
- In the last Check of 3.5, replace "by (b) no formula presents it" with "by (a′) no formula presents it".
- Add LocallyPresentableCategories 1.5 to the *Needs:* of 3.5, to the Dependencies of Layer 3 and to its supplier contract (lines 221–222), with the use "for 3.5 and the Examples of Layer 3".

## R03 (P2) — 3.6 (a) in Lean drops the classification of `T'` by `Sh((FPModel T)ᵒᵖ, J)`, although it is statable

**Location** `Suggested.lean` lines 581–585 and docstring lines 34–37: "Not stated: README 3.6, the `J`-homogeneity of a model in an arbitrary sheaf topos and the classification by `Sh((FPModel T)ᵒᵖ, J)`, lacking the object of homomorphisms"

**Claim** The classification needs no object of homomorphisms: it can be stated through a small site equivalent to `(FPModel T)ᵒᵖ`. Without it the conclusion does not tie `T'` to `J`. README 3.6 (a) states that `Sh((FPModel T)ᵒᵖ, J)` classifies `T'`, while the Lean statement keeps only the set-models.

**Witness** Caramello2012Yoneda line 335 (Theorem 4.6) states the classification. Take `J` of the pointless Fourman–Grayson quotient (surjections `ℕ ↠ ℝ`) of a propositional Horn theory. No set-model is homogeneous, so `T ∪ {⟨0, .top, .bot⟩}` satisfies the Lean statement, although `Sh(J)` is nondegenerate.

**Repair** Replace the statement with:

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

On a probe copy of this head this elaborates with exit 0 and 25 `sorry` warnings. In the docstring, delete " and the classification by `Sh((FPModel T)ᵒᵖ, J)`". Replace "the case of sets, in its elementary form, is stated" with "the case of sets, and the classification of the quotient by a small site equivalent to `(FPModel T)ᵒᵖ`, are stated".

## R04 (P3) — GrothendieckTopoi 1.2 is cited for images it does not state

**Location** README line 211: "1.2 (images, epimorphisms and coproducts in `Sheaf J (Type u)`, and the frame property of its subobject lattices)"; line 372: "GrothendieckTopoi 1.2 (images, epimorphisms and coproducts in `Sheaf J (Type u)`)".

**Claim** At its head, GrothendieckTopoi 1.2 states limits, colimits, balancedness, regular epimorphisms and frame subobject lattices, but not images. Images come from Mathlib, which the README's Mathlib contract (line 187) already lists.

**Witness** GrothendieckTopoi README §1.2 at its open head (24c3553) has no statement about images. Mathlib `CategoryTheory/Sites/Subsheaf.lean:275`: `instance : Limits.HasImages (Sheaf J (Type max v u))`.

**Repair** In lines 211 and 372, replace "images, epimorphisms and coproducts" with "epimorphisms and coproducts". Add `HasImages (Sheaf J (Type u))` to the Mathlib names in the *Needs:* of 1.4 (line 373). In the description, replace "1.2 (images and the frame property of subobject lattices)" with "1.2 (epimorphisms, coproducts and the frame property of subobject lattices)".

## R05 (P3) — doubled list markers break the (a)–(d) lists of 3.5 and 3.6

**Location** README line 757: "- - (b) `GeometricFormula.isIrreducible_iff_exists_presentedBy`"; line 830: "- - (a) `exists_quotient_isSetModel_iff_isHomogeneous`".

**Claim** Each line renders as an empty bullet containing a nested bullet, so (b) of 3.5 and (a) of 3.6 do not line up with their siblings.

**Witness** In CommonMark, `- - x` is a list item whose only content is a nested list containing `x`.

**Repair** Delete the first "- " on lines 757 and 830.

## R06 (P3) — the description's headline and elaboration paragraphs do not match the head

**Location** Description, "Acceptance test": "Every headline of the README that is statable at the pins is stated. The one that is not is README 2.2 (a)"; "only `sorry` warnings (18)"; "The 7 theorems and 7 definitions of 3.5 and 3.6 … have not been elaborated locally".

**Claim** The docstring names a second part that is not stated (3.6), and R03 shows that part of it is statable. At this head the whole file elaborates at the pins with 25 `sorry` warnings, so the paragraphs about probes at earlier pins and 18 headlines are out of date. The sentence about the gate is now true.

**Witness** Docstring lines 31–37 list two parts that are not stated. `lake env lean` on this head gives exit 0 and 25 `sorry` warnings. `gate.md` at f2f3bc1 gives `build=0`, `OK`.

**Repair** After R01–R04, replace the two headline sentences with: "Every headline that is statable at the pins is stated. Two parts are not: README 2.2 (a), which lacks GrothendieckTopoi's `IsFiltering`, and, in 3.6 (a), homogeneity in an arbitrary topos, which lacks the object of homomorphisms (Caramello 2012b, Definition 4.4)." Replace the text from "Elaboration was run with `probe.py`" through "The probe results above are for the 18 earlier headlines." with: "At the pins (Mathlib `1b1ccf4`, Tau Ceti `2fd255d`), `lake env lean` gives 25 `sorry` warnings and no error, and no theorem closes by one tactic." Name LocallyPresentableCategories 1.5 as used by 3.5 (R02).

## Previous findings

- R01 — repaired: `Suggested.lean` line 483 now reads "S ∈ Sheaf.canonicalTopology (Sheaf J (Type u)) (Subobject.underlying.obj (U.interp φ)) →". Docstring line 38 and README lines 191 and 786 now read `Sheaf.canonicalTopology`. The file elaborates with exit 0 and 25 `sorry` warnings.
- R02 — not repaired: README line 748 still reads "Route: by 2.4 replace `E` by the topos of the geometric syntactic site `(𝒞, J_T)` of `T` (Elephant, D3.1 …)". Carried as R01.
- R03 — not repaired: README line 760 still reads "Route: the classifying topos is `[FPModel T, Set]` (3.1; Caramello 2017, « Lattices of theories », Remark 14.2)". Carried as R02.
- R04 — not repaired: `Suggested.lean` lines 583–584 still read "∃ T' : GeometricTheory.{u} L, T ⊆ T' ∧ ∀ M : SetModel T, T'.IsSetModel M.carrier ↔ M.IsHomogeneous J". Carried as R03.
- R05 — not repaired: README line 211 still reads "1.2 (images, epimorphisms and coproducts in `Sheaf J (Type u)` …", and line 372 is unchanged. Carried as R04.
- R06 — not repaired: README line 757 still begins "- - (b)" and line 830 "- - (a)". Carried as R05.
- R07 — partly repaired: "The worker's gate gives 0 on every check" is now true. "The one that is not is README 2.2 (a)" and "only `sorry` warnings (18)" are still wrong. Carried as R06.

## Verified sound

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| 3.5 `GeometricFormula.IsIrreducible` (changed: `Sheaf.canonicalTopology`) | object theory: `(1, ⊤)`, `(0, ∃y ⊤)`, `(0, ⊥)`; `{⊤ ⊢ bot}` | representable: an epimorphic sieve hits `𝟙`, so it is `⊤`; `N ↦ N` onto `[N ≠ ∅]`: no section (swap on `2`); empty sieve covers the initial object; trivial topos: nothing irreducible | holds | — |
| 3.5 (a) route vs the 2.3 site | `{⊤ ⊢ x₀ = x₁}`, empty language | cover `(2, x₀ = x₁) ⟶ (2, ⊤)`; `y(2, ⊤)`: 1 matching family, 4 amalgamations, so not subcanonical | 6.6 (d) inapplicable | R01 |
| 3.5 (a) `isOfPresheafType_iff_forall_covered` | `{⊤ ⊢ bot}`; object theory, `∃y ⊤` | no irreducibles, empty family epi onto initial, both sides true; `[[∃y ⊤]]` covered by `[[(1, ⊤)]]` | statement holds, route unowned | R01 |
| 3.5 (b) `isIrreducible_iff_exists_presentedBy` | object theory: `(0, ⊥)`, `(0, ∃y ⊤)`, `(2, x₀ = x₁)` | neither; neither (`M ≠ ∅` has ≥ 2 maps to `2`); both (`{a}`, `ξ = (a, a)`) | statement holds, route unowned | R02 |
| 3.5 (c), (d) | `ℤ[1/2]`, `ℚ`; `torsorTheory G` | `(1, (1+1)·x₀ = 1)` presents `ℤ[1/2]`; `ℚ` excluded by `hM`; one object per side, automorphisms `≅ G` | statements hold, route unowned | R02 |
| 3.6 (a) `exists_quotient_isSetModel_iff_isHomogeneous` | `J = ⊥`, `⊤`; Fourman–Grayson `J` | `T' = T`; `T ∪ {⊤ ⊢ bot}`; no homogeneous set-model, so `T ∪ {⊤ ⊢ bot}` satisfies the Lean statement, while `Sh(J)` is nondegenerate | Lean weaker than README | R03 |
| 1.4 `CatStructure.IsModel.map`, *Needs:* | images in `Sheaf J (Type u)` | GrothendieckTopoi 1.2 at 24c3553: limits, colimits, balanced, regular epis, frames, no images; Mathlib `Subsheaf.lean:275` `HasImages` | supplier mis-cited | R04 |
| Build | `lake env lean` at the pins | head: exit 0, 25 `sorry`, no other output; R03's statement on a probe copy: exit 0, 25 `sorry` | builds | — |

Rows for untouched statements stand as in the previous review, of `ad60900`.

- Source locators checked against the text: 3 (Caramello2012Yoneda line 335; Caramello2017Lattices lines 2321, 2430). The changed passages carry no locator, and no target of the seeded sample falls in them.
- Library declarations opened at the pins: Mathlib `CategoryTheory/Sites/Canonical.lean:103` (`canonicalTopology`, inside `namespace Sheaf` from line 49 to line 120) and `Sites/Subsheaf.lean:275`.
- Bare `canonicalTopology` no longer appears: all 4 occurrences are `Sheaf.canonicalTopology` (README 191, 786; `Suggested.lean` 38, 483).
- Cross-roadmap citations resolved again at GrothendieckTopoi's new head (24c3553): 1.2, 2.2 `homEquivInverse`, 2.5 `IsFiltering` and `nonempty_geometricMorphism_equiv_isFiltering`, 4.2 (`J' ≥ J`), 6.1 `nonempty_point_equivalence`, 6.5, and 6.6 (a)–(d) with both named theorems. Its topos-level notion is `IsIrreducibleObject (Sheaf.canonicalTopology E)`, which agrees with the changed definition. LocallyPresentableCategories is unchanged at c3ec7a6.
- Gate: my rerun reports every text check 0, `OK`. The worker's gate at f2f3bc1 reports every check 0, `build=0` included. Dependency check: `depcheck: 206 roadmaps, 1896 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- Elaboration: exit 0, 25 `sorry` warnings and nothing else. I ran `#check @` on `GeometricFormula.IsIrreducible`, `isOfPresheafType_iff_forall_covered`, `GeometricFormula.isIrreducible_iff_exists_presentedBy` and `irreducibleFormulaObjects`: the binders (`L`, small `C`, `J`, `U`, `n`, `φ`) match README 3.5.
- Outside the folder: `git diff --stat origin/main...HEAD` is empty. The eight `PROGRESS.md`/`STATUS.md` files in the change since ad60900 come from the merge of main.
- Overlaps: none, and no open pull request changes this roadmap. The change adds no owned object.

## Not verifiable

- The changed passages cite no source. The five items of the previous review stand: Mac Lane–Moerdijk, Makkai–Reyes LNM 611 and Hakim 1972 are paywalled (Springer); the OUP page for Elephant returned 403; the Elephant D1.3.10 citation inside Caramello2017Lattices p. 81 is illegible in the OCR text.

## Source issues

- none
