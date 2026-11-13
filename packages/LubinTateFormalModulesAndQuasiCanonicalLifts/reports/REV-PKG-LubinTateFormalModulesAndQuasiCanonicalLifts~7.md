<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13044#issuecomment-6851345661 -->
Review (claude) of 82a7310

Verdict: needs_changes

**For the human reviewers:** this review raises 1 question that a human decides (the scope of the roadmap, or a licence). It is in the section of that name at the end and does not change the verdict.

1. **F01** (P2) §2.5 calls the norm-group statement equivalent to the unit formula

   **Location.** `packages/LubinTateFormalModulesAndQuasiCanonicalLifts/README.md:934–937`: "every lift
   `σ ∈ G_K` of `Art_K(x)` satisfies `χ_π(σ|_(K_π)) = u⁻¹` … Equivalently, for every `m ≥ 0` the norm
   group of `K(F_f[π^m])/K` is `π^ℤ × U(K,m)`."

   **Claim.** The unit formula and the family of norm-group statements are equivalent.

   **Witness.** The assignment `π^r u ↦ u` (the geometric normalization) also sends `π ↦ 1` and has
   kernel `π^ℤ U(K,m)` modulo `π^m` for every `m`, so it gives the same norm groups with the unit
   formula false. The README's own Check at lines 957–958 says so.

   **Repair.** Line 936: replace "Equivalently, for every `m ≥ 0`" by "Consequently, for every
   `m ≥ 0`". Nothing else changes: the two statements stay separate targets, the proof route already
   proves the norm groups first and the inverse unit afterwards, and the Lean headline
   `artinMap_fixes_lubinTate_roots_iff` is the norm-group statement, as its docstring and the module
   docstring ("not statable: the unit formula") already say.

   **Repair test.** With "Consequently": `χ_π(Art(π^r u)) = u⁻¹` is trivial modulo `π^m` exactly when
   `u ∈ U(K,m)`, which is the norm group `π^ℤ U(K,m)`; the reverse implication is no longer asserted,
   and the Check at lines 957–958 agrees with the statement.

2. **F02** (P3) `F^ur` and `F̂^ur` denote unrelated fields

   **Location.** `README.md:137–138` ("`B = O_(F^ur)` with `F^ur` the maximal unramified subextension
   of `F/F₀`"), `:1745` and `:1831` (`B = O_(F^ur)`), against `:111`, `:344`, `:349` (`K^ur` is the
   maximal unramified extension of `K`) and `:354`, `:1757` (`F̂^ur`, the completion of the maximal
   unramified extension of `F`).

   **Claim.** Every symbol has one meaning; `K̂^ur` is the completion of `K^ur`.

   **Witness.** `F = ℚ₃(π)`, `π² = 3`, `F₀ = ℚ₃`: by line 138 `F^ur = ℚ₃` and `B = ℤ₃` (as the §7.2
   Check at line 1852 uses), while `F̂^ur` of line 1757 has residue field `𝔽̄₃` and contains `π`. §6.6
   uses both in one paragraph.

   **Repair.** Rename the finite field. Line 137–138: "`B = O_(F_u)` with `F_u` the maximal
   subextension of `F/F₀` that is unramified over `F₀`". Lines 1745 and 1831: `B = O_(F_u)`. Leave
   `K^ur`, `K̂^ur` and `F̂^ur` as they are.

   **Repair test.** On the witness: `F_u = ℚ₃`, `B = ℤ₃`, and `F̂^ur` is the completion of
   `F^ur = ⋃ F(ζ_n)`, `3 ∤ n`, as the notation of line 349 says. For unramified quadratic `F/F₀`:
   `F_u = F`, `B = O_F`, as the Check at line 1847 uses.

