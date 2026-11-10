# Review of SchemeAndStackFoundations (pull request #1656 at cc2d7b9)

**Verdict:** needs changes

This is a full review of the repaired head. The folder changed by 940 lines since `1bfff38` (896 in `README.md`, 44 in `Suggested.lean`). No file outside the folder differs from `origin/main`. The gate passes, the dependency check reports no problem, and `Suggested.lean` elaborates with only `sorry` warnings. All seven findings of the previous review are repaired.

Six findings remain, all P3 and none blocking:

- §5.7 cites a Stacks lemma that does not state the finite-resolution claim (R01).
- §1.18 cites a lemma on stacks in setoids for the 2-Yoneda equivalence (R02).
- Two single-statement Stacks locators carry the tag of their section (R03).
- §1.16's twisting bijection is cited to the sections on inverse torsors, not to the one that states the bijection (R04).
- §0.20 describes the pinned `TauCeti.Ring.IsJapanese.of_finite` without its injectivity hypothesis (R05).
- A few README-only names are still in backticks (R06).

## Previous findings (review of 1bfff38)

- **R01 (P2), Layer 0 planned what the pin proves: repaired.** §§0.1, 0.2, 0.4, 0.7, 0.8, 0.10, 0.12, 0.14 and 0.20 now open with the pinned declarations and keep only what the pin lacks. For example, §0.12 says "The henselization of a pair is Tau Ceti's … This subsection owns no target on pairs" (`README.md:1346`, `:1376`), and §0.20 says "Prove what the pins lack: *IsJapanese.of_finite_extension* in its quasi-finite case" (`:1953`). The Scope reads "the henselian-pair theorems that Tau Ceti's henselization of pairs lacks … the Nagata theorems that Tau Ceti's Japanese and Nagata predicates lack" (`:59–62`). The supplier list names the files (`:450–494`), and each subsection gives the old → new dictionary. I checked the newly cited names in Lean (see Verified sound); all resolve.
- **R02 (P2), second owner of the henselization predicate: repaired.** `IsLocalRing.IsHenselization` and `Henselization.local_henselization` are gone from `Suggested.lean`. §0.12 reads "The recognition predicate … is ModularCurves Layer 4D's `IsHenselization ψ` … This roadmap consumes them and states no second predicate" (`:1417–1427`). The three reverse-supply sentences now say "this roadmap consumes Layer 4D and supplies nothing to it" (`:124–125`) and "ModularCurves consumes nothing from this roadmap" (`:8211`). On main, `TauCetiRoadmap/ModularCurves/Suggested.lean:637–688` declares `IsHenselization`, `StrictHenselization.isHenselization`, `IsHenselization.existsUnique_comp_eq` and `IsHenselization.bijective_of_comp_eq`, and its README `:3564` records the same direction.
- **R03 (P3), `QCoh.higherDirectImage_vanishing` pinned: repaired.** The theorem is deleted, and §2.6 cites `AlgebraicGeometry.Scheme.Hom.exists_subsingleton_cohomology_of_isAffine`, `Scheme.Modules.exists_subsingleton_cohomology` and `Scheme.Hom.exists_isZero_higherDirectImage` (`:4164–4169`).
- **R04 (P3), three wrong pinned names: repaired.** `Ideal.depth_localizedModule_self` (`:1669`), `Polynomial.isCohenMacaulay_localization_atPrime` and `MvPolynomial.isCohenMacaulay_localization_atPrime` (`:1708–1709`, `:1771`) all elaborate.
- **R05 (P3), backticks and italics: repaired at every listed place.** The suffix APIs of §§0.28, 1.24, 2.1, 3.5, 3.7 and the others listed are italic, and `TauCeti.AlgebraicGeometry.IsThickening.isUniversalHomeomorphism` is backticked. A few names outside that list remain (R06).
- **R06 (P3), §2.19 locators: repaired.** "Lemma 48.17.9 (e) (0B6U) … Lemma 48.15.7 (0BRT) for `f` smooth and proper and Lemma 48.29.2 (0E9Z)" (`:4935–4937`).
- **R07 (P3), §3.7 locator: repaired.** "Yun–Zhang 2017, §5.4.1, p. 35, with the exact sequence in the proof of Proposition 6.1 (1), p. 40" (`:5814`).

## R01 (P3) — §5.7: Lemma 36.37.4 does not give finite locally free resolutions

