# Review of ZerosOfLFunctions (pull request #1913 at ee070bf)

**Verdict:** needs changes

:robot: AI-assisted review (Claude Opus 5.5). This is an incremental re-review of the 58 README lines that changed since `820a878`. `Suggested.lean` and every file outside the folder are unchanged. R01 and R02 of the previous review are repaired. R03 is only partly repaired: the hand-written part of the description is fixed, but the generated `roadmap-summary` block is not, and it comes back below as the one finding (P3). Nothing is blocking. The gate passes. What was checked is listed under *Verified sound*.

## R01 (P3) — The `roadmap-summary` block still presents main's Layer 6–8 headlines as new

**Location.** The pull-request description, in the generated block `roadmap-summary`, which says: "Layers 6–8 gain general number-field headline statements for zero-free regions, Riemann–von Mangoldt counts, Weil formulas, ray-class prime counts and abelian Chebotarev" and "Effective counts now use `TauCeti.primeCount` and `TauCeti.Real.logIntegral`, with ray-class error width depending only on degree."

**Claim.** Re-raised from R03 of the previous review. No repair report marks it `not actionable in this package`.
- Only the Weil formulas are new headlines. Main already states `heckeLFunction_zeroFreeRegion`, `riemannVonMangoldt_heckeLFunction`, `rayClassPrimeCount_effective` and `frobeniusPrimeCount_effective_abelian`, with the same Lean statements.
- Main's docstring already ran the 7.5 counts over the open strip.
- The effective counts keep main's carriers and main's `TauCeti.Real.logIntegral` main term. `rayClassPrimeCount_effective`, and with it the error width, is unchanged.
- The hand-written paragraph already says all of this correctly. The block contradicts it.

**Witness.** `git diff origin/main...HEAD -- TauCetiRoadmap/ZerosOfLFunctions/Suggested.lean` adds only `riemannZeta_zeros_summable_ordinate`, `neg_re_logDeriv_riemannZeta_le`, `dedekindZeta_weilExplicitFormula` and `heckeLFunction_weilExplicitFormula`. In `origin/main`'s Suggested.lean, `TauCeti.Real.logIntegral` occurs 6 times.

**Repair.** Regenerate `roadmap-summary` so that:
- its Layers 6–8 sentence names only the Weil formulas of 8.4 and 8.6 as new headline statements;
- its effective-count sentence says that README 8.5 and 8.7 identify the counts with `TauCeti.primeCount`, while the Lean statements keep main's `Set.ncard` and `Nat.primesBelow` carriers and main's `Li` main term. Dropping the sentence also works.

Tested against the `git diff` above and against the hand-written paragraph "Suggested.lean adds four theorems …". Both agree with the block once it says this.

## Previous findings

- R01 — repaired. README lines 1300–1316 now have one **Checks.** list, after the *Needs:* line, with five bullets. The duplicate bullet is gone: "The `ζ` record, `polarOrder = single 0 1 + single 1 1`, with `U = ∅` … so the restriction to `U` is needed."
- R02 — repaired. Line 363 has "`dirichletData_dual` (the dual record is `dirichletData χ⁻¹ hχ.inv`, the record of the inverse character)". Line 421 has "`TauCeti.Real.isLittleO_integral_inv_log_sq` (the remainder `∫ t in 2..x, (log t)^(−2)` … is `o(x/log x)`, for 8.9)".
- R03 — partly repaired. The description now says "Suggested.lean adds four theorems", and that the effective counts keep `Set.ncard` and `Nat.primesBelow`. The `roadmap-summary` block still says "Layers 6–8 gain … zero-free regions, Riemann–von Mangoldt counts, … ray-class prime counts and abelian Chebotarev" (R01 above).

## Verified sound

### Gate, dependency check, elaboration

- **Gate, re-run at `ee070bf`:** `gate ZerosOfLFunctions: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`.
  - The worker's run, which includes the targeted build, also reports `build=0`.
