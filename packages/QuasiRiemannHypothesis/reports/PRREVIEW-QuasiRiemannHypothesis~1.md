# Review of QuasiRiemannHypothesis (pull request #2468 at a0f54a3)

**Verdict:** needs changes

## R01 (P2) — Kubota's homomorphism already has an owner on main

**Location** `TauCetiRoadmap/QuasiRiemannHypothesis/README.md` line 71 (Owned here): "the Kubota character on congruence subgroups of `SL₂(𝓞_K)` for a totally imaginary `K ⊇ μ_n`"; line 1553 (§8.1): "Prove that `κ` is a homomorphism `Γ(N) → μ_n`".

**Claim** On `Γ(N) ∩ SL₂(𝓞_K)` the character `κ = (c/d)_n` is a power of KTheoryLowDegrees' Kubota map at its power-residue Mennicke symbol. This roadmap claims the object and plans its proof again, and cites neither section.

**Witness** KTheoryLowDegrees README (main), line 1051, §10.2: the Kubota map `κ(g) = s(row₁ g)` is a homomorphism on `GL₂(A, I)`. Line 1272, §11.2: `[b/a] ↦ (b/a)_{r(I)}` for totally imaginary `F`. At §8.1's `Γ(9)` Check matrix, `(b/a)₃ = ω² = (c/d)₃`.

**Repair** Make three changes to the Scope section and the supplier contracts:
- Under "Consumed, not redefined" add: "Kubota's homomorphism of a Mennicke symbol and the power-residue Mennicke symbol of a totally imaginary field: KTheoryLowDegrees §§10.2, 11.2."
- Add a contract "From TauCetiRoadmap.KTheoryLowDegrees" that names these two sections.
- Delete "the Kubota character on congruence subgroups … `K ⊇ μ_n`," from "Owned here", keeping Patterson's `κ_P`.

In §8.1, replace the sentence "Prove that `κ` is a homomorphism … `κ(σ) = (c/a)_n⁻¹` for `c ≠ 0`." with: "On `Γ(N) ∩ SL₂(𝓞_K)`, `κ` is the `(r(N)/n)`-th power of the Kubota map of KTheoryLowDegrees §10.2 at the power-residue Mennicke symbol of its §11.2. Here `n ∣ r(N)` because `n² ∣ N`, and `(c/d)_n = (b/a)_n` because `bc ≡ −1 (mod a)` and `(−1/a)_n = 1` for `a ≡ 1 (mod n²)`. Hence `κ` is a homomorphism (`kubota1969` §3, Propositions 1–2, pp. 24–25). Prove that on this group `κ(σ) = (c/a)_n⁻¹` for `c ≠ 0`." Then define `Γ(N)` inside `SL₂(𝓞_K)`, which is where §8.5 uses it.

Base the identification on the first-row value `[b/a]`. At this matrix, KTheoryLowDegrees' companion form `[c/d]⁻¹` evaluates to `ω`, not `ω²`.

## R02 (P3) — §5.4 restates a case of Artin induction without citing the roadmap that owns it

**Location** `TauCetiRoadmap/QuasiRiemannHypothesis/README.md` line 1177 (§5.4): "Prove the base-change factorization: … `L^S_K(s, χ ∘ N) = ∏_{ψ ∈ X(K)} L^S(s, χψ)`". Line 61 lists "the base-change factorization" under "Owned here".

**Claim** The identity is AnalyticNumberTheoryPartI §2.18a at `σ = χ|_{G_K}`, split by `Ind Res χ = ⊕_{ψ ∈ X(K)} χψ`. The README cites §2.42 of that roadmap but never §2.18a, and claims the factorization as its own.

**Witness** AnalyticNumberTheoryPartI README (main), line 1681, §2.18a: "Induction at every finite place, ramified ones included: … `L_F(s,Ind σ)=L_M(s,σ)`". The same section compares one-dimensional characters with primitive Hecke characters.

**Repair** Make two changes:
- Add "AnalyticNumberTheoryPartI §2.18a (induction at every place, with the one-dimensional comparison)" to §5.4's *Needs:*.
- At line 61, replace "the base-change factorization" with "the `S`-deleted base-change factorization over an abelian `K`, the instance of AnalyticNumberTheoryPartI §2.18a at `σ = χ|_{G_K}` through `Ind Res χ = ⊕_{ψ ∈ X(K)} χψ`".

