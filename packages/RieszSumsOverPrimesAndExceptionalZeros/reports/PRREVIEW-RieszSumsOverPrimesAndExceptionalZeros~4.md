# Review of RieszSumsOverPrimesAndExceptionalZeros (pull request #2877 at cf3acf2)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/RieszSumsOverPrimesAndExceptionalZeros/`
**Verdict:** accepted

**Summary.** Accepted: no finding. The forms of the formal proof added at this head are each implied by the general statement beside them (the parameters were recomputed), the four new Lean statements say what 1.4i (c′), 1.7b (i)–(ii) and 2.9b (iv) (c′) say, and the new citations of ExplicitPrimeCounting and QuasiRiemannHypothesis resolve and give the identities claimed. There are three small corrections and one format note, none blocking: the effectivity of the repulsion constant still rests on a constant stated only to exist, the description was written for the previous head, and the Lean form of 1.4i (c′) is a two-line consequence of the Lean form of 1.4i (c). The standing of the formal proof as a source, which I could not read, is left to the human reviewers.

## C01 — The repulsion constant of 1.7b (i) is called effective, but 0.30b still states its constant only as existing, and the Lean docstring now says no constant is claimed effective

A reader who follows the effectivity claim to its inputs finds it asserted for the result and for neither input's statement. The Effectivity paragraph of 1.7b (line 677) says "The constant `c` of (i) is effective: its route uses 0.30b and 1.7a and no zero-free region", and step 5 takes `c = 1/(2CC′)`. The constant of 1.7a is explicit (`C = 1008` at `r = x₀ = 1/2`), but 0.30b (lines 40–42) reads "There is an absolute `C`", with no word on effectivity. This was C01 of the previous review and the text is unchanged.

This head adds a second place: `Suggested.lean` now states `deuring_heilbronn_repulsion`, and its module docstring (line 12) says "As in the README, the constants below are asserted to exist; none of them is claimed to be effective", while the README calls the `c` of (i) "absolute effective" (lines 5 and 511).

Either say in 0.30b that its `C` is effective (the growth bound, Jensen's bound and Landau's lemma involve no minimum over finitely many characters), or rest the claim on Bombieri 1987, Théorèmes 14 and 16, whose constants are stated to be effectively computable. In the docstring, "none of them is claimed to be effective here; the README says which are" would agree with both.

## C02 — The description describes the previous head: three Lean statements where there are seven, the repulsion "not stated", two suppliers missing, and an index comparison that no longer holds

A reader of the description is told the opposite of what the files contain in four places.

- "`Suggested.lean` states 3 headline theorems": the head declares seven theorems. Besides the three named, it states `norm_rieszRemainder_le_of_no_real_zero`, `deuring_heilbronn_repulsion`, `gallagher_primeCount_linnik_range` and `card_primes_norm_one_mod_shortInterval_ge_of_discr_eq_neg_prime`.
- "the Deuring–Heilbronn repulsion (1.7b (i)) are statable, but they are corollaries …, so they stay README targets": the head states the repulsion, and the docstring (lines 24–25) says so. Only 1.4g (b) stays a README target.
- "its only warnings are the three `sorry` declarations": there are seven.
- The Dependencies paragraph omits two suppliers this head adds: ExplicitPrimeCounting (on main; §§0.2, 0.7, 4.2 in 1.4i) and QuasiRiemannHypothesis (an open pull request; §5.3 in 1.4e, §3.2 in 2.9b (ii), §10.7 in the remarks of 1.4e and 1.4i). The second is a supplier that is still open and merges first.
- "The copies in #2881 (FiniteReductiveGroups) and #2883 … differ": at today's heads the family index `README.md` here is identical to the copies in #2885, #2878 and #2881; only #2883 differs (24 lines). This is what remains of C02 of the previous review.

The text that would be right: "states seven theorems: the three headlines, and beside them the forms of the formal proof 1.4i (c′) and 2.9b (iv) (c′), the repulsion 1.7b (i) and Gallagher's theorem 1.7b (ii); 1.4g (b) stays a README target"; add the two suppliers; and replace the list of index copies by the rule the next sentence already gives.

## C03 — As stated in Lean, 1.4i (c′) follows from 1.4i (c) in two lines, so it does not test the route that avoids the exclusion of Landau–Siegel zeros

