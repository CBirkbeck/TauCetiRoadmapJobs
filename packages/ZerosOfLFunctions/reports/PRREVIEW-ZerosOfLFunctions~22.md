# Review of ZerosOfLFunctions (pull request #1913 at acedbec)

**Verdict:** needs changes

This is a full review: 165 lines of the folder changed since `6cd5747`.

- **Previous findings.** Four of the five are repaired (R01–R04). Previous R05, the title, description and merge order of the pull request, is not repaired; it is carried here as R01.
- **Mathematics.** No P1 or P2 defect. All 17 theorems of `Suggested.lean`, the 15 sampled targets and every changed passage survived the adversarial pass.
- **Findings.** Three, all P3:
  - R01: the stale pull-request metadata, with no stated order against #1907;
  - R02: 1.1 credits a global constancy lemma with a uniqueness statement on the sector;
  - R03: 8.8's two exceptional Chebotarev terms carry one Check.
- **Gate.** The gate passes.

Paths: `TauCeti/…` is a file of the Tau Ceti pin `2fd255d9`, and `Mathlib/…` a file of the Mathlib pin `1b1ccf4b`. Other roadmap paths are on main (`8192659d`) unless a pull request is named.

## R01 (P3) — The title, description and merge order are stale, and no order is stated against #1907 (previous R05, not repaired)

**Location.** The pull request's title is "effective statements under the exclusion of Landau–Siegel zeros". Its description says the statements "are restated in their unconditional, effective form" and asks to merge "after AnalyticNumberTheoryPartI (#1126) lands".

**Claim.**
- The head removes the exceptional-zero alternative.
- The head depends on AnalyticNumberTheoryPartI §0.34.

**Witness.**
- README lines 87–89 exclude "the nonexistence of exceptional zeros".
- Lines 2221–2222 keep "the exceptional-zero alternative of 6.3–6.4", and no line cites §0.34.
- AnalyticNumberTheoryPartI is on main (`TauCetiRoadmap/AnalyticNumberTheoryPartI/README.md`).
- #1907 (head `123254c`) changes both files. Its `Suggested.lean` declares the same names with different statements:
  - `heckeLFunction_zeroFreeRegion` (its line 164) conjoins the two clauses;
  - `rayClassPrimeCount_effective (n : ℕ)` (its line 338) chooses `c` before `K`;
  - `frobeniusPrimeCount_effective_abelian` (its line 366) is stated for `K L : Type`.

**Repair.**
1. Retitle the pull request and describe this head: the general-field headlines at the pin, the pinned holomorphic logarithm, `Li` identity and segment-sum bridge, and the 4.1/4.6 counts.
2. Delete the merge-order sentence.
3. State which of #1913 and #1907 is rebased on the other. The rebased one reconciles the three statements above.

**Test.** The new description agrees with README lines 87–89. After the rebase, `roadmaps overlaps ZerosOfLFunctions` reports no conflict between the two heads.

## R02 (P3) — 1.1 credits the global constancy lemma with uniqueness on the sector, and re-derives a pinned lemma

**Location.** `TauCetiRoadmap/ZerosOfLFunctions/README.md`:
- lines 183–184: "`Complex.exp_eq_exp_iff_exists_int` and `is_const_of_deriv_eq_zero` (uniqueness of a logarithm modulo `2πi ℤ`, for 1.1 and 5.4)";
- line 553: "Two values `δ ≤ δ'` give branches agreeing on `S_{δ'}`";
- the *Needs:* of 1.1 (lines 560–564), which names no constancy lemma and derives simple connectivity through `Topology.IsEmbedding.isSimplyConnected_image` with "`exp`, an embedding on the strip".

**Claim.** The cited lemma gives the uniqueness clause of 1.1.

**Witness.**
- `is_const_of_deriv_eq_zero` (`Mathlib/Analysis/Calculus/MeanValue.lean:751`) assumes `Differentiable 𝕜 f` on all of `ℂ`. The difference of two branches is holomorphic only on `S_{δ'}`, which omits the poles `0, −1, −2, …` of `Γ`.
- The open-set form is `IsOpen.is_const_of_deriv_eq_zero` (`:767`), with hypotheses `IsOpen s`, `IsPreconnected s` and `DifferentiableOn 𝕜 f s`.
- `Topology.IsEmbedding.isSimplyConnected_image` (`Mathlib/AlgebraicTopology/FundamentalGroupoid/SimplyConnected.lean:150`) needs a global embedding. That is the restriction argument which `TauCeti.isSimplyConnected_image_of_differentiableOn_of_injOn` (`TauCeti/Analysis/Complex/Conformal/ImageSimplyConnected.lean:95`) already packages: open, simply connected, holomorphic and injective give a simply connected image.

