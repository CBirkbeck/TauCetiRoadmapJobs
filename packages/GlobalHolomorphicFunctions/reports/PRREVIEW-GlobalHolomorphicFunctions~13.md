# Review of GlobalHolomorphicFunctions (pull request #992 at 9b76a62)

**Verdict:** needs changes

This head is the one the previous review read; the folder is unchanged. The previous review's only finding, the pull-request description, is not repaired and is carried as R03. R01 and R02 are new. Both come from ownership checks no earlier round ran: Tau Ceti's circle-Laurent file at the pin, and Hyperfunctions HF2 on main.

## R01 (P2) — Layer 2.5 truncates Laurent series that Layer 4.1 builds two layers later, and Tau Ceti's circle-Laurent API is uncited

**Location.**

- `TauCetiRoadmap/GlobalHolomorphicFunctions/README.md:1196`–1197 (2.5): "For arbitrary `f∈H(ℂ\{a})`, first truncate its Laurent series on a neighborhood of `K`, then push the finitely many pole terms."
- 2.5's *Needs:* line (`:1255`–1256) names no Laurent input, and neither do Layer 2's Dependencies (`:1267`: "Layer 0 for scalar Runge; …").
- 4.1 builds the decomposition (`:1562`–1567).
- 4.1's *Needs:* line (`:1598`) reads "native Laurent decomposition".

**Claim.** Layer 2 needs only Layer 0 and native results, and the Laurent decomposition is native.

**Witness.** Tau Ceti's `Analysis/Complex/Laurent/Basic.lean` has only `circleLaurentCoeff` (:49), radius independence (:123) and the two-circle formula (:167), all uncited. The punctured-plane series is 4.1's target. ComplexKahlerGeometry on main (`README.md:1620`–1635) requires this phase before GH0.

ComplexKahlerGeometry K3 (`README.md:345`–348) also consumes the construction, and the README does not list K3 among its consumers.

**Repair.**

1. Under "From Tau Ceti", add the following from `TauCeti/Analysis/Complex/Laurent/Basic.lean`, with their hypotheses (continuity on the closed annulus, complex differentiability off a countable set in the open annulus):
   - `TauCeti.circleLaurentCoeff`;
   - `TauCeti.circleLaurentCoeff_eq_of_differentiable_on_annulus_off_countable`;
   - `TauCeti.circleLaurentCoeff_sub_zpow_smul`;
   - `TauCeti.two_pi_I_inv_smul_circleIntegral_sub_inv_smul_sub_of_differentiable_on_annulus_off_countable`.
2. Move the local Laurent decomposition out of 4.1 into a subsection before Layer 2, for example a new 0.4. It consumes those declarations and proves only the series step:
   - the geometric expansion of the two circle integrals;
   - the positive part on the disc;
   - the negative part on the whole punctured plane;
   - uniqueness and coefficient extraction.

   4.1 keeps the global batch patching.
3. Cite the new subsection in 2.5's and 4.1's *Needs:* lines (replacing "native Laurent decomposition") and in Layer 2's Dependencies.
4. Add ComplexKahlerGeometry K3 to Downstream consumers as a consumer of that subsection's finite-pole phase.

The other admissible repair is to delete the arbitrary-`f` clause from 2.5 and keep pole pushing for simple fractions only.

**Tested.** Take `f = e^{1/z} ∈ H(ℂ∖{0})` and `K = {|z| = 1}`. Keeping five negative terms leaves an error of at most `Σ_{k>5} 1/k! = 0.0016152` on `K` (0.0013027 at `z = e^{2i}`). That bound is exactly the punctured-plane convergence the new subsection supplies before Layer 2. The scalar Runge equivalence and `exists_finite_rank_runge_operator` push only the simple fractions `1/(z−ζ)` of the cutoff Cauchy–Green formula, so no headline of `Suggested.lean` changes.

## R02 (P3) — Hyperfunctions HF2 on main also states the one-variable ∂̄ surjectivity and `H¹(Ω,𝒪)=0`; Scope and Downstream consumers do not record it

**Location.**

- `TauCetiRoadmap/GlobalHolomorphicFunctions/README.md:59`–60: "Hyperfunctions consumes this roadmap's one-variable results and is downstream, so nothing of it is an input here."
- `:2280`: "Hyperfunctions HF2 uses the one-variable input through those analytic layers."

**Claim.** Hyperfunctions only consumes this roadmap's one-variable results.

**Witness.** `TauCetiRoadmap/Hyperfunctions/README.md:192`–194 on main: "Own MalgrangeTopVanishing: for n≥1, every open Ω⊆ℂⁿ … equivalently the top-degree smooth Dolbeault operator is onto." At n = 1, p = 0 this is 7.1's `exists_smooth_conjWirtingerDeriv_eq`; `H¹(Ω,𝒪)=0` is 7.4.

**Why the ownership stays here.** HF2 proves the n = 1 case by its own real-Laplacian route (`:195`–233), not from this roadmap. Under the main-first rule this roadmap would cite HF2, but that would close a cycle:

- HF2's harmonic Runge step uses ComplexKahlerGeometry K5a's compact-distribution dual (Hyperfunctions `README.md:202`).
- K5a consumes this roadmap's complex two-form exactness of Layer 7.2 (ComplexKahlerGeometry `README.md:35`–36).
- Layer 7.2 is built on 7.1.

So 7.1 → HF2 → K5a → 7.2 → 7.1. Hyperfunctions' own `STATUS.md:50` expects `H¹(U,𝒪)=0` for open `U⊆ℂ` from this roadmap (labelled GH0 there).

The second owner of the n = 1 case is therefore HF2. Only Hyperfunctions can narrow its statement to n ≥ 2 or take n = 1 from Layer 7.1, and that change is outside this pull request. What this README owes is the record that the Scope rules require for an object another roadmap also states.

**Repair.**

1. After `:60` insert:

   > Hyperfunctions HF2's MalgrangeTopVanishing states that the top-degree smooth Dolbeault operator is onto on every open subset of ℂⁿ, n ≥ 1; at n = 1 and p = 0 it is the solver of Layer 7.1, and `H¹(Ω,𝒪)=0` is the Cousin I theorem of Layer 7.4. This roadmap owns the one-variable case: HF2's harmonic Runge step consumes ComplexKahlerGeometry K5a, which consumes Layer 7.2, so taking Layer 7.1 from HF2 would close the cycle 7.1 → HF2 → K5a → 7.2 → 7.1.

2. Replace `:2280` by: "Hyperfunctions consumes Layer 0.3's compact-support Cauchy–Green formula, and the case n = 1 of its HF2 MalgrangeTopVanishing is Layers 7.1 and 7.4."

**Tested.** With the inserted paragraph, the dependency check on a scratch copy of the README prints `depcheck: 235 roadmaps, 2261 edges, 0 problem(s)`. Hyperfunctions' permalink into this roadmap (its `README.md:29`, at the old compact-support Cauchy–Green lines, now 0.3) still points at content this README keeps.

## R03 (P3) — The pull-request description still declares #886 a dependency and describes files the folder lacks

This is the previous review's R01 (raised four times since the ninth review), not repaired. The folder is unchanged, and the description cannot be repaired by editing the folder: the repair falls to the description's author and to whoever regenerates its depends-on and merge-order blocks.

**Location.** The description of #992 contains:

- "- [ ] depends on: #886";
- "DifferentialGeometry #886 supplies generic forms and finite-cycle Green";
- "`ProductCotangentTargets.lean` supplies eight actual formula definitions and eighteen illustrative theorem targets";
- "twenty-eight intentional proof-target admissions";
- the depends-on entry "- [ ] #886 DifferentialGeometry";
- the merge-order line "#886 (DifferentialGeometry) → **this pull request** (#992)".

**Claim.** DifferentialGeometry #886 must merge first, and the folder holds a companion file with 28 admissions.

**Witness.**

- `README.md:25`–26: "none of these is a target here, and DifferentialGeometry is not a supplier."
- DifferentialGeometry is on main, so #886 is a revision and never a dependency.
- The folder holds `README.md`, `Suggested.lean` and `metadata.toml` only; the build gives 22 `sorry` warnings.

**Repair.**

1. Delete the "depends on: #886" line, the #886 depends-on entry and the #886 merge-order line.
2. Delete the DifferentialGeometry, `ProductCotangentTargets.lean`, GH4 paired-cotangent and 28/18-admission passages.
3. Name the suppliers as the README does: ZerosOfLFunctions, AnalyticNumberTheoryPartI and ConformalMapping, all on main.

**Tested.** The dependency check on this README lists no open supplier (output under Verified sound), so the depends-on block is empty after the repair.

## Previous findings

- **R01 of the previous review (P3, pull-request description): not repaired.** The description still contains "- [ ] depends on: #886", and its merge-order block still reads "#886 (DifferentialGeometry) → **this pull request** (#992)". Carried as R03.
- The previous review's record of the five findings before it (6.4 consuming ConformalMapping §5.6, the uniform logarithmic-derivative estimate in 1.3, the DLMF locators, the 6.4 split, the sharp bound over `SeminormedCommRing`) still holds: the folder is byte-identical. I re-read §5.6 and the DLMF equations this round (below).

## Verified sound

**Gate, build and Lean form.**

