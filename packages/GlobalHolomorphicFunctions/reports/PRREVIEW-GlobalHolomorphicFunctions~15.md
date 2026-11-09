# Review of GlobalHolomorphicFunctions (pull request #992 at 2c635f6)

**Verdict:** needs changes

The folder is byte-identical to the head the previous review read; this review redid every check independently. Three P3 findings remain: two new ones in the README (R01, R02) and the pull-request description, which is still unrepaired (R03).

## R01 (P3) — 6.1 asks for the −π tan expansion without stating it, and does not cite Tau Ceti's symmetric odd-pole series

**Location.** `TauCetiRoadmap/GlobalHolomorphicFunctions/README.md:1792`–1794: "The half-integer shift gives `-π tan(πz)` with simple poles of residue `1` at `ℤ+1/2`; state its symmetric pairing and local-uniform domain."

**Claim.** This sentence is a 6.1 target, but it gives no series, no pairing and no domain, so it does not fix what is to be proved. The only Check on it (`:1850`–1851) is a residue at one pole.

**Witness.** There are two pairings. Shifting `cot_series_rep` to `z+1/2` pairs the poles `n−1/2` and `−n−1/2`. `TauCeti.hasSum_cotTerm_two_mul` (`TauCeti/Analysis/SpecialFunctions/Trigonometric/TanhSeries.lean:64`), read at `2z`, pairs `±(n+1/2)`. The README cites neither.

**Repair.**

1. Replace the sentence at `:1792`–1794 by: "For `z ∉ ℤ+1/2`, `−π tan(πz) = Σ_{n≥0} (1/(z−(n+1/2)) + 1/(z+(n+1/2)))`, with the poles `±(n+1/2)` paired. The series converges locally uniformly on `ℂ∖(ℤ+1/2)` and has residue `1` at each pole. Off `(1/2)ℤ` the pointwise identity is Tau Ceti's `TauCeti.hasSum_cotTerm_two_mul` at `2z`, since `π cot(2πz) − (π/2) cot(πz) = −(π/2) tan(πz)`. The targets are the integer points, where both sides vanish, and the local uniformity."
2. Add `TauCeti.hasSum_cotTerm_two_mul`, with its file, to the From Tau Ceti contract and to 6.1's *Needs:* line.
3. Add the Check: "At `z=1/4` the paired sum is `−π`, and at `z=1` it is `0`."

**Tested.**

- At `z=0.3+0.2i`, `−π tan(πz) = −1.8790445−3.1898155i`.
- The symmetric sum with 2·10⁵ pairs gives `−1.8790415−3.1898135i`, and the shifted-cotangent pairing gives `−1.8790365−3.1898135i`.
- `π cot(2πz) − (π/2) cot(πz) = −0.9395222−1.5949078i = −(π/2) tan(πz)`.
- At `z=1/4` the symmetric sum is `−3.1415902`; at `z=1` it is `1.0·10⁻⁵`, the truncation error.

## R02 (P3) — The boundary cycle `C_Δ` of 6.4 has one discriminating Check

**Location.**

- `README.md:2027`–2028 defines "`C_Δ := [γ₀] − Σ_{j=1}^m [γⱼ]`".
- `:2104` lists its API: "trace equality, indices inside the region and holes, integer additivity".
- Of the Checks at `:2111`–2115, only one concerns `C_Δ`: "On 1<|z|<2 the index at the hole center is 1−1=0".

**Claim.** A definition with an API needs three discriminating Checks. The other three Checks are unit-disk Cauchy–Pompeiu values with `m=0`. There `C_Δ=[γ₀]`, so every hole convention passes them. Two rules that make `trace(C_Δ)=∂Δ` and fix the indices are untested: the reversal of clockwise curves (`:2025`–2026) and the disjointness of the closed holes (`:2021`–2022).

**Witness.** Two failures that no Check catches, computed with winding sums. In `1<|z|<2`, a clockwise `γ₁` left unreversed gives index `2` at `0`. Holes of radius 1 about `±1/2` in `|z|<3` give index `−1` at `0`, and `1/2∈C₁` lies inside `D₂`, off `∂Δ`.

**Repair.** Add to 6.4's Checks:

- "In 1<|z|<2 take γ₁(t)=e^{−it}, whose sign in ConformalMapping §5.6 is σ=−1. Unreversed, [γ₀]−[γ₁] has index 1−(−1)=2 at 0. After the reversal the index is 0 there and 1 at 3/2."
- "For D₀={|z|<3} with closed holes of radius 1/2 about ±1, the index is 0 at ±1, 1 at 0 and at 2i, and 0 at 4. The trace is the three circles, which is ∂Δ."
- "Closed holes of radius 1 about ±1/2 overlap, which the hypothesis excludes. Without it the index at 0 would be 1−1−1=−1, and 1/2 lies on C₁ inside D₂, so the trace would not be ∂Δ."

**Tested.** Winding sums over 4000 segments per circle:

