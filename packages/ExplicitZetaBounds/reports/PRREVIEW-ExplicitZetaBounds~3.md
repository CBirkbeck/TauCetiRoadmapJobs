# Review of ExplicitZetaBounds (pull request #1954 at bd1ac3e)

**Verdict:** needs changes

There are six findings: three P2 and three P3.
- **The three P2 findings** are cross-roadmap ownership claims in this README that the sibling heads contradict. In each case one side has to change before either pull request merges.
- **The three P3 findings** are an indefinite target (8.2), a wrong comparison in "Not owned here", and a forward dependency from 0.4 into Layer 2.

The gate passes, the dependency check is clean, and `Suggested.lean` elaborates with 24 `sorry` warnings and nothing else. Every headline and sampled target I recomputed holds.

## Previous findings (review at 3e44c3f)

- **R01 (P2, the van der Corput toolkit had two owners): partly repaired.**
  - ExplicitCharacterSumsAndSieves is consistent with this head. At #1948, head 5aa1cf5, its README lines 55–63 consume §4.2 and keep only Arias de Reyna's real-part form (§0.3) and iterated inequality (§1.1). Its `Suggested.lean` no longer declares the derivative tests.
  - The Kusmin–Landau part is not repaired: see R01 below.
- **R02 (P2, objects the consumers ask for that this README hands back): partly repaired.**
  - Guo's gap is now 7.9 (lines 2287–2292), which meets ExplicitNumberFields' `gap:uniform-landau-siegel-gap`.
  - Liu–Wang's four-zero bound, Johnston–Yang's constants and the `0.28 log T` branch are now ExplicitPrimeCounting's own (#1945, head 3630d41, lines 80–88), in agreement with lines 143–162 here.
  - The `9.3675` form is stated in 5.2 (lines 1632–1636).
  - Still open: the `1/ζ` bounds and the `dglsw2025` certificates (R02 below).
  - New conflict: the Ramaré–Rumely region, which this head added as 7.5's fifth item, is now claimed by both roadmaps (R03 below).
- **R03 (P2, the `T ≥ e` headline was statable): repaired.**
  - `riemannSiegelTheta` (`Suggested.lean` line 95) and `abs_zetaZeroCount_sub_le_of_recorded` (line 211) are added.
  - The integral body reproduces `ϑ(100) = 87.97217`, which agrees with `Im log Γ(1/4 + 50i) − 50 log π` to `10⁻¹³`.
  - The theorem holds from its hypothesis: see the table.
- **R04 (P2, 8.2 asserted although the Lean file withheld it as possibly mistaken): partly repaired.**
  - The two files now agree on the doubt (README lines 2415–2423; `Suggested.lean` lines 61–65).
  - The repair made the target's constants depend on the outcome of its proof: see R04 below.
- **R05 (P3, 6.1a without a locator): repaired.**
  - Lines 1759–1761 cite `kedlaya2025notes` lines 773–789.
  - That is Exercise 1.6.6 (the numbering scheme is confirmed by "Exercise 1.6.7" at line 709). It states the kernel `(1/k!)(1 − 1/x)^k` for `x ≥ 1` and `0` for `0 ≤ x ≤ 1`, for every `c > 0`, as the README says.

## R01 (P2) — Kusmin–Landau (4.1) has two owners

**Location.** `TauCetiRoadmap/ExplicitZetaBounds/README.md`:
- lines 88–89: "`ExplicitMultiplicativeFunctions` takes the Kusmin–Landau inequality (4.1) for the divisor-problem route of its smoothed Dirichlet remainder";
- line 2655: "takes 3.4 (bounds right of the line one), 4.1 (the Kusmin–Landau inequality), 6.1 (Perron)".

**Claim.** ExplicitMultiplicativeFunctions consumes 4.1 and 3.4 from here.

**Witness.** At #1946, head bca454b, `TauCetiRoadmap/ExplicitMultiplicativeFunctions/README.md`:
- line 2923 reads "with the Kusmin–Landau inequality for `x ≥ 170` (both stated and proved here as part of this target)";
- the file cites this roadmap only for §6.1 (lines 457–461, 1631, 1638), never for §3.4 or §4.1.

**Repair.** Choose one of the following and record it in this pull request's description.
- ExplicitMultiplicativeFunctions replaces its own statement with a citation of §4.1. It is later in the merge order (273 > 270), so 4.1 is the statement of record.
- Or, if #1946 keeps its own proof, delete the two sentences that say it takes 4.1.

Its second-derivative test (Bordellès–Daval, Lemma 8, line 2922) differs from 4.3 and may stay there. In either case, remove 3.4 from line 2655 unless #1946 starts to cite it.

**Tested.** A search for `ExplicitZetaBounds §` in that README returns §6.1 three times and nothing else. No other open roadmap states Kusmin–Landau: `roadmaps grep 'ku[sz]min.landau'` finds only #1946 line 2923 and #1948's citation of §4.1.

