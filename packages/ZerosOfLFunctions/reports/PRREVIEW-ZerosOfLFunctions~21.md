# Review of ZerosOfLFunctions (pull request #1913 at 6cd5747)

**Verdict:** needs changes

This is a full review: 276 lines of the folder changed since `6ffb97a`.

- **Previous findings.** Four of the five previous findings are repaired (R01, R02, R03, R05). Previous R04, the title, description and merge order of the pull request, is not repaired; it is carried here as R05.
- **Mathematics.** No P1 or P2 defect was found. All 17 theorems of `Suggested.lean` and the 15 sampled targets survived the adversarial pass.
- **Findings.** Five P3 findings, none blocking:
  - two targets restate theorems that are already at the Tau Ceti pin (5.4 with 1.1, and 8.9);
  - 7.3 relies on a pinned step that it does not cite;
  - 4.1 states an "iff" that fails at a pole, and 4.6 reuses the symbol `N`;
  - the carried pull-request metadata.
- **Gate.** The gate passes.

Paths: `TauCeti/…` is a file of the Tau Ceti pin `2fd255d9`, and `Mathlib/…` a file of the Mathlib pin. Other roadmap paths are on main (`9ce8311`) unless a pull request is named.

## R01 (P3) — 5.4 and 1.1 restate Tau Ceti's holomorphic logarithm

**Location.** `TauCetiRoadmap/ZerosOfLFunctions/README.md`:

- lines 1236–1240 (5.4): "consume `Complex.exists_continuousOn_eqOn_exp_comp` on `Set.univ` and upgrade continuity to holomorphy using local inverse branches of `exp`. This is an adapter: the cited theorem supplies a continuous lift, not an entire one";
- lines 527–531 (1.1): "*logGamma* `δ` is holomorphic on `S_δ`, since `exp` is a local biholomorphism".

**Claim.** The upgrade from a continuous lift to a holomorphic one is work to be done here.

**Witness.** `TauCeti.exists_differentiableOn_eqOn_exp_comp` (`TauCeti/Analysis/Complex/BranchLogRoot.lean:173`) elaborates as `IsSimplyConnected U → IsOpen U → DifferentiableOn ℂ g U → 0 ∉ g '' U → ∃ f, DifferentiableOn ℂ f U ∧ EqOn (exp ∘ f) g U`. Its docstring says that it adds holomorphy to Mathlib's continuous branch.

**Repair.**

1. In 5.4, take existence from `TauCeti.exists_differentiableOn_eqOn_exp_comp` at `U = univ`. Simple connectivity of `univ` comes from `Convex.contractibleSpace convex_univ` with `SimplyConnectedSpace.ofContractible`, as `BranchLogRoot.lean:203–205` does.
2. Keep as the 5.4 target only uniqueness modulo `2πiℤ`: two entire logarithms differ by a continuous function with values in `2πiℤ` on the connected `ℂ` (Mathlib `Complex.exp_eq_exp_iff_exists_int`, `Mathlib/Analysis/SpecialFunctions/Complex/Log.lean:172`).
3. In 1.1, cite the same theorem on `S_δ` with `g = Γ` for the holomorphy clause.
4. Add a bullet under "From Tau Ceti": holomorphic logarithms on simply connected open sets (`Analysis/Complex/BranchLogRoot.lean`), `TauCeti.exists_differentiableOn_eqOn_exp_comp`, for 1.1 and 5.4.

**Test.**

- My scratch file elaborates `IsSimplyConnected (Set.univ : Set ℂ)` from those two lemmas, so the cited theorem applies at `U = univ` with no adapter.
- AnalyticNumberTheoryPartI on main takes "the entire logarithm … from [ZerosOfLFunctions Layer 5]" (its `README.md` line 554). That citation still resolves to 5.4 after the repair.

## R02 (P3) — 8.9 restates Tau Ceti's integration by parts for `Li`

**Location.** `TauCetiRoadmap/ZerosOfLFunctions/README.md`, lines 2033–2034: "prove `Li x = x/log x − 2/log 2 + ∫_2^x (log t)^(−2) dt` by integration by parts."

**Claim.** This identity is a target of this roadmap.

**Witness.** `TauCeti.Real.logIntegral_eq_div_log_sub_add` (`TauCeti/Analysis/SpecialFunctions/LogIntegral.lean:180`) elaborates as `2 ≤ x → logIntegral x = x / log x − 2 / log 2 + ∫ t in 2..x, (log t ^ 2)⁻¹`.

