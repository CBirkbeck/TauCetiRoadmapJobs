# Review of InfinityCategoryFoundations (pull request #2270 at 04df60e)
Folder: `TauCetiRoadmap/InfinityCategoryTheory/InfinityCategoryFoundations/`
**Verdict:** needs changes

## R01 (P1) — `Suggested.lean` does not build at the pinned Tau Ceti

**Location** `TauCetiRoadmap/InfinityCategoryTheory/InfinityCategoryFoundations/Suggested.lean` lines 10, 11, 13, 14, 15, 17, 21: "public import TauCeti.AlgebraicTopology.Quasicategory.InitialVertex" and six more.

**Claim** The file states its theorems against the pinned Mathlib and Tau Ceti.

**Witness** Gate at this head: `imports=7`, `build=15 FAIL`. At the pinned Tau Ceti (2fd255d) the modules `Quasicategory/InitialVertex`, `Quasicategory/Limit`, `Quasicategory/TerminalVertex`, `SimplicialNerve/Basic`, `SimplicialSet/AnodyneExtensions/LeftRight/Basic`, `SimplicialSet/Fiber`, `SimplicialSet/WeakHomotopyEquivalence` do not exist.

**Repair** Keep only imports that exist at the pin. Every declaration that needs one of the seven modules (left and right fibrations, terminal and initial vertices, `coslice.IsColimit`, `SSet.fiber`, `simplicialNerveMap`, `SSet.IsWeakHomotopyEquivalence`) is removed and named in the module docstring as not statable, with the missing carrier; or the pull request is rebased once the repository's pin contains them.

## R02 (P1) — supplier contracts cite Tau Ceti declarations that are not at the pin

**Location** `README.md` lines 50–51 and 283–370: "The following statements are already in the library, and the layers below use them through the supplier contracts".

**Claim** Each listed Tau Ceti declaration exists where it is cited.

**Witness** Absent at pin 2fd255d: `SSet.LeftFibration`, `SSet.IsTerminalVertex`, `SSet.slice.rightFibration_π`, `SSet.coslice.opSliceIso`, `SSet.ihomOver`, `SSet.Edge.isEquivalence_iff_hornFilling_zero`, `SSet.CatInftyΔ`, and 26 more (33 names; no file `Quasicategory/OuterHorn.lean`, `RightFibration.lean`, `Slice.lean`, `CatInfty.lean`).

**Repair** For each of the 33 names: cite it only if it is at the pin; otherwise state the object here as a target with its API and Checks (the Checks already written under the contract move with it), and drop the sentence "already in the library" for it. Layer `*Needs:*` lines then point to the new targets.

## R03 (P2) — the Joyal structure, unmarked straightening and the comparison have an owner on main

**Location** `README.md` lines 45–48: "This roadmap is the first Part of the InfinityCategoryTheory family; it consumes Mathlib, Tau Ceti and the ModelCategoryTheory family."

**Claim** This roadmap owns Layers 6–9 (covariant and contravariant structures, straightening, mapping-space comparison, Joyal structure, Quillen equivalence with Bergner).

**Witness** On main, `TauCetiRoadmap/BordismFormalGroups/README.md` lines 1820–1828, 1880–1883, 1927–1930 construct the same objects ("This constructs the Joyal model and the rigidification/nerve Quillen equivalence"); `TauCetiRoadmap/EnhancedDerivedSheaves/README.md` line 32 names F6.5 as owner.

**Repair** One owner. Either import these items from BordismFormalGroups §F6.5 ("Categorical model and functor spaces", "Unmarked straightening and the categorical model") and keep here only what F6.5 does not state; or have a revision of BordismFormalGroups and EnhancedDerivedSheaves hand the items over, name that revision in the description, and list in Scope and ownership which F6.5 items this roadmap replaces.

## R04 (P2) — §1.1.2 and §2.4.2 restate ModelCategoryTheory, Part SimplicialCategories

**Location** `README.md` lines 485–496: "Define a simplicial functor F : C → C′ of simplicial categories to be an equivalence (a Dwyer–Kan equivalence) when the induced functor `hC → hC′` of H-enriched categories … is an equivalence".

