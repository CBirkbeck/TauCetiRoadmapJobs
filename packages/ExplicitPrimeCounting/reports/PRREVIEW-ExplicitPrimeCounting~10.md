# Review of ExplicitPrimeCounting (pull request #1945 at bb08e9e)

**Verdict:** needs changes

Eight findings: three P2 and five P3.

**P2:**

- **R01.** Lee–Nosal's headlines take Bellotti–Wong's zero count without the three records under which ExplicitZetaBounds states it.
- **R02.** The density inputs of §§7.3 and 7.5 are assigned the wrong way round against ExplicitZetaBounds §8.3:
  - *CullyHugillLeeDensity* duplicates that section;
  - Cully-Hugill's own constants are a recomputation that no supplier states.
- **R03.** `li` is still owned twice. This is review 9's R03, unrepaired, and this head adds `li` material.

**P3:**

- **R04.** `Suggested.lean` now carries 26 declarations that are not headlines.
- **R05.** Costa Pereira's comparison is planned here, but Mathlib already has it at the pin.
- **R06.** The merge order now places EffectiveClassNumbers before this roadmap, against its Downstream-consumers bullet.
- **R07.** Four new citation keys are missing from the manifest.
- **R08.** Five values of BKLNW's `a₂(b)` table are misquoted.

The checks themselves pass:

- The gate passes, and the dependency check reports 0 problems for this README.
- `Suggested.lean` elaborates with exactly one `sorry` warning per theorem.
- No theorem closes in one tactic.
- Every new statement I computed is true.

## Status of review 9's findings

- **R01 (the `5.6` region for small moduli): repaired.**
  - §6.3, lines 3699–3704, now reads "for `3 ≤ q ≤ 10⁵`, Kadiri's region with `R = 5.60` for the nonprincipal primitive characters of conductor `3 ≤ f ≤ 400 000` … and the classical-shape region for `ζ` with `R = 5.573412`".
  - Lines 3717–3727 derive the paper's Hypothesis Z(10⁸/q, 5.6) from these.
  - The contract (line 536) and the Needs line (lines 3767–3768) carry the `5.60` item.