**Location.** `TauCetiRoadmap/SchemeAndStackFoundations/README.md:7882–7884`: "for `X` Noetherian, regular (§4.13) and with the resolution property, every coherent sheaf has a finite resolution by finite locally free sheaves (Stacks, Lemma 36.37.4)".

**Claim.** Lemma 36.37.4 supports the finite resolution and the isomorphism `K_0(X) → G_0(X)`.

**Witness.** Lemma 36.37.4 (0F8H; `stacks-project`, book PDF, line 150210) is about two maps of finite complexes of finite locally free modules that agree in `D(O_X)`: they become homotopic after a quasi-isomorphism from a third such complex. It says nothing about coherent sheaves or regularity. The statements that carry the claim are Lemma 36.37.2 (0F8F, line 150188: every perfect object is a bounded complex of finite locally free modules), Lemma 36.38.4 (0FDI, line 150302: `K_0(X) → K'_0(X)` is an isomorphism for `X` Noetherian regular) and Lemma 36.38.5 (0FDJ, line 150329: `K_0(Vect(X)) → K_0(X)` is an isomorphism under the resolution property).

**Repair.** Cite "Stacks, Lemma 36.37.2 (0F8F), with Lemmas 36.38.4 (0FDI) and 36.38.5 (0FDJ)". The statement itself is true and needs no change: a coherent sheaf on a quasi-compact regular scheme is perfect (Proposition 10.110.1 (00O7) on stalks, and quasi-compactness bounds the projective dimension).

## R02 (P3) — §1.18: Lemma 8.6.3 is not the 2-Yoneda equivalence

**Location.** `README.md:3382–3383`: "`yonedaEquiv` (`Hom(h_T, X) ≃ X(T)`; Lemma 8.6.3 (0432))".

**Witness.** Lemma 8.6.3 (0432; book line 17597) says that a category fibred in setoids is a stack in setoids iff its presheaf of isomorphism classes is a sheaf. That supports the preceding item *StackInGroupoids.ofSheaf*, not the equivalence `Hom(h_T, X) ≃ X(T)`. The 2-Yoneda lemma for categories fibred in groupoids is Categories, Lemma 4.41.2 (004B; line 5611).

**Repair.** Move "Lemma 8.6.3 (0432)" to *StackInGroupoids.ofSheaf*, and cite "Categories, Lemma 4.41.2 (004B)" for the Yoneda equivalence.

## R03 (P3) — two single statements carry their section's tag

**Location.** `README.md:4061`: "Stacks, Lemma 21.11.1 (0CJZ), assumes cofinal local `H¹` vanishing"; `:3282`: "(Stacks, Definition 83.8.1 (04A9), Definition 83.10.1 (04AE))".

**Witness.** 0CJZ is Section 21.11 ("Second cohomology and gerbes", book line 92793); Lemma 21.11.1 is 0CK0 (line 92799). 04A9 is Section 83.8 ("Invariant functions", line 297323); Definition 83.8.1 is 04AA (line 297329). I checked all 550 number–tag pairs of the README by script. Apart from named statements and ranges, where the README's convention is to give the section's tag once, these are the only two single statements whose tag is not their own.

**Repair.** Write "Lemma 21.11.1 (0CK0)" and "Definition 83.8.1 (04AA)".

## R04 (P3) — §1.16: the twisting bijection is at Poonen §5.12.5.3

**Location.** `README.md:3227–3230` (*twistingBijection*) and `:3236`: "(Poonen 2017, Theorem 4.5.2, §5.12.5.1, §6.5.6.4)".

**Witness.** In Poonen's text (author's copy, cache `42e92ce4`), §5.12.5.1 (line 6477, printed p. 155) defines the inverse torsor `T⁻¹` as a `G`–`G^τ`-bitorsor. §6.5.6.4 (line 7555, p. 183) says only that `Z ×^G T⁻¹` is a right `G^τ`-torsor over `S`. The statement that subtraction of `τ` is a bijection `H¹(k, G) → H¹(k, G^τ)`, with inverse subtraction of `[T⁻¹]`, is §5.12.5.3 (lines 6517–6530, pp. 155–156). The other locators of the subsection are as cited: §5.12.5.2 at line 6494, §6.5.6 at line 7529, Theorem 4.5.2 at line 4551 (p. 106).