**Claim** The H-enriched homotopy category of a simplicial category and its equivalences are defined here.

**Witness** ModelCategoryTheory, Part SimplicialCategories at its open head: §1.2 ("Every S-enriched category C has an `hS`-enriched homotopy category `hC`") and §5.1.1 (weak equivalences of S-enriched categories; for S simplicial sets, the Dwyer–Kan description).

**Repair** Replace the two definitions of §1.1.2 by "the homotopy category `hC` and the weak equivalences of simplicial categories are those of ModelCategoryTheory, Part SimplicialCategories §1.2 and §5.1.1 at S = simplicial sets"; keep the Checks. In §2.4.2 keep only the comparison with Tau Ceti's predicate.

## R05 (P2) — the layers follow one source's sections in order

**Location** `README.md`, Layers 3–10 (lines 935–2976); 404 of 409 locators are HTT.

**Claim** The organisation is the roadmap's own.

**Witness** §3.1 ↔ 2.1.1; §3.2–§4.3 ↔ 2.1.2; §5.3–5.4 ↔ 2.1.3; §6.2–6.4 ↔ 2.1.4; §7.2 ↔ 2.2.1; §7.3 ↔ 2.2.2; §7.4–7.6 ↔ 2.2.3; §8.1 ↔ 2.2.4; §9.3–9.7 ↔ 2.2.5; §10.3–10.5 ↔ 2.3.3; §10.6 ↔ 2.3.4.

**Repair** Only §9.3.1 and §9.5.1 `*Needs:*` §8.1.1 and §7.3.2 force Layer 9 after Layers 6–8, and only on this route. Regroup by what the end theorems need: (a) lifting calculus (Layers 3–4, §9.1–9.2, §10.2); (b) the Joyal structure and its fibrant objects; (c) fibrations over a base and straightening; (d) comparison with simplicial categories (§8.1, §9.6); (e) minimal models and truncation. Cite for the main results Dugger–Spivak, *Mapping spaces in quasi-categories* (arXiv:0911.0469v1), Thm. 2.13 (Joyal structure), Thm. 1.4 (mapping-space comparison), Thm. 1.5 (Quillen equivalence); Heuts–Moerdijk, *Left fibrations and homotopy colimits* (arXiv:1308.0704v5), Thm. C (covariant structure and diagrams).

## R06 (P2) — §7.7.1 (1) uses the rigidification of an outer horn, which §2.5 excludes

**Location** `README.md` lines 1974–1976: "`∂Δ[n] ⋆ Δ[0] = Λ[n + 1, n + 1]`, whose rigidification differs from `C[Δ[n + 1]]` only in the mapping simplicial sets from 0 to n and from 0 to n + 1 (§2.5)".

**Claim** §2.5 supplies the mapping objects of `C[Λ[n + 1, n + 1]]`.

**Witness** §2.5.2 (line 832) is stated for 0 < i < n and adds "The restriction to inner horns is needed". For `Λ[2, 2]`: `Map(0,1)` is ∅ and `Map(0,2)` is one point, against a point and Δ[1] in `C[Δ[2]]`.

**Repair** Add to §2.5 the target: "for n ≥ 1, `C[Λ[n, n]] → C[Δ[n]]` is bijective on objects and an isomorphism on every mapping object except those from 0 to n − 1 and from 0 to n, which are the subcomplexes of the cubes spanned by the chains of subsets no bead of which contains {0, …, n − 1}; dually for `Λ[n, 0]`", with the `Λ[2, 2]` values as its Check, and cite it in §7.7.1 and its `*Needs:*`.

## R07 (P3) — eleven definitions in `Suggested.lean` serve no stated theorem

**Location** `Suggested.lean` lines 90, 103, 110, 119–171: `IsZeroObject`, `IsLimitDiagram`, `IsLeftExact`, `spanCoord₁`, `spanCoord₂`, `cospanCoord₁`, `cospanCoord₂`, `coconeShape`, `coneShape`, `IsPushoutSquare`, `IsPullbackSquare`.

