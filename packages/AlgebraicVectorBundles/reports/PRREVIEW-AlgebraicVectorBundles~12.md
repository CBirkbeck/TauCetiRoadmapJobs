# Review of AlgebraicVectorBundles (pull request #3170 at 57376f9)

**Verdict:** needs changes

**Summary.** A review of the change against `main`: 48 changed lines since `87e7f72`. Checked: the new §4.2, every line that now cites it (the layer guide, the L1B label line, the Layer 4 dependencies, the ownership list and the `Suggested.lean` docstring), the Tau Ceti and Mathlib declarations it names at the pins, the Stacks locators that support it, and the build. The mathematics of §4.2 and both of its Checks are correct. One finding: the module docstring says the §4.2 adjunction cannot be stated at the pins, but a test file states it with three short definitions that have real bodies, so a headline the file itself names has no acceptance test. There are two small corrections (§4.2 cites no source; the description's count of roadmaps) and two format notes. Nothing is left for a human to decide.

## R01 (P2) — The module docstring lists §4.2 as not statable, but the adjunction can be stated at the pins with three short definitions

`Suggested.lean` names §4.2 among the "headline theorems … not statable at the pins" (lines 54–57). Its reason is that "the function-algebra functor into `QuasicoherentAlgebra X` on that subcategory of `Over X` is missing, and it is data". The file's rules allow a few simple definitions with real bodies when a headline needs them. Here every carrier is a restriction of something pinned, so the headline can be stated, and as things stand it has no acceptance test.

I checked this with a test file that imports `Mathlib`, `TauCeti.AlgebraicGeometry.RelativeSpec.UniversalProperty` and `TauCeti.AlgebraicGeometry.Modules.Quasicoherent.Pushforward.QuasiSeparated`, with `open CategoryTheory MonoidalCategory AlgebraicGeometry TauCeti.AlgebraicGeometry`. Under `lake env lean` the following elaborates. The only warnings are `declaration uses 'sorry'` on the theorems; the definitions contain no `sorry`.

```lean
abbrev QcqsOver (X : Scheme.{u}) :=
  MorphismProperty.Over (@QuasiCompact ⊓ @QuasiSeparated : MorphismProperty Scheme.{u}) ⊤ X

noncomputable def qcqsFunctions (X : Scheme.{u}) : (QcqsOver X)ᵒᵖ ⥤ QuasicoherentAlgebra X :=
  ObjectProperty.lift _ ((MorphismProperty.Over.forget _ _ X).op ⋙ overFunctions X)
    (fun T => by
      have : QuasiCompact T.unop.hom := T.unop.prop.1
      have : QuasiSeparated T.unop.hom := T.unop.prop.2
      show ((Scheme.Modules.pushforward T.unop.hom).obj (𝟙_ _)).IsQuasicoherent
      infer_instance)

noncomputable def relativeSpecQcqs (X : Scheme.{u}) : (QuasicoherentAlgebra X)ᵒᵖ ⥤ QcqsOver X :=
  relativeSpec X ⋙ MorphismProperty.Comma.changeProp _ _
    (fun _ _ _ (_ : IsAffineHom _) => ⟨inferInstance, inferInstance⟩) le_rfl le_rfl

theorem nonempty_adjunction (X : Scheme.{u}) :
    Nonempty ((qcqsFunctions X).rightOp ⊣ relativeSpecQcqs X) := sorry
```

The proof field of `qcqsFunctions` is Tau Ceti's `Scheme.Modules.isQuasicoherent_pushforward` (Modules/Quasicoherent/Pushforward/QuasiSeparated.lean:107), applied to `pushforwardStructureAlgebra_X`. The corestriction of `relativeSpec` uses Mathlib's instances that affine morphisms are quasi-compact (AlgebraicGeometry/Morphisms/Affine.lean:59) and separated, hence quasi-separated (Morphisms/Separated.lean:116 and :65). The statement `IsIso (adj.unit.app T) ↔ IsAffineHom T.hom` also elaborates for an adjunction `adj` of this type. BelyiMaps, in this same pull request, states its own adjunction as an `IsRightAdjoint` proposition.

The smallest repair would be to add these declarations (or the `IsRightAdjoint` form, if you prefer it) to `Suggested.lean` and to drop the §4.2 bullet from the docstring's not-statable list. Declaring `QcqsOver` also turns the code-font name of §4.2 into a declared one. If §4.2 is not meant as a headline (the README's opening overview does not list it among the four), the alternative is to drop the bullet and leave §4.2 as a README target only.

