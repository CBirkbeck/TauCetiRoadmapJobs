# Review of LevelOneAutomorphicFormsForClassicalGroups (pull request #2285 at 9d747e1)

**Verdict:** needs changes

## R01 (P3) — §1.5 proves what §1.1 already puts in the definition

**Location:** `TauCetiRoadmap/LevelOneAutomorphicFormsForClassicalGroups/README.md` §1.5, lines 574–575: "Prove: for `π ∈ Π_alg`, `ℝ_{>0}` acts trivially on `L(π∞)`, `−1` acts by a scalar, and all weights lie either in `ℤ` or in `½ + ℤ`".

**Claim:** These three clauses are the definition of `Π_alg` in §1.1, so the target has no content and its *Needs:* entry AutomorphicFormsOnReductiveGroups §5.5 (purity) is used by nothing. The statement that carries the purity input, the agreement with the infinitesimal-character definition, is not stated.

**Witness:** §1.1, lines 469–470: "a direct sum of characters `z ↦ z^p z̄^q` … with `p, q ∈ ½ℤ` and `p − q ∈ ℤ`, trivial on `ℝ_{>0}`, on which `−1 ∈ ℝ^×` acts by a scalar". CT20 lines 187–189 define algebraicity by the infinitesimal character; lines 555–557 give the equivalence.

**Repair:** Begin §1.5 with: "By §1.1, `ℝ_{>0}` acts trivially on `L(π∞)`, `−1` acts by a scalar, and the weights lie all in `ℤ` or all in `½ + ℤ`. Prove: a unitary cuspidal representation `π` of `PGL_m(𝔸_ℚ)` satisfies the condition of §1.1 exactly when the infinitesimal character of `π∞` has eigenvalues `w_i ∈ ½ℤ` with `w_i − w_j ∈ ℤ` (CT20 §1.2 and §2.1; AutomorphicFormsOnReductiveGroups §§5.1 and 5.5), and the eigenvalues are then the weights of `L(π∞)`. Prove further that the weight multiset is stable under negation …" (rest unchanged). Tested on `Δ`: eigenvalues `±11/2` and `L(π∞) = I₁₁`; `|·|^{it}`, `t ≠ 0`, fails both sides.

## R02 (P3) — Locator of the finiteness of the fibres

**Location:** README §1.7, line 618: "Prove that these sets are finite (CT20 Problem 1 and §2.4.2)".

**Claim:** CT20 §2.4.2 (Question 2.4 and the quadruples) contains no finiteness statement; the finiteness remark follows Corollary 2.3 in §2.4.1.

**Witness:** CT20 lines 738–739 (after Corollary 2.3 and (2.4.2), before the heading of §2.4.2 at line 742): the bound is read as an effective form of Harish-Chandra's finiteness theorem.

