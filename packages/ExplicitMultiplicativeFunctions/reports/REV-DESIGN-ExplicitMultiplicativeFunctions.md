<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/7294#issuecomment-6689822482 -->
Review (claude) of e34f3d0

Verdict: needs_changes

1. **F01** (P1) ComputationalNumberTheory is both a supplier and a consumer; three more listed consumers come earlier in the merge order
   - **Location.** README.md:96–97: "ComputationalNumberTheory Layers 4–5 is where such a hypothesis is discharged by certified computation". The same claim appears at 147–149, 256–260, 533–535, 584 and 2115–2116. `plan.json` lists `ComputationalNumberTheory` under `suppliers` (§4.17a, Layers 4–5) and again under `consumers`, next to ErdosProgressionPowers, EffectiveClassNumbers and PolynomialGaloisGroupsPartII (README.md:2111–2114).
   - **Claim.** ComputationalNumberTheory discharges the Props of Layer 0.7 and consumes their shapes; the other three consume this roadmap.
   - **Witness.** `merge-order/ORDER.txt` puts ComputationalNumberTheory at line 185, ErdosProgressionPowers at 187, PolynomialGaloisGroupsPartII at 205 and EffectiveClassNumbers at 238. The gate places this roadmap after line 260. ComputationalNumberTheory's Layers 4–5 (its README at the open head, lines 1905–1925 and 2666–2680) plan no Möbius, squarefree, divisor or Stieltjes verification. §4.17a defines `D_N(1) = −γ`, so it cannot enclose γ.
   - **Repair.**
     - Delete those four roadmaps from `## Downstream consumers` and from `plan.json` `consumers`. A later "<X>, Part II" may be named instead.
     - Delete every claim that ComputationalNumberTheory discharges Layer 0.7 (the six places listed above). Say once in 0.7 that the Props are hypotheses this roadmap does not discharge.
     - Route `EulerGammaEnclosure` through `Real.eulerMascheroniSeq_lt_eulerMascheroniConstant` and `Real.eulerMascheroniConstant_lt_eulerMascheroniSeq'` (Mathlib, `NumberTheory/Harmonic/EulerMascheroni.lean:159, 164`).
     - Drop ComputationalNumberTheory as a supplier, since nothing else is consumed from it. Rerun the gate.

2. **F02** (P1) Layers 1.3, 1.4 and 1.5 form a cycle, and 1.3's hypothesis has an undefined range
   - **Location.** README.md:703: "*Needs:* `MoebiusTableVerified`; `MoebiusRangeVerified`; 1.4 (for the tail)". README.md:732: "*Needs:* 1.3; …". README.md:793: "the `1/4345` bound of 1.3". README.md:690–691: "`MoebiusRangeVerified (x ↦ x/4345) 2 160 535 X_{CDEM}`". README.md:693–697: "restated with its range of validity at `elMarraki1995` … Théorème 1".
   - **Claim.** 1.3 gets `|M(x)| ≤ x/4345` beyond the table from El Marraki's Théorème 1 and from the tail bounds of 1.4 and 1.5.
   - **Witness.** `elMarraki1995` lines 233–244: Théorème 1 takes (1.1) `|M(x)| ≤ x/4345` (x ≥ 2 160 535) as an input, to prove a bound in `(log x)^{−1/2}`; it does not restate it. 1.4 and 1.5 assume the `1/4345` bound for every x ≥ 2 160 535. 1.3's own Checks give tail thresholds `e^{56.5}` and `e^{474}`. `X_{CDEM}` is defined nowhere, and the same holds for 1.2's `N₀` (README.md:666).
   - **Repair.**
     - State `|M(x)| ≤ x/4345` for x ≥ 2 160 535 as Cohen–Dress–El Marraki's Theorem 1, by locator (uncertified). Its route is their elementary method from `MoebiusTableVerified 0.571 10^{12}`, with no edge to 1.4 or 1.5.
     - Remove "1.4 (for the tail)" from 1.3's *Needs:*. Remove the "restated … at elMarraki1995" clause and cite Théorème 1 as a consumer of (1.1).
     - Give `X_{CDEM}` and `N₀` numeric values, or delete those Props. Keep the tail lemma as a standalone target.
     - Checked: after these edits, 1.3 → 1.4 → 1.5 has no back edge.

3. **F03** (P1) The finite computations used by the Ramaré 2013 routes are owned by nothing
   - **Location.** README.md:790–791: "`gap:psi-dusart-log` (`ε₂(x) = 0.0065/log x`, `x₂ = 1 514 928`)". README.md:967–969: "through El Marraki's route of 2.2 with the `1/4345` bound on the initial range and field (viii)".
   - **Claim.** The listed gaps and fields (i)–(viii) suffice for Theorem 1.1 and Corollary 1.2.
   - **Witness.**
     - `gap:psi-dusart-log` supplies the bound only for x ≥ e^{22}. `ramare2013aa` lines 208–214 extend it down to 1 514 928 using (4.2) and a computation on [1 514 928, 3 430 190]. Lemma 4.4 (lines 245–249, used at line 574) rests on a similar computation.
     - For 2.3: `1/4345` holds only from 2 160 535, which is above D₀ = 1 078 853. The source uses `∫_1^{D₀}|M(t)|dt/t` instead (line 754); computed value 301.90.
   - **Repair.** Add as fields of `RamareTransferComputations` every finite ψ-verification the instance uses below the gaps' ranges: at least (ix) `|ψ(x)−x| ≤ 0.0065x/log x` on [1 514 928, e^{22}], plus the Lemma 4.3/4.4 extensions if they are used. Add (xii) `∫_1^{1 078 853}|M(t)|dt/t ≤ 302`. State which fields each instance uses, and replace "the 1/4345 bound on the initial range" by (xii).

4. **F04** (P1) The first row of Ramaré's Theorem 1.5 fails on (1.374, 1.979)
   - **Location.** README.md:1116: "`|m̌(x) − 1| log x ≤ 0.213` for `x ≥ 1`". README.md:1132–1133: "the first row is sharp at `x = 2`".
   - **Claim.** The row holds for every x ≥ 1 and is sharp at x = 2.
   - **Witness.** On [1, 2), m̌(x) = log x. At x = e^{1/2}: `|m̌−1| log x = (1/2)(1/2) = 0.25 > 0.213`. Checking only the endpoints of each step misses this interior maximum of `|a u − b|·u`, u = log x.
   - **Repair.** State the row for x ≥ 2: no violation on [2, 10⁶], interior extrema included. Optionally add `≤ 1/4` for x ≥ 1. Replace the Check with the x = √e instance. Record the source error (below).

