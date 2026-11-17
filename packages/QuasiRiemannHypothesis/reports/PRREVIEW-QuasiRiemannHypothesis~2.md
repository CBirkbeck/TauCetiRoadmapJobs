# Review of QuasiRiemannHypothesis (pull request #2468 at 1958ba8)

**Verdict:** accepted

No findings. This head repairs all four findings of the previous review (rows R01–R04 below).

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| Previous R01, §8.1 line 1580: "the `(r(N)/n)`-th power of Kubota's homomorphism `σ ↦ [b/a]` of KTheoryLowDegrees §10.2" | `Γ(9)` Check matrix `a = 10`, `b = −486 − 459ω`, `c = 9 + 27ω`, `d = 802 − 486ω`; level `(9)` | `10d − cb = 1`; `(b/2)₃ = ω`, `(4 + ω)⁸ ≡ ω (mod 5)`, `(b/10)₃ = ω² = (c/d)₃`; `r(9) = 3`; `κ_P = ω` | repaired; each Mennicke step of the route checked | none |
| Previous R02, §5.4 line 1202: "the induction identity of AnalyticNumberTheoryPartI §2.18a for `K/ℚ`" | §2.18a on main; `K = ℚ(√5)` at inert `2`; `K = F` | `Ind Res χ = ⊕_ψ χψ`; `∏_ψ (1 − χψ(2)2^(−s)) = 1 − χ(2)² 4^(−s)`; `F`: `L(χ) L(χχ₋₃)` | repaired | none |
| Previous R03, §9.3 line 1962: "`p_j(F_Y) ≪ … min{Y^(1/4), (1 + Y)^(−A)} p_j(W) 𝓜_{A,⌈4A⌉+j+2}(V)`" | `openai2026quasiRH` Lemma 5.3, (5.22)–(5.23), lines 1525–1536 | indices `⌈4A⌉+j+2`, `⌈4A⌉+J+d+4`, weight `p_{J+d+2}(W)` and `m_A(Y)` identical on both sides | repaired | none |
| Previous R04, §5.2 Check line 1123: "proved in the proof of `openai2026quasiRH` Lemma 4.8, p. 21" | (4.14) line 900; proof line 910 | (4.14): `Q^(3/5)(3 + |t|)²`; proof: `Q^(3/5)(3 + |t|)^(6/5)` on `Re s = −1/10` | repaired | none |
| §3.2 seminorm bounds (Lemma 4.5, (4.9)–(4.12), pp. 17–19) | `d = 1`, `J = 0`; tail at `T₁`; (4.12) at `J = N = 0` | `2m = 2 ≤ J + d + 2 = 3` gives a finite weight; `(1 + |t|)^(−N) ≤ T₁^(−N)` with factor `(2π)^d`; joint bound `√π sup|a| ∫|b|` | holds | none |
| §4.1 Gauss sums modulo an ideal (§4.1, p. 11, line 451) | `K = ℚ`, `n = 2`, `𝔠 = (5)`; `p = 1 + 3ω` | `g₁ = √5`; `γ₆(p) = −0.37796 = −1/√7`; `γ₃(p) = i`, `γ₃² = −1 = χ_p(−1)` | holds | none |
| §4.3 Gauss sums at a prime (Lemma 4.2, p. 13) | `p = 1 + 3ω`, brute force over `𝔽₇` | `γ₂³ = 0.18898 − 0.98198i = −α(p)`; `γ₁γ₂ = −0.65465 + 0.75593i = −α ω i`, while `−α ω² i = −0.3273 − 0.9449i` | holds | none |
| §4.4 `Γ(c)` closed form, `τ` (Lemma 4.3, p. 14) | brute-force `Γ` at `1, λ, 1+3ω, −2+3ω, 4+3ω, −1−2ω, 5+2ω, 3−4ω, 7+ω` | sums `1, i, i, i, 1, −i, i, 1, −i` equal `(1 + i^(−b) + i^a + i^(b−a))/2`; `τ(λ,λ) = τ(−1,λ) = −1`, `τ(−1,−1) = 1` | holds | none |
| §4.6 finite Fourier expansions (§4.2, p. 17) | `p = 1 + 3ω`, `n = −2 + 3ω` | `χ_n(p) = 3³ = 8 ≡ −ω² (mod 19)`, `χ_p(n) = 4 ≡ ω² (mod 7)`; `χ_n(p) conj χ_p(n) = −1 = τ(λ,λ)` | holds | none |
| §5.2 strip growth (Lemma 4.8, p. 21) | `K = ℚ`, `ψ = 1`, `s = −1/10` | `ζ(−0.1) = −0.41723`, `|ℒ| = 0.50995 ≤ 9.8953 ≤ 61.385`; `ζ(1.1) = 10.58445`, `3^(3/5) = 1.93318` | holds | none |
| §6.1 additive large sieve (Lemma 6.1, p. 47; `baierbansal2018` Theorem 3, p. 3) | `d = 1`, `z_j = j/N`, `Q < N`; non-symmetric `B` | left side `N²` against `(Q + N)N`; `B(e₁,m) = B(e₂,m) = 1`, `B(m,e₂) = 5/4` | holds | none |
| §6.2 Hecke families, quadratic sieve (GL Def. 1, Thm 1.1, Cor 1.2; `bgl2014` Lemma 2.3, p. 11) | `k = ℚ`, `(21/·)`, `(15/·)`; quadratic family over `ℚ(i)` read as quartic | conductors `21` and `60`; squares trivial, left side `≫ N³` against `N^(2+ε)` | holds with the stated hypothesis on powers | none |
| §6.3 conjugate in the primitivity axiom | `𝔞 = (−2)`, `𝔟 = (7)`, `𝔠 = (9)` | `v_λ(14 − 5) = 4`; `v_λ(5+1) = 2`, `v_λ(5+ω) = v_λ(5+ω²) = 1`, `5−1, 5−ω, 5−ω²` units | holds | none |
| §7.2 zero-free rectangle by pigeonhole (Lemma 8.1, p. 56) | `I = ⌈1/ε⌉ + 2`; no zero above `a₀` | failure gives `M_I > a₀ + (I−1)ε ≥ a₀ + 1 + ε > 1`; empty case `i = 1`, `a = a₀` | holds | none |
| §§7.3–7.4 polynomial bounds (Lemma 8.2; Prop. 8.3, p. 59) | `ε₀ = ε'/(48 r_max)`, `ε₁ = ε'/8`; floors `51/100`, `1/2 + 10⁻⁶` | `12εr ≤ ε'/4`, `(24 − 12m)ε ≤ ε'/2`; `m − 1/2 < 25C''ε'` against `2.5·10⁵ C''ε'` | holds | none |
| §8.2 automorphic functions on `ℍ³` (`kubota1968` §§2–3, pp. 262–264) | `Δ₃` on `v K_ν(κv) ě(μz)`; `PSL₂(ℤ[i])` at `∞` | ODE `v²h'' + vh' − (κ²v² + (s−1)²)h = 0`, `κ = 4π|μ|`; `s = 4/3` gives `8/9`; dual `(1/2)ℤ[i]` | holds | none |
| §8.3 constant term | `SL₂(ℤ[i])`, `χ = 1`, `|U| = 4` | `φ(1) = π ζ_K(0)/Res ζ_K = π(−1/4)/(π/4) = −1`; factor `1/2` gives `−2` | holds | none |
| §8.5 theta functions as residues (`kubota1969` Thm 6, (45), p. 50; `patterson1977` pp. 126–127, Thm 8.1) | `n = 3`; Patterson's `Γ₁(3)` | pole `4/3`, eigenvalue `8/9`; `[Γ:Γ₁] = 648`, `324/27 = 12` cusps, essential `{∞, 0, ±1}` (line 137) | holds | none |
| §8.6 converse theorem (`patterson1977` (7.1)–(7.4), Thm 7.1) | shifts against lines 901–922; cosets | `(β_(0,±1)) = (ω, −ω)`, `(1, ω)`, `(1, ω²)` as in the source; `λ³/9 = −λ/3 ∉ 𝓞` | holds | none |
| §8.7 cubic theta coefficients | `c = 1 + 3ω`; bound at `k = −3, −4` | `g̃(c) = 0.89595 − 0.44415i`, `g̃³ = 0.18898 − 0.98198i`; `27·3^(−1/2) = 15.588 = 3^(5/2)`; `27·3^(−2/3) = 12.98 < 18` | holds | none |
| §9.1 completed series (§5.1, p. 25; `liu2026improved` (4.1)) | `A = p², p³, p⁴`; `V_G` | `p²` not `cn³`, `p³ = 1·p³`, `p⁴ = p·p³`; `𝓜_{0,0}(V_G) = √π e^(1/16) = 1.8868` | holds | none |
| §9.2 reflection (Prop. 5.1, (5.1)–(5.6), pp. 24–27; `liu2026improved` Prop. 4.1) | kernel lines; `j_p = 4` | gamma-quotient poles `−5/6, −7/6`; `Re t = −1/4` gives `x^(1/4)`; growth `|Im t|^(4A)`; `B_p = −q_p^(−1/2)`, `q_p^(1/2)(1 − q_p⁻¹)` | holds | none |
| §10.4 row count (Prop. 9.2, p. 67; `liu2026improved` (6.2), line 1137) | `δ = 1/50, 1, 2/3` | `R = 1` (`max = 1.3133`), `1/2`, `2/3`; source formula `min{1, max(1−δ/2, 4/3−δ)}` identical | holds | none |
| §§10.5–10.6 closed-form exponents | probe data `l_x = l_y = h = 1/2` | `C(s) = s − 2/3`; `−43/300`; `7/4 + 501/1000 − 4 = −1.749`; `1021/25000`; `4.6·10⁻⁵ < 2.083·10⁻⁴` | holds | none |
| §11.3 least nonresidue (Cor. 1.2, p. 7; `tao2015` Conj. 1.1; `bimsissac2017` Conj. 6.3, Thm 6.7) | `ε = 7/16, 11/24, 5/12`; `p = 7` | `4/(1−2ε) = 32, 48, 24`; source takes `A = 32`; `n(7) = 3` | holds | none |
| `ZeroFreeRightOf` | `s − 2`, `1/(s − 1)`, `0`, `conj` | orders `1` at `2`, `−1` at `1`, `⊤`, junk `0`; predicate false, true, false, true | holds | none |
| `zeroFreeRightOf_LFunction_of_isAbelianGalois` | `σ₀ < 1/2`; `σ₀ = 1`; `K = F`, `χ = χ₋₃` | hypothesis false (`ζ_K(1/2 + 14.1347i) = 0`); conclusion Mathlib's; cofactor principal mod `3`, `L(1,χ₋₃) = 0.6046` | holds | none |
| `zeroFreeRightOf_heckeLFunctionC` | junk `0`; trivial character at `(1)` | order `⊤` fails the predicate; `ζ_F = ζ L(·,χ₋₃)`, order `−1` at `1` | holds | none |
| `zeroFreeRightOf_LFunction`, `riemannZeta_ne_zero_of_eleven_twelfths_lt_re` | principal mod `4`; `s = 1` | zeros of `1 − 2^(−s)` only on `Re s = 0`; Mathlib `ζ(1) = −0.97690 ≠ 0` | holds | none |
| `re_mem_Icc_of_LFunction_eq_zero`, `re_mem_Icc_of_heckeLFunctionC` | `N = 1, 2`; `0 < Re ρ < 1/12` | level `2` has no primitive character; `1 − ρ̄` has real part in `(11/12, 1)`, excluded | holds | none |
| `exists_ne_zero_ne_one_le_log_rpow` | mod `12` from `(·/3)`; `q = 3∏_{p≤y} p`; `θ = 1/2` | value `5` (primitive `2`); least value `≤ 2y` against `C y^(1/(1−θ))`; exponent `2` | holds | none |
| `exists_prime_ne_zero_ne_one_le_log_rpow` | `η = 1` over `F`; `(·/3)∘N` over `ℚ(i)` | trivial `η` meets the hypothesis and fails the conclusion, so `η ≠ 1` is needed; value at `(1+i)` is `−1` | holds | none |
| `exists_jacobiSym_eq_neg_one_le_log_pow`, `…_rpow` | `θ = 11/12`; `p = 3, 7` | `1/(1−θ) = 12`; `n = 2 ≤ 3.09 C`; `n = 3`; `(log p)^12 ≪_δ p^δ` | holds | none |