- **Gate.** I ran the push gate myself on 9b76a62. Every check is 0 and it ends `OK` (`set_option=0 … source-material=0 OK`). The worker's run, which includes the build, also reports `build=0 OK`.
- **Changes outside the folder.** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/GlobalHolomorphicFunctions'` is empty.
- **Build.** `lake env lean` on `TauCetiRoadmap/GlobalHolomorphicFunctions/Suggested.lean` exits 0 with exactly 22 "declaration uses `sorry`" warnings and nothing else, at lines 51, 72, 91, 109, 129, 141, 154, 172, 182, 191, 199, 213, 225, 238, 250, 267, 276, 287, 304, 312, 320 and 327. Pins: Tau Ceti `2fd255d9`, Mathlib `1b1ccf4b`, Lean `v4.36.0-rc2`.
- **Signatures.** I compared the elaborated types of all 24 declarations (`signatures.md`, regenerated from this file) with the README statements, and each matches. The file has no `variable` block, so no binder can be lost.
- **One-tactic probe.** The probe the previous review used is unsound: `first | rfl | … | simp | …` stops at a `simp` that makes progress without closing the goal, so `exact?` never runs. I reran it on a scratch copy with every alternative forced to close its goal: `first | (rfl; done) | (infer_instance; done) | (simp; done) | (norm_num; done) | (trivial; done) | (positivity; done) | (aesop; done) | exact?`. All 22 theorems fail at the final `exact?` ("could not close the goal"), so none follows in one tactic or from one library lemma, and none is padding.
- **Headlines.** The README's headline theorems are all stated:
  - Looman–Menchoff;
  - the sharp finite-product bound;
  - the weighted and native-divisor genus-one products;
  - Runge with the hull equality and the finite-rank operator;
  - zero-free approximation;
  - zero and signed divisor realization;
  - boundary noncontinuation;
  - Mittag–Leffler, isolated singularities and the quotient;
  - Cauchy–Pompeiu on a cycle;
  - the ∂̄ solver, with closed completion in scalar and form versions;
  - complex and real two-form exactness and `H²_dR = 0`;
  - Cousin I.

  `IsRungeCompactPair` and `holomorphicHull` have real bodies on native carriers. Imports are `import Mathlib` plus five `TauCeti.*` modules present at the pin. There is no `set_option`, no `lemma` and no sorry'd data.
- **Namespace.** No other roadmap's `Suggested.lean` uses `TauCetiRoadmap.GlobalHolomorphicFunctions` (`roadmaps grep --lean-only`).