**Repair.**

1. Cite the pinned theorem for the first identity, in 8.9, in its *Needs:* line and in the Arithmetic Dirichlet Series §6.2 bullet of the supplier contracts.
2. Keep as the 8.9 target only the second integration by parts and `Li x − x/log x ∼ x/log² x`. That asymptotic is not at the pin: the file has only `isLittleO_integral_inv_log_sq` (line 321), an `o(x/log x)` bound.

**Test.** At `x = 10` the pinned identity reads `5.120436 = 4.342945 − 2.885390 + 3.662881`. The remaining content is the second-order term: `Li x − x/log x` is `0.777491` against `x/log² x = 1.886117` at `x = 10`, and `159.356` against `117.882` at `x = 10⁴`.

## R03 (P3) — 7.3 identifies the argument variation with the winding number through no cited statement

**Location.** `TauCetiRoadmap/ZerosOfLFunctions/README.md`, lines 1641–1642: "`TauCeti.Contour.windingNumber_comp_eq_integral_logDeriv` identifies `(θ 4 − θ 0)/(2π)` with *divisorCount* `f U R` through 7.2." The *Needs:* line (1647–1648) cites only that theorem and the lift.

**Claim.** The two cited declarations give the identification.

**Witness.**

- `windingNumber_comp_eq_integral_logDeriv` equates the winding number of `h ∘ γ` with `(2πi)⁻¹ ∫ γ'·logDeriv h(γ)`.
- `exists_continuousOn_arg_lift_with_partition` (`Argument/Lift.lean:427`) builds `θ` as a sum of `Im log` of segment ratios.
- Neither mentions the other's quantity. The bridge is `TauCeti.Contour.integral_inv_sub_mul_deriv_eq_log_norm_add_I_mul_sum_log_im` (`Analysis/Contour/Winding/SegmentSum.lean:154`).

**Repair.**

1. Add to the 7.3 *Needs:* line and to the contour bullet of "From Tau Ceti":
   - `TauCeti.Contour.integral_inv_sub_mul_deriv_eq_log_norm_add_I_mul_sum_log_im`;
   - `TauCeti.Contour.windingNumber_eq_integral_of_avoidance` (`Winding/Number/Basic.lean:170`).
2. Add this sentence to the route: "on the closed image curve the log-norm term vanishes and the segment sum is `θ 4 − θ 0`".

**Test.** For `f z = z` on `Icc (−1) 1 ×ℂ Icc (−1) 1`:

- the lift increases by `2π`, and the segment sum gives `2π`;
- *divisorCount* is `1`, and the winding number is `1`.

## R04 (P3) — 4.1 states an "iff" that fails at a pole, and 4.6 reuses `N`

**Location.** `TauCetiRoadmap/ZerosOfLFunctions/README.md`:

- lines 1053–1054 (4.1): "`zeroCount f U R` is monotone in `R` where the divisor is nonnegative, and unchanged under enlargement exactly when the divisor vanishes on the difference";
- line 1159 (4.6): "`n(r) log (R/r) ≤ N(R) − N(r)`".

**Claim.**

- The 4.1 bullet holds as written.
- `N` in 4.6 is the log-counting function.

**Witness.**

- **The "iff" fails at a pole.** Take `f z = 1/z`, `U = ℂ` and `R = ∅ ⊆ R' = {0}`. Both counts are `0`, since `(−1).toNat = 0`, yet the divisor on the difference is `−1 ≠ 0`.
- **Monotonicity needs finite support.** Take `f z = sin (π z)`, `R = {0}` and `R' = ℝ`. The counts are `1`, then `0`, the finsum junk value.
- **The symbol clashes.** In 4.5 (line 1133), `N(T)` is defined as the critical-strip count.

**Repair.**

1. In 4.1, replace the bullet with: "For `R ⊆ R'` with `R'` bounded and `f` meromorphic on an open set containing its closure, `zeroCount f U R ≤ zeroCount f U R'`, with equality exactly when the divisor takes no positive value on `R' \ R`."
2. In 4.6, write `ValueDistribution.logCounting f 0` in place of `N`.

**Test.**

- With `f = 1/z`, the divisor takes no positive value on `{0}`, and the two counts are equal.
- With `f = z`, it takes the value `1` at `0`, and the counts are `0` and `1`.
- `sin (π z)` is excluded by boundedness.

## R05 (P3) — The title, description and merge order of the pull request are stale, and no order is stated against #1907 (previous R04, not repaired)

