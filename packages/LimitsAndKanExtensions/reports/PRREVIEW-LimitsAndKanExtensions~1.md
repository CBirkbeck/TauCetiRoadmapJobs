# Review of LimitsAndKanExtensions (pull request #2270 at 04df60e)
Folder: `TauCetiRoadmap/InfinityCategoryTheory/LimitsAndKanExtensions/`
**Verdict:** needs changes

## R01 (P1) — The targeted build fails: seven imports do not exist at the pinned Tau Ceti

**Location:** `TauCetiRoadmap/InfinityCategoryTheory/LimitsAndKanExtensions/Suggested.lean` lines 8, 10–14, 16: "public import TauCeti.AlgebraicTopology.Quasicategory.CatInfty" and six more.
**Claim:** The file states its theorems "against the pinned Mathlib and Tau Ceti" (line 22), but it does not build at the pin of `lake-manifest.json` (Tau Ceti `2fd255d`).
**Witness:** Gate `build=15`: `bad import 'TauCeti.AlgebraicTopology.Quasicategory.CatInfty'`, likewise `Quasicategory.Limit`, `SimplicialNerve.Basic`, `SimplicialSet.AnodyneExtensions.LeftRight.Basic`, `SimplicialSet.Fiber`, `SimplicialSet.InternalHom`, `SimplicialSet.WeakHomotopyEquivalence`.
**Repair:** Import only modules of the pinned Tau Ceti, and move every statement whose carrier is in a missing module (`IsCofinal`, `coslice.IsColimit`, `SSet.catInfty`, `RightFibration`, `ihomOver`, …) to the docstring's "Not statable at the pins" list with the missing carrier; or have the pin bumped first (the description names `8b9f13d`) and resubmit this head against it, with the gate re-run.

## R02 (P3) — Gate rule `imports` (7)

**Location:** `Suggested.lean` lines 8, 10, 11, 12, 13, 14, 16.
**Claim:** Each imported `TauCeti.*` module exists at the pinned Tau Ceti.
**Witness:** Gate `imports=7`: "TauCeti module TauCeti.AlgebraicTopology.Quasicategory.CatInfty does not exist at the pinned Tau Ceti", and the six of R01.
**Repair:** The repair of R01.

## R03 (P1) — The supplier contracts cite Tau Ceti declarations that are not at the pin

**Location:** `README.md` line 46: "Tau Ceti already has joins, slices and coslices, limit and colimit cones (`SSet.slice.IsLimit`, `SSet.coslice.IsColimit`), left and right fibrations and anodyne maps, functor quasicategories over a base (`SSet.ihomOver`)"; lines 112–121.
**Claim:** These are inputs at the pin, "not targets".
**Witness:** Pinned `TauCeti/AlgebraicTopology/SimplicialSet/Coslice.lean` declares only `functor`, `coslice`, `homEquiv`, `representableBy`, `objEquiv`, `π` (lines 65–189). Pinned `Quasicategory/` holds `Cartesian`, `Core`, `FullSubcategory`, `LocallySmall`, `RightMappingSpace` only.
**Repair:** Absent at the pin: `SSet.coslice.map`, `coslice.isIso_π`, `coslice.IsColimit`, `slice.IsLimit`, `coslice.isColimit_iff_isLimit_op`, `coslice.isColimit_iff_nonempty_isInitial`, `IsInitialVertex`, `IsTerminalVertex`, `LeftFibration`, `RightFibration`, `leftAnodyneExtensions`, `rightAnodyneExtensions` and their `_pushoutObjObjι`, `ihomOver` (+ `homEquiv`, `isTerminalId`), `SSet.IsWeakHomotopyEquivalence`, `isWeaklyContractible_iff_isWeakHomotopyEquivalence`, `Edge.isEquivalence_iff_hornFilling_zero`, `CategoryTheory.nerve.opIso`, `CoreEnriched`, `CatInftyΔ`, `catInfty`; and, used by `Suggested.lean`, `ihomObj₀Equiv`, `SimplicialNerve.fromNerve`, `kanComplex_of_isTerminal`. Either the pin is bumped before this merges and each name is re-resolved there with its file, or each becomes a declared target of the Part that first needs it and line 46 stops saying the library has it.

## R04 (P2) — Objects that roadmaps on main already own are planned again, with no citation

