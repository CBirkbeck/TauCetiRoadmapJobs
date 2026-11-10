# Review of ZerosOfLFunctions (pull request #1913 at a77d09a)

**Verdict:** needs changes

This is a full review of the whole folder at `a77d09a`. The head is the one the previous review read. The gate passes and nothing is blocking. Two P3 findings remain:

- the previous R01, carried because it is not repaired;
- one new route gap in 4.4–4.5.

## R01 (P3) — No order is stated against #1907, which conflicts with this pull request in both files (previous R01, not repaired)

**Location.** The pull-request description ends "Merge order: no pending supplier." and does not mention #1907.

**Claim.** The description presents #1913 as independent of the other open work on this roadmap. It is not: #1907 (head `123254c`, index of 2026-11-10T00:07:21Z) also revises `TauCetiRoadmap/ZerosOfLFunctions/`.

**Witness.** `git merge-tree --write-tree a77d09a 123254c` reports `CONFLICT (content)` in `README.md` and in `Suggested.lean`. `roadmaps overlaps ZerosOfLFunctions` lists the same conflict.

**Repair.**
- Add one sentence to the description saying which of #1913 and #1907 merges first, and that the other rebases onto it.
- The pull request that rebases says which of the conflicting `Suggested.lean` declarations it keeps.
- Test: the description names #1907 and an order.

No repair report marks this finding `not actionable in this package`: the package's `reports/` folder holds only review and gate reports.

## R02 (P3) — 4.4 is stated for `T ≥ 2`, but its route works only higher up, and 4.5 needs it below `T = 2`

**Location.** `TauCetiRoadmap/ZerosOfLFunctions/README.md`:
- line 1273: "and `T ≥ 2`, the number of zeros of *entireCompletion* in `closedBall (1/2 + iT) 1`";
- lines 1280–1282: "the uncompleted factor is bounded by the wide-strip corollary of 3.4";
- lines 1291–1292: "subdividing into unit-height rectangles inside discs of radius `√2/2` centred on the critical line".

**Claim.** The route and its use do not match the stated range, in two places.

1. **The route.** It bounds *entireCompletion* on the sphere about `2 + iT` of radius 4 by two inputs: Stirling's asymptotic 1.5, and the wide-strip corollary of 3.4. That corollary holds only for `|Im s| ≥ T₀`, with `T₀` above every pole height (lines 1134–1137). For `2 ≤ T < 4 + T₀` the sphere dips below `T₀`, so neither input bounds that arc.
2. **The use.** The clause `N(T) = O(T log analyticConductorAt d (iT))` of 4.5 must count the zeros with `0 < Im ρ < 1`. Every disc of 4.4 with `T ≥ 2` lies in `Im s ≥ 1`, so no instance of 4.4 counts them.

All the statements are true. Only the stated range and the route's inputs disagree.

**Witness.**
- At `T = √15 ≈ 3.873`, `|1 − (2 + i√15)| = 4`: the sphere passes through `s = 1`, the pole of *continuedL* (`dedekindZetaData K`).
- The squares `[0,1] × [0,1]` and `[0,1] × [1,2]` need centres at `T = 1/2` and `3/2`.

**Repair.**
1. State 4.4 for every `T ≥ 0`. The count is `O(log analyticConductorAt d (iT))` at every height; 5.6's third clause states it with no height restriction.
2. In the route, keep the present argument for `T ≥ T₀ + 4`.
3. For `0 ≤ T < T₀ + 4`, bound *entireCompletion* on the sphere differently:
   - on its part with `Re s < 1/2`, use the functional equation (`HasFunctionalEquation.eventuallyEq` with `dual_completed`; the dual lies in the same family);
   - this leaves only `Re s ≥ 1/2`, where `γ` is regular;
   - there, bound `P · continuedL` by the pole-cleared bound of 3.4 on `[1/2, 1 + δ]` and by the Dirichlet series on `Re s ≥ 1 + δ`.
4. Name 4.4 at `T = 1/2, 3/2` in 4.5's route.

