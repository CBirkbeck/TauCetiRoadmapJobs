# Review of ClassifyingTopoi (pull request #1997 at fb294c4)

**Verdict:** needs changes

## R01 (P3) — formula weakening is used in 2.2 (b) and 2.3 but never defined, and its interpretation is never stated

**Location** `TauCetiRoadmap/ClassifyingTopoi/README.md` lines 530–531: "`and (ex θ) ψ` has the normal form `ex (and θ ψ')`, with `ψ'` the weakening of `ψ` to `Fin (n + 1)`". Also line 542 ("`ψ'` the weakening of `ψ`") and line 547 ("`χ'` the weakening of `χ`").

**Claim** 1.1 defines `GeometricFormula` with no relabelling of variables, and 1.2–1.4 state no lemma for the realization or interpretation of a relabelled formula. The `and` case of 2.2 (b) has to merge two contexts. It, the 2.2 Check and the 2.3 route therefore use an operation and a pullback lemma that no target owns.

**Witness** In the README, "relabel" occurs only for terms (lines 183, 316, 321, 342–343), and "weakening" only at lines 531, 542 and 547. `Suggested.lean` declares no formula relabelling. 1.1 (lines 280–288) defines only the constructors and `bot`.

**Repair** At the end of 1.1, after "a sequent `φ ⊢ ψ` plays the role of `∀ x, φ → ψ`.", add: "Define `GeometricFormula.relabel` along `g : Fin n → Fin m`. Terms are relabelled by `Term.relabel g`, and under `ex` along the extension of `g` that sends the last variable to the last variable. The weakening of `φ` to `Fin (n + k)` is `φ.relabel (Fin.castAdd k)`." In 1.2 add: "`(φ.relabel g).Realize x ↔ φ.Realize (x ∘ g)`, by induction on `φ`." Add an API bullet to 1.4: "for every structure `M` in `Sheaf K (Type u)` of a small site, `M.termMap (t.relabel g) = Pi.lift (fun i => Pi.π _ (g i)) ≫ M.termMap t` and `M.interp (φ.relabel g) = (Subobject.pullback (Pi.lift fun i => Pi.π _ (g i))).obj (M.interp φ)`, by induction on `φ`; the `iSup` and `ex` cases use that images and coproducts are stable under pullback (GrothendieckTopoi 1.2, 1.4)." Then cite this bullet in the *Needs:* lines of 2.2 and 2.3. On `ℤ` in `Type u` it gives the expected answer: the weakening of `equal (var 0) 0` to `Fin 2` is interpreted as `{(x₀, x₁) | x₀ = 0}`, the preimage of `{0}` under the first projection.

## R02 (P3) — 4.1 `finitePresentation_of_isFinitelyPresentable` has no locator

**Location** `TauCetiRoadmap/ClassifyingTopoi/README.md` lines 1053–1056: "a commutative ring that is `IsFinitelyPresentable.{u}` in `CommRingCat.{u}` is a finitely presented `ℤ`-algebra, the converse of `CommRingCat.isFinitelyPresentable_under` over `ℤ` (…identity factors)."

**Claim** This is a headline of `Suggested.lean`, but no source is cited for it. Mathlib at the pin proves only the other direction.

**Witness** Stacks Project, Tag 00QO (Lemma 10.127.3): for a ring map `R → S`, finite presentation is equivalent to `Hom_R(S, −)` commuting with directed colimits. Mathlib `Algebra/Category/Ring/FinitePresentation.lean:169, 175` proves only the forward direction.

**Repair** Replace "through which its identity factors)." with "through which its identity factors; Stacks Project, Tag 00QO, Lemma 10.127.3, (2) ⇒ (1) for `ℤ → S`, directed systems in `Type u` being filtered diagrams)." Add to References: "- The Stacks Project, Tag 00QO (Algebra, Lemma 10.127.3)."

## R03 (P3) — the Scope says AdicSpacesPartIV is the only other roadmap that mentions a classifying topos

**Location** `TauCetiRoadmap/ClassifyingTopoi/README.md` lines 61–62: "and the only other mention, AdicSpacesPartIV, uses the classifying topos of a profinite Galois group as an example."