**Claim** Definitions are kept only to make a headline statable.

**Witness** No theorem of the file mentions any of the eleven (only `IsColimitDiagram` is used, in §8.3.1); the module docstring says "later Parts restate them with the same bodies".

**Repair** Delete them from `Suggested.lean`; the README keeps §1.2.3–§1.2.4 as prose without the backticked names.

## R08 (P3) — the README removes a library declaration and speaks of the pins

**Location** `README.md` line 369: "This roadmap takes that declaration to be removed and the name `SSet.CategoricalFibration` to denote the notion of §9.4.1"; also lines 1656, 1968, 2249–2250; `Suggested.lean` lines 718–719.

**Claim** The text is timeless and changes nothing outside the roadmap.

**Witness** "the pinned Tau Ceti has no homotopy-equivalence predicate" (1656); "since the pins have no rigidification" (1968); "the planned Tau Ceti declaration" (2249). `Quasicategory/CategoricalFibration.lean` is not at the pin.

**Repair** Line 365–370: "Categorical fibrations are those of §9.4.1 (Kerodon's isofibrations of simplicial sets); the inner fibrations along which equivalences lift are a weaker class off ∞-categories and agree with it over one (§10.2.4)." Line 1656: "the weak-equivalence form is the definition; §7.4.1 proves it equal to HTT's". Delete the clauses at 1968 and 2249–2250 and the docstring sentence.

## R09 (P3) — wrong internal pointers, and §2.1.4 needs §2.1.5

**Location** `README.md` line 660: "the counit `C[N(C)] → C`, the simplicial functor corresponding to the identity of N(C) under the bijection of §2.1.5"; lines 1144, 2241, 2364, 2795.

**Claim** Each `*Needs:*` item names the section that supplies it, earlier in the build.

**Witness** §2.1.5 `*Needs:*` §2.1.4 (line 684), so the two need each other. "§2.1.1 (HTT, Def. 1.2.10.1, full faithfulness)" (2364) and "§2.1.1 (HTT, Def. 1.1.5.14)" (2795): §2.1.1 is rigidification.

**Repair** Move the counit from §2.1.4 into §2.1.5. Line 2364 and 2241: §2.1.8 for full faithfulness. Line 2795: §2.1.6. Line 1144: §2.1.3 for the homotopy category of the opposite.

## R10 (P3) — §1.2.3 has two Checks

**Location** `README.md` lines 553–556 (zero objects).

**Claim** Every definition has at least three discriminating Checks.

**Witness** Two bullets.

**Repair** Add: "In J, the nerve of the contractible groupoid on {0, 1}, both vertices are zero objects: zero objects are unique up to equivalence, not equal. A definition asking for a unique vertex would reject J."

## R11 (P3) — the gloss of essential surjectivity fails off ∞-categories

**Location** `README.md` lines 787–789: "essentially surjective when the induced functor of homotopy categories `hoFunctor.map f` is essentially surjective: every object of D is equivalent to f(x) for some object x of C".

**Claim** The two clauses agree for every simplicial set D, with "equivalent" as in §2.3.1 (an equivalence edge joins them).

**Witness** D generated by 2-simplices (b, g, h), (a, h, id₀), (g, a, k), (k, b, id₂) on a : 0 → 1, b : 1 → 2, g : 2 → 0: in `hD`, ba is inverse to g, but D has no edge 0 → 2, so no equivalence joins 0 and 2; {0, 1} ⊆ D separates the clauses.

**Repair** "…is essentially surjective; when D is an ∞-category this says that every object of D is equivalent to f(x) for some object x of C."

## R12 (P3) — §3.1.2 is stated for ∞-categories, its Lean form for all simplicial sets

**Location** `README.md` lines 950–952: "for a left fibration p : C → D of ∞-categories, an object Y of C and an equivalence f̄ : X → p(Y) of D, there is a morphism f : X' → Y of C with p(f) = f̄".

**Claim** README and Lean have the same generality.