**Test.** `closedBall (1/2 + i/2) 1` contains `[0,1] × [0,1]`, since its farthest corners are at distance `√2/2`. The repaired 4.4 at `T = 1/2` therefore counts the zeros below height 1.

## Previous findings

- **R01 — not repaired.** The description still ends "Merge order: no pending supplier." `git merge-tree` of `a77d09a` and `123254c` still conflicts in both files. Carried as R01.

## Verified sound

### Gate, build, dependency check

- **Gate.** Re-run on `a77d09a`: every check is `0` and the run ends `OK`. That includes `outside-folder`, `stray-files`, `statement-hygiene`, `depcheck`, `imports` and `set_option`.
  - `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/ZerosOfLFunctions'` is empty.
  - The folder holds `README.md`, `Suggested.lean` and `metadata.toml`.
- **Build.** `lake env lean TauCetiRoadmap/ZerosOfLFunctions/Suggested.lean` exits `0`. Its only output is 17 "declaration uses `sorry`" warnings, at lines 99, 111, 125, 138, 156, 175, 190, 207, 220, 234, 252, 267, 283, 301, 315, 336 and 350.
- **Dependency check.** Output: `depcheck: 236 roadmaps, 2268 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.
  - Every supplier is on main: LFunctions, ClassFieldTheory and ModularForms under `TauCetiRoadmap/`; ArithmeticDirichletSeries, GlobalNumberFields, NumberFieldArithmetic, Chebotarev and ContourIntegration under `Completed/`.
  - All 8 relative links in the README resolve on main.
  - The roadmap itself is on main, so it may consume only main and the pins, and it does.

### Lean form, signatures and padding

- **Form.**
  - One module docstring, `import Mathlib` followed by 7 `TauCeti.*` modules (each built at the pin), and the namespace `TauCetiRoadmap.ZerosOfLFunctions`.
  - No `variable`, `include`, `set_option`, `lemma`, `#eval`, `True` or sorry'd data.
  - The 3 definitions have real bodies: `OrderLE`, `zeroCount`, `zetaEntireCompletion`.
- **Signatures.** `#check @name` for all 20 declarations, elaborated in one scratch file. Every binder is in each declaration's own signature, since the file has no section variables. Each elaborated type matches its README statement in generality: 6.4 and 7.5 use the coordinate `|d_K| 𝔑𝔣 (|Im ρ| + 3)^n`, which README 6.4 names explicitly, with the `(4/3)^n` comparison.
- **One-tactic probe.** Each of the 17 sorried theorems was given `first | rfl | simp | infer_instance | decide | norm_num` in a scratch copy. 17 of 17 fail with unsolved goals, so none is padding.
- **Library search.** No pinned Mathlib or Tau Ceti declaration states any of them. A grep of both pins for Hadamard factorization, Weierstrass factor, zero-free region, Riemann–von Mangoldt and explicit formula finds only Mathlib's power-series `WeierstrassPreparation`. `riemannZeta_ne_zero_of_one_le_re` covers only `Re s ≥ 1`.

### Seeded sample

1. **0.1.** A definition; its body agrees with Lean line 74.
   - DLMF 5.5.3 (reflection, dlmf.nist.gov/5.5, line 143 of the fetched page) supports the Check `|1/Γ(−n−1/2)| = Γ(n+3/2)/π`, recomputed: `3.702494 = 3.702494` at `n = 3`.
   - DLMF 5.11.1 is `dlmf5` lines 104–108, on the sector `|ph z| ≤ π − δ`.
2. **1.5.** DLMF 5.11.9 (`dlmf5` lines 488–524, "uniformly for bounded real values of x") supports the `O(1)` remainder.
   - Recomputed for `Gammaℝ`: the remainder is `0.806043` at `σ = ½` and `−0.572365` at `σ = 2`, constant from `t = 10²` to `10⁴`.
   - For `Gammaℂ` at `σ = ½` it is `0.693147`.
   - The pole description matches Tau Ceti `AnalyticLFunctionData.gammaFactor` (`TauCeti/NumberTheory/LFunctions/Data/Basic.lean:111`, `∏ Gammaℝ(s+μ) ∏ Gammaℂ(s+ν)`).
