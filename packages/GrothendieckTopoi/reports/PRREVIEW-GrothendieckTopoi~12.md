# Review of GrothendieckTopoi (pull request #1520 at add5242)

**Verdict:** needs changes

A full review: the folder changed by 490 lines since 1da6eb2 (new targets 5.6 and 6.5, a new Layer 9 on abelian sheaves, 145 new Lean lines). The previous review's one finding is repaired. Four findings remain, two of them blocking: the space-level clauses of Layer 9 restate objects Tau Ceti already has at the pin, and the higher-degree half of 9.4 is statable at the pins although the module docstring says it is not.

## Previous findings

- **r10 R01 (P3), Stone 1948 locator.** Repaired. `TauCetiRoadmap/GrothendieckTopoi/README.md` line 1259 now reads "(Stone 1948, Theorem 3, p. 980)", and the reference entry at lines 1474–1476 names Theorem 3 (p. 980) and the statement. Both agree with stone1948 lines 117 and 140–148 as read in r10.

## R01 (P2) — Layer 9's space-level clauses restate Tau Ceti's native supported-sections and local cohomology sheaves without citing them

**Location.** `TauCetiRoadmap/GrothendieckTopoi/README.md` lines 1338–1340 (9.3: "For a space `X`, a closed `Z` with complement `U` and `V` open, prove that the sections of `i_*i^!F` over `V` are the sections of `F` over `V` whose support lies in `Z`"), lines 1356–1362 (9.4, the local cohomology sheaves, with the `ℝ` Check at lines 1373–1375), the boundary paragraph at lines 66–78 ("Sections with support in a closed subset of a topological space, the sheaf `H_Z(F)`, local cohomology groups and sheaves … are SchemeAndStackFoundations §2.7"), and line 207 ("**From Tau Ceti.** Nothing is consumed: Tau Ceti has no topos-level declaration").

**Claim.** The README attributes the space case of sections with support and local cohomology sheaves to SchemeAndStackFoundations §2.7 and names, from Tau Ceti, only the extension-by-zero instance. At the pinned Tau Ceti (2fd255d9) these objects are native, for sheaves of abelian groups on a topological space:

- `CategoryTheory.Sheaf.supportedSections F S W` (`TauCeti/Topology/Sheaves/SupportedCohomology.lean` line 120), the sections over `W` supported in the closed `S`;
- `CategoryTheory.Sheaf.supportedSectionsSheaf F S` and its monomorphism `supportedSectionsι` into `F` (`TauCeti/Topology/Sheaves/LocalCohomology/Basic.lean` lines 176–223), with the factorization `supportedSectionsLift` for maps into `F` that vanish off `S`;
- `CategoryTheory.Sheaf.supportedSectionsFunctor S` (same file, line 336), the left exact functor `Γ_S`;
- `CategoryTheory.Sheaf.supportedHSheaf F S n` (line 275), the local cohomology sheaf `𝓗_S^n(F)`, with `supportedHSheafZeroIso : 𝓗_S^0(F) ≅ Γ_S(F)` (line 281), `isZero_stalk_supportedHSheaf_of_notMem` (line 303) and the flasque vanishing (line 313);
- module versions in `TauCeti/Topology/Sheaves/SupportedCohomology/Sections.lean` and `LocalCohomology/Module.lean`.

So the clause of 9.3 quoted above is, on `Opens X`, the identification of `(supportFunctor (Opens.grothendieckTopology X) U).obj F` with `F.supportedSectionsSheaf Uᶜ`, and the local cohomology sheaves of 9.4 on a space are `F.supportedHSheaf Uᶜ n`. Neither is cited; the supplier contract says Tau Ceti supplies nothing, and the boundary paragraph points to a roadmap for what the library already holds. The site-level `supportFunctor` of 9.3 and its derived functors on a general site are new and stay here.

**Witness.** The file and line numbers above, at the pin. Both comparison statements elaborate against the pin (`lake env lean` on a scratch copy of `Suggested.lean` importing `TauCeti.Topology.Sheaves.LocalCohomology.Basic`, exit 0, `sorry` the only warning):