5. **F05** (P1) The Σ τ(n)/n model is false on (0, 1), so Layer 5.1 cannot use it with D = 1.16
   - **Location.** README.md:1280–1282: "for every real `t > 0`, `Σ_{n ≤ t} τ(n)/n = ½ log² t + 2γ log t + γ² − 2γ₁ + O*(1.16 t^{−1/3})`". README.md:1268–1270: "which the models of 5.2 satisfy by the choice of their constants".
   - **Claim.** The model holds for every t > 0, which is what 5.1 requires.
   - **Witness.** At t = 0.01 the sum is empty (0), while `|½ log²t + 2γ log t + γ² − 2γ₁| = 5.766 > 1.16·0.01^{−1/3} = 5.384`. The supremum of `|model|·t^{1/3}` on (0, 1) is 1.6408, near t = e^{−7}. On [1, 2·10⁵] it is 0.654.
   - **Repair.**
     - State 5.2 for real t ≥ 1. For 5.1's all-t hypothesis, add the model on (0, 1) with D = 1.641 (or restate it for t > 0 with 1.641).
     - Recompute the dependent constants. In 7.6: `1.641·H̄(−1/3) = 1.641·2.8041 = 4.60`, and `2.5·4.60 = 11.5`. In 7.3, recompute 1088 the same way. Alternatively, state Trudgian's and Riesel–Vaughan's constants by locator, with their route marked as the sources'. Trudgian's Lemma 13 holds at every integer ≤ 10⁶.
     - Fix the 5.1 Check.

6. **F06** (P1) Three squarefree constants in 7.1 are false as stated for real x
   - **Location.** README.md:1586–1588: "`0.036438 √x` for `x ≥ 82 005`, `0.02767 √x` for `x ≥ 438 653` … `−0.103229 √x ≤ R(x) ≤ 0.679091 √x` for `x ≥ 1`".
   - **Claim.** The bounds hold for real x, as the README's conventions require.
   - **Witness.**
     - x = 1.9: R = −0.15506, below `−0.103229·√1.9 = −0.14229`.
     - Integer x = 351 115: Q = 213 474 (confirmed independently by `Σ μ(d)⌊x/d²⌋`), so |R| = 21.68 > 21.59.
     - As x → 441 353⁻, R/√x → −0.027772.
   - **Repair.**
     - State the lower bound for natural x (minimum −0.1032287, at n = 380). For real x use −0.15264√x, the limit as x → 2⁻.
     - Delete the 0.036438 row, which is false at an integer.
     - State the 0.02767 row for natural x (no integer violation on [438 653, 1.1·10⁶]). The real-x form adds the jump 6/π².
     - Recheck every `SquarefreeRangeVerified` use in 7.2 against these changes.

7. **F07** (P1) Berkane–Bordellès–Ramaré's 0.397 row fails for real x, and the sharpness witnesses are false
   - **Location.** README.md:1702–1704: "`0.397 √x` for `x ≥ 5560` (… sharp: `|Δ(1980)| > 0.5 √1980`, `|Δ(5559)| > 0.4 √5559`)". Also README.md:1720–1723 and 450–451.
   - **Claim.** `|Δ(x)| ≤ 0.397√x` for real x ≥ 5560; x = 5559 and x = 9994 are sharpness witnesses; and "x ≥ 5 is false" for the cubic bound.
   - **Witness.**
     - As x → 7560⁻: Δ = 28.963 − τ(7560) = 28.963 − 64 = −35.04, and |Δ| > 0.397·√7560 = 34.52. The same happens just below 5760 and 6720.
     - Δ(5559) = −0.705. Δ(9994) = −2.530 and Δ(9995⁻) = −12.89, both far below the claimed 158.7.
     - `0.764x^{1/3}log x` holds on all of [5, 2·10⁵].
   - **Repair.**
     - State the 0.397 row for natural x (the last integer with |Δ(n)| > 0.397√n is 5460), or for real x ≥ 7560 (no real violation on [7560, 2·10⁵]).
     - Use n = 5460 (|Δ| > 0.4√n) and 1980 as the sharpness witnesses.
     - Delete the 9994 non-example and the clause "x ≥ 5 is false".
     - In 7.5, Cully-Hugill–Trudgian evaluate Δ at real x/n: take the corrected form there.

8. **F08** (P1) Eum–Koo's bound as stated fails at n = 21
   - **Location.** README.md:2068: "`σ(n) ≤ (3/4) e^γ n log log n` for odd `n ≥ 21`".
   - **Claim.** The bound holds at every odd n ≥ 21.
   - **Witness.** σ(21) = 32 > (3/4)·1.781072·21·log log 21 = 31.2314.
   - **Repair.** "for odd n > 21". No odd n in (21, 1.1·10⁶) violates it. Add n = 21 as a negative Check.

9. **F09** (P2) Δ, the hyperbola identity, the cubic bound and the harmonic remainder restate AnalyticNumberTheoryPartI
   - **Location.** README.md:431: "`divisorRemainder x = Σ_{n ≤ x} τ(n) − x (log x + 2γ − 1)`". README.md:1697–1704 (the hyperbola form; `0.764 x^{1/3} log x` for x ≥ 9995). README.md:391–392: "Prove the monotone form `0 < Σ_{n ≤ N} 1/n − log N − γ < 1/N`".
   - **Claim.** These belong to this roadmap.
   - **Witness.** AnalyticNumberTheoryPartI, at its open head:
     - §3.23a defines `divisorError` Δ (same formula) and plans `divisorRemainder.cubic_bound` (0.764, x ≥ 9995) and `divisorRemainder.sqrt_bound` under `BBRFiniteInput`.
     - §3.22b is the hyperbola identity.
     - §3.22a states `0 < H_N − log N − γ < log(1+1/N) ≤ 1/N`.
   - **Repair.**
     - Import Δ as §3.23a's `divisorError`, and cite §3.22b and `divisorRemainder.cubic_bound` in the AnalyticNumberTheoryPartI contract and in Scope.
     - Keep in 7.4 only the rows 0.961 (x ≥ 1), 0.482 and 0.397, plus the `ψ_B` form, each saying in one clause how it extends §3.23a.
     - Delete the natural-N sentence in 0.3 and cite §3.22a instead.

