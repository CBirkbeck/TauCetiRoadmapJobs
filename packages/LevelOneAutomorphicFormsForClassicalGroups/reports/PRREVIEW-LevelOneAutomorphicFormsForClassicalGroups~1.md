# Review of LevelOneAutomorphicFormsForClassicalGroups (pull request #2285 at 060e3fe)

**Verdict:** needs changes

## R01 (P1) — Finite Satake parameters asserted to have absolute value one

**Location:** `TauCetiRoadmap/LevelOneAutomorphicFormsForClassicalGroups/README.md` §1.1, lines 466–467: "`c_p(π)` is an unordered multiset of `m` nonzero complex numbers of absolute value one by purity (§1.5), without a chosen order."

**Claim:** This is the Ramanujan conjecture at every prime for every element of `Π_alg`, including the non-self-dual and nonregular classes of §§5.5–5.8. §1.5 and its supplier give archimedean purity only.

**Witness:** AutomorphicFormsOnReductiveGroups §5.5: "every archimedean factor is essentially tempered … not Ramanujan". AutomorphicLFunctionsAndLocalFactors §AL.3.3.8 gives only `q^(−1/2) < |α_i| < q^(1/2)` and "does not assert temperedness".

**Repair:** Replace the bullet by: "For every prime `p`, `π_p` is spherical, and `c_p(π)` is an unordered multiset of `m` nonzero complex numbers `α` with `p^{−1/2} < |α| < p^{1/2}` (AutomorphicLFunctionsAndLocalFactors §AL.3.3.8), without a chosen order." Add §AL.3.3.8 to the *Needs:* line of §1.1.

## R02 (P1) — The packet character of the scalar lowest-weight modules has no owner

**Location:** README §3.9, lines 1306–1312 (and §§3.11, 3.12): "Prove: in case (I) … `χ(s_i) = (−1)^{n_id_i/4}` when `d_i` is even and `(−1)^{e_δ(π_i)}` when `d_i` is odd … *Needs:* §§3.2, 3.8."

**Claim:** The formulas of §§3.9, 3.11 and 3.12 are the restriction to `C_ψ` of Mœglin–Renard's packet character of `π_g(k)`. No target here, no supplier section and no pinned declaration provides that character; §3.8's supplier gives membership and multiplicity only.

**Witness:** ModularityAndLanglandsExtensions §3.22: "Occurrence has multiplicity1 … Packet character18.3 is separate." CT20 line 1817 derives (5.2.3) from "Proposition 18.3 of [MR]"; CT20 lines 1880, 1896 and 1905 do the same for (5.2.5), (5.2.7) and (5.2.8).

