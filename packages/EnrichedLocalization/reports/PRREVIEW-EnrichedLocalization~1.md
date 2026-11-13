# Review of EnrichedLocalization (pull request #2269 at 3bceb5a)
Folder: `TauCetiRoadmap/ModelCategoryTheory/EnrichedLocalization/`
**Verdict:** needs changes

## R01 (P1) — The submitted acceptance test does not build

**Location:** TauCetiRoadmap/ModelCategoryTheory/EnrichedLocalization/Suggested.lean:4 — `public import TauCeti.AlgebraicTopology.SimplicialSet.WeakHomotopyEquivalence`.

**Claim:** The gate’s `imports` and `build` failures are reproducible: this module and its predicate do not exist at the pin, so none of the three declarations elaborates.

**Witness:** `lake build TauCeti.AlgebraicTopology.SimplicialSet.WeakHomotopyEquivalence` exits 1: source file absent. The pinned `TauCeti/AlgebraicTopology/SimplicialSet/WeakEquivalence.lean:60` instead supplies the realization-based weak-equivalence instance.

**Repair:** Use the existing `TauCeti.AlgebraicTopology.SimplicialSet.WeakEquivalence` import, add `open scoped SSet.modelCategoryQuillen`, and replace `SSet.IsWeakHomotopyEquivalence` with `HomotopicalAlgebra.WeakEquivalence`; align the README’s signature convention and supplier citation. This exact substitution elaborates in the scratch probe, including all three `#check @…` commands, with only the intended `sorry` warning.

## R02 (P1) — The bundled enriched-category carrier has no pinned supplier

**Location:** TauCetiRoadmap/ModelCategoryTheory/EnrichedLocalization/README.md:97 — “`CategoryTheory.EnrichedCat.category` … the carrier of `Cat_S`”; also TauCetiRoadmap/ModelCategoryTheory/EnrichedLocalization/Suggested.lean:21.

**Claim:** The roadmap treats the bundled category as implemented, but its cited module is absent. The sibling also assumes this missing API rather than constructing it.

**Witness:** At the pin, `TauCeti/CategoryTheory/Enriched/` contains only NaturalTransformation, OppositeFunctor and TensorProduct. PR #2269, `TauCetiRoadmap/ModelCategoryTheory/SimplicialCategories/README.md:879`, likewise cites `CategoryTheory.EnrichedCat.category` as Tau Ceti’s.

**Repair:** Assign the bundled carrier, enriched-functor identity/composition and category instance to an explicit construction target in SimplicialCategories §5.1 before its model-structure target; cite that target here. Delete the assertions that this carrier and its Dwyer–Kan API already exist at the pin, including the module docstring assertion.

## R03 (P2) — Import the simplicial constructions already owned on main

**Location:** TauCetiRoadmap/ModelCategoryTheory/EnrichedLocalization/README.md:9 — “Maps in `hCat_S` are computed through chunks and path objects”; §§1.1–2.2 and 4.4.

**Claim:** These sections independently plan the simplicial chunk, localization, tensor/homotopy-colimit and diagram homotopy-limit constructions already owned by BordismFormalGroups. General excellent-base extensions need an explicit boundary with that existing work.

**Witness:** Main `TauCetiRoadmap/BordismFormalGroups/README.md:1624` owns chunks; :1641 owns internal Hom; :1655 owns localization; :1675 owns the Grothendieck comparison; :1741 owns the diagram homotopy-limit theorem. PR #1807, `TauCetiRoadmap/GeneralizedCohomology/README.md:1564`, relocates the latter; main remains the supplier.

**Repair:** Recast the overlapping development as a Part II extension: “BordismFormalGroups §F6.5 supplies these constructions for simplicial enrichment. The targets here extend them to excellent monoidal bases.” Cite those precise sub-lanes, retain only the additional generality as new work, and add its existing owner to the supplier contracts instead of assigning the simplicial case a second owner.

## R04 (P2) — Require small colimits for the presheaf adjunction

