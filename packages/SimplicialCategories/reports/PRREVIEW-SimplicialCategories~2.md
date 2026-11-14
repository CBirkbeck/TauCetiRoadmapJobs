# Review of SimplicialCategories (pull request #2269 at ac5fe3a)
Folder: `TauCetiRoadmap/ModelCategoryTheory/SimplicialCategories/`
**Verdict:** needs changes

## R01 (P1) — The acceptance test still cannot build at the pins

**Location:** `TauCetiRoadmap/ModelCategoryTheory/SimplicialCategories/Suggested.lean:4,6,7,419` — imports of `WeakHomotopyEquivalence`, `SimplicialCategory.HomotopyCategory`, `Enriched.EnrichedCat`; uses of `UnitGradedNatTrans.comp`.
**Claim:** Previous R01 remains: three imports violate the pinned-module rule, the targeted build fails, and the composition names also differ from the pinned API.
**Witness:** At Tau Ceti `2fd255d`, all three imported source files are absent. `TauCeti/CategoryTheory/Enriched/NaturalTransformation.lean:209,234` instead declares `unitComp` and `unitComp_app`. The targeted build and direct elaboration both exit 1.
**Repair:** Delete the three unavailable imports and replace `comp`/`comp_app` by `unitComp`/`unitComp_app`. After the deletions in R03, use Mathlib's `EnrichedCat` with a strict category instance proved by `EnrichedFunctor.ext`, and define the weak-equivalence predicate by `∀ Z : SSet, Z.KanComplex → Function.Bijective (SSet.mapπ₀ ((MonoidalClosed.pre f).app Z))`. Both replacement constructions elaborate at these pins in the scratch probe; rerun the complete acceptance test after integrating them.

## R02 (P1) — The supplier contract still promises unavailable declarations

**Location:** `TauCetiRoadmap/ModelCategoryTheory/SimplicialCategories/README.md:168–181` — `SSet.IsWeakHomotopyEquivalence`, `CategoryTheory.EnrichedCat.category`, `TauCeti.SimplicialHomotopyCategory`, `mapHomotopyCategory`, `IsDwyerKanEquivalence`, `TauCeti.UnitGradedNatTrans.comp`.
**Claim:** Previous R02 remains: these six claimed Tau Ceti APIs are absent at the pin. Scope and Conventions repeat the unavailable weak-equivalence and simplicial-homotopy-category claims.
**Witness:** The pinned sources contain none of the five named simplicial/enriched declarations; `TauCeti/CategoryTheory/Enriched/NaturalTransformation.lean:209` supplies `unitComp`. Mathlib's `Mathlib/CategoryTheory/Enriched/EnrichedCat.lean:32` supplies the bundled carrier with a bicategory, not the claimed Tau Ceti category instance.
**Repair:** Remove the unavailable declarations from “From Tau Ceti” and correct Scope and Conventions. Cite Mathlib's bundled carrier; make its general strict category structure a §5.2.1 target. Cite Part KanQuillen §3.1.1 for the weak-equivalence predicate, with the real body in R01. Remove the unused `IsDwyerKanEquivalence` claim; defer the simplicial constructions to BordismFormalGroups as in R03. Name `unitComp` throughout.

## R03 (P2) — The simplicial specializations still duplicate their owner on main

