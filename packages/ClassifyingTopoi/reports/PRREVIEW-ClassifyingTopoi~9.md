# Review of ClassifyingTopoi (pull request #1997 at 997b188)

**Verdict:** needs changes

## R01 (P3) — two Checks of 2.3 treat a one-sorted theory with no axiom as propositional

**Location** `TauCetiRoadmap/ClassifyingTopoi/README.md` lines 520–523: "One `0`-ary relation symbol `p` and no axiom: set-models are the two truth values of `p` … the Sierpiński topos"; lines 529–531: "With two symbols … by presheaves on the product of two copies of the arrow category"; line 601 relies on the first.

**Claim** Every theory here has one sort, so with no axiom the carrier is free: a model is an object together with a subterminal. The set-models are not two, and the classifying topos is neither the Sierpiński topos nor, for two symbols, its square. The 2.5 Check (lines 600–604) compares subsingletons with this theory and inherits the error.

**Witness** Over `{p}` with no axiom, every `(M, p)` is a set-model. `(PUnit, false)` and `(Bool, false)` are not isomorphic, and there are two homomorphisms from the first to the second. The Sierpiński topos has two points and one 2-cell (GrothendieckTopoi 6.1, Checks).

**Repair** In 2.3, Checks, replace "One `0`-ary relation symbol `p` and no axiom:" with "One `0`-ary relation symbol `p` and the axioms `⊢ ∃ x, ⊤` and `⊤ ⊢ x = y`:". In the next Check, replace ", and no axiom." with ", and the axioms `⊢ ∃ x, ⊤` and `⊤ ⊢ x = y`.". With these axioms a model in a topos is a subterminal object, so the 2.5 Check then holds as written.

## R02 (P3) — the idempotents Check of 3.5 gives `FPModel T` two objects; it has infinitely many

**Location** `TauCetiRoadmap/ClassifyingTopoi/README.md` lines 882–885: "Both formulae are irreducible and `FPModel T` has these two objects up to isomorphism: `[FPModel T, Type u]` is the presheaf topos of the monoid `{1, e}` … `(FPModel T)ᵒᵖ` is the Cauchy completion of that monoid".

**Claim** `FPModel T` contains every free model. Its presheaf topos therefore has infinitely many irreducible objects up to isomorphism, not the two of the monoid `{1, e}`. That presheaf topos classifies a different theory, so the comparison with (a′) is false.

**Witness** `(2, ⊤)` presents the free model `{x, f x, y, f y}`. It has four elements and is finitely presentable by (a′), so it is isomorphic neither to `{x, f x}` nor to the one-point set.

**Repair** Replace the text from "Both formulae are irreducible" to the end of the bullet with: "Both formulae are irreducible (b). `(n, ⊤)` presents the free model on `n` generators, which has `2n` elements, so no free model has one element. The idempotent `x ↦ f x` of `{x, f x}` therefore splits in `FPModel T`, through the one-point set, but not in its full subcategory on the free models, as the idempotent completeness of `FPModel T` in (a′) requires."

## R03 (P3) — README 2.4 and 3.5 (a′) attach Lean names to more than the declarations state

**Location** `TauCetiRoadmap/ClassifyingTopoi/README.md` lines 541–546: "Prove also `IsClassifyingSite.exists_interp_eq_of_subobject`: … `U.interp ψ` …; and the objects underlying the `U.interp φ` form a separating family". Lines 793–798 (a′): "with the generic model `N ↦ N.carrier` … A set-model presented by a formula is finitely presentable".

**Claim** `Suggested.lean` lines 305–309 state only that subobjects are definable. Lines 541–545 leave `U` unconstrained, with no carrier clause and no presentation clause. Each backticked name therefore claims a statement that the declaration does not make.

**Witness** Elaborated types at the pins: `IsClassifyingSite T J U → ∀ {n} (S : Subobject (U.pow n)), ∃ ψ, U.interp ψ = S`, and `IsOfPresheafType T → ∃ C x x_1 U, IsClassifyingSite T ⊥ U`.

