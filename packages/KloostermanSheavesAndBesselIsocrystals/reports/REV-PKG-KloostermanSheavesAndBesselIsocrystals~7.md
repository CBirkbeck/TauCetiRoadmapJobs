<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13150#issuecomment-6851911707 -->
Review (claude) of 46380d2

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) §1.2 states external-product stability of ULA without a locator, beyond what the source proves

   **Location:** `packages/KloostermanSheavesAndBesselIsocrystals/README.md`:604–605, "Prove preservation
   under smooth pullback and proper pushforward (Proposition 2.8.3), and under external products over
   products of smooth bases by the tensor comparison."

   **Claim:** `M₁ ⊠ M₂` is ULA over `S₁ × S₂` whenever each `M_i` is ULA over `S_i`, by the comparison
   map of the definition.

   **Witness:** Proposition 2.8.3 (XZ lines 999–1007) has no external-product clause; the fusion proof
   (XZ lines 1363–1367) uses only a pullback from `Gr × Gr`, by 2.8.3(i). Test objects `N₁ ⊠ N₂` do not
   generate `D(S₁ × S₂)`.

   **Exact repair:** replace the clause "and under external products over products of smooth bases by the
   tensor comparison" by: "and prove that for a smooth `k`-scheme `S` and every object `M` on a realizable
   `k`-scheme `Y`, the pullback of `M` to `Y × S` is ULA over `S` (Proposition 2.8.3(i) with the base change
   of Definition 2.8.2, p. 21); this is the case used for the Satake kernel spread over `X` and for external
   products over `X²` in the fusion product (Xu–Zhu §3.2.2, p. 28, and proof of Proposition 3.2.5(i), p. 29)".
   Tested on the consumer: for `A ⊠ L_X[1]` on `Gr × X` (XZ line 1315) and `A₁ ⊠ A₂` on `Gr_X × Gr_X` over `X²`
   (XZ line 1363), both are pullbacks from the first factor of a product with a smooth base, so the repaired
   clause gives exactly what §§1.3, 1.5 and 1.6 use.

