<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13039#issuecomment-6905283375 -->
Red team round 1 pass a (claude) of 64d2ae0

Verdict: needs_changes

**For the human reviewers:** this review raises 5 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) gap:stack-rational-chow asks for less Riemann–Roch than §6.5 uses

   - **Location.** `packages/MotivicStructuresInModuliOfCurves/README.md:64` (and the same `needs` in `design/plan.json`): "…and Grothendieck–Riemann–Roch for the universal curve over `M̄_{g,n}`"; against `README.md:919`: "gap:stack-rational-chow (proper pushforward and Grothendieck–Riemann–Roch on stacks)".
   - **Claim.** §6.5 is supplied by the gap.
   - **Witness.** §6.5 expands in Chern classes of the Casnati–Ekedahl bundles `E`, `F`, defined from the degree-four cover `α : C → ℙ` over the Hurwitz stack (`clp` lines 574–581, 595–597). `α_*O_C` is not pulled back from the universal curve over `M̄_{g,n}`, so the gap's clause does not cover it. §7.6 (`README.md:1042`) is covered.
   - **Repair.** Add a gap in the README's SchemeAndStackFoundations subsection and in the `gaps` list of `design/plan.json` (the existing `needs` stays as designed):

     `What SchemeAndStackFoundations must provide (gap:stack-representable-grr): for a proper, representable, local-complete-intersection morphism f : X → Y of smooth finite-type algebraic stacks over a field that are stratified by quotient stacks, and a vector bundle E on X, the identity ch(f_! E) · td(T_Y) = f_*(ch(E) · td(T_X)) in the rational Chow ring of gap:stack-rational-chow, extending §5.8 on schemes; it is applied to the degree-four cover C → ℙ and the ℙ¹-bundle ℙ → H_{4,g,n} of §6.3.`

     and change the *Needs* of §6.5 to "…SchemeAndStackFoundations, gap:stack-rational-chow (proper pushforward) and gap:stack-representable-grr (Grothendieck–Riemann–Roch for the cover `C → ℙ` and the bundle `ℙ → H_{4,g,n}`)"; list the slug in the Layer 6 Dependencies line. Tested on the witness: `α : C → ℙ` is finite flat between smooth stacks, hence proper, representable and lci, and `ℙ → H` is a `ℙ¹`-bundle.

2. **F02** (P3) §§12.1–12.2: boundary Künneth factors are cited in cohomological degree, the argument is in homological degree

   - **Location.** `README.md:1732`: "exactly one factor is odd, by §9.8, of degree eleven, in `S_ω` by §10.9, or thirteen", *Needs* `README.md:1734` listing §10.1; `README.md:1744`: "even of degree at most four (§10.2)", *Needs* `README.md:1746`.
   - **Claim.** §§10.1, 10.2 and 10.9 supply the boundary factors.
   - **Witness.** For `M̄_{3,12}` and the divisor `M̄_{1,12} × M̄_{2,2}`, `H₁₃` of the divisor contains `H₁₁(M̄_{1,12}) ⊗ H₂(M̄_{2,2}) = H¹³(M̄_{1,12}) ⊗ H⁸(M̄_{2,2})` (`d = 12`, `d = 5`). `H⁸` is outside §10.1 (`k ≤ 3`); `H₂` tautological is §10.4. `H₁₁ = H^{2d−11}` is not §10.9's `H¹¹`.
   - **Repair.** §12.1 route, last sentence: "In the Künneth decomposition of the boundary term `H₁₃(D̃)` exactly one factor has odd homological degree, eleven or thirteen (odd homology vanishes through degree nine by §9.8 and duality), and the other has homological degree two or zero, tautological by §10.4. A factor `H₁₃` is in `S_ω` by induction; a factor `H₁₁(M̄_v) = H^{2d_v−11}(M̄_v)` is zero if `d_v < 11` and is `a^{d_v−11} · H¹¹(M̄_v)` otherwise, by hard Lefschetz with a tautological `a` (§4.12), hence in `S_ω` by §10.9." In its *Needs* replace `10.1` by `10.4`. §12.2 route: replace "odd of degree `11, 13, 15` or even of degree at most four (§10.2)" by "of odd homological degree `11, 13, 15` (treated as in §12.1, with §12.1 for `H₁₃`) or of even homological degree at most four (§10.4)"; in its *Needs* replace `10.2` by `10.4`. Tested on the witness: `H₂(M̄_{2,2})` is §10.4 at `k = 2`; `H¹³(M̄_{1,12}) = a · H¹¹(M̄_{1,12})`.

