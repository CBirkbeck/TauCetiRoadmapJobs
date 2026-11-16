# Review of InfinityCategoryFoundations (pull request #2270 at a6d7928)
Folder: `TauCetiRoadmap/InfinityCategoryTheory/InfinityCategoryFoundations/`
**Verdict:** needs changes

## R01 (P1) — Seven imports still prevent the acceptance test from building
**Location** `TauCetiRoadmap/InfinityCategoryTheory/InfinityCategoryFoundations/Suggested.lean:10`, also lines 11, 13–15, 17, 21: “public import TauCeti.AlgebraicTopology.Quasicategory.InitialVertex”.
**Claim** The file states its theorems “against the pinned Mathlib and Tau Ceti” (line 27).
**Witness** At the pinned Tau Ceti 2fd255d the modules `Quasicategory/InitialVertex`, `Limit`, `TerminalVertex`, `SimplicialNerve/Basic`, `AnodyneExtensions/LeftRight/Basic`, `SimplicialSet/Fiber`, `SimplicialSet/WeakHomotopyEquivalence` do not exist. Gate: `imports=7`, `build=15 FAIL`.
**Repair** Import only modules of the repository's pin (eight of the fifteen exist). Keep the statements whose carriers exist there (the 20 theorems and 6 definitions listed under Verified sound elaborate as they stand); for every other headline name the missing carrier in the module docstring and state nothing. A statement that needs a newer Tau Ceti returns when the repository's pin has it.

## R02 (P1) — The Tau Ceti supplier contract lists declarations absent at the pin
**Location** `TauCetiRoadmap/InfinityCategoryTheory/InfinityCategoryFoundations/README.md:292`, “### From Tau Ceti”, lines 296–391; also line 50: “The following statements are already in the library”.
**Claim** These declarations exist in Tau Ceti and supply the layers.
**Witness** At 2fd255d at least 44 cited names have no declaration: the 33 of the citation list (`SSet.LeftFibration`, `SSet.IsTerminalVertex`, `SSet.slice.rightFibration_π`, …) and `SSet.fiber`, `SSet.coslice.IsColimit`, `SSet.coslice.map`, `SSet.IsWeakHomotopyEquivalence`, `CategoryTheory.SimplicialNerve.quasicategory`, `SimplicialNerve.fromNerve`. `TauCeti/AlgebraicTopology/Quasicategory/` holds five files.
**Repair** Check every name of lines 50–74 and 296–391 at 2fd255d. Keep those that exist (for instance `SSet.Edge.IsEquivalence`, `SSet.core`, `SSet.slice.homEquiv`, `SSet.slice.restrictionMap`, `SSet.rightMappingSpace.hornFilling`, `SSet.rlp_monomorphisms_iff`, `SSet.IsLocallySmall`). Each absent one becomes a numbered target of the layer that first uses it, with its statement, hypotheses, HTT locator and Checks (the Checks already written under the contract move with it), or a citation of a roadmap section that states it; every `*Needs:*` line is repointed accordingly.

