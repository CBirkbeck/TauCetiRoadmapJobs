<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13039#issuecomment-6902745775 -->
Review (claude) of 4c0c16f

Verdict: needs_changes

**For the human reviewers:** this review raises 6 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) five BFP page ranges are one page off; three cited items are missing from the manifest

   **Location.** `packages/MotivicStructuresInModuliOfCurves/README.md`:

   - line 499 (§3.1): "BFP, §11.4, pp. 1361–1362";
   - line 1158 (§8.7): "BFP, Examples 7.7–7.9, pp. 1338–1340";
   - line 1224 (§8.11): "BFP, Propositions 8.6–8.7, pp. 1344–1346";
   - line 1414 (§9.9): "§11.3, pp. 1360–1361";
   - line 1439 (§9.10): "BFP, Theorem 11.5, pp. 1362–1363".

   **Claim.** Each item is on the pages given.

   **Witness.** Page markers of the cached text: bfp line 1618 (§11.4) is on p. 1362; line 713 (Example 7.7) on p. 1339; lines 934, 947 (Propositions 8.6, 8.7) on p. 1345; line 1572 (§11.3) on p. 1361; lines 1628–1637 (Theorem 11.5) on p. 1362.

   **Exact repair.**

   1. Line 499: "BFP, §11.4, p. 1362".
   2. Line 1158: "BFP, Examples 7.7–7.9, pp. 1339–1340".
   3. Line 1224: "BFP, Propositions 8.6–8.7, pp. 1345–1346".
   4. Line 1414: "§11.3, pp. 1361–1362".
   5. Line 1439: "BFP, Theorem 11.5, p. 1362".
   6. `packages/MotivicStructuresInModuliOfCurves/sources.toml`: entry `petersen-genus-one`, add "Theorem 1.3" to `locator` (README line 461 cites it; petersen-genus-one line 207 has it); entry `canning-larson`, add "§3.1; Lemmas 10.11 and 10.12" to `locator` and "5.2" to `cited_for` (README lines 801 and 928 cite them).

   The other 30 BFP page locators, the 63 CLP ones and the 6 CLP-H11 ones were compared with the page markers of the cached texts and agree (see Verified sound).

2. **F02** (P3) §12.10: the route and the `*Needs:*` line omit the even-degree inputs

   **Location.** `packages/MotivicStructuresInModuliOfCurves/README.md:1842`: "the boundary terms are products of groups `H^{k′}(M̄_{g′,n′})` with `k′ ≤ 15`, which are polynomials in `L` and `S₁₂` by §§12.9, 10.9, 9.8 and 10.1 and, for genus-one factors in degree fifteen, §3.6"; line 1844: `*Needs:* §§0.4, 3.6, 5.3, 5.4, 9.8, 10.1, 10.4, 10.9, 12.9, 4.7`.

   **Claim.** The cited sections make every boundary Künneth factor of degree at most fifteen a polynomial in `L` and `S₁₂`.

   **Witness.** The loop divisor of `M̄_{3,11}` is `M̄_{2,13}`; at `k = 8` its term is `H⁶(M̄_{2,13})`, covered by none of §10.1 (degrees `≤ 3`), §§9.8, 10.9 (odd), §12.9 (13–15). CLP cites CLP-H11 Theorem 1.2 (clp line 538).

   **Exact repair.** The inputs exist in the roadmap; cite them.

   1. Line 1842, replace the quoted clause by: "the boundary terms are products of groups `H^{k′}(M̄_{g′,n′})` with `k′ ≤ 15` and `g′ ≤ 3`, which are polynomials in `L` and `S₁₂`: in odd degrees by §§9.8, 10.9 and 12.9 and, for genus-one factors in degree fifteen, §3.6; in even degrees by §2.6 in genus zero, §3.3 in genus one and §4.3 in genus two, whose range `2r ≤ 20` contains every even `k′ ≤ 14`; and for the genus-three factors `M̄_{3,m}`, `m < n`, by induction on `n`".
   2. Line 1844: `*Needs:* §§0.4, 2.6, 3.3, 3.6, 4.3, 4.7, 5.3, 5.4, 9.8, 10.1, 10.9, 12.9` followed by the two gaps as they stand (§10.4 is not used by this route and may go).

   Tested on the witness: `H⁶(M̄_{2,13}) = RH⁶(M̄_{2,13})` by §4.3 with `r = 3 ≤ 10`, a sum of copies of `L³`. The boundary divisors of `M̄_{3,n}` have factors `(2, n + 2)`, `(1, a) × (2, b)` and `(0, a) × (3, b)` with `b ≤ n − 1`, so genus at most three and, in genus three, fewer markings: the list is complete. No supplier is added, so the dependency check is unchanged.