**Repair:** "(CT20 Problem 1 and §2.4.1, after Corollary 2.3)".

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| Previous R01, §1.1 Satake bullet | supplier §AL.3.3.8 at its head | head: "`p^{−1/2} < |α| < p^{1/2}`"; supplier: `q^(−1/2)<|α_i|<q^(1/2)`, no temperedness | repaired | none |
| Previous R02, packet character | MR18 lines 2440–2449; supplier §3.22 | gap line added under ModularityAndLanglandsExtensions; §3.22 still says the character "is separate"; Proposition 18.3 on p. 46 | repaired | see human reviewers |
| Previous R03, §2.6 with `c = 1` | hypothesis (iv), zero range of supplier §1.8 | roots `< p = p^c`; zeros summed in `−1 ≤ Re ≤ 2`; all zeros in `0 < Re < 1` by §AL.3.6.3 | repaired | none |
| Previous R04, R06 | §3.5, §4.3 at head | both now begin with the supplier's statement ("is ModularityAndLanglandsExtensions §3.21", "By AutomorphicSpectralTheory §6.20") | repaired | none |
| Previous R05, R11 | CFSGBasicProperties P2-L; `WeilTestFunction` | §8.4 cites P2-L for `M24`; AnalyticNumberTheoryPartI `Suggested.lean` line 496 has `WeilTestFunction` | repaired | none |
| Previous R07 | `Sp₄`, scalar `k` | rank-5 simple parameters listed; `Δ_{2k−2,2k−4} ⊕ [1]`: `χ = −1`, `ε_ψ = i^{4k−4} = 1`, never passes (not claimed) | repaired | none |
| Previous R08, R09 | CT20 lines 1872–1923; CL14 lines 11932, 12058, 12226, 12251, 12349 | (5.2.4), (5.2.5)–(5.2.7), (5.2.8)–(5.2.10); Lemmes 3.19, 3.27, 3.34, 3.36; Proposition 3.39 | repaired | none |
| Previous R10, R12, R13 | §4.18, §6.2, description | table sentence gone; `M₀ = ℂ` stated, (5.5.2) "otherwise" branch covers `k < 0`; description names Layers 6–8 and nine gaps | repaired | none |
| §1.5 purity | definition of §1.1 against the target | three clauses coincide with the definition | no content | R01 |
| §1.7 counts | `(0)`; `(23/2, −23/2)`; a dual pair | `1, 1`; `N = 2 = dim S₂₄`; `N − N⊥ = 2` even | holds; locator | R02 |
| §1.9 weights | `Sp₂`, `SO₃`, `SO₄` `(1, ±1)`, `W₂` | `(k+1, 0, −k−1)`; `k + 1/2`; both `(2, 1, −1, −2)`; no permitted group of dual dimension 2 | holds; CT20 lines 351–356 | none |
| §2.1 (POS), admissibility | `C²` compact support in supplier §1.3, any `c` | weighted integrability and variation hold; `(F(x) − F(0))/x` is `−F(0)/x` outside the support, monotone | holds; CT20 lines 638–640 | none |
| §2.11 principal faces | `diag(1, −1)`; `[[1,2],[2,1]]` | `−1` on `{2}`; eigenvalues `3, −1`, least eigenvector `(1, −1)`, `μ = 1 + 2 sin 2θ ≥ 1` | holds; CT20 line 782 | none |
| §2.15 compression | one block, `A = K = 1`, `m = 2` | lift `t/m`: `(mA − m²K)/m² = A/m − K = −1/2`; lift `t/√m`: `A − mK = −1`; expanded minimum `−1` | holds with `1/m` | source issue |
| §3.3 multiplicity test | `Δ_w[2] ⊕ [1]`, `k = (w+3)/2`; `SL₂` parameter `diag(−1,−1,1)` | `χ = −1`, `ε_ψ = (−1)^{k−1}`; packet of two, one `SL₂(ℤ_p)`-spherical | holds; Tai17 lines 2313–2315, p. 305 | none |
| §4.9 index sets | own enumeration, all 20 groups | `Sp`: `3,12,32,92,219,530,1158,2521`; `SO`: `P` and `P₁` rows as stated | holds; `1158` | source issue |
| §4.12 `SO₃` | `k = 0, 1` rows, masses | `−1/12 + 1/4 + 1/3 = 1/2`; `−3/12 − 1/4 + 0 = −1/2` | holds | none |
| §6.6 pluriharmonic | total Laplacian plus `det^ν`-equivariance | `tr(D(X)(AᵀA)⁻¹) = 0` for all `A` gives `D = 0`: every `Δ_ij p = 0` | equivalent to CL14 lines 5448–5450 | none |
| §6.12 Böcherer | five `(g, n)` | `n/2 − g = 0, 4, 0, −4, −12`; factors as BoechererNote lines 18–40 | holds | none |
| §7.7 case (H2) | `(16, 13)`; two rejected shapes | weights `±12…±5, ±3, ±2, ±1, 0, 0`, `4` omitted; `χ = (−1)³, (−1)¹ = −1` against `ε_ψ = 1` | holds; CT20 lines 2116–2203 | none |
| §7.8 nonscalar spaces | 29 rows against CT20 lines 2344–2372; `(13,10,7)`, `(11,11,7,7)` | same 29 pairs; `12, 8, 4`; `10, 9, 4, 3` | holds | none |
| §8.1 Eichler basis | `g > k`, induction step | `S_k(Γ_g) = 0` makes `Φ_g` injective; `Φ_g(θ_g(v) − F) = 0` | holds; CT20 lines 2216–2221 | none |
| §8.2 dimensions | `k = 4, 8, 12` | `1`; `1` then `2` from `g = 4`; cumulative `1,2,3,4,6,8,11,14,18,20,22,23,24` from §7.9's rows | holds; CT20 lines 2225–2228 | none |
| §8.5 `finrank_invariantAlternatingForms_of_rootless` | `g = 0`, `g > 24`, five degrees | `1`; `0`; coefficients of `t²⁴ + t¹⁶ + t¹² + t⁸ + 1` | consistent with CT19a lines 26, 283 | none |
| §8.5 `invariantAlternatingForms_eq_bot_of_roots_span` | tuple containing a root `x` | `ω(x, y, …) = ω(−x, y + cx, …) = −ω(x, y, …)` | holds; CT19a line 1052 | none |
| §4.7 `spinor_charpoly_obstruction`, §8.6 `exists_thetaCoefficient_ne_zero_of_rootless` | `SO₃`, `Φ₁Φ₆`; `g = 24` | `Φ₆(−1) = 3` not a square; coefficient `±|O(Leech)|` | consistent with §4.12 and CT19a line 105 | none |
| §8.12 stable dimensions | `k = 0, 1, 2, 3, 4` | `1`; `0, 0, 0`; `1 = |X₈|` | holds; CT20 lines 2292–2293 | none |

