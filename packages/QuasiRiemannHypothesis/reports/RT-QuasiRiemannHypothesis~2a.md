<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/18800#issuecomment-6941537847 -->
Red team round 2 pass a (claude) of 9c220cb

Verdict: needs_changes

**Source independence:** 9 passages compared with 5 sources by reading, and the README and Lean file (bibliography excluded) scanned for shared runs of eight words against 10 source texts, none shared beyond formula strings, the title of the main source and two phrases the mathematics forces (the longest, 10 words: "a primitive `n`-th order Hecke character of trivial infinite type", `bgl2014`); largest share `openai2026quasiRH`, 64 of 161 locators; contents compared with `openai2026quasiRH` (its contents, lines 14–82): independent.

**Research link:** The headline is Theorem 3.1 of OpenAI 2026, with a second account in Liu 2026. Layers 6 and 8 are the large sieves of Heath-Brown 2000 and Blomer–Goldmakher–Louvel 2014 and the cubic theta function of Patterson 1977, used by Dunn–Radziwiłł 2024; §11.2 extends Lamzouri–Li–Soundararajan 2015. Basis: the README's sources, which I read.

**For the human reviewers:** this review raises 5 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) Conventions cite §4.4 for the self-dual measure; it is §3.5

   Location: `packages/QuasiRiemannHypothesis/README.md:191-192`: "The measure `dμ = (2/√3) dx dy`
   makes `𝓞` self-dual for `(x, y) ↦ e(xy)`, with covolume `1` (§4.4)."

   Claim: §4.4 establishes self-duality and covolume one.

   Witness: `README.md:799-800` (§3.5) proves both; §4.4 (`README.md:914`) defines `Γ(c)` and itself
   cites §3.5 for Poisson summation (`README.md:922`).

   Repair: replace "(§4.4)" by "(§3.5)". Tested: the §3.5 Check gives `(2/√3)(√3/2) = 1`.

2. **F02** (P3) §6.2 states a target about the characters of §6.3, which needs §6.2

   Location: `README.md:1260`: "The Fisher–Friedberg characters of §6.3 form an `n`-th order Hecke
   family." and `README.md:1324`: "*Needs:* §§2.1, 6.2."

   Claim: the sections of Layer 6 build in order.

   Witness: the bullet at 1260 is a target of §6.2 about objects defined in §6.3, and §6.3 needs
   §6.2: a cycle between the two sections. §6.2's `*Needs:*` line (1293–1295) does not list §6.3.

   Repair: delete the bullet at 1260 and add to the bullets of §6.3, after `README.md:1312`:

   > - The `χ_𝔞` at squarefree `𝔞` prime to `S` form an `n`-th order Hecke family with respect to `𝔠`
   >   (§6.2), with `G = R_𝔠`: the reciprocity law is the last clause of the second bullet, and the
   >   primitivity axiom is `bgl2014` Lemma 2.3 (`goldmakherlouvel2013` §2).

   Tested: after the move §6.2 uses nothing of §6.3 (its Check at 1274 cites the source's family
   only), §6.3 needs §§2.1, 6.2 and §6.4 needs §§6.2–6.3.

3. **F03** (P3) §10.6: the constant `46` cannot be recomputed, and `E*` already names another number

   Location: `README.md:2196-2197`: "the common loss `E* = 10⁻⁶`, the central losses are at most
   `46E* < m₀/4`".

   Claim: every numerical constant of Layer 10 is a closed-form inequality stated with its target
   (`README.md:35`).

   Witness: §10.5 gives the losses `(16 − 6l_y)ε + (1 + d)ε_c + dε_d + ε_p`; with every parameter
   `10⁻⁶` that is at most `13 + 1.501 + 0.501 + 1 = 16.002`, not `46`. `openai2026quasiRH` lines
   3751–3754 use `ε_c ≤ 15E*`. `E*` is `min(β* − σ₀ − ω, σ)` at `README.md:506`.

   Repair: replace the sentence that starts "With `m₀ = 1/1200`" by:

   > With `m₀ = 1/1200`, the least of the five, take `ε`, `ε_d`, `ε_p` and the loss of summing the
   > `O(log Z)` dyads all at most `ϵ₀ = 10⁻⁶`; the row count of §10.4 then has `ε_c ≤ 15ϵ₀`
   > (`openai2026quasiRH` proof of Proposition 11.2, p. 83). Since `d < 1` and `16 − 6l_y = 13`, the
   > losses of §10.5 on the shifted contours are at most `13ϵ₀ + 2 · 15ϵ₀ + 3ϵ₀ = 46ϵ₀ < m₀/4`, every
   > piece keeps at least `3m₀/4 = 1/1600`, and §1.4 with `m = 1/2400` gives `m/2 = 1/4800`.

   and write `46ϵ₀` in the first Check. Tested: `13 + 30 + 3 = 46`; `46 · 10⁻⁶ = 4.6 · 10⁻⁵ < 2.08 · 10⁻⁴`.

