<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13150#issuecomment-6857011853 -->
Review (claude) of 2531294

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) §1.8 attributes the `ℓ`-adic trace formula to a supplier that does not state it

   **Location:** `packages/KloostermanSheavesAndBesselIsocrystals/README.md`:790–792, "the trace formulas of
   gap:arithmetic-d-module-operations and EtaleCohomologyFoundations, which apply to the same correspondence
   and coefficients"; also :99, :394 and :813, where EtaleCohomologyFoundations is cited with no section.

   **Claim:** EtaleCohomologyFoundations supplies the Grothendieck–Lefschetz trace formula used on the `ℓ`-adic
   side of the closed-point comparison.

   **Witness:** `TauCetiRoadmap/EtaleCohomologyFoundations/README.md`:11 on main says the arithmetic trace
   formulas belong to InverseGaloisAndArithmeticFundamentalGroups; no section of it states one. The formula is
   GlobalShtukasAndFunctionFieldLanglands §1.4 (its README line 617 at the open head: the trace formula for
   stacks of finite type over `𝔽_q`).

   **Exact repair:**

   1. At :790–791 write "the trace formula of gap:arithmetic-d-module-operations and the Grothendieck–Lefschetz
      trace formula of GlobalShtukasAndFunctionFieldLanglands §1.4".
   2. At :792 extend the `*Needs:*` line of §1.8 by "; GlobalShtukasAndFunctionFieldLanglands §1.4".
   3. At :241 write "§1.4: `ℓ`-adic sheaves on the stacks of finite type used here, with the Grothendieck–Lefschetz
      trace formula over `𝔽_q`".
   4. At :394 write "EtaleCohomologyFoundations §§F.2.1–F.2.7 and F.4.1–F.4.6: base change, lower shriek and
      compact support for constructible coefficients, and bounded constructible `ℓ`-adic systems with their
      rational realization, on schemes of finite type"; at :99 and :813 add the same section numbers.

   Tested on the instance: GlobalShtukasAndFunctionFieldLanglands is already a supplier (order 360, this roadmap
   366), so no new edge appears; its §1.4 Check says the operations restrict on separated schemes of finite
   type to those of EtaleCohomologyFoundations, and the correspondence `GR_W°` of §1.5 is such a scheme. The
   headings F.2.1–F.2.7 and F.4.1–F.4.6 exist on main (lines 504–759 and 959–1089).

2. **F02** (P3) four page ranges outside Xu–Zhu are one page too wide

   **Location:** `packages/KloostermanSheavesAndBesselIsocrystals/README.md`:873 ("Zhu Lemma 20, pp. 21–22");
   :901 ("Zhu Theorem 8 and Corollary 9, pp. 8–10"); :988 ("Proposition 8 and Corollaries 9–10, pp. 27–29");
   :1397–1398 ("HNY Lemma 2.1 and Remark 2.2, pp. 255–256").

   **Claim:** each cited item lies on the pages given.

   **Witness:** Zhu line 993 (Lemma 20, with its proof to line 1004) lies between the page markers at 967 and
   1006: p. 22. Zhu lines 377 and 435: Theorem 8 on p. 9, Corollary 9 on p. 10. FG lines 1188, 1230, 1237–1242,
   page markers 1175, 1213, 1243: pp. 27–28. HNY lines 639 and 648, marker 636: printed p. 256.

   **Exact repair:** write "p. 22" at :873; "pp. 9–10" at :901; "pp. 27–28" at :988; "p. 256" at :1398.
   This is the pattern of the previous review's F02, which the repair swept in Xu–Zhu only. I set every other
   HNY, Zhu, Frenkel–Gross, Miyatani, Gross–Reeder and Pech–Rietsch–Williams page locator of the README
   against the page markers (list under "Verified sound"); these four are the only slips.

