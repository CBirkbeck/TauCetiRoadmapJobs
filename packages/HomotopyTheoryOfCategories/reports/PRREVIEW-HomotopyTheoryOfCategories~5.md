# Review of HomotopyTheoryOfCategories (pull request #1521 at 4863fc9)

**Verdict:** needs changes

Gate at this head (worker's run, data): FAIL — `set_option` 1, `sorry-data` 26, `sorry-examples` 1, `residue` 9, `prnum` 2, `readme-ids-missing` 4, `build` 1 (the "consider adding `module`" advisory only; `lake env lean` of `TauCetiRoadmap/HomotopyTheoryOfCategories/Suggested.lean` exits 0 with 62 `sorry` warnings and nothing else). Dependency check: `depcheck: 205 roadmaps, 1660 edges, 0 problem(s)`. No change outside the roadmap folder (`git diff --stat origin/main...HEAD` excluding the folder is empty).

## R01 (P1) — Twenty-six sorry'd data declarations, and everything that mentions them

Location: `TauCetiRoadmap/HomotopyTheoryOfCategories/Suggested.lean` lines 57, 60, 86, 92, 98, 126, 129, 135, 163, 168, 194, 197, 295, 298, 300, 448, 453, 469 (field `lt₂`), 485, 489, 637–640 (`inv := sorry`), 645, 648, 671, 673, 675.

Claim: the file "uses only Mathlib, with `sorry` for the targets" (pull-request text) and is an acceptance test.

Witness: the gate's `sorry-data` list; e.g. line 300 `def iAAdjunction : iAFunctor A ⊣ iAStarFunctor A := sorry`, line 671 `instance : Groupoid.{u} (TwoTerm d) := sorry`, line 639 `inv := sorry`. Every declaration of Layers 3 and 6 (`presheafWeq`, `iALocalized`, `IsWeakTestCategory`, `IsLocalTestCategory`, `IsTestCategory`, `IsStrictTestCategory`, `isStrictTestCategory_simplexCategory`) mentions `iAFunctor`/`iAStarFunctor`; `kInvariant` mentions `piOneRep`; `isGrCategory_twoTerm` and `isStrictlyCommutative_twoTerm` mention the three sorry'd instances on `TwoTerm`.

Repair: delete every sorry'd `def`/`abbrev`/`instance` and every declaration that mentions one. Where a headline needs the carrier and it has a short real body on native carriers, write that body: `iAFunctor` is `X ↦ Cat.of (CostructuredArrow yoneda X)`, `f ↦ (CostructuredArrow.map f).toCatHom`, and `iAStarFunctor` is `C ↦ (a ↦ Over a ⥤ C)` with precomposition; both are a few lines and then Layer 6's `IsStrictTestCategory (AsSmall SimplexCategory) Winfty` stays statable (`iAAdjunction` is not needed by any statement; make it a README target). `TwoTerm d` needs real `Groupoid`, `MonoidalCategory` and `SymmetricCategory` instances (objects `K₀`, `Hom x y := {k // x + d k = y}`, tensor `+`, identity symmetry) or the two `TwoTerm` theorems go; `Group (Skeleton C)` with `inv := sorry` goes (state the group structure as a README target; the Lean headline on π₀ can quantify over `Monoid (Skeleton C)` with `IsUnit` of every element). The sorry'd `example : ¬ IsDirect ℤ` (line 436) is deleted too (an admitted example tests nothing; the README keeps the Check).

## R02 (P1) — `set_option linter.checkUnivs false in` on an unused abbreviation

Location: `Suggested.lean` line 563–565.

Claim: `abbrev Prederivator := Pseudofunctor (Cat.{w, w})ᵒᵖ Cat.{v₁, u₁}` needs the linter off.

Witness: line 567 `variable (D : Pseudofunctor (Cat.{w, w})ᵒᵖ Cat.{v₁, u₁})` writes the type out; `Prederivator` is used nowhere else in the file (grep: one definition, zero uses).

Repair: delete lines 562–565. Nothing else changes; `value`, `restrict`, `SatisfiesDer2`, `SatisfiesDer3` elaborate against the explicit `variable`.

## R03 (P2) — Theorem A and Theorem B in nerve form re-plan StableHomotopyKTheory §§2.31 and 2.34, and the consumer relation claimed with that roadmap does not exist

Location: README lines 67, 380–382, 413–416, 423–435, 771–773 and the table at 777–782 ("StableHomotopyKTheory … consumes Layers 1, 2 and 4", "its §§2.31 and 2.34 come after Layer 4 of this roadmap").

Claim: `quillenTheoremA_nerve` and `quillenTheoremB_Winfty` are owned here and StableHomotopyKTheory specialises them.

Witness: the merge order lists StableHomotopyKTheory at position 13 and this roadmap at 374 (last); StableHomotopyKTheory at its open head 5f92355 (`roadmaps show StableHomotopyKTheory --pr 1227`) contains no occurrence of `HomotopyTheoryOfCategories`, `basic localizer` or `Winfty`, and its §2.31 proves `quillenTheoremA` ("contractibility of every B(F↓d) makes BF a homotopy equivalence") with *Needs:* §2.18, §2.23, §2.28, §1.12, §1.7, M, and §2.34 proves `quillenTheoremB` in both comma forms, with no input from here. GeneralizedCohomology G2 item 1 (main, README line 221) defines a simplicial weak equivalence as a map whose realization induces a bijection on components and isomorphisms on all based homotopy groups, so "`nerveMap F` is a simplicial weak equivalence" is the same proposition as "BF is a weak homotopy equivalence": the statement of `quillenTheoremA_nerve` (README 413–414) is StableHomotopyKTheory §2.31's statement, and `quillenTheoremB_Winfty` (423–427) is its §2.34's, under the same hypotheses. Two owners of one theorem, and an earlier roadmap described as consuming a later one.

Repair: delete `quillenTheoremA_nerve` and `quillenTheoremB_Winfty` as targets and the two StableHomotopyKTheory rows of the Exports table (and the pull-request URL at line 67 and 779). Layer 4 keeps `isBasicLocalizer_thomason`, with LF3 for `W_N` proved *from* StableHomotopyKTheory §2.31 (earlier in the merge order, so citable: "*Needs:* StableHomotopyKTheory §2.31, GeneralizedCohomology G2 item 1") plus Cisinski 2004 Theorem 2.1.13's two-out-of-three bookkeeping, and Theorem B is consumed from StableHomotopyKTheory §2.34 for the proof of Cisinski's Corollary 2.3.3 and Theorem 2.3.6. `mem_of_isAsphericalFunctor` (Theorem A for an arbitrary basic localizer, Cisinski Remark 1.1.4) stays here: it is a different object. Rewrite "Dependency order" lines 771–773 accordingly (nothing in StableHomotopyKTheory comes after this roadmap).

## R04 (P2) — `CrossedModule` already exists in SchemeAndStackFoundations §1.24

Location: `Suggested.lean` lines 654–663; README lines 695–698 ("Define crossed modules of groups and their morphisms").

Claim: crossed modules of groups are built here.

Witness: `content` main, `TauCetiRoadmap/SchemeAndStackFoundations/README.md` lines 3091–3093: "Define `CrossedModule Ht H`: a homomorphism `∂ : H̃ → H` and an action of `H` on `H̃` by automorphisms with `∂(h·x) = h ∂(x) h⁻¹` and `∂(x)·y = x y x⁻¹`", with `.quotientCategory` (objects `H`, morphisms `H̃`), `.isGroupoid`, `.isoClasses` (`coker ∂`), `.aut` (`ker ∂`, central). The structure at lines 655–661 has exactly these fields (`bdry_act`, `peiffer`); its `quotientCategory` is the strict 2-group of Layer 12, and `π₀ = coker ∂`, `π₁ = ker ∂` (README 697) are `.isoClasses` and `.aut`.

Repair: delete `CrossedModule` from `Suggested.lean`; in Layer 12 cite SchemeAndStackFoundations §1.24 (`CrossedModule`, `quotientCategory`, `isoClasses`, `aut`) in the supplier contracts and keep only what is new: the monoidal structure on `quotientCategory`, the Brown–Spencer equivalence with group objects in groupoids, and the `k`-invariant. Note the direction of §1.24's action (`H` acts on `H̃`, matching `act : G →* MulAut H` here) so the two agree on the instance `∂ = id` (quotient category a groupoid with one isomorphism class, `π₁ = 1`).

## R05 (P2) — Headline theorems statable at the pins are absent, and the module docstring does not say which are not statable

Location: `Suggested.lean` lines 3–27 (docstring), 212–215, 247–283.

Claim: the file states the roadmap's headline theorems.

Witness: (i) Cisinski 2004 Theorem 2.3.6 (README 433–435, a Layer 4 headline) is statable with carriers already in the file: `theorem eq_Winfty_of_locallyConstant {W} (hW : IsBasicLocalizer W) (h₀ : W ≤ W₀) (h : ∀ {A B} [SmallCategory A] [SmallCategory B] (F : A ⥤ B), IsLocallyConstant W F → W F.toCatHom → IsAsphericalFunctor W F) : W = Winfty`; it is not there. (ii) `IsGroupoidFibration` (line 213) is defined and no theorem uses it: the exact sequence and Mayer–Vietoris of Layer 1 (Brown–Heath–Kamps Theorem 2.2, Corollary 2.5) are statable on it (`π₀` as `ConnectedComponents`, automorphism groups as `Aut`) and are absent. (iii) `Π₁ G ≌ G` is written as sorry'd data (line 194) although the headline is the proposition `(FreeGroupoid.lift (𝟭 G)).IsEquivalence`, statable at the pin (`FreeGroupoid.lift` is at `Mathlib/CategoryTheory/Groupoid/FreeGroupoidOfCategory.lean`). (iv) The docstring names only `Winfty = W_N` as not prototyped; it says nothing of Thomason's model structure (Layer 5), Theorem B, the cube examples of Layer 6, Sính's classification, the `(π₀, π₁, ε)` classification of Picard groupoids (SchemeAndStackFoundations' `PicardGroupoid` is not at the pin: `grep PicardGroupoid` over the pinned Tau Ceti finds nothing), Deligne's theorem over a site, or the triangulated structure of Theorem 4.15, each of which lacks a carrier at the pins. The docstring's own form ("The statements here suggest Lean forms…; `sorry` is permitted") is the wrong contract.