3. **1.6.** Checked against the pinned fields:
   - `HasDirichletAgreement.completed_eq` is `Λ = N^{s/2} γ L` on `Re s > 1`;
   - `HasMeromorphicContinuation.analyticAt` holds off `polarOrder`;
   - `HasFunctionalEquation.completed_eq` carries the two polar exclusions;
   - `HasFunctionalEquation.eventuallyEq` is the punctured germs.

   The `0 = 1` Check for `F = 1/((s−2)(s+1))` was recomputed: `F(1−s) = F(s)`, and the pointwise equation at `2` compares `F(2) = 1` with `F(−1) = 0`.
4. **2.1.** IK (5.7) is paywalled (see Not verifiable). The Checks give `7/2` and `12` (against `3` for one factor per `Gammaℂ`).
5. **2.4.** Tau Ceti `HeckeRing.GL2.Newform.analyticConductorAt` (`…/Newforms/AnalyticInvariants.lean:125`) is in the arithmetic parameter with `s_an = s − (k−1)/2`. `analyticConductorAt_eq` (line 133) gives `N(‖s‖+3)(‖s+1‖+3)`. So `Δ` gives `90` against `15.75`.
6. **4.4.** Davenport §§15–16 are uncertified (cited by locator). The chapter titles "The number N(T)" and "The number N(T, χ)" fit the claim. The route is R02.
7. **4.6.** Mathlib `ValueDistribution.log_counting_zero_sub_logCounting_top`: the signed log-counting function is `logCounting f 0 − logCounting f ⊤`. Mathlib's `logCounting_zero` uses the positive part. So the README's choice of carrier is right.
8. **5.2.** There is no textbook locator; Provenance maps it to PNT+ `Complex.weierstrassFactor`. Read at commit `127b50e` (`…/Mathlib/Analysis/Complex/WeierstrassFactor.lean` lines 55–57): `(1 − z) exp(partialLogSum m z)`, which is `E₁` at `m = 1`.
9. **5.3 and 5.5.** Davenport §§11–12 are uncertified. PNT+ `Complex.Hadamard.hadamard_factorization_of_order` was read at `127b50e` (`HadamardFactorization/Order.lean` lines 180–189).
   - It factors `f = exp(P) z^{ord₀} ∏` at genus `⌊ρ⌋` for `f` not identically `0`.
   - Its `EntireOfOrderAtMost ρ f` (lines 82–84) is `∀ ε > 0, ∃ C > 0, ‖f z‖ ≤ exp(C(1+‖z‖)^{ρ+ε})` with entirety. That is equivalent to `OrderLE f ρ` for entire `f` and `ρ ≥ 0`, as the table says.
10. **5.6a.** Provenance only. The Checks were recomputed: `2/(1+14.1347²) = 0.0099606`, and `‖ρ−2‖² ≤ 4(1+γ²)` on `0 ≤ β ≤ 1`.
11. **6.3.** It has no own locator: its clauses are read off 6.4 at *heckeZeroFreeConstant*. The cap gives `c/log q(χ,0) ≤ (log 3/2)/log 3 = 1/2`, so `β ≥ 1/2`.
12. **7.6.** Titchmarsh Theorem 9.4 (printed p. 214) is paywalled (Not verifiable). The corollaries follow from 7.5 as stated. The averaged identity `∫_0^T (N(t+1)−N(t)) dt = ∫_T^{T+1} N − ∫_0^1 N` was rederived.
13. **8.6.** Davenport §§19–20 are uncertified.
14. **8.8.** Lagarias–Odlyzko 1977 Theorems 1.3 and 9.2 are paywalled (Not verifiable). The abelian statement itself is 8.7 transported.
    - Tau Ceti `rayClassArtinMap_idealClass` (`…/AdmissibleModulus/Reciprocity.lean:216`) is stated for `K L : Type` with `IsAbelianGalois`, as the README says.
    - `frobeniusPrimeCount` is `ℕ`-valued (`…/Chebotarev/PrimeCounting/VonMangoldt.lean:177`); the Lean statement casts it.

