# Review of CharacterTheory (pull request #978 at dfed2ba)
Folder: `TauCetiRoadmap/RepresentationTheory/CharacterTheory/`

**Verdict:** needs changes

The gate fails on this head (`set_option` 2, `sorry-data` 2, `residue` 2, `imports` 1, `mathlib-subimports` 2; build and depcheck pass), so the folder cannot be accepted whatever the mathematics says. The mathematics of the sampled worked examples is sound (every value recomputed below); the blocking defects are a pinned-library citation that does not exist, sorry'd data, `set_option`, and an executable algorithm specified as a target.

## R01 (P1) — Layer 4 cites a Tau Ceti module and six declarations that do not exist at the pin

Location: `TauCetiRoadmap/RepresentationTheory/CharacterTheory/README.md` lines 159–160 and 571–604 ("Pinned Tau Ceti supplies it in `TauCeti/RepresentationTheory/CharacterTable/CyclotomicAction.lean`: … `IsPrimitiveRoot.cyclotomicVirtualCharacterEquiv` … `cyclotomicIrreducibleCharacterAction`"), and the `*Needs:*` line of `fieldOfValues_eq_map_fixedField_stabilizer` (line 603).

Claim: the cyclotomic Galois action on virtual and irreducible characters (descent equivalence, action homomorphism, value formula `(σ·χ)(g) = χ(g^j)`, permutation of irreducibles) is consumed from the pinned Tau Ceti.

Witness: at the pin `a91d3aaf` (the `TauCeti` rev of `lake-manifest.json`), the directory `TauCeti/RepresentationTheory/CharacterTable/` contains no `CyclotomicAction.lean`, and `cyclotomicVirtualCharacter` / `cyclotomicIrreducibleCharacterAction` occur nowhere in the library. What does exist is `TauCeti/RepresentationTheory/CharacterTable/Galois.lean` (`ClassFunction.powMap`, `Representation.map_ofCharacter_eq_powMap`) and `TauCeti/RepresentationTheory/Induction/Cyclotomic/SplittingField.lean` (`virtualCharacters_eq_map_of_isPrimitiveRoot`, the three `exists_simple_nonempty_iso_baseChange_*` theorems). `Suggested.lean` does not import a `CyclotomicAction` module either (it imports `Galois` and `SplittingField`), which is why the build still passes.

Repair: state the Galois action as targets of this layer, since nothing at the pin supplies them: (i) the descent equivalence `virtualCharacters K G ≃ virtualCharacters L G` for `K` containing a primitive `e`-th root and `L/K` algebraically closed, from `virtualCharacters_eq_map_of_isPrimitiveRoot`; (ii) the action of `Gal(K/ℚ)` by `σ · χ = χ ∘ (g ↦ g^j)`, `j = autToPow σ`, with the identification to `ClassFunction.powMap j` by `map_ofCharacter_eq_powMap`; (iii) that it permutes the irreducible characters. Give each its `*Needs:*` on the two files that exist, and make the field-of-values target depend on these targets. Remove the sentence at lines 159–160.

## R02 (P2) — sorry'd data in `Suggested.lean`

Location: `TauCetiRoadmap/RepresentationTheory/CharacterTheory/Suggested.lean` line 624 (`noncomputable def cyclotomicRingEquiv … := sorry`) and line 724 (`noncomputable def cyclotomicFieldEmbedding … := sorry`); the theorems at lines 733, 744 and 752 mention them.

Claim: a ring equivalence `Cyclotomic e ≃+* CyclotomicRing e ℤ ℚ` and a field embedding `CyclotomicField e ℚ →+* ℂ` sending the distinguished root to `complexRoot e`.

Witness: both bodies are `sorry` (gate `sorry-data`, lines 624 and 724). A `def` whose body is `sorry` is `sorryAx`, so `cyclotomicRingEquiv_gen`, `cyclotomicRingEquiv_embedding` and `exists_integralPowerBasis_comparison` are statements about an unspecified function.

Repair: replace both by existence theorems carrying their compatibility, for example `∃ E : Cyclotomic e ≃+* CyclotomicRing e ℤ ℚ, algebraMap _ (CyclotomicField e ℚ) (E (cyclotomicGen e)) = IsCyclotomicExtension.zeta e ℚ _` and `∃ ι : CyclotomicField e ℚ →+* ℂ, ι (IsCyclotomicExtension.zeta e ℚ _) = complexRoot e ∧ ∀ x, ι (algebraMap _ _ (E x)) = cyclotomicEmbedding e x`, and restate `exists_integralPowerBasis_comparison` with the embedding existentially bound inside it. The README's Layer 6 item 1 keeps `cyclotomicFieldEmbedding` as prose only.

## R03 (P2) — `set_option` in two Lean files, around numeric padding

Location: `Suggested.lean` lines 1370 and 1376 (`set_option maxHeartbeats 6000000 in` before `force_modes` and `inverse_modes`); `TensorMultiplicitySeriesTargets.lean` line 12 (`set_option autoImplicit false`).