## R02 (P2) — The `1/ζ` bounds and the `dglsw2025` certificates still have no owner

**Location.** `TauCetiRoadmap/ExplicitZetaBounds/README.md` lines 163–169:
- "the bounds for `1/ζ(σ + it)` … that `ExplicitMultiplicativeFunctions` quotes from Lee and Leong's preprint … and states with the theorem that uses them; 7.10 is the bound on the line one";
- and the `ExplicitNumberFields` polynomials, which "it states each with that theorem".

**Claim.** Each consumer states these objects itself.

**Witness.**
- #1946, head bca454b: line 463 declares `gap:zeta-reciprocal-bounds` on this roadmap, with three bounds: `1237 (log t)^{11/12}`, `30.812 log t` (for `σ ≥ 1`, `t ≥ 13`) and `e^{146} log t`. Line 1634 says "owed by ExplicitZetaBounds, never restated".
- #1944, head 4198f62: lines 516–519 declare `gap:nonnegative-trig-polynomials`, at §0.5 here, for the `dglsw2025` polynomials that its 4.8 uses (line 2057).

**Repair.** Give each object one owner before either pull request merges.
- Either the consumers withdraw both gap contracts and state the objects with their theorems, which is what lines 163–169 already say. #1946 already cites `leeLeong2022` (line 1625), and the `dglsw2025` coefficients are free parameters of #1944's own region (line 2057). This pull request's description then names the consumer heads that carry the withdrawals.
- Or this roadmap adds the three Lee–Leong bounds to 7.10 by locator, and the certificates to 0.5.

Either way, change "7.10 is the bound on the line one". 7.10 does not give the second bound: `431.7 log t/log log t ≤ 30.812 log t` only once `log log t ≥ 14.01`, and 7.10 says nothing for `σ > 1`.

**Tested.** At `t = 13`, 7.10 gives `431.7 · 2.5649/0.9419 = 1175.6`, against the required `30.812 · 2.5649 = 79.0`.

## R03 (P2) — Ramaré–Rumely's region is claimed by both this roadmap and ExplicitPrimeCounting

**Location.** `TauCetiRoadmap/ExplicitZetaBounds/README.md`:
- lines 2149–2159 (7.5, the fifth item): "every zero `β + iγ` of `L(s, χ)` with `|γ| ≥ 1000` satisfies `1 − β ≥ 1/(Rℓ − 3.2356 √ℓ)` …";
- line 148: "Ramaré and Rumely's region … is 7.5";
- lines 2645–2646: ExplicitPrimeCounting "takes … Ramaré and Rumely's region with `C₁(k, H)`".

**Claim.** ExplicitPrimeCounting consumes the region from 7.5.

**Witness.** At #1945, head 3630d41, `TauCetiRoadmap/ExplicitPrimeCounting/README.md`:
- lines 85–88 make *RamareRumelyRegion* (its §6.1) a "named hypothesis, never discharged here";
- lines 402–405 call it "this roadmap's (Owned here)";
- lines 3151–3153 say "ExplicitZetaBounds leaves this region … to the theorem using it".

**Repair.** One owner. The owner should be this roadmap: it now proves the region and comes first in the merge order (270 < 271).
- ExplicitPrimeCounting discharges *RamareRumelyRegion* `q H C₁(q)` from §7.5 (fifth item) and drops its "Owned here" and "leaves" sentences, and this pull request's description records it.
- If #1945 keeps the hypothesis instead, delete the clause from line 2646.

The same bullet also omits §6.5, which #1945 consumes (its lines 79 and 406–409); add it.

**Tested.** The fifth item implies #1945's predicate: for `χ` modulo `q` of conductor `k ≤ q` and `C ≤ C₁(k, H)`, `log(k|γ|/C₁(k, H)) ≤ log(q|γ|/C)`. At the source's example `k = 1`, `|γ| ≥ 5.45·10⁸`, `C = 38.31` (`ramare-rumely-1996` line 845), both give `0.0062943` at `|γ| = 5.45·10⁸`.

## R04 (P3) — 8.2 leaves its constants to the outcome of its proof

**Location.** `TauCetiRoadmap/ExplicitZetaBounds/README.md` lines 2420–2423: "the target is the bound with the constants that this re-derivation gives: the printed `20`, `56` and `32` when it confirms them."

**Claim.** 8.2 is a target.

**Witness.** Lines 2403–2404 say "prove … `≤ 20 (56 Q⁵ T³)^{1−σ} log^{5−2σ}(Q²T) + 32 Q² log²(Q²T)`", and the Check at line 2430 evaluates those constants (`1.23·10¹²` at `Q = 10`, `T = 2000`, `σ = 0.6`). The later clause makes the conclusion whatever the proof yields. No Explicit* consumer cites §8.2.

