<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/7295#issuecomment-6689680098 -->
Review (claude) of d987475

Verdict: needs_changes

1. **F01** (P1) Trudgian's interval theorem is false just above its threshold

   Location: `packages/ExplicitPrimeCounting/design/README.md:1903–1905` (§7.4): "hence `[x, x(1 + 1/(111 log² x))]` contains a prime for all `x ≥ 2 898 239`, the segment `2 898 239 ≤ x < e³⁵` being *TrudgianRange*". The same claim is a headline in the Summary (line 23), and *TrudgianRange* (line 656) contains it as a hypothesis.

   Claim: the interval contains a prime for every real x ≥ 2 898 239.

   Witness: 2 898 239 and 2 898 359 are consecutive primes (gap 120). At x = 2 898 240 the right end is 2 898 357.93, so the interval holds no prime. The failure covers 2 898 239 < x < 2 898 241.07. The README's own Check (line 1925) gives the length at the threshold as 118, which is less than this gap of 120.

   Repair: replace the threshold by `x ≥ 2 898 242` in §7.4, in the Summary and in *TrudgianRange*. Add a negative-control Check: at x = 2 898 240 the interval [2 898 240, 2 898 357.93] lies inside the prime gap (2 898 239, 2 898 359). Tested: at x = 2 898 242 the right end is 2 898 359.93 ≥ 2 898 359, and an exact scan finds no failing x in (2 898 241.08, 1.6·10⁷]. Above 1.6·10⁷ the interval length exceeds 520, more than every maximal gap below 4·10¹⁸ requires. Record the source error (Source issues).

2. **F02** (P1) Robin's upper bound for p_k is false at k = 7022 and at 8581 ≤ k ≤ 8601

   Location: `packages/ExplicitPrimeCounting/design/README.md:1524` (§5.3): "`p_k ≤ k(log k + log log k − 0.9385)` for `k ≥ 7022`".

   Claim: the inequality holds for every k ≥ 7022.

   Witness: p₇₀₂₂ = 70 919, which exceeds 7022(log 7022 + log log 7022 − 0.9385) = 70 918.61. Also p₈₆₀₁ = 88 807 > 88 805.00. Two independent computations (a sieve, and trial division) find failures at k = 7022 and every k from 8581 to 8601.

   Repair: state the bound for `k ≥ 8602`, and add k = 7022 and k = 8601 as negative-control Checks. Tested: no failure for 8602 ≤ k < 2·10⁵, and for k ≥ 39 017 the bound follows from Dusart's −0.9484 of the same section. Record the source error.

