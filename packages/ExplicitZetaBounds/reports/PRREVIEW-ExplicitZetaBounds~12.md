# Review of ExplicitZetaBounds (pull request #1954 at 4478804)

**Verdict:** needs changes

This is a full review. The folder changed by 399 lines since `1a57053`, the head the previous review read.

All five findings of PRREVIEW-ExplicitZetaBounds~11 are repaired (details below). This review raises two new findings: one P2 and one P3.

## Previous findings

- **R01 (P2), Rosser's bound from `T = 2`: repaired.**
  - README 2048–2055 now reads: "for `T ≥ 1467`, … Given `ZetaZeroFreeUpTo 14` and the record `ZetaArgumentBoundUpTo 6800000 2` (0.4), the bound holds for every `T ≥ 2` (`zetaZeroCountBound_rosser_of_recorded`)".
  - `Suggested.lean` 563 has `ZetaZeroCountBound (7 / 8) 0.137 0.443 1.588 0 1467`, and 572–574 add the version with records.
  - `zetaZeroCountBound_seven_eighths` (585–587) now takes `ZetaZeroFreeUpTo 14` and the 2.5167 record.
  - The new record is `trudgian2014argument` (1.2), line 48: "`|S(T)| ≤ 2`, for `0 ≤ T ≤ 6.8·10⁶`". Rosser's `T₀ = 1467` is at line 27.
- **R02 (P2), the two forms of 7.3: repaired.** README 2880 now reads "which, for `R > 0`, implies *ClassicalZeroFreeRegion* `R' t₀`". A negative-control Check at 2944–2947 reproduces the earlier counterexample.
- **R03 (P3), Mathlib's identities in 3.4: repaired.**
  - README 311–316 and 1286–1299 cite `riemannZeta_im_eq_zero_of_one_lt`, `logDeriv_riemannZeta_one_sub` and `Complex.digamma_nat_add_one`, all of which exist at the pin.
  - The extension to `s = 2` by continuity is stated.
  - `riemannZeta_strictAntiOn` (`Suggested.lean` 399–401) has dropped the reality conjunct.
- **R04 (P3), project citations without locators: repaired by removal.**
  - Neither `ieantn` nor `primenumbertheoremand` occurs in the folder, and both References entries are gone.
  - The statements that carried only that attribution (0.5a first order, 0.5b, 2.5, 4.5c, 7.3a) now stand on their own routes.
- **R05 (P3), names that did not resolve: repaired.**
  - README 365 reads "§0.23a: the slit-plane `log Γ`, normalized by `log Γ(1) = 0`".
  - README 312 and 1303 use the qualified name `ArithmeticFunction.LSeries_vonMangoldt_eq_deriv_riemannZeta_div`.

## R01 (P2) — Rademacher's general bound is statable at the pins, and the docstring's reason is false

**Location.**
- `TauCetiRoadmap/ExplicitZetaBounds/Suggested.lean` 68–72: "Rademacher's bound (3.2) at the generality of an analytic record of finite-order type, which needs the record `AnalyticLFunctionData` … absent from Mathlib and Tau Ceti".
- README 332–339 ("From TauCetiRoadmap.LFunctions") and 318–330 ("From Tau Ceti").

**Claim.** The record is in the pinned Tau Ceti, so the stated reason is false. By the file's own list this is a headline, and it is statable. Only two things are missing, and both can be written directly:
- the continued L-function of `ZerosOfLFunctions` 1.6, as a limit;
- *IsFiniteOrder*, as an explicit growth hypothesis.

The README's supplier contracts also cite these objects only as roadmap targets, although Tau Ceti has them. Its Layer 4 line says `dirichletData` carries "Mathlib's completed function", but Tau Ceti's carries the conductor power as well.

**Witness.** In Tau Ceti at `2fd255d`:
- `TauCeti/NumberTheory/LFunctions/Data/Basic.lean:82` has `structure AnalyticLFunctionData`, with the three predicates at lines 174, 183 and 193;
- `Data/RiemannZeta.lean:50` has `riemannZetaData`;
- `Dirichlet/Basic.lean:38–49` has `dirichletData χ hχ`, with `completed s := N^(s/2) * χ.completedLFunction s`.

**Repair.** In `Suggested.lean`:
- add `import TauCeti.NumberTheory.LFunctions.Data.Basic`;
- add the two declarations below;
- delete the "Not statable" bullet.