3. **F03** (P3) the equal-length hypergeometric sum of §9.1 has an owner that the scope does not name

   **Location:** `packages/KloostermanSheavesAndBesselIsocrystals/README.md`:1916–1918, the sum
   "`H_{ψ,d}(χ;ρ)(a) = Σ_{∏x_i = a∏y_j} ψ(Tr(Σx_i−Σy_j)) ∏χ_i(Nx_i) ∏ρ_j^{−1}(Ny_j)`", stated for all lengths
   `n, m`, with the scope list at :61–99.

   **Claim:** every object another roadmap states is cited in "Scope and ownership", as the raw Kloosterman sum is.

   **Witness:** HypergeometricMotives §4.2 (open, order 103; its README line 1333) defines `katzExpSum ω ψ a b t`
   over `t∏x_i = ∏y_j` for parameter lists of equal length. For `n = m` and `d = 1` the sum of §9.1 is that sum
   at `t = a^{−1}`. The README does not mention HypergeometricMotives.

   **Exact repair:** add to the list "It leaves to other roadmaps" the bullet: "Katz's hypergeometric exponential
   sum for two parameter lists of equal length: **HypergeometricMotives** §4.2 (`katzExpSum`, at `t = a^{−1}`,
   `ℂ`-valued there and transported to `K`-valued characters as in the Hasse–Davenport contract); the sums of
   Layer 9 with lists of unequal length, and the local `quadraticHypergeometricSum` of lengths `(N, 1)`, are not
   stated there". Tested: that roadmap's Layer 4 is stated only for "disjoint of equal cardinality", so the
   sums consumed in §§9.2–9.4 and 11.1–11.2 (lengths `(n, m)` with `n > m`) stay here, and no `*Needs:*` line
   changes.

Three findings, all P3; none is blocking. The five findings of the previous review are repaired and the
repaired passages hold under recomputation. No statement was found false: every numerical claim I recomputed
agrees, and the signed Dwork congruence survives a new adversarial family. `Suggested.lean` elaborates with
`sorry` as its only warning, the dependency check is clean, and no theorem is padding. The findings are a
supplier citation that names the wrong owner (§1.8), four page ranges in sources the last repair did not
sweep, and one uncited overlap with HypergeometricMotives.

## Verified sound

### Previous findings

| Previous finding | Status | Repaired passage |
| --- | --- | --- |
| F01 (P3) external products of ULA objects | Repaired | README:609–615: "for a smooth `k`-scheme `S` and every object `M` on a realizable `k`-scheme `Y`, the pullback `pr₁^+M` to `Y × S` is ULA over `S` through `pr₂` (Proposition 2.8.3(i) …)". The external-product clause is gone; the new Check (:636–638) is consistent with the Check at :632–633. |
| F02 (P3) four page ranges | Repaired | :717 "p. 38"; :1784 "p. 60"; :1852 and :1868 "(p. 59)"; :1928 "p. 57". All agree with the page markers. The same pattern in other sources is R02. |
| F03 (P3) four consumed sections absent from the contract | Repaired | :288–289 "(§RD.3.47)"; :294–295 "(§RD.5.101)"; :299–301 "(§§RD.6.4, RD.6.25)". The descriptions match the supplier's statements (read at its head, below). |
| F04 (P3) normalized periodic datum | Repaired | :2035–2037: "a family satisfying (a), (b) and either (c) or, for `p = 2`, (c′), together with `B⁽ⁱ⁾(0) = 1` and `B⁽ⁱ⁺ʳ⁾ = B⁽ⁱ⁾` …; it is *ordinary* or *signed*". §10.2(iii) and §10.3 say "ordinary or signed". Agrees with XZ line 3060. |
| F05 (P3) superfluous completeness binder | Repaired | `Suggested.lean`:66–68 has no `IsAdicComplete`; README:2062–2065 states (i), (ii) for every discrete valuation ring. Recomputed below. |

No finding of the repair report is marked "not actionable". Patterns searched in the rest of the package:
page ranges in the six other paginated sources (R02); supplier sections cited in a `*Needs:*` line and
absent from the contract (none left: 63 of 64 `RD.` ids have a heading at the supplier's head, and the
64th, RD.6.64, is mapped there by "Target RD.6.64 is now §RD.2.52"); completeness binders (none in the
Lean file; the README keeps "complete" only where §§0.1, 3 and 10.2(iii) use it).

### Principles, shape and policy

- 12 layers, each ending with `### Examples` and `### Dependencies`; 65 numbered targets; 65 `*Needs:*`
  lines; 70 `**Checks.**` blocks, none with fewer than three bullets (counted by script). No layer is named
  after a source chapter and no sentence says the roadmap follows a source.
- Grep of README, Lean file and manifest for pull-request numbers, round labels, job ids, dates, machine
  paths, HTML, LaTeX delimiters, "currently", "removed", "deferred", "optional", `lemma`, `set_option`,
  `#eval`, `#print`, `opaque`, `axiom`: no hit. The only import is `Mathlib`.
- No good-primes shortcut: `p ∤ |W_H|` qualifies only the Gross–Reeder break statement, and `p = 2` and
  rank divisible by `p` are treated.
- `sources.toml`: 24 entries for the 24 works of `## References`, one key each, no local path; 17
  certified, 7 uncertified.
- §7.2 is absent by design: "former §7.2 is now §2.9", and the former-numbering table has a row for each
  of the ten labels GlobalShtukasAndFunctionFieldLanglandsPartII cites (its README lines 617, 639, 792).