**Repair.** State one definite proposition. Either:
- the printed Theorem 1.1 (`ramare2016density` lines 83–92), keeping lines 2415–2419 as the record of the source's status and deleting the clause quoted above; or
- since nothing consumes 8.2, move it to "Not owned here", with the doubt recorded in `kadirilumleyng2018` lines 93–95 as the reason.

**Tested.** The doubt is accurately reported. `kadirilumleyng2018` lines 63–66 give the revised `965` against the printed `4.9` (lines 93–95), and `ramare2016density` lines 98–104 and 209–210 confirm that the `ζ` bound is the case `Q = 1` of the same argument.

## R05 (P3) — "Not owned here" misstates what 5.2 gives at `T = 30 610 046 000`

**Location.** `TauCetiRoadmap/ExplicitZetaBounds/README.md` lines 156–159: "which no statement here implies: below `T = 8008` it is sharper than the recorded bound … and at `T = 30 610 046 000` it asks for `6.760` where 5.2 gives `7.753`."

**Claim.** At that height, 5.2 does not give `0.28 log T`.

**Witness.** Rosser's bound, which is in 5.2, gives `0.137 · 24.14459 + 0.443 · 3.18405 + 1.588 = 6.306 ≤ 6.760` there. It gives `≤ 0.28 log T` whenever `log T ≥ 20.455`. The figure `7.753` is Bellotti–Wong's second bound plus `7/8`.

**Repair.** Say instead:
- the branch is not implied below `T ≈ 8 010`, where the recorded bound for `S(T)` (0.4) gives `2.5167 > 0.28 log T`;
- between `8 010` and `30 610 046 000` it follows from that recorded bound;
- above `e^{20.455}` it follows from Rosser's bound.

The ownership conclusion stands, because only the low range needs a computation, and #1945 carries it as `ZetaZeroCountLowRange`.

**Tested.** At `T = 10⁴`, `0.28 log T = 2.5789 ≥ 2.5167 + 1/(40 · 10⁴)`. At `T = e^{20.455}`, Rosser's bound is `0.137 · 20.455 + 0.443 · 3.0182 + 1.588 = 5.7274 = 0.28 · 20.455`.

## R06 (P3) — 0.4's new API bullets need Layer 2

**Location.** `TauCetiRoadmap/ExplicitZetaBounds/README.md`:
- lines 536 and 542–543: "with the slit-plane branch of `log Γ` of 2.1" and "from Stirling's series … with the remainder bound of 2.3";
- line 545: "*Needs:* 2.1, 2.3".

**Claim.** Layer 0 is built first ("How to read the build", line 346). Layer 0's Dependencies (lines 603–607) list nothing from Layers 1–2.

**Witness.** A Layer 0 item, 0.4, needs 2.1 and 2.3, which are Layer 2 items built after Layer 1. Its bracket `7/8 < ϑ(T)/π + 1 − (T/2π) log(T/(2πe)) < 7/8 + 1/(40T)` is what 5.2 and `abs_zetaZeroCount_sub_le_of_recorded` use.

**Repair.**
- Keep the definition of `riemannSiegelTheta` in 0.4, with its Mathlib-only API: `ϑ(0) = 0`, oddness, and the derivative from `intervalIntegral.integral_hasDerivAt_right`.
- Move the identification with `Im log Γ` and the `7/8` bracket, with their Checks, to a Layer 2 item after 2.3. Then cite that item from 4.6 and 5.2.
- Alternatively, list Layers 1–2 in Layer 0's Dependencies and say in "How to read the build" that the last part of 0.4 follows Layer 2.

`Suggested.lean` needs no change: the definition uses only `Complex.digamma`.

## Verified sound

**Gate, build and order.**
- I ran the gate myself at bd1ac3e and every check is 0. `git diff --stat origin/main...HEAD` outside the folder is empty, and the folder holds `README.md`, `Suggested.lean` and `metadata.toml`.
- Dependency check, run myself: `depcheck: 244 roadmaps, 2465 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.
- Merge order: LFunctions 28, ZerosOfLFunctions 85, AnalyticNumberTheoryPartI 90, ComputationalNumberTheory 193, SieveMethodsAndPrimePatterns 269, this roadmap 270, then ExplicitPrimeCounting, ExplicitCharacterSumsAndSieves, ExplicitMultiplicativeFunctions and ExplicitNumberFields at 271–274.
- AsymptoticExpansions (#1857, a new roadmap by another author) is named in the description's merge-order paragraph.
- `plan.json` declares no gaps, and no repair report marks a finding "not actionable".

**Lean.**
- `lake env lean` on `Suggested.lean`: 24 `declaration uses sorry` warnings (the 24 theorems) and no errors.
- I put `#check @` for all 33 declarations into one scratch file and elaborated it. There is no `variable` block, so no binder can be lost. The two new declarations elaborate as `riemannSiegelTheta : ℝ → ℝ` and with the hypothesis `∀ T, 0 ≤ T → T ≤ 30610046000 → |N(T) − ϑ(T)/π − 1| ≤ 2.5167` for `rexp 1 ≤ T`, as in README lines 503–508 and 1600–1602.
- One-tactic probe on a scratch copy: `first | rfl | (simp; done) | (norm_num; done) | positivity | infer_instance | (intros; simp_all; done) | (exact le_rfl)` leaves all 24 theorems open, so there is no padding.
- Headlines: every end theorem of the Summary is stated. The docstring names, with reasons, Rademacher's bound for a general record (`AnalyticLFunctionData` is absent at the pins), the preprint instances (`4.896`, Banks, Guo) and 8.2.