**Dependency check** (the brief's command):

```text
depcheck: 235 roadmaps, 2261 edges, 0 problem(s)
```

The merge order has ZerosOfLFunctions at line 48, AnalyticNumberTheoryPartI at 50 and this roadmap at 97. ConformalMapping is completed on main. There is no UPWARD, CYCLE or `moved:` line. Adding a citation of Hyperfunctions HF2 to 7.1 on a scratch copy also prints 0 problems: the tool does not see the layer cycle of R02.

**Library declarations opened at the pins this round (52 declarations in 33 rows).** These are a different set from the previous review's 14.

| Declaration | File:line | What it says, checked against the README |
|---|---|---|
| `Finset.norm_prod_one_add_sub_one_le` | `Mathlib/Analysis/SpecialFunctions/Log/Summable.lean:137` | exp bound under `[NormedCommRing R] [NormOneClass R]` (:129), as 1.4 says |
| `Real.prod_one_add_le_exp_sum` | `Mathlib/Analysis/Complex/Exponential.lean:679` | nonnegative family |
| `cot_series_rep`, `cotTerm_identity`, `summable_cotTerm` | `…/Trigonometric/Cotangent.lean:233, 207, 215` | paired series on `ℂ_ℤ` |
| `summableLocallyUniformlyOn_iteratedDerivWithin_cotTerm` | same file `:322` | needs `1 ≤ k`, as 6.1 says |
| `HasProdLocallyUniformlyOn_euler_sin_prod`, `multipliableUniformlyOn_euler_sin_prod_on_compact` | same file `:136, 122` | sine product |
| `Complex.tendsto_euler_sin_prod` | `…/Trigonometric/EulerSineProd.lean:272` | root-namespaced |
| `Complex.GammaSeq_tendsto_Gamma`, `Complex.Gamma_mul_Gamma_one_sub` | `…/Gamma/Beta.lean:335, 398` | as cited |
| `Real.tendsto_harmonic_sub_log` | `Mathlib/NumberTheory/Harmonic/EulerMascheroni.lean:153` | in `namespace Real` |
| `SmoothPartitionOfUnity.exists_isSubordinate` | `Mathlib/Geometry/Manifold/PartitionOfUnity.lean:556` | `[T2Space M] [SigmaCompactSpace M]`, closed `s` |
| `TendstoLocallyUniformlyOn.deriv` | `Mathlib/Analysis/Complex/LocallyUniformLimit.lean:154` | open `U`, eventual holomorphy |
| `logDeriv_prod` | `Mathlib/Analysis/Calculus/LogDeriv.lean:104` | factors nonzero and differentiable at the point |
| `HasProdLocallyUniformlyOn` | `Mathlib/Topology/Algebra/InfiniteSum/UniformOn.lean:147` | locally uniform limit of finite-subset products |
| `MeromorphicOn.AnalyticOnNhd.divisor_apply` | `Mathlib/Analysis/Meromorphic/Divisor.lean:79` | divisor = order on analytic `f` |
| `VectorMeasure.exists_extension_of_isSetSemiring_of_le_measure` | `Mathlib/MeasureTheory/VectorMeasure/AddContent.lean:322` | dominated extension |
| `ComplexMeasure.HaveLebesgueDecomposition`, `ComplexMeasure.rnDeriv` | `…/VectorMeasure/Decomposition/Lebesgue.lean:414, 429` | as 0.2 uses them |
| `Complex.volume_closedBall` | `Mathlib/MeasureTheory/Measure/Lebesgue/VolumeOfBalls.lean:427` | area `πr²` |
| `Complex.differentiableAt_log` | `Mathlib/Analysis/SpecialFunctions/Complex/LogDeriv.lean:41` | on `slitPlane` |
| `contMDiffOn_iff_contDiffOn`, `contMDiffAt_subtype_iff` | `…/ContMDiff/NormedSpace.lean:63`, `…/ContMDiff/Basic.lean:363` | restriction comparison of 7.2 |
| `TauCeti.IsFilledIn` | `TauCeti/Topology/FilledIn.lean:61` | `∀ x ∈ Ω \ K, ¬(IsCompact (closure C) ∧ closure C ⊆ Ω)`, the very set in `holomorphicHull_eq_fill` |
| `IsOpen.isFilledIn_closedBall_sdiff_thickening` | `TauCeti/Analysis/Normed/Module/Exhaustion.lean:57` | `0 ≤ r`, `0 < δ` |
| `IsOpen.exists_isFilledIn_compact_exhaustion` | same file `:86` | existential; its proof uses 2.1's stages |
| `holomorphicFunctions`, `HolomorphicFunctions.tendsto_iff_tendstoLocallyUniformlyOn` | `TauCeti/Analysis/Complex/HolomorphicFunctions/Basic.lean:39, 161` | carrier and convergence as 2.2 states |
| `holomorphicGerms`, `.eval`, `.restrict`, `.eval_restrict`; `HolomorphicFunctions.toGerm` | `TauCeti/Analysis/Complex/Germ/Algebra.lean:37, 112, 132, 169`; `HolomorphicFunctions/Germ.lean:45` | as 2.3 states |
| `norm_le_mul_pow_of_mem_ker_jet` | `HolomorphicFunctions/RestrictionEstimate.lean:45` | jet-kernel estimate |
| `Contour.Cycle.norm_integral_le_of_norm_le_const` | `TauCeti/Analysis/Contour/Cycle/Basic.lean:400` | length weighted by `\|coeff\|`, so 2.4's twice-circle Check is an equality |
| `Cycle.IsIn`, `Cycle.integral_smul`, `Cycle.IsNullHomologous`, `PiecewiseC1ClosedCurve.of` | same file `:261, 388, 447, 91` | as 3.1 uses them |
| `Cycle.homologyCauchyTheorem`, `Cycle.exists_int_windingNumber_of_not_mem_trace` | `Cycle/HomologyCauchy.lean:261`, `Cycle/Winding.lean:137` | as cited |
| `IsPiecewiseC1On.windingNumber_eq_of_mem_connectedComponentIn` | `Contour/Winding/LocallyConstant.lean:138` | `_root_.TauCeti.IsPiecewiseC1On` |
| `isExactOn_of_forall_closed_integral_eq_zero`, `exists_differentiableOn_eqOn_exp_comp_of_isExactOn` | `Contour/Primitive.lean:183, 263` | as cited |
| `TauCeti.morera` | `Analysis/Complex/Conformal/Morera.lean:40` | open `U`, continuity |
| `exists_contDiff_conjWirtingerDeriv_apply_one_eq_of_hasCompactSupport` | `Wirtinger/Potential.lean:41` | `n : ℕ∞`, `1 ≤ n`, so `n = ∞` is admissible |
| `HasCompactSupport.hasFDerivAt_integral_sub_inv_smul`, `…conjWirtingerDeriv_integral_sub_inv_smul_apply_one` | `Pompeiu/Basic.lean:219, 261` | `C¹` data |
| `mem_closedForms_of_finrank_le`, `deRhamCohomology.mk_surjective`, `mk_eq_zero_iff` | `Geometry/Manifold/DeRham/Basic.lean:121, 159, 170` | as 7.2 uses them |

Present at the pin and not duplicated, because the carrier differs:

- `TauCeti.subsingleton_deRhamCohomology_normedSpace` (`DeRham/NormedSpace.lean:64`) is the Poincaré lemma on `ℂ` itself, not on the subtype `↥U`.
- `TauCeti.Prod.mextDeriv_realPlaneDx/Dy/XDy` (`DifferentialForm/Plane/Basic.lean:32`, `Plane/XDy.lean:34`) are on `ℝ × ℝ`.

**Cross-roadmap citations resolved (6).**

- **AnalyticNumberTheoryPartI on main.** §0.15 at `README.md:530`: the product theorem under `Σ(R/|a_i|)^(p_i+1)<∞` with exact orders, the sharp estimate, and the fibre grouping at `:537`. §0.15a: `exists_entire_exp_mul_of_divisor_eq` for two nonzero entire functions. These match the contract at `:314`–330.
- **ZerosOfLFunctions on main.** 5.1 (`:929`), 5.2 (`:938`: `E₁`, `deriv E₁ z = −z exp z`, `logDeriv`, small-disc estimate), 5.3 (`:957`, product indexed by the divisor support) and 5.4 (`:979`). These match `:305`–312.
- **ConformalMapping (Completed).** §5.3 at `README.md:787`; §5.6 at `:906`–936 with the sign laws; `jordan_index_of_isPiecewiseC1On` at `Suggested.lean:640`. These match `:340`–350.
- **ComplexKahlerGeometry on main.** K5a consumes GH5.1 (`:35`–36); K2 consumes GH0 and GH5 (`:1637`). K3 consumes the local Laurent phase (`:345`–348, R01).
- **Hyperfunctions on main.** `:29`–30 consumes the compact-support Cauchy–Green formula (now 0.3); HF2 at `:192` (R02).
- **Permalinks.** Both consumers cite this roadmap by permalinks at a pull-request commit. The ids GH0, GH2, GH5 and GH5.1 they use still exist ("Layer k is cited by consumers as GH(k−2)", `:361`). `overlaps.md` lists no dropped id and no other pull request that changes this roadmap.

**Ownership against open pull requests.** `roadmaps grep` over the 458 open pull requests and main:

- `Looman` hits only #992.
- `Runge` elsewhere means rigid Runge immersions (AdicSpacesPartIV in #1187), or consumers of this roadmap (ComplexComparisonPartII #848, ComplexKahlerGeometry #1234/#1807/#1808/#1854).
- `Cousin I|additive Cousin`, `holomorphic hull`, `Pompeiu` and `Mittag.Leffler` find no second owner of the one-variable objects. The Mittag–Leffler hits are inverse-system conditions.
- `Malgrange|top vanishing` finds Hyperfunctions HF2 on main (R02) and Koszul–Malgrange in ComplexKahlerGeometry (a different theorem).

**Sources: the seeded sample (15 targets and the conventions).** Rainer's printed page is the PDF page minus 6. Every line below was read this round.

| Target | Locator in README | Text at the locator | Verdict |
|---|---|---|---|
| 0.1 | Rainer §10, (10.1), p. 23 (rainer 1211) | `∮_{∂U} g dζ = ∬ g_ζ̄ dζ̄∧dζ`, `U` on the left; with `dξdη = −(2i)⁻¹ dζ∧dζ̄` (rainer 1253) this is `2i∬ g_ζ̄ dA` | correct; agrees with Conventions and 0.2's Check |
| 0.2 | gray-morris Thm 3, p. 247 (66); Appendix Lemma 1, pp. 252–253 (310–325) | partials everywhere, CR everywhere, continuity ⇒ analytic; Lemma 1's `5N·m(R−E)` | correct; balanced restriction repairs the source error below |
| 1.1 | Remark 15.4, p. 38 (2030) | defines `E₀ = 1−z`, `E_p`; zero only at 1 | correct as differentiation of the definition; I recomputed `−1+(1−w)Q_p′ = −w^p` |
| 2.2 | §11, (11.2), Exercises 19–20, p. 25 (1313, 1329) | `d = Σ 2^{−n}\|f−g\|_{K_n}/(1+\|f−g\|_{K_n})`; completeness and continuity of `f ↦ f′` as exercises | correct |
| 2.3 | §11, p. 25 (1333) | `O(K)` in `C(K)`, "in general it is not closed" | correct |
| 2.4 | derived from the interval-integral bound and `Cycle.norm_integral_le_of_norm_le_const` | — | correct as derived |
| 3.3 | Thm 15.5, p. 39 (2086) | region; disks with radii → 0 and distinct zeros; identity-theorem argument | correct; the README's dense-boundary construction reuses that argument |
| 4.1 | Thm 12.1, p. 31 (1603); Thm 15.7, pp. 39–40 (2126); Thm 15.6, p. 39 (2116) | `p_a ∈ H(ℂ*_a)`; `φ_a ∈ H(U_a∖{a})` with `ord(f−φ_a) > m_a`; quotient | correct; the Lean docstring states the dropped order clause |
| 6.1 | dlmf-4-22 lines 80, 104–109; dlmf-5-8 line 79 | (4.22.2) cosine product; (4.22.3) `cot z = 1/z + 2zΣ 1/(z²−n²π²)` for `z≠nπ`; (5.8.2) `1/Γ` | correct after `z ↦ πz` |
| 6.2 | Thm 14.3, pp. 35–36 (1868) and derived estimates | uniform convergence of `Σ\|f_n\|` on compacta ⇒ products converge, orders add | correct |
| 6.3 | Ex. 22, p. 30 (1592); Thm 11.1, p. 25 (1338); Lemma 11.3 (3)–(4), pp. 27–28 (1437); Thm 11.7, p. 29 (1550) | half-planes and `iℝ`; Runge (1)⇔(2)⇔(3); hull = `K` ∪ relatively compact components, compact, idempotent; poles in the compact components of `ℂ∖U` | correct; the README's sphere-component phrasing counts ∞ for the unbounded components |
| 7.1 | Thm 12.2, p. 31 (1630) | `f ∈ C^∞(U)` ⇒ `u ∈ C^∞(U)`, `∂u/∂z̄ = f` | correct; the shell route is a variant with the same inputs |
| 7.2 | derived from 7.1 and the pinned form API | — | correct as derived; Checks recomputed below |
| 7.3 | (10.1) (1211); proof of Prop. 10.1, p. 23 (1237) | polar bound `∬\|ζ−z\|⁻¹ ≤ ∫∫ dr dφ` | correct |
| 7.4 | Prop. 12.3 and Thm 12.4, p. 32 (1658, 1689) | partition of unity `f_i = Σ φ_j f_ij`, then ∂̄ correction; `f_ik = f_ij + f_jk` | correct; equivalent to `c_ij+c_jk+c_ki=0` given `c_ii=0` and `c_ji=−c_ij`, which the Lean hypothesis forces |
| Conventions | Notation, p. v (rainer 81) | "A domain is a nonempty open subset" | correct |

**Adversarial pass.** S = `Suggested.lean`, R = `README.md`. The values were computed this round with my own pure-Python scripts: truncated products with `N = 2·10⁵`, midpoint quadrature with the Cauchy-kernel singularity subtracted exactly, and central differences with `h = 10⁻⁶`.

| Statement | Instances | Values computed on each side | Result | Change |
|---|---|---|---|---|
| S Looman–Menchoff (0.2) | `z²` at `1+i`; `z̄`; Looman's `exp(−z⁻⁴)`, `f(0)=0`; `Ω=∅` | `f_y = −2+2i = i·f_x`; `f_y=−i ≠ i = i·f_x` (excluded); `\|f\| = 11.49, 64.39` at `r=0.8, 0.7` on `arg=π/4` (excluded by `hcont`); vacuous | Pass | none |
| R 0.2 balanced estimate | unbalanced `[0,20]×[0,1]`, `E={(0,0),(20,1)}`, `N=1`, `φ=y(20−x)c(x)`; balanced `[0,2]×[0,1]`, same pattern | left side `≥ 199.8` vs `5N·m = 100` (source lemma fails); `≈ 2 ≤ 10`; empty-slice bound uses `\|x−x_β\|+\|x_β−x_α\|+\|x_α−x\| = 2(max−min) ≤ 2w_J` | Pass | none (source issue) |
| R 0.3 cutoff Cauchy–Green (route of the finite-rank operator) | `f=e^z`, `K` = closed unit disk, radial cutoff 1 on `r≤1.2`, 0 on `r≥1.8` | `−π⁻¹∫∂̄α f/(ζ−z)` = `1.2433023+0.5256598i` vs `e^{0.3+0.4i}` = same; `0.4065697` vs `e^{−0.9}` = same | Pass | none |
| R 1.1 derivatives and log bound | `E₂′(−1)`; `E₀′`; `E₁′(1)`; `w=1/2`, `w=1` | `−0.6065307 = −e^{−1/2}`; `−1`; `−e`; `log‖E₁(1/2)‖ = −0.1931 ≤ 0.25`; `0 ≤ 1` | Pass | none |
| S `exists_entire_genusOne_product` | `S={n²}`, `m=1`; `S=∅`; `S={2}`, `m=0` | product at `2+i`: `−0.4312778−9.3328073i` vs closed form `e^{π²z/6} sin(π√z)/(π√z)`: same; `F(0)=1`; `F(4+h)/h → 90.04 ≠ 0` (order 1 = `m`); `F=1`; factor 1, order 0 | Pass | none |
| S `…_of_divisor` | `D=Σ[n²]`; `D=2[1]`; `D=[1]−[2]` | same `F`, divisor 1 at each `n²`; `(1−z)²e^{2z}`, divisor 2; excluded by `hD` | Pass | none |
| S sharp bound (1.4) | 2000 random complex families of size 0–6; `u=(1,1)`; ℤ₃ `u=(3,3)` | `max(LHS−RHS) = 4.4·10⁻¹⁶`; `3 ≤ 3` vs exp bound `6.389`; `1/3 ≤ 7/9` | Pass | none |
| R 1.3 genus, variable genera | `aₙ=n`; `aₙ=2ⁿ`; `p_n=n−1` at ratio ½ | genus 1; genus 0, tail `R·2^{1−N}` = ½ at `R=1, N=2`; majorant `2^{−n}` | Pass | none |
| R 1.5 uniform-tail criterion | `X=ℕ`, `uₙ=[x=n]/(n+1)`; unbounded `u₀(x)=x` | tail `1/(N+1)` while `Σ sup` is harmonic; boundedness needed, since `\|p_M−p_N\| = \|1+x\|\|∏−1\|` is not uniform | Pass | none |
| S `IsRungeCompactPair` | `(∅,∅)`; `{2≤\|z\|≤3}` in `D₄`; same in `{1<\|z\|<4}` | true; false (component `\|z\|<2` has compact closure in `D₄`); true | Pass | none |
| S `holomorphicHull` | `K=∅` with `f=0`, `B=−1`; annulus in `{1<\|z\|<4}` at `1.5` | `∅`; `\|1/1.5\| = 0.667 > ½ = sup_K\|1/z\|`, excluded | Pass | none |
| S `holomorphicHull_eq_fill` | `K=∅`; annulus in `D₄`; annulus in `{1<\|z\|<4}` | `∅` both sides (a component with compact closure in `Ω` would be clopen in ℂ); closed 3-disc both sides; `K` both sides | Pass | none |
| S Runge equivalence | annulus in `D₄` with `1/z`; disc in `D₂`; `K=∅` | `∮_{\|z\|=5/2}1/z = 2πi` vs 0 for every `g∈H(D₄)`: both sides false; both true; both true | Pass | none |
| S finite-rank operator | `K=∅`; `f=0`, `B=0`; `K` = closed unit disk with the cutoff formula above | `L=∅`, `N=0`; `0 ≤ 0`; quadrature reproduces `e^z` to `10⁻¹⁰`, sample points in `supp ∂̄α ⊆ int L` | Pass | none |
| S zero-free approximation | `K={1≤\|z\|≤2}`, `Ω=ℂ∖{0}`, `u=z−½` | `G_N(1) = 0.6065, 0.5134 → ½` at `N=1, 3`; `G_N = z·exp(L_N)` nowhere zero on `Ω` | Pass | none |
| S zero orders; signed divisor | `m=0`; `2[2]`; `ν=2[0]−[1]` | `f=1`; `(z−2)²`; `z²/(z−1)`, orders 2 and −1 | Pass | none |
| S boundary germ (3.2) | `Ω=ℂ∖{0}`, `f=sin(1/z)`; `Ω=∅` | zeros `1/(kπ)` in the punctured ball force `F≡0` near 0, while `f(2/π)=1`; frontier `∅` | Pass | none |
| R 3.3 stages | `D_m` and levels `n ≥ m` | points at level `n` are outside `D_n ⊇ D_m`: 0 points | Pass | none |
| S Mittag–Leffler | `E=ℤ`, `P_n=1/(z−n)`; `E=∅` | `π cot πz`, residue 1, holomorphic off ℤ; `f=0` | Pass | none |
| S isolated singularities | `E={0}`, `U₀=ball(0,½)`, `φ₀=1/z+1/(z−½)`; `exp(1/z)` | `f=1/z`, remainder `−1/(z−½)` analytic at 0; remainder 0 | Pass | none |
| S quotient | `F=1/z`; `F≡0`; `F=cot` | `(1,z)`; `(0,1)`; `(cos,sin)`, `g≠0` off `πℤ` | Pass | none |
| S `cauchyPompeiu` | `Δ={½<\|z\|<1}`, `C` = outer − inner, `f=z̄²+z\|z\|²`, `ξ=0.7+0.1i` | RHS `0.8299728−0.0899977i` (300×600), `0.8300039−0.0900011i` (600×1200) vs `f(ξ) = 0.83−0.09i`; with `+` area sign `0.8097+0.2186i` | Pass | none |
| S ∂̄ solver | `u=z̄²/2` at `0.7−0.4i`; `u=−e^{−\|z\|²}` at 1 | `u_x+iu_y = 1.4+0.8i = 2z̄`; `0.7357589 = 2e^{−1}` | Pass | none |
| S closed completion | `f=z²z̄`, `g=zz̄²` at `0.3+0.8i` | `g_x+ig_y = 2.92 = f_x−if_y = 4\|z\|²` | Pass | none |
| S completion form; complex exactness | `f=z, g=z̄`; `g=0`; `η=dz∧dz̄`, `β=−z̄dz` | `dz̄∧dz+dz∧dz̄ = 0`; `dz∧dz̄(1,i) = −2i ≠ 0`; `dβ = dz∧dz̄`, while `+z̄dz` gives `+2i` | Pass | none |
| S real exactness; `H²` | `η=dx∧dy`, `β=(xdy−ydx)/2`; swapped `β`; `U=∅`; circle | `dβ(1,i) = 1`; swapped gives 0; zero form; on `S¹` every one-form is closed yet `H¹=ℝ` | Pass | none |
| S Cousin I | `Ω=ℂ∖{0}`, `U₁=ℂ∖[0,∞)`, `U₂=ℂ∖(−∞,0]`, `c₁₂ = 1` on `Im>0`, 0 on `Im<0`; one set | `b₁=1−L₁/(2πi)`, `b₂=−L₂/(2πi)`: `b₁−b₂ = 1` at `i` and `2+0.5i`, `0` at `−i` and `−3−0.1i`; no constant solution, since `c₁₂` is not constant on `U₁∩U₂`; `3c₁₁=0` | Pass | none |
| R 2.2 metric | constants `1/(n+1)`; `t=1` | distance `1/(n+2)`; `min(1,t)/2 = t/(1+t) = ½` | Pass | none |
| R 2.3 `O(K)` | `{0}`; `{0,1}`; `εz̄` on the closed disk | `O = ℂ`; `a+(b−a)z`; `∂̄ = ε ≠ 0` | Pass | none |
| R 2.4 cycle bound | twice the unit circle, `f−g=1/z` | `\|2·2πi\| = 4π = \|2\|·2π·1` | Pass | none |
| R 2.5 Laurent truncation (R01) | `f=e^{1/z}`, `K={\|z\|=1}`, 5 negative terms | error `≤ 0.0016152`, `0.0013027` at `e^{2i}`; needs 4.1's punctured-plane convergence | Fail (order) | R01 |
| R 4.1 Laurent phase (R01) | `exp(1/z)`; `2/z` | negative part `Σ z^{−k}/k!` converges on `ℂ∖{0}`; principal part `2/z`, remainder 0 | Pass (content) | R01 (placement) |
| R 6.1 products | cosine at `0.2−0.3i`; `1/Γ(½)`; shifted sine `α=0.3, z=0.4+0.2i` and `α=−0.45, z=1.7−0.5i` | `1.1957246+0.6397068i` vs `1.1957245+0.6397076i`; `0.5641899` vs `0.5641896`; `0.9740348−0.3941001i` vs `0.9740339−0.3941006i`; `−1.7742667+1.6273006i` vs `−1.7742571+1.6272641i` | Pass | none |
| R 6.2 theta, `e^z−1` | `r=0.4`, `z=0.2+0.7i`; `z=0.9+2.1i` | ratio `1.5654995−1.3186021i = r⁻¹e^{−z}`; `−2.2417211+2.1231545i` vs `−2.2417210+2.1231524i` | Pass | none |
| R 6.3 examples | crescent at `−½`, `−1+t`; half-plane substitution; point-normalized `n=1`; annulus transfer | `\|2z−1\|=2`; `\|z_t\|=1−t`, `\|2z_t−1\|=3−2t`; `Re(−iz)=Im z`; `(½)/(½)=1`; `K̂_{Ω₂}=K` (component `1<\|z\|<2` meets `\|z\|=1 ∉ Ω₂`) | Pass | none |
| R 7.3 coordinates and moments | `d(iz²)`, `d(i\|z\|²)` at 1 and `i`; `d\|z\|⁴` at 2; log-square at 2; moments `(0,0),(1,0),(2,2),(2,1)` | `2i, 2i`; `−2, 0`; `32`; `log 2` both sides; `3.1415927, 0, 1.0471894 (π/3), 0` | Pass | none |
| R 7.4 / R02 ownership | HF2 MalgrangeTopVanishing at `n=1, p=0` vs `exists_smooth_conjWirtingerDeriv_eq` | same surjectivity; consuming HF2 closes 7.1 → HF2 → K5a → 7.2 → 7.1 | Fail (record) | R02 |

The table has 37 rows. They cover the 15 sampled targets, all 22 theorems and both definitions of `Suggested.lean`, and every target R01 and R02 touch.

## Not verifiable

- None. All four sources recorded in `sources.toml` (rainer, gray-morris, dlmf-4-22, dlmf-5-8) were read at every sampled locator from the sources cache.

## Source issues

- **Error** in gray-morris at Appendix, Lemma 1, p. 253: the source says the `5N·m(R−E)` bound holds for every closed rectangle `R`; it should be restricted to rectangles of bounded side ratio, since `[0,20]×[0,1]` with two corner points of `E` gives 199.8 against 100; affects the proof.
- **Gap** in gray-morris at Appendix, proof of the Looman–Menchoff theorem, p. 253: the source says Baire is applied to `E` as a complete metric space; it should be applied to `E` as a locally compact space, since `E` is only relatively closed in `D`; affects the proof.
- **Gap** in rainer at proof of Proposition 15.2, p. 37: the source says Lemma 15.1, stated for a domain whose complement joins `a_j` and `b_i`, applies on an unnamed neighbourhood of `K`; it should be applied on `ℂ∖P` for a path `P` from `b_i` to `a_j` in `V_j`; affects the proof.
- **Misprint** in rainer at proof of Proposition 15.2, p. 37: the source says the final error is below `2ε` while the proposition asserts `ε`; it should be run with `ε/2`; affects nothing.
- **Misprint** in rainer at proof of Theorem 14.3, p. 36: the source says `f_N` is uniformly convergent; it should say the partial products `p_N`; affects nothing.
