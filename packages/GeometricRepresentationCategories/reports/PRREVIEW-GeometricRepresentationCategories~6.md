# Review of GeometricRepresentationCategories (pull request #2579 at 5979b2e)

**Verdict:** accepted

**Summary.** Accepted: no finding. This is a full review of the head that restores the layers and items of the roadmap on main: every item of R1 to R5 at the merge base is present under its id with its statement, the completed items name declarations that exist at the pinned Tau Ceti, every Check was recomputed and holds, and all 22 source locators agree with the texts. There are two small corrections (the description calls `Suggested.lean` unchanged although the pull request removes its 28 declarations; §2.2 names a library lemma that states something else) and three format notes carried from the previous review, none blocking; nothing is left for a human to decide.

## C01 — The description says "`Suggested.lean` is unchanged", but against main the pull request removes all 28 of its declarations

A reader of the pull request compares with main, and there the file loses every declaration (`CategoricalLeftAction`, `EquivariantGroupoidLift`, `CategoricalLiftQuestion`, `ContinuousOuterDerivations`, `derivationExtension_shortExact`, `smoothDerivationExtensionClass` and 22 others) together with its twenty `Mathlib.<submodule>` imports; the head's file has `import Mathlib`, a module docstring and an empty namespace. The sentence is true only of the last repair.

Replace it by, for example: "`Suggested.lean` is rewritten: the 28 interface declarations of main's file are removed (the pinned Tau Ceti has the generic ones, and the README names them in the items), and the file now states no theorem, because none of the headline results is statable against the pinned libraries; its header says which supplier each one waits for."

## C02 — In §2.2 the agreement of smooth and discrete modules for a neighbourhood basis is attributed to a lemma that states a different fact

Line 273 says the two properties "agree when the `J_N` form a basis of neighbourhoods of zero (`TauCeti.discreteModules_eq_smoothModules`)". At the pin that lemma (`Algebra/Category/ModuleCat/Smooth/Basic.lean:337`) says that discreteness is smoothness for the family of all open left ideals, with no family `J` in its statement. The statement the sentence makes is `TauCeti.smoothModules_eq_discreteModules` (same file, line 376), whose hypothesis is exactly that the `J i` form a basis of `𝓝 0`. The mathematics of the sentence is right; name that lemma, here and in the list under "From Tau Ceti" (line 1021), or name both.

## N01 — Convention 9 and the opening of "From Tau Ceti" say names in `CategoryTheory` drop that prefix, but the `MonoidalLeftAction` names are in `CategoryTheory.MonoidalCategory`

Mathlib `CategoryTheory/Monoidal/Action/Basic.lean:42` opens `namespace CategoryTheory.MonoidalCategory`, so restoring `CategoryTheory.` alone finds none of `MonoidalLeftAction`, `MonoidalLeftAction.pseudofunctor`, `MonoidalLeftAction.curriedActionMop`. Name the second namespace at lines 100–101 and 1015–1016.

## N02 — In §1.2 (line 169), "an action of `D` by exact functors" should read "an action on `D`": `D` is the category acted on.

## N03 — The References list Johnson–Yau, Theorem 8.4.1, p. 238 (line 1096), which no layer cites. Cite it where it is used, or drop the locator.

## Previous findings

The previous review (of `3e11d5b`) had no finding and no small correction. Its format notes:

