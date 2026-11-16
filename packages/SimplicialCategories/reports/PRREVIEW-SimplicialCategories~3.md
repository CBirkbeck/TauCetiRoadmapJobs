# Review of SimplicialCategories (pull request #2269 at 2a6d75e)
Folder: `TauCetiRoadmap/ModelCategoryTheory/SimplicialCategories/`
**Verdict:** needs changes

## R01 (P1) — The acceptance test still does not build at the pins

**Location:** `TauCetiRoadmap/ModelCategoryTheory/SimplicialCategories/Suggested.lean:4,6,7` (imports of `…SimplicialSet.WeakHomotopyEquivalence`, `…SimplicialCategory.HomotopyCategory`, `…Enriched.EnrichedCat`) and `:421–451,522–523` (`UnitGradedNatTrans.comp`, `comp_app`).
**Claim:** Previous R01 is not repaired. The gate fails `imports=3`, `build=7`: the three modules are absent at the pinned Tau Ceti, and the pinned `NaturalTransformation.lean` names the composition `unitComp`.
**Witness:** Pinned Tau Ceti `TauCeti/CategoryTheory/Enriched/NaturalTransformation.lean:209,234` declares `unitComp`, `unitComp_app`; `TauCeti/AlgebraicTopology/SimplicialCategory/` does not exist. Targeted build exits 1 on three `bad import` errors.
**Repair:** Delete the three imports; write `unitComp`/`unitComp_app`; give the weak homotopy equivalences a real body, `∀ Z : SSet, Z.KanComplex → Function.Bijective (SSet.mapπ₀ ((MonoidalClosed.pre f).app Z))`. With exactly these changes a scratch copy elaborates Layers 1, 2, 4 and 6 with `sorry` as the only warning. Layer 5 then fails only on the category instance on `EnrichedCat`, `mapHomotopyCategory` and `SimplicialHomotopyCategory.homMk`: either add the strict category instance on Mathlib's `EnrichedCat` and a `π₀`-category with real bodies, or move the Layer 5 statements to the docstring's "Not statable at the pins" list, naming those three carriers.

## R02 (P1) — The supplier contract cites Tau Ceti declarations that the pin does not have

**Location:** `TauCetiRoadmap/ModelCategoryTheory/SimplicialCategories/README.md:168–181`, repeated at `:30–33`, `:79`, `:113` — "`SSet.IsWeakHomotopyEquivalence` (`TauCeti/AlgebraicTopology/SimplicialSet/WeakHomotopyEquivalence.lean`) … `CategoryTheory.EnrichedCat.category` … `TauCeti.SimplicialHomotopyCategory` … `IsDwyerKanEquivalence` … `TauCeti.UnitGradedNatTrans.comp`".
**Claim:** Previous R02 is not repaired: six declarations are written as supplied and exist nowhere at the pinned Tau Ceti.
**Witness:** Searches of the pinned Tau Ceti for `IsWeakHomotopyEquivalence`, `SimplicialHomotopyCategory`, `mapHomotopyCategory`, `IsDwyerKanEquivalence` and `EnrichedCat` return no declaration; `Mathlib/CategoryTheory/Enriched/EnrichedCat.lean:32,112` has the bundled carrier with a bicategory only.
**Repair:** Remove the six names from "From Tau Ceti", from Scope (`:30–33`) and from Conventions. Cite Mathlib's `EnrichedCat` for the carrier and make its strict category structure a target of §5.2.1; cite Part KanQuillen §3.1.1 for the weak homotopy equivalences with the body of R01; define the `π₀`-category of a simplicial category in §5.1.1; write `unitComp` in §2.1.1 and its *Needs* line.

## R03 (P2) — The simplicial special cases still have a second owner on main

