# Review of ExplicitZetaBounds (pull request #1954 at 297a91d)

**Verdict:** needs changes

This is a full review: the folder changed by 226 lines since `4478804`, the head the previous review read. Both findings of that review are repaired (details below). This review raises one new finding, at P2, in the proof route of 4.9, which the route of 7.4 repeats.

## Previous findings

- **R01 (P2), Rademacher's general bound statable at the pins: repaired.**
  - `Suggested.lean` 384–386 defines `continuedL d s` as the limit at `s`, through `z ≠ s`, of `N^{−z/2} Λ(z)/γ(z)`. Lines 412–426 state `norm_continuedL_le_rademacher` on `TauCeti.LFunctions.AnalyticLFunctionData`, and the module docstring (72–74) now reads "Every headline theorem of the README is statable at the pins".
  - README 1219–1240 names the theorem and explains the two encodings, the limit and the explicit growth bound for *IsFiniteOrder*. README 334–357 lists the Tau Ceti declarations with their files. The Layer 4 line (365–367) reads "completed function `q^{s/2}` times Mathlib's `DirichletCharacter.completedLFunction χ s`".
  - The repair goes beyond the suggested text, in two ways that make the general statement correct where the suggestion was not:
    - `hC` reads `∀ ν ∈ d.gammaC, ν = 0` instead of `d.gammaC = 0`, so the Dedekind records stay in.
    - The new `hP₀` (a pole of `Λ` at `0` needs `0 ∈ gammaR` or a `Gammaℂ` factor) excludes the record whose `continuedL` has a pole at `0`, as README 1288–1295 shows.
  - Both were checked against Tau Ceti (`HasFunctionalEquation.polarOrder_one_sub_conj` makes poles at `0` and `1` come together) and against the table below.
- **R02 (P3), the attribution of O\*: repaired.** README 441–443 now reads "the notation of the explicit literature, defined for instance in `kadiri2005` line 257 and in `ramare2016density` line 207". Both lines define `u = O*(v)` as `|u| ≤ v`.

## R01 (P2) — 4.9's interpolation step does not follow from 3.1

**Location.**
- README 1927–1929 (4.9): "for `3 ≤ t ≤ T_k`, 3.1 between `σ = 1/2` and `σ = 1` applied to `(s − 1)ζ(s)` with the factor `1.31 + s`, the edges being the first item of 4.7 and `|ζ(1 + it)| ≤ log t`".
- The same step in 7.4, README 3033–3036 ("interpolated by 3.1 (his Lemma 4.3 …").
- The 3.1 Check at README 1213–1215.

**Claim.** The edge bounds of this interpolation carry a factor `log|1.31 + s|`: YangRecord, the first item of 4.7, and `log t` on `σ = 1`. Theorem 1 of `fiori2025` (3.1) interpolates only moduli `|G_i|` of holomorphic `G_i`. So, even with equal exponents on the two edges, a logarithmic factor enters the conclusion as `|log(1.31 + s)|`, never as `log|1.31 + s|`.

Yang's step, `yang2024` (3.9), writes `log|Q₀ + s|` in the conclusion. That is the slip Fiori corrects, and it matters here, because Yang's margin at `t = T_k` is far smaller than the correction:
- The constant `2.6134` of `T_k` is `6 log 1.546 = 2.614074` rounded down. Together with `A(e^{8.7}) ≤ 1.0001` in (3.13)–(3.15), this leaves a factor of about `1.0001` at `T_k`.
- At `T_4` the ratio `|log(Q₀ + s)|/log|Q₀ + s|` is `1.00138`.

So the route through 3.1 does not prove 4.9 at `k = 4` on `29.79 ≤ log t ≤ log T_4`. Yang's §3.2 argument starts at `t ≥ T_k`, and its constant `γ₄ = 1.546` is attained (`yang2024` line 1191). The step of 7.4 (`yang2024` (4.21), lines 1549–1555) interpolates the same factor between `σ = 1/2` and `σ = 5/7`. 4.9 feeds 5.2, 7.4, 7.6 and 8.5, and through them the headline theorems that carry YangRecord.

