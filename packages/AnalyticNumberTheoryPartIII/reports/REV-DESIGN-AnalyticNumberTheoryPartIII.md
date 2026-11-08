<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/9211#issuecomment-6722485267 -->
Review (claude) of 08250e4

Verdict: needs_changes

1. **F01** (P2) 10.3 at `K = ℚ` is AnalyticNumberTheoryPartI §0.33a, and the README says the opposite

   Location: `design/README.md` lines 653–657 (10.3 Checks: "AnalyticNumberTheoryPartI §0.33, whose
   bounds … give `|ζ′/ζ| ≪ log³ t` on a narrower region … weaker by two logarithms"); lines 300–303
   ("together with 10.3 at `K = ℚ` (`riemannZeta`)" planned for `Suggested.lean`); lines 241–242
   (supplier contract: "§0.33 … a Check of 10.3 at `K = ℚ`").

   Claim: Part I gives only `|ζ − 1/(s−1)|, |1/ζ| ≪ log t`, so the `K = ℚ` case of 10.3 is new here
   and is a headline of this roadmap.

   Witness: AnalyticNumberTheoryPartI README at the head of its open pull request, §0.33a
   (`riemannZeta_deriv_logDeriv_bound`): there are `0 < β < 1`, `C > 0` with `ζ(s) ≠ 0` and
   `|ζ′/ζ(s) + 1/(s − 1)| ≤ C log(|Im s| + 2)` for every `s ≠ 1` with `Re s ≥ 1 − β/log(|Im s| + 2)`,
   the whole half-plane right of the curve. That is 10.3 at `K = ℚ`, `χ = 1` (region and bound differ
   only by the constants and the shift `+2` versus `+3`). Part I is earlier in the merge order (line
   49) and is this roadmap's parent, so it owns the `ζ` case; the `log³` remark in the Check describes
   §0.33 and ignores §0.33a.

   Repair: (i) in the supplier contract replace "§0.33 … a Check of 10.3 at `K = ℚ`" by "§0.33a
   (`riemannZeta_deriv_logDeriv_bound`): the `K = ℚ`, `χ = 1` instance of 10.3, consumed, not restated";
   (ii) rewrite the first Check of 10.3 as the agreement with §0.33a (same region up to constants, same
   bound, residue `δ_χ = 1`), deleting the `log³ t` sentence; (iii) in "How to read the build" drop
   "10.3 at `K = ℚ` (`riemannZeta`)" from the `Suggested.lean` list and plan instead the general
   statement of 10.3 on `TauCeti.LFunctions.heckeLFunctionC` (see R04: the carrier exists at the pin,
   so the general statement is statable and the `ζ` stand-in would be both a duplicate and a
   stand-in). Tested on the instance: with `K = ℚ`, `χ = 1`, `c = β`, 10.3's `G = −ζ′/ζ − 1/(s−1)`
   is the function §0.33a bounds, and its bound `C log(|t| + 2) ≤ C log(|t| + 3)` is the one 10.3
   asserts.

2. **F02** (P2) 11.3's corollary `Σ τ(n)² n^{−s} = ζ(s)⁴/ζ(2s)` is AnalyticNumberTheoryPartI §3.24a

   Location: `design/README.md` lines 244–245 ("§3.24 states `Σ τ(n)² n^{−s} = ζ(s)⁴/ζ(2s)` as a step
   of its fourth-moment route; 11.3 proves it"); lines 25–28 ("Part I stops where its proofs use …
   the classical Dirichlet series as local steps of particular estimates (its §§0.11c, 1.2a and 3.24
   are examples)"); lines 814–816 (11.3: "Corollaries for `Re s > 1`: `Σ τ(n)² n^{−s} = ζ(s)⁴/ζ(2s)`
   (`α = β = 0`)").

   Claim: Part I only uses the identity inside a proof, so this roadmap owns and proves it.

   Witness: AnalyticNumberTheoryPartI README at its open head, **§3.24a The divisor-square Euler
   identity**, `riemannZeta_pow_four_eq_mul_LSeries_divisor_sq`: for `Re s > 1` the series converges
   absolutely and `ζ(s)⁴ = ζ(2s) Σ τ(n)² n^{−s}`, with its own proof route (prime-power comparison
   `(1 − X²)/(1 − X)⁴ = Σ (k+1)² X^k`), Checks and `*Needs:*` line. It is a named target of an earlier
   roadmap, not a step.

   Repair: in 11.3 keep Ramanujan's four-shift identity and the `τ(n²)` corollary (Part I has the
   latter only as a Check), and replace the `τ(n)²` corollary by a Check: "at `α = β = 0` the
   identity is Part I §3.24a (`riemannZeta_pow_four_eq_mul_LSeries_divisor_sq`); the `p²`-coefficient
   `9` agrees". Add §3.24a to the Part I supplier contract and correct the two sentences at lines 25–28
   and 244–245 (cite §0.11c and §1.2a only, or name §3.24's smoothing steps rather than the identity).
   Tested on the instance: the local factor at `α = β = 0` of 11.3, `(1 − X)^{−4}(1 − X²)`, has
   coefficients `1, 4, 9, 16, 25 = (k+1)²`, which is exactly Part I's prime-power statement.

3. **F03** (P3) the sign of the horizontal term in the U-shaped form is not pinned

   Location: `design/README.md` lines 400–404 ("the left edge `∫_{−T}^{T} f(σ₁ + iy) dy`, the two
   horizontal edges divided by `i`, and `2π Σ_{p∈P} Res_p f`").

   Claim: the horizontal contribution is "the two horizontal edges divided by `i`", without saying
   which signed combination.

   Witness: `f = 1/s`, `σ₁ = −1`, `σ₂ = 1`, `T = 1`: right edge `∫_{−1}^{1} dy/(1 + iy) = π/2`, left
   edge `−π/2`, bottom `∫_{−1}^{1} dx/(x − i) = iπ/2`, top `∫_{−1}^{1} dx/(x + i) = −iπ/2`, residue
   sum `1`. The identity `π/2 = −π/2 + X + 2π` forces `X = −π = (top − bottom)/i`, the negative of the
   rectangle expression's horizontal part divided by `i`.

   Repair: write the term as `−(∫_{σ₁}^{σ₂} f(x − iT) dx − ∫_{σ₁}^{σ₂} f(x + iT) dx)/i`, that is
   `(top − bottom)/i`, and add the computed instance above as a Check (it also pins the orientation
   against the clockwise model, which gives `+π`).

4. **F04** (P3) 8.1 and the general 10.3 are statable at the pins; the README says they are not

   Location: `design/README.md` lines 303–305 ("8.1 and 10.3 for a general number field need Tau
   Ceti's residue and Hecke `L`-function and are stated in this README").

   Claim: these two statements cannot be put in `Suggested.lean`.

   Witness: `TauCeti.Contour.residue` is `TauCeti/Analysis/Contour/Residue/Basic.lean:80` and
   `TauCeti.LFunctions.heckeLFunctionC` is `TauCeti/NumberTheory/LFunctions/Hecke/Basic.lean:74`
   (with `TauCeti.GlobalNumberFields.RayClassCharacter` at
   `TauCeti/NumberTheory/NumberField/Global/RayClass/Character/Basic.lean:62`), all at the pinned Tau
   Ceti; `Suggested.lean` may import the `TauCeti.*` modules it uses. At the package stage a statable
   headline that is absent is P2.

   Repair: amend the paragraph to plan both 8.1 (on `TauCeti.Contour.residue`, with Mathlib's
   rectangle edge expression) and 10.3 in its general form (on `heckeLFunctionC χ` for
   `χ : RayClassCharacter 𝔪` of finite order) for `Suggested.lean`; with R01, the `ζ` instance is not
   stated there.

5. **F05** (P3) the route of 10.2 chooses `T` by `η(T)` but the left edge sits at `1 − η(T + 3)`

   Location: `design/README.md` lines 584–588 ("choose `T ≥ 3` with `log T = η(T) log x` … apply 8.1
   on `[1 − η(T + 3), σ₀] ×ℂ [−T, T]`").

   Claim: with this `T` the left edge contributes `x^{1 − η(T+3)} log^{O(1)} x`, which the route
   absorbs into `x exp(−c ω_η(x))`.

   Witness: `η` continuous and nonincreasing may drop steeply over `[T, T + 3]`: take `η = 1/2` on
   `[3, T₀]`, linear down to `1/log²(T₀ + 3)` on `[T₀, T₀ + 3]`, and `1/log² t` after (this satisfies
   every hypothesis with `a₀ = 1`, `A = 2`). For `log x = 2 log T₀` the choice gives `T = T₀`, and the
   left-edge saving is `x^{−η(T₀+3)} = exp(−2 log T₀/log²(T₀ + 3)) → 1`, while `ω_η(x) ≈ log T₀`.
   The theorem is unaffected: choosing `T` with `log T = η(T + 3) log x` gives
   `η(T + 3) log x + log(T + 3) ≥ ω_η(x)` and both savings at least `exp(−ω_η(x)/2 + O(1))`.

   Repair: in the route, choose `T` by `log T = η(T + 3) log x` (same continuity argument) and state
   `η(T + 3) log x = log T ≥ (ω_η(x) − log 2)/2`.

6. **F06** (P3) process word

   Location: `design/README.md` line 612 ("gives `inghamExponent η x ≍ (log x)^{1/(1+n₁)}`, the filed
   form").

   Claim: none; "the filed form" refers to the target filing, a process artefact.

   Witness: house style forbids process narrative in the README.

   Repair: delete ", the filed form".

7. **F07** (P3) Scope does not distinguish 11.1 from the completed ideal-weight carrier

   Location: `design/README.md` lines 40–41 (Owned here, Layer 11: "the predicate of complete
   multiplicativity on `ArithmeticFunction R` and its equivalence with Mathlib's `ℕ →*₀ R`").

   Claim: this roadmap is the first owner of a complete-multiplicativity carrier.

   Witness: `Completed/ArithmeticDirichletSeries/README.md` lines 59 and 123 (§0.2): the completely
   multiplicative degree-one ideal weights `MultiplicativeIdealWeight K` and `UnitaryIdealWeight`,
   realized in Tau Ceti. A kept variant says in one clause how it differs.

   Repair: add to Scope one clause: "11.1 is the `ℕ`-indexed predicate for an arbitrary monoid with
   zero `R`; ArithmeticDirichletSeries §0.2's `MultiplicativeIdealWeight` is the ideal-indexed,
   unit-circle-valued carrier for a number field, and the two meet only at `K = ℚ` through
   `normCoeff`".

8. **F08** (P3) the overlap with ArithmeticDirichletSeriesPartII §5.1 belongs in Scope and ownership

   Location: `design/README.md` lines 788–790 (11.2: "`generalizedDivisor (k : ℂ) = ↑(ζ ^ k)` … at
   `z = k` it is `ζ(s)^k`") and lines 931–932 (Downstream consumers).

   Claim: the `z = k` instance of 11.2 is owned here and consumed by ArithmeticDirichletSeriesPartII.

   Witness: ArithmeticDirichletSeriesPartII README at the head of its open pull request, §5.1
   `LSeriesHasSum_zeta_pow`: for `k ∈ ℕ` and `Re s > 1` the series of `d_k = ζ^k` has sum `ζ(s)^k`.
   Both roadmaps state it; that roadmap is later (merge order line 91 against this roadmap's place
   after line 49), so the single owner is this roadmap and the later revision cites 11.2, which the
   README says only under Downstream consumers.

   Repair: state the ownership in Scope and ownership ("the Dirichlet series of `ζ^k`, `k ∈ ℕ`, is the
   `z = k` instance of 11.2; ArithmeticDirichletSeriesPartII §5.1 keeps its partial-sum asymptotic and
   cites 11.2 for the series"), so that the later roadmap's revision has a line to point at.

Files reviewed: `packages/AnalyticNumberTheoryPartIII/design/README.md`,
`packages/AnalyticNumberTheoryPartIII/design/plan.json`,
`packages/AnalyticNumberTheoryPartIII/sources.toml`. Previous review: none. Elaboration: not
available (this lane does not elaborate; the design stage has no `Suggested.lean`). The sampled
locators were checked against the cached texts; the dependency gate and the ownership searches were
run; every Mathlib and Tau Ceti declaration the README names was opened at the pins. Two findings
are blocking: both are duplications of targets that AnalyticNumberTheoryPartI states at the head of
its open pull request, which the README describes as if Part I did not state them.

## Verified sound

**Principles.** No route-specific shortcut (every statement is general: arbitrary `E`, arbitrary
width `η`, arbitrary number field and character, complex parameters `ν`, `z`, `α`, `β`); no
re-planning of an existing roadmap (Layers 7–13 are new, and the two duplications above are
targets, not roadmaps); no copied passages (all statements are in the author's words with
locators); no algorithm (13.2's "decidable by finite search" is a remark, not a target); no sorry'd
data or `set_option` (no Lean file at this stage); no declared gaps, and `gaps` is empty.

**Dependency gate.** Output:

    candidate: AnalyticNumberTheoryPartIII is not in the merge order yet; checked as if placed after AnalyticNumberTheoryPartI (the intake inserts it when its design is accepted)
    depcheck: 237 roadmaps, 2422 edges, 0 problem(s)

No UPWARD or CYCLE line. Supplier positions: LFunctions 27, ZerosOfLFunctions 48,
AnalyticNumberTheoryPartI 49 (open pull request, the parent); ContourIntegration and
ArithmeticDirichletSeries completed on main; TauberianBoundaryConvergence on main. Consumers named
(ExplicitZetaBounds 267, ExplicitPrimeCounting 269, ExplicitMultiplicativeFunctions 271,
ExplicitNumberFields 272, ArithmeticDirichletSeriesPartII 91) are all later and are not cited as
suppliers.

**Supplier citations resolved.** ZerosOfLFunctions on main: §3.4 (line 705; the "wide strips above
the poles" clause at line 755), §4.3 (837, `AnalyticOnNhd.sum_divisor_le` form), §6.2 (1046,
`analyticConductorAt`), §6.3 (1075), §6.4 (1097), §6.5 (1142), §7.1 (1182, `rectBoundary`,
counterclockwise, winding number `1` inside, null-homologous), §8.5 (1398), §8.6 (1412); the same
nine headings exist at both open revisions of that roadmap (#1907 and #1913), and the overlap tool
reports no dropped id. LFunctions on main: Layer 3 (line 730, `dedekindZetaC`), Layer 5 (929,
`heckeLFunctionC` with its Euler product on `Re s > 1`), Layer 7 (1440, nonvanishing on `Re s = 1`).
ArithmeticDirichletSeries (completed): §6.3 truncated Perron with `π⁻¹ arctan(T/c)` (lines 267–273),
§6.4, Layers 9–10 (337, 357). ContourIntegration (completed): Layers 2–4 (lines 158–194).
TauberianBoundaryConvergence N1–N2 (lines 21, 51). AnalyticNumberTheoryPartI at its open head:
§§0.11c, 0.33, 1.2a, 3.1, 3.3, 3.4, 3.22, 3.24 all exist (and §§0.33a, 3.24a, the subject of R01
and R02). AnalyticNumberTheoryPartII at its open head owns Layers 4–6 (Lerch, double Dirichlet
series, Eisenstein division values) and none of this roadmap's objects. The board package
AnalyticNumberTheory (#123) is an index of Parts I–II and plans none of them either.

**Library declarations opened at the pins** (file:line in the pinned Mathlib unless marked):
`Real.one_add_sq_mul_norm_fourier_le` (Analysis/Fourier/FourierTransformDeriv.lean:856; needs
`ContDiff ℝ 2 f` and integrable `iteratedDeriv k f` for `k ≤ 2`, as 7.1 supplies),
`Real.fourier_deriv` (:792; `Differentiable ℝ f`, `f` and `deriv f` integrable),
`Real.norm_fourier_le_integral_norm` (FourierTransform.lean:441), `Real.zero_at_infty_fourier`
(RiemannLebesgueLemma.lean:212), `BoundedVariationOn.vectorMeasure`
(MeasureTheory/VectorMeasure/BoundedVariation.lean:119), `variation_vectorMeasure_univ_le` (:566),
`VectorMeasure.norm_integral_le_of_norm_le_const` (VectorMeasure/Integral.lean:774, needs
`IsFiniteMeasure μ.variation`), `VectorMeasure.tendsto_integral_of_dominated_convergence` (:876),
`mellin_eq_fourier` (MellinInversion.lean:49), `mellinInv_mellin_eq` (:92, hypotheses
`0 < x`, `MellinConvergent f σ`, `VerticalIntegrable (mellin f) σ`, `ContinuousAt f x`, as 10.1
lists), `mellinInv` (MellinTransform.lean:96, `(1/(2π)) • ∫ x^{−(σ+yi)} • f(σ+yi)`, the README's
convention), `MellinConvergent` (:45), `Complex.VerticalIntegrable` (:86), `HasMellin` (:160),
`hasMellin_one_Ioc` (:438), `mellin_comp_rpow` (:116), `mellin_comp_mul_left` (:133),
`MellinConvergent.comp_rpow` (:75), `mellin_differentiableAt_of_isBigO_rpow` (:401),
`Complex.integral_boundary_rect_eq_zero_of_differentiableOn` (Complex/CauchyIntegral.lean:313; its
edge expression is the one 8.1 writes), `Complex.borelCaratheodory`
(Complex/BorelCaratheodory.lean:109; centred at `0`, `0 < M`, exactly as the README states),
`AnalyticOnNhd.sum_divisor_le` (Complex/JensenFormula.lean:389), `riemannZeta_eq_exp_LSeries`
(EulerProduct/DirichletLSeries.lean:264), `LSeries_convolution'` (LSeries/Convolution.lean:149),
`ArithmeticFunction.LSeries_mul` (:197), `riemannZeta_ne_zero_of_one_le_re`
(LSeries/Nonvanishing.lean:417), `EulerProduct.eulerProduct_completely_multiplicative_tprod`
(EulerProduct/Basic.lean:357, `F` a complete normed field), `EulerProduct.eulerProduct_tprod`
(:225), `Ring.multichoose` (RingTheory/Binomial.lean:103) with the `BinomialRing` instance for
`ℚ≥0`-modules (:280), `Filter.Tendsto.cesaro` and `cesaro_smul`
(Analysis/Asymptotics/SpecificAsymptotics.lean:191, 176; means `n⁻¹ Σ_{i<n}`, the README's
convention), `Stirling.factorial_isEquivalent_stirling` (:218), `Stirling.le_factorial_stirling`
(:248), `Chebyshev.theta_le_log4_mul_x` (NumberTheory/Chebyshev.lean:191), `Chebyshev.psi` (:70),
`Nat.factorization_factorial` (Data/Nat/Choose/Factorization.lean:42),
`ArithmeticFunction.liouville_apply_mul` (ArithmeticFunction/Liouville.lean:44),
`ArithmeticFunction.cardDistinctFactors` (ArithmeticFunction/Misc.lean:329), `sigma` (:146), `pow`
(:122), `LSeries.abscissaOfAbsConv` (LSeries/Convergence.lean:32), `LSeries.term` (Basic.lean:74,
`0` at `n = 0`), `LSeries_zeta_eq_riemannZeta`, `LSeries_vonMangoldt_eq_deriv_riemannZeta_div`
(LSeries/Dirichlet.lean:283, 439). Tau Ceti:
`BoundedVariationOn.integral_deriv_smul_eq_neg_integral_vectorMeasure`
(Analysis/BoundedVariation/OneDimensional.lean:48; real Banach `E`, `C¹` compactly supported real
`φ`, no integrability of `f`), `TauCeti.Contour.tendsto_integral_sin_div_atTop`
(Contour/WorkedExamples/HalfDisc/SineIntegral.lean:351), `TauCeti.Contour.residue`
(Contour/Residue/Basic.lean:80), `classicalResidueTheorem_nullHomologous`
(Contour/Residue/Cycle.lean:226, hypotheses as the README lists), `truncatedPerronKernel`
(ArithmeticDirichletSeries/Perron/Basic.lean:142, integrand `x^{c+it}/(c+it)`),
`truncatedPerronKernel_one` (:204, `c ≠ 0`), `truncatedPerron_LSeries` (Perron/Formula.lean:130),
`heckeLFunctionC` (LFunctions/Hecke/Basic.lean:74), `heckeLFunctionC_eq_primitive` (:130, on
`Re s > 1`; the germ version at every point is `heckeLFunctionC_eventuallyEq_primitive`, which
the 10.3 route may cite instead), `RayClassCharacter` (namespace `TauCeti.GlobalNumberFields`).

**Duplication by object at the pins.** Mathlib has no complete-multiplicativity predicate on
`ArithmeticFunction` (only the `ℕ →*₀ F` Euler product), no Mellin convolution, no divisor function
with complex exponent, no `d_z`, no Tauberian theorem (grep `tauber`: none), no Ingham-type transfer,
no Goldbach predicate, no Carathéodory coefficient inequality (BorelCaratheodory.lean has only the
value form). Tau Ceti has Newman and Wiener–Ikehara Tauberian theorems (LSeries/Newman,
LSeries/WienerIkehara) but no Cesàro one, and none of the other objects. Across main and the 471
open roadmap pull requests, searched by object: Mellin convolution (only `MellinConvergent` hits),
delta spikes and smoothed cutoffs, Landau's local lemma, the Dirichlet kernel, Fourier decay for
bounded variation, Cesàro Tauberian theorems, `σ_ν`, `d_z`, Erdős 392 and the Goldbach ranges have
no other owner; the Fejér means, the line shift and `Si` are owned where Scope says
(ToeplitzOperators T1 on main; AsymptoticExpansions §8.2 and SpecialFunctionsEiLiErfIncompleteGamma
Layer 9 at their open heads, both only in Scope, not consumed). ProbabilisticAndMetricNumberTheory,
SieveMethodsAndPrimePatterns and CircleMethodThreePrimes mention complete multiplicativity and
Goldbach only in prose or for sieve bounds. The two real overlaps are R01, R02 (Part I) and R08
(ArithmeticDirichletSeriesPartII, settled in this roadmap's favour).

**Sources, sampled.** Every flagged-unverified locator and every sampled target was read at its
locator in the cached text:

| Target | Locator | Checked |
|---|---|---|
| 7.1 | kontorovichtao-pntplus lines 189–220, Lemmas 3.1.4–3.1.7 | `‖ψ‖_TV/(2π|u|)` for `u ≠ 0`; `‖ψ′‖_TV/(2π|u|)²`; `(‖ψ‖₁ + ‖ψ′‖_TV/(2π)²)/(1 + u²)`; `C = π + 1/(4π)` at line 220 |
| 7.2 | dlmf-ch6 6.2.19, 6.12.5–6.12.8, §6.16 | read online at the DLMF site (the cached text is the chapter index only): `Si = π/2 − f cos − g sin`; at `n = 0`, `f(x) = ∫₀^∞ e^{−xt}/(1+t²) dt ∈ (0, 1/x]`, `g(x) ≤ 1/x²`; first maximum of `½ Si` at `π`, `1.1789 × π/4`, so `Si(π) = 1.8519…` |
| 7.3 | montgomeryvaughan2007 Ch. 5 §5.1; titchmarsh1986 Ch. III | uncertified, cited by locator; the statement is classical and the README's own route is complete |
| 8.1 | lines 596–642, Definitions 4.1.3–4.1.5, Lemma 4.1.1, Theorem 4.1.2, Lemmas 4.1.2–4.1.4 | upper/lower U integrals, vertical integral, the `1/s` square `2πi`, simple poles only in the source; the README's general-pole form is stronger and is supported by Tau Ceti's residue theorem |
| 8.2 | lines 1751–1758, Theorem 5.3.2 | `16MR²/(R − r)³`, `f(0) = 0`, `M > 0`, closed disc; the README's `2k!R(M − Re f(z₀))/(R − r)^{k+1}` is the sharp form (extremal checked below) |
| 8.3 | lines 1971–1977, Theorem 5.3.7 | zeros in `|ρ| ≤ r`, `z ∈ D_{r′} ∖ 𝒦_f(R′)`, explicit constant in `r′, r, R′, R`; the README's `C(r₁/R, r₂/R)` absorbs the choice of `R′` |
| 9.1 | lines 893–946, Definition 4.3.1, Lemma 4.3.2, Theorem 4.3.1 | definition, symmetry (source says `x ≠ 0`, see Source issues), Fubini hypothesis (4.1) |
| 9.2 | lines 947–962, Theorem 4.3.2 | `O(1/|s|)` on `σ₁ ≤ Re s ≤ 2` by one integration by parts; the README's `k`-fold form and general strip are its iteration |
| 9.3 | lines 964–1005, Definition 4.3.2, Lemma 4.3.3, Theorem 4.3.3, Lemma 4.3.4 | `ν_ε(x) = ε⁻¹ν(x^{1/ε})`, mass one, `𝓜ν_ε(s) = 𝓜ν(εs)`, `1 + O(ε)` at `1` |
| 9.4 | lines 1015–1134, Definition 4.3.3, Lemmas 4.3.5–4.3.11 | `1̃_ε = 1_(0,1] ∗ ν_ε`; `= 1` below `1 − cε` with `c = log 2`, `= 0` above `1 + cε` (`ε < 1`); `0 ≤ 1̃_ε ≤ 1`; `𝓜1̃_ε = 𝓜ν(εs)/s`; `O(1/(ε|s|²))` on `0 < σ₁ ≤ Re s ≤ σ₂`; `1 + O(ε)` at `1` |
| 10.1 | lines 1463–1506, Definition 4.5.2, Theorems 4.5.2–4.5.3 | `ψ_ε(X) = Σ Λ(n) 1̃_ε(n/X)`; `ψ_ε = ψ + O(εX log X)` (the README adds the `+1`, see the adversarial table) |
| 10.2 | platttrudgian2020 lines 21–32, 54–56; kontorovichtao-pntplus lines 1507–1516, 1673–1687 | `ω(x) = min_{t≥1}(η(t) log x + log t)`, Ingham's `exp(−½(1−ε)ω)`, Pintz deletes the `½`; Definition 4.5.3 and Theorem 4.6.1 `exp(−c(log x)^{1/(1+n₁)})`, Theorem 4.6.2 at `1/10` |
| 10.3 | kontorovichtao-pntplus lines 1718–1723, Theorem 5.2.3 | `−ζ′/ζ ≪ log² t` in `σ > 1 − c/log t`; MV Ch. 6 §6.1 and Titchmarsh Ch. III uncertified |
| 11.1 | lines 3590–3604, Definition 9.1.8, Theorems 9.1.66–9.1.67 | definition named, implies multiplicative, Liouville |
| 11.2 | lines 3151–3212 (Definition 9.1.3, Theorems 9.1.12–9.1.15), 3215–3240 (Definition 9.1.4, Theorems 9.1.16–9.1.19), 3298–3323 (Theorems 9.1.30–9.1.32) | `d_k`, `d_k(p^a) = C(a+k−1, k−1)`, `L(d_k) = ζ^k`; `σ_s` with complex exponent, prime powers; `L(σ_ν, s) = ζ(s)ζ(s−ν)` for `Re s > 1`, `Re(s−ν) > 1` |
| 11.3 | lines 3324–3363, 3489–3492, Theorems 9.1.33–9.1.36, 9.1.50 | Ramanujan with the four half-plane conditions; `ζ⁴/ζ(2s)`; `ζ³/ζ(2s)` for `τ(n²)` |
| 11.4 | lines 3454–3461, 3535–3546, 3605–3614, 3626–3640, Theorems 9.1.49, 9.1.57, 9.1.68, 9.1.70 | `2^ω`, `μ²`, `λ`, `φ` with `Re s > 2` and the source's own note that `Re s > 1` was wrong |
| 12.1 | estradavindas2012littlewood lines 25–35 | Littlewood's `c_n = O(1/n)` and the Hardy–Littlewood one-sided relaxation `n c_n > −C` for Abel summability; hardy1949 uncertified |
| 13.1 | kontorovichtao-pntplus lines 2980–3101, Definitions 8.1.1–8.1.4, Sublemma 8.1.16, Theorems 8.1.1–8.1.2 | waste/balance/score, `π(n) ≤ √n + 2n log 4/log n`, `n − n/log n + o(n/log n)` factors at most `n`, `n/2 − n/(2 log n) + o(n/log n)` at most `n²` |
| 13.2 | oliveiraesilva-herzog-pardi2014 lines 13–14; helfgottplatt2013 lines 9–10, 24–31 | even Goldbach to `4·10¹⁸`; ternary to `8,875,694,145,621,773,516,800,000,000,000` (31 digits, as the README writes), odd `n > 5`; Saouter's ladder |

**Adversarial table** (sampled targets, headline theorems, and every target a finding touches; values
computed this round).

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 7.1 `‖𝓕f(ξ)‖ ≤ V/(2π|ξ|)` | `1_[0,1]`, `ξ = 1/2`; `ξ = 0` | `|𝓕f(1/2)| = 2/π`, bound `2/(2π·½) = 2/π`; at `0`: `1 > V/0 = 0` | sharp; `ξ ≠ 0` needed | none |
| 7.1 bounded by `V`, `→ 0` | `1_[0,1]`; `1_[0,∞)` | `sup = 1 ≤ 2`; `1_[0,∞)` has `V = 1`, limit `1`, not integrable | integrability needed, stated | none |
| 7.1 derivative of BV | tent, `ξ = 1/2`, `0` | `V₁ = 1 + 2 + 1 = 4`; `(2/π)² = 4/π² = 4/(2π·½)²`; `1 ≤ 1 + 1/π²` | sharp | none |
| 7.1 `C²` form | `1/(1+t²)`, `A = 2` | `max |6t²−2|/(1+t²)² = 2.000` (at `t = 0`); `𝓕f(0) = π ≤ 2(π + 1/(4π)) = 6.44` | holds | none |
| 7.2 bounds | `x = π, 2π, 1, −1` | `I(π) = 1.85194 > π/2`; `π/2 − I(π) = −0.2811`, `2/π = 0.6366`; `π/2 − I(2π) = 0.1526 ≤ 0.3183`; `I(1) = 0.9461`; `π/2 − I(−1) = 2.517 > −2` | holds for `x > 0`; `|I| ≤ π/2` false | none |
| 7.2 route constant | tail by parts | `|cos x/x| + ∫_x^∞ dt/t² = 2/x` for every `x > 0` (DLMF `f + g ≤ 1/x + 1/x²` only gives `2/x` for `x ≥ 1`) | README's route is self-contained | none |
| 7.3 pointwise inversion | `1_(0,1]` at `x₀ = 1` | `π⁻¹ arctan(T/σ) → 1/2 = (1 + 0)/2`, not `f(1) = 1` | holds | none |
| 7.3 windowed error, truth | `h = e^{−σu}1_{u≥0}`, `(σ, T) = (1,10), (10,1), (1000,1)` | error `π⁻¹arctan(σ/T) = 0.0317, 0.468, 0.4997`; `min_δ(σδ + 2/(Tδ)) = 0.895, 8.95, 89.5`; ratios `0.035, 0.052, 0.0056` | holds with `C ≥ 1/4`; the three pieces of the route re-derived: window `2I(π)V^±_δ/π`, tail `(2 sup|h| + V)/(πTδ)`, mean `2/(πTδ)·2V` | none |
| 7.3 tail needs BV | `sin(T₀v)1_[δ,2δ]`, `T₀ = 2000`, `δ = 1` | tail `0.11027 → log 2/(2π) = 0.11032`; `‖h‖₁/(T₀δ) ≤ 5·10⁻⁴` | Check correct | none |
| 8.1 rectangle | `1/s`, `1/(s−2)`, `1/s²` on `[−1,1]²` | `2πi` (edges: `iπ/2 + iπ/2 + iπ/2 + iπ/2`); `0`; `0` | holds, orientation pinned | none |
| 8.1 U-form sign | `1/s`, `σ₁ = −1`, `σ₂ = 1`, `T = 1` | right `π/2`, left `−π/2`, bottom `iπ/2`, top `−iπ/2`; horizontal term must be `−π = (top − bottom)/i` | prose ambiguous | R03 |
| 8.2 Carathéodory / derivative BC | `f = −2Mw/(R−w)`, `M = R = 1`, `r = 1/2`, `k = 1, 2, 3`; `f ≡ i`, `k = 0` | `Re f ≤ 0.9995 < 1` on `|w| = 0.999`; `|f^{(k)}(½)| = 8, 32, 192 = 2k!/(½)^{k+1}`; `|i| ≤ 0` false | sharp for `k ≥ 1`; `k = 0` excluded | none |
| 8.2 coefficient route | `n ≥ 1` | `π⁻¹∫(M − Re f(z₀+ρe^{iθ}))e^{−inθ}dθ = −a_nρ^n` (the `e^{inθ}` half of `Re f` contributes `πa_nρ^n`) | holds | none |
| 8.3 Landau | `f = z − ρ`; `M = 0`; `z − z₀ − ε`; `z ↦ z₀ + λ(z − z₀)` | `0 = 0`; constant by maximum modulus; `1/ε` against `C log((R+ε)/ε)/R`; both sides scale by `λ` | holds | none |
| 9.1 Mellin convolution | `1_(0,1] ⋆ 1_(0,1]`; `x = 0` with `1_[0,1]`, `1_[1,2]`; `1_[1,2] ⋆ 1_[1,2]` at `2` | `log(1/x)` on `(0,1]`, transform `1/s²`; `log 2 ≠ 0`; `log 2`, support `[1,4]` | symmetry only for `x > 0` | none |
| 9.2 bumps | `(x−1)²(2−x)²1_[1,2]`; `max(0, 1−x)²` | `𝓜ν(0) = 0.0225887 = 4 log 2 − 11/4`; `∫ν = 0.033333 = 1/30`; `𝓜ν(1) = 1/30 = −𝓜ν′(2)`; `B(s,3) = 2/(s(s+1)(s+2))` has poles | holds; `0 < a` needed | none |
| 9.3 spikes | `ε = 1`, `1/2`; `x = 0, −1` | `ν_1 = ν`; support `[2^{−½}, 2^{½}]`; mass `∫ε⁻¹ν(x^{1/ε})dx/x = ∫ν(y)dy/y = 1`; value `0` | holds | none |
| 9.4 cutoffs | symmetric `ν`, `x = 1`; `x = 2^{−ε}`, `2^{ε}`; `s = 1 + iT`, `k = 1` | `∫_1^∞ν_ε dz/z = 1/2`; `∫_{2^{−ε}}^∞ = 1`, `∫_{2^ε}^∞ = 0`; `𝓜 ≍ 1/(T(1 + εT))`; `|𝓜ν(ε) − 1| ≤ 2ε log 2` | holds, uniform in `ε ≤ 1` | none |
| 10.1 identity | `a = δ₁` | both sides `1̃_ε(1/X)`; hypotheses of `mellinInv_mellin_eq`: `σ > 0`, `k ≥ 1` decay, continuity on `(0,∞)` | holds | none |
| 10.1 comparison | `a ≡ 1`, `X = 2`, `ε ≤ log₂(3/2) = 0.585` | `n = 1`: `1̃_ε(½) = 1` (`½ ≤ 2^{−ε}`); `n = 2`: `1 − ½`; `n = 3`: `1̃_ε(3/2) = 0`; difference `1/2` against `2Cε → 0` | `+1` needed and present | none |
| 10.2 exponent | `η = c₀/log t`, `c₀ = 1`, `log x = 100`; `η ≡ η₀`; `η(x) log x` | `min_u(100/u + u) = 20.000` at `u = 10.00`; `η₀ log x + log 3`; constant `c₀` | infimum form correct | none |
| 10.2 transfer, region | rectangle `[1 − η(T+3), σ₀] × [−T, T]` | inside `R_η` since `η` nonincreasing: `η(|Im s| + 3) ≥ η(T + 3)` | holds | none |
| 10.2 transfer, route | steep `η` (R05 witness), `log x = 2 log T₀` | left-edge saving `exp(−2 log T₀/log²(T₀+3)) → 1`; with `T` from `η(T+3)`: `≥ exp(−ω/2 + O(1))` | theorem true, route slip | R05 |
| 10.2 instances | `a = μ`, `r = 0`, `G = 1/ζ`; `a ≡ 1`, `r = 1` | `M(x) = O(x e^{−c√log x})`; `⌊x⌋ − x = O(1)` | consistent | none |
| 10.3 statement | `K = ℚ`, `χ = 1`; trivial character mod `2`; residue | `G = −ζ′/ζ − 1/(s−1)` bounded by `C log(|t|+2)` by Part I §0.33a; extra term `(log 2)2^{−s}/(1 − 2^{−s})` bounded on `Re s ≥ 1/2`; residue of `−ζ′/ζ` at `1` is `+1` | true; `ζ` case owned by Part I | R01 |
| 10.3 Euler lower bound | `|L(2+it)|` | `≥ ∏_𝔭(1 + N𝔭^{−2})^{−1} ≥ (ζ(4)/ζ(2))^{[K:ℚ]} = 0.658^{[K:ℚ]}` | depends only on degree | none |
| 11.1 | `λ(4), λ(12)`; `μ(4)`; zero function; `λ ⋆ μ²` at `4` | `1 = 1`, `−1 = 1·(−1)`; `0 ≠ 1`; `f 1 = 0` excluded; `0 − 1 + 1 = 0` | holds | none |
| 11.2 `σ_ν` | `σ₁(6)`, `σ_{−1}(6)`, `σ_{1/2}(4)`; abscissa for `ν = 2, −2, it` | `12`, `2`, `3 + √2 = 4.4142`; `3`, `1` (`σ_{−2}(p) ≥ 1 − 2^{−2}`), `1` (`|1 + p^{it}| ≥ 1 + cos(t log p)`, `Σ_p cos(t log p)p^{−σ}` bounded as `σ → 1⁺` by `ζ(1+it) ≠ 0`) | holds | none |
| 11.2 `d_z` | `d_{1/2}(p²)`; `d_{1/2} ⋆ d_{1/2}` at `p²`; `d_3(4)`; `d_{−1}`; `d_2(p^a)`; `z = 0` | `3/8`; `3/8 + 1/4 + 3/8 = 1`; `multichoose 3 2 = 6`; `multichoose (−1) a = 0` for `a ≥ 2`, `−1` at `a = 1`; `a + 1`; abscissa `⊥` | holds; principal `ζ^{1/2}` excluded by the sign remark | none |
| 11.3 Ramanujan | local factors; `α = 2, β = 0, s = 3` | `(1−X)^{−4}(1−X²) = 1 + 4X + 9X² + 16X³ + 25X⁴`; `(1−X)^{−3}(1−X²) = 1 + 3X + 5X² + 7X³`; `Σ_p 2(p²+1)/p³ = ∞` | holds; `τ²` case is Part I §3.24a | R02 |
| 11.3 denominator | `Re(2s − α − β)` | `> 2` from the two shifted conditions added | `ζ(2s−α−β) ≠ 0` | none |
| 11.4 | Euler factors; `φ` at `σ = 2`; `μ²(12)` | `1 + 2X + 2X² + …`; `1 + X`; `1 − X + X² − …`; `(1−X)/(1−5X) = 1 + 4X + 20X² + …`; `Σ_p (p−1)/p² = ∞`; `μ(1) + μ(2) = 0` | abscissas `1, 1, 1, 2` | none |
| 12.1 | `(−1)^n`; `a_n = 1`; `(−1)^n/√n`; `(−1)^n/(n+1)` | means `→ 1/2`, sums `1, 0, 1, …`; means diverge; `n a_n` unbounded below; `log 2` | hypothesis necessary and sufficient as stated | none |
| 13.1 | `n = 4`, `B = 16, 4`; `n = 0, 1`; main terms | `2` (`24 > 16`, `log 24/(2 log 4) = 1.146`), `3` (`4² = 16 < 24`); `0`; lower bounds `n/2 − n/(2 log n) + O(1)` and `n − n/log n + O(1)` from Stirling | holds; definition total only for `B ≥ n` (API restricted accordingly) | none |
| 13.2 | `H = 30, 33, 56`; `2`, `5`; `H = 3, 6`; ladder step | finite search: all even `4..30`, odd `7..33`, odd `7..55` are sums (`55 = 3 + 5 + 47`); `2`, `5` fail; vacuous; `p > x(1 − 1/Δ) ≥ 2` odd, `4 ≤ n − p < 4 + x/Δ ≤ H` | holds | none |
| Conventions | `𝓕1_[0,1](½)`; `mellin 1_(0,1] 2`; `(1⋆1)(e^{−1})`; `d_{1/2}(p²)` | `(1 − e^{−πi})/(πi) = −2i/π`; `1/2`; `1`; `3/8` | witnesses correct | none |

**Shape.** `# Roadmap:` title and `**Summary.**`; Scope and ownership; Conventions; Exact supplier
contracts; How to read the build; Layers 7–13 in build order with `### Examples` and
`### Dependencies` each; Downstream consumers; References. Every definition (`mellinConv`,
`deltaSpike`, `smoothCutoff`, `inghamExponent`, `IsCompletelyMultiplicative`, `sigmaC`,
`generalizedDivisor`, `factorialFactorCount`, `EvenGoldbachUpTo`, `OddGoldbachUpTo`) has an API list
and at least three discriminating Checks (3, 3, 4, 4, 4, 6, 3, 4); every theorem carries its
hypotheses and a locator; every `*Needs:*` line resolves. No LaTeX delimiters, no pull-request
numbers, no machine paths, no target tables. Process residue: one phrase (R06). `plan.json`: 7
layers, 36 targets, suppliers and consumers consistent with the README, `gaps = []`,
baseline pins recorded. `sources.toml`: all 14 cited works recorded, one key each, the seven
paywalled texts `uncertified` with locators and no theorem numbers guessed.

**Headline theorems** (from the Summary, for the package stage): 7.1 decay, 7.3 inversion, 8.1
rectangle residues, 8.2 derivative Borel–Carathéodory, 8.3 Landau, 9.4 cutoff transform bounds,
10.1 smoothed sum, 10.2 Ingham transfer, 10.3 general `L′/L` bound, 11.2 abscissas and `d_z` series,
11.3 Ramanujan, 11.4 classical series, 12.1 Hardy–Landau, 13.1 Erdős 392, 13.2 Goldbach transfer.
All are statable at the pins (carriers: `𝓕`, `eVariationOn`, `mellin`, `mellinInv`,
`TauCeti.Contour.residue`, `LSeries`, `riemannZeta`, `ArithmeticFunction`, `Ring.multichoose`,
`TauCeti.LFunctions.heckeLFunctionC`, `Nat.factorial`, `Nat.Prime`), including 8.1 and the general
10.3 (R04). The `K = ℚ` instance of 10.3 is not a headline of this roadmap (R01).

## Not verifiable

- `montgomeryvaughan2007`, `titchmarsh1986`, `iwanieckowalski2004`, `tenenbaum2015`,
  `apostol1976`, `hardy1949`, `katznelson2004`: settled as uncertified; cited by chapter, section or
  equation locator only. For 7.3 (pointwise inversion), 8.2 (coefficient inequality), 8.3 and 10.3
  these are the primary statements; the certified blueprint supports the weaker forms, and the
  README's own routes were checked instead.
- `dlmf-ch6`: the cached extraction is the chapter index (113 lines); equations 6.2.19,
  6.12.5–6.12.8 and §6.16 were read on the DLMF site this round and agree with the README.

## Source issues

- **Misprint** in kontorovichtao-pntplus at Lemma 3.1.3, printed p. 7 (line 187): the statement
  ends with a clause about an absolute constant `C` although no `C` occurs in it; it should end
  after the `L¹` bound; affects nothing.
- **Misprint** in kontorovichtao-pntplus at Lemma 4.3.2, printed p. 23 (line 901): symmetry of the
  Mellin convolution is asserted for `x ≠ 0` for functions on the positive reals; it should be
  `x > 0` (on an `ℝ`-carrier the substitution `z = x/y` fails for `x < 0`); affects nothing.
- **Misprint** in kontorovichtao-pntplus at Lemma 4.3.4, printed p. 25 (line 985): the proof cites
  Lemma 4.3.1 for `𝓜ν_ε(1) = 𝓜ν(ε)`; it should cite Corollary 4.3.1; affects nothing.
- **Error** in kontorovichtao-pntplus at Theorem 9.1.70, printed p. 90 (lines 3626–3631): the
  totient series was stated for `Re s > 1` in an earlier build; it should be `Re s > 2`;
  affects a stated result; corrected in print at the same theorem (the build read records the
  correction).

<!-- tauceti-roadmap-review {"agent": "claude", "head": "08250e4c799ff3f4054b5deb294c93fe813b51d1", "job": "REV-DESIGN-AnalyticNumberTheoryPartIII", "model": "fable", "worker": "chris-c-antiiir"} -->
