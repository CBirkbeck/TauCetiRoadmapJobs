# Review of ExplicitPrimeCounting (pull request #1945 at 1ab1590)

**Verdict:** needs changes

There are seven findings: five P2 and two P3. The gate passes, the dependency check reports 0 problems, and `Suggested.lean` elaborates with `sorry` as its only warning. All eight findings of the previous review are repaired in this README. The move of the diagonal bound (previous R01) is not yet mirrored by its consumer; see R05.

## R01 (P2) — Five gap items are handed back by ExplicitZetaBounds

**Location.** `TauCetiRoadmap/ExplicitPrimeCounting/README.md`:

- lines 411, 415, 419 and 423, the contracts `gap:dirichlet-zero-free-constants`, `gap:dirichlet-four-zero-region`, `gap:explicit-zero-count-error` and `gap:explicit-zero-density`;
- their uses at lines 1376 (§2.2), 1940 (§3.4), 2969–2972 (§6.1), 3219–3245 (§6.6) and 3594–3596 (§7.5: "With Kadiri–Lumley–Ng's corrected form (`A = 965` …) the hypothesis holds").

**Claim.** These contracts ask ExplicitZetaBounds for five items. At its head (`3e44c3f`), ExplicitZetaBounds lists each item under "Not owned here" and assigns it back to this roadmap ("which states each with the theorem that needs it"). Each item is therefore handed in both directions and has no owner:

1. Ramaré–Rumely's region with the constant `C₁(χ, H)`, used in §6.1;
2. Liu–Wang's bound of four zeros with `σ ≥ 1 − 1/(3.82 log x)`, used in §6.6;
3. Ramaré's density for `ζ` and its revised form with `A = 965`, `51.5`, used in §7.5. The revision "rests on an unpublished proof";
4. Johnston–Yang's recomputed Table 3 constants, used in §3.4;
5. the `min(0.28 log T, …)` zero count, used in §2.2 (see R02), and Trudgian's bound in the normalization with `7/8`.

**Witness.** `TauCetiRoadmap/ExplicitZetaBounds/README.md` lines 141–158 at `3e44c3f`: "the zero-free inputs … that only `ExplicitPrimeCounting` uses, which states each with the theorem that needs it". Lines 150–158 continue with the density items, the `min` form and Trudgian's form.

**Repair.** Give each item one owner, and make the two READMEs agree.

- *Owner ExplicitZetaBounds.* The rule for a two-way hand-off assigns the item to the earlier roadmap. ExplicitZetaBounds already holds the contracts, so it deletes the bullets at its lines 141–158 and states the items as targets. This README then keeps its contracts, corrected as in R02.
- *Owner this roadmap.* If ExplicitZetaBounds keeps those bullets, state each item here as a named hypothesis beside the theorem that uses it, as §1.7 does for *BanksGap*. Then narrow the four contracts to what ExplicitZetaBounds supplies: §5.2 (Rosser, Bellotti–Wong), §7.3, §7.5 (`6.4355`), §8.1 and §8.3.
- In the second case, §7.5's "the hypothesis holds" becomes conditional on the named density hypothesis.

Tested against both heads: after either change, no item of the list appears in both a contract here and the "Not owned here" list there.

## R02 (P2) — `gap:explicit-zero-count-error` asks for a misprinted constant

**Location.** README line 419: "`|N(T) − M(T)| ≤ min(0.28 log T, 0.1038 log T + 0.2573 log log T + 9.3675)` for `T ≥ 2π` (the form of `lee-nosal-2026`, display (8))". The §2.2 route uses this form at line 1376.

**Claim.** The constant `9.3675` is a typo in Hasanalizade–Shen–Wong 2022; the published value is `9.4925`. The contract therefore asks for a statement stronger than any published bound. That bound is also stated in the normalization without `7/8`, while `M(T)` here includes `7/8`.

**Witness.** Bellotti–Wong, arXiv 2412.15470v2, p. 2, footnote 1 ("The value 9.3675 is now substituted with 9.4925"). Their display (1.1) and Table 1 measure `N(T)` against `(T/2π) log(T/2πe)`, without `7/8`. This is ExplicitZetaBounds' source `bellottiwong2025`, line 82.

**Repair.**

- Replace the second branch by Bellotti–Wong's `0.10076 log T + 0.24460 log log T + 8.08344` (for `T ≥ e`, without `7/8`; ExplicitZetaBounds §5.2), plus `7/8` for `M(T)`.
- Alternatively, use `9.4925 + 7/8`, unless display (8) of `lee-nosal-2026` is checked to use the other normalization.
- Re-check the large-`T` step of §2.2. The second branch beats `0.28 log T` from `log T = 55.46` (Bellotti–Wong + `7/8`) and from `64.93` (`9.4925 + 7/8`), against `59.12` with the misprint (computed). Below those heights, `0.28 log T` is the bound in use and is unaffected.

## R03 (P2) — §3.2's route for Schoenfeld's `ψ − θ` bounds does not prove them

**Location.** README lines 1785–1787: "`ψ(x) − θ(x) < 1.001093 √x + 3 x^{1/3}` for `x > 0`; `0.998697 √x < ψ(x) − θ(x)` for `x > 121` … The last two follow from the first two by §0.3 for `x ≥ 1 155 901²` and from `Schoenfeld1976Range` below."

**Claim.** The route fails in two ways.

- **§0.3 does not give the upper bound.** The transfer of §0.3 (lines 656–658) gives `(1 + ε)√x + c (log x/log 2 − 2) x^{1/3}`, with `ε = 0.001303` and `c = 1.001093`. At `x = 1 155 901²` the second coefficient is `38.3`, not `3`, and the first is `1.001303`, not `1.001093`.
- **A range is uncovered.** `Schoenfeld1976Range` stops at `10⁸` (line 944; Lean line 184). Neither bound has a route on `(10⁸, 1 155 901²)`.

**Witness.** The source derives (5.3*) from Rosser–Schoenfeld's Theorem 14, (3.38): `ψ(x) − θ(x) < θ(√x) + 3x^{1/3}` for `x > 0` (`rosser-schoenfeld-1962` lines 346–357; `rosser-schoenfeld-1975` lines 770–771, 782). No section here states that inequality.

**Repair.** For `x > 10⁸`:

- **(5.3*).** Write `ψ(x) − θ(x) = θ(√x) + ∑_{k≥3} θ(x^{1/k})` and apply (5.1*) termwise. Since `∑_{k≥3, x^{1/k}≥2} x^{1/k} ≤ 1.534 x^{1/3}` for every `x ≥ 10⁸`, this gives `< 1.001093√x + 1.536 x^{1/3}`.
- **(5.4*) on `(10⁸, 1 155 901²]`.** Use `ψ(x) − θ(x) ≥ θ(√x) + θ(x^{1/3})`, with `θ(y) ≥ y − 1.95√y` (`ButheVerified`, `y ≥ 1427`) and `θ(y) > y(1 − 1/log y)` (`y ≥ 41`, the Corollary of Theorem 4 in the same section). The sum is at least `1.008 · 0.998697 √x` on that range.
- **(5.4*) beyond.** (5.2*) applies at `√x`.
- Add `ButheVerified` to the stated inputs of the two bounds, and record the termwise sum as the source's Theorem 14.

Tested: the maximum of the termwise ratio over `[10⁸, 10⁶⁰]` is `1.5339`. The minimum of the actual `(θ(√x) + θ(x^{1/3}))/√x` on `(10⁸, 1 155 901²]` is `1.00793`, at `x = 1.19·10¹²`.

## R04 (P2) — §4.6's `π₁` instances have no finite-range input below `1.9·10¹⁰`

**Location.**

- README lines 2610–2618: the instances hold "under the Dusart 2018 row of §3.3 (`α = 1` …), under the `θ`-bound … `0.15` … for the `π₁` bounds …, and under the finite-range proposition *DelegliseNicolasRange*".
- Line 2619: the first instance holds "for `x ≥ 110 117 910`".
- Lines 1023–1027: *DelegliseNicolasRange* lists (2.21)–(2.27) only.

**Claim.** Proposition 2.5 gives the `π₁` bounds (2.19) and (2.20) only from `x₁ = 19 035 709 163`. No hypothesis covers `[110 117 910, x₁)` for (2.19), or `[905 238 547, x₁)` for (2.20). The values `π₁(x₁)` and `θ(x₁)`, which enter `C₀` at `α = 0.15`, are recorded nowhere. At `α = 1` the fourth coefficient for `r = 1` is `(592 + 168)/384 = 1.979`, not `107/160 = 0.669`, so the `α = 1` row cannot fill the gap.

**Witness.** `deleglise-nicolas-2019-landau`:

- line 389: `α = 0.15` only from `19 035 709 163`;
- lines 620–627: the coefficient `(51r⁴ + … + 23)α + 168`;
- line 710: Corollary 2.6 is proved by reference to an earlier computation.

**Repair.** Derive (2.20) from Axler's Theorem 1.2 of the same section, which is the same inequality with the same threshold, under the `θ`-bounds of §3.7 and *Axler2019Range*. Derive (2.19) from Axler's Theorem 1.1 (`5.3/8 < 107/160`) for `x ≥ 110 118 925`, and add to *DelegliseNicolasRange* the clause (2.19) on `[110 117 910, 110 118 925]`.

## R05 (P2) — The diagonal bound has two owners

**Location.**

- README lines 71–78: "They are stated here because ExplicitCharacterSumsAndSieves … is later in the order of supply and consumes the inequality and the diagonal bound from here".
- Lines 3659–3662, the Downstream consumers.

**Claim.** ExplicitCharacterSumsAndSieves at its head (`3fa29b0`) still owns three objects that §0.1 owns:

- Büthe's asymptotic for `S`;
- the bound `S(z) ≥ log z + 1.07` for `z ≥ 6`;
- `MVDiagonalFiniteRange`, which it also declares in its `Suggested.lean`.

That roadmap cites §0.1 only for `brun_titchmarsh`.

**Witness.** `TauCetiRoadmap/ExplicitCharacterSumsAndSieves/README.md` line 1361 ("*The Montgomery–Vaughan diagonal bound.* Under `MVDiagonalFiniteRange` (§6.2), for real `z ≥ 6`, `S(z) ≥ log z + 1.07`") and line 1670 (§6.2). Its `Suggested.lean` line 553: `def MVDiagonalFiniteRange`.

**Repair.**

- Keep §0.1. This roadmap is earlier (271) than ExplicitCharacterSumsAndSieves (272), so it is the owner.
- In ExplicitCharacterSumsAndSieves, replace the Büthe-asymptotic and `z ≥ 6` parts of its §5.1, and its §6.2, by citations of ExplicitPrimeCounting §0.1. Its `z ≥ 3` form with `0.89` can stay as its own.
- Until that lands, lines 75–77 and 3659–3662 here describe a consumption that does not exist.

## R06 (P3) — `ε₀(e¹⁰⁰)` is `0.02775`, not `0.02777`

**Location.** README lines 758–759: "`X = 3.2197`, `√(8/(17π)) = 0.38703`, `X^{1/2} = 1.7944`, `e^{−X} = 0.03999`, so `ε₀(e¹⁰⁰) = 0.02777`". The same value is repeated at lines 1820 and 2305.

**Claim.** The factor `e^{−X}` is misevaluated.

**Witness.** `X = √(100/9.645908801) = 3.219797`, `e^{−X} = 0.039963`, and `0.387031 · 1.794380 · 0.039963 = 0.027754`.

**Repair.** Read `e^{−X} = 0.03996` and `ε₀(e¹⁰⁰) = 0.02775` at all three places. Recomputed as above.

## R07 (P3) — A Check calls Ramaré's second tabulation clause independent of the first

**Location.** README lines 3152–3154: "so the second clause of *Ramare2002Tabulation* on `[182, 10⁵]` is a computation of its own, not a consequence of the first". The proposition is at lines 1167–1171.

**Claim.** With the tabulated `v♯(q)`, rather than the bound `v♯(q) ≤ 1`, the first clause implies the second on `[261, 10⁵]`. Only `[182, 261)` is a separate computation.

**Witness.** `ramare-2002` lines 1229–1232: by Théorème 2 "it suffices to find `y` with `v♯(q) y^{−1/2} ≤ ε♯(q)`, and `y = 261` works".

**Repair.**

- Restrict the second clause of *Ramare2002Tabulation* to `182 ≤ L ≤ 261`.
- Derive `[261, 10⁵]` from the first clause at the tabulated `v♯(q)`, citing line 1231.
- Reword the Check accordingly.

## Verified sound

### Repairs of the previous review

The table records what this head does with each finding of the previous review.

| Finding | Status | Where in this head |
|---|---|---|
| R01: diagonal-bound lemma owned only downstream | Repaired here | §0.1 states `MVDiagonalFiniteRange`, Büthe's Lemma 4.5 and `BrunTitchmarshFiniteRange` (lines 460–481); the *Needs* line carries them (545–546); `t₀ = 2·10⁴` is named; the Lean takes `hD`, `hE`. The consumer side is R05 |
| R02: `RH(H)`, GRH passage law and real-zero gap had two owners | Repaired | §§1.1, 1.2 and 1.7 cite ExplicitZetaBounds §§0.2–0.4 and 7.9 (lines 844–851, 888–897, 1217–1224); the docstring of `RiemannHypothesisUpTo` calls it a verbatim copy (Lean 144–148) |
| R03: *MaximalPrimeGapTable* too weak for the gap bounds | Repaired | The completeness clause is at lines 1104–1110 |
| R04: route for Vanlalngaia's Corollary 2 | Repaired | Corollary 3 is the general target and Corollary 2 its instance at `R = 5.5666305` (lines 2438–2461); the numbers are in the table |
| R05: supplier locators and Layer 0 dependencies | Repaired | No "target 13" remains; §6.5 is cited, including in Layer 0's Dependencies (line 828); `rumely-1993` lines 29–36 (lines 407, 902) |
| R06: tail inequality false at `T = 1` | Repaired | Now "`T ≥ 2π`" (lines 1377–1381) |
| R07: §6.6 existence route only for `ε > 2·10⁻⁵` | Repaired | Rerouted through Kadiri's smoothing (lines 3223–3238) |
| R08: false Robin Check | Repaired | Lines 1050–1051 |

### Gate, build and supplier order

- Gate rerun at `1ab1590`: every check `0`, "OK".
- `git diff --stat origin/main...HEAD` outside the folder: empty.
- `lake env lean` on `Suggested.lean`: 15 "declaration uses `sorry`" warnings and nothing else; exit 0.
- Dependency check: `depcheck: 244 roadmaps, 2465 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line.
- Merge order: this roadmap is at 271, after ExplicitZetaBounds (270), SieveMethodsAndPrimePatterns (269), EffectiveClassNumbers (248), ComputationalNumberTheory (193) and AnalyticNumberTheoryPartI (90).
- SpecialFunctionsEiLiErfIncompleteGamma is a new-roadmap pull request by another author. The description names it, together with its supplier AsymptoticExpansions.

### Signatures

All 31 declarations were checked with `#check @name`, appended to a scratch copy of the file: 16 definitions and 15 theorems. Each elaborated type matches its README statement, and no binder is lost. Notes:

- `brun_titchmarsh` allows `l = 0` only when `k = 1`, which is the case `l = 1`.
- Every exponent `(1 : ℝ)/3` is real.

### Headlines and padding

The README's end theorems (lines 31–58) are stated, except those that the docstring names as resting on table propositions over composite error functions (unchanged since the previous review). Every definition is used by a theorem.

No theorem closes by one tactic; this was decided by reading. Each finite hypothesis covers only part of its conclusion:

- `[48, 10¹⁹]` for `axler_primeCounting_upper`;
- `p_k ≤ 10¹¹` for `dusart_nth_prime_lower`;
- `q ≤ 20 000` for `lamzouri_li_soundararajan`;
- `[2 898 242, 4 652 353]` for `trudgian_interval`;
- `[17 051 708, 2·10⁷]` for `axler_interval`;
- `x ≤ 10⁸` for `schoenfeld_interval`.

There is no padding.

### Adversarial table

Values were computed in pure Python, with sieves to `2.2·10⁷` (`μ²` and `φ` to `10⁷`), `li` from its series, and the source texts.

| Statement | Instances | Values (each side) | Result | Change |
|---|---|---|---|---|
| `brun_titchmarsh` | 20 000 random cases (`k ≤ 60`, `t ≤ 50`, `x` just below a prime of the class); `k = 3`, `l = 2`, `x = 10`, `y = 30` | 0 violations, worst ratio `0.457`; `4 ≤ 13.03` | holds | none |
| `MVDiagonalFiniteRange` | `u → (k+1)⁻` for `6 ≤ k < 10⁷`; `u → 6⁻` | min of `S − log u − 1.07` is `0.0441` (`u → 10⁻`); `2.75 < 2.860` | holds, start sharp | none |
| `BrunTitchmarshFiniteRange` | every `24 ≤ n ≤ 2·10⁴`, best `Q` | `n = 24`: `15.107 > 15.104`; `n = 25`: `15.510 ≤ 15.533`; `n = 2·10⁴`, `Q = 115`: `3746.97 ≤ 4038.98`; least margin `0.0095 n/log² n` at `n = 25` | holds on `[25, 2·10⁴]` | none |
| §0.1 large-`t` step | `N = 20 001`; `N ∈ [2·10⁴, 10²⁰]`; last failures | `c = 0.07603`, gap `20.41`; min scaled gap `0.156`; last failures `N = 14 013` (linearised), `t = 12 069` (closed form as written), `t = 552` (exact `π`, steps of `S`) | holds | none |
| §0.1 Abel constant | `u → 0` | `log 6 + 1.07 + ½ log(2/3) − log 12 = 0.174119` | matches | none |
| §0.5 `ε₀` | `x = e¹⁰⁰` | `0.027754` against printed `0.02777` | slip | R06 |
| §§1.5, 6.2 | `k = 1`, `x₀ = 10⁶`; `k = 8`, `x₀ = 10¹⁰` | `1515.8 ≤ 2072`; `2.072 · 4/10⁵ = 8.29·10⁻⁵` | holds | none |
| §1.7 | `q = 4.707·10⁶`, `4.6·10⁶`; `q = 10¹⁰` | `√q log q = 33 335 ≥ 33 333`; `32 905 < 33 333`; `1 − 1/(5 · 23.026) = 0.99131` | holds | none |
| `schoenfeld_of_riemannHypothesis` | `x = 100`, `1426.9`, `10⁴`; `ButheVerified` takeovers | `5.96 < 8.44`, and `|θ − x| = 16.27 > 8.44`, hence the threshold `599`; `74.08 < 79.3`; `17.1 < 36.65`; `ψ` from `129.05`, two-sided `π` from `3834` (`2.709 = 2.709`) | holds | none |
| `leeNosal_of_riemannHypothesis` | `x = 101`, `101⁻`; crossing `337.09` | `2.340 ≤ 5.695`; `6.955 > 5.695`; `0.9400` | sharp | none |
| `leeNosal_theta_of_riemannHypothesis` | `x = 2657`, `2656` | `89.86 ≤ 94.12`; excess `+2.66` | sharp | none |
| `LeeNosalRange` | every prime and prime power, both sides, in `[101, 338]` and `[2657, 3382]` | 0 violations | holds | none |
| §2.2 second `ψ` bound and tail | `x = 11`; crossing; `T = 2π` | `√11 · 1.5692 = 5.20 ≥ 0.77`; `1.23250` at `log x = 30 369.58`; `0.0550 < 0.0931` | holds | none |
| §2.2 zero count, second branch | crossing with `0.28 log T` | `log T = 59.12` (`9.3675`), `64.93` (`9.4925 + 7/8`), `55.46` (Bellotti–Wong + `7/8`) | misprint | R02 |
| `buthe_of_riemannHypothesisUpTo`, `johnston_of_riemannHypothesisUpTo` | criteria crossing; `x = 60`; `π*` on `(59, 5000)` at step `0.01` | `x = 547.7`; `2.47 ≤ 5.17`; fails only on `(96.29, 97)` (`1.939 > 1.793` at `96.999`) | holds from `97` | none |
| `carneiro_milinovich_soundararajan` | `x = 4`, `7.5`; maximum of `log x/√x` | `[4, 6.44] ∋ 5`; `[7.5, 12.36] ∋ 11`; `2/e = 0.736 < 0.88` | holds | none |
| §2.5, Schoenfeld and Dudek | `x = 600`; `x = 2`, `100` | `h = 79.77`, `(520.2, 600] ∋ 521`; `(0.752, 2] ∋ 2`; `(41.4, 100]` | holds | none |
| `dusart_of_zeroFreeRegion` | `R = 5.69693`, `log x = 400`; `T₀` | `X = 8.3793`, `ε_R = 1.0604·10⁻³`; `X ≥ 8.36 ⇔ log x ≥ 398.16`; `M(9.6769) = 3·10⁻⁶` | holds | none |
| §3.2 (5.3*) through §0.3 | `x = 1 155 901²` | coefficient `38.32` against `3` | route fails | R03 |
| §3.2 repaired route | `x ∈ [10⁸, 10⁶⁰]`; `x ∈ (10⁸, 1 155 901²]` | termwise ratio `≤ 1.5339`; minimum ratio `1.00793` (actual), `1.0080` (from the bounds) | works | R03 |
| §3.2, Theorems 4 and 11 | `x = 100`, `1000`; `x = 17` | `89.14 > 83.73`; `927.6 < 956.25 < 1072.4`; `0.68 < 2.82` | holds | none |
| `axler_primeCounting_upper` | the finite clause at every prime in `[48, 2.2·10⁷]` | 0 failures, least margin `8.69` at `1627`; `U(48) = 896 ≥ 15` | holds | none |
| `vanlalngaia_sum_inv_prime` | `VanlalngaiaRange` at every prime, both sides, to `2.2·10⁷`; transfer | 0 violations; tightest ratios `0.977` (`1327`), `0.934` (`24 421`), `0.922` (`113`); `0.4016 ≤ 1` | holds | none |
| §4.3, Corollary 2 at `R = 5.5666305` | `log x = 4635` | `814R = 4531.24`, `1.6R^{−1/4} = 1.04165`, `1/R = 0.179642`; `5.45·10⁻¹⁶ ≤ 8.38·10⁻¹⁶` | holds | none |
| §4.6, Proposition 2.5 | `(r, α) = (1, 0.15)`, `(2, 1)`, `(1, 1)`; `r₀(1)` | `107/160` and `3/20`; `1181/648` and `1069/648`; `1.979 > 0.669`; `3r⁴ + 8r³ + 6r² = 25.000` at `1.1445` | `α = 1` cannot give (2.19) | R04 |
| §4.6, (2.28) | `π₅(3)` | `275 = 275` | equality | none |
| `dusart_nth_prime_lower` | every `k ≤ 1 389 261`; third range | 0 failures of the conclusion and of Robin's input; least margin `4.15` (`k = 4`); `1.7177·10⁷ > 1.6571·10⁷` at `log k = 1792.5` | holds | none |
| §5.1 | `n = 10⁴`; `n = 61`; every `n ≤ 1 389 261` | `104 591 ≤ 104 729 < 105 591`; `277.49 < 283` (control), `285.70 ≥ 283`; the hypothesis holds from `n = 493`, fails at `463` (`3299 > 3287.9`); 0 failures of the upper form | holds | none |
| §5.2 | `n = 5`, `6`, `19`, `20`, `55` | `11 > 10.43`; `13 < 14.25`; `67 > 66.96`; `71 < 71.86`; `257 ∈ (76.75, 406.75)` | sharp | none |
| §5.4 | `n = 10⁶`, `10` | `15 480 992` against `15 485 863` (`3.1·10⁻⁴ < 5.2·10⁻³`); `9.99` against `29` | asymptotic only | none |
| §5.5 | `B₈`, `B₉`; Theorem 1.9 at `n = 10`; De Koninck–Letendre at `k = 4`, `5` | `−1`, `3.5`; `−4.32 < 129`; `5.347 > 4.852`, `7.745 ≤ 7.927` | holds | none |
| `lamzouri_li_soundararajan` | every unit class for `4 ≤ q ≤ 3000`; `q = 3` | worst ratio `0.650` at `(4, 1, 5)`; `7 > 4.83` | holds | none |
| §6.6 | `q = 10⁵`, `α = 6.9684`; nesting of the exceptional notions | `x ≥ 923.6`; `0.986637` against `0.986503` | holds | none |
| `schoenfeld_interval` | `x = 2 010 760`, `2 010 750`; the `e³⁰` step; up to `2.2·10⁷` | ends `2 010 881.152 > 2 010 881` and `2 010 871.15` (no prime); `4.35·10⁸ > 1.96·10⁸`; 0 failures | sharp | none |
| `trudgian_interval` | `hfin` and `hgap` up to `2.2·10⁷`; `x = 2 898 240` | 0 and 0 failures; end `2 898 357.93 < 2 898 359` | holds | none |
| `axler_interval` | `hfin` and `hgap` up to `2.2·10⁷`; record rows | 0 and 0 failures; lengths `179.73 < 180`, `204.87`, `211.84 ≥ 210` | holds | none |
| `PrimeGapLogSquareVerified` | every prime `11 ≤ p ≤ 2.2·10⁷` | 0 failures | holds | none |

