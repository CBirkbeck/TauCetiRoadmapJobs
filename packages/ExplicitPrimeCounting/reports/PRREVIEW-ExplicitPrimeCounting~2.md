# Review of ExplicitPrimeCounting (pull request #1945 at 65f9a25)

**Verdict:** needs changes

Eight findings: four P2 and four P3. The gate passes and the dependency check reports no problem. `Suggested.lean` elaborates with `sorry` as its only warning. All seven findings of the previous review are repaired. The weighted-sieve route of §0.1 now reaches the constant `2` numerically, but one of its inputs is owned only downstream (R01). The other blocking items are:

- a double ownership with ExplicitZetaBounds (R02);
- a gap-table definition too weak to carry the implications drawn from it (R03);
- a route in §4.3 that cannot prove its statement (R04).

## R01 (P2) — The §0.1 route needs a lemma that only a later roadmap owns

**Location.** `TauCetiRoadmap/ExplicitPrimeCounting/README.md` lines 466–470: "For large `t`, partial summation from `∑_{q ≤ u} μ²(q)/φ(q) ≥ log u + 1.07` (`u ≥ 6`) at `Q² ≍ 2t/3` gives `1/L₁(Q) ≤ 2N/(log N + c₁)`". The *Needs* line (481–482) omits this lemma.

**Claim.** The headline `brun_titchmarsh` rests on Montgomery–Vaughan's diagonal bound `S(u) ≥ log u + 1.07`. No layer here, no supplier and no pinned declaration provides it. The only roadmap that plans it is ExplicitCharacterSumsAndSieves, at its head:

- §5.1 ("The Montgomery–Vaughan diagonal bound", lines 1383–1388);
- §6.2 (`MVDiagonalFiniteRange`, lines 1640–1642).

That roadmap is 272 in the merge order, after this one (271), and consumes §0.1. The constant cannot be weakened to an elementary one.

**Witness.** With the elementary `S(u) ≥ log u + γ`, the optimum `Q² = 2N/3` gives `N·L₁ ≈ ½ log N − 0.319`, so `1/L₁ > 2N/log N > 2t/log t`. With `1.07` it gives `½ log N + 0.174`.

**Repair.**

- Move the lemma down into §0.1 as a target: for real `u ≥ 6`, `∑_{q ≤ u} μ²(q)/φ(q) ≥ log u + 1.07` (`montgomery-vaughan-1973` Lemma 7, cited by locator).
- Prove it as ExplicitCharacterSumsAndSieves §5.1 does: Büthe's explicit asymptotic for `u ≥ 10⁹`, and a Layer 1 finite-range proposition for `6 ≤ u < 10⁹` (its `MVDiagonalFiniteRange`, moved here).
- Add the lemma to the *Needs* line, and record the move so that ExplicitCharacterSumsAndSieves cites §0.1.
- Name the end `t₀` of the exact evaluation, as a finite-range proposition on `[25, t₀]`.

Tested on the instances above. The lemma holds where checked: `S(u) − log u ≥ 1.114` on `[6, 2·10⁶)`, with the minimum as `u → 10⁻`. With it the route holds for every `t ≥ 25`. A scan of integer `t ≤ 6000` and a grid up to `10¹⁰` finds no failure. The margin `(2t/log t − min_Q(1/L₁(Q) + π(Q)))/(t/log² t)` is `0.0095` at `t = 25` and at least `1.22` from `t = 6000`, so `t₀` in the thousands suffices.

## R02 (P2) — RH(H), the GRH passage law and the real-zero gap have two owners

**Location.** README lines 760–763: "It differs from the supplier's proposition only in being stated over `riemannZeta` on the open strip rather than over the entire completion on the closed rectangle." The same pattern recurs at:

- lines 1132–1134 (§1.7: "the supplier states it over the `L`-function records of LFunctions Layer 4");
- lines 814–825 (§1.2 agreement);
- Scope, lines 76–80.

**Claim.** At its head, ExplicitZetaBounds (earlier in the order) owns all of these objects:

- §0.2: `RH(H)` over `riemannZeta` on the open strip, its antitonicity, and the passage between imprimitive and primitive characters (this roadmap's §1.2 law);
- §0.4: the recorded heights and the absence of zeros up to height `14`;
- §7.9: *HasLandauSiegelGap* `c Q`, the same object as *RealZeroGap*, with the instances `(1/5, 10¹⁰)` and `(3.0·10⁻³, ∞)`.

Its Downstream consumers section (lines 2299–2311) says it owns the propositions of this roadmap's §§1.1, 1.2 and 1.7. The differences that §§1.1 and 1.7 assert do not exist at that head.

**Witness.** ExplicitZetaBounds `Suggested.lean` line 73 has `∀ ρ : ℂ, riemannZeta ρ = 0 → 0 < ρ.re → ρ.re < 1 → |ρ.im| ≤ H → ρ.re = 1 / 2`. This is the body of this roadmap's `RiemannHypothesisUpTo` (line 116), token for token.

**Repair.**

- In §§1.1, 1.2 and 1.7, cite ExplicitZetaBounds §0.2, §0.4 and §7.9 instead of defining these objects and proving agreement with them.
- Keep `GRH(q, H)` over all characters only as a name for "`GRH(f, H)` for every `f ∣ q`", by the passage law of §0.2 there.
- Keep `RiemannHypothesisUpTo` in `Suggested.lean` only as the copy that makes the headlines statable. Its docstring should say it is ExplicitZetaBounds §0.2's definition verbatim, as `liTwo`'s docstring does.
- Delete the agreement bullets and update "Owned here".
- Keep the ids §§1.1, 1.2 and 1.7, which ExplicitMultiplicativeFunctions and ExplicitNumberFields cite, as citation sections.

## R03 (P2) — *MaximalPrimeGapTable* does not imply the gap bounds drawn from it

**Location.** README lines 1020–1023: "every prime `p < 4·10¹⁸` with next prime `p⁺` has `p⁺ − p ≤ 1476`, and for every row every prime `p < P_i` has `p⁺ − p < g_i`". The implications are drawn at lines 1033–1044 and 3337–3340 ("a prime `p ≥ 4 652 353` below the next record `P_{i+1}` has `p⁺ − p ≤ g_i`").

**Claim.** The definition says only that each record exceeds the earlier gaps; it does not say that the list of records is complete. For `P_i ≤ p < P_{i+1}` it gives only `p⁺ − p < g_{i+1}`, not `≤ g_i`. So the hypotheses `hgap` of `trudgian_interval` and `axler_interval` do not follow from the proposition as defined.

**Witness.** The definition alone gives gaps `≤ 178` on `[4 652 353, 17 051 707)`, against Trudgian's length `177.8` at `4 652 353`. For Axler it gives `≤ 208` against `204.9` at `2·10⁷ − 180`, and `≤ 218` against `211.8` at `20 831 323` (`oliveira-e-silva-herzog-pardi-2014` lines 1818–1821).

**Repair.** Define it as follows: for every row `i`, `P_i` and `P_i + g_i` are consecutive primes, and every prime `p < P_{i+1}` (`p < 4·10¹⁸` for the last row) has `p⁺ − p ≤ g_i`.

Tested on the 75 rows of Table 8 (lines 1795–1821):

- worst ratios `154/177.8 = 0.866` (Trudgian) and `210/211.8 = 0.991` (Axler);
- `g_i < log² P_i` with worst ratio `0.921`.

## R04 (P2) — The route given for Vanlalngaia's Corollary 2 cannot prove it

**Location.** README lines 2346–2351: "`≤ 1.1 exp(−√(0.175 log x))/(log x)^{3/4}` for `log x ≥ 4635`. Route: the transfer with the relative error `ε(t) = √(8/π) R₀^{−1/4} (log t)^{1/4} exp(−√(log t/R₀))` of that corollary".

**Claim.** The transfer of §4.3 bounds the tail by `∫ε(t)/(t log t) dt ≈ 2√R₀ (log x)^{−1/4} e^{−√(log x/R₀)}`. That loses a factor of order `√log x` against the stated `(log x)^{−3/4}`. The statement itself is sourced:

- `vanlalngaia-2017` lines 79–89, Corollary 3: `1.6 exp(−√(log x/R))/(R^{1/4} log^{3/4} x)` for `log x ≥ 814R`;
- lines 69–71: `R = 5.69693`.

Corollary 3 comes from the source's main theorem through the zeros (lines 90–108). That route needs the region directly, and §4.3's *Needs* line does not list it.

**Witness.** At `log x = 4635`, the transfer (boundary plus tail, by quadrature) is `2.415·10⁻¹³`, against the stated `8.38·10⁻¹⁶`: 288 times larger. The ratio is 417 at `log x = 10⁴`.

**Repair.**

- State Corollary 3 as the general target, routed through the explicit formula (ZerosOfLFunctions §8.4) with `gap:classical-zero-free-constants`.
- Instantiate it at `R₀ = 5.69693`: `1.6/R₀^{1/4} = 1.036 ≤ 1.1`, and `1/R₀ = 0.17553 > 0.175`.
- That instance covers `log x ≥ 814R₀ = 4637.3`. Either start there, or locate the source's own argument for `[4635, 4637.3)`.

## R05 (P3) — Supplier locators and Layer 0 dependencies

**Location.**

- Lines 70, 110, 353, 369, 450 and 481: "ExplicitZetaBounds target 13".
- Lines 742–746, Layer 0 Dependencies: "…SieveMethodsAndPrimePatterns §§2.9, 3.1; EffectiveClassNumbers §4.4. No later layer is used."
- Line 822: "`rumely-1993` lines 29–32".

**Claim.**

- ExplicitZetaBounds at its head numbers its sections, not targets 1–20. "target 13" resolves only in that package's catalogue; the weighted large sieve is its §6.5, which also assumes that `X` has at least two points.
- Layer 0 now depends on that section through §0.1, but its Dependencies omit it.
- Rumely's list runs on to line 36: the prime powers and the class-number-one primes.

**Witness.** ExplicitZetaBounds README §6.5 (lines 1636–1650) states the weighted sieve with `c = 3/2` for "`X ⊆ ℝ/ℤ` … finite with at least two points". `rumely-1993` lines 35–36 continue the list.

**Repair.**

- Cite "ExplicitZetaBounds §6.5" at the six places, and add "ExplicitZetaBounds §6.5" to Layer 0's Dependencies.
- Cite `rumely-1993` lines 29–36.
- Where a prose citation is not a gap contract, cite ExplicitZetaBounds by section: §§0.2–0.4 for target 20, §§7.2–7.9 for targets 16–18, §§8.1–8.5 for target 19.

## R06 (P3) — A tail inequality in the §2.2 route is false at its stated start

**Location.** Lines 1288–1290: "the tail `∑_{γ ≥ T} 1/γ² < log T/(πT)` (`T ≥ 1`, a consequence of the same zero count)".

**Claim.** At `T = 1` the right side is `0`, while the left side is the sum over all ordinates.

**Witness.** `∑_{γ > 0} 1/γ² = 0.023105` (the value of Brent–Platt–Trudgian, Corollary 1). Against it, `log T/(πT)` is `0` at `T = 1` and `0.0148` at `T = 1.05`. The inequality holds only from `T ≈ 1.08`.

**Repair.** Write "`T ≥ 2π`". Tested: at `T = 2π` the right side is `0.0931 > 0.0231`, and the route uses `T = 10⁷`.

## R07 (P3) — The §6.6 existence route covers only `ε > 2·10⁻⁵`

**Location.** Lines 3093–3100: "for … `ε > 0`, there is `α > 0` such that … Route: with the bound `|ψ(y; q, a) − y/φ(q)| < ε′ y/φ(q)` … (§6.1) and `ε′ < (1 − e^{−ε})/(2 e^{ε})`".

**Claim.** §6.1 states McCurley's shape only at the entries of his Table 1, the smallest being `ε′ = 0.00001` (`mccurley-1984` line 64). For small `ε` no entry satisfies the route's condition. Kadiri's Theorem 1.1 (`kadiri-2008` lines 128–131) is also stated for every non-exceptional `q ≥ 3`, not only for `q > 10^b`.

**Witness.** At `ε = 10⁻⁵`, `(1 − e^{−ε})/(2e^ε) = 5.0·10⁻⁶ < 10⁻⁵`, so no table entry applies.

**Repair.** Either restrict the qualitative statement to `ε ≥ 2.1·10⁻⁵`, or route it through Kadiri's own smoothing (lines 102–125), with its region and four-zero inputs, as in the quantitative item. Tested: at `ε = 2.1·10⁻⁵` the bound is `1.05·10⁻⁵ > 10⁻⁵`.

## R08 (P3) — A false Check on Robin's range

**Location.** Lines 966–967: "the inequality fails at `k = 7022` and at every `8581 ≤ k ≤ 8601`, and at no `8602 ≤ k < 1.3·10⁶`".

**Claim.** The inequality holds at four values of `k` inside `[8581, 8601]`.

**Witness.** At `k = 8584`, `p = 88 609 < 88 610.62`; it also holds at `k = 8589`, `8590` and `8591`. The failures are 7022 together with 17 of the 21 values in `[8581, 8601]`.

**Repair.** Read "fails at `k = 7022` and at every `8581 ≤ k ≤ 8601` except `8584` and `8589–8591`". Tested with a sieve: no failure from `8602` to `1 329 943`.

## Verified sound

### Repairs of the previous review

All seven findings are repaired:

- **R01** (lines 440–472): the route now uses the weighted large sieve. Its numbers are verified below. The remaining input is R01 of this review.
- **R02**: `axler_primeCounting_upper`, `dusart_nth_prime_lower`, `trudgian_interval` and `axler_interval` are stated from pointwise inputs (lines 293, 333, 382, 402).
- **R03** (lines 1876–1881): "`(1 + μ) A_θ (log x/R)^B exp(−C √(log x/R)) x/log x`", with Proposition 13 cited separately. `121.107/5.5666305^{3/2} = 9.22106`.
- **R04** (lines 2271–2276): the first form is used on `10¹⁹ < x ≤ e⁹²⁷⁰`. At `log x = 9270`, `X = 40.338` and the tail is `1.16·10⁻³⁴`.
- **R05** (line 2754): reads `9.99`.
- **R06** (lines 1440–1442): the chain is `> h − A(x) − A(x − h) ≥ 0`.
- **R07** (line 1160): reads `4.707·10⁶`. Computed `√q log q = 33 334` at that `q`.

### Gate, build and supplier order

- Gate rerun at this head: every check `0`, "OK", no file outside the folder.
- `lake env lean` on `Suggested.lean`: 15 "declaration uses `sorry`" warnings and nothing else; exit 0.
- Dependency check output: `depcheck: 244 roadmaps, 2462 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line.
- The roadmap is at 271 in the merge order, after ExplicitZetaBounds (270), SieveMethodsAndPrimePatterns (269), EffectiveClassNumbers (248), ComputationalNumberTheory (193) and AnalyticNumberTheoryPartI (90).
- SpecialFunctionsEiLiErfIncompleteGamma is a new-roadmap pull request by another author and is named in the description.

### Signatures

The elaborated types of all 29 declarations (`signatures.md`) match the README statements. For the four new theorems:

- the hypotheses `hθ`, `hRobin`, `hgap` and `hfin` are as in §§3.5, 5.3 and 7.4;
- the exponents and thresholds are as printed;
- no binder is lost.

The tool lists 30 entries; its entry "`*,`" is a parsing artefact of a docstring, not a declaration. I changed nothing.

### Headlines and padding

There are 15 theorems and 14 definitions; every definition is used by a theorem. Each new theorem's finite hypothesis covers only a bounded part of its conclusion: `[48, 10¹⁹]`, `p_k ≤ 10¹¹`, `[2 898 242, 4 652 353]` and `[17 051 708, 2·10⁷]`. None closes by one tactic (decided by reading). The docstring's non-statable list keeps only results that rest on table propositions over composite error functions, which are judged not simple definitions. No padding.

### Adversarial table

Values computed with pure-Python sieves (to `1.25·10⁸`) and quadrature in my scratch directory.

| Statement | Instances | Values (each side) | Result | Change |
|---|---|---|---|---|
| `brun_titchmarsh` | 36 730 random cases (`k ≤ 60`, `y/k` skewed to `1`); `k = 3`, `l = 2`, `x = 10`, `y = 30` | 0 violations, worst `8 ≤ 12.92`; `4 ≤ 13.03` | holds | none |
| §0.1 weighted route | `t = 24, 25, 10³, 10⁶`; integer `t` from 25 to 6000 and a grid to `10¹⁰` | `15.107 > 15.104`; `15.510 ≤ 15.533`; `269.5 < 289.5`; `136 327.2 < 144 764.8`; 0 failures | holds | R01 |
| §0.1, lemma 1.07 | `u ∈ [6, 2·10⁶)`; `γ` in place of `1.07` | `S − log u ≥ 1.114`; `N L₁ ≈ ½ log N − 0.319` fails | essential | R01 |
| §0.1, small `t` | `t → 24⁺`, each case of `gcd(k, 6)` | `12 ≤ 15.10`; `19 ≤ 30.2`; `14 ≤ 22.6`; `25 ≤ 45.3` | holds | none |
| §0.1 reduction | `k = 30`, `N = 100`, `Q = 10` | `0.025710 ≤ 3.75 · 0.0095087 = 0.035658` | holds | none |
| §0.4 identity | `x = 2`; `x = 3` | `1 = 1`; `π(3) − Li 3 = 0.881575 =` right side `0.881575` | holds | none |
| §0.6 agreement | `q = 4`, `a = 3`, `x = 3`; `q = 0`, `a = −5`, `x = 5` | `1 = 1`; `0 ≠ 1` | `q ≥ 1` needed | none |
| §1.1 `RH(H)` | against ExplicitZetaBounds §0.2 | identical bodies | duplicate | R02 |
| §1.2 Rumely's list | `q = 486, 432, 420, 360, 326, 338, 250` | primitive conductors `{1, 3, …, 243}`, `{1, 163}`, `{1, 13, 169}`, … all `≤ 72`, composite `≤ 112`, or listed | holds | none |
| `ButheVerified`, `θ` clause | `x = 1426.9` | `x − θ = 74.077 > 1.95√x = 73.660` | start `1427` right | none |
| *Robin1983Range* | `k = 7022, 8601, 8602, 8584`; `8602 ≤ k ≤ 1 329 943` | `70 919 > 70 918.61`; `88 807 > 88 805.00`; `88 811 < 88 816.44`; `88 609 < 88 610.62`; 0 failures | Check wording | R08 |
| *MaximalPrimeGapTable* to `hgap` | rows `4 652 353`, `17 051 707`, `20 831 323` | as defined: `178 > 177.8`, `208 > 204.9`, `218 > 211.8`; complete reading: `0.866`, `0.991` | fails as defined | R03 |
| §1.5 tabulations | `k = 1`, `x₀ = 10⁶` | `1516 ≤ 2072`; `√2 = 1.414 > 0.94` | holds | none |
| §2.4 | `x = 587, 586`; `10⁶` | `0.038798 ≤ 0.03883 < 0.038831`; `θ = 998 484.175`, `x − θ = 1515.8 ≥ 50` | holds | none |
| `schoenfeld_of_riemannHypothesis` | `x = 100`; `1426.9` | `|ψ − x| = 5.95 < 8.44`, `|θ − x| = 16.27 > 8.44` (needs 599); `74.08 < 79.29` | holds | none |
| `leeNosal_of_riemannHypothesis` | `x = 101`, `x → 101⁻` | `2.34 ≤ 5.695`; `6.954 > 5.695` | sharp | none |
| `leeNosal_theta_of_riemannHypothesis` | `x = 2657` | `89.86 ≤ 94.12` | holds | none |
| §2.2 tail | `T = 1`, `1.05`, `2π` | `0.0231` against `0`, `0.0148`, `0.0931` | false below `1.08` | R06 |
| `buthe_…`, `johnston_…` | crossing of the criteria; `x = 10²⁶` | `x = 547.72`; `2.861·10¹² ≤ T` | holds | none |
| `carneiro_milinovich_soundararajan` | `x = 4` | `[4, 6.440] ∋ 5` | holds | none |
| `dusart_of_zeroFreeRegion` | `R = 5.69693`, `log x = 400` | `X = 8.3793 ≥ 8.36`, `ε_R = 1.0604·10⁻³` | holds | none |
| `axler_primeCounting_upper` | finite clause on `[48, 2·10⁷]`; `[10¹⁹, 10²⁶]`; `x ≥ 10²⁶` | least margin `8.69` at `1627`; `(U − li)/(√x log x/8π) ≥ 12.38`; series coefficients of `u¹…u⁷` vanish, `u⁸` is `881.13`; scaled excess `314` at `log x = 60`, `853` at `1000`; at `10²⁶`, `3.648·10¹⁵ > 4.76·10¹³` | holds | none |
| `vanlalngaia_sum_inv_prime` | `x = 10`; transfer at `89 967 803` | `0.0807 < 0.3276`; `1/3 + 5/(4 · 18.315) = 0.4016 ≤ 1` | holds | none |
| §4.3, Corollary 2 route | `log x = 4635`, `10⁴`, `10⁵` | transfer `2.415·10⁻¹³` against `8.38·10⁻¹⁶`; `3.1·10⁻¹⁹` against `7.5·10⁻²²` | fails | R04 |
| `dusart_nth_prime_lower` | `k ≤ 1 329 943`; ends of the ranges | 0 failures (Robin's input, and the conclusion with least margin `4.15` at `k = 4`); `0.008215 ≥ 0.0077660` at `e⁵⁰⁰`; `1.718·10⁷ ≥ 1.657·10⁷` at `e¹⁸⁰⁰`; `1.66·10⁻⁶ ≥ 0.905·10⁻⁷` | holds | none |
| `lamzouri_li_soundararajan` | `q = 3`; `q = 4` | `7 > 4.83`; `5/7.687 = 0.650` | holds | none |
| `schoenfeld_interval` | `x = 2 010 760`; `2 010 750` | `2 010 881 < 2 010 881.15`; no prime in `(2 010 750, 2 010 871.15)` | holds | none |
| `trudgian_interval` | `hfin`; `hgap` to `2·10⁷`; `x = 2 898 240`; the lemma at `e³⁵` | 0; 0; `2 898 357.93 < 2 898 359`; `0.0090090 > 0.009` | holds | none |
| `axler_interval` | `hfin`; `hgap` to `2.05·10⁷`; switch points | 0; 0; relative rows up to `log x = 104.24` and `277.80`; slack `6.4·10⁻¹²` at `250`; `2η²/243.31³ = 8.222·10⁻¹¹` | holds | none |
| §3.4 FKS `π` | Corollary 22 | `121.107/13.13375 = 9.2211` | holds | none |
| §3.4 PT Corollary 2 | `log x = 2000` | `3.55·10⁻¹²` against `8.35·10⁻¹⁰/2000 = 4.2·10⁻¹³` | consistent | none |
| §3.6 JY Theorem 1.4 | `x = 23`; crossing with 1.1; `log x = 10⁵` | `3.27 ≥ 0.60`; `1.40·10⁹`; `−113.7` against `−261.6` | holds | none |
| §4.2 thresholds | sieve to `3·10⁶` | last failures `1 514 837`, `467 497⁻`, `113` | README right | none |
| §4.5 Treviño | `x = 10⁴`; `C` ratios | `5 670 868 ≤ 5 736 396 ≤ 5 818 257`; `0.02989`, `0.03667 < 0.0371582` | holds | none |
| §4.7 Lee–Nosal sums | `x = 100`, `10⁴`, `24.4`, `43.1`, `43` | `0.0141 ≤ 0.0550`, `0.0969 ≤ 0.2531`; `0.00124 ≤ 0.0110`, `0.0131 ≤ 0.1013`; `0.0760 ≤ 0.0772`; `0.257486 ≤ 0.257532`; `0.2598 > 0.2575` | sharp | none |
| §5.2 | `n = 5, 6, 19, 20` | `11 > 10.43`; `13 < 14.25`; `67 > 66.96`; `71 < 71.86` | sharp | none |
| §3.5 Dusart two-term | the gap `(88 771, 88 789)` | fails exactly on `[88 782.51, 88 789)` | correction right | none |
| §3.5 Axler at `10¹³` | three bounds | `346 065 306 271.6 ≤ π = 346 065 536 839 ≤ 346 065 951 616.7`; 2018 bound `346 063 677 798.6` | holds | none |
| §6.4 Ramaré | Corollaire 5 | `0.978` at `q = 6`, `a = 1`, `L = 1` (`ramare-2002` lines 181–187) | holds | none |
| §6.6 Kadiri | `q₀ = 5·10⁴`, `ε = 1`, `q = 10⁵`; `ε = 10⁻⁵` | `6.9684 · 132.55 = 923.7`; condition `5.0·10⁻⁶ < 10⁻⁵` fails | route gap | R07 |

### Sampled locators verified against the text

- **§0.4:** `rosser-schoenfeld-1962` line 460; `trudgian-2016` lines 120–125.
- **§1.2:** `rumely-1993` lines 29–36; `ramare-2002` lines 152–159.
- **§1.3:**
  - `buthe-2018` lines 73–85; `buthe-2016` lines 750–756; `rosser-schoenfeld-1962` lines 213–216.
  - `schoenfeld-1976` lines 20–28, 79–124, 644–672, 729–733, 765–780 and 1272–1295.
  - `dusart-1998-thesis` lines 843–876, 922–928 and 1276–1281; `dusart-1999-mc` line 118; `robin-1983` lines 81–84 and 378.
  - `deleglise-nicolas-2019-landau` lines 366–392; `broadbent-kadiri-lumley-ng-wilk-2021` lines 950–976.
  - `trudgian-2016` lines 229–267; `johnston-yang-2023` lines 550–556.
  - `axler-2016` lines 131–152, 190–203, 232–247 and 273–281; `axler-2019` lines 402, 448, 508, 554, 562–563 and 574.
  - `ramare-2013` lines 100–108; `vanlalngaia-2017` lines 26–56.
- **§1.5:** `ramare-rumely-1996` lines 58–92; `ramare-2002` lines 161–169 and 1228–1235.
- **§2.4:** `deleglise-nicolas-2019-landau` line 370.
- **§3.4:**
  - `trudgian-2016` lines 49–92 and 132–140;
  - `platt-trudgian-2021-error` lines 56–92; `johnston-yang-2023` lines 268–280;
  - `fiori-kadiri-swidinsky-2023` lines 26–31, 145–178, 410–420 and 698–735;
  - `dusart-2016` lines 74–90.
- **§3.6:** `johnston-yang-2023` lines 75–81.
- **§4.3:** `vanlalngaia-2017` lines 26–110.
- **§4.5:** `trevino-2012` lines 460–500.
- **§5.2:** `rosser-schoenfeld-1962` lines 222–241.
- **§5.3:** `dusart-1999-mc` lines 112–170; `schoenfeld-1976` lines 767–772 and 1280–1283; `robin-1983` lines 55–90; `massias-robin-1996` lines 163–166.
- **§6.4:** `ramare-2002` lines 130–147, 170–190, 640–694 and 972–1006.
- **§6.6:** `kadiri-2008` lines 80–165 and 322–345; `mccurley-1984` lines 40–70 and 118–132.
- **Further:**
  - `montgomery-1978` lines 370–392, 478–500 and 512–532 (the weighted inequality, identity (21), Brun–Titchmarsh with `2`);
  - `broadbent-kadiri-lumley-ng-wilk-2021` lines 1660–1675 and 1720–1730 (Table 14 rows `40`, `50`; Table 15 row `29`), which match `axler_interval`'s inputs.

### Library declarations opened at the pins (24)

- **Mathlib:**
  - `NumberTheory/Chebyshev.lean` 433 (`theta_le_psi`) and 442 (`abs_psi_sub_theta_le_sqrt_mul_log`);
  - `NumberTheory/PrimeCounting.lean` 133 (`primesLE`); `NumberTheory/Bertrand.lean` 225 (`exists_prime_lt_and_le_two_mul`);
  - `Analysis/Complex/ExponentialBounds.lean` 38, 41, 86 and 89; `Analysis/Real/Pi/Bounds.lean` 178;
  - `NumberTheory/LSeries/RiemannZeta.lean` 185 (`RiemannHypothesis`).
- **Tau Ceti:**
  - `NumberTheory/PrimeCounting.lean` 70 (`primesLE_eq_image_nth`) and 90 (`primeCounting_nth_prime`);
  - `Analysis/SpecialFunctions/LogIntegral.lean` 92, 147, 151, 156, 180, 277 and 331;
  - `ArithmeticDirichletSeries/Transfer.lean` 76; `ArithmeticDirichletSeries/Counting.lean` 625 and 630;
  - `LFunctions/Mertens.lean` 545; `Chebotarev/PrimeCounting/PrimesCongruent.lean` 50.

### Cross-roadmap citations resolved (about 45)

- **AnalyticNumberTheoryPartI** at its head:
  - §0.2: `psiAP` (Lean 104), `primeCountAP` (108), `theta_ap.level_one`, `theta_ap.sum_classes`;
  - §§0.3, 0.5, 0.16, 0.19 and 0.25, whose four inputs match the README's restatements, including `GRH(8, 10 000)` and "`x ≥ 286`, `1/(2 log² x)`";
  - §§0.30, 0.32, 0.34; §1.5a (`3π/2`);
  - §1.6 `DirichletGRH` (Lean 192–193), whose body equals `hGRH`; §1.9.
- **SieveMethodsAndPrimePatterns:** §2.9; §3.1 `primeCountAP (x) (q a)` (Lean 314).
- **ComputationalNumberTheory:** §§4.17a, 4.22, 4.24.
- **EffectiveClassNumbers:** §4.4 (the adapter, line 950).
- **SpecialFunctionsEiLiErfIncompleteGamma:** §8.2 (`principalLogIntegral`, `logIntegral_eq_principalLogIntegral_sub`, `li(2) ∈ (1.0451637801, 1.0451637802)`), §8.3 (DLMF 6.6.1–6.6.4) and §8.4.
- **ZerosOfLFunctions** on main: §§4.1, 4.5, 5.6, 6.2–6.4, 7.4, 8.3–8.7 and 8.9, Layers 0 and 9, and the names `zeroCount`, `chebyshevPsi_explicitFormula`, `riemannZeta_weilExplicitFormula`, `primeIdealCount_effective`, `primeCounting_progression_effective`, `rayClassPsi` and `AllOnCriticalLine`. They are also present at its open revisions, which drop no id this roadmap cites.
- **LFunctions** `dirichletData` and **ClassicalArithmeticCompletion** `dyadicPrimeCount` on main.
- **ExplicitZetaBounds** at its head: §§0.2, 0.4, 5.2–5.4, 6.5, 7.5, 7.6, 7.9 and 8.1–8.3.

### Ownership and gaps

- Compared by object with ExplicitZetaBounds (R02), ExplicitCharacterSumsAndSieves (R01; it cites §0.1 for `brun_titchmarsh`), ExplicitMultiplicativeFunctions, ExplicitNumberFields (both cite §§1.1–7.4 by section) and AnalyticNumberTheoryPartI.
- The 11 supplier gaps carry the same slugs in the plan and in the README. `explicit-brun-titchmarsh` (supplier `none`) is the §0.1 headline of this roadmap, subject to R01.
- ExplicitZetaBounds at its head now provides `rh-up-to-height`, `grh-up-to-height` and `real-zero-gap` in the open-strip form (§§0.2–0.4, 7.9), which is what R02 asks this roadmap to cite.

## Not verifiable

These sources are uncertified or waived in the manifest, so they are cited by locator and I did not read them:

- `lee-nosal-2026`: Theorems 1.1 and 1.2, display (10), and the §3.3 constants of §4.7 (`3.33541`, `0.88612`, `3.77847`). The §4.7 numbers themselves were recomputed (table).
- `axler-2024`: the four `π` bounds, Proposition 1.1's threshold `1 757 126 630 797` and the interval of `axler_interval`. The finite clauses were checked with a sieve, and the route was checked numerically.
- `johnston-2022`, `lamzouri-li-soundararajan-2015`, `fiori-kadiri-swidinsky-2023-psi` (`9.22022`), `fiori-jaskari-2026`, `axler-2018`, `axler-2019-nth-prime`, `zhang-xiong-2025`.
- `dusart-2018`: the arXiv-copy rows `(4, 1300, 2)` and `(2, 0.01, 7 713 133 853)`. The row `(2, 0.05, 122 568 683)` was confirmed by a sieve.
- `ramare-2023-corrigendum`: the corrected thresholds, which agree with my sieve.
- `montgomery-vaughan-1973`: Theorem 2 and Lemma 7.
- `cully-hugill-lee-2024`, `chirre-helfgott-2025`, `brent-platt-trudgian-2021`, `platt-2016`, `lu-zaman-zhao-2026`, `banks-2026`, `thorner-zaman-2024`, `openai-2026-siegel`, `ramare-saouter-2003`, `rosser-1938`, `rosser-1941`, `cipolla-1902` (waived), and the preprints of §7.5.

`massias-robin-1996`'s Théorème A is an image in the cached text. Lines 163–166 confirm the iteration over `[600, 1800]` but not which assertion it proves, so §5.3's account of its range is unverified.

## Source issues

- **Misprint** in broadbent-kadiri-lumley-ng-wilk-2021 at Corollary 11.2 (arXiv v2, p. 16): the source says the row `k = 2`, `M = 0.05` holds from `112 568 683`; it should be `122 568 683`, since the bound fails as `x → 122 568 683⁻` (`17 672.4 > 17 668.3`); affects a stated result.
- **Error** in ramare-2013 at the Corollary after Theorem 1.1, p. 3 of the text: the source says `O*(0.0067/log x)` holds for `x ≥ 23`; it should start at `x ≥ 1 514 845`, since it fails on `[1 514 837, 1 514 844.9)`; affects a stated result.
- **Misprint** in dusart-1999-mc at the proof of Theorem 3, p. 413: the source says the minimum over `10¹¹ ≤ p_k ≤ exp(1800)` exceeds `c = 0.0077629`; it should read `exp(500)`, since the value is `0.0030` at `exp(1800)`; affects nothing.
- **Misprint** in johnston-yang-2023 at Theorem 1.4, (1.9), p. 2: the source writes `|π(x) − x|`; it should be `|π(x) − li(x)|`; affects a stated result.
- **Error** in johnston-yang-2023 at Theorem 1.4, (1.8)–(1.9), p. 2: the source says both hold for `x ≥ 23`; it should be `x ≥ 59` for (1.8) and `x ≥ 71` for (1.9), since at `x = 23` they fail (`3.78 > 3.40`, `1.88 > 1.12`); affects a stated result.
- **Error** in buthe-2018 at Theorem 2, (1.6), p. 2 of the text: the source says `x − θ(x) ≤ 1.95√x` from `1423`; it should be from `1427`, since it fails for `1426.47 < x < 1427` (`74.08 > 73.66` at `1426.9`); affects a stated result.
- **Misprint** in dusart-2016 at Theorem 1.1, p. 876: the source says `X ≥ max(8.36, 8R)`; it should be `X ≥ max(8.36, 8/R)`, the condition its proof and Corollary 1.2 use; affects a stated result.
- **Error** in robin-1983 at Théorème 8, (23), p. 7 of the scan: the source says `p_k ≤ k(log k + log log k − 0.9385)` for `k ≥ 7022`; it should be `k ≥ 8602`, since it fails at `k = 7022` and `k = 8601`; affects a stated result.
- **Error** in trudgian-2016 at Corollary 2, p. 7 of the text: the source says the interval holds for `x ≥ 2 898 239`; it should be `x ≥ 2 898 242`, since at `x = 2 898 240` it ends at `2 898 357.93`, before the next prime `2 898 359`; affects a stated result.