Repair: add the three statable headlines above; rewrite the docstring as "Homotopy theory of small categories: target signatures", saying the roadmap is `README.md`, that this file states the headline theorems against the pinned Mathlib and Tau Ceti, and listing each non-statable headline with the carrier it lacks (simplicial weak equivalences from GeneralizedCohomology G2; `PicardGroupoid` and `Stack.stackification` from SchemeAndStackFoundations; stable derivators; the cube categories).

## R06 (P3) — The Lean file is an API catalogue; nine declarations are padding by the one-tactic probe or by reading

Location: `Suggested.lean` lines 64–73, 104, 252, 306, 367, 379, 391–399, 403, 492, 496, 501, 507, 533, 539–546, 642.

Witness: on a copy in scratch, elaborated with `lake env lean`, these close with one term: `Winfty_le` by `fun _ _ _ h => h W hW` (it restates the definition of `Winfty`); `presheafWeq_isInvertedBy` by `fun _ _ _ hf => Localization.inverts W.Q W _ hf`; `SemiSimplexCategory.eq_id_of_endo` by `IsDirect.eq_id_of_endo f`; `Presheaf.IsNonsingular.of_hom` by `fun _ _ x u v h => hY (f.app _ x) u v (by simpa using congr_arg (f.app _) h)`; `len_le_of_hom` by `simpa using Fin.nonempty_embedding_iff.mp ⟨(homEquiv f).toEmbedding⟩` (the probe went from 62 to 56 `sorry` warnings with no error). Already-proved `isInverse_iff`, `rank_lt`, the `Unique` instance and `IsDirect.reedyStructure` restate definitions or one library lemma; `fixedRight_obj`, `fixedLeft_obj`, `fixedRight_iff_exists`, `essImage_eq_fixedRight`, `len_lt_of_not_identities`, `aut_unit_mul_comm`, `SemiSimplicialObject`, `DiscreteFibration` (used by no theorem) are API, not headlines.

