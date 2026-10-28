# Review of RandomMatrices (pull request #397 at f71e828)

**Verdict:** accepted

Gate at this head: every check passes on the worker's run and on mine (`depcheck: 155 roadmaps, 1063 edges, 0 problem(s)`, no UPWARD or CYCLE line; `outside-folder=0`, and `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/RandomMatrices'` is empty). `Suggested.lean` elaborates with `sorry` as its only warning (eleven, one per headline). No P1 or P2 finding; the seven findings below are locator, generality, Check and provenance notes the author may take or leave.

## Previous review (ebac9fc), finding by finding

- R01 (acceptance test): repaired. The docstring now has the "target signatures" form, lists the eleven stated headlines by layer and names the unstatable ones with the missing carrier (lines 19–31). All eight headlines R01 listed as statable and absent are stated: `marchenkoPastur_ae`, `wigner_extreme_eigenvalues_ae`, `sampleCovariance_extreme_eigenvalues_ae`, `circular_law_ae`, `gaussianEnsemble_eigenvalue_density`, `hanson_wright`, `matrix_bernstein`, `least_singular_value`, `gaussianEnsemble_spike_ae`.
- R02 (Hoffman–Wielandt, dilation): repaired. README lines 74–79 and 319–326 take PA-B40, SSP-D06, SSP-D13, SSP-D14 as suppliers; `hoffmanWielandt` is gone from the Lean file.
- R03 (semicircle owner): repaired. README lines 41–47 and 514–516 define `semicircleReal a v` as the affine image of StandardDistributions target 10.20; `Suggested.lean` line 93 is that pushforward; no "Stanford" sentence remains.
- R04 (Laguerre/Jacobi): repaired. README lines 52–55, 171–172 and 972–976 cite LaguerreJacobi Parts A–D, A3, C4, B3, D3, `laguerreMeasure`, `jacobiMeasure`; only the kernels and asymptotics stay here.
- R05 (padding): repaired. `spectralMeasure` is the measure underlying `empiricalMeasureOfFintype` with `[NeZero n]`; `empiricalMeasure`, `stieltjes_eq_integral`, `frobeniusNorm`, the `hn` binders and the sorried `wignerMatrix_isHermitian` are gone (the last is proved).
- R06 (process narrative): partly repaired. The README is clean (no "proposed for Mathlib", "Stanford", "coordinate", dates or pull-request numbers). `SOURCES.md`, linked from README line 1351, still carries the dated audit and pull-request citations: see R01 below.
- R07 (generality): repaired. README lines 1112–1114 state AGZ (2.6.2) in this normalization with the `c log(1+|x|)` Check; lines 840–845 state asymptotic freeness for Wigner families with uniformly bounded moments (AGZ Theorems 5.4.2 and 5.4.5), GUE/GOE as cases.
- R08 (shape): repaired. Every layer has `**Checks.**` lists, `*Needs:*` lines, `### Examples` and `### Dependencies`; `## Exact supplier contracts` and `## Downstream consumers` exist.

## R01 (P3) — `SOURCES.md` keeps the dated audit and pull-request citations of the previous R06

Location: `TauCetiRoadmap/RandomMatrices/SOURCES.md` lines 5–6 ("checked on **2026-09-15** … not rebuilt or certified by this audit"), line 151 (the stochastic-calculus roadmap cited by its pull-request link), lines 154–179 (a table of Mathlib pull requests by number).

Claim: the README links this file as "Provenance and acknowledgments", so it is roadmap text; it is not timeless and cites a roadmap by pull-request number.

Witness: the previous review's R06 repair ("move `SOURCES.md` to a short provenance section with no dates and cite StochasticCalculus by name only"); the house rule that cross-roadmap citations never use pull-request numbers.

Repair: delete lines 5–6 and the dates; at line 151 write "StochasticCalculus (S1, S3–S5, S9)"; replace the Mathlib pull-request table by one sentence saying what the pinned Mathlib has (`resolventTransform`, `HasSubgaussianMGF`, decreasing `eigenvalues₀`, the CLT and Prokhorov) and drop the open-pull-request rows, which a reader a year from now cannot resolve.

## R02 (P3) — two headlines carry hypotheses their cited sources do not need

Location: `Suggested.lean` lines 147–157 (`wigner_semicircle_ae`, binders `hmean`, `hdiag`) and README lines 618–621 ("mean zero … independent i.i.d. real diagonal of finite second moment … (T Theorem 2.4.2; Bai 1999, Theorem 2.1)"); `Suggested.lean` lines 324–336 (`least_singular_value`, "i.i.d. real entries of variance one") and README lines 1259–1262.

Claim: Bai's Theorem 2.1 (Bai1999 lines 121–129) assumes i.i.d. off-diagonal entries of variance σ² and i.i.d. real diagonal entries "without any moment requirement", with no centring; a nonzero off-diagonal mean is a rank-one plus an `o(n)`-rank perturbation and a diagonal of any law is handled by truncation at `ε√n`, so the almost-sure law holds without `hmean` and `hdiag`. Rudelson–Vershynin's Theorem 1.2 (RV2008 lines 117–124) takes rows that are i.i.d. copies of a vector of independent centred entries with variances at least 1, not identically distributed entries of variance exactly 1.

Witness: Bai1999 line 126 ("without any moment requirement"); RV2008 line 118 ("variances at least 1").