4. **F04** (P3) the lists of what is not owned use the main source's names without a definition

   Location: `README.md:138-141`: "the compensated probe and its two moment inductions … finite
   correlations … masked primitive Poisson summation … the quadratic–cubic norm estimate";
   `README.md:2380`: "by the compensated probe".

   Claim: every term is standard or defined in the roadmap.

   Witness: none of the five is defined in the README; `openai2026quasiRH` lines 57, 58, 65 and 79
   are its section titles "The compensated probe", "… finite correlations", "A quadratic-cubic norm
   estimate", "Finite Poisson summation with a mask".

   Repair: replace `README.md:138-143` by:

   > - The `7/8` half-plane: the second stage of `openai2026quasiRH` (its Part II, Sections 12–20)
   >   with the auxiliary results proved there (Lemmas 13.2–13.4, 14.2 and 17.5), the strip
   >   `1/8 ≤ Re ρ ≤ 7/8` and the Landau–Siegel constant `(log 3)/8`: QuasiRiemannHypothesisPartII,
   >   which takes Layers 1–10 here as its base.

   and at `README.md:2380` write "the `7/8` half-plane by the second-stage argument of
   `openai2026quasiRH` Sections 12–20". The locators are unchanged.

5. **F05** (P3) a Check of §1.1 tests the point `s = 1`, which is outside `Re s > 1`

   Location: `README.md:452-453`: "`riemannZeta` is zero-free right of `1`:
   `riemannZeta_ne_zero_of_one_le_re` off `s = 1`, and order `−1` at `s = 1`, where Mathlib's value
   is junk."

   Claim: the order at `s = 1` enters the statement.

   Witness: `ZeroFreeRightOf 1 f` quantifies over `1 < Re s` (`Suggested.lean:68`); `s = 1` has
   `Re s = 1`. §10.7 (`README.md:2218`) relies on that value being nonzero.

   Repair: "`riemannZeta` is zero-free right of `1`: it is analytic and nonzero on `Re s > 1`
   (`riemannZeta_ne_zero_of_one_le_re`). The point `s = 1`, where its order is `−1`, lies outside
   this half-plane and enters only for `σ < 1` (§10.7)." Tested: `ζ(2) = π²/6`, order `0` at `2`.

Five findings, all P3 (S01–S05). No statement of `Suggested.lean` and no bold README target was
refuted on any instance tried. All twelve findings of round 1 are repaired at this head, and no
repair introduced an error.

Source independence: 9 passages compared with 5 sources by reading, and the README and Lean file (bibliography excluded) scanned for shared runs of eight words against 10 source texts, none shared beyond formula strings, the title of the main source and two phrases the mathematics forces (the longest, 10 words: "a primitive `n`-th order Hecke character of trivial infinite type", `bgl2014`); largest share `openai2026quasiRH`, 64 of 161 locators; contents compared with `openai2026quasiRH` (its contents, lines 14–82): independent.

Research link: The headline is Theorem 3.1 of OpenAI 2026, with a second account in Liu 2026. Layers 6 and 8 are the large sieves of Heath-Brown 2000 and Blomer–Goldmakher–Louvel 2014 and the cubic theta function of Patterson 1977, used by Dunn–Radziwiłł 2024; §11.2 extends Lamzouri–Li–Soundararajan 2015. Basis: the README's sources, which I read.

## Round 1 findings at this head