3. **F03** (P3) §11.5, family (e): the stated index set gives 726, not 858

   - **Location.** `README.md:1651`: "(e) a tail `{x, k}`, `k ≠ x`, with `ω_{ij}` for an unordered pair of the twelve original markings other than `k` (`858`)".
   - **Claim.** Family (e) has 858 members.
   - **Witness.** For `k ∈ {1, …, 12}` only eleven original markings differ from `k`: the count as written is `66 + 12 · 55 = 726`. The source lets `i, j, k` equal `y` (`clp` line 1087), which gives `13 · 66 = 858`, the README's own Check (`README.md:1658`).
   - **Repair.** "(e) a tail `{x, k}`, `k ≠ x`, with `ω_{ij}` for an unordered pair `{i, j}` of the twelve markings other than `x` and `k` (so `i`, `j` or `k` may be `y`) (`858`)". Tested: `k = y` gives `binom(12, 2) = 66`, `k = 1` gives `66`, total `13 · 66 = 858`.

4. **F04** (P3) §2.2: the locator does not cover `g = 1`

   - **Location.** `README.md:397`: "`H^{4g−3}(M_{g,1}, ℚ) = 0` for `g ≥ 1` (CFP, Theorem 1, which treats the closed surface and the surface with one marked point…".
   - **Claim.** CFP Theorem 1 gives the marked statement for `g ≥ 1`.
   - **Witness.** `cfp` Theorem 1 opens "For any g ≥ 2" (`cfp` line 24); `mss` Theorem 1.4 likewise (`mss` line 121). The case `g = 1` is used: §2.3 at `(1, 1)`.
   - **Repair.** After the citation add: "For `g = 1` the statement is `H¹(M_{1,1}, ℚ) = Hom(SL₂(ℤ), ℚ) = 0`, the abelianization of `SL₂(ℤ)` being finite (cyclic of order twelve); the cited theorems are for `g ≥ 2`." Tested on `g = 1`: `4g − 3 = 1`, and §2.3 then gives `H_c^k(M_{1,1}) = 0` for `k < 2`, consistent with `e_c(M_{1,1}) = L`.

5. **F05** (P3) the Summary omits a headline that `Suggested.lean` lists

   - **Location.** `Suggested.lean:31–32` ("the cohomology of `M̄_{3,n}` for `n ≤ 11` is a polynomial in `L` and `S₁₂` (README §12.10…") against `README.md:3` and `README.md:7` ("every end theorem listed in the summary").
   - **Claim.** README and Lean agree on the headline theorems.
   - **Witness.** The Summary's list of end theorems ends with CLP Theorem 1.1; CLP Theorem 1.9 (§12.10) is not in it, so the Scope sentence does not cover §12.10.
   - **Repair.** In the Summary, before the final full stop, add: "; and the cohomology of `M̄_{3,n}` for `n ≤ 11` is a polynomial in `L` and `S₁₂` after semisimplification (CLP, Theorem 1.9)".

6. **F06** (P3) §4.9 route: genus-one triples outside the region are cited to a genus-two statement

   - **Location.** `README.md:725`: "by §4.2 when `n′ > k′` (for genus one by §3.2), by §3.5 when `k′ > 4g′ − 4 + n′` or `k′ ≤ (2g′ − 2)/3`".
   - **Claim.** §3.5 gives the vanishing for `k′ > 4g′ − 4 + n′`.
   - **Witness.** §3.5 is stated for `g ≥ 2` (`README.md:556`). The triple `(g′, n′, k′) = (1, 10, 11)` has `4g′ − 4 + n′ = 10 < 11`, lies outside the seed region and is of genus one.
   - **Repair.** "…by §3.5 when `k′ > 4g′ − 4 + n′` or `k′ ≤ (2g′ − 2)/3` and `g′ ≥ 2`, by §3.2 in genus one when `k′ > n′` (there `W_{k′}H^{k′}(M_{1,n′}) = 0`), and by §2.6 in genus zero". Tested: at `(1, 10, 11)`, §3.2 gives `W₁₁H¹¹(M_{1,10}) = 0` since `10 < 11`.