Repair: either drop `hmean` and `hdiag` (and the two README phrases) and keep both locators, or keep Tao's form and cite Tao Theorem 2.4.2 alone for it (Tao lines 5536–5542 assume mean zero and bounded diagonal mean and variance). For `least_singular_value`, replace `∫ x, x ^ 2 ∂ν = 1` by `1 ≤ ∫ x, x ^ 2 ∂ν` (the proof is unchanged, since the bound is monotone in the variance), or say in the README that the i.i.d. unit-variance form is the special case stated. On the instance `ξ` standard Gaussian both forms give `P(s_N ≤ ε/√N) ≤ Cε + c^N` with the same constants.

## R03 (P3) — the triangular-array semicircle law cites a theorem that proves only the i.i.d. case

Location: README lines 615–618 ("Prove the semicircle law in probability under triangular-array hypotheses: … `n⁻² ∑ᵢⱼ E[|Wᵢⱼ|² 1_{|Wᵢⱼ|>ε√n}] → 0` … (AGZ Theorem 2.1.21)").

Claim: AGZ Theorem 2.1.21 (AGZ line 1169) is Wigner's theorem for an i.i.d. Wigner matrix with `r₂ < ∞`; the Lindeberg-type condition stated here is Bai's Theorem 2.4 (Bai1999 lines 334–342: `E w = 0`, `E|w|² = σ²`, `δ⁻²n⁻² ∑ E|w|² 1(|w| ≥ δ√n) → 0`).

Witness: AGZ lines 1169–1170; Bai1999 line 334.

Repair: cite "(Bai 1999, Theorem 2.4; AGZ Theorem 2.1.21 for the i.i.d. case)". Bai's condition ranges over all `j, k`, so the separate diagonal condition `n⁻² ∑ᵢ E|Wᵢᵢ|² → 0` of line 616 is implied by it and can be dropped or kept as a remark.

## R04 (P3) — theorem targets with no claim-level locator, and one constant convention left open

Location and claim: the following theorem targets carry only the layer's `**Sources:**` line, so the reader cannot find the statement checked here:

- 6.4 (lines 831–836): the free CLT and the free Poisson limit. The source is AGZ Lemma 5.3.32 (AGZ line 17752), which needs only freeness, a tracial state, uniformly bounded moments and `φ(aᵢ) = 0`, `φ(aᵢ²) = 1`, not identical distribution; the free Poisson limit is the exercise at AGZ line 17611. State 6.4 at the lemma's generality (bounded moments, each variance 1), with the i.i.d. case as a Check; FreeProbability F6 on main plans the further extension with `N⁻¹ ∑ φ(aⱼ²) → σ²` and consumes "scalar limit theorems" from this layer, so one statement here avoids two owners.
- 8.4 (lines 1031–1039): sine and Airy limits and `F₂`: AGZ Theorem 3.1.1 (line 4549), Theorem 3.1.4 (line 4624), Theorem 3.1.5 (line 4684).
- 9.5 (lines 1152–1155): AGZ Theorem 2.6.6 (line 4131), with the corrected rate (see Source issues).
- 10.3 (lines 1217–1222): AGZ Lemma 4.3.3 (line 12588) and Proposition 4.3.5 (line 12592).
- 10.4 (lines 1232–1238): AGZ Proposition 4.3.10 (line 13196).
- 2.1 (lines 371–377): Bernstein's inequality is not in Tao's book (no occurrence of "Bernstein" in the text); cite a standard text (for example Boucheron–Lugosi–Massart, Theorem 2.10) for `2 exp(−t²/(2(v+bt/3)))`.
- 2.4 (lines 433–438): the rectangular norm and singular-value bounds are Vershynin's Theorems 4.4.5 and 4.6.1 (High-Dimensional Probability), which is not in the References; and the first bound writes `CK(√p+√n+t)` while the row bound writes `CK²(√n+t)` with `K²` the variance proxy: say in the first sentence that `K` there is the square root of the proxy (the `ψ₂` parameter), as 2.3 does for Hanson–Wright.
- 5.4 (lines 727–731): the HCIZ formula has no locator (it is not in AGZ); cite Harish-Chandra 1957 or Itzykson–Zuber 1980, or the PB section meant.
- 7.1–7.2 (lines 866–871, 881–889): the Pastur and Silverstein–Bai equations have no locator beyond "PB chs. 10, 14, 15, 17".

Witness: the lines quoted; AGZ lines 17752–17760 for the free CLT hypotheses.

Repair: add the locators in parentheses at each claim, and restate 6.4 as above.

## R05 (P3) — the Exchangeability link is broken and the citation names no target

Location: README line 62 ("[Exchangeability](../Exchangeability/README.md) owns exchangeability and conditional-i.i.d. representation theory") and line 174 ("Exchangeability: the joint-law transport interface").

Claim: the roadmap is under `Completed/Exchangeability/README.md` on main (`TauCetiRoadmap/Exchangeability/` does not exist), so the relative link resolves to nothing; and "the joint-law transport interface" names no section or declaration of that roadmap, while 0.2's `*Needs:*` line (line 250) lists only Mathlib.

Witness: `Completed/Exchangeability/README.md` lines 130–132 (`ConditionallyIIDWith`, the joint-law disintegration) is the nearest thing it provides.

Repair: link `../../Completed/Exchangeability/README.md` as line 48 does for OrthogonalL2Bases, and either name the declaration consumed (`ConditionallyIIDWith` or its measure-preserving-map lemmas) in 0.2's `*Needs:*` line or drop the supplier.

