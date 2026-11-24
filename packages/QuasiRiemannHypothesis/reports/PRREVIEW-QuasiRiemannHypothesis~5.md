# Review of QuasiRiemannHypothesis (pull request #3027 at 8d0b573)

**Verdict:** accepted

**Summary.** Accepted. The only change to this roadmap is the new §5.4a. It identifies the characters of the abelian extensions `L/K`, with `L` abelian over `ℚ`, with the primitive norm-composed characters of `K`. Statements (a) and (b), the route and the Checks were recomputed and are correct. The cited source, Milne's Chapter V, Proposition 3.3 and Example 3.2 on p. 157, supports them. The review also gives three small corrections and one format note, none blocking:
- a Tau Ceti declaration is cited as LFunctions Layer 5, which does not state it;
- a Check names no character;
- the description says something about the added sections that §5.4a contradicts.

The human reviewers still have the scope and licence questions carried over from earlier reviews, and one new manifest question.

## C01 — `PrimitiveRayClassCharacter.of_induced` is credited to LFunctions Layer 5, which does not state it; it is a Tau Ceti declaration at the pin

A reader can follow §5.4a's *Needs:* line (lines 950–951) or the sentence added to the LFunctions contract (lines 2505–2507) to LFunctions Layer 5. There they find `PrimitiveRayClassCharacter.of`, but no statement that a character and the character it induces have the same primitive character. The LFunctions README, on main and at its open head, never mentions `of_induced`. The pinned Tau Ceti proves it as `TauCeti.LFunctions.PrimitiveRayClassCharacter.of_induced` (`TauCeti/NumberTheory/LFunctions/Hecke/Primitive.lean:169`).

Two changes would make the citation resolve:
- list `of_induced` in the From Tau Ceti contract, beside `.of`, `.conductor` and `.character` (line 2453);
- point the *Needs:* line of §5.4a there.

The sentence added to the LFunctions contract can then go.

## C02 — The last Check of §5.4a names no character, so it only restates (a), and its parenthetical also fits a cubic residue character that is norm-composed

Lines 944–946 describe "a ray-class character of order `3` whose class field is not abelian over `ℚ`". By (a), such a character is excluded as soon as it is described this way, so the Check tests nothing.

The parenthetical "a cubic residue character" also fits `𝔞 ↦ (ω/𝔞)₃`:
- its class field `F(ω^(1/3)) = ℚ(ζ₉)` is abelian over `ℚ`;
- it is the primitive character of `χ ∘ N` for the cubic character `χ` modulo `9` with `χ(2) = ω²`. Both take the values `ω, ω², ω, 1` at the primes of norm `4, 7, 13, 19`.

A Check that computes something: `𝔞 ↦ (2/𝔞)₃` takes the value `ω²` at `1 + 3ω` (in `𝔽₇` with `ω ↦ 2`, `2² = 4 ↔ ω²`) and the conjugate `ω` at `1 + 3ω²`. Both primes have norm `7`, and every `χ ∘ N_{K/ℚ}` takes the single value `χ(7)` at both. So `(2/·)₃` is not norm-composed, while `(ω/·)₃` is. Stating that pair would make the Check tell the two kinds apart.

## C03 — The description says each section added to a general roadmap is a published theorem in its source's generality, but the section added here says it is not printed in its source

The description says "50 existing roadmaps receive 216 sections, each a theorem published before 20 November 2026 and stated in the generality of its source, with that source named". That covers this folder's §5.4a. But §5.4a says at line 917 that (a) and (b) are `milnecft2020` Chapter V, Proposition 3.3, applied to `ℚ(ζ_m)/ℚ`, and are "not printed there as a statement". It also carries over the identification that GeneralizedRiemannHypothesisFromWindowBounds §5.6 states on main.

A clause like this one would make the description true of this folder: "QuasiRiemannHypothesis receives §5.4a, the identification of the characters of the abelian extensions `L/K`, with `L` abelian over `ℚ`, with the primitive norm-composed characters. It is a consequence of Milne V.3.3, moved from GeneralizedRiemannHypothesisFromWindowBounds §5.6."