3. **F03** (P3) VZ07 Lemma 2.1 and Definition 2.2 are on p.60

   **Location.** `README.md:408`: "(VZ07, Definition 1.1, pp.57–58; Lemma 2.1 and Definition 2.2,
   pp.59–60)"; `sources.toml`, entry `VZ07`, `locator`: "Lemma 2.1, Definition 2.2, Lemma 2.6, pp.59–61".

   **Claim.** Lemma 2.1 and Definition 2.2 are on pp.59–60.

   **Witness.** VZ07 line 2794–2799: printed p.60 opens with the section on heights and Lemma 2.1;
   Definition 2.2 is at VZ07 line 2833, same page. Printed p.59 (VZ07 lines 2751–2793) is the proof of
   Theorem 1.4 only.

   **Repair.** `README.md:408`: "Lemma 2.1 and Definition 2.2, p.60". `sources.toml`: "Lemma 2.1,
   Definition 2.2, Lemma 2.6, pp.60–61".

   **Repair test.** Lemma 2.6 is at VZ07 line 2859, printed p.61, so "pp.60–61" covers the three; the
   other VZ07 locators of the README (§§2.1, 3.2–3.6) were checked and stand.

4. **F04** (P3) layer dependency lists omit items their sections need

   **Location.** `README.md:2102` (Layer 8 Dependencies): "§§1.4, 2.3–2.5, 4.4, 7.2–7.4, 0.3; …".
   Also `:594` (Layer 0), `:1003` (Layer 2), `:1401` (Layer 4), `:1584` (Layer 5).

   **Claim.** Each layer's Dependencies list what its sections need.

   **Witness.** §8.5 `*Needs:*` (line 2093) lists §2.2; Layer 8's list has §§2.3–2.5 only. A scripted
   comparison of every `*Needs:*` line with its layer's list finds no other missing section. Mathlib
   items missing: §0.4 `IsKrasner.krasner`; §§2.1, 5.2 Weierstrass preparation; §4.4 `WittVector`.

   **Repair.**

   - Line 2102: "§§0.3, 1.4, 2.2–2.5, 4.4, 7.2–7.4; …" (rest unchanged).
   - Line 594: "Mathlib `FormalGroup`, power-series substitution and evaluation, Krasner's lemma and
     the adic completions of a Dedekind domain at a height-one prime; …".
   - Line 1003: "Layers 0–1; Mathlib Weierstrass preparation, `IntermediateField.adjoin` and
     `AlgebraicClosure`; Tau Ceti's …".
   - Line 1401–1402: append "; Mathlib `WittVector`, `GaloisField` and Weierstrass curves".
   - Line 1584–1585: append "; Mathlib Weierstrass preparation".

   **Repair test.** After the edit the script reports no section named in a `*Needs:*` line and absent
   from its layer's list (Layer 2's "Layers 0–1" covers §§0.1, 0.2, 1.2–1.4).

Four findings: one P2 and three P3. The three findings of round 6 are repaired and the repaired
passages hold on every instance computed below. The mathematics of all 50 targets was recomputed
this round (the round-6 table had left the untouched sections to an earlier round); no statement was
found false. The findings are a false "Equivalently" in §2.5, one symbol with two meanings in
§§6.6 and 7.2, one page locator, and layer dependency lists that omit items their own `*Needs:*`
lines name. `Suggested.lean` elaborates with `sorry` as the only warning and needs no change.

## Verified sound

### Previous findings, checked first

| Round-6 finding | Repaired passage | Status |
|---|---|---|
| F01 (P3): §5.5 used an `O₀`-action it did not state; `K̄` without `K` | Line 1406–1408: "over the integers `R` of a finite extension `K` of `F₀`, with `K̄` a fixed algebraic closure of `K`". Line 1537–1542: "Let `E` be an elliptic curve over `R` whose formal completion … is the formal group underlying the formal `O₀`-module `G`. … For `O₀ ≠ ℤ_p` the `O₀`-action on the completion is part of the data". Line 1549–1552: "isomorphic, as a formal group, to the formal group underlying `G_L` … the `O₀`-action … transported". New Check, lines 1566–1569 | **Repaired** |
| F02 (P3): four `*Needs:*` lines omitted a named section | Line 1197: "§§3.1, 3.4, 3.5"; line 1221: "§§3.1, 3.6, 2.1"; line 1856: "§§7.1, 6.6, 3.6, 5.2"; line 1886: "§§7.1, 6.6, 6.2, 6.5, 2.4" | **Repaired** |
| F03 (P3): two Checks commented on an absent Check | Line 698–700: "The claim that the additive law is never a Lubin–Tate module fails here"; line 724–725: "The claim that every unit comparison is non-strict fails at `u = 1`" | **Repaired** |