10. **F10** (P2) Several gap `needs` sentences are vague, compound or already supplied
   - **Location.** `plan.json` `gaps`. For example `mertens-logp-explicit`: "The two-sided estimate with the same constant E at both endpoints, and its progression analogue for Layer 8.3." And `nth-prime-lower`: "The explicit lower bound for the k-th prime."
   - **Claim.** Each needs sentence states exactly what is missing, and nothing that is already supplied.
   - **Witness.**
     - AnalyticNumberTheoryPartI §0.8 already states `log x + E − 1/(2log x) < Σ_{p≤x}(log p)/p < log x + E + 1/(2log x)` for x ≥ 319 with one E. ExplicitPrimeCounting's target T3.1 says it imports this from §0.8.
     - `psi-initial-range`, `psi-dusart-log`, `psi-tilde-explicit`, `nth-prime-lower` and `prime-count-lower` state no inequality.
     - `mertens-reciprocal-explicit` bundles four estimates.
   - **Repair.**
     - `mertens-logp-explicit`: cite AnalyticNumberTheoryPartI §0.8 for q = 1 and keep only the progression analogue, stated as one inequality.
     - Replace each vague needs sentence by the exact statement from README.md:274–297. For example, nth-prime-lower: "`p_k ≥ k(log k + log log k − 1)` for every k ≥ 2". psi-dusart-log: "`|ψ(x)−x| ≤ 0.0065 x/log x` for x ≥ e^{22}".
     - Split `mertens-reciprocal-explicit` into one gap per estimate.
     - For `prime-count-lower`, cite section T2.1 (Rosser–Schoenfeld Corollary 1), not T2.6, and note that §0.5 covers x ≥ 59 under its finite-range input.

11. **F11** (P2) Two of Ramaré 2013's parametric lemmas are mis-transcribed
   - **Location.** README.md:771–772: "`Σ_{d ≤ T} Λ(d)/(d log(D/d)) ≤ c₁ log D + c₁ log(log D/log(D/T))`". README.md:783–785: "`M(D₁) − M₂(μ, D₁)/log² D₁ ≤ −C₁`: `|M(D)| ≤ (α/log D − β/log² D) D − C₁ + …`".
   - **Claim.** These are the source's Lemma 5.1 and the Lemma 8.1 scheme.
   - **Witness.**
     - `ramare2013aa` lines 380–382 give the bound `1.04 log(log D/log(D/T)) + 1.04/log D`, with `1/log D`, not `log D`.
     - Lemma 8.1 gives `M(D) = M₂(D)/log²D + c₀ − 2∫…`. Taking `M₂(D₁) = −(α log D₁ − β)D₁` makes `|M(D₁)| = (…)D₁ + |c₀|`, which exceeds the claimed `(…)D₁ − C₁`.
   - **Repair.**
     - Lemma 5.1: write `c₁/log D` and require D > 1.
     - Lemma 8.1 scheme: assume `|M(D₁) − M₂(μ,D₁)/log²D₁| ≤ C₁` and conclude with +C₁.
     - State the absorption condition as `2β ≥ 4α` and `C₁ ≤ 2αD₁/log²D₁`. The instance satisfies both: 0.288 ≥ 0.052, and 3.48 ≤ 263.8. (The source makes the same sign slip on page 14; see Source issues.)

12. **F12** (P2) The route in 8.1 does not reach the constant 1/(2 log² x)
   - **Location.** README.md:1869–1871: "`log(e^γ log x ∏_{p ≤ x}(1 − 1/p)) = −(Σ_{p ≤ x} 1/p − log log x − B) − Σ_{p > x} (log(1 − 1/p)^{−1} − 1/p)`".
   - **Claim.** For x ≥ 286, AnalyticNumberTheoryPartI §0.19 gives both sides of the explicit Mertens product.
   - **Witness.**
     - The tail enters with a plus sign: `B − γ = −Σ_p c_p`, where c_p > 0.
     - At x = 286 the route gives only `log Q ≤ 0.015630 + 0.003509 = 0.019139`. The upper bound needs `log Q ≤ log(1 + 0.015630) = 0.015509`. The route therefore proves `1 + 1/log²x`, not `1 + 1/(2log²x)`. The statement itself holds numerically on (1, 3·10⁵).
   - **Repair.**
     - Fix the sign.
     - Prove the `1/(2log²x)` sides for x ≥ 24 284 from `gap:mertens-reciprocal-explicit`'s `1/log³x`. At 24 284: `9.7·10⁻⁴ + 4.1·10⁻⁵ ≤ log(1 + 4.904·10⁻³) = 4.892·10⁻³`.
     - Extend `MertensProductInitialRangeVerified` to 1 < x < 24 284, and list the gap in 8.1's *Needs:* for the main statement.

13. **F13** (P2) Several Props and constants are named but never stated
   - **Location.**
     - README.md:540–541: "the Riesel–Vaughan constants `A₃`, `A₄` and `∏_{p > 2} (p − 1)²/(p(p − 2)) = …`".
     - README.md:545–546 (`PrimorialTableVerified`, `SuperchampionTableVerified`), 551 (`ProgressionProductTableVerified`) and 526–527 (`SquarefreeIntegralRangeVerified`).
     - README.md:1736 (`PiltzRangeVerified k`) and 1824 (`TotientRangeVerified`).
     - README.md:1942 ("`C(q, a)` the table value").
     - README.md:774–778 ("`(b/√D)(…)`", "`2ε₂(√D)/√D·…`").
   - **Claim.** Each of these is a stated hypothesis or constant.
   - **Witness.** None has a stated range, constant or quantity. `PiltzRangeVerified` and `TotientRangeVerified` are missing from 0.7. As a result 7.3, 8.3 (a sampled target), 9.1, 9.3 and the Lemma 5.2/6.1 schemes have no exact statement.
   - **Repair.**
     - Give each Prop its exact content in 0.7. For example: `PiltzRangeVerified k`: ∀x ∈ [6, x_k), `Σ_{m≤x}τ_k(m) ≤ 2x log^{k−1}x`. `TotientRangeVerified`: the Lemma 3 inequality on [3, 41]. `PrimorialTableVerified`: `k ≤ 1.3841 θ(p_k)/log θ(p_k)` for 2 ≤ k < k₀, with k₀ explicit.
     - Where the source is uncertified (A₃, A₄, C(q, a), x₀(q)), make those constants explicit parameters with named hypotheses.
     - Write out the elided expressions.