**Witness.**
- `fiori2025` lines 91–109: `|log(Q + s)| ≥ log|Q + s|`, and the interpolation yields `|log(Q + s)|`.
- `yang2024` lines 766–769 write `log|Q₀ + s|`.
- Computed at `k = 4`, `σ = 5/7`, `t = T_4 = e^{29.8442}`: `1.546 t^{1/14} log t` divided by the corrected bound is `0.998722`.

**Repair.**
- In 4.9, replace "with the factor `1.31 + s`" by: "with the factors `1.31 + s` (exponents `7/6` and `1`) and `G(s) = (1/2) log((1.31 + s)(3.31 − s))` (`fiori2025` §3, lines 241–277; exponent `1` on both edges, so no monotonicity condition is needed)". Add the three facts the route then uses:
  - for `1/2 ≤ σ ≤ 1`, `Re G(σ + it) ≥ log|1.31 + σ + it|`, since `|3.31 − s| ≥ |1.31 + s|` there, and `Re G(σ + it) ≥ log|t|`. Hence YangRecord, 4.7, 3.3 and PatelRecord give the edge hypotheses with `|G|` in place of the logarithms;
  - `|G(σ + it)| = log t + O(t^{−2})` as `t → ∞`;
  - `|G| ≥ 0.81` on the strip, which is the lower growth bound that 3.1 requires.
- Make the same substitution in the route of 7.4 for Yang's Lemma 4.3. On `1/2 ≤ σ ≤ 5/7`, `|3.31 − s| ≥ |1.31 + s|` still holds.
- In the 3.1 Check, add that a factor `log(Q + s)` interpolates as `|log(Q + s)|`, not `log|Q + s|`, even with equal exponents.

**Tested on the instance that refuted the route.**
- At `t = T_4`, `σ = 5/7`, the bound with `|G|` agrees with Yang's form to within `10⁻²⁰` relatively. It lies below `1.546 t^{1/14} log t` by the factor `1.000104`.
- At `t = 3` the factor is `1.336`, against `1.385` for Yang's form.
- On the edges, the minimum over `|t| ≤ 3` of `Re G − log|1.31 + s|` is:
  - `0.0799` on `σ = 1/2`;
  - `0` (equality) on `σ = 1`.
- The minimum over `3 ≤ t ≤ 1000` of `Re G − log t` is `2.7·10⁻⁶ > 0`.

## Verified sound

### Gate, build, dependencies and Lean form (run here at 297a91d)

- **Gate.** `gate … ExplicitZetaBounds --base origin/main` prints every check at `0` and ends `OK`. The worker's `gate.md` agrees and records `build=0`.
- **Dependency check.** It prints `depcheck: 239 roadmaps, 2353 edges, 0 problem(s)` and exits 0, with no UPWARD, CYCLE or `moved:` line. The merge order lists:
  - suppliers: LFunctions (27), ZerosOfLFunctions (48), AnalyticNumberTheoryPartI (49), AnalyticNumberTheoryPartII (50) and SieveMethodsAndPrimePatterns (55);
  - this roadmap at 265;
  - consumers: ExplicitPrimeCounting (267), ExplicitCharacterSumsAndSieves (268), ExplicitMultiplicativeFunctions (269) and ExplicitNumberFields (270).
- **Changes outside the folder.** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/ExplicitZetaBounds'` prints nothing.
- **Elaboration.** `lake env lean TauCetiRoadmap/ExplicitZetaBounds/Suggested.lean` exits 0. It prints 43 warnings, all ``declaration uses `sorry` ``, and nothing else.
  - The file has 73 declarations: 43 theorems, 29 definitions and one proved `example`.
  - It has one `import Mathlib` and the two Tau Ceti modules it uses, `TauCeti.NumberTheory.LFunctions.Data.Basic` and `.Data.RiemannZeta`; both exist at `2fd255d`.
  - It has no `variable`, `include`, `set_option`, `lemma`, `#eval` or `#print`.
- **Signatures.**
  - A scratch copy with `#check @name` for all 72 named declarations elaborates without error. With no `variable` block, no binder can be lost.
  - I compared `continuedL` and `norm_continuedL_le_rademacher` with README 1219–1240 and the docstring: hypotheses `hD`, `hM`, `hF`, `hR`, `hC`, `hP`, `hP₀`, `hfin` and `hmaj`, range `−η ≤ Re s ≤ 1 + η`, `s ≠ 1`, and the factor `P(s)`. They agree.
