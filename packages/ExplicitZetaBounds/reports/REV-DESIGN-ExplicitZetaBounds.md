<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/8434#issuecomment-6714773301 -->
Review (claude) of c9c623a

Verdict: needs_changes

1. **F01** (P1) The declared gap has no supplier; its `needs` misstates Ford's hypotheses

   - **Location.** `design/plan.json`, `gaps[0]`: `"supplier": "none"`, `"needs": "No roadmap states an
     explicit form of Vinogradov's mean value theorem …"`; README, "Declared gap: the explicit Vinogradov
     mean value theorem" (the paragraph after the SieveMethodsAndPrimePatterns contract), and the
     `*Needs:*` lines of 4.10, 7.4, 7.6, 7.10, 8.5.
   - **Claim.** The Richert-type bounds 4.10 and everything built on them (7.4, 7.6, 7.10, 8.5, the
     `4.896` instance of 7.3) rest on `gap:explicit-vinogradov-mean-value`, "which a future roadmap on
     Vinogradov's mean value theorem must provide", for "integers `k ≥ 2`, `s ≥ 1` and `N ≥ 1`".
   - **Witness.** `roadmaps grep` for Vinogradov's mean value / `J_{s,k}` matches nothing on main or at
     any open head; the board designs match nothing either; `ORDER.txt` has no owner. A gap whose
     supplier is `none` is unowned by the brief's rule. Second witness: `ford2002vinogradov` line 220:
     Theorem 3 is stated for `k ≥ 1000` and `2k² ≤ s ≤ (k²/2)(1/2 + log(3k/8))`, `P ≥ 1` (second clause
     `k ≥ 129`, lines 225–234), not for `k ≥ 2`, `s ≥ 1`.
   - **Repair.** Own the theorem here, since no roadmap does and nothing in Mathlib or Tau Ceti states
     it: add target **4.9a The explicit Vinogradov mean value theorem** before 4.10, stating Ford's
     Theorem 3 with its exact hypotheses (`k ≥ 1000`, `2k² ≤ s ≤ (k²/2)(1/2 + log(3k/8))`, `P ≥ 1`:
     `J_{s,k}(P) ≤ k^{2.055k³ − 5.91k² + 3s} 1.06^{sk + 2s²/k − 9.7278k³} P^{2s − k(k+1)/2 + Δ_s}`,
     `Δ_s = (3/8) k² e^{1/2 − 2s/k² + 1.7/k}`; and the clause `k ≥ 129`, `s ≤ ρk²`,
     `J_{s,k}(P) ≤ k^{θk³} P^{2s − k(k+1)/2 + 0.001k²}` with the table (1.7)), locator
     `ford2002vinogradov` Theorem 3, lines 220–234, route §§2–6; and Bellotti's refinement
     (`bellotti2024` Theorem 1.4, line 183, `k ≥ 90000`) as a second statement. Then delete the
     `gaps` entry from `plan.json`, delete the "Declared gap" paragraph and the "Not owned here" item on
     the mean value theorem, and replace `gap:explicit-vinogradov-mean-value` by `4.9a` in the
     `*Needs:*` lines of 4.10, 7.4, 7.6, 7.10 and 8.5 and in the Layer 4, 7 and 8 Dependencies. The
     alternative (moving 4.10, 7.4, 7.6, 7.10, 8.5 and the `4.896` instance to a Part II placed after a
     future mean-value roadmap) leaves the summary's Vinogradov–Korobov claims unprovable here; the
     first repair is the one that keeps the roadmap's stated scope.

