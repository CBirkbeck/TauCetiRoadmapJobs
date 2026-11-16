<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13026#issuecomment-6903570891 -->
Review (claude) of 5088635

Verdict: needs_changes

1. **F01** (P2) "partially proper" in §12.1 is not the notion of the supplier it cites

   **Location.** `packages/MotivesAndAlgebraicCyclesPartII/README.md:1387`: "the essential image of `b^*` consists of the partially proper v-stacks, characterized by independence of the ring of integral elements `R⁺`"; API at `:1392`; *Needs* at `:1403`: "DiamondEtaleCohomology §C4.5 (partially proper maps)".

   **Claim.** The essential image of `b^*` is the class of v-stacks that are partially proper in the sense of DiamondEtaleCohomology §C4.5.

   **Witness.** DiamondEtaleCohomology §C4.5 (its line 1240) defines partial properness "by separatedness together with extension", equivalently `0`-truncated, quasiseparated, unique lifts. For `Y = ∗/(ℤ/2)` (the README's own §1.5 Check), `(b^* Y)(R, R⁺) = Y(R)` does not depend on `R⁺`, but `b^* Y` is not `0`-truncated.

   **Exact repair.** State the class this roadmap means and its relation to the supplier's.

   1. In §12.1, replace the quoted clause by: "the essential image of `b^*` consists of the v-stacks `X` over `N` for which `X(R, R⁺) → X(R, R°)` is an equivalence for every perfectoid Huber pair `(R, R⁺)` with a chosen norm; these are called *partially proper* in this layer, as in Scholze, Corollary 12.2. For a separated `X` this is partial properness of `X → ∗` in the sense of DiamondEtaleCohomology §C4.5; that notion requires separatedness, so it is strictly narrower".
   2. Replace the second API bullet by: "The essential image of `b^*` is the class of v-stacks over `N` whose values do not depend on `R⁺`; its separated members are the partially proper v-stacks of DiamondEtaleCohomology §C4.5."
   3. Add to the Checks of §12.1: "For the classifying stack `Y = ∗/(ℤ/2)`, `(b^* Y)(R, R⁺)` is the groupoid of `ℤ/2`-torsors on `Marc(R)` for every `R⁺`, so `b^* Y` lies in the essential image; it is not `0`-truncated, hence not partially proper in the sense of DiamondEtaleCohomology §C4.5. A statement of the essential image through that notion alone loses it."

   **Repair tested.** `Y = ∗/(ℤ/2)`: in the class by item 1, excluded from §C4.5's, and item 1 no longer identifies the two. `Y = Marc(C)` for `C` the completed algebraic closure of `𝔽_p((t))`: `b^* Y = Spd(C, O_C)`, separated and independent of `R⁺`, partially proper in both senses (R02 computes this).

2. **F02** (P2) the third Check of §12.1 is false over a general perfectoid field

   **Location.** `packages/MotivesAndAlgebraicCyclesPartII/README.md:1399`: "An already partially proper separated `X`, such as the open unit disc `{|T| < 1}` over a perfectoid field …, is unchanged by `b^* a^*`; the closed unit disc … `b^* a^*` adds the boundary point".

   **Claim.** For every perfectoid field `K` the open unit disc over `Spa(K, O_K)` is partially proper, and over every `C` the closed disc gains exactly one point.

   **Witness.** `K` = completed perfection of `𝔽_p(x)((t))`, `K⁺ ⊊ O_K` over the `x`-adic valuation ring of the residue field: the identity `(K, O_K)`-point has no extension over `(K, K⁺)`. DiamondEtaleCohomology §C4.5 Check (its line 1254): partially proper "iff the residue field of `C` is algebraic over `𝔽_p`".

   **Computation.** `X(R, R°) = {K → R continuous, T ∈ R°°}`, so `b^* a^* X` is the open disc over `Spa(K, K⁺_min)`, with `K⁺_min` the integral closure of `𝔽_p + K°°`. This equals `X` exactly when `K⁺_min = O_K`, that is when the residue field is algebraic over `𝔽_p`. Over a `C` with transcendental residue field, `b^* a^*` of the closed disc also adds the discs over the higher-rank points of `Spa(C, C⁺_min)`, not one point.

   **Exact repair.** Replace the bullet by:

   "Partial properness is a condition on `X → ∗`, so it involves the base field. Let `C` be the completed algebraic closure of `𝔽_p((t))`, with residue field `𝔽̄_p`. Every open integrally closed `R⁺ ⊂ R°` contains the integral closure of `𝔽_p + R°°`, hence the image of `O_C = 𝔽̄_p + C_{<1}` under every continuous `C → R`; so `Spa(C, O_C)` and the open unit disc `{|T| < 1}` over it (a union of closed discs of radius `< 1`; `T ∈ R°° ⊂ R⁺`) are partially proper and unchanged by `b^* a^*`. The closed unit disc `Spa(C⟨T⟩, O_C⟨T⟩)` is not: `b^* a^*` replaces `O_C⟨T⟩` by the integral closure of `O_C + C⟨T⟩°°` and adds the one rank-two point of its canonical compactification. Over a perfectoid field `K` whose residue field is not algebraic over `𝔽_p`, such as the completed perfection of `𝔽_p(x)((t))`, already `Spa(K, O_K)` is not partially proper: for the valuation ring `K⁺ ⊊ O_K` lying over the `x`-adic valuation ring of the residue field, the identity is a point over `(K, O_K)` with no extension over `(K, K⁺)`, and `b^* a^* Spa(K, O_K) = Spa(K, K⁺_min)`, `K⁺_min` the integral closure of `𝔽_p + K°°`."

   **Repair tested.** On the refuting `K`: the new text asserts non-properness and gives `Spa(K, K⁺_min) ≠ Spa(K, O_K)`, as computed. On `C` with residue field `𝔽̄_p`: `O_C ⊂ R⁺` always, so the open disc has the same `(R, R⁺)`- and `(R, R°)`-points; the closed disc gains the single rank-two point at the Gauss point. Both agree with the Checks of DiamondEtaleCohomology §C4.5.

3. **F03** (P2) one sentence of §1.8 follows the source's sentence clause by clause

   **Location.** `packages/MotivesAndAlgebraicCyclesPartII/README.md:360`: "No étale site of a Banach ring is used: invariance under change of geometric Banach point is what singles out the étale sheaves among the finitary arc-sheaves".

   **Claim.** The sentence is the roadmap's own wording.

   **Witness.** Scholze lines 1203–1205 (p. 28): the same three clauses in the same order (no étale site defined; the invariance condition; singling out étale sheaves in the finitary arc-sheaves), with "algebraically closed field" exchanged for "geometric Banach point". Longest shared run: 4 consecutive words; 11 of the source's content words recur in order.

   **Exact repair.** Replace the sentence by: "The definition uses the arc-site alone: its only test objects are the geometric Banach points over `X`, and it refers to no étale site of a Banach ring (Scholze, Remark 1.4, pp. 3–4, and the paragraph before Proposition 5.9, p. 28, state the same condition)."

   **Repair tested.** The replacement keeps both locators (Scholze lines 126–133 and 1203–1205 read) and shares no run of more than two words with either passage.

4. **F04** (P3) the DiamondsAndVStacks contract lists a section nothing consumes and omits one that two targets consume

   **Location.** `packages/MotivesAndAlgebraicCyclesPartII/README.md:103`: "DiamondsAndVStacks §D0.23 (`IsCutoffCardinal`), §D1.4 (strictly totally disconnected perfectoid spaces), §D2.7"; `:18`: "DiamondsAndVStacks, Layers D0, D2, D4 and D6".

   **Claim.** The contract lists exactly the sections consumed.

   **Witness.** `§D0.22` is in the *Needs* of §1.3 (`:304`) and §1.8 (`:377`) and in the Layer 1 *Dependencies* (`:385`), and not in the contract. `§D1.4` occurs at `:103` only; Scope names no Layer D1. The route of §12.3 uses its content ("each connected component is `Spa(C, C⁺)`").

   **Exact repair.**

   1. At `:103`, after "§D0.23 (`IsCutoffCardinal`)," insert "§D0.22 (sheaves on a profinite set as functors on its clopen subsets; stalk isomorphisms detect isomorphisms),".
   2. Add "DiamondsAndVStacks §D1.4 (connected components of strictly totally disconnected spaces)" to the *Needs* of §12.3 and "D1.4" to the Layer 12 *Dependencies*.
   3. At `:18`, write "Layers D0, D1, D2, D4 and D6" and add "strictly totally disconnected perfectoid spaces" to the list before it.

   **Repair tested.** DiamondsAndVStacks on main has `### D0.22 Ordinary sheaves on profinite sets` (its line 1730, with the stalk statement) and `### D1.4 Strictly totally disconnected perfectoid spaces` (its line 2449, with the component description). After the edit every `D`-section in a *Needs* line is in the contract and conversely.

5. **F05** (P3) a locator in the References and the manifest that no statement cites

   **Location.** `packages/MotivesAndAlgebraicCyclesPartII/README.md:1493`: "Theorem 5.5.3 (p. 54)"; `packages/MotivesAndAlgebraicCyclesPartII/sources.toml:64`, the same locator.

   **Claim.** Every listed locator supports a statement of the roadmap.

   **Witness.** A search of the README for `5.5.3` finds line 1493 only. CD lines 2472–2475 (Theorem 5.5.3, p. 54) concern coefficient rings of positive characteristic and effective h-motives; §10.2 uses Corollaries 5.5.5 and 5.5.7, Remark 5.5.8, Theorems 4.5.2 and 5.2.2 and Corollary 4.5.3.

   **Exact repair.** Delete "Theorem 5.5.3 (p. 54), " from `README.md:1493` and "Theorem 5.5.3 (p. 54); " from the `locator` of the `CD` entry in `sources.toml`.

   **Repair tested.** The remaining CD locators are the ten the body cites, each read at its line (table below).

Five findings: three P2 and two P3. The three findings of round 9 are repaired, and the passages the repair added (§1.8, the coefficient conventions, §§4.8, 8.1, 10.1, 12.2, 12.3) survive the adversarial pass, except for one sentence of §1.8 that tracks the source's wording (R03). R01 and R02 are in §12.1, a sampled target that no earlier table covered with computed values. No file of the package was changed by this review.

## Verified sound

### Previous findings (round 9)

| Finding | Repaired passage | Assessment |
|---|---|---|
| F01 (P2): étale category of an arc-stack undefined | README:360: "call `M ∈ Dfin(X, Λ)` *étale* when, for every extension `C ⊂ C′` of geometric Banach points over `X` … `M(C) → M(C′)` is an equivalence"; README:702: "so `Deff_mot(X, ℤ/n) = Det(X, ℤ/n)`"; README:34 (coefficients); README:1425: "`D_ét(X, ℤ/n)` is the étale derived ∞-category of the small v-stack `X`" | Repaired. Placing the definition in Layer 1 is sound: §2.4 uses it. |
| F02 (P3): missing JacobianChallenge declaration | README:99: "§D.5 `isRepresentable_picZeroSets` … §D.8 `jacobianScheme`, its representing object … §E.7 `multiplication_isogeny`" | Repaired. JacobianChallenge on main: lines 986, 1069, 1291; headings D.2, D.5, D.8, E.7 at 862, 974, 1064, 1288. |
| F03 (P3): universal property without a target | README:1145: "For every presentably symmetric monoidal `ℤ`-linear stable ∞-category `𝒟`, restriction along `X ↦ M(X)` identifies …"; README:967 likewise for `Dmot(X)` | Repaired, with the additivity clause. |

No finding of the repair report was marked not actionable. No maintainer note was left.

**Repair-pattern audit.** F01 (an object named and not defined, or defined by a supplier for another carrier): reread every category and every supplier notion used in Layers 0–12; found R01, where "partially proper" is the supplier's word with another meaning. F02 (a cited name that does not exist): every backticked supplier name resolved (lists below). F03 (a universal property without quantifier): §§0.3, 2.2, 2.7, 3.2, 8.1, 10.1 each name source, target and test class.

### Principles, shape and policy

- 13 layers, 83 *Needs* lines, 53 Checks blocks, 32 API blocks, 13 *Examples* and 13 *Dependencies*. No *Needs* line cites a later section of this roadmap.
- Searches for process vocabulary, pull-request numbers, LaTeX delimiters, HTML anchors, machine paths and `lemma` in `README.md` and `Suggested.lean`: no hit.
- No route-specific shortcut, algorithm, sorry'd data or `set_option`. The README does not say it follows a source; no layer is named after a source section.

### Source sample (15 seeded targets, read at the locator)

The author flags no locator as unverified other than BLR (uncertified, settled).

| Target | Lines read | Result |
|---|---|---|
| 0.8 | Scholze 1095 (Ex. 4.26, p. 26), 1286 (Lemma 5.11, p. 30), 2196–2202 (Cor. 9.6, p. 52) | Agrees; the construction is the README's own. |
| 2.4 | Scholze 1203–1216 (Prop. 5.9, pp. 28–29) | Agrees; `n ≥ 1` is the README's explicit addition. |
| 3.1 | Scholze 500–512 (§2.3, p. 12), 1365–1372 (p. 32) | Agrees. |
| 4.4 | Scholze 1575–1640 (Lemma 6.5 and proof, pp. 37–39) | Agrees; E1–E4 confirmed at lines 1601, 1621–1624, 1631, 1633. |
| 5.3 | Scholze 1707–1716 (Thm 7.1, Remark 7.2, pp. 40–41) | Agrees. |
| 7.2 | Scholze 1964–1968 (Prop. 8.7, p. 47) | Agrees. |
| 7.5 | Scholze 195–197 (Thm 1.7(iv), p. 5), 1970–1973 (Prop. 8.8, p. 47), 2066–2090 (Thm 8.13, pp. 49–50) | Agrees. |
| 8.5 | Scholze 2181–2202 (construction, Props 9.4–9.5, Cor. 9.6, p. 52) | Agrees; the restriction to `P_B` is correction E7. |
| 9.6 | Scholze 2263–2272 (Prop. 10.3, p. 54) | Agrees. |
| 10.2 | CD 1896–1911 (Thm 4.5.2, Cor. 4.5.3, p. 41), 2521–2529 (Cor. 5.5.5, p. 55), 2579–2606 (Cor. 5.5.7, Remark 5.5.8, pp. 56–57); Bachmann 553–554 (Lemma 3.10, p. 10), 616, 624 (Cors 4.3–4.4), 716 (Thm 5.1, p. 13), 845–846 (Cor. 6.2, p. 15), 861–870, 900 (Lemmas 6.3–6.4, Thm 6.5, p. 16), 920–935 (Thms 6.6, 7.1, p. 17) | Agrees, hypotheses included (`1/p ∈ S`, locally `p`-étale finite; characteristic zero or `2` invertible in 5.5.7). |
| 10.4 | CD 2048–2055 (Thm 5.2.2, (5.2.2.a), p. 44), 1896–1911 | Agrees. |
| 10.5 | Scholze 2395–2400 (Thm 11.1, p. 57), 2405–2419 | Agrees; the unshifted formula at 2399 is correction E6. |
| 10.6 | Scholze 2401–2404 (Remark 11.2, p. 57), 261 (Prop. 1.13, p. 7) | Agrees. |
| 12.1 | Scholze 2587–2621 (Prop. 12.1, Cor. 12.2, pp. 62–63) | The statement agrees; the README's citation of the supplier's notion and its third Check do not: R01, R02. |
| 12.4 | Scholze 2653–2667 (Prop. 12.4, pp. 63–64) | Agrees. |

Also read: Scholze 100–135 (small arc-stacks, Remark 1.4), 182–200, 2040–2045, 2091–2110 (Def. 9.1), 2622–2652 (norm-free variant, Prop. 12.3).

### Adversarial table

Values computed in this round.

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| §0.8 free ring `ℤ⟨T⟩_r` | `B` arbitrary, `m ∈ ℤ` | `|m·1_B| ≤ |m|·|1| ≤ |m|`, so `|Σ a_ν b^ν| ≤ Σ |a_ν| r^{|ν|}` | Retain. |
| §0.8 sum norm | `(1 + T)²`, `r = 1` | supremum `1` then `2 > 1²`; sum `2`, `4 ≤ 4` | Retain. |
| §0.8 strict values | `K[ε]/(ε²)`; doubled origin | `|b|² = |b²| = 0`; `T₁ = T₂ = ϖⁿ → 0` outside `{T₁ = T₂ ≠ 0}` | Retain. |
| §0.8 general `Y` | two affine opens `V, V′` | a map from strict `B` factors through affines of `V ∩ V′` on a finite clopen partition, so the colimit over all affine opens has the stated values | Retain. |
| §1.8 stalk on strict `A` | `x ∈ M(A)` | `inf_U sup_U |f| = |f(x)|`; `A → K(x)` onto, so the completed colimit of the `A_U` is `K(x)` | Retain. |
| §1.8 Check 2 | `C ⊂ C′` at the Gauss point; `ℤ/ℓ` in characteristic `ℓ` | residue of `T` transcendental, not in `k^×`; Artin–Schreier class of `T` nonzero on the disc, `H¹(C) = 0` | Retain. |
| §1.8 Check 4 | `ℂ` with `|·|^α`; nonarchimedean `C` | `(1/2)^α > 1/2` for `α < 1`; `|1/2|_C ≥ 1 > 1/2` | Retain. |
| §2.4 | `n = 1`; `ℓ` the characteristic | zero category; `|ℓ| = 0 < 1`, excluded | Retain. |
| §3.1 | `−1` in `ℚ₂`, `ℚ₃`; `‖u‖ ≠ 1` | `‖−2‖ = 1/2`; `1`; `‖u − 1‖ = max(‖u‖, 1) ≥ 1` | Retain. |
| §3.5 criterion | `T² + T/2 + 4` over `ℂ₂` | valuations `(2, −1, 0)`, slopes `−3, 1`, root norms `1/8, 2`; `min(4, 1) = 1 < 2` | Retain. |
| §4.4 | disc; annulus | `d = 0`: `ℚ`; `d = 1`: `ℚ ⊕ Ḡ_m ⊗ ℚ`, as §3.5 | Retain. |
| §4.4 route | `|T − a_i| ≤ r₁` | other factors have norm `|a_i − a_j| = 1`; product `≤ r₁^{k_i}` | Retain. |
| §4.8 third clause | `A = ℂ`, `p = 2`; `fib(ℤ → ℤ[1/p])` | both sides `{M : M ⊗ ℤ[1/2] = 0}` in `D(ℤ)`; `colim_m (ℤ/p^m)[−1]` | Retain. |
| §5.3 headline | complex point; `X = ∅` | `ℤ(1) = ℤ`, identity; zero category | Retain. |
| §6.3 headline | eigenvalues `1, 2, 4` | denominators `3, −2, 6`; projectors `(1,0,0)`, `(0,1,0)`, `(0,0,1)` | Retain. |
| §7.2 | `g₀ + ta`, `|t| ≤ 1`, `|a| < 1` | `g₀⁻¹(g₀ + ta) = 1 + g₀⁻¹ta`, entries of norm `< 1`, invertible | Retain. |
| §7.5 | `A = C`; fibre instead of cofibre | cofibre `π₀ = ℤ`; fibre `π₀ = coker(K₁(C_{<1}) → C^×) = C^×/(1 + C_{<1})` | Retain. |
| §7.5 route | smooth `R`, completion `R^` | `cofib(K(R^) → K(R^[1/π])) = ΣK(R on π) = cofib(K(R) → K(R[1/π]))`, so the two pushouts over `K(R ⊗ k)` agree | Retain. |
| §7.6 headline | residue characteristic `0`; `ℂ_p` | `p = 1`, nothing inverted; `π₀ = ℤ[1/p]` | Retain. |
| §8.5 negative control | closed disc | `f_* f^! ℤ` would be `ℤ(1)[2]`, dual of `f_* ℤ = ℤ`; `ℤ(1)[2] ⊗ ℚ = (Ḡ_m ⊗ ℚ)[1] ≠ ℚ` | Retain. |
| §9.6 headline | `[0, 1]` | `RΓ(j_! ℤ) = RΓ_c((0,1]) = 0`, `j_! ℤ ≠ 0`; compact = dualizable = constant perfect | Retain. |
| §10.2 | `k = 𝔽̄₃`, `n = 2`; `n = 3` | `μ₂ = ℤ/2`, `k^×/k^{×2} = 0`; `DM_et(k, ℤ/3) = 0`, `x³ − x = t` has no polynomial solution | Retain. |
| §10.4 | `ℙ¹`, `j = 1`; `Spec k`, `j = 0` | `q = −i` in (5.2.2.a): `π_{−2} = K₀^{(1)} = ℚ`, `π₀ = K₂^{(1)} = H⁰(ℚ(1)) = 0`; `π₀ = ℚ` | Retain. |
| §10.5 | `k = 𝔽̄_p`, `X` a point | `ℚ[0]` for `j = 0`, `0` otherwise | Retain. |
| §10.6 headline | `ℙ¹_k` | `ℤ ⊕ ℤ(1)[2]` on both sides | Retain. |
| §11.8 example | `A = ℚ ⊕ ℚ(1)` | `N` maps `ℚ` to `ℚ(1)(−1)`, kills `ℚ(1)`; `N ≠ 0`, `N² = 0` | Retain. |
| §12.1 essential image | `Y = ∗/(ℤ/2)` | `b^* Y` independent of `R⁺`, not `0`-truncated; supplier's notion requires separatedness | R01. |
| §12.1 Check 3 | `K` = completed perfection of `𝔽_p(x)((t))`; `C` with residue field `𝔽̄_p` | `K⁺ ⊊ O_K`, no extension of the identity; `b^* a^*` gives the disc over `Spa(K, K⁺_min)`. For `C`: `O_C = 𝔽̄_p + C_{<1} ⊂ R⁺`, unchanged | R02. |
| §12.2 categories | two norms on `R` | norms differ locally by `|·|^{s(x)}`; unit ball and geometric points unchanged, so ball invariance is norm-free | Retain. |
| §12.3 headline | constant sheaf; `j_!` from the rank-one point; `n = 1` | identity; `0 → ℤ/n` not an isomorphism; zero | Retain. |
| §12.3 stabilization | `n` prime to `p` | `ℤ/n(1) = μ_n`, arc-locally `ℤ/n`, invertible in `Deff_mot(Y, ℤ/n)` | Retain. |
| §12.4 | `X = Spa(C, O_C)` | both categories `D(ℤ/n)`, `R ∘ I = id` | Retain. |

For Layers 1–11 outside these rows, the rows of the round-9 table carry computed values and are relied on; the text they cover is unchanged apart from the repairs checked above.

### Pinned libraries

Content checkout at `623d55d`. Opened at the pin: Mathlib `GrothendieckTopology` (Sites/Grothendieck.lean:72), `NormedField` (Normed/Field/Basic.lean:155), `IsUltrametricDist` (Ultra/Basic.lean:47), `PowerSeries.IsRestricted.subring` (PowerSeries/Restricted.lean:90), `LocallyOfFinitePresentation` (:46), `Etale` (:39), `QuasiCompact` (:41), `Smooth` (:59), `AffineSpace` (:43), `Scheme` (:40), `AlgebraicGeometry.Proj` (ProjectiveSpectrum/Scheme.lean, module docstring :88), `continuousCohomology`, `SSet.Quasicategory`. Tau Ceti: `unitBallIdeal`, `mem_unitBallIdeal` (UnitBall.lean:90, 101), `norm_inverse_one_sub`, `norm_inverse_one_sub_sub_one`, `isUnit_unitClosedBall_of_norm_sub_one_lt` (:160, 171, 185), `Subring.unitClosedBall` (Ultra.lean), `PowerSeries.isPrincipalIdealRing_isRestricted_subring` (Weierstrass/Ideal.lean:115, `0 < c`), `cohomologicalDimensionAt` (CohomologicalDimension/Basic.lean:146), `cohomologicalDimensionAt_le_of_isClosed`, `strictCohomologicalDimensionAt_le_cohomologicalDimensionAt_add_one`, `AlgebraicGeometry.Smooth.exists_etale_affineSpace` (EtaleCoordinates.lean:98, target `𝔸(ULift (Fin n); S)`), `SymmetricAlgebra.projToSpec`, `instIsProperProjToSpec` (:115), `homogeneousSubmodule`, `projectiveLine`, `polynomialChartι`, `range_polynomialChartι_union_range_polynomialChartι`, `puncturedAffineSpace`, `PuncturedAffineSpace.homEquiv`, `ExactK0`, `StableGeneralLinearGroup`, `classGroupAddEquivLineBundleClass`.

Absence claims: no definition of a Berkovich spectrum of a Banach ring, an arc-topology or a K-theory spectrum in either library. Tau Ceti has the rank-at-most-one points of `Spa` of a polydisc (`TauCeti/AlgebraicGeometry/AdicSpace/Spa/RankLeOne.lean`), which is not the spectrum of a Banach ring; the docstring's claim stands.

### Headline theorems, padding and the Lean file

- `lake env lean` on `packages/MotivesAndAlgebraicCyclesPartII/Suggested.lean`, from the content checkout: exit 0, no output, no warning. The file is `import Mathlib`, one module docstring and an empty namespace.
- Headline theorems of the Summary: cancellation (§5.3); `Kmot` finitary with its Adams splitting (§§6.1, 6.3); the explicit K-cofibre (§7.6); torsion and tilting (§§4.8, 4.9, 8.3); six operations and proper base change (§§8.5, 9.4); rigidity (§§9.1, 9.6); the étale comparison (§10.6); the monodromy equivalence (§11.8); the overconvergent comparison (§12.3). Each is named in the docstring with the missing carrier, and none is statable at the pins.
- The one-tactic probe and the `#check @name` audit have no input: zero declarations; nothing compared, nothing changed.
- No backticked name in the README is presented as a Lean declaration of this roadmap; the resolver reports none missing.

### Duplication, suppliers and order

- Every cited supplier section resolved as a heading at the supplier's present text (main at `623d55d`, or the open head): TropicalAndBerkovichArithmetic (26 of 26), EnhancedDerivedSheaves (10 sections, the five E5 layers, 21 names), AnalyticStacks (7), GeneralAlgebraicKTheory (7), GeneralAlgebraicKTheoryPartII §1.2, SchemeKTheoryOperations (8 and Layer 5), KTheoryFiniteLocalFields (4), RefinedTraceMethods (2), JacobianChallenge (4 and 5 names), PerfectoidSpaces (9), DiamondsAndVStacks (8), DiamondEtaleCohomology (9), DiamondSixOperations (3), MotivesAndAlgebraicCycles (10), MotivicEtaleKTheory §2.2, AdicCoefficientsAndComparisons (`smoothAlterationPair`), ProfiniteCohomology §10.2 and Layers 10–11, SchemeAndStackFoundations §2.16, EtaleCohomologyFoundations (3), CharacteristicClasses §C5, AnabelianGeometryAndNonabelianChabauty (target at its line 4008). Contract against *Needs*: R04.
- Declared gaps: the nine slugs agree between the README and `design/plan.json`, each with supplier and section. None is provided today: SchemeKTheoryOperations has no homotopy K-theory and no valuation-ring statement; TropicalAndBerkovichArithmetic has no descent of finite projective modules; EnhancedDerivedSheaves has no Breen–Deligne resolution and no fracture square. Each gap concerns one object with its hypotheses.
- Ownership by object, with `roadmaps grep` over main and the 448 open heads: "arc-stack", "ball-invarian", `DM_et`, "Banach arc", "overconvergent étale", "integral étale motiv": no match outside this package. "Berkovich motiv" matches bibliography lines only. AnalyticStacks (its line 1302) names this roadmap as consumer of its §§0.4–0.6, 0.9–0.10, 1.1–1.5, the sections cited here.
- The overlap report lists no conflicting head, no dropped id, no revision-only id and no second copy.

Dependency check output:

```text
depcheck: 237 roadmaps, 2256 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. The roadmap is line 381 of the merge order.

Overlap check: read ArcTopologyAndDescent, AnalyticStacks, DiamondEtaleCohomology, EnhancedDerivedSheaves, VStackSheavesAndLisseCategories, DiamondsAndVStacks, AdicSpacesPartIV; nothing shared. DiamondEtaleCohomology owns `D_ét` of v-stacks and partial properness of separated maps (R01 keeps it the owner and states the wider class here); DiamondsAndVStacks owns sheaves on profinite sets (R04 cites it).

### Copyright and arrangement

- **Wording.** 24 passages set beside the sources at the locator: the 15 sampled targets, §1.8, the Conventions on small arc-stacks, §§8.1, 12.2, 12.3, §10.1 against CD and Bachmann, the route of §10.3, and the module docstring. One sentence tracks its source: R03. Elsewhere the longest shared runs are forced statements: 6 words in §4.4 against Scholze line 1576, 5 in §12.2 against line 2640, 5 in §9.6 against line 2266.
- **Arrangement.** Scholze has sections 2–12. Against the layers: `Layer 0 ↔ §§2–3`, `Layer 1 ↔ §4`, `Layers 2–3 ↔ §5`, `Layer 4 ↔ §6`, `Layer 5 ↔ §7 and Cors 8.1–8.2`, `Layers 6–7 ↔ §8`, `Layer 8 ↔ §9`, `Layer 9 ↔ §10`, `Layers 10–11 ↔ §11 with CD and Bachmann`, `Layer 12 ↔ §12`. Not one to one: three splits, one merge, one transfer, and §§0.8, 1.8, 2.7, 4.3, 10.2, 10.4 without counterpart. The *Dependencies* lines force `0 < 1 < … < 7` and `5 < 8 < 9 < 10 < 11`; Layers 6–7 and 8 are parallel.
- **Reuse.** No table, figure or list is taken over. The Lean file declares nothing.

Source independence: 24 passages compared with 3 sources (Scholze, CD, Bachmann), one sentence shared in structure (R03); largest share Scholze, 101 of 119 locators; contents compared with Scholze: independent.

## Not verifiable

- BLR §9.2: settled as uncertified; not read and not requested.
- The nine supplier gaps are contracts: their declaration, owner and present absence were checked, their truth was not.
- van der Put and Vakil were not reopened in this round; no sampled target cites them. Corrections E5, E8 and E9 were not recomputed against the source lines in this round (E5's arithmetic was).

## Source issues

- **Misprint** in Scholze at Lemma 6.5 and the first line of its proof, p. 37: the source says the complements are taken in the projective line over `A`; it should be over `C`; affects nothing.
- **Misprint** in Scholze at the proof of Lemma 6.5, p. 38: the source says the outer estimate holds for `|T| ≥ r₁ > 1` and bounds the inner product by `r₁ⁿ`; it should be `|T| ≥ r₂` and the bound `r₁^{k_i}`; affects the proof.
- **Misprint** in Scholze at the proof of Lemma 6.5, p. 38: the source says each annular domain contributes a degree factor of rank `e`; it should be rank `d`, giving `de` in total; affects nothing.
- **Misprint** in Scholze at the proof of Lemma 6.5, p. 38: the source says the ratio of nearby coordinates minus one has numerator `T₂ − T₁`; it should be `T₁ − T₂`; affects nothing.
- **Misprint** in Scholze at Theorem 11.1, p. 57: the source says the rationalized mapping object is the weight-`j` Adams piece of K-theory; it should be that piece shifted by `[−2j]`; affects a stated result.
- **Misprint** in Scholze at the proof of Theorem 11.1, p. 57: the source says the dual of the pushed-forward unit represents maps from the unit into `f_* M`; it should be into `f^* M`; affects nothing.

## For the human reviewers

- none

<!-- tauceti-roadmap-review {"agent": "claude", "head": "508863592577dda82c083cb4203315cc4e6c0bb6", "job": "REV-PKG-MotivesAndAlgebraicCyclesPartII~10", "model": "fable", "worker": "chris-x89"} -->