- **Dependency check:** `depcheck: 236 roadmaps, 2134 edges, 0 problem(s)`. There is no UPWARD or CYCLE line.
- **Outside the folder:** `git diff --stat origin/main...HEAD` lists nothing.
- **Elaboration:** `lake env lean TauCetiRoadmap/ZerosOfLFunctions/Suggested.lean` exits `0` with exactly 23 ``declaration uses `sorry` `` warnings, at lines 103–477, one per theorem.
- **Signatures:** `git diff 820a878 HEAD` leaves `Suggested.lean` unchanged. A scratch file with `#check @…` for all 27 declarations (4 definitions, 23 theorems) elaborates with no error. The file still has no `variable` or `include` line.
- **Padding probe:** carried from the previous report, since the Lean is unchanged. `first | rfl | simp | infer_instance | norm_num | positivity` closes 0 of the 23 theorems.

### The changed contract passages

All 20 declarations that the diff adds to "Exact supplier contracts" elaborate in one `#check` file at the pins (Mathlib `1b1ccf4`, Tau Ceti `2fd255d`). Each gloss matches the pinned signature, and each is cited in the section the contract names.

| Name | At the pin | The gloss against the signature | Used at |
| --- | --- | --- | --- |
| `Asymptotics.IsBigO`, `Bornology.cobounded` | `Topology/Bornology/Basic.lean` (class field) | `OrderLE` is `f =O[Bornology.cobounded ℂ] …` (`Suggested.lean:79`) | 0.1, *Needs:* line 585 |
| `Differentiable.apply_eq_apply_of_bounded` | `Analysis/Complex/Liouville.lean:117` | differentiable with bounded range implies constant | 0.1, the `A < 0` bullet |
| `meromorphicOrderAt_mul` | `Analysis/Meromorphic/Order.lean:466` | `MeromorphicAt f x → MeromorphicAt g x →` the order of `f * g` is the sum | 3.4, lines 1172 and 1184 |
| `Polynomial.rootMultiplicity` | `Algebra/Polynomial/Div.lean:502` | as used | 3.4, lines 1177 and 1184 |
| `TendstoLocallyUniformlyOn.differentiableOn` | `Analysis/Complex/LocallyUniformLimit.lean:136` | open `U`, `φ.NeBot`, eventually holomorphic terms; `U = univ` in 5.3 | 5.3, lines 1531 and 1536 |
| `Complex.GammaIntegral` | `Analysis/SpecialFunctions/Gamma/Basic.lean:110` | Euler's integral over `Ioi 0` | 1.2, *Needs:* line 753 |
| `Complex.differentiableAt_Gamma`, `Complex.Gamma_ne_zero` | `Gamma/Deriv.lean:75`, `Gamma/Beta.lean:427` | hypothesis `∀ m : ℕ, s ≠ −m`, that is off the nonpositive integers | 1.1, lines 701, 702 and 726 |
| `Complex.norm_cpow_eq_rpow_re_of_pos` | `Analysis/SpecialFunctions/Pow/Real.lean:337` | `0 < x → ‖(x:ℂ)^y‖ = x^(re y)` | 1.3a, lines 773 and 778 |
| `MeasureTheory.norm_integral_le_integral_norm` | `MeasureTheory/Integral/Bochner/Basic.lean:970` | as used | 1.3a, line 779 |
| `Real.Gamma_one`, `Real.Gamma_two` | `Gamma/Basic.lean:416`, `Gamma/BohrMollerup.lean:325` | `Γ(1) = 1`, `Γ(2) = 1` | 1.3a, lines 775 and 780 |
| `intervalIntegral.integral_mul_deriv_eq_deriv_mul` | `MeasureTheory/Integral/IntervalIntegral/IntegrationByParts.lean:141` | `HasDerivAt` on `[[a,b]]` plus interval-integrable derivatives | 8.9, line 2859 |
| `AnalyticLFunctionData.dual_completed`, `…dual_completed_apply` | `NumberTheory/LFunctions/Data/Basic.lean:147`, `:149` | `d.dual.completed = conj ∘ d.completed ∘ conj`, as functions and pointwise | 4.4 (lines 1379, 1397), the Layer 4 Dependencies (line 1489), 5.6 (lines 1595, 1616) |
| `dirichletData_dual` | `NumberTheory/LFunctions/Dirichlet/Basic.lean:122` | `(dirichletData χ hχ).dual = dirichletData χ⁻¹ hχ.inv` | 6.4a (lines 1967, 2072) |
| `TauCeti.Real.isLittleO_integral_inv_log_sq` | `Analysis/SpecialFunctions/LogIntegral.lean:321` | `(∫ t in 2..x, (log t ^ 2)⁻¹) =o[atTop] x / log x` | 8.9, lines 2849 and 2858 |
| `Modulus.finitePart`, `Modulus.infinitePart` | `NumberTheory/NumberField/Global/RayClass/Modulus.lean:98–104` | `Ideal (𝓞 K)` with the field `finitePart_ne_bot`; `Finset {w // w.IsReal}` | 8.6, line 2583; `heckeLFunction_weilExplicitFormula` uses `absNorm ψ.conductor.finitePart` and `ψ.conductor.infinitePart.card` |