- **R02 (§3.7's hypotheses): repaired.** Lines 2872–2877 add "the hypotheses of the truncated explicit formula of §2.1 other than *PsiThetaUpper* … `ZetaZeroCubeSum` (§1.1) and the absence of zeros with `0 < Re s < 1` and `|Im s| ≤ 14`".
- **R03 (`li` owned twice): not repaired.** Lines 6 and 104–106 are unchanged, and §0.3a still reads "Prove:". This head adds `li_two_eq_integral` and `li_two_mem`. Raised again as R03 below.
- **R04 (EffectiveClassNumbers not listed): repaired on this side.**
  - Lines 4302–4305 add the consumer.
  - The consumer at head `ba3ce95` still cites the two deleted Lean names (its lines 129–130 and 956).
  - The merge order has since been re-sorted (R06).
- **R05 (`theta_ap`): repaired.** Line 410 reads "`thetaAP q a x` with `theta_ap.level_one` and `theta_ap.sum_classes`". All three resolve in AnalyticNumberTheoryPartI at `e22e67a` (its §0.2: "The Lean carrier is `thetaAP`", and its `Suggested.lean`).

## R01 (P2) — Lee–Nosal's headlines use Bellotti–Wong's zero count without its three records

**Location.**

- `TauCetiRoadmap/ExplicitPrimeCounting/README.md` lines 1744–1745: "its second branch is Bellotti–Wong's first bound of ExplicitZetaBounds §5.2 with `7/8` added (`8.08344 + 0.875 = 8.95844`), unconditional for `T ≥ 30 610 046 000`".
- Line 4247: "for `T ≥ 30 610 046 000` unconditionally".
- `TauCetiRoadmap/ExplicitPrimeCounting/Suggested.lean` lines 459–463 and 469–475, the hypotheses of `leeNosal_of_riemannHypothesis` and `leeNosal_theta_of_riemannHypothesis`.

**Claim.**

- The route of §2.2 takes the zero count `min(0.28 log T, 0.10076 log T + 0.24460 log log T + 8.95844)` for `T ≥ 2π` (line 1733). Its second branch is the smaller one from `log T = 55.46` on.
- ExplicitZetaBounds states that branch only given *HiaryRecord*, *PatelRecord* and *YangRecord*. This README's own contract says the same (line 542: "given *HiaryRecord*, *PatelRecord* and *YangRecord*, Bellotti–Wong's bounds").
- The Conventions (lines 304–309) require a statement whose route takes an object from the supplier to carry those records by name.
- Neither Lean headline carries them. Nor do:
  - §4.7, which takes "the other inputs of §2.2" (lines 3339–3341);
  - Cully-Hugill's item in §7.5 (lines 4246–4248).
- The records are numerical bounds for `|ζ|` on three vertical lines at small heights. `RiemannHypothesis` does not imply them.

**Witness.** ExplicitZetaBounds §5.2 at head `0889de2`: "(Bellotti and Wong, Theorem 1.1 …) given `HiaryRecord`, `PatelRecord` and `YangRecord` (0.4b), for `T ≥ 30 610 046 000`". At `L = 55.46` both branches equal `15.5288`; beyond it the second is the minimum.

**Repair.**

1. Add *HiaryRecord*, *PatelRecord* and *YangRecord* (ExplicitZetaBounds §0.4b) to the hypotheses of `leeNosal_of_riemannHypothesis` and `leeNosal_theta_of_riemannHypothesis` in §2.2 (lines 1702–1703 and 1711–1713).
2. At line 1745 replace "unconditional for `T ≥ 30 610 046 000`" by "given those three records, for `T ≥ 30 610 046 000`". At line 4247 replace "unconditionally" the same way.
3. §4.7 then inherits the records. In §7.5, add them to Cully-Hugill's hypotheses.
4. In `Suggested.lean`:
   - write the three records out as `Prop`s, as `RiemannHypothesisUpTo` is. Each bounds `‖riemannZeta s‖` on a stated segment, so each is statable at the pin.
   - add them as hypotheses of the two headlines.

If instead the paper's argument above `10¹⁹` goes through with the first branch alone, show that and drop the second branch from the route.

**Tested.** With the records, the route's zero count holds for every `T ≥ 2π`:

- `ZetaZeroCountLowRange` below `10⁹`;
- Rosser's bound, at most `0.28 log T` from `log T = 20.455`;
- Bellotti–Wong's bound, the minimum from `log T = 55.46`.

## R02 (P2) — The density inputs of §§7.3 and 7.5 are assigned the wrong way round against ExplicitZetaBounds §8.3

**Location.**

- **(a)**
  - Lines 4121–4127, *CullyHugillLeeDensity*: "`N°(σ, T) ≤ (C₁/(2πd)) (log kT)^{2σ} (log T)^{5−4σ} T^{8(1−σ)/3} + (C₂/(2πd)) log² T`, with `C₁`, `C₂` the closed forms (4.72)–(4.73) at that `H₀`".
  - Lines 448–450: "which that roadmap's §8.3 does not state: it states the theorem at `H₀ = 3.0610046·10¹⁰` only".
  - Also lines 89, 4097–4098 and 4133.
- **(b)** Lines 4241–4244, Cully-Hugill: "with the density bounds of Kadiri–Lumley–Ng's shape for `N°(σ, T)` at the paper's parameters (its lines 113–118; ExplicitZetaBounds §8.3, `gap:explicit-zero-density`)".

**Claim (a).**

- ExplicitZetaBounds §8.3 now states Kadiri–Lumley–Ng's theorem at every verification height `H₀`, given `RH(H₀)` and *HiaryRecord*, with the closed forms evaluated at `H₀`.
- At `H₀ = 3 000 175 332 800` that is *CullyHugillLeeDensity* word for word.
- Cully-Hugill–Lee recompute exactly that (`cully-hugill-lee-2022` lines 164–166: the expressions (4.72) and (4.73) at Platt–Trudgian's height).
- So the object is owned twice. Lines 448–450 also contradict this README's own line 523: "the Kadiri–Lumley–Ng instances of its §8.3 at every verification height `H₀`".

**Claim (b).**

- Cully-Hugill does not use that statement. Her constants come from Kadiri–Lumley–Ng's argument with their (3.13) replaced and their Lemma 3.2 corrected.
- ExplicitZetaBounds' Not owned here leaves such recomputed constants to this roadmap.
- So the item (a prime in `(n¹⁵⁵, (n + 1)¹⁵⁵)`, the cubes from `exp(exp(32.892))`) has no stated density hypothesis giving its constants.

**Witness.**

- ExplicitZetaBounds §8.3 (`0889de2`): "the statement is made at every verification height … at `H₀ = 3·10¹²` … the second bound holds from `T = 3·10¹²` on with the closed forms evaluated at that height".
- `cully-hugill-2021` lines 654–660: "we can take `C1 = 17.418` (computed as in Lemma 2.6 of [23]) and `C2 = 5.272`".

**Repair.**

- **(a)**
  1. Delete *CullyHugillLeeDensity*.
  2. In §7.3 cite ExplicitZetaBounds §8.3 at `H₀ = 3 000 175 332 800`. Put `RH(3 000 175 332 800)` and *HiaryRecord* among the hypotheses of Cully-Hugill–Lee's rows and in the Needs line.
  3. Delete the sentence at lines 448–450, the clause "which ExplicitZetaBounds §8.3 does not state" at line 4098, and the mention at line 89.
- **(b)**
  1. State beside §7.5 a zero input *CullyHugillDensity*: the bound of the paper's display (4), with `C₁ = 17.418` and `C₂ = 5.272`, for `T ≥ 3·10¹²`, on the range of `σ` its (19) integrates over (`cully-hugill-2021` lines 117 and 654–660).
  2. Make it a hypothesis of Cully-Hugill's item, and list it in Owned here and in Layer 7's Dependencies.

**Tested.** After (a), the hypothesis of Cully-Hugill–Lee's rows is the supplier's statement at the paper's height, with its records. After (b), the constants of the paper's (21) are hypotheses rather than attributed to a section that states other constants.

## R03 (P2) — `li` is still owned both here and by SpecialFunctionsEiLiErfIncompleteGamma

Review 9's R03, unrepaired. No repair report marks it as not actionable.

**Location.**

- README line 6: "It builds the unoffset logarithmic integral `li`";
- lines 104–106, Owned here;
- line 552: "builds the carriers that the library lacks (`li`, …)";
- §0.3a, lines 814–890, items under "Prove:";
- `Suggested.lean` lines 110–116 (`li`) and 196–207 (`li_two_eq_integral`, `li_two_mem`, new at this head).

**Claim.** SpecialFunctionsEiLiErfIncompleteGamma is pull request #1924, by another author, adding a new folder, so it is an admissible supplier. It defines the same function, `TauCeti.Real.principalLogIntegral = Ei(log x)`, and owns:

- the derivative `1/ln x`, the limit `0` at `0⁺`, the principal value 6.2.8 and `logIntegral_eq_principalLogIntegral_sub` (its §8.2);
- the series (its §8.3) and the expansion of `li` (its §8.4);
- the positive zero of `Ei` (its §8.5).

Its §8.2 Check `li(2) ∈ (1.0451637801, 1.0451637802)` contains `li_two_mem`'s enclosure.

**Witness.** Its README at head `5a3e622`, §8.2:

- "`Ei` is `TauCeti.Real.expIntegralEi`, and `li` is `TauCeti.Real.principalLogIntegral`";
- "`TauCeti.Real.logIntegral x = li(x) − li(2)` for `x > 1` (`logIntegral_eq_principalLogIntegral_sub`)".

**Repair.**

1. Delete the Owned-here bullet and the `li` items of §0.3a: the derivative, the behaviour at `0`, the principal value, the offset, monotonicity and sign, the expansion, the exponential form, the symmetric integral and the enclosure of `li 2`.
2. Keep one paragraph identifying `li` with that roadmap's `principalLogIntegral`.
3. Add "From TauCetiRoadmap.SpecialFunctionsEiLiErfIncompleteGamma" (§§8.2–8.5) to the supplier contracts, and point §§0.4, 2.2, 2.3 and 4.6 there.
4. Change "builds" to "uses" at lines 6 and 552.
5. In `Suggested.lean`, keep `def li` with that citation, and delete `li_two_eq_integral` and `li_two_mem`.
6. Name #1924 in the pull request's depends-on list.

The items about Tau Ceti's offset `Li` stay: the explicit integrals and `logIntegral_sub_div_log_ge`.

**Tested.**

- `li 2 = 1.0451637801` from the series, inside that roadmap's Check interval.
- The symmetric integral evaluates to `1.04516378` (midpoint rule, `2·10⁶` nodes).
- So the two roadmaps' statements agree, and the second copy adds nothing.

## R04 (P3) — `Suggested.lean` has become an API catalogue: 26 declarations are not headlines

**Location.** `Suggested.lean` lines 50–68: "Further targets stated here, those of Layers 0, 1, 3, 4 and 7 that are statable from pointwise inputs or need no input at all". Also README lines 64–66.

**Claim.** None of the following is among the README's end theorems (lines 32–60).

- **Definitions:** `halfWeight`, `psiHalf`, `thetaHalf`, `primeCountingHalf`, `riemannPrimeCountHalf`, `ChebyshevWeightRange`, `IsMaximalPrimeGap`, `firstPrimeGap`, `ramanujanEpsUpper`, `ramanujanEpsLower`.
- **Theorems:** `card_isPrimePow_le`, `li_two_eq_integral`, `li_two_mem`, `integral_inv_log_pow_lt`, `logIntegral_sub_div_log_ge`, `primeCounting_le_of_theta`, `psiHalf_eq_average`, `chebyshev_psi_ge`, `chebyshev_psi_le`, `exists_prime_of_maximal_gap`, `tsum_log_div_prime_mul_pred_le`, `ramanujan_of_primeCounting_bounds`, `primeCounting_sub_logIntegral_le`, `mertens_vonMangoldt_bounds`, `exists_prime_iff_theta_lt`, `exists_prime_of_theta_admissible`.

The sharpest cases:

- four definitions that no theorem uses: `thetaHalf`, `primeCountingHalf`, `riemannPrimeCountHalf`, `firstPrimeGap`;
- `li_two_mem`, which computes a value.

All 16 theorems are true (adversarial table), and none closes in one tactic. The defect is the file's scope, not correctness.

**Witness.** In the file, `firstPrimeGap` occurs only in its definition (line 420), and `riemannPrimeCountHalf` only at line 147. The README's end-theorem list names none of the 26.

**Repair.**

1. Delete the 26 declarations and the "Further targets" block from `Suggested.lean`.
2. Restore README lines 64–66 to "states the headline theorems that are statable against the pinned libraries".
3. In the README, write these names in prose or italics; the gate requires every backticked own name to be declared. The statements stay README targets.

**Tested.** What remains is 15 theorems and 23 definitions, review 9's file. Each remaining definition is used by a headline; for instance `riemannPrimeCount` and `primeReciprocalSum` are used through `ButheVerified` and `VanlalngaiaRange`.

## R05 (P3) — Costa Pereira's comparison is planned here, but Mathlib has it

**Location.** README lines 765–770: "Costa Pereira's comparison (`costa-pereira-1985`, Theorem 1, cited by locator): for every `x > 0`, `ψ(x) − θ(x) ≤ ψ(x^{1/2}) + ψ(x^{1/3}) + ψ(x^{1/5})`. Route: …". It is used at lines 794–795, 2613 and 2928.

**Witness.** `Mathlib/NumberTheory/Chebyshev.lean:617`: `theorem psi_sub_theta_le_psi_add_psi_add_psi (x : ℝ) : ψ x - θ x ≤ ψ (x ^ (2 : ℝ)⁻¹) + ψ (x ^ (3 : ℝ)⁻¹) + ψ (x ^ (5 : ℝ)⁻¹)`. Line 623 is the lower companion with `x^{1/7}`.

**Repair.**

1. Replace the item and its route by a citation of `Chebyshev.psi_sub_theta_le_psi_add_psi_add_psi`, listed with `Chebyshev.psi_sub_theta_ge_psi_add_psi_add_psi` under "From Mathlib".
2. Point §§0.3, 3.4a and 3.7 to it.

**Tested.** Mathlib's statement holds for every real `x`, which contains the README's `x > 0`.

## R06 (P3) — EffectiveClassNumbers is no longer later in the order of supply

**Location.** README line 4302: "EffectiveClassNumbers, later in the order of supply, §4.4 …: the rational prime-count adapter … and the asymptotic `p_n ∼ n log n` of §0.3b".

**Claim.**

- Both copies of the merge order list EffectiveClassNumbers at 268, before this roadmap at 269: the worker's and the gate's.
- The board commit `5304d9d6` moved this roadmap after EffectiveClassNumbers ("after their last suppliers").
- The board's package README still has the old direction: `packages/ExplicitPrimeCounting/README.md` line 348, "From TauCetiRoadmap.EffectiveClassNumbers".
- So the order and this head disagree on who supplies §0.3b, and the consumer's citation now points upward.

**Witness.** The dependency check of EffectiveClassNumbers at head `ba3ce95` reports "UPWARD: EffectiveClassNumbers (#268) -> ExplicitPrimeCounting (#269) at README lines [90, 125, 129, 130, 958, 1044]". The same check of this README reports 0 problems.

**Repair.** Make the order and the text agree, in one of two ways:

- **(i)** Sync the board package to this head, so that the order places EffectiveClassNumbers after this roadmap. This is a worker action; the bullet then stands.
- **(ii)** Keep the order:
  1. move the two statements of §0.3b to EffectiveClassNumbers §4.4;
  2. cite them in §0.4 and Layer 5;
  3. drop the bullet and the Owned-here item at lines 107–108.

**Tested.** On a scratch copy of the order with EffectiveClassNumbers after this roadmap, the check of this README still reports 0 problems. Option (i) needs no change here.

## R07 (P3) — Four works cited at this head are not in the sources manifest

**Location.** The four keys and where they are cited:

- `costa-pereira-1985`, line 765;
- `chebyshev-1852`, line 1122;
- `dudek-platt-2015`, line 2780;
- `mertens-1874`, line 3035.

The References list them at lines 4344–4348 and 4417–4418.

**Witness.** None of the four keys occurs in `packages/ExplicitPrimeCounting/sources.toml` (89 entries). None of them occurs at `03fb1a7`.

**Repair.** Record the four through the sources service:

- `chebyshev-1852` and `mertens-1874` are public domain;
- `costa-pereira-1985` is Math. Comp. 44;
- `dudek-platt-2015` has an arXiv text.

Alternatively, cite two of them through cached quotations:

- Costa Pereira at `broadbent-kadiri-lumley-ng-wilk-2021` lines 866–872, or drop it with R05;
- the Dudek–Platt criterion at `platt-trudgian-2021-error` lines 444–449 and 571–575.

**Tested.** Each quotation states exactly what the README uses:

- the comparison `ψ(x) − θ(x) ≤ ψ(x^{1/2}) + ψ(x^{1/3}) + ψ(x^{1/5})` for `x > 0`;
- `ε_M` and `ε_m` with the coefficients `72, 132, 288, 576, 48` and `206, 364, 381, 238, 97, 30, 8`.

## R08 (P3) — Five values of `a₂(b)` are not those of the table they are attributed to

**Location.** README lines 2911–2916: "`(35, 1.07087)` … `(150, 1 + 3.758·10⁻⁶)`, `(200, 1 + 7.813·10⁻⁸)`, `(250, 1 + 2.125·10⁻⁸)` and `(300, 1 + 2.937·10⁻⁸)`. The printed lower ends at `b = 200, 250, 300` exceed the value of this formula".

**Witness.**

| `b` | Printed (arXiv v2, lines 509–512) | Recomputed from (2.12) |
|---|---|---|
| 35 | `1.07086` | `1.0708607` |
| 150 | `1 + 3.749·10⁻⁶` | `1 + 3.7481·10⁻⁶` |
| 200 | `1 + 7.712·10⁻⁸` | `1 + 7.7118·10⁻⁸` |
| 250 | `1 + 2.024·10⁻⁸` | `1 + 2.0234·10⁻⁸` |
| 300 | `1 + 1.936·10⁻⁸` | `1 + 1.9352·10⁻⁸` |

The text prints single values, not ranges with lower ends.

**Repair.**

1. State `(150, 1 + 3.749·10⁻⁶)`, `(200, 1 + 7.712·10⁻⁸)`, `(250, 1 + 2.024·10⁻⁸)` and `(300, 1 + 1.936·10⁻⁸)`. Keep `(35, 1.07087)`.
2. Replace the last two sentences by: "The printed `1.07086` at `b = 35` is below the formula's `1.0708607`, so `1.07087` is stated."

**Tested.** Every repaired value is at least the recomputed one; at `b = 200`, `7.712 ≥ 7.7118`. The README's current values are also upper bounds, but they are not the paper's.

## Verified sound

### Gate, dependency check, build, signatures and probe

- **Gate,** rerun at `bb08e9e`: every check `0`, "OK", exit 0. The worker's run also shows `build=0`. The diff outside the folder is empty.
- **Dependency check:** "depcheck: 237 roadmaps, 2425 edges, 0 problem(s)", with no UPWARD, CYCLE or moved line.
- **Merge order** (both copies agree): LFunctions 27, ZerosOfLFunctions 48, AnalyticNumberTheoryPartI 49, SieveMethodsAndPrimePatterns 56, ProbabilisticAndMetricNumberTheory 61, ExplicitZetaBounds 267, EffectiveClassNumbers 268, **ExplicitPrimeCounting 269**.
- **Pins:** the worktree's `lake-manifest.json` pins equal main's.
- **Elaboration:** `lake env lean` on `Suggested.lean` gives 31 "declaration uses `sorry`" warnings, one per theorem (31 theorems, 33 definitions), and nothing else; exit 0.
- **Signatures:**
  - A scratch copy with `#check @name` for all 64 declarations elaborates with no error.
  - The file has no `variable` block, so no binder can be lost.
  - Each elaborated type matches its README statement, including the strict `<` of `dusart_nth_prime_lower`, new at this head and matching the source's title.
  - Nothing changed.
- **One-tactic probe:** each of the 31 theorems was given `first | (simp; done) | rfl | (norm_num; done) | infer_instance | exact?`. All 31 fail ("`exact?` could not close the goal").
- **Headline coverage.**
  - The statable headlines of README lines 32–60 are all in the file:
    - Lee–Nosal `ψ` and `θ`, Schoenfeld with `π − li`, Carneiro–Milinovich–Soundararajan;
    - Büthe, Johnston, Dusart's region bound, Axler's `π` bound;
    - Brun–Titchmarsh, Vanlalngaia, Dusart's `p_k`, Lamzouri–Li–Soundararajan;
    - Schoenfeld's, Trudgian's and Axler's intervals.
  - The module docstring (lines 70–99) names the others with what they lack: Rosser–Schoenfeld, Broadbent–Kadiri–Lumley–Ng–Wilk, Fiori–Kadiri–Swidinsky and Bennett–Martin–O'Bryant–Rechnitzer, which rest on table propositions.

### Adversarial table

Values come from double-precision evaluation, sieves to `2·10⁷`, the `Ei` series for `li`, and the cached source texts.

| Statement | Instance | Values (each side) | Result | Change |
|---|---|---|---|---|
| `brun_titchmarsh` | `k = 1, x = 1, y = 2` | `π(3) − π(1) = 2 ≤ 4/log 2 = 5.771` | holds | none |
| `brun_titchmarsh` junk | `y = k` | right side `2k/(φ(k)·0) = 0` in Lean | `y > k` needed | none |
| §0.2 `C(2, 1)` | closed form vs direct | `−γ − log 2 = −1.27036` both ways | holds | none |
| §0.2 Corollaire 1 | hypotheses | `q ≥ 1`, `a` prime to `q` (`ramare-2002` line 74) | as stated | none |
| §0.3 `card_isPrimePow_le` | constant; `N ≤ 2·10⁶` | `2 log 4 + 16/(e² log 2) = 5.897 < 6`; slack `≥ 10` | holds | none (R04) |
| §0.3 `f(2ⁿ)` monotone | `n = 8, 9`; sum at `n = 9` | `3.1670 < 3.2108`; `2.2216 > 2.12` | holds | none |
| `li_two_eq_integral` | midpoint, `2·10⁶` nodes | `1.04516378` vs `li 2 = 1.04516378` | holds | R03, R04 |
| `li_two_mem` | `γ` enclosure | `1.0451 ≤ 1.0451638 ≤ 1.0452`; Mathlib's `γ` bounds alone give `0.968–1.135` | holds | R03, R04 |
| §0.3a series at `log 2` | enclosure | `0.8344610 ∈ [0.834438, 0.834462]`; `log log 2 = −0.3665129` | holds | none |
| §0.3a `li(3/2) > 0` | lower bound | `0.5 − 0.9027 + 0.4466 = 0.0438 > 0.04`; true value `0.125065` | holds | none |
| `logIntegral_sub_div_log_ge` | zero of `Li x − x/log x` | `6.5797283 ∈ (6.5797, 6.5798)`; value at `6.58` is `7.65·10⁻⁵ > 7·10⁻⁵` | holds | none |
| `integral_inv_log_pow_lt` | `x = 2` | `0 <` right side `> 0` | holds | none |
| `psiHalf_eq_average` | `x = 4`; `x = 4.5` | `2.13833 = (log 12 + log 6)/2`; `log 12` both | holds | none |
| `chebyshev_psi_ge` | left limits on `[30, 2·10⁶]`; `x = 30` | least slack `11.57`; `15.63 < ψ(30) = 28.48` | holds | none |
| `ChebyshevWeightRange` | maxima of `ψ(x)/x` | `1.013982` at `19` (`≤ 1.015`); `1.038821` at `113` (`≤ 1.11`) | holds | none |
| `chebyshev_psi_le` step | `x = 11 723` | `5 log x − 5 = 41.85 ≤ 0.0037 x = 43.38` | holds | none |
| §0.8 `E` | period, values | values `{0, 1}`; `E(5.5) = 1`, `E(6) = 0`; period `30` | holds | none |
| §1.1 records | sources | `N(A₁) = 1 500 000 001` (`van-de-lune-te-riele-winter-1986` line 13); `57` zeros, `< 0.8113925` (`rosser-schoenfeld-1975` lines 684–687) | as stated | none |
| §1.1 `ZetaZeroCubeSum` | Rosser's both-sign sum | `0.00167/2 = 0.000835` (`dusart-2016` line 460) | as stated | none |
| §1.2 `GRH*(q, 10 000)` | `q ≤ 13` | `H(f) ≥ 10⁸/13 = 7.69·10⁶ ≥ 10⁴` | holds | none |
| §1.3 `ButheVerified` | `x → 1427⁻` | `x − θ(x) = 74.18 > 1.95√x = 73.66` | printed `1423` fails; `1427` holds | none |
| §1.3 *ButheFinerRange* | rows `4·10¹⁰…1.6·10¹³` | least `M⁻ = −0.88`, greatest `M⁺ = 0.86` (`buthe-2018` lines 687–704) | holds | none |
| §1.3 *Robin1983Range* | `p_k` for `k` in `[7022, 39016]` | 18 failures: `k = 7022` and `8581–8601`; none from `8602` | `8602` holds | none |
| §1.3 *RamanujanThetaRange* | `x → 3⁻` | `(x − log 2)/x → 0.76895 = 1 − (log 2)/3`; source's `(2 − log 2)/2 = 0.65343` | README right | none |
| §1.4 `TrudgianGapBound` | 75 rows of Table 8 | e.g. `(4 652 353, 154)`: `154 ≤ 177.8` | holds | none |
| §1.4 `AxlerGapBound` | records near and above `2·10⁷` | `(17 051 707, 180)`: `180 ≤ 204.9`; `(20 831 323, 210)`: `210 ≤ 211.8` | holds | none |
| §1.4 `firstPrimeGap`, tables | small `g`; Table 9 | `1 ↦ 2`, `2 ↦ 3`, `4 ↦ 7`, `3 ↦ 0`; last row `(1306, 3 278 018 069 102 480 227)`; `P(1346) > 4·10¹⁸` (line 1885) | holds | R04 |
| `exists_prime_of_maximal_gap` | `(7, 4)` at `x = 6.5`, `7` | `7 ∈ (6.5, 10.5]`; `11 = 7 + 4` | holds | none |
| `tsum_log_div_prime_mul_pred_le` | `E₁` | `0.755366 ≤ 1.616434` | holds | none |
| §1.7 passage to a modulus | modulus `6`, `χ₋₃` | `(1 − β) log 6 ≥ (1 − β) log 3` | holds | none |
| `leeNosal_of_riemannHypothesis` | `x = 101`; crossover | `2.340 ≤ 5.695`; `L(L − log L)/(8π) = 0.94000` at `337.09` | holds | R01 |
| `leeNosal_theta_of_riemannHypothesis` | `x = 2657`; crossover | `89.86 ≤ 94.12`; `1.95000` at `3381.6` | holds | R01 |
| §2.2 branch switch | `L = 55.46` | `0.28L = 15.5288`; Bellotti–Wong `+ 7/8` gives `15.5288` | crossover | R01 |
| §2.1 reciprocal sum | just above `γ₅ = 32.935`; at `4πe` | `0.22153 > 0.21840`; `0.22153 ≤ 0.22812` | fails below `4πe`, as stated | none |
| §2.5 Lemma 9 from Rosser | `max(0.443 log L − 0.013 L)` | `1.1202` at `L = 34.08`, `< 1.412` | holds | none |
| `carneiro_milinovich_soundararajan` | `x = 4` | `[4, 6.44]` contains `5` | holds | none |
| `schoenfeld_of_riemannHypothesis` | `3/2 < x < 2` | `π(x) = 0 < li x` (`li(1.5) = 0.125`) | holds | none |
| §3.2 `ψ − θ` upper | ratio on `[10⁸, 10⁶⁰]` | maximum `1.53390` at `10⁸`; `1.001093 · 1.534 ≤ 1.536` | holds | none |
| §3.2 `ψ − θ` lower | `10⁸ < x ≤ 1 155 901²` | least ratio `1.007538` at the right end, `≥ 1.0088 · 0.998697 = 1.007486` | holds | none |
| `dusart_of_zeroFreeRegion` | `R = 5.69693` | `X ≥ 8.36` iff `log x ≥ 398.16`; printed `8R` would need `log x ≥ 11 833` | `8/R` correct | none |
| §3.3 Table 1.1 | rows | `2.78652·10⁻⁴`, `1.8436·10⁻⁴`, `0.978·10⁻⁵`, `0.75·10⁻⁷` (`dusart-1998-thesis` lines 848–852) | as stated | none |
| §3.4a shape threshold | `(121.107, 3/2, 2, R)` | `2.627` at `x = 2`; `20.35` at `log x = 12.525` | holds | none |
| `primeCounting_sub_logIntegral_le` | maximum of the shape; `[2, e)` | `0.35426 ≤ 0.4298`; `Li(e) = 0.84995 < 1`, `0.4298 e = 1.168 ≥ 1` | holds | R04 |
| `ramanujan_of_primeCounting_bounds` | expansions | square exact (relative error `≤ 3·10⁻¹⁶`); remainder `271.21 ≥ ε′ = 246.46` at `L = 10` | holds | none |
| §3.5 Ramanujan at `e³⁹¹⁵` | `M = 1426`, `m = −1194` | `ε_M − ε′_m = 3914.50 < 3915` | holds | none |
| `axler_primeCounting_upper` | `x = 48` | denominator `0.05356`; bound `896.2 > π(48) = 15` | holds | none |
| §3.7 Table 15 inputs | rows `29`, `40`, `50` | `0.024334`; `2.1482·10⁻⁸`; `1.1344·10⁻⁹` (lines 1669, 1672, 1727) | as stated | none |
| §3.7 `a₂(b)` | `b = 35…300` | see R08 | misquoted | R08 |
| §3.7 Table 12 | `b = 25` | block `(0.88, 0.86)`: `1.75000·10⁻⁴`; printed `1.70330·10⁻⁴` uses the first block's constants | README right | none |
| §4.1 enclosure of `B` | `E₁ ≤ 1.6164` | `−3.8508 > −3.86`; `9.137 < 9.14` | holds | none |
| `mertens_vonMangoldt_bounds` | `x = 2` | `log 2/2 − log 2 = −0.3466 ∈ [−2, 5.386]` | holds | none |
| §4.2 Ramaré | Theorem 1.1 | `x ≥ 8950`; `log x ≥ 9270` at `R = 5.69693` (`ramare-2013` lines 82–104) | as stated | none |
| `vanlalngaia_sum_inv_prime` | `x = 89 967 803` | `1/3 + 5/(4 log x) = 0.40158 ≤ 0.41` | holds | none |
| `dusart_nth_prime_lower` | `k = 2` | `2(log 2 + log log 2 − 1) = −1.3467 < 3` | holds | none |
| §6.3 Hypothesis Z for `ζ` | `|γ| = 30 610 046 000` | needs `0.0073959`; `5.573412` gives `0.0074312`; `5.69693` gives `0.0072701` | as stated | none |
| §6.3, §6.7 crossing | `q = 939 838`, `939 839` | `√q log q = 13 333.328`, `13 333.336` against `13 333.333`; both bounds `2.1813·10⁻⁴` | holds | none |
| §6.6 nesting | `q = 10⁵` | `0.013363` (`6.50`), `0.013497` (`6.4355`) | holds | none |
| §6.7 (a), (b) | constants | `0.2 > 0.10367`, `0.2 > 0.15385`; `0.003 < 0.10367`; `1/0.003 = 333.3` | holds | none |
| `lamzouri_li_soundararajan` | `q = 4`, `5` | `7.687 ≥ 5, 3`; `41.44 ≥ 11, 2, 3, 19` | holds | none |
| §7.3 `‖f_m‖₁` | `m = 1`, `2` | `2/3`, `8/15` (`kadiri-lumley-2014` line 508) | holds | none |
| §7.3 Table 2 rows | `4·10¹⁸`, `e⁵⁹`, `e⁶⁰` | `36 082 898`, `1 946 282 821`, `1 966 196 911` (lines 690, 707–708) | as stated | none |
| §7.3 density | Cully-Hugill–Lee | equal to ExplicitZetaBounds §8.3 at `3 000 175 332 800` | owned twice | R02 |
| §7.5 cubes | `exp(exp(33.990))^{1/3}` | `exp(exp(32.8914))`, stated as `exp(exp(32.892))` | holds | R02 (density) |
| `schoenfeld_interval` | `x = 2 010 759.9` | next prime `2 010 881 < 2 010 881.05` | holds | none |
| `trudgian_interval` | `x = 2 898 240`; `2 898 242` | `2 898 359 > 2 898 357.93`; `2 898 359 ≤ 2 898 359.93` | `2 898 242` needed | none |
| `axler_interval` | `x = 17 051 708` | `17 051 887 ≤ 17 051 887.73` | holds | none |
| `exists_prime_iff_theta_lt` | `x = −5`, `h = 6`; `h ≤ 0` | no prime in `(−5, 1]`, `θ(1) = θ(−5) = 0`; both sides false | holds | none |

### Library declarations opened at the pins

- **Elaborated:** 97 Mathlib and Tau Ceti names cited in the README elaborate with `#check` at the pins.
- **Found by search** (their modules are not imported):
  - `Nat.primeCounting_nth_prime` and `Nat.primesLE_eq_image_nth` (`TauCeti/NumberTheory/PrimeCounting.lean:90`, `:70`);
  - `NumberField.Chebotarev.primeCount_primesCongruent_isEquivalent_logIntegral` (`TauCeti/NumberTheory/Chebotarev/PrimeCounting/PrimesCongruent.lean:50`);
  - `TauCeti.Contour.Cycle.classicalResidueTheorem_nullHomologous` (`TauCeti/Analysis/Contour/Cycle/Residue.lean:138`), new at this head.
- **Read in full:** `Mathlib/NumberTheory/Chebyshev.lean` lines 560–640 (R05).
- **Not at the Tau Ceti pin:** neither `expIntegralEi` nor `principalLogIntegral` occurs, so R03's supplier is the open roadmap, not the library.

### Cross-roadmap citations resolved

- **ExplicitZetaBounds (`0889de2`):**
  - §§0.2, 0.3 (`LFunction_ne_zero_of_platt`), 0.4 (including `ZetaArgumentBoundUpTo`) and 0.4b (all nine records named);
  - §3.4 (Delange); §5.2 (Rosser, Bellotti–Wong, the `9.3675` form); §5.3; §5.4 (Lehman from `2πe`, Brent–Platt–Trudgian from `168π` given *HiaryRecord*);
  - §6.1 (the free cut-off); §6.3a; §6.5 (`c = 3/2`);
  - §7.2 (the `log 0.618` form from `1.88·10¹⁴`); §7.3; §7.5 (all five items and the form for a modulus); §7.6 (`57.54`); §7.9;
  - §8.1; §8.3 (R02); §8.3a;
  - Not owned here (Liu–Wang, Ramaré–Rumely, Ramaré's density, Johnston–Yang, `0.28 log T`).
  - Drift: R01 and R02.
- **AnalyticNumberTheoryPartI (`e22e67a`):** §§0.2, 0.3, 0.5, 0.7, 0.8, 0.11 (an inexplicit `O(1)` only, so §4.1's constants are not a duplicate), 0.11d, 0.16, 0.19, 0.20, 0.21, 0.25, 0.26a, 0.30, 0.32, 0.34, 1.5a, 1.6 and 1.9.
- **SieveMethodsAndPrimePatterns (`a0ce011`):** §2.9; §3.1 `primeCountAP (x : ℝ) (q a : ℕ)`.
- **On main (`a04740f5`):**
  - ZerosOfLFunctions §§4.1, 4.5, 5.6, 6.2–6.4, 7.4, 8.3–8.9 and Layer 9;
  - LFunctions Layer 4 (`dirichletData`);
  - ClassFieldTheory Layer 13 (the conductor–discriminant formula, its line 1839);
  - ClassicalArithmeticCompletion §6.34 (`dyadicPrimeCount`).
- **ProbabilisticAndMetricNumberTheory** (open, order 61): Layer 5, short intervals.
- **SpecialFunctionsEiLiErfIncompleteGamma (`5a3e622`):** §§8.2–8.5 (R03).
- **EffectiveClassNumbers (`ba3ce95`):** lines 27 and 129–130 (R06).

### Ownership and gaps

- **Searched by object** (`roadmaps grep`, main and 471 open heads) for: Chebyshev's 30-weights, maximal and first-occurrence prime gaps, Ramanujan's inequality, half-weight `ψ₀`, the prime-power count, Soldner's constant and Costa Pereira. The only owners found are SpecialFunctionsEiLiErfIncompleteGamma for `li` (R03) and Mathlib for Costa Pereira (R05).
- **Overlap tool:** no dropped id, no other pull request changing this roadmap.
- **Gaps:** the nine contracts carry the plan's slugs, and each names an existing ExplicitZetaBounds section. The plan's other three slugs are not open prerequisites:
  - `explicit-brun-titchmarsh` is §0.1's own theorem;
  - `dirichlet-four-zero-region` is *LiuWangFourZeros*, which ExplicitZetaBounds declines;
  - `lehman-weighted-zero-sum` is consumed as its §5.4.

### Sampled locators verified against the text

- **§0.2:** `ramare-2002` lines 74–86 (Corollaire 1).
- **§0.6:** `buthe-2016` lines 55–60 (the normalized `χ*`) and 688–705 (Theorem 2); AnalyticNumberTheoryPartI §0.2; SieveMethodsAndPrimePatterns §3.1.
- **§1.1:**
  - `van-de-lune-te-riele-winter-1986` lines 13–14;
  - `platt-2017` lines 485–486; `platt-trudgian-2021-rh` lines 48–49;
  - `rosser-schoenfeld-1975` lines 50–55 and 683–687;
  - `dusart-1999-mc` lines 64–69;
  - `kadiri-lumley-2014` lines 582–586;
  - `cully-hugill-lee-2022` lines 600–602;
  - `dusart-2016` line 460.
- **§1.2:** `rumely-1993` lines 29–36; `ramare-2002` lines 152–159.
- **§1.3:**
  - `buthe-2018` lines 73–85, 671 and 685–704;
  - `platt-trudgian-2021-error` (18), lines 483–541;
  - `rosser-schoenfeld-1962` lines 213–216;
  - `schoenfeld-1976` lines 20–28, 98–100, 668–669 and 729–733;
  - `buthe-2016` lines 750–755;
  - `dusart-1998-thesis` lines 860–864, 922–926 and 1279;
  - `robin-1983` lines 81–84 and 378;
  - `trudgian-2016` lines 66–73, 132–140 and 229–236;
  - `johnston-yang-2023` lines 541–542, 554–555, 643–646 and 702–704;
  - `ramare-2013` lines 105–108;
  - `vanlalngaia-2017` lines 26–51 (letters decoded per the References).
- **§1.4:**
  - `oliveira-e-silva-herzog-pardi-2014` lines 1795–1821 (Table 8, 75 rows), 1830–1846 and 1885 (Table 9);
  - `carneiro-milinovich-soundararajan-2019` lines 269–273.
- **§1.7:** logic only (table); the supplier statement is ExplicitZetaBounds §7.9.
- **§2.5:**
  - `dudek-2015` lines 47–52;
  - `carneiro-milinovich-soundararajan-2019` lines 167, 259–262, 1309–1319 and 1367–1371;
  - `tmeemt-art14` lines 82–87 (`≤` as stated).
- **§3.2:**
  - `rosser-schoenfeld-1962` lines 252–253, 306–308, 328, 341–342 and 357;
  - `schoenfeld-1976` lines 201–206, 765–779 and 1288–1294;
  - `rosser-schoenfeld-1975` lines 770–771.
- **§3.3:** `dusart-1998-thesis` lines 845–858 and 869–874; `dusart-1999-mc` lines 102–108; `dusart-2016` lines 74–90.
- **§3.7:** `broadbent-kadiri-lumley-ng-wilk-2021`:
  - lines 77–94 (Theorem 1), 107–108, 110–122 (Theorem 2) and 156–159 (Corollary 2.1);
  - lines 489–512 (Corollary 5.1 and `a₂`, R08) and 557–569 (Lemma 6);
  - lines 701 and 866–872 (Costa Pereira); 927–940 (Corollary 11.1);
  - lines 1378–1412 (Table 8, at `H₀ = 2 445 999 556 030`);
  - Tables 10–15, lines 1484–1498, 1540–1559, 1599–1632, 1666–1674 and 1707–1745.
- **§4.2:** `ramare-2013` lines 82–104.
- **§6.7:** logic and constants (table); supplier statements at ExplicitZetaBounds §§7.5 and 7.9.
- **§7.3:**
  - `kadiri-lumley-2014` lines 28–29, 493–508, 588–605 and 688–710;
  - `cully-hugill-lee-2022` lines 75–88 and 148–166.
- **§7.5:**
  - `dudek-2016` lines 63, 690 and 802;
  - `broadbent-kadiri-lumley-ng-wilk-2021` lines 950–952 and 1128–1130;
  - `cully-hugill-2021` lines 28, 102–118 and 654–664 (R02);
  - `kadiri-lumley-ng-2018` lines 61–66 and 93–95.
- **Flags:** the README flags no locator as unverified.

## Not verifiable

Each is recorded as uncertified or waived in the manifest and is cited by locator only.

- **§1.1:** `lee-nosal-2026` (the reciprocal sum and the low-height zero count); `fiori-kadiri-swidinsky-2023-psi` (the zero sums); `rosser-1941`, read only through `dusart-2016` line 460.
- **§1.2:** `platt-2016`.
- **§1.3:** `dusart-2018`, `chirre-helfgott-2025`, `axler-2018`, `axler-2024`, `axler-2019-nth-prime`, `lamzouri-li-soundararajan-2015` and `ramare-2023-corrigendum` (whose thresholds differ from `ramare-2013` line 108).
- **§1.7, §6.7:** `lu-zaman-zhao-2026`, `thorner-zaman-2024`, `banks-2026`, `openai-2026-siegel`.
- **§2.5:** `ramare-saouter-2003`, read only through `dudek-2015` lines 47–48.
- **§3.3, §3.7:** `dusart-2018` (journal numbering); `axler-2024`.
- **§4.2:** `chirre-helfgott-2025`, `broadbent-fiori-kadiri-ng-wilk-2026`.
- **§7.3:** `cully-hugill-lee-2024`, the corrigendum whose Table 2 the README makes the authority.
- **§7.5:** `cully-hugill-johnston-2025`, `lee-2026`, `visser-2025`.
- **§5.4 contract:** `brent-platt-trudgian-2021` (whether its `L` in `Q = N − L` is `M(T)`).
- **R07:** `chebyshev-1852` and `mertens-1874` were not read; `costa-pereira-1985` and `dudek-platt-2015` were read only through the quotations named there.

## Source issues

- **Error** in platt-trudgian-2021-error at (18), p. 10 (lines 485–491): the source bounds `a(x)/log⁵ x` by `(2 − log 2)/2` on `2 < x ≤ 599`; it should be `1 − (log 2)/3`, since `(x − log 2)/x` exceeds `(2 − log 2)/2` on all of `(2, 3)`; affects the proof.
- **Gap** in platt-trudgian-2021-error at §5, p. 10 (lines 571–575): the source adds `m_a` to `ε_{m_a}` unscaled, but for negative `m_a` the lower bound at `x/e` carries `m_a (log x/(log x − 1))⁶`; it should use `(1 + 1/log x_a)⁶ m_a` when `m_a < 0`; affects nothing (corrected difference `3914.50 < 3915` at `e³⁹¹⁵`).
- **Error** in robin-1983 at Théorème 8, (23) (lines 84 and 378): the source states `p_k ≤ k(log k + log log k − 0.9385)` from `k = 7022`; it fails at `k = 7022` and at `8581–8601`, so it should start at `k = 8602`; affects a stated result.
- **Error** in buthe-2018 at Theorem 2, (1.6), p. 3 (line 75): the source states `x − θ(x) ≤ 1.95√x` from `1423`; as `x → 1427⁻` the left side is `74.18` against `73.66`, so it should start at `1427`; affects a stated result.
- **Error** in broadbent-kadiri-lumley-ng-wilk-2021 at Lemma 6 (lines 559 and 566): the source asks `b ≥ log(4(c₂ + k)²/c₃²)` and says `g` decreases for `x` beyond that quantity; it should be `b ≥ 4(c₂ + k)²/c₃²`, the threshold in `log x`; affects a stated result.
- **Error** in broadbent-kadiri-lumley-ng-wilk-2021 at Table 12, row `b = 25` (line 1612): the source prints `C₁ = 1.70330·10⁻⁴`, computed with the constants of the block ending at `5·10¹⁰ < e²⁵`; it should be `1.75000·10⁻⁴`, from the block `(0.88, 0.86)`; affects a stated result (Table 11 already uses `1.7500·10⁻⁴`).
- **Misprint** in broadbent-kadiri-lumley-ng-wilk-2021 at the table after Corollary 5.1 (line 510): the source prints `a₂(35) = 1.07086`, below the value `1.0708607` of its (2.12); it should be `1.07087`; affects nothing.
- **Gap** in cully-hugill-johnston-2021 at Theorem 1.2, p. 3 (lines 92–93): the source says `M = 5.03` at `(log x_M, α) = (40, 1/2)` and `M = 0.5597` at `(10³, 1/100)`; it should agree with its Table 4 (lines 1067 and 1073), which gives `6.431` and `0.6651`; affects nothing (the roadmap uses Table 4).
- **Misprint** in dusart-2016 at Theorem 1.1, p. 876 (line 79): the source requires `X ≥ max(8.36, 8R)` while its proof uses `X ≥ 8/R`; it should read `max(8.36, 8/R)`; affects a stated result (Corollary 1.2 from `log x = 400`).
- **Error** in trudgian-2016 at Corollary 2 (line 229): the source states the interval from `2 898 239`; at `x = 2 898 240` and `2 898 241` the interval ends before the next prime `2 898 359`, so it should start at `2 898 242`; affects a stated result.
