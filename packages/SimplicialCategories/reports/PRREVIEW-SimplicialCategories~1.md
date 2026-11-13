# Review of SimplicialCategories (pull request #2269 at 3bceb5a)
Folder: `TauCetiRoadmap/ModelCategoryTheory/SimplicialCategories/`
**Verdict:** needs changes

## R01 (P1) — `Suggested.lean` does not build at the pinned Tau Ceti

**Location:** `Suggested.lean:4,6,7` — `public import TauCeti.AlgebraicTopology.SimplicialSet.WeakHomotopyEquivalence`, `…SimplicialCategory.HomotopyCategory`, `…CategoryTheory.Enriched.EnrichedCat`; lines 419–449, 520–521 use `UnitGradedNatTrans.comp` and `UnitGradedNatTrans.comp_app`.
**Claim:** The gate fails (`imports`=3, `build`=7). The three modules do not exist at the pinned Tau Ceti (2fd255d, still the pin on main), and the pinned `NaturalTransformation` module that the file imports has no `comp` or `comp_app`.
**Witness:** The pinned Tau Ceti has no `AlgebraicTopology/SimplicialCategory/`, no `SimplicialSet/WeakHomotopyEquivalence.lean` and no `CategoryTheory/Enriched/EnrichedCat.lean`. `CategoryTheory/Enriched/NaturalTransformation.lean:209,234` define `unitComp` and `unitComp_app`.
**Repair:** Delete lines 4, 6 and 7, and rename `UnitGradedNatTrans.comp`/`comp_app` to `unitComp`/`unitComp_app`. Build `Cat_S` on Mathlib's `CategoryTheory.EnrichedCat` (`Mathlib/CategoryTheory/Enriched/EnrichedCat.lean:31`, a bicategory at the pin) and give it a strict category structure in this file:
```lean
instance : Category (EnrichedCat.{w, v, u} V) where
  toCategoryStruct := (EnrichedCat.bicategory (V := V)).toCategoryStruct
  id_comp {C D} F := by
    show EnrichedFunctor.comp V (EnrichedFunctor.id V C) F = F
    exact EnrichedFunctor.ext V (fun _ ↦ rfl) (fun X Y ↦ by simp [EnrichedFunctor.comp, EnrichedFunctor.id])
  comp_id {C D} F := by
    show EnrichedFunctor.comp V F (EnrichedFunctor.id V D) = F
    exact EnrichedFunctor.ext V (fun _ ↦ rfl) (fun X Y ↦ by simp [EnrichedFunctor.comp, EnrichedFunctor.id])
  assoc {A B C D} F G H := by
    show EnrichedFunctor.comp V (EnrichedFunctor.comp V F G) H =
      EnrichedFunctor.comp V F (EnrichedFunctor.comp V G H)
    exact EnrichedFunctor.ext V (fun _ ↦ rfl) (fun X Y ↦ by simp [EnrichedFunctor.comp])
```
Give the weak homotopy equivalences a real body (Kerodon, Def. 3.1.7.12): `∀ Z : SSet.{u}, Z.KanComplex → Function.Bijective (SSet.mapπ₀ ((MonoidalClosed.pre f).app Z))`. The π₀-homotopy category is needed only by declarations that R03 deletes. If they stay, either define it here or name them in the docstring as not statable at the pins. Tested: both definitions above elaborate at the pin. With stand-ins for the three modules and the two renames, the whole file elaborates with no errors.

## R02 (P1) — The supplier contracts cite Tau Ceti declarations that do not exist at the pin