**Location:** `README.md` §2.1.1, §4.3.1, §5.4.2, §5.4.3, §7.4.3, §1.4.1, §3.1.1, §3.2.1; Scope (lines 44–48) names neither main roadmap.
**Claim:** This Part is the owner of cofinal maps, Theorem A, the colimit criterion, the trivial fibration of HTT 4.3.2.15, the terminal-fibre inclusion, and HTT 4.2.4.1/4.2.4.3/4.2.4.4.
**Witness:** Main `TauCetiRoadmap/EnhancedDerivedSheaves/README.md` line 215 (`IsFinal`, `isFinal_iff_colimit`, Theorem A), line 1123 (`leftKanExtension_restrict_trivialFibration`), line 1139 (`final_fibre_inclusion`); main `TauCetiRoadmap/BordismFormalGroups/README.md` lines 2011, 2040, 2046 (HTT 4.2.4.4, 4.2.4.3, 4.2.4.1).
**Repair:** A roadmap on main is earlier than an open one. In Scope add: "Final maps into a quasicategory, Theorem A and the colimit characterization are EnhancedDerivedSheaves E0 (`IsFinal`); the relative left Kan extension along a full inclusion and the finality of a terminal fibre are EnhancedDerivedSheaves E3.1; the comparison of homotopy colimits with colimits in coherent nerves (HTT 4.2.4.1, 4.2.4.3, 4.2.4.4) is BordismFormalGroups F6.5", then cut the coinciding statements to citations and keep only what main does not state (cofinality for a non-quasicategory target, the right-fibration definition with its agreement with `IsFinal`, HTT 4.1.1.9–4.1.1.12, smoothness, HTT 4.2.3, HTT 4.3.3). If ownership is instead to move here, that is a revision of the two roadmaps on main with a stated merge order (see the last section).

## R05 (P2) — §3.5.1 follows the source's sentence clause by clause

**Location:** `README.md` line 393: "the objects of `C_{p/} ×_C {Y}` are classified up to equivalence by maps `[K] ⟶ Map_C(X, Y)` in H, and that such a map classifies a colimit of p exactly when it induces isomorphisms"
**Claim:** The statement is in the roadmap's own words.
**Witness:** HTT lines 14318–14322 (Cor. 4.4.4.9): the two sentences agree clause for clause; longest shared run 7 words, and the same two verbs ("classified", "classifies") in the same places.
**Repair:** "Prove that for p constant at X on K and an object Y, `π₀` of the fiber `C_{p/} ×_C {Y}` is the set of H-morphisms `ψ : [K] ⟶ Map_C(X, Y)`, through `Fun(K, Map_C(X, Y))`; and that a cocone with cone point Y and class ψ is a colimit of p exactly when, for every object Z, the map `Map_C(Y, Z) ⟶ Map_C(X, Z)^{[K]}` adjoint to composition with ψ is an isomorphism of H (HTT, Cor. 4.4.4.9, p. 320)."

## R06 (P3) — Three definitions of `Suggested.lean` serve no stated theorem

**Location:** `Suggested.lean` lines 231 (`IsRelativeColimit`), 361 (`simplicialObjects`), 366 (`augmentedSimplicialObjects`).
**Claim:** Definitions are kept only to make a headline statable.
**Witness:** Each name occurs in the file only at its own definition and in the module docstring (lines 33–35); `IsLeftKanExtensionAt` is written with `coslice.IsColimit`, not `IsRelativeColimit`.
**Repair:** Delete them from `Suggested.lean` (the README keeps the statements); drop the three names from the docstring, and the sentences "The `Suggested.lean` declaration is `IsRelativeColimit`" (README lines 740–741) and "The `Suggested.lean` declarations are `simplicialObjects` and `augmentedSimplicialObjects`" (lines 1019–1020).

## R07 (P3) — `isCofinal_of_isCategoricalEquivalence` is a special case of another declaration

**Location:** `Suggested.lean` lines 131–133.
**Claim:** It is a headline of its own.
**Witness:** `isCofinal_comp_iff_of_isCategoricalEquivalence (𝟙 K') q hq` gives `IsCofinal (𝟙 K' ≫ q) ↔ IsCofinal (𝟙 K')`, and the identity is cofinal; `[K.Quasicategory]` is not needed.
**Repair:** Delete it from `Suggested.lean`; README §2.6.1 keeps the statement as the route's first step, without the sentence naming the declaration (line 311).

