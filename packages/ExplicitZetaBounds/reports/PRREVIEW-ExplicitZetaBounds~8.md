# Review of ExplicitZetaBounds (pull request #1954 at faca04c)

**Verdict:** needs changes

Full review of `TauCetiRoadmap/ExplicitZetaBounds/README.md` and `TauCetiRoadmap/ExplicitZetaBounds/Suggested.lean` at `faca04cb`. The previous review's thirteen findings are all repaired (the check is below). The gate fails on one style rule (R01), and the remaining findings are a misquoted source region (R02), Lean definitions that no stated theorem uses (R03) and three cited works the manifest does not record (R04). No finding is blocking.

## Previous findings

- R01 (Phragmén–Lindelöf edges at small heights): **repaired**. `YangRecord` is defined (`Suggested.lean` 180–194, README 592–597); 4.9 (README 1754), 5.2 (1933–1934), 7.4 (2688–2689), 7.6, 7.10, 8.5 and the Lean theorems `abs_zetaZeroCount_sub_le`, `abs_zetaZeroCount_sub_le_of_recorded`, `zetaZeroCountBound_seven_eighths`, `riemannZeta_ne_zero_littlewood`, `LFunction_ne_zero_kadiri`, `riemannZeta_ne_zero_vinogradovKorobov`, `inv_norm_riemannZeta_one_add_le`, `zetaZeroDensityCount_le_bellotti` take `HiaryRecord`, `PatelRecord` and `YangRecord`.
- R02 (8.4 omits Platt's and Brent–Platt–Trudgian's records): **repaired**. `primitiveLZeroCount_le_thornerZaman` (Lean 764–766) takes `hBPT`, `hP`, `hH`; the README (3214–3230) says why `PlattCentralRecord` and `BordignonRecord` do not enter, and `thornerzaman2024` lines 1475–1477 confirm that Bordignon's bound serves only Corollary 6.1 (`σ < 39/40`).
- R03 (5.3 rests on a computation): **repaired**. `BennettMartinOBryantRechnitzerRecord` (Lean 279–287) is a hypothesis of `dirichletZeroCount_explicit` (551).
- R04 (`BordignonRecord` cannot give 800 and 515): **repaired**. The record has the three clauses `46π/√q`, `79.2177/√q` (`q ≤ 10⁷`) and `12.52/√q` (`q > 10⁷`) (Lean 261–266), matching `bordignon2019` (10), (12) and `bordignon2020` Theorem 1.2 (lines 160–168, 179–185, 60–62); 7.7 states `800`, `515`, `80` and `100` with the divisions `802.9`, `515.7`, `83.5`, `100.2`.
- R05 (`HiaryPatelYangRecord` records an analytic range; 8.3 omits Hiary): **repaired**. `HiaryRecord`'s second clause is `0.595 t^{1/6} log t` on `[3, 200]` (Lean 170–173), `norm_riemannZeta_criticalLine_le` takes it, and `zetaZeroDensityCount_nine_tenths_lt` (720–721) takes `hrec : HiaryRecord`.
- R06 (modulus form of Ramaré–Rumely handed back and forth): **repaired**. README 169–174 and the end of 7.5's fifth item (2806–2810) own it; ExplicitPrimeCounting's head cites "ExplicitZetaBounds §7.5, fifth item and its end" (its README 169–172).
- R07 (Euler–Maclaurin owned twice): **repaired**. Scope (README 49–52) names `AsymptoticExpansions` §13.1 as the real-valued case and keeps the Banach-valued form here; AsymptoticExpansions is not in the merge order and is not a supplier.
- R08 (unowned route inputs): **repaired**. Trudgian's `|∫ S| ≤ 2.067 + 0.059 log t₂` is 5.4's third item (2102–2114, `trudgian2011turing` lines 142–145 confirm); the sums of `μ²`, `λ_X²`, `d`, `d²` are targets of 8.3 (3118–3132); Cully-Hugill–Trudgian's `Σ d²` of 8.5 (3274–3283); Hoffstein's lemma of 9.3 (3374–3376).
- R09 (6.2 drops `κ > 0`): **repaired**, README 2211 reads `κ > max(κ_a, 0)`.
- R10 (`hasLandauSiegelGap_one_fifth`): **repaired**, deleted.
- R11, R12, R13 (Checks of 4.2, 6.3, 9.2): **repaired** (README 1357–1365, 2250–2251, 2356–2360).

