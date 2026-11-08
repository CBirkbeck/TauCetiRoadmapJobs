# Review of ExplicitPrimeCounting (pull request #1945 at fc7b018)

**Verdict:** needs changes

Four findings: one P2 and three P3.

- All eight findings of the previous review are repaired (table under Verified sound).
- The gate passes and the dependency check reports 0 problems.
- `Suggested.lean` elaborates with 15 `sorry` warnings and nothing else.

R01 and R03 are supplier drift. ExplicitZetaBounds moved from `bd1ac3ea`, the head the previous review read, to `fcc94b0a`:

- R01: its §7.5 now states the modulus form of Ramaré–Rumely's region, which this README proves in §6.1.
- R03: its §8.2 is gone, and §7.5 of this README still cites it.

R02 is a Mathlib theorem restated in §6.5. R04 is a slip in a §1.1 Check.

## R01 (P2) — The modulus form of Ramaré–Rumely's region has two owners

**Location.** `TauCetiRoadmap/ExplicitPrimeCounting/README.md` lines 3547–3560 (§6.1): "The region of the first shape, proved here from ExplicitZetaBounds §7.5: define *RamareRumelyRegion* `q H C` … Prove that for `q ≥ 1` and `H ≥ 1000` it holds at Dusart's constant `C₁(q)`". Related:

- line 3527 says "(below, where it is proved at Dusart's `C₁(q)`)";
- the Check at lines 3604–3608 compares the modulus form with the conductor form.

**Claim.** ExplicitZetaBounds now states this lemma itself, at its head `fcc94b0a`. Its §7.5, fifth item, ends with "Hence the form for a modulus":

- the hypotheses are `q ≥ 1`, `H ≥ 1000`, and `0 < C ≤ C₁(k, H)` for the conductor `k` of every character modulo `q`;
- the conclusion is that every zero of `L(s, χ)` with `0 < β < 1` and `|γ| ≥ H` satisfies `1 − β ≥ 1/(R log(q|γ|/C))`, with the same route.

Dusart's `C₁(q) = min(min_χ C₁(k_χ, H), 32π)` satisfies that hypothesis. So the supplier's statement at `C = C₁(q)` is exactly *RamareRumelyRegion* `q H C₁(q)`. Two open roadmaps owning one object is a P2 finding. The owner is ExplicitZetaBounds, which comes earlier in the order of supply.

**Witness.** ExplicitZetaBounds README (head `fcc94b0a`):

- line 2274: "Hence the form for a modulus: for `q ≥ 1`, `H ≥ 1000` and `0 < C ≤ C₁(k, H)` …";
- the Check at line 2314 (modulo `6`, `χ₋₃`, `|γ| = 10⁴`, `C = 20.92`) gives `0.013022`, which is this README's Check value at lines 3604–3608.

**Repair.**

1. Replace "Prove that … The instances of the first shape below take the region from this theorem" (lines 3550–3560) by a citation of ExplicitZetaBounds §7.5, the form for a modulus, at `C = C₁(q)`. Note in one clause that Dusart's `C₁(q)` meets its hypothesis. Keep *RamareRumelyRegion* only as this roadmap's name for that statement, or drop the name.
2. At line 3527, replace "(below, where it is proved at Dusart's `C₁(q)`)" with that citation.
3. Add the modulus form to the contract of `gap:dirichlet-zero-free-constants` (line 474).
4. Adjust lines 3572, 3583 and 3586–3587, and the Layer 6 Dependencies (lines 3933–3934), to cite the modulus form.
5. Delete the Check at lines 3604–3608, which the supplier now carries.

Tested at `q = 6`, `H = |γ| = 10⁴`, `C = 20.92`: the supplier's form gives `1/(9.645908801 log(6·10⁴/20.92)) = 0.013022`, the README's value.

## R02 (P3) — §6.5 restates the cyclotomic discriminant, which Mathlib proves at the pin

**Location.** README lines 3747–3750 (§6.5): "The cyclotomic discriminant: `|disc ℚ(ζ_q)| = q^{φ(q)}/∏_{p ∣ q} p^{φ(q)/(p − 1)}` for `q ≥ 3` …, from the conductor–discriminant formula `|disc| = ∏_χ f_χ` …".

**Claim.** This is a pinned Mathlib theorem, for every `n` and every cyclotomic extension `K` of `ℚ` of level `{n}`. The README restates it and plans a separate proof through LFunctions Layer 4. What exists at the pins is cited, not restated.

