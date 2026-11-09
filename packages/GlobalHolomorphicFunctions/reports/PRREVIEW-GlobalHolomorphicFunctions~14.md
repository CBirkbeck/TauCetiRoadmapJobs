# Review of GlobalHolomorphicFunctions (pull request #992 at 2c635f6)

**Verdict:** needs changes

This head repairs both folder findings of the previous review (R01, the Laurent decomposition built two layers after its first use; R02, the Hyperfunctions HF2 record), exactly as specified, and the new Layer 0.4 is sound against the pinned Tau Ceti and Mathlib and against Rainer §7. The folder itself has no finding. The one remaining finding is the pull-request description, which the previous five reviews raised and which is unchanged; it is carried as R01 because it cannot be repaired by editing the folder. The gate passes, `Suggested.lean` is byte-identical to the head of the previous review and elaborates with exactly 22 `sorry` warnings, and the adversarial table below was recomputed this round.

## R01 (P3) — The pull-request description still declares #886 a dependency and describes files the folder lacks

This is the previous review's R03 (first raised in the ninth review), not repaired. The folder cannot repair it: the description's author, and whoever regenerates its depends-on and merge-order blocks, must.

**Location.** The description of #992 still contains:

- "- [ ] depends on: #886";
- "DifferentialGeometry #886 supplies generic forms and finite-cycle Green";
- "`ProductCotangentTargets.lean` supplies eight actual formula definitions and eighteen illustrative theorem targets";
- "twenty-eight intentional proof-target admissions" and "The unchanged companion retains eighteen intentional admissions";
- the depends-on entry "- [ ] #886 DifferentialGeometry";
- the merge-order line "#886 (DifferentialGeometry) → **this pull request** (#992)".

**Claim.** DifferentialGeometry #886 must merge first, and the folder holds a companion Lean file with 28 admissions.

**Witness.**

- `TauCetiRoadmap/GlobalHolomorphicFunctions/README.md:25`–26: "none of these is a target here, and DifferentialGeometry is not a supplier."
- DifferentialGeometry is on main, so #886 is a revision of an existing roadmap and is never a dependency.
- The folder holds `README.md`, `Suggested.lean` and `metadata.toml` only; the build gives 22 `sorry` warnings, not 28.
- The dependency check on this README lists no open supplier (output under Verified sound), so the depends-on block is empty after the repair.

**Repair.**

1. Delete the "depends on: #886" line, the #886 depends-on entry and the #886 merge-order line.
2. Delete the DifferentialGeometry, `ProductCotangentTargets.lean`, GH4 paired-cotangent and 28/18-admission passages.
3. Name the suppliers as the README does: ZerosOfLFunctions, AnalyticNumberTheoryPartI and ConformalMapping, all on main.

**Tested.** `git diff --stat origin/main...HEAD` outside the folder is empty, and the depends-on closure the README's citations generate is empty: `depcheck: 235 roadmaps, 2261 edges, 0 problem(s)` with no open roadmap named.

## Previous findings

- **R01 of the previous review (P2, Laurent decomposition): repaired.** The README now has `### 0.4 Local Laurent decomposition on annuli` (`README.md:735`–831), which consumes the eight circle-Laurent declarations of `TauCeti/Analysis/Complex/Laurent/Basic.lean` and proves only the series steps: positive part on the outer disc, negative part off the inner disc with the inner-kernel expansion as a target, splitting via the two-circle formula, uniqueness of coefficients and of the splitting, restriction, linearity and differentiation laws, and the classification of isolated singularities with the identification of the negative part with `TauCeti.meromorphicGerms.principalPart` in the meromorphic case. 2.5 now reads "Layer 0.4 on the punctured plane writes `f=f₊+f₋` … the partial sums of `f₋` converging uniformly on `K`" (`:1353`–1357) and its *Needs:* line names "Layer 0.4's splitting and uniform truncation of the negative part" (`:1414`); Layer 2's Dependencies name it (`:1428`); 4.1 says "The local Laurent decomposition … is Layer 0.4; this subsection owns the global patching" (`:1724`–1726) and its *Needs:* line replaces "native Laurent decomposition" by "Layer 0.4's Laurent decomposition" (`:1762`); the Scope records Tau Ceti's and Layer 0.4's shares (`:74`–81); Downstream consumers add ComplexKahlerGeometry K3 (`:2447`–2450). "No other layer is an input" (`:831`) keeps Layer 0 native-only, as ComplexKahlerGeometry `README.md:1620`–1636 on main requires.
- **R02 of the previous review (P3, Hyperfunctions HF2): repaired.** `README.md:62`–68 records that HF2's MalgrangeTopVanishing covers n = 1, that the one-variable case is owned here, and the cycle 7.1 → HF2 → K5a → 7.2 → 7.1 that forbids taking it from HF2; `:2451`–2453 replaces the old "uses the one-variable input through those analytic layers" by the Layer 0.3 consumption and the n = 1 identification.
- **R03 of the previous review (P3, pull-request description): not repaired.** Carried as R01.

## Verified sound

**Gate, build and Lean form.**

- **Gate.** I ran the push gate on 2c635f63 myself: every counter is 0 and it ends `OK` (`set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 … depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`). The worker's run, which includes the targeted build, also reports `build=0 OK`.
- **Changes outside the folder.** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/GlobalHolomorphicFunctions'` is empty. The change since the previous review is 232 lines of `README.md` only; `Suggested.lean` is byte-identical.
- **Build.** `lake env lean` on `TauCetiRoadmap/GlobalHolomorphicFunctions/Suggested.lean` exits 0 with exactly 22 "declaration uses `sorry`" warnings and nothing else. Pins: Tau Ceti `2fd255d9`, Mathlib `1b1ccf4b`.
- **Signatures.** The elaborated types of all 24 declarations (`signatures.md`, regenerated for this head) match the README statements; the file has no `variable` block, so no binder can be lost. The 0.2 headline carries `IsOpen Ω`, `ContinuousOn f Ω` and the two `HasLineDerivAt` with `fy = I * fx`; the Runge theorems carry `IsOpen Ω`, `IsCompact K`, `K ⊆ Ω`; the ∂̄ statements carry `ContDiffOn ℝ ∞`; the form statements are on `TopologicalSpace.Opens ℂ` with the model `𝓘(ℝ, ℂ)`.
- **One-tactic probe.** On a scratch copy with every `sorry` replaced by `first | (rfl; done) | (infer_instance; done) | (simp; done) | (norm_num; done) | (trivial; done) | (positivity; done) | (aesop; done) | exact?`, all 22 theorems fail at the final `exact?` ("could not close the goal", 22 errors, one per theorem). None is padding.
- **Headlines.** The README's headline theorems are all stated: Looman–Menchoff (0.2); the sharp finite-product bound (1.4); the weighted and native-divisor genus-one products (1.2); Runge with the hull equality and the finite-rank operator (2.5); zero-free approximation, zero and signed divisor realization (3.1); boundary noncontinuation (3.2); Mittag–Leffler, isolated singularities and the quotient (4.1); Cauchy–Pompeiu on a cycle (6.4); the ∂̄ solver and closed completion in scalar and form versions (7.1, 7.2); complex and real two-form exactness and `H²_dR = 0` (7.2); Cousin I (7.4). Layer 0.4's Laurent decomposition is a preparatory target whose coefficients are a Tau Ceti definition; its series statements are API of the README, not a headline, and the docstring's "Every headline theorem of the roadmap is statable at the pins" remains true. `IsRungeCompactPair` and `holomorphicHull` have real bodies on native carriers. Imports are `import Mathlib` plus five `TauCeti.*` modules present at the pin. No `set_option`, no `lemma`, no sorry'd data.

**Dependency check** (the brief's command):

```text
depcheck: 235 roadmaps, 2261 edges, 0 problem(s)
```

The merge order has ZerosOfLFunctions at line 48, AnalyticNumberTheoryPartI at 50 and this roadmap at 97; ConformalMapping is completed on main. No UPWARD, CYCLE or `moved:` line.

**Library declarations opened at the pins this round.** The changed passages cite 17 declarations; I opened each at the pin and compared its hypotheses with the README's wording.

| Declaration | File:line at the pin | Hypotheses, checked against the README |
|---|---|---|
| `TauCeti.circleLaurentCoeff` | `TauCeti/Analysis/Complex/Laurent/Basic.lean:49` | `(2πi)⁻¹ • ∮ (z − c)^(−n−1) • f z`, `n : ℤ`, `E` a complex normed space, as `:252`–254 |
| `circleLaurentCoeff_natCast` | `:59` | `= (cauchyPowerSeries f c R).coeff n` for every `R`, radius 0 included, as `:255` |
| `circleLaurentCoeff_smul`, `circleLaurentCoeff_add` | `:82`, `:87` | `_add` needs `CircleIntegrable f`, `g`; as `:256`–257 |
| `norm_circleLaurentCoeff_le` | `:100` | `0 ≤ R`, `‖f‖ ≤ M` on the sphere, bound `M * R^(−n)`; at `n = −k` this is `M ρ^k`, as 0.4's negative part |
| `circleLaurentCoeff_eq_of_differentiable_on_annulus_off_countable` | `:123` | `0 < r ≤ R`, countable `s`, continuity on `closedBall c R \ ball c r`, differentiability on `(ball c R \ closedBall c r) \ s`, as `:260`–263 |
| `circleLaurentCoeff_sub_zpow_smul` | `:145` | `[CompleteSpace E]`, `0 < R`, value `if n = m then a else 0`, as `:264`–265 |
| `two_pi_I_inv_smul_circleIntegral_sub_inv_smul_sub_of_differentiable_on_annulus_off_countable` | `:167` | `0 < r`, countable `s`, `w ∈ ball c R \ closedBall c r`, the same continuity and differentiability, no exclusion of `w ∈ s`, as `:267`–271 |
| `TauCeti.meromorphicGerms.principalPart` | `TauCeti/Analysis/Meromorphic/PrincipalPart.lean:188` | additive map to `𝕜[X]`; `principalPart_eq_iff` (`:217`) is "no constant term and germ minus its value at `(z − a)⁻¹` analytic", as `:272`–275 |
| `coeff_principalPart_succ_eq_circleIntegral` | `TauCeti/Analysis/Contour/Residue/PrincipalPart.lean:86` | `∀ᶠ ρ in 𝓝[>] 0`, coefficient of `X^(k+1)` is `(2πi)⁻¹ ∮ (z − a)^k f z`, the integral defining `a_(−k−1)`, as `:276`–278 |
| `TauCeti.Contour.exists_laurent_data_of_meromorphicAt` | `TauCeti/Analysis/Contour/MeromorphicLaurent.lean:223` | finite polar part of length `meromorphicPolarOrderAt f s` plus an analytic germ, as `:279`–281 |
| `cauchyPowerSeries`, `hasFPowerSeriesOn_cauchy_integral` | `Mathlib/MeasureTheory/Integral/CircleIntegral.lean:642`, `:737` | `CircleIntegrable f c R`, `0 < R` (`R : ℝ≥0`), `HasFPowerSeriesOnBall … c R`, as `:186`–190 |
| `Complex.differentiableOn_tsum_of_summable_norm`, `Complex.hasSum_deriv_of_summable_norm` | `Mathlib/Analysis/Complex/LocallyUniformLimit.lean:171`, `:182` | inside `namespace Complex`; summable majorant on an open `U`, each term holomorphic on `U`, as `:191`–193 |
| `Differentiable.apply_eq_of_tendsto_cocompact` | `Mathlib/Analysis/Complex/Liouville.lean:164` | inside `namespace Differentiable`; `[Nontrivial E]`, `Differentiable ℂ f`, limit along `cocompact`, as `:194`–195 |
| `meromorphicOrderAt` | `Mathlib/Analysis/Meromorphic/Order.lean:50` | `WithTop ℤ`-valued, as 0.4's classification uses it |

Not duplicated at the pins: `grep -ril laurent Mathlib/Analysis` finds only two incidental comments (`ValueDistribution/Cartan.lean:167`, `Meromorphic/FactorizedRational.lean:299`); Tau Ceti's only other analytic Laurent file, `Analysis/Complex/Fuchsian/Cusp/Laurent.lean`, expands an invariant function at a cusp in the q-coordinate and is a different object; `circleLaurentCoeff` is used in no Tau Ceti file but its own. The unchanged passages' 52 declarations were opened at these same pins by the previous review and the Lean file that cites them is unchanged and elaborates.

**Cross-roadmap citations resolved this round (7).**

- **ComplexKahlerGeometry on main.** K3 at `README.md:345`–348: "Consume GH2's local Laurent construction … The generic local Laurent decomposition and coefficient extraction remain owned by GlobalHolomorphicFunctions"; `:1620`–1636 requires that phase to be native-only and to precede GH0, and to supply "GH0's Laurent truncation for pole pushing and its finite-pole output to K3". Layer 0.4 is exactly that phase, and the README's Downstream paragraph (`:2447`–2450) records that K3 cites it within GH2. K5a consumes GH5.1 (`:35`–36); K2 consumes GH0 (`:198`–200, `:1637`).
- **Hyperfunctions on main.** `README.md:29`–30 consumes GH0's compact-support formula; HF2 at `:190`–194 owns MalgrangeTopVanishing for n ≥ 1; `STATUS.md:50` expects `H¹(U,O) = 0` for open `U ⊆ ℂ` from this roadmap. The inserted Scope paragraph (`:62`–68) matches.
- **AnalyticNumberTheoryPartI on main.** §0.15 at `README.md:530`–532 (`elementaryFactor`, `exists_entire_primary_product_exact`); §0.15a at `:554` (`exists_entire_exp_mul_of_divisor_eq`, both functions nonzero).
- **ZerosOfLFunctions on main.** 5.1 at `README.md:929`; 5.2 at `:938`–945 (`E₁`, `deriv E₁ z = −z exp z`, `logDeriv`).
- **ConformalMapping (Completed).** §5.3 at `README.md:787`; §5.6 at `:906`–928; `jordan_index_of_isPiecewiseC1On` at `Suggested.lean:640`.
- `overlaps.md`: no other open pull request changes this roadmap, no cited id is dropped by an open pull request, no cited id is defined only by an open revision.

**Ownership against open pull requests.** `roadmaps grep -i --readme-only 'laurent (expansion|decomposition|series|coefficient)'` over the 457 open pull requests and main: every hit outside #992 is a use of Laurent series in another setting (formal `LaurentSeries`, Robba rings, q-expansions at cusps, Tate curves, operator-valued Laurent coefficients in AutomorphicSpectralTheory, Čech computations). No roadmap owns the Laurent expansion of a holomorphic function on a plane annulus; ComplexKahlerGeometry K3 on main explicitly leaves it to this roadmap. The previous review's searches for `Looman`, `Runge`, `Cousin`, `holomorphic hull`, `Pompeiu`, `Mittag.Leffler` and `Malgrange` cover the unchanged targets.

**Sources: the seeded sample (15 targets).** Rainer's printed page is the PDF page minus 6. Every line below was read this round.

| Target | Locator in README | Text at the locator | Verdict |
|---|---|---|---|
| 0.1 | Rainer §10, (10.1), p. 23 (rainer 1211) | `∮_{∂U} g dζ = ∬_U g_ζ̄ dζ̄∧dζ`, `U` on the left; `dξdη = −(2i)⁻¹ dζ∧dζ̄` at 1253 | correct |
| 0.3 | Thm 10.2, pp. 23–24 (1255); Thm 10.3, p. 24 (1295) | `u = −π⁻¹ ∬ f(ζ)/(ζ−z)`, `C^k`, `∂u/∂z̄ = f`; cutoff identity `f(z) = −π⁻¹ ∬ ψ_ζ̄ f/(ζ−z)` on `K` | correct; the README's kernel `(z − ζ)⁻¹` with `+π⁻¹` is the same sign |
| 0.4 | Lemma 7.1 (674), Cor 7.2 (682), Lemma 7.3 (692), p. 14–15; Thm 7.4 (716), Cor 7.5 (754), p. 15; Thm 7.6 (790), p. 16 | Abel on annuli; annulus of convergence; coefficient uniqueness by term-wise circle integration; existence with the inner-kernel geometric expansion; `f = f₊ + f₋` unique with `f₋ → 0`; removable/pole/essential by negative coefficients | correct; the page breaks at lines 694 and 771 give pp. 14, 15, 16 as cited |
| 1.2 | Thm 14.3, pp. 35–36 (1868) | uniform convergence of `Σ|f_n|` on compacta ⇒ products converge, zeros exactly where a factor is `−1`, orders add | correct |
| 1.5 | Thm 14.3 (1868) and its proof (1881–1900) | the proof bounds `|p_N − p_M| ≤ p_M (exp(Σ_{M+1}^N |f_n|) − 1)`, the relative estimate 1.5 states | correct |
| 2.2 | §11, (11.2), Exercises 19–20, p. 25 (1313, 1329) | `d = Σ 2^{−n}|f−g|_{K_n}/(1+|f−g|_{K_n})`; completeness and `f ↦ f′` continuous as exercises | correct |
| 2.3 | §11, p. 25 (1333) | `O(K)` as a subspace of `C(K)`, "in general it is not closed" | correct |
| 2.5 | Thm 11.1, p. 25 (1338); Lemma 11.3, pp. 27–28 (1437); Thm 11.7, p. 29 (1550) | (1)⇔(2)⇔(3); hull = `K` ∪ relatively compact components, compact, idempotent, finitely many complementary components; poles in the compact components of `ℂ∖U` | correct |
| 3.3 | Thm 15.5, p. 39 (2086) | locally finite disks with radii → 0, distinct zeros, identity theorem on a connected component | correct; the README's dense-boundary construction uses that argument |
| 6.1 | dlmf-4-22 lines 79–80, 104–109; dlmf-5-8 line 79 | (4.22.2) `cos z = ∏(1 − 4z²/((2n−1)²π²))`; (4.22.3) `cot z = 1/z + 2z Σ 1/(z² − n²π²)` for `z ≠ nπ`; (5.8.2) `1/Γ(z) = z e^{γz} ∏ (1 + z/k) e^{−z/k}` | correct after `z ↦ πz` |
| 6.5 | `cot_series_rep`, `cotTerm_identity` (Mathlib) | opened by the previous review at `Trigonometric/Cotangent.lean:233, 207`; the paired form `1/z + Σ 2z/(z² − n²)` is recomputed below | correct |
| 7.1 | Thm 12.2, p. 31 (1630) | `f ∈ C^∞(U)` ⇒ `u ∈ C^∞(U)` with `∂u/∂z̄ = f`, by Runge corrections on `K_j = K̂_j` | correct |
| 7.2 | derived from 7.1 and the pinned form API | — | correct as derived; values below |
| 7.3 | (10.1) (1211); proof of Prop. 10.1, p. 23 (1237) | polar bound `∬|ζ−z|⁻¹ ≤ ∫∫ dr dφ` | correct |
| 7.4 | Prop. 12.3 and Thm 12.4, p. 32 (1658, 1689) | partition of unity `f_i = Σ φ_j f_ij`, then the ∂̄ correction; cocycle `f_ik = f_ij + f_jk` | correct; equivalent to `c_ij + c_jk + c_ki = 0` given `c_ii = 0`, `c_ji = −c_ij`, which the Lean hypothesis forces at `i = j = k` and `k = i` |

Also read this round: Gray–Morris Theorem 3, p. 247 (gray-morris 66–70) and Appendix Lemma 1, pp. 252–253 (315–325), for the 0.2 headline; Remark 15.4, p. 38 (2030) for 1.1; Prop. 15.2 and Lemma 15.1, pp. 36–37 (1934, 1950, 1960–1993) for 3.1; Thm 12.1 (1603), Thm 15.6 (2116) and Thm 15.7 (2126) for 4.1.

**Adversarial pass.** S = `Suggested.lean`, R = `README.md`. Values were computed this round with my own pure-Python scripts: Laurent coefficients by 4000-point trapezoid circle integrals, truncated products with `N = 2·10⁵`, midpoint area quadrature with the Cauchy-kernel singularity subtracted exactly, central differences with `h = 10⁻⁶`.

| Statement | Instances | Values computed on each side | Result | Change |
|---|---|---|---|---|
| R 0.4 coefficients depend on the annulus (Check 2) | `f = 1/(z(z−1))`, `ρ = 1/2`; `ρ = 2` | `a_{−1} = −1`, `a_0 = a_1 = a_2 = a_3 = −1`, `a_{−2} = a_{−3} = 0`; `a_{−2} = a_{−3} = a_{−4} = 1`, `a_{−1} = a_0 = a_1 = 0`; sums `−4 = f(1/2)`, `Σ_{k≥2} 2^{−k} = 0.5 = f(2)` | Pass | none |
| R 0.4 essential singularity (Check 3) | `f = e^{1/z}`, `ρ = 1` | `a_{−k} = 1/k!` (`1, 0.5, 0.1666667, 0.0416667`), `a_0 = 1`, `a_1 = a_2 = 0`; tail `Σ_{k≥6} 1/k! = 0.0016151618`; max over `|z| = 1` of `|e^{1/z} − S₅| = 0.0016151618`, at `z = 1` | Pass | none |
| R 0.4 negative part decays like `2 M_ρ ρ/|z−c|` | `f₋ = e^{1/z} − 1`, `ρ = 1`, `M_ρ = e` at `z = 2, 3+i, −5i` | `0.6487 ≤ 2.7183`, `0.3686 ≤ 1.7192`, `0.1997 ≤ 1.0873` | Pass | none |
| R 0.4 splitting unique only with the limit condition (Check 4) | `1/z = 1 + (1/z − 1)` | second part at `|z| = 10⁹`: `−0.999999999 → −1 ≠ 0` | Pass | none |
| R 0.4 derivative law `(n+1) a_{n+1}` (Check 5) | `f = 1/z`, `f′ = −1/z²` | circle coefficients of `f′`: degree `−2`: `−1`, degree `−1`: `0`, degree `0`: `0`; the law `n a_n` would give `−1` in degree `−1` | Pass | none |
| R 0.4 principal part (Check 6) | `f = (z+1)/z²`, `ρ = 0.7` | `a_{−2} = a_{−1} = 1`, `a_{−3} = a_{−4} = a_0 = a_1 = 0`; `X² + X` at `1/z` is `f` | Pass | none |
| R 0.4 radius-zero exclusion (Check 1) | `f = 1/z` | `a_{−1} = 1` at `ρ = 1`; the circle integral of radius 0 is 0 (`circleIntegral.integral_radius_zero`, used in `norm_circleLaurentCoeff_le`'s proof at `:104`) | Pass | none |
| R 2.5 pole pushing with Layer 0.4 | `f = e^{1/z}`, `K = {|z| = 1}`, 5 negative terms | error `0.0016152`, uniform on `K` by the row above; `f₊ = 1` is entire | Pass | none (R01 of the previous review repaired) |
| S Looman–Menchoff (0.2) | `z²` at `1+i`; `z̄`; Looman's `exp(−z⁻⁴)`, `f(0) = 0`; `Ω = ∅` | `f_y − i f_x = 0`; `f_y = −i ≠ i = i f_x` (excluded); `|f| = 11.489, 64.388` at `r = 0.8, 0.7` on `arg = π/4` (excluded by `hcont`); vacuous | Pass | none |
| R 0.2 balanced estimate | unbalanced `[0,20]×[0,1]`, `E = {(0,0),(20,1)}`, `N = 1`, `φ = y(20−x)c(x)` with `c = x(2−x)` on `[0,1]`, 1 after | left side `193.4` vs `5N·m(R∖E) = 100` (source lemma fails without the aspect bound) | Pass | none (source issue) |
| R 0.3 kernel norm | radius-1 disc | `∫ |ζ|⁻¹ dA = 2π = 6.2832` | Pass | none |
| R 1.1 derivatives | `E₂′(−1)`; `E₀′(0.3)`; `E₁′(1)`; `log‖E₁(1/2)‖` | `−0.6065307 = −e^{−1/2}`; `−1`; `−2.7182818 = −e`; `−0.1931 ≤ 0.25` | Pass | none |
| S `exists_entire_genusOne_product` | `S = {n²}`, `m = 1` at `z = 2+i`; `S = ∅`; `S = {2}`, `m = 0` | `−0.4312778 − 9.3328073i` vs `e^{π²z/6} sin(π√z)/(π√z)` = same; `F = 1`; factor 1, order 0 | Pass | none |
| S `…_of_divisor` | `D = Σ[n²]`; `D = 2[1]`; `D = [1] − [2]` | same `F`, divisor 1 at each `n²`; `(1−z)² e^{2z}`, divisor 2; excluded by `hD` | Pass | none |
| S sharp bound (1.4) | 3000 random complex families of size 0–6; `u = (1,1)`; ℤ₃ `u = (3,3)` | `max(LHS − RHS) = 4.4·10⁻¹⁶`; `3 ≤ 3` vs `e² − 1 = 6.389`; `1/3 ≤ 7/9` | Pass | none |
| R 1.5 uniform tail | `X = ℕ`, `u_n = [x = n]/(n+1)` | tail `1/(N+1)` while `Σ sup = Σ 1/(n+1)` diverges | Pass | none |
| S `IsRungeCompactPair`, `holomorphicHull`, `holomorphicHull_eq_fill` | `(∅,∅)`; annulus `{2 ≤ |z| ≤ 3}` in `D₄`; same in `{1 < |z| < 4}` | true, hull `∅` (universal `B = −1` for `f = 0`); false, hull = closed 3-disc both sides; true, hull = `K` both sides since `|1/1.5| = 0.667 > 0.5 = sup_K |1/z|` | Pass | none |
| S Runge equivalence | annulus in `D₄` with `1/z` | `∮_{|z| = 5/2} dz/z = 2πi = 6.2832i` vs 0 for every `g ∈ H(D₄)`: both sides false | Pass | none |
| S finite-rank operator | `K = ∅`; `f = 0`, `B = 0` | `L = ∅`, `N = 0`; `0 ≤ 0` | Pass | none |
| S zero-free approximation (3.1) | `K = {1 ≤ |z| ≤ 2}`, `Ω = ℂ∖{0}`, `u = z − 1/2` | `G_N(1) = 0.6065, 0.5134, 0.5000412` at `N = 1, 3, 10 → 1/2`; `G_N = z·exp(L_N)` nowhere zero on `Ω` | Pass | none |
| S zero orders; signed divisor | `m = 0`; `2[2]`; `ν = 2[0] − [1]` | `f = 1`; `(z−2)²`; `z²/(z−1)`, orders 2 and −1 | Pass | none |
| S boundary germ (3.2) | `Ω = ℂ∖{0}`, `f = sin(1/z)`; `Ω = ∅` | zeros `1/(kπ)` force `F ≡ 0` near 0 while `f(2/π) = 1`; frontier `∅` | Pass | none |
| S Mittag–Leffler; isolated singularities; quotient (4.1) | `E = ℤ`, `P_n = 1/(z−n)`; `E = {0}`, `U₀ = ball(0,1/2)`, `φ₀ = 1/z + 1/(z − 1/2)`; `F = cot` | `π cot πz`, residue 1; `f = 1/z`, remainder `−1/(z−1/2)` analytic at 0; `(cos, sin)` with `sin ≠ 0` off `πℤ` | Pass | none |
| R 2.2 metric | constants `1/(n+1)` at `n = 0, 1, 5` | `Σ 2^{−k} s/(1+s) = 0.5, 0.3333, 0.142857 = 1/(n+2)` | Pass | none |
| R 6.1 products and series | cosine at `0.2 − 0.3i`; `1/Γ(1/2)`; `π cot(πi)`; residue of `−π tan πz` at `1/2` | `1.1957246 + 0.6397068i` vs `1.1957245 + 0.6397076i`; `0.5641898` vs `0.5641896`; paired `−i(1 + 2S₁) = −3.1533471i` with `S₁ = 1.0766735` vs `−3.1533481i`; `0.99999997 → 1` | Pass | none |
| R 6.2 theta, `e^z − 1` | `r = 0.4`, `z = 0.2 + 0.7i`; `z = 0.9 + 2.1i` | ratio `1.5654995 − 1.3186021i = r⁻¹ e^{−z}`; `−2.2417211 + 2.1231545i` vs `−2.2417210 + 2.1231524i` | Pass | none |
| R 6.3 examples | crescent at `−1/2`; point-normalized `n = 1` | `|z| = 0.5 < 1`, `|2z−1| = 2 > 1`; `(1/2)/(1 − 1/2) = 1` | Pass | none |
| S `cauchyPompeiu` (6.4) | `Δ = {1/2 < |z| < 1}`, `C` = outer − inner, `f = z̄² + z|z|²`, `ξ = 0.7 + 0.1i` | RHS `0.8299728 − 0.0899977i` (300×600), `0.8300039 − 0.0900011i` (600×1200) vs `f(ξ) = 0.83 − 0.09i`; with `+` area sign `0.8100 + 0.2200i` | Pass | none |
| S ∂̄ solver (7.1) | `u = z̄²/2` at `0.7 − 0.4i`; `u = −e^{−|z|²}` at 1 | `u_x + i u_y = 1.4 + 0.8i = 2z̄`; `0.7357589 = 2e^{−1}` | Pass | none |
| S closed completion; completion form; complex exactness (7.1, 7.2) | `f = z²`, `g = 2|z|²` at `0.3 + 0.8i`; `f = z`, `g = z̄`; `η = dz∧dz̄`, `β = −z̄ dz` | `g_x + i g_y = 4z = 1.2 + 3.2i = f_x − i f_y`; `g_x + i g_y = 2 = f_x − i f_y` and `d(z̄ dz + z dz̄) = dz̄∧dz + dz∧dz̄ = 0`, while `g = 0` leaves `dz∧dz̄ ≠ 0`; `dβ = dz∧dz̄`, while `+z̄ dz` gives `−dz∧dz̄` | Pass | none |
| S real exactness; `H²` (7.2) | `η = dx∧dy`, `β = (x dy − y dx)/2`; swapped `β`; `U = ∅`; circle | `dβ(1,i) = 1/2 + 1/2 = 1`; swapped gives 0; zero form; on `S¹` every one-form is closed yet `H¹ = ℝ` | Pass | none |
| R 7.3 moments | `(m,n) = (0,0), (1,0), (1,1), (2,2), (2,1)` | `3.1415927, 0, 1.5707914 (π/2), 1.0471894 (π/3), 0` by 400×400 polar midpoint | Pass | none |
| S Cousin I (7.4) | `Ω = ℂ∖{0}`, `U₁ = ℂ∖[0,∞)`, `U₂ = ℂ∖(−∞,0]`, `c₁₂ = 1` on `Im > 0`, 0 on `Im < 0`; one set | `b₁ = 1 − L₁/(2πi)`, `b₂ = −L₂/(2πi)` with the two branch cuts: `b₁ − b₂ = 1` at `i` and `2 + 0.5i`, `0` at `−i` and `−3 − 0.1i`; `3c₁₁ = 0` | Pass | none |
| R 7.4 / HF2 ownership | HF2 MalgrangeTopVanishing at `n = 1, p = 0` vs `exists_smooth_conjWirtingerDeriv_eq` | same surjectivity; `:62`–68 now records the cycle 7.1 → HF2 → K5a → 7.2 → 7.1 | Pass | none (R02 of the previous review repaired) |

The table has 35 rows and covers the 15 sampled targets, all 22 theorems and both definitions of `Suggested.lean`, every passage changed since the previous review, and the targets R01 touches (none in the folder).

## Not verifiable

- None. All four sources recorded in `sources.toml` (rainer, gray-morris, dlmf-4-22, dlmf-5-8) were read at every sampled locator from the sources cache.

## Source issues

- **Error** in gray-morris at Appendix, Lemma 1, p. 253: the source says the `5N·m(R−E)` bound holds for every closed rectangle `R`; it should be restricted to rectangles of bounded side ratio, since `[0,20]×[0,1]` with the two corner points as `E` gives about 193 against 100; affects the proof.
- **Gap** in rainer at proof of Proposition 15.2, p. 37: the source says Lemma 15.1, stated for a domain `U` whose complement contains `a_j` and `b_i` in one component, gives `φ_{i,j} ∈ O(K)`; it should be applied on `ℂ∖P` for a path `P` from `b_i` to `a_j` inside `V_j`, since `K` is not a domain; affects the proof.
- **Misprint** in rainer at proof of Proposition 15.2, p. 37: the source says the final error is below `2ε` while the proposition asserts `ε`; it should be run with `ε/2`; affects nothing.
