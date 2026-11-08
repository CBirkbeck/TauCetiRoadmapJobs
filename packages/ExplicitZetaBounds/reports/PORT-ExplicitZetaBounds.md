# PORT-ExplicitZetaBounds

- Branch: `roadmap/explicit-zeta-bounds`, from `3b3f7ef` (main).
- Head commit: `d7f47a11` "ExplicitZetaBounds: roadmap (README, Suggested.lean, metadata)".
- Files: `TauCetiRoadmap/ExplicitZetaBounds/README.md` (2411 lines), `TauCetiRoadmap/ExplicitZetaBounds/Suggested.lean` (328 lines),
  `TauCetiRoadmap/ExplicitZetaBounds/metadata.toml` (`topic = "math.NT"`, as ZerosOfLFunctions and LFunctions on main). Nothing
  outside the folder changed.

## Build and gate

`lake build TauCetiRoadmap.ExplicitZetaBounds.Suggested`:

    Build completed successfully (18239 jobs).

20 warnings, all `declaration uses 'sorry'` (one per theorem); no other warning, no error. The file starts with `module` and
`import Mathlib` (as the package had, and as eleven `Suggested.lean` files on main start): without `module` Lean adds the warning
"imports `Mathlib` ... consider adding `module`", so the line is what keeps `sorry` the only warning.

Gate (`gate <worktree> ExplicitZetaBounds --base origin/main`, on the committed head):

    gate ExplicitZetaBounds: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK

Dependency direction (`gate --depcheck ... --movable --content <content checkout>`), on the committed README:

    depcheck: 244 roadmaps, 2462 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line. `roadmaps resolve TauCetiRoadmap/ExplicitZetaBounds/README.md` (main `3b3f7ef`, 476 heads):
no cross-roadmap citation and no Lean name found nowhere. The three leads of the worker's `citations.md`
(`gammaRemainder.slit_logGamma`, `SieveTaper.sharp_additive_largeSieve`, `SieveApplications.sharp_primitive_largeSieve`) are
names planned by AnalyticNumberTheoryPartI §0.23a and SieveMethodsAndPrimePatterns §2.9; both were read at their heads.

## Draft pull request body

This roadmap is the numerically explicit layer of analytic number theory above ZerosOfLFunctions, which proves the shapes of
convexity, zero counting and zero-free regions with existential constants and leaves decimal constants out of scope. On
Mathlib's `riemannZeta`, `DirichletCharacter.LFunction` and `Complex.Gamma` and the analytic records of LFunctions, it builds the
explicit error calculus, bounded-height Riemann hypotheses with the bridge to Platt's finite-conductor theorem, Stirling's series
with explicit remainders and the two-sided bound for `|Γ|`, the explicit Phragmén–Lindelöf principle and Rademacher's convexity
bound, the van der Corput toolkit and Ford's explicit Vinogradov mean value theorem with the Richert-type bounds, explicit
Riemann–von Mangoldt formulas for `ζ` and `L(s, χ)`, smoothed Perron formulas, mean values and weighted large sieves, and the
zero-free regions, real-zero bounds, zero densities and `L(1, χ)` bounds of the literature with their published constants.
The end theorems are statements with literal constants (`ζ(σ + it) ≠ 0` for `σ ≥ 1 − 1/(5.558691 log |t|)` given the
verification of the Riemann hypothesis to `3·10¹²`; `|N(T) − (T/2π) log(T/2πe)| ≤ 0.10076 log T + 0.24460 log log T + 8.08344`;
`|ζ(1/2 + it)| ≤ 0.618 t^{1/6} log t`), which the explicit prime-counting, multiplicative-function, character-sum and
number-field roadmaps consume. Computations enter only as recorded verifications of the Riemann hypothesis, taken as explicit
hypotheses, or as named certificates; no algorithm is a target. `Suggested.lean` states twenty headline theorems against the
pinned Mathlib.

AI assistance: Claude (Opus 5.5) performed the port, the source, supplier and ownership checks, the computed mathematical
self-review and the Lean signature validation.

## Dependencies still in pull requests

New-roadmap suppliers, cited by name and section, read at their heads:

- AnalyticNumberTheoryPartI (§§0.23a, 0.34, 0.34a, 1.5, 1.5a, 1.6; §§0.9, 1.7 and 3.23 are cited as not owned here).
- AsymptoticExpansions (§13.1 `sum_Icc_eq_eulerMaclaurin`, Layer 5): another author's new roadmap, not in `ORDER.txt`; the gate
  accepts it, and the merge-order paragraph should name it.
