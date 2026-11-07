# Review of InverseGaloisAndArithmeticFundamentalGroups (pull request #850 at 7a351f7)

**Verdict:** needs changes

Full re-review: the folder changed by 324 lines since 506a7ed. The head deletes the two
group-theory targets and their seven declarations, cites LocalFiniteGroupTheory L1 and L2 instead,
replaces the LocalFieldsRamification and ClassifyingSpaces citations by pinned Tau Ceti declarations,
and fixes the Mathlib name and links. All five findings of the previous review are repaired. The
whole roadmap was then reviewed again; one P3 remains (a wrong file path for a pinned declaration).

## Previous findings

| Finding at 506a7ed | Status at 7a351f7 | Passage |
| --- | --- | --- |
| R01 (P2) two owners for Schur–Zassenhaus conjugacy and the Fitting subgroup | Repaired | README:140–143 “conjugacy of coprime complements … and the Fitting subgroup … (**LocalFiniteGroupTheory**, L1 and L2); what Layer IG.4 keeps is the passage to profinite groups and the Fitting supplement theorem”; README:262–266, 423–427, 3316–3319, 4184–4188, 4218–4220, 4822–4824, 4827–4831, 5279–5280. The targets *Conjugacy of coprime complements* and *The Fitting subgroup* are gone (0 occurrences). |
| R02 (P2) LocalFieldsRamification Layers 2–4 dropped by #617 | Repaired | 0 occurrences of “LocalFieldsRamification”. New *From Tau Ceti* row README:284 and citations at README:155–157, 1102–1105, 1119–1122, 1527–1529, 3991–3992, 4328–4331, 4643–4644, 5301–5302. Every name in the row exists at Tau Ceti 2fd255d (list under *Verified sound*). |
| R03 (P2) ClassifyingSpaces §Stage 4 item 17 | Repaired | The *From topology roadmaps* table is gone (0 occurrences of “ClassifyingSpaces”, “Stage 4”); README:282 and 2635–2645, 2662–2663 cite `TauCeti.IsAspherical.exists_homotopyEquiv_classifyingSpace`, `TopCat.isIso_singularCohomologyMap`, `TauCeti.classifyingSpaceSingularCohomologyIsoGroupCohomology`, `TauCeti.classifyingSpaceFundamentalGroupMulEquiv`. The `g⁻¹` vertex convention at README:2643–2644 is the one in the pinned docstring (`ClassifyingSpace/EilenbergMacLane.lean:63–66`). |
| R04 (P3) Fitting API catalogue in `Suggested.lean` | Repaired | `Suggested.lean` has 36 declarations, 18 sorried theorems; no `fitting`, no `exists_conj_eq_of_isComplement'_of_coprime`; the docstring sentences (lines 19–20) no longer list them. |
| R05 (P3) stale Mathlib name and links | Repaired | README:535 `exists_finite_inj_algHom_of_fg`; the eight links (README:1607, 1632, 1654, 1694, 1796, 1813, 1870, 7601) point at `1b1ccf4b…`; 0 occurrences of `6b7abb3`. |

## R01 (P3) — Nonexistent file cited for the character-transgression declaration

**Location.** README:3115–3117, *Reduced Schur covers*: “Tau Ceti
`TauCeti.FactorSet.characterTransgression_injective_of_range_inl_le_commutator`
(`TauCeti/GroupTheory/GroupExtension/Character.lean`)”.

**Claim.** The declaration lives in that file at the pin.

**Witness.** At Tau Ceti 2fd255d there is no file `TauCeti/GroupTheory/GroupExtension/Character.lean`;
`Character` is a directory, and the theorem is at
`TauCeti/GroupTheory/GroupExtension/Character/Basic.lean:129`. `lake build
TauCeti.GroupTheory.GroupExtension.Character` fails with “no such file or directory”, while
`#check @TauCeti.FactorSet.characterTransgression_injective_of_range_inl_le_commutator` after
importing `TauCeti.GroupTheory.GroupExtension.Character.Basic` prints its type (hypotheses
`[MulDistribMulAction G M] [MulDistribMulAction G A]`, range of `inl` inside the commutator
subgroup).

**Repair.** Write `TauCeti/GroupTheory/GroupExtension/Character/Basic.lean` at README:3117. Nothing
else changes; the statement cited is the one the target uses (injectivity of transgression when the
kernel lies in the commutator subgroup).

## Verified sound

**Gate, build, dependency check.**

- The worker's gate at 7a351f7 has every counter at zero and `OK`, including `build=0`.
- `lake env lean` on `Suggested.lean` exits 0 with 18 diagnostics, all `declaration uses sorry`
  (lines 78, 82, 89, 104, 112, 119, 127, 181, 236, 256, 263, 279, 304, 326, 345, 370, 377, 387).
- The file has `module`, one `import Mathlib`, four `TauCeti.*` imports that exist at the pin, no
  `set_option`, no sorry'd data, one docstring per declaration, `theorem` only.
