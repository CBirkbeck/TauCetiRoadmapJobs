# Review of ExplicitZetaBounds (pull request #1954 at 1f1a271)

**Verdict:** needs changes

There are six findings: four P2 and two P3.

- **R01 (P2), a missing hypothesis.** Two headlines are stated given `RH(545 439 823)`, but the route needs `RH(3·10¹²)`. They are the Littlewood-type region (7.4) and the Hiary–Leong–Yang bound for `1/ζ` (7.10). Nothing stated here covers `5.45·10⁸ ≤ t < e^{40.9}` under the weaker hypothesis. The same step is a gap in Yang's own proof.
- **R02–R04 (P2), cross-roadmap ownership.** In each case the sibling head contradicts this README:
  - R02: the `1/ζ` bounds of 7.10 are now claimed by both this roadmap and ExplicitMultiplicativeFunctions, because the two repairs crossed;
  - R03: Ramaré–Rumely's region is still claimed by ExplicitPrimeCounting;
  - R04: the Dedekind polynomial certificates are still handed back and forth with ExplicitNumberFields.
- **R05 (P3):** 4.5 states the B-process under a stationary-point hypothesis that the source does not have.
- **R06 (P3):** ExplicitPrimeCounting cites the deleted §8.2.

The gate passes, the dependency check reports 0 problems, and `Suggested.lean` elaborates with 24 `sorry` warnings and nothing else.

## Previous findings (review at bd1ac3e)

- **R01 (P2, Kusmin–Landau had two owners): repaired.**
  - At #1946, head 68453f2, ExplicitMultiplicativeFunctions' README lines 3063–3064 read "with the Kusmin–Landau inequality of ExplicitZetaBounds §4.1 for `x ≥ 170`", and its lines 482–483 list §4.1 among its supplier contracts.
  - README lines 90–92 here leave Bordellès–Daval's second-derivative test to that roadmap.
  - 3.4 has been dropped from line 2737. #1946 now cites §3.4 again, but for its `1/ζ` route (R02).
- **R02 (P2, the `1/ζ` bounds and the `dglsw2025` certificates had no owner): not repaired.**
  - 7.10 now states the `1/ζ` bounds (lines 2397–2417). At the same time #1946's new head claims them as its own, so the conflict is reversed (R02 below).
  - The certificate half is unchanged on both sides (R04 below).
  - The incorrect sentence "7.10 is the bound on the line one" is gone.