**Witness.** `IsCyclotomicExtension.Rat.natAbs_discr`, `Mathlib/NumberTheory/NumberField/Cyclotomic/Basic.lean:728` (namespace opened at line 609): `(NumberField.discr K).natAbs = n ^ φ n / ∏ p ∈ n.primeFactors, p ^ (φ n / (p - 1))`.

**Repair.**

1. Replace the formula and its route by a citation of `IsCyclotomicExtension.Rat.natAbs_discr`.
2. Keep the two inequalities `φ(q)/2 · log(q/2) ≤ log |disc ℚ(ζ_q)| ≤ φ(q) log q` as its consequences.
3. Add the name to "From Mathlib" and to §6.5's *Needs:* line. Drop "LFunctions Layer 4 conductors" from this bullet.

Tested at `q = 12`: Mathlib's right side is `12⁴/(2⁴ · 3²) = 144`, the value of the §6.5 Check.

## R03 (P3) — Citation of a section ExplicitZetaBounds no longer has

**Location.** README line 4279 (§7.5, *RamareRevisedDensity*): "ExplicitZetaBounds states neither form (its §8.2)".

**Claim.** At `fcc94b0a` ExplicitZetaBounds has §§8.1, 8.3, 8.4 and 8.5, and no §8.2. Its commit `1f1a271c` ("8.2 out") removed the section and moved Ramaré's density theorem to its "Not owned here". It is not a supplier citation, so the finding is P3.

**Witness.** ExplicitZetaBounds README:

- headings at lines 2559, 2582, 2610 and 2652 are §§8.1, 8.3, 8.4 and 8.5;
- line 154 starts the "Not owned here" item "Ramaré's explicit density theorem …", which covers the revised `965` form.

**Repair.** Write "ExplicitZetaBounds states neither form (its Not owned here, the item on Ramaré's explicit density theorem)".

## R04 (P3) — A §1.1 Check says there is no zero in `(398.2, 400)`

**Location.** README line 1027 (§1.1 Checks, `ZetaZeroCubeSum`): "the `201` ordinates below `398.2` (none in `(398.2, 400)`) contribute `0.000727`".

**Claim.** The 202nd ordinate is `γ₂₀₂ = 399.98512`, which lies in `(398.2, 400)`. The Check's total `0.000730` is still right, because the tail it adds starts at `398.5` and so counts that zero. Only the parenthesis is false.

**Witness.**

- Hardy's `Z` (Euler–Maclaurin `ζ(1/2 + it)`, the same values with 80, 120 and 200 terms) gives `Z(399.98) = +0.033954` and `Z(399.99) = −0.032300`.
- `N(400) = 202`, against `ϑ(400)/π + 1 = 201.64`.

**Repair.** Write "(none in `(398.2, 398.5)`; the next ordinate, `399.985`, lies in the tail)".

Tested:

- `∑_{γ < 398.2} γ⁻³ = 0.000727224` over 201 ordinates;
- the tail `(1/2π) ∫_{398.5}^∞ t⁻³ log(t/2π) dt = 2.33·10⁻⁶`;
- total `0.000730`.

## Verified sound

### Repairs of the previous review (read at `d7232a7`)

| Finding | Status | Where in this head |
|---|---|---|
| R01: Brent–Platt–Trudgian without convexity | Repaired | Contract §5.4 at lines 438–448: "`C²` on `[T₀, ∞)` with `φ ≥ 0`, `φ′ ≤ 0`, `φ″ > 0`". It matches ExplicitZetaBounds §5.4 (line 1747 ff.), which takes `Q = N − L` with `L` = this README's `M` (`brent-platt-trudgian-2021` lines 131–132). `gap:lehman-weighted-zero-sum` is no longer cited. §2.1 (lines 1473–1483) sends unimodal weights through Rosser–Schoenfeld's Lemma 7 (`faber-kadiri-2015` lines 432–450, checked). The negative control is at line 1530 |
| R02: Ramaré–Rumely's region owned twice | Repaired as asked; see new R01 | The zero input was deleted, and line 474 adds the fifth item to the gap contract. §6.1 now proves the modulus form, which the supplier added in the meantime |
| R03: `N(A) = M(A)`, `(T₀, s₀)`, low-zero computations unnamed | Repaired | §1.1 lines 949–970 add *RosserSchoenfeldLowZeros*, *RosserSchoenfeldZeroCount*, *VanDeLuneZeroCount*, *OdlyzkoZeroSums* and *LMFDBZeroSums*. §3.1(b) (lines 1944–1964) has `N(A) = M(A)`, `D`, `g`, `c`; §3.1(c) (lines 1965–1977) has `T₀`, `s₀`, `T₀ ≤ T₁ ≤ H`, `R₀ ≥ 1`. They are carried in §§3.2, 3.3, 3.4, 5.3, 7.1 and 7.3 |
| R04: Massias–Robin locator | Repaired | Lines 3346–3348 cite `dusart-1999-mc` lines 30–32, in `k` (read) |
| R05: (3.20) with `1/log² x` | Repaired | Line 2869. Check at line 2880: `1.1762 < 1.2841` |
| R06: *BroadbentRow* | Repaired | No occurrence remains. Lines 2053–2057 give the `(121.096, 3/2, 2, 5.5666305)` form under *FioriKadiriSwidinskyPsiRow* |
| R07: §7.9 has three instances | Repaired | Lines 1387–1390; Check at lines 1416–1418 |
| R08: `1.25·10⁻⁵` | Repaired | Line 2105 |