**Repair.**
1. In the Mathlib bullet, write "for 5.4" after `is_const_of_deriv_eq_zero`. Add `IsOpen.is_const_of_deriv_eq_zero` (for 1.1, on the preconnected open `S_{δ'}`).
2. Add `IsOpen.is_const_of_deriv_eq_zero` to the 1.1 *Needs:*. Preconnectedness of `S_{δ'}` holds because it is the continuous image of a convex set.
3. For the simple connectivity of `S_δ`, cite `TauCeti.isSimplyConnected_image_of_differentiableOn_of_injOn` with `g = exp` on `Ω = {w : 0 < Re w ∧ |Im w| < π − δ}`. `Ω` is open and convex (`Convex.contractibleSpace`, `SimplyConnectedSpace.ofContractible`), and `exp` is injective on it since `|Im w| < π`. Add the lemma to the "holomorphic logarithms" bullet under From Tau Ceti.

**Test.**
- With `h = logGamma δ − logGamma δ'` on `S_{δ'}`: `exp ∘ h = 1` gives `h' = 0` on the open preconnected `S_{δ'}`, and `h 2 = 0`, so `h = 0` there.
- The global lemma would need `h` differentiable at `−2`, a pole of `Γ` that lies in no `S_δ`.
- `exp '' Ω = S_δ`: `‖exp w‖ = e^{Re w} > 1` and `arg (exp w) = Im w ∈ (−(π − δ), π − δ)`.

## R03 (P3) — 8.8's two exceptional Chebotarev terms carry one Check

**Location.** `TauCetiRoadmap/ZerosOfLFunctions/README.md`:
- lines 2062–2068 define *exceptionalChebotarevTerm* "as the sum over the characters `ψ` of `Gal(L/K)` of `(#G)⁻¹ conj ψ(σ_C) ∑_β x^β/β`", and *exceptionalChebotarevPrimeCountTerm*;
- the 8.8 Checks are at lines 2089–2096.

**Claim.** The definitions carry their discriminating Checks.

**Witness.**
- Of the three 8.8 Checks, only `K = L = ℚ` ("the exceptional term is `0`") mentions the terms. The other two test the main term.
- At `#G = 1` that Check also accepts two wrong models:
  - the weight `1` in place of `(#G)⁻¹`;
  - a definition that omits the trivial character.
- 8.7's term has four conditional Checks (lines 1985–1997). 8.8's has none.

**Repair.** Add three conditional Checks in 8.7's style ("if the indicated zero data occur"):
1. **Only `ζ_K` has an exceptional zero `β`.** The term is `x^β/(β #G)` in every class, and its sum over the `#G` classes is `x^β/β`, the term of 8.5. Omitting the trivial character gives `0`.
2. **`L/K` quadratic, and only its nontrivial `ψ` has an exceptional zero `β`.** The term is `x^β/(2β)` at `C = {1}` and `−x^β/(2β)` at `C = {σ}`, and the prime-count term is `±Li(x^β)/2`. The weight `1` doubles both, and the class sum `0` matches 8.5 for a `ζ_K` without an exceptional zero.
3. **`L = ℚ(i)`, `K = ℚ`.** The dictionaries at `(4)∞` and `(8)∞` induce the same primitive character `χ₋₄`, so they give the same term. This is the stated independence of the dictionary.

**Test.**
- In Check 2: `(#G)⁻¹ conj ψ(σ) = (1/2)(−1)`, against `−1` for the weight-`1` model.
- In Check 1, the fibre-sum identity of line 2065 reproduces the same value: `∑_{c ∈ Φ⁻¹(σ)} (#Cl_𝔪)⁻¹ = #ker Φ/#Cl_𝔪 = 1/#G`.

## Previous findings (PRREVIEW-ZerosOfLFunctions~21)

- **R01 — repaired.**
  - 5.4 (lines 1270–1277) now reads "this is `TauCeti.exists_differentiableOn_eqOn_exp_comp` at `U = Set.univ` … so existence is consumed. The target here is uniqueness". It has three new Checks.
  - 1.1 (lines 544–547) defines *logGamma* from the same theorem.
  - The From Tau Ceti bullet is at lines 216–219.