### Seeded source sample

All 15 targets were opened at their locators. The author flagged no locator as unverified.

| Target | Text read | Outcome |
| --- | --- | --- |
| 0.3 | XZ lines 1747–1773 (pp. 37–38), 1943–1953 (pp. 41–42); HNY lines 527–578 (printed pp. 253–254), proof to line 608 (p. 255) | Agrees: `Ω` indexes components, `j_γ` an affine open embedding, `1 → T → T̃ → Ω → 1`. |
| 1.7 | XZ lines 1943–1964, 1972–1985; HNY lines 701, 706 (p. 257), 807 (p. 260) | Agrees; independence of `s` only at `χ = 1` (XZ line 1964). |
| 2.3 | XZ lines 2243–2260 (pp. 48–49); Zhu lines 950–1004 | Agrees. Page of Lemma 20: R02. |
| 2.6 | XZ lines 2277–2289 (p. 49) | Agrees; the rational marking is the README's own addition. |
| 2.7 | XZ lines 2201–2205 (p. 47), 2243–2289; Zhu lines 1008–1038 (p. 23) | Agrees. |
| 3.1 | XZ lines 701–714 (p. 15), 733–749 (pp. 15–16), 2002–2012, 2024–2044 (pp. 43–44) | Agrees: `A†` overconvergent along `{0, ∞}` (line 2029), `A† → A₀` faithfully flat (line 2036). |
| 3.2 | XZ lines 2013–2044 (pp. 43–44) | Agrees. |
| 3.4 | XZ lines 2093–2107 (p. 45) | Agrees; the README routes through `ℋ⁰` only, as its §3.3 requires. |
| 4.1 | XZ lines 2292–2313 (pp. 49–50) | Agrees. |
| 6.3 | XZ lines 2425–2450 (pp. 52–53) | Agrees; the printed exponent indexing (line 2441) is corrected, row below. |
| 6.5 | GR lines 1142 (p. 30), 1170–1173 (p. 31), 1190 (p. 31), 1302–1312 (p. 34), 1352–1354 (p. 35) | Agrees, including the standing adjoint assumption. |
| 8.2 | XZ lines 2689–2732 (p. 58), 2805–2861 (p. 60) | Agrees after two corrections of printed root coordinates (Source issues). |
| 8.3 | XZ lines 2733–2735 (p. 58), 2864–2869 (p. 60), 2908–2909 (p. 61) | Agrees. |
| 10.1 | XZ lines 3040–3053 (p. 64), 3058–3077 (p. 65) | Agrees: (a)–(c), (c′), blocks, (d), (e). |
| 10.6 | XZ lines 3013–3015, 3033–3039 (pp. 63–64), 3129–3158 (pp. 66–67), 2886–2887 (p. 61) | Agrees. |

Page locators checked beyond the sample: HNY §1.2 (pp. 250–252), Lemma 2.3 and Definition 2.4 (pp. 256–257),
Theorem 1 (p. 261), Corollary 2.15 (p. 262); Zhu Lemmas 18–21 (pp. 20–23); Frenkel–Gross §§5–6 (pp. 8–14),
Case IV (p. 13), Theorem 1 (p. 16), Proposition 11 and (14.1) (p. 29), §14 (pp. 30–31); Miyatani Definition
2.1.1 (p. 14), Proposition 2.1.3 (p. 15), Lemma 3.1.3 (p. 17), Definition 3.2.1 (p. 22), Lemmas 3.2.3–3.2.4
(pp. 22–23), Theorem 3.2.5 (p. 23), Proposition 3.3.3 (p. 26), Lemma 4.1.1 and Theorem 4.1.3 (pp. 27–28),
Remark 4.1.9 (p. 30), Propositions 4.2.1–4.2.3 (pp. 30–31); Pech–Rietsch–Williams §3.3 and Theorem 3.2
(pp. 13–14); 12 further Xu–Zhu locators, of §§2.1, 2.2, 4.2–4.4, 6.2, 6.4, 7.6 and 10.2–10.5. All agree except R02.

### Adversarial table

All values were computed in this round. Finite sums are exact in the group ring `ℤ[ℤ/p]` modulo the constant
vector, over explicitly built fields.

| Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- |
| §10.2(ii), `signed_dwork_congruence` | New family `B⁽ⁱ⁾(j) = c_i^{⌊j/4⌋} g(j) B⁽ⁱ⁺¹⁾(⌊j/2⌋)`, `B(0) = 1`, signs `c_i = ±1` constant, alternating and three random, `g ∈ {1, 1+2j, 1+j, 1/(2j+1)}` | (b), (c′) hold with `u(i,1,m) = c_i^m` (0 violations). Conclusion: 16 data × 980 coefficients (`s ≤ 4`, `m ≤ 3`, `N ≤ 48`), 0 violations; least slack 0. | Sound; `2^s` sharp |
| same, negative control | sign placed at `s = 2`: ratio `(−1)^{⌊j/8⌋}` | 68 of 980 coefficients fail `2^s`. | The hypothesis `u = 1` for `s ≠ 1` is needed, as stated |
| §10.2, incomplete `R` | `K ∩ R̂ = R` | `v̂` restricts to `v`; the family above has entries in `ℤ_(2)` and passes. | Sound |
| §10.1 Check | `B(j) = (−2)^{3j}/(j!)³` | `B(4)/B(2) = 512/13824 = 1/27 ≡ 3 (mod 4)`; `B(0)/B(0) = 1`. | (c) fails, (c′) holds |
| §1.2 product clause | `S = Spec k`; `M = j_!K` on `𝔸¹` | `pr₁^+M = M`, which is 2.8.3(i); `j_!K` not ULA over `id` yet its pullback is ULA over `pr₂`. | Sound, no clash with :632 |
| §0.3 | `SL₂`, `PGL₂`, `𝔾_m` | affine simple roots `2`, so `V = 𝔸²`, the dimension §1.4's fibre `K[2]` needs; `Ω = 1, ℤ/2, ℤ`. | Sound |
| §1.7 Check | `𝔽₅`, order-four character | exponent `1/4` gives `x^{−1}`; exponent `1` gives `x^{−4}`, trace `x̃⁴ = 1`. | Sound |
| §2.3 | `PGL₂` | slice `d + (N + axE) dx/x`: one parameter; slope at `∞` is `1/2` for `a ≠ 0`, `0` at `a = 0`. | Sound |
| §2.6 Check | `P = diag(a, 1)` | `det(cP) = c²a`; nonsquare `a` admits no `c ∈ K`. | Sound |
| §2.7 Check | `r = 3`, `λ = 1` | `Σ x^m/(m!)³ = 1 + x + x²/8`; in `δ³f + xf` the coefficient at `x` is `1 + 1 = 2`. | Sound |
| §§3.1–3.2 Check | `SL₂`, `d = 1` | fibre `𝔾_m` with `x + a/x`: `H¹` of dimension `2`, degree `0` after `[1]`. | Sound |
| §3.4 | `PGL₂`, `E₈` | ranks `3 = dim Sym²`, `248`. | Sound |
| §4.1 | `SL₂`, `q = 3` | `R₂(1) = −1`, `R₂(2) = 2`; traces `1/√3`, `−2/√3`; `√3 ∉ ℚ₃(√−3)`. | Sound |
| §6.3 | `SL₃`; `G₂`; `B₂` | `Sym^{2e}`: `3 + 5 = 8`; printed: `1 + 3 = 4`. `14/6 < 3`. `Σ(ℓ − ⌊ℓ/p⌋)`: `A₂, p = 2`: `2 = r`; `A₂, p = 3`: `3 > 2`; `B₂, p = 2`: `3 > 2`. | Sound; exceptions as listed |
| §6.5 Check | `𝔽₅((t))`, `u⁴ = t`, `z⁵ − z = u^{−2}` | `v(u) = 5`, `v(z) = −2`, `v(uz²) = 1`, `v(u(2z+1)) = 3`; `τστ^{−1}(z) = z − 1`; upper break `2/4`; Swan of `Ad` `2 · 1/2 = 1`. | Sound |
| §8.2 | even `n = 3, 4, 5`; odd `n = 1, 2, 3` | `X^tJ + JX = 0` for `N`, `E`; `(N + cE)(e_n − e_{n+1}) = 0`; both fail after adding `E_{n,n+1}`. Odd recursion `r^{2n+1}c_r = 2(2r−1)c_{r−1}` gives `(2r−1)!! 2^r/(r!)^{2n+1}` for `r ≤ 5`. | Sound |
| §8.3 Check | `𝔽₂`, `n = 3` | `(1 + 8 − 2)/8 = 7/8`, `(1 − 2)/8 = −1/8`; difference `1`. | Sound |
| §8.5 | chart sum, `n = 3`: `𝔽₂, 𝔽₃, 𝔽₄`; `n = 4`: `𝔽₂, 𝔽₃` | `3`; `13, 4`; `5, 37, 5`; `7`; `13, 40`; equal to `S_n + Q^{n−1} − Q` in all nine cases. Printed constant at `n = 4`: `5`; `7, 34`. | Sound; printed constant refuted |
| §10.6 Check | `𝔽₂`; `𝔽₄` | `R₃, R₅, R₇ = −1` and `U_n(1) = 1`; over `𝔽₄` at `a = 1`: `5, 21, 85` on both sides. | Sound |
| `orthogonalSum_sub_card_eq_kloostermanSum` | `𝔽₂` (`n ≤ 3`), `𝔽₄` (`n ≤ 3`), `𝔽₈` (`n ≤ 2`), all `a` | 26 equalities; `𝔽₈`, `a = 1`: `17, −151`. | Sound |
| same, control | `𝔽₄`, `ψ₀(Tr(ωx))` | `U₁(a) − 4 = 5, −3, −3`; `R₃(a) = −3, 5, −3`; `R₃^{Tr}(a/ω) = 5, −3, −3` at `a = ω, 1, ω²`. | The trace character is needed |
| `gaussSum_mul_orthogonalSum_sub_card` | `𝔽₃, 𝔽₅` (`n ≤ 2`), `𝔽₇, 𝔽₉` (`n = 1`), all `a`, two characters | `g = −i√3`, `H₃(4) = 2i√3`; `𝔽₉`: `g = 3`, `H₃(4) = 48`. With `Σρ(y)ψ(y)`: fails over `𝔽₃, 𝔽₇`, passes over `𝔽₅, 𝔽₉`. | Sound |
| `orthogonalSum_sub_card_eq_convolution` | `𝔽₂, 𝔽₃` (`N = 2, 3`), `𝔽₄, 𝔽₅, 𝔽₇, 𝔽₈, 𝔽₉` (`N = 2`), two characters | all equal. | Sound |
| Identities, total | | 144 exact equalities, no failure. | Sound |
| `orthogonalSum_ordinary` | `𝔽₃`, `n = 1`, `a = 1, 2`, `L = 𝔽₃, 𝔽₉` | `U₁ − 3 = −2, 1 = α² + 3 + β²`; over `𝔽₉`: `16, −5`, the second power sums. `T² − T + 3` and `T² + 2T + 3` have slopes `0, 1`, so `β` has valuations `0, 1, 2`. | Sound |
| §2.9(v) | `𝔽₃`, `Sp₄` against `SO₅` | `R₄ = 5, −4`, over `𝔽₉`: `−1, 62`; `e₂/3 − 9 = −5, 4` at `a = 1, 2`; `U₂ − 3 = 4, −5`. Equal after `a ↦ −a`. | Sound: the identity is for matched parameters, as stated, and not for equal `a` |
| §9.4 Check | `𝔽₃`, `n = 2`, `a = 1` | `U₂(1) = 7`; `−4/(3√3)`; twisted `−4/9`; `T_{SO₅} = 4/9`. | Sound |
| §11.5 Check | `𝔽₂` | `1/4` against `(1 − 2)/4 = −1/4`. | Sound |
| §11.1 small Checks | `𝔽₃`, `𝔽₂` | `H₀(1) = ζ²`, `H₀(2) = −ζ`, `H₁(1) = 0`, `H₁(2) = ζ − ζ²`; `n = 0`: `R₂(2)² = 4`. | Sound |
| §1.8 (R01) | owner of the `ℓ`-adic trace formula | EtaleCohomologyFoundations: no statement; GlobalShtukasAndFunctionFieldLanglands §1.4: stated. | **R01** |
| §9.1 (R03) | `n = m`, `d = 1` | `∏x = a∏y` is `t∏x = ∏y` at `t = a^{−1}`; zero coordinates contribute `0` there. | **R03** |