- N01 — not repaired: "names in the namespace `CategoryTheory` are written without that prefix" (lines 100–101, 1015–1016). Carried as N01.
- N02 — not repaired: "an action of `D` by exact functors" (line 169). Carried as N02.
- N03 — not repaired: "Theorem 8.4.1, p. 238 (coherence for bicategories)" (line 1096). Carried as N03.
- N04 — an offer (the unit of §4.2's biequivalence as one Lean statement), not taken up; the file conforms as it is, and the offer is not repeated.

The record against the merge base (`1b7b481`), layer by layer: R1 (action/pseudofunctor comparison with unit and associator, restriction to stable full subcategories, two-step restriction, equivariant functors and strong transformations, linearity, inherited abelian structure, congruence predicate), R2 (twisting action with the cells `restrictScalarsId'`/`restrictScalarsComp'`, rank-one unit and compositor, fibrewise action, moving characters, quotient comparison), R3 (`Ccrit`, `χp`, loop action, coordinate group and character equation, `H ⋊ S` family and covariance, finitely generated congruence invariance, the family `Q_M`), R4 (lift packages, bicategory, biequivalence, normalized data, linear refinement, conjecture as a type, cocycle obstruction), R5.1, R5.2, R5.3: each is present under its id with its full statement. The three changes of content (character equation consumed from AffineLieAlgebras A8.3; covariance as a consequence of the family's cells; finite products for finite biproducts) are stated in the description and are correct.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| §1.1 composition comparison and Check | `SingleObj`: `g ≫ h = h * g`; bicharacter `(−1)^(b a′)` on `(ℤ/2)²` | `mapComp`: `T_(h*g) ≅ T_g ⋙ T_h`; `c((0,1),(1,0)) = −1`, `c((1,0),(0,1)) = 1`; `Aut` of an autoequivalence of `Vect` is `ℂ^×` | true; not equivalent to trivial | none |
| §1.3 congruence invariance (sampled) | cocycle action of `(ℤ/2)²` on the line `ℂ`; pin `congruenceInvariant` | all `T_g = Id`, predicate holds; compatible `b` forces `c = b(g)b(h)/b(gh)`, symmetric; `c` is not | true; matches `∃ N, 0 < N ∧ ∀ g ∈ K N, Nonempty (g ⊙ X ≅ X)` | none |
| §1.2 abelian full subcategory | `ℂ[x]`, `x = λ`; Mathlib instance | Jordan block: `x − λ ≠ 0` on an extension of `ℂ_λ` by `ℂ_λ`; instance needs zero, kernels, cokernels, finite products | true; hypotheses equal Mathlib's | none |
| §2.1 twisting action (sampled) | `ℂ[x]`, `g: x ↦ 2x`, `h: x ↦ x+1`, `ℂ_λ` | `T_h`: `λ−1`; `T_g T_h`: `(λ−1)/2`; `T_(gh)`: `(gh)⁻¹x = (x−1)/2`, `(λ−1)/2`; `T_(hg)`: `λ/2 − 1`; along `a h`: `λ+1` | `T_(gh) = T_g ∘ T_h`; order detected | none |
| §2.2 fibres and twists (sampled) | `ℂ[y]`, `χ(y)=1`, `a: y ↦ y+1`; `∏ ℂ[[x]]/x^N` | twist: `y` acts by `a⁻¹(y) = y−1 = 0`, `χ∘a⁻¹(y) = 0`; along `a`: `2`; `x^M·(1,1,…) ≠ 0` at `N > M` | true; equals `discreteCentralCharacterTwist` (`χ.comp (centerCongr e).symm`) | C02 (lemma name) |
| §2.3 rank-one cells (sampled) | `(g ⊗ h)·M = g·(h·M)`; `S_n ↦ q_(−n−2)` at `n = −2` | functor order `T_h ⋙ T_g`; compositor for `(a_g)⁻¹, (a_h)⁻¹, (a_(gh))⁻¹`; `Res(t⁻¹ q dt) = q_0` | consistent with §2.1, A8.3 and `monoidalLeftAction_pseudofunctor` | none |
| §3.1 critical fibres (sampled) | vacuum `Q_0` for `sl₂`; opers `q = 0, 1` | `S_(−2)·v = f_(−1)e_(−1)v + ½h_(−2)v + ¼h_(−1)²v` from `[e_(−1), f_(−1)] = h_(−2)`; `S_0·v = 0`; `S_(−2)` acts by `0` and `1` | vacuum in no fibre; fibres disjoint | none |
| §3.2 loop action (sampled, headline) | hypothesis "fixes `Z` pointwise" against Frenkel2007 line 12815 and A8.3 | source: `G((t))` acts trivially on the centre, fibres stable; library: stability lemma needs centre fixed | supported; unconditional given A4.2, A8.3 | none |
| §3.3 coordinate automorphisms (sampled) | `φ = 2t`, `ψ = t + t²`; `φ = at` | `σφσψ(t) = 2t + 4t² = ψ(φ(t))`; `aσ(S_n) = a^n S_n`; `L_n(p^φ) = a^(−n)L_n(p)` by `u = at`; both sides `a^(−n)L_n(p)` | true; `aσ` for `aσ⁻¹` gives `a^n` | none |
| §3.4 semidirect family (sampled, headline) | `h = diag(t, t⁻¹)`, `φ = at`; product law | `aσ a_h aσ⁻¹(e_n) = a^(−n)·a^(n+2) e_(n+2) = a²e_(n+2) = a_(σh)(e_n)`; `(h,σ)(k,τ) ↦ a_h aσ a_k aτ` | homomorphism; relation holds | none |
| §3.5 congruence and weak equivariance (sampled) | `g ∈ G(ℂ[[t]])`, `x ∈ t^M𝔤[[t]]`; `diag(t, t⁻¹)`; `Q_1` | residue term has no `t⁻¹dt`; pole: `e_M ↦ e_(M+2)`, `f_M ↦ f_(M−2)`; `[h_0, 1] = 0` but `h_0·1 ≠ 0` | ideal preserved only for regular `g`; two actions differ | none |
| §4.1 lift packages (sampled) | product category; one-object `Γ` | `(𝟙,a) ≫ (g,1) = (g, 1*a) = (g,a) = (g,1) ≫ (𝟙,a)`; pin: `transportComp : E_g ⋙ E_h ≅ E_gh` | mixed diagrams well-typed; matches the structure at the pin | none |
| §4.2 biequivalence (sampled, headline) | `Γ`, `H` trivial; skeletal matrices against `Vect` | joint fibre skeletal, reconstructed fibre has distinct isomorphic objects: not isomorphic, equivalent; 2-cells between lift morphisms unique (comparison faithful) | hom-groupoids discrete up to equivalence; statement consistent | none |
| §4.3 linear refinement (sampled) | conjugation `V ↦ V̄` | `F(i f) = −i F(f)`, additive, not `ℂ`-linear; pin `IsLinear`: each `L.transport g` linear | Check separates the refinement | none |
| §4.4 conjecture type | `q = 0, 1` of `PGL₂`; automorphisms of trivial system | `g⁻¹dg = 0` gives constants `PGL₂(ℂ)`; Frenkel2007 lines 13974–13975: that group acts | stated as a type, never asserted | none |
| §4.5 cocycle obstruction | `ℤ/2`, `c(s,s) = −1`, `b(s) = i`; pin lemma | `b(s)b(s)/b(1)·c(s,s) = (−1)(−1) = 1`; pin: `c′(h,g) = b h * b g / b(h*g) * c(h,g)` | "`c` times coboundary of `b`" is the pin's direction | none |
| §5.1 descent (sampled, headline) | connection `A = 0`; two-object contractible groupoid | Drinfeld–Sokolov forms have `p₋₁ ≠ 0`; `exp(−t p₋₁)` trivializes `q = 0`; essential surjectivity is FormalConnectionsOpers §6.1 | equivalence, not surjective on objects; quasi-inverse needed | none |
| §5.2 bridge (sampled, headline) | module law of `E_δ`; inner change; `ℂ[x]`, `d/dx`; `sl₃` depths | `δ(ab) = δ(a)b + aδ(b)` both sides; `φ(a·(u,v)) = a·φ(u,v)` with `ad_b(a) = ba − ab`; Jordan block; depths `2, 1`, `4 ≥ 4`, `5 < 6` | true; fibre criterion equals `center_smul_eq_iff` | none |
| §5.3 relative family (sampled) | `c = 1`; `ℂ[ε,η]/(ε²,η²)`; `ℂ[ε]/ε²` | `(1+ηY)(1+εX)(1−ηY)(1−εX) = 1 − εη[X,Y]`; `(a + εδa)(v + εu) = av + ε(au + δ(a)v)`; `b(γγ′) = b(γ) + a_γ b(γ′)` | true; opposite order gives the other sign | none |
| Convention 2 (form `Φ = −κc`) | Frenkel–Gaitsgory (5.1) against the pin | source cocycle `κ Res(g df) = −κ Res(f dg)`; pin `Res(f dg) Φ(x,y)` | `Φ = −κ`; agrees with AffineLieAlgebras line 75 | none |
| Description against the head | each "Statements whose content changed" bullet; `Suggested.lean` sentence | six bullets match §§3.3, 3.4, 2.3/3.5, 4.5, 5.2, 1.2; diff against main: 28 declarations removed | one sentence wrong | C01 |

- Source locators checked against the text: 22 of 22 (Frenkel2007: 14; FrenkelGaitsgory2006: 7; JohnsonYau2021: 1 with three definitions), all at the stated pages; for example Frenkel2007 lines 1284–1297 (§1.3.3, p. 25), 1349 (Lemma 1.3.1, p. 26), 1437 (§1.3.6, p. 29), 12793–12820 (§10.1, p. 308), 12882, 12904–12910, 12936 (pp. 310–311), 13944 (p. 335); FrenkelGaitsgory2006 lines 399, 2164–2189, 2470–2493, 5883–5938; JohnsonYau2021 lines 5332, 6020, 6592, 12209.
- Library declarations opened at the pin: Mathlib `CategoryTheory/Abelian/Subcategory.lean:60`, `Monoidal/Action/Basic.lean:42`, `Monoidal/Action/End.lean:50,69`, `Bicategory/Adjunction/Basic.lean:242`, `Bicategory/Functor/LocallyDiscrete.lean:114`, `Products/Basic.lean:166,338`, `Center/Basic.lean:31`, `Adjunction/Limits.lean:118,227`, `Algebra/Homology/DerivedCategory/Ext/EnoughInjectives.lean:125`; Tau Ceti `CategoryTheory/Monoidal/Action/Pseudofunctor.lean:216,244,271,295`, `Monoidal/Action/Congruence.lean:51,61`, `Bicategory/Functor/CentralCocycle.lean:187,251,286`, `Bicategory/Functor/EquivariantGroupoidLift/Basic.lean:113`, `Normalized.lean:72`, `Linear.lean:50`, `Algebra/Category/ModuleCat/Twist.lean:89`, `CentralCharacter/Basic.lean:206`, `CentralCharacter/ActionCategory.lean:107`, `Smooth/Basic.lean:241,337,376`, `Smooth/Coinduction.lean:256`, `DerivationExtension/Character.lean:47,142`, `DerivationExtension/Ext.lean:101`, `Algebra/Lie/Derivation/Continuous.lean:236`, `Algebra/Lie/Current/Completion.lean:133`, `CompletedCoordinateAction.lean:100`.
- All 251 library names in code font were searched at the pins by their final component (the ones listed above by full name); none is missing. No biequivalence of bicategories, no loop-group action on the completed algebra, no opers and no level deformation are at the pins, as the module docstring of `Suggested.lean` says.
- Cross-roadmap citations resolved on main: AffineLieAlgebras A2.2, A2.3, A2.4, A3.1, A3.2, A4.1, A4.2, A5.1–A5.4, A6.3, A8.1, A8.3 (A3.2, A4.2, A5.3, A6.3, A8.1, A8.3 read in full); FormalConnectionsOpers §§1.2, 3.1, 3.4, 5.1, 5.2, 6.1, 7.1, 7.2, 8.1, 8.2 (§§1.2, 3.4, 5.1, 6.1, 8.1 read, §8.2's sign located). Inbound citations (FormalConnectionsOpers cites R3–R5) keep their ids.
- Automatic checks at this head: all passed, none set aside. Dependency check output: `depcheck: 133 roadmaps, 1474 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the roadmap folder.
- Elaboration: `lake env lean` on `Suggested.lean` gives no message. The file has no declaration, so there is no signature to compare and no padding to probe.
- Headline theorems (README overview): the coherent loop action and the family over `H ⋊ S` (§§3.2–3.4); the biequivalence with normalized transport data (§4.2); descent to local systems (§5.1); the map `θ` with its anchor and extension classes (§5.2). None is statable at the pins; the module docstring names each with the missing carrier.
- Ownership against open pull requests: searched by object (categorical actions as pseudofunctors, equivariant groupoid lifts, critical fibres, `IsomOp`, outer derivations); no open roadmap states them.

Overlap check: read AffineLieAlgebras, FormalConnectionsOpers, AlgebraicModuliForArithmeticGeometry (the lists of open roadmaps and of results are empty). Shared objects and owners: the completion, loop and coordinate lifts, smooth and discrete modules with strict fibres, the deformation, the Feigin–Frenkel normalizations and the coordinate character equation belong to AffineLieAlgebras, which assigns coherent actions, fibres, descent, the `Ext¹` comparison and the Artinian adapters to this roadmap; opers, `K_N`, the gauge groupoid, the cotangent algebroid and `IsomOp` belong to FormalConnectionsOpers; nothing shared with AlgebraicModuliForArithmeticGeometry.

Source independence: 12 passages compared with 3 sources, none shared; largest share Frenkel2007, 14 of 22 locators; contents compared with Frenkel2007 (ten chapters, from the classical correspondence through vertex algebras, opers and Wakimoto modules to Chapter 10): independent, the roadmap using only §1.3 and §§10.1, 10.3 and ordering its layers by dependency (actions, twists, family, transport, descent).

Research link: the roadmap makes precise the local geometric Langlands proposal of Frenkel–Gaitsgory (2006, (0.8)–(0.9)) and Frenkel's Conjectures 10.1.2 and 10.3.10 (2007); §5.2 is Frenkel–Gaitsgory's Lemma 7.4.1, Theorem 7.4.2 and map (7.2); §5.1 uses the Frenkel–Zhu oper-reduction theorem. Rests on the README and the three sources read.

## Not verifiable

- The Zulip discussion and the Mathlib pull request listed in the References were not opened; they are design references and carry no statement.
- The printed editions of Frenkel's book and of Johnson–Yau were not compared with the open copies read (the author's copy; arXiv, where the pages agree with those the README gives for v3).

## Source issues

- none

## For the human reviewers

- none
