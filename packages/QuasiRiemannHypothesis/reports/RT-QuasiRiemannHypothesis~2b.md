<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/18800#issuecomment-6941628154 -->
Red team round 2 pass b (claude) of 9c220cb

Verdict: needs_changes

**Source independence:** 13 passages compared with 5 sources, and a scan for shared runs of six words between the README and ten source texts, none shared (longest prose run 10 words, a formula, `openai2026quasiRH` line 3446; the name of a definition, 9 words, `goldmakherlouvel2013` line 46); largest share `openai2026quasiRH`, 63 of 142 locators; contents compared with `openai2026quasiRH`: independent (Layers 2–5 regroup its §4, Layers 6 and 8 come from other sources, its §8 is Layer 7 and precedes its §5 as Layer 9; the order inside Layers 9 and 10 is forced by their `*Needs:*` lines).

**Research link:** The headline is Theorem 3.1 of OpenAI 2026 with a second account in Liu 2026; Layers 6 and 8 are the large sieves and cubic theta function of Heath-Brown 2000, Blomer–Goldmakher–Louvel 2014, Kubota 1969 and Patterson 1977 used by Dunn–Radziwiłł 2024; §11.2 extends Lamzouri–Li–Soundararajan 2015. Rests on the README's sources, which I read.

**For the human reviewers:** this review raises 5 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P1) §6.2: the primitivity axiom is stated for `χ_𝔞 χ_𝔟`; the Fisher–Friedberg characters satisfy it only for `χ_𝔞 χ̄_𝔟`

   - **Location:** `packages/QuasiRiemannHypothesis/README.md:1250` ("The *primitivity axiom*: at every
     such pair with `[𝔞] = [𝔟]`, the conductor of `χ_𝔞 χ_𝔟` is `𝔞𝔟`") and :1260 ("The Fisher–Friedberg
     characters of §6.3 form an `n`-th order Hecke family", §6.3 having `n ≥ 3`).
   - **Claim:** with this axiom the characters of §6.3 are an `n`-th order Hecke family.
   - **Witness:** `K = F`, `n = 3`, `S = {(λ)}`, `𝔠 = (9)` (the Check of §6.3), `𝔞 = (−2)`, `𝔟 = (7)`:
     squarefree, coprime, one ray class (`−2 · 7⁻¹ ≡ −8 ≡ 1 mod 9`). `χ_𝔞 χ_𝔟 = (14 w λ^(2j)/·)_3` for a
     unit `w`; `14w ≢ ±1 (mod λ³)` for all six `w`, so `λ` divides the conductor.
   - **Why:** `F(∛y)/F` is unramified at `λ` exactly when `3 ∣ v_λ(y)` and the unit part of `y` is `≡ ±1 (mod λ³)`.
     Here `14 ≡ −1 + λ² (mod λ⁴)`, `14ω ≡ −1 + λ (mod λ²)`. The quotient `−2/7 ≡ 1 (mod 9)` is a local cube,
     so `χ_𝔞 χ̄_𝔟` has conductor `(14) = 𝔞𝔟`. The source's own verification computes the quotient
     (`goldmakherlouvel2013` lines 199–232), and `bgl2014` Lemma 2.3 (line 305) is stated for `χ^j_(𝔟₁) χ̄^j_(𝔟₂)`;
     Definition 1 (3) of `goldmakherlouvel2013` (line 58) prints the product, which is the same thing only for `n = 2`.
   - **Repair:**
     1. :1250–1251, replace the sentence by: "The *primitivity axiom*: at every such pair with `[𝔞] = [𝔟]`,
        the primitive character inducing `χ_𝔞 χ̄_𝔟` has conductor `𝔞𝔟` (`goldmakherlouvel2013` Definition 1, p. 1,
        which prints `χ_𝔞 χ_𝔟`; its §2, pp. 4–5, and `bgl2014` Lemma 2.3, p. 7, prove the form with the
        conjugate, and the two agree for `n = 2`)."
     2. Add to the Checks of §6.2: "`k = F`, `n = 3`, `𝔠 = (9)`, the characters of §6.3, `𝔞 = (−2)`, `𝔟 = (7)`
        (one ray class modulo `9`): `−2/7 ≡ 1 (mod 9)` is a cube in `F_λ`, so `χ_𝔞 χ̄_𝔟` has conductor `(14)`;
        `χ_𝔞 χ_𝔟 = (14wλ^(2j)/·)_3` with a unit `w`, and `14w ≢ ±1 (mod λ³)`, so its conductor is divisible by
        `λ`: the conjugate cannot be dropped for `n ≥ 3`."
     3. :1337, "where `χ̄^(n/2) = χ^(n/2)` because the values are `0` and `±1`" stays and now matches the axiom
        without comment.
   - **Tested on the witness:** the corrected axiom holds at `((−2), (7))` (conductor `(14)`); the other
     Checks keep their values: `k = ℚ`, `n = 2`: `21` and `60` (real characters, `χ̄ = χ`); the trivial family
     still fails (`1 · 1̄` has conductor `(1)`); the `ℚ(i)` fourth-order control is unchanged (quadratic values).
     The quadratic large sieve and its corollary concern quadratic families and are unaffected.

2. **F02** (P3) §6.2 states a target that needs §6.3, and §6.3 needs §6.2

   - **Location:** `README.md:1260` (bullet of §6.2); `*Needs:*` of §6.2 at :1293 (no §6.3); `*Needs:*` of
     §6.3 at :1324 ("§§2.1, 6.2").
   - **Claim:** each target's prerequisites precede it.
   - **Witness:** the bullet "The Fisher–Friedberg characters of §6.3 form an `n`-th order Hecke family" is
     proved from the construction of §6.3 (`bgl2014` Lemmas 2.1 and 2.3), which is defined after it and
     consumes the definition of §6.2.
   - **Repair:** delete the bullet at :1260 and add to the bullets of §6.3: "The primitive characters `χ_𝔞`
     at squarefree `𝔞` prime to `S` form an `n`-th order Hecke family with respect to `𝔠` (§6.2), with
     `G = R_𝔠`: the reciprocity law is the last clause of the previous bullet, and the primitivity axiom is
     `bgl2014` Lemma 2.3 at `j = 1` (`goldmakherlouvel2013` §2, pp. 3–5)." §6.3 already needs §6.2; §6.4
     keeps its line.

3. **F03** (P3) LFunctions Layer 7 is cited for the trivial character, which it excludes

   - **Location:** `README.md:297` ("Layer 7 (nonvanishing of `heckeLFunctionC ψ.character` on `Re s = 1`
     for primitive `ψ`)"); :2265 ("`Re ρ ≥ 1` is excluded by … LFunctions Layer 7"); :1189 ("the hypothesis
     is LFunctions Layer 7").
   - **Claim:** Layer 7 gives nonvanishing on `Re s = 1` for every primitive `ψ`.
   - **Witness:** LFunctions on main, `TauCetiRoadmap/LFunctions/README.md:1443`: "a nontrivial primitive
     finite-order Hecke L-function has no zero on `Re s = 1`". For trivial `ψ` the function is `ζ_K`, whose
     normal-form value at its pole `s = 1` is `0`.
   - **Repair:**
     - :297: "Layer 7 (for a nontrivial primitive `ψ`, `heckeLFunctionC ψ.character` has no zero on
       `Re s = 1`; the layer makes no statement for the trivial character)". Same word "nontrivial" at :89.
     - :2265: "`Re ρ > θ` is excluded by the hypothesis, read through §1.1 (at level `1` and `ρ = 1` the value
       is not `0`, `riemannZeta_one_ne_zero`)". Tested: `K = ℚ(i)`, trivial `ψ`, a point of `Re s = 1`:
       Layer 7 is silent, the hypothesis at `θ < 1` gives order `≤ 0`.
     - :1189: "and the hypothesis holds by the Euler product on `Re s > 1`".

