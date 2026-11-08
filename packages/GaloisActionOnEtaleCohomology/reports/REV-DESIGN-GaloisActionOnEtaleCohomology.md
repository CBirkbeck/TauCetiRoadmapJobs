<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/6908#issuecomment-6674028171 -->
Review (claude) of 2ddfac2

Verdict: needs_changes

1. **F01** (P3) §3.1 Check claims the product topology and compactness for `∏_m ℤ_ℓ`

   Location: `packages/GaloisActionOnEtaleCohomology/design/README.md` line 372: "the naive `H⁰(X_C, ℤ_ℓ) = ∏_m ℤ_ℓ` carries the product topology: it is compact but not finitely generated".

   Claim: the inverse-limit topology of the discrete groups `H⁰(X_C, ℤ/ℓ^n) = ∏_m ℤ/ℓ^n` on `lim_n ∏_m ℤ/ℓ^n = ∏_m ℤ_ℓ` is the product topology and compact.

   Witness: the basic open subgroups of the inverse-limit topology are the kernels of `∏_m ℤ_ℓ → ∏_m ℤ/ℓ^n`, that is `ℓ^n ∏_m ℤ_ℓ`; in the product topology every open subgroup contains `∏_{m > M} ℤ_ℓ` for some `M`, so `ℓ ∏_m ℤ_ℓ` is not product-open. The quotient `∏_m ℤ_ℓ / ℓ ∏_m ℤ_ℓ = ∏_m ℤ/ℓ` is an infinite discrete quotient, so the inverse-limit topology (the `ℓ`-adic topology) is not compact.

   Repair: replace the sentence by "the naive `H⁰(X_C, ℤ_ℓ) = ∏_m ℤ_ℓ` carries the `ℓ`-adic topology with open subgroups `ℓ^n ∏_m ℤ_ℓ`, strictly finer than the product topology and not compact (`∏_m ℤ/ℓ` is an infinite discrete quotient); it is not finitely generated, so the inverse-limit topology is not that of a finitely generated `ℤ_ℓ`-module". The conclusion the Check draws is unchanged. Same change in `design/plan.json`, target 3.1, test on the countable union.

2. **F02** (P3) §1.1 composition Check is vacuous on a cyclic cubic extension

   Location: `packages/GaloisActionOnEtaleCohomology/design/README.md` line 185: "The composition law reverses the order: ... `L/K` cyclic of degree three ... `(a ∘ b)^♮ = b^♮ ∘ a^♮` is checked on the indicator of a point."

   Claim: the Check pins the order of composition.

   Witness: on `H⁰(Spa(L ⊗_K C), ℤ) = ℤ³` the maps `a^♮ = ρ(σ)` and `b^♮ = ρ(τ)` act through `Gal(L/K) ≅ ℤ/3`, which is abelian, so `b^♮ ∘ a^♮ = a^♮ ∘ b^♮`; the Check holds for the wrong order too. With `L/K` Galois with group `S₃` (for `K = ℚ_2`, the splitting field of `x³ − 2`), `σ, τ ∈ G_K` restricting to an element `s` of order 2 and `r` of order 3, `ρ(σ)ρ(τ)` sends the indicator of the identity embedding to that of `sr` and `ρ(τ)ρ(σ)` to that of `rs ≠ sr`.

   Repair: replace the cyclic cubic example by the `S₃` example above, stating the two distinct values `δ_{sr}` and `δ_{rs}`; §1.2's second Check already uses `S₃` and can be cited. Same change in `design/plan.json`, target 1.1, test "composition".

3. **F03** (P3) §1.3 Check names `ρ(τ)` where the map is `ρ(τ⁻¹)`

   Location: `packages/GaloisActionOnEtaleCohomology/design/README.md` line 222: "In (f), if `K̄′ = K̄` and `τ ∈ G_K`, the isomorphism is `ρ(τ)` (up to the identification) and the statement reduces to `ρ(τ)⁻¹ ρ(τστ⁻¹) ρ(τ) = ρ(σ)`."

   Claim: the comparison isomorphism `id_X × Spa(τ̂⁻¹)` induces `ρ(τ)`.

   Witness: by the definition of §1.2, `id_X × Spa(τ̂⁻¹) = (τ⁻¹)_X`, whose `♮` is `ρ(τ⁻¹) = ρ(τ)⁻¹`. The displayed identity is the one obtained from `g^♮ = ρ(τ)⁻¹` (from `ρ(σ) g^♮ = g^♮ ρ(τστ⁻¹)`); with `g^♮ = ρ(τ)` it would read `ρ(σ) = ρ(τ) ρ(τστ⁻¹) ρ(τ)⁻¹ = ρ(τ²στ⁻²)`, which is false for non-commuting `σ, τ`.

   Repair: write "the isomorphism is `ρ(τ⁻¹) = ρ(τ)⁻¹`"; keep the displayed identity.

4. **F04** (P3) the letters `K` and `L` denote both fields and complexes

   Location: `packages/GaloisActionOnEtaleCohomology/design/README.md` line 191 ("Let `X` be a rigid `K`-space ... For `K ∈ D⁺(X_ét, Λ)`"), line 209 ("`K, L ∈ D⁺(X_ét, Λ)`") against line 215 ("for a finite extension `L ⊆ K̄` of `K`"), line 448 ("`Y = ℙ¹_K` and `K = ℤ/n`"); also lines 171, 256, 274, 287, 307, 438.

   Claim: style; the base field `K` and the coefficient complex `K` are used in one sentence, and in §1.3 the complex `L` and the finite extension `L` in one target.

   Witness: line 448 reads "`Y = ℙ¹_K` and `K = ℤ/n`", which as written sets the field equal to `ℤ/n`.

   Repair: rename the complexes throughout (for instance `𝒦, ℒ` or `M, N`), in the README and in the statements of `design/plan.json`.