**Repair.** Cite "Poonen 2017, Theorem 4.5.2, §§5.12.5.1 and 5.12.5.3, §6.5.6.4", and say that over a general base the bijection is the fppf-local form of §5.12.5.3 (§6.5.6 states the constructions over `S` without that sentence). The instance: for `G` commutative, `G^τ = G` and the map is `[Z] ↦ [Z] − [T]`, a bijection sending `[T]` to the base point, which is the inverse of the README's `P ↦ P ×^{innerForm G E} E`.

## R05 (P3) — §0.20: the description of `IsJapanese.of_finite` drops the injectivity hypothesis

**Location.** `README.md:1925–1926`: "`TauCeti.Ring.IsJapanese.of_finite` (a domain finite over a Japanese domain is Japanese; Lemma 10.161.5 (032I), finite case)".

**Witness.** The pinned declaration (`TauCeti/RingTheory/Japanese.lean:228`) elaborates to `∀ (R) [CommRing R] [IsDomain R] (S) [CommRing S] [IsDomain S] [Algebra R S] [FaithfulSMul R S] [Module.Finite R S] [IsJapanese R], IsJapanese S`. Lemma 032I is stated for an extension `R ⊂ S`, and the pinned module docstring (`Japanese.lean:56`) itself says "a finite extension of a Japanese domain". Without injectivity `S` is finite over a quotient `R/𝔭`, and N-2 of `R` says nothing about `R/𝔭`: the Nagata predicate asks it of every quotient separately ("`R/p` N-2 for every prime `p`", `:1904`).

**Repair.** Write "a domain that is a finite extension of a Japanese domain is Japanese (the structure map injective, `[FaithfulSMul R S]`)". This matches the wording of the kept target *IsJapanese.of_finite_extension* at `:1953–1954` ("a quasi-finite extension domain").

## R06 (P3) — README-only names still in backticks

**Location.**
- §1.18 API (`README.md:3382–3384`): "`yonedaEquiv` …, `isFiberedInGroupoids` …, `limit`".
- §2.22 (`:5280–5281`): "`mk_eq_zero_iff` (`A ≅ End(E)`), `mk_tensor`, … `pullback f : Br(Y) → Br(X)` …, `brauer_affine_iff`".
- §5.6 (`:7693–7694`, `:7717`, `:7734`): "`functoriality`", "`gysin_self_intersection`".

**Witness.** The README's rule (`:317–320`): a backticked name is a declaration of `Suggested.lean`, of the pins, or of a roadmap named beside it. `Suggested.lean` declares none of these (its §1.18 strand is "*Lean:* none"). `isFiberedInGroupoids`, `brauer_affine_iff` and `gysin_self_intersection` occur nowhere in the pinned Tau Ceti or Mathlib sources. `yonedaEquiv`, `limit`, `mk_tensor`, `mk_eq_zero_iff` and `functoriality` are proposed API items of this roadmap that happen to share a short name with unrelated library declarations (`CategoryTheory.yonedaEquiv` is not the equivalence for stacks).

**Repair.** Set these names in italics, as the neighbouring items (*StackInGroupoids.ofSheaf*, *SchemeBrauerGroup.mk*, *divisor_case*) already are.

## Verified sound

**Gate, dependency check, elaboration and probe.**
- The worker's gate at cc2d7b9: every check `=0`, `build=0`, "OK". The folder holds `README.md`, `Suggested.lean`, `PROGRESS.md`, `STATUS.md` and `metadata.toml`, as on main. `git diff --stat origin/main...HEAD` outside the folder is empty.
- Dependency check (`gate --depcheck … --movable --pr 1656`) output: `depcheck: 234 roadmaps, 2263 edges, 0 problem(s)`. No UPWARD, CYCLE or `moved:` line.
- `lake env lean` on `Suggested.lean` exits 0 with 54 `declaration uses sorry` warnings and no other diagnostic (56 at the previous head; the two deleted theorems account for the difference).
- One-tactic probe on a scratch copy (`first | rfl | infer_instance | (simp; done) | decide | trivial | exact ⟨inferInstance⟩ | sorry` at every `sorry`, and a second pass on the three inline `by sorry`): 53 warnings remain. The only theorem that closes is `universalHomeomorphismEtaleEquivalence_functor` (`Suggested.lean:236`, by `rfl`). Its settled disposition still holds: #1276, which merges before this pull request in the stated chain, declares `_coverPreserving`, `_comp` and `_baseChange` at its head and no `_functor`.
- Signatures: the four "looks dropped `[Category.{u} A]`" flags of the worker's list are false positives; each elaborated type carries `[inst : Category.{u_1, u_2} A]`. No declaration changed its type this round (the diff of `Suggested.lean` is two deletions, two imports and the docstring).
- Form: one `public import Mathlib` followed by 20 `TauCeti.*` modules, no `set_option`, no `lemma`, no `#eval`; the module docstring names the non-statable headlines, now including the reason §0.12's 04HX is not stated.

