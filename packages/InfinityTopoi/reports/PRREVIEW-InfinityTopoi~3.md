# Review of InfinityTopoi (pull request #2270 at a6d7928)
Folder: `TauCetiRoadmap/InfinityCategoryTheory/InfinityTopoi/`
**Verdict:** needs changes

## R01 (P1) — `Suggested.lean` does not build at the pinned Tau Ceti

**Location** `TauCetiRoadmap/InfinityCategoryTheory/InfinityTopoi/Suggested.lean` lines 9–11: "public import TauCeti.AlgebraicTopology.Quasicategory.InitialVertex", "…Quasicategory.Limit", "…Quasicategory.TerminalVertex".
**Claim** The file states its theorems "against the pinned Mathlib and Tau Ceti" (lines 18–19). Previous R01: not repaired.
**Witness** Gate at this head: `imports=3`, `build=7` ("bad import" for the three modules). `lake-manifest.json` pins Tau Ceti `2fd255d`, whose `Quasicategory/` holds only `Cartesian`, `Core`, `FullSubcategory`, `LocallySmall`, `RightMappingSpace`.
**Repair** Delete lines 8–13 (all six Tau Ceti imports) and lines 90–195 (the repeated definitions, Layer 1 and Layer 4: every declaration there reaches `slice.IsLimit` or `IsTerminalVertex`). Delete the docstring's "Repeated definitions" paragraph (it also names `IsColimitDiagram` and `IsPushoutSquare`, which the file no longer declares) and its first two "Stated below" items, and add under "Not statable at the pins": "the codomain fibration (§1.2.1) and left exactness at an object (§4.1.1): Tau Ceti has no limits of quasicategories and no final vertices at the pin." In `README.md` delete the "`Suggested.lean` declaration" sentences of §1.2.1 and §4.1.1. The Layer 7 and Layer 13 statements need only `import Mathlib`: a scratch copy of them elaborates at the pins with `sorry` as the only warning.

## R02 (P1) — the Tau Ceti supplier contract cites six declarations absent at the pin

**Location** `README.md` lines 214–225: "`SSet.slice.IsLimit`, `SSet.coslice.IsColimit` (`AlgebraicTopology/Quasicategory/Limit.lean`), `SSet.IsTerminalVertex`, `SSet.IsInitialVertex` … `SSet.catInfty` (`Quasicategory/CatInfty.lean`) … `SSet.ihomOver` (`AlgebraicTopology/SimplicialSet/InternalHom.lean`)".
**Claim** Tau Ceti supplies these. Previous R02: not repaired.
**Witness** None of the six names, and none of `Limit.lean`, `TerminalVertex.lean`, `InitialVertex.lean`, `CatInfty.lean`, `InternalHom.lean`, exists in Tau Ceti `2fd255d`. `README.md` uses them at lines 83–84, 128, 359, 460, 1869, 1957, 2019, 2028, 2056, 2074, 3040, 3111, 3449, 3522.
**Repair** Replace the three bullets by the family's owners: Part InfinityCategoryFoundations §1.2.4 (limit and colimit diagrams, final and initial objects), Part Straightening for `Cat∞`, and a README target with its signature in §11.3 for the simplicial set of maps over a base. Change Conventions 1 and 7 and the *Needs:* and Dependencies lines at the places listed to match.

## R03 (P2) — `grpGrpEquivCommGrp` is a `def` whose body is `sorry`

**Location** `Suggested.lean` lines 226–230: "noncomputable def grpGrpEquivCommGrp (A : Type u) [Category.{v} A] [HasFiniteProducts A] : letI : CartesianMonoidalCategory A := .ofHasFiniteProducts … Grp (Grp A) ≌ CommGrp A := by sorry".
**Claim** The file has no sorry'd data.
**Witness** Gate: `sorry-data=1` (line 226), `statement-hygiene=2` (`letI` in the signature, lines 227–228).
**Repair** Replace it by a theorem with instance binders (elaborated on a scratch copy at the pins, `sorry` the only warning):
`theorem nonempty_grpGrpEquivCommGrp (A : Type u) [Category.{v} A] [CartesianMonoidalCategory A] [BraidedCategory A] : Nonempty (Grp (Grp A) ≌ CommGrp A) := by sorry`
In `README.md` §13.3.1 (line 2388) name `nonempty_grpGrpEquivCommGrp` and say that it states the existence of the equivalence for a Cartesian monoidal braided `A`; the compatibility with the forgetful functors to Grp(A) stays a README statement.