5. **F05** (P3) locator slips: Berkovich printed pages and Mathlib line numbers

   Location: `packages/GaloisActionOnEtaleCohomology/design/README.md` line 442 and line 518 ("Theorem 7.1.1, page 125 ... Corollary 7.5.4, page 147"); lines 56–61 and 66 (Mathlib and Tau Ceti line numbers).

   Claim: the pages and lines cited are the printed pages and the pinned lines.

   Witness: in berkovich1993 the extraction's page markers are offset by three from the printed pages: marker 125 (line 4578) heads printed page 128, marker 140 (line 5087) heads printed page 143, marker 147 (line 5326) heads printed page 150. So Theorem 7.1.1 (line 4584) is on printed page 128, Corollary 7.4.4 (line 5110) on printed page 143 as stated, Corollary 7.5.4 (line 5339) on printed page 150. At the pins: `IntermediateField.fixingSubgroup_isOpen` is `Mathlib/FieldTheory/KrullTopology.lean` line 170 (README: 169); `spectralNorm.normedField` is `Mathlib/Analysis/Normed/Unbundled/SpectralNorm.lean` line 755 (README: 828); `UniformSpace.Completion.instField` is `Mathlib/Topology/Algebra/UniformField.lean` line 148 (README: 145); `IsAlgClosed.of_denseRange` is `Mathlib/Analysis/Normed/Field/Dense.lean` line 46 (README: 45); `continuousSMul_iff_stabilizer_isOpen` is `Mathlib/Topology/Algebra/MulAction.lean` line 299 (README: 285); `TauCeti.PadicTateTwist` is `TauCeti/RingTheory/RootsOfUnity/PadicTateTwist.lean` line 88 (README: 69).

   Repair: write pages 128 and 150 for Theorem 7.1.1 and Corollary 7.5.4 (README lines 442 and 518, and the design report's "printed page" remark), and the six line numbers above.

6. **F06** (P3) manifest and board vocabulary in the roadmap text

   Location: `packages/GaloisActionOnEtaleCohomology/design/README.md` lines 44, 256, 287, 322, 380, 442, 475, 516, 517, 524, 525 (the word "uncertified"); line 36 ("later in the merge order"); line 361 (the label "API:").

   Claim: house style; a reader a year from now should not see the sources service's status words or the board's merge order in the roadmap.

   Witness: among the roadmaps on main only `TauCetiRoadmap/FlagVarieties/README.md` uses the word "uncertified"; the status lives in `sources.toml`. "Later in the merge order" refers to the board, not to the mathematics. The brief's README shape asks for prose bullets without `API:`-style field labels.

   Repair: drop "uncertified" from the citations and the References (the manifest records the status); replace line 36's parenthesis by "which this roadmap does not supply"; replace "API:" at line 361 by a sentence such as "Prove the following."

7. **F07** (P3) the gap entry should record what ClassicalAdicEtaleCohomology §11.1 already provides

   Location: `packages/GaloisActionOnEtaleCohomology/design/README.md` line 101 and line 478; `design/plan.json`, `gaps[0].detail`.

   Claim: "§9.7 states this for smooth proper `X` only", so the whole proper non-smooth case is missing from the supplier.

   Witness: ClassicalAdicEtaleCohomology §11.1 at the head of its pull request (its README line 5626) states, after Huber (1996) Proposition 6.1.1: for `(X, Σ) → Spa(k, k⁺)` qcqs with `k` separably closed and complete, `f` locally algebraically of finite type, `B` noetherian killed by `n` prime to the residue characteristic and `F` constructible, every `H^q((X, Σ), F)` is finitely generated; the supplier applies it to closed balls (its line 5665). So the proper spaces that are locally algebraically of finite type are already covered, and the gap is the remainder.

   Repair: in the README gap bullet and `gaps[0].detail`, add one clause: "§11.1 proves finiteness for qcqs spaces that are locally algebraically of finite type; the gap is the proper spaces without such a presentation"; in §4.4(d), cite §11.1 for the locally algebraic subcase. The `needs` sentence (the general proper statement) stays as it is, since it is the form the supplier should state. The gap remains precise, owned and declared in both files.

Needs changes: seven findings, all P3 and none blocking, for a fix round to apply before the package stage. The declared supplier gap `proper-rigid-finiteness` (ClassicalAdicEtaleCohomology §9.7) is a stated contract, not a finding. No previous review exists.

## Verified sound

**Principles.** No route-specific shortcut: `K` is any complete rank-one non-archimedean field in any characteristic, `Λ` any ring, torsion only where used. No re-planned roadmap: the action `ρ` is constructed nowhere on main, in the board packages or at the open heads (`roadmaps grep` for "Galois action on … cohomology", "`id_X × Spec`", "`id_X × Spa`", "`σ_X :=`", "continuous automorphisms of" returned only consumers' remarks). The adic descent-data action is correctly left to EtaleCohomologyFoundations §F.4.6 (main, lines 1089–1106) with §2.6 as the bridge. Ownership against open pull requests: EllAdicRealization (pull request #196, not on main, not in the merge order) plans in its Layer 8 a continuous ℤ_ℓ/ℚ_ℓ Galois action on scheme cohomology; that overlaps the cited owner §F.4.6, not this roadmap's finite-coefficient action, and it cannot be cited as a supplier. The remaining open pull requests were covered by `roadmaps grep`. No copied passage (every statement is the author's), no algorithm, no sorry'd data or `set_option` (no Lean file at this stage).

**Dependency check.** Run as the brief prescribes:

    candidate: GaloisActionOnEtaleCohomology is not in the merge order yet; checked as if placed after PadicDifferentialEquationsAndRigidCohomology (the intake inserts it when its design is accepted)
    depcheck: 241 roadmaps, 2315 edges, 0 problem(s)

No UPWARD or CYCLE line. Every supplier is on main or earlier in the order: ClassicalAdicEtaleCohomology (53), AInfCohomology (54), ArithmeticGaloisRepresentations (42), PadicPeriodRings (18), PadicDifferentialEquationsAndRigidCohomology (111, the last supplier); the consumers named (PadicHodgeTheory 113, WeightsInEtaleCohomology 137, CohomologyComparisons 168, ClassicalAdicEtaleCohomologyPartII 213, and the rest) are all later.

**Cross-roadmap citations resolved** (section present where cited, statement as used):

- AdicEtaleGeometry (main): A1.1 (line 2285), A1.6 (3259; `AdicSpace.smallEtale.map`, `etaleSheafPullback`, `etaleSheafPushforward`, `smallEtale.mapComp` at 3282–3286), A1.7 (3670; `GeometricPoint` in the table at 619), A1.14 (5511; *etale-descent-along-algebraic-extension* stated for `L/K` separable algebraic with finite subextensions and qcqs `X` locally of finite type, the 2-colimit equivalence, and *proetale-field-extension-slice* at 652).
- AdicSpacesPartII (main): R0.6 (3085), R0.7 (3557, *fibre-products-existence* 3702), R1.1 (8427), R1.2 (8542). AdicSpacesPartIV (main): R4 (562; *proetale-site-functoriality* at 675 for locally noetherian analytic adic spaces).
- ClassicalAdicEtaleCohomology (#875): §1.1 (field equivalence with discrete `Λ[Gal(K^sep/K)]`-modules and `Hⁿ(X, F) ≅ H^n_cont`, lines 134, 202), §1.3 (Hochschild–Serre (a) finite and (b) pro-finite-étale torsors under (★), colimit formula, unit `F ≅ Rν_*ν^*F`, `Ẑ_p = lim_r ν^*ℤ/p^r` with `Rlim` concentrated in degree zero; lines 363–405), §1.4 (`μ_n`, `Λ(r)`, `g⁻¹(F(r)) ≅ (g⁻¹F)(r)`, `(μ_n)_ξ ≅ μ_n(C)`, Kummer; 527–546), §1.5 (colimit-presented tilde-limits with finite-stage detection, base change along qcqs locally-weakly-finite-type maps, the colimit theorem for abelian sheaves and bounded-below complexes with a final object, the stalk formula; 585–659), §7.1 (geometric field pairs and `Spa` of extensions; 3723–3754), §8.2 (Huber 3.7.2 for a locally ringed `R → S`, proper `f`, torsion `Λ`, "`p`-torsion over a mixed-characteristic field is allowed"; 3996–4003), §8.4 (`R^q f_* F = 0` for `q > 2d`, every `n > 0`; 4310), §9.7 (`G_K`-equivariant trace for `n` invertible in `K`; finiteness for proper smooth `X/C` and `n` invertible in `O_C`, Berkovich 7.4.4; 5155–5169), §11.1 (see R07).
- SchemeAndStackFoundations (main): §0.23a (1508, `universalHomeomorphismEtaleEquivalence`), §1.10 (2320, `smallEtale_map_comp`, *smallEtale_ofScheme*), §2.1 (3265; `Sheaf.H.pullback` with `pullback_comp`, `pullback_δ`, `pullback_naturality`, `higherDirectImage_iso_sheafify`), §2.2 (3309, `leray_spectral_sequence`), §2.15 (3867; `etale_galois_comparison` with `galoisModule`, `etale_cohomology_limits` for cofiltered limits with affine transitions, `hochschildSerre_galois_covering` including the profinite version, `limits_test_separable_closure`), §2.16 (`curve_Gm_cohomology`, 3902).
- EtaleCohomologyFoundations (main): §F.0.3 (231), §F.0.4 (248), §F.1 (457–503, cup products in `finiteCoefficientCohomology` at 480), §F.2.1 (504, proper base change for arbitrary torsion, no invertibility), §F.3 (676, `etaleFiniteness` at 692 for finite `Λ` with `N` invertible), §F.4.0 (850, `ContinuousRep` on a finite projective module with the module topology), §F.4.1 (959), §F.4.6 (1089), §F.10.2 (940, with the Checks the design quotes), §F.10.2b (1108).
- ProfiniteCohomology (main): Layer 0 (583), Layer 1 (630, `continuousCohomology` on `TopRep`), Layer 10 (1549). EnhancedDerivedSheaves (main): §0.3 (455; `tensorHom`, `inverseLimits`), §0.4 (492; `functorCoherence`). DerivedModuleAlgebra (main): §1.T.1 (1403; `lim`, `lim¹`, Milnor).
- ArithmeticGaloisRepresentations (#856): §1.1 (707, `ContinuousRep` of §F.4.0 with `G_F` and the Krull topology), §1.2 (805; *TateTwist.zlOne* `:= ofCharacter χ_ℓ` identified with `PadicTateTwist ℓ F̄` for `ℓ ≠ char F`, `tateTwist`, `det M(n) = det M · χ_ℓ^{n·rank}`; 894–906).
- AInfCohomology (#1044): §AI.3.1, `AInf.primitive_mod_p_comparison` (line 2019): proper smooth `X/C`, `𝔽_p`-local system, finite-dimensional, vanishing above `2 dim X`.
- PadicDifferentialEquationsAndRigidCohomology (#1002): §RD.0.33 (1536): completion of `F̄` algebraically closed, no characteristic hypothesis, via continuity of roots and `IsAlgClosed.of_exists_root`.
- PadicPeriodRings (#940): §1.1 `completedGaloisAction` (`UniformSpace.Completion.map σ`, line 92) and `completedGaloisAction_continuous` (236); §2 *PadicFieldCompletion* (292).
- Consumers' sections exist at their heads: PadicHodgeTheory §2.7 (its line 600, which extends finiteness to singular proper `X/C` as the Scope says) and Layer 8 (1377); WeightsInEtaleCohomology §§1.7–1.8 (233, 245) and Layer 2 (273); ClassicalAdicEtaleCohomologyPartII §§5.3–5.9 (1047–1150) and §7.5 (1251).

**Library declarations opened at the pins** (file and line): `Field.absoluteGaloisGroup` (`Mathlib/FieldTheory/AbsoluteGaloisGroup.lean` 42, `:= AlgebraicClosure K ≃ₐ[K] AlgebraicClosure K`), `absoluteGaloisGroup.mapOfAlgebra` (59); `IntermediateField.fixingSubgroup_isOpen` (`KrullTopology.lean` 170, finite-dimensional `E`); `spectralNorm` (381), `spectralNorm_eq_of_equiv` (451, `Gal(L/K)` isometry), `spectralNorm_extends` (573), `spectralNorm_unique` (699, `[CompleteSpace K]`, power-multiplicative `f`), `spectralNorm.normedField` (755); `UniformSpace.Completion` (291), `.map` (477), `map_unique` (491), `map_id` (496), `map_comp` (506), `ext` (414); `instField` (`UniformField.lean` 148); `IsAlgClosed.of_denseRange` (`Dense.lean` 46, with `[CharZero L]` as the README says); `Polynomial.exists_roots_norm_sub_lt_of_norm_coeff_sub_lt` (`Approximation.lean` 52, any `NormedField`, `g` splits, no completeness) and that file's TODO on separable approximation (28–30); `IsAlgClosed.of_exists_root` (`IsAlgClosed/Basic.lean` 182); `SeparableClosure` (`IsSepClosed.lean` 348); `TopRep` (`TopRep.lean` 31: `AddCommGroup`, `Module k`, `IsTopologicalAddGroup`, `ContinuousSMul k`, `ρ : ContRepresentation k G V`), `TopRepEquivActionTop` (212); `continuousSMul_iff_stabilizer_isOpen` (`MulAction.lean` 299, `[DiscreteTopology X]`); `Scheme.smallEtaleTopology` (`Sites/Etale.lean` 50); `Sheaf.H` (`SheafCohomology/Basic.lean` 56) and `H.map` (112); `PadicAlgCl` (`Padics/Complex.lean` 54), `PadicComplex` (137, `UniformSpace.Completion (PadicAlgCl p)`), `PadicComplex.isAlgClosed` (244, through `of_denseRange`); `Scheme.EllAdicCohomology` exists (`Sites/ElladicCohomology.lean`) and is unused, as stated. Tau Ceti: `continuousLocalCyclotomicCharacter` (`Cyclotomic/Character.lean` 54), `IsArithFrobeniusLift.coe_localCyclotomicCharacter` (`Inertia/Cyclotomic.lean` 61: value `Nat.card 𝓀[K]` for `p` coprime to the residue characteristic), `IsArithFrobeniusLift` (`Inertia/Basic.lean` 336), `PadicTateTwist` (88, `TateModule p (Additive Kˣ)`). Tau Ceti has no étale cohomology of schemes or adic spaces and no Galois action on it (grep of the pinned tree), as the README's Tau Ceti contract says. Backticked names attributed to suppliers that `roadmaps resolve` could not find in the libraries (`AdicSpace.GeometricPoint`, `AdicSpace.etaleSheafPullback`, `ClassicalDerived.*`, `VanishingCycles.*`, `AInf.primitive_mod_p_comparison`) are roadmap names and were found in their roadmaps at the lines above.

**Sources, the seeded sample** (all read at the locator; certified texts only):

- 0.1, 0.2, 0.3, 1.2: dejongvanderput1996 §3.6, lines 1476–1492 (page 36): `C` as the completion of `k^sep`, algebraically closed, `G` identified with the continuous automorphisms, the morphism `Φ_σ : X_C → X_C` not over `C` unless `σ = 1`, the action on `H^i(X_C, α^*S)`, and the announced agreement with `(R^i p_* S)_e` for quasi-compact `X`. Supports the statements as written.
- 1.4: milneLEC §12 (pages 81–84, lines 3211–3344: Hochschild–Serre for a variety over `k` with `G = Gal(k^sep/k)`), §17 (page 114, Corollary 17.8(b) at line 4531: `H^r(X, F) = H^r(X_{k′}, F)` for complete `X` and separably closed `k′ ⊇ k`); stacks03N1 Tag 03QW (lines 3963–3976: the stalk action `(U, ū, t) ↦ (U, ū ∘ Spec(σ), t)` and its proof of being a left action). Supports the statements.
- 2.1: dejongvanderput1996 Corollary 3.7.5 and proof, lines 1594–1610 (page 39): any quasi-compact `X`, any abelian sheaf, the discrete `G`-action from Theorem 3.7.3. Supports the torsion-free generality the design adopts.
- 2.2: stacks03N1 Theorem 53.1, Tag 03Q9, line 3733, for qcqs `f` and `K ∈ D⁺`. Supports.
- 2.4: stacks03N1 Tags 03Q9 (3733), 03QW (3963), 03QQ (4216–4234: `F ↦ F_s̄` an equivalence with `Mod_G`, `H^q(S, F) = H^q(G, M)`). Supports.
- 2.5: dejongvanderput1996 Corollary 3.7.5 (1594). Supports.
- 3.1, 3.3, 4.3: hansenzavyalov2023 proof of Theorem 3.3.2, lines 1706–1709 (page 39): `H^i(ℚ_ℓ) = H^i(ℤ_ℓ)[1/ℓ]`, `H^i(ℤ_ℓ) = lim_n H^i(ℤ/ℓ^n)`, vanishing above `2d` by Huber Corollary 2.8.3. Supports; the theorems 3.3.1–3.3.2 themselves (1684, 1702) are the quasi-unipotence the design does not claim. milneLEC §19, page 123 (lines 4780–4853): finiteness theorem and sheaves of `ℤ_ℓ`-modules, including the `∏ ℤ_ℓ` example.
- 4.1: stacks03N1 Example 59.3, line 4241 (`μ_n` corresponds to `μ_n(K^sep)` with its `G`-action); zavyalov2025 §5.4, lines 3798–3802 (page 78 of arXiv v3): sheaves of `𝔽_p`-modules on `Spa(K, O_K)_ét` as continuous `G_K`-representations and the Galois-equivariant trace `t_X`; Remark 5.4.1 and Theorem 5.4.2 at 3803–3806. Supports.
- 4.2: berkovich1993 Theorem 7.1.1 (line 4584: compactifiable scheme, abelian torsion sheaf, `H^q_c` comparison; printed page 128, see R05), Corollary 7.5.4 (5339: constructible sheaf with torsion prime to the residue characteristic; printed page 150); milneLEC §21 page 130 (complex comparison, background only). Supports the proper case with any torsion through 7.1.1.
- 4.4: berkovich1993 Corollary 7.4.4 (5110, printed page 143: `k` algebraically closed, `X` proper smooth, finite locally constant `F`, finite `H^q`); scholze2013 Theorem 5.1 (1279, page 28: proper smooth over `Spa(K, K⁺)`, `K` algebraically closed complete over `ℚ_p`, `𝔽_p`-local system, finite-dimensional, vanishing above `2 dim X`). Supports (a) and (b) exactly.

**Adversarial pass** (the sampled targets, the headline statements and the targets touched by findings):

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| Convention `ρ(σ) = c_σ ∘ σ_X^*` is a left action | `Spa` contravariant | `Spa((στ)^) = Spa(τ̂) ∘ Spa(σ̂)`, so `(στ)_X = τ_X ∘ σ_X`; with `(a∘b)^♮ = b^♮ ∘ a^♮`: `ρ(στ) = (τ_X ∘ σ_X)^♮ = σ_X^♮ ∘ τ_X^♮ = ρ(σ)ρ(τ)` | left action | none |
| Witness on `μ_n` | `Y = Spa(C)`, `V = Spa(K[T]/(T^n−1))`, `a = Spa(σ̂)` | `Hom_X(Y, V) = μ_n(C)`; `s ∘ a` corresponds to `σ̂ ∘ (T ↦ ζ)`, so `a^♮(ζ) = σ(ζ)`; stalk rule `(V, v̄) ↦ (V, v̄ ∘ Spa σ̂)` sends the class `ι(ζ)` to `(σ̂ ∘ ι)(ζ) = σ(ζ)` | both conventions give `ζ ↦ σ(ζ)`, agreeing with Stacks 03QW/59.3 | none |
| 0.1 density of `K^sep` | `a ∈ K̄`, `a^{p^e} = b ∈ K^sep`; `K = 𝔽_p((t))`, `a = t^{1/p}` | `g_t = X^{p^e} − tX − b` has `g_t′ = −t ≠ 0`, roots in `K^sep`; by `exists_roots_norm_sub_lt_of_norm_coeff_sub_lt` a root within `((n+1)|t|)^{1/n} max(|a|,1) → 0` | true, no completeness of `K̄` needed | none |
| 0.1 tilde-limit | `x ∈ 𝒪_L`, `|x| ≤ |ϖ|^n` | `x/ϖ^n ∈ 𝒪_L`, so `𝒪_L ∩ ϖ^n 𝒪_{K^sep} = ϖ^n 𝒪_L`; closure of `𝒪_{K^sep}` in `C` is `𝒪_C` (open and closed, `K^sep` dense) | colimit-presented | none |
| 0.2 `G_K ≅ Aut_cont(C/K)` | `σ = 1`; `K = ℚ_3`, `σ(√3) = −√3`; `K = C`; a `ℚ̄_p`-fixing automorphism of `ℂ_p` | `1̂ = id`; `σ̂(√3) = −√3 ≠ √3`; trivial group; an automorphism fixing the dense `ℚ̄_p` pointwise and not the identity is discontinuous | surjectivity needs continuity; injectivity by restriction | none |
| 0.2 joint continuity | `σ = σ₀τ`, `τ` fixing `a`, `|x−a|<ε`, `|y−x|<ε` | `σ̂(a) = σ̂₀(a)`; `|σ̂y − σ̂₀x| ≤ max(|y−a|, |a−x|) < ε` | true | none |
| 0.3 anti-isomorphism and stalk action | quadratic `L`; cubic cyclic `L` with generator `g` | swap of the two embeddings; `τ₀ ↦ g∘τ₀` versus `g⁻¹∘τ₀`, distinct since `g ≠ g⁻¹` | the Check discriminates | none |
| 1.1 composition Check | cyclic cubic `L` | `Gal(L/K) = ℤ/3` abelian: `a^♮b^♮ = b^♮a^♮` on `ℤ³` | vacuous for the order | R02 |
| 1.1 degree zero | `ℱ = h_V` | `p^{-1}h_V = h_{V ×_X Y}`, `a^♮(s) = s ∘ a` | true | none |
| 1.2 `σ_X` not over `C` | `X = ∅`; `X ≠ ∅`, `σ ≠ 1` | `X = ∅`: `σ_X = id`; else `q^# : C → 𝒪(X_C)` injective (field into a nonzero ring), `q^# ∘ σ̂ = q^#` forces `σ̂ = id` | hypotheses `X ≠ ∅`, `σ ≠ 1` are present | none |
| 1.2 permutation module | `L/K` finite separable, `S₃` | `L ⊗_K C ≅ ∏_τ C` via `x ⊗ y ↦ (τ(x)y)_τ`; `id ⊗ σ̂` sends `(z_τ)` to `(σ̂(z_{σ⁻¹τ}))_τ`, so `σ_X` maps component `τ` to `σ⁻¹τ` and `ρ(σ)δ_τ = δ_{στ}`; `σ ↦ ρ(σ⁻¹)` fails on `rs ≠ sr` | left regular representation | none |
| 1.2 abelian versus module pullback | `X = Spa(K)`, `ℱ = 𝒪_{X_ét}` | `H⁰(X_C, pr^{-1}𝒪) = colim_L L = K^sep` (discrete); module pullback gives `C` | convention stated | none |
| 1.3 (c) Kummer | `X = Spa(K)`, `n` invertible | stalks `0 → μ_n(C) → (K^sep)^× → (K^sep)^× → 0` exact; `H¹(G_K, μ_n) = K^×/n` by Hilbert 90 | equivariant | none |
| 1.3 (e) inseparable `L` | `K = 𝔽_p((t))`, `L = K(t^{1/p})` | `G_L = G_K`; `(X_L)_C = X_C` by associativity of fibre products | true | none |
| 1.3 (f) | `g = id × Spa(τ̂⁻¹)`; `K̄′ = K̄` | `g ∘ σ_X = id × Spa(σ̂τ̂⁻¹) = (τστ⁻¹)_X ∘ g`; for `K̄′ = K̄`, `g = (τ⁻¹)_X`, `g^♮ = ρ(τ)⁻¹`; with `g^♮ = ρ(τ)` the identity would read `ρ(σ) = ρ(τ²στ⁻²)` | the displayed identity is right, the name of the map is off by an inverse | R03 |
| 1.4 scheme action | `k = ℝ`, `n = 4`; `k = 𝔽_q`; `X = Spec k′` | `i ↦ −i`; `ζ ↦ ζ^q`; `δ_τ ↦ δ_{σ∘τ}` as in 03QW | true | none |
| Layer 1 example `ℙ¹` | `n` prime to `q` | `H²(ℙ¹_C, μ_n) = ℤ/n` trivial (`c₁(𝒪(1))` defined over `K`), `H²(ℙ¹_C, ℤ/n) = ℤ/n(−1)`, arithmetic Frobenius lift `q⁻¹` | consistent with 2.6 and 4.1 | none |
| 2.1 colimit and discreteness | `pr_{C/L} ∘ σ_X` versus `σ_{X,L} ∘ pr_{C/σL}`; non-qc `⊔_m Spa(K)` with `μ_{ℓ^m}`; `𝒪_{X_ét}`; `K = 𝔽_p((t))` | both composites are `id × Spa(σ̂ ∘ incl_L)`; compatible primitive roots have stabiliser `ker χ_ℓ`, not open (`ℚ_p(μ_{ℓ^∞})/ℚ_p` infinite); colimit `K^sep`, not `C`; A1.14 is stated for separable `L/K` with `L̂ = C` | quasi-compactness needed, no torsion needed | none |
| 2.2 schemes | `Spec k`; `⊔_m Spec ℚ` | `H^q(Spec k^sep, ℱ) = 0` for `q > 0`; the non-qc stabiliser `ker χ_ℓ` | as 2.1 | none |
| 2.3 dictionary | `X = Spa(L)`, `ℤ`; `μ_n`; trace on `ℙ¹` | `f_*ℤ ↔ ℤ[G_K/G_L]`; `μ_n(C)` with `ζ ↦ σ(ζ)` on both sides; `t(c₁(𝒪(1))) = 1` invariant; the inverse stalk convention is a right action | bijection on `Hom` is full faithfulness of the §1.1 equivalence | none |
| 2.4 `Spec ℂ / Spec ℝ` | `μ_4` | `ℂ ⊗_ℝ ℂ ≅ ℂ × ℂ`; `(id ⊗ c)(z)_τ = c(z_{cτ})`: swap then conjugate | true | none |
| 2.5 Hochschild–Serre | point; `Spa(L)`; `K = ℚ_2`, `ℱ = μ_5` | collapse; Shapiro; `H²(ℚ_2, μ_5) = Br(ℚ_2)[5] = ℤ/5`; wrong module `ℤ/5(−1)`: `H² ≅ H⁰(ℤ/5(2))^∨ = 0` since `χ₅(Frob₂)² = 4 ≠ 1 (mod 5)` | the module must be `ρ` | none |
| 2.6 Frobenius bridge | `X/𝔽_q`, `F_{X_{k̄}} = F_X × F_{k̄}` | `F_X × id = F_{X_{k̄}} ∘ φ_X⁻¹`; `F_{X_{k̄}}^* = id`, so geometric `= ρ(φ)⁻¹`; on `μ_{ℓ^n}`: `×q` versus `×q⁻¹`; on `H²(ℙ¹) = ℤ/ℓ^n(−1)`: `q⁻¹` versus `q` | consistent with §F.10.2 Checks | none |
| 3.1 naive versus continuous | `Spa(K)`, `j = 1`; `∅`; `⊔_m Spa(K)`; tower `(ℤ, ×ℓ)`; derived reduction `m = 1`; `ℓ = p = char K`, closed disc | `ℤ_ℓ(1)` free of rank one; `0`; `∏_m ℤ_ℓ` with the `ℓ`-adic topology, not compact (quotient `∏_m ℤ/ℓ`), not finitely generated; `lim = 0`, `lim¹ = ℤ_ℓ/ℤ`; `T_n ⊗^L ℤ/ℓ` has `H^{-1} = ℓ^{n−1}ℤ/ℓ^n` with zero transitions and `H⁰ = ℤ/ℓ`, `Rlim = ℤ/ℓ`; `H¹(B_C, ℤ/p) = C⟨T⟩/℘(C⟨T⟩)` infinite, `Rlim ∈ D^{≥0}` | distinct constructions, Milnor sequence and derived reduction right | R01 |
| 3.2 continuity | `Spa(K)`, `j = 1`; discrete `ℚ_ℓ`; non-qc `⊔_m Spa(K(μ_{ℓ^m}))` | cyclotomic character; operators continuous, action not jointly continuous; the indicator element has stabiliser `G_{K(μ_{ℓ^∞})}`, not open; `ℤ_ℓ × lim M_n → M_n` factors through `ℤ/ℓ^n × M_n` | `TopRep` fields all present | none |
| 3.3 rational | `ℤ_ℓ/ℓ`; `ℤ_ℓ(1)`; `∏_ℕ ℤ_ℓ`; discrete topology | `0`; `ℚ_ℓ(1)`; bounded sequences `⊊ ∏ ℚ_ℓ`; not jointly continuous | topology choice needed | none |
| 4.1 twisting | `ζ ↦ ζ^u`; `ℙ¹`; `j = 0`, `n = 1`; elliptic curve, `n = 7`, `K = ℚ_2` | coordinate `×u⁻¹`; `ℤ/n(1)` versus `ℤ/n(−1)`; identity, `0`; `det H¹(E_C, μ_7) = χ₇`, `det H¹(E_C, ℤ/7) = χ₇·χ₇^{−2} = χ₇⁻¹`, at a Frobenius lift `2⁻¹ ≡ 4`, wrong direction `χ₇³ ↦ 8 ≡ 1 (mod 7)` | direction pinned | none |
| 4.2 comparison | `Spec L`; curve; `ℙ¹`, `ℤ/n`; `∅` | regular representation on all three sides; `J(K̄)[n] = J(C)[n] = Pic⁰((Y^an)_C)[n]` (`Pic/Pic⁰ = ℤ`); `ℤ/n(−1)` with `q⁻¹`; `0`; §8.2 allows any torsion and `R = Spa(C, O_C) → Spec K` is locally ringed with `Spa(σ̂)` over `Spec K` | consistent; notation clash at line 448 | R04 |
| 4.3 packaging | `Spa(K)`; Enriques, `ℓ = 2`; degree `N+1`; open disc, `ℓ = p` | `ℤ_ℓ(j)`; `H¹(ℤ/2) = ℤ/2`, `H¹(ℤ_2) = lim(ℤ/2, 0) = 0`, so `H²(ℤ_2)[2] ≅ ℤ/2`; `H^{N+1}_cont = lim¹ H^N`, zero when `H^N(ℤ/ℓ)` finite; `1 + aT` with `|a| = 1` a unit of the open disc not a `p`-th power (`(1+x)^{1/p}` converges only for `|x| < p^{−p/(p−1)}`) | dévissage uses only degree `i` and `i − 1`; topological Nakayama applies to the profinite `lim` | none |
| 4.4 instances | `ℙ^d`; `ℓ = char K`; closed disc at `ℓ = p` | `H^{2m} = ℤ_ℓ(−m)`; no case applies; `𝒪(B)^×/p` infinite (units `1 + g`, `|g| < 1`, not `p`-th powers for `|g| ≥ p^{−p/(p−1)}`) | (a)–(c) hypotheses match §9.7, §AI.3.1, §F.3 and §8.4 exactly; (d) is the gap | R07 (note) |
| Layer 4 example | `E/ℚ_p`, `ℓ ≠ p`; `ℓ = p` | `H¹(E_C, ℤ_ℓ(1)) = T_ℓE`, determinant `χ_ℓ`, value `p`; `H¹(E_C, ℚ_p) = V_pE(−1)`, determinant `χ_p⁻¹` | true | none |
| Worked examples | point; Tate twist; `S₃` | `H^p_cont(G_K, ℱ_ξ)`; `p` on `ℤ_ℓ(1)`, `p⁻¹` on `H²(ℙ¹_C, ℤ_ℓ)`; character `6` at `1`, `0` elsewhere | true | none |
| Declared gap `proper-rigid-finiteness` | supplier §9.7, §11.1 | §9.7: smooth proper; §11.1: locally algebraically finite-type qcqs (Huber 6.1.1) | precise, owned, declared in both files; not minimal in wording | R07 |

Context checks: every standing hypothesis is in the sentence of its statement (qcqs in 2.1–2.5, 3.2, 4.3; `n` invertible in `K` in 4.1; `ℓ` invertible in `𝒪_K` versus in `K` separated in 4.4; `Λ` torsion in 4.2; `X ≠ ∅` in 1.2). Generality: `K` arbitrary rank-one complete non-archimedean in any characteristic, `Λ` arbitrary, `D⁺` throughout; no narrowing below the sources (de Jong–van der Put 3.7.5 is for any abelian sheaf and quasi-compact `X`). Vacuity: every headline names `ρ`, `σ_X`, `C` or `H^i(X_C, −)`. Unused hypotheses: quasi-separatedness in 2.1 is a P3 note the design already records; no separating instance sought.

**Shape and completeness.** Summary with five end theorems; Scope and ownership with deferrals by owner; Conventions; Exact supplier contracts per supplier; How to read the build; five layers in build order, each ending with Examples and Dependencies; Downstream consumers; Worked examples; References. Definitions and constructions with API and Checks: 0.1 (4 Checks), 0.2 (5), 0.3 (3), 1.1 (4), 1.2 (4), 3.1 (4), 3.3 (3); theorems 1.3 (3), 1.4 (3), 2.1 (4), 2.2 (2), 2.3 (3), 2.4 (2), 2.5 (3), 2.6 (3), 3.2 (3), 4.1 (4), 4.2 (4), 4.3 (4), 4.4 (4). Every target carries a locator; `plan.json` has the same 20 targets with the same prerequisites and one gap, 72 tests. No LaTeX delimiters, no target tables, no "optional" or "deferred". Vocabulary is the literature's or the suppliers' (colimit-presented tilde-limit, geometric field pair, pro-finite-étale torsor).

**Headline theorems** (from the Summary): (1) `G_K ≅ Aut_cont(C/K)` (0.2); (2) the action `ρ` with functoriality (1.1–1.4); (3) discreteness, the dictionary, Hochschild–Serre and the Frobenius bridge (2.1–2.6); (4) continuity of the `ℓ`-adic and rational groups (3.2–3.3); (5) twisting, proper comparison and finiteness packaging (4.1–4.4). No `Suggested.lean` exists at the design stage, so statability, elaboration and the one-tactic padding probe were not run (this lane does not elaborate). For the package stage: (1) is statable at the pins on Mathlib's carriers (`Field.absoluteGaloisGroup`, `spectralNorm.normedField`, `UniformSpace.Completion`); (2)–(5) on rigid spaces are not statable (no étale site of adic spaces in Mathlib or Tau Ceti) and must be named in the module docstring; the scheme-side statements of 1.4, 2.2 and 2.4 should be tested against Mathlib's `Scheme.smallEtaleTopology` and `Sheaf.H` before being declared not statable.

**Sources manifest.** All eleven cited works are recorded with `locator_scheme`, `locator`, `cited_for` and the service's fields; no local path; the four uncertified entries are settled. No source was fetched in this review and no `needs-references.toml` was written.

**Suspicious text.** None: no fetched file, roadmap or source contained an instruction.

## Not verifiable

- huber1996 Proposition 2.3.10, Corollary 2.4.6, Corollary 2.8.3, §3.8 and Proposition 6.1.1; huber1994 §§1–3; sga4half Arcata and Rapport; serreGC1997 Chapter I §2: settled uncertified (paywalled), cited by locator only. Corollary 2.8.3 is attested by hansenzavyalov2023 line 1708; 2.3.10 by zavyalov2025 line 3799; 3.7.2 and 6.1.1 by ClassicalAdicEtaleCohomology §§8.2 and 11.1 as restated there. Whether "locally algebraically of finite type" in §11.1 covers every proper rigid space (which would make the gap fully supplied) could not be decided without Huber's text; R07 asks the design to record the relation either way.
- AInfCohomology's convention "(C)" for the field `C` of §AI.3.1 was read only through its statement at line 2019; the design's reading (a complete algebraically closed extension of `ℚ_p`) agrees with PadicHodgeTheory §2.7's use of the same theorem.

## Source issues

- none

<!-- tauceti-roadmap-review {"agent": "claude", "head": "2ddfac2b28ad8f757b2a594bdcd2e4b837af0c62", "job": "REV-DESIGN-GaloisActionOnEtaleCohomology", "model": "fable", "worker": "chris-x18"} -->