**Location.** The title of the pull request reads "effective statements under the exclusion of Landau–Siegel zeros". The description speaks of "no case split on a zero that does not exist" and says to merge "after AnalyticNumberTheoryPartI (#1126) lands, since the strengthened statements refer to its §0.34."

**Claim.** The head restates the roadmap without exceptional zeros and depends on AnalyticNumberTheoryPartI.

**Witness.**

- README lines 87–89 exclude "the nonexistence of exceptional zeros", and lines 2144–2145 keep "the exceptional-zero alternative of 6.3–6.4".
- No line of the head cites §0.34.
- `overlaps.md` reports that #1907 and #1913 conflict in both files.

**Repair.**

1. Retitle the pull request, and describe this head:
   - general-field headlines at the pin;
   - pinned 3-4-1, Dedekind and reciprocity contracts;
   - the functional-equation proof of `Re b`;
   - ids 0.1–0.4 and 2.1–2.5.
2. Delete the merge-order sentence; AnalyticNumberTheoryPartI is on main.
3. State which of #1913 and #1907 is rebased on the other.

**Test.**

- The description agrees with README lines 87–89.
- After the rebase, `overlaps.md` lists no conflict.

## Previous findings (PRREVIEW-ZerosOfLFunctions~20)

- **R01 — repaired.**
  - Lines 281–301 add both "From Tau Ceti" bullets, naming `threeFourOneCombination_nonneg`, `vonMangoldt_re_nonneg`, `vonMangoldt_im`, `hasSum_idealTerm_vonMangoldt` and the four reciprocity declarations.
  - Lines 377–379 now read "The `3-4-1` combination of Layer 7 and the Dedekind identities of Layer 8 are at the pin and listed under Tau Ceti."
  - Lines 387–390 reduce Class Field Theory to one sentence.
  - The 6.1 *Needs:* (1380–1391), the 8.3 *Needs:* (1790–1791), the 8.8 *Needs:* (2015–2018) and the Layer 6 and 8 Dependencies cite the pinned names.
  - 6.1 takes `z = χ(𝔞) 𝔑𝔞^{−it}`.
- **R02 — repaired.**
  - Lines 1268–1280 prove `Re b = −∑ m_ρ Re (1/ρ)` from `HasFunctionalEquation.eventuallyEq`, `dual_completed` and `polarOrder_one_sub_conj`, "for every member of the two families, real or not".
  - The `e^s · zetaEntireCompletion` counter-check is at lines 1300–1303.
  - 6.4(4d) now refers to 5.6 (lines 1501–1502).
- **R03 — repaired.**
  - Headings `### 0.1`–`### 0.4` and `### 2.1`–`### 2.5` exist, and each keeps its Checks.
  - `Suggested.lean` lines 69 and 82 name 0.1 and 0.2.
  - The diff of headings against main adds ids and drops none.
- **R04 — not repaired.** Carried as R05.
- **R05 — repaired.** Lines 2006–2010 and 2205–2209 give "Theorem 1.3, deduced from their Theorem 9.2 … cited by locator", with the hypothesis `log x ≫ n_L (log d_L)²`.

## Verified sound

### Gate, dependency check and elaboration

- **Gate.** My run printed every check at 0, ending `stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`, and exited 0. The worker's gate, which includes `build=0`, also passes.
- **Outside the folder.** `git diff --stat origin/main...HEAD` outside the folder is empty.
- **Dependency check.** It exits 0 and prints no UPWARD, CYCLE or `moved:` line:

```text
depcheck: 238 roadmaps, 2310 edges, 0 problem(s)
```

- **Merge order.** `ORDER.txt` places LFunctions at line 27 and ZerosOfLFunctions at line 48. The other suppliers are on main under `Completed/` or `TauCetiRoadmap/ClassFieldTheory`.
- **Elaboration.** `lake env lean TauCetiRoadmap/ZerosOfLFunctions/Suggested.lean` exits 0 with exactly 17 "declaration uses `sorry`" warnings (lines 97–337). There are 20 declarations: 3 definitions with real bodies and 17 theorems.
- **`#check` comparison.**
  - I put `#check @name` for all 20 declarations in one scratch copy. Every elaborated type matches its README statement and `signatures.md`.
  - The file has no `variable` block, so no binder can be lost.
  - The general-field theorems quantify `∀ K : Type u_1`. `frobeniusPrimeCount_effective_abelian` carries `[IsAbelianGalois K L]`.