### Sampled locators verified against the text

- **§0.1:**
  - `tmeemt-art14` lines 82–87;
  - `buthe-2014` lines 65–66, 141–146, 462–469 and 609–616;
  - `montgomery-1978` lines 377–388, 482–497 and 517–528.
- **§0.5:** `rosser-schoenfeld-1962` lines 334–342; `schoenfeld-1976` lines 201–206.
- **§1.5 and §6.2:** `ramare-rumely-1996` lines 58–92; `ramare-2002` lines 152–169 and 1229–1235 (R07).
- **§1.7:** ExplicitZetaBounds §7.9 (the cited papers are uncertified).
- **§2.2:** `schoenfeld-1976` lines 20–28 and 98–125.
- **§2.5:**
  - `dudek-2015` lines 47–52;
  - `carneiro-milinovich-soundararajan-2019` lines 167, 259–262, 269–273, 1185–1199 and 1367–1371.
- **§3.2:**
  - `rosser-schoenfeld-1962` lines 252–253, 306–308, 328, 340–342 and 346–357;
  - `schoenfeld-1976` lines 201–206, 729–733, 767–772 and 1280–1294;
  - `rosser-schoenfeld-1975` lines 759–782.
- **§4.6:** `deleglise-nicolas-2019-landau` lines 387–389, 613–705, 706–767 and 785–796.
- **§5.1:** `dusart-1999-mc` lines 119–126.
- **§5.2:** `rosser-schoenfeld-1962` lines 224–241.
- **§5.5:** `axler-2019` lines 142, 145–166 and 337; `de-koninck-letendre-2020` lines 489–499.
- **§6.6:** `kadiri-2008` lines 92–137, 140–200 and 327–342.
- **§7.1:** `schoenfeld-1976` lines 646–716; `oliveira-e-silva-herzog-pardi-2014` lines 1795–1821.
- **Also read:**
  - `dusart-2016` lines 74–90, 184–200, 471, 528–535 and 576–580;
  - `buthe-2016` lines 688–755; `buthe-2018` lines 73–85;
  - `trudgian-2016` lines 229–236; `robin-1983` line 378.