| Finding | Status | Witness at 9c220cb |
| --- | --- | --- |
| 1a/F01 orthogonality lemma | repaired | `README.md:256` cites `CommGroup.sum_inv_mul_monoidHom_apply_eq_ite`; pin `GroupTheory/FiniteAbelian/CharacterOrthogonality.lean:184` states `∑ χ, (χ σ)⁻¹ χ g = if g = σ then card G else 0`. `sum_smul_rayClassCoeff` no longer occurs. |
| 1a/F02 slot of the pairing | repaired | `README.md:1219`: "`e^(2πi B(z_j, m))` … the dual lattice pairing in the second slot". Check at 1235–1238 recomputed: `B(e₁, m) = 1/2 + 1/2 = 1`, `B(e₂, m) = 1`, `B(m, e₂) = 1/4 + 1 = 5/4`. |
| 1a/F03 `X(K)` | repaired | `README.md:1112-1114`: "the primitive characters `χ'*` inducing the Dirichlet characters `χ'` modulo `f_K` that are trivial on `H_K`". AnalyticNumberTheoryPartI §2.42 (main, README line 2070) states the same set. `ℚ(√5)`: `{1, 9}` mod `10`, `{±1}` mod `5`, both give `{1, (·/5)}`. |
| 1a/F04 strip for any `K` | repaired | `README.md:2259-2260`: "the primitive finite-order Hecke characters of any number field `K`". `ℚ(√2)`: order of `ζ_K` at `0` is `r₁ + r₂ − 1 = 1`, real part `0`, excluded. |
| 1a/F05 undefined terms | repaired | "finite-ray", "deleted radicals", "masks", "tail order", "primary phases", "unmarked" have no occurrence in the layers (grep). Two of the source's names remain in the lists of what is not owned: S04. |
| 1a/F06 `*Needs:*` lines | repaired | `README.md:1886-1887`, `1906-1907`, `2176-2179` give one clause per target. |
| 1a/F07, 1b/F02 source titles | repaired | The headings of §§3.1, 3.2, 3.4, 4.4, 5.1, 7.2–7.4, 9.2–9.4, 10.2, 10.5 (five labels), 10.6 were set beside `openai2026quasiRH` lines 14–55: no title of three or more words is shared. |
| 1b/F01 wording of §6.2 | repaired | `README.md:1244-1251` against `goldmakherlouvel2013` lines 45–59: the clause order differs, the axioms are named, the longest shared runs are "be a number field containing" and the name "`n`-th order Hecke family with respect to". Checks still give conductors `21` and `60`. |
| 1b/F03 `s ≠ 1` | repaired | `Suggested.lean:110`: `{s : ℂ} (hs : 11 / 12 < s.re) : riemannZeta s ≠ 0`. Pin: `riemannZeta_one_ne_zero`, `NumberTheory/Harmonic/ZetaAsymp.lean:443`; value `(0.5772 − 2.5310)/2 = −0.977`. |
| 1b/F04 Example of Layer 6 | repaired | `README.md:1377-1381`: "neither statement implies the other"; `D^(1+ε)` against `D^(4/3+ε)` at `K = D`. |
| 1b/F05 Baier–Bansal | repaired | `README.md:1222-1223`: "for `Λ = ℤ^d` with the dot product … used there at `d = 2`"; `baierbansal2018` lines 190–197. |

## Dependency check

```text
depcheck: 261 roadmaps, 2607 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. The roadmap is at line 296 of the merge order; its last
suppliers are AnalyticNumberTheoryPartIII (295) and ExplicitZetaBounds (289).

## Verified sound

Counts: 11 declarations read (all of `Suggested.lean`, 183 lines); 55 targets read (the whole
README, 2442 lines); 20 locators verified against the texts in this pass (`milnecft2020` 6,
`goldmakherlouvel2013` 3, `baierbansal2018` 1, `kubota1969` 2, `openai2026quasiRH` 8); about 100
Checks and worked values recomputed (the tables below); 52 sibling sections resolved to a heading on main, at an open head or in the
board's packages (7 read in full: AnalyticNumberTheoryPartI §2.42, AnalyticNumberTheoryPartII
§5.29, ExplicitZetaBounds §3.2, ThetaSeries 1A, SieveMethodsAndPrimePatterns §2.9,
CharacterSumsOverFiniteFields §3.4, AutomorphicFormsOnReductiveGroups §4.5); 71 pinned
declaration names grepped (27 Mathlib, 44 Tau Ceti), all present with the cited namespaces.

Elaborated signatures: I ran no Lean. The 11 types of the worker's `#check @name` file were
compared one by one with the README statements; no binder is lost and nothing changed.

### `Suggested.lean`

