# Review of ExplicitPrimeCounting (pull request #1945 at 03fb1a7)

**Verdict:** needs changes

Five findings: three P2 and two P3.

- **R01 (P2):** §6.3 assumes the wrong zero-free region for small moduli. Bennett–Martin–O'Bryant–Rechnitzer's tables for `3 ≤ q ≤ 10⁵` rest on Kadiri's `5.6` region, which neither §6.3 nor the supplier contract consumes.
- **R02 (P2):** §3.7's hypothesis list omits the hypotheses of §2.1 and of §3.1(a). Its own rows `b ≥ 2500` and its discharge of *PsiThetaUpper* use them.
- **R03 (P2):** `li` and its API are still owned both here (§0.3a) and by SpecialFunctionsEiLiErfIncompleteGamma §§8.2–8.5. This is review 8's R02. The Lean part of that finding is repaired; the README part is not.
- **R04 (P3):** EffectiveClassNumbers consumes §0.3b, but Downstream consumers does not list it. It also cites two Lean names that this head deleted.
- **R05 (P3):** line 394 calls AnalyticNumberTheoryPartI's carrier `theta_ap`; that roadmap's carrier is `thetaAP`.

The gate passes. The dependency check reports 0 problems. `Suggested.lean` elaborates with 15 `sorry` warnings and nothing else. None of its 15 theorems closes in one tactic.

## Status of review 8's findings

- **R01 (the modulus form of Ramaré–Rumely's region): repaired.** §6.1, lines 2855–2858, now owns it: "*Ramaré–Rumely's region for a modulus.* … Prove: for `q ≥ 1`, `H ≥ 1000` and `0 < C ≤ C₁(k, H)` for the conductor `k` of every character modulo `q`, *RamareRumelyRegion* `q H C` holds".
  - The route is the one requested. Its positivity step is checked at `ramare-rumely-1996` lines 839–843, where `R ln(k|γ|/C₁(χ)) ≥ 15`.
  - The contract (line 496) now ends "with no record".
  - ExplicitZetaBounds' Not owned here (its README lines 155–157, head `c6ba511`) names this §6.1 as the owner. Each roadmap now has one role.
- **R02 (`li` owned twice): partly repaired.**
  - Repaired: `Suggested.lean` no longer declares `liTwo` or the ten `li` theorems.
  - Not repaired: README lines 99–101 still say "Owned here: The unoffset logarithmic integral `li` … with its principal-value integral, its derivative `1/log x`, its monotonicity and sign, the identity `Li x = li x − li 2` … and its asymptotic expansion (§0.3a)", and §0.3a still reads "Prove:".
  - See R03 below.
- **R03 (the rational adapter and `p_n ∼ n log n`): moot.** The merge order now puts EffectiveClassNumbers at 267, after this roadmap at 266. That roadmap's head `ba3ce95` cites §0.3b (its README lines 27 and 129–130), so §0.3b is the right owner. The deleted Lean names leave a dangling citation there (R04).
- **R04 (§6.2a): repaired.**
  - §6.2a and `LFunction_ofReal_ne_zero_of_criticalLineUpTo` are gone.
  - §6.3 (lines 2946–2949) and §1.7 (lines 1186–1189) cite ExplicitZetaBounds §0.3 `LFunction_ne_zero_of_platt` and the trivial case of its §7.9.
- **R05 (records the supplier states under): repaired.** Each contract now carries the supplier's records, and each matches ExplicitZetaBounds at `c6ba511`:
  - lines 494–506, the gap contracts;
  - line 462, `168π < T₀ ≤ T₁ ≤ T₂`;
  - line 211;
  - §§1.7, 3.4, 4.3, 6.1, 6.3, 6.6 and 6.7.
- **R06 (the `1/p` transfer at `k = 1`): repaired.**
  - Line 2401 reads "with `k > 0`".
  - The new Check (lines 2479–2483) gives `0.11500` both ways.
- **R07 (the threshold exponent): repaired.** Line 2996 reads "`exp(0.03 · 316.23 · 1526.0) = exp(14 477)`"; recomputed `14 477.10`.

## R01 (P2) — §6.3 assumes the `6.4355` region; the paper's small-modulus tables need Kadiri's `5.6` region

**Location.** `TauCetiRoadmap/ExplicitPrimeCounting/README.md`:

- lines 2949–2951: "the region for `L(s, χ)` with `R = 6.4355` and its exceptional clause (`gap:dirichlet-zero-free-constants`)";
- line 2962: "Route: §6.1 in the McCurley shape with the region of `gap:dirichlet-zero-free-constants`";
- line 496, the contract, which lists Kadiri's `6.4355`, McCurley, Thorner–Zaman, Lu–Zaman–Zhao and Ramaré–Rumely, but not Kadiri's `5.60` item.

**Claim.** For `3 ≤ q ≤ 10⁵` the paper's constants rest on its Hypothesis Z(10⁸/q, 5.6), with `R = 5.6`:

- Platt's verification up to `10⁸/q`;
- above it, `β ≤ 1 − 1/(5.6 log(q|γ|))`, from Kadiri's 2018 region (its reference [17]) and, for conductors `1` and `2`, Mossinghoff–Trudgian.

The `6.4355` region is narrower and does not imply that hypothesis. *BMORTables* evaluates "the explicit error function of the paper's proof", which is taken at `R = 5.6`. So under the stated hypotheses the route of §6.3 for small `q` does not go through. The paper itself notes that its constants decrease roughly linearly in `R` (lines 393–398).

**Witness.** `bennett-martin-obryant-rechnitzer-2018`:

- lines 2784–2795: Proposition 4.34 (Z(10⁸/q, 5.6) by Platt, Kadiri [17] and Mossinghoff–Trudgian) and "We always choose … `R = 5.6`";
- line 5158: [17] is Kadiri, Mathematika 64 (2018).

At `q = 10⁴` and `|γ| = 10⁴`:

| Region | Lower bound for `1 − β` |
|---|---|
| Z(10⁸/q, 5.6) | `1/(5.6 log 10⁸) = 0.0096941` |
| `6.4355` | `1/(6.4355 log 10⁸) = 0.0084355` |

**Repair.**

1. At lines 2949–2951 replace the region by two clauses:
   - for `3 ≤ q ≤ 10⁵`: Kadiri's region, ExplicitZetaBounds §7.5 second item (its README lines 2280–2284, `LFunction_ne_zero_kadiri`, given `RH(545 439 823)` and *PlattRecord*: `L(s, χ) ≠ 0` for `Re s ≥ 1 − 1/(5.60 log(q max(1, |Im s|)))`, `χ` non-principal primitive, `3 ≤ q ≤ 400 000`). Add to it the classical-shape region for `ζ` with `R = 5.573412` (`gap:classical-zero-free-constants`) for the characters of conductor `1`. With `GRH*(q, 10⁸/q)` these give the paper's Hypothesis Z(10⁸/q, 5.6).
   - for `q > 10⁵`: McCurley's region and its exceptional clause.
2. Add the `5.60` item, with those hypotheses, to the contract at line 496, to the *Needs:* line (lines 2988–2991) and to the Layer 6 Dependencies.
3. Optionally, list the paper's own exceptional-zero bound as a fourth form of the clause (lines 2967–2978). That bound, `β ≤ 1 − 40/(√q log² q)` for every `q ≥ 3`, is stated by AnalyticNumberTheoryPartI §0.7 (`quadratic_real_zero_le_of_bmor`, its README line 251).

**Tested.** At the instance above, Kadiri's item gives `1/(5.60 log 10⁸) = 0.0096941`, equal to what Z(10⁸/q, 5.6) requires. A zero of conductor `1` with `|γ| > 10⁴` has `1 − β > 1/(5.573412 log|γ|) ≥ 1/(5.6 log(q|γ|))`.

## R02 (P2) — §3.7's hypothesis list omits the inputs of its rows `b ≥ 2500` and of its discharge of *PsiThetaUpper*

**Location.** README lines 2227–2229: "Under `RH(3 000 175 332 800)`, the classical-shape region with `R = 5.573412`, the zero count, the density bounds of `gap:explicit-zero-density`, *BKLNWPsiTable* (§3.1), *BKLNWThetaTables* below, `ButheVerified` and *BKLNWRange*".

**Claim.** Every instance of §3.7 beyond `e²⁵⁰⁰` uses one of two routes, and the list above omits the hypotheses of both.

- **Through *BKLNWPsiTable*'s rows `b ≥ 2500`.** By lines 1760–1763 these rows are §3.1(d) "with the Dudek-shape error of §2.1". The truncated explicit formula of §2.1 assumes three regions (lines 1280–1283):
  - the classical-shape region with `R₀ = 5.5666305`;
  - Ford's region;
  - the region of `gap:vinogradov-korobov-constants`.

  The listed `5.573412` region is the narrower one and does not give the first of these.
- **Through §3.1(a).** The discharge of *PsiThetaUpper* (lines 2249–2255) uses §3.1(a) beyond `e²⁵⁰⁰`, "under `ZetaZeroCubeSum` and the absence of zeros up to height 14". Neither of these is listed.

The Layer 3 standard route (lines 1606–1611) counts "for (d) the truncated explicit formula the source uses (§2.1 …)" among each instance's hypotheses, and §3.4's Platt–Trudgian item carries it. The sections that state results "under the tables of §3.7" inherit the gap: §§3.3, 3.5, 4.3, 4.4, 4.6 and 7.4.

**Witness.** At `log x = 2500` the two routes cover different items:

| Item | Bound needed | §3.1(a) at `R = 5.69693` gives | Route |
|---|---|---|---|
| `θ(x) ≤ (1 + 1.93378·10⁻⁸) x` | `1.93378·10⁻⁸` | `ε_R = 5.83·10⁻⁹` | (a) suffices, but only under `ZetaZeroCubeSum` |
| `0.024334 x/log³ x` | `1.56·10⁻¹²` | `5.83·10⁻⁹` | (a) is too weak; needs (d) with §2.1 |

**Repair.** Append to the list at lines 2227–2229:

- "the hypotheses of the truncated explicit formula of §2.1 (the classical-shape region with `R₀ = 5.5666305`, Ford's region of ExplicitZetaBounds §7.2 from `1.88·10¹⁴`, the region of `gap:vinogradov-korobov-constants`), for the rows `b ≥ 2500` of *BKLNWPsiTable*";
- "`ZetaZeroCubeSum` and the absence of zeros with `0 < Re s < 1` and `|Im s| ≤ 14` (§3.1(a)), for the discharge of *PsiThetaUpper* beyond `e²⁵⁰⁰`".

**Tested.** With these hypotheses both items at `log x = 2500` have a route, by (d) and by (a) respectively, as in the table above.

## R03 (P2) — `li` is still owned twice: §0.3a and SpecialFunctionsEiLiErfIncompleteGamma §§8.2–8.5

Not repaired from review 8's R02, whose README part is unchanged. No repair report marks it as not actionable.

**Location.**

- README line 6: "It builds the unoffset logarithmic integral `li`";
- lines 99–101, the Owned-here bullet quoted above;
- line 512: "builds the carriers that the library lacks (`li`, …)";
- §0.3a, lines 730–778, whose items begin "Prove:";
- `TauCetiRoadmap/ExplicitPrimeCounting/Suggested.lean` lines 90–93, the docstring of `li`.

**Claim.** SpecialFunctionsEiLiErfIncompleteGamma is an open pull request by another author that adds a new roadmap folder, so it is an admissible supplier. At its head `7a75a23` it defines the same `li`, as `TauCeti.Real.principalLogIntegral = Ei(log x)`. It owns every item of §0.3a:

- the derivative `1/ln x` and the limit `0` at `0⁺`;
- the principal value 6.2.8;
- `logIntegral_eq_principalLogIntegral_sub`, which is `Li x = li x − li 2`;
- the monotonicity of `Ei`;
- the expansion of `li`;
- the unique positive zero `x₀` of `Ei`, which gives Soldner's `μ = e^{x₀}` and `li > 0` from `3/2`.

**Witness.** Its README, head `7a75a23`:

- lines 1002–1003: "`li` is `TauCeti.Real.principalLogIntegral`";
- line 1023: `logIntegral_eq_principalLogIntegral_sub`;
- §8.4, line 1042: "The expansion of `li(x)` follows";
- §8.5, line 1059: `x₀ ∈ (0.3725074107, 0.3725074108)`.

**Repair.**

1. Delete the Owned-here bullet and the "Prove:" items of §0.3a.
2. Keep one paragraph saying that `li` is that roadmap's `principalLogIntegral`, the series being its DLMF 6.6.1 (§8.3).
3. Add "From TauCetiRoadmap.SpecialFunctionsEiLiErfIncompleteGamma", citing:
   - §8.2: the derivative, the limit at `0⁺`, 6.2.8 and `logIntegral_eq_principalLogIntegral_sub`;
   - §8.3: the series;
   - §8.4: the expansion;
   - §8.5: `x₀`, hence `μ = e^{x₀}` and `li x > 0` for `x ≥ 3/2`.
4. Repoint the citations of §0.3a at §§0.4, 2.2 and 4.6 to that roadmap.
5. Change "builds" to "uses" at lines 6 and 512.
6. In `Suggested.lean`, keep `def li`, which the headlines need, and cite that roadmap's §8.2 in its docstring.
7. Add pull request #1924 to this pull request's depends-on list.

**Tested.**

- `li(1.5) = 0.125065 > 0` (the series), consistent with `log 1.5 = 0.405465 > x₀`.
- `li(2) = 1.0451637801`, inside that roadmap's §8.2 Check interval `(1.0451637801, 1.0451637802)`.

## R04 (P3) — EffectiveClassNumbers consumes §0.3b but is not listed, and cites two names this head deleted

**Location.** README lines 3490–3512 (Downstream consumers) name ExplicitCharacterSumsAndSieves, ExplicitMultiplicativeFunctions and ExplicitNumberFields, but not EffectiveClassNumbers. §0.3b is at lines 780–803.

**Claim.** EffectiveClassNumbers is now later in the merge order (267, against this roadmap's 266). At its head `ba3ce95` it takes both statements of §0.3b by section and also by the Lean names `primeCount_rat_eq_primeCounting` and `nth_prime_isEquivalent`.

This head rightly deleted those names from `Suggested.lean`: they are carrier API, not headlines. So the consumer's names no longer exist, and the README does not record the consumer.

**Witness.**

- EffectiveClassNumbers README lines 129–130: "[§0.3b](…), `primeCount_rat_eq_primeCounting`: … [§0.3b](…), `nth_prime_isEquivalent`". Line 956 repeats both names.
- Here, `Suggested.lean` declares neither; at `11fa2ff` it did, at lines 163 and 168.

**Repair.**

1. Add a Downstream-consumers bullet: "EffectiveClassNumbers §4.4: the rational prime-count adapter and `p_n ∼ n log n` of §0.3b, cited by section (neither is a headline of `Suggested.lean`)."
2. In EffectiveClassNumbers, replace the two backticked names by §0.3b's statements.

**Tested.** Neither name occurs in this head's `Suggested.lean` (0 occurrences).

## R05 (P3) — `theta_ap` is not AnalyticNumberTheoryPartI's carrier

**Location.** README line 394: "§0.2 `psiAP q a x`, `primeCountAP q a x`, `theta_ap` with `theta_ap.level_one` and `theta_ap.sum_classes`".

**Claim.** The carrier of AnalyticNumberTheoryPartI §0.2 is `thetaAP`. The two dotted names are that roadmap's API names and stay as they are.

**Witness.** AnalyticNumberTheoryPartI (head `ead4cdb`):

- README line 190: "The Lean carrier is `thetaAP`";
- its `Suggested.lean` line 116 declares `def thetaAP`, and no `theta_ap` occurs there.

**Repair.** Write "`thetaAP` with `theta_ap.level_one` and `theta_ap.sum_classes`".

**Tested.** `thetaAP (q : ℕ) (a : ZMod q) (x : ℝ)` is the declared carrier.

## Verified sound

### Gate, dependency check, build, signatures and probe

- **Gate,** rerun at `03fb1a7`: every check `0`, "OK", exit 0. The diff outside the folder is empty.
- **Dependency check:** "depcheck: 237 roadmaps, 2425 edges, 0 problem(s)", with no UPWARD, CYCLE or moved line.
- **Merge order:** LFunctions 27, ZerosOfLFunctions 50, AnalyticNumberTheoryPartI 51, SieveMethodsAndPrimePatterns 54, ExplicitZetaBounds 265, **ExplicitPrimeCounting 266**. Then EffectiveClassNumbers 267, ExplicitCharacterSumsAndSieves 268, ExplicitMultiplicativeFunctions 269, ExplicitNumberFields 270 and ComputationalNumberTheory 271, none of which the README cites as a supplier.
- **Elaboration:** `lake env lean` on `Suggested.lean` gives 15 "declaration uses `sorry`" warnings, exit 0.
- **Signatures:** a scratch copy with `#check @name` for all 38 declarations (23 definitions, 15 theorems) elaborates.
  - The file has no `variable` block; every hypothesis is in the declaration's own signature.
  - Each elaborated type was compared with its README statement. They agree:
    - the seven clauses of `schoenfeld_of_riemannHypothesis` against §2.2;
    - the four of `buthe_…` and `johnston_…` against §2.3;
    - `max 8.36 (8 / R)` in `dusart_of_zeroFreeRegion`;
    - the shift `k − 1` in `dusart_nth_prime_lower`;
    - the unit and `χ ≠ 1 ∨ s ≠ 1` clauses of `lamzouri_li_soundararajan`.
  - Nothing was changed.
- **One-tactic probe:** each of the 15 theorems was given `first | (simp; done) | rfl | (norm_num; done) | infer_instance | exact?`. All 15 fail with "`exact?` could not close the goal".
- **Definitions:** every one of the 23 is used by a theorem. None is a `sorry`'d definition.
- **Headline coverage:** every Lean name appears in the README.

### Headlines (README lines 31–59)

- **Stated:**
  - `leeNosal_of_riemannHypothesis` and `leeNosal_theta_of_riemannHypothesis`;
  - `schoenfeld_of_riemannHypothesis`, including `π − li`;
  - `carneiro_milinovich_soundararajan`;
  - `buthe_of_riemannHypothesisUpTo` and `johnston_of_riemannHypothesisUpTo`;
  - `dusart_of_zeroFreeRegion` and `axler_primeCounting_upper`;
  - `brun_titchmarsh`;
  - `vanlalngaia_sum_inv_prime` and `dusart_nth_prime_lower`;
  - `lamzouri_li_soundararajan`;
  - `schoenfeld_interval`, `trudgian_interval` and `axler_interval`.
- **Named in the module docstring (lines 50–79) as resting on table propositions:** Rosser–Schoenfeld's `1.03883`, Broadbent–Kadiri–Lumley–Ng–Wilk's `θ` bound, Fiori–Kadiri–Swidinsky, and Bennett–Martin–O'Bryant–Rechnitzer.
- **No padding:** no declaration restates a definition, mirrors a Check or computes a value.

### Numerical checks of the hypotheses of `brun_titchmarsh`

- **`BrunTitchmarshFiniteRange`** holds at every `n` in `[25, 2·10⁴]`. For each `n` the best `Q ≤ 3√(n + 1) + 20` was searched. The least margin `2n/log n − (1/L + π(Q))` is `0.0229`, at `n = 25` with `Q = 3` (`15.5105` against `15.5334`).
- **`MVDiagonalFiniteRange`** holds for every integer `6 ≤ n < 2·10⁶`, taking `u → (n + 1)⁻`. The least `S(n) − log(n + 1) − 1.07` is `0.0441`, at `n = 9`.

### Adversarial table

Values come from double-precision evaluation, from sieves, and from the exponential-integral series for `li` summed to machine precision.

| Statement | Instance | Values (each side) | Result | Change |
|---|---|---|---|---|
| §0.1 negative control | `γ` in place of `1.07` | `log 6 + γ − log 12 + ½ log(2/3) = −0.3187` against `0.17412` | as stated | none |
| §0.1 junk value | `y = k = 1` | right side `2/(1 · 0) = 0` in Lean; `(1.5, 2.5]` holds `2` | `y > k` needed | none |
| §0.6 agreement | `q = 4, a = 3, x = 3`; `q = 0, a = −5, x = 5` | `1 = 1`; `0` against `1` (`ZMod.val (−5 : ℤ) = 5`) | as stated | none |
| §1.6 enclosures | `γ`, `B` | `|γ − 0.5772156649| = 1.5·10⁻¹²`; `|B − 0.2614972128| = 4.8·10⁻¹¹` | holds | none |
| §2.1 sum over zeros | `2 + γ − log 4π` | `0.046191`; half `0.023096` | holds | none |
| §2.1 BPT without convexity | `T₁ = γ₀ − 1 > 168π`; `T₁ = 14` | bound `1.24·10⁻⁴` against `|Q| ≥ 1/2` near an ordinate; `0.00469` against `Q(20.5) = −0.4706`, `Q(21) = −0.5657` | false without `φ″ > 0`, as stated | none |
| §2.1 Dudek shape | first row of Table 4 | `6.431 ≤ 2 log x` iff `log x ≥ 3.22` | holds from `e⁴⁰` | none |
| `leeNosal_of_riemannHypothesis` | `ButheVerified` crossovers | `L(L − log L) = 23.6247` at `337.09` against `0.94·8π = 23.6248`; `49.0087` at `3381.6` against `49.0088` | ranges abut | none |
| §2.2 zero-count branches | `L = log T` | Rosser `≤ 0.28 log T` from `L = 20.455`; Bellotti–Wong smaller from `L = 55.46` | holds | none |
| §2.2 Theorem 1.1 at `x = 11` | factor | `1.5691 > 0.94`; `|ψ(11) − 11| = 0.770` | holds | none |
| `ZetaZeroCountLowRange` | `T → 14.13⁻` | `|0 − M| = 0.4487 ≤ 0.28 log T = 0.7415` | holds | none |
| §2.5 Schoenfeld corollary | `x = 600` | `h = 79.76`, `x − h = 520.2 > 1` | holds | none |
| §2.5 CMS Lemma 9 from Rosser | maximum of `0.443 log L − 0.013 L` | `1.1202` at `L = 34.08` against `1.412`; total `0.15 log T + 3.000` | holds | none |
| `carneiro_milinovich_soundararajan` | `4 ≤ x ≤ 4·10¹⁸` | `log x/√x ≤ 2/e = 0.7358 < 0.88` | holds | none |
| `dusart_of_zeroFreeRegion` | `R = 5.69693` | `X ≥ 8.36` iff `log x ≥ 398.16`; `8R` would need `log x ≥ 11 833` | `8/R` is correct | none |
| §3.2 `ψ − θ` upper | `x = 10⁸` | `∑_{k≥3} x^{1/k}/x^{1/3} = 1.53390`; `1.001093 · 1.534 = 1.5357 ≤ 1.536` | holds | none |
| §3.2 Theorem 7* | `x = e²²` | `0.94√x = 5.63·10⁴` against `0.0077629 x/log x = 1.265·10⁶` | holds | none |
| §3.3 `ψ − θ` beyond `10²⁴` | `x = 10²⁴` | `76·10⁶ = 0.76 x^{1/3}`; `1.000081 · 1.76 = 1.7601 < 1.777745` | holds | none |
| §3.4 Trudgian's region | crossovers | `17 e^{2/6.455} = 23.17`; `3.0014·10¹⁰` | holds | none |
| §3.4 Faber–Kadiri | `0.94√x ≤ 5.3688·10⁻⁴ x` | `x ≥ 3.066·10⁶` | holds | none |
| §3.4 Johnston–Yang from FKS | `x = 2` | ratio `1.0301 ≥ 1` | holds | none |
| §3.7 hypotheses | `log x = 2500` | (a) `5.83·10⁻⁹` against `1.93378·10⁻⁸` and against `1.56·10⁻¹²` | inputs missing | R02 |
| §4.1 | `x = 1.5` | `log log 1.5 = −0.903 < 0` | holds | none |
| §4.2 Ramaré | constants | `0.000291/1.75·10⁻¹² = 1.663·10⁸`; tail at `log x = 9270`: `1.19·10⁻³⁴` | holds | none |
| §4.3 exact form | `x = 3` | `0.83333` both sides | holds | none |
| §4.3 transfer | `k = 1`, `η = 1`, `log x = 10` | `0.11500 = 0.01 + 0.005 + 0.1` | holds | none |
| `vanlalngaia_sum_inv_prime` | `x = 89 967 803` | `1/3 + 5/(4 · 18.315) = 0.40158 ≤ 0.41` | holds | none |
| §4.3 Corollary 2 | `R = 5.5666305` / `5.69693` | `814R = 4531.24` / `4637.30`; `1.6R^{−1/4} = 1.0416` / `1.0356`; `1/R = 0.17964` / `0.17553` | as stated | none |
| §5.1 negative control | `n = 61`, `p = 283` | `277.27 < 283 < 283.37`; wrong substitution `277.49`; `L = 5.82007`, stated form `285.70 ≥ 283` | as stated | none |
| §5.5 Zhang–Xiong | `B_η` increasing in `η` | `3.151332 > 2.9`; `4.168668 < 4.42` | consistent | none |
| §6.1 *RamareRumelyRegion* | `q = 6`, `k = 3`, `|γ| = 10⁴` | `0.014264` (conductor) `≥ 0.013022` (modulus) `≥ 0.010829` (`C₁`); `R log(1000/C₁) = 52.85 ≥ 15` | holds | none |
| §6.3 region | `q = 10⁴`, `|γ| = 10⁴` | Z(·, 5.6) needs `0.0096941`; `6.4355` gives `0.0084355` | hypothesis too weak | R01 |
| §6.3 threshold | `q = 10⁵ + 1` | `0.03 · 316.229 · 1526.006 = 14 477.1` | holds | none |
| §6.6 nesting | `q = 10⁵` | `0.013363` (`6.50`), `0.013497` (`6.4355`) | holds | none |
| §6.7(a), (b) | `c = 1/5`, `3·10⁻³` | `0.2 > 0.10367`, `0.2 > 0.15385`; `0.003 < 0.1037`; `1/0.003 = 333.3` | holds | none |
| `lamzouri_li_soundararajan` | `q = 4` | least primes `5`, `3` against `(2 log 4)² = 7.687` | holds | none |
| `trudgian_interval` | `x = 2 898 240`; `2 898 242` | ends `2 898 357.93`, `2 898 359.93`; next prime `2 898 359` | threshold `2 898 242` needed | none |
| `axler_interval` | switch at `e²⁵⁰` | margin `6.41·10⁻¹²`; switch needs `log x₀ > 243.33` | holds | none |
| §0.3a `li` | `x = 1.5`, `2` | `0.125065`, `1.0451637801` | true; owned twice | R03 |

### Sampled locators verified against the text

- **§0.1:**
  - `tmeemt-art14` lines 79–87 (hypotheses `x, y > 0`, `y > k`, `k`, `l` coprime);
  - `buthe-2014` lines 62–66 (`Θ`), 139–146 (`S_k`) and 462–469 (Lemma 4.5, `58/√z`, `z ≥ 10⁹`).
- **§0.6:**
  - AnalyticNumberTheoryPartI (`ead4cdb`) `psiAP` and `primeCountAP` (its `Suggested.lean`), and the README API names `theta_ap.level_one` and `theta_ap.sum_classes` (R05);
  - SieveMethodsAndPrimePatterns (`eecdf1d`): `SieveDistribution.primeCountAP (x : ℝ) (q a : ℕ)`, `p ≡ a [MOD q]`;
  - ZerosOfLFunctions (main) §8.7, *rayClassPsi*.
- **§1.6:** `ramare-rumely-1996` line 294 (`γ`); `rosser-schoenfeld-1962` line 81 (`B = 0.26149 72128 47643`).
- **§2.1:**
  - `cully-hugill-johnston-2021` lines 83–93 and Table 4, lines 1066–1074 (rows `(40, 1/2, 0.48, 6.431)`, `(10³, 1/10, 1.05, 2.045)`, `(10³, 1/100, 1.80, 0.6651)`; see Source issues);
  - `dudek-2016` lines 115–125;
  - `kadiri-lumley-2014` lines 503–509;
  - `rosser-schoenfeld-1975` line 537 (`m = 1`);
  - `carneiro-milinovich-soundararajan-2019` lines 1185–1189;
  - `faber-kadiri-2015` lines 432–450 (Rosser–Schoenfeld's Lemma 7).
- **§2.5:**
  - `dudek-2015` lines 47–52;
  - `carneiro-milinovich-soundararajan-2019` lines 167, 259–273, 1309–1319 and 1367–1371.
- **§3.2:**
  - `rosser-schoenfeld-1962` lines 252–253, 304–308 and 328–342;
  - `schoenfeld-1976` lines 201–206, 729–733, 767–772 and 1280–1294.
- **§3.3:**
  - `dusart-1998-thesis` lines 845–874 and 924–926;
  - `dusart-1999-mc` lines 102–108;
  - `dusart-2016` lines 74–90.
- **§3.4:**
  - `faber-kadiri-2015` line 43;
  - `faber-kadiri-2018-corrigendum` lines 85–98;
  - `trudgian-2016` lines 49–73, 132–140 and 229–236;
  - `platt-trudgian-2021-error` lines 58–92 and 133–135;
  - `johnston-yang-2023` lines 57–84, 244–258 and 272–284;
  - `fiori-kadiri-swidinsky-2023` lines 151–176 and 700–726.
- **§4.1:** `rosser-schoenfeld-1962` lines 256–322.
- **§4.2:** `ramare-2013` lines 82–108.
- **§4.3:** `vanlalngaia-2017` lines 26–65, 79–92, 111–114 and 234–240 (letters decoded per the References).
- **§5.1:** `dusart-1999-mc` lines 110–126.
- **§5.5:**
  - `axler-2019` lines 145–166 and 337;
  - `de-koninck-letendre-2020` lines 489–499.
- **§6.3:** `bennett-martin-obryant-rechnitzer-2018` lines 105–113, 165–195, 367–379, 2784–2795 and 3307–3311 (R01).
- **§6.7:** logic and constants recomputed (table). The supplier statements are compared with ExplicitZetaBounds §§7.5 and 7.9 at `c6ba511`.
- **New §6.1 target:**
  - `ramare-rumely-1996` lines 822–849 (Theorem 3.6.3, the bound `≥ 15` and the example `k = 3`, `20.92`);
  - `dusart-2002` lines 100–112 (`C₁(k)` and `9.14`).
- **Unverified flags:** the README flags no locator as unverified.

### Library declarations opened at the pins

- **Elaborated:** 87 Mathlib and Tau Ceti names cited by the README elaborated with `#check` at the pins, with 0 errors. Among them:
  - `DirichletCharacter.LFunction_changeLevel` (which needs `χ ≠ 1 ∨ s ≠ 1`, as §6.1's "for `s ≠ 1`" says);
  - `DirichletCharacter.changeLevel_primitiveCharacter`, `DirichletCharacter.conductor_dvd_level` and `DirichletCharacter.primitiveCharacter_isPrimitive`;
  - `IsCyclotomicExtension.Rat.natAbs_discr` and `Rat.HeightOneSpectrum.primesEquiv`;
  - `Chebyshev.primeCounting_eq_theta_div_log_add_integral`.
- **Found by search** (their modules are not built at the pin):
  - `Nat.primeCounting_nth_prime` and `Nat.primesLE_eq_image_nth` (`TauCeti/NumberTheory/PrimeCounting.lean:90`, `:70`);
  - `NumberField.Chebotarev.primeCount_primesCongruent_isEquivalent_logIntegral` (`TauCeti/NumberTheory/Chebotarev/PrimeCounting/PrimesCongruent.lean:50`).

### Cross-roadmap citations resolved

- **ExplicitZetaBounds (`c6ba511`):**
  - §§0.2, 0.3 (`LFunction_ne_zero_of_platt`), 0.4 and 0.4b (all seven records named here);
  - §5.2 (Rosser, Bellotti–Wong, the `9.3675` form) and §5.4 (Lehman from `2πe`; BPT from `168π`);
  - §7.2, §7.3 (`5.69693` given `RH(30 610 046 000)`; `5.573412` and `5.5666305` given `RH(3·10¹²)` and *BrentPlattTrudgianRecord*);
  - §7.5 (all five items and their records), §7.6, §7.8 and §7.9 (`hasLandauSiegelGap_one_fifth`, Banks given *LuZamanZhaoRecord*, the trivial case);
  - §8.1, §8.3 (*HiaryPatelYangRecord*) and Not owned here (Liu–Wang and *RamareRumelyRegion*).
  - Drift found: only R01.
- **AnalyticNumberTheoryPartI (`ead4cdb`):** §§0.2, 0.3, 0.5, 0.7, 0.8, 0.16, 0.19, 0.25, 0.30, 0.32, 0.34, 1.6 and 1.9, and the four finite-range inputs.
- **SieveMethodsAndPrimePatterns (`eecdf1d`):** §§2.9 and 3.1.
- **On main:** ZerosOfLFunctions §§4.1, 4.5, 6.2–6.4, 8.3–8.9 and Layer 9; ClassFieldTheory Layer 13; LFunctions Layer 4; ClassicalArithmeticCompletion §6.34 (`dyadicPrimeCount`).
- **The two leads in the worker's citation list** (`SieveDistribution.primeCountAP`, `theta_ap.sum_classes`) are roadmap names that resolve in those roadmaps.

### Ownership and gaps

- **Searched by object** (`roadmaps grep`, `roadmaps show`) for:
  - `li`, `Ei` and Soldner's constant (R03; AnalyticNumberTheoryPartII does not own them);
  - Brun–Titchmarsh with the constant `2` (only here; ExplicitCharacterSumsAndSieves, later, cites §0.1);
  - the modulus form of Ramaré–Rumely (here, as the supplier says);
  - the truncated explicit formula with a numerical error (here; ExplicitZetaBounds owns only Perron);
  - the rational adapter (here, R04).
- **Overlap tool:** no dropped id and no other pull request changing this roadmap. The open revisions of ZerosOfLFunctions are not dependencies.
- **Gaps:** the nine gap contracts of the README carry the plan's slugs.
  - The plan's other three are not open prerequisites. `explicit-brun-titchmarsh` (supplier `none`) is §0.1's own theorem. `dirichlet-four-zero-region` is owned here as *LiuWangFourZeros*, which ExplicitZetaBounds declines. `lehman-weighted-zero-sum` is consumed as ExplicitZetaBounds §5.4.
  - None asks for what Mathlib or Tau Ceti already has.

## Not verifiable

Each of these is recorded as uncertified or waived in the manifest and is cited by locator only.

- **Sampled targets:**
  - §2.1: `brent-platt-trudgian-2021` (whether its `L` in `Q = N − L` is `M(T)`).
  - §2.5: `ramare-saouter-2003`.
  - §3.3: `dusart-2018`.
  - §3.4: `fiori-kadiri-swidinsky-2023-psi`.
  - §4.2: `ramare-2023-corrigendum` (the thresholds `1.52·10⁶`, `468 000` and `115`; the 2013 text, line 108, prints a different range), `chirre-helfgott-2025` and `broadbent-fiori-kadiri-ng-wilk-2026`.
  - §4.3: `axler-2024`.
  - §5.5: `zhang-xiong-2025`.
  - §6.7: `lu-zaman-zhao-2026`, `thorner-zaman-2024`, `banks-2026` and `openai-2026-siegel`.
- **Outside the sample:** the remaining settled keys of the manifest, and `cipolla-1902` (waived).

## Source issues

- **Gap** in cully-hugill-johnston-2021 at Theorem 1.2, p. 3 (lines 92–93): the source says that `M = 5.03` is admissible at `(log x_M, α) = (40, 1/2)` and `M = 0.5597` at `(10³, 1/100)`; it should agree with its Table 4 (lines 1067 and 1073), which gives `6.431` and `0.6651` there; affects nothing (the roadmap uses Table 4).
- **Misprint** in dusart-2016 at Theorem 1.1, p. 876 (line 79): the source requires `X ≥ max(8.36, 8R)` while its proof uses `X ≥ 8/R`; it should read `max(8.36, 8/R)`; affects a stated result (Corollary 1.2 from `log x = 400`).
- **Error** in trudgian-2016 at Corollary 2 (line 229): the source states the interval from `2 898 239`; at `x = 2 898 240` it ends at `2 898 357.93`, before the next prime `2 898 359`; it should start at `2 898 242`; affects a stated result.
