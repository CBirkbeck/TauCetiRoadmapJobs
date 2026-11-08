Verdict: design
Name: ExplicitZetaBounds
Base: none
Owner: none

## Scope

**What the roadmap owns.** The numerically explicit inequalities of analytic number theory that
bound the Gamma function and its logarithmic derivatives, the Riemann zeta function and Dirichlet
L-functions, count their zeros with explicit error terms, localise their zero-free regions with
explicit constants, bound their zero densities, bound `L(1, χ)`, and supply the explicit Perron,
mean-value and weighted large-sieve tools those results rest on. The filed statement's eight layers
are kept, with the boundaries below; the roadmap is the quantitative layer above
`TauCetiRoadmap/ZerosOfLFunctions`, which proves every shape here with existential constants and
declares decimal constants out of its scope (its "Not owned here" list).

**Conventions fixed once.** `f = g + O*(h)` is the predicate `‖f − g‖ ≤ h`, defined once as
`BigOStar` and never unfolded in a statement. Every theorem is stated on the general carrier the
source allows: Mathlib's `riemannZeta`, `DirichletCharacter.LFunction` for a primitive character of
conductor `q` (the records of `TauCetiRoadmap/LFunctions` Layer 4 supply conductor, parity and
functional equation), Dirichlet series with the stated summability, arbitrary `δ`-separated finite
families in `ℝ/ℤ`, sectors `|arg s| ≤ π − δ` for Gamma. Every result that rests on a computation
takes that computation as a `Prop` parameter (see Layer 8 below); the analytic argument is proved
from the hypothesis.

**Boundaries settled by this triage.** These adjust the filed statement where another roadmap
already plans the theorem; each is a note for the design.

- *Sharp large sieve (filed Layer 4).* `SieveMethodsAndPrimePatterns` §2.9 already plans the sharp
  additive large sieve with constant `N − 1 + δ⁻¹` (`SieveTaper.sharp_additive_largeSieve`), the
  separated Hilbert inequality with constant `π/δ`, and the sharp primitive-character form
  `H − 1 + Q²` (`SieveApplications.sharp_primitive_largeSieve`). This roadmap consumes them and owns
  only the weighted form `Σ_x (N + c δ(x)⁻¹)⁻¹ |S(x)|² ≤ Σ |a_n|²` with Preissmann's constant
  `c₀ = √(1 + (2/3)√(6/5))`, Elliott's maximal variant, and the Gallagher-type character and
  Dirichlet-polynomial mean values of Ramaré 2016 (Corollaries 6.3 and 6.4).
- *Weighted Hilbert inequality and the Dirichlet-polynomial mean square.* `AnalyticNumberTheoryPartI`
  §1.5a plans Montgomery–Vaughan's weighted Hilbert inequality with the constant `3π/2` (that is
  `c = 3/2`) and §1.5 the mean square with error `6π Σ n|a_n|²`. This roadmap consumes both shapes
  and owns the sharper constants: Preissmann's `c₀` in the weighted large sieve and Ramaré's
  `Σ |a_n|² (T + O*(2π c₀ (n + 1)))` (Lemma 6.2 of the 2016 paper, with `π c₀` for real coefficients).
- *Complex `log Γ`.* `ZerosOfLFunctions` 1.1–1.4 supply the sector branch of `log Γ` with an
  `O(1/|s|)` Stirling remainder; `AnalyticNumberTheoryPartI` §0.23a supplies the slit-plane branch,
  its Stieltjes-integral remainder `R(z) = ∫₀^∞ Q(t)(z + t)⁻² dt` and the derivative bounds
  `|R^{(j)}(z)| ≤ j! sec^{j+2}(arg z /2)/(8|z|^{j+1})`. This roadmap consumes those branches and
  identities and owns the explicit constants: the `n`-term Stirling series with remainder
  `|B_{2n}|/(2n(2n−1)|s|^{2n−1} cos^{2n−1}(arg s/2))`, the sector bound `|ξ_s| ≤ 1/(12 sin²(δ/2)|s|)`
  and the two-sided modulus bounds of Ramaré's *Excursions* §20.2, and every real-axis inequality of
  Layer 0 (Alzer, Batir, Ramanujan–Mortici–Chen, Diamond–Straub, Allasia–Giordano–Pečarić,
  Mortici). `AnalyticNumberTheoryPartII` §4.3a is the analogous remainder for the Barnes `G`
  function and is not this roadmap's.
- *Explicit digamma and trigamma series remainders* are `ComputationalNumberTheory` §4.17a; Layer 0
  here consumes them where a finite digamma series is truncated.