## R06 (P3) — four definitions have fewer than three Checks

Location: README 8.1 (lines 964–967: the eigenvalue point process, two Checks), 8.4 (lines 1041–1044: the Airy function and `F₂`, two Checks), 8.5 (lines 1057–1061: Pfaffians, two Checks), 9.4 (lines 1144–1148: logarithmic capacity, two Checks).

Claim: the house shape asks for at least three discriminating Checks per definition.

Repair, one Check each that a wrong definition fails: 8.1, the point process of `diag(1,1)` is `2δ₁` (mass 2) while `L_A = δ₁`, so a definition dividing by `n` would give mass 1; 8.4, `Ai(x) ~ e^{−(2/3)x^{3/2}}/(2√π x^{1/4})` as `x → ∞`, which `Bi` fails, and `F₂(s) → 0` as `s → −∞`; 8.5, `Pf(BABᵀ) = det(B) Pf(A)`, which a definition without the sign of the pairing fails; 9.4, `cap(cE) = c·cap(E)` for `c > 0` and a finite set has capacity `0`.

## R07 (P3) — the covariance spike of 7.3 is statable and neither stated nor named in the docstring

Location: README lines 905–909 ("For Gaussian sample covariance with `0 < y < 1` and `T_p = diag(ℓ,1,…,1)`, `ℓ > 1`, prove the upper spike theorem"); `Suggested.lean` lines 11–31 (the docstring names only the rank-one Wigner spike under "spiked").

Claim: the statement needs only `gaussianReal`, `Measure.pi`, `Matrix.diagonal`, `sampleCovariance` and `eigenvalues`, all at the pins, so it is statable: for `X : Ω → Fin (p n) × Fin n → ℝ` with law `Measure.pi (fun _ ↦ gaussianReal 0 1)`, `T = diagonal (Fin.cons ℓ 1)`, the largest eigenvalue of `sampleCovariance (T^{1/2} X)` tends almost surely to `if 1 + √y < ℓ then ℓ (1 + y/(ℓ−1)) else (1+√y)²`.

Witness: the README's own statement; at `ℓ = 1+√y` both branches give `(1+√y)²` (computed in the table below).

Repair: state it after `gaussianEnsemble_spike_ae`, or add it to the docstring's list with its reason if the author prefers not to; the headline named in the Summary ("the spiked-model phase transition") is stated in its Wigner form, which is why this is not blocking.

## Verified sound

