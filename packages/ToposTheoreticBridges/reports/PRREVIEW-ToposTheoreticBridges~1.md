# Review of ToposTheoreticBridges (pull request #2337 at f1fdd74)

**Verdict:** needs changes

## R01 (P2) — `IsRightOre` restates a pinned Mathlib definition

**Location:** `TauCetiRoadmap/ToposTheoreticBridges/Suggested.lean` line 47, `def IsRightOre (C : Type*) [Category C] : Prop`; README 2.2, "Define `IsRightOre C` (Convention 2)".
**Claim:** The right Ore condition on a category is already defined at the pinned Mathlib, with the same body; the roadmap defines it a second time and does not list it under "Supplied by Mathlib".
**Witness:** `CategoryTheory.GrothendieckTopology.RightOreCondition`, `Mathlib/CategoryTheory/Sites/Grothendieck.lean` line 394 (with `right_ore_of_pullbacks`, line 397). `IsRightOre C ↔ RightOreCondition C` closes by `⟨fun h _ _ _ f g => h f g, fun h _ _ _ f g => h f g⟩`.
**Repair:** Delete `IsRightOre` from both files. State 2.2 as `GrothendieckTopology.RightOreCondition C ↔ GrothendieckTopology.RightOreCondition D` (elaborates at the pin with `sorry` only), cite the declaration and `right_ore_of_pullbacks` under "From Mathlib", and keep Convention 2 as the description of that declaration.

## R02 (P2) — the identification of `Karoubi C` inside the presheaf topos has two owners

**Location:** README 1.2, "these are the retracts of representables, which form a category equivalent to `Karoubi C` through the Yoneda embedding extended to `Karoubi C`"; Layer 1 Dependencies, "Mathlib only."
**Claim:** GrothendieckTopoi 6.5 already owns this object: it targets the equivalence of the connected nonempty projective objects (essential points) of `Cᵒᵖ ⥤ Type u` with `Idempotents.Karoubi C`. 1.2 plans it again as an unnamed step.
**Witness:** GrothendieckTopoi README (open head) 6.5: "the essential points of `Cᵒᵖ ⥤ Type u` form the idempotent completion `Idempotents.Karoubi C`, so that `C` is recovered from its presheaf topos up to equivalence exactly when `IsIdempotentComplete C`".
**Repair:** In 1.2 replace the forward route by: "Forward: an equivalence of presheaf topoi preserves connected nonempty projective objects, and these form `Karoubi C` (GrothendieckTopoi 6.5)." Add "GrothendieckTopoi 6.5" to the `*Needs:*` line of 1.2, to "From GrothendieckTopoi" and to Layer 1 Dependencies; keep the Borceux–Dejean locator.

## R03 (P2) — the two readings of topos invariants are promised and are not targets

**Location:** README, Research context: "presheaf topoi, where the invariants « De Morgan topos » and « Boolean topos » are read on the indexing category as the right Ore condition and as being a groupoid"; 2.2: "so the statement is the bridge of the invariant « De Morgan topos »".
**Claim:** No layer defines a De Morgan or Boolean topos or targets either reading; 2.1 and 2.2 prove the invariance through Karoubi envelopes without any invariant of the topos. Layer 2, "invariants of presheaf topoi", contains no invariant of a topos.
**Witness:** `*Needs:*` of 2.1 and 2.2 list only 1.2 and Mathlib `IsGroupoid`, `Karoubi`, `toKaroubi`; the words "De Morgan" and "Boolean" occur in no target sentence ("Define", "Prove").
**Repair:** Add two targets to Layer 2. (a) "`Cᵒᵖ ⥤ Type u` is Boolean (every subobject has a complement) iff `IsGroupoid C`." (b) "`Cᵒᵖ ⥤ Type u` is De Morgan (`¬A ⊔ ¬¬A = ⊤` for every subobject `A`) iff `RightOreCondition C` (Caramello 2009, remark after Theorem 1.7, p. 6)." State 2.1 and 2.2 as their corollaries, both properties being invariant under equivalence, and keep the Karoubi route as a second route. Tested on `Discrete PUnit` (Boolean, groupoid), the monoid `{1, e}` (neither), the free monoid on two letters (not De Morgan, not Ore).