**Location:** `TauCetiRoadmap/ModelCategoryTheory/SimplicialCategories/README.md:35–48,289–307,1010–1040,1187–1221,1270–1285,1337–1394` — the scope omits BordismFormalGroups while these targets retain its simplicial specializations.
**Claim:** Previous R03 remains: the Bergner structure, Kan–Quillen excellence and invertibility, local-fibration characterization, and simplicially enriched diagram structures with Dwyer–Kan invariance still have two owners. Changing the presentation of weak equivalences does not remove this overlap.
**Witness:** On main, `TauCetiRoadmap/BordismFormalGroups/README.md:1561–1590` owns the Bergner structure, excellent-base properties, invertibility and local fibrations; `:1591–1621` owns the enriched diagram structures and Dwyer–Kan invariance. The expanded PR description now acknowledges these objects.
**Repair:** State in Scope that BordismFormalGroups §F6.5 item 1 supplies these simplicial cases; retain this Part's genuinely general enrichment-base results. Replace the duplicate simplicial targets in §§1.2, 5.4, 5.7, 5.8, 6.1 and 6.3 by supplier citations. Delete `isLeftQuillenBifunctor_curriedTensor_sSet`, `exists_bergnerModelCategory`, `combinatorialDwyerKanEquivalences_of_isPushout_interval_toInvertible`, `isFibrant_iff_isLocallyKan`, `fibration_iff_isQuasiFibration`, `exists_projectiveModelCategory_sSetDiagram`, `exists_injectiveModelCategory_sSetDiagram`, `isLocalizedEquivalence_restriction`, and definitions used only by them. Revise the description's proposed transfer of ownership accordingly; an actual transfer needs the existing owner revised first.

## R04 (P3) — The connectivity route still uses the wrong attaching map

**Location:** `TauCetiRoadmap/ModelCategoryTheory/SimplicialCategories/README.md:834` — “the k-th stage is a homotopy pushout of `f_k □ (∂Δ[k] ⊆ Δ[k])`”.
**Claim:** Previous R06 is only partly repaired: §4.5.2 now uses relative latching maps, but §4.5.3 still ignores degeneracies.
**Witness:** Take f constant at `Δ{0}⊆Δ[1]`; every component is a weak equivalence. At k=1 the relative latching map is `id_Δ[1]`, whereas `f₁ □ ∂Δ[1]` is the proper three-sided boundary inclusion into `Δ[1]×Δ[1]`.
**Repair:** Replace the attachment sentence by: “After factoring f as a monomorphism followed by a levelwise trivial fibration, filter its monomorphism part by `X ∪ sk_k Y`. Its diagonal attaches along `(X_k ⊔_{L_k X} L_k Y → Y_k) □ (∂Δ[k] ⊆ Δ[k])`. Induction on the finite latching diagrams gives `(n − k + 1)`-connectivity of `L_k X → L_k Y`; the relative latching map is `(n − k)`-connective, and its pushout-product is n-connective.” Cite Part ModelCategories §§7.5.2, 7.7.1 for the latching input. On the witness the corrected k=1 attachment is an identity.

## R05 (P3) — Five retained Lean definitions remain unnamed in the README

**Location:** `TauCetiRoadmap/ModelCategoryTheory/SimplicialCategories/Suggested.lean:297,310,343,346,349` — `constSSet`, `DiscreteEnrichment`, `interval.zero`, `interval.one`, `interval.arrow`.
**Claim:** Previous R09 remains: none of these five names appears in the README.
**Witness:** Exact-name searches of `TauCetiRoadmap/ModelCategoryTheory/SimplicialCategories/README.md` return zero occurrences for each of the five definitions, all still present in `Suggested.lean`.
**Repair:** Delete them with their sole consumer under R03. If a consumer is retained after resolving ownership, add to §5.6.1: “`constSSet` sends a type to its constant simplicial set; `DiscreteEnrichment` transports an ordinary category's enrichment along it. `interval.zero` and `interval.one` are the objects of `[1]_S`, and `interval.arrow` is its vertex from 0 to 1.”

## R06 (P3) — The description still omits the composition-API mismatch

**Location:** Pull-request description, “Tau Ceti pin” — “The `build` check therefore needs a separate bump of the Tau Ceti pin to that commit or later.”
**Claim:** Previous R10 remains: the explanation lists only newer imported modules, although this head also calls unavailable composition names from a module already present at the pin.
**Witness:** `TauCetiRoadmap/ModelCategoryTheory/SimplicialCategories/Suggested.lean:419,421,449,520` uses `comp`/`comp_app`; the imported pinned `TauCeti/CategoryTheory/Enriched/NaturalTransformation.lean:209,234` defines `unitComp`/`unitComp_app`.
**Repair:** Until the build is repaired, add: “SimplicialCategories also uses `UnitGradedNatTrans.comp` and `comp_app`, which the pinned module names `unitComp` and `unitComp_app`.” After repair, replace the pin-bump explanation with the actual tested pin and build result.