**Witness** `hasLift_of_isEquivalence_of_leftFibration` (`Suggested.lean` line 232) has no `Quasicategory` hypothesis; the route of §3.1.2 (lift the inverse from Y, fill one `Λ[2, 0]`) uses none.

**Repair** "for a left fibration p : C → D of simplicial sets … there is f with p(f) = f̄; when C is an ∞-category every such f is an equivalence (§3.1.1)."

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| §2.2.1 strict Segal ⇒ unit iso | Δ[1]; Λ[2,1] | Δ[1]: unit bijective on spines. Λ[2,1]: `hΛ[2,1]` = [2] has 0 → 2, Λ[2,1] has no such edge; not strict Segal | holds; hypothesis needed |
| §2.6.1 nerve of a local Kan fibration | `C[Δ[2]] → [2]` | `Map(0,2)`: Δ[1] → point, a Kan fibration; `Λ[2,1]` lifts through the edge {0,2} ⊂ {0,1,2} | holds; HTT line 1605 same hypothesis |
| §2.6.4 equivalence ⇔ fully faithful and essentially surjective | {0} ⊆ Δ[1]; ∂Δ[1] ⊆ Δ[1] | first: mapping objects equal, 1 not reached; second: `Map(0,1)` ∅ → point | both sides false twice |
| §2.7.1 homotopy-invertible morphisms | one object, End = ℤ/2 discrete | every f invertible in `hC`; composition a bijection of two points | holds; HTT line 2030 is topological, README says so |
| §4.1.1 pushout-joins | Λ[1,1] ⊆ Δ[1] with ∅ ⊆ Δ[0]; Λ[1,0] ⊆ Δ[1] with ∅ ⊆ Δ[0] | Λ[2,1] ⊆ Δ[2], inner; Λ[2,0] ⊆ Δ[2], left horn, not inner | matches both lemmas (HTT lines 3249, 3271) |
| §4.2.1 slices along fibrations | X = Δ[1], S = Δ[0], A = ∅, B = Δ[0] at 0 and at 1 | `X_{0/}` = Δ[1] → Δ[1] identity; `X_{1/}` = {1} → Δ[1]: left, not right, fibration | holds |
| §4.3.2 restriction along anodyne maps | C = Δ[1], f : 0 → 1; S = ∂Δ[1] Kan, i = ∅ ⊆ Δ[0] | `C_{f/}` point → `C_{1/}` point; → `C_{0/}` = Δ[1] not surjective; `S_{x/}` → S misses a vertex | "i anodyne" needed, as stated (HTT line 3285) |
| §5.1.1 Kan ⇔ ∞-groupoid | Δ[1]; ∂Δ[1]; ∅ | Δ[1]: Λ[2,0] with edges 0 → 1, id₀ has no filler, `hΔ[1]` not a groupoid; others: all four hold | holds |
| §5.4.2 Kan fibration ⇔ transport invertible | {1} ⊆ Δ[1] | left fibration, fibers ∅ and point, `f_!` : ∅ → point not an isomorphism; Λ[1,1] has no lift | both sides false |
| §6.2.2 covariant equivalences | {0} ⊆ Δ[1], {1} ⊆ Δ[1] over Δ[1]; ∅ → Δ[0] | cones: Λ[2,1] ⊆ Δ[2]; Λ[2,2] ⊆ Δ[2], no morphism cone → 0 in `hΛ[2,2]`; Δ[0] ⊔ Δ[0] → Δ[1] | yes, no, no |
| §6.3.1 covariant structure, (3) | {0} → Δ[1]; {1} → Δ[1] | {0}: edge 0 → 1 has no lift from 0, not left fibration, not fibrant; {1}: left fibration | consistent with §6.4 Check 3 |
| §7.3.1 twisted realization | n = 0, 1 | `J⁰` = Δ[1], `Q⁰` = Δ[0]; `J¹` = Δ[2]/Δ{0,1}, `Q¹` = Δ[1] with vertices 02 and 12 | matches HTT p. 94 |
| §7.4.1 pointwise equivalences | {0} ⊆ Δ[1] over Δ[1]; fold Δ[1] ⊔ Δ[1] → Δ[1] | fiber over 1: ∅ → point; fibers two points → one | not pointwise, as the Checks say |
| §9.4.1 categorical fibrations | {0} → J; Δ[1] → Δ[0] | edge 0 → 1 of J has no lift; swap ∂Δ[1] → Δ[1] has no extension | inner ≠ categorical ≠ trivial |
| §10.1.2 n-categories | n = −1; N(ℤ/2); N(two isomorphic objects) | m = 0 forces ≤ 1 vertex: ∅, Δ[0]; two edges, one boundary: not 0-, is 1-category; equivalent distinct vertices: not 0-category | holds; HTT line 5285 |
| §10.8.1 boundary spheres | k = −1, X = Δ[0] ⊔ Δ[0]; k = −2, X = ∅; k = 0, X = ∅ | diagonal hits 2 of 4 vertices; ∅ → Δ[0]; ∅ → ∅ isomorphism, ∅ 0-truncated | both sides agree; HTT line 23321 has k ≥ −2 |
| Headline: straightening theorem (§7.5.2) | S = Δ[1], X = {0}, X = {1} | `St` = (point, ∅) and (point, point): presheaves represented by 0 and 1 | variance right; not statable, named |
| Headline: right fibrations are fibrant (§7.6.1) | {1} → Δ[1] over Δ[1] | {1} ⊆ Δ[1] right anodyne, no lift against itself: not fibrant, not a right fibration | both sides false |
| Headline: classification (§7.7) | K = Δ[0], X = ∅; vertex ∗ | fiber of the universal fibration over ∅ empty; over ∗ equal to Δ[0] | ∅ classified by ∅ only |
| Headline: comparison theorem (§8.1.2) | C = [2] discrete | `C[N(C)]` = `C[Δ[2]]`, `Map(0,2)` = Δ[1] → point: weak equivalence, not isomorphism | holds; not statable, named |
| Headline: Joyal structure (§9.5) | Λ[2,1]; Δ[1]; `Fun(Δ[1],Δ[1]) → Δ[1] × Δ[1]` | identity of Λ[2,1] does not extend to Δ[2]; fiber over (1,0) empty | Λ[2,1] not fibrant; fibration not trivial |
| Headline: Joyal's form (§9.7.2) | ∂Δ[1] ⊆ Δ[1], C = Δ[0] ⊔ Δ[0]; Λ[2,0] ⊆ Δ[2], C = Δ[1] | 2 against 4 objects; posets with 4 and 5 elements | both fail on both sides |
| Headline: fibrations over an ∞-category (§10.2.4) | {0} ⊆ J; {0} ⊆ Δ[1] | (2) fails for 0 → 1 of J; Δ[1] has only degenerate equivalences | no; yes |
| Headline: minimal models (§10.4) | J over Δ[0] | 0 and 1 homotopic relative ∅, distinct; X₀ = {0}, {0} ⊆ J an equivalence of categories | holds |
| Headline: n-categories and truncation (§10.6.5) | n = −1; N(ℤ/2), Lean n = 0 | contractible mapping spaces ⇔ C ≃ ∅ or Δ[0]; `Hom^R` two points, 0-truncated, a 1-category | holds |
| §3.3.3 constancy hypothesis (source issue) | M = {1, e}, e² = e, X = N(M), S = Δ[0] | homotopy with component e exists; lift into the coslice forces e · 1 = 1 | hypothesis needed |
| §7.7.1 (1) outer horn (R06) | `C[Λ[2,2]]` | `Map(0,1)` = ∅, `Map(0,2)` = {02}; `C[Δ[2]]`: point, Δ[1] | claim true, not owned |
| §2.4.1 gloss (R11) | D of R11 | g(ba) = ha = id₀, (ba)g = bk = id₂; no edge 0 → 2 | clauses differ |
| `IsWeaklyContractible` in §5.3.2, §5.5.2 Lean | K = ∅, Z = ∂Δ[1] | Z → `Fun(∅, Z)` = Δ[0] not a homotopy equivalence | ∅ excluded, as ∅ → Δ[0] requires |
| `rlp_unionProd_boundary_horn_eq_leftFibrations` | `Λ[1, 0]`, m = 0 | `Λ[1,0]` = {0}; `∂Δ[0].unionProd Λ[1,0]` = Δ[0] × {0} ⊆ Δ[0] × Δ[1] | matches README family |