## R04 (P2) — 3.1 and 4.1 assert an unspecified isomorphism; their Checks speak of "the" isomorphism

**Location:** README 3.1, "there is an order isomorphism `Set.Ici J ≃o Set.Ici K`" with Check "`J = K` and the identity equivalence give the identity"; 4.1 Check "A theory and itself: the isomorphism is the identity."
**Claim:** The targets only assert `Nonempty`, so no Check about the map tests them, and the correspondence a bridge transfers (which `K'` matches a given `J'`) is not stated. The first Check of 4.1 is false for a non-identity self-equivalence.
**Witness:** The empty theory over two `0`-ary relation symbols `P`, `Q`: exchanging them is a self-equivalence of its classifying topos carrying the quotient `⊤ ⊢ P` to `⊤ ⊢ Q`; the hypothesis `MoritaEquivalent T T` does not choose the equivalence.
**Repair:** State 3.1 as: there is `φ : Set.Ici J ≃o Set.Ici K` such that for all `J'` and `F : Sheaf J (Type u)`, `Presheaf.IsSheaf J'.1 F.obj ↔ Presheaf.IsSheaf (φ J').1 (e.functor.obj F).obj` (elaborates at the pin; it determines `φ`). State 4.1 for a chosen equivalence `e` of the classifying topoi, the quotients corresponding when `e` matches their subtopoi; reword the Check as "for `e` the identity, the isomorphism is the identity".

## R05 (P2) — 4.1 does not fix its poset and cites ClassifyingTopoi 2.5 for a bijection it does not state

**Location:** README 4.1, "the quotients of `T` and those of `T'`, ordered by inclusion of their consequences in every topos, form isomorphic posets"; supplier contract "2.5: … the duality between quotients of `T` and topologies `J' ≥ J`".
**Claim:** The stated order is a preorder on `{T₁ | T ⊆ T₁}`, not a partial order. ClassifyingTopoi 2.5 holds two existence statements; neither says that `J'` is determined by `T₁` nor that the assignment respects order, which the route "composed with the bijections of ClassifyingTopoi 2.5" uses.
**Witness:** `T₁ = T` and `T₁ = T ∪ {⊤ ⊢ ⊤}` are distinct quotients with the same consequences. ClassifyingTopoi 2.5 (open head): `exists_quotient_topology` "some `J' ≥ J` makes … classify `T'`", `exists_quotient_theory` "some `T' ⊇ T` is classified". Caramello2017Lattices line 483–486 uses classes for syntactic equivalence.
**Repair:** State the carrier as the quotients `T ⊆ T₁` modulo having the same models in every `Sheaf K (Type u)`, ordered by reverse inclusion of models. Add a target to 4.1: for a classifying site `(C, J, U)`, the topology `J'` of ClassifyingTopoi 2.5 depends only on the class of `T₁`, and the classes of quotients are order-isomorphic to `Set.Ici J`. *Needs:* ClassifyingTopoi 2.1, 2.4, 2.5; GrothendieckTopoi 4.2.

## R06 (P3) — 3.1 uses two facts that GrothendieckTopoi 4.2 does not state