- ComputationalNumberTheory (§§4.22 `platt_bounded_height`, 4.24).
- SieveMethodsAndPrimePatterns (§§2.6, 2.9).

AnalyticNumberTheoryPartII is cited only in "Not owned here" (§4.3a). On main: LFunctions (Layers 0, 3, 4), ZerosOfLFunctions
(Layers 0, 1.1, 1.4, 1.6, 3.4, 4.3, 4.5, 5.5–5.6, 6.3, 6.4d, 6.5, 7.1–7.4, 9), Completed/ArithmeticDirichletSeries (§§6.3–6.4).
No cited id is defined only by an open revision; `roadmaps overlaps` lists no pull request that drops an id cited here (the two
open ZerosOfLFunctions revisions drop none).

## What moved from the Lean to the README

Nothing: the package's file had no padding (fifteen headline theorems and the five definitions they need). The changes go the
other way:

- **Added headline theorems**, statable at the pins and named in the Summary but missing: `norm_riemannZeta_one_add_le` (4.8,
  Patel and Hiary–Leong–Yang on the line one), `riemannZeta_ne_zero_littlewood` (7.4, Yang's region, given
  `RiemannHypothesisUpTo 545439823`), `LFunction_real_zero_le_bordignon` (7.7, Bordignon 2019's three bounds),
  `inv_norm_riemannZeta_one_add_le` (7.10, given `RiemannHypothesisUpTo 545439823`), `zetaZeroDensityCount_le_bellotti` (8.5,
  given `RiemannHypothesisUpTo (3 * 10 ^ 12)`). Each statement was read at its source (`hiaryleongyang2025` lines 31–43,
  `patel2022` lines 61–64, `yang2024` lines 88–89 and 2328–2333, `bordignon2019` lines 63–71, `bellotti2025density` lines 91–101).
  The README names each at its target.
- **`LFunction_zeroFree_mcCurley`** now takes `RiemannHypothesisUpTo (3 * 10 ^ 12)` (see fix 3 below).
- Declarations reordered into README order under the README's layer titles; the module docstring lists the recorded
  verifications each theorem takes and says which statable targets are README targets and why (inputs to the stated theorems,
  other constants for the same quantities, and the family densities 8.2 and 8.4).
- Kept as README targets, not stated: Bordignon 2020's even bound (publication status not established) and the instances on
  unrefereed preprints (7.3 `R₀ = 4.896`, 7.9 uncapped), as the package decided.

Signature check: all 25 declarations were `#check @`-ed in one temporary build of the final file (then removed); each elaborated
type matches its README statement. The real exponents are `rpow` (`((1 : ℝ) / 6)`, `((3 : ℝ) / 2)`, `((16 : ℝ) / 5)`), every
hypothesis is an explicit binder (no `variable` block), and the new `hRH` binder of `LFunction_zeroFree_mcCurley` is present.
A first `#check` build also resolved every Mathlib name the README cites (about 100, including `Real.cot`,
`Fourier.fourierIntegral`, `Matrix.IsHermitian.eigenvalues`, `MeromorphicOn.circleAverage_log_norm`,
`Complex.borelCaratheodory`, `DirichletCharacter.IsPrimitive.completedLFunction_one_sub`); the nine Tau Ceti names were opened at
the pin `2fd255d` (`NonnegCombination.lean` 48, 58, 66, 83; `ThreeFourOne.lean` 99; `Perron/Basic.lean` 142, 204;
`Perron/Formula.lean` 130, 229).

## Supplier replacements and duplication removals

No replacement or removal: every supplier contract of the package resolves at the pin or at the supplier's head, and the sweep
by object found no earlier owner of anything owned here.

- **Pins.** Mathlib at `1b1ccf4` has Stirling only for factorials (`Stirling.le_factorial_stirling`), no complex `log Γ`
  remainder, no digamma or polygamma bounds, no Euler–Maclaurin, no Kusmin–Landau or derivative test and no Vinogradov mean
  value theorem; Tau Ceti at `2fd255d` has none of these either.
- **Earlier roadmaps.** ZerosOfLFunctions 1.2–1.4 are the `O`-forms of Stirling and digamma (not explicit);
  AnalyticNumberTheoryPartI §0.9 (`L(1, χ) ≥ c/log q`, effective) and §1.7 (log-free density with `C_ε`) are the existential
  forms of 9.3 and 8.2/8.4: now named under "Not owned here".
- **Later roadmaps that state the same objects** (this roadmap is earlier in `ORDER.txt`, 270, and keeps them; their revisions
  are theirs): ExplicitCharacterSumsAndSieves (272) states Kusmin–Landau, the derivative tests and the iterated van der Corput
  inequality in its Layers 0–1 and plans the B-process, Yang's recursive `k`-th derivative test and the Montgomery–Vaughan
  weighted large sieve for its Part II (its README lines 24–26, 101–107, 132): they are 4.1–4.5 and 6.5 here.
  ExplicitPrimeCounting (271) defines `RiemannHypothesisUpTo`, `GRH(q, H)` and the capped real-zero gap in its §§1.1, 1.2, 1.7:
  they are 0.2 and 7.9 here. ProbabilisticAndMetricNumberTheory's "Kuzmin" is Gauss–Kuzmin, not Kusmin–Landau.
- No declaration of `Suggested.lean` shares a fully qualified name with a declaration of a readable roadmap
  (`ExplicitPrimeCounting` declares its own namespace).

Ownership against open pull requests was checked for every open roadmap pull request with `roadmaps grep` and `roadmaps show`.

## Fixes a mathematician would flag (README)

1. **0.3, Platt's range.** The package had `1 ≤ q ≤ 400 000`. Platt's computation excludes `q = 1`: the primitive characters of
   modulus `q ≤ 400 000` number 29 565 923 838 including the one modulo `1` (computed), and `platt2016grh` line 952 checks
   29 565 923 837 L-functions. With `1 ≤ q`, 0.3 would make `RH(10⁸)` a theorem, against the Conventions (recorded verifications
   are hypotheses). Now `2 ≤ q`, with the count as a Check.
2. **7.2, 7.4, 7.10: a recorded verification used without being a hypothesis.** Ford's Theorems 3–4 use the zeros below
   `5.45·10⁸` (`ford2002zerofree` lines 324, 1272), Yang's Corollary 1.2 uses them for `3 ≤ t ≤ 5.45·10⁸` (`yang2024`
   lines 2328–2333), and Hiary–Leong–Yang's Theorem 2 uses Yang's region (`hiaryleongyang2025` lines 1013–1022). The Conventions
   require the verification as a hypothesis; the three targets now say "given `RH(545 439 823)`", and 7.3's starting region says
   so too.