### Gate, build, signatures, dependency check

- **Gate**, rerun at `fc7b018`: every check `0`, "OK", exit 0. The worker's gate also shows `build=0`.
- **Elaboration:** `lake env lean` on `Suggested.lean` gives 15 "declaration uses `sorry`" warnings and nothing else, exit 0.
- **Signatures:** a scratch copy with `#check @name` for all 34 declarations elaborates.
  - Every elaborated type matches its README statement.
  - Every hypothesis is in the theorem's own signature; `dusart_of_zeroFreeRegion` now carries `hcube : ZetaZeroCubeSum`.
  - No binder is lost. Nothing was changed.
- **Dependency check:** `depcheck: 244 roadmaps, 2465 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line.
- **Merge order:** ExplicitPrimeCounting is at 271, after ExplicitZetaBounds (270), SieveMethodsAndPrimePatterns (269), EffectiveClassNumbers (248), ComputationalNumberTheory (193) and AnalyticNumberTheoryPartI (90).
- **Outside the folder:** the diff is empty.

### Headlines and padding

- **Headlines** (README lines 31–59). Stated in `Suggested.lean`:
  - Brun–Titchmarsh;
  - Lee–Nosal for `ψ` and `θ`, and Schoenfeld, under RH;
  - Carneiro–Milinovich–Soundararajan;
  - Büthe and Johnston;
  - Dusart 2016;
  - Axler's `π` bound;
  - Vanlalngaia;
  - Dusart's `p_n` bound;
  - Lamzouri–Li–Soundararajan;
  - Schoenfeld's, Trudgian's and Axler's intervals.
- **Not statable.** Rosser–Schoenfeld, Broadbent–Kadiri–Lumley–Ng–Wilk, Fiori–Kadiri–Swidinsky and Bennett–Martin–O'Bryant–Rechnitzer are named in the module docstring (lines 47–76), each with the table proposition it lacks.
- **One-tactic probe.** On a scratch copy, each of the 15 theorems was given `first | (simp; done) | rfl | (norm_num; done) | exact?`. All 15 fail (`exact?` cannot close the goal, or a heartbeat timeout), so none is padding.
- **Definitions.** The only new definition is `ZetaZeroCubeSum`: real-bodied, needed by `dusart_of_zeroFreeRegion`, and true (row below).

### Adversarial table

Values come from:

- sieves to `1.2·10⁸`;
- the zeros of `ζ` below `420`, located by Hardy's `Z` with an Euler–Maclaurin `ζ`;
- the exponential-integral series for `li`;
- `H = −0.0171594043` from `brent-platt-trudgian-2021` line 105.

| Statement | Instance | Values (each side) | Result | Change |
|---|---|---|---|---|
| `ZetaZeroCubeSum` | full sum; `T < 14.13`; first zero | `0.0007296 ≤ 0.000835`; `0`; `14.1347⁻³ = 0.000354` | true | none |
| same, negative controls | Rosser's count from `14`; Brent–Platt–Trudgian from `T₀ = 14` | `3∫₁₄^∞(M + R)t⁻⁴ = 0.0015878`; `0.000528 + 0.000157 + 0.000349 = 0.0010346` | neither reaches `0.000835` | none |
| §1.1 Check on `ZetaZeroCubeSum` | zeros in `(398.2, 400)` | `γ₂₀₂ = 399.98512` | parenthesis false | R04 |
| Rosser's Lemma 17, both signs | `∑γ⁻²`, `∑γ⁻³` | `0.0463` at `rosser-schoenfeld-1975` line 539 against `2 · 0.0231 = 0.0462`; `0.00167` (`dusart-2016` line 460) against `2 · 0.00073 = 0.00146` | both-signs reading consistent | none |
| *RosserSchoenfeldLowZeros* | `D = 158.84998` | `N(D) = 57`, `γ₅₈ = 158.849988`; `∑(γ² + 1/4)^{−1/2} = 0.8113924291 < 0.8113925`; `C(D) = 2.820043 > 2.82`; `M(D) = 57.255` | true | none |
| *RosserSchoenfeldZeroCount*, *VanDeLuneZeroCount* | `M(A₀)`, `M(A₁)` | `3 502 499.99999`; `1 500 000 000.99904` at `.215`; `M(545 439 823) = 1 500 000 000.374` | matches `dusart-1999-mc` lines 64–69 | none |
| *OdlyzkoZeroSums* | `T₀ = 1 132 491` | `11.65489179681 − 0.01715940431 − 3.03·10⁻⁸ = 11.6377323622 ≤ 11.637732363`; `faber-kadiri-2015`'s `11.637732` is below the sum | true; source issue | none |
| *LMFDBZeroSums* | `T₀ = 104 537 615` | `21.9830774 + 1.4·10⁻⁹ ≤ 21.98308`; `M(T₀) = 259 999 999.854` | true | none |
| §2.1, weighted sums | `φ` drops on `[20.5, 21]`, `T₁ = 14` | bound `0.00469` against `|E₂| ≥ |1 − M(20.5)| = 0.4705` | negative control right | none |
| §2.1 | `φ = t⁻²`, `T₁ = 10⁷` | Lehman `6.4·10⁻¹³`; Brent–Platt–Trudgian `1.2·10⁻²⁰` | holds | none |
| §2.1, `∑_ρ 1/(ρ(1 − ρ))` | constant | `2 + γ − log 4π = 0.0461914`. Halved, `0.0230957`; plus `¼∑γ⁻⁴ = 9.3·10⁻⁶` this matches ExplicitZetaBounds §5.4's `∑γ⁻² = 0.0231050` | consistent | none |
| §2.6, `C_T` | `T = 3·10¹²` | `115.10 − 1.427 = 113.67`; at `x = 10²⁰`, `1.137·10⁻⁸` against Johnston's `8.44·10⁻⁹`; at `10²⁶`, `1.241·10⁻¹¹` against `1.426·10⁻¹¹` | holds | none |
| §3.1(a), `dusart_of_zeroFreeRegion` | `R = 5.69693`, `log x = 400` | `X = 8.3793 ≥ max(8.36, 1.404)`; `ε_R = 1.0604·10⁻³`. Proof hypothesis `X > 8/R` at `dusart-2016` line 445 | holds | none |
| §3.1(b), `Ω₁` | `(g, c)` | `4π · 0.0030404 = 0.038207`; `4π(0.137 + 0.443/log D) = 2.82004`, against `rosser-schoenfeld-1975` lines 691–711 | holds | none |
| §3.5, Dusart's two-term lower bound | gap `(88 771, 88 789)` | `π = 8596`; bound crosses `8596` at `88 782.515`; `8596.042` at `88 783`; `8596.567 < 8597` at `88 789`; `9571.4 ≤ 9592` at `10⁵` | printed `88 783` fails; `88 789` holds | none |
| §3.5, Panaitopol | `k₆` | `4320 − (461 + 142 + 78 + 72 + 120) = 3447` | README right; `axler-2016` line 41 prints `3441` | source issue |
| `axler_primeCounting_upper` | `x = 47`, `48`, `1627`, `10⁴`, `10⁷` | denominator `−0.0393` at 47; `896.15 ≥ 15`; `266.69 ≥ 258`; `1246.02 ≥ 1229`; `664 911.76 ≥ 664 579` | threshold `48` needed | none |
| §3.6, Johnston–Yang Theorem 1.4 | `x = 23` | `θ`: `3.777 > 3.400`; `π`: `1.88 > 1.12` | thresholds `59` and `71` needed | none |
| §4.2, Ramaré's corollary | `0.0067/log x`; `x = 10` | last failure just below `1 514 844.9`; `|1.6947 − 1.7254| = 0.0307 ≤ 0.346` | `1.52·10⁶` right | none |
| §4.3, transfer | `k = 3`, `η = 1`, `x = 89 967 803` | `1/3 + 5/(4 · 18.315) = 0.4016 ≤ 0.41` | holds | none |
| `vanlalngaia_sum_inv_prime` | `x = 2`, `1000`, `1327`, `24 284`, `24 421` | `0.605016 ≤ 12.011`; `0.003938 ≤ 0.006978`; `0.006042 ≤ 0.006186`; `0.00097075 ≤ 0.00097129`; `0.000906 ≤ 0.000970` | holds; tight | none |
| §4.3, Corollaries 2–3 | `log x = 4635` | transfer route `2.45·10⁻¹³` against `8.377·10⁻¹⁶`; Corollary 3 at `5.5666305`: `5.448·10⁻¹⁶`; `814 · 5.69693 = 4637.30` | as the README says | none |
| §4.4, Ramaré's lemma | `f = t⁻²`, `P = 2`; `ε` | `0.4931 ≤ 4.66`; `1/914 = 0.0010941 ≥ 0.001093` (`ramare-2016` lines 294–303) | holds | none |
| §4.6, Deléglise–Nicolas and Axler | coefficients; `π₁` gaps | `r₀(1) = 1.1445`; `592`, `107/160`, `3/20`, `1181/648`, `1069/648`. (2.19) holds from `110 117 909.223` in `(110 117 899, 110 117 929)`; Axler's 1.1 from `110 118 924.888`; margin `4.62·10⁶` at `110 117 910`; `π₁(10⁷) = 3 203 324 994 356` | holds | none |
| §5.3, Robin's (23) | `k = 7022`, `8601`, `8602` | `70 919 > 70 918.61`; `88 807 > 88 805.00`; `88 811 < 88 816.44` | start `8602` needed | none |
| `dusart_nth_prime_lower` | `k = 2`, `3`, `10`, `10⁴`, `10⁶`; third range | `−1.35 ≤ 3`; `0.58 ≤ 5`; `21.37 ≤ 29`; `104 306.67 ≤ 104 729`; `15 441 302 ≤ 15 485 863`; `log² k(log log k − 2.1454) = 1.7177·10⁷ > 1.6571·10⁷` at `log k = 1792.5` | holds | none |
| §5.6, Axler's Cipolla bounds | `n = 10⁶` | `15 479 662.0 < 15 480 992.8 < 15 481 865.1 < 15 485 863` | upper fails below its threshold, as stated | none |
| §6.1, modulus form | `q = 6`, `k = 3`, `C = 20.92`; `k = 1`, `C = 38.31` | `0.013022 < 0.014264`; `0.0062943`; both equal ExplicitZetaBounds §7.5 Checks (lines 2314, 2318) | duplicate of supplier | R01 |
| §6.1, McCurley from Kadiri | containment | `9.6459 log max(q, q|t|, 10) ≥ 6.4355 log max(q, q|t|, 1.7367)` | holds | none |
| §6.5, discriminant | `q = 12` | `12⁴/(2⁴ · 3²) = 144`, as `IsCyclotomicExtension.Rat.natAbs_discr` gives | Mathlib has it | R02 |
| `lamzouri_li_soundararajan` | every unit class, `4 ≤ q ≤ 300`; `q = 3` | worst ratio `0.6504` at `q = 4`, `a = 1`; `7/(2 log 3)² = 1.450` (excluded) | holds | none |
| `brun_titchmarsh` | `k = 1`, `x = 1.9`, `y = 3.2`; `k = 3`, `l = 2`, `x = 10`, `y = 30` | `3 ≤ 5.502`; `4 ≤ 13.029` | holds | none |
| `leeNosal_of_riemannHypothesis` | `x = 101`; `x → 101⁻` | `2.340 ≤ 5.695`; `6.955 > 5.695` | sharp | none |
| `leeNosal_theta_of_riemannHypothesis` | `x = 2657`, `2656` | `89.863 ≤ 94.119`; `96.748 > 94.092` | sharp | none |
| `buthe_` / `johnston_of_riemannHypothesisUpTo` | criteria crossing; `π*` at `96.9`, `97` | `e^{e^{9.06/4.92}} = 547.72`; `1.9174 > 1.7914`; `0.9392 ≤ 1.7927` | start `97` needed | none |
| `carneiro_milinovich_soundararajan` | `x = 4`, `7.5`, `30` | primes `5`, `11`, `31` inside `[x, 6.44]`, `[x, 12.36]`, `[x, 46.39]` | holds | none |
| `schoenfeld_interval` | `x = 2 010 759.9`, `2 010 750`; `x = e³⁰` | end `2 010 881.05`, past the prime `2 010 881`; end `2 010 871.15`, no prime; `4.348·10⁸` against `2√(x + h) log(x + h) = 1.961·10⁸` | sharp | none |
| `trudgian_interval` | `x = 2 898 240`, `2 898 242` | ends `2 898 357.93`, `2 898 359.93`; next prime `2 898 359` | sharp | none |
| `axler_interval` | `x = 17 051 707.2`, `17 051 708` | ends `17 051 886.93`, `17 051 887.73`; next prime `17 051 887` | sharp | none |
| §7.2, Ramaré–Saouter | `Δ = 28 314 000` | `10 726 904 659 + 382` (`oliveira-e-silva-herzog-pardi-2014` line 1807); length `378.86` | sharp | none |
| §7.3, Kadiri–Lumley | `‖f₂‖₁`; rows | `16 · 4/120 = 8/15`; Table 2 rows at lines 690, 707, 708 read | holds | none |

### Sampled locators verified against the text

- **§0.6:** no source locator. Cross-roadmap names resolved:
  - AnalyticNumberTheoryPartI §0.2 (`psiAP`, `primeCountAP`, `theta_ap.level_one`, `theta_ap.sum_classes`);
  - SieveMethodsAndPrimePatterns §3.1 (`SieveDistribution.primeCountAP`, README line 2487 there);
  - ZerosOfLFunctions §8.7 (*rayClassPsi*, main line 1436).
- **§2.1:**
  - `carneiro-milinovich-soundararajan-2019` lines 1185–1189 (Lemma 7) and 259–273;
  - `dudek-2016` lines 115–125;
  - `kadiri-lumley-2014` lines 503–508;
  - `rosser-schoenfeld-1975` lines 530–539;
  - `faber-kadiri-2015` lines 432–450;
  - `brent-platt-trudgian-2021` (arXiv 2009.13791v1, the text in ExplicitZetaBounds' manifest) lines 20–75, 93–105 and 122–150.
- **§2.6:** Not verifiable (below). The internal values were recomputed (table).
- **§3.5:**
  - `rosser-schoenfeld-1962` lines 195–212;
  - `dusart-1998-thesis` lines 1418–1445;
  - `axler-2016` lines 28–48;
  - `panaitopol-2000` lines 15–24 and 92–118.
- **§3.6:** `johnston-yang-2023` lines 72–90, 636–650 and 696–729.
- **§4.2:** `ramare-2013` lines 80–110.
- **§4.3:** the transfer re-derived; Corollary 2's constants recomputed.
- **§4.4:** `ramare-2016` lines 290–306.
- **§4.6:** `deleglise-nicolas-2019-landau` lines 613–640, with the coefficients recomputed.
- **§5.3:**
  - `robin-1983` lines 55–90;
  - `dusart-1999-mc` lines 25–40, 58–72 and 112–170;
  - `schoenfeld-1976` lines 512–568 (Lemma 9*, (8.5)–(8.7), and the `D = 158.84998` values).
- **§5.6:** Not verifiable. Internal values recomputed.
- **§6.1:** read against ExplicitZetaBounds §7.5 lines 2223–2318. The `ramare-rumely-1996` and `dusart-2002` locators are unchanged since the previous review, which read them.
- **§7.1:** `schoenfeld-1976` lines 644–718; `oliveira-e-silva-herzog-pardi-2014` lines 1795–1823.
- **§7.2:** `dudek-2016` lines 810–818; `oliveira-e-silva-herzog-pardi-2014` line 1807.
- **§7.3:**
  - `kadiri-lumley-2014` lines 26–32, 50–53, 280–296, 428–440, 490–512, 578–592 and 686–712;
  - `cully-hugill-lee-2022` lines 594–616.
- **New passages outside the sample:**
  - `van-de-lune-te-riele-winter-1986` lines 8–32;
  - `rosser-schoenfeld-1975` lines 465–482 and 676–722;
  - `dusart-2016` lines 76–80, 100–150 and 440–475;
  - `faber-kadiri-2015` lines 360–368 and 706–718;
  - `faber-kadiri-2018-corrigendum` lines 18–30 and 82–100;
  - `buthe-2018` lines 73–76; `buthe-2016` lines 699–702;
  - `trudgian-2016` lines 226–236.
- **Unverified flags:** the README flags no locator as unverified.

### Library declarations opened at the pins (24)

- **Mathlib:**
  - `NumberTheory/Chebyshev.lean`: 83, 85, 108, 134, 161, 165, 170, 177, 191, 429, 433, 442, 485, 658, 668, 705;
  - `NumberTheory/PrimeCounting.lean`: 80, 84, 106, 133, 163;
  - `Data/Nat/Prime/Nth.lean`: 23, 26;
  - `NumberTheory/Bertrand.lean`: 225;
  - `NumberTheory/ArithmeticFunction/VonMangoldt.lean`: 74, 81;
  - `NumberTheory/LSeries/Nonvanishing.lean`: 404, 412;
  - `NumberTheory/Harmonic/EulerMascheroni.lean`: 170, 174;
  - `Analysis/Real/Pi/Bounds.lean`: 178, 184;
  - `Analysis/Complex/ExponentialBounds.lean`: 38, 41, 86, 89;
  - `NumberTheory/AbelSummation.lean`: 128;
  - `NumberTheory/DirichletCharacter/Orthogonality.lean`: 82;
  - `NumberTheory/DirichletCharacter/Basic.lean`: 245 (`conductor`), 291 (`IsPrimitive`);
  - `Analysis/Analytic/Order.lean`: 63 (`analyticOrderNatAt`);
  - `NumberTheory/NumberField/Cyclotomic/Basic.lean`: 728 (R02);
  - `NumberTheory/Cyclotomic/Discriminant.lean`: 134.
- **Tau Ceti:**
  - `Analysis/SpecialFunctions/LogIntegral.lean`: 92, 141, 147, 151, 156, 180, 277, 331;
  - `NumberTheory/LFunctions/Mertens.lean`: 545, 552, 564;
  - `NumberTheory/ArithmeticDirichletSeries/Counting.lean`: 625, 630;
  - `…/Transfer.lean`: 76;
  - `…/Prime/PrimeIdealTheorem.lean`: 46;
  - `NumberTheory/Chebotarev/PrimeCounting/PrimesCongruent.lean`: 50;
  - `NumberTheory/PrimeCounting.lean`: 70, 90.

### Cross-roadmap citations resolved

- **ExplicitZetaBounds** (head `fcc94b0a`):
  - §§0.2, 0.3, 0.4 (lines 512–580), 3.4, 5.2 (lines 1663–1720), 5.3, 5.4, 6.1, 6.5;
  - §7.2 (lines 2017–2063: the `log 0.618` form now holds for `|t| ≥ 3`, so the README's `t ≥ 1.88·10¹⁴` form follows);
  - §7.3, §7.5 (R01), §7.6, §7.9, §8.1, §8.3;
  - "Not owned here" (lines 117–190) and Downstream consumers (lines 2784–2808).
  - §8.2 is absent (R03).
  - Every zero input owned here is one that the supplier's "Not owned here" leaves to this roadmap.
- **AnalyticNumberTheoryPartI:** §§0.2, 0.3, 0.5, 0.8, 0.16, 0.19, 0.20, 0.25, 0.30, 0.32, 0.34, 1.6, 1.9 (read with `roadmaps show`).
- **SieveMethodsAndPrimePatterns:** §§2.9, 3.1.
- **SpecialFunctionsEiLiErfIncompleteGamma:** §8.2 `TauCeti.Real.principalLogIntegral` and `logIntegral_eq_principalLogIntegral_sub` (its README lines 162, 228, 931–951).
- **On main:**
  - ZerosOfLFunctions §§4.1, 4.5, 5.6, 6.2–6.4, 7.3, 7.4, 8.3–8.9;
  - ClassicalArithmeticCompletion §6.34 (`dyadicPrimeCount`, line 12913).
- **This roadmap cited by its consumers:** every section that ExplicitCharacterSumsAndSieves (head `7dbb08f9`), ExplicitMultiplicativeFunctions (`556188ca`) and ExplicitNumberFields (`4198f620`) cite here exists. That is §§0.1, 1.1, 1.3, 1.6, 1.7, 2.2, 3.2, 3.3, 3.5, 4.2, 4.3, 4.7 and 5.3. None cites a name this head dropped.
- **Overlap tool:** reports no dropped id and no other pull request changing this roadmap.

### Ownership and gaps

- **Ownership by object.** The new §1.1 computations, `ZetaZeroCubeSum` and the existing zero inputs were checked against the four sibling checkouts and `roadmaps grep`. The only second owners found are R01 (ExplicitZetaBounds) and R02 (Mathlib).
- **For the intake** (recorded, not findings; `plan.json` cannot change at this stage):
  - `plan.json` still declares `gap:lehman-weighted-zero-sum` with a `needs` that lacks Brent–Platt–Trudgian's convexity hypothesis. The README no longer declares it, and consumes ExplicitZetaBounds §5.4 by contract instead. It should not be announced.
  - `dirichlet-four-zero-region` is owned here as *LiuWangFourZeros*.
  - `explicit-brun-titchmarsh`, with supplier `none`, is §0.1 here.
  - The README's contracts for `explicit-zero-count-error`, `explicit-zero-density` and `dirichlet-zero-free-constants` follow the supplier's actual statements, not the plan's `needs` text.

## Not verifiable

These are recorded as uncertified or waived in the manifest, and were cited by locator, not read:

- `chirre-helfgott-2025` (sample §2.6) and `axler-2019-nth-prime` (sample §5.6);
- `ramare-saouter-2003` (sample §7.2) and `cully-hugill-lee-2024`;
- `lee-nosal-2026`, `fiori-jaskari-2026`, `axler-2018`, `axler-2024`, `dusart-2018`, `dusart-1999-cr`, `platt-ramare-2017`;
- `johnston-2022`, `bhattacharjee-2024`, `zhang-xiong-2025`, `ramare-2023-corrigendum`;
- `fiori-kadiri-swidinsky-2023-psi`, `broadbent-fiori-kadiri-ng-wilk-2026`, `bellotti-trudgian-yang-2026`, `platt-2016`;
- `lamzouri-li-soundararajan-2015`, `lu-zaman-zhao-2026`, `thorner-zaman-2024`, `banks-2026`, `openai-2026-siegel`;
- `cully-hugill-johnston-2025`, `lee-2026`, `visser-2025`, `johnston-sorenson-thomas-webster-2026`;
- `montgomery-vaughan-1973`, `rosser-1938`, `rosser-1941`;
- `cipolla-1902`, which is waived.

`brent-platt-trudgian-2021` is uncertified in this manifest; its open arXiv text, which ExplicitZetaBounds' manifest records, was read.

## Source issues

- **Misprint** in axler-2016 at §1, Panaitopol's coefficients, p. 1 (line 41): the source lists `k₆ = 3441`; it should be `3447`, from the recurrence `k₆ = 4320 − (461 + 142 + 78 + 72 + 120)`; affects nothing.
- **Misprint** in faber-kadiri-2015 at §3, before Table 1 (line 714), repeated in faber-kadiri-2018-corrigendum p. 1452 (line 85): the source bounds the sum of `1/γ` up to `1 132 491` by `11.637732`, truncated below the sum `11.6377323622`; it should be at least that, e.g. `11.637732363` as kadiri-lumley-2014 line 586 prints; affects a stated result (Table 1, by at most about `3.4·10⁻¹¹`).
- **Error** in johnston-yang-2023 at Theorem 1.4, (1.8)–(1.9), p. 2 (lines 79–80): the source claims both bounds from `x ≥ 23` and writes `π(x) − x` in (1.9); it should be `θ` from `59` and `|π(x) − li(x)|` from `71`, since at `23` the `θ` bound gives `3.777 > 3.400`; affects a stated result.
- **Misprint** in dusart-2016 at Theorem 1.1, p. 876 (line 79): the source requires `X ≥ max(8.36, 8R)`, while its Lemma 3.4 (line 445) assumes `X > 8/R`; it should be `max(8.36, 8/R)`, which Corollary 1.2 needs; affects a stated result.
- **Misprint** in dusart-1999-mc at the proof of Theorem 3, p. 413 (lines 131–132): the source says the minimum over `10¹¹ ≤ p_k ≤ exp(1800)` exceeds `c`; it should say `exp(500)`, since the value is `0.0030 < 0.0077629` at `e¹⁸⁰⁰`; affects nothing.
- **Error** in buthe-2018 at Theorem 2, (1.6), p. 2 (line 75): the source states `x − θ(x) ≤ 1.95√x` from `1423`; it fails at `x = 1426.9` (`74.077 > 73.660`) and should start at `1427`; affects a stated result.
- **Error** in buthe-2016 at Theorem 2, (7.1), p. 13 (line 701): the source states the `π*` bound for `x > 59`; it fails on `(96.29, 97)` (`1.9174 > 1.7914` at `96.9`) and should be `x ≥ 97`; affects a stated result.
- **Error** in robin-1983 at Théorème 8, (23) (line 84): the source states the `−0.9385` upper bound for `k ≥ 7022`; it fails at `k = 7022` and `8601` (`70 919 > 70 918.61`, `88 807 > 88 805.00`) and should be `k ≥ 8602`; affects a stated result.
- **Error** in trudgian-2016 at Corollary 2 (line 229): the source states the interval from `2 898 239`; at `x = 2 898 240` it ends at `2 898 357.93`, before the next prime `2 898 359`, so it should start at `2 898 242`; affects a stated result.
- **Error** in ramare-2013 at the Corollary to Theorem 1.1 (line 108): the source states `O*(0.0067/log x)` from `x ≥ 23`; it fails up to just below `1 514 844.9` and should be `x ≥ 1.52·10⁶`; affects a stated result; corrected in print at ramare-2023-corrigendum, the corrected corollary (as the README records; not read here).