- *Convexity with explicit constants (filed Layer 1, Rademacher).* `ZerosOfLFunctions` Layer 3 gives
  convexity with an implied constant; `AnalyticNumberTheoryPartI` §2.21 gives Rademacher's shape for
  finite-order Hecke L-functions with an absolute, still inexplicit, implied constant. This roadmap
  owns the fully explicit bound on the general carrier: for a record `d` of `LFunctions` Layer 0 with
  Dirichlet agreement, continuation, functional equation and nonnegative coefficient majorant of
  degree `n` and arithmetic conductor `N`, in `−η ≤ Re s ≤ 1 + η`, `0 < η ≤ 1/2`,
  `‖continuedL d s‖ ≤ P(s) (N (|1 + s|/(2π))^n)^{(1+η−σ)/2} ζ(1+η)^n` with `P(s) = 3|(1+s)/(1−s)|`
  when `d` has a pole at `1` and `P = 1` otherwise, and its instance for primitive Dirichlet
  characters (Rademacher's Theorem 3). The Dedekind instance (Rademacher's Theorem 4, the factor `3`
  and `|d_K|`) is stated by the open target `ExplicitNumberFields` (#6064), whose filed Layer 1 claims
  it; it is a one-line specialisation of the general theorem here and is not restated here.
- *Dedekind constants.* Explicit zero counts, zero-free regions and zero densities for `ζ_K` with
  `K ≠ ℚ` (Trudgian's Theorem 2, Kadiri 2012, Kadiri–Ng 2012 beyond its `ζ` case) belong to
  `ExplicitNumberFields`. Layers 2, 6 and 7 here are for `ζ` and Dirichlet L-functions only;
  Kadiri–Ng 2012 (explicit `N_K(T)` and a region for `ζ_K`) is not cited by any target here.
- *Explicit prime bounds* (`ψ`, `θ`, `π`, Rosser–Schoenfeld, Schoenfeld) belong to
  `ExplicitPrimeCounting` (#6066) and, for the two finite-range instances it already plans, to
  `AnalyticNumberTheoryPartI` §§0.3 and 0.5. Nothing about primes is proved here.
- *Hypothesis C7.* `ComputationalNumberTheory` §4.22 plans `platt_bounded_height`: for primitive `χ`
  of modulus `q ≤ 400 000`, every zero of `L(s, χ)` in the open strip with `|Im s| ≤ H(q)`,
  `H(q) ≥ 10⁸/q`, has real part `1/2`, as a theorem reconstructing Platt's computation. The
  hypothesis `GRH(q, 10⁸/q)` for `q ≤ 400 000` is therefore not a target of this roadmap: the
  theorems that need it (Kadiri 2018, `R₂ = 5.60`) take it as a parameter, and one bridging lemma
  derives the parameter from §4.22 once that roadmap is merged. Likewise `ComputationalNumberTheory`
  §4.24 (no real zero for `q ≤ 400 000`) discharges the low-conductor real-zero clause of Layer 6.
- *Global hypotheses.* `AnalyticNumberTheoryPartI` §1.6 owns `DirichletGRH χ` and `GRH`;
  `ZerosOfLFunctions` Layer 9 owns `GRH` over its two families, `HasZerosInRects` and
  `AllOnCriticalLine`. Layer 8 here defines the bounded-height Props `RH(H)` and `GRH(q, H)` as
  `AllOnCriticalLine` of the entire completion on the rectangle `Icc 0 1 ×ℂ Icc (−H) H`, proves them
  antitone in `H`, and proves that `∀ H, GRH(q, H)` is `DirichletGRH` for every primitive character
  of conductor `q`. The sibling targets `ExplicitPrimeCounting` (its H1, H2) and
  `ExplicitMultiplicativeFunctions` (its `RiemannZerosVerified(T)`) import these Props by name; the
  mod-8 bounded-zero clause of `AnalyticNumberTheoryPartI` §1.4 (`ModEightFiniteInput`) is the
  instance `GRH(8, 10000)` of C6.
- *Unrefereed computations.* The ZetaGrid and Gourdon–Demichel announcements (filed C5) are
  recorded in the README as context for the papers that cite them; they are neither sources nor
  targets. Every theorem that a published paper proves from them is stated here from `RH(3·10¹²)`
  (C4), which implies them.
- *Vinogradov–Korobov constants* (Ford's `76.2 t^{4.45(1−σ)^{3/2}} log^{2/3} t`, the regions with
  `A = 58, 55.241, 53.989`, Khale's region) rest on an explicit form of Vinogradov's mean value
  theorem that no roadmap on the board plans. They stay in scope as the last layer, but the design
  must name that supplier as a declared gap (or file it as its own target) rather than plan it
  inside this roadmap; see Risks.
- *No algorithm, no interval arithmetic.* Tables of constants, nonnegative trigonometric polynomials
  with tabulated coefficients and finite numerical verifications are `Prop` parameters (C8–C11 of
  Layer 8), stated once each, with the dependence of every theorem on them visible in its
  signature. The roadmap proves nothing by computation.

**Layers retained from the filed statement.** Layer 0 (Gamma, digamma, polygamma, real and
complex), Layer 1 (pointwise bounds for `ζ` and `L(s, χ)`), Layer 2 (explicit zero counting for
`ζ` and `L(s, χ)`), Layer 3 (Ramaré's truncated Perron formulas, the majorant principle, explicit
mean values and Helfgott's `L²` tail bounds), Layer 4 (weighted and maximal large sieves), Layer 5
(`|L(1, χ)|` above and below), Layer 6 (explicit zero-free regions, classical and
Vinogradov–Korobov, and the real-zero bound), Layer 7 (zero densities), Layer 8 (bounded-height
verified-zero Props and the computational hypotheses C1–C4, C6, C8–C11 as named targets).

## Final targets

Each is a headline theorem for `Suggested.lean`, stated with its hypotheses; `O*` is the predicate
above; `χ` is always a primitive Dirichlet character of conductor `q`, `s = σ + it`.

1. **Alzer's brackets for `log Γ` and polygamma** (Alzer 1997, Theorems 8 and 9). For real
   `x > 0` and `m ≥ 0`, the Euler–Maclaurin partial sums with `2m` and `2m + 1` terms bracket
   `log Γ(x) − (x − 1/2) log x + x − log √(2π)`; for `k ≥ 1`, `n ≥ 0`,
   `S_k(2n, x) < (−1)^{k+1} ψ^{(k)}(x) < S_k(2n + 1, x)`. No computational hypothesis.
2. **Batir's two-sided bounds** (Batir 2008, Theorems 1.1 and 1.5) and the sixth-root bound of
   Ramanujan with Mortici's monotonicity proof (Mortici 2011, Theorem 1; Andrews–Berndt, Lost
   Notebook IV, p. 118), Mortici's eighth-root refinement for `x ≥ 3`, and Chen's relative-error
   bound `2117/(5080320 x⁷)` for `x ≥ 2` (Chen 2016, Theorem 1). No computational hypothesis.
3. **Diamond–Straub comparison of `ψ` with `F_N(λ, x)`** in its four cases according to `N mod 4`
   and the position of `λ` relative to the root `λ₀` in `[0, 1/2]` (Diamond–Straub 2016, Theorem 3.1; the
   complete-monotonicity statement for `log Γ` is its Theorem 1.2),
   with the half-shifted polygamma bounds of Allasia–Giordano–Pečarić 2002 (Theorem 2) and
   Mortici's bound for `ψ(x + 1) + log(e^{1/(x+1)} − 1)` (Mortici, Hacettepe 2011, Theorem 1).
4. **Complex Stirling with constants** (Ramaré, *Excursions*, §20.2; NIST DLMF 5.11.10). For
   `s = |s| e^{iφ}`, `|φ| ≤ π − δ`: `Γ(s) = √(2π) exp((s − 1/2) log s − s + ξ_s)` with
   `|ξ_s| ≤ 1/(12 sin²(δ/2) |s|)`; for `σ > 0` the bounds
   `√(2π) |s|^{σ−1/2} e^{−π|t|/2} e^{−σ³/t²} ≤ |Γ(s)| ≤ √(2π) |s|^{σ−1/2} e^{−π|t|/2} e^{1/(6|s|)}`;
   and the `n`-term series with remainder `|B_{2n}|/(2n(2n−1)|s|^{2n−1} cos^{2n−1}(arg(s)/2))`.
5. **Explicit convexity on the general record** (Rademacher 1959, Theorems 3 and 4), as stated in
   Scope, with the Dirichlet instance
   `|L(s, χ)| ≤ (q|1 + s|/(2π))^{(1+η−σ)/2} ζ(1 + η)` for `q > 1`, `−η ≤ σ ≤ 1 + η`, `0 < η ≤ 1/2`.
6. **Backlund's strip bounds** (Backlund 1918, equations (53)–(54), (56), (76)): for `t ≥ 50`,
   `|ζ(s)| ≤ log t − 0.048` for `σ ≥ 1`; `≤ (t²/(t² − 4)) (t/(2π))^{(1−σ)/2} log t` for
   `0 ≤ σ ≤ 1`; `≤ (t/(2π))^{1/2−σ} log t` for `−1/2 ≤ σ ≤ 0`. Together with Kadiri's approximate
   functional equation with explicit error (Kadiri 2013, Theorem 1.2) and the right-of-one bounds
   `|ζ(s)| ≤ e^{γ(σ−1)}/(σ − 1)` (Ramaré 2016, Lemma 5.1, after Bastien–Rogalski) and
   `−Re(ζ'/ζ)(s) ≤ 1/(σ − 1) − 1/(2σ²)` (Delange 1987).
7. **Critical-line and one-line bounds.** Lehman's `|ζ(1/2 + it)| ≤ 4 (t/(2π))^{1/4}` for
   `t ≥ 64/(2π)` (Lehman 1970, Lemma 2), extended to `t ≥ 0.2` under C8; Cheng–Graham's
   `3 t^{1/6} log t` for `t ≥ e` (2004, Corollary to Theorem 3), Trudgian's `2.38` (2014, Corollary
   1) and Hiary's `0.63` for `t ≥ 3` (Indag. 2016, Theorem 1.1), the last under C11 for its
   interval-arithmetic step; Trudgian's `|ζ(1 + it)| ≤ (3/4) log t` for `t ≥ 3` (Bull. Aust. 2014,
   Theorem 1) and Patel's three-way minimum (2022, Theorem 1.1, under C11); Thorner–Zaman's
   `|L(1/2 + it, χ)| ≤ 2.97655 (q|1 + it|)^{1/4}` (2024, Proposition 2.10, under C11); Hiary's
   hybrid bound `9.05 d(q) (q|t|)^{1/6} (log q|t|)^{3/2}` for `q` a sixth power, `|t| ≥ 200`
   (Acta Arith. 2016, Corollary 1.1 of Theorem 1.2, under C11). The van der Corput derivative tests these proofs
   use are consumed from the sibling target `ExplicitCharacterSumsAndSieves` Layer 1 (see Risks on
   the order of supply).
8. **Explicit Riemann–von Mangoldt for `ζ`.** With `M(T) = (T/2π) log(T/2π) − T/2π + 7/8`,
   `N(T) = M(T) + O*(0.137 log T + 0.443 log log T + 1.588)` for `T ≥ 2` (Rosser 1941, Theorem 19),
   `O*(0.112 log T + 0.278 log log T + 2.510 + 1/(5T))` for `T ≥ e` (Trudgian 2014, Section 5),
   and the two Hasanalizade–Shen–Wong forms for `T ≥ e` (2022, Corollary 1.4). Here `N(T)` is
   `ZerosOfLFunctions` Layer 4's `zeroCount` of the entire completion on `Icc 0 1 ×ℂ Ioc 0 T`.
9. **Explicit zero count for `L(s, χ)`** (Bennett–Martin–O'Bryant–Rechnitzer 2021, Theorem 1.1):
   for `q > 1`, `T ≥ 5/7`, `ℓ = log(q(T + 2)/(2π)) > 1.567`, the number of zeros with
   `|Im ρ| ≤ T` is `(T/π) log(qT/(2π)) − T/π − χ(−1)/4 + O*(0.22737 ℓ + 2 log(1 + ℓ) − 0.5)`.
10. **Lehman's weighted zero sum** (Lehman 1966, Lemma 1): for `φ` continuous, positive and
    decreasing on `[T₁, T₂]`, `T₁ ≥ 2πe`,
    `Σ_{T₁ < γ ≤ T₂} φ(γ) = (1/2π) ∫ φ(t) log(t/2π) dt + O*(4 φ(T₁) log T₁ + 2 ∫ φ(t) dt/t)`.
11. **Ramaré's truncated Perron formula** (Ramaré 2007, Theorem 7.1; modified forms, Ramaré 2016,
    Theorem 1.1): for `F(z) = Σ a_n n^{−z}` absolutely convergent on `Re z > κ_a`, `κ > κ_a`,
    `x ≥ 1`, `T ≥ 1`, the partial sum `Σ_{n ≤ x} a_n` equals the truncated integral up to
    `O*(∫_{1/T}^∞ Σ_{|log(x/n)| ≤ u} |a_n| n^{−κ} · 2x^κ du/(T u²))`. Tau Ceti's
    `truncatedPerron_LSeries` and `norm_truncatedPerron_LSeries_sub_sum_le` supply the shape and the
    Davenport-type error; the smoothed error is new.
12. **Majorant principle and mean values.** Montgomery's majorant principle with the optimal
    constant `3` (Montgomery 1994, Chapter 7, Theorem 3) and Logan's lower bound `T Σ a_n²` for
    nonnegative coefficients (Logan 1988, Theorem 1); Ramaré's
    `∫₀^T |Σ a_n n^{it}|² dt = Σ |a_n|² (T + O*(2π c₀ (n + 1)))` (2016, Lemma 6.2), consuming the
    `6π Σ n |a_n|²` form of `AnalyticNumberTheoryPartI` §1.5; the explicit Gallagher inequalities
    (2016, Corollaries 6.3 and 6.4); Kadiri's second moment on `[H, T]` (2013, Theorem 1.4, under
    C11); Helfgott's tail bounds for `∫_{|t| ≥ T} |ζ(σ + it)|²/|σ + it|²` with the displayed
    constants (MathOverflow answer 285338, 2017).
13. **Weighted and maximal large sieves.** For `X ⊂ ℝ/ℤ` finite and `δ(x)` the distance from `x`
    to the rest of `X`, `Σ_x (N + c δ(x)⁻¹)⁻¹ |Σ_{M<n≤M+N} a_n e(nx)|² ≤ Σ |a_n|²` with
    `c = 3/2` (Montgomery–Vaughan 1974, Corollary 3, from the `3π/2` inequality of
    `AnalyticNumberTheoryPartI` §1.5a) and with `c = c₀ = 1.3154…` (Preissmann 1984); Elliott's
    `Σ_x max_{u<v≤N, v−u≤H} |Σ_{u≤n<v} a_n e(nx)|² ≤ (H + 2δ⁻¹ log(e/δ)) Σ |a_n|²` (Elliott 1987,
    Lemma 1). The unweighted sharp forms are `SieveMethodsAndPrimePatterns` §2.9.
14. **Upper bounds for `|L(1, χ)|`** (Ramaré 2001, Corollary 1): `(1/2) log q` for `χ` even and
    `(1/2) log q + 5/2 − log 6` for `χ` odd; for even conductor `(1/4) log q + (1/2) log 2` and
    `(1/4) log q + 5/4 − (1/2) log 3`; the `3 ∣ q` bounds of Platt–Saad Eddin 2013 (Theorem 1.1)
    and the `χ(2) = 1` bound of Saad Eddin 2016 (Theorem 1), both under C11; for odd quadratic
    `χ` of conductor `f ≥ 2·10²³`, `L(1, χ) ≤ (1/2) log f` (Johnston–Ramaré–Trudgian 2023, Theorem
    1; the even case is Ramaré's bound for every `f`), and `L(1, χ) ≤ (9/20) log f` for quadratic
    `χ` even with `f ≥ 2·10⁴⁹` or odd with `f ≥ 5·10⁵⁰` (Theorem 2), both under C11.
15. **Lower bounds for `|L(1, χ)|`**, `χ` non-quadratic of conductor `f`: `1/(10 log(f/π))`
    (Louboutin 2015) and `1/(9.69030 log(f/π))` (Mossinghoff–Starichkova–Trudgian 2022, Theorem
    1.1, under C11); `L(1, χ) ≠ 0` from `LFunctions` Layer 7.
16. **Classical zero-free regions with constants.** `ζ(s) ≠ 0` for `|t| ≥ 2` and
    `σ ≥ 1 − 1/(R₀ log |t|)`, each paper's own shape, with `R₀ = 5.70175` (Kadiri 2005, Théorème
    1.1), `5.68371` (Jang–Kwon 2014), `5.573412` (Mossinghoff–Trudgian 2015, Theorem 1),
    `5.558691` (Mossinghoff–Trudgian–Yang 2024, Theorem 1.3); each from the hypothesis C10 naming
    its trigonometric polynomial. The uniform form `σ ≥ 1 − 1/(R₀ log(|t| + 2))` for all `t` is
    the corollary that adds the low range `|t| < 2` from C1 (or from `ZerosOfLFunctions` 6.2 at
    the capped constant). For `L(s, χ)`: `σ ≥ 1 − 1/(6.4355 log(q max(1, |t|)))`
    with at most one exception, real and for a real character (Kadiri's Lille thesis, 2002,
    equation (111) of its Chapter 3, and the first arXiv version of math/0510570; the published
    Mathematika paper of 2018 contains only the bounded-conductor result), and `R₂ = 5.60`
    without exception for `3 ≤ q ≤ 400 000` (Kadiri 2018, Theorem 1.1) from the parameter
    `GRH(q, 10⁸/q)` that `ComputationalNumberTheory` §4.22 supplies.
17. **Vinogradov–Korobov regions and Ford's bound** (Ford 2002, Theorem 1; Ford, Millennial
    Conference 2002; Mossinghoff–Trudgian–Yang 2024, Theorem 1.1; Bellotti 2024, Theorem 1.2, with
    its Theorem 1.1 bound `70.6995 t^{4.43795(1−σ)^{3/2}} log^{2/3} t` sharpening Ford's;
    Khale 2024, Theorem 1.1), from a declared explicit-Vinogradov-integral supplier (Risks), with
    the interval-arithmetic steps under C11.