7. **F07** (P3) §11.9 route: the 55-dimensional constituent is not excluded

   - **Location.** `README.md:1697`: "it cannot be the whole `66`-dimensional module, or the multiplicity would exceed `836`, so it is the `11`-dimensional constituent".
   - **Claim.** A nonzero proper image is the 11-dimensional constituent.
   - **Witness.** A nonzero quotient of `T_{(2,1^{10})} ⊕ T_{(3,1^9)}` has dimension `11`, `55` or `66`; the sentence excludes `66` only. `825 + 55 = 880 > 836` excludes `55` by the same bound.
   - **Repair.** "…so the image of the module of §11.8 is nonzero, of dimension `11`, `55` or `66`; the rank of the `891` morphisms is `825` plus that dimension and is at most `836`, which excludes `55` (`880`) and `66` (`891`); so it is the `11`-dimensional constituent".

8. **F08** (P3) §6.7, second Check: the stack `B` is not defined

   - **Location.** `README.md:946`: "`A^*(B) → A^*(Σ_ℓ)` is surjective for both values of `ℓ`".
   - **Claim.** A Check about a carrier of the README.
   - **Witness.** `B` occurs nowhere else in Layer 6; §§6.3–6.8 call the object "the stack of pairs of bundles" (`README.md:939`, `950`, `961`) without a symbol.
   - **Repair.** In §6.3, after "with a canonical isomorphism `det E ≅ det F`", add: "Write `B` for the stack of such pairs `(E, F)` on `ℙ¹`-fibrations with their determinant isomorphism, `ℙ → B` for its universal `ℙ¹`-fibration, and `H_{4,g,n} → B` for the morphism recording the Casnati–Ekedahl pair." Then use `B` in §§6.7, 6.8 and the Layer 6 Example.

One P2 (R01) and seven P3 findings. No false statement was found: every identity, table and Check that could be recomputed was recomputed (table below), and every correction the README makes to a source was confirmed against the cached text.

## The adversarial pass: computed values

`Suggested.lean` has no declaration (module docstring and an empty namespace); the `and` entry of the worker's signature list is the word in the docstring, not a declaration. Rows are README targets.