## R08 (P3) — §7.1.2 names the wrong Mathlib notion for pointwise Kan extensions

**Location:** `README.md` lines 769–770: "the condition is Mathlib's pointwise left Kan extension along the inclusion (`CategoryTheory.Functor.IsLeftKanExtension` with its comma-category formula)".
**Claim:** `Functor.IsLeftKanExtension` is the pointwise notion.
**Witness:** `Mathlib/CategoryTheory/Functor/KanExtension/Basic.lean` line 174: `IsLeftKanExtension` is the universal-property class; the pointwise one is `LeftExtension.IsPointwiseLeftKanExtension`, `Mathlib/CategoryTheory/Functor/KanExtension/Pointwise.lean` line 326.
**Repair:** "For nerves of ordinary categories, the condition is Mathlib's `CategoryTheory.Functor.LeftExtension.IsPointwiseLeftKanExtension` for the extension with identity unit; it implies `CategoryTheory.Functor.IsLeftKanExtension`, which is weaker." Add the Pointwise file to the Mathlib contract (line 102).

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| §1.4.1 (HTT 4.2.4.3) | K = ∅; K = ∂Δ[1] | `Map(X,Y) ⟶ ∗` an equivalence for all Y ⇔ X initial; `Map(X,Y) ⟶ Map(x₀,Y) × Map(x₁,Y)` | agrees with source line 12172 |
| §1.4.2 nerves | K = Δ[1]/∂Δ[1], M = ℤ, f = −1 | coinvariants ℤ/(f−1)ℤ = ℤ/2; colimit over the vertex ℤ | consistent |
| §1.6.1 (HTT 4.2.2.7) | S = Δ[0] | `K ⋄_S S = K ⋄ Δ[0]`; extension = a colimit cocone in the fat slice, contractible choices | hypotheses of line 11735 plus "categorical fibration" |
| §3.3.1 (HTT 4.2.4.8) | A = Kan–Quillen, K = ∅ | colimit ∅, limit Δ[0] | agrees; route avoids 4.2.3.14 |
| §3.5.1 (HTT 4.4.4.9) | K = Δ[0]; K = ∅ | ψ a point of `Map(X,Y)`: colimit ⇔ `X ⟶ Y` equivalence; K = ∅: ⇔ Y initial | true; wording R05 |
| §3.5.2 (HTT 4.4.4.10) | K = Δ[1]; K = ∂Δ[1] constant at X | colimit = value at 1, cone edges equivalences; `X ⊔ X`, fold not an equivalence | weak contractibility needed |
| §4.4.1 (HTT 4.1.1.9) | q : J ⟶ Δ[0]; p = {0} ⊆ J, p = ∅ ⊆ J | qp = 𝟙 cofinal, p cofinal; qp = ∅ ⟶ Δ[0] not cofinal, p not | iff holds both ways |
| §6.3.2, §6.3.3 (HTT 4.2.3.8, 4.2.3.11) | I a point, `K_I = K`; τ = κ = ω | `I_σ` a point, `N(I) ⊆ K^▷` the cone point, right anodyne; ω ≪ ω, statement tautological | agrees with lines 11941, 11998 |
| §6.4.1–6.4.3 (HTT 4.2.3.14–16) | K = Δ[0]; K = ∅ | `N(Δ) ⟶ Δ[0]` cofinal ⇔ `N(Δ)` weakly contractible (terminal [0]); ∅ ⟶ ∅ iso | agrees; `(K.Elements)ᵒᵖ` has maps `([m],y) ⟶ ([n],x)` |
| §6.5.1–6.5.6 (HTT 4.4.2, 4.4.3) | spine of Δ[2]; span `X ⟵ Y ⟶ Z`; κ = ω | `x₁ ⊔_{x₁} x₂ ≃ x₂`; coequalizer of `Y ⇉ X ⊔ Z`; empty coproduct = initial | hypotheses as lines 14034–14214 |
| §7.1.1 (HTT Def. 4.3.1.1) | D = Δ[0]; K = ∅, f : Δ[1] ⟶ Δ[0] | `C_{q/} ⟶ C_{p/}`; vertex 0: Δ[1] ≅ Δ[1]; vertex 1: {1} ⟶ Δ[1] not surjective | Lean pullback matches line 12323 |
| §7.1.2, §7.1.4 | C = Δ[1], C⁰ = {0}; δ = {1} ⊆ Δ[1], δ = {0} ⊆ Δ[1], f′ = id | `C⁰_{/1}` a point: `F(0) ⟶ F(1)` equivalence; `K_{/0} = ∅`, 0 initial ✓; `K_{/1}` a point with value 0 ≠ 1 | Checks correct; R08 |
| §7.3.1 (HTT 4.3.1.9–15, 4.4.2.8–9) | f = ∂Δ[1] ⟶ Δ[0], K = ∅, vertex 0 | `C_{0/} = {0} ⟶ ∂Δ[1]` not surjective: not an f-colimit | weak contractibility of K needed, as stated |
| §7.7.1, §7.7.2 | δ = 𝟙; δ = {0} ⊆ Δ[1] | fibers points, α an equivalence; pointwise value at 1 is x, fiber over 1 empty | coCartesian hypothesis needed; §5.4.3 supplies the cofinal fiber inclusion |
| §8.3.1 (HTT 3.3.4.5) | K = ∅; K = Δ[0], edge `T₀ ⟶ T₁` | colimit ⇔ T = ∅ ⇔ `∅ ⟶ X` a weak equivalence; colimit ⇔ `T₀ ≃ T₁` ⇔ `X₀ ⟶ X ≃ T₁` | (1) ⇔ (3) holds |
| §9.1.2 groupoid objects | nerve of [1], n = 2, T = {0,1}, T′ = {0,2} | 4 chains; 2·2 + 1 = 5 pairs with common source | not a groupoid object, as stated |
| §9.3.4 (HTT 7.2.2.4) | source's condition (2) | source prints U(S) twice; README has U(T) and U(T′) | README correct |
| §9.4.1, §9.4.2 (HTT 6.1.2.11–12) | Čech nerve of Y ⟶ ∗; constant object X | `U_n = Y^{n+1}`, realization ∗ (Y ≠ ∅) or ∅; coequalizer of (𝟙, 𝟙) is X × S¹, realization X | consistent |
| `isCofinal_iff_forall_isColimit` | v = {0} ⊆ Δ[1], {1} ⊆ Δ[1]; C = Δ[1], p = 𝟙 | cone point 1 restricts to edge 0 ⟶ 1, not a colimit of 0: both false; {1}: both true | ok |
| `isCofinal_iff_isWeaklyContractible` | {1} ⊆ Δ[1]; {0} ⊆ Δ[1]; ∅ ⟶ Δ[0] | fibers Δ[0], Δ[0]; fiber over 1 empty; ∅ not weakly contractible (pinned `WeaklyContractible.lean` line 99) | ok; Kerodon 02NY agrees |
| `isCofinal_iff_rlp_monomorphisms` | {0} ⊆ Δ[1]; J × Δ[1] ⟶ Δ[1] | right fibration, no section over Δ[1], not surjective: both false; both true | ok |
| `isCofinal_iff_exists_rightAnodyne_trivialFibration` | ∅ ⟶ Δ[0] | middle object a nonempty contractible Kan complex; ∅ ⟶ X not a weak equivalence: both false | ok |
| `isCofinal_nerveMap_toSimplexCategory_op` | n = 0 | `Δ_s ×_Δ Δ_{/[0]} = Δ_s`; direction `N(Δ_sᵒᵖ) ⟶ N(Δᵒᵖ)` | matches line 31505 |
| `exists_isLeftKanExtension_iff` | P = False, C = Δ[0]; P = True | both sides "D has an initial object"; both true (`C_{/c}` has final `id_c`) | ok |
| `exists_rlp_monomorphisms_leftKanExtensions_restrict` | P = False, C = Δ[0], D = ∂Δ[1] or Δ[1] | ∅ ⟶ ∅; {0} ⟶ Δ[0] | trivial fibrations |
| `isColimit_iff_forall_isColimit_evalAt`, `exists_isColimit_ihom` | T = ∅; C = Δ[1], K = ∂Δ[1] | `Fun(∅, C) = Δ[0]`, both sides true; pointwise maximum | ok |
| `exists_isLimit_spaces`, `exists_isColimit_spaces`, `…_catInfty`, `…_presheaf` | K = ∅; Λ[2,2] with `∗ ⟶ Z ⟵ ∗` | Δ[0] and ∅; ΩZ, not `∗ ×_Z ∗ = ∗`; `P(∅) = Δ[0]` | ok |