**Location:** `TauCetiRoadmap/ModelCategoryTheory/SimplicialCategories/README.md:35–48` (Scope names no owner on main) with §§1.2.3, 5.4.2, 5.7.4–5.7.5, 5.8.4, 6.1.1, 6.3.1 for S simplicial sets.
**Claim:** Previous R03 is not repaired: the Bergner structure, the excellence and invertibility property of Kan–Quillen simplicial sets, the local-fibration characterization, and the simplicial diagram structures with Dwyer–Kan invariance are planned here and on main.
**Witness:** On main, `TauCetiRoadmap/BordismFormalGroups/README.md:1561–1589` (§F6.5 item 1) constructs the Bergner model, the excellent-base properties, the invertibility property and Bergner's fibrations; `:1591–1623` the enriched diagram models and their Dwyer–Kan invariance.
**Repair:** In Scope, name BordismFormalGroups §F6.5 item 1 as the owner of these fixed-base cases and keep here the statements for a general base S, each saying in one clause how it differs. Replace the simplicial specializations in §§1.2.3, 5.4.2, 5.7, 5.8.4, 6.1.1, 6.3.1 by that citation, and delete from `Suggested.lean` `exists_bergnerModelCategory`, `combinatorialDwyerKanEquivalences_of_isPushout_interval_toInvertible`, `isFibrant_iff_isLocallyKan`, `fibration_iff_isQuasiFibration`, `exists_projectiveModelCategory_sSetDiagram`, `exists_injectiveModelCategory_sSetDiagram`, `isLocalizedEquivalence_restriction` and the definitions only they use. A transfer of ownership to this family needs BordismFormalGroups revised first.

## R04 (P2) — §5.8.2 does not say which square is a homotopy pullback, and the one it names is not

**Location:** `TauCetiRoadmap/ModelCategoryTheory/SimplicialCategories/README.md:1388–1391` — "for `G : A → B` a transfinite composite of pushouts … the induced square of the objects `Map^φ_{Cat_S}(B, C)` representing functors that are φ on objects is a homotopy pullback".
**Claim:** A never enters the conclusion. Read as the square on `Map^φ(B, −)` over C, D, C′, D′, the statement is false already for G an identity.
**Witness:** S simplicial sets, G = id, B one object with endomorphisms ℤ/2; C with endomorphisms the Čech nerve of ℤ → ℤ/2, C′ = ℤ/2, D = D′ = ∗. Hypothesis holds; `Map^φ(B, C)` is one point, `Map^φ(B, C′)` two.
**Repair:** State the relative square of HTT, Lemma A.3.2.26: "the square with top row `Map^φ(B, C) → Map^{Fφ}(B, D) ×_{Map^{Fφ}(A, D)} Map^φ(A, C)`, restrictions along G, and bottom row the same for `C′`, `D′`, `uφ`, `u′Fφ`, is a homotopy pullback of fibrant objects with fibrations as vertical maps." On the witness both rows are identities.

## R05 (P2) — Scope asserts that the two classes of weak equivalences agree; no target proves it

**Location:** `TauCetiRoadmap/ModelCategoryTheory/SimplicialCategories/README.md:41–45` — "The two classes agree: GeneralizedCohomology §G2.1 defines the realization weak equivalences … and Part KanQuillen §3.1 proves the same criterion, with `Ex^∞` as the fibrant replacement".
**Claim:** The comparison is stated as a fact with no target and no owner, and it does not follow from the two cited statements: neither says that `X → Ex^∞ X` is a realization weak equivalence. The description and Part KanQuillen say the opposite.
**Witness:** `TauCetiRoadmap/ModelCategoryTheory/KanQuillen/README.md:36–37`: "Whether the two classes coincide is not settled here and is not claimed". Description: "This roadmap does not claim that the two definitions agree and has no target asserting it".
**Repair:** Replace the sentence by: "Whether this class coincides with the realization class is not claimed here and no statement depends on it; GeneralizedCohomology §G2.1 defines the realization class and is the owner of that comparison."

## R06 (P3) — Process residue in §5.4.5

**Location:** `TauCetiRoadmap/ModelCategoryTheory/SimplicialCategories/README.md:1173` — "so each stage is levelwise free on the generators adjoined so far".
**Claim:** The gate's `residue` rule fails on "so far".
**Witness:** Gate: `residue=1`, line 1173.
**Repair:** "so each stage is levelwise free on the generators adjoined up to that stage".

## R07 (P3) — §5.4.5 derives a cell presentation from membership in the saturated class and cites the wrong section