- Source locators checked against the text this round: 59 in 12 sources (`openai2026quasiRH` 24, `liu2026improved` 10, `goldmakherlouvel2013` 5, `bgl2014` 4, `patterson1977` 4, `kubota1968` 3, `kubota1969` 3, `bimsissac2017` 2, `baierbansal2018`, `maynardpratt2024`, `guthmaynard2026`, `tao2015` 1 each). All are at the stated theorem and page.
- Library declarations at the pins: 93 `#check` (47 Mathlib, 46 Tau Ceti), all present. Read: `Real.besselI` (`TauCeti/Analysis/SpecialFunctions/BesselI.lean:81`), `Complex.besselJ` (`Mathlib/Analysis/SpecialFunctions/Bessel.lean:55`) and `TauCeti` `UpperHalfSpace` (no `SL₂(ℂ)` action, no Laplacian, no `K`-Bessel function), so the docstring's Layer 8 claim holds.
- Cross-roadmap citations resolved: 55 sections, each found with the cited content. On main: LFunctions, ZerosOfLFunctions, ExplicitZetaBounds, ClassicalArithmeticCompletion, KTheoryLowDegrees, ClassFieldTheory, ThetaSeries, SieveMethodsAndPrimePatterns, AnalyticNumberTheoryPartI–III, AutomorphicFormsOnReductiveGroups, GlobalNumberFields. At open heads: CharacterSumsOverFiniteFields, BianchiModularForms, MaassForms, AutomorphicSpectralTheory.
- Gate at this head: every check passes. Dependency check: `depcheck: 253 roadmaps, 2590 edges, 0 problem(s)`. Outside-folder diff: none.
- Elaboration: `lake env lean` on `Suggested.lean` gives 10 `declaration uses 'sorry'` warnings and nothing else. The `#check @name` types of the 11 declarations match the README, with no lost binders.
- Padding probe: all 10 theorems stay open under `simp | rfl | norm_num | infer_instance | positivity | exact?`.
- Supplier remark, no change needed here: KTheoryLowDegrees §10.2 (main, line 1061) writes `[b/a] = [c/d]⁻¹`, but its own §10.1 relations give `[c/d] = [b/a]`, as §8.1 here derives. This README consumes only the first-row value.
- Pull-request text: the summary block and prose match the head, including the KTheoryLowDegrees and §2.18a supplier paragraph.