```lean
/-- **Layer 3.2, the continued L-function of a record.** The limit at `s` of
`N^{−z/2} Λ(z)/γ(z)`, the L-function continued across the poles of its gamma factor. -/
noncomputable def continuedL (d : TauCeti.LFunctions.AnalyticLFunctionData) (s : ℂ) : ℂ :=
  Filter.limUnder (nhdsWithin s {s}ᶜ) fun z ↦
    ((d.conductor : ℂ) ^ (-z / 2)) * d.completed z / d.gammaFactor z

theorem norm_continuedL_le_rademacher (d : TauCeti.LFunctions.AnalyticLFunctionData)
    (hD : d.HasDirichletAgreement) (hM : d.HasMeromorphicContinuation)
    (hF : d.HasFunctionalEquation) (hR : ∀ μ ∈ d.gammaR, μ = 0 ∨ μ = 1) (hC : d.gammaC = 0)
    (hP : ∀ p, d.polarOrder p ≤ 1 ∧ (d.polarOrder p ≠ 0 → p = 0 ∨ p = 1))
    (hfin : ∃ A : ℝ, ∀ s : ℂ, ‖s * (s - 1) * d.completed s‖ ≤ A * Real.exp (A * ‖s‖ ^ A))
    (hmaj : ∀ σ : ℝ, 1 < σ →
      ∑' m : ℕ, ‖d.coeff m‖ * (m : ℝ) ^ (-σ) ≤ (riemannZeta σ).re ^ d.degree)
    (η : ℝ) (hη₀ : 0 < η) (hη₁ : η ≤ 1 / 2) (s : ℂ) (hσ₀ : -η ≤ s.re) (hσ₁ : s.re ≤ 1 + η)
    (hs : s ≠ 1) :
    ‖continuedL d s‖ ≤ (if d.polarOrder 1 ≠ 0 then 3 * ‖(1 + s) / (1 - s)‖ else 1) *
      ((d.conductor : ℝ) * (‖1 + s‖ / (2 * π)) ^ d.degree) ^ ((1 + η - s.re) / 2) *
        (riemannZeta (1 + η)).re ^ d.degree := sorry
```

In the README:
- name `norm_continuedL_le_rademacher` in 3.2;
- list the Tau Ceti declarations, with their files, under "From Tau Ceti";
- in the Layer 4 contract line, write that Tau Ceti's `completed` includes `N^{s/2}`.

**Tested.**
- A scratch copy of `Suggested.lean` with these lines elaborates with exit 0 and 43 `sorry` warnings, one more than now, and nothing else.
- At `riemannZetaData` the limit at `s = 0` is `ζ(0) = −1/2`, so the definition is faithful at the pole of `Γℝ`.
- At `dirichletData χ hχ`, `N^{−z/2} · N^{z/2}` cancels and the limit is `L(s, χ)`.

## R02 (P3) — 0.1 credits *Excursions* with introducing the O* notation

**Location.** README 413–414: "(Ramaré, *Excursions* §1, which introduced the notation; `ramare2022excursions`)".

**Claim.** The 2022 book did not introduce the notation: Ramaré's 2015 paper already defines it.

**Witness.** `ramare2016density` line 207 (arXiv 2015; Acta Arith. 2016) defines `f = O*(g)` as `|f| ≤ g`, the predicate of 0.1 at `b = 0`.

**Repair.** Write "(Ramaré's notation, defined for instance in `ramare2016density` line 207 and used throughout *Excursions*, `ramare2022excursions`)". Tested: line 207 states the same predicate.

## Verified sound

### Gate, build and dependencies (run here at 4478804)