## Previous findings

- R01 — not repaired: `Suggested.lean:4,6,7` retains all three unavailable imports; `:419–449,520–521` retains `comp`/`comp_app`.
- R02 — not repaired: `README.md:168–181` still attributes the six absent APIs to Tau Ceti.
- R03 — not repaired: `README.md:35–48` still omits BordismFormalGroups; the duplicated simplicial specializations and their Lean declarations remain.
- R04 — repaired: `README.md:1319–1321` now says the walking-isomorphism inclusion is a weak equivalence but not a cofibration, with the free-category obstruction.
- R05 — repaired: `README.md:863–865` uses `Δ[0] ⊠ Δ[1]` and computes the old orientation's k+2 components.
- R06 — partly repaired: `README.md:818–821` uses relative latching maps; `:834–835` still attaches along `f_k`.
- R07 — repaired: `README.md:674–676` requires Kan complexes and gives the constant horn tower as a negative control.
- R08 — repaired: `README.md:249–252` compares a vertex inclusion with `∅→Δ[1]`, which fails the weak-equivalence clause.
- R09 — not repaired: the five definitions at `Suggested.lean:297,310,343,346,349` still have no README names.
- R10 — not repaired: the description's “Tau Ceti pin” paragraph still omits `comp`/`comp_app` versus `unitComp`/`unitComp_app`.
- R11 — repaired: the description now lists excellence, invertibility, local fibrations, enriched diagram structures and Dwyer–Kan invariance under BordismFormalGroups §F6.5 item 1.

## Verified sound