- **Padding probe.** I decided it by reading the statements and the pin.
  - Every theorem is existential over an analytic constant or a deep identity.
  - The `ℚ` instances (`riemannZeta_zeroFreeRegion`, `riemannVonMangoldt`, `primeCounting_progression_effective`) need bridges and extra facts, so none is a one-step specialization. Examples: `ζ` has no zero in `(0, 1)`; the one-sided count needs symmetry; the absolute `c` is a stronger quantifier order than 8.7's.

### Library declarations opened this round (50)

**Tau Ceti.**

- **The 3-4-1 combination and von Mangoldt.**
  - `TauCeti.LSeries.threeFourOneCombination` and `_nonneg` (`NumberTheory/LSeries/ThreeFourOne.lean:59, 107`);
  - `TauCeti.IdealArithmeticFunction.vonMangoldt_im` and `vonMangoldt_re_nonneg` (`ArithmeticDirichletSeries/VonMangoldt.lean:158, 164`);
  - `TauCeti.hasSum_idealTerm_vonMangoldt` (`Prime/DedekindZeta.lean:69`). Its target is Mathlib's `NumberField.dedekindZeta`, elaborated.
- **Admissible moduli and reciprocity.**
  - `IsAdmissibleModulus`, `abelianConductor` and `isAdmissibleModulus_abelianConductor` (`ClassFieldTheory/Global/AdmissibleModulus/Basic.lean:161, 193, 208`; `K L : Type`);
  - `rayClassArtinMap`, `_surjective` and `_idealClass` (`Reciprocity.lean:128, 161, 216`; `[IsAbelianGalois K L]`, conclusion `ConjClasses.mk (…) = NumberField.artinSymbol I hur`).
- **The R01 and R02 witnesses.**
  - `TauCeti.exists_differentiableOn_eqOn_exp_comp` (`Analysis/Complex/BranchLogRoot.lean:173`);
  - `TauCeti.Real.logIntegral`, `logIntegral_eq_div_log_sub_add`, `logIntegral_isEquivalent_div_log` and `isLittleO_integral_inv_log_sq` (`LogIntegral.lean:141, 180, 277, 321`).
- **The analytic records.**
  - The structure `AnalyticLFunctionData` (`#print`: fields `coeff`, `conductor : ℕ+`, `gammaR`, `gammaC`, `rootNumber`, `completed`, `polarOrder : ℂ →₀ ℕ`);
  - `degree = card gammaR + 2 card gammaC`, `gammaFactor` and `dual` (`Data/Basic.lean:106, 111, 122`; `dual.polarOrder = mapDomain conj`);
  - `dual_completed` (`:147`), `HasDirichletAgreement` (`:174`), `HasMeromorphicContinuation` (`:183`), `HasFunctionalEquation` (`:193`) and `HasFunctionalEquation.eventuallyEq` (`:269`).
- **Contour integration.**
  - `argumentPrinciple_nullHomologous` (elaborated: `S : Finset ℂ`, `ord`, a closed curve avoiding `S`);
  - `exists_continuousOn_arg_lift_with_partition` (`Argument/Lift.lean:427`);
  - `windingNumber` (`Winding/Number/Basic.lean:76`) and `windingNumber_eq_integral_of_avoidance` (`:170`);
  - `integral_inv_sub_mul_deriv_eq_log_norm_add_I_mul_sum_log_im` (`Winding/SegmentSum.lean:154`);
  - `windingNumber_comp_eq_integral_logDeriv`, `isNullHomologous_iff` and `residue_logDeriv_eq_meromorphicOrderAt` (elaborated);
  - `IsPiecewiseC1On` (elaborated).
- **Other modules, located by grep.**
  - `finiteEulerCorrection` (`LFunctions/DedekindZeta/PartialZeta.lean:198`);
  - `tendsto_frobeniusPrimeCount` and `hasNaturalDensity_frobeniusPrimeSet` (`Chebotarev/PrimeCounting/FrobeniusPrimeCount.lean:91, 108`);
  - `HeckeRing.GL2.Newform.analyticConductorAt` and `_eq` (`ModularForms/Newforms/AnalyticInvariants.lean:125, 133`).
- **Not duplicated at the pin.** Tau Ceti's rectangles (`Analysis/Green/Division/Rectangle.lean:28`, `Cell.lean:202`) are Green-theorem cells, not a parametrized boundary curve, so 7.1 duplicates nothing.

**Mathlib.**