## R04 (P2) — `isLeftExact_iff_isLeftExactAt` drops the finite-limits hypothesis

**Location** `Suggested.lean` lines 189–193: "theorem isLeftExact_iff_isLeftExactAt {X Y : SSet.{u}} (f : X ⟶ Y) : IsLeftExact f ↔ ((∀ z …, X.IsTerminalVertex z → Y.IsTerminalVertex (f.app _ z)) ∧ ∀ z …, IsLeftExactAt f z)".
**Claim** The equivalence holds for every map of simplicial sets; `README.md` §4.1.1 (line 811) states it "between ∞-categories with finite limits".
**Witness** Nerves of the posets {p < a, p < b} and {p′ < q < a′, b′}, with f(p) = p′. X has no final vertex, f preserves pullback squares, and the product cone p goes to p′ ≠ q.
**Repair** When the pin carries the modules of R01, state it as
`theorem isLeftExact_iff_isLeftExactAt {X Y : SSet.{u}} [X.Quasicategory] [Y.Quasicategory] (hX : ∀ (K : SSet.{u}) [Finite K.N] (p : K ⟶ X), ∃ q : join Δ[0] K ⟶ X, join.inr _ _ ≫ q = p ∧ IsLimitDiagram q) (f : X ⟶ Y) : …`
(HTT, Cor. 4.4.2.5 assumes finite limits in the source). On the witness, `hX` fails at K = ∅. Not elaborated: R01. At the present pin R01 removes the theorem.

## R05 (P2) — sheaves of spaces on a site have a second owner on main

**Location** `README.md` §8.2.1, line 1520: "Define, for a small ∞-category C with a Grothendieck topology, a presheaf F to be a **sheaf** when it is S-local"; Scope and ownership (lines 43–70) names no roadmap for it.
**Claim** This Part is the only owner of `Shv(C)`. Previous R03: not repaired (`EnhancedDerivedSheaves` occurs nowhere in the README).
**Witness** On main, `TauCetiRoadmap/EnhancedDerivedSheaves/README.md` line 2377 (§E2.7, `spaceSheaves`): sheaves of spaces on a small site are the accessible localization of presheaves of spaces at the covering-sieve inclusions.
**Repair** Add to Scope and ownership: "Sheaves of spaces on a small site are `spaceSheaves` of EnhancedDerivedSheaves §E2.7; §8.2.1 is the same localization for a topology on a small ∞-category, and on the nerve of a small site it is that object. This Part adds what §E2.7 does not state: left exactness and the topological-localization property (§8.3), the classification of §8.4 and the universal property of §9.1." Add EnhancedDerivedSheaves §E2.7 to the *Needs:* of §8.2.1.

## R06 (P2) — the covering topology of a frame is also defined by GrothendieckTopoi

**Location** `README.md` Scope, line 64: "The covering topology of a locale is defined in §18.3 for this Part's own use"; §18.3.1, line 3163: "The **covering topology** on N(U), for a locale U, is the Grothendieck topology on the category U …".
**Claim** The topology is this Part's to define, and the 1-categorical theory is left to unnamed "other roadmaps". Previous R04: not repaired (`GrothendieckTopoi` occurs nowhere in the README).
**Witness** Pull request #1520 (it adds a new roadmap folder, so it may be cited), `TauCetiRoadmap/GrothendieckTopoi/README.md` §7.1, line 1194: "Define `Frame.grothendieckTopology L` (Convention 8): a sieve `S` on `U` covers when `U` is the supremum …".
**Repair** In §18.3.1 cite GrothendieckTopoi §7.1 for the topology on the category U and keep only its transport to N(U) through §8.1.1; drop the two Checks that repeat §7.1's (the frame-law Check and the comparison with `Opens.grothendieckTopology`). In Scope, replace the sentence at line 64 and name GrothendieckTopoi (Layers 1, 4 and 7) as the roadmap that the classical Giraud theorem, subtopoi and localic 1-topoi are left to.