- **The `example` (line 391)** proves `continuedL riemannZetaData 0 = −1/2`. It tests the nontrivial behaviour of the kept definition at a common pole of `Λ` and `γ`, so it is not padding.
- **One-tactic probe.** Every `sorry` was replaced by `first | rfl | simp | norm_num | infer_instance | positivity | decide`, and all 43 theorems still fail with unsolved goals. Nothing is padding.
- **Names.**
  - The two leads in `citations.md`, `SieveTaper.sharp_additive_largeSieve` and `SieveApplications.sharp_primitive_largeSieve`, exist at the head of SieveMethodsAndPrimePatterns: its `Suggested.lean` lines 225 and 250, in namespaces opened at lines 209 and 245.
  - The library names that this head's diff adds all resolve at the pins: `Complex.Gammaℝ_mul_Gammaℝ_add_one`, `Filter.limUnder`, `DirichletCharacter.rootNumber`, the six `riemannZetaData_*`/`dirichletData_has*` predicates and `dirichletData_modOne`. So do `Complex.norm_le_of_forall_mem_frontier_norm_le`, `riemannZeta_residue_one`, `tendsto_riemannZeta_sub_one_div` and `HurwitzZeta.hurwitzZeta`.

### Sources: the seeded sample, read at the cached texts

- **0.5:** `mossinghofftrudgian2015` lines 73–75 (the class `P_n`, `a₁ > a₀`) and 129–130 (restated). Tau Ceti `trigonometricCombination` is at `NonnegCombination.lean:48`, with `…_nonneg_of_boundary` at 66 and `sum_re_neg_log_one_sub_nonneg` at 83.
- **1.6:** `mortici2011psi` lines 67–75 (Theorem 1.1, the psi form in `x`). Lines 178 and 218 prove both inequalities for every real `x ∈ (0, ∞)`, which supports the README's range "real `x > 0`".
- **2.2:** `brent2019` lines 244–255 (Whittaker–Watson, `K(z)` as stated) and `nemes2015` lines 115–121 (Lindelöf, `|csc 2θ|`).
- **2.6:** `nemes2015`:
  - line 38 (`γ₁ = −1/12` in Nemes' sign) and 52–61 (`R_N`);
  - lines 86–100 (Theorem 1.1, (1.4)) and 105–108 (Theorem 1.2);
  - lines 125–135 (the real bound), 169–171 (Theorem 1.3) and 543–554 (the factor below `2`, which gives `(2√N + 1)/2`).

  The sign conversion `(−1)^{N+1} γ_{2N−1} ≥ 0` here follows from Nemes' `(−1)^N γ_{2N−1} ≥ 0`.
- **3.2a:** no source. The route `ζ(z) = 1 + 1/(z − 1) − z ∫₁^∞ {x} x^{−z−1} dx` with `0 ≤ {x} < 1` is complete, and the constants `2 + 2|z|` and `7 + 2|t|` follow as written.
- **4.6:** `hiarypatelyang2024` lines 72–80 (Lemma 2.1, `R(t) = 1.48 t^{−1/4} + 0.127 t^{−3/4}`) and 81–85 (Lemma 2.2, `− 2.08`). `ford2002zerofree` line 139 has Lehman's bound for `|t| ≥ 128π`, and `128π = 402.1 > 200`.
- **4.9:** `yang2024` lines 53–55 (Theorem 1.1), 722–728 ((3.4)), 729–770 ((3.7)–(3.9)) and 815–830 ((3.13)–(3.15)). Line 1173 (§3.2 from `t₀ = T_k`) and line 1191 (Table 1) are the source of R01.
- **4.10:** `ford2002vinogradov` lines 28–31 (Theorem 1, `A = 76.2`, `B = 4.45`) and 3053–3058 (§7, Lemma 7.1). `bellotti2024` lines 60–63 (`70.6995`, `4.43795`, `|t| ≥ 3`).
- **6.1:** `ramare2007eigen` lines 742–759 (Theorem 7.1, as stated). `cullyhugilljohnston2023`:
  - lines 141–156 (Theorem 2.1, `θ′ = 2/(√(π² + 4) + π)`);
  - line 163 (Lemma 2.2 at height `1`). Its rescaling by `z = Tw`, with `Y = T log y` and `κ′ = κ/T`, gives exactly the README's kernel bound, and equality at `y = 1`.
- **6.3a:** `grahamvaaler1981` lines 407–408 (Theorem 9, uniqueness of the extreme majorant and minorant for `f` of (1.18), line 132). The Fourier-side form and the lemmas of the route are from `chirrehelfgott2025` (Not verifiable). The `L¹` values follow from Poisson summation as the route says.
- **6.6:** `donahelfgottzunigaalterman2022` lines 78–92 (Theorem 1.1, the tails) and 105–120 (Theorem 1.2, all five ranges as stated). `simonic2020` lines 89–92. `kadiri2013density` lines 137–162 (Theorem 1.4, (1.7)–(1.10)).
- **7.3:**
  - `mossinghofftrudgian2015`:
    - lines 110–111 (`5.69693`), 117–118 (Theorem 1, form with `>`) and 157–166 ((2.1));
    - lines 167–179 (`h_θ`, `g₁`, `d₁`), 221–229 (criterion and Kadiri's `R`, `r`, `T₀`, `t₀`, `θ`) and 240 (`5.696924…`).
  - `mty2024` lines 86–87 (`5.5666305`), 96–97 (Theorem 1.3, form with `≥`) and 1362–1377 (`θ = 1.13489`, `d₁`, `g₁`, `C(η) ≤ 0` on `[0, 1/(5 log(3·10¹²))]`).
  - `jangkwon2014` lines 10–15 and 598–603.
- **7.3a:** `kadiri2005` line 163 ((H1)), 174 (zeros below `3.3·10⁹` known), 182 (`0.99555`), 194 (Proposition 2.1 for every complex `s`) and 257 (O\*).
- **7.5:**
  - `kadiri2002thesis` lines 1960–1964 and 1976–1980 (Théorème 11.1, stated for `q ≥ 2`), and 2049–2054 and 2063–2068;
  - `kadiri2018` lines 16–18 (Theorem 1.1) and 127–157 (Theorems 2.1–2.3, `C₁ = 0.247`, `C₂ = 8.949`);
  - `thornerzaman2024` lines 156–170 (Lemmas 2.1–2.3, with the proof of the improvement) and 219–226 (Theorem 2.6);
  - `luzamanzhao2026` lines 39–44 (Theorem 1.1, Corollary 1.2) and 96–99 (Corollary 1.3);
  - `ramare-rumely-1996` lines 795–815 and 838–849 (`C₁(3, 10⁴) = 20.92`, `C₁(12, 10⁴) = 29.68`, and `≥ 15` at line 843).
- **7.9:** `banks2026` lines 89–107 (`q₀ = 10¹⁰`, `δ₀ = 3.0·10⁻³`, small conductors by Lu–Zaman–Zhao) and `guo2026` lines 23–26 and 54–61 (Theorem 1.1, `c = 1/100`, `q ≥ 3`).
- **Also read for R01:**
  - `fiori2025` lines 8–28, 47–70 (Theorem 1, Remark 2), 74–109 (Corollary 3, Remark 4), 184–203 (Theorem 7) and 219–277 (§3, `G_{Q₁,Q₂}`);
  - `bellottiwong2025` lines 321–340 and 457–459. Their interpolations already carry `|log(Q + s)|` and their (2.7), so 5.2's use of them is not affected beyond its input 4.9.

### Library declarations opened at the pins

- **Tau Ceti `NumberTheory/LFunctions/`:**
  - `Data/Basic.lean`:
    - lines 82–100 (the structure);
    - 106 (`degree`), 111 (`gammaFactor`) and 122–129 (`dual`: conjugate coefficients, so `hmaj` holds for the dual);
    - 174, 183 and 193 (the three predicates; `polarOrder_one_sub_conj` at 195) and 202–240 (each predicate passes to the dual).
  - `Data/RiemannZeta.lean:50–58` (`gammaR = {0}`, poles at `0` and `1`).
  - `Dirichlet/Basic.lean:38–49` (`completed s = N^{s/2} χ.completedLFunction s`, no poles for `N > 1`) and 104 (`dirichletData_modOne`).
  - No continued L-function of a record and no Dedekind record exists at the pin. So `continuedL` duplicates nothing, and `dedekindZetaData` is rightly cited from the LFunctions roadmap. `Data/Normalization.lean` and `Data/Comparison.lean` hold only translation and comparison lemmas.
- **Mathlib:** `HurwitzZeta.hurwitzZeta` and the names listed under Names, all elaborated.

### Cross-roadmap citations resolved

- **ZerosOfLFunctions on main:**
  - Layer 0 (319), *IsFiniteOrder* at 372;
  - §§1.1 (430), 1.4 (478), 1.6 (506; *continuedL* at 532–545 is the extension of `N^{−s/2} Λ · invGammaFactor`, which agrees with `Suggested.lean`'s limit wherever it is analytic) and 3.4 (705);
  - Layer 4 (802), with 4.3 (837) and 4.5 (872);
  - §§5.5 (989), 5.6 (1003), 6.3 (1075), 6.4 (1097) and 6.5 (1142);
  - §§7.1–7.4 (1182–1263) and Layer 9 (1586).
- **AnalyticNumberTheoryPartI**, at the head of its open pull request: §0.9 (README 289), §0.23a (659), §0.34 (884), §0.34a (890), §1.5 (1051), §1.6 (1071), §1.7 (1095) and §3.23 (2626).
- **AnalyticNumberTheoryPartII**, at its head: §4.3a.
- **SieveMethodsAndPrimePatterns**, at its head: §2.6 (README 2238), §2.9 (2403), and the two `Suggested.lean` names above.

### Ownership and overlaps

- **Overlaps.** `overlaps.md` lists no pull request that changes this roadmap and no dropped id.
- **The new objects.** `roadmaps grep` for `continuedL`, `AnalyticLFunctionData` and `Rademacher`:
  - no other roadmap's `Suggested.lean` defines a continued L-function of Tau Ceti's record. Completed ArithmeticDirichletSeries has `continuedLFunctionOfWeight` for unitary ideal weights, a different object;
  - ExplicitNumberFields (README 123 and 631) cites ExplicitZetaBounds §3.2 and states only its Dedekind instance, so there is one owner and supply runs in one direction.
- **Ownership against open pull requests** was checked with the index tools and the sibling checkouts the brief gives.

### Adversarial table (all values computed here)

Values come from mpmath (`ζ`, Hurwitz `ζ`, `Γ`, `ψ`, `siegelz`, `siegeltheta`, `zetazero`, `nzeros`).
- The Dirichlet L-functions are sums of Hurwitz values.
- The characters are built from primitive roots, with primitivity checked locally.
- `L(1, χ) = −q⁻¹ Σ_a χ(a) ψ(a/q)`.
- `N(T)` is counted from the zeros up to `286.7` and from `N(1400) = 983` with the zeros up to `1536.6`. Each count was evaluated at each ordinate and just below it.

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| 3.2 `norm_continuedL_le_rademacher` (new) | `ζ`; `χ₋₃`, `χ₋₄`, `χ₅`, complex `χ` mod 5 and mod 7; Dedekind `ℚ(i)` and `ℚ(√5)`; `L(χ₋₃)L(χ₋₄)` (`N = 12`), `L(χ₋₃)L(χ₅)` (`N = 15`); `η ∈ {0.05, 0.2, 0.5}`, 9 values of `σ` × 9 of `t` | minimum relative margins: `ζ` `0` (attained, `0.207886 = 0.207886` at `s = −1/2`, `η = 1/2`); the others `0.412`, `0.533`, `0.307`, `0.415`, `0.359`, `0.669`, `0.775`, `0.726`, `0.593` | ✓ |
| 3.2 Checks (new) | `ζ` at `s = 0`, `η = 1/2`; `ℚ(i)` at `s = −1/2`, `0`; `N^{−z/2}` | bound `1.974795`; `0.172867` vs `0.057206`, `3.676780` vs `1/4` (`L(0, χ₋₄) = 0.5`); `3^{1/4} = 1.316074`, `L(1/2, χ₋₃) = 0.480868` | ✓ |
| `continuedL riemannZetaData 0` | Lean `example` | proved, elaborates | ✓ |
| 4.9 route through 3.1 (R01) | `k = 4`, `σ = 5/7`, `log t = 29.8442, 29.8342, 29.7942, 29.7442, 8.7`, `t = 3` | target / Yang's bound: `1.000104, 1.000343, 1.001296, 1.002488, 1.6546, 1.3853`; target / bound with `\|log(Q₀ + s)\|`: `0.998722, 0.998959, 0.999907, 1.001093, 1.6282, 1.1030`; with Fiori's `G`: `1.000104, 1.000343, 1.001296, 1.002488, 1.6546, 1.3362` | ✗ R01 |
| 4.9 YangRecord Check | `t = 0`, `t = 3` | `0.730177 < 0.732668`; `1.461\|s − 1\| = 4.443458` vs `3.345888` | ✓ |
| 0.5 | `(3, 4, 1)`, `(1, 2)`, `(1, 1)` | `P(π) = 0`; `P(π) = −1`; `a₀ = a₁` | ✓ |
| 1.6 Mortici | `x = 1, 20, 0.1, 0.5, 3` | `−0.0099678 ∈ (−0.075347, 0.059375)`; at `0.9529` of `[−9.44813, −9.44392]·10⁻⁵`; fractions `0.081, 0.314, 0.747` | ✓ |
| 2.2 Lindelöf | `θ = π/3`; `r₁(2e^{iπ/3})` | `K = 1.154701 < sec²(π/6) = 1.333333`; `0.041824 ≤ 0.048113` | ✓ |
| 2.6 Nemes | `γ₃ … γ₇`; `N = 2`, `z = 10`; Theorem 1.2 at `z = 3 + 4i`, `N = 3`; `x = 1` | `−0.00268133, −0.000229472, 0.000784039, 6.97281·10⁻⁵, −0.000592166`; `3.2026·10⁻⁵ ≤ 2.0411·10⁻⁴`; `2.1739·10⁻⁵ ≤ 2.2727·10⁻⁵`; `1.084438 < 1.086806` | ✓ |
| 2.5 `norm_Gamma_bounds` | 1500 random `s`, `σ ∈ (0, 8]`, `\|t\| ≤ 40` | minimum log-margins `1.9·10⁻⁶` (lower) and `0.00416` (upper) | ✓ |
| 3.2a `norm_riemannZeta_le_linear` | 1500 random `z`; 1500 disc points | minimum margins `1.274`, `10.071` | ✓ |
| 3.4 `riemannZeta_strictAntiOn` | `σ = 1.01, 2, 3, 4` | `100.5779 > 1.644934 > 1.202057 > 1.082323 > 1` | ✓ |
| 0.4a `riemannSiegelTheta` | `T = 10, 100` | integral `−3.06707439629`, `87.9721652318`, equal to `siegeltheta` | ✓ |
| 4.5b both theorems | `t ∈ [200, 260]`, step `0.25` | `max\|Z − e^{iϑ}ζ\| = 1.6·10⁻²³`; minimum Riemann–Siegel margin `0.0071` | ✓ |
| 4.5c `riemannZeta_eq_partialSum_halfInteger` | `(1/2, N = 3)`, `(1/2 + 30i, 10)`, `(2 + 5i, 1)`, `(7i, 2)`, `(1.5 − 12i, 4)` | errors `0.00315, 0.00314, 0.0635, 0.0206, 0.00367` against bounds `0.01273, 0.00903, 0.2805, 0.0657, 0.0120` | ✓ |
| 4.6 | `t = 200` | `7.42107`; `R(200) = 0.395942`; `128π = 402.12` | ✓ |
| 4.7 `norm_riemannZeta_criticalLine_le` | `t ∈ [3, 400]`, step `0.1` | minimum margin `0.2768` | ✓ |
| 4.8 `norm_riemannZeta_one_add_le` | the same grid | margins `0.4606` (Patel), `2.3957` (Hiary–Leong–Yang) | ✓ |
| 4.9a `vinogradovCount` | brute force | `J_{2,1}(2) = 6`, `J_{2,2}(3) = 15`, `J_{1,1}(3) = 3` | ✓ |
| 4.10 `norm_riemannZeta_le_richert` | `σ ∈ {1/2, 0.7, 0.9, 1}`, `t ∈ {±3, 10, 100, 1000, −500}`, `u ∈ {0.3, 1}`; Checks | minimum margin `80.49`; `616.735`, `572.216`; exponents `1.5733`, `1.5691` | ✓ |
| 5.2 `abs_zetaZeroCount_sub_le_of_recorded` | `T ∈ [e, 286.7] ∪ [1400, 1536.6]` | margins `7.128` and `2.682` (at `T = 169.91`) | ✓ |
| 5.2a `zetaZeroCountBound_rosser` | `T ∈ [1467, 1536.6]` | margin `2.3079` (at `1474.20`) | ✓ |
| 5.2a `…_rosser_of_recorded`, `…_seven_eighths`, `…_trudgian`, `…_chirreHelfgott` | `T` from `2`, `2`, `e`, `1` to `286.7`, and `[1400, 1536.6]` | margins `1.3283` (`T = 2`), `8.1528` (`T = 2`), `2.5148` (`111.03`), `1.5767` (`T = 1`) | ✓ |
| 0.4 records for `S(T)` | `T ∈ [0, 286.7] ∪ [1400, 1536.6]` | `2 − \|S\| ≥ 0.840`, `2.5167 − \|S\| ≥ 1.357` (at `1474.20`) | ✓ |
| 2.9 bracket | the same ranges | both sides positive (`4·10⁻⁶`, `1.2·10⁻⁵` at `1536.6`) | ✓ |
| 6.1 | `θ′` | `0.2912996`, root of `θ² + πθ − 1` (residual `0`); `1/(πθ′) = 1.092724` | ✓ |
| 6.3a | `ν = 1`; `z = iπ/2` | `0.581977 + 0.418023 = 1`; `\|(z coth z)′\| = π/2` | ✓ |
| 6.6 | `T = 4` | `107.204` (`σ = 1/2`), `43.540` (`σ = 1`) | ✓ |
| 7.3 `riemannZeta_ne_zero_classical` | boundary at `\|t\| = 2`, at the first ordinate `14.13473`, and at `3·10¹²` for `5.558691`, `5.573412`, `4.896` | `0.740461`; `0.932079 > 1/2`; `0.993738`, `0.993755`, `0.992891` | ✓ |
| 7.3 `log(\|γ\|/17)` region | `\|γ\| = 21`, `20` | `0.21131 > 0.20734`, `β = 0.509387`; `0.362100` | ✓ |
| 7.3a | control `R = 0.1`; `e^{2/R}` at `R = 5.558691` | `−2.775530`; `1.433038` | ✓ |
| 7.4 `riemannZeta_ne_zero_littlewood` | first ordinate; `log t = 200`, `23.0259` | `0.982680`; `0.0012477` vs `0.0008995`; `0.0064156` | ✓ |
| 7.5 `LFunction_ne_zero_kadiri`, `LFunction_zeroFree_mcCurley` | `q = 3`; McCurley at `\|t\| = 2`; `Q = 3`; Lu–Zaman–Zhao at `10¹⁰` | `0.837457`; `0.942140`; `0.905635`; `0.995657` | ✓ |
| 7.5 Ramaré–Rumely | `k = 1`, `\|γ\| = 1000`; `k = 3`, `\|γ\| = 10⁴`; form for a modulus at `q = 12` | `ℓ = 5.479408`, `0.0220848`; `0.0131546` (McCurley `0.0100564`, Kadiri `0.0173220`); `0.0119788 < 0.0142635` | ✓ |
| 7.5 Kadiri's thesis | `q = 2` boundary; floors for `q ≥ 3` and the narrower form | `−0.100791`; `0.715732`, `0.775822` | ✓ |
| 7.6 `riemannZeta_ne_zero_vinogradovKorobov` | first ordinate | boundary `0.990460 > 1/2` | ✓ |
| 7.7 `LFunction_real_zero_le_bordignon` | `q = 4·10⁵`; the ratios | `0.0076021, 0.0048938, 0.0007602`; `802.85, 515.74, 83.47` | ✓ |
| 7.9 | McCurley constant | `1/9.645908801 = 0.1036709`; `1/100 > 3.0·10⁻³` | ✓ |
| 8.1, 8.3, 8.4, 8.5 headlines | `T = H₀`; `Q = 3`, `σ = 39/40`; `T = 10¹³`, `σ = 0.9927` | `1.702195·10¹⁰`, `1.353232·10¹⁰` (slope `0.5561 < 3.5502`); `1.913896·10⁸`; `log₁₀ = 99.70588`; `2.22295·10¹¹` vs `N(T)/2 = 2.156·10¹³` | ✓ |
| 8.3 squarefree sums | `D ∈ [1004, 6000]`; `D = 1700`; `N = 1000` | fails only at `D = 1411, 1419, 1659, 1662, 1663`; `1035`; `5.242393 ∈ [5.239412, 5.247412]` | ✓ |
| 9.1 `norm_LFunction_one_le_ramare` | all 4709 primitive `χ`, `3 ≤ q ≤ 160` | minimum margins: even `0.3506` (`q = 73`), odd `0.2179` (`119`), `2 ∣ q` even `0.0920` (`76`), `2 ∣ q` odd `0.0134` (`104`) | ✓ |
| 9.2 | the same characters | `3 ∣ q` even `0.1524` (`129`), odd `0.0227` (`111`); `χ(2) = 1` even `0.3305` (`73`) | ✓ |
| 9.3 `norm_LFunction_one_ge`, `LFunction_one_ge_luZamanZhao` | the same characters | minimum margins `0.2972` (`q = 59`), `0.3527` (`q = 5`) | ✓ |

## Not verifiable

- **Image-only scans that this worker cannot read without OCR.** `needs-references.toml` already lists them:
  - `chirrehelfgott2025` (0.4, 3.4, 5.2a, 6.3a);
  - `leong2026` and `leeLeong2022` (7.10);
  - `hoffstein1981` (9.3);
  - `cullyhugilljohnston2025` (6.2).
- **Uncertified works, cited by locator only.** Their statements were checked by computation where the table shows it:
  - `rademacher1959` (2.8, 3.2), `ramare2022excursions`, `backlund1918`, `rosser1941` and `lehman1966`;
  - `montgomeryvaughan1974`, `preissmann1984` and `elliott1987`;
  - `ramare2001`, `davenport2000`, `titchmarsh1986`, `mccurley1984`, `dlmf` and `cullyhugilltrudgian2021`;
  - `gabcke1979`, which is waived.

## Source issues

- **Gap** in yang2024 at §3.1, (3.9), p. 16 (lines 766–769): the source says the Phragmén–Lindelöf interpolation of `(s − 1)ζ(s)` gives `log|Q₀ + s|`; it should be `|log(Q₀ + s)|`, larger by `1.0014` near `T₄`, above the margin `1.0001` of (3.15); affects the proof.
- **Gap** in yang2024 at the proof of Lemma 4.3, (4.21), p. 30 (lines 1549–1555): the source says the interpolation between `σ = 1/2` and `5/7` keeps `log|Q + s|`; it should be `|log(Q + s)|`, or Fiori's `G_{Q₁,Q₂}`; affects the proof.
- **Error** in kadiri2002thesis at Théorème 11.1, p. 55 (line 1960, `q ≥ 2`): the source says the region's only possible zero belongs to a real non-principal character; it should exclude `q = 2`, where the boundary is `−0.1008` and the principal factor vanishes at `s = 0`; affects a stated result.
- **Error** in ramare-rumely-1996 at the proof of Theorem 3.6.2, p. 408 (line 814): the source says the bound at `k = 1`, `|γ| = 1000` is less than `0.02194`; it should be `0.022085`, from `ℓ = 5.47941`; affects nothing.
- **Error** in ramare2016density at Lemma 3.1, p. 329 (line 284): the source says the error `0.1333√D` holds for `D ≥ 1004`; it should be `D ≥ 1664`, because it fails at `D = 1411, 1419, 1659, 1662, 1663`; affects a stated result.