| Statement | Instances tried | Claimed side | Computed side | Result / change |
|---|---|---|---|---|
| §1.1.1 revised Check | i: vertex→Δ[1]; j: ∅→Δ[0] | i□j trivial; F(i,j) not weakly equivalent | i□j=i, π₀:1→1; F(i,j):∅→Δ[1], π₀:0→1 | Previous R08 repaired |
| Layer 3 tower example | Constant Δ[0]; constant Λ[2,1] | First fibrant; second excluded | Matching map at 0: point→point, versus horn→point with an unfillable inner horn | Previous R07 repaired |
| §4.1.2, changed supplier | J discrete on two objects | Reedy=injective=projective | All latching objects ∅, matching objects ∗; all three classes computed at the two objects | Reference resolves |
| §4.2.1, changed supplier | J=[1], F=(∅→∅), G=(two points→point) | Not projectively cofibrant | Relative latch at 1 is fold:2→1, not mono; at 0:0→2 | Reference resolves |
| §4.3.1, changed suppliers | J=point; i:vertex→Δ[1], j:∅→Δ[0] | Coend pushout-product trivial | Coend=product; i□j=i; π₀:1→1 and higher π=0→0 | Seeded target rechecked |
| §4.4.1, changed suppliers | Standard cosimplicial simplex, k=0,1 | Reedy cofibrant; degreewise equivalent to point | L₀=∅, L₁=∂Δ[1]; both inclusions mono; each Δ[k] contractible | Seeded target rechecked |
| §4.5.2 revised attachment | f constant vertex→Δ[1], k=1 | Relative latching attachment | L₁X=X₁, L₁Y=Y₁; relative map=id_Δ[1]; diagonal remains Δ[1] after stage 0 | Correction works |
| §4.5.2 negative control | X=∅, Y=constant point; k=0,1,2 | Components ignore degeneracies | Relative maps: ∅→∗, id_∗, id_∗; f_k□∂Δ[k] instead gives every boundary inclusion | Control works |
| §4.5.3 attachment formula | f constant vertex→Δ[1], k=1 | Attach f₁□∂Δ[1] | Claimed domain: four vertices, three edges; correct attaching map: identity of the square | R04 |
| Diagonal theorem and revised Layer 4 example | Δ[0]⊠Δ[1]→point; swapped product | Every component weak equivalence | Correct components: π₀ 1→1; swapped components k=0,1,2: 2→1,3→1,4→1 | Previous R05 repaired |
| Layer 5 walking-isomorphism example | [0]→[1]῀, S=sSet | Weak equivalence, not cofibration | One isomorphism class on both sides; distinct isomorphic objects cannot embed in a free category | Previous R04 repaired |
| `exists_enrichedCatModelCategory` carrier | S=Set, trivial model structure | General enriched model structure | Cat: equivalences as W; object-injective functors lift against object-surjective, hom-bijective functors | Mathematics stands; R01 carrier repair |
| `isLeftQuillenBifunctor_curriedTensor_sSet` | Vertex→Δ[1] □ ∅→Δ[0] | Trivial cofibration | Vertex→Δ[1], π₀ 1→1, all higher groups zero | R03 ownership |
| §1.2.3 excellence inputs | Filtered constant point diagram | Cofibrancy and stability | ∅→point mono; filtered colimit=point; product point×point=point | R03 ownership |
| `exists_bergnerModelCategory` | [0]→walking isomorphism | Dwyer–Kan weak equivalence | Mapping spaces point→point; π₀ categories have one isomorphism class | R03 ownership |
| `combinatorialDwyerKanEquivalences_of_isPushout_interval_toInvertible` | C=[1], i=id | Invertibility hypothesis required | π₀Map(1,0)=∅; arrow 0→1 not invertible, so hf=false | R03 ownership |
| `isFibrant_iff_isLocallyKan` | [1]_Δ[0]; [1]_Λ[2,1] | Fibrant iff locally Kan | Mapping object Δ[0] Kan; Λ[2,1] has an unfillable inner horn | R03 ownership |
| `fibration_iff_isQuasiFibration` | [0]→walking isomorphism | Local Kan maps insufficient | Hom map id_point is Kan; object-isomorphism lift to the second object has zero solutions | R03 ownership |
| `exists_projectiveModelCategory_sSetDiagram` | C=point, then empty | Objectwise W and fibrations | At point recover sSet classes; at empty index one diagram and one map | R03 ownership |
| `exists_injectiveModelCategory_sSetDiagram` | C=point, then empty | Objectwise W and monomorphisms | At point recover sSet classes; at empty index one diagram and one map | R03 ownership |
| `isLocalizedEquivalence_restriction` | C→C the identity | Localization equivalence | Restriction=id; derived unit and counit=id at every object | R03 ownership |
| Weak-equivalence predicate replacement | Δ[1]→point; ∅→point; Z=two points | First passes; second fails | Precomposition on π₀:2→2 bijective; 2→1 not bijective | R01/R02 repair |
| Simplicial homotopy-category contract | One object, constant C₂ mapping group | Morphisms are π₀Map | Two morphisms, composition addition mod 2; pin has zero declarations of the claimed category | R02 |
| `constSSet` | Empty type; two-element type | Constant simplicial set | Degree 0,1,2 cardinalities: 0,0,0; 2,2,2 | R05 name omission |
| `DiscreteEnrichment` | Discrete two-object category | Constant enriched homs | Endomorphism simplicial sets singleton; off-diagonal homs empty in every degree | R05 name omission |
| `interval.zero` | ULift(Fin 2) | First object | Underlying value=0, distinct from 1 | R05 name omission |
| `interval.one` | ULift(Fin 2) | Second object | Underlying value=1, distinct from 0 | R05 name omission |
| `interval.arrow` | Walking arrow | Vertex 0→1 | Hom(0,1) has one vertex; Hom(1,0) has zero | R05 name omission |
| Pinned imports/composition and PR explanation | Three imports; two composition names | Required APIs present after import | Zero of three source modules; zero of two composition names; both unitComp names present | R01/R02/R06 |

Untouched-statement rows stand as in the previous review of `3bceb5a`.

