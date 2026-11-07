<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/8420#issuecomment-6713415786 -->
Review (claude) of b9a1276

Verdict: needs_changes

1. **F01** (P2) nine filed targets dropped with no owner

   Location: `design/README.md` lines 54–62 ("Outside this roadmap altogether are: … the explicit k-th derivative
   test (`k ≥ 3`) for integer points near curves; explicit partial Gaussian sums and the Pólya–Vinogradov bounds of
   Bordignon–Kerr and Bordignon …; Burgess bounds for composite moduli; … the dimension-two sieve bounds of Siebert and
   Riesel–Vaughan …; explicit linear sieves") and line 9 ("with the constants of Treviño, McGown and Booker").

   Claim: the design's scope equals the filed target's.

   Witness: `target.md` lines 167–171 (target 9), 192–204 (15), 220–227 (19, Booker), 228–233 (20), 250–258 (23),
   265–267 (26) and 178–181 (12) are filed targets; the literature addendum's recommended actions for them read
   "State Zhao's unconditional form" (9), "Keep as the all-`q` fallback" (12), "State with `c = 49`", "Keep", "Keep",
   "Replace by RMI Theorem 1.1" (15a–d), "Keep" (19), "Keep JSKL …" (20a), "Keep; fix the venue" and "Keep the RV table
   as the Prop" (23a–b), "Replace the source by BJS Thm 6" (26). The README names none of these as a target and names
   no roadmap that owns them. Layer 4 has no Booker table (the only use of `booker2006` is the quadratic case of the
   moment bound, line 872), so the summary's "constants of … Booker" describes nothing in the roadmap. The sibling
   `ExplicitZetaBounds` target (its line 276) expects "the weighted and maximal large sieves" from this roadmap, which
   the dropped dimension-two layer was to supply.

   Repair (either): (a) restate the dropped items as targets, each with its hypotheses, Checks and locator; the
   sources are already in the manifest (`zhao2024` Theorem 2.1 and its corrected constants for 9; `bachmanrachakonda2001`
   for 12; `bordignonkerr2020` Corollary 1, Theorems 2 and 5 and `bordignon2022partial` Theorem 1.1 for 15;
   `booker2006` Proposition 2 and Table 1 for 19; `jainsharmakhaleliu2021` Theorem 1.1 for 20; `siebert1976`,
   `rieselvaughan1983` Lemma 4 and `platttrudgian2018` for 23; `bordignonjohnstonstarichkova2022` Theorem 6 for 26),
   with their tables as Layer 6 Props (the filed `Booker_QuadraticBurgessTable`, `RieselVaughan_LA_Table`,
   `TwinPrimeConstant_Enclosure`); or (b) state in "Scope and ownership" that these seven groups are the content of
   `ExplicitCharacterSumsAndSievesPartII`, one clause each naming the filed target and its source, so that every item
   has an owner and the Part II's introduction can say where this roadmap stops. In both cases strike "and Booker" from
   the summary or add the Booker target. Dropping target 6 (the Karatsuba–Korolëv stationary phase) and target 11 (Qiu)
   is sanctioned by the addendum ("Drop the KK attribution or state KK's actual theorem"; "Demote Qiu to a remark") and
   is not part of this finding.

2. **F02** (P3) merge order lists two consumers before this roadmap

   Location: `design/README.md` lines 1383–1387 (Downstream consumers: ExplicitZetaBounds, ExplicitPrimeCounting).

   Claim: those two roadmaps are later in the merge order.

   Witness: `merge-order/ORDER.txt` lines 269–271 read ExplicitZetaBounds, ExplicitPrimeCounting,
   ExplicitCharacterSumsAndSieves (commit 4c2cfe8e placed the five explicit roadmaps by hand). The siblings agree with
   the README, not with the order: `packages/ExplicitZetaBounds/target.md` line 268–269 "The order of supply must be
   ECS → ExplicitZetaBounds → ExplicitPrimeCounting"; `packages/ExplicitPrimeCounting/target.md` line 435 the same.
   This roadmap's own edges are all downward (the gate is clean); the defect will surface as an UPWARD line on the
   ExplicitZetaBounds design.

   Repair: nothing in the README. The worker records for the intake that this roadmap belongs directly after its last
   supplier, SieveMethodsAndPrimePatterns (line 268), before ExplicitZetaBounds; a human moves it (the reviewer does
   not edit the merge order).

3. **F03** (P3) the finite van der Corput inequality is also proved by ProbabilisticAndMetricNumberTheory

   Location: `design/README.md` lines 31–34 and §0.3.

   Claim: §0.3 is the single owner of the finite lag inequality.

   Witness: ProbabilisticAndMetricNumberTheory #1421, README line 2756–2758: "Apply the finite_lag_inequality:
   `H²|∑ b(n)|² ≤ (N + H − 1)(H·N + 2∑(H − h)|C(h)|)` … Prove this finite_lag_inequality for arbitrary complex b" — the
   same statement, proved there. Merge order: this roadmap 271, ProbabilisticAndMetricNumberTheory 274, so this roadmap
   is the owner and the README already says so and lists #1421 §2.5 as a consumer.

   Repair: none in this README beyond keeping §0.3; the intake announces on the ProbabilisticAndMetricNumberTheory job
   that its §2.5 must cite ExplicitCharacterSumsAndSieves §0.3 instead of proving `finite_lag_inequality`. (The brief
   grades a shared object P2; it is graded P3 here because this README already settles the owner by the merge order
   and the only action is the other roadmap's citation.)

4. **F04** (P3) 1.3, Check 1: wrong excess

   Location: `design/README.md` lines 437–438: "Patel's form `2(L/V + 2)(2√(W/π) + 1)` exceeds it by `L/V + 1 > 0`".

   Claim: the difference of the two forms is `L/V + 1`.

   Witness: expanding, `2(L/V+2)(2s+1) − [2((L−1)/V+2)(2s+1/2) + 1] = L/V + 1 + (4s + 1)/V` with `s = √(W/π)`.
   At `L = 10`, `V = 2`, `W = 3`: difference `8.454`, while `L/V + 1 = 6`.

   Repair: "exceeds it by `L/V + 1 + (4√(W/π) + 1)/V > 0`".

5. **F05** (P3) 3.5: "exactly when `q > 25`" is false as an equivalence

   Location: `design/README.md` lines 810–811: "`L = ⌊π²√q/4 + 9.15⌋` (even) or `L = ⌊π√q + 9.15⌋` (odd), which
   satisfies `1 ≤ L ≤ q` exactly when `q > 25`".

   Claim: `1 ≤ L ≤ q` holds if and only if `q > 25`.

   Witness: even, `q = 19`: `π²√19/4 + 9.15 = 19.90`, `L = 19 ≤ 19`; `q = 18`: `L = 19 > 18`. Odd, `q = 24`:
   `π√24 + 9.15 = 24.54`, `L = 24 ≤ 24`; `q = 23`: `L = 24 > 23`. So the condition holds for `q ≥ 19` (even) and
   `q ≥ 24` (odd). Lapkova's proof (lapkova2018, the displays `1 ≤ L ≤ q`, `q > 25`, `q ≤ 25` in the proof of
   Lemma 3A) uses `q > 25` as a sufficient split, not an equivalence.

   Repair: "which satisfies `1 ≤ L ≤ q` for `q > 25` (Lapkova's split)".

6. **F06** (P3) 4.1: the tuple count's hypothesis does not follow from the moment bound's

   Location: `design/README.md` lines 864–866 ("for integers `H ≥ 1` and `r ≥ 1` with `r ≤ 9H`") and 868
   ("For real `B > 0` with `r ≤ 9B`").

   Claim: the moment bound for real `B` follows from the count at `H = ⌊B⌋`.

   Witness: `B = 1.5`, `r = 13`: `r ≤ 9B = 13.5` but `r > 9⌊B⌋ = 9`, so the count as stated does not apply. The
   bound itself still holds there: for `r > 9H` the number of degenerate tuples is at most `H^{2r} ≤ (2r − 1)!! H^r`,
   because `(2r − 1)!! ≥ (2r/e)^r` (true at `r = 1`, and the ratio of consecutive terms `2r + 1` exceeds
   `(2(r+1)/e)(1 + 1/r)^r`) and `H < r/9 < 2r/e`.

   Repair: drop the hypothesis `r ≤ 9H` from the count, proving the range `r > 9H` by the trivial bound above (one
   sentence in the proof route); or state the moment bound with `r ≤ 9⌊B⌋`. The uses in 4.5 have `⌊B⌋ ≥ 15 ≥ r`.

7. **F07** (P3) Layer 6: 6.7 and 6.8 are not finite lists

   Location: `design/README.md` lines 1253–1256 ("a finite list of numerical inequalities …") against 1340
   ("and every real `p ≥ p₀`") and 1359.

   Claim: every Layer 6 hypothesis is a finite verification.

   Witness: `TrevinoTable1Certificate` and `TrevinoTable3Certificate` quantify over all real `p ≥ p₀`, an unbounded
   range; the source evaluates (46)–(47) and (58)–(59) at `p = p₀` only (trevino2015 lines 1008–1012, 1293–1309),
   with no monotonicity in `p` stated. The monotonicity is true for the tabulated parameters: the bracket in (46) has
   derivative `(1/(k u³))(1 − 3u/8 − 2 log(1.85 k u))` in `u = log p`, negative for `u ≥ 16` and every `k ≥ 1/30`, and
   `A`, `B` increase with `p`.

   Repair: state both certificates at `p = p₀` (finitely many rows), and add to 4.5's proof route the monotonicity of
   the right sides of (46)/(47) and (58)/(59) in `p` for `p ≥ p₀` as a lemma of this roadmap (not a hypothesis).

8. **F08** (P3) two numerical slips in Checks

   Location: `design/README.md` line 911 ("`V₂ ≤ 22400(0.00112 + 3.947) = 88,437`") and line 1332
   ("`C₀(2) = 252^{1/4}/(1 − 2/√11) = 10.0364 < 10.0366`").

   Witness: `22400 × 3.94812 = 88,438` (with `log(1.85·28) = 3.9474`: `88,447`); `252^{1/4} = 3.98428`,
   `1 − 2/√11 = 0.396977`, quotient `10.036550`, which 4.4 (line 968) prints correctly as `10.0365…`. The inequality
   `C₀(r) < C(r)` holds for every `2 ≤ r ≤ 15` (recomputed to ten digits; the tightest row is `r = 8`,
   `C₀(8) = 2.27209925 < 2.2721`).

   Repair: `88,447` (or `88,438` with the rounded `3.947`); `10.0365`.

9. **F09** (P3) 0.3: the real-part corollary is not a corollary

   Location: `design/README.md` lines 265–268 ("ariasdereyna2024 Lemma 6 … which is the corollary
   `|Y⁻¹Σ f(n)|² ≤ 4/H + (4/(HY)) Re(…)`").

   Claim: Lemma 6 with the real part follows from the main inequality of §0.3.

   Witness: the main inequality has the factor `N + H − 1` on the real part; replacing it by `2Y` is only an upper
   bound when the real part is nonnegative. A brute-force search over coefficient sequences of length at most 6 with
   values in sixth roots of unity found no counterexample to Lemma 6 itself, so the statement is plausibly true, but
   the derivation (and the source's, see Source issues) does not give it.

   Repair: state the corollary with `|C(h)|` in place of the real part (the form 1.6 actually uses), or keep the
   factor `N + H − 1`.

10. **F10** (P3) manifest locators narrower than the citations

   Location: `sources.toml`, entries `frolenkovsoundararajan2013` (locator "Theorem 1"; the README cites Theorem 2
   and Corollary 1), `montgomeryvaughan1973` ("Theorem 2"; the README cites Lemmas 7 and 10 and display (3.3)),
   `fan2022` ("inequalities (4) and (5)"; §5.6 states (6)), `trevino2015` (no Theorem A, Lemmas 1–6, Tables 4–7),
   `mcgown2012` (no Theorem A.9, Lemmas A.5–A.7), `hunter2016` (no Theorem 1.3).

   Repair: extend each `locator` to what the README cites.

11. **F11** (P3) 2.3 evaluates `R` at an interval length outside 0.2's domain

   Location: `design/README.md` line 626 (`R(Δ_h f, a, N − h, 2δ)` for `1 ≤ h ≤ A ≤ N`) against line 238
   ("for real `a`, `N > 0`").

   Witness: `A = N`, `h = N` gives `N − h = 0`.

   Repair: define `R(f, a, N, δ)` for `N ≥ 0` in 0.2 (the count over `[a, a]` is `0` or `1`), or sum over `h < N`.

12. **F12** (P3) 3.3, Lemma 2's alternative route names the wrong minimum

   Location: `design/README.md` lines 747–748 ("the function `−log(2s) − 1/((n + 1)s)`, `s = sin(x/2) ≥ 1/(2n)`, is
   at least `log n − 2n/(n + 1) > −2/n`").

   Witness: on `[1/(2n), 1/2]` the function increases up to `s = 1/(n+1)` and decreases after it, so its minimum is
   at an endpoint; the right endpoint gives `−2/(n + 1)`, and at `n = 2` this is `−0.667 < log 2 − 4/3 = −0.640`.
   Both endpoint values exceed `−2/n`.

   Repair: "is at least `min(log n − 2n/(n + 1), −2/(n + 1)) > −2/n`".

Files reviewed: `packages/ExplicitCharacterSumsAndSieves/design/README.md` (1451 lines, 7 layers, 66 plan targets),
`packages/ExplicitCharacterSumsAndSieves/design/plan.json`, `packages/ExplicitCharacterSumsAndSieves/sources.toml`
(51 entries), against the filed target `packages/ExplicitCharacterSumsAndSieves/target.md`, the pinned Mathlib
(`1b1ccf4b`) and Tau Ceti (`2fd255d9`), the merge order, and the suppliers at their open heads. No previous review.
Elaboration: not available (design stage; there is no `Suggested.lean`). Gate output:

    depcheck: 240 roadmaps, 2433 edges, 0 problem(s)

## Verified sound

**Principles.** No route-specific shortcut (every bound is stated for all `χ`, all `f`, all `k`, with the sources'
hypotheses); no re-planned roadmap (Selberg weights, the large sieve, Weil's bound and the Rosser–Schoenfeld
estimates are consumed by section); no upward or cyclic supply (gate above; the four suppliers are at lines 90,
154, 268 of the merge order and the roadmap at 271; ProbabilisticAndMetricNumberTheory, named only as a consumer,
is at 274); no copied passage (every statement is restated; the Checks are the author's); no algorithm (Layer 6
names finite verifications as Props and the README says what they verify). No `sorry`'d data, no `set_option`,
no process residue, no LaTeX delimiters, no pull-request numbers in the README.

**Sampled sources, all verified at the locator** (cached texts, by line):
0.1 (tmeemt-art05 84–89; patel2022 144); 0.2 (tmeemt-art11 77–86); 1.6 (ariasdereyna2024 Theorem 7 lines 398–404,
constant `B` and its property 384–391, Lemma 6 224–227); 2.1 (tmeemt-art11 183–186; `K = ⌊(8δ)⁻¹⌋ + 1`, `H ≤ K`);
2.2 (tmeemt-art11 114–119; zhao2024 Theorem 2.5 lines 211–216); 3.3 (pomerance2011 Lemma 2 112–134, Lemma 3
147–161, Lemma 4 172–204, tail bound line 180); 3.4 (pomerance2011 Theorem 1 78–86, `S(χ) = 2S₀(χ)` for even 89–95);
4.3 (trevino2015 (26)–(29) lines 643–700; mcgown2012 Lemma A.5 line 1083); 4.4 (mcgown2012 Theorem A.1 1030–1051,
Theorem A.9 1209–1233, `d = 11`, `p₀ = 2·10⁴` at 1433; trevino2015 Theorem C 113–128); 5.1 (buthe2014 Lemma 4.4
365–367, Lemma 4.5 462–468, van Lint–Richert identities 226–236; fan2022 185–187 for Montgomery–Vaughan's `1.07`
and `0.89`); 5.3 (buthe2014 Lemma 3.1 69–73, Proposition 3.2 139–158, Proposition 3.3 237–240); 5.4 (buthe2014
Definition 4.1 291–295, Theorem 4.2 298–314, Theorem 4.3 354–362, proof 602–655); 6.2 (fan2022 185–187); 6.5
(fan2022 290–292); 6.8 (trevino2015 Lemma 6 1088–1093, Tables 6–7 1296–1322, admissible `k` at 1289, Corollary 2
proof 1324–1334). Also checked: 0.3 (yang2024 Lemma 2.3 324–339; hiarypatelyang2024 Lemma 2.4 96–108), 0.5
(frolenkov2011 (1) 22–27), 1.1 (ariasdereyna2024 Lemma 1 and Remark 2 90–104; patel2022 Lemma 2.1 78–81;
granville-ramare-1996 Lemma 8.4 903–908), 1.2 (hiarypatelyang2024 Lemma 2.3 86–92), 1.3 (ariasdereyna2024 Lemmas 4
and 5 109–114, 183–189; patel2022 Lemma 2.3 140–144 and (25) at 157), 1.4 (patel2022 Lemma 2.5 160–164, `α̃₃, β̃₃`
185, lag sum (32) 229–232; hiary2016zeta Lemma 1.2 84–94 with `64/15`; the wiki's `65/15` at tmeemt-art05 123),
1.5 (patel2022 Lemmas 3.1 191–196 with `18/20` printed and `18/10` in (33) line 241 and (35) line 263, Lemma 3.2
266–270), 2.3 (zhao2024 Lemma 2.6 284–319, Theorem 2.7 324–330), 3.1 (pomerance2011 (7)–(10) 229–262), 3.2
(pomerance2011 (4)–(5) 183–203), 3.5 (lapkova2018 Lemma 3A, `M_χ := max_{L,P}|Σ_{n=L}^P χ(n)|`, the even and odd
constants; tmeemt-art15 114–118 states the max-over-intervals form for `q ≥ 1200`/`q ≥ 40`; hunter2016 Theorem 1.3
680–684 quotes only the initial-sum form), 3.6 (tmeemt-art15 106–109; hunter2016 Theorem 1.2 651–664), 4.1
(trevino2015 Theorem A 57–63), 4.2 (trevino2015 Lemma 1 210–219, Lemma 5 419–423, Lemma 6 1088–1093), 4.5 (Theorem 1
83–88, Table 1 97–107, Corollary 1 91–94, Theorem 2 134–141, Table 3 145–155, Corollary 2 156–161, proof of
Corollary 1 1026–1080), 5.2 (tmeemt-art14 159–170), 5.5 (tmeemt-art14 79–87, 101–111; ramareviswanadham2021 Lemmas
14–15 650–679), 5.6 (fan2022 Theorem 157–163; tmeemt-art14 187–191), 6.7 (trevino2015 Tables 4–5 996–1024, the bound
`⌊A⌋ ≥ A − 1` at 985). The TME-EMT `c₂` table with a `p₀ = 10⁷` column (tmeemt-art15 236–284, `3.5341` at
`r = 2`, `p₀ = 10²⁰`) is as the README's 4.5 Check describes.

**Library declarations opened at the pins** (file:line). Mathlib: `Real.fourierChar` Analysis/Complex/Circle.lean:221,
`fourierChar_apply` :232; `UnitAddCircle.norm_eq` Analysis/Normed/Group/AddCircle.lean:223; `conductor`
NumberTheory/DirichletCharacter/Basic.lean:245, `eq_one_iff_conductor_eq_one` :267, `IsPrimitive` :291,
`primitiveCharacter` :306, `changeLevel_primitiveCharacter` :309, `primitiveCharacter_isPrimitive` :313,
`IsPrimitive.inv` :413, `Odd` :537, `Even` :540, `Odd.eval_neg`/`Even.eval_neg` :567/:572; `norm_le_one` Bounds.lean:44;
`gaussSum` NumberTheory/GaussSum.lean:72; `gaussSum_mulShift_of_isPrimitive` DirichletCharacter/GaussSum.lean:59;
`ZMod.stdAddChar` CircleAddChar.lean:83, `isPrimitive_stdAddChar` :95; `BoundingSieve` SelbergSieve.lean:54,
`SelbergSieve` :78, `siftedSum_le_mainSum_errSum_of_upperMoebius` :217, `upperMoebius_lambdaSquared` :251;
`quadraticChar_ne_one` QuadraticChar/Basic.lean:207; `log_add_one_le_harmonic` Harmonic/Bounds.lean:25,
`harmonic_le_one_add_log` :34; `Real.cot` Analysis/Complex/Trigonometric.lean:89, `Real.cot_eq_cos_div_sin` :644;
`exists_deriv_eq_slope` Deriv/MeanValue.lean:155; `AbsolutelyContinuousOnInterval` AbsolutelyContinuous.lean:155,
`integral_deriv_eq_sub` AbsolutelyContinuousFun.lean:227; `Finset.sum_mul_sq_le_sq_mul_sq`
Algebra/Order/BigOperators/Ring/Finset.lean:171; `inner_le_Lp_mul_Lq_of_nonneg` MeanInequalities.lean:954;
`Complex.hasSum_taylorSeries_neg_log` LogBounds.lean:280; `tendsto_tsum_powerSeries_nhdsWithin_stolzSet`
AbelLimit.lean:162; `hasSum_fourier_series_of_summable` Fourier/AddCircle.lean:493; `strictConcaveOn_sin_Icc`
Convex/SpecificFunctions/Deriv.lean:164; `Real.sin_le` Trigonometric/Bounds.lean:56, `Real.mul_le_sin` :84;
`ZMod.unitOfCoprime` Data/ZMod/Basic.lean:794; `cardDistinctFactors` ArithmeticFunction/Misc.lean:329;
`eulerMascheroniConstant` Harmonic/EulerMascheroni.lean:131. Tau Ceti: `gaussSum_mul_gaussSum_inv_eq_card_of_isPrimitive`
NumberTheory/DirichletCharacter/GaussSum.lean:43, `IsPrimitive.norm_gaussSum` :82; `sum_range_level_eq_zero`
PartialSum.lean:30, `sum_range_eq_sum_range_mod` :37, `norm_sum_Icc_le_level` :49 (initial sums `Icc 1 n` only; the
`min(N, q)` bound of 0.4 for general `M` adds periodicity and the trivial bound, which the *Needs* line covers).
Neither pin has a Kusmin–Landau lemma, derivative test, Pólya–Vinogradov, Burgess or Brun–Titchmarsh inequality or
large sieve (grep over both libraries).

**Supplier citations resolved at the heads.** SieveMethodsAndPrimePatterns #1495: §1.3 "Selberg's optimal weights
and upper bound" (λ_z(1) = 1, |λ_z| ≤ 1, main term 1/G, strict cutoff `d < z`, lines 1173–1210); §2.9 "Large sieve
for forbidden residues" with exactly `J(Q)|Σa_n|² ≤ (H − 1 + Q²)Σ|a_n|²`, `h(d) = μ²(d)∏|Ω_p|/(p − |Ω_p|)`
(lines 2352–2362); §1.6 qualitative Brun–Titchmarsh ("unspecified absolute constant", 1463–1480); §5.2 linear sieve
(3334); §1.1 owns the qualitative diagonal-sum asymptotics with `O`-constants (992–1077), so §5.1's explicit bounds
are a kept variant differing in explicitness (the Scope paragraph could say so in one clause).
CharacterSumsOverFiniteFields #1712: §4.7 `weil_mulChar_sum_bound` with the hypotheses the README quotes (1391–1394);
§7.1 Gauss sums with the quartic-character check (1876–1900). AnalyticNumberTheoryPartI #1126: §0.5 with
`RosserSchoenfeldFiniteRangeInput` and `x ≥ 59` (253–257), §0.8 `x ≥ 319` (292–296), §0.19 `x ≥ 286` (564–568), §0.20
(574–578), §0.34 (805), §1.5a (979). ProbabilisticAndMetricNumberTheory #1421: §2.5 van der Corput's difference
theorem (2750), §2.7 Erdős–Turán (3087–3102). Consumers: ExplicitZetaBounds, ExplicitPrimeCounting,
ExplicitMultiplicativeFunctions, ExplicitNumberFields exist on the board as targets (no design yet) and name this
roadmap as their supplier for exactly what the README says it supplies, except as noted in R01 and R02.
`ExplicitMultiplicativeFunctions/target.md` lines 354–363 expects this roadmap to consume its `μ²/φ` averages; the
design owns them at §5.1 and is earlier in the order, so that target's design will cite §5.1 (a note for that job).

**Ownership against open pull requests** (sweep by name over main and the 472 open heads): Pólya–Vinogradov appears
only as a consumed tool in AnalyticNumberTheoryPartI (line 280) and ArithmeticStatisticsPartV (584, 1750), and as
excluded in CharacterSumsOverFiniteFields (254); Burgess, Brun–Titchmarsh, Pomerance, Treviño, Büthe, "integer
points near" have no owner elsewhere; van der Corput only in ProbabilisticAndMetricNumberTheory (R03).
CircleMethodThreePrimes #1803 says it owns `e(α)` and the distance to the nearest integer; this roadmap consumes
Mathlib's `Real.fourierChar` and `UnitAddCircle.norm_eq` for both and claims no ownership, so there is no conflict
here. ExponentialSumsAndCircleMethodPartII (board design) owns only geometric Weyl differencing. Overlaps file:
no pull request changes this roadmap; no cited id is dropped or revision-only.

**Adversarial pass** (values computed on each side; rows for the sampled targets, the headline results and the
targets the findings touch):

| statement | instances tried | values | result | change |
|---|---|---|---|---|
| 0.1 `S_f[a,b]` | `f ≡ 0` on `[0,2]`, `[0.2,0.8]`; `f = x/2` on `[0,3]`, `[0,2]` | 3; 0; `1−1+1−1 = 0`; 1 | as stated | — |
| 0.1 trivial bound | `[0.5, 2.5]` | `⌊2.5⌋ − ⌈0.5⌉ + 1 = 2 ≤ 3` | ok | — |
| 0.2 `R` | `x/3`, `a=0`, `N=6`, `δ=0.1`; `a=N=1`, `δ=1/3` | 3 (n = 0,3,6); 0 (`‖1/3‖ = 1/3` not `< 1/3`) | ok | — |
| 0.3 inequality | `b=(1,1),H=2`; `(1,−1),H=2`; `(1),H=3`; `N=1`; `H=1` | `16 ≤ 18`; `0 ≤ 6`; `9 ≤ 9`; equality; Cauchy–Schwarz | ok; derivation (pad, average, expand) checked | — |
| 0.3 Re-corollary | sign of `Re Σ(H−h)C(h)` negative | factor `N+H−1 ≤ 2Y` reverses | not a corollary | R09 |
| 0.4 `M_χ` | quadratic mod 3, mod 5; `χ₄`; principal mod 3 | 1; 2; 1; max over `0≤M<3, N≤3` is 2 but `S(0,6) = 4` | ok, nonprincipality needed | — |
| 0.5 symmetry | quadratic mod 5 initial sums; `χ₄`; principal mod 5 | `1,0,−1,0`, `M = 2 = 2·1`; `M = 1 < 2`; `φ(5) − S(N)` | ok | — |
| 0.6 reduction | principal mod 6; `χ₄` lifted to 12 | `6−3−2+1 = 2`; `2 − χ₄(3)·1 = 2` (0 without `χ*(d)`) | ok | — |
| 1.1 Kusmin–Landau | `x/2` on `[0,2]`; `x/3` on `[0,1]`; `a = b` | `1 = cot(π/4)`; `1 ≤ √3`; `1 ≤ cot(πθ/2)` | ok, sharp | — |
| 1.2 asymmetric | `U=V=1/θ`; `U=1` | `2/(πθ)`; unbounded `f ≡ (ℓ+1)x` | ok | — |
| 1.3 second derivative | `A` root; `x²/200` on `[0,10]`; `λ=1/W, Λ=1/V, b−a=L−1` | `A = 2.79368`; `50.49`; equals Patel (25) exactly | ok; Check 1 excess wrong | R04 |
| 1.4 third derivative | `W₃=λ₃=η₃=1` | `α₃ = 6.7022`, `β₃ = 16.036`; Hiary `7.27` | ok; `18/10` vs `18/20` read off (33), (35) | — |
| 1.5 fourth/fifth | lag-sum coefficients; `min_η α̃₃`; `α̃₄` lower bound | `72/91, 72/55, 9/5, 392/435, 392/351, 49/39 (= 98/78), 392/275`; `6.38 ≥ 4.83`; `1.739 > 1` | ok | — |
| 1.6 iterated vdC | `H=1, T=6`; `B = 4.5`; `(B²−4)(B−4)` | `28 ≤ max(23.31, 28.97)`; `28 > 27`; `= 16.000` | ok, `B` least | — |
| 2.1 Fejér reduction | constant; Jordan; `x/2`, `N=4`, `δ=0.1`, `H=2` | `(sin(π/4)/(π/4))² = 0.8106`; `2/(2/π)² = 4.93`; `R = 3`, `S_f = 1`, `S_{2f} = 5`, `3 ≤ 16` | ok | — |
| 2.2 first derivative | `x/10`, `N=20`, `δ=0.05`; algebra of the route | `R = 3 ≤ 10`; product bound `≤` stated bound since `4δ²/λ₁ ≤ 2c₁Nδ`, `2δ ≤ c₁λ₁N` | ok | — |
| 2.3 reduction | `x/2`, `N=4`, `A=2`, `δ=0.1`; `h = A = N` | `3 ≤ 2+0+3+1`; `N − h = 0` outside 0.2 | ok; domain slip | R11 |
| 3.1 Gauss expansion | quadratic mod 3 | `τ = i√3`, `(i√3)⁻¹(e(1/3) − e(2/3)) = 1 = χ(1)` | ok | — |
| 3.2 classical PV | `q=3`, `q=5`; `√p log p` at `p = 3, 2` | `Σcsc = 2.309, 5.506`; `4/3`, `2.462`; `0.911 ≤ 1.099`; `0.726 > 0.693` | ok | — |
| 3.3 Pomerance lemmas | `C₃(π)`; `n=1, x=π/2`; alt. route `n=2` | `−5/6 > −1.36`; `1 < 2.72`; endpoint `−2/3 < −0.640` | ok; route wording | R12 |
| 3.4 Pomerance PV | `q=3` odd; `q=5` even | `2.087 ≥ 1`; `4.515 ≥ 2` | ok | — |
| 3.5 Lapkova/FS | `q=980/979` even; `q=33/32` odd; `L ≤ q` threshold | `31.3044 ≤ 31.3050`, `31.2893 > 31.2890`; `5.7413 ≤ 5.7446`, `5.669 > 5.657`; even `q ≥ 19`, odd `q ≥ 24` | rounded forms ok; "exactly when" false | R05 |
| 3.6 FS nonprincipal | `q = 1000`; `q = 10⁴` even primitive; crude route | `123.5 < 200`; `283 < 442`; `0.331 > 0.2251` | ok | — |
| 4.1 moment bound | `r=1`: `p=7,B=2`; `11,3`; `13,5`; degenerate `r=2,H=2`; `B=1.5, r=13` | `10 = 10`; `24 = 24`; `40 = 40`; `8 ≤ 12`; `9⌊B⌋ < r ≤ 9B` | identity ok; hypothesis gap | R06 |
| 4.2 energy | `A=28, N=400, p=10⁷` | `88,447` (README `88,437`); trivial `313,600` | slip | R08 |
| 4.3 amplification | `A=B=1`, `N<p`; shift at `h=N`; Hölder exponents | `|S| ≤ √(N(p−1)) + 2E(1)`; tautology; `1/p + 1/(2r) + 1/(2r) = 1` with `p = r/(r−1)` | ok | — |
| 4.4 McGown | `C₀(r)` for `r = 2..15`; (A.1) at `r = 2`; `r = 15` | all `C₀(r) < C(r)`, tightest `r = 8`: `2.27209925 < 2.2721`; `1093 ≥ 1056`; `1.66·10⁵ ≥ 7920` | ok; `10.0364` slip | R08 |
| 4.5 Treviño | `r=2`, `p=10⁷` | `225.7√N`, crossover `5.1·10⁴ = c₁² p^{3/8} log p` | ok | — |
| 5.1 diagonal sums | `S(6), S(10), S(5.99), S(4.99), S(2.99)`; `S₆(7)`; constant | `3.25 ≥ 2.862`; `3.667 ≥ 3.373`; `2.75 < 2.860`; `2.5 ≥ 2.497`; `2 < 2.165`; `1.4167 ≥ 1.139`; `γ + Σ = 1.3326` | ok (the `0.89` bound also holds on `[2,3)`) | — |
| 5.2 Greaves | `κ ≡ 1, z=3, s=2`; `s = 2B`; `B = 0` | `B = 0.3155`, exponent `0.469`, `0.374`, `0.748 ≤ 2`; `0`; undefined | ok; Rankin route checked line by line | — |
| 5.3 weighted sieves | `f ≡ 1`; `k = z = 1`; step function | progression count `≤ 1`; remainder lemma at `d = 1`; `|6ε − 4| ≤ 1` false | ok; native `BoundingSieve` data `X = ‖f‖₁/k`, `ν = 1/d` fits | — |
| 5.4 Büthe BT | `f ≡ 1`; `I = [0,10]`; tent | `ρ = y`; `4 < 8.69`; `ρ = y/6` | ok | — |
| 5.5 MV and RV | `k=1,y=10`; `k=3,y=30`; `M=121,q=1`; `A=1,B=7` | `4 ≤ 8.69`; `3 ≤ 13.03`; `3.434 ≤ 3.5 ≤ 4.5`; `4.83 ≤ 7.19` with three powers of 2 | ok; `(7/2)` derivation from Lemma 14 checked | — |
| 5.6 Fan | `x=9,z=3`; `x=32,z=4`; `x=z=1.5`; threshold | `Φ = 3 < 4.46`; `11 < 15.4`; `1 < 3.70`; `(2·10⁶)^{2/5} = 330 ≥ 319` | ok | — |
| 6.1 small moduli | `q = 3, 5, 4` | `1 ≤ 2.75`; `2 ≤ 4.51`; `1 ≤ 3.11` | ok | — |
| 6.2 diagonal range | `z = 6`; just below 6 | margin `0.388`; `2.75 < 2.860` | ok | — |
| 6.3 Büthe small | `Y=100,z=7`; `Y=1.5,z=1`; `Y=20`, `z=7,1,2` | `42.86 < 43.43`; `2.5 < 7.40`; `24.57, 21 > 13.35 > 13` | ok | — |
| 6.4 Büthe medium | `Y = 20000` | `4039.0`; `z = 1` gives `20001` | ok | — |
| 6.6 McGown certificate | all rows | see 4.4 | ok | R08 |
| 6.7/6.8 Treviño certificates | `r=2, p=10⁷`: `A` | `40.27 ≥ 29`; quantifier over all `p ≥ p₀` | unbounded range | R07 |

Conventions pinned by a computed witness: `e(1/2) = −1` (0.1 Check 2), `‖−0.2‖ = 0.2` (0.2), `τ(χ⁻¹)` versus
`τ(χ)` by the quartic character modulo 5 (3.1, via CharacterSumsOverFiniteFields §7.1), `(2r − 1)!!` versus
`(2r)!/r!` (4.1), the strict cutoff of Selberg's weights (5.3), `Λ(m)/log m ≤ 1` and `A ≥ B` (5.5).

**Shape.** Summary, Scope and ownership, Conventions, Exact supplier contracts (Mathlib, Tau Ceti, three roadmaps),
How to read the build, Layers 0–6 each with `### Examples` and `### Dependencies`, Downstream consumers, References:
present. Every definition (0.1, 0.2, 0.4 both, 5.4's `ρ_I`, the eight Layer 6 Props) has an API list and at least
three discriminating Checks; every theorem states its hypotheses and a locator. The plan has 66 targets and 125
tests, matching the README section by section; its supplier list names SieveMethodsAndPrimePatterns §§1.3, 2.9,
CharacterSumsOverFiniteFields §4.7 and AnalyticNumberTheoryPartI §§0.5, 0.19, 0.20 (the README's contract also lists
§0.8, from which §0.20 is derived; harmless). Backticked own names in the README are the eight Layer 6 Prop names;
at the package stage each must be declared in `Suggested.lean` (they are the definitions the Burgess, Lapkova,
Büthe and Fan headlines need) or un-backticked. Headline theorems for the package stage, all statable at the pins
(`DirichletCharacter ℂ q`, `Real.fourierChar`, `UnitAddCircle`, `Nat.primeCounting`, `vonMangoldt`, `Nat.totient`
exist): 1.1, 1.3, 1.4–1.6, 2.2–2.3, 3.2, 3.4–3.6, 4.1, 4.4–4.5 (under the Layer 6 Props), 5.2, 5.4–5.6.

## Not verifiable

- `bordelles2012` (Theorems 5.6, 5.8; uncertified): zhao2024 cites the same results as Bordellès's Theorems 5.3,
  5.4 and Lemma 5.7 (lines 209, 283, 323), the TME-EMT page as Theorem 5.6; the numbering could not be settled.
- `montgomeryvaughan1973` (Theorem 2's proof, Lemma 7, Lemma 10, display (3.3)) and `vanlintrichert1965` (waived):
  the sifted form of 5.5 and the choice of `z` in 5.4 are taken from ramareviswanadham2021 lines 660–666 and
  buthe2014 lines 340–348.
- `greaves2001` Theorem 1 p. 52, `trevino2015kth` Theorem 1.2, `filaseta1990` Lemma 3, `frolenkovsoundararajan2013`
  Theorems 1–2 and Corollary 1, `montgomeryvaughan2007` §9.4: uncertified; the statements were checked against the
  TME-EMT pages, trevino2015, lapkova2018 and hunter2016 where those quote them.
- lapkova2018 is cached as journal XML; the statement of Lemma 3A and the displays `1 ≤ L ≤ q`, the two formulas for
  `L` and the split `q > 25`/`q ≤ 25` were read; the rest of the proof was not followed.
- zhao2024 is an OCR of a dissertation with garbled formulas; Theorems 2.5, 2.7 and Lemma 2.6 were checked by their
  readable parts and against the TME-EMT page.

## Source issues

- **Misprint** in patel2022 at Lemma 3.1, statement (arXiv v1 p. 7, line 196): the constant `β₄` is printed with the
  factor `18/20`; the proof's displays (33) and (35) produce `18/10 = 9/5`; it should be `(9/5)√(β̃₃η₃)η₄^{−1/3}`;
  affects a stated result.
- **Misprint** in patel2022 at Lemma 2.5 (p. 6, line 160): the hypothesis asks for four continuous derivatives; the
  proof uses the third derivative only (through the mean value theorem for `f″`), as Hiary's Lemma 1.2 assumes;
  it should be three; affects a stated result (a needlessly strong hypothesis).
- **Error** in pomerance2011 at §2, the Fourier series of `Φ` (p. 6, line 228): the series of the step function is
  said to converge uniformly on `[0, 2π)`; a discontinuous function's series cannot; it should be pointwise
  convergence, to the midpoint values at the jumps; affects nothing (only the values at `2πa/q` are used).
- **Gap** in ariasdereyna2024 at Lemma 6, display (4) (p. 5, lines 227 and 285–299): the real-part term is bounded
  by multiplying the factor `Y + H` by `2Y`, which needs the real part nonnegative; it should carry `(Y + H)` or the
  absolute value, as the proof of Theorem 7 does at line 408; affects the proof.
- **Gap** in trevino2015 at the proof of Theorem 1, Tables 4–5 (arXiv v2 pp. 14–15, lines 1008–1012), and of
  Theorem 2, Tables 6–7 (pp. 18–19): the closing constants (46), (47), (58), (59) are evaluated at `p = p₀` as the
  worst case; the monotonicity in `p` for `p ≥ p₀` is not stated; it should be shown (the bracket in (46) is
  decreasing in `log p` for `log p ≥ 16` and every `k ≥ 1/30`, and `A`, `B` increase with `p`); affects the proof.
- **Misprint** in tmeemt-art05 at §3 (Hiary's third derivative test): the constant `β` is printed with `65/15`; the
  source (hiary2016zeta Lemma 1.2) has `64/15`; affects a stated result.
- **Misprint** in tmeemt-art15 at §2 (Treviño's `c₂` table): the page prints a column headed `p₀ = 10⁷` that
  trevino2015 Table 3 does not contain, and its other columns differ from the paper (`3.5341` for the paper's
  `3.5751` at `r = 2`, `p₀ = 10²⁰`); it should be the paper's Table 3 with `p₀ ∈ {10¹⁰, 10¹⁵, 10²⁰}`; affects a
  stated result.
- **Misprint** in hunter2016 at Theorem 1.3 (p. 16, lines 680–684): Frolenkov–Soundararajan's Theorem 2 is quoted
  for initial sums `Σ_{n ≤ x}` only; the source bounds the maximum over all intervals (as tmeemt-art15 lines
  114–118 state); it should be the maximal form; affects nothing (the quoted form is weaker).

<!-- tauceti-roadmap-review {"agent": "claude", "head": "b9a127681ce11bb947f07152d477054deec1c8ad", "job": "REV-DESIGN-ExplicitCharacterSumsAndSieves", "model": "fable", "worker": "chris-x10"} -->