The README keeps (c′) because its route does not use AnalyticNumberTheoryPartI §0.34, and says the family uses it and not (c). The Lean file cannot record that: `norm_rieszRemainder_le_of_no_real_zero` is `norm_rieszRemainder_le` with one more hypothesis and constants allowed to depend on `c₀`. I checked it on a copy of the file: taking `C, c` from `norm_rieszRemainder_le` and discarding the zero-free hypothesis closes it, with no other change. An implementer who proves (c) is therefore asked for nothing by (c′).

The statement should stay, since it is the form the family consumes. The smallest repair is one sentence in its docstring: that it follows from `norm_rieszRemainder_le` as stated, and that the target is the proof by the route of 1.4i (c′), from 1.4i (a) without §0.34.

## N01 — A docstring line of `Suggested.lean` begins with the word "theorem"

Line 19 of the module docstring starts "theorem for the Riesz remainder under a zero-free interval", so a tool that reads declarations line by line sees a declaration named `for`. Reflowing the sentence so that no line starts with a declaration keyword removes it.

## Previous findings

- C01 (the effectivity of the repulsion constant rests on a constant stated only to exist) — not repaired: "There is an absolute `C` such that for every `q ≥ 1`" (0.30b, lines 40–41); "The constant `c` of (i) is effective: its route uses 0.30b and 1.7a" (line 677). Raised again as C01, with the new docstring sentence.
- C02 (the description's comparison of the family index with the sibling heads) — partly: the index here now equals the copy in #2885, which removes the difference that review reported; the description's sentence about #2881 is now the one that is out of date. Part of C02 above.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| 0.30b (a)–(b) | `q = 1, t = 0`; principal mod 6; `p = 2` factor | `ζ(4)/ζ(2) = 0.658 > 1/2`; `1 + 2^(7/4) = 4.36 ≤ 8`; half-chord `√5 = 2.24 < 5.72/2`; `−ζ′/ζ(2) = 0.570`; `F(1) = 1/3` | holds | none |
| 0.30b, sign of the coefficients | expansion at `z − u` | pole `δΣu^k(z−1)^(−k−1)`, zero `−m_wΣu^k(z−w)^(−k−1)`; matches the display | holds | none |
| 1.4e (a) and corollary | `δ₀ = 1/2`; `z = x^(1/δ₀)`, `η = x^(−2)` | residue at `1` is `−y(L′/L)(1,χ)`; `z/(Qη) ≤ x^(−1)` when `Q ≥ x^(1/δ₀+3)`; elementary error `≤ (η + 1/z)log 2z` | holds | none |
| 1.4e (a) ⇒ (a′); QuasiRiemannHypothesis §5.3 | `δ₀ = 1/400`, `a = 1 − δ₀`, `ε ≤ δ/8` | `1/δ₀ + 3 = 403`; `x^(−1+400δ)`; §5.3 disc of radius `2 − a − 8ε` reaches `Re w = 1 − δ₀ + δ` | holds | none |
| 1.4f (a) ⇒ (a′) | `δ₀ = 1/400`, `ε = 1/2` | `(2+ε)/δ₀ = 1000`; `δ = δ₀ε/(2+ε) = 1/2000 ≤ 1/800`; exponent `(2+ε)(−1+ε/(2+ε)) + 2 = 0` | holds | none |
| 1.4g (a) | blocks `k_j = ⌊X/2^j⌋` | `⌊⌊X/2^j⌋/2⌋ = ⌊X/2^(j+1)⌋`; `k_* ≥ 1` from `X/2^(J−1) ≥ 2`; kernel `≤ X^(Re ρ)log X` | holds | none |
| 1.4g (b) and Corollary | BennettSiksek2020 lines 795–807; `N > X^(1/2)` | source: same display, `c` effective; `X^(1−c₀) ≤ X exp(−c₀ log X/(√log X + log N))` since `log N > 1` | holds | none |
| 1.4h (a)–(c) | `a = 1, w > 1`; `y → 3⁻`; `y = 1` | `log 4 + 4/e = 2.858 < 2.86`; `S_Λ ≥ 0.75204` (sup on `[1, 10⁶]` at `3⁻`); `G_1(1) = 1.5772`; `ψ(113)/113 = 1.0388` | holds | none |
| 1.4i (a), sign and integration | exceptional term; `y = 2` | `(y/β)∫_y^∞ u^(β−2) = y^β/(β(1−β))`; at `y = 2`, `(2^β/β − 2)/(1−β)` bounded, matching `2(L′/L)(1,χ)` | holds | none |
| 1.4i (c), (c′) / `norm_rieszRemainder_le`, `…_of_no_real_zero` | `N = 1`; `χ² = 1`; copy of the file | no nonprincipal `χ` mod 1; denominators `≥ log 3`; (c′) closes from (c) by discarding the hypothesis | holds | C03 |
| 1.4i, integral identity via ExplicitPrimeCounting §§0.2, 0.7, 4.2 | sum of §0.7 against `χ(a)` | `Σχ(a)C(q,a) = −(L′/L)(1,χ)`; gives `S̃_χ(x) + x(L′/L)(1,χ) = −x∫_x^∞ψ_χ/t²`; §4.2 gives the same for `G_1` | holds | none |
| 1.4i Check (conductor condition) | `y = 20`; `y = 10⁶` | `8·3·5·7·11·13·17·19 = 38798760`; least prime `1 + 38798760k` at `k = 5`: `193993801`; `(S̃_1(y) − 2S̃_1(y/2))/y = 0.69317` | holds | none |
| 1.4i (b′) parametrisation | `log y ≍ x^(ε/3)` | `x^(ε/5) = (x^(ε/3))^(3/5)`; `x^(ε/8) = (x^(ε/3))^(3/8)`, `3/8 < 1 − α` for `α` just above `3/5` | holds | none |
| 1.7a (a)–(b), (b′) | `r = x₀ = 1/2`; `J = ⌈8KL⌉`; `φ = 3π/(2J+1)` | `ρ₀ = 3/4`, `C = 1008`; `L + 2Lρ₀/(1−ρ₀) = KL ≤ J/8`; `16·9 = 144`; `2016 ≤ 2080`; `−(2J+1)/(3π) − 1/2 < −J/5` | holds | none |
| 1.7b convention | `q = 14`, `c₁ = 3`; two characters | `1 − 3/log 14 = −0.137`; `χ₋₇(2) = 1`, `L(0,χ₋₇) = 1`; `3c_star/log(N₁N₂) ≥ 3c_star/(2 log q)` | holds | none |
| 1.7b (i) / `deuring_heilbronn_repulsion` | `χ = χ₁, ρ = β₁`; `χ = χ₀`; `ρ = 1`; ζ zero `1/2 + 14.13i` | `|a^j − b^j| ≤ j(1−β₁)`; `x = 1−β ≤ 1/2`; `c = 1/(2CC′)`; Lean excludes `ρ = 1` | holds | C01 |
| 1.7b (i), locators | Linnik1944b lines 65–70; Bombieri1987 lines 1248–1255; Gallagher1970 lines 359–376 | Linnik: heights `ln³D`, moduli `≤ D²`, p. 348; Bombieri Th. 16, p. 41; Gallagher (26)–(27), p. 336, credit to [9] on p. 337 | holds | none |
| 1.7b (ii) / `gallagher_primeCount_linnik_range` | no pair; pair with `χ₁(a) = ±1`; `q = 3` | `θ = 0` kills both terms; `x − x^β/β > 0` once `log x > 1.39`; `x^(−u₀/4) = ((1−β₁)ℒ/c)^(c log x/(4ℒ))` | holds | none |
| 1.7b (iii) / `exists_prime_modEq_le` | gap `c/(q² log q)`; `ε = 1/4` | `(c/(q² log q))·log x·x/(q log x) ≥ c′x/(q³ log x)`; `q^(−3/4)/q = q^(−7/4)`; Linnik1944a line 25, p. 139; Bombieri Th. 13, p. 39 (page image) | holds | none |
| 2.9b class numbers | `K = ℚ, 𝔪 = (q)∞`; `ℚ(√3)`; `n = 2` | `2^n·4^n = 8^n`; `φ(q) ≤ 2q`; `ℚ(√3)`: unit `2+√3` of norm 1, `h_𝔪 = 2`; imaginary quadratic `h_𝔪 ≤ 16B` | holds | none |
| 2.9b (ii), Mellin bound via QuasiRiemannHypothesis §3.2 | `N = 0, 2` | `(y∂_y)^jφ ≍ h^(−j)` on a support of length `hX`: `hX^β(h|γ|)^(−2)`; `φ̃(1) = 500·0.00703 = 3.515`, `X^(−0.1)φ̃(1) = 1.7616` | holds | none |
| 2.9b (iv) (a)–(c) | `d = 2n` and `d = n`; `n = 2`, `ε = 1/2` | `D_F ≤ D_E^(2/d)` gives `D_E^(−(1+2ε)/d)`; `(B²)^(−(1+2ε)/(2n)) = B^(−(1+2ε)/n)`; count `hX/(16B·B·log X)`, two ideals per `p` | holds | none |
| 2.9b (iv) (c) ⇒ (c′) / the two `card_primes_…` theorems | `d = 103, M = 3`; `X = 1` | `log B ≥ 6.8` forces `X ≥ X₀` for small `c`; `B^(−1) ≥ B^(−2)`; at `X = 1`, `log B ≤ 0` fails | holds | none |
| 2.41a | `1 ⊕ χ₋₄`; trivial `ρ` | cited §§9.2, 9.4, 9.5, 11.1 of RiemannHypothesisStatementsAndConsequences and AnalyticNumberTheoryPartI §§2.18a, 2.41 exist under those numbers | holds | none |
| Description against the head | Lean declarations; suppliers; index copies | 7 theorems, not 3; two suppliers unnamed; index equals #2885, #2878, #2881, differs from #2883 in 24 lines | out of date | C02 |

- Source locators checked against the text: 11 (Gallagher1970 (26)–(27), Theorem 7 with its remark, the credit to [9]; Linnik1944a (2); Linnik1944b Theorem and §3; Bombieri1987 Théorèmes 13, 14, 16; BennettSiksek2020 Theorem 5), two of them also on the page image.
- Library declarations opened at the pins: 19 (Mathlib `Chebyshev.psi_le` at `Mathlib/NumberTheory/Chebyshev.lean` 473, `psi_le_const_mul_self` 485, `abs_psi_sub_theta_le_sqrt_mul_log` 442, `LSeries_eq_mul_integral'` at `LSeries/SumCoeff.lean` 155, and eleven more by name; Tau Ceti `logIntegral` at `Analysis/SpecialFunctions/LogIntegral.lean` 141, `RayClassGroup` at `NumberField/Global/RayClass/Basic.lean` 130, `card_rayClassGroup_mul_index` at `RayClass/ClassNumber.lean` 99, `classNumber_le_bound` at `EffectiveBounds/ClassNumber/Basic.lean` 81).
- Cross-roadmap citations resolved: the heading of each of the 63 distinct roadmap-and-section citations located, and the statement read for those the new citations and the remarks rely on, on main for AnalyticNumberTheoryPartI, PartII and PartIII, ZerosOfLFunctions, ExplicitPrimeCounting, ExplicitZetaBounds, ClassFieldTheory and the three completed roadmaps, and at the open heads for QuasiRiemannHypothesis, RiemannHypothesisStatementsAndConsequences and ExplicitNumberFields.
- Elaboration: `Suggested.lean` elaborates with seven `sorry` warnings and nothing else. The seven elaborated types were compared with 1.4i (c), (c′), 1.7b (i)–(iii) and 2.9b (iv) (c), (c′): no binder is lost and the generality agrees.
- One-tactic probe: none of the seven closes with `simp`, `rfl`, `infer_instance` or a library search; (c′) closes from (c), see C03.
- Dependency check: `depcheck: 171 roadmaps, 1993 edges, 0 problem(s)`. The worker's automatic checks all passed. Nothing outside the roadmap folder and the family index is changed.
- Duplication: the pinned Mathlib and Tau Ceti have no Riesz remainder, no repulsion and no bound for the least prime in a progression; no other roadmap's `Suggested.lean` declares any of the seven names.
- Ownership: GaloisSectionsPadicPeriodMaps (open) asks AnalyticNumberTheoryPartI for Linnik's theorem as a declared gap; SieveMethodsAndPrimePatterns §2.9 is a different theorem of Linnik; ExplicitZetaBounds 8.4 and ExplicitNumberFields §4.10 state explicit repulsions in other scales.

Overlap check: read QuadraticTwistSelectionOverPrimes, RiemannHypothesisStatementsAndConsequences, FrobeniusRestrictedRieszSums and GeneralizedRiemannHypothesisFromWindowBounds (open), and AnalyticNumberTheoryPartI, AnalyticNumberTheoryPartIII and ZerosOfLFunctions (main), at the sections cited; LiCoefficientsArithmeticFormula stands as read in the previous round. Riesz sums and the Riesz remainder of a primitive character: RiemannHypothesisStatementsAndConsequences 8.4a. The exception-free character prime number theorem and the exclusion of Landau–Siegel zeros: AnalyticNumberTheoryPartI §§0.18, 0.34. Landau's lemma: AnalyticNumberTheoryPartIII 8.3. The repulsion, Gallagher's theorem in Linnik's range, Linnik's theorem and the short-interval counts: this roadmap; the siblings cite them and state none.

Source independence: 9 passages compared with 5 sources (Gallagher1970, Linnik1944a, Linnik1944b, Bombieri1987, BennettSiksek2020), none shared beyond formulas and standard names; largest share Linnik1944a/b, 5 of 16 theorem-level locators (Gallagher1970 4, Bombieri1987 3); contents compared with Linnik's three parts (Linnik1944a lines 28–32) and Bombieri1987 §6 (Théorèmes 13–16): independent, no layer corresponds to a run of their sections. Iwaniec–Kowalski, Davenport, Stark, Lagarias–Odlyzko, Knapowski and [FormalProof] could not be read.

Research link: 1.7b is Linnik's least-prime theorem (Linnik 1944; Bombieri 1987, Th. 13) with the Deuring–Heilbronn repulsion (Bombieri 1987, Th. 16) and Gallagher's theorem (Gallagher 1970, Th. 7); 1.4g (b) is Iwaniec–Kowalski Th. 5.27 as used by Bennett–Siksek (2020); 2.9b follows Lagarias–Odlyzko (1977) and Stark (1974). Rests on the README and the five texts read.

## Not verifiable

- [FormalProof] and [Announcement]: not in the sources cache and their hosts are in no licence class; every sentence of the kind "the formal proof gives" (the width `1/400`, `C = 2080`, the gap `c/(q² log q)`, the range `d ≥ 100`, the parametrisation of 1.4i (b′)) was checked only for consistency with the general statement beside it.
- Iwaniec–Kowalski, Theorem 5.27: no legal copy; checked through BennettSiksek2020, which quotes it.
- Davenport1980 and Stark1974: settled as uncertified.
- Knapowski 1962 and Lagarias–Odlyzko 1977: not in the sources cache; Knapowski checked only through Gallagher's credit (Gallagher1970 lines 372–376).

## Source issues

- **Misprint** in BennettSiksek2020 at Theorem 5, (26), p. 17 (arXiv v1): the source says the error term carries the factor `(log N)⁴` for every primitive `χ`, the trivial one included; it should be `(log 3N)⁴` or exclude `N = 1`, where the factor vanishes; affects nothing.

## For the human reviewers

- Scope: the forms headed "The form of the formal proof" rest on a Lean repository and an announcement of 20 November 2026 (README lines 1055–1056), not refereed, on hosts of no licence class; I did not read them.
- Not tested: Iwaniec–Kowalski, Davenport, Stark, Lagarias–Odlyzko, Knapowski and [FormalProof] could not be read; wording and arrangement were compared with Gallagher1970, Linnik1944a/b, Bombieri1987 and BennettSiksek2020 only.
- Design: with AnalyticNumberTheoryPartI §0.34 on main and QuasiRiemannHypothesis §10.7 open, no exceptional zero exists; 0.30b, 1.7a, 1.7b (i) and the exception-tolerant forms then serve only routes that avoid those two statements (README lines 392–394, 976).
- GaloisSectionsPadicPeriodMaps (open, its README line 1516) declares a gap asking AnalyticNumberTheoryPartI for Linnik's theorem, which this roadmap states as 1.7b (iii).
