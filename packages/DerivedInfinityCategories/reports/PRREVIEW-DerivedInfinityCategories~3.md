# Review of DerivedInfinityCategories (pull request #2270 at a6d7928)
Folder: `TauCetiRoadmap/InfinityCategoryTheory/DerivedInfinityCategories/`
**Verdict:** needs changes

## R01 (P1) — `Suggested.lean` still does not build at the pins

**Location** `TauCetiRoadmap/InfinityCategoryTheory/DerivedInfinityCategories/Suggested.lean` lines 10, 13, 14, 15, 16: `public import TauCeti.AlgebraicTopology.Quasicategory.CategoricalEquivalence` (and `…FullyFaithful`, `…InitialVertex`, `…Limit`, `…SimplicialSet.InternalHom`).
**Claim** Every imported `TauCeti.*` module exists at the pinned Tau Ceti and the targeted build passes.
**Witness** `lake-manifest.json` at this head pins Tau Ceti `2fd255d9`; its `TauCeti/AlgebraicTopology/Quasicategory/` holds only `Cartesian`, `Core`, `FullSubcategory`, `LocallySmall`, `RightMappingSpace`. Gate: `imports=5`, `build=11`.
**Repair** Merge a main whose manifest pins a Tau Ceti commit containing the five modules, then rerun the gate; until then, remove the declarations that need them (`IsColimitDiagram` through `IsStable`, the three `isStable_*`, `exists_isPushoutSquare_mappingCone`, `IsLocalizationAt` and its two theorems, `simplexOp` through `preservesFiniteCoproducts_iff_restrict`, `IsSubcategoryLocalization`, `IsReflectiveSubcategory`, `isReflectiveSubcategory_isInjectivelyFibrant`) and name them in the module docstring as not statable at the pin.

## R02 (P2) — Five objects already owned by EnhancedDerivedSheaves on main

**Location** `README.md` §1.2.2, §2.4.1–§2.4.3, §6.2.1, §6.5.1–§6.5.3, §6.6.2, §6.8.1; `## Scope and ownership` (lines 35–45) does not name EnhancedDerivedSheaves (0 occurrences in the file).
**Claim** This Part owns the equivalence θ, stability of dg nerves of complexes with the triangulated comparison, the injective model structure, `D(A)` with its homotopy category and localization, and presentability of `D(A)`.
**Witness** Main `TauCetiRoadmap/EnhancedDerivedSheaves/README.md`: line 336 `dgNerve_coherentNerveEquivalence`; 348 `dgNerve_shift_cone_comparison`; 538 `replacementDGComparison`; 553–555 `enhancedDerived`, `enhancedDerived.homotopyCategory`, `enhancedDerived.isStable`; 567 `enhancedDerived_isPresentable`.
**Repair** Add to `## Scope and ownership`: "EnhancedDerivedSheaves owns the comparison `θ : N(C_Δ) → N_dg(C)` (E0.6), stability of the dg nerve of a dg category of complexes closed under zero, shifts and cones, with suspension the shift, cofibers the cones and the comparison with Mathlib's triangulation (E0.6), the injective model structure on unbounded complexes of a Grothendieck abelian category (E1.2), and `D(A)` with its homotopy category, its localization at quasi-isomorphisms, its stability and its presentability (E1.3); this Part cites them." Delete §1.2.2, §2.4.1, §2.4.3, §6.5.2, §6.5.3, §6.6.2 and §6.8.1 as targets and cite E0.6, E1.2, E1.3 in the `*Needs:*` lines that used them; keep §2.4.2 and §6.2.1 only for what main does not state (the explicit `CommShift` isomorphism at 1; left properness and the two small generating classes), each opening with that clause. Drop `isStable_dgNerve_cochainComplex`, `exists_isPushoutSquare_mappingCone`, `isStable_derivedInfty`, `nonempty_homotopyCategory_derivedInfty_equiv` and `exists_isLocalizationAt_quasiIso_derivedInfty` from `Suggested.lean`. The alternative is a revision of EnhancedDerivedSheaves that moves ownership here, named in the description.

## R03 (P2) — Contracts list Tau Ceti declarations that the pin does not have