4. **F04** (P3) three coinages of the main source name what Part II owns

   - **Location:** `README.md:138` and :2380 ("the compensated probe"), :140 ("masked primitive Poisson
     summation"), :141 ("the quadratic–cubic norm estimate").
   - **Claim:** the terms are standard or defined here.
   - **Witness:** none is defined in the README; they are the titles at `openai2026quasiRH` lines 57, 5462
     and 65.
   - **Repair:** :138–141: "The `7/8` half-plane and the second probe that proves it, with its two moment
     inductions (`openai2026quasiRH` Sections 12–20), the local sums at prime powers and finite correlations
     (its Lemmas 13.2–13.4), Poisson summation for a primitive character under a coprimality condition (its
     Lemma 17.5), the large-sieve estimate of its Lemma 14.2, …". :2380: "the `7/8` half-plane by the second
     probe (`openai2026quasiRH` Sections 12–20)".

Four new findings: one P1 (a definition copied with a source misprint, which makes a stated bullet
false for `n ≥ 3`) and three P3. All twelve findings of round 1 are repaired at this head, and no
repair introduced an error. No statement of `Suggested.lean` was refuted.

## Round 1 findings at this head

| Finding | State | Witness at `9c220cb` (`packages/QuasiRiemannHypothesis/README.md` unless said) |
| --- | --- | --- |
| 1a/F01 orthogonality lemma | repaired | :256 "`CommGroup.sum_inv_mul_monoidHom_apply_eq_ite` (`Σ_χ χ(σ)⁻¹ χ(g) = |G|` if `g = σ`…)", also :991, :1009; both names exist at the pin (`GroupTheory/FiniteAbelian/CharacterOrthogonality.lean:184`, `NumberTheory/LFunctions/Hecke/Orthogonality.lean:86`) |
| 1a/F02 slot of the pairing | repaired | :1219 "`e^(2πi B(z_j, m))` … the dual lattice pairing in the second slot"; Check :1235 recomputed: `B(e₁, m) = B(e₂, m) = 1`, `B(m, e₂) = 5/4`, factor `i` |
| 1a/F03 `X(K)` | repaired | :1112 "Define the *character group* `X(K)` as the set of the primitive characters `χ'*` inducing the Dirichlet characters `χ'` modulo `f_K` that are trivial on `H_K`"; agrees with AnalyticNumberTheoryPartI §2.42 on main (its Check `ℚ(√5)`, `H = {1, 4}`) |
| 1a/F04 Hecke clause for any `K` | repaired | :2259 "the same for the primitive finite-order Hecke characters of any number field `K`" |
| 1a/F05 undefined terms | repaired | no hit for "finite-ray", "deleted radical", "primary phase", "unmarked", "height order", "tail order" in README or Lean; two terms of the same kind remain elsewhere (S04) |
| 1a/F06 `*Needs:*` lines | repaired | :1886, :1906, :2176 give one clause per target |
| 1a/F07, 1b/F02 source titles | repaired | headings :707, :737, :773, :914, :1018, :1422, :1451, :1470, :1812, :1889, :1957, :2181 and the five labels of §10.5 differ from `openai2026quasiRH` lines 22–51; longest shared prose run now 10 words, a formula (:2118) |
| 1b/F01 §6.2 wording | repaired as to wording | :1245–1251 rewritten; longest run shared with `goldmakherlouvel2013` lines 45–59 is the name "an `n`-th order Hecke family with respect to". The rewritten axiom keeps a misprint of the source: S01 |
| 1b/F03 `s ≠ 1` | repaired | `Suggested.lean:110` `{s : ℂ} (hs : 11 / 12 < s.re) : riemannZeta s ≠ 0`; `riemannZeta_one`, `riemannZeta_one_ne_zero` at `Mathlib/NumberTheory/Harmonic/ZetaAsymp.lean:420, 443` |
| 1b/F04 Layer 6 Example | repaired | :1377 "neither statement implies the other" |
| 1b/F05 `baierbansal2018` | repaired | :1222 "for `Λ = ℤ^d` with the dot product … used there at `d = 2`"; `baierbansal2018` lines 190–197 |

## The pass: `Suggested.lean`

No section `variable`; every binder is in the declaration's own signature. The 11 elaborated types of
the worker's `#check @name` file (scratch `signatures.md`) were compared with the README statements;
none lost a binder and none differs in generality. I ran no Lean (the pass is read-only).

| Declaration (line; context) | Instances tried | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| `ZeroFreeRightOf` (67; none) | `s − 2`; `0`; `1/(s − 1)`; `s̄`; `heckeLFunctionC` with no continuation | order `1` at `2` (false at `3/2`, true at `2`); `⊤` (never); `−1` (always); junk `0` (always); `meromorphicContinuation` returns `0`, so never | agrees with §1.1 | none |
| `zeroFreeRightOf_LFunction_of_isAbelianGalois` (80; `K`, `[IsAbelianGalois ℚ K]`, `0 ≤ σ₀`) | `K = ℚ`; `K = F`, `χ = χ₋₃`; `σ₀ = 0`; `χ₀ mod 4` | tautology on primitive characters; cofactor has a pole at `1`, `L(1, χ₋₃) ≠ 0`; hypothesis false (`ζ ∣ ζ_K`); deleted zeros on `Re s = 0` | true as typed | none |
| `zeroFreeRightOf_heckeLFunctionC` (94; `F`, `[IsCyclotomicExtension {3} ℚ F]`) | trivial `χ` at `𝔪 = (2)`; normal-form value at the pole | `ζ_F(s)(1 − 4^(−s))`, order `−1` at `1`; value `0` there, not read | as §10.7 | none |
| `zeroFreeRightOf_LFunction` (103) | `N = 1`; one-term derivation from lines 80 and 94 | `ζ`; needs both sorry'd headlines, not a library lemma | headline, not padding | none |
| `riemannZeta_ne_zero_of_eleven_twelfths_lt_re` (110) | `s = 1`; `s = 2` | `(0.5772 − 2.5310)/2 = −0.977`; `1.645` | true on the whole half-plane | none |
| `re_mem_Icc_of_LFunction_eq_zero` (122) | `N = 1`, `ρ = 1`; even `χ`, `ρ = 0`; `0 < Re ρ < 1/12` | value `≠ 0`; excluded; `1 − ρ̄` has real part `> 11/12` | true given §10.7 | none |
| `re_mem_Icc_of_heckeLFunctionC` (132) | trivial `ψ`, `ρ = 1`; trivial zeros | order `−1`, not `> 0`; real parts `≤ 0` | true given §10.7 | none |
| `exists_ne_zero_ne_one_le_log_rpow` (144) | `q = 2`; `q = 3`; `χ mod 12` from `(·/3)`; `θ = 1/2` | no `χ ≠ 1`; `n = 2`, `log 3 = 1.0986 > 0`; `n = 5`; exponent `2` | true; prime sides differ by `≤ log q log x` | none |
| `exists_prime_ne_zero_ne_one_le_log_rpow` (156) | `𝔪₀ = (1)` with real places (`ℚ(√3)`); `ℚ(i)`, `(3)` | base `log 1 + 2 = 2`, finitely many `η` for fixed `K`; `η((1 + i)) = −1`, norm `2` | true; weight is `0` off `𝔪.support` at the pin | none |
| `exists_jacobiSym_eq_neg_one_le_log_pow` (170) | `p = 3`; `p = 7` | `n = 2`, `(log 3)^12 = 3.09`; `n = 3` | `1/(1 − 11/12) = 12` | none |
| `exists_jacobiSym_eq_neg_one_le_rpow` (178) | `δ = 1` | `n ≤ p` | follows from line 170 in several steps; the named conjecture | none |

Headline theorems of the Summary: the `11/12` half-plane (lines 94, 103, 110), the zero strip (122, 132),
the conditional least-value bound (144, 156), the least nonresidue and Vinogradov's conjecture (170,
178), the transfer (80). All are stated; the module docstring names Layers 8 and 9 as not statable and
what they lack (no `K`-Bessel function and no hyperbolic 3-space at the pins). No padding: no
declaration follows from one pinned lemma, restates a definition or mirrors a Check.