**Repair** In 2.4, replace "; and the objects underlying" with ". Prove also that the objects underlying". In (a′), end the named statement after "classifies `T`" and continue with "Prove also that the generic model can be taken to be `N ↦ N.carrier` …" through "… finitely presentable". To keep the carrier in Lean as well, the following elaborates at the pins (probe copy, one `sorry` warning, no error):

```lean
/-- **3.5.** The underlying type of a set-model, as a functor. -/
def SetModel.forget (T : GeometricTheory.{u} L) : SetModel T ⥤ Type u where
  obj M := M.carrier
  map {M N} f := TypeCat.ofHom (show M.carrier →[L] N.carrier from f)

-- conclusion of `exists_isClassifyingSite_fpModel`, with `e` named:
    ∃ (C : Type u) (_ : SmallCategory C) (e : C ≌ (FPModel T)ᵒᵖ)
      (U : CatStructure L (Sheaf (⊥ : GrothendieckTopology C) (Type u))),
        IsClassifyingSite T ⊥ U ∧
        Nonempty ((sheafToPresheaf ⊥ (Type u)).obj U.carrier ≅
          e.op.functor ⋙ unopUnop _ ⋙ ObjectProperty.ι _ ⋙ SetModel.forget T)
```

## R04 (P3) — 2.2 (b) takes Frobenius reciprocity from GrothendieckTopoi 1.2, which does not state it

**Location** `TauCetiRoadmap/ClassifyingTopoi/README.md` lines 470–472: "induction on `φ` in the frames `Subobject` of GrothendieckTopoi 1.2: meets distribute over joins, `Subobject.exists` commutes with joins and satisfies Frobenius reciprocity". The contract (lines 212–222) also omits GrothendieckTopoi 2.4, which line 400 cites.

**Claim** GrothendieckTopoi 1.2 states that the subobject lattices are frames and that `Subobject.exists f ⊣ pullback ⊣ ∀`. It does not state Frobenius reciprocity or stability under pullback (Beck–Chevalley), and these do not follow from the adjunctions. Mathlib has Frobenius reciprocity only along monomorphisms.

**Witness** GrothendieckTopoi §1.2 at its head 6b3158d; Mathlib `CategoryTheory/Subobject/Lattice.lean:442` (`exists_pullback_eq_inf_of_mono`). For the frame map `{0 < m < 1} → 2 × 2` with `m ↦ (1, 0)`: `∃(b ∧ f*m) = 0`, while `∃b ∧ m = m`.

**Repair** Replace "`Subobject.exists` commutes with joins and satisfies Frobenius reciprocity" with "`Subobject.exists` commutes with joins (1.2). Images are stable under pullback, since every epimorphism is the coequalizer of its kernel pair (1.2) and such coequalizers are universal (GrothendieckTopoi 1.4), so `Subobject.exists` satisfies Frobenius reciprocity and commutes with pullback along projections". Add GrothendieckTopoi 1.4 to the *Needs:* of 2.2, to the Dependencies of Layer 2 and to the contract. Add "2.4 (inverse images of continuous maps, for the Examples of Layer 1)" to the contract.

## R05 (P3) — the description miscounts its review points and calls the head unelaborated

**Location** Description, "Review": "Five points need checking:", followed by six bullets. "Acceptance test": "These changes have not been elaborated locally … so the worker's build check is the first run."

**Claim** The list has six points. The build has now run: at the pins the head elaborates with 27 `sorry` warnings.

**Witness** The bullets are: the Mac Lane–Moerdijk numbers, the interval theory, the category of 2.2, 3.6 (b), the definability of 2.4 and 3.5 (a′). The worker's gate at 997b188 reports `build=0 … OK`, and `lake env lean` gives exit 0 with 27 warnings.

