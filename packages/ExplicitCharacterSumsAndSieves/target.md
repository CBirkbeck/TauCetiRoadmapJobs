Verdict: design
Name: ExplicitCharacterSumsAndSieves
Base: none
Owner: none

## Scope

**What the roadmap owns.** The numerically explicit inequalities collected on four pages of the
TME-EMT wiki (`tmeemt-art05`, `tmeemt-art11`, `tmeemt-art14`, `tmeemt-art15`): the derivative
tests for exponential sums of a real function (Layer 1), the counts of integer points near a smooth
plane curve (Layer 2), the explicit Pólya–Vinogradov inequalities (Layer 3), the explicit Burgess
inequalities (Layer 4) and the explicit sieve upper bounds (Layer 5), each with the constants and
thresholds of its source, together with the six named computational hypotheses the filed statement
lists (Layer 6). Everything qualitative that these results refine is consumed: Selberg's weights and
the large sieves from `SieveMethodsAndPrimePatterns`, Gauss sums and Weil's bounds from
`CharacterSumsOverFiniteFields`, Mathlib's Dirichlet characters, and Mathlib's `SelbergSieve`.
The roadmap adds constants, thresholds and inequalities, never a second sieve or a second Gauss-sum
theory.

**Carriers.** Layer 1 is stated for a real function on a closed real interval `[a, b]` with
`ContDiffOn ℝ k f (Set.Icc a b)`, the sum running over the integers of the interval; the wiki's
`[N+1, N+L]` is the case `a = N+1`, `b = N+L`. Layer 2 is stated on an arbitrary interval
`[a, a+N]` with `a ∈ ℝ`, `N ≥ 2`, as in `huxleysargos1995` lines 10–12, with `R(f, a, N, δ)` the
number of integers `n ∈ [a, a+N]` with `‖f(n)‖ < δ`; the wiki's `[N, 2N]` (`tmeemt-art11`
lines 77–86) is the case `a = N` and becomes a Check. Layers 3 and 4 use `DirichletCharacter ℂ q`
with Mathlib's `conductor`, `IsPrimitive`, `Even`, `Odd` and `primitiveCharacter`
(`Mathlib/NumberTheory/DirichletCharacter/Basic.lean`), the character sum
`S_χ(M, N) = Σ_{a=M+1}^{M+N} χ(a)` over naturals cast into `ZMod q`, and `e(x) = Real.fourierChar x`.
Layer 5 uses Mathlib's `Nat.primeCounting`, `ArithmeticFunction.vonMangoldt` and `Nat.totient`,
Büthe's weight class `W^{1,1}(I)` with the functional `ρ_I(f) = ‖f‖₁/(‖f‖_∞ + ‖f'‖₁)`
(`buthe2014` lines 291–295), and an arbitrary sieve density `κ` on the primes for Greaves's theorem.
The predicate `f = g + O*(h)` is `‖f − g‖ ≤ h`, as in the sibling `ExplicitZetaBounds`.

**Binding rule for computations.** Every result resting on a table or a finite verification takes
that fact as a `Prop` parameter named in Layer 6; the analytic argument is proved from the
parameter. No table is proved and no algorithm is roadmap content. A later roadmap (the natural
candidate is `ComputationalNumberTheory` Layer 4, "quantitative analytic bounds", or a Part II)
may discharge a parameter; this creates no supply edge now.

**Boundaries settled by this triage.** Each adjusts the filed statement where the sources or the
board say otherwise, and is a note for the design.

- *Sharp large sieve.* `SieveMethodsAndPrimePatterns` §2.9 plans the sharp separated additive large
  sieve with constant `N − 1 + δ⁻¹` (`SieveTaper.sharp_additive_largeSieve`), the separated Hilbert
  inequality with constant `π/δ`, the sharp primitive-character form, and the forbidden-residue
  form `J(Q)|Σ aₙ|² ≤ (H − 1 + Q²) Σ|aₙ|²` (its README lines 2293–2340). Target 5a consumes the
  forbidden-residue form; nothing about large sieves is restated here, and the filed statement's
  "sibling explicit roadmap covering the Fourier-tools page" is not the supplier (the triage of
  `ExplicitZetaBounds` already redirected that constant to §2.9).
- *Qualitative sieve bounds.* `SieveMethodsAndPrimePatterns` §1.6 plans Brun–Titchmarsh in
  progressions with an unspecified absolute constant (`SieveApplications.progression_upper`, its
  README lines 1451–1459: "this target uses an unspecified absolute constant") and the dimension-two
  twin/Goldbach bound with an unspecified constant (`twin_goldbach_upper`, lines 1461–1479). This
  roadmap owns the constants `2` (Montgomery–Vaughan) and `16ω` (Siebert) and the explicit
  density-sum lower bound of Greaves that produces them; it reuses `SieveMethodsAndPrimePatterns`
  §1.3 (Selberg's optimal weights on Mathlib's `SelbergSieve`) and §0.5 (dimension and Rankin bounds)
  and never re-plans them.
- *No supply from the primes roadmap.* The filed statement says 5b consumes explicit bounds on
  `ψ(x)`. It does not: Lemma 15 of Ramaré–Viswanadham follows from Lemma 14 by the inequality
  `Σ Λ(m) ≤ log(2M) Σ Λ(m)/log m` and a numerical check (`ramareviswanadham2021` lines 674–679).
  So nothing is consumed from `ExplicitPrimeCounting` (#6066), and the order of supply among the
  explicit targets is `ExplicitCharacterSumsAndSieves → ExplicitZetaBounds → ExplicitPrimeCounting`,
  as the `ExplicitZetaBounds` triage requires (its Risks, "Order of supply").
- *No supply from the multiplicative-functions roadmap.* Target 4e is Jain-Sharma–Khale–Liu's
  Theorem 1.1, whose bound carries `(2^{ω(q)} d(q))^{3/4} (q/φ(q))^{1/2}` as arithmetic functions
  (`jainsharmakhaleliu2021` lines 86–87); it needs no pointwise bound. Their Corollary 1.2 (the
  `12.11 … (log log q)^{1/2}` form, lines 90–91) uses an explicit bound for `q/φ(q)`; it is stated
  here with that bound as an explicit hypothesis, or left to `ExplicitMultiplicativeFunctions`
  (#6897, whose target lists this roadmap as a consumer of its Layer 9). Since
  `ExplicitMultiplicativeFunctions` consumes `ExplicitZetaBounds`, which consumes this roadmap, a
  supply edge from it to this roadmap would be a cycle; none is made.
- *Büthe's weighted Brun–Titchmarsh is not a generalisation of Montgomery–Vaughan.* The indicator
  case of Büthe's Theorem 4.2 recovers only the van Lint–Richert form with the factor
  `1 + 8/log(y/k)` (`buthe2014` lines 349–353); only his Theorem 4.3, the modulus-one case, has the
  Montgomery–Vaughan strength. So Montgomery–Vaughan's Theorem 2 is its own target, proved from the
  sharp large sieve, and Büthe's two theorems are separate targets on weights.
- *Bordignon's non-squarefree analogue.* The paper the filed statement and the wiki name
  ("A Pólya–Vinogradov inequality for short character sums", `bordignon2021`) proves a short-sum
  bound for `N ≤ q^{1−γ}` (its Theorem 1.1, lines 38–41). The non-squarefree analogue of
  Bordignon–Kerr with the saving `1/4` degraded to `3/8` is Theorem 1.3 of "Partial Gaussian sums
  and the Pólya–Vinogradov inequality for primitive characters" (`bordignon2022partial`, arXiv v1
  lines 116–124; published open access, Rev. Mat. Iberoam. 38 (2022)). Target 3e cites the latter;
  the former is context.
- *Gauss sums and Weil bounds.* `|τ(χ)|² = q` for primitive `χ` is Tau Ceti's
  `gaussSum_mul_gaussSum_inv_eq_card_of_isPrimitive` (`TauCeti/NumberTheory/DirichletCharacter/GaussSum.lean`)
  packaged by `CharacterSumsOverFiniteFields` 7.1; the Gauss-sum expansion
  `τ_a(χ) = χ(a)⁻¹ τ(χ)` is Mathlib's `gaussSum_mulShift_of_isPrimitive`. Weil's bound for
  `Σ_x χ(∏(x + a_i))` is `CharacterSumsOverFiniteFields` 4.7 (prime field) and 7.6 (general
  modulus). The explicit multiplicity count in the Burgess argument and the explicit bounds for
  partial Gaussian sums (Bordignon–Kerr's Theorem 2) are owned here.
- *Overlap with discrepancy.* `ProbabilisticAndMetricNumberTheory` §2.7 plans the explicit
  Erdős–Turán inequality `D* ≤ 3/(H+1) + 3 Σ_{h≤H} |N⁻¹ Σ_j e(h x_j)|/h` and §2.5 van der Corput's
  difference theorem (qualitative). Filaseta's reduction 2d has a different shape
  (`4N/H + (4/H) Σ_{h≤H} |Σ e(h f(n))|`) and is owned here; the design records whether §2.7 yields
  it and states Filaseta's form regardless.
- *Generality of the Burgess layer.* Targets 4a–4d are for prime moduli because their sources are;
  4e is the composite-modulus statement (a `r = 2` bound). A 2025 preprint (Hasanalizade, Lin,
  Martin, Luna Martínez, Treviño, arXiv:2511.17778) improves 4e and extends it to `r ≥ 3` for
  cubefree moduli; it is not in the filed statement and is a candidate for a Part II, not a reason
  to change these targets.

**Not owned here.** The asymptotic constants of Landau 1918, Granville–Soundararajan 2007 and
Hildebrand (context only); the Bombieri–Pila count of integer points on curves (`tmeemt-art11`
lines 188–214, outside the wiki's own scope); bounds for `L(1, χ)` and class numbers
(`ExplicitZetaBounds` Layer 5, `EffectiveClassNumbers`); applications to the least `k`-th power
non-residue, the least primitive root and norm-Euclidean fields (`ExplicitNumberFields` and
beyond); the van der Corput B-process and exponent pairs beyond the explicit truncated Poisson
formula 1f; Vinogradov's mean value theorem; every algorithm and every table proof.

## Final targets

Notation: `S_f(a, b) = Σ_{a ≤ n ≤ b} e(f(n))`, `S_χ(M, N) = Σ_{a=M+1}^{M+N} χ(a)`,
`π(z; k, ℓ)` the number of primes `p ≤ z` with `p ≡ ℓ (mod k)`, `‖x‖` the distance to the nearest
integer, `R(f, a, N, δ)` the number of integers `n ∈ [a, a+N]` with `‖f(n)‖ < δ`, `Φ(x, z)` the
number of `n ≤ x` with no prime factor `≤ z`, `ω = ∏_{p > 2} (1 − (p−1)⁻²)` the twin-prime
constant. Every constant below is the source's; a constant printed differently by the wiki and the
paper is listed in Risks.

**Layer 1: exponential sums under derivative conditions.**

1. *Kusmin–Landau.* `f` differentiable on `[a, b]` with `f'` monotone and `θ ≤ f'(u) ≤ 1 − θ` for
   some `θ ∈ (0, 1/2]`: `|S_f(a, b)| ≤ cot(πθ/2) ≤ 2/(πθ)` (`tmeemt-art05` lines 86–89;
   `granville-ramare-1996` Lemma 8.4, lines 898–908, which cites Graham–Kolesnik Theorem 2.1).
2. *Second derivative test* (Cheng–Graham 2004, Lemma 3, corrected by Patel 2022, Lemma 2.3).
   `f` twice continuously differentiable on `[N+1, N+L]`, reals `V < W` with `W > 1` and
   `1/W ≤ |f''(x)| ≤ 1/V` on the interval: `|S_f(N+1, N+L)| ≤ 2 (L/V + 2)(2 √(W/π) + 1)`
   (`patel2022` lines 140–144; with `λ = W/V` this is `tmeemt-art05` lines 100–104). The design
   states Patel's form; Cheng–Graham's original has its leading term off by `√2` (`patel2022`
   lines 145–148) and is not a target.
3. *Third derivative test* (Hiary 2016, Lemma 1.2). `f` three times continuously differentiable
   on `[N+1, N+L]`, `W > 1`, `λ ≥ 1`, `1/W ≤ |f'''(x)| ≤ λ/W`, `η > 0`:
   `|S_f(N+1, N+L)|² ≤ (L W^{−1/3} + η)(αL + βW^{2/3})` with
   `α = 1/η + (64λ/75) √(η + W^{−1/3}) + λη/W^{1/3} + λ/W^{2/3}` and
   `β = (64/15)/√η + 3/W^{1/3}` (`hiary2016zeta` lines 84–94; the wiki prints `65/15`, lines
   115–123).
4. *Fourth and fifth derivative tests* (Patel 2022, Lemmas 3.1 and 3.2). `W₄ > 1`, `λ₄ ≥ 1`,
   `1/W₄ ≤ |f⁗| ≤ λ₄/W₄`, `η₄ > 0`:
   `|S|² ≤ (L W₄^{−1/7} + η₄)(α₄ L + γ₄ √L W₄^{2/7} + β₄ W₄^{3/7})` with `α₄, γ₄, β₄` the
   closed forms of `patel2022` line 196 (built from Hiary's `α̃₃, β̃₃`); and the fifth-derivative
   analogue with exponent `1/15` and constants `α₅, τ₅, γ₅, ω₅, β₅` of lines 266–270.
5. *Iterated van der Corput inequality* (Granville–Ramaré 1996, inside the proof of Lemma 8.6).
   `f` with `k+1` continuous derivatives on `(A, B]`, `N` at least the number of integers in
   `(A, B]`, `Q` an integer with `2^k ≤ Q ≤ N`: `|(1/(8N)) Σ_{A<n≤B} e(f(n))|^{2^k}` is at most
   `(1/8)(1/Q + Q^{−(2 − 2^{1−k})} Σ_{r₁ ≤ Q} Σ_{r₂ ≤ Q^{1/2}} ⋯ Σ_{r_k ≤ Q^{2^{1−k}}}
   |(1/N) Σ_{A<n≤B−r₁−⋯−r_k} e(±f_{r₁…r_k}(n))|)`, where `f_{r₁…r_k}` is the iterated difference
   and `f'_{r₁…r_k}(t) = r₁⋯r_k f^{(k+1)}(y)` for some `y ∈ [t, t + r₁ + ⋯ + r_k]`
   (`tmeemt-art05` lines 137–144; `granville-ramare-1996` lines 911–920 for the difference
   identity and 922–960 for the proof; the range of `Q` is line 924). The full Lemma 8.6 (with the
   `f^{(k+1)}` monotone hypothesis and the final bound) is a second target.
6. *Explicit stationary phase* (Karatsuba–Korolëv 2007, main theorem). `f'` decreasing on
   `[N+1, N+L]`, `α = f'(N+L)`, `β = f'(N)`, `x_ν` the solution of `f'(x) = ν` for integers
   `ν ∈ (α, β]`, `λ₂ ≤ |f''| ≤ h₂ λ₂`, `λ₃ ≤ |f'''| ≤ h₃ λ₃`:
   `S_f(N+1, N+L) = Σ_{α<ν≤β} e(f(x_ν) − ν x_ν − 1/8)/√(f''(x_ν)) + E` with
   `|E| ≤ (40/√π) λ₂^{−1/2} + ((3 + 2h₂)/π) log(β − α + 2) + 2.9 h₂ h₃^{1/5} L (λ₂λ₃)^{1/5} + 1.9`
   (`tmeemt-art05` lines 152–158; `karatsubakorolev2007`, uncertified). The wiki writes
   `λ^{−1/2}` without index; the design reads it as `λ₂` and records it as a Check.

**Layer 2: integer points near smooth plane curves** (`a ∈ ℝ`, `N ≥ 2`, `δ ∈ (0, 1/2)`,
`f` positive on `[a, a+N]`; the wiki's `[N, 2N]` is a Check).

7. *First derivative test* (Vinogradov; proof as Bordellès 2012, Theorem 5.6). `f ∈ C¹`,
   `λ₁ ≤ |f'| ≤ c₁λ₁` with `c₁ ≥ 1`: `R(f, a, N, δ) ≤ 2c₁Nλ₁ + 4c₁Nδ + 2δ/λ₁ + 1`
   (`tmeemt-art11` lines 116–119).