**Location:** TauCetiRoadmap/ModelCategoryTheory/EnrichedLocalization/README.md:758 — “for a small category C and a functor `γ : C → M` into a model category … the coend … has a right adjoint”.

**Claim:** Mathlib’s model-category axioms require only finite limits and colimits. The arbitrary coproducts in this coend, and therefore the claimed adjunction, need an additional hypothesis.

**Witness:** Take the trivial model on finite sets, C terminal and γ(*) = 1. The formula sends the discrete simplicial set ℕ to a countable coproduct of 1, which is not finite.

**Repair:** Assume small completeness and cocompleteness in the chosen universe throughout §3.3, explicitly matching ModelCategories §7.7.1, while retaining noncombinatorial model categories. Add the negative Check: finite sets have the native model structure but no such adjunction, since maps from its proposed L(ℕ) to 2 would number both 2^m and 2^ℵ₀.

## R05 (P2) — Repair the comparison diagram in the weak-exponential proof

**Location:** TauCetiRoadmap/ModelCategoryTheory/EnrichedLocalization/README.md:1015 — “The fiber products `E` … form a diagram on B”; :1020 — “the transition maps of the diagram on B are homotopy equivalences”.

**Claim:** Using W(a) requires a missing map Y(a) → Y(b); using W(b) reverses its variance. Diagonal equivalences do not imply pointwise equivalences off the diagonal. The quoted transition claim is false even for discrete Kan complexes.

**Witness:** Let A₀ be two discrete points, Y₀ = Y₁ = *, Y∞ = 2, X = 2, Zₐ = X^{Yₐ}, C = *. Then E(∞,0) → Map(Y₀,X) is evaluation 4 → 2.

**Repair:** Use the three-index construction of BordismFormalGroups §F6.5, README.md:1773: T = {(a,b,c): c ≤ b ≤ a}, inside Aᵒᵖ × A × Aᵒᵖ, and E(a,b,c) = Map(C,Z(a)) ×_{Map(W(c),Z(a)×Y(b))} Map(W(c),P(a,b)). Prove the required derived right Kan extensions along the projections rather than claiming every transition is an equivalence. For the witness the final comparison is 4 ≅ 2 × 2, while the off-diagonal 4 → 2 remains noninvertible.

## R06 (P3) — Include identities in the Grothendieck transport Check

**Location:** TauCetiRoadmap/ModelCategoryTheory/EnrichedLocalization/README.md:442 — “`W(p)` is its non-identity morphism”.

**Claim:** The defining condition includes a = a′, so this Check omits both identity morphisms.

**Witness:** For the constant terminal diagram on 0 < 1, the pairs (0,0), (0,1), (1,1) give three members of W(p); the Check lists one. HTT line 41658 includes all a ≤ a′.

**Repair:** Replace the sentence by: “Groth(p) is [1]_S and W(p) consists of its two identities and its non-identity morphism; localizing is weakly equivalent to [0]_S.”

## R07 (P3) — Give the Grothendieck construction its basic API

**Location:** TauCetiRoadmap/ModelCategoryTheory/EnrichedLocalization/README.md:433 — “Define … the Grothendieck construction `Groth(p)`”; the next block is Checks.

**Claim:** This definition has no API list. The later homotopy-colimit theorem does not specify the construction’s functoriality or its comparison maps.

**Witness:** Lines 433–437 define objects, mapping objects and πₐ; lines 439–446 jump directly to examples. For the terminal diagram on 0 < 1, π₁ must send all three arrows to the identity.

**Repair:** Add API bullets stating that a natural transformation p → q induces Groth(p) → Groth(q) over A, preserving transport arrows and respecting identities/composition; that πₐ is an enriched functor carrying W(p)ₐ to identities; and that these projections commute with transition functors after restriction. Cite HTT Def. A.3.5.11, PDF p. 913, and its following paragraph.

## R08 (P3) — Add APIs and discriminating Checks for the inline constructions

**Location:** TauCetiRoadmap/ModelCategoryTheory/EnrichedLocalization/README.md:385 — “with categorical mapping cylinder M”; :749 — “has a cosimplicial resolution”.