| Statement | Instances | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| Conventions, complementary duality | `𝔸¹`, `d = 1` | `H_c² = ℚ(−1)`, `(W₀H⁰)^∨(−1) = ℚ(−1)`; weights of `(H^{2d−k})^∨(−d)` are `≤ k` | holds | — |
| §0.2 `κ₀` | `(0,3)`, `(1,1)`, `(7,0)` | `1`, `1`, `12` | holds | — |
| §0.3 order | `(0,4)` vs `(1,2)`; loop vertex `(g−1, n+2)` | `0 ≤ 1`, `4 ≤ 4`; `2(g−1) + n + 2 = 2g + n`, pairs differ | holds | — |
| §0.4 homology twist | `ℙ¹` | `H₂ = H⁰(1)`, weight `−2`; `W_{−k}` of `H^{2d−k}(d)` is weight `2d − k − 2d` | holds | — |
| §1.1 twisted counts on `ℙ¹` | types `(1,1)`, `(2)` | `(q+1)q`, `q² + 1 − (q + 1) = q² − q` | holds | — |
| §1.4 `Δ` | `p₁²`, `p₂` | `h`, `h`; `Δ` has degree zero for `deg h = 2`, `deg p_i = i`, nilpotent on monomials | holds | — |
| §1.5 Check 2 | `Spec 𝔽_{q³}`, `C₃` | class function `(0, 0, 3)`, unequal on `g`, `g²` | not a rational character | — |
| §1.6 / Examples | `M̄_{0,4}`, `M̄_{0,5}`, `M_{0,4}` | `q + 1`, `q² + 5q + 1`, `L − 2`; boundary `s_{(4)} + s_{(2,2)}` of dimension `3` | holds | — |
| §2.3 from §§2.1–2.2 | `n = 0`, `n = 1`, `n ≥ 2`; `(4,1)` | `k ≤ 2g − 1`, `k ≤ 2g − 1`, `k < 2g − 2 + n`; `20 − 13 = 7`, `H¹³ = H^{4g−3}` | holds | R04 |
| §2.5 base regions | `k = 7`, `k = 9` | `(1, ≤7), (2, ≤5), (3, ≤3)`; adds `(1,8),(1,9),(2,6),(2,7),(3,4),(3,5),(4, ≤3)`; genus five needs `2g = 10 > 9` | holds | — |
| §3.1 two actions | `g = 1`, `n = 2` | `Sym²V` rank `3`; traces `+3`, `−3` | holds | — |
| §3.2 hook | `(n, k) = (12, 11)`, `(11, 11)` | `binom(11, 10) = 11`, sign representation | holds | — |
| §3.3 Check | `M̄_{1,1}` | `deg ψ₁ = (1/12)(1/2) = 1/24` | holds | — |
| §3.4 range | `k = 2`, `k = 6` | `g ≥ 4`, `g ≥ 10`; Wahl's ranges `(2g−2)/3`, `2g/3`, `2g/3` (`wahl` lines 44–53) | holds | — |
| §3.6 multiplicities | `n = 11, …, 15`, `S₁₂`; `n = 15`, `S₁₆` | script on the stated formula: `1`; `11 + 11L`; `66 + 429L + 66L²`; `286 + 6006L + 6006L² + 286L³`; `1001 + 53053L + 186263L² + 53053L³ + 1001L⁴`; `1` | holds, symmetric | — |
| §3.6 genus two | `(a, b) = (0, 0)` | `(L² + L²)/2 = L²`, `L³ + L² − L² = L³` | holds | — |
| §4.2(b) | `n = k = 2`, `g ≥ 3` | `π₂^*`: `κ₁ − ψ₂, ψ₁`; `π₁^*`: `κ₁ − ψ₁, ψ₂`; span has rank `3 = dim H²(M_{g,2})` | holds | — |
| §4.5 corrected criterion | boundary factor; forgetful source | `Σ_v (2d_v − k_v) = 2d − k`, each term `≥ 0`; `2d_{g,n−1} − k = 2d − k − 2` | induction closes | — |
| §4.5 counterexample to the printed form | `S = RH^*`, `(1, 12, 11)` | quotient at `(1,12,11)` is `0`; all `k′ ≤ 9` quotients `0`; `RH¹¹ = 0`, `dim H¹¹ = 22` | printed lemma fails (`clp` lines 179–183) | — |
| §4.6 `T^k_n` | `k ≤ 23`; `n ≤ 19`; Check 2 graphs | `a, b ≥ 11 ⇒ k ≥ 24`; `n + 2 ≥ 22`; contractions `(1,15), (1,13), (2,12), (1,14)` | holds | — |
| §4.7 | `n = 12, 13`; `n = 11` | `2 · 11`, `2 · 66`; `M̄_{0,2}` unstable, no `D_B` | holds (`clp-h11` line 317 has no bound) | — |
| §4.9 region | `k′ = 4`; `k′ = 11`, `(1, 11)`; `(1, 10, 11)` | `g′ ≤ 6`; in region; outside region | holds | R06 |
| §4.10 region | `k = 13` | genus one `n ≤ 13`, genus two `n ≤ 11` | holds | — |
| §4.12 | `M̄_{0,4}` | `ℚ → ℚ` isomorphism | holds | — |
| §5.4 ranges | `c(g)` | `∞, 10, 10, 11, 11, 7, 5, 3` (`clp` line 534) | agrees | — |
| §6.1 | `ρ(7,1,5)`, `ρ(7,1,4)` | `1`, `−1` | holds | — |
| §§6.3–6.4 | `g = 7` | degrees `10`; `3+3+4`, `5+5`, `4+6`, `2+4+4`, `2+3+5` all `10` | holds | R08 |
| §§7.1, 7.5–7.6 | dimensions | `45 − 35 = 10`; `9 · 7 = 63`, `63 − 45 = 18 = 3 · 7 − 3`; `21 − 16 = 5 = rank U_i` | holds | — |
| §8.1 | general `g`; `g = 4`, `q = 5` | `(q−1)(q^{2g+2} − q^{2g})/((q²−1)(q²−q)) = q^{2g−1}`; `37500000 = 480 · 78125` | holds | — |
| §8.3 | `n = 2, 3` | `(q+2)q^{2g} − 1`; `(q³ − q)q^{2g−1} + 3q(q^{2g} − 1)` | holds | — |
| §8.8 | `Q_nsp`, `Q_spl` | `s₂ = 0`, `s₃ = q⁴ + q²`; `s₂ = 2(q³+q²+q)`, `s₃ = −q⁴ − 2q³ − q²` | holds | — |
| §8.9 table | `n = 0, 1, 2, 3` | sums of the source's sixteen terms divided by `q⁷ − q⁶ − q⁵ + q⁴`: `q⁸`; `q⁹ + q⁸ − q⁷`; row 2 by hand; row 3 by script, remainder `0` | all four rows agree | — |
| §8.10 table | `n = 0, 1, 2, 3` | `½(q⁹ − q⁶) + ½(q + 1) + …`; `½(q¹⁰ − q⁶)`; `½(q¹¹ − q⁹ + q⁸ − q⁷ − q⁶) + ½q⁵…`; `½(q¹² − 3q¹⁰ + 2q⁹ + 2q⁸ − 6q⁷) + (5/2)q⁶…` | agree at the stated precisions | — |
| §8.11 table | `n = 1` | `½(q¹⁰ + 2q⁹ − 2q⁷ − q⁶) + O(q³)` | agrees | — |
| §8.14 | `m^•_λ`; `λ = (2)` total | `q⁴ − q`, `q⁴ + q²`, `q⁴ + q² − 2q`; `q⁶ + q³ − q² − q`, `q⁶ − q²`, `q⁶ + 2q³ − q² − 2q`; total `q¹¹ + q¹⁰ + 2q⁹ − 2q⁸ + q⁵ − 1` | holds; agrees with §9.9 above `q⁶` | — |
| §9.1 | power sums | `2s_{(3)} − 6s_{(2,1)} = −(5/3)p₁³ + p₁p₂ + (8/3)p₃`; value `−10` | holds | — |
| §§9.4–9.6 | all four rows | closed minus boundary equals open in every coefficient; `q = 1`: `2`, `−10`; leading boundary coefficients `3, 4, 8, 17` = numbers of boundary divisors | holds | — |
| §9.9 | `n = 2, 3` | `s_{(3)} + 2s_{(2,1)} + s_{(1,1,1)}` reproduces §§9.5–9.6 coefficientwise; `q = 1`: `2, −6, 0` | holds | — |
| §9.10 | `(1)`, `(1,1)`, `(2)` | `(q+1)#M₄ − (q⁷ + q²)` = open `n = 1`; `(q²+q)#M₄ + e(V_{1,1}) − q(q²+q⁷)` = open `s_{(2)}`; `q#M₄ − (1+q)(q²+q⁷)` = open `s_{(1,1)}` | holds | — |
| Layer 9 Example | `q = 2` | `7965` | holds | — |
| §10.2 | seed region | `g′ ≤ 6`, `n′ ≤ 4 ≤ c(g′)` | holds | — |
| §10.4 | base pairs, `k ≤ 14` | `(3, ≤10), (4, ≤8), (5, ≤6), (6, ≤4), (7, ≤2)` within `c`; genus two `n = 11, 12` need `H¹⁴`, `H¹⁶`, within `r ≤ 10` of §4.3 | holds | — |
| §10.7 | `(0,3)`, `(0,4)` | `ker α = ℚ`; `ker α = 0`, `C¹/im α = ℚ²` | holds | — |
| §10.9 | base region | `(3, ≤7), (4, ≤5), (5, ≤3)`, all within `c`; `Γ′` contracts to `(g−1, n+2)` | holds | — |
| §§11.3–11.6 | counts | `11`; `286 + 11 + 132 = 429`; `1001 + 4004 + 11 + 132 + 858 = 6006`; `66 + 132 + 66 = 264` | holds | R03 |
| §§11.7–11.9 | counts | `891`; `495 + 330 = 825`; `66 = 11 + 55`; `825 + 11 = 836`, `825 + 55 = 880` | holds | R07 |
| §12.1 | base pairs | `(1, ≤13), (2, ≤11), (3, ≤9), (4, ≤7), (5, ≤5), (6, ≤3)`; exceptions `(2,11), (1,11), (1,12), (1,13)`; `(2,11)`: `H¹⁵ = a · H¹³` | holds | R02 |
| §12.2 | genus two | `n = 11`: `H¹³`; `n = 12`: `H¹⁵`; `n = 13`: `H¹⁷ = a · H¹⁵` | holds | R02 |
| §12.3 / §12.9 duality | twists | `(L^{d−12}S₁₂)^∨(−d) = L S₁₂`; `(L^{d−13}S₁₂)^∨(−d) = L² S₁₂`; `(L^{d−15}S₁₆)^∨(−d) = S₁₆` | holds | — |
| §12.7 | `g = 3, …, 8` | `2g − 2 + n ≤ 15`: `n ≤ 11, 9, 7, 5, 3` within `c`; `(8, ≤1)`: `16 > 15` | holds | — |
| §12.10 | boundary factors | `k′ ≤ 15`; genus-one factors have `≤ 12` flags, `S₁₆` needs `15` | holds | R05 |