## The pass: README targets

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| §1.2 | `∅`; `{s − 3/4}`; `{s − 2}` | `1/2`; `3/4`; `2`, hypothesis violated | holds |
| §1.3 | `E* = min(β* − σ₀ − ω, σ)`; Mellin integrand | large `Z`: `Z^(β* − E* − Re s)`; small `Z`: `Z^(B − Re s)` | route closes on `Re s > β* − E*` |
| §1.4 | `Aτ ≤ m/4`, then `N` | `2^A Z^(C(β*) − 3m/4)`; `B − Nτ < C(β*) − m/2` | holds |
| §2.1 | `(ℚ, 2, −1)`; `(ℚ, 2, 5)` | conductor `4∞`; `5` | holds |
| §2.5 | `d = 1 + 3ω`; `π = −2 + 3ω` | `1 − λ² + λ³ = 1 − 6ω`; `12⁶ ≡ 1 (mod 19)`; `t = −7`, primes of `t` have norm `< 19` | holds; the route's reduction to different norms closes |
| §3.2–3.5 | tail bound; `W_G`; `m ≡ 1`, `m = s`; `H = 3` | `T₁^(−N) (2π)^d ‖w‖`; `e^(s²)`; `W(1/x)`, `(y∂_y W)(1/x)`; `2` against `1.81` | holds |
| §4.1–4.3 (numerical) | `p = 1 + 3ω`, `4 + 3ω`, `−2 + 3ω` | `γ_2³ = −α(p)` to `10⁻¹²` at all three; `γ_3 = i, 1, i`; `γ_6 = −q^(−1/2)`; `γ_1γ_2 = χ̄_p(4) γ_3 γ_2³` at all three | holds |
| §4.4 | `c = 1, −1, λ, −λ, −3, 5, 7, −5 + 3ω, 1 + 6ω` | direct sum equals `(1 + i^(−b) + i^a + i^(b−a))/2`: `1, 1, i, −i, 1, 1, 1, 1, i` | holds |
| §4.5–4.6 | `a = 1 + 3ω`, `b = −2 + 3ω` | `χ_b(a) = 8 = −ω²`, `χ_a(b) = ω²`, both in the class of `λ`, `τ(λ, λ) = −1`; `γ_1γ_2(ab)` multiplies by `(χ_a(b)χ_b(a))³ = R(a, b)` | holds |
| §5.1 | `𝔯 = 𝓞`; `(2)`; `σ = −1` | `2`; zeros on `Re s = 0`; `1 − p` | holds |
| §5.2 | `ℚ`, `s = −1/10` | `(0.1432)^0.6 = 0.3116`, `3 · 0.3116 · 10.5844 = 9.894`; `61.38` | holds; matches ExplicitZetaBounds §3.2 on main |
| §5.4–5.5 | `ℚ(√5)` at `f = 5, 10`; `ℚ(√2)`; totally positive `α ≡ 1 (mod q)` | `{1, (·/5)}` twice; `N(1 + 3√2) = −17`; `N α ≡ 1`, `N α > 0` | holds |
| §6.1 | `J = 1`; `z_j = j/N` | `≍ Q^d`; `N²` | holds |
| §6.2 | `ℚ`, `(4)`; `F`, `n = 3`, `((−2), (7))` | `21`, `60`; `χ_𝔞χ_𝔟` ramified at `λ`, `χ_𝔞χ̄_𝔟` of conductor `(14)` | **S01** |
| §6.2, `ℤ[ω]` bullet | `p = 1 + 3ω`; a pair in one square class | conductor `λp` (`χ_p(−1)³ = −1`); `q_a ≡ q_b (mod 4)` gives `χ_(ab)(−1)³ = 1`, conductor `ab` | holds |
| §6.5 | `M = N` | `(MN)^(2/3) > M + N` iff `M^(1/2) < N < M²` | holds |
| §7.2–7.3 | all `i ≤ I − 1` fail; exponents | `M_I > a₀ + 1 + ε`; `δr + ε'/2`, `δ(1 − m) + 3ε'/4`, `9^C U^(ε'/10)` | holds |
| §8.1 | two matrices; `(c, 1 + bc)_v` place by place | `ω, ω, ω²`; `κ_P = ω`, `κ = ω²`; product formula gives `(c/a)_n (c/d)_n = 1` | holds |
| §8.3, 8.5 | `SL₂(ℤ[i])`; cusp count | `φ(1) = π(−1/4)/(π/4) = −1`; `648/2/27 = 12` | holds |
| §8.6 | Mellin transform of `v K_(1/3)(4π|μ|v)` against `v^(2s−2)` | `Γ(s − 1/3) Γ(s − 2/3) |μ|^(1−2s)` | matches `ξ_a` |
| §8.7 | `c = 1 + 3ω` | `g̃ = 0.89595 − 0.44415i`, cube `0.18898 − 0.98198i = −α`; `γ_2 = χ_c(λ)² g̃` | holds |
| §9.1–9.4 | `L₀`; lattice sum; `M = N = 1` | converges for `σ > 1/2`; `a^(−A)(U/a)^(1−A) = a⁻¹U^(1−A)`; `1 − O/2 ≤ 1` | holds |
| §10.4 | `r ∈ [1/2, 1]` | `max_r` of `1 − δr`, `2(1 + r)/3 − δr` is `max(1 − δ/2, 4/3 − δ)` | `R(δ)` rederived |
| §10.5–10.6 | `d = h`, `g = 0`; rates | `a − β* − 1/3 + R/2 ≤ 5/12 − β*/2 < −1/24` iff `β* > 11/12`; `R + δ/2 − z₀ ∈ [33/50, 62/75]`; `−43/300`; `−1.749` | holds |
| §11.1–11.3 | `K = ℚ(i)`, trivial `ψ`; `ϵ = 5/12, 11/24, 3/8, 7/16` | zeros symmetric under `ρ ↦ 1 − ρ̄`; `24, 48, 16, 32` | holds; citation of Layer 7: S03 |