14. **F14** (P3) False or garbled Checks in Layers 0–3
   - **0.1** (342): "over `Ioc 0 ⌊x⌋₊` without the `n = 1` term would give `M(1) = 0`". But `Ioc 0 1 = {1}`, so this sum gives M(1) = 1. Keep only the `Finset.range` contrast.
   - **0.2** (374–378) and the Layer 0 Examples (577): "m₂(10) = 31/105", with a garbled decomposition. The value is 34/105: `m(10) + m(5)/2 + m(2.5)/4 + m(1.25)/8 = 19/210 − 1/60 + 1/8 + 1/8 = 34/105`, as the 2.4 Check says.
   - **0.3** (390): "0.9105 = 3 exp(−1/3 − 1)". But 3e^{−4/3} = 0.7908; the maximum of `(−log t − γ)t^{1/3}` is 3e^{−1−γ/3} = 0.910471.
   - **0.3** (404–406): "1/2 does not" exceed R₁(1) = 0.4227, but it does. The constant 1/2 fails only as X → 2⁻, where X|R₁| → 0.540726 (not 0.5404).
   - **0.5** (446): "R(176) = 107 − 1056/π² = 0.0073". In fact Q(176) = 106 and R(176) = −0.9952, as the 7.1 Check says.
   - **0.6** (486): "H̄(−1/3) = 1.73". The value is `Σμ²(n)n^{−5/3} = 1.8508`. Rewrite the garbled H′(0) line as `H′(0) = (6/π²)·0.56996 = 0.34649`.
   - **1.2** (679–681): the threshold sentence is garbled. Replace it with "|M(1118)| = 14 > 13.975 and |M(1109)| = 15, so 1119 is least".
   - **1.4** (739–740): "|M(685)| ≤ 15" proves nothing. Use `|M(685)| = 11 < 11.453` and `|M(684)| = 12 > 11.439`.
   - **1.5** (825–827): "below 100 … far from tight" is false. |M(1 078 853)| = 349 against a bound of 349.92, and |M(1 078 852)| = 350 violates it: the threshold is exact.
   - **2.3** (990): the 1/25 row is not exact (last violation 3461, threshold 3470).
   - **2.3** (993–994): "true |m(463 421)| below 0.0003" is false. It is 0.0005154 against a bound of 0.0005162.
   - **2.4** (1028–1029): the "maximum … 0.3466 (at x = 2)" is wrong. The supremum is 0.693147, as x → 2⁻.
   - **1.6** (861–862): the non-example is already excluded by the hypothesis x > q. Delete it.
   - **3.3** (1158–1160): "attained up to 0.3%" is false. For q = ∏_{p≤x}p, the ratio `m̌_q(x)/(q/φ(q))` tends to e^{−γ} = 0.56. Delete the Check.
   - **Layer 3 Examples** (1167): m̌₂(10) = 1.7117, not 1.624.

15. **F15** (P3) False Checks and Examples in Layers 4–9
   - **Layer 4 Examples** (1221–1222): for the quartic character mod 5 the partial sums are 1, 1+i, 1, 0, …, so P = √2, not 1. Also |L(1, χ)| = 0.8886, not ≈ 0.78.
   - **6.3** (1500–1501): for f = 1, B = `Σ_p log p(2p−1)/(p(p−1)²) = 1.98233`, which is not ≤ 1.1; A + B + 1 = 4.3686.
   - **Layer 6 Examples** (1562–1564): for f = 2^ω, A + B + 1 = 7.74, so the loss factor is 3.87, not ≈ 2.5.
   - **6.4** (1527–1529): at x = 1 the product over p ≤ 1 is empty and the bound reads 1 ≤ 1, which holds. It fails at x = 2 (2 > 1.5) and x = 3 (3 > 2).
   - **7.1** (1603–1604): R(7) = 6 − 4.2554 = 1.7446, not 0.74, since Q(7) = 6. This exceeds √7/2 = 1.3229, which is the reason for the threshold 8.
   - **7.2** (1661–1663): `j(6) = 0.84·5.4641/4.4641 = 1.0282`, and `5.9·j(6) = 6.07`. The README has 6.464, 1.216 and 7.17.
   - **7.3** (1679–1680): the O*-term sits inside the prefactor (1/4)∏, so 1088 equals `D·H̄(−1/3)/u`, not `D·H̄(−1/3)`.
   - **7.4** (1720–1721): the "0.5's complement" sentence is garbled. Its other errors are covered by R07.
   - **7.7 route** (1819–1822): bounding by H_{⌊x⌋} gives `(6/π²)x + log x + 1 + γ + 1/x`, which overshoots the claim by γ + 1/x. Name the sharper step. The statement itself holds for every n < 10⁶.
   - **8.3** (1956): `C(1, 0) = e^γ(1 + 1/log²x)` depends on x. Use a constant.
   - **9.2** (2043): `τ₃(43 243 200) = 28·10·6·3³`, not `3⁴`. The value 45 360 is right.

16. **F16** (P3) Locators, attributions and process wording
   - **ramare1995.** "line 523–525" (412) and "lines 526–548" (474) point to §4 (Lemmas 4.1–4.3) of the cached text. Lemma 3.2 is at lines 339–354 and Lemma 3.3 at lines 356–368 (pp. 656–658).
   - **vanlalngaia2017.** "OCR text lines 87–97" (1909) does not exist: the cached text is font-garbled. Cite Theorem 5 by number and page.
   - **ramare2016mc.** "lines 440–446" (1623) belong to Lemma 3.3 (`Σμ²(d)φ(d)/d²`). Lemma 3.4's computation is at lines 462–466.
   - **Tau Ceti names.**
     - `normCoeff_eq_eulerProduct` is in `TauCeti/NumberTheory/ArithmeticDirichletSeries/EulerProduct/Data.lean:151`, not in `Basic.lean`.
     - `primesLE` is Mathlib's `Nat.primesLE` (`Mathlib/NumberTheory/PrimeCounting.lean:133`). Tau Ceti's `PrimeCounting.lean` only uses it.
   - **plan.json gap `prime-count-lower`.** The section should be ExplicitPrimeCounting T2.1, not T2.6.
   - **sources.toml `cipu2015`.** The locator omits Lemma 4.2, which 7.1 cites.
   - **7.2** (1638–1641): Akhilesh–Ramaré's Theorem 1.1 is stated without the range of D. Add "real D ≥ 1".
   - **Process wording.** Remove the remarks on how texts were read ("OCR text", "OCR'd scan", "as the OCR of the scan reads") at 722, 1232, 1266, 1539, 1909 and 1982. The manifest records this.

