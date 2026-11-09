# Review of GlobalHolomorphicFunctions (pull request #992 at af99bc5)

**Verdict:** needs changes

Two findings, one blocking, both carried from the previous review. This head repairs that review's R02, R03 and R04. R01 (two owners for the finite-rank Runge operator, scalar Runge, the scalar ∂̄ solver and planar two-form exactness) and R05 (the pull-request description) are unchanged.

The gate passes, the dependency check reports 0 problems, `Suggested.lean` is byte-identical to the previous head and elaborates with exactly 22 `sorry` warnings, the one-tactic probe closes none of them, every cited library declaration elaborates at the pins, and every sampled locator opens on the cited statement.

## Repairs of the previous review's findings

- **R01 (P2, ownership against ComplexKahlerGeometry's revision): not repaired.** `README.md:58`–59 still reads "ComplexKahlerGeometry K2 owns parameter-dependent solvers … they consume this roadmap's scalar results and complex two-form exactness"; `:1159`, `:2002`, `:2101`, `:2128` and `:2132`–2135 repeat it. ComplexKahlerGeometry #1398 is still at `1038b167` with the same claims (R01 below).
- **R02 (P3, Layers 0.3 and 2.4 planned native results): repaired.** `README.md:576`–585 now reads "The regularity of the transform is native too … Every derivative is transferred to the datum … by `HasCompactSupport.hasFDerivAt_integral_sub_inv_smul` applied once per order … None of these is a target here." The API bullet `:608`–610 lists them as native. 2.4 (`:1079`–1083) reads "For a finite cycle the estimate is not a target: it is Tau Ceti's `TauCeti.Contour.Cycle.norm_integral_le_of_norm_le_const` applied to f−g". The contract (`:148`–154, `:167`–174, `:194`–201) and the *Needs:* lines (`:626`–631, `:1100`–1103) cite the four declarations. `:2132`–2133 now says K2 consumes the Riemann-sum estimate "whose derivative transfer and parameter smoothness are Tau Ceti's".
- **R03 (P3, second proofs of pinned theorems): repaired.** Former 6.2 is deleted; 6.3–6.6 are renumbered 6.2–6.5. `:1505`–1507 reads "The paired cotangent series … is Mathlib's `cot_series_rep` rewritten by `cotTerm_identity`, and is not proved again here." Its computed values are 6.1 Checks (`:1563`–1570). 2.4 `:1085`–1087 reads "Compact-open closedness of the holomorphic functions is Tau Ceti's `isClosed_holomorphicFunctions` and is not proved again here." No other roadmap cites the renumbered 6.x ids (grep over main and 468 heads).
- **R04 (P3, wrong Mathlib name): repaired.** `:97` and `:701` read `MeromorphicOn.AnalyticOnNhd.divisor_apply`, which elaborates at the pin.
- **R05 (P3, pull-request description): not repaired.** The description still contains "- [ ] depends on: #886", "Dependencies: DifferentialGeometry #886 supplies generic forms and finite-cycle Green", the merge-order chain "#886 (DifferentialGeometry) → #1126 … → this pull request", and "`ProductCotangentTargets.lean` supplies eight actual formula definitions" (R02 below).

## R01 (P2) — This roadmap and ComplexKahlerGeometry's open revision both own the finite-rank Runge operator, scalar Runge, the scalar ∂̄ solver and planar complex two-form exactness

**Location.** `TauCetiRoadmap/GlobalHolomorphicFunctions/README.md:58`–59: "ComplexKahlerGeometry K2 owns parameter-dependent solvers … they consume this roadmap's scalar results and complex two-form exactness"; `:1159` ("the finite-rank linear Runge operator used by GH5 and CKG K2"); `:2002`, `:2101`, `:2132`–2135. `Suggested.lean:125`, `:150`, `:263`, `:300`.

**Claim.** ComplexKahlerGeometry consumes these four objects from this roadmap and states none of them.

**Witness.** ComplexKahlerGeometry #1398 at `1038b167`, `README.md:30`–32: "Layer 2 owns finite-rank Runge approximation and the simultaneous smooth and holomorphic parameter solver; … Layer 5 its planar de Rham consequence"; `:56`–59: this roadmap's §§0.3, 2.5 and 7.2 "state … the finite-rank Runge operator and planar two-form exactness … nothing is imported from them for those objects"; `:553` establishes `finite_rank_runge_approximation`, `:614` the scalar case (P = Q = point) of `mixed_parameter_solver`, `:1621`–1626 planar exactness; `Suggested.lean:74`. ComplexKahlerGeometry on main (`README.md:200`, `:1637`) consumes them from GH0 and GH5.1 instead. Once #1398 merges, each object has two owners, and the one on main (ComplexKahlerGeometry, before this roadmap in the order) is the owner the merge order sanctions.

**Repair.** One owner per object before either pull request merges, by either route.

- **(a) This roadmap consumes them.** Add `### From TauCetiRoadmap.ComplexKahlerGeometry` citing Layer 2's scalar Runge and `finite_rank_runge_approximation`, the scalar case of `mixed_parameter_solver`, and Layer 5's complex two-form exactness. Delete `exists_finite_rank_runge_operator`, `exists_smooth_conjWirtingerDeriv_eq` and `exists_mextDeriv_eq_complex_two_form` from `Suggested.lean`; reduce `isRungeCompactPair_iff_approximation` to what that layer does not state (the hull equality and point separation). Make 2.5 (`:1159`–1175), 7.1 (`:1853`–1880) and the complex case of 7.2 (`:1986`–1989) consume them. Delete `:58`–59, `:2002`, `:2101` and `:2132`–2135. Name the revision in the merge-order paragraph.
- **(b) The revision gives the objects back.** #1398 drops its Layer 2 and Layer 5 ownership claims and consumes GH0 and GH5.1 as main does; this pull request's description then states that order.

Tested on the instance: with (a), `finite_rank_runge_approximation` at `g′ⱼ = wⱼ gⱼ` yields the bound `‖f z − Σ wⱼ f(ζⱼ) gⱼ z‖ ≤ εB` of `Suggested.lean:163` symbol for symbol.

## R02 (P3) — The pull-request description names a dependency the README rules out and describes a file and a pin the folder does not have

**Location.** The description of #992: "- [ ] depends on: #886"; "Dependencies: DifferentialGeometry #886 supplies generic forms and finite-cycle Green"; "`ProductCotangentTargets.lean` supplies eight actual formula definitions and eighteen illustrative theorem targets"; "twenty-eight intentional proof-target admissions … Tau Ceti a91d3aaf"; the merge-order paragraph "#886 (DifferentialGeometry) → #1126 … → this pull request".

**Witness.** `README.md:22`–26 assigns the forms, wedge and cycle Green to Tau Ceti and says "DifferentialGeometry is not a supplier"; it is the folder's only mention of DifferentialGeometry. The folder holds `README.md`, `Suggested.lean` and `metadata.toml` only. `Suggested.lean` elaborates with 22 `sorry` warnings at Tau Ceti `2fd255d9`.

**Repair.** Delete the `depends on: #886` line, the DifferentialGeometry sentence, the `ProductCotangentTargets.lean` sentence and the stale validation paragraph; the chain becomes #1126 → this pull request, plus the ComplexKahlerGeometry revision if R01 takes route (a).

Tested on the instance: with the lines deleted, every *Needs:* line of the README still names a supplier on main, at the pins or at #1126 (the table below).

## Verified sound

**Gate and build.**

- **Gate.** The worker's gate on `af99bc5` printed every check at 0, then `OK`.
- **Changes outside the folder.** `git diff --stat origin/main...HEAD` outside the folder is empty.
- **Build.** `lake env lean TauCetiRoadmap/GlobalHolomorphicFunctions/Suggested.lean` (Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`) exits 0 with exactly 22 `declaration uses sorry` warnings, at lines 51, 71, 90, 106, 125, 137, 150, 168, 178, 187, 195, 209, 221, 234, 246, 263, 272, 283, 300, 308, 316 and 323. The file is byte-identical to the previous head (`git diff df49770 HEAD --stat`: README only), so the 24 elaborated signatures of the worker's `signatures.md` are the file's; none has a `variable` binder to lose, and I compared each with its README statement again: the `↑⊤` smoothness order in the form statements, the `2 f z` convention of the solver, the `codiscreteWithin` hypotheses of Layer 4 and the `Function.locallyFinsuppWithin` carriers all agree.
- **One-tactic probe.** On a scratch copy with every `sorry` replaced by `first | rfl | infer_instance | simp | norm_num | aesop`: 22 errors, 0 closed. No padding.

**Dependency check.** The brief's command printed exactly:

```text
depcheck: 238 roadmaps, 2320 edges, 0 problem(s)
```

The merge order has ZerosOfLFunctions at 48, AnalyticNumberTheoryPartI at 50 and this roadmap at 97; ComplexKahlerGeometry, ZerosOfLFunctions and Hyperfunctions are on main; ConformalMapping is under `Completed/`.

**Citations resolved, at the copy named.**

- **ZerosOfLFunctions (main).** 5.1 at `:929`, 5.2 at `:938` (`E₁ z = (1 − z) exp z`, `deriv E₁ z = −z exp z`, `logDeriv`, the small-disk estimate), 5.3 at `:957`, 5.4 at `:979`.
- **AnalyticNumberTheoryPartI (#1126, via `roadmaps show`).** §0.15 at `:531` has `elementaryFactor`, the sharp disc estimate `|1−E_p(w)|≤|w|^(p+1)` (`:536`), the compact-sup product theorem with additive orders, fibre grouping, the identification of `E₁` with ZerosOfLFunctions' factor (`:539`) and `exists_entire_primary_product_exact` (`:533`); §0.15a at `:555` has `exists_entire_exp_mul_of_divisor_eq` with both nontriviality hypotheses.
- **ConformalMapping (`Completed/`).** §5.3 `jordan_separation` at `:787`–790 (two components, the bounded one `filledHull C \ C`).
- **Downstream.** ComplexKahlerGeometry on main cites GH0 (`:198`–200), GH2 §4.1 (`:345`), GH5.1 (`:35`); Hyperfunctions on main cites GH0 (`:29`); ArithmeticInterpolationDeterminants #1905 cites §2.5's finite-jet interpolation (present at `:1132`–1142); RelativisticQuantumFieldTheory #1772 cites GH2's local Laurent phase (`:1444`–1452). AutomorphicSpectralTheoryPartII #1761 cites a heading "Preparatory primary factors and locally uniform products" this roadmap does not carry: that is #1761's citation to repoint to AnalyticNumberTheoryPartI §0.15; nothing on main cites it.

**Pinned declarations opened.** A scratch file with `#check @name` for every backticked library name of the README (about 150) elaborated with no error after `lake build` of the eleven Tau Ceti modules whose object files the shared lake directory lacked (`Contour.Primitive`, `Wirtinger.Potential`, `Pompeiu.Basic`, `Pompeiu.Parameter`, `CauchyKernel`, `Conformal.Morera`, `Normed.Module.Exhaustion`, `HolomorphicFunctions.Jet`, `.RestrictionEstimate`, `.Germ`, `Green.Cycle`). Statements read against the README's wording:

- Mathlib: `cotTerm` (`Cotangent.lean:177`, `1/(x−(n+1)) + 1/(x+(n+1))`), `cotTerm_identity` (`:207`, `2x/((x+(n+1))(x−(n+1)))` on `ℂ_ℤ`), `cot_series_rep` (`:233`, indexed by `ℕ+`), `summableLocallyUniformlyOn_iteratedDerivWithin_cotTerm` (`:322`, `1 ≤ k`, on `ℍₒ`, as 6.1 says); `Finset.norm_prod_one_add_sub_one_le` (`Log/Summable.lean:137`, `[NormedCommRing R] [NormOneClass R]`); `Real.prod_one_add_le_exp_sum` (`0 ≤ f i`); `HasCompactSupport.contDiff_convolution_right` (`Convolution.lean:421`, `{n : ℕ∞}`); `intervalIntegral.norm_integral_le_of_norm_le` (`IntervalIntegral/Basic.lean:754`, `a ≤ b`, bound a.e. on `Ioc a b`); `polynomialFunctions.starClosure_topologicalClosure` (`StoneWeierstrass.lean:456`, `[RCLike 𝕜] [CompactSpace s]`); `Metric.isOpen_thickening` (`Thickening.lean:74`); `MeromorphicOn.AnalyticOnNhd.divisor_apply` (`Divisor.lean:79`); `Complex.volume_closedBall` (`ofReal r ^ 2 * π`); `SmoothPartitionOfUnity.exists_isSubordinate` (finite-dimensional, `T2Space`, `SigmaCompactSpace`, closed `s`). The sharp bound `‖∏(1+uᵢ)−1‖ ≤ ∏(1+‖uᵢ‖)−1` is in neither Mathlib nor Tau Ceti at the pins (grep for `norm_prod_one_add`, `one_add_norm`), as 1.4 claims.
- Tau Ceti: `Cycle/Basic.lean:377` `integral_add` (both integrands continuous on the trace), `:388` `integral_smul` (`[RCLike 𝕜]`), `:400` `norm_integral_le_of_norm_le_const` (length = Σ |coeff| · ∫ Ι ‖γ′‖, the raw integral `∫ t in γ.a..γ.b, deriv γ t • f (γ t)` per generator), `:447` `IsNullHomologous`; `Cycle/HomologyCauchy.lean:261` `Cycle.homologyCauchyTheorem` (`IsOpen U`, `IsIn C U`, `DifferentiableOn`, `IsNullHomologous C U`), the name 3.1 uses; `Cycle.exists_int_windingNumber_of_not_mem_trace`; `Pompeiu/Basic.lean:219` `hasFDerivAt_integral_sub_inv_smul` (`ContDiff ℝ 1`, derivative `∫ (w − z)⁻¹ • fderiv ℝ f z`, no completeness); `Pompeiu/Parameter.lean:75` `contDiffOn_integral_sub_inv_smul_with_param` (`{n : ℕ∞}`, open `s`, compact `k`, joint `Cⁿ` on `s ×ˢ univ`); `Wirtinger/Potential.lean` `exists_contDiff_conjWirtingerDeriv_apply_one_eq_of_hasCompactSupport` (`1 ≤ n`, complete `W`); `Exhaustion.lean` `IsOpen.isFilledIn_closedBall_sdiff_thickening` (`0 ≤ r`, `0 < δ`) and `IsOpen.exists_isFilledIn_compact_exhaustion` (existential, nested interiors, union `Ω`); `Regularity.lean` `isSmoothForm_ofFunction_iff` (`[IsManifold I 1 M]`) and `isSmoothForm_mextDeriv` (`[IsManifold I 2 M]`, `n + 1 ≤ p`); `Squared.lean` `mextDeriv_mextDeriv` (`IsSmoothBundleForm … 2`); `Wedge/Leibniz.lean` `mextDeriv_wedgeWith` (sign `(−1)^k`, both forms differentiable at the point); `Plane/Complex.lean` `mpullback_complexDz` (no regularity hypothesis); `DeRham/Basic.lean` `mem_closedForms_of_finrank_le` (`finrank ℝ E ≤ k`, `[IsManifold I 2 M]`) and `deRhamCohomology.mk_eq_zero_iff`; `Germ/Algebra.lean` `holomorphicGerms.eval x hx : holomorphicGerms s →ₐ[ℂ] ℂ`; `RestrictionEstimate.lean` `norm_le_mul_pow_of_mem_ker_jet` (`M (r/R)^(n+1)` on `closedBall a r`, `r < R`); `Green/Cycle.lean` `Cycle.green_winding` (`C¹` fields, `IsIn`, `IsNullHomologous`).

**Sources: the seeded sample.** Rainer: printed page = cache PDF page − 6 (page markers at lines 1302 = 31, 1508 = 35, 1601 = 37, 1653 = 38, 1815 = 41, 1952 = 43, 2015 = 44, 2080 = 45, 2130 = 46).

- **0.2.** gray-morris line 66 (p. 247): Theorem 3 with everywhere partials, CR everywhere, continuity. Lemma 1 at lines 315–325 (pp. 252–253): "Let R be a closed rectangle", no side-ratio condition; the proof of Theorem 3 at lines 338–345 defines `E_n` by `0 < |h| ≤ 1/n` without an endpoint-in-domain clause and applies Baire "to the complete metric space E". The README's balanced-rectangle, endpoint-in-domain and local-Baire versions (`:380`–399, `:371`–378) repair those (source issues below).
- **1.1, 1.3.** rainer line 2030 (p. 38): Remark 15.4 defines `E_p = (1−z) exp(z + … + z^p/p)`.
- **1.2, 6.2.** rainer line 1868 (pp. 35–36): Theorem 14.3 with `Σ|f_n|` uniformly convergent on compacts.
- **1.4.** rainer lines 1843–1853 (p. 35): the proof of Proposition 14.2 compares `∏(1+a_n) − 1` with the same monomial sum in `|a_n|`.
- **2.1.** rainer line 1437 (pp. 27–28): Lemma 11.3 items (1) distance, (2) convex hull, (3) union of K and relatively compact components, (4) compact and idempotent. The README's 2.1 cites (1), (2), (4) and 2.5 cites (3), as stated.
- **2.2.** rainer lines 1313–1332 (p. 25): (11.2) is `Σ 2^{−n} |f−g|_{K_n}/(1+|f−g|_{K_n})`; Exercise 19 metric and completeness, Exercise 20 continuity of `f ↦ f′`.
- **2.3.** rainer line 1333 (p. 25): `O(K)` as restrictions of functions holomorphic near `K`, "in general it is not closed".
- **2.5, 6.3.** rainer line 1338 (p. 25): Theorem 11.1; line 1550 (p. 29): Theorem 11.7 with one pole chosen in each compact complementary component.
- **6.5.** No locator; its cotangent series is `cot_series_rep` (above).
- **7.1.** rainer line 1630 (p. 31): Theorem 12.2, `U` a domain, `f ∈ C^∞(U)`.
- **7.2.** No source locator; its inputs are the Tau Ceti declarations above.
- **7.3.** rainer line 1211 (p. 23): equation (10.1); line 1237 (p. 23): the polar integrability of `|ζ−z|^{−1}`. The README's "rainer line 1189" is the chapter heading two lines above §10; the section, equation and page it names are right.
- Also opened: Theorem 10.2 at line 1255 (kernel `−π⁻¹ ∬ f/(ζ−z)`, `dξdη = −(1/2i) dζ∧dζ̄` at 1253), Theorem 10.3 at 1295 (`ψ ∈ C_c^∞(U)`, 1 near `K`), Proposition 10.1 at 1216, Theorem 12.1 at 1603 (`p_a ∈ H(ℂ∖{a})`), Proposition 12.3 at 1658 and Theorem 12.4 at 1689 (`f_ik = f_ij + f_jk`), Proposition 15.2 at 1950, Theorem 15.3 at 1997, Theorem 15.5 at 2086 (a region), Theorem 15.6 at 2116, Theorem 15.7 at 2126 (`φ_a ∈ H(U_a∖{a})`, `ord_a(f−φ_a) > m_a`).

**Ownership by object.** `roadmaps grep --fixed` over main and 468 open heads for Looman, finite-rank Runge, `finite_rank_runge`, holomorphic hull, Cousin I, Mittag, `cot_series_rep` and Cauchy–Pompeiu: Looman–Menchoff has no other hit; the Mittag-Leffler hits are the inverse-limit condition; the Cousin hit in RealAnalyticGeometry consumes scalar Cousin I; RealAnalyticGeometry's hull is the several-variable Stein hull; PseudoholomorphicCurveAnalysis 3.1 (main) owns `Lᵖ` bounds for `T`, not the cycle formula; ComplexComparisonPartII #848 only cites K2; the #1807, #1808 and #1854 hits are copies of ComplexKahlerGeometry's main text. The only second owner is ComplexKahlerGeometry #1398 (R01). Ownership against the pull requests the brief names without files was checked through `roadmaps grep` only.

**Adversarial pass.** S = `Suggested.lean`, R = `README.md`; numbers from a scratch script this round.

| Statement | Instances | Values computed on each side | Result |
|---|---|---|---|
| S Looman–Menchoff | f=z; f=z̄; Looman exp(−z⁻⁴), 0 at 0; Ω=∅ | f₁=1, f_I=i=i·f₁; f_I=−i≠i (excluded); CR everywhere but f(z)/z→∞ along arg z=π/4 (gray-morris line 63), excluded by `ContinuousOn`; vacuous | Pass |
| R 0.2 balanced estimate vs Gray–Morris Lemma 1 | R=[0,3]×[0,1], F={(0,0),(3,1)}, N=1 | N(2w_J+h_J)=7 per slice, over 3 empty-slice length: 21 > 15 = 5N·m(R∖F); balanced bound 5N·h_R=5 per slice | Pass (source issue) |
| R 0.2 square-to-ball | r=1 | area(Q)=4, area(ball √2)=2π, ratio π/2 | Pass |
| R 0.3 kernel sign | radial cutoff φ(0)=1 | ∫(πζ)⁻¹∂̄φ dA = ∫₀¹φ′ = −1 = −φ(0); Rainer (10.4) kernel `z−ζ` | Pass |
| R 0.3 derivative transfer (native) | `Pompeiu/Basic.lean:219` | derivative of Tφ at w is `∫ (w−z)⁻¹ • fderiv ℝ φ z`; `ℂ →L[ℝ] ℂ` is a `NormedSpace ℂ` via `SMulCommClass ℝ ℂ ℂ`, so the iteration is well-typed | Pass |
| R 1.1 derivatives | E₂′(−1); E₁′(1); E₀′(0.3+0.2i); E₃′/E₃ at 0.4+0.1i | −0.606531 = −e^{−1/2}; −2.718282 = −e; −1.000000; −0.071622−0.090270i both sides | Pass |
| R 1.1 log bound | 59 radii × 360 angles; w=1/2; w=1 | max(log‖E₁‖−‖w‖²) = −0.000139; −0.193147 ≤ 0.25; log 0 = 0 ≤ 1 | Pass |
| S `exists_entire_genusOne_product` | S=∅; S={1}, m=2; S={2}, m=0 | F=1, orders 0; (1−z)²e^{2z}, order and divisor 2 at 1; factor 1, order 0, Σ-index `Fin 0` | Pass |
| S `…_of_divisor` | D=0; D=2[1] | F=1, divisor 0; Σ D/‖ρ‖² = 2, `toNat` 2 | Pass |
| S sharp bound | u=(1,1), (1,−1), (−1,0), ∅; 20 000 random families of size ≤ 5 | 3≤3 (Mathlib's bound 6.389); 1≤3; 1≤1; 0≤0; max(LHS−RHS) = 2.2·10⁻¹⁶ | Pass |
| R 1.3 genus | aₙ=n; aₙ=2ⁿ | Σ1/n=∞, Σ1/n²<∞: genus 1; Σ2⁻ⁿ=1: genus 0, tail 2^{1−N} | Pass |
| R 1.5 boundedness hypothesis | u₀(x)=x, uₙ=1/n² on ℕ; indicator family | tails uniform but P_M−P_N=(1+x)(…) not uniformly small, so the hypothesis is needed; tail 1/(N+1), Σ sup = ∞ | Pass |
| S `IsRungeCompactPair` | (∅,∅); unit circle in ℂ; 2≤\|z\|≤3 in D₄; same K in 1<\|z\|<4 | true; false; false; true | Pass |
| S `holomorphicHull` | K=∅; circle in ℂ; annulus in 1<\|z\|<4 | ∅ (f=0, B=−1); closed disk; K (1/z) | Pass |
| R 2.1 stages | Ω=D; Ω=ℂ; Ω=∅; radius n+1 instead of (n+1)⁻¹ | K₀={0}, K₁={\|z\|≤1/2}, K₂={\|z\|≤2/3}; closedBall 0 (n+1); ∅; every stage empty | Pass |
| R 2.1 distance and convex hull | K={2≤\|z\|≤3}, Ω=D₄ | dist(K,Ωᶜ)=dist(K̂,Ωᶜ)=1; K̂ = closed 3-disk = conv K | Pass |
| R 2.2 metric | U=∅; constants differing by 1; 1/(n+1) on ℂ at n=3; t=1; zⁿ/n on D | 0; Σ2⁻ⁿ/2 = 0.5; 0.2 = 1/(n+2); 1/2 = 1/2 ≤ 1; sup norms 1/n and 1 | Pass |
| R 2.3 O(K) | K=∅; {0,1}; {0}; εz̄; Σzⁿ/(n+1)² | one element; a+(b−a)z; O(K)=ℂ, germ algebra infinite-dimensional; ∂̄=ε≠0; Σn/(n+1)²=∞ | Pass |
| R 2.4 curve and cycle estimates | unit circle, f−g=1; reversed; twice the circle with f−g=1/z | 0≤2π; −2πi, length 2π; ‖2·2πi‖ = 12.566 = \|2\|·2π·1, equality; ignoring the coefficient gives 2π | Pass |
| S Runge equivalence | annulus in D₄ with f=1/z; closed unit disk in D₂; (∅,∅) | period 2πi on \|z\|=5/2 vs 0, both sides false; both true; both true | Pass |
| S `holomorphicHull_eq_fill` | K=∅, Ω=D₁; circle in ℂ | ∅ both sides; closed disk both sides | Pass |
| S finite-rank operator | K={0}, U=Ω=ℂ, f=c; K=∅ | N=1, ζ=0, w=1, g=1, error 0 ≤ εB; L=∅, N=0 | Pass (R01) |
| S zero-free approximation | annulus with u=z; Ω=∅ | g=z, winding 1 (exponentials give 0); vacuous | Pass |
| S zero orders and divisor | m=0; m=2[2]; ν=2[0]−[1] | f=1; (z−2)²; z²/(z−1), orders 2, −1, ≠ ⊤ | Pass |
| S boundary germ | Ω=∅, ℂ; ℂ∖{0} at 0; ℂ∖ℝ at 0 | vacuous; zeros accumulating force order ⊤; both half-disk components | Pass |
| S Mittag-Leffler | E=∅; E={0}, P=1/z²+z | f=0; f=1/z², g=−z | Pass |
| S isolated singularities | P=exp(1/z); P=1/z+1/(z−1/2) on ball(0,1/2) | f=P, g=0; f=1/z, g=−1/(z−1/2); Rainer 15.7 (line 2126) admits it, 12.1 excludes it | Pass |
| S quotient | F=1/z; F≡0 on a component; Ω=∅ | f=1, g=z; f=0, g=1; vacuous | Pass |
| R 6.1 products | cos at 1/4; 1/Γ(1/2); shifted sine α=0.3, z=0.2; α=1/2 | 0.707107 = cos(π/4); 0.564190 = 1/√π; 1.0000004 vs 1; prefactor 1, exponent 0 | Pass |
| R 6.1 cotangent Checks | z=i; y=1, 10, 100; z→1/2 | π cot(πi) = −3.153348i = −i(1+2S₁), S₁=(π coth π−1)/2=1.076674; omitting z⁻¹: −2.153348i; π/2−S₁=0.494122; paired sums −3.153347i, −3.141583i, −3.141493i → −πi; (z−1/2)(−π tan πz) → 1.000000 | Pass |
| R 6.2 theta and lattice | r=1/2, z=0.3+0.1i; shells N=1, 2 | 1.474234−0.147917i = r⁻¹e^{−z}; 4 points, Σ\|λ\|⁻³ = 4 ≤ 11.314; 8 points, 1.914 ≤ 2.828 | Pass |
| R 6.3 crescent | z=−1/2; −t; −1+t; z=0 | \|2z−1\|=2; \|1/z\|=1/t; \|2z−1\|=3−2t>1; 0∉Ω | Pass |
| S `cauchyPompeiu` | unit disk f=\|z\|², ξ=0.3; f=z̄, ξ=0.3; f=1, ξ=0 | boundary 1, π⁻¹∫z/(z−ξ) = 0.910099, f(ξ)=0.089901 ≈ 0.09; residues cancel, π⁻¹∫1/(z−ξ) = −0.299996 = −ξ̄, so 0.3 = 0+0.3; 1−0 | Pass |
| R 6.4 Euler example | z=1 | z e^{z/2}∏ = 1.718282 = e−1 | Pass |
| S ∂̄ solver | f=z̄; f=z; f=z e^{−\|z\|²} | u=z̄²/2 (1 at z=1); \|z\|²; −e^{−\|z\|²} (e⁻¹ at 1) | Pass |
| S closed completion, scalar | f=z with g=z̄; f=z̄ with g=0 | gₓ+ig_y=2=fₓ−if_y; 0=1−i(−i) | Pass |
| S closed completion, form | f=z, g=z̄; g=0 | d(z̄dz+zdz̄)=dz̄∧dz+dz∧dz̄=0; dz∧dz̄ has value −2i on (1,i) | Pass |
| S complex exactness | η=dz∧dz̄ | h=1, u=z̄, d(−z̄dz)=dz∧dz̄; +u dz gives +2i | Pass |
| S real exactness | η=dx∧dy | u=z̄/2, β=(x dy−y dx)/2, dβ(1,i)=1; swapped β gives 0 | Pass |
| S `H²` vanishing | U=∅, ℂ; the circle | only the zero form; [dx∧dy]=0; on S¹ every one-form is closed yet H¹=ℝ | Pass |
| R 7.3 examples | z=1, i, 2; moments (0,0),(1,0),(1,1) | 2i, 2i; −2, 0; 4, 32; log 2 both sides; 3.142, 0, 1.571 | Pass |
| S Cousin I | c₁₂=1; one set; empty cover; ℕ copies of Ω | b=(1,0); 3c₁₁=0; vacuous; b=0; c_ji=−c_ij gives Rainer's f_ik=f_ij+f_jk | Pass |
| R consumed factorization | f=z; (z−1)²; e^z | m=1, P=1, g=0; P=(1−z)², g=0; P=1, g=z | Pass |

The table has 41 rows, each with computed values. It covers the seeded sample (0.2, 1.1–1.4, 2.1–2.3, 2.5, 6.2, 6.3, 6.5, 7.1–7.3), all 22 headline theorems with both definitions, and every target a finding touches.

## Not verifiable

- Gray–Morris defer Lemma 1's proof to Saks, *Theory of the Integral* (their [34, 198]), which I did not read; the source issues rest on the counterexample and the text at gray-morris lines 315–345.
- AnalyticNumberTheoryPartI #1126, AutomorphicSpectralTheoryPartII #1761, RelativisticQuantumFieldTheory #1772 and ArithmeticInterpolationDeterminants #1905 were read only through `roadmaps show` and `roadmaps grep`; ComplexKahlerGeometry #1398 from the checkout the brief gives.

## Source issues

- **Error** in gray-morris at Appendix, Lemma 1, pp. 252–253: the source says the 5N·m(R−E) bound holds for every closed rectangle; it should require side ratios in [1/2, 2], since R=[0,3]×[0,1] with two opposite corners and N=1 allows 21 > 15; affects the proof.
- **Gap** in gray-morris at Appendix, proof of Theorem 3, p. 253: the source applies Baire to E as a complete metric space; E is only relatively closed in the open domain D, so Baire must come from local compactness instead; affects the proof.
- **Gap** in gray-morris at Appendix, proof of Theorem 3, p. 253: the sets E_n compare f(z+h) and f(z+ih) for all 0<|h|≤1/n, but near ∂D these points leave D; the clauses should apply only when z+h, z+ih lie in D; affects the proof.