3. **F03** (P3) §4.11: a Check asserts the degree-twelve realization, which no target states

   **Location.** `packages/MotivicStructuresInModuliOfCurves/README.md:755`: "In degree eleven the list is `{S₁₂}`; in degree twelve it is `{L⁶}`."

   **Claim.** `H¹²(M̄_{g,n})^ss` is a sum of copies of `L⁶` for every stable pair.

   **Witness.** It is CLP-H11 Theorem 1.2 (clp-h11 line 49, p. 2). The README's even-degree targets are §§2.6, 3.3, 4.3 (genus `≤ 2`), 10.1–10.3 (`k ≤ 4`; `k = 6`, `g ≥ 10`) and 12.9 (`k = 14`).

   **Exact repair.** Replace the Check by one the roadmap proves: "In degree eleven the list is `{S₁₂}` (§10.9); in degree thirteen it is `{L S₁₂}` and in degree fourteen `{L⁷}` (§12.9)." Tested against §12.9 (README line 1830), which states exactly these two lists for every stable pair. The first Check of §4.11 is unaffected.

Three findings, all P3: five page ranges into BFP that are one page off, with three cited items missing from the manifest (R01); a route and a `*Needs:*` line in §12.10 that omit the even-degree inputs they use (R02); and a Check in §4.11 that asserts a theorem no target states (R03). No P1 or P2. The four findings of round 6 are repaired, and the new target §3.6 was recomputed independently in genus one. `Suggested.lean` elaborates with no output; the dependency check reports no problem. No author file was changed by this review and nothing was fetched.

## Previous findings (round 6), checked first

| Finding | Passage now | Disposition |
| --- | --- | --- |
| F01 (P1) the multiplicities 429, 6006, 186263, 264, 836 had no owner | README:565–585, new §3.6 "Cusp multiplicities of genus-one and genus-two moduli beyond the polynomial range"; :1629 "the multiplicity is `11` by Poincaré duality"; :1640, :1651, :1662, :1697, :1755 cite §3.6 | Repaired, in Layer 3 instead of §1.7 (it needs §3.1). Genus-one values recomputed below. |
| F02 (P2) §8.5 restated the genus-four canonical model | README:1127: "the canonical morphism is a closed immersion into `ℙ³` … (CanonicalModelsAndGonality §§3.4 and 9.1) … Prove what the count adds"; Scope bullet at :26 | Repaired. Supplier headings resolved at its head (§3.4, §3.9(b), §9.1). |
| F03 (P3) Conventions named the wrong layers | README:40: "The algebraic-cycle constructions of Layers 5–7 are over fields of characteristic zero, except the definitions and permanence properties of §§5.1–5.2" | Repaired; the exception is right (§5.1 is "over a field `k`"). |
| F04 (P3) §2.6 locators | README:442: "results (1) and (4), p. 545, and … (1), p. 549, and (6), p. 550"; :444 "§§5.1–5.7" | Repaired; `chow_blowup_formula` is in §5.7 of the supplier on main (its line 8476). |

The repaired patterns elsewhere: a search for further numbers attributed to a source with no owning target found R03; a search for further supplier or internal sections cited for content they lack found R02; a sweep of all page locators into the three most cited sources found R01.

## Maintainer notes

1. Tables taken over (§§8.9–8.11, 8.14): does not hold at this head. README:1183–1188, :1205–1210, :1226–1231, :1271–1275 carry 21 quotients `N_{≤3}/#Aut`, which BFP does not print; the 84 term-by-term entries are gone. I rederived the cone row `n = 2` and `n = 3` from bfp lines 799–806 (values below).
2. No finding elsewhere: confirmed for the passages it names (§§9.4–9.6, 9.9 compared with bfp lines 1298–1305, 1386–1395; same polynomials, ascending order).
3. Licence facts: carried to the last section, with one addition (the CLP text carries a CC BY notice).