Overlap check: read ExplicitNumberFields, CongruenceSpectralGap, CharacterSumsOverFiniteFields, BianchiModularForms, ExplicitMultiplicativeFunctions, ZerosOfLFunctions, LFunctions and AnalyticNumberTheoryPartIII (the results/headings list is empty); Rademacher's bound: owner ExplicitZetaBounds §3.2 (ExplicitNumberFields Layer 1 and §5.2 here are instances at different records); duplication formula: owner CharacterSumsOverFiniteFields §3.4; `ℍ³` groups and cusps: owner BianchiModularForms §§0.3–0.4; Kubota's homomorphism and Artin induction: owners KTheoryLowDegrees and AnalyticNumberTheoryPartI §2.18a on main; Eisenstein series with a character on `ℍ³`: owner this roadmap (BianchiModularForms excludes them, MetaplecticAutomorphicForms treats double covers only).

Source independence: 21 passages compared with 12 sources, plus a scan of the README outside References for shared 8-word runs against 18 cached texts. The longest shared prose run is 10 words, a formula phrase in §10.5. Largest share: `openai2026quasiRH`, 67 of 149 locators. Contents compared with `openai2026quasiRH` §§2–11: independent. Layers 6 and 8 have no counterpart there; Layers 3–4 reverse §§4.3/4.2, as §4.4's use of §3.5 forces; Layer 7 (§8) precedes Layer 9 (§5); Layer 10 merges §§6, 7, 9.2, 10 and 11.