- First Check: `2.0000` at `0` unreversed and `0.0000` reversed; `1.0000` at `3/2` either way.
- Second Check: `0.0000`, `0.0000`, `1.0000`, `1.0000`, `0.0000` at `1`, `−1`, `0`, `2i`, `4`.
- Third Check: `−1.0000` at `0`.

## R03 (P3) — The pull-request description still declares #886 a dependency and describes files the folder lacks

This is the previous review's R01, first raised in the ninth review. The description is unchanged, and editing the folder cannot repair it.

**Location.** The description of #992 contains:

- "- [ ] depends on: #886";
- "`ProductCotangentTargets.lean` supplies eight actual formula definitions";
- "twenty-eight intentional proof-target admissions";
- the depends-on entry "#886 DifferentialGeometry";
- the merge-order line "#886 (DifferentialGeometry) → **this pull request** (#992)".

**Claim.** DifferentialGeometry #886 must merge first, and the folder holds a companion Lean file with 28 admissions.

**Witness.** `README.md:26`–27 says "DifferentialGeometry is not a supplier". DifferentialGeometry is on main, so #886 revises it and is never a dependency. The folder holds only `README.md`, `Suggested.lean` and `metadata.toml`, and the build gives 22 `sorry` warnings.

**Repair.**

1. Delete the "depends on: #886" line, the #886 depends-on entry and the #886 merge-order line.
2. Delete these passages, which describe content the folder no longer has:
   - the `ProductCotangentTargets.lean` passage;
   - the GH4 paired-cotangent proof;
   - the 28/18-admission counts;
   - the ZerosOfLFunctions #253 coordination paragraph (ZerosOfLFunctions is on main).
3. Name the suppliers as the README does: ZerosOfLFunctions, AnalyticNumberTheoryPartI and ConformalMapping, all on main.

**Tested.** The dependency check on this README (under Verified sound) reports `0 problem(s)` and names no open supplier. The depends-on block is therefore empty after the repair.

## Previous findings

- **R01 of the previous review (P3, pull-request description): not repaired.** The description in this job still contains "- [ ] depends on: #886" and "twenty-eight intentional proof-target admissions". It is carried as R03.
- The previous review had no other open finding. The folder has 0 changed lines since then (`changes.md`), so its repairs of the two findings before it (the Laurent decomposition in Layer 0.4, and the record of the Hyperfunctions HF2 overlap at `:62`–68) still stand. I re-read both passages this round.

## Verified sound

### Gate, build and Lean form

- **Gate.** I ran the push gate on 2c635f63. Every counter is 0, it ends `OK` and exits 0. The worker's run, which includes the targeted build, also reports `build=0 OK`.
- **Changes outside the folder.** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/GlobalHolomorphicFunctions'` is empty.
- **Build.** `lake env lean` on `TauCetiRoadmap/GlobalHolomorphicFunctions/Suggested.lean` exits 0 in 8.6 s. It gives exactly 22 "declaration uses `sorry`" warnings, at lines 51, 72, 91, 109, 129, 141, 154, 172, 182, 191, 199, 213, 225, 238, 250, 267, 276, 287, 304, 312, 320 and 327, and nothing else. The pins are Lean v4.36.0-rc2, Mathlib `1b1ccf4b` and Tau Ceti `2fd255d9`.
- **Signatures.** I elaborated a scratch copy with one `#check @…` line for each of the 24 declarations. Every elaborated type matches its README statement. The file has no `variable` block, so no binder can be lost.
  - Smoothness elaborates as `ContDiffOn ℝ (↑⊤)`, which is `∞`, not analytic `ω`.
  - `cauchyPompeiu` carries `IsOpen Ω`, `IsOpen Δ`, boundedness, `closure Δ ⊆ Ω`, the trace and index hypotheses and `ContDiffOn ℝ 1 f Ω`.
  - The form-level statements are on `TopologicalSpace.Opens ℂ` with the model `𝓘(ℝ, ℂ)`.
- **One-tactic probe.** On a scratch copy I replaced every `sorry` by `first | (rfl; done) | (infer_instance; done) | (simp; done) | (norm_num; done) | (trivial; done) | (positivity; done) | (aesop; done) | (fun_prop; done) | exact?`. All 22 theorems fail at `exact?`, with 22 errors, one per theorem. None is padding by this test.
- **Two short proofs, not raised.** A scratch file at the pins elaborates with no error and shows that two declarations need only a few lines:
  - `norm_prod_one_add_sub_one_le_prod_one_add_norm_sub_one` has a complete ten-line proof: insertion induction with `norm_mul_le`, `norm_add₃_le` and `nlinarith`. It is the one Layer 1 statement that the reviews of rounds 4 and 11 asked the author to keep.
  - `exists_smooth_closed_completion` follows from `exists_smooth_conjWirtingerDeriv_eq` in five lines. Apply the solver to the datum `(f_x − i f_y)/2`, smooth by `ContDiffOn.fderiv_of_isOpen`. It is no shorter a corollary than `subsingleton_deRhamCohomology_two` is of the real exactness theorem.
