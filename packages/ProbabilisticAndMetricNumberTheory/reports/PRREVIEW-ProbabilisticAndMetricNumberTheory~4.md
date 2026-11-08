# Review of ProbabilisticAndMetricNumberTheory (pull request #1421 at 9c6663c)

**Verdict:** needs changes

This is a full re-review: 298 lines of the folder changed since 6fdc62d. The change adds §0.1a (complete additivity and exponentials of additive functions), keeps §§4.9a–4.9b and §5.1a with the supply direction reversed (GeometryOfNumbersAndQuadraticArithmetic and AdelicAlgebraicGroups now cite this roadmap), deletes the five entropy declarations and `modularLattice_discrete` from `Suggested.lean`, updates the pins and repairs the TeX hits and the §2.2 Checks. Two findings block. Both concern objects of §4.9a that another roadmap earlier in the merge order, or one that consumes this roadmap, also builds. Three P3 findings concern a stale supplier name, stale Mathlib line numbers and target names written with a library prefix.

## Previous findings (r3 at 6fdc62d)

- R01 (Howe–Moore, Moore ergodicity and Mahler re-plan GoN) — disputed by the author at 9c6663c; the dispute is verified. GeometryOfNumbersAndQuadraticArithmetic at the head of #851 consumes all three from this roadmap (README:217–219, 259–261, 1299, 1301, 1306, 1890, 1894, 1938; Suggested.lean:33, 175–177, 376–377) and declares none of `howe_moore`, `moore_ergodicity`, `mahler_relativelyCompact_iff`. GoN sits at merge-order position 52 and this roadmap at 61; the dependency check run on GoN's README with `--movable` prints `moved: GeometryOfNumbersAndQuadraticArithmetic moved in the merge order from #52 to #61, right after its last supplier ProbabilisticAndMetricNumberTheory … 0 problem(s)`, so the reversal creates no cycle. The Cartan-involution paragraph is deleted and Layer 9 of RepresentationTheory/LieGroups is cited for the Cartan datum (README:11, 85, 6369–6371). Settled.
- R02 (invariant probability and SL₂(ℤ) covolume re-plan AdelicAlgebraicGroups) — disputed; verified. AA at the head of #792 assigns the normalized uniqueness and the modular covolume to this roadmap (README:131–134, 1739–1740, 3026, 3035) and declares neither theorem. Settled as a two-roadmap question, but AA's text names AnalyticNumberTheoryPartII §5.3k as the owner of the general quotient measure, which this README re-plans: R01 below.
- R03 (§5.1a re-plans GoN entropy) — disputed; verified. GoN README:1358 at #851 head: on finite labels the entropies are this roadmap's §5.1a `labelEntropy` and `condLabelEntropy`, "used without restatement"; GoN has no `finitePartitionEntropy`. The two definitions and three API lemmas are deleted from `Suggested.lean` and stay as prose targets (README:6703–6725). Settled.
- R04 (gate tex=20) — repaired: the rerun gate prints tex=0.
- R05 (`modularLattice_discrete` padding) — repaired: deleted; the Mathlib instance is cited at README:53, 6387, 6407, 6428. Checked at the pin: `Mathlib/NumberTheory/ModularForms/ArithmeticSubgroups.lean:196`, `instance discreteSpecialLinearGroupIntRangeSL`, for a variable `n`.
- R06 (stale pins) — repaired at README:21 and in 15 reference URLs. Re-checked at 1b1ccf4b: `Hausdorff.lean:490` `le_mkMetric`, `:541` `le_hausdorffMeasure`; `Gaussian/Real.lean:503` `mgf_id_gaussianReal`, `:512` `integrable_exp_mul_gaussianReal`; `NegMulLog.lean:227` `concaveOn_negMulLog`. Not repaired: the Ring/Finset.lean line numbers of §0.5 (R04 below).
- R07 (§2.2 Checks) — repaired: README:2564–2569 keep three discriminating Checks for `TotallyAsympEquidistributed` and README:2596–2602 three for `AsympEquidistributedInt`. Recomputed: n•(1/2) has law δ₀ along 2n and δ_{1/2} along 2n+1; the sequence 0 on n ≥ 0, 1/2 on n < 0 has symmetric-window averages (N+1)/(2N+1) → 1/2 at 0 and N/(2N+1) → 1/2 at 1/2 while its halves have laws δ₀ and δ_{1/2}.

## R01 (P2) — §4.9a re-plans the Weil quotient-measure theorem that AnalyticNumberTheoryPartII §5.3k owns

**Location.** `TauCetiRoadmap/ProbabilisticAndMetricNumberTheory/README.md`:6323–6325, "Prove `lattice_invariant_probability_unique`. Any two Borel probabilities on X preserved by every left translation are equal … One route is Weil's argument … Riesz representation … uniqueness of Haar measure … `QuotientGroup.integral_eq_integral_automorphize` evaluates c as 1/λ(F)"; README:7 and 11 (scope: "invariant probabilities on quotients by discrete subgroups"); `Suggested.lean`:589–593.