## Verified sound

### Seeded source sample (15 targets, all read in the cached texts)

| Target | Locator read | Outcome |
| --- | --- | --- |
| 2.3 | bfp lines 221–231 (Proposition 2.1, p. 1328); clp lines 979–985 (§6.2, p. 23) | Same two ranges, `g ≥ 1`; credit to Arbarello–Cornalba for `n ≥ 2` as stated. |
| 2.7 | arbarello-cornalba line 474 (Theorem (2.1)); bfp lines 249–257 (p. 1329); petersen-genus-one line 207 (Theorem 1.3) | Holds; the Check's `gr^W_4 H³(M_{1,n}) ≠ 0`, `n ≥ 4`, is Theorem 1.3 with `i = 2`. |
| 4.1 | clp lines 172–173 (p. 4), 370 (p. 9) | `Φ` and `Ψ` as defined; the stable-target convention is the roadmap's. |
| 4.3 | clp lines 309–314 (Proposition 2.6, p. 7), 319 (Corollary 2.7, p. 8) | `k ≤ 10`, all `n`. The roadmap's route covers `n = 20` by §4.2 (`n ≥ k`), where CLP cites a remark of Petersen. |
| 4.4 | clp lines 57–71 (Definition 1.2, p. 2) | Same closure conditions; forgetful pushforward and clutching pullback not required (clp lines 61–62). |
| 4.6 | clp lines 433–440 (Lemma 3.2, p. 10) | Printed for all `k`; the proof's first sentence is the unproved step (Source issues). The roadmap's graph bookkeeping recomputed below. |
| 4.9 | clp lines 72–75 (Theorem 1.3, p. 2), 441–445 (p. 10) | All four conditions as printed. |
| 5.1 | clp lines 458–462 (Definition 4.1, p. 11) | Same quantifier over every test stack. |
| 8.1 | bfp lines 402–415 (§5, p. 1332); arsie-vistoli lines 253, 410, 452, 503 | `#P_g`, `#G(𝔽_q)` and `q^{2g−1}` as stated. |
| 8.9 | bfp lines 764–790 (equation (13), Proposition 8.1, p. 1341), 794–806 (Proposition 8.2, pp. 1341–1342) | Unmarked terms and the four quotients agree with the printed terms after division. |
| 8.13 | bfp lines 1001–1013 (Proposition 8.8, p. 1346), 1016–1021 (p. 1347) | Same bounds; `B` an undetermined integer. |
| 9.2 | bfp lines 1429–1434 (§11.1, p. 1357) | Both classes as printed. |
| 9.9 | bfp lines 1386–1395 (Theorem 11.1, p. 1356) | All ten polynomials agree coefficient by coefficient; the page of §11.3 is R01. |
| 9.10 | bfp lines 1628–1637 (Theorem 11.5, p. 1362) | Six traces agree; the page range is R01. |
| 12.6 | clp lines 1173–1192 (equations (8.1)–(8.2), p. 28) | Same complex, with `det E(Γ)` on the two-edge term. |

No locator was flagged by the author as unverified. Page locators checked against page markers: 35 into bfp (5 wrong: R01), 63 into clp, 6 into clp-h11, and those of §3.6 into getzler-semiclassical (lines 509–544, 635–642), petersen-genus-two (lines 153, 255–258) and petersen-abelian-surfaces (lines 145–188). The manifest has 26 works, one key each, and every work in the References has an entry.

### Adversarial table (values computed in this review)