- Source locators: 71 HTT statements located in the author's PDF of 9 April 2017; 27 read in full with hypotheses, pages as cited (the 15 sampled sections included); Kerodon Prop. 4.5.4.8 read.
- Library declarations opened at the pin: Tau Ceti `SimplicialSet/WeaklyContractible.lean` line 99, `Quasicategory/Core.lean` lines 71 and 102, `Quasicategory/RightMappingSpace.lean` line 243; Mathlib `AnodyneExtensions/Inner/PushoutProduct.lean` lines 59–117, `Quasicategory/InnerFibration.lean` line 66, `Category/Cat/Op.lean` line 28, `NerveAdjunction.lean` line 402 (no unit statement for strict Segal sets).
- Cross-roadmap citations resolved: 64 section ids of ModelCategoryTheory (Parts ModelCategories, KanQuillen, SimplicialCategories, EnrichedLocalization) at the head of their pull request, all present; KanQuillen `IsTruncated` has the same body as here.
- Dependency check: `depcheck: 223 roadmaps, 1972 edges, 0 problem(s)`; no change outside the family folder.
- Gate: FAIL (`imports=7`, `build=15`), all other checks 0. Elaboration at the pin stops at the first missing import, so the `#check` signature comparison and the one-tactic probes were not run; R07 and R12 were decided by reading.
- Pull request text: read against the head; no sentence contradicted (pin 2fd255d, 37.3k words, no existing roadmap edited).
- Overlap check: read BordismFormalGroups, EnhancedDerivedSheaves, GeneralizedCohomology (main) and ModelCategories, KanQuillen, SimplicialCategories, EnrichedLocalization (open); categorical equivalences, covariant and contravariant structures, unmarked straightening, mapping-space comparison, Joyal structure: owner BordismFormalGroups §F6.5 (R03); `hC` and Dwyer–Kan equivalences: owner SimplicialCategories §1.2, §5.1.1 (R04); truncated Kan complexes: owner KanQuillen §5.1.1, cited.
- Source independence: 27 passages compared with 1 source (HTT), none shared beyond hypothesis lists (longest run 11 words, HTT line 3285); largest share HTT, 404 of 409 locators; contents compared with HTT: Layers 3–10 follow §2.1.1–§2.3.4 (R05).