- Sources: reopened 12 HTT locators, including sampled §§1.1, 4.3 and 4.4: A.3.1.1, A.2.9.1, .5, .6, .8, .24–.29, and A.3.2.14; checked Lemma 6.5.3.10 for the carried route finding. GJ99 IV.1.7 remains uncertified.
- Pins: verified Tau Ceti `2fd255d` and Mathlib `1b1ccf4`; opened Mathlib `CategoryTheory/Enriched/EnrichedCat.lean:32`, Tau Ceti `CategoryTheory/Enriched/NaturalTransformation.lean:209,234`, and `AlgebraicTopology/SimplicialObject/Bisimplicial.lean:83`.
- Suppliers: all four changed Needs passages resolve to Part ModelCategories §§7.4, 7.4.1 and 8.3; inspected relative latching §7.5.2 and the KanQuillen connectivity/weak-equivalence targets. GeneralizedCohomology §G2.1 remains at `README.md:213` on main.
- Dependency output: `depcheck: 244 roadmaps, 2197 edges, 0 problem(s)`; no UPWARD or CYCLE.
- Gate: worker `imports=3`, `build=7`, FAIL; rerun confirms the three imports. Its `outside-folder=9` comprises only the expressly authorized sibling Parts and family index; the brief's excluded-path diff is empty. No additional scope finding.
- Elaboration: targeted build and direct Lean invocation exit 1 on missing imported modules; the scratch `#check @name` probe for all 47 named declarations stops at the same import, so no complete signatures or new padding results were obtained.
- Repair probe: the strict category structure on native `EnrichedCat`, the real weak-equivalence predicate, and both `unitComp` API checks elaborate with exit 0 and no warnings. No repository file changed.
- PR text: new-folder status and scope still match this head; no layer, headline or Lean declaration was removed. Previous R11's expanded ownership list is present; R06 records the remaining build-description defect.

Overlap check: read InfinityCategoryFoundations, LimitsAndKanExtensions, Straightening, AdjunctionsAndLocalizations, CartesianFibrations, DerivedInfinityCategories, PresentableInfinityCategories, BordismFormalGroups, StableHomotopyKTheory and EnhancedDerivedSheaves. Shared Bergner structure, simplicial excellence/invertibility, local fibrations and enriched diagram structures/invariance belong to BordismFormalGroups §F6.5 item 1 (R03); the other scopes introduce no additional owner of the changed objects.

Source independence: changed passages only; five changed mathematical prose passages compared with HTT, with no copied expression or reused source material found. HTT retains the largest locator share (approximately 276 of 301 in the previous review; this diff adds no source locators). No layer was added, removed or reordered; the previous contents comparison stands.

## Not verifiable

- GJ99, Proposition IV.1.7: the sources service resolves the book only to a paywalled publisher; the changed elementary attachment calculation was checked independently, not against that text.
- Complete elaborated signatures and one-tactic probes: missing pinned import modules prevent elaboration before any declaration is checked.
- The description's Tau Ceti `8b9f13d993` build claim: that is not the pinned library tested here.

## Source issues

- **Misprint** in HTT at Proposition A.2.9.26, printed p. 847 (PDF p. 865): the source calls A.3.1.1 a proposition; it should identify it as a definition; affects nothing.
- **Misprint** in HTT at the coend construction preceding Proposition A.2.9.26, printed p. 847 (PDF p. 865): the source assumes small limits in the target; it should assume small colimits for the displayed coproduct/coequalizer construction; affects nothing.
- **Misprint** in HTT at Remark A.2.9.27, printed p. 848 (PDF p. 866): the final criterion tests triviality of i or h; it should test i or g; affects nothing.

## For the human reviewers

- Licence: HTT and HA are author-hosted PDFs at `www.math.ias.edu/~lurie`, cited in `TauCetiRoadmap/ModelCategoryTheory/SimplicialCategories/README.md:1464,1477`; the sources service requires manual `author-page` classification, as in the previous review.
- Not tested: whether a `Suggested.lean` declaration agrees with a public formalisation other than the pinned libraries; no such repository was searched.