| Statement | Instances | Values computed | Result |
| --- | --- | --- | --- |
| §3.6 genus-zero input | `M̄_{0,4…7}` | `L + 1`; `L² + 5L + 1`; `L³ + 16L² + 16L + 1`; `L⁴ + 42L³ + 127L² + 42L + 1` | Holds. |
| §3.6 `e_c(M_{1,m})` | `m = 1, …, 4` | `L`; `L²`; `L³ − 1`; `L⁴ − L² − 3L + 3` | Holds (the known counts). |
| §3.6 `S₁₂` multiplicities | `n = 11, …, 15` | `1`; `11, 11`; `66, 429, 66`; `286, 6006, 6006, 286`; `1001, 53053, 186263, 53053, 1001` (own script, exact integer arithmetic) | Holds; palindromic; the `n = 14` row of the source is a misprint. |
| §3.6 Checks 1–2 by hand | `n = 12, 13` | `c₁₂ = 11L − 55`; `σ₂ = 66L² − 726L + 1925`, `c₁₃ = 66L² − 715L + 1925`; `B_{13,11} = 286L + 2431`; sum `66 + 429L + 66L²`; without the twist `77 + 418L + 66L²` | Holds. |
| §3.6 `S₁₆` | `n = 15` | `c^{(14)}_{15} B_{15,15} = 1` | Holds. |
| §3.6 genus two | `(0, 0)`; Petersen's terms for `a + b ≤ 12` | `L³ + L² − L² = L³`; `S_{a+3} = S₁₂` only at `(9,1), (9,3)`; `S_{a−b+2} = S₁₂` only at `(10,0)` (`s₁₄ = 0`) and `(11,1)` (`s₁₆ = 1`, twist `L²`); `S_{b+2} = S₁₂` needs `b = 10`, outside the range | Holds. |
| §3.6 at `(2, 12)` | weights | `d = 15`; `264L, 836L², 264L³` dual in pairs about weight 15 | Consistent; `264`, `836` not recomputed. |
| §11.3 (repair) | `(1, 12)` | `S₁₂^∨(−12) = S₁₂(11)(−12) = L S₁₂`; `dim H¹¹ = 2·11 = 22` | Holds. |
| §11.6, §11.9 | multiplicities | `264` independent maps, `2·264 = 528 = dim`; image of the 66-dimensional module is 11-dimensional since `825 + 55 > 836` and `825 + 66 > 836` | Holds. |
| §8.5 (repair) | `g = 4`; a `(2,3)` complete intersection | `10 − 9 = 1` quadric; `ω = O(2 + 3 − 4)`, degree `6`, `g = 4`, `h⁰(O_C(1)) = 4` | Holds. |
| §2.3 | `(1,1)`, `(4,1)`, general `n ≥ 2` | `2d − k > 4g − 4 + n ⇔ k < 2g − 2 + n`; `n ≤ 1`: `k < 2g − 1`, plus the top degree, `k < 2g` | Holds. |
| §§2.5, 2.7–2.9 | `k = 5, 7, 9` | `k = 7`: `(1, ≤ 7), (2, ≤ 5), (3, ≤ 3)`; `k = 9`: `(1, ≤ 9), (2, ≤ 7), (3, ≤ 5), (4, ≤ 3)`, genus five out (`10 > 9`) | Holds. |
| §4.1 | `(1,1)`; `k = 1` | no stable forgetful target, `Φ = 0`; `Ψ¹ = ψ·Φ^{−1} = 0` | Holds. |
| §4.3 | `r = 10, 11` | `2r = 20 ≤ n` for `n ≥ 20`; `r = 11` excluded by the class in `H²²(M̄_{2,20})` | Holds. |
| §4.5 | `S = RH^*`, `(1, 12, 11)` | quotient at `(1,12,11)` zero; triples with `k′ ≤ 9` zero; `RH¹¹ = 0`, `dim H¹¹ = 22` | Printed lemma fails; corrected form holds. |
| §4.6 | `(n, k) = (13, 15)`; `T^k_n` | divisors of `M̄_{1,3}`: `1 + 4`; contractions `(1,15), (1,13), (2,12), (1,14)`; `a, b ≥ 11 ⇒ k ≥ 24`; `22 ≤ n + 2 ⇒ n ≥ 20`; `(23, 24)`: sides `{10,13}`, `{11,12}` | Holds. |
| §4.9 | `k′ = 4, 11, 13` | `g′ < 7`; `(1, 11)` inside; degree 13: genus one `n′ = 13`, genus two `9 ≤ n′ ≤ 13` | Holds. |
| §5.1 | point, `ℙ¹`, elliptic curve | identity; point and fundamental class; `H¹ ⊗ H¹` part of the diagonal not reached | Holds. |
| §8.1 | `(g, q) = (4, 5)` | `4·(5^{10} − 5⁸) = 37500000 = 480·78125` | Holds. |
| §8.3 | `n = 2, 3` | `(q+1)q·q^{2g−1} + q^{2g} − 1`; `(q³ − q)q^{2g−1} + 3q(q^{2g} − 1)` | Holds. |
| §8.9 | `n = 0, 1, 2, 3` | sums of bfp's terms: `q¹²(q−1)²(q+1)`; `q¹⁶ − 3q¹⁴ + q¹³ + 2q¹² − q¹¹`; `q¹⁷ + q¹⁶ − 5q¹⁵ − q¹⁴ + 7q¹³ − 2q¹² − 2q¹¹ + 2q¹⁰ − q⁹`; `n = 3` divided exactly, remainder `0`, quotient the printed row | Holds. |
| §§8.10–8.11 | `n = 0` | non-split: `q¹⁵ − q¹² − q¹¹ + q⁸ + q⁷ + q⁶ + q⁵ + q⁴`, quotient `½(q⁹ − q⁶) + ½(q + 1) + …`; split: polynomial part `½(q⁹ − q⁶) − ½(q + 1)` | Holds. |
| §§8.9–8.11 with §8.3 against §9.6 | `n = 0, 1, 2, 3` | `q⁹ + q⁸ + q⁷ − q⁶`; `q¹⁰ + 2q⁹ + 2q⁸ − q⁷ − q⁶`; `q¹¹ + 3q¹⁰ + 4q⁹ − 2q⁸ − 4q⁷ + 0·q⁶`; `q¹² + 4q¹¹ + 7q¹⁰ − 4q⁹ − 13q⁸ + 4q⁷` | Equal to §9.6 down to the stated precisions. |
| §8.13 | precisions | `n ≤ 2`: `(9 + n)/2 = 4.5, 5, 5.5`; `n = 3`: `q⁶` free, fixed by `χ = −10` | Holds. |
| §8.14 | `m_λ`; Checks 3–4 | `q⁴ − q`, `q⁴ + q²`, `q⁴ + q² − 2q`; `q⁶ + q³ − q² − q`, `q⁶ − q²`, `q⁶ + 2q³ − q² − 2q`; `(f_{(1,1)} ± f_{(2)})/2` as printed; total at `(2)`: `q¹¹ + q¹⁰ + 2q⁹ − 2q⁸ + q⁵ − 1` | Holds. |
| §9.2 | identity | `q⁹ + 2q⁸ − 1`; `q¹⁰ + 3q⁹ − q⁸ − 3q` | Equal to §8.3. |
| §9.5 (headline) | `n = 0`; `q = 2` | closed − boundary `= −q⁶ + q⁷ + q⁸ + q⁹`; `#M̄₄(𝔽₂) = 7965` | Holds. |
| §9.9 | `n = 2, 3` | compact dimensions `1, 11, 76, 319, 838, 1362` and `1, 21, 207, 1168, 3977, 8296, 10605`; open `n = 3` sum `−1 + 2q + 2q² − 11q³ − q⁶ + 4q⁷ − 13q⁸ − 4q⁹ + 7q¹⁰ + 4q¹¹ + q¹²`; at `q = 1`: `2, −6, 0` | Equal to §§9.5, 9.6, 9.1. |
| §9.10 | `n = 1` | `(q⁹ + q⁸ + q⁷ − q⁶)(q + 1) − (q⁷ + q²) = q¹⁰ + 2q⁹ + 2q⁸ − q⁷ − q⁶ − q²` | Equal to §9.6. |
| §9.8 (headline) | `k = 9` | base region as in §2.5; `H¹¹(M̄_{1,11})` of rank two shows sharpness | Holds. |
| §10.2, §10.4 (headlines) | `k = 4`; `k = 14` | `(6, 4)` inside `c(6) = 5`; `(3, ≤ 10), (4, ≤ 8), (5, ≤ 6), (6, ≤ 4), (7, ≤ 2)` inside `c = 11, 11, 7, 5, 3`; genus two needs degree `2d − k ≤ k + 2 ≤ 16 ≤ 20` | Holds. |
| §12.1, §12.2 (headlines) | `k = 13, 15` | exceptions `(2,11), (1,11…13)`; `(2, 11…13)`, `(1, 11…15)`; `(2,13)`: `d = 16`, `H¹⁷` from `H¹⁵` by one ample class; even factors have homological degree at most `2`, resp. `4`, tautological by hard Lefschetz from §§10.1, 10.2 | Holds. |
| §12.6 | orientation | transposition of two edges acts by `−1` | Holds. |
| §12.7 | `g = 8`, `n ≤ 1` | `2g − 2 + n = 14, 15 ≤ 15` but `2g = 16 > 15` | The roadmap's bound is needed and suffices. |
| §12.9 (headline) | duality | `(L^{d−12}S₁₂)^∨(−d) = L S₁₂`; `(L^{d−7})^∨(−d) = L⁷`; `(L^{d−13}S₁₂)^∨(−d) = L²S₁₂`; `(L^{d−15}S₁₆)^∨(−d) = S₁₆` | Holds. |
| §7.7 (headline) | `n = 0` | `κ₀ = 12`; `dim = 10n + 9(7 − n) − 45 = 18 + n` | Holds. |
| §12.10 (R02) | `H⁶(M̄_{2,13})` | not in degrees `≤ 3`, `11`, `13–15`; `r = 3 ≤ 10` in §4.3 | R02. |
| §4.11 Check (R03) | `k = 12` | no target; `k = 13, 14` are §12.9 | R03. |