Claim: two 12×12 rational matrix identities (`force * modes = modes * diagonal eigenvalues`, `inverseModes * modes = 1`) are proved by `norm_num` under a raised heartbeat limit.

Witness: gate `set_option` rule, lines 1370 and 1376. The identities are true (I recomputed `force = −Σ_{i<j} z_ij z_ijᵀ` for the README's vertices and checked each column of `modes` against the eigenvalue list `0⁶, −2², −4³, −8` with exact rationals; `modes` has rank 12), but they are a worked Check computed in place, which is padding by the file rules.

Repair: delete the `SpringSystems` namespace (lines 1322–1382: `force`, `modes`, `inverseModes`, `eigenvalues`, `force_modes`, `inverse_modes`) from `Suggested.lean`; the README's tetrahedron subsection keeps the characteristic polynomial and eigenspaces as Checks. Delete the `set_option` line of `TensorMultiplicitySeriesTargets.lean` (see R13 for that file).

## R04 (P3) — imports: Mathlib submodules, and companion files without `import Mathlib`

Location: `Suggested.lean` lines 24–25 (`import Mathlib.NumberTheory.NumberField.Cyclotomic.Basic`, `import Mathlib.NumberTheory.PrimesCongruentOne`) after the `TauCeti.*` lines; `TensorMultiplicitySeriesTargets.lean` lines 1–5 and `TransverseSpringTargets.lean` line 1 import only submodules and no `import Mathlib`.

Witness: gate `mathlib-subimports` (lines 24, 25) and `imports` (line 1). Both submodules are already in `import Mathlib`.

Repair: delete lines 24–25 of `Suggested.lean` and move line 26 up with the other `TauCeti.*` imports; in each companion file (if kept, see R13) the header is `import Mathlib` followed by the `TauCeti.*` modules used.

## R05 (P2) — Layer 6 item 6 specifies a computational algorithm, not mathematics

Location: `README.md` lines 868–935 ("Executable refinement before the named evaluations": radix-`p` row codes, sorting the search output, a length-`e` modular-inverse scan, an `r×r×φ(e)` residue array, `Option` short-circuiting, "at most `eφ(e)` scalar ratio tests, `r²φ(e)` distinct residue coordinates…"), line 990 (`#eval` the refined `characterTablePowerSearch?` as an acceptance target), and `Suggested.lean` lines 845–1100 (`namespace ExecutableRefinement`: `modularRowCode`, `modularRowOfCode`, `modularCentralRowsDirect`, `alignmentExponent`, `dixonPowerAligned?`, `characterTablePowerSearch?` and their specification theorems).

Claim: a second, "refined" executable Dixon solver with deterministic row order, built from the native search output, is a target of this roadmap.

Witness: the binding principle "Mathematical background is welcome; computational algorithms are not." The subsection is an implementation design (encodings, sort order, traversal order, operation counts, caching advice: "Cache the class powers, class sizes, inverse-class map and ratios once"). The Lean namespace's own header says it is "NEW proposed executable definitions … None is an assertion that … these new definitions were run" (line 849). The native solver `ClassData.characterTableDixon?` (`TauCeti/RepresentationTheory/CharacterTable/Dixon/Cyclotomic/Solver.lean` line 431) already exists at the pin and is consumed; the mathematical content that is new here is separable from the algorithm.

Repair: delete the executable-refinement subsection and the `ExecutableRefinement` namespace. Keep, as theorem targets about the native solver, exactly the mathematics they contain: the canonical coordinate bound `|coeff(Ω_C, k)| ≤ |G|·A_e` (`exists_exact_character_and_central_values`), the strong-prime existence `p > 2|G|A_e` (`exists_strongDixonPrime`), the class-power Galois identity `Ω_χ(P_b(k)) = σ_b(Ω_χ(k))` for `gcd(b,e)=1` (stated on `centralCharacterTable`, with `powerClass` replaced by the class of `g^b`), the degree identity `∑_k (|G|/|C_k|) Ω_χ(k) Ω_χ(k⁻¹) = (|G|/χ(1))²` with the uniqueness of the positive integer solution, and totality `characterTableDixonSearch_eventually_some`. The five named group evaluations stay as README Checks of the native solver, not as `#eval` acceptance targets of a new function.

## R06 (P3) — the Burnside–Brauer theorem is planned twice across two open pull requests

Location: `README.md` lines 420–492 ("Faithful tensor generation over ℂ": every simple occurs in `U^⊗n` for some `n < r_U ≤ #ConjClasses`, with the Lagrange and Vandermonde routes) and line 490 ("This subsection is the general finite-complex supplier; McKay matrices … are consumers").

Witness: `TauCetiRoadmap/McKaySkewGroup/README.md` at the head of pull request #223 (rev 223), line 538: "Prove the Burnside–Brauer faithful tensor-generation theorem for a finite group over ℂ (Isaacs, Theorem 4.3) … `n<r≤#ConjClasses Γ`. The route is the Vandermonde argument", with its own `*Needs:*` on Mathlib only; that roadmap also consumes CharacterTheory Layers 2–3 (its lines 246–253). McKaySkewGroup is earlier in the merge order than this roadmap's family, so citing it from here would make a cycle.

Why this roadmap is the owner: the theorem is finite-group character theory with no McKay-specific input, and McKaySkewGroup already consumes this roadmap's Layers 2–3, so the only acyclic arrangement is ownership here. Repair in this PR: say so in the ownership text of this subsection, naming the McKaySkewGroup section ("affine Dynkin graphs / the McKay matrix") as its consumer by section title; the McKaySkewGroup pull request must then replace its proof target by a citation of this subsection (not a change this review can make).

## R07 (P3) — the sampled worked examples cite a source that is not identified anywhere

Location: `README.md` lines 1213–1214 ("Knutson's first-semester p138"), 1260–1261 ("first-semester pp144–145"), 1293 ("first-semester pp145–146"), and the pull-request text's "Knutson semester 1 pp.148–149" for the generating-series subsection (the README itself gives that subsection only the Steinberg arXiv link).

Witness: `## References` (lines 1484–1517) has no Knutson entry. The author's course pages hold `courses/12spring/6500/notes1/tetrahedron.pdf` (5 pages, "Summary for Math 261, Fall 2001"), `notes1/characters.pdf` (5 pages, same series) and `courses/17spring/6320/characters.pdf` (5 pages); none has a page 138. The texts are not in the sources cache nor in the operator's local source directory. So the four sampled locators cannot be resolved (see Not verifiable); the mathematics of all four was checked independently and is correct (table below).

Repair: add the source to `## References` with a legal URL and the pages, or replace the locators by standard texts for the same computations (Fulton–Harris §2.3 for the `S₃` symmetric powers and §2.3–3.1 for `S₄`/`A₄`; James–Liebeck Ch. 18 for the `S₄` and `A₄` tables; Isaacs Thm 4.3 for the Burnside–Brauer bound), and name the tetrahedron handout in `## References` as well.

## R08 (P3) — CompactGroups citation points at the wrong layer

Location: `README.md` line 405–406 ("compare it with the finite Peter–Weyl bimodule from [CompactGroups6]").

Witness: `TauCetiRoadmap/RepresentationTheory/CompactGroups/README.md` on main: the `G×G`-isotypic decomposition `L²(G) ≅ ⨁̂_π End(V_π)` is Layer 5, "The isotypic decomposition" (line 363); Layer 6 (line 369) is "characters of compact groups".

Repair: cite "CompactGroups Layer 5, the isotypic decomposition".

## R09 (P3) — backticked names of this roadmap's own that `Suggested.lean` does not declare

Location: `README.md` line 180 (`integralClassCenter`, listed among "native definitions" that `Suggested.lean` consumes), lines 241–288 (`Irreps k G`), line 308 (`regroup_finite_simple_summands_by_Irreps`), line 348 (`VirtualCharacter G`).

Witness: none of the four is declared in any `.lean` file of the folder, and `integralClassCenter` and `Irreps` occur nowhere in the pinned Tau Ceti (the integral statement at the pin is `TauCeti.isIntegral_classSum`, which `Suggested.lean` wraps at line 134).

Repair: write them as prose ("the isomorphism-class index of simple `k[G]`-modules", "the integral class center", "the regrouping theorem"), or declare the ones that are headline-statable.

## R10 (P3) — process narrative and anchors in the README and the Lean header

Location: `README.md` lines 15 ("Existing conditional solver soundness is not a proof…"), 169 ("the new complete…"), 177 ("used by the prototype"), 184 ("separately named prototype targets"), 236 ("Dependency clarification:"), 459 ("already implemented pairing-to-Hom identity"), 868 ("Retain the native solver as the exhaustive reference"), 998–999 ("All new theorem and refinement targets are distinct from the already defined native…"), 1457 ("Its new proof order"), and the anchors `<a id=…>` at lines 494 and 1338 (gate `residue`); `Suggested.lean` lines 849–851 ("NEW proposed … None is an assertion that pinned native Solver.lean was optimized or that these new definitions were run").

Repair: timeless wording (what is built, from what), delete the two anchors and the Lean header sentence.

## R11 (P3) — `Suggested.lean` is an API catalogue; most of it is padding

Location: `Suggested.lean` throughout. Of its roughly 120 declarations, 43 are `sorry` targets; the rest are aliases of pinned declarations (`ClassFunction`, `characterPairing`, `classSum`, `structureConstant`, `classMultMatrix`, `centralCharacter`, `primitiveCentralIdempotent`, `characterTable`, `centralCharacterTable`, `IsCharacterTableSpec`, `Cyclotomic`, `cyclotomicGen`, `cyclotomicCoeff`, `cyclotomicEmbedding`, `DixonPrimeData`, `IsGoodDixonPrime`, `ClassData`, `ExactCharTable`, `kernelBasis`, `eigenvalueSearch`, `liftCyclotomic`, `cyclotomicReduce`, `cyclotomicReduceAtRoot`, `characterTableDixon`, `characterTableDixonSearch`, `IsInvariantForm`, `IsRealForm`, `IsRealizableOverReal`, `IsRealClass`, `IsFrobeniusComplement`, `IsTISet`, `frobeniusKernel`, `frobeniusKernelSubgroup`, `exceptionalExtension`, `repRing`, `repRingCharacter`, `GL2Borel`, `GL2PrincipalSeries`, `GL2Steinberg`, `GL2NonSplitTorus`, `GL2Cuspidal`) and theorems proved in place by one call to the pinned theorem (`classSum_mem_center`, `finrank_center_monoidAlgebra`, `classSum_mul`, `isIntegral_classSum`, `finrank_classFunction`, `characterPairing_nondegenerate`, `characterPairingFormula_eq_native`, `exists_algEquiv_pi_matrix`, `sum_sq_dim_eq_card`, `center_algEquiv_pi`, `card_irreps_eq_card_conjClasses`, `irreducibleCharacters_span`, `char_column_orthogonality`, `isIntegral_character`, `isIntegral_centralCharacter_classSum`, `finrank_dvd_card`, `repRingCharacter_mem_classFunction`, `repRingCharacter_injective`, `character_eq_zero_or_scalar_of_coprime_class_card`, `isSolvable_of_card_eq_prime_pow_mul_prime_pow`, `classMultMatrix_commute`, `centralCharacter_coordinate`, `centralCharacterTable_eigenvector`, `normalized_eigenrow_iff_algHom`, `isCharacterTableSpec_characterTable`, `characterTable_unique_rows`, `cyclotomicEmbedding_injective`, `isPrimitiveRoot_cyclotomicEmbedding_gen`, `center_zmod_algEquiv_pi`, `cyclotomicReduceAtRoot_gen`, `cyclotomicReduce_gen`, `liftCyclotomic_spec`, `cyclotomicEmbeddingPoint_isRoot`, `characterTable_eq`, `characterTableDixon_unique_rows`, `exceptionalExtension_pairing`, `card_realValued_eq_card_realClasses`, `card_sq_eq_sum_frobeniusSchur`, the four `frobeniusSchurIndicatorRep_*`, `card_conjClasses_GL2`, `character_one_GL2PrincipalSeries`, `simple_GL2PrincipalSeries_iff_small`, `character_one_GL2Cuspidal`). Boundary-case and API targets among the sorries: `characterValueCount_of_finrank_zero` (line 410), `subsingleton_group_of_faithful_finrank_zero` (415), `pos_finrank_hom_tensorPower_zero` (420), `primitiveExponent_first` (872), `alignmentExponent_one` (884), `characterValues_eq_conjClasses_image` (296), `characterValueCount_le_card_conjClasses` (304), `identityFibrePolynomial_degree` (326); proved API lemmas `mem_characterValues`, `characterValueCount_pos`, `characterValues_iso`, `tensorPowerFDRep_character`, `canonicalPowerBound_pos`, `pow_coeff_le_canonicalPowerBound`, `quotientCoefficients_eq_map`, `divideClassSize_eq_coeff_map`; and the executable adapters `classSumOfClassData`, `classSumCoefficientsOfClassData` with their two proved equalities.

Witness (one-tactic probe on a copy): `alignmentExponent_one` closes with a single `rfl`/`decide`/`simp` alternative; the other six probed sorries (`characterValues_eq_conjClasses_image`, `characterValueCount_le_card_conjClasses`, `characterValueCount_of_finrank_zero`, `primitiveExponent_first`, `modularRowOfCode_code`, `classSize_dvd_card`) did not close in one tactic but are boundary or library-API statements by inspection.

Repair: delete everything listed from `Suggested.lean` (the README keeps each as API bullet or Check), and keep only the headline theorems with the few definitions they need: `fieldOfValues_eq_map_fixedField_stabilizer`; `exists_pos_finrank_hom_tensorPower` with `characterValues`, `characterValueCount`, `tensorPowerFDRep` (and `exists_pos_finrank_intertwining_tensorPower`); the generating-series identity and `arbitrarily_large_tensorPowers` (currently in the companion file); `exists_exact_of_integral_mem_cyclotomic`, `exists_eigenvalue_multiplicities`, `exists_exact_character_and_central_values`, `exists_bounded_exact_character_table`, `exists_strongDixonPrime`, `characterTableDixon_isSome`, `characterTableDixonSearch_eventually_some` with `canonicalPowerBound` and `centralCoefficientBound`; `simple_GL2PrincipalSeries_iff` (arbitrary universe); and `energy_quartic` with `length`/`energy`. Burnside `pᵃqᵇ`, Frobenius's theorem, the trichotomy and realizability, the involution count and the GL₂ dimension formulas are proved at the pin, so they are supplier citations in the README, not statements here.

## R12 (P3) — README shape

Location: `README.md` section headings. There is no `## Scope and ownership`, `## Exact supplier contracts`, `## How to read the build`, `## Downstream consumers`, and no `### Examples` / `### Dependencies` per layer; conventions are under `## Standing conventions`; the supplier material is spread over "What Mathlib already has", "Native integration and comparison targets" and inline sentences.

Repair: regroup into the upstream shape (the content exists; this is a reorganisation), putting the ownership statements of R06 and the deferrals (native Burnside, Frobenius, Frobenius–Schur, GL₂) under `## Scope and ownership`.

## R13 (P3) — targets in two companion Lean files instead of the acceptance test

Location: `TensorMultiplicitySeriesTargets.lean` (three sorries, one proved `coeff_` simp lemma) and `TransverseSpringTargets.lean` (three sorries), linked from `README.md` lines 487 and 1369.

Witness: `Suggested.lean` is the acceptance test the gate builds; the companions are built by nobody. Both files' statements are statable in `Suggested.lean` as they stand (`PowerSeries ℂ` and `Real.sqrt` are Mathlib). `energy_rationalized` restates a rational identity (a Check) and `forceX_pos` is a boundary statement; `coeff_tensorMultiplicitySeries` restates the definition.

Repair: move `tensorMultiplicitySeries`, `tensorMultiplicitySeries_eq_characterFractions`, `arbitrarily_large_tensorPowers`, `exists_positive_tensorPower_le_valueCount`, `length`, `energy`, `energy_quartic` into `Suggested.lean` under their layers; drop the rest; delete the two files and the two README links.

## Verified sound

Gate: as recorded by the worker, FAIL on `set_option`, `sorry-data`, `residue`, `imports`, `mathlib-subimports`; `build` and `depcheck` pass. Elaboration of `Suggested.lean` with `lake env lean` from the worktree: exit 0 in 33 s, 43 `declaration uses 'sorry'` warnings and the one `#check` output, nothing else. Dependency check output: `depcheck: 207 roadmaps, 1414 edges, 0 problem(s)`; no UPWARD or CYCLE line. Diff outside the folder: only `TauCetiRoadmap/RepresentationTheory/Suggested.lean` (new, 21 lines, states nothing and says why), which the brief names as the pull request's own.

Pins: `lake-manifest.json` gives TauCeti `a91d3aaf…` and Mathlib `6b7abb3c…`; the checked-out packages are at those commits.

Declarations opened at the pin (file:line): `IsGoodDixonPrime` `TauCeti/RepresentationTheory/CharacterTable/Dixon/Prime.lean:102–110` (fields `prime`, `not_dvd_natCard`, `exponent_dvd`, `two_mul_sqrt_lt : 2 * Nat.sqrt (Nat.card G) < p`, confirming the README's "older inequality"); `DixonPrimeData` ibid.:245 (`p`, `root`, certificates); `candidates` ibid.:363 (`e*(k+1)+1` for `k < fuel`, so prefix stability holds); `centralCharacterSearch` `…/Dixon/ClassData/EigenvectorSearch.lean:240` (transposes `modularClassMatrix`, as the README says); `card_centralCharacterSearch_of_isGoodDixonPrime` `…/ClassData/CentralCharacterCount.lean`; `IsExactCharacterTableSpec` `…/Dixon/ExactChecker.lean` (seven fields incl. `degree_mul_central`, `row_orthogonal` with `conj`); `IsCyclotomicCharacterTableSpec` `…/Dixon/Cyclotomic/Checker.lean:54` (= the exact spec with `star`); `dixonCyclotomicCharacterTable?` `…/Cyclotomic/Solver.lean:284`, `characterTableDixon?` ibid.:431; `Cyclotomic` `TauCeti/RingTheory/Cyclotomic/Basic.lean:46` (descending coefficient list), `coeffs` :54, `coeff` :65 (reads the reversed list, 0 beyond `φ(e)`), `ofCoeffList` :84, `zeta` :354, `complexRoot` :497 (`exp(2πi/e)`), `complexEmbedding` :529; `Lift.lean`: `primitiveExponents` :129 (`(range e).filter (Coprime e)`, so `[0]` for `e = 1` and first entry `1` for `e > 1`), `primitiveExponent` :150, `conjugateRoot` :187, `conjugateResidues` :211, `lift` :322, kernel-irreducibility remark :86 (the README's `Nat.gcdA` sentence is accurate); `symmetricGroupFourClassData` `…/Dixon/ClassData/SymmetricFour.lean:45` (reps `1, (01), (01)(23), (012), (0123)`), `symmetricGroupFourCharacterTable` `…/Dixon/Rational/SymmetricFour.lean:95` (rows trivial, sign, 2-dim, standard, twist: matches the README's row order); `alternatingGroupFourClassData` `…/ClassData/Alternating/Four.lean:62` (reps `1`, double transposition, 3-cycle, its inverse); `alternatingGroupFourOmega` `…/Cyclotomic/AlternatingFour.lean:161` (`zeta 6 ^ 2`, whose image is `exp(2πi/3)`), exact table :187 (matches the README's `A₄` table entry by entry); `dihedralGroupThreeCharacterTable` `…/Rational/Dihedral/Three.lean:164`; `standardRepresentation` `TauCeti/RepresentationTheory/Symmetric/Standard.lean:128` (the augmentation subrepresentation); `char_eq_finrank_iff` `…/CharacterTable/Kernel.lean:108`, `ker_eq_bot_iff` :162; `tensorPower` `…/Tensor/Power.lean:100`, `char_tensorPower` :136; `ClassFunction.indExtend` and `characterPairing_indExtend_indExtend` `…/FrobeniusGroup/Basic.lean`; `isometry_ind_of_isTISet` `…/Induction/TrivialIntersection.lean`; `IsRealizableOverReal`, `frobeniusSchurIndicator_eq_one_iff_isRealizableOverReal` `…/CharacterTable/FrobeniusSchur/Realizability.lean`; `GL2NonSplitTorus` `TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/NonSplitTorus.lean`; `virtualCharacters_eq_map_of_isPrimitiveRoot` and the three `exists_simple_nonempty_iso_baseChange_*` in `…/Induction/Cyclotomic/SplittingField.lean`; `ClassFunction.powMap`, `map_ofCharacter_eq_powMap` in `…/CharacterTable/Galois.lean`; `exists_prime_gt_modEq_one`, `exists_isGoodDixonPrime` in `…/Dixon/Prime.lean`. Mathlib at the pin: `Lagrange.basis` (`LinearAlgebra/Lagrange.lean`), `Module.End.isSemisimple_of_squarefree_aeval_eq_zero` (`LinearAlgebra/Semisimple.lean`), `Subgroup.index_centralizer_eq_ncard` (`GroupTheory/Index.lean`), `NumberField.Embeddings.pow_eq_one_of_norm_le_one` (`NumberTheory/NumberField/InfinitePlace/Embeddings.lean`), `IsIntegral.exists_int_iff_exists_rat` and `ratCast_iff` (`NumberTheory/Niven.lean`), `isIntegralClosure_adjoin_singleton`, `cyclotomicRing_isIntegralClosure`, `adjoinEquivRingOfIntegers`, `integralPowerBasis_gen/_dim` (`NumberTheory/NumberField/Cyclotomic/Basic.lean`), `IsSemisimpleModule.exists_linearEquiv_fin_dfinsupp` (`RingTheory/SimpleModule/Isotypic.lean`), `LinearMap.bijective_or_eq_zero`, `Representation.linHom.invariantsEquivFDRepHom` (`RepresentationTheory/Invariants.lean:217`), `scalar_product_char_eq_finrank_equivariant`, `card_inv_mul_sum_char_mul_char_eq_finrank`, `isIntegral_character`, `char_iso/char_tensor/char_dual/char_linHom` (`RepresentationTheory/Character.lean`), `IsPGroup.center_nontrivial`, `Group.isSolvable_iff_subgroup_quotient`, `Sylow.card_eq_multiplicity`, `IsAlgClosed` Wedderburn (`RingTheory/SimpleModule/IsAlgClosed.lean`), `autEquivPow` (`NumberTheory/Cyclotomic/Gal.lean`), `IsGalois.fixedField_fixingSubgroup`.

Cross-roadmap citations resolved on main: SemisimpleAlgebras Layer 1 and `blocks_equiv_simpleModules` (`TauCetiRoadmap/RepresentationTheory/SemisimpleAlgebras/README.md` lines 153, 186); InductionRestriction induced-character formula (its line 298) and `virtualCharacters` table (line 184); LieHighestWeight `formalCharacter` (its line 302); PivotalSpherical README exists; CompactGroups: see R08.

Ownership against open pull requests: searched the 436 open heads for the Burnside–Brauer theorem, Dixon solvers, Frobenius–Schur, GL₂ cuspidals and spring systems: only McKaySkewGroup (R06) overlaps.

Adversarial table (sampled targets, headline theorems, and every target a finding touches):

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| `S₃` on `V₃`, `α=(1,ω,ω²)`, `β=(ω,1,ω²)` | `τ=(012)`, `σ=(01)` with `(g·z)_i=z_{g⁻¹i}` | `τα=(ω²,1,ω)=ω²α`, `τβ=(ω²,ω,1)=ωβ`, `σα=β`, `σβ=α`; `1+ω+ω²=0` so both lie in `V₃` | sound |
| `Sym²V₃ ≃ 1⊕V₃`, map `1↦αβ`, `α↦β²`, `β↦α²` | `τ` on `(α²,β²,αβ)` | eigenvalues `ω,ω²,1`; `τ(β²)=ω²β²` matches `τα=ω²α`; `χ_{Sym²}=((4+2)/2,(0+2)/2,(1−1)/2)=(3,1,0)=(1,1,1)+(2,0,−1)` | sound |
| `Sym³V₃ ≃ 1⊕sgn⊕V₃`, `α↦α²β`, `β↦αβ²` | `τ`, `σ` | `τ(α²β)=ω⁵=ω²`, `τ(αβ²)=ω⁴=ω`; `χ_{Sym³}=(4,0,1)` from `(χ³+3χ(g)χ(g²)+2χ(g³))/6`; `=(1,1,1)+(1,−1,1)+(2,0,−1)` | sound |
| cube: `ℂ[X]`, `ℂ[Y]` on `S₄` classes `1,(01),(01)(23),(012),(0123)` sizes `1,6,3,8,6` | fixed vertices / edges per rotation | `ℂ[X]=(8,0,0,2,0)`, `ℂ[Y]=(12,2,0,0,0)`; pairings `ℂ[X]`: `1,1,0,1,1`; `ℂ[Y]`: `1,0,1,2,1`; dims `8`, `12` | sound |
| `q:S₄→S₃` on `M₀=01|23, M₁=03|12, M₂=02|13`; `E=q*V₃` | `(01)`, `(0123)`, `(012)` | `q(01)` swaps `M₁,M₂`; `q(0123)` swaps `M₀,M₁`; `q(012)`: `M₀→M₁→M₂→M₀`; `χ_E=(2,0,2,−1,0)` = native row 3; kernel `V₄` | sound |
| `A₄` table and `Res(E)≃L₁⊕L₂`, `v_j=Σ_r ω^{−jr}δ_{q(012)^r M₀}` | classes `1,(01)(23),(012),(021)` | `(2,2,−1,−1)=(1,1,ω,ω²)+(1,1,ω²,ω)`; `(012)·v_j=ω^j v_j`; `1+ω^{−j}+ω^{−2j}=0` so `v_j∈E`; `T=(3,−1,0,0)` = native row 4 | sound |
| `F_X(z)=|G|⁻¹Σ_g χ_X(g⁻¹)/(1−χ_U(g)z)`, `QF=N`, recurrence | formal expansion; `R(T)=Σc_jT^j` | `m_n=|G|⁻¹Σχ_U(g)^nχ_X(g⁻¹)`; `Σ_j c_j m_{n+j}=|G|⁻¹Σ_g χ_X(g⁻¹)χ_U(g)^nR(χ_U(g))=0` | sound |
| `N_X(1/d)≠0`, `Q(1/d)=0`, `F_X` not polynomial | faithful `U`, `d>0`, `X` simple | `b_d=dim X` (only `g=1` has `χ_U(g)=d`); every other term has the factor `1−d/d=0`; `N_X(1/d)=(dim X/|G|)∏_{a≠d}(1−a/d)≠0` | sound |
| `1≤n≤r_U` via `(T/d)P_U(T)` | pairing with `χ_X` | value `[g=1]` at `χ_U(g)`; pairing `dim X/|G|≠0`; constant term `0` | sound |
| `C₄`, `U=χ₁⊕χ₃` | `n=0,1,2`; `j=0,1,2,3` | `χ_U=(2,0,−2,0)`, `r_U=3<4`; `m_n(χ_j)=¼(2^n+(−2)^n(−1)^j)`; `F₀=1+2z²/(1−4z²)=(1−2z²)/(1−4z²)`, `F₂=2z²/(1−4z²)`, `F₁=F₃=z/(1−4z²)`; `R=T³−4T` gives `m_{n+3}=4m_{n+1}`; span of `(2^n,0,(−2)^n,0)` is 3-dimensional | sound |
| degenerate: trivial group, zero `U` | `r_U=1`, `n=0` | `U^⊗0` trivial, `Hom(X,1)≠0` for the unique simple; faithful zero `U` forces `G` trivial | sound |
| negative control: trivial `U` of `C₂` | all `n` | `χ_U^n=1`, `⟨1,sgn⟩=0` for every `n` | sound |
| field of values `ℚ(χ)=ι(K^H)` | `C₄`, `χ(g)=i`; `S₃` sign; `Q₈` 2-dim; trivial group; `C₃` class function `f` | `j=3`: `χ(g³)=−i≠i`, `H=1`, `ℚ(i)`; `j=5`: `sgn(g⁵)=sgn(g)`, `H=Gal`, `ℚ`; `χ(g³)=χ(g⁻¹)=0=χ(g)`, `ℚ`; `j=0`, `g⁰=1=g`, `ℚ`; `f(g²)=f(g)=i` but `ℚ(i)⊄ℚ(√−3)` so the statement needs an irreducible character | sound |
| Lean signature of the above | `[Algebra K ℂ]` arbitrary, `[Finite G]`, `hH` defines `H` | generality equals the README's "every embedding"; no `χ` irreducibility dropped | sound |
| Burnside step 1: `χ(g)/χ(1)` integral when `gcd(|C|,χ(1))=1` | Bézout `a|C|+bχ(1)=1` | `χ(g)/χ(1)=aω+bχ(g)`; all conjugates of norm `≤1`; root of unity or `0` | sound |
| degree square identity | row orthogonality | `Σ_j|C_j|⁻¹ω(K_j)ω(K_{j⁻¹})=d⁻²Σ_j|C_j|χ(g_j)χ(g_j⁻¹)=|G|/d²`; `T(Ω_χ)=Σ_k(n/s_k)ω_kω_{k⁻¹}=n²/d²` | sound |
| `S₄` and the old prime window | `|G|=24`, `e=12` | `2⌊√24⌋=8<13`, `13≡1 (12)` so `p=13` is good; trivial row `Ω=8·1/1=8` at the 3-cycle class; `2·8=16>13` so the symmetric lift fails; `A_12=1` (`Φ₁₂=x⁴−x²+1`, `ζ⁶=−1`), `B=24`, first strong prime `61` | sound |
| `e=1` | trivial group | `primitiveExponents 1=[0]`, `A_1=1`, `B=1`, `p=3` good and strong | sound |
| class-power identity `Ω_χ(P_b k)=σ_b(Ω_χ(k))`, `gcd(b,e)=1` | eigenvalue multiset | `χ(g^b)=Σζ_i^b=σ_b(χ(g))`, `|C_{g^b}|=|C_g|`, `χ(1)` fixed; reduce at `α^{a₀}` of `σ_b w` = reduce at `α^{a₀b}` of `w` | sound |
| `recoverDegreeFromNumerator?` uniqueness | `m²·n²/d²=n²` in characteristic `0` | `m=d`, `d≤√n` since `d²≤Σd_i²=n` | sound (algorithmic context: R05) |
| `exists_strongDixonPrime` | `p>max(|G|,2B_G)`, `p≡1 (e)` | `p∤|G|`, `e∣p−1`, `2√|G|<p` | sound |
| two-particle spring, order `(x₁,y₁,x₂,y₂)` | `H`, `r=diag(1,−1,1,−1)`, `s` | `H(1,0,−1,0)=−2·`; `(0,1,0,1)`: `r=−1,s=+1`, `H=0`; `(1,0,1,0)`: `r=+1,s=−1`; `(0,1,0,−1)`: `(−,−)`; regular rep of `C₂×C₂` | sound |
| transverse mode | `u₁=(0,ε)`, `u₂=(0,−ε)` | `r=(1,−2ε)`, `ℓ=√(1+4ε²)`, `E=(κ/2)(ℓ−1)²=(κ/2)(4ε²)²/(ℓ+1)²=8κε⁴/(ℓ+1)²`, limit `8κ/4=2κ`; `F₁=κ(1−1/ℓ)(1,−2ε)`; rotated pair at distance `1` with tangent `(0,1,0,−1)` | sound |
| three particles | `H`, `r` | `(1,0,−1)`: `r=+`, `H=−1`; `(1,1,1)`: `r=−`, `H=0`; `(1,−2,1)`: `r=−`, `H=−3` | sound |
| tetrahedron `H=−Σz zᵀ` | exact rationals, the Lean `force` | `force=−Σz_{ij}z_{ij}ᵀ` (12×12 equality), `modes` columns are eigenvectors for `0⁶,−2²,−4³,−8`, rank `12`; `u_i=Aq_i`: `A=diag` trace-zero gives `−2`, zero-diagonal symmetric gives `−4`, `A=I` gives `−8`, skew gives `0`; character `(12,2,0,0,0)` with pairings `1,0,1,2,1` | sound |
| restrictions to `S₃`, `D₄=⟨(1234),(13)⟩` | invariant dimensions | `S₃`: `1+0+2·1+0=3`; `D₄`: `1+1+0+0=2` (`⟨V,sgn⟩_{D₄}=(3+2−3−2)/8=0`); `A_i=q_iq_iᵀ−I/4` have zero diagonal and sum `Σq_iq_iᵀ−I=0`; `diag(−1,2,−1)` is fixed by `(13):(x,y,z)↦(−z,y,−x)` and by `(1234):(x,y,z)↦(−z,−y,x)` | sound |
| `card_conjClasses_GL2`: `q²−1` | `q=2,3` | `3`, `8` classes; natural subtraction safe for `q≥2` | sound |

## Not verifiable

- "Knutson's first-semester" notes, pages 138, 144–146, 148–149 (the four sampled targets' locators): no bibliographic entry, no URL; looked at the author's page, `oldCourses.html`, `courses/12spring/6500/` (`notes1/tetrahedron.pdf`, `notes1/characters.pdf`), `courses/17spring/6320/characters.pdf` (all 5-page summaries without these pages), the sources cache and the operator's local source directory. The statements were verified by direct computation instead (table above).
- Math 6320 lecture notes (Kuperberg), §17.2, Lemma 17.2.3, Theorem 17.2.4, Theorem 17.2.2 (Burnside route): the host `vkuperberg.math.ethz.ch` answered "Service not available" (fetched as `kuperberg-6320`, an out-of-service page). The route was checked against Isaacs Ch. 3 from memory of the standard argument and by the computations in the table.
- Knutson, tetrahedron handout pp. 1–3: readable (`knutson-tetrahedron`, OCR of a scan); pages 1–3 contain the two-particle, three-particle and tetrahedron systems as the README describes (lines 10–130). Steinberg, arXiv 1409.7632 (`steinberg-bbs`): Theorem 6 (line 165) is the monoid refinement; the group statement is in the introduction (lines 34–38), as cited.

## Source issues

- **Misprint** in knutson-tetrahedron at §1.4, printed page 2: the source labels the vector with both particles pulled up as `r = 1, s = −1` and the vector with both pulled left as `r = −1, s = 1`; with its own `r = diag(1,−1,1,−1)` and `s` the two label pairs are interchanged; affects nothing (OCR of a scan; the README's signs are the recomputed ones).