**Further locators checked in full.**
- **`kadiri2012`.**
  - Theorem 1.1 (lines 79–85): `d_K` large, `|Im s| ≥ 1` zero-free, at most one simple real zero for `|Im s| ≤ 1`.
  - §1 (1.5)–(1.6) (lines 65–73): LMO Lemma 2.3 with `A(χ) = d_K N𝔣`, `R₄` independent of `K`.
  - §2.1.2 (line 230).
- **`bennett2021`.** Corollary 1.2 (lines 83–84): `q > 1`, `T ≥ 5/7`, `0.247 log qT + 6.894`. §1 (lines 73–76) describes the gap in Trudgian's proof.
- **`hasanalizade2022`.** Corollary 1.2 (lines 63–65): `T ≥ 1`, `0.228(log d_K + n log T) + 23.108n + 4.520`. §1 (lines 40–50).
- **`trudgian2015`.** Theorems 1–2 (lines 19–27).
  - The README's "Math. Comp. 84 (2015), 1439–1450" agrees with `hasanalizade2022` line 786.
  - The board manifest's `venue` for this key says pp. 2047–2058. That is a manifest correction outside this pull request.
- **`dlmf5`.** 5.11.2 (lines 158–160) and the remainder bounds of §5.11(ii) (lines 563–569).
- **DLMF 5.6.6.** `|Γ(x+iy)| ≤ |Γ(x)|` (dlmf.nist.gov/5.6, line 266 of the fetched page), for 1.3a.

### Library and supplier declarations

- **Pinned names.** One scratch file with 244 `#check @name` lines (Mathlib, and Tau Ceti over 47 built modules) elaborates. The one unknown constant is the bare spelling `LSeries.wienerIkehara`. The README places it in the namespace `TauCeti` (line 390), and `TauCeti.LSeries.wienerIkehara` resolves. `TauCeti.perronFormula` is at `…/ArithmeticDirichletSeries/Perron/Ideal.lean:161`, a module without an object file, found by grep.
- **File locations.** Every file location the README gives for a Tau Ceti declaration matches its definition site. Examples: `BranchLogRoot.lean:173`, `Argument/Cycle.lean:110`, `Winding/SegmentSum.lean:154`, `Counting.lean:630`, `Prime/Psi.lean:210`, `HigherPrimePowers.lean:296` (`1 ≤ x`), `AbelSummation.lean:494` and `LogIntegral.lean:180` (`2 ≤ x`).
- **Statements read against the README.**
  - `AnalyticOnNhd.sum_divisor_le` (`1 ≤ M`, `f c ≠ 0`, count on `closedBall c |r|`; 4.3).
  - `DirichletCharacter.LFunction_changeLevel` (`χ ≠ 1 ∨ s ≠ 1`, product over `N.primeFactors`; 6.4 at `K = ℚ`).
  - `Complex.Gammaℝ_eq_zero_iff`.
  - `TauCeti.Contour.argumentPrinciple_nullHomologous` (7.2 hypotheses exactly).
  - `TauCeti.LFunctions.heckeLFunctionC_eq_primitive`.
  - `NormalizationTranslation` (`gammaR_eq`/`gammaC_eq` add `w/2`; `completed_eq` is `N^{−w/4} Λ_ar(s + w/2)`), which gives 2.3's `continuedL analytic s = continuedL arithmetic (s + w/2)`.
- **L-functions supplier names.** All 52 names that "From TauCetiRoadmap.LFunctions" consumes are declared in `TauCetiRoadmap/LFunctions/Suggested.lean` on main, under the cited layers:
  - `dedekindZetaC` at line 965 (Layers 2–3);
  - `heckeData` at line 1632 (Layers 5–6);
  - `Grossencharacter.heckeMellinTotal` at line 2390;
  - `heckeLFunction_ne_zero_of_one_le_re` at line 2680 (Layer 7).

  The 13 "found nowhere" leads in `citations.md` are those LFunctions names and the PNT+ Provenance names, which are not pinned by design.

### Duplication, ownership, overlaps