| Declaration (layer; context) | Instances and values | Result |
| --- | --- | --- |
| `ZeroFreeRightOf` (1; none) | `s − 2`: order `1` at `2`, false at `σ = 3/2`, true at `2`. `0`: order `⊤`, never true. `1/(s − 1)`: `−1`, true. `s̄`: junk `0`, true | as §1.1 |
| `zeroFreeRightOf_LFunction_of_isAbelianGalois` (5; `K`, `[IsAbelianGalois ℚ K]`, `0 ≤ σ₀`) | `K = ℚ`: `X = {1}`, tautology on primitive characters. `K = F`, `χ = χ₋₃`: cofactor has order `−1` at `1`, `L(1, χ₋₃) = π/(3√3) = 0.6046`. `χ₀ mod 4`: zeros of `1 − 2^(−s)` on `Re s = 0 ≤ σ₀`. `σ₀ < 1/2`: hypothesis false | true as typed |
| `zeroFreeRightOf_heckeLFunctionC` (10; `F`, `[IsCyclotomicExtension {3} ℚ F]`) | trivial `χ` of `(2)`: `ζ_F(s)(1 − 4^(−s))`, order `−1` at `1`; junk `0` would fail | rests on the sources |
| `zeroFreeRightOf_LFunction` (10) | `N = 1`: `ζ`; `χ₀ mod 4`: order `−1` at `1` | follows from the two above at `K = F`, `σ₀ = 11/12`; kept as the headline |
| `riemannZeta_ne_zero_of_eleven_twelfths_lt_re` | `s = 1`: `−0.977`; `s = 2`: `1.645` | true on the whole half-plane |
| `re_mem_Icc_of_LFunction_eq_zero` (11) | `N = 1`, `ρ = 1`: value `−0.977`, hypothesis false. `0 < Re ρ < 1/12`: `1 − ρ̄` is a zero of `L(·, χ̄)` with real part `> 11/12`; `Γ_ℝ(s + a)` finite and nonzero on `0 < Re s < 1` | true given §10.7 |
| `re_mem_Icc_of_heckeLFunctionC` | trivial `ψ`: order `−1` at `1`; `ζ_F(0) = −1/6` | true given §10.7 |
| `exists_ne_zero_ne_one_le_log_rpow` | `q = 2`: no `χ ≠ 1`. `q = 3`: `n = 2`, `log 3 = 1.0986`. `q = 3∏_{p ≤ y} p`: primes dividing `q` cost `Σ_{p ∣ q} log p ≤ log q` on the prime side, least `n ≤ 2y`, bound `≍ y^(1/(1−θ)) ≥ y²` | true |
| `exists_prime_ne_zero_ne_one_le_log_rpow` | `N𝔪₀ = 1`: `2^(1/(1−θ)) > 0`, finitely many `𝔪`. `ℚ(i)`, `(3)`: `η((1 + i)) = (2/3) = −1`. Pin: `toMultiplicativeIdealWeight` is `0` off `𝔪.support` | true |
| `exists_jacobiSym_eq_neg_one_le_log_pow` | `1/(1 − 11/12) = 12`; `p = 3`: `n = 2`, `(log 3)^12 = 3.09`; `p = 7`: `n = 3` | true given §§10.7, 11.2 |
| `exists_jacobiSym_eq_neg_one_le_rpow` | `(log p)^12 ≪_δ p^δ` | true given the previous |

Headline theorems of the README Summary: the `11/12` half-plane (stated, three forms), the zero
strip (two forms), the conditional bound for the least character value (two forms), the least
nonresidue and Vinogradov's conjecture, the transfer. All are stated; the module docstring names
Layers 8 and 9 as not statable with the missing carriers (no hyperbolic 3-space and no `K`-Bessel
function at the pins). No padding: no declaration follows from the pinned libraries in one step
or mirrors a Check.

### README (values computed in this pass)

