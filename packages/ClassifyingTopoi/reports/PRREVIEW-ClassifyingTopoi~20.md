# Review of ClassifyingTopoi (pull request #1997 at 5edce8c)

**Verdict:** needs changes

## R01 (P3) — the new route of 2.4 re-proves and under-declares what it takes from GrothendieckTopoi 1.2 and 1.4, and `Shrink` is not in the Mathlib contract

**Location:** `TauCetiRoadmap/ClassifyingTopoi/README.md` lines 765–767, "since each `U.pow n` has a `u`-small set of subobjects, a subobject of a sheaf being determined by its sets of sections"; the *Needs:* line of 2.4, lines 793–797, "2.1; GrothendieckTopoi 2.5; Mathlib … `Shrink`, `AsSmall`"; Dependencies of Layer 2, lines 901–902.

**Claim:** The route of `IsClassifyingSite.exists_interp_eq_of_subobject` uses well-poweredness, the joins of the frames of subobjects, epimorphic families and their stability under pullback (so that `K` is a topology on `D`). The first is restated instead of cited; none is on the *Needs:* line; `Shrink` is absent from "From Mathlib".

**Witness:** GrothendieckTopoi (open head) 1.2: "`IsGrothendieckTopos.wellPowered` (`WellPowered.{u} E`)", frames of subobjects, jointly epimorphic = effective epimorphic; 1.4: universal coequalizers. `Shrink` occurs in this README only at lines 775 and 796. Mathlib `Logic/Small/Defs.lean:51`.

**Repair:**
- Lines 765–767: "…a small one up to isomorphism, since each `U.pow n` has a `u`-small set of subobjects (GrothendieckTopoi 1.2, `IsGrothendieckTopos.wellPowered`) (Caramello 2012a, …)".
- *Needs:* of 2.4: "…; 2.1; GrothendieckTopoi 1.2 (`IsGrothendieckTopos.wellPowered`, the joins of the frames of subobjects, jointly epimorphic families), 1.4 (universal coequalizers: epimorphic families are stable under pullback, so `K` is a topology), 2.5; Mathlib `GrothendieckTopology`, `Sheaf`, `Equivalence`, `Subobject`, `WellPowered`, `Shrink`, `AsSmall`, `yoneda`, `presheafToSheaf`."
- "From Mathlib", Categories and examples: add "`Shrink` (`Logic/Small/Defs`) and `WellPowered` (`CategoryTheory/Subobject/WellPowered`), for the small site of definable objects of 2.4".
- "From GrothendieckTopoi": in 1.2 add "and `IsGrothendieckTopos.wellPowered`, for 2.4"; in 1.4 read "for 1.4, 2.2 (b) and 2.4".
- Dependencies of Layer 2: "the definability statement of 2.4 uses GrothendieckTopoi 1.2, 1.4 and 2.5 and no other target of the layer".

## Previous findings

- R01 — repaired: README 347–356 has the three Checks, "The empty and the binary disjunction are coherent: `bot`, over `PEmpty` …", "the disjunction over `ULift ℕ` of copies of `top` is not coherent", "Coherence passes to subformulas: `and top χ` …".
- R02 — repaired: the contract (275–279) reads "and the essential points of `Cᵒᵖ ⥤ Type u` forming `Idempotents.Karoubi C`), for 3.3 and 3.5; 6.6 (…), for 3.5 and 3.6"; the *Needs:* line of 3.3 (971–972) has "`IsIdempotentComplete`, `Idempotents.Karoubi`, `Idempotents.toKaroubi_isEquivalence`, `SingleObj.toEnd`".
- R03 — repaired: Downstream consumers (1374–1380) lists "1.1, 1.3 and 1.4 (…); 2.1; 2.4 (`IsClassifyingSite.exists_equivalence`); 2.5 (… both stated in every universe); and 2.6", and "the Checks of 2.5, 3.2 and 4.1–4.3". It agrees with ToposTheoreticBridges (open head) lines 81, 119–131, 451, 467–481.

