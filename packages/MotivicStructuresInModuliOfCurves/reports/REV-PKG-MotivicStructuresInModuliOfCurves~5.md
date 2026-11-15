<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13039#issuecomment-6899539209 -->
Review (claude) of bca5799

Verdict: needs_changes

**For the human reviewers:** this review raises 5 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) §8.1 restates the hyperelliptic quotient presentation that EquivariantIntersectionTheory §3.3 owns on main

   **Location.** `packages/MotivicStructuresInModuliOfCurves/README.md:1023`, §8.1: "prove that the stack `H_g` of hyperelliptic curves of genus `g` is the quotient of the open subscheme of binary forms of degree `2g + 2` with nonvanishing discriminant by a connected linear algebraic group `G`".

   **Claim.** The presentation is a target of this roadmap, with no other owner (the README never names EquivariantIntersectionTheory).

   **Witness.** `TauCetiRoadmap/EquivariantIntersectionTheory/README.md:532–536` on main, §3.3: the presentation `[A_sm(1, 2g + 2)/(GL₂/μ_{g+1})]` over a field of characteristic not dividing `4(g + 1)`, from the same Arsie–Vistoli Corollary 4.7.

   **Exact repair.** Cite the owner and keep only the variant, saying how it differs.

   1. §8.1, first sentence, becomes: "For `g ≥ 2` the presentation of the stack `H_g` of smooth hyperelliptic curves as the quotient of the binary forms of degree `2g + 2` with nonvanishing discriminant by `G = GL₂/μ_{g+1}` is EquivariantIntersectionTheory §3.3, over a field of characteristic not dividing `4(g + 1)`. Prove the same presentation over `ℤ[1/2]`, hence in every odd characteristic, including those dividing `g + 1` (Arsie–Vistoli, Proposition 3.4 and Corollary 4.7, whose stack is defined over `ℤ[1/2]`), agreeing with the supplier's where both apply; prove that `G` is smooth and connected with `#G(𝔽_q) = (q² − 1)(q² − q)`, and that `#H_g(𝔽_q) = q^{2g−1}` for odd `q` (BFP, §5, pp. 1332–1333)." The route is unchanged.
   2. `*Needs:*` of §8.1 and the Dependencies of Layer 8 gain "EquivariantIntersectionTheory §3.3".
   3. Scope and ownership gains a bullet: "The quotient presentation of the hyperelliptic stack over a field of characteristic not dividing `4(g + 1)` is EquivariantIntersectionTheory §3.3; §8.1 owns only its extension over `ℤ[1/2]` and the point count."
   4. Exact supplier contracts gains `### From TauCetiRoadmap.EquivariantIntersectionTheory` (see R02 for its full text).
   5. New Check in §8.1: "At `g = 4`, `q = 5` the supplier's hypothesis fails (`5` divides `4(g + 1) = 20`, and `μ₅` is not reduced), while §8.3 needs `#H₄(𝔽₅) = 5⁷`; `G = GL₂/μ₅` is still smooth and connected and `#G(𝔽₅) = 24·20 = 480 = #GL₂(𝔽₅)`."

   Tested on the refuting instance: at `(g, q) = (4, 5)` the citation alone does not cover the count and the kept variant does; at `(g, q) = (4, 3)` (`3 ∤ 20`) the two statements coincide. arsie-vistoli lines 250–262 give the base `ℤ[1/2]`.

