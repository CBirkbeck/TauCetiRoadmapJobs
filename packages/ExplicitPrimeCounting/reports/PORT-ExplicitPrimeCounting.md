# Port report: ExplicitPrimeCounting

- Branch: `roadmap/explicit-prime-counting`, from `eaf17b1`.
- Head commit: `98329b35` "ExplicitPrimeCounting: roadmap (README, Suggested.lean, metadata)".
- Files: `TauCetiRoadmap/ExplicitPrimeCounting/README.md`, `TauCetiRoadmap/ExplicitPrimeCounting/Suggested.lean`,
  `TauCetiRoadmap/ExplicitPrimeCounting/metadata.toml` (`topic = "math.NT"`, the same shape as
  `TauCetiRoadmap/ZerosOfLFunctions/metadata.toml`). Nothing outside the folder changed.

## Build

`lake build TauCetiRoadmap.ExplicitPrimeCounting.Suggested`:

```text
Build completed successfully (18650 jobs).
```

11 warnings, every one `declaration uses 'sorry'` (the 11 theorems); no other message.

## Gate

```text
gate ExplicitPrimeCounting: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

## Dependency check

```text
depcheck: 240 roadmaps, 2437 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line.

## Draft pull request body

This roadmap develops the numerically explicit theory of the distribution of primes on Mathlib's
`Chebyshev.psi`, `Chebyshev.theta`, `Nat.primeCounting` and `Nat.nth Nat.Prime` and on Tau Ceti's
`TauCeti.Real.logIntegral` and `TauCeti.LFunctions.mertensConstant`. It builds the exact transfer
identities between `ψ`, `θ`, `π` and `Li`/`li`, Montgomery–Vaughan's Brun–Titchmarsh inequality
with the constant `2`, and general theorems that turn a zero-free region, a height of verified
zeros, an explicit zero count and a zero density into a bound `|ψ(x) − x| ≤ ε(x) x` with `ε`
explicit in those parameters; the published constants (Rosser–Schoenfeld, Schoenfeld, Dusart,
Faber–Kadiri, Trudgian, Platt–Trudgian, Broadbent–Kadiri–Lumley–Ng–Wilk, Johnston–Yang,
Fiori–Kadiri–Swidinsky, Axler, Büthe, Johnston, Lee–Nosal, Ramaré–Rumely,
Bennett–Martin–O'Bryant–Rechnitzer, Kadiri–Lumley, Cully-Hugill–Lee) are instances, and from them
come explicit bounds for `π(x)`, the `n`-th prime, the Mertens sums, sums of prime powers, primes in
progressions and short intervals containing a prime. Every computation a source relies on (a
verified height of zeros, a finite-range check, a table of constants) is a named proposition with
its data in the statement and appears in the signature of each theorem that uses it, so the
roadmap separates the mathematics to be formalised from the numerical record. `Suggested.lean`
states eleven headlines against the pins: Brun–Titchmarsh; Schoenfeld's, Lee–Nosal's (`ψ` and `θ`)
and Carneiro–Milinovich–Soundararajan's theorems under the Riemann hypothesis; Büthe's and
Johnston's bounds from the Riemann hypothesis to a height; Dusart's bound from a zero-free region
alone; Vanlalngaia's explicit second theorem of Mertens; Lamzouri–Li–Soundararajan's least prime
in a progression under GRH; and Schoenfeld's prime in `(x, x + x/16597)`. The headlines whose
routes pass through a table of constants on a general error function are named in its docstring
with what they lack.

## Dependencies that are still pull requests

- AnalyticNumberTheoryPartI (in the merge order before this roadmap): §§0.2, 0.3, 0.5, 0.8, 0.16,
  0.19, 0.20, 0.25, 0.30, 0.32, 0.34, 1.6, 1.9, checked at its head.
- SieveMethodsAndPrimePatterns (in the merge order before): §2.9 (the forbidden-residue large sieve
  with `H − 1 + Q²`), §3.1 `SieveDistribution.primeCountAP`.
- ComputationalNumberTheory (in the merge order before): §§4.17a, 4.22, 4.24.
- EffectiveClassNumbers (in the merge order before): §4.4.
- SpecialFunctionsEiLiErfIncompleteGamma (another author's pull request adding a new roadmap
  folder; not in the merge order): §§8.2–8.4, the unoffset `li`. When it enters the order it must
  come before ExplicitPrimeCounting.
- ExplicitZetaBounds (line 270 of the merge order, before this roadmap at 271) has no README on
  main or in a pull request yet; it is a design-stage board target. It is cited only through the
  eleven gap sentences of the supplier contracts (`gap:rh-up-to-height` and the others), whose
  required locations (targets 8, 9, 10, 16, 17, 18, 19, 20) match its target catalogue.

No cited id is dropped by an open pull request, and no id cited here is defined only by an open
revision (`roadmaps overlaps`: none); in particular the two open revisions of ZerosOfLFunctions
drop none of the sections cited (§§4.1, 4.5, 5.6, 6.2–6.4, 7.4, 8.3–8.7, 8.9, Layers 0 and 9, read
on main).

## What moved from the Lean to the README, and what was added

- `DirichletGRH` (a copy of AnalyticNumberTheoryPartI §1.6's proposition with the same body) is no
  longer declared: its body is written out in the hypothesis `hGRH` of `lamzouri_li_soundararajan`,
  whose docstring and README §6.5 cite the owner. The README's supplier contract says so.
- Added `leeNosal_theta_of_riemannHypothesis`: the `θ` half of Lee–Nosal's headline (Theorem 1.2,
  (3), stated in their abstract), statable at the pins with the paper's input (24),
  `ψ(t) − θ(t) < (1 + 1.93378·10⁻⁸) √t + 1.04320 t^{1/3}` for `t ≥ e⁴⁰`, written out.
- Added `johnston_of_riemannHypothesisUpTo`: Johnston's Theorem 3.2, an end theorem of the
  Summary, statable with the carriers already in the file. Reading the source showed that its proof
  starts from Büthe's range at the verified height `3·10¹²` (Proposition 3.1 there), so the theorem
  carries `RiemannHypothesisUpTo 3000175332800` besides `RiemannHypothesisUpTo T`; the README's
  "under the same hypotheses" was wrong for general `T` and now says this.
- Nothing else moved: every other declaration is a headline or one of the four simple carriers
  (`liTwo`, `li`, `riemannPrimeCount`, `primeReciprocalSum`) or one of the computational
  propositions the headlines need.

`#check @name` audit: a scratch copy of the file with `#check @` for all 25 declarations was
elaborated once with `lake env lean`; the two `#check`s of `Buthe2016Range` and
`Schoenfeld1976Range` failed only because the scratch script truncated their names at the digits,
and their types are the `Prop` definitions read off the file. Every elaborated type matches its
README statement; the file has no `variable` or `include`, so no binder was lost. The changes were
the three listed above.

## Supplier replacements and duplication removals

- **ClassicalArithmeticCompletion §6.34 `dyadicPrimeCount`** (on main): the README restated it as
  the lower half of Rosser–Schoenfeld's Corollary 3 in §3.5. §3.5 now states only the upper half
  `0 < π(2x) − π(x) < 7x/(5 log x)` for `x > 1`; the lower half is recorded once, in "Not owned
  here". The supplier subsection for ClassicalArithmeticCompletion and its `*Needs:*`/Dependencies
  entries were deleted (nothing here consumes it), and the Check on the threshold `41/2` (a Check of
  that roadmap's statement) was replaced by Checks of the upper half.
- `DirichletGRH`: see above.
- The `li` of SpecialFunctionsEiLiErfIncompleteGamma §8.2 stays as the local carriers `liTwo` and
  `li`, needed for statability (a pull request cannot be imported); their fully qualified names
  differ from that roadmap's `TauCetiRoadmap.SpecialFunctionsEiLiErfIncompleteGamma.Real.principalLogIntegral`.
- Duplication sweep by object (main and every open roadmap pull request through `roadmaps grep`,
  plus the pinned Mathlib and Tau Ceti): Brun–Titchmarsh (SieveMethodsAndPrimePatterns has only
  `SieveApplications.progression_upper` with `∃ C`; AnalyticNumberTheoryPartI only cites Shiu),
  `1.03883`, Dusart, Büthe, Lamzouri, Bach–Sorenson, Carneiro, `16597`, Vanlalngaia, Meissel,
  Cipolla, Ramaré–Rumely, Bennett–Martin, Kadiri, Trudgian, Axler, principal-value `li`, Riemann's
  weighted count. ErdosProgressionPowers (19 hits on Schoenfeld) only requests
  AnalyticNumberTheoryPartI's finite-range inputs as gaps, which this roadmap proves from its own
  hypotheses (§§3.2, 3.5, 4.3, 6.1) and does not restate. Apart from `dyadicPrimeCount`, no other
  owner of an explicit prime bound exists.
- Six references cited nowhere in the body were deleted from the References (`dusart-1999-cr`,
  `platt-ramare-2017`, `deleglise-nicolas-2019-rh`, `platt-2011-thesis`, `young-potler-1989`,
  `deleglise-rivat-1996`).

## Fixes made on the upstream-reviewer reading

1. **Lee–Nosal's theorem numbers** (§2.2, the Lean docstring): the bound for `x ≥ 101` is Theorem
   1.2, (2) of arXiv 2312.05628v4, not Theorem 1.1; Theorem 1.1 is the `log log` form for `x ≥ 11`;
   the `θ` bound is (3). Read from the arXiv text, which also confirms display (10)
   (`ω₁ = 16.2106480369`), (11), the input (24) and Büthe's role below `10¹⁹`.
2. **Johnston's theorem** needed the verified height `3·10¹²` (above).
3. **A false Check in §3.5**: "`x/log x < π(x)` holds for `11 ≤ x ≤ 17`" is wrong; it fails on
   `[12.7132, 13)` and on `[16.9989, 17)` (`x/log x = 6` at `x = 16.99889` while `π(x) = 6`). The
   Check now records both failures as negative controls for the threshold `17`.
4. **Digits**: `π(113) log 113/113 = 1.2550587…` (was `1.2550594…`, and `1.25506…` in the
   Examples); Treviño's bracket at `x = 10⁴` is `[5 670 868, 5 818 257]` (was `[5 670 860,
   5 818 254]`).
5. **`RH(0)` Check**: it says no real zero in `(0, 1)` other than possibly `1/2` (the earlier text
   omitted the exception); true because `ζ < 0` on `(0, 1)`.
6. **An unverifiable claim removed**: "the paper's later corrigendum does not concern it" (§6.5).
7. **`E`** is now defined where first used (the limit of `∑_{p ≤ x} (log p)/p − log x`, `−1.33258…`);
   AnalyticNumberTheoryPartI §0.8 states it only existentially.
8. **Process wording removed**: "the sources manifest", "the sources service", "tables outside the
   manifest", "the locator of the manifest", "uncertified", "waived", "the extraction"; the
   References introduction now explains the `<id> line N` locators and the markers *preprint* and
   *cited by locator*. The title is shortened to `# Roadmap: explicit prime counting`, the subtitle
   being the Summary's content.
9. Explicit locator for the dyadic upper half (`rosser-schoenfeld-1962` lines 210–212); Summary
   updated for the two added headlines.

## Adversarial pass

Values from a sieve to `2.2·10⁶` (to `2·10⁵` for the random tests), `li` by its series, and the
sources' texts. Rows marked "package" re-use the package's sieve to `2.1·10⁷` where my range is
smaller; every other value was recomputed here.

| Statement | Instances | Values | Result | Change |
| --- | --- | --- | --- | --- |
| `brun_titchmarsh` | 20 000 random `k ≤ 60`, `x ≤ 1.5·10⁵`, `k < y ≤ 50k`; `k = 1, x = 1.9, y = 3.2`; `y = k = 1, x = 1.5` | worst count − bound `−3.69`; `3 ≤ 5.50`, with constant `1`: `3 > 2.75`; RHS junk `0` against count `1` | holds; `2` and `y > k` needed; `l = 0` forces `k = 1`, harmless | — |
| `liTwo`, `li` | series; `x = 1.4, e, 10, 10⁴` | `li 2 = 1.0451637801`; `li 1.4 = −0.1450`; `li e = 1.8951178164`; `li 10 = 6.1656`; `li 10⁴ = 1246.137` | agree with the owner's `li` for `x > 1`; junk `liTwo` for `x ≤ 1` never used | — |
| `riemannPrimeCount` | `x = 96.999, 97` | `27.5333`, `28.5333`; terms vanish once `x^{1/k} < 2` | finite sum | — |
| `RiemannHypothesisUpTo` | `H = 0`, `H < 0`, `s = −2` | real zeros in `(0,1)`: none (`ζ(1/2) = −1.4604`); vacuous; excluded by `0 < Re s` | as intended | Check wording |
| `ClassicalZeroFreeRegion` | first zero `1/2 + 14.1347i` | in the region iff `R ≤ 2/log 14.1347 = 0.75511` | hypothesis false only for impossible `R` | — |
| `ButheVerified` | (1.6) at `1426.47, 1426.5, 1427`; (1.7) at every prime `≤ 2·10⁵`; (1.8)–(1.10) at `x = 2` | `73.647 ≤ 73.649`; `73.677 > 73.650` (printed `1423` fails); `66.91 ≤ 73.66`; no failure; `|li 2 − 1| = 0.045 < 2.04`, `li 2 − 1 > 0` | threshold `1427` | — |
| `Buthe2016Range`, π* clause | `x = 96.2, 96.3, 96.999, 97` | `1.764 ≤ 1.782`; `1.786 > 1.783`; `1.939 > 1.793`; `0.939 ≤ 1.793` | printed `x > 59` fails on `(96.29, 97)` | — |
| `Schoenfeld1976Range` | source lines 20–28, 98–100, 668–669, 729–733; Thm 12 at `2 010 760`, `2 010 750` | thresholds `73.2, 599, 59, 0, 2657, 3/2, 1 155 901, 121, 2 010 759.9` as printed; next prime `2 010 881 < 2 010 881.152`; `2 010 871.15 < 2 010 881` (gap after `2 010 733`) | holds; threshold sharp | — |
| `schoenfeld_of_riemannHypothesis` | `x = 100, 1000, 10⁴` | `|ψ−x| = 5.955 < 8.44`, `|θ−x| = 16.27 > 8.44` (θ needs `599`); `3.32`, `43.75 < 60.05`; `li − π = 17.14 < 36.65` | holds | — |
| `leeNosal_of_riemannHypothesis` | `x = 101`, `x → 101⁻` | `2.340 ≤ 5.695`; `6.954 > 5.695` | `101` sharp | locator Thm 1.2 (2) |
| `leeNosal_theta_of_riemannHypothesis` (new) | `x = 2657`, `2656.99`; source (24) | `89.86 ≤ 94.12`; `97.74 > 94.12`; (24) with `α₁ = 1 + 1.93378·10⁻⁸`, `α₂ = 1.04320` from `e⁴⁰` | `2657` sharp; input as printed | added |
| `ZetaZeroReciprocalSum` | main term at `T = 10⁷` | one-sided `(1/4π) log²(T/2π) = 16.228` against `16.2106`; both signs about `32.4`; display (10) prints `0 < |γ| ≤ 10⁷` with value `16.2106480369` | one-sided reading forced by the value | — |
| `PrimeGapLogSquareVerified` | `p = 2, 3, 7, 11` | gaps `1, 2, 4, 2` against `log² p = 0.48, 1.21, 3.79, 5.75` | `11` sharp; to `2.1·10⁷` (package) no failure | — |
| `buthe_of_riemannHypothesisUpTo` | `x = 60`; source lines 688–705 | `|ψ(60) − 60| = 2.467 ≤ 5.167`, needs `T ≥ 18.8`; thresholds `59, 599, 59, 2657` printed | holds with `π*` from `97` | — |
| `johnston_of_riemannHypothesisUpTo` (new) | `T = 3 000 175 332 800`; `x = 1.101·10²⁶, 1.102·10²⁶`; Büthe at `2.169·10²⁵`; crossing; `x = 59` | `2.99888·10¹² ≤ T`, `3.00021·10¹² > T`; `2.99996·10¹² ≤ T`; criteria cross at `x = 547.72`; `log log 59 = 1.406 > 0` | Corollary 3.3 reproduced; for `x ≤ e` the condition is junk-true but every clause needs `x > 59` | added, with `RH(3·10¹²)` |
| `carneiro_milinovich_soundararajan` | `x = 4, 7.5`; `log x/√x` | `[4, 6.440] ∋ 5`; `[7.5, 12.356] ∋ 11`; `≤ 2/e = 0.736 < 0.88`; source lines 261–273 | holds | — |
| `dusart_of_zeroFreeRegion` | `R = 5.69693` at `log x = 400`; printed `8R`; `T₀` | `X = 8.379 ≥ max(8.36, 1.404)`; `8R = 45.58` would need `log x ≥ 11 833.2`; `F(9.6769) = −5·10⁻⁷ ≈ 0 = N`, `F(17.8478) = 0.99999 = N` (source's `T₀`); proof uses `8/R` (lines 471, 531) | `8/R` is the proved range | — |
| `vanlalngaia_sum_inv_prime` | `x = 2, 10, 1000`; transfer at `89 967 803` | `0.605 ≤ 12.01`; `0.0807 ≤ 0.3276`; `0.0039 ≤ 0.0070`; `log x = 18.315`, `1/3 + 5/(4 log x) = 0.4016 ≤ 1` | holds | — |
| `lamzouri_li_soundararajan` | `q = 3, 4, 5`; source (arXiv 1309.3595) Cor. 1.2, §4.3 | `7 > (2 log 3)² = 4.83`; `5, 3 ≤ 7.69`; `11, 2, 3, 19 ≤ 41.44`; "`q > 3`", "checked … when `q ≤ 20000`" | holds; `q > 3` needed | `DirichletGRH` inlined |
| `schoenfeld_interval` | `x = e³⁰` | `(1/16598 − 2ε − ε/16598) x = 4.348·10⁸` against `2 √(x+h) log(x+h) = 1.961·10⁸` | holds | — |
| §3.5 RS Corollary 1 Check | `x ∈ [2, 17]` step `5·10⁻⁴` | fails on `[2, 7]`, `[8.6135, 11)`, `[12.7132, 13)`, `[16.9989, 17)` | old Check false | Check rewritten |
| §3.5 dyadic upper half | `x ∈ (1, 1000]` | max of `(π(2x) − π(x)) log x/x` is `0.9996` at `x = 56.5` (`14` against `19.61`) | holds | replaces the `dyadicPrimeCount` Check |
| §3.5 RS Theorem 1 bridge | `x = 59, 58` | `16.24 < 17 < 19.79`; `16.04 > 16` | `59` sharp | — |
| §5.3 Robin's printed range | `k = 7022, 8601, 8602` | `70 919 > 70 918.61`; `88 807 > 88 805.00`; `88 811 < 88 816.44` | `8602` | — |
| §4.2–4.3, §4.7 values | `x = 10, 100, 1000` | `∑ Λ(n)/n = 1.69465` vs `1.72537`; `∑ 1/p − log log 100 − B = 0.01414`; `∑ (log p)/p − log 100 − E = 0.09688`; `∑_{p ≤ 1000} 1/p = 2.19808` | agree with the Checks | — |
| §0.3, §3.2 values | `x = 113, 121, 120.9, 17` | `ψ(113)/113 = 1.0388206`; `ψ − θ = 12.715`, `10.317`; `ψ(17) = 16.321` | agree | — |

Context and generality: the file has no `variable`, `include` or `open … in` that could hide a
binder; every hypothesis is in its declaration's signature, and each README statement has the
Lean's generality (checked line by line against the `#check` output).

## Unresolved

- `lee-nosal-2026`, `johnston-2022`, `lamzouri-li-soundararajan-2015` carry no line-numbered text
  in the package's source list (status uncertified there). For this port I read their arXiv texts
  (2312.05628v4, 2109.02249v2, 1309.3595) online, and the README cites them by theorem number; the
  worker may want to attach those texts to the source records.
- The accepted review named in the brief (`review.json`) is not in the package folder; the
  package's own report and the design review report were used, and the package report's decisions
  are kept.
- Ownership against open pull requests was checked for the open roadmaps whose heads the tools
  give (all 472 through `roadmaps grep`, and the brief's sibling checkouts); ExplicitZetaBounds,
  ExplicitCharacterSumsAndSieves and ExplicitMultiplicativeFunctions exist only as board targets.

## Suspicious text

None. No source, pull request or roadmap text contained instructions.


Pull request: #1945 (roadmap/explicit-prime-counting at 98329b3)