**Claim** Other roadmaps also mention a classifying topos. None of them owns classifying topoi of geometric theories, so ownership is unaffected, but the sentence is false.

**Witness** AlgebraicModuliForArithmeticGeometry README line 7163: "On the classifying topos of `C₂`, use constant coefficients…". HomotopyTheoryOfCategories README line 66: "the classifying topos of a group | GrothendieckTopoi | not used".

**Repair** Replace the quoted clause with: "and the other roadmaps that mention a classifying topos (AdicSpacesPartIV, AlgebraicModuliForArithmeticGeometry, HomotopyTheoryOfCategories) mean the classifying topos of a group, as an example or as GrothendieckTopoi's object."

## Previous findings

- R01 — repaired. The description now reads "The README's supplier contracts consume, by roadmap name and section:", and the list matches the From GrothendieckTopoi and From LocallyPresentableCategories contracts (README lines 236–256).
- R02 — repaired. The description now reads "The last commit changes only the README: the supplier contracts, the *Needs:* lines, Scope and the layer Dependencies…" and "`lake env lean` on it gives 27 `sorry` warnings and no error". `git log` confirms that fb294c4 touches only `README.md`, and `Suggested.lean` is unchanged since 6e9cb0f.

## Verified sound

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 `GeometricFormula`, `bot` | `bot`; torsion `iSup` over `ULift ℕ` | `bot` realizes `∃ i : PEmpty, …`, false; torsion holds at all 6 elements of `ℤ/6`, only at `0` in `ℤ` | holds | — |
| 1.2 `realize_hom` | `ℤ ⊆ ℚ`, `ex (x₀·x₁ = 1)` at `2` | false in `ℤ`, true in `ℚ`: positive formula goes up; its negation would go true → false | holds | — |
| 1.2 `realize_toInf` | `bot` (`ι = PEmpty`); torsion formula at `1` in `ℤ/6` | no pair `⟨PEmpty, x⟩`, all branches `⊥`, false; branch `⟨ULift ℕ, 5⟩` realized. Tau Ceti `realize_iSup`, `realize_bot`, `realize_ex` (Semantics.lean:117, 138, 158) | holds | — |
| 1.3 `isModel_ofStructure_iff` | `{⟨0, top, ex top⟩}` on `PEmpty`, `PUnit`; `equal (var 0) (var 1)` on `Bool` | fails on `PEmpty`, holds on `PUnit`, on both sides; interpretation is the diagonal, 2 of 4 pairs | holds | — |
| 1.4 `IsModel.map` | `X ↦ X × X`; `X ↦ Bool × X`; degenerate topos | `(false, true)` breaks `x = c₀ ∨ x = c₁`; terminal object not preserved, so `map` is undefined; degenerate: `⊤ = ⊥` | both hypotheses needed | — |
| 2.1 `IsClassifyingSite` | `{⊤ ⊢ bot}`; `(Discrete Bool, ⊥)` with `U` terminal, "exactly one element" | empty site classifies, one-point site does not (subterminals `∅`, `PUnit`); (i) holds, (ii) fails: no `PUnit ⟶ PEmpty` | discriminates | — |
| 2.2 classifying category | empty theory over empty language; `commRingTheory` | `(n,⊤) ⟶ (m,⊤)` are the maps `Fin m → Fin n`, so ≃ `FinSet`ᵒᵖ; hom-sets `ℤ[x]/(x²−x)` and `ℤ[x]` (`2 ≠ 4` at `x = 2`) | holds | — |
| 2.2 (b) `exists_interp_eq_iSup_exs` | `and (ex θ) ψ`; local-ring axiom; universes | Frobenius in `Type`: `(∃y θ) ∧ ψ ↔ ∃y (θ ∧ ψ')`; index `ULift Bool`, `m = 1`; `ι` from `PUnit`, `×`, `Σ` stays in `Type u` | holds; `and` case needs relabelling | R01 |
| 2.3 `exists_isClassifyingSite` | 0-ary symbols indexed by `Type u`; empty theory; `.{0,0,1}` | subterminals of `Sheaf J (Type u)` are u-small, so the site needs `Type (u+1)`; `J = ⊥`; `exists_isClassifyingSite.{0,0,1} intervalTheory.{1}` elaborates | holds | — |
| 2.3 route, source | Caramello2017Lattices p. 81, Theorem 17.6 proof | page shows "by Proposition D1.3.10 [10]", with axioms `ψ ⊢ ⋁ (∃xᵢ) θᵢ`, `ψ`, `θᵢ` cartesian | supports | — |
| 2.4 `exists_equivalence` | `ℤ/2` torsor; `{⊤ ⊢ bot}` | 2 automorphisms of the generic torsor (central `k`), so existence only is stated; all degenerate topoi equivalent | holds | — |
| 2.4 `exists_interp_eq_of_subobject` | topos of 3.2, `n = 0`; `(Discrete Bool, ⊥)` | 3 subterminals = `bot`, `top`, `ex top`; non-classifying site: 4 subterminals, 2 definable | holds; `hU` needed | — |
| 2.5 `exists_quotient_topology`, `exists_quotient_theory` | `T ∪ {⊤ ⊢ bot}`; subsingletons over objects | `J' = ⊤`, degenerate; Sierpiński topos, points `PEmpty`, `PUnit`. Thm 3.6 p. 15, Rem 3.7 p. 19 (Caramello2017Lattices lines 483, 638) | holds | — |
| 2.6 `MoritaEquivalent` | objects vs decidable objects; one-element theory vs trivial-group torsors | homs: all maps vs injections; `FinSet`, `FinSet_mono` Cauchy complete, `Fin 2 → Fin 1` not mono; Def 3.5 p. 14 | holds | — |
| 3.1 `isOfPresheafType_of_isHorn` | `ℤ/2 × ℤ/2`; `torsorTheory`; `{⊤ ⊢ bot}` | at `(1,0)` neither `x` nor `1−x` is a unit; torsors are of presheaf type, not Horn; degenerate topos is a presheaf topos | sufficient only, as stated | — |
| 3.2 `isClassifyingSite_genericObject` | object `3`; variance | value `Fin 3`; `n`-th power = representable of `n`; presheaves on `FinSet` = functors on finite Boolean algebras, which classify Boolean algebras | holds | — |
| 3.3 `isClassifyingSite_genericTorsor` | `𝔖₃`; `ℤ/2` on one point; `comp_as_mul` (SingleObj.lean:76) | `x ≫ (g*h) = g*h*x = (x ≫ h) ≫ g`; precomposition not natural; trivial action not free | holds | — |
| 3.3 `moritaEquivalent_torsorTheory_iff` | `ZMod 4` vs `ZMod 2 × ZMod 2`; trivial `G` | order-4 element only in the first; one point each, automorphism group `G` separates; trivial: `B G = Type u` | holds | — |
| 3.4 `isClassifyingSite_genericInterval` | `σ 0, σ 1 : ⦋2⦌ → ⦋1⦌`; `{0 < a, b < 1}`; one-point set | `σ0 = (0,0,1)`, `σ1 = (0,1,1)`; image of `(σ0,σ1)` is `{f ≤ g}` via `a = f + g`; vertex equalizer empty | holds | — |
| 3.5 (a) `isOfPresheafType_iff_forall_covered` | `{⊤ ⊢ bot}`; objects, `(0, ∃y ⊤)` | degenerate: empty sieve canonical, no irreducible, empty family epi onto initial = terminal, both sides true; `∃y ⊤` covered by `(1,⊤)`, not split | holds | — |
| 3.5 (a′) `exists_isClassifyingSite_fpModel` | idempotent `f(fx) = fx`; `{⊤ ⊢ bot}`; objects | free model on `n` generators: `2n` elements, one-point retract splits only in `FPModel`; empty `FPModel` gives degenerate topos; finite sets give 3.2 | holds | — |
| 3.5 (b) `isIrreducible_iff_exists_presentedBy` | objects, `(0, bot)`; source definitions | `bot` not irreducible (empty family); presents nothing since `φ.Realize ξ` is required; without it `bot` would present `PUnit` vacuously | holds | — |
| 3.5 (c) `exists_isPresentedBy_irreducible_of_isFinitelyPresentable` | `ℚ`, `ℤ[1/2]` for rings | `ℚ` not finitely generated, so not finitely presentable, no formula; `(1, (1+1)x₀ = 1)` presents `ℤ[1/2]` | holds | — |
| 3.5 (d) `nonempty_equivalence_irreducible_fpModel`, `isIdempotentComplete_irreducible` | torsors; intervals | one object, automorphisms `G`; `Δ[0]`, `Δ[1]` irreducible, `∂Δ[1]` disconnected; Caramello2012a Thm 4.3 p. 190 | holds | — |
| 3.6 (a) `exists_quotient_isSetModel_iff_isHomogeneous` | empty sieve on `op ∅`; sieve on `op 2` through `2 → 1` | `J = ⊤`, no homogeneous set; homogeneous iff `|M| ≤ 1`; Cor 4.9 (Caramello2012b line 386) is the Lean condition | holds | — |
| 3.6 (b) `isSetModel_iff_isIrreducibleObject` | `n ≥ 2` with injection `2 → n`; `ℤ/6`, `ℤ/4` Zariski | pulled-back sieve misses `𝟙_n`, so only `∅`, `1` irreducible; `ℤ/6`: localizations at `3`, `4` (`3 + 4 = 1`); `ℤ/4` local | holds from `hT'` alone | — |
| 4.1 `isClassifyingSite_genericRing` | 2×2 matrices; shift `x ↦ x + 1` | `E₁₂E₂₁ = E₁₁ ≠ E₂₂`; shifted ring object has zero `1`, sum `a + b − 1`; operations pinned by `genericRing` | holds | — |
| 4.1 `finitePresentation_of_isFinitelyPresentable` | Mathlib pin; Stacks 00QO | pin has only finitely presented ⇒ `IsFinitelyPresentable`; Lemma 10.127.3, (2) ⇒ (1), is the converse | holds; no locator | R02 |
| 4.2 `isSheaf_forget_zariskiTopology` | zero ring; `{ℤ[1/2], ℤ[1/3]}`; `{ℤ[1/2]}` | empty cover, value of size 1; `ℤ` = equalizer of `ℤ[1/2] × ℤ[1/3] ⇉ ℤ[1/6]`; single map would force `ℤ ≅ ℤ[1/2]` | holds | — |
| 4.3 `isClassifyingSite_localRingTheory` | `ℤ`, `ℤ/6` at `3`; zero ring | `3`, `−2` non-units; `3`, `4` non-units in `ℤ/6`; `0·0 = 1` in zero ring, excluded by `0 = 1 ⊢ bot` | holds | — |
| Conventions 4, 5 | 2-cells of `B G` (GrothendieckTopoi 2.2, Checks) | `F = f.inverse ⟶ g.inverse = G` is a 2-cell `g ⟶ f` (GrothendieckTopoi Convention 4); both endomorphism groups ≅ `G`, right multiplications | consistent | — |