**Repair** Write "Six points need checking:". Replace the text from "At the pins (Mathlib `1b1ccf4`, Tau Ceti `2fd255d`)" through "the worker's build check is the first run." with "At the pins (Mathlib `1b1ccf4`, Tau Ceti `2fd255d`), `lake env lean` gives 27 `sorry` warnings and no error, and no theorem closes by one tactic." After R04, add GrothendieckTopoi 1.4 and 2.4 to the list of consumed sections.

## Previous findings

- R01 (P1, route of 3.5 (a) through the geometric syntactic site): repaired. Line 541 now owns definability and separation in 2.4, and lines 781–792 route (a) through "the `[[φ]]` separate `E` (2.4)" and GrothendieckTopoi 6.5/6.6 (b). (c) cites "by 2.4, each irreducible object being a retract of some `[[χ]]`".
- R02 (P1, no owner of `[FPModel T, Set]` classifies `T`): repaired. (a′) `exists_isClassifyingSite_fpModel` was added at line 793, and (b), (c) and 3.6 cite it. LocallyPresentableCategories 1.5 now appears at lines 224, 847 and 978, and line 877 reads "by (a′) no formula presents it". What remains is R03.
- R03 (P2, 3.6 (a) in Lean): repaired. `Suggested.lean` lines 605–612 are the suggested statement verbatim, and docstring lines 36–40 are updated.
- R04 (P3, GrothendieckTopoi 1.2 cited for images): repaired. Lines 215 and 377 read "epimorphisms and coproducts", and line 378 adds Mathlib `HasImages (Sheaf J (Type u))`.
- R05 (P3, doubled list markers): repaired. Lines 814 and 907 begin "- (b)" and "- (a)".
- R06 (P3, description): partly repaired. The headline sentences now match the docstring, but the elaboration paragraph still describes the previous head. Carried as R05.