## N01 — `heilbronn1967` is cited for the factorization of the zeta function of an abelian extension with only the chapter's pages (Chapter VIII, pp. 204–230; lines 917 and 2665)

A section or theorem number would let a reader find it.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| §5.4a (a) | `K = ℚ(i)`, `L = ℚ(ζ₁₂)`, `m = 12` | `Gal(ℚ(ζ₁₂)/K) = {1, 5}`; `φ(5) = −1` extends to `(·/3)` or `(·/3)χ₋₄`; `χ₋₄ ∘ N` trivial on `ℚ(i)`, both give `((·/3) ∘ N)*` | holds; `χ` not unique, primitive character is | none |
| §5.4a (b) | `K = ℚ(i)`, `m = 3`, `χ = (·/3)` | restriction sends `a = 5` to `2 mod 3`, `χ(2) = −1`: `φ` nontrivial, `φ̃ = ((·/3) ∘ N)*`, conductor `(3)` | holds | none |
| §5.4a route, Frobenius | `𝔭 ∤ m` of degree `f` | `Frob_𝔭` acts on `ζ_m` by `N𝔭 = p^f`; `milnecft2020` lines 7004–7027 (V Ex. 3.2, Prop. 3.3, p. 157) | holds; locator correct | none |
| §5.4a Check 3 | `(1 + i)` in `ℚ(ζ₁₂)/ℚ(i)` | `2` has `e = f = 2` in `ℚ(ζ₁₂)`: inert in `L/K`, `φ = −1 = (2/3)`; `ᾱ⁴ = −1` on `𝔽₉ˣ`, so conductor `(3)` | holds | none |
| §5.4a Check 4 | `(2/·)₃`, `(ω/·)₃` on `F` | `(2/·)₃ = ω², ω` at `1 + 3ω`, `1 + 3ω²`; `(ω/·)₃ = χ ∘ N`, `χ(2) = ω²` mod `9`: `ω, ω², ω, 1` at norms `4, 7, 13, 19` | true; names no character | C02 |
| §2.2 primary | `a + bω`, units | `1 + 3ω` (norm `7`), `−2` (norm `4`) primary; six units distinct mod `3`, only `1 ≡ 1`; openai p. 10 lines 409–414 | holds | none |
| §3.2 tail bound | norm with `(2π)^(−d)` | `∫_{|t|>T₁} |ŵ|(1+|t|)^J ≤ T₁^(−N) ∫ |ŵ|(1+|t|)^(J+N) = (2π)^d T₁^(−N) ‖w‖_{J+N,sep}`; Lemma 4.5 pp. 17–18 | holds | none |
| §3.3 Gaussian weight | `s = 0, 1, 1/2 + it` | `MW_G(0) = 1`, `MW_G(1) = e`, `e^(1/4 − t² + it)`; `exp(−(log y)²)` gives `√π e^(s²/4)` | holds | none |
| §4.1 Gauss sums | `p = 1 + 3ω`, `j = 6, 3` | `γ₆ = −1/√7`; `γ₃² = χ_p(−1)³ = −1`; openai p. 11 line 451 | holds | none |
| §4.4 `Γ`, `τ` | `λ, −λ, −1, 1 + 3ω` | `Γ(λ) = (1 + 2ω)/√3 = i`, `Γ(−λ) = −i`, `Γ(−1) = 1`, `Γ(1 + 3ω) = i`; `τ(λ,λ) = τ(−1,λ) = −1`; Lemma 4.3 p. 14 | holds | none |
| §4.5 reciprocity | `a = 1 + 3ω`, `b = −2 + 3ω` | `𝔽₁₉` (`ω ↦ 7`): `χ_b(a) = 8 = −ω²`; `𝔽₇` (`ω ↦ 2`): `χ_a(b) = ω²`; ratio `−1 = τ(λ,λ)`; Lemma 4.4 p. 15 | holds | none |
| §4.5 `G(v²)` | wrong model `G = χ_c(4) Γ` | `χ̄_v(4)² Γ(v²) = χ_v(4)`, as openai line 663; without the bar `χ̄_v(4)` | the bar is forced | none |
| §4.3 conjugate | `p = 1 + 3ω` | `−α(p)ωi ≈ −0.6547 + 0.7559i` against `−α(p)ω²i ≈ −0.3273 − 0.9449i` | holds | none |
| §4.6 | `p = 1 + 3ω`, `n = −2 + 3ω`; `n = p` | `(−ω²)ω = −1 = R(p, n)`; at `n = p` both sides `0`; openai p. 17 line 703 | holds | none |
| §6.1 | `Λ = ℤ`, `z_j = j/N`; asymmetric `B` | `J = 1` gives `≍ Q^d`; `Q < N` gives `N²`; `m = (1/2, 1)`: `B(m, e₂) = 5/4`, phase `i` | holds; Lemma 6.1 p. 47 | none |
| §7.2 bins | `I = ⌈1/ε⌉ + 2` | failures give `M_I > a₀ + (I−1)ε ≥ a₀ + 1 + ε > 1`, against `M_j < 1`; Lemma 8.1 p. 56 | holds | none |
| §7.4 | floors `51/100`, `1/2 + 10⁻⁶` | `δ > 1/50`, `m − 1/2 < 25C''ε'`; else `2.5·10⁵ C''ε'`; Prop. 8.3 p. 59 | holds | none |
| §8.7 coefficient | `c = 1 + 3ω` | computed `g̃(c) = 0.89595 − 0.44415i`, `g̃³ = 0.18898 − 0.98198i = −α(c)`, `|g̃ − conj g̃| = 0.888` | holds | none |
| §10.1 exponents | `t ↦ t + 1/2` | `q_n^(−3(t+1/2)+1/2) = q_n^(−1−3t)`, `q_c^(−1/2−t)`; openai (6.1) p. 46 | holds | none |
| §10.2 low estimate | `X = Y = Z^(1/2)` | `Q^(−1/2)(Q/Y)^(1/2) Z^(1/2+ε/2) = Z^(1/4+ε/2)`; `1/√91 ≈ 0.105 ∈ [1/13, 1]`; Prop. 6.3 p. 49 | holds | none |
| §10.4 `R(δ)` | `δ = 1/50, 2/3, 1` | `R = 1, 2/3, 1/2`; Prop. 9.2 p. 67, floor `#B ≪ U` | holds | none |
| §10.6 constants | loss budget | `46·10⁻⁶ < 2.08·10⁻⁴`; `1/24 − 62/75000 = 1021/25000`; `m/2 = 1/4800`; openai lines 3751–3760, p. 83 | holds | none |
| §5.2 strip bound | `K = ℚ`, `s = −1/10` | `ζ(−0.1) = −0.4172`, `|ℒ| = 0.5099`; `ζ(1.1) = 10.5844`, bound `61.385` | holds | none |
| `ZeroFreeRightOf` (§1.1) | `s − 2`, `0`, `1/(s − 1)`, `s̄` | orders `1`, `⊤`, `−1`, junk `0` | holds | none |
| `zeroFreeRightOf_LFunction_of_isAbelianGalois` | `K = F`; `σ₀ = 1`; `σ₀ < 1/2` | `L(1, χ₋₃) = π/(3√3) ≠ 0`; `ζ` zero `1/2 + 14.13i` breaks the hypothesis | holds | none |
| `zeroFreeRightOf_heckeLFunctionC`, `zeroFreeRightOf_LFunction` | `χ₀` mod `4` | `ζ(s)(1 − 2^(−s))`: zeros at `Re s = 0`, pole order `−1` at `1`; `C_I(11/12) = 1/4` | holds | none |
| `riemannZeta_ne_zero_of_eleven_twelfths_lt_re` | `s = 1, 2` | Mathlib `ζ(1) = (γ − log 4π)/2 ≈ −0.977`; `ζ(2) = π²/6` | holds | none |
| `re_mem_Icc_of_LFunction_eq_zero`, `re_mem_Icc_of_heckeLFunctionC` | `ζ`; `K = ℚ(√2)` | `1/2 + 14.13i ∈ [1/12, 11/12]`; `ζ_K` order `1` at `0`, excluded by `Re ρ > 0` | holds | none |
| `exists_ne_zero_ne_one_le_log_rpow` (§11.2) | `q = 12`; `(·/7)` | least value outside `{0, 1}`: `5` (primitive `(·/3)`: `2`); `3` | holds | none |
| `exists_prime_ne_zero_ne_one_le_log_rpow` (§11.2) | `K = ℚ`, `𝔪 = 3∏_{p≤y} p` | least prime in `(y, 2y]`; `log N𝔪₀ ≍ y`, bound `≫ y²`; a conductor bound `log 3` fails | holds | none |
| `exists_jacobiSym_eq_neg_one_le_log_pow`, `…_rpow` (§11.3) | `p = 7`, `3` | `n(7) = 3 ≤ C (log 7)^12 ≈ 2948 C`; `n(3) = 2` | holds | none |