- The brief's dependency check printed `depcheck: 240 roadmaps, 2449 edges, 0 problem(s)`, with no
  UPWARD, CYCLE or `moved:` line. LocalFiniteGroupTheory is not in the merge order; it names no
  roadmap supplier and is placed before this roadmap, as the pull request's merge-order paragraph
  records.
- The worktree is clean; `git diff --stat origin/main...HEAD` outside the folder is empty.

**Signatures and padding.** `scratch/signatures.md` lists the elaborated type of all 36
declarations; each keeps the binders its README statement needs (`[CharZero K]` on the three
Hilbertian theorems and on Weissauer, `[NumberField K]` on Hilbert irreducibility, Shafarevich,
the two Grunwald theorems, the coprime-degree theorem and the disjoint realizations,
`[Finite G]` on rigidity, the stable classification and all realization theorems,
`[Fact p.Prime] [CharP k p] [IsAlgClosed k]` and `hD : D.Nonempty` on Abhyankar,
`IsClosed` and `N.Normal` on the normal-subgroup theorem, `(s : P.Q →* P.E)` with
`P.α.comp s = id` and `[Group.IsNilpotent P.α.ker]` on the split nilpotent theorem). On a scratch
copy every sorried theorem was replaced by
`first | rfl | (simp; done) | infer_instance | decide | (intros; simp_all; done) | (intros; rfl)`:
17 of the 18 fail (the 18th, `isHilbertian_of_numberField`, kept its `sorry` through the rewrite
and is Hilbert's theorem itself). No declaration restates a definition, mirrors a Check or computes
a value; the four definitions with bodies (`specialize`, `IsHilbertian`, `IsRigid`,
`HasRegularRealization`, `universalRelations`, `degree`, `HurwitzEquivalent`, `LiftingInvariant.tuple`,
`IsSupersolvable`, `pGenerated`) exist only to state headlines.

**Pinned declarations opened (file and line at Mathlib 1b1ccf4 / Tau Ceti 2fd255d).** Elaborated
with `#check @` in a scratch file (after `lake build` of the modules), or located by source grep
where noted.

- Tau Ceti local fields (README:284): `IsUnramified` class (`NumberTheory/LocalField/Unramified/Basic.lean:115`);
  `frobeniusAlgEquiv` (:164) and `orderOf_frobeniusAlgEquiv` (:178) in `ResidueCorrespondence.lean`;
  `maximalUnramifiedExtension` (`Unramified/Maximal.lean:97`), `maximalUnramifiedFrobenius` (:378);
  `maximalUnramifiedGaloisGroupEquivZHat` (`Unramified/ZHat.lean:197`, `≃ₜ* zHat`, sending Frobenius to
  `zHat.gen`, which `#check` prints as `TauCeti.zHat.gen : ↑TauCeti.zHat.toProfinite.toTop`);
  `inertiaSubgroup` (`Unramified/Inertia/Basic.lean:112`), `IsArithFrobeniusLift` (:336);
  `maximalTameExtension` (`WildInertia.lean:137`), `wildInertiaSubgroup` (:251),
  `isProPSylow_wildInertiaSubgroup` (:611); `tameQuotient` (`Tame/Quotient.lean:152`),
  `tameInertiaHom` (:410), `IsArithFrobeniusLift.toTameQuotient_mul_tameInertiaHom_mul_inv` (:541:
  `toTameQuotient K σ * tameInertiaHom K x * (toTameQuotient K σ)⁻¹ = tameInertiaHom K x ^ Nat.card 𝓀[K]`,
  the `σ τ σ⁻¹ = τ^q` of README:284 and 1121); `inertiaTameCharacter` (`Tame/Character.lean:401`);
  `IwasawaGroup` (`Tame/Presentation.lean:106`), `tameQuotientEquiv` (:402).
- Classifying spaces (README:282): `IsAspherical.exists_homotopyEquiv_classifyingSpace`
  (`AlgebraicTopology/ClassifyingSpace/Uniqueness.lean:109`, hypotheses `[CWType X]`,
  `IsAspherical X x`, `eX : FundamentalGroup X x ≃* G`, conclusion a homotopy equivalence
  compatible with `classifyingSpaceFundamentalGroupMulEquiv`); `TopCat.isIso_singularCohomologyMap`
  (`Cohomology/HomotopyInvariance.lean:89`, data `f`, `f'` and homotopies both ways);
  `classifyingSpaceSingularCohomologyIsoGroupCohomology` (`ClassifyingSpace/Cohomology.lean:89`,
  trivial representation `Rep.trivial k G M`); `classifyingSpaceFundamentalGroupMulEquiv`
  (`EilenbergMacLane.lean:67`); `IsAspherical` (`EilenbergMacLane/Basic.lean:59`).
- Mathlib (README:251, 535): `FiniteField.frobeniusAlgEquivOfAlgebraic` (`FieldTheory/Finite/Basic.lean:364`,
  `[Algebra.IsAlgebraic K L]`), `bijective_frobeniusAlgEquivOfAlgebraic_pow` (:404, bijection from
  `Fin (finrank K L)` onto the powers, the “first `n` powers” of README:1102);
  `exists_finite_inj_algHom_of_fg` (`RingTheory/NoetherNormalization.lean:292`).
- Other names cited by file: `ClassFieldTheory.artinMap` (`Local/ArtinMap.lean:114`),
  `mem_inertiaSubgroup_of_mk_eq_artinMap` (`Local/Unramified.lean:456`);
  `FactorSet.nonempty_splitting_iff_cohomologyClass_eq_zero` (`GroupExtension/Cohomology.lean:319`);
  `FiniteEmbeddingProblem` (`EmbeddingProblem/Basic.lean:60`; `IsSolution` = open kernel and
  `α ∘ β = π`, so the split nilpotent headline's solutions are continuous), `obstruction`
  (`EmbeddingProblem/Cohomology.lean:87`), `exists_isSolution_iff_obstruction_eq_zero` (:110);
  `BraidGroup` (`Braid/Basic.lean:99`), `sigma` (:106), `lift` (:181), `lift_sigma` (:206),
  `strand` (:222), `strandSucc` (:225), `permHom` (:358), `pureSubgroup` (:504), `orderOf_sigma`
  (:136, order `0`); `Place.adicOfIrreducible` (`Place/RatFunc/Basic.lean:252`),
  `adicOfIrreducibleResidueFieldEquiv` (:296), `valuation_ofIrreducible_le_one_iff`
  (`RatFunc/Order.lean:337`), `Place.integers` (`Place/Basic.lean:132`),
  `stabilizer_eq_decompositionSubgroup` (`Extension/Galois.lean:192`),
  `decompositionQuotientInertiaEquiv` (`Extension/Inertia.lean:308`), `card_inertiaSubgroup` (:452);
  `HasFullSymmetricGaloisGroup` (`GaloisGroups/Symmetric/Basic.lean:35`), `.nonempty_mulEquiv` (:87),
  `exists_monic_int_polynomial_hasFullSymmetricGaloisGroup` (`Symmetric/Realization.lean:44`);
  `hasGaloisLabel_X_pow_three_sub_three_mul_X_sub_one` (`GaloisGroups/Cubic.lean:203`),
  `hasGaloisLabel_X_pow_four_sub_two` (`Quartic/Examples.lean:435`), `natCard_gal_X_pow_four_sub_two`
  (:444), `hasGaloisLabel_X_pow_four_add_X_pow_three_add_X_sq_add_X_add_one` (:300);
  `simplyConnectedSemisimpleAffineGroupSchemeProperty` (`AffineGroupScheme/SimplyConnected.lean:76`),
  `FundamentalGroup.prodMulEquiv` (`HomotopyGroup/Product.lean:200`), `cast_map_prod_mul`
  (`FundamentalGroup/TopologicalMonoid.lean:110`), `PrimeToPTateModule`
  (`RootsOfUnity/TateModule.lean:139`), `IsTopologicallyFinitelyGenerated.of_openSubgroup`
  (`[CompactSpace G]`), `groupHomology.cycles₂`, `H2π`, `H2`, `RatFunc.eval_eq_zero_of_eval₂_denom_eq_zero`,
  `Set.Finite.exists_notMem` (`[Infinite α]`), `QuaternionGroup.card` (`SpecificGroups/Quaternion.lean:174`,
  `4 * n`), `NumberField.finrank_eq_one_of_unramified`, `IsGalois.normalAutEquivQuotient`,
  `IsGalois.card_aut_eq_finrank`, `IsGalois.of_separable_splitting_field`,
  `HasStrictFDerivAt.implicitFunctionOfProdDomain`.

**Cross-roadmap citations resolved.** `scratch/citations.md` lists no unresolved cross-roadmap
citation; its 51 Lean-name leads are supplier declarations (EtaleCohomologyFoundations,
SchemeAndStackFoundations, EnhancedDerivedSheaves, AdicEtaleGeometry, AdelicAlgebraicGroups) or
this roadmap's own IG.0.T1–T4 names, as the previous review resolved. Checked this round:

- LocalFiniteGroupTheory at the head of #1634: L1 “Schur–Zassenhaus, conjugacy” (README:145–149,
  `exists_conj_eq_of_isComplement'` at `Suggested.lean:74`, conclusion `∃ g : G, MulAut.conj g • H = K`
  under `[Finite G]`, `Nat.Coprime (Nat.card N) N.index` and `IsSolvable N ∨ IsSolvable (G ⧸ N)`); L2
  “The Fitting subgroup” (README:159–164: `fitting H` nilpotent, characteristic, containing every
  normal nilpotent subgroup, `frattini G ≤ fitting ⊤`; `fitting` at `Suggested.lean:89`). This is
  exactly what README:140–143, 423–427, 3316–3319, 4184–4188 and 4827–4831 consume, and the remark
  that an element of the whole group gives an element of `N` because `G = NH` is right.
- PolynomialGaloisGroups Layer 9: `Completed/PolynomialGaloisGroups/README.md:1385` on main is
  “### Layer 9: `Sₙ` as a Galois group over `ℚ`”. The overlap lead (#763 and #986 “no longer define
  it”) is a false positive: those pull requests add a separate folder of the same name.