**Location:** `README.md:164–175` — "`SSet.IsWeakHomotopyEquivalence` (`TauCeti/AlgebraicTopology/SimplicialSet/WeakHomotopyEquivalence.lean`) … `CategoryTheory.EnrichedCat.category` … `TauCeti.SimplicialHomotopyCategory` and `CategoryTheory.EnrichedFunctor.mapHomotopyCategory` … `IsDwyerKanEquivalence` … `TauCeti.UnitGradedNatTrans.comp`"; also Scope `README.md:31–33`, Conventions 75 and 108–109.
**Claim:** Six "From Tau Ceti" items are absent at the pin. The Scope's "Already in the library … Tau Ceti's weak homotopy equivalences, the homotopy category of a simplicial category" is false there, so these prerequisites have no owner.
**Witness:** The pinned Tau Ceti has only `ContinuousMap.IsWeakHomotopyEquivalence` (`Topology/Homotopy/HomotopyGroup/WeakHomotopyEquivalence.lean:78`). It has no `SimplicialHomotopyCategory`, no simplicial `mapHomotopyCategory`, no `IsDwyerKanEquivalence`, no `EnrichedCat.category` and no `UnitGradedNatTrans.comp`.
**Repair:** Move these items out of `### From Tau Ceti`:
- Cite Mathlib's `CategoryTheory.EnrichedCat` (`Mathlib/CategoryTheory/Enriched/EnrichedCat.lean:31`) under `### From Mathlib`, and make its strict category structure (R01) a definition of §5.2.1.
- Take the weak homotopy equivalences from Part KanQuillen §3.1.1.
- Make the π₀-homotopy category of a simplicial category, and the functor that a simplicial functor induces on it, a definition of §5.1.1 with its own Checks.
- Delete the sentence on `IsDwyerKanEquivalence`.
- Write `TauCeti.UnitGradedNatTrans.unitComp`.

Then rewrite Scope lines 31–33 to match.

## R03 (P2) — BordismFormalGroups §F6.5 item 1 on main already owns the Bergner structure and the simplicial diagram structures

**Location:** `README.md:35–48` — "Left to other roadmaps: … are Part ModelCategories'; … are Part KanQuillen's." BordismFormalGroups is never named. §1.2.2–§1.2.3, §5.4.2, §5.7, §5.8.4, §6.1.1 and §6.3.1, and `Suggested.lean:99–536`, state the simplicial-sets cases.
**Claim:** These objects have two owners:
- the Bergner model structure;
- (A1)–(A5) for Kan–Quillen simplicial sets, with Dwyer–Kan invertibility;
- the local-fibration characterisation;
- the projective and injective structures on simplicially enriched diagrams, with their Dwyer–Kan invariance.

Main owns them.
**Witness:** On main, `TauCetiRoadmap/BordismFormalGroups/README.md:1561–1590` covers the Bergner model, "the monoidal model axiom", the "Dwyer–Kan invertibility property" and Bergner's characterisation "without assuming the target is fibrant". Lines 1591–1621 cover enriched projective and injective diagram models and "invariance under a Dwyer–Kan equivalence".
**Repair:** Add to Scope: "BordismFormalGroups §F6.5 item 1 owns the Bergner model structure, the excellence of Kan–Quillen simplicial sets with the Dwyer–Kan invertibility property, the local-fibration characterization of Bergner fibrations, and the projective and injective structures on simplicially enriched diagrams with their Dwyer–Kan invariance. This Part states the general forms for an excellent S (HTT, Prop. A.3.2.4, Thm. A.3.2.24, Props. A.3.3.2, A.3.3.8) and cites that item for S = simplicial sets."
- Replace the simplicial-sets statements of §1.2.2–§1.2.3, §5.4.2, §5.7, §5.8.4, §6.1.1 and §6.3.1 by that citation.
- Delete from `Suggested.lean` `isLeftQuillenBifunctor_curriedTensor_sSet`, `exists_bergnerModelCategory`, `combinatorialDwyerKanEquivalences_of_isPushout_interval_toInvertible`, `isFibrant_iff_isLocallyKan`, `fibration_iff_isQuasiFibration`, `exists_projectiveModelCategory_sSetDiagram`, `exists_injectiveModelCategory_sSetDiagram` and `isLocalizedEquivalence_restriction`, together with the definitions only they use.

Making this family the owner instead needs a revision of BordismFormalGroups on main, merged first.

## R04 (P2) — The inclusion `[0]_S → [1]^∼_S` is not a cofibration

**Location:** `README.md:1312–1313` — "The simplicial category of Kan complexes `Kan` is fibrant, and the inclusion `[0]_S → [1]^∼_S` is a trivial cofibration (§5.4, §5.6)."
**Claim:** For S simplicial sets, this inclusion is a weak equivalence but not a cofibration. That is why HTT Rem. A.3.2.14 (§5.6.1, second bullet) factors `[1]_S → [1]^∼_S` through E.
**Witness:** In a `C₀`-cell complex the vertices form a free category: cells `[1]_{∂Δ[n]} → [1]_{Δ[n]}` with n ≥ 1 add no vertices. A free category has no isomorphism between distinct objects, so `[1]^∼_S` is not a retract of such a complex.
**Repair:** "…is fibrant, and the inclusion `[0]_S → [1]^∼_S` is a weak equivalence but not a cofibration: in a cell complex built from `C₀` the vertices form a free category, which has no isomorphism between distinct objects (§5.4, §5.6)."