Repair: delete them from `Suggested.lean`; the README keeps each as a target or Check.

## R07 (P3) — Gate style items: `lemma`, pull-request numbers and URLs, residue, backticked names not declared

Location: `Suggested.lean` lines 64, 68, 71, 104, 492, 496, 501 (`lemma`); README lines 67, 138, 548, 779, 783 (pull-request numbers `#1227`, `#1431`, `mathlib4#44778`, and GitHub pull-request URLs), 797, 800 (`mathlib4#44731`, `#44732`), 65 and 143 (`TODO`), 785–821 ("Provenance": process narrative, external repository links, "written against Mathlib `715a03a9`").

Witness: the gate's `residue`, `prnum` and `readme-ids-missing` lists; `Winfty_eq_thomason`, `fixedLeft_iff_exists`, `isBasicLocalizer_thomason`, `isLocallyConstant_Winfty_iff` are backticked as this roadmap's declarations and absent from the Lean file, and so are `Karoubi.hom_eq_decompId_i_comp` (314), `fixedLeftAdjunction`, `fixedRightAdjunction`, `map_map_unit_app_of_idempotent` (300–308), `iA_singleObj_iso` (343), `quillenTheoremA_nerve`, `quillenTheoremB_Winfty` (413, 423), `IsDirect.induction`, `ReedyStructure.rec` (518–519), `PicardGroupoid.isGrCategory` (707), `brown_factorization_of_modelCategory` (674); none occurs in `Suggested.lean`.

Repair: `theorem` for `lemma`; cite roadmaps by name and section only; `SimplexCategory.reedyStructure` is cited as "Mathlib `master`, `Mathlib/AlgebraicTopology/Reedy/SimplexCategory.lean`, absent at the pin" without a pull-request number; delete the Provenance section (the CC0 files are not sources of statements; if a reading of the Grothendieck fonds is a source, it goes under References as a text); state the undeclared names' facts in prose.

## R08 (P3) — README shape: no `*Needs:*` lines, almost no Checks, no `### Examples`/`### Dependencies`, non-house section names

Location: README throughout: Layers 1–6 and 10–13 are bullet lists without `### k.n` subsections; no target has a `*Needs:*` line; `**Checks.**` lists are absent (four inline "*Check:*" sentences in 885 lines: 469, 499, 601, 711); the sections are "Scope boundary", "What exists (consume)", "Dependency order", "Exports to consumers" instead of `## Scope and ownership`, `## Exact supplier contracts`, `## How to read the build`, `## Downstream consumers`.

Witness: SchemeAndStackFoundations on main (lines 2745–2810, 4789–4873) has `### 1.18 …`, `*Needs:*` per target and a `**Checks.**` list per definition; here `IsBasicLocalizer`, `W₀`, `W₁`, `WNeg₁`, `IsDirect`, `Presheaf.IsNonsingular`, `IsDiscreteFibration`, `IsCofibrationCategory`, `IsGrCategory`, `TwoTerm` have zero Checks each.

Repair: the shape of the brief's "README in TauCetiRoadmap form": one `### k.n` subsection per target with its `*Needs:*` line, at least three discriminating Checks per definition (the computed instances in the adversarial table below are candidates), and `### Examples`/`### Dependencies` closing each layer.

## R09 (P3) — The `A = BG` Check misidentifies the slices

Location: README lines 469–474.

Claim: "`A/(★ × ★) → A/★ × A/★`, that is `BG → BG × BG`, is not in `W∞`".

Witness: `A/★ = i_{BG}(G)` is the action groupoid of `G` on itself, which has a terminal object (LF2: aspherical, equivalent to `e`), not `BG`; `A/(★ × ★)` is the action groupoid of `G` on `G × G` (diagonal action, `|G|` free orbits), equivalent to the discrete category on `|G|` objects. The map is `|G| points → e`, not in `W∞` for `|G| ≥ 2` (bijection on `π₀` fails), so the conclusion holds and the gloss is wrong. (The diagonal `BG → BG × BG` is also not in `W∞`, but it is not this map.)

Repair: replace "that is `BG → BG × BG`" by "the functor from the discrete category on `|G|` objects to `e`". Also move the MathOverflow citation (474) out of the body: record the erratum against Cisinski 2006, Proposition 4.3.2 under References (the counterexample is verified below), since an informal web discussion is not a source of a statement.

## R10 (P3) — Thomason locators and the known gap in his proof of properness

Location: README lines 445–448, 453–456.