## Verified sound

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 `GeometricFormula`, Convention 2 | `ex (x₀ = x₁ * x₁)` in ℤ; torsion disjunction over `ULift ℕ` | 4 true, 2 false; binding `x₀` instead: true everywhere. Torsion at 1: ℤ/6 true (k = 5), ℤ false | holds | — |
| 1.2 `realize_hom` | ℤ ⊂ ℚ, `ex (x₀ * x₁ = 1)` at 2 | false in ℤ, true in ℚ (allowed); its negation would go true → false, so it is not geometric | holds | — |
| 1.2 `realize_toInf` | `bot`; torsion formula at 1 | no pair `⟨PEmpty, x⟩`: all branches `⊥`, both false; branch `⟨ULift ℕ, 5⟩` true in ℤ/6, none in ℤ | holds | — |
| 1.3 `interp`, `isModel_ofStructure_iff` | `{⊢ ∃ x, ⊤}` on `PEmpty`, `PUnit`; `x = 0 ∨ x = 0` on ℤ | `PEmpty`: interpretation `⊥`, `⊤ ≰ ⊥`, not a set-model; `PUnit` true on both sides. The image is `{0}`, the coproduct has 2 | holds | — |
| 1.4 `IsModel.map` | `{⊤ ⊢ x = c₀ ∨ x = c₁}` in `Bool`; `X ↦ X × X`, `X ↦ Bool × X` | `(false, true)` fails (not a left adjoint); `Bool × 1 = Bool`, so `map` is undefined (not left exact) | both hypotheses needed | — |
| 2.1 `IsClassifyingSite` | `{⊤ ⊢ bot}`, empty site; exactly one element on `Discrete Bool` | empty site: an inverse image forces `0 ≅ 1` in the target; `Discrete Bool`: (i) holds, no `α` at `(PUnit, PEmpty)`, so (ii) fails | the definition discriminates | — |
| 2.2 category; (b) `exists_interp_eq_iSup_exs` | commutative rings, `(x₀)` vs `(x₀ * x₀)`; `bot`; `and (ex θ) ψ` | identified on `(1, x² = x)`, not on `(1, ⊤)` (2 ≠ 4); `bot` gives `ι = PEmpty`; `ex (and θ ψ')` with `m = 1` | statement holds; Frobenius not supplied | R04 |
| 2.3 `exists_isClassifyingSite` | empty language; `Type u`-many 0-ary symbols; `.{0, 0, 1}` on `intervalTheory.{1}` | `J = ⊥` on `FinSetᵒᵖ`; distinct subterminals exceed every `u`-small set; the witness elaborates | holds | — |
| 2.3 Checks 2–3 | no axiom over `{p}` | set-models `(M, p)` for every `M`: `(PUnit, false) ≇ (Bool, false)`, with 2 maps between them; Sierpiński topos: 2 points | Checks false | R01 |
| 2.4 `exists_equivalence` | `{⊤ ⊢ bot}`; `G = ℤ/2` | degenerate topoi are equivalent; the generic torsor has 2 automorphisms, so the isomorphism is not unique | holds | — |
| 2.4 `exists_interp_eq_of_subobject` | topos of 3.2, `n = 0`; `Discrete Bool` without `hU` | subterminals `⊥`, `⊤`, `[N ≠ ∅]` = `bot`, `top`, `ex top`; `Discrete Bool`: 4 subterminals, 2 interpretations | holds; `hU` needed | R03 |
| 2.5 `exists_quotient_topology`, `exists_quotient_theory` | `T ∪ {⊤ ⊢ bot}`; `J' = J` | `J' = ⊤`, degenerate topos; `T' = T`, same models in every topos | holds | — |
| 2.6 `MoritaEquivalent` | objects vs decidable objects | `FinSet` vs `FinSet_mono`, both Cauchy complete, `Fin 2 → Fin 1` not mono: not equivalent (BorceuxDejean1986 line 99) | holds | — |
| 3.1 `isOfPresheafType_of_isHorn` | `commRingTheory`; `{⊤ ⊢ bot}`; local rings | Horn; not Horn but of presheaf type (empty category); `ℤ/2 × ℤ/2` not local, so no Horn axiomatization | hypothesis sufficient, not necessary | — |
| 3.2 `isClassifyingSite_genericObject` | object `3`; site `FinSet` vs `FinSetᵒᵖ` | carrier `Fin 3`; `Uⁿ = Hom(n, −)`; with `FinSet` as site, finite Boolean algebras (Stone) | holds | — |
| 3.3 `isClassifyingSite_genericTorsor` | `G` trivial; `𝔖₃` | `B 1 = Type u`; postcomposition natural, precomposition fails (`ab ≠ ba`) | holds | — |
| 3.3 `moritaEquivalent_torsorTheory_iff` | `ZMod 4` vs `ZMod 2 × ZMod 2` | one point each; automorphisms of the point = `G`; an element of order 4 only in the first; `SingleObj G` Cauchy complete | holds | — |
| 3.4 `isClassifyingSite_genericInterval` | `⦋0⦌`; `{0 < a, b < 1}`; one point | `δ 1 = 0`, `δ 0 = 1`; `(0, 1)` in the image of `(σ 0, σ 1)`, `(1, 0)` not; `a`, `b` incomparable; equalizer of vertices empty | holds | — |
| 3.5 `isOfPresheafType_iff_forall_covered` | `{⊤ ⊢ bot}`; object theory, `∃ y, ⊤` | both sides true (empty family epi onto `0 = 1`); `[[∃ y, ⊤]]` covered by `[[(1, ⊤)]]`, projection not split | holds | — |
| 3.5 `exists_isClassifyingSite_fpModel` | object theory; `{⊤ ⊢ bot}` | `FPModel` = finite sets, `C ≃ FinSetᵒᵖ`; the empty category, degenerate topos | holds; `U` free in Lean | R03 |
| 3.5 `isIrreducible_iff_exists_presentedBy` | object theory: `(0, ⊥)`, `(0, ∃ y, ⊤)`, `(2, x₀ = x₁)` | neither; neither (≥ 2 maps into `2`); both (`{a}`, `ξ = (a, a)`) | holds | — |
| 3.5 `exists_isPresentedBy_irreducible_of_isFinitelyPresentable` | `∅` (objects); `ℚ` (rings) | `∅` presented by `(0, ⊤)`, whose interpretation `Hom(∅, −)` is irreducible; `ℚ` not finitely generated, so excluded by `hM` | holds | — |
| 3.5 `nonempty_equivalence_irreducible_fpModel`, `isIdempotentComplete_irreducible` | torsors; idempotent theory | one object with endomorphisms `G` on both sides; `x ↦ f x` splits through the point, presented by `(1, f x = x)` | holds | — |
| 3.5 idempotents Check | `⊤ ⊢ f (f x) = f x`, `(2, ⊤)` | presents `{x, f x, y, f y}`: 4 elements, finitely presentable, isomorphic to neither model of the Check | Check false | R02 |
| 3.6 `exists_quotient_isSetModel_iff_isHomogeneous` | `J = ⊥`; empty sieve on `op ∅`; subsingleton `J` | `T' = T`; `J = ⊤`, no homogeneous set; homogeneous ⇔ `|M| ≤ 1` (SetModel.IsHomogeneous = Caramello2012Yoneda line 386) | holds | — |
| 3.6 `isSetModel_iff_isIrreducibleObject` | subsingleton `J` on `op ∅`, `op 1`, `op 2` | `∅`, `1` irreducible and homogeneous; `2`: the pullback along an injection excludes `𝟙`; one-tactic `simp` fails | holds without presheaf type | — |
| 4.1 `finitePresentation_of_isFinitelyPresentable` | `ℤ[1/2]`; `ℚ` | `ℤ[x]/(2x − 1)`: both sides true; `ℚ`: neither; Mathlib has only the converse (`FinitePresentation.lean:169`); `infer_instance` fails | holds, not in Mathlib | — |
| 4.1 `isClassifyingSite_genericRing` | `⟨1, ⊥⟩`; twist `x ↦ x + 1` | `Hom(ℤ[X], A) ≅ A`; the twist has zero `1` and sum `a + b − 1`, excluded by the body of `genericRing` | holds | — |
| 4.2 `isSheaf_forget_zariskiTopology` | zero ring; `ℤ` with `{2, 3}`; `{ℤ → ℤ[1/2]}` | empty sieve, one element; `ℤ` is the equalizer into `ℤ[1/6]`; `1/2` has no amalgamation, so not a cover | holds | — |
| 4.3 `isClassifyingSite_localRingTheory` | `ℤ`, `ℤ/4`, `ℤ/6`, `0` | `3` and `−2` not units; local; `3` and `4` not units; `0` excluded by `0 = 1 ⊢ bot` (empty cover) | holds | — |