## C01 — §4.2 cites no source, although each of its claims has a Stacks locator

Every other target of the roadmap carries a locator, and a reader checking §4.2 has none to start from. In the cached Stacks texts:

- The universal property is Constructions, Definition 27.4.5 (Tag 01LW, p. 7).
- The invertible counit is Lemma 27.4.6 (3) (Tag 01LX, p. 7).
- The canonical morphism `T → Spec_X(q_* 𝒪_T)` for qcqs `q` is Lemma 27.4.7 (Tag 01LY, pp. 7–8).
- Quasi-coherence of `q_* 𝒪_T` is Schemes, Lemma 26.24.1 (Tag 01LC, p. 46).
- "Affine implies quasi-compact and separated" is Morphisms, Lemma 29.11.2 (Tag 01S7, p. 18).
- "The unit is an isomorphism exactly when `q` is affine" is Morphisms, Lemma 29.11.3 with its final sentence (Tag 01S8, pp. 18–19).

Adding these in the house form "(Stacks Project, Tag …)" at each claim would be enough.

## C02 — The description says "fifteen roadmaps", but the head changes sixteen

The description opens with "This PR adds planned targets to fifteen roadmaps". The head changes sixteen roadmap folders, the title says "sixteen", and the bullet list has sixteen entries, including AlgebraicVectorBundles. It should say "sixteen roadmaps".

## N01 — `QcqsOver X` is in code font in §4.2 (line 618) but is declared nowhere

The text marks it as "a proposed name", and the description says such names are given in prose. Declaring it as R01 suggests settles this. Otherwise it could be written in prose ("the full subcategory of qcqs schemes over `X`").

## N02 — Layer 4's heading (line 580) no longer covers all of the layer

The heading is "linear schemes as module schemes", but §4.2 is about relative Spec on qcqs schemes and uses nothing from §4.1. One option is a broader title that keeps the old anchor as an `<a id="layer-4-linear-schemes-as-module-schemes"></a>` line; no roadmap links to that anchor today. Another is to make §4.2 a new Layer 5. Either way, the heading would then name what the layer contains.

## Verified sound

### Adversarial table: the statements this diff adds