## Verified sound

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 `GeometricFormula.IsCoherent` and its Checks | `bot`; `iSup` over `ULift ℕ` of `top`; `and top χ`; `torsorTheory G` | `Finite PEmpty ∧ ∀ i : PEmpty, …` true; `¬Finite (ULift ℕ)` false, realized everywhere; `True ∧ False`; transitivity axiom over `G`: `ZMod 2` finite, `ℤ` not | Checks discriminate | — |
| 1.4 `CatStructure.IsModel.map` | `X ↦ X × X`; `X ↦ Bool × X`; empty site | constants `(f,f)`, `(t,t)`, element `(f,t)` neither: not a model; terminal goes to `Bool`; `⊤ = ⊥` | both hypotheses needed | — |
| 1.5 `exists_morleyization` | `φ = falsum.imp falsum` in context 0 with `R_φ = False`; `χ = φ.imp ψ`, `ψ.imp φ`; `falsum.all` | only `⊤ ⊢ R_φ ∨ R_falsum` fails; `R_χ = True`, `¬R_ψ` satisfy their three sequents; `falsum` in context 1 is not `φ` | Check holds; `T'` coherent (`PEmpty`, `Bool`) | — |
| 2.1 `IsClassifyingSite` | `{⊤ ⊢ bot}` on the empty site; `(Discrete Bool, ⊥)`, `U` terminal | models exist only in degenerate topoi, one functor, one transformation; no `F ⟶ G` at `(PUnit, PEmpty)` but a homomorphism: (ii) fails | definition separates | — |
| 2.2 classifying category | `(1, x₀² = x₀) ⟶ (1, top)` against `(1, top) ⟶ (1, top)` for rings | `ℤ[x]/(x² − x)` against `ℤ[x]`; `2 ≠ 4` in `ℤ` | identification depends on source | — |
| 2.3 `exists_isClassifyingSite` | relation symbols `Type u`; two symbols | subterminals of `Sheaf J (Type u)`, `C : Type u`, are `u`-small; `Type u` distinct subterminals needed; two symbols: models `2 × 2`, presheaves on it | universe needed | — |
| 2.4 `exists_equivalence` | `G = ℤ/2`; `{⊤ ⊢ bot}` | two isomorphisms `U.map 𝟭 ≅ U`; all degenerate topoi equivalent | holds | — |
| 2.4 `exists_interp_eq_of_subobject`, every universe | route: site `D` of definable objects, `K` epimorphic families; object classifier, context 0; `(Discrete Bool, ⊥)`; `L : Language.{1,0}`, `u = 0` | `D` has finite limits, images (`ex`), `u`-small joins (`iSup`); `a∘y` preserves them, so `V.interp φ = a y(n, [[φ]])`; (i) on `(D,K)` and (ii) on `(C,J)` give `g f ≅ 𝟭`; subterminals `⊥`, `[N ≠ ∅]`, `⊤` = `bot`, `ex top`, `top`; 4 subterminals against 2 definable; one-point site, `⊥`, `⊤` | route sound; supplier lines short | R01 |
| 2.5 `exists_quotient_topology`, `exists_quotient_theory` | `T ∪ {⊤ ⊢ bot}`; subsingletons; one-point site in `Type 0`; source proof | `J' = ⊤`; Sierpiński topos, points `PEmpty`, `PUnit`; `J' ∈ {⊥, ⊤}` gives `T`, `T ∪ {⊤ ⊢ bot}` in `GeometricTheory.{0}`; Car09 lines 532–559 | holds in every universe | — |
| 3.1 `isOfPresheafType_of_isHorn` | `ℤ/2 × ℤ/2`, `x = (1, 0)`; `{⊤ ⊢ bot}` | neither `x` nor `1 − x` a unit: local rings not Horn; `bot` not Horn, topos still presheaf | sufficient, not necessary | — |
| 3.2 `isClassifyingSite_genericObject` | object `3`; site `FintypeCat.Skeleton` instead of its opposite | `Fin 3`; functors on `FinSetᵒᵖ` = finite Boolean algebras: classifies Boolean algebras | variance pinned | — |
| 3.3 `isClassifyingSite_genericTorsor`, `moritaEquivalent_torsorTheory_iff` | `ZMod 4`, `ZMod 2 × ZMod 2`; `𝔖₃`; trivial `G` | order-4 element against none; `(g * h)·x = x ≫ (g * h) = g·(h·x)`, `ab ≠ ba`; `B 1 = Type u` | holds | — |
| 3.5 (a)–(d), every universe | objects: `(0, ∃ y, ⊤)`, `(0, ⊥)`; idempotent theory; `{⊤ ⊢ bot}` | `M ≠ ∅` has ≥ 2 maps to a 2-element set: not presented, not irreducible; free model on `n` has `2n` elements, one-point model a retract of `{x, f x}`; `FPModel` empty | agrees with Car12a 3.15, 4.1 (i), 4.3 | — |
| 3.6 (a), (b) | `J = ⊥`; empty sieve on `op ∅`; sieve `h 0 = h 1` on `op 2`; Zariski | `T' = T`; `J = ⊤`, no homogeneous set; homogeneous iff `|M| ≤ 1`, irreducible: `∅`, `1`; `ℤ/4`, `ℤ/3` irreducible, `ℤ`, `ℤ/6` not (`3`, `4` non-units) | (b) holds with no extra hypothesis: `y = 𝟙_M` splits a member; pullback along `y^op` maximal | — |
| 4.1 `isClassifyingSite_genericRing`, `finitePresentation_of_isFinitelyPresentable` | `⟨0, ⊥⟩`, `⟨0, ⊤⟩`, `⟨1, ⊥⟩`; `x ↦ x + 1` transport | `ℤ`, zero ring, `ℤ[X]`; second ring object with zero `1`, sum `a + b − 1` | operations pinned; Stacks 00QO (2) ⇒ (1) | — |
| 4.3 `isClassifyingSite_localRingTheory` | `ℤ` at `x = 3`; zero ring; `ℤ/6` | `3`, `−2` non-units; `0 · 0 = 1` holds, excluded by `0 = 1 ⊢ bot`; `3`, `4` non-units | holds | — |
| one-tactic probe, all 28 theorems | `first \| rfl \| infer_instance \| simp_all \| trivial \| exact ⟨_, rfl⟩ \| tauto` | 28 errors, 0 closed | no padding | — |