The repair report marked nothing "not actionable". The repaired patterns elsewhere: no other
`K̄` without a named field; R04 is the F02 pattern one level up (section `*Needs:*` against layer
Dependencies); no other Check speaks about a Check.

### Adversarial table

| Statement | Instances tried | Values computed | Result; change |
|---|---|---|---|
| §5.5 data (repaired) | `O₀ = ℤ_p`, any `E`; `O₀ = W(𝔽_(p²))`, `E` ordinary; the §4.4 curve | `ℤ_p`: `[a] = lim [n]` exists and is unique over the complete `R`. Ordinary: `p`-height `1`, a `W(𝔽_(p²))`-module of height `h` has `p`-height `2h ≠ 1`. §4.4 curve: `[−p]` Lubin–Tate, `O₀`-height 1, `p`-height 2 | Holds |
| §5.5 conclusion (repaired) | `H = 0`; `H = G[p]`, `O₀ = ℤ_p`; order-`p` `H` in the §4.4 curve at `p = 2` | identity; `L = p⁻¹T`, both sides `[p]` up to target coordinate; `{0, x} ⊂ 𝔽₄` not stable under `ω`, `ωx ∉ {0, x}` | Holds |
| §1.3 Checks (repaired wording) | `𝔽_q[[t]]`, `f = tX + X^q`; char 0 | `f(X+Y) = f(X) + f(Y)`, `f(aX) = a f(X)` for `a^q = a`; in char 0 an additive series is linear, reduction `ūX ≠ X^q` | Holds |
| §1.4 (sampled; repaired wording) | `f = πX + X^q`, `g = f + πX²`, `q > 2` and `q = 2`; `ℤ₂`, `u = 1, 3` | `X²`: `πc + [q=2] = π + [q=2] + cπ²`, `c = (1 − π)⁻¹`, reduction `X + X² + ⋯ ≠ X`; `(1+X)³ − 1` commutes with `(1+X)² − 1`, derivative `3` | Holds |
| §1.1 predicates | `q = 1`; `W(𝔽_(p²))`, `±p`, `p = 2` | `πX + X` has linear coefficient `π + 1 ≠ π`; `−2 ≠ 2` in `W(𝔽₄)`; `pX + X^p` reduces to `X^p ≠ X^(p²)` | Holds |
| §1.2 interpolation (sampled, headline) | odd `p`, `f = (1+X)^p − 1`, `g = pX + X^p`; `p = 2`; `W(𝔽_(p²))` with `q = p` | `pc + p(p−1)/2 = p²c`, `c = 1/2`; at `p = 2` `f = g`, `φ = X`; `X^p` coefficients `ā^p ≠ ā` for `ā ∉ 𝔽_p` | Holds |
| §1.3 theorem (headline) | non-complete DVR; `π` not a uniformizer (`[−p]_(H_1)` over `O_(Ψ′_1)`, §7.5) | correction divides by `π − π^r = π(1 − π^(r−1))`; error is `≡ 0` only modulo `𝔪`, not modulo `π`, when `π ∉ 𝔪 ∖ 𝔪²`: the Lean hypothesis `Irreducible π` excludes it | Holds |
| §0.1 | `ℚ(i)`, `[a] = āX`; `X + X^p` on `𝔾_a/𝔽_p`; leading term of `[π]` | ring map, linear coefficient `−i ≠ i`; additive, derivative 1, not `X`; `c·ζ̄^(p^n) = ζ̄·c` forces `𝔽_q ⊂ 𝔽_(p^n)` | Holds |
| §0.2 | `x = y = p` in `Ĝ_m`; `I = 9ℤ₃`; `FormalGroup.Point` with no variables over `ℤ_p` | `2p + p²`; `x + y + xy·g ∈ I` for any ideal; `√(9ℤ₃) = 3ℤ₃ ∋ 3`; pinned definition is `{f // HasSubst f}`, constant nilpotent, so `0` only | Holds |
| §0.3 | `p = 2`, `ℚ₂`; `ζ_p − 1` | disc `‖x‖ < 1/2`, `r = 2`: `1/4 < 1/2`; `log ζ_p = 0` with `ζ_p − 1 ≠ 0` | Holds |
| §0.4 | `ℚ₂(√−1)` and `X² + 3` | `−3 ≡ 5 mod 8`, root field unramified, `≠ ℚ₂(i)` | Holds |
| §2.1 (sampled) | `μ₃/ℤ₃`; `m = 0`; `𝔽₃[ε]/ε²`; `W(𝔽_(p²))` | `[3] = 3X + 3X² + X³`, `A_1 = ℤ₃[T]/(T³ − 1)`, primes `(T−1)`, `(T²+T+1)` (`−3` of odd valuation), `(3, T−1)`; `R[[X]]/(X) = R`; `[3] = X³`, rank 3; ranks `q^(hm) = p^(2m)`, `p`-level `p^(h·2·r)` | Holds |
| §2.3 (headline) | `ℚ₂`, `f = 2X + X²`, `m = 1, 2`; `t = 0` | root `−2`, degree `1 = (2−1)·2⁰`; `X² + 2X + 2` Eisenstein, degree `2`; `0` is a root of `f^{∘(m−1)}`, excluded | Holds |
| §2.5 (headline) | `m = 0`; `π′ = uπ`; `u ↦ u` against `u ↦ u⁻¹` | only root `0`, right side `Kˣ`; `χ_(π′)(Art π) = u`; both assignments have kernel `π^ℤ U(K,m)` modulo `π^m` | Statements hold; "Equivalently" false: **R01** |
| §2.6 | inertia; Frobenius lift fixing `K_π`; `Art(π′)` | `σθ(t) = θ^σ(σt)` gives `χ_(π′) = χ_π` on inertia and `u` on the lift; `u⁻¹·u = 1`; `η_u⁻¹` gives `u⁻²` | Holds |
| §3.1 | `[1+p]` on `Ĝ_m/𝔽_p`; `O_F/(π²)`, `π² = 3` | `(1+X)(1+X^p) − 1 = X + X^p + X^(p+1)`; `𝔪_R = {0, π, 2π}` | Holds |
| §3.2 (sampled) | degrees `1`, `q − 1`, `q^j − 1` | `XY` has degree 1; with `h(a) ↦ (a^n − a)/π`, `h(π) ↦ π^(n−1) − 1`, a unit | Holds; VZ07 Theorem 1.4 |
| §3.4 | `Ĝ_m`, `ψ = (1+εc)X`; additive module, `εX^q` | new law `X + Y + (1 − εc)XY`; `εX^q` additive, commutes with `āX`, reduction `0` | Holds |
| §3.5 (sampled) | `h = 1, 2`; `W(𝔽_(p²))` restricted to `ℤ_p` | `0`, `1`; `ℤ_p`-problem `2 − 1 = 1`, `O_K`-problem `1 − 1 = 0` | Holds; over `k` itself beyond VZ07 (separably closed), with a stated route; LT66 Proposition 2.6 is over any field |
| §3.6 (sampled) | `h = 1, 2`; `B = O_r`; imperfect `k` | `B`, `B[[t]]`; `O_r[[T₁,…,T_(n−1)]]` in the supplier (§10.2) | Holds |
| §4.1 | `ℓ = Σ (−p)^(−j) X^(p^(2j))` | `(p + T²)`: `p(−p)^(−j) + (−p)^(1−j) = 0`; `(p − T²)`: `2p(−p)^(−j)`, `2/p` at `j = 2` | Holds |
| §4.2 | `X + X²/p`, odd `p` and `p = 2` | `XY`: `−2/p`; at `p = 2`, `X²Y²`: `(−2 + 12 − 30)/8 = −5/2` | Holds |
| §4.3 | `ℓ_s`; `f = 2X + X⁴` | `pℓ_s − sℓ_s(X^q) = pX`; `1 + 16b = 2b`, `b = −1/14`; `−1/14 − 1/2 = −4/7 ∈ ℤ₂` | Holds |
| §4.4 (sampled, headline) | `y² + y = x³` over `𝔽₂`, `𝔽₄`; ordinary; `a_p = 0` over `𝔽_p` | `#E(𝔽₂) = 3`, `a₄ = 0 − 4`, `#E(𝔽₄) = 9 = 4 + 1 + 4`, `s = −1`; `(T − sp)²`, no nilpotents, `Frob = [sp]`; ordinary `[±p]` has height 1; `Frob_p² = −p`, not scalar | Holds |
| §5.2 | `Ĝ_m`; reduction | `X −_G c = (X − c)/(1 + c)`; `Ḡ_L(X^Q, Y^Q) = Ḡ(X, Y)^Q` | Holds |
| §5.4 | unramified quadratic, level one | stabilizer of a `k_(F₀)`-line is `k_(F₀)^×`; `(q₀² − 1)/(q₀ − 1) = q₀ + 1`; at `q₀ = 2` both degrees `3` | Holds |
| §6.3 | cubic `O₀ + ϖ₀O_F` | lengths `3 ≠ 2·1`, not Gorenstein | Holds |
| §6.5 (sampled) | `L_s`; `q₀ = 2`, `s = 1` | `ϖ₀^(−s)O₀ ∩ O_F = O₀`, so `L_s/T ≅ O₀/ϖ₀^s`; `[O_F : O_1] = q₀`; `#L_1/T = 2`, `#ϖ₀⁻¹T/T = 4`; orbits `3` and `2` | Holds |
| §6.6 | `a = π_F`, `L = T`; notation | `χ(Art π_F) = 1`, image `T`, class `[π_F⁻¹T] = [T]`; `F^ur = ℚ₃` against `F̂^ur ∋ π` | Holds; notation **R02** |
| §7.1 (sampled) | `s = 1, 2`; `ℚ₂(√−1)`, `ℚ₂(√−3)`; `s = 0` | `(q₀² − 1)q₀^(2s−2)/((q₀ − 1)q₀^(s−1)) = q₀^(s−1)(q₀ + 1)`; `(q₀ − 1)q₀^(2s−1)/((q₀ − 1)q₀^(s−1)) = q₀^s`; `2` and `3`; `(q₀ + 1)/q₀ ∉ ℤ` | Holds |
| §7.2 (sampled) | `ℚ₃(π)`, `π² = 3` | `[π]∘[π] = 3X + (π + π³)X³ + 3π²X⁵ + 3πX⁷ + X⁹`; vertices `(1,2), (3,1), (9,0)`; `v(t_s) ≤ 1/q₀ < 1 ≤ v(𝔪_B)` | Holds; notation **R02** |
| §7.3 (sampled) | `p = 5` | `6`, `30`; `24 > 6` | Holds |
| §7.5 (sampled) | `H_1 = H/C` | `g_1 ≡ X^p`, `[−p]_(H̄_1)(X^p) = (X^(p²))^p`, so `[−p]_(H̄_1) = X^(p²)`; `v_(Ψ′_1)(−p) = p + 1`; `End = ℤ_p + pO`, index `p` | Holds |
| §7.6 (sampled) | `L_s`, `s ≥ 1`; `s = 0` | `p⁻¹L_(s−1) = p^(−s)O_(s−1)t`, index `[O_(s−1) : O_s] = p`; `1 + p^s b` acts on `O_s/pO_s` (basis `1, p^sα`) by `[[1,0],[b₁,1]]`, fixing one line and moving `p`; `p + 1` lines at `s = 0` | Holds |
| §8.3 (sampled) | `n = 0, 1`; lift `j` of `c` | `p^(2n)`, `p^n`; `j² = (j²)⁻¹` in torsion-free `G⁻`, `j² = 1` | Holds |
| §8.4 | index count | `p^(s−1)(p+1)·p^s/p^(s−1) = p^s(p+1) = [Ψ′_(s+1) : Φ]` | Holds |
| §8.5 | `n = 0, 1` | `[p][(−1)^(n+1)]v_(n+1) = [(−1)^n][−p]v_(n+1) = w_n` | Holds; layer list **R04** |
| §9.1 | `ℚ_p(√p)`, `x = √p` | `N(1 + √p) = 1 − p`, `1 + Tr = 1` | Holds |
| §9.3 (sampled, headline) | `p = 5`, `s = 0`, `ℓ_H(x) = 25` | both routes `[30]x`, logarithm `750`; labels `1 → 0`: `−750` on both sides, `+750` without the correction | Holds |