## R01 (P3) — The gate's `tex` rule fails on the display of Kadiri's explicit formula

**Location.** README lines 2645–2647: "`Re Σ_{n≥1} Λ(n) n^{−s} f(log n) = f(0)(…) + Re F(s − 1)` … `+ Re((1/2πi) ∫_{1/2−i∞}^{1/2+i∞} Re ψ(z/2) F₂(s − z)/(s − z)² dz + F₂(s)/s²)`".

**Claim.** The code span opens on line 2645 and closes on line 2647, so the scanner reads `_{n≥1}`, `^{−s}`, `_{1/2−i∞}` and `^{1/2+i∞}` on lines 2645 and 2647 outside a code span: `tex=4 FAIL` (gate run at `faca04c`, every other check `0`).

**Witness.** The gate output: `tex: line 2645 … tex: line 2647`, rule "no TeX-only syntax outside code spans and code blocks".

**Repair.** Put the three-line display in an indented code block, or close and reopen the code span on each line so that each `_{…}` and `^{…}` sits inside a single-line span.

## R02 (P3) — 7.5's first item attributes to Kadiri's thesis a region it does not state

**Location.** README lines 2760–2763: "(Kadiri, Théorème 11.1, `kadiri2002thesis` lines 1958–1980, English form (115) at lines 2063–2068) … at most one zero with `σ > 1 − 1/(6.4355 log max(q, q|t|, 1.7367))`".

**Claim.** The thesis's region (111) and (115), read from the rendered pages 59 and 61 of the scan, is `σ ≥ 1 − 1/(R₁ log(max(q, q|t|)/c))` with `R₁ = 6.4355`, `c = 1.7367`: the constant divides the argument of the logarithm, it is not a third entry of the maximum. The README's region is the narrower one, so its statement follows from the source's, but it is not the source's statement, and ExplicitPrimeCounting's gap `dirichlet-zero-free-constants` copies the same form from here.

**Witness.** `kadiri2002thesis` lines 1976–1979 and 2063–2068 (the OCR puts the `c` on the line below the `max`, where the rendered page shows the fraction `max(q, q|t|)/c` under `log`). At `q = 3`, `t = 0` the source's boundary is `1 − 1/(6.4355 log(3/1.7367)) = 0.7157`, the README's `1 − 1/(6.4355 log 3) = 0.8586`.

**Repair.** State the source's form, `σ ≥ 1 − 1/(6.4355 log(max(q, q|t|)/1.7367))`, for `q ≥ 3` (where the logarithm is positive), and derive the README's narrower form from it in one clause; or keep the narrower form and say that it is a consequence of (111), not its statement. Note at the same place that at `q = 2` the source's region contains `s = 0`, where `L(s, χ₀) = (1 − 2^{−s}) ζ(s)` vanishes (a zero of the principal character), so the "real, simple, non-principal" clause needs `q ≥ 3` or the narrower form (under which `s = 0` lies left of the boundary `0.7758`). Tested: with the README's form at `q = 2`, `t = 0`, the boundary is `0.7758 > 0`; with the source's form it is `1 − 1/(6.4355 log(2/1.7367)) = −0.101 < 0`.

## R03 (P3) — Five Lean definitions that no stated theorem uses

**Location.** `Suggested.lean` lines 141–142 (`ZetaZeroFreeUpTo`), 205–210 (`LeongRecord`), 250–254 (`PlattSaadEddinRecord`), 588–589 (`ClassicalZeroFreeRegion`), 730–732 (`ZetaZeroDensityBound`).

**Claim.** Each of these is a `def` whose only occurrences in the file are its own declaration and docstring (`grep -c` gives 2, 1, 1, 3 and 2 hits, all in the definition block or the module docstring). The file's rule is "definitions only to make a headline statable"; none of the stated theorems mentions them. The instances the README gives in the two predicates (7.3a, 8.3a) are restatements of `riemannZeta_ne_zero_classical` and `zetaZeroDensityCount_nine_tenths_lt`, so stating them would be padding too.