Arithmetic Dirichlet Series §6.2 on main (its README line 264) states the transfers, including `Li(x) ∼ x/log x`. The new `isLittleO_integral_inv_log_sq` is the remainder lemma behind that transfer, so filing it under §6.2 is apt.

**Completeness.** I scanned every backticked name on a *Needs:* line of Layers 0–9 against the contract section. Every pinned Mathlib or Tau Ceti name is listed there. What remains are this roadmap's own headlines (`heckeLFunction_weilExplicitFormula`, `heckeLFunction_zeroFreeRegion`) and the notation `c_K`.

### 4.2, the merged Checks list

All five bullets were recomputed against the 4.2 statement and against each other. Four Tau Ceti facts were reopened for this:
- `riemannZetaData.polarOrder = single 0 1 + single 1 1` (`Data/RiemannZeta.lean:57`, `:79`);
- `dirichletData` has `polarOrder = 0` for `N ≠ 1` (`Dirichlet/Basic.lean:48`);
- `zetaEntireCompletion s = s(s−1)Λ₀(s) + 1` (`Suggested.lean:94`);
- algebra then gives `s(s−1)Λ₀ + 1 = s(s−1)Λ`.

The values are in rows 4.2 below. No instance appears twice.

### The seeded sample, where it meets the change

| Target | What the change touches | Checked | Result |
| --- | --- | --- | --- |
| 0.1 The order predicate | new contract entry "for 0.1" | Liouville at `Liouville.lean:117`; `OrderLE` at `Suggested.lean:79` uses `Bornology.cobounded ℂ`; the `A < 0` bullet recomputed (row 0.1) | sound |
| 0.2 The entire completion | the fifth 4.2 Check uses `zetaEntireCompletion` | `zetaEntireCompletion 1 = 1` recomputed | sound |
| 4.4 The local count for the two families | cites `dual_completed`, now in the contract | `Data/Basic.lean:147`; the reflection `Λ(s) = ε conj Λ(1 − conj s)` is that identity composed with `HasFunctionalEquation.eventuallyEq` | sound |
| 8.6 The Hecke instance | cites the `Modulus` fields, now glossed | `Modulus.lean:98–104`; at `ℚ` with `(4)∞`: `log(1·4) = 1.386294`, `r₁ − #𝔣_∞ = 0` (row 8.6) | sound |
| 8.1 Truncated Perron, consumed | the §6.3–6.4 bullet next to the changed §6.2 bullet | the endpoint `π⁻¹ arctan(T/c)` at `x = 1` matches Arithmetic Dirichlet Series §6.3 on main (its README lines 267–274) | sound |
| 1.5, 2.2, 4.5, 5.1, 5.2, 6.5, 7.6, 8.3, 8.5, 8.8 | not changed | carried from the previous reports; 6.5, 8.5 and 8.8 *Needs:* names pass the completeness scan above | no new check needed |

No locator changed, and the README flags none as unverified.

### Adversarial table

**New rows, for the changed passages.** All values were computed in double precision with an Euler–Maclaurin `ζ`, `math.gamma`, direct Dirichlet sums and Simpson's rule in `u = log t`.

