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
