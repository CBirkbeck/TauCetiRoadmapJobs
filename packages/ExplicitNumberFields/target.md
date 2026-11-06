Verdict: design
Name: ExplicitNumberFields
Base: none
Owner: none

## Scope

**What the roadmap owns.** The numerically explicit inequalities about a number field `K` that the
TME-EMT wiki collects on its pages on the Dedekind zeta function, on class numbers and on primitive
roots: the ideal-counting function `I_K(x)` with explicit error terms, upper and lower bounds for
the residue `κ_K` of `ζ_K` at `1`, the class-number and regulator bounds that follow from them
through the class-number formula, the relative class-number bounds of CM-fields, explicit
zero-counting formulas and zero-free regions for `ζ_K`, and the explicit bounds on the least
primitive root modulo `p` and modulo `p²`. Every theorem is stated on Mathlib's carriers
(`NumberField.dedekindZeta`, `NumberField.dedekindZeta_residue`, `NumberField.classNumber`,
`NumberField.Units.regulator`, `NumberField.Units.torsionOrder`, `NumberField.discr`,
`nrRealPlaces`, `nrComplexPlaces`, `IsCMField`, `maximalRealSubfield`,
`IsCMField.indexRealUnits`, `ZMod`) for an arbitrary number field of degree `n`, with the
constants and thresholds of the cited papers. The wiki page on primes in number fields is empty;
nothing is owned under that heading, and effective Chebotarev and least-prime-ideal bounds are
excluded (see the boundaries).