- **A note on `dusart-2016`.** The source's proof takes `T₀ = 17.8478` (line 534), which needs the first zero on the line. The README's `T₀ = 9.6769` meets Lemma 2.2's hypothesis `T₂ ≥ T₀ > 2π` with only the hypothesis `hlow`, and the bound (19) of that lemma does not involve `T₀`.

### Library declarations opened at the pins (16)

- **Mathlib:**
  - `NumberTheory/Chebyshev.lean` 70 (`psi`), 77 (`theta`), 191 (`theta_le_log4_mul_x`), 429 (`psi_eq_theta_add_sum_theta`), 433 (`theta_le_psi`), 442 (`abs_psi_sub_theta_le_sqrt_mul_log`, `2√x log x`) and 668 (`primeCounting_eq_theta_div_log_add_integral`);
  - `NumberTheory/LSeries/RiemannZeta.lean` 185 (`RiemannHypothesis`);
  - `Analysis/Analytic/Order.lean` 63 (`analyticOrderNatAt`);
  - `NumberTheory/LSeries/Nonvanishing.lean` 404 and 412;
  - `NumberTheory/Harmonic/EulerMascheroni.lean` 170.
- **Tau Ceti:**
  - `Analysis/SpecialFunctions/LogIntegral.lean` 141 and 180;
  - `NumberTheory/LFunctions/Mertens.lean` 545;
  - `NumberTheory/PrimeCounting.lean` 70 and 90.

### Cross-roadmap citations resolved

- **ExplicitZetaBounds** (`3e44c3f`): §0.2 (the definitions, antitonicity, the limits and the passage to imprimitive characters), §0.3, §0.4, §6.5 (`c = 3/2`, at least two points), §7.9, its Downstream consumers and "Not owned here" (R01).
- **ExplicitCharacterSumsAndSieves** (`3fa29b0`): README lines 85–97, 1355–1385 and 1664–1676; `Suggested.lean` line 553 (R05).
- **SpecialFunctionsEiLiErfIncompleteGamma** (`3bdb9db`): §§8.2–8.4, `TauCeti.Real.principalLogIntegral`, `logIntegral_eq_principalLogIntegral_sub`, and `li(2) ∈ (1.0451637801, 1.0451637802)`.
- **AnalyticNumberTheoryPartI** (`2b9b7af`): §§0.2 (`primeCountAP`, `theta_ap.sum_classes`), 0.3, 0.5, 0.8, 0.16, 0.19, 0.20, 0.25, 0.30, 0.32, 0.34, 1.5a, 1.6 and 1.9.
- **SieveMethodsAndPrimePatterns** (`39cf901`): §2.9; §3.1, `SieveDistribution.primeCountAP` (Lean line 313).
- **ComputationalNumberTheory** (`ed098d6`): §§4.17a, 4.22 (`platt_bounded_height`) and 4.24.
- **EffectiveClassNumbers** (`28521c8`): §4.4.
- **ZerosOfLFunctions** on main: §§4.1, 4.5, 5.6, 6.2–6.5, 7.4, 8.3–8.9 and Layer 9, with `zeroCount`, `chebyshevPsi_explicitFormula`, `riemannZeta_weilExplicitFormula`, `primeIdealCount_effective` and `primeCounting_progression_effective`.
- **On main, also:** ClassicalArithmeticCompletion §6.34 `dyadicPrimeCount`; LFunctions `dirichletData`.
- **ProbabilisticAndMetricNumberTheory** (open new roadmap): Layer 5, short intervals; cited only as a deferral.
- The three leads of the citation tool are all found at these heads: `SieveDistribution.primeCountAP`, `principalLogIntegral` and `theta_ap.sum_classes`.

