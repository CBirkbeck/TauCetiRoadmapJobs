# Review of ExplicitZetaBounds (pull request #1954 at 1a57053)

**Verdict:** needs changes

This is a full review. The folder changed by 718 lines since `11dd87b`, the head the previous review read.

**Previous findings.** PRREVIEW-ExplicitZetaBounds~10 accepted `11dd87b` with no findings, so there is nothing to re-check. Its single remark, about the board manifest's `kadiri2002thesis` range, concerned a file outside this folder.

**What changed.**
- `Suggested.lean` adds six declarations:
  - definitions `ZetaZeroFreeUpTo` and `KalmyninRecord`;
  - theorems `neg_logDeriv_riemannZeta_laurent`, `abs_zetaZeroCount_sub_riemannSiegelTheta_le`, `zetaZeroCountBound_trudgian` and `zetaZeroCountBound_chirreHelfgott`.
- The README adds or extends:
  - 0.4 (the first-ordinate record);
  - 3.4 (the values of `ζ′/ζ` and the Laurent expansion);
  - 4.5c (the cotangent expansion);
  - 5.2 and 5.2a (the bound for `S(T)`, and Trudgian's and Chirre–Helfgott's counts);
  - 6.3a (the lemmas of the route);
  - 7.3a (lowering the height);
  - citations of the Lean projects `ieantn` and `primenumbertheoremand` throughout.

There are five findings: two P2 and three P3.

## R01 (P2) — Rosser's bound from `T = 2` rests on a zero computation that no record names

**Location.**
- `TauCetiRoadmap/ExplicitZetaBounds/Suggested.lean` 558: `theorem zetaZeroCountBound_rosser : ZetaZeroCountBound (7 / 8) 0.137 0.443 1.588 0 2`.
- Line 565, `zetaZeroCountBound_seven_eighths`, uses it on `2 ≤ T ≤ e^{175.3}`.
- README 2033 states "for `T ≥ 2`", README 2141 gives the instance, and README 3635 hands "Rosser's bound for `T ≥ 2`" to ExplicitPrimeCounting.

**Claim.** The Conventions (README 253–262) require that every finite verification a theorem rests on be a record and a hypothesis. Rosser's Theorem 19 proves the bound analytically only from `T₀ = 1467`. That is the height of the Titchmarsh–Comrie computation of the zeros below 1468, and below it the theorem rests on that computation. `zetaZeroCountBound_rosser` takes no hypothesis, and neither does Rosser's part of `zetaZeroCountBound_seven_eighths`.

**Witness.**
- `trudgian2014argument` line 27 lists Rosser's `(0.137, 0.443, 1.588)` with `T₀ = 1467`.
- At `T = 14.2` Rosser's right side is `2.383`. The S(T) record allows `|N − M| ≤ 2.5167 + 1/(40T) = 2.5185`, so no record here gives the bound there.

**Repair.** Choose one of two routes.
- Name the computation that Theorem 19 rests on below 1467 as a record of 0.4. Take it as a hypothesis of `zetaZeroCountBound_rosser`, `zetaZeroCountBound_seven_eighths` and the 5.2 item.
- Or state Rosser's bound from `T₀ = 1467` without a record. Then give `zetaZeroCountBound_seven_eighths` the hypotheses `hS : ZetaArgumentBoundUpTo 30610046000 2.5167` and `hZ : ZetaZeroFreeUpTo 14`.

Tested on the second route:
- at `T = 2`, `hZ` gives `N(2) = 0` and the error is `0.1923 ≤ 8.3451`;
- on `[e, 1467]` the error is at most `2.5167 + 1/(40e) = 2.5259 < 8.3451`;
- at `T = 1467`, Rosser's right side `3.467` is at most `9.636`, the right side there.

Update README 2033, 2141 and 3635 to match, since ExplicitPrimeCounting README 520 and 2486 consume this instance. The text of `rosser1941` is uncertified here, so check the range against the proof of Theorem 19 in the published paper.

**Verdict:** PLAUSIBLE. The witness is Trudgian's table; Rosser's own text was not read.

## R02 (P2) — "The two forms of 7.3" (7.3a) is false for `R ≤ 0 < R'`