2. **F02** (P2) gap:stack-rational-chow asks for what EquivariantIntersectionTheory (main) and VirtualFundamentalClass (open) already state

   **Location.** `packages/MotivicStructuresInModuliOfCurves/README.md:61`: "rational Chow groups of finite-type algebraic stacks stratified by quotient stacks over a field, with proper (not necessarily representable) pushforward, flat and lci pullback, … Chern classes of vector bundles"; the same sentence in `design/plan.json` (`gaps`, slug `stack-rational-chow`).

   **Claim.** Nothing the gap asks for is provided elsewhere, and SchemeAndStackFoundations is to build all of it.

   **Witness.** Main, `TauCetiRoadmap/EquivariantIntersectionTheory/README.md:402–412` (§2.2: pushforward, flat and lci pullback, localisation, Chern classes, products, affine-bundle invariance on `[X/G]`) and `:437–440` (`A^*_{GL_n} = ℤ[c₁, …, c_n]`). Open: VirtualFundamentalClass §§2.1–2.4, which StableReductionPartII `README.md:17, :176` consumes for `ψᵢ`.

   The gap is therefore not minimal, and it would give `A^*(M̄_{g,n})_ℚ` two carriers: `ψᵢ = c₁(Lᵢ)` of StableReductionPartII §3.3 lives in the Vistoli groups of VirtualFundamentalClass §2.1, while `κ_a = π_*(ψ_{n+1}^{a+1})` of §0.2 would be formed in the groups asked of SchemeAndStackFoundations. VirtualFundamentalClass is another author's open pull request that adds a new roadmap folder, so it may be consumed; EquivariantIntersectionTheory is on main (merged before this round; no earlier round read it).

   **Exact repair.**

   1. Add to Exact supplier contracts:
      - `### From TauCetiRoadmap.EquivariantIntersectionTheory` — "Consumed: §§2.1–2.3 (the equivariant Chow groups `A^G_*(X)` of a quotient stack `[X/G]`, for `G` smooth affine over a field and `X` quasi-projective with a `G`-linearised ample sheaf; proper pushforward, flat and lci pullback, the localisation sequence, Chern classes, the product for smooth `X`, homotopy invariance for vector and affine bundles, independence of the presentation; `A^*_{GL_n} = ℤ[c₁, …, c_n]`); §3.3 (the hyperelliptic presentation, R01). Assumed: these groups are integral; this roadmap uses them after tensoring with `ℚ`."
      - `### From VirtualFundamentalClass` — "Consumed: §§2.1–2.4 (Vistoli's rational Chow groups of separated Deligne–Mumford stacks, with proper pushforward, flat pullback, localization, exterior products, homotopy invariance, Chern classes, the projective-bundle formula and refined Gysin maps with the excess formula). Assumed: this is the carrier in which StableReductionPartII §3.3 forms `ψᵢ`."
   2. Replace the gap sentence at README:61 by: "What SchemeAndStackFoundations must provide (gap:stack-rational-chow): for finite-type algebraic stacks stratified by quotient stacks over a field, rational Chow groups that agree, compatibly with all operations, with `A^G_*(X) ⊗ ℚ` of EquivariantIntersectionTheory Layer 2 on the quotient stacks in its range and with the groups of VirtualFundamentalClass §2.1 on separated Deligne–Mumford stacks; and, beyond those two theories, pushforward along proper morphisms that are not representable, exterior products natural under product with every such stack, the localization sequence of a stratification by quotient stacks, the Grassmann-bundle formula, the projection formula for the intersection product on smooth DM stacks, and Grothendieck–Riemann–Roch for the universal curve over `M̄_{g,n}`." Slug and supplier are unchanged; the `needs` of the same slug in the `gaps` list of `design/plan.json` carries the same sentence.
   3. `*Needs:*` lines: §§0.1, 0.2 add "VirtualFundamentalClass §§2.1–2.3"; §5.2 and §7.1 add "EquivariantIntersectionTheory §§2.2–2.3" (the Chow rings of `BGL_r` and the affine bundle `BGL₅ → BP`). Scope and ownership gains one bullet naming the two owners; the Dependencies of Layers 0, 5 and 7 follow.

   Tested: with both subsections and the `*Needs:*` items added to a scratch copy of the README, the dependency check reports `0 problem(s)` and no UPWARD, CYCLE or `moved:` line. On the instances: `κ₀ = π_*ψ₂ = 1` on `M̄_{1,1}` is then computed in one carrier (π is representable and proper, VirtualFundamentalClass §2.2), and `A^*(BP) = A^*_{GL₅} ⊗ ℚ = ℚ[c₁, …, c₅]` of §7.1 follows from the supplier with no new target; what remains in the gap (non-representable pushforward for the `μ₄`-gerbe of §7.4, exterior products with every test stack for §5.1) is in neither supplier.

3. **F03** (P3) §11.7: the route makes all five remaining blocks triangular, which contradicts the rank 825

   **Location.** `packages/MotivicStructuresInModuliOfCurves/README.md:1617`, §11.7, Route: "families `A₂`–`A₄` have independent entries in the second column by §11.4; the remaining blocks are upper triangular".

   **Claim.** The route yields rank `825` for the family sizes `132, 11, 132, 220, 66, 66, 132, 66, 66`.

   **Witness.** `A₁`–`A₄` have `132 + 11 + 132 + 220 = 495` rows and the remaining five `396`: if all were triangular the rank would be `891`. clp lines 1111–1113: only the bottom four rows, `66 + 132 + 66 + 66 = 330`, and `495 + 330 = 825`.

   **Exact repair.** Replace "the remaining blocks are upper triangular; the relations follow from…" by "the last four families (`66, 132, 66, 66` rows) are block upper triangular, so the rank is at least `495 + 330 = 825`; the `66` relations, which follow from the tautological relations in `H⁴(M̄_{1,3})`, `H²(M̄_{1,2})` and `H²(M̄_{1,1})` with the excess-intersection signs, bound it above by `891 − 66 = 825`". Recomputed on the instance: `495 + 330 = 825 = 891 − 66`.