**Sources of the sample (each read at the cited lines).**
- **0.2:** `DirichletGRH`/`GRH` at AnalyticNumberTheoryPartI §1.6 (#1126 README lines 990–998).
- **0.3:**
  - `platt2016grh` lines 951–963 (Theorem 7.1, `29 565 923 837` L-functions).
  - My sieve count of primitive characters of modulus at most `400 000`, including modulus 1, is `29 565 923 838`.
- **1.2:** `alzer1997` lines 520–528 (Theorem 8; `F_n`, `G_n` as in the README) and 649–662 (Theorem 9).
- **2.6:**
  - `nemes2015` line 38 (his `γ₁ = −1/12`) and lines 55–63, 86–100 and 105–108.
  - Lines 125–135 (`1 + 1/(12z) + 1/(288z²)`) and 169–171.
  - Lines 543–554, where the proof gives `(1/2)(2√N + 1)`.
- **3.3:** `trudgian2014argument` lines 261–262 (Backlund's (53), `t ≥ 50`).
- **4.2:** `yang2024` lines 324–334, `patelyang2024` lines 112–122 and `hiarypatelyang2024` lines 96–104, which are the same inequality.
- **4.10:**
  - `ford2002vinogradov` lines 28–31, 3053–3058 and 3219–3220 (`C = 9.463`, `D = 133.66`).
  - `bellotti2024` lines 60–63 (`|t| ≥ 3`).
- **5.1:** `bmor2021` lines 473–477 (`1 < c < r`, `0 ≤ δ < 9/2`).
- **6.4:** `ramare2016density` lines 828–843 (Lemma 6.5, `c₀`, `πc₀` for real coefficients). The two-sided form follows because each of the two Hilbert forms is at most `πc₀ Σ |a_n|²(n + 1)`.
- **6.6:** `donahelfgottzunigaalterman2022` lines 78–99 and 105–120, `simonic2020` lines 89–92, and `kadiri2013density` lines 137–162.
- **7.5:**
  - `kadiri2002thesis` lines 1976–1979 and 2063–2067.
  - `kadiri2018` lines 16–18, 130–135, 142–147 and 668–669.
  - `thornerzaman2024` lines 164–170 and 219–226, and `luzamanzhao2026` lines 15–20 and 39–44.
  - `ramare-rumely-1996` lines 795–848.
- **7.10:** `hiaryleongyang2025` lines 41–43, 1015–1017 (the `21.233` region of 7.4) and 1171–1175.
- **9.2:** `plattsaadeddin2013` lines 27–37, and `saadeddin2016` lines 29–31 and 791–799.

**Sources read for the repaired passages.**
- `bellottiwong2025` lines 31–38, 58, 61, 81–84, 121–124 and 199–202 (`|S(T)| ≤ 2.5167` for `0 ≤ T ≤ 30 610 046 000`).
- `kadirilumleyng2018` lines 59 and 62–95, and `ramare2016density` lines 83–104 and 208–215.
- `kedlaya2025notes` lines 709, 730 and 773–789, and `guo2026` lines 11–18, 23–26 and 54–61 (Theorem 1.1, strict `> 1/100`, `q ≥ 3`).
- `brentplatttrudgian2021` lines 38–45, 54–71 and 186–197: Lemma 3 needs `φ'' > 0`, which 5.4 keeps.
- `patel2022` lines 191–196, 238–241 and 260–265.

**Library declarations opened at the pin (14).**
- `Complex.digamma := logDeriv Gamma` (`Mathlib/Analysis/SpecialFunctions/Gamma/Digamma.lean:48`).
- `intervalIntegral.integral_hasDerivAt_right` (`Mathlib/MeasureTheory/Integral/IntervalIntegral/FundThmCalculus.lean:725`).
- `meromorphicOrderAt` (`Mathlib/Analysis/Meromorphic/Order.lean:50`).
- In `Mathlib/NumberTheory/LSeries/HurwitzZeta.lean`: `HurwitzZeta.hurwitzZeta` (line 53) and `hasSum_hurwitzZeta_of_one_lt_re` (line 73, `a ∈ Icc 0 1`).
- `HurwitzZeta.hurwitzZeta_zero : hurwitzZeta 0 = riemannZeta` (`RiemannZeta.lean:129`). So at `u = 1`, 4.10's second clause bounds `ζ(s) − 1`.
- In `RiemannZeta.lean`: `RiemannHypothesis` (line 185) and `riemannZeta_neg_two_mul_nat_add_one` (line 173).
- `riemannZeta_one` (`Harmonic/ZetaAsymp.lean:420`).
- In `LSeries/Nonvanishing.lean`: `riemannZeta_ne_zero_of_one_le_re` (line 417) and `DirichletCharacter.LFunction_apply_one_ne_zero` (line 412).
- `DirichletCharacter.LFunction_modOne_eq` (`LSeries/DirichletContinuation.lean:66`).
- `DirichletCharacter.isPrimitive_one_level_one` (`DirichletCharacter/Basic.lean:295`).
- `Complex.Gamma_conj` (`Gamma/Basic.lean:356`).

**Cross-roadmap citations resolved.**
- The three "found nowhere" leads are supplier names:
  - `SieveTaper.sharp_additive_largeSieve` and `SieveApplications.sharp_primitive_largeSieve` (#1495 `Suggested.lean` lines 156 and 181);
  - `gammaRemainder.slit_logGamma` (#1126 README line 625).
- `sum_Icc_eq_eulerMaclaurin` (#1857 `Suggested.lean` line 562).
- `platt_bounded_height` (#1408 `Suggested.lean` line 577) still allows `q = 1`; it is consumed here only for `q ≥ 2`, which is sound. ComputationalNumberTheory §§4.22 and 4.24 are at #1408 README lines 2494 and 2509.
- ZerosOfLFunctions on main: 1.1 (line 430), 1.4 (478), 1.6 (506), 3.4 (705), 4.3 (837), 4.5 (872), 5.5 (989), 5.6 (1003), 6.3 (1075), 6.5 (1142), 7.1–7.4 (1182–1263) and Layer 9 (1586).
  - Its 7.3 defines `S(T)` off ordinates and records `S(T) → −1` as `T → 0⁺` (lines 1244–1257), which agrees with the right-limit reading in 0.4.
- ArithmeticDirichletSeries is under `Completed/` on main.

**Consumer contracts at their heads.**
- ExplicitPrimeCounting's gaps (#1945 lines 431–449) are each met by 0.2–0.4, 7.3, 7.5, 7.9, 7.6, 5.2, 5.3, 8.1, 8.3 and 5.4:
  - `rh-up-to-height`, `grh-up-to-height`;
  - `classical-zero-free-constants`, `dirichlet-zero-free-constants`;
  - `real-zero-gap`, `vinogradov-korobov-constants`;
  - `explicit-zero-count-error`, `dirichlet-zero-count-error`;
  - `explicit-zero-density`, `lehman-weighted-zero-sum`.
- That roadmap's `lehman-weighted-zero-sum` omits `φ'' > 0`, which Brent–Platt–Trudgian's Lemma 3 needs (their lines 44–45). That is a matter for #1945.
- ExplicitNumberFields' `gap:iterated-perron` is met by 6.1a, and `gap:uniform-landau-siegel-gap` by 7.9.
- No other open roadmap defines the Riemann–Siegel theta function: `roadmaps grep` finds only SiegelModularForms' unrelated `siegelTheta`.
- `overlaps.md` lists no pull request that changes this roadmap and no dropped or revision-only id.

**Adversarial table** (values computed this round with my own double-precision `Γ`, `ψ`, `ζ`, Hurwitz and `L(s, χ)`, cross-checked against `ζ(2)`, `ζ(−1/2)`, `ψ(1)`, `π/4`, `π/(3√3)` and `log(1 + √2)/√2`).

| Statement | Instances | Values (left / right) | Result | Change |
|---|---|---|---|---|
| `RiemannHypothesisUpTo` (0.2) | `H < 0`; strip dropped; closed strip in the imprimitive law, `q = 2` | vacuous; `ζ(−2) = 0` with `Re = −2`; zero `2πi/log 2` at height `9.0647`, `Re 0` | sound | — |
| `GRH(q, H)` (0.2) | `q ≡ 2 (mod 4)`; `q = 1` | no primitive χ, holds for all `H`; `L = ζ`, equals `RH(H)` | sound | — |
| 0.3 `H(q)` | `q = 3, 399 999, 400 000`; count | `3.333·10⁷`, `293.750`, `387.5`; `29 565 923 838` with modulus 1 against Platt's `…837` | sound | — |
| `riemannSiegelTheta` (0.4) | `T = 100, 14.14, −100`; integral against `Im log Γ` | `87.97217` (Simpson `87.97217`), `−1.72653`, `−87.97217` | sound | — |
| 0.4 negative controls | sign; drop `−(T/2) log π`; principal `Log` | `ϑ < 0` on `(0, 17.84560)`, minimum `−3.53097` at `6.28984` (`Re ψ = 1.1447299`, `log π = 1.1447299`); `47.221` against `N(100) = 29`; `arg Γ(1/4 + 50i)`: principal `0.69540`, continuous `145.20866`, giving `−56.54110` | sound | — |
| 0.4 bracket | `(excess − 7/8)·T` at `T = e, 3, 10, 100` | `0.006771, 0.006715, 0.006635, 0.006631` (`→ 1/(48π) = 0.006631`) `< 0.025` | sound | R06 (placement) |
| 0.4 recorded `S(T)` hypothesis | `T = 0, e, 14.14, 100` | `|N − ϑ/π − 1|` = `1, 0.0824, 0.4504, 0.0024` `≤ 2.5167` | consistent, not vacuous | — |
| `abs_zetaZeroCount_sub_le_of_recorded` (5.2) | `T = e, 3, 10, 100` | `|N − M|` = `0.795, 0.830, 0.852, 0.873`; right sides `8.184`/`3.886` at `e`, `8.921`/`4.482` at `100`; `2.5167 + 7/8 + 1/(40e) = 3.4009 < 3.886` | sound | old R03 repaired |
| `abs_zetaZeroCount_sub_le` (5.2) | `T = 3.0610046·10¹⁰` | main term plus `7/8` `103 800 788 358.63` against `N = 103 800 788 359`; right sides `11.295`, `6.8785` | sound | — |
| 5.2, Rosser and the `9.3675` form | `T = 14, 100, 1000`; `H₀` | Rosser errors `2.379, 2.895, 3.391`; `8.08344 + 7/8 = 8.95844 < 9.3675`; Rosser `6.306` at `H₀` | sound | R05 (prose) |
| 0.5 admissible polynomials | `(3,4,1)`; `(1,2)`; `n = 0` | `2(1 + cos θ)²`; `P(π) = −1`; `a 1 = 0` forced | sound | — |
| 1.1 | `r₁(1)`; `r₂(2)` | `0.081061 < 1/12`; `−0.000326` against `T₂(2) = −0.000347` | sound | — |
| 1.2 (Alzer) | `x = 1`, `0.2` | `−0.577216 ∈ (−0.583333, −0.5)`; `−5.28904 ∈ (−6.19277, −4.10944)` | sound | — |
| 1.3, 1.4, 1.5 | `ψ′(1)`; `θ_x` at `x = 1, 2, 10, 100`; `F₃(1/2; 2)` | `1.5 < 1.644934 < 1.666667`; `0.33593, 0.51176, 0.87001, 0.98628`; `ψ(2) = 0.422784 < 0.423984` | sound | — |
| 1.6 (Mortici) | `x = 1`, `20` | `−0.009968 ∈ (−0.075347, 0.059375)`; at `0.953` of an interval of width `4.2·10⁻⁸` | sound | — |
| 2.1, 2.4 | `z = e^{3.1i}`; `Re ξ(i)`, `Re ξ(−1/2 + 2i)` | `|ξ| = 1.38889 ≤ 192.71`; `0.00093459 = −(1/2) log(1 − e^{−2π})`; `−0.010044` | sound | — |
| `norm_Gamma_bounds` (2.5) | 3000 random `s`, `σ ∈ [10⁻³, 79]`, `|t| ∈ [10⁻², 400]`; `s = 1/2 + 10i` | least log-margins `7.4·10⁻¹⁰` (lower), `4.2·10⁻⁴` (upper); `|Γ| = 3.777532·10⁻⁷ = √(π/cosh 10π)` | sound | — |
| 2.6 (Nemes) | `N = 2`, `z = 10`; `γ₃` | `R₂(10) = 3.2026·10⁻⁵ ≤ 2.0411·10⁻⁴`; `γ₃ = −1/360 + 1/10368 = −139/51840` | sound | — |
| 2.7, 2.8 | `ψ(10i)`; `σ = −1/2`, `t = 100`, `a = 0` | `2.303419 + 1.620796i`, gap `0.000834 ≤ 0.003536`; quotient `50.0006 = |(1 + s)/2|` | sound | — |
| `norm_LFunction_le_rademacher` (3.2) | 7 primitive χ (`χ₋₃`, `χ₄`, quadratic and quartic modulo 5, sextic modulo 7, `χ₈`, `χ₋₈`); `η ∈ {0.05, 0.25, 0.5}`; `σ ∈ {−η, 0, 1/2, 1, 1 + η}`; `t ∈ {0, 2, 10, 30}` | largest ratio `0.737`: `1.92504 ≤ 2.61238` (sextic, `η = 1/2`, `σ = 3/2`, `t = 30`) | sound | — |
| 3.2, `ζ` instance | `s = −1/2`, `η = 1/2` | `|ζ(−1/2)| = 0.207886` equals the bound | sound | — |
| 3.3 (Backlund) | `50 ≤ t ≤ 125`, step `1/4` | ratios `0.6229, 0.6150, 0.6156`; at `t = 50`, `6.581` against `6.718`; at `t = 55`, `6.902` against `6.880` | sound | — |
| 3.4 | `1.025 ≤ σ ≤ 11`, step `1/40` | largest ratio `0.999942`; Delange largest `−0.09575`; `0.569961 ≤ 0.875` | sound | — |
| 4.1 | `θ = 0.01` | `cot(0.005π) = 63.66 > 32.83` | sound | R01 (ownership) |
| 4.2 | `b = (1, 1)`, `H = 2`; `b = (1, −1)`; normalised form | `16 ≤ 18` (`12` with `N`); `0 ≤ 6`; `N + H − 1 ≤ 2Y`, `(Y + 1)/Y ≤ 2` | sound | — |
| 4.3, 4.4 | `A`; Patel's forms at `L = 10`, `V = 2`, `W = 3`; `α₃`, `β₃` at `W → 1`, `λ = η₃ = 1` | `2.79368`, threshold `λ < 0.28829`; `32.907`, `41.362`; `6.70215`, `16.03604` | sound | — |
| `norm_riemannZeta_criticalLine_le` (4.7) | `t ∈ [3, 60]`, step `0.05` | largest ratio `0.82103`; bound at `3` is `0.81537` | sound | — |
| `norm_riemannZeta_one_add_le` (4.8) | `t ∈ [3, 60]` | largest ratios `0.6443` (Patel), `0.4852` (Hiary–Leong–Yang) | sound | — |
| `vinogradovCount` (4.9a) | `J₂,₁(2)`, `J₂,₂(3)`, `J₃,₃(2)` by enumeration | `6, 15, 20` | sound | — |
| `vinogradovCount_le_ford` (4.9a) | `k = 1000` | `Δ_s = 11 343.3` at `s = 2k²`; largest `s` is `3 213 463.01` | sound | — |
| `norm_riemannZeta_le_richert` (4.10) | `σ ∈ {0.5, 0.6, 0.75, 0.9, 1}`, `t ∈ ±[3, 60]`, `u ∈ {0.01, 0.2, 0.5, 0.99, 1}` | largest ratios `0.01050` (`ζ`), `0.01042` (Hurwitz) | sound | — |
| 5.1 | `f` constant; `r ≤ a − σ₁` | bound `π` against variation `0`; `log(r/(a − σ₁)) ≤ 0` excluded | sound | — |
| `dirichletZeroCount_explicit` (5.3) | `χ₄`, `T = 10`; `q = 3`, `T = 5/7` | `ℓ = 2.0333`, main term `2.9588`, error `2.1815`, interval `[0.777, 5.140] ∋ 2`; `ℓ = 0.259`, so `N = 0` | sound | — |
| 6.1a | `F = 1`, `x = 3`, `j = 1, 2` | `2 = 2 = 2`; Kedlaya's Exercise 1.6.6 | sound | old R05 repaired |
| 6.3 | one frequency; `a = (1, −1)` at `0` and `δ ≤ 1/(2T)` | `2T ≤ 6T`, `2T ≥ T`, `(π²/2)T ≥ 2T`; Gallagher left/right `≈ (4/3)δT ≤ 2/3` | sound | — |
| 6.4 | `c₀`; `a = (1, 1)` | `1.3154074`, `πc₀ = 4.13247 < 4.71239`; deviation `≤ 2.885 ≤ 20.66` | sound | — |
| 6.6 | `T = 4` | `σ = 1/2`: `107.20`; `σ = 1`: `43.54` | sound | — |
| 7.1 | `s = 2` | `−ζ′/ζ(2) = 0.569961`; zero sum `0.069066 > 0.014849` (first pair) | sound | — |
| `riemannZeta_ne_zero_classical` (7.3) | `|t| = 2`, `3·10¹²` | `σ ≥ 0.740461`, `0.993738` | sound | — |
| `riemannZeta_ne_zero_littlewood` (7.4) | `t = e^{200}` | `0.0012477 > 0.0008995` | sound | — |
| `LFunction_zeroFree_mcCurley`, `LFunction_ne_zero_kadiri` (7.5) | `q = 3` | `σ ≥ 0.905635`; `σ ≥ 0.837457` | sound | — |
| 7.5, Ramaré–Rumely | `k = 1`, `|γ| = 1000`; `k = 3`, `10⁴`; `k = 1`, `5.45·10⁸` | `0.022085` (source: "< 0.02194"); `0.013155` and `0.014264` against McCurley's `0.010056` and Kadiri's `0.017322`; `0.0062943` against Ford's `0.0058732` and 7.3's `0.0089428` | sound | R03 (ownership) |
| `riemannZeta_ne_zero_vinogradovKorobov` (7.6) | `|t| = e^{1000}` | `9.5052·10⁻⁵` (Ford `9.1254·10⁻⁵`, Bellotti `9.7229·10⁻⁵`) | sound | — |
| `LFunction_real_zero_le_bordignon` (7.7) | `q = 4·10⁵` | `0.0076021`, `0.00095026` | sound | — |
| `LFunction_real_ne_zero_luZamanZhao` (7.8) | `q = 4`, `10¹⁰` | `[0.855730, 1)`, `[0.991314, 1)` | sound | — |
| 7.9, Guo's instance | `q = 3, 10¹⁰, 10¹¹` | `0.009102`, `4.343·10⁻⁴`, `3.948·10⁻⁴` against Banks's `0.002731`, `1.303·10⁻⁴`, `1.184·10⁻⁴` | sound | — |
| `inv_norm_riemannZeta_one_add_le` (7.10) | `t = 3`; `t = 13` | `1.56747 ≤ 5042.9`; `1175.6` against the `79.0` of the consumer's gap | sound | R02 |
| `zetaZeroCountRight_le_kadiri` (8.1) | `T = 3.061·10¹⁰` | `1.7022·10¹⁰`, `1.3532·10¹⁰` against the true `0` | sound | — |
| 8.2 | `Q = 10`, `T = 2000`, `σ = 0.6` | `1.233·10¹²` | target indefinite | R04 |
| `zetaZeroDensityCount_nine_tenths_lt` (8.3) | `T = H₀` | `1.9139·10⁸` | sound | — |
| `primitiveLZeroCount_le_thornerZaman` (8.4) | `Q = 3` | `log₁₀` of the bound `99.706`; factors `ζ`, `L(s, χ₋₃)`; `β₁(3) = −1` | sound | — |
| `zetaZeroDensityCount_le_bellotti` (8.5) | `T = 10¹³`, `σ = 0.9927` | `2.2230·10¹¹` | sound | — |
| `norm_LFunction_one_le_ramare` (9.1) | all 138 non-trivial characters of prime conductor `3 ≤ q ≤ 31`; `q = 4, 8` | largest ratios `0.731` (even), `0.863` (odd); `π/4 ≤ 1.0473`; `0.623225 ≤ 0.866434`; `1.110721 ≤ 1.220554` | sound | — |
| 9.2 | `q = 3, 12, 17` | `0.604600 ≤ 1.204578`; `0.760346 ≤ 1.196598`; `1.016085 ≤ 1.396487` | sound | — |
| `norm_LFunction_one_ge` (9.3) | non-quadratic characters above; quartic modulo 5 | largest bound/value `0.2499`; `0.888577 ≥ 0.222066` | sound | — |
| `LFunction_one_ge_luZamanZhao` (9.3) | quadratic characters above | largest bound/value `0.188` (`q = 3`: `0.113780 ≤ 0.604600`) | sound | — |

## Not verifiable

These texts are recorded as uncertified or waived and have no cached text. Each dependent target was checked by recomputation (table) or through a quoting source instead:
- `backlund1918` (3.3, 5.1), through `trudgian2014argument` line 261;
- `titchmarsh1986` (5.1, 4.5a, 7.10);
- `montgomery1994ten`, `logan1988` and `gallagher1970` (6.3);
- `preissmann1984` (6.4), whose `c₀` is quoted in `ramare2016density` lines 837–843;
- `davenport2000` (7.1);
- `mccurley1984` (7.5), through `kadiri2018` lines 142–147 and `thornerzaman2024` lines 169–170;
- `rademacher1959` (2.8, 3.2), through `bmor2021` Lemma 5.6;
- `rosser1941` (5.2), through `bellottiwong2025` line 54;
- `lehman1966`, `delange1987`, `bastienrogalski2002`, `ramare2001` and `louboutin2015`;
- `gabcke1979` (waived).

The journal version of `ralaivaosaonarazakarinoro2026` (constant `6.035`) was not read; the README asserts the narrower statement, which the arXiv text read (`6.5`) implies. `leeLeong2022` and `dglsw2025` (R02) are not in this roadmap's manifest and were not read.

Ownership was checked against the four Explicit* heads named above and, by `roadmaps grep`, against all 478 open roadmap pull requests for the Riemann–Siegel theta function and Kusmin–Landau.

## Source issues

- **Error** in `ramare-rumely-1996` at the proof of Theorem 3.6.2, p. 408: the source says that at `k = 1`, `|γ| = 1000` the bound is below `0.02194`; it should be `0.022085`, still below `1/2`; affects nothing.
- **Error** in `patel2022` at Lemma 3.1, p. 5 (arXiv v1): the source says the coefficient in `β₄` is `18/20`; it should be `18/10 = 9/5`, which its proof gives at (33) and (35); affects a stated result.