Gate: all checks pass at f71e828 on the worker's run and on mine; depcheck output `depcheck: 155 roadmaps, 1063 edges, 0 problem(s)`, no UPWARD, CYCLE or `moved:` line. RandomMatrices is at line 279 of the merge order, OperatorTheory at 251; the other suppliers are on main (StandardDistributions, OptimalTransport, SuccessiveMinima, RepresentationTheory/CompactGroups, OperatorTheory), Completed (OrthogonalL2Bases, Exchangeability) or new-folder open pull requests by other authors (LaguerreJacobi #117 by weiscadence, PointProcesses #417 by mccorvie, StochasticCalculus #1030). FreeProbability on main consumes this roadmap (its lines 102–125 name RandomMatrices' prerequisite and Milestones 1, 3, 5, 6 as suppliers) and TemperleyLieb (open, #58) records at its lines 267–275 that the noncrossing-partition carrier is owned here and realized as FreeProbability §F2 specifies: the direction is consistent and there is no second owner. Ownership of Wigner, Marchenko–Pastur, circular-law, Bai–Yin, Hanson–Wright, matrix-Bernstein, Tracy–Widom, Dyson, Weingarten and log-Sobolev material was checked by object over main and the 376 open heads (`roadmaps grep`): no other roadmap states them; `Mathlib/Analysis/Matrix/Spectrum.lean` and the pinned Tau Ceti have no semicircle, Marchenko–Pastur or Wigner object (Tau Ceti's `Geodesic/Semicircle.lean` is hyperbolic geometry).

Build and signatures: `lake env lean` on `Suggested.lean` exits 0 with eleven `sorry` warnings and nothing else. A scratch file with `#check @name` for all 24 declarations elaborated; each type agrees with its README statement; no section variable is dropped (every `Ω`, `MeasurableSpace Ω`, `IsProbabilityMeasure` binder the statements need is in the printed types). The one-tactic probe (`simp` in place of every `sorry`) fails on all eleven headlines, so none is padding; the four proved helper theorems (`wignerMatrix_isHermitian`, `sampleCovariance_isHermitian`, `gaussianEnsemble_isHermitian`, `isHermitian_smul_vecMulVec_star`) are the witnesses the headline statements take as arguments. Degenerate cases elaborated: `marchenkoPastur 0 = dirac 1` closes by `simp`; `gaussianEnsemble 1 1 g 0 0 = √2·g(0,0)` and `gaussianEnsemble 2 1 g 0 0 = g(0,0)` close by `simp`; `sampleCovariance` of a `3 × 0` matrix is `0`; `β * n * (n - 1) / 4` in the density exponent elaborates as real subtraction (`ring` closes it); `semicircleReal a 0 = dirac a` reduces to `(betaMeasure (3/2) (3/2)) univ • dirac a = dirac a`, which the probability instance at `Mathlib/Probability/Distributions/Beta.lean` line 136 discharges.

Library declarations opened at the pin (file and line): `resolventTransform` (`Mathlib/MeasureTheory/Measure/ResolventTransform.lean` 108) with `resolvent a r = (↑r − a)⁻¹` (`Mathlib/Algebra/Algebra/Spectrum/Basic.lean` 80), so `m_μ(z) = ∫ (x−z)⁻¹ dμ` as Convention 4 says; `HasSubgaussianMGF` (`Mathlib/Probability/Moments/SubGaussian.lean` 603: integrability of `exp(tX)` for all `t` and `mgf ≤ exp(c t²/2)`, mean zero implied) and Hoeffding's lemma (lines 76, 818); `eigenvalues₀` and `eigenvalues₀_antitone` (`Mathlib/Analysis/Matrix/Spectrum.lean` 59, 62); `singularValues`, `singularValues_antitone` (`Mathlib/Analysis/InnerProductSpace/SingularValues.lean` 94, 141); `toEuclideanCLM` and the `Matrix.Norms.L2Operator` scope (`Mathlib/Analysis/CStarAlgebra/Matrix.lean` 101, 183); the matrix `MeasurableSpace`, `Matrix.measurable_iff` and `BorelSpace` instances (`Mathlib/Analysis/Matrix/MeasurableSpace.lean` 26, 37, 56); `exists_hasLaw_indepFun`, `exists_iid` (`Mathlib/Probability/HasLawExists.lean` 31, 45); `HasLaw` (`Mathlib/Probability/HasLaw.lean` 39); `iIndepFun` (`Mathlib/Probability/Independence/Basic.lean` 135); `IdentDistrib` (`Mathlib/Probability/IdentDistrib.lean` 70); `gaussianReal` (`Mathlib/Probability/Distributions/Gaussian/Real.lean` 220); `betaMeasure` (`Mathlib/Probability/Distributions/Beta.lean` 132); `cond` (`Mathlib/Probability/ConditionalProbability.lean` 75); `Complex.volume_ball` (`Mathlib/MeasureTheory/Measure/Lebesgue/VolumeOfBalls.lean` 420: `ofReal r ^ 2 * π`, so the unit disc has area `π`); `TendstoInDistribution` (`Mathlib/MeasureTheory/Function/ConvergenceInDistribution.lean` 64: the limit is given as a random variable `Z` on `(Ω', μ')`, so `id` on `(ℝ, gaussianReal 0 σ²)` in the linear-statistics CLT is the intended law); `posSemidef_vecMulVec_star_self` (`Mathlib/LinearAlgebra/Matrix/PosDef.lean` 448); the files `IdentDistribIndep.lean`, `MGFAnalytic.lean`, `Prokhorov.lean`, `CentralLimitTheorem.lean`, `BrownianMotion/Basic.lean` exist. Tau Ceti: `empiricalMeasureOfFintype` and its API (`TauCeti/Probability/Process/EmpiricalMeasure.lean` 54–121), `TauCeti/Probability/Moments/*` (9 files) and `TauCeti/Analysis/SpecialFunctions/Hermite/*`, `TauCeti.Probability.wishartGramMeasure` (`TauCeti/Probability/Distributions/Wishart/Basic.lean` 171), to which StandardDistributions' `wishartGramMeasure` is an abbreviation. Tau Ceti also has the Herglotz and Nevanlinna representation theorems (`TauCeti/Analysis/Complex/Herglotz.lean` 263, `Pick/Boundary.lean` 322, existence only); 3.1's uniqueness and inversion are not there, so no duplication, but 3.2's normal-family step may cite them.

Cross-roadmap citations resolved: StandardDistributions target 10.20 (lines 1989–2010: `(betaMeasure (3/2) (3/2)).map (2*·-1)`, location-scale by Layer 7), Layer 7 (line 969), target 12.1 (lines 2143–2151: `cond volume (ball c r)`), Layers 0, 3–6 (lines 169, 361, 491, 547, 759), `wishartGramMeasure` (line 886); OrthogonalL2Bases Parts A–B (Completed, lines 147, 245) and its lines 145 and 387 deferring Laguerre/Jacobi; LaguerreJacobi at #117: A3 (line 259), B3 (294–299, norm `Γ(n+α+1)/n!`), C4 (400), D3 (418–423), `laguerreMeasure` (280), `jacobiMeasure` (408), base ring a `ℚ`-algebra (88–91); RepresentationTheory/CompactGroups Layer 0 (line 205) and `weyl_integration_formula` (420); OptimalTransport Layers 0–3 (lines 346–504); PointProcesses at #417: Layers 0–6 (lines 554–1276), `LocallyFiniteMeasure S`, `PointMeasure S` (160–161), determinantal processes outside its scope (94–97); OperatorTheory PD-A51–PD-A53 (PolarDecomposition lines 254–260), PA-B40 (PrincipalAngles line 295: `∑ᵢ (λᵢ(T)−λᵢ(S))² ≤ ∑ₖ ‖(S−T)eₖ‖²` for decreasing lists and any orthonormal basis), SSP-D06, D13, D14 (SpectralSubspacePerturbation lines 428, 444, 447), OI-B01, B19, B23, B29, B30 and Part C (OperatorIdeals lines 300, 332, 352, 349, 350, 530); SuccessiveMinima 0.1.2 `hermitian_gram_hadamard` (line 188: `0 ≤ Re det Gram(v) ≤ ∏ ‖vᵢ‖²`, no independence assumption, `n` may be zero); StochasticCalculus at #1030: S1.2 (828), S1.3 (868), S3.2–S3.4 (1239, 1297, 1309), S4.1–S4.3 (1391, 1447, 1491), S5.1 (1534), S5.5 (1584), S9.1–S9.2 (2240, 2292), `IsFilteredBrownian`, `timeMeasure`, `IsStrongSolution` (its `Suggested.lean` 315, 332, 647); FreeProbability on main lines 102–125 (consumer); Exchangeability: see R05. Counts: 10 roadmaps on main or Completed, 3 at open heads, 1 downstream.

Sources checked at their locators (10 texts read; Potters–Bouchaud and Johansson 1998 not readable, below): Tao §1.1 extension (lines 180–206: measure-preserving projection, independence of the new coordinate) for 0.1–0.3; Tao §1.3 Weyl `λ_{i+j−1}(A+B) ≤ λᵢ(A)+λⱼ(B)` (line 1749) and AGZ Lemma 2.1.19 (line 1123) for 1.2–1.3; Tao lines 713–731 (sub-exponential tails, Cauchy heavy-tailed) for 2.1; Tao Exercise 2.2.15 (line 3571, Lindeberg) for 2.5; AGZ Theorem 2.1.1 (462), Lemma 2.1.19, Theorem 2.1.21 (1169), Theorem 2.4.4 (2251), Lemma 2.3.3 (2030: `2e^{−δ²/(2c|G|²_L)}`), Theorem 2.3.5 (2139: exponent `N²δ²/(4c|f|²_L)`), Theorem 2.1.31 (1540), Theorem 2.5.2 and (2.5.4) (2588–2614), (2.6.1)–(2.6.10), Theorem 2.6.1 and Lemma 2.6.2 with the capacity definition (3530–3641), Theorem 2.6.6 (4131), Theorems 3.1.1, 3.1.4, 3.1.5, 3.1.6, 3.1.7 (4549, 4624, 4684, 4722, 4731), Lemma 3.2.2 (4796), Lemma 4.2.13 (11127), Theorem 4.3.2 (12556: `√2/√(βN) dWᵢ + N⁻¹∑(λᵢ−λⱼ)⁻¹dt`), Lemma 4.3.3 and Proposition 4.3.5 (12588, 12592: every `β ≥ 1`), Proposition 4.3.10 (13196), Theorem 4.3.20 (13749), Theorem 4.5.35 (15054), Lemma 5.3.32 (17752), the free Poisson exercise (17611), Theorems 5.4.2 and 5.4.5 (17996, 18154); Tao's Wigner ensemble (5536–5542), Theorem 2.3.24 (5411), Theorem 2.4.2 (5615), Theorem 2.7.5 and Remark 2.7.6 (9025, 9096), Theorem 2.8.1 (9278); Bai1999 Theorems 2.1, 2.4, 2.5, 2.12, 2.15, 2.16 (128, 334, 452, 992, 1214, 1221; the Marchenko–Pastur density `√((b−x)(x−a))/(2πxyσ²)` with atom `1−1/y` for `y > 1`); RV2013 Theorem 1.1 (47: exponent `min(t²/(K⁴‖A‖²_HS), t/(K²‖A‖))` with `K` the `ψ₂` norm, which is the README's form with `K` the variance proxy); Tropp Theorem 1.4 (273: `d·exp(−(t²/2)/(σ²+Rt/3))` one-sided, hence `2d` for `±Xₖ`); BGN Theorem 2.1 (187, almost sure) and §3.1 (471–494: `G⁻¹(1/θ) = θ + σ²/θ`); RV2008 Theorem 1.2 (117); TV2008 Theorems 2.1 and 3.2 (238, 448); TVK Theorem 1.13 (339: in probability and almost surely, mean 0 variance 1) and Theorem 2.1 (603); Soshnikov Lemmas 1–2 and (1.14) (264, 314, 262). All sampled targets (0.1, 0.2, 0.3, 1.3, 2.1, 2.5, 3.3, 4.4, 5.2, 6.4, 7.1, 8.2, 9.4, 10.3, 11.3) are supported as written, with the locator notes of R02–R04.