## R07 (P3) — the coproduct step of §4.3.1 cites §1.6.1 for what §1.6.2 proves

**Location** `README.md` lines 949–952: "So it suffices that coproduct inclusions are good, and that is §1.6.1 applied in `P(C)` and in 𝒳, with F preserving initial objects. … by §3.3.1 and §3.5. *Needs:* the representables step; §1.6.1, §3.3.2, §3.5.1".
**Claim** Goodness of coproduct inclusions follows from §1.6.1 (HTT, Lemma 6.1.3.6: an object mapping to an initial object is initial).
**Witness** HTT lines 26328–26329 (p. 581): the step follows from Lemma 6.1.5.1, the pullback squares of coproduct inclusions, which is §1.6.2 here. Universality in `P(C)` is §3.3.2, not §3.3.1.
**Repair** "…and that is §1.6.2 applied in `P(C)` and in 𝒳, with F preserving initial objects. `P(C)` has universal colimits and disjoint coproducts by §3.3.2 and §3.5.1. *Needs:* the representables step; §1.6.2, §3.3.2, §3.5.1; …".

## R08 (P3) — pullback functors are defined without pullbacks

**Location** `README.md` §1.1.1, lines 309–312: "For an ∞-category 𝒳 … For f : U → V in 𝒳, the restriction of p along f is a correspondence over Δ[1] … Define a **pullback functor** along f as any functor `f^* : 𝒳^{/V} → 𝒳^{/U}` associated (Part AdjunctionsAndLocalizations §1.1) to that correspondence".
**Claim** Every morphism of every ∞-category has a pullback functor in this sense.
**Witness** Part AdjunctionsAndLocalizations §1.1.2 defines associated functors for Cartesian fibrations over Δ[1]. In the nerve of {a, b < c}, b → c has no pullback along a → c, so the restriction is not Cartesian (§1.2.1).
**Repair** "**1.1.1.** For an ∞-category 𝒳 with pullbacks, let `p : O_𝒳 → 𝒳` be the codomain fibration of Conventions 3; its restriction along any f : U → V is a Cartesian fibration over Δ[1] (§1.2.1, HTT, Lemma 6.1.1.1) …", with §1.2.1 added to the *Needs:* line. In the *Needs:* of §1.2.1 replace "§1.1.1 (HTT, §6.1.1: `O_𝒳`)" by "Conventions 3 (`O_𝒳`)", and in the layer's Dependencies write "1.1 uses 1.2" in place of "1.2 uses 1.1", so that no cycle arises.