8. *Second derivative test* (Huxley 1996; Bordellès 2012, Theorem 5.8). `f ∈ C²`,
   `λ₂ ≤ |f''| ≤ c₂λ₂`, `Nλ₂ ≥ 1/c₂`:
   `R(f, a, N, δ) ≤ 6((3c₂)^{1/3} N λ₂^{1/3} + (12c₂)^{1/2} N δ^{1/2} + 1)` (lines 132–137).
9. *k-th derivative test* (Huxley–Sargos 1995 and 2006; explicit form Bordellès 2012,
   Theorem 5.12). `k ≥ 3`, `f ∈ C^k`, `λ_k ≤ |f^{(k)}| ≤ c_kλ_k`, `δ ∈ (0, 1/4)`:
   `R(f, a, N, δ) ≤ α_k N λ_k^{2/(k(k+1))} + β_k N δ^{2/(k(k−1))} + 8k³ (δ/λ_k)^{1/k} + 2k²(5e³ + 1)`
   with `α_k = 2k² c_k^{2/(k(k+1))}`, `β_k = 4k²(5e³ c_k^{2/(k(k−1))} + 1)` (lines 161–168).
   The qualitative form with implicit constants is `huxleysargos1995` Théorème 1 (lines 39–42).
10. *Reduction to exponential sums* (Filaseta 1990). Any `f` on `[a, a+N]`, `δ ∈ (0, 1/4)`,
    `K = ⌊(8δ)⁻¹⌋ + 1`, integer `1 ≤ H ≤ K`:
    `R(f, a, N, δ) ≤ 4N/H + (4/H) Σ_{h=1}^{H} |Σ_{a≤n≤a+N} e(hf(n))|` (lines 185–186;
    `filaseta1990`, uncertified). Composed with targets 1–4 this is the exponential-sum route.