- Source locators checked against the text: 88 statement numbers with pages in HTT (PDF pages, as the References say), 4 in Kerodon (Def. 7.2.1.1, tags 02NY, 02YC, 02YZ); no wrong number or page.
- Library declarations opened at the pin: Tau Ceti `SimplicialSet/Coslice.lean` 65–189, `Slice.lean` 364, `WeaklyContractible.lean` 99, `Quasicategory/Cartesian.lean` 65–110, `FullSubcategory.lean` 53, `RightMappingSpace.lean` 89, `Marked/Basic.lean` 136, 204; Mathlib `Limits/Final.lean` 91, `KanExtension/Basic.lean` 174, `KanExtension/Pointwise.lean` 326, `ModelCategory/Over.lean` 143, `SimplicialSet/HoFunctorMonoidal.lean` 402, `NerveAdjunction.lean` 386–402.
- Cross-roadmap citations resolved: 54 target ids of Part InfinityCategoryFoundations and 32 of Part CartesianFibrations exist at this head; 12 read in full against what they are cited for; the ModelCategoryTheory Parts' cited sections exist at the head of their pull request.
- The seven definitions repeated from Part InfinityCategoryFoundations have bodies identical to that Part's `Suggested.lean`.
- Dependency check: `depcheck: 223 roadmaps, 1972 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Gate: FAIL (`imports=7`, `build=15`; every other counter 0). No change outside the family folder.
- The pull request's text: the description's entry for this Part (33.6k words; measured 33,718), its supplier list and its pin paragraph agree with the head; no finding.
- Overlap check: read KanQuillen, EnrichedLocalization, SimplicialCategories, ModelCategories (open), BordismFormalGroups, EnhancedDerivedSheaves, GeneralizedCohomology (main); final maps, Theorem A, the colimit criterion, HTT 4.3.2.15 and the terminal-fibre inclusion: owner EnhancedDerivedSheaves; HTT 4.2.4.1/4.2.4.3/4.2.4.4: owner BordismFormalGroups F6.5 (R04); weak homotopy equivalences and homotopy colimits: KanQuillen and SimplicialCategories, cited here, not restated.

Source independence: 21 passages compared with 2 sources (HTT, Kerodon), one following its source clause by clause (R05); largest share HTT, 633 of 649 locators; contents compared with HTT: independent (Layers 1–6 and 8–9 each draw on several non-adjacent sections; Layer 7 ↔ §4.3 alone, its order forced by the Needs lines of §7.2, §7.4 and §7.6).

## Not verifiable

- Elaboration of `Suggested.lean`, the `#check` comparison of signatures and the one-tactic padding probe: the imports do not exist at the pin (R01); every Lean statement was judged by reading.
- The description's sentence that the files elaborate against Tau Ceti `8b9f13d993`: that commit is not the pin and was not built.
- HA, Lemmas 1.2.4.16–1.2.4.17 (§9.6) and SAG, A.5.1.1–A.5.1.9 (§9.7): outside the sample, texts not read this round.