**Location:** `TauCetiRoadmap/ModelCategoryTheory/SimplicialCategories/README.md:1161–1163` — "the first map in the weakly saturated class generated by `C₀`, hence a transfinite composition of pushouts of coproducts of `C₀` by Part ModelCategories §1.3.1".
**Claim:** Part ModelCategories §1.3.1 defines weak saturation and states no cell presentation, and the "hence" fails for retracts, as the second Check of the same statement (`:1184–1186`) says.
**Witness:** `TauCetiRoadmap/ModelCategoryTheory/ModelCategories/README.md:281–293` (§1.3.1: definition, intersections, lifting classes); the cell presentation is its §1.5.2 (`:352–357`), with a retract.
**Repair:** "factors `∅ ⟶ C` as `∅ ⟶ C′ ⟶ C` with the first map a transfinite composition of pushouts of coproducts of members of `C₀`, as the small object argument constructs it (Part ModelCategories §1.4.1; Mathlib `MorphismProperty.llp_rlp_of_hasSmallObjectArgument`)"; drop §1.3.1 from that sentence.

## R08 (P3) — §3.4.3 uses one letter for the model category and the poset, and gives G no domain

**Location:** `TauCetiRoadmap/ModelCategoryTheory/SimplicialCategories/README.md:708–710` — "for a combinatorial A, a poset A, `B = {(a, b) ∈ Aᵒᵖ × A : a ≥ b}` with projection `π : B → Aᵒᵖ`, and `α : π^* G → F`".
**Claim:** Without the source's two typefaces the two A's are indistinguishable, and G, F are never given a source and target.
**Witness:** For the poset `{0 < 1}`, B has the relation `(1, 0) ≤ (0, 0)`, so `π^* G` needs a map `G(1) → G(0)`: G is a diagram on the opposite poset, which the text does not say.
**Repair:** "for a combinatorial A, a poset P, `B = {(p, q) ∈ Pᵒᵖ × P : p ≥ q}` with projection `π : B → Pᵒᵖ`, diagrams `F : B → A` and `G : Pᵒᵖ → A`, and `α : π^* G → F` whose components `G(p) → F(p, q)` are weak equivalences".

## Previous findings

- R01 — not repaired: `Suggested.lean:4,6,7` keeps the three imports; the three theorems were renamed `unitComp_*` but their statements still call `UnitGradedNatTrans.comp`.
- R02 — not repaired: `README.md:168–181` unchanged.
- R03 — not repaired: `README.md:35–48` still names no owner on main.
- R04 — repaired: `README.md:880–883` now attaches along `u_k □ (∂Δ[k] ⊆ Δ[k])` with `u_k` the relative latching map.
- R05 — repaired: `README.md:1258–1260` names `constSSet`, `DiscreteEnrichment`, `interval.zero`, `interval.one`, `interval.arrow`.
- R06 — repaired: the description's "Tau Ceti pin" paragraph now states the `comp`/`unitComp` rename.

## Verified sound

| Statement | Instances tried | Claimed side | Computed side | Result / change |
|---|---|---|---|---|
| §1.4.1–1.4.3 (HTT A.3.1.7) | C simplicial sets, Y = Δ[0], n = 1; hypotheses against HTT lines 39653–39750 | Projection a weak equivalence; iff under (1)–(3) | `Δ[1] → Δ[0]`: π₀ 1→1; source has the same three conditions, all-cofibrant and filtered-colimit hypotheses | Holds |
| §2.1.1 five classes | C = `[0]_S`; C = `[1]`, F = fold `Δ[0]⊔Δ[0] → Δ[0]` | Classes of A; injectively, not projectively cofibrant | Classes: cof, fib, W, fib, cof; values mono over ∅, fold 2→1 not mono | Holds |
| §2.2.1 compact objects | Evaluation adjoints; bar coequalizer | κ-compact iff objectwise | `ev_C` right adjoint is a cotensor (preserves κ-filtered colimits); F a colimit of fewer than κ free diagrams | Holds |
| §2.3.1 slices | C = `[0]_S`; C empty | Downward-closed subsets; one slice | Structure map forced by the unit; empty family only | Holds; HTT line 40872 |
| §2.5.1, `exists_isSmall_weakSaturation_eq_functorCategory` | J empty; J a point; `simp` probe | Small generating set | Terminal category: one map each side; point: S = S₀; `simp` makes no progress | Holds; not padding |
| §2.6.1, `exists_injectiveModelCategory` | J a point; J discrete on 2; `infer_instance` probe | Objectwise W and cofibrations | Recovers A; product structure; no instance found | Holds; not padding |
| §3.2.1 homotopy Kan extensions | C a point, F = Δ[1]; `{0} ⊆ [1]`, F = ∂Δ[1] | `Δ{0} ⊆ Δ[1]` qualifies, `∂Δ[1] ⊆ Δ[1]` not; `f_*F(1)` contractible | π₀ 1→1 and 2→1; comma category at 1 empty, limit `Δ[0]` | Holds |
| §4.3.1 coends | J a point; i = `Δ{0} ⊆ Δ[1]`, j = `∅ ⊆ Δ[0]` | Left Quillen bifunctor | Coend = ⊗; `i □ j = i`, π₀ 1→1 | Holds; HTT line 39399 |
| §4.5.2, `isWeakHomotopyEquivalence_diag_map` | `Δ[0] ⊠ Δ[1] → ∗`; the transpose, k = 0, 1, 2 | Levelwise equivalence gives diagonal equivalence | Components π₀ 1→1, diagonal `Δ[1] → Δ[0]`; transpose components 2→1, 3→1, 4→1 | Holds; Lean tests `X.obj n`, the outer index |
| §4.5.3 connectivity | Cofibres of `u_k` and of `∂Δ[k] ⊆ Δ[k]`; k = 0 | `u_k □ ∂` is n-connective | Cofibres `(n−k+1)`- and k-connective, smash `(n+1)`-connective; k = 0 gives `f_0` | Previous R04 repaired |
| §4.5.4 hypercovers | Čech nerve of a trivial fibration U → X | Diagonal equivalent to X | Matching maps: U → X, then isomorphisms; each `U_{•,k} → X_k` lifts against boundaries | Holds |
| §5.1.1 weak equivalences | `[0]_S → [1]_S`; one object with the loop group of S² | First clause alone, π₀ alone, both insufficient | Mapping maps pt→pt but `Map(Y, X) = ∅`; π₀ categories equal, G → pt not an equivalence | Holds |
| §5.5.1, `IsQuasiFibration` | Point → walking isomorphism; discrete 2 → walking isomorphism | Neither is a quasi-fibration | Lifts of 0 ≅ 1 with target over 1: 0 and 0; arrow equality forces `F(Y′) = Y` | Holds |
| §5.5.2 equivalences | Two objects, `Δ[1]` under max, `g∘f` = vertex 1 | Equivalence, not invertible | Associativity: `(g∘f)∘a = 1 = g∘(f∘a)`; `π₀ Δ[1]` a point; 1 ≠ 0 | Holds |
| §5.6.1–5.6.2 invertibility, excellence | S sets, trivial structure; C = `[1]_S` | Hypothesis holds; clause "invertible" needed | Pushout along `[1] → [1]^∼` at an isomorphism ≅ C; `Map(Y, X)`: ∅ → pt | Holds; HTT lines 40107–40171 |
| §5.7.4, `combinatorialDwyerKanEquivalences_of_isPushout_interval_toInvertible` | C = `[1]_S`, i = id | Dwyer–Kan equivalence under `hf` | `π₀ Map(1, 0) = ∅`, so `hf` false and the instance is excluded | R03 ownership |
| §5.9.1 (HTT A.3.1.10) | K = Δ[0] | β an isomorphism | `Δ[0] ⊗ F(X) = F(X) = F(Δ[0] ⊗ X)`; source asks X, K cofibrant (line 39794) | Holds |
| §6.1.1, both `exists_…_sSetDiagram` | C = `[0]_S`; C empty | Objectwise classes | Recover the classes of simplicial sets; one diagram, one map | R03 ownership |
| §6.4.1–6.4.3 | C a point, A Kan complexes | Homotopy limit iff homotopy equivalence | `Map(A, B) → Map(A, F(∗))` an equivalence for all Kan A; source asks F, G projectively fibrant (line 40771) | Holds |
| `exists_enrichedCatModelCategory` | S sets, trivial structure | Model structure on `Cat_S` | W = equivalences of categories; left lifting class of surjective-on-objects, hom-bijective functors = injective on objects | Holds; carrier R01 |
| `exists_bergnerModelCategory` | `[0]_S → [1]^∼_S` | In W, not a cofibration | Mapping map pt→pt, one isomorphism class; a retract of a free category has no non-identity isomorphism | R03 ownership |
| `isFibrant_iff_isLocallyKan` | `[1]_{Δ[0]}`; `[1]_{Λ[2,1]}` | Fibrant; not fibrant | `Δ[0]` Kan; `Λ[2,1]` has an unfillable horn | R03 ownership |
| `fibration_iff_isQuasiFibration` | `[0]_S → [1]^∼_S`; Bergner (F2) against the π₀ form | Not a fibration; forms agree | Zero lifts of 0 ≅ 1; every class in π₀ has a vertex, edge zigzags lift along Kan fibrations | R03 ownership |
| `isLocalizedEquivalence_restriction` | F = identity | Equivalence of localizations | Restriction is the identity functor | R03 ownership |
| §5.8.2 square | G = id, B = ℤ/2, C = Čech nerve of ℤ → ℤ/2 | Homotopy pullback | Monoid maps ℤ/2 → ℤ: 1; ℤ/2 → ℤ/2: 2; not an equivalence | R04 |
| Scope, agreement of classes | The two cited criteria | Classes agree | G2.1: Kan-group criterion after fibrant replacement; KanQuillen §3.1.1: `Ex^∞` criterion; link `X → Ex^∞ X` stated by neither | R05 |
| §5.4.5 route | Retract of a cell complex | "hence a transfinite composition" | Own Check: cell complexes not closed under retracts; §1.3.1 has no cell presentation | R07 |
| §3.4.3 | Poset `{0 < 1}` | α : π^*G → F | B = {(0,0), (1,0), (1,1)}; `(1,0) ≤ (0,0)` forces `G(1) → G(0)` | R08 |
| Pins and build | Three imports; `comp` names | Present | 0 of 3 modules; `unitComp` at `NaturalTransformation.lean:209` | R01, R02 |