- **Overlap tool.** It reports no dropped id, no id that only an open revision defines, and no id this pull request drops. Every section id of main's README (1.1–9) is kept; this head adds 0.1–0.4, 1.3a, 1.4a, 2.1–2.5 and 5.6a. #1907 is the only other pull request on this roadmap (R01).
- **Other open roadmaps.** `roadmaps grep` over the open heads found no other roadmap declaring any of these: `OrderLE`, `zeroCount`, `zetaEntireCompletion`, `hadamard_of_orderLE_one`, `riemannZeta_zeros_summable_ordinate`, `neg_re_logDeriv_riemannZeta_le`, the zero-region, Riemann–von Mangoldt and effective-count headlines. Only #1907 does.
- **Closest in vocabulary.** ExplicitZetaBounds, ExplicitPrimeCounting and ExplicitNumberFields cite ZerosOfLFunctions sections (4.5, 5.6, 7.1–7.3, 8.4) rather than restating them. ZerosOfLFunctions is on main, so it is the earlier owner in any case.

### Headline theorems

The README Summary names five end theorems:
- the region for Dedekind and finite-order Hecke L-functions: `heckeLFunction_zeroFreeRegion`;
- the uniform Riemann–von Mangoldt count: `riemannVonMangoldt_heckeLFunction`;
- the effective prime ideal theorem: `primeIdealCount_effective`;
- the effective ray-class count: `rayClassPrimeCount_effective`;
- effective abelian Chebotarev: `frobeniusPrimeCount_effective_abelian`.

All five are stated. The `K = ℚ` instances and general Hadamard are stated as well.

The docstring names what is not statable at the pins:
- the completed Dedekind and Hecke functions, needed for 5.6 over the families;
- the exceptional-zero terms of 8.5–8.8.

No headline is forced through a stand-in.

### Adversarial table

Every value below was computed in this review, with a toolkit validated on `ζ(2)`, `ζ(½)`, the first zero and `ψ(1)`.

| Statement | Instances | Values computed (each side) | Result |
| --- | --- | --- | --- |
| 0.1 `OrderLE` | `exp z²` at order 1; `1/Γ` at `−n−½`; `A < 0` | `log(e^{100}/e^{31.62}) = 68.38`; `3.702494 = Γ(4.5)/π`; `A' ∈ (A,0)` bounds `f` | holds |
| 1.1 *logGamma* | crossings of `Im = π`; `s = 3` | `r = 5.5386, 4.1513, 12.6264` (README `5.539, 4.151, 12.626`); `0.693147 = log 2` | holds |
| 1.3a | `t = 0, 1, 3`; `Re s = 3/2, −1/2` | `|Γ(½+it)|² = 3.14159, 0.271015, 0.000507 = π/cosh πt`; `Γ(3/2) = 0.886227`; `Γ(−½) = −3.544908` | holds |
| 1.4a | `s = 2`; `s = −2`; `ψ(i)` | `1.4150927 = 1.4150927` (`γ+log 2π−1`); `−0.164823` against `0.554120`; `Im ψ(i) = 2.076674` | holds |
| 1.5 | `Gammaℝ`, `σ = ½, 2`; `Gammaℂ`; `{0,1}` | remainders `0.806043`, `−0.572365`, `0.693147`; `Gammaℝ(s)Gammaℝ(s+1) = Gammaℂ(s)` to `10⁻¹⁵` at `0.3+7i` | holds |
| 1.6 | `ζ` at `0`; `|1/Gammaℝ(−7)|`; `F` | `−½` against raw `0`; `0.0673705 = π^{−4.5}Γ(4.5)`; `F(2) = 1` against `F(−1) = 0` | holds |
| 2.1 | `ζ` at `½`; `gammaC = {0}` at `0`; no gamma | `7/2`; `12` against `3`; `N` | holds |
| 2.3 | weight-`k` newform, `w = k−1` | `ν_an = (k−1)/2` (Tau Ceti `gammaC_eq`); centre `½ ↔ k/2` | holds |
| 2.4 | `Δ`, `k = 12`, `N = 1` | `(6+3)(7+3) = 90 = analyticConductorAt f 6`; `3.5 · 4.5 = 15.75` at `½` | holds |
| 2.5 | `ℚ(i)`; `χ₋₄` | `4·3·4 = 48`; `4(1+3) = 16` against `4` | holds |
| 4.4 | `ζ`, `T = 14`; `T = 100` | Jensen bound `10.60 ≥ 1` zero; `21.27 ≥ 2` zeros (`98.831`, `101.318`), `log 103 = 4.635` | holds (route: R02) |
| 4.4 at low `T` (R02) | `T = √15`; `T = 2` | `|1−(2+i√15)| = 4`: sphere through the pole; disc of `T = 2` lies in `Im ≥ 1` | route gap |
| 4.5 (R02) | unit squares of `N(T)` | centres `T = ½, 3/2` below the stated `T ≥ 2` | route gap |
| 4.6 | `z²(z−3)`; `1/z` | `1.386 ≤ 1.674`; `3 log(5/3) = 1.5325` both sides; signed carrier `0 ≤ −log(R/r)` false | holds |
| 5.2 `E₁` | `z = −½` | `0.090204 ≤ 0.125`; genus 0 gives `0.5`; `deriv E₁ 1 = −e` | holds |
| 5.3 | `cos z` at `z = 1` | `0.5403023` against product (`2·10⁵` factors) `0.5403026` | holds |
| 5.5 / `zetaEntireCompletion_hadamard` | `zetaEntireCompletion` at `0` | `f(0) = 1`, so `A = 0`; `B = f'(0) = −0.02309571` against Davenport `−γ/2−1+½log 4π = −0.02309571` | holds |
| `hadamard_of_orderLE_one` | `1 − s`; `exp`; `ρ = 0` | `(a,b) = (0,−1)`: `e^{−s}(1−s)e^{s}`; `(0,1)`, empty product; factor `1^0 = 1` | holds |
| 5.6 | `χ₄` | `Λ(0) = Gammaℝ(1)·½ = 0.5`; `Λ(1) = 2·Gammaℝ(2)·π/4 = 0.5` | holds |
| 5.6a / `riemannZeta_zeros_summable_ordinate` | first pair; `−2`; comparison | `0.0099606`; divisor `0`; `202.04 ≤ 4·200.79` | holds |
| 6.3 | cap; `ζ` | `β ≥ 1 − (log 3/2)/log 3 = ½`; `ζ(½) = −1.460355 < 0`, set empty | holds |
| `heckeLFunction_zeroFreeRegion` | `n = 0`; `ℚ`, `ψ = 1`; nesting | no field (`finrank ≥ 1`); first zero excluded iff `c < 1.42055`; `1 + log(4/3)/log 3 = 1.261860 < 1.27` | holds |
| `riemannZeta_zeroFreeRegion` | `s = −2`; `s = 1` | `Re = −2 < 1 − c/log 3` for `c < 3.2958`; excluded | holds |
| `dirichletLFunction_zeroFreeRegion` | `χ₀` mod 2, 6; mod 6 from mod 3 | `0.693426`; `log 18 = 2.890372`; `log 45.19 = 3.810968`; cap `0.549306` | holds |
| 6.4b | trivial character at `(2)`, `s = 2` | `(log 2)/3 = 0.231049` against source-conductor bound `0` | holds |
| 6.4d `ℚ(√D)` Check | `σ = 1.1`, `B = 10⁶`; `B = 10` | `9.441036`; `13.858098 > 13.85`; `½ϑ(10⁶) = 499242.09`; `1680`, `1681 = 41²`, `3361` prime with residues `1,1,1,1` | holds |
| `neg_re_logDeriv_riemannZeta_le` | `t = 14.1347`, `δ = 0.1, 0.01`; `δ = 2t → 0` | `0.50434 ≤ 2.6486C`; `−1.29621 ≤ −1.66667 + 2.6486C` iff `C ≥ 0.140`; `−1.58519 ≤ −1.96078 + 2.6486C`; `24.4265, 249.423` against `1/(4t) = 25, 250` | holds |
| `riemannVonMangoldt` | `T = 100` | `28.1273` against `29` | holds |
| 7.5 record | `ζ(s)(1+5·2^{−s}+2·4^{−s})` | zeros at `Re = 2.189525`, `−1.189525`; FE with conductor 4, `ε = 1` rederived | holds |
| `riemannVonMangoldt_heckeLFunction` | `ℚ`, `ψ = 1`, `T = 100` | open-strip count `58` against `56.2547`; `C log 100` | holds |
| `riemannVonMangoldt_dirichlet` | `q = 1`, `T = 100` | `58 = 2·29` (divisor `−1` at `0,1`; `ζ < 0` on `(0,1)`) against `56.2547` | holds |
| 7.6 | `T = 100`, `T → ∞` | `29/(100 log 100) = 0.0630`; main-term ratio `0.0611` → `1/2π = 0.1592` | holds |
| 8.3 / `chebyshevPsi_explicitFormula` | `ℚ`; `ℚ(i)`, `x = 2`; `x = T = 2` | `c_ℚ = −1.837877`; `0.693147 = log 2`; `0.693147` against `0.305964`, gap `0.387 ≤ 0.4805C` | holds |
| `riemannZeta_weilExplicitFormula` | `φ = 0`; constant term; signed divisor | `0 = 0`; `−(log π)φ(1)` rederived; signed form short by `φ̃(0)+φ̃(1) > 0` | holds |
| 8.5 / `primeIdealCount_effective` | `ℚ`, `x = 10⁶`; `ℚ(i)`, `x = 10` | `ψ−ϑ = 1102.4225 ≤ 137682.398`; `∑π(x^{1/k})/k = 99.1117`; `1.3863 ≤ 24.19` | holds |
| 8.6 | quartic `χ` mod 5 | `−(i log 2)/2` against `+(i log 2)/2` with `χ` on both terms | holds |
| 8.7 / `rayClassPrimeCount_effective` | `(4)∞`, class `3`, `x = 20`; width | `4` against `Li(20)/2 = 4.430068`; thresholds `log x = 0.695748, 2.495844, 190.868415` | holds |
| `primeCounting_progression_effective` | `q = 4`, `a = 3, 2` | `4` against `4.430068`; `IsUnit 2` fails, count `1` | holds |
| 8.8 / `frobeniusPrimeCount_effective_abelian` | `K = L = ℚ`; `(8)∞` | `#C/#G = 1`; `ker Φ = {1,5}`, `χ₈(5) = χ₋₈(5) = −1` | holds |
| 8.9 | `x = 10, 10⁴` | `Li 10 = 5.120436`; `∫ = 3.662881` by both routes; `0.777491` against `1.886117`; `159.3558` against `117.8823` | holds |
| `dirichletLFunction_convexity` | `q = 1`, `t = 0`; `q = 2` | `|ζ(½)| = 1.460355 ≤ C·3^{¼+ε}`; no primitive character mod 2 | holds |

