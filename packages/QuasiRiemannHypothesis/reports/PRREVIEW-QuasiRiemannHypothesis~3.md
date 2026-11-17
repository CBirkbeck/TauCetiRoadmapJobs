# Review of QuasiRiemannHypothesis (pull request #2468 at 1958ba8)

**Verdict:** needs changes

## R01 (P2) — §§8.2–8.4 quantify over discrete groups whose cusps no supplier defines

**Location:** `TauCetiRoadmap/QuasiRiemannHypothesis/README.md` lines 1634–1636 (and §§8.3–8.4, which inherit it): "Let `Γ ⊂ SL₂(ℂ)` be a discrete group of finite type (cofinite, with every boundary point of a fundamental domain a cusp) and `χ` a unitary character of `Γ`."

**Claim:** For such `Γ` the text uses cusps, stabilizers `Γ_c`, their translation lattices and the finite number `h` of essential cusps, but defines none of them, and the cited supplier defines cusps only for `Γ ≤ GL₂(K)`.

**Witness:** BianchiModularForms §0.4 (open head, README line 455): cusps are `Γ \ ℙ¹(K)` for `Γ ≤ GL₂(K)`. The conjugate of `SL₂(ℤ[i])` by `z ↦ z + π` is of finite type, lies in no `GL₂(K)`, and has cusps `π + ℚ(i)`.

**Repair:** Replace the first sentence of §8.2 by: "Let `Γ ⊂ SL₂(ℂ)` be discrete with cofinite image in `PSL₂(ℂ)` (KleinianGroups Layer 1). A *cusp* of `Γ` is a point of `ℙ¹(ℂ)` fixed by two parabolic elements of `Γ` with `ℝ`-independent translation parts; `Γ` is *of finite type* when every boundary point of a fundamental domain is a cusp. Prove: the parabolic elements of the stabilizer `Γ_c` of a cusp form a group isomorphic to `ℤ²`, of finite index in `Γ_c`, and a group of finite type has finitely many classes of cusps (`kubota1968` §2, pp. 262–263). For a finite-index subgroup of `SL₂(𝓞_K)` these are the cusps and stabilizers of BianchiModularForms §0.4." Add the witness as a Check ("its cusps `π + ℚ(i)` are not points of `ℙ¹(ℚ(i))`: the definition presupposes no field"), add "KleinianGroups Layers 0–1" to the *Needs:* lines of §§8.2–8.4, to Layer 8's Dependencies, to "Consumed, not redefined" and as a supplier contract. With that citation the dependency check still reports `0 problem(s)` (run on a scratch copy).

## Verified sound