**Location.** README 2818–2820: "for `t₀ > 1`, *ClassicalZeroFreeRegion* `R t₀` implies the form with `>` at `R` …, which implies *ClassicalZeroFreeRegion* `R' t₀` for every `R' > R`".

**Claim.** The second implication needs `R > 0`. For `R < 0` the predicate is vacuous, as the Checks at README 2880 say, so the implication would turn a vacuous statement into a zero-free region of any width.

**Witness.** Take `R = −1`, `R' = 0.1` and `t₀ = 2`.
- *ClassicalZeroFreeRegion* `(−1) 2` holds, because its boundary is `1 + 1/log|t| > 1`.
- *ClassicalZeroFreeRegion* `0.1 2` fails at `ρ = 1/2 + 14.1347i`, where the boundary is `1 − 10/2.6486 = −2.776 < 1/2`.

**Repair.** Write "for every `R' > R > 0`". The monotonicity bullet at README 2807 already assumes `0 < R`. Tested: at `R = 5.558691`, `R' = 5.573412` and `|γ| = 3·10¹²`, the boundaries are `0.9937382 < 0.9937548`, so the implication holds.

## R03 (P3) — 3.4 re-derives identities that Mathlib has at the pin, without citing them

**Location.**
- README 1281–1286: "Prove the reflection identities … the logarithmic derivative of `ζ(1 − s) = 2(2π)^{−s} cos(πs/2) Γ(s) ζ(s)` … is `−(ζ′/ζ)(1 − s) = −log 2π − (π/2) tan(πs/2) + ψ(s) + (ζ′/ζ)(s)`".
- README 1277–1278, and `Suggested.lean` 397: `(riemannZeta σ).im = 0`.

**Claim.** That identity is `logDeriv_riemannZeta_one_sub` at the pin, and the reality clause is `riemannZeta_im_eq_zero_of_one_lt`. Neither appears in 3.4 or under "From Mathlib".

**Witness.**
- `Mathlib/NumberTheory/LSeries/RiemannZetaLogDeriv.lean:35` proves `logDeriv riemannZeta s = −logDeriv riemannZeta (1 − s) + log(2π) − ψ s + (π/2) tan(πs/2)` for non-integer `s` with `ζ(s) ≠ 0`.
- `Mathlib/NumberTheory/LSeries/Dirichlet.lean:352` proves the reality clause.

**Repair.**
- Cite both lemmas in 3.4 and in the Mathlib contract.
- Because `logDeriv_riemannZeta_one_sub` excludes integers, obtain the identities at `s = 2`, and their derivative, by continuity. Checked at `s = 2`: `−1.985054 + 1.837877 − 0.422784 + 0 = −0.569961`.
- Drop the conjunct `(riemannZeta σ).im = 0` from `riemannZeta_strictAntiOn`.

## R04 (P3) — `ieantn` and `primenumbertheoremand` are cited with no locator

**Location.** README, 29 lines citing `ieantn` and 35 citing `primenumbertheoremand`. Examples are 2.7 (README 1072, a seeded target whose only source is `ieantn`), 3.4 (1292), 5.2a (2128), 6.3a (2403), 7.3a (2804, 2809) and 8.3a (3391). The References entries at 3771–3772 say "Cited for: §§0.2, 0.4, …".

**Claim.** Every claim needs an exact locator into a legal source. These two citations name a whole repository, and the "Cited for" lists name sections of this README, not files or declarations of the projects. Nobody can check that a project states what is attributed to it. Neither work is in the roadmap's manifest.

**Witness.** README 3772 is "`ieantn`: T. Tao and contributors, *IEANTN*, Lean formalization project; https://github.com/teorth/IEANTN. Cited for: Conventions; §§0.2, 0.4, …". It gives no commit, file or declaration.

**Repair.**
- Give each citation the file and declaration name at a fixed commit of the project.
- Or drop the attribution where a primary source with a locator already carries the statement (for 2.7, AnalyticNumberTheoryPartI §0.23a at `j = 1`).
- Record both works, with the commit, in the sources manifest.

## R05 (P3) — Two cited names do not resolve as written