18. **Real zeros of quadratic L-functions** (Ralaivaosaona–Razakarinoro 2026, Theorem 1.1): for
    `−d` a fundamental discriminant, `d > 3·10⁸`, `L(s, χ_{−d}) ≠ 0` for real `s ≥ 1 − 6.035/√d`.
19. **Zero densities.** `2N(17/20, T, χ₀) ≤ 0.5561 T + 0.7586 log T − 268 658` for
    `T ≥ 3.061·10¹⁰` (Kadiri 2013, Theorem 1.1, from C3 and C11; the filed statement attributes
    it to Kadiri–Ng 2012, whose content is the Dedekind count `N_K(T)` and belongs to
    `ExplicitNumberFields`); Ramaré's two
    bounds for `T ≥ 2000`, `T ≥ Q ≥ 10`, `σ ≥ 0.52` (Ramaré 2016, Theorem 1.1);
    `N(0.9, T) ≤ 1.5 T^{4/15} log^{16/5} T + 3.2 log² T` for `T ≥ 1` (Kadiri–Lumley–Ng 2018,
    Theorem 1.1; the exponent is `8(1 − σ)/3` at `σ = 9/10`, not the `4/14` a wiki table prints).
    All proved by the large-sieve and mean-value route of targets 11–13.
20. **Verified zeros as hypotheses** (Layer 8). `RH(H)` and `GRH(q, H)` as in Scope, with
    `RH(H) ↔ GRH(1, H)`, antitonicity, the bridge to Mathlib's `RiemannHypothesis` through
    `ZerosOfLFunctions` Layer 9, and the named targets C1 `RH(545 439 823)` (van de Lune–te
    Riele–Winter 1986), C2 `RH(10⁹)` (Platt 2011), C3 `RH(30 610 046 000)` (Platt 2017), C4
    `RH(3·10¹²)` (Platt–Trudgian 2021), C6 Rumely's conductor list (Rumely 1993; `GRH(q, 10000)`
    for `q ≤ 13`, `GRH(q, 2500)` for `q ≤ 72`, composite `q ≤ 112` and the 21 listed moduli),
    C8 and C9 (finite-range bounds for `|ζ(1/2 + it)|`), C10 (one per trigonometric polynomial),
    C11 (one per paper's table or finite verification). Each is a `Prop` with a docstring naming
    the computation and its source; none is proved here.

**Checks** (special cases the design keeps as tests, not targets): Alzer at `m = 0` recovers
`log Γ(x) > (x − 1/2) log x − x + log √(2π)`; Rademacher's Dirichlet instance at `q = 1` is not
asserted (the pole factor is the general-record clause); Backlund at `σ = 1/2`, `t = 50` is weaker
than Lehman; `N(100) = 29` is consistent with target 8 and with a Layer 9 certificate;
`GRH(1, H) = RH(H)`; the exceptional-zero clause of target 16 is empty for non-real `χ`.

## Suppliers

All on main or earlier in `board/merge-order/ORDER.txt`, or another author's open pull request.

- `TauCetiRoadmap/ZerosOfLFunctions` (main): Layers 0–4 (growth predicates, `logGamma` on sectors,
  the analytic conductor, convexity shape, `zeroCount` and `N(T)`), 5 (Hadamard), 6 (zero-free
  region shape, `IsExceptionalZero`), 7 (rectangle argument principle, `S(T)`, Riemann–von
  Mangoldt shape), 8.1 (Perron consumed) and 9 (`HasZerosInRects`, `AllOnCriticalLine`, `GRH`).
- `TauCetiRoadmap/LFunctions` (main): Layer 0 records, Layer 3 (Dedekind zeta, for the general
  convexity record only), Layer 4 (`dirichletData`), Layer 7 (`L(1, χ) ≠ 0`), Layer 8.
- `Completed/ArithmeticDirichletSeries` §§6.3–6.4 (truncated Perron, in Tau Ceti as
  `truncatedPerron_LSeries`, `norm_truncatedPerron_LSeries_sub_sum_le`, `truncatedPerronKernel_one`).
- `Completed/ContourIntegration` Layer 2 (argument principle), through `ZerosOfLFunctions` 7.
- `AnalyticNumberTheoryPartI` (#1126, ORDER 84): §0.23a (slit-plane `log Γ`, Stieltjes remainder),
  §1.5 and §1.5a (mean square, weighted Hilbert inequality `3π/2`), §1.6 (`DirichletGRH`), §2.21
  (Rademacher shape), §0.30 (exceptional-zero transport).
- `ComputationalNumberTheory` (#1408, ORDER 185): §4.17a (digamma and trigamma remainders), §4.19a
  (Euler–Maclaurin remainder for Dirichlet L), §4.21a–4.24 (argument counts, `platt_bounded_height`,
  `small_conductor_no_real_zero`).
- `SieveMethodsAndPrimePatterns` (#1495, ORDER 259): §2.2 (Bombieri's additive large sieve),
  §2.3 (Gauss-sum expansion, character Parseval), §2.9 (sharp additive and primitive-character
  large sieves, separated Hilbert inequality).
- `CharacterSumsOverFiniteFields` (#1712, draft by another author): Layer 1 (Gauss sums) and
  Layer 7 (sums modulo an integer), for the character forms in Layers 4 and 5.
- `EffectiveClassNumbers` (#1406, ORDER 238) with its base `ImaginaryQuadraticClassNumber` H2.2
  (class-number formula): a consumer of Layer 5 rather than a supplier; listed because the
  real-zero target 18 is stated on its quadratic character `χ_{−d}`.
- Mathlib: `Complex.Gamma`, `Complex.digamma`, `Polynomial.bernoulli`, `Stirling.*` (real
  factorial only), `riemannZeta`, `DirichletCharacter.LFunction`, `RiemannHypothesis`,
  `Complex.PhragmenLindelof.vertical_strip`. No Euler–Maclaurin formula, no complex-Gamma modulus
  bound and no large sieve are in the pin.
- Sibling target `ExplicitCharacterSumsAndSieves` (#6062): its Layer 1 derivative tests for
  targets 7 and 17, its Pólya–Vinogradov constants for Layer 5. The order of supply must be
  ECS → ExplicitZetaBounds → ExplicitPrimeCounting; see Risks.

## Consumers

- `ExplicitPrimeCounting` (#6066): `R₀ = 5.558691`, `A = 53.989`, the explicit `N(T)` error terms,
  Lehman's Lemma 1, `RH(3·10¹²)`, `GRH(q, 10⁸/q)`, the Perron and mean-value tools, the Props of
  Layer 8 (its H1 and H2 are `RH(H)` and `GRH(q, H)` by name).
- `ExplicitCharacterSumsAndSieves` (#6062): the weighted and maximal large sieves and the `L(1, χ)`
  bounds (the sharp constant `N − 1 + δ⁻¹` it names comes from `SieveMethodsAndPrimePatterns` §2.9).
- `ExplicitMultiplicativeFunctions` (#6063): the bounds right of the one-line (target 6), Ramaré's
  Perron formula, `RiemannZerosVerified(T) = RH(T)`.
- `ExplicitNumberFields` (#6064): the general-record convexity bound (its Dedekind instance), the
  complex Stirling bounds, Layer 8 Props, the Perron and Mellin tools.
- `ErdosProgressionPowers` (#1336) and `AnalyticNumberTheoryPartI` §1.4: the bounded-zero clause
  of `ModEightFiniteInput` is `GRH(8, 10000)`, an instance of C6.
- `EffectiveClassNumbers`, `ImaginaryQuadraticClassNumber`: Layer 5 and target 18 through the
  class-number formula.
- Beyond the board: effective Chebotarev and least-prime-ideal bounds, short intervals, ternary
  Goldbach-type verifications (`CircleMethodThreePrimes` excludes every explicit form and would
  consume this roadmap for one).

## Sources

All works are recorded in `packages/ExplicitZetaBounds/sources.toml` under the keys below; "read"
means a legal copy was fetched and its theorem numbering checked by the worker, "locator" means
the work is paywalled or its open copy could not be read and it is recorded as `uncertified`.

**Layer 0 (Gamma, digamma, polygamma).** `alzer1997` (Math. Comp., AMS back volume, read:
Theorems 8 and 9); `diamondstraub2016` (arXiv, read: Theorems 1.2 and 3.1); `mortici2011psi`
(Hacettepe J., DergiPark, read: Theorem 1.1); `batir2008`, `mortici2011ramanujan`, `chen2016`,
`gordon1994`, `andrewsberndt2013`, `ramare2022excursions` (locator); `allasia2002` (Ele-Math
open access; the service could not read the PDF, locator); `dlmf` (NIST DLMF 5.11, open web).

**Layer 1 (pointwise bounds).** `rademacher1959` (EuDML/GDZ open scan; landing page only,
locator); `backlund1918` (Acta Math., open at Project Euclid; landing page only, locator);
`lehman1970`, `bastienrogalski2002`, `delange1987` (locator; the last two have open copies at
the Canadian Mathematical Society and EuDML/IMPAN that the service could not read);
`chenggraham2004` (Project Euclid, landing page only, locator); `trudgian2014argument` (arXiv,
read; the preprint's constants differ from the published ones, see the manifest note);
`hiary2016zeta` (arXiv, read: Theorem 1.1); `hiary2016hybrid` (arXiv, read: Theorem 1.2,
Corollary 1.1); `thornerzaman2024` (arXiv, read: Proposition 2.10); `trudgian2014zeta1`
(arXiv, read: Theorem 1); `patel2022` (arXiv, read: Theorem 1.1); `ford2002vinogradov`
(arXiv, read: Theorem 1); `kadiri2013density` (locator); `ramare2016density` (AMS back volume,
free, network error on fetch, locator).

**Layer 2 (zero counting).** `rosser1941` (locator); `trudgian2014argument` (above);
`hasanalizadeshenwong2022` (arXiv, read: Corollaries 1.2 and 1.4); `bmor2021` (arXiv, read:
Theorem 1.1); `lehman1966` (open at EuDML/IMPAN, not read, locator).

**Layer 3 (Perron and mean values).** `ramare2007eigen` (HAL, read: Theorem 7.1 at line 742 of
its text); `ramare2016perron` (Centre Mersenne, open, fetch failed, locator);
`montgomery1994ten`, `logan1988` (Project Euclid, landing page only), `gallagher1970`
(EuDML, landing page only), `montgomeryvaughan1974` (locator); `helfgott2017mo` (open web
answer, CC BY-SA, recorded by locator); `kadiri2013density`, `ramare2016density` (above).

**Layer 4 (large sieves).** `montgomeryvaughan1973`, `montgomeryvaughan1974`, `elliott1987`
(locator); `preissmann1984` (e-periodica open scan, not located by the service, locator).

**Layer 5 (`L(1, χ)`).** `ramare2001` (IMPAN back volume, open, network error, locator);
`plattsaadeddin2013` (arXiv, read: Theorem 1.1); `saadeddin2016` (arXiv, read: Theorem 1);
`johnstonramaretrudgian2023` (HAL, published CC-BY text, read: Theorems 1 and 2);
`louboutin2015` (locator); `mossinghoffstarichkovatrudgian2022` (arXiv, read: Theorem 1.1).

**Layer 6 (zero-free regions).** `kadiri2005` (arXiv preprint, OCR, read: Théorème 1.1 with
`R₀ = 5.70176` in the preprint; the published constant is cited as `5.69693` by later papers
and as `5.70175` by the filed statement, to be settled by the design); `kadiri2002thesis`
(HAL, OCR, read: `R₁ = 6.4355`, equation (111)); `kadiri2018` (arXiv v2 = Mathematika text,
read: Theorem 1.1, `R = 5.60`); `jangkwon2014` (KoreaScience, read: `R₀ = 5.68371`);
`mossinghofftrudgian2015` (arXiv, read: Theorem 1); `mty2024` (arXiv, read: Theorems 1.1 and
1.3); `ford2002zerofree` (arXiv revised version, read: Theorems 1 and 3; the printed 2002 paper
has `A = 58`); `bellotti2024` (arXiv, read: Theorems 1.1 and 1.2); `khale2024` (arXiv, read:
Theorem 1.1); `ralaivaosaonarazakarinoro2026` (locator).

**Layer 7 (zero densities).** `kadiri2013density` (locator); `ramare2016density` (locator);
`kadirilumleyng2018` (arXiv, read: Theorem 1.1); `kadiring2012` (arXiv, read; Dedekind count,
context only).

**Layer 8 (verified zeros).** `vandeluneterielewinter1986`, `rumely1993` (AMS back volumes,
free, network error, locator); `platt2011thesis` (locator, no open copy known);
`platt2016grh` (arXiv, read: Theorem 7.1, the `q ≤ 400 000` verification); `platt2017zeros`
(Bristol repository manuscript, read); `platttrudgian2021` (arXiv, read: Theorem 1). The
ZetaGrid and Gourdon–Demichel announcements are not recorded as sources.

**Background texts the design may cite without new entries.** Titchmarsh–Heath-Brown and
Davenport–Montgomery (already cited by `ZerosOfLFunctions`), Iwaniec–Kowalski §5.2, and the
TME-EMT wiki pages (open web, tables only, never a source for a proof).

## Risks

- **No Euler–Maclaurin formula in the pin.** Layer 0 (Alzer, Diamond–Straub, the `n`-term complex
  Stirling series) and Kadiri's approximate functional equation need the Euler–Maclaurin summation
  formula with the periodic Bernoulli remainder. `ComputationalNumberTheory` §4.19a plans one
  instance (Hurwitz and Dirichlet remainders) and `AnalyticNumberTheoryPartI` §0.23a the Stieltjes
  form for `log Γ`; a general statement for `C^{2m}` functions on `[a, b]` is a Layer 0 foundation
  this roadmap must own or a Mathlib contribution it must wait for. The design should put it first.
- **Explicit Phragmén–Lindelöf.** Mathlib's `PhragmenLindelof.vertical_strip` gives no constant.
  Rademacher's argument needs the three-lines theorem with the exact interpolated bound and
  explicit gamma-quotient bounds on the strip (target 4); both are new.
- **Backlund's method.** The explicit `N(T)` error terms rest on an explicit Jensen-type lemma
  (Backlund's lemma) and on the Layer 1 strip bounds; `ZerosOfLFunctions` 4.3 and 7.3 give the
  shapes, not the constants. Trudgian's and Hasanalizade–Shen–Wong's refinements each add a
  different explicit argument-count lemma; the design should state one general lemma with
  parameters and specialise.
- **Vinogradov–Korobov (target 17).** Ford's Theorem 1 is a long proof through an explicit
  Vinogradov mean value theorem (Ford 2002, §§2–6). No roadmap on the board, open or merged, plans
  an explicit Vinogradov integral; `ExplicitCharacterSumsAndSieves` plans only the derivative tests
  and the iterated van der Corput inequality. The design must declare that supplier as a gap or file
  it as a target, and must not plan the mean value theorem inside this roadmap. Until it exists,
  targets 17 and the `A = 53.989` constant are stated with the Vinogradov-integral input as the
  only non-computational hypothesis, or deferred to a Part II.
- **Order of supply among the four explicit targets.** `ExplicitCharacterSumsAndSieves` (#6062)
  supplies the derivative tests and Pólya–Vinogradov to this roadmap, this roadmap supplies
  `ExplicitPrimeCounting` (#6066), and #6062's item (5b) consumes `ψ(x)` bounds from #6066: a cycle.
  It is broken by moving the Brun–Titchmarsh variant that needs `ψ` into `ExplicitPrimeCounting`
  (or by stating it there with the `ψ` bound as a parameter). The design of #6062 should record this.
- **Rademacher's Dedekind instance** is claimed by `ExplicitNumberFields` (#6064) and needed by it;
  the split above (general record here, `ζ_K` instance there) must be mirrored in that design.
- **Sources that cannot be read.** About two thirds of the cited papers are paywalled (Elsevier,
  Wiley, Springer, IMPAN, OUP, De Gruyter, World Scientific, JSTOR, Cambridge); they are recorded
  `uncertified` with their locators. The design can state every target from the filed statement
  and the open copies, but constants in Batir, Mortici, Chen, Gordon, Lehman 1970, Rosser 1941,
  Elliott, Louboutin, Kadiri 2005/2018, Kadiri–Ng, Saad Eddin, Platt–Saad Eddin and
  Ralaivaosaona–Razakarinoro are copied from the filed statement and the TME-EMT tables, not
  checked against the text. Open copies that the sources service could not read (Project Euclid,
  EuDML, Centre Mersenne, e-periodica, IMPAN and AMS back volumes) are named in the manifest
  notes for the design to fetch.
- **Constants under dispute.** Kadiri 2005's `R₀` is printed `5.70176` in the preprint, cited
  as `5.69693` by Jang–Kwon and as `5.70175` by the filed statement; Hiary's `0.63` is claimed
  by a 2026 arXiv note to need correction to about `0.77`; Trudgian's argument constants differ
  between preprint and print. The design states each constant from the published text it can
  read and records the others as Checks, never as targets.
- **Hypotheses C10 and C11 as Props.** A "tabulated polynomial is nonnegative" hypothesis must be
  stated with the polynomial's coefficients as data; the roadmap forbids sorry'd data in
  `Suggested.lean`, so those coefficients must be literal rationals in the statement. For Kadiri
  2005 (a degree-16 polynomial) and Mossinghoff–Trudgian–Yang (degree 46) this is long but
  mechanical; the design should keep each polynomial in its own file.
- **Mathlib's `N(T)` conventions.** `ZerosOfLFunctions` counts on `Icc 0 1 ×ℂ Ioc 0 T` with a zero
  at height `T` counted; Rosser and Trudgian count `0 < γ ≤ T` too, but
  Bennett–Martin–O'Bryant–Rechnitzer count `|γ| ≤ T` symmetrically and Kadiri–Ng use `2N` for
  `χ₀`. Each target must name its rectangle.


## Addendum: the current explicit record (operator literature check)

The design must state each target at the strength of the current literature and follow the modern route. The table below gives, for every target above, the strongest verified result on record with its source, and lists the results a modern explicit roadmap should add and the methods now standard. Where it says stronger, the design restates the target at that strength and cites that source; false or unproven statements are repaired first; October 2026 preprints are cited as unrefereed with the conditional statement kept alongside; the Landau–Siegel exclusion itself is owned by AnalyticNumberTheoryPartI §0.34, only its numerical instance and consequences are stated here.

# ExplicitZetaBounds and ExplicitPrimeCounting against the 2026 literature

Audit date 2026-11-07. Inputs: `packages/ExplicitZetaBounds/target.md`, `packages/ExplicitPrimeCounting/target.md`,
the review `REV-DESIGN-ExplicitPrimeCounting.md`, and the local TME-EMT pages (01, 06, 07, 08, 09, 21) the targets were
written from. Every candidate below was checked on its arXiv abstract or full text, a Crossref record of the journal DOI,
or an open author/publisher copy; where a publisher page refused the fetch the row says so. "Preprint" means no journal
reference was found on 2026-11-07. Statements are paraphrased throughout; nothing is quoted from the wiki.

Verdict column: **stronger** = a newer result implies or sharpens what the target states; **same** = the target already
cites the best refereed result; **weaker** = the target's statement is wrong or overclaims as written.

Conventions: ψ, θ, π as usual; `li` is the principal-value logarithmic integral; R denotes the constant in the classical
zero-free region σ ≥ 1 − 1/(R log|t|); `RH(H)` means every zero with |Im ρ| ≤ H is on the line.

---

## Table 1 — ExplicitZetaBounds (targets 1–20)

| # | Statement (target label) | What the target cites | Strongest current result (verified) | Verdict | Recommended action |
|---|---|---|---|---|---|
| 1 | Alzer's Euler–Maclaurin brackets for log Γ and polygamma (target 1) | Alzer 1997, Math. Comp. 66, Thms 8–9 | No sharper real-axis bracket with explicit constants found (two searches). Alzer 1997: https://doi.org/10.1090/S0025-5718-97-00807-7 | same | keep |
| 2 | Batir, Ramanujan–Mortici, Chen real Γ bounds (target 2) | Batir 2008; Mortici 2011; Chen 2016 JNT 164 | Chen 2016 confirmed via Crossref, DOI https://doi.org/10.1016/j.jnt.2015.11.007 (relative error 2117/(5080320 x⁷) for x ≥ 2). Nothing newer with constants. | same | keep; cite Chen by DOI |
| 3 | Diamond–Straub ψ vs F_N(λ,x), Allasia–Giordano–Pečarić, Mortici (target 3) | Diamond–Straub 2016 JMAA 433, Thms 1.2, 3.1 | Same paper; its arXiv id is **1508.03267** (the manifest's 1502.03457 is wrong). https://arxiv.org/abs/1508.03267 , https://doi.org/10.1016/j.jmaa.2015.08.034 | same | keep; fix the arXiv id in sources.toml |
| 4 | Complex Stirling with constants: sector bound ξ_s ≤ 1/(12 sin²(δ/2)\|s\|), two-sided \|Γ(s)\|, n-term remainder (target 4) | Ramaré, Excursions §20.2; DLMF 5.11.10 | For Re z > 0 two refereed bounds are sharper than the DLMF/Gradshteyn shape: Nemes 2015, Proc. Roy. Soc. Edinburgh A 145, 571–596, Thm 1.3: for \|arg z\| ≤ π/2 and N ≥ 2 the N-term remainder is ≤ (1+ζ(N)) Γ(N) (2√N+1) / (2 (2π)^{N+1} \|z\|^N), with a csc(2θ) factor for π/4 < \|arg z\| < π/2 (https://arxiv.org/abs/1310.0166 , https://doi.org/10.1017/S0308210513001558); Brent 2019, J. Aust. Math. Soc. 107, 319–337: for Re z > 0 the (k+1)-st remainder is < √(πk) times the k-th term (https://arxiv.org/abs/1609.03682 , https://doi.org/10.1017/S1446788718000393). The full-sector (\|arg s\| ≤ π − δ) bound of Ramaré's book has no published competitor. | stronger (right half-plane) | keep Ramaré's sector form as the general statement; add Nemes Thm 1.3 and Brent 2019 as the sharp right-half-plane instances |
| 5 | Explicit convexity on the general record; Dirichlet instance (target 5) | Rademacher 1959 Thms 3–4; Thorner–Zaman 2024 Prop 2.10 | Thorner–Zaman is in **Forum Math. 36 (2024) 1059–1080**, not Algebra & Number Theory: https://doi.org/10.1515/forum-2023-0091 , https://arxiv.org/abs/2208.11123 ; the convexity constant 2.97655 (q(1+\|t\|))^{1/4} is restated as Prop. 2.3 of Benli–Goel–Twiss–Zaman (https://arxiv.org/abs/2410.06082). Nothing sharper for general primitive χ found. | same | keep; fix the venue |
| 6a | Backlund's strip bounds for \|ζ(σ+it)\| (target 6) | Backlund 1918 (53)–(54), (56), (76) | For large t the strip is now covered by a Richert-type bound: Bellotti 2024, JMAA 536, 128249: \|ζ(σ+it)\| ≤ 70.7 t^{4.438(1−σ)^{3/2}} (log t)^{2/3} for 1/2 ≤ σ ≤ 1, t ≥ 3 (journal digits 70.6995, 4.43795; https://arxiv.org/abs/2306.10680 , https://doi.org/10.1016/j.jmaa.2024.128249); on the lines σ_k = 1 − k/(2^k − 2): Yang 2024, JMAA 534, 128124, Thm 1.1: \|ζ(σ_k+it)\| ≤ 1.546 t^{1/(2^k−2)} log t, t ≥ 3, k ≥ 4 (https://arxiv.org/abs/2301.03165 , https://doi.org/10.1016/j.jmaa.2024.128124); on σ ≥ 1: Cully-Hugill–Leong (preprint, https://arxiv.org/abs/2312.09412) Lemma 7: \|ζ(σ+it)\| ≤ 1.750 log t/log log t for t ≥ 500. Backlund remains the best small-t convexity-type bound. | stronger (large t) | keep Backlund for small t; add Bellotti 2024 Thm 1.1 (already named in target 17) as the strip bound of record and Yang's σ_k lines; note the preprint 1-line bound |
| 6b | Approximate functional equation with explicit error (target 6) | Kadiri 2013 Thm 1.2 (c₀ = 2.1946 at c = 1) | Refereed two-sided form: Simonič 2020, JMAA 491, 124303, Thm 4/Cor 1 (symmetric case x = y = √(t/2π): error ≤ 4.257 x^{−σ} for t ≥ 2π, 1.195 for t ≥ 10³, 1.00007 for t ≥ 10¹⁰; https://arxiv.org/abs/1910.08274 , https://doi.org/10.1016/j.jmaa.2020.124303). Preprint: Dhiman–Kadiri–Quesada-Herrera, Sept 2026, https://arxiv.org/abs/2609.00537 , Cor 0.3: \|ζ(s) − Σ_{n≤t} n^{−s}\| ≤ 1.2552 t^{−σ} for σ ∈ (0,1], t ≥ 14.13, and an asymmetric two-sided form (Cor 0.4). | stronger | replace Kadiri's one-sided constant by Simonič 2020 (refereed); record DKQ 2026 as preprint |
| 6c | Right-of-one bounds (target 6) | Ramaré 2016 Lemma 5.1; Delange 1987 | Nothing newer found. | same | keep |
| 7a | \|ζ(1/2+it)\| (target 7) | Lehman 4(t/2π)^{1/4}; Cheng–Graham 3 t^{1/6} log t; Trudgian 2.38; Hiary 0.63 t^{1/6} log t (t ≥ 3) | Hiary–Patel–Yang 2024, JNT 256, 195–217, Thm 1.1: \|ζ(1/2+it)\| ≤ **0.618** t^{1/6} log t for t ≥ 3 (https://arxiv.org/abs/2207.02366 , https://doi.org/10.1016/j.jnt.2023.09.003). The same paper records that the Kusmin–Landau lemma was used in Cheng–Graham 2004 with constant 1/π instead of 2/π, which affects every explicit subconvex bound derived from it; re-running Hiary 2016 with the right constant gives 0.77, so **0.63 is not safe as stated** (the correction is in HPY's introduction, not a separate note). Platt–Trudgian 2015, JNT 147, 842–851: 0.732 t^{1/6} log t, t ≥ 2 (https://arxiv.org/abs/1402.3953). Sub-Weyl: Patel–Yang 2024, JNT 262, 301–334: \|ζ(1/2+it)\| ≤ 66.7 t^{27/164} for t ≥ 3 (https://arxiv.org/abs/2302.13444 , https://doi.org/10.1016/j.jnt.2024.03.011). Preprint: Revers, Feb 2026, https://arxiv.org/abs/2602.05614 : 0.611 (t ≥ 3), 0.566 (t ≥ 8.97·10¹⁷). The "2.38" is not in Trudgian 2014's abstract (https://arxiv.org/abs/1208.5846) and must be located in its §5 before it is cited. | stronger; the 0.63 row is weaker than stated | replace Hiary 0.63 by HPY 0.618; add Patel–Yang 66.7 t^{27/164}; state the Kusmin–Landau constant 2/π as a Check that the derivative tests consumed from ExplicitCharacterSumsAndSieves must satisfy; drop or re-source "2.38" |
| 7b | \|ζ(1+it)\| (target 7) | Trudgian 2014 (3/4) log t; Patel 2022 three-way minimum | Hiary–Leong–Yang 2025, Funct. Approx. 73, 53–89, Thm 1: \|ζ(1+it)\| ≤ **1.731 log t/log log t** for t ≥ 3; Thm 2: 1/\|ζ(1+it)\| ≤ 431.7 log t/log log t; Prop 3: (1/3) log t + 4.66 for t ≥ e¹⁶ (https://arxiv.org/abs/2306.13289 , https://doi.org/10.7169/facm/240711-13-8). Patel 2022's first branch reads log t in the arXiv abstract (https://arxiv.org/abs/2009.00769); the (3/4) is Trudgian's. | stronger | add HLY Thm 1 as headline; keep Trudgian/Patel for small t |
| 7c | \|L(1/2+it,χ)\| (target 7) | Thorner–Zaman Prop 2.10; Hiary 2016 hybrid for sixth-power q | Both confirmed (Hiary: Acta Arith. 176, 211–239, https://arxiv.org/abs/1510.00950 , Cor 1.1). Only q-aspect addition: Francis 2022 (preprint, https://arxiv.org/abs/2206.11112), Burgess-type for prime q with a factor \|σ+it\|. Nothing newer on the t-aspect. | same | keep |
| 8 | Explicit Riemann–von Mangoldt N(T) (target 8) | Rosser 1941; Trudgian 2014; Hasanalizade–Shen–Wong 2022 | Bellotti–Wong 2025, Math. Comp. (with an appendix by Fiori): \|N(T) − (T/2π) log(T/2πe)\| ≤ **0.10076 log T + 0.24460 log log T + 8.08344** for T ≥ e (https://arxiv.org/abs/2412.15470 , https://doi.org/10.1090/mcom/4133). Preprint: Bellotti–Wong, June 2026, https://arxiv.org/abs/2606.31441 , Cor 1.3: ≤ 0.0946 log T + 5.746 and ≤ 0.097 log T + 4.954 for all T ≥ 1 (no log log term). HSW's constant is 9.3675 in the arXiv abstract (https://arxiv.org/abs/2107.06506) but 9.4925 in later tables; check the JNT text. | stronger | add Bellotti–Wong 2025 as the refereed form; note the 2026 preprint; resolve HSW's constant |
| 9 | Explicit N(T,χ) (target 9) | Bennett–Martin–O'Bryant–Rechnitzer 2021 Thm 1.1 | BMOR confirmed (Math. Comp. 90, 1455–1482, https://arxiv.org/abs/2005.02989 , https://doi.org/10.1090/mcom/3599). Preprint: Bellotti–Wong 2026 (above) Cor 1.5: \|N(T,χ) − (T/π) log(qT/2πe)\| ≤ 0.1892 log(qT) + 9.484 for T ≥ 1 (sharper for large qT, worse constant). | same (refereed); stronger (preprint) | keep BMOR; record the 2026 form as a Check target |
| 10 | Lehman's weighted zero sum (target 10) | Lehman 1966 Lemma 1 | Brent–Platt–Trudgian 2021, Math. Comp. 90, 2923–2935, Lemma 3/Thm 1: the sum of φ(γ) over T₁ ≤ γ ≤ T₂ equals the Lehman integral plus boundary terms φ(T)Q(T) plus an error ≤ 2(2.067 + 0.059 log T₁)\|φ'(T₁)\| + (0.059 + 1/150) φ(T₁)/T₁, valid from T₁ ≥ 2π; Cor 1: Σ_{γ>0} γ^{−2} = 0.02310499311541897… (https://arxiv.org/abs/2009.13791 , https://doi.org/10.1090/mcom/3652). The error is O(\|φ'\| log T + φ/T) instead of Lehman's O(φ log T). | stronger | state BPT Lemma 3 as the general lemma and derive Lehman's form as a corollary |
| 11 | Ramaré's truncated Perron formula (target 11) | Ramaré 2007 Thm 7.1; Ramaré 2016 Thm 1.1 | Cully-Hugill–Johnston 2023, Int. J. Number Theory 19, 1205–1228, Thm 2.1 restates Ramaré's smoothed error self-containedly (with θ' = 2/(√(π²+4)+π)) and reports errors in Ramaré 2016 Thms 1.2 and 3.1, not in Thm 1.1 (https://arxiv.org/abs/2111.10001 , https://doi.org/10.1142/S1793042123500598). Cully-Hugill–Johnston 2025 (part II), Funct. Approx. 73, 223–242, Cor 3.2: a weight-averaged Perron with error O(T^{−2}) for some T* ∈ [T, 2T], which saves a log x in the explicit formula (https://arxiv.org/abs/2402.04272 , https://doi.org/10.7169/facm/241110-18-11). | stronger | cite CHJ 2023 Thm 2.1 as the formula of record; add the averaged form as a second target; add the Ramaré 2016 errata note |
| 12a | Second moment on [H, T] (target 12) | Kadiri 2013 Thm 1.4 ("10³ ≤ H ≤ 10¹⁰") | The upper limit is H₀ = 3.061·10¹⁰, not 10¹⁰ (https://arxiv.org/abs/1401.4781). Whole-strip mean square: Dona–Helfgott–Zuniga Alterman 2022, J. Théor. Nombres Bordeaux 34, 91–133, Thm 1.2 (all 0 ≤ σ ≤ 1, T ≥ 4; e.g. ∫₁^T \|ζ(1/2+it)\|² ≤ T log T + 2.0 T √log T + 23.06 T) and Thm 1.1 tail bounds (https://arxiv.org/abs/1906.01097 , https://doi.org/10.5802/jtnb.1194); Simonič 2020 (above) on σ = 1/2: ∫₀^T \|ζ(1/2+it)\|² ≤ T log T − (1 + log 2π − 2γ)T + 70.26 T^{3/4} √log(T/2π), T ≥ 2000. | stronger (range) | keep Kadiri in its window; add DHZ Thm 1.2 and Simonič |
| 12b | Helfgott's tail bounds (target 12) | MathOverflow answer 285338 (2017) | The published form is DHZ 2022 Thm 1.1 (above). | same content, now refereed | replace the MO citation by DHZ 2022 |
| 12c | Majorant principle, Logan, Ramaré Lemma 6.2, Gallagher (target 12) | Montgomery 1994; Logan 1988; Ramaré 2016 | Not swept beyond the baselines; no newer explicit constants surfaced incidentally. | — | keep |
| 13 | Weighted and maximal large sieves (target 13) | Montgomery–Vaughan 1974; Preissmann 1984; Elliott 1987 | Not swept in this pass (no search assigned); nothing newer surfaced incidentally. | — | keep |
| 14 | Upper bounds for \|L(1,χ)\| (target 14) | Ramaré 2001; Platt–Saad Eddin 2013; Saad Eddin 2016; Johnston–Ramaré–Trudgian 2023 Thms 1–2 | Ramaré 2001 verified from the IMPAN open PDF (Acta Arith. 100, 245–266, https://doi.org/10.4064/aa100-3-2). JRT 2023 is Res. Number Theory 9, art. 72 (https://doi.org/10.1007/s40993-023-00476-4 , https://arxiv.org/abs/2303.13785): Thm 1 (odd quadratic, q ≥ 2·10²³: ≤ (1/2) log q) confirmed; Thm 2's constant is **9/20 in the abstract but 9/40 in the arXiv body** — settle from the journal text before stating it. Nothing newer. | same, one constant unsettled | keep; resolve 9/20 vs 9/40 |
| 15 | Lower bounds for \|L(1,χ)\| (target 15) | Louboutin 2015; Mossinghoff–Starichkova–Trudgian 2022 | MST is JNT 240, 641–655 (https://arxiv.org/abs/2107.09230 , https://doi.org/10.1016/j.jnt.2021.12.013): 1/(9.69030 log(q/π)) for all q, 1/(9.12255 log(q/π)) for large q. Quadratic χ: Lu–Zaman–Zhao 2026, Math. Comp., Cor 1.3: L(1,χ) ≥ 1/(8 log q) for primitive quadratic χ with q ≤ 10¹⁰ (https://arxiv.org/abs/2602.03626 , https://doi.org/10.1090/mcom/4268). No paper yet converts the 2026 Siegel-gap constant into a numerical L(1,χ) ≥ c'/log q for all q. | same (non-quadratic); stronger (quadratic, bounded q) | add LZZ Cor 1.3; add a target "quadratic L(1,χ) ≥ c'/log q" conditional on the gap constant of row 16c |
| 16a | Classical zero-free region for ζ (target 16) | Kadiri 2005 R₀ = 5.70175; Jang–Kwon 5.68371; MT 2015 5.573412; MTY 2024 5.558691 | The published Acta Arith. 117 (2005) theorem has **R₀ = 5.69693** (its arXiv v1 abstract prints 5.70176; the target's 5.70175 matches neither): https://doi.org/10.4064/aa117-4-1 , https://arxiv.org/abs/math/0401238 . MTY 2024 confirmed (Res. Number Theory 10, art. 11, https://arxiv.org/abs/2212.06867). Preprint: Bellotti–Trudgian–Yang, Mar 2026, https://arxiv.org/abs/2603.21490 , Thm 1: ζ(σ+it) ≠ 0 for t ≥ 3, σ > 1 − 1/(**4.896** log t), unconditional (uses RH(3·10¹²) below exp(76.47) and Yang's Littlewood-type region above). Also Yang 2024 Cor 1.2: no zeros for σ > 1 − log log t/(21.233 log t), t ≥ 3 (largest region for exp(171) ≤ t ≤ exp(5.3·10⁵)). | stronger (preprint); the Kadiri row is mis-transcribed | fix Kadiri to 5.69693; keep MTY as refereed headline; add BTY 2026 (4.896) and Yang's Littlewood-type region as targets, each from its own C10/C11 hypotheses |
| 16b | Zero-free region for L(s,χ) with one exception (target 16) | Kadiri thesis / math-0510570 v1: R₁ = 6.4355; Kadiri 2018: R₂ = 5.60 for 3 ≤ q ≤ 400 000 | Both confirmed (Mathematika 64, 445–474, https://arxiv.org/abs/math/0510570). Additions: Lu–Zaman–Zhao 2026 Cor 1.2: for q ≤ 10¹⁰ the product of all L(s,χ) mod q is zero-free in σ ≥ 1 − 1/(10 log max(q, q\|t\|, 10)) with **no exception**; Thorner–Zaman 2024 Thm 2.6: McCurley's region with R = 9.645908801 for every q with at most one real exception, and if q₁ > 400 000 the exception satisfies β₁ ≤ 1 − 100/(√q₁ log² q₁); Benli–Goel–Twiss–Zaman 2026, Proc. AMS 154, 509–525: explicit Deuring–Heilbronn repulsion (https://arxiv.org/abs/2410.06082 , https://doi.org/10.1090/proc/17450). | stronger (q-range, repulsion) | keep Kadiri; add LZZ Cor 1.2 and BGTZ Cor 1.1 as targets |
| 16c | The exceptional (Siegel) zero clause (target 16, and 18) | implicit: "at most one exception, real, for a real χ" | **Uniform exclusion of Landau–Siegel zeros**, OpenAI preprint, 1 Oct 2026, Thm 1: an absolute c > 0 with (1 − β) log q ≥ c for every real zero of every primitive real L(s,χ), q ≥ 3 (https://github.com/openai/math , file preprints/Uniform-exclusion-of-Landau-Siegel-zeros-October-1-2026/paper.pdf). The proof argues by contradiction along a sequence of conductors and takes an upper limit, so **c is absolute but not numerical** there. Green, "On Landau–Siegel zeros", Hexagon 2610.00311 (v2 18 Oct 2026, https://hexagonmath.org/abs/2610.00311): the key estimate Σ_{p ≤ X, χ(p) = −1} log p/p ≤ (3/4) log X + O_C(1) for X = q^C (v2: 1/2 + O(1/C)), no numerical constant. Kerr, https://arxiv.org/abs/2610.21099 : shorter proof, effective only. **Banks, "On the OpenAI proof that Landau–Siegel zeros do not exist", https://arxiv.org/abs/2610.15483 (11 Oct 2026): (1 − β) log q ≥ 3.0·10⁻³ for q ≥ 10¹⁰, and for all q ≥ 3 after Lu–Zaman–Zhao's computation.** Guo, https://arxiv.org/abs/2610.30476 , claims 1/100 but is internally inconsistent; unrefereed. Tao's sketch: https://terrytao.wordpress.com/2026/10/19/ . | stronger (new) | add a Layer 6 target: "no real zero β of a real primitive L(s,χ) has (1 − β) log q < c₀", stated with c₀ as a parameter and the instance c₀ = 3.0·10⁻³ under a named hypothesis for Banks' argument and LZZ's computation; the ownership of the general statement is AnalyticNumberTheoryPartI §0.34 (already filed), so cite it and own only the numerical instance and its consequences (rows 15, 18, T5.2, T5.5) |
| 17 | Vinogradov–Korobov regions and Ford's bound (target 17) | Ford 2002 (A = 58 / 57.54); MTY 55.241; Bellotti 2024 53.989; Khale 2024 | All confirmed: Bellotti JMAA 536 (arXiv rounds to 54.004; journal 53.989, also quoted by BTY 2026); Khale, Quart. J. Math. 75, 299–332 (https://arxiv.org/abs/2210.06457 , https://doi.org/10.1093/qmath/haae010): 1 − 1/(10.5 log q + 61.5 (log\|t\|)^{2/3}(log log\|t\|)^{1/3}) for \|t\| ≥ 10, and 10.1/49.13 for \|t\| large. Ford's revised text is https://arxiv.org/abs/1910.08205 (v5, 2025). No refereed improvement of 53.989; BTY 2026 mention 51.34 from Yang's thesis only. | same | keep; cite Ford by the arXiv v5; keep the explicit Vinogradov-integral supplier as the declared gap |
| 18 | Real zeros of quadratic L-functions (target 18) | Ralaivaosaona–Razakarinoro 2026 Thm 1.1: no real zero ≥ 1 − 6.035/√d for d > 3·10⁸ | Published as "An explicit bound for Siegel zeros and the torsion of elliptic curves with complex multiplication", JNT 281 (2026) 795–829 (https://doi.org/10.1016/j.jnt.2025.10.014); the arXiv v2 (https://arxiv.org/abs/2001.05782) has 6.5/√d for all d ≥ 3; the 6.035 / 3·10⁸ form is the wiki's rendering of the journal version and was not readable. Stronger for all real characters: Bordignon 2019, JNT 201, 68–76, Thm 1.3 (odd χ, q > 4·10⁵: β ≤ 1 − 800/(√q log² q); https://arxiv.org/abs/1809.05226) and 2020, JNT 210, 481–487 (even χ, q > 4·10⁵: 100/(√q log² q); https://arxiv.org/abs/1907.08327); LZZ 2026 Thm 1.1: no real zero ≥ 1 − 1/(5 log q) for quadratic χ with q ≤ 10¹⁰; and Banks' uniform gap 3.0·10⁻³/log q (row 16c), which beats c/√d once √d/log d exceeds about 2·10³, i.e. for d above roughly 10⁹. | stronger | restate the target as the general gap theorem (row 16c) with the √d-forms (Bordignon, R–R) as the instances for small d; cite R–R by its JNT title and mark 6.035 as unread |
| 19a | Kadiri's density bound at σ = 17/20 (target 19) | Kadiri 2013 Thm 1.1, "Acta Arith. 159" | The paper is **Acta Arith. 160 (2013) 185–200** (https://doi.org/10.4064/aa160-2-6 , https://arxiv.org/abs/1401.4781); its count is over 0 < Im ρ < T, so the target's "2N(17/20, T, χ₀)" normalisation must be checked (review F06 raised the same point). | same (locator wrong) | fix the volume and the normalisation |
| 19b | Ramaré 2016 density bounds (target 19) | Ramaré 2016 Thm 1.1 | Confirmed (Math. Comp. 85, 325–356, https://doi.org/10.1090/mcom/2991). Kadiri–Lumley–Ng record the ζ-only bound of that paper as erroneous and replace it by 965 (3T)^{8(1−σ)/3} log^{5−2σ} T + 51.5 log² T. | weaker (the ζ form) | state only the averaged Dirichlet bound from Ramaré; take the ζ form from KLN's correction |
| 19c | Kadiri–Lumley–Ng corollary at σ = 0.9 (target 19) | "N(0.9,T) ≤ 1.5 T^{4/15} log^{16/5} T + 3.2 log² T for T ≥ 1" | KLN 2018, JMAA 465, 22–46 (https://arxiv.org/abs/2101.12263 , https://doi.org/10.1016/j.jmaa.2018.04.071), eq. (1.7)/Table 1 as read in the arXiv text: N(0.90, T) < **11.499** (log T)^{16/5} T^{4/15} + **3.186** log² T for T ≥ 3.0610046·10¹⁰; the wiki's "1.5 … 3.2 … T ≥ 1" could not be located in the paper and its abstract carries no numbers. Newer explicit densities: Simonič 2020 (dyadic, σ ≤ 0.831); Bellotti 2025, JNT 269, 37–77, log-free N(σ,T) ≤ C T^{B(1−σ)} near σ = 1 (B = 1.448, C = 1.62·10¹¹ on [0.9927, 1], 3·10¹² < T ≤ exp(6.7·10¹²); https://arxiv.org/abs/2405.12545 , https://doi.org/10.1016/j.jnt.2024.10.001); Bellotti, near unity, preprint https://arxiv.org/abs/2311.05136 ; Chourasiya–Simonič 2025 explicit Ingham (preprint, https://arxiv.org/abs/2507.15184); Chourasiya 2024 explicit Carlson (preprint, https://arxiv.org/abs/2412.02068); Thorner–Zaman 2024 Thm 1.2 explicit log-free density for Dirichlet L (Forum Math., above). | weaker as written; stronger results exist | restate KLN from the paper (11.499 / 3.186, T ≥ 3.061·10¹⁰); add Bellotti 2025 (log-free) and Thorner–Zaman 2024 (Dirichlet log-free) as targets; list the preprints as Checks |
| 20 | Verified zeros as hypotheses C1–C6 (target 20) | van de Lune–te Riele–Winter 1986; Platt 2011; Platt 2017; Platt–Trudgian 2021; Rumely 1993; Platt 2016 (q ≤ 400 000 to 10⁸/q) | All refereed heights confirmed (Platt 2017: https://doi.org/10.1090/mcom/3198 ; Platt–Trudgian: Bull. LMS 53, 792–797, https://arxiv.org/abs/2004.09765 , https://doi.org/10.1112/blms.12460 ; Rumely: https://doi.org/10.1090/S0025-5718-1993-1195435-0). Platt 2016 (Math. Comp. 85, 3009–3027, https://arxiv.org/abs/1305.3087) actually reaches height max(10⁸/q, 7.5·10⁷/q + 200) for even q and max(10⁸/q, 3.75·10⁷/q + 200) for odd q, and proves L(1/2,χ) ≠ 0 for q ≤ 2·10⁶. Platt 2011's 10⁹ (thesis) is unverified. No refereed RH verification beyond 3·10¹² and no GRH sweep beyond Platt's exists. New computational hypothesis worth naming: LZZ 2026 (real zeros of all quadratic χ with q ≤ 10¹⁰). | same | keep; state Platt 2016's exact height; add the LZZ computation as C7′ |

---

## 