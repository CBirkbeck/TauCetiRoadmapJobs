# Review of AnalyticNumberTheoryPartIII (package, round 1)

**Verdict:** needs changes

One finding, P3. Everything else checked holds: the principles, the sampled locators, the
elaboration, the padding probes, the dependency direction, the library names at the pins, the
cross-roadmap citations, the ownership sweep and the adversarial table below. The repair is a
one-sentence correction of a Check; nothing in `Suggested.lean` changes.

## R01 (P3) — 9.4 Check: the opposite normalisation does not tend to `0`

Location: `packages/AnalyticNumberTheoryPartIII/README.md` lines 760–762, third Check of 9.4:
"With the opposite normalization `mellin ν (s/ε)/s` the limit as `ε → 0⁺` would be `0` on
`Re s > 0` instead of `1/s`".

Claim: the wrong model `mellin ν (s/ε)/s` is excluded because it tends to `0` as `ε → 0⁺`.

Witness: `mellin ν (w) = ∫_{1/2}^{2} ν(x) x^{w−1} dx` grows like `2^{Re w}` as `Re w → +∞`
whenever `ν > 0` somewhere on `(1, 2]`, which every bump with `dx/x`-mass `1` that is not supported
in `[1/2, 1]` does. For the Check's own bump `ν ∝ (x − 1/2)²(2 − x)²` and `s = 1.3 + 2i`, Simpson
quadrature gives `|mellin ν (s/ε)/s| = 0.506, 0.762, 16.37` at `ε = 1/2, 1/4, 1/10`, against
`|1/s| = 0.419`: the wrong model diverges, it does not vanish. (At `ε = 1/2` its value is
`0.4962 + 0.0989i`, while the correct side is `0.30772 − 0.32853i`, as the Check states.)

Repair: replace the sentence by one that is true and still discriminates, for instance: "With the
opposite normalization `mellin ν (s/ε)/s` the value at `ε = 1/2`, `s = 1.3 + 2i` is
`0.4962 + 0.0989i` instead, and as `ε → 0⁺` its modulus grows like `2^{Re s/ε}` (for `ε = 1/10` it
is `16.4`) rather than tending to `1/s`, the transform of `1_(0,1]`." Tested on the refuting
instance: the three values above were computed from the normalised bump (`dx/x`-mass of the raw
polynomial `0.21442`), with the correct side reproducing the Check's `0.30772 − 0.32853i` to five
places and its direct Mellin integral of the cutoff agreeing to `1.2·10⁻⁴` (quadrature error).

## Verified sound

### Principles

- No route-specific shortcut: every statement is general (arbitrary `C^k` bumps, arbitrary widths
  `η`, every number field and ray class character, arbitrary `z, ν, α, β ∈ ℂ`).
- No re-planned roadmap: the `ζ` instances (Part I §§0.33a, 0.30a, 3.24a), the `ζ^k` series
  (ArithmeticDirichletSeriesPartII §5.1), `2^ω` (ProbabilisticAndMetricNumberTheory §0.1a), the
  Perron kernel (ArithmeticDirichletSeries §6.3) are cited as Checks or inputs, not restated.
- Supply direction: `gate --depcheck … --movable` printed `depcheck: 238 roadmaps, 2347 edges,
  0 problem(s)`; no UPWARD or CYCLE line. This roadmap sits at line 271 of the merge order, after
  every supplier it names (ZerosOfLFunctions 48, AnalyticNumberTheoryPartI 49,
  ProbabilisticAndMetricNumberTheory 61, ArithmeticDirichletSeriesPartII 91, ExplicitZetaBounds 265,
  ExplicitPrimeCounting 267; LFunctions 27 and the completed ArithmeticDirichletSeries and
  ContourIntegration on main).
- No copied passage (every source statement is paraphrased with a line locator); no computational
  algorithm (the Goldbach verifications are hypotheses, 13.1 is an asymptotic, not a procedure);
  no sorry'd data (the eight definitions have real bodies); no `set_option`, no `lemma`, no
  `#eval`/`#print`; imports are `import Mathlib` plus the two `TauCeti.*` modules the file uses
  (`TauCeti.Contour.residue`, `TauCeti.LFunctions.heckeLFunctionC`), both present at the pin with
  object files. The leading `module` keyword is the convention of 36 of the 152 `Suggested.lean`
  files on main.
- No process residue: grep for pull-request numbers, dates, hand-off words, machine paths, LaTeX
  delimiters and "optional/deferred" found nothing in the README or the Lean file.

### Elaboration and probes

- `lake env lean` on `packages/AnalyticNumberTheoryPartIII/Suggested.lean`: exit 0, exactly 24
  warnings `declaration uses sorry` (lines 58, 69, 82, 98, 113, 125, 151, 160, 173, 194, 215, 243,
  249, 258, 266, 274, 285, 296, 302, 314, 324, 342, 349, 367), nothing else.
- `#check @name` for all 33 declarations in a scratch copy: every elaborated type matches its
  README statement (the file has no `variable` block, so no binder can be lost; the worker's
  `signatures.md` agrees: 0 dropped binders). Generality agrees in both directions: 7.1 on a
  complete normed `ℂ`-space, 12.1b on a real normed space without completeness, 8.3 with `C`
  depending on `r₁, r₂` only, 10.3 on `heckeLFunctionC χ` for every `K`, `𝔪`, `χ`.
- Padding probe, every one of the 24 sorried theorems: `first | rfl | simp | infer_instance |
  norm_num | decide | positivity | …` fails on all 24 (errors at the 24 proof lines, none closed);
  `exact?` fails on all 24 ("could not close the goal", no `Try this`). No declaration restates a
  definition, mirrors a Check, computes a small value or treats a boundary case; the eight
  definitions are each needed by a stated headline.
- Headline coverage: the README's summary names Fourier decay and principal-value inversion (7.1,
  7.3), the rectangle residue theorem, derivative Borel–Carathéodory and Landau's lemma (8.1–8.3),
  the smoothed cutoff transform (9.4), the smoothed sum, the transfer theorem and the `L′/L` bound
  (10.1–10.3), the series and abscissas of `σ_ν`, `d_z`, Ramanujan's identity, `2^ω`, `μ²`, `λ`,
  `φ` (11.2–11.4), Hardy–Landau (12.1), Erdős 392 and the Goldbach transfer (13.1–13.2): all 24
  are stated. The remaining targets (7.2, 9.1–9.3, 11.1, the `τ(n²)` corollary, the elementary
  Goldbach transfers) are lemmas, and the module docstring says so.

### Sources: the seeded sample

All read in the worker's cache; locators quoted as `<id> line N`.

| Target | Locator claimed | Found at | Verdict |
|---|---|---|---|
| 7.1 | Lemma 3.1.4 line 189; 3.1.5–3.1.6 lines 198–209; 3.1.7 lines 210–220 | lines 189, 198, 205, 210; `C = π + 1/(4π)` at line 220 | hypotheses and bounds as stated |
| 8.1 | Thm 4.1.2, Lemmas 4.1.2–4.1.4 lines 621–642; Defs 4.1.3–4.1.5, Lemma 4.1.1 lines 596–613 | lines 621, 626, 633, 636; 596, 598, 602, 611 | source treats simple poles; README says so |
| 8.2 | Thm 5.3.2 lines 1751–1758 | line 1751, `16MR²/(R−r)³`, `f(0) = 0` | weaker source form noted correctly |
| 8.3 | Thm 5.3.7 lines 1971–1977 | line 1971, explicit constant, radii `r′ < r < R′ < R < 1` | hypotheses match after scaling |
| 9.1 | Def 4.3.1 lines 893–898; Lemma 4.3.2 lines 900–914; Thm 4.3.1 lines 916–946 | lines 893, 900, 916 | source's symmetry is for `x ≠ 0`; README's `x > 0` is a safe restriction |
| 9.2 | Thm 4.3.2 lines 947–962 | line 951 (`O(1/|s|)` on `σ₁ ≤ Re s ≤ 2`) | README generalises to `C^k`, says so |
| 9.4 | Def 4.3.3 lines 1015–1017; Lemmas 4.3.5–4.3.11 lines 1025–1134 | lines 1015, 1025, 1053, 1069, 1078, 1107, 1128, 1132 | source's 4.3.9 has no `Re s > 0`; README's restriction is where the transform converges |
| 10.1 | Def 4.5.2, Thm 4.5.2 lines 1463–1498; Thm 4.5.3 lines 1502–1506 | lines 1463, 1483, 1502 | `O(εX log X)` as stated |
| 10.2 | Def 4.5.3, Thm 4.6.1 lines 1507–1516, 1673–1683; 4.6.2 line 1684; platttrudgian2020 lines 21–32, 54–56 | lines 1507, 1673 (`exp(−c(log x)^{1/(1+n₁)})`), 1684 (`1/10`); PT lines 21–32 (Ingham, `(1−ε)/2`), 54–56 (Pintz) | as stated |
| 10.3 | Thm 5.2.3 lines 1718–1723 | line 1718, `log² t` for `ζ` | README says "weaker" correctly |
| 11.1 | Def 9.1.8, Thms 9.1.66–9.1.67 lines 3590–3604 | lines 3590, 3592, 3600 | as stated |
| 11.2 | Defs 9.1.3–9.1.5, Thms 9.1.12–9.1.32 lines 3151–3323 | lines 3151, 3179, 3191 (`(a+k−1) choose (k−1)`), 3215, 3270, 3316 | as stated |
| 11.4 | Thms 9.1.49, 9.1.57, 9.1.68, 9.1.70 lines 3454–3640 | lines 3454, 3533, 3605, 3626; the `Re s > 2` correction at line 3631 | as stated |
| 13.1 | Thms 8.1.1–8.1.2 lines 3096–3101; Sublemma 8.1.16 lines 3080–3081; waste/score lines 2984–3095 | lines 3096, 3099, 3080, 2984 | as stated |
| 13.2 | helfgottplatt2013 lines 9–10, 27–31; oliveiraesilva-herzog-pardi2014 lines 13–14 | bound `8,875,694,145,621,773,516,800,000,000,000` at line 10; ladder at 27–31; `4·10^18` at line 14 | as stated |
| 12.1 (headline) | estradavindas2012littlewood lines 32–35 | one-sided `−C < n c_n` at lines 32–35 | as stated |
| 7.2 (dlmf) | 6.2.19, 6.12.5–6.12.8, §6.16 | fetched through the service: 6.2.19 `Si = π/2 − f cos − g sin`; 6.12.5–6.12.8 remainders `R_n^{(f)}, R_n^{(g)}` at `n = 0`; §6.16(i) first maximum of `Si` at `π` | as stated |