**Claim:** The mapping cylinder and cosimplicial resolution are new constructions, but neither receives its basic API and three discriminating Checks.

**Witness:** §2.1.3 defines M without Checks; §3.3.1 defines Γ without Checks. For a point, the constant cosimplicial point has latching map 2 → 1 in degree one and is not Reedy cofibrant.

**Repair:** For M, state functoriality in squares, its two inclusions and j restricted to D = id; test f = id_* (M = [1]), f : ∅ → D (M = D), and * → {0,1} (one nonidentity arrow to the chosen point, none to the other). For Γ, state that Γ(c,0) is cofibrant, structure maps are weak equivalences, and maps of resolutions respect the augmentation; test Γⁿ = Δ[n] resolving *, the non-Reedy-cofibrant constant point (2 → 1), and the constant empty resolution (∅ → ∅).

## Verified sound

| Statement | Instances | Computed left side | Computed right side | Result | Change |
| --- | --- | --- | --- | --- | --- |
| Conventions: bifibrancy/excellence | SSet; ∂Δ[1], Λ[2,1] | ∂Δ[1]: two discrete points, Kan | Λ[2,1]: missing composite, not Kan | agrees | — |
| Conventions: homotopy classes | D walking isomorphism / two discrete objects | isomorphism classes: 1 / 2 | Hom([0],D): 1 / 2 | agrees | — |
| Conventions: localization direction | W empty; S empty | C[W⁻¹] ≅ C | S⁻¹A has A’s weak equivalences | agrees | — |
| Conventions: empty index | A = ∅; M = SSet | one empty diagram | colimit = ∅ | agrees | — |
| 1.1.1 chunk definition/replacements | U = {∅}, ∅, or {*} in SSet | {∅}, ∅: chunk conditions hold | {*}: fold 2 → 1 is not mono | distinguishes | — |
| 1.1.1 equivalence of chunks | Kan versus all SSet | each homotopy type has a Kan representative | same essential image; different objects | agrees | — |
| 1.1.2 enriched factorizations | S = Set, A = Set, trivial model | factorization midpoint X | first/second weak factor = id_X | agrees | — |
| 1.1.3 closure and equivalent inclusions | retain empty and contractible homotopy types | essential image has 2 types | bifibrant inclusion: identity mapping spaces, 2 types | agrees | — |
| 1.1.4 C-chunks | free monoid K uncountable; U countable Kan | cofibrant nonempty K-object has ≥ card(K) vertices | U permits ≤ ℵ₀ simplices | distinguishes | — |
| 1.1.4 empty/unit/countable indices | C = ∅, [0], or countable free monoid | diagram values: terminal, U, countable cell closures | C-chunk: yes, yes, yes | agrees | — |
| 1.1.5 abundance/embedding | U = {*}; C = [0] | closure adds contractible representatives | essential image remains one homotopy type | agrees | — |
| 1.2.1 path-category definition | Z = K(ℤ,1); U empty | diagonal on π₁: n ↦ (n,n), nonsurjective | path evaluation is fibrant replacement; P(∅) = ∅ | distinguishes | — |
| 1.2.2 path-object theorem | U = all Kan; span 2 → 2 × 2 diagonal | endomorphism mapping space of this span: discrete 4 | π identifies it with Map(2,2): discrete 4 | agrees | — |
| 1.2.3(a) functor homotopy | C = [0], targets * and 2 | different classes in hCat_S | not weakly equivalent: π₀ sizes 1 and 2 | agrees | — |
| 1.2.3(b) essential image | inclusion {*} → {0,1}; D = [0] | Hom(D,*): singleton | image in Hom(D,{0,1}): chosen singleton | agrees | — |
| 1.3.1(a) representability — headline | C = [0], A = SSet | weak-equivalence classes of diagrams = homotopy types | maps [0] → Kan = homotopy types | agrees | — |
| 1.3.1(b,c) internal Hom — headline | C = ∅; D = [0] | bifibrant empty-diagram category is terminal | C ⊗ D = ∅; one functor to U° | agrees | — |
| 2.1.1 localization definition | C = Bℕ; W = {1} | π₀ endomorphisms after inversion = ℤ | collapsing the arrow instead yields trivial monoid | distinguishes | — |
| 2.1.2(a,b) extension criterion | C = [1]; D = [1] versus walking isomorphism | noninvertible arrow has no extension | invertible arrow extends; two-sided inverse exists | agrees | — |
| 2.1.2(c) universal property | C = [1], D discrete on two points | localized Hom classes: two constant functors | invertible-arrow Hom classes: same two | agrees | — |
| 2.1.3 mapping cylinder | f = id_* | M has two objects and three arrows | M[W⁻¹] ≃ *; π₀ objects = 1 | agrees | R08: add API/Checks |
| 2.1.4 tensor/localization | C = Bℕ, D discrete on two points | localized tensor: two components, each π₀ endomorphisms ℤ | Bℤ ⊗ D: same two components | agrees | — |
| 2.2.1 filtered category | [1]_K over 0 < 1, K nonempty | forward cross-Hom = K; reverse = ∅ | reversed rank demands K = ∅ | distinguishes | — |
| 2.2.1 colimit API | A discrete on two points; fibers terminal | colimit has two objects, no cross arrows | C[∅⁻¹] has the same two objects | agrees | — |
| 2.2.2 homotopy-colimit filtration | A = {0 < 1}, C = [1] | colim(C≤a) = [1] | hocolim(C≤a) ≃ [1] | agrees | — |
| 2.2.3 Groth construction and transport | constant * over 0 < 1 | W = {id₀, 0→1, id₁}: size 3 | README Check specifies size 1 | fails | R06 |
| 2.2.3 projection API | same diagram; π₁ | three source arrows | all map to id_* | missing API | R07 |
| 2.2.4 Groth computes hocolimit | constant * over 0 < 1 | localized [1] ≃ * | hocolim constant * ≃ * | agrees | — |
| 2.2.5 tensor/hocolimit — headline | A two discrete points; p(a) = *; D has 3 discrete objects | colim(p ⊗ D): 6 objects | (colim p) ⊗ D: 2 × 3 = 6 objects | agrees | — |
| 2.3.1(a) mapping-object limits | J two discrete points; Cj discrete on two objects | product has 4 objects; each endomorphism space * | homotopy product of two endomorphism spaces = * | agrees | — |
| 2.3.1(b) essential-surjectivity hypothesis | C = {*}, limit = two discrete points | all existing mapping-object comparisons are identities | one object missing; no β makes composite an equivalence | distinguishes | — |
| 2.4.1 fixed-object model | O = ∅ / {s,t}; all homs terminal | empty O: one category; swap interchanges s,t | fixed-object morphisms must fix s,t; swap excluded | agrees | — |
| 2.4.1 matrix tensor | O = {s,t}; every graph entry a point | (X ⊗ Y)st = two points | entrywise tensor gives one point | distinguishes | — |
| 2.4.2 undercategory comparison | O = {s,t}; adjoin one s→t arrow | free graph cell produces walking arrow under O | Bergner cell [1]∅ → [1]* produces same arrow | agrees | — |
| 2.4.3 homotopy siftedness | J terminal / discrete two points / empty | cospan nerves: * / ∅ / vacuous | sifted: yes / no / no | agrees | — |
| 2.4.3 Δᵒᵖ Check | m = n = 1 | nerve of simplex category of square: π₀ = 1, higher π = 0 | Δ[1] × Δ[1]: same groups | agrees | — |
| 2.4.4 cofinality | {1} → [1]; X constant K | comma categories: terminal at both objects | both homotopy colimits ≃ K | agrees | — |
| 2.4.4 negative orientation | {0} → [1]; X = (∅ → *) | 1↓δ = ∅; source homotopy colimit ∅ | target homotopy colimit * | distinguishes | — |
| 2.4.5 product comparison | J = [1]; u,v constant discrete sizes 2,3 | hocolim pointwise product: 6 points | product of homotopy colimits: 2 × 3 = 6 | agrees | — |
| 2.4.5 nullary comparison | J terminal versus empty | hocolim constant point: * versus ∅ | required terminal product: * in both cases | distinguishes | — |
| 2.4.6 fixed-object sifted colimits | J terminal; O = one point; discrete monoid S₃ | homotopy colimit endomorphism monoid S₃, size 6 | underlying mapping-space homotopy colimit: 6 points | agrees | — |
| 2.4.6 undercategory hypothesis | J empty; O = {*} | initial object of O/ is O, one object | initial simplicial category has zero objects | distinguishes | — |
| 3.1.1 IsLocal | S = {∂Δ[1] → Δ[1]}; Z = ∅ / * / K(ℤ,1) | mapping comparison: ∅→∅ / *→* / π₁ diagonal ℤ→ℤ² | local: yes / yes / no | agrees | — |
| 3.1.1 localEquivalences | same S; f : ∅ → *; test Z = ∅ | Map(*,∅) = ∅ | Map(∅,∅) = *; f not local equivalence | distinguishes | — |
| 3.1.1 second localization | S = {∅ → *} | local Kan objects: nonempty contractible ones | all maps induce equivalences between contractible mapping spaces | agrees | — |
| 3.1.1 model-structure direction | Kan–Quillen versus Joyal; Δ[1] → * | weak homotopy equivalence: π₀ = 1, higher π = 0 | categorical equivalence fails: two nonisomorphic objects | distinguishes | — |
| 3.1.2 cofibration test | S = {∅ → *}; i : ∂Δ[1] → Δ[1]; Z = * | i is local equivalence | Map(i,*) = id_*, trivial Kan fibration | agrees | — |
| 3.2.1 localization — headline/Lean | S empty / {∅ → *} | weak equivalences: ordinary / all maps | fibrant objects: Kan / contractible Kan | agrees | — |
| 3.2.1 properness/pushout-product | S = {∅ → *}; cofibrations monomorphisms | all maps local equivalences | pushout and pushout-product maps also local equivalences | agrees | — |
| 3.3.1 resolutions | M = SSet; resolve point | Γⁿ = Δ[n]: latching ∂Δ[n] → Δ[n] mono | constant point: degree-one latching 2 → 1 not mono | distinguishes | R08 |
| 3.3.2 universality | C = *; M = SSet; Γⁿ = Δ[n] | coend Kₙ·Δ[n] = K | right adjoint identity; L(*) = * | agrees | — |
| 3.3.2 missing cocompleteness | M finite sets; γ(*) = 1; K discrete ℕ | Hom(LK,2) would have finite size 2^m | Hom(K,R2) has size 2^ℵ₀ | fails | R04 |
| 3.4.1 compact generators | M = sets, trivial model; λ = ℵ₀ | ℕ = filtered union of finite subsets | cofibrant objects: all sets; union = ℕ | agrees | — |
| 3.4.2 derived counit | M = sets; C finite sets; X = {0,1} | C↓X has terminal object id_X | canonical homotopy colimit = X; counit bijective | agrees | — |
| 3.4.3 derived units/localization | M = terminal model category; C = * | unit K → *; inverted derived units | localized spaces present one homotopy type | agrees | — |
| 3.4.4 presentation — headline | M = SSet; C = *; S empty | S⁻¹UC = SSet | identity adjunction; derived unit/counit identities | agrees | — |
| 3.4.5 simplicial presentation — headline consequence | M = SSet | presentation is SSet, left proper and simplicial | left adjoint identity; same homotopy category | agrees | — |
| 4.1.1 weak exponential definition | X discrete 2, Y discrete 2, W = * | Hom(*,X^Y) has 4 elements | Hom(* × Y,X) has 2² = 4 elements | agrees | — |
| 4.1.1 degenerate exponent | Y = ∅; Z = Δ[1] versus ∂Δ[1] | Hom_h(*,Z) has 1 versus 2 elements | Hom_h(∅,X) has 1 element | distinguishes | — |
| 4.1.1 standardization/transport | identity Quillen equivalence; X=Y=Z=* | P=*; p=id; evaluation=id | same standard diagram and singleton Hom sets | agrees | — |
| 4.2.1 multiplication | pointed SSet; A discrete two points; Y = S⁰ | Y ∨ Y has 3 vertices | Y has 2 vertices; fold not equivalence | distinguishes | — |
| 4.2.2 invariance/Cat_S | identity Quillen equivalence; D discrete two objects | product of two-point coproduct with D has 4 objects | coproduct of two copies of D has 4 objects | agrees | — |
| 4.2.3 closure-generation | empty index and boundary of Δ[2] | empty hocolim = ∅; boundary has π₁ = ℤ | closure includes ∅ and noncontractible S¹ | distinguishes | — |
| 4.2.4 mapping-space theorem | X=2, Y=2, Z=4, W=*, W′=2, P=Z×Y | E = discrete 4 | Map(W′,X) = discrete 4; evaluation bijective | agrees | — |
| 4.3.1 homotopy-limit theorem | A₀ two points; Y₀=Y₁=*; Y∞=2; X=2 | Z∞ = 2² = 4 points | holim(Z₀,Z₁) = 2 × 2 = 4 points | agrees | — |
| 4.3.1 off-diagonal proof claim | same instance; (a,b)=(∞,0); C=* | E(∞,0) has 4 points | Map(W(0),X) has 2 points | fails | R05 |
| 4.4.1 localized chunks | U = Kan complexes; already bifibrant | U° = U_f = U | inverting homotopy equivalences preserves U up to DK equivalence | agrees | — |
| 4.4.2 filtered limits | M = sets, trivial model; A₀ two points | filtered union of finite products = product of filtered unions | ℕ × ℕ on both sides | agrees | — |
| 4.4.3 diagram limits — headline | C₀=C₁=[0], C∞ two discrete objects; M=SSet | diagrams on C∞: pairs of spaces | product of two diagram categories: same pairs | agrees | — |
| 4.4.3 empty index — headline | A₀ = ∅; C∞ = ∅ | empty-diagram category is terminal | homotopy limit of empty diagram is terminal | agrees | — |
| Pinned carrier/import contracts | submitted pin | 1 requested module and 1 bundled carrier | 0 matching module/carrier declarations | fails | R01–R02 |
| Ownership boundary | simplicial specialization | this roadmap claims chunks/localization/diagram limits | main BordismFormalGroups claims the same constructions | duplicate | R03 |