```lean
theorem probe_compare_sections {X : TopCat.{u}} (U : Opens X)
    (F : Sheaf (Opens.grothendieckTopology X) AddCommGrpCat.{u}) :
    Nonempty ((supportFunctor (Opens.grothendieckTopology X) U).obj F ≅
      F.supportedSectionsSheaf ⟨(U : Set X)ᶜ, U.isOpen.isClosed_compl⟩) := sorry
theorem probe_compare_localCohomology {X : TopCat.{u}} (U : Opens X)
    (F : Sheaf (Opens.grothendieckTopology X) AddCommGrpCat.{u}) (n : ℕ) :
    Nonempty (((supportFunctor (Opens.grothendieckTopology X) U).rightDerived n).obj F ≅
      F.supportedHSheaf ⟨(U : Set X)ᶜ, U.isOpen.isClosed_compl⟩ n) := sorry
```

**Repair.** (1) In `## Exact supplier contracts`, replace "Nothing is consumed" by a `From Tau Ceti` list naming `CategoryTheory.Sheaf.supportedSections`, `supportedSectionsSheaf`, `supportedSectionsι`, `supportedSectionsFunctor` and `supportedHSheaf` with their files, and `TauCeti.CategoryTheory.SheafExtensionByZero.preservesFiniteLimits_sheafPullback` (an `instance`, `TauCeti/CategoryTheory/Sites/ExtensionByZero.lean` line 315). (2) In the boundary paragraph, say that on a space the sections with support and the local cohomology sheaves are these Tau Ceti objects, and that SchemeAndStackFoundations §2.7 owns their `O_X`-module and derived-category versions (`supportedSubsheaf`, `localCohomologySheaf`, `rHZ_adjunction`). (3) State the space clause of 9.3 as the comparison `(supportFunctor (Opens.grothendieckTopology X) U).obj F ≅ F.supportedSectionsSheaf Uᶜ`, compatible with the two inclusions into `F`, and add to 9.4 the comparison `((supportFunctor (Opens.grothendieckTopology X) U).rightDerived n).obj F ≅ F.supportedHSheaf Uᶜ n` (both exist for every `n` on a space: `𝓗_S^n` is the sheafification of `Ext^n(ℤ_{W, W∖S}, −)`, which is the derived functor of `Γ_S(W, −)`, and injective sheaves are flasque), so that the `ℝ` Check of 9.4 reads as a value of `supportedHSheaf`. The *Needs:* lines of 9.3 and 9.4 then list these names.

## R02 (P2) — 9.4 in degrees `q + 1 ≥ 2` is statable at the pins; the docstring's reason is wrong

**Location.** `TauCetiRoadmap/GrothendieckTopoi/Suggested.lean` lines 80–82: "9.4 in degrees `q + 1 ≥ 2`: it lacks an `Additive` instance for `j_*`, `Functor.sheafPushforwardCocontinuous` on abelian sheaves (a right Kan extension), which `Functor.rightDerived` needs; the degree-one form is stated." README lines 1359–1362 state the target: for `q ≥ 1` the `(q + 1)`-th local cohomology sheaf of `F` is the `q`-th right derived functor of `j_*` applied to `j^*F`.

**Claim.** Additivity of `j_*` is available at the pin: `j_*` is a right adjoint (`Functor.sheafAdjunctionCocontinuous`), so `Adjunction.rightAdjoint_preservesLimits` (`Mathlib/CategoryTheory/Adjunction/Limits.lean` line 197) makes it preserve binary products, and `Functor.additive_of_preserves_binary_products` (`Mathlib/CategoryTheory/Preadditive/AdditiveFunctor.lean` line 229) gives `Additive` from that between preadditive categories with binary products. `Sheaf (J.over c) AddCommGrpCat.{u}` is Grothendieck abelian at the pin, so it has injective resolutions. The second half of 9.4 is therefore a statable headline that is absent.

**Witness.** This declaration elaborates on a scratch copy of the file at the pins (exit 0, `sorry` the only warning on it):

```lean
theorem probe_9_4_higher
    (hc : Mono (terminal.from ((presheafToSheaf J (Type u)).obj (yoneda.obj c))))
    (F : Sheaf J AddCommGrpCat.{u}) (q : ℕ) :
    letI : PreservesLimitsOfSize.{u, u}
        ((Over.forget c).sheafPushforwardCocontinuous AddCommGrpCat.{u} (J.over c) J) :=
      ((Over.forget c).sheafAdjunctionCocontinuous AddCommGrpCat.{u} (J.over c) J).rightAdjoint_preservesLimits
    letI : ((Over.forget c).sheafPushforwardCocontinuous AddCommGrpCat.{u} (J.over c) J).Additive :=
      Functor.additive_of_preserves_binary_products _
    Nonempty (((supportFunctor J c).rightDerived (q + 2)).obj F ≅
      (((Over.forget c).sheafPushforwardCocontinuous AddCommGrpCat.{u} (J.over c) J).rightDerived
        (q + 1)).obj ((J.overPullback AddCommGrpCat.{u} c).obj F)) := sorry
```