## Dependency check

```text
depcheck: 239 roadmaps, 2260 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line.

## Verified sound

- **Read.** All 1918 lines of the README and all 46 lines of `Suggested.lean`: 111 targets, 111 *Needs* lines, 111 Checks blocks, 0 Lean declarations.
- **Lean file.** `import Mathlib` only, one module docstring of the required form, an empty namespace, no `set_option`, no `sorry`, no padding. None of the eight headlines is statable: neither pinned library has algebraic stacks, stable curves or their moduli, and no stand-in is used.
- **Recomputed.** The 50 rows above; among them all four tables of §§9.4–9.6 coefficient by coefficient, §9.9 against §§9.5–9.6, §9.10 against §9.9, the §8.9 table exactly and the §8.10–8.11 tables at their precisions from the source's individual sieve terms (`bfp` lines 794–806, 886–898, 947–962), and the §3.6 polynomials for `n = 11, …, 15` by an independent script.
- **Corrections to the sources confirmed (12).** CLP Lemma 2.1 (`clp` lines 179–183 and 199–200); CLP Lemma 3.1(b) and 3.2 (`clp` lines 379, 433–440); CLP §6.2 range (`clp` line 979); CLP unimodality (`clp` lines 106–107); CLP-H11 Corollary 2.5 (`clp-h11` line 317); BFP Corollary 3.2, the exponent in the proof of Proposition 3.1 and Remark 2.2 (`bfp` lines 232, 313, 318–321); Getzler's row `n = 14` (`getzler-semiclassical` line 640); Gorsky's genus and modulus (`gorsky` lines 323, 347, with equation (3) at line 217); Kannan's remark (`kannan` lines 572–577).
- **Locators verified (41).** CLP Theorems 1.3, 1.10, Corollary 1.4, Conjecture 1.8, Lemma 2.1, Lemmas 3.1–3.2, Remark 3.3, Lemma 4.3, Remark 4.4, Proposition 4.5, Table 1, Lemma 5.1, §5.2, Remark 6.1, Corollary 6.2, Lemma 7.1, Corollary 7.2, equation (7.1), Lemmas 7.5–7.7, the proofs of Theorems 1.5–1.7 and 1.9; BFP Proposition 2.1, Remarks 2.2–2.4, the two cited lemmas of Arbarello–Cornalba, Corollary 3.2, Notation 4.1, Proposition 4.2, Propositions 8.2, 8.5, 8.7; CLP-H11 Lemma 2.2, Proposition 2.3, Corollaries 2.4–2.5; Gorsky Remark 3.2, Definition 3.5, Theorem 3.8; Kannan Remark 3.8; Petersen (genus one) Theorems 1.1 and 1.3; CFP Theorem 1; Wahl Theorems 1.1–1.2; Getzler's final table; and the existence at the cited place of AC (2.1), (2.2), (2.6), (2.9), Kresch 2.1.12, 2.1.17, 4.5.7, Arsie–Vistoli 3.4, 4.2, 4.4, 4.7, Madsen–Weiss 1.1.1, Looijenga (2.1), Keel Theorem 1.
- **Supplier citations checked (19 roadmaps, every cited section heading found at the current head or on main).** StableReductionPartII §§0.4, 2.248, 3.1–3.3, 3.5, 3.7, 3.10–3.11, 4.1, 4.14, 5.1, 5.10–5.11, 5.15 (the Edidin–Graham comparison is in §5.15), 7.11 (assigns tautological rings and cohomological structures to the consumer); VirtualFundamentalClass §§2.1–2.4; WeilConjectures WC.1 (§§1.7–1.15), WC.5 (§§5.22–5.27), WC.6 (§6.8); DeligneWeightsAndPurity §§8.24, 9.6; MixedHodgeModulesAndIrregularHodgeTheory §§4.5, 5.1; MotivesAndAlgebraicCycles §§0.6, 2.4, 2.6, 2.7; AutomorphicGaloisRepresentations §1.2; AlgebraicModuliForArithmeticGeometry §§1.3, 5.1 (`coherentGrassmannian` is there); ArithmeticGaloisRepresentations §§5.1, 5.3; SchemeKTheoryOperations §§6.2.1–6.2.2; HabiroNahmSeries §5.1 (the multivariate logarithm and exponential are there); MappingClassGroupsAndCanonicalRepresentations §2.3; PELModuli §M5.2; CanonicalModelsAndGonality §§3.4, 3.9, 5.4, 9.1; AlgebraicCurves Layer 12; EquivariantIntersectionTheory §§2.1–2.3, 3.3; StableReduction Layer 1; SchemeAndStackFoundations §§1.18–1.23, 2.20, 3.2, 3.3, 4.15, 4.17, 5.1–5.8 (the blow-up decomposition is in §5.7).
- **Pinned declarations checked (11).** `CuspForm.rank_eq_one_of_weight_eq_twelve`, `CuspForm.rank_eq_zero_of_weight_lt_twelve`, `dimension_level_one` (all in `Mathlib/NumberTheory/ModularForms/LevelOne/DimensionFormula.lean`), `quadraticChar_sum_zero`, `TauCeti.spinPlus`, `spinPlusAction`, `spinPlusSubrep`, `finrank_spinPlus`, `repRing`, `repRingCharacter`, `finrank_periodPolynomials_eq_finrank_modularForm_add_finrank_cuspForm`, and the `TauCeti/Geometry/Hodge` directory with `Mixed` and `Tate`.
- **Gaps.** The eight slugs of `design/plan.json` and of the README's supplier contracts coincide, each with a named supplier and section. Only the Riemann–Roch clause of one of them is short (R01).
- **Ownership.** Searched the open roadmaps, main and the board's packages by object (Madsen–Weiss, stability and virtual cohomological dimension of mapping class groups, tautological rings, kappa and psi classes, Getzler–Kapranov, stable-graph transform, Chow–Künneth generation, Keel's theorem, quadric classification, hyperelliptic counts): no second owner. GromovWittenTheory builds cotangent lines on the analytic stable-curve groupoid, a different carrier.
- **Policy.** The pull request changes only the package folder; no pull-request number, process narrative, `lemma` or `set_option`; every target has a locator.
- **Arrangement.** About 216 locators; `clp` has about 84. Its sections against the layers: `Layer 4 ↔ §§2.1, 2.2, 3` (with CLP-H11 §2), `Layer 5 ↔ §4`, `Layers 6–7 ↔ §5`, `Layer 10 ↔ §6` (with CLP-H11 §§3–4), `Layer 11 ↔ §§2.2, 7`, `Layer 12 ↔ §§4, 7, 8`; Layers 0–3 and 8–9 come from other sources and stand between them. No layer has the scope of one section, and the order `5 → 6–7 → 10 → 11 → 12` is forced by the *Needs* lines of §7.7 (§§5.2, 6.2, 6.8), §10.4 (§§5.4, 7.7), §11.10 (§10.9) and §12.1 (§11.10).

## Not verifiable

- `harer-vcd` and `mukai` are recorded as uncertified: cited by locator, text not read.
- Bergström's two papers, Canning–Larson (genus seven), Petersen (genus two; abelian surfaces), Petersen–Tavakol–Yin and Getzler–Kapranov: the cited statements were not opened in this pass (GK Theorem 8.13 was checked only through the README's own two-value witness and the BFP misprint note).
- CLP Figure 2 and the graphs of Lemmas 7.4–7.7 are figures; the extraction has no text for them. The family sizes of §§11.3–11.7 were checked only for their sums and against the lemma statements.
- The multiplicities `264` and `836` of §3.6 come from an implementation of the Getzler–Kapranov formula in genus two (`clp` lines 1051, 1095); they were checked for consistency (`66 + 132 + 66`, `825 + 11`, symmetry about `d = 15`), not recomputed.
- The tables of §§8.11 (`n = 2, 3`), 8.14, 9.4 and 9.9 were checked for internal consistency (the identities in the table above), not recomputed from the sieve.
- Whether `T^k_n` lies in the extension generated by the three printed families for even `k ≥ 24` (§4.6): the README leaves it open, and nothing here settles it.
- No Lean was run: the file has no declaration to elaborate.

Source independence: 28 passages compared with 10 sources, none shared beyond formulas and standard names; largest share `clp`, about 84 of 216 locators; contents compared with `clp`: independent (order forced by the dependency lines named above).

## Source issues

- **Error** in clp at Lemma 2.1, hypothesis (2.2), pp. 4–5: the source says only smaller triples of degree at most `k − 2` are needed; it should be degree at most `k`, since the proof uses the same degree with one marking fewer; affects a stated result.
- **Gap** in clp at Lemma 3.2, proof, p. 10: the source says the generated extension contains every class pushed forward from the boundary; it should be argued, and for two odd genus-one factors (even `k ≥ 24`) no argument is known; affects the proof.
- **Misprint** in clp at §6.2, first sentence of the proof of Theorem 1.5(3), p. 23: the source says the range is even `k` at least fourteen; it should be at most fourteen; affects nothing.
- **Error** in clp-h11 at Corollary 2.5, p. 7 (arXiv version 2): the source says the pullback to the divisors with ten markings is injective for every `n`; it should be for `n ≥ 12`, no such divisor existing at `n = 11`; affects a stated result.
- **Misprint** in bfp at Corollary 3.2, p. 1330: the source says the conclusion holds for an arbitrary `M̄_{g,n}`; it should be for `M̄_{4,n}`; affects a stated result.
- **Misprint** in bfp at Proposition 3.1, proof, p. 1330: the source says the error term has exponent `md/2`; it should be `ms/2`, as in the hypothesis; affects nothing.
- **Misprint** in bfp at Remark 2.2, p. 1328: the source says Proposition 2; it should be Proposition 2.1; affects nothing.
- **Misprint** in getzler-semiclassical at the final table, row `n = 14`, arXiv p. 10: the source says the cusp coefficient has three terms `286, 6006, 286`; it should be `286, 6006, 6006, 286`; affects a stated result.
- **Misprint** in getzler-semiclassical at the final table, row `n = 7`, arXiv p. 10: the source says the coefficient of `L` is 12; it should be 121, by symmetry with the coefficient of `L⁶`; affects a stated result.
- **Misprint** in gorsky at Theorem 3.8, p. 6 (arXiv version 3): the source says the quotient genus is half of one minus the sum of the exponents; it should be one minus half that sum, as its equation (3) gives; affects a stated result.
- **Misprint** in gorsky at Definition 3.5, p. 5 (arXiv version 3): the source says the greatest common divisor is taken with `k`; it should be with the modulus `r`; affects a stated result.
- **Misprint** in kannan at Remark 3.8, pp. 11–12 (arXiv version 2): the source says the corrected genus uses the sum of exponents up to `r − 1`; it should be up to `r`, including the negative one; affects nothing.

## For the human reviewers

- **Licence.** The polynomial tables of `README.md` §§9.4–9.6, 9.9 and 9.10 are the numerical content of `bfp` Proposition 9.6 and Theorems 1.4, 1.5, 11.1 and 11.5, restated as targets with locators; the §§8.9–8.11 and 8.14 tables are derived, not copied.
- **Licence.** `kannan` (arXiv:2602.09117, version 2) is an unpublished 2026 preprint; it is cited only for a misprint in `gorsky`, at `README.md:1302`.
- **Scope.** Sections 8.1–8.13 of Layer 8 run in the order of `bfp` §§5–8 (hyperelliptic counts, quadrics, sieve, cone, non-split, split, tail); `bfp` has the second-largest share of locators (about 51 of 216).
- **Scope.** §4.6 states CLP Lemma 3.2 with an added generator `T^k_n` and leaves the printed form open for even `k ≥ 24` (`README.md:28`, `678`); no refereed source states the modified lemma.
- **Not tested.** `harer-vcd` and `mukai` are uncertified; §2.1 and §7.3 rest on their locators alone.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "64d2ae003ed97112f7932dcc8370a048d704df6c", "job": "RT-MotivicStructuresInModuliOfCurves~1a", "model": "fable", "worker": "chris-x26"} -->