**Conventions fixed once.** `f = g + O*(h)` is the predicate `‖f − g‖ ≤ h`; the design reuses
the `BigOStar` predicate that `ExplicitZetaBounds` (#6894) defines, and does not define a second
one. `d_K` is the absolute value of the discriminant, `w_K` the order of the torsion of the unit
group, `(r₁, r₂)` the signature, `κ_K` Mathlib's `dedekindZeta_residue`. `N_K(T)` counts the
zeros of the continued `ζ_K` with `0 < Re ρ < 1` and `|Im ρ| ≤ T`, that is `zeroCount` of
`ZerosOfLFunctions` Layer 4 on the symmetric rectangle; each target names its rectangle. Every
result that rests on a finite computation takes that computation as a `Prop` parameter declared
once; the roadmap proves nothing by computation and contains no algorithm.

**What Mathlib already has (Layer 0 is thin).** `NumberField.dedekindZeta_residue` is *defined*
as `2^{r₁} (2π)^{r₂} R_K h_K / (w_K √d_K)`, and
`NumberField.tendsto_sub_one_mul_dedekindZeta_nhdsGT` is the class-number formula; so the first
identity of the filed Layer 0 is a definitional unfolding, not a target. `IsCMField`,
`maximalRealSubfield`, `IsCMField.complexConj`, `indexRealUnits` with
`indexRealUnits_eq_one_or_two` and the regulator ratio
`regulator_div_regulator_eq_two_pow_mul_indexRealUnits_inv` give the Hasse unit index `Q_K` and
`R_K/R_{K⁺}`; `minkowskiBound` gives the Minkowski bound as an extended real;
`ZMod.isCyclic_units_of_prime_pow` gives the cyclic unit group modulo `p²`. Layer 0 therefore
owns only: the Minkowski constant `M_K = (4/π)^{r₂} n!/nⁿ` as a real with
`minkowskiBound K = M_K √d_K` (as the agreement lemma with Mathlib), the local factor
`Π_K(p) = ∏_{𝔭 ∣ p} (1 − N𝔭⁻¹)⁻¹`, the relative class number `h⁻_K = h_K / h_{K⁺}` as a
natural number (integrality from the norm map on class groups, which
`CyclotomicClassGroupsAndStickelberger` §3.4 proves for abelian CM fields and the design states
for every CM field), the quadratic Hecke character `χ_{K/K⁺}`, and the four conjectural
predicates below.

**Boundaries settled by this triage.** Each adjusts the filed statement where another roadmap or
target already owns the theorem; each is a note for the design.

- *The general convexity bound (filed Layer 1).* `ExplicitZetaBounds` target 5 owns Rademacher's
  explicit bound on the general completed-L-function record of `LFunctions` Layer 0, with the pole
  factor `3|(1+s)/(1−s)|`; its triage names this target as the owner of the Dedekind instance.
  Layer 1 here is that one specialisation (target 1 below), proved from the general theorem by
  reading off the conductor `d_K` and degree `n` of `dedekindZetaData K`; nothing of
  Phragmén–Lindelöf is redone here. `AnalyticNumberTheoryPartI` §2.21 states the same shape for
  finite-order Hecke characters with an absolute but inexplicit constant; it is not a supplier of
  constants.
- *Louboutin's first residue bound (filed Layer 3).* `AnalyticNumberTheoryPartI` §2.15 plans
  `dedekindZeta_residue_le`: `κ_K ≤ (e log d_K/(2n−2))^{n−1}` for `n ≥ 2`, with Louboutin's
  log-convexity proof written out in its §2.15a. This roadmap consumes it and does not restate it;
  the zero-dependent bound, the bound with `Π_K(2)`, the 2015 bound with the factor `B`, the
  explicit lower bounds and the conditional two-sided bound are not planned anywhere and are
  owned here. The ineffective subpower bounds of `AnalyticNumberTheoryPartI` §§2.31e, 2.46 and the
  bounded-degree Brauer–Siegel theorem of its §2.32 are comparisons, not restated.
- *The `h_K R_K` forms (filed Layer 4(a)).* Each is the residue bound multiplied by the
  class-number formula, which is Mathlib's definition of the residue; they are stated as
  headline theorems because the wiki states them so, but the design should prove each in one
  line from the residue form. For abelian `K`, `CyclotomicClassGroupsAndStickelberger` §3.4
  proves `ζ_K(s) = ∏_{χ ∈ X(K)} L(s, χ)` over the primitive characters attached to `K` and
  compares residues with `dedekindZeta_residue`; Ramaré's bounds `|L(1, χ)| ≤ (1/2) log q` and
  `(1/2) log q + 5/2 − log 6` are `ExplicitZetaBounds` target 14. Both are consumed; the abelian
  class-number bound (target 10) is what is owned here.
- *Piltz divisor sums (filed Layer 4(b)).* `ExplicitMultiplicativeFunctions` (#6897) T7.5 owns
  Bordellès' bounds for `Σ_{m ≤ x} τ_k(m)` (its `piltz_divisor_sum`, Bordellès 2002 Theorems 4.1
  and 4.2, and Bordellès 2006 Theorem 2.1) and the Cully-Hugill–Trudgian asymptotic for `τ₄` with
  its finite-range hypothesis `DivisorRemainderInitialRangeVerified`; its triage names this target
  as the consumer. This roadmap owns the Minkowski-bound lemma `h_K ≤ Σ_{m ≤ b_K} τ_n(m)`
  (`bordelles2002` line 79, `bordelles2006` line 61) and the class-number corollaries (targets
  11–12); the filed hypothesis H4 is that roadmap's hypothesis and is not declared again.
  *Correction to the filed statement:* Bordellès 2006, Theorem 2.2 (`bordelles2006` line 158)
  assumes `b_K ≥ 13` for the Minkowski bound `b_K = M_K √d_K`, that is `d_K ≥ 169 M_K⁻²`, not
  `139 M_K⁻²`.
- *CM-fields and the imaginary quadratic case (filed Layer 4(c)).* `ImaginaryQuadraticClassNumber`
  H2.2 owns the imaginary quadratic class-number formula and `EffectiveClassNumbers` the
  Goldfeld–Oesterlé lower bounds; `AnalyticNumberTheoryPartI` §2.7 owns the factorisation
  `ζ_E = ζ_F L(s, η)` for a quadratic extension `E/F` with its quadratic Hecke character,
  including the residue quotient. The relative class-number formula
  `h⁻_K = Q_K w_K √(d_K/d_{K⁺}) L(1, χ)/(2π)ⁿ` is that factorisation at `s = 1` combined with
  Mathlib's two residue definitions and the regulator ratio; it is a Layer 0 lemma here, proved
  from those suppliers. The explicit bounds on `L(1, χ)` for a quadratic Hecke character of a
  totally real field and the three lower bounds of Louboutin 2003 are owned here; at `n = 1`
  they are compared with the quadratic bounds of `ExplicitZetaBounds` targets 14–15 and 18 as
  Checks, not re-proved.
- *Zeros of `ζ_K` (filed Layer 5).* `ZerosOfLFunctions` 6.2 proves the Dedekind zero-free region
  and 7.5 the Riemann–von Mangoldt formula `N_K(T)` with existential constants and lists decimal
  constants as not owned; `ExplicitZetaBounds` owns the explicit constants for `ζ` and Dirichlet
  `L` only and names this target as the owner of the Dedekind constants (Trudgian's Theorem 2,
  Kadiri 2012, Kadiri–Ng 2012). The explicit Backlund-type argument-count lemma that
  `ExplicitZetaBounds` plans for its targets 8–9 should be stated there with the conductor and
  degree as parameters, so that targets 15–16 here are specialisations; see Risks.
- *Burgess and the character tables (filed Layer 6 and H1).* `ExplicitCharacterSumsAndSieves`
  (#6062, filed before this target) owns Treviño's explicit Burgess inequality in its uniform and
  tabulated forms, McGown's table `C(r)` and Booker's tables `α(r), β(r)`, each table as a named
  hypothesis (`Trevino_BurgessTables`, `McGown_BurgessTable`, `Booker_QuadraticBurgessTable`).
  The filed hypothesis H1 is therefore not a target here: targets 19–21 take those three `Prop`s
  by name. What is owned here is the Vinogradov sieve identity for generators of a finite cyclic
  group, the deduction of the primitive-root bounds from the Burgess inequality, and the two
  finite-range hypotheses H2 and H3.
- *Hypotheses `GRH(ζ_K)` and `GRH(p)`.* `AnalyticNumberTheoryPartI` §2.42 defines
  `DedekindERH K` (every zero of the continued `ζ_K` in the open strip has real part `1/2`),
  with `DedekindERH.of_abelian`; `ExplicitZetaBounds` Layer 8 defines `GRH(q, H)` and proves
  that `∀ H, GRH(q, H)` is `DirichletGRH` (`AnalyticNumberTheoryPartI` §1.6) for every primitive
  character of conductor `q`. The predicates `GRH(ζ_K)` and `GRH(p)` of the filed Layer 0 are
  these, imported by name. `Ded(K)` (the Dedekind conjecture: `ζ_K/ζ` entire) and `Pos(K/K⁺)`
  (`ζ_K/ζ_{K⁺} ≥ 0` on `(0, 1)`) are defined here, with the theorem that `Ded(K)` holds for
  `K/ℚ` normal (Aramata–Brauer) stated as a target with the proof consumed from the Artin
  continuation of `AnalyticNumberTheoryPartI` §2.31 and Brauer induction where the library has it;
  if Brauer induction is unavailable at design time, that theorem is stated for abelian `K` (where
  `ζ_K/ζ` is a product of entire Dirichlet L-functions) and the normal case is a Check.
- *Out of scope.* Effective Chebotarev, the least prime ideal (`AnalyticNumberTheoryPartI` §§2.9,
  2.49), explicit Mertens theorems for number fields (the main theorems of Garcia–Lee 2022; Tau
  Ceti's `TauCeti.NumberTheory.LFunctions.Mertens` has the inexplicit form), Brauer–Siegel, the
  explicit Brun–Titchmarsh inequality for number fields (Debaene's Theorem 1), zero-density
  estimates for `ζ_K` (Kadiri–Ng 2012: a natural Part II), subconvexity, and every explicit result
  about `ζ` and Dirichlet `L`-functions (`ExplicitZetaBounds`), primes (`ExplicitPrimeCounting`,
  #6066) and arithmetic functions (`ExplicitMultiplicativeFunctions`).

**Generality.** Every statement is for an arbitrary number field `K` of degree `n ≥ 2` on the
Mathlib carriers; degree `1` is a Check where the formula degenerates. Statements that a paper
proves only for `d_K` large, for `n` in a range, or for a signature are stated with that
threshold as a hypothesis and never with a weaker unpublished constant.

## Final targets

Each is a headline theorem for `Suggested.lean`, stated with its hypotheses; `O*` is the
predicate above; locators are into the manifest keys of `packages/ExplicitNumberFields/sources.toml`.

**Layer 0: invariants and predicates.**

0. Definitions `minkowskiConstant K` (with `minkowskiBound K = minkowskiConstant K * √d_K`),
   `localFactor K p`, `relativeClassNumber K` (for `IsCMField K`, with
   `h_{K⁺} ∣ h_K`), `cmCharacter K` (the quadratic finite-order Hecke character of `K/K⁺`,
   `LFunctions` Layer 5), `DedekindConjecture K`, `CMPositivity K`; the lemma
   `relativeClassNumber_eq`: `h⁻_K = Q_K w_K √(d_K/d_{K⁺}) L(1, χ_{K/K⁺})/(2π)ⁿ` for `K` CM of
   degree `2n`, from `AnalyticNumberTheoryPartI` §2.7 at `s = 1`, Mathlib's two residue
   definitions and the regulator ratio; and `dedekindConjecture_of_normal` (Aramata–Brauer).

**Layer 1: size of `ζ_K`.**

1. **Rademacher's convexity bound for `ζ_K`** (`rademacher1959`, Theorem 4): for `0 < η ≤ 1/2`,
   `−η ≤ σ ≤ 1 + η`, `s ≠ 1`,
   `|ζ_K(s)| ≤ 3 |(1+s)/(1−s)| (d_K |1+s|/(2π))^{(1+η−σ)/2} ζ(1+η)ⁿ`, as the instance of
   `ExplicitZetaBounds` target 5 at `dedekindZetaData K`.

**Layer 2: counting ideals.** `I_K(x) = #{𝔞 ≠ 0 : N𝔞 ≤ x}`; Tau Ceti's
`isBigO_card_idealsLE_sub` and `GlobalNumberFields` Layer 3 give the shapes with existential
constants.

2. **Sunley–Lee** (`lee2023ideals` line 57, Theorem 1.2; Sunley's Theorem 1.1 is the weaker
   constant): for `n ≥ 2`, `x > 0`,
   `I_K(x) = κ_K x + O*(A_K(n) d_K^{1/(n+1)} (log d_K)^{n−1} x^{1−2/(n+1)})`, with `A_K(n)` the
   paper's closed-form constant (`A_K(2) ≈ 2.49·10¹⁰`, `A_K(3) ≈ 8.45·10¹¹` in its Table 1). The
   filed statement's constant `C(K)` and its value `8.80·10¹¹` at `n = 2` are a different
   printing; the design states the constant of the version it reads and records the other as a
   Check (see Risks).
3. **Debaene** (`debaene2019` line 107, Corollary 2): for `x ≥ 1`,
   `I_K(x) = κ_K x + O*(n^{10n²} (R_K h_K)^{1/n} (1 + log(R_K h_K))^{(n−1)²/n} x^{1−1/n})`, and
   for a class `c` of the class group the count of ideals in `c` is
   `(κ_K/h_K) x + O*(n^{10n²} R_K^{1/n} (1 + log R_K)^{(n−1)²/n} x^{1−1/n})`.
4. **Gun–Ramaré–Sivaraman** (`gunramaresivaraman2023` line 66, Theorem 1): for an integral ideal
   `𝔮`, a class `[b]` of the ray class group `H_𝔮(K)` and `x ≥ 1`, the number of integral ideals
   of norm at most `x` in `[b]` is
   `(κ_K φ(𝔮)/(|H_𝔮(K)| N𝔮)) x + O*(E(K) F(𝔮)^{1/n} (log 3F(𝔮))ⁿ (x/N𝔮)^{1−1/n} + n^{8n} R_K |μ_K| F(𝔮))`
   with the paper's `E(K)` and `F(𝔮)`, stated on `GlobalNumberFields`' ray class group and
   `rayClassIdealCountingFunction`, as the explicit form of its `rayClassIdealCount`.

**Layer 3: the residue.** Target 5 of `AnalyticNumberTheoryPartI` §2.15 (`dedekindZeta_residue_le`)
is consumed.

5. **Zero-dependent bound** (`louboutin2001`, Theorem 1): if `ζ_K(β) = 0` for some real
   `1/2 ≤ β < 1` then `κ_K ≤ (1 − β)(e log d_K/(2n))ⁿ`.
6. **Small-prime bound** (`louboutin2005` line 307, Theorem 10, inequalities (13)–(14); the
   displayed formulas are absent from the Numdam text layer and must be read from the scan): for
   `n ≥ 3`,
   `κ_K ≤ (Π_K(2)/Π_ℚ(2)ⁿ)(e log d_K/(2n−2) · e^{n log 4/log d_K})^{n−1}`; when `2` is inert the
   first factor is `1/(2ⁿ − 1)`.
7. **The 2015 bound** (`louboutin2015mmj`, Section 2.6.4, waived; cited by locator): for `n ≥ 5`,
   with `c = (1 − 1/√5)/2`, `κ_K ≤ (3/√n)(B c e^{γ + √(6/n)} log d_K/(2n−2))^{n−1}`, where
   `B = B(n, d_K)` is the paper's explicit majorant, imported as a definition with its
   monotonicity `B → 1`.
8. **Unconditional lower bound** (`garcialee2022mertens`, Section 3): for `n ≥ 3`,
   `κ_K > 0.0014480/(n g(n) d_K^{1/n})`, `g(n) = 1` if `K` has a normal tower over `ℚ` and
   `g(n) = n!` otherwise. **Zero-dependent lower bound** (`louboutin2003` line 65, Theorem 1):
   for `K` totally imaginary of degree `2n ≥ 2m`, `S` a finite set of primes, and root
   discriminant `ρ_K = d_K^{1/2n} ≥ ρ_{2m} Λ_S` with the paper's Table 1 of `ρ_{2m}`,
   `κ_K ≥ (1/2)(1 − β) d_K^{(β−1)/2} Π_K(S)` whenever `ζ_K(β) ≤ 0` for some
   `β ∈ [1 − 2/log d_K, 1)`, with the variant `κ_K ≥ (1 − β) d_K^{(β−1)/2} Π_K(S)` on
   `[1 − 2/log d_K, 1 − 1/log d_K]`; `Π_K(S)` is the product of the local factors of target 0.
9. **Conditional two-sided bound** (`garcialee2022artin` line 62, Corollary 2): under
   `DedekindERH K` and `DedekindConjecture K`, for `n ≥ 2`,
   `e^{−17.81(n−1)}/log log d_K ≤ κ_K ≤ (e^{17.81} log log d_K)^{n−1}`, with the sharper
   constants the corollary lists for `n = 3, …, 6` as Checks.

**Layer 4: class numbers.**

10. **`h_K R_K` bounds** (`louboutin2001`, Theorem 1; `louboutin2005`, Theorem 1;
    `louboutin2015mmj` §2.6.4; Ramaré via `ExplicitZetaBounds` 14): for `n ≥ 2`,
    `h_K R_K ≤ (w_K/2)(2/π)^{r₂}(e log d_K/(4n−4))^{n−1} √d_K`; with a real zero
    `β ∈ [1/2, 1)` of `ζ_K`, `h_K R_K ≤ (1−β) w_K (2/π)^{r₂}(e log d_K/(4n))ⁿ √d_K`; for `n ≥ 3`
    the `Π_K(2)` form and for `n ≥ 5` the `B`-form, each the residue bound times the class-number
    formula; for `K` abelian,
    `h_K R_K ≤ (w_K/2)(2/π)^{r₂}(log d_K/(4n−4) + (5 − log 36)/4)^{n−1} √d_K`, and for `K`
    abelian and totally real `h_K R_K ≤ (log d_K/(4n−4))^{n−1} √d_K`, from the character product
    of `CyclotomicClassGroupsAndStickelberger` §3.4, the conductor–discriminant formula
    (`ClassFieldTheory` Layer 13) and the arithmetic–geometric mean inequality.
11. **Bordellès' regulator-free bounds** (`bordelles2002` line 185, Theorems 5.1–5.3;
    `bordelles2006` line 158, Theorem 2.2): with `b_K = M_K √d_K`,
    `h_K ≤ b_K (log b_K + γ + 1/b_K)^{n−1}`; `h_K ≤ 2 b_K (log b_K)^{n−1}` for `b_K ≥ 6`;
    `h_K ≤ (2^{n−1}/(n−1)!) √d_K (log d_K)^{n−1}`; and for `n ≥ 3` and `b_K ≥ 13`,
    `h_K ≤ (b_K/(n−1)!)(log b_K + n − 2)^{n−1}`, equivalently
    `h_K ≤ (M_K/(n−1)!)(log(M_K² d_K)/2 + n − 2)^{n−1} √d_K` for `d_K ≥ 169 M_K⁻²`. All from the
    Minkowski-bound lemma and `ExplicitMultiplicativeFunctions` T7.5.
12. **Quartic fields** (`cullyhugilltrudgian2021`, Theorem 2 and its corollary): for `K` quartic
    with `b_K ≥ 193`, `h_K ≤ (1/3) b_K (log b_K)³`, under
    `ExplicitMultiplicativeFunctions`' `DivisorRemainderInitialRangeVerified`.
13. **Relative class number, upper bound** (`louboutin2000`, Theorem 1): for `K` CM of degree
    `2n > 2`, `h⁻_K ≤ 2 Q_K w_K √(d_K/d_{K⁺}) (e log(d_K/d_{K⁺})/(4πn))ⁿ`, through the paper's
    explicit upper bound on `L(1, χ_{K/K⁺})` for the quadratic Hecke character of the totally
    real field `K⁺` (the `L(1, χ)` bound is stated as its own theorem) and the relative
    class-number formula of target 0.
14. **Relative class number, lower bounds** (`louboutin2003`: Theorem 9 at line 399, Theorem 11
    at line 475, Theorem 12 at line 481, Theorem 13 at line 503). All are stated with the root
    discriminant `ρ_K = d_K^{1/2n}` and `k = K⁺`, as in the paper: (i) for `K` CM of degree
    `2n ≥ 2` with `CMPositivity K`, inequality (12) with `c = 2`, that is
    `h⁻_K ≥ 2 Q_K w_K √(d_K/d_k) / (2πe v_n (πe log ρ_k)^{n−1} log d_K)` with the paper's
    `v_n = (n/(n−1))^{n−1}` (Theorem 11); (ii) for `K` normal CM of degree `2n > 2`, `ρ_K ≥ 50`,
    `c = 2(√3 − 1)²`, and either no imaginary quadratic subfield or no real zero of the zeta
    functions of the imaginary quadratic subfields in `1 − c/log d_K ≤ s < 1`, inequality (12)
    (Theorem 9); (iii) for `K` CM, not necessarily normal, of degree `2n > 2`, `ρ_K ≥ 2800`,
    `c = 2(√2 − 1)²`, `m_N = [N:ℚ]` for the normal closure `N`, and either no imaginary quadratic
    subfield or no real zero of the zeta functions of the imaginary quadratic subfields in
    `1 − c/log d_N ≤ s < 1` that is a zero of `ζ_K`,
    `h⁻_K ≥ c Q_K w_K √(d_K/d_k) / (4 n m_N e^{c/2} (πe log ρ_K)ⁿ)` (Theorem 12, (17)); (iv) for
    `2n > 4`, `ρ_K ≥ 2800` and an imaginary quadratic subfield `F` with `ζ_F(β) = ζ_K(β) = 0` for
    some `β ∈ [1 − 2/log d_K, 1)`, `h⁻_K ≥ (6/(π²e²)) (d_K/d_k)^{1/2 − 1/n} (πe log ρ_K)^{n−1}`
    in the paper's form (Theorem 13, (18)). *Corrections to the filed statement:* the threshold is
    `ρ_K ≥ 2800`, that is `d_K ≥ 2800^{2n}`, not `2800ⁿ`; the filed `(n/(πe log d_K))ⁿ` is
    `(πe log ρ_K)^{−n} = (2n/(πe log d_K))ⁿ`; the filed `(πe log d_K)` in (i) is the paper's
    `(πe log ρ_k)^{n−1} log d_K`; and the filed reading of (iv) has the exponent on `log` inverted.
    The design states the paper's displayed inequalities and treats the filed forms as Checks.

**Layer 5: zeros of `ζ_K`.**

15. **Trudgian's zero count** (`trudgian2015` line 25, Theorem 2): for `T ≥ 1`,
    `N_K(T) = (T/π) log(d_K (T/(2πe))ⁿ) + O*(0.317 (log d_K + n log T) + 6.333 n + 3.482)`.
    The filed triple `(0.316, 5.872, 3.655)` is a row of the paper's Table 2, which
    Hasanalizade–Shen–Wong state they repair (`hasanalizadeshenwong2022` line 67); the design
    states the displayed theorem and takes no Table 2 row as a target.
16. **Hasanalizade–Shen–Wong** (`hasanalizadeshenwong2022` line 52, Theorem 1.1, and line 63,
    Corollary 1.2): for `T ≥ 1`,
    `N_K(T) = (T/π) log(d_K (T/(2πe))ⁿ) − r₁/4 + O*(0.22737 log(d_K (T+2)ⁿ/(2π)ⁿ) + 23.02528 n + 4.51954)`
    and the corollary `N_K(T) = (T/π) log(d_K (T/(2πe))ⁿ) + O*(0.228 (log d_K + n log T) + 23.108 n + 4.520)`.
17. **Explicit zero-free regions** (`kadiri2012` line 79, Theorem 1.1, and line 87, Corollary
    1.2; `lee2021zerofree`, Theorem 1.1; `louboutin2017` line 47, Theorem 3): for `d_K`
    "sufficiently large" in the arXiv text of Kadiri (line 93 says the theorem can be made
    explicit for every `log d_K`; the filed `d_K ≥ 2` must be checked against the published
    text), `ζ_K` has no zero with
    `|t| ≥ 1` and `σ ≥ 1 − 1/(12.55 log d_K + n(9.69 log|t| + 3.03) + 58.63)`, and at most one
    zero, real and simple, with `|t| ≤ 1` and `σ ≥ 1 − 1/(12.74 log d_K)` (Kadiri); no zero with
    `|t| ≥ 1` and `σ ≥ 1 − 1/(12.2411 log d_K + n(9.5347 log|t| + 0.0501) + 2.2692)`, and, for
    `d_K` at least the paper's threshold, at most one zero, real and simple, with `|t| < 1` and
    `σ ≥ 1 − 1/(12.4343 log d_K)` (Lee); Kadiri's Corollary 1.2: at most one zero, real and simple,
    in `σ ≥ 1 − 1/(2 log d_K)`, `|t| ≤ 1/(2 log d_K)` and in `σ ≥ 1 − 1/(1.70 log d_K)`,
    `|t| ≤ 1/(4 log d_K)`; and, in Louboutin's Stark-like regions
    `S(c, d) = {β > 1 − c/log d_K, |γ| ≤ d/log d_K}` (`louboutin2017` line 22), at most one zero,
    real and simple, in `S(c₂, 0)` and `S(d₂, d₂)` with `c₂ = 0.62075…`, `d₂ = 0.50009…`, in
    `S(0.59110, 1/4)`, and for `d_K > 8` in `S(0.10379, 1)`. The filed "Louboutin (2017), `d_K ≥ 8`" regions with
    `1/1.7` and `1/2` are Kadiri's Corollary 1.2, quoted at `louboutin2017` line 37; the filed
    real-zero constant `1.62` was found in neither text and is not a target until a source names it.
18. **Real zeros** (`louboutin2015ijnt` line 84, Theorem 6): for `m ≥ 1` and
    `d_K > exp((5+√5)(√(m+1) − 1)²)`, `ζ_K` has at most `m` real zeros in
    `σ ≥ 1 − (5+√5)(√(m+1) − 1)²/(2 log d_K)`, and this abscissa exceeds `1/2`; with its
    Corollary 4 (no real zero in `σ ≥ 1 − c₂/log d_K`, `c₂ = 2(√3 − 1)²`, for Galois `K` of odd
    degree) as a Check.

**Layer 6: least primitive roots.** `g(p)` is the least positive primitive root modulo the prime
`p` and `h(p)` the least positive generator of `(ℤ/p²)ˣ`.

19. **Vinogradov's sieve identity**: for a finite cyclic group `G` of order `m`, the indicator of
    the generators is `(φ(m)/m) Σ_{d ∣ m} (μ(d)/φ(d)) Σ_{χ of order d} χ`; stated for
    `Multiplicative (ZMod m)` and for `(ZMod p)ˣ`, `(ZMod (p²))ˣ`.
20. **McGown–Trudgian** (`mcgowntrudgian2020` line 59, Theorem 1; line 72, Corollary 1; line 85,
    Corollary 2; line 88, Theorem 2): for `p ≥ 10⁵⁶` and `r ≥ 2`,
    `g(p) < 2^r (2^{rω(p−1)}) p^{1/4 + 1/(4r)}` in the paper's displayed form, with the sieved
    form of Theorem 2 for an even divisor `e` of `p − 1`; hence `g(p) < p^{5/8}` for `p ≥ 10²²`
    and `g(p) < 0.999 √p < √p − 2` for `p ≥ 10⁵⁶`. The proof does not apply Burgess's inequality
    itself but Treviño's table of constants `C(r)` for the count of consecutive residues
    (`mcgowntrudgian2020` line 46, Table 1), consumed as `ExplicitCharacterSumsAndSieves`'
    `Trevino_BurgessTables`, and three small finite checks (lines 327, 352, 634) that the design
    either proves by evaluation or declares as one `Prop`.
21. **Grosswald under GRH** (`mcgowntrevinotrudgian2016` line 40, Theorem 1; line 142,
    Corollary 2): under `GRH(p)`, that is `DirichletGRH χ` for every character modulo `p`, and
    under H2, `g(p) < √p − 2` for every prime `p > 409`, and the least *prime* primitive root
    `ĝ(p) < √p − 2` for every prime `p > 2791`. H2 `GrosswaldFiniteRange`: for every prime
    `409 < p < 2.5·10¹⁵`, `g(p) ≤ √p − 2` (`cohenoliveirasilvatrudgian2016` line 35, Theorem 1,
    whose computational part is described at line 287; quoted at `mcgowntrevinotrudgian2016`
    lines 36 and 157). That paper's unconditional range `p > 3.67·10⁷¹` (its Theorem 1, second
    clause, proved from Treviño's Burgess bound) is a target of the same shape as target 20 and
    is stated with it.
22. **Modulo `p²`** (`kerrmcgowntrudgian2020` line 50, Theorem 1: `h(p) < p^{0.99}` for every
    odd prime; `chen2022`, Theorem 1.1: `h(p) ≤ p^{0.74}`), under H3 and Treviño's tables
    (`trevino2015` line 83, Theorem 1, and line 91, Corollary 1, consumed from
    `ExplicitCharacterSumsAndSieves`). H3 `PrimitiveRootModPSquareFiniteRange`: for every odd
    prime `p ≤ P₁`, with `P₁` the paper's threshold, `h(p) ≤ p^{0.74}`. Both theorems are stated
    for odd `p` (`h(2) = 3`), and the Kerr–McGown–Trudgian exponent `0.99` is a Check of the
    sieve route (its Theorems 2–3 at lines 62–64) that Chen refines.

**Computational hypotheses declared here.** Only H2 and H3, each a `Prop` with a docstring naming
the computation and its source, with the thresholds `P₀`, `P₁` as literal numerals. H1 is the three
`Prop`s of `ExplicitCharacterSumsAndSieves`; H4 is `DivisorRemainderInitialRangeVerified` of
`ExplicitMultiplicativeFunctions`. The conjectural predicates are hypotheses of targets 9, 14, 21.

**Checks** (special cases the design keeps as tests, not targets): target 1 at `K = ℚ` is
Rademacher's Theorem 3 at `q = 1`; target 2 at `n = 1` is `I_ℚ(x) = ⌊x⌋`, outside the theorem's
hypothesis; target 3 for `ℚ(i)` has `R_K = h_K = 1` and error `2^{40} x^{1/2}`; targets 5 and 10
at an imaginary quadratic `K` are weaker than the quadratic bounds of `ExplicitZetaBounds` 14;
the fourth form of target 11 needs `n ≥ 3`, and at `n = 2` the paper gives no statement; target
14 (i) at `n = 1` is compared with `ExplicitZetaBounds` 15 and 18; target 17's regions at
`d_K ≤ 8` are the first two only; target 18 at `m = 1` is a one-zero statement with the constant
`(5+√5)(√2 − 1)²/2`, to be compared with Stark's `1/(4 log d_K)` (`louboutin2015ijnt` line 27);
target 22 fails at `p = 2`, where `h(2) = 3 > 2^{0.74}`, so H3 and the theorem start at the
paper's lower threshold, to be read from `chen2022` (see Risks).

## Suppliers

All on main, earlier in `board/merge-order/ORDER.txt`, or another author's open pull request; the
four sibling explicit targets are ordered as `ExplicitCharacterSumsAndSieves` →
`ExplicitZetaBounds` → `ExplicitMultiplicativeFunctions` → `ExplicitNumberFields`.

- Mathlib: `NumberField.dedekindZeta`, `dedekindZeta_residue` (defined by the class-number
  formula) and `tendsto_sub_one_mul_dedekindZeta_nhdsGT`; `classNumber`, `Units.regulator`,
  `Units.torsionOrder`, `discr`, `nrRealPlaces`, `nrComplexPlaces`, `minkowskiBound`,
  `Ideal.absNorm`; `IsCMField`, `maximalRealSubfield`, `IsCMField.complexConj`,
  `indexRealUnits`, `indexRealUnits_eq_one_or_two`,
  `regulator_div_regulator_eq_two_pow_mul_indexRealUnits_inv`; `ZMod.isCyclic_units_of_prime_pow`,
  `DirichletCharacter`, `riemannZeta`, `ArithmeticFunction.moebius`.
- Tau Ceti: `isBigO_card_idealsLE_sub` (ideal count with `O(x^{1−1/n})`), `normCoeff`,
  `dedekindZetaCoeff`, the Mertens file `TauCeti.NumberTheory.LFunctions.Mertens`, the truncated
  Perron formula `truncatedPerron_LSeries`.
- `TauCetiRoadmap/LFunctions` (main): Layer 0 records, Layer 1 (theta, Poisson, Hecke's integral),
  Layer 3 (`dedekindZetaData`, `completedDedekindZeta`, functional equation, residue), Layer 4
  (`dedekindZetaC_quadratic`, `dedekindZetaC_cyclotomic`), Layer 5 (finite-order Hecke
  L-functions, for `χ_{K/K⁺}`), Layer 7 (`L(1, χ) ≠ 0`).
- `TauCetiRoadmap/ZerosOfLFunctions` (main): Layer 2 (`arithmeticConductor = d_K`,
  `analyticConductorAt`), Layer 3 (convexity shape), Layers 4 and 7 (`zeroCount`, `N_K(T)` with
  existential constants, 7.5), Layer 5 (Hadamard), Layer 6 (6.2, the Dedekind region shape,
  `IsExceptionalZero`), Layer 8 (explicit formula), Layer 9 (`HasZerosInRects`,
  `AllOnCriticalLine`).
- `Completed/GlobalNumberFields` Layer 3 (`rayClassIdealCount`, `rayClassIdealMainTerm_eq`,
  `rayClassCharacter_partialSums`) and Layers 9–10 (ray class groups, splitting).
- `AnalyticNumberTheoryPartI` (#1126, ORDER 84): §1.6 (`DirichletGRH`), §2.5 (Dedekind
  continuation), §2.7 (quadratic factorisation `ζ_E = ζ_F L(s, η)` and the residue quotient),
  §2.8 (partial ideal zeta series), §2.15 and §2.15a (`dedekindZeta_residue_le`), §2.21
  (Hecke convexity shape), §2.31 (Artin continuation, for Aramata–Brauer), §2.42 (`DedekindERH`,
  `HeckeGRH`), §2.39 (Heilbronn on real zeros, as context for target 18).
- `ExplicitZetaBounds` (#6894): target 5 (general convexity record), targets 4 (complex Stirling
  constants), 8–9 (explicit Backlund lemma, to be parametrised), 14–15 and 18 (`L(1, χ)` and real
  zeros of quadratic characters, for comparison), Layer 8 (`GRH(q, H)`, `BigOStar`).
- `ExplicitCharacterSumsAndSieves` (#6062): Layer 4 (Treviño's Burgess inequality, uniform and
  tabulated; McGown's and Booker's tables as `Prop`s), Layer 3 (Pólya–Vinogradov, if a proof
  uses it).
- `ExplicitMultiplicativeFunctions` (#6897): T7.5 (`piltz_divisor_sum`, the Cully-Hugill–Trudgian
  `τ₄` asymptotic and `DivisorRemainderInitialRangeVerified`).
- `CyclotomicClassGroupsAndStickelberger` (#1260): §3.4 (`ζ_F = ∏ L(χ, s)` for abelian `F`, the
  relative class number and Hasse index for abelian CM fields, `abelianCharacter_gauss_product`).
- `ClassFieldTheory` (main): Layer 11 (Artin–Hecke comparison), Layer 13 (conductor–discriminant).
- `ImaginaryQuadraticClassNumber` (main) H2.2 and `EffectiveClassNumbers` (#1406, ORDER 238):
  comparison only, for the `n = 1` Checks.
- `ClassicalArithmeticCompletion` (main) §5.1 (class group generated by primes of norm at most the
  Minkowski bound, for the Minkowski-bound lemma of target 11) and §§5.3, 5.16 (regulator and
  class-number comparisons).
- `ComputationalNumberTheory` (#1408, ORDER 185) Layer 4: the home of any certified computation
  that later discharges H2 or H3; nothing is consumed from it.

## Consumers

- Effective Chebotarev and least-prime-ideal theorems (a future target under the wiki's empty
  page on primes in number fields), explicit Brun–Titchmarsh for number fields (Debaene's
  Theorem 1), and explicit Mertens theorems for number fields: targets 2–4, 8, 15–17.
- Class-number computations and the determination of fields of small class number or small
  relative class number (`ClassicalArithmeticCompletion` Layer 5, `ComputationalNumberTheory`,
  `CyclotomicClassGroupsAndStickelberger` §3.4, `EffectiveClassNumbers`): targets 10–14.
- `ExplicitPrimeCounting` (#6066) and `ErdosProgressionPowers`: nothing from Layers 1–5; the
  primitive-root bounds (targets 20–22) are consumed by norm-Euclidean and primitive-root
  problems beyond the board.
- `AnalyticNumberTheoryPartI` §2.9 and §2.49 (Zaman's and the effective Chebotarev bounds) could
  replace their inexplicit constants by targets 15–17 in a later Part II.
- `ArithmeticStatistics` (counting fields by discriminant) for the uniform ideal count of target 3.

## Sources

All works are recorded in `packages/ExplicitNumberFields/sources.toml` under the keys below;
"read" means a legal copy was fetched and its numbering checked, "locator" means the work is
paywalled or its open copy could not be fetched and it is recorded as `uncertified` with its
locator; "local" means an operator-held text; "waived" is a human decision.

- `rademacher1959` (Math. Z., Springer; locator, Theorem 4).
- `lee2023ideals` (arXiv 2203.00389v2, read by OCR; Theorem 1.2 at line 57, Table 1 at line 44;
  the published J. Math. Anal. Appl. text is paywalled and its constants may differ).
- `debaene2019` (arXiv 1611.10103, read; Corollary 2 at line 107; Theorem 1 is the
  Brun–Titchmarsh inequality, out of scope).
- `gunramaresivaraman2023` (HAL hal-03805062, read; Theorem 1 at line 66).
- `louboutin2000` (J. Number Theory, Elsevier; locator, Theorem 1).
- `louboutin2001` (Canad. J. Math., Cambridge; locator, Theorem 1).
- `louboutin2003` (Trans. Amer. Math. Soc., AMS open back volume, read; Theorem 1 at line 65,
  Theorems 9, 11, 12, 13 at lines 399, 475, 481, 503, Theorem 14 at line 552).
- `louboutin2005` (J. Théor. Nombres Bordeaux, Numdam, read; Theorem 1 at line 59 recalls
  Ramaré's bounds, Theorem 10 at line 307 is the `Π_K(2)` bound; the displayed formulas are
  missing from the text layer).
- `louboutin2015mmj` (Mosc. Math. J.; waived by the operator, cited by Section 2.6.4).
- `louboutin2015ijnt` (local; Theorem 6 at line 84, Theorem 3 at line 48, Corollary 4 at line 51).
- `louboutin2017` (local; the regions `S(c, d)` at line 22, Theorem 2 at line 31, Theorem 3 at
  line 47).
- `garcialee2022mertens` (arXiv 2007.10313, read; Section 3).
- `garcialee2022artin` (arXiv 2101.11853, read; Corollary 2 at line 62).
- `ramare2001` (Acta Arith., open at IMPAN, which answered HTTP 502 to every fetch; recorded
  `uncertified` by locator; the bounds are consumed from `ExplicitZetaBounds` target 14).
- `bordelles2002` (local; Lemma 1.1 at line 79, Theorems 4.1–4.2 at lines 171–177 owned by
  `ExplicitMultiplicativeFunctions`, Theorems 5.1–5.3 at lines 185–200).
- `bordelles2006` (local; Lemma 1.1 at line 61, Theorem 2.1 at line 153 owned by
  `ExplicitMultiplicativeFunctions`, Theorem 2.2 at line 158).
- `cullyhugilltrudgian2021` (Ramanujan J., Springer; locator; `ExplicitMultiplicativeFunctions`
  records an open copy under its own key and owns the divisor-sum theorem).
- `trudgian2015` (arXiv 1206.1844, read; Theorem 2 at line 25), `hasanalizadeshenwong2022`
  (arXiv 2102.04663v3, read; Theorem 1.1 at line 52, Corollary 1.2 at line 63), `kadiri2012`
  (arXiv 1106.1868v1, read; Theorem 1.1 at line 79, Corollary 1.2 at line 87), `lee2021zerofree`
  (J. Number Theory; locator, Theorem 1.1), `ahnkwon2014` (J. Number Theory; locator; interface
  pointer only).
- `mcgowntrudgian2020` (arXiv 1904.12373, read; Theorem 1 at line 59, Corollaries 1–2 at lines
  72 and 85, Table 1 of Treviño's constants at line 46), `mcgowntrevinotrudgian2016` (arXiv
  1508.05182v1, read; Theorem 1 at line 40, Corollary 2 at line 142), `cohenoliveirasilvatrudgian2016` (above), `kerrmcgowntrudgian2020` (arXiv 1908.11497v1, read; Theorem 1 at line 50,
  Theorems 2–3 at lines 62–64), `chen2022` (Int. J. Number Theory; Theorem 1.1), `trevino2015`
  (arXiv 1412.3062v2, read; Theorem 1 at line 83 with Table 1 at line 97, Corollary 1 at line
  91, Theorem 2 and Corollary 2 at lines 134 and 156), `mcgown2012` (arXiv 1011.4490v1, read;
  Theorems 1.1–1.2 at lines 43 and 58), `booker2006` (Math. Comp., AMS open back volume, read). The
  last three are the Burgess tables, consumed from `ExplicitCharacterSumsAndSieves`, which
  records them too; they are recorded here so that the design can check the tables that
  targets 20–22 quote.
- `sunley1973` (Trans. Amer. Math. Soc. 175, AMS open back volume, read; Theorem 1.1 at line
  110, the original constant; context for target 2).
- `cohenoliveirasilvatrudgian2016` (arXiv 1503.04519v1, read; Theorem 1 at line 35, the
  computation at line 287).

The status of each key (read, locator, local, waived) is the `status` field of the manifest; the
report `packages/ExplicitNumberFields/reports/TARGET-ExplicitNumberFields.md` lists which texts
were read. Standard background: Lang, *Algebraic Number Theory*, Ch. XIII (the class-number
formula) and Washington, *Introduction to Cyclotomic Fields*, §4.3 (relative class numbers and the
Hasse index), both already cited by the supplier roadmaps.

## Risks

- **Explicit Backlund lemma.** Targets 15–16 need an explicit argument-count lemma on a rectangle
  (Backlund's method) with the conductor and degree as parameters, and the complex Stirling
  bounds with constants. `ZerosOfLFunctions` 4.3 and 7.3 give the shapes; `ExplicitZetaBounds`
  plans the lemma for `ζ` and Dirichlet `L`. If that roadmap states it only for degree one, this
  roadmap must own the general-degree lemma, which is the bulk of Trudgian's and
  Hasanalizade–Shen–Wong's papers; the design should settle this with the author of
  `ExplicitZetaBounds` before planning.
- **Explicit zero-free regions.** Kadiri's and Lee's regions use a non-negative trigonometric
  polynomial and Stechkin's lemma on the completed logarithmic derivative; `ZerosOfLFunctions` 6.1
  (quantitative 3-4-1) and 6.2 give the shape with existential constants. The explicit route
  needs explicit digamma bounds (`ComputationalNumberTheory` §4.17a, `ExplicitZetaBounds` Layer 0)
  and the explicit Hadamard-product sum over zeros; both are new in the pin.
- **Louboutin's `L(1, χ)` bounds for Hecke characters.** Targets 13–14 rest on explicit bounds
  for `L(1, χ)` of a quadratic Hecke character of a totally real field, proved by Louboutin's
  positive Mellin comparison with the completed `L(s, χ)`; `LFunctions` Layer 5 supplies the
  completed function and functional equation, and `AnalyticNumberTheoryPartI` §2.15a the same
  method for `ζ_K`. Louboutin 2003 (ii)–(iii) also need the normal closure, Aramata–Brauer and
  Stark's lemma on real zeros of `ζ_N`; `AnalyticNumberTheoryPartI` §2.31e proves Stark's
  Theorem 3 along the way.
- **Aramata–Brauer.** `DedekindConjecture K` for normal `K` needs Brauer induction or Aramata's
  direct argument; `ZerosOfLFunctions` and `AnalyticNumberTheoryPartI` both exclude Brauer
  induction (the latter imports an "integral monomial Brauer expression" only for its CM family).
  The design should state the normal case as a target only if a supplier of Brauer induction
  exists at design time; otherwise the abelian case.
- **Sources that cannot be read.** Rademacher 1959, Louboutin 2000 and 2001, Cully-Hugill–
  Trudgian, Lee 2021, Chen 2022 and Ahn–Kwon are paywalled, Ramaré 2001 is open but was
  unreachable, and the published Lee 2023 and Kadiri 2012 are paywalled while their arXiv
  versions were read; the constants of targets 5, 6 (the formulas missing from the Numdam text
  layer), 7, 10, 12, 13, 17 (Lee) and 22 (Chen) are taken from the filed statement, not checked
  against a text. Where a text was read, five disagreements with the filed statement surfaced
  (Lee 2023's constant at `n = 2`; Bordellès' threshold; Trudgian's constants; the attribution
  of the `1/1.7` regions; the Louboutin 2003 thresholds and factors), so the unchecked constants
  should be expected to need the same care. The design states every constant from a text it
  can read and makes the others Checks until a text is read.
- **Thresholds `P₀`, `P₁` and the H3 lower end.** `h(2) = 3 > 2^{0.74}`, so the bound
  `h(p) ≤ p^{0.74}` cannot hold at `p = 2`; Chen's theorem must have a lower threshold that the
  filed statement omits, and the design must read it from the paper (paywalled) or from
  Kerr–McGown–Trudgian's open copy, stating H3 on exactly the paper's finite range.
- **The ideal-count constants of target 2.** The proof is the Landau–Sunley contour argument with
  Rademacher's bound and a smoothed Perron formula; `ExplicitZetaBounds` target 11 gives Ramaré's
  smoothed Perron formula and target 5 the convexity bound, but the explicit gamma-quotient bounds
  on the strip and the explicit truncation of the Mellin inversion are long. Target 3 (Debaene)
  is instead geometry of numbers with explicit lattice constants (`GlobalNumberFields` 3A–3D give
  the shape with existential constants), needing an explicit Lipschitz-parametrisation count,
  also new.
- **Order of supply.** `ExplicitMultiplicativeFunctions` must precede this roadmap (T7.5) and
  `ExplicitCharacterSumsAndSieves` must precede `ExplicitZetaBounds`; no cycle involves this
  roadmap, which consumes all three and supplies none of them.