2. **F02** (P3) four page ranges run one page past the cited item

   **Location:** `packages/KloostermanSheavesAndBesselIsocrystals/README.md`:703–704 ("§4.1.2,
   (4.1.2.1)–(4.1.2.4), pp. 38–39"); :1771 ("§5.3.6, (5.3.6.1)–(5.3.6.4), pp. 60–61"); :1839 and :1855
   ("Proposition 5.3.5 … pp. 59–60"); :1915 ("Theorem 5.2.2 and §5.2.3, pp. 56–57").

   **Claim:** each cited item lies on the pages given.

   **Witness:** XZ page markers at lines 1821, 2803, 2871, 2618: §4.1.2 is lines 1779–1815 (p. 38);
   §5.3.6 to (5.3.6.4) lines 2805–2839 (p. 60); Proposition 5.3.5 and proof lines 2774–2802 (p. 59);
   Theorem 5.2.2 and §5.2.3 lines 2620, 2630 (p. 57).

   **Exact repair:** write "p. 38" at :704; "p. 60" at :1771; "p. 59" at :1839 and :1855; "p. 57" at :1915.
   The neighbouring ranges were checked and stand (list under "Verified sound").

3. **F03** (P3) four consumed supplier sections are absent from the supplier contract

   **Location:** `packages/KloostermanSheavesAndBesselIsocrystals/README.md`:279–303, the bullets "RD.3:",
   "RD.5:" and "RD.6:" under "From TauCetiRoadmap.PadicDifferentialEquationsAndRigidCohomology".

   **Claim:** the contract lists the sections this roadmap consumes.

   **Witness:** `*Needs:*` lines cite §RD.5.101 (§§4.2, 5.3, 10.5; README:1268, 1414, 2114), §RD.3.47
   (§10.3; README:2070) and §§RD.6.4, RD.6.25 (§11.2; README:2264). None of the four occurs in lines
   277–350. All four exist at the supplier's head (headings quoted under "Suppliers").

   **Exact repair:** add to the RD.3 bullet "unit-root F-isocrystals (§RD.3.47)"; to the RD.5 bullet
   "convergent log-isocrystals on a smooth pair (§RD.5.101)"; to the RD.6 bullet "the `L`-function of an
   overconvergent F-isocrystal and its rationality (§§RD.6.4, RD.6.25)". With these, every `RD.` section
   cited in a `*Needs:*` or `### Dependencies` line is in the contract, singly or inside a stated range
   (the others missing by name, RD.1.17, RD.3.34 and RD.6.47, lie inside ranges the contract states).

4. **F04** (P3) "normalized periodic datum" does not say which congruence condition it carries

   **Location:** `packages/KloostermanSheavesAndBesselIsocrystals/README.md`:2021–2022, "A *normalized
   periodic* datum adds `B⁽ⁱ⁾(0) = 1` and `B⁽ⁱ⁺ʳ⁾ = B⁽ⁱ⁾` for a fixed `r ≥ 1`"; used at :2043 and :2063.

   **Claim:** §10.3 applies to the series `F` of §10.4.

   **Witness:** §10.1 names (a)–(c) "the Dwork conditions" and (c′) a replacement. For `F` at `r = 3`,
   `B(4)/B(2) = 1/27 ≡ −1 (mod 4)`: (c) fails, only (c′) holds (README:2036). Xu–Zhu Theorem A.5(ii) reads
   "under (i) or (i′)" (XZ line 3060).

   **Exact repair:** at :2021 write "A *normalized periodic* datum is a family satisfying (a), (b) and
   either (c) or, for `p = 2`, (c′), together with `B⁽ⁱ⁾(0) = 1` and `B⁽ⁱ⁺ʳ⁾ = B⁽ⁱ⁾` for a fixed `r ≥ 1`";
   at :2043 write "for a normalized periodic datum, ordinary or signed". Tested on the instance: `F` at
   `r = 3, 5` satisfies (a), (b), (c′) with `u(i, 1, m) = (−1)^m` (computed for `i < 6`, `n < 6`, `s, m < 4`),
   so §10.3 then covers it, as §10.4 needs.

5. **F05** (P3) `signed_dwork_congruence` carries an instance binder the statement does not need

   **Location:** `packages/KloostermanSheavesAndBesselIsocrystals/Suggested.lean`:67,
   "`[IsDiscreteValuationRing R] [IsAdicComplete (IsLocalRing.maximalIdeal R) R]`"; and README:2041–2042,
   statements (i) and (ii) of §10.2.

   **Claim:** the coefficientwise congruence needs `R` complete.

   **Witness:** over the incomplete `R = ℤ_(2)`, `K = ℚ`, the alternating pair of §10.2 satisfies the
   hypotheses and all 492 tested quotients (`s ≤ 3`, `m ≤ 2`, `N ≤ 40`) lie in `ℤ_(2)`. In general
   `R = K ∩ R̂`.

   **Exact repair:** delete `[IsAdicComplete (IsLocalRing.maximalIdeal R) R]` from line 67 and "complete"
   from the first sentence of the docstring; add to §10.2 after statement (ii): "Statements (i) and (ii)
   are congruences on single coefficients and hold for every discrete valuation ring of mixed
   characteristic `(0, p)`, complete or not; completeness is used only in (iii)." Tested: a scratch copy
   without the binder elaborates (exit 0, the same five `sorry` warnings) and `#check` prints the same
   hypotheses and conclusion with one instance fewer.

Five findings, all P3; none is blocking. The five findings of the previous review are repaired and the
repaired passages hold up under recomputation. No statement was found false. `Suggested.lean`
elaborates with `sorry` as its only warning, the dependency check is clean, and all five Lean headlines
were tested numerically on small instances, with no failure. The findings are: one unlocated generalisation in §1.2, four
page ranges, four consumed supplier sections missing from the contract, one ambiguous definition in
§10.1, and one unneeded instance binder in the Dwork headline.

## Verified sound

### Previous findings

| Previous finding | Status | Repaired passage |
| --- | --- | --- |
| F01 (P1) `τ_+(M)[1]` in the heart | Repaired | README:1123–1128: "the cone `C` … is `i_+ i^!(j_{!+}(M))[2]`, supported on `Z` and in holonomic degrees `≥ 0` … The complex `τ_+(M)[1]` is not in the heart". Recomputed below. §3.1 (:1066–1068) and §3.4 (:1173–1180) now use only `ℋ⁰`. |
| F02 (P3) Braden direction | Repaired | README:614–617: "the canonical map `e₋^+ a₋^! F → e₊^! a₊^+ F`, from the repelling side … to the attracting side". Matches XZ lines 1174, 1177; hypotheses of XZ line 1152 now stated. |
| F03 (P3) former labels | Repaired | README:419–423, five new rows. All 15 labels cited by GlobalShtukasAndFunctionFieldLanglandsPartII (its README lines 96, 617, 639, 792 at the open head) have a row. |
| F04 (P3) `[DecidableEq F]` | Repaired | `Suggested.lean`:156–157 has no such binder; elaboration unchanged. |
| F05 (P3) page locators | Repaired | README:2283 "Theorem 1.2.4(ii), p. 5, and Theorem 5.4.2(ii), p. 62"; :1266 "§2.9.3, p. 24"; also :1647, :1502, :1586. All five agree with the page markers. The same pattern elsewhere is R02. |

No finding of the repair report is marked "not actionable". Repaired patterns searched in the rest of
the package: shifts and hearts (§§1.4, 1.6, 3.2, 9.4, 6.6, 11.5: consistent); direction of maps
(§§3.1, 4.3–4.5: consistent); page locators (31 Xu–Zhu page locators set against the page markers; four
slips, R02).

### Principles, shape and policy

- 12 layers, each ending with `### Examples` and `### Dependencies`; 65 `*Needs:*` lines; 70 `**Checks.**`
  blocks, each with at least three bullets; no layer named after a source chapter.
- Grep over README and Lean for LaTeX delimiters, pull-request numbers, dates, round labels, machine
  paths, HTML, `lemma`, `set_option`, `#eval`, `#print`, sorry'd data: no hit.
- No good-primes shortcut: `p ∤ |W_H|` is attached only to the Gross–Reeder break statement; `p = 2` and
  rank divisible by `p` are treated.
- `sources.toml`: 24 entries, 24 works in `## References`, one key each, no local path. The Sperber
  locator "p > n + 3" in the manifest and "p > r + 2" in the README agree (`r = n + 1`).
- Every backticked name the README attributes to this roadmap (six definitions, five theorems) is
  declared in `Suggested.lean`; no other roadmap declares any of them under the same qualified name
  (CharacterSumsOverFiniteFields has its own `kloostermanSum`, a different sum in its own namespace).

### Seeded source sample

All 15 targets were opened at their locators. The author flagged no locator as unverified.

| Target | Text read | Outcome |
| --- | --- | --- |
| 1.2 | XZ lines 980–1072 (§2.8, pp. 21–23), 1151–1198 (§2.10, pp. 25–26) | Definition, 2.8.3, 2.8.5–2.8.7 and Braden agree. External products: R01. |
| 1.5 | XZ lines 1779–1815, 1870–1896 | Kernel, `pr_{2,!}(pr_1^+M ⊗ IC_V)`, base-point formula agree. Page range: R02. |
| 1.7 | XZ lines 1943–1964, 1972–1985; HNY lines 701, 706 (printed p. 257), 807 (p. 260) | Agrees. The README's rational-exponent caveat is its own and is correct (integral exponent gives a trivial Kummer object). |
| 2.1 | FG lines 346–420 (§5, pp. 8–10); XZ lines 227, 2154–2175 | Agrees; README uses the Xu–Zhu orientation (simple root vectors and lowest root). |
| 2.9 | XZ lines 1897–1942 (pp. 40–41) | (i)–(v) agree with (4.1.9.1)–(4.1.10.5). Row below for the scalings. |
| 3.2 | XZ lines 2002–2044 (pp. 43–44) | Agrees. |
| 3.3 | XZ lines 2045–2092 (pp. 44–45), 898–900 (p. 19) | The README departs from Lemma 4.2.6(i) deliberately; its (i), (ii) recomputed below. |
| 4.2 | XZ lines 2314–2322 (p. 50), 1128–1137 (p. 24) | Agrees. |
| 4.4 | XZ lines 2323–2331 (p. 50) | Printed equation is `δϕ·ϕ⁻¹ + Ad_ϕ(A) = qA(x^q)`; README's column form and §4.5 dictionary are consistent with it. |
| 6.6 | XZ lines 2478–2516 (pp. 53–54); HNY line 892 (printed p. 262); FG lines 1261–1271 (p. 29) | Agrees; FG (14.1) prints `I₀` twice, as the README says. |
| 8.1 | XZ lines 2647–2688 (pp. 57–58) | Agrees. |
| 9.3 | XZ lines 2883–2891 (p. 61); Miy lines 64–82 (Main Theorem, pp. 2–3) | Agrees; operator sign `(−1)^{n+mp}` matches Miyatani after renaming. Row below. |
| 10.3 | XZ lines 3076–3087 (p. 65) | Agrees. |
| 10.6 | XZ lines 3013, 3033–3039 (pp. 63–64), 3129–3139 (p. 66), 2886–2887 | Agrees. |
| 11.1 | XZ lines 296–331 (pp. 6–7), 2900–2911 (p. 61); Car lines 35–37 (identity (4), p. 35) | Carlitz (4) is `S₂(a)² = q + S₃(a)`; README's corrections of (1.2.9.1) and (5.3.11.1) confirmed numerically. |

Beyond the sample, the Xu–Zhu page locators of §§0.1–0.3, 1.3, 1.4, 1.6, 1.8, 2.2, 2.3, 2.6–2.8, 3.1,
3.4, 3.5, 4.1, 4.3, 5.1–5.3, 6.2–6.4, 7.1, 7.3–7.6, 8.3, 8.4, 9.2, 9.4, 10.2, 10.4, 10.5 and 11.3 were
set against the page markers of the cached text (item line against the nearest markers); they agree.
The four that do not are R02.

### Adversarial table

All values computed in this round. Finite sums are exact in `ℤ[ζ_p]` over explicitly built fields.

| Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- |
| §3.3 (ii), triangle | general | `i^!(j_{!+}M[1]) ∈ D^{≥1}` gives `C ∈ D^{≥0}`; long exact sequence: `ℋ^{<0}(τ_+) = 0`, `0 → Kl[1] → ℋ⁰(τ_+) → ℋ⁰(C) → 0`, `ℋ^k(τ_+) ≅ ℋ^k(C)` for `k ≥ 1`. | Sound |
| §3.3 (ii), `PGL₂` | `d = 2` | `j_{!+}M = L[2]`, `i^!L = L_Z[−4]`, `C = L_Z[0]`: holonomic degree 1. `ℋ⁰(τ_+)` rank `3 + 0`, `ℋ¹` rank `1`. | Sound; matches the fibre Check |
| §3.3 (i) | `PGL₂` | `H_c`: `(h⁻¹, h⁰) = (1, 3)`; `H`: `(h⁰, h¹) = (3, 1)`; image in degree 0, dimension `3 = dim W`. | Sound |
| §3.3 Check, non-affineness | quasi-minuscule, `d = 2(h−1) ≥ 2` | `H^{d−1}(U_s, M_s) ≅ H^d(i^!j_{!+}M_s)`, dual to the rank-one stalk in degree `−d`: nonzero, degree `d − 1 ≥ 1`. | Sound |
| §1.2 Braden | `𝔸²`, weights `(1, −1)`; `(1, 1)`; trivial | Attracting side `K[−2](−1)`, repelling side `K[−2](−1)`; `K[−4](−2)` both; identity. | Sound |
| §2.9 (iii) | all coordinates scaled by `a` | Product invariant scales by `a^{Σ n_i} = a^h`; rotation by `a^h` and `t_a` give net factor `a` on every line (XZ line 1930). `SL_r`: `R_r^{ψ_a}(x) = R_r(a^r x)`. | Sound |
| §4.3–4.5 | `SL₂`, `C(0) = diag(c_q^{−1}, c_q)` | `NC(0) = c_qE₁₂ = qC(0)N`. `Ad((2ρ)(i))`: simple vectors `× −1`, lowest `× (−1)^{h−1}`. Rank one `A = −a`: `C = x^{−(q−1)a}`. | Sound |
| §6.5 Check | `𝔽₅((t))`, `u⁴ = t`, `z⁵ − z = u^{−2}` | `v(u) = 5`, `v(z) = −2`, `v(uz²) = 1`, `v(u(2z+1)) = 3`: `D₁ = D₂ = C₅`, `D₃ = 1`; upper break `2/4 = 1/2`; Swan of `Ad` `= 2·1/2 = 1`. | Sound |
| §7.3 Check | `p = 2`, coefficients `4^j/(j!)²` | `v₂ = 2j − 2(j − s₂(j)) = 2s₂(j)`: radius 1; `λ ↦ 2λ`: radius `|4|^{−1} = 4`. | Sound |
| §8.5 | `n = 3`: `𝔽₂, 𝔽₃, 𝔽₄`; `n = 4`: `𝔽₂, 𝔽₃`, all `a` | Chart sums `3`; `13, 4`; `5, 37, 5`; `7`; `13, 40`. `S_n + Q^{n−1} − Q`: the same nine values. Printed constant at `n = 4`: `5`; `7, 34`. | Sound; printed constant refuted |
| §9.2–9.3 | operators | §8.2 operator under `x ↦ x/4`: `δ^{2n+1} − π^{2n}x(δ + 1/2)`; Miyatani's: `δ^{2n+1} − π^{2n}x(δ − 1/2)`; integral shift. Scalar: `H/((−c_q)^{n−1}∏g_j)`. | Sound |
| §9.4, §11.5 Checks | `𝔽₃`, `n = 2`, `a = 1`; `𝔽₂` | `Σ T_{SO₃}K₂ = (−2/3)(1/√3) + (1/3)(−2/√3) = −4/(3√3)`; twisted `−4/9`; `T_{SO₅} = (7−3)/9 = 4/9`. `𝔽₂`: `1/4` against `−1/4`. | Sound |
| §10.1–10.2 | `F`, `G`, alternating pair, `r = 3, 5`; `B = 1` | (b), (c′) hold; `u(0,1,m) = 1`, `u(1,1,m) = (−1)^m` for the pair; `u = (−1)^m` for `F`; `u = 1` for `G`. Conclusion: 7 × 492 coefficients, 0 violations; least slack 0 (for `F`), so `2^s` is sharp. | Sound |
| `signed_dwork_congruence` | `R = ℤ_(2)` | As above, quotients in `ℤ_(2)`. | Sound; **R05** |
| §11.1 (i), Lean | `𝔽₂` (`n ≤ 3`), `𝔽₄` (`n ≤ 2`), `𝔽₈` (`n = 1`), all `a` | At `a = 1`: `−1, −1, −1`; `5, 21`; `17`, both sides. | Sound |
| §11.1 (i), control | `𝔽₄`, `ψ₀(Tr(ωx))` | `U₁(a) − 4 = 5, −3, −3`; `R₃^{ψ}(a) = −3, 5, −3`; `R₃^{Tr}(a/ω) = 5, −3, −3`. | Trace character needed, as stated |
| §11.1 (ii), Lean | `𝔽₃, 𝔽₅` (`n ≤ 2`), `𝔽₇, 𝔽₉` (`n = 1`), all `a`, several `ψ` | `𝔽₃`: `g(U₁−3) = 2 + 4ζ = 2i√3 = H₃(4)`; `𝔽₅`, `n = 2`: `U − q = 21`; `𝔽₉`: `g = 3`, `3·16 = 48`. All equal. | Sound |
| §11.1 (iii), Lean | `𝔽₂` (`N = 2, 3`), `𝔽₃` (`2, 3`), `𝔽₄, 𝔽₅, 𝔽₇, 𝔽₈, 𝔽₉` (`2`) | `−1, −1`; `4, −14`; `21`; `21`; `35 + 45ζ² + …` on both sides. | Sound |
| Identities, total | | 160 exact equalities, no failure. | Sound |
| §11.1 small Checks | `𝔽₃` | `H₀(1) = ζ²`, `H₀(2) = −ζ`, `H₁(1) = 0`, `H₁(2) = ζ − ζ² = i√3`, `U₁ = 1, 4`, `U₂ = 7, −2`; `𝔽₂`: `R_k(1) = (−1)^k`, `U_n(1) = 1`. | Sound |
| `orthogonalSum_ordinary` | `𝔽₂`, `n = 1`, `a = 1` | Power sums `−1, 5, 17` give `T³ + T² − 2T − 8`; coefficient valuations `0, 0, 1, 3`; slopes `0, 1, 2`. | Sound |
| §11.2 | polytope | Origin is a vertex (`n = 1`, `d = 2` checked); `2n + 1` facets off the origin, each of determinant `±d`; volume `(2n+1)d/(2n+1)! = d/(2n)!`; degree `d(2n+1)`. `S(f₂) − S(f₁) = Σ ρ(y)ψ(…) = H_{2n+1}(a)`. | Sound |
| §11.3, type `D` | `ρ = (n−1, …, 1, 0)` | Standard slopes fix `ν` up to all sign changes; the zero coordinate absorbs an odd one, so `ν = ρ` in `W(D_n)`-orbits. | Sound |
| Conventions | `q = 3`; `q = 4, d = 2` | `−R₂(1)/√3 = 1/√3 ∉ ℚ₃(√−3)`; `c_4^{−2} = 1/4`, square `1/16 = q^{−d}`. `ε = −1` in §RD.6.48 gives `exp(π(x − x^q))` and trace `ψ`. | Sound |
| Former-numbering table | 15 cited labels | 15 rows found. | Sound |

### Lean file

- `lake env lean` on `packages/KloostermanSheavesAndBesselIsocrystals/Suggested.lean`, from the content
  checkout: exit 0; five `declaration uses 'sorry'` warnings at lines 66, 133, 145, 156, 169; nothing
  else. The only import is `Mathlib`.
- Signatures: the 11 elaborated types (six definitions, five theorems) were compared with the README
  statements. No binder is lost; one is superfluous (R05). `orthogonalSum_ordinary` needs no scalar
  tower: `Algebra (ZMod p) L` is a subsingleton (`Mathlib/Algebra/Algebra/ZMod.lean`:24).
- One-tactic probe on all five theorems with `simp`, `rfl`, `infer_instance`, `decide`, `trivial`,
  `omega`, `aesop`, `exact?`: 40 attempts, 40 failures. No padding.
- Transport to an arbitrary coefficient field `K`: a nontrivial `ψ : F → K` takes values in `μ_p(K)` with a
  primitive `p`-th root, so both sides are images of classes in `ℤ[X]/Φ_p`; characteristic-`p` `K` admits
  no nontrivial `ψ`. The statements are not vacuous and not false there.

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
  `Mathlib/NumberTheory/LegendreSymbol/AddCharacter.lean`:240 `sum_eq_zero_of_ne_one` (domain needed).
- `Mathlib/FieldTheory/Finite/Trace.lean`:37, :49; `Mathlib/Algebra/Algebra/ZMod.lean`:47 `ZMod.algebra`.
- `Mathlib/NumberTheory/GaussSum.lean`:72, :200; `…/QuadraticChar/Basic.lean`:120;
  `Mathlib/NumberTheory/MulChar/Basic.lean`:455.
- `Mathlib/RingTheory/PowerSeries/Basic.lean`:77, :112; `…/PowerSeries/Expand.lean`:33;
  `Mathlib/RingTheory/AdicCompletion/Basic.lean`:57; `…/DiscreteValuationRing/Basic.lean`:56;
  `Mathlib/RingTheory/Localization/FractionRing.lean`:52; `Mathlib/NumberTheory/Padics/Complex.lean`:23;
  `Mathlib/LinearAlgebra/Matrix/Trace.lean`:43; `Mathlib/LinearAlgebra/Dimension/Finrank.lean`:61.
- `TauCeti/Algebra/Coalgebra/Comodule/Finite/Basic.lean`:98 `FGComoduleCat`;
  `TauCeti/Algebra/AlgebraicGroup/Representation/Tannaka/GroupFunctor.lean`:138;
  `TauCeti/NumberTheory/LocalField/Herbrand/Quotient.lean`:176 and `…/UpperQuotient.lean`:98, both in
  namespace `TauCeti.LocalFieldsRamification`, with the statements the README gives.

Grep by object (`kloosterman`, hypergeometric and orthogonal sums, Dwork blocks) at both pins: nothing.

### Suppliers and ownership

Every cited section was resolved now.

| Supplier | Where read | Result |
| --- | --- | --- |
| PadicDifferentialEquationsAndRigidCohomology | open head `ef77e5b` | Every cited id has a heading except one: RD.6.64 is mapped by the supplier ("Target RD.6.64 is now §RD.2.52", *Neutral Tannakian recognition theorem*). §RD.6.48 (`ε` convention), §RD.6.95 (built from `L_π`, every prime and rank), §RD.5.102(a), §RD.5.112(ii), §RD.4.59 read and say what is assumed. Headings for R03: "RD.3.47 Unit-root F-isocrystals", "RD.5.101 Convergent log-isocrystals on a smooth pair", "RD.6.4 The `L`-function of an overconvergent F-isocrystal", "RD.6.25 Rationality of `L`-functions…". |
| KloostermanMomentsAndPotentialAutomorphy | board package (order 310) | §§1.1, 1.3, 2.1, 2.5, 2.6 at lines 471, 534, 625, 725, 747; §1.3 and §2.6 state what is assumed. The resolver's lead "§2.6 found nowhere" is false. |
| PadicDifferentialEquationsAndRigidCohomologyPartII | board package (order 236) | Layer MS.4, MS.4.6 at lines 1343, 1461. |
| GlobalShtukasAndFunctionFieldLanglands | open head `ede1562` | §§0.1, 0.3, 0.14, 1.1–1.6, 1.8, 1.9, 1.12. |
| CongruenceSpectralGap, CharacterSumsOverFiniteFields | open heads | §4.2a, §4.2b, `hyperKloosterman`; §3.3, `hasseDavenport_lift`. |
| BunGAndNewtonStrata, MotivesAndAlgebraicCycles, FormalConnectionsOpers, SpringerResolutionAndCharacteristicCycles, DeligneWeightsAndPurity | open heads | §§1.5, 1.22; §§6.1–6.3, 6.5; F2, F4, F6; Layers 8–9, §§9.1, 9.2, 9.4, 9.6, 9.7; §§8.5, 8.12, 8.14, 8.19. |
| ReductiveGroups, ReductiveGroupsPartII, AffineLieAlgebras, EtaleCohomologyFoundations, OrthogonalSpinGroups | main | Layers 1, 7, 9, 10; RG2.3.3, RG2.3.6, RG2.4.1; A7, A8; Layers 0–1 (completed roadmap; its open revision keeps both headings). |

All suppliers are on main or earlier in the merge order (this roadmap is at 366; the latest supplier is
at 360). None is on the never-cite list.

Declared gaps: the 11 slugs of `design/plan.json` each have a `What <Supplier> must provide (gap:…)`
line with the same slug. Minimality checked by grep at the supplier's head: the p-adic supplier has no
Baldassarri comparison, no holonomic arithmetic `D`-modules, no Adolphson–Sperber polygon bound, no Wan
criterion and no monodromy-comparison theorem of D'Addezio (its D'Addezio citations are another paper);
KloostermanMomentsAndPotentialAutomorphy has no ordinarity statement. The acceptance, once the findings
are repaired, will be conditional on these 11 gaps.