**Location.**
- README 359: "§0.23a: the slit-plane `log Γ` (`gammaRemainder.slit_logGamma`)".
- README 1289 and 1318: `LSeries_vonMangoldt_eq_deriv_riemannZeta_div`.

**Claim and witness.**
- `roadmaps grep --fixed slit_logGamma` finds the first name only in this README. AnalyticNumberTheoryPartI §0.23a at its head (README line 659) builds the slit-plane `logΓ` but declares no such name, nor does its `Suggested.lean`.
- The Mathlib lemma is `ArithmeticFunction.LSeries_vonMangoldt_eq_deriv_riemannZeta_div`: it sits inside `namespace ArithmeticFunction` at `Mathlib/NumberTheory/LSeries/Dirichlet.lean:439`, and `#check` of the bare name fails.

**Repair.**
- Cite "the slit-plane `logΓ` of AnalyticNumberTheoryPartI §0.23a" without a declaration name.
- Write the qualified name `ArithmeticFunction.LSeries_vonMangoldt_eq_deriv_riemannZeta_div`.

## Verified sound

**Gate, build and dependencies, run here at `1a57053`.**
- `gate … ExplicitZetaBounds --base origin/main` reports every check at `0`, including `latex`, `tex`, `prnum`, `statement-hygiene`, `readme-ids-missing`, `stray-files`, `outside-folder`, `depcheck` and `source-material`, and ends `OK`. The worker's `gate.md` agrees and records `build=0`.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/ExplicitZetaBounds'` prints nothing. The folder holds `README.md`, `Suggested.lean` and `metadata.toml`.
- The dependency check prints `depcheck: 239 roadmaps, 2353 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. The merge order has LFunctions at 27, ZerosOfLFunctions at 48, AnalyticNumberTheoryPartI at 49, AnalyticNumberTheoryPartII at 50, SieveMethodsAndPrimePatterns at 55 and ExplicitZetaBounds at 265. Its consumers come later: ExplicitPrimeCounting at 267, ExplicitCharacterSumsAndSieves at 268, ExplicitMultiplicativeFunctions at 269 and ExplicitNumberFields at 270.
- `lake env lean TauCetiRoadmap/ExplicitZetaBounds/Suggested.lean` exits 0 with 41 warnings, all ``declaration uses `sorry` ``, and nothing else.
- A scratch copy with `#check @name` for all 69 declarations exits 0 and prints 69 types. The file has no `variable` block, so no binder can be lost. I compared the six new signatures with README 550–566, 650–655, 1292–1312, 2068–2104 and 2140–2147; they agree.
- One-tactic probe: every `sorry` was replaced by `first | rfl | simp | norm_num | infer_instance | positivity | decide`, and all 41 theorems still fail (41 errors, one per theorem). Nothing is padding by this test.