### Sources: the seeded sample

Seven texts were read in the sources cache. LT65 is settled as uncertified and was not requested.

| Target | Locator checked | Result |
|---|---|---|
| 1.2, 1.4 | LT65 Lemma 1; Theorem 1, equations (8)–(11) | Not read (uncertified). Statements checked by the computations above |
| 2.1 | VZ07 Definition 2.2, p.60 (VZ07 line 2833), Lemma 2.4, p.60–61; Y95 §3, p.295 (Y95 line 116) | Supports the statement |
| 3.2 | VZ07 Theorem 1.4 and proof, pp.58–59 (VZ07 lines 2739–2793); Lemma 2.4 (line 2844) for the `[π]` generator | As stated |
| 3.5 | VZ07 Corollary 3.4, pp.63–64; Lemma 3.5, p.64; Proposition 3.6, p.65 (lines 2951–3012); LT66 Proposition 2.6, pp.54–55 (LT66 line 214) | As stated; VZ07 works over a separably closed field, LT66 over any field of characteristic `p`, and the README says where it goes further |
| 3.6 | LT66 Theorem 3.1, pp.56–57 (line 284); Proposition 3.3, pp.57–58 (line 331); VZ07 Theorem 3.8, p.65 (line 3021); Y95 §2, pp.294–295 (lines 84–98) | As stated |
| 4.4 | H70 Theorem 9, pp.240–241 (H70 lines 1100–1124); Lemma 4.2, p.231 (line 738); H68 Corollary 4, p.212 (H68 line 497); BKO21 Lemma 5.1, p.956 | As stated; the BKO21 sign is the misprint the README corrects |
| 6.5 | G86 §5 and Proposition 5.3, pp.324–325 (G86 lines 180–212); Y95 Proposition 4, p.300 (line 305) | As stated |
| 7.1 | G86 Proposition 5.3(2), p.325 (lines 205–209); Y95 Theorem 1, p.297 (line 212) | As stated |
| 7.2 | G86 Proposition 5.3(3) and proof, pp.325–326 (lines 210–233); Y95 Theorem 2′, p.301, the `n = 2` case and the canonical Newton polygon, p.302 (lines 350–376) | As stated |
| 7.3 | BKO21 §5.0.2, pp.958–959 (lines 712–740) | As stated |
| 7.5 | G86 §5, p.325; Y95 §§3–4, pp.295–298 | Supports the endomorphism ring; the boundary example itself is the README's own computation, checked above |
| 7.6 | BKO21 §5.0.1, p.955, and the proof of Theorem 5.5(ii), p.959 | As stated, after the misprints listed below |
| 8.3 | BKO21 §2, pp.947–948 (lines 227–252) | As stated |
| 9.3 | BKO21 footnote 2, p.948; Definition 5.4, p.959 | As stated |