- **R03 (P2, Ramaré–Rumely's region had two owners): partly repaired.**
  - Lines 151–153 now say "it is owned here (7.5, fifth item), and `ExplicitPrimeCounting` takes it from there".
  - #1945, head d7232a7, is unchanged (R03 below).
- **R04 (P3, 8.2 left its constants to the outcome of its proof): repaired.**
  - 8.2 is deleted. Ramaré's density theorem is in "Not owned here" (lines 154–165), with the doubt recorded.
  - I checked those lines against `ramare2016density` lines 83–104 and `kadirilumleyng2018` lines 62–66 and 93–95.
  - A sibling still cites the deleted id (R06).
- **R05 (P3, the `0.28 log T` comparison was wrong): repaired.** I recomputed the numbers in lines 170–183:
  - `0.28 · 8.98823 = 2.51670`, and `e^{8.988225} = 8008.2`, where `0.28 log T = 2.5167 + 1/(40T)`;
  - at `L = 20.455`, `0.143 L − 0.443 log L = 1.58799`;
  - at `T = 30 610 046 000`, Rosser's bound is `6.306` against `6.760`.
- **R06 (P3, 0.4's API needed Layer 2): repaired.**
  - 0.4 keeps the definition, `ϑ(0) = 0`, the derivative and oddness. Their Needs are Mathlib only: `Complex.Gamma_conj` (`Gamma/Basic.lean:356`) and `intervalIntegral.integral_hasDerivAt_right` (`FundThmCalculus.lean:725`).
  - The identification with `Im log Γ`, the relation with `N(T)` and the `7/8` bracket move to the new 2.9 (*Needs:* 0.4, 1.1, 2.3).
  - 4.6 and 5.2 cite 2.9.

## R01 (P2) — 7.4 and the first item of 7.10 need `RH(3·10¹²)`, not `RH(545 439 823)`

**Location.**
- `TauCetiRoadmap/ExplicitZetaBounds/README.md`:
  - lines 2148–2154 (7.4): "Given `RH(545 439 823)` (0.4), prove … Ford's region 7.2 with the critical-line input of 4.7 for `5.45·10⁸ ≤ t < e^{170.2}`";
  - lines 2394–2396 (7.10, first item), "given `RH(545 439 823)` (0.4), which 7.4 uses";
  - lines 2008–2015 (7.2).
- `TauCetiRoadmap/ExplicitZetaBounds/Suggested.lean`: lines 243 and 317 (`hRH : RiemannHypothesisUpTo 545439823`), and the docstring at lines 44–45.

**Claim.** Given only `RH(545 439 823)`, Ford's region gives Yang's Littlewood-type region for every `t ≥ 5.45·10⁸`.

**Witness.** At `t = 10¹⁰`, 7.4 excludes zeros with `1 − σ < 0.006416`. The inputs available given `RH(5.45·10⁸)` give much less:
- 7.2's `log 0.618` form gives `0.006140`;
- Ford's exact Theorem 3 (`c₆` of `ford2002zerofree` line 1343) gives `0.006196`;
- his Theorem 4 gives `0.005131`.

`yang2024` lines 2328–2333 take this same step.

**Where each input covers the region.** The Littlewood region is `1 − σ < log log t/(21.233 log t)`. With `L = log t`:
- 7.2's simplified form (`mty2024` lines 107–112, with `log 0.618`) contains it only for `L ≥ 50.13`;
- Ford's exact form contains it only for `L ≥ 40.90`;
- Theorem 4 (`8.464`) contains it nowhere on `[20.12, 171]`.

With `RH(3·10¹²)` the gap closes:
- the hypothesis covers `L ≤ 28.73`;
- 7.3's `5.558691` region contains the Littlewood region for `L ≤ 45.59`, where `log log t ≤ 21.233/5.558691 = 3.8198`;
- Ford's exact Theorem 3 covers `40.90 ≤ L ≤ 170.2`.

7.10's first item inherits the problem. Hiary, Leong and Yang use Yang's region for every `t ≥ t₀ = 500` (`hiaryleongyang2025` lines 1013–1017 and 1157–1165).

**Repair.**
1. Replace `RH(545 439 823)` by `RH(3·10¹²)` in four places:
   - in 7.4 and in `riemannZeta_ne_zero_littlewood`;
   - in 7.10's first item and in `inv_norm_riemannZeta_one_add_le`;
   - in the module docstring's list at lines 44–45, moving 7.4 and 7.10 to the `3·10¹²` entry;
   - in the 7.4 docstring's parenthesis, which says Yang's proof uses the verification only below `5.45·10⁸`.
2. Rewrite 7.4's route:
   - the hypothesis together with 7.3's `5.558691` region for `3 ≤ |t| ≤ e^{45.59}`;
   - Ford's Theorem 3 with its exact `c₆(t)` (`ford2002zerofree` (9.9), lines 1342–1346) and `log 0.618` in `J`, for `e^{40.90} ≤ t < e^{170.2}`;
   - Yang's argument above that.
3. In 7.2, state that exact form from `T₀ = 5.45·10⁸`. With `log 0.618`, the minimum in Ford's `J` is always the second branch, because `log L − L/12 ≤ log 12 − 1 = 1.485 < 2.333`; `yang2024` (1.4), lines 77–80, states it for `|t| ≥ 3`. The simplified form of `mty2024` reaches only from `e^{50.13}`.
4. Add the values at `t = 10¹⁰` as a negative-control Check.

**Tested.**
- The repaired signatures elaborate in a scratch copy.
- At `t = 10¹⁰` the new hypothesis covers the point.
- At `t = e^{47}`, 7.3 gives `0.0038276 < 0.0038581`, but Ford's exact form gives `0.0038820 ≥ 0.0038581`.
- At `t = e^{100}`, the simplified form gives `0.0021959 ≥ 0.0021689`.

## R02 (P2) — The `1/ζ` bounds of 7.10 have two owners

**Location.**
- `TauCetiRoadmap/ExplicitZetaBounds/README.md` lines 2397–2417 (7.10, second to fourth items).
- Lines 2737–2741: "`ExplicitMultiplicativeFunctions` takes … 7.10 (the bounds for `1/ζ` that its §1.9 uses …)".

**Claim.** ExplicitMultiplicativeFunctions consumes these bounds from 7.10.

**Witness.** At #1946, head 68453f2, in `TauCetiRoadmap/ExplicitMultiplicativeFunctions/README.md`:
- line 1712 says "This roadmap owns them: ExplicitZetaBounds leaves them to it", and lines 484–486 and 131–134 say the same;
- line 1710 states the third bound for `14 ≤ t ≤ H`, against `H − 1/2` here;
- lines 1717 and 1734 cite §§3.3, 3.4, 4.8 and 7.3 here instead of 7.10.

**Repair.** Keep 7.10 as the statement of record, for two reasons:
- this roadmap comes earlier in the merge order (270 < 273);
- its range `t ≤ H − 1/2` is the one the source's proof supports. Leong defines `H := H₀ − 1/2`, and his Corollary 3 holds only for `t ≤ H`; Lee–Leong's Lemma 4.3 is proved from that corollary (Source issues).

#1946 §1.9 then replaces its three statements by a citation of §7.10:
- it uses the third bound on `14 ≤ t ≤ H − 1/2`, and 7.10's classical-region bound `7.59·10³¹ log t` on `[H − 1/2, H]`;
- it deletes lines 131–134 and 484–486.

This pull request's description names the #1946 head that carries the change. Do not move the bounds back to #1946: the two repairs crossed.

**Tested.** In the arXiv v5 PDF text:
- Lee–Leong's proof of Lemma 4.3 cites "[12, Cor. 3, Tab. 2]";
- Leong v5 §2.1 defines `H := H₀ − 1/2`, and his text says Corollary 3 "holds for t ≤ H".

## R03 (P2) — Ramaré–Rumely's region still has two owners

**Location.** `TauCetiRoadmap/ExplicitZetaBounds/README.md`:
- lines 151–153: "it is owned here (7.5, fifth item), and `ExplicitPrimeCounting` takes it from there";
- line 2728: "Ramaré and Rumely's region with `C₁(k, H)`".

**Claim.** ExplicitPrimeCounting consumes the region from 7.5.

**Witness.** At #1945, head d7232a7, in `TauCetiRoadmap/ExplicitPrimeCounting/README.md`:
- lines 85–90 make *RamareRumelyRegion* (its §6.1) "a named hypothesis, never discharged here";
- lines 408–412 call it "this roadmap's (Owned here)";
- line 3409 says "ExplicitZetaBounds leaves this region … to the theorem using it".

**Repair.**
- Preferred: #1945 discharges *RamareRumelyRegion* `q H C` at `C = C₁(k, H)` from §7.5's fifth item, with `k ≤ q` the conductor of `χ`, and deletes those three passages. This pull request's description names that head.
- If #1945 keeps the hypothesis instead, delete "and `ExplicitPrimeCounting` takes it from there" (line 153) and the clause at line 2728.

**Tested.** The implication was checked last round. At `k = 1`, `|γ| = 5.45·10⁸`, `C = 38.31`, both forms give `1 − β ≥ 0.0062943`.

## R04 (P2) — The polynomial certificates of ExplicitNumberFields are handed back and forth

**Location.** `TauCetiRoadmap/ExplicitZetaBounds/README.md` lines 184–188: "the nonnegative trigonometric polynomials for Dedekind zeta functions that `ExplicitNumberFields` uses … by the Conventions it is named with that theorem".

**Claim.** ExplicitNumberFields names those certificates itself.

**Witness.** At #1944, head 4198f62, unchanged since the last review:
- lines 516–519 read "What ExplicitZetaBounds must provide (gap:nonnegative-trig-polynomials): the three polynomial certificates … Kadiri's degree-four … Mossinghoff–Trudgian degree-sixteen … `dglsw2025` … Required location: §0.5";
- lines 119–120 repeat it.

**Repair.** One owner.
- Preferred: #1944 withdraws the gap and names the `dglsw2025` and Dedekind certificates in its own 4.5–4.8. This roadmap's Conventions attach a certificate to the theorem it serves, and only #1944 uses these. #1944 then cites 7.3 here for `F₁₆` and for Kadiri's `(0.91 + cos φ)²(0.265 + cos φ)²`. This pull request's description names that head.
- Otherwise, add the three certificates to 0.5 by name and locator, as the gap asks.

**Tested.** `dglsw2025` appears nowhere in this README; Das–Gaba–Lee–Savalia–Wong is named only at line 185. `roadmaps grep` finds no third roadmap stating these polynomials.

## R05 (P3) — 4.5's B-process assumes a stationary point that the source does not

**Location.** `TauCetiRoadmap/ExplicitZetaBounds/README.md` lines 1331–1332: "and under the hypotheses of both, with `x_ν` defined by `f'(x_ν) = ν`". "Both" includes the second lemma's "`f'(c) = 0` for some `c ∈ [a, b]`".

**Witness.** `patelyang2024` Lemma 2.3 (lines 667–671) assumes only:
- `f` three times differentiable;
- `f'` decreasing on `[a, b]` with `f'(b) = α` and `f'(a) = β`;
- `λ₂ ≤ |f''| ≤ h₂λ₂` and `|f'''| ≤ h₃λ₃`.

It has no stationary point.

**Repair.** State the third bound under exactly those hypotheses.

**Tested.** Take `f(x) = x/2 − x²/(8M)` on `(0, M]`. Then `f' ∈ [1/4, 1/2]`, so `f'` has no zero and the dual sum is empty. Lemma 2.3 applies, and 4.5 as written does not.

## R06 (P3) — ExplicitPrimeCounting cites the deleted §8.2

**Location.** Layer 8 now runs 8.1, 8.3, 8.4, 8.5. Ramaré's density moved to "Not owned here", lines 154–165.

**Witness.** At #1945, head d7232a7, `TauCetiRoadmap/ExplicitPrimeCounting/README.md` line 4115: "ExplicitZetaBounds states neither form (its §8.2)".

**Repair.** #1945 line 4115 cites "Scope and ownership, Not owned here" instead. Record the change in this pull request's description. The README needs no change.

## Verified sound

**Gate, order and Lean.**
- **Gate.** I ran the gate myself at 1f1a271. Every check is 0 and it ends `OK`. The outside-folder diff is empty, and the folder holds `README.md`, `Suggested.lean` and `metadata.toml`.
- **Dependency check.** `depcheck: 244 roadmaps, 2465 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- **Merge order.** LFunctions is at 28, ZerosOfLFunctions 85, AnalyticNumberTheoryPartI 90, ComputationalNumberTheory 193, SieveMethodsAndPrimePatterns 269 and this roadmap 270; the four Explicit* consumers are at 271–274.
- **Elaboration.** `lake env lean` on `Suggested.lean` gives 24 `declaration uses sorry` warnings and no errors.
- **Signatures.** I elaborated `#check @` for all 33 declarations in one scratch file. There is no `variable` block, so no binder can be lost. Since bd1ac3e only docstrings changed (lines 58–68 and 90–91).
- **Padding probe.** `first | rfl | (simp; done) | (norm_num; done) | positivity | infer_instance | (intros; simp_all; done) | exact le_rfl | decide` leaves all 24 theorems open, so there is no padding.
- **Headlines.** Every end theorem of the Summary is stated. The docstring names the general Rademacher bound as not statable, and names the preprint instances as not stated.

**Sources of the sample (each read at the cited lines).**
- **0.4:**
  - `platt2017zeros` lines 524–528: Theorem 5.1, with `103 800 788 359` zeros, all simple;
  - `platttrudgian2021` line 48;
  - `kadiri2005` line 992 (`γ₁ = 14.134725146`);
  - `thornerzaman2024` line 305;
  - `bellottiwong2025` lines 121–124 and 199–202.
- **2.1 and 2.3:** `brent2019`:
  - lines 121–145 (`R_k` is the remainder after `k − 1` terms);
  - lines 258–259 (`|R_k| ≤ |T_k| sec^{2k}(θ/2)`);
  - lines 162–202.
- **2.9:**
  - `brent2019` lines 38–45 (`ϑ` is the continuous argument);
  - Theorem 5 at lines 499–510 (`T̃₁ = 1/(48t)`, `T̃₂ = 7/(5760t³)`);
  - Corollary 3 at lines 576–582.

  At `k = 2` these give the `7/8` bracket for every `T ≥ e`.
- **2.5:** the derivation from 2.1 and 2.4. `−t arg s − σ` lies in `[−π|t|/2 − σ³/(3t²), −π|t|/2]`, and `sec²(θ/2) < 2`.
- **2.7:** AnalyticNumberTheoryPartI §0.23a at its head, lines 626–634 (`|R^{(j)}| ≤ j! sec^{j+2}(arg z/2)/(8|z|^{j+1})`).
- **3.5:** `thornerzaman2024` lines 317–321.
- **4.1:** `ariasdereyna2024` lines 90–104.
- **4.2:** `yang2024` lines 324–334, `patelyang2024` lines 112–122 and `hiarypatelyang2024` lines 96–104. HPY's `((L + M − 1)/M)(L + 2Σ…)` is Yang's form.
- **4.3:**
  - `ariasdereyna2024` lines 109–114 and 183–189 (`A = 2.79368…`);
  - `yang2024` lines 167–172;
  - `patel2022` lines 140–144 and 157. Patel's (25) is Arias de Reyna's Lemma 4 at `λ = 1/W`, `Λ = 1/V`, `Y = L − 1`.
- **4.5:** `patelyang2024` lines 266–268, 475–477 and 667–671 (R05).
- **7.4:** `yang2024` lines 77–92 and 2326–2372 (R01).
- **7.5:**
  - `thornerzaman2024` lines 154–170 and 217–226;
  - `kadiri2018` lines 16–18;
  - `luzamanzhao2026` lines 15–20 and 39–44;
  - `ramare-rumely-1996` lines 808–815.
- **7.6:**
  - `ford2002zerofree` lines 32–34 and 135–136;
  - `mty2024` lines 53–54;
  - `bellotti2024` lines 81–82;
  - `bellotti2025density` lines 362–365;
  - `khale2024` lines 24–26.
- **7.7:**
  - `bordignon2019` lines 63–71;
  - `bordignon2020` lines 56–66;
  - `ralaivaosaonarazakarinoro2026` lines 69–76: `1 − β > 6.5/√d`, which implies the asserted `6.035`.
- **7.9:** `banks2026` lines 89–107, and `guo2026` lines 23–26 and 54–61.
- **8.4:** `thornerzaman2024` lines 31–43, 64–66 and 156–158.

**The new sources of 7.10.** `leong2026` and `leeLeong2022` are uncached; I read their arXiv v5 PDF texts (Not verifiable).
- **Leong:**
  - §2.1 defines `H := H₀ − 1/2`, with `H₀ = 3.000175332800·10¹²`;
  - Corollary 3 gives `(σ₀, t₀, Q) = (0.8, 14, 23.759)` and holds for `t ≤ H`;
  - Corollary 4 gives `(W, Y) = (13, 1719)`, `30.812 log t` for `σ ≥ 1` and `t ≥ 13`, and `29.388 log t` for `t ≥ 2`;
  - Table 4's row `W = 5.56` gives `7.59·10³¹`, valid for `t ≥ 13`;
  - (42) and (49) are as quoted, (49) being `2.079 log t` for `2 ≤ t ≤ 500`;
  - the proofs of Corollaries 1 and 2 use Corollary 3 for `13 ≤ t ≤ H`;
  - `W₀ = 5.558691`.
- **Lee–Leong:**
  - Theorem 1.1 (6) gives `1 237 (log t)^{11/12}` for `t ≥ ℋ = 3 000 175 332 800` and `σ ≥ 1 − 1/(5.56 log t)`;
  - (12) quotes `7.59·10³¹`;
  - the Remark requires `W > Z₁ = 5.558691`;
  - Lemma 4.3 and its proof check out: `(35.162 + 23.759 + 17.050 + 13.123 + 10.175)/20 = 4.96345 < 4.964`.

**Library declarations opened at the pin (17).**
- `Complex.digamma` (`Gamma/Digamma.lean:48`), `Complex.digamma_one_half` (`:59`) and `Complex.digamma_nat_add_one` (`:85`).
- `Complex.Gamma_conj` (`Gamma/Basic.lean:356`) and `intervalIntegral.integral_hasDerivAt_right` (`FundThmCalculus.lean:725`).
- `Complex.borelCaratheodory` (`Complex/BorelCaratheodory.lean:109`).
- `Complex.integral_boundary_rect_eq_zero_of_differentiableOn` (`CauchyIntegral.lean:313`).
- `MeromorphicOn.circleAverage_log_norm` (`JensenFormula.lean:307`).
- `Complex.HadamardThreeLines.norm_le_interp_of_mem_verticalClosedStrip₀₁'` (`Complex/Hadamard.lean:483`).
- `Real.arctan_le_self` (`Trigonometric/Bounds.lean:228`) and `Complex.norm_cpow_of_ne_zero` (`Pow/Real.lean:311`).
- `Complex.Gammaℝ_mul_Gammaℝ_add_one` (`Gamma/Deligne.lean:155`) and `Stirling.le_factorial_stirling` (`Stirling.lean:248`).
- `riemannZeta_ne_zero_of_one_le_re` (`LSeries/Nonvanishing.lean:417`).
- `DirichletCharacter.LFunction_changeLevel` (`DirichletContinuation.lean:149`) and `DirichletCharacter.changeLevel_primitiveCharacter` (`DirichletCharacter/Basic.lean:309`).
- `Real.Gamma_mul_Gamma_add_half` (`Gamma/Beta.lean`, Real section from line 614).

A grep of the pinned Mathlib and Tau Ceti finds no Riemann–Siegel theta function and no bound for `1/ζ`.

**Cross-roadmap citations resolved.**
- **ZerosOfLFunctions on main:**
  - 1.1 (430), 1.4 (478), 1.6 (506), 3.4 (705, with *poleClearedContinuedL* at 711);
  - 4.3 (837), 4.5 (872), 5.5 (989), 5.6 (1003);
  - 6.3 (1075), 6.4 (1097, with 6.4d), 6.5 (1142);
  - 7.1–7.4 (1182–1263) and Layer 9 (1586).

  Its 7.3 Check `S(T) → −1` matches 2.9.
- **AnalyticNumberTheoryPartI at #1126:** §0.9 (302), §0.23a (626), §0.34 (805), §0.34a (811), §1.5 (969), §1.5a (979), §1.6 (989), §1.7 (1013) and §3.23 (2342).
- **AnalyticNumberTheoryPartII:** §4.3a (line 217).
- **AsymptoticExpansions (#1857):** §13.1 at line 1240 (`sum_Icc_eq_eulerMaclaurin`) and Layer 5 at line 561.
- **ComputationalNumberTheory:** §4.22 at line 2494 (`platt_bounded_height`) and §4.24 at line 2509.
- **SieveMethodsAndPrimePatterns:** §2.6 (2152) and §2.9 (2317), with `SieveTaper.sharp_additive_largeSieve` (2329) and `SieveApplications.sharp_primitive_largeSieve` (2339). These names are two of the three "found nowhere" leads; the third, `gammaRemainder.slit_logGamma`, is AnalyticNumberTheoryPartI §0.23a above.
- **Completed/ArithmeticDirichletSeries:** 6.3 and 6.4 (lines 267 and 275).

**Consumer contracts at their heads.**
- **#1945:** its gaps at lines 453–471 are met by 0.2–0.4, 5.2, 5.3, 5.4, 7.3, 7.5, 7.6, 7.9, 8.1 and 8.3. Its §§6.1, 6.5 and 7.2 contracts match.
- **#1944:** `gap:iterated-perron` is met by 6.1a, and `gap:uniform-landau-siegel-gap` by 7.9.
- **#1948:** it consumes 4.2 and 6.5 (lines 55–63, 76 and 326).

`roadmaps grep` over all 478 open pull requests finds no other owner of the Riemann–Siegel theta function, Kusmin–Landau, the `1/ζ` constants or the decimal zero-free constants.

**Adversarial table.** I computed every value this round with my own double-precision `Γ`, `ψ`, `ζ`, Hurwitz and `L(s, χ)`. They were cross-checked against `ζ(2)`, `ζ(−1/2)`, `ψ(1)`, `log Γ(1/2)`, `π/4`, `π/(3√3)` and `ζ(1/2 + 14.134725142i) ≈ 2·10⁻¹⁰`.

| Statement | Instances | Values (left / right) | Result | Change |
|---|---|---|---|---|
| `RiemannHypothesisUpTo` (0.2) | `H < 0`; strip dropped; imprimitive law at `q = 2` | vacuous; `ζ(−2) = 0` at `Re −2`; zero `2πi/log 2` at height `9.0647`, `Re 0` | sound | — |
| 0.4, recorded verifications | Platt's count; recorded `S(T)` | `103 800 788 359` zeros, simple and on the line; main term plus `7/8` at `H₀` `1.0380079·10¹¹`; `|S| ≤ 2.5167` | sound | — |
| `riemannSiegelTheta` (0.4) | `T = 100, 14.14, 14, −100`; minimum; zero | `87.97217`, `−1.72653`, `−1.78295`, `−87.97217`; min `−3.53097` at `6.2898` (`Re ψ = 1.144724` against `log π = 1.144730`); `ϑ = 0` at `17.84560` | sound | — |
| 0.4, negative controls | without `−(T/2) log π`; principal `Log` | `47.22135` against `N(100) = 29`; principal `arg Γ(1/4 + 50i) = 0.69540`, continuous `145.20866`, so `ϑ = −56.54110` | sound | — |
| 2.9, bracket | `T·excess` on `[e, 10⁴]` (log step 0.1%); Brent `k = 2` beyond | max `0.006771` (`T = e`), min `0.0066314`, against `1/40`; at `e`: `0.0024909 = 0.0024396 + 0.0000193 + 0.0000311`; at `100`: `6.63149·10⁻⁵` against `6.63146·10⁻⁵` | sound | — |
| 2.9, relation | `T = 14, 100`; without the `1` | `S(14) = −0.43247`, `S(100) = −0.00241`; without it `0.56753`, `0.99759` | sound | — |
| 2.1, 2.3 | Stieltjes; Brent `k = 1` | `|R_k| ≤ |T_k| sec^{2k}(θ/2)`, `|θ| < π`; `√π Γ(3/2) = π/2 = 1.5708 < √π` | sound | — |
| `norm_Gamma_bounds` (2.5) | 3000 random `s`, `σ ∈ [10⁻³, 79]`, `|t| ∈ [10⁻², 400]`; `s = 1/2 + 10i` | least log-margins `5.9·10⁻¹⁰` (lower), `4.2·10⁻⁴` (upper); `|Γ| = 3.7775321·10⁻⁷ = √(π/cosh 10π)` | sound | — |
| 2.7 | `z = 1`; `z = 10i` | `0.0772 ≤ 0.125`; `0.000834 ≤ 0.003536` | sound | — |
| 3.5 | constant `F`; `e^{az}`; `exp(e^{−iπ(z−1/2)})` | weights sum to `1`; `a/2 = a/2`; `0` on both lines against `e^{πt}`, growth exactly `π` | sound | — |
| `norm_LFunction_le_rademacher` (3.2) | `χ₄`, `χ₋₃`, quadratic and quartic modulo `5`; `η ∈ {0.05, 0.25, 0.5}`; `σ ∈ {−η, 0, 1/2, 1, 1 + η}`; `t ∈ {0, 2, 10, 30}` | largest ratio `0.585` (quadratic modulo `5`, `σ = −1/2`, `t = 10`: `12.1747 ≤ 20.8146`) | sound | — |
| 4.2 | `b = (1, 1)`, `H = 2`; `b = (1, −1)` | `16 ≤ 18`; `0 ≤ 6` | sound | — |
| 4.3 | Patel at `L = 10`, `V = 2`, `W = 3`; threshold | `32.907`, `41.362`; `λ < 0.28829` | sound | — |
| 4.5 | `f = x/2 − x²/(8M)` on `(0, M]` | source lemma applies; README form needs `f'(c) = 0`, impossible | narrower than source | R05 |
| `norm_riemannZeta_criticalLine_le` (4.7) | `t ∈ [3, 60]`, step `0.05` | largest ratio `0.82103` | sound | — |
| `norm_riemannZeta_one_add_le` (4.8) | `t ∈ [3, 60]` | largest ratios `0.64429` (Patel), `0.48520` (HLY) | sound | — |
| `vinogradovCount` | `J₂,₁(2)`, `J₂,₂(3)`, `J₃,₃(2)` by enumeration | `6`, `15`, `20` | sound | — |
| `vinogradovCount_le_ford` | `k = 1000` | `Δ_s = 11 343.29` at `s = 2k²`; top of the `s` range `3 213 463.01` | sound | — |
| `norm_riemannZeta_le_richert` (4.10) | `σ ∈ {0.5, 0.6, 0.75, 0.9, 1}`, `t ∈ {3, …, 60}`, `u ∈ {0.01, 0.2, 0.5, 0.99, 1}` | largest ratio `0.010496`; at `σ = 1`, `t = 10¹⁰` the bound is `616.74` | sound | — |
| `abs_zetaZeroCount_sub_le(_of_recorded)` (5.2) | `T = e, 100, 1000` | `|N − M|` = `0.795`, `0.873`, `1.259`; right sides `8.184`/`3.886`, `8.921`/`4.482`, `9.252`/`4.791` | sound | — |
| `dirichletZeroCount_explicit` (5.3) | `χ₄`, `T = 10` | `ℓ = 2.03332`, main term `2.95882`, error `2.18163`; `N = 2 ∈ [0.777, 5.140]` | sound | — |
| "Not owned here", `0.28 log T` | `L = 8.98823`, `20.455`; `T = 30 610 046 000` | `2.51670`; `1.58799`; `6.306` against `6.760` | sound | old R05 repaired |
| 7.2 | `t = 1.88·10¹⁴`, `e^{64.1}` | `0.0042383` against `0.0054734`; `0.0028064` against `0.0028065` | sound | R01 (range) |
| `riemannZeta_ne_zero_classical` (7.3) | `|t| = 2`, `3·10¹²` | `σ ≥ 0.740461`, `0.993738` | sound | — |
| `riemannZeta_ne_zero_littlewood` (7.4) | `t = e^{200}`; `10¹⁰`; `e^{47}` | `0.0012477` against classical `0.0008995`; at `10¹⁰`: claimed `0.006416`, available `0.006140` (MTY form), `0.006196` (Ford exact), `0.005131` (Theorem 4); at `e^{47}`: `0.0038581` against `0.0038476` (MTY form), `0.0038820` (Ford exact), `0.0038276` (7.3) | route gap under its hypothesis | R01 |
| `LFunction_zeroFree_mcCurley`, `LFunction_ne_zero_kadiri` (7.5) | `q = 3` | `σ ≥ 0.905635`; `σ ≥ 0.837457` | sound | — |
| 7.5, Ramaré–Rumely | `k = 1`, `|γ| = 1000` | `0.022085` (source prints "< 0.02194") | sound | R03 (owner) |
| `riemannZeta_ne_zero_vinogradovKorobov` (7.6) | `|t| = e^{1000}` | `9.5052·10⁻⁵` (Ford `9.1254·10⁻⁵`, Bellotti `9.7229·10⁻⁵`) | sound | — |
| `LFunction_real_zero_le_bordignon` (7.7) | `q = 4·10⁵` | `0.0076021`; `0.00095026` | sound | — |
| `LFunction_real_ne_zero_luZamanZhao` (7.8) | `q = 10¹⁰`; `q = 4` | `[0.991314, 1)`; `[0.855730, 1)`, with `L(0.85573, χ₄) = 0.75592` and `L(0, χ₄) = 1/2` | sound | — |
| `inv_norm_riemannZeta_one_add_le` (7.10) | `t = 3`; `[3, 300]`, step `0.05` | `1.56747 ≤ 5042.87`; largest ratio `0.0026111` | holds; hypothesis too weak | R01 |
| 7.10, Leong and Lee–Leong items | `t = 13`; `σ = 3/4`, `t = 14`; `t = H` | `1/|ζ(1 + 13i)| = 1.37875 ≤ 75.379`; maximum over `σ ∈ [1, 5]` `1.37903` at `σ = 1.030`; `4.95536 ≤ 3.793·10⁷`; `1/|ζ(0.929879 + 13i)| = 1.37567`; `ln(29.388 H^{4.964}) = 145.9948`; `1237 · 28.72969^{11/12} = 26 864.1`; regions `0.9937397` / `0.9937382` / `0.9928907` | sound | R02 (owner) |
| `zetaZeroCountRight_le_kadiri` (8.1) | `T = 3.061·10¹⁰` | `1.70220·10¹⁰`, `1.35323·10¹⁰`; trivial bound `5.19·10¹⁰`, true value `0` | sound | — |
| `zetaZeroDensityCount_nine_tenths_lt` (8.3) | `T = H₀` | `1.9139·10⁸` | sound | — |
| `primitiveLZeroCount_le_thornerZaman` (8.4) | `Q = 3`, `σ = 39/40` | `log₁₀` of the bound `99.706`; factors `ζ` and `L(s, χ₋₃)`; `β₁(3) = −1` | sound | — |
| `zetaZeroDensityCount_le_bellotti` (8.5) | `T = 10¹³`, `σ = 0.9927` | `2.2230·10¹¹` | sound | — |
| `norm_LFunction_one_le_ramare` (9.1) | `q = 3` (odd), `5` (even), `8` (odd) | `0.604600 ≤ 1.257547`; `0.430409 ≤ 0.804719`; `1.110721 ≤ 1.220554` | sound | — |
| `norm_LFunction_one_ge` (9.3) | quartic character modulo `5` | `0.888577 ≥ 0.222066` | sound | — |
| `LFunction_one_ge_luZamanZhao` (9.3) | `q = 3` | `0.604600 ≥ 0.113780` | sound | — |

## Not verifiable

- **The line locators of `leong2026` and `leeLeong2022`.** The worker's manifest records both texts as unreadable, and the cache has no text, so "`line N`" cannot be matched.
  - I read the arXiv v5 PDFs from arxiv.org and checked every claim by theorem and equation number (above). The extracted text is readable, so these PDFs are not image-only and the worker can fetch them again.
  - The cited line numbers come from another extraction. For example, Lee–Leong's Lemma 4.3 is cited at lines 1084–1159, while my extraction has it at line 750.
  - The journal version of `leong2026` (J. Number Theory 285) was not read.
- **Uncertified or waived sources with no cached text.** I checked each dependent target by recomputation (table) or through a quoting source:
  - `backlund1918`, `titchmarsh1986`, `montgomery1994ten`, `logan1988`, `gallagher1970`;
  - `preissmann1984`, `davenport2000`, `mccurley1984`, `rademacher1959`, `rosser1941`;
  - `lehman1966`, `delange1987`, `bastienrogalski2002`, `ramare2001`, `louboutin2015`;
  - `gabcke1979` (waived).
- **Ownership** was checked against the four Explicit* heads and, by `roadmaps grep`, against all 478 open roadmap pull requests.

## Source issues

- **Gap** in `yang2024` at the proof of Corollary 1.2, p. 41: the source says the range `5.45·10⁸ ≤ t < e^{170.2}` follows from (1.4) alone, needing no verification beyond `5.45·10⁸`; it should use `RH(3·10¹²)` and the `5.558691` region to `e^{45.59}`, since (1.4) suffices only above `e^{50.13}`; affects the proof.
- **Gap** in `leeLeong2022` at Lemma 4.3, p. 20 (arXiv v5): the source says the bound holds for `14 ≤ t ≤ ℋ = 3 000 175 332 800`; it should be `14 ≤ t ≤ ℋ − 1/2`, the range of Leong's Corollary 3 that the proof uses; affects a stated result.
- **Error** in `ramare-rumely-1996` at the proof of Theorem 3.6.2, p. 408: the source says the bound at `k = 1`, `|γ| = 1000` is below `0.02194`; it should be `0.022085`, still below `1/2`; affects nothing.
- **Error** in `patel2022` at Lemma 3.1, p. 5 (arXiv v1): the source says the coefficient in `β₄` is `18/20`; it should be `18/10 = 9/5`, as its proof's (33) and (35) give; affects a stated result.