Adversarial table (values computed on each side):

| Statement | Instances | Values | Result | Change |
| --- | --- | --- | --- | --- |
| Conv. 4 resolvent sign | `A = diag(1,−1)`, `z = i` | `m = ½(1/(1−i) + 1/(−1−i)) = ½((1+i)/2 + (−1+i)/2) = i/2`, `Im > 0`; `(z−A)⁻¹` gives `−i/2` | agrees with Mathlib's `resolvent` | none |
| 3.1 remainder bound | `r=1`, `μ=δ₁`, `z=i` | `R₁ = m + 1/z = (1+i)/2 − i = (1−i)/2`, `|R₁| = 1/√2 ≤ ∫|x|/(|z| Im z) = 1` | true | none |
| 3.1 two-point transform | `μ=(δ₋₁+δ₁)/2` | `½(1/(−1−z)+1/(1−z)) = z/(1−z²)` | matches Check | none |
| `semicircleReal` density | Beta(3/2,3/2), `y=2x−1`, then `x = a+2√v y` | `B(3/2,3/2) = π/8`; density in `y`: `(2/π)√(1−y²)`; in `x`: `√(4v−(x−a)²)/(2πv)` | matches lines 518, 91 | none |
| semicircle mass, moments | `v=1`; `k=2` | half-disc area `2π`, times `(2π)⁻¹` = 1; `m₄ = C₂ = 2` | true | none |
| semicircle transform root | `z=i` | `m² + im + 1 = 0`: `m = i(√5−1)/2` (`Im>0`) or `−i(√5+1)/2` | branch fixed | none |
| `marchenkoPastur` | `y=0`; `y=1`; `y=2`; `x ∉ [a,b]` | `dirac 1` (Lean `simp`); `(2π)⁻¹∫₀⁴√((4−x)/x)dx = (2π)⁻¹·2π = 1`; atom `1−½ = ½`; `√(negative) = 0` so density `0` | probability measure, support right | none |
| MP transform equation | `y=1`, `z=2`; `y=0` | `2m²+2m+1=0 ⇒ m = −½ ± i/2`; `(z−1)m+1 = 0 ⇒ m = 1/(1−z) = m_{δ₁}` | consistent | none |
| MP moments vs the noncrossing sum `∑ y^{k−|π|}` | `k=1,2` | `1`; `1+y` (two blocks, one block) | matches line 550 | none |
| quarter-circle law | mass; second moment; square | `π⁻¹·π = 1`; `(16/π)∫₀^{π/2}sin²cos² = 1`; density of `s²`: `√((4−x)/x)/(2π) = MP₁` | true | none |
| `circularLaw` | mass; `∫|z|^{2k}` | `volume(ball 0 1) = π` (pin, line 420), `cond` normalises; `2∫₀¹r^{2k+1}dr = 1/(k+1)` | true | none |
| `wignerMatrix` | `n=2`; `n=0` | `2^{−1/2}[[η₀,ξ₀₁],[ξ̄₀₁,η₁]]` Hermitian (proved); `(√0)⁻¹ = 0` on the empty matrix | fine | none |
| `E trₙ H²` (4.1) | `E|ξ|²=1`, `Eη²=σ²` | `(nσ² + n(n−1))/n² → 1`; with `Wₙ/n`: `→ 0` | matches | none |
| `wigner_semicircle_ae` hypotheses | Bai Thm 2.1 vs Lean | Bai: no centring, no diagonal moment; Lean adds `hmean`, `hdiag` | true but narrower | R02 |
| `wigner_extreme_eigenvalues_ae` | Bai Thm 2.12 (i)–(iv) | `E(w₁₁⁺)² ≤ Eη² < ∞`; `E w₁₂ = 0` real `≤ 0`; `E|w₁₂|² = 1`; fourth moment; `−W` for the minimum | hypotheses sufficient | none |
| `marchenkoPastur_ae`, `n=0` term | `Fin (p 0) × Fin 0` | `sampleCovariance = (0:ℝ)⁻¹ • 0 = 0` (Lean `simp`), first term only | harmless | none |
| Bai–Yin covariance | `y=1/4`; `y>1` | edges `1/4, 9/4`; least positive eigenvalue `(√y−1)²` by `XX*`/`X*X` duality | matches 4.5 | none |
| GOE/GUE density constant | `n=1,β=2`; `n=1,β=1`; `n=2,β=2`; `n=2,β=1` | `√(2π)`; `(1/2)^{−1/2}√(2π) = 2√π`; `2^{−2}·2π·1·2 = π` vs `∫∫e^{−x²−y²}(x−y)² = 2·(√π/2)√π = π`; `2π/Γ(3/2) = 4√π` vs `√2·2·√(2π) = 4√π` | matches AGZ (2.5.4) rescaled by `√n` (`∏Γ(1+jβ/2)/Γ(1+β/2) = N!·∏Γ(jβ/2)/Γ(β/2)`) | none |
| density at `n=0` | `Fin 0 → ℝ` | both sides the Dirac mass on a point: `0!/(0^0·1·1)·e^0·1 = 1` | equality holds | none |
| `n − 1` in the exponent | elaboration | real subtraction (probe: `ring` closes, `push_cast` idle) | no junk value | none |
| `gaussianEnsemble` entries | `β=1`, `β=2`, `n=2` | `H₀₁ = (g(0,1)+i g(1,0))/2`, `Im = g(1,0)/2`; GOE diagonal `√2 g(i,i)` | matches 5.1 Checks | none |
| `E trₙ H²` GOE/GUE | `n` | GOE `(n·2/n + 2·(n(n−1)/2)/n)/n = 1 + 1/n`; GUE `(1 + (n−1))/n = 1` | matches line 679 | none |
| CUE density | `n=1`; `n=2` | `(2π)⁻¹`; `∫∫(2−2cos(θ₁−θ₂)) = 2(2π)²`, times `((2π)²2!)⁻¹ = 1` | normalised | none |
| HCIZ | `n=2`, `t→0` | `det ≈ t(a₂−a₁)(b₂−b₁)`; quotient `→ c₂ = 1 = ∫1`; opposite Vandermonde sign `−1` | correct | none |
| GUE gap at `n=2` | `s = x−y`, `u = x+y` | `e^{−(x²+y²)}(x−y)² = e^{−(s²+u²)/2}s²` | density `∝ s²e^{−s²/2}` | none |
| noncrossing partitions of four points | counts | `15 − 1 = 14`; Narayana `N(4,2) = 6`; pairings `2` of `3` | matches | none |
| free cumulants | centred, `κ₄ = m₄ − 2m₂²` | semicircle `2−2 = 0`; Gaussian `3−2 = 1` | matches 6.2 | none |
| R- and S-transforms | `MP_y`; `δ_a` | `κₙ = y^{n−1} ⇒ R = 1/(1−yw)`; `ψ = za/(1−za)`, `S = 1/a` | matches 6.3 | none |
| free Poisson | rate `λ` | dilation by `λ` of `MP_{1/λ}`: `λⁿ·λ^{1−n} = λ` | all cumulants `λ` | none |
| free CLT hypotheses | AGZ Lemma 5.3.32 vs 6.4 | source: bounded moments, `φ(aᵢ)=0`, `φ(aᵢ²)=1`, not i.d.; README: i.i.d. bounded | narrower | R04 |
| AGZ (5.4.8) vs "bounded operator norm" | `D_N` | `sup_k (N⁻¹tr|D|^k)^{1/k} = ‖D‖` | equivalent | none |
| Pastur equation | `ν = δ₀`; `t = 0` | `m = (−z−tm)⁻¹ ⇒ tm²+zm+1 = 0`; `m = m_ν` | matches 7.1 | none |
| companion transform | `y=1` | `m̲ = −0/z + m = m` | matches 7.2 | none |
| oracle weight | `ν=δ₁`, `w = 1−y−yzm` | substitution in `yzm²+(z+y−1)m+1=0` gives `w² − (1−y+z)w + z = 0`, roots' product `z`, so `|w|² = x` on the support and weight `1` | matches 7.4 | none |
| Wigner spike | `θ=1`; `θ=2` | `2`, overlap `0`; `5/2`, `3/4`; BGN §3.1 `G⁻¹(1/θ) = θ+σ²/θ` with `σ=1` | continuous at threshold | none |
| covariance spike | `ℓ = 1+√y` | `ℓ(1+y/(ℓ−1)) = (1+√y)(1+√y)`; overlap numerator `1−y/y = 0` | continuous | R07 (statable, absent) |
| Hanson–Wright constants | `A = E₁₂+E₂₁`, Rademacher, `K=1` | `XᵀAX = ±2`, `P(|·|>1) = 1 ≤ 2e^{−c min(1/2, 1)} ⇒ c ≤ 2log 2`; `A=0`: `t²/0 = 0` in Lean, bound `2` | consistent; `K`-convention matches RV2013 (`K⁴ ↔ K²`, `K² ↔ K`) | none |
| matrix Bernstein | `Xₖ = εₖEₖₖ`, `t=1`; `d=0`, `t>0`; `d=0`, `t=0` | `2m e^{−3/8} ≥ 1`; `0 ≤ 0`; `1 ≤ 0` false, hence `0 < t` | hypothesis needed | none |
| matrix Chernoff | `δ ≥ 0`; `0<δ<1` | Tropp Thm 1.1 with `R = L` | matches 2.6 | none |
| LSI Gaussian | `f = e^{ax/2}` | `Ent(f²) = (a²/2)e^{a²/2} = 2∫f'²` | `C=1` sharp | none |
| Poincaré counterexample | `(δ₀+δ₁)/2` | `Var f = 1/4`, `∫f'² = 0` | no inequality | none |
| Bernstein / Hoeffding | `n=1`, `t=1` | `1 ≤ 2e^{−1/2} ≈ 1.21` | consistent | none |
| sub-exponential | `Exp(1)`; `N(0,1)` | `e^{−λ}/(1−λ)` for `λ<1`, `∞` at `1`; `e^{λ²/2} ≤ e^{K²λ²}` iff `K² ≥ 1/2` | matches 2.1 | none |
| AGZ Thm 2.3.5 exponent | `c/N` LSI entries | `2exp(−N²δ²/(4c|f|²_L))` | matches 2.3 | none |
| linear-statistics CLT variance | `f=x`: GOE, GUE; `f=x²`: GOE, GUE | `a₁=2`, `(2β)⁻¹·4 = 2, 1` vs direct `n·(2/n), n·(1/n)`; `a₂=2`, `4/β = 4, 2` vs direct `8/n + 4(n−1)/n → 4`, `2/n + 2(n−1)/n → 2` | formula and `β`-dependence right | none |
| `TendstoInDistribution … id (fun _ ↦ P) (gaussianReal 0 v)` | pin lines 64–70 | limit law `μ'.map Z = gaussianReal 0 v` | right notion | none |
| scaling of correlations | `x ↦ 2x`, `ρ₁ = 1` | `ρ'₁ = 1/2` | matches 8.1 | none |
| DPP Checks | `K = λφ⊗φ`, `λ ≤ 1`; `λ > 1`; `1_{x=y}` | `det(I−K_B) = 1−λ∫_Bφ²`; `1−λ < 0`; Poisson void `e^{−1} ≠ 1` | continuity and contraction needed | none |
| Tracy–Widom relations | AGZ (3.1.13) | `F₁/√F₂ = exp(−½∫_t^∞q) ⇒ F₁² = F₂ exp(−∫q)` | matches 8.5 | none |
| Pfaffian | `4×4` | `a₁₂a₃₄ − a₁₃a₂₄ + a₁₄a₂₃`, `Pf² = det` | true | none |
| beta-gas hypothesis | AGZ (2.6.2) with `V_AGZ = βV/2` | `liminf V/log|x| > 2β'/β`; `β=2`, `V = c log(1+|x|)`: `c > β' ≥ 2` | matches 9.2 | none |
| LDP rate | AGZ (2.6.5) | `I = (β/2)(E_V − min E_V)` | matches 9.3 | none |
| semicircle energy | `V = x²/2` | `∫log|x−y|dσ = x²/4 − 1/2`; `V − 2U = 1`; `E_V = 1/2 + 1/4 = 3/4`; `cap[−2,2] = 1` | matches 9.2, 9.4 | none |
| top-eigenvalue rate | `x=2`; `x ↓ 2`; AGZ Thm 2.6.6 | `J(2) = 0`; `(β/2)·2·(2/3)(x−2)^{3/2} = (2β/3)(x−2)^{3/2}`; `V − βU + α` has derivative `(β/2)√(x²−4)` while the printed `βU − V − α` decreases | README right; source misprint | none |
| Dyson SDE | AGZ (4.3.3) | `√2/√(βN)`, `N⁻¹(λᵢ−λⱼ)⁻¹`; drift symmetric under relabelling, so decreasing order is harmless | matches 10.2 | none |
| matrix BM brackets | `β=1,2`, `A=B=E₁₁`; `β=2`, `E₁₂+E₂₁` | `(2/β)t = 2t, t`; `2t ⇒ Var Re H₁₂ = t/2` | matches 5.1 conventions | none |
| OU invariant law | `n=1` | variance `(2/β)/(2·½) = 2/β` = variance of `e^{−βx²/4}` | matches 10.3 | none |
| hydrodynamic limit | `ν = δ₀` | `δ₀ ⊞ SC_t = SC_t` | matches Example | none |
| log potential | `circularLaw` inside; `A = diag(a,b)` | `Δ((|z|²−1)/2) = 2 = 2π·π⁻¹`; `½(log|a−z|+log|b−z|) = ½log|det(A−z)|` | matches 11.2 | none |
| least singular value | `N=1` Gaussian; Rademacher `2×2`; RV2008 hypotheses | `P(|ξ| ≤ ε) ≈ ε√(2/π)`; singular w.p. `1/2` (rows equal or opposite); variances `≥ 1`, not i.d. | true; narrower than source | R02 |
| TV2008 Thm 2.1 vs 11.1 | constants | `C₂n^{−A} ≤ n^{−A'}` for large `n`, any `A' < A` | "for every A" preserved | none |
| circular law, `n=0` term | `Fin 0` | `eigenvalueMeasure = ⊤ • 0 = 0`, first term only | harmless | none |
| `semicircleReal a 0` | constant map | `map (const a) β = β(univ) • dirac a = dirac a` (probability instance, pin line 136) | `δ_a` | none |
| symmetrization example | Rademacher, `Φ = x²` | `1`, `2`, `2` | matches 0.3 | none |
| 0.1 Check | `ν = (δ₀+δ₁)/2` | `P(snd=0, snd=0) = ½ ≠ ¼` | not self-independent | none |