| Statement | Instances | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| 4.2 Check 1 (`U = ∅`) | `ζ` record at `1` | `divisor Λ ∅ 1 = 0` (junk off `U`) vs `−polarOrder 1 = −1` | true; restriction needed | none |
| 4.2 Check 2 (`U = univ`) | poles `0`, `1` | `Λ = Λ₀ − 1/s − 1/(1−s)`: residue `−1` at `0`, `+1` at `1`; divisor `−1`, `−1` | true | none |
| 4.2 Check 3 (trivial zeros) | `Λ(−2k) = Λ(1+2k)`, `k = 1, 2, 3` | `Λ(3) = 0.1913133`, `Λ(5) = 0.0787971`, `Λ(7) = 0.0609765`, all nonzero | true, including "the same at `−4, −6, …`" | none |
| 4.2 Check 4 | nontrivial primitive `χ` | `N ≠ 1` gives `polarOrder = 0`, so `divisor(entireCompletion) = divisor Λ + 0` | true | none |
| 4.2 Check 5 | `zetaEntireCompletion` at `1`, `3` | `s(s−1)Λ(s) = 1.000023` at `s = 1 + 10⁻³` and `1.000000` at `1 + 10⁻⁵`; value `1`; `−1 + 1 = 0`; `6Λ(3) = 1.1478798` | true | none |
| 0.1 (Liouville clause) | `f = z`, `A' = −½`, `r = 10⁶`; `f = 1` | `‖f‖/exp(r^{−1/2}) = 999000.5`, unbounded, so not `OrderLE _ A` for `A < 0`; the constant `1` is | consistent with the API and the Checks | none |
| `meromorphicOrderAt_mul` in 3.4 | `continuedL χ₋₄ · (X − 2)` at `2`; `1/s · s²` at `0` | `0 + 1 = 1`; `−1 + 2 = 1`; for `P = 0`, order `⊤` while `rootMultiplicity_zero = 0` | true | none |
| 1.1 and 1.3a Gamma facts | `Γ(1)`, `Γ(2)`, `Γ(3/2)`, `Γ(−½)`; `‖2^{1+i}‖`, `‖3^{½−2i}‖` | `1`, `1`, `0.886227 ≤ 1`, `−3.544908 ≠ 0`; `2.000000 = 2¹`, `1.732051 = √3` | true | none |
| `dual_completed`, `dirichletData_dual` | quartic `χ` mod 5, `χ(2) = i`, at `s = 2 + i` | `L(2+i, χ̄) = 0.9181802 − 0.1004383i = conj L(2−i, χ)` | true; the dual is the `χ⁻¹ = χ̄` record | none |
| `isLittleO_integral_inv_log_sq` | `x = 10³, 10⁶, 10⁹` | `∫₂ˣ (log t)^(−2)/(x/log x) = 0.23960, 0.08631, 0.05376`, which tends to `0` | true | none |
| 8.9, the second integration by parts | `x = 100` | `∫₂¹⁰⁰ (log t)^(−2) = 10.251644`; `x/log²x − 2/log²2 + 2∫(log t)^(−3) = 10.251644` | true | none |
| 8.6 (`Modulus` fields) | `ℚ`, conductor `(4)∞`, `χ₋₄` | `absNorm finitePart = 4`, `infinitePart.card = 1 = nrRealPlaces ℚ`; `γ = Γℝ(s+1)`; conductor term `log 4 = 1.386294` | consistent with conductor `4`, shift `1` | none |

**Carried rows.** These statements are untouched; the values are those of the previous report's table (review of `820a878`).