## Not verifiable

- **Paywalled, with no key in `sources.toml`.** They were not read; the board's manifest has no entry for them.
  - Titchmarsh–Heath-Brown: §5.1, §§9.2–9.4, Theorem 9.4 "printed p. 214" (7.4, 7.6).
  - Iwaniec–Kowalski: §5.1 (5.7), §5.2 (2.1, 3.3–3.4).
  - Lagarias–Odlyzko 1977: Theorems 1.3 and 9.2 (8.8).
- **Settled as uncertified, cited by locator.** `davenport2000` (§§11–20), `lang1994` (XVII §3, Theorem 3.1) and `lagarias1979` (Lemma 2.3, reported by `kadiri2012` lines 65–73).
- **PNT+ Provenance.** The rows for 5.3, 5.6a, 6.2, 6.4d, 7.2 and 8.5 were not read. The manifest's cached file is the repository README, which names none of them; only the 5.2 and 5.5 files were fetched.
- **Ownership against open pull requests.** Checked through `roadmaps grep`/`roadmaps overlaps` at the indexed heads, not by reading every open folder.

## Source issues

- **Misprint** in kadiri2012 at §1, display (1.6), arXiv p. 2: the source says Lagarias–Montgomery–Odlyzko show Hecke L-functions have no zero at all in region (1.6); it should say no zero there except possibly the single real zero allowed by (1.5); affects nothing.