Witness: thomason1980 line 306–308: Proposition 4.3 says both that the pushout-of-nerves comparison is a weak equivalence **and** that the cobase change `j` is a Dwyer map; line 309–310: Corollary 4.4 says that if `f` is a weak equivalence so is `g`, and if `i` is so is `j` (preservation of weak equivalences), not "cobase change of a Dwyer map is a Dwyer map". Corollary 5.5 (line 531–533, properness) is proved from Proposition 5.4 (517), which uses Lemma 5.3 3° (503: "any retract of a Dwyer map is a Dwyer map"); that lemma is false (Cisinski, « La classe des morphismes de Dwyer n'est pas stable par rétractes », Cahiers 40 (1999), 227–231, which repairs the argument with pseudo-Dwyer maps). The README's Layer 4 "Homological localizers" (417–419) has no locator at all.

Repair: cite Proposition 4.3 for the Dwyer cobase change and Corollary 4.4 for the two weak-equivalence statements; add Cisinski 1999 to References and route properness (and "cofibrations are pseudo-Dwyer maps") through it; give the homological localizer a source (Cisinski 2006, the `H_*`-localizers of §4.? or a direct bisimplicial argument stated as a target with its inputs).

## R11 (P3) — Degenerate instance: the empty `G`-set is "simply transitive" but not aspherical

Location: README lines 349–350 ("`X` is `W₁`-aspherical iff the action is simply transitive").

Witness: `X = ∅`: the action is free and vacuously transitive (Mathlib's `IsPretransitive` holds on an empty type), `ActionCategory G ∅` is the empty category, `Π₁(∅) → e` is not an equivalence, so `∅` is not `W₁`-aspherical. `X = G` with the regular action: one object class, trivial stabilizers, aspherical.

Repair: "iff `X` is nonempty and the action is free and transitive"; add both instances as Checks. In the same spirit, convention 11's action of `π₀` on `π₁` (lines 249–250) composes a left-unitor conjugation with the inverse of the right-unitor one and has no computed witness, so the inverse convention is not excluded: pin it on the skeletal gr-category with `π₀ = ℤ/3`, `π₁ = ℤ/7`, the generator acting by multiplication by `2` (`2³ ≡ 1 mod 7`) and trivial associator, with the Check that the generator acts by `2` and not by `2⁻¹ = 4`.

## R12 (P3) — Maltsiniotis 2005 locator depends on the version

Location: README lines 478–479 ("Maltsiniotis 2005, Proposition 1.6.13").

Witness: maltsiniotis2005 (author-page version `prstnew.pdf`) line 2240: 1.6.13 is the Lemma "every `Δm` is `Δ1`-contractible"; line 2256: "Proposition 1.6.14. La catégorie Δ est une catégorie test stricte." Maltsiniotis 2009 (line 221) cites "[22, proposition 1.6.13]" for the same statement, so the published Astérisque numbering differs from the author's file by one here.

Repair: cite "Astérisque 301, Proposition 1.6.13 (Proposition 1.6.14 in the author's preprint)" or whichever version the References entry names; same check for 1.6.1, 1.6.8, 2.1.3 (these agree in both).

## Verified sound

**Gate and build.** Worker's gate read; `lake env lean` on `Suggested.lean` from the worktree: exit 0, 62 `declaration uses 'sorry'` warnings, no other output. Dependency check output: `depcheck: 205 roadmaps, 1660 edges, 0 problem(s)` (no UPWARD, no CYCLE, no `moved:` line). Other changes in the pull request outside the folder: none. `metadata.toml`: `topic = "math.AT"`.

**Elaborated signatures.** The worker's 94 signatures compared with the README; the 49 "dropped binder" leads are universe renamings (`Category.{v₁} C` elaborates as `Category.{u_1,u_2} C`) except `IsCofibrationCategory`, whose class type legitimately omits `[HasInitial C]` (no field uses it; `brown_factorization` carries it). `IsStrictlyCommutative` takes `[MonoidalCategory C] [SymmetricCategory C]` and at the pin `BraidedCategory`/`SymmetricCategory` are parametrised by the given `MonoidalCategory`, so there is one monoidal structure.

**Seeded sample (the scope section's claims), each opened at the pin.** Mathlib `f6090c70`: `Mathlib/AlgebraicTopology/Reedy/` contains only `Basic.lean`; `ReedyStructure` (lines 45–53) has fields `deg`, `lt₁`, `lt₂`, `nonempty_unique` with `[W₁.IsMultiplicative] [W₂.IsMultiplicative]` and `[LinearOrder α] [OrderBot α] [SuccOrder α] [WellFoundedLT α]`, `ReedyStructure.op : ReedyStructure W₂.op W₁.op α` (line 64), `degHom_*`, `exists_fac`, `prop₁_of_degHom_eq_deg_right`, `prop₂_of_degHom_eq_deg_left`, `deg_eq_of_iso`, `prop₁_of_iso`, `prop₂_of_iso`, `skeletal` (74–218); `SimplexCategory.reedyStructure` absent (grep over Mathlib: no match). `SemiSimplexCategory` at `AlgebraicTopology/SimplexCategory/SemiSimplexCategory.lean` (Hom = order embeddings line 45, `toSimplexCategory` 74, `Faithful` 82, `Mono` 87/91, `homOfMono` 98, TODO on semi-simplicial objects line 14). `SSet.Nonsingular` (`SimplicialSet/Nonsingular.lean` 48: every non-degenerate simplex classifies a mono), `nonDegenerate_δ` 91, `Nonsingular.δ_injective` 101, `X.N` (`NonDegenerateSimplices.lean` 37), `NonsingularColimit.lean` (`toSemiSimplexCategory`, `isColimitCoconeN'`). `FreeGroupoidOfCategory.lean`: `lift_id_comp_of`, `IsLocalization ⊤`, `Grpd.free` (290), `freeForgetAdjunction` (305). `Action.lean`: `ActionCategory` (48), `π` (56), `objEquiv` (86), `stabilizerIsoEnd` (102), `Groupoid` instance (142), `endMulEquivSubgroup` (146), `homOfPair` (151). `Monoidal/Skeleton.lean`: `instMonoidalCategory` 53, `instMonoid` 60, `instCommMonoid` 80, `monoidHom` 95ff. `Idempotents/FunctorExtension.lean`: `whiskeringLeftObjToKaroubiFullyFaithful`, `karoubiUniversal`. `Monad/Adjunction.lean` `comparison`; `Monadicity.lean` (`[Category.{v₁} C] [Category.{v₁} D]`, so the Lean file's universe restriction is Mathlib's), `IsSplitPair`, `monadicOfHasPreservesGSplitCoequalizersOfReflectsIsomorphisms`; `Comonadicity.lean` dual. `ModelCategory/BrownLemma.lean` 48–53: `CofibrantBrownFactorization` extends a `MapFactorizationData (cofibrations C) (trivialFibrations C) f` with `s : Y ⟶ Z`, `s_p : s ≫ p = 𝟙 Y`, `cofibration_s` — the README's "take `r := p`, `j := s`" is right. `Sites/Descent/IsStack.lean` 49: `class IsStack (F : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat) (J)` in namespace `Pseudofunctor`. `SimplicialSet/CategoryWithFibrations.lean` 36–48: `SSet.modelCategoryQuillen.I`, `J`; no `ModelCategory SSet` instance. `SimplicialSet/Homology/` exists (6 files). `Subdivision.lean`: `sdExAdjunction`. The TODO comments on idempotent adjunctions: `Adjunction/Reflective.lean` 60 and `Monad/Adjunction.lean` 316. `Adjunction.fixedLeft`, `IsDirect`, `Presheaf.IsNonsingular`, `IsDiscreteFibration`: no match at the pin. Tau Ceti `358314d4`: `TauCeti/CategoryTheory/Groupoid/ConnectedFunctor.lean` (`natIsoOfEnd` 76), `SingleObj.lean` (`singleObjFunctor`, `fullyFaithfulSingleObjFunctor` 81, `isEquivalence_singleObjFunctor` 106), `TauCeti/Topology/Homotopy/HomotopyGroup/Map.lean`, `LoopSpace.lean` (`zerothHomotopyLoopSpaceEquivFundamentalGroup` 242, `loopSpaceMulEquiv` 283); no file mentions `ReedyStructure`, `FreeGroupoid`, `ActionCategory`, `nerve`, `GrCategory`, `PicardGroupoid`, a category-theoretic `IsDirect`, or `MappingPathFiber` (so the Exports table's `TauCeti.MappingPathFiber` is StableHomotopyKTheory's own name, not Tau Ceti's).

**Cross-roadmap citations resolved.** SchemeAndStackFoundations on main: §1.18 (line 2745; `Stack.stackification`, `toStackification`, `stackificationUniversal` at 2758–2764), §3.4 (4789; `PicardGroupoid`, `pi0 := Skeleton`, `pi1 := Aut(𝟙)`, `gradedPicardGroupoid` with symmetry `(−1)^{f·g}` at 4827–4845), §3.7 (4937), §1.15 (2502), §1.24 (3068, R04). GeneralizedCohomology G2 item 1 (211–235). BordismFormalGroups F6.5 (1526; the simplex Reedy structure "following the design of `SimplexCategory.reedyStructure`" at 1687–1691). AlgebraicTopology Stage 8 (1602). GrothendieckInfinityGroupoids at head 9344ece: §0.1 "The globe category and globular sets" (170–179: two morphisms `m → n` for `m < n`), and its scope line 51 declares test categories and basic localizers out of its scope. GrothendieckNotesLemmas at 30d3e77 lines 42–43 defers the four items to this roadmap; GrothendieckTopoi at a60ff1d line 82 cites this roadmap as a non-dependency. StableHomotopyKTheory at 5f92355: §§1.21 (338), 1.28 (435), 2.31 (914), 2.34 (938) read in full (R03). Ownership sweep (`roadmaps grep` on basic localizer | test categor | derivator | crossed module | gr-categor | Thomason model | Dwyer map | direct categor | Picard stack | Picard groupoid | 2-group | cofibration categor | non-singular presheaf | discrete fibration, 201 lines): the only other owners are SchemeAndStackFoundations §1.24 (crossed modules, R04) and StableHomotopyKTheory §4.26/§5.19 (Picard groupoids as grouplike Γ-spaces and as stable 1-types: a different object from the `(π₀, π₁, ε)` classification stated here); EndoscopicTransfer §1.1 consumes §1.24's crossed modules. Ownership against open pull requests without files in this brief was not checked.

**Sources opened at the locators.** cisinski2004 (Numdam): 1.1.1 FS1–FS3 (lines 117–123: `ri = 1`, `ir ∈ W ⇒ r ∈ W`, as convention 3), Definition 1.1.3 LF1–LF3 (151–156), Remark 1.1.4 (157), Propositions 1.1.5, 1.1.7, 1.1.9, Corollaries 1.1.10–11, Proposition 1.1.13 (cofibred), 1.2.4 (integration), Lemma 1.3.6 (389: `i_A` commutes with colimits and fibre products, right adjoint `a ↦ Hom(A/a, C)`), Theorem 1.3.10 (455), Theorems 2.1.5, 2.1.13 (624; LF1–2 "exercise", LF3 via bisimplicial sets), Lemma 2.2.2 (677), Proposition 2.2.3 (689: `Δ/A → A` is the last-vertex functor, proof via `(Δ/A)/a ≅ Δ/(A/a)`), 2.2.4–2.2.6, 2.2.8–2.2.9, Theorem 2.2.11 (744), 2.3.1 (751), Theorem 2.3.2 (754), Corollary 2.3.3 (759), Theorem 2.3.6 (781–784: hypotheses `W ≤ W₀` and every `W`-locally constant `W`-equivalence is `W`-aspherical, as README 433–435). thomason1980 (Numdam): Definitions 2.1–2.3 (168–175), 4.1 (271–278), Proposition 4.2 (281: ordered simplicial complexes), 4.3, Corollary 4.4, Theorem 4.9 (466), Lemma 5.3 (500–503), Proposition 5.4 (517), Corollary 5.5 (531), Lemma 5.6, Proposition 5.7 (552). groth2013 (arXiv v2): Definitions 1.1 (188), 1.9, 1.10 (552–561: Der1–Der4 as convention 9), 1.13 (681: strong), 1.15, 1.21, 1.28 (1218: sieve/cosieve as convention 2), 3.1, 3.9, 3.10, 3.19, 3.21, 4.1 (2850: stable requires strong); Example 1.11; Lemmas 1.18–1.20, 1.23, 1.27, 3.7; Propositions 1.12, 1.24, 1.26, 1.29, 1.30, 1.36 (1554: combinatorial ⇒ strong), 3.2, 3.6, 3.11, 3.13, 3.14, 3.20, 3.23–3.25, 4.3–4.7; Theorems 1.31 (1344), 1.38 (1612: any model category, via Cisinski 2003), 4.15 (3240); Corollaries 3.8, 4.8, 4.14, 4.19. maltsiniotis2009 (author page): §1.1 (71–100: `δ`, `σ`, connections `γ` with `sup`, conditions (a), (b)), 2.3 (212–220), 2.4 (223: totally aspherical includes "non vide"), 2.5, Theorem 2.6 (232), §3 Propositions 3.2–3.3, §5 (479–486: `□₁ × □₁` has the type of `S² ∨ S¹`; cites Cisinski 2006 8.4.13 / 8.4.27). cisinski2006 (author page): Proposition 4.3.2 (8576–8595, printed p. 190), 8.2.2 (14253), Corollary 8.4.13 (14888), Proposition 8.4.27 (15122). maltsiniotis2005 (author page): 1.6.1 (2101), 1.6.8 (2190), 2.1.3 (4156), 1.6.13/1.6.14 (R12). riehlverity2014 (arXiv v3): 2.3–2.7 (387–411: parallel pair `deg a = 0`, `deg b = 1`; span with `deg(a) = 0` or `deg(b)=0, deg(a)=1, deg(c)=2`; `Δ`, `Δ₊`; opposites and products). baezlauda2004 (arXiv v3): Propositions 39, 42, 45, Theorem 43 (2691: quadruples `(G, H, α, a)`), Corollary 44. johnsonosorno2012 (arXiv v3): 2.3, 2.4, Proposition 2.5 (217), Lemma 2.6, 2.7, Corollary 2.8 (274) and 260–263: the symmetry determines the class, through the quadratic map `q(x) = c(x,x)` (the sign `ε`). cisinski2010 (Numdam): 1.1 (181–200: "dérivable à gauche" = fibrations, D0–D4), 2.1 (866: `Dir_f`), Theorem 2.21 (1426), 2.22 (1433: "dérivable à droite" = cofibrations, `Aᵒᵖ` left derivable), Corollary 2.24 (1450: weak right derivator of domain `Dir_f` with Der 5), Definition A.5 (3151); Baues' C1–C3 give D0–D4 for `Cᵒᵖ`.

**Adversarial table.** One row per statement checked; values computed on each side.

| Statement | Instance | Computed | Result |
| --- | --- | --- | --- |
| FS3 (conv. 3, Lean `retract`) | `i : X → Y`, `r : Y → X`, `i ≫ r = 𝟙` | Cisinski: `ri = 1_X`, `ir ∈ W ⇒ r ∈ W`; Lean: `W (r ≫ i) → W r` with `r ≫ i = i ∘ r : Y → Y` | agrees |
| `WNeg₁` basic localizer | LF3 with `A = ∅`, `B = e`, `C = e` | `A/★ = ∅`, `B/★ = e`: hypothesis fails, nothing to show; FS3: `r : Y → X` functor forces `Nonempty Y → Nonempty X` | holds |
| `W₀ ≤ W₋₁ < ⊤` strict | `{0,1} → e`; `∅ → e` | `π₀`: 2 → 1 not bijective but nonempty↔nonempty; `∅ ↔ e` false but in `⊤` | both strict |
| `W₁ ⊆ W₀` and `W₁` iff `W₀` + Aut bijective | groupoid `G ⊔ G → G` fold | `π₀`: 2 → 1 fails; so not `W₁` either; equivalence ⇔ bijective on `π₀` and on `Aut` | agrees |
| `Π₁ G ≌ G` | `G = SingleObj (ℤ/2)` | `FreeGroupoid.lift (𝟭 G)` inverse to `of`; `lift_id_comp_of` | agrees |
| `i_{BG} X ≅ ActionCategory G X` arrows | `G = S₃`, `x`, `g = (12)` | `CostructuredArrow yoneda X`: arrow `x → y` is `g` with `X.map g.op y = x`, i.e. `y · g = x`, `y = x · g⁻¹ = g • x`; Mathlib: arrow `x → g • x` | agrees; composition `f ≫ g = g * f` on both sides |
| `W_Â = isos` for `A = BG`, `W = W∞` | `G`-map `f : X → Y` | `B(i_A X) ≃ ⊔_orbits K(Stab,1)`; weak equivalence ⇔ orbits biject and `Stab(x) ≅ Stab(fx)` ⇔ `f` bijective | agrees (Check 469–472) |
| `A/(★ × ★) → A/★ × A/★` for `A = BG` | `G = ℤ/2` | `A/★`: terminal object, `≃ e`; `A/(★×★)`: `G×G` diagonal, 2 free orbits, `≃` discrete on 2 objects; map `2 points → e` not in `W∞` | conclusion true, gloss "`BG → BG×BG`" false (R09) |
| Cisinski 2006 Prop 4.3.2 (g)⇒(c) | `A = BG`, `G = ℤ/2` | (g): isos stable under products ✓; (c) fails at `X = Y = ★` as above | source error confirmed |
| `□₁ × □₁` not aspherical | cells of the cubical set | maps `⦋n⦌ → ⦋1⦌` in `□`: 0, 1, or a projection; non-degenerate pairs: 4 vertices, 5 edges `(x,0),(x,1),(0,x),(1,x),(x,x)`, 2 squares `(x₁,x₂),(x₂,x₁)`, none above; realization: two discs on one boundary circle plus a chord = `S² ∨ S¹`, `χ = 4−5+2 = 1`, `H₁ = ℤ` | agrees with Maltsiniotis §5 |
| `□` morphism conditions (a),(b) (conv. 8) | `f = (pr₂, pr₁) : ⦋2⦌ → ⦋2⦌` | (b) needs `i₁ < i₂`: `2 < 1` fails, so the swap is not in `□` | agrees with source |
| `DirectRel`/`IsDirect` on posets | `ℕ`; `ℤ`; `ℕ ×ₗ ℕ` | `ℕ`: `WellFoundedLT` ✓; `ℤ`: `… < −2 < −1 < 0` infinite descent, not direct; `ℕ ×ₗ ℕ`: well-founded, `rank (1,0) = ω` | 8.1 and 7.3 agree |
| `IsDirect.rank` recursion | `WalkingParallelPair` | `rank zero = 0`, `rank one = sup(succ 0) = 1` | agrees with 8.2 |
| `reedyStructureOfLocallyFiniteOrderBot` | `Finset (Fin 2)` | `deg ∅ = 0`, `deg {0} = deg {1} = 1`, `deg {0,1} = |{∅,{0},{1}}| = 3`; strictly monotone | `lt₂` holds |
| Isomorphisms in a direct category are identities (7.1) | `f : X ≅ Y`, `X ≠ Y` | `DirectRel X Y` and `DirectRel Y X` give the infinite chain `X ← Y ← X ← …` | holds; skeletal follows |
| `nonempty_reedyStructure_nat_iff` | `ℕ ×ₗ ℕ`; `ℤ` | LHS false (an `ℕ`-degree would be strictly monotone on `(0,n) < (1,0)` for all `n`); RHS false (`rank (1,0) = ω`); `ℤ`: both false (not direct) | agrees both directions |
| 7.5 degree truncations | `r` on `Δ`, `a = 1`, `f : [2] → [0]` | Reedy factor `[2] ↠ [0] ↪ [0]`; intermediate degree `0 ≤ min(2,0)` | sieve closed under intermediate objects |
| `SemiCubeCategory` count | `n = 2` | `k=0`: `C(2,0)·4 = 4`; `k=1`: `2·2 = 4`; `k=2`: 1; sum 9 = `3²` | agrees |
| Globe category direct | `k < n` | two morphisms `k → n` (GIG 0.1 line 177); endomorphisms identity | agrees with 8.6 |
| `IsNonsingular ↔ IsThin X.Elements` | `X = yoneda.obj c` | thin ⇔ `u ∘ v = u ∘ w ⇒ v = w` for all `u : c'' → c` ⇔ every morphism into `c` mono | agrees with 9.1 |
| `IsNonsingular.of_hom` | `X ⊆ Y` subpresheaf | `X.map u x = X.map v x ⇒ Y.map u (fx) = Y.map v (fx) ⇒ u = v` | holds (probe closes it) |
| `FacePoset X` antisymmetry needs `IsDirect` | `C = BG`, `X = G` regular | `(★, 1) ≤ (★, g) ≤ (★, 1)` with `g ≠ 1`: not antisymmetric; for direct `C`, `c' → c → c'` is an identity so `c = c'`, `x = x'` | hypothesis needed and present |
| 9.3 discrete fibration ⇔ presheaf | `X : Cᵒᵖ ⥤ Type`, `e = (c, x)`, `u : c' → c` | unique lift `(c', X.map u x)`; `Bijective` on `Σ e', e' ⟶ e` | agrees with conv. 18 |
| Beck iff (0.3) | `G = 𝟭`; `G = forget : Top → Type` | identity: comparison equivalence, reflects isos, split coequalizers absolute; `Top`: bijective continuous maps not homeomorphisms, so `ReflectsIsomorphisms` fails and `Top` is not monadic over `Type` | agrees both ways |
| Idempotent adjunction, fixed subcategories (0.1) | sheafification ⊣ inclusion; free abelian ⊣ forget | sheaves: `ε` iso everywhere, `fixedRight = all`, `fixedLeft = sheaves`, `fixedEquiv` identity; free: `η_X : X → U F X` never iso (`U F ∅ = {0}`), `ε_A : ℤ[A] → A` never iso, both fixed subcategories empty, equivalence `∅ ≌ ∅` | agrees |
| 0.2 additivity transfer | `f : (X,p) → (Y,q)` in `Karoubi C` | `f = decompId_p ≫ toKaroubi(f) ≫ decompId_i`; `F(f+g) = F(p)(F f + F g)F(i)` | "iff" holds |
| `IsGrCategory` | one-object trivial groupoid; core of finite sets with `⊔` | trivial: `𝟙 ⊗ 𝟙 ≅ 𝟙` ✓; `{1} ⊗ Y ≅ ∅` impossible (cardinality `1 + |Y| ≠ 0`) | non-example separates |
| `TwoTerm d` invariants (conv. 13) | `d = 2 : ℤ → ℤ`; `d = 0` | `π₀ = ℤ/2`, `π₁ = 0`; `d = 0`: `π₀ = K₀`, `π₁ = K₁`; identity symmetry ⇒ strictly commutative | agrees |
| Deligne over a point splits | any `(π₀, π₁)` | `Ext²_ℤ(π₀, π₁) = 0` (global dimension 1), so a two-term complex is quasi-isomorphic to `π₁[1] ⊕ π₀`; `ch(0)` | agrees with line 720–721 |
| Sign `ε` of `gradedPicardGroupoid (Spec ℚ)` | `(𝒪, 1) ⊗ (𝒪, 1)` | SSF 4839–4841: symmetry = swap times `(−1)^{1·1} = −1`; swap on `𝒪 ⊗ 𝒪 ≅ 𝒪` is the identity; `ε = −1 ∈ ℚ^×`, `≠ 1` | Check 711–715 correct |
| `ε` homomorphism with `2ε = 0` | symmetric `c(x,y) = −c(y,x)` | `q(x+y) = q(x) + q(y) + c(x,y) + c(y,x) = q(x)+q(y)`; `β² = 1 ⇒ 2q = 0` | agrees with JO 260–263 |
| `IsGroupoidFibration` degenerate | `p = 𝟭`; `E = ∅` | identity: lift `f = g`; empty: vacuous | consistent with BHK §2 |
| `IsCofibrationCategory` from a model category | cofibrant objects | pushout of a cofibration between cofibrants is cofibrant; `f = (triv. fib) ∘ (cof)` gives C3 | agrees with 673–678 |
| Cisinski 2010 right derivable from Baues C1–C3 | dualise D0–D4 | D0: initial object ✓ (C1 context); D1 ✓ C1; D2 pushouts along cofibrations ✓ C2; D3 trivial cofibration cobase change ✓ C2; D4 `u = (weq) ∘ (cof)` ✓ C3 | agrees with 679–682 |
| `SatisfiesDer2`, `SatisfiesDer3` vs Groth 1.10 | `J = e` | Der2 at `e`: `f` iso iff iso ✓; Der3: `restrict D F` has both adjoints | agrees |
| Excision along sieves (Layer 5) | chain `a₀ → … → aₙ`, `aₙ ∈ U` sieve | all `aᵢ ∈ U`; `N A = N U ∪ N V`, `N U ∩ N V = N(U ∩ V)` | pushout claim holds |
| Convention 5 and conv. 1 universe | `A : Type u` small, `Cat.{u,u}` | `Functor.star A : A ⥤ Discrete PUnit.{u+1}` elaborates; `AsSmall.{u} SimplexCategory` needed for `Δ` | agrees |

**`#check` pass.** The worker's `signatures.md` served as the `#check @name` pass; no declaration's elaborated type lost a hypothesis its README statement needs (see above). After the repairs of R01, R02, R05 the file changes and the pass must be rerun.

## Not verifiable

- Brown–Heath–Kamps 1983 (JPAA): paywalled; recorded `uncertified` by the service at doi:10.1016/0022-4049(83)90049-5; sequence (1.1), Theorem 2.2, Corollaries 2.4–2.5 cited by locator alone.
- Raptis 2010 (HHA): Project Euclid returns a bot-wall page for the PDF; the Int. Press landing page is not in a licence class; listed in `needs-references.toml`. Theorem 2.6 (poset model structure Quillen equivalent to Thomason's) unchecked.
- Borceux Handbook 1 Proposition 3.4.1, Mac Lane VI.7 Theorem 1, Baues 1989 I.(1.1), Brown 1982 IV.6, Gabriel–Zisman I.1.1, Quillen 1973 §1, Heller 1988, Sính 1975, Brown–Spencer 1976, Brown 1970, Joyal–Street 1993 §3, Brown 1973 §1, Cisinski 2003, Deligne SGA 4 XVIII 1.4.15: books or paywalled journals, not fetched this round; cited for standard statements that match my knowledge of them, but their theorem numbers were not opened.
- Pursuing Stacks (arXiv:2111.01000): cited for history only; not opened.

## Source issues

- **Error** in thomason1980 at Lemma 5.3 3°, printed page 322: the source says that any retract of a Dwyer map is a Dwyer map; it should be that retracts of Dwyer maps are pseudo-Dwyer maps, which still satisfy Proposition 4.3; affects the proof (of Proposition 5.4 and Corollary 5.5); corrected in print at D.-C. Cisinski, Cahiers 40 (1999), 227–231.
- **Error** in cisinski2006 at Proposition 4.3.2, printed page 190: the source says conditions (c) (`A/(X×Y) → A/X × A/Y` is a `W`-equivalence for all `X, Y`) and (g) (`W`-equivalences of presheaves stable under finite products) are trivially equivalent; it should be that (c) ⇒ (g) only, since for `A = BG` with `G ≠ 1` and `W = W∞` the `W`-equivalences of `Â` are the isomorphisms while `A/(★×★) → A/★ × A/★` is a map from `|G|` points to a point; affects a stated result.