| Statement | Instance | Left side | Right side | Result |
| --- | --- | --- | --- | --- |
| §4.2 bijection `Hom_X(T, Spec_X A) ≅ Hom(A, q_* 𝒪_T)` | `X = Spec k`, `T = ℙ¹_k`, `A = k[t]` | maps `ℙ¹ → 𝔸¹` over `k` are constants: `k` | `Hom_k(k[t], Γ(ℙ¹, 𝒪) = k) = k` | agree |
| same, empty source | `T = ∅` | `Hom(∅, Spec_X A)`: one map | `q_* 𝒪_∅ = 0`, `Hom(A, 0)`: one map | agree |
| same, the reversed adjunction | `T = ℙ¹_k`, `A = k` | `Hom(Spec k, ℙ¹_k) = ℙ¹(k)`, `|k| + 1` points | `Hom(Γ(ℙ¹, 𝒪), k) = Hom(k, k)`: one | reversal fails; `relativeSpecHomIso` (UniversalProperty.lean:455) fixes the direction |
| counit `A → p_* 𝒪_{Spec_X A}` invertible | over `Spec k`: `A = k[t]`; `A = 0` | `k[t]`; `0` | `Γ(𝔸¹, 𝒪) = k[t]`; `Spec 0 = ∅`, sections `0` | iso, as stated; Stacks 01LX (3) |
| unit iso exactly when `q` affine | `𝔸² ∖ 0 → Spec k` (qcqs, not affine) | `Γ = k[x, y]`, reflection `𝔸²` | unit is the open immersion missing the origin: not iso | consistent |
| same, affine case | `Spec k ⊔ Spec k → Spec k` | `Γ = k × k` | `Spec(k × k) = T`: unit iso | consistent; Stacks 01S8 |
| Check 1: quasi-compactness needed | `T = ⊔_ℕ Spec ℤ`, `p = 2` | `q` separated (diagonal onto clopen components), not qc; `∏ ℤ[1/2] ∋ (2⁻ⁿ)` | `(∏ ℤ)[1/2]`: denominators bounded by `2ᵏ`, coordinate `n = k + 1` fails | Check correct |
| Check 2: `ℙ¹_k` | `ℙ¹_k → Spec k` | `q_* 𝒪 = k`, reflection `Spec k` | unit `ℙ¹ → Spec k`: dimension 1 against 0 | not iso; Check correct |
| affine ⇒ qcqs (corestriction of `relativeSpec`) | Mathlib Affine.lean:59; Separated.lean:116, :65 | `IsAffineHom → QuasiCompact`; `→ IsSeparated → QuasiSeparated` | found by `inferInstance` in the test file | holds |
| docstring: §4.2 not statable (R01) | test file above | function-algebra functor = `ObjectProperty.lift` of `overFunctions`, real body | `Nonempty (F.rightOp ⊣ G)` elaborates, `sorry` warnings only | claim false |

### Carried rows: seeded targets this diff does not touch (verified in the r10 and r11 reports)

| Statement | Instance | Values | Result |
| --- | --- | --- | --- |
| 1.1 stalks | `G = 𝒪`, origin `↪ 𝔸¹`; `G = j_!𝒪_U` | `k = k ⊗ k[t]_(t)`; `κ(x)` and `0` on both sides | iso |
| 1.2 `pullback_tensor_isIso` | `Spec 𝔽_p → Spec ℤ`, `ℤ/p²`; discrete two-point site | `𝔽_p = 𝔽_p ⊗ 𝔽_p`; `k² → k⁴` | iso; fails off `Opens.map` |
| 2.1 exactness | `Spec k[t]_(t) → 𝔸¹`; origin with `t` | injective; `0 : k → k` | flatness needed |
| 2.2 Hom comparison | origin; `𝒪^(ℕ)` along `Spec ℚ → Spec ℤ` | `0` against `k`; `(1/pᵢ)` not hit | flatness and finite presentation needed |
| 3.1 powers | `n = 0`; `𝒪²`, `n = 2, 3` | `𝒪`; `k·e₁∧e₂`, `0` | iso |
| 3.2 determinant | `0 → 𝒪 → 𝒪(1)² → 𝒪(2) → 0`; `𝒪²` swap | degree `2 = 0 + 2`; sign `−1` | as stated |
| 3.3 graded lines | `P = A`; `diag(t, 1)` | parity `1`; `det = t`, `t⁻¹ ∉ k[t]` | sign kept, inverse excluded |
| 4.1 weight grading | `α_p`; `𝔾_a/𝔽₂` with `λ²` | `A_n = 𝔽_p tⁿ`, counit not injective; `A₁ = 0` | as stated |

### Counts