3. **F03** (P1) The §5.1 "bootstrap" upper bound for p_n does not follow and is false

   Location: `packages/ExplicitPrimeCounting/design/README.md:1477–1479`: "hence the explicit two-sided `n(log n + log(log n − c) − c) < p_n < n(log n + log(log n + log(log n − c) − c') − c')`".

   Claim: from n(log p_n − c) < p_n < n(log p_n − c'), the displayed explicit upper bound follows. The derivation puts a lower bound for log p_n where an upper bound is needed.

   Witness: take the README's own constants c = 1.1, c' = 1 (its Check, line 1489) and n = 61, p₆₁ = 283. The hypotheses hold (277.27 < 283 < 283.37), but the conclusion gives 277.49 < 283, which is false. With c = 6, c' = 1 and n = 10⁴ the conclusion gives 104 485.7 < 104 729, also false.

   Repair: replace the upper half by `p_n < n(log n + log(L_n − c') − c')`, where L_n is any upper bound for log p_n. For example L_n = log n + log(log n + log log n) for n ≥ 6, from Rosser–Schoenfeld's `p_n < n(log n + log log n)`. Tested: at n = 61, L_n = 5.820 ≥ log 283 = 5.645 and the bound is 285.70 ≥ 283. With c = 1.1, c' = 1 there is no failure for 6 ≤ n < 1.2·10⁶. Add n = 61 as a negative-control Check for the wrong form.

4. **F04** (P1) *FaberKadiriRange* and *PlattTrudgianRange* are false as defined

   Location: `packages/ExplicitPrimeCounting/design/README.md:656–659`: "for each of §3.4's theorems, the stated inequality on `[2, e^{X}]` … `platt-trudgian-2021-error`: `log x < 1000`; … `faber-kadiri-2015`: `x < e²⁰`".

   Claim: these are finite-range propositions, each asserting the §3.4 inequality on [2, e^X].

   Witness: at x = 100, |ψ(100) − 100| = 5.955. That exceeds 5.3688·10⁻⁴·100 = 0.054 (Faber–Kadiri) and 1.20·10⁻⁵·100 (Platt–Trudgian). Both theorems are claimed only from e²⁰, or for log x ≥ X (`platt-trudgian-2021-error` lines 58–62). A check of ψ up to e¹⁰⁰⁰ is not a computation anyone performed.

   Repair: delete *FaberKadiriRange* and *PlattTrudgianRange* from §1.3 and from the hypotheses of §3.4; neither theorem has a small range. Restate *TrudgianRange* and *JohnstonYangRange* as the exact inequalities on exactly the finite ranges the route needs. Trudgian's θ bound needs only [149, 1423], because *ButheVerified* covers [1423, 10¹⁹]: at x = 1423 the bound is 196 against 1.95√x = 73.6. Check: at x = 100 the deleted propositions would assert 5.955 ≤ 0.054.

5. **F05** (P2) Two owners for RH(H), GRH(q, H) and the Platt bridge

   Location: `packages/ExplicitPrimeCounting/design/README.md:39–41` ("The hypotheses: bounded-height Riemann hypotheses … (Layer 1)") and §§1.1–1.2 (lines 560–618, plan targets 1.1, 1.2, 1.2b). Compare the gap bullets at lines 246–253.

   Claim: this roadmap defines `RH(H)` and `GRH(q, H)` with their API (antitonicity, RH ⇒ RH(H), agreement with *AllOnCriticalLine*, the named instances, Rumely's instances, and the bridge from ComputationalNumberTheory §4.22). At the same time `gap:rh-up-to-height` and `gap:grh-up-to-height` ask ExplicitZetaBounds target 20 for exactly this.

   Witness: `packages/ExplicitZetaBounds/target.md` target 20 and Scope (lines 79–85) plan these Props, their antitonicity, the bridge and instances C1–C6. They state that this roadmap "imports these Props by name". The gap asks for "the bridge from ComputationalNumberTheory §4.22", which plan target 1.2b proves here.

   Repair: choose one owner. Following the declared gaps, make §§1.1–1.2 citations of `gap:rh-up-to-height` and `gap:grh-up-to-height`. Delete the API bullets that duplicate the gap and delete plan target 1.2b. Keep only what this roadmap adds, namely the agreement with Mathlib `RiemannHypothesis` used by its statements. If `Suggested.lean` needs the Props to state headlines, it may define them for statability with a docstring citing the supplier target.

6. **F06** (P2) The `needs` sentences of all eight gaps are vague or compound

   Location: `packages/ExplicitPrimeCounting/design/plan.json` `gaps[*].needs`. For example: "Explicit zero-counting error terms."; "The explicit zero-free regions for ζ and for Dirichlet L-functions."; "The explicit Brun–Titchmarsh inequality."

   Claim: each `needs` says exactly what is missing, with its hypotheses.

   Witness: none of the eight gives a shape, constants, range or normalisation. Two are compound (ζ together with L(s, χ)). The precise content sits in `detail` and in the README bullets (lines 246–275), and it omits regions the roadmap uses (R07, R08). ExplicitZetaBounds target 19 writes `2N(17/20, T, χ₀)`, while this roadmap and `kadiri-2013-density` lines 42–54 count with 0 ≤ Im ≤ T.

   Repair: rewrite each `needs` as the precise statement from the README bullet, with hypotheses, constants and range. Split the compound gaps: classical regions for ζ versus Dirichlet regions; zero count for ζ versus L(s, χ). Pin N(σ, T) as counting zeros with σ ≤ Re ρ ≤ 1 and 0 < Im ρ ≤ T. List every Dirichlet region used by §§6.1, 6.3 and 6.6 (R07, R08).

7. **F07** (P2) §6.1 (Ramaré–Rumely and Dusart shape) has the wrong zero-free-region hypothesis and mislabels C₁(q)

   Location: `packages/ExplicitPrimeCounting/design/README.md:1616–1622`: "`R` with a zero-free region for the characters modulo `q` in McCurley's form … let `C₁(q)` be the constant of Dusart's display (3) bounding the zero count".

   Claim: the Ramaré–Rumely and Dusart theorems hold under McCurley's region, with C₁(q) a zero-count constant.

   Witness: `dusart-2002` lines 95–112 define C₁(k) = min(min_χ C₁(χ, H_χ), 32π) as the constant of the region 1 − β ≥ 1/(R ln(k|γ|/C₁)). That region is Ramaré–Rumely's Theorem 3.6.3 for |γ| ≥ H (`ramare-rumely-1996` lines 822–826), not McCurley's.

   Repair: state the hypothesis as Ramaré–Rumely's region. For χ modulo q and |γ| ≥ H, every zero satisfies 1 − β ≥ 1/(R log(q|γ|/C₁(χ, H))), with R = 9.645908801 and C₁(q) = min(min_χ C₁(χ, H), 32π). Add this region to `gap:classical-zero-free-constants`. Replace the "proportional to" gloss by the exact display (lines 999–1002); the layout puts C₁ under the square root, consistent with Theorem 4 at lines 702–707. Check: for k = 1, C₁ = 38.31 (line 103), and C₁ ≥ 9.14 always (line 107).

8. **F08** (P2) §6.6's quantitative instances rest on unowned inputs

   Location: `packages/ExplicitPrimeCounting/design/README.md:1776–1784`: "Under the McCurley shape of §6.1 … for `q ≥ 3` not exceptional (§6.1's *IsExceptionalModulus* with Kadiri's constant) … The values `α(q₀, ε)` of Table 1 (*Kadiri2008Table*) are the quantitative instances".

   Claim: the Table 1 values follow under the McCurley shape plus the table proposition.

   Witness: Kadiri's exceptional moduli are defined by her region σ ≥ 1 − 1/(6.50 log(q max(1, |t|))). Her Table 1 also uses Liu–Wang's theorem: at most four zeros with |Im s| ≤ x/q and σ ≥ 1 − 1/(3.82 log x), for x ≥ 8·10⁹ (`kadiri-2008` lines 327–341). No layer, supplier or gap provides that theorem.

   Repair: define the exceptional predicate with R = 6.50 (implied by Kadiri's 6.4355 region in the gap). Add the Liu–Wang four-zero theorem as a declared gap or a hypothesis, and list both as hypotheses of the Table 1 instances. Keep the bare existence of α under the McCurley shape. Check: q non-exceptional for 6.4355 implies non-exceptional for 6.50, not conversely.

9. **F09** (P2) The kernel class of §2.1 excludes kernels the roadmap uses

   Location: `packages/ExplicitPrimeCounting/design/README.md:816–824` ("the Weil formula holds for every `φ` … of class `C^m`, `m ≥ 2` … belong to this class or are limits of it") and line 852.

   Claim: every kernel used later lies in the C^m (m ≥ 2) class.

   Witness: (4t(1 − t))^m is only C^{m−1}. §3.1(b) allows m ≥ 1, and Rosser–Schoenfeld's Theorem 2 uses m = 1 (`rosser-schoenfeld-1975` line 537); §7.3 allows m ≥ 1. The cosine kernel of `carneiro-milinovich-soundararajan-2019` Lemma 7 (lines 1185–1189) is not C¹ at ae^{±δ}. "Limits of it" names no theorem.

   Repair: state the extension for continuous φ with compact support in (0, ∞) such that (t d/dt)φ has bounded variation V, so that |φ̃(s)| ≤ V/|s|². Prove it with the limit argument this route sketches, using N(T) = O(T log T). This class contains all three kernels: m = 1 is Lipschitz with a piecewise-C² derivative, and the cosine kernel has two corners. Fix the Check at line 850.

10. **F10** (P2) §6.4's route is not Ramaré's, and the source says it does not work

   Location: `packages/ExplicitPrimeCounting/design/README.md:1722–1725`: "for `x > 10⁵` the exact transfer of §0.7 with `|E(t)| ≤ 1.745 √t` … the rows of Ramaré–Rumely's Table 1 on `[10¹⁰, 10¹⁰⁰]` and Dusart's decaying `ε(X)` beyond".

   Claim: integration by parts (§0.7) together with Chebyshev-type rows yields Corollaires 4–5.

   Witness: `ramare-2002` lines 137–144 say the usual derivation by parts needs much stronger information on ψ(L; q, a) than Ramaré–Rumely give. Ramaré instead deduces (3) from (2) by his bilinear method, and proves the corollaries by computation for L ≥ 10⁵ (lines 1228–1235).

   Repair: replace the route by Ramaré's: the deduction (2) ⇒ (3) of his §6, fed by the rows of `ramare-rumely-1996` Table 1, plus his §9 computation for L ≥ 10⁵ (recorded as a table proposition) and *Ramare2002Tabulation* below 10⁵. Fix the Needs line. If §0.7 is kept, cite an input with decaying ε.

11. **F11** (P2) §5.3's route for Dusart's lower bound fails for large p_k

   Location: `packages/ExplicitPrimeCounting/design/README.md:1531–1534`: "for `10¹¹ ≤ p_k ≤ e⁵⁰⁰`, §5.1 with Schoenfeld's `θ` bound … beyond, Dusart's `0.905·10⁻⁷` of §3.3".

   Claim: the constant ε = 0.905·10⁻⁷ closes the proof for every p_k > e⁵⁰⁰.

   Witness: the step needs ε ≤ (log log k − 2.1454)/(log k (log k + log log k)) (`dusart-1999-mc` lines 154–158). At log k = 10⁴ the right side is 7.06·10⁻⁸ < 0.905·10⁻⁷. Dusart uses η₄ = 1.657·10⁷ beyond e¹⁸⁰⁰ (lines 133–141).

   Repair: route e⁵⁰⁰ < p_k < e¹⁸⁰⁰ through 0.905·10⁻⁷, and p_k ≥ e¹⁸⁰⁰ through |θ(x) − x| < η₄ x/log⁴ x. Use Dusart's thesis η₄ = 1 717 433 (§3.3) or Schoenfeld's 1.657·10⁷, as at lines 139–141. Add the η₄ bound to the Needs.

12. **F12** (P2) The finite-range propositions leave holes in the routes of §7.1 and §2.2

   Location: `packages/ExplicitPrimeCounting/design/README.md:1819–1821`: "for `1.1·10⁹ ≤ x ≤ 10¹⁹` Büthe's … the segment `2 010 759.9 < x < 1.1·10⁹` is the paper's table check in *Schoenfeld1976Range*". *Schoenfeld1976Range* (lines 646–647) covers Theorem 12 only for x ≤ 10⁸ and Theorem 10 only for 73.2 < x ≤ 1075.

   Claim: the stated hypotheses cover every range.

   Witness: for §7.1, nothing covers (10⁸, 1.1·10⁹). For §2.2, inequality (6.3) on 1075 < x < 1423 is uncovered, because *ButheVerified*'s θ clause starts at 1423 (`buthe-2018` line 75). Inequality (6.4) on 59 < x ≤ 73.2 is also uncovered: 0.94√x ≤ √x log²x/(8π) needs x ≥ 129.

   Repair: for §7.1, add *MaximalPrimeGapTable* (§1.4) and Schoenfeld's Lemma 10 route (`schoenfeld-1976` lines 705–716) for 2 010 759.9 < x ≤ 4·10¹⁸, with Dusart's row b = 30 above. For §2.2, extend *Schoenfeld1976Range* to each Theorem 10 inequality on its range up to 1423, following the source's tables (lines 81–90). Check: at x = 10⁸ the gap step needs gaps below x/16597 = 6025, while the maximal gap below 1.1·10⁹ is 282.

13. **F13** (P2) Ten computational propositions are used but never stated in Layer 1, and two are derivable

   Location: the Summary (`packages/ExplicitPrimeCounting/design/README.md:15–18`) says each such proposition is "stated once in Layer 1". *AxlerRange* (lines 1189, 1571), *Ramare2013Range* (1299), *VanlalngaiaRange* (1332), *DelegliseNicolasRange* (1428), *McCurleyTable* (1634), *RamareRumelyTabulationSharp* (1663), *Ramare2002Tables* (1719), *BachSorensonTable*/*BachSorensonRange* (1755–1756) and *RamareSaouterTable* (1841) appear only in their sections.

   Claim: every hypothesis is a stated proposition with its data.

   Witness: Layer 1 (lines 552–806) contains none of the ten, so their inequalities, ranges and data are undetermined. *AxlerRange* is described as "which the paper derives from Büthe's and Dusart's bounds", which makes it a theorem. *TrudgianRow* (line 739) is a two-line consequence of the region and RH(3.06·10¹⁰) (`trudgian-2016` lines 55–61).

   Repair: add each of the ten to §1.3 or §1.6 with its exact inequality, range and locator. Prove *AxlerRange* from *ButheVerified* and *DusartThesisRange*. Replace *TrudgianRow* by a lemma: if ζ has no zero for |t| ≥ 2 and σ ≥ 1 − 1/(5.69693 log|t|), and RH(3.061·10¹⁰) holds, then ζ has no zero for |t| ≥ 24 and σ ≥ 1 − 1/(6.455 log(|t|/17)). Check: exp(6.455 log 17/(6.455 − 5.69693)) = 3.0·10¹⁰ ≤ 3.061·10¹⁰.

14. **F14** (P2) §4.4's Abel identity lacks an integrability hypothesis

   Location: `packages/ExplicitPrimeCounting/design/README.md:1360–1364`: "`f` be `C¹`, nonnegative and non-increasing on `[P, ∞)` with `t f(t) → 0` … (Abel summation; the series converges because `θ(t) ≤ (log 4) t` and `t f(t) → 0`)".

   Claim: under these hypotheses the series converges and the identity holds.

   Witness: take f(t) = 1/(t log t) on [3 600 000, ∞). It is C¹, nonnegative and decreasing, and t f(t) → 0, yet ∑_{p ≥ P} f(p) log p = ∑_{p ≥ P} 1/p diverges. In ℝ the identity is then junk. `ramare-2016` Lemma 3.2 (lines 294–303) is an inequality whose right side may be infinite.

   Repair: add `∫_P^∞ f < ∞` to §4.4. The series then converges: its partial sums are at most (log 4)(P f(P) + ∫_P^∞ f). Alternatively, state the inequalities in `ℝ≥0∞`. Add f = 1/(t log t) as a negative-control Check.

15. **F15** (P2) Downstream consumers include roadmaps earlier in the order, two of which are also suppliers

   Location: `packages/ExplicitPrimeCounting/design/README.md:1981–1987` and `plan.json` `consumers`. ErdosProgressionPowers, ClassicalArithmeticCompletion and EffectiveClassNumbers are listed as consumers.

   Claim: these roadmaps consume this one.

   Witness: in the merge order, ErdosProgressionPowers is at line 187, EffectiveClassNumbers at 238 and ClassicalArithmeticCompletion is on main; this roadmap is placed after SieveMethodsAndPrimePatterns (259). ClassicalArithmeticCompletion and EffectiveClassNumbers are also suppliers here (§§3.5, 0.6). ErdosProgressionPowers declares its gaps on AnalyticNumberTheoryPartI (its README lines 539–545).

   Repair: remove the three from `## Downstream consumers` and from `plan.json` `consumers`. Keep the agreement remarks in Scope, where they already appear (lines 87–91). The remaining consumers are later in the order: ExplicitMultiplicativeFunctions, ExplicitNumberFields, and any roadmap after this one.

16. **F16** (P2) §§3.2 and 3.5 restate headline theorems of AnalyticNumberTheoryPartI §§0.3 and 0.5

   Location: `packages/ExplicitPrimeCounting/design/README.md:1051` ("`θ(x) < 1.000081 x` for `x > 0`") and line 1175 (Rosser–Schoenfeld Theorem 1 for x ≥ 59). Scope (lines 79–83) says: "This roadmap adds only the theorems that prove those inputs from its own hypotheses (§0.6)".

   Claim: these are this roadmap's own targets.

   Witness: AnalyticNumberTheoryPartI at #1126 (a4886b9), lines 224–226, states θ(x) < 1.000081x for x > 0 under `SchoenfeldFiniteRangeInput`. Line 248 states both Theorem 1 inequalities for x ≥ 59. Combining §0.6 with those sections already gives these conclusions here.

   Repair: in §3.2, cite AnalyticNumberTheoryPartI §0.3 for the full range and keep only the proof of `SchoenfeldFiniteRangeInput` (that is, §0.6). In §3.5, cite §0.5 for x ≥ 59 and keep only the upper half for 1 < x < 59, stating in one clause that it extends §0.5's range.

17. **F17** (P3) Names that do not exist at the pin, and a Mathlib theorem cited from a roadmap

   Location: `packages/ExplicitPrimeCounting/design/README.md:59, 141, 182–184, 778, 784, 1327, 1340–1341` (`TauCeti.mertensConstant`, `TauCeti.tendsto_primeSummatory_inv_absNorm_sub_log_log`, `TauCeti.isBigO_…`); line 190 (`TauCeti.primeCounting_nth_prime`, `TauCeti.primesLE_eq_image_nth`); lines 206 and 370 (LFunctions Layer 7 for `L(1, χ) ≠ 0`).

   Witness: at the pinned Tau Ceti, `TauCeti/NumberTheory/LFunctions/Mertens.lean:80` opens `namespace TauCeti.LFunctions`, and `mertensConstant` is at line 545. `TauCeti/NumberTheory/PrimeCounting.lean:58` opens `namespace Nat` (theorems at lines 70 and 90). Mathlib has `DirichletCharacter.LFunction_apply_one_ne_zero` at `Mathlib/NumberTheory/LSeries/Nonvanishing.lean:412`.

   Repair: rename these to `TauCeti.LFunctions.mertensConstant` (with the two `TauCeti.LFunctions.` theorems), `Nat.primeCounting_nth_prime` and `Nat.primesLE_eq_image_nth`. Cite Mathlib `DirichletCharacter.LFunction_apply_one_ne_zero` (and `LFunction_ne_zero_of_one_le_re`, line 404) in place of LFunctions Layer 7.

18. **F18** (P3) Locator slips

   Location: plan 0.4 cites "`rosser-schoenfeld-1962` lines 334–343, Theorem 11 (the transfer scheme)". Plan 1.7 cites lines 256–258 (Theorem 5), and README §1.7 (lines 777–782) gives no locator. Line 937 calls Ramaré–Saouter's RH result "Theorem 1", while line 1839 calls their unconditional intervals "Theorems 1–3". §3.1(a) (line 990) states Dusart 2016 with the classical region for |t| ≥ 2.

   Witness: Theorem 11 is the ε(x) bound. The difference identity is Rosser–Schoenfeld (4.17), as cited at `schoenfeld-1976` lines 101–102. The value of B is at `rosser-schoenfeld-1962` line 81, eq. (2.10), and γ has no source. `dusart-2016` lines 74–75 need the region only for |Im s| ≥ 2π.

   Repair: cite RS 1962 (4.17) for 0.4, and RS 1962 line 81 for B plus a source for γ's decimals in §1.7. Cite the RH result as "`ramare-saouter-2003` (uncertified), as quoted at `dudek-2015` lines 47–48", without a theorem number. Weaken §3.1(a)'s hypothesis to |t| ≥ 2π.

19. **F19** (P3) False or invalid Checks

   Location and witness, one per Check:
   - Line 1854: "the maximal gap below `1.1·10¹⁰` is `354` (after `4 652 353 957`…)". `oliveira-e-silva-herzog-pardi-2014` line 1807 gives gap 382 after 10 726 904 659, which is more than 379 and ends exactly at the threshold; 354 follows 4 302 407 359.
   - Line 508: the q = 0 agreement fails for negative a. With a = −5 and x = 5, ANT's count is 0 and the sieve count (a.val = 5) is 1.
   - Line 1708: "either normalisation satisfies the inequality" does not follow, because switching to li adds liTwo/φ(q) to the error.
   - Line 594: "none of the three instances implies `RiemannHypothesis`" cannot be checked; if RH is true, each implies it.
   - Line 1199: k₆ = 3447 from the recurrence, not 3441.
   - Line 1163: the Johnston–Yang bound is 0.74x at log x = 150; it exceeds x only for log x ≤ 137.
   - Line 1104: the ratio 3.9648 is the left limit at 59; at x = 59 it is 2.82.
   - Line 1489: c and c' are swapped relative to line 1475.
   - Line 1407: C = 0 is impossible, since ∫ t/log³ t > 0.
   - Line 1828: this Check is written as a question.
   - Line 1968 says 10 015 400; the Check at line 1921 says 10 015 787.

   Repair: correct each Check to the computed value above. Rewrite the line-594 Check as "RH(H) for finite H concerns finitely many zeros", and the line-508 Check as a negative control at q = 0.

20. **F20** (P3) Build order: targets need later layers, and layers form coarse cycles

   Location: §0.1 needs §1.7 (lines 309, 313). §0.6 needs §§3.2, 3.5 and 6.1 (line 503). §1.6 needs "the general theorems of §§3.1, 4.5, 6.1, 6.3, 6.6, 7.3" (lines 760–761). §2.3 needs §3.5 (line 897). The layer Dependencies lines create the cycles 0↔1, 0↔3, 1↔3 and 2↔3.

   Repair: move §0.6 to a final section after Layer 7. Define each general error function as a definition target before the table propositions, or move each table proposition next to its general theorem. Move §1.7 before §0.1, or drop §0.1's enclosure bullet. Move §2.3's passage from π* to π into §3.5.

21. **F21** (P3) The Summary states headline bounds without their ranges

   Location: `packages/ExplicitPrimeCounting/design/README.md:19–23`: "Dusart's `|ψ(x) − x| ≤ 0.006409 x/log x` … `|ψ(x; q, a) − x/φ(q)| < x/(840 log x)` for `3 ≤ q ≤ 10⁴`, Schoenfeld's prime in `(x, x + x/16597)`".

   Witness: at x = 2, |ψ(2) − 2| = 1.307 > 0.006409·2/log 2 = 0.0185. At q = 3, a = 1, x = 3: |0 − 1.5| = 1.5 > 3/(840 log 3) = 0.0033.

   Repair: add the ranges: x > e²²; x ≥ 8·10⁹ with a prime to q; x > 2 010 759.9; x ≥ 2 898 242 (see R01). Also give Johnston–Yang's x ≥ 2 and Vanlalngaia's x ≥ 2.

22. **F22** (P3) Works named in the README are missing from the manifest

   Location: lines 254–270, 1127, 1135, 1145, 1875 and 1940. These name Kadiri 2005, Mossinghoff–Trudgian 2015, Mossinghoff–Trudgian–Yang, Ford 2002, Hasanalizade–Shen–Wong, Kadiri–Lumley–Ng 2018, Lehman 1966, Montgomery–Vaughan 1973 and Broadbent et al.

   Witness: none of these has an entry among the 58 ids of `packages/ExplicitPrimeCounting/sources.toml`.

   Repair: either record each in the manifest (`uncertified` with DOI and locator where paywalled), or cite only the supplier target that owns it (for example "ExplicitZetaBounds target 16") and drop the paper attribution.

23. **F23** (P3) §1.2 states the lifting law in the direction it does not use

   Location: `packages/ExplicitPrimeCounting/design/README.md:602–604` ("`GRH(q, H)` implies `GRH(f, H)` for every `f ∣ q`") against lines 612–615 ("the lifting law extends it to all characters modulo `q` once every conductor dividing `q` is covered").

   Repair: state the law in the form that is used. GRH(q, H) holds iff, for every primitive χ* of conductor f ∣ q, the zeros of L(s, χ*) with 0 < Re s < 1 and |Im s| ≤ H have real part 1/2. Note that this is AnalyticNumberTheoryPartI §1.6's "primitive induction" at bounded height. Check: at q = 8 the conductors are 1, 4 and 8.

24. **F24** (P3) §7.4's Dusart 2018 "instances" restate the general lemma with an unsupplied hypothesis

   Location: `packages/ExplicitPrimeCounting/design/README.md:1908–1913`: "the instance of the lemma at … `(1, 3, 89 693)`, under the `θ`-bound hypothesis the lemma requires … the `θ`-bounds behind them are the paper's and are not restated".

   Witness: at (c, k) = (1, 3) the lemma needs η < 0.4998 for all t ≥ 89 693. The only stated Dusart 2018 rows are η = 1 from 89 967 803 and η = 0.5 from 767 135 587 (§3.3), and the README's own Check (line 1934) notes that the second does not suffice.

   Repair: either state the θ-bounds Dusart uses (uncertified, by locator) as hypotheses with their η and x₀, or delete plan target 7.4d and keep the statement as a Check of §7.4's lemma.

Scope of this review: `packages/ExplicitPrimeCounting/design/README.md` (2074 lines, read in full), `packages/ExplicitPrimeCounting/design/plan.json` (8 layers, 66 targets, 183 tests, 8 gaps) and `packages/ExplicitPrimeCounting/sources.toml` (58 entries). No previous review. Twenty-four findings: 4 P1, 12 P2, 8 P3. Three of the P1s are numerically false statements: two thresholds copied from sources, and one derivation of this roadmap's own. The fourth is a pair of hypotheses that are false as defined. Every P1 witness was computed with an exact sieve over x ≤ 2·10⁷.

Dependency check (`gate --only ExplicitPrimeCounting`), output verbatim:

```text
candidate: ExplicitPrimeCounting is not in the merge order yet; checked as if placed after SieveMethodsAndPrimePatterns (the intake inserts it when its design is accepted)
depcheck: 240 roadmaps, 2349 edges, 0 problem(s)
```

The output has no UPWARD and no CYCLE line. R15 below is a direction problem the gate does not see: the declared consumers include roadmaps that come earlier in the order.

Lean: this is a design and there is no `Suggested.lean`. Elaboration is not available (this lane does not elaborate), and neither the one-tactic padding probe nor the `#check @name` audit applies. The headline theorems and their statability at the pins are discussed under Verified sound for the package stage.

## Verified sound

Sampled locators (15 targets and their flagged lines), read at the cited lines:
- 0.4: the identity matches Tau Ceti `primeCount_sub_mul_logIntegral_eq` at δ = 1 (`Transfer.lean:76`). Only the plan locator is wrong (R18).
- 1.1: `van-de-lune-te-riele-winter-1986` lines 13–14 (0 < t < 545 439 823.215); `platt-2017` lines 485–486 (|Im ρ| ≤ 3.0610046·10¹⁰); `platt-trudgian-2021-rh` lines 48–49 (3 000 175 332 800).
- 1.2: `rumely-1993` lines 29–34 (10000 for Q ≤ 13; 2500 for Q ≤ 72 and composite Q ≤ 112); the list at `ramare-2002` lines 152–159; `platt-2011-thesis` lines 8–18.
- 1.5: `ramare-rumely-1996` lines 77–84 (2.072√x and 1.745√x for 1 ≤ x ≤ 10¹⁰); `ramare-2002` lines 161–168.
- 1.7: B = 0.26149 72128 47643 at `rosser-schoenfeld-1962` line 81.
- 2.1: `carneiro-milinovich-soundararajan-2019` lines 1185–1199; `kadiri-lumley-2014` lines 503–509 (‖f_m‖₁ = 2^{2m}(m!)²/(2m+1)!).
- 2.3: `buthe-2016` lines 688–708. The condition is 4.92√(x/log x) ≤ T, confirmed by Büthe's own example T = 3.061·10¹⁰ ⇒ x ≤ 1.89·10²¹.
- 4.1: RS 1962 lines 249–322 (Theorems 5–6 and Corollaries; E is negative, so (2.11) loses its sign in the extraction).
- 4.3: `vanlalngaia-2017` lines 26–51 and 59–65, decoded: 4/log³ x for x ≥ 2; 2.3 for x ≥ 1000; 1 for x ≥ 24 284; and the log x ≥ 4635 form with 0.175.
- 5.1: `dusart-1999-mc` lines 116–141.
- 6.2: RR lines 85–90.
- 6.4: `ramare-2002` lines 174–187 (Corollaires 4–5, the value 0.978 at q = 6, a = 1, L = 1).
- 6.5: `bach-sorenson-1996` lines 802–811 and 921–934.
- 6.6: `kadiri-2008` lines 128–162.
- 7.2: `dudek-2015` lines 47–48; `kadiri-lumley-2014` lines 22–36; the comparison table at `cully-hugill-lee-2022` lines 79–88.

Also read: `schoenfeld-1976` lines 17–125 (Theorem 10, Corollary 1), 196–206 (Theorem 11), 640–733 (Theorem 12, Theorem 6*), 767–779 and 1288–1294. `dusart-2016` lines 74–90. `platt-trudgian-2021-error` lines 58–92. `johnston-yang-2023` lines 56–80. `trudgian-2016` lines 55–73, 128–140 and 224–236. `rosser-schoenfeld-1975` lines 530–537. `faber-kadiri-2018-corrigendum` lines 20–50. `bennett-martin-obryant-rechnitzer-2018` lines 105–113 and 165–195 (Li = ∫₂ˣ, matching §6.3). `dusart-2002` lines 11–112 and 989–1025. `panaitopol-2000` lines 17–22 and 94–118. `deleglise-rivat-1998` lines 233–238 (ψ(10¹⁰) = 10 000 042 119.83). `oliveira-e-silva-herzog-pardi-2014` lines 1795–1821.

Pinned declarations opened (file:line):
- Mathlib `Mathlib/NumberTheory/Chebyshev.lean`:
  - `psi` 70, `theta` 77, `psi_nonneg` 83, `theta_nonneg` 85, `psi_eq_zero_of_lt_two` 108, `theta_eq_zero_of_lt_two` 134, `psi_eq_psi_coe_floor` 161, `theta_eq_theta_coe_floor` 165, `psi_mono` 170, `theta_mono` 177;
  - `theta_le_log4_mul_x` 191, `psi_eq_theta_add_sum_theta` 428, `theta_le_psi` 433, `abs_psi_sub_theta_le_sqrt_mul_log` 442 (2√x log x), `psi_le_const_mul_self` 485 (log 4 + 4);
  - `integrableOn_theta_div_id_mul_log_sq` 658, `primeCounting_eq_theta_div_log_add_integral` 668, `theta_eq_primeCounting_mul_log_sub_integral` 705, `eventually_primeCounting_le` 832.
- Mathlib, other files:
  - `PrimeCounting.lean`: `primeCounting'_nth_eq` 80, `add_two_le_nth_prime` 84, `prime_nth_prime` 106, `primesLE` 133, `mem_primesLE` 163.
  - `Data/Nat/Prime/Nth.lean`: `nth_prime_zero_eq_two` 23, `nth_prime_one_eq_three` 26.
  - `Bertrand.lean:225`; `VonMangoldt.lean:74, 81`; `RiemannZeta.lean:185`; `Analytic/Order.lean:63`; `EulerMascheroni.lean:131, 170, 174`; `Pi/Bounds.lean:178, 184`; `ExponentialBounds.lean:38, 41, 86, 89`; `AbelSummation.lean:128`.
  - `Nonvanishing.lean:404, 412, 417`; `DirichletCharacter/Basic.lean:291`; `Orthogonality.lean:82`; `MellinTransform.lean:91`.
- Tau Ceti:
  - `Analysis/SpecialFunctions/LogIntegral.lean`: 92, 141, 147, 151, 156, 180, 277, 331 (`namespace TauCeti.Real`).
  - `ArithmeticDirichletSeries/Counting.lean`: 625, 630; `Transfer.lean:76`; `Prime/PrimeIdealTheorem.lean:46`; `Chebotarev/PrimeCounting/PrimesCongruent.lean:50` (`NumberField.Chebotarev`).
  - `LFunctions/Mertens.lean:545, 552, 564`; `NumberTheory/PrimeCounting.lean:70, 90` (namespaces as in R17).

Cross-roadmap citations resolved:
- ZerosOfLFunctions (main): §4.1 (README 804), §4.5 (872), §5.6 (1003), §§6.2–6.4 (1046–1097, *IsExceptionalZero* 1077), §7.4 (1263), §§8.3–8.7 (1346–1434, *rayClassPsi* 1436), §8.9 (1556) and Layer 9 (1586–1640: *AllOnCriticalLine*, *GRH*). Suggested.lean: `zeroCount` 60, `chebyshevPsi_explicitFormula` 170, `riemannZeta_weilExplicitFormula` 186 (smooth φ only, hence §2.1's extension), `primeIdealCount_effective` 202, `primeCounting_progression_effective` 216.
- LFunctions (main): Layer 4 `dirichletData` (859), Layer 7 (1440).
- AnalyticNumberTheoryPartI (#1126 a4886b9): §§0.2, 0.3, 0.5, 0.8, 0.16, 0.19, 0.20, 0.25, 0.30, 0.32, 1.6 and 1.9 (README 200–885). Suggested.lean: `psiAP` 42, `primeCountAP` 46, `siegel_walfisz` 50, `DirichletGRH` 128, 132, 137. `theta_ap.level_one` and `theta_ap.sum_classes` are README API names in §0.2, which settles both leads in citations.md.
- ComputationalNumberTheory (#1408): §4.17a (README 2157), §4.22 (2483), §4.24 (2498); `platt_bounded_height` covers q = 1 at height 10⁸.
- SieveMethodsAndPrimePatterns (#1495): §3.1 (README 2439); `SieveDistribution.primeCountAP` (Suggested 308).
- EffectiveClassNumbers (#1406 head): §4.4 adapter (README 946).
- ClassicalArithmeticCompletion (main): §6.34 `dyadicPrimeCount` (README 12891–12913).
- Gap suppliers (board target stage): ExplicitZetaBounds targets 8, 9, 10, 16, 17, 19 and 20, and ExplicitCharacterSumsAndSieves target 21, exist as named. The intended order (ExplicitCharacterSumsAndSieves → ExplicitZetaBounds → ExplicitPrimeCounting → ExplicitMultiplicativeFunctions) is consistent with the gaps. The citation lead "ExplicitZetaBounds Layer 8" is a declared gap, not drift.

Ownership checked by object with `roadmaps grep` (main and the 458 open heads):
- li and liTwo: none elsewhere; Completed/ContourIntegration's `HasCauchyPV` is a contour principal value, a different object.
- RH(H): only ExplicitZetaBounds (R05).
- Montgomery–Vaughan Brun–Titchmarsh: only ExplicitCharacterSumsAndSieves target 21; SieveMethodsAndPrimePatterns §1.6 has an unspecified constant.
- θ < 1.000081x: AnalyticNumberTheoryPartI §0.3 (R16).
- The decimals of γ and B: nowhere at the pins (Mathlib has only 1/2 < γ < 2/3).

Adversarial table. These rows cover the sample, the headlines and every target a finding touches; the values come from an exact sieve to 2·10⁷ and direct evaluation.

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| §0.1 liTwo series | γ = 0.5772157 | liTwo = 1.0451638; from 1/2 < γ < 2/3: 0.968 < liTwo < 1.135 | holds | — |
| §0.1 li 1.4 < 0 | Riemann sum on [1.4, 2] | 0.2(2.1276 + 1.7013 + 1.4427) = 1.0543 > 1.0452 | holds | — |
| §0.3 ψ − θ | x = 8, 121, 120.9 | 1.3863; 12.7148 (bound 48.97); 10.3169 < 0.998697√120.9 = 10.981 | as stated | — |
| §0.4 identity | x = 2, 3 | 1.000; −1.0998 + 0.3691 − 1.2779 + 2.8854 + Li 3 (1.1184) = 1.995 | holds | locator R18 |
| §0.2 C(4,3) − C(4,1) | χ₄ | −(1/2)(−1 − 1)(L′/L)(1, χ₄) = (L′/L)(1, χ₄) | holds | — |
| §0.6 agreement at q = 0 | a = −5, x = 5 | ANT count 0, sieve count 1 | Check false | R19 |
| §0.6 PrimeProduct | 10⁸ | 0.2615 + 1/(2·18.42²) = 0.2630 < 0.27 | holds | — |
| §1.1 RH(0), RH(14) | first ordinate 14.1347 | no zero with \|Im\| ≤ 14 | holds | R05 owner |
| §1.2 composite q ≤ 112 | prime factor p > 72 | forces q ≥ 2p ≥ 146 | holds | R23 |
| §1.4 gaps < log² p | 7; 113; record 1 693 182 318 746 371; last row | 4 ≥ 3.786; 14 < 22.35; 1132/1229.6 = 0.921; 1476 < 1747 | holds | — |
| §1.3 FaberKadiriRange | x = 100 | 5.955 > 0.0537 | false | R04 |
| §1.3 PlattTrudgianRange | x = 100 | 5.955 > 1.2·10⁻³ | false | R04 |
| §1.6 Platt–Trudgian row X = 1000 | formula | 461.9 · 2667 · 1.017·10⁻¹¹ = 1.25·10⁻⁵ against printed ε₀ = 1.20·10⁻⁵ | consistent | — |
| §1.7 enclosures | RS line 81 | \|B − 0.2614972128\| = 4.8·10⁻¹¹; \|γ − 0.5772156649\| = 1.5·10⁻¹² | holds | R18 |
| §2.1 ∑ 1/(ρ(1 − ρ)) | constant | 2 + γ − log 4π = 0.0461915; first 7 ordinates 0.012166 + tail 0.01116 = 0.0233 ≈ 0.02310 | holds | — |
| §2.1 kernel class | (4t(1−t))¹, (4t(1−t))², cosine kernel | C⁰, C¹, C⁰ only | outside C² | R09 |
| §2.2 Schoenfeld under RH (headline) | x = 100, 1000, 10⁴ | 5.955 < 8.438; 3.32 and 43.75 < 60.05; li − π = 17.1 < 36.65 | holds | — |
| §2.2 coverage | (6.3) on 1075–1423; (6.4) on 59–73.2 | Büthe's θ clause starts at 1423; ψ clause suffices only for x ≥ 129 | hole | R12 |
| §2.3 Büthe | T = 3.0002·10¹²; x = 60 | 4.92√(x/log x) = 2.994·10¹² at 2.16·10²⁵; 18.84; \|ψ(60) − 60\| = 2.47 ≤ 5.166 | holds | R20 |
| §2.4 threshold 587 | 586, 587 | 0.038831 > 0.03883 ≥ 0.038798 | sharp | — |
| §2.5 intervals | 600; Dudek at 2; CMS at 4 | h = 79.77, prime 521; (0.752, 2]; [4, 6.44] ∋ 5 | holds | — |
| §3.1(a) Dusart 2016 | R = 5.69693, log x = 10⁴ | X = 41.897, ε = 6.56·10⁻¹⁸; 8R = 45.575 needs log x ≥ 11 833 | holds | R18 |
| §3.1(b) | b = 50, m = 18 | mδ/2 = 8.525·10⁻⁸ < 9.05·10⁻⁸; e^{−1/2} log 2π = 1.115 | holds | — |
| §3.2 ψ < 1.03883x (headline) | 113 | ψ(113)/113 = 1.0388206; θ(113)/113 = 0.94752 | holds | R16 |
| §3.2 Schoenfeld Theorem 11 | x = 17; e¹⁰⁰ | ε₀ = 0.16573 (bound 2.817 ≥ 0.679); ε₀ = 0.027749 | holds | — |
| §3.3 0.006409 (headline) | 10¹⁰; row b = 22 | 42 119.8 ≤ 2.783·10⁶; 2.78652·10⁻⁴ · 23 = 6.409·10⁻³ | holds | R21 |
| §3.3 η₂ at 59 | 59⁻ and 59 | 3.966 and 2.816 | wording | R19 |
| §3.4 Trudgian θ | 126.99; 149 | 19.92 > 19.24; 17.35 ≤ 22.43 | threshold consistent | — |
| §3.4 Johnston–Yang (headline) | x = 2; log x = 137, 150, 400 | 5.41 ≥ 1.307; ratio ≈ 1.0, 0.739, 0.00535 | holds | R19 |
| §3.4 Fiori–Kadiri–Swidinsky | x = 2; log x = 300 | 7.58 ≥ 1; 0.0201 | holds | — |
| §3.5 π bounds | scan 2 ≤ x ≤ 1.6·10⁷ | 0 failures (RS Theorems 1–2, Corollaries 1–3, Dusart's seven, Axler 1.1 and 1.3); π(113) log 113/113 = 1.2550587 | holds | R16 |
| §3.5 Panaitopol | recurrence | k = 1, 3, 13, 71, 461, 3447 | k₆ slip | R19 |
| §4.1 one-sided Mertens | scan to 1.6·10⁷ (E = −1.33258) | 0 failures for all four | holds | — |
| §4.2 at x = 10 | Λ(n)/n sum | 1.69465 against 1.72537; difference 0.0307 ≤ 0.346 | holds | — |
| §4.3 Vanlalngaia (headline) | exact form at 3; transfer; 1000 | 0.5436 + 0.2897 = 0.8333; 1/3 + 5/(4·18.315) = 0.4016 ≤ 0.41; 0.0040 ≤ 0.00698 | holds | — |
| §4.4 identity | f = 1/(t log t) | t f → 0 but ∑ 1/p = ∞ | missing hypothesis | R14 |
| §4.4 Ramaré P = 2, f = t⁻² | — | ∑ (log p)/p² = 0.49309 ≤ 4.663 | holds | — |
| §4.5 Treviño at 10⁴ | row 315 437 | [5 670 858, 5 818 241] ∋ 5 736 396 | holds | — |
| §4.6 Deléglise–Nicolas | r₀(1), r = 2, π₅(3) | 3r⁴ + 8r³ + 6r² = 25.00 at 1.1445; 3207/1944 = 1069/648; 275 = 275 | holds | — |
| §5.1 bootstrap | n = 61, c = 1.1, c′ = 1 | hypotheses 277.27 < 283 < 283.37; conclusion 277.49 | false | R03 |
| §5.2 Rosser–Schoenfeld p_n | n = 5, 6, 19, 20; scan n ≤ 10⁶ | 11 > 10.43; 13 < 14.25; 67 > 66.96; 71 < 71.86; 0 failures | holds | — |
| §5.3 Robin −0.9385 | k = 7022, 8601, 8602 | 70 919 > 70 918.61; 88 807 > 88 805.00; 88 811 < 88 816.44 | false | R02 |
| §5.3 Dusart −1 (headline), −0.9484 | scan k ≤ 10⁶ | 0 failures; −0.9484 fails at 39 016, holds from 39 017 | holds | R11 |
| §5.3 Dusart route | log k = 10⁴ | needs 7.06·10⁻⁸ against 9.05·10⁻⁸ | route gap | R11 |
| §5.4 Cipolla at 10⁶ | four terms | 15 481 000 against 15 485 863 | holds | — |
| §5.5 sums of the first primes | B₉, B₈; De Koninck–Letendre at 5 and 4; Axler 1.9 scan | 3.5, −1; 7.745 ≤ 7.927, 5.347 > 4.852; 0 failures | holds | — |
| §6.1 RR row k = 8 | RR line 1385 | 0.002811 at 10¹⁰ | matches | R07 |
| §6.2 tabulation | k = 1, x₀ = 10⁶ | 1515.8 ≤ 2072 | holds | — |
| §6.3 BMOR (headline) | q = 3, x = 8·10⁹ | 8·10⁹/(840 · 22.80) = 4.18·10⁵ | holds | R19, R21 |
| §6.4 Ramaré | q = 6, a = 1, L = 1 | value 0.978 = \|C(6,1)\| | statement holds | R10 |
| §6.5 cyclotomic discriminant | q = 3, 4, 5, 6, 12 | 3, 4, 125, 3, 144 | holds | — |
| §6.5 least prime | q = 2, 3 | bounds 3.84 (prime 3) and 21.72 (primes 2, 7) | holds | — |
| §6.6 Kadiri | row (5·10⁴, 1) at q = 10⁵ | 6.9684 · 132.55 = 923.7 | holds | R08 |
| §7.1 Schoenfeld interval (headline) | gap scan to 1.6·10⁷ | last failing start 2 010 733 (gap 148); threshold 2 010 759.84 | holds | R12 |
| §7.2 Check | Table 8 | gap 382 after 10 726 904 659 > 379 | Check false | R19 |
| §7.4 Trudgian (headline) | x = 2 898 240 | right end 2 898 357.93; next prime 2 898 359 | false | R01 |
| §7.4 Axler 1.5 | gap after 58 831 (58) | failure up to x ≈ 58 836.5; 58 837 sharp | holds | — |
| §7.4 lemma | algebra | θ(y) − θ(x) ≥ (x/log^k x)(c − η(2 + c/log^k x)) | holds | — |
| §7.5 | cube expansion | (x^{1/3} + 1)³ = x + 3x^{2/3} + 3x^{1/3} + 1 | holds | — |

Shape: the README has the upstream headings (Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, eight layers each ending with Examples and Dependencies, Downstream consumers, Worked examples, References). Every definition has at least three Checks. The text uses no LaTeX, no process words and no pull-request numbers; line 1828 is the only exception (R19).

For the package stage (not findings): AnalyticNumberTheoryPartI is still a pull request, so `Suggested.lean` must define ψ(x; q, a) locally rather than import `psiAP`. Headlines whose hypotheses are table propositions over the general error functions (Dusart's Ω₁ and Ω₂ with K_ν integrals) would need long encodings. They are better stated with explicit pointwise ψ-bounds as hypotheses, or named in the docstring as not statable.

## Not verifiable

- `rosser-schoenfeld-1962` (3.20), line 285: the extraction prints "1/log x". I believe the printed paper has 1/log² x, but I could not confirm it; the README follows the extraction. The weaker form was checked numerically to 1.6·10⁷.
- `ramare-saouter-2003`, `dusart-2018`, `rosser-1938`, `rosser-1941`, `cully-hugill-lee-2024`, `dusart-1999-cr` and `platt-ramare-2017` are paywalled and settled as uncertified; their texts were not read. This leaves the §7.2 rows unconfirmed, including Δ = 14 500 755 538 at e⁶⁰ and the height it used, together with the Dusart 2018 rows of §§3.3, 4.3, 4.6 and 7.4, the Rosser bounds of §5.2 (checked numerically only) and Cully-Hugill–Lee's corrected table.
- `cipolla-1902` is waived.
- `massias-robin-1996` (scan) was not in the sample and was not read.
- The exact placement of the square root in `dusart-2002`'s ε(X) (lines 999–1002) is inferred from consistency with Theorem 4 (R07).
- Lean elaboration is not available (design stage, no `Suggested.lean`).

## Source issues

- **Error** in trudgian-2016 at Corollary 2, printed p. 7 (lines 229–233): the source says every x ≥ 2 898 239 has a prime in [x, x(1 + 1/(111 log² x))]; it should be x ≥ 2 898 242, because the gap after 2 898 239 is 120 and the interval length there is 118; affects a stated result.
- **Error** in robin-1983 at the consequences of Théorème 8 (line 84, eq. (23) at line 378): the source says p_k ≤ k(log k + log log k − 0.9385) for k ≥ 7022; it should be k ≥ 8602, because the bound fails at k = 7022 and 8581–8601; affects a stated result.
- **Misprint** in johnston-yang-2023 at Theorem 1.4, eq. (1.9) (line 80): the source says \|π(x) − x\|; it should be \|π(x) − li(x)\|, as line 75 says; affects a stated result.
- **Gap** in schoenfeld-1976 at the Note Added in Proof, p. 360 (lines 1288–1294): the source announces θ(x) < 1.000081x for all x > 0 and defers the proof; it should cite a proof, which Büthe's range together with Dusart's row b = 30 supplies; affects a stated result.
- **Misprint** in bach-sorenson-1996 at Theorem 5.3 (lines 921–922): the source states the bound for all q coprime to m; it should assume q ≥ 2, since at q = 1 the bound 2(q log q)² is 0; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "d987475ea87d1e88119fd71404483c9b7b7d6f39", "job": "REV-DESIGN-ExplicitPrimeCounting", "model": "claude-opus-5-5", "worker": "chris-x27"} -->