### Lean file

- `lake env lean` on `packages/KloostermanSheavesAndBesselIsocrystals/Suggested.lean`, from the content
  checkout: exit 0; five `declaration uses 'sorry'` warnings at lines 66, 133, 145, 156, 169; nothing else.
- Signatures: the elaborated types of the six definitions and five theorems were compared with the README
  statements. No binder is lost and none is superfluous. `signed_dwork_congruence` now asks only for a
  discrete valuation ring in which `2` is not a unit, with `CharZero K`, which is §10.2(ii) as repaired.
- One-tactic probe on all five theorems, on a scratch copy: `simp`, `rfl`, `infer_instance`, `decide`,
  `trivial`, `aesop`, `omega`, `norm_num`, `simp_all`, `exact?`, and `simp` after unfolding the five
  definitions: 55 attempts, 55 failures. No padding. No `example`, no boundary-case theorem.
- Every backticked name the README attributes to this roadmap (`dworkBlock`, `kloostermanSum`,
  `orthogonalSum`, `quadraticCharIn`, `quadraticHypergeometricSum`, `traceChar` and the five theorems) is
  declared. No other roadmap's `Suggested.lean` declares any of them under the same qualified name (search
  of all open heads and main: `quadraticCharIn`, `quadraticHypergeometricSum`, `traceChar`, `dworkBlock` and
  `signed_dwork_congruence` occur nowhere else; `kloostermanSum` and `orthogonalSum` occur elsewhere only in
  other namespaces, for other objects).