- `gate … ExplicitZetaBounds --base origin/main` reports every check at `0` and ends `OK`. The worker's `gate.md` agrees and records `build=0`.
- The dependency check prints `depcheck: 239 roadmaps, 2353 edges, 0 problem(s)` and exits 0, with no UPWARD, CYCLE or `moved:` line.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/ExplicitZetaBounds'` prints nothing.
- `lake env lean TauCetiRoadmap/ExplicitZetaBounds/Suggested.lean` exits 0 with 42 warnings, all ``declaration uses `sorry` ``.
- The file has 70 declarations (42 theorems, 28 definitions), one `import Mathlib`, no `variable` block and no `set_option`.
- I compared the elaborated types of the five changed declarations with README 1286–1289, 2048–2059, 2170–2184 and 3048–3053: `zetaZeroCountBound_rosser`, `…_rosser_of_recorded`, `…_seven_eighths`, `LFunction_ne_zero_kadiri` and `riemannZeta_strictAntiOn`. They agree.
- **One-tactic probe.** Every `sorry` was replaced by `first | rfl | simp | norm_num | infer_instance | positivity | decide`. All 42 theorems still fail: 41 with unsolved goals, and one, at line 823, with maximum recursion depth. Nothing is padding.
- **Names.** I ran `#check` on the README's 137 external backticked names. The only ones that do not resolve are:
  - notation such as `A_k` and `a_n`;
  - roadmap names: `landau_siegel_exclusion`, the two names in SieveMethodsAndPrimePatterns §2.9, and the `AnalyticLFunctionData.*` names that Tau Ceti has under `TauCeti.LFunctions` (R01);
  - the short form at README 1179, whose full name, at line 300, resolves.

### Sources: the seeded sample, checked at the cached texts