**Location:** README supplier contract, "4.2: the order-reversing bijection between subtopoi of `Sheaf J (Type u)` and topologies `J' ≥ J`"; 3.1 route, "the bijection of subtopoi induced by the equivalence, which preserves inclusion".
**Claim:** GrothendieckTopoi 4.2 states order only for closure operators and says of the site-level bijection that the two "correspond"; the transport of subtopoi along an equivalence is no target anywhere. The sentence before "Route:" also lacks its full stop.
**Witness:** GrothendieckTopoi README (open head) 4.2: "subtopoi of `Sheaf J (Type u)` correspond to topologies `J' ≥ J`", with no order clause; a search of that README for a map of `Subtopos` along an equivalence finds none.
**Repair:** Add to 3.1, as targets of this roadmap: "for `J ≤ J₁`, `J ≤ J₂`: `J₁ ≤ J₂` iff every `J₂`-sheaf in `Sheaf J (Type u)` is a `J₁`-sheaf" and "an equivalence `E ≌ E'` induces an order isomorphism `Subtopos E ≃o Subtopos E'` (GrothendieckTopoi 4.1 for `Subtopos`)". Reword the contract to what 4.2 says. End line 232 with "`J' ≥ J`."

## R07 (P3) — two inputs of the backward route of 1.2 do not exist at the pin

**Location:** README 1.2, "`karoubiUniversal` at `D = Type u`, which is idempotent complete, with `(Karoubi C)ᵒᵖ ≌ Karoubi Cᵒᵖ`".
**Claim:** Both facts are written as available; neither is a pinned declaration, a target or on the `*Needs:*` line.
**Witness:** `#synth IsIdempotentComplete (Type u)` fails at the pinned Mathlib; no declaration under `Mathlib/CategoryTheory/Idempotents/` relates `Karoubi Cᵒᵖ` and `(Karoubi C)ᵒᵖ` (the only opposite instance is `IsIdempotentComplete Cᵒᵖ`, `Basic.lean` line 189).
**Repair:** Add to 1.2 two API bullets: "`Type u` is idempotent complete (it has equalizers)" and "`(Karoubi C)ᵒᵖ ≌ Karoubi Cᵒᵖ`, sending `(X, p)` to `(op X, p.op)`", and name them in the route as targets of 1.2.

## R08 (P3) — 4.1 Check: wrong variance for the object classifier

**Location:** README 4.1, second Check: "the first is classified by the presheaves on finite sets (ClassifyingTopoi 3.2), with a point for every set".
**Claim:** Presheaves on finite sets classify Boolean algebras; the object classifier is the covariant functors.
**Witness:** ClassifyingTopoi README (open head) 3.2, Checks: "with `FintypeCat.Skeleton` itself as site (presheaves on finite sets), the topos would be functors on `FinSetᵒᵖ` … which classifies Boolean algebras (3.1), not objects."
**Repair:** "the first is classified by the functors from finite sets to sets, the presheaves on `FintypeCat.Skeleton.{u}ᵒᵖ` (ClassifyingTopoi 3.2), with a point for every set".

## R09 (P3) — Borceux–Dejean page locators are one page early

**Location:** README 1.2, "(Borceux–Dejean 1986, Theorem 1 (4), pp. 133–134, and Proposition 2, pp. 134–135)".
**Claim:** Theorem 1 is stated on p. 134 and proved on p. 135; Proposition 2 is stated on p. 135. Page 133 holds the title and the summary.
**Witness:** BorceuxDejean1986 line 70 (page number 134), line 99 (Theorem 1), line 109 (page number 135), line 134 (Proposition 2).
**Repair:** "(Borceux–Dejean 1986, Theorem 1 (4), p. 134, proof p. 135, and Proposition 2, p. 135)".

## R10 (P3) — a backticked name of this roadmap that `Suggested.lean` does not declare

**Location:** README 4.1, "Prove `MoritaEquivalent.quotientLattice`"; `Suggested.lean` line 16.
**Claim:** A backticked name of the roadmap's own claims a declaration of `Suggested.lean`; this one is not declared, and it sits in the namespace of ClassifyingTopoi's `MoritaEquivalent`.
**Witness:** `Suggested.lean` declares six names, none of them `quotientLattice`; the name occurs nowhere at the pins or in ClassifyingTopoi's `Suggested.lean`.
**Repair:** README 4.1: "Prove that if `MoritaEquivalent T T'` …" with no name; docstring: "Not stated: README 4.1, the isomorphism of the posets of quotients of Morita-equivalent theories, lacking …".