### Lean form and headline theorems

`lake env lean` on `packages/MotivicStructuresInModuliOfCurves/Suggested.lean`, run from the content checkout: exit 0, no output. The file is `import Mathlib`, one module docstring and an empty namespace: no declaration, no `sorry`, no `set_option`. The one-tactic probe and the `#check @name` comparison have no subject (the entry `and` of the signature and library-match tools is a word of the docstring). The seven headline groups of the Summary and CLP Theorem 1.9 are each named in the docstring as not statable, for the reason that the pins have no algebraic stacks or moduli of curves. Nothing statable is absent, nothing is padding, and no backticked name is presented as this roadmap's own.

Pinned declarations opened: `Mathlib/NumberTheory/ModularForms/LevelOne/DimensionFormula.lean:167`, `:172`, `:262`; `Mathlib/NumberTheory/LegendreSymbol/QuadraticChar/Basic.lean:120`, `:239`; `Mathlib/Algebra/IsPrimePow.lean:28`; `Mathlib/LinearAlgebra/QuadraticForm/Basic.lean:160`; `TauCeti/RepresentationTheory/Spin/HalfSpin/Basic.lean:119`, `:260`, `:324`; `TauCeti/RepresentationTheory/Spin/Dimension.lean:73`; `TauCeti/RepresentationTheory/RepresentationRing/Basic.lean:106`, `:127`; `TauCeti/NumberTheory/ModularForms/LevelOne/PeriodPolynomial/Finrank.lean:213`; the directories `TauCeti/Geometry/Hodge/Mixed` and `Tate`.