- **0.1:** the predicate and its laws were checked by computation (table). The locator in `ramare2022excursions` is uncertified, and its attribution is R02.
- **2.6:** `nemes2015`:
  - lines 38 (Nemes's `γ₁ = −1/12`) and 52–61 (the remainder `R_N`);
  - lines 86–100 (Theorem 1.1, (1.4)) and 105–108 (Theorem 1.2, for `Re z > 0`, line 101);
  - lines 125–135 (`1 + 1/(12x) + 1/(288x²)`), 169–171 (Theorem 1.3) and 543–554 (the factor below 2, which gives `(2√N + 1)/2`).
- **2.8:** `thornerzaman2024` lines 329–333 (Rademacher's Lemmas 1 and 2 at `σ = 0`). `rademacher1959` itself is uncertified; the full range was checked by computation (table).
- **3.2a:** no source. The route is complete and was checked by computation.
- **3.3:** `trudgian2014argument` lines 261–263 (Backlund's (53) for `t ≥ 50`). `backlund1918` is uncertified.
- **4.5b:**
  - `hiarypatelyang2024` lines 72–80 (Lemma 2.1, `t ≥ 200`, with the Gabcke remainder bounded by `R(t)` in its proof);
  - the step at the generality of `Z(t)` is `hiary2016zeta` lines 143–154: the remainder `R₀` is below `0.127 t^{−3/4}`, `β = cos(π/8)` and `β(2π)^{1/4} < 1.48`;
  - Mathlib's `hardyZ`, at `Mathlib/NumberTheory/LSeries/HardyZ.lean:76`, is `(completedRiemannZeta (1/2 + tI)).re / ‖Gammaℝ(1/2 + tI)‖`.
- **6.1a:** `kedlaya2025notes` lines 773–789, Exercise 6 of §1.6 (heading at line 730).
- **6.5:** `montgomeryvaughan1974`, `preissmann1984` and `elliott1987` are uncertified. The Checks were recomputed: the weights are `0.25` and `0.27542`.
- **7.3a and 7.3:**
  - `kadiri2005`: line 163 ((H1)), 182 (`θ₀ = 0.99555`), 194 (Proposition 2.1, stated for every complex `s`) and 987–1001 (Lemme 4.3, `0.098178` from Backlund's count from `t₁`);
  - `trudgian2014argument` line 26 (Backlund's `T₀ = 200`);
  - `mossinghofftrudgian2015` lines 349–366 (`p₁` and `p₂` increase with `c₃₀`) and 377–392;
  - `jangkwon2014` lines 496–497 (Kadiri's `C(η)`).
- **7.5:**
  - `kadiri2002thesis` lines 1960, 1964 and 1976–1980 (Théorème 11.1, `R₁ = 6.4355`, `c = 1.7367`) and 2049, 2054 and 2063–2068;
  - `kadiri2018` lines 16–18, 128–135, 142–148 and 149–157 (Theorem 2.3 for non-principal `χ`, with Trudgian's `0.247` and `8.949`) and 567–570;
  - `thornerzaman2024` lines 164–170 and 219–226;
  - `luzamanzhao2026` lines 39–44;
  - `ramare-rumely-1996` lines 795–848, including the printed `0.02194` at line 814 (Source issues) and lines 843 and 846–847.
- **7.6:**
  - `ford2002zerofree` lines 32–34 and 135–136;
  - `mty2024` lines 53–54, 205–213 and 458–461;
  - `bellotti2024` lines 81–82 and 1279–1280;
  - `bellotti2025density` lines 350–365 (`53.989`);
  - `khale2024` lines 24–26.
- **7.8:** `luzamanzhao2026` lines 39–42. The record (`Suggested.lean` 239–241) excludes `χ = 1`, so the principal character modulo `q` is excluded.
- **7.10:** `hiaryleongyang2025` lines 41–43 (Theorem 2), 1013–1017 (Yang's region), 1157 (`t₀ = 500`) and 1171–1175 (the record range). `leong2026` and `leeLeong2022` are image-only (Not verifiable).
- **8.3a:** the predicate's laws were checked by computation (table). `fks2023psi` Theorem 2.7 was read in the previous round and is unchanged.
- **9.1:** `ramaretmeemt` lines 88–100 give all four constants. `ramare2001` is uncertified.
- **Also read for this head's changes:**
  - `trudgian2014argument` lines 14–15 and 26–48;
  - `bellottiwong2025` lines 50–61 (Table 1: Rosser `T₀ = 2`, constant `2.4630`);
  - `brentplatttrudgian2021` lines 38–43 (Lemma 1) and 74 (footnote 1: `|Q(T)| ≤ A log T` for `T > 2πe`), the source of 5.4's new hypothesis;
  - `platt2016grh` lines 955–963 (Theorem 7.1) and 976–978 (Theorem 7.2).

### Library declarations opened at the pins

- **Mathlib:**
  - `NumberTheory/LSeries/Dirichlet.lean`: lines 331, 341, 348, 352 and 439;
  - `NumberTheory/LSeries/RiemannZetaLogDeriv.lean:35` (hypotheses `∀ n : ℤ, s ≠ n` and `ζ(s) ≠ 0`);
  - `Analysis/SpecialFunctions/Gamma/Digamma.lean:85` (inside `namespace Complex`, line 45);
  - `NumberTheory/LSeries/HardyZ.lean`: lines 76–98;
  - `NumberTheory/Harmonic/ZetaAsymp.lean`: lines 343, 420, 460 and 523 (real-variable forms only; no complex fract-integral representation, so 0.5b duplicates nothing);
  - `iteratedDerivWithin_cot_sub_inv_eq_add_mul_tsum`, stated on `UpperHalfPlane.upperHalfPlaneSet` as 4.5c says.
- **Tau Ceti:**
  - `NumberTheory/LFunctions/Data/Basic.lean`: lines 82–193 (R01);
  - `Data/RiemannZeta.lean:50`;
  - `Dirichlet/Basic.lean:38`;
  - `NumberTheory/DirichletCharacter/LFunction/Bounds.lean:67`, a level bound for `L(s, χ)` with `χ ≠ 1`, which does not overlap 3.2a (stated for `ζ`);
  - `Analysis/Complex/PhragmenLindelof.lean:33`, an upper half-plane principle, not 3.1's explicit form.
- No Euler–Maclaurin, Stirling remainder, van der Corput, large sieve, Riemann–Siegel or zero-count declaration exists at either pin.

### Cross-roadmap citations resolved

- **ZerosOfLFunctions on main:**
  - Layer 0 at line 319, with *IsFiniteOrder*;
  - §§1.1 (430), 1.4 (478), 1.6 (506) and 3.4 (705);
  - Layer 4 (802), with 4.3 (837) and 4.5 (872);
  - §§5.5 (989), 5.6 (1003), 6.3 (1075), 6.4 item (4d) (1113) and 6.5 (1142);
  - §§7.1–7.4 (1182–1263) and Layer 9 (1586).
  - Item (4d) proves `Re b(χ) = −Σ Re(1/ρ)` for non-real `χ` (lines 1122–1125), as 7.1 cites it.
- **LFunctions on main:** Layers 0 (346), 3 (730) and 4 (859).
- **AnalyticNumberTheoryPartI**, at the head of its open pull request:
  - §0.9 (README 288), §0.23a (658), §0.34 (883) and §0.34a (889);
  - §1.5 (1050) with item §1.5a, §1.6 (1070), §1.7 (1094) and §3.23 (2623).
- **AnalyticNumberTheoryPartII:** item §4.3a (README 206).
- **SieveMethodsAndPrimePatterns**, at its head: §2.6 (README 2238), §2.9 (2403), and `Suggested.lean` 225 and 250 inside namespaces `SieveTaper` (209) and `SieveApplications` (245).
- **ArithmeticDirichletSeries** (Completed).
- **Merge order:** LFunctions 27, ZerosOfLFunctions 48, AnalyticNumberTheoryPartI 49, PartII 50, SieveMethodsAndPrimePatterns 55, this roadmap 265. Its consumers come later: ExplicitPrimeCounting 267, ExplicitCharacterSumsAndSieves 268, ExplicitMultiplicativeFunctions 269 and ExplicitNumberFields 270.

### Ownership and overlaps

- `overlaps.md` lists no pull request that changes this roadmap and no dropped id.
- I ran `roadmaps grep` for this head's new objects (`ZetaArgumentBoundUpTo`, `6800000`, `zetaZeroCountBound_rosser`, Rosser's bound). Only ExplicitPrimeCounting consumes them.
- **A note for that roadmap, not a change here.**
  - At its head, ExplicitPrimeCounting README line 526 still takes Rosser's instance `(7/8) 0.137 0.443 1.588 0 2` unconditionally, and its `gap:explicit-zero-count-error` (line 595) asks this roadmap for Rosser's bound "for `T ≥ 2`".
  - This README's Downstream consumers paragraph (3703–3704) states the new contract, with the two records below `1467`. The matching edit belongs to ExplicitPrimeCounting's pull request.
- The Euler–Maclaurin formula is shared with AsymptoticExpansions (another author's open pull request, not in the merge order).
  - Its §13.1 and its `Suggested.lean` 629 state the real-valued case. README 49–52 names it as the case `E = ℝ` of 0.5a.
  - The fully qualified names differ. The overlap was settled in an earlier round, and I hold no finding on it.

### Adversarial table (all values computed here)

Values of `ζ` and `L(s, χ)` come from Euler–Maclaurin for Hurwitz zeta with a truncation adapted to `|t|`. They were checked against `ζ(2)`, `ζ(−3) = 1/120`, `ζ(1/2) = −1.4603545`, the zero at `14.134725` and `|Γ(1/2 + 10i)| = 3.7775321·10⁻⁷`. The zeros are sign changes of `Z`, cross-checked by the argument of `ζ`: `N(100) = 29`, `N(1400.3) = 983` and `N(1529.7) = 1096` both ways.

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| 0.1 *BigOStar* | `π` against `3`; `1 = 1 + O*(−1)`; `i = 0 + O*(1)` | `0.14159 ≤ 0.1416`, `> 0.1415`; `0 ≤ −1` false; `‖i‖ = 1` | ✓ (attribution R02) |
| 2.6 Stirling coefficients and Nemes | `γ₃`; `N = 2`, `z = 10`; `x = 1` | `−1/360 + 1/10368 = −139/51840`; bound `0.000204` against true `3.20·10⁻⁵`; `1.084438 < 1.086806` | ✓ |
| 2.8 gamma quotient | `a ∈ {0, 1}`, 101 values of `σ ∈ [−1/2, 1/2]`, 24 values of `t` | minimum log-margin `−3.6·10⁻¹⁵` (equality) at `σ = −1/2`, `a = 0`, `t = 100`: `50.000625` on both sides | ✓ |
| 3.2a, `norm_riemannZeta_le_linear` | 3000 random `z` with `Re z ∈ (0.02, 4]`; 3000 points of the discs | minimum margins `1.259` and `9.930`; `z = 1.01`: `102` against `100.578` | ✓ |
| 3.3 Backlund | `σ = 1/2` at `t = 50, 55` | `6.581` against Lehman's `6.718`; `6.902` against `6.880`; `log 55 = 4.0073 > 4.0053` | ✓ |
| 4.5b `hardyZ_eq_exp_riemannSiegelTheta_mul` | `t ∈ [200, 450]`, step `0.05` | `max ‖hardyZ − e^{iϑ}ζ‖ = 6.2·10⁻¹²` | ✓ |
| 4.5b `abs_hardyZ_sub_riemannSiegel_le` | the same grid | minimum margin `0.0041` at `t = 402.1` (`0.32780 ≤ 0.33192`); `max ‖C₀‖ = cos(π/8) = 0.92388`; `(2π)^{1/4} cos(π/8) = 1.46272` | ✓ |
| 6.1a Landau's identity | `F = 1`, `x = 3`, `j = 1, 2`; `F = ζ`, `x = 2.5` | `3·(2/3) = 2`, `9·(2/3)²/2 = 2`; `1.5 + 0.5 = 2.0 = ∫₀^{2.5} ⌊y⌋` | ✓ |
| 6.5 weighted large sieve | `X = {0, 1/2}`, `N = 1` | weights `1/4` and `0.27542`; `2 · 0.27542 = 0.5508 ≤ 1` | ✓ |
| 7.3a predicate | `R = −1`, `R' = 0.1`; `R = 5.558691` | boundary `−2.7755` at `14.1347` (control); `e^{2/R} = 1.43304`; `0.740461` at `\|t\| = 2` | ✓ |
| 7.5 Kadiri, McCurley, Ramaré–Rumely | `q = 3`; `\|t\| = 2, 10⁹`; `k = 1`, `\|γ\| = 1000`; `k = 3`, `q = 12` | `0.837457`; `0.94214`, `0.99525 > 0.99430`; `0.022085`; `0.013155`, `0.011979 < 0.014264`; `ζ` count margin `≥ 1.0509` at `L = 10.928` | ✓ |
| 7.6 Vinogradov–Korobov | `\|t\| = e^{1000}`; Khale at `q = 3`, `t = 10` | `9.124·10⁻⁵`, `9.504·10⁻⁵`, `9.722·10⁻⁵`; `0.991110` | ✓ |
| 7.8 Lu–Zaman–Zhao record | `q = 10¹⁰`; `χ` modulo `6` induced by `χ₋₃` | region `σ > 0.995657`; extra factor `(1 − χ₋₃(2) 2^{−s})` vanishes only on `Re s = 0` | ✓ |
| 7.10 `inv_norm_riemannZeta_one_add_le` and record | `t ∈ [3, 500]`, step `0.01` | minimum margin `1170.8` at `t = 14.18`; `29.388 · H₀^{4.964} = e^{145.995}`; `0.9937397` against `0.9937382` | ✓ |
| 8.3a predicate | `σ ≥ 1`; `c₁ = c₂ = 0` on `{1/2}`; instance at `H₀` | `N° = 0`; the predicate is RH; `11.499 (log H₀)^{16/5} H₀^{4/15} + 3.186 log² H₀ = 1.916·10⁸` | ✓ |
| 9.1 `norm_LFunction_one_le_ramare` | all 4709 primitive `χ`, `3 ≤ q ≤ 160` | minimum margins: even `0.3506` (`q = 73`), odd `0.2179` (`119`), `2 ∣ q` even `0.0920` (`76`), `2 ∣ q` odd `0.0134` (`104`) | ✓ |
| 9.3 `norm_LFunction_one_ge`, `LFunction_one_ge_luZamanZhao` | the same characters | minimum margins `0.2972` (`q = 59`) and `0.3527` (`q = 5`) | ✓ |
| `LFunction_ne_zero_of_platt`, `plattHeight` | `q = 1`; `q = 400 000`, `399 999` | `ζ(1/2) = −1.46035 < 0`; `387.5`, `293.75` | ✓ |
| 0.5a `sum_Ioc/Icc_…`, `sum_Icc_eq_eulerMaclaurin` | `f = 1` on `[0, 1]`; `f = x²`, `m = 1` | `1 = 1 − 1/2 + 1/2`; `n³/3 + n²/2 + n/6` | ✓ |
| 0.5b `riemannZeta_eq_sum_add_integral_sawtooth`, `…_fract` | `s = 0.3 + 5i, 2, 0.7 − 3i`; `a = 0.3, 0.5, 1, 2.5` | residuals `5.38·10⁻⁸`, `≤ 1.4·10⁻¹³` and `2.50·10⁻¹⁰`, the same for every `a` (tail truncated at `2·10⁵`) | ✓ |
| 2.5 `norm_Gamma_bounds` | 3000 random `s`, `σ ∈ (0, 8]`, `\|t\| ≤ 40` | minimum log-margins `1.15·10⁻⁶` (lower, `σ → 0`) and `0.0042` (upper) | ✓ |
| 3.2 `norm_LFunction_le_rademacher` | primitive `χ`, `q ∈ {3, 4, 5, 7, 8, 11}`; `η ∈ {0.05, 0.2, 0.5}`; 8 values of `σ` × 5 of `t` | minimum margin `0.456` at `q = 3`, `s = −1/2` (`0.1681 ≤ 0.6237`) | ✓ |
| 3.2 general record (R01) | probe against `TauCeti.LFunctions.AnalyticLFunctionData` | elaborates; `continuedL riemannZetaData 0 = ζ(0) = −1/2` | ✗ R01 |
| 3.4 `riemannZeta_strictAntiOn` | `σ = 2, 3, 4` | `1.64493 > 1.20206 > 1.08232 > 1` | ✓ |
| 3.4 `neg_logDeriv_riemannZeta_laurent`, `KalmyninRecord` | boundary of `[−3, 5] × [−4, 4]`, 4800 points; Cauchy coefficients on `\|s − 1\| = 1` | `max ‖G‖ = 1.395429` at `−3`, `≤ 1.396`; `a₀ … a₈ = 0.577216, 0.187546, 0.051689, 0.014752, 0.0045245, 0.0014468, 0.00047154, 0.00015518, 0.00005135`, all `> 0` | ✓ |
| 4.5c `riemannZeta_eq_partialSum_halfInteger` | 400 random `σ ∈ [0, 2]`, `N ≤ 30`, `\|ϑ\| < 0.999` | minimum relative margin `0.538` | ✓ |
| 4.7 `norm_riemannZeta_criticalLine_le`, `HiaryRecord` | `t ∈ [3, 400]`; `[0, 3]`; `[3, 200]` | margins `0.2768` (`t = 3`), `0.000645` (`t = 0`), `0.2465` | ✓ |
| 4.8 `norm_riemannZeta_one_add_le`, `PatelRecord` | `t ∈ [3, 400]` | Patel's minimum margin `0.4606` (`t = 3`); the Hiary–Leong–Yang bound `2.395` (`t = 108.97`) | ✓ |
| `YangRecord` | `t ∈ [−3, 3]`, step `0.001` | minimum margins `0.0025`, `1.480` and `0.934` on `σ = 1/2`, `5/7`, `1` | ✓ |
| 4.9a `vinogradovCount_le_ford` | `k = 1000` | `Δ_s = 11343` at `s = 2k²`; `s ∈ [2·10⁶, 3 213 463]`; right side `≥ 1` at `P = 1` | ✓ |
| 4.10 `norm_riemannZeta_le_richert` | `σ = 1`, `t = 10¹⁰`; `σ = 1/2` | `616.7`; exponent `1.573` | ✓ |
| 5.2 `abs_zetaZeroCount_sub_le(_of_recorded)` | `T ∈ [e, 118]` | minimum margins `2.710` (second) and `7.141` (first) at `T = 60.83`; `3.4009 < 3.886` at `e` | ✓ |
| `zetaZeroCountBound_rosser` (new range) | `T ∈ [1467, 1530]` | minimum margin `2.308` at `T = 1474.20` | ✓ |
| `zetaZeroCountBound_rosser_of_recorded` (new) | `T ∈ [2, 118] ∪ [1400, 1530]` | `1.5206` against `0.1923` at `T = 2`; `2.3794 > 2.0018` at `T = 14`; record control at `T = 14.2`: `2.3838 < 2.5185` | ✓ |
| `ZetaArgumentBoundUpTo 6800000 2` (new record) | `T ∈ [0, 118] ∪ [1400, 1530]` | `2 − \|S\| ≥ 0.84` (minimum at `1474.20`); `1 − \|S\| ≥ 0.046` up to `118` | ✓ |
| `zetaZeroCountBound_seven_eighths` | `T ∈ [2, 118]` | minimum margin `8.153` at `T = 2` (`hZ` is used on `[2, e]`, below the bracket of 2.9) | ✓ |
| `zetaZeroCountBound_trudgian`, `…_chirreHelfgott` | `[e, 118]`; `[1, 118]` | minimum margins `2.515` (`111.03`) and `1.577` (`T = 1`) | ✓ |
| 2.9 bracket | `T ∈ [e, 118]` | both sides positive; tightest at `118` (`6·10⁻⁵` and `1.6·10⁻⁴`) | ✓ |
| 5.4 Lehman's form | `A = 2` on `[1400, 1530]`; `T₁ = 2πe` | minimum margin `13.40`; asks `5.6758`, against the record's `2.5230` from `T = 4` | ✓ |
| 5.3 `dirichletZeroCount_explicit` | `χ₋₄`, `T = 10` | `ℓ = 2.0333`, main term `2.959`, error `2.182`, `N = 2 ∈ [0.78, 5.14]` | ✓ |
| 7.1 `neg_logDeriv_riemannZeta_eq` | `s = 0`; `s = 2` | `−1.837877` on both sides; zero sum `0.069066` | ✓ |
| 7.3 `riemannZeta_ne_zero_classical` | `\|t\| = 2`, `3·10¹²` | `0.740461`, `0.993738` | ✓ |
| 7.4 `riemannZeta_ne_zero_littlewood` | `t = e^{200}`; `10¹⁰` | `0.0012477`; Ford `0.0061956 < 0.0064156` (needs the verification to `3.06·10¹⁰`) | ✓ |
| 7.5 `LFunction_zeroFree_mcCurley`, `LFunction_ne_zero_kadiri` | `Q = 3`; principal Euler factors | `0.905635`; their zeros have `q\|t\| ≥ 17 > 1.109`, outside the region | ✓ |
| 7.7 `LFunction_real_zero_le_bordignon` | the three cases | `46π/0.18 = 802.85`, `515.74`, `83.47` | ✓ |
| 8.1 `zetaZeroCountRight_le_kadiri` | `T = 3.061·10¹⁰` | `1.702·10¹⁰`, `1.353·10¹⁰` | ✓ |
| 8.4 `primitiveLZeroCount_le_thornerZaman` | `Q = 3`, `σ = 39/40` | `log₁₀` of the bound `= 99.71`; `β₁(3) = −1` | ✓ |
| 8.5 `zetaZeroDensityCount_le_bellotti` | `T = 10¹³`, `σ = 0.9927` | `2.22·10¹¹` against `N(T)/2 = 2.16·10¹³` | ✓ |
| Layer 1–6 Checks | 1.4, 1.6, 2.4, 3.2, 4.3, 4.4, 4.5, 4.5a, 6.1, 6.2, 6.4, 6.6, 9.2 | `θ₁, θ₂, θ₁₀ = 0.33593, 0.51176, 0.87001`; Mortici at `x = 20`: `0.953`; `0.000935`; `0.207886`, `11.488`, `1.976`; `32.907`, `41.362`; `6.70215`, `16.03604`; `9.372`, `7.291`; `2.1946`, `1.7159`; `0.29130`, `1.0927`; `1.384`; `1.31541`, `20.66`; `107.20`, `43.54`; `1.46677` | ✓ |
| 8.3 squarefree sum | `D ∈ [1004, 5000]` | fails at `D = 1411, 1419, 1659, 1662, 1663` only (Source issues); `Σ_{n≤1000} μ²/n = 5.242393 ∈ [5.239412, 5.247412]` | ✓ |

## Not verifiable

- Image-only scans that this worker cannot read without OCR:
  - `chirrehelfgott2025` (0.4, 3.4, 5.2a, 6.3a);
  - `leong2026` and `leeLeong2022` (7.10);
  - `hoffstein1981` (9.3);
  - `cullyhugilljohnston2025` (6.2).

  `needs-references.toml` already lists them, and none of their locators changed at this head.
- Uncertified works, cited by locator only:
  - `ramare2022excursions` (0.1, 2.1, 2.5) and `rademacher1959` (2.8, 3.2);
  - `backlund1918` (3.3), `rosser1941` (5.2) and `lehman1966` (5.4);
  - `montgomeryvaughan1974`, `preissmann1984` and `elliott1987` (6.5);
  - `ramare2001` (9.1), `davenport2000`, `titchmarsh1986`, `mccurley1984` and `dlmf`;
  - `gabcke1979`, which is waived.

  Their statements were checked by computation where the table shows it.
- The sources manifest on the board lists five keys that the README does not cite: `allasia2002`, `batir2008`, `chen2016`, `gordon1994` and `montgomeryvaughan1973`. The manifest is outside this folder and was not edited.

## Source issues

- **Error** in ramare-rumely-1996 at the proof of Theorem 3.6.2, p. 408 (line 814): the source says the bound at `k = 1`, `|γ| = 1000` is less than `0.02194`; it should be `0.022085`, which is `1/(Rℓ − 3.2356√ℓ)` with `ℓ = 5.47941`; affects nothing.
- **Error** in ramare2016density at Lemma 3.1, p. 329 (line 284): the source says the error `0.1333√D` holds for `D ≥ 1004`; it should be `D ≥ 1664`, because it fails at `D = 1411, 1419, 1659, 1662, 1663`; affects a stated result.