- No open pull request changes this roadmap (`scratch/overlaps.md`).

**Ownership against open work.** Searched main and all 472 open heads with the roadmap tool:
`IsHilbertian`, “Hilbertian field” and “Hilbert irreducibility” are defined only here (the mentions
in ArithmeticDynamics, ArithmeticStatistics Parts III and VI, AbelianSurfacesModularity,
HeightsRationalPointsAndObstructions, NeronModels and GrothendieckTeichmuller are uses);
“supersolvable” occurs nowhere else; “lifting invariant” elsewhere only in ArithmeticStatistics
Parts I, V, VIII and InductionRestrictionPartII as consumers; “Noohi” in FunctionFieldArithmeticPartII
refers to Noohi's fundamental groups of stacks, and GroupSchemesOverABase consumes IG.0.4 of this
roadmap by name; “Shafarevich” elsewhere is the Shafarevich conjecture. No second owner found.

**Seeded sample (15 targets): locator, page, hypotheses, support.**

| Target (README line) | Source text read | Result |
| --- | --- | --- |
| Noohi groups and infinite Galois categories (859) | bhatt-scholze (ae0960a2) lines 2947–2950 (Def. 7.1.1, p. 63), 2983–2985 (Prop. 7.1.5, p. 64), 3044–3055 (Lemma 7.1.8, p. 65), 3060–3066 (Def. 7.2.1), 3074–3075 (Def. 7.2.4), 3077–3086 (Thm 7.2.5, pp. 65–66) | Locators correct. The README's definition assumes an open-subgroup basis, which the source's Def. 7.1.1 does not; every Noohi group has one (`Aut(F_G)` does), so the two agree. The open-subgroup proof through Prop. 7.1.5 is sound: a closed subgroup of a complete group is complete. |
| Tame tangential fibres at a boundary point (1065) | sga1 (8e64218d) lines 10866–10933 (XIII §2.1, printed p. 277: tame ramification along a relative normal-crossings divisor, `π₁^t`), Thm 2.4 at line 11089 (printed p. 282), Cor. 2.12 at line 11447 (printed p. 290); wood-moments (154e700c) lines 650–674 (Def. 3.12, p. 394), 678–690 (Thm 3.13, pp. 394–395) | Printed page numbers correct (the arXiv edition's PDF page is printed page + 16). Def. 3.12 supports only the choice of tame-inertia generators with `δ₁⋯δ_kδ_∞ = 1`; the fibre functor itself rests on SGA 1 XIII §2. |
| Coefficients after specialization (1714) | debes (7b07f882) lines 5087–5095 (Thm 5.2.1, printed p. 135), 5098–5122 (Hilbert subsets, Def. 5.2.2, p. 136), 5134–5160 (§5.2.2, Prop. 5.2.5, p. 137); Mathlib `Polynomial.coeff_sum`, `coeff_monomial`, `mem_support_iff` resolve | Correct; Dèbes is cited as motivation, the proof is the three Mathlib lemmas. |
| Compatibility with polynomial coefficient maps (1728) | same pages; `Polynomial.coeff_map`, `Polynomial.ext` | Correct. |
| Specialization preserves multiplication (1762) | same pages; `Polynomial.toSubring`, `map_toSubring`, `map_mul` | Correct; the regularity hypotheses are necessary (table below). |
| Hilbert specialization detected by the Frattini quotient (2226) | masser-zannier (8b76bfac) lines 999–1009 (Lemma 5.1, p. 658), 1040–1048 (proof, p. 659: Frattini subgroup open, `G_y N = G ⇒ G_y = G`) | Correct. |
| The Hurwitz braid action (2741) | wood-lifting (9628210e) lines 162–165 (§3, p. 4: `σ_i(g) = (…, g_i g_{i+1} g_i⁻¹, g_i, …)`); evw-annals (6c10d770) lines 376–395 (§2.1, p. 738: half Dehn twist), 427–452 (§2.2, pp. 739–740) | Correct; the move is Wood's, and the comparison with the half-twist is declared part of the target. |
| Commutators of lifts and the class map (3033) | wood-lifting lines 61–81 (§2.1, p. 2: universal coefficients (1), stem extensions, `⟨x,y⟩`), 130–160 (proof of Thm 2.5, p. 4) | Correct; the sign of the correction is the source issue below. |
| The braid lifting invariant (3475) | wood-lifting lines 176–178 (`Π`, constant on braid orbits, p. 5), 186–188 (Thm 3.1), 189–236 (proof, pp. 5–6) | Correct. |
| Cyclic ramification correction (4093) | schmidt-wingberg (87e03e78, recognised by OCR this round) lines 447–458 (Thm 13, p. 14: `Ω|K|k`, `μ_p ⊂ K`, `T ⊇ Ram(Ω|k) ∪ S_p ∪ S_∞`, `S = cs(Ω|k) ∪ T`, `y` unramified above `T` and zero above `Ram(K|k) ∪ S_p ∪ S_∞`; conclusion `x_𝔭 = (cor y)_𝔭` on `T`, cyclic off `T`, with (a), (b)), 459–463 (odd `p` first) | Hypotheses and conclusion as written. |
| Quotient fibration and the smaller stabiliser (4456) | harpaz-wittenberg (54cd8757) lines 524–535 (Prop. 3.1, pp. 12–13), 573–612 (Prop. 3.3(ii), (3.7)–(3.9), pp. 14–15, citing GHS Thm 1.1 and Kollár IV.6.10), 756–773 (Prop. 5.1, pp. 18–19), 778–788 (Prop. 5.2 and (5.3)); ghs (da41a254) lines 56–58 (Thm 1.1) | Correct. |
| Unramified admissible `Γ`-groups (4850) | lwzb (7f1e85da) lines 461–471 (`K^#`, Schur–Zassenhaus through Ribes–Zalesskii 2.3.15, p. 10), 472–477 (Def. 2.1, Prop. 2.2), 480–489 (proof, p. 11) | Correct, including `Δ = 2|Γ|` resp. `q(q−1)|Γ|` (line 458). |
| Identity-root obstruction (5091) | wood-moments lines 432–464 (Def. 3.1, pp. 388–389), 631–635 (Lemma 3.11, p. 393: `I(φ, u^λ) = I(φ, u)^λ`), 1393–1407 (Conj. 5.1, p. 411) | Correct; the obstruction it records is the source issue below. |
| Fixed-degree Hurwitz mod-`ℓ` comparison (5941) | evw-annals lines 1626–1661 ((7.8.2) at 1646, p. 769; (7.8.3) distinguished at 1651); lwzb Lemma 10.3 cited at PDF p. 39 | Correct. |
| Field and polynomial realizations (7094) | Serre, *Topics*, §1.1 and §3.3: not readable legally; Mathlib `IsGalois.card_aut_eq_finrank`, `IsGalois.of_separable_splitting_field` resolve | Not verifiable (below); the mathematics is elementary and checked in the table. |

**Computed adversarial pass.**

| Statement (line) | Instances and values on each side | Result |
| --- | --- | --- |
| `IsHilbertian` (Lean 71) | `K = 𝔽₂`, `s = {Y² + Y + T, Y² + Y + T + 1}` (both irreducible, separable, degree 2 over `𝔽₂(T)`): `t = 0` gives `Y(Y+1)` for the first, `t = 1` gives `Y(Y+1)` for the second, so no common `t` and `𝔽₂` is not Hilbertian. `K = ℂ`, `Y² − T`: every `Y² − t` splits. `s = ∅`: any `t` | Discriminates; finite and algebraically closed fields excluded |
| `isHilbertian_ratFunc` (78) | `K = 𝔽₂`, `s` as above over `𝔽₂(S)(T)` at `t = S`: `Y² + Y + S` and `Y² + Y + S + 1` are both irreducible (Artin–Schreier, `S` and `S + 1` not of the form `a² + a`) | Holds with no hypothesis on `K` |
| `hilbert_irreducibility` (89) | `r = 0`: `MvPolynomial (Fin 0) K = K`, the unique `t`, `eval t g = g ≠ 0`, `f.map` is `f`, degrees equal. `r = 1`, `f = Y² − T₀`, `g = T₀`, `t = 3`: `g(3) = 3 ≠ 0`, `Y² − 3` irreducible of degree 2 | Holds; `r = 0` trivial as the docstring says |
| `infinite_full_group` (104) | `f = (Y² − 2)(Y² − T)` over `ℚ(T)`: `Gal f = C₂²`; at `t = 3`: `ℚ(√2, √3)`, `C₂²`; at `t = 8`: `ℚ(√2)`, `C₂`, excluded; infinitely many primes `t = p ≠ 2` work | Holds, with a constant subextension allowed |
| `of_isGalois_of_one_lt_finrank` (112) | `M = ℚ(μ_{2^∞})`, `L = M(∛2)`: `[L : M] = 3` since the abelian `M` cannot contain `ℚ(∛2)`; `L = M = ℚ̄`: `finrank 1`, excluded, and `ℚ̄` is not Hilbertian | Properness needed and present |
| `not_isTopologicallyFinitelyGenerated` (119) | `ℚ`: `ℚ(√2, …, √p_r)` gives the quotient `C₂^r`, needing `r` generators. `ℝ`: `C₂`, one generator; `ℝ` is not Hilbertian (`Y² − (T² + 1)`) | Hilbertian hypothesis needed |
| `normal_subgroup_absoluteGaloisGroup_eq_bot` (127) | `ℝ`, `N = Γ_ℝ ≅ C₂`: closed, normal, finitely generated, `≠ ⊥`; excluded by `hK`. `ℚ`, `N = Γ_{ℚ(i)}`: index 2, `ℚ(i)^×/ℚ(i)^{×2}` infinite, so not finitely generated | Holds |
| `IsRationalClass` (154) | `C₃`, `{a}`: `m = 2` coprime to 3, `a² ∉ {a}`, not rational; `S₃` transpositions: every coprime power of an involution is itself. `Nat.card = 0` for infinite `G` would admit only `m = 1`; the `[Finite G]` binder excludes it | Discriminates |
| `IsRigid` and `hasRegularRealization_of_rigid` (159, 181) | `S₃`, classes (2A, 2A, 3A): 3·2 = 6 generating product-one triples, one orbit under `S₃` (centraliser trivial), rational: `S₃` is a regular Galois group over `ℚ(T)`. `G = 1`, `r = 0`: the empty tuple generates `⊤ = ⊥`, rigid, `L = K(T)`. `C₂`, one class, `r = 1`: no product-one tuple, not rigid | Holds |
| `HasRegularRealization` (171) | `G = 1`: `L = RatFunc K`, `IsIntegrallyClosedIn K (RatFunc K)` holds since `K` is algebraically closed in `K(T)`. `L = ℚ(i)(T)` over `ℚ(T)`: `i` is integral over `ℚ` and outside `ℚ`, so the constant extension is rejected | Regularity excludes constant extensions |
| `degree` (206) | Relator `[x][y][x]⁻¹[xyx⁻¹]⁻¹ ↦ e_x + e_y − e_x − e_{[xyx⁻¹]} = 0` since `[xyx⁻¹] = [y]` (the proof term); `C₂`, `c = {g}`: `deg [g]^n = n` | Well defined; sign of inverses right |
| `stable_classification` (236) | `C₂`, `c = {g}`: tuples of length `n` are constant, one braid orbit, one element of `U = ℤ` in degree `n`; bijection for all `n ≥ 1`. `G = 1`, `c = ∅` (`closure ∅ = ⊤`): `U = 1`, `classSet = ∅`, the degree condition is vacuous, and the empty tuple gives `z = 1`. `1 ∈ c` is allowed: `[1]` is central of infinite order and identity entries commute with everything under the moves, so the classification persists | Holds |
| `exists_proper_solution_of_split_nilpotent` (256) | Kernel `1`: `β = s ∘ π` is surjective. `C₄ → C₂` over `ℚ(i)/ℚ`: no section, excluded, and indeed no solution. `IsSolution` is open kernel plus `α ∘ β = π`, so `β` is continuous | Holds |
| `shafarevich` (263) | `S₃` over `ℚ`: `ℚ(∛2, ω)`, degree 6; `G = 1`: `L = K`; `A₅`: not solvable, no claim | Holds |
| `IsSupersolvable` (270) | `S₃`: `⊥ < A₃ = zpowers (123) < S₃ = A₃ ⊔ zpowers (12)`, all normal. `Q₈`: `1 < Z < C₄ < Q₈`. `A₄`: its normal subgroups are `1, V₄, A₄` and `V₄` is not cyclic, so no chain. `n = 0`: `⊥ = ⊤`, `G = 1` | Discriminates |
| Supersolvable Grunwald (279) | `S₃`, `k = ℚ`, `Sf = {5}`: `6 ∉ (5)`, allowed; `C₈` at `2`: `8 ∈ (2)`, excluded, matching Wang. `Si` real place, `Li = ℂ`: `ℂ ⊗ L ≅ ℂ^m` | Holds |
| Quaternion Grunwald (304) | `n = 0, 1, 2`: `QuaternionGroup 2, 4, 8` of orders `8, 16, 32 = 2^{n+3}` (`QuaternionGroup.card = 4n`); `QuaternionGroup 1 = C₄` is excluded by the exponent `n + 1 ≥ 1`… `2^{n+1} ≥ 2`. Unramified quartic at `2`: `8 = 2·4` | Holds |
| `exists_realizations_coprime_degrees` (326) | `G = 1`: `n = 1`, `E 0 = ⊥`, `finrank 1`, gcd 1. `n = 0`: the gcd over `Fin 0` is `0 ≠ 1`, so at least one field is forced | Holds |
| `abhyankar_affine_curve` (345) | `g = 0`, `D = {∞}`: bound `0 + 1 − 1 = 0`, so `G` is a quotient iff `G = p(G)` (Raynaud). `C_p`: `rank 0`, `y^p − y = x`. `C_ℓ`, `ℓ ≠ p`: `rank 1 > 0`, no cover. `D = ∅` would give the junk value `0 − 1 = 0` in `ℕ` and admit `C_p` over `ℙ¹`; `hD` excludes it. Residue fields are `k`, so `ramificationIdx = 1` is unramified | `hD` needed and present |
| `exists_realization` (370) | `ℚ`, `C₂`, `ℚ(T)(√T)` at `T = 2`: `ℚ(√2)` | Holds |
| `exists_disjoint_realizations` (377) | `n = 0`: `⨆_{Fin 0} = ⊥`, disjointness from `M` alone; `M = ℚ(√2)`, `C₂`: `t = 3`, `ℚ(√3)`; `t = 8` would give `M` and is avoided | Holds |
| `inverseGaloisProblem_of_regular` (387) | `exists_realization` with `K = ℚ` and `isHilbertian_of_numberField`; both propositions quantify over `G : Type` | Holds |
| Noohi groups (859) | Profinite `G`: finite `G`-sets reconstruct it; discrete `ℤ`: Noohi, not profinite; `ℤ/2` as `ℤ`-set: two-point fibre, transitive action | Checks correct |
| Tame tangential fibres (1065) | `z^n = t`, `n` invertible: `n` lifts, inertia rotates them transitively; `t' = t(1 + t)`: `(1 + t)^{1/n}` exists henselianly; `y^p − y = t⁻¹`: wild, excluded | Checks correct |
| Coefficients after specialization (1714) | `sp₀(T⁻¹Y)`: `RatFunc.eval 0 T⁻¹ = 1/0 = 0`, so the polynomial is `0` | Formula holds at a pole |
| Compatibility (1728) | `q = (T − 1)⁻¹Y + T ∈ R₀[Y]`: left `sp₀ = (−1)Y + 0 = −Y`, right `map e₀ q = e₀((T−1)⁻¹)Y + e₀(T) = −Y` | Equal |
| Specialization preserves multiplication (1762) | `C(T)·C(T⁻¹) = 1 ↦ 1`, while `sp₀(C T)·sp₀(C T⁻¹) = 0·0 = 0`: hypotheses necessary. `(Y − T)(Y + T)` at `2`: `(Y − 2)(Y + 2) = Y² − 4` | Holds under regularity |
| Frattini detection (2226) | `C₄`-cover `Y⁴ = T` over `ℚ(i)`: `Φ = C₂`, detecting cover `Z² = T`; `t = 2` connected, group `C₄`; `t = 4` split, group `C₂`. `P = ∏_ℓ ℤ/ℓ`: `Φ = 1` not open, excluded | Checks correct |
| Hurwitz braid action (2741) | `a = (12)`, `b = (23)`: `aba⁻¹ = (13)`, new pair `((13), (12))`, product `(13)(12) = (123) = (12)(23)` | Product preserved |
| Commutators of lifts (3033) | `Q₈ → C₂²`: lifts `i, j` have commutator `−1`; `D₈ → C₂²`: `r, s` have commutator `r²`; split `A × G`: trivial; `ℤ²`: `⟨e₁, e₂⟩ = −⟨e₂, e₁⟩` | Checks correct |
| Coprime semidirect products (3) (3316) | `x ∈ c` with image `γ`: `x^k ∈ H ⇒ γ^k = 1 ⇒ ord(x) | k ⇒ x^k = 1`, so `⟨x⟩ ∩ H = 1`; `H⟨x⟩/H ≅ ⟨γ⟩` cyclic; LFGT L1 conjugates by `g = hγ^j` and `γ^j` normalises `⟨γ⟩`, so by `h ∈ H` | Use of L1 correct |
| Braid lifting invariant (3475) | `(a, b)` and `(aba⁻¹, a)`: `[aba⁻¹][a] = [a][b]` by the relation; `ord(a)` extra copies of `a` raise the degree by `ord(a)` and leave the `G`-product | Checks correct |
| Cyclic ramification correction (4093) | `y = 0 ⇒ x = 0`. `k = K = ℚ`, `Ω = ℚ(i)`, `p = 2`, `T = {2, ∞}`: `33 > 0`, `33 ≡ 1 (mod 8)`, so the character of `ℚ(√33)` vanishes on `T`; it ramifies at `3, 11 ≡ 3 (mod 4)`, which do not split in `ℚ(i)`, hence lie outside `S` | Check correct |
| Fitting supplements (4184) | `S₄`: normal subgroups `1, V₄, A₄, S₄`, `A₄` not nilpotent, so `F = V₄`; `Φ(S₄) = 1`; `S₃` supplements, `|V₄||S₃|/|V₄ ∩ S₃| = 24`. `C₄`, `N = C₂ = Φ`: proper subgroups `1, C₂`, no supplement | Checks correct |
| Quotient fibration (4456) | `H = S₃`, `H' = A₃`: fibre stabiliser `C₃`; `C₂²` with the 3-cycle outer action: no stable order-2 subgroup | Checks correct |
| Coprime profinite complements (4815) | `S₃ = C₃ ⋊ C₂`: three complements, conjugate by `C₃`; `C₂ × C₂`, `N = C₂ × 1`: `gcd(2,2) = 2`, excluded, and `1 × C₂`, diagonal are not conjugate. At a finite level `E/U = (N/U)H'`, so a conjugator `g = nh'` may be taken in `N/U` | Holds |
| Unramified admissible `Γ`-groups (4850) | `C₂` on `C₃` by inversion: `h⁻¹γ(h) = h⁻²` generates `C₃`, admissible; trivial action: not. `Γ = 1`: only `1`, matching `K^# = Q₀` | Checks correct |
| Identity-root obstruction (5091) | `u = 1`: `β_v = 1` at every place, every factor `z(φ̃(1)) = 1`, `I(φ, 1) = 1`; Lemma 3.11 with `λ = 2` gives the same. Numerator for `h ≠ 1` is empty | Correct |
| Marked extension count (5188) | `H = 1`, `Γ = C₃`: a cubic field split at `∞` counts twice (two identifications); totally ramified rational place: `rDisc` factor `q`, discriminant exponent `2` | Checks correct |
| Fixed-degree mod-`ℓ` comparison (5941) | `n = 2`, `ℓ = 2`: `PConf₂(ℂ) → Conf₂(ℂ)` is squaring on `ℂ^×`, zero on `H¹(−, 𝔽₂)`, so invariants fail; `ℓ > n` excludes it | Check correct |
| Lifted affine group (6421) | `(−1, 2, 1)(1, 3, −1) = (−1, (−1)·3 + 2, −1) = (−1, −1, −1)`, translation `−1` as stated; `n = 2`: `(d/a)² = 1` gives two components | Checks correct |
| Simple covers of degree three (7004) | `S₃`, transpositions, `n = 4`: `(3⁴/6)(1 + 1 + 0) = 27` product-one tuples, `3` constant, `24` generating, `24/6 = 4` unmarked | Correct |
| Cyclic realization examples (7178) | `Y³ − 3Y + 1` at `±1`: `−1, 3`; discriminant `108 − 27 = 81 = 9²`; `Y³ − 2`: `−108`, not a square | Checks correct |
| Wang's example (3840, 5244) | `2` has order `8` mod `17`, `2⁴ ≡ −1`, so the decomposition group of `2` in `ℚ(ζ₁₇)` contains `−1` and its image in `(ℤ/17)^×/{±1}` has order `4`; `v₂(16) = 4 ∉ 8ℤ` | Checks correct |
| Integral thin-set count (2122) | `E` = squares, box `[−N, N]`: `⌊√N⌋ + 1` points, `O(N^{1/2})`; `N = 1`: `log 1 = 0` while `{0}` has a point, so `N ≥ 2` is needed | Checks correct |
| Frobenius normalisation (1100) | `μ₅` over `𝔽₂`: arithmetic Frobenius acts by `2`, geometric by `2⁻¹ ≡ 3`, `2·3 = 6 ≡ 1 (mod 5)`; Tau Ceti's relation gives `σ τ σ⁻¹ = τ^q` with `q = Nat.card 𝓀[K]` | Convention consistent with the pin |
| `K(π, 1)` comparison (2635) | `U = 𝔾_m`, `π = ℤ`: `H¹(S¹; ℤ/n) = ℤ/n = H¹(ℤ, ℤ/n)`; the pinned isomorphism takes the trivial module `Rep.trivial k G M`, which is the trivial action the README specifies | Consistent |

**Headline theorems.** The README's end theorems are Hilbert irreducibility with full-group and
linearly disjoint specializations, rational rigidity, the stable classification of braid orbits,
Shafarevich's theorem and the identification of Hurwitz components and Frobenius-fixed points with
lifting invariants. The first four are stated (`isHilbertian_of_numberField`, `hilbert_irreducibility`,
`infinite_full_group`, `exists_disjoint_realizations`, `hasRegularRealization_of_rigid`,
`stable_classification`, `shafarevich`); the fifth is named as not statable in the docstring
(lines 31–32) together with the trace formulas, the local-system categories, Noohi and pro-étale
groups, tame specialization, Brauer–Manin density, Property E, the geometric Hilbert-subset and
thin-set forms, the cover form of rigidity and patching (lines 26–37). Weissauer, the
normal-subgroup theorem, the split nilpotent theorem, the two Grunwald theorems, the coprime-degree
realizations and Abhyankar's conjecture are stated as well. Nothing statable is missing and nothing
is forced through a stand-in.

## Not verifiable

- **Serre, *Topics in Galois Theory*.** Cited for *Field and polynomial realizations* (§1.1,
  pp. 1–2; §3.3, pp. 23–25) and, outside the sample, for §§3.2–3.6, 7.1, 8.1. No legal copy; the
  statements are elementary or were checked mathematically in the table.
- **Fried–Jarden, *Field Arithmetic*** (Thms 13.4.2, 13.9.1(b), Prop. 16.11.6), **Ribes–Zalesskii**
  Thm 2.3.15 and **Huppert**, Kap. III Satz 3.2(b), 4.2(c): cited through Liu–Wood–Zureick-Brown
  and Schmidt–Wingberg, which were read; the books themselves were not.
- **McCullough–Wanderley** and **Kollár IV.6.10**: outside this round's sample and not read.

## Source issues

- **Misprint** in wood-lifting (Wood, *An algebraic lifting invariant*) at the proof of Theorem 2.5,
  p. 4: the source corrects the lift `φ` by multiplying with the homomorphism `ψ` that records the
  discrepancies `k_x`; it should multiply by `ψ⁻¹`, since `φ(x̂, e_x) = [x]k_x`; affects the proof.
- **Error** in wood-moments (Wood, *Nonabelian Cohen–Lenstra moments*) at Conjecture 5.1, p. 411:
  the root of unity `u` ranges over all roots of unity of the cyclotomic extension, including `u = 1`,
  for which the invariant is always `1` (Lemma 3.11), so the predicted limit `1` fails for `h ≠ 1`;
  `u` should be a generator of the group of roots of unity; affects a stated result.
