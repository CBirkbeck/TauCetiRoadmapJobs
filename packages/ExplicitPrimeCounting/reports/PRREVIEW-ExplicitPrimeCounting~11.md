# Review of ExplicitPrimeCounting (pull request #1945 at 832c4bf)

**Verdict:** needs changes

Three findings: two P2 and one P3.

**P2:**

- **R01.** In §7.5, Dudek's and Cully-Hugill's items do not carry the explicit formula their thresholds rest on, nor its hypotheses. They also state for every real `x` a form the sources prove only at half odd integers.
- **R02.** In §7.5, three items have no stated input:
  - Cully-Hugill–Johnston's `n⁹⁰` rests on "the truncated explicit formula with error `O(x/T)` of that paper", which no target and no zero input states;
  - Lee's `n⁸⁶` files a Littlewood-type region under the Vinogradov–Korobov gap;
  - Visser's item names nothing.

**P3:**

- **R03.** `theta_ap.level_one` and `theta_ap.sum_classes` no longer exist in AnalyticNumberTheoryPartI at its head `979e68c`.

The checks themselves pass:

- The gate passes with every check `0`.
- The dependency check reports 0 problems.
- `Suggested.lean` elaborates with exactly 15 `sorry` warnings, one per theorem, and nothing else.
- No theorem closes in one tactic, and each of the 26 definitions is used by a headline.
- Every finite-range and gap proposition that a headline assumes holds numerically on the ranges I could compute (table below).
- Every previous finding is repaired or settled.

## Status of review 10's findings

- **R01 (Lee–Nosal without Bellotti–Wong's records): repaired.**
  - `Suggested.lean` lines 360–377: both headlines take `(hH : HiaryRecord) (hP : PatelRecord) (hY : YangRecord)`.
  - The three definitions (lines 240–266) are the definitions of ExplicitZetaBounds §0.4b at its head `11dd87b`, token for token, with `Complex.I` for `I`.
  - README §2.2, lines 1720–1723 and 1764–1768, now reads "which that section states given `HiaryRecord`, `PatelRecord` and `YangRecord`". §4.7 (lines 3370–3371) and §7.5 (lines 4268–4274) carry the records too.
- **R02 (density inputs of §§7.3 and 7.5): repaired.**
  - (a) *CullyHugillLeeDensity* is deleted. §7.3 (lines 4126–4130) cites ExplicitZetaBounds §8.3 "at the verification height `H₀ = 3 000 175 332 800` (…, given `RH(H₀)` and *HiaryRecord*…)". That section, at `11dd87b`, states the theorem "at every verification height".
  - (b) *CullyHugillDensity* (lines 4302–4310) states the paper's `17.418` and `5.272` (`cully-hugill-2021` lines 654–660). It is in Owned here (line 89) and in Layer 7's Dependencies (line 4345).
- **R03 (`li` owned twice): settled, not re-raised.**
  - The author's reply disputes it on the owner's standing decision, recorded on the pull request at `11fa2ff`: the analytic-number-theory cluster depends only on Mathlib, main and itself.
  - That reason holds under this brief's settlement rule. SpecialFunctionsEiLiErfIncompleteGamma (#1924) is not in the merge order, while this roadmap is (line 269), so the owner of record is this roadmap and the other should cite it.
- **R04 (API catalogue in `Suggested.lean`): repaired.**
  - The file has 15 theorems and 26 definitions.
  - Every definition occurs in a theorem statement; each was checked with a word-boundary search.
  - README lines 64–67 again say the file "states the headline theorems that are statable against the pinned libraries".
- **R05 (Costa Pereira): repaired.**
  - Contracts lines 135–140 and 337–342 cite `Chebyshev.psi_sub_theta_le_psi_add_psi_add_psi` and `Chebyshev.psi_sub_theta_ge_psi_add_psi_add_psi`. Both are at `Mathlib/NumberTheory/Chebyshev.lean:617` and `:623`, in `section CostaPereira` (line 541).
  - The routes at lines 800–801, 2638 and 2955–2956 use the Mathlib name.
  - `costa-pereira-1985` is no longer cited.
- **R06 (EffectiveClassNumbers in the order): resolved by the order mechanism.** The dependency check of EffectiveClassNumbers at `ba3ce95` prints: "moved: EffectiveClassNumbers moved in the merge order from #268 to #269, right after its last supplier ExplicitPrimeCounting; checked as moved (the worker moves it there when it submits)". Line 4351 ("later in the order of supply") is then correct.
- **R07 (manifest keys): repaired.**
  - `chebyshev-1852`, `mertens-1874` and `dudek-platt-2015` are in `packages/ExplicitPrimeCounting/sources.toml`.
  - All 81 keys the README cites are in the manifest.
- **R08 (`a₂(b)`): repaired.** Lines 2936–2943 now carry the printed values (`broadbent-kadiri-lumley-ng-wilk-2021` lines 509–512) and the printed `(50, 1.01718)`. All twelve were recomputed from (2.12) (table below).

## R01 (P2) — §7.5: Dudek's and Cully-Hugill's items omit the explicit formula their thresholds rest on

**Location.** `TauCetiRoadmap/ExplicitPrimeCounting/README.md`:

- Lines 4247–4248: "Under the region of `gap:vinogradov-korobov-constants`, `RH(3·10¹²)`, a density bound and the zero-count error".
- Lines 4252–4253 (Dudek): "for every real `x` with `x^{1/3} ≥ exp(exp(c_A))` the interval `(x, x + 3x^{2/3}]` contains a prime".
- Lines 4274–4275 (Cully-Hugill): "for every real `x ≥ exp(exp(33.990))` the interval `(x, x + 3x^{2/3}]` contains a prime".
- Lines 4285–4286, the route: "the smoothed explicit formula of §2.1 over `(x, x + h]`".

**Claim.**

- Both thresholds come from inequalities that need a truncated explicit formula with a numerical error, and the `ψ − θ` bounds:
  - Dudek's (24), from his Theorem 2.1 and (line 631) `0.9999√x < ψ(x) − θ(x) < 1.00007√x + 1.78x^{1/3}`;
  - Cully-Hugill's (21), from her Theorem 2, with the constant `K` of her Table 2, and her (8)–(9).
- Both papers prove these only for `x` half an odd integer. For real `x`, Cully-Hugill's text gives only the interval `(x, X + 3X^{2/3}]` with `X = ⌊x + 1/2⌋ + 1/2`.
- Neither item lists such a formula or the `ψ − θ` inputs among its hypotheses.
- This roadmap's real-`x` substitute is the truncated formula of §2.1, which assumes:
  - the `5.5666305` region,
  - Ford's region,
  - the Vinogradov–Korobov region,
  - *PsiThetaUpper* (lines 1625–1628).
- §3.4's Platt–Trudgian and Fiori–Kadiri–Swidinsky items carry exactly those hypotheses; §7.5 does not. Its Needs line (lines 4319–4323) also lacks `gap:classical-zero-free-constants`.
- The route names a *smoothed* formula, which is not the argument whose numbers the items quote.

**Witness.**

- `cully-hugill-2021`:
  - lines 187–197, "Theorem 2. For 50<T<x and half odd integers x ≥ x_K";
  - lines 662–665, "(21) holds for x ≥ exp(exp(33.990)) … despite having only considered half odd integer x … primes in (x, X + 3X^{2/3}] for X = [x + 0.5] + 0.5".
- `dudek-2016` line 115, Theorem 2.1, "x > e⁶⁰ be half an odd integer".

**Repair.**

1. In the opening sentence of §7.5 (lines 4247–4248), add these hypotheses for Dudek's and Cully-Hugill's items, as §3.4 does for Platt–Trudgian:
   - the truncated explicit formula of §2.1 under that section's hypotheses: the classical-shape region with `R₀ = 5.5666305` (`gap:classical-zero-free-constants`), Ford's region of ExplicitZetaBounds §7.2, and *PsiThetaUpper*, discharged in §3.7;
   - as pointwise inputs from §§3.3 and 3.7, the `ψ − θ` bounds the papers use: `dudek-2016` line 631, and `cully-hugill-2021` (8)–(9), lines 151–165.
2. Rewrite the routes (lines 4285–4289, and "the argument at lines 700–806" for Dudek) as follows: §2.1's truncated formula applied at `x` and at `x + h`, at its rows:
   - `(40, 1/2, 0.48, 6.431)` for cubes;
   - `(1000, 1/100, 1.80, 0.6651)` for `m = 155`.
   Their error, about `2M x log x/T`, is below the papers' `K G(x, h)/T`, about `2K x log x log log x/T`, at the papers' parameters, so (21) and (24) hold a fortiori for every real `x`.
3. Say that the real-`x` form is this route's, and that the sources state it at half odd integers.
4. Add `gap:classical-zero-free-constants` and §§3.3, 3.7 to the Needs line.

**Tested.**

- For cubes, `α = 1/3 + 10⁻¹⁰` satisfies the row's `T < (√x − 2)/2`. At `log x ≥ e^{33.99}`, `K log log x ≥ 2.4798 · 33.99 = 84.3`, far above `6.431`.
- For `m = 155`, `T = x^{0.0080146}` lies in `(max(51, log x), (x^{1/100} − 2)/2)` from `x = e^{4810}`, where `K log log x = 3.4747 · 8.48 = 29.5`, far above `0.6651`.
- If the author prefers the sources' form, the cube corollary survives with `X = n³ + 1/2`, since `X + 3X^{2/3} < (n + 1)³` (at `n = 1`: `5.43 < 8`).

## R02 (P2) — §7.5: the `n⁹⁰`, `n⁸⁶` and Visser items have no stated input

**Location.** README:

- Lines 4290–4292: "Cully-Hugill–Johnston (`cully-hugill-johnston-2025`, …, Theorem 1.4), under the same inputs with the truncated explicit formula with error `O(x/T)` of that paper".
- Lines 4294–4295: "from a minimal zero-free region of Littlewood type computed for that purpose, a parameter of `gap:vinogradov-korobov-constants`".
- Lines 4295–4297, Visser's item, which names no input.

**Claim.**

- **`n⁹⁰`.** The input of this item is a truncated explicit formula with a numerical error.
  - The Conventions (lines 299–304) require such an input to be "a `Prop` with its constants in the statement, stated beside the theorem that uses it".
  - None is stated. Line 2566 records only that the sequel has "an averaged form with error of order `x/T`".
  - So the item depends on an input that is neither a target, nor a zero input, nor a supplier section.
- **`n⁸⁶`.** The contract for `gap:vinogradov-korobov-constants` (line 552) asks only for the `57.54` region of Vinogradov–Korobov shape. A region of Littlewood type is ExplicitZetaBounds §7.4's shape, not that gap's.
- **Visser.** Visser's statement is a *(preprint)* target. The Conventions (lines 314–316) plan such a target "from the stated inputs", and it names none.

**Witness.**

- ExplicitZetaBounds at `11dd87b`, §7.4: "`ζ(σ + it) ≠ 0` for `|t| ≥ 3` and `σ > 1 − log log|t|/(21.233 log|t|)`".
- Same roadmap, §7.6: the shape `1/(c (log|t|)^{2/3}(log log|t|)^{1/3})`.

**Repair.**

1. State the averaged formula as a zero input beside the item: *CullyHugillJohnstonAveragedFormula*, by locator, with its constant and range of `x` and `T` (`cully-hugill-johnston-2025`, the theorem the paper's Theorem 1.4 uses). List it:
   - in Owned here (line 89, with the other zero inputs);
   - in the Needs line;
   - in Layer 7's Dependencies (line 4345).
2. For `lee-2026`, name the region the result uses, as a zero input or as ExplicitZetaBounds §7.4, in place of "a parameter of `gap:vinogradov-korobov-constants`".
3. For `visser-2025`, state its inputs.
4. A preprint item whose inputs cannot be stated is cut, the refereed `90` and `155` standing alone.

**Tested.** After the repair, every hypothesis of the four power statements is a named `Prop`, a supplier section or a declared gap.

## R03 (P3) — Two AnalyticNumberTheoryPartI Lean names no longer exist

**Location.** README lines 420–421, "`thetaAP q a x` with `theta_ap.level_one` and `theta_ap.sum_classes`", and line 1033, "`psiAP 1 0 x = ψ(x)` and `theta_ap.level_one`".

**Claim.**

- At AnalyticNumberTheoryPartI's head `979e68c`, neither name occurs, in the README or in `Suggested.lean`.
- §0.2 there states the two facts in prose only: "`θ(x;0,1)=Chebyshev.theta x`" and "summing over all residue classes modulo `q` gives `Chebyshev.theta x`".
- Its `Suggested.lean` declares only `def thetaAP` (line 172).
- The worker's citation scan also flags `theta_ap.sum_classes`.

**Witness.** A search of the head's README and `Suggested.lean` for `level_one` and `sum_classes` returns nothing.

**Repair.** At lines 420–421 and 1033, replace the two names by "the level-one identity `θ(x; 0, 1) = Chebyshev.theta x` and the sum over the classes, AnalyticNumberTheoryPartI §0.2".

**Tested.** That wording restates the two bullets of §0.2 at `979e68c`. No backticked name is left that the supplier does not declare.

## Verified sound

### Gate, dependency check, build, signatures and probe

- **Gate.** The full gate, rerun at `832c4bf`, gives every check `0`, "OK", exit 0. The worker's run also shows `build=0`. The diff outside the folder is empty.
- **Dependency check:** "depcheck: 235 roadmaps, 2424 edges, 0 problem(s)", with no UPWARD, CYCLE or moved line.
- **Merge order:** ZerosOfLFunctions 48, AnalyticNumberTheoryPartI 49, SieveMethodsAndPrimePatterns 56, ExplicitZetaBounds 267, **ExplicitPrimeCounting 269**.
- **Pins.** Mathlib `1b1ccf4b08` and Tau Ceti `2fd255d997` are main's.
- **Elaboration.** `lake env lean` on `Suggested.lean` gives 15 "declaration uses `sorry`" warnings and nothing else; exit 0.
- **Signatures.**
  - A scratch copy with `#check @name` for all 41 declarations elaborates with no error. So do 87 Mathlib and Tau Ceti names cited in the README.
  - The file has no `variable` block.
  - Each elaborated type matches its README statement. Nothing changed.
- **One-tactic probe.** Each of the 15 theorems was given `first | (simp; done) | rfl | (norm_num; done) | infer_instance | (positivity; done) | exact?`. None closes: 8 report "`exact?` could not close the goal", and 7 time out with no candidate.
- **Headline coverage.**
  - Every statable end theorem of lines 32–60 is in the file.
  - The docstring (lines 53–84) names those resting on table propositions, with what they lack: Rosser–Schoenfeld, Broadbent–Kadiri–Lumley–Ng–Wilk, Fiori–Kadiri–Swidinsky and Bennett–Martin–O'Bryant–Rechnitzer.

### Adversarial table

Values come from the cached source texts and from these computations:

- double-precision evaluation;
- prime sieves to `10⁸`, with step functions tested at both one-sided limits of every jump;
- the series of `li`;
- an Euler–Maclaurin `ζ` (`ζ(2) = π²/6` and `|ζ(1/2 + 14.134725i)| = 2·10⁻¹⁰` as controls);
- the first 30 zero ordinates.

| Statement | Instance | Values (each side) | Result | Change |
|---|---|---|---|---|
| `brun_titchmarsh` | `k = 1`, `x = 1.5`, `y = 2` | 2 primes in `(1.5, 3.5]` ≤ `4/log 2 = 5.771` | holds | none |
| `brun_titchmarsh`, `y = k` | `k = 1`, `(1.5, 2.5]` | junk right side `0` < count `1` | `y > k` needed | none |
| `MVDiagonalFiniteRange` | `u ∈ [6, 2·10⁶)` | least `S(u) − log u = 1.11408` (at `u → 10⁻`) ≥ `1.07`; `S(6) = 3.25 ≥ 2.8618` | holds | none |
| `BrunTitchmarshFiniteRange` | every `25 ≤ n ≤ 2·10⁴` | tightest `n = 25`, `Q = 3`: `13.5105 + 2 = 15.5105 ≤ 15.5334` | holds | none |
| §0.1 Büthe constant | primes `2, 3, 5, 7`; `u = 10⁹` | `0.65647 > 0.656`; `58/√10⁹ = 0.00183`; `1.1541 ≥ 1.15` | holds | none |
| §0.1 large `t` | `N = 2·10⁴ + 1` | `c(N) = 0.0760`; right `4038.98` − left `4018.57` = `20.41` | holds | none |
| §0.2 `C(2, 1)` | Corollaire 1, lines 74–86 | `−γ − log 2 = −1.27036`; hypotheses `q ≥ 1`, `a` prime to `q` | holds | none |
| §0.3a enclosure | series and `log log 2` | `0.8344610 ∈ [0.834438, 0.834462]`; `−0.36651292`; with *EulerGammaEnclosure* `[1.045141, 1.045166]` | holds | none |
| §0.3a `li(3/2) > 0` | value; bound | `0.125065`; `0.5 − 0.903 + 0.446 = 0.043 > 0.04` | holds | none |
| §0.3a zero of `Li x − x/log x` | `6.5797`, `6.5798`, `6.58` | `−7.97·10⁻⁶`, `2.02·10⁻⁵`, `7.65·10⁻⁵ > 7·10⁻⁵` | holds | none |
| §0.3a (`fiori-kadiri-swidinsky-2023` Lemma 20) | `[6.58, 10⁶]` | least `Li − x/log x − (x − 6.58)/log² x = 7.65·10⁻⁵` | holds | none |
| §0.3a symmetric integrand | `u ∈ (0, 1/2]` | maximum `1.02361` (at `1/2`) ≤ `16 log(4/3)/3 = 1.53430` | holds | none |
| §0.8 constants | `log 900`; `x = 11 723`; `x = 30` | `1 + 5L − 6.8024 ≤ 5L − 5`; `41.85 ≤ 43.38`; `15.63 < ψ(30) = 28.48` | holds | none |
| §0.8 against Chebyshev | `chebyshev-1852` §V | error terms `(5/2) log x + 1`, `A = 0.92129202` | as stated | none |
| `HiaryRecord` | `t ∈ [0, 3]`; `[3, 200]` | max `1.4603545` (`t = 0`) ≤ `1.461`; least margin `0.2465` | holds | none |
| `PatelRecord` | `t ∈ [3, 50]` | least `log t − |ζ(1 + it)| = 0.4606` | holds | none |
| `YangRecord` | `σ = 1/2, 5/7, 1` | least margins `0.00249` (`t = 0`: `0.73018` vs `0.73267`), `1.480`, `0.934` | holds | none |
| `ZetaZeroCountLowRange` | `T ∈ [2π, 100]` | least `0.28 log T − |N − M| = 0.191` (at `T = 14.1347`) | holds | none |
| `ZetaZeroCubeSum` | first 30 zeros, tail | `7.045·10⁻⁴ + ≈2·10⁻⁵ ≤ 8.35·10⁻⁴` | holds | none |
| *FioriKadiriSwidinskyZeroSums* | row `(100, 0.5922435112)` | first 29 zeros: `0.5922435` | as stated | none |
| `ButheVerified` (6 clauses) | every jump in `(1, 2·10⁷]` | no failure; printed `1423` fails as `x → 1427⁻` (`74.18 > 73.66`) | `1427` right | none |
| `Buthe2016Range` | `[59, 5000)` | `π*` clause `1.939 > 1.793` as `x → 97⁻`; `0.939 ≤ 1.793` at `97`; `1.810 ≤ 1.845` at `101⁻` | `97` right | none |
| `LeeNosalRange` | `101`; `2657` | `2.34 ≤ 5.69`; `89.86 ≤ 94.12`; no failure on either range | holds | none |
| `Schoenfeld1976Range` | 8 clauses | no failure up to `2·10⁷` (`θ`, `ψ`, `π`) and `10⁸` (interval) | holds | none |
| `schoenfeld_of_riemannHypothesis` | `3/2 < x < 2`; Büthe from `129.1` | `π = 0 < li(1.5) = 0.125`; `log² 129.1 = 23.62 = 8π · 0.94` | holds | none |
| `leeNosal_of_riemannHypothesis` | crossover; branch switch | `L(L − log L) = 23.6247` at `337.09`; both branches `15.5288` at `L = 55.46` | holds | none |
| `leeNosal_theta_…` | crossover; `hψθ` | `49.0087 = 8π · 1.95` at `3381.6`; `a₂(40) = 1.04320` | holds | none |
| Lee–Nosal Theorem 1.1 vs 1.2 | `log x = 30 369.58` | `0.119366 · 10.32122 + 0.000498 = 1.2325` | holds | none |
| `johnston_of_…` | weaker condition | `9.06/log log x < 4.92` iff `x > 547.7` | holds | none |
| `carneiro_milinovich_soundararajan` | `x = 4` | `[4, 6.44] ∋ 5`; `log x/√x ≤ 2/e = 0.736 < 0.88` | holds | none |
| `dusart_of_zeroFreeRegion` | `R = 5.69693` | `X ≥ 8.36` iff `log x ≥ 398.16`; `e^{4X}/√x ≤ 1` iff `X ≥ 8/R` (lines 471, 531) | holds | none |
| `axler_primeCounting_upper` | `[48, 10¹⁹]`; `10¹⁹`; beyond `10²⁶` | denominator `0.0536` and increasing; `bound − li = 6.82·10¹⁰ > 5.50·10⁹`; route margin about `881 x/log⁸ x` | holds | none |
| `AxlerPrimeCountingUpperRange` | every prime in `[48, 2·10⁷]` | no failure | holds | none |
| `vanlalngaia_sum_inv_prime` | transfer at `89 967 803`; range | `1/3 + 5/(4 · 18.3148) = 0.40158 ≤ 0.41`; `VanlalngaiaRange` no failure on `[2, 10⁸]` | holds | none |
| `dusart_nth_prime_lower` | `k = 2`; inputs | `−1.3467 < 3`; `RobinNthPrimeRange` and Robin's `θ(p_k)` bound hold for `p_k ≤ 10⁸`; (5.6b*) line 772, (5.8*) lines 1280–1283 | holds | none |
| *Robin1983Range* | `7022 ≤ k ≤ 39 016` | 18 failures (`7022`, `8581–8601`), none from `8602` | `8602` right | none |
| `lamzouri_li_soundararajan` | `q = 4`, `5` | `7.69 ≥ 5, 3`; `41.4 ≥ 11, 2, 3, 19` | holds | none |
| `schoenfeld_interval` | `x = e³⁰`; gap | `4.35·10⁸ > 1.96·10⁸`; `1834.6 < 10⁸/16597 = 6025` | holds | none |
| `trudgian_interval` | ranges | `TrudgianIntervalRange` and `TrudgianGapBound` no failure (to `10⁸`) | holds | none |
| `axler_interval` | ranges | `AxlerIntervalRange` and `AxlerGapBound` no failure (to `10⁸`) | holds | none |
| `PrimeGapLogSquareVerified` | `11 ≤ p ≤ 10⁸` | no failure | holds | none |
| §1.6 | enclosures; `E₁`; `B` | `1.5·10⁻¹²`, `4.8·10⁻¹¹ < 10⁻⁹`; `0.75537 ≤ 1.6164`; `−3.8509 > −3.86`, `9.1373 < 9.14` | holds | none |
| §3.1(a) | `T₀` | `M(9.6769) = 0`, `N = 0` | holds | none |
| §3.4 Trudgian's region | crossover heights | `3.0014·10¹⁰ < 3.061·10¹⁰`; `17 e^{2/6.455} = 23.17` | holds | none |
| §3.4 Trudgian Theorem 2 | constant | `1.151 · 0.24282 = 0.2795`, with `(log x)^{−3/4}` | holds | none |
| §3.4 Johnston–Yang vs Fiori–Kadiri–Swidinsky | `x = 2` | ratio `1.0301 ≥ 1.03`; `121.096/R^{3/2} = 9.2202` | holds | none |
| §3.2 `ψ − θ` | `x = 10⁸` | sum ratio `1.5338`; `1.001093 · 1.534 = 1.5357 ≤ 1.536` | holds | none |
| §3.7 `a₂(b)` | 12 points | formula `1.4262968` (20) … `1.0708607` (35) … `1 + 1.9352·10⁻⁸` (300); printed ≥ formula except `b = 35` | as stated | none |
| §4.2 corrected corollary | to `10⁸` | `1/(4 log x)` from `115`, `0.01` from `468 000`, `0.0067` from `1.52·10⁶`: no failure | holds | none |
| §4.3 Vanlalngaia Corollary 2 | `R = 5.5666305` | `814R = 4531.24`; `1.6R^{−1/4} = 1.0417`; `1/R = 0.17964` | holds | none |
| §4.6 Check | `r = 1`, `α = 1` | `(592 + 168)/384 = 1.979`; `r₀(1) = 1.1445` | holds | none |
| §5.1 Check | `n = 61` | `277.27 < 283 < 283.37`; `277.49`; `L = 5.820`; `285.70` | holds | none |
| §6.1 Checks | `q = 6` | `0.014264`, `0.013022`, `0.010829`; `52.85` | holds | none |
| §6.3 Checks | `q = 10⁴`; `4·10⁵ + 1` | `0.0096941` vs `0.0084356`; `3.801·10⁻⁴` vs `2.326·10⁻⁴`; meet at `939 839` | holds | none |
| §2.1 reciprocal sum | above `γ₅`; at `4πe` | `0.22153 > 0.21840`; `0.22153 ≤ 0.22813` | as stated | none |
| §2.6 zero count | `T = 10`, `9.6`, `22` | `0.6678 < 0.67`; `1.5279 ≥ 1.5083`; `3.5014 ≥ 3.3864` | holds | none |
| §3.5 Ramanujan | `e³⁹¹⁵` | `ε_M − ε′_m = 3914.50 < 3915` | holds | none |
| §7.5 Dudek's zero count | `T = 15` | Rosser `2.4003 < 5.9000` | holds | none |
| §7.5 real-`x` form | `cully-hugill-2021` lines 662–665 | proved at half odd `x`; `X + 3X^{2/3} < (n + 1)³` at `x = n³` | form overstated | R01 |
| §7.5 `n⁹⁰` input | lines 4290–4292, 2566 | no stated formula | unstated | R02 |

### Library declarations at the pins

- **Elaborated:** 87 Mathlib and Tau Ceti names cited in the README.
- **Found by search** (modules not imported):
  - `Nat.primeCounting_nth_prime` and `Nat.primesLE_eq_image_nth`: `TauCeti/NumberTheory/PrimeCounting.lean:90`, `:70`.
  - `NumberField.Chebotarev.primeCount_primesCongruent_isEquivalent_logIntegral`: `TauCeti/NumberTheory/Chebotarev/PrimeCounting/PrimesCongruent.lean:50`.
  - `TauCeti.Contour.Cycle.classicalResidueTheorem_nullHomologous`: `TauCeti/Analysis/Contour/Cycle/Residue.lean:138`.
- **Read in full:**
  - `Mathlib/NumberTheory/Chebyshev.lean` lines 600–640 and 700–712;
  - `TauCeti/NumberTheory/LFunctions/Mertens.lean` lines 545–569. `mertensConstant K` is the `limUnder` of the sum of `1/N𝔭` minus `log log x`, so it is `B` at `ℚ`.

### Cross-roadmap citations resolved

- **ExplicitZetaBounds (`11dd87b`):**
  - `Suggested.lean` lines 103, 167–192 (the copies);
  - §§0.2–0.4b, 5.2, 5.4, 6.1, 6.3a, 6.5, 7.2–7.6, 7.9, 8.1, 8.3 ("at every verification height") and 8.3a;
  - Not owned here, which leaves Liu–Wang, Johnston–Yang's densities and `0.28 log T` to this roadmap, and owns Ramaré–Rumely's region in both forms.
- **AnalyticNumberTheoryPartI (`979e68c`):** §§0.2 (R03), 0.3, 0.5, 0.7, 0.8, 0.11d, 0.16, 0.19–0.21, 0.25, 0.26a, 0.30, 0.32, 0.34, 1.5a, 1.6 and 1.9, with the names `SchoenfeldFiniteRangeInput`, `RosserSchoenfeldFiniteRangeInput`, `ModEightFiniteInput`, `PrimeProductFiniteInput`, `BMORFiniteInput`, `BMORClassNumberInput`, `quadratic_real_zero_le_of_bmor`, `log_floor_factorial_eq_sum_vonMangoldt`, `mertens_vonMangoldt_eulerGamma`, `siegel_walfisz`, `psi_sub_self_isBigO_of_riemannHypothesis`, `psiAP_isBigO_of_dirichletGRH`.
- **SieveMethodsAndPrimePatterns (`f07c3fe`):** §2.9; §3.1 `SieveDistribution.primeCountAP`, argument order `(x, q, a)`, as the §0.6 Checks use it.
- **On main:**
  - ZerosOfLFunctions §§4.1, 4.5, 5.6, 6.2–6.4, 7.4, 8.3–8.7, 8.9 and Layer 9 (*AllOnCriticalLine*, *GRH*);
  - LFunctions Layer 4 (`dirichletData`);
  - ClassFieldTheory Layer 13 (line 1839);
  - ClassicalArithmeticCompletion §6.34.
- **Consumers.** ExplicitNumberFields, ExplicitMultiplicativeFunctions and ExplicitCharacterSumsAndSieves cite sections that exist here; the last cites §0.1 for `brun_titchmarsh` rather than restating it.
- **Not findings here:**
  - EffectiveClassNumbers (`ba3ce95`) cites the Lean names `primeCount_rat_eq_primeCounting` and `nth_prime_isEquivalent`, which this file does not declare (line 4353 says so).
  - ComputationalNumberTheory (`12bae67`, earlier in the order) cites the deleted §6.2a.
  - Both repairs belong to those roadmaps.

### Ownership

- **Searched** (main and the open heads) for Brun–Titchmarsh, Lee–Nosal, Vanlalngaia, Montgomery–Vaughan, `1.03883`, Panaitopol, Cipolla, Ramanujan's inequality, Kadiri–Lumley, Cully-Hugill, Lamzouri and Bennett–Martin. No second owner of an object owned here was found.
- **Gaps:**
  - The plan's slugs match the contracts at lines 542–558; each names an existing ExplicitZetaBounds section.
  - `explicit-brun-titchmarsh` is §0.1's own theorem, and its two finite-range propositions hold numerically.

### Sampled locators read against the text

- **§0.1:**
  - `tmeemt-art14` lines 82–87;
  - `buthe-2014` lines 65–66, 141–146, 462–469;
  - `montgomery-1978` lines 377–388, 482–497, 517–528.
- **§0.2:** `ramare-2002` lines 74–86.
- **§0.3a:** `fiori-kadiri-swidinsky-2023` line 630.
- **§1.6:** `ramare-rumely-1996` line 294; `rosser-schoenfeld-1962` line 81.
- **§3.1:**
  - `dusart-2016` lines 74–90, 104–151, 188–194, 451–471, 528–533, 576–580;
  - `dusart-1999-mc` lines 61–108;
  - `rosser-schoenfeld-1975` lines 530–548, 683–687, 713–720;
  - `faber-kadiri-2018-corrigendum` lines 20–45, 85–100;
  - `platt-trudgian-2021-error` lines 58–141;
  - `johnston-yang-2023` lines 160–217;
  - `broadbent-kadiri-lumley-ng-wilk-2021` lines 500–512, 1199–1212, 1376–1392;
  - `dusart-1998-thesis` lines 843–856.
- **§3.4:**
  - `faber-kadiri-2015` lines 38–43;
  - `trudgian-2016` lines 45–142, 225–240;
  - `johnston-yang-2023` lines 55–84, 270–282;
  - `fiori-kadiri-swidinsky-2023` lines 145–176.
- **§4.2:** `ramare-2013` lines 78–108.
- **§4.3:** `vanlalngaia-2017` lines 24–116 (digits as letters).
- **§4.5:** `trevino-2012` lines 455–520.
- **§4.6:** `deleglise-nicolas-2019-landau` lines 610–625, 700–770.
- **§5.1:** `dusart-1999-mc` lines 116–126.
- **§6.2:** `ramare-rumely-1996` lines 56–92.
- **§7.1:** `schoenfeld-1976` lines 644–720.
- **§7.2:** `dudek-2016` lines 810–818.
- **§7.5:**
  - `dudek-2016` lines 58–66, 112–126, 686–760, 798–806;
  - `cully-hugill-2021` lines 24–32, 100–200, 530–570, 610–700.
- **Also:**
  - `schoenfeld-1976` lines 14–32, 94–104, 725–780, 1276–1295;
  - `buthe-2018` lines 70–90;
  - `buthe-2016` lines 686–706, 750–756;
  - `chebyshev-1852` lines 286–372.
- **Flags:** the README flags no locator as unverified.

## Not verifiable

These are recorded as uncertified or waived in the manifest and are cited by locator only:

- `montgomery-vaughan-1973`, read through `tmeemt-art14` lines 82–87;
- `lee-nosal-2026`;
- `fiori-kadiri-swidinsky-2023-psi`;
- `rosser-1938`, `rosser-1941` (the latter through `dusart-2016` line 460);
- `platt-2016`, `dusart-2018`, `chirre-helfgott-2025`;
- `axler-2018`, `axler-2024`, `axler-2019-nth-prime`;
- `lamzouri-li-soundararajan-2015`;
- `ramare-2023-corrigendum` (whose corrected thresholds I tested numerically);
- `ramare-saouter-2003`, through `dudek-2016` line 815 and `dudek-2015` lines 47–48;
- `cully-hugill-lee-2024`, `cully-hugill-johnston-2025`;
- `lee-2026`, `visser-2025`;
- `brent-platt-trudgian-2021`, `bhattacharjee-2024`, `johnston-2022`;
- `broadbent-fiori-kadiri-ng-wilk-2026`, `fiori-jaskari-2026`, `zhang-xiong-2025`;
- `lu-zaman-zhao-2026`, `thorner-zaman-2024`, `banks-2026`, `openai-2026-siegel`;
- `cipolla-1902` (waived);
- `mertens-1874`: fetched but image-only, already listed in the worker's needs file. §4.1's route does not depend on reading it.

## Source issues

- **Error** in buthe-2016 at Theorem 2, (7.1), p. 13 (lines 699–701): the source says `|π*(x) − li(x)| ≤ √x log x/(8π)` for every `x > 59`; it should start at `x = 97`, since as `x → 97⁻` the left side is `1.939` against `1.793`; affects a stated result.
- **Error** in ramare-2013 at the Corollary to Theorem 1.1 (line 108): the source says the error is at most `0.0067/log x` from `x = 23`; it fails at `x = 23` (`0.0529` against `0.0021`) and up to `1 514 837`, so it should start at `1.52·10⁶`; affects a stated result; corrected in print at ramare-2023-corrigendum, the corollary to Theorem 1.1.
- **Gap** in vanlalngaia-2017 at Corollary 2 and its proof (lines 59–65, 111–114): the source derives the range `log x ≥ 4635` from Corollary 3 at `R = 5.69693`, valid only from `814R = 4637.30`; it should start at `4637.30`, or take a region with `R ≤ 5.6941`; affects a stated result.
- **Misprint** in johnston-yang-2023 at Theorem 1.4, (1.9) (line 80): the source says `|π(x) − x|` on the left; it should read `|π(x) − li(x)|`; affects nothing.
- **Misprint** in fiori-kadiri-swidinsky-2023 at Lemma 20 (line 630): the source says `Li(x) − x/log x > (x − 6.58)/log² x > 0` for `x ≥ 6.58`; at `x = 6.58` the middle term is `0`, so it should read `≥ 0` or `x > 6.58`; affects nothing.
- **Misprint** in broadbent-kadiri-lumley-ng-wilk-2021 at the proof of Corollary 5.1 (line 503): the source says `a₂ = (1 + 1.15177·10⁻⁸) max(…)`; it should read `1 + 1.93378·10⁻⁸`, as (2.12) at line 500; affects nothing.
- **Misprint** in broadbent-kadiri-lumley-ng-wilk-2021 at the table after Corollary 5.1 (line 510): the source prints `a₂(35) = 1.07086`, below the value `1.0708607` of its (2.12); it should be `1.07087`; affects nothing.
- **Misprint** in dusart-2016 at Theorem 1.1 (line 79): the source requires `X ≥ max(8.36, 8R)` while its proof uses `X ≥ 8/R` (lines 471, 531); it should read `max(8.36, 8/R)`; affects a stated result (Corollary 1.2 from `log x = 400`).
- **Error** in buthe-2018 at Theorem 2, (1.6) (line 75): the source states `x − θ(x) ≤ 1.95√x` from `1423`; as `x → 1427⁻` the left side is `74.18` against `73.66`, so it should start at `1427`; affects a stated result.
- **Error** in robin-1983 at Théorème 8, (23) (lines 84, 378): the source states `p_k ≤ k(log k + log log k − 0.9385)` from `k = 7022`; it fails at `k = 7022` and `8581–8601`, so it should start at `k = 8602`; affects a stated result.
- **Error** in trudgian-2016 at Corollary 2 (line 229): the source states the interval from `2 898 239`; at `x = 2 898 240` the interval ends at `2 898 357.93`, before the next prime `2 898 359`, so it should start at `2 898 242`; affects a stated result.