**Claim.** AnalyticNumberTheoryPartII (open pull request #1167, merge-order position 50; this roadmap is at 61) §5.3k "Quotient measures and the two quotient conventions" states Weil's theorem: for a second countable locally compact Hausdorff G and a closed H on which the modular characters agree, there is exactly one right-G-invariant Radon measure on H\G with the unfolding identity, extended to nonnegative and integrable functions; for unimodular G and a countable discrete Γ it carries the left convention to G/Γ and Mathlib's right-orbit unfolding; its Lean statement is `exists_unique_quotientMeasure`, and its *Needs:* line lists `RealRMK.integral_rieszMeasure`, `QuotientGroup.integral_eq_integral_automorphize` and `IsFundamentalDomain.quotientMeasure_eq`. The target here is that theorem for H = Γ discrete (uniqueness among invariant probabilities, the λ-null ⇔ μ-null comparison and μ = λ|F / λ(F)), proved again by the same route with the same Mathlib inputs. AdelicAlgebraicGroups already records the division "ANT II owns the quotient measures, this roadmap the normalized lattice case" (AA README:131–134), but neither the scope nor the supplier contracts here mention AnalyticNumberTheoryPartII, so the theorem has two owners and this roadmap plans it again.

**Witness.** AnalyticNumberTheoryPartII README at the head of #1167, lines 701–705 (§5.3k, with `exists_unique_quotientMeasure`); AdelicAlgebraicGroups README at the head of #792, lines 131–134 and 1739–1744; this README:6325 names the three Mathlib inputs of §5.3k's proof.

**Repair.** Add a contract "From TauCetiRoadmap.AnalyticNumberTheoryPartII §5.3k" (quotient measure, its uniqueness among invariant Radon measures, the unfolding, the Γ-discrete inversion statement) and name it in the scope paragraph. Restate `lattice_invariant_probability_unique` as the normalized corollary: for unimodular G (SL₂(ℝ) and the connected simple Lie groups of §4.9a are the only groups used here), two invariant probabilities are Radon (finite Borel on a second countable locally compact space), hence both scalar multiples of the §5.3k quotient measure, and total mass one forces equality; the fundamental-domain formula is the §5.3k unfolding with Mathlib `IsFundamentalDomain.quotientMeasure`. Delete the Weil re-derivation paragraph at README:6325 or reduce it to that sentence, and add unimodularity to the Lean signature (or restrict it to the groups used). If the author wants the statement without a unimodularity hypothesis, keep it as a variant that says in one clause that it adds the lemma "a group with a lattice is unimodular" to ANT II §5.3k, and state that lemma as a target.

**Tested repair.** Γ = SL₂(ℤ) is discrete, so its modular character is trivial; SL₂(ℝ) equals its commutator subgroup (README:6391), so the modular condition of §5.3k holds. A fundamental domain lies in Σ⁻¹ up to right translations, so its Haar mass is at most 2π·(2/√3) ≈ 7.26 (README:6401, 6405), finite and positive: the quotient measure normalizes to a probability, which §5.3k makes unique. The Check "G = ℝ, Γ = {0}" is unchanged: the quotient measure is Haar on ℝ, of infinite mass, so no invariant probability exists.

## R02 (P2) — The Koopman representation is built both in §4.9a and in GeometryOfNumbersAndQuadraticArithmetic §4.2

**Location.** README:6339–6347, "**Koopman representations.** For a lattice with invariant probability μ, define the Koopman representation of G on L²(X,μ;ℂ) by π(g)f=f∘(g⁻¹·), through Mathlib `Lp.compMeasurePreservingₗᵢ`. Prove that it is a unitary `ContRepresentation` with π(gh)=π(g)π(h), and that it is strongly continuous."

**Claim.** GeometryOfNumbersAndQuadraticArithmetic at the head of #851, §4.2 "Scalar Lp pullback representations" (README:1256–1258), constructs `scalarLpKoopman p μ hμ : ContRepresentation ℂ G (Lp ℂ p μ)` from the same Mathlib isometry for every measure-preserving action and every p ≥ 1, with `scalarLpKoopman_apply_ae`, `_norm`, `_one`, `_mul`, `_inv`, and proves `scalarLpKoopman_strong` from the same `Lp.compMeasurePreserving_continuous`; it ends "For p=2 and the invariant probability of a lattice quotient G/Γ this is the Koopman representation of ProbabilisticAndMetricNumberTheory §4.9a". The same object therefore has two owners. GoN consumes this roadmap's Howe–Moore and is moved after it, so GoN cannot supply the construction to this roadmap: the owner has to be this roadmap, at the generality GoN uses, or the two roadmaps have to state a division that neither does now.

**Witness.** GoN README:1256–1258 at #851 head; this README:6339–6341.

**Repair.** State the construction here at GoN's generality: a group acting on a measurable space with `∀ g, MeasurePreserving (g • ·) μ μ` and 1 ≤ p gives the representation on `Lp ℂ p μ` from `Lp.compMeasurePreservingₗᵢ`, with the almost-everywhere formula, the norm, identity, product and inverse laws; for a continuous action on an R₁ space with μ inner regular on finite-measure sets and locally finite, and p ≠ ∞, it is strongly continuous (the hypotheses of `Lp.compMeasurePreserving_continuous`). Then specialise to p = 2 and the lattice quotient: constants fixed, L²₀ invariant, no nonzero fixed vector (which uses `lattice_quotient_ergodic`). Record in Scope and ownership that GoN §4.2 consumes it. GoN's text then becomes a citation; that edit is outside this pull request.

**Tested repair.** On X = G/Γ with its invariant probability, X is Hausdorff (README:6313), so R₁; a finite Borel measure on a second countable locally compact space is inner regular on finite-measure sets and locally finite, and p = 2 ≠ ∞, so the general strong-continuity statement specialises to the present paragraph. The Checks at README:6345 (the constant 1 has norm one and is not in L²₀; a one-point quotient has L²₀ = 0) are unchanged.

## R03 (P3) — The supplier declaration `restricted_squarefree_landau_count` does not exist at the AnalyticNumberTheoryPartI head

**Location.** README:73, "Consume §§3.12a, 3.32 and 3.41 for the compact-parameter Selberg–Delange expansion, `restricted_squarefree_landau_count` and the fixed-A restricted squarefree Sathe–Selberg bounds."

**Claim.** At the current head of #1126 (979e68c) neither the README nor `Suggested.lean` of AnalyticNumberTheoryPartI contains `restricted_squarefree_landau_count`; the roadmap grep finds the name only in this README. §3.32 "Restricted squarefree Landau asymptotic" (ANT I README:3075–3085) states the count asymptotic with no Lean name, and §3.41 (README:3258–3262) uses `restrictedSquarefreeCount` and `restricted_sathe_selberg` (ANT I Suggested.lean:885 and 891). §3.12a exists as the paragraph "§3.12a Compact-parameter multiplicative transfer" at ANT I README:2346. The previous review resolved the name at an earlier ANT I head; the supplier has since renamed its declarations.

**Witness.** ANT I at #1126 head 979e68c: README:3075, 3258–3262; Suggested.lean:885 `def restrictedSquarefreeCount`, 891 `theorem restricted_sathe_selberg`.

**Repair.** Cite §3.32 by section for the count asymptotic and, where a Lean name is wanted, `restrictedSquarefreeCount` and `restricted_sathe_selberg` of §3.41; delete the stale name. The §1.6 Check "D(14) = {1,2,5,10,13}" agrees with ANT I §3.32's own Check (ANT I README:3081).

## R04 (P3) — Stale Mathlib line numbers for `prod_one_add` and `sum_pow_mul_eq_add_pow`

**Location.** README:668, 693, 719, 749, 778: "Ring/Finset.lean prod_one_add, lines 196-198, and sum_pow_mul_eq_add_pow, lines 231-237".

**Claim.** At the pinned Mathlib 1b1ccf4b, `Mathlib/Algebra/BigOperators/Ring/Finset.lean` has `theorem prod_one_add` at lines 199–200 and `theorem sum_pow_mul_eq_add_pow` at 238–239 (its docstring at 236–237); lines 231–234 are `prod_one_add_ordered`. The pin bump updated the hashes but left these numbers from the old pin.

**Witness.** The file at the pin: line 199 `theorem prod_one_add {f : ι → R} (s : Finset ι) :`, line 231 `theorem prod_one_add_ordered`, line 238 `theorem sum_pow_mul_eq_add_pow (a b : R) (s : Finset ι) :`.

**Repair.** Write "lines 199–200" and "lines 236–239" in the five citations, or cite the two declarations by name only, as the rest of the README does.

## R05 (P3) — Planned targets of §§3.1 and 3.4 carry a `TauCeti.` library prefix

**Location.** README:3429–3431, 3461, 3467, 3473, 3479, 3485, 3492 and 3711–3714, 3749–3757, 3804, 3818–3867 (31 occurrences), for example "Prove TauCeti.DuffinSchaeffer.volume_dsSet_le" and "Prove TauCeti.DuffinSchaeffer.GCDGraph.quality_restrictPow".

**Claim.** These are this roadmap's own targets, but the prefix presents them as declarations of the pinned library. Tau Ceti 2fd255d9 has no `DuffinSchaeffer` namespace (a grep of the pinned tree finds none), and the roadmap's Lean namespace is `TauCetiRoadmap.ProbabilisticAndMetricNumberTheory.DuffinSchaeffer`. A reader resolving names at the pin cannot tell them from supplier declarations; every other section writes bare target names.

**Repair.** Drop the prefix: `volume_dsSet_le`, `le_volume_dsSet`, `dsSet_mono`, `dsSet_subset_khinchinSet`, `mem_dsLimsup_of_mem_addWellApproximable`, `mem_addWellApproximable_of_mem_dsLimsup`, `GCDGraph.vertexMeasure`, …, `GCDGraph.R_restrictPow`.

## Verified sound

**Gate, build, dependencies, outside-folder diff.**
- Rerun of the push gate with the Lake build on this head:
  ```text
  gate ProbabilisticAndMetricNumberTheory: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK
  ```
- Dependency check with `--movable`: `depcheck: 237 roadmaps, 2341 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line for this roadmap. Merge order: AnalyticNumberTheoryPartI 49, AnalyticNumberTheoryPartII 50, AdelicAlgebraicGroups 51, GeometryOfNumbersAndQuadraticArithmetic 52, SieveMethodsAndPrimePatterns 56, this roadmap 61, ArithmeticDynamics 336. The same check on GoN's head README reports it moved to #61 with 0 problems (no cycle through this roadmap).
- The change set lists no file outside the folder; the gate agrees (outside-folder=0).
- A scratch copy of `Suggested.lean` with every one-line `sorry` replaced by `first | (rfl; done) | (infer_instance; done) | (simp; done) | (norm_num; done) | (decide; done) | (trivial; done) | sorry` elaborates with 0 errors and 66 `declaration uses sorry` warnings, one per sorried declaration (66 in the file): no declaration closes by a one-tactic probe, so there is no padding of that kind. The `example`-free file has one `import Mathlib` and two existing Tau Ceti modules, no `set_option`, no sorried data.
- Signatures: the worker's elaborated types of all 96 declarations were compared with their README statements. The six flagged binder losses are false positives: `polynomial_haar_mixture` needs `Fintype d` only through the measurability instances of `UnitAddTorus d`, which the elaborated type carries inside its instance arguments; `hΓn`, `ha` and `hu` are unnamed hypotheses present in the elaborated types of `mahler_relativelyCompact_iff`, `modularQuotient_existsUnique_invariant`, `homogeneous_birkhoff`, `bounded_digits_compact_orbit` and `typical_unbounded_semiorbit`.

**Disputed ownership verified at the supplier heads.** GoN #851: README:217–219 (contract), 259–261 (table), 1299, 1301 (§4.2.1–4.2.2 "is ProbabilisticAndMetricNumberTheory §4.9a"), 1306, 1890, 1894 (Mahler), 1358 (finite-label entropy), 1938; Suggested.lean:33, 175–177, 376–377 (comments "Supplied by …"). AA #792: README:131–134, 1739–1744, 3026, 3035; Suggested.lean declares `arithmetic_finite_volume_iff` (252) and `finite_volume_iff` (284) for general groups only. ArithmeticDynamics #1335 README:288 consumes `birkhoff_pointwise` and `birkhoff_pointwise_ergodic` from §4.1. ProbabilisticAndMetricNumberTheoryPartII #1838 cites only §§4.4 and 4.8 (its README:192, 544, 594, 1404, 1437, 1509), both unchanged.

**Declared gaps.** The seven gaps of `design/plan.json` (long means, Kubilius sieve, restricted Dirichlet means, Liouville twists, modulated short sums, prime fourth moment, divisor-bounded mean) are stated in this README as its own targets (§§0.13, 3.7, 5.1, 5.2) at the owner's request recorded at 6fdc62d, and FIX-RT~1 settled them as "not actionable in this package". Not raised. The board's gap announcements on the AnalyticNumberTheoryPartI and SieveMethodsAndPrimePatterns jobs now ask those suppliers for statements this roadmap proves itself; the operator should retire them so no second owner appears.

**Headline theorems.** All headlines the README names are in `Suggested.lean` on native carriers: `turan_kubilius`, `hardy_ramanujan`, `erdos_kac`, `excess_distribution_transfer`, `kubilius_small_prime_model`, `kolmogorov_rogozin`, `cdf_weak_criterion`, the restricted squarefree pair; `weyl_criterion`, `linear_equidistribution_tfae`, `weyl_polynomial`, both polynomial criteria, `polynomial_haar_mixture`, `uniformDistribution_mod_one_tfae`, `erdos_turan`, `koksma`, `borel_normal`, `borel_normal_all_bases`; `volume_dsLimsup_eq_zero/one`, `catlin`, `khinchin`, `mass_transference`, `mass_transference_power`, `jarnik_besicovitch`, `hausdorff_duffin_schaeffer`, `duffin_schaeffer_dimension`, `simultaneous_duffin_schaeffer`; `birkhoff_pointwise`, `birkhoff_pointwise_ergodic`, the Gauss system (`gauss_invariant`, `gauss_exact`, `gauss_mixing`, `gauss_ergodic`), the digit, word, Khinchin and Lévy laws, `gauss_kuzmin`, `transfer_derivative_contraction`, `density_uniform_error`; `lattice_invariant_probability_unique`, `lattice_quotient_ergodic`, `howe_moore_of_cartan`, `howe_moore`, `moore_ergodicity`, `mahler_relativelyCompact_iff`, `modularQuotient_existsUnique_invariant`, `modular_timeOne_mixing`, `homogeneous_birkhoff`, `bounded_digits_compact_orbit`, `typical_unbounded_semiorbit`; `matomaki_radziwill`, `logarithmic_elliott_finite`, `logarithmic_elliott`, `logarithmic_chowla`, both nontrivial two-point bounds. The module docstring names the weighted GCD-graph compression theorem as not statable (no native carrier), with no stand-in. The analytic inputs stated locally in §§0.13, 3.7, 5.1–5.2 are inputs to these headlines, not end theorems, and have no Lean statement; that is consistent with the acceptance-test role.

**Duplication by object at the pins.** Mathlib 1b1ccf4b has no additive, completely additive or completely multiplicative predicate on `ArithmeticFunction` (grep of `Mathlib/NumberTheory/ArithmeticFunction/`), so §§0.1, 0.1a own them; it has `cardFactors_mul` (Misc.lean:294, needs m,n ≠ 0), `cardDistinctFactors_mul` (:377, coprimality only), `prodPrimeFactors` (:54), `prodPrimeFactors_apply` (:66), `IsMultiplicative.prodPrimeFactors` (:73, inside `namespace IsMultiplicative`), `cardDistinctFactors_apply_prime_pow` (:369), `log_apply` (VonMangoldt.lean:53), `powersHom_apply`, `Nat.factorization_mul` (needs a,b ≠ 0), `List.card_toFinset` (Finset/Card.lean:209), `Nat.coprime_zero_left`, `Nat.card_multiples` (Factorization/Basic.lean:531), `Nat.count_modEq_card` (CardIntervalMod.lean:143), `prod_primeFactors_pow_factorization` (:488), `pairwise_coprime_pow_primeFactors_factorization` (:499), `Finset.sum_pow'` (Ring/Finset.lean:168), `Real.digits : ℝ → ℕ → ℕ → Fin b` (Analysis/Real/OfDigits.lean:113), `BoundingSieve.siftedSum_le_mainSum_errSum_of_upperMoebius` (SelbergSieve.lean:217), `ErgodicSMul` (Dynamics/Ergodic/Action/Basic.lean:43), `pow_le_of_le_one` (Order/GroupWithZero/Basic.lean:435). A batch grep of 110 backticked Mathlib and Tau Ceti names cited in the sampled and changed sections found every one at the pins (Tau Ceti: `prod_successiveMin_le_covolume_of_two_pow_finrank_le` MinkowskiSecond.lean:640, `exists_linearIndependent_gauge_eq_successiveMin` SuccessiveMinima.lean:407, `exists_basis_gauge_le_max_one_mul` GaugeBasis.lean:102, `IsUnitary.norm_inner_map_le`, `continuous_apply_prod`, `empiricalMeasure_apply_toReal`, `integral_empiricalMeasure`, `centralMoment_id_two_mul_gaussianReal`, `birkhoffAverage_tendsto_metProjection`, `condExp_ae_eq_integral_of_forall_zero_or_one`, `tendsto_eLpNorm_condExp_iInf`, `exists_isFundamentalDomain_of_properlyDiscontinuousSMul`). No other open roadmap defines complete additivity, `powOfAdditive`, `IsStrongMixing`, `birkhoff_pointwise` or finite-label entropy (roadmap grep over main and 466 open heads; VonNeumannAlgebras uses "completely additive" for normal functionals, a different object).

**Cross-roadmap citations resolved this round.** AnalyticNumberTheoryPartI at 979e68c: §0.18 (README:566), §0.19 (584), §0.21 (604), §1.5 (1028), §3.12a (2346), §3.18 (2432), §3.32 (3075), §3.33 (3087), §3.37 (3188), §3.41 (3258); `dirichlet_polynomial_mean_square` (Suggested.lean:455), `pretentiousDist` (812), `halasz_mean` (850); `restricted_squarefree_landau_count` absent (R03). RandomMatrices on main §3.2 "Weak convergence from transforms and moments" (README:501, moment-to-weak at 506). DiophantineApproximationAndTranscendence on main §0.5 (429), §0.6 "Bad approximation" (502). RepresentationTheory/LieGroups on main: `CartanInvolution` (Suggested.lean:484), `IwasawaData` (509), `kakDecomposition`; Layer 9. ArithmeticDirichletSeries (Completed): Export contract (README:86), `truncatedPerronKernel`, `perronFormula` (102, 270). AnalyticNumberTheoryPartII #1167 §5.3k (README:701–705) — R01.

**Source sample (all 15 targets).** Page markers of the cache files were used where present; the TAO-HOFA file carries printed running heads.

| Target | Source lines checked | Result |
|---|---|---|
| §0.1a | IK2004 waived (Chapter 1); Mathlib `cardFactors_mul` Misc.lean:294, `cardDistinctFactors_mul` :377, `log_apply` VonMangoldt.lean:53, `Nat.factorization_mul` Defs.lean:156, `prodPrimeFactors_apply` :66, `IsMultiplicative.prodPrimeFactors` :73 | Every Mathlib fact cited exists with the stated hypotheses; the three worked values (2^ω(12)=4, 2^ω(4)=2, 2^Ω(4)=4) are correct. |
| §0.2 | ML-ARITH: `cardDistinctFactors_apply` (alias, Misc.lean:347), `cardDistinctFactors_apply_prime_pow` (:369) | Agrees; S({2,3},p)(12)=5, S({2},2)(4)=2≠4, ω(12)=2. |
| §0.4 | TAO-RESIDUES lines 414–420 (Section 3, "However, one can still hope" at 420); `Nat.card_multiples` Basic.lean:531 | Agrees; N=5: mean 7/5, centered pair −1/15; N=6: A=2, V=3. |
| §0.5 | TAO-RESIDUES 414–464; Ring/Finset.lean `prod_one_add` 199, `sum_pow_mul_eq_add_pow` 238 (R04) | Statements agree; line numbers stale. Values 1/6, 2/5, 1/3, (1/3,1/3,1/6,1/6), summed error 1/3 ≤ 9/5. |
| §0.7 | TAO-RESIDUES 414–464; `Nat.count_modEq_card` CardIntervalMod.lean:143 | Agrees; N=5,d=3: masses 1/5,2/5,2/5, errors −2/15, 1/15, sum 4/15, event {1,2} 2/15, statistic 4/15. |
| §1.1 | GS-SIEVING 217–334 (proof of Prop. 2, pp.4–6); composition count 319–322 (misprint below) | ν₃(3)=ν₃(4)=2/27 ≤ 2/9; M₄=203/432 for {2,3}. |
| §1.3 | GS-SIEVING 217–334; Tau Ceti Gaussian moments | 3V²=289/432, difference −43/216; odd moments 2/27 (N=3), −1/27 (N=1). |
| §1.5 | ElsholtzTao2011 2183–2198 (Lemma A.2: constant 30, N>2; example after it); GS-SIEVING 94 ((5)), 159 (Deduction of Theorem 1) | Agrees; the N=2 case f(2)²/2 ≤ 30 f(2)² is the roadmap's own extension. |
| §2.5 | TAO-HOFA-1.1 260 (Ex. 1.1.1, p.4), 329 (Prop. 1.1.2, p.5), 360 (Ex. 1.1.5, p.6), 394 (Prop. 1.1.5, p.7), 421 (Lemma 1.1.6, p.7), 450 (Cor. 1.1.7, p.8), 473–486 (Cor. 1.1.9, pp.8–9), 487 (Ex. 1.1.6, p.9), 497 (Ex. 1.1.7, p.9); heads at 240, 286, 348, 393, 441, 479 | All page numbers and statements agree. |
| §2.6 | TAO-HOFA-1.1 836–844 (complexity, Ex. 1.1.22, pp.16–17; heads 806, 847), 394 (Prop. 1.1.5), 497 (Ex. 1.1.7) | Agrees; the (√2,1/2) example gives Γ=ℤ(0,1), S=T×{0}. |
| §3.1 | KM-2020 54 ((1.2)), 74 ((1.3)), 81 ((1.4)), all on PDF page 2 = printed 252 | Agrees ("pp.252–253" is one page wide). |
| §3.9 | BeresnevichVelani 405 (§5 start, p.980), 710 (Prop. 1.7 of [3], p.986), 789–799 (Lemma 7, p.988); heads 721 (987), 816 (989) | Agrees; Lemma 7's constant (3+4/(c−1)) ≤ 5 at c ≥ 3. |
| §4.8 | Sun2017 116 (Theorem 2, p.3) to 319 (p.6); SarigTransfer 92 (Prop. 1.1, p.6), 312–329 (§2.3, p.11), 399 (p.12) | Agrees; L1(0)=π²/6, Lh=h, P1=1, P(id)(0)=π²/6−1. |
| §4.9 | Sun2017 pp.3–6; SarigTransfer §2.3 (pp.11–13) | h_a′ numerator a²−a−1−2x−x² verified; c₂ ≤ 1/36+1/24 = 5/72; c_a formula numerator a(a−1)²+(2+x)(1+x)² verified by expansion; 1/2+5/72+7/216+19/800+1/4 = 18913/21600 = 0.8756 < 9/10. |
| §5.1a | TaoLogChowla 871–904 ((3.1)–(3.5), Remark 3.1, page 19) | Agrees; natural logarithms. |

Also checked: Ciobotaru2014 Thm 1.2 (line 67, p.2), Def. 2.2 (118, p.3), Def. 2.11 (221, p.6), Lemmas 2.12–2.13 (230, 249; pp.6–7), Lemma 3.1 (315, p.8), Thm 3.2 (359, p.9), §4.1 and Lemma 4.2 (384, 405; pp.9–10); Morris2015 Thm 7.1.1 (6675, printed p.154), Exercise 7.1#5 (6770, p.156), Example 7.2.3 (6824, p.157), Exercise 7.2#12 (6910, p.159), Example 11.1.3 (9085, p.214), §§11.1–11.2 pp.213–220, §14.2 pp.289–292 with (14.2.4) at 12213; Mahler1946 §3 (176), Definitions 1–2 (177, 182, p.155), Theorem 2 (195, p.156); Benoist2019 Fact 1.5 (171, p.7); Milne2017 Theorem 3.3(a) (1483, p.33: finite volume iff Hom(G,G_m)=0); StrauchPorubsky2018 Theorem 1.9.0.3 (2736, p.74) and Theorem 1.11.2.1 (3626, p.95: Erdős–Turán–Koksma with 2/(H+1) and r(h); the s=1 case paired over ±h gives 3/(H+1)+3Σ|S_h|/(hN)).

**Adversarial table** (values computed on each side).

| Statement | Instances | Values | Result | Change |
|---|---|---|---|---|
| §0.1a IsCompletelyAdditive | Ω at 4; ω at 4; log; p-adic valuation at 0 | Ω(4)=2=1+1; ω(4)=1≠2; log 1=0; 0.factorization p=0 | Ω, log, v_p completely additive; ω not | — |
| §0.1a map_pow | f=Ω, n=2, k=0,3 | f(1)=0=0•f(2); Ω(8)=3=3•1 | OK | — |
| §0.1a factorization formula | n=12, f=Ω; n=1 | 2•1+1•1=3; empty sum 0 | OK | — |
| §0.1a powOfAdditive | k=1; f=0; k=0 | 1^(f n)=1; k^0=1 (also 0^0=1) | equals ζ at n>0, 0 at 0 | — |
| §0.1a 2^ω multiplicativity | 12=4·3; 4=2·2 | 2^2=4=2·2; 2^1=2≠4 | multiplicative, not completely | — |
| §0.1a powOfAdditive_mul for Ω | 4=2·2 | 2^Ω(4)=4=2·2 | completely multiplicative | — |
| §0.1a isMultiplicative_of_eq_monoidHom at 0 | m=0, n=1 | Coprime 0 1; g(0)=g(0)·1 | OK | — |
| §0.2 primeDivisibilitySum | ({2,3},p) at 12, 0, 1; ({2},2) at 4 | 5; 0; 0; 2 vs 4 | OK | — |
| §0.3 divisibility, lcm | N=5,d=2; N=12,(4,6); N=5,(2,3) | 2/5, e=−1/10; floor(12/12)/12=1/12; 0 vs 2/25 | OK | — |
| §0.4 moments | N=5, P={2,3}, a=p; N=6 | mean 7/5, pair −1/15; A=2, V=3, N=5 second moment 9/5 | OK | — |
| §0.5 patterns | ({2,3},5), ({2,3},6), ({2,4},4); S={2},T={3},N=5; S=∅,T={2,3},N=6 | 0; 1/6; 1/4 vs 0; 2/5 (model 1/3, error 1/15); 1/3 | OK | — |
| §0.5 summed error | N=5,P={2,3} | 1/15+1/15+1/30+1/6=1/3 ≤ 9/5 | OK | — |
| §0.7 residues | N=5,d=3; N=2,d=5; A={1,2}; F=±1 | masses 1/5,2/5,2/5; sum 4/15; 6/5; 2/15; 4/15 ≤ 2·2·1/15 | OK | — |
| §0.8 CRT | q=(2,3),N=5; q=(4,9),N=36; N=2 | (0,0)↦0, (1,1)↦1/5; 1/36; 17/9 | OK | — |
| §0.9 excess | D(72); mean N=4,12,16; tails N=12 | 3; 1/4, 5/12, 1/2; 1/3, 1/12, 0 | OK | — |
| §0.11 Euler bounds | M=4; M=3; p=2,N=2; base 2 | 9/8; 1; 1/8; 9/4; (1+1/8)(1+1/18)=19/16; M=8: 5/8, 1/8, 5/32 | OK | — |
| §0.11 local term ≤ 2/p² | p ≥ 2 | 1/(p(2p−3)) ≤ 2/p² ⟺ 6 ≤ 3p | OK | — |
| §0.12 concentration | atoms 0,1; δ=1/2; Dirac at δ=0 | 1/2; 0 | OK | — |
| §0.13 summed rough comparison | N=4,y=2 | masses 1/2,1/4,1/4 vs 1/2,1/4,1/8, tail 1/8; sum 1/4, TV 1/8 | OK | — |
| §1.1 ν_p | p=3: e=3,4; p=2 odd, e=2 | 2/27, 2/27 ≤ 2/9; 0; 1/4 | OK | — |
| §1.1 M₄ | P={2,3} | 1/16+2/27+1/3 = 203/432 | OK | — |
| §1.3 even bound | P={2,3} | V=17/36, 3V²=289/432, 203/432−289/432=−43/216; collision Q=145/1296 | OK | — |
| §1.4 cutoff | n=60,z=3,5; n=8,z=3/2; n=30,z=2 | head 2 tail 1; tail 0; head 0 tail 1; 2 log 2 ≤ log 30 | OK | — |
| `turan_kubilius` at N=2 | f(2) | left f(2)²/2, right 30 f(2)² | OK | — |
| §2.1–2.2 Checks | n•(1/2); 0/(1/2) two-sided | δ₀, δ_{1/2}; halves differ | Checks discriminate | — |
| `weyl_polynomial` | α₂=1/2 vs √2 | 2•(1/2)=0 so not irrational; n²/2 ∈ {0,1/2} | hypothesis needed | — |
| `polynomial_haar_mixture` degenerate | s=0; d empty | S={0}, μ=δ₀, ν=δ_{α₀}; one point | OK | — |
| §2.6 subtorus | M=(2) on T; M=column (1,1) | carrier T, haar Haar; ∫mFourier(1,−1)=1, (1,0)↦0 | OK | — |
| §2.7 Erdős–Turán constant | S–P Thm 1.11.2.1 at s=1 | (3/2)(2/(H+1)) = 3/(H+1); (3/2)·2 = 3 | matches Lean | — |
| `starDiscrepancy` | {0}; {1/2}; empty | 1; 1/2; 0 | OK | — |
| §3.1 sets | ψ=1/2: 𝒜₁, 𝒜₂, 0 ∈ 𝒦₂∖𝒜₂ | [1/2,1]; [1/4,3/4]; yes | OK | — |
| §3.2 KM Lemma 5.3 Check | q=2,r=3,ψ=3/10 | M=9/10<1=gcd; overlap [0.35,0.4333]∪[0.5667,0.65] = 1/6 | printed indicator wrong, 2M ≥ gcd right | — |
| `hausdorff_duffin_schaeffer` with increasing ratio | f(r)=r², k=1 | H^f ≡ 0 on ℝ; both conclusions 0=0 | true, not vacuous for f(r)/r→∞ | — |
| `duffin_schaeffer_dimension` edge | all t<1 divergent; converge at t₀<1 | sInf ∅=⊤, min(⊤,1)=1; dimH = t₀ | OK | — |
| §3.9 Cantor Checks | radii 1/16, 1/64 with f=√r | 1/4, 1/8: P4 equality; repeat needs 1/4 ≤ 1/8 | OK | — |
| §3.9 Lemma 7 | c=3 | (3+4/(c−1)) r_A = 5 r_A | OK | — |
| §4.1 truncation/first hit | successor f(k)=k, L=2; Bool flip f=(0,4), c=1 | U=L=2; τ(false)=2, τ(true)=1 | OK | — |
| `birkhoff_pointwise(_ergodic)` | one point f=2; two-point swap f=1_{0} | 2 = E[f|I]; averages → 1/2 = ∫f | OK | — |
| §4.4 Gauss measure | (0,1]; (1/2,1] | 1; log(4/3)/log 2 | OK | — |
| §4.5 words | v_[1,2](0), v_[2,1](0); W_[1,2] | 2/3, 1/3; [[1,2],[1,3]], det −1 squared 1 | OK | — |
| §4.6 mixing/exact Checks | identity on two atoms; swap | 1/2 vs 1/4; no limit (1/2,0,1/2,…) | not mixing; swap ergodic | — |
| §4.6 density bounds | tail preimage | m(B_n) ≥ log 2·μ(B) ≥ m(B)/2 → 1/8 | OK (source error below) | — |
| §4.7 constants | digit 2 term; Lévy | log(9/8) vs printed a(a+1); π²/(12 log 2)=1.1866 vs log φ=0.4812 | OK; golden ratio exceptional | — |
| §4.8 operators | L1(0); Lh; P1; P(id)(0) | π²/6; h; 1; π²/6−1 | OK | — |
| §4.9 contraction | c₁(0); c₂; c₃; c₄; tail; total; h₂′(1) | 1/2; ≤5/72; ≤7/216; ≤19/800; ≤1/4; 18913/21600=0.8756<0.9; −1/72 | OK | — |
| `density_uniform_error`, `gauss_kuzmin` | n=0, x=0,1; a=1 | 1−1/log 2 = −0.4427 (abs ≤ 1); 1/2 vs 0.4150 | OK | — |
| `howe_moore_of_cartan` | G=ℝ, K=0, A⁺=ℝ, e^{it}; compact G | contraction groups trivial, closure not dense; cocompact=⊥ | hypothesis fails / vacuous | — |
| `howe_moore`, `moore_ergodicity` | L=SU(2); S compact | cocompact=⊥; hypothesis fails | vacuous / excluded | — |
| `mahler_relativelyCompact_iff` | n=0,1; n=2 a_t | both sides true; e^(−t)=0.368, 0.0067 | OK | — |
| `lattice_invariant_probability_unique` | ℝ/ℤ; ℝ/{0}; SL₂ | unique; none; Σ mass 2π·2/√3 ≈ 7.26 | OK; owner ANT II §5.3k | R01 |
| §4.9a Koopman | p=2 lattice quotient; GoN general p | same isometry, same continuity lemma | two owners | R02 |
| §4.9b Haar density | d₄ on [0,1]×[1,2] | 1/2 = 4·(1/4−1/8); densities 1, y⁻¹ give 16, 4 log 2 | OK | — |
| `modular_timeOne_mixing` | a₁ entries; a_t⁻¹ n_x a_t | e, e⁻¹; n_{e^(−2t)x} | OK | — |
| §4.10 conventions | t=log 2, x=1; (−1,1) | a_t u_x=[[2,2],[0,1/2]]; ↦(0,1/2); golden x: min(1,√c)=0.618 | OK | — |
| `shortMean`, MR Check | f=1, h=2; f=1, x=y=X | 3/2; (X+1)/X both, difference 0 | OK | — |
| §5.1 inclusion–exclusion | {2},{3} at 6,2,1 | 1, 0, 0 | OK | — |
| `logCorrelation` | λ, (n,n+1), x=w=2, 4; same forms | 1/(2 log 2); −1/12; 13/12 | OK | — |
| §5.2 twisted Liouville | χ₀ mod 2, x=3 | 1/2+2/3 = 7/6 vs 1/2 | OK | — |
| §5.1a entropy | (1/2,0,1/4,1/4) | H(X|Y)=0.4774, H(Y)=0.5623, sum 1.0397 = (3/2) log 2 | OK | — |
| §5.3 models | R(4), R(6), S(12); N=4 | 0, ξ₂ξ₃, ζ₂²ζ₃; second moments 3, 4 | OK | — |
| `liouville_two_point_nontrivial` | h=1, X=4 | −1+1−1−1 = −2, 1/2 < 1 | OK | — |
| README:73 supplier name | ANT I 979e68c | `restricted_squarefree_landau_count` absent; §3.41 has `restrictedSquarefreeCount` | stale | R03 |
| Ring/Finset.lean lines | pin 1b1ccf4b | 199–200, 238–239 vs cited 196–198, 231–237 | stale | R04 |
| `TauCeti.DuffinSchaeffer.*` | pinned Tau Ceti | no such namespace; own namespace TauCetiRoadmap.…DuffinSchaeffer | misleading prefix | R05 |

## Not verifiable

- Waived and cited by locator only: IK2004 (new, "Chapter 1"; the locator is coarse but the definitions it carries are standard), Koukoulopoulos2019, Kubilius1964, RS1962, Falconer1990, PollingtonVaughan1990, Rogozin1961a, Rogozin1961b, BHV2007.
- Gorodnik2010 is a scan with largely garbled OCR; only its coverage (bounded orbits, badly approximable numbers) was confirmed, not wording.
- The ElsholtzTao2011 and GS-SIEVING cache files carry no page markers; statements were checked by line, the physical page numbers were not re-derived.
- Ownership was checked against main, the board packages and the 466 open heads the roadmap tools index; nothing unindexed was searched.

## Source issues

- **Misprint** in GS-SIEVING at proof of Proposition 2, printed p.5 (lines 319–322): the source counts compositions of k into s parts each at least two as binomial(k−s, s); it should be binomial(k−s−1, s−1), compositions of k−s into s positive parts; affects nothing.
- **Error** in SarigTransfer at Appendix A.2, proof of Rényi's theorem, printed p.31 (line 1190): the source derives m(B_n) ≥ μ(B_n)/(2 ln 2) from its density bounds; the density is at most 1/ln 2, so only m(B_n) ≥ (ln 2)μ(B_n) follows; affects the proof.
- **Misprint** in KM-2020 at Lemma 5.3, printed p.264 (line 613): the indicator is printed as M(q,r) > gcd(q,r); the intervals can meet when 2M(q,r) ≥ gcd(q,r) (q=2, r=3, ψ=3/10 has M=9/10 < 1 and overlap 1/6), so the cutoff should be 2M ≥ gcd; affects a stated result.
- **Misprint** in Smyth2020 at Theorem 21, printed Lesson 9 (line 2103–2109): the source writes the Khinchin constant as the product over k of (1+1/(k(k+1)))^(log k/log 2) with the numerical value 2.6854; the factor should be k(k+2), which gives that value; affects a stated result.
- **Misprint** in BeresnevichVelani at Lemma 7, printed p.988 (line 795): the source writes c·r_M ≤ d(x_M, z) for a point z outside cM; the inequality is strict; affects nothing.