17. **F17** (P3) Shape notes for the package stage
   - **Definitions without discriminating Checks.** `superiorHighlyComposite` (2019), `bernoulliFun` and `periodicBernoulli` (595–597) have none. Suggested Checks:
     - At ε = 0.3, 5040 satisfies the definition and 2520 does not: d(5040)/5040^{0.3} = 4.650 > d(2520)/2520^{0.3} = 4.580 (`teo2026` Table 12).
     - b₂(1) − b₂(0) = 0. This excludes the `bernoulli'` convention (B₁ = +½), under which the difference is 2.
   - **3.1 route** (1089): "the positivity h′ ≥ 0" does not fit the corrected kernel `h′ = (3/2 − γ)ε₁′ − g′`, for which only `|t²h′| ≤ 7/4 − γ` is stated. The x = 2 Check itself allows ∫h′ < 0. Say which property is proved.
   - **Backticked names.** Each backticked name the README presents as this roadmap's own must be declared in `Suggested.lean` or lose its backticks. That is about 45 names: `moebiusSum`, …, `superiorHighlyComposite` and the Props of 0.7. The Props of R13 cannot be declared until they are stated.

Seventeen findings: eight P1, five P2 and four P3. The P1 findings are of three kinds. Two are supply defects: a two-way edge with ComputationalNumberTheory, and a cycle inside Layers 1.3–1.5. One is a prerequisite that nothing owns: the finite computations of Ramaré 2013. Five are false statements, each refuted by a computed instance; four of these come from the sources themselves (Ramaré 2015, Berkane–Bordellès–Ramaré, Cipu / Cohen–Dress–El Marraki), and the fifth (Eum–Koo at n = 21) is a statement whose source could not be read. All of them can be repaired without re-planning anything. Every witness below was recomputed by script: exact sieves to 1.2·10⁶, with real arguments tested at both ends of each step interval and at interior extrema. Line numbers refer to `packages/ExplicitMultiplicativeFunctions/design/README.md` unless stated otherwise.

## Adversarial pass

Each row gives the instances tried and the values computed on each side. The sieves are exact up to 1.2·10⁶ (squarefree and σ up to 1.1·10⁶, τ up to 2·10⁵). For real arguments, both ends of every step interval were tested, plus interior extrema where a factor log x is present.

