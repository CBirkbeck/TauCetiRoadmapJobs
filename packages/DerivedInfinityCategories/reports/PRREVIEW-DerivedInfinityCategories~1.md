# Review of DerivedInfinityCategories (pull request #2270 at 04df60e)
Folder: `TauCetiRoadmap/InfinityCategoryTheory/DerivedInfinityCategories/`
**Verdict:** needs changes

## R01 (P1) — `Suggested.lean` does not build at the pins

**Location** `TauCetiRoadmap/InfinityCategoryTheory/DerivedInfinityCategories/Suggested.lean` lines 10, 13, 14, 15, 16: `public import TauCeti.AlgebraicTopology.Quasicategory.CategoricalEquivalence` (and `…FullyFaithful`, `…InitialVertex`, `…Limit`, `…SimplicialSet.InternalHom`).
**Claim** Every imported `TauCeti.*` module exists at the pinned Tau Ceti and the targeted build passes.
**Witness** Pin `2fd255d9` of `lake-manifest.json`: `TauCeti/AlgebraicTopology/Quasicategory/` holds only `Cartesian`, `Core`, `FullSubcategory`, `LocallySmall`, `RightMappingSpace`. Gate: `imports=5`, `build=11`, five `bad import` errors.
**Repair** Merge a main whose manifest pins a Tau Ceti commit containing the five modules (the description names `8b9f13d993`), then rerun the gate; until then, remove the declarations that need them and name them in the module docstring as not statable at the pin.

## R02 (P2) — Five objects already owned by EnhancedDerivedSheaves on main

**Location** `README.md` §1.2.2 (line 191), §2.4.1–§2.4.3 (lines 236–258), §6.2.1 (line 579), §6.5.1–§6.5.3 and §6.6.2 (lines 611–636), §6.8.1 (line 670); `## Scope and ownership` (lines 36–46) does not name EnhancedDerivedSheaves.
**Claim** This Part owns the equivalence θ, stability of dg nerves of complexes with the triangulated comparison, the injective model structure, `D(A)` with its homotopy category and localization, and presentability of `D(A)`.
**Witness** Main `TauCetiRoadmap/EnhancedDerivedSheaves/README.md`: line 336 `dgNerve_coherentNerveEquivalence` (HA 1.3.1.17); 348 `dgNerve_shift_cone_comparison`; 538 `replacementDGComparison` (HA 1.3.5.3, 1.3.5.6, 1.3.5.15); 553 `enhancedDerived` (HA 1.3.5.8, 1.3.5.9, 1.3.5.15); 567 `enhancedDerived_isPresentable`.
**Repair** Add to `## Scope and ownership`: "EnhancedDerivedSheaves owns the comparison `θ : N(C_Δ) → N_dg(C)` (E0.6), stability of the dg nerve of a dg category of complexes closed under zero, shifts and cones, with suspension the shift, cofibers the cones and the comparison with Mathlib's triangulation (E0.6), the injective model structure on unbounded complexes of a Grothendieck abelian category (E1.2), and `D(A)` with its homotopy category, its localization at quasi-isomorphisms, its stability and its presentability (E1.3); this Part cites them." Then delete §1.2.2, §2.4.1, §2.4.3, §6.5.2, §6.5.3, §6.6.2 and §6.8.1 as targets and cite E0.6, E1.2, E1.3 in the `*Needs:*` lines that used them; keep §2.4.2 and §6.2.1 only for what main does not state (the explicit `CommShift` isomorphism at 1; left properness and the two small generating classes), each opening with that clause. Drop `isStable_dgNerve_cochainComplex`, `exists_isPushoutSquare_mappingCone`, `isStable_derivedInfty`, `nonempty_homotopyCategory_derivedInfty_equiv` and `exists_isLocalizationAt_quasiIso_derivedInfty` from `Suggested.lean`, or move ownership in a revision of EnhancedDerivedSheaves that this description names.

## R03 (P2) — Contracts list Tau Ceti declarations that the pin does not have

**Location** `README.md` lines 113–121: "At the pinned Tau Ceti: … `CategoryTheory.EnrichedFunctor.mapDGNerve`, `TauCeti.DGFullSubcategory.dgNerveIso` …"; line 42: "Tau Ceti already has … its reduction to a small set of monomorphic quasi-isomorphisms".
**Claim** The eleven names are declarations of the pinned Tau Ceti.
**Witness** No occurrence in `TauCeti/` at `2fd255d9` of `mapDGNerve`, `dgNerveIso`, `isInitialVertex_cochainComplex_of_isZero`, `isTerminalVertex_cochainComplex_of_isZero`, `rightMappingSpaceIsoCochainToSSet`, `rightMappingSpacePiAddEquivHomology`, `ihomObj₀Equiv`, `IsFullyFaithful`, `IsCategoricalEquivalence`, `monoQuasiIsoOfCardinalLT`, `exists_rlp_monoQuasiIsoOfCardinalLT_eq`.
**Repair** With the pin bump of R01 the list stands as written. Without it, move the eleven facts out of `### From Tau Ceti` and state each as a target of the layer that first uses it (§1.1.3, §2.1.1, §2.4.1, §6.2.1), and strike the clause of line 42.

## R04 (P3) — §4.3.1 restates Mathlib's K-projectivity of bounded-above projective complexes

**Location** `README.md` line 408: "**4.3.1.** Prove that for an abelian category A, a complex P of projectives with `P_n = 0` for n sufficiently negative, and a quasi-isomorphism `Q → Q'`, the induced map … is a quasi-isomorphism".
**Claim** The route needs a tower of naive truncations and a Milnor sequence, with ModelCategoryTheory, Part SimplicialCategories §3.1.1 and §3.2.1 as inputs.
**Witness** Pinned `Mathlib/Algebra/Homology/HomotopyCategory/KProjective.lean:114`: `CochainComplex.isKProjective_of_projective (K) (d : ℤ) [K.IsStrictlyLE d] [∀ n, Projective (K.X n)] : K.IsKProjective`.
**Repair** Add `CochainComplex.IsKProjective` and `CochainComplex.isKProjective_of_projective` to `### From Mathlib` and to the K-injective sentence of line 44; replace the route of §4.3.1 by "P is K-projective by `CochainComplex.isKProjective_of_projective`; the cone of `Q → Q'` is acyclic, so every cocycle from P into it is a coboundary", and drop the two SimplicialCategories items from its `*Needs:*`.

## R05 (P3) — §3.4.1: the homotopy inverse omits fibrant replacement

**Location** `README.md` line 310: "The route builds a homotopy inverse from the right adjoint composed with functorial cofibrant replacement".
**Claim** `P ∘ G` carries `W_B` into `W_A`.
**Witness** A right Quillen functor preserves weak equivalences between fibrant objects only; HA line 4432 composes `B^c → B → A → A^c` as fibrant replacement, then G, then cofibrant replacement.
**Repair** "The route builds a homotopy inverse as functorial fibrant replacement in B, then the right adjoint, then functorial cofibrant replacement in A, and checks …".

## R06 (P3) — Supplier contract for ModelCategoryTheory: one wrong section, one missing

**Location** `README.md` line 148: "the Bergner model structure (§5.2, §5.8, HTT, Prop. A.3.2.4, Thm. A.3.2.24)"; line 147 (Part KanQuillen: §3.1, §3.2, §3.4, §5.1–§5.3).
**Claim** Part SimplicialCategories §5.2 states the model structure; the KanQuillen list is what this Part consumes.
**Witness** #2269 head, SimplicialCategories: §5.2 is "Presentability and generators of `Cat_S`", §5.4.2 states HTT Prop. A.3.2.4 (as line 301 of this README cites). Line 498 uses KanQuillen §1.3.3 (Whitehead).
**Repair** Line 148: "(§5.4, §5.8, HTT, Prop. A.3.2.4, Thm. A.3.2.24)". Line 147: add "Whitehead's theorem (§1.3)".

## R07 (P3) — §5.2.3 cites InfinityTopoi §12.2.2 for a statement of §12.2.1

**Location** `README.md` line 501: "Part InfinityTopoi §12.2.2 (Postnikov sections are truncations; HTT, Lemma 6.5.1.2)".
**Claim** §12.2.2 states that Postnikov sections are truncations.
**Witness** `TauCetiRoadmap/InfinityCategoryTheory/InfinityTopoi/README.md` line 2088 (in §12.2.1): "Postnikov sections are truncations"; line 2112, §12.2.2, is the finite-product statement only and itself cites §12.2.1.
**Repair** "Part InfinityTopoi §12.2.1 (Postnikov sections are truncations), §12.2.2 (HTT, Lemma 6.5.1.2)".

## R08 (P3) — "manual" is used as a locator and never defined

**Location** `README.md` lines 246, 258, 338, 568: "(manual, from HA, Prop. 1.3.2.10 and Remark 1.3.2.17 …; no source fixes the signs)".
**Claim** "manual" is standard or defined vocabulary.
**Witness** No definition in `## Conventions` of this README nor in the family index `TauCetiRoadmap/InfinityCategoryTheory/README.md`; Part AdjunctionsAndLocalizations writes "no source; it combines …" for the same thing (its lines 827, 1027).
**Repair** Replace each "manual, from X" by "no source states this; it combines X", and "manual, comparing X with Y" by "no source; it compares X with Y".

## R09 (P3) — Thirteen `Suggested.lean` definitions are not named in the README

**Location** `Suggested.lean` lines 103–176 and 526: `IsLimitDiagram`, `spanCoord₁`, `spanCoord₂`, `cospanCoord₁`, `cospanCoord₂`, `coconeShape`, `coneShape`, `IsPushoutSquare`, `IsPullbackSquare`, `IsZeroObject`, `IsPointed`, `corner`, `IsSubcategoryLocalization`.
**Claim** Every Lean name appears in the README.
**Witness** `grep` of each name in backticks in `README.md`: no hit for the thirteen; line 242 names only `IsStable`, line 632 only `IsReflectiveSubcategory`.
**Repair** Line 242, append: "together with its helpers `IsLimitDiagram`, `spanCoord₁`, `spanCoord₂`, `cospanCoord₁`, `cospanCoord₂`, `coconeShape`, `coneShape`, `IsPushoutSquare`, `IsPullbackSquare`, `IsZeroObject`, `IsPointed` and `corner`, of Parts InfinityCategoryFoundations §1.2 and StableInfinityCategories §1.1". Line 632, append: "and `IsSubcategoryLocalization`".

## R10 (P3) — The description's overlap list leaves out what this Part shares with EnhancedDerivedSheaves

**Location** Pull request description, "**EnhancedDerivedSheaves:** the generic parts of E0.1–E0.8 …, E3.1–E3.3 …, E5 …, E2.7 …, and E2:towers.1 …".
**Claim** The list names every target of EnhancedDerivedSheaves that the family plans again.
**Witness** Head, Part DerivedInfinityCategories §1.2, §2.4, §6.2, §6.5, §6.6, §6.8 against main EnhancedDerivedSheaves lines 336, 348, 538, 553, 567 (R02); E1.2 and E1.3 are not in the list.
**Repair** Add: "and, in Part DerivedInfinityCategories, E0.6's coherent-nerve comparison and stable sign comparison of the dg nerve, E1.2's injective model structure and E1.3's `D(A)` with its homotopy category, localization, stability and presentability".

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §1.2.1 θ (HA Constr. 1.3.1.16, Not. 1.3.1.15, p. 84) | n = 2, I = [2]; n = 3 | one permutation, 1-chain of edge h → g∘f, boundary g∘f − h = (1.1) at m = 1; n = 3: 2 = 2! simplices of the square | agrees | none |
| §1.2.2 (HA Prop. 1.3.1.17, p. 85) | locator | HA line 3253; route through HTT 2.2.2.7, 2.2.2.9, 2.2.2.13 as in HA | agrees | R02 |
| §2.2.1 (HA Prop. 1.3.2.11, pp. 89–90) | 0 → B, B constant ℤ; n = 1 | N_n(B) = 0 for n > 0, surjective; lifting squares force the simplex 0, lift exists | iff holds | none |
| §2.3.1, §2.3.2 (HA Cor. 1.3.2.14, Rem. 1.3.2.15, Cor. 1.3.2.16, pp. 90–91) | f split; f mono with Q injective | Hom(M'_p, Q_q) → Hom(M_p, Q_q) onto in both; hypothesis p < q as HA line 3445 | agrees | none |
| §2.1.1 (HA Rem. 1.3.2.3) | M = ℤ[0], N = ℤ in HA degree 1 | Map = ℤ in degree 1, π_1 = ℤ; Y_{∗+n} = Y[−n] with M[1]_n = M_{n−1} | agrees | none |
| §2.4.1–§2.4.3 stability, cones, signs | f = 3 : ℤ → ℤ | Hom(C, ℤ⟦1⟧) = ℤ/3, Hom(ℤ⟦1⟧, C) = 0, iso of triangles forces 2δ = 0, false in ℤ/3 | sign Check sound | R02 |
| §3.2.1, §3.2.2 (HA Not. 1.3.4.11, Lemmas 1.3.4.10, 12, 13, Prop. 1.3.4.14, pp. 111–113) | X = ∅; Y = Δ[0], n = 0; Y × Z | Hom(∅, t Y) = 1 point, Y_n on the other side; t_[0]Δ[0] = Δ[0]; t(Y × Z) = tY × tZ | README reading correct | none |
| §3.4.1 (HA Lemma 1.3.4.21, pp. 117–118) | route | HA inverse is P ∘ G ∘ Q; README has P ∘ G | statement agrees, route short | R05 |
| §3.5.2 Dwyer–Kan (HA Thm. 1.3.4.20, p. 117) | locator, Constr. 1.3.4.18 cases | Map = Map_A if j = 1, Hom if i = j = 0, ∅ if j = 0 < i | agrees; not statable (docstring) | none |
| §4.1.1, §4.1.2 (HA Def. 1.3.2.4, Not. 1.3.2.6, pp. 88–89) | ℤ/2 over ℤ and over ℤ/4; ℚ | ℤ → ℤ/2 and ℤ/4 → ℤ/2 have no section; ⊕ℤ → ℚ has none | Checks true | none |
| §4.2.1 (HA Def. 1.3.2.7, p. 89) | A = Ab, ℤ/2 | chain maps P → P[1] = ℤ, null-homotopic ones 2ℤ: π_0 = ℤ/2 = Ext¹; 0 without resolution | agrees | none |
| §4.3.1 (HA Lemma 1.3.2.20, p. 92) | pinned Mathlib | `isKProjective_of_projective` at `KProjective.lean:114` gives the content | duplicate route | R04 |
| §4.5.1 construction (∗) (HA p. 93) | k = 0; general k | P_0 ↠ Z_0(A); H_0(P) = Z_0(A)/B_0(A); cofiber has H_k = 0 for k ≥ 0 | agrees | none |
| §4.6.2 (HA Thm. 1.3.4.4, p. 109) | A = 0 | both sides contractible; Lean: `IsBoundedAbove`, W = `QuasiIso` | agrees | none |
| §4.7.1, §4.7.2 (HA Props. 1.3.2.23, 1.3.2.22, pp. 94–97) | steps (1)–(6) | (1)–(3) on p. 95, (4)–(6) on p. 96; zigzag of HA line 3693 | agrees | none |
| §5.1.1, §5.1.2 (HA Lemma 1.3.3.9, p. 102; Prop. 1.3.3.13, pp. 105–106) | A = 0; A = fd vector spaces | right exact 0 → B = initial objects = coproduct-preserving; Ind = Vect = additive presheaves | agrees | none |
| §5.4.1 flagship (HA Thm. 1.3.3.8, p. 101) | A = 0; Checks on Δ[1], Δ[0] | Fun'(pt, C) = C = Fun(pt, C); constant functor at 1 keeps max, loses initial 0 | agrees | none |
| §5.5.1, §5.5.2 (HA Prop. 1.3.3.12, p. 105; Thm. 1.3.3.2, p. 97) | locator, hypotheses | left complete C, right t-exact, projectives to heart, F ↦ τ≤0 ∘ F | agrees; not statable (docstring) | none |
| §5.6.1 (HA Prop. 1.3.3.7, pp. 99–101) | (iii) ⇒ (ii), i = 1, i ≥ 2 | Ext¹(P, Y) = coker(Hom(P, Z) → Hom(P, Z/Y)) = 0; Extⁱ(P, Y) = Extⁱ⁻¹(P, Z/Y) | agrees | none |
| §6.1.1 (HA Def. 1.3.5.1, p. 121) | Ab, Abᵒᵖ, fg Ab | generator ℤ and AB5; cofiltered limits not exact; no countable coproduct | Checks true | none |
| §6.2.1 (HA Prop. 1.3.5.3, pp. 121–123) | hypotheses (1), (2), (3) | pp. 122, 122–123, 123; Lean pushout `IsPushout i f g j`, Mono i, QuasiIso f ⊢ QuasiIso g | agrees | R02, R03 |
| §6.3 (HA Prop. 1.3.5.6, pp. 124–125) | grading | HA M_n = 0 for n ≫ 0 is bounded below in cochain degrees | agrees | none |
| §6.5.2, §6.5.3 (HA Prop. 1.3.5.9; Mathlib comparison) | ℤ/4 complex with d = 2 | acyclic, degreewise injective, tensor with ℤ/2 has nonzero homology: not contractible, not fibrant | agrees | R02 |
| §6.7.2 t-structure (HA Prop. 1.3.5.18) | same ℤ/4 complex | lies in ≥0 and ≤−1 of N_dg(Ch), identity ≠ 0 in hC: orthogonality fails for the naive pair | README's corrected pair sound | none |
| §6.8.3 (HA Prop. 1.3.5.21 (3), p. 129) | HA 1.4.4.13 | (4) "C≤0 accessible" ⇒ (1) at HA line 6038 | agrees; not statable (docstring) | none |
| §6.9.1 (HA Prop. 1.3.5.24, p. 130) | essential image | ⋃_{n ≥ 0} D(A)≥−n; θ by Lemma 1.3.2.20, θ' by definition of L | agrees | none |
| Conventions: signs, shifts, t-structure | n = −p; M = ℤ[0]; ℤ in HA degree 1 | Mathlib δ: d∘z + (−1)^(n+1) z∘d = d∘f − (−1)^p f∘d; M⟦1⟧ in degree −1; H^{−1} ≠ 0 so in `le (−1)`, not `le (−2)` | agree | none |
| `IsStable` (Lean) | corner, edges | corner = (0, 1); cofiber edge Δ[1] × {0}; fiber edge {1} × Δ[1]; cone point ↦ (1, 1) | matches HA Def. 1.1.1.9 | none |

- Source locators checked against the text: every HA §1.3 statement number and page cited in Layers 1–6, read in the cached author's PDF of 18 September 2017 (pp. 80–130, and Prop. 1.4.4.13 on p. 160), the fifteen sampled targets included; the proofs on pp. 113–115 and 120 were read for their page ranges only. Dug01b Cor. 1.2 at arXiv v1 line 39. All agree.
- Library declarations searched at the pins (Tau Ceti `2fd255d9`, Mathlib of the manifest): 35 names; 11 absent (R03), 5 modules absent (R01), `CochainComplex.isKProjective_of_projective` at `Mathlib/Algebra/Homology/HomotopyCategory/KProjective.lean:114`, `DerivedCategory.Minus` at `…/DerivedCategory/TStructure.lean:198`, `QCat` at `Mathlib/AlgebraicTopology/Quasicategory/StrictBicategory.lean:51`.
- Cross-roadmap citations resolved by heading: the section ids of every `From TauCetiRoadmap.*` contract line, in eleven sibling Parts, four ModelCategoryTheory Parts at the head of #2269, and DGAInfinity Layers 0–1 on main; two wrong (R06, R07).
- Dependency check: `depcheck: 223 roadmaps, 1972 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Gate: FAIL (`imports=5`, `build=11`); every other counter 0. Elaboration, the `#check` comparison and the one-tactic probe could not be run (R01); padding was judged by reading: no declaration restates a definition or mirrors a Check.
- Headlines: 9 in the README; stated: Thm. 1.3.3.8, Thm. 1.3.4.4, Prop. 1.3.5.3, Prop. 1.3.5.9, the two homotopy-category comparisons; named as not statable with the missing carrier: Thm. 1.3.3.2, Prop. 1.3.3.7, Thm. 1.3.4.20, Prop. 1.3.5.21, the triangulated comparison.
- Overlap check: read EnrichedLocalization, SimplicialCategories, KanQuillen, ModelCategories (#2269), EnhancedDerivedSheaves (main and #1630), BordismFormalGroups, DerivedModuleAlgebra; θ, the stable sign comparison of the dg nerve, the injective model structure, `D(A)` and its presentability: owner EnhancedDerivedSheaves (R02); nothing else shared.
- Source independence: 30 passages compared with 2 sources, none shared beyond five consecutive words; largest share HA, 429 of 688 locators; contents compared with HA §1.3.1–§1.3.5: independent (§1.3.2 is split over Layers 2 and 4, §1.3.4 over Layers 3 and 4, Layer 3 precedes §1.3.3's material because §4.6.2 needs §3.3.2).

## Not verifiable

- The five imported modules and the eleven names of R03 at Tau Ceti `8b9f13d993`: no checkout of that commit is among the pinned libraries.
- Elaborated signatures of the 53 declarations, and the one-tactic probe: the file does not elaborate at the pin.
- DK80 §7 (J. Pure Appl. Algebra 17): paywalled, not read; it is cited through Part EnrichedLocalization §2.4.
- SAG Prop. C.1.4.1, Def. C.1.4.2 and the HTT locators of the proof routes: outside the sample, not opened.
- Agreement of `Suggested.lean` with public formalisations other than the pinned libraries: not checked.

## Source issues

- **Misprint** in HA at Construction 1.3.1.16, p. 84: the source says the differential of f_I is the alternating sum of composites minus faces; it should be faces minus composites, as in equation (1.1) of Construction 1.3.1.6 and Example 1.3.1.8; affects nothing.
- **Error** in HA at Proposition 1.3.5.18, p. 128: the source says all complexes with homology in nonpositive degrees form the coconnective part of a t-structure on the dg nerve of all complexes; it should be the essential image of D(A)≤0, since an acyclic non-contractible complex violates orthogonality; affects a stated result.
- **Error** in HA at Notation 1.3.4.11, p. 112: the source says maps from any X into the translate correspond to maps from the join of the simplex with X; it should exclude empty and disconnected X, the translate being the coproduct of coslices; affects nothing.
- **Misprint** in HA at the proof of Proposition 1.3.2.10, p. 91: the source says Proposition 1.4.2.27; it should be Corollary 1.4.2.27; affects nothing.
- **Misprint** in HA at Remark 1.3.3.6, p. 98: the source says the step from (ii) to (i) concludes by virtue of (i); it should be by virtue of (ii); affects nothing.

## For the human reviewers

- **Ownership.** The description asks maintainers to choose the owner of material shared with EnhancedDerivedSheaves, BordismFormalGroups §F6.5 and #1807; R02 applies the main-first rule to this folder and would change if ownership moves.
- **Scope.** 429 of 688 locators are to HA §1.3, an author's PDF (version of 18 September 2017) that has no publisher's edition; HTT, the second source, is published.
- **Licence.** HA and SAG are read from the author's page at the Institute for Advanced Study; no licence is stated there.
- **Not tested.** `Suggested.lean` was not elaborated at any commit: the pin lacks five imported modules and the commit the description names is not available to the review.