## R03 (P1) — The outer-horn rigidification is wrong from n = 3 on
**Location** `TauCetiRoadmap/InfinityCategoryTheory/InfinityCategoryFoundations/README.md:875`: “a chain from j to k is missing from `C[Λ[n, n]]` exactly when it contains every one of `0, …, n − 1` … the union of the faces `t_i = 0` of its cube”; Check at line 887; use at line 2080.
**Claim** In `C[Λ[n, n]]`, `Map(0, n−1)` and `Map(0, n)` are the unions of the faces `t_i = 0`.
**Witness** `Λ[3, 3]` contains the edges 0→1 and 1→2; their composite, the chain {0,1,2}, is a second vertex of `Map(0,2)` (§2.1.1's third Check counts composites likewise). `Map(0,3)` contains the edge {0,1,3}→{0,1,2,3}, on `t_1 = 1`.
**Repair** Replace the sentence by: “`Map(0, n−1)` is the boundary of the cube `(Δ[1])^(n−2)` (empty for n = 2): the faces `t_i = 0` come from the faces of the horn omitting i, the faces `t_i = 1` from composites through i. `Map(0, n)` is the cube `(Δ[1])^(n−1)` without its interior and without the interior of the face `t_(n−1) = 1`: the union of the faces `t_i = 0`, 1 ≤ i ≤ n−1, and `t_i = 1`, 1 ≤ i ≤ n−2.” At n = 2 this gives ∅ and a point; at n = 3 two points and three edges of the square. Rewrite the `Λ[3, 3]` Check with these values (“`Map(0,2)` is the two vertices {0,2} and {0,1,2} without the edge between them”). In §7.7.1 (1) extend along this open box into the cube, which is anodyne; the face `t_n = 1` of the extension is the map from 0 to n and agrees with the given one on its boundary.

## R04 (P2) — The foundations are owned by a roadmap on main, which the text does not cite
**Location** `TauCetiRoadmap/InfinityCategoryTheory/InfinityCategoryFoundations/README.md:47`: “This roadmap is the first Part of the InfinityCategoryTheory family; it consumes Mathlib, Tau Ceti and the ModelCategoryTheory family.”
**Claim** This folder is the owner of rigidification, categorical equivalences, the covariant and contravariant structures, unmarked straightening, the mapping-space comparison and the Joyal structure.
**Witness** On main, `TauCetiRoadmap/BordismFormalGroups/README.md:1558` (rigidification and coherent-nerve adjunction), 1820 (categorical equivalences), 1823 (unmarked straightening), 1927 (the Joyal model, its Quillen equivalence, fibrant objects). `TauCetiRoadmap/EnhancedDerivedSheaves/README.md:32` imports that ownership.
**Repair** A roadmap on main is earlier than every open one. Add to “Scope and ownership” the paragraph “BordismFormalGroups §F6.5 item 1 states the rigidification adjunction, categorical equivalences, the unmarked fibration models and straightening, the mapping-space comparison and the Joyal model”, and for each of §2.1.1, §2.1.4, §2.1.5, §6.3.1, §6.4.1, §7.5.4, §8.1.1, §8.1.2, §9.5.1, §9.5.5, §9.6.1 either cite it and keep only what it does not state, in one clause saying how the kept statement differs, or revise BordismFormalGroups in the same pull request so that it cites this Part. The transfer itself is listed for the human reviewers.

## R05 (P2) — Two comparisons use an agreement of weak-equivalence classes that nothing supplies
**Location** `TauCetiRoadmap/InfinityCategoryTheory/InfinityCategoryFoundations/README.md:837`: “the equivalences of simplicial categories of §1.1 … are exactly Tau Ceti's Dwyer–Kan equivalences … The route: a map of simplicial sets is an isomorphism in H exactly when it is a weak homotopy equivalence”; also lines 135, 503, 944, 2229.
**Claim** Isomorphism in H identifies the mapping-object condition of Tau Ceti's `IsDwyerKanEquivalence` and `SSet.IsFullyFaithful`.
**Witness** H inverts `SSet.IsWeakHomotopyEquivalence` (maps into Kan complexes). Line 752 says `SSet.IsFullyFaithful` uses “realization weak equivalences”; SimplicialCategories (PR #2269) README:178 says `IsDwyerKanEquivalence` “tests … with the realization-based class and is not used”; KanQuillen README:36 says their coincidence “is not settled here”.
**Repair** In §1.1.1 and §2.4.2 compare with the unwound second form that SimplicialCategories §5.1.1 already states (weak homotopy equivalences on mapping objects, essential surjectivity); §2.4.2 then cites it and proves nothing new. Where §2.4.2, §2.6.4 and §8.1.3 keep the Tau Ceti predicates, add to the statement and to `*Needs:*` the agreement of `SSet.IsWeakHomotopyEquivalence` with the realization class: GeneralizedCohomology §G2.1 with Part KanQuillen §3.1 (the Kan-group criterion on both sides), as SimplicialCategories' scope paragraph cites it. Replace line 135's “is discussed in ModelCategoryTheory, Part KanQuillen” by that citation.

## R06 (P3) — §9.4.1 announces a library declaration that the supplier contract excludes
**Location** `TauCetiRoadmap/InfinityCategoryTheory/InfinityCategoryFoundations/README.md:2352`: “the planned Tau Ceti declaration is the predicate `SSet.CategoricalFibration` with this definition (supplier contract)”.
**Claim** Tau Ceti's `SSet.CategoricalFibration` will be the class of §9.4.1.
**Witness** Line 374 of the same file: that predicate “is not used”, being “weaker than the categorical fibrations of §9.4.1”. “planned” is a process word; the name is absent at the pin.
**Repair** End the sentence at “a morphism property of simplicial sets.” and delete the rest.

## R07 (P3) — The colimit argument of §7.1.5 states the opposite of what it uses
**Location** `TauCetiRoadmap/InfinityCategoryTheory/InfinityCategoryFoundations/README.md:1702`: “v receives no non-identity morphism into C, so every map into v factors through the component of the cone point”.
**Claim** No morphism other than the identity ends at v.
**Witness** §7.1.4 defines `(St_φ X)(c) = Map_M(c, v)`, and its second Check computes this as a point for S = X = Δ[0]: a non-identity morphism into v.
**Repair** “M has no morphism from v to an object of C, and `Map_M(v, v)` is a point; so a morphism into v is a morphism of `Cᵒᵖ` followed by one coming from a single simplex of `X▷` that contains v.”

## R08 (P3) — §10.8.1 is stated in Lean for k ≥ 0 only, through a second truncation predicate
**Location** `TauCetiRoadmap/InfinityCategoryTheory/InfinityCategoryFoundations/Suggested.lean:871`: “theorem isTruncated_iff_isWeakHomotopyEquivalence (n : ℕ) … IsTruncated n X ↔”; definition at line 744.
**Claim** The Lean statement has the generality of README §10.8.1 (k ≥ −2), and `IsTruncated` is needed.
**Witness** `IsTruncatedInt` (line 854) covers k ≥ −2. At k = −2 the map is X → Δ[0]; at k = −1 the diagonal, an equivalence for ∅, not for `Δ[0] ⊔ Δ[0]`: the values of `IsTruncatedInt`.
**Repair** State `IsTruncatedInt ((n : ℤ) - 2) X ↔ SSet.IsWeakHomotopyEquivalence (MonoidalClosed.curry (snd (∂Δ[n] : SSet.{u}) X))` for every `n : ℕ`, delete `IsTruncated` from `Suggested.lean` and its sentence from the module docstring, and drop “for k ≥ 0” at README lines 2979 and 3084.

## R09 (P3) — The universal fibrations and pointwise equivalences have no Checks or `*Needs:*` of their own
**Location** `TauCetiRoadmap/InfinityCategoryTheory/InfinityCategoryFoundations/README.md:1714` (§7.1.6) and 1729 (§7.1.7); the only `*Needs:*` line is at 1768, after §7.1.8.
**Claim** Each definition carries three Checks and each target its own needs.
**Witness** §7.1.6 and §7.1.7 pass to the next label with no `**Checks.**` and no `*Needs:*`; line 1768 lists the needs of three targets together.
**Repair** Give §7.1.6 its needs (§7.1.2; `SSet.slice`, `SSet.coslice`, the slice projection as a right fibration, `SSet.opFunctor`) and three Checks: the fiber over ∅ is empty; the fiber over Δ[0] is Δ[0] (now the third Check of §7.1.8); the fiber over K has the vertices of K as vertices, so the slice is taken over ∗ in `Sᵒᵖ` and not in S. Give §7.1.7 its needs (pullbacks in `SSet`, the weak homotopy equivalences) and point to the Checks of §7.4.1.

## R10 (P3) — An empty section remains in the Lean file
**Location** `TauCetiRoadmap/InfinityCategoryTheory/InfinityCategoryFoundations/Suggested.lean:101`: “section Squares … end Squares”.
**Claim** Every section holds declarations.
**Witness** Lines 101–103 contain no declaration; the square definitions were deleted.
**Repair** Delete lines 101–103, and the `section Diagrams` / `end Diagrams` pair around the single definition above.

## Verified sound

| Statement | Instances tried | First computed value | Second computed value | Result / change |
|---|---|---|---|---|
| 2.2.1 (sampled) | Δ[1]; Λ[2,1] | Δ[1]: strict Segal, unit bijective | Λ[2,1]: no 2-simplex over the spine (01,12); unit adds 0→2 | Agrees; HTT line 920, p. 27 |
| 2.7.1 (sampled) | one object, discrete S₃; monoid ℕ | composition with a transposition permutes 6 points | adding 1 misses 0: not invertible in hC | Agrees; source treats topological categories (HTT line 2030), as stated |
| 3.1.1 (sampled) | route with D any simplicial set | lift of Λ[2,0] gives g with g∘f ≃ id | second lift gives h∘g ≃ id; f inverse to g in hC | Holds as stated; only C needs to be an ∞-category |
| 3.1.2 (sampled) | identity of Λ[2,1]; route | lift ḡ from Y, fill Λ[2,0] over (ḡ, id, f̄) | third edge lies over f̄ and ends at Y | Holds without ∞-category hypothesis; Lean signature matches |
| 3.2.1 (sampled) | m = 0; n = 1 | product generator {0} ⊆ Δ[1] | Λ[1,0] = {0} | Same map; HTT line 3313 |
| 4.1.1 (sampled) | Λ[1,1]⊆Δ[1] with ∅⊆Δ[0]; Λ[n,j] with ∂Δ[m]⊆Δ[m] | Λ[2,1] ⊆ Δ[2] | Λ[n+m+1, j]: inner for 0<j≤n, left for j ≤ n | Agrees; HTT lines 3249, 3271 |
| 5.6.1 (sampled) | C = Δ[1], x = 1; x = 0 | {1} = Λ[1,1]; (x,0) is identified with x in M, retract commutes | {0} ⊆ Δ[1] is a right fibration, not an isomorphism | Agrees; HTT line 14273, p. 319 |
| 7.1.4, 7.1.8 (sampled) | S = Δ[1], vertices 0, 1; the four-point zigzag example | St = (point, ∅); (point, point) | transports c↦a, d↦b against c,d↦a: no fiberwise bijection commutes | Agrees |
| 7.4.1, 7.4.2 (sampled) | {0} ⊆ Δ[1] into the identity of Δ[1]; S = ∅ | fiber over 1: ∅ → point; total spaces point → Δ[1] | RFib(∅) has the single object ∅ | Agrees; HTT lines 4056, 4075, 4134 |
| 7.5.1–7.5.4 (sampled; headline: straightening) | n = 0; right fibration over Δ[1] | St is the twisted realization | X retracts onto its fiber over the first vertex | Agrees; HTT lines 3814, 4010, 4173–4208; not statable, named in docstring |
| 7.6.1 (sampled; headline: fibrant objects) | {0} ⊆ Δ[1]; {1} ⊆ Δ[1] | right fibration: true; false | {1} → Δ[1] has no lift against the right anodyne {1} ⊆ Δ[1] over the identity | Agrees; HTT lines 4283, 4327, 4408 |
| 8.2.1 (sampled) | Λ[2,1], vertex 2; Δ[1] | Map(0,2) = point, no edge 0→2 | vertex 1: both hold; vertex 0: Map(1,0) = ∅ | Converse needs an ∞-category; HTT line 2536 |
| 8.3.1 (sampled) | C = Δ[1], q the vertex 1, K = ∅ | slice is Δ[1]; initial object 0→1 | image 0 is initial in C | Agrees; HTT line 2666 |
| 9.1.1 (sampled) | m = 0; n = 2, i = 1 | generator Λ[2,1] ⊆ Δ[2] | j ↦ (0,0), (1,1), (2,2) is a monotone section | Agrees; HTT line 4925 |
| 9.2.1, 9.2.2 (sampled) | C = Λ[2,1]; C = Δ[1] | identity of the horn is not in the image | 4 chains a≤b≤c on both sides | Agrees; HTT lines 5003, 5028 |
| 10.2.1–10.2.3 (sampled) | X = Δ[1], n = 1; r, s for m = 2 | open box extends only with an edge 1→0: none | r(j,0) = 0, r(j,1) = j, r∘s = id; τ_j gives Λ[n+1, j] | Agrees; HTT lines 5731, 5796 |
| 10.2.4 (sampled; headline: categorical fibrations) | {0} ⊆ J; {0} ⊆ Δ[1]; f̄∘min | condition (2): false; true | edge of F from id_d to f̄, evaluation at 1 equal to f̄ | Agrees; HTT line 6693 |
| 7.7.1 (headline: classification) | K = Δ[0]; step n = 1; step n = 2 | fibers over ∅, Δ[0]: ∅, Δ[0] | n = 1: point ⊆ Δ[1]; n = 2: prescribed data also on the face t₁ = 1 | Route needs R03 |
| 8.1.2 (headline: comparison) | C = [2], discrete | counit on Map(0,2): Δ[1] → point | weak equivalence, not an isomorphism | Agrees; not statable, named in docstring |
| 9.5.1, 9.5.5, 9.6.1 (headline: Joyal structure) | Λ[2,1]; Δ[1] with {0} ⊆ J | identity of Λ[2,1] does not extend to Δ[2] | maps {0} → Δ[1] extend constantly over J | Agrees; probes do not close |
| 9.7.2 (headline: Joyal's form) | ∂Δ[1] ⊆ Δ[1], C = Δ[0]⊔Δ[0]; Λ[2,0] ⊆ Δ[2], C = Δ[1] | 2 against 4 objects | 4 against 5 elements | Both sides false, as the Checks say |
| 10.4.1 (headline: minimal models) | J → Δ[0]; nerve of a category | X₀ one vertex, inclusion an equivalence | minimal exactly when isomorphic objects are equal | Agrees |
| 10.6.5 (headline: n-categories) | ∅, J, Δ[1], Δ[0]⊔Δ[0]; n = −1, 0 | n = −1: true, true, false, false on both sides | n = 0: true on both sides, four times | Agrees; signature elaborates at the pin |
| 2.5.3 (R03) | Λ[2,2]; Λ[3,3] | README: n = 3 gives Map(0,2) = one vertex | computed: two vertices; Map(0,3) = three edges | False for n ≥ 3 |
| 2.4.2, 8.1.3 (R05) | Tau Ceti `SimplicialSet/WeakEquivalence.lean:60` | H: class tested on maps into Kan complexes | pinned scoped class: inverse image under realization | Agreement unowned |
| 7.1.5 (R07) | X = ∅; S = X = Δ[0] | clause read literally: Map(c, v) = ∅ | §7.1.4: Map(c, v) = point | Clause false as worded |
| 10.8.1 (R08) | k = −2; k = −1 on ∅, Δ[0]⊔Δ[0] | X → Δ[0]; diagonal: true, false | `IsTruncatedInt`: same three values | Lean states k ≥ 0 only |
| 9.4.1 (R06) | lines 374 and 2352 | contract: Tau Ceti's predicate is weaker, not used | §9.4.1: planned with this definition | Contradiction |
| Gate (R01) | 15 imports | 8 modules present | 7 absent | Build fails |
| Contract (R02) | names of lines 50–74, 296–391 | 12 opened at the pin with file and line | at least 44 with no declaration | Contract false at the pin |
| Ownership (R04) | BordismFormalGroups on main | 4 passages state the same constructions | this README cites none | Two owners |
| Conventions: variance | {0} ⊆ Δ[1] | fibers Δ[0] over 0, ∅ over 1 | only map ∅ → Δ[0], from the fiber over 1 | Direction pinned |

| Previous finding | Passage at this head | Disposition |
|---|---|---|
| R01 imports | Lean:10 “public import … InitialVertex” | Not repaired; R01 |
| R02 contracts | README:296 “`SSet.LeftFibration`, `SSet.RightFibration`” | Not repaired; R02 |
| R03 outer horn | README:873 “For n ≥ 2 … For n = 1 the horn is a single vertex” | Partly: the bound is repaired, the mapping objects are wrong; R03 |
| R04 cycle | README:701 “Then construct the counit” inside §2.1.4 | Repaired |
| R05 ownership | README:47 “first Part of the InfinityCategoryTheory family” | Not repaired; R04 |
| R06 enriched homotopy category | README:496 “nothing is redefined here” | Repaired |
| R07 cone colimits | README:1697 “take colimits in simplicial sets under Δ[0]” | Repaired; one clause, R07 |
| R08 negative indices | Lean:863 `exists_isNCategory_iff_isTruncatedInt (n : ℤ) (hn : -1 ≤ n)` | Repaired |
| R09 notes file | gate `stray-files=0` | Repaired |
| R10 unused definitions | Lean:95 keeps `IsColimitDiagram` only | Repaired; empty section left, R10 |
| R11 library deletion | README:374 “is not used”; README:2352 “the planned Tau Ceti declaration” | Partly; R06 |
| R12 citations | README:1197 “§2.1.3”, 1779 “§2.1.1”, 2237 “§2.1.6 … §2.1.7” | Repaired |
| R13 bullet | README:593 “- In J, the nerve” | Repaired |
| R14 generality | README:1005 “a left fibration p : C → D of simplicial sets” | Repaired |
| R15 API lists | README:536, 558, 582, 1639, 1662 “The API:” | Repaired |
| R16 HA reference | README:3162 “**HA.** Jacob Lurie, *Higher Algebra*” | Repaired |

- Sources: 105 HTT statement headers matched to the README's PDF pages in the cached text, 24 of them read at their lines (among them HTT lines 920, 2030, 2536, 2666, 3112, 3138, 3249, 3313, 3814, 4010, 4283, 4925, 5003, 5028, 5731, 5796, 6693, 14273); Kerodon lines 26737, 27364, 28801, 28840, 29340, 29450; HA line 559 (p. 17). The README flags no locator as unverified.
- Pinned declarations opened: `TauCeti/AlgebraicTopology/Quasicategory/Core.lean:71`, `:102`, `:150`, `:226`; `SimplicialSet/Slice.lean:271`, `:459`; `SimplicialSet/Coslice.lean:119`; `Quasicategory/RightMappingSpace.lean:243`, `:278`; `SimplicialSet/TrivialFibration.lean:171`; `SimplicialSet/WeaklyContractible.lean:99`; `SimplicialSet/WeakEquivalence.lean:60`; `Mathlib/AlgebraicTopology/SimplicialSet/AnodyneExtensions/Inner/PushoutProduct.lean:74`, `:97`, `:157`.
- Cross-roadmap citations: 67 section ids of ModelCategories, KanQuillen, SimplicialCategories and EnrichedLocalization resolve at the head of PR #2269; 16 opened for content (KanQuillen §3.4.1 does state right properness; SimplicialCategories §5.1.1 and §4.2.2 state what is cited).
- Dependency check: `depcheck: 261 roadmaps, 2595 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Gate: FAIL, `imports=7`, `build=15`; every other check 0.
- Elaboration: the file stops at the first absent import. A scratch copy of the 20 theorems and 6 definitions that need only pinned modules elaborates with `sorry` as the only warning; none of the 20 closes with `infer_instance`, `rfl`, `simp` or `exact?`. Eight `#check @name` signatures of that copy were compared with their README statements: same binders and generality. The other declarations were read against the README, not elaborated.
- Pull request text: title and description read against the head and the computed change (new folder, 4,044 insertions, nothing outside the family); no sentence is contradicted, and the overlap with BordismFormalGroups and the pin are stated there.
- No `set_option`, admitted data, route-specific restriction or computational algorithm.

Overlap check: read ModelCategories, KanQuillen, SimplicialCategories, EnrichedLocalization (PR #2269), BordismFormalGroups, EnhancedDerivedSheaves, StableHomotopyKTheory and GeneralizedCohomology (main). Rigidification, categorical equivalences, unmarked straightening, the mapping-space comparison and the Joyal model: BordismFormalGroups §F6.5 (R04). Enriched homotopy categories and their equivalences: SimplicialCategories §5.1. Truncated Kan complexes, Whitehead's theorem, the Kan–Quillen structure: KanQuillen. Realization weak equivalences: GeneralizedCohomology §G2.1. StableHomotopyKTheory shares nothing. No second copy on main.

Source independence: 16 passages compared with 3 sources (HTT, Kerodon, HA), none reproduced; the longest shared run is 10 words, in the route of §8.2.1 against HTT line 2540. Largest share HTT, 469 of 476 locators. Contents compared with HTT: Layers 6–8 keep the order of HTT §2.1.4, §2.2.1–§2.2.4, which the dependencies §7.2.2→§6.4.1, §7.5.1→§7.3.2, §8.1.1→§7.6.1 force; Layer 5 joins §1.2.2, §1.2.5, §1.2.12, §2.1.3 and Prop. 4.4.4.5, Layer 9 joins §2.3.2, §2.2.5 and §2.4.5–§2.4.6, Layer 10 joins §2.3.3, §2.3.4, §2.4.1 and §5.5.6: independent.

Research link: the headlines are the foundational theorems of Lurie, *Higher Topos Theory* (2009), Chapters 1–2 (straightening, the comparison theorem, the Joyal structure, attributed there to Joyal), prerequisites of the family's later Parts on presentable and stable ∞-categories and ∞-topoi; this rests on the README's Summary and on HTT lines 3814, 4478, 6629.

## Not verifiable

- The declarations of `Suggested.lean` outside that scratch copy (52 of its 72 theorems): they need the seven absent modules, so they were not elaborated and not probed; read against the README only.
- What Tau Ceti's `IsDwyerKanEquivalence`, `SSet.IsFullyFaithful` and `SSet.CategoricalFibration` say: absent at the pin; R05 and R06 rest on the README's own text and on the supplier READMEs of PR #2269.
- Elaboration against Tau Ceti 8b9f13d993, stated in the description: only the repository's pin 2fd255d was used.
- Ownership against PR #1807 and PR #1901: their files were not among the checkouts given; not checked.

## Source issues

- **Misprint** in HTT at Proposition 2.1.1.6, proof, PDF p. 77 (printed p. 59): the source says the homotopy inverse of the base equivalence is taken in C; it should be taken in D; affects the proof.
- **Error** in HTT at Proposition 2.1.2.11, PDF p. 83 (printed p. 65): the source says a section with a fiberwise homotopy from the section-retraction to the identity is left anodyne; it should also require the homotopy to be constant on the section (the two-element monoid with an absorbing idempotent is a counterexample); affects a stated result.
- **Misprint** in HTT at Theorem 2.2.5.1 (W), PDF p. 107 (printed p. 89): the source says a map is a categorical equivalence under the rigidification condition, in the clause that names the weak equivalences of the model structure; it should say weak equivalence; affects a stated result.
- **Misprint** in HTT at Proposition 2.3.4.18, proof, PDF p. 131 (printed p. 113): the source says the two maps compared have domain the boundary of the m-simplex; it should say the m-simplex, with equal restrictions to the boundary; affects the proof.
- **Misprint** in Kerodon at Proposition 4.4.4.9, PDF p. 726: the source says F is a morphism from B to S and also an object of the ∞-category of lifts; it should take two lifts B → X of a fixed map B → S; affects a stated result.

## For the human reviewers

- **Scope.** The description asks that this family become the owner of the generic foundations that BordismFormalGroups §F6.5 item 1 (main, README lines 1558–1930) and EnhancedDerivedSheaves (README line 32) plan; R04 records the two owners, the transfer is yours to decide.
- **Scope.** 469 of 476 source locators are to one text, HTT; Kerodon has 6 and HA 1 (`TauCetiRoadmap/InfinityCategoryTheory/InfinityCategoryFoundations/README.md`, References).
- **Licence.** HA and Kerodon are cited from the author's site and kerodon.net (README lines 3162–3168); neither states a reuse licence in the text read; HA is an unpublished manuscript dated 18 September 2017.
- **Not tested.** The description states that the file elaborates against Tau Ceti 8b9f13d993; the repository pins 2fd255d, and a pin change is outside this pull request.