4. **F04** (P3) §2.3, first Check asserts a non-vanishing that nothing supports

   **Location.** `packages/MotivicStructuresInModuliOfCurves/README.md:381`, §2.3: "At `(g, n) = (4, 1)`, `H_c^k = 0` for `k < 8`; the vanishing does not extend to `k = 8`."

   **Claim.** `H_c⁸(M_{4,1}) ≠ 0`.

   **Witness.** No source is given, and BFP Proposition 2.1 (bfp lines 221–225) states a range only. `H_c⁸(M_{4,1})` is dual to `H¹²(M_{4,1})`, which by Leray is `H¹¹(M₄, V_{(1)})` since `H¹⁰(M₄) = H¹²(M₄) = 0`; the trace `q² + q⁷` of §9.10 has no negative term of weight at most eight.

   **Exact repair.** Replace the Check by one that computes: "At `(g, n) = (4, 1)`, `d = 10` and the threshold is `2g = 8`: the virtual cohomological dimension `4g − 3 = 13` alone gives `H_c^k = 0` only for `k < 20 − 13 = 7`, and the case `k = 7` is `H¹³(M_{4,1}) = 0` of §2.2. No statement is made at `k = 8`." Recomputed: `2d − (4g − 3) = 7`, `2d − (4g − 4) = 8`.

5. **F05** (P3) four page locators

   **Location and witness** (each read in the cached text):

   - README:305, §1.4: "BFP, §9, p. 1354, where the theorem is cited as GK Theorem 8.3". On p. 1354 (bfp line 1308) BFP cites Theorem 8.13 correctly; the misprint is at bfp line 1199, p. 1351, as the README's own "Corrections to the sources" says.
   - README:1035, §8.2: "BFP, Lemma 5.2, pp. 1332–1334". The lemma is stated at bfp line 426, p. 1333, and its proof ends before bfp line 474, p. 1334; p. 1332 holds §5's opening only.
   - README:1617, §11.7: "proof of Lemma 7.3, p. 27". The proof, with the rank `825` and the `66` relations, begins at clp line 1104, p. 26, and continues on p. 27.
   - README:1731, §12.6: "equations (8.1)–(8.2), pp. 28–29". Both displays are on p. 28 (clp lines 1174–1192).

   **Exact repair.** §1.4: "(GK, Theorem 8.13; BFP, proof of Proposition 9.6, p. 1354, which applies it; the opening of BFP §9, p. 1351, cites it as Theorem 8.3)". §8.2: "pp. 1333–1334". §11.7: "pp. 26–27". §12.6: "p. 28". `sources.toml` repeats none of these pages and needs no change.

Five findings: two P2 (a target and a supplier gap that ignore a roadmap on main, EquivariantIntersectionTheory, and an open roadmap, VirtualFundamentalClass, that already state the objects) and three P3 (a route that contradicts its own rank, an unsupported Check, four page locators). Both round-4 findings are repaired and the repaired mathematics is sound: all 21 new sieve quotients were recomputed. `Suggested.lean` elaborates with no output and the dependency check reports no problem. No author file was changed by this review.

## Previous findings (round 4), checked first

| Finding | Passage now | Disposition |
| --- | --- | --- |
| F01 (P2) six sieve tables taken over from BFP | README:1125–1143, :1147–1164, :1168–1187, :1213–1230: "Prove that the truncated sum `N^con_{n,≤3}` is divisible in `ℤ[q]` by `#Aut(Q_con)`…, with quotient:" and one table of quotients per section | Repaired. The 84 term-by-term entries are gone; rules, BFP locators and 21 quotients in the roadmap's own form remain. All 21 recomputed below. BFP prints per-quadric sums only in the Schur basis (bfp lines 1576–1597), not by cycle type. |
| F02 (P3) §12.1 lists §7.7 | README:1675: "have the CKgP (§5.4)"; `*Needs:*` at :1677 has no `7.7`; third Check added | Repaired. Recomputed: `2g ≤ 13` or `2g − 2 + n ≤ 13` gives `g ≤ 6`. |