- Source locators checked against the cached texts this round: CT20 31, CL14 7, CT19a 6, MR18 2, Tai17 1, BoechererNote 1.
- Supplier sections read at their heads: ModularityAndLanglandsExtensions §§3.21–3.22, AutomorphicLFunctionsAndLocalFactors §§AL.3.3.8, AL.3.6.2–3, AnalyticNumberTheoryPartI §§1.3, 1.8, AutomorphicFormsOnReductiveGroups §§5.1, 5.5, CFSGBasicProperties P2-L, SiegelModularForms scope; the worker's citation check lists none unresolved.
- Declared gaps: nine in the README, each with a named supplier and one statement; the ninth is precise against MR18 Proposition 18.3.
- Gate at 9d747e1: every check passed. `depcheck: 239 roadmaps, 2174 edges, 0 problem(s)`; no change outside the folder.
- Elaboration of `Suggested.lean`: `sorry` the only warning (four theorems). The file is unchanged since 060e3fe; the eight elaborated signatures equal §§4.7, 8.5, 8.6, no binder lost.
- One-tactic probe (`simp`, `rfl`, `infer_instance`, `aesop`, `simp_all`, `decide`) on a scratch copy: no theorem closes. The four headline theorems statable at the pins are stated; the module docstring names the others with their missing carriers.
- Overlap check: read SiegelModularForms, OrthogonalTamagawaAndLatticeMass, ModularityAndLanglandsExtensions, AutomorphicLFunctionsAndLocalFactorsPartII, LatticePackingsAndPerfectForms, Rank24LatticeConstructions, ThetaSeries, AlgebraicCodingTheory; shared: level-one Siegel operator, theta maps and singular-range statements (owner this roadmap, SiegelModularForms cites §§6.1–6.2, 6.4, 6.7, 7.3, 7.9); regular packet character (owner ModularityAndLanglandsExtensions §3.21, cited).
- Source independence: 14 passages compared with 6 sources, none shared beyond formulas and statements of a dozen words; largest share CT20, 121 of 177 source citations; contents compared with CT20: independent (Layer 3 ↔ §§5.1–5.2 precedes Layer 4 ↔ §3, forced by §4.11 needing §3.16; Layers 6 and 8 mix CL14 V, CT19a and CT20 §§5.3–5.5).

## Not verifiable

- KT87 (uncertified): the determinant formulas of §4.10, not read against the text.
- Böcherer 1989, Theorem 5 (not in the manifest): read only through BoechererNote.
- Arthur, Weissauer, Freitag, Resnikoff: cited through CT20 and the suppliers; not read.
- Tai17 Theorems 3.3.3–3.3.5 and 4.2.3: the extraction has lost the statement headings; not in the sample, not re-read.
- The mass values of CT20 Theorems 6–7 and the 181 parameters of `V`: data outside the cached texts.

## Source issues

- **Error** in CT20 at §2.4.2, p. 20, before Corollary 2.9: the source says the embedding with coefficients `1/√m` carries `β_Q` to `β_Q′` and the negative minima are equal; it should be coefficients `1/m`, with only the signs of the minima agreeing (`A = K = 1`, `m = 2`: `−1` and `−1/2`); affects a stated result.
- **Misprint** in CT20 at Table 2, p. 28, and §3.3, p. 33: the source says `P(Sp₁₄)` has 1157 classes under negation; it should be 1158; affects nothing.
- **Misprint** in CT20 at §1.2, p. 5, definition of a regular vector: the source says the condition holds for all `i ≠ j` with `i = j − 1`; it should be for all `i < j`; affects nothing.

## For the human reviewers

- **Declared gaps.** The gap `gap:scalar-lowest-weight-packet-character` (README line 332) has no entry in the `gaps` list of `packages/LevelOneAutomorphicFormsForClassicalGroups/design/plan.json`, which has eight slugs; the intake reads that list to announce gaps.
- **Scope.** The headline theorems are computer-assisted in the source: about 12,000 interval-arithmetic exclusions, full column rank of a 3477 × 2948 matrix, orbital integrals for `Sp₁₆` (CT20 §§3.3, 4.1); their data are on the authors' web page.
- **Licence.** BoechererNote is an unpublished note on an author's page (manifest `licence_class = "answered-by:CBirkbeck"`); it is the only source of §8.7's table of orders.
- **Licence.** The tables of §§6.8, 7.8 and 7.9 state the content of CL14 Table C.5 and CT20 Tables 5–6 in the README's own columns; §7.8's 29 rows equal CT20 Table 6 row for row (CT20 lines 2344–2372).