The previous review of this head listed no finding, so there is nothing to recheck finding by finding.

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| §1.3 continuation principle (`openai2026quasiRH` Prop. 2.1, p. 8, lines 316–368) | `E* = min(β* − σ₀ − ω, σ)`; `Z ≤ 1`; zero function | `C(σ₀) + ω = C(β*) − (β* − σ₀ − ω)`; `β* − E* > σ₀`; zero function excluded by nonvanishing on `Re s > 1` | holds | none |
| §1.4 height before decay (Lemma 11.1, p. 82, lines 3691–3723) | `A_η τ ≤ m/4`, then `N` | `(1 + Z^τ)^A ≤ 2^A Z^(m/4)`; first term `Z^(C(β*) − 3m/4)`; `T₁^(−N) = Z^(−Nτ)` matches (11.1) | holds | none |
| §2.2 primary elements (§4.1, p. 10, lines 412–414; `dunnradziwill2024` (1.4), line 216) | `1`, `−2`, `1 + 3ω`, six units, `λ` | norms `1, 4, 7`; `𝓞/3` has `9 − 3 = 6` units, the six units distinct; `λ ∣ 3` | holds | none |
| §2.4 fixed-numerator families (Lemma 4.1, p. 11, lines 465–470; proof line 483) | count of numerators | `6` units times `6^|S|` residues: `6^(|S|+1)`, as the source's proof | holds | none |
| §2.5 supplements and conjugate primes | `d = 1 + 3ω`; `π = −2 + 3ω` | `1 − λ² + λ³ ≡ 1 + 3ω (mod 9)`; `(λ/d)_3`: `5² ≡ 4 = ω²` in `𝔽₇`; `(−7)⁶ ≡ 1 (mod 19)` | holds | none |
| §3.2 joint bound; §3.4 kernels (Lemma 4.7, p. 20, lines 853–877) | `m ≡ 1`; `m(s) = s`; `e^(−πx²)` | `1 + |T| + |u| + |w| ≤ 2(1 + |T+u|)(1 + |u|)(1 + |w|)`; `K_W(x) = W(1/x)`, `(y∂_y W)(1/x)`; `s_0 = 1` | holds | none |
| §4.3–4.5 Gauss sums, `Γ(c)`, `τ` | brute force at `p = 1 + 3ω`; `Γ` at 11 moduli | `γ_2³ = 0.18898 − 0.98198i = −α(p)`; `γ_3 = i`; `γ_1γ_2 = −0.65465 + 0.75593i`; all `Γ` equal the closed form | holds | none |
| §5.2 strip growth | `K = ℚ`, `ψ = 1`, `s = −1/10` | `0.50995 ≤ 9.8952 ≤ 61.385`; exponent `(11/10 − σ)/2 ∈ [0, 3/5]`; `|1 + s| ≤ 21/10 + |t|` | holds | none |
| §5.3 zero-free disc (Lemma 4.9, p. 22, lines 957–998) | trivial character; `d = 2` | `|(s − 1)/(s + 1)| ≤ 1` on `Re s ≥ 0`; source `{2Q(3 + |t|)²}^ε` is `d = 2` here | holds | none |
| §6.2 Hecke families (`goldmakherlouvel2013` Def. 1, Thm 1.1, Cor. 1.2, lines 45–100; p. 5, lines 196–232; `bgl2014` Lemma 2.3, line 305, p. 11, line 598) | `(21/·)`, `(15/·)`; quadratic family over `ℚ(i)` as quartic | conductors `21`, `60`; squares trivial: left side `≫ N³` against `N^(2+ε)`; p. 5 computes `x_a/x_b` | holds with the stated hypothesis | none |
| §6.3 conjugate in the primitivity axiom | `𝔞 = (−2)`, `𝔟 = (7)`, `𝔠 = (9)` | `14 ≡ 5 (mod λ³)`; `N(5 + ω) = 21`, `N(5 − ω) = 31`, `v_λ(6) = 2`; cubes of units `≡ ±1 (mod λ⁴)` | holds | none |
| §7.1 detecting polynomials ((4.1)–(4.2), p. 12, lines 489–494) | twist `y^(iv)`; `K = ℚ` | `MW_v(s) = MW(s + iv)`; `Σ μ(n) n^(iv − s) = ζ(s − iv)⁻¹` | holds | none |
| §7.2 pigeonhole (Lemma 8.1, p. 56, lines 2518–2534) | every `i ≤ I − 1` fails; disc heights | `M_I > a₀ + (I − 1)ε ≥ a₀ + 1 + ε`; radius `< 3/2 ≤ T₁`, so heights `< 3(i + 1)T₁` | holds | none |
| §7.3 polynomial bounds (Lemma 8.2, p. 57, lines 2569–2620) | `ε₀ = ε'/(48 r_max)`, `ε₁ = ε'/8`, `A ≥ 2C` | `12εr + 2ε₁ ≤ ε'/2`; `(24 − 12m)ε + 2ε₁ ≤ 3ε'/4`; `(3 + T₁)^(2C) ≤ 9^C U^(ε'/10)` | holds | none |
| §8.1 Kubota character | `Γ₁(3)` matrix; `Γ(9)` matrix with `a = 10` | `10d − cb = 1`; `(4 + ω)⁸ ≡ ω (mod 5)`; `(b/10)_3 = ω² = (c/d)_3`, `(c/a)_3 = ω`; `2e − 1 ≥ e` | holds | none |
| §8.2 automorphic functions (`kubota1968` §§2–3, lines 119–167) | `v K_ν(κv) ě(μz)`; dual of `ℤ[i]` | `Δ₃` gives `1 − ν²`, `= s(2 − s)` at `ν = s − 1`; `8/9` at `1/3`; dual `(1/2)ℤ[i]` | statement holds; ownership: R01 | R01 |
| §8.3 Eisenstein series (`kubota1968` (8), (16)–(18), (22)–(25), lines 176–292; `kubota1969` (37)–(39), lines 1228–1260) | `SL₂(ℤ[i])`, `χ = 1`, `|U| = 4` | `∫ (|z|² + v²)^(−s) = π v^(2−2s)/(s − 1)`; `φ(1) = π(−1/4)/(π/4) = −1`; factor `1/2` gives `−2` | holds | none |
| §8.7 cubic theta (`patterson1977` Thm 8.1, p. 152, line 1154; (8.8)–(8.9), p. 154; `dunnradziwill2024` (5.6)–(5.14), lines 1235–1319) | `k = −3`, `k = 3n − 4`, `k = −4` | `3^(5/2)` attained; `3^(n/2+2) ≤ 3^(n/2+7/3)`; `9 < 12.980`; `g̃(c) = 0.89595 − 0.44415i`, `γ_2 = χ_c(λ)² g̃` | holds | none |
| §9.1 completed series (§5.1, p. 25, lines 1060–1083; `liu2026improved` (4.1), line 672) | `s = t + 1/2`; `A = p², p³, p⁴` | `q_c^(−1/2−t) q_n^(−1−3t) = q_c^(−s) q_n^(1/2−3s)`; `L₀` converges for `Re s > 1/2` | holds | none |
| §10.6 closed-form exponents | probe data `l_x = l_y = h = 1/2` | `C(s) = s − 2/3`; `−43/300`; `−1.749`; `1021/25000`; `46 · 10⁻⁶ < 2.083 · 10⁻⁴` | holds | none |
| §10.7 half-plane (Thm 3.1, p. 10, line 387; `liu2026improved` Prop. 6.3, line 1140; `openai2026quasiRHalt` Thm 1.1, p. 2) | hypotheses of §1.3 | `C(11/12) = 1/4`; `H_η` on `Re s > 7/8 ⊃ Re s > 11/12`; `ω = (β* − 11/12)/2` independent of `η` | holds | none |
| §11.1 zero strip (proof of Cor. 1.2, p. 7, lines 282–283) | `0 < Re ρ < 1/12`; level `1` at `s = 1` | `Re(1 − ρ̄) ∈ (11/12, 1)` excluded; `ζ(1)` junk `−0.97691 ≠ 0` | holds | none |
| `ZeroFreeRightOf` | `s − 2`, `1/(s − 1)`, `0`, `s̄` | orders `1`, `−1`, `⊤`, junk `0`; predicate false, true, false, true | holds | none |
| `zeroFreeRightOf_LFunction_of_isAbelianGalois` | `K = F`, `χ = χ₋₃`; `K = ℚ(√5)` at `2`; `σ₀ < 1/2` | cofactor principal mod `3`, `L(1, χ₋₃) = 0.60460`; `(1 − χ(2)2^(−s))(1 + χ(2)2^(−s)) = 1 − χ(2)² 4^(−s)`; hypothesis false | holds | none |
| `zeroFreeRightOf_heckeLFunctionC`, `zeroFreeRightOf_LFunction`, `riemannZeta_ne_zero_of_eleven_twelfths_lt_re` | junk `0`; principal mod `4`; `s = 1` | order `⊤` fails the predicate; zeros of `1 − 2^(−s)` on `Re s = 0`; `ζ(1) ≠ 0` in Mathlib | holds | none |
| `re_mem_Icc_of_LFunction_eq_zero`, `re_mem_Icc_of_heckeLFunctionC` | `N = 1`, `ρ = 1`; pole of `ζ_F` | hypothesis false at `ρ = 1`; order `−1` is not positive; `ζ_F(0) = −1/6 ≠ 0` | holds | none |
| `exists_ne_zero_ne_one_le_log_rpow` | `q = 3∏_{p ≤ y} p`; `q = 3`; `θ = 1/2` | prime sides differ by `≤ 2ω(q) log x`; least value `≤ 2y` against `C y²`; `log 3 = 1.0986 > 1` | holds | none |
| `exists_prime_ne_zero_ne_one_le_log_rpow` | `η = 1`; `𝔪₀ = (1)`; `(·/3) ∘ N` over `ℚ(i)` | trivial `η` fails the conclusion, excluded; `log 1 + 2 = 2 > 0`; value `−1` at `(1 + i)` | holds | none |
| `exists_jacobiSym_eq_neg_one_le_log_pow`, `…_le_rpow` | `p = 3, 7`; `θ = 11/12`, `7/8` | `n = 2`, `3`; `1/(1 − θ) = 12`, `8`; source `4/(1 − 2 · 7/16) = 32` | holds | none |