**Sources: the seeded sample, checked at the cached texts.**
- **0.5:** `mossinghofftrudgian2015` lines 73–75, the class `P_n` with `a₁ > a₀`, restated at 129.
- **2.1:** `brent2019` lines 258–259 (Remark 6, Olver (8.4.06), `|R_k| ≤ |T_k| sec^{2k}(θ/2)`). Brent's `R_k` is the remainder after `k − 1` terms (lines 121–126), the same as `r_n` here.
- **2.7:** the bound follows from AnalyticNumberTheoryPartI §0.23a (its line 662, `|R^{(j)}| ≤ j! sec^{j+2}/(8|z|^{j+1})`) at `j = 1`. `sec³(π/4)/8 = 1/(2√2)`, and the consequence with `√2/|σ + 2 + it|²` checks. Its `ieantn` citation is R04.
- **4.6:** `hiarypatelyang2024` lines 72–80 (Lemma 2.1, `R(t)`) and 81–85 (Lemma 2.2, `−2.08`); `ford2002zerofree` line 139 (Lehman, `|t| ≥ 128π`).
- **4.8:** `patel2022` lines 61–66 (including `8.261…·10⁶⁰`) and 46–49; `hiaryleongyang2025` lines 31–32, 109–117 and 439–448; the record at 1171–1175 (Carneiro et al.'s `2.079 log t` on `[2, 500]` implies the recorded `431.7 log t/log log t`).
- **4.9:** `yang2024` lines 53–55, 55–58, (3.4) at 722–728, and 729–770 (the PL edges with equal log exponents, so Fiori's correction does not apply).
- **4.9a:** `ford2002vinogradov` lines 167–178, 189–201, 220–234 (Theorem 3, as `vinogradovCount_le_ford` states it) and 129–130 (Theorem 2; README's `N ≥ 2` is right, `λ` being undefined at `N = 1`); `bellotti2024` lines 60–63, 216–225 and 228–230.
- **5.2a:** `hasanalizadeshenwong2022` lines 61 (Corollary 1.2, `9.3675`) and 76–77 (Corollary 1.4, both triples); `bellottiwong2025` lines 54–58 (Table 1) and 81–82 (the `9.4925` footnote).
- **6.3a:** `grahamvaaler1981` lines 407–408 (Theorem 9). `E(λ, x)` (1.17), line 123, is `I_ν`, and (1.18) with a point mass covers it. Their `B(u) = u e^u/(e^u − 1)` (line 288) is `B⁺`.
- **7.1:** `davenport2000` is uncertified. Instead I checked `B = −0.0230957` and the identity at `s = 0` (`−1.837877` on both sides).
- **7.3:** `mty2024` lines 96–97 (Theorem 1.3, `≥`), 86–87 (`5.5666305`) and 1360–1377 (`θ = 1.13489`, `C(η) ≤ 0`, `K` increasing); `mossinghofftrudgian2015` lines 117–118 (`>`), 157–166, 175–177, 219–229, 240, 263 and 265; `jangkwon2014` lines 10–15 (`≥`), 215–217, 353–354, 439–441, 597–603.
- **7.7:** `bordignon2019` lines 53–59 and 63–71, (10) at 160–168, (12) at 179–185; `bordignon2020` lines 56–58, 60–62 and 64–66; `ralaivaosaonarazakarinoro2026` lines 69–76 (arXiv `6.5`; the journal's `6.035` is the weaker statement and is implied).
- **7.9:** `banks2026` lines 89–107; `guo2026` lines 23–26, 54–56 and 57–61; `luzamanzhao2026` lines 39–42.
- **8.3a:** the predicate's API was checked by computation (table below); `fks2023psi` lines 370–389 give Theorem 2.7 with the hypotheses of 8.3.
- **9.3:** `mossinghoffstarichkovatrudgian2022` lines 44–49 and 440–446 (`0.41292867 ≥ 1/9.690292`); `luzamanzhao2026` lines 96–99 and 368–371 (the `q ≤ 10⁶` computation and Hoffstein's lemma).
- **Also read for the new statements:** `bellottiwong2025` lines 113–124 (Theorem 1.4, (1.2)) and 1028–1037 (Table 2, third row `C₁ = 0.11200`, `C₂ = 0.12567`, `C₃^S = 2.89916`); `trudgian2014argument` lines 14, 27–35 and 46 (arXiv constants `0.111`, `0.275`, `2.450`, as README 2121 says); `kadiri2005` line 992; `thornerzaman2024` line 305; `kadirilumleyng2018` lines 19 and 25 (`H₀ = 3.0610046·10¹⁰`) and 83–87; `ramare2016density` line 284.

**Duplication, ownership and citations.**
- Pinned declarations opened:
  - Mathlib `LSeries/RiemannZetaLogDeriv.lean:35` (R03); `LSeries/Dirichlet.lean:341, 348, 352, 439`; `LSeries/HardyZ.lean:79–122`.
  - Tau Ceti `NonnegCombination.lean:48, 58, 66, 83`; `ThreeFourOne.lean:99` (namespace `TauCeti.LSeries`); `Perron/Basic.lean:142, 204`; `Perron/Formula.lean:130, 229`; `LSeries/RiemannZeta.lean:39–61`.
  - A `#check` of the README's 156 external backticked names leaves unresolved only roadmap names, notation and the two names of R05.
- Roadmaps grepped for this head's new objects: `Kalmynin`, `Vaaler`, `one-sided exponential`, `ZetaZeroFreeUpTo`, `ClassicalZeroFreeRegion`, `ZetaZeroDensityBound`, `ZetaZeroCountBound`, `Beurling`, `Kusmin`, `Gabcke`, `Preissmann`. ExplicitPrimeCounting (README 175, 214, 517, 557, 567, 2243) cites §§5.2a, 6.3a, 7.3a and 8.3a from here, so there is one owner and one direction. No other open roadmap owns these objects.
- AsymptoticExpansions §13.1 at its head (line 1415, `TauCetiRoadmap.AsymptoticExpansions.sum_Icc_eq_eulerMaclaurin`, `f : ℝ → ℝ`) is the real case that README 49–52 names. That overlap was settled in an earlier round, and the namespaces differ.
- SieveMethodsAndPrimePatterns `Suggested.lean` 236 and 261 have the two §2.9 names. `overlaps.md` reports no open pull request changing this roadmap and no dropped ids.

**Adversarial table.** Every row was computed here. Values of `ζ` come from Euler–Maclaurin with the functional equation for `Re s < 1/2`, checked against `ζ(2)`, `ζ(−3)` and the zero at `14.1347`.

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| `KalmyninRecord` (new) | boundary of `[−3,5]×[−4,4]`, 4800 points | max `\|G\|` = `1.395429` at `−3` (`ζ′/ζ(−3) = 0.645429`), ≤ `1.396` | ✓ |
| `neg_logDeriv_riemannZeta_laurent` (new) | Taylor coefficients on `\|s−1\| = 1` | `a₀..a₈ = 0.577216, 0.187546, 0.051689, 0.014752, 0.0045245, 0.0014468, 0.00047154, 0.00015518, 0.00005135`, all `> 0`; bound at `n = 5`: `3⁻⁶ − 1.396·4⁻⁵ = 8.46·10⁻⁶ > 0`, at `n = 4` `< 0`; `a₇·3⁸ = 1.018` (radius 3) | ✓ |
| 3.4 reflection identities (new) | `s = 2`, `−1` | `ζ′/ζ(2) = −0.569961`, `ζ′/ζ(−1) = 1.985054`, sum `1.415093 = log 2π − 1 + γ`; `(ζ′/ζ)′(−1) = −0.937985`, `(ζ′/ζ)′(2) = 0.884482 > 0` | ✓ (R03) |
| `abs_zetaZeroCount_sub_riemannSiegelTheta_le` (new) | `T = 30 610 046 000` | `0.112·24.1446 + 0.12567·3.18406 + 2.89916 = 6.0035`; `3.77417 − 2.89916 = 0.87501 ≈ 7/8` | ✓ |
| `zetaZeroCountBound_trudgian` (new) | `T = e`; `T = H₀` | `2.5167 + 1/(40e) = 2.5259 ≤ 2.622`; `6.0035 ≤ 6.0994`; `0.15233·3.18406 = 0.48502 > 0.38916` | ✓ |
| `zetaZeroCountBound_chirreHelfgott` (new) | `t = 1, 14, 5400`; `L = 7.032` | `\|−M(1)\| = 0.4233 ≤ 2`; `2.5185 ≤ 2.5278`; margin `0.000503` at `log 5400`; `−0.009038` at `L = 7.032` (negative control) | ✓ |
| `zetaZeroCountBound_seven_eighths` | `T = 2`; `L = 175.3`, `172.87` | `0.1923 ≤ 8.3451`; `6.77938 ≤ 6.7795`; `0.590962 ≥ 0.59094` | uses Rosser on `[2, 1467]`: R01 |
| `zetaZeroCountBound_rosser` | `T = 2, 14.2, 22.5, 1467` | right sides `1.5206, 2.383, 2.5177, 3.467`; S(T) record allows `2.5185` at `14.2`; true `\|N − M\| = 0.542` at `14.2` (`N = 1`) | R01 |
| `ZetaZeroFreeUpTo` (new) | first zero | `\|ζ(1/2 + 14.134725i)\| = 1.7·10⁻¹⁵`; `14 < 14.134725` | ✓ |
| 7.3a two forms | `R = −1`, `R' = 0.1`, `t₀ = 2` | boundaries `1 + 1/log 2 > 1` and `−2.776` at `γ = 14.13` | ✗, R02 |
| 7.3a lowering the height (new) | `R = 5.558691` | `e^{2/R} = 1.43304`; boundary `1/2` at equality | ✓ |
| `riemannZeta_eq_partialSum_halfInteger` | `1/2 + 30i, N = 10`; `1/2, N = 3`; `3.1i, N = 0`; `2 + 60i, N = 10` | errors `0.003137 ≤ 0.009025` (`+c`: `0.0954`, no term: `0.0476`); `0.003154 ≤ 0.012727`; `11.65 ≤ 43084`; `0.00924 ≤ 0.06454` | ✓ |
| 4.5c cotangent expansion (new) | `z = 1/2` | `Σ ζ(2n) 4⁻ⁿ = 1/2` from `π cot(π/2) = 0` | ✓ |
| `riemannZeta_eq_sum_add_integral_sawtooth`, `…_fract` | `s = 0.3 + 5i`, `a = 1, 2.5, 3, 7.3` | all differ from `ζ(s)` by the same `5.36·10⁻⁸` (tail truncated at `2·10⁵`) | ✓ |
| `sum_Ioc/Icc_…_sawtooth`, `sum_Icc_eq_eulerMaclaurin` | `f = 1` on `[0, 1]`; `f = x²`, `m = 1` | `1 = 1 − 1/2 + 1/2`; remainder `n/6` gives `n³/3 + n²/2 + n/6` | ✓ |
| `norm_Gamma_bounds` | `1/2+10i`, `2+0.1i`, `0.1+0.1i`, `3+40i` | `3.77596e−7 < 3.77753e−7 ≤ 3.84094e−7`; all four bracketed | ✓ |
| `norm_riemannZeta_le_linear` | `z = 1.01`, `2`, `0.5+2i`; disc `t = 2, 10` | `100.578 ≤ 102`; `1.6449 ≤ 3`; `0.540 ≤ 5.61`; `1.254 ≤ 11`, `1.550 ≤ 27` | ✓ |
| `riemannZeta_strictAntiOn` | `σ = 2, 3, 4` | `1.64493 > 1.20206 > 1.08232 > 1` | ✓ (R03) |
| `norm_riemannZeta_criticalLine_le` | `t = 3, 10, 200` | `0.5385 ≤ 0.8154`; `1.5492 ≤ 2.0887`; `5.5898 ≤ 7.9183` | ✓ |
| `abs_hardyZ_sub_riemannSiegel_le` | `t = 200` | `R(200) = 0.3959`; Lemma 2.2 `9.5011 − 2.08 = 7.421` | ✓ |
| `norm_riemannZeta_one_add_le` | `t = 3, 10, 100` | `0.6380 ≤ 1.0986`, `≤ 20.22`; `1.3946 ≤ 2.3026`; `1.6343 ≤ 4.2326` | ✓ |
| `vinogradovCount_le_ford` | `k = 1000`; `J_{2,1}(2)`, `J_{2,2}(3)` | `Δ = 11343` at `s = 2k²`, `1001.70` at the top; counts `6`, `15` | ✓ |
| `norm_riemannZeta_le_richert` | `0.75+10i`; `σ = 1`, `t = 10¹⁰` | `1.466 ≤ 478.3`; `616.7` | ✓ |
| `abs_zetaZeroCount_sub_le(_of_recorded)` | `T = e` | `8.1842`, `3.8862` against `3.4009` | ✓ |
| `dirichletZeroCount_explicit` | `χ₋₄`, `T = 10` | `ℓ = 2.0333`, main term `2.9588`, error `2.1816`, true `N = 2 ∈ [0.777, 5.140]` | ✓ |
| `neg_logDeriv_riemannZeta_eq` | `s = 0`, `2` | `−1.837877` on both sides; zero sum `0.069066` | ✓ |
| `riemannZeta_ne_zero_classical` | `\|t\| = 2`, `3·10¹²` | `0.740461`, `0.993738` | ✓ |
| `riemannZeta_ne_zero_littlewood` | `t = e^{200}`, `10¹⁰` | width `0.0012477`; Ford `0.0061956 < 0.0064156` (needs RH to `3.06·10¹⁰`) | ✓ |
| `LFunction_real_zero_le_bordignon` | `q = 4·10⁵` | `800/(√q log²q) = 0.007602`; `46π/0.18 = 802.85`, `515.74`, `83.47` | ✓ |
| `inv_norm_riemannZeta_one_add_le` | `t = 3, 50` | `1.5675 ≤ 5042.9`; `1.9111 ≤ 1238.1` | ✓ |
| `zetaZeroCountRight_le_kadiri`, `zetaZeroDensityCount_nine_tenths_lt`, `…_bellotti` | `T = H₀`; `T = 3·10¹²`, `σ = 0.9927` | `1.702·10¹⁰`, `1.353·10¹⁰`; `1.914·10⁸`; `2.19·10¹¹` | ✓ |
| 8.3 squarefree sums | `D = 1411, 1663, 1664, 1700`; `N = 1000` | counts `863, 1017, 1017, 1035`; errors `5.215 > 5.007`, `6.017 > 5.436`, `5.409 ≤ 5.438`; no failure on `[1664, 4000]`; `Σ μ²/n = 5.242393 ∈ [5.239412, 5.247412]` | ✓ |
| 8.3a predicate | `{9/10}`; `c₁ = c₂ = 0` on `{1/2}` | `p = 4/15`, `q = 16/5`; with `RH(T₀)` it is RH | ✓ |
| 6.3a | `ν = 1`; `z = iπ/2` | `0.58198 + 0.41802 = 1`; `\|(z coth z)′\| = π/2 = \|z\|` | ✓ |
| 7.9 | `c = 1/5`, `1/100`, `3·10⁻³` | `1/9.645908801 = 0.10367 < 1/5`; antitone `3·10⁻³ < 1/100` | ✓ |
| `norm_LFunction_one_ge`, `LFunction_one_ge_luZamanZhao` | `q ≤ 10⁶`; `q = 3` | `0.41293 ≥ 0.103196`; `0.604600 ≥ 0.113780`; `1.507/11.657 = 0.12928 > 1/8` | ✓ |
| `LFunction_ne_zero_of_platt`, `plattHeight` | `q = 1`; `q = 400 000` | `ζ(1/2) = −1.46035 < 0`; `H = 387.5` | ✓ |

## Not verifiable

- `chirrehelfgott2025`: an image-only scan, and this worker has no OCR. It is cited for 0.4 (the first ordinate), 3.4 (Lemma A.7, §8), 5.2a (Lemma B.1) and 6.3a (Proposition 4.1, Lemmas 4.2–4.3). The mathematics of these items was checked by computation (table above).
- `leong2026`, `leeLeong2022`, `hoffstein1981` and `cullyhugilljohnston2025`: image-only scans. None of their locators changed.
- `rosser1941`: uncertified. Theorem 19's range is the subject of R01.
- `davenport2000`, `ramare2001`, `titchmarsh1986`, `backlund1918`, `dlmf` and the other uncertified works, and the waived `gabcke1979`: cited by locator only.
- The journal version of `ralaivaosaonarazakarinoro2026`, with its constant `6.035`: not read. The arXiv statement read here implies it.
- `ieantn` and `primenumbertheoremand`: no locator to check (R04).

## Source issues

- **Error** in ramare2016density at Lemma 3.1, p. 5 (line 284): the source says the error `0.1333√D` holds for `D ≥ 1004`; it should be `D ≥ 1664`, because it fails at `D = 1411` (count 863, error 5.215 > 5.007) and up to `D = 1663`; affects a stated result.
- **Misprint** in fks2023psi at Remark 2.8 (line 391): the source says Kadiri–Lumley–Ng's table used `H₀ = 30 601 646 000`; it should be `30 610 046 000`, the `3.0610046·10¹⁰` of kadirilumleyng2018 line 25; affects nothing.
- **Misprint** in hasanalizadeshenwong2022 at Corollary 1.2 (line 61): the source says the constant is `9.3675`; it should be `9.4925` for that paper's argument; affects a stated result; corrected in print at bellottiwong2025 footnote 1 (lines 81–82).