**Repair:** Declare the gap (same slug in the plan's `gaps`). Under `### From TauCetiRoadmap.ModularityAndLanglandsExtensions` add: "What ModularityAndLanglandsExtensions must provide (gap:scalar-lowest-weight-packet-character): for `ψ` and `π_g(k)` as in its §3.22, in both branches and for each of the two classes of Whittaker datum, the value of the packet character of `π_g(k)` on every element of the component group of `ψ` (Mœglin–Renard, Proposition 18.3 and Remarque 18.4)." Add "ModularityAndLanglandsExtensions §3.22 with the character requested there" to the *Needs:* lines of §§3.9, 3.11 and 3.12.

## R03 (P2) — The explicit formula is applied with `c = 0`, outside the supplier's hypothesis

**Location:** README lines 281–282 and §2.6, line 811: "The Rankin–Selberg application in §2.6 is a specialization of that statement with `c = 0`"; "Apply AnalyticNumberTheoryPartI §1.8 to `Λ₁(s) = Λ(s, π^∨ × π′)` and `Λ₂(s) = Λ(s, π × π′^∨)` with `c = 0`".

**Claim:** At `c = 0` the supplier's hypothesis (iv) requires `|α_i(p)| ≤ 1` for the Rankin–Selberg roots, which is R01.

**Witness:** AnalyticNumberTheoryPartI §1.8 (iv): "with `|α_i(p)|, |β_i(p)| ≤ p^c`". CL14 lines 11408–11412 state that Mestre's hypothesis (iv), taken with `c = 0`, holds only in a weakened form (absolute convergence for `Re s > 1`).

**Repair:** Use `c = 1`. In the contract: "The Rankin–Selberg application in §2.6 is that statement with `c = 1`: the roots `α_i(p)α′_j(p)` have modulus less than `p` by AutomorphicLFunctionsAndLocalFactors §AL.3.3.8." In §2.6: "… with `c = 1`; every zero of `Λ(s, π^∨ × π′)` lies in `0 ≤ Re s ≤ 1`, by absolute convergence of the Euler product for `Re s > 1` (§AL.3.6.1) and the functional equation". In §2.1: "which lie in `WeilTestFunction c F` of AnalyticNumberTheoryPartI §1.3 for every `c ≥ 0`". The conclusion of §2.6 is unchanged (the formula does not involve `c`; `F` has compact support).

## R04 (P2) — The regular packet character is owned twice

**Location:** README lines 100–101 and §3.5, lines 1227–1230: "Section 3.5 here owns only its level-one consequences and the explicit packet character."; "and compute the packet character explicitly as `χ(s_i) = (−1)^{n_id_i/4}` for even `d_i` …".

**Claim:** ModularityAndLanglandsExtensions §3.21 already states CT20 (5.2.1) with its character; §3.5 plans the same formula again.

**Witness:** ModularityAndLanglandsExtensions §3.21: "Chenevier–Taïbi (5.2.1): for `Sp_{2g}`, `ρ_k` with `k_g>g` belongs iff `d_{i₀}=1`, with their specified packet character."

**Repair:** Scope bullet: "… exactly when the odd block has length one, with the packet character of CT20 (5.2.1): ModularityAndLanglandsExtensions §3.21. Section 3.5 here owns only its level-one consequences." §3.5: "The criterion that `ρ_k` lies in the real packet of `ψ` exactly when `d_{i₀} = 1`, with multiplicity one and with packet character `χ(s_i) = (−1)^{n_id_i/4}` for even `d_i` and `(−1)^{e_i}` for odd `d_i`, is ModularityAndLanglandsExtensions §3.21, read on level-one parameters. Prove its level-one consequences: every `π_i` is regular, `I_odd = {i₀}`, and every `i ∈ I_even` has `n_id_i ≡ 0 mod 4`."

## R05 (P2) — The identification of the Golay automorphism group with `M₂₄` is planned again

**Location:** README §8.4, lines 2688–2689: "define `M₂₄` as the group of permutations of `Ω` preserving `G₂₄`. Prove: its order is `244823040`, matching SporadicOrders Layer 1".

**Claim:** The order of the permutation automorphism group of the Golay code is exactly the comparison CFSGBasicProperties P2-L owns; §8.4 neither cites it nor lists it under *Needs:*.

**Witness:** CFSGBasicProperties (main) P2-L: "Prove an explicit equivalence between the P1 `M24` model and the full permutation automorphism group of `C` … neither its code construction nor P1's abstract order theorem supplies it."

**Repair:** "… define `M₂₄` as the group of permutations of `Ω` preserving `G₂₄`; by CFSGBasicProperties P2-L it is the group `M24` of SporadicOrders Layer 1, of order `244823040`. Prove: `(1/|M₂₄|) Σ_{γ ∈ M₂₄} det(t − γ)` is …". Add "CFSGBasicProperties P2-L" to the *Needs:* line of §8.4 and "the equivalence of the Golay permutation automorphism group with `M24`" to the P2-L contract bullet.

## R06 (P3) — §4.3 restates the supplier's level-one trace identity

**Location:** README §4.3, line 1516: "Prove `EP(G; λ) = T_geom(G; λ)`, where the elliptic part of `T_geom` is `T_ell` of §4.1".

**Claim:** The identity is stated by the supplier that §4.3 names; only the description of the proper Levi terms is new here.

**Witness:** AutomorphicSpectralTheory §6.20: "In the split classical groups over `ℤ` of [CT20], at level one, `h=∏_p1_{G(ℤ_p)}` with `vol G(ℤ_p)=1` gives `EP(G;λ)=T_geom(G;λ)`".

**Repair:** "By AutomorphicSpectralTheory §6.20, `EP(G; λ) = T_geom(G; λ)`, with elliptic part `T_ell` of §4.1. Prove that every term of `T_geom` for a proper Levi subgroup `GL₁^a × GL₂^b × G′` is an explicit rational combination …" (rest unchanged).

## R07 (P3) — The `Sp₄` example omits the simple parameters

**Location:** README Layer 3 Examples, lines 1452–1454: "For `Sp₄` and scalar weight `k ≥ 3`, the regular holomorphic parameters are `Δ_w[2] ⊕ [1]` with `w = 2k − 3` and the parameters `Δ_{w₁,w₂} ⊕ [1]` with `w₁ = 2k − 2`, `w₂ = 2k − 4`".

**Claim:** A simple parameter `π[1]` with `π` of rank five satisfies every condition of §3.5 (`I_odd = {i₀}`, `d_{i₀} = 1`, `I_even = ∅`) and is missing from the list.

**Witness:** §7.8's row `(13, 10, 7)` is the genus-3 analogue: the simple parameter `O^odd(24,16,8)` of rank `7 = 2·3 + 1`.

**Repair:** "… the regular holomorphic parameters are the simple parameters `π` with `π ∈ Π_alg` self-dual of rank five and weights `0, ±(k − 1), ±(k − 2)`, the parameters `Δ_w[2] ⊕ [1]` with `w = 2k − 3`, and the parameters `Δ_{w₁,w₂} ⊕ [1]` with `w₁ = 2k − 2`, `w₂ = 2k − 4`; the second kind contributes exactly when `k` is even."

## R08 (P3) — Equation numbers of §§3.11–3.12 do not exist in the cited version

**Location:** README line 1342: "(CT20 §5.2.2, (5.2.5)–(5.2.8))"; line 1357: "Prove (CT20 §5.2.2, (5.2.9)–(5.2.12))".

**Claim:** In hal-02265675v1, whose numbering the References say is used throughout, the statements of §3.11 are (5.2.4)–(5.2.7) and those of §3.12 are (5.2.8)–(5.2.10).

**Witness:** CT20 lines 1872, 1874, 1890, 1898 carry (5.2.4)–(5.2.7); lines 1907, 1911, 1923 carry (5.2.8)–(5.2.10); the text has no (5.2.11) or (5.2.12).

**Repair:** §3.11: "(CT20 §5.2.2, (5.2.4)–(5.2.7))". §3.12: "(CT20 §5.2.2, (5.2.8)–(5.2.10))".

## R09 (P3) — Locator of the weight-23 finiteness

**Location:** README §5.2, lines 1887–1888: "the set of such `π` is finite (CT20 Remark 2.11 and §1.3; CL14 IX Lemme 3.36)".

**Claim:** CL14 IX Lemme 3.36 concerns `K∞^{≤22}` only; positive definiteness on `K∞^{≤23}` and the finiteness statement are Proposition 3.39.

**Witness:** CL14 line 12251 (Lemme 3.36: `V ∈ K∞^{≤22}`, bound on the fibre); CL14 lines 12349–12352 (Proposition 3.39: finitely many classes of motivic weight at most 23, by the Gram matrix at `λ = 9.74`).

**Repair:** "(CT20 Remark 2.11 and §1.3; CL14 IX Lemme 3.36 for weight at most 22 and Proposition 3.39 for weight 23)".

## R10 (P3) — §4.18 points to tables that no listed source contains

**Location:** README §4.18, lines 1820–1821: "Prove that the masses of §§4.12–4.17 are the rational numbers listed in the tables accompanying CT20 Theorems 6–7; this identifies each listed value with the intrinsic mass through §4.11."

**Claim:** The target's statement is neither in the roadmap nor in a text of the References: CT20 Theorems 6–7 give no table, only a pointer to the authors' web data.

**Witness:** CT20 lines 516 and 525: the masses "are given in [CT19b]"; `[CT19b]` is absent from the README's References, and the roadmap states no mass beyond `SO₃`'s.

**Repair:** Delete the first sentence (the masses are already determined, as the unique solutions of §4.11, by §§4.12–4.17) and begin §4.18 with "Prove, for the groups of CT20 Theorem 6 (`SO_n` with `n ≤ 17` and `Sp_{2n}` with `2n ≤ 14`), that `m_P ≠ 0` …". Reword the first Check to "The `SO₃` masses of §4.12 are `(−1/12, 1/4, 1/3)` on `P₁(SO₃)`".

## R11 (P3) — Supplier declaration cited under a name it does not have

**Location:** README line 278: "the admissible test-function class `weil_test_function(c, F)`"; line 687: "admissible class `weil_test_function(0, F)`".

**Claim:** The supplier's predicate has another name.

**Witness:** AnalyticNumberTheoryPartI (main) §1.3: "admissibility of `F` for `c` (Lean `WeilTestFunction c F`)"; `TauCetiRoadmap/AnalyticNumberTheoryPartI/Suggested.lean` line 496: `def WeilTestFunction (c : ℝ) (F : ℝ → ℝ) : Prop`.

**Repair:** Write `WeilTestFunction c F` in both places (with the `c` of R03).

## R12 (P3) — §6.2: three items without the announced locators, and weight zero is used but not stated

**Location:** README §6.2, line 2097: "Prove the following statements, each attributed and located in CT20:"; §7.9, line 2548: "for every `g ≥ 1` and integer `0 ≤ k ≤ 13`"; §8.12: "For `k = 0` it is `1`".

**Claim:** The odd-weight, negative-weight and Wallach items carry no CT20 locator. `M₀(Γ_g) = ℂ`, which §7.9 (at `k = 0`) and §8.12 use, is no target: §§7.5–7.7 and 8.11 assume `k ≥ 1`.

**Witness:** `k = 0`, `g = 1`: §7.9 asserts `S₀(SL₂(ℤ)) = 0`, and its *Needs:* (§§6.2, 7.4–7.7) contain no statement at weight `0`.

**Repair:** Open §6.2 with "Prove the following statements:". Add "(CT20 §5.3.2, proof of Lemma 5.5 and Case (H2))" to the odd-weight item and "(CT20 §5.2.1)" to Wallach's. Replace the negative-weight item by: "Weight at most zero: `M_k(Γ_g) = 0` for `k < 0` and `M₀(Γ_g) = ℂ` for `g ≥ 1`, so `S₀(Γ_g) = 0`. For `k = 0`: by Weissauer's item the form is square-integrable, it generates the trivial module `ρ₀` (§3.4), and a function on `Sp_{2g}(ℚ)\Sp_{2g}(𝔸)` invariant under `Sp_{2g}(ℝ) Sp_{2g}(Ẑ)` is constant by strong approximation (AdelicAlgebraicGroups)." The `k < 0` clause has no locator: cite the text it is taken from.

## R13 (P3) — The description leaves out Layers 6–8 and the declared gaps

**Location:** pull request description, first paragraph: "it builds three things. … Together these give the complete classifications of level-one algebraic cuspidal representations in motivic weight at most 22, the top-simple ones in weight 23 and the regular self-dual ones in weight 24."

**Claim:** The head also plans Layers 6–8, where three of the four theorems of `Suggested.lean` live, and declares eight supplier gaps; a reader of the description learns neither.

**Witness:** README headings "## Layer 6: Siegel forms at level one, lattice theta maps and first occurrence", "## Layer 7 …", "## Layer 8 …"; eight "What … must provide (gap:…)" lines under `## Exact supplier contracts`.

**Repair:** Add: "It then treats Siegel modular forms for `Sp_{2g}(ℤ)`: the genus-`g` and harmonic lattice theta maps and the Rallis relation, the dimension of `S_k(Γ_g)` for `g ≤ 8` and `k_g > g`, all cusp dimensions in weight at most 13 with the four weight-13 forms, their realization by harmonic theta series of the Leech lattice, the Eichler basis theorem in weights 4, 8 and 12, and the stable range `g ≥ 2k`. It declares eight supplier gaps, on AutomorphicFormsOnReductiveGroups (two), AutomorphicSpectralTheory, ModularityAndLanglandsExtensions, MetaplecticAutomorphicForms, GeometryOfNumbersAndQuadraticArithmetic, ReductiveGroups and CFSGBasicProperties."

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §1.1 Satake bullet | suppliers §5.5, §AL.3.3.8 | available bound `p^{−1/2} < |α| < p^{1/2}`; claimed `|α| = 1` | not supported | R01 |
| §1.4, §1.8 epsilon | `Δ₁₁ × Δ₁₅`; `Δ₁₇ × 1`; `I₀` | `i²⁷·i⁵ = 1`; `i¹⁸ = −1`; `ε(1)ε(e) = i = i^{0+1}` | holds | none |
| §2.4 eight scalars (sample) | `Ĝ_ℓ(i/4π)` from `ĝ = 8cos²(πξ)/(π²(1 − 4ξ²)²)` | `4π²ℓ(1 + cosh(ℓ/2))/(ℓ²/4 + π²)²` both sides; `F̂_ℓ(i/4π) = Ĝ_ℓ(0) = 8ℓ/π²` | holds; CL14 line 11662, CT20 line 1557 | none |
| §2.2 `g` of class `C²` | `g′ = −π(1 − x) sin πx` on `[0, 1]` | `g″(1) = 0`, `g″(0) = −π²`, `g″` even | holds | none |
| §2.6 with `c = 0` | hypothesis (iv) of the supplier | `c = 0` needs `|αα′| ≤ 1`; `c = 1` needs `< p`, true | fails as cited | R03 |
| §2.7–2.8 inequality | numerics of `J_{F_ℓ}(U²) − A_{F_ℓ}` | trivial `−0.04` (`ℓ = 1`); `Δ₁₁` `−0.07`; `I₁` `+1.73` (`ℓ = 2`); `I₁₃` never positive | holds | none |
| §2.9 Gram matrix (sample) | `r = 1`, `m = 2`; `ε = −1` pair | `β₁₁ = A/2 − J(U²)`; `(B/4)(1 − ε) = B/2`, the `e⊥` term of (2.3.6) | holds; CT20 line 754 | none |
| §2.14 monotonicity (sample) | new active pair with `ε = −1`, `ε = 1` | entry drops by `B_F/2 ≥ 0`; unchanged | holds on the cone; CT20 line 848 | none |
| §2.15, §2.17 lift (sample) | one block, `A = K = 1`, `m = 2` | lift `t/m`: `C(x,x) = t²(A/m − K) = β`; lift `t/√m`: `t²(A − mK)`; minima `−1`, `−1/2` | holds with `1/m` | none (source issue) |
| §2.19 Miller | `n = 0, …, 12`, eleven values of `ℓ` | `n = 12`: `max(J − A) = 3.9` (odd family), `15.2` (even), at `ℓ = 8`; `n = 0` even family `−0.03` | holds | none |
| §3.3, §3.5 sign test | `Δ_w[2] ⊕ [1]`, `k = (w + 3)/2` | `χ = (−1)^{4/4} = −1`; `ε_ψ = i^{w+1} = (−1)^{k−1}`; equal iff `k` even | holds; owner | R04 |
| §3.4 existence | `(1,1)`; `(1,0,0)`; `g = 1, k = 0` | `1 ≥ 0`; `0 ≥ 1/2` fails; `0 ≥ 0`, weights `0, ±1` distinct | holds | none |
| §3.7 cases (sample) | (H2) at `k = 2` | forces `g = 2`, `d = 3`, `π = 1`, `e ⊂ 1`: impossible, so `k′ ≥ 2` | holds; CT20 lines 1806, 1840, 1843 | none |
| §3.8 membership (sample) | `g = k = 12`, `Δ₁₁[12] ⊕ [1]` | weights `11…0, 0…−11, 0` = `0, ±(12 − i)`; `11 > 0` | holds; CT20 line 1769 | none |
| §§3.9–3.13 | sign identity `a ≤ 4`, `ε = ±1`; `Δ₁₁[12] ⊕ [1]` | exponents `0,1,1,2` and `−1,−1,−2,−2` match products; `χ = (−1)⁶ = 1 = i¹²` | formulas consistent; input unowned | R02 |
| §3.14 `EP` (sample) | `SO₃`, `k = 0, 5` | `1` and `−1`; masses give `1/2 + 1/2` and `−11/12 − 1/4 − 1/3 + 1/2` | holds; CT20 line 339 | none |
| §4.3 Levi terms (sample) | `SO₃`, `a = 1` | Tai17 Theorem 3.3.3 coefficient `1/2`, independent of `k` | holds; identity is the supplier's | R06 |
| §4.4, §4.9, §4.16 index sets (sample) | enumeration, all groups listed | `Sp`: `3,12,32,92,219,530,1158,2521`; `SO`: both rows as stated; hard `Sp₁₆`: `766` | holds, `1158` included | none |
| §4.7 `spinor_charpoly_obstruction` | `n = 0, 1`; hyperbolic plane; `SO₃` with `Φ₁Φ₄` | `P = 1`; `γ = 1`; `s² − 4` a square in every `ℚ_p` forces `s = ±2`; `tr² = 2 det` impossible in `ℤ₂` | true, no finite-order hypothesis needed | none |
| §4.10 characters | `λ = (1)`, `(2)` | `e₁`; `e₁² − e₂ = x² + 1 + x⁻²`; `e₁² − e₂ − 1 = 5` at the identity | holds | none |
| §4.12 `SO₃` | 5 × 5 system, `k = 5` | `det = 288`; `m = (−1/12, 1/4, 1/3, 0, 0)` solves all rows; `dim S₁₂ = 1` | holds | none |
| §§5.4–5.10 | lists against CT20 Theorems 3–5, Proposition 4.1, Lemma 4.3 | `2 + 3 + 7 + 1 = 13`; `dim U_exc = 14`; rank 16; `I₂₃`: `J − A/3 = +0.22`, `J − A/2 < 0` | identical | none |
| §6.1 Zharkovskaya (sample) | `g = 1` Eisenstein; `g = k` | `ζ(s)ζ(s + k − 1)ζ(s − k + 1)`, `g − k = 1 − k`; `ζ(s)²` | holds; CT20 line 2048 | none |
| §6.6 coefficients (sample) | `ν = 1`; `h = diag(t, 1, …)` | `Δ_ij ω = 0`; total Laplacian plus `det`-equivariance gives every `Δ_ij p = 0` | equivalent to CL14 line 5448 | none |
| §6.7 harmonic theta (sample) | `n = 24`, `ν = 1` | weight `13`; tuples of rank `< g` have coefficient `0` | holds; CT20 line 2241 | none |
| §6.8 table | 24 rows | all dimensions `24`; degree rule `[23 − 2g₀]`; counts sum to `24` | matches CL14 lines 559–572, 16640–16657 | none |
| §6.9 Rallis (sample) | `n = 8`, `g = 8` | `[7] ⊕ [1] ⊕ [9]`, dimension `17`; with `g₀ = 0` a negative length | holds with `g` | none (source issue) |
| §6.11 central values (sample) | `Δ₁₉,₇`, `Δ₂₁,₁₃`, `Δ₁₇` | `i²⁰i⁸ = 1`; `i²²i¹⁴ = 1`; `i¹⁸ = −1` | holds; CL14 line 12315 | none |
| §7.3 (sample) | recursion bound | dual dimension `2g + 1 ≤ 17`; `g = 8` needs `Sp₁₆` | CT20 line 114; not recomputed | none |
| §7.4, §7.8, §7.9 | own enumeration of parameters and sign test | `223` candidates, `198` shapes, `58` pass, `29 + 29`; the 58 rows equal the two tables | holds | none |
| §7.10 | `g = 24` | `±12` once, `±1…±11` twice, `0` three times, on both sides | holds | none |
| §8.4 | orientable sizes from Lemma 1.3 | `0,1,7,8,8,9,11,12,12,13,15,16,16,17,23,24` = coefficients of Fact 1.1 | consistent; identification duplicated | R05 |
| §8.5 `finrank_…_of_rootless` | `g = 0`, `g > 24` | `1`; `0`; five coefficients `1` at `g = 0, 8, 12, 16, 24` | consistent with CT19a lines 26, 283 | none |
| §8.5 `…_eq_bot_of_roots_span` | rank one; degenerate form | `ω(x) = −ω(x)`; contraction of `ω` with each root vanishes, so `ω = 0` | true, also for degenerate forms | none |
| §8.6 `exists_thetaCoefficient_…` | `g = 24`; `n_g` | coefficient `±|O(Leech)|`; `n₈ = |O|/10`, `n₁₂ = |O|/3` | consistent with CT19a line 105 | none |
| §8.7 orders | five rows; `g = 16` | every row sums to `0`; `γ`: `i ∈ {9,11,13,15}`; `ω`: `16 − 12 = 4` | matches BoechererNote lines 114–118 | none |
| Layer 3 Examples | `Sp₄` | simple rank-5 parameters satisfy §3.5 and are not listed | incomplete | R07 |

- Source locators checked against the cached texts: CT20 about 60, CL14 12, CT19a 14, Tai17 6, BoechererNote 2, Mil02 1.
- Library declarations opened at the pins: 26, among them `TauCeti.IntegralLattice` (`IntegralLattice/Basic.lean:63`), `Isometry` (`Isometry/Basic.lean`, maps the carrier onto the carrier), `leechLattice` (`Rank24/Leech/Basic.lean:236`), `vectorsOfNorm_two_leechLattice` (`Leech/Minimum.lean:189`), `Symplectic.groupScheme` (`AlgebraicGroup/Symplectic/Basic.lean:120`), `orthogonalSpinorNorm` (`SpinorNorm/Basic.lean:98`), `ModularForm.dimension_level_one` (`DimensionFormula.lean:262`); no Siegel modular form or automorphic representation at either pin.
- Cross-roadmap citations resolved: 96 section and layer headings, in 11 roadmaps at their open heads and 12 on main; all exist. Declared gaps: eight read; the README's pairing of `B_n` with the odd-rank form is the correct one.
- Gate at 060e3fe: every check passed. Dependency check: `depcheck: 239 roadmaps, 2172 edges, 0 problem(s)`.
- Elaboration of `Suggested.lean`: `sorry` the only warning (four declarations). Elaborated signatures of all eight declarations compared with §§4.7, 8.5, 8.6: equal, no binder lost.
- One-tactic probe (`simp`, `rfl`, `simp_all`, `infer_instance`, `aesop`) on a scratch copy: no theorem closes.
- Overlap check: read SiegelModularForms, OrthogonalTamagawaAndLatticeMass, ModularityAndLanglandsExtensions, LatticePackingsAndPerfectForms, AutomorphicLFunctionsAndLocalFactorsPartII, Rank24LatticeConstructions, ThetaSeries, AlgebraicCodingTheory; shared: the regular packet character (owner ModularityAndLanglandsExtensions §3.21, R04); level-one Siegel operator and theta maps (owner this roadmap, SiegelModularForms cites §§6.1–6.2, 6.4, 6.7).
- Source independence: 12 passages compared with 6 sources, none shared beyond formulas and statements of a dozen words; largest share CT20, 119 of 173 locators; contents compared with CT20: independent (Layer 3 ↔ §§5.1–5.2 precedes Layer 4 ↔ §3, forced by §4.11 needing §3.16; Layer 6 mixes CL14 V and CT20 §§5.3–5.5).

## Not verifiable

- KT87 (uncertified): the determinant formulas of §4.10 were checked on `λ = (1), (2)` only, not against the text.
- Böcherer 1989, Theorem 5 (not in the manifest): the hypotheses of the criterion in §6.12 and in gap:boecherer-theta-image; read only through BoechererNote.
- Mœglin–Renard, Arthur, Weissauer, Freitag, Resnikoff: cited through CT20 and the suppliers; not read.
- The mass values of CT20 Theorems 6–7 and the 181 parameters of `V`: data outside the cached texts.
- The `sin(2π/i)` misprint of §4.12's Check: the extraction at CT20 line 468 has lost the fraction bars.

## Source issues

- **Misprint** in CT20 at Table 2, p. 28, and §3.3, p. 33: the source says the number of classes of `P(Sp₁₄)` under negation is 1157; it should be 1158; affects nothing.
- **Misprint** in CT20 at §1.4, p. 10: the source says rationality uses Artin `L`-values at non-negative integers; it should be non-positive integers; affects nothing.
- **Error** in CT20 at §2.4.2, p. 20, before Corollary 2.9, and §2.4.5, p. 23: the source says the embedding with coefficients `1/√m` carries `β_Q` to `β_Q′`, with equal minima; it should be coefficients `1/m`, and only the signs of the minima agree (`A = K = 1`, `m = 2`: `−1` and `−1/2`); affects a stated result.
- **Misprint** in CT20 at §2.4.7, p. 25: the source says the known set has one element for every other `w`; it should be `dim S_{w+1}(SL₂(ℤ))` elements, two at `w = 23`, four at `w = 53`; affects nothing.
- **Misprint** in CT20 at footnote 13, p. 33: the source says `dim S₂₃(SL₂(ℤ)) = 2`; it should be `dim S₂₄(SL₂(ℤ)) = 2`; affects nothing.
- **Misprint** in CT20 at §4.1, p. 36: the source says the 187 resistant parameters lie in `U₂`, and gives both 12230 and 12293 for the size of `U₁`; it should be `U₁`, with one size; affects nothing.
- **Gap** in CT20 at §4.1, p. 36: the source says no self-dual class has any of the six multiplicity-free resistant parameters; it should say none beyond the known rank-10 class, whose parameter is the first of the six; affects nothing.
- **Misprint** in CT20 at §4.2, proof of Theorem 5, p. 38: the source says symplectic groups of rank `2n ≤ 8` suffice; it should be `2n ≤ 14`, since ranks 13 and 15 occur; affects nothing.
- **Misprint** in CT20 at §4.2, proof of Lemma 4.3, p. 37: the source says the known set has 15 elements; it should be 16 classes in 15 pairs of parameter and self-duality; affects nothing.
- **Misprint** in CT20 at §4.3, proof of Theorem 4, p. 38: the source says the dual pair is excluded with `δ = m = 2`; it should be `δ = 0`, `m = 2`; affects nothing.
- **Misprint** in CT20 at Remark 5.3, p. 45: the source says `k ≥ 2` and excludes `k = 2`; it should be `k ≥ 3`; affects nothing.
- **Misprint** in CT20 at §5.3.2, p. 50, the Rallis relation: the source says the added block has length computed from the degree `g₀`; it should be the genus `g` of the form, as in Lemma 5.7; affects nothing.
- **Misprint** in CT20 at §5.3.1, p. 48: the source says 199 parameters of which 59 pass, for genus at least one; it should be 198 and 58, matching the 29 + 29 rows of Tables 5 and 6; affects nothing.
- **Misprint** in CT20 at §1.2, p. 5, definition of a regular vector: the source says the condition holds for all `i ≠ j` with `i = j − 1`; it should be for all `i < j`; affects nothing.

## For the human reviewers

- **Scope.** The headline theorems are computer-assisted in the source: about 12,000 interval-arithmetic exclusions (CT20 line 1485), full column rank of a 3477 × 2948 matrix (line 1363), orbital integrals for `Sp₁₆` (line 1382); their data are on the authors' web page.
- **Licence.** BoechererNote is an unpublished note on an author's page (manifest `licence_class = "answered-by:CBirkbeck"`); it is the only source of §8.7's table of orders.
- **Licence.** The tables of §§6.8, 7.8 and 7.9 state the content of CL14 Table C.5 and CT20 Tables 5–6 in the README's own columns and grouping; the rows of §§7.8–7.9 were recomputed independently here.
