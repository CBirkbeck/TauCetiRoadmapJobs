<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/18800#issuecomment-6940510396 -->
Red team round 1 pass b (claude) of eba3543

Verdict: needs_changes

**Source independence:** 11 passages compared with 4 sources, one shared (R01); largest share openai2026quasiRH, 64 of 160 locators; contents compared with openai2026quasiRH: layers independent (Layers 2–4 reorder its §4, Layers 6 and 8 have no counterpart, Layer 10 merges its §§6, 7, 9–11), section headings reused (R02).

**Research link:** The headline is Theorem 3.1 of OpenAI 2026 (`openai2026quasiRH`) with a second account in Liu 2026; it rests on Patterson 1977, Kubota 1969, Heath-Brown 2000, Blomer–Goldmakher–Louvel 2014 and Dunn–Radziwiłł 2024, and yields Vinogradov's conjecture (Tao 2015). Rests on the README's sources, which I read.

**For the human reviewers:** this review raises 4 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) §6.2's definition of a Hecke family follows its source clause by clause

   - **Location:** `packages/QuasiRiemannHypothesis/README.md:1197-1202`: "primitive Hecke characters
     `χ_𝔞` of trivial infinite type … with a finite group `G`, a homomorphism `[·]` from the ideals
     prime to `𝔠` to `G` and a map `C : G × G → μ_n` such that …".
   - **Claim:** the wording is the roadmap's own.
   - **Witness:** `goldmakherlouvel2013` lines 46-59 (Definition 1). Same clauses in the same order,
     same letters `G`, `[·]`, `C`; shared runs of 7 words ("primitive Hecke characters of trivial
     infinite type"), 7 words ("a finite group G, a homomorphism [·] from") and 9 words plus the
     formula ("to G and a map C … such that").
   - **Repair** (replace the sentence that starts "Define an *`n`-th order Hecke family*" up to the
     citation, keeping the citation):

     > Define an *`n`-th order Hecke family with respect to `𝔠`*: for each squarefree integral ideal
     > `𝔞` prime to `𝔠`, one primitive Hecke character `χ_𝔞` of `k` whose order divides `n` and whose
     > infinite type is trivial, subject to two conditions. *Reciprocity:* the ideals prime to `𝔠`
     > carry a multiplicative class map `𝔞 ↦ [𝔞]` into some finite group `G`, and there is a function
     > `C` on `G × G` with values in `μ_n`, for which `χ_𝔞(𝔟) = C([𝔞], [𝔟]) χ_𝔟(𝔞)` at every coprime
     > pair. *Primitivity within a class:* when `𝔞`, `𝔟` are coprime and `[𝔞] = [𝔟]`, the product
     > `χ_𝔞 χ_𝔟` has conductor exactly `𝔞𝔟`.

     Tested on the Check that follows it (`k = ℚ`, `n = 2`, `𝔠 = (4)`): `[a] = a mod 4`,
     `C = (−1)^((a−1)(b−1)/4)`; `χ₃χ₇ = (21/·)` has conductor `21` (one class), `χ₃χ₅ = (15/·)` has
     conductor `60 ≠ 15` (two classes). The rewritten definition gives the same verdicts.

2. **F02** (P3) Section headings are the source's result titles, and three of its coinages are never defined

   - **Location:** `packages/QuasiRiemannHypothesis/README.md`, headings of §§3.1, 3.2, 3.4, 4.4, 5.1,
     7.2, 7.3, 7.4, 9.2, 9.4, 10.2, 10.6 and the bold labels of §10.5; "the unmarked reflected energy"
     also at line 75.
   - **Claim:** each section is named by its mathematics, in the roadmap's own vocabulary.
   - **Witness:** `openai2026quasiRH` lines 22, 719, 853, 567, 999, 2518, 2569, 2627, 1041, 29, 33,
     3724, 3435, 3604 carry the same titles word for word (for example "Buffered zero-free bins",
     "Two saturated witnesses", "A retained integral and its exponent", "Outer row norms").
     "Unmarked", "saturated" and "buffered" are defined nowhere in the README.
   - **Repair:** rename, keeping the section numbers (no citation of this roadmap by number breaks):

     | § | New heading |
     | --- | --- |
     | 3.1 | Profiles with compact logarithmic support and their separation norms |
     | 3.2 | Seminorm bounds: separation, Sobolev, Mellin decay |
     | 3.4 | Decay of Fourier transforms and of Mellin kernels in terms of `L¹` seminorms |
     | 4.4 | The quadratic Gauss sum `Γ(c)` of `ℤ[ω]` in closed form |
     | 5.1 | Finite Euler products at the primes of a squarefree ideal |
     | 7.2 | A zero-free rectangle with margin, chosen by pigeonhole |
     | 7.3 | Upper bounds for the two polynomials in a zero-free rectangle |
     | 7.4 | A zero forces a large inverse polynomial and a large plain polynomial |
     | 9.2 | The functional equation of the completed sum through the cubic theta function |
     | 9.4 | Mean square of the completed sums over all frequencies |
     | 10.2 | The upper bound `Z^(1/4+ε)` for the probe from the theta side |
     | 10.6 | The comparison of the probe with the Mellin signal, with saving `1/4800` |

     §10.5 labels: "Tails of rapidly decaying kernels", "Shifting the contours of one zero-free
     rectangle", "The shifted integral and its exponent", "The residue at `w = 1`, `z = 1/6`",
     "Rows outside the intermediate range". Replace "the unmarked reflected energy" at line 75 by
     "the mean square of the completed sums". In §7.4 add one sentence: "The witnesses are called
     *saturated* because their lower bounds match the upper bounds of §7.3 up to `U^(ε')`."
     The order of §§10.1–10.7 is forced and stays: §10.2 and §10.3 need §10.1; §10.5 needs
     §§10.3–10.4; §10.6 needs §10.5; §10.7 needs §§10.2, 10.6.

3. **F03** (P3) `riemannZeta_ne_zero_of_eleven_twelfths_lt_re` carries a hypothesis `s ≠ 1` that is not needed

   - **Location:** `packages/QuasiRiemannHypothesis/Suggested.lean:109`
     (`(hs : 11 / 12 < s.re) (h1 : s ≠ 1)`); README §10.7, lines 2147-2149 ("and `s ≠ 1` … is a junk
     value and is not read").
   - **Claim:** the point `s = 1` must be excluded.
   - **Witness:** Mathlib `riemannZeta_one_ne_zero` (`Mathlib/NumberTheory/Harmonic/ZetaAsymp.lean:443`)
     gives the conclusion at `s = 1`; the pinned analogue `riemannZeta_ne_zero_of_one_le_re`
     (`Mathlib/NumberTheory/LSeries/Nonvanishing.lean:417`) has no such hypothesis. The sibling
     `re_mem_Icc_of_LFunction_eq_zero` (line 121) does read `ζ(1) ≠ 0`.
   - **Repair:** delete `(h1 : s ≠ 1)`; docstring: "`ζ(s) ≠ 0` for `Re s > 11/12`. At `s = 1`
     Mathlib's value `(γ − log 4π)/2` is nonzero (`riemannZeta_one_ne_zero`), so the statement has
     the shape of `riemannZeta_ne_zero_of_one_le_re`." README §10.7: "in particular
     `riemannZeta s ≠ 0` for `Re s > 11/12` (at `s = 1` by `riemannZeta_one_ne_zero`)". Tested at
     `s = 1`: `(0.5772 − 2.5310)/2 = −0.977 ≠ 0`; at `s = 2`: `π²/6 ≠ 0`.

4. **F04** (P3) Layer 6 Example: "§6.5 at `n = 6` contains §6.2 at `j = 3`" is false

   - **Location:** `packages/QuasiRiemannHypothesis/README.md:1328-1329`.
   - **Claim:** the sextic large sieve of §6.5 contains the quadratic large sieve.
   - **Witness:** §6.5 is stated for exponents `s ∈ {−1, 1}` only, with bound
     `K + D + (KD)^(2/3)`; at `K = D` it gives `D^(4/3+ε)`, §6.2 gives `D^(1+ε)` for `χ³`. Neither
     statement implies the other.
   - **Repair:** "The route to §6.5 at `n = 6` passes through §6.2: for even `n`, §6.4 treats the
     powers `χ^(n/2)`, here the quadratic symbols `χ_n(k)³`, by the corollary of §6.2, whose bound
     `K + D` is sharper than `K + D + (KD)^(2/3)`."

5. **F05** (P3) `baierbansal2018` Theorem 3 is described as a statement for `ℤ[i]`

   - **Location:** `packages/QuasiRiemannHypothesis/README.md:1180` ("`baierbansal2018` §3,
     Theorem 3, for `ℤ[i]`").
   - **Claim:** the cited theorem is the `ℤ[i]` case.
   - **Witness:** `baierbansal2018` lines 190-197: §3 is the large sieve for `ℝ^d`, points
     `x_i ∈ ℝ^d`, coefficients on `ℤ^d`; the source says it is used at `d = 2`.
   - **Repair:** "`baierbansal2018` §3, Theorem 3, for `ℝ^d` with the lattice `ℤ^d`, used there at
     `d = 2` for `ℤ[i]`".

One P2 (a definition that tracks its source clause by clause) and four P3. No statement of
`Suggested.lean` or of the README was found false; no supplier citation was found broken.

## The pass: `Suggested.lean`

No section `variable`; every binder is in the declaration's own signature. Compared with
`signatures.md` (11 elaborated types, none lost a binder); I ran no Lean.

| Declaration (line) | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| `ZeroFreeRightOf` (67) | `s − 2`; `0`; `1/(s−1)`; `s̄`; `ζ` | order `1` at `2` (fails at `σ = 3/2`, holds at `2`); `⊤` everywhere (never holds); `−1` at `1` (holds); junk `0` (holds); `−1` at `1`, `0` on `Re s ≥ 1` (holds at `σ = 1`) | agrees with §1.1 | none |
| `zeroFreeRightOf_LFunction_of_isAbelianGalois` (79) | `K = ℚ`; `K = F`, `χ = χ₋₃`; `σ₀ = 0`; `σ₀ = 1`; `χ₀ mod 4` | `X(ℚ) = {1}`, tautology; cofactor principal mod `3`, pole at `1`, `L(1, χ₋₃) = π/(3√3) ≠ 0`; hypothesis false (zero of `ζ ∣ ζ_K` at `1/2 + 14.13i`); known; Euler zeros on `Re s = 0`, outside `Re s > σ₀ ≥ 0` | true; `0 ≤ σ₀` is used by the route | none |
| `zeroFreeRightOf_heckeLFunctionC` (93) | trivial `χ`, any `𝔪`; junk `0` | `ζ_F` times Euler factors, pole order `−1`; `0` would fail the predicate, so not vacuous | as README §10.7 | none |
| `zeroFreeRightOf_LFunction` (102) | `N = 1`; `χ₀ mod 4` | `ζ`, order `−1` at `1`; `ζ(s)(1 − 2^(−s))` | as README | none |
| `riemannZeta_ne_zero_of_eleven_twelfths_lt_re` (109) | `s = 1`; `s = 2` | `−0.977`; `1.645` | true also at `s = 1` | R03 |
| `re_mem_Icc_of_LFunction_eq_zero` (121) | `N = 1`, `ρ = 1`; even primitive `χ`, `ρ = 0`; `ρ` with `0 < Re ρ < 1/12` | `ζ(1) ≠ 0`, no zero; excluded by `0 < Re ρ`; `1 − ρ̄` is a zero with real part `> 11/12` | true given §10.7 | none |
| `re_mem_Icc_of_heckeLFunctionC` (131) | `ψ = 1`; nontrivial `ψ`, `ρ = 0` | `ζ_F(0) = −1/6 ≠ 0`, trivial zeros at `−1, −2, …`; zero of `L` against the pole of `Γ(s)`, `Re = 0` excluded | true given §10.7 | none |
| `exists_ne_zero_ne_one_le_log_rpow` (143) | `q = 2`; `q = 3`; `χ mod 12` induced by `(·/3)`; `θ = 1/2` | no `χ ≠ 1`, vacuous; `n = 2`, `log 3 = 1.0986 > 0`; least `n` is `5`, prime to `12`; exponent `2` | true; hypothesis on `L(·, χ)` alone suffices (the `ζ` side is unconditional) | none |
| `exists_prime_ne_zero_ne_one_le_log_rpow` (155) | `𝔪₀ = (1)`; trivial `η`; `K = ℚ(i)`, `𝔪 = (3)` | `(0 + 2)^(1/(1−θ)) > 0`, finitely many `(𝔪, η)`; excluded by `η ≠ 1`; `η((1+i)) = (2/3) = −1`, norm `2` | true; `toMultiplicativeIdealWeight` is `0` off `𝔪.support` at the pin | none |
| `exists_jacobiSym_eq_neg_one_le_log_pow` (169) | `p = 3`; `p = 7` | `n = 2`, `(log 3)^12 = 3.09`; `n = 3` | `1/(1 − 11/12) = 12` | none |
| `exists_jacobiSym_eq_neg_one_le_rpow` (177) | `δ = 1`; small `δ` | `n ≤ p`; `(log p)^12 ≪_δ p^δ` | corollary of line 169, several steps; kept as the named conjecture | none |

Headline theorems of the README (its Summary's end theorems): the `11/12` half-plane (stated,
lines 93, 102, 109), the zero strip (121, 131), the conditional least-value bound (143, 155), the
least nonresidue and Vinogradov's conjecture (169, 177), the transfer (79). All are stated. The
module docstring names what is not statable; I confirmed at the pins that neither library has a
`K`-Bessel function or a hyperbolic 3-space (grep: no hit). No padding found: no declaration is a
one-tactic consequence of a pinned lemma or mirrors a Check.

## The pass: README targets

| Target | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| §1.2 abscissa | empty family; `{s − 3/4}`; family with `0` | `1/2`; `3/4`; unbounded, excluded by the hypothesis | holds |
| §1.3 continuation | `E* = min(β* − σ₀ − ω, σ)`; probe data | `> 0`, `β* − E* > σ₀ > 1/2`; `C(11/12) = 1/4` | agrees with `openai2026quasiRH` lines 316-368 |
| §1.4 | `Aτ ≤ m/4`, then `N` | first term `Z^(C(β*) − 3m/4)`, second below `C(β*) − m/2` | holds |
| §2.1 | `(ℚ, 2, −1)`; `(ℚ, 2, 5)`; `(F, 6, −1)` | conductor `4∞`; `5`; `−1` at norm `7`, `+1` at norm `13` | holds |
| §2.2–2.3 | `1 + 3ω`; `−2`; units | `ω ↦ 2` in `𝔽₇`; `χ_p(2) = ω`, `χ_p(3) = −ω²`, `χ_p(−1) = −1`; only `1` primary | holds |
| §2.5 | `d = 1 + 3ω`; `π = −2 + 3ω` | `1 − λ² + λ³ = 1 − 6ω ≡ d (mod 9)`, `(ω/d)₃ = ω²`, `(λ/d)₃ = 5² = 4 = ω²`; `12⁶ ≡ 1 (mod 19)` | holds |
| §3.1–3.5 | `W_G`; `m ≡ 1`, `m = s`; `H = 3` | `(2√π)⁻¹ · 2√π e^(s²)`; `W(1/x)`, `(y∂_y W)(1/x)`; `2` ideals against `1.81` | holds |
| §4.1–4.3 | `p = 1 + 3ω` | `Tr(1/(pλ)) = −3/7`, `γ_3 = (−3/7) i = i`; `γ_6 = −1/√7`; `γ_1γ_2 = −α ω i = −0.6547 + 0.7559i` | holds |
| §4.4 | `c = 1, −1, λ, −λ, −3, 1+3ω, 4+3ω`; four-term sum at `c = 1` | `1, 1, i, −i, 1, i, 1`; `(1 + 1 + i − i)/2 = 1` | holds; `τ(λ,λ) = −1`, `τ(−1,λ) = −1` |
| §4.5–4.6 | `a = 1+3ω`, `b = −2+3ω` | `χ_b(a) = 3³ = 8 = −ω²`, `χ_a(b) = 4 = ω²`, ratio `−1 = τ(λ, λ)`; `G(v²) = χ̄_v(4)² = χ_v(4)` | holds |
| §5.1 | `𝔯 = 𝓞`; `(2)`, `a = 1`; `σ = −1` | `D = 1`; zeros on `Re s = 0`; `1 − p` | holds |
| §5.2 | `K = ℚ`, `ψ = 1`, `s = −1/10` | `ζ(−0.1) = −0.4172`, `ℒ = 0.5099`; bound `9.89`; `(1 − x)^f ≤ 1 − x^f` | holds; matches ExplicitZetaBounds §3.2 as stated on main |
| §5.3 | trivial character | `|(s − 1)/(s + 1)| ≤ 1` on `Re s ≥ 0` | holds |
| §5.4–5.5 | `ℚ(√2)`, `α = 1 + 3√2`; unramified `p` | `N α = −17`, `χ(17) = −1`; `∏_ψ (1 − χψ(p) p^(−s)) = (1 − χ(p)^f p^(−fs))^g` | holds |
| §6.1 | `J = 1`; `z_j = j/N` | `≍ Q^d`; `N²` | holds |
| §6.2 | `ℚ`, `(4)`; `ℚ(i)` squares | conductors `21`, `60`; `N³` against `N^(2+ε)` | holds |
| §6.3 | `(10)`, `𝔟 = (1 + 3ω)` | `10² ≡ 2 = ω (mod 7)`; cubing maps `1 + λ²` onto `1 + λ⁴` | holds |
| §6.5 | `M = N` | `N^(4/3+ε)` | holds; Example below it: R04 |
| §7.1–7.4 | twist `y^(iv)`; `I = ⌈1/ε⌉ + 2`; `ε₀ = ε'/(48 r_max)` | `ζ(s − iv)⁻¹`; `M_I > a₀ + 1 + ε`; `12εr ≤ ε'/4`, `24ε ≤ ε'/2`, total `< ε'` | holds |
| §8.1 | two matrices | `(c/a)₃ = ω`, `(b/d)₃ = 4⁴ = 9 = ω`, `(c/d)₃ = 3⁴ = 3 = ω²`; `κ_P = ω`, `κ = ω²` | holds |
| §8.3–8.5 | `SL₂(ℤ[i])`; index counts | `φ(1) = 4 ζ_K(0) = −1`; `648/24 = 27`, `324/27 = 12` | holds |
| §8.7 | `c = 1 + 3ω` | `g = 2.3705 − 1.1751i`, `g̃ = 0.8960 − 0.4441i`, `|g|² = 7`; `27 · 3^(−1/2) = 3^(5/2)` | holds |
| §9.2 | `V_G`; gamma quotient | `√π e^(1/16) = 1.887`; poles at `−5/6, −7/6, …`; `|ζ_t| ≤ 1/81` | holds |
| §10.3 | `b_p³`; `(s, 1, 1/6)` | `ᾱ⁶η⁶ = a_p²`; `1/6 ≥ 33/200` | holds |
| §10.5–10.6 | probe data | `C(s) = s − 2/3`; `13/150 − 1/4 + 1/50 = −43/300`; `7/4 + 0.501 − 4 = −1.749`; `3063/75000`; `46 · 10⁻⁶ < 1/4800` | holds; agrees with `openai2026quasiRH` lines 3729-3760 |
| §11.1–11.3 | `θ = 1/2`; `bimsissac2017` exponents | GRH; `24`, `48`, `16`, `32` | holds |

## Dependency check

```text
depcheck: 261 roadmaps, 2606 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. The roadmap is at position 296 of the merge order; its latest
suppliers are AnalyticNumberTheoryPartIII (295) and ExplicitZetaBounds (289).

## Verified sound

- **Declarations read:** 11 of 11 (the whole file). Imports, namespace, docstrings, `theorem`
  only, no `set_option`, no sorry'd data.
- **Targets read:** the whole README, lines 1-2361, all 55 targets.
- **Pinned declarations:** 70 names grepped at the pins (39 Tau Ceti, 31 Mathlib), all present,
  including `toMultiplicativeIdealWeight` (zero off `𝔪.support`), `eulerCorrection_ne_zero`
  (`0 < Re s`), `kroneckerWeber`, `NumberField.Ideal.tendsto_norm_le_div_atTop`.
- **Sibling citations checked:** 46 sections in 15 roadmaps, each located at main or at its open
  head (the heading, and the statement wherever the README quotes one): LFunctions Layers 4–8 (`heckeData`, `gaussSum`, `gaussSum_mul`, `norm_gaussSum`,
  `grossencharacterData`); ZerosOfLFunctions §§1.6, 3.1, 4.4, 4.5, 8.4–8.6, Layer 9;
  ExplicitZetaBounds §3.2 (hypotheses match the README's contract); ClassicalArithmeticCompletion
  §§1.12, 1.23, 1.33, 1.34, 1.38, 1.43, 1.52, 1.72, 1.75; ClassFieldTheory Layer 11, §13.1;
  ThetaSeries 1A; CharacterSumsOverFiniteFields §§1.4, 1.5, 3.4 (duplication formula in the cited
  form, for every `χ`); BianchiModularForms §§0.3, 0.4; MaassForms §§7.1, 7.3;
  AutomorphicFormsOnReductiveGroups §4.5 (`K_ν` for complex `ν`); AutomorphicSpectralTheory
  §§0.15, 0.16, 1.15a; SieveMethodsAndPrimePatterns §§2.2, 2.3, 2.7, 2.9
  (`SieveApplications.leastNonresidue`, a roadmap name, not a pin); AnalyticNumberTheoryPartI
  §§0.34, 1.6; AnalyticNumberTheoryPartII §5.29; AnalyticNumberTheoryPartIII §§8.2, 9.2.
- **Ownership:** searched main and the open heads by object for the Kubota character, the cubic
  theta function, Fisher–Friedberg characters, large sieves over number fields, a zero-free
  half-plane predicate, the zero abscissa and the least nonresidue bound. No second owner.
  ExplicitPrimeCounting and ExplicitMultiplicativeFunctions mention the `7/8` half-plane only as
  not stated.
- **Locators verified:** 84. `openai2026quasiRH`: 39 labelled results and 26 numbered displays
  against printed pages, all correct (Lemma 5.8 and (10.3) could not be located in the OCR text); `milnecft2020` Theorem 3.5 and Remark 3.8 (printed p. 158);
  `goldmakherlouvel2013` Definition 1, Remark 3, Theorem 1.1, Corollary 1.2; `kubota1969`
  Propositions 1–2 (pp. 24–25), Theorem 6 (p. 50); `patterson1977` Theorem 8.1, Lemma 7.2,
  Theorem 9.1, Table II; `dunnradziwill2024` (5.6)–(5.8); `heathbrown2000` Theorem 2;
  `gaozhao2024` Lemma 2.9. One description wrong: R05.
- **Checks tested:** over 80 Checks and worked values recomputed (the two tables above); one
  false Example (R04).
- **Policy:** the pull request changes only the package folder; no pull-request number, process
  word or machine path in the README or the Lean file; `plan.json` has `"gaps": []` and the
  README declares none.

## Not verifiable

- The proof of the `11/12` half-plane itself. I checked the README's statements against
  `openai2026quasiRH` and recomputed its closed-form numbers, but the exponent `E(d; R, g)` of
  §10.5 and the rates `33/50` and `62/75` of §10.6 were not rederived.
- Conjugation bars. The cached texts of `openai2026quasiRH` and `patterson1977` are OCR and lose
  overlines, so `conj g(·, c)` in §8.7, `χ̄_p(u)` in `D_p` and `ᾱ` in `a_p`, `b_p` (§10.3) could
  not be compared with the print. The README's own Checks on them are self-consistent.
- `kubota1968` locators and the equation numbers of `liu2026improved`: only their existence was
  checked, not the statements.
- Elaboration: I ran no Lean; the signatures come from the worker's `signatures.md`.

Source independence: 11 passages compared with 4 sources, one shared (R01); largest share openai2026quasiRH, 64 of 160 locators; contents compared with openai2026quasiRH: layers independent (Layers 2–4 reorder its §4, Layers 6 and 8 have no counterpart, Layer 10 merges its §§6, 7, 9–11), section headings reused (R02).

Research link: The headline is Theorem 3.1 of OpenAI 2026 (`openai2026quasiRH`) with a second account in Liu 2026; it rests on Patterson 1977, Kubota 1969, Heath-Brown 2000, Blomer–Goldmakher–Louvel 2014 and Dunn–Radziwiłł 2024, and yields Vinogradov's conjecture (Tao 2015). Rests on the README's sources, which I read.

## Source issues

- **Error** in goldmakherlouvel2013 at Remark 3 and Corollary 1.2, printed p. 2: the source says the `n/d`-th powers of an `n`-th order family always form a `d`-th order family; it should be assumed that the powers stay primitive within a class (a quadratic family read as fourth-order has trivial squares); affects a stated result.

## For the human reviewers

- **Scope.** The headline theorem's only sources are unrefereed 2026 preprints: `openai2026quasiRH`
  and `openai2026quasiRHalt` (a GitHub repository) and `liu2026improved` (arXiv). No refereed
  source states it (`packages/QuasiRiemannHypothesis/README.md:32-34`).
- **Licence.** `sources.toml` records the two OpenAI preprints as `author-page` copies fetched
  from a public repository; I found no stated licence for them.
- **Scope.** The source's main theorem (`Re s > 7/8`) is assigned to
  QuasiRiemannHypothesisPartII (`README.md:132-137`), which exists neither on main nor as an open
  pull request.
- **Not tested.** The cached text of `openai2026quasiRH` is OCR of an image scan; overlines and
  some displays are unreadable, so the wording and formula comparison is partial for §§8.7, 9.2
  and 10.3.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "eba3543bd348ddb197b82d96e7b2d38afbc0f035", "job": "RT-QuasiRiemannHypothesis~1b", "model": "fable", "worker": "chris-x26"} -->