## R05 (P3) — A Layer 4 Example contradicts the convention fixed in §4.5.1

**Location:** `README.md:857–858` — "The map `Δ[1] ⊠ Δ[0] → Δ[0] ⊠ Δ[0]` is a weak equivalence in every degree, and its diagonal is `Δ[1] → Δ[0]` (§4.5)."
**Claim:** Under §4.5.1's convention, `X_k = X([k])` and `Δ[p] ⊠ Δ[q]` sends `([k],[l])` to `Δ[p]_k × Δ[q]_l`. The components `f_k` of this map are then not weak equivalences, so the Example is not an instance of §4.5.2.
**Witness:** `(Δ[1] ⊠ Δ[0])_k` is the discrete simplicial set on the k + 2 elements of `Δ[1]_k`. Its map to `Δ[0]` has k + 2 components on the source side.
**Repair:** "The map `Δ[0] ⊠ Δ[1] → Δ[0] ⊠ Δ[0]` is the weak homotopy equivalence `Δ[1] → Δ[0]` in every degree k, and its diagonal is `Δ[1] → Δ[0]` (§4.5)."

## R06 (P3) — The §4.5.2–§4.5.3 routes attach along `f_k` instead of the relative latching map

**Location:** `README.md:813` — "each skeletal stage is a homotopy pushout of `f_k □ (∂Δ[k] ⊆ Δ[k])`"; the same step at `README.md:828`.
**Claim:** The relative skeletal filtration attaches along the pushout-product of the relative latching map `X_k ⊔_{L_k X} L_k Y → Y_k` with `∂Δ[k] ⊆ Δ[k]`. The map `f_k` alone ignores degeneracies.
**Witness:** Take `X = ∅` and `Y` the constant bisimplicial point. Then `f_k □ (∂Δ[k] ⊆ Δ[k])` is `∂Δ[k] ⊆ Δ[k]` for every k, yet `diag Y = Δ[0]`: for k ≥ 1 the relative latching maps are isomorphisms.
**Repair:** §4.5.2 route: "replace f by a monomorphism and filter by `X ∪ sk_k Y`; the diagonal of each step is a pushout of `(X_k ⊔_{L_k X} L_k Y → Y_k) □ (∂Δ[k] ⊆ Δ[k])`; by induction on k and left properness `L_k X → L_k Y` is a weak equivalence, so the relative latching map is a trivial cofibration; conclude with §4.2."
§4.5.3 route: "`L_k X → L_k Y` is a colimit of maps `f_j`, j < k, hence (n − k + 1)-connective, so the relative latching map is (n − k)-connective and its pushout-product with `∂Δ[k] ⊆ Δ[k]` is n-connective."

## R07 (P3) — A Layer 3 Example omits that `X₀` is a Kan complex

**Location:** `README.md:670–671` — "a tower of Kan fibrations `⋯ → X₂ → X₁ → X₀` is injectively fibrant, so its limit is its homotopy limit (§3.2)."
**Claim:** Injective (Reedy) fibrancy on `ℕᵒᵖ` also requires `X₀ → ∗` to be a fibration.
**Witness:** Take `X_n = Λ[2,1]` with identity maps. Every map in the tower is a Kan fibration, but `Λ[2,1] → Δ[0]` is not one (the inner horn has no filler), so the tower is not injectively fibrant.
**Repair:** "…a tower of Kan fibrations `⋯ → X₂ → X₁ → X₀` between Kan complexes is injectively fibrant, so its limit is its homotopy limit (§3.2)."

## R08 (P3) — The third Check of §1.1.1 does not distinguish the right definition from the wrong one

