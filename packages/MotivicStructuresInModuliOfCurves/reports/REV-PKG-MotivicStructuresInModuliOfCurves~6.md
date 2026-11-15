<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13039#issuecomment-6901612445 -->
Review (claude) of d041387

Verdict: needs_changes

**For the human reviewers:** this review raises 6 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P1) the multiplicities 429, 6006, 186263, 264 and 836 have no owning target

   **Location.** `packages/MotivicStructuresInModuliOfCurves/README.md:1613` (§11.4): "the multiplicity `429` is Getzler's", with `*Needs:* §§11.2, 11.3, 3.2, 1.6`; the same pattern at :1602 (§11.3, `11`), :1624 (§11.5, `6006`), :1728 (§12.3, `186263`); and :1635, :1670 (§§11.6, 11.9): "by evaluating the Getzler–Kapranov formula (§1.4) on the genus-two local-system Euler characteristics".

   **Claim.** §1.6 supplies the genus-one multiplicities, and §§1.4, 3.1, 11.1 supply `264` and `836`.

   **Witness.** README:357, §1.6, states polynomial counts "for `g = 1` and `n ≤ 10`, for `g = 2` and `n ≤ 7`" only; the pairs used are `(1, 13)`, `(1, 14)`, `(1, 15)`, `(2, 12)`. §11.1 gives the type of the constituents, no Euler characteristic. No target states `e_c^{S_n}(M_{1,n})` for `n ≥ 11` or `e_c(M₂, V_λ)`. clp lines 1049–1051, 1094–1095 take `836` and `264` from an implementation (its reference [2], clp line 1250).

   These numbers are load-bearing: `429` and `6006` give the independence in §§11.4–11.5 (the sources prove spanning only, clp lines 1079–1080, 1088–1089), `264` the spanning in §11.6, `836` the upper bound in §11.9, and §§11.10, 12.1, 12.2, 12.9 rest on them. A citation is not a supplier.

   **Exact repair.**

   1. Add a target `### 1.7 Equivariant Euler characteristics in genus one and two beyond the polynomial range`, after §1.6, with three statements.
      - Genus one. For every `n ≥ 1`, the class `e_c^{S_n}(M_{1,n})` in terms of `L` and the cusp realizations `S_{2k+2}`, obtained from the fibre powers of the universal elliptic curve (§3.2) and the compactly supported Euler characteristics of `Sym^{k}V` on `M_{1,1}` (Getzler, §3, the residue formula for the genus-one generating series; getzler-semiclassical lines 509–544).
      - Consequence through §1.4, for `11 ≤ n ≤ 15`: `H¹³(M̄_{1,13})^ss ≅ (L S₁₂)^{⊕429}`, `H¹³(M̄_{1,14})^ss ≅ (L S₁₂)^{⊕6006}`, `H¹⁵(M̄_{1,15})^ss ≅ S₁₆ ⊕ (L² S₁₂)^{⊕186263}` (Getzler, final table, p. 491; getzler-semiclassical lines 638–642).
      - Genus two. For `n ≤ 12`, `e_c^{S_n}(M_{2,n})` through `e_c(M₂, V_{a,b})`, `a + b ≤ 12` (Petersen, abelian surfaces, Theorem 2.1, with the stratum of products of elliptic curves removed; the Leray reduction as in §9.10), and through §1.4 `H¹³(M̄_{2,12})^ss ≅ (L S₁₂)^{⊕264}` and `H¹⁵(M̄_{2,12})^ss ≅ (L² S₁₂)^{⊕836}` (CLP, equation (7.1), p. 24, and proof of Lemma 7.7, p. 26).
      - *Needs:* §§1.2–1.4, 3.1, 3.2, 0.5; DeligneWeightsAndPurity §8.24; MixedHodgeModulesAndIrregularHodgeTheory, gap:dm-stack-mixed-hodge.
      - Checks: the degree-eleven coefficients of the genus-one classes are `66 = binom(12, 10)`, `286 = binom(13, 10)`, `1001 = binom(14, 10)`, the multiplicities of §4.7; the class at `n = 13` is symmetric about `d = 13` (`66, 429, 66`); at `n = 14` duality pairs degrees `13` and `15`, so both carry `6006` (Getzler's printed row drops a term, see Source issues); `836 = 825 + 11` and `264 = 66 + 132 + 66` agree with §§11.6 and 11.9.
   2. §11.3: replace "the multiplicity `11` is Getzler's (§1.6)" by "the multiplicity is `11` by Poincaré duality, `H¹³(M̄_{1,12}) ≅ H¹¹(M̄_{1,12})^∨(−12)` with `d = 12`, and §4.7"; in its `*Needs:*` replace `1.6` by "DeligneWeightsAndPurity §8.24 (smooth proper DM duality)".
   3. §§11.4, 11.5, 12.3: "(§1.7)" at the multiplicity and `1.7` in place of `1.6` in `*Needs:*`. §§11.6, 11.9: "by §1.7" in place of "by evaluating … (§1.4) …", and `1.7` added to `*Needs:*`. Layer 1 Dependencies and "How to read the build" gain the new target.

   Tested on the refuting instance: at `(1, 13)` the new statement covers `n = 13 ≤ 15`, and `429 = 286 + 11 + 132` is the size of the family of §11.4; at `(1, 12)`, `dim H¹¹ = 2·binom(11, 10) = 22 = dim H¹³` by duality, with no appeal to Getzler. The repair adds no supplier, so the dependency check is unchanged. I did not recompute `264` and `836` (see Not verifiable).

2. **F02** (P2) §8.5 restates the genus-four canonical model and cites a supplier section that does not contain it

   **Location.** `packages/MotivicStructuresInModuliOfCurves/README.md:1100–1102`, §8.5: "the canonical image in `ℙ³` is the complete intersection of a unique geometrically irreducible quadric with a cubic"; `*Needs:* … SchemeAndStackFoundations Layer 3 (canonical embeddings of curves)`.

   **Claim.** The statement is this roadmap's target and SchemeAndStackFoundations Layer 3 supplies canonical embeddings.

   **Witness.** Main, `TauCetiRoadmap/SchemeAndStackFoundations/README.md:5751–6212`: Layer 3 is §§3.1–3.8 (genus, Riemann–Hurwitz, Riemann–Roch, Picard objects); no canonical embedding. CanonicalModelsAndGonality (open, already a supplier here) `README.md:1003` §3.4 (Noether's theorem) and `:1135` §3.9(b): genus four, ideal generated by an irreducible quadric and a cubic.

   **Exact repair.**

   1. §8.5, first sentence, becomes: "For a non-hyperelliptic curve of genus four over an algebraically closed field the canonical model in `ℙ³` has homogeneous ideal generated by an irreducible quadric, of rank three or four, and a cubic: CanonicalModelsAndGonality §3.4 (the canonical embedding) and §3.9(b), read on curves through AlgebraicCurves Layer 12. Prove what the count adds: over a perfect field the quadric is unique, hence defined over the base field, and geometrically irreducible; and conversely every smooth complete intersection of a quadric and a cubic in `ℙ³` is a canonically embedded curve of genus four (BFP, §6, p. 1334)."
   2. `*Needs:*` of §8.5: replace the Layer 3 item by "CanonicalModelsAndGonality §§3.4 and 3.9; AlgebraicCurves Layer 12; SchemeAndStackFoundations §3.3 (Riemann–Roch and Serre duality on curves, for the converse)". Layer 8 Dependencies: "SchemeAndStackFoundations Layer 0 and §3.3; CanonicalModelsAndGonality §§3.4 and 3.9; AlgebraicCurves Layer 12".
   3. `### From CanonicalModelsAndGonality` gains "§§3.4 and 3.9(b) (Noether's theorem and the genus-four canonical ideal, over an algebraically closed field)"; the last Scope bullet gains "§8.5 owns only uniqueness and rationality of the quadric and the converse".

   Tested: with items 2 applied to a scratch copy the dependency check reports `0 problem(s)`. On the instance `g = 4`: `dim Sym² H⁰(ω) = 10` and `h⁰(ω²) = 3(g − 1) = 9`, one quadric, as the supplier's Check at its line 1104 computes; a pair of conjugate planes has rank two and is excluded by "rank three or four", matching the third Check of §8.4.

3. **F03** (P3) the Conventions name the wrong layers for characteristic

   **Location.** `packages/MotivicStructuresInModuliOfCurves/README.md:39`: "Algebraic-cycle constructions of Layers 4–6 are over fields of characteristic zero. The point counts of Layers 7–9 range over all finite fields, including characteristic two."

   **Witness.** Layer 4 is semi-tautological extensions (cohomology); the Chow constructions are Layers 5–7, and §7.1 says "over a field of characteristic zero". Layer 7 is the Mukai model and has no point count; the counts are §§1.5–1.6 and Layers 8–9.

   **Exact repair.** "Algebraic-cycle constructions of Layers 5–7 are over fields of characteristic zero. The point counts of Layer 1 and of Layers 8–9 range over all finite fields, including characteristic two." Checked against the layer headings at README:749, :814, :940, :1045, :1269.

4. **F04** (P3) §2.6: the divisor presentation and the blow-up formula are cited one place off

   **Location.** `packages/MotivicStructuresInModuliOfCurves/README.md:437`: "(Keel, Introduction, results (1) and (4), pp. 545 and 549, for … the divisor presentation"; :439: "SchemeAndStackFoundations Layer 5, §§5.1–5.6 (Chow groups of smooth projective schemes and blow-ups)".

   **Witness.** keel lines 227–239 (p. 550): the presentation with the symmetry, four-point and disjointness relations is result (6); result (4) on p. 550 (keel line 203) is the rank recursion. Main, `TauCetiRoadmap/SchemeAndStackFoundations/README.md:8476`: `chow_blowup_formula` is in §5.7 (§5.7 begins at :8375, §5.8 at :8498).

   **Exact repair.** "(Keel, Introduction, results (1) and (4), p. 545, and the summary of results, (1), p. 549, and (6), p. 550, for the cycle class isomorphism, the vanishing of odd homology and the divisor presentation with its three relations; …)"; and "§§5.1–5.7 (Chow groups of smooth projective schemes and the blow-up decomposition)". `sources.toml` entry `keel`: add "result (6), p. 550" to its locator.

Four findings: one P1 (five numerical inputs of Layers 11–12 that no target states), one P2 (a genus-four statement that an open roadmap already states, cited to a supplier section that does not contain it) and two P3 (stale layer numbers in the Conventions; two locators in §2.6). All five findings of round 5 are repaired and the repaired mathematics is sound. `Suggested.lean` elaborates with no output; the dependency check reports no problem. No author file was changed by this review.

## Previous findings (round 5), checked first

| Finding | Passage now | Disposition |
| --- | --- | --- |
| F01 (P2) §8.1 restated the hyperelliptic presentation | README:1051: "is EquivariantIntersectionTheory §3.3. Prove the same presentation over `ℤ[1/2]`"; Scope bullet at :15; Check at :1060 | Repaired. arsie-vistoli lines 253–262, 410–414, 452–466, 503–508 support the variant. |
| F02 (P2) gap:stack-rational-chow not minimal, two carriers | README:14, :39, :63–71, new §0.6 at :242–258; §§0.1–0.2 formed in VirtualFundamentalClass §§2.1–2.4 | Repaired, by a different route than proposed: the comparison is a target here (§0.6), not asked of the supplier, which avoids a cycle through the supplier's own consumers. kresch lines 213–229, 274–291, 993–998, 1159–1163 read. |
| F03 (P3) §11.7 route | README:1646: "the last four families (`66, 132, 66, 66` rows) are block upper triangular, so the rank is at least `495 + 330 = 825`" | Repaired. |
| F04 (P3) §2.3 first Check | README:409: "gives `H_c^k = 0` only for `k < 20 − 13 = 7`; the case `k = 7` is `H¹³(M_{4,1}) = 0` of §2.2 … No statement is made at `k = 8`." | Repaired. |
| F05 (P3) four page locators | README:333 (p. 1354 and p. 1351), :1064 (pp. 1333–1334), :1646 (pp. 26–27), :1761 (p. 28); also :313 and :1513 | Repaired, and the same slip corrected in two further places. |

The repaired patterns elsewhere: a search for further statements owned by a roadmap on main or an open one found R02; a search for further supplier sections cited for content they lack found R02 and the §5.7 item of R04.

## Maintainer notes

1. Tables taken over (§§8.9–8.11, 8.14): does not hold at this head. README:1156–1161, :1178–1183, :1199–1204, :1244–1248 carry 21 quotients in the roadmap's own form, not the 84 term-by-term entries (replaced in round 5).
2. No finding elsewhere: confirmed for the passages it names. §9.4 was compared with bfp lines 1299–1305: the same four polynomials, as the theorem requires, written in ascending order.
3. Licence facts: carried to the last section.

## Verified sound

### Seeded source sample (15 targets, all read in the cached texts)

| Target | Locator read | Outcome |
| --- | --- | --- |
| 0.5 | clp lines 213–224 (Proposition 2.2, p. 5), 1209–1224 (Lemma 8.3, p. 29) | At `n = k` the hook is `(1, 1^{k−1})`, the sign character; ranks two for weights 12 and 16. |
| 2.6 | keel lines 20–29 (p. 545), 180–181 (p. 549), 227–239 (p. 550), 476 (Theorem 1, p. 556) | Statement holds; the relations are result (6): R04. |
| 4.6 | clp lines 433–440 (Lemma 3.2, p. 10) | Printed lemma as described; the route's graph bookkeeping recomputed below. |
| 5.1 | clp lines 458–462 (Definition 4.1, p. 11) | Same quantifier over every test stack. |
| 6.4 | clp lines 595–606, 613–616 (pp. 14–15); canning-larson-genus-seven lines 1023–1034 (§4.4) | Splitting types `(3,3,4)`, `(5,5)` or `(4,6)`; `(2,4,4)`, `(2,3,5)` with `(4,6)`; `Z` hyperelliptic. |
| 6.5 | clp lines 593–594 (Lemma 5.1, p. 14); canning-larson lines 1932–1937 (Lemma 10.5) | Same hypothesis and conclusion. |
| 7.5 | clp lines 852–887 ((5.10)–(5.13), Lemma 5.13, p. 20), 891–908 (p. 21) | `Q_n` of rank `16 − n`, `Gr(7 − n, Q_n)`. |
| 8.4 | bfp lines 518–527 (p. 1335), 560–562 (equation (6), p. 1336) | Three orders as printed; "geometrically" is the roadmap's needed precision (Source issues). |
| 9.4 | bfp lines 1298–1305 (Proposition 9.6, p. 1353), 1308–1327 (p. 1354) | All 46 coefficients agree. |
| 10.3 | clp lines 960–962 (p. 22) | `g ≥ 10`, boundary by Theorem 1.5(1). |
| 10.5 | clp lines 992–995 (Corollary 6.2, p. 23) | Exponent `d − 7`. |
| 10.8 | clp-h11 lines 386–388 (Lemma 3.4, p. 9), 463–577 (§4.3, pp. 11–14) | Cases and ordering agree; the roadmap's handling of `n = 11` and of `p ∈ B` is its own and is checked below. |
| 11.2 | clp lines 1038–1048 (pp. 24–25) | Unit decorations and edge exponent in the source; the roadmap's extension to decorations is consistent. |
| 11.3 | clp lines 1069–1072 (Lemma 7.4, p. 25) | Eleven graphs; the multiplicity is R01, item 2. |
| 11.5 | clp lines 1084–1091 (Lemma 7.6, p. 26); getzler-semiclassical lines 639–640 | `6006`; its owner is R01. |

No locator was flagged by the author as unverified. Nothing was fetched. The manifest has 26 works (24 certified with text, 2 settled uncertified) and every work in the References has an entry.

### Adversarial table (values computed in this review)

| Statement | Instances | Values computed | Result |
| --- | --- | --- | --- |
| §8.1 (repair) | `g` even and odd; `(g, q) = (4, 5)` | `#P_g = (q−1)(q^{2g+2} − q^{2g+1}) + (q−1)(q^{2g+1} − q^{2g})`; divided by `q(q−1)²(q+1)`: `q^{2g−1}`; `4·(9765625 − 390625) = 37500000 = 480·78125`; `d = g+1` odd gives `GL₂`, even gives `𝔾_m × PGL₂`, `(q−1)(q³−q) = (q²−1)(q²−q)` | Holds. |
| §0.6 (repair) | `BC₂`; `𝔾_m` on `𝔸² ∖ 0`; `B𝔾_m`; `BG` in general | `ℤ/2` against `0` after `⊗ ℚ`; `[X] ∈ A^{𝔾_m}_2 ↦ A_1(ℙ¹)`; `ℚ[t]` against cycles in dimension `−1` only; for an `r`-dimensional representation with free open `U`, `j + r = i + r − dim G`, so `j = i − dim G` | Shift and three Checks hold. |
| §2.3 Check (repair) | `(4, 1)` | `d = 10`, bound `4g − 4 + n = 13`, `20 − 13 = 7`, `H¹³ = H^{4g−3}` | Holds. |
| §11.7 (repair) | family sizes | `132+11+132+220 = 495`, `66+132+66+66 = 330`, `825 = 891 − 66` | Holds. |
| §0.5 | weights 12, 14, 16, 24 | level-one cusp dimensions `1, 0, 1, 2`; ranks `2, 0, 2, 4`; `L S₁₂` of types `(12,1),(1,12)` | Holds. |
| §2.6 | `n = 3, 4, 5` | point; `ℙ¹`; `2^{n−1} − binom(n,2) − 1 = 16 − 10 − 1 = 5` | Holds. |
| §4.6 | `(n, k) = (13, 15)`; `T^k_n` | strata flags `12 + 3 = n + 2`; divisors of `M̄_{1,3}`: `1 + 4`; contractions `(1, 12−1+5−1) = (1,15)`, `(1, 12−1+3−1) = (1,13)`, `(2, 12−1+2−1) = (2,12)`, `(1, 12−1+4−1) = (1,14)`; `a, b ≥ 11` gives `k ≥ 24`; `n + 2 ≥ 22` gives `n ≥ 20` | Holds. |
| §5.1 | point, `ℙ¹`, elliptic curve | identity; two generators; the `H¹ ⊗ H¹` component of the diagonal is not algebraic | Holds. |
| §6.4 | degrees | `3+3+4 = 2+4+4 = 2+3+5 = 10`, `5+5 = 4+6 = 10`; `Z = (1,4,5), (2,8)` | Holds. |
| §6.5 | `g = 7`, `n = 0`, `x = 1` | `dim H^◇_{4,7} = 2g + 3 = 17 = dim M⁴_7`, so the pushforward is a multiple of the fundamental class | Holds. |
| §7.5 | `n = 0, 4` | ranks `16, 7, 9` and `12, 3, 9`; relative dimension `9(7 − n)`; `10n + 9(7 − n) − 45 = 18 + n = dim M_{7,n}` | Holds. |
| §8.4 | orders; `q = 2` | `q⁴(q−1)²(q+1) = q⁷−q⁶−q⁵+q⁴ = q³·(q³−q)·(q−1)`; `2·#PGL₂(𝔽_{q²}) = 2(q⁶−q²)`; `2(q³−q)² = 72` at `q = 2`; characteristic two: `x₀x₁ + x₂² + a x₃²` is a cone over a perfect field | Holds. |
| §9.4 | leading coefficients | boundary divisors of `M̄_{4,n}`: `3`; `1+2+1 = 4`; `1+1+4+2 = 8`; `1+4+8+4 = 17` | Holds. |
| §§9.4–9.6 | all four rows | closed − boundary: `n = 0`: `(0,…,0,−1,1,1,1)`; `n = 1`: `(0,0,−1,0,0,0,−1,−1,2,2,1)`; `n = 2`: `(0,0,−2,−2,0,0,0,−4,−2,4,3,1)`; `n = 3`: `(−1,2,2,−11,0,0,−1,4,−13,−4,7,4,1)`, sum `−10` | Equal to §9.6. |
| §10.3 | `g = 9, 10` | `(2g−2)/3 = 16/3 < 6`; `= 6` | Holds. |
| §10.5 | `M̄_{0,10}` | `d = 7`, `2d − 14 = 0` | Holds. |
| §10.8 | `n ≤ 10`, `11`, `≥ 12` | `11 < n + 2` for `n ≥ 10`; rational vertex for `p ∉ B` has `\|A\| + 1 − 10 + 1 ≥ 3` flags; contractions: loop graph, genus-two vertex, or sides `10` and `n − 10 ≥ 2` (later in the order); `Φ_A`: `(a, b) ↦ ((a, res b), (b, res a))`, injective; restricting to `B` avoiding a marking `p` is still injective (`d(e_p ∧ ω) = ω − e_p ∧ dω`) | Holds. |
| §11.2 | `(1, 12)`, `(e, c) = (0, 1)` | `d = 12`, `H¹¹ → H¹³` by one ample class; degree `11 + 2 = 13` | Holds. |
| §11.3 | `(1, 12)` | `binom(11, 10) = 11`; basis `ω_i`, `i = 2, …, 12`; `dim H¹³ = dim H¹¹ = 22` | Holds; attribution is R01. |
| §11.5 | family sizes | `binom(14,4) = 1001`; `binom(14,3)·11 = 4004`; `11`; `12·11 = 132`; `13·binom(12,2) = 858`; sum `6006` | Holds. |
| §1.6 against §§11.4–12.3 (R01) | `(1, 13)`, `(2, 12)` | `13 > 10`, `12 > 7`: outside §1.6 | R01. |
| §8.5 (R02) | `g = 4` | `10 − 9 = 1` quadric | R02. |
| §9.8 | `k = 9` | base region `(1, ≤ 9)`, `(2, ≤ 7)`, `(3, ≤ 5)`, `(4, ≤ 3)`; genus five: `2g = 10 > 9` | Holds. |
| §§4.9, 10.2 | `k = 4` | `g′ < 7`, `n′ ≤ 4`; `(6, 4)` inside `c(6) = 5` | Holds. |
| §10.4 | `k = 14` | `(3, ≤ 10)`, `(4, ≤ 8)`, `(5, ≤ 6)`, `(6, ≤ 4)`, `(7, ≤ 2)` against `c = 11, 11, 7, 5, 3` | Holds. |
| §§12.1, 12.2 | `k = 13, 15` | `k = 15`: `(7, ≤ 3)`, `(6, ≤ 5)`, `(5, ≤ 7)`, `(4, ≤ 9)`, `(3, ≤ 11)` inside the ranges; exceptions `(2, 11…13)`, `(1, 11…15)` | Holds, given R01. |
| §7.7 | `g = 7` | `4f − 2g + 1 = 3`; `κ₀ = 12` | Holds. |
| §12.9 | weights | `L S₁₂`: 13; `L⁷`: 14; `L² S₁₂`: 15 | Holds, given R01. |

### Lean form and headline theorems

`lake env lean` on `packages/MotivicStructuresInModuliOfCurves/Suggested.lean`, run from the content checkout: exit 0, no output. The file is `import Mathlib`, one module docstring and an empty namespace: no declaration, no `sorry`, no `set_option`. The one-tactic probe and the `#check @name` comparison have no subject (the lead `and` of the signature tool is a word of the docstring). The seven headline groups of the Summary, and CLP Theorem 1.9, are each named in the docstring as not statable. A case-sensitive search of both pinned trees for `DeligneMumford`, `AlgebraicStack`, `IsStableCurve`, `ModuliStack` finds nothing; Tau Ceti has `ChowGroup` for schemes only (`TauCeti/AlgebraicGeometry/Chow/Basic.lean:295`). Nothing statable is absent and nothing is padding.

Pinned declarations opened: `Mathlib/NumberTheory/ModularForms/LevelOne/DimensionFormula.lean:167`, `:172`, `:262`; `Mathlib/NumberTheory/LegendreSymbol/QuadraticChar/Basic.lean:120`, `:239` (needs `ringChar F ≠ 2`; §8.2 is for odd `q`); `Mathlib/Algebra/IsPrimePow.lean:28`; `Mathlib/LinearAlgebra/QuadraticForm/Basic.lean:160`; `TauCeti/RepresentationTheory/Spin/HalfSpin/Basic.lean:119`, `:260`, `:324`; `TauCeti/RepresentationTheory/Spin/Dimension.lean:73`; `TauCeti/RepresentationTheory/RepresentationRing/Basic.lean:106`, `:127`; `TauCeti/NumberTheory/ModularForms/LevelOne/PeriodPolynomial/Finrank.lean:213`; `TauCeti/Geometry/Hodge/Mixed/Basic.lean:72`. No backticked name is presented as this roadmap's own.

### Suppliers, gaps, duplication

Cited headings resolved again at the current heads: VirtualFundamentalClass §§2.1–2.4 (its lines 440–491); StableReductionPartII §§0.4, 2.248, 3.3, 3.5, 3.7, 3.10, 3.11, 4.14, 5.10, 5.11, 5.15 (the Edidin–Graham comparison is in its second paragraph), 7.11; CanonicalModelsAndGonality §5.4; WeilConjectures WC.1, WC.5, WC.6 with §§1.7, 1.10–1.15, 5.23, 5.27, 6.8; DeligneWeightsAndPurity §§8.24, 9.6; MixedHodgeModulesAndIrregularHodgeTheory §§4.5, 5.1; MotivesAndAlgebraicCycles §§0.6, 2.4, 2.6, 2.7; AutomorphicGaloisRepresentations §1.2; AlgebraicModuliForArithmeticGeometry §§1.3, 5.1; ArithmeticGaloisRepresentations §§5.1, 5.3; SchemeKTheoryOperations §§6.2.1, 6.2.2; HabiroNahmSeries §5.1; MappingClassGroupsAndCanonicalRepresentations §2.3; on main EquivariantIntersectionTheory §§2.1–2.3, 3.3, SchemeAndStackFoundations §§1.18–1.23, 3.2, 4.15, 4.17, 5.1–5.8, StableReduction Layer 1, SchurWeyl Layers 7, 9 and §9.7, AlgebraicCurves Layer 12. The two that fail are R02 and the §5.7 item of R04.

Gaps: the eight slugs are in `design/plan.json` and in the README, each with a named supplier. `stack-rational-chow` now excludes what VirtualFundamentalClass and EquivariantIntersectionTheory state; its Grothendieck–Riemann–Roch clause is provided by no roadmap (searched VirtualFundamentalClass, EquivariantIntersectionTheory, StableReductionPartII). The comparison of §0.6 is provable from the operations the gap lists (fundamental classes by flat pullback from the point, cycle classes by closed pushforward), so the gap needs no further clause.

Duplication by object across main and the open heads: tautological rings, kappa classes, the Chow–Künneth generation property and semi-tautological extensions occur in no other roadmap; AlgebraicGromovWittenTheory forms `ψᵢ` on stable-map moduli, a different object. The one shared object found this round is R02. `scratch/overlaps.md`: no other pull request changes this roadmap, no dropped id, no revision-only id. This package declares no Lean name.

Overlap check: read WeilConjectures, StableReductionPartII, AlgebraicGromovWittenTheory, VirtualFundamentalClass, CanonicalModelsAndGonality and, on main, EquivariantIntersectionTheory and StableReduction (the third list is empty); the pointed stacks, clutching, `ψᵢ` and the Edidin–Graham comparison are StableReductionPartII's, Vistoli's Chow groups VirtualFundamentalClass's, equivariant Chow groups and the hyperelliptic presentation EquivariantIntersectionTheory's, the sieve and counts WeilConjectures', dual graphs StableReduction's, the gonality bound and the genus-four canonical model CanonicalModelsAndGonality's (R02).

Dependency check, with `--movable`:

```text
depcheck: 241 roadmaps, 2260 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line.

### Shape

13 layers, each ending with Examples and Dependencies; every numbered target has a `*Needs:*` line, a locator and Checks, and every definition with an API list has at least three. A scan finds no LaTeX delimiters, pull-request numbers, dates, machine paths, HTML or process words in the README, the Lean file or the manifest.

### Copyright and arrangement

Eighteen passages were put beside their sources: the fifteen sampled targets, and §0.6 against kresch lines 213–229, §8.1 against arsie-vistoli lines 503–508, §9.4 against bfp lines 1298–1305. The longest shared run is five words ("lies in the image of", §6.5), inside a statement the mathematics forces. The arrangement is as round 5 found it: Layers 4, 6, 7, 10, 11, 12 regroup clp §§2–8 with clp-h11, and Layers 1, 2, 8, 9 come from bfp; the order is forced by §§6.2–7.7 needing §5.2, §10.4 needing §§7.7 and 9.8, and Layer 12 needing §§11.9–11.10. No sentence says the roadmap follows a source.

Source independence: 18 passages compared with 8 sources (clp, bfp, clp-h11, keel, kresch, arsie-vistoli, canning-larson, canning-larson-genus-seven), none shared beyond a run of five words; largest share clp, about 94 of 240 locators; contents compared with clp: independent.

## Not verifiable

- `harer-vcd` and `mukai`: settled as uncertified; cited by locator, no text read.
- The multiplicities `264` and `836`: clp states them from an implementation and I did not recompute them; only their consistency with the family sizes was checked.
- The graph families of §§11.4–11.7 are drawn in figures the extraction of clp does not carry; sizes were checked through their sums and the surrounding proofs.
- VirtualFundamentalClass and CanonicalModelsAndGonality are read at the heads of their open pull requests; their section numbers may move before they merge.

## Source issues

- **Misprint** in getzler-semiclassical at the final table, row `n = 14`, p. 491 (arXiv p. 10): the source says the cusp part is `286L³ + 6006L² + 286L`; it should be `286L³ + 6006L² + 6006L + 286`, by duality and the degree-eleven multiplicity `binom(13, 10)`; affects nothing.
- **Error** in bfp at §6, p. 1335: the source says reduced and irreducible quadric surfaces form exactly three orbits; it should be geometrically irreducible ones, a conjugate pair of planes being irreducible over the field; affects nothing.
- **Misprint** in kresch at Remark 2.1.17, p. 8 (arXiv version 1): the source says the group of a quotient stack in dimension `j` is the equivariant group of the same index; it should be index `j + dim G`; affects nothing.
- **Misprint** in clp at §6.2, first sentence of the proof of Theorem 1.5(3), p. 23: the source says the range is even degrees at least fourteen; it should be at most fourteen; affects nothing.
- **Gap** in clp-h11 at Corollary 2.5, p. 7: the source says the pullback to the divisors with ten markings is injective, with no bound on the number of markings; it should require at least twelve; affects the proof.

## For the human reviewers

- **Scope.** `clp` lines 1049–1051 and 1094–1095 take the multiplicities `836` and `264` from an implementation of the Getzler–Kapranov formula (its reference [2], a software repository, `clp` line 1250); README §§11.6 and 11.9 use them (R01).
- **Scope.** README line 27: CLP Lemma 3.2 is printed for all degrees; §4.6 proves it for odd `k` and `k ≤ 23` and does not take the even `k ≥ 24` case as a target.
- **Scope.** The package consumes VirtualFundamentalClass and CanonicalModelsAndGonality, open pull requests by other authors that are not in the merge order; the merge order (line 401) lists a different name, VirtualFundamentalClasses.
- **Licence.** `clp` and `bfp` are recorded in `sources.toml` with `licence_class = "author-page"` (author copies of journal articles); no reuse licence is recorded for either.
- **Licence.** `kannan` is a 2026 arXiv preprint (arXiv 2602.09117v2), used in README §9.1 for a misprint note only.
- **Licence.** `harer-vcd` and `mukai` have status `uncertified`, `licence_class = "none"` and no cached text.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "d0413878e50aab0a08a2f100f64d0982f5507190", "job": "REV-PKG-MotivicStructuresInModuliOfCurves~6", "model": "fable", "worker": "chris-x91"} -->