| Statement | Instances | Values computed (left vs right) | Result | Change |
|---|---|---|---|---|
| 0.1 carriers (sample) | M at 1,2,3,5,10,13; m at 5,6,7; m̌ at 2, 3, 30⁻ | M: 1, 0, −1, −2, −1, −3. m: −1/30, 2/15, −1/105. m̌: 0.693147, 0.895880, max 1.0030213 at 30⁻ | sound | R14 (Ioc remark) |
| 0.2 coprime decomposition | q = 2, x = 10 | direct 34/105 = sum over a ∣ 2^∞ (19/210 − 1/60 + 1/8 + 1/8) | identity true; Check false | R14 |
| 0.3 harmonic remainder | X → 2⁻; t ∈ (0,1) | sup X\|R₁\| = 0.540726 ≤ 6/11; max (−log t − γ)t^{1/3} = 0.910471 ≤ 0.9105 | bounds true; formula false | R14 |
| 0.5 R, Δ | x = 4, 12, 176 | Δ(4) = 1.8371; Δ(12)/√12 = 0.96069; Q(176) = 106, R(176) = −0.9952 | Check false | R14 |
| 0.6 Euler derivatives | h = μ/n² | H̄(−1/3) = 1.8508 (Check says 1.73); H′(0) = 0.34649 | Check false | R14 |
| 0.7 integral Props | ∫₁^{D₀}\|M\| | 113 556 482 ≤ 113 556 832; 30 016 144 ≤ 30 016 365 | true | none |
| 1.1 identities (sample) | Balazard at x = 2; ε₁′ at 1.5, 2⁺; Meissel at 2.5, 6 | 1/2 = 0 + 5/12 + 1/12; ε₁′ = 1/81 and 1/4; 2 − 1 = 1; 6 − 3 − 2 − 1 + 1 = 1 | sound | none |
| 1.2 MacLeod, Costa Pereira (sample) | n ≤ 1.2·10⁶ | max(\|M\| − (n+1)/80) = 5.5 at n = 199 (equality); last \|M\| > n/80 at 1118; 0 violations of x/80 on [1119, 1.2·10⁶]; last x/1036 violation 120 726 | sound; ≤ needed | R14 wording |
| 1.3 table bound | 0.571√x vs x/4345 | crossover 6.155·10⁶; e^{AB} = e^{56.5}, e^{474} | cycle | R02 |
| 1.4 El Marraki | (1, 3000]; x = 684, 685 | max log x\|M\|/x = 0.64377516 at x = 5; \|M(684)\| = 12 > 11.439; \|M(685)\| = 11 < 11.453; 0 violations on [685, 1.2·10⁶] | sound | R14 |
| 1.5 identities (sample) | Selberg at 1, p, p², pq; hyperbola at (D,K) = (50,3), (137.5,5), (200,1) | 0; −log²p; 0; (log pq)². Both sides −20.527336, −4.888899, −172.150751 | sound | none |
| 1.5 Theorem 1.1 instance | D = 1 078 852, 1 078 853; D ≤ 1.2·10⁶ | \|M\| = 350 > 349.9; 349 ≤ 349.92; 0 violations above | sharp; Check false | R03, R14 |
| 1.5 Lemmas 5.1, 8.1 | source lines 380–382; sign of c₀ | 1.04/log D in source vs c₁ log D in README; \|M(D₁)\| = (…)D₁ + \|c₀\| | mis-transcribed | R11 |
| 1.6 coprime M at q = 1 | x ≤ 1.2·10⁶ | last violations: 0.429 at 32; 1/5 at 200; 0.0918 at 1109; (1 + log) rows 1, 1/2, 1/5, 39/400 at 5, 32, 201, 1132 | consistent | none |
| 2.1 Tao (headline) | S = ∅, {2}, {2,3}; A = {1,6} | 1; 1/2; 1/3; 7/6 > 1 | sound | none |
| 2.2 Balazard (headline, sample) | x = 1, 2 | 1 ≤ 11/3; 1/2 ≤ 19/12; El Marraki at D = 2: 1/2 ≤ log 2 | sound | none |
| 2.3 rows (sample) | every [n, n+1), n < 1.2·10⁶ | last violations: 1/12 at 686; 1/20 at 3354; 1/25 at 3461; 1/40 at 24 269; 1/65 at 96 017; 1/69 at 96 954. \|m\| rows: 6, 40, 1418. Theorem 1.2: 0 violations; 2013 Cor. 1.2: 0; Cor. 1.3: 60 189; Cor. 1.4: 48 517; 1/(40L): 24 269; 3/(100L): 11 814; Bordellès 0.19: 0 | corrected thresholds confirmed | R14 |
| 2.4 coprime m at q = 1 (sample) | x ≤ 4·10⁵ | sup (log x)\|m\| = 0.693147 ≤ 0.78; 5/16 last at 2; 17/125 last at 226; 5/38 last at 294; 1/7 last at 226; C₁, C₂, C₁₀ = 12 554.9, 8044.9, 6722.0 | consistent | R14 |
| 2.5 tail of Σμ(d)/d² | D ∈ [1, 5000] at (N+1)⁻ | max D·\|tail\| = 0.7841 | sound | none |
| 3.1 Lemma 3.2 identity | x = 1; derivation from line 661 and (2.1) | 5 − 4γ gives −1 = m̌(1) − 1; the printed 6 − 4γ gives −2 | correction right | none |
| 3.2 rows (sample) | [n, n+1), n < 10⁶, with interior extremum | 0.213 row: 0.25 at √e (fails on (1.374, 1.979)); other rows last fail at 6, 3161, 9548, 9549, 6, 43, 221 | first row false | R04 |
| 3.3 positivity (sample) | min m̌ on [1, 10⁶); q = 2 at x = 4, 10 | 0; 1.2904; 1.7117 | sound; Example false | R14 |
| 4.1 twisted sum | χ₃, χ₄, quartic χ mod 5 | L(1,χ₃) = 0.6046 = π/(3√3); quartic: max partial sum √2, \|L\| = 0.8886 | sound; Example false | R15 |
| 5.1 weighted variant | h = δ, k = τ/n | U = 1, V = 2γ − 1; Σ_{n≤10⁶} τ = 13 970 034 | sound | none |
| 5.2 τ/n model (headline) | t = 0.01; (0,1); [1, 2·10⁵]; 10⁶ | 5.766 > 5.384; sup 1.6408; sup 0.654; constant term 0.478901 vs γ² − 2γ₁ = 0.478810 | false on (0,1) | R05 |
| 5.5 Levin–Fainleib | g = μ²/d | A = Σ log p/p² = 0.49309; C = 6/π² | consistent | none |
| 6.1–6.5 | f = 1 at y = 3; f = τ at x = 2; d = 2, x = 4 | 11/6 ≤ 2; 3 ≤ 4; 3 ≤ 4 ≤ 6 | sound | R15 (6.3, 6.4 Checks) |
| 7.1 squarefree | real x ≤ 1.1·10⁶ | \|R\| ≤ √x holds; √x/2 fails on [7, 8); R/√x ∈ [−0.152632, 0.679090]; integer minimum −0.1032287 at 380; 0.036580 at 351 115; −0.027772 at 441 353⁻; 0.1333 last fails at 1663 | three rows false | R06 |
| 7.2 Σμ²/n, Σμ²/φ (sample) | N < 1.1·10⁶ | S − c₆ log N ∈ [0.57862, 1.16546]; for N ≥ 1000, ∈ [1.04049, 1.04707]; Σμ²d^{−4/3} = 2.8041; c₀ uses 0.75537; C₂ uses 0.56996 | sound | R15 (j(6)) |
| 7.3 Riesel–Vaughan | product over p > 2 | ∏ = 1.51478 | consistent | R05, R13, R15 |
| 7.4 Δ | real x ≤ 2·10⁵ | max \|Δ\|/√x = 0.96069 at 12; 0.482 last fails at 1980; 0.397 fails at 5760⁻, 6720⁻, 7560⁻; last integer > 0.4√n is 5460; Δ(5559) = −0.705; Δ(9994) = −2.530 | 0.397 row false | R07 |
| 7.5 Piltz, τ₄, τ² (sample) | k ≤ 8 with x ≤ 3000; k ≤ 40 with x ≤ 60; 2·10⁵ | 0 violations of either Bordellès form; τ₄ last fails at 192; τ² at 432 and 6; Cully-Hugill–Trudgian remainder 8153 ≪ 517 162; C₃ = 0.98147, C₄ = 0.27278 | sound | none |
| 7.6 2^ω (sample) | integers ≤ 10⁶ | 0 violations of either Trudgian bound or either Cipu bound; x = 10: 5.3913 ≤ 6.7441; 10⁵: 56.7584 ≤ 56.8298; v = 1.39476 | true; route needs R05 | R05 |
| 7.7 totient | n < 10⁶ and n < 10⁵ | 0 violations; x = 10: 6.2238 ≤ 9.3819; x = 41: 14 751 ≤ 18 768.6 | true; route overshoots | R15 |
| 8.1 Mertens product (headline) | x < 3·10⁵, both ends of each step | 0 violations of either pair; at 286 the route gives 0.019139 > 0.015509 | true; route short | R12 |
| 8.2 tilted products | ε = ±1 | γ(−1) = −0.3157; e^{γ(1)+B} = 1.0827 vs (6/π²)e^γ = 1.0828 | consistent | none |
| 8.3 progressions (sample) | q = 1, 2, 4 | (1 − 1/5)^{−1} = 1.25 vs (log 5)^{1/2} = 1.2686 | constants unstated | R13, R15 |
| 9.1 Robin (headline, sample) | primorials k = 7…10 | ω·log log n/log n = 1.371916, 1.381461, 1.384013, 1.380022, all ≤ 1.3841 | sound | none |
| 9.2 Nicolas–Robin, Teo (headline, sample) | the maximisers | f₂ = 1.5379399, f₃ = 1.5914094, f₄ = 1.6337288, f₅ = 1.6714353 | exponents valid | R15 (typo) |
| 9.3 Ivić, Nicolas, Eum–Koo | n < 1.1·10⁶ | Ivić: max σ/(n log log n) = 2.56344 < 2.59; σ* 0 violations; Nicolas (6), (7) 0 violations for n ≥ 2; σ(21) = 32 > 31.2314 | Eum–Koo false at 21 | R08 |

## Verified sound
- **Dependency gate** (run on the design README):

      candidate: ExplicitMultiplicativeFunctions is not in the merge order yet; checked as if placed after ProbabilisticAndMetricNumberTheory (the intake inserts it when its design is accepted)
      depcheck: 240 roadmaps, 2348 edges, 0 problem(s)

  There is no UPWARD or CYCLE line. The gate does not read `## Downstream consumers`; R01 is the cycle it misses.