## Dependency check

```text
depcheck: 261 roadmaps, 2607 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. The roadmap is at position 296 of the merge order; every cited
supplier is on main or earlier (latest: AnalyticNumberTheoryPartIII at 295).

## Verified sound

- **Declarations read:** 11 of 11 (all 183 lines). `module`, `import Mathlib` and one `TauCeti` module
  that exists at the pin; `theorem` only; no `set_option`, no sorry'd data.
- **Targets read:** the whole README, lines 1–2442, all 55 targets.
- **Pinned declarations:** 82 names grepped at the pins (35 Mathlib, 47 Tau Ceti), all present.
  `heckeLFunctionC` is `meromorphicContinuation 1 (…)`, a normal form (value `0` at poles) and `0` when
  no continuation exists; `toMultiplicativeIdealWeight` is `0` off `𝔪.support`; `Modulus.finitePart` is
  an ideal with a nonvanishing proof; `kroneckerWeber` takes `E : Type`.
- **Sibling citations checked:** 51 sections of 16 roadmaps resolved at main or at the open head, 13 of
  them read in full: AnalyticNumberTheoryPartI §2.42, AutomorphicFormsOnReductiveGroups §4.5 (`K_ν` for
  complex `ν`), CharacterSumsOverFiniteFields §3.4 (every `χ`), ExplicitZetaBounds §3.2, ZerosOfLFunctions
  §§1.6, 4.4, 8.4, 8.6, MaassForms §7.3, AutomorphicSpectralTheory §1.15a, ThetaSeries 1A, LFunctions
  Layer 7 (S03), SieveMethodsAndPrimePatterns §2.9.
- **Ownership:** `roadmaps grep` for the Kubota character over main and the open heads found no other
  owner; MetaplecticAutomorphicForms (adelic Weil representations) does not state it. No declaration of
  `Suggested.lean` shares a fully qualified name with a readable roadmap. `overlaps.md`: none.
- **Locators verified:** 64 located in the texts (38 labelled results of `openai2026quasiRH`, 26 in ten
  other sources), 8 statements compared in detail. Printed pages of `milnecft2020`: PDF pages 166–168
  are printed 157–159.
- **Checks tested:** over 90 Checks and worked values recomputed (tables above), 25 of them numerically.
- **Policy:** the pull request changes only the package folder; no pull-request number, process word,
  `lemma` or machine path in the README or the Lean file; `plan.json` declares no gap.

Source independence: 13 passages compared with 5 sources, and a scan for shared runs of six words between the README and ten source texts, none shared (longest prose run 10 words, a formula, `openai2026quasiRH` line 3446; the name of a definition, 9 words, `goldmakherlouvel2013` line 46); largest share `openai2026quasiRH`, 63 of 142 locators; contents compared with `openai2026quasiRH`: independent (Layers 2–5 regroup its §4, Layers 6 and 8 come from other sources, its §8 is Layer 7 and precedes its §5 as Layer 9; the order inside Layers 9 and 10 is forced by their `*Needs:*` lines).

Research link: The headline is Theorem 3.1 of OpenAI 2026 with a second account in Liu 2026; Layers 6 and 8 are the large sieves and cubic theta function of Heath-Brown 2000, Blomer–Goldmakher–Louvel 2014, Kubota 1969 and Patterson 1977 used by Dunn–Radziwiłł 2024; §11.2 extends Lamzouri–Li–Soundararajan 2015. Rests on the README's sources, which I read.

## Not verifiable

- The proof of the `11/12` half-plane as a whole: the exponent bookkeeping was recomputed, the analytic
  estimates of §§9.2–9.4 and 10.2–10.6 were not re-proved.
- `openai2026quasiRH` Lemma 5.8 and (5.39), cited at §9.4: not found in the OCR text.
- Conjugation bars in `openai2026quasiRH` and `patterson1977` (OCR): the README's conjugates were checked
  by computation, not against the print. The functional equations and shifts of §8.6 against
  `patterson1977` (7.1)–(7.5): displays unreadable.
- `kubota1968` (German, OCR) displays, and the equation numbers of `liu2026improved`: located only.
- The claim of S02's repair that `G = R_𝔠` serves for every `n ≥ 3` rests on `bgl2014` Lemma 2.1 as the
  README quotes it; `goldmakherlouvel2013` Appendix B was not found in the cached text.
- Elaboration: no Lean was run.

## Source issues

- **Misprint** in goldmakherlouvel2013 at Definition 1, property (3), printed page 2: the source says the product of the two characters of one class is primitive of conductor the product ideal; it should be the product of one with the conjugate of the other, as its §2 computes; affects a stated result.
- **Error** in goldmakherlouvel2013 at Remark 3 and Corollary 1.2, printed page 2: the source says the `n/d`-th powers of any `n`-th order family form a `d`-th order family; it should assume reciprocity and primitivity for the inducing primitive characters; affects a stated result.
- **Misprint** in dunnradziwill2024 at Remark 5.1, printed page 17: the source says the symbol of `c` at `a` equals the symbol of `c` at `d`; it should be the conjugate of the symbol at `d` (their product is `1`); affects nothing.

## For the human reviewers

- **Scope.** The headline's only sources are unrefereed 2026 preprints: `openai2026quasiRH` and `openai2026quasiRHalt` (author given as "OpenAI") and `liu2026improved` (`packages/QuasiRiemannHypothesis/README.md:32-34`).
- **Scope.** The source's main theorem (`Re s > 7/8`) is assigned to QuasiRiemannHypothesisPartII (`README.md:138-143`), which is neither on main nor an open pull request.
- **Licence.** The two OpenAI preprints are read from the public repository `openai/math`; I did not find or read a licence for it.
- **Licence.** `liu2026improved` says its result is formalised in Lean; that formalisation was not read, so `Suggested.lean` was not compared with it.
- **Not tested.** `openai2026quasiRH` is an OCR extraction: contents and prose were compared, displayed formulas only where legible.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "9c220cb2cece55c3a53a79a6c31d3b6a0c03433a", "job": "RT-QuasiRiemannHypothesis~2b", "model": "fable", "worker": "chris-x29"} -->