Also checked outside the sample: H70 condition (F), p.220, and the well-definedness remark, p.221
(H70 lines 305–329); H70 Theorems 2–4, Lemma 3.4 and Proposition 3.5 (lines 431, 482, 607, 627,
668); Y95 §4 unit action and Propositions 1–2 (lines 155–211); VZ07 §3 (3.1)–(3.7), p.62. One
locator is wrong: R03. All eight cited works are in `sources.toml`, one key each.

### Lean

- **Elaboration.** `lake env lean` on `packages/LubinTateFormalModulesAndQuasiCanonicalLifts/Suggested.lean`
  from the content checkout: exit 0; the only diagnostics are five `declaration uses 'sorry'`
  warnings (lines 77, 91, 113, 129, 151). No module needed building.
- **Signatures.** A scratch copy with `#check @name` for the seven declarations: both predicates
  keep `CommRing`, `IsLocalRing`; the construction theorems keep `IsDomain`,
  `IsDiscreteValuationRing`, the finite residue field, `Irreducible π`; the field theorems keep
  `IsNonarchimedeanLocalField`, `CharZero K`, `1 ≤ m`, `↑ϖ = ↑π`; the elliptic theorem keeps
  `s = 1 ∨ s = −1`, `IsUnit W.Δ` and the point count. They match the README. Nothing changed.