- Source locators checked against the text: 24. Caramello2017Lattices lines 104, 471 (p. 14), 483, 638, 1285 (p. 37), 2321 (p. 65), 2393, 2417, 2430 (p. 68) and 2924–2941 (p. 81). Caramello2012Syntactic lines 93, 239, 249–265 (p. 182), 428, 457 (pp. 187–188), 495–525 (p. 189), 552 (p. 190) and 591 (p. 191). Caramello2012Yoneda lines 321, 335, 372 and 386. Caramello2014Extensions line 5095 (p. 110). BorceuxDejean1986 lines 99 (p. 134) and 134 (p. 135).
- Library declarations opened at the pins. Mathlib: `Algebra/Category/Ring/FinitePresentation.lean:169,175`, `Algebra/Category/CommAlgCat/FiniteType.lean:118`, `CategoryTheory/Sites/Limits.lean:214`, `Sites/Subsheaf.lean:275`, `Sites/Canonical.lean:103`, `Sites/LocallySurjective.lean:377`, `Subobject/Lattice.lean:442`, `AlgebraicGeometry/Sites/BigZariski.lean:51,57` and `AlgebraicGeometry/Scheme.lean:602`. Tau Ceti: `ModelTheory/Infinitary/Syntax.lean:77–149`, `Semantics.lean:117–158` and `AlgebraicGeometry/Sites/Big/StructureSheaf.lean:72,103`.
- Cross-roadmap citations resolved at the heads. GrothendieckTopoi (6b3158d): Conventions 1 and 4; 1.1, 1.2, 1.4, 2.1, 2.2 (`homEquivInverse`), 2.4, 2.5 (`IsFiltering`, `nonempty_geometricMorphism_equiv_isFiltering`), 4.1, 4.2, 6.1 (`nonempty_point_equivalence`), 6.5, and 6.6 (a)–(d) with both named theorems; the Checks of 2.2, 6.1, 6.5 and 6.6. LocallyPresentableCategories (c3ec7a6): 1.5, 3.1 and 3.5.
- Gate. The worker's gate at 997b188 reports every check 0, `build=0` included, `OK`; my rerun of the gate reports every check 0, `OK`. The dependency check gives `depcheck: 206 roadmaps, 1896 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- Elaboration: exit 0, 27 `sorry` warnings and nothing else. `#check @` on all 27 theorems: the binders match the README. The 7 binders flagged as dropped are false positives, since `[Category E]` is present. The Convention 1 witness `exists_isClassifyingSite.{0, 0, 1}` elaborates. One-tactic probes (`simp`, `simp_all`, `infer_instance`) fail on the three likeliest candidates, so there is no padding.
- Outside the folder, `git diff --stat origin/main...HEAD` is empty. No open pull request changes this roadmap, and no cited id is dropped.
- Ownership: a search of main and the open heads for classifying topoi, geometric theories, presheaf type, the object classifier and syntactic sites finds no other owner. AdicSpacesPartIV line 1670 is the only other mention on main.
- Overlap check: read GrothendieckTopoi, TotallyDistributiveTopoi, LocallyPresentableCategories, HomotopyTheoryOfCategories, HigherToposTheory and InfinitaryLogic. Shared objects and their owners: `B G` and `IsIrreducibleObject` are GrothendieckTopoi's (cited here, not restated); `Ind A` is LocallyPresentableCategories' (cited); `BoundedFormulaInf` is Tau Ceti's (cited); `IsPresheafTopos` is TotallyDistributiveTopoi's (not used here).