**Layer 3: explicit Pólya–Vinogradov inequalities** (`q > 1`, `χ` a Dirichlet character mod `q`,
all `M, N`).

11. *Qiu 1991.* `χ` primitive: `|S_χ(M, N)| ≤ (4/π²)√q log q + 0.38√q + 0.637/√q`; `χ`
    non-principal: `|S_χ(M, N)| ≤ (8√6/(3π²))√q log q + 0.63√q + 1.05/√q` (`tmeemt-art15`
    lines 84–89; `qiu1991` print only, uncertified).
12. *Bachman–Rachakonda 2001.* `χ` non-principal:
    `|S_χ(M, N)| ≤ (1/(3 log 3))√q log q + 6.5√q` (lines 97–98; `bachmanrachakonda2001`
    uncertified).
13. *Frolenkov–Soundararajan 2013.* `χ` non-principal, `q ≥ 1000`:
    `|S_χ(M, N)| ≤ (1/(π√2))√q (log q + 6) + √q`; `χ` primitive, `q ≥ 1200`:
    `max_{M,N} |S_χ(M, N)| ≤ (2/π²)√q log q + √q` for `χ` even and `≤ (1/(2π))√q log q + √q` for
    `χ` odd, the odd bound holding for all `q ≥ 40` under the Prop `FS_OddSmallModuli` (lines
    108–118; `frolenkovsoundararajan2013` uncertified).