| Statement | Instances and values | Result |
| --- | --- | --- |
| §1.2 | `{s − 3/4}`: `3/4`; `{s − 1/4}`: `1/2`; `{0}`: `sSup` junk `0`, excluded; `{s − 2}`: `2` | holds |
| §1.3 | `C(σ₀) + ω = C(β*) − (β* − σ₀ − ω)`; `β* − E* ≥ σ₀ + ω`; `|e^((7/6 + it)²)| = e^(49/36 − t²)` | route closes |
| §1.4 | `(1 + Z^τ)^A ≤ 2^A Z^(m/4)`, total `Z^(C(β*) − 3m/4)` | holds |
| §2.1 | `(−1/3) = −1` needs `∞`; `(5/3) = −1 = (3/5)`; `(−1)^((7−1)/6) = −1` | holds |
| §§2.2–2.3 | `ω ↦ 2` in `𝔽₇`; values `1, ω, ω², −1, −ω, −ω²` at `1, 2, 4, 6, 5, 3` | holds |
| §2.5 | `1 − λ² + λ³ = 1 − 6ω ≡ 1 + 3ω (mod 9)`; `(ω/d)₃ = ω²`; `(λ/d)₃ ≡ 5² = 4 = ω²`; `12⁶ ≡ 1 (mod 19)`. Pin `cubic_reciprocity_intCast` allows composite `A`, so the route is not circular | holds |
| §3.2 joint bound | `(1 + |T| + |u| + |w|) ≤ (1 + |T + u|)(1 + 2|u|)(1 + |w|)`, `(1 + |u|)^(−N) ≤ (1 + |T + u|)^N (1 + |T|)^(−N)` | holds |
| §§3.3–3.5 | `∫ (2√π)⁻¹ e^(−u²/4 + su) du = e^(s²)`; `K_W = W(1/x)`, `(y∂_y W)(1/x)`; `e(ω) = 1`, `e(ω/2) = −1`; `2` ideals against `1.81` | holds |
| §§4.1–4.3 | `conj g_j = χ(−1)^j g_(−j)`; `g(15) = (3/5)(5/3) · i√3 · √5 = i√15`; `γ_1γ_2 = −α ω i = −0.6547 + 0.7559i` | holds |
| §4.4 | closed form at `1, −1, λ, −λ, −3, 1 + 3ω, 4 + 3ω`: `1, 1, i, −i, 1, i, 1`; four-term sum at `c = λ`: `1 − 1 + i + i = 2i` | holds |
| §§4.5–4.6 | `χ_b(a) = 3³ = 8 = −ω²` in `𝔽₁₉`, `χ_a(b) = 4 = ω²`; `aω ≡ λ`, `bω² ≡ λ (mod 4)`; `τ(n, n) = (−1)^f`; `Σ |a_θ| ≤ |T|^(1/2) max |Φ|` by Cauchy–Schwarz | holds |
| §5.2 | `ℒ(−1/10) = 0.5099`; `x ≤ N (3 + |t|)^d`; `3 · 10.5844 · 1.9332 = 61.385` | holds; matches ExplicitZetaBounds §3.2 |
| §§5.4–5.5 | `χ(9) = χ(4) = −1`; `N(1 + 3√2) = −17`, `χ(17) = −1`; `∏_ψ (1 − χψ(p) p^(−s)) = (1 − χ(p)^f p^(−fs))^g` | holds |
| §6.1 | `N²` against `(Q + N) N`; `5/4` | holds |
| §§6.3, 6.5 | `(1 + λ²x)³ ≡ 1 − λ⁴x (mod λ⁵)`; `10² ≡ 2 (mod 7)`; `(MN)^(2/3) > M + N` up to `2` iff `M^(1/2) < N < M²` | holds |
| §§7.1–7.3 | `Σ μ(n) n^(iv − s) = ζ(s − iv)⁻¹`; `M_I > a₀ + 1 + ε`; `(3i + 2)T₁ + 2 ≤ 3(i + 1)T₁`; exponents `δr + ε'/2`, `δ(1 − m) + 3ε'/4`, `9^C U^(ε'/10)` | holds |
| §8.1 | determinant `1 − 9ω² + 9ω² = 1`; `(c/a)₃ = 2 = ω`, `(b/d)₃ = 4⁴ = 9 = ω`, `(c/d)₃ = 3⁴ = 3 = ω²` in `𝔽₁₃`; second matrix `ω`, `ω²`; `4v(n) ≥ 2v(n) + 1`. `kubota1969` lines 652–653: `n² ∣ N`, `GL(2, 𝔬)` | holds |
| §§8.3–8.5 | `φ(1) = π(−1/4)/(π/4) = −1`; `648/24 = 27`; `324/27 = 12`. `kubota1969` lines 1364–1367 carry both hypotheses on `N` | holds |
| §8.7 | `3^(n/2 + 2) ≤ 3^(n/2 + 7/3)`; `3^(n/2 + 5/2)` attained at `k = 3n − 3`; `g̃³ = 0.1890 − 0.9820i` | holds |
| §§9.1–9.2 | exponents of `T(t + 1/2)`: `q_c^(−1/2 − t)`, `q_n^(−1 − 3t)`; `B_p` at `j_p = 4`: `−q_p^(−1/2)`, `q_p^(1/2)(1 − q_p⁻¹)`; `√π e^(1/16) = 1.887` | holds |
| §10.2 | `Q^(−1/2) (Z^(1/2))^(1/2) Z^(1/2 + ε/2) = Z^(1/4 + ε/2)` | holds |
| §10.4 | `R(1/50) = 1`, `R(2/3) = 2/3`, `R(1) = 1/2` | holds |
| §§10.5–10.6 | `C(s) = s − 2/3`; slope `R + δ/2 − 17/50 ∈ [33/50, 62/75]`; at `d = h`: `E + σ₀ = 1/6 + δ/2 + R/2 ≤ β* − 1/24` iff `β* ≥ 11/12` at `a = β*`; `−43/300`; `7/4 + 0.501 − 4 = −1.749`; `5T₁/24`, `2T₁/3` | holds; `46`: S03 |
| §11.3 | `4/(1 − 2ϵ)`: `48` at `11/24`, `32` at `7/16`, infima `24`, `16` | holds |