- 15/15 seeded sections, all 44 numbered target blocks and all 5 listed headlines examined; 5 readable sources, 1 uncertified source (DK80 §7).
- 20 prose passages compared against HTT, HA, Riehl and both Dugger papers; HTT PDF-page locators match the stated +18 pagination convention.
- 18 pinned declarations opened, including `ModelCategory` (Mathlib/AlgebraicTopology/ModelCategory/Basic.lean:43), `MonoidalClosed.pre` (Mathlib/CategoryTheory/Monoidal/Closed/Basic.lean:241), `MorphismProperty.IsSmall` (Mathlib/CategoryTheory/MorphismProperty/IsSmall.lean:35) and `tensorEnrichedCategory` (TauCeti/CategoryTheory/Enriched/TensorProduct.lean:97).
- 54 explicit supplier target IDs resolved at #2269: 23 ModelCategories, 6 KanQuillen, 25 SimplicialCategories; the missing pinned carrier is R02.
- Gate: `imports=1`, `build=3`, all other reported counters zero; independent missing-module build and original-file elaboration fail at the same import.
- Signature probe: original import prevents 3/3 checks; the R01 substitution yields 3/3 signatures with the explicit smallness and monomorphism hypotheses retained, only `sorry` warning.
- Padding: 1 admitted theorem, 2 supporting definitions; no duplicate theorem found. `simp` fails on the repaired probe; the library’s ordinary Hom-localization predicates do not construct this model structure.
- PR text and scope: 2 added roadmap files, 0 removed declarations, 0 unauthorized outside-folder changes; the description explicitly discloses the pin mismatch and overlap.