- Source locators checked against the text: 25. Caramello2017Lattices (arXiv:0905.0299v1): §2.1 p. 5, Def 3.5 p. 14, Thm 3.6 p. 15, Rem 3.7 p. 19, Thm 5.1 p. 37, Rem 14.2 p. 65, Thm 14.4 p. 67, Def 14.5 and §14.2 p. 68, Thm 17.6 p. 81. Caramello2012a (TAC 26 no. 6): Def 3.1 (c) and Lemma 3.2 p. 182, Thm 3.13, Cor 3.15, §4 p. 189, Thms 4.1 (i) and 4.3. Caramello2012b (arXiv:0805.2187v1): Def 4.4, Thms 4.6 and 4.8, Cor 4.9. Caramello2014 (arXiv:1404.4610v2): Rem 6.27 (i) p. 110. BorceuxDejean1986: Thm 1 (2)–(4) p. 134, Prop 2 p. 135.
- Library declarations opened at the pins. Mathlib: `Algebra/Category/Ring/FinitePresentation.lean:169, 175`, `Algebra/Category/CommAlgCat/FiniteType.lean:118`, `AlgebraicGeometry/Sites/BigZariski.lean:51, 57`, `AlgebraicGeometry/Scheme.lean:602`, `CategoryTheory/Sites/InducedTopology.lean:50`, `CategoryTheory/Presentable/Finite.lean:49`, `CategoryTheory/SingleObj.lean:76`, `CategoryTheory/FintypeCat.lean:169, 216`, `ModelTheory/Basic.lean:76`. Tau Ceti: `AlgebraicGeometry/Sites/Big/StructureSheaf.lean:72, 103`, `ModelTheory/Infinitary/Syntax.lean:75–149`, `Semantics.lean:117–158`.
- Cross-roadmap citations resolved: 28. GrothendieckTopoi at 6b3158d: Conventions 1 and 4; 1.1, 1.2, 1.4, the Examples of Layer 1, 2.1, 2.2, 2.4, 2.5, 4.1, 4.2, 6.1, 6.5, 6.6; and the 10 names cited (`IsGrothendieckTopos` … `isIrreducibleObject_iff_projective_preservesCoproducts`). LocallyPresentableCategories at 7c83474: 1.5, 3.1, 3.5. No supplier gaps are declared.
- Gate rerun at fb294c4: every check 0, OK. The worker's run also reports `build=0`. Depcheck: `depcheck: 206 roadmaps, 1896 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. `git diff --stat origin/main...HEAD` outside the folder is empty.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with 27 `sorry` warnings and nothing else. One-tactic probe on a scratch copy (`rfl`, `infer_instance`, `simp`, `aesop`, `intro; simp_all`): 0 of 27 close.
- Signatures: the 7 binders the worker flags as dropped (`[Category.{v} E]` on `CatStructure.pow` … `CatStructure.map`) are present as `inst : Category`, so these are false positives. `#check @isSetModel_iff_isIrreducibleObject` matches README 3.6 (b).
- Overlap check: read GrothendieckTopoi, TotallyDistributiveTopoi, LocallyPresentableCategories, HomotopyTheoryOfCategories, HigherToposTheory and InfinitaryLogic (main). Shared objects and their owners: `B G` (GrothendieckTopoi, Examples of Layer 1; compared via Convention 5), `Ind A` (LocallyPresentableCategories 1.5), irreducible objects (GrothendieckTopoi 6.6) and `BoundedFormulaInf` (InfinitaryLogic, now Tau Ceti). All are cited, not restated. No open pull request changes this roadmap or drops an id it cites.

