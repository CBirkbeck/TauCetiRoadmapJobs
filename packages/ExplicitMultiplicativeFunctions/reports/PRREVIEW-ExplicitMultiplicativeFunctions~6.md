# Review of ExplicitMultiplicativeFunctions (pull request #1946 at bca454b)

**Verdict:** needs changes

This is a full review of `TauCetiRoadmap/ExplicitMultiplicativeFunctions/README.md` (3876 lines) and `Suggested.lean` (362 lines) at `bca454b`. Below, `README.md` and `Suggested.lean` mean those two files. The gate passes, the dependency check reports no problem, and `Suggested.lean` elaborates with `sorry` as its only warning.

Two of the findings come from supplier heads pushed today:

- ExplicitZetaBounds at `3e44c3f` now disowns the `1/ζ` bounds of `gap:zeta-reciprocal-bounds` (R01).
- ExplicitPrimeCounting at `3630d41` and ExplicitCharacterSumsAndSieves at `5aa1cf5` moved the `58/√z` diagonal asymptotic to ExplicitPrimeCounting §0.1 (R07).

The other findings come from the seeded sample and from recomputation.

## R01 (P2) — `gap:zeta-reciprocal-bounds` is now disowned by its supplier, so the three `1/ζ` bounds of 1.9 have no owner

- **Location.** `README.md` lines 463–468 ("What ExplicitZetaBounds must provide (gap:zeta-reciprocal-bounds): the three explicit upper bounds for `|1/ζ(σ + it)|`…"), line 1634 ("owed by ExplicitZetaBounds, never restated"), and lines 126–129 (Not owned here).
- **Claim.** 1.9 hands the three `1/ζ` bounds to ExplicitZetaBounds. At its head, ExplicitZetaBounds hands them back. The object has no owner, and 1.9 rests on it.
- **Witness.** ExplicitZetaBounds `README.md` at `3e44c3f`, lines 160–162, under "Not owned here": "the bounds for `1/ζ(σ + it)` inside the classical region and on `σ ≥ 3/4` below `3·10¹²` that `ExplicitMultiplicativeFunctions` quotes". Its §7.10 has only `431.7 log t/log log t`.
- **Repair.** Give the bounds one owner before either pull request merges. Since ExplicitZetaBounds is earlier and declines, the direct repair is here:
  - In 1.9, state the three bounds as part of the target, taken by locator from `leeLeong2022` (the paper bounds `1/ζ` itself).
  - Name their inputs: ExplicitZetaBounds §7.3 (the `5.558691` classical region contains the `5.56` one), §3.4 and §7.10, and `RH(H)` from ExplicitPrimeCounting §1.1.
  - Delete the contract paragraph at lines 463–468, replace `gap:zeta-reciprocal-bounds` in 1.9's *Needs:* and in Layer 1's Dependencies, and carve these bounds out of the "Not owned here" bullet at lines 126–129.
  - While there, give each Lee–Leong statement its own equation number: 1.9 (line 1625) and the Scope (line 160) both cite `leeLeong2022` (9)–(11), for different shapes.

  The alternative is for ExplicitZetaBounds to withdraw its "Not owned here" bullet and accept the contract. The README must then cite that acceptance.

## R02 (P2) — 1.6 and 2.4 name the wrong finite inputs, and three printed rows of Theorems 1.12–1.13 exceed what the source's proof gives

- **Location.**
  - `README.md` lines 1511–1512: "Under the propositions *MoebiusRangeVerified* of the source's direct verifications (it computes `M_q(x)` on initial ranges of `x/q`)".
  - Line 1912: "the direct verifications on `x/q` as *MoebiusDivRangeVerified*".
  - Lines 752–753: "the initial ranges of Layers 1.4 and 1.6 as named there".
  - Lines 1908–1910: the rows `5/16` (`x/q ≥ 687`), `5/38` (`x/q ≥ 882`) and `1/7` (`x/q ≥ 11 811`).
- **Claim.**
  - The source verifies neither `M_q` nor `M`. It verifies Ramaré's maximal sums `M*` and `m*`, which are sums over `w` of maxima of `|M|`, resp. `|m|`, on windows `[y/w², (y + 1)/w²)`.
  - No instance of *MoebiusRangeVerified* or *MoebiusDivRangeVerified*, a pointwise bound `|M(x)| ≤ ε(x)`, states these computations. 1.6 names no instance at all, although 0.7 says it does. So the hypothesis list of Theorems 1.12–1.13 and 1.18–1.19 is not known to suffice.
  - Separately, three printed rows exceed what the source's own proof delivers.
- **Witness.** `ramare2015mc` (16.5), lines 1476–1485, defines `M*`; Lemma 16.2 computes it to `8·10⁷`; lines 1530–1531, 1564–1565 and 1059–1061 inspect `M*` and `m*` directly. (9.1), line 1108: `0.320` from `687`. Lemma 8.3, lines 1086–1087: `0.320`, `0.143`.
- **Repair.**
  - In 0.7, define *MoebiusStarRangeVerified* `c a b` (`M*(y) log y/y ≤ c` on `[a, b]`, with `M*` as in (16.5)) and its `(1 + log y)` and `m*` analogues. List the instances of Lemmas 7.1, 7.4, 8.3, 16.2, 16.4 and 16.6.
  - Name them in 1.6 and 2.4 in place of the pointwise propositions, and correct "it computes `M_q(x)`".
  - In 2.4, state the constants the proof gives (`0.320` from `687` in Theorem 1.12; `0.320` from `882` and `0.143` from `11 811` in Theorem 1.13), or name the further verification behind `5/16`, `5/38` and `1/7`. These rows hold with room for every `q` I tested (table below), so they are not false; they are unproved by the cited route.

## R03 (P2) — 7.9's route uses `|Δ(v)| ≤ 0.173 √v` for real `v ≥ 6·10⁵`, which fails just below `1 081 080`