Research link: Layer 10's `11/12` half-plane is Theorem 3.1 of the OpenAI 2026 quasi-Riemann preprint, the first stage of its `7/8` theorem, given a second account by Liu (2026). Layer 11 gives Vinogradov's conjecture (Tao 2015, Conjecture 1.1). Layers 6 and 8 feed Blomer–Goldmakher–Louvel (2014) and Dunn–Radziwiłł (2024). This rests on the README (Summary, Downstream consumers) and those sources.

## Not verifiable

- `openai2026quasiRH` lines 715–716: the OCR garbles the definition of `‖·‖_{J,sep}`. Whether the source normalizes by `(2π)^(−d)`, which decides whether its (4.10) lacks §3.2's factor `(2π)^d`, could not be read.
- `goldmakherlouvel2013` Definition 1 (3), line 58, and p. 5, line 201: the text extraction may drop overlines, so whether the source writes `χ_𝔞 χ̄_𝔟` cannot be read.
- `patterson1977` Theorem 8.1 and (8.8)–(8.9): the OCR drops the conjugation bars. §8.7's `conj` was checked only through `openai2026quasiRH` (5.9).
- Locators outside the sample (`milnecft2020`, `heathbrown2000`, `gaozhao2024`, `dunnradziwill2024` (1.4)–(1.8)) were not re-read this round.

## Source issues

- **Error** in goldmakherlouvel2013 at Remark 3, p. 2: the source says the `n/d`-th powers of any `n`-th order family form a `d`-th order family; it should be a hypothesis, since a quadratic family over `ℚ(i)` read as quartic has trivial squares; affects a stated result (Corollary 1.2).
- **Misprint** in kubota1968 at §3, p. 265: the source says the poles of `E` and `φ` on `Re s ≥ 1` lie in the open interval `1 < s < 2`; it should be `1 < s ≤ 2`, with `s = 2` a pole for trivial `χ`; affects a stated result.

## For the human reviewers

- Scope: the headline `11/12` half-plane rests on `openai2026quasiRH`, which README line 32 calls "an unrefereed preprint" (repository `openai/math`, revision `adc7f12`), and on `liu2026improved` (arXiv 2610.12234v2). The README and the cached texts name no refereed source for it.
- Licence: `openai2026quasiRH` and `openai2026quasiRHalt` were fetched from `raw.githubusercontent.com/openai/math` (source header, line 2 of each). I did not read that repository's licence.
- Licence: `liu2026improved` line 25 says the result has been formalized in Lean ("[Liu26]"). I did not compare `Suggested.lean` with that formalization.