- **R02 — repaired.** 8.9 (lines 2100–2107) reads "the first integration by parts … is `TauCeti.Real.logIntegral_eq_div_log_sub_add` at the pin … The target here is the second-order term". The §6.2 contract (lines 326–330) and Layer 8 Dependencies (line 2139) cite it.
- **R03 — repaired.**
  - 7.3 (lines 1687–1701) runs the lift, then `windingNumber_eq_integral_of_avoidance`, then `integral_inv_sub_mul_deriv_eq_log_norm_add_I_mul_sum_log_im` ("the curve is closed, so the log-norm term vanishes"), then `windingNumber_comp_eq_integral_logDeriv`.
  - The *Needs:* (lines 1706–1710) and the contour bullet (lines 232–238) name all of them.
  - The new `f z = z` Check gives `θ 0 = −3π/4` and `θ 4/(2π) = 5/8`.
- **R04 — repaired.**
  - 4.1 (lines 1077–1079) reads "For `R ⊆ R'` with `R'` bounded … with equality exactly when `divisor f U` takes no positive value on `R' \ R`". The `1/z` and `sin πz` Checks are at lines 1094–1098.
  - 4.6 (lines 1189–1190) writes `ValueDistribution.logCounting f 0` and says "The letter `N` denotes only the critical-strip count".
- **R05 — not repaired.** The title and description are unchanged. Carried as R01.

## Verified sound

### Gate, dependency check and elaboration

- **Gate.** My run printed every check at 0, ending `stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`. The worker's gate on this head, which includes `build=0`, also passes.
- **Outside the folder.** `git diff --stat origin/main...HEAD` outside the folder is empty.
- **Dependency check.** It exits 0 and prints no UPWARD, CYCLE or `moved:` line:

```text
depcheck: 237 roadmaps, 2283 edges, 0 problem(s)
```

- **Merge order.** `ORDER.txt` places LFunctions at line 27, ZerosOfLFunctions at 48 and AnalyticNumberTheoryPartI at 50. The other suppliers are on main (`Completed/` or `TauCetiRoadmap/ClassFieldTheory`).
- **Elaboration.** `lake env lean TauCetiRoadmap/ZerosOfLFunctions/Suggested.lean` exits 0 in 10 s with exactly 17 "declaration uses `sorry`" warnings (lines 97–337).
- **`#check` comparison.**
  - A scratch copy carrying `#check @…` for all 20 declarations elaborates with 0 errors.
  - All 20 elaborated types match `signatures.md` after whitespace normalization.
  - The file has no `variable`, `include`, `set_option`, `lemma`, `#eval` or `#print`.
  - Main's declaration names are a subset of this head's, so nothing is dropped.
- **Padding.** Decided by reading the statements and the pin. `Suggested.lean` is unchanged since the last review, and every theorem is existential over an analytic constant or a deep identity. None closes by one library lemma, and none mirrors a Check.

### Names elaborated

- **First probe.** It holds all 284 backticked dotted or underscored names of the README, with `import Mathlib` and 26 Tau Ceti modules.
  - 183 elaborate.
  - The 101 failures are all accounted for:
    - 39 L-functions targets, each found in `TauCetiRoadmap/LFunctions/Suggested.lean` on main;
    - 2 short Tau Ceti names, `eulerCorrection_self` and `eulerCorrection_one` (`Hecke/Primitive.lean:257, 278`);
    - 15 of this file's own names;
    - 11 PrimeNumberTheoremAnd names of the Provenance table;
    - 11 short field names;
    - 9 names in modules not imported;
    - 6 notation tokens;
    - 5 namespaces;
    - 3 short `TauCeti.Real` names.
- **Second probe.** It elaborates the fields, the `TauCeti.Real` names and `SegmentSum`. I built `SegmentSum` with `lake build TauCeti.Analysis.Contour.Winding.SegmentSum`.
- **Located by grep.** The remaining modules without object files: `AnalyticInvariants.lean:125, 133`, `PartialZeta.lean:198` and `FrobeniusPrimeCount.lean:91, 108`.

### Library declarations opened this round (51)