- Source locators read against the text: 67 in 14 sources (`openai2026quasiRH` 17, `liu2026improved` 8, `dunnradziwill2024` 8, `kubota1968` 7, `bgl2014` 6, `patterson1977` 6, `goldmakherlouvel2013` 5, `kubota1969` 4, `milnecft2020` 3, `bimsissac2017` 2, `heathbrown2000`, `gaozhao2024`, `lamzourilisound2015`, `tao2015`, `openai2026quasiRHalt` 1 each); every one is at the stated number and page.
- Library declarations opened at the pins: `heckeLFunctionC` (`TauCeti/NumberTheory/LFunctions/Hecke/Basic.lean:74`), `toMultiplicativeIdealWeight` (`…/RayClass/Character/Weight.lean:42`, value `0` off the support), `Modulus` (`…/RayClass/Modulus.lean:98`), `gaussSum_powerResidueSymbol_three_pow_three_eq` (`…/Three/CubicReciprocity.lean:84`), `eulerCorrection_ne_zero` (`…/Hecke/Primitive.lean:287`); 55 further cited names found by search, none missing. No `K`-Bessel function at either pin.
- Cross-roadmap citations resolved: 48 sections, on main (LFunctions, ZerosOfLFunctions, ExplicitZetaBounds, ClassicalArithmeticCompletion, KTheoryLowDegrees, ClassFieldTheory, ThetaSeries, SieveMethodsAndPrimePatterns, AnalyticNumberTheoryPartI–III, AutomorphicFormsOnReductiveGroups) and at open heads (CharacterSumsOverFiniteFields, BianchiModularForms, MaassForms, AutomorphicSpectralTheory); all exist with the cited content, R01 apart.
- Gate at this head: every check passes. Dependency check: `depcheck: 249 roadmaps, 2581 edges, 0 problem(s)`. Outside-folder diff: none.
- Elaboration: `lake env lean` on `Suggested.lean` gives 10 `declaration uses 'sorry'` warnings and nothing else; the `#check @name` types of the 11 declarations match the README, no binder lost.
- Padding probe: `first | rfl | simp | infer_instance | norm_num | positivity | aesop` closes none of the 10 theorems.
- Supplier remark, no change here: KTheoryLowDegrees §10.2 (main, line 1061) writes `[b/a] = [c/d]⁻¹`; its §10.1 relations and the `Γ(9)` matrix above give `[b/a] = [c/d]`, as §8.1 derives.
- Pull-request text: title, summary block and prose agree with the head (a new roadmap, three files, the four open suppliers).

Overlap check: read ExplicitNumberFields, CongruenceSpectralGap, CharacterSumsOverFiniteFields, BianchiModularForms, ExplicitMultiplicativeFunctions, ZerosOfLFunctions, LFunctions, AnalyticNumberTheoryPartIII (the results-and-headings list is empty), and KleinianGroups, MaassForms, AutomorphicSpectralTheory for Layer 8; Rademacher's bound: owner ExplicitZetaBounds §3.2; duplication formula: CharacterSumsOverFiniteFields §3.4; Bianchi groups and their cusps: BianchiModularForms §§0.3–0.4; discrete cofinite groups on `ℍ³`: KleinianGroups Layers 0–1; Kubota's homomorphism and Artin induction: KTheoryLowDegrees, AnalyticNumberTheoryPartI §2.18a; cusps of a general finite-type group and Eisenstein series with a character on `ℍ³`: no other owner, so this roadmap (R01).

Source independence: 17 passages compared with 8 sources (`openai2026quasiRH`, `liu2026improved`, `goldmakherlouvel2013`, `bgl2014`, `kubota1968`, `patterson1977`, `dunnradziwill2024`, `lamzourilisound2015`); none shares a run beyond formulas and hypothesis lists (longest prose run 6 words). Largest share `openai2026quasiRH`, 67 of 149 locators. Contents compared with `openai2026quasiRH` §§2–11 and `liu2026improved` Part I: independent (Layers 6 and 8 have no counterpart; Layers 3–4 reverse §§4.3/4.2; Layer 7 precedes Layer 9; Layer 10 merges §§6, 7, 9–11).