**Location:** `README.md:245–248` — "a definition using `F(i, j)` … would test the map `∂Δ[1] × ∂Δ[1] → Δ[1] × Δ[1]`, which forgets the four boundary edges."
**Claim:** The wrong definition reaches the same verdict on this instance, so the Check does not discriminate.
**Witness:** `∂Δ[1] × ∂Δ[1] → Δ[1] × Δ[1]` is a monomorphism, like `i □ j`, so both definitions accept the cofibration clause.
**Repair:** "For `i = (Δ{0} ⊆ Δ[1])` and `j = (∅ ⊆ Δ[0])`, `i □ j = (Δ{0} ⊆ Δ[1])` is a trivial cofibration, while `F(i, j) = (∅ → Δ[1])` is not a weak equivalence: a definition using `F(i, j)` in place of the pushout-product would reject the product of simplicial sets."

## R09 (P3) — Five Lean names do not appear in the README

**Location:** `Suggested.lean:297, 310, 343, 346, 349` — `constSSet`, `DiscreteEnrichment`, `interval.zero`, `interval.one`, `interval.arrow`.
**Claim:** Every Lean name must appear in the README. These five appear nowhere in it.
**Witness:** Searching `README.md` for each name in backticks gives 0 matches for all five.
**Repair:** Add to §5.6.1: "For S simplicial sets, `[1]_S` and `[1]^∼_S` are `DiscreteEnrichment` of an ordinary category (the poset `0 ≤ 1` and the codiscrete category on two objects): the enrichment in types transported along the constant-simplicial-set functor `constSSet`. `interval.zero` and `interval.one` are the objects of `[1]_S`, and `interval.arrow` is the vertex of `Map(0, 1)`." If R03 deletes the only declaration that uses them, delete them instead.

## R10 (P3) — The description misstates why the build fails

**Location:** Pull-request description, **Tau Ceti pin.** — "3 of the 4 member `Suggested.lean` files import Tau Ceti modules that are newer than the pinned Tau Ceti commit (2fd255d)".
**Claim:** The text gives a pin bump as the only cause. The head also uses `UnitGradedNatTrans.comp`/`comp_app`, which are absent from the pinned module it imports.
**Witness:** The pinned `TauCeti/CategoryTheory/Enriched/NaturalTransformation.lean:209,234` defines `unitComp` and `unitComp_app`. Elaborating at the pin reports `Unknown constant TauCeti.UnitGradedNatTrans.comp_app`.
**Repair:** After R01: "Every member's `Suggested.lean` elaborates against the pinned Tau Ceti (2fd255d)." Until then, add: "SimplicialCategories also uses `UnitGradedNatTrans.comp` and `comp_app`, which the pinned module names `unitComp` and `unitComp_app`."

## R11 (P3) — The description understates the overlap with BordismFormalGroups

**Location:** Pull-request description — "**BordismFormalGroups §F6.5 item 1:** the Bergner model structure, weak exponentials and Reedy structures."
**Claim:** That item also plans the Dwyer–Kan invertibility property, the local-fibration characterisation, and the simplicially enriched projective and injective diagram structures with Dwyer–Kan invariance. This Part states all of them in §5.7, §5.8, §6.1 and §6.3.
**Witness:** On main, `TauCetiRoadmap/BordismFormalGroups/README.md:1575–1590` (invertibility, local fibrations) and `:1591–1621` (enriched diagram models, Dwyer–Kan invariance).
**Repair:** "**BordismFormalGroups §F6.5 item 1:** the Bergner model structure, the excellence of Kan–Quillen simplicial sets with the Dwyer–Kan invertibility property, the local-fibration characterization, the projective and injective structures on simplicially enriched diagrams with their Dwyer–Kan invariance, weak exponentials and Reedy structures; SimplicialCategories cites that item for S = simplicial sets."

## Verified sound