Dependency-check output: `depcheck: 223 roadmaps, 1972 edges, 0 problem(s)`.

Overlap check: read PresentableInfinityCategories, Straightening, LimitsAndKanExtensions, PresheavesAndCompletions and InfinityCategoryFoundations (#2270), plus BordismFormalGroups, EnhancedDerivedSheaves and GeneralizedCohomology on main; simplicial chunks, localization, products and enriched diagram limits belong to BordismFormalGroups F6.5; enriched-to-quasicategorical comparison belongs to LimitsAndKanExtensions; presentable ∞-category comparison belongs to PresentableInfinityCategories; spectral and sheaf specializations belong to GeneralizedCohomology and EnhancedDerivedSheaves. Fixed-object model categories and model Bousfield/Dugger presentation targets are additional work here. No conflicting head, dropped cited ID or duplicate folder was reported.

Source independence: 20 prose passages compared with 5 sources; no copied passage or reused table/figure identified. Largest share HTT: 195 of 217 explicitly source-labelled locator groups. Contents compared with HTT: the path-object → internal-Hom → localization → tensor/homotopy-colimit → exponential dependencies force the principal sequence; §2.3, §2.4 and the Dugger layer are separately placed. No additional arrangement finding.

## Not verifiable

- DK80 §7: the sources service resolves the citation only to a paywalled publisher; uncertified, with the fixed-object construction independently checked against HA lines 4180–4214.
- Original elaborated signatures and one-tactic execution: unavailable beyond the missing import; the successful substitution probe is evidence for R01’s repair, not a passing build of this head.
- Published Dugger pagination: source checks use the legal arXiv v1 texts linked in the README; no separate publisher-text comparison was available.

## Source issues

- **Misprint** in HTT at Lemma A.3.4.10 proof, printed p. 889 (HTT line 41372): the source says the replacement functor has direction U → C; it should be C → U; affects the proof.
- **Misprint** in HTT at Lemma A.3.4.15 proof, printed p. 891 (HTT line 41461): the source says the second factor is an injective trivial cofibration; it should be a projective trivial fibration; affects the proof.
- **Misprint** in HTT at Proposition A.3.5.10, printed p. 895 (HTT line 41636): the source says the displayed colimit exhibits C; it should be C[W⁻¹]; affects a stated result.
- **Misprint** in HTT at Proposition A.3.6.10 proof, printed p. 900 (HTT line 41871): the source says the final Hom-set has target P; it should have target X, using the evaluation map; affects the proof.
- **Misprint** in HTT at Lemma A.3.6.14, printed p. 902 (HTT line 41929): the source says G has domain A; it should have domain Aᵒᵖ to admit pullback along π; affects a stated result.
- **Gap** in HTT at Proposition A.3.6.15 proof, printed p. 903 (HTT lines 41968–41980): the source says its two-variable pullback gives both comparison diagrams; it should supply compatible variance, for example using separate indices c ≤ b ≤ a and derived right Kan extensions; affects the proof.
- **Misprint** in HTT at Proposition A.3.6.16, printed p. 903 (HTT line 41993): the source says Wₐ consists of weak equivalences in Vₐ, which is undefined; it should specify the projectively fibrant U-valued diagram category; affects a stated result.
- **Misprint** in HTT at Lemma A.3.6.17 proof, printed p. 904 (HTT lines 42024–42026): the source says the homotopy on U_f[W⁻¹] ends at j composed with i; it should end at i composed with j; affects the proof.
- **Misprint** in HTT at Lemma A.3.7.1 proof, printed p. 908 (HTT lines 42179–42180): the source says to form a pushout of A′ and Y over A; it should form the pushout of A and Y over A′; affects the proof.
- **Misprint** in Dug01b at Lemma 6.3 proof, preprint p. 11 (Dug01b line 510): the source says Reedy replacement factors latching maps into cofibrations followed by trivial cofibrations; it should say trivial fibrations for the second factors; affects the proof.

## For the human reviewers

- DK80 §7 remains uncertified because only the paywalled publication was resolved; the source’s wording and arrangement were not inspected. HTT, the dominant source, and its contents were readable.