14. *Symmetry for even characters.* `χ` even: `max_{M,N} |Σ_{a=M}^{N} χ(a)| = 2 max_N |Σ_{a=1}^{N} χ(a)|`,
    from `S(q − 1 − N) = −S(N)` (lines 126–129).
15. *Bordignon–Kerr 2020.* `q` squarefree, `χ` primitive mod `q`, `ℓ ≥ 2` an integer with
    `log q ≥ e^{1088ℓ²}` (the wiki writes `q ≥ exp(1088ℓ²)`; the paper's Corollary 1 reads
    `log q ≥ e^{1088ℓ²}`, `bordignonkerr2020` line 158, and the design states the paper's range):
    `max_N |Σ_{a=1}^{N} χ(a)| ≤ (2/π²)(1/4 + 1/(4ℓ))√q log q + (c + 1/(1088ℓ))√q` for `χ` even and
    `≤ (1/π)(1/4 + 1/(4ℓ))√q log q + (c + 1/(1088ℓ))√q` for `χ` odd, with `c = 6.5` in arXiv v1
    (lines 156–167) and `c = 49` in the published version as quoted by the wiki (lines 140–142);
    see Risks. Their Theorem 5 (the full statement with secondary terms, lines 207–220) and
    Theorem 2 (explicit partial Gaussian sums, line 172 onward) are targets too, the latter being
    the tool. *Bordignon 2022* (`bordignon2022partial` Theorem 1.3, arXiv v1 lines 116–124): for
    every primitive `χ` mod `q`, `|S(N, χ)| ≤ (2/π²)(3/8 + ε)√q log q + h₁ √q` for `χ` even and
    `≤ (1/π)(3/8 + ε)√q log q + h₂ √q` for `χ` odd, with `h₁, h₂` the paper's explicit functions
    of `(E, q, γ, ε, m)` and their tabulated upper bounds as a Prop.

**Layer 4: explicit Burgess inequalities** (`p` prime, `χ` non-principal mod `p`, `M ≥ 0`, `N ≥ 1`).

16. *Treviño 2015, uniform form* (Corollary 1). `p ≥ 10⁷`, any `r ≥ 1`:
    `|S_χ(M, N)| ≤ 2.74 N^{1−1/r} p^{(r+1)/(4r²)} (log p)^{1/r}` (`trevino2015` lines 91–94).
17. *Treviño 2015, tabulated forms.* Theorem 1 (lines 83–88): `2 ≤ r ≤ 10`, `p ≥ p₀` with
    `p₀ ∈ {10⁷, 10¹⁰, 10²⁰}`: `|S_χ(M, N)| ≤ c₁(r, p₀) N^{1−1/r} p^{(r+1)/(4r²)} (log p)^{1/r}`,
    Table 1 (lines 97–106, from `2.7381` to `1.2562`). Theorem 2 (lines 134–141):
    `1 ≤ N ≤ 2p^{1/2 + 1/(4r)}`, `r ≤ 10`, `p ≥ p₀`:
    `|S_χ(M, N)| < c₂(r, p₀) N^{1−1/r} p^{(r+1)/(4r²)} (log p)^{1/(2r)}`, Table 3 (lines 145–155);
    Corollary 2 (lines 156–161): for `r ≥ 3` and `p ≥ 10¹⁰` the restriction on `N` is dropped.
    The tables are the Prop `Trevino_BurgessTables`; the closed-form constants they bound are
    stated from the paper's Section 3 (`c′₁(r)` and the choices of `k`, lines 1012–1024).
18. *McGown 2012* (Theorem A.1; restated as Theorem C in `trevino2015` lines 113–128).
    `p ≥ 2·10⁴`, `1 ≤ N ≤ 4p^{1/2 + 1/(4r)}`, `2 ≤ r ≤ 15`:
    `|S_χ(M, N)| < C(r) N^{1−1/r} p^{(r+1)/(4r²)} (log p)^{1/(2r)}` with `C(2) = 10.0366`, …,
    `C(15) = 1.7700`; the table is the Prop `McGown_BurgessTable`.
19. *Booker 2006* (Proposition 2). `d > 10²⁰` prime, `d ≡ 1 (mod 4)`, `χ_d` the quadratic character
    mod `d`, `r ∈ {2, …, 15}`, integers `0 < M, N ≤ 2√d`:
    `|Σ_{M ≤ n < M+N} χ_d(n)| ≤ α(r) d^{(r+1)/(4r²)} (log d + β(r))^{1/(2r)} N^{1−1/r}`, with
    `α(2) = 1.8221`, `β(2) = 8.9077`, …, `α(15) = 1.3164`, `β(15) = −1.9808` (`booker2006` lines
    350–379); the table is the Prop `Booker_QuadraticBurgessTable`. The quadratic character is
    Mathlib's Legendre symbol, primitive by `ClassicalArithmeticCompletion` §1.5.
20. *Composite moduli* (Jain-Sharma–Khale–Liu 2021, Theorem 1.1). `χ` primitive mod
    `q ≥ exp(exp(9.594))`, `N ≤ q^{5/8}`:
    `|S_χ(M, N)| ≤ 9.07 √N q^{3/16} (log q)^{1/4} (2^{ω(q)} d(q))^{3/4} (q/φ(q))^{1/2}`
    (`jainsharmakhaleliu2021` lines 86–87). Corollary 1.2 (lines 90–91) with constant `12.11` and
    `(log log q)^{1/2}` in place of `(q/φ(q))^{1/2}` is stated under an explicit hypothesis bounding
    `q/φ(q)`.

**Layer 5: explicit sieve upper bounds.**

21. *Brun–Titchmarsh* (Montgomery–Vaughan 1973, Theorem 2). `x, y > 0`, `k, ℓ` coprime positive
    integers, `y > k`: `π(x+y; k, ℓ) − π(x; k, ℓ) ≤ 2y/(φ(k) log(y/k))` (`tmeemt-art14` lines
    84–87; `montgomeryvaughan1973` uncertified). Proved from the forbidden-residue large sieve of
    `SieveMethodsAndPrimePatterns` §2.9. *Weighted forms* (Büthe 2014): for `I = [x, x+y]`,
    `k, ℓ` coprime and non-negative `f ∈ W^{1,1}(I)` with `ρ_I(f) > k`,
    `Σ_{p ∈ I, p ≡ ℓ (k)} f(p) < 2‖f‖₁/(φ(k) log(ρ_I(f)/k)) · (1 + 8/log(ρ_I(f)/k))` and
    `< 3‖f‖₁/(φ(k) log(ρ_I(f)/k))` (Theorem 4.2, `buthe2014` lines 298–314); for `k = 1` and
    `ρ_I(f) > 1`, `Σ_{p ∈ I} f(p) < 2‖f‖₁/log ρ_I(f)` (Theorem 4.3, lines 354–362).
22. *Ramaré–Viswanadham 2021.* Lemma 14: `A ≥ B > d ≥ 1`, `a` coprime to `d`:
    `Σ_{A<m≤A+B, m≡a (d)} Λ(m)/log m ≤ 2B/(φ(d) log(B/d))` (`ramareviswanadham2021` lines
    650–657; the hypothesis `A ≥ B` is theirs, line 658). Lemma 15: `M ≥ max(121, q³)`:
    `Σ_{M<m≤2M, m≡a (q)} Λ(m) ≤ (9/2) M/φ(q)` (lines 667–673), proved from Lemma 14 and a
    closed-form numerical inequality (lines 674–679).
23. *Dimension two* (Siebert 1976). `a, b` coprime with `2 | ab`, `x > 1`:
    `#{p ≤ x : ap + b prime} ≤ 16ω x (log x)⁻² ∏_{p | ab, p > 2} (p−1)/(p−2)` (`tmeemt-art14`
    lines 118–119; `siebert1976` uncertified). *Riesel–Vaughan 1983, Lemma 4:* for `x ≥ e^L` the
    same count is `≤ (16ωx/((log x)(A + log x)) − 100√x) ∏_{p | ab, p > 2} (p−1)/(p−2)` for the
    eleven pairs `(L, A)` from `(24, 0)` to `(690, 8.45)` (lines 126–155; `rieselvaughan1983`
    uncertified); the table is the Prop `RieselVaughan_LA_Table` and the enclosure
    `0.66016 ≤ ω ≤ 0.66017` is the Prop `TwinPrimeConstant_Enclosure`. Both rest on Selberg's
    weights (`SieveMethodsAndPrimePatterns` §1.3) with the explicit dimension-two main term of
    target 24.
24. *Selberg density sum* (Greaves 2001, Theorem 1, p. 52). `κ ≥ 0` on the primes with
    `κ(p) < p`, `Σ_{p<z} κ(p) log p/p ≤ B log z` for some `z ≥ 2`, `s ≥ 2B`:
    `Σ_{d ≤ z^{s/2}} μ²(d) ∏_{p|d} κ(p)/(p − κ(p)) ≥ (1 − exp(−((s/2) log(s/(2B)) − s/2 + B))) ∏_{p<z} (1 − κ(p)/p)⁻¹`
    (lines 165–170; `greaves2001` uncertified).
25. *Integers free of small prime factors* (Fan 2022). `1 < z ≤ x`: `Φ(x, z) < x/log z`, and the
    refined inequality (5) of the paper (`fan2022` lines 157–160; wiki lines 189–191).
26. *Explicit linear sieve* (Nathanson 1996, Theorems 9.7 and 9.8), stated from the book
    (`nathanson1996` uncertified; wiki lines 176–179).

**Layer 6: computational hypotheses as Props**, each a definition with no proof obligation:
`FS_OddSmallModuli`, `Trevino_BurgessTables`, `McGown_BurgessTable`,
`Booker_QuadraticBurgessTable`, `RieselVaughan_LA_Table`, `TwinPrimeConstant_Enclosure`, plus a
Prop for Bordignon's `h₁, h₂` tables (target 15) if the design keeps that corollary. Every other
numerical constant is a closed-form inequality proved inside the argument.

**Checks** (not targets): the `[N, 2N]` forms of targets 7–10; the Cheng–Graham constant before
Patel's correction; the wiki's `65/15` against Hiary's `64/15`; the two versions of Treviño's
`c₂` table; the published `49` against the preprint's `6.5` in target 15; the `λ` of target 6.

## Suppliers

Position in the merge order: after `ProbabilisticAndMetricNumberTheory` (ORDER 260) and
`SieveMethodsAndPrimePatterns` (ORDER 259), before `ExplicitZetaBounds` (a design, not yet in
ORDER), which consumes Layers 1 and 3.

- Mathlib: `DirichletCharacter` with `conductor`, `IsPrimitive`, `primitiveCharacter`, `Even`,
  `Odd`; `gaussSum`, `gaussSum_mulShift_of_isPrimitive`; `SelbergSieve` and `BoundingSieve`
  (`Mathlib/NumberTheory/SelbergSieve.lean`); `ArithmeticFunction.vonMangoldt`,
  `Nat.primeCounting`, `Nat.totient`, `ArithmeticFunction.cardDistinctFactors`, `sigma`;
  `Real.fourierChar`; `ContDiffOn`, the mean value theorem, `Real.cot`. No Kusmin–Landau, no
  Pólya–Vinogradov, no Burgess and no Brun–Titchmarsh is in the pin.
- Tau Ceti: `gaussSum_mul_gaussSum_inv_eq_card_of_isPrimitive`, `gaussSum_sq_of_isPrimitive_of_isQuadratic`
  (`TauCeti/NumberTheory/DirichletCharacter/GaussSum.lean`). No sieve and no character-sum bound.
- `SieveMethodsAndPrimePatterns` (#1495, ORDER 259): §0.5 (dimension, remainder mass, Rankin
  bounds), §1.1 (Selberg diagonal sums), §1.3 (Selberg's optimal weights and upper bound), §1.6
  (the qualitative `progression_upper` and `twin_goldbach_upper`, whose constants this roadmap
  makes explicit), §2.3 (Gauss sums, character Parseval), §2.9 (sharp additive large sieve
  `N − 1 + δ⁻¹`, forbidden-residue form `H − 1 + Q²`, separated Hilbert inequality `π/δ`).
- `CharacterSumsOverFiniteFields` (#1712, another author's draft): 7.1 (Gauss sums of Dirichlet
  characters, `|τ(χ)| = √N`, imprimitive formula), 4.7 and 7.6 (Weil's bound for multiplicative
  character sums of polynomials, prime field and general modulus), Layer 1 (Gauss sums over a
  finite field).
- `LFunctions` (ORDER 24): Layer 4 (`dirichletData`: conductor, parity, Gauss-sum root number),
  for the character records used in Layer 3.
- `ClassicalArithmeticCompletion` (main): §1.5 (the Legendre character is primitive), §1.4 and
  §1.6 (primitive characters of small conductor and products), for target 19.
- `ProbabilisticAndMetricNumberTheory` (#1421, ORDER 260): §2.5 (van der Corput's difference
  theorem), §2.7 (explicit Erdős–Turán inequality `3/(H+1) + 3Σ…`), as context for targets 5 and
  10; nothing is restated.
- `AnalyticNumberTheoryPartI` (#1126, ORDER 84): §0.3 (`θ(x) < 1.000081x` under a finite-range
  input) is available if a target ever needs a Chebyshev bound; none of the targets above does.
- `ComputationalNumberTheory` (#1408, ORDER 185): Layer 4 is the natural later discharger of the
  Layer 6 Props; no supply edge now.

## Consumers

- `ExplicitZetaBounds` (#6894): its targets 7 and 17 consume the derivative tests (targets 2–5)
  for explicit bounds on `ζ(1/2 + it)`, `ζ(1 + it)` and `L(1/2 + it, χ)`; its Layer 5 consumes
  the Pólya–Vinogradov constants (targets 11–15) for `L(1, χ)`.
- `ExplicitPrimeCounting` (#6066): Brun–Titchmarsh and the Ramaré–Viswanadham lemmas (targets
  21–22) for primes in progressions and short intervals.
- `ExplicitNumberFields` (#6064): the Burgess layer (targets 16–19) for the least primitive root
  modulo `p` and `p²`, and Pólya–Vinogradov for class-number inputs.
- `ExplicitMultiplicativeFunctions` (#6897): target 25 (`Φ(x, z)`) and the density sum of target
  24 are the kind of input its Rankin-type averages quote; its own target lists this roadmap only
  as a consumer, so the design should confirm whether an edge in this direction is wanted.
- `EffectiveClassNumbers` (#1406, ORDER 238) and `ErdosProgressionPowers` (#1336, ORDER 187)
  according to the filed statement; neither README mentions Pólya–Vinogradov or Burgess by name,
  so the design should verify what they quote before naming them.
- Beyond the board: the least `k`-th power non-residue (Treviño's Theorem 3, `trevino2015` lines
  197–199), quadratic class-number computation (Booker), norm-Euclidean cyclic fields (McGown),
  squarefree numbers in short intervals (Filaseta), explicit Goldbach-type and Chen-type sieves.

## Sources

All recorded in `packages/ExplicitCharacterSumsAndSieves/sources.toml`; status as there.

Certified (read from a legal copy): `tmeemt-art05`, `tmeemt-art11`, `tmeemt-art14`,
`tmeemt-art15` (the four wiki pages, CNRS-hosted, last updated 2026-01-28);
`granville-ramare-1996` (operator-local scan, Lemmas 8.4–8.6, lines 898–960; OCR is rough);
`patel2022` (arXiv 2009.00769v1, Lemmas 2.3, 3.1, 3.2); `hiary2016zeta` (arXiv 1507.01261v4,
Lemma 1.2); `huxleysargos1995` (ICM Polish digital library, Théorème 1); `bordignonkerr2020`
(arXiv 1909.01052v1, Corollary 1, Theorems 2 and 5); `bordignon2022partial` (Rev. Mat. Iberoam.,
CC BY 4.0; Theorem 1.3 in the arXiv v1 numbering); `bordignon2021` (arXiv 2002.02640v2, context);
`trevino2015` (arXiv 1412.3062v2, Theorems 1–3, Corollaries 1–2, Tables 1–3); `mcgown2012` (arXiv
1011.4501v2, Theorem A.1); `booker2006` (AMS open archive, Proposition 2, Table 1);
`jainsharmakhaleliu2021` (arXiv 2010.09530v2, Theorem 1.1, Corollary 1.2); `buthe2014` (arXiv
1410.7561v2, Definition 4.1, Theorems 4.2–4.3); `ramareviswanadham2021` (HAL, English version,
Lemmas 14–15); `fan2022` (Integers, the theorem).

Uncertified (paywalled, print-only, or blocked; cited by locator, statements taken from the wiki):
`chenggraham2004` (Lemma 3; Project Euclid served an anti-bot page), `rieselvaughan1983` (Lemma 4;
same), `karatsubakorolev2007` (main theorem), `vinogradov2004`, `bordelles2012` (Theorems 5.6,
5.8, 5.12), `huxley1996`, `filaseta1990` (Elsevier), `grahamkolesnik1991`, `qiu1991`,
`bachmanrachakonda2001`, `frolenkovsoundararajan2013`, `montgomeryvaughan1973` (Theorem 2),
`montgomeryvaughan1974` (consumed input only), `siebert1976`, `greaves2001` (Theorem 1, p. 52),
`nathanson1996` (Theorems 9.7–9.8). Waived: `huxley-sargos-2006`.

## Risks

- **Statements copied from a secondary source.** Targets 6, 7–10, 11–13, 21 (Montgomery–Vaughan),
  23, 24 and 26 are stated from the wiki pages because their primary sources cannot be read
  legally; the design must keep the wiki locators and flag each such constant. For target 6 the
  wiki's `λ^{−1/2}` is ambiguous.
- **Constants that differ between versions.** Hiary's `β` (`64/15` in arXiv v4 against the wiki's
  `65/15`); Treviño's `c₂` table (arXiv v2 Table 3 for `p₀ ∈ {10¹⁰, 10¹⁵, 10²⁰}` against the wiki's
  table for `p₀ ∈ {10⁷, 10¹⁰, 10²⁰}`); Bordignon–Kerr's secondary constant (`6.5` in arXiv v1
  against `49` in the published version); Bordignon–Kerr's range (`log q ≥ e^{1088ℓ²}` in the paper,
  `q ≥ exp(1088ℓ²)` on the wiki). The design states the version it can read and records the other
  as a Check; the published Treviño and Bordignon–Kerr texts are paywalled or blocked (the AMS
  open-archive URL served a storefront page).
- **Two open Project Euclid papers could not be fetched** (`chenggraham2004`, `rieselvaughan1983`):
  the service received anti-bot pages. The design can retry; Cheng–Graham's Lemma 3 is superseded
  by Patel's Lemma 2.3 anyway, and Riesel–Vaughan's Lemma 4 is quoted in full on the wiki.
- **Granville–Ramaré's text is an OCR of a scan** (`granville-ramare-1996`); the bound on
  `|f^{(k+1)}|` in the hypothesis of Lemma 8.6 (line 924) is garbled and must be read off the scan
  or recovered from the proof by the design.
- **Proof inputs above the pin.** Montgomery–Vaughan's constant `2` needs the forbidden-residue
  large sieve with constant `H − 1 + Q²` and the explicit estimate of `J(Q)` for the set of primes
  not dividing `k`; `SieveMethodsAndPrimePatterns` §2.9 plans the sieve, and the explicit `J(Q)`
  lower bound (a Selberg density sum, target 24's method) is new here. Siebert's `16ω` needs an
  explicit lower bound for the dimension-two Selberg main term, also new. The Burgess layer needs
  the explicit multiplicity count in Weil's bound for `Σ_x χ(∏(x + a_i))`; the qualitative bound is
  `CharacterSumsOverFiniteFields` 4.7, whose draft is by another author and not on main.
- **Büthe's weighted theorem is not a generalisation of Montgomery–Vaughan's**, so the filed plan
  to obtain 5a as the indicator case must be replaced as described in Scope.
- **Layer 1 on Lean carriers.** The derivative tests quantify over functions with continuous
  derivatives on closed intervals; stating them with `ContDiffOn` and interval sums over
  `Finset.Icc` is routine, but the stationary-phase formula (target 6) also needs the inverse
  function `x_ν` of a decreasing `f'`, which must be defined on the carrier before the statement.
- **Composite-modulus Burgess is `r = 2` only** (target 20). The cubefree `r ≥ 3` extension of 2025
  is outside the filed statement; if `ExplicitNumberFields` needs it, it is a Part II.
- **Cycles.** The triage removes the two potential cycles (`ψ` bounds from `ExplicitPrimeCounting`,
  pointwise bounds from `ExplicitMultiplicativeFunctions`); the design must not reintroduce them by
  importing either roadmap.