Each definition has at least three Checks that separate it from a wrong model. Every target has a
locator. Policy: the pull request changes only `packages/QuasiRiemannHypothesis/`; the README and
the Lean file contain no pull-request number, process word, `lemma`, `set_option`, `#eval`,
machine path or algorithm. `plan.json` has `"gaps": []` and the README declares none.

Ownership: `overlaps.md` lists no second copy, no dropped id and no close roadmap by results. The
closest roadmaps by vocabulary (ExplicitNumberFields, ExplicitMultiplicativeFunctions,
ZerosOfLFunctions, LFunctions) are cited as suppliers or named as downstream; none states the
`11/12` half-plane, the Kubota character, the cubic theta function or the large sieves of Layer 6.
The one unresolved name of `citations.md`, `SieveApplications.leastNonresidue`, is a target of
SieveMethodsAndPrimePatterns §2.9 (main, README line 2457) and is cited as such. No roadmap of
the never-cite list is cited.

## Not verifiable

- The proof of the `11/12` half-plane (§§9.2–9.4, 10.2–10.6): the exponents and constants were
  recomputed; the analytic estimates were not proved again.
- Conjugation bars and the displays of `patterson1977` (7.1)–(7.5), (8.1)–(8.9) and of
  `openai2026quasiRH` Proposition 5.1 and Lemma 7.1: the cached texts are OCR. The README's
  conjugates were tested numerically at `1 + 3ω`.
- `kubota1968` (12)–(29): German OCR, formulas not compared; §8.3 was tested on `SL₂(ℤ[i])`.
- `ε_c ≤ 15ϵ₀` in the repair of S03 is quoted from `openai2026quasiRH` line 3751; I did not derive
  the `15`.
- "At `k = ℚ` §6.2 is implied by AnalyticNumberTheoryPartII §5.29" (`README.md:1290`): needs a
  bound for the conductors of an abstract family; not checked.
- Forty-five of the 52 sibling sections were resolved to their headings only.

## Source issues

- **Error** in goldmakherlouvel2013 at Remark 3 and Corollary 1.2, printed page 2: the source says the `n/d`-th powers of every `n`-th order Hecke family form a `d`-th order family; it should assume the primitivity axiom for the powers (a quadratic family read as fourth-order has trivial squares); affects a stated result.

## For the human reviewers

- **Scope.** The headline (`11/12` half-plane) is stated only in unrefereed 2026 preprints: `openai2026quasiRH`, `openai2026quasiRHalt` (author "OpenAI", a GitHub repository) and `liu2026improved` (`packages/QuasiRiemannHypothesis/README.md:32-34`).
- **Scope.** QuasiRiemannHypothesisPartII, named as owner of the `7/8` half-plane (`README.md:142`, `2380`), exists neither on main nor among the open pull requests.
- **Licence.** `sources.toml` records the two OpenAI preprints as fetched from the public repository `openai/math`; I did not find a stated licence for them.
- **Licence.** `liu2026improved` says its result is formalised in Lean; that formalisation was not read, so `Suggested.lean` was not compared with it.
- **Not tested.** `openai2026quasiRH` is an OCR extraction: contents and prose were compared; displayed formulas only where legible.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "9c220cb2cece55c3a53a79a6c31d3b6a0c03433a", "job": "RT-QuasiRiemannHypothesis~2a", "model": "fable", "worker": "chris-x26"} -->