- **Padding probe.** All five sorried theorems tried with
  `first | rfl | (simp; done) | infer_instance | trivial | (simp_all; done) | (aesop; done)`:
  none closes (five errors, one per theorem). None restates a definition or mirrors a Check.
- **Headlines.** The six end theorems of the Summary: Lubin–Tate existence and uniqueness, the
  degree and norm group of the division fields, and the supersingular elliptic structure are
  stated (five theorems, two predicates); representability of marked deformations, the
  classification and fields of moduli of quasi-canonical lifts and the trace-compatible square are
  named in the module docstring with the missing carrier. None is forced through a stand-in.
- **Own names.** The seven backticked names the README attributes to this roadmap are the seven
  declarations. `roadmaps grep --lean-only` finds none of them in another roadmap.
- **Form.** `module`, `import Mathlib`, three used `TauCeti.*` modules; no `set_option`, no
  sorry'd data, no `example`, `theorem` only.

### Pinned libraries

Every Mathlib and Tau Ceti declaration the README cites was resolved at the pins: 60 names by
`#check` in one scratch file, and eight in modules without object files by reading the source
(`RingTheory/FormalGroup/Logarithm/Convergence.lean:44, 57, 62, 68`,
`…/Exponential/Padic.lean:76`, `…/Rigidity.lean:186, 229`,
`AlgebraicGeometry/FormalScheme/Spf/Carrier.lean:92`). All exist. Read for content:
`FormalGroup.Point F σ` is `{f // PowerSeries.HasSubst f}`; `FormalGroup` has fields
`toPowerSeries`, `zero_constantCoeff`, `lin_coeff_X`, `lin_coeff_Y`, `assoc` (no commutativity);
`TauCeti.unitFiltration` (`NumberTheory/LocalField/UnitFiltration/Basic.lean:104`) is the image of
`O^×` at depth 0; the exponential disc is `‖t‖ < p^(−1/(p−1))`. A search of both pins for
"Lubin" finds only the rigidity theorem and the cyclotomic `ℚ_p` case of §2.5, a special case with
the same inverse-unit convention: no duplication.