- Source locators: 70 distinct HTT label-and-page pairs of the README compared with the text (§§A.2.8, A.2.9.21–31, A.3.1, A.3.2, A.3.3, A.3.6.12–14, 6.5.3.10–11, 6.5.4.7, 5.5.8.13), no mismatch; the statements of the 15 sampled sections read at their locators; Ber07 Thm. 1.1 read (line 95).
- Library declarations opened at the pins: 27 Mathlib names of the contract found; Tau Ceti `Bisimplicial.lean:83`, `Matching.lean:78`, `Hypercover.lean:66`, `TrivialFibration.lean:171`, `TensorProduct.lean:97`, `NaturalTransformation.lean:209,234,257`.
- Cross-roadmap citations: every cited section of Part ModelCategories and Part KanQuillen exists at this head; BordismFormalGroups §F6.5 and GeneralizedCohomology §G2.1 read on main.
- Dependency check: `depcheck: 261 roadmaps, 2594 edges, 0 problem(s)`; no UPWARD or CYCLE line. Changes outside the pull request's own folders: none.
- Gate: FAIL (`imports=3`, `build=7`, `residue=1`); all other counters 0.
- Elaboration: the file as it stands stops at the imports. Scratch copy with the R01 changes: 22 `#check @name` signatures compared with the README, no binder lost; one-tactic probes (`constructor <;> infer_instance`, `simp`, `infer_instance`) close none of the three theorems tried. Layer 5 past `enrichedTrivialFibrations` was not elaborated.
- Pull request text: adds a new folder, as stated; word count 17.7k matches; the one contradiction with the head is in R05.
- Padding: none found; the three proved `unitComp_*` theorems are the category axioms of `SSetDiagram`.

Overlap check: read InfinityCategoryFoundations, LimitsAndKanExtensions, Straightening, DerivedInfinityCategories, PresentableInfinityCategories (open, all defer to this Part), BordismFormalGroups, GeneralizedCohomology, StableHomotopyKTheory, EnhancedDerivedSheaves (main). Shared: the Bergner structure, excellence and invertibility of simplicial sets, local fibrations, simplicial diagram structures and their invariance, owner BordismFormalGroups §F6.5 item 1 (R03).