The repaired patterns elsewhere: the remaining tables (§§9.4–9.6, 9.9, 9.10) are in ascending expanded form; §9.10 was reordered and its six polynomials are unchanged (parsed and compared). The other citations of §7.7 (§§10.4, 12.2, 12.7) are needed (`2g = 14 ≤ 14, 15`).

## Maintainer notes

1. Tables taken over: no longer holds at this head; the six tables were removed by the round-5 repair (README:1125–1230 read against bfp lines 774, 875–877, 1503–1514).
2. No finding elsewhere in the end theorems and arrangement: confirmed for the passages it names; see "Copyright and arrangement".
3. Licence notes: carried to the human reviewers' section.

## Verified sound

### Seeded source sample (15 targets, all read in the cached texts)

| Target | Locator read | Outcome |
| --- | --- | --- |
| 0.3 | clp line 175 (§2.1, p. 4); bfp lines 335–338 (Notation 4.1, p. 1331) | Same relation: `<lex` with `2g′ + n′ ≤ 2g + n` is `g′ ≤ g`, the inequality, and distinct pairs. |
| 1.4 | gk lines 2113–2145 (Theorem 8.13); bfp lines 1199, 1297, 1308 | Formula and `Δ` as stated; page of the misprint is R05. |
| 2.3 | bfp lines 221–231 (Proposition 2.1, p. 1328); clp lines 980–985 (p. 23) | Ranges as stated; first Check is R04. |
| 4.12 | clp lines 106–109 (p. 3) | Top-heaviness from an ample tautological class; unimodality is not claimed here. |
| 6.6 | clp line 607 (Lemma 5.2, p. 14), 611–612; canning-larson lines 2031, 2041 | `n ≤ 4f − 2g + 1 = 16 − 14 + 1 = 3` at `g = 7`, `f = 4`. |
| 7.2 | clp lines 801–827 (Lemma 5.10, Corollary 5.11, p. 19) | `n ≥ 1`; the printed proof trivializes `V` only, as the README says. |
| 7.4 | clp lines 883–952 (Lemmas 5.13–5.17, pp. 20–22) | `E_n` of rank `7 − n`, `c₁(α^*L_i) = −ψ_i`, sequences (5.14), (5.15). |
| 8.3 | bfp lines 418–425 (Proposition 5.1, p. 1333); bergstrom-hyperelliptic line 1631 | Three counts as stated; all characteristics through Bergström. |
| 9.2 | bfp lines 1429–1434 (§11.1, p. 1357) | Both Schur expansions agree. |
| 10.3 | clp line 87 (Theorem 1.5(2), p. 2); lines 960–962 (p. 22) | `g ≥ 10`, boundary by 1.5(1), stable range. |
| 10.5 | clp lines 992–995 (Corollary 6.2, p. 23) | Exponent `d − 7`. |
| 11.2 | clp lines 1040–1048 (§7.2, conventions 3–5, pp. 24–25) | Unit decorations, exponent the number of edges, as the README records. |
| 11.5 | clp lines 1084–1091 (Lemma 7.6, p. 26) | `6006`; "i, j or k can equal y" matches family (e). |
| 11.7 | clp lines 1058–1066, 1104–1117 | Rank `825`, `66` relations, coefficients `1/24`, `1/12`; route and page are R03, R05. |
| 12.6 | clp lines 1173–1193 (p. 28) | `α`, `β`, the determinant twist on two-edge graphs; page is R05. |

No locator was flagged by the author as unverified. Nothing was fetched; the manifest has 25 works (23 with text, 2 settled uncertified) and every work the References list names has an entry.

### Adversarial table (values computed in this review)

| Statement | Instances | Values computed | Result |
| --- | --- | --- | --- |
| §8.9 quotients (repair) | `n = 0…3`; `q = 2` | `(S₀,…,S₃)(2)`: `(32768, −24576, 4096, 0)`, `(98304, −86016, 18432, 0)`, `(245760, −245760, 64512, −1536)`, `(491520, −552960, 172032, −8448)`; exact division by `q⁴(q−1)²(q+1)`: `q⁸`; `q⁹+q⁸−q⁷`; `q¹⁰+2q⁹−2q⁸−2q⁷+q⁶−q⁵`; `q¹¹+3q¹⁰−3q⁹−8q⁸+6q⁷−3q⁶+2q⁵−6q⁴+6q³`, remainder `0` each | Equal to the table. |
| §8.9 rules and Checks | `n = 1, 3` | `(q²+q)_3 q¹² = q¹⁸+3q¹⁷−5q¹⁵−q¹⁴+2q¹³`; `n = 1` sum `q¹⁶−3q¹⁴+q¹³+2q¹²−q¹¹`, and `(q−1)²(q+1)(q²+q−1) = q⁵−3q³+q²+2q−1` | Hold. |
| §8.10 quotients | `n = 0…3`, Laurent expansion at `∞` | `½q⁹−½q⁶+½q+½`; `½q¹⁰−½q⁶+½q³+…`; `½q¹¹−½q⁹+½q⁸−½q⁷−½q⁶+½q⁵+…`; `½q¹²−(3/2)q¹⁰+q⁹+q⁸−3q⁷+(5/2)q⁶+…` | Table correct to `o(q^{(9+n)/2})`; `c = 5/2` at `n = 3`. |
| §8.10 `s_d(Q_nsp)` | `(1−t)(1−qt)(1+qt)(1−q²t)` | `s₁ = −q²−1`, `s₂ = q−q+q²−q²+q³−q³ = 0`, `s₃ = q⁴+q²`; unmarked sum `q¹⁵−q¹²−q¹¹+q⁸+q⁷+q⁶+q⁵+q⁴`; `2q·p₁₄/(2(q⁶−q²)) = q⁹+q⁸+…` | Statement and three Checks hold. |
| §8.11 quotients | `n = 0…3` | `½q⁹−½q⁶−½q−½`; `½q¹⁰+q⁹−q⁷−½q⁶−½q³…`; `½q¹¹+2q¹⁰+(3/2)q⁹−(5/2)q⁸−(3/2)q⁷−½q⁶−½q⁵…`; `½q¹²+3q¹¹+(9/2)q¹⁰−5q⁹−5q⁸+q⁷−(13/2)q⁶…` | Table correct; `c = −13/2`. |
| §8.11 `s_d(Q_spl)`, `S₀` | `(1−t)(1−qt)²(1−q²t)` | `−(q+1)²`, `2(q³+q²+q)`, `−(q⁴+2q³+q²)`; `((q+1)²)_3 = (q+1)²(q²+2q)(q²+2q−1)` | Hold. |
| §8.14 `m^•_λ` | points over `𝔽_{q²}`, `𝔽_{q³}` | cone `q⁴−q`, `q⁶+q³−q²−q`; non-split `(q²+1)²−(q²+1) = q⁴+q²`, `q⁶−q²`; split `q⁴+q²−2q`, `q⁶+2q³−q²−2q`; `(q⁶−q²)p₁₂ = q¹⁸+q¹⁷+q¹⁶+q¹⁵−q⁵−…−q²` | Nine `S₀` reproduce the earlier entries in degrees `≥ 6`. |
| §8.14 quotients | 9 entries | cone exact: `q¹⁰−q⁶+q⁵`; `q¹¹+q¹⁰−q⁹−q⁶+2q⁵−2q⁴`; `q¹¹+q⁸−q⁵`; non-split `½q¹¹+½q⁹−½q⁸−½q⁷+½q⁶+…`, `½q¹²+½q¹⁰−q⁸+q⁷+½q⁶…`, `½q¹²−½q⁹−½q⁸−½q⁶…`; split `½q¹¹+½q⁹−(3/2)q⁸+½q⁷+½q⁶…`, `½q¹²+q¹¹+½q¹⁰−2q⁹−q⁸+q⁷−½q⁶…`, `½q¹²−½q⁹−½q⁸+q⁷−½q⁶…` | Table correct at its precisions. |
| §8.14 against BFP's Schur form | cone, `n = 3`, `s_{(3)}` | `(f_{111} + 3f_{21} + 2f_3)/6 = q¹¹+q¹⁰−q⁹−q⁸+q⁷+…` | bfp line 1589. |
| Layer 8 against §9.6 | totals with `#H_{4,n}` | `n = 0`: difference `0`; `n = 1`: `q¹⁰+2q⁹+2q⁸−q⁷−q⁶`; `n = 2`: difference `−q⁵+…`; `n = 3`: stated quotients differ by `−2q⁶+…`, full `q⁶` coefficients `−3+5/2−13/2 = −7`, so `ΣB_• = 6` | Inside the precisions; `B` absorbs `q⁶`. |
| Layer 8 against §9.9 | `λ = (2), (2,1), (3)` | open counts at the cycle types: `q¹¹+q¹⁰+2q⁹−2q⁸`; `q¹²+2q¹¹+3q¹⁰−2q⁹−3q⁸+2q⁷−q⁶+…`; `q¹²+q¹¹+q¹⁰−q⁹−q⁸+q⁷−q⁶+…`; differences of degree `5`, `5`, `6` (`c q⁶` allowed) | Consistent. |
| §§9.4–9.6, 9.9 | every row | closed − boundary = open in all four rows; open at `q = 1`: `2, 2, −2, −10`; four palindromes; `s_{(2)}+s_{(1,1)}` and `s_{(3)}+2s_{(2,1)}+s_{(1,1,1)}` recover §§9.5–9.6, compact and open | Hold. |
| §9.10 against §9.9 | `λ = (1), (1,1), (2)` | `q²N + T_{(1,1)} + T_{(1)}`, `N = q⁹+q⁸+q⁷−q⁶`: `q¹¹+q¹⁰+2q⁹−2q⁸`, the transposition count | Holds; reordered table equals the old one. |
| §8.3, §9.2 | general `g`; `g = 4` | `(q+1)q·q^{2g−1} + q^{2g}−1 = (q+2)q^{2g}−1`; `a²`-coefficient of `N(N−1)(N−2)` is `3q`; `q⁹+q⁸−1+q⁸`; `(q¹⁰+q⁹−q⁸−q)+2(q⁹−q) = q¹⁰+3q⁹−q⁸−3q`; transposition `q⁹−1` | Hold. |
| §0.3 | loop; separating edge; `(0,4)`, `(1,2)` | loop: `(g−1, n+2)`, `2(g−1)+n+2 = 2g+n`; separating: `2g₁+n₁ ≤ 2g+n` iff `2g₂+n₂ ≥ 2`, true by stability; `(0,4) ≺ (1,2)`, not conversely | Holds. |
| §1.4 | `p₁²`, `p₂`; `V(0,3) = ℚ` | `Δ(p₁²) = h`, `Δ(p₂) = h`; `MV(0,4)` of rank `3 = s_{(4)} + s_{(2,2)}` | Holds. |
| §2.3 | `n = 0, 1, ≥ 2` | `2d − (4g−6) = 2g`; `(6g−4) − (4g−4) = 2g`; `(6g−6+2n) − (4g−4+n) = 2g−2+n`; `(2,12)`: `14` | Statement holds; Check 1 is R04. |
| §4.12, §10.3, §10.5 | `M̄_{0,4}`; `g = 9, 10`; `M̄_{0,10}` | `d = 1`, `S⁰ → S²` iso; `(2g−2)/3 = 16/3 < 6 ≤ 6`; `d = 7`, `2d − 14 = 0` | Hold. |
| §6.6, §7.1–7.4 | `g = 7` | `4f−2g+1 = 3`; `45 − (25+10) = 10`; ranks `16 − n` and `7 − n` | Hold. |
| §11.5, §11.7 | sizes | `1001+4004+11+132+858 = 6006`; `891`, `495+330 = 825` | §11.5 holds; §11.7 route is R03. |
| §12.1 (repair) | `g = 6, 7` | `2·7 = 14 > 13`, `12 + n ≥ 14`; ranges against `c = 10, 10, 11, 11, 7, 5` leave `(1,11), (1,12), (1,13), (2,11)` | Holds. |
| §8.1 (R01) | `(g, q) = (4, 5), (4, 3)` | `4(g+1) = 20`; `5 ∣ 20`, `3 ∤ 20`; `#GL₂(𝔽₅) = 480` | Variant needed at `q = 5`. |
| Headlines §§9.8, 9.5, 4.9–4.11, 10.2–10.4, 12.1–12.2, 7.7, 12.9, 12.10 | as in round 4 | unchanged text; the round-4 rows carry computed values (`2d − s = 9`; base regions against `c(g)`; weights `13, 14, 15`), compared with the present text | Sound. |

### Lean form and headline theorems

`lake env lean` on `packages/MotivicStructuresInModuliOfCurves/Suggested.lean`, run from the content checkout: exit 0, no output. The file is `import Mathlib`, one module docstring and an empty namespace: no declaration, no `sorry`, no `set_option`. The one-tactic probe and the `#check @name` comparison have no subject (the lead `and` of the signature tool is a word of the docstring). The eight headline theorems of the Summary are each named in the docstring as not statable; a search of both pinned trees finds no algebraic or Deligne–Mumford stack and no stable-curve moduli (Tau Ceti has `Chow.ChowGroup` for schemes only, `TauCeti/AlgebraicGeometry/Chow/Basic.lean:295`). Nothing statable is absent and nothing is padding.

Pinned declarations opened: `Mathlib/NumberTheory/ModularForms/LevelOne/DimensionFormula.lean:167`, `:172`, `:262`; `Mathlib/NumberTheory/LegendreSymbol/QuadraticChar/Basic.lean:120`, `:239` (needs `ringChar F ≠ 2`; §8.2 is for odd `q`); `Mathlib/Algebra/IsPrimePow.lean:28`; `TauCeti/RepresentationTheory/Spin/HalfSpin/Basic.lean:119`, `:260`, `:324`; `TauCeti/RepresentationTheory/Spin/Dimension.lean:73`; `TauCeti/RepresentationTheory/RepresentationRing/Basic.lean:106`, `:127`; `TauCeti/NumberTheory/ModularForms/LevelOne/PeriodPolynomial/Finrank.lean:213`. No backticked name is presented as this roadmap's own.

### Suppliers, gaps, duplication

Every cited heading was found again at the current heads (48 headings): StableReductionPartII §§0.4, 2.248, 3.1, 3.3, 3.5, 3.7, 3.10, 3.11, 4.1, 4.14, 5.1, 5.10, 5.11, 7.11; DeligneWeightsAndPurity §§8.24, 9.6; MixedHodgeModulesAndIrregularHodgeTheory §§4.5, 5.1; MotivesAndAlgebraicCycles §§0.6, 2.4, 2.6, 2.7; AutomorphicGaloisRepresentations §1.2; MappingClassGroupsAndCanonicalRepresentations §2.3; AlgebraicModuliForArithmeticGeometry §§1.3, 5.1; ArithmeticGaloisRepresentations §§5.1, 5.3; SchemeKTheoryOperations §§6.2.1, 6.2.2; WeilConjectures §§1.7, 1.15, 5.22, 5.27, 6.8; CanonicalModelsAndGonality §5.4; on main SchemeAndStackFoundations §§1.18, 1.23, 4.15, 4.17, 5.1, 5.8, StableReduction Layer 1, SchurWeyl Layers 7 and 9, AlgebraicCurves 12B. `roadmaps resolve` lists nothing found nowhere.

Gaps: the eight slugs are in `design/plan.json` and in the README with named suppliers. Seven are precise and minimal; `stack-rational-chow` is R02. `complete-adams-series` is also declared, on the same supplier and section, by CountingBundlesAndHallAlgebrasOfCurves: one owner.

Duplication by object across main and the open heads: "tautological ring", "kappa class", "Getzler–Kapranov", "modular operad", "Chow–Künneth", "semi-tautological", "Harer", "Madsen–Weiss", "Casnati" occur in no other roadmap (StableReductionPartII §7.11 hands tautological rings here). FinitenessAndDualityOfGroups (open) owns the abstract virtual cohomological dimension; §2.1 states only the vanishing for `M_{g,n}` and defines no group-theoretic notion. AlgebraicGromovWittenTheory and GromovWittenTheory form `ψᵢ` on stable-map moduli, a different object. The two shared objects found are R01 and R02. `scratch/overlaps.md`: no other pull request changes this roadmap, no dropped id, no revision-only id. This package declares no Lean name.

Overlap check: read WeilConjectures, StableReductionPartII, AlgebraicGromovWittenTheory, CountingBundlesAndHallAlgebrasOfCurves, CanonicalModelsAndGonality and, on main, StableReduction (the third list is empty); the pointed stacks, clutching and `ψᵢ` are StableReductionPartII's, sieve and counts WeilConjectures', the gonality bound CanonicalModelsAndGonality's, dual graphs StableReduction's, complete Adams series HabiroNahmSeries' for both consumers; outside the lists, the hyperelliptic presentation and quotient-stack Chow groups are EquivariantIntersectionTheory's and DM-stack Chow groups VirtualFundamentalClass's (R01, R02).

Dependency check, with `--movable`:

```text
depcheck: 246 roadmaps, 2254 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line.

### Shape

109 numbered targets, each with a `*Needs:*` line, a locator and at least two Checks; every definition with an API list has at least three; 13 layers, each ending with Examples and Dependencies. A scan finds no LaTeX delimiters, pull-request numbers, dates, machine paths, HTML or process words in the README, the Lean file or the manifest.

### Copyright and arrangement

Sixteen passages were put beside their sources: the fifteen sampled targets at the locators above and the new text of §8.9 against bfp lines 779–790. The longest shared run is four words ("and hence the vertex", §8.9); the definition of `≺` and the Getzler–Kapranov formula coincide with their sources as formulas must. The quotient tables are the roadmap's own form (by cycle type and truncated at its own precisions; BFP prints Schur-basis sums).

Arrangement against clp (sections 2 Preliminaries, 3 Finite generation, 4 CKgP, 5 Genus 7, 6 Even cohomology, 7 Thirteenth and fifteenth homology, 8 Proof of Theorem 1.1): Layer 4 draws on clp §§2–3 with clp-h11; Layers 6 and 7 split clp §5; Layer 10 joins clp §6 with clp-h11; Layers 11 and 12 regroup clp §§7–8 and part of §4; Layers 1, 2, 8, 9 come from bfp. No one-to-one run; the order is forced by §§6.2–7.7 needing §5.2, §10.4 needing §§7.7 and 9.8, §11.10 needing §10.9 and Layer 12 needing §§11.9–11.10. No sentence says the roadmap follows a source.

Source independence: 16 passages compared with 4 sources (clp, bfp, gk, canning-larson), none shared beyond a run of four words; largest share clp, 78 of 164 locators; contents compared with clp: independent.

## Not verifiable

- `harer-vcd` and `mukai`: settled as uncertified; cited by locator, no text read.
- The graph families of §§11.4–11.7 are drawn in figures of clp that the extraction does not carry; family sizes were checked through their sums and the surrounding proofs only, and the rank `825` through the block count, not by recomputing the matrix.
- Whether `H_c⁸(M_{4,1})` vanishes (R04): no source read here decides it.
- VirtualFundamentalClass is read at the head of its open pull request; its section numbers may move before it merges.

## Source issues

Confirmed against the texts in this round:

- **Misprint** in bfp at opening of §9, p. 1351: the source says the Getzler–Kapranov character formula is Theorem 8.3; it should be Theorem 8.13, as its own pp. 1353–1354 cite; affects nothing.
- **Misprint** in bfp at Remark 2.2, p. 1328: the source says a later result improves "Proposition 2"; it should be Proposition 2.1; affects nothing.
- **Misprint** in clp at §6.2, first sentence of the proof of Theorem 1.5(3), p. 23: the source says the range is even degrees at least fourteen; it should be at most fourteen; affects nothing.
- **Error** in clp at proof of Lemma 7.3, p. 27: the source says the relation symbols span the sign representation induced from the symmetric group on ten letters, of dimension 132; it should be induced from the product with the group on two letters, dimension 66; affects the proof.
- **Gap** in clp at proof of Lemma 8.2, p. 28: the source says vanishing holds once 2g − 2 + n exceeds fifteen and otherwise the CKgP applies; it should also use 2g > 15 for n ≤ 1, covering (8,0) and (8,1); affects the proof.

## For the human reviewers

- **Licence.** `clp` and `bfp` are recorded in `sources.toml` with `licence_class = "author-page"` (journal articles read from author copies); no reuse licence is recorded for `bfp`. The term-by-term tables from it are no longer in the README.
- **Licence.** `kannan` is a 2026 arXiv preprint (`sources.toml`, arXiv 2602.09117v2), used in README §9.1 for a misprint note only.
- **Licence.** `harer-vcd` and `mukai` have status `uncertified` and no cached text.
- **Scope.** README line 25: CLP Lemma 3.2 is printed for all degrees; §4.6 proves it for odd `k` and `k ≤ 23` and does not take the even `k ≥ 24` case as a target.
- **Scope.** The package consumes CanonicalModelsAndGonality §5.4, and after R02 VirtualFundamentalClass §§2.1–2.4: open pull requests by other authors, neither in the merge order under that name.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "bca57990098181585401eeeec7121424c97bb2f6", "job": "REV-PKG-MotivicStructuresInModuliOfCurves~5", "model": "fable", "worker": "chris-x90"} -->