- `PhragmenLindelof.vertical_strip`. It takes the same constant `C` on both edges and growth `O(exp(B exp(c|Im z|)))` with `c < π/(b − a)`, so 3.2's "normalize the edge bounds" is required.
- `ValueDistribution.logCounting` (`Analysis/Complex/ValueDistribution/LogCounting/Basic.lean:351`); the divisor `logCounting` (`:97`), which adds `D 0 · log r`; and `log_counting_zero_sub_logCounting_top` (`:403`).
- `Complex.exists_continuousOn_eqOn_exp_comp` (`Analysis/Complex/BranchLogRoot.lean:39`), `Complex.exp_eq_exp_iff_exists_int` (`SpecialFunctions/Complex/Log.lean:172`), `Convex.contractibleSpace` (`Analysis/Convex/Contractible.lean:36`) and `SimplyConnectedSpace.ofContractible` (`SimplyConnected.lean:82`).

### Names elaborated

My probe file holds 177 `#check` lines: 20 declarations of this file, 40 fully qualified Tau Ceti names, and the Mathlib and short-form names of the README.

- 163 elaborate.
- 9 failures are short field names, such as `HasFunctionalEquation.polarOrder_one_sub_conj`. They elaborate under `TauCeti.LFunctions.AnalyticLFunctionData` in a second probe of 11 checks.
- 5 failures are in modules I did not import, and I located each by grep above.
- A grep of both pins finds no elementary factor, `zeroCount`, `OrderLE`, rectangle-boundary curve or second-order `Li` expansion.

### Cross-roadmap citations resolved

- **L-functions** (main).
  - 21 cited names occur in its `Suggested.lean`, among them `heckeLFunction_ne_zero_of_one_le_re`, `completedHeckeLFunction_one_sub_eventuallyEq` and `three_four_one_nonneg` (line 2685, `0 ≤ 3 + 4 cos θ + cos 2θ`).
  - All six `Grossencharacter.*` leads of `citations.md` occur there, under `namespace Grossencharacter`.
  - Its `README.md` lines 1593–1597 close the Dedekind facts by citation of Tau Ceti, as this head now does.
  - `dedekindZetaData` has conductor `|discr K|` (line 1056), and `heckeData` has `|discr K| · 𝔑𝔣` (line 1636), as 2.5 says.
- **Other suppliers on main.**
  - Global Number Fields: Layers 2 and 9, and inline 3E (line 393).
  - Chebotarev: Layers 2, 11, 13 and 14 (lines 175–612).
  - Class Field Theory: Layer 12 (line 1724).
  - Number Field Arithmetic: 2.3 (line 647).
  - Arithmetic Dirichlet Series: 2.3, 6.2, 6.4 and Layers 6, 9 and 10.
- **The other seven `citations.md` leads** are PrimeNumberTheoremAnd names of the Provenance table.

### Ownership and overlaps

- **Ownership.** `roadmaps grep` over main and the 460 open heads finds the following objects only in this roadmap, in #1907 (the same roadmap) and in later consumers: `def OrderLE`, `def zeroCount`, `zetaEntireCompletion`, `analyticConductorAt`, `riemannVonMangoldt`, `heckeLFunction_zeroFreeRegion`, `IsExceptionalZero`, `rectBoundary`, `HasZerosInRects`, `hadamard_of_orderLE_one`, `primeIdealCount_effective` and `frobeniusPrimeCount_effective`.
  - The later consumers are ExplicitZetaBounds #1954, ExplicitNumberFields #1944, ExplicitPrimeCounting #1945, AnalyticNumberTheoryPartIII #2008 and ComputationalNumberTheory #1408, at `ORDER.txt` lines 265–272.
  - For example, AnalyticNumberTheoryPartIII's `README.md` line 368 cites this roadmap's §7.1 *rectBoundary*.
- **Dropped ids.** None. AnalyticNumberTheoryPartI on main cites ZerosOfLFunctions 0.1–0.2, 1.2–1.4, 3.3–3.4, Layer 4, 5.2–5.6, 6.2–6.4, 6.4b–d, 7.4 and 8.2–8.8, and all of these exist at this head. Its "4.5–4.8" (line 809) is already dangling on main, which has no 4.7 or 4.8, so it is not this pull request's matter.
- **AnalyticNumberTheoryPartI's §0.34.** Its claim to own the uniform exclusion of Landau–Siegel zeros is that roadmap's matter. This README neither cites nor endorses it.

### Sources: seeded sample and locators