### Ownership and gaps

- **Overlaps.** None at the heads. Compared by object with ExplicitZetaBounds (R01), ExplicitCharacterSumsAndSieves (R05), ExplicitMultiplicativeFunctions and ExplicitNumberFields (both cite §§3.2, 3.3, 4.3, 5.3 and 2.2 by section) and AnalyticNumberTheoryPartI.
- **Gap slugs.** The 11 supplier gaps carry the same slugs in `plan.json` and in the README.
- **`gap:explicit-brun-titchmarsh`** (supplier `none`) is discharged by this roadmap's own §0.1 headline. It is not an unowned prerequisite.

## Not verifiable

These texts are uncertified or waived in the manifest, so I cited them by locator and did not read them. Their numbers were recomputed where possible (table).

- `lee-nosal-2026`: Theorems 1.1–1.2, display (8) (see R02), display (10) and §§3.2–3.3.
- `lu-zaman-zhao-2026`, `banks-2026`, `thorner-zaman-2024` (§1.7).
- `rosser-1938`, `rosser-1941` (§5.2); `cipolla-1902`, which is waived (§5.4); `zhang-xiong-2025` (§5.5).
- `montgomery-vaughan-1973`: Theorem 2 and Lemma 7.
- `axler-2018`, `axler-2019-nth-prime`, `axler-2024`, `johnston-2022`, `chirre-helfgott-2025`, `fiori-kadiri-swidinsky-2023-psi`, `fiori-jaskari-2026`, `broadbent-fiori-kadiri-ng-wilk-2026`, `bellotti-trudgian-yang-2026`, `brent-platt-trudgian-2021`, `platt-2016`, `ramare-saouter-2003`, `dusart-2018`, `cully-hugill-lee-2024`, `bhattacharjee-2024`, `openai-2026-siegel`, `cully-hugill-johnston-2025`, `lee-2026`, `visser-2025`, `johnston-sorenson-thomas-webster-2026`.
- `massias-robin-1996`: Théorème A is an image in the cached text.

## Source issues

- **Error** in buthe-2016 at Theorem 2, (7.1), p. 13: the source says `|π*(x) − li(x)| ≤ √x log x/(8π)` for `x > 59`; it should be `x ≥ 97`, since it fails for `96.29 < x < 97` (`1.939 > 1.793` at `96.999`); affects a stated result.
- **Error** in buthe-2018 at Theorem 2, (1.6), p. 2 of the text: the source says `x − θ(x) ≤ 1.95√x` from `1423`; it should be from `1427`, since it fails for `1426.4717 < x < 1427`; affects a stated result.
- **Misprint** in dusart-2016 at Theorem 1.1, p. 876: the source says `X ≥ max(8.36, 8R)`; it should be `X ≥ max(8.36, 8/R)`, which its proof uses (p. 884 and p. 885); affects a stated result.
- **Misprint** in dusart-1999-mc at the proof of Theorem 3, p. 413: the source says the minimum over `10¹¹ ≤ p_k ≤ exp(1800)` exceeds `c = 0.0077629`; it should read `exp(500)`, since the minimum is `0.0030` at `exp(1800)`; affects nothing.
- **Error** in robin-1983 at Théorème 8, (23): the source says `p_k ≤ k(log k + log log k − 0.9385)` for `k ≥ 7022`; it should be `k ≥ 8602`, since it fails at `k = 7022` (`70 919 > 70 918.61`) and `8601`; affects a stated result.
- **Error** in trudgian-2016 at Corollary 2, p. 7 of the text: the source says the interval holds for `x ≥ 2 898 239`; it should be `x ≥ 2 898 242`, since at `x = 2 898 240` it ends at `2 898 357.93`, before the next prime `2 898 359`; affects a stated result.