- **Imports and form.** The imports are `import Mathlib` plus five `TauCeti.*` modules, all present at the pin. There is no `set_option`, no `lemma` and no sorry'd data. `IsRungeCompactPair` and `holomorphicHull` have real bodies on native carriers.
- **Headlines.** Every headline in the README is stated in `Suggested.lean`, so the docstring's "Every headline theorem of the roadmap is statable at the pins" holds:
  - Looman–Menchoff (0.2);
  - the sharp finite-product bound (1.4);
  - the weighted and the native-divisor genus-one products (1.2);
  - the Runge equivalence, the hull equality and the finite-rank operator (2.5);
  - zero-free approximation and zero and signed divisor realization (3.1);
  - boundary noncontinuation (3.2);
  - Mittag–Leffler, isolated singularities and the quotient (4.1);
  - Cauchy–Pompeiu on a cycle (6.4);
  - the ∂̄ solver and closed completion, scalar and form-level (7.1, 7.2);
  - complex and real two-form exactness and `H²_dR = 0` (7.2);
  - Cousin I (7.4).

### Dependency check

The brief's command gives:

```text
depcheck: 235 roadmaps, 2262 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line. In the merge order ZerosOfLFunctions is at line 48, AnalyticNumberTheoryPartI at line 50 and this roadmap at line 97. ConformalMapping is under `Completed/` on main.

### Sources: the seeded sample (15 targets)

Rainer's printed page is the PDF page minus 6: rainer line 1258 prints "23" at the foot of PDF page 29, and line 1260 heads PDF page 30 with "24". I read every line below this round.

| Target | Locator in README | Text at the locator | Verdict |
|---|---|---|---|
| 1.3 | Remark 15.4, p. 38 (rainer 2030) | elementary factors `E_p`, only zero at 1; a product `z^{m₀}∏E_{p_n}(z/a_n)^{m_n}` for suitable variable `p_n` | supports variable genera; the genus, the choice `p_n=n−1` and the uniform log-derivative estimate are derived, as the README says |
| 1.4 | proof of Prop. 14.2, p. 35 (1843–1853) | `∏(1+a_n)−1` is a sum of monomials, and `∏(1+|a_n|)−1` is the same sum in `|a_j|` | correct for complex numbers; the ring generality is the README's own induction |
| 1.5 | Thm 14.3 and proof, pp. 35–36 (1868–1902) | `Σ|f_n|` uniformly convergent on compacta ⇒ locally uniform products, zero iff a factor is `−1`, orders add; bound `e^C(e^ε−1)` | correct: uniform convergence of `Σ|f_n|` is the uniform-tail hypothesis |
| 2.2 | §11, (11.2), Exercises 19–20, p. 25 (1313–1332) | `d = Σ2^{−n}|f−g|_{K_n}/(1+|f−g|_{K_n})`; metric, completeness and continuity of `f ↦ f′` as exercises | correct |
| 2.3 | §11, p. 25 (1333) | `O(K)` as a subspace of `C(K)`, "in general it is not closed" | correct |
| 2.5 | Thm 11.1, p. 25 (1338); Lemma 11.3, pp. 27–28 (1437); Thm 11.7, p. 29 (1550) | (1)⇔(2)⇔(3); hull items (1)–(5); rational approximation with poles at chosen points of the compact complementary components | correct |
| 3.1 | Lemma 15.1, p. 36 (1934); Prop. 15.2, pp. 36–37 (1950–1993); Thm 15.3, pp. 37–38 (1997) | `e^f=(z−a)/(z−b)` for `a, b` in one component; zero-free approximant `cH e^L`; Weierstrass on discrete sets | correct; source gap and misprint below |
| 3.2 | Thm 15.5, p. 39 (2086) | for a region, locally finite disks with radii → 0, one zero in each, natural boundary | correct; the README extends it to open sets and meromorphic germs, as it says |
| 6.1 | dlmf-4-22 lines 79–80, 104–109; dlmf-5-8 line 79 | (4.22.2) cosine product; (4.22.3) cotangent partial fractions for `z ≠ nπ`; (5.8.2) `1/Γ` product | correct after `z ↦ πz` |
| 6.2 | Thm 14.3 (1868) | the product theorem | correct as the product input; the theta shift, sinh and `e^z−1` identities are derived and recomputed below |
| 6.4 | Prop. 10.1, p. 23 (1216–1251); (1253) | `f = (2πi)⁻¹∮f/(ζ−z) + (2πi)⁻¹∬∂̄f/(ζ−z) dζ∧dζ̄` for a bounded domain with finitely many simple closed `C¹` boundary paths; `dξdη = −(2i)⁻¹dζ∧dζ̄` | correct: this is the README's `−π⁻¹∫ dA` form |
| 7.1 | Thm 12.2, p. 31 (1630) | `f ∈ C^∞(U)` ⇒ `u ∈ C^∞(U)` with `∂̄u=f`, by Runge corrections on `K_j = K̂_j` | correct |
| 7.2 | no external locator; derived from 7.1 | — | the derivation is written out in 7.2 and recomputed below |
| 7.3 | (10.1), p. 23 (1211); proof of Prop. 10.1 (1237) | `∮g dζ = ∬g_ζ̄ dζ̄∧dζ`; `∬|ζ−z|⁻¹ ≤ ∫∫ dr dφ` | correct |
| 7.4 | Prop. 12.3 and Thm 12.4, p. 32 (1658, 1689) | `f_i = Σ_{j≠i} φ_j f_ij`; cocycle `f_ik = f_ij + f_jk`; then solve `∂̄u = φ` | correct |

On the 7.4 cocycle: `f_ik = f_ij + f_jk` is equivalent to the Lean hypothesis `c_ij + c_jk + c_ki = 0`. The Lean hypothesis forces `c_ii = 0` at `i=j=k` and `c_ji = −c_ij` at `k=i`.

I also read:

- rainer line 81: "domain" means a nonempty open set and "region" a connected domain, as the Conventions paragraph (`:109`–110) says;
- gray-morris lines 66–70 (Theorem 3) and 315–325 (Appendix, Lemma 1), for 0.2.

### Library declarations opened at the pins

I resolved all 206 backticked names of the README against the pinned Mathlib and Tau Ceti. Each is declared at the pins except three roadmap declarations, which resolve in their roadmaps:

- `exists_entire_primary_product_exact` and `exists_entire_exp_mul_of_divisor_eq`: AnalyticNumberTheoryPartI `Suggested.lean:351`, `:363`;
- `jordan_index_of_isPiecewiseC1On`: ConformalMapping `Suggested.lean:640`.

I opened these and compared each with the README's wording:

| Declaration | File:line at the pin | Checked against the README |
|---|---|---|
| `Finset.norm_prod_one_add_sub_one_le` | `Mathlib/Analysis/SpecialFunctions/Log/Summable.lean:137` | `[NormedCommRing R] [NormOneClass R]` (`:129`); exponential bound only, as 1.4 says |
| `Real.prod_one_add_le_exp_sum` | `Mathlib/Analysis/Complex/Exponential.lean:679` | nonnegative family |
| `Complex.logDeriv_tendsto`, `TendstoLocallyUniformlyOn.deriv` | `Mathlib/Analysis/Complex/LocallyUniformLimit.lean:201`, `:154` | conclusion at the single point `x`, with `g x ≠ 0`, as 1.3 says |
| `logDeriv_tprod_eq_tsum` | `Mathlib/Analysis/Calculus/LogDerivUniformlyOn.lean:24` | summable log-derivatives, nonzero factors and product |
| `cot_series_rep`, `cotTerm_identity`, `summable_cotTerm` | `Mathlib/Analysis/SpecialFunctions/Trigonometric/Cotangent.lean:233`, `:207`, `:215` | `π cot(πx) = 1/x + Σ' n:ℕ+, …` on `ℂ_ℤ`; `2x/((x+(n+1))(x−(n+1)))` |
| `summableLocallyUniformlyOn_iteratedDerivWithin_cotTerm` | same file, `:322` | `1 ≤ k`, on `ℍₒ`, as 6.1 says |
| `HasProdLocallyUniformlyOn_euler_sin_prod`, `multipliableUniformlyOn_euler_sin_prod_on_compact` | same file, `:136`, `:122` | on `{0}ᶜ` with limit `sin(πx)/(πx)`, as `:158` notes |
| `MeromorphicOn.AnalyticOnNhd.divisor_apply`, `AnalyticAt.analyticOrderAt_eq_natCast`, `meromorphicOrderAt_eq_int_iff` | `Mathlib/Analysis/Meromorphic/Divisor.lean:79`; `Mathlib/Analysis/Analytic/Order.lean:92`; `Mathlib/Analysis/Meromorphic/Order.lean:97` | names and namespaces as cited |
| `CompactExhaustion.hasAntitoneBasis_compactConvergenceUniformity`, `ContinuousMap.tendsto_iff_tendstoLocallyUniformly`, `CompleteSpace C(α, β)` | `Mathlib/Topology/UniformSpace/CompactConvergence.lean:224`, `:256`, `:435` | as 2.2 uses them |
| `TauCeti.IsFilledIn` | `TauCeti/Topology/FilledIn.lean:61` | no `x ∈ Ω∖K` whose component closure is compact and inside `Ω`, the wording of 2.5 |
| `IsOpen.isFilledIn_closedBall_sdiff_thickening`, `IsOpen.exists_isFilledIn_compact_exhaustion` | `TauCeti/Analysis/Normed/Module/Exhaustion.lean:57`, `:86` | `0 ≤ r`, `0 < δ`; existential, with the stages internal to the proof (`:89`), as 2.1 says |
| `TauCeti.Contour.Cycle.green_winding` | `TauCeti/Analysis/Green/Cycle.lean:36` | open `U`, `IsIn`, `C¹` fields on `U`, null-homologous; no speed hypothesis |
| `Cycle.integral_add`, `integral_smul`, `norm_integral_le_of_norm_le_const`, `trace`, `IsIn`, `IsNullHomologous`, `PiecewiseC1ClosedCurve.of` | `TauCeti/Analysis/Contour/Cycle/Basic.lean:377`, `:388`, `:400`, `:198`, `:261`, `:447`, `:91` | as 2.4, 3.1 and 6.4 use them |
| `Cycle.exists_int_windingNumber_of_not_mem_trace`, `Cycle.homologyCauchyTheorem` | `TauCeti/Analysis/Contour/Cycle/Winding.lean:137`; `TauCeti/Analysis/Contour/Cycle/HomologyCauchy.lean:261` | as 3.1's second route uses them |
| `SmoothForm`, `SmoothForm.complexDz`, `complexDzBar`, `complexDz_apply`, `mpullback_complexDz` | `TauCeti/Geometry/Manifold/DifferentialForm/Smooth.lean:479`; `…/Plane/Complex.lean:41`, `:46`, `:51`, `:103` | `mpullback_complexDz` holds for every `f`, `z`, with no regularity hypothesis |
| `closedForms`, `exactForms`, `mem_closedForms_of_finrank_le`, `deRhamCohomology`, `mk_surjective`, `mk_eq_zero_iff` | `TauCeti/Geometry/Manifold/DeRham/Basic.lean:77`, `:95`, `:121`, `:127`, `:159`, `:170` | `finrank ≤ k`; `subsingleton_deRhamCohomology_of_finrank_lt` (`:204`) needs `finrank < k`, so degree 2 on a surface is a genuine target |
| `holomorphicFunctions`, `extend`, `restrict`, `continuous_restrict`, `jet`, `holomorphicGerms`, `eval`, `restrict`, `toGerm` | `HolomorphicFunctions/Basic.lean:39`, `:91`, `:125`, `:155`; `Jet.lean:39`; `Germ/Algebra.lean:37`, `:112`, `:132`; `HolomorphicFunctions/Germ.lean:45` | as 2.2 and 2.3 say |
| `norm_circleLaurentCoeff_le`, `circleLaurentCoeff_sub_zpow_smul` | `TauCeti/Analysis/Complex/Laurent/Basic.lean:100`, `:145` | bound `M R^(−n)`; value `if n = m then a else 0` |

I also searched the pins for the objects this roadmap owns. None is duplicated:

- **Looman–Menchoff and `holomorphicHull`:** no hit in either library.
- **Cousin I:** Tau Ceti's only hit, `TauCeti/Analysis/Hyperfunction/OneDimensional.lean:57`–60, says the one-dimensional Cousin problem "is not proved here".
- **Poincaré lemma:** Tau Ceti proves it on star-convex sets only (`TauCeti/Analysis/Calculus/DifferentialForm/Poincare.lean`), so it does not cover an arbitrary open subset of ℂ.
- **Mittag–Leffler:** the only hits are tower Mittag–Leffler conditions and `TanhSeries.lean`.

The one relevant object at the pins that the README does not cite is R01's.

### Cross-roadmap citations resolved (main at 3090489)

- **ZerosOfLFunctions:**
  - 5.1 at `README.md:929`;
  - 5.2 at `:938`–945: `E₁ 0 = 1`, the zero at 1, `deriv E₁ z = −z exp z`, the log-derivative and the small-disk bound;
  - 5.3 at `:957`; 5.4 at `:979`.
- **AnalyticNumberTheoryPartI:**
  - §0.15 at `README.md:530`–551: `elementaryFactor`, the sharp estimate, the compact-summability product, reindexing and fibre grouping, and `exists_entire_primary_product_exact`;
  - §0.15a at `:554`: `exists_entire_exp_mul_of_divisor_eq`, with both functions not identically zero.
- **ConformalMapping (Completed):**
  - §5.3 at `README.md:787` and §5.6 at `:906`;
  - `jordan_index_of_isPiecewiseC1On` at `Suggested.lean:640`: index `σ ∈ {1, −1}` on `filledHull C \ C` and `0` off `filledHull C`, as 6.4 uses it.
- **ComplexKahlerGeometry:** K5a at `README.md:35`–36 consumes the complex two-form exactness; K3 at `:345`–348 and `:1620`–1636 consumes the local Laurent phase (Layer 0.4); K2 at `:198`–200 and `:1637` consumes the scalar inputs.
- **Hyperfunctions:**
  - HF2 at `README.md:190`–234 (MalgrangeTopVanishing for `n ≥ 1`; filled-compact exhaustion and harmonic Runge on `ℝ^{2n}`), and the GH0 citation at `:29`;
  - the Scope paragraph (`:62`–68) records the `n = 1` overlap and the cycle that forbids taking it from HF2.

### Ownership against open pull requests

I ran `roadmaps grep -i --readme-only` over the 458 open pull requests and main. The patterns were `Looman`, `Runge`, `Cousin`, `Mittag.Leffler`, `holomorphic hull`, `Pompeiu`, `Weierstrass (product|factori)` and `inhomogeneous Cauchy.Riemann`.

- **Only in this roadmap:** `Looman` and `inhomogeneous Cauchy–Riemann`.
- **Runge elsewhere:**
  - rigid-analytic Runge immersions (AdicSpacesPartIV);
  - several-variable Runge (RealAnalyticGeometry);
  - consumers of GH0 (ComplexKahlerGeometry; ComplexComparisonPartII through K2).
- **Filled exhaustion:** Hyperfunctions HF2 owns an existential filled exhaustion on `ℝ^{2n}`, which Tau Ceti now proves. Layer 2.1 owns only the explicit stages.
- **Pompeiu elsewhere:** PseudoholomorphicCurveAnalysis PH3.1 owns `Lᵖ` and Hölder bounds of the transform, not the bounded-region formula; ComplexKahlerGeometry consumes it.
- **Weierstrass products elsewhere:** the Barnes G-function, p-adic and Tate-algebra Weierstrass theory, and the exclusions in the ZerosOfLFunctions revisions.

`overlaps.md` agrees: no open pull request changes this roadmap, none drops a cited id, and no cited id exists only in an open revision.

### Adversarial pass

`S` is `Suggested.lean` and `R` is `README.md`. I computed every value this round with my own pure-Python scripts:

- circle coefficients by 4000-point trapezoid sums;
- products truncated at 2·10⁵ factors, or `|n| ≤ 2·10⁴` for bilateral products;
- area integrals by midpoint quadrature in polar coordinates centred at the singularity;
- derivatives by central differences with `h = 10⁻⁵`.

