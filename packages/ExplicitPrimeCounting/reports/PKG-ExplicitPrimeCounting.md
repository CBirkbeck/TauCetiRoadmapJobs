# Package report: ExplicitPrimeCounting

Deliverables: `packages/ExplicitPrimeCounting/README.md` (3 527 lines, 8 layers),
`packages/ExplicitPrimeCounting/Suggested.lean` (9 headline theorems, 15 definitions; the file
starts with `module`, then `import Mathlib`), `packages/ExplicitPrimeCounting/metadata.toml`
(`topic = "math.NT"`), `packages/ExplicitPrimeCounting/sources.toml` (85 entries; two added), and
the `gaps` list of `packages/ExplicitPrimeCounting/design/plan.json` (12 gaps: 11 on
ExplicitZetaBounds, and `explicit-brun-titchmarsh` with `supplier = "none"` because §0.1 closes it
here; nothing else in the file changed).

## Repairs of the earlier attempt

The worker's checks refused the earlier attempt for two problems, both repaired:

1. **`tex=65`.** The gate strips inline code spans line by line, so the 93 code spans that the
   earlier README broke across a line ending exposed their `_{`/`^{` as TeX residue, and the eleven
   `What ExplicitZetaBounds must provide` sentences carried formulas such as `∏_{χ mod q}` and
   `(log |t|)^{2/3}` outside code. Every paragraph or list item that held a broken code span (80 of
   them) is re-wrapped so that no code span crosses a line ending; a script confirmed that the text
   with all whitespace removed is identical before and after. The eleven gap sentences are
   rewritten with every formula in a code span (`∏_{χ mod q}` becomes "the product of the
   `L(s, χ)` over the characters `χ` modulo `q`"; exponents are written `^(2/3)`); the same
   sentences are the `needs` of the eleven gaps in `plan.json`, so README and plan agree word for
   word. The gate's scanner, run locally on the package, now reports every count `0`.
2. **The dropped gap `explicit-brun-titchmarsh`.** Design target 2.5 names it as a prerequisite, and
   the package stage may not drop a gap a target names. The entry is kept with `supplier = "none"`,
   empty `section`, `needs` stating Montgomery–Vaughan's inequality and that §0.1 proves it, and a
   `detail` saying why no supplier owes it (ExplicitCharacterSumsAndSieves, line 271 of the merge
   order, comes after this roadmap, line 270, and consumes §0.1). A gap with supplier `none` is not
   announced to any roadmap, and the README names it nowhere. The worker's own plan checks
   (`plan_change_problems`, `validate_plan`) pass on the new file. The earlier attempt's change to
   the `rh-up-to-height` entry (the low-height verification, `neededBy` with 3.1a) is kept.

Beyond these, this round corrected one mathematical statement (item 14 below: the range of
Dusart's region-only theorem), added the `module` header that the brief requires, and re-ran the
elaboration, the `#check` audit, the padding probe, the dependency check and the sources check.

The README is the accepted design (with the 24 findings of its review applied and the record
brought up to date) written out in roadmap form. Every target, Check and worked example of the
design stays, except the two table/finite-range propositions and the one carrier listed under
"Duplication removals". The corrections below are this package's own.

## Headline theorems

| Headline | Status | Lean name / what it lacks |
| --- | --- | --- |
| Montgomery–Vaughan Brun–Titchmarsh, constant `2`, `y > k` | stated | `brun_titchmarsh` |
| Schoenfeld's bounds under RH (Theorem 10, Corollary 1) | stated | `schoenfeld_of_riemannHypothesis` (inputs `ButheVerified`, `Schoenfeld1976Range`) |
| Lee–Nosal's `ψ` bound under RH, `x ≥ 101` | stated | `leeNosal_of_riemannHypothesis` (inputs `ButheVerified`, `LeeNosalRange`, `ZetaZeroReciprocalSum`) |
| Büthe's bounds from RH to height `T` (`4.92 √(x/log x) ≤ T`) | stated | `buthe_of_riemannHypothesisUpTo` (inputs `ButheVerified`, `Buthe2016Range`) |
| Carneiro–Milinovich–Soundararajan, prime in `[x, x + (22/25)√x log x]` under RH | stated | `carneiro_milinovich_soundararajan` (input `PrimeGapLogSquareVerified`) |
| Dusart's region-only bound (2016, Theorem 1.1), for `X ≥ max(8.36, 8/R)` | stated | `dusart_of_zeroFreeRegion` (inputs `ClassicalZeroFreeRegion R (2π)`, no zero of height `≤ 14`; range corrected from the printed `8R`, item 14) |
| Vanlalngaia's `∑ 1/p = log log x + B + O*(4/log³ x)`, `x ≥ 2` | stated, from its `θ`-input | `vanlalngaia_sum_inv_prime` (inputs `|θ(t) − t| ≤ t/log³ t` for `t ≥ 89 967 803`, `VanlalngaiaRange`) |
| Lamzouri–Li–Soundararajan least prime `≤ (φ(q) log q)²` under GRH, `q > 3` | stated | `lamzouri_li_soundararajan` (inputs `DirichletGRH`, `LamzouriLiSoundararajanRange`) |
| Schoenfeld's prime in `(x, x + x/16597)`, `x > 2 010 759.9` | stated, from its `ψ`-input | `schoenfeld_interval` (inputs `Schoenfeld1976Range`, `PrimeGapLogSquareVerified`, `|ψ(t) − t| ≤ 0.978·10⁻⁵ t` for `t ≥ e³⁰`) |
| Rosser–Schoenfeld `ψ(x) < 1.03883 x`, `θ(x) < 1.01624 x`, their `π` and `p_n` bounds; Schoenfeld Thms 6*, 7*, 11; Dusart's `0.006409 x/log x`, rows `η_k`, Théorème 1.10, `p_k ≥ k(log k + log log k − 1)`; Robin; Trudgian's theorems and interval | not statable | the route beyond `10¹⁹` passes through a table proposition of §3.1(b) (`DusartThesisTable`, `Dusart1999Row`, `FaberKadiriTable`), an inequality on Rosser–Schoenfeld's error function built from the integrals `K_ν` and a dozen auxiliary quantities: no simple carrier. Dusart's `p_k` bound would need five Layer 3/5 inputs as hypotheses; it is named, not stated. |
| Fiori–Kadiri–Swidinsky (`ψ`, `π`), BKLNW `θ ≤ (1 + 1.93378·10⁻⁸)x` and tables, Platt–Trudgian, Johnston–Yang, Faber–Kadiri, Axler's `π` bounds and intervals, Ramaré's `∑ Λ(n)/n` | not statable | table propositions of §3.1(c) on the zero-density error function (display (3.9) of the Faber–Kadiri corrigendum) |
| BMOR `x/(840 log x)`, Ramaré–Rumely, Dusart 2002, McCurley, Ramaré 2002, Kadiri 2008 | not statable | table propositions on the error functions of §§6.1, 6.3, 6.4, 6.6 |
| Kadiri–Lumley, Cully-Hugill–Lee, Ramaré–Saouter intervals | not statable | positivity of Kadiri–Lumley's quantity (2.64) at tabulated parameters |
| Dudek's cubes, Cully-Hugill's powers | not statable | a density hypothesis with constants `C₁(σ)`, `C₂(σ)` tabulated in `σ` |

The module docstring of `Suggested.lean` lists these with what they lack. The four "from its
input" headlines follow the reviewer's package-stage advice (explicit pointwise Chebyshev bounds
as hypotheses); the README states each of these theorems in the same transfer form, with the
instance named after it, so README and Lean have the same generality (Conventions, sixth bullet).

## What the README could not support

- The table propositions (§§3.1, 3.7, 4.5, 6.1, 6.3, 6.4, 6.6, 7.2, 7.3) stay `Prop`s on error
  functions given by the sources' displays; they are named, never asserted, and not encoded in Lean.
- Johnston 2022, Lee–Nosal 2026, Lamzouri–Li–Soundararajan 2015, Axler 2018/2019/2024, Dusart 2018,
  Chirre–Helfgott and the other `uncertified` texts could not be read; their statements are cited by
  locator. Every finite claim of theirs that a sieve can test up to `3.5·10⁷` was tested (table
  below).

## Notions moved down from later roadmaps

- **Montgomery–Vaughan's Brun–Titchmarsh inequality** (new §0.1, `brun_titchmarsh`). The design
  asked ExplicitCharacterSumsAndSieves target 21 for it (`gap:explicit-brun-titchmarsh`), but that
  roadmap is after this one in the merge order (line 271 against 270), so the gap was an upward
  edge. The inequality is now a target here, proved from SieveMethodsAndPrimePatterns §2.9 (the
  forbidden-residue large sieve with `H − 1 + Q²`, earlier in the order); the gap stays in
  `plan.json` with `supplier = "none"` (target 2.5 names it), and ExplicitCharacterSumsAndSieves is
  listed as a consumer. SieveMethodsAndPrimePatterns itself has only an inexplicit form
  (`SieveApplications.progression_upper`, with `∃ C`), so no earlier roadmap owns the constant `2`.
- The design's own move of the enclosures of `γ` and `B` (§1.6) from ExplicitMultiplicativeFunctions
  stays.

## Duplication removals

- **`li` and `li 2`** (the design's §0.1 definitions `liTwo`, `li`, with their API): owned by the
  open roadmap SpecialFunctionsEiLiErfIncompleteGamma (another author's new roadmap folder), §8.2
  (`TauCeti.Real.principalLogIntegral`, the principal value, `logIntegral_eq_principalLogIntegral_sub`,
  the derivative), §8.3 (the exponential-integral series) and §8.4 (the asymptotic expansion).
  Deleted here and cited in Scope, Conventions and a new supplier subsection. Its Checks moved to
  §0.4, which states the `li` form of the remainder identity. `Suggested.lean` keeps local copies
  (`liTwo` by the series, `li x = Li x + liTwo`) only for statability; their docstrings cite the
  owner, and their fully qualified names differ from the owner's.
- *BachSorensonTable* and *BachSorensonRange* (§6.5): no longer needed. Bach–Sorenson's
  `p < 2 (q log q)²` now follows from the Lamzouri–Li–Soundararajan headline for `q > 3`
  (`φ(q) < q`) and from a direct check at `q = 2, 3`.
- `DirichletGRH` (AnalyticNumberTheoryPartI §1.6) and the progression carriers are consumed, not
  redefined. `Suggested.lean` copies `DirichletGRH` with the identical body, because that roadmap
  is still an open pull request and cannot be imported.
- Swept by object, on main, at the open heads (`roadmaps grep`) and in the pinned Mathlib and Tau
  Ceti: Brun–Titchmarsh, principal value / logarithmic integral, Rosser–Schoenfeld, Dusart, Büthe,
  Carneiro, Lamzouri, Bach–Sorenson, verified heights, Mertens constants, decimal enclosures and
  Montgomery–Vaughan. No other owner of an explicit prime bound exists:
  - ClassicalArithmeticCompletion §6.34 `dyadicPrimeCount` stays an agreement.
  - CircleMethodThreePrimes, closest in vocabulary, excludes every explicit form.
  - At the pins, Mathlib has only the elementary Chebyshev bounds and Tau Ceti only asymptotics,
    `mertensConstant` and `logIntegral`.

## Corrections to the design (all checked against the source or a sieve)

1. **Büthe 2018, (1.6)**: `x − θ(x) ≤ 1.95 √x` fails on `1426.4716 < x < 1427`, since
   `θ(1423) = 1352.8227` and 1423, 1427 are consecutive primes; at `1426.9` the difference is
   `74.08` against `73.66`. It holds from 1427 to `2.1·10⁷`. `ButheVerified` now starts the clause
   at 1427, and every range that met it at 1423 now meets it at 1427: `Schoenfeld1976Range`,
   *TrudgianRange*, the routes of §§2.2, 3.3, 3.4.
2. **`ButheVerified`** also carries Büthe's (1.8), `|li x − π*(x)| < √x/log x`, which the design
   omitted.
3. **Büthe 2016's route** (§2.3): the analytic argument holds only from `10¹⁹` (`buthe-2016` lines
   845–849), and the source covers `[5000, 10¹⁹]` by computation. The theorem now carries
   `ButheVerified`; at 5000 the needed constants are `1.870 ≥ 0.94` and `2.209 ≥ 1.95`.
4. **Trudgian's Theorem 1 route** (§3.4): Schoenfeld's argument reaches only `log x ≥ 1163`, and the
   source uses Faber–Kadiri's rows on `[e²⁵, e¹¹⁶³]` (`trudgian-2016` lines 82–92), so
   *FaberKadiriTable* is added to the hypotheses. The rows behind Trudgian's Lemma 1 run to `e⁴⁰⁰⁰`,
   not `e²³³⁰` (lines 237–267).
5. **Dusart 2016 (§3.1(a))**: the proof's Lemma 2.2 needs a height `T₀ > 2π` with `N(T₀) = M(T₀)` and
   no zero off the line below it (lines 188–194). The theorem now assumes that `ζ` has no zero of
   height `≤ 14`, which gives `T₀ = 9.6769`; this verification was added to
   `gap:rh-up-to-height`.
6. **Dusart 1999 route (§5.3)**: the bound `0.0077629 x/log x` is Schoenfeld's Theorem 7* (5.6b*)
   (`schoenfeld-1976` lines 767–779), not Theorem 11; Theorem 7* is added to §3.2.
7. **MaximalPrimeGapTable ⇒ gaps `< log² p`** (§1.4): the sufficient row check is `g_i < log² P_i`,
   not `g_{i+1} ≤ log² P_i`. `PrimeGapLogSquareVerified` is now a named proposition.
8. **§7.1**: stated from its `ψ`-input. Mathlib's `|ψ − θ| ≤ 2√x log x` replaces Schoenfeld's (5.3*):
   at `e³⁰` the main term is `4.35·10⁸` against `1.96·10⁸`.
9. **§4.3**: Vanlalngaia's corollary no longer carries *MeisselMertensEnclosure* (unused: the
   finite range is stated with `B` itself).
10. *LeeNosalRange* is split: the `ψ`/`θ` ranges stay under that name, and the Mertens ranges
    become *LeeNosalMertensRange*.
11. §4.2's Check on Ramaré's thresholds: the `0.0067/log x` failure region is
    `[1 514 837, 1 514 844.90)`; the design gave the point `1 514 844`.
12. §2.5's Check claimed that none of the three RH intervals implies another. In fact the gap
    form of Carneiro–Milinovich–Soundararajan implies the other two for `x ≥ 5`.
13. Smaller fixes: `ZetaZeroReciprocalSum` is stated with multiplicity `analyticOrderNatAt`, and a
    finiteness Check was added (`M(10⁷) = 21 136 125.2`). The Downstream consumers section now
    maps ExplicitMultiplicativeFunctions' requests to the sections that supply them.
14. **Dusart 2016, Theorem 1.1 (§3.1(a), §3.3, `dusart_of_zeroFreeRegion`)**: the range is
    `X ≥ max(8.36, 8/R)`, not the printed `X ≥ max(8.36, 8R)` (`dusart-2016` line 79), which the
    design and the earlier package carried. The proof needs `e^{4X}/√x ≤ 1`, that is
    `4X ≤ RX²/2`, that is `X ≥ 8/R` (Lemma 3.4, line 471; the proof of the theorem, line 531), and
    Corollary 1.2 applies the theorem with `R = 5.69693` from `log x = 400` on (lines 576–580): with
    `8R` the theorem would start at `log x = 11 833.2`, leaving `[e⁴⁰⁰, e^{11 833}]` without a proof.
    The two forms are not comparable: for `R ≥ 1` the printed form asks more; for
    `0.7551 < R < 0.9569` (below `0.7551` the hypothesis is false) it asks less than the proof
    gives, so the earlier Lean statement asserted, at e.g. `R = 0.9` and `X ∈ [8.36, 8.889)`, a bound
    that the source does not prove. The README's statement, its two Checks built on `8R` (now: the
    point `log x = 400` lies in the range at `R = 5.69693`; the binding condition changes at
    `R = 8/8.36 = 0.9569`), §3.3's Corollary 1.2 route, and the Lean hypothesis
    (`max 8.36 (8 / R) ≤ √(log x / R)`) are corrected. The route's low-height input was re-read at
    Lemma 2.2 (lines 184–205): it needs `T₀ > 2π` with `N(T₀) = F(T₀)` and no zero off the line up
    to `T₀`, so `T₀ = 9.6769…` under "no zero up to height `14`" is valid, while the source itself
    uses `T₀ = 17.8478…` with the verification of the Riemann hypothesis to that height (line 534).