Keep the Euler-factor computation as one route.

## R03 (P3) — §9.3's kernel clause is looser than its locator and than §9.4 needs

**Location** `TauCetiRoadmap/QuasiRiemannHypothesis/README.md` line 1923 (§9.3): "the transforms `V♯` of the annular pieces of a common profile form a uniformly smooth family with seminorms bounded by `𝓜_{A,J}`".

**Claim** The clause leaves out four things: the dimension `d`, the monomial argument `Y h(y)`, the gain `min{Y^(1/4), (1 + Y)^(−A)}`, and the seminorm indices. §9.4's mean-square route uses all of them in dimension three. As written, the index `J` is unbound.

**Witness** `openai2026quasiRH` lines 1530–1534 (Lemma 5.3, p. 35): `F_Y = W · V♯(Y h)`, with `p_j(F_Y) ≪ m_A(Y) p_j(W) 𝓜_{A,⌈4A⌉+j+2}(V)` and `m_A(Y) = min{Y^(1/4), (1+Y)^(−A)}`. Line 1831 says "Apply Lemma 5.3 in dimension three".

**Repair** Replace the clause with:

"(common kernel profiles) for `d ≥ 1`, a compact `Ω ⊂ ℝ^d`, real exponents `a_1, …, a_d`, a profile `W` with logarithmic support in `Ω` and `Y > 0`, put `h(y) = ∏ y_i^(a_i)` and `F_Y(y) = W(y) V♯(Y h(y))`. Then, uniformly in `Y`, `p_j(F_Y) ≪_{A,j,d,Ω,a} min{Y^(1/4), (1 + Y)^(−A)} p_j(W) 𝓜_{A,⌈4A⌉+j+2}(V)` and `‖F_Y‖_{J,sep} ≪_{A,J,d,Ω,a} min{Y^(1/4), (1 + Y)^(−A)} p_{J+d+2}(W) 𝓜_{A,⌈4A⌉+J+d+4}(V)`"

and keep the locator.

## R04 (P3) — A §5.2 Check cites the wrong display

**Location** `TauCetiRoadmap/QuasiRiemannHypothesis/README.md` line 1102: "the edge bound `Q^(3/5) (3 + |t|)^(6/5)` is `openai2026quasiRH` (4.14)'s line `Re s = −1/10`".

**Claim** On that line, (4.14) gives `Q^(3/5)(3 + |t|)²`. The `6/5` bound is a display inside the proof of Lemma 4.8.

**Witness** `openai2026quasiRH` line 900, display (4.14): `Q^(3/5)(3 + |t|)²` for `−1/10 ≤ σ ≤ 11/10`. Line 910, in the proof: `|L(−1/10 + it, ψ)| ≪ Q^(3/5)(3 + |t|)^(6/5)`. Both are on p. 21.