### Suppliers, gaps, duplication

Every cited heading was resolved again at the current heads: StableReductionPartII §§0.4, 2.248, 3.1–3.3, 3.5, 3.7, 3.10, 3.11, 4.1, 4.14, 5.1, 5.10, 5.11, 5.15 (the Edidin–Graham comparison is in its second paragraph), 7.11; VirtualFundamentalClass §§2.1–2.4; CanonicalModelsAndGonality §§3.4, 3.9, 5.4, 9.1; PELModuli §M5.2 (over `ℤ[1/(n d_g)]`, which is `ℤ` at principal type and level one; relative dimension `g(g+1)/2 = 3`); WeilConjectures WC.1, WC.5, WC.6; DeligneWeightsAndPurity §§8.24, 9.6; MixedHodgeModulesAndIrregularHodgeTheory §§4.5, 5.1; MotivesAndAlgebraicCycles §§0.6, 2.4, 2.6, 2.7; AutomorphicGaloisRepresentations §1.2; AlgebraicModuliForArithmeticGeometry §§1.3, 5.1; ArithmeticGaloisRepresentations §§5.1, 5.3; SchemeKTheoryOperations §§6.2.1–6.2.2; HabiroNahmSeries §5.1; MappingClassGroupsAndCanonicalRepresentations §2.3; on main EquivariantIntersectionTheory §§2.1–2.3, 3.3, SchemeAndStackFoundations §§2.20, 3.2, 3.3, 4.15, 4.17, 5.1–5.8, StableReduction Layer 1, SchurWeyl Layers 7 and 9, AlgebraicCurves Layer 12. None fails.

