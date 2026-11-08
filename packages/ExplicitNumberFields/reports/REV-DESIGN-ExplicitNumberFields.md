<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/7290#issuecomment-6690535235 -->
Review (claude) of 9793b22

Verdict: needs_changes

1. **F01** (P1) Theorem 11 of 5.6 is false at ℚ(√−3)

   - **Location.** `packages/ExplicitNumberFields/design/README.md` lines 1337–1338: "`relativeClassNumber_ge_cmPositivity` (lines 475–479, Theorem 11): for `K` CM of degree `2n ≥ 2` with `CMPositivity K`, `(12)` with `c = 2`, and if `k` is abelian, `(13)` with `c = 2`".
   - **Claim.** (12) and (13) hold for every CM field with `CMPositivity`, with no root-discriminant hypothesis.
   - **Witness.** `K = ℚ(√−3)`: `CMPositivity` holds (README line 520), `n = 1`, `Q = 1`, `w = 6`, `d = 3`. Then (12) gives `h⁻ ≥ 2·6·√3/(2π e log 3) = 20.785/18.763 = 1.108`, but `h⁻ = 1`. (13), with `B_ℚ = 1`, gives the same 1.108.
   - **Cause.** The route takes `κ_K` from 3.4(1)/(2) with `S = ∅`. Those need `ρ_K ≥ louboutinRho n` and `ρ_K ≥ louboutinRhoEmpty n` (2600 at `2n = 2`). Theorem 9 carries `ρ_K ≥ 50`; Theorem 11 drops it (a source error, see Source issues).
   - **Repair.** Add the hypothesis `ρ_K ≥ max(louboutinRho n, louboutinRhoEmpty n)` (3.4's tables, index `min(n, 6)`) to `relativeClassNumber_ge_cmPositivity`, and add `ℚ(√−3)` as a negative-control Check. Tested: `ρ = √3 < 2600` excludes the witness; for `2n ≥ 4` the hypothesis is at most 50, the threshold Theorem 9 already uses.

2. **F02** (P1) `pPowerResidues_le` (6.5) is false without `X < p`

   - **Location.** README lines 1543–1546: "for an odd prime `p`, `0 < ε < 1`, `z ≥ 2^{1/ε}` and `X ≥ 1`, the number of integers `m ≤ X` coprime to `P_z` … that are `p`-th powers modulo `p²` is at most `√p X^ε`".
   - **Claim.** The bound holds for every `X ≥ 1`.
   - **Witness.** `p = 3`, `ε = 1/2`, `z = 4`, `P_z = 6`, `X = 1000`. There are 111 integers `m ≤ 1000` coprime to 6 with `m² ≡ 1 (mod 9)`, against `√3·1000^{1/2} = 54.8`. The proof needs `T ⊆ [1, p)` (`kerrmcgowntrudgian2020` line 139, Lemma 6).
   - **Repair.** Add `X < p` to `pPowerResidues_le`; the application uses `X = p^{0.99} < p` (line 1559). Tested: for `X < 3` the count is at most 1, which is at most `√3 X^{1/2}`.

3. **F03** (P1) `louboutinS0` is not "the unique root in `[0, √2]`"

   - **Location.** README lines 1112 and 1118–1120: "`louboutinS0` as the unique root in `[0, √2]` …", "`4√2 + 8 − 4 − 4√2 + 2 = 6 > 0` at `√2` … it has exactly one sign change in the interval".
   - **Claim.** `P(S) = S⁴ + 2S³ − 2S² − 4S + 2` has exactly one root in `[0, √2]`.
   - **Witness.** `P(√2) = 4 + 4√2 − 4 − 4√2 + 2 = 2`, not 6. `P(1) = −1` and `P(0) = 2`, so there are two roots, `0.454334` and `1.221332`. The source has the same misprint (`louboutin2017` line 34).
   - **Repair.** Define `louboutinS0` as the unique root of `P` in `[0, 1]`. Replace the Check by: `P(0) = 2`, `P(1) = −1`, `P` decreases then increases on `[0, 1]` and stays negative after its root, and `P(√2) = 2`. Tested: there is exactly one sign change on `[0, 1]`, at 0.454334.

4. **F04** (P2) 4.3 Corollary 4 claims more than its route proves

   - **Location.** README lines 1087–1093: "`ζ_K` has no real zero in `σ ≥ 1 − c₂/log d_K` … Route: … the functional equation makes the order of every real zero in `(0, 1)` even, … hence one double zero, which … the sign of `ζ_K` near `1` … excludes elsewhere".
   - **Claim.** An odd-degree Galois field has no real zero in `[1 − c₂/log d_K, 1)`.
   - **Witness.** For a cyclic cubic `K`, `ζ_K = ζ·L(s, χ)·L(s, χ̄)`. A real zero `β` of `L(s, χ)` is a double zero of `ζ_K`. Theorem 3 at `m = 2` allows it (two zeros counted with multiplicity), and a double zero does not change sign. The functional equation constrains parity only at `s = 1/2`. The source proof (`louboutin2015ijnt` lines 56–59) excludes only zeros of odd multiplicity.
   - **Repair.** Restate it as: `ζ_K` has no real zero of odd multiplicity in `[1 − c₂/log d_K, 1)`, hence `ζ_K(σ) ≤ 0` on that interval. Route: odd degree gives no quadratic subfield, so no simple real zero (AnalyticNumberTheoryPartI §2.31e); a zero of odd order at least 3 contradicts Theorem 3 at `m = 2`. Delete the functional-equation sentence. Tested: the cyclic cubic double-zero scenario satisfies the restated claim.

5. **F05** (P2) 2.4: Debaene's error term has a negative base when `R_K h_K < 1/e`

   - **Location.** README lines 739 and 742: "`n^{10n²} (R_K h_K)^{1/n} (1 + log(R_K h_K))^{(n−1)²/n} x^{1−1/n}`" and "`… (1 + log R_K)^{(n−1)²/n} …`".
   - **Claim.** The bound holds for every field.
   - **Witness.** Take the cubic field of discriminant −23 (`α³ = α + 1`, fundamental unit `α`). Then `R_K = log 1.324718 = 0.281200`, `h = 1`, and `1 + log R h = −0.2687`. Mathlib's `Real.rpow` gives `(−0.2687)^{4/3} = −0.087`, so the right-hand side is negative and the inequality is false. The proof step at `debaene2019` lines 941–943 (`log y ≤ 2r log(2rn)(1 + log Reg)`) needs `Reg ≥ 1`.
   - **Repair.** Write `(1 + log⁺(R_K h_K))` and `(1 + log⁺ R_K)`, with `log⁺ = max(0, log)`. This is what the proof yields from `y ≤ (2rn)^{2r} Reg`. Add the cubic field as a Check. Tested: the base becomes 1 at the witness.

6. **F06** (P2) 3.3: the constant 43.2 does not give 0.0014480, and one clause carries an unneeded hypothesis

   - **Location.** README lines 864–868: "for `n ≥ 3` and `c₈ > 0` with `QuadraticRealZeroGap c₈`, `κ_K > (1/43.2) min(…)`, and when `K` has no quadratic subfield, `κ_K > 1/(43.2 · starkAlpha K · log d_K)`. Consequently, … with no quadratic subfield, `κ_K > 0.0014480/(starkG K · log d_K)`".
   - **Claim.** The 0.0014480 bound follows from the 43.2 display.
   - **Witness.** For a normal-tower, non-Galois field (`starkAlpha = 16`, `starkG = 1`), `1/(43.2·16) = 0.0014468 < 0.0014480`. The source gets 0.001448029 from `c₄ = 43.162115` (`garcialee2022mertens` lines 1271–1277, 1299). The no-quadratic-subfield bound needs no `c₈` (line 1254).
   - **Repair.** State `c₄ = 2 exp(21/8 − ψ(1/2)/(4 log 3)) ≈ 43.1622` and use it in both displays. Move the no-quadratic-subfield clause out from under `QuadraticRealZeroGap`. Tested: `1/(43.1622·16) = 0.00144803 > 0.0014480`.

7. **F07** (P2) `gap:rademacher-general-convexity`: the contract is false as written

   - **Location.** README lines 271–275: "for a record `d` … with Dirichlet agreement, continuation, functional equation and a nonnegative coefficient majorant, … `‖continuedL d s‖ ≤ P(s) (N (|1+s|/(2π))^m)^{(1+η−σ)/2} ζ(1+η)^m`". `plan.json` `needs`: "the general explicit convexity bound with the pole factor".
   - **Claim.** Any nonnegative majorant suffices.
   - **Witness.** The record of `10·ζ` (coefficients 10, degree 1, conductor 1, root number 1, pole at 1) satisfies every listed hypothesis. At `s = 1/2`, `η = 1/2`, `|10 ζ(1/2)| = 14.60`, but the bound is `9·(1.5/2π)^{1/2}·ζ(3/2) = 11.49`.
   - **Repair.** Require `|a(n)| ≤ τ_m(n)` (the majorant `ζ^m`, as 1.1 uses through 0.3) and gamma shifts in `{0, 1}` (Rademacher's setting). Put both in the `needs` sentence. Tested: `10ζ` is excluded (`10 > τ₁ = 1`), and `dedekindZetaData K` qualifies by 0.3.

8. **F08** (P2) `gap:explicit-mertens-second` states the wrong theorem for 3.5

   - **Location.** README lines 320–321: "`Σ_{p ≤ x} 1/p ≤ log log x + 0.2615 + 1/log² x` for `x > 1` and the matching lower bound". 3.5 (line 963) uses it in the route.
   - **Claim.** This unconditional bound is the input to Duke's theorem with the constant 13.53.
   - **Witness.** The proof uses Lemma 3 under RH: `|Σ_{p≤x} 1/p − log log x − M| < m(x)` for `x ≥ 1.048` (`garcialee2022artin` lines 121–131), applied at `x²` and `y` (lines 690–718). At `x = 1.048`, the gap's error `1/log² x ≈ 455` against `m(x) ≈ 4.7`. "The matching lower bound" is never stated.
   - **Repair.** Ask ExplicitPrimeCounting (which lists Schoenfeld's RH results in its target) for the two-sided bound under `RiemannHypothesis` with error `m(x)`, `x ≥ 13.5` (Schoenfeld 1976, Corollary 2), and carry the range `1.048 ≤ x < 13.5` as a computation `Prop`. Or state Lemma 3 here as a target. 3.6 needs only the upper bound.

9. **F09** (P2) `gap:ramare-perron` has no statement

   - **Location.** README line 283: "`gap:ramare-perron` (target 11): Ramaré's truncated Perron formula with the smoothed error." `plan.json` `needs`: "Perron's formula with an explicit smoothed error term".
   - **Claim.** This is a precise contract.
   - **Witness.** Neither the contract nor `needs` gives the hypotheses (absolute convergence abscissa, `κ`, `x`, `T`) or the error term. ExplicitZetaBounds' catalogue states them (its target 11).
   - **Repair.** Write the statement into the contract and the `needs` sentence, as the README already does for `gap:ramare-L1-bounds`: for `F(z) = Σ a_n n^{−z}` absolutely convergent on `Re z > κ_a`, `κ > κ_a`, `x, T ≥ 1`, the partial sum equals the truncated integral up to the smoothed `O*`-term. Add the `k`-fold smoothed form that 2.2–2.3 use.

10. **F10** (P2) the consumers list names suppliers and earlier roadmaps

   - **Location.** `plan.json` `consumers` (AnalyticNumberTheoryPartI, ClassicalArithmeticCompletion, CyclotomicClassGroupsAndStickelberger, EffectiveClassNumbers, ArithmeticStatistics), and README lines 1588–1598.
   - **Claim.** These roadmaps consume this one.
   - **Witness.** The gate places this roadmap after ComputationalNumberTheory (ORDER 185). AnalyticNumberTheoryPartI (84), CyclotomicClassGroupsAndStickelberger (30), ClassicalArithmeticCompletion (main) and ComputationalNumberTheory (185, README line 1595) are this roadmap's own suppliers. ArithmeticStatistics is ORDER 136. That is upward supply, and a cycle with the suppliers.
   - **Repair.** Keep EffectiveClassNumbers (238). Name the other consumers as later roadmaps or Part IIs ("AnalyticNumberTheory, Part II", "ArithmeticStatistics, Part II"), or delete them.

11. **F11** (P3) Layer 0 Checks with wrong values

   - **Location.** Lines 596, 398, 922, 423, 429, 351.
   - **Witness and repair.**
     - `ĝ(409) = 21` is impossible because 21 is composite; the correct value is `ĝ(409) = 29`.
     - `Λ_{2} = (1 + 2^{−1/2})⁴ = 8.4926`, not 8.485. Then `270·Λ = 2293`, matching line 896's `2π²Λ = 167.63`.
     - In `ℤ[i]` the ideal of norm 4 is `(1+i)² = (2)`; `(2)² = (4)` has norm 16.
     - The count `#idealsLE = 5` would be sharper than 8, not weaker.
     - The induction ratio at line 351 should be `(4/π)^{1/2}(n/(n+1))ⁿ ≤ 0.565`.

12. **F12** (P3) Layer 2, 3 and 5 Checks with wrong values

   - **Location.** Lines 697–699, 751–752, 792, 778–780, 850, 1004, 885, 1248–1250.
   - **Witness and repair.**
     - `#idealsLE ℚ(i) 10 = Σ_{m≤10} r₂(m)/4 = 36/4 = 9`, not 13. The actual error at `x = 10` is `|9 − 7.854| = 1.146` (2.2 and 2.4 Checks, Layer 2 Examples).
     - 2.5 at `ℚ`: `F = 2^{r₁}φ(𝔮)h/h_{𝔮} = 2` (`gunramaresivaraman2023` line 81), not 1. The bound is `1039.7·2·log 6 + 4 ≈ 3730`.
     - The cubic field of discriminant −23 has `κ = 2·2π·0.281200/(2√23) = 0.3684`, not 0.4256.
     - `ℚ(ζ₇)⁺` has `R = 0.525455` and `κ = 8R/14 = 0.3003`, not 0.6749.
     - 5.2 at `ℚ(ζ₅)` uses `0.708`, but the constant is `(5 − 2 log 6)/4 = 0.354`. The bound is `5·0.4053·0.7565³·11.18 = 9.81`.

13. **F13** (P3) Layer 6 Checks with wrong values

   - **Location.** Lines 1416–1417, 1439–1446, 1489–1490, 1526–1528.
   - **Witness and repair.**
     - 6.1, the non-cyclic group of order 4: `φ(4)/4 = 1/2` and the value at `0` is `(1/2)(1 − 3) = −1`, not "(1/4)(…) = 1".
     - 6.2: `(t, q) = (0, 2)` violates `gcd(t, q) = 1`. The coprime pairs give four disjoint intervals with 8 integers, and `B(2)(6/π²)·8 = 15.40`. Delete the "overlap" sentence.
     - 6.3: `Σ_{3≤q≤23} 1/q = 0.99896 < 1`, so `δ > 0`. The witness needs the primes 3 to 29 (sum 1.0334).
     - 6.4: `10⁹ + 6 = 2·500000003`, so `ω = 2` and Theorem 2 gives `ĝ ≤ 9895 < √p − 2`. Pick a prime with larger `ω(p − 1)`.

14. **F14** (P3) 0.2's API bullets need `p` prime

   - **Location.** Lines 376–378 and 386–387: "Define `localFactor K p`, for a natural number `p`, … over the finite set of prime ideals … containing `p` …"; "in general `localFactor K p ≤ (p/(p−1))ⁿ`".
   - **Witness.** `localFactor ℚ 6 = 2·(3/2) = 3 > 6/5`. At `p = 1`, `p/(p−1)` is `1/0 = 0` in Lean while `localFactor = 1`. At `p = 0` the set of primes containing `p` is infinite.
   - **Repair.** Define `localFactor` for primes `p` (or as a `finprod`, saying so), and add "for a prime `p`" to the bound. Rewrite the garbled parenthetical at line 377.

15. **F15** (P3) 3.6's route omits the input its lower bound needs

   - **Location.** Lines 986–987: "with `|a(p)| ≤ n − 1`, the explicit Mertens bound …".
   - **Witness.** With only `|a(p)| ≥ −(n−1)`, the lower bound comes out as `(log log d_K)^{−(n−1)}`. The stated `1/(e^{…} log log d_K)` uses `a(p) = a_K(p) − 1 ≥ −1` (`garcialee2022artin` line 886, (29)).
   - **Repair.** Cite `−1 ≤ a(p) ≤ n − 1` with that locator.

16. **F16** (P3) 4.1 rests on a proof with a reported error

   - **Location.** Lines 1016–1024 and 1030–1037.
   - **Witness.** `hasanalizadeshenwong2022` lines 40–49 report that Trudgian's parameter ranges were not verified. HSW's Table 1 row `(0.296, 3.971, 3.969)` for `T ≥ 1` (line 76) implies 4.1's bound. The second Check narrates its own correction ("This arithmetic is inconsistent, so one of the two inputs is wrong").
   - **Repair.** Cite HSW Table 1 beside Trudgian Theorem 2 and make the route HSW's parameter tracking. Rewrite the Check as `N_{ℚ(i)}(100) ≈ 58 + 100 = 158`, main term 156.65, bound 19.51.

17. **F17** (P3) process residue in the README

   - **Location.** Line 21 ("since no legal text of either is readable"), lines 715–716 ("the text layer garbles … read from the arXiv rendering"), lines 832–833 ("whose display the text layer omits; … derived here"), line 1033, line 1571 ("cannot be read from a legal text"), and line 1181 ("the target is the text read").
   - **Repair.** Remove these phrases.
     - Cite 2.3 as `lee2023ideals` Theorem 1.2, p. 2.
     - Cite 3.2 as `louboutin2005` Theorem 10 (13), p. 569. That display equals the README's form, since `log ρ + (log 4)E(log 4/log ρ) = log ρ · e^{log 4/log ρ}`.
     - Give the reason for leaving Chen and Louboutin 2015 to a Part II without process words.

18. **F18** (P3) locator slips

   - **Witness and repair.**
     - 5.1 (line 1206): "`louboutin2005` Theorem 1 as recalled" is wrong. Its Theorem 1 (line 59) is the `S`-version; lines 38–39 recall `louboutin2001` Theorem 1, p. 560.
     - 5.5 (line 1306): `louboutin2003` line 603 cites "[Lou7, Corollary 3]" for the `h⁻` bound. Cite Corollary 3 here and in the manifest.
     - 5.6 (line 1329): `B_k` is defined at line 310, (9), not line 330.
     - In `plan.json` 0.6, `mcgowntrudgian2020` lines 79–81 is Grosswald's conjecture, not the definition of `g(p)`.
     - 3.3 (line 869): "Stark's argument as made explicit in AnalyticNumberTheoryPartI §2.31e" is wrong, because §2.31e allows ineffective constants. Cite it for the quadratic-subfield theorem only.

19. **F19** (P3) names that do not exist at the pin

   - **Witness and repair.**
     - `Nat.setOf_prime_and_eq_mod_infinite` (line 604) does not exist. Use `Nat.infinite_setOfPred_prime_and_eq_mod` or `Nat.forall_exists_prime_gt_and_eq_mod` (Mathlib `NumberTheory/LSeries/PrimesInAP.lean:431,443`).
     - Lines 67 and 179 attribute `MeasureTheory.successiveMin L K i` to `TauCeti/Algebra/Module/ZLattice/SuccessiveMinima.lean`. That file defines `ZLattice.successiveMin` (line 111), which Minkowski's second theorem `ZLattice.prod_successiveMin_mul_measure_le_two_pow_mul_covolume` uses (`MinkowskiSecond.lean:610`). `MeasureTheory.successiveMin` lives in `TauCeti/MeasureTheory/Group/GeometryOfNumbers/SuccessiveMinima.lean:83` and is `ℝ≥0`-valued.
     - In `plan.json` 2.1, `TauCeti.prod_successiveMin_…` should be `ZLattice.…`.

20. **F20** (P3) the ClassFieldTheory layer is misattributed

   - **Location.** Lines 235–236 and 325, and the gap `section` "Layer 12".
   - **Witness.** The global Artin map, "compatibility in towers" and `globalArtinMap_ideal` are in ClassFieldTheory Layer 11 (its README lines 1683–1718). The abstract `artinMap_groundNorm` is in Layer 4. Layer 12 is existence and the norm index.
   - **Repair.** Cite Layer 11 (and Layer 4's `artinMap_groundNorm`), and set the `gap:artin-norm-compatibility` section to Layer 11.

21. **F21** (P3) gap hygiene

   - **Witness and repair.**
     - `gap:bigostar-predicate` appears on no target's *Needs:* line, and the Conventions say headlines write the inequality itself. Drop it, or add it to the *Needs:* lines that use `O*` (2.4).
     - `gap:trevino-burgess-tables` serves only "the comparison table" (line 1493). Drop it. If kept, `McGown_BurgessTable` is ExplicitCharacterSumsAndSieves target 18, not 16–17.
     - The `gap:bach-grh-smoothed-sum` section "Layer 2 or Layer 8" names no single place; pick one.
     - The `gap:polya-vinogradov-lapkova` `needs` says "odd-character", but 6.5 needs every non-principal `χ` mod `p` (the contract says primitive); align the two.
     - The `gap:totient-quotient-bound` display is Rosser–Schoenfeld's, while the cited `kerrmcgowntrudgian2020` lines 124–128 print `e^γ log log n (1 + 2.51/log log n)`; cite Rosser–Schoenfeld 1962, Theorem 15.

22. **F22** (P3) build order

   - **Witness.** 3.3 needs 4.3 (line 888; `plan.json` `target:4.3`), a later layer. 6.2 needs `McGownTrudgianFiniteChecks` "of 6.3" (line 1451), and 6.3 needs 6.2, which is a cycle.
   - **Repair.** Move the Stark-type half of 3.3 after 4.3 (for example into Layer 4). Split the Prop, declaring the Möbius-sum part in 6.2 and the inequality-(9) part in 6.3.

23. **F23** (P3) manifest gaps

   - **Witness.** Washington Theorem 4.10 (line 460) and Lang Ch. XIII (line 1667) are cited with locators but have no `sources.toml` entry. `cohenoliveirasilvatrudgian2016` has `locator_scheme = "section"` with locator "Theorem 1". The `louboutin2000` locator should be Corollary 3 (R18).
   - **Repair.** Add both books (uncertified, by locator) and fix the two entries.

24. **F24** (P3) definitions short of three Checks or an API

   - **Witness.** `HasNormalTower` has two Check bullets (lines 571–574). `starkAlpha` and `starkG` (line 861) have no API and no discriminating Check. `louboutinB` and `NoImaginaryQuadraticRealZero` (lines 1329–1331) have none.
   - **Repair.** Add the missing items. Suggested Checks:
     - `HasNormalTower`: a non-Galois quartic with a quadratic subfield.
     - `starkAlpha`: `ℚ(2^{1/4})` gives 16, `ℚ(ζ₅)` gives 4, and a non-Galois cubic gives 24.
     - `louboutinB`: `k = ℚ(√5)` gives `(log 5)/2`, and `k = ℚ` gives 1.
     - `NoImaginaryQuadraticRealZero`: vacuous for `ℚ(ζ₅)`.

25. **F25** (P3) scope omits existing related results

   - **Witness.** Main has Completed/EffectiveBounds with Tau Ceti's `NumberField.classNumber_le_bound` (`h ≤ |d|·4ⁿ`, `TauCeti/NumberTheory/EffectiveBounds/ClassNumber/Basic.lean:81`) and `NumberField.card_ideal_absNorm_le` (`IdealCount/Basic.lean:399`). AnalyticNumberTheoryPartI §2.43 has Zaman's one-zero region `σ ≥ 1 − 0.0875/log(D_K n^n)`, `|t| ≤ 1`.
   - **Repair.** Cite these under Scope and say in one clause how 5.3, 2.2–2.5 and 4.5–4.6 differ.

26. **F26** (P3) generality and conventions

   - **Witness.** 5.6 Theorem 13 (line 1349) assumes `QuadraticRealZeroGap (π/6)` over all quadratic fields, but the source uses only the imaginary case (`louboutin2003` line 359, Lemma 8(5)). In 3.5 (line 959), `log L(1)` for a record with non-real `L(1)` has no stated branch; the source's logarithm is continuous on `Re s > 1/2` (`garcialee2022artin` line 136).
   - **Repair.** Add an imaginary-quadratic variant of the gap predicate for Theorem 13. Define `log L(1)` as the continuous logarithm along `(1, ∞)`, or restrict 3.5 to records with real coefficients (enough for 3.6).

Files reviewed: `packages/ExplicitNumberFields/design/README.md`, `packages/ExplicitNumberFields/design/plan.json`, `packages/ExplicitNumberFields/sources.toml`. 26 findings: 3 P1, 7 P2, 16 P3. A design has no `Suggested.lean`, so there was no elaboration, one-tactic probe or `#check @name` pass. Elaboration: not available (this lane does not elaborate).

## Adversarial table

Rows cover the sampled targets, the headline theorems and every target a finding touches. Values were computed in this review.

| Statement | Instances | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 0.1 `minkowskiConstant ≤ 1` | n=1,2 | `a₁=1`; `a₂=(4/π)(1/2)=0.637`; ratio `(4/π)^{1/2}(n/(n+1))^n ≤ 0.565` | true; ratio formula wrong | R11 |
| 0.1 Checks | ℚ(i), ℚ(√−14), ℚ(√5) | `b=1.273, 4.764, 1.118` | true | — |
| 0.2 bound `≤ (p/(p−1))ⁿ` | ℚ, p=6; p=1 | `3 > 1.2`; `1 > 0` (junk `1/0`) | false off primes | R14 |
| 0.2 `Λ_{2}` | — | `1.70711⁴ = 8.4926` vs README 8.485 | value wrong | R11 |
| 0.3 `#{𝔞: N𝔞=m} ≤ τ_n(m)` | ℤ[i], m=3,4,5 | `0≤2, 1≤3, 2≤2` | true; norm-4 ideal is `(1+i)²` | R11 |
| 0.3 class-number lemma | ℚ(√−14) | `h=4 ≤ 8`; `#idealsLE(4.764)=5` | true | R11 (wording) |
| 0.4 `h⁻ = Q w √(d_K/d_k) L(1,η)/(2π)ⁿ` | ℚ(i), ℚ(√−3), ℚ(√−5), ℚ(ζ₈) | `1, 1, 2, 8·5.657·0.8724/39.478 = 1.000` | true | — |
| 0.4 `R_K/R_{K⁺}` (Mathlib `CMField.lean:439`) | CM degree 2n | `2^{rank K}/Q_K`, `rank = n−1` | matches | — |
| 0.5 `DedekindConjecture` at `s=1` excluded | any K | `riemannZeta 1 = (γ−log 4π)/2 = −0.977 ≠ 0`, `ζ_K(1)=0` (normal form) | exclusion needed | — |
| 0.5 `F(1)=κ_K`, uniqueness | ℚ | `F = 1`, `κ_ℚ = 1` | true | — |
| 0.5 `GRHMod 2 ↔ RH` | q=2 | zeros of `1−2^{−s}` on `Re s=0`, outside `Re s>0` | true | — |
| 0.6 `g, ĝ, h` | p=2,3,7,409,2791; h at 2,3,5,7,40487 | `g(409)=21`, `ĝ(409)=29`, `ĝ(2791)=53`; `h=3,2,2,3,10` | one value wrong | R11 |
| 0.6 `h(p) ≤ g(p)+p` | p=7 | `3 ≤ 10` | true | — |
| 1.1 Rademacher, Dedekind instance | ℚ, s=1/2, η=1/2 | `9·0.4886·2.6124 = 11.49 ≥ |ζ(1/2)| = 1.460` | true | — |
| 1.1 | ℚ(i), s=1/2+10i | `3·1.0099·3.2187·6.8245 = 66.5` | consistent | — |
| gap Rademacher (general) | record `10ζ`, s=1/2 | `14.60 > 11.49` | false as written | R07 |
| 2.1 Widmer 5.4 | D=1, ℤ, [0,X]; D=2 disc | `|⌊X⌋+1−X| ≤ 2`; `2⁶·2πR = 128πR` | true | — |
| 2.2 Sunley | ℚ(i), x=10 | count `9` (not 13), `κx = 7.854`, RHS `> e^{61}` | true; Check value wrong | R12 |
| 2.3 Lee constant | n=2; n=1 | `𝔪(2)=2.4674`, `λ(2)=1.4732·10⁹`, `Λ(2)=2.4913·10¹⁰` (Table 1 ✓); `𝔪(1)=π/4<1` | matches source p. 2 | — |
| 2.4 Debaene total count | ℚ(i), x=10; cubic d=−23 | error `1.146 ≤ 2⁴⁰√10`; base `1+log 0.2812 = −0.269`, rpow gives `−0.087` | false at the cubic | R05, R12 |
| 2.5 GRS | ℚ, 𝔮=ℤ | `F = 2`, bound `≈ 3730 ≥ |⌊x⌋−x|` | true; F wrong in Check | R12 |
| 3.1 zero-dependent upper bound | ℚ(√5) | `0.4304 ≤ (1−β)·1.1963` gives `β ≤ 0.640` | consistent | — |
| 3.1 kernel monotone on `u ≥ 1/2` | x ≥ 1 | `∂_u = log x (x^{u−1} − x^{−u}) ≥ 0` iff `u ≥ 1/2` | true | — |
| 3.2 = louboutin2005 (13) | cubic d=−23, 2 inert | RHS `(1/7)(2.1308·3.7675)² = 9.21 ≥ κ = 0.3684` | true; κ wrong | R12 |
| 3.3 Friedman | ℚ(i), ℚ(√5), ℚ(ζ₅) | `0.785≥0.181`, `0.430≥0.162`, `0.340≥0.032` | true | — |
| 3.3 Stark, log branch | normal tower, α=16 | `1/(43.2·16) = 0.0014468 < 0.0014480`; with `c₄=43.1622`: `0.00144803` | not derived | R06 |
| 3.3 | ℚ(ζ₇)⁺ | `1/(43.2·4·3.892) = 0.00149 ≤ κ = 0.3003` | true; κ wrong | R12 |
| 3.4 Table 1 values | 2m=2…12 | `270,41,26,22,21,2π²`; `2600,50,25,20,2π²,2π²`; `36000,…,181` | match `louboutin2003` lines 79–82 | — |
| 3.4(4) threshold | — | `32π²·8.4926 = 2682.2` | matches | — |
| 3.5 record | ℚ(i); ℚ; real cubic | shifts `{1}`; degree 0, Λ=1; shifts `{0,0}` | true | — |
| 3.5 completed function entire | general K | `Γ_ℝ(s)^{r₁+r₂−1}Γ_ℝ(s+1)^{r₂}` poles cancelled by zeros of `ζ_K/ζ` | true | — |
| 3.6 two-sided (Cor 2) | ℚ(i) | `5.6·10⁻⁸ ≤ 0.785 ≤ 1.77·10⁷`; pairs match source lines 67–71 | true; route input | R15 |
| 4.1 Trudgian Thm 2 | ℚ, T=15; ℚ(i), T=100 | `|2+0.620| ≤ 10.67`; `|158−156.65| ≤ 19.51` | true (via HSW row) | R16 |
| 4.2 HSW Thm 1.1 | ℚ, T=15 | `2.87 ≤ 27.77` | true | — |
| 4.3 Stark lemma (complex region) | — | matches `louboutin2017` lines 25–26 | true | — |
| 4.3 Theorem 3 / 6 | m=1; ℚ(√5), m=2 | `c₁=0.3431`, `c'₁=0.6208`, `d > e^{1.2415} = 3.461`; `1.609 > 1.464` | true | — |
| 4.3 Corollary 4 | cyclic cubic, double zero from `L(χ)L(χ̄)` | allowed by Thm 3 (m=2), no sign change | overclaim | R04 |
| 4.4 S₀ uniqueness | P on `[0,√2]` | `P(0)=2`, `P(1)=−1`, `P(√2)=2`; roots `0.45433, 1.22133` | false | R03 |
| 4.4 D1, C2, D2 | — | `0.27645, 0.62076, 0.50008` | match | — |
| 4.5 Kadiri / 4.6 Lee | ℚ, t=14.13 | `σ ≥ 0.9885`; `σ ≥ 0.9637` (zero at 0.5) | consistent | — |
| 5.1 `hR` bounds | ℚ(√5), ℚ(i), ℚ(√−3) | `0.481≤2.446`, `1≤2.40`, `1≤2.47` | true | — |
| 5.2 abelian | d=163; ℚ(√5); ℚ(ζ₅) | `1≤13.23`; `0.481≤0.900`; `0.962≤9.81` (not 31.0) | true; value wrong | R12 |
| 5.3 Bordellès | ℚ(√−14); ℚ; ℚ(√5) | `4≤11.19`; `1=1`; `1≤4.035` | true | — |
| 5.5 upper bound | ℚ(i), ℚ(√−3), 163, ℚ(ζ₈) | `4.80, 4.94, 56.3, 12.72` (each ≥ h⁻) | true | — |
| 5.6 Thm 11 (12)/(13) | ℚ(√−3) (CMPositivity holds) | RHS `1.108 > h⁻ = 1` | false | R01 |
| 5.6 Thm 11 | 163; ℚ(i); ℚ(ζ₈) | `0.587, 0.676, 0.054 ≤ 1` | true there | — |
| 5.6 Thm 13 | n=3, ρ=2800 | `0.0823·52.9/4595 = 9.5·10⁻⁴` | consistent | R26 |
| 6.1 sieve identity | ℤ/1, ℤ/2, ℤ/6 at 1 and 2; ℤ/2×ℤ/2 | `1`; `1, 0`; `1, 0`; non-cyclic gives `−1` | true; non-example value wrong | R13 |
| 6.2 intervals | p=101, H=4, h=2 | coprime pairs give 8 integers ≤ 15.40 | true; Check wrong | R13 |
| 6.3 Cor 2 | — | `0.999√p < √p−2` iff `p > 4·10⁶` | true | — |
| 6.3 δ | primes 3–23 | `δ = 0.00104 > 0` | witness wrong | R13 |
| 6.4 Thm 1 | p=409; p=2791 | `21 > 18.22`; `53 > 50.83` (claims start after) | true | — |
| 6.4 Thm 2 | p=10⁹+7 | `ω=2`, `9895 < 31621` | Check wrong | R13 |
| 6.5 Thm 1 | p=2; 3; 40487 | `3 > 1.986` (excluded); `2 < 2.97`; `10 < 40487^{0.99}` | true for odd p | — |
| 6.5 Thm 2 | p=3, ε=1/2, z=4, X=1000 | `111 > 54.77` | false | R02 |
| 6.5 Thm 3 | — | matches `kerrmcgowntrudgian2020` lines 64–79 (`θ(e)=φ(e)/e`) | true | — |
| 6.5 `A(10¹²)` | — | `0.159155 + 8.2·10⁻⁷ + 3.7·10⁻⁸ < 0.16` | true | — |

## Verified sound

- **Principles.**
  - No route-specific shortcut. Thresholds are stated as hypotheses, and finite computations are carried as `Prop`s.
  - No re-planned roadmap; Louboutin's first bound is consumed from AnalyticNumberTheoryPartI §2.15.
  - No copied passages, no algorithms, no `set_option`, no sorry'd data (a design has no Lean file).
  - The supplier direction is sound apart from the consumers list (R10).
- **Sample sources (15 targets plus 2 flagged).**
  - Checked against their texts at the locators: 0.4 (`louboutin2003` lines 261–266); 0.5 (`garcialee2022artin` lines 62–74; `louboutin2003` lines 349, 359); 0.6 (`kerrmcgowntrudgian2020` lines 37–43); 1.1 (`lee2023ideals` p. 4, Theorem 2.2); 2.3; 2.4 (Corollary 2, exponent `(n−1)²/n` from the page rendering).
  - 3.5 (Theorem 1). I checked that the proof uses only `N ≥ 3`, `|χ(p^m)| ≤ d` and shifts in `{0,1}` (lines 136–181, 825), which supports the record generalisation.
  - 3.6 (Corollary 2, all five degree pairs); 4.3 (`louboutin2015ijnt` Theorems 1, 3, 6, Corollary 4; `louboutin2017` Theorem 1); 4.5 (Kadiri Theorem 1.1, Corollary 1.2); 4.6 (Lee Theorems 1–2, no threshold in Theorem 1).
  - 5.1 (bounds derived from Mathlib's `dedekindZeta_residue_def`); 5.2 (`louboutin2005` p. 560, rendered); 5.6 (Theorems 9, 11–13, Lemma 8); 6.5 (Theorems 1–3, Lemmas 3–5).
  - Both flagged locators confirmed from page renderings: Lee's Theorem 1.2 constant (p. 2) and Louboutin 2005 Theorem 10 (13) for `m ≥ 3` (p. 569).
  - Also spot-checked: Widmer Theorem 5.4, Sunley Theorem 1.1(1), GRS Theorem 1, Trudgian Theorem 2, HSW Theorem 1.1/Corollary 1.2, Bordellès 2002 Theorems 5.1–5.3 and 2006 Theorem 2.2, Bach's lemma (`mcgowntrevinotrudgian2016` lines 70–76), Garcia–Lee §3 (residue lower bounds).
- **Library names at the pins** (all present unless listed in R19).
  - Mathlib `DedekindZeta.lean:57,61,66`; `ClassNumber.lean:52,70,78`; `Discriminant/Basic.lean:91,210,244`; `Discriminant/Defs.lean:41`; `CMField.lean:70,142,358,373,385,439`; `InfinitePlace/Basic.lean:437,475`; `Units/DirichletTheorem.lean:359`; `ZMod/UnitsCyclic.lean:85`; `RiemannZeta.lean:185`; `Gamma/Deligne.lean:155`; `Gamma/Digamma.lean:48`; `Meromorphic/Divisor.lean:41`; `CanonicalEmbedding/Basic.lean:720`; `ConvexBody.lean:444`; `MeanInequalities.lean:129`; `ArithmeticFunction/Misc.lean:329`.
  - Tau Ceti `ArithmeticDirichletSeries/Counting.lean:103,321,325`; `NumberField/DedekindZeta.lean:109`; `Global/RayClass/Modulus.lean:98`; `Basic.lean:130`; `MainTerm.lean:56,62`; `Count/Basic.lean:100`; `Count/Asymptotic.lean:112`; `Character/PartialSums.lean:63`; `LatticePointCount.lean:102,244`; `LipschitzParametrizable.lean:83`; `Contour/Argument/Cycle.lean:110`.
- **Cross-roadmap citations resolved.**
  - LFunctions (main): all 21 names in its `Suggested.lean`.
  - ZerosOfLFunctions (main): 4.1–4.3, 5.5–5.6, 6.1–6.5 (6.4(4d) includes the trivial-character bound), 7.1–7.5, Layer 9.
  - AnalyticNumberTheoryPartI (#1126): §§1.6, 2.5, 2.7, 2.15, 2.15a, 2.17a, 2.18, 2.21, 2.22, 2.31d, 2.31e, 2.32, 2.39b, 2.42 (`DedekindERH.of_abelian`, line 1636), 2.46.
  - GlobalNumberFields (Completed): Layers 2, 3, 9. ArithmeticDirichletSeries (Completed): `EulerProductData`.
  - ClassFieldTheory Layer 13 (`hilbertClassField`, `gal_hilbertClassField_equiv_classGroup`, conductor–discriminant).
  - ClassicalArithmeticCompletion §§1.5, 5.1. CyclotomicClassGroupsAndStickelberger (#1260) §3.4 (`abelianCharacter_gauss_product`, `relativeClassNumber_character_product`).
  - SuccessiveMinima Layer 1. GeometryOfNumbersAndQuadraticArithmetic (#851) §§1.3, 4.1. ComputationalNumberTheory (#1408) §4.17a. ImaginaryQuadraticClassNumber H2.2.
- **Ownership by object** (`roadmaps grep`): no other roadmap plans explicit ideal counts, least primitive roots, Bordellès or Louboutin relative bounds, or a `relativeClassNumber` def. CyclotomicClassGroupsAndStickelberger uses the quotient `classNumber F / classNumber F⁺`, so there is no name clash. Ownership was checked against the open roadmap pull requests through the tool's index and the sibling checkouts.
- **Gaps.** All 16 slugs appear in both `plan.json` and the README. Each supplier is named; the four sibling packages are at target stage. Twelve gaps are precise; R07–R09 and R21 cover the rest.
- **Gate output.**

      candidate: ExplicitNumberFields is not in the merge order yet; checked as if placed after ComputationalNumberTheory (the intake inserts it when its design is accepted)
      depcheck: 240 roadmaps, 2351 edges, 0 problem(s)

- **README shape.** Layers 0–6 each have Examples and Dependencies. Statements carry hypotheses and locators. No LaTeX, HTML anchors or machine paths.

## Not verifiable

- **Paywalled (uncertified)**, cross-checked against the quoting text where possible:
  - `rademacher1959` Theorem 4 (via `lee2023ideals` p. 4).
  - `louboutin2001` Theorem 1 (via `louboutin2003` lines 287–305).
  - `louboutin2000` (via `louboutin2003` line 603, which says Corollary 3).
  - `friedman1989` Theorem B (via `garcialee2022mertens` line 1215).
  - `cullyhugilltrudgian2021` Theorem 2.
  - `ramare2001` Corollary 1 (consistent with `louboutin2005` p. 560 and `louboutin2003` line 368).
  - `chen2022`.
- `louboutin2015mmj` is waived.
- Washington Theorem 4.10 and Lang Ch. XIII are not in the manifest and were not fetched, because they are paywalled textbooks. The route given for `h_{K⁺} ∣ h_K` is the standard Hilbert class field argument.
- Lapkova Lemma 3A, Rosser–Schoenfeld 1962 Theorem 15 and Schoenfeld 1976 Corollary 2 are not in the manifest; they enter only through gap contracts.
- The published Journal of Number Theory reading 0.0501 in Lee 2021 cannot be read.
- 1.1's claim that `|ζ(1/2+10i) L(1/2+10i, χ₋₄)| < 3` was not evaluated.

## Source issues

- **Error** in louboutin2003 at Theorem 11, p. 3088: the source says (12)/(13) with `c = 2` hold for every CM field of degree `2n ≥ 2` with `ζ_K/ζ_k ≥ 0` on `(0,1)`; it should be with `ρ_K ≥ max(ρ_{2n}, ρ_{2n,∅})` (Table 1), which the proof via Theorem 1 needs (ℚ(√−3) gives `h⁻ ≥ 1.108`); affects a stated result.
- **Misprint** in louboutin2003 at Theorem 13, p. 3088: the source says `ζ_F(β) = ζ_K(β) = 0` for some `β ∈ [−(2/log d_K), 1)`; it should be `β ∈ [1 − 2/log d_K, 1)`; affects nothing.
- **Misprint** in louboutin2017 at Theorem 2, p. 109: the source says `S₀` is the only root of `S⁴+2S³−2S²−4S+2` in `[0, √2]`; it should be the only root in `[0, 1]` (a second root lies at 1.2213); affects nothing.
- **Gap** in louboutin2015ijnt at Corollary 4, p. 2: the source says `ζ_K` has no real zero in `σ ≥ 1 − c₂/log d_K`; the proof excludes only odd-multiplicity zeros, and it should conclude `ζ_K ≤ 0` on that range; affects a stated result.
- **Misprint** in louboutin2015ijnt at the proof of Corollary 4, p. 2: the source says `ζ_K(1 − 2/log d_K) > 0`; it should be `ζ_K(1 − c₂/log d_K) > 0`; affects nothing.
- **Error** in kerrmcgowntrudgian2020 at Theorem 2, p. 2: the source says `N₂(X) ≤ p^{1/2}X^ε` for all `X`; it should assume `X < p`, as Lemma 6 needs (`p = 3`, `ε = 1/2`, `X = 1000` gives 111 > 54.8); affects a stated result.
- **Misprint** in kerrmcgowntrudgian2020 at Lemma 4, p. 3: the source says `n/φ(n) ≤ e^γ log log n (1 + 2.51/log log n)` for `n ≥ 2`; it should be Rosser–Schoenfeld's `e^γ log log n + 2.51/log log n` for `n ≥ 3`; affects nothing.
- **Gap** in kerrmcgowntrudgian2020 at the proof of Theorem 1, p. 7: the source says `φ(e)/e ≥ (1.8e^γ log log e)^{−1}`, which fails for small `e` (`e = 6`: `1/3 < 0.535`); it should bound `e/φ(e)` through a quantity at least `10¹²`; affects the proof.
- **Misprint** in kerrmcgowntrudgian2020 at the proof of Theorem 1, p. 7: the source says, for the cases `9 ≤ ω ≤ 13`, that `s = 8` is chosen when `ω = 14`; it should name a case within `9 ≤ ω ≤ 13`; affects nothing.
- **Misprint** in kerrmcgowntrudgian2020 at Theorem 1, p. 2: the source says `h(p) < p^{0.99}` for all primes `p`; it should say all odd primes (line 25's convention; `h(2) = 3`); affects nothing.
- **Gap** in debaene2019 at Corollary 2, pp. 2 and 15: the source says the error has the factor `(1 + log Reg h)^{(n−1)²/n}`; it should use `1 + log⁺`, since the proof needs `Reg ≥ 1` and the base is negative below `1/e`; affects a stated result.
- **Misprint** in garcialee2022mertens at §3, p. 16: the source says the min-derivation from (24) is "in the case K does not have a quadratic subfield"; it should say it holds for every K; affects nothing.
- **Gap** in trudgian2015 at Theorem 2, p. 1: the source says the bound holds with the proof's parameter ranges, which were not verified (hasanalizadeshenwong2022 lines 40–49); it should be supported by the repaired constants; affects the proof; corrected in print at hasanalizadeshenwong2022, Table 1.
- **Misprint** in bordelles2006 at the recall after Lemma 1.1, p. 2: the source says `τ₁(m) = m`; it should be `τ₁(m) = 1`; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "9793b2224d09625f7216aacb3534d5f4fa3555ec", "job": "REV-DESIGN-ExplicitNumberFields", "model": "claude-opus-5-5", "worker": "chris-x27"} -->