### Ownership, suppliers and the merge order

- Resolved at their current heads: RelativeFarguesFontaine §2.5 (finite torsion fields, scalar
  action "not its inverse"); GrossZagierAndArithmeticHeights §7.2 (orbit sizes `q^(s−1)(q+1)`,
  `q^s`, level 0 one lift); EndoscopicTransferAndUnitaryTraceComparison §§10.2, 12.3;
  FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.1.1, R07.1.8, R07.1.12, R07.1.13, R07.1.20,
  R07.1.20a, R07.2.6–R07.2.8 and the twelve cited names. On main: BordismFormalGroups §§F1, F5;
  ModularCurves §§0B, 0C, 2B, 7C–7F; EllipticCurves; ClassFieldTheory Layers 6–8 and its map of the
  former §2.6 to Conventions C.6; LocalFieldsRamification;
  RamificationOfCompleteDiscretelyValuedFields §4a.3.
- The five "found nowhere" leads are planned names of
  FiniteFlatGroupsAndIntegralPadicHodgeTheory, present at its head.
- RelativeFarguesFontaine §0.14 and VectorBundlesAndIsocrystals Layer 5 use a given Lubin–Tate
  module; neither constructs it by interpolation. This roadmap owns that construction.
- Consumers (AnticyclotomicLocalUnits, RelativeFarguesFontainePartII,
  ComplexMultiplicationAndExplicitReciprocityPartII) cite this roadmap as "LT.k"; the number is the
  layer number, and the earlier repair report settled it as not actionable here. FunctionFieldArithmetic
  cites §§0.1–0.2, 1.1–1.4, 2.1–2.5, which exist. NonordinaryCMSpecialValues is in the merge order
  and on the board. AnticyclotomicLocalUnits' gap `formal-point-completion-realization` is §0.4.