## Verified sound

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| §4.4.1 Giraud (HTT line 24717) | Δ[0]; N(Set); N(Ab); ∅ | Δ[0] = `P(∅)`: all three. Set: ℤ/2 groupoid has colimit ∗, Čech nerve constant. Ab: kernel of `ℤ⊕ℤ → ℤ` is ℤ, against `0 ⊔ 0`. ∅: not presentable | three predicates agree | none |
| §7.7.1 (HTT line 24947); `effectiveEpi_iff_surjective`, `isEffectiveEquivalenceRelation_of_isEquivalenceRelation` | `∅ → ∗`; `∅ → ∅`; `p₁ = p₂ : X × 2 → X` | `∅ → ∗`: neither side. Identity: both. Last pair is not jointly monic, excluded by `JointlyMono₂` (`CategoryTheory/EquivalenceRelation.lean:42`) | true; `simp`, `infer_instance`, `exact?` do not close either | none |
| §7.7.2 (HTT line 33594) | `∅ → ∗`; `∗ → S¹`; `∗ → ∗ ⊔ ∗` | Čech colimits ∅, Bℤ ≃ S¹, ∗; π₀-surjective: no, yes, no | agree | none |
| §8.1.1, §8.1.2 (HTT lines 26982, 27011, 27066) | Δ[0]; Δ[1] at vertex 1 | Δ[0]: 2 sieves, 2 topologies. Δ[1]: sieves ∅, {0 → 1}, maximal = 3; subobjects of `j(1)`: (∅, ∅), (∗, ∅), (∗, ∗) = 3 | bijection 3 ↔ 3 | none |
| §10.4.1 (HTT line 28766) | U = 1; U = ∂Δ[1] in S; U = ∅ | U = 1: `π^*` an equivalence. ∂Δ[1]: `π_!(A, B) = A ⊔ B`, `π^*K = (K, K)`, `π_*(A, B) = A × B`. ∅: slice Δ[0], `π_*` picks a final object | holds | none |
| §10.6.1 (HTT line 31885) | S; S × S; Δ[0] | left exact colimit-preserving functors to S: identity only; the two projections; none (`S → Δ[0]` has no left exact left adjoint) | 1, 2, 0 points; enough points in each | none |
| §11.1.1 (HTT lines 28165, 28185, 28209) | empty product; pullback over Δ[0] | Δ[0]: the one functor `X → Δ[0]` is left exact and colimit-preserving, so Δ[0] is final in `LTop`; `X ×_{Δ[0]} Y = X × Y` | consistent with §10.3 Checks | none |
| §12.1.1, §12.1.2 (HTT lines 30667, 30820) | n = 0; `∗ → S¹`; `∅ → ∗` | `U^{S⁰} = U × U`. `∗ → S¹`: effective, π₀ has fiber ℤ: 0- not 1-connective. `∅ → ∗`: not 0-connective | indices as HTT | none |
| §12.4.1, §12.4.2 (HTT lines 30785, 30811) | `∗ → S¹`, n = 0; `S² → τ≤2 S²`; n = −2 | `π_k = ∗` for k > 0, π₀ = ℤ ≠ ∗ and the map is not a monomorphism. π₂ = ℤ on both sides. n = −2: equivalence | holds | none |
| §13.5.1, §15.1.1 (HTT line 33760) | S¹; `∗ → ∗ ⊔ ∗`; (∗, S¹) in S × S | S¹ ↦ nerve of ℤ. Non-connected point: Čech nerve constant at ∗, equal to that of `id_∗`. Pair: first term (∗, ℤ) | connectedness needed in (1) | none |
| §13.6.1–§13.6.3 (HTT line 33648) | S¹; ℤ; S²; ∗ ⊔ ∗ | S¹ ∈ `EM_1`, ΩS¹ = ℤ ∈ `EM_0`; S² in none (π₃ = ℤ); ∗ ⊔ ∗ in `EM_0` only | matches the homotopy-group description | none |
| §14.6.1 (HTT line 30982) | `f : S¹ → ∗`, `s : ∗ → S¹`, n = 0, 1, 2 | n = 1: f 1-connective, s 0-connective. n = 2: f not (π₁ = ℤ), s not 1-connective (fiber ℤ). n = 0: both sides true | shift by one correct | none |
| §17.5.1 (HTT lines 30395, 30403) | N(Set), n = 1; Δ[1], n = 0 | Set: injections local, coproducts disjoint, equivalence relations effective. Δ[1]: `1 ⊔ 1 = 1`, pullback 1 ≠ 0; `∅ → 1` is (−1)- not (−2)-truncated | n ≥ 1 needed, as stated | none |
| §18.2.1 (HTT line 29987) | Δ[1]; subspaces of ℝ²; ordinals with a top | Δ[1]: frame. Lines a, b, c: `a ∧ (b ∨ c) = a`, `(a ∧ b) ∨ (a ∧ c) = 0`. Ordinals: successor ordinals are κ-compact, a proper class | essential smallness needed, as stated | none |
| §19.1.1 (HTT line 30068) | constant groupoid on S¹; N(Set), n = 1 | diagonal of S¹ has fibers ℤ: 2- not 1-efficient, S¹ not 0-truncated. Set: kernel pairs inject into `U₀ × U₀` | holds with finite limits | none |
| §19.3.1 (HTT line 29853) | n = 0, X = Δ[1]; n = ∞ | localizations of Δ[1]: identity, and `Δ[1] → Δ[0]` generated by the monomorphism `∅ → ∗`. n = ∞ excluded by the statement | holds | none |
| §5.3.1 Rezk | S; N(Set) | S: core of κ-compact spaces classifies. Set: slices over the coequalizer of `∗ ⇉ ∗` glue to sets with an automorphism ≠ Set: class of all maps not local | holds | none |
| §8.3.1, §8.4.1 | Δ[0], ∅ covering; trivial topology | `F†(∗)` = value at the empty sieve = ∗; trivial: `F† ≃ F`. Topologies 2 ↔ localizations S, Δ[0] | holds | R05 (ownership only) |
| §9.1.1, §10.5.1 | C = Δ[0]; X = S × S | left exact `Δ[0] → X` = final objects, contractible; into S × S only `K ↦ (K, K)` | holds | none |
| §14.1.1, §14.7.1 | `∗ → S¹`; `∅ → ∗`; n = −2, −1; shifted indices | τ≤0: `id_∗` (epi); `∅ → ∗` (not). n = −2: all maps, equivalences. Shift: `∂Δ[1] → Δ[0]` against itself has no lift | indices right | none |
| §15.2.1, §13.3.1 | n = 0, 1, 2; S₃; 𝒳 = Δ[0] | pointed sets; groups (BS₃ has non-abelian π₁); abelian groups. S₃ carries no second compatible group structure | holds | R03 (Lean form only) |
| §17.2.1, §17.3.1 | n = 0; n = ∞; (n, k) = (1, 0), (2, 1), (2, 0) | n = 0: equivalences, all five hold. (1, 0): injections of sets local. (2, 1): `V ↦ Fun(V, Set)` on 1-groupoids preserves limits. (2, 0): all maps of Set, not local | bound k ≥ n − 1 sharp | none |
| §18.3.2, §19.4.1 | Δ[1]; n = 0; N(Set), n = 1; S | Δ[1] = `P≤−1(Δ[0])`. n = 0: 0-efficient groupoids constant. Set = `P≤0(Δ[0])`, all six. S: `Map(∗, K(ℤ, n))` not (n − 1)-truncated | six conditions agree | R06 (ownership only) |
| §20.2.1 | (m, n) = (0, ∞), Y = Δ[1]; S/S¹ | X = S: `Fun_*(Z, S)` and `Fun_*(τ≤−1 Z, Δ[1])` contractible. S/S¹: points S¹, underlying locale a point | S 0-localic, S/S¹ not | none |
| `isCartesian_evalAt_iff_isPullbackSquare`, `cartesianFibration_evalAt_iff` | ∅; Δ[0]; nerve of {a, b < c} | corners: (0,0) = f(0) cone point; cospan (1,0), (0,1), (1,1) = g(1). ∅, Δ[0]: both sides true. Last: no pullback of a → c ← b, no Cartesian lift | true by reading; not elaborated | R01 |
| `isLeftExact_iff_isLeftExactAt` | {p < a, p < b} → {p′ < q < a′, b′} | right side true (no final vertex, minima preserved); left side false (p′ is not `a′ × b′ = q`) | false without finite limits | R04 |
| `grpGrpEquivCommGrp` | scratch elaboration of the theorem form | `Nonempty (Grp (Grp A) ≌ CommGrp A)` with `[CartesianMonoidalCategory A] [BraidedCategory A]` elaborates; `exact?`, `infer_instance` do not close it | statable as a theorem | R03 |
| §4.3.1, coproduct step | HTT lines 26318–26329 | the source deduces it from Lemma 6.1.5.1 with F preserving initial objects | §1.6.2, not §1.6.1 | R07 |
| §1.1.1 pullback functors | nerve of {a, b < c}, f : a → c | b → c has no pullback along f: restriction of p is not a Cartesian fibration, no associated functor | hypothesis missing | R08 |