Source independence: 14 passages compared with 2 sources (HTT, Ber07), none shared; largest share HTT, about 248 of 260 locator groups; contents compared with HTT: independent (Layer 1 ↔ A.3.1, Layer 2 ↔ A.2.8 + end of A.3.3, Layer 3 ↔ A.2.8 + A.3.6, Layer 4 ↔ A.2.9 + 6.5.3, Layer 5 ↔ A.3.2 + A.3.1.10, Layer 6 ↔ A.3.3: not in the source's order; inside Layers 5 and 6 the order is forced by the *Needs* lines of §§5.4.2, 5.6.1, 5.8.1, 6.2.1, 6.3.1). GJ99, DK80 and Kerodon could not be read.

Research link: the headline targets are the model structure on S-enriched categories of Lurie (HTT, 2009, Prop. A.3.2.4, Thm. A.3.2.24), Bergner's on simplicial categories (2007, Thm. 1.1) and Dwyer–Kan's invertibility theorem (1980); they are prerequisites of the coherent nerve and straightening. Rests on the README's Scope and on HTT §A.3.

## Not verifiable

- GJ99, Prop. IV.1.7 (§4.5.2): the sources service resolves the book only to a paywalled publisher.
- DK80, §4 and §§4–6 (§§5.4.5, 5.7.1–5.7.4): paywalled; the section numbers and the reduction to a generator in degree 0 were not checked against the text.
- Kerodon, Definition 3.1.7.12 and Prop. 3.3.7.6, Cor. 3.3.7.7: the service does not classify the host; the numbering was not checked.
- The description's claim that all files elaborate against Tau Ceti `8b9f13d993`: that is not the pin tested here.
- Elaboration of the Layer 5 declarations after `enrichedTrivialFibrations`: their carriers are absent at the pin.

## Source issues

- **Misprint** in HTT at the definition of `C₀` before Proposition A.3.2.4, printed p. 858: the source calls the generators morphisms of S; it should say morphisms of the category of S-enriched categories; affects nothing.
- **Misprint** in HTT at Proposition A.2.8.7, proof, printed p. 833: the source says restriction preserves weak cofibrations; it should say injective cofibrations; affects nothing.
- **Misprint** in HTT at Lemma A.2.8.10, proof, printed p. 834: the source writes the left adjoint of the functor g with the letter q; it should use g throughout; affects nothing.
- **Misprint** in HTT at Proposition A.2.9.26, printed p. 847: the source refers to A.3.1.1 as a proposition and asks the target of the coend for small limits; it should say definition and small colimits; affects nothing.
- **Misprint** in HTT at Remark A.3.1.9, printed p. 855: the source swaps the two indices of the comparison map inside the argument; it should keep the order of the first sentence; affects nothing.
- **Misprint** in HTT at Proposition A.3.1.10, proof, printed p. 855: the source factors a map called f′ and writes one Hom-set in the homotopy category of D; it should factor f and use the homotopy category of C; affects nothing.
- **Misprint** in HTT at Proposition A.3.3.8, proof, condition (∗), printed p. 872: the source takes objects in the target category and maps mapping objects from target to source; it should take objects of the source and map to the target; affects nothing.
- **Misprint** in HTT at Proposition A.3.3.12, proof, printed p. 877: the source speaks of a trivial weak cofibration; it should say injective trivial cofibration; affects nothing.
- **Misprint** in HTT at the definition of slices and Lemmas A.3.3.15–A.3.3.17, printed pp. 879–883: the source writes mapping objects of the model category; it should write those of the indexing category; affects nothing.
- **Misprint** in HTT at Lemma A.3.6.14, printed p. 902: the source gives the diagram G the poset as domain; it should be the opposite poset; affects nothing.
- **Gap** in HTT at Remark A.3.2.17, printed p. 863: the source deduces that every object is cofibrant from monomorphisms being cofibrations; it should also assume that maps out of the initial object are monomorphisms; affects a stated result.

## For the human reviewers

- Scope and ownership: the description asks the maintainers to decide whether this family replaces BordismFormalGroups §F6.5 item 1 on main (`TauCetiRoadmap/BordismFormalGroups/README.md:1561–1623`) and how it relates to open #1807; R03 applies the standing rule that main owns.
- Pin: the description says the files elaborate against Tau Ceti `8b9f13d993` and asks for a pin bump; at the repository's pin (`2fd255d`) three imported modules are absent (R01).
- Licence: HTT and HA are author-hosted PDFs at `www.math.ias.edu/~lurie` (`TauCetiRoadmap/ModelCategoryTheory/SimplicialCategories/README.md:1609–1626`); the sources service needed a manual `author-page` classification.
- Not tested: whether a `Suggested.lean` declaration agrees with a public formalisation other than the pinned libraries; none was searched.