| Statement | Instances tried | Roadmap side | Computed / source side | Result |
|---|---|---|---|---|
| §1.1 left Quillen bifunctor (HTT Def. A.3.1.1, p. 869) | `×` on sSet; `i = Δ{0}⊆Δ[1]`, `j = ∅⊆Δ[0]` | `i □ j` tested | `i □ j = Δ{0}⊆Δ[1]` is a w.e.; `F(i,j) = ∅→Δ[1]` is not; HTT 39610–39620 agrees | sound; Check → R08 |
| §1.2 monoidal model category (Def. A.3.1.2, Ex. A.3.1.4, p. 869) | Ch(ℤ) injective; Set with cofibrations = isos | the bifunctor and unit clauses fail | `(×2 on ℤ) □ (0→ℤ/2)` is the zero map on `ℤ/2`, not mono; `∅→{∗}` is not a cofibration | sound |
| §1.3 enriched model category (Def. A.3.1.5; Rem. A.3.1.6 (2′), p. 870; Rem. A.3.1.8, p. 872) | the W = iso structure; `X = Δ[0]` | the two-variable clause is needed | `(∅→Δ[0]) □ (Δ{0}⊆Δ[1]) = Δ{0}⊆Δ[1]`, not an iso; `Map(Δ[0],Y) = Y` | sound |
| §2.1 classes of `A^C` (Def. A.3.3.1, p. 888) | C = `[1]`, `F = Δ[0]⊔Δ[0]→Δ[0]` | injective cofibrant, not projective | the fold map is not mono; an injective fibration needs `F(0)→F(1)×_{G(1)}G(0)` to be a fibration | sound |
| §2.4 objectwise generation (Lemma A.3.3.3, p. 888; condition (iv), p. 896; A.3.3.15–17, pp. 897–901) | C empty | the generated class is all maps | `weakSaturation ∅` contains identities (transfinite composition of length one) | sound |
| §3.4 homotopy limits over posets (Lemmas A.3.6.12–14, pp. 919–920) | C = `[1]` with final 1; `r(a,b) = (a₀,b)` | X a homotopy limit | holim = `F(0) ≃ F(1) ≃ X`; `r ≤ id` in `Aᵒᵖ × A` holds | sound |
| §4.2 latching criteria (Cor. A.2.9.24, p. 863; A.2.9.25, p. 864) | a well-ordered C | "∅ if X > Y" | HTT "∅ if X ≰ Y" is the same under a total order | sound |
| §4.4 realization (Ex. A.2.9.29, Cor. A.2.9.30, p. 867; Ex. A.2.9.31, p. 868) | `sk₀ ⊆` nerve of the walking isomorphism | colim is not Reedy left Quillen | colims: two points → one point, not mono; `(∫(X,Δ^•))_m = X_{m,m}` by co-Yoneda | sound |
| §4.5 diagonals and hypercovers (GJ IV.1.7; HTT 6.5.3.10–11, pp. 697–698; Rem. 6.5.4.7, p. 703; 5.5.8.13, p. 534; HA 1.3.3.10, pp. 102–103) | `Δ[1]⊠Δ[0]`; X = ∅, Y = point | f_k-based route | the outer components are k + 2 points; the relative latching maps are isos for k ≥ 1 | R05, R06 |
| §5.2 generators (Prop. A.3.2.4 and notation, p. 876) | `rlp(C₀)` | `enrichedTrivialFibrations` | `∅→[0]_S` gives surjectivity on objects; `[1]_K→[1]_L` gives `Map ∈ rlp(I)` = trivial fibrations | sound |
| §5.5 quasi-fibrations, local fibrations (Defs. A.3.2.7, A.3.2.9, Rem. A.3.2.10, pp. 879–880) | `[0]→` walking iso; `Δ[1]` with max | not a quasi-fibration; f is an equivalence | 1 is not in the image; `g∘f = 1 ≠ 0 = id`, `π₀Δ[1] = ∗` | sound |
| §5.6 invertibility hypothesis, excellence (Not. A.3.2.11 – Def. A.3.2.16, pp. 880–881) | S = Set (trivial structure); `C = [1]_S` | (A5) holds; the clause is needed | inverse forced, `g = gff⁻¹ = f⁻¹`; on `Map(Y,X)` the map `∅→𝟙` is not a w.e. | sound |
| §5.7 sSet excellent (Ex. A.3.2.18, p. 881) | `C = [1]_S`, `i = id` | `hf` | `π₀ Map(1,0) = ∅`, so `hf` is false and the instance is excluded; DK80 not read | sound (Lean); route unread |
| §5.8 fibrant objects, fibrations (Thm. A.3.2.24, Rem. A.3.2.25, Lemma A.3.2.26, pp. 883–886; Ber07 Thm. 1.1) | `[1]_{Λ[2,1]}`; Bergner (F2) | π₀-quasi-fibration + Kan on Map | edge zigzags lift through Kan fibrations, so the condition ⇔ (F2); `Λ[2,1]` is not Kan | sound |
| §6.4 enriched homotopy Kan extensions (Prop. A.3.3.12, Rem. A.3.3.11, p. 894; Rem. A.3.3.13, p. 895) | A = Kan, `Δ[0]→S←Δ[0]`; C empty | ΩS a homotopy limit, `Δ[0]` not | `π₀ Map(Δ[0],ΩS) = ℤ` versus a point; B contractible ⇔ all `Map(A,B)` contractible | sound |
| `exists_enrichedCatModelCategory` (A.3.2.4) | S = Set (trivial structure) | the model structure, cofibrations = `llp` | Cat with equivalences of categories; injective-on-objects functors = llp(surjective on objects, bijective on Map) | sound |
| hypothesis `IsMonoidal` | all objects cofibrant, tensor left Quillen | added instance | Ken Brown: `X ⊗ −` preserves all w.e. | sound, implied |
| `exists_bergnerModelCategory` | Ber07 (W1)–(W2) | `EssSurj` of the π₀-functor | (W1) gives π₀ fully faithful, so (W2) ⇔ essentially surjective | sound; R03 |
| `isFibrant_iff_isLocallyKan`, `fibration_iff_isQuasiFibration` | `[1]_{Δ[0]}`; `C → [0]_S` | locally Kan ⇔ fibrant | ∅ and Δ[0] are Kan; over a point the quasi-fibration clause holds automatically | sound; R03 |
| `exists_*ModelCategory_sSetDiagram` (A.3.3.2) | C empty; `C = [0]` | the objectwise classes | the terminal category; the Kan–Quillen structure recovered | sound; R03 |
| `isLocalizedEquivalence_restriction` (A.3.3.8) | `[0]→[1]^∼`; `[0]→[1]_S` | hF true / false | sSet^{[1]^∼} ≃ sSet; arrows ≄ sSet, and hF fails there | sound; R03 |
| Layer 5 Example `[0]_S→[1]^∼_S` | Bergner cell complexes | "trivial cofibration" | vertex categories are free and have no iso between distinct objects | false, R04 |
| Layer 3 Example (towers) | `X_n = Λ[2,1]`, identities | injectively fibrant | `X₀ → ∗` is not a Kan fibration | R07 |
| Build | gate; probe with stand-ins | elaborates | gate FAIL; probe: 0 errors after the `unitComp` rename | R01 |

- Source locators checked against the text: 78 HTT (every sampled target, including proof-step locators, and bibliography entry [21]), Ber07 Thm. 1.1, HA Lemma 1.3.3.10; all match their statement numbers, PDF pages and hypotheses except where noted under Source issues.
- Library declarations opened at the pins: Mathlib `Enriched/EnrichedCat.lean:31`, `Enriched/Basic.lean:116,173,328`, `SimplicialSet/CategoryWithFibrations.lean:40–75`, `SimplicialSet/KanComplex.lean:40`, `SimplicialSet/PiZero.lean:93`, `Localization/Monoidal/Basic.lean:86`, `Reedy/SimplexCategory.lean:42`, `AnodyneExtensions/PushoutProduct.lean:99`, `SmallObject/Basic.lean:127`. Tau Ceti `Enriched/NaturalTransformation.lean:33,209,234,257`, `SimplicialObject/Bisimplicial.lean:83`, `Matching.lean:78`, `Hypercover.lean:66`, `TrivialFibration.lean:171`, `WeaklyContractible.lean:99`, `TensorProduct.lean:97`, `SimplicialSet/WeakEquivalence.lean:56`.
- Cross-roadmap citations resolved: 31 Part ModelCategories ids (all exist at this head, each with the same HTT locator), 7 Part KanQuillen ids, GeneralizedCohomology §G2 item 1 on main. `IsWeaklySaturated`, `weakSaturation`, `IsCombinatorial`, `IsLeftProper` and `weakHomotopyEquivalences` are identical to the sibling Parts' bodies.
- Gate: FAIL (`imports`=3, `build`=7). Dependency check output: `depcheck: 223 roadmaps, 1972 edges, 0 problem(s)`.
- Elaboration: blocked at the pin. A scratch copy with stand-ins for the three missing modules and the `unitComp` rename elaborates with no errors. `#check @name` for all 47 declarations agrees with the README statements and generality; every needed binder is in its signature (`IsMonoidal` included in `exists_enrichedCatModelCategory`).
- Padding probe: none of the 12 sorried theorems closes with `rfl | simp | infer_instance | decide | trivial`; none restates a definition or mirrors a Check.
- Checks: every README definition has at least 3 Checks; each layer has Examples and Dependencies.
- Overlap check: read InfinityCategoryFoundations, LimitsAndKanExtensions, Straightening, AdjunctionsAndLocalizations, CartesianFibrations, DerivedInfinityCategories and PresentableInfinityCategories (open; all cite this Part), and BordismFormalGroups, EnhancedDerivedSheaves and GeneralizedCohomology (main). Shared: the Bergner structure, Kan–Quillen excellence and the simplicial enriched diagram structures, owned by BordismFormalGroups §F6.5 item 1 (R03). Nothing else is shared.
- Source independence: 25 passages compared with 3 sources (HTT, Ber07, HA). Only wording that the statements force is shared. Largest share is HTT, about 276 of 301 locators. Contents compared with HTT Appendix A: independent. Layer 1 (A.3.1) precedes Layers 2–4 (A.2.8–A.2.9); Layer 2 merges A.2.8.2 with A.3.3.3's proof; Layer 4 adds GJ IV.1.7 and HTT §6.5.3. The order of Layers 5–6 and of §5.1–§5.8 is forced by *Needs:* lines (§6.1.1 needs §5.6.2; §5.8 needs §5.4, §5.6).