The worker's cached `dlmf-ch6` text was the chapter index only; sections 6.2, 6.12 and 6.16 were
fetched under the same key (the manifest entry is unchanged, as recorded by the service).

### Library declarations opened at the pins

Every name cited in the README or the Lean file elaborates under `#check @…` against the pinned
Mathlib and Tau Ceti. Opened by file: `Real.norm_fourier_le_integral_norm`
(`Mathlib/Analysis/Fourier/FourierTransform.lean:441`), `Real.fourier_deriv` and
`Real.one_add_sq_mul_norm_fourier_le` (`…/FourierTransformDeriv.lean:792, 856`), `eVariationOn`
(`Mathlib/Topology/EMetricSpace/BoundedVariation.lean:61`), `BoundedVariationOn.vectorMeasure` and
`variation_vectorMeasure_univ_le` (`Mathlib/MeasureTheory/VectorMeasure/BoundedVariation.lean:119,
566`), `mellin`, `mellinInv`, `MellinConvergent`, `HasMellin`, `hasMellin_one_Ioc`,
`mellin_comp_rpow`, `mellin_comp_mul_left`, `mellin_differentiableAt_of_isBigO_rpow`
(`Mathlib/Analysis/MellinTransform.lean:91, 96, 45, 160, 438, 116, 133, 401`), `mellin_eq_fourier`,
`mellinInv_mellin_eq` (`Mathlib/Analysis/MellinInversion.lean:49, 92`, the latter with
`0 < x`, `MellinConvergent f σ`, vertical integrability and `ContinuousAt f x` as the README says),
`Complex.integral_boundary_rect_eq_zero_of_differentiableOn`
(`Mathlib/Analysis/Complex/CauchyIntegral.lean:313`), `Complex.reProdIm`
(`Mathlib/Basic/Complex/Basic.lean:110`), `Complex.borelCaratheodory`
(`Mathlib/Analysis/Complex/BorelCaratheodory.lean:109`), `analyticOrderNatAt`
(`Mathlib/Analysis/Analytic/Order.lean:63`), `LSeriesHasSum`
(`Mathlib/NumberTheory/LSeries/Basic.lean:217`), `LSeries_convolution'`
(`…/LSeries/Convolution.lean:149`), `LSeries_zeta_eq_riemannZeta`, `LSeries_zeta_mul_Lseries_moebius`,
`LSeries_vonMangoldt_eq_deriv_riemannZeta_div` (`…/LSeries/Dirichlet.lean:283, 296, 439`),
`riemannZeta_eq_exp_LSeries` (`…/EulerProduct/DirichletLSeries.lean:264`),
`eulerProduct_tprod`, `eulerProduct_completely_multiplicative_tprod`
(`…/EulerProduct/Basic.lean:225, 357`), `moebius`, `liouville`, `liouville_apply_mul`,
`cardDistinctFactors`, `vonMangoldt`, `pmul`, `sigma` (`…/ArithmeticFunction/Moebius.lean:54,
Liouville.lean:31, 44, Misc.lean:329, 146, VonMangoldt.lean:66, Zeta.lean:106`), `Nat.totient`
(`Mathlib/Data/Nat/Totient.lean:38`), `Nat.factorization` (`…/Factorization/Defs.lean:51`),
`BinomialRing` and its `Module ℚ≥0` instance (`Mathlib/RingTheory/Binomial.lean:76, 280`),
`Filter.Tendsto.cesaro_smul`, `cesaro` (`Mathlib/Analysis/Asymptotics/SpecificAsymptotics.lean:176,
191`), `Stirling.factorial_isEquivalent_stirling`, `le_factorial_stirling`
(`Mathlib/Analysis/SpecialFunctions/Stirling.lean:218, 248`), `Chebyshev.psi`,
`theta_le_log4_mul_x` (`Mathlib/NumberTheory/Chebyshev.lean:70, 191`),
`Nat.factorization_factorial` (`Mathlib/Data/Nat/Choose/Factorization.lean:42`),
`MeasureTheory.integral_prod` (`Mathlib/MeasureTheory/Integral/Prod.lean:443`). Tau Ceti:
`TauCeti.Contour.residue` (`TauCeti/Analysis/Contour/Residue/Basic.lean:80`, junk `0` off
meromorphic points as the README says), `classicalResidueTheorem_nullHomologous`
(`…/Residue/Cycle.lean:226`), `tendsto_integral_sin_div_atTop`
(`…/WorkedExamples/HalfDisc/SineIntegral.lean:351`),
`BoundedVariationOn.integral_deriv_smul_eq_neg_integral_vectorMeasure`
(`TauCeti/Analysis/BoundedVariation/OneDimensional.lean:48`), `truncatedPerronKernel`,
`truncatedPerronKernel_one` (`TauCeti/NumberTheory/ArithmeticDirichletSeries/Perron/Basic.lean:142,
204`, value `π⁻¹ arctan(T/c)` at `x = 1`), `truncatedPerron_LSeries` (`…/Perron/Formula.lean:130`),
`heckeLFunctionC`, `heckeLFunctionC_eq_primitive`, `heckeLFunctionC_eventuallyEq_primitive`
(`TauCeti/NumberTheory/LFunctions/Hecke/Basic.lean:74, 130, 138`; the definition is
`meromorphicContinuation 1` of the series over ideals prime to the finite part, as the Conventions
say), `finite_rayClassGroup` (`…/RayClass/Finite.lean:155`), `RayClassCharacter`
(`…/RayClass/Character/Basic.lean:62`, `RayClassGroup 𝔪 →* ℂˣ`), `Modulus`
(`…/RayClass/Modulus.lean:98`), `MultiplicativeIdealWeight`, `UnitaryIdealWeight`
(`…/ArithmeticDirichletSeries/Weight.lean:116, 839`), `normCoeff` (`…/NormCoeff.lean:100`).

### Cross-roadmap citations resolved

- ZerosOfLFunctions on main: §3.4 (line 705; "wide strips above the poles" bullet at lines
  51–52 of the section), §4.3 (line 837, Jensen from `AnalyticOnNhd.sum_divisor_le`), §6.2 (line
  1046, `heckeZeroFreeConstant ≤ log 3/2`), §6.3 (`IsExceptionalZero`, line 1075), §6.4 (line
  1097), §6.5 (line 1142), §7.1 (`rectBoundary`, line 1182: counterclockwise, piecewise `C¹`,
  null-homologous in every open `U ⊇ R`, winding number `1` inside), §7.2 (line 1205, argument
  principle), §8.5 (line 1398, `x exp(−c√log x)`), §8.6 (line 1412).
- LFunctions on main: Layer 3 (line 730, simple pole of `ζ_K` at `1`), Layer 5 (line 929, Euler
  product on `Re s > 1` and primitive versus presented), Layer 7 (line 1440, no zero on `Re s = 1`).
- Completed ArithmeticDirichletSeries: §0.2 (`MultiplicativeIdealWeight`, finite bad set), §6.3
  (`truncatedPerronKernel`, `π⁻¹ arctan(T/c)`), §6.4 (arithmetic Perron), Layers 6, 9, 10.
  Completed ContourIntegration: Layers 2–4 (residues, homological Cauchy, generalized residue
  theorem).
- AnalyticNumberTheoryPartI at its open head: §0.11c (line 384), §1.2a (line 939), §0.30a
  (`riemannZeta_local_logDeriv`, line 795, statement as paraphrased), §0.33 (line 845), §0.33a
  (`riemannZeta_deriv_logDeriv_bound`, line 855: `Re s ≥ 1 − β/log(|Im s|+2)`,
  `|ζ′/ζ + 1/(s−1)| ≤ C log(|Im s|+2)`, exactly the README's paraphrase), §3.3 (line 2211), §3.4
  (line 2219, `d_n(p^a) = binomial(a+n−1, n−1)`), §3.22 (line 2549), §3.24a
  (`riemannZeta_pow_four_eq_mul_LSeries_divisor_sq`, line 2947).
- ProbabilisticAndMetricNumberTheory at its head: §0.1a (line 196) with
  `IsCompletelyAdditive.powOfAdditive_mul` (line 314, "completely multiplicative, `k^Ω` the
  instance") and `isMultiplicative_powOfAdditive_cardDistinctFactors` (line 321). The worker's
  resolve lead on `powOfAdditive_mul` is this roadmap name, attributed correctly to that section.
- ArithmeticDirichletSeriesPartII at its head: §0.1 (`HasLaplace`, line 337), §3.2 (Delange, line
  1056), §5.1 (`LSeriesHasSum_zeta_pow`, line 1306: "This section owns the Dirichlet series of
  `d_k` for every `k ∈ ℕ`"), consistent with this roadmap citing it for the `z = k` Check.
- ExplicitPrimeCounting at its head: §1.4 (line 1471), §2.1 (line 1623; the kernel bound
  `max(1, b) V/|s|²` on `0 ≤ Re s ≤ 1` at the section's lines 1632–1634), §3.1 (line 2099, forms
  (c) and (d) with zero density), §3.6 (line 2899), Layer 7 and §7.1 (lines 4130, 4132: prime in
  `(x, x + x/16597)` for `x > 2 010 759.9` under named hypotheses). ExplicitZetaBounds at its head:
  §4.8 (line 1730), §6.1 (line 2148), Layer 7 (line 2408), §7.6 (line 2868), §7.10 (line 2990).
- Scope-only references: TauberianBoundaryConvergence N1–N2 (main, line 21), AsymptoticExpansions
  §8.2 (open head, line 920, line shift under uniform decay), SpecialFunctionsEiLiErfIncompleteGamma
  Layer 9 (open head, line 1088, sine integrals and Gibbs), ToeplitzOperators T1 (Hardy space and
  Fejér). None appears on a `*Needs:*` line.
- Ownership by object (`roadmaps grep` on main and all 466 open heads): no other roadmap states a
  Mellin convolution, Landau's local lemma, a Hardy–Landau Cesàro theorem, Erdős 392, Ingham's
  transfer, delta spikes or smoothed cutoffs, or an `IsCompletelyMultiplicative` predicate on
  `ArithmeticFunction`. Borel–Carathéodory appears in Part I, ExplicitZetaBounds and
  ExplicitMultiplicativeFunctions only as a route through Mathlib's value form. Goldbach appears in
  SieveMethodsAndPrimePatterns (upper bounds, Chen) and CircleMethodThreePrimes (which excludes
  Helfgott's numerical verification): no overlap with the range propositions. At the pins, Mathlib's
  `CompletelyMultiplicative` section is the `ℕ →*₀ F` Euler product the README cites, Tau Ceti's
  `SmoothCutoff` is Sobolev's, and Tau Ceti has no rectangle residue theorem. `overlaps.md`: no
  pull request changes this roadmap, no cited id is dropped or revision-only.

### Adversarial table

Instances and values computed by hand and by Simpson quadrature, Euler–Maclaurin `ζ`, divisor
sieves and breadth-first search over divisors (script in the reviewer's scratch).

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 7.1 `‖𝓕f(ξ)‖ ≤ V/(2π|ξ|)` | `1_[0,1]`, `ξ = 1/2`; `ξ = 0`; `1_[0,∞)` | `|𝓕f(1/2)| = 2/π = V/(2π·½)` (sharp); at `ξ = 0` junk `V/0 = 0 < 1`; `1_[0,∞)` not integrable, limit `1` | true; hypotheses needed | none |
| 7.1 derivative form, tent | `ξ = 1/2`, `ξ = 0` | `𝓕f = (sin πξ/πξ)²`, `4/π² = V₁/(2πξ)²` with `V₁ = 4`; `1 ≤ 1 + 1/π²` | true | none |
| 7.1 `C²` form, `1/(1+t²)` | `A = 2` | `|f″| = |6t²−2|/(1+t²)³ ≤ 2/(1+t²)` (reduces to `2t⁴ − 2t² + 4 ≥ 0`); `π ≤ 2(π + 1/4π)` | true | none |
| 7.2 bounds | `x = π, 2π, −1` | `Si(π) = 1.851937`, `π/2 − Si(π) = −0.28114`, `2/π = 0.63662`; `Si(2π) = 1.418152`, diff `0.15264 ≤ 1/π`; `π/2 − I(−1) = 2.5169 > −2` | true; `x > 0` needed | none |
| 7.3 Mellin PV inversion | `f = 1_(0,1]`, `σ > 0`, `x₀ = 1`; `σ = 0` | substitution `u = −log t` gives Dirichlet–Jordan for `h(u) = e^{−σu}f(e^{−u})`, left/right swap preserves the mean; `arctan(10)/π = 0.46827 → 1/2`; at `σ = 0` `mellin f = 0`, limit `0 ≠ 1/2` | true; `MellinConvergent` needed | none |
| 7.3 windowed error | `h = e^{−σu}1_{u≥0}`, `u₀ = 0`, `(σ,T) = (1,10),(10,1),(1000,1)`; interior point of `1_[0,1]` | true error `arctan(σ/T)/π = 0.03173, 0.46827, 0.49968`; `min_δ(σδ + 2/(Tδ)) = 0.894, 8.944, 89.44`; interior error `(2/π)|Si(Tδ) − π/2| ≤ 8/(πT)`; proof constants: window `2 Si(π)/π` per side, tails `(2 sup|h| + V)/(πTδ)` with `sup|h| ≤ V` | true with an absolute `C` | none |
| 8.1 rectangle residue theorem | `f = 1/s`, `1/(s−2)`, `1/s²` on `[−1,1]²`; `exp(1/s)` | edges `iπ/2 + iπ/2 + iπ/2 + iπ/2 = 2πi`; `0`; `0` (double pole, residue `0`); essential singularity excluded (Tau Ceti residue junk `0`, integral `2πi`) | true; orientation counterclockwise | none |
| 8.1 U-shaped sign | `1/s`, `σ₁ = −1`, `σ₂ = 1`, `T = 1` | right `π/2`, left `−π/2`, bottom `iπ/2`, top `−iπ/2`; `π/2 = −π/2 + X + 2π` forces `X = −π = (top − bottom)/i` | true | none |
| 8.2 derivative Borel–Carathéodory | extremal `−2Mw/(R−w)`, `M = R = 1`, `r = 1/2`, `k = 1,2,3`; `k = 0`; `Re f(z₀) = M` | `Re f < M` since `Re 1/(R−w) > 1/(2R)`; `|f^{(k)}| = 2k!MR/(R−r)^{k+1} = 8, 32, 192` both sides; series `Σ_{n≥k} n!/(n−k)! r^{n−k}/R^n = k!R/(R−r)^{k+1}`; `k = 0` fails for `f ≡ i`; `M = Re f(z₀)` gives `0`, `f` constant | true | none |
| 8.3 Landau | `z − ρ` with `ρ` inside/just outside; `M = 0`; `(z − 3/10)e^{2z}`, `R = 1`, `r₁ = 1/4`, `r₂ = 1/2`; scaling | left side `0` resp. `≤ 1/((r₂−r₁)R)` with `M ≥ log 2`; `M = 0` forces constant; `M = log(5.172/0.3) = 2.847`, left side `2`; `CM/R` scales like `f′/f`; proof: Blaschke quotient, log on the zero-free `r₂R`-disc, 8.2 gives `C = 2r₂/(r₂−r₁)²` | true | none |
| 9.1 Mellin convolution | `1_(0,1] ⋆ 1_(0,1]`; `(f ⋆ g)(0)` vs `(g ⋆ f)(0)`; `1_[1,2] ⋆ 1_[1,2]` | `log(1/x)` on `(0,1]`, transform `1/s²`; `log 2` vs `0` at `x = 0`; support `[1,4]`, value `log 2` at `2` | true; `x > 0` needed for symmetry | none |
| 9.2 bump transforms | `(x−1)²(2−x)²` on `[1,2]`; `max(0,1−x)²` | `∫ν = 1/30 = 0.033333`; `mellin ν 0 = 4 log 2 − 11/4 = 0.0225887`; `mellin ν 1 = −mellin ν′ 2 = 1/30`; `2/(s(s+1)(s+2))` has poles, support must avoid `0` | true | none |
| 9.3 delta spike | `ε = 1`, `ε = 1/2`; `x ≤ 0` | spike `= ν`; support `[2^{−1/2}, 2^{1/2}]`; `mellin ν_ε s = mellin ν (εs)` by `y = x^{1/ε}`; `|mellin ν ε − 1| ≤ 2ε log 2` from `|y^ε − 1| ≤ ε log 2·2^ε`; value `0` at `x ≤ 0` | true | none |
| 9.4 `mellin 1̃_ε s = mellin ν(εs)/s` | non-symmetric `ν ∝ (x−½)²(2−x)²`, `ε = 1/2`, `s = 1.3+2i`; symmetric `ν` at `1` | right side `0.307724 − 0.328529i`, direct left side `0.307842 − 0.328541i` (quadrature); cutoff at `1` = `∫_1^2 ν dy/y = 0.70647` for every `ε` (`1/2` iff symmetric); Fubini on `{0 < x < z}`, integrability forced by the mass hypothesis | true | none |
| 9.4 wrong-model Check | opposite normalisation `mellin ν(s/ε)/s`, `ε = 1/2, 1/4, 1/10` | `0.4962 + 0.0989i`; moduli `0.506, 0.762, 16.37` against `|1/s| = 0.419`: grows like `2^{Re s/ε}` | **Check false** | R01 |
| 9.4 decay bound | `k = 1`, `s = 1 + iT` | `≍ 1/(T(1+εT))`: `1/T` for `T ≤ 1/ε`, `1/(εT²)` beyond; from 9.2 on the fixed strip `0 ≤ Re w ≤ σ₂`, `w = εs` | true, uniform in `ε ≤ 1` | none |
| 10.1 smoothed sum | `a = δ₁`; `a ≡ 1`, `X = 2`, symmetric `ν`, `ε ≤ log₂(3/2)`; `k = 0` | both sides `1̃_ε(1/X)`; sharp `2`, smoothed `1 + 1/2 + 0 = 3/2`, difference `1/2` while `2Cε → 0`, so `+1` needed; `k = 0` gives `O(1/|s|)` only, not integrable | true | none |
| 10.2 Ingham exponent | `η = c₀/log t`, `c₀ = 1`, `log x = 100`; `η ≡ 1/4`; `η(x) log x` wrong model | `2√(c₀ log x) = 20` at `log t = 10`; `25 + log 3 = 26.0986`; wrong model gives the constant `c₀`, no decay | true | none |
| 10.2 transfer theorem | `a = Λ`, `μ`, `1`; steep width `η` (`1/2` on `[3,T₀]`, linear drop, `1/log² t`) | pole `1` inside `[1−η(T+3), σ₀] × [−T,T] ⊆ R_η` (antitone), `s = 0` outside (`1 − η ≥ 1/2`); left edge `x^{1−η(T+3)} = x/T` with `log T ≥ (ω − log 2)/2`; tails `x log² x · T^{−1/2}` at `ε = T^{−1/2}`; `log^N x ≤ C exp((c₁/8)(log x)^{1/(1+A)})`; steep width: `ω ≥ log T₀`, choice by `η(T)` saves only `exp(−2 log T₀/log²(T₀+3)) → 1`, by `η(T+3)` saves `1/T` with `T > T₀ − 3`; hypotheses hold with `a₀ = 1/2`, `A = 2`, `T₀ ≥ 6` | true; `c` absolute | none |
| 10.3 `L′/L` bound | `K = ℚ`, `χ = 1`; trivial character mod `2`; `δ_χ` | `R_c ⊆` Part I's region since `log(|t|+3) > log(|t|+2)`, bound `C log(|t|+2) ≤ C log(|t|+3)`; `L = (1 − 2^{−s})ζ`, `G` shifts by `−(log 2)2^{−s}/(1 − 2^{−s})`, bounded on `Re s ≥ 1/2`, zeros on `Re s = 0` outside `R_c`, residue of `L` becomes `1/2` but `δ_χ = 1`; `−ζ′/ζ` has residue `+1`; `|L(2+it)| ≥ ζ_K(4)/ζ_K(2)` from `|1 − wN𝔭^{−s}|⁻¹ ≥ (1 − N𝔭^{−2})/(1 − N𝔭^{−4})`; exceptional zero avoided by shrinking `c` at fixed `χ` | true | none |
| 11.1 complete multiplicativity | `λ`, `μ`, zero function, `≡1 mod 4` indicator, `2^Ω`, `2^ω` | `λ(4) = 1 = λ(2)²`, `λ(12) = −1`; `μ(4) = 0 ≠ 1`; `Σ_{d|4} λ(d)μ²(4/d) = 0 − 1 + 1 = 0`; `f(65) = 1 = f(5)f(13)`, `f(15) = 0`; `2^{Ω(4)} = 4 = 2²`, `2^{ω(4)} = 2 ≠ 4` | true | none |
| 11.2 `σ_ν` series and abscissa | `ν = 1`, `−1`, `1/2`, `2`, `−2`, `it`; `s = 3` | `σ_1(6) = 12`, `σ_{−1}(6) = 2`, `σ_{1/2}(4) = 3 + √2 = 4.41421`; abscissas `3`, `1`; `ζ(3)ζ(2) = 1.977304`; divergence at the abscissa from primes: `|1 + p^ν| ≥ p^{Re ν} − 1`, `≥ 1 − 2^{Re ν}`, `≥ 1 + cos(t log p)` (since `2 ≥ 1 + cos θ`) with `Σ_p cos(t log p)p^{−σ}` bounded by `ζ(1+it) ≠ 0` | true for every `ν` | none |
| 11.2 `d_z` | `z = 1/2` at `p²`; `z = 2, 3`; `z = k`; `z = i`, `s = 3`; `z = 0` | `multichoose(1/2, 2) = 3/8`, `3/8 + 1/4 + 3/8 = 1`; `Σ d_{1/2}(n)n^{−2}` to `2·10⁵` `= 1.282549 = √ζ(2)`; `a + 1`, `d_3(4) = 6`; `Σ τ(n)n^{−2}` to `2·10⁵` `= 2.705736`, `ζ(2)² = 2.705808`; `exp(i log ζ(3)) = 0.98311 + 0.18300i`; `|multichoose(z,a)| ≤ multichoose(|z|,a)` gives the majorant; `d_0 = δ₁`, abscissa `⊥`, so `z ≠ 0` needed | true | none |
| 11.3 Ramanujan | `α = β = 0`; `τ(n²)`; `α = 0.3+i`, `β = −0.2+0.5i`, `s = 2.6+i`; `α = 2`, `β = 0`, `s = 3` | `(1+X)/(1−X)³` coefficients `(k+1)²`, `10 − 1 = 9` at `p²`; `Σ τ(n²)n^{−3}` to `2·10⁵` `= 1.7072914 = ζ(3)³/ζ(6)`; right side `2.485612 − 0.364635i`, left partial sum (`N = 60000`) `2.485611 − 0.364634i`; `Re(2s−α−β) > 2` from the two shift hypotheses; boundary case `Σ_p 2(p²+1)/p³ = ∞` | true | none |
| 11.4 series and abscissas | `s = 3`, `s = 4`; `n = 12` | `ζ(3)²/ζ(6) = 1.420308`, `ζ(3)/ζ(6) = 1.181565`, `ζ(6)/ζ(3) = 0.846335`, `ζ(3)/ζ(4) = 1.110627`; local factors `(1+X)/(1−X)`, `1+X`, `1/(1+X)`, `(1−X)/(1−pX)`; `μ²(12) = μ(1)+μ(2) = 0`; `φ` abscissa `2` since `Σ_p (p−1)/p² = ∞` | true | none |
| 12.1 Hardy–Landau | `(−1)^n`; `a_n = 1`; `(−1)^n/√n`; `n = 0`; shift of `a_0` | means `→ 1/2`, `S_N` alternates, `n a_n` unbounded below; means diverge; `n a_n = (−1)^n√n` unbounded; `0 ≥ −K`; `S_N` shifts by `d`, means by `d(N−1)/N`; proof: `(Hσ_H − Nσ_N)/(H−N) = σ_H + N(σ_H−σ_N)/(H−N)` and `S_k − S_N ≥ −K(k−N)/N`; two-sided version needs no completeness | true | none |
| 13.1 factorial factor count | `(B,n) = (16,4), (4,4)`; `n = 5…10` with `B = n` and `B = n²`; `n = 0, 1` | `2`, `3`; counts `4,4,5,6,7,7` and `2,2,3,3,3,4` by exhaustive search; lower bounds `2.9746, 3.6720, 4.3811, 5.0997, 5.8264, 6.5598`; `log 24/(2 log 4) = 1.146`; empty product gives `0`; asymptotics: lower bound `log n!/log B` with Stirling, upper bound blueprint Thms 8.1.1–8.1.2 | true | none |
| 13.2 Goldbach ranges and transfer | even `4..30`, odd `7..56`, odd `7..9`; `H < 4`; Bertrand `Δ = 2`, `x₀ = 5`; Schoenfeld `Δ = 16598`, `x₀ = 2 010 882` | all verified by search; `(H−4)Δ + 4 < 7` vacuous; proof: `p > x(1−1/Δ) ≥ 2` odd, `4 ≤ n − p < 4 + (n−4)/Δ ≤ H`; `x₀(1−1/Δ) = 2 010 760.85 > 2 010 759.9`, `y(1 + 1/16597) = x`, result `6.6392·10²²` | true | none |
| Conventions witnesses | `𝓕1_[0,1](1/2)`; `mellin 1_(0,1] 2`; `(1_(0,1] ⋆ 1_(0,1])(e^{−1})`; `d_{−1}` | `(1 − e^{−πi})/(πi) = −2i/π`; `1/2`; `1`; `multichoose(−1, a) = 0` for `a ≥ 2`, `−1` at `a = 1`, so `μ` | true | none |

### Shape

Headings in TauCetiRoadmap form; every definition (mellinConv, deltaSpike, smoothCutoff,
inghamExponent, IsCompletelyMultiplicative, sigmaC, generalizedDivisor, factorialFactorCount,
EvenGoldbachUpTo, OddGoldbachUpTo) has an API list and at least three discriminating Checks (3, 3,
4, 7, 6, 10, 4, 4); every theorem carries its hypotheses and a locator; every layer ends with
Examples and Dependencies; every Lean name appears in the README and every backticked own name in
the README is declared in `Suggested.lean` (the two README-only definitions are in italics); every
cited work is in `sources.toml` (14 entries, 7 certified and read, 7 settled uncertified).

## Not verifiable

- `montgomeryvaughan2007` (Chapter 5 §5.1, Chapter 6 §6.1), `titchmarsh1986` (Chapters I, III),
  `iwanieckowalski2004` ((1.25)–(1.35), Chapter 5), `tenenbaum2015` (II.4–II.5), `apostol1976`
  (Chapters 2, 11), `hardy1949` (Tauberian theorems for Cesàro means), `katznelson2004`
  (Chapter I): settled uncertified, paywalled or not legally readable here; cited by locator only.
  For 7.3, 8.2, 8.3, 10.3 and 12.1, where these are the primary statements, the statements were
  checked mathematically (table above) and against the certified blueprint and Estrada–Vindas
  instead.

## Source issues

- **Misprint** in kontorovichtao-pntplus at Lemma 3.1.3, printed page 7: the statement ends with
  "where C is an absolute constant" although no C occurs in it; it should be deleted; affects
  nothing.
- **Misprint** in kontorovichtao-pntplus at Lemma 4.3.4 (proof), printed page 25: the proof cites
  Lemma 4.3.1 for `ℳ(ν_ε)(1) = ℳ(ν)(ε)`; it should be Corollary 4.3.1; affects nothing.
- **Misprint** in kontorovichtao-pntplus at Lemma 4.3.10 (proof), printed page 29: the proof cites
  "the bound in Lemma 4.3.2" (the symmetry lemma); it should be Theorem 4.3.2; affects nothing.
- **Gap** in kontorovichtao-pntplus at Theorem 9.1.68, printed page 89: the Liouville series is
  equated to `ζ(2s)/ζ(s)` with no half-plane stated; it should carry `Re s > 1`; affects a stated
  result (the roadmap adds the hypothesis).