| Statement | Instances | Values computed on each side | Result | Change |
|---|---|---|---|---|
| S Looman–Menchoff (0.2) | `z²` at `1+i`; `z̄`; `exp(−z⁻⁴)`, `f(0)=0`; `Ω=∅` | `f_y = −2+2i = i f_x`; `f_y = −i ≠ i = i f_x` (excluded); at 0 both partials 0, but `|f| = 11.489, 64.388, 2244.077` at `r = 0.8, 0.7, 0.6` on `arg = π/4`, so excluded by `hcont`; vacuous | Pass | none |
| R 0.2 balanced estimate | `[0,20]×[0,1]`, `E` = two corners, `N = 1`, `φ = y(20−x)c(x)` | left side `193.417` against `5N·m(R∖E) = 100`: the aspect-ratio hypothesis `1/2 ≤ w/h ≤ 2` is needed | Pass | none (source issue) |
| R 0.4 coefficients, radius dependence | `1/(z(z−2))` at `ρ = 1`; `ρ = 3` | `a_{−3..2} = 0, 0, −0.5, −0.25, −0.125, −0.0625`; `a_{−4..1} = 4, 2, 1, 0, 0, 0` | Pass | none |
| R 0.4 derivative law | `f′` for the same `f`, `ρ = 1` | coefficients in degrees −2, −1, 0: `0.5, 0, −0.125`; `(n+1)a_{n+1}`: `0.5, 0, −0.125` | Pass | none |
| R 1.1 factor derivatives | `E₂′(−1)`; `log‖E₁(1/2)‖` | `−0.6065307 = −e^{−1/2}`; `−0.193147 ≤ 0.25` | Pass | none |
| S `exists_entire_genusOne_product` (1.2) | `S = {n²}`, `m = 1`, `z = 2+i`; `S = {1}`, `m = 2`; `S = ∅` | product `−0.4312778−9.3328073i` = `e^{π²z/6} sin(π√z)/(π√z)` `−0.4312778−9.3328073i`, with `Σ1/n⁴ = 1.082323`; `(1−z)²e^{2z} = 0.679570` at `1/2`, order 2 at 1; `F = 1` | Pass | none |
| S `…_of_divisor` (1.2) | `D = 2[1]`; `D = [1]−[2]`; `D 0 ≠ 0` | divisor 2 at 1; excluded by `hD`; excluded by `hDzero` | Pass | none |
| R 1.3 log-derivative estimate | `∏_{n≤N}(1−z²/n²)` on `|z−0.5i| = 0.3`, `N = 10, 50, 200` | `sup|P′/P−F′/F| = 0.152, 0.0317, 0.00798` ≤ bound `2.387, 0.513, 0.130`, both → 0 | Pass | none |
| R 1.3 genus, `p_n = n−1` | `a_n = n`, `R = 3` | `Σ1/n` diverges, `Σ1/n² = 1.6449`: genus 1; `Σ_{n≥7}(3/n)^n = 0.0031` | Pass | none |
| S sharp bound (1.4) | 5000 random families of size 0–7, with some `u₀ = −1`; `ℤ₃`, `u = (3,3)`; norm `2|z|`, `u = (1,1)`; empty | `max(lhs−rhs) = 4.4·10⁻¹⁶`; `1/3 ≤ 7/9`; `6 ≤ 8` (the exponential form needs `‖1‖ = 1`); `0 ≤ 0`; full proof elaborates | Pass | none |
| R 1.5 uniform tail | `X = ℕ`, `u_n = [x=n]/(n+1)` | tail at `N = 9` is `0.1`; `Σ_{n<10⁵} sup|u_n| = 12.09`, divergent | Pass | none |
| R 2.2 metric | constants `1/(n+1)`, `n = 0, 1, 5` | `d = 0.5, 0.333333, 0.142857 = 1/(n+2)` | Pass | none |
| R 2.3 `O(K)` not closed | `Σzⁿ/(n+1)²` along the radius, `r = 0.9, 0.99, 0.999` | `Σ n r^{n−1}/(n+1)² = 1.238, 3.078, 5.281` → ∞; for `K = {0}`, `z` and `0` have the same value | Pass | none |
| S `IsRungeCompactPair`, `holomorphicHull`, `holomorphicHull_eq_fill` | `(∅,∅)`; `{2≤|z|≤3}` in `D₄`; same in `{1<|z|<4}`; unit circle in `ℂ∖{0}` | hull `∅` (`B = −1`, `f = 0`); hull = closed 3-disc on both sides; hull = `K` on both sides (`|1/1.5| = 0.667 > 0.5`); hull = `K`, both component closures contain `0 ∉ Ω` | Pass | none |
| S Runge equivalence (2.5) | annulus in `D₄`, `f = 1/z` | `∮_{|z|=2.5} dz/z = 2πi` against `0` for every `g ∈ H(D₄)`: both sides false | Pass | none |
| S finite-rank operator (2.5) | `Ω = ℂ`, `K` = closed unit disk, `U = B(0,2.5)`, `L = B̄(0,1.5)`, 60 nodes, `g_j` = 60-term geometric polynomials | `sup_K|f−Af|/sup_L|f| = 1.7·10⁻¹⁶` (`1/(z−3)`), `1.1·10⁻¹⁶` (`e^z`), `4.7·10⁻¹⁶` (`z¹⁰`), `3.1·10⁻¹⁵` (`1/(z+2.6i)`), one operator for all four; `K = ∅`: `L = ∅`, `N = 0` | Pass | none |
| S zero-free approximation (3.1) | `K = {1≤|z|≤2}`, `Ω = ℂ∖{0}`, `u = z−1/2` | `G_N(1) = 0.6065307, 0.5134171, 0.5000412` for `N = 1, 3, 10` → `0.5`; `G_N = z·exp(L_N)` has no zero on `Ω` | Pass | none |
| S zero orders; signed divisor (3.1) | `m = 0`; `2[2]`; `ν = 2[0]−[1]` | `f = 1`; `(z−2)²`; `z²/(z−1)` with orders 2 and −1 | Pass | none |
| S boundary germ (3.2) | `Ω = ℂ∖{0}`, `f = sin(1/z)`; `Ω = ∅`, `ℂ` | zeros `1/(kπ)` give order `⊤` at 0, so any extension vanishes codiscretely, while `f(2/π) = 1`; frontier empty | Pass | none |
| S Mittag–Leffler; isolated singularities; quotient (4.1) | `E = ℤ`, `P_n = 1/(z−n)`; `E = {0}`, `U₀ = B(0,1/2)`, `φ₀ = 1/z + 1/(z−1/2)`; `F = cot` | `π cot πz` with residue 1; `f = 1/z`, remainder `−1/(z−1/2)` analytic at 0; `(cos, sin)`, `sin ≠ 0` off `πℤ` | Pass | none |
| R 6.1 classical products | `cos(πz)` at `0.2−0.3i`; `1/Γ(1/2)`; `π cot(πi)` | `1.1957245+0.6397076i` against product `1.1957246+0.6397068i`; `0.5641896` against `0.5641898`; `−3.153348i = −i(1+2S₁)` | Pass | none |
| R 6.1 shifted sine | `α = 0.3`, `z = 0.7+0.2i` | `sin(π(z+α)) = −0.6704840i` against `sin(πα)e^{πz cot πα}∏ = 0.0000094−0.6704991i` (truncation `O(1/N)`) | Pass | none |
| R 6.1 −π tan (R01) | `z = 0.3+0.2i`, `1/4`, `1` | `−1.8790445−3.1898155i`; symmetric `−1.8790415−3.1898135i`, shifted `−1.8790365−3.1898135i`; `−π` against `−3.1415902`; `0` against `1.0·10⁻⁵` | Pass | R01 |
| R 6.2 theta | `r = 0.4`, `z = 0.2+0.7i`; `z = iπ−log r` | `H(z+2log r)/H(z) = 1.5654995−1.3186021i = r⁻¹e^{−z}`; `|H| = 8·10⁻¹⁷`; `H(z) = H(−z)` | Pass | none |
| R 6.2 `e^z−1`; Manhattan shells | `z = 0.9+2.1i`; `N = 1, 2, 3, 10` | `−2.2417210+2.1231524i` against `−2.2417211+2.1231535i`; `4, 8, 12, 40` points, `min|λ| ≥ N/√2`, `Σ|λ|⁻³ = 4, 1.914, 0.864, 0.0798` ≤ `11.31, 2.83, 1.26, 0.113` | Pass | none |
| R 6.3 crescent; normalization | `z = −1/2`; `n = 1` | `|z| = 0.5 < 1`, `|2z−1| = 2 > 1`; bound `(1/2)/(1−1/2) = 1` | Pass | none |
| S `cauchyPompeiu` (6.4) | `Δ = D(0,1)∖B̄(0.4,0.3)`, `C = [|z|=1]−[|z−0.4|=0.3]`, `f = z̄z² + Re z`, `∂̄f = z²+1/2`, `ξ = −0.5` | boundary `−0.816`, area/π `−0.1910008`; formula `−0.6249992` against `f(ξ) = −0.625`; with the area sign reversed, `−1.0070` | Pass | none |
| R 6.4 `C_Δ` (R02) | unreversed clockwise hole; two holes at `±1`; overlapping holes | `2` at 0, `0` reversed; `0, 0, 1, 1, 0`; `−1` | Pass | R02 |
| S ∂̄ solver (7.1) | `f = z z̄²`, `u = z z̄³/3` at `0.3+0.8i` | `u_x+iu_y = 0.438−1.168i = 2f` | Pass | none |
| S closed completion, scalar and form (7.1, 7.2) | `f = z̄z²`, `g = z z̄²` at `0.3+0.8i`; `f = z`, `g = z̄` | `g_x+ig_y = 2.92 = f_x−if_y`; `∂f − ∂̄g = 1−1 = 0`, while `g = 0` leaves `dz∧dz̄`, of value `−2i` on `(1,i)` | Pass | none |
| S complex exactness (7.2) | `η = z̄ dz∧dz̄`, `u = z̄²/2`, `β = −u dz` at `0.3+0.8i` | `dβ(1,i) = −1.6−0.6i = η(1,i)`; `+u dz` gives `1.6+0.6i` | Pass | none |
| S real exactness; `H²` (7.2) | `h = 1+x²`, `u = z̄/2 + (z²z̄+zz̄²+z̄³/3)/8`; circle | `∂̄u = 0.545 = h/2`, `(Re u)_x−(Im u)_y = 1.09 = h`, swapped `−0.12`; on `S¹` every one-form is closed but `H¹ = ℝ` | Pass | none |
| R 7.3 forms and moments | `d(iz²)(1)` at `1, i`; `d(i|z|²)(1)` at `i`; `d|z|⁴(1)`, `d(log|z|)²(1)` at 2; moments `(0,0)`, `(1,0)`, `(1,1)`, `(2,2)`, `(2,1)`, `(3,3)` | `2i, −2`; `0`; `32`, `0.693147 = log 2`; `3.1415927, 0, 1.5707914, 1.0471894, 0, 0.7853867` against `π, 0, π/2, π/3, 0, π/4` | Pass | none |
| S Cousin I (7.4) | `Ω = ℂ∖{0}`, `U₁ = ℂ∖[0,∞)`, `U₂ = ℂ∖(−∞,0]`, `c₁₂ = 1` on `Im > 0`, `0` on `Im < 0`; one set | `b₁−b₂ = 1` at `i` and `2+0.5i`, `0` at `−i` and `−3−0.1i`; `3c₁₁ = 0` | Pass | none |

The table has 34 rows. It covers the 15 sampled targets, all 22 theorems and both definitions of `Suggested.lean`, and the targets R01 and R02 touch.

## Not verifiable

- None. I read all four sources recorded in `sources.toml` (rainer, gray-morris, dlmf-4-22, dlmf-5-8) at every sampled locator, from the sources cache.

## Source issues

- **Error** in gray-morris at Appendix, Lemma 1, p. 253: the source says the `5N·m(R−E)` bound holds for every closed rectangle R; it should be restricted to rectangles of bounded side ratio, since `[0,20]×[0,1]` with E the two corners gives about 193 against 100; affects the proof.
- **Gap** in rainer at proof of Proposition 15.2, p. 37: the source applies Lemma 15.1, stated for a domain whose complement holds a and b in one component, to get a logarithm near the compact K; it should apply it on ℂ∖P for a path P from b_i to a_j inside V_j; affects the proof.
- **Misprint** in rainer at proof of Proposition 15.2, p. 37: the source concludes an error below 2ε while the proposition asserts ε; it should run the argument with ε/2; affects nothing.
- **Misprint** in rainer at proof of Theorem 14.3, p. 36: the source says the uniformly Cauchy partial products make f_N uniformly convergent; it should say p_N; affects nothing.
