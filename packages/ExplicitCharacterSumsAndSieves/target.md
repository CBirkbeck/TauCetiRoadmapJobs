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


## Addendum: the current explicit record (operator literature check)

The design must state each target at the strength of the current literature and follow the modern route. The table below gives, for every target above, the strongest verified result on record with its source, and lists the results a modern explicit roadmap should add and the methods now standard. Where it says stronger, the design restates the target at that strength and cites that source; false or unproven statements are repaired first; October 2026 preprints are cited as unrefereed with the conditional statement kept alongside; the Landau–Siegel exclusion itself is owned by AnalyticNumberTheoryPartI §0.34, only its numerical instance and consequences are stated here.

## 0. Cross-cutting: the October-2026 zero-free results (both targets)

| statement | what the target cites | strongest current result | vs target | recommended action |
|---|---|---|---|---|
| Landau–Siegel zeros (both targets carry `L(1,χ)`, `q/φ(q)` and progression constants whose classical proofs split on an exceptional zero) | neither target mentions the exclusion | **OpenAI, "Uniform exclusion of Landau–Siegel zeros", 1 Oct 2026** (openai/math, `preprints/Uniform-exclusion-of-Landau-Siegel-zeros-October-1-2026/paper.pdf`, https://github.com/openai/math): Theorem 1, an absolute effective `c > 0` with `(1 − β) log q ≥ c` for every real zero `β ∈ (0,1)` of every primitive non-principal real `L(s,χ)`, `q ≥ 3`. **Numerically explicit form: W. D. Banks, "On the OpenAI proof that Landau–Siegel zeros do not exist", arXiv:2610.15483 (11 Oct 2026, 19 pp.)**, https://arxiv.org/abs/2610.15483 : `(1 − β) log q ≥ 3.0·10⁻³` for `q ≥ 10¹⁰` (Remark 7.1 computes ≈ 3.069·10⁻³), and for every `q ≥ 3` after combining with **Lu–Zaman–Zhao, "Numerical computations concerning Landau–Siegel zeros", arXiv:2602.03626 (v2 20 Oct 2026; DOI 10.1090/mcom/4268)**, https://arxiv.org/abs/2602.03626 : no real zero of any quadratic `L(σ,χ)` with `σ ≥ 1 − 1/(5 log q)` for `q ≤ 10¹⁰`. Qualitative variants: B. Kerr, "A simpler proof that there are no Landau–Siegel zeros", arXiv:2610.21099 (Theorem 1, unspecified absolute `c`; pigeonhole + Masser), https://arxiv.org/abs/2610.21099 ; B. Green, "On Landau–Siegel zeros", hexagon preprint 2610.00311 (local copy; this is a hexagon id, **not** an arXiv id: arXiv 2610.00311 is an unrelated cs paper). openai/math `lean/docs/003.md` lists a Lean statement `SiegelZeros.lean` of the uniform gap with unspecified `c`. | stronger than anything either target assumes | Add to both designs a supplier note: the exceptional-zero branch of every progression constant is empty; take the explicit gap `c = 3.0·10⁻³` as a `Prop` `SiegelGapExplicit` (Banks's `q < 10¹⁰` input is itself an unverified external computation, so it is a named computational hypothesis exactly as the binding rule wants) until AnalyticNumberTheoryPartI §0.34 (`landau_siegel_exclusion`, the owner) is on main. Never re-prove it here. |
| Quasi-Riemann hypothesis for Dirichlet `L`-functions | not mentioned | **OpenAI, "The Quasi-Riemann Hypothesis: a zero-free half-plane Re s > 7/8", 30 Sep 2026** (openai/math `preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/paper.pdf`, 194 pp.; a second folder dated 5 Oct 2026 exists): Theorem 1.1, every Dirichlet `L`-function and every finite-order Hecke `L`-function over `Q(√−3)` has no zero in `Re s > 7/8`; Part I (Theorem 3.1) gives `11/12`. Lean statements at `7/8` for `ζ`, Dirichlet and Hecke are listed in `lean/docs/003.md`. The paper gives **no numerical constants** and its overview says fixed-character constants and lower thresholds may depend on the character. | context only (not explicit) | Record in both Risks sections as a qualitative supplier of power-saving `O`-terms (`ψ(x;q,a)`, `M(x) = O_ε(x^{7/8+ε})`) with unspecified constants; no explicit target changes. The October-2026 OpenAI release contains no preprint on explicit character sums, sieves or multiplicative-function averages (folder names scanned 2026-11-07; the only adjacent items are the quasi-RH, Siegel, Jacobsthal, totient-count, prime-gap and squarefree-values papers). |

## 1. ExplicitCharacterSumsAndSieves (targets 1–26)

### Layer 1: exponential sums under derivative conditions

| statement | what the target cites | strongest current result | vs target | recommended action |
|---|---|---|---|---|
| 1. Kusmin–Landau, `θ ≤ f' ≤ 1−θ`, `f'` monotone: `|S| ≤ cot(πθ/2) ≤ 2/(πθ)` | wiki Art05; Granville–Ramaré 1996 Lemma 8.4 | Landau's cot form is optimal; restated with proof as Lemma 1 of J. Arias de Reyna, "Explicit van der Corput's d-th derivative estimate", arXiv:2407.02094 (2024, preprint), https://arxiv.org/abs/2407.02094 . Asymmetric version: Hiary–Patel–Yang, J. Number Theory 256 (2024) 195–217, DOI 10.1016/j.jnt.2023.09.003, arXiv:2207.02366, Lemma 2.3: `l + 1/U ≤ f' ≤ l + 1 − 1/V` (`U, V > 1`) gives `|S| ≤ (U+V)/π`, https://arxiv.org/abs/2207.02366 | same (cot form optimal); asymmetric form more general | Keep; attribute to Landau 1928 with arXiv:2407.02094 Lemma 1 as a readable proof; add the asymmetric lemma as a separate target. |
| 2. Second-derivative test (Patel 2022 Lemma 2.3): `1/W ≤ |f''| ≤ 1/V` ⇒ `|S| ≤ 2(L/V+2)(2√(W/π)+1)` | Cheng–Graham 2004 Lemma 3, corrected by Patel 2022 | (a) Patel 2022 (Indag. Math. 33(5) (2022) 1012–1032, DOI 10.1016/j.indag.2022.04.007; arXiv:2009.00769v1) eq. (25), the Platt–Trudgian refinement `2((L−1)/V+2)(2√(W/π)+1/2)+1`; (b) **Arias de Reyna arXiv:2407.02094 Lemma 4**: `0 < λ ≤ f'' ≤ Λ` on `(X, X+Y]` ⇒ `|S| ≤ (ΛY+2)(1+4/√(πλ))+1`, which is Patel's bound minus `(L/V+1)` with no extra hypothesis; Lemma 5: `|S| ≤ (2.7937/√λ)(ΛY+2)` for `Y ≥ 1`; (c) A. Yang, J. Math. Anal. Appl. 534(2) (2024) 128124, DOI 10.1016/j.jmaa.2024.128124, arXiv:2301.03165v2, Lemma 2.1 (`f''` monotone): `S ≤ (4/√π)Nhλ₂^{1/2} + Nhλ₂ + (4/√π)λ₂^{−1/2}`, https://arxiv.org/abs/2301.03165 | (b) stronger with the same hypotheses; (c) stronger term by term but needs `f''` monotone | Strengthen the statement to Arias de Reyna's Lemma 4 (Patel's form follows); add Yang Lemma 2.1 as the monotone variant. Patel's published constants are unverified (ScienceDirect blocked; arXiv has only v1). |
| 3. Third-derivative test (Hiary 2016 Lemma 1.2), `β = (64/15)/√η + 3/W^{1/3}` | Hiary 2016; wiki prints 65/15 | **The target is unproven as stated.** Hiary's proof applies Cheng–Graham Lemma 3, which is wrong (off by `√2`); Patel 2022 Lemma 2.5 re-proves the lemma with the same hypotheses and shape but `α₃ = 1/η + (32λ/(15√π))√(η+W^{−1/3}) + 2λη/W^{1/3} + 2λ/W^{2/3}` and `β₃ = 64/(3√π√η) + 4/W^{1/3}` (https://arxiv.org/abs/2009.00769 ; two typos there: "four" derivatives should be three, and `λ` in `α₃` is `λ₃`). 64 vs 65: Hiary's arXiv v4 and his own derivation give 64/15, so 65/15 is a wiki typo, now moot. Alternative: Yang 2024 Lemma 2.4 (`f'''` monotone). | corrected constants are larger (leading `β` coefficient 12.04 instead of 4.27) | Replace the source by Patel 2022 Lemma 2.5 with the corrected constants; drop the 64/65 Check; treat Cheng–Graham Lemmas 2–3 as void everywhere. |
| 4. Fourth/fifth-derivative tests (Patel 2022 Lemmas 3.1–3.2) | Patel 2022, "built from Hiary's α̃₃, β̃₃" | Same lemmas (arXiv v1 verified); they are built from Patel's own corrected `α̃₃, β̃₃`, not Hiary's. Uniform successor: Yang 2024 Lemma 2.5 (explicit k-th derivative test for all `k ≥ 4`, `f^{(k)}` monotone, constants by recursion) and Lemma 2.6 (`k ≥ 10`, `1 < h ≤ 3`: `S ≤ 2.762h^{2/K}Nλ_k^{1/(2K−2)} + 1.02N^{1−2/K}λ_k^{−1/(2K−2)}`, `K = 2^{k−1}`); Patel–Yang, J. Number Theory 262 (2024) 301–334, DOI 10.1016/j.jnt.2024.03.011, arXiv:2302.13444, Lemma 1.4 covers `k ≥ 3`, https://arxiv.org/abs/2302.13444 | different shape; neither dominates everywhere | Keep Patel's lemmas with the provenance fixed; add Yang's uniform test as a separate target (it is the form used in all explicit zeta work since 2024). |
| 5. Iterated van der Corput inequality (inside Granville–Ramaré Lemma 8.6) | Granville–Ramaré, Mathematika 43 (1996) 73–107, DOI 10.1112/S0025579300011608 | No published correction found. Modern explicit forms: Arias de Reyna arXiv:2407.02094 Theorem 7 (free shifts `H₁,…,H_d`, constant `B = 2+2√2`; he notes and repairs an error in van der Corput's 1937 induction); one-step explicit A-process, Yang 2024 Lemma 2.3 = Patel–Yang Lemma 1.2: `S_f(a,N)² ≤ (N−1+q)(N/q + (2/q)Σ_{r<q}(1−r/q)S_{g_r}(a,N−r))` | different shape; not comparable term by term | Keep; add Yang's one-step A-process as the basic target (targets 3–4 and Lemma 8.6 are iterations of it). The scan's garbled hypothesis must still be read off the journal text. |
| 6. Explicit stationary phase, attributed to Karatsuba–Korolëv 2007 | wiki Art05 ("consequence of the main theorem" of KK 2007) | **The target's formula is not Karatsuba–Korolëv's theorem.** KK, Izv. Math. 71(2) (2007) 341–370, DOI 10.1070/IM2007v071n02ABEH002359 (read in full on Math-Net.ru, https://www.mathnet.ru/eng/im1136 ) has one theorem, needing `f''''` and parameters `A, U`, with a weight. The nearest match is Patel's 2021 thesis Thm 2.31 = Patel–Yang 2024 Lemma 1.3 (constants `+4`, `2.865`, not the wiki's `+2`, `1.9`). **Strongest published: Patel–Yang 2024 (JNT 262) Lemma 2.3**, three derivatives, `λ₂ ≤ |f''| ≤ h₂λ₂`, `|f'''| ≤ h₃λ₃`: error `≤ 4.686/√λ₂ + 2·3^{2/3}π^{−2/3}h₂h₃^{1/3}(b−a)λ₃^{1/3} + (5/π)log(β−α+2) + 6`. Refinement: Dhiman–Kadiri–Quesada-Herrera, arXiv:2609.00537 (Sept 2026 preprint), Cor. 0.2 (half-integer endpoints): `2.686/√λ₂ + …`, https://arxiv.org/abs/2609.00537 | the target's `λ₂^{−1/2}` constant is 22.6 vs 4.69; its log term is equal only for `h₂ = 1`; its middle term is worse in the standard regime; only its additive constant is better | Replace the source by Patel–Yang 2024 Lemma 2.3; write `|f''(x_ν)|^{−1/2}` (`f'` decreasing forces `f'' ≤ 0`); the design's reading `λ = λ₂` is confirmed by PY Lemma 1.3. Drop the KK attribution or state KK's actual theorem. |

### Layer 2: integer points near smooth plane curves

| statement | what the target cites | strongest current result | vs target | recommended action |
|---|---|---|---|---|
| 7. First-derivative test, `R ≤ 2c₁Nλ₁ + 4c₁Nδ + 2δ/λ₁ + 1` | Bordellès 2012 Thm 5.6 (uncertified) | No newer explicit statement found. Current edition: Bordellès, *Arithmetic Tales, Advanced Edition*, Universitext 2020, DOI 10.1007/978-3-030-54946-6, ch. 5 "Lattice Points" pp. 355–409 (renumbered; Zhao 2024 cites the Huxley–Sargos theorem there as Theorem 5.5, pp. 373–374) | same (as far as checked; 2020 edition paywalled) | Keep; re-cite to the 2020 edition once its theorem number and constants are read. |
| 8. Second-derivative test, `R ≤ 6((3c₂)^{1/3}Nλ₂^{1/3} + (12c₂)^{1/2}Nδ^{1/2} + 1)` | Huxley 1996; Bordellès 2012 Thm 5.8 | No newer explicit version. Context only: Branton–Sargos, Bull. Sci. Math. 118 (1994) 15–28 (`Nδ` instead of `Nδ^{1/2}`, implicit constants), as quoted in Bordellès arXiv:1901.00170 §4, https://arxiv.org/abs/1901.00170 | same | Keep. |
| 9. k-th derivative test (Huxley–Sargos; explicit form Bordellès 2012 Thm 5.12), `δ ∈ (0,1/4)`, `β_k = 4k²(5e³c_k^{2/(k(k−1))}+1)`, `+8k³(δ/λ_k)^{1/k}` | Bordellès 2012 Thm 5.12; Huxley–Sargos 1995/2006 | **Z. Zhao, "Integral points close to smooth plane curves", arXiv:2407.01778 (2024, expository, 38 pp.)**, https://arxiv.org/abs/2407.01778 , reports an oversight in the major-arc lemma (Bordellès Lemma 5.13: a point outside a proper major arc can still lie on its Lagrange polynomial) and states the corrected Theorem 2.1 (pp. 3–4): the target's constants hold only under an extra disjoint-cover hypothesis on the major arcs; **otherwise `R ≤ α_kNλ_k^{2/(k(k+1))} + β_kNδ^{2/(k(k−1))} + 16k³(δ/λ_k)^{1/k} + 2k²(5e³+1)` with `β_k = 30e³k²c_k^{2/(k(k−1))} + 4k²`** (PDF text extracted locally). Context: Huxley–Sargos 2006 sharper `k = 3, 4` forms, implicit constants. | target's constants are **unproven as stated** (per Zhao); the corrected general form is weaker (`16k³`, `30e³`) | State Zhao's unconditional form (16k³, 30e³) as the target and the 8k³/20e³ form only under his disjointness hypothesis; keep Bordellès/Huxley–Sargos as the original. Zhao is a bachelor's dissertation posted on arXiv, so the design must re-derive the corrected constants rather than cite them as settled. |
| 10. Filaseta reduction `R ≤ 4N/H + (4/H)Σ_{h≤H}|Σe(hf(n))|`, `H ≤ ⌊1/(8δ)⌋+1` | Filaseta, J. Number Theory 35 (1990) 128–149 (uncertified) | Same family; Bordellès arXiv:1901.00170 §4 cites Arithmetic Tales 2012 Exercise 4 p. 350 for the `≪` form with the same range. A Beurling–Selberg/Vaaler majorant (Vaaler, Bull. AMS 12 (1985) 183–216, DOI 10.1090/S0273-0979-1985-15349-2) should give main term about `2δN + N/(H+1)`; constants unverified. | same | Keep; consider the majorant form later after verifying constants. |

### Layer 3: explicit Pólya–Vinogradov inequalities

| statement | what the target cites | strongest current result | vs target | recommended action |
|---|---|---|---|---|
| 11a. Qiu 1991, primitive: `(4/π²)√q log q + 0.38√q + 0.637/√q` | Qiu 1991 via wiki (print only) | **Lapkova 2018, Monatsh. Math. 186(4) 675–678, DOI 10.1007/s00605-018-1177-8, Lemma 3A** (open copy https://pmc.ncbi.nlm.nih.gov/articles/PMC6434993/ ): primitive `χ`, **every `q > 1`**, all intervals: even `(2/π²)√q log q + 0.9467√q + 1.668`; odd `(1/(2π))√q log q + 0.8204√q + 1.0285` (FS's Theorem-2 argument for `q > 25` plus Bober–Goldmakher data for `q ≤ 25`). Qiu's lower-order terms are unconfirmed: Frolenkov 2011 (arXiv:1107.0381 §1.2) prints `0.38√q + 0.608/√q + 0.116√q`. | stronger (leading 0.203/0.159 vs 0.405; all `q`) | Demote Qiu to a remark; make Lapkova Lemma 3A the primitive-character headline. |
| 11b. Qiu, non-principal: `(8√6/(3π²))√q log q + 0.63√q + 1.05/√q` | Qiu 1991 via wiki | Frolenkov–Soundararajan 2013, Ramanujan J. 31(3) 271–279, DOI 10.1007/s11139-012-9462-y, Cor. 1 (row 13a) is stronger for `q ≥ 100`. Qiu's non-principal form appears only on the wiki. | stronger (FS) for `q ≥ 100` | Drop unless the print source is certified; at most a small-`q` complement. |
| 12. Bachman–Rachakonda 2001: `(1/(3 log 3))√q log q + 6.5√q` | BR 2001 (uncertified) | Constants confirmed by Frolenkov 2011 §1.2 and Pomerance 2011 §1 (Ramanujan J. 5 (2001) 65–71). Superseded by FS Cor. 1 wherever `q ≥ 100`. | weaker than FS for `q ≥ 100` | Keep as the all-`q` fallback for non-principal `χ`; FS Cor. 1 is the headline. |
| 13a. FS 2013 non-principal, `q ≥ 1000`: `(1/(π√2))√q(log q+6) + √q` | FS 2013 via wiki | FS 2013 **Corollary 1** with threshold **`q ≥ 100`** according to two independent restatements: Johnston–Ramaré–Trudgian 2023, arXiv:2303.13785 Lemma 13, and Hunter 2016, arXiv:1701.05980 Thm 1.2. Original paywalled. | same bound, weaker range in the target | Lower the threshold to `q ≥ 100` after checking the original; cite "Corollary 1". |
| 13b. FS primitive even, `q ≥ 1200`: `(2/π²)√q log q + √q` | FS 2013 Thm 2 | Lapkova Lemma 3A (row 11a) implies it for `q ≥ 980` and holds for all `q > 1`. | stronger | Strengthen to Lapkova Lemma 3A; keep FS's rounded form as a corollary. |
| 13c. FS primitive odd, `q ≥ 1200`, and `q ≥ 40` under `FS_OddSmallModuli` | FS 2013 Thm 2 | Lapkova Lemma 3A odd case holds for all `q > 1` and implies the target for `q ≥ 33`. | stronger; the Prop is discharged | Replace the Prop `FS_OddSmallModuli` by Lapkova Lemma 3A; its `q ≤ 25` table is the only finite check left (a Prop limited to `q ≤ 25`). |
| 14. Even-character symmetry `max_{M,N}|S| = 2max_N|Σ_1^N χ|` | wiki | Pomerance 2011 §1 (Integers 11 (2011) 531–542, DOI 10.1515/integ.2011.039; author copy https://math.dartmouth.edu/~carlp/pvrev.pdf ) and Frolenkov 2011 eq. (1). | same | Keep, but add the hypothesis `χ` non-principal (for the trivial character `S(q−1−N) = φ(q) − S(N)`); cite Pomerance. |
| 15a. Bordignon–Kerr Cor. 1 (squarefree `q`, `log q ≥ e^{1088ℓ²}`, `c = 6.5` or `49`) | BK 2020 arXiv v1 | **Venue: Trans. Amer. Math. Soc. 373(9) (2020) 6503–6527, DOI 10.1090/tran/8138** (not Bull. Aust. Math. Soc.); arXiv:1909.01052 (v1 only), Cor. 1 verified: range `log q ≥ e^{1088ℓ²}`, `c = 6.5`. Published constant unverified (AMS and Turku block automated access). | same | State with `c = 49` (safe either way; 6.5 implies 49), note 6.5 as the arXiv value; fix the venue. |
| 15b. BK Thm 5 (secondary terms) | BK arXiv v1 | v1 Thm 5 verified: `α > 24`, `ℓ ≥ 2`, `q` squarefree, `log q ≥ exp((ℓ²+ℓ/2)α/((α−16)ℓ²−8ℓ)·22.4ℓ²)`, bound `(2/π²)(¼+1/(4ℓ))√q log q + (6.5 + 2⁹(log q)^{1/(4ℓ)}(log log q)^{1/(4ℓ)}log q/(πq^{1/(αℓ²)}))√q` (even), `(1/π)(…)` (odd). | same | Keep (published constant unverified). |
| 15c. BK Thm 2 (partial Gaussian sums) | BK arXiv v1 | v1 Thm 2 verified: `q` squarefree, `N ≤ q^{1/2+1/(4(r−1))}`, `q ≥ (q/φ(q))⁴2^{4ω(q)−4}`: `|Σχ(n)e_q(an)| ≤ 2Δ_r q^{1/(4(r−1))}N^{1−1/r}`, `Δ_r = 2^{6(1+1/r)}(2r)^{ω(q)/(2r)}τ(q)(q/φ(q))^{1/r}(log q)^{1/(2r)}`. | same | Keep; v1 Cors. 3–4 drop "squarefree" although they come from Thm 2: keep the hypothesis. |
| 15d. Bordignon 2022 "Theorem 1.3": `(2/π²)(3/8+ε)√q log q + h₁√q` etc., "for every primitive `χ`" | arXiv v1 Thm 1.3 (tables `h₁ = 2727`, `h₂ = 5449`) | **Published: Rev. Mat. Iberoam. 38(4) (2022) 1101–1127, DOI 10.4171/RMI/1328, open access, https://ems.press/journals/rmi/articles/3807935** : the result is **Theorem 1.1**, needs **`q ≥ q₀`**, Table 1 `(ε, log log q₀, h₁, h₂)` = (1/10, 22, 1660, 3315), (1/100, 209, 2397, 4789), (1/1000, 2081, 2490, 4975), (1/10⁴, 20796, 2499, 4994); Table 2 for `ε = (1−1/k)/8`; Table 3 (prime `q`) with `log log q₀ ≈ 13.4`. "Theorem 1.3" in print is the Burgess-type bound `5k d(q)^{3/2}N^{1/2}q^{3/16}(log q log log q)^{1/2}` for `q > max{(100k)⁴, e^{e⁸}}`. | stronger (≈40% smaller `h₁, h₂`); the target's "every primitive `χ`" is **false as stated** | Replace by RMI Theorem 1.1 with Tables 1–3; add `q ≥ q₀`; fix the theorem number. |

### Layer 4: explicit Burgess inequalities

| statement | what the target cites | strongest current result | vs target | recommended action |
|---|---|---|---|---|
| 16. Treviño uniform: `p ≥ 10⁷`, all `r ≥ 1`, `≤ 2.74N^{1−1/r}p^{(r+1)/(4r²)}(log p)^{1/r}` | Treviño 2015 Cor. 1 | Same, still the best uniform-in-`r` bound: IJNT 11(5) (2015) 1653–1678, DOI 10.1142/S1793042115400163, arXiv:1412.3062v2, https://arxiv.org/abs/1412.3062 . For `p ≥ 10^1143`, `r ≥ 11`: **Hasanalizade–Lin–Luna Martínez–Martin–Treviño, "Explicit Burgess inequalities for cubefree moduli", arXiv:2511.17778v2 (29 Aug 2026, preprint)**, Thm 1.2 at prime `p` gives ≈ `2.19(1+o(1))E_r(log p)^{1/(2r)}` (recomputed), https://arxiv.org/abs/2511.17778 | same; HLMLT stronger only for huge `p`, `r ≥ 11` | Keep; add the HLMLT large-`p` corollary as a separate preprint-flagged target. |
| 17a. Treviño Thm 1 / Table 1 (`c₁`, `p₀ ∈ {10⁷,10¹⁰,10²⁰}`) | Treviño Thm 1 (published Thm 1.4) | **Francis 2021, J. Number Theory 228 (2021) 87–107, DOI 10.1016/j.jnt.2021.03.018, arXiv:1910.13669v2, Table 6**: `r = 2` with no `N` restriction, even/odd `χ`: `c(2) = 1.5962/1.5734 (10⁷)`, `1.3732/1.3563 (10¹⁰)`, `1.1433/1.1312 (10²⁰)` vs Treviño's 2.7381/2.5173/2.3549; `p₀` from `10⁵` to `10⁷⁵`, https://arxiv.org/abs/1910.13669 | stronger for `r = 2` | Keep Treviño's Table 1; add Francis Table 6 as a target (read the published tables first: arXiv v2 Table 3 has an `r = 8` anomaly and Table 6 repeats `10¹⁰` at `10¹¹`). |
| 17b. Treviño Thm 2 / Table 3 (`c₂`, `(log p)^{1/(2r)}`, "3.7451 … 1.5210", `p₀ ∈ {10⁷,10¹⁰,10²⁰}`) and Cor. 2 | Treviño Thm 2, Cor. 2 | **The roadmap's table is wrong.** arXiv v1 and v2 both tabulate `p₀ ∈ {10¹⁰, 10¹⁵, 10²⁰}`; v2 values run 3.6529 … 1.5216 and are the published ones (Francis reproduces them citing IJNT). The v1 values (3.7451 … 1.5210) are superseded and several are *smaller* than v2's (`r = 2, 10²⁰`: 3.5341 vs 3.5751), so unproved; the wiki's "10⁷" column has no source. **Stronger: Francis 2021 Thm 1.8 / Table 3**: `C(2) = 3.3067 (10⁷), 3.0679 (10¹⁰), 2.9185 (10²⁰)`; `C(10) = 1.4930 (10²⁰)`; no `N` restriction for `3 ≤ r ≤ 6` with `p ≥ 10⁸` and `7 ≤ r ≤ 10` with `p ≥ 10⁹`. | target's table unproved; Francis stronger | Fix the table to the v2 numbers and headings; replace the Prop's content accordingly; add Francis Thm 1.8 as the strongest prime-modulus target. |
| 18. McGown 2012 Thm A.1 (`p ≥ 2·10⁴`, `N ≤ 4p^{1/2+1/(4r)}`, `C(2) = 10.0366 … C(15) = 1.7700`) | McGown 2012 | Verified: arXiv:1011.4501v2 App. A (arXiv title "Norm-Euclidean Galois fields"; published as "Norm-Euclidean cyclic fields of prime degree", IJNT 8(1) (2012) 227–254, DOI 10.1142/S1793042112500133), https://arxiv.org/abs/1011.4501 . Still the only source for `2·10⁴ ≤ p < 10⁵`, for `r = 11..15` with exponent `1/(2r)`, and for `2p^{5/8} < N ≤ 4p^{5/8}` at `r = 2`. | same | Keep; record the title discrepancy; do not confuse with McGown, Funct. Approx. 46 (2012) 273–284. |
| 19. Booker 2006 Prop. 2 (quadratic `χ_d`, `d > 10²⁰`, `α(r), β(r)` table) | Booker 2006 | Verified on the AMS open-archive copy: Math. Comp. 75(255) (2006) 1481–1492, DOI 10.1090/S0025-5718-06-01850-3, https://www.ams.org/journals/mcom/2006-75-255/S0025-5718-06-01850-3/S0025-5718-06-01850-3.pdf ; no sharper explicit quadratic bound found (HLMLT v2 still lists it). | same | Keep. |
| 20a. JSKL Thm 1.1 (`q ≥ e^{e^{9.594}}`, `N ≤ q^{5/8}`, `9.07…`) | JSKL 2021 | Source verified: IJNT 17(10) (2021) 2207–2219, DOI 10.1142/S1793042121500834, arXiv:2010.09530v2 (v1 had 8.01), https://arxiv.org/abs/2010.09530 . **Stronger (preprint): HLMLT arXiv:2511.17778v2 Thm 1.2**, `r = 2`, any `q ≥ 10^1143`, all `N`: `≤ 12.364√N q^{3/16}(log q)^{1/4}(8^{ω(q)}m₂(q))^{1/4}(q/φ(q))^{1/2}`, `m_r = min{τ_{2r}, (τ/2)^{2r−1}, q/(2r)}`; it implies JSKL with 9.07 → 7.36 for `q ≥ 10^1143` (≈ `e^{2632}`, vs `e^{e^{9.594}} ≈ 10^6374`) and no `N ≤ q^{5/8}` (recomputed). Thm 1.1 (`C(2) = 14.275`, exponent `1/8`) needs `q ≳ 10^14068`; Thm 1.3 is an explicit Weil-type moment inequality for cubefree `q`. | stronger (smaller constant, lower threshold, no `N` cap), unrefereed | Keep JSKL as refereed source; add HLMLT Thms 1.1–1.3 as separate preprint-flagged targets (the cubefree `r ≥ 3` extension the target left to a Part II is in the same paper). |
| 20b. JSKL Cor. 1.2 ("12.11 and `(log log q)^{1/2}`", under a `q/φ(q)` hypothesis) | JSKL Cor. 1.2 | **Mis-paraphrased**: the factor is `(log log q + 1.69/log log q)^{1/2}`, and the corollary is unconditional, using `φ(n) > n/(e^γ log log n + 3/log log n)` (`n ≥ 3`; their App. Thm A.1, after Bach–Shallit), https://arxiv.org/pdf/2010.09530v2 | same (target imprecise) | Fix the factor; name the consumed hypothesis as the Rosser–Schoenfeld Thm 15-type bound (from the pointwise sibling), not an ad hoc Prop. |
| 20c. (not in target) composite `r = 2`, twisted, all `N < q` | — | Bordignon, Rev. Mat. Iberoam. 38 (2022) Thm 1.3: `q > max{(100k)⁴, e^{e⁸}}`, `|Σψχ| ≤ 5k d(q)^{3/2}N^{1/2}q^{3/16}(log q log log q)^{1/2}`, https://ems.press/content/serial-article-files/39044 | weaker than HLMLT for `k = 1`; it is the Layer-3 Bordignon input | Add only as the dependency of 15d, with the published constants. |

### Layer 5: explicit sieve upper bounds

| statement | what the target cites | strongest current result | vs target | recommended action |
|---|---|---|---|---|
| 21a. Brun–Titchmarsh, `π(x+y;k,ℓ)−π(x;k,ℓ) ≤ 2y/(φ(k)log(y/k))`, `y > k` | Montgomery–Vaughan 1973 Thm 2 (Mathematika 20 (1973) 119–134, DOI 10.1112/S0025579300004708; uncertified) | **Yamada, "Explicit improvements of the Brun–Titchmarsh theorem for arbitrary intervals", arXiv:2312.16090 (2023, v1, preprint)**, Thm 2: for all `x > 0`, `y > k`: `π(x,x+y;k,a) < 2y/(φ(k)(log(y/k) + 0.8601))`; Thm 3: per-modulus shifts `ξ_k` for `k ≤ 16` (e.g. `ξ₃ = 1.5864`), https://arxiv.org/abs/2312.16090 . Refereed but weaker: Zuniga Alterman, Acta Arith. 202 (2022) 123–160, DOI 10.4064/aa200712-22-6, arXiv:2005.04280, Thm 2: factor `(1 − 0.0271/log(Y/q))` for `Y ≥ 10^25 q`. Not explicit: Maynard, Acta Arith. 157 (2013) 249–296 (`2Li(x)/φ(q)` for `x ≥ q⁸`, `q ≥ q₁` effective, uncomputed); Ramaré–Schlage-Puchta 2008. | Yamada stronger (same hypotheses, additive log shift) | Keep MV as the certified sieve-only target; add Yamada Thm 2 as a separate preprint-flagged target; optionally Zuniga Alterman Thm 2. The claim that "Büthe 2018 refines Brun–Titchmarsh" is **not supported**: Büthe, Math. Comp. 87 (2018) 1991–2009, arXiv:1511.02032, only applies MV. |
| 21b–c. Büthe 2014 Thms 4.2–4.3 (weighted forms) | Büthe 2014 | Verified on arXiv:1410.7561 (Acta Arith. 166(3) (2014) 289–299, DOI 10.4064/aa166-3-5); unchanged, no later weighted explicit BT found. | same | Keep. |
| 22a. Ramaré–Viswanadham Lemma 14 (`Λ(m)/log m` in progressions) | RV 2021 Lemma 14 | Verified: Proc. Steklov Inst. Math. 314 (2021) 203–237, DOI 10.1134/S0081543821040106 (author PDF https://ramare-olivier.github.io/Maths/4191.pdf ). | same | Keep; a `+0.8601` version via Yamada is plausible but not in the literature. |
| 22b. RV Lemma 15: `Σ_{M<m≤2M, m≡a(q)}Λ(m) ≤ (9/2)M/φ(q)`, `M ≥ max(121,q³)` | RV 2021 Lemma 15 | Verified. Its own proof (Lemma 14 × `log(2M)` plus the coefficient bound) gives `2·1.5(1+log 2/log 121) ≈ 3.434` (recomputed), so `3.44` already follows; `< 3` with Yamada's Lemma-14 strength. | target weaker than its own proof | Strengthen to `(7/2)M/φ(q)` (or 3.44) by the same closed-form inequality, or keep 9/2 for fidelity. |
| 23a. Siebert 1976 dimension-two bound `16ω` | Siebert 1976 "Math. Nachr." | Venue corrected: Monatsh. Math. 82(4) (1976) 327–336, DOI 10.1007/BF01540603. No explicit all-`x` improvement of `16ω` found; asymptotic records (Wu 2004, 3.3995; Lichtman arXiv:2109.02851, 3.29956) are not explicit. | same | Keep; fix the venue. |
| 23b. Riesel–Vaughan Lemma 4 table `(L, A)` | RV 1983 | Ark. Mat. 21 (1983) **45**–74, DOI 10.1007/BF02384300 (wiki has 46). Lichtman cites the explicit form as "Lemma 5": check the number. **Platt–Trudgian, "Improved bounds on Brun's constant", arXiv:1803.01925 (2018)**: `π₂(x) < 8Cx/((log x)(log x + F(x))) + 2√x` with closed-form `F`, Preissmann's constant `√(1+(2/3)√(6/5))` in place of `3/2`, and `|E(x)| ≤ 1.0503x^{−2/5}`; `B < 2.288513`, https://arxiv.org/abs/1803.01925 | Platt–Trudgian stronger for twin primes (`a = 1, b = 2`) | Keep the RV table as the Prop; add Platt–Trudgian's closed-form twin-prime bound (no new table). |
| 23c. Prop `TwinPrimeConstant_Enclosure` `0.66016 ≤ ω ≤ 0.66017` | wiki | Consistent with RV's `1.320323 < 2ω < 1.320324` quoted by Platt–Trudgian p. 4. | same | Keep; could become a theorem (finite product + tail). |
| 24. Greaves 2001 Thm 1 p. 52 (Selberg density sum, general `κ`) | Greaves 2001 (uncertified) | Book DOI 10.1007/978-3-662-04658-6 (text not re-read). For `κ ≡ 1` sharper explicit statements exist: MV 1973 Lemma 7 (`Σ_{n≤z}μ²/φ ≥ log z + 1.07`, `z ≥ 6`) and Zuniga Alterman, Colloq. Math. 168 (2022) 1–23, DOI 10.4064/cm8337-11-2020, arXiv:2003.05887 (coprime `Σμ²/φ` with explicit `O*` terms). | same in general `κ` | Keep; fix the wiki's "Theorem (2022)" heading to 2001; add the explicit `κ = 1` asymptotic as a separate target (consumed by 21a and 25). |
| 25. Fan 2022: `Φ(x,z) < x/log z`; refined (5) | Fan 2022 | Verified: Integers 22 (2022) #A26, https://math.colgate.edu/~integers/w26/w26.pdf : (4) as stated; (5) `Φ < x/log z − x/(2log²z)` for `z ≥ max(3,√x)`; **(6) `Φ < 2x/(3 log z)` for `max(2, x^{2/5}) ≤ z ≤ √x`**, omitted by the target. | same; (6) missing | Keep; add (6). |
| 26. Explicit linear sieve (Nathanson 1996 Thms 9.7–9.8) | Nathanson, GTM 164 (uncertified) | **Bordignon–Johnston–Starichkova, "An explicit version of Chen's theorem and the linear sieve", arXiv:2207.09452 (v6, June 2025, "to appear in Int. J. Number Theory")**, Thm 6: explicit Jurkat–Richert/Iwaniec linear sieve with `S < (F(s) + εC₁(ε)e²h(s))X + R` (`D ≥ z`), `S > (f(s) − εC₂(ε)e²h(s))X − R` (`D ≥ z²`), `0 < ε ≤ 1/74`, `C_i` tabulated (`ε = 1/200` gives `≤ 0.77` against ≈ 2210 in Nathanson); they also find and repair an error in Nathanson's proof of Thm 9.5, https://arxiv.org/abs/2207.09452 | stronger (error constants ≈ 3000× smaller; proof repaired) | Replace the source by BJS Thm 6 (Nathanson as template); the `C_i(ε)` table becomes a Layer-6 Prop. |

## 3. Results the targets do not state but a modern explicit roadmap should

ExplicitCharacterSumsAndSieves:
- Asymmetric Kusmin–Landau (Hiary–Patel–Yang 2024 Lemma 2.3) and the one-step explicit A-process (Yang 2024 Lemma 2.3 / Patel–Yang Lemma 1.2), https://arxiv.org/abs/2207.02366 , https://arxiv.org/abs/2301.03165 .
- Uniform explicit k-th derivative tests: Yang 2024 Lemmas 2.5–2.6, Patel–Yang 2024 Lemma 1.4, Arias de Reyna's max-form theorem (`A_d < 7.5`, `B_d < 5.8`, `C_d < 10.9`), https://arxiv.org/abs/2407.02094 .
- Explicit truncated Poisson formula (Patel–Yang Lemma 2.1: error `(3/π)log(β−α+2) + 4`), single-integral stationary phase (Patel–Yang Lemma 2.2), DKQ 2026 refinements, https://arxiv.org/abs/2302.13444 , https://arxiv.org/abs/2609.00537 . Second-derivative test without monotone `f''`: Bordellès–Daval 2026 Lemma 8, https://arxiv.org/abs/2601.01905 .
- Pólya–Vinogradov: Lapkova 2018 Lemma 3A (all `q`); Pomerance 2011 Thm 1 (self-contained, a good first Lean target), https://math.dartmouth.edu/~carlp/pvrev.pdf ; Levin–Pomerance–Soundararajan 2010 smoothed bound `≤ √q − N/√q` (no log), https://math.dartmouth.edu/~carlp/brizolisants.pdf ; Johnston–Ramaré–Trudgian 2023 Lemma 16 medium-length sums `√(2N)q^{1/4} + √q`, https://arxiv.org/abs/2303.13785 ; Bordignon–Francis, Integers 24 (2024) #A66 (explicit Fromm–Goldmakher transfer PV → Burgess), https://math.colgate.edu/~integers/y66/y66.pdf .
- Burgess: Francis 2021 Tables 3 and 6; HLMLT 2026 Thms 1.1–1.3 (cubefree `r ≥ 3`, explicit Weil-type moment); Treviño's explicit moment bound `Σ_x|Σ_{b≤B}χ(x+b)|^{2r} ≤ (2r−1)!!B^rp + (2r−1)B^{2r}√p` (JNT 149 (2015)), which every prime-modulus row consumes and should be its own target between the Weil bound and Layer 4.
- Sieves: Yamada 2023 Thms 2–3; explicit `Σ_{q≤z,(q,k)=1}μ²(q)/φ(q)` (MV Lemma 7; Zuniga Alterman 2022); Preissmann's constant `√(1+(2/3)√(6/5))` (Enseign. Math. 30 (1984) 95–113; seen only via Yamada and Platt–Trudgian); Platt–Trudgian's twin-prime bound and `1.840503 < B < 2.288513`; BJS explicit linear sieve and Chen's theorem for `N > exp(exp(32.7))`; Johnston–Starichkova, arXiv:2208.01229 (every even `N ≥ 4` is `p + P_{395}`); explicit Chebotarev Brun–Titchmarsh (Debaene arXiv:1611.10103; Hu–Iyer–Shashkov arXiv:2208.10459) if the number-field roadmap wants it.

ExplicitMultiplicativeFunctions:
- `M(x)`, `m(x)`: Chirre–Helfgott 2025 Cors. 1.2–1.3 and 6.8 (`|M| ≤ (π/(2·10⁷))x + 6.738√x` with less data); Daval 2023 linear bounds; Johnston–Leong–Tudzi 2024 Thms A.1–A.2 and their `c_M x/(log x)^k` table; Lee–Leong, arXiv:2208.06141 (v5 Sept 2026): `|M(x)| < 33.56x log x·exp(−√(log x)/5.56)` for `x ≥ e^{4589.2}`, the only explicit de la Vallée Poussin-shape bound; El Marraki 1995 `0.002969x/√(log x)` for `x ≥ 142 194`; Bordellès 2015 Thm 2 coprime `log⁻²` bounds (`⌈C₁⌉ = 12 555`); finite-range tables as Props: Hurst `0.570591√x` to `10¹⁶`, Helfgott's `|m(x)| ≤ 0.569449/√x` to `10¹⁴`.
- Ramaré–Zuniga Alterman "identity factory" arXiv:2312.05138: Thm 1.2, Thms 1.7–1.8, Thm 1.3 (`Σ_{n≤X}Λ(n)/n ≤ log X`).
- Squarefree numbers: MOT 2021 Thm 2 (to `10¹⁸`) and Thm 3 (cube-free); CH25 Cor. 7.13, Lemma 7.12, Prop. 8.4; Platt–Trudgian Lemma 1 (`1.0503t^{−2/5}` model); Bordellès–Daval 2026 Thm 1 and Cor. 1 (`∫_x^∞Δ(u)u^{−2}du ≥ 0`); Zuniga Alterman 2022 Cor. 3.4 (coprime `Σμ²/φ`, `Σμ²/ℓ` with `O*(7.36A_qX^{−1/3})`) and Lemma 4.1 (odd case `0.407/√X` for `X ≥ 1`); Kumchev et al., arXiv:2211.09975 (a squarefree in every `[x, x + 11x^{1/5}log x]`).
- Divisor sums: Bordellès 2006 Thm 2.1; Tudzi 2025 (`k = 3`; `k = 4,5,6` with thresholds `10¹¹`–`10¹³`); Palojärvi–Tudzi 2026 Table 2 (current best explicit `|Δ_k|` per range); Bordellès 2024 Thm 1 (explicit Shiu-type short sums; astronomically large thresholds), https://arxiv.org/abs/2402.12333 .
- Mertens products and sums: Axler 2018 Props. 5.1 and 6.1 (`log⁻³` shape for all `x > 1`), Axler 2022 Thm 1.5 and Cor. 6.2 (`∏(1+1/p)` with factor `6e^γ/π²`); Vanlalngaia 2017 Cor. 1 (`Σ_{p≤x}1/p = log log x + B + O*(4/log³x)` for `x ≥ 2`, `1/log³x` for `x ≥ 24 284`), which also fixes review F12's route; Languasco–Zaccagnini's 100-digit `C(q,a)`, `M(q,a)`, `B(q,a)` tables (Math. Comp. 78 (2009), Exp. Math. 19 (2010)) as the content of `BordellesProgressionProductTableValid`; Garcia–Lee, "Unconditional explicit Mertens' theorems for number fields and Dedekind zeta residue bounds", Ramanujan J. 57 (2022) 1169–1191, DOI 10.1007/s11139-021-00435-6, arXiv:2007.10313 (explicit in degree and discriminant, `x ≥ 2`), https://arxiv.org/abs/2007.10313 — for ExplicitNumberFields rather than here.
- Pointwise: Rosser–Schoenfeld Thm 15 `n/φ(n) < e^γlog log n + 2.50637/log log n` (`n ≥ 3`; verified p. 72 of the local copy) — the `q/φ(q)` input the character-sums sibling and JSKL Cor. 1.2 actually use; Nicolas 2008 Thm 1 (`φ(n)`-form); Axler–Nicolas 2023 Thm 1.2 (`n/φ(n)` for `n ≥ exp(1.25·10¹⁰)`); Robin 1984 Thm 2 and Axler–Nicolas (1.22) for `σ(n)/n`; DNR 1999 two-term `log τ(n)` bound and Thm 1.1(ii)–(iii).

## 4. Methods now standard where the targets use an older route

- **Cheng–Graham 2004 Lemmas 2–3 are void**; everything built on them (Hiary 2016 Lemma 1.2, Platt–Trudgian 2015, Trudgian's `|ζ(1+it)| ≤ (3/4)log t`) has been re-derived (Patel 2022; Hiary–Patel–Yang 2024). Since 2022 the B(0,1) step is done by Kusmin–Landau on pieces where `f'` is away from integers, and `AⁿB` is applied as one block with recursive constants (Yang 2024; Patel–Yang 2024), replacing case-by-case 3rd/4th/5th tests. True B-processes use Patel–Yang Lemma 2.3 (three derivatives), not Karatsuba–Korolëv.
- **Pólya–Vinogradov**: Landau's Gauss-sum expansion with sharp `Σ|sin nx|/n` bounds and a cut-off parameter (Pomerance 2011, FS 2013, Lapkova 2018) instead of Dobrowolski–Williams; Fejér smoothing + Poisson (LPS 2010) removes the log; explicit partial Gaussian sums by Burgess + geometry of numbers (Bordignon–Kerr) only for astronomically large `q`.
- **Burgess**: cap the induction with FS's PV bound and refine the degenerate-tuple count with Euler–Maclaurin (Francis 2021); for composite `q`, `m_r(q) = min{τ_{2r}, (τ/2)^{2r−1}, q/(2r)}` inside the Iwaniec–Kowalski scheme (HLMLT) instead of `d(q)^{2r−1}`; thresholds from explicit `2^{ω}`, `τ` bounds (Nicolas–Robin) consumed from the pointwise sibling.
- **Brun–Titchmarsh**: MV large sieve with Preissmann's constant, an explicit `Σμ²/φ` asymptotic, and machine verification of the small range (Yamada), or Selberg Λ² with Barban–Vehov weights (Zuniga Alterman). **Linear sieve**: computed `f_n(s)` bounds (BJS) instead of Nathanson's analytic `c_n`. Exceptional-zero case splits in explicit sieve papers (BJS, Johnston–Starichkova) can be removed by Banks's explicit gap.
- **Möbius sums**: Fourier/Beurling–Selberg method with finitely many zeros and residues `1/ζ'(ρ)` (Chirre–Helfgott) and linear-to-linear ψ conversion (Daval) for `εx` bounds; the Ramaré 2013 identity with current ψ inputs (Büthe; BKLNW 2021; Fiori–Kadiri–Swidinsky 2023; Johnston–Yang 2023) and JLT's iteration to exponent 2.35 for `x/log^k x` bounds; Balazard's inequality refined by Daval for `M → m, m̌`; the RZA identity factory for coprime/mollified sums.
- **Averages**: convolution method pushed to the critical exponent (Zuniga Alterman 2022); `τ/n` model with exponent `−2/5` (Platt–Trudgian) or `−1/2` via `Δ` (Bordellès–Daval); Perron + explicit ζ moments for `Δ_k` (Palojärvi–Tudzi); and **real-argument verification at both ends of every step** (MOT's proof of Thm 2), which is what exposed the integer-only thresholds in BBR, CDE, Cipu, Ramaré 2019 and Zuniga Alterman 2022.
- **Mertens products**: the Rosser–Schoenfeld identity fed with current θ-bounds (Axler 2018/2022); superior-highly-composite-number searches with explicit ε-windows (Teo 2026) and Nicolas's benefit method for pointwise maxima; BMOR 2018 θ(x;q,a) bounds for `q ≤ 10⁵`, with Banks's `0.003/log q` replacing BMOR Prop. 1.11 for larger `q`.

## 5. Unverified or unreachable in this run

Published texts of Hiary 2016, Patel 2022, Treviño's and Francis's tables, Frolenkov–Soundararajan 2013, Bordignon–Kerr's published constant, Qiu 1991, Bachman–Rachakonda 2001, Siebert 1976, Riesel–Vaughan 1983 (Lemmas 2 and 4/5), Greaves 2001, Nathanson 1996, Arithmetic Tales 2012/2020 theorem numbers, Filaseta 1990, Huxley–Sargos 1995/2006, Karatsuba–Korolëv's Doklady note (the wiki's actual citation), Ramaré 2015 and its corrigendum (theorem numbers, Cor. 1.3, 17/125), de Camargo's `M_q` constants, Daval 2025's constants (seen via Chirre–Helfgott), Cohen–Dress 1988, CDE 2007 full text, Daboussi–Rivat 2001, BBR 2012 journal page, Dubbe 2020, Cipu 2015 lemma texts, Bordellès 2005 (EMIS down), Dusart 2018 Thm 5.9 (via Axler), Languasco–Zaccagnini 2007, Ivić 1977, Robin 1984 (via Axler–Nicolas), Eum–Koo 2015 theorem text. Preprints without journal references: Arias de Reyna 2407.02094, DKQ 2609.00537, Yamada 2312.16090, HLMLT 2511.17778, Daval 2308.10084, JLT 2408.04143, Chirre–Helfgott 2511.14736, Lee–Leong 2208.06141, RZA 2312.05138, Zhao 2407.01778 (a bachelor's dissertation), Banks 2610.15483, Kerr 2610.21099. Ramaré's arXiv:2605.29470 is withdrawn and must not be used. Searches not completed because of the quota: explicit PV for prime-power/smooth/odd-order moduli, explicit GRH PV, explicit Möbius sums in progressions 2019–2026, 2023–2026 explicit `Φ(x,z)` bounds, Klyve 2007, Ramaré 2009's large-sieve book.