- **0.4, 2.5, 3.2, 4.1, 4.6, 5.2, 5.4, 7.1 and 8.9.** These cite no external text. I checked them against the pinned declarations above, and against the L-functions records for 2.5.
- **1.3.** `dlmf5` lines 490–492 (5.11.9: the modulus of `Γ(x + iy)` is asymptotic to `√(2π)|y|^{x−½}e^{−π|y|/2}`) and line 524 (uniform for bounded `x`). The `O(1/|t|)` remainder needs 5.11.1, at lines 104–108 (sector `|ph z| ≤ π − δ`), with the bounds of §5.11(ii) at lines 563–569. The README cites both.
- **1.5.** `dlmf5` 5.11.9 as above. The rate `πn/4` uses `degree = card gammaR + 2 card gammaC` (`Data/Basic.lean:106`).
- **3.4.** Iwaniec–Kowalski §5.2 is paywalled; see "Not verifiable". I recomputed the exponent below.
- **5.6.** `kadiri2012` lines 230–237 (§2.1.2) give the real-part formula with `½ log d_K`, `Re 1/s` and `Re 1/(s − 1)`. Davenport §12 is paywalled, and I recomputed `B` below.
- **6.4.** `kadiri2012` lines 65–73 report Lagarias–Montgomery–Odlyzko Lemma 2.3, as (1.5)–(1.6) with `A(χ) = d_K N(𝔣)`.
- **7.5.** I checked it as a headline.
  - `bennett2021` lines 56–58 and 83–84: Corollary 1.2 counts zeros with `0 < β < 1` and `|γ| ≤ T`, for `q > 1` and `T ≥ 5/7`, with error `min{0.247 log qT + 6.894, …}`.
  - `hasanalizade2022` lines 26–27 and 63–65: Corollary 1.2, for `T ≥ 1`, with `0.228(log d_K + n_K log T) + 23.108 n_K + 4.520`.
- **7.3 and 7.6.** Titchmarsh is paywalled. I recomputed the values below.
- **Unverified flags.** The README flags no locator as unverified.

### Adversarial table