- Previous findings: R01, R02, R03, R04 not repaired (R01, R02, R05, R06 here). R05 (docstring and empty sections), R06 (unused definitions), R07 (names in §1.2.1), R08 (`NOTES.md` deleted), R09 (§4.2.2 locator and *Needs:*), R10 (§14.5.2) repaired.
- Source locators checked against the text: 39 in HTT (number, PDF page, hypotheses); all agree except the internal reference of R07.
- Library declarations opened at the pins: Mathlib `IsEquivalenceRelation` (`CategoryTheory/EquivalenceRelation.lean:98`), `IsEffectiveEquivalenceRelation` (same file, 268), `epi_iff_surjective` (`CategoryTheory/Types/Basic.lean:351`), `isRegularEpi_iff_effectiveEpi` (`Limits/Shapes/RegularMono.lean:519`), `Grp.instCartesianMonoidalCategory` (`Monoidal/Grp.lean:522`), `QCat.bicategory` (`Quasicategory/StrictBicategory.lean:66`) and 20 further names of the contract, all found. Tau Ceti: `CartesianFibration` (`Quasicategory/Cartesian.lean:110`), `evalAt` (`SimplicialSet/WeaklyContractible.lean:75`), `fullEnhancedSubcategory` (`Quasicategory/FullSubcategory.lean:53`), `rlp_monomorphisms_iff` (`SimplicialSet/TrivialFibration.lean:171`), `KanComplex.π` (`KanComplex/HomotopyGroup.lean:55`) found; 6 absent (R02).
- Duplication: Mathlib has no `Grp (Grp C) ≌ CommGrp C` (`Monoidal/Mon.lean:35` lists the monoid form as open; `Monoidal/Cartesian/Grp.lean:299` gives only that a commutative group object is one in `Grp C`), no `EffectiveEpi ↔ Surjective` in `Type u`, no Cartesian monoidal instance on `CommGrp`.
- Cross-roadmap citations: 224 distinct section or target ids of the sibling Parts and of ModelCategoryTheory (head of #2269) resolve to a heading or label; 61 opened and compared with what is cited of them (among them Part KanQuillen §3.4.1, which states left and right properness, and Part LimitsAndKanExtensions §7.4.6, §7.4.7, §9.3.4).
- Dependency check: `depcheck: 261 roadmaps, 2595 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the family folder. No supplier gap is declared.
- Gate: FAIL (`sorry-data=1`, `imports=3`, `statement-hygiene=2`, `build=7`); every other check 0. `Suggested.lean` itself could not be elaborated (R01). A scratch copy of the three Mathlib-only statements elaborates at the pins; `#check` gives `effectiveEpi_iff_surjective` with `Function.Surjective ⇑(ConcreteCategory.hom f)`, as §7.7.1 states it; the one-tactic probe closes none.
- Overlap check: read KanQuillen, EnrichedLocalization, SimplicialCategories, GrothendieckTopoi, QuasicoherentSheavesOnPrestacks, EnhancedDerivedSheaves, BordismFormalGroups, StableHomotopyKTheory; sheaves of spaces on a site: EnhancedDerivedSheaves §E2.7 (R05); the covering topology of a frame: GrothendieckTopoi §7.1 (R06); `K(A, n)` for Kan complexes: Part KanQuillen §5.4.1, cited; QuasicoherentSheavesOnPrestacks cites eleven targets of this Part, all present; nothing else shared.
- Source independence: 44 passages compared with 1 source (HTT), and every run of nine or more words shared with it listed mechanically (61 runs), none beyond forced statements (longest 19 words, the conditions of Thm. 6.4.1.5 at `README.md` line 3363; next 14); largest share HTT, 1052 of 1065 locators; contents compared with HTT §6.1–§6.5.1 and §7.2: independent (Layer 7 on §6.2.3 precedes Layer 8 on §6.2.2; Layers 12–15 on §6.5.1 and §7.2 precede Layers 16–20 on §6.4, forced by §17.3.1 needing §14.8.1; Layer 18 on §6.4.2 follows Layer 17 on §6.4.4). SAG and Kerodon were not opened.
- Research link: the headline targets are the foundations of ∞-topos theory of Lurie, *Higher Topos Theory* (2009), chapters 6 and 7 (Giraud's theorem, Rezk's object classifiers, sheaves, n-topoi), which Lurie, *Spectral Algebraic Geometry* (2018) builds on; it rests on the README's references and on HTT §6.1 as read.

## Not verifiable

- `Suggested.lean` as a whole, and the repair of R04: three Tau Ceti imports do not exist at the pin, so no elaboration, no elaborated signatures and no probe of the Layer 1 and Layer 4 declarations.
- The description's statement that the file elaborates against Tau Ceti `8b9f13d993`: that commit is not the pin.
- SAG, Def. 1.3.1.1 and Def. 1.5.4.1; Kerodon, Thm. 3.2.6.1, Variant 3.2.5.5, Thm. 3.2.7.1, Cor. 3.5.2.7, Def. 3.5.7.20, Def. 6.2.1.1; SGA 4, exposé IV, 1.2: outside the sample and not in the sources cache; not opened.

## Source issues

- **Misprint** in HTT at Prop. 6.3.2.2, PDF pp. 621–622: the source says the test functor goes from Z to X and that X is shown to be an ∞-topos; it should be the pullback X′ in both places; affects nothing.
- **Misprint** in HTT at Prop. 6.4.1.6 (proof), PDF pp. 658–659: the source says the localization starts from the n-truncated presheaves, an (n + 1)-category; it should be the (n − 1)-truncated presheaves, an n-category; affects nothing.
- **Gap** in HTT at Prop. 6.4.4.7, PDF p. 670: the source says the (n − 2)-truncated morphisms of the n-truncation of an ∞-topos are local; the proof of Thm. 6.4.1.5 needs the (n − 1)-truncation; affects the proof.
- **Gap** in HTT at Prop. 6.4.4.9 (proof), PDF pp. 670–671: the source says disjointness follows from Thm. 6.4.4.5; it should use Lemma 6.1.3.7, since that theorem assumes disjoint coproducts; affects the proof.
- **Gap** in HTT at Lemma 7.2.2.10, PDF p. 744: the source says the statement holds for an arbitrary ∞-category; it should be an ∞-category with finite products, which pointed objects and the proof use; affects a stated result.
- **Gap** in HTT at Prop. 6.4.3.4, PDF p. 663: the source says the equivalence holds for an arbitrary ∞-category; it should assume finite limits, which n-efficiency and the diagonal criterion use; affects a stated result.

## For the human reviewers

- **Scope.** The description asks the maintainers to choose the owner of the generic ∞-categorical material against BordismFormalGroups §F6.5, EnhancedDerivedSheaves (§E2.7 for this Part) and pull request #1807; R05 assumes main's owner until that is decided.
- **Pin.** The description says the file elaborates against Tau Ceti `8b9f13d993`; `lake-manifest.json` at this head pins `2fd255d`. Whether to bump the pin or trim the file (R01, R02) is a maintainers' choice.
- **Licence.** HTT was read from the author's page (`math.ias.edu/~lurie/papers/HTT.pdf`), an author-page copy; 1052 of the README's 1065 locators point into it.
- **Not tested.** SAG, Kerodon and SGA 4 (13 locators together) were not read; the wording and contents comparison covers HTT only.