- Equal-characteristic torsion and reciprocity are FunctionFieldArithmetic §4.1's by design; the
  `CharZero` binders match that split.
- No gap is declared and none is needed. No overlap fact is listed for this roadmap.

Dependency check, exact output:

```text
depcheck: 208 roadmaps, 1901 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line.

Overlap check: read AnticyclotomicLocalUnits, FiniteFlatGroupsAndIntegralPadicHodgeTheory, FunctionFieldArithmetic, EllipticCurveModularityWild3Adic, BordismFormalGroups; the main-vocabulary and named-results lists are empty. Formal `O`-modules, the Lubin–Tate construction, quasi-canonical fields, the towers and formal traces: this roadmap (the first and third import them); formal Lie groups, `p`-divisible groups, schematic closure, quotients: FiniteFlatGroupsAndIntegralPadicHodgeTheory; formal-group algebra and the perfect-field deformation ring: BordismFormalGroups; nothing shared with EllipticCurveModularityWild3Adic.

### Shape, policy and source independence

Fifty targets in ten layers, each ending with Examples and Dependencies; every definition has its
API and at least three Checks; every theorem a locator. No LaTeX delimiters, pull-request numbers,
dates, machine paths or process words. No route-specific restriction (`p ≥ 5` only in the BKO
layers), no algorithm, no re-planned roadmap.

Arrangement: Y95 has the largest share. Its sections are notation, liftings, the isogeny
construction, quasi-canonical liftings, numerical invariants, Newton polygons, valuation functions,
special subgroups, two proof sections and explicit parametrizations. Only Layers 5 and 6 meet its
§§3–4, in an order their `*Needs:*` lines force (§6.2 needs §5.2); Layers 0–4 and 7–9 have no
counterpart there and its §§5–11 have no layer.

Source independence: 16 passages compared with 7 sources, none shared; largest share Y95, 23 of 90 locators; contents compared with Y95: independent. LT65 could not be read.

## Not verifiable

- **LT65** is paywalled and settled as uncertified: its locators (sampled §§1.2, 1.4, and
  §§0.2, 1.1, 1.3, 2.2–2.6, 8.1, 8.2, 9.1) were not checked against the text.
- **Board packages.** The three packages of the board index (AnalyticNumberTheory,
  LawrenceVenkateshMethod, LogicAndDefinabilityInNumberTheory) live on other branches; their
  READMEs were not read. Their subjects do not meet this roadmap's.
- Elaboration checks the five signatures, not their proofs.

## Source issues

- **Misprint** in BKO21 at Lemma 5.1(ii), printed p.956: the source says trace `±2p` gives Honda type `±x² + p` and Lubin–Tate parameter `∓p`; it should be type `p ∓ T²` and parameter `±p`, as its proof (`φ_q = ±p`) shows; affects a stated result.
- **Misprint** in BKO21 at the proof of Theorem 5.5(ii), printed p.959: the source says the outward lattices are generated by `(1 + ap^s)/p^(s+1)` times `t`, one lattice for all `a`; it should be `p^(−s−1)t + (a/p)αt` with `α` generating `O` over `ℤ_p`; affects the proof.
- **Misprint** in BKO21 at the proof of Theorem 5.5(ii), printed p.959: the source says each outward lattice is a conjugate of `x_s`; it should be a conjugate of `x_(s+1)`; affects the proof.
- **Misprint** in BKO21 at §2, printed p.948: the source says `Ψ_∞` is the maximal dihedral pro-`p` extension of `ℚ_p` in `Φ_∞`; it should be pro-`p` over `Φ` and dihedral over `ℚ_p`; affects nothing.

## For the human reviewers

- **Not tested.** LT65 (`sources.toml`, uncertified) carries 15 of the 90 locators and all of Layer 1; wording and locators were not compared with its text.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "82a7310b57b675e62abeeb16e66d87bb20295c8a", "job": "REV-PKG-LubinTateFormalModulesAndQuasiCanonicalLifts~7", "model": "fable", "worker": "chris-x25"} -->