**Witness.** `grep -n 'ZetaZeroFreeUpTo\|LeongRecord\|PlattSaadEddinRecord\|ClassicalZeroFreeRegion\|ZetaZeroDensityBound' Suggested.lean` lists only lines 15, 17, 140, 141, 205, 250, 587, 588, 730.

**Repair.** Delete the five definitions from `Suggested.lean` (the README keeps the records of 0.4 and 0.4b and the predicates of 7.3a and 8.3a as targets). Write their README names in italics (`*ZetaZeroFreeUpTo*`, `*LeongRecord*`, `*PlattSaadEddinRecord*`, `*ClassicalZeroFreeRegion*`, `*ZetaZeroDensityBound*`) at README 549, 605, 618, 2617 and 3174, since a backticked name claims a Lean declaration. Adjust the module docstring's list (lines 10–19).

## R04 (P3) — Three cited works are not in the manifest

**Location.** README references 3550–3552: `grahamvaaler1981`, `chirrehelfgott2025`, `fks2023psi`; cited at 2261–2282 (6.3a) and 3104–3106 (8.3).

**Claim.** The package manifest `packages/ExplicitZetaBounds/sources.toml` has no entry for any of the three keys (grep over the manifest for the three ids returns nothing), so their locators cannot be checked through the cache. The arXiv texts of `chirrehelfgott2025` (2512.15709v1) and `fks2023psi` (2204.02588v3) fetch from the open repository; `grahamvaaler1981` resolves only to the AMS landing page of Trans. AMS 265 (1981), which the service does not classify (the journal's back issues are open, so the PDF needs an explicit licence class).

**Witness.** The sources service, run with this package's manifest: "added chirrehelfgott2025", "added fks2023psi", "grahamvaaler1981: failed: no legal source found … landing page … in no licence class". (This review edits no manifest; the entries the service wrote were reverted.)

**Repair.** Record the three works in `sources.toml` (one key each, with `arxiv` for the two preprints and the DOI `10.1090/S0002-9947-1981-0607121-1` for Graham–Vaaler, fetched with `--licence-class` after checking that the AMS copy is open), and keep the References' "Cited for" lines as they are. I checked the 6.3a and 8.3 locators against the fetched texts (below), so no statement changes.

## Verified sound

**Gate, dependencies and build.**
- Gate at `faca04c`: every check `0` except `tex=4` (R01); `depcheck=0`, `outside-folder=0`, `stray-files=0`, `readme-ids-missing=0`. `git diff --stat origin/main...HEAD` outside the folder: empty. The worker's build of the module passed (`build=0`).
- `lake env lean Suggested.lean` at the pin: 37 `declaration uses 'sorry'` warnings, one per theorem (38 `theorem` lines, one of them a word in the docstring), nothing else; 7.9 s.
- Merge order: ExplicitZetaBounds at 267, after ZerosOfLFunctions 48, AnalyticNumberTheoryPartI 49 and SieveMethodsAndPrimePatterns 56, before ExplicitPrimeCounting 269, ExplicitCharacterSumsAndSieves 270, ExplicitMultiplicativeFunctions 271, ExplicitNumberFields 272. `AsymptoticExpansions` is not in the order and is not cited as a supplier. The depcheck shows no UPWARD or CYCLE line.
- The 68 elaborated signatures of `signatures.md` agree with the README statements; there is no `variable` block, so no binder can be lost. `hardyZ` at the pin is `(completedRiemannZeta (1/2 + tI)).re / ‖Gammaℝ (1/2 + tI)‖` (`Mathlib/NumberTheory/LSeries/HardyZ.lean:76`), and `e^{iϑ(t)} ζ(1/2 + it)` computed at `t = 10, 50.3, 200` is real to `10⁻¹³` with the values `−1.5492`, `−0.8253`, `5.5898`, so `hardyZ_eq_exp_riemannSiegelTheta_mul` has the right sign of `ϑ`.

**Library declarations at the pin.** `bernoulliFun_one : bernoulliFun 1 x = x − 1/2` (`ZetaValues.lean:58`), `Polynomial.bernoulli_one`, `bernoulliFun_endpoints_eq_of_ne_one`, `hasDerivAt_bernoulliFun` (`ZetaValues.lean:70, 86`); `riemannZeta_pos_of_one_lt`, `riemannZeta_im_eq_zero_of_one_lt` (`LSeries/Dirichlet.lean:341, 352`), which give only `0 < ζ(σ)`, not `1 < ζ(σ)` or the monotonicity, so `riemannZeta_strictAntiOn` is not padding. `ZetaAsymp.lean` has `riemannZeta₀`, `riemannZeta₁` and `riemannZeta_eq_inv_sub_add` (lines 574–577) and no sawtooth representation, so 0.5b is not a duplicate.

**Cross-roadmap citations resolved.** `SieveTaper.sharp_additive_largeSieve` (#1495 `Suggested.lean` 236, namespace opened at 222) and `SieveApplications.sharp_primitive_largeSieve` (261, the namespace reopened at 256); `gammaRemainder.slit_logGamma` is the intermediate target named in AnalyticNumberTheoryPartI §0.23a (its README line 615; it is not in its `Suggested.lean`, which is why `roadmaps resolve` lists it); `DirichletGRH` at #1126 `Suggested.lean` 308. ExplicitPrimeCounting's head consumes §§0.2–0.4, 0.4b, 5.2, 5.4, 6.1, 6.5, 7.2, 7.3, 7.5, 7.6, 7.9, 8.1, 8.3 (74 citations), including the modulus form of 7.5 (R06 of the previous review).

**Ownership against open pull requests.** `roadmaps grep` over main and the 471 open heads: Graham–Vaaler's one-sided approximants occur elsewhere only in ExplicitPrimeCounting's route text (its README 1565, no target); Hoffstein's lemma, Trudgian's `S₁` bound, the Cohen–Dress–El Marraki count, the first-derivative test, the partial fractions of `π²/sin² πz`, Vinogradov's mean value theorem and the Riemann–Siegel theta function have no second owner; the sawtooth of HalfIntegralWeightModularForms (#1721) is the rational Dedekind-sum sawtooth, a different object; Kusmin–Landau is cited by #1946 and #1948 from here. `scratch/overlaps.md` lists no dropped id and no other pull request changing this roadmap.

**Seeded sample (source text read at the locator).**
- 0.5: `mossinghofftrudgian2015` lines 73–75 and 129 (`P_n`: even cosine polynomials, nonnegative coefficients, `a₁ > a₀`, `f_n ≥ 0`).
- 1.5: `diamondstraub2016` Theorem 1.2 (lines 90–94) and Theorem 3.1 (320–326), the four residue classes of `N` mod 4 and the ranges of `λ` as stated.
- 2.3: `brent2019` Theorem 1 (162–170) and Corollary 1 (200–202) on `H*`; the proof's `|u + z|² ≥ u² + |z|²` and Wallis (174–190).
- 2.6: `nemes2015` lines 37–38 (his `γ₁ = −1/12`), 53–63, Theorem 1.1 (86–100), 1.2 (105–108), Lindelöf (115–121), the real bound (125–135), Theorem 1.3 (169–171) and the factor `(2√N + 1)/2` in its proof (543–554).
- 3.1: `fiori2025` Theorem 1 (47–64), Remark 2 (65–70), Remark 4 (91–93), Lemma 5 (110–114), the error in the logarithmic form (13–18).
- 3.2: `bmor2021` Lemma 5.6 (569–577), `(q|s + 1|/(2π))^{(1+η−σ)/2} ζ(1 + η)` for `−η ≤ σ ≤ 1 + η`.
- 4.6: `hiarypatelyang2024` Lemma 2.1 (72–80) and Lemma 2.2 (81–85); `ford2002zerofree` footnote (137–143) for Lehman's `4(|t|/2π)^{1/4}`, `|t| ≥ 128π`.
- 4.8: `patel2022` Theorem 1.1 (61–66); `hiaryleongyang2025` Theorem 1 (31–32), Proposition 3 (109–117), the `A(k)` (439–443).
- 4.9: `yang2024` Theorem 1.1 (53–55), `T_k` (722–728), the interpolation with `f(s) = (s − 1)ζ(s)`, (3.5)–(3.8) (729–763), Lemma 4.3's edge checks (1549–1553).
- 5.1: `bmor2021` Proposition 5.4 (473–475) with `1 < c < r`, `0 ≤ δ < 9/2`.
- 5.4: `brentplatttrudgian2021` Lemma 1 (38–43), Theorem 1 (54–71), Lemma 2 and `1/(150t)` (139–164), (10) with `A₀ = 2.067`, `A₁ = 0.059` for `T > 168π` and the computation on `[2π, 168π]` (170–174), Lemma 3 (186–197), Corollary 1 (412–417); `trudgian2011turing` Theorem 2.2 (142–145) and footnote 3 (149–154).
- 6.1: `ramare2007eigen` Theorem 7.1 (742–759); `cullyhugilljohnston2023` Theorem 2.1 (141–156) and Lemma 2.2 (163).
- 7.2: `ford2002zerofree` Theorem 3 and 4 (96–106), (9.9) (1342–1346), `T₀ = 545 000 000` (1272), the use of the verification (324); `mty2024` (1.8) and the comparison (107–119).
- 7.10: `hiaryleongyang2025` Theorem 2 (41–43), Yang's region at `t₀ = 500` (1013–1022, 1157), the computed `2.079 log t` on `[2, 500]` (1171–1175), which implies `HiaryLeongYangRecord`.
- 8.5: `bellotti2025density` Theorem 1.1 (91–101), the regions (352–365, with `53.989`), Lemma 2.6 (370–390), Lemma 2.7 (401–420).
- Also read: `thornerzaman2024` Lemmas 2.1–2.3 (156–170), Theorem 2.6 (219–226), Proposition 2.10 (317), the remark (852–854), §5.1 (1275), §5.3 (1453) and Corollary 6.1's proof (1475–1477); `kadiri2018` Theorem 1.1 (16–18), Theorems 2.1–2.3 (130–157); `kadiri2013density` Theorems 1.1–1.2, Corollary 1.3 (42–54, 107–133), Table 1 rows `0.85`, `0.90` (655, 660); `kadirilumleyng2018` (1.1), Theorem 1.1 and its corollary (19, 74–87), Lemma 3.2 (260–272), Lemma 3.5 (334–347, 358, 385–386); `ramare2016density` Lemmas 3.1, 3.4, 5.4, 5.5, 5.6, 6.5 (283–288, 450–456, 654, 672–680, 698–706, 828–843); `luzamanzhao2026` (15–20, 39–44, 96–99, 369–371); `simonic2020` Theorem 4 and Tables 1–3 (177–205); `khale2024` Theorem 1.1 (24–26); `bordignon2019`, `bordignon2020` as under R04 above; `bmor2021` Theorem 1.1 (56–63), Corollary 1.2 (83–84), §§6.1–6.3 (912–1053); `fks2023psi` Theorem 2.7 and Remark 2.8 (370–392, fetched); `chirrehelfgott2025` Proposition 4.1 with (4.2)–(4.6), (4.9)–(4.12), Lemmas 4.2–4.3 (fetched; lines 590–730, 755, 795–850 of its extraction: the Fourier-side `φ^±_ν`, `Φ^{±,∘} = (coth(w/2) ± 1)/2`, `Φ^{±,⋆} = (i/2π)((ν/2) coth(ν/2) − (w/2) coth(w/2) ± πiz)`, which equals the README's `(B^±(w) − B^±(ν))/(2πi)`, the `L¹` values, the interpolation formula and `L_ν = M_ν − (sin πz/πz)²`); `kadiri2002thesis` pages 59 and 61 rendered (R02).

**Adversarial table** (values computed here; ✓ = consistent):

| Statement | Instance | Values computed | Result |
|---|---|---|---|
| 0.4b `HiaryRecord` | grid `[0, 3]` step `10⁻³`; `[3, 200]` step `10⁻²` | max `|ζ(1/2 + it)| = 1.46035` (at `t = 0`) `≤ 1.461`; max ratio to `0.595 t^{1/6} log t` is `0.853` at `t = 45.6` | ✓ |
| 0.4b `PatelRecord` | `[3, 50]` step `0.005` | max `|ζ(1 + it)|/log t = 0.644` at `t = 17.75` | ✓ |
| 0.4b `YangRecord` | `|t| ≤ 3` step `10⁻³`, three lines | ratios `0.9966` (`σ = 1/2`, at `t = 0`: `0.7302` vs `0.7327`), `0.362` (`σ = 5/7`), `0.517` (`σ = 1`; Lean's value `0` at `t = 0`) | ✓ |
| 0.4b `HiaryLeongYangRecord`, `LeongRecord` | `[3, 500]`, `[2, 500]`, `σ ∈ {1, …, 2}`, `σ = 1 − 1/(5.56 log t)` | ratios `0.0026`; `0.0707`, `0.0376`, `1.7·10⁻³²`; Carneiro's `2.079 log t` has ratio `0.99994` at `t = 2` | ✓ |
| 0.5a real endpoints | `f = x` on `[0.25, 1.75]`; `f = 1` on `[0, 1]` | `1.5 − 0.0625 − 0.4375 + 0 = 1` = the one integer `1`; `1 − 1/2 + 1/2 = 1` | ✓ |
| 0.5b `riemannZeta_eq_sum_add_integral_sawtooth` | `s = 0.3 + 5i`, `a = 1, 2.5, 3, 7.3` | all four right sides `0.675649051 + 0.254144796i`, equal to `10⁻¹⁶`, to `ζ(s)` within `5·10⁻⁸` (my `ζ`'s accuracy); with `+s∫` the error is `0.139` | ✓ |
| 2.9 bracket | `T = e, 3, 5, 10, 30, 100, 1000` | `v − 7/8 = 2.49·10⁻³, 2.24·10⁻³, 1.33·10⁻³, 6.64·10⁻⁴, 2.21·10⁻⁴, 6.63·10⁻⁵, 6.63·10⁻⁶`, each in `(0, 1/(40T))`; at `T = 1000` it equals `1/(48πT)` | ✓ |
| 3.2a `norm_riemannZeta_le_linear` | `z = 1.01`, `2`; disc `|z − 3/2 − it| ≤ 1` | `102 ≥ 100.578`; `3 ≥ 1.645`; `1 + 1 + 2(5/2 + |t|) = 7 + 2|t|` with `|Im z| ≥ |t| − 1 ≥ 1` | ✓ |
| 3.4 `riemannZeta_strictAntiOn` | `σ = 2, 3, 4` | `1.64493 > 1.20206 > 1.08232 > 1`; the pin has only `0 < ζ(σ)` | ✓ |
| 4.5c `riemannZeta_eq_partialSum_halfInteger` | `s = 1/2 + 30i`, `a = 21/2` (`ϑ = 0.45473`) | error `0.0031366 ≤ 0.0090251`; with `+c_ϑ`: `0.09541`; without: `0.04759` | ✓ |
| 4.5c | `s = 1/2`, `a = 7/2`; `s = 5i`, `N = 1`; `s = 1/4 + 20i`, `N = 3`; `s = 1 + 100i`, `N = 16`; `s = 1/2 + 0.1i`, `N = 0` | errors `0.00315 ≤ 0.01273`; `0.0532 ≤ 0.198`; `0.843 ≤ 13.3`; `0.200 ≤ 4.19`; `0.0465 ≤ 0.248`; `s = 2 + 10i`, `N = 1` violates `a > |τ|/2π` (`ϑ = 1.06`) and is excluded | ✓ |
| 4.5c derivation | the two amplitudes | log-derivatives `(1/y)(−(σ + 1) + 2ϑ_y/(m + ϑ_y))` and `(1/y)(−(σ + 2) + 3ϑ_y/(m + ϑ_y))` are negative for `σ ≥ 0`, `|ϑ_y| < 1`, so each `|g_k|` decreases and the first-derivative test applies termwise | ✓ |
| 5.2a `zetaZeroCountBound_rosser` | `T = 2` | `|0 − (1/π) log(2/(2πe)) − 7/8| = 0.1923 ≤ 1.5206` | ✓ |
| 5.2a `zetaZeroCountBound_seven_eighths` | `L = 175.3`, `172.87` | `0.0332 L + 0.1857 log L = 6.7794 ≤ 6.7795`; `0.00304 L + 0.0127 log L = 0.59096 ≥ 0.59094` | ✓ |
| 5.2 Trudgian consequence | threshold | `0.15233 log L ≥ 0.38917` iff `L ≥ 12.868`, `T ≥ 3.879·10⁵` | ✓ |
| 5.3 record range | `ℓ ≤ 6` | `q(T + 2) ≤ 2534.8`, `T + 2 ≥ 2.714`, `q ≤ 933.9` | ✓ |
| 6.1a | `F = 1`, `j = 1, 2`, `x = 3`; residues | `3 · 2/3 = 2`; `9 · (2/3)²/2 = 2`; `Σ_m (−1)^m y^{−m}/(m!(j − m)!) = (1 − 1/y)^j/j!` | ✓ |
| 6.3a | `ν = 1`; `z = iπ/2` | `0.58198 + 0.41802 = 1 = ∫ (sin πx/πx)²`; `(z coth z)′ = iπ/2`, modulus `π/2 = |z|`; `Φ^{±,∘}(0) = 1/(1 − e^{−ν})`, `1/(e^ν − 1)` | ✓ |
| 7.2 Theorem 3 → 4 | `t = 5.45·10⁸`; `t = 10¹⁰` | `J = 6.88118`, `c₆ = 0.0025072`, width `0.0058734`, times `log t`: `0.118151 > 0.118147`; at `10¹⁰`: `c₆ = 0.00220`, exact `0.0061955`, simplified `0.0061397` | ✓ |
| 7.4 thresholds | `L = 41`, `185.64`, `170.2` | Ford exact `0.0042663 ≥ 0.0042658`; `0.0013253 = 0.0013253`; at `e^{170.2}` exact `0.0014271`, simplified `0.0014215` vs required `0.0014215` | ✓ |
| 7.5 `LFunction_zeroFree_mcCurley` | `q = 3`, `t = 0`; Euler-factor zeros | boundary `0.9056 > 0`, so the zeros `2πik/log p` on `Re s = 0` and the trivial zeros are outside; `ρ.re ≥ 1` has no zeros | ✓ |
| 7.5 first item | `q = 2, 3`, `t = 0` | source form: `−0.101` (contains the zero `s = 0` of `(1 − 2^{−s})ζ(s)`), `0.7157`; README form: `0.7758`, `0.8586` | R02 |
| 8.3 `Σ μ²` | all `D ≤ 2·10⁶` | `|S(D) − 6D/π²| > 0.1333√D` exactly at 159 values of `D`, the last five `1411, 1419, 1659, 1662, 1663`; `D = 1411`: `5.215 > 5.007`; `1663`: `6.017 > 5.436`; `1664`: `5.409 ≤ 5.438`; `S(1700) = 1035`; `max S/D` on `[1700, 2·10⁴]` is `0.610 ≤ 0.62`; `Σ_{n≤1000} μ²/n = 5.24239 ∈ [5.23941, 5.24741]` | ✓ |
| 8.5 `Σ d²` | `x = 6, 7, 433`, `x ≤ 10⁶` | `38 > 34.51`; `42 ≤ 51.58`; `24196 ≤ 24218.8`; `max Σ d²/(x log³ x)` is `0.814` from `7` and `0.24976` from `433` | ✓ |
| 8.4 records | TZ 1453, 1475–1477 | `N*` trivial for `Q ≤ 400 000` by Theorem 2.6 (Platt); Bordignon's bound only in Corollary 6.1 for `σ < 39/40` | ✓ |
| 9.3 Hoffstein | constants | `1.507/11.657 = 0.12928 > 1/8`; `1/5 > 1/11.657` | ✓ |

**Headline theorems.** The 37 theorems of `Suggested.lean` are the headlines the README names with backticks; the one unstatable headline (Rademacher's bound for a general record) is in the module docstring with its missing carrier. The one-tactic probe on the new theorems: `riemannZeta_strictAntiOn` needs `1 < ζ(σ)`, absent at the pin; `riemannZeta_eq_one_add_inv_sub_integral_fract` has no counterpart in `ZetaAsymp.lean`; `norm_riemannZeta_le_linear`, `zetaZeroCountBound_rosser`, `hardyZ_eq_exp_riemannSiegelTheta_mul` do not close by one tactic. The padding found is R03 (unused definitions).

## Not verifiable

- `kadiri2002thesis` beyond the two rendered pages (the scan's OCR is unreliable for formulas).
- `leong2026`, `leeLeong2022` (7.10 items 2–4, `LeongRecord`'s source lines) and `hoffstein1981` (9.3): image-only in the cache, no OCR on this worker; `LeongRecord`'s three clauses were checked numerically only (table above).
- `grahamvaaler1981` (6.3a extremality): the AMS copy was not fetched (R04); the statement was checked through `chirrehelfgott2025`'s quotation of [GV81, Thm. 9].
- `backlund1918`, `rademacher1959`, `lehman1966`, `rosser1941`, `preissmann1984`, `ramare2001`, `gallagher1970`, `logan1988`, `montgomery1994ten`, `montgomeryvaughan1974`, `elliott1987`, `delange1987`, `mccurley1984`, `cullyhugilltrudgian2021`, `dlmf`, `titchmarsh1986`, `davenport2000`, `andrewsberndt2013`, `mortici2011ramanujan`: uncertified; `gabcke1979`: waived.

## Source issues

- **Misprint** in kadiri2002thesis at Théorème 11.1 (111), printed page 56, and Théorème 12.1 (115), printed page 58: the source says the region is `σ ≥ 1 − 1/(R₁ log(max(q, q|t|)/c))` for every `q ≥ 2`; at `q = 2` it contains `s = 0`, a zero of `(1 − 2^{−s})ζ(s)`, so the "real, simple, non-principal" clause needs `q ≥ 3`; affects a stated result.
- **Error** in ford2002zerofree after Theorem 3, p. 3: the source says the width of (1.8) times `log t` decreases in `t`; it increases, from `0.118151` at `5.45·10⁸` towards `0.29772`, which is what makes Theorem 4 follow; affects the proof.
- **Gap** in bmor2021 at Lemma 6.1(c), p. 20: the lemma states the bound `ℓ log(2 + ℓ)` for `1.567 ≤ ℓ ≤ 6`, weaker than Theorem 1.1's `0.22737ℓ + 2 log(1 + ℓ) − 0.5`; the text (lines 93–95, 915) says the computation verified Theorem 1.1's bound there but never displays it; affects the proof.
- **Misprint** in ramare2016density at Lemma 3.1, line 284: the source says the count of squarefree numbers is `6D/π² + O*(0.1333√D)` for `D ≥ 1004`; it should be `D ≥ 1664` (the bound fails at `D = 1411, 1419, 1659, 1662, 1663`); affects nothing (the lemma is used for `D ≥ 1700`).
- **Misprint** in ramare-rumely-1996 at Theorem 3.6.2, proof, p. 408: the source says the bound at `k = 1`, `|γ| = 1000` is below `0.02194`; it should be `0.02208`; affects nothing.
- **Gap** in yang2024 at the proof of Corollary 1.2, p. 41: the source says `RH(5.45·10⁸)` and region (1.4) cover `H ≤ t < e^{170.2}`; (1.4) misses (1.6) for `20.12 ≤ log t < 50.13`; affects the proof.
- **Misprint** in patel2022 at Lemma 3.1, p. 5: `β₄` is printed with `18/20`; the proof gives `18/10`; affects a stated result.
- **Misprint** in hasanalizadeshenwong2022 at Corollary 1.2, p. 2: the constant `9.3675` should be `9.4925` for that paper's argument (bellottiwong2025 footnote 1); affects a stated result.