**Tau Ceti: changed passages (14).**
- `exists_differentiableOn_eqOn_exp_comp`. Elaborated: `IsSimplyConnected U → IsOpen U → DifferentiableOn ℂ g U → 0 ∉ g '' U → ∃ f, …`.
- `isSimplyConnected_image_of_differentiableOn_of_injOn` (`Conformal/ImageSimplyConnected.lean:95`).
- `Contour.exists_continuousOn_arg_lift_with_partition` (`Argument/Lift.lean:427`). `θ t = arg (γ a − w) + ∑_j Im log (segRatio …)`.
- `segRatio` (`:130`) and `segRatio_eq_one_of_le` (`:134`). These give `θ 0 = arg γ 0`.
- `windingNumber_eq_integral_of_avoidance` (`Winding/Number/Basic.lean:170`).
- `integral_inv_sub_mul_deriv_eq_log_norm_add_I_mul_sum_log_im` (`Winding/SegmentSum.lean:154`). Elaborated: a countable `P`, the slit condition, and an integrable `(γ t − w)⁻¹ γ'`.
- `windingNumber_comp_eq_integral_logDeriv` (`LogDerivFTC.lean:227`). Its proof transfers integrability almost everywhere by `logDeriv_comp`.
- `intervalIntegrable_deriv_smul_logDeriv` (`:174`).
- `Real.logIntegral_eq_div_log_sub_add`, `Real.isLittleO_integral_inv_log_sq` and `Real.logIntegral_isEquivalent_div_log`. Elaborated.
- `Real.integral_inv_log_pow_le` (`LogIntegral.lean:102`): `∫_a^b (log t)^{−n} ≤ (b − a)/log^n a` for `1 < a ≤ b`.
- `Real.intervalIntegrable_inv_log_pow` (`:92`).

**Tau Ceti: records and suppliers (26).**
- `NormalizationTranslation` (`#print`). Its fields include `gammaR_eq : analytic.gammaR = map (· + w/2) arithmetic.gammaR` and `completed_eq : Λ_an s = N^{−w/4} Λ_ar (s + w/2)`.
- `ArithmeticLFunctionData` extends `AnalyticLFunctionData` (`Data/Normalization.lean:78`).
- The fields `norm_rootNumber`, `polarOrder_one_sub_conj`, `meromorphicOrderAt_eq`, `analyticAt`, `coeff_one`, `degree_pos` and `completed_eq`. All elaborated.
- `LSeries.threeFourOneCombination` (`ThreeFourOne.lean:59`, `3 + 4 Re z + Re z²`) and `_nonneg`.
- `Contour.argumentPrinciple_nullHomologous` (`Argument/Cycle.lean:110`).
- `HeckeRing.GL2.Newform.analyticConductorAt` (`AnalyticInvariants.lean:125`) and `_eq` (`:133`).
- `RayClassCharacter.eulerCorrection_self` and `eulerCorrection_one` (`Hecke/Primitive.lean:257, 278`).
- `rayClassIdealMainTerm` and `_eq` (`RayClass/MainTerm.lean:56, 62`).
- `truncatedPerron_LSeries` and `norm_truncatedPerron_LSeries_sub_sum_le` (`Perron/Formula.lean:130, 229`).
- `truncatedPerronKernel_one` (`Perron/Basic.lean:204`).
- `perronFormula` (`Perron/Ideal.lean:161`).
- `idealSummatory_mul_eq_sub_integral_mul` (`AbelSummation.lean:390`).
- `abscissaOfAbsConv_normCoeff_one` (`Estimates.lean:443`).
- `LSeries.wienerIkehara` (`WienerIkehara/SharpCutoff.lean:300`).
- `primeNumberTheoremTransfer` (`Prime/Boundary.lean:171`).

**Mathlib (11).**
- `is_const_of_deriv_eq_zero` (`MeanValue.lean:751`) and `IsOpen.is_const_of_deriv_eq_zero` (`:767`).
- `Topology.IsEmbedding.isSimplyConnected_image` (`SimplyConnected.lean:150`).
- `Complex.differentiableAt_Gamma` (`Gamma/Deriv.lean:75`), with `hs : ∀ m : ℕ, s ≠ −m`.
- `Complex.exp_eq_exp_iff_exists_int`.
- `ValueDistribution.logCounting` (`LogCounting/Basic.lean:351`): `logCounting f 0` is the positive part of the divisor of `f · − 0`.
- `Function.locallyFinsuppWithin.logCounting` (`:97`), which adds `D 0 · log r`.
- `log_counting_zero_sub_logCounting_top`.
- `Convex.contractibleSpace`, `SimplyConnectedSpace.ofContractible` and `intervalIntegral.integral_eq_sub_of_hasDerivAt`.