**Repair.** In `Suggested.lean`, add an `instance` of additivity for `(Over.forget c).sheafPushforwardCocontinuous AddCommGrpCat.{u} (J.over c) J` with the body above (a real body, no `sorry`), state the theorem `nonempty_rightDerived_succ_iso_rightDerived_pushforward` with hypothesis `hc` and conclusion as in the probe (indexing `q + 2` against `q + 1` keeps the natural-number offset exact), name it in 9.4 of the README with its locator (Kashiwara–Schapira 1990, Chapter II, the long exact sequence of derived functors), and delete the "9.4 in degrees `q + 1 ≥ 2`" item of the not-statable list.

## R03 (P3) — The 5.6 route names the wrong topos for the adjoint functor theorem

**Location.** `TauCetiRoadmap/GrothendieckTopoi/README.md` lines 844–847: "then Mathlib's `isRightAdjoint_of_preservesLimits_of_isCoseparating` applies, the objects `(ihom G).obj Ω` for `G` in a `u`-small separating family (1.4) forming a coseparating family … `E` is well-powered by 1.2."

**Claim.** For `f : E → F` the functor to which the theorem is applied is `f.inverse : F ⥤ E`. Mathlib's lemma (`Mathlib/CategoryTheory/Adjunction/AdjointFunctorTheorems.lean` lines 105–109) takes `G : D ⥤ C` with `[HasLimitsOfSize D] [WellPowered D]` and a coseparating `ObjectProperty D`: the hypotheses are on the domain `D = F`, not on `E`. The separating family, the objects `(ihom G).obj Ω` and the well-poweredness all live in `F`.

**Witness.** The lemma's binders quoted above: `D` is the domain of `G`, and `G := f.inverse` has domain `F`.

**Repair.** Read "for `G` in a `u`-small separating family of `F` (1.4) … `F` is well-powered by 1.2". Nothing else changes: both topoi satisfy 1.2, so only the letter is wrong.

## R04 (P3) — "Research context" poses as unsettled a question with a negative answer

**Location.** `TauCetiRoadmap/GrothendieckTopoi/README.md` lines 1425–1432, the section `## Research context`: "Whether the converse holds, that is, whether every Grothendieck topos with both properties is a presheaf topos, is not settled in the sources cited here".

**Claim.** The converse is false, and the heading is not one of the README shape's. Witness: `Sh(L)` for `L = [0, 1]` with its order, a complete chain, hence a frame. `Sh(L)` is an essential subtopos of the presheaf topos `Sh(LowerSet L)` (presheaves on the poset `L`): the frame surjection `LowerSet L → L`, `D ↦ ⨆ D`, preserves arbitrary meets (a down-set of a chain is `[0, x)` or `[0, x]`, and the supremum of an intersection of such sets is the infimum of their suprema), so it has a left adjoint, which is the extra left adjoint `i_!`. For an adjoint triple `i_! ⊣ i^* ⊣ i_*` with `i_*` fully faithful, `i_!` is fully faithful, so `i^* i_! ≅ 𝟭`; products, coproducts and epimorphisms of `Sh(L)` are then `i^*` of those of the presheaf topos, where (A) and (B) hold (6.5), and `i^*` preserves all of them. So `Sh(L)` satisfies (A) and (B). It is not a presheaf topos: the subterminals of `Cᵒᵖ ⥤ Type u` form the frame of sieves on `C`, a `LowerSet` frame, in which every element is a join of completely join-prime elements, while in `[0, 1]` every `x > 0` is `⨆ {y | y < x}` and no element but `0` is completely join-prime. Consistently with Roos's theorem, `Sh(L)` has no essential point: its points are the completely prime filters `(x, 1]`, and `y ↦ (x < y)` does not preserve the meet of `x + 1/n`. The class is that of the essential subtopoi of presheaf topoi (lucyshyn-wright2012 lines 167–169, Theorem 1.5.5, arXiv:1108.4032).