The values were computed this round with Python scripts, Lean `#check`, and by hand where shown.

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| 0.4 (sample) | the constant `1`; `exp(−s²)` at `s = it`; a pole at `1 + 5i` | `C = 1`, `A = 0`, `T₀ = 0`; norm `exp(t²)` (`e^100` at `t = 10`) beats every `C(1 + t)^A`; the pole forces `T₀ > 5`; sum constants `C₁ + C₂` with exponent `max` | sound | none |
| 1.1 (holomorphy clause) | `logGamma δ 3`; `Γ(10i)` | `log 2 = 0.693147`; `arg Γ(it) ≈ t log t − t − π/4`, so the principal log jumps; the holomorphy clause is pinned | duplicate | R01 |
| 1.3 (sample) | `σ = ½`, `t = 10, 40`; `σ = 2`, `t = 10, 40` | exact `−14.789025` and `−61.912915` equal the main term; `−11.330172` against `−11.335147` (difference `0.0498/t`); at `t = 40`, difference `0.0125/t` | sound | none |
| 1.5 (sample) | `gammaR = {0, 1}` against `gammaC = {0}` | `A(σ) = (σ−1)/2 + σ/2 = σ − ½`; rate `2·π/4 = π/2`; poles at every nonpositive integer, order `1` | sound | none |
| 2.1–2.4 (changed) | `gammaC = {0}` at `0`; the `ζ` centre; `Δ` (`k = 12`, `N = 1`) | `3·4 = 12`; `7/2`; `(6 + 3)(7 + 3) = 90 = analyticConductorAt f 6`; unshifted `15.75` | sound | none |
| 2.2 | `ζ` on `[−5, 5]` | `C₁ = 1`, `C₂ = 8/3 = 2.6667` | sound | none |
| 2.5 (sample) | `ℚ(i)`; the odd character `(4)∞` | `4·3·4 = 48`; `4(1 + 3) = 16`; L-functions conductors `\|discr\|` and `\|discr\| 𝔑𝔣` | sound | none |
| 3.1 | `R = 0`, `c = α = 1`; `exp(sin πs)` | `E₁(1) = 0.219384 < e^{−1} = 0.367879 ≤ Γ(1) = 1`; `log ‖g(½ + it)‖ = cosh πt` | sound | none |
| 3.2 (sample) | Mathlib's hypotheses | same `C` on both edges; `c < π/(b − a)`; `(1 + ‖s‖)^A ≪ exp(c\|t\|)` | sound | none |
| 3.4 (sample) | the exponent at `σ = −δ`, `½`, `1 + δ`; `χ₄` at `2` | `½ + δ`, `¼ + δ/2`, `0`; `P = X − 2` gives order `1 = 0 + 1`; `P = 0` gives `⊤` | sound | none |
| 3.5 | `‖Λ(2m + 2i)‖`, `m = 10, 20` | `3.676797`, `13519751.81` (the README says `3.67680`, `13519751.81`) | sound | none |
| 4.1 (sample) | `z(z − 1)`, `z/(z − 1)`; `1/z` with `∅ ⊆ {0}`; `sin πz` with `{0} ⊆ ℝ` | `2`; `1` against signed `0`; counts `0 = 0` with divisor `−1`; counts `1`, then `0` | iff false | R04 |
| 4.3 | `z`; `z/10`; `1 − z/2` | trailing bound `2`; `3.321928`, scaled `2.321928`; `1.709511` | sound | none |
| 4.6 (sample) | `z`, `1/z`, `z²` | `log r` (via `D 0 · log r`); signed `−log r`; `2 log r`; `N(R) − N(r) − n(r) log(R/r) = ∑_{r<\|z\|≤R} m log(R/\|z\|) ≥ 0` | symbol clash | R04 |
| 5.2 (sample) | `z = −½`; `z = 1` | `‖E₁ − 1‖ = 0.090204 ≤ 0.125`; genus `0` gives `0.5`; `E₁'(1) = −e` | sound | none |
| 5.4 (sample) | a nonvanishing entire `g` | existence is the pinned `exists_differentiableOn_eqOn_exp_comp` at `univ` | duplicate | R01 |
| 5.6 (sample) | `ζ`; `e^s ζE`; `χ₄` | `B = −0.0230957`; `\|f(0)\| = 1 ≠ \|f(1)\| = 2.718282`, so no unimodular `κ` exists; `Λ(χ₄, 0) = Λ(χ₄, 1) = ½`; `b + conj b` route rederived | sound | none |
| 5.6a | the first zero pair | `2/(1 + 14.134725²) = 0.0099606` | sound | none |
| 6.1 | `z = χ(𝔞)𝔑𝔞^{−it}`, `‖z‖ = 1` | `χ²` term `z²`; the pinned combination is `3 + 4 Re z + Re z²` | sound | none |
| 6.4b | `(2)` over `ℚ` at `s = 2` | `log 2/3 = 0.231049` | sound | none |
| 6.4d | `δ = 2\|t\|`, `t = 0.01`; `ζ_K` at `0` | `Re 1/(2\|t\| + 2it) = 25 = 1/(4\|t\|)`; `3^{r₁}12^{r₂}\|d_K\|` | sound | none |
| 7.1 (sample) | the unit square | winding `1` about `½ + i/2`, `0` about `2`; `rectBoundary R 1 = σ₂ + it₁` | sound | none |
| 7.3 (sample) | `ζ(2 + it)`; `T → 0⁺`; `f z = z` | `Re ≥ 2 − ζ(2) = 0.355066`; `S → −1`, consistent with `N = θ/π + 1 + S`; lift `2π` against winding `1`, bridge uncited | step uncited | R03 |
| 7.5 | the record `ζ(s)(1 + 5·2^{−s} + 2·4^{−s})` | zeros at `Re s = 2.189525` and `−1.189525`; `2^s + 5 + 2·2^{−s}` is symmetric under `s ↦ 1 − s` | sound | none |
| 7.6 (sample) | the averaged count | `∫₀ᵀ(N(t + 1) − N(t)) = ∫_T^{T+1} N − ∫₀¹ N`, and `∫₀¹ N = 0` for `ζ`; limit `n/(2π)` | sound | none |
| 8.3 | `ℚ`; `ℚ(√5)`; `ℚ(i)` at `x = 2` | `c_ℚ = −log 2π = −1.837877`; order `1 = r₁ + r₂ − 1`; trivial terms `0.693147 = −log(1 − ½)` | sound | none |
| 8.7 | `ℚ`, `(3)∞`; `ℚ(√−5)` | `#Cl = 2`, main `1/3` for all ideals; `x = 2^{1/β}`: `Li 2 = 0` | sound | none |
| 8.9 (sample) | `x = 10`, `10⁴` | `5.120436 = 4.342945 − 2.885390 + 3.662881` (pinned); `0.777491` against `1.886117`; `159.356` against `117.882` | duplicate | R02 |
| `dirichletLFunction_convexity` | `q = 1`, `t = 0` | `‖ζ(½)‖ = 1.46035 ≤ C·3^{¼+ε}`; uniform over primitive `χ` | sound | none |
| `hadamard_of_orderLE_one` | `1 − s`; `exp`; `ρ = 0` | `a = 0`, `b = −1`; `b = 1` with an empty product; exponent `0`, factor `1` | sound | none |
| `zetaEntireCompletion_hadamard` | `s = 0` | `ζE(0) = 1`; `B = −0.0230957` | sound | none |
| `riemannZeta_zeros_summable_ordinate` | `−2` | divisor of `completedRiemannZeta` at `−2` is `0`; first pair `0.0099606` | sound | none |
| `heckeLFunction_zeroFreeRegion` | `ℚ(i)`, `ψ = 1`, `t = 10`; `ζ_K` at `0` | coordinate `6.516193`, analytic `6.520022`, LMO `6.356108`; nesting `1.261860 < 1.27`; `0` is excluded once `c < n log 3` | sound | none |
| `riemannZeta_zeroFreeRegion` | `s = −2` | excluded iff `c < 3 log 3 = 3.295837` | sound | none |
| `dirichletLFunction_zeroFreeRegion` | principal mod `2`; imprimitive `χ` | `L(0) = 0` lies outside `Re ≥ ½`; `log q* ≤ log q`, so the region nests in the source's | sound | none |
| `neg_re_logDeriv_riemannZeta_le` | `δ ≥ 1`; `t → 0` | left side `≤ 0.569961`, right side `≥ −1 + C log t₀`; `1/(4\|t\|)` | sound | none |
| `riemannVonMangoldt` | `T = 100` | `28.127344 + 7/8 = 29.0023`, against `N(100) = 29` | sound | none |
| `riemannVonMangoldt_heckeLFunction` | `ℚ(i)`, `T = 100` | `156.636494 = 56.254687 + 100.381807`; halving costs `22.06`; the open strip is HSW's `0 < β < 1` | sound | none |
| `riemannVonMangoldt_dirichlet` | BMOR at `q = 3`, `T = 2` | `7.336565 ≤ 4.0946 log 6` | sound | none |
| `chebyshevPsi_explicitFormula` | `x ≥ 2`, `T ≤ x` | `log x ≤ 1.443 log² x ≤ 1.443 x log² x / T` | sound | none |
| `riemannZeta_weilExplicitFormula` | the Mellin transform of `φ̌`; the `½ log d_K` term | `φ̃(1 − s)` by `u = 1/y`; `(log d_K) φ(1) = 0` at `ℚ` | sound | none |
| `primeIdealCount_effective` | `ℚ`, `x = 10⁶` | `78498` against `Li = 78626.504` | sound | none |
| `rayClassPrimeCount_effective` | `ℚ`, `(3)∞`, `x = 10⁶` | `39231`, `39266` against `39313.252` | sound | none |
| `primeCounting_progression_effective` | `q = 4`, `x = 10⁶` | `a = 3`: `39322`; `a = 1`: `39175`; `Li/2 = 39313.252` | sound | none |
| `frobeniusPrimeCount_effective_abelian` | `ℚ(i)/ℚ`, conjugation | `39322` against `½ Li = 39313.252` | sound | none |

## Not verifiable

- **Paywalled books, cited by locator.** These were not read:
  - Davenport §§11–20 (5.3, 5.5, 5.6, 8.2–8.7; the values were recomputed instead);
  - Titchmarsh §§5.1 and 9.2–9.4, Theorem 9.4, p. 214 (3.3, 7.3, 7.4, 7.6);
  - Iwaniec–Kowalski §§5.1–5.2 (Layer 2 and 3.4);
  - Lang, XVII §3, Theorem 3.1 (8.4).
- **Lagarias–Montgomery–Odlyzko 1979, Lemma 2.3.** It is settled as uncertified, and was checked only through `kadiri2012` lines 65–73.
- **Lagarias–Odlyzko 1977, Theorems 1.3 and 9.2.** The text is paywalled; the locator is given and marked "Cited by locator".
- **PrimeNumberTheoremAnd Provenance table.** The cached `primenumbertheoremand` text is the repository README only, and the section prescribes nothing.

## Source issues

- **Error** in kadiri2012 at §1, (1.6), p. 2: the source says Lagarias–Montgomery–Odlyzko show that `L(s, χ)` has no zeros in (1.6), yet near the real axis (1.6) contains region (1.5), where one zero is allowed; it should read "no zeros other than the possible exceptional zero of (1.5)"; affects nothing.