- The previous review raised no finding, so there was nothing to re-check.
- Source locators read against the text: 21 in total.
  - `openai2026quasiRH`: §4.1 pp. 10–11; Lemmas 4.3–4.5 pp. 14–18; §4.2 p. 17; (6.1)–(6.2) pp. 45–46; Lemma 6.1 p. 47; Prop. 6.3 p. 49; Lemma 8.1 p. 56; Prop. 8.3 p. 59; Prop. 9.2 p. 67; the §11 table p. 82; Prop. 11.2 p. 83.
  - `milnecft2020`: V Ex. 3.2 and Prop. 3.3, p. 157.
  - `dunnradziwill2024`: (1.4)–(1.8) and (5.6)–(5.8).
  - `lamzourilisound2015`: Thm 1.1 and Lemma 2.2.
  - Each locator is at the stated place.
- Library declarations opened at the pinned Tau Ceti: 8.
  - In `NumberTheory/ClassFieldTheory/Global/AdmissibleModulus/Reciprocity.lean`: `rayClassArtinMap` (:128), `rayClassArtinMap_surjective` (:161), `rayClassArtinMap_idealClass` (:216).
  - `abelianConductor` (`…/AdmissibleModulus/Basic.lean:193`).
  - `kroneckerWeber` (`…/ClassFields/KroneckerWeber.lean:178`).
  - `RayClassGroup.hom_ext` (`NumberTheory/NumberField/Global/RayClass/Integral.lean:244`).
  - `RayClassCharacter.induced` (`…/RayClass/Character/Basic.lean:91`).
  - `PrimitiveRayClassCharacter.of_induced` (`NumberTheory/LFunctions/Hecke/Primitive.lean:169`).