- Previous review (r11): no findings, so there was nothing to check for repair.
- Source locators checked against the text: 6 for §4.2, which cites none (C01). They are Stacks 01LW, 01LX and 01LY (Constructions, lines 286–317, pp. 7–8), 01LC (Schemes, line 2134, p. 46), and 01S7 and 01S8 (Morphisms, lines 820–837, pp. 18–19). Seeded targets 1.1–4.1 are untouched by the diff and carry the r10 verification.
- Library declarations opened at the pins:
  - Tau Ceti: `relativeSpecHomIso` (RelativeSpec/UniversalProperty.lean:455), `overFunctions` (Modules/Algebra/Functoriality.lean:314), `relativeSpecEquiv` (RelativeSpec/Equivalence.lean:114), `relativeSpec` and `AffineSchemeOver` (RelativeSpec/Functor.lean:219, :207), `QuasicoherentAlgebra` (Functor.lean:164), `pushforwardStructureAlgebra` (Modules/Algebra/RegularFunctions.lean:53) and `Scheme.Modules.isQuasicoherent_pushforward` (QuasiSeparated.lean:107).
  - Mathlib: `Adjunction.mkOfHomEquiv` (CategoryTheory/Adjunction/Basic.lean:433) and `MorphismProperty.Comma.changeProp` (MorphismProperty/Comma.lean:332).
  - No restriction of `overFunctions` into `QuasicoherentAlgebra X` exists at the pin.
- Cross-roadmap citations: the diff adds none. No roadmap links to the Layer 4 anchor. AlgebraicModuliForArithmeticGeometryPartII §2.2 on main consumes L1A–L1B, which now point to §4.2 as well, and that is consistent with it.
- Dependency check (verbatim): `depcheck: 122 roadmaps, 1394 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.
- Elaboration: `lake env lean` on `TauCetiRoadmap/AlgebraicVectorBundles/Suggested.lean` gives five `declaration uses 'sorry'` warnings, at lines 103, 123, 137, 155 and 173, and nothing else. The diff changes only the module docstring, so no binder of the eleven declarations changed. The test file for R01 elaborates with `sorry` warnings only.
- Automatic checks: the worker reports every check passing. My rerun differs only by the false positive described below.
- Overlap check: I read SchemeAndStackFoundations (main §0.1; open heads #2489 and #2531 through the roadmap search), FunctorOfPoints (§6.6), LogPluricanonicalForms, AdicSpacesPartIII and NashBlowups, plus AlgebraicModuliForArithmeticGeometryPartII §2.2 and GroupSchemesOverABase §4.3 found by object search. Nothing is shared: relative Spec as a right adjoint on qcqs schemes over a base is owned only here. SchemeAndStackFoundations §0.1 consumes the qcqs pushforward from Tau Ceti and does not state the adjunction. FunctorOfPoints §6.6 is relative Spec over a functor.

Source independence: 7 passages compared with 3 Stacks chapters (§4.2 statement, its two Checks, the layer-guide addition, the L1B line, the ownership bullet and the docstring bullet; changed passages only), no run of wording shared beyond forced terms ("quasi-compact and quasi-separated"); largest share The Stacks Project, 21 of 23 locators; contents not compared, as the diff adds no layer and reorders none.

Research link: Layer 3's determinant of short exact sequences (Stacks Tags 0FJB–0FJE; Hartshorne 1977, II, Exercise 5.16) is the determinant that KTheoryLowDegrees and SchemeAndStackFoundations use for K₀ and its Picard-valued determinant, and AdicSpacesPartIII uses Layers 1–2 on formal schemes and adic spaces. This rests on the README's overview and consumers section.

## Not verifiable

- Ownership against SchemeAndStackFoundations #2489 and #2531, FunctorOfPoints #2465 and LogPluricanonicalForms #2122 was checked only through the roadmap search tools, which read those roadmaps at their heads; no full checkout of them was available to this review.
- Hartshorne, *Algebraic Geometry*, II, Exercise 5.16 is recorded as uncertified and is cited only in untouched text.

Automatic checks set aside as false positives: the check that a pull request changes nothing outside the roadmap folder under review (it guards against edits to other roadmaps slipping in unreviewed), rerun by hand, flagged 29 files. They are the README and `Suggested.lean` files of the fifteen other roadmap folders that this pull request itself adds or revises, each of which has a review of its own.

## Source issues

- none

## For the human reviewers

- none