## Not verifiable

- DK80 §§4–6 (§5.7.1–§5.7.4): JPAA 1980; the sources service resolves it only to a paywalled page, so it is cited by locator and the routes were not checked.
- GJ99 Prop. IV.1.7 (§4.5.2): a Birkhäuser book cited by locator; no legal open copy was fetched.
- KL01 (§5.2.1): the sources service found no legal source (the TAC host is in no licence class; the PDF URL returns 404).
- Kerodon Def. 3.1.7.12, Prop. 3.3.7.6, Cor. 3.3.7.7 (Conventions, contracts): outside the sample; not opened.
- The description's claim that the files elaborate against Tau Ceti 8b9f13d993: that commit is not available here.

## Source issues

- **Misprint** in HTT at Prop. A.2.9.26, PDF p. 865: the source refers to Proposition A.3.1.1 for left Quillen bifunctors; it should refer to Definition A.3.1.1; affects nothing.
- **Misprint** in HTT at §A.2.9, before Prop. A.2.9.26, PDF p. 865: the target of the coend is required to admit small limits; it should be small colimits, since the coend is a coequalizer of coproducts; affects nothing.
- **Misprint** in HTT at Rem. A.2.9.27, PDF p. 866: the last sentence makes h trivial when i or h is trivial; it should say when i or g is trivial; affects nothing.
- **Misprint** in HTT at Rem. A.3.1.9, PDF p. 873: the indices of β are written in the order (S, X); it should be β_{X,S}, as defined on p. 872; affects nothing.
- **Misprint** in HTT at Prop. A.3.3.8, proof, condition (∗), PDF p. 890: the map runs from mapping objects of C′ to those of C for objects of C′; it should run from `Map_C(C, D)` to `Map_{C′}(fC, fD)` for C, D in C; affects nothing.
- **Error** in HTT at §A.3.2, before Def. A.3.2.1, PDF p. 875: the source says the localization S → hS is monoidal for every monoidal model category; in general it is only lax monoidal (strong when every object is cofibrant; Ch(ℤ), `ℤ/2 ⊗ ℤ/2`); affects nothing.
- **Gap** in HTT at Rem. A.3.2.17, PDF p. 881: the source says that axiom (A2) alone makes every object cofibrant; that needs each `∅ → X` to be a monomorphism, for example a strict initial object; affects a stated result (the roadmap adds the clause to (A2)).
- **Misprint** in HTT at Lemma A.3.6.14, proof, PDF p. 920: the proof says G(a₀) is a limit of F₀; it should be a homotopy limit; affects nothing.
- **Misprint** in HTT at Thm. A.3.2.24, proof, PDF p. 886: the proof asks that F′ of f′_i be the identity; it should be F′ of f″_i; affects nothing.

## For the human reviewers

- Licence: HTT and HA were read from the author's page `www.math.ias.edu/~lurie`, a host that the sources service does not classify; this review classified it as `author-page`.
- Not tested: whether a `Suggested.lean` declaration agrees with a public formalisation other than the pinned libraries; no such repository was searched.