### Headline theorems

| README headline | Disposition |
| --- | --- |
| Eigenobject and Bessel F-isocrystal (§§1.6, 4.1); Satake (§1.3); Zhu and de Rham–rigid comparisons (§§2.7, 3.5); monodromy (§§2.8, 6.4, 11.4); functoriality and companions (§§7.5–7.6); hypergeometric construction (§9.1); rigidity and simple-wild parameter (§§6.6, 11.5) | Named in the module docstring as not statable, each with the missing carrier. |
| Generic and everywhere ordinarity (§§5.3, 11.3) | Newton-point form in the docstring; types `B`, `D` on traces: `orthogonalSum_ordinary`. |
| Characteristic-two comparison (§10.6) | Docstring; trace form `orthogonalSum_sub_card_eq_kloostermanSum`. |
| Signed Dwork congruences (§10.2) | `signed_dwork_congruence`. |
| Exponential-sum identities (§11.1) | Three theorems. |

No statable headline is absent and none goes through a stand-in.

### Pinned declarations opened

Mathlib at `1b1ccf4`, Tau Ceti at `2fd255d`.

- `Mathlib/Algebra/Group/AddChar.lean`:242 `compAddMonoidHom`, :354 `sum_eq_ite`, :463 `mulShift`;
  `Mathlib/NumberTheory/LegendreSymbol/AddCharacter.lean`:240 `sum_eq_zero_of_ne_one`.
- `Mathlib/FieldTheory/Finite/Trace.lean`:37, :49; `Mathlib/Algebra/Algebra/ZMod.lean`:47 `ZMod.algebra`
  (an `abbrev`, not an instance, as the README's wording allows).
- `Mathlib/NumberTheory/GaussSum.lean`:72, :200; `Mathlib/NumberTheory/LegendreSymbol/QuadraticChar/Basic.lean`:120;
  `Mathlib/NumberTheory/MulChar/Basic.lean`:455.
- `Mathlib/RingTheory/PowerSeries/Expand.lean`:33; `Mathlib/RingTheory/AdicCompletion/Basic.lean`:57;
  `Mathlib/RingTheory/DiscreteValuationRing/Basic.lean`:56; `Mathlib/RingTheory/Localization/FractionRing.lean`:52;
  `Mathlib/NumberTheory/Padics/Complex.lean`:23; `Mathlib/LinearAlgebra/Matrix/Trace.lean`:43;
  `Mathlib/LinearAlgebra/Dimension/Finrank.lean`:61.
- `TauCeti/Algebra/Coalgebra/Comodule/Finite/Basic.lean`:95 `FGComoduleCat`;
  `TauCeti/Algebra/AlgebraicGroup/Representation/Tannaka/GroupFunctor.lean`:138;
  `TauCeti/NumberTheory/LocalField/Herbrand/Quotient.lean`:176 and `TauCeti/NumberTheory/LocalField/Herbrand/UpperQuotient.lean`:98,
  both in namespace `TauCeti.LocalFieldsRamification`.

Grep by object at both pins: no Kloosterman sum, no Hasse–Davenport relation; the three Tau Ceti files that
mention Dwork concern weighted substitution operators, not his congruences.

### Suppliers and ownership

Every cited section was resolved now.

| Supplier | Where read | Result |
| --- | --- | --- |
| PadicDifferentialEquationsAndRigidCohomology | open head | 63 of the 64 cited ids have a heading; RD.6.64 is mapped to §RD.2.52. Read: §RD.3.47 (pointwise slopes zero), §RD.5.101, §RD.5.102(a) (no Frobenius), §RD.5.112(ii), §RD.6.4 (separated, finite type over `𝔽_q`), §RD.6.25 (alternating product on `H_c`), §RD.6.48 (`ε`), §RD.6.95 (built from `L_π`, every prime, rank `n + 1 ≥ 1`). All say what the contract assumes. |
| KloostermanMomentsAndPotentialAutomorphy | board package (order 310) | §§1.1, 1.3, 2.1, 2.5, 2.6 at lines 471, 534, 625, 725, 747. The resolver's lead "§2.6 found nowhere" is refuted by line 747. |
| PadicDifferentialEquationsAndRigidCohomologyPartII | board package (order 236) | Layer MS.4 at line 1343. |
| GlobalShtukasAndFunctionFieldLanglands | open head | §§0.1, 0.3, 0.14, 1.1–1.6, 1.8, 1.9, 1.12. |
| CongruenceSpectralGap, CharacterSumsOverFiniteFields | open heads | §4.2a, §4.2b, `hyperKloosterman`; §3.3, `hasseDavenport_lift`. |
| BunGAndNewtonStrata, MotivesAndAlgebraicCycles, FormalConnectionsOpers, SpringerResolutionAndCharacteristicCycles, DeligneWeightsAndPurity | open heads | §§1.5, 1.22; §§6.1–6.3, 6.5; F2, F4, F6; Layers 8–9 with §§8.1–8.6, 9.1, 9.2, 9.4, 9.6, 9.7; §§8.5, 8.12, 8.14, 8.19. |
| ReductiveGroups, ReductiveGroupsPartII, AffineLieAlgebras, OrthogonalSpinGroups | main | Layers 1, 7, 9, 10; RG2.3.3, RG2.3.6, RG2.4.1; A7, A8; Layers 0–1 (completed roadmap). |
| EtaleCohomologyFoundations | main | Cited with no section, and for a formula it does not state: R01. |

All suppliers are on main or earlier in the merge order (this roadmap is at 366); none is on the never-cite
list.

Declared gaps: the 11 slugs of `design/plan.json` each have a `What <Supplier> must provide (gap:…)` line
with the same slug and a named supplier. Minimality by grep at the supplier's head: the p-adic supplier has
no Baldassarri comparison, no arithmetic `D`-module operations, no Adolphson–Sperber polygon bound (its
Adolphson–Sperber citations are another paper), no criterion of Wan, no monodromy theorem of D'Addezio and
no convergence detection on a dense open; GlobalShtukasAndFunctionFieldLanglands has no estimate of
V. Lafforgue and no relative base; KloostermanMomentsAndPotentialAutomorphy has no ordinarity statement;
ReductiveGroups has no principal-`SL₂` classification. Once the findings are repaired the acceptance will
be conditional on these 11 gaps.

Ownership by object, searched on main, at the open heads and in the board packages: the Frenkel–Gross
connection, Bessel F-isocrystals for reductive groups, simple wild parameters, signed Dwork congruences and
Miyatani's hypergeometric modules are stated by no other roadmap (the hits are source citations and the
consumer GlobalShtukasAndFunctionFieldLanglandsPartII). GeometricSatakeAndFusion owns Satake categories of
local modification spaces with flat-perverse coefficients, not arithmetic or algebraic `D`-modules on the
affine Grassmannian. The one shared object is R03.