**Library declarations opened at the pins (Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`).**
- I extracted the 284 backticked names on the added lines of the README diff and elaborated `#check @name` for the 250 that are declaration names, in a scratch file importing the cited modules whose object files exist. All resolve except names in modules without a built object file; those I read in the source with their namespaces: `TauCeti.Ring.IsUniversallyJapanese.of_finiteType`, `.isNagata`, `.isNagata_of_finiteType`, `.of_field` (`RingTheory/UniversallyJapanese.lean:95–126`), `Module.Basis.subsingleton_cohomology_twistingSheaf_of_lt_card` and `_of_neg_card_lt` (`Cohomology/ProjectiveSpace/HigherCohomology.lean:740`, `:749`), `Module.Basis.subsingleton_cohomology_proj_of_card_le` (`Vanishing.lean:87`), `TauCeti.SymmetricAlgebra.free_cohomology_zero_twistingSheaf` (`TwistingSheaf.lean:113`), `TauCeti.AlgebraicGeometry.projectiveLine.cohomologyOneTwistingSheafLinearEquiv` (`ProjectiveLine/NegativeTwist.lean:201`), `AlgebraicGeometry.Scheme.iterateFrobenius_zero`, `_succ`, `_add`, `_naturality` (`Frobenius/Iterate.lean:58–148`), `AlgebraicGeometry.Scheme.Hom.iterateRelativeFrobenius` (`Twist.lean:83`), `AlgebraicGeometry.Scheme.Modules.isQuasicoherent_image` (`Quasicoherent/Images.lean:37`), `IsLocalRing.IsGeometricallyUnibranch.of_isIntegrallyClosed_quotient` (`LocalRing/Unibranch.lean:125`). All 24 cited file and directory paths exist.
- Statements compared with the README's descriptions: the six `relativeSpec_*_iff` criteria (affine-open form, as described), `relativeSpecPushforwardIso : pushforwardStructureAlgebra A.relativeSpecToBase ≅ A`, `affineFunctions_obj_unop_obj`, `isBaseChange_pullbackSections_of_isQuasiSeparated` (flat `R → S`, compact quasi-separated open), `topologicalKrullDimAt_eq_ringKrullDim_stalk_add_toNat_trdeg_residueField`, `topologicalKrullDim_closure_singleton_eq_toNat_trdeg_residueField`, `topologicalKrullDim_pullback_Spec_map_of_field`, `Smooth.exists_etale_affineSpace` (affine open `V ∋ x`, `n` depending on the point), `exists_stage_family` (finite families), `isUnit_quotient_stage_iff`, `exists_hom_isRoot_sub_mem` (monic, simple root), `nonempty_unique_algHom_of_isNeighbourhood`, `henselianRing_iff_forall_comp_surjective`, `HenselianRing.comp_bijective`, `bijOn_quotient_mk_isIdempotentElem`, `injOn_quotient_mk_map_isIdempotentElem` (integral algebras), `Ring.DirectLimit.henselianRing` (directed preorder), `IsFiniteEtaleSplit.of_henselianLocalRing` (separably closed residue field), `existsUnique_isLocalHom`, `isNagata_iff_isJapanese` (`[Ring.KrullDimLE 1 R]`), `IsJapanese.of_isIntegrallyClosed` (`[PerfectField (FractionRing R)]`), `isFinite_fromNormalization_of_isJapanese`, `FormallyUnramified.iff_formallyUnramified_fiberToSpecResidueField`, `Hom.exists_isZero_higherDirectImage` (`[CompactSpace S]`), `Algebra.FormallyUnramified.ext_of_quotient_eq`. One description is imprecise (R05).

**Cross-roadmap citations resolved.**
- `roadmaps resolve` reports no cross-roadmap citation found nowhere. Of its 91 "Lean names found nowhere", 81 are this roadmap's own declarations (I matched each against `Suggested.lean`, including the two `_root_.IsAzumaya.*` theorems), nine are EtaleCohomologyFoundations' `VanishingCycles.*` names, and one is ModularCurves' `StrictHenselization.isHenselization` (on main, `Suggested.lean:653`).
- ModularCurves Layer 4D on main (4452ffa): README `:2009–2105`, `Suggested.lean:637–688`.

**Overlap facts.** No id this README cites is dropped by an open pull request or defined only by an open revision; this pull request drops no id that others cite. The four pull requests that change this folder are ordered in the description's merge-order block ("#1276 → **this pull request** → #1807 → #1808 → #1854"). The closest roadmaps in vocabulary (#1840, #853, #1796, #1891, #1743) were examined through `roadmaps grep` only; `IsAzumaya.exists_etale_matrix_splitting` is declared only here (and at #1276, the same folder) and is cited by ClassicalArithmeticCompletion.

**Seeded source sample.** Stacks statements were read in the book PDF text (`stacks-project`, cache `5b3a46c2`); every number–tag pair of the sampled sections was also matched by script.

| Target | Locators checked | Outcome |
|---|---|---|
| 0.7a | 00OY 33616, 00GQ 24395, 05DR 24429 re-matched; the Milne AG and CA locators were read at the previous head and the subsection is unchanged since (0 changed lines) | As cited |
| 0.23a | §59.45 230893; Theorem 59.45.1 (0BTY) 230899; Theorem 59.45.2 (04DZ) 230930; 021I 139740; 021J 139780 | As cited |
| 0.30 | 033I 113293, 033J 113299, 033K 113308, 00PD 34111, 00H8 24717, 02JE 351914, 09E4 72654, 00NR 32627 | As cited |
| 1.3 | 025Y 252169; subsection unchanged | As cited |
| 1.6 | Theorem 65.10.5 (02WW) 252549, Lemma 65.10.4 (0265) 252468 (affine `U`), Lemma 65.9.1 (0262) 252333, Definition 65.9.3 (0263) 252354 | As cited |
| 1.14 | Definition 78.11.1 (043W) 288053 (quintuple, groupoid on `T`-points), Definition 78.16.2 (0448) 288576 (`j⁻¹(Δ)`) | As cited |
| 1.16 | Poonen (cache `42e92ce4`): Theorem 4.5.2 line 4551, §5.12.5.1 line 6477, §5.12.5.2 line 6494, §5.12.5.3 line 6517, §6.5.6 line 7529, §6.5.6.4 line 7555 | One locator incomplete (R04) |
| 1.18 | 026F 17375, 02ZI 17529, 0432 17597, §8.8 (02ZM) 17740, 02ZN 17743, 0435 17873, 04W9 17895, §8.9 (02ZO) 17937, 02ZP 17939, 026G 17441, 02ZL 17569, §4.31 (003O) 4079 | One misplaced (R02) |
| 1.19 | 02ZW 322257, §94.10 (03YJ) 322405, 026O 322589, 03YO 322627, 04T2 322802, Theorem 101.21.6 (06N3) 337969 | As cited |
| 3.5 | 0BCY = Lemma 31.18.2 (128028), 0BCZ = Lemma 31.18.3 (128045), 0BD2 = Lemma 31.18.6 (128084; degree `d ≥ 1`) | As cited |
| 3.6 | `bhargava-gross-wang-2017` §3 heading line 367, Proposition 21 line 414 (p. 10), the Brauer injection line 409; the Milne AV locators were read at the previous head and the subsection is unchanged since | As cited |
| 4.5 | Definition 98.22.1 (07YG) 330173, Definition 90.3.2 (06GD) 311826 | As cited |
| 4.16 | Definition 29.52.12 (0AB0) 121479 (integral `X`, `Y`), Lemma 72.8.5 (0DMN) 272366; de Jong (Numdam copy, cache `9e4e7dab`) 2.20 line 407, Lemma 5.4 line 1069 | As cited |
| 5.1 | Definition 42.8.1 (02QR) 176385, Lemma 42.7.5 (02QO) 176351, Section 42.19 (02RV) with Definition 42.19.1 at 176998 and Remark 42.19.6 at 177101, Section 42.24 (02SI) 177661 | As cited; Fulton under Not verifiable |
| 5.7 | Lemma 36.37.4 (0F8H) 150210, Lemma 53.15.5 (0C1M) 212337, Proposition 10.110.5 (00OC) 33250 | One wrong (R01) |

**Adversarial table.** One row per statement; values computed this round.

| Statement | Instances tried | Values on each side | Result; change |
|---|---|---|---|
| `exists_linear_normalization` and its finite-field control | `𝔽₂[X,Y]/(XY(X+Y))`, `z = x²+xy+y²` | `x³ − zx = −x²y − xy² = −xy(x+y) = 0`; the three linear forms `x`, `y`, `x+y` each vanish on a component | Pass |
| §0.2 pinned criteria | `A = O_S`; `A = O_S/I` | `Γ(X,U) → Γ(A,U)` bijective, so closed immersion and finite; surjective, so closed immersion | Pass |
| §0.12 `Scheme.strictLocalRing` and its two theorems | `Spec 𝔽_p`, `s : Spec 𝔽̄_p → S`; Zariski stalk of `ℤ_(5)` | fibre `= 𝔽̄_p`, henselian with separably closed residue field; `x²+1` has roots `2, 3` mod 5 (`4+1 = 5`, `9+1 = 10`) and none in `ℚ` | Pass |
| §0.12 *isHenselization_strictLocalRing* on Layer 4D's predicate | `S = Spec k`, `k` separably closed; `ψ` not surjective | `strictLocalRing s = k`, `ψ = 𝟙` surjective, `k` ind-étale over `k`; a non-surjective `ψ` fails the third field | Pass |
| §0.14 *henselian_pair_characterisations* | `I = R`; `(ℤ_p, (p))`, `S = ℤ_p × ℤ_p` | `I ≤ jacobson` forces `R = 0`, all four conditions hold; idempotents `{0, 1, (1,0), (0,1)}` on both sides | Pass; conditions (1)–(4) of 09XI |
| §0.14 permanence, pinned cases | quotient `ℤ_p → 𝔽_p`; `∏` of two copies | `(𝔽_p, 0)` henselian; `(ℤ_p², (p)²)` henselian | Pass |
| §0.20 pinned `isNagata_iff_isJapanese`, Check *test_not_japanese_dvr* | a field; a non-Japanese DVR | dimension `0 ≤ 1`, both sides true; N-1 and not N-2, so not Nagata | Pass |
| §0.20 `IsJapanese.of_finite` as described | `R → R/𝔭`, non-injective | the pinned statement requires `[FaithfulSMul R S]` | R05 |
| §0.23a `Scheme.Hom.etaleSite`, `isEquivalence_etaleSite` | `f = 𝟙`; `Spec 𝔽_{p²} → Spec 𝔽_p` | identity; `End` of `Spec 𝔽_{p²}` over `𝔽_p` has 2 elements, of its base change (two points) 4, so not full | Pass |
| §1.6 *etaleQuotientTheorem* | `U ⊔ U` with the fold kernel pair | quotient `h_U` | Pass |
| §1.14 groupoid laws | arrows `(target, source)`: `r = (1,0)`, `i(r) = (0,1)`; monoid `{1, z}`, `z² = z` | `c(r, i r) = (1,1) = e(t r)`, `c(i r, r) = (0,0) = e(s r)`; `z∘i(z) ∈ {z}` never `1` | Pass; inverse law excludes the monoid |
| §1.14 *stabilizer* | `𝔾_m` on `𝔸¹`; `μ_p` in characteristic `p` | `{λx = x} = Spec k[x, λ^{±1}]/((λ−1)x)`; `k[λ]/(λ−1)^p` at the origin | Pass |
| §1.16 *contractedProduct*, *twistingBijection* | `P = X = Spec L`, `L/K` quadratic; `G` commutative | `L ⊗ L = L × L`, diagonal action, quotient `Spec K ⊔ Spec K`; presheaf quotient has no `K`-point; `[Z] ↦ [Z] − [T]` bijective | Pass; locator R04 |
| §1.18 *Stack.stackification* Checks | circle with `A = B(C₂)` | trivial cover has 2 components, `z ↦ z²` has 1: two classes against one in `B(C₂)` | Pass |
| §1.19 *IsDeligneMumford* | `Bμ_p` over `𝔽_p`; `B𝔾_m` | diagonal has fibre `μ_p`, ramified; fibre `𝔾_m`, not unramified | Pass |
| `isAffine_of_H1_vanishing` | `ℙ¹` | `H¹(O(−2)) = k ≠ 0` | Pass |
| §2.6 pinned twisting-sheaf vanishing | `ℙ¹`, `d = −1`; `d = −2` | `d > −n−1 = −2`: `H¹ = 0`; `d = −2`: `H¹ = k`, the kept top-degree target | Pass |
| `noetherianSpace_vanishing` | point; spectrum of a DVR | `H^p = 0` for `p > 0`; `p > 1` | Pass |
| Nisnevich carriers | `Spec ℂ → Spec ℝ`; `ℤ[1/2][x]/(x²+1)` at `(5)` | residue degree 2, rejected; `x²+1 = (x−2)(x−3)` mod 5 | Pass |
| `nonempty_CH_coprod` | `∐_ℕ Spec κ`, `k = 0` | `∏_ℕ ℤ` on both sides | Pass |
| §3.5 *lineBundleNorm* | `z ↦ z²` on `ℙ¹`; hyperelliptic `π` | `Norm O(1) = O(1)`, `Norm(π^*O(1)) = Norm O(2) = O(2) = O(1)^{⊗2}`; `det π_*O_C = O(−g−1) ≠ O` | Pass |
| §3.6 *picardComponent* | pointless real conic | `Pic(X) = 2ℤ`, `Pic_{X/ℝ}(ℝ) = ℤ`, cokernel `ℤ/2 = Br(ℝ)` | Pass |
| §4.5 *ObstructionTheory* | `Λ[[t]]/(t²)`, `t ↦ ε`; `ε ↦ 2ε` | lift to `k[ε]/(ε³)` needs `(ε + aε²)² = ε² = 0`, false; kernel `(ε²)` scaled by 4, so `v = 4v`, `v = 0` over `ℚ` | Pass |
| §4.16 `IsAlteration` | Frobenius of `𝔸¹_{𝔽_p}`; `Spec ℤ[i] → Spec ℤ`; `Spec k → Spec k ⊔ Spec k` | degree `p`, inseparable; degree 2, separable; not dominant | Pass |
| §5.1 *ratEquiv_mem_iff*, *CH_coprod* | `∐_ℕ 𝔸¹` with `Σ[0_n]` | locally finite supports, `div(t_n) = [0_n]`, class 0; `CH_0 = ∏ 0 = 0` | Pass |
| §5.7 *K0.toG0* | nodal cubic, `L_λ`; `ℙ¹ → Spec k` | both `L_λ` and `O_C` are kernels of `ν_*O → k(q)`, so equal in `G_0`, with `det ≠ O` in `K_0`; `χ(O(n)) = n+1` | Pass; locator R01 |
| §5.7 *chow_blowup_formula* | point in `ℙ³`, `d = 3` | `k = 1`: `j_*(ξ ∩ [ℙ²])`; `k = 2`: `j_*[ℙ²]`; degrees `k − i + (d−1) − (d−1−i) = k` | Pass |
| `weil_bound` | `y² + y = x³` over `𝔽₂` | `x = 0`: 2 points, `x = 1`: 0, infinity: 1; `|3 − 3| = 0 ≤ 2√2` | Pass |
| Curve headlines | étale double cover of genus 2 | `g' − 1 = 2(2 − 1)`, `g' = 3` | Pass |
| Brauer headlines | `ℍ/ℝ`, `B = ℂ` | `ℂ ⊗ ℍ ≅ M₂(ℂ)`, `d = 2`, rank `4 = d²` | Pass |

**Declared gaps.** None are declared (no readable `design/plan.json`), and the README states no `What <Supplier> must provide` contract.

## Not verifiable

- Fulton 1998 (§5.1: Proposition 1.6, §1.3, §2.1; §5.7: §15.1, Examples 15.1.5 and 15.1.8, Theorem 6.7 for the blow-up decomposition): no legal copy in the sources cache.
- SGA 6, Exposé 0, Appendice, Thomason–Trobaugh Exercise 8.6 and the Hoyois lecture note (§5.7): not fetched in this review.
- Hartshorne 1977 and de Jong 1996 beyond the two passages above: settled as uncertified.
- Milne AG, Milne CA (§0.7a) and Milne AV (§3.6): not re-read this round; the subsections are textually unchanged since the head at which the previous review read them.
- Outside the sample I checked Stacks number–tag agreement for the whole README by script, but did not re-read the statements.

## Source issues

- none