**Location** `README.md` lines 118–128: "At the pinned Tau Ceti: … `CategoryTheory.EnrichedFunctor.mapDGNerve`, `TauCeti.DGFullSubcategory.dgNerveIso` … colimit cocones `SSet.coslice.IsColimit` …"; line 41: "its reduction to a small set of monomorphic quasi-isomorphisms".
**Claim** The names of `### From Tau Ceti` are declarations of the pinned Tau Ceti.
**Witness** No declaration at `2fd255d9` of `mapDGNerve`, `dgNerveIso`, `isInitialVertex_cochainComplex_of_isZero`, `isTerminalVertex_cochainComplex_of_isZero`, `rightMappingSpaceIsoCochainToSSet`, `rightMappingSpacePiAddEquivHomology`, `ihomObj₀Equiv`, `IsFullyFaithful`, `IsCategoricalEquivalence`, `monoQuasiIsoOfCardinalLT`, `exists_rlp_monoQuasiIsoOfCardinalLT_eq`, `coslice.IsColimit`, `dgNerve.isEquivalence_edgeMk_iff`.
**Repair** With the pin bump of R01 the list stands if that commit has all thirteen. Without it, move the thirteen facts out of `### From Tau Ceti` and state each as a target of the layer that first uses it (§1.1.3, §2.1.1, §2.4.1, §4.6.1, §5.4.1, §6.2.1, §6.5.1), and strike the clause of line 41.

## R04 (P3) — Five `Suggested.lean` definitions are not named in the README

**Location** `README.md` lines 249–251: "together with its helpers `IsLimitDiagram`, `coneShape`, `IsPushoutSquare`, `IsPullbackSquare`, `IsZeroObject`, `IsPointed` and `corner`"; `Suggested.lean` lines 115, 122, 129, 136, 144.
**Claim** Every Lean name appears in the README.
**Witness** Backticked occurrences in `README.md` at this head: `spanCoord₁` 0, `spanCoord₂` 0, `cospanCoord₁` 0, `cospanCoord₂` 0, `coconeShape` 0.
**Repair** Line 250, replace "`IsLimitDiagram`, `coneShape`," by "`IsLimitDiagram`, `spanCoord₁`, `spanCoord₂`, `cospanCoord₁`, `cospanCoord₂`, `coconeShape`, `coneShape`,".

## R05 (P3) — The contract cites a section of Part CartesianFibrations that does not exist

**Location** `README.md` line 140: "functor ∞-categories are ∞-categories (§3.4, HTT, Prop. 1.2.7.3)".
**Claim** Part CartesianFibrations §3.4 states that functor ∞-categories are ∞-categories.
**Witness** `TauCetiRoadmap/InfinityCategoryTheory/CartesianFibrations/README.md` has §3.1–§3.3 only; line 621, §3.3.1, is invariance of `Fun(K, C)` under categorical equivalence (Prop. 1.2.7.3 (2), (3)); line 43 gives (1) to Mathlib's instance `Quasicategory ((ihom K).obj C)`.
**Repair** Replace the clause by "functor ∞-categories are invariant under categorical equivalence in each variable (§3.3, HTT, Prop. 1.2.7.3 (2), (3))", and add to `### From Mathlib`, quasicategories bullet: "the instance `Quasicategory ((ihom K).obj C)` (HTT, Prop. 1.2.7.3 (1))".

## R06 (P3) — "Manual" in a docstring

**Location** `Suggested.lean` lines 457–458: "(Manual, comparing HA, Def. 1.3.5.1 with Mathlib's definition.)"
**Claim** The docstring states the source of the statement in defined terms.
**Witness** "Manual" is defined nowhere in the folder; `README.md` line 587 writes the same provenance as "(no source states this; comparing HA, Def. 1.3.5.1 with Mathlib's definition)".
**Repair** Replace by "(No source states this; it compares HA, Def. 1.3.5.1 with Mathlib's definition.)".

## R07 (P3) — The K-projective contract is listed twice

**Location** `README.md` lines 96–97: "K-projective complexes: `CochainComplex.IsKProjective` and `CochainComplex.isKProjective_of_projective`, a bounded-above complex of projectives being K-projective"; line 101: "and K-projective complexes `CochainComplex.IsKProjective` with `CochainComplex.isKProjective_of_projective`, that a complex …".
**Claim** Each consumed declaration is listed once.
**Witness** Both bullets of `### From Mathlib` name the same two declarations of `Algebra/Homology/HomotopyCategory/KProjective.lean` (lines 42 and 114 at the pin).
**Repair** Delete lines 96–97.

## Previous findings

- R01 — not repaired: the manifest pins Tau Ceti `2fd255d9`; lines 10, 13–16 import five modules absent there (R01).
- R02 — not repaired: `## Scope and ownership` does not name EnhancedDerivedSheaves; the targets stand (R02).
- R03 — not repaired: "At the pinned Tau Ceti: …" lists the eleven names, and two more (R03).
- R04 — repaired: §4.5.2 "HA identifies the homotopy categories only; the compatibility with shifts and triangles … rests on §2.4.3"; `*Needs:*` now has "§2.4.2 …, §2.4.3 …, §4.4.1", §6.5.3 likewise with §6.5.2.
- R05 — repaired: "marked simplicial sets `TauCeti.MarkedSSet` (`TauCeti/AlgebraicTopology/SimplicialSet/Marked/Basic.lean` …)", the K-projective bullet (twice, R07), "Whitehead's theorem (§1.3)".
- R06 — partly repaired: line 250 names seven helpers and line 652 `IsSubcategoryLocalization`; five names remain (R04).
- R07 — repaired: the folder holds `README.md` and `Suggested.lean` only; gate `stray-files=0`.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §1.2.1, §1.2.2 (HA Constr. 1.3.1.16, Prop. 1.3.1.17, pp. 84–85) | n = 2, I = [2]; n = 3 | HA eq. (1.1), m = 1: `d f = −(h − g∘f) = g∘f − h`, as the Check; n = 3: 2 permutations, 2 nondegenerate 2-simplices of the square | agrees with (1.1) | R02 (owner) |
| §2.2.1 (HA Prop. 1.3.2.11, pp. 89–90) | `0 → const ℤ`; `X = Y = 0` | `N_n = 0` for n > 0, surjective; a map of discrete simplicial sets is a Kan fibration though not onto `π_0` | both sides true; Lean elaborates at the pin, `simp` leaves the goal | none |
| §2.3.1, §2.3.2 (HA Cor. 1.3.2.14, Rem. 1.3.2.15, Cor. 1.3.2.16, p. 90) | `f : 0 → M'`; `f = 2 : ℤ → ℤ`, `Q = ℤ` | split case: `Hom(M'_p, Q_q) → 0` onto; `2 : Hom(ℤ, ℤ) → Hom(ℤ, ℤ)` not onto, and neither (a) nor (b) holds | hypotheses as HA | none |
| §2.4.2, §2.4.3 sign | `f = 3 : ℤ → ℤ`; two cones of `id_ℤ` glued | `Hom(C, ℤ⟦1⟧) = ℤ/3`, `Hom(ℤ⟦1⟧, C) = 0`, so an isomorphism forces `2δ = 0`: false; `a₁ − a₂ ↦ +1` or `−1` by orientation | sign pinned; Mathlib third map is `(−fst).rightShift 1 0` | R02 (owner) |
| §3.5.1–§3.5.3 (HA Constr. 1.3.4.18, Lemma 1.3.4.19, Thm. 1.3.4.20, Lemma 1.3.4.21, pp. 116–118) | maps `(1, B) → (0, A)`; A bifibrant | empty in HA and README; HA inverse `P ∘ G ∘ Q`, README the same order; identity edge `(0, A) → (1, A)` is a weak equivalence, so coCartesian | agrees | none |
| §4.3.1 (HA Lemma 1.3.2.20, p. 92) | `P = ℤ[0]`, `Q = (ℤ →2 ℤ)`, `Q' = ℤ/2[0]`; `P = ℤ/2[0]` | `H_0 Map = ℤ/2` on both sides; for `ℤ/2`: `Hom(ℤ/2, Q) = 0` against `ℤ/2` | projectivity needed and present | none |
| §4.4.1 (HA Cor. 1.3.2.18, p. 92; Lemma 1.1.3.3, p. 30) | cone of `f : M → M'`, bounds N, N' | `C(f)^n = M'^n ⊕ M^{n+1}`: projective, zero for `n > max(N, N')`; subcategory nonempty (0) | closure holds | none |
| §5.2.1–§5.2.3 (HA Props. 1.3.3.14, 1.3.3.16, Rem. 1.3.3.15, pp. 106–107) | A = f.g. abelian groups | `A_proj` = f.g. free; product-preserving presheaves = abelian groups = `Ind(A)`; HA's 1.3.3.14 omits "small", README adds it | agrees | none |
| §5.4.1 (HA Thm. 1.3.3.8, pp. 101, 107) | `C = ∅`; A the zero category; Checks | both functor categories empty; both `≃ C`; `Δ[1]` constant at 1: `max` kept, initial 0 lost; `{0} ⇉ {0,1}` equalizer empty | statement and Checks hold | R01 (cannot elaborate) |
| §5.5.1–§5.5.3 (HA Prop. 1.3.3.12, Thm. 1.3.3.2, Rem. 1.3.3.6, pp. 97–99, 105) | `C = D⁻(A)`, `F = id` | F right t-exact, projectives to the heart; `τ_{≤0} ∘ F` on the heart is `id_A`, exact; (i)–(iii) all hold | hypotheses equal HA's | none |
| §5.6.1 (HA Prop. 1.3.3.7, pp. 99–101) | `C = D⁻(A)` | (ii): `Ext^i(P, Y) = 0`, i > 0, by §4.3.2; image `⋃ C_{≥−n}` = everything, right bounded | agrees | none |
| §4.6.2 (HA Thm. 1.3.4.4, p. 109) | Lean `W` | `QuasiIso` of the underlying chain map of an edge of the nerve of `IsBoundedAbove` complexes; both sides in `QCat.{max u v}` | as README | R01 (cannot elaborate) |
| §6.1.1 Lean | `Abᵒᵖ`; f.g. abelian groups | monos not stable under filtered colimits, and not AB5; no countable coproduct, so neither side | both directions consistent; `simp` no progress; no Mathlib instance `IsGrothendieckAbelian → IsLocallyPresentable` | none |
| §6.2.1 (HA Prop. 1.3.5.3, pp. 121–123) | Lean left properness | `IsPushout i f g j`, `Mono i`, `QuasiIso f ⊢ QuasiIso g`: g is the cobase change of f along i | orientation right; elaborates at the pin | R02 (owner) |
| §6.4.1 (HA Lemmas 1.3.5.11, 1.3.5.12, Prop. 1.3.5.14, pp. 126–127) | `ℤ/4` complex, `d = 2` | acyclic, degreewise injective; `2h + 2h = 4h = 0 ≠ 1`, identity not null-homotopic, so `Map(M, M)` not acyclic and M not fibrant | consistent | none |
| §6.5.1–§6.5.3 (HA Def. 1.3.5.8, Prop. 1.3.5.9, pp. 125–126) | `ℤ/2`, `ℤ[1]` in Ab | fibrant replacement `ℚ → ℚ/ℤ`: `π_0 = Ext¹(ℤ/2, ℤ) = ℤ/2`; undeformed: 0 | agrees; Lean states the equivalence HA states, docstring names the triangulated part as not statable | R02 (owner) |
| §6.6.1, §6.6.2 (HA Props. 1.3.5.13, 1.3.5.15, p. 127) | HA proof | trivial cofibration `M → Q` is a `D(A)`-localization; `N(A°)[W⁻¹] → D(A)` via Props. 1.3.5.14, 1.3.4.5 and Rem. 1.3.4.16 | route as README | R02 (owner) |
| §6.7.2 (HA Prop. 1.3.5.18, pp. 128–129) | `ℤ/4` complex | lies in `≥0` and `≤−1` of `N_dg(Ch(A))` with nonzero identity; not K-injective, so outside the image of `D(A)_{≤−1}` | README's coconnective part is the one HA's proof uses | none |
| §6.8.1–§6.8.3 (HA Prop. 1.3.5.21, p. 129) | hypotheses of the inputs | HA Prop. 1.4.4.13 needs C presentable (§6.8.1, in `*Needs:*`); dual of Prop. 1.2.1.19 needs countable coproducts and `C_{≤0}` closed under them (in the route) | covered | R02 (§6.8.1 owner) |
| §6.9.1 (HA Prop. 1.3.5.24, p. 130) | hypothesis; M in `D(A)_{≥−n}` | "Grothendieck with enough projectives" in both; resolution of the subcomplex `⋯ → M_{1−n} → ker d → 0` is a quasi-isomorphism | agrees | none |
| Conventions | ℤ in HA degree 1 | cochain degree −1; in Mathlib `le (−1)`, not `le (−2)`; `M⟦1⟧^k = M^{k+1}`; `δ z = d∘z + (−1)^{n+1} z∘d`, n = −p gives HA's | agree | none |
| R03 names | pin `2fd255d9` | `coslice.IsColimit`: "Unknown identifier" on elaboration; `isEquivalence_edgeMk_iff` only in `Quasicategory/Core.lean:353`, for nerves | absent | R03 |
| R05 citation | sibling headings | CartesianFibrations: `### 3.1`, `### 3.2`, `### 3.3` | no §3.4 | R05 |

- Source locators checked against the text: the pages of the 98 statement labels of HA §1.3 that the README cites or that surround them, and the statements and hypotheses of the 47 that the fifteen sampled sections cite, in the author's PDF of 18 September 2017; all agree. The README flags no locator as unverified.
- Library declarations opened at the pins: 34, among them `CochainComplex.rlp_monomorphisms_inf_quasiIso_iff_of_isZero` (`TauCeti/Algebra/Homology/ModelCategory/Injective.lean:162`), `TauCeti.HasKInjectiveResolutions` (`…/DerivedCategory/KInjective.lean:92`, instance for `ModuleCat` only), `DerivedCategory.Minus` (`Mathlib/Algebra/Homology/DerivedCategory/TStructure.lean:198`), `ModelCategory (CochainComplex.Plus C)` (`Mathlib/Algebra/Homology/ModelCategory/Injective.lean:205`).
- Cross-roadmap citations resolved: 112 section ids in the twelve sibling Parts at this head and in the four Parts of ModelCategoryTheory at their open head; one does not resolve (R05). DGAInfinity Layers 0 and 1 exist on main.
- Restated definitions compared with the owners' `Suggested.lean`: `IsStable`, `IsPushoutSquare`, `corner`, `IsLocalizationAt`, `IsSubcategoryLocalization`, `IsReflectiveSubcategory`, `IsColimitDiagram`, `simplexOp`: bodies equal up to the universe name; namespaces differ.
- Dependency check: `depcheck: 261 roadmaps, 2595 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Gate: FAIL (`imports=5`, `build=11`); every other counter 0. A scratch copy of the 25 declarations that need no missing module elaborates at the pin with `sorry` the only warning (`coslice.IsColimit` and `slice.IsLimit` are unknown there, so `IsColimitDiagram`, `IsLimitDiagram` and all that use them do not); `#check @name` on each of the 25: every `[EnoughProjectives A]`, `[IsGrothendieckAbelian A]`, `[HasDerivedCategory A]` and `[Linear R A]` binder is present. One-tactic probes (`infer_instance` on five, `simp` on two): none closes.
- Pull request text: 21.1k words, "adds only the new family folder" (no file changed outside it), the suppliers and the pin paragraph agree with this head.
- Overlap check: read EnhancedDerivedSheaves (main), StableHomotopyKTheory, BordismFormalGroups, and SimplicialCategories, EnrichedLocalization, KanQuillen, ModelCategories at their open head; θ, the stable sign comparison, the injective model structure, `D(A)` with its homotopy category, localization, stability and presentability: owner EnhancedDerivedSheaves (R02); nothing shared with the others.
- Source independence: 12 passages compared with 1 source, none shared beyond the forced wording of a statement; largest share HA, 448 of 724 locators; contents compared with HA §1.3.1–§1.3.5: independent (HA §1.3.4 is Layer 3, before Layers 4–5; §1.3.2 is split between Layers 2 and 4; Thm. 1.3.4.4 and Prop. 1.3.4.6 sit in Layer 4, an order §4.6.2's `*Needs:*` §3.3.2 forces).
- Research link: Layers 4–6 are the derived ∞-categories `D⁻(A)` and `D(A)` of Lurie, *Higher Algebra* (2017), §1.3, with the Dwyer–Kan localization theorem (Dwyer–Kan 1980) and Dugger's presentation theorem (2001) as inputs; Lurie's *Spectral Algebraic Geometry* (2018), App. C, uses `D(A)_{≥0}`. Rests on the README's References and HA.

## Not verifiable

- `Suggested.lean` as a whole, the signatures of its other 28 declarations and their one-tactic probes: the file does not elaborate at the pin (R01).
- The thirteen names of R03 at Tau Ceti `8b9f13d993`: that commit is not among the pinned libraries.
- HTT, SAG, Dug01b and DK80 locators: outside the sample, not opened this round.

## Source issues

- **Misprint** in HA at Construction 1.3.1.16, p. 84: the source says the differential of `f_I` is the signed sum of composites minus faces, with the subsets indexed upward; it should be faces minus composites as in equation (1.1) of Construction 1.3.1.6; affects nothing.
- **Misprint** in HA at Proposition 1.3.5.18, p. 128: the source says the coconnective part is the dg nerve of A itself in degrees at most 0; it should be the essential image of `D(A)_{≤0}`, which its proof uses; affects a stated result.
- **Misprint** in HA at Lemma 1.3.2.20, proof, p. 92: the source says the chain of isomorphisms ends in the mapping complex into the second target; it should end in its i-th homology; affects nothing.

## For the human reviewers

- **Ownership.** The description asks maintainers to choose the owner of material shared with EnhancedDerivedSheaves, BordismFormalGroups §F6.5 and #1807; R02 applies the main-first rule and would change if ownership moves. It is raised for the third time.
- **Scope.** 448 of 724 locators are to HA §1.3, an author's PDF (version of 18 September 2017) with no publisher's edition; HTT, the second source, is published.
- **Licence.** HA and SAG are read from the author's page at the Institute for Advanced Study; no licence is stated there.
- **Not tested.** `Suggested.lean` was elaborated only in part (25 of 53 declarations, on a scratch copy): the pin lacks five imported modules.