- Cross-roadmap citations resolved:
  - ClassFieldTheory C.6, Layer 12 and §13.1 (on main);
  - LFunctions Layer 5 (on main): it has `of`, but not `of_induced` (C01);
  - all 17 supplier roadmaps named in the contracts are on main;
  - GeneralizedRiemannHypothesisFromWindowBounds and ConsequencesOfTheRiemannHypothesisForDirichletLFunctions, at this head, cite §5.4a;
  - `SieveApplications.leastNonresidue` (line 2368) is SieveMethodsAndPrimePatterns §2.9's own definition (its `Suggested.lean` line 260).
- The README at the merge base and at the head have the same 11 layers, none removed or retitled. Each of the 8 deleted lines reappears in extended form, and one heading is added (§5.4a).
- Automatic checks: all passed at this head. Dependency check output: `depcheck: 132 roadmaps, 1477 edges, 0 problem(s)`.
- Elaboration of `Suggested.lean`, which this pull request does not change:
  - `lake env lean` gives 10 `declaration uses 'sorry'` warnings and nothing else;
  - `#check @` of all 11 declarations matches the README statements;
  - the one-tactic probe (`rfl`, `simp`, `infer_instance`, `decide`, `norm_num`) closes none of the 10 theorems.

Overlap check: I read the scope of these roadmaps:
- ZerosOfLFunctions (main and open head): §8.8 uses `rayClassArtinMap` for effective Chebotarev, which is not shared;
- LFunctions (main and open head): it owns `PrimitiveRayClassCharacter`, which this roadmap consumes;
- CongruenceSpectralGap and AutomorphicLFunctionsAndLocalFactors: nothing shared;
- ArtinRepresentations (open): over `ℚ` only, a one-dimensional representation's Dirichlet character, defined in its conventions; it does not own the abelian-`K` statement;
- RiemannHypothesisStatementsAndConsequences: uses `of_induced` and does not restate §5.4a;
- GeneralizedRiemannHypothesisFromWindowBounds: held the identification on main, and at this head cites §5.4a;
- ClassFieldTheory and AnalyticNumberTheoryPartI §2.42, for the same object: neither states it.