## Adversarial pass

Values come from a sieve to `2.1·10⁷` (to `3.5·10⁷` for the sums of primes), `li` by its
series (`li 2 = 1.0451637801`, `li 10⁹ = 50 849 234.96`, both matching published values), and
direct evaluation. In this round the Lean headlines were re-read against their sources:
`schoenfeld-1976` lines 20–28 and 98–100 (Theorem 10, Corollary 1: every clause and threshold of
`schoenfeld_of_riemannHypothesis` agrees), `buthe-2018` lines 73–85 (Theorem 2; recomputed:
`1426.47 − θ(1423) = 73.647 ≤ 73.649` but `1426.5 − θ(1423) = 73.677 > 73.650`, so (1.6) fails just
below `1427`), `carneiro-milinovich-soundararajan-2019` lines 261–273 (Theorem 5 and (1.15)),
`vanlalngaia-2017` lines 26–51 (Corollary 1: `4`, `2.3` from `1000`, `1` from `24 284`), and
`dusart-2016` lines 70–80, 184–205, 440–475, 525–580 (Theorem 1.1, Lemmas 2.2 and 3.4, Corollary
1.2), which gave item 14.

| Statement | Instances | Values | Result | Change |
| --- | --- | --- | --- | --- |
| `brun_titchmarsh` | `k=1,x=1.5,y=3`; `k=3,l=2,x=10,y=30`; `x=1.9,y=3.2`; `y=k`; 20 000 random + grid | `2 ≤ 5.46`; `4 ≤ 13.03`; constant 1: `3 > 2.75`, constant 2: `5.50`; `y = k` gives the junk value `0` against count `1`; worst count − bound `−2.35` | holds; `2` needed; `y > k` needed | new §0.1 |
| `liTwo`, `li` | series; `x = e, 10, 1.4` | `1.0451638`; `li e = 1.8951178`, `li 10 = 6.1656`; `li 1.4 < 0`; pin's `γ` bounds give `0.96 < li 2 < 1.14`, so `li ≠ Li` | agree with the supplier's `li` for `x > 1` | local copies |
| `riemannPrimeCount` | `x = 96.5, 97` | `27.533`, `28.533`; terms vanish for `k + 1 > log₂ x` | summable, finite | — |
| `RiemannHypothesisUpTo` | `H = 0`, `H < 0`, trivial zero `−2` | `RH(0)`: no real zero in `(0,1)` (true); vacuous for `H < 0`; `−2` excluded by `0 < Re s` | as intended | — |
| `ClassicalZeroFreeRegion` | `R ≤ 0.7551`; `R = 5.69693` | first zero `1/2 + 14.1347i` lies in the region iff `R ≤ 2/log 14.1347 = 0.7551`, so the hypothesis is false there; Kadiri's `5.69693` is a published region | vacuity only for impossible `R` | Check added |
| `DirichletGRH` | `χ₀ mod 2`; trivial character at `s = 1` | zero `2πi/log 2` has `Re = 0`, excluded; the pole is excluded by `χ ≠ 1 ∨ s ≠ 1` | as ANT-I §1.6 | copy |
| `ButheVerified` | each clause up to `2.1·10⁷` (π-clauses to `2·10⁵`) | (1.5) worst `−0.364` at 17; (1.6) **fails** at `1427⁻`: `74.18 > 73.66`; (1.7) holds; (1.8) worst `−0.103` at `7⁻`; (1.9) worst `−0.598` at `1423⁻`; (1.10) holds | printed `1423` false | threshold `1427` |
| `Buthe2016Range` | `59 < x < 5000` | ψ worst `−0.672` at 97; θ `−0.833` at 809; π* **fails** at `97⁻` (`1.939 > 1.793`), from 97 worst `−0.036`; π worst `−0.329` at `2659⁻` | π* from 97 | — |
| `Schoenfeld1976Range` | (6.2)–(6.4) to 1427; (5.1*)–(5.4*), (6.18), Thm 12 to `2.1·10⁷` | worst `−0.672` (97), `−0.833` (809); (5.2*) worst `−5.82` at 1 155 907; Thm 12: 0 failures; at `2 010 733` the gap ends at `2 010 881 > 2 010 733 + 121.15` | holds | ranges to 1427 |
| `LeeNosalRange` | `[101, 338]`, `[2657, 3382]`, and `100 ≤ x < 101`, `2650 ≤ x < 2657` | worst `−0.448` at 223, `−2.269` at 3299; below: `6.955 > 5.695` at `101⁻`, `97.75 > 94.12` at `2657⁻`; holds to `2.1·10⁷` | thresholds sharp | split |
| `ZetaZeroReciprocalSum` | main term at `T = 10⁷` | `(1/4π) log²(T/2π) = 16.2278` against `16.2106`; `M(10⁷) = 21 136 125.2`, Rosser's error `5.03` | finite, plausible | multiplicity |
| `PrimeGapLogSquareVerified` | `11 ≤ p ≤ 2.1·10⁷`; `p = 2, 3, 7` | 0 failures; gaps `1, 2, 4 ≥ 0.48, 1.21, 3.79` | `11` sharp | new name |
| `VanlalngaiaRange` | three constants to `2.1·10⁷` | worst `−8.2·10⁻⁴` (4), `−1.44·10⁻⁴` at 1327 (2.3), `−6.4·10⁻⁵` at 24 421 (1) | holds | — |
| `LamzouriLiSoundararajanRange` | every `3 < q ≤ 3000`, 124 moduli to 20 000; `q = 3` | max ratio `0.650` at `q = 4, a = 1, p = 5`; `q = 3`: `7 > 4.83` | holds; `q > 3` needed | — |
| `schoenfeld_of_riemannHypothesis` | `x = 100, 1000, 10⁴, 1426.9` | `5.955 < 8.44`; two-sided `θ` fails at 100 (`16.27`), consistent with 599; `3.33, 43.75 < 60.05`; `17.1 < 36.65`; `74.08 < 79.29` | holds, route covered | ranges |
| `leeNosal_of_riemannHypothesis` | `x = 101`; scan | `2.34 ≤ 5.695`; ratio to Schoenfeld `0.669`; worst `−0.448` on `[101, 2.1·10⁷]` | holds | — |
| `buthe_of_riemannHypothesisUpTo` | `T = 3.061·10¹⁰`; `x = 60`; `x = 5000` | `4.92 √(1.89·10²¹/48.99) = 3.056·10¹⁰`; `2.47 ≤ 5.17` with `RH(18.8)`; `1.870 ≥ 0.94`, `2.209 ≥ 1.95` | holds | route fixed |
| `carneiro_milinovich_soundararajan` | `x = 4, 7.5`; scan; `log x/√x` | `[4, 6.44] ∋ 5`; `[7.5, 12.36] ∋ 11`; 0 failures to `2.1·10⁷`; `≤ 2/e = 0.736 < 0.88` | holds | BT now §0.1 |
| `dusart_of_zeroFreeRegion` | `R = 5.69693` at `log x = 400, 398.16, 10⁴`; `R = 0.9`; `R = 0.7551`; `T₀` | `X = 8.379, 8.360, 41.90`, `ε_R = 1.060·10⁻³, 1.080·10⁻³, 6.59·10⁻¹⁸`, `8/R = 1.404` (printed `8R = 45.58`, i.e. `log x ≥ 11 833.2`, excludes Corollary 1.2's `log x = 400`); `R = 0.9`: `8/R = 8.889 > 8.36`, `log x ≥ 71.11`; first zero in the region iff `R ≤ 2/log 14.1347 = 0.7551`; `M(9.6769) = 0` | printed `8R` is a misprint for `8/R` | range `max 8.36 (8 / R)` |
| plan.json gap `explicit-brun-titchmarsh` | target 2.5's prerequisites; `supplier_gaps` | target 2.5 names `gap:explicit-brun-titchmarsh`; with `supplier = "none"` the plan's supplier gaps are the eleven on ExplicitZetaBounds | kept, owed by no supplier | supplier `none` |
| the eleven gap sentences | each formula against the earlier text | same constants and ranges (`6.4355`, `9.645908801`, `3.82`, `57.54`, `0.137/0.443/1.588`, `0.22737`, `965`, `51.5`, `11.499`, `2.067`, `0.059`), only the notation of products and exponents changed | mathematics unchanged | code spans |
| `vanlalngaia_sum_inv_prime` | transfer at `89 967 803`; `x = 10, 1000`; `k = 1` | `1/3 + 5/73.26 = 0.4016 ≤ 1`; `0.0807 ≤ 0.3276`; `0.0039 ≤ 0.0070`; `k = 1` integral diverges | holds | transfer form |
| `lamzouri_li_soundararajan` | `q = 4, 5, 10⁴` | `7.69` (5, 3); `41.4` (11, 2, 3, 19); `1.36·10⁹` against BS `1.7·10¹⁰` | holds | — |
| `schoenfeld_interval` | `e³⁰`; rows `b = 30, 22`; gap bound | `4.35·10⁸ > 1.96·10⁸`; `1.956·10⁻⁵ < 6.025·10⁻⁵`, `5.57·10⁻⁴ > 6.025·10⁻⁵`; `log²(4·10¹⁸) = 1834.6 < 6025` | holds | transfer form |
| Schoenfeld Thm 7* (5.6b*) | `x = e²²` | `0.94 √x = 5.6·10⁴` against `0.0077629 x/log x = 1.26·10⁶` | holds | added to §3.2 |
| Dusart 1999 route | `p_k = e⁵⁰⁰, e¹⁸⁰⁰` | `(log log k − 2.1454)/log k = 0.0082, 0.0030` against `0.0077629` | first range ends at `e⁵⁰⁰` | Check, source misprint |
| BS via LLS (§6.5) | `q = 2, 3` | `3 ≤ 3.84` (`3/(2 log 2)² = 1.561 > 1.56`); `7, 2 ≤ 21.7` | holds | route |
| Axler 2024 `π` bounds | upper `x ≥ 48`, 4-term `x ≥ 29.53` | worst `π − f`: `−8.69` at 1627, `−10.11` at 283 | holds to `3.5·10⁷` | — |
| Dusart `π` bounds | Théorème 1.10 (four), 2018 two-term | worst `−0.026`, `−0.242`, `−0.041`, `−0.024`; two-term from `88 789`: `−0.084`; from printed `88 783`: `+0.567` | `88 789` | — |
| Axler / Dusart intervals | `log³` (2024, 2018, 2016, Dusart), `log⁴` (2024, 2018) | 0 failures from the stated thresholds; one failure each just below `17 051 708`, `6 034 256`, `89 693` | sharp | — |
| Deléglise–Nicolas `π_r` | `π₂` four bounds, `π₃, π₄, π₅`; `x = 663` | all worst margins `≤ 0` (e.g. `π₃`: `−8·10⁻⁵` at 1627); `π₃(663) log 663/663⁴ = 0.27156 > 0.271` | holds; `664` sharp | — |
| Chirre–Helfgott `34.409 x/log⁴ x` | `[69 997, 2.1·10⁷]` | worst `−6.88` at `70 001⁻` | holds | — |
| *LeeNosalMertensRange* | `B` from 24.4, `E` from 43.1 | worst `−4.3·10⁻⁴` at `2.09·10⁷`; `−5.3·10⁻³` at 47 | holds | — |
| Ramaré 2013 corrected | five forms to `2.1·10⁷` | last failures at 113, `467 497⁻`, `[1 514 837, 1 514 844.90)`; `1.833/log² x` worst `−0.0064`; `1.31/√x` worst `−1.8·10⁻⁴` | holds | Check text |
| De Koninck–Letendre, Axler 2019, Robin, Axler 2019-`p_n` | `k ≤ 2·10⁶` | `−0.18` (k=5); `−1.49` (k=18); Thm 1.8 `−2788.5` at 1 897 700; Thm 1.9 `−49.4` at 3; Robin `−4.18` at 4; `11.508`-bound `−16.5` at 8 | holds | — |

## Elaboration

`lake env lean packages/ExplicitPrimeCounting/Suggested.lean`, run from the content checkout
(exit code 0): no errors, exactly **9** warnings, each `declaration uses 'sorry'` (lines 100, 205,
220, 228, 238, 251, 264, 281, 293), and no other message. The two `TauCeti.*` imports
(`TauCeti.Analysis.SpecialFunctions.LogIntegral`, `TauCeti.NumberTheory.LFunctions.Mertens`) had
their object files already built. `#check @name` audit: a scratch copy with `#check @` for all 24
declarations was elaborated once (exit code 0, 9 `sorry` warnings, no error). Each elaborated type
matches its README statement; `dusart_of_zeroFreeRegion` now reads
`max 8.36 (8 / R) ≤ √(log x / R)`. No declaration uses a section `variable` (the file has no
`variable` or `include`), so nothing was lost. Padding probe: the worker's probe recognises no
theorem of this file (it looks for `:=` followed by a bare `sorry`, and these end in `:= by`), so
a copy with `first | rfl | infer_instance | (simp) | sorry` in place of each `sorry` was
elaborated: six theorems still use `sorry`, and on the other three (`schoenfeld_of_riemannHypothesis`,
`dusart_of_zeroFreeRegion`, `vanlalngaia_sum_inv_prime`) `simp` makes progress and leaves the goal
open. No theorem closes with one tactic.

## Dependency check

```text
depcheck: 240 roadmaps, 2437 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. SpecialFunctionsEiLiErfIncompleteGamma, cited for `li`, is
another author's open pull request that adds a new roadmap folder (allowed by the brief). It is not
in the merge order, and the check does not place it. When it enters the order it must come before
ExplicitPrimeCounting; this belongs in the merge-order paragraph of the pull request.

## Citations and ownership

- `roadmaps resolve` on the final README: no cross-roadmap citation and no Lean name found
  nowhere; it reports that it did not check names outside `TauCetiRoadmap` against the pinned
  packages, so a script checked the 77 Mathlib and Tau Ceti names of the README against the pinned
  sources: all exist except `TauCeti.Real.principalLogIntegral`, the name SpecialFunctionsEiLiErfIncompleteGamma
  §8.2 plans. The worker's run on the design README raised `SieveDistribution.primeCountAP` and
  `theta_ap.sum_classes`; an earlier run on this package raised three leads:
  - `SieveDistribution.primeCountAP` is SieveMethodsAndPrimePatterns' README name.
  - `TauCeti.Real.principalLogIntegral` is SpecialFunctionsEiLiErfIncompleteGamma's intended name.
  - `theta_ap.sum_classes` is AnalyticNumberTheoryPartI's README API name.

  All three are supplier names, attributed in the README; none is ours.
- `roadmaps overlaps`: no pull request changes this roadmap, and no cited id is dropped. Closest
  in vocabulary: AnalyticNumberTheoryPartI, CircleMethodThreePrimes and ErdosProgressionPowers
  (none owns an explicit prime bound), and two revisions of ZerosOfLFunctions (no cited id dropped).
- Every cross-roadmap citation was checked, the open ones at the heads of the 2026-11-07 index:
  - ZerosOfLFunctions (main): §§4.1, 4.5, 5.6, 6.2–6.4, 8.3–8.7, 8.9, Layer 9.
  - AnalyticNumberTheoryPartI (head): §§0.2, 0.3, 0.5, 0.8, 0.16, 0.19, 0.25, 0.30, 0.32, 0.34,
    1.6, 1.9.
  - ComputationalNumberTheory: §§4.17a, 4.22, 4.24.
  - SieveMethodsAndPrimePatterns: §§2.9, 3.1.
  - EffectiveClassNumbers: §4.4.
  - ClassicalArithmeticCompletion (main): §6.34.
  - SpecialFunctionsEiLiErfIncompleteGamma: §§8.2–8.4.
  - ExplicitZetaBounds (board target): targets 8, 9, 10, 16, 17, 18, 19, 20.
- Gate identifier rule, checked by script: every backticked name of this roadmap's own is declared
  in `Suggested.lean`, and every Lean name appears in the README.

## Sources

- Added `montgomery-vaughan-1973` (Theorem 2; Wiley paywall, HTTP 403) as `uncertified`, by
  locator.
- Added `tmeemt-art14` (certified, institutional), the readable page that quotes Montgomery–Vaughan's
  statement with its hypotheses (lines 82–87).
- `sources check`: 0 problems.
- No text is requested: the service's temporary `needs-references.toml` entry for
  Montgomery–Vaughan was removed, since the statement is carried by `tmeemt-art14`.

## Source issues

- **Error** in buthe-2018 at Theorem 2, (1.6) (line 75): the source says `x − ϑ(x) ≤ 1.95√x` for
  `1423 ≤ x`; it should say `1427 ≤ x`, because the inequality fails on `1426.47 < x < 1427`
  (`θ(1423) = 1352.8227`). It affects a stated result.
- **Misprint** in dusart-2016 at Theorem 1.1 (line 79): the source says the bound holds for
  `X ≥ max(8.36, 8R)`; it should say `X ≥ max(8.36, 8/R)`, the condition its proof uses (Lemma 3.4,
  line 471, and line 531) and the one under which Corollary 1.2 applies the theorem from
  `log x = 400` (lines 576–580). It affects a stated result.
- **Misprint** in dusart-1999-mc at the proof of Theorem 3 (lines 131–132): the source says the
  minimum over `10¹¹ ≤ p_k ≤ exp(1800)` exceeds `c = 0.0077629`; it should say `exp(500)`, the range
  of the bullet, since the ratio is `0.0030 < c` at `exp(1800)`. It affects nothing, because the
  next bullets cover that range.
- The issues recorded in the repair round stay. They concern trudgian-2016 (`2 898 242`),
  robin-1983 (`8602`), buthe-2016 (`π*` from 97), ramare-2016 (leading constant),
  bach-sorenson-1996 (`1.56` at `q = 2`), johnston-yang-2023 (eq. (1.9)) and schoenfeld-1976 (the
  Note Added in Proof).

## Suspicious text

None. No issue text, pull request, fetched page or source contained instructions.