**Repair** Replace the sentence with: "the edge bound `Q^(3/5) (3 + |t|)^(6/5)` is the bound on `Re s = −1/10` proved in the proof of `openai2026quasiRH` Lemma 4.8, p. 21, and the statement improves the strip factor `(3 + |t|)²` of its (4.14) to `(3 + |t|)^(6/5)`."

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| §2.3 sextic symbol | `p = 1 + 3ω`, `𝔽₇` with `ω ↦ 2` | `χ_p(2) = ω`, `χ_p(3) = −ω²`, `χ_p(−1) = −1`, `χ_p^6(7) = 0`; source §4.1 p. 11, lines 444–451, same zero convention | holds | none |
| §3.3 Gaussian weight | `s = 0, 1, 1/2 + it`; variant `exp(−(log y)²)` | `1`, `e`, `e^(1/4 − t² + it)`; variant `√π e^(s²/4)`; Lemma 4.6 p. 19, `MW_G = e^(s²)` | holds | none |
| §3.4 Fourier/Mellin kernels | `m ≡ 1`, `m = s`; `f = e^(−πx²)`; indicator of `[0, 1]` | `K_W = W(1/x)`, `(y∂W)(1/x)`; `sup|f̂| = 1 = s₀`; `(1+|ξ|)²|sinc|` unbounded; Lemma 4.7 p. 20 | holds | none |
| §4.5 sextic reciprocity, `R`, `G` | `a = 1 + 3ω`, `b = −2 + 3ω`; `p = 4 + 3ω` | `χ_b(a) = −ω²`, `χ_a(b) = ω²`, ratio `−1 = τ(λ, λ)`; `Γ(4 + 3ω) = 1 = χ_p(−1)`; Lemma 4.4 pp. 15–16 | holds | none |
| §4.3–4.4 Gauss sums at `1 + 3ω` | direct sums over `𝔽₇` | `γ₃ = i`, `γ₂³ = −α = 0.1890 − 0.9820i`, `γ₁γ₂ = −0.6547 + 0.7559i = −α ω i`, `Γ = i` | holds | none |
| §5.2 strip growth | `K = ℚ`, `ψ = 1`, `s = −1/10` | `|ℒ| = 0.50995 ≤ 9.8953 ≤ 61.385`; `ζ(1.1) = 10.58445` | holds | R04 |
| §5.3 zero-free disc | trivial `ψ`, `Re s ≥ 0` | `|(s−1)/(s+1)| ≤ 1`, so `|1/ζ_K| ≤ |ℒ|⁻¹`; Lemma 4.9 p. 22: radii `2−a−2ε, 6ε, 8ε`, `r₀ = 49/100` | holds | none |
| §5.4 base change | `K = F`, `χ` of order 3 mod 7; `K = ℚ(√5)` | inert 2: `χ(2)²`; `H = {1, 9}` mod 10; local product `(1 − χ(p)^f p^(−fs))^g` | holds | R02 |
| §7.1 detecting polynomials | `r = 0`, `W ⊂ (1/2, 2)`; twisted Möbius | `M₀ = W(1)`; `Σ μ(n) n^(iv) n^(−s) = ζ(s − iv)⁻¹`, pole `1 + iv`; (4.1)–(4.2) p. 12 | holds | none |
| §7.2–7.4 bins, witnesses | `I = ⌈1/ε⌉ + 2`; floors `51/100`, `1/2 + 10⁻⁶` | `M_I > a₀ + 1 + ε > 1`; `m − 1/2 < 25C''ε'` vs `2.5·10⁵ C''ε'`; Prop 8.3 p. 59 | holds | none |
| §8.1 Kubota character | Check 1 matrix; `Γ(9)` matrix with `b = −486 − 459ω`, `d = 802 − 486ω` | `(c/a)₃ = ω`, `(c/d)₃ = ω²`, `(b/a)₃ = ω²`, `(b/d)₃ = ω`; Kubota pp. 24–25, `n² ∣ N` | holds | R01 |
| §8.3, §8.5 Eisenstein, cusps | `SL₂(ℤ[i])`; `Γ₁(3)` | `φ(1) = π(−1/4)/(π/4) = −1`; `648/2 = 324`, `324/27 = 12` cusps; Patterson p. 126 lists 12 | holds | none |
| §8.7 cubic theta | `c = 1 + 3ω`, `μ = λ⁻³cd³`, `d = −2` | `g̃ = 0.8960 − 0.4441i`, `g̃³ = −α`; `27·3^(−1/2) = 3^(5/2)`; `27·3^(−2/3) = 12.98 < 18`; (5.9) line 1227 | holds | none |
| §9.3 uniformity | Lemma 5.3 against the README clause | source has a factor `min{Y^(1/4),(1+Y)^(−A)}` and index `⌈4A⌉+j+2`; README has neither | looser | R03 |
| §10.1 probe | exponents at `s = t + 1/2` | `q_c^(−1/2−t)`, `q_n^(−3(t+1/2)+1/2) = q_n^(−1−3t)`; (6.1) p. 46; `T` defined p. 45 | holds | none |
| §10.4–10.5 counts, contours | `δ = 1/50, 2/3, 1`; `z₀ = 17/50` | `R = 1, 2/3, 1/2`; `13/150 − 1/4 + 1/50 = −43/300`; `7/4 + 501/1000 − 4 < −1`; `5T₁/24 < T₁/2` | holds | none |
| §10.6 saving `1/4800` | `ε_b = 10⁻⁶` | `46ε_b = 4.6·10⁻⁵ < 2.08·10⁻⁴`; `1021/25000`; `3m₀/4 = 1/1600`; Prop 11.2 p. 83 has the same numbers | holds | none |
| §11.2 least character value | mod 12 from `(·/3)`; modulus `3∏_{p≤y} p` | value `5` (primitive `2`); bound `≫ y²` against least `p ≡ 2 (3)` above `y`, `≤ 2y`; LLS Thm 1.1 | holds | none |
| §11.3 least nonresidue | `p = 7`; BIMS `ε = 7/16, 11/24` | `n(7) = 3 ≤ (log 7)^12 ≈ 2950`; `4/(1−2ε) = 32, 48`; Cor 1.2 p. 7 uses `A = 32` | holds | none |
| `ZeroFreeRightOf` | `s − 2`, `1/(s−1)`, `0`, `conj`, `ζ` | orders `1`, `−1`, `⊤`, junk `0` (meromorphic nowhere), `0` on `Re s > 1` | holds | none |
| `zeroFreeRightOf_LFunction_of_isAbelianGalois` | `K = F`, `χ = χ₋₃`; `χ₀` mod 4; `σ₀ = 1` | cofactor principal mod 3, `L(1, χ₋₃) = π/(3√3)`; zeros of `1 − 2^(−s)` on `Re s = 0` excluded | holds | none |
| `zeroFreeRightOf_heckeLFunctionC` | trivial character at `(1)`; `heckeLFunctionC = 0` | `ζ_F = ζ L(·, χ₋₃)`, pole order `−1`; junk `0` fails the predicate (order `⊤`) | holds | none |
| `zeroFreeRightOf_LFunction`, `riemannZeta_ne_zero_of_eleven_twelfths_lt_re` | level 1; `s = 1, 2` | `LFunction_modOne_eq`; `ζ(1) = −0.97690 ≠ 0`; `ζ(2) = π²/6` | holds | none |
| `re_mem_Icc_of_LFunction_eq_zero`, `re_mem_Icc_of_heckeLFunctionC` | `N = 1`; `N = 2` (no primitive); `0 < Re ρ < 1/12` | gamma factors finite, nonzero; `1 − ρ̄` has real part in `(11/12, 1)`, excluded | holds | none |
| `exists_ne_zero_ne_one_le_log_rpow` | `q = 2, 3`; mod 12 | no nonprincipal `χ` mod 2; `log 3 > 1`; value `5`; `θ = 1/2` gives `(log q)²` | holds | none |
| `exists_prime_ne_zero_ne_one_le_log_rpow` | `η = 1`; `(·/3)∘N` over `ℚ(i)` | trivial `η` satisfies the hypothesis and fails the conclusion, so `η ≠ 1` is needed; value at `(1+i)` is `−1` | holds | none |
| `exists_jacobiSym_eq_neg_one_le_log_pow`, `…_rpow` | `θ = 11/12`; `p = 3, 7` | `1/(1−θ) = 12`; `n = 2`, `n = 3`; `(log p)^12 ≪_δ p^δ` | holds | none |