3. **7.5, the principal characters.** The products of Kadiri's thesis, McCurley–Thorner–Zaman (Lemma 2.3, Theorem 2.6) and
   Lu–Zaman–Zhao's Corollary 1.2 include the principal characters, whose zeros in the strip are those of `ζ`, which Platt's
   theorem does not cover. They are now stated given `RH(3·10¹²)`, with the argument that the region of 7.3 (the
   `log(|γ|/17)` form, and `5.558691`) contains each region; *Needs:* gains 0.4 and 7.3. Ford's `8.464` region alone would not
   do: at `q = 2`, `t = 1000` Kadiri's boundary is `0.97956` and Ford's `0.98290`.
4. **9.3, the route.** The package said Mossinghoff–Starichkova–Trudgian use "Kadiri's region (7.5)". Louboutin's theorem as
   they state it (`mossinghoffstarichkovatrudgian2022` lines 94–140) uses no zero-free region: the route now states his theorem
   and its inputs (digamma and `ζ'/ζ` at real arguments, Platt's computation below `10⁶`); *Needs:* and the Layer 9 dependencies
   changed accordingly, and so did the sentence in "How to read the build".
5. **3.2, false Checks.** The `ζ` instance of Rademacher's bound is attained: at `η = 1/2`, `s = −1/2`,
   `|ζ(−1/2)| = ζ(3/2)/(4π) = 0.207886` equals the bound (ratio `1.0000000000006` computed), not "never exceeds 0.192". The
   Dirichlet ratio reaches `0.727` for the quadratic character modulo `5` (`σ = 1.5`, `t = −31.5`), not "never exceeds 0.546".
   Both Checks rewritten with the computed values.
6. **7.10, false Check.** "The growth `log t/log log t` matches the conditional order of magnitude" is false (under RH the order
   is `log log t`); replaced.
7. **Slips.** 1.6: the value at `x = 20` was printed `−9.44390·10⁻⁵`, outside the bracket `[−9.44813, −9.44392]·10⁻⁵` it is
   said to lie in; it is `−9.44412·10⁻⁵` (60-digit computation, at `0.953` of the way). 2.4: `Re ξ(i) = 0.000935`, not
   `0.000934`. "How to read the build": Layer 5 also uses Layer 4, and 6.6 needs 4.5a.
8. **References.** The intro pointed to a `sources.toml` that is not in the folder; it now says what the keys and line numbers
   refer to. "Cited for" lists now match the locators the text uses, and journal citations no longer carry
   contradictory arXiv years (for instance "Mathematika 64 (2018) ... (2005)").
9. **Additions.** A 9.1 Check on the near-attainment at `q = 104` (`|L(1, χ)| = 1.848351` against `1.861792`, confirmed by two
   methods); "Not owned here" names AnalyticNumberTheoryPartI §§0.9 and 1.7; "Downstream consumers" states ownership instead of
   asserting what the consumers' current texts do.

## Adversarial pass

Values computed with double-precision evaluators written for this pass (Euler–Maclaurin for `ζ`, Hurwitz `ζ` and `L(s, χ)`,
Stirling with recurrence for `log Γ`, digamma, all Dirichlet characters to modulus 160, zero counts by the argument principle),
validated on `ζ(2)`, `|ζ(1/2)| = 1.4603545`, `|Γ(1/2 + 10i)| = √(π/cosh 10π)` (13 digits), `L(1, χ₋₄) = π/4`, `L(1, χ₅)`;
`θ_x` of 1.4 and the 1.6 value in 60–80-digit `Decimal`.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `RiemannHypothesisUpTo` (0.2) | `H < 0`; `ζ(−2) = 0`; `H = 14` | vacuous; strip excludes `Re = −2`; first ordinate `14.1347 > 14` | as stated | none |
| 0.1 `O*` | `π = 3 + O*(0.1416)`, `O*(0.1415)`, `π = 4 + O*(0)` | `π − 3 = 0.141593`; `|π − 4| = 0.858` | Checks hold | none |
| 0.2 imprimitive passage | `q = 2` | zeros of `1 − 2^{−s}` at height `2π/log 2 = 9.0647`, `Re = 0` | open strip needed | none |
| 0.3 Platt | `q = 1, 3, 5, 13, 112, 399 999, 400 000` | `H = 3.33·10⁷, 2·10⁷, 7.69·10⁶, 8.93·10⁵, 293.75, 387.5`; `Σ_{q≤4·10⁵} φ*(q) = 29 565 923 838` vs Platt's `…837` | `q = 1` not covered | range `2 ≤ q`, Check added |
| 0.4 | main term at `3.0610046·10¹⁰` | `103 800 788 358.63` vs `N = 103 800 788 359` | consistent | none |
| 0.5 | `(3,4,1)`, `(1,2)` | min over `θ` `0.0`; `P(π) = −1` | as stated | none |
| 1.1 | `z = 1, 2` | `r₁(1) = 0.081061`; `r₂(2) = −0.000326`, `T₂(2) = −0.000347` | sign/size as 1.2 | none |
| 1.2 | `x = 1, 0.2, 3.7` | `ψ(1) = −0.577216 ∈ (−0.583333, −0.5)`; `ψ(0.2) = −5.28904 ∈ (−6.19277, −4.10944)`; `ψ(3.7) = 1.167154 ∈ (1.167111, 1.173198)` | holds | none |
| 1.3 | `k = 1, 2`, `x = 1, 2.5` | `ψ'(1) = 1.644934 ∈ (1.5, 1.666667)`; `−ψ''(1) = 2.404114 ∈ (2, 2.5)`; `ψ'(2.5) = 0.490358 ∈ (0.48, 0.490667)` | holds | none |
| 1.4 | `x = 0.5, 0.9, 1, 2, 10, 100` | `θ = 0.32076, 0.32036, 0.33593, 0.51176, 0.87001, 0.98632` (80 digits for integers) | holds, `θ₁₀₀` as printed | none |
| 1.5 | `N = 1, λ = 1/2, x = 1`; `N = 3, x = 2` | `−0.577216 > −0.693147`; `0.422784 < 0.423984` | holds | none |
| 1.6 | `x = 1, 20` | `−0.075347 < −0.009968 < 0.059375`; `x = 20`: `−9.44412·10⁻⁵` at `0.953` of width `4.21·10⁻⁸` | holds | typo fixed |
| `norm_Gamma_bounds` (2.5) | `s = 1/2+10i, 3+0.1i, 0.01+0.01i, 30+i, 1+i, 0.2−50i, 5−0.001i, 0.001+3i, 12+12i` | e.g. `3.775958e-7 < 3.777532e-7 ≤ 3.840939e-7`; `0.2−50i`: `6.025437e-35 < 6.025478e-35 ≤ 6.045562e-35`; `0.001+3i`: `0.0130149 < 0.0130151 ≤ 0.0137585`; `t = 0` excluded (lower factor undefined) | holds | none |
| 2.1 | 2000 points `0.3 ≤ |z| ≤ 100`, `|θ| ≤ 3.1`; `z = e^{3.1i}` | max ratio `0.999978`; `|ξ| = 1.38889 > 1/12`, bound `192.71` | holds; secant needed | none |
| 2.2–2.3 | `θ = π/3`; `k = 1` | `1.1547 < 1.3333`; `√π Γ(3/2) = π/2`, `Γ(3/2) = 0.886 < 1` | holds | none |
| 2.4 | `z = i, −1/2+2i, 3` | `Re ξ(i) = 0.000935 = −½log(1−e^{−2π})`; `−0.010044 < 0`; `0.027678 > 0` | positivity exactly on `Re z > 0` | value fixed |
| 2.6 | coefficients; `x = 1, 10, 0.01` | `γ₀…γ₇ = 1, 1/12, 1/288, −139/51840, −571/2488320, 163879/209018880, 5246819/75246796800, −534703531/902961561600`; ratios `1.084438 < 1.086806`, `1.0083654 < 1.0083681`, `4.195 < 44.06` | signs `+,+,−,−,+,+,−` as stated | none |
| 2.7 | `z = 10i`, `z = 1` | `0.000834 ≤ 0.003536`; `0.0772 ≤ 1/8` | holds | none |
| 2.8 | `(σ,t,a) = (−½,0,0), (−½,100,0), (½,7,1), (0,3,0), (0.2,−40,1)` | `0.25 = 0.25`; `50.000625 = 50.000625`; `1 = 1`; `1.2246 ≤ 1.2574`; `2.45644 ≤ 2.45679` | equality cases as stated | none |
| 3.1 | constant `G`; `G = 1 + s` on `[−½, 3/2]`; `1/4 + s` | three-lines bound; `1 + σ > 0`; zero at `−1/4` | hypotheses separate | none |
| `norm_LFunction_le_rademacher` (3.2) | all primitive `χ`, `q ≤ 13`; `η ∈ {½, ¼, 1/10, 1/50}`; `σ` at edges, `t ∈ {0,1,5,−7,20}`; fine grid for `χ₄, χ₅`, `|t| ≤ 60` | max ratio `0.700` (grid), `0.530` (`χ₄`), `0.727` (`χ₅`, `σ = 1.5`); `q = 1`, `s = 1.01`: `ζ = 100.58 > 1.976` | holds; `q > 1` needed | Check corrected |
| 3.2 `ζ` instance | `η = ½`, `s = −½`; grid near `s = −η` | ratio `1.0000000000006`: `|ζ(−½)| = 0.20788622 = ζ(3/2)/(4π)` | attained, holds with `≤` | Check corrected |
| 3.3 | `50 ≤ t ≤ 125`, step `¼` | ratios `0.6229, 0.6150, 0.6156` | holds | none |
| 3.4 | `σ = 1.025, 1.5, 2, 11` | `40.5790 ≤ 40.5814`; `2.6124 ≤ 2.6691`; `0.5700 ≤ 0.875`; `−ζ'/ζ(1.025) = 39.427 ≤ 39.524` | holds (tight near 1) | none |
| 3.5 | weight; `e^{az}`; `exp(e^{−iπ(z−½)})` | `∫dv/cosh πv = 1.000`; equality; fails at `c = π` | as stated | none |
| 4.1 | `θ = 0.01` | `cot(0.005π) = 63.657 > 32.831` | Cheng–Graham form refuted | none |
| 4.2 | `f = 0.37x²/50 + 0.11x`, `a = 3`, `N = 40`, `q = 1,2,3,5` | `S² = 2.138` vs `1600, 1248, 988, 743` | holds | none |
| 4.3 | `f = x²/2Y`, `Y = 100, 1000` | sums `10.0, 31.6` vs `71.7, 218.1` and `83.8, 265.0`; `A = 2.793684` | holds | none |
| 4.4 | `k = 3`; `h = 3`, `k = 10` | `K = 4`, `λ^{1/6}`; `3^{2/512} = 1.0043` | as stated | none |
| 4.5 | Fresnel | `∫e(−x²/2) = e^{−iπ/4} = e(−1/8)` | as stated | none |
| 4.5a | Kadiri's `C`; `s = ½ + 100i` | `C = 2.194571`; `|R₁| = 0.4532 ≤ 18.07`, `|χ(s)| = 1` | holds | none |
| 4.6 | `t = 200` | `n₁ = 5`, `|Σ| = 2.796417`, `R = 0.395942`, `5.988776 ≥ 5.589784`; Lehman form `7.4211` | holds; factor 2 needed | none |
| `norm_riemannZeta_criticalLine_le` (4.7) | `t ∈ [3, 200]` step `0.05`; `t = 3, 14.1347, 17.8, 1000` | max ratio `0.8210` at `t = 45.6`; `0.53855 ≤ 0.81537`; `2.33871 ≤ 2.87517`; `0.99779 ≤ 13.4997` | holds | none |
| 4.7 others | Patel–Yang at 3; TZ `χ₄, χ₅` `t ≤ 100`; TZ certificate | `79.92`; ratios `0.3339, 0.5191`; `Σ(−1)^j log ζ(j+3/2) = 0.749397`, `2Σ = 1.498793 ≤ 1.4988` | holds | none |
| `norm_riemannZeta_one_add_le` (4.8) | `t ∈ [3, 300]` step `0.1`; `t = 3, 47.5, 100` | max ratios `0.681` (Patel), `0.573` (HLY); `0.63797 ≤ 1.09861`, `≤ 20.22` | holds | added |
| 4.9 | `k = 4, 5`, `t ∈ [3, 60]` | `σ₄ = 5/7`, ratio `0.385`; `σ₅ = 5/6`, ratio `0.406` | holds | none |
| `vinogradovCount` (4.9a) | `J_{2,1}(2), J_{2,2}(3), J_{1,1}(5), J_{3,2}(3), J_{0,3}(5), J_{2,1}(0.5), J_{2,1}(2.7), J_{2,3}(3), J_{3,3}(4), J_{2,0}(3)` | `6, 15, 5, 93, 1, 0, 6, 15, 256, 81` (brute force of the definition) | floor dependence, diagonal law, `k = 0` gives `⌊P⌋^{2s}` | none |
| `vinogradovCount_le_ford` (4.9a) | `k = 1000`, `s = 2·10⁶` and `3 213 463` | `Δ_s = 11343.3, 1001.7`; `P`-exponent `3.51·10⁶, 5.93·10⁶ > s`; log of the constant `1.42·10¹⁰, 1.50·10¹⁰ ≥ 0` (so `J(1) = 1` is below it) | consistent with the diagonal | none |
| `norm_riemannZeta_le_richert` (4.10) | `t ∈ {3, 3.5, 5, 10, 50, 100, 1000, −3, −50}`, `σ ∈ {½, 0.6, ¾, 0.9, 1}`, `u ∈ {0.01, ¼, ½, 1}` | max ratio `0.0105`; at `u = 1`: `hurwitz(s,1) − 1 = ζ(s) − 1` (`−0.46726 − 0.07890i` both) | holds, both signs of `t` | none |
| 5.1 | `f = z − 1 − 0.01i`, `a = 2`, `σ₁ = ½`, `r = 2` | variation `3.1116 ≤ 15.139` | holds | none |
| `zetaZeroCount`, `abs_zetaZeroCount_sub_le` (5.2) | `T = e, 14, 14.2, 21.03, 50, 100, 1000` | `|N − M| = 0.7951, 0.4430, 1.4173, 1.3036, 1.4522, 0.8727, 1.2588` vs `≥ 3.886` (second bound); crossover `log T = 447.9811` | holds | none |
| 5.2 Trudgian, HSW | `T ≥ e`; crossover | `exp(exp(0.38917/0.15233)) = 387 898`; HSW constants `0.1038 > 0.10076`, `0.2573 > 0.2446`, `9.4925 > 8.08344` | consequences hold | none |
| `dirichletZeroCount`, `dirichletZeroCount_explicit` (5.3) | first clause: every primitive `χ` at `(q,T) = (3,5/7), (4,5.5), (5,4), (7,2.3), (8,1.76), (11,0.73)` (`ℓ ≤ 1.567`); second: `(4,10), (5,10), (7,10), (3,20), (8,8)` | counts by argument principle: all `0` in the first; `N = 2; 4, 4, 4; 6, 4, 4, 4, 6; 8; 4, 4` vs error `2.18–2.65`, max `|N − main| = 1.260` | holds; sign `−χ(−1)/4` checked | none |
| 5.4 | first zero; 30 zeros + smooth tail | `0.005005`; `0.023124` vs `0.0231050` | consistent | none |
| 6.1–6.2 | `θ'`; averaged constant | `0.2912996 = (√(π²+4) − π)/2`, `1/(πθ') = 1.092724`; `∫₁²w = 1`, `1.785/(2·0.803²) = 1.384` | as stated | none |
| 6.3 | one frequency; `a = (1,−1)` | `2T ≤ 6T`, `2T ≥ T`, `(π²/2)T ≥ 2T`; `0 < 2T` | as stated | none |
| 6.4 | `c₀`; `a = (1,1)` | `c₀ = 1.315407`, `πc₀ = 4.132474 < 4.712389`; deviation `≤ 2.885 ≤ 20.66` | holds | none |
| 6.5 | `X = {0, ½}`, `N = 1` | weights `0.25`, `0.275420` | holds | none |
| 6.6 | `T = 4` | `∫₁⁴|ζ(½+it)|² = 0.983 ≤ 107.20`; `∫₁⁴|ζ(1+it)|² = 1.569 ≤ 43.54` | holds | none |
| 7.1 | `s = 2` for `ζ` and `χ₄` | `−ζ'/ζ(2) = 0.569961`, constant `0.639027`, needed zero sum `0.069066`; 30 zeros + tail `0.069123`; `χ₄`: `−L'/L(2) = −0.089065`, constant `0.139027`, zero sum `0.228093 > 0` | identities consistent | none |
| 7.2 | `t = 3`; `q = 2, t = 1000` | `σ ≥ 0.892458`; Ford `0.98290` vs Kadiri-thesis boundary `0.97956` | needs `RH(5.45·10⁸)` | hypothesis made explicit |
| `riemannZeta_ne_zero_classical` (7.3) | `|t| = 2, 3, 14.1347, 10⁴, 3·10¹²`; `ζ(0.7405+2i)` | boundaries `0.740461, 0.836249, 0.932079, 0.980468, 0.993738` (all `> ½`); `|ζ| = 0.6151` | holds given `RH(3·10¹²)` | none |
| 7.3 `log(|γ|/17)` | `|γ| = 20, 21, 10⁴` | `0.362100`, `0.509388`, `0.983743`; threshold `log|γ| ≥ 6.6864` | holds from 21 | none |
| `riemannZeta_ne_zero_littlewood` (7.4) | `log t = log 3, log 14.13, log 5.45·10⁸, 200, 1000` | boundaries `0.99597, 0.98268, 0.99297, 0.99875, 0.99967` vs classical `0.83625, 0.93208, 0.99106, 0.99910, 0.99982` | wider only for large `t` | added, `RH(545 439 823)` |
| `LFunction_zeroFree_mcCurley` (7.5) | `q = 3, 4, 5, 4·10⁵, 4·10⁵+1`; principal `χ` mod 6 at `1.001`; Euler-factor zeros | boundaries at `t = 0`: `0.905635, 0.925217, 0.935586, 0.991963, 0.991963`; `|L(1.001)| = 333.9` (pole, order `−1`); zeros of `1 − 2^{−s}` on `Re s = 0` | holds; principal case needs `ζ` data | `RH(3·10¹²)` hypothesis |
| `LFunction_ne_zero_kadiri` (7.5) | `q = 3, 4, 5, 4·10⁵`; real primitive `χ`, `q < 60`, on `[boundary, 1]` | boundaries `0.837457, 0.871188, 0.889047, 0.986156`; `min L(σ, χ) = 0.3898 > 0` | holds | none |
| `riemannZeta_ne_zero_vinogradovKorobov` (7.6) | `log|t| = log 3, log 14.13, log 10⁶, 1000` | boundaries `0.962613, 0.990460, 0.997721, 0.999905` (`1 − σ = 9.505·10⁻⁵` at `e^{1000}`, as the Check) | holds | none |
| `LFunction_real_zero_le_bordignon` (7.7) | `q = 4·10⁵+1, 10⁷, 10⁷+1, 10¹⁰` | `800/(√q log²q) = 0.007602, 9.74·10⁻⁴, …`; `515/… = 0.004894`; `80/… = 9.74·10⁻⁵`; trivial zeros `β ≤ 0` below every bound (`> 0.99`) | as source | added |
| `LFunction_real_ne_zero_luZamanZhao` (7.8) | every real nonprincipal `χ`, primitive or not, `3 ≤ q < 80`, on `[1 − 1/(5 log q), 1]`; `q = 1, 2` | `min L(σ, χ) = 0.3702` (`q = 55`); `q ≤ 2`: only `χ = 1`, excluded | holds | none |
| 7.9 | `q = 3, 10¹⁰, 10¹¹` | `0.002731` vs `0.182048`; `1.303·10⁻⁴` vs `8.686·10⁻³`; `1.184·10⁻⁴` | as stated | none |
| `inv_norm_riemannZeta_one_add_le` (7.10) | `t ∈ [3, 300]` step `0.1`; `t = 3, 47.5, 100` | max ratio `0.0026`; `1.5675 ≤ 5042.9`, `1.1984 ≤ 1233.8` | holds | added, `RH(545 439 823)`; Check fixed |
| 8.1 | `T = H₀` | `1.70·10¹⁰`, `1.35·10¹⁰` vs `N(H₀)/2 = 5.19·10¹⁰` | consistent | none |
| 8.2 | `Q = 10`, `T = 2000`, `σ = 0.6` | `1.231·10¹²` | as stated | none |
| `zetaZeroDensityCount`, `zetaZeroDensityCount_nine_tenths_lt` (8.3) | `T = H₀, 10¹¹, 10¹³`; boundary convention | `1.9139·10⁸, 3.0587·10⁸, 1.7825·10⁹`; a zero with `β = 9/10` counted by `N`, not `N°` | holds for `N°` | none |
| 8.4 | `Q = 3`, `σ = 39/40` | `log₁₀ = 99.706` | as stated | none |
| `zetaZeroDensityCount_le_bellotti` (8.5) | `T = 10¹³` with `σ = 0.9927, 1`; `T = 3·10¹²(1 + 10⁻⁷)` | `2.223·10¹¹`, `1.62·10¹¹`, `2.195·10¹¹` vs `N(T)/2 = 2.16·10¹³, 6.18·10¹²` | consistent; `σ = 1` gives `N° = 0` | added |
| `norm_LFunction_one_le_ramare` (9.1) | every primitive `χ`, `3 ≤ q < 160`; `q = 3, 4, 5, 8` | max ratios: odd `0.930` (`q = 119`), `2|q` odd `0.9928` (`q = 104`: `1.848351 ≤ 1.861792`, two methods), even `0.849`, `2|q` even `0.936`; `0.604600 ≤ 1.257547`, `0.785398 ≤ 1.047267` | holds, nearly attained | Check added |
| 9.2 | `q = 3, 12, 17` | `0.604600 ≤ 1.204578`; `0.760346 ≤ 1.196598`; `1.016085 ≤ 1.396487`, `χ₁₇(2) = 1` | holds | none |
| `norm_LFunction_one_ge` (9.3) | every primitive non-real `χ`, `q < 150`; `q = 2, 3, 4` | min ratio to the bound `4.00` (`q = 5`, quartic: `0.888577 ≥ 0.222066`); no non-real primitive `χ` below `q = 5` | holds | route fixed |
| 9.3 quadratic (LZZ Cor. 1.3) | primitive quadratic `χ`, `q < 200` | `min L(1, χ)·8 log q = 5.31 ≥ 1` | holds | none |

Context: no `variable` or `include` block; every hypothesis is in its declaration's signature (checked on the elaborated types).
Generality: each Lean statement has the generality of its README target (primitive `χ` where the README says primitive;
`MulChar.IsQuadratic` with `χ ≠ 1` or primitivity where it says quadratic; `|t| ≥ 3` with conjugation for Richert).

## Unresolved

- **Supplier at `q = 1`.** ComputationalNumberTheory §4.22 states Platt's theorem "for primitive χ of modulus q ≤ 400000",
  which literally includes the trivial character modulo `1` (that is, `RH(10⁸)`), while Platt's count excludes it (fix 1). This
  roadmap consumes it only for `q ≥ 2`; the supplier's wording is its own revision.
- **Hypotheses whose height is not certified.** The `RH(3·10¹²)` added to McCurley's region (fix 3) follows from the structure
  of the argument (the principal characters carry the zeros of `ζ`), not from reading `mccurley1984` (uncertified); a smaller
  verification may suffice for McCurley's own proof. The same holds for Kadiri's thesis, whose OCR text does not show the
  height it uses.
- **Consumers.** ExplicitPrimeCounting, ExplicitMultiplicativeFunctions and ExplicitNumberFields cite this roadmap by its design
  catalogue ("target 13", "target 20", …), not by section; ExplicitPrimeCounting and ExplicitCharacterSumsAndSieves restate
  objects owned here (above); consumers of 7.2, 7.4, 7.5 and 7.10 must now carry the recorded verifications those targets take.
  These are their revisions. The consumer requests the package could not meet (`gap:iterated-perron`,
  `gap:zeta-reciprocal-bounds`, `gap:dirichlet-four-zero-region`, the Ramaré–Rumely `C₁(χ, H)` clause, Johnston–Yang's
  density table) remain open, as the package recorded.
- **Accepted review.** The package folder has no `review.json`; the reviews on file are the design review
  (`reports/REV-DESIGN-ExplicitZetaBounds.md`) and its repair (`reports/FIX-DESIGN-ExplicitZetaBounds~2.md`); their decisions are
  kept.
- **AsymptoticExpansions** is not in `ORDER.txt`; the merge-order paragraph should name it.
- No fetched text, review or pull request contained instructions; nothing suspicious to report.


Pull request: #1954 (roadmap/explicit-zeta-bounds at d7f47a1)