## R11 (P3) — process wording in the README

**Location:** README lines 26–27, "A search of the roadmaps on main, of the open pull requests and of the maintainers' packages for …  finds no other owner"; line 295, "no roadmap on main or in an open pull request cites ToposTheoreticBridges".
**Claim:** Both sentences describe the state of the repository at one date and refer to pull requests; a roadmap is timeless.
**Witness:** The repository README, "Roadmaps are timeless"; no roadmap on main has either sentence.
**Repair:** Lines 26–27: "No other roadmap owns Morita equivalence of small categories, Cauchy completion of categories or the right Ore condition on a category: the Morita equivalences of …". Line 295: "None."

## R12 (P3) — Research context: claims without a locator

**Location:** README, Research context: "Caramello proposes to implement the method in a proof assistant, with databases of equivalences of topoi and of site-level characterizations of invariants".
**Claim:** The sentence has no locator, and the two texts cited for the method in that paragraph do not contain it; they do not use the word "bridge" either.
**Witness:** Caramello2017Lattices (84 pages) and Caramello2009DeMorgan (37 pages): no line contains "bridge", "proof assistant", "computer" or "database".
**Repair:** Give the work and page where the method is defined and where the implementation is proposed, each as a reference with a locator, or delete the last sentence and cite the two papers only for Theorem 3.6 and for the De Morgan criterion.

## R13 (P3) — `Discrete (Fin 2)` is not in `Type u`

**Location:** README Convention 1, "the presheaf topoi of `Discrete PUnit` and `Discrete (Fin 2)` are `Type u` and `Type u × Type u`"; 1.1 second Check; 1.2 first Check.
**Claim:** `MoritaEquivalentCat C D` takes `C D : Type u`; `Discrete (Fin 2) : Type`, so the witness types only for `u = 0`, where it is consistent, and not at the stated `Type u`.
**Witness:** `Fin 2 : Type`; `Suggested.lean` line 29, `(C D : Type u) [SmallCategory C] [SmallCategory D]`.
**Repair:** Write `Discrete (ULift.{u} (Fin 2))` in the three places.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 `MoritaEquivalentCat` | `Discrete PUnit` vs two points; `{1,e}` vs `A ⇄ B`, `s ≫ r = 𝟙` | terminal `(1,1) = (1,0) ⊔ (0,1)`, `PUnit` indecomposable: not equivalent; second pair: iso classes 1 vs 2 | definition discriminates | R13 |
| 1.2 Karoubi criterion | empty category; `{1,e}`; groups | `Karoubi ∅ = ∅`, presheaves one object, both sides hold only for `D = ∅`; `Karoubi {1,e}`: Hom sets `{1,e}`, `{e}`, `{e}`, `{e}` | true; Check 2 agrees | R02, R07, R09 |
| 2.1 groupoids | group; `{1,e}`; empty | groupoid ⇒ idempotents are identities ⇒ `C ≌ Karoubi C`; `Karoubi {1,e}` has non-invertible `e`; both sides false together | true | R03 |
| 2.2 right Ore | `WalkingCospan`; `{a, b < c}`; group; `ℕ`; free monoid `⟨x,y⟩`; `Karoubi` both ways | no `d → left, right`; `(h≫p)≫f = h≫f = k≫g`; `h = 𝟙, k = f g⁻¹`; `g+f = f+g`; `x·w ≠ y·w'` | true; equals Mathlib's definition | R01, R03 |
| 3.1 finer topologies | `{1,e}` vs `Karoubi {1,e}`; one point vs two isomorphic points; `J = ⊤`; empty `D` | topologies: 3 and 3; 2 and 2; `Ici ⊤` singleton forces degenerate topos, `K = ⊤`, singleton | true; order `J ≤ J'` is inclusion of covering sieves (`le_def`) | R04, R06 |
| 4.1 quotient posets | `T = T'` with swap of `P`, `Q`; object theory vs subsingletons | swap sends `⊤ ⊢ P` to `⊤ ⊢ Q`, not identity; points: all sets vs 2 | true up to classes; Check 1 false as worded | R04, R05, R08, R10 |
| Convention 2, 3 | poset with meets; `WalkingCospan` and `WalkingSpan` with spans | `a ⊓ b → c` both ways; span completion holds in `WalkingCospan`, fails in `WalkingSpan` | direction pinned | none |
| Layer 3 Examples | `C` vs `Karoubi C`; basis `B` of `X` | sheaves for `⊥` are presheaves, Layer 1 gives the equivalence; `B` cover-dense in `Opens X`, both in `Type u` | consistent with 3.1 | none |
| Padding probe | the four theorems with `simp`, `rfl`, `infer_instance`, `exact?` | none closes; unfolded goals remain | no padding | none |