- Source locators checked against the text: 106 in 12 sources (`openai2026quasiRH` 45, `liu2026improved` 14, `patterson1977` 14, `dunnradziwill2024` 8, `milnecft2020` 6, `kubota1969` 5, `goldmakherlouvel2013` 5, `bgl2014` 3, `lamzourilisound2015` 2, `bimsissac2017` 2, `tao2015` 1, `heathbrown2000` 1). All are at the stated theorem and page, apart from R03 and R04.
- Library declarations checked at the pins: 73 `#check` (32 Mathlib, 41 Tau Ceti), all present. Definitions read: `heckeLFunctionC` (`LFunctions/Hecke/Basic.lean:74`), `PrimitiveRayClassCharacter` (`Hecke/Primitive.lean:91`), `toMultiplicativeIdealWeight` (`RayClass/Character/Weight.lean:42`), `IsPrimaryEisenstein` (`Cyclotomic/Three/Primary.lean:59`), `RayClassCharacter` (`RayClass/Character/Basic.lean:62`), `Modulus` (`RayClass/Modulus.lean:98`).
- Library claims in the module docstring: Mathlib has only `Complex.besselJ` (no `K`-Bessel function). Tau Ceti has `TauCeti.UpperHalfSpace` with its isometries but no `SL₂(ℂ)` action or Laplacian on ℍ³, so Layer 8 is correctly not statable.
- Cross-roadmap citations resolved: 47. On main: LFunctions, ZerosOfLFunctions, ExplicitZetaBounds, ClassicalArithmeticCompletion, ClassFieldTheory, ThetaSeries, SieveMethodsAndPrimePatterns, AnalyticNumberTheoryPartI–III, AutomorphicFormsOnReductiveGroups, GlobalNumberFields. At open heads: CharacterSumsOverFiniteFields, MaassForms, BianchiModularForms, AutomorphicSpectralTheory.
- Gate: every check passes. Dependency check: `depcheck: 260 roadmaps, 2601 edges, 0 problem(s)`.
- Elaboration: `lake env lean` on `Suggested.lean` gives 10 `declaration uses 'sorry'` warnings and nothing else. The `#check @name` types of all 11 declarations match the README, with no lost binders.
- Padding probe: all 10 theorems stay unsolved under `simp | rfl | norm_num | infer_instance | positivity`.
- No further changes are needed in the pull request text: the summary block and prose match the head.

