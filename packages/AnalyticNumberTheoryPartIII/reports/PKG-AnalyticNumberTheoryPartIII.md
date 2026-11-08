# PKG-AnalyticNumberTheoryPartIII

Package of the accepted design of `AnalyticNumberTheoryPartIII` into
`packages/AnalyticNumberTheoryPartIII/README.md`, `packages/AnalyticNumberTheoryPartIII/Suggested.lean`
and `packages/AnalyticNumberTheoryPartIII/metadata.toml` (`topic = "math.NT"`, as on main, e.g.
`TauCetiRoadmap/ZerosOfLFunctions/metadata.toml`), with `packages/AnalyticNumberTheoryPartIII/sources.toml`
kept up to date. `design/plan.json` is unchanged: the package declares no supplier gap, so its
`gaps` list stays `[]`.

This run starts from the earlier attempt's deliverables. That attempt failed the worker's checks on
one point only (`depcheck=1: NOT IN ORDER`). The merge order now lists this roadmap at line 273,
right after ExplicitNumberFields, and the dependency check is clean. The new position reverses the
direction the design assumed for ArithmeticDirichletSeriesPartII (line 91) and for the explicit
roadmaps (ComputationalNumberTheory 266, ExplicitZetaBounds 267, EffectiveClassNumbers 268,
ExplicitPrimeCounting 269, ExplicitCharacterSumsAndSieves 270, ExplicitMultiplicativeFunctions 271,
ExplicitNumberFields 272). These are now earlier than this roadmap, so they can be suppliers or
owners and never consumers. The ownership sweep was redone against every roadmap that became earlier,
and the README was corrected (items 12–18 below).

Inputs read: `design/README.md`, `design/plan.json`, `reports/REV-DESIGN-AnalyticNumberTheoryPartIII.md`
(eight findings, applied by `reports/FIX-DESIGN-AnalyticNumberTheoryPartIII~2.md` and carried into the
package; there is no `design/review.json`), the sources manifest, the content repository at main
(`c58403c`), the board's packages, the open roadmap pull requests at their heads through
`roadmaps show`, `roadmaps grep` and `roadmaps resolve`, and the pinned Mathlib (`1b1ccf4b`) and Tau
Ceti (`2fd255d9`) of `lake-manifest.json`.

## Headline theorems

Every headline theorem is statable at the pins and is stated in `Suggested.lean`:

| Target | Headline | Lean name |
|---|---|---|
| 7.1 | `‖𝓕f(ξ)‖ ≤ V/(2π|ξ|)` for integrable `f` of bounded variation, `ξ ≠ 0` | `norm_fourier_le_eVariationOn_div` |
| 7.3 | principal-value Mellin inversion at a point of local bounded variation | `tendsto_truncated_mellinInv` |
| 7.3 | windowed error of the Dirichlet-kernel integral, absolute constant | `norm_dirichletKernel_integral_sub_mean_le` |
| 8.1 | residue theorem on a rectangle in Mathlib's edge form | `rectangle_boundary_integral_eq_residues` |
| 8.2 | derivative Borel–Carathéodory (Carathéodory's inequality at `r = 0`) | `norm_iteratedDeriv_le_borelCaratheodory` |
| 8.3 | Landau's local logarithmic-derivative lemma | `norm_logDeriv_sub_sum_zeros_le` |
| 9.4 | `mellin 1̃_ε s = mellin ν (εs)/s` | `mellin_smoothCutoff` |
| 9.4 | `‖mellin 1̃_ε s‖ ≤ C/(|s|(1 + ε|s|)^k)`, uniform in `ε ≤ 1` | `norm_mellin_smoothCutoff_le` |
| 10.1 | smoothed sum as an inverse Mellin integral | `smoothedSum_eq_mellinInv` |
| 10.2 | transfer theorem in Ingham's zero-free-region form | `norm_sum_sub_mul_le_of_zeroFreeRegion` |
| 10.3 | `−L′/L = G + δ_χ/(s − 1)`, `|G| ≪ log(|t| + 3)` in a de la Vallée Poussin region, every Hecke `L`-function of a ray class character | `logDeriv_heckeLFunctionC_bound` |
| 11.2 | `L(σ_ν, s) = ζ(s)ζ(s − ν)` | `LSeries_sigmaC` |
| 11.2 | abscissa of `σ_ν` is `max(1, 1 + Re ν)` | `abscissaOfAbsConv_sigmaC` |
| 11.2 | `L(d_z, s) = exp(z log ζ(s))`, absolutely convergent, `z ∈ ℂ` | `LSeries_generalizedDivisor` |
| 11.2 | abscissa of `d_z` is `1` for `z ≠ 0` | `abscissaOfAbsConv_generalizedDivisor` |
| 11.3 | Ramanujan's four-shift identity | `LSeries_sigmaC_mul_sigmaC` |
| 11.4 | series of `2^ω`, `μ²`, `λ` | `LSeries_two_pow_omega_moebius_sq_liouville` |
| 11.4 | series of `φ` on `Re s > 2` | `LSeries_totient` |
| 11.4 | abscissas `1, 1, 1, 2` | `abscissaOfAbsConv_two_pow_omega_moebius_sq_liouville_totient` |
| 12.1 | Hardy–Landau, one-sided, real | `tendsto_of_cesaro_of_mul_ge` |
| 12.1 | Hardy–Landau, two-sided, real normed space | `tendsto_of_cesaro_of_norm_mul_le` |
| 13.1 | Erdős problem 392: `n/2 − n/(2 log n) + o(n/log n)` factors at most `n²` | `factorialFactorCount_sq_sub_isLittleO` |
| 13.1 | `n − n/log n + o(n/log n)` factors at most `n` | `factorialFactorCount_self_sub_isLittleO` |
| 13.2 | Goldbach interval transfer | `oddGoldbachUpTo_of_primeGaps` |

Definitions in `Suggested.lean`, each needed by a headline: `deltaSpike`, `smoothCutoff`,
`inghamExponent`, `sigmaC`, `generalizedDivisor`, `factorialFactorCount`, `EvenGoldbachUpTo`,
`OddGoldbachUpTo`. None is sorry'd data; each has a real body on native carriers.

Not statable at the pins: none.

## Corrections made relative to the accepted design

Carried from the earlier attempt (checked again in this run):

1. **Suggested.lean definitions.** No headline needs `mellinConv` or `IsCompletelyMultiplicative`,
   which the design planned for the file. `smoothCutoff` is defined directly as
   `x ↦ ∫_{(x,∞)} ν_ε(z) dz/z` for `x > 0` (equal to `(1_(0,1] ⋆ ν_ε)(x)`), and 11.4 uses Mathlib's
   `liouville`. Both stay README targets, written in italics.
2. **10.3: "of finite order" dropped.** The hypothesis was vacuous:
   `TauCeti.GlobalNumberFields.finite_rayClassGroup` makes every ray class group finite.
3. **12.1b generalized** from a real Banach space to a real normed space. Completeness is not used,
   since the limit `S` is given.
4. **10.2 generalized** from `A > 0` to `A ≥ 0` in the lower bound for the width `η`.
5. **8.3 normalized** to radii `r₁R`, `r₂R` with `0 < r₁ < r₂ < 1` and `C = C(r₁, r₂)`.
6. **9.4**: the transform formula holds for every `ε > 0`; the decay bound keeps `ε ≤ 1`.
7. **Scope** gained kept-variant clauses for Part I §0.30a (vs 8.3) and ZerosOfLFunctions §7.2 (vs
   8.1).
8. **New Checks** with computed values in 7.1, 7.3, 8.1, 8.3, 9.4, 11.2, 11.3, 11.4, 12.1 and 13.1.
9. **7.3 route**: the tail estimate names the variation bound it uses.
10. **Locators**: Titchmarsh and Montgomery–Vaughan are cited by chapter and section only.
11. **sources.toml**: three `version_note` fields lost the phrase "to be fixed by the design".

New in this run:

12. **ζ^k series ownership (review F08, reversed by the merge order).** The design and review F08
    made 11.2 the owner of the series of `d_k = ζ^k`, `k ∈ ℕ`, because ArithmeticDirichletSeriesPartII
    was expected to come later. It is earlier (line 91 against 273), and its §5.1 states
    `LSeriesHasSum_zeta_pow`: for `k ∈ ℕ` and `Re s > 1` the series converges absolutely with sum
    `ζ(s)^k`. That section now owns it.
    - The README API bullet "at `z = k : ℕ` it is `ζ(s)^k`" is deleted. 11.2 is the complex-exponent
      variant, and Scope says so.
    - The `z = k` case is now a Check against that section, with the computed value
      `Σ τ(n)/n² = ζ(2)² ≈ 2.70581`.
    - The section was added to the supplier contracts, Consumed and the *Needs* line.
    - The `LSeries_generalizedDivisor` docstring now says the `z = k` instance is that section's.
    - The Downstream entry "ArithmeticDirichletSeriesPartII §5.1 takes the series from 11.2" is
      deleted.
13. **Explicit roadmaps are not consumers.** The Downstream consumers section named
    ExplicitPrimeCounting, ExplicitZetaBounds, ExplicitMultiplicativeFunctions and
    ExplicitNumberFields as consumers, and Scope said the explicit roadmaps "take the general tools
    from here". All of them are earlier, and none cites this roadmap (`roadmaps grep
    'AnalyticNumberTheoryPartIII'`: no match anywhere).
    - Downstream consumers now describes the general uses without naming earlier roadmaps.
    - The Scope bullet now names, by section, what those roadmaps own: ExplicitZetaBounds §6.1 and
      Layer 7 (§7.6), and ExplicitPrimeCounting §§1.4, 3.1, 3.6 and Layer 7. It says that they
      precede this roadmap and use their own routes.
14. **Kept-variant clauses** for two objects of the explicit roadmaps that are close to targets here:
    - ExplicitPrimeCounting §2.1 bounds the Mellin transform of kernels with `tφ′` of bounded
      variation by `max(1, b)V/|s|²` on `0 ≤ Re s ≤ 1`. 9.2 differs: `C^k` bumps, every strip, decay
      `(1 + |s|)^{−k}`.
    - ExplicitPrimeCounting §3.1 gives explicit `ψ` bounds from a region, a verified height, a zero
      count and a density, through the explicit formula. 10.2 differs: a qualitative transfer for an
      arbitrary Dirichlet series, with no zero count.
15. **ProbabilisticAndMetricNumberTheory §0.1a** (earlier, line 61) owns complete additivity and the
    exponentials `n ↦ k^{f(n)}` of additive functions, including the multiplicativity of `2^ω`.
    - It is now cited in Scope, Consumed and a new supplier subsection.
    - 11.4's *Needs* line takes the multiplicativity of `2^ω` from it.
    - A new 11.1 Check separates the two notions: `2^Ω` is completely multiplicative and `2^ω` is not
      (`2^{ω(4)} = 2 ≠ 4`).
    - 11.1's predicate is not duplicated: that roadmap has no complete-multiplicativity predicate.
16. **13.2 instance.** "Its instances … belong to the explicit roadmaps" became a citation of
    ExplicitPrimeCounting Layer 7. A new Example uses §7.1 (Schoenfeld's interval, under that
    roadmap's named hypotheses) and derives:
    - the hypothesis of the transfer, with `Δ = 16598` and `x₀ = 2 010 882`;
    - from `EvenGoldbachUpTo (4·10¹⁸)`, the range `OddGoldbachUpTo ((4·10¹⁸ − 4)·16598 + 4)`.

    §7.1 is in a new supplier subsection, marked as used by an Example only.
17. **10.2 route sentence corrected.** It said that Ingham's `1/2 − ε` "needs zero-density input".
    Platt–Trudgian (platttrudgian2020 lines 21–32, 54–56) attribute `(1 − ε)/2` to Ingham and the
    removal of the factor `1/2` to Pintz. The sentence now says that both proofs sum the explicit
    formula over the zeros, with a zero count and, for Pintz's form, a density
    (ExplicitPrimeCounting §3.1(d)). The hypotheses of 10.2 provide neither.
18. **Two Check values corrected.**
    - 8.3: "`f(z) = z − ρ`: both sides are `0`" was wrong, since the right side is `CM/R` with
      `M = log((R + |ρ − z₀|)/|ρ − z₀|) > 0`. The Check now states the left side `0` and treats a
      zero just outside the `r₂R`-disc.
    - 13.1: the lower bound `log 5!/log 5` is `2.9746`, now printed `2.97` (was `2.98`).

    12.1's sample `(−1)^n/√n` now fixes `a_0 = 0`.

## What the README could not support

Nothing is missing. Seven works are settled `uncertified` and cited by locator only:
`montgomeryvaughan2007`, `titchmarsh1986`, `iwanieckowalski2004`, `tenenbaum2015`, `apostol1976`,
`hardy1949`, `katznelson2004`. For 7.3, 8.2, 8.3 and 10.3 they are the primary statements, so the
README's routes were checked directly instead (the 8.2 and 8.3 routes again in this run; see the
table). The cached `dlmf-ch6` text is the chapter index; 7.2's bound `2/x` is proved in the README
by one integration by parts. No new source was cited in this run, so nothing was fetched and
`needs-references.toml` was not written.

## Notions moved down from later roadmaps

None. Every supplier is on main or earlier in the merge order:
- on main: ContourIntegration and ArithmeticDirichletSeries (completed), LFunctions,
  ZerosOfLFunctions;
- earlier in the order: AnalyticNumberTheoryPartI (49), ProbabilisticAndMetricNumberTheory (61),
  ArithmeticDirichletSeriesPartII (91), ExplicitPrimeCounting (269).

Scope also names, as owners of objects not planned here:
- on main: TauberianBoundaryConvergence and ToeplitzOperators;
- earlier: ExplicitZetaBounds (267);
- in new-roadmap pull requests that are not in the merge order: AsymptoticExpansions and
  SpecialFunctionsEiLiErfIncompleteGamma.

None of these appears on a *Needs* line or in a supplier contract.

## Duplication sweep and ownership

Searched by object in the pinned Mathlib and Tau Ceti, in the board's packages, and through
`roadmaps grep` on main and at the heads of the open roadmap pull requests. The objects: Mellin
convolution, delta spikes, smoothed cutoffs, Carathéodory and Borel–Carathéodory, Landau's local
lemma, the rectangle residue theorem, Cesàro and Hardy–Landau Tauberian theorems, Ingham's transfer,
Goldbach ranges, Erdős 392 and factorial factorizations, Ramanujan's identity, `σ_ν`, `d_z` and
`multichoose`, complete multiplicativity, Fourier decay for bounded variation, the sine and Dirichlet
integral, and the series `ζ²/ζ(2s)`, `ζ/ζ(2s)`, `ζ(2s)/ζ`, `ζ(s−1)/ζ`, `ζ³/ζ(2s)`. This run re-read,
at their heads and in the board's packages, every roadmap that became earlier with the new position:
- ArithmeticDirichletSeriesPartII;
- ExplicitZetaBounds, ExplicitPrimeCounting, ExplicitMultiplicativeFunctions and
  ExplicitNumberFields;
- ExplicitCharacterSumsAndSieves, ComputationalNumberTheory and EffectiveClassNumbers;
- AnalyticNumberTheoryPartII, ProbabilisticAndMetricNumberTheory and SieveMethodsAndPrimePatterns.

Findings:

- **ArithmeticDirichletSeriesPartII §5.1** owns the series of `ζ^k`, `k ∈ ℕ`. Removed here and cited
  (item 12).
- **ProbabilisticAndMetricNumberTheory §0.1a** owns complete additivity, `powOfAdditive` and the
  multiplicativity of `2^ω`. Cited (item 15). It has no complete-multiplicativity predicate, so 11.1
  stays.
- **ExplicitZetaBounds** uses Borel–Carathéodory only as a route, through Mathlib's
  `Complex.borelCaratheodory` (§§7.10, 4.8). Its §6.1 (smoothed truncated Perron with explicit error)
  and §7.1 (global partial-fraction identities) are different objects from 7.3 and 8.3. It has no
  Landau local lemma, no rectangle residue theorem and no Mellin convolution.
- **ExplicitPrimeCounting** §2.1 and §3.1 are related variants of 9.2 and 10.2 (item 14). Its §1.4
  and Layer 7 are the instances of 13.2's hypothesis (item 16). It has no Goldbach proposition.
- **ExplicitMultiplicativeFunctions** uses Borel–Carathéodory as a route and the series of `2^ω/n`
  in an Example only. **ExplicitNumberFields**, **ExplicitCharacterSumsAndSieves**,
  **ComputationalNumberTheory** and **EffectiveClassNumbers** share no object with this roadmap.
  - EffectiveClassNumbers §1.3, the kernels `x^{−a}(log 1/x)^{m−1}/(m−1)!`, are iterated Mellin
    convolutions of `1_(0,1]`, not a general Mellin convolution.
  - EffectiveClassNumbers' contour identity uses Tau Ceti's null-homologous residue theorem, not a
    rectangle theorem.
- **AnalyticNumberTheoryPartI** (earlier): settled at the design stage. §§0.33a and 3.24a are the
  `K = ℚ` and `α = β = 0` instances of 10.3 and 11.3 (consumed). §0.30a gives instances of 8.3
  (Check, Scope clause). §§3.3–3.4 give `d_n` (Check). All ids were re-checked at its head.
- **AnalyticNumberTheoryPartII**, **SieveMethodsAndPrimePatterns**: no shared object. Sieve has
  Goldbach upper bounds and Chen's theorem, not range propositions.
  CircleMethodThreePrimes, a new-roadmap pull request not in the merge order, excludes the numerical
  ternary Goldbach problem from its scope.
- **ZerosOfLFunctions** (main): §7.2 is a distinct object (Scope clause), and it has no local
  logarithmic-derivative lemma.
- **Mathlib and Tau Ceti at the pins** (unchanged since the earlier attempt):
  - none of: Mellin convolution, complete-multiplicativity predicate on `ArithmeticFunction`,
    Cesàro Tauberian theorem, rectangle residue theorem, derivative Borel–Carathéodory, bounded
    variation Fourier decay, or the series of `σ_ν`, `d_z`, `2^ω`, `μ²`, `λ`, `φ`;
  - Tau Ceti's sine-integral file
    (`TauCeti/Analysis/Contour/WorkedExamples/HalfDisc/SineIntegral.lean`) has the limits
    (`tendsto_integral_sin_div_atTop` and variants) and no uniform bound, so 7.2 stands.

Removals in this package: the 11.2 claim on the series of `ζ^k`, and the Downstream entries naming
earlier roadmaps as consumers (items 12–13). No Lean declaration is removed:
`LSeries_generalizedDivisor` is the complex-`z` statement, which no other roadmap states.

Ownership against open pull requests was checked with `roadmaps grep`, `roadmaps show` and
`scratch/overlaps.md`. No pull request changes this roadmap, and no cited id is dropped or defined
only by an open revision. Every cited section was found at the head or on main:
- ArithmeticDirichletSeriesPartII §§0.1, 3.2, 5.1;
- ProbabilisticAndMetricNumberTheory §0.1a;
- ExplicitPrimeCounting §§1.4, 2.1, 3.1, 3.6, 7.1, Layer 7;
- ExplicitZetaBounds §6.1, Layer 7, §7.6;
- AsymptoticExpansions §8.2 and SpecialFunctionsEiLiErfIncompleteGamma Layer 9;
- Part I §§0.11c, 0.30a, 0.33, 0.33a, 1.2a, 3.1, 3.3, 3.4, 3.22, 3.24a;
- on main: ZerosOfLFunctions §§3.4, 4.3, 6.2–6.5, 7.1, 7.2, 8.5, 8.6; LFunctions Layers 3, 5, 7;
  ArithmeticDirichletSeries 0.2, 6.3, 6.4, Layers 6, 9, 10; ContourIntegration Layers 2–4;
  TauberianBoundaryConvergence N1–N2; ToeplitzOperators T1.

`roadmaps resolve` on the final README: no cross-roadmap citation and no Lean name found nowhere.
No declaration of `Suggested.lean` reuses a fully qualified name of another roadmap: all live in
`TauCetiRoadmap.AnalyticNumberTheoryPartIII`.

## Adversarial pass

The values come from pure-Python numerics and hand computation:
- `scratch/adv.py` from the earlier attempt, re-run in this run, reproduces its recorded output
  identically;
- this run's `scratch/run3/adv3.py` and `scratch/run3/ffc.py` add the new values.

The rows marked † were added or recomputed in this run.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Convention `𝓕` | `1_[0,1]`, `ξ = 1/2` | `(1 − e^{−πi})/(πi) = −0.63662i = −2i/π` | witness holds | none |
| 7.1 decay | `1_[0,1]`, `ξ = 1/2`; `ξ = 0`; `1_[0,∞)` | `0.636620 = 2/π = V/(2π·½)`; `1 > V/0 = 0`; `V = 1`, limit `1`, not integrable | sharp; `ξ ≠ 0`, integrability needed | none |
| 7.1 derivative BV | tent, `ξ = 1/2` | `(2/π)² = 0.405285 = 4/(2π·½)²` | sharp | none |
| 7.1 `C²` form | `1/(1+t²)`, `A = 2` | `max|6t²−2|/(1+t²)² = 2` at `t = 0`; `π ≤ 2(π + 1/(4π)) = 6.44` | holds | none |
| 7.2 | `x = π, 2π, −1` | `I(π) = 1.851937`; `π/2 − I(π) = −0.281141` vs `2/π = 0.636620`; `|π/2 − I(2π)| = 0.152645 ≤ 0.318310`; `π/2 − I(−1) = 2.516879 > −2` | holds for `x > 0` only | none |
| 7.3b Mellin inversion | `1_(0,1]`, `σ = 1`, `x₀ = 1`, `T = 1, 10, 1000`; `σ = 0` | `0.250000, 0.468274, 0.499682 = arctan(T)/π → 1/2`; at `σ = 0` mellin is junk `0`, integral `0 ≠ 1/2` | holds; Mellin convergence needed | none |
| 7.3b route† | `g(u) = f(e^{−u})`, `u₀ = −log x₀` | `t^{s−1}dt = e^{−su}du`, so `mellin f = G`; `x₀^{−s} = e^{su₀}`; `g(u₀±) = f(x₀∓)` | mean unchanged | none |
| 7.3c windowed error | `h = e^{−σu}1_{u≥0}`, `(σ,T) = (1,10), (10,1), (1000,1)` | errors `0.031726, 0.468274, 0.499682`; `min_δ(σδ + 2/(Tδ)) = 0.894428, 8.944278, 89.442782`; ratios `0.0355, 0.0524, 0.0056` | holds with `C ≥ 0.06` | none |
| 7.3c without BV | `sin(T₀v)1_[δ,2δ]` | tail `→ log 2/(2π) = 0.1103` vs `1/T₀ → 0` | rate needs BV | none |
| 8.1 residue theorem | `1/s`, `1/(s − 2)`, `1/s²` on `[−1,1]²`; `exp(1/s)` | edges `1.570796i, −1.570796i, 1.570796, −1.570796`; expression `6.283185i = 2πi`; `7.8·10⁻¹⁶`; `1.1·10⁻¹⁶`; essential singularity: residue junk `0` vs integral `2πi` | holds; meromorphy needed | none |
| 8.1 U-form sign | `1/s`, `T = 1` | `left + (top − bottom)/i + 2π = 1.570796 = right` | top minus bottom over `i` | none |
| 8.2† | extremal `−2Mw/(R − w)`, `M = R = 1`, `r = 1/2`, `k = 1,2,3`; `f ≡ i`, `k = 0`; general `z` | `8, 32, 192` both sides; `max Re f` on `|w| = 0.999` is `0.999500 < 1`; `|i| ≤ 0` false; `Σ_{m≥0}(m+k)!/m! (r/R)^m = k!(1 − r/R)^{−k−1}` gives exactly `2k!R(M − Re a₀)/(R − r)^{k+1}` | sharp for `k ≥ 1` | none |
| 8.3 Landau† | `(z − 3/10)e^{2z}`, `z₀ = 0`, `R = 1`, `r₁ = 1/4`, `r₂ = 1/2`; `f = z − ρ`, `|ρ − z₀| ≤ r₂R`; `ρ` just outside; `M = 0` | `M = 2.847298`, left side `2`; `f = z − ρ`: left `0`, right `C·log((R + |ρ−z₀|)/|ρ−z₀|) > 0`; outside: left `≤ 1/((r₂ − r₁)R)`, `M ≥ log 2` | holds | Check "both sides are 0" corrected |
| 8.3 vs Part I §0.30a | `(s − 1)ζ(s)` on `|s − s₀| ≤ r′ + 1` | `M = O(log(|Im s₀| + 2))`, `logDeriv(s − 1) = 1/(s − 1)` | agrees | none |
| 9.2 | `(x−1)²(2−x)²1_[1,2]` | `dx/x` mass `0.0225887 = 4 log 2 − 11/4`; `dx` mass `0.0333333`; `mellin ν 1 = 1/30 = −mellin ν′ 2` | holds | none |
| 9.2 vs ExplicitPrimeCounting §2.1† | `C²` bump | `tν′` is `C¹`, so of bounded variation: both give `|s|^{−2}` on `0 ≤ Re s ≤ 1`; 9.2 also gives `k ≥ 3` and every strip | distinct statements, no conflict | Scope clause added |
| 9.3 | `|mellin ν ε − 1|` at `ε = 1/2` | `0.078320 ≤ 2ε log 2 = 0.693147` | holds | none |
| 9.4 transform | non-symmetric `ν ∝ (x−½)²(2−x)²`, `ε = 1/2`, `s = 1.3 + 2i` | both sides `0.307724 − 0.328529i`; `1̃_ε(1) = 0.706468`, `1̃_ε(2^{−ε}) = 1`, `1̃_ε(2^{ε}) = 0` | holds for every `ε > 0` | none |
| 9.4 decay | `s = 1 + iT`, `k = 1` | `≍ 1/(T(1 + εT))`, uniform since `Re(εs) ∈ (0, σ₂]` | holds | none |
| 10.1 identity | `a = δ₁` | both sides `1̃_ε(1/X)`; `x^{−s}` at `x = 1/X` is `X^s` | holds | none |
| 10.1 comparison | `a ≡ 1`, `X = 2`, `ε ≤ log₂(3/2)` | `Σ_{n≤2} 1 = 2` vs `1 + 1/2 + 0`, difference `1/2`, while `2Cε → 0` | `+1` needed | none |
| 10.2 exponent | `η = 1/log t`, `log x = 100`; `η ≡ 1/4` | `20.000000`; `26.098612 = 25 + log 3` | witness holds | none |
| 10.2 transfer | `A = 0`; steep `η`; rectangle in `R_η` | constant width gives `ω ≥ η₀ log x`; `η(T)` choice saving `→ 1`, `η(T + 3)` choice saves `1/T`; `|Im s| ≤ T` gives `η(|Im s| + 3) ≥ η(T + 3)` | holds | none |
| 10.2 constants sentence† | Platt–Trudgian lines 21–32, 54–56 | Ingham `(1 − ε)/2`, Pintz deletes the `1/2` | earlier sentence misattributed density input | sentence corrected |
| 10.2 VK-shape width† | `η = c(log t)^{−2/3}(log log t)^{−1/3}` | `≥ c(log t)^{−1}` for `t ≥ 3` (since `log log t ≤ log t`), nonincreasing for `t > e`, value `2.06c` at `t = 3` | meets the hypotheses with `A = 1` | Downstream sentence |
| 10.3 | `K = ℚ`, `χ = 1` vs Part I §0.33a; trivial character mod `2`; residue sign; exceptional zero | region inside Part I's; `G` shifts by `−(log 2)2^{−s}/(1 − 2^{−s})`; `−ζ′/ζ` residue `+1`; `β < 1` fixed, so `c` can be shrunk to miss it | holds | none |
| 11.1† | `λ(4) = λ(2)²`, `λ(12) = λ(4)λ(3)`; `μ(4)`; `2^Ω`, `2^ω` at `4` | `1 = 1`, `−1 = −1`; `0 ≠ 1`; `2^{Ω(4)} = 4 = (2^{Ω(2)})²`, `2^{ω(4)} = 2 ≠ 4` | holds | Check added |
| 11.2 `σ_ν` | `σ₁(6)`, `σ_{−1}(6)`, `σ_{1/2}(4)`; `Σ σ(n)/n³` | `12`, `2`, `4.414214 = 3 + √2`; `1.976756` (`n < 3000`) vs `1.977304` | holds | none |
| 11.2 abscissa | `ν = 2, −2, it` | `3`; `1`; `1` via `|1 + p^{it}| ≥ 1 + cos(t log p)` | holds | none |
| 11.2 `d_z` | `multichoose(1/2, 2)`, `(3, 2)`, `(−1, a)`; `Σ d_{1/2}(n)/n²`; `Σ d_i(n)/n³` | `0.375`, `6`, `1, −1, 0, 0`; `1.282541` vs `√ζ(2) = 1.282550`; `0.983113 + 0.182997i` vs `exp(i log ζ(3))` | holds | none |
| 11.2 `z = k` vs ArithmeticDirichletSeriesPartII §5.1† | `k = 2`, `s = 2`; `Ring.choose` model | `Σ_{n≤2·10⁵} τ(n)/n² = 2.705736`, tail `≈ 7.2·10⁻⁵`, `ζ(2)² = 2.705808`; `multichoose(2,2) = 3 = τ(p²)`, `choose(2,2) = 1` | agrees; choose model excluded | Check added |
| 11.3 Ramanujan | `(α,β,s) = (1, ½, 3.5)`; `(0.3+i, −0.2+0.5i, 2.6+i)`; `τ(n²)` at `3`; boundary `α = 2, s = 3` | `2.913950` (`n < 4000`) vs `2.915217`; `2.485553 − 0.364624i` vs `2.485612 − 0.364635i`; `1.707287` vs `1.707291`; `Σ_p 2(p²+1)/p³ = ∞` | holds; half-plane needed | none |
| 11.4 | `s = 3` (`φ` at `4`); `μ²(12)`; `φ` at `σ = 2` | `1.420308`, `1.181565`, `0.846335`, `1.110627` on both sides; `0 = 0`; `Σ_p (p−1)/p² = ∞` | holds; abscissa of `φ` is `2` | none |
| 12.1† | `(−1)^n`, `N = 2000`; `a ≡ 1`; `n = 0` term; `(−1)^n/√n` | mean `0.5`, `S_1999 = 1`, `S_2000 = 0`; means diverge; `K ≥ 0` forced; `a_0` junk `1/√0 = 0` in Lean | hypotheses necessary as stated | `a_0 = 0` made explicit |
| 13.1† | `(B,n) = (16,4), (4,4)`; `n = 0, 1`; `n = 5..10` | `2`, `3`; `0, 0`; `ffc(n,n) = 4,4,5,6,7,7` vs `log n!/log n = 2.97, 3.67, 4.38, 5.10, 5.83, 6.56`; `ffc(n²,n) = 2,2,3,3,3,4` | consistent with the lower bound | `2.98` → `2.97` |
| 13.2 | `Even(30)`, `Odd(33)`, `Odd(56)`, `Odd(9)`; `2`, `5`; Bertrand transfer `Δ = 2`, `x₀ = 5` | all `True` by search; `2`, `5` not sums; `(30 − 4)·2 + 4 = 56` | holds | none |
| 13.2 transfer proof† | odd `n ∈ (x₀ + 4, (H − 4)Δ + 4]`, `x = n − 4` | `p > x₀(1 − 1/Δ) ≥ 2` so `p` odd; `4 ≤ n − p < 4 + (n − 4)/Δ ≤ H` | holds | none |
| 13.2 Schoenfeld instance† | `Δ = 16598`, `x₀ = 2 010 882` | `y = x₀(1 − 1/Δ) = 2 010 760.85 > 2 010 759.9`; threshold `2 010 881.05`; `y + y/16597 = x`; result `(4·10¹⁸ − 4)·16598 + 4 = 66 391 999 999 999 999 933 612 ≈ 6.639·10²²` | holds | Example added |

Context (variables in scope): `Suggested.lean` has no `variable` block; every binder is in its
declaration's signature.

## `#check` comparison

`#check @name` for all 32 declarations was elaborated in one scratch file
(`scratch/run3/CheckSuggested.lean`, a copy of `Suggested.lean` with the checks appended). Each
elaborated type was compared with its README statement: hypotheses, quantifier order and casts. The
quantifier order is:
- `∃ C` before the data in 7.3c, 8.3 and the 9.4 decay bound;
- `∃ c, C′` after the data in 10.2;
- `∃ c, C, U, G` after `χ` in 10.3.

The 32 elaborated types are textually identical to those of the earlier attempt. The only file change
in this run is a docstring, and no hypothesis silently disappeared. The same file also pinned
`Ring.choose`, `Ring.multichoose` and `riemannZeta_eq_exp_LSeries`, which the new 11.2 Check names:
all three elaborate at the pin, and the last has exactly the cast form
`↑(ArithmeticFunction.vonMangoldt n) / ↑(Real.log ↑n)` used in `LSeries_generalizedDivisor`. A
script over the README found:
- every backticked name whose stem is a declaration of `Suggested.lean` is declared there;
- every declaration appears in the README;
- neither *mellinConv* nor *IsCompletelyMultiplicative* is backticked.

## Elaboration

`lake env lean` on the package copy of `Suggested.lean`, run from the content checkout: exit 0 and
exactly **24** warnings, one per theorem, each of the form
``Suggested.lean:58:8: warning: declaration uses `sorry` ``. There were no other messages.

The file:
- starts with `module`, then `import Mathlib` and the two Tau Ceti modules
  `TauCeti.Analysis.Contour.Residue.Basic` and `TauCeti.NumberTheory.LFunctions.Hecke.Basic`;
- contains no `set_option`, `lemma`, `#eval`, `#print` or `#synth`;
- has 373 lines.

## Dependency check

The command of the brief, on the final README:

    depcheck: 238 roadmaps, 2347 edges, 0 problem(s)

No UPWARD, CYCLE, `moved:` or NOT IN ORDER line.

The same check in candidate form, on a copy of the merge order without this roadmap's line, places it
where it now stands:

    candidate: AnalyticNumberTheoryPartIII is not in the merge order yet; checked as if placed after ExplicitPrimeCounting (the intake inserts it when its design is accepted)
    depcheck: 238 roadmaps, 2347 edges, 0 problem(s)

The latest supplier is ExplicitPrimeCounting (line 269). This roadmap is at line 273, so no line
moves. The merge-order file was not edited.

## For the maintainer

- `design/plan.json` still lists the explicit roadmaps and ArithmeticDirichletSeriesPartII under
  `consumers`. All of them now precede this roadmap. This job may change only `gaps`, so the field
  is stale and the README is authoritative.
- The suppliers that are still new-roadmap pull requests are all earlier in the merge order:
  AnalyticNumberTheoryPartI, ProbabilisticAndMetricNumberTheory, ArithmeticDirichletSeriesPartII and
  ExplicitPrimeCounting. They are supplier relations, not revision dependencies, and no cited id is
  defined only by an open revision.
- ArithmeticDirichletSeriesPartII §5.1 keeps the ζ^k series. The earlier note asking it to cite 11.2
  is withdrawn.
- No suspicious instruction was found in the review, the fix report, the fetched roadmaps or the
  cached sources.