- Source locators checked against the text: 5 (Borceux–Dejean Theorem 1 (4), Proposition 2; Caramello 2009 remark after Theorem 1.7, p. 6; Caramello, Lattices, Definition 3.5, p. 14, Theorem 3.6, p. 15); 2 page ranges wrong (R09).
- Library declarations opened at the pin: `GrothendieckTopology.RightOreCondition` (`Sites/Grothendieck.lean` 394), `le_def` (266), `trivial_eq_bot` (325), `discrete_eq_top` (329), `karoubiUniversal` (`Idempotents/FunctorExtension.lean` 224), `toKaroubi_isEquivalence` (`Idempotents/Karoubi.lean` 231), `Equivalence.congrLeft` (`Equivalence.lean` 405).
- Cross-roadmap citations resolved at the open heads: GrothendieckTopoi 4.1, 4.2, 6.5, 6.6; ClassifyingTopoi 2.1, 2.5, 2.6, 3.2, 4.1, 4.2; LocallyPresentableCategories 1.7; ClusterAlgebras (Ore conditions) on main.
- Gate at this head: every check passed. Dependency check: `depcheck: 244 roadmaps, 2197 edges, 0 problem(s)`.
- Elaboration of `Suggested.lean`: four `sorry` warnings, nothing else; the six elaborated types compared with the README, no binder lost.
- Pull request text read against the head: no sentence contradicted; nothing outside the folder changes.
- Overlap check: read ClassifyingTopoi, TotallyDistributiveTopoi, GrothendieckTopoi, LocallyPresentableCategories, HomotopyTheoryOfCategories; shared: `Karoubi C` inside the presheaf topos, owner GrothendieckTopoi 6.5 (R02); ClassifyingTopoi 3.3 uses the forward direction of 1.2 from Borceux–Dejean without a roadmap citation.
- Source independence: 6 passages compared with 3 sources, none shared beyond forced statements of at most 6 words; largest share Caramello2017Lattices, 3 of 7 locators; contents compared with Caramello2017Lattices: independent.

## Not verifiable

- The References entry "« Lattices of theories », Chapter 4 of *Theories, Sites, Toposes*": the book is not openly readable; only arXiv:0905.0299v1 was read, so the chapter number was not checked.
- The source Caramello 2009 names for the Ore criterion as known: its reference is illegible in the recognised text (Caramello2009DeMorgan line 207).
- The proposal quoted in R12: no cited text contains it.

## Source issues

- none

## For the human reviewers

- **Scope.** The organising notion, the "method of topos-theoretic bridges", is attributed in the README to one author; the two cited arXiv texts by that author do not contain the word "bridge". The headline theorems are stated in Borceux–Dejean 1986 and Caramello 2009, p. 6.
- **Scope.** ClassifyingTopoi 3.3, a supplier of Layer 4, uses the forward direction of 1.2 in its route; if it came to cite 1.2, the two roadmaps would supply each other.