Overlap check: read ExplicitNumberFields, CongruenceSpectralGap, CharacterSumsOverFiniteFields, BianchiModularForms, ExplicitMultiplicativeFunctions, ZerosOfLFunctions, LFunctions and AnalyticNumberTheoryPartIII; nothing shared with them. Beyond those lists, Kubota's homomorphism is owned by KTheoryLowDegrees (R01) and Artin induction by AnalyticNumberTheoryPartI (R02). Eisenstein series on ℍ³ have no owner (BianchiModularForms and KleinianGroups exclude them).

Source independence: 26 passages compared with 9 sources, plus a scan of the whole README for word sequences shared with 11 cached texts; apart from bibliography titles the longest shared run is 10 words, a formula phrase in §10.5; largest share `openai2026quasiRH`, 67 of 149 locators; contents compared with `openai2026quasiRH`: independent (Layers 3 and 4 reverse §§4.3 and 4.2, as §4.4's use of §3.5 forces; Layers 6 and 8 have no counterpart; Layer 7 (§8) precedes Layer 9 (§5); Layer 10 merges §§6, 7 and 9–11).

Research link: Layer 10's `11/12` half-plane is Theorem 3.1 of the OpenAI 2026 quasi-Riemann preprint, the first stage of its `7/8` theorem, refined by Liu (2026). Layer 11 gives Vinogradov's conjecture (Tao 2015, Conjecture 1.1). Layers 6 and 8 feed Blomer–Goldmakher–Louvel (2014) and Dunn–Radziwiłł (2024). Rests on the README (Summary, Downstream consumers) and those sources.

## Not verifiable

- `patterson1977` Theorem 8.1 and (8.8)–(8.9), and `dunnradziwill2024` (5.7): the OCR and text extraction drop the conjugation bars. §8.7's `conj g` was checked only through `openai2026quasiRH` (5.9), line 1227.
- `openai2026quasiRH` (6.1), lines 2033–2038: the OCR of the display is garbled. §10.1's normalisation was checked against (6.2) and Lemma 6.2 (lines 2064–2073, 2186), not symbol by symbol.
- `kubota1968` locators (§§8.2–8.4): not in the sample and not checked.

## Source issues

- **Misprint** in goldmakherlouvel2013 at Definition 1 (3), p. 2: the source says the product `χ_𝔞 χ_𝔟` of two family characters in one class is primitive modulo `𝔞𝔟`; it should be `χ_𝔞` times the conjugate of `χ_𝔟`, as its own §2 verification on p. 5 computes; affects a stated result.
- **Error** in goldmakherlouvel2013 at Remark 3 and Corollary 1.2, p. 2: the source says the `n/d`-th powers of every `n`-th order family form a `d`-th order family and obey the sieve; it should be a hypothesis, since a quadratic family over `ℚ(i)` read as quartic has principal squares; affects a stated result.

## For the human reviewers

- Scope: the headline `11/12` half-plane rests on `openai2026quasiRH`, which README line 32 calls "an unrefereed preprint" (repository `openai/math`, revision `adc7f12`), and on `liu2026improved` (arXiv preprint 2610.12234v2). I found no refereed source stating it.
- Licence: `openai2026quasiRH` and `openai2026quasiRHalt` are recorded as `author-page` copies fetched from the GitHub repository `openai/math`. I did not read that repository's licence.
- Licence: `liu2026improved` line 25 says the result has been formalized in Lean ("[Liu26]"). I did not compare `Suggested.lean` with that formalization.