**Not duplicated at the pins.** A grep of both pins finds no `OrderLE`, `zeroCount`, `divisorCount`, `logGamma`, elementary factor, Hadamard factorization, zero-free region, Riemann–von Mangoldt count or explicit formula. `TauCeti/NumberTheory/DirichletCharacter/LFunction/Bounds.lean` has only `‖L(s, χ)‖ ≤ N ‖s‖/Re s`.

### Cross-roadmap citations resolved

- **L-functions** (main).
  - 48 cited names occur in its `Suggested.lean`.
  - `dedekindZetaData` has conductor `(discr K).natAbs` (line 1056), and `heckeData` has `(discr K).natAbs * Ideal.absNorm χ.conductor.finitePart` (line 1636). Both match 2.5.
- **Arithmetic Dirichlet Series** (main).
  - §6.2 (line 264) owns `Li(x) ∼ x/log x`, which Tau Ceti's `LogIntegral.lean` realizes with the first integration by parts.
  - §2.3 (lines 182–188) carries the zero-free local-factor erratum, which ray-class weights satisfy.
- **Other suppliers.** Global Number Fields, Number Field Arithmetic, Chebotarev, Class Field Theory and Contour Integration are on main, and the Tau Ceti names above realize them.
- **Downstream.**
  - AnalyticNumberTheoryPartI on main cites this roadmap on 76 lines. Its line 19 says this roadmap "keep[s] their statements", as README lines 2221–2222 do.
  - This README neither cites nor uses AnalyticNumberTheoryPartI's §0.34.

### Ownership and overlaps

- **Ownership.** `roadmaps grep` over main and the 461 open heads finds `def OrderLE`, `def zeroCount`, `zetaEntireCompletion`, `heckeLFunction_zeroFreeRegion`, `riemannVonMangoldt`, `primeIdealCount_effective`, `hadamard_of_orderLE_one`, `dirichletLFunction_convexity`, `riemannZeta_weilExplicitFormula` and `chebyshevPsi_explicitFormula` in three places only:
  - this roadmap on main;
  - #1907 (the same roadmap, R01);
  - this head.
- **Later consumers.** ExplicitNumberFields #1944 (`ORDER.txt` line 271) consumes 6.2, 7.5 and 8.5 by citation (its README lines 160–163).
- **Dropped ids.** `overlaps.md` reports no dropped or revision-only id. The heading diff against main only adds ids.

### Sources: seeded sample and locators

- **1.2.** `dlmf5` lines 104–108: 5.11.1 in the sector `|ph z| ≤ π − δ`, with the principal `ln`. Lines 563–569: for complex `z` the remainder is at most `sec²(½ ph z)` times the first neglected term. This gives `O(1/‖s‖)` with constant `1/(12 sin²(δ/2))`.
- **1.4.** `dlmf5` lines 156–160 (5.11.2, `ψ(z) ∼ ln z − 1/(2z) − …`, same sector). The two gamma-factor log-derivative identities I differentiated by hand.
- **1.5 and 1.3.** `dlmf5` lines 490–492 (5.11.9) and line 524 (uniform for bounded `x`).
- **2.3 and 2.4.** Checked against the pinned `NormalizationTranslation` fields and `analyticConductorAt` above.
- **2.5.** L-functions lines 1056 and 1636.
- **4.6, 5.2 and 7.2.** Checked against the pinned declarations above.
- **5.6.** `kadiri2012` lines 230–237 (§2.1.2): `−Re ζ'_K/ζ_K = −∑ Re 1/(s − ρ) + ½ log d_K + Re 1/s + Re 1/(s − 1) + Re γ'/γ`. My derivation from `Λ₀ = s(s − 1)Λ` and `Re b = −∑ Re 1/ρ` agrees.
- **6.2.** `kadiri2012` lines 79–85 (Theorem 1.1: `d_K` large; zero-free (1.7) for `|Im s| ≥ 1`; at most one, real and simple zero (1.8) for `|Im s| ≤ 1`).
- **6.4.** `kadiri2012` lines 65–73 report Lagarias–Montgomery–Odlyzko Lemma 2.3, with `A(χ) = d_K N f(χ)`.
- **7.5.**
  - `bennett2021` lines 56–58, 61 and 83–84: Corollary 1.2, conductor `q > 1`, `T ≥ 5/7`, error `min{0.247 log qT + 6.894, …}`.
  - `hasanalizade2022` lines 26–27 and 63–65: Corollary 1.2, `T ≥ 1`.
  - `trudgian2015` lines 19 and 25: Theorem 1 for primitive nonprincipal `χ`, Theorem 2 for Dedekind zeta.
  - `bennett2021` lines 73–76 report the gap in Trudgian's proof.