`scratch/overlaps.md`: no other pull request changes this roadmap, no cited id is dropped, no id is defined
only by a revision, and the third closest-roadmap list is empty.

Overlap check: read GlobalShtukasAndFunctionFieldLanglandsPartII, PadicDifferentialEquationsAndRigidCohomology, GeometricSatakeAndFusion, GlobalShtukasAndFunctionFieldLanglands, FormalConnectionsOpers, AffineLieAlgebras; nothing shared (the scalar Kloosterman F-isocrystal is owned by PadicDifferentialEquationsAndRigidCohomology §§RD.6.94–RD.6.97, the `ℓ`-adic Satake equivalence and trace formula by GlobalShtukasAndFunctionFieldLanglands §§1.4, 1.9, opers by FormalConnectionsOpers F4, all cited here; the equal-length hypergeometric sum of HypergeometricMotives §4.2, outside these lists, is R03).

Dependency check, complete output:

```
depcheck: 223 roadmaps, 1985 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line.

Maintainer notes: none were left for this roadmap.

### Copyright, licences and scope

- Wording: the 15 sampled locators and 6 further passages (the product clause of §1.2, the marking argument
  of §2.6, the route of §6.3, the definition in §10.1, the route of §3.4, the docstring of
  `signed_dwork_congruence`) were set beside XZ, HNY, Zhu, GR and FG. No sentence reproduces or tracks a
  source sentence; what is shared is formulas and lists of hypotheses.
- Arrangement: Xu–Zhu has the largest share. Its sections run 2, 3, 4.1–4.5, 5.1–5.4, Appendix A. The
  layers do not map one to one in order: Layer 1 merges §§2, 3 and 4.1; Layers 2 and 3 are §4.3 and §4.2
  reversed; Layer 5 is drawn from §5.4 and stands before the monodromy layer; Layers 8 and 9 are §5.3 and
  §5.2 reversed; Layer 11 collects §1.2.9, §5.4 and Corollary 5.3.11. The runs that agree with the source
  (Layers 3 → 4, 6 → 7, 10 → 11) are forced: §4.1 needs §3.5, §7.1 needs §6.4, §11.1 needs §10.6.
- Reuse: no table, figure or list is taken over; the monodromy table of §2.8 is restated in prose with
  two corrections.

Source independence: 21 passages compared with 5 sources, none shared; largest share XZ, 96 of about 190 source citations; contents compared with XZ: independent.

## Not verifiable

- The seven works settled as uncertified (AS89, Wan93, Wan04, Bal82, DH35, ESDE, KatzCC) were not read. Each
  is cited by locator, and what rests on them is a declared supplier gap or a supplier section.
- LT, DAd, Tsu, AC, VL-est, BD, Dw69, Abe, Spe80 and Car are cached but outside this round's sample and were
  not reopened; PRW and Miy were opened for page locators only.
- Elaboration checks types only. The numerical rows test the five Lean headlines on small instances; they
  are not proofs. `orthogonalSum_ordinary` was tested at `n = 1` over `𝔽₃` and its quadratic extension.
- The proof of the signed congruence (XZ A.13) was not checked line by line; the statement was tested on
  the Bessel data of earlier rounds and on the new family above.
- §3.3(ii) has no published proof at this generality; this round relies on the previous round's derivation,
  whose rows carry computed values.

## Source issues

- **Error** in XZ at Lemma 4.2.6(i), printed p. 44: the source says the shifted direct image from the smooth locus is holonomic because the map is affine; it should be that only its degree-zero part receives the eigenvalue; affects the proof.
- **Error** in XZ at Theorems 1.1.4 and 1.2.4, printed pp. 3–5: the source says the normalized Frobenius lives over the field generated by the Dwork parameter; it should also contain a square root of p (trace one over root three at p = 3); affects a stated result.
- **Error** in XZ at (1.2.9.1), printed p. 6: the source says that at p = 2 the squared rank-two sum minus q is minus the rank-three sum over root q; it should be the raw rank-three sum; affects a stated result.
- **Error** in XZ at (5.3.9.1) and (5.3.11.1), printed p. 61: the source says the odd orthogonal object equals the unshifted convolution; it should carry a shift by one and a half twist, changing the trace by minus one over root q; affects a stated result.
- **Error** in XZ at Proposition 5.3.5(ii), printed p. 59: the source says the constant is (q − 1)q^(n−2); it should be q^(n−1) − q, as direct evaluation at n = 4 over the fields of 2 and 3 elements shows; affects a stated result.
- **Misprint** in XZ at the proof of Proposition 5.3.8(i), printed p. 61: the source says the middle Frobenius eigenvalue at zero is 0; it should be 1; affects nothing.
- **Misprint** in XZ at the proof of Lemma 4.5.5, printed p. 53: the source says the adjoint representation is the sum of symmetric powers of degree twice the exponents minus two; it should be twice the exponents; affects nothing.
- **Misprint** in XZ at the proof of Proposition 4.4.5, printed p. 50: the source says the inverse conjugate of N by Frobenius at zero is qN and that ρ(q) scales N by 1/q; it should be the direct conjugate and the factor q; affects nothing.
- **Misprint** in XZ at §5.3.6, printed p. 60: the source says the middle coordinate of the root-depth quotient of the symplectic group is the matrix unit in row n − 1, column n, already present in the sum; it should be row n, column n + 1; affects nothing.
- **Misprint** in XZ at §5.3.3, printed p. 58: the source says the affine coordinate of the even orthogonal root-depth quotient is the upper-triangular highest-root vector over x; it should be the lower-triangular lowest-root vector, as in the symplectic case; affects nothing.
- **Misprint** in FG at (14.1) and the display after it, printed p. 29: the source says the two local terms subtracted are both the invariants of inertia at zero; it should be those at zero and at infinity; affects nothing.

## For the human reviewers

- **Licence.** `BD` (Beilinson–Drinfeld, *Quantization of Hitchin's integrable system*) is an unpublished preprint read from an author page; it is cited for §1.3 and §2.4 (`sources.toml`, entry `BD`).
- **Scope.** The README states as targets eleven corrections to printed statements or proofs of refereed papers (XZ, FG), listed under "Source issues"; §3.3(ii) replaces Xu–Zhu Lemma 4.2.6(i) by a statement with no published proof.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "2531294283fdfa135e58332570000f90627fddd1", "job": "REV-PKG-KloostermanSheavesAndBesselIsocrystals~8", "model": "fable", "worker": "chris-x16"} -->