- **Location.** `README.md` lines 3170–3171: "with `Δ` at real arguments (the `0.397` row of 7.4, the third form of 5.2, and the sharpening `|Δ(v)| ≤ 0.173 √v` for `v ≥ 6·10^5` …)".
- **Claim.** At real arguments the input is false on one unit interval. It is the same integer/real slip that 7.4 corrects for the `0.397` row. No target or Layer 0.7 proposition states the input or its finite range.
- **Witness.** `1 081 080 = 2³·3³·5·7·11·13`, `τ = 256`. As `v → 1 081 080⁻`, `Δ(v) → 15 186 725 − v(log v + 2γ − 1) = −181.358`, against `0.173 √v = 179.877` (ratio `0.174425`). On `[6·10⁵, 6·10⁶]` the integer maximum is `0.172001`; no other real violation.
- **Repair.**
  - State the input as `|Δ(n)| ≤ 0.173 √n` for natural `n ≥ 6·10⁵` and `|Δ(v)| ≤ 0.173 √v` for real `v ≥ 1 081 080`.
  - Add its finite range to Layer 0.7 as a *DivisorRangeVerified*/*DivisorRangeVerifiedNat* instance, and list it in 7.9's *Needs:*.
  - Say that the analytic range must be rechecked with this real threshold, as is already said for `0.397`.
  - ExplicitNumberFields consumes 7.9 (its `README.md` lines 2321–2322), so the repair matters downstream.

## R04 (P2) — The 9.2 API bullet "`N` is divisible by every prime `p` with `p^ε ≤ k`" fails at the tie `p^ε = k`, as 9.2's own Check shows

- **Location.** `README.md` line 3486, against the Check at line 3548 ("for `ε ≥ 1`, `superiorHighlyComposite 2 ε 1` holds").
- **Claim.** The bullet is stated for every superior `k`-highly composite `N`. It holds only for `p^ε < k`, or for the largest maximiser `N_{k,ε}`.
- **Witness.** At `k = 2`, `ε = 1`: `τ(n)/n ≤ 1 = τ(1)/1` for all `n`, so `N = 1` qualifies (and so does `N = 2`). But `2^1 = 2 ≤ k`, and `2 ∤ 1`.
- **Repair.** Read "every prime `p` with `p^ε < k`", or state the bullet for the largest maximiser `N_{k,ε}` of the first bullet. Keep the Check at line 3548 as the negative control.

## R05 (P3) — The 7.5 Check claims Bordellès' threshold `13` is exact "likewise for `k = 4`"; the `k = 4` bound never fails

- **Location.** `README.md` lines 3014–3016: "the threshold `13` is exact for `k = 3` (likewise for `k = 4`)".
- **Witness.** `S₄(x) ≤ x(log x + 2)³/6` holds at both ends of every unit interval of `[1, 10⁵]`. For example, `S₄(6) = 39 ≤ 6(3.792)³/6 = 54.5` and `S₄(12) = 133 ≤ 180.4`. For `k = 3`, `S₃(12) = 74 > 72.87`, so `13` is exact there.
- **Repair.** Replace "(likewise for `k = 4`)" with "for `k = 4` the bound already holds from `x = 1`".

## R06 (P3) — The 0.7 locator for *MoebiusLogRangeVerified* points at the check of `m`, not of `m̌`

- **Location.** `README.md` lines 759–760: "*MoebiusLogRangeVerified* `ε a b`: the same for `|m̌(x) − 1|` (`ramare2015mc` line 554: `619 000 ≤ x ≤ 3·10^7`)".
- **Witness.** `ramare2015mc` line 554 checks the bound for `|m(x)|` (Theorem 1.2, line 553). The checks of `m̌` are at line 778 (`3846 ≤ x ≤ 10⁶`, the superseded Theorem 1.5) and in `ramare2015corr` lines 20–31.
- **Repair.** Move "(`ramare2015mc` line 554: `619 000 ≤ x ≤ 3·10^7`)" to the 2.3 instance *MoebiusDivRangeVerified* `(x ↦ 0.0144/log x − 0.1/log² x) 463 421 3·10^7`. Give *MoebiusLogRangeVerified* the locators `ramare2015mc` line 778 and `ramare2015corr` lines 20–31.

## R07 (P3) — The `58/√z` asymptotic of `Σ μ²(n)/φ(n)` is now ExplicitPrimeCounting §0.1's, not ExplicitCharacterSumsAndSieves §5.1's

- **Location.** `README.md` lines 115–118, 451–455 and 2797–2799 cite ExplicitCharacterSumsAndSieves §5.1 for "its explicit asymptotic `S(z) = log z + c₀ + O*(58/√z)` for real `z ≥ 10^9`".
- **Witness.** ExplicitPrimeCounting at `3630d41`, §0.1 (lines 477–505), defines `S(u) = Σ_{q ≤ u} μ²(q)/φ(q)` and proves Büthe's `O*(58/√u)`; lines 3877–3879: "whose owner is §0.1". ExplicitCharacterSumsAndSieves at `5aa1cf5`, §5.1 (lines 1249–1253), takes it from there.
- **Repair.**
  - Cite ExplicitPrimeCounting §0.1 for the asymptotic (and for `S` as a sum) at the three places, and add §0.1 to the ExplicitPrimeCounting contract.
  - Keep ExplicitCharacterSumsAndSieves §5.1 for the carrier `selbergDiagonal` and the coprime comparison, which it still states (its lines 1255–1258).

## R08 (P3) — 6.1 states two theorems with no source locator

- **Location.** `README.md` lines 2501–2513: the product bound `Σ_{n ≤ y} f(n)/n ≤ ∏_{p ≤ y}(1 + Σ_{m ≤ log y/log p} f(p^m)/p^m)`, and the Rankin-type bound `Σ_{n ≤ x} f(n) ≤ x exp(Σ_{p ≤ x}(f(p) − 1)/p)`.
- **Witness.** No identifier from the References appears in 6.1. Every other target of Layer 6 has one (6.2 `daboussiRivat2001`, 6.3 `hallTenenbaum1988`, 6.4 `bordelles2012`, 6.5 `vanLintRichert1965`).
- **Repair.** Add the locator (theorem or page) of a text that states each bound. A standard textbook is acceptable for this elementary fact.

## R09 (P3) — The pull-request description miscounts the headlines and contradicts its own dependency list

- **Location.** The pull-request description:
  - "`Suggested.lean` states the thirteen headline theorems (… and the four pointwise bounds)".
  - "everything else named in the README is a consumer, not a prerequisite", after a list "In open pull requests of ours" that omits ExplicitPrimeCounting, ExplicitZetaBounds and ExplicitCharacterSumsAndSieves.
- **Witness.**
  - `Suggested.lean` has 12 theorems (warnings at lines 169–351), of which three are pointwise (lines 328, 340, 351); Robin's `σ(n)/n` bound was moved to a README statement by locator.
  - The description's own "Depends on" block lists #1945, #1948 and #1954 as suppliers.
- **Repair.** Write "twelve headline theorems … and the three pointwise bounds". Add ExplicitPrimeCounting, ExplicitZetaBounds and ExplicitCharacterSumsAndSieves to the dependency paragraph, or drop the "consumer" sentence.

## Previous findings

The review of this same head (`PRREVIEW-ExplicitMultiplicativeFunctions~5`) had one finding.

- R01 (P3), the description not naming ExplicitCharacterSumsAndSieves as a supplier — **repaired**. The "Depends on" block now lists "#1948 ExplicitCharacterSumsAndSieves", and the merge-order chain now ends "#1945 (ExplicitPrimeCounting) → #1948 (ExplicitCharacterSumsAndSieves) → **this pull request**". The remaining inconsistency in the dependency paragraph is R09.

## Verified sound

**Gate, build and scope.**

- I ran the gate: every field is `0`, the result is `OK`, and the exit status is `0`.
- The dependency check (`gate --depcheck … --movable`) prints `depcheck: 244 roadmaps, 2465 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line. `ORDER.txt` lines 269–273 are SieveMethodsAndPrimePatterns, ExplicitZetaBounds, ExplicitPrimeCounting, ExplicitCharacterSumsAndSieves and this roadmap; AnalyticNumberTheoryPartI is at line 90.
- `lake env lean` on `Suggested.lean` prints exactly 12 warnings, each `declaration uses 'sorry'`, at lines 169, 196, 201, 211, 226, 248, 273, 290, 313, 328, 340 and 351.
- The diff outside the folder is empty. The folder holds `README.md`, `Suggested.lean` and `metadata.toml`.
- A scan for process words, `lemma`, "optional" or "deferred" finds nothing.

**Signatures and padding.**

- I elaborated one scratch file with `#check @name` for all 25 declarations (13 definitions, 12 theorems). Each elaborated type matches its README statement: hypotheses, ranges, the inclusive `Icc 1 ⌊x⌋₊` cutoffs and the `mertensConstant ℚ` normalisation.
- The file has no `variable` block, so no binder can drop. No `def` has a `sorry` body.
- One-tactic probe: I replaced each `sorry` by `first | (rfl; done) | (simp; done) | (norm_num; done) | (positivity; done) | (infer_instance; done) | (decide; done) | (simp_all; done)`. All 12 theorems resist, so none is padding.
- Every summary end theorem is stated. The docstring names, with its reason, the one excluded end theorem (Robin's `σ(n)/n`) and the preprint statements.

**Vacuity of the transfer headline.** `abs_moebiusSum_le_ramare` assumes `RamareTransferComputations`. I computed its checkable fields:

| Field | Computed | Bound | Result |
|---|---|---|---|
| (iii) `∫_1^{10⁸}(ψ(t) − t)dt/t` | `−147.76777` (at `10⁶`: `−16.39253`) | `−147.768 ± 0.01` | holds |
| (iv) small-values sum at `K = 462 848` | `161.6603` | `0.03739·4345 = 162.4596` | holds |
| (v) `M(D₀) − M₂(μ, D₀)/log² D₀` | `−466 + 98 403.055/212.757 = −3.48518` | `3.49` | holds |
| (vi) on `[2 161 205, 8 613 000]` | worst ratio `0.99806`, at `2 161 205` | `1` | holds |
| (vii) on `[1 514 928, 3 430 190]` | worst ratio `0.99978`, at `1 514 928` | `1` | holds |
| (i) on `[3, 2·10⁶]` | max `|R₂*|/(√D log D) = 1.2574`, at `59 753` | `1.80` | holds |

No hypothesis of the headline is refuted on what can be computed.

**Library declarations opened at the pins.**

- Mathlib, 44 names, among them:
  - `Mathlib/NumberTheory/AbelSummation.lean`: `sum_mul_eq_sub_sub_integral_mul` (line 128) and `sum_mul_eq_sub_integral_mul₀` (line 210).
  - `Mathlib/NumberTheory/ArithmeticFunction/Misc.lean` line 225: `Nat.card_divisors`.
  - `Mathlib/NumberTheory/ArithmeticFunction/Moebius.lean` line 147: `IsMultiplicative.prodPrimeFactors_one_sub`.
  - `Mathlib/NumberTheory/Harmonic/EulerMascheroni.lean` line 164: `eulerMascheroniConstant_lt_eulerMascheroniSeq'`.
  - `Mathlib/NumberTheory/LSeries/Dirichlet.lean` lines 69, 312 and 322: `LSeriesSummable_moebius_iff`, `LSeries_one_eq_riemannZeta`, `LSeries_one_mul_Lseries_moebius`.
  - The `Chebyshev`, `Harmonic`, `EulerProduct`, `LFunction` and `Real.pi`/`exp`/`log` decimal bounds.
- Tau Ceti, 15 names:
  - `TauCeti/NumberTheory/ArithmeticDirichletSeries/Perron/Formula.lean` line 229: `norm_truncatedPerron_LSeries_sub_sum_le`. Its hypotheses are `0 < x`, `0 < c`, `0 < T`, `f n ≠ 0 → x ≠ n` and summability at `c`, with the sum over `Ico 1 ⌈x⌉₊`, as described.
  - `TauCeti/NumberTheory/LFunctions/Mertens.lean` lines 545, 552 and 564: `mertensConstant` and the two limit theorems.
  - `TauCeti/NumberTheory/ArithmeticFunction/DivisorBounds.lean` line 52: `sigma_le_rpow_mul_tsum`.
  - `TauCeti/NumberTheory/ArithmeticDirichletSeries/EulerProduct/Basic.lean` lines 144, 211 and 494.
  - `TauCeti/NumberTheory/PrimeCounting.lean` line 90 (`Nat` namespace) and `TauCeti/NumberTheory/SumPrimeReciprocals.lean` line 57.
  - Both Abel-summation files.

**Cross-roadmap citations, resolved at the current heads.**

- ExplicitPrimeCounting at `3630d41`: §1.1 (line 233, `RH(H)`), §1.3 (line 982, *ButheVerified*), §1.6 (lines 1244–1245), §1.7 (lines 1274–1283), §3.1 (line 1815, `ε(40) = 1.93378·10⁻⁸`), §3.2 (line 1886, `563`), §3.3 (line 1959), §3.5 (line 2183), §4.2 (lines 2497–2508, including the `8950` form), §4.3 (line 2581 Vanlalngaia; line 2617 Axler), §4.7 (lines 2822–2827), §5.3 (lines 2948–2958, `dusart_nth_prime_lower`), §6.1 (line 3165) and §6.3 (line 3236). §5.3's `−1` form for every `k ≥ 2` is the Dusart theorem, not only Robin's `−1.0072629`.
- ExplicitCharacterSumsAndSieves at `5aa1cf5`: §5.1 (line 1246; `selbergDiagonal` at its `Suggested.lean` line 66; the coprime comparison).
- ExplicitZetaBounds at `3e44c3f`: §6.1 (line 1682).
- AnalyticNumberTheoryPartI at `2b9b7af`: §§0.8, 0.11, 0.19, 0.21, 0.26, 0.34 (`landau_siegel_exclusion`), 3.1, 3.7, 3.9, 3.11, 3.12, 3.22, 3.22a, 3.22b, 3.23a (`BBRFiniteInput`: first conjunct `0.961√x` on `[1, 10¹⁰]`, fourth `0.475√x` on `[4033, 10¹⁰]`), 3.35 and 3.35a.
- SieveMethodsAndPrimePatterns at its open head: §0.5 (*HasLogSieveDimension*, line 489) and §1.1 (line 991).
- ZerosOfLFunctions on main `3b3f7ef`: Layer 9 (*AllOnCriticalLine*, line 1619).
- `overlaps.md` lists no pull request that changes this roadmap and no dropped id; `citations.md` lists nothing found nowhere.

**Ownership against open pull requests.** I searched the given checkouts and `roadmaps grep` by object: `moebiusSum`, the Stieltjes constant, superior highly composite numbers, Hall–Tenenbaum, `2.50637`, `1.3841`, the Mertens product, Piltz, `divisorError` and `selbergDiagonal`. The only shared objects are the diagonal sum (R07) and the `1/ζ` bounds (R01). ExplicitNumberFields consumes 7.5, 7.9, 9.1 and 9.4 by citation (its lines 548–573).

**Declared gaps.** The six contracts in the README (`psi-initial-range`, `mertens-reciprocal-axler`, `psi-relative-bklnw`, `psi-tilde-difference`, `psi-log-power`, `zeta-reciprocal-bounds`) carry the plan's slugs. None of the five ExplicitPrimeCounting ones is supplied at `3630d41`: there is no `0.8 √x`, `η_A`, `8·10⁻⁵`/`2.58843·10⁻⁵`, `0.05/√x` or `8.96237·10⁻⁴` row. The eleven cited as supplied resolve as listed above. `zeta-reciprocal-bounds` is R01.

**Seeded sample.** For each target I opened the text at the locator and checked the statement, the range and the hypotheses.

- 0.1 — computational only.
- 0.2 — `ramare2015mc` lines 224–230 and 248–274 (Lemma 1.9); the misprint at line 329.
- 0.4 — `ramare2016mc` lines 540–565 (Lemma 4.3 and its proof).
- 0.7, checked lines:
  - `hurst2018` lines 420–426.
  - `ramare2013aa` lines 203–214, 251, 261–276, 553–565, 633–646, 677–684, 696–725 and 750–759.
  - `costaPereira1989` lines 796–803; `schoenfeld1969` lines 110–115.
  - `ramare2015mc` lines 459–482 and 553–554 (R06).
  - `ramare2016mc` lines 450–466; `ramare2019bcp` lines 83–108, 122–128, 905–921, 966–972 and 981–985.
  - `cullyHugillTrudgian2021` lines 197–199 and 240–242; `trevino2015ijnt` lines 223–236; `berkaneBordellesRamare2012` line 189.
  - `teo2026` lines 1920–1925; `nicolas2008` lines 232–236 and 436–443; `robin1983aa` lines 462–464; `moserMacLeod1966` line 9.
- 1.6 — `ramare2015mc` lines 407–432 and 1470–1566 (R02).
- 1.9 — Tau Ceti and Mathlib declarations and ExplicitZetaBounds §6.1; the source is uncertified (R01).
- 2.3:
  - `ramare2015mc` lines 116–152 (with all three printed threshold corrections confirmed) and 479–554.
  - `ramare2013aa` lines 56–65 (Corollaries 1.2–1.4); `bordelles2015` lines 64–77.
- 5.1 — `ramare1995` lines 339–354; `trudgian2015` lines 433–450.
- 5.6 — the source is uncertified; the instance was recomputed.
- 6.1 — no locator (R08).
- 6.2 — `daboussiRivat2001` lines 302–362. The README's simplified form with `K(7) = 1.0888` is implied by the general case, and it implies the source's form with `K` replaced by `1`.
- 7.4 — `berkaneBordellesRamare2012` lines 64–75 and 192–195.
- 7.5 — `cullyHugillTrudgian2021` lines 55–71, 125–135 and 188–242.
- 7.9 — the source is uncertified; R03.
- 9.2 — `teo2026` lines 100–116, 1792–1830, 1853–1856 and 1883–1886; `nicolasRobin1983` lines 10–15 and 159–168.

**Adversarial table.** All values were computed in this review, except the rows marked "(carried)", whose values come from the reviews of `6490eee` and `bb05bbe` of the same text.

| Statement | Instances | Values (left / right) | Result | Change |
|---|---|---|---|---|
| 0.1 carriers | `M` at `1, 2, 3, 4, 5, 10, 13, 30, 10³, …, 10⁶`; `m(5), m(6), m(7)`; `m̌(2), m̌(3), m̌(30)` | `1, 0, −1, −1, −2, −1, −3, −3, 2, −23, −48, 212`; `−1/30, 2/15, −1/105`; `0.693147, 0.895880, 1.003021` | sound | — |
| 0.2 coprime decomposition | `q = 2`, `x = 10`; `S = {2, 3}`, `x = 6`; wrong model "≥ one factor in `S`" | `34/105 = 0.323810` both ways; `1/3`; `−2/3` | sound | — |
| 0.4 `Σ_{q ≤ X} q` | `X = 2.999`, `c = 1`; `X = 0.5`, `c = 3`; general `[Q, Q + 1)` | `|3 − 4.497| = 1.497 ≤ 1.4995`; `0.125 > 0.0625` (negative control); `|2N − X²| ≤ X` on each interval | sound | — |
| 0.5 `R`, `Δ`, `γ₁` | `Q(176)`; `N = 10`, `10⁶`; constant of `Σ τ(n)/n` at `10⁶` | `106`, `R = −0.99517`; `0.041228` vs `γ₁ + log 10/20 = 0.042313`, `−0.0728089`; `0.478901` vs `γ² − 2γ₁ = 0.478810` | sound | — |
| 0.6 `H̄(−1/3)` for `μ(n)/n²` | `Σ μ²(n) n^{−5/3}` | `1.85080` | sound | — |
| 0.7 table instance | `|M(n)|/√n` on `[33, 2000]`; Hurst's peak; `n = 31` | max `0.567105` at `199`; `50 286/√7 766 842 813 = 0.57059`; `0.7184` | sound | — |
| 0.7 integrals | `∫_1^{D₀}|M|` and `∫_1^{D₀}|M|/t`, `D₀ = 1 078 853` | `113 556 482 ≤ 113 556 832`; `301.9049 ≤ 302` | sound | — |
| 0.7 `RamareTransferComputations` | fields (i), (iii)–(vii) | see the table above | sound | — |
| 0.7 *MoebiusLogRangeVerified* locator | `ramare2015mc` line 554 | concerns `m`, not `m̌` | locator wrong | R06 |
| 1.6 Theorems 1.18–1.19 | `q ∈ {2, 3, 4, 5, 6, 7, 10, 12, 15, 30, 42, 60, 105, 210, 2310}`, `x ≤ 3·10⁶`, left ends | at `q = 2`: `0.30945, 0.06724, 0.02357, 0.00550` vs `0.997, 0.429, 1/5, 0.0918`; `0.44182, 0.07785, 0.01798, 0.00519` vs `1, 1/2, 1/5, 39/400`; no violation for any `q` | statements hold; hypothesis misnamed | R02 |
| 1.6 `q = 2`, `x = 5` | `M_2(5)` | `−1`; `0.0916 ≤ 0.997` | sound | — |
| 2.4 Theorems 1.12–1.13 | same `q`, `x/q` thresholds, right ends | at `q = 5`, `x/q ≥ 882`: `0.03396 ≤ 5/38`; max of the `5/16` row over the tested `q ≥ 2` `0.0384` (at `q = 1` it is `≤ 1/12` by 2.3) | holds; source's proof gives `0.320` | R02 |
| 1.9 crossing with 1.4 | `L = 4589.2`; reading check | `5.13·10⁻⁸` vs `1.21·10⁻⁸`; `0.79` | sound; owner missing | R01 |
| 1.9 Perron input | `norm_truncatedPerron_LSeries_sub_sum_le` | hypotheses as stated in the contract | sound | — |
| 2.3 thresholds | last violations of `(log x)|m| ≤ 1/12, 1/20, 1/25, 1/40, 1/65, 1/69, 0.0144`; `|m| ≤ 1/10, 1/20, 1/100` | `686, 3354, 3461, 24 269, 96 017, 96 954, 96 954`; `6, 40, 1418` | sound (three printed thresholds false, as stated) | — |
| 2.3 Theorem 1.2 | `x = 463 421`; `[463 421, 1.2·10⁶]`; `0.0144` row | `5.16238·10⁻⁴` vs `|m| = 5.15410·10⁻⁴`; 0 violations; left limit at `96 955` `0.0145113`, max on `[96 955, 463 421]` `0.014393` | sound | — |
| 2.3 2013 corollary | `[60 298, 1.2·10⁶]` at both ends | 0 violations | sound | — |
| 5.1 comparison (headline) | `h = δ`; weighted `U`, `V` by Abel summation; `D(10⁶)` | conclusion = hypothesis; `U = 2A H(0)`, `V = 2A H'(0) + B H(0) − 2A H(0)`, factor `(2 − α)/(1 − α) = 2.5`, `8/3`; `13 970 034` | sound | — |
| 5.1 `H̄(−α)` for `h(d²) = μ(d)/d²` | `α = 1/3, 2/5, 1/2` | `2.80406, 4.04208, ∞` | sound | — |
| 5.2 model (headline) | `t = 0.01`; `sup_{(0,1)} |P| t^{1/3}`; `t = 10⁶` | `5.766 > 5.384`, `< 7.617`; `1.64087` at `u = 7.21632`; `0.478901` | sound | — |
| 5.6 instances | `q = 2`, `X = 100`; `A_2` two ways; `a_q`, `b_q` from the log-derivatives | `3.137993` vs `3.142163`, bound `1.066391`; `0.672520` = `0.672520`; `c₀ + Σ log p/p`, `C₂ + Σ log p/(p + 1)` | sound | — |
| 6.1 product bound | `f = 1` at `y = 2, 3`; `f(n) = n` at `y = 4` | `3/2 = 3/2`; `11/6 ≤ 2`; `4 ≤ 6` | sound; no locator | R08 |
| 6.2 Daboussi–Rivat | `f ≡ 1`, `z = 2`, `y = 2`; `K(7)` | `K(2) = 0.19315`, bound `1.6491 ≥ 0`, lower `0.351 ≤ 2`; `1.0888 ≥ 1` | sound | — |
| 6.3 Hall–Tenenbaum (headline) | `f = 1`; `1 < x < 2` | `A + B + 1 = 4.3686`; `hA` at `y = 1` forces `A ≥ 0`, `hB` at `N = 0` forces `B ≥ 0`, so the right side is `≥ x/log x > 1` | sound | — |
| 7.4 `Δ` rows | `Δ(1), Δ(2), Δ(4), Δ(12)`; `1980, 5460, 5559, 9994`; left limits at `5760, 6720, 7560, 9995`; hyperbola at `x = 4` | `0.84557, 1.30484, 1.83710, 3.32794` (max ratio `0.960695`); `22.3388, 31.3907, −0.7053, −2.5302`; `−30.595, −33.086, −35.037, −12.894` vs `30.130, 32.544, 34.518`; `−0.16290` | sound | — |
| 7.5 Piltz and `τ₄`, `τ²` | `S₂(6), S₃(6), S₄(6)`; `S₃(12), S₃(13)`; last failures; `k = 4` Bordellès | `14, 25, 39`; `74 > 72.87`, `77 ≤ 82.6`; `192, 432, 6`; no failure on `[1, 10⁵]` | Check false | R05 |
| 7.5 Cully-Hugill–Trudgian constants | `F₁` at `x₀ = 7560`; `C₃`, `C₄` from the Laurent expansion of `ζ⁴ x^w/w` | `4.4729 ≤ 4.48`; `0.98147`, `0.27278` (`1 − C₄ = 0.72722`) | sound | — |
| 7.9 `P₃` and the instance | residue of `ζ³ x^w/w`; `x = 100` | `P₃` as stated; `1445.95` vs `S₃(100) = 1471`, bound `106.38` | sound | — |
| 7.9 route input `0.173` | `[6·10⁵, 6·10⁶]`, integers and left limits | integer max `0.172001`; real `0.174425` at `1 081 080⁻` | false at real `v` | R03 |
| 9.1 Robin (headline) | `k = 3, 9` | `1.079732`, `1.384013` | sound | — |
| 9.2 Nicolas–Robin (headline) and Teo's values | `f₂, f₃, f₄, f₅` at the maximisers; `τ(n)/n^{0.3}` at `5040, 2520, 55 440` | `1.537940, 1.591409, 1.633729, 1.671435`; `4.64967, 4.57953, 4.52933` | sound | — |
| 9.2 divisibility bullet | `k = 2`, `ε = 1`, `N = 1` | SHC holds; `2^1 ≤ 2` but `2 ∤ 1` | false at the tie | R04 |
| 9.4 Rosser–Schoenfeld (headline, carried) | `n = 223 092 870`; `ω ≤ 2` | `2.506369`; `4.2257 > 3` | sound | — |
| 8.1 Mertens products (headlines, carried) | `x = 24 284`; `392 686/392 687` | `1.01247·10⁻³ < 4.89185·10⁻³`; margins `−5.85·10⁻¹²`, `+4.70·10⁻¹³` | sound | — |
| 2.1, 2.2, 3.1 (headlines) | `S = ∅, {2}, {2, 3}`; `x = 1, 2`; `x = 2, 30` | `1, 1/2, 1/3`; `1 ≤ 3.667`, `1/2 ≤ 1.583`; `0.3069 ≤ 1.293`, `0.00302 ≤ 0.0667 + …` | sound | — |

## Not verifiable

- These uncertified texts in the sample were cited by locator and not opened: `leeLeong2022` (1.9; including which of (9)–(11) is which shape, R01), `daval2025` and `johnstonLeongTudzi2024` (2.3), `zunigaAlterman2022` (5.6, whose instances I recomputed), `bordelles2002`, `bordelles2006` and `dubbe2020` (7.5; I re-derived the induction of Theorem 4.1 and the `x_k` threshold of Theorem 4.2), `tudzi2025` (7.9; whether it states the `0.173` input for integers or for reals), `simonicStarichkova2023` and `bordellesDaval2026` (7.4), `durasNicolasRobin1999` and `robin1983thesis` (9.2), and `plattTrudgian2018` and `rieselVaughan1983` (5.2; I recomputed the supremum `1.64087` of the `t > 0` constant).
- `ramare1995` Lemma 3.2: the displayed formulas are images in the cached extraction (lines 339–354), so the printed `U = A H(0)` is taken from `trudgian2015` lines 449–450. I re-derived `U = 2A H(0)` myself.
- `vanlalngaia2017` lines 190–195 render digits as letters. The decoding is carried from the previous reviews.

## Source issues

- **Misprint** in ramare2015mc at (1.7), p. 1364 (line 329): the source says `|m₂(10)| = 31/105`; it should be `34/105`, the only value consistent with the stated `≥ 0.260·2/log 5`; affects nothing.
- **Misprint** in ramare2015mc at (2.3), p. 1366 (line 457): the source says the last term of `ε₁` is divided by `t⁴`; it should be `t³`, as in Balazard (the defining identity gives `ε₁(1.5) = 17/162`); affects nothing.
- **Gap** in ramare2015mc at Theorem 1.12, p. 1363 (line 305): the source says `5/16` for `x/q ≥ 687`; its (9.1) (line 1108) proves only `0.320` there; affects a stated result.
- **Gap** in ramare2015mc at Theorem 1.13, p. 1364 (lines 323–324): the source says `5/38` from `882` and `1/7` from `11 811`; Lemma 8.3 (lines 1086–1087) proves `0.320` and `0.143`; affects a stated result.
- **Gap** in ramare2015mc at Theorem 1.2, p. 1361 (line 119): the source says the bound holds from `463 421`; the proof checks numerically only from `619 000` (line 554); my computation finds no violation on `[463 421, 1.2·10⁶]`; affects nothing.
- **Error** in ramare2013aa at Lemma 4.5, p. 6 (line 251): the source says the `0.0067/log x` bound holds for `x ≥ 23`; at `23` the deviation is `0.05295` against `0.00214`; it should start at `1.52·10⁶`; affects the proof.
- **Error** in ramare2013aa at Lemma 6.4, p. 11 (lines 563–565): the source says `∫_1^{10⁸}(ψ(t) − t)dt/t = −129.559`; it should be `−147.768`; affects nothing.
- **Misprint** in ramare2013aa at Lemma 8.1, p. 13 (line 697): the source says `− k ∫`; it should be `+ k ∫` (the proof of Theorem 1.1, line 711, uses `+ 2∫`); affects nothing.
- **Error** in ramare2013aa at the proof of Theorem 1.1, p. 14 (line 716): the source says `−3.48`, a signed value, inside a bound for `|M(D)|`; it should be `+3.49 ≥ |−3.48518|`; affects nothing.
- **Error** in ramare2013aa at the proof of Corollary 1.2, p. 15 (line 754): the source says `301` for `∫_1^{D₀}|M(t)|dt/t`; it should be at least `301.905`, so `302`; affects nothing.
- **Misprint** in berkaneBordellesRamare2012 at Corollary 2.2, p. 4 (line 186): the source says constant `γ² − γ₁` for all `t > 0`; it should be `γ² − 2γ₁`, and `1.16` holds only for `t ≥ 1` (`5.766 > 5.384` at `0.01`); affects a stated result; corrected in print at trudgian2015 line 451, constant only.
- **Error** in berkaneBordellesRamare2012 at Theorems 1.1–1.2, pp. 1–2 (lines 66–68 and 75): the source says `0.397` from real `5560`, with sharpness witnesses `5559` and `9994`; the real form needs `7560`, `Δ(5559) = −0.705`, and `Δ(9994) = −2.530`; affects a stated result.
- **Error** in trudgian2015 at Lemma 14, p. 10 (lines 426–430): the source says `1.16 t^{−1/3}` for all `t > 0`; it should be `t ≥ 1`, or `1.641` on `t > 0`; affects a stated result (the constants of its Lemma 13).
- **Error** in ramare2019bcp at Theorem 1.1, p. 3 of the cached text (line 83): the source says Cohen–Dress's `0.1333√D` from `D ≥ 1004`; it fails at `1663` (`R = 6.017 > 5.436`); it should be `D ≥ 1664`, as at ramare2013aa line 275; affects nothing.
- **Error** in ramare2019bcp at Corollary 1.2, p. 3 of the cached text (lines 107–108): the source says `0.43/√D` for every `D ≥ 1`; at real `D = 1.9` the error times `√D` is `0.598`; it holds only from about `D = 2`; affects nothing.
- **Misprint** in teo2026 at §6.2, p. 41 (line 1827): the source says `λ₁(3) = 1.5810`; Table 16 (line 1923) gives `1.5882`; affects nothing (both are below `λ(3)`).