## Not verifiable

- Mac Lane–Moerdijk, VIII.2–VIII.8 and X.1–X.6 (1.1–4.3): the sources service reports DOI prefix 10.1007 as paywalled.
- Makkai–Reyes, LNM 611, pp. 272–297 (2.3): the sources service reports DOI 10.1007/BFb0066201 as paywalled.
- Johnstone, Elephant, D1.1–D1.4, D1.3.10 and D3.1: OUP has no open copy, and the service found none.
- Hakim 1972, Chapitre III, §3 (4.3): Springer, paywalled.
- Moerdijk 1995 and Joyal–Tierney 1984: cited for scope and research context only, not read.

## Source issues

- **Misprint** in Caramello2012Syntactic at §4, p. 189: the source says a finitely presented model needs generators but does not require them to satisfy the formula in the model; it should require it, since otherwise `⊥` presents every model; affects nothing.
- **Misprint** in Caramello2017Lattices at Definition 14.5, p. 68: the source states the same definition and also omits the requirement that the generators satisfy the formula; it should include it; affects nothing.
- **Misprint** in Caramello2014Extensions at Remark 6.27 (iii), p. 110: the source refers to "Remark 6.27(a)"; it should say Remark 6.27 (i), the parts being numbered (i)–(iii); affects nothing.