- **0.3, 4.5 and 7.6.** Davenport §11 and Titchmarsh Theorems 9.2 and 9.4 are paywalled (see Not verifiable). I recomputed the mathematics below.
- **Unverified flags.** The README flags no locator as unverified.

### Adversarial table

Values computed this round in pure Python (Simpson quadrature, Lanczos `Γ`, a sieve to `10⁶`), with Lean `#check`, and by hand where noted.

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| 0.3 (sample) | `F = exp` under `s ↦ 2s + 1`; `exp(exp z)` under `s ↦ 0`; `exp(exp r)` | log-norm `2r + 1`; constant `e`, finite order although `F` has none (converse needs `a ≠ 0`); `log log = r` beats `A log r` | sound | none |
| 1.1 (changed) | `logGamma δ 3`; uniqueness clause `δ ≤ δ'`; `exp '' Ω` | `log 2 = 0.693147`; difference `h` has `h' = 0` only on `S_{δ'}`, global lemma needs differentiability at `−2`; `‖exp w‖ = e^{Re w} > 1`, `arg = Im w` | lemma misattributed | R02 |
| 1.2 (sample) | `σ = 2`, `t = 10, 40` | `log ‖Γ‖` exact `−11.330172`, `−56.379283` against main `−11.335147`, `−56.379595`: error `0.0498/t`, `0.0125/t` | sound | none |
| 1.3 / 1.3a | `σ = ½`, `t = 10, 40`; `‖Γ(½ + it)‖²` at `t = 0, 1, 2.5` | `−14.789025`, `−61.912915` (exact = main); `3.141593`, `0.271015`, `0.002439` = `π/cosh πt` | sound | none |
| 1.4 (sample) | `−logDeriv Gammaℝ 3`; `logDeriv Gammaℂ 1`; `Im ψ(i)` | `−(ψ(3/2)/2 − log π/2) = 0.55412`; `−γ − log 2π = −2.41509`; `0.5 + (π/2) coth π = 2.07667` | sound | none |
| 1.4a | symmetric form at `s = 2`; at `s = −2` | both sides `1.41509` (`ζ'/ζ(2) = −0.56996`, `12 log A − 1 = 1.98505`); `ζ'/ζ(3) = −0.16482` against `0.55412` | sound | none |
| 1.5 (sample) | `gammaR = {0, 1}` at `s = 0.3 + 7i` | `Gammaℝ(s)Gammaℝ(s+1) = 3.16349e−5 − 8.81126e−6 i = Gammaℂ(s)`; rate `2·π/4 = π/2`; `A(σ) = σ − ½` | sound | none |
| 1.6 (sample) | `1/Gammaℝ(−2n−1)`, `n = 2, 5`; `F = 1/((s−2)(s+1))` | `0.060472`, `0.168945` both sides; `F(1−s) = F(s)`, polar set `{2, −1}` closed under `p ↦ 1 − conj p`; `continuedL` at `2` is `1`, dual at `−1` is `0` | sound | none |
| 2.3 (sample) | weight `w`; `Δ` (`k = 12`) | `‖s + μ_ar + w/2‖`; `continuedL_an s = N^{−(s+w/2)/2} Λ_ar(s+w/2)/γ_ar(s+w/2)`; `(6+3)(7+3) = 90` against unshifted `3.5·4.5 = 15.75` | sound | none |
| 2.5 (sample) | `ℚ(i)`; odd character `(4)∞` | `4·3·4 = 48`; `4(1+3) = 16` | sound | none |
| 3.1 / 3.5 | `ζE(2m)`; `‖Λ(2m + 2i)‖`, `m = 10, 20` | `log ζE(100) = 96.53` against `m log m = 195.6` (`m log m − 2.14m + O(log m)`); `3.676797`, `13519751.806` (README `3.67680`, `13519751.81`) | sound | none |
| 4.1 (changed) | `1/z`, `∅ ⊆ {0}`; `z`; `sin πz`, `{0} ⊆ ℝ` | counts `0, 0` with divisor `−1`; `0, 1`; `1`, then junk `0` | sound | none |
| 4.5 (sample) | `ζ` at `T = 14, 15, 100`; `T = 0` | `N = 0, 1, 29`; `N± = 58`; `N 0 = #(Ioc 0 0) = 0` | sound | none |
| 4.6 (sample) | `z²(z − 3)`: `r = 2, R = 4`; `r = 3, R = 5` | `1.3863 ≤ 1.6740`; `3 log(5/3) = 1.5325` on both sides | sound | none |
| 5.2 (sample) | `z = −½`; `z = 1` | `‖E₁ − 1‖ = 0.090204 ≤ 0.125`; genus `0` gives `0.5`; `E₁'(1) = −e` | sound | none |
| 5.4 (changed) | `g = exp`; `g = z`; `g = exp(z²)` | `z`, `z + 2πi` are both logarithms; `exp(z + πi) = −exp z`; `exp ∘ h ≠ 0`; principal log jumps where `2xy` crosses `(2k+1)π` | sound | none |
| 5.6 (sample) | `ζE`; `e^s ζE`; `χ₄` | `B = −0.0230957`; `b = 0.9769043`, `f(0) = 1 ≠ f(1) = e`; `Gammaℝ(1) = 1` gives `Λ(0) = ½`, and `2 Gammaℝ(2) π/4 = 0.5`; `b + conj b` route re-derived | sound | none |
| 5.6a | first zero pair | `2/(1 + 14.134725²) = 0.0099606` | sound | none |
| 6.1 (sample) | `z = −1, i`; `(3)∞` at `s = 2` | `3 − 4 + 1 = 0`; `3 − 1 = 2`; missing term `log 3 · (1/9)/(8/9) = 0.137327` | sound | none |
| 6.2 (sample) | cap `c ≤ log 3/2`; principal character mod `2` | `c/log 3^n ≤ ½`; `1 − 0.549306/1.791759 = 0.69343 > 0`, so the zero at `0` lies outside | sound | none |
| 6.4 / 6.4b | nesting; `(2)` over `ℚ` at `s = 2` | `1 + log(4/3)/log 3 = 1.261860 < 1.27`; `log 2/3 = 0.231049` | sound | none |
| 7.2 (sample) | `z − 2`, `S = {2}`, square `[−1, 1]²` | integral `0` against `∑ ord = 1`; pinned `hord : meromorphicOrderAt f s = ord s` | sound | none |
| 7.3 (changed) | `f = z` on `[−1, 1]²`; `f = z − 2` | `θ 0 = −2.356194 = −3π/4`, `θ 4/(2π) = 0.6250`, variation `1`; image in `[−3, −1]×[−1, 1]`, winding `0` | sound | none |
| 7.5 | record `ζ(s)(1 + 5·2^{−s} + 2·4^{−s})` | roots at `Re s = 2.189525`, `−1.189525`; `2^s + 5 + 2·2^{−s}` is invariant under `s ↦ 1 − s` | sound | none |
| 7.6 (sample) | averaged count | `∫₀ᵀ(N(t+1) − N(t)) = ∫_T^{T+1} N − ∫₀¹ N`; `∫₀¹ N = 0` for `ζ`; limit `n/(2π)` | sound | none |
| 8.3 | `ℚ`; `ℚ(i)` at `x = 2` | `c_ℚ = −1.837877`; `−½ log(3/4) + ½ log 3 = 0.693147 = −log(1 − ½)` | sound | none |
| 8.8 terms | `#G = 1`; quadratic `L/K` with real `ψ`, zero `β` | the existing Check sees `0` only; correct `±x^β/(2β)` against `±x^β/β` for weight `1` | Checks missing | R03 |
| 8.9 (changed) | `x = 10`; `x = 10⁴` | `5.120436 = 4.342945 − 2.885390 + 3.662881`; `1.886117 − 4.162738 + 2·2.969751 = 3.662881`; `∫_2^{10⁴}(log t)^{−3} = 24.261 ≤ 402.669`; `159.3558` against `117.8823` | sound | none |
| `dirichletLFunction_convexity` | `q = 1`, `t = 0`; exponent | `‖ζ(½)‖ = 1.4603545 ≤ C·3^{¼+ε}`; `(½+δ)²/(1+2δ) = ¼ + δ/2` | sound | none |
| `hadamard_of_orderLE_one` | `1 − s`; `exp(cs)`; `ρ = 0` | `a = 0`, `b = −1`, `1 − s = e^{−s}E₁(s)`; `b = c`, empty product; exponent `(div f 0).toNat = 0` | sound | none |
| `zetaEntireCompletion_hadamard` | `s = 0` | `ζE(0) = 1`; `B = −0.0230957` | sound | none |
| `riemannZeta_zeros_summable_ordinate` | `−2`; poles | divisor at `−2` is `0`; at `0`, `1` it is `−1` (toNat `0`); first pair `0.0099606` | sound | none |
| `heckeLFunction_zeroFreeRegion` | `ℚ(√5)` at `0`; `ψ = 1` at `1` | simple zero at `0` excluded iff `c < log 45 = 3.806662`; order `−1` at the pole | sound | none |
| `riemannZeta_zeroFreeRegion` | `s = −2` | excluded iff `c < 3 log 3 = 3.295837` | sound | none |
| `dirichletLFunction_zeroFreeRegion` | principal mod `2` | region bound `0.69343` at `ρ = 0` | sound | none |
| `neg_re_logDeriv_riemannZeta_le` | `δ ≥ 1`; `δ = 2\|t\|`, `t → 0` | left side `≤ −ζ'/ζ(2) = 0.56996`; `Re 1/(2\|t\| + 2it) = 1/(4\|t\|)` | sound | none |
| `riemannVonMangoldt` | `T = 100` | `28.127344 + 7/8 = 29.0023` against `29` | sound | none |
| `riemannVonMangoldt_heckeLFunction` | `ℚ(i)`, `T = 100` | `156.636494 = 56.254687 + 100.381807` | sound | none |
| `riemannVonMangoldt_dirichlet` | BMOR at `q = 3`, `T = 2` | `0.247 log 6 + 6.894 = 7.3366 = 4.0946 log 6` | sound | none |
| `chebyshevPsi_explicitFormula` | `2 ≤ T ≤ x` | `log x ≤ 1.4427 log² x ≤ 1.4427 x log² x/T`; `\|x^ρ/ρ\| ≤ x/T` at `\|γ\| = T` | sound | none |
| `riemannZeta_weilExplicitFormula` | shift `(2) → (−1)`; `φ̌` | residues `+m_ρ φ̃(ρ)`, `−φ̃(0)`, `−φ̃(1)`; `∫_{(−1)} = ∫_{(2)} −Λ'/Λ(u) φ̃(1−u)`; `φ̃(1−s)` by `y = 1/u` | sound | none |
| `primeIdealCount_effective` | `ℚ`, `x = 10⁶` | `78498` against `Li = 78626.504` | sound | none |
| `rayClassPrimeCount_effective` | `ℚ`, `(3)∞`, `x = 10⁶` | `39231`, `39266` against `39313.252` | sound | none |
| `primeCounting_progression_effective` | `q = 4`, `x = 10⁶` | `a = 1`: `39175`; `a = 3`: `39322`; `Li/2 = 39313.252` | sound | none |
| `frobeniusPrimeCount_effective_abelian` | `ℚ(i)/ℚ`, conjugation | `39322` against `39313.252` | sound | none |
| #1907 against #1913 (R01) | the three shared names | conjoined clauses; `c` before `K` at `(n : ℕ)`; `Type` against `Type*` | order unstated | R01 |

## Not verifiable

- **Paywalled books, cited by locator.** These were not read, and no legal open copy is known:
  - Davenport §§11–20 (0.3, 5.3, 5.5, 5.6, 6.2–6.4 at `ℚ`, 8.2–8.7);
  - Titchmarsh §§5.1 and 9.2–9.4, Theorems 9.2 and 9.4, p. 214 (3.3, 4.5, 7.3, 7.4, 7.6);
  - Iwaniec–Kowalski §§5.1–5.2 (Layer 2 and 3.3–3.4);
  - Lang, XVII §3, Theorem 3.1 (8.4).

  The mathematics of each sampled target was recomputed instead (table above).
- **Lagarias–Montgomery–Odlyzko 1979, Lemma 2.3.** Settled as uncertified. It was checked only through `kadiri2012` lines 65–73.
- **Lagarias–Odlyzko 1977, Theorems 1.3 and 9.2.** Paywalled; the locator is given and marked "Cited by locator".
- **PrimeNumberTheoremAnd Provenance table.** The cached `primenumbertheoremand` text is the repository README only (36 lines), so the listed declarations were not checked. The section prescribes nothing.

## Source issues

- **Error** in kadiri2012 at §1, (1.6), p. 2: the source says Lagarias–Montgomery–Odlyzko show that `L(s, χ, K)` has no zeros in (1.6), yet near the real axis (1.6) lies inside (1.5), where one zero is allowed; it should read "no zeros other than the possible exceptional zero of (1.5)"; affects nothing.