- Gate at 5edce8c, rerun: every check 0, OK. Dependency check output: `depcheck: 245 roadmaps, 2229 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. Nothing changes outside the folder.
- Elaboration: `lake env lean` on `Suggested.lean` gives 28 `sorry` warnings and nothing else. `#check @` on six declarations (2.4 definability, 2.5 converse, 3.5 (a), (c), 3.6 (a), 1.4) agrees with the README; the 7 "dropped `[Category.{v} E]`" leads are declarations on `Sheaf J (Type u)` whose type does not mention `E`.
- Source locators checked against the text, 27: Car09 (arXiv:0905.0299v1) §2.1 line 104, Def. 3.5 p. 14 line 471, Thm 3.6 line 483 and proof 532–559, Rem. 3.7 line 638, Thm 5.1 p. 37 line 1285, Rem. 14.2 p. 65 line 2321, Thm 14.4 p. 67 line 2393, Def. 14.5 and §14.2 p. 68 lines 2414–2432, proof of Thm 17.6 p. 81 lines 2924–2941; Car12a Def. 3.1 (c) line 239, Lemma 3.2 and proof p. 182 lines 249–265, Thm 3.13 line 428, Cor. 3.15 line 457, §4 p. 189, Thm 4.1 (i) line 555, Thm 4.3 line 591; Car08 Def. 4.4 line 321, Thm 4.6 line 335, Thm 4.8 line 372, Cor. 4.9 line 386; Car14 Rem. 6.27 (i) line 5095; BD86 Thm 1 (2)–(4) p. 134 lines 99–106, Prop. 2 p. 135 line 134; Stacks00QO line 14610.
- Library declarations opened at the pins, 16: Tau Ceti `ModelTheory/ModelExistence/Morleyization.lean:80, 88, 117, 142`, `ModelTheory/Infinitary/Semantics.lean:168`, `AlgebraicGeometry/Sites/Big/StructureSheaf.lean:72, 103`; Mathlib `Idempotents/Karoubi.lean:231`, `CategoryTheory/SingleObj.lean:102`, `Sites/Sheaf.lean:438`, `Sites/InducedTopology.lean:50`, `Sites/Canonical.lean:103`, `Algebra/Category/Ring/FinitePresentation.lean:169, 175`, `Algebra/Category/CommAlgCat/FiniteType.lean:118`, `AlgebraicGeometry/Sites/BigZariski.lean:57`, `Logic/Small/Defs.lean:51`. No pinned declaration states a target of `Suggested.lean`; the three same-name leads (`Realize`, `IsIrreducible`, `FPRing.Ring`) are unrelated objects.
- Cross-roadmap citations resolved, 22: GrothendieckTopoi (open head) Conventions 1 and 4, 1.1, 1.2, 1.4, Examples of Layer 1, 2.1, 2.2 (`GeometricMorphism.homEquivInverse`), 2.4, 2.5, 4.1, 4.2, 6.1, 6.5, 6.6; LocallyPresentableCategories (open head) 1.5, 3.1, 3.5; InfinitaryModelExistence (main) 5.1, 5.2; ToposTheoreticBridges (open head) Layer 4.
- Overlap check: read ToposTheoreticBridges, GrothendieckTopoi, TotallyDistributiveTopoi, LocallyPresentableCategories (open) and InfinitaryModelExistence (main); nothing shared. Geometric theories, classifying sites and Morita equivalence of theories are owned here and cited by ToposTheoreticBridges; no other `Suggested.lean` declares `GeometricFormula`, `CatStructure`, `IsClassifyingSite`, `MoritaEquivalent`, `FPRing` or `zariskiTopology`.
- The pull request's text against the head: 28 theorems, the module form, the pins `1b1ccf4` and `2fd255d`, the suppliers and the universe sentences agree; no sentence is contradicted.
- Source independence: 10 passages compared with 6 sources, none shared; largest share Elephant, 15 of 55 locators (Caramello 2017: 13; Mac Lane–Moerdijk: 11); contents compared with Car09 (the largest readable share) and with the public section titles of Elephant D1 and D3: independent. The text of Elephant and of Mac Lane–Moerdijk could not be read.

## Not verifiable

- Johnstone, *Sketches of an Elephant*, D1.1, D1.2, D1.3.10, D1.4, D1.5.13, D3.1: paywalled (OUP), no open copy; D1.3.10 is confirmed only through its use in Car09, proof of Theorem 17.6.
- Mac Lane–Moerdijk, VIII.2–VIII.6, VIII.8, Proposition VIII.5.1, X.1–X.3, X.5–X.6 with their page ranges: paywalled (Springer); the page ranges of VIII.6 and VIII.8 in particular were not confirmed.
- Makkai–Reyes, LNM 611, pp. 272–297, and Hakim 1972, Chapitre III, §3, pp. 41–49: paywalled (Springer).

## Source issues

- none

## For the human reviewers

- **Not tested.** Elephant has the largest share of the locators (15 of 55) and Mac Lane–Moerdijk 11; neither text could be read, so the wording of 1.1–1.5, 2.1–2.3 and 3.2–3.4 and the page ranges were not compared with them.
- **Scope.** The route of 2.4 (the site of definable objects of a classifying site, `TauCetiRoadmap/ClassifyingTopoi/README.md` lines 771–792) is the roadmap's own argument; the cited sources prove definability only on the syntactic site. A specialist's reading is what the description asks for.