Counts: 68 rows; 24 declarations `#check`ed; 26 Mathlib and 6 Tau Ceti declarations or files opened at the pin; 14 cross-roadmap citations resolved; 15 sampled targets and 47 locators read in 10 texts.

## Not verifiable

- Potters–Bouchaud (PB): Cambridge University Press 2020, paywalled; no open copy found (the DOI resolves to Cambridge Core). Cited by chapter and section only; its formulas (Pastur, companion, shrinkage, spikes, HCIZ) were checked by the computations in the table instead.
- Johansson 1998 (Duke Math. J. 91): the sources service found only the Project Euclid landing page with no PDF (`needs-references.toml` records the attempt); Theorem 2.4 is cited for 8.6 and was checked against AGZ Theorem 4.3.20 and the direct variance computations above instead.
- 8.5's GOE Pfaffian kernels, 9.4's capacity-zero exceptional set beyond AGZ's `σ`-a.e. form, and 11.1's inverse Littlewood–Offord constants were checked for consistency, not against a text beyond the locators listed.

## Source issues

- **Misprint** in AGZ at Theorem 2.6.6, printed page 82 (author web version, lines 4136–4141): the rate for `x ≥ x*` is printed as `β∫log|x−y|σ(dy) − V(x) − α_{V,β}`, which is nonpositive and decreasing for `x > x*`; it should be `V(x) − β∫log|x−y|σ(dy) + α_{V,β}`, zero at `x*` and increasing to infinity; affects nothing (the roadmap's rate `(β/2)∫₂ˣ√(t²−4)dt` is the correct one).
- **Misprint** in AGZ at the free Poisson exercise of §5.3.3, printed page 368 (author web version, lines 17611–17616): for `λ < 1` the limit is printed as `(1−λ)δ₀ + λ p̃` with `p̃` the displayed density, whose total mass is `λ`; it should be `(1−λ)δ₀ + p̃`, or `λ` times the normalised density; affects nothing.
- **Misprint** in Benaych-Georges–Nadakuditi 2011 at §3.1, arXiv v3 page 11 (lines 471–479): the off-diagonal variance `σ²/(2n)` is stated for both the symmetric and the Hermitian case, but a real symmetric matrix with that variance has semicircle radius `√2·σ`, not the `2σ` displayed; the symmetric case needs off-diagonal variance `σ²/n`; affects nothing (Theorem 2.1 and the `θ + 1/θ` limit do not depend on it).