## Source issues

- **Misprint** in HTT at Proposition 7.2.2.4, condition (2), printed page 725: the source says the two maps exhibit the value at [n] as a product of U(S) with U(S); it should be the product of U(S) with U(S′); affects nothing.
- **Gap** in HTT at Proposition 4.1.1.8, proof of (3) ⇒ (1), printed page 227: the source says limits in spaces come from Corollary 4.2.4.8, whose proof uses Proposition 4.2.3.14, whose proof uses 4.1.1.8 itself; it should be limits in spaces proved without nerve replacement first; affects the proof.

## For the human reviewers

- **Scope/ownership.** The description asks the maintainers to choose the owner of the generic ∞-categorical material among this family, main's BordismFormalGroups F6.5 and EnhancedDerivedSheaves, and open pull request #1807; R04 states the rule as it stands.
- **Pin.** The description asks for the Tau Ceti pin to be bumped to `8b9f13d` or later; at the present pin 11 of 13 member files, this one included, do not build.
- **Licence.** HTT and Kerodon were read from the author's pages (`math.ias.edu/~lurie`, `kerodon.net`), classified `author-page` by hand.
- **Sources.** 633 of 649 locators are to one book, HTT (Annals of Mathematics Studies 170); Kerodon 9, SAG 5, HA 2.