**Repair.** Delete the section, or replace it by one sentence under `## Downstream consumers` or at the end of 6.5: the converse fails (`Sh([0, 1])` as above), and the topoi with (A) and (B) are the essential subtopoi of presheaf topoi (Lucyshyn-Wright 2012, Theorem 1.5.5), which TotallyDistributiveTopoi develops; that roadmap is a consumer of 5.2, 5.6, 6.5 and 7.1, never a supplier.

## Verified sound

**Gate, build, direction.** I ran the gate myself at add5242 with `--build` and the merge order: every check is 0, `build=0`, result OK, the same as the worker's gate. `lake env lean TauCetiRoadmap/GrothendieckTopoi/Suggested.lean` from the worktree at the pins (Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`, `lake-manifest.json` lines 10 and 22): exit 0, 37 `declaration uses sorry` warnings, nothing else. The dependency check with `--movable`:

```
depcheck: 240 roadmaps, 2427 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. GrothendieckTopoi is line 397 of the merge order; its roadmap suppliers (AdicSpacesPartII, SchemeAndStackFoundations, EtaleCohomologyFoundations, EnhancedDerivedSheaves) are on main (eaf17b1, an ancestor of the head). The three-dot diff outside the folder is empty.

**Principles.** No route-specific shortcut, no re-planned roadmap, no copied passage, no algorithm, no sorry'd data (`restrictionUnit` is an `abbrev` with a real body; `supportFunctor` and its `Additive` instance are proved), no `set_option`. Layer 9 is site-level and new; its scheme, module and derived-category specializations are left to EtaleCohomologyFoundations §0.7 (`TauCetiRoadmap/EtaleCohomologyFoundations/README.md` lines 439–443, `ClassicalAlgebraic.supportLocalization`), SchemeAndStackFoundations §2.7 (`TauCetiRoadmap/SchemeAndStackFoundations/README.md` lines 3482–3497) and EnhancedDerivedSheaves E1.1 (line 510), as the boundary paragraph says; the only missing owner is the library itself (R01).

**Headline theorems and the Lean file.** The 37 sorried declarations are the 27 of r10 plus ten new ones: `isEssential_iff_preservesProducts`, `exists_equiv_presheaf_iff_essential_points`, `epi_piMap_presheaf`, `isIso_sigma_pi_presheaf`, `preservesFiniteLimits_sheafPullback_overForget`, `faithful_sheafPullback_overForget`, `recollement_extensionByZero`, `bijective_comp_kernelι_of_isZero`, `nonempty_cokernel_iso_rightDerived_one`, `isZero_of_projective_sheaf_real`. One-tactic probe on a scratch copy (`first | infer_instance | rfl | simp` in place of each `sorry`): all ten fail (`simp made no progress` or unsolved goals at probe lines 690, 697, 704, 710, 716, 720, 729, 735, 741, 764), so none is padding. The elaborated types in `scratch/signatures.md` were compared with the README statements: the 17 "looks dropped" leads are the universe-name artefacts of r10 (`[inst : Category.{u_1, u_1 + 1} E]` is the section's `[Category.{u} E]`); the new declarations carry every binder their README statement needs (`hE`, `hF`, `hc` where the README assumes them, and no `hc` on `bijective_comp_kernelι_of_isZero`, where the README assumes none). Every headline of the README is either stated or named in the docstring, except the one of R02. `exists_equiv_presheaf_iff_essential_points` names points as `GeometricMorphism (Type u) E`, whose `inverse : E ⥤ Type u` matches Convention 3.

**Library declarations opened at the pin.** `Functor.sheafPullback` as `(sheafPushforwardContinuous).leftAdjoint` (`Mathlib/CategoryTheory/Sites/Pullback.lean` line 56); `GrothendieckTopology.overPullback` as an `abbrev` for `(Over.forget X).sheafPushforwardContinuous` (`Sites/Over.lean` line 270), so Convention 9's `j^*` is the right adjoint of the `j_!` it names; `Functor.rightDerived` (`Abelian/RightDerived.lean` line 106, needs `[F.Additive]`); `IsGrothendieckAbelian.enoughInjectives` (`Abelian/GrothendieckCategory/EnoughInjectives.lean` line 381); `isRightAdjoint_of_preservesLimits_of_isCoseparating` (`Adjunction/AdjointFunctorTheorems.lean` line 105, R03); `preservesLimits_of_preservesEqualizers_and_products` (`Limits/Constructions/LimitsOfProductsAndEqualizers.lean` line 203, the "products give all limits" step of 5.6); `stalkSkyscraperSheafAdjunction` (`Topology/Sheaves/Skyscraper.lean` line 405); `HasEnoughPoints (J.over X)` instance (`Sites/Point/Over.lean` line 87, consumed by 6.2); `TauCeti.CategoryTheory.SheafExtensionByZero.preservesFiniteLimits_sheafPullback` (`TauCeti/CategoryTheory/Sites/ExtensionByZero.lean` line 315, an `instance` on a preorder site, as the boundary paragraph says); `TauCeti.CategoryTheory.Sheaf.projective_composeAndSheafify_free_obj` (`TauCeti/CategoryTheory/Sites/Projective.lean` line 99, which makes the `ℤ[ℓ {o}]` of the 9.5 Check projective). `IsLocallyConnectedSite` and `PowerObject` are absent at the pin, as the README says.

**Citations.** The 19 leads of `scratch/citations.md` are the 18 of r10 plus `GeometricMorphism.IsEssential`-family names: this roadmap's own names (all declared, `readme-ids-missing=0`), the generated Mathlib instance name (resolved in r9), `IsLocallyConnectedSite` (Mathlib's open work, Scope), and the AdicSpacesPartII `Topos.*` names, re-resolved on main at eaf17b1 (`TauCetiRoadmap/AdicSpacesPartII/README.md` lines 8005–8031). `scratch/overlaps.md`: no other open pull request changes this roadmap, no cited id is dropped, no cited id is defined only by an open revision.

**Ownership against open work.** `roadmaps grep` over the 472 open pull requests and main, one fixed term per run: "recollement" (only the étale ones: EtaleDualityAndPerverseSheaves #1040 §2.2 on triangulated categories, LefschetzPencils #873, ClassicalAdicEtaleCohomology #875); "essential point", "essential geometric" (only TotallyDistributiveTopoi #1927, which cites GrothendieckTopoi 5.2, 5.6, 6.5 and 7.1 as its supplier, `TauCetiRoadmap/TotallyDistributiveTopoi/README.md` lines 44–50 and 111–115, so it is a consumer, consistent with it being absent from the merge order); "local cohomology sheaf" (none); "Karoubi" (K-theory and Temperley–Lieb uses only); "core-compact" (none). HigherToposTheory #1901 restates Giraud (its L10.1), as reported in r10; it remains that roadmap's repair. No second owner of 5.6, 6.5 or Layer 9 among roadmaps.

**Sources.** Read at the locator: hofmann-lawson1978 lines 521–523 (Definition 4.1: core-compact as "every `p ∈ U` has an open `V ∋ p` inside `U` such that every open cover of `U` has finitely many members covering `V`", which is `V ≪ U` in `Opens X`, matching 8.3); isbell1981 lines 53–54 (Theorem 1, quasi-locally compact `X` times any space `Y` is spatial) and 62–63 (Theorem 2), matching 8.5; lucyshyn-wright2012 lines 165–169 (R04). Stone 1948 and Bannister 2024 as in r10.

**Adversarial pass.** One row per sampled target, per new target and per headline a finding touches; the unchanged targets 1.1–4.5, 7.1–7.3, 8.1, 8.4, 8.5 keep the rows of r6–r10 (last row).

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 2.1 existence criterion (iff) | `Φ = (S ↦ S × S)` and `S ↦ Bool × S` on `Type u`; degenerate `E` | `(PUnit ⊕ PUnit)²` has 4 elements, `PUnit² ⊕ PUnit²` has 2, so colimits fail; `Bool × ⊤ = Bool ≠ ⊤`, so finite limits fail; the degenerate topos has the global sections morphism and its inverse image preserves everything | holds | none |
| 2.2 2-cells, direction | Sierpiński points `o, c`; `B G` | `F(X) → F({o})` is `c^* → o^*`, a 2-cell `o → c` under Convention 4 and none back (`F(X) = ∅`, `F({o}) = PUnit`); endomorphisms of the forgetful functor of `B G` are `G` by Yoneda, not `|G|²` | holds | none |
| 5.2 locally connected | `Discrete (Fin 2)`; `ℚ` | `π₀(A, B) = A ⊕ B`; components of `ℚ` are points, not open, so no `π₀` | holds | none |
| 5.3 local | `Sh(ℝ)`; Sierpiński | `∐ₙ ℓ((n − 1, n + 1)) → ⊤` is epi; a global section picks one `n` on connected `ℝ`, impossible, so `Γ` does not preserve epis and is no left adjoint; Sierpiński: `X` is the only open neighbourhood of `c` | holds | none |
| 5.4 hyperconnected / localic | `B G`; Sierpiński; `Sh(X)` | sub-`G`-sets of trivial ones trivial, `G` acting on itself not a subquotient of a trivial set; `ℓ {o} = (∅ → PUnit)` is a subobject of `⊤ = (PUnit → PUnit)` and not constant; every sheaf is a quotient of `∐ ℓ Uᵢ ⊆ ∐ ⊤` | holds | none |
| 5.5 factorization | degenerate topos; `Sh(X)` | degenerate `→ Type u`: localic (its object is the inverse image of anything), not connected (inverse image not faithful); `Sh(X)`: identity then global sections | holds | none |
| 5.6 essential iff preserves `u`-small products | étale of `Bool` in `Type u`; `Sh(ℚ) → Type u`; point `x` of `Sh(ℝ)` | `S ↦ (S, S)` has left adjoint `(A, B) ↦ A ⊕ B` and `(∏ Sᵢ, ∏ Sᵢ)`; `Γ(Δ(∏ₙ Bool))` = locally constant maps `ℚ → 2^ℕ`, `Γ(∏ₙ Δ Bool)` = continuous maps, and an embedding `ℚ ↪ 2^ℕ` is continuous, not locally constant (`ℚ` has no isolated point), so `Δ` does not preserve the product and no `π₀` exists, consistent with 5.2; stalk at `x` is not representable (no smallest neighbourhood) while `o, c` on Sierpiński are (`F({o})`, `F(X)`); SAFT inputs checked against Mathlib's binders | holds | R03 (letter `E` → `F`) |
| 5.6 coseparating family | `X` in `F`, cover `∐ Gᵢ ↠ X` | `X ↪ Ω^X` by singletons; `Ω^(−)` sends the epi `∐ Gᵢ ↠ X` to a mono `Ω^X ↪ ∏ Ω^{Gᵢ}` (pullback of subobjects along an epi is injective in a topos) | holds | none |
| 6.1 points of a site | Sierpiński; empty site | two points, one non-identity `Point.Hom` `o → c` (`c.fiber → o.fiber` is `F(X) → F({o})`), matching Convention 4; empty site: category of elements empty, not cofiltered | holds | none |
| 6.2 enough points; no points | regular opens of `ℝ`; degenerate | a frame hom `L → Prop` is a completely prime filter of a complete atomless Boolean algebra, which would be principal on an atom: none; `⊥ ≠ ⊤` and `0 → ⊤` is not iso; the degenerate topos: empty family reflects isos | holds | none |
| 6.3 coherent | `Type u`; `Sh(ℕ)` discrete | quasicompact = finite (covered by its points); `⊤ = ⋃ ℓ {n}` with no finite subcover, each `ℓ {n}` quasicompact and generating | holds | none |
| 6.5 essential points ↔ connected projectives, covariant | `p^* = Hom(A, −)`, `q^* = Hom(B, −)` | 2-cell `p → q` is `p_* → q_*`, conjugate `q^* → p^*`, by Yoneda `A → B`: covariant; `Hom(A, −)` preserves coproducts iff `A` connected and `A ≇ 0`, epis iff projective, and then all colimits in a topos (images and unions are coproducts and epis) | holds | none |
| 6.5 Roos's theorem (iff) | `B G`; monoid `{1, e}`; `Sh(ℝ)`; `Sh([0, 1])` | Karoubi of `G`: idempotents `{1}`, one essential point; `{1, e}`: maps `(M,1) → (M,e)` and back are both `e`, composite `e ≠ 1`, two non-isomorphic points; `Sh(ℝ)`: enough points, none essential, not a presheaf topos, and `∏ₙ ∐ₖ ℓ(Iₙ,ₖ) → ⊤` has no section over any interval `W ∋ 0` (`W` would lie in an interval of length `2/n` for all `n`); `Sh([0, 1])`: no essential point and not a presheaf topos (R04). Conservative essential family ⇒ `{Aᵢ}` generating (the image `S'` of `∐ Aᵢ → X` has `Hom(Aᵢ, S') = Hom(Aᵢ, X)`), restricted Yoneda preserves colimits and is fully faithful and essentially surjective | holds | R04 (prose only) |
| 6.5 `epi_piMap_presheaf`, `isIso_sigma_pi_presheaf` | `Fin 2`, `PUnit ⊕ PUnit`; abelian groups | objectwise in `Type u`: `∏_{Fin 2}(PUnit ⊕ PUnit)` has 4 elements, `∐_{k : Fin 2 → Fin 2} PUnit × PUnit` has 4; in `Ab` ranks 4 against 8 | holds | none |
| 7.4 sublocales ↔ subtopoi | frame `0 < a < 1`; two-element frame | subsets containing `1`, closed under `⊓` and `x ⇨ −`: `{1}`, `{0, 1}` (`a ⇨ 0 = 0`), `{a, 1}` (`0 ⇨ a = 1`), all: 4; open sublocale of `a` is `{a ⇨ x} = {0, 1}`, closed is `↑a = {a, 1}`, incomparable; two-element frame: `{⊤}` and all, matching the two subtopoi of `Type u` | holds | none |
| 8.2 frame coproduct | `3 ⊗ 3`; `L ⊗ 1`; `L ⊗ 2` | up-sets of the `2 × 2` grid: `∅`, `{(1,1)}`, two with two elements, one with three, all: 6, against `|3 × 3| = 9`; a frame hom from the one-element frame forces `⊥ = ⊤`; `2` is initial | holds | none |
| 8.3 way-below, core-compact | `Opens ℝ`; `ℚ`; `⊥ ≪ ⊥` | `(0,1) ≪ (−1,2)` via compact `[0,1]`; `(0,1) = ⋃ (1/n, 1 − 1/n)` directed with no member containing it, so `(0,1) ⋪ (0,1)`; `ℚ = ⋃ₙ ℚ ∖ [t − 1/n, t + 1/n]` for irrational `t` in the closure of `V`, directed, no member contains `V`; `⊥ ≪ ⊥` holds with nonempty `s` and fails with `s = ∅`, as `IsCompactElement ⊥` requires; hofmann-lawson1978 line 521 defines core-compact exactly as `V ≪ U` | holds | none |
| 9.1 extension by zero exact and faithful | presheaf formula; Sierpiński; `Bool` in `Type u`; `ℝ`, `U = (0, ∞)` | comma category `(d ↓ Over.forget c)` is a disjoint union over `u : d → c` of categories with terminal object `(d, u, 𝟙)`, so `(j_!N)(d) = ⨁_u N(d, u)`, exact in `Ab`, unit the `u`-summand inclusion, mono; sheafification exact and `sheafPullback = sheafToPresheaf ⋙ lan ⋙ presheafToSheaf` (Pullback.lean line 71); `j_!ℤ` on Sierpiński is `(0 → ℤ)` (stalks `0` at `c`, `ℤ` at `o`), set-level `j_!` has empty stalk at `c`; `(A, B) ↦ A ⊕ B` with unit the inclusions; `(j_*ℤ)_0 = ℤ`, `(j_!ℤ)_0 = 0` | holds | R01 (citation of the preorder instance already present) |
| 9.2 recollement | Sierpiński; `Bool` (not subterminal); `ℓ c` terminal, initial | `j_!j^*(A → B) = (0 → B)` (`{o}` is not closed), sequence `0 → (0,B) → (A,B) → (A,0) → 0`, `(A, 0) = i_*i^*F`; subterminal: two maps `d ⇉ c` agree on a cover, so the summands merge locally and the presheaf kernel sheafifies to `0`; `Bool`: codiagonal `P ⊕ P → P` with kernel `{(p, −p)} ≅ ℤ`; terminal: `j_!j^* = 𝟭`, cokernel `0`; initial: `j_!j^*F = 0` | holds | none |
| 9.3 `i^!` and the bijection (no subterminal hypothesis) | `G` with `j^*G = 0`; Sierpiński `ℤ`; skyscraper on `ℝ` | `Hom(G, F) → Hom(G, j_*j^*F) = Hom(j^*G, j^*F) = Hom(0, j^*F) = 0`, so every `G → F` factors uniquely through the kernel, for every `c`; Sierpiński: `j_*j^*(A → B) = (B → B)`, unit `(r, 𝟙)`, kernel `(ker r → 0)`; `ℤ`: `i^!ℤ = 0`, `i^*ℤ = ℤ`; skyscraper at `0` on `ℝ`: `i^! = ℤ`; `G = F = ℤ`: identity does not factor through `0` | holds | R01 (space clause = `supportedSectionsSheaf`) |
| 9.4 first local cohomology sheaf | `ℝ`, `Z = {0}`, `F = ℤ`; Sierpiński `Z = {c}`; terminal, initial; injective `I` | `(j_*j^*ℤ)_0 = ℤ²`, unit the diagonal, cokernel skyscraper `ℤ` at `0`: `𝓗¹_{0}(ℤ) = ℤ`; Sierpiński: unit `(𝟙, 𝟙)`, cokernel `0`; terminal: support functor `0`; initial: identity, `R¹ = 0`; `j_!j^*ℤ_d = ℤ[ℓ d × ℓ c]`, `ℓ d × ℓ c → ℓ d` mono iff `ℓ c` subterminal, `ℤ[−]` of a mono is mono (objectwise, then sheafify), so `I → j_*j^*I` is epi on sections and `0 → Γ → 𝟭 → j_*j^* → 0` is exact on injectives; `j^*` preserves injectives since `j_!` is exact; the long exact sequence gives `R¹Γ F = coker(F → j_*j^*F)` and `R^{q+1}Γ F = R^q j_*(j^*F)` | holds; degree `≥ 2` statable | R01, R02 |
| 9.5 no projectives on `ℝ` | one-point space; Sierpiński; `V = (−1,1) ⊂ N = (−2,2)` | `ℤ` projective on a point; `j_!ℤ = (0 → ℤ)` on Sierpiński has `Hom(j_!ℤ, (A → B)) = B`, exact, projective; `ℤ_V(N) = 0` (support clopen in connected `V`, closed in `N`, and `V` is not closed in `N`), `ℤ_V(V) = ℤ`; `ℤ_V(ℚ/ℤ) → i_*(ℚ/ℤ)` iso on the stalk at `x`, target zero elsewhere, epi; lift `φ` kills `s`, but the composite on `N` is `s ↦ h(s_x) ≠ 0` | holds | none |
| Convention 9 witness | Sierpiński `U = {o}` | abelian `j_!ℤ`: stalks `ℤ`, `0`; set-level: stalk `∅` at `c` | holds | none |
| Unchanged statements 1.1–4.5, 7.1–7.3, 8.1, 8.4, 8.5 and their Checks | as in r6 rows 1–45, r7 rows 1–8, r9 rows 3–5, r10 rows 1–7 | values in those reports; the diff touches none of them | unchanged | none |

**Consistency.** 5.6's "global sections morphism essential iff locally connected" agrees with 5.2's "`F = Type u`: locally connected iff `Δ` has a left adjoint" (over `Type u` the Beck–Chevalley condition is reindexing of families and holds automatically) and with the `Sh(ℚ)` Check on both sides. 6.5's `Sh(ℝ)` Check agrees with 5.3's epimorphism `∐ₙ ℓ((n−1, n+1)) → ⊤` and with 5.6's Check 3. Layer 9's Checks agree with Convention 9 and with 3.3 (`Over (ℓ {o}) ≌ Type u`). The Layer 5, 6 and 9 Dependencies paragraphs list the layers the *Needs:* lines use (5.6 needs 1.2–1.4, 6.5 needs 5.6, 9.x need 3 and 4).

**Declared gaps.** None declared (no readable `design/plan.json`), and the README states none.

## Not verifiable

- SGA 4 (Exposé IV, Exercice 7.6 a)–i), 7.7 a), 11.3.1–11.3.3, §14, (14.10.1); Exposés III, VI), Johnstone's Elephant, Mac Lane–Moerdijk, Stone Spaces, Kashiwara–Schapira 1990 (DOI 10.1007/978-3-662-02661-8), Gierz et al., Godement, Joyal–Tierney, Moerdijk–Vermeulen, Picado–Pultr: the sources service resolves SGA 4 and Kashiwara–Schapira only to paywalled publisher pages (recorded `uncertified` in a scratch manifest), and the others are paywalled books as in r6–r10. The mathematics cited to them was recomputed in the table above; the exercise and section numbers themselves are cited by locator alone.
- isbell1972 is an image-only scan; nothing in this round depends on it (8.5's locators were read on rendered pages in r10).

## Source issues

- none