Gaps: the eight slugs are in `design/plan.json` and in the README with the same suppliers; none was changed this round, and round 6 found each precise and minimal. The acceptance of a later round would be conditional on all eight.

Duplication by object across main and the open heads: tautological rings of `M̄_{g,n}`, semi-tautological extensions, the Chow–Künneth generation property, the Getzler–Kapranov formula, Euler characteristics of `M_{1,n}`, the Madsen–Weiss and Harer inputs and the cohomology of local systems on `A₂` occur in no other roadmap (searched by object with the roadmaps tool; SiegelModularForms mentions local systems on `A₂(2)` in a reference only). AlgebraicGromovWittenTheory forms `ψᵢ` on stable-map stacks, a different object. `scratch/overlaps.md`: no other pull request changes this roadmap, no dropped id, no revision-only id, no second copy. The package declares no Lean name.

Overlap check: read StableReductionPartII, WeilConjectures, AlgebraicGromovWittenTheory, VirtualFundamentalClass, CountingBundlesAndHallAlgebrasOfCurves and, on main, EquivariantIntersectionTheory and StableReduction (the third list is empty); the pointed stacks, clutching, `ψᵢ`, the Hodge bundle and the Edidin–Graham comparison are StableReductionPartII's, Vistoli's Chow groups VirtualFundamentalClass's, equivariant Chow groups and the hyperelliptic presentation EquivariantIntersectionTheory's, masses, the sieve and polynomial counts WeilConjectures', dual graphs StableReduction's; CountingBundlesAndHallAlgebrasOfCurves shares nothing.

Dependency check, with `--movable`:

```text
depcheck: 238 roadmaps, 2262 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. PELModuli, the supplier added in round 7, is earlier in the merge order (line 116 against line 343).

### Shape

13 layers, each ending with Examples and Dependencies; every numbered target has a `*Needs:*` line, a locator and Checks; every definition with an API list has at least three Checks. The new §3.6 has six Checks with computed values. A scan finds no LaTeX delimiters, pull-request numbers, dates, machine paths, HTML or process words in the README, the Lean file or the manifest.

### Copyright and arrangement

Twenty-one passages were put beside their sources: the fifteen sampled targets, and §3.6 against getzler-semiclassical lines 509–544 and petersen-abelian-surfaces lines 145–178, §10.4 against clp lines 979–991, §11.9 against clp lines 1120–1129, §12.7 against clp lines 1182–1185, §12.10 against clp lines 535–543. The longest shared runs are six words ("the square of a monic polynomial", §8.1 against bfp line 410; "subrings generated by algebraic cycle classes", §4.4 against clp line 61), each inside a statement the mathematics forces. The tables of §§9.4–9.6, 9.9 and 9.10 are the statements of the cited theorems, in ascending order; those of §§8.9–8.11 and 8.14 are the roadmap's own quotients. The arrangement is as rounds 5 and 6 found it: Layers 4, 5, 6–7, 10, 11–12 regroup clp §§2–3, 4, 5, 6, 7–8, not one to one (Layer 10 takes in clp-h11, Layer 11 is the base cases of clp §7 and Layer 12 its theorems with §8), with Layers 1, 2, 8, 9 from bfp between them; the order is forced by §§6.2–7.7 needing §5.2, §10.4 needing §§7.7 and 9.8, §§11.4–11.9 needing §3.6, and Layer 12 needing §§11.9–11.10. No sentence says the roadmap follows a source.

Source independence: 21 passages compared with 7 sources (clp, bfp, clp-h11, arbarello-cornalba, getzler-semiclassical, petersen-abelian-surfaces, arsie-vistoli), none shared beyond a run of six words; largest share clp, about 96 of 250 locators; contents compared with clp: independent.

## Not verifiable

- `harer-vcd` and `mukai`: settled as uncertified; cited by locator, no text read.
- The multiplicities `264` and `836` of §3.6: clp takes them from an implementation (clp lines 1049–1051, 1094–1095); I checked the terms of Petersen's theorem that carry `S₁₂` and the duality symmetry, and did not recompute the genus-two assembly.
- The graph families of §§11.4–11.7 are drawn in figures the extraction of clp does not carry; their sizes were checked through their sums.
- Lemmas 10.11 and 10.12 of canning-larson were not located in the extraction (its lemma headings do not match a plain search); round 6 read Lemma 10.5 at its lines 1932–1937.
- VirtualFundamentalClass, CanonicalModelsAndGonality and PELModuli were read at the heads of their open pull requests; their numbering may move before they merge.

## Source issues

- **Error** in clp at Lemma 2.1, hypothesis (2.2), pp. 4–5: the source says surjectivity is needed only for smaller triples of degree at most `k − 2`; it should also require the same-degree triples with fewer markings, which its proof uses; affects a stated result.
- **Gap** in clp at Lemma 3.2, first sentence of the proof, p. 10: the source says the generated extension contains every class pushed forward from the boundary; it should justify this, and for even degree at least 24 two odd genus-one factors remain; affects the proof.
- **Misprint** in clp at §6.2, first sentence of the proof of Theorem 1.5(3), p. 23: the source says the range is even degrees at least fourteen; it should be at most fourteen; affects nothing.
- **Misprint** in clp at the proof of Lemma 7.3, p. 27: the source says the module of relation symbols is induced from the symmetric group on ten letters; it should be induced from its product with the group on two, of dimension 66; affects nothing.
- **Gap** in clp at the proof of Lemma 8.2, p. 28: the source says vanishing holds whenever `2g − 2 + n > 15` and the rest has the generation property; it should also use the bound `2g > 15` for at most one marking, covering genus eight; affects the proof.
- **Misprint** in getzler-semiclassical at the final table, row `n = 14`, p. 491 (arXiv p. 10): the source says the cusp part is `286L³ + 6006L² + 286L`; it should be `286L³ + 6006L² + 6006L + 286`, as recomputed and as duality requires; affects nothing.
- **Misprint** in bfp at the opening of §9, p. 1351: the source says the Getzler–Kapranov formula is Theorem 8.3 of its reference; it should be Theorem 8.13, as the source itself writes on p. 1356; affects nothing.
- **Misprint** in bfp at Remark 2.2, p. 1328: the source says Proposition 2; it should be Proposition 2.1; affects nothing.

## For the human reviewers

- **Scope.** README §3.6 (line 572) states `264` and `836` as targets through a genus-two Getzler–Kapranov evaluation; `clp` lines 1049–1051 and 1094–1095 take them from an implementation, and no review round has recomputed them.
- **Scope.** README line 9: §3.6 owns the genus-two Torelli isomorphism and the Euler characteristics of local systems on `A₂` (Petersen's theorem, resting on Harder's Eisenstein cohomology); no roadmap on main or open plans them.
- **Scope.** README line 28: CLP Lemma 3.2 is printed for all degrees; §4.6 proves it for odd `k` and `k ≤ 23` and does not take the even `k ≥ 24` case as a target.
- **Scope.** The package consumes VirtualFundamentalClass, CanonicalModelsAndGonality and PELModuli, open pull requests; the first two are by other authors and not in the merge order, whose line 401 names a different package, VirtualFundamentalClasses.
- **Licence.** `clp` is recorded in `sources.toml` with `licence_class = "author-page"`; the text itself carries a Creative Commons Attribution notice (`clp` lines 46–47). `bfp` is an author-page copy with no reuse licence recorded.
- **Licence.** `kannan` is a 2026 arXiv preprint (arXiv 2602.09117v2), used in README §9.1 for a misprint note only; `harer-vcd` and `mukai` have status `uncertified`, `licence_class = "none"` and no cached text.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "4c0c16fbe81e21a840ec5ffedce1aca57f8d9827", "job": "REV-PKG-MotivicStructuresInModuliOfCurves~7", "model": "fable", "worker": "chris-x88"} -->