The identification of §5.4a has one owner, this roadmap, §5.4a.

Source independence: 13 passages compared with 4 sources (`openai2026quasiRH` lines 409–414, 567–581, 620–634, 696–706, 719–759, 2089–2099, 2518–2534, 2627–2642, 2982–2996, 3724–3760; `milnecft2020` lines 7004–7027; `dunnradziwill2024` lines 205–234, 1228–1254; `lamzourilisound2015` lines 55–62, 236–244). They share no wording beyond formulas and standard names. The largest share of locators belongs to `openai2026quasiRH`: 67 of 153. Contents compared with `openai2026quasiRH`: independent. Its §4 is split across Layers 2–5, its §5 reflection follows the zero detection of its §8 as Layers 9 and 7, Layer 8 has no counterpart, and Layer 6 draws on three of its sections. §5.4a adds no layer.

Research link: Layer 10 is Theorem 3.1 of the OpenAI 2026 preprint, the first stage of its `7/8` theorem, retold by Liu (2026). Layer 11 gives Vinogradov's conjecture (Tao 2015, Conjecture 1.1). Layers 6 and 8 are the tools of Blomer–Goldmakher–Louvel (2014) and Dunn–Radziwiłł (2024). §5.4a is class field theory (Milne, Chapter V, 3.2–3.3). This rests on the README and those sources.

## Not verifiable

- `heilbronn1967` (Cassels–Fröhlich, Academic Press 1967, Chapter VIII): no copy is in the sources cache and the roadmap's sources manifest does not record it, so it was not read. It supports background only, not (a) or (b) of §5.4a.
- `openai2026quasiRH` lines 715–716: the OCR loses the definition of the separation norm. So I could not settle whether its (4.10), p. 18, lacks the factor `(2π)^d` that §3.2 adds.
- `openai2026quasiRH` lines 625, 634 and 703, and `dunnradziwill2024` line 1242: the extractions drop overbars. The conjugates in `G`, in §4.6 and in §8.7's `τ` were checked by computation (openai line 663 forces the bar in `G`), not read. `patterson1977` was not re-read this round.

## Source issues

- none

## For the human reviewers

- Scope: the headline `11/12` half-plane rests on `openai2026quasiRH`, which README lines 19–20 call "an unrefereed preprint", and on `liu2026improved` (arXiv 2610.12234v2). The README and the cached texts name no refereed source for it.
- Licence: `openai2026quasiRH` and `openai2026quasiRHalt` were fetched from the `openai/math` repository on `raw.githubusercontent.com` (line 2 of each text). The licence of that repository was not read.
- Licence: `liu2026improved` says its result is formalized in Lean. `Suggested.lean` was not compared with that formalization.
- Manifest: `heilbronn1967`, which this pull request adds (README lines 917 and 2665), is not recorded in the roadmap's sources manifest, so its licence and status are unrecorded.