## Not verifiable

- Kerodon Def. 4.4.1.4, Thm. 4.4.4.4, Def. 4.5.4.1, Def. 4.5.6.5, Prop. 4.5.6.1: only the title of §4.5.6 and Prop. 4.5.4.8 (tag 01EF) were read; the other tags were not found.
- Ownership against the open pull requests #1807 and #1901, which the description names: their files were not given to this review.
- Elaborated signatures of the 80 declarations: not available at the pin (R01).

## Source issues

- **Error** in HTT at Proposition 2.1.2.11, p. 83: the source says a section with a fiberwise homotopy from s∘p to the identity is left anodyne; it should also require the homotopy to be constant along the section, as its proof uses; affects a stated result.

## For the human reviewers

- **Scope / ownership.** The description asks maintainers to choose between this family, BordismFormalGroups §F6.5 with EnhancedDerivedSheaves (main), and the reorganisation of #1807 as owner of the generic ∞-categorical material (R03 records the fact; the choice is yours).
- **Licence.** HTT was read from the author's page (`math.ias.edu/~lurie/papers/HTT.pdf`, version of 9 April 2017), which the README cites; the published book is Princeton University Press, 2009.
- **Pin.** The description says all files elaborate against Tau Ceti 8b9f13d993; this review could not test that, the repository being pinned to 2fd255d.