| Statement | Values carried | Result |
| --- | --- | --- |
| 0.1/0.3 `OrderLE`, finite order | `log‖1/Γ(−n−½)‖ = 15.147, 364.901, 5914.438` (`n = 10, 100, 1000`); ratio to `n log n` → 1 | true |
| 0.2 `zetaEntireCompletion` | `F(2) = π/3 = 1.0471976`; `F(3) = F(−2) = 1.1478798`; `F(0.3+2i) = F(0.7−2i) = 0.906897 − 0.016873i` | true |
| 1.1 `logGamma` | `log 2 = 0.6931472` at `3` | true |
| 1.2 Stirling | `‖R‖‖s‖ = 1/12`; at `δ = π − 2.5`: `0.01666 ≤ 0.1676` | true |
| 1.3, 1.3a | `t·rem = ∓0.0700/∓0.0070`; `‖Γ(½+i)‖ = 0.52059 ≤ 1.77245` | true |
| 1.5 | remainder `0.693147`, `−2.063618/−2.063668` | `O(1)` |
| 1.6 `continuedL` | `ζ(0) = −½`; `χ(−1) = −1` | true |
| 2.1/2.5, 2.4 | conductors `7/2`, `12`, `48`, `16`; `Δ`: `90` at the analytic centre | true |
| 3.2–3.4, `dirichletLFunction_convexity` | `‖ζ(½+it)‖/(t+3)^{1/4} = 0.8452, 0.1773`; gamma quotient `−1.378404` | bounded |
| 4.1, 4.5, 7.4 `riemannVonMangoldt` | `N(14) = 0`, `N(15) = 1`, `N(100) = 29` vs `28.1273` | true |
| 5.1, 5.3, 5.5 `zetaEntireCompletion_hadamard`, `hadamard_of_orderLE_one` | `n(1000) = 1001`; `cos 1`: `0.5403026` vs `0.5403023`; `B = −0.0230957090` | true |
| 5.6a `riemannZeta_zeros_summable_ordinate` | first pair `0.0099606` | true |
| 6.2, `dedekindZeta_zeroFreeRegion`, `riemannZeta_zeroFreeRegion`, `heckeLFunction_zeroFreeRegion`, `dirichletLFunction_zeroFreeRegion` | cap `log 3/2 = 0.5493`; imprimitive mod 6 enters at `c ≥ 2.890`, `3.811` | true |
| 6.4a `gammaLogDerivBound`, `finite_zero_sum_le_logDeriv`, `completed_orderLE_one` | `C_Γ = 1.5723649`; `0.038959 ≤ 2.354577`; `0.263, 0.343, 0.379` → ½ | true |
| `neg_re_logDeriv_riemannZeta_le` | `24.43 ≈ 1/(4\|t\|) − γ` at `t = 0.01`; `−1.2962 ≤ −1.6667 + 2.649C` | true |
| 7.5 `riemannVonMangoldt_dedekindZeta`, `_heckeLFunction`, `_dirichlet` | `N± = 58` vs `56.2547`; `27.692 ≤ 28.419` | true |
| 8.3 `chebyshevPsi_explicitFormula` | `ψ(100) = 94.04531` vs `95.04034`; `−log(1−½) = 0.6931` | true |
| 8.4/8.6 `dedekindZeta_weilExplicitFormula`, `riemannZeta_weilExplicitFormula`, `heckeLFunction_weilExplicitFormula` | `½ log\|d_K\|` gives `(log\|d_K\|)φ(1)`; `ψ⁻¹` gives `conj ψ(𝔞)` | matches the Lean |
| 8.5 `primeIdealCount_effective` | `π(10⁶) − Li = −128.5` vs `24308.7` | true |
| 8.7 `rayClassPrimeCount_effective`, `primeCounting_progression_effective` | `4` vs `Li(20)/2 = 4.4301` | true |
| 8.8 `frobeniusPrimeCount_effective_abelian` | `ℚ(i)/ℚ`: `½` per class | true |
| 8.9 `Li` | `Li(10) = 5.120436`, `li 2 = 1.045164` | true |

### Duplication, ownership, overlaps

- The change adds citations only. It defines nothing and moves no ownership.
- `roadmaps overlaps ZerosOfLFunctions`, re-run, lists no open pull request other than this one changing the roadmap. It finds no cited id that an open pull request drops and no id that only an open revision defines.
- No new cross-roadmap citation was added. The changed contract bullets cite Arithmetic Dirichlet Series §6.2 and Global Number Fields Layers 2, 3E and 9, as before.

### Remark on untouched text (no change requested)

Three Mathlib declarations appear only in Checks and are absent from the Mathlib contract:
- `completedRiemannZeta₀_one_sub` (`NumberTheory/LSeries/RiemannZeta.lean:100`), in a 0.2 Check;
- `Complex.Gamma_mul_Gamma_one_sub` (`Gamma/Beta.lean:398`), in a 1.3a Check;
- `Polynomial.rootMultiplicity_zero` (`Algebra/Polynomial/Div.lean:528`), in a 3.4 Check.

No *Needs:* line uses them.

## Not verifiable

Nothing new: no changed passage cites a source. The items of the previous report stand:
- Davenport (`davenport2000`, uncertified): 0.3, 5.2, 5.3, 8.3, 8.5;
- Titchmarsh (no open copy): 4.5, 7.3, 7.4, 7.6;
- Iwaniec–Kowalski (paywalled);
- Lagarias–Montgomery–Odlyzko (`lagarias1979`, uncertified);
- Lang XVII §3 (`lang1994`, uncertified).

Their statements were computed instead (carried rows).

## Source issues

- none