## Not verifiable

- Mac Lane–Moerdijk, VIII.2–VIII.6, VIII.8, X.1–X.3, X.5–X.6 with page ranges, and Proposition VIII.5.1: the Springer chapter pages redirect to a login, and the nLab page lists no section pages.
- Johnstone, Elephant, D1.1, D1.2, D1.4 and D3.1: paywalled (OUP), with no open copy. D1.3.10 was checked only through Caramello2017Lattices p. 81.
- Makkai–Reyes, LNM 611, pp. 272–297: paywalled (Springer).
- Hakim 1972, Chapitre III, §3, pp. 41–49: paywalled (Springer).

## Source issues

- **Gap** in Caramello2017Lattices at Definition 14.5, p. 68 (Caramello2017Lattices line 2417): the source says a model is presented by `φ` when generators `ξ` exist with unique maps to every `b` satisfying `φ`, but does not require `ξ` itself to satisfy `φ`; it should require `ξ ∈ [[φ]]_M`; affects a stated result (with `φ = ⊥`, every model is presented, contradicting "at most one up to isomorphism").
- **Gap** in Caramello2012a at §4, definition of a finitely presented model, p. 189 (Caramello2012a line 501): the same omission, the generators are not required to satisfy `φ`; it should require `(ξ₁, …, ξₙ) ∈ [[φ]]_M`; affects a stated result (Theorem 4.1 (i) would make `⊥` irreducible in the theory of objects, which it is not).