- **Sampled locators** (all 15 targets read in the cached text):
  - 0.1: `balazard2012` 87–91, 296–314; `ramare2015mc` 284–285 (optimum m̌(30)).
  - 1.1: `balazard2012` 81–109, 146–201, 303–328, 424–472; `ramare2015mc` 450–458; `ramare2013aa` 696–704, 728–747.
  - 1.2: `macleod1967` 24–29; `macleod1969errata` 14–17; `costaPereira1989` 793–803.
  - 1.5: `ramare2013aa` 50–65, 171–198, 203–276, 349–480, 480–598, 600–684, 696–725.
  - 2.2: `ramare2015mc` 91–107; `balazard2012` 318–356, 444–472; `ramare2013aa` 750–759.
  - 2.3: `ramare2015mc` 116–152, 459–480; `bordelles2015` 60–77.
  - 2.4: `ramare2015mc` 248–325, 398–432; `ramare2014aa` 74–81; `bordelles2015` 84–100.
  - 3.2: `ramare2015corr` 13–32; `ramare2015mc` 155–190.
  - 3.3: `ramare2015mc` 278–296; `ramare2013facm` 21–64.
  - 7.2: `ramare2016mc` 436–466; `ramare2019bcp` 83–128, 179–225; `akhileshRamare2017` 78–125.
  - 7.5: `cullyHugillTrudgian2021` 55–79, 118–135, 222–242.
  - 7.6: `trudgian2015` 415–440; `cipu2015` 615–654.
  - 9.1: `robin1983aa` 36–48.
  - 9.2: `nicolasRobin1983` 10–15, 155–172; `teo2026` 98–118, 1793–1925.

  Theorem numbers and hypotheses match, apart from R04–R07 and R16.
- **Locators outside the sample:** `berkaneBordellesRamare2012` 1–80, 178–200; `moserMacLeod1966` 8–15, 76–84; `ivic1977` 15–55; `elMarraki1995` 222–292; `hurst2018` 420–426; `tao2010` 108–118; `nicolas2008` 54–68.
- **Author's corrections confirmed by computation or derivation:**
  - Ramaré 2015's rows 1/20, 1/65 and 1/100.
  - Lemma 3.2's coefficient 5 − 4γ.
  - Berkane–Bordellès–Ramaré's constant γ² − 2γ₁.
  - The weighted variant's coefficient 2AH(0).
  - MacLeod's ≤ (equality at n = 199).
  - Teo's exponents 1.538 and 1.5915.
  - ψ̃ at x = 23.
  - El Marraki's thresholds 5 and 685.
- **Pinned Mathlib:** 57 declarations opened. Examples:
  - `NumberTheory/ArithmeticFunction/Moebius.lean:177` `moebius_mul_coe_zeta`.
  - `NumberTheory/Chebyshev.lean:70, 77, 191, 485` (`psi`, `theta`, `theta_le_log4_mul_x`, `psi_le_const_mul_self`).
  - `NumberTheory/AbelSummation.lean:128`.
  - `NumberTheory/Harmonic/EulerMascheroni.lean:50, 82, 159–174`. Note `eulerMascheroniSeq n = H_n − log(n+1)`, which is consistent with the 0.3 route.
  - `NumberTheory/LSeries/Nonvanishing.lean:404, 412`.
  - `NumberTheory/EulerProduct/Basic.lean:175, 367`.
  - `NumberTheory/SmoothNumbers.lean:45, 197, 241`.

  All exist.
- **Pinned Tau Ceti:** 16 declarations opened. All exist, but two are attributed to the wrong file (R16). Examples: `LFunctions/Mertens.lean:545, 552, 564`, `ArithmeticFunction/DivisorBounds.lean:52`, `SumPrimeReciprocals.lean:57`.
- **Cross-roadmap citations resolved at the current heads:**
  - AnalyticNumberTheoryPartI §§0.5, 0.8, 0.11, 0.19, 0.21, 0.25, 0.26, 3.1, 3.7, 3.9, 3.12, 3.22, 3.22a, 3.22b, 3.23a, 3.35 and 3.35a.
  - SieveMethodsAndPrimePatterns §0.5 (`HasLogSieveDimension`) and §1.1.
  - ProbabilisticAndMetricNumberTheory Layer 3: the Rankin-type bound is in §3.7.
  - ComputationalNumberTheory §4.17a (`digamma_series_remainder`).
  - ZerosOfLFunctions Layer 9, *AllOnCriticalLine* (main, README line 1619).

  All exist and say what the README cites them for, except R01 and R09.
- **Gaps.** All nine slugs agree between README and plan.json. Every supplier is named (ExplicitPrimeCounting), and its target lists T2.1, T2.2, T2.0, T3.1–T3.3 and T4.2. Precision and minimality issues are in R10.
- **Ownership** was checked by object with `roadmaps grep` on main and at the heads of all 458 open roadmap pull requests. Queries: 4345, Balazard, Levin, Meissel, 1.3841, superior highly composite, Berkane / 0.961, Piltz, unitary divisor, Stieltjes, Daboussi, Hall–Tenenbaum, van Lint, Moser / 0.1333, Cully, Tao / Gram, MacLeod, Mertens function, 6/π², 2^ω, cardDistinctFactors, totient sums, e^γ log, μ(n)/n, harmonicRemainder, σ(n)/n, Ramaré. The only overlaps are AnalyticNumberTheoryPartI §§3.22a, 3.22b and 3.23a (R09). ArithmeticStatisticsPartI §0.6 (squarefree numbers in progressions, `O_q(√X)`) is qualitative and does not overlap. At the pins, Mathlib and Tau Ceti have no Möbius summatory function, no Stieltjes γ₁ and no unitary divisor sum.
- **Principles.** No copied passages, no algorithms (every Prop is a statement), no re-planned roadmap. No set_option or Lean code, since this is a design.
- **Headline theorems.** Tao's |m_S| ≤ 1; Balazard's inequality; Ramaré's transfer and its 0.0130/0.118 instance; the comparison theorem with the τ/n model; the explicit Mertens product; Robin's ω bound; Nicolas–Robin's τ bound. All are statable at the pins with the real-bodied carriers of Layer 0, once R05 (the model's range) and R13 (the Props' content) are repaired.
- **Elaboration and padding probe.** There is no Suggested.lean at the design stage. Elaboration is not available: this lane does not elaborate.

## Not verifiable
- **Uncertified sources** (paywalled, settled in the manifest, cited by locator only): `rosserSchoenfeld1962`, `dusart2018`, `eumKoo2015`, `cohenDressElMarraki2007`, `dressElMarraki1993`, `dress1993`, `kotnikVanDeLune2004`, `granvilleRamare1996`, `davenport1937`, `deCamargo2025`, `ramare2009`, `hallTenenbaum1988`, `bordelles2002`, `bordelles2005`, `bordelles2012`, `durasNicolasRobin1999`, `robin1983thesis`, `cohenDress1988`, `elMarraki1996`, `rieselVaughan1983`, `trevino2015jnt`. For 8.1, 8.3, 9.3 (Eum–Koo), 7.3 and 7.5 (Bordellès), only the README's statements were tested numerically.
- **`vanlalngaia2017`.** The cached text is font-garbled. Theorems 4, 5 and 9 and Corollary 1 were not read: 8.2's 0.841 and its condition |ε| < 2, and the small-range form in `gap:psi-tilde-explicit`.
- **`ramare1995` and `elMarraki1995`.** The cached text has no displayed formulas. Lemma 3.2's statement, Lemma 3.3's constants and El Marraki's constants were checked only through restatements (`trudgian2015` 433–440, `bordelles2015` 64–66) and by computation.
- **`vanLintRichert1965` and `costaPereira1989`.** The OCR text is largely illegible at §1 (statement 6.5) and at Theorem 5's inputs (the README's claim that gaps psi-relative-large and psi-initial-range are Costa Pereira's inputs).
- **Not opened:** the rest of `daboussiRivat2001`, `kreminski2003` and `bermentRamare2012`, which were outside the sample.

## Source issues
- **Error** in ramare2015mc at Theorem 1.5, p. 1361 (and the corrigendum's version, ramare2015corr §1, p. 2383): the source says `|m̌(x) − 1| log x ≤ 0.213` for every x ≥ 1. It should say x ≥ 2: on [1, 2) the left side is (1 − log x) log x, which reaches 1/4 at x = √e. Affects a stated result.
- **Error** in ramare2015mc at Theorem 1.2 and Corollary 1.3, p. 1361: the source says `(log x)|m| ≤ 1/65` from 60 298, ≤ 1/20 from 1426, and `|m| ≤ 1/100` from 694. It should say from 96 018, 3355 and 1419 respectively (last violations computed at 96 017, 3354 and 1418). Affects a stated result.
- **Misprint** in ramare2015mc at Lemma 3.2, p. 1369: the source gives the coefficient of x^{−2} as 6 − 4γ. It should be 5 − 4γ, which follows from the proof's own identity (line 661) and (2.1), and which makes the identity hold at x = 1. Affects a stated result.
- **Misprint** in ramare2015mc at (1.7), p. 1364: the source gives the value of |m₂(10)| as 31/105. It should be 34/105, the only value consistent with "≥ 0.260·2/log 5" on the same line. Affects nothing.
- **Error** in berkaneBordellesRamare2012 at Corollary 2.2, p. 4 (HAL text): the source says the Σ τ(n)/n expansion holds for all t > 0. It should say t ≥ 1: at t = 0.01 the remainder is 5.766 > 5.384, and on (0, 1) the constant 1.641 is needed. Affects a stated result.
- **Misprint** in berkaneBordellesRamare2012 at Corollary 2.2, p. 4: the source gives the constant term as γ² − γ₁. It should be γ² − 2γ₁, as the Laurent expansion of ζ² and the sum at 10⁶ confirm. Affects a stated result.
- **Error** in berkaneBordellesRamare2012 at Theorem 1.1, p. 1 of the HAL text (p. 1025 of the journal): the source says `|Δ(x)| ≤ 0.397√x` for x ≥ 5560, and sharpness at x = 5559. It should say natural x ≥ 5560: for real x it fails just below 7560, and Δ(5559) = −0.705. Affects a stated result.
- **Error** in berkaneBordellesRamare2012 at Theorem 1.2, p. 2: the source says `|Δ(9994)| > 0.80 x^{1/3} log x`. It should say Δ(9994) = −2.53, and the 0.764 bound holds on [5, 2·10⁵]. Affects nothing.
- **Error** in cipu2015 at Lemma 4.2, p. 214: the source says (a) −0.103229√x ≤ P(x) for real x ≥ 1, and (c) |P| ≤ 0.036438√x for x ≥ 82 005. It should be: (a) for integers only (it fails at x = 1.9); (c) is false at x = 351 115, where |P|/√x = 0.036580. Affects a stated result.
- **Error** in ramare2019bcp at Theorem 1.1, p. 2: the source says `|R(D)| ≤ 0.1333√D` from D ≥ 1004. It should say from 1664, since it fails at D = 1663. Affects a stated result.
- **Error** in macleod1969errata at statement (5), p. 99: the source says the strict inequality `|M(x)| < (x + 1)/80 + 11/2`. It should be ≤, since equality holds at x = 199 (|M(199)| = 8). Affects a stated result.
- **Error** in ramare2013aa at Lemma 4.5, p. 6: the source says the `0.0067/log x` estimate for ψ̃ holds from x = 23. It should say from 1 520 000 (Vanlalngaia); at x = 23 the error is 0.0529, against 0.00214 allowed. Affects the proof of Lemma 6.1.
- **Gap** in ramare2013aa in the proof of Theorem 1.1, p. 14: the source adds the boundary value −3.48 with its sign inside a bound for |M(D)|. It should use +3.48. The result is harmless, being absorbed by −0.0260D₀/log²D₀ = −263.8. Affects the proof.
- **Misprint** in ramare2013aa at (7.1), p. 11: the source gives the constant as +2γ. It should be −2γ, by (3.4). Affects nothing.
- **Misprint** in teo2026 at the introduction, p. 3: the source gives the exponents 1.5379 and 1.5914 with equality at the maximisers. They should be 1.538 and 1.5915, since the maxima are 1.53794 and 1.59141. Affects a stated result.
- **Gap** in trudgian2015 at Lemma 13, p. 10: the source applies Ramaré's Lemma 3.2 with the D = 1.16 model, which that lemma needs on (0, 1). Correct D there is 1.641, so the constants 3.253 and 8.14 are not justified; the bounds themselves hold at every integer ≤ 10⁶. Affects the proof.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "e34f3d06fac5524a93642c42d9251ad1e90b5e46", "job": "REV-DESIGN-ExplicitMultiplicativeFunctions", "model": "claude-opus-5-5", "worker": "chris-x26"} -->