2. **F02** (P1) The sign pattern of the Stirling coefficients in 2.6 is false in the README's own convention

   - **Location.** README §2.6, API bullet 2: "`γ_k` is rational, and `(−1)^{N} γ_{2N−1} ≥ 0`,
     `(−1)^{N+1} γ_{2N} ≥ 0` (Theorem 1.1)".
   - **Claim.** With `γ_k` the coefficients of `exp(Σ_j B_{2j} w^{2j−1}/(2j(2j−1)))`, so that
     `γ₁ = 1/12`, `γ₃ = −139/51840` (bullet 1 and the first two Checks), `(−1)^N γ_{2N−1} ≥ 0`.
   - **Witness.** At `N = 1` the bullet reads `−γ₁ ≥ 0`, false for `γ₁ = 1/12`; at `N = 2` it reads
     `γ₃ ≥ 0`, false for `γ₃ = −139/51840`. The pattern was copied from `nemes2015` (1.4), line 87,
     whose convention is the opposite: `nemes2015` line 38 prints `γ₁ = −1/12`, `γ₃ = 139/51840`
     (his `Γ ~ … Σ (−1)^n γ_n z^{−n}`). The README's own values refute its bullet (the roadmap
     disagrees with itself).
   - **Repair.** Replace the bullet by "`(−1)^{N+1} γ_{2N−1} ≥ 0` and `(−1)^{N+1} γ_{2N} ≥ 0`
     (Theorem 1.1, read in the convention here: Nemes's `γ_n` is `(−1)^n` times ours)", and add the
     Check "the signs run `+, +, −, −, +, +, …`: `γ₁, γ₂ > 0`, `γ₃, γ₄ < 0`, `γ₅ = 163879/209018880 > 0`;
     Nemes's `γ₁ = −1/12` is the opposite convention, which his (1.4) encodes as `(−1)^N γ_{2N−1} ≥ 0`".
     Tested: `N = 1` gives `γ₁ = 1/12 ≥ 0`, `γ₂ = 1/288 ≥ 0`; `N = 2` gives `−γ₃ = 139/51840 ≥ 0`,
     `−γ₄ = 571/2488320 ≥ 0`. The absolute-value bounds of 2.6 are unaffected.

3. **F03** (P2) The bounded-height hypotheses and the real-zero gap are owned twice, here and in ExplicitPrimeCounting

   - **Location.** README §0.2 (`RiemannHypothesisUpTo`, `DirichletGRHUpTo`), §7.9 (`HasLandauSiegelGap`),
     and "Downstream consumers" bullets 1 and 3.
   - **Claim.** `ExplicitPrimeCounting` "takes 0.2–0.4 by name" and `ExplicitMultiplicativeFunctions`
     takes 0.2.
   - **Witness.** ExplicitPrimeCounting (#1945, head `98329b3`) README §1.1 defines
     `RiemannHypothesisUpTo H` over `riemannZeta` on the open strip (the same definition as 0.2 here),
     §1.2 defines `DirichletGRHUpTo q H` over all characters modulo `q`, and §1.7 defines
     `RealZeroGap c Q` with a conductor cap `Q ∈ [3, ∞]` and the instances `(1/5, 10¹⁰)`,
     `(3.0·10⁻³, ∞)`; its contract `gap:real-zero-gap` asks this roadmap for exactly that capped
     predicate. ExplicitMultiplicativeFunctions (#1946, head `fa74009`) README, supplier contracts:
     "§1.1: the proposition `RH(H)` … in the form of ExplicitPrimeCounting §1.1", so it consumes the
     hypothesis from ExplicitPrimeCounting, not from here. Two open roadmaps own the same objects.
   - **Repair.** This roadmap is the earlier owner and keeps the objects; make its forms the ones the
     consumers need, so that they can cite instead of restating: (a) in 7.9 define
     `HasLandauSiegelGap c Q` for `c > 0` and `Q ∈ [3, ∞]` (conductors `3 ≤ q ≤ Q`), prove
     `HasLandauSiegelGap (1/5) 10¹⁰` from 7.8 and `HasLandauSiegelGap (3.0·10⁻³) ∞` from Banks with 7.8,
     and the laws "antitone in `c` and in `Q`" and "`HasLandauSiegelGap c 400 000` for every `c`"
     (ComputationalNumberTheory §4.24); (b) in 0.2 add the law "for `q ≥ 1`, every character modulo `q`
     (imprimitive included) has all its zeros with `0 < Re s < 1`, `|Im s| ≤ H` on the line iff
     `GRH(f, H)` holds for every conductor `f ∣ q`" (the deleted Euler factors vanish only on
     `Re s = 0`), which is the form ExplicitPrimeCounting §1.2 states; (c) in "Downstream consumers"
     say that ExplicitPrimeCounting §§1.1, 1.2 and 1.7 and ExplicitMultiplicativeFunctions' `RH(H)` are
     citations of 0.2 and 7.9 (the revision of those two roadmaps is theirs to make). Tested on the
     instance: with (a), `HasLandauSiegelGap (1/5) 10¹⁰` at `q = 3` is `(1 − β) log 3 ≥ 1/5`, which
     7.8's `L(σ, χ) ≠ 0` for `σ ≥ 1 − 1/(5 log 3) = 0.818` gives.

4. **F04** (P3) Two instances of 7.3 are stated with a non-strict boundary their sources do not give

   - **Location.** README §7.3, the criterion "no zero with `|γ| ≥ 2` and `β ≥ 1 − 1/(R₀ log|γ|)`" and
     the instances `R₀ = 5.573412` and `R₀ = 4.896`.
   - **Witness.** `mossinghofftrudgian2015` lines 117–118: "`σ > 1 − 1/(5.573412 log|t|)`" (strict);
     `bellottitrudgianyang2026` line 67: "`t ≥ 3` … `σ > 1 − 1/(4.896 log t)`" (strict). Kadiri
     (`kadiri2005` line 79), Jang–Kwon (`jangkwon2014` line 12) and MTY (`mty2024` line 97) are
     non-strict, as stated.
   - **Repair.** State the two instances with `β > 1 − 1/(R₀ log|γ|)` (for `5.573412` the non-strict
     form follows from the `5.558691` instance, since `1/(5.558691 log|t|) > 1/(5.573412 log|t|)`; for
     `4.896` nothing stronger is available, so it stays strict and with `t ≥ 3`). Add the sentence to
     the criterion that the certificate gives `β₀ ≤ 1 − 1/(R₀ log γ₀)` for a hypothetical zero, hence the
     region with `>`.

5. **F05** (P3) Locator and quotation slips

   - **6.4**: "Ramaré, Lemma 6.2, `ramare2016density`" → Lemma 6.5 (`ramare2016density` line 828;
     §6 has a Theorem 6.2, line 774, on the hybrid large sieve). Also in References ("Cited for:
     Theorem 1.1, Lemma 6.2"). The source states only the upper bound
     `∫₀^T |Σ u_n n^{it}|² ≤ Σ|u_n|²(2πc₀(n+1) + T)`; the two-sided form here follows from the same
     proof (the off-diagonal is bounded in absolute value), say so in one clause.
   - **6.1**: "their Lemma 7.1, lines 683–684" for the kernel bound → `cullyhugilljohnston2023`
     Lemma 2.2, line 163 (Lemma 7.1 at line 943 is a zero-density lemma; lines 681–685 are a zero sum).
     The constant `7/2` in the quoted `min(7/2, 1/(T|log y|))` is not at line 163 (which has
     `min{e^{yκ'}/(π|y|), |v(y) − e^{yκ'} arctan(1/κ')/π| + |y|e^{yκ'}/π}`); either quote that form or
     give the locator of the `7/2` form.
   - **4.7**, Thorner–Zaman item: the certificate is `2 Σ_j (−1)^j log ζ(j + 3/2) ≤ 1.4988`
     (`thornerzaman2024` lines 375–379); the README drops the factor `2`. Computed:
     `Σ_j (−1)^j log ζ(j + 3/2) = 0.74940`, so `2Σ = 1.4988` is the certificate and `Σ ≤ 1.4988` would
     not give `2.97655`.
   - **1.4**, first Check: `θ₁₀₀ = 0.98632` (50-digit recomputation `0.98632105…`), not `0.98625`;
     `θ₁ = 0.33593`, `θ₂ = 0.51176`, `θ₁₀ = 0.87001` are right.
   - **Mathlib name**: `DirichletCharacter.completedLFunction_one_sub` (Conventions, supplier
     contracts, 4.7, 9.1, `plan.json` 4.7c and 9.1) is
     `DirichletCharacter.IsPrimitive.completedLFunction_one_sub` at the pin
     (`Mathlib/NumberTheory/LSeries/DirichletContinuation.lean`, line 37 of the module docstring;
     used as `hχ.completedLFunction_one_sub` in `Nonvanishing.lean` line 477).
   - **7.3 `*Needs:*`** omits 7.4, which the `4.896` instance uses ("the Littlewood-type region 7.4
     above") and which `plan.json` lists among 7.3's prerequisites; add "7.4 (for the `4.896`
     instance)". With R01 applied, `plan.json`'s `neededBy` entry "7.3" disappears with the gap.

Reviewed: `packages/ExplicitZetaBounds/design/README.md`, `packages/ExplicitZetaBounds/design/plan.json`
(70 targets, 131 tests, 1 declared gap), `packages/ExplicitZetaBounds/sources.toml`. No previous
review. This is a design: there is no `Suggested.lean`, so the Lean form, the one-tactic probe and
the elaboration are not applicable (this lane does not elaborate; the package stage will). The
sampled targets, the headline theorems and every target a finding touches were checked against the
sources at the cited lines and recomputed; the cross-roadmap citations were resolved on main
(`eaf17b1`) or at the open heads; the library names were opened at the pins.

## Verified sound

**Principles.** No route-specific shortcut (every bound is stated at the generality of its source:
`ζ`, primitive `L(s, χ)`, or a finite-order record for 3.2 and 5.1); no re-planned roadmap (the
existential shapes are consumed from ZerosOfLFunctions, the general convexity and argument lemmas
are stated once here and specialized by ExplicitNumberFields); supply is downward (gate below); no
copied passage; computations enter only as named `Prop` certificates, no algorithm; no `set_option`
or sorry'd data (no Lean file at this stage). The character-sums toolkit 4.1–4.5 is owned here
because `ExplicitCharacterSumsAndSieves` (a triage only, `packages/ExplicitCharacterSumsAndSieves/target.md`)
is later in `ORDER.txt` (271 against 269).

**Gate.** `tauceti-roadmap gate --candidate … --only ExplicitZetaBounds`:
`depcheck: 243 roadmaps, 2457 edges, 0 problem(s)`. No UPWARD or CYCLE line. `roadmaps resolve`:
no cross-roadmap citation and no Lean name found nowhere (the worker's three leads
`gammaRemainder.slit_logGamma`, `SieveTaper.sharp_additive_largeSieve`,
`SieveApplications.sharp_primitive_largeSieve` are supplier names, resolved below).

**Supplier citations resolved (every `*Needs:*` line and contract read).**
- ZerosOfLFunctions on main: Layer 0 (*entireCompletion*, `zetaEntireCompletion`, *IsFiniteOrder*,
  lines 346–388), 1.1 (*logGamma* on `S_δ`, 430–458), 1.4 (`logDeriv Gammaℝ s = digamma (s/2)/2 −
  (log π)/2`, 478–484), 1.6 (*continuedL*, 506–572), 3.4 (*poleClearedContinuedL*, 705–762), 4.3
  (Jensen, 837–856), 4.5 (`N(T)`, `N±(T)`, monotone and right-continuous, 872–897), 5.5–5.6
  (989–1015), 6.3 (*IsExceptionalZero*, 1075–1095), 6.4d (conductor dependence, inside 6.4), 6.5
  (1142), 7.1–7.4 (1182–1273; *S* `(T)` along `2 → 2 + iT → 1/2 + iT`), Layer 9 (*HasZerosInRects*,
  *AllOnCriticalLine*, the identification with `RiemannHypothesis`, 1586–1656). The counting
  convention `N(T) = zeroCount Λ (Icc 0 1 ×ℂ Ioc 0 T)` is its Conventions line 37.
- LFunctions on main: Layer 0 `AnalyticLFunctionData` (line 348) with its predicates (304–399),
  `riemannZetaData` (415), `dedekindZetaData` (Layer 3, 795), `dirichletData` (Layer 4, 861).
- ArithmeticDirichletSeries (Completed): **6.3 Truncated Perron**, **6.4 Arithmetic Perron**
  (lines 266–278), the endpoint value `π⁻¹ arctan(T/c)`.
- AnalyticNumberTheoryPartI (#1126, head `2b9b7af`): §0.23a (`gammaRemainder.slit_logGamma`, the
  Stieltjes identity, `|R^{(j)}(z)| ≤ j! sec^{j+2}(arg z/2)/(8|z|^{j+1})`), §0.34
  (`landau_siegel_exclusion`), §0.34a (`quadratic_character_kronecker`), §1.5 (`6π Σ n|a_n|²`),
  §1.5a (`3π/2`), §1.6 (`DirichletGRH`, `GRH`): all as cited.
- AsymptoticExpansions (#1857, head `dcc019c`, a new roadmap by another author, not yet in
  `ORDER.txt`): §13.1 `sum_Icc_eq_eulerMaclaurin` for `f ∈ C^{2m}[a, n]` with the periodic Bernoulli
  remainder, and Layer 5 "Laplace's method and saddle points" (line 561): as cited. The gate
  accepts it; the worker names it in the merge-order paragraph when it opens the pull request.
- ComputationalNumberTheory (#1408, head `ed098d6`): §4.22 `platt_bounded_height` with
  `H(q) = max(10⁸/q, 7.5·10⁷/q + 200)` (even `q`) and `max(10⁸/q, 3.75·10⁷/q + 200)` (odd `q`), the
  parity being the modulus's; §4.24 no real zeros for `q ≤ 400 000`: as cited.
- SieveMethodsAndPrimePatterns (#1495, head `39cf901`): §2.6 finite large-sieve duality, §2.9 the
  separated Hilbert inequality `π/δ`, `SieveTaper.sharp_additive_largeSieve` (`N − 1 + δ⁻¹`,
  `0 < δ ≤ 1/2`), `SieveApplications.sharp_primitive_largeSieve` (`H − 1 + Q²`): as cited.
- AnalyticNumberTheoryPartII (#1167): §4.3a Barnes full-sector remainder exists (line 217), cited
  only as not owned here.

**Library names at the pins.** Every Mathlib name of the supplier contracts and `*Needs:*` lines (about sixty)
opened (`riemannZeta_*`, `completedRiemannZeta₀`, `RiemannHypothesis` as "`ζ(s) = 0`, not a trivial
zero, `s ≠ 1` ⟹ `Re s = 1/2`" at `RiemannZeta.lean` 185–186, `DirichletCharacter.completedLFunction`
at `DirichletContinuation.lean` 231 as `ZMod.completedLFunction χ`, `gammaFactor` 206–207,
`rootNumber` 279–280, `IsPrimitive` `Basic.lean` 291, `Even`/`Odd` 537–540, `Complex.digamma_*`,
`Real.Gamma_mul_Gamma_add_half` `Beta.lean` 618, `Gammaℝ_mul_Gammaℝ_add_one`,
`HadamardThreeLines.norm_le_interpStrip_of_mem_verticalClosedStrip`,
`PhragmenLindelof.vertical_strip` 275, `MeromorphicOn.circleAverage_log_norm` `JensenFormula.lean`
307, `Complex.borelCaratheodory` 109, `Real.cot` `Complex/Trigonometric.lean` 89,
`sum_mul_sq_le_sq_mul_sq` `BigOperators/Ring/Finset.lean` 171, `sum_mul_eq_sub_sub_integral_mul`,
`Matrix.IsHermitian.eigenvalues` `Analysis/Matrix/Spectrum.lean` 67, `hurwitzZeta`, `mellin`,
`StieltjesFunction`, `PowerSeries.exp`, `bernoulliFun`, `hasSum_zeta_two`): all exist, one name
inexact (R05). All 9 Tau Ceti names opened: `trigonometricCombination` (`NonnegCombination.lean` 48,
`Σ (c i * z^{m i}).re`), `IsNonnegativeTrigonometricCombination` (58, on `‖z‖ = 1`),
`trigonometricCombination_nonneg_of_boundary` (66), `sum_re_neg_log_one_sub_nonneg` (83, for
`0 ≤ a < 1`, `‖z‖ ≤ 1`), `isNonnegativeTrigonometricCombination_threeFourOne`
(`ThreeFourOne.lean` 99), `truncatedPerronKernel` (`Perron/Basic.lean` 142),
`truncatedPerronKernel_one` (204, `= π⁻¹ arctan(T/c)`), `truncatedPerron_LSeries`
(`Formula.lean` 130), `norm_truncatedPerron_LSeries_sub_sum_le` (229, error
`Σ' ‖f n‖ (x/n)^c/(πT|log(x/n)|)`): the contract text matches. No `zeroCount` in Tau Ceti at the
pin: `N(T)` is ZerosOfLFunctions' carrier.

**Sources, the seeded sample (theorem number, page or line, hypotheses, statement).**

| Target | Source, locator | Result |
|---|---|---|
| 0.4 | `platt2017zeros` Thm 5.1 line 527 (`|ℑρ| ≤ 3.0610046·10¹⁰`, simple, `ℜρ = 1/2`); count `103 800 788 359` line 524; `platttrudgian2021` Thm 1 line 48 (`3 000 175 332 800`) | exact |
| 0.5 | `mossinghofftrudgian2015` Thm 2 lines 129–130: `P_n`, `a_k ≥ 0`, `a₁ > a₀` | exact |
| 1.1 | `brent2019` (5)–(8) lines 121–145, Olver's convention, `R_{k+1} = −∫ B_{2k}({u})/(2k(u+z)^{2k})` | exact |
| 1.2 | `alzer1997` Thm 8 lines 520–528: `F_n` with `2n` terms, `G_n` with `2n+1`, strictly completely monotone on `(0, ∞)` | exact |
| 1.3 | `alzer1997` Thm 9 lines 649–662: `S_k(2n; x) < (−1)^{k+1}ψ^{(k)}(x) < S_k(2n+1; x)`, `S_k(p; x)` as quoted | exact |
| 2.3 | `brent2019` Thm 1 lines 162–170 (`z ∈ H*`, (9)–(10)), Cor. 1 lines 200–202 (`√(πk)`, `1 + √(πk)`) | exact |
| 2.7 | `AnalyticNumberTheoryPartI` §0.23a derivative bound at `j = 1`: `|R'(z)| ≤ sec³(arg z/2)/(8|z|²)` | exact |
| 3.3 | `trudgian2014argument` lines 261–263: `|ζ(1+it)| ≤ log t`, `t ≥ 50`, as Backlund (53); the finer forms rest on `backlund1918` (uncertified) | partly, see Not verifiable |
| 4.1 | `ariasdereyna2024` Lemma 1 lines 90–95, Remark 2 lines 102–104, optimality lines 105–108; `hiarypatelyang2024` Lemma 2.3 lines 86–92 (`U, V > 1`, `(U+V)/π`), correction lines 29–44 | exact |
| 5.3 | `bmor2021` Thm 1.1 lines 61–63 (`q > 1`, `T ≥ 5/7`, `ℓ ≤ 1.567 ⟹ N = 0`, else the bound); `N(T, χ)` lines 56–58 counts `0 < β < 1`, `|γ| ≤ T`; Prop. 5.4 lines 473–475 (`1 < c < r`, `0 ≤ δ < 9/2`) | exact |
| 5.4 | `brentplatttrudgian2021` Lemma 1 lines 38–43 (Lehman, `A ϑ(2φ(T) log T + ∫φ/t)`), Thm 1 lines 54–67, Lemma 3 lines 186–197 with `A₀ = 2.067`, `A₁ = 0.059`, `A₂ = 1/150` (170–182), Cor. 1 lines 412–417 | exact; `lehman1966` itself uncertified |
| 6.5 | `montgomeryvaughan1974` Cor. 3 and `elliott1987` Lemma 1 uncertified; `preissmann1984` uncertified; the `c₀` consequence read at `ramare2016density` line 828–843 (Lemma 6.5) | locator only, see Not verifiable and R05 |
| 7.8 | `luzamanzhao2026` Thm 1.1 lines 39–42 (`q ≤ 10¹⁰`, quadratic `χ`, `σ ≥ 1 − 1/(5 log q)`), Cor. 1.2 line 44, Cor. 1.3 lines 96–99 | exact |
| 7.9 | `banks2026` Thm 1.1 lines 89–96 (`q₀ = 10¹⁰`, `δ₀ = 3.0·10⁻³`; `c = 3.0·10⁻³` for `q ≥ 3` via Lu–Zaman–Zhao, lines 105–107) | exact |
| 8.4 | `thornerzaman2024` Thm 1.2 lines 64–65, counts (1.1)–(1.2) lines 33–43 (`β > σ`, `|γ| ≤ Q`) | exact |

**Sources, the headline theorems and the targets the findings touch.** `hiarypatelyang2024` Thm 1.1
line 64–65 (`0.618`, `t ≥ 3`), Lemma 2.1 lines 72–80, Lemma 2.2 lines 81–85 (4.6, 4.7);
`hiary2016zeta` Thm 1.1 line 65 (`1.461` on `[0, 3]`); `patelyang2024` Thm 1.1 line 49–50, Lemmas
1.2, 2.1–2.3 (lines 112–122, 266–268, 475–477, 667–671); `yang2024` Thm 1.1 lines 53–54, Cor. 1.2
lines 88–89, Lemmas 2.1, 2.3, 2.6 (167–172, 324–334, 658–666); `patel2022` Thm 1.1 lines 61–66;
`hiaryleongyang2025` Thms 1–2, Prop. 3 (31–32, 41–43, 109–117); `bellottiwong2025` Thm 1.1 lines
31–38, Table 1 line 54 (Rosser `2.463`) and 58 (HSW `9.4925`), Thm 1.2 lines 63–74, `|S(T)| ≤ 2.5167`
lines 121–124; `mty2024` Thm 1.1 lines 53–54, Thm 1.3 lines 96–97, Ford's (1.8) lines 107–112,
`5.69693` line 1279; `ford2002zerofree` Thms 3–5 (96–106, 135–136), Thm 1 lines 32–34, footnote
137–143; `kadiri2005` Théorème 1.1 line 77–79 (preprint `5.70176`); `jangkwon2014` lines 10–15,
Prop. 11 line 603; `bellottitrudgianyang2026` Thm 1 line 67, Lemma 1 line 70; `kadiri2018` Thm 1.1
lines 16–18; `kadiri2002thesis` Théorème 11.1 lines 1976–1979 and 12.1 lines 2063–2068
(`R₁ = 6.4355`, `c = 1.7367`); `khale2024` Thm 1.1 lines 24–26; `bellotti2024` Thm 1.1 lines 60–63,
Thm 1.2 lines 81–82, Thm 1.4 line 183; `ford2002vinogradov` Thm 1 lines 28–31, Thm 3 lines 220–234;
`bordignon2019` Thm 1.3 lines 63–71; `bordignon2020` Thms 1.1–1.3 lines 56–66; `nemes2015` (1.3)
lines 52–65, Thm 1.1 lines 86–100, Thm 1.2 lines 105–108, Thm 1.3 lines 169–171, the real bound
lines 131–135, Lindelöf's bound lines 115–121, `γ₁ = −1/12` line 38; `diamondstraub2016` Thm 1.2
lines 90–94, Thm 3.1 lines 320–326; `mortici2011psi` Thm 1.1 lines 67–75, proof for all real
`x ∈ (0, ∞)` lines 144–178; `simonic2020` Thm 4 and Tables 1–3 lines 177–205, the mean square line
91; `kadiri2013density` Thm 1.1 lines 46–54 (its `N(σ, T)` counts `σ ≤ Re s ≤ 1`, lines 42–43),
Thm 1.2 and Cor. 1.3 lines 107–133, Thm 1.4 lines 137–162; `kadirilumleyng2018` Thm 1.1 lines
74–87, footnote 93–95; `bellotti2025density` Thm 1.1 lines 91–101; `donahelfgottzunigaalterman2022`
Thms 1.1–1.2 lines 78–120; `cullyhugilljohnston2023` Thm 2.1 lines 141–156;
`cullyhugilljohnston2025` lines 68–76, Cor. 3.2 lines 409–422, `w`, `θ'` lines 378–393;
`ramare2007eigen` Thm 7.1 lines 742–759; `ramare2016density` Thm 1.1 lines 83–92, Lemma 5.4 line
654; `thornerzaman2024` Lemma 2.3 lines 164–170, Thm 2.6 lines 219–226, Prop. 2.10 line 317, gamma
quotient lines 329–333; `fiori2025` Thm 1 lines 47–64, Remark 2 65–70, Remark 4 91–93, Lemma 5
110–114; `platt2016grh` Thm 7.1 lines 955–963; `hiary2016hybrid` Cor. 1.1 lines 57–59 with
`𝔮 = q|t|` (line 16) and Thm 1.2 lines 74–86; `mossinghoffstarichkovatrudgian2022` Thm 1.1 lines
44–49; `plattsaadeddin2013` Thm 1.1 lines 27–37; `saadeddin2016` Thm 1 lines 29–31 and Ramaré's
bounds lines 56–65; `ralaivaosaonarazakarinoro2026` Thm 1 lines 69–76 (`6.5/√d`, the arXiv text).
All agree with the README except the items of R04 and R05.

**Adversarial pass** (statement; instances; values on each side; result). `T` denotes the main term
`(T/2π) log(T/2πe)`.

| Statement | Instances | Computed | Result |
|---|---|---|---|
| 0.1 `a = b + O*(e)` | `π = 3 + O*(0.1416)`, `O*(0.1415)`; `π = 4 + O*(0)`; `1 = 1 + O*(−1)` | `π − 3 = 0.141593`: `≤ 0.1416` yes, `≤ 0.1415` no; `|π − 4| = 0.858 > 0`; `0 ≤ −1` false | checks hold; definition excludes the one-sided and negative-error models |
| 0.2 `RH(H)`, `GRH(q, H)` | `H < 0`; `q = 2`; `q = 1`; `H = 14` | vacuous; no primitive character mod 2 (conductor of the trivial character is 1); `L(s, 1) = ζ`; first ordinate `14.1347 > 14` | laws hold; `∀H` iff `RiemannHypothesis` matches `RiemannZeta.lean` 185–186 |
| 0.3 `H(q)` | `q = 3, 5, 399 999, 400 000` | `3.33·10⁷`, `2·10⁷`, `293.75`, `387.5` (`10⁸/q` alone: `250`) | matches Platt Thm 7.1; corollaries `10⁸/13 = 7.69·10⁶ ≥ 10⁴`, `10⁸/40 000 = 2500` |
| 0.4 ordering | the four heights | `3·10¹² > 3.061·10¹⁰ > 10⁹ > 5.45·10⁸`; main term at `3.0610046·10¹⁰`: `1.03800788359·10¹¹` against Platt's count `103 800 788 359` | antitone chain holds |
| 0.5 admissibility | `(3,4,1)`, `(1,2)`, `(1,1)`, `(a₀)` | `min_θ (3 + 4cos θ + cos 2θ) = 0` at `π`; `(1,2)(π) = −1`; `(1,1)`: `a₁ = a₀`; degree 0: `a₁ = 0 ≤ a₀` | each clause separates its wrong model; Tau Ceti carrier at `‖z‖ = 1` gives `Σ a_k cos kθ` |
| 1.1 `r_n` | `z = 1, 2`, `n = 1, 2` | `r₁(1) = 0.081061 ∈ (0, 1/12)`; `r₁(2) = 0.041341`, `r₂(2) = −0.000326`, `T₂(2) = −0.000347` | sign and size as 1.2 predicts; `B₁` never enters |
| 1.2 brackets | `x = 1, 1/5, 1/2` | `ψ(1) = −0.577216 ∈ (−0.583333, −0.5)`; `ψ(0.2) = −5.28904 ∈ (−6.19277, −4.10944)`; `x = 1/2`, `m = 1`: `0.144444 < 0.153426 < 0.169841` | holds; parity swap at `x = 1` fails (`0.083333 > 0.081061`) |
| 1.3 polygamma | `k = 1, 2`, `n = 0`, `x = 1` | `ψ'(1) = 1.644934 ∈ (1.5, 1.666667)`; `−ψ''(1) = 2.404114 ∈ (2, 2.5)` | holds; empty product `= 1` needed |
| 1.4 Ramanujan | `x = 1/2, 0.9, 1, 2, 10, 100` | `θ = 0.32076, 0.32036, 0.33593, 0.51176, 0.87001, 0.98632`; limit `30/π³ = 0.96755`; bounds at `1`: `0.999985 < 1 < 1.000283` | holds; `θ₁₀₀` misprinted (R05) |
| 1.5 Diamond–Straub | `N = 1, λ = 1/2, x = 1`; `N = 3, x = 2`; `N = 2, λ = 0` | `−0.577216 > −0.693147`; `ψ(2) = 0.422784 < 0.423984`; lower digamma bracket | holds; cases by `N mod 4` as Thm 3.1 |
| 1.6 Mortici | `x = 1, 20` | `−0.009968 ∈ (−0.075347, 0.059375)`; at `20`: `−9.44412·10⁻⁵`, `0.953` of the way, width `4.21·10⁻⁸` | holds for real `x > 0` (source proof lines 144–178) |
| 2.1 Stieltjes | `z = e^{3.1i}`; `θ = 0` | `|ξ| = 1.38889 > 1/12`, bound `sec²(1.55)/12 = 192.71` | secant factor needed; reduces to 1.2 at `θ = 0` |
| 2.2 Lindelöf | `θ = π/3` | `K = 1.154701 < sec²(π/6) = 1.333333` | holds |
| 2.3 Brent | `k = 1`; `Re z ≥ 0` | `√π Γ(3/2) = π/2`; `Γ(3/2)/Γ(1) = 0.886227 < 1`; `z = −1 + i`, `u = 1`: `|u + z|² = 1 < 3` | holds; hypothesis needed |
| 2.4 Binet | `z = i`; `z = −1/2 + 2i` | `Re ξ(i) = 0.000935 = −½ log(1 − e^{−2π})`; `Re ξ(−1/2 + 2i) = −0.010044 < 0` | positivity holds exactly on `Re z > 0` |
| 2.5 `|Γ|` two-sided | `σ = 1/2, t = 10` | `3.77753·10⁻⁷ = √(π/cosh 10π)`; lower `3.77596·10⁻⁷`, upper `3.84094·10⁻⁷` | holds; derivation `−t arg s − σ ∈ [−π|t|/2 − σ³/(3t²), −π|t|/2]` rechecked |
| 2.6 coefficients | `γ₃`; ratio at `x = 1, 10, 0.01`; `R₂(10)` | `−1/360 + 1/10368 = −139/51840`; `1.084438 < 1.086806`; `1.0083654 < 1.0083681 < e^{1/120} = 1.0083682`; `4.19548 < 44.06`; `R₂(10) = 3.20·10⁻⁵ < 3.55·10⁻⁴` | bounds hold; sign bullet false at `N = 1, 2` (R02) |
| 2.7 digamma sector | `z = 1`; `z = 10i` | `0.077216 ≤ 1/8`; `|ψ(10i) − Log(10i) + 1/(20i)| = 0.000834 ≤ 0.003536` | holds |
| 2.8 gamma quotient | `σ = −1/2, t = 0, a = 0`; `σ = −1/2, t = 100` | `Γ(3/4)/Γ(−1/4) = −1/4`, modulus `1/4 = |(1/2)/2|¹`; ratio `50.000625 = |(1 + s)/2|`, so exponent `1/2 + σ` fails | equality cases as stated; matches TZ lines 329–333 at `σ = 0` |
| 3.1 Fiori | `r = 1`, constant `G₁`; `G = 1 + s` on `[−1/2, 3/2]`; `G = 1/4 + s` | three-lines bound; `1 + σ > 0` increasing; `1/4 + s` vanishes at `−1/4` | hypotheses separate the models |
| 3.2 Rademacher | `s = 1/2, η = 1/2`; `s = 1.01` | `1.460355 ≤ 11.4877`; `ζ(1.01) = 100.578 > 1.9759` (pole factor needed) | holds; 10ζ is excluded by the majorant `≤ ζ(σ)^n` |
| 3.3 Backlund | `t = 50, 55`; `|ζ(1 + 50i)|` | `6.5810 < 6.7183`; `6.9020 > 6.8803`; `0.523263 ≤ 3.86402` | consistent |
| 3.4 right of one | `σ = 2`; `σ ∈ [1.025, 11]` | `ζ(2) = 1.644934 ≤ e^γ = 1.781072`; ratio `≤ 0.99994`; `−ζ'/ζ(2) = 0.569961 ≤ 0.875`; `−ζ'/ζ − 1/(σ−1) + 1/(2σ²) ≤ −0.0957` | holds |
| 4.1 Kusmin–Landau | `f = x/2`; `θ = 0.01` | sum `≤ 1 = cot(π/4)`; `cot(0.005π) = 63.657 > 32.831` | Cheng–Graham's form refuted |
| 4.2 A-process | `q = 1`; linear phase | `S² ≤ N²`; right side `≥ N²` | consistent |
| 4.3 second derivative | `f = x²/(2Y)`; threshold | `3(1 + 4√(Y/π)) + 1`; `A = 2.793684`, `λ < 0.2883` | consistent |
| 4.5a approximate FE | Kadiri's `C` at `c = 1`, `t₀ = 14.1347`; `s = 1/2 + 100i` | `C = 2.19457` (without the middle `1`: `1.71591`); `x = y = 3.98942`, `36.094 x^{−1/2} = 18.07`, `4.257 x^{−1/2} = 2.131` | holds; Simonič Tables 1–3 as quoted |
| 4.6 Riemann–Siegel | `t = 200` | `4(200/2π)^{1/4} − 2.08 = 7.4211`; `R(200) = 0.39594`; `|Σ_{n≤5}| = 2.79642`, `2·2.79642 + 0.39594 = 5.98878 ≥ |ζ(1/2 + 200i)| = 5.58978` (without the 2: `3.192`, false) | holds |
| 4.7 critical line | `t = 3`; `t = 0`; hybrid `q = 64, t = 200` | `0.618·3^{1/6} log 3 = 0.81537`; `|ζ(1/2)| = 1.460355 ≤ 1.461`; PY at 3: `79.92`; hybrid `8911` vs TZ `31.66`; TZ certificate `Σ = 0.74940`, `2Σ = 1.4988` | holds; certificate factor (R05) |
| 4.8 line one | `t = 3`; `t = 100`; crossings | `0.63797 ≤ 1.09861`; `1.63425 ≤ 4.23259`; `e^{3.86} = 47.5`, `e^{140.3} = 8.54·10⁶⁰` | holds |
| 4.9, 4.10 | `k = 4, t = 3`; `t = 10¹⁰`; `σ = 1/2` | `1.8371`; `616.74 > 572.22`; exponents `1.5733`, `1.5691` | holds |
| 5.1 Backlund lemma | constant `f`; `r ≤ a − σ₁` | bound `π > 0`; `log(r/(a − σ₁)) ≤ 0` | hypotheses needed, as stated |
| 5.2 `N(T)` | `T = 14, 100, 1000, 3.061·10¹⁰` | `M + 7/8 = 0.432, 29.002, 648.616, 103 800 788 358.63`; Rosser errors `2.379, 2.895, 3.391`; BW `8.921/4.482` at 100; crossing `log T = 447.981`: `54.7152276` vs `54.7152260` | contains `0, 29, 649`, Platt's count |
| 5.3 `N(T, χ)` | `q = 3, T = 5/7`; `χ₄, T = 10` | `ℓ = 0.2593 ≤ 1.567` (`2π e^{1.567} = 30.11`); `ℓ = 2.0333`, main `2.9588`, error `2.1816`, interval `[0.78, 5.14] ∋ 2` | holds; sign `−χ(−1)/4` |
| 5.4 zero sums | `φ = 1`; first zero; thresholds | `14.1347^{−2} = 0.005005 < 0.023105`; `2πe = 17.08`, `2π = 6.28 < 14.13` | consistent |
| 6.1 Perron | `F = 1`, `x = 1`; `θ'` | `π⁻¹ arctan(T/κ) → 1/2`, error `2`; `θ' = 0.291300 = (√(π²+4) − π)/2`, `1/(πθ') = 1.09272` | holds |
| 6.2 averaged | `λ = θ'/T` | `1.785/(2·0.8030²) = 1.3843` | consistent |
| 6.3 majorant, Logan, Gallagher | one frequency; signed `(1, −1)` | `2T ≤ 6T`, `2T ≥ T`, `(π²/2)T ≥ 2T`; `0 < 2T` | Logan needs nonnegativity |
| 6.4 Preissmann | `c₀`; `a = (1, 1)` | `c₀ = 1.315407`, `πc₀ = 4.13247 < 4.71239`; deviation `≤ 2/log 2 = 2.8854 ≤ 20.66` | holds; locator (R05) |
| 6.5 weighted sieve | `X = {0, 1/2}`, `N = 1` | weights `1/4`, `0.27542`; `2·0.27542 = 0.55084 ≤ 1` | consistent |
| 6.6 mean squares | `T = 4` | `107.20` (σ = 1/2), `43.54` (σ = 1) | as DHZ Thm 1.2 |
| 7.1 partial fractions | `s = 2`; `χ₄` | `−ζ'/ζ(2) = 0.569961`; constant `1 + 0.211392 − 0.572365 = 0.639027`; zero sum `0.069066 > 0`, first pair `0.014849`; `½ log(4/π) = 0.120782` | consistent |
| 7.2 Ford | `t = 3`; `1.88·10¹⁴`; `e^{64.1}` | `σ ≥ 0.892458`; `1 − σ`: `0.004238` vs `0.005473`; `0.0028064` vs `0.0028065`; `4/(2π)^{1/4} = 2.5265 < 6` | holds |
| 7.3 regions | `|t| = 2`, `3·10¹²`; chain | `σ ≥ 0.740461`, `0.993738`; `0.2595 < 1/2`; `9.6459 > 8.464 > 5.69693 > 5.68371 > 5.573412 > 5.558691 > 4.896` | holds; strictness (R04) |
| 7.4 Littlewood | `t = e^{200}`; `t = 3` | `0.0012477 > 0.0008995`; `log log 3 = 0.0940` | consistent |
| 7.5 Dirichlet regions | `q = 3`; `Q = 3`; `q = 10¹⁰` | `0.837457`; `0.103671`, `0.905635`; `0.995657` | consistent |
| 7.6 VK | `log t = 1000` | `9.125·10⁻⁵`, `9.505·10⁻⁵`, `9.723·10⁻⁵`; Khale `0.991109` | consistent |
| 7.7 real zeros | `q = 4·10⁵`; `d = 3·10⁸`; `q = 4.7·10⁶` | `0.007602`, `0.000950`; `0.000348`, `0.000375`; `0.000195` both | consistent |
| 7.8, 7.9 | `q = 10¹⁰`, `4`, `3` | `0.991314`; `0.855730`; gap `0.002731 < 0.182048`; at `10¹⁰`: `1.303·10⁻⁴ < 8.686·10⁻³` | consistent |
| 7.10 | `t = 3` | `1.56747 ≤ 5042.87` | consistent |
| 8.1, 8.3, 8.5 | `T = H₀`; `T = 10¹³` | `1.702·10¹⁰`, `1.353·10¹⁰ < 5.19·10¹⁰`; `1.914·10⁸`; `2.223·10¹¹ < 2.156·10¹³` | consistent |
| 8.2, 8.4 | `Q = 10, T = 2000, σ = 0.6`; `Q = 3, σ = 39/40` | `1.232·10¹²`; `log₁₀ = 99.706` | consistent |
| 9.1 | `q = 3, 5, 4, 8` | `0.604600 ≤ 1.257547`; `0.430409 ≤ 0.804719`; `0.785398 ≤ 1.047267`; `0.623225 ≤ 0.866434`, `1.110721 ≤ 1.220554` (margin `9.9%`); `5/2 − log 6 = 0.708241` | holds |
| 9.2 | `q = 3, 12, 17` | `0.604600 ≤ 1.204578`; `0.760346 ≤ 1.196598`; `1.016085 ≤ 1.396487` | holds |
| 9.3 | quartic mod 5; `q = 3` | `|L(1, χ)| = 0.888577 ≥ 0.222066 ≥ 0.215189`; `0.604600 ≥ 0.113780`; `1/9.690292 = 0.103196 < 0.109619` | holds |
| 3.2 example | `L(1/2, χ₄)` | `0.667691 ≤ 2.552826` | holds |

**Headline theorems** (from the Summary): (i) `ζ(σ + it) ≠ 0` for `|t| ≥ 2`,
`σ ≥ 1 − 1/(5.558691 log|t|)` from `RH(3·10¹²)` and the polynomial certificate (7.3, MTY instance);
(ii) `|N(T) − (T/2π) log(T/2πe)| ≤ 0.10076 log T + 0.24460 log log T + 8.08344` for `T ≥ e` (5.2);
(iii) `|ζ(1/2 + it)| ≤ 0.618 t^{1/6} log t` for `t ≥ 3` (4.7). At the pins (i) and (iii) are statable
on `riemannZeta` (with `TauCeti.IsNonnegativeTrigonometricCombination` and a bounded-height
predicate for (i)); (ii) is statable with a count of zeros of `completedRiemannZeta` written through
`MeromorphicOn.divisor`, since Tau Ceti has no `zeroCount` at the pin. The package stage must state
these three and name the certificates honestly as closed real inequalities.

**Shape.** `# Roadmap:` title and Summary; Scope and ownership with Owned / Consumed / Not owned;
Conventions; Exact supplier contracts per supplier; How to read the build; ten layers in build
order, each ending with `### Examples` and `### Dependencies`; Downstream consumers; References.
Every definition (0.1, 0.2, 0.5, 2.6, finite-order type in 3.2, 7.9) has API bullets and at least
three discriminating Checks; every theorem has its hypotheses in the sentence and a locator at the
claim; Unicode mathematics, no LaTeX delimiters, no pull-request numbers, no process words, no
machine paths (grep for `#NNNN`, `\(`, `$`, "removed", "so far", "checkpoint", "handoff", "round",
"current": none). `plan.json` has 70 targets, 131 tests, 7 suppliers, 4 consumers, no unverified
locator flag.

**Ownership against open work.** ExplicitPrimeCounting (#1945), ExplicitNumberFields (#1944) and
ExplicitMultiplicativeFunctions (#1946) each consume this roadmap through declared gaps
(`gap:rh-up-to-height`, `gap:grh-up-to-height`, `gap:classical-zero-free-constants`,
`gap:dirichlet-zero-free-constants`, `gap:real-zero-gap`, `gap:explicit-zero-count-error`,
`gap:explicit-zero-density`, `gap:lehman-weighted-zero-sum`, `gap:rademacher-general-convexity`,
`gap:complex-stirling-constants`, `gap:backlund-argument-lemma`, `gap:zeta-reciprocal-bounds`);
none of them restates Rademacher's bound, the Stirling constants, the zero counts, the densities or
the large sieves (ExplicitNumberFields 1.1 cites `gap:rademacher-general-convexity`; its negative
control `10ζ` is excluded here by the majorant `Σ|a_m| m^{−σ} ≤ ζ(σ)^n`). The only double
ownership is R03. Two consumer contracts ask for what this design does not state and are noted for
the package stage, not findings here: ExplicitNumberFields `gap:iterated-perron` (Landau's iterated
Perron identity) and ExplicitMultiplicativeFunctions `gap:zeta-reciprocal-bounds` (`|1/ζ(σ + it)|`
in the zero-free regions in Lee–Leong's form). ExplicitCharacterSumsAndSieves is a triage
(`target.md`) whose planned Layer 1 is the derivative-test toolkit; it is later in `ORDER.txt`, so
4.1–4.5 are owned here and it will consume them. `scratch/overlaps.md`: no other pull request
changes this roadmap, no dropped ids either way.

**Declared gap.** Declared where the intake reads it (same slug in `plan.json` and the README) and
minimal; not precise and unowned: R01.

## Not verifiable

- `backlund1918` (uncertified): the forms `log t − 0.048`, `(t²/(t² − 4))(t/2π)^{(1−σ)/2} log t` and
  `(t/2π)^{1/2−σ} log t` of 3.3 beyond the `log t` quoted by Trudgian; and Backlund's method for 5.1
  (checked instead against `titchmarsh1986` §9.4, uncertified, and `bmor2021` Prop. 5.4).
- `montgomeryvaughan1974` Cor. 3, `elliott1987` Lemma 1, `preissmann1984`, `logan1988` Thm 1,
  `gallagher1970` Lemma 1, `montgomery1994ten` Ch. 7 Thm 3 (6.3–6.5), `lehman1966` Lemma 1,
  `rosser1941` Thm 19, `delange1987`, `bastienrogalski2002`, `ramare2001` Cor. 1,
  `louboutin2015`, `mccurley1984` Thm 1, `davenport2000` §12, `dlmf` §5.9, `andrewsberndt2013`
  p. 118, `mortici2011ramanujan`, `rademacher1959` Lemmas 1–2 and Thms 3–4, `chenggraham2004`,
  `vandeluneterielewinter1986`, `platt2011thesis`, `rumely1993`, `ramare2016perron`,
  `helfgott2017mo`, `ramare2022excursions` §20.2, `titchmarsh1986`: all uncertified or waived
  (`gabcke1979`); cited by locator alone, as the manifest allows.
- `ralaivaosaonarazakarinoro2026`: the journal's constant `6.035` (the cached text is the arXiv
  version, Theorem 1 lines 69–76, with `6.5`, which implies the statement here).
- The constant `7/2` in the kernel bound quoted in 6.1 (not at `cullyhugilljohnston2023` line 163;
  possibly `ramare2016perron`, uncertified).
- The numerical certificates themselves (interval-arithmetic ranges, tables of parameters): by the
  Conventions they are hypotheses, not claims; their statements were checked to be closed real
  inequalities at literal parameters where the README displays them (4.7, 4.8, 5.2, 8.1, 8.3, 9.2).

## Source issues

- **Error** in `chenggraham2004` at Lemma 2 (uncertified; page not read): the source says the Kusmin–Landau
  bound holds with constant `1/(πθ) + 1`; it should be `cot(πθ/2) ≤ 2/(πθ)` (Landau's optimal form;
  recorded at `hiarypatelyang2024` lines 29–33 and `ariasdereyna2024` lines 105–108); affects a
  stated result and every bound built on its Lemma 3 (Hiary's `0.63`, Trudgian's `3/4 log t`).
- **Error** in `hasanalizadeshenwong2022` at Corollary 1.2, printed page 2 (line 61): the source says
  the constant term is `9.3675`; it should be `9.4925` as recorded in `bellottiwong2025` Table 1
  (line 58); affects a stated result.
- **Error** in `trudgian2014argument` at Lemma 3 (the logarithmic Phragmén–Lindelöf lemma): the
  source says `|log(Q + s)|` may be used as an interpolating factor with unequal exponents; it is not
  monotone in `σ`, as `fiori2025` lines 13–18 and 91–93 record; affects the proof (and the constants
  of Trudgian's and HSW's `N(T)` bounds).
- **Error** in `ramare2016density` at equation (1.1), printed page 326: the source says
  `N(σ, T) ≤ 4.9(3T)^{8(1−σ)/3}(log T)^{5−2σ} + 51.5 log² T`; `kadirilumleyng2018` lines 93–95 record
  that the proof is mistaken and quote a revised form with `965`; affects a stated result.
- **Error** in `ramare2016perron` at Theorem 3.1 and definition (3.1): `cullyhugilljohnston2025`
  lines 68–76 record a missing factor `k + 1` in the error term, a typo in (3.1) and
  measure-theoretic gaps; affects the proof and the stated error term.
- **Misprint** in `kadiri2005` at Théorème 1.1, printed page 2 (arXiv version, line 14 and 79): the
  source says `R₀ = 5.70176`; the published version has `5.69693` (quoted at `mty2024` line 1279,
  `jangkwon2014` line 13); affects a stated result (the preprint's constant is the weaker one).

<!-- tauceti-roadmap-review {"agent": "claude", "head": "c9c623aca48e92925800c82c2cd430eac664c965", "job": "REV-DESIGN-ExplicitZetaBounds", "model": "fable", "worker": "chris-x9"} -->