Research link: Layer 10 is Theorem 3.1 of the OpenAI 2026 preprint, the first stage of its `7/8` theorem, retold by Liu (2026); Layer 11 gives Vinogradov's conjecture (Tao 2015, Conjecture 1.1); Layers 6 and 8 are the tools of Blomer–Goldmakher–Louvel (2014) and Dunn–Radziwiłł (2024). Rests on the README and those sources.

## Not verifiable

- `patterson1977` Theorem 8.1 and (8.8)–(8.9), and `dunnradziwill2024` (5.7), (5.13)–(5.14): the extractions drop the conjugation bars, so §8.7's `conj` was not read in either text.
- `goldmakherlouvel2013` Definition 1 (3), line 58: the extraction shows `χ_𝔞 χ_𝔟`; a dropped overline cannot be excluded.
- `bgl2014` lines 7 and 173: the extraction prints `n > 3` and `M, N > 1/2` where §6.4 has `n ≥ 3` and `M, N ≥ 1/2`; the inequality sign is not legible.
- `openai2026quasiRH` lines 715–716: the definition of `‖·‖_{J,sep}` is garbled, so the normalization `(2π)^(−d)` of §3.1 was not read.
- `kubota1968` (17) and (25): the displayed formulas are lost in the extraction; §8.3's factor `|U_i|⁻¹` was checked by computation only.
- Not re-read this round: `maynardpratt2024` Appendix C, `guthmaynard2026` §13.1, `baierbansal2018` Theorem 3, `gaozhao2020` (1.1), `lamzourilisound2015` Lemma 2.2, `openai2026quasiRH` §§6–7 and 9–10.

## Source issues

- **Error** in goldmakherlouvel2013 at Remark 3, p. 2: the source says the `n/d`-th powers of any `n`-th order family form a `d`-th order family; it should be a hypothesis, since a quadratic family over `ℚ(i)` read as quartic has trivial squares; affects a stated result (Corollary 1.2).
- **Misprint** in kubota1968 at §3, p. 265: the source says the poles of `E` and `φ` on `Re s ≥ 1` lie in the open interval `1 < s < 2`; it should be `1 < s ≤ 2`, with `s = 2` a pole for trivial `χ`; affects a stated result.

## For the human reviewers

- Scope: the headline `11/12` half-plane rests on `openai2026quasiRH`, which README line 32 calls "an unrefereed preprint" (repository `openai/math`, revision `adc7f12`), and on `liu2026improved` (arXiv 2610.12234v2). No refereed source for it is named in the README or the cached texts.
- Licence: `openai2026quasiRH` and `openai2026quasiRHalt` were fetched from `raw.githubusercontent.com/openai/math` (line 2 of each text). The licence of that repository was not read.
- Licence: `liu2026improved` line 25 says its result is formalized in Lean ("[Liu26]"). `Suggested.lean` was not compared with that formalization.