Ownership by object, searched on main, at the open heads and in the board packages: the Frenkel–Gross
connection, Bessel F-isocrystals, simple wild parameters, signed Dwork congruences and Miyatani's
modules are stated by no other roadmap (other hits are source citations or the consumer
GlobalShtukasAndFunctionFieldLanglandsPartII). Universal local acyclicity and hyperbolic localization
elsewhere are `ℓ`-adic or v-stack statements; §1.2 owns the arithmetic `D`-module versions.

`scratch/overlaps.md`: no other pull request changes this roadmap, no cited id is dropped, no id is
defined only by a revision, and the third closest-roadmap list is empty.

Overlap check: read GlobalShtukasAndFunctionFieldLanglandsPartII, PadicDifferentialEquationsAndRigidCohomology, GeometricSatakeAndFusion, GlobalShtukasAndFunctionFieldLanglands, CharacterSumsOverFiniteFields, AffineLieAlgebras; nothing shared (the scalar Kloosterman F-isocrystal is owned by PadicDifferentialEquationsAndRigidCohomology §§RD.6.94–RD.6.97, the raw sum by CongruenceSpectralGap §4.2a and the `ℓ`-adic Satake equivalence by GlobalShtukasAndFunctionFieldLanglands §1.9, all cited here).

Dependency check, complete output:

```
depcheck: 208 roadmaps, 1908 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line.

Maintainer notes: none were left for this roadmap.

### Copyright, licences and scope

- Wording: 15 sampled locators and 6 further passages (the definition of local acyclicity in §1.2, the
  route of §3.3, the route of §6.6, the Checks of §6.5, the docstring of `signed_dwork_congruence`, the
  first paragraph of §9.1) were set beside XZ, HNY, FG, Miy and Car. No sentence reproduces or tracks a
  source sentence; shared material is formulas and hypothesis lists.
- Arrangement: Xu–Zhu has the largest share. Its contents are §2 (arithmetic `D`-modules), §3 (Satake),
  §4.1–4.5, §5.1–5.4, Appendix A. The layers do not map one to one in order: Layer 1 merges §§2, 3 and
  4.1; Layers 2 and 3 are §4.3 and §4.2 in the opposite order; Layer 5 is drawn from §5.4 and placed
  before the monodromy layer; Layers 8 and 9 are §5.3 and §5.2 reversed and re-cut; Layer 11 collects
  §1.2.9, §5.4 and parts of §4.5. The runs that agree with the source (Layers 6 → 7, 10 → 11) are forced:
  §7.1 needs §6.4, and §11.1 needs §10.6.
- Reuse: no table, figure or list is taken over; the monodromy table of §2.8 is restated in prose with
  two corrections.

Source independence: 21 passages compared with 5 sources, none shared; largest share XZ, about 95 of 190 locators; contents compared with XZ: independent.

## Not verifiable

- The seven works settled as uncertified (AS89, Wan93, Wan04, Bal82, DH35, ESDE, KatzCC) were not read.
  Each is cited by locator; what rests on them is a declared supplier gap or a supplier section.
- GR, LT, PRW, DAd, Tsu, AC, VL-est, Zhu, BD and Dw69 are cached but outside this round's sample and were
  not reopened; I checked §6.5's Gross–Reeder statements only by computing the Check.
- Elaboration checks types only. The numerical rows test the five Lean headlines on small instances;
  they are not proofs. `orthogonalSum_ordinary` was tested at one point (`𝔽₂`, `n = 1`).
- §3.3 (ii) has no published proof at this generality (the source's argument uses the false affineness);
  I verified the derivation from the two localization triangles and the `PGL₂` instance.
- The general external-product statement of R01 was neither proved nor refuted; the finding is that it
  has no locator and the stated route does not reach it.

## Source issues

- **Error** in XZ at Lemma 4.2.6(i), printed p. 44: the source says the shifted direct image from the smooth locus is holonomic because the map is affine; it should be that only its degree-zero part receives the eigenvalue, higher cohomology being nonzero; affects the proof.
- **Error** in XZ at Theorems 1.1.4 and 1.2.4, printed pp. 3–5: the source says the normalized Frobenius lives over the field of p-th roots of unity; it should also contain a square root of p (trace one over root three at p = 3); affects a stated result.
- **Error** in XZ at (1.2.9.1), printed p. 6: the source says that at p = 2 the squared rank-two sum minus q is minus the rank-three sum over root q; it should be the raw rank-three sum; affects a stated result.
- **Error** in XZ at (5.3.9.1) and (5.3.11.1), printed p. 61: the source says the odd orthogonal object equals the unshifted convolution; it should carry a shift by one and a half twist, changing the trace by minus one over root q; affects a stated result.
- **Error** in XZ at Proposition 5.3.5(ii), printed p. 59: the source says the constant is (q − 1)q^(n−2); it should be q^(n−1) − q, as direct evaluation at n = 4 over the fields of 2 and 3 elements shows; affects a stated result.
- **Misprint** in XZ at the proof of Proposition 5.3.8(i), printed p. 61: the source says the middle Frobenius eigenvalue at zero is 0; it should be 1; affects nothing.
- **Misprint** in XZ at the proof of Lemma 4.5.5, printed p. 53: the source says the adjoint representation is the sum of symmetric powers of degree twice the exponents minus two; it should be twice the exponents; affects nothing.
- **Misprint** in XZ at the proof of Proposition 4.4.5, printed p. 50: the source says the inverse conjugate of N by Frobenius at zero is qN and that ρ(q) scales N by 1/q; it should be the direct conjugate and the factor q; affects nothing.
- **Misprint** in FG at (14.1) and the display after it, printed p. 29: the source says the two local terms subtracted are both the invariants of inertia at zero; it should be those at zero and at infinity; affects nothing.

## For the human reviewers

- **Licence.** `BD` (Beilinson–Drinfeld, *Quantization of Hitchin's integrable system*) is an unpublished preprint read from an author page; it is cited for §1.3 and §2.4 (`sources.toml`, entry `BD`).
- **Scope.** The README states as targets nine corrections to printed statements or proofs of refereed papers (XZ, FG), listed under "Source issues"; §3.3 (ii) replaces Xu–Zhu Lemma 4.2.6(i) by a statement with no published proof.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "46380d2e7f82c874f8ca3e3e140aea9bd4f75513", "job": "REV-PKG-KloostermanSheavesAndBesselIsocrystals~7", "model": "fable", "worker": "chris-x12"} -->
