# PORT-AnalyticNumberTheoryPartIII

- Branch: `roadmap/analytic-number-theory-part-iii`, created from main at `54fc140`.
- Head commit: `907d9b6`, "AnalyticNumberTheoryPartIII: roadmap (README, Suggested.lean, metadata)".
- Files: `TauCetiRoadmap/AnalyticNumberTheoryPartIII/{README.md,Suggested.lean,metadata.toml}`.
  Nothing outside the folder was touched.

## Checks

- Build (`lake build TauCetiRoadmap.AnalyticNumberTheoryPartIII.Suggested`):
  `Build completed successfully (18490 jobs).` There are 24 warnings, all `declaration uses sorry`
  (lines 58, 69, 82, 98, 113, 125, 151, 160, 173, 194, 215, 243, 249, 258, 266, 274, 285, 296, 302,
  314, 324, 342, 349 and 367). There is no other warning and no error.
- Gate, run on the committed tree:
  `gate AnalyticNumberTheoryPartIII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- Dependency direction (`gate --depcheck … --movable`), full output:
  `depcheck: 238 roadmaps, 2349 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.
- Citation resolver on the ported README: no cross-roadmap citation and no Lean name found
  nowhere. It checked against main `7bf4638`, which is newer than the worktree base `54fc140`. The
  three cited roadmaps on main (ZerosOfLFunctions, LFunctions, TauberianBoundaryConvergence) are
  byte-identical between the two. The completed ArithmeticDirichletSeries and ContourIntegration
  are cited by layer and item, and both resolve.
- Mechanical signature check. I appended `#check @name` for all 32 declarations of
  `Suggested.lean`, and for all 86 Mathlib and Tau Ceti names the README cites, to a temporary copy
  of the file. I added the eight Tau Ceti modules those names need, all with object files at the
  pin, and built it once. Every name elaborates. `#synth BinomialRing ℂ` returns
  `instBinomialRingOfModuleNNRat`, so `Ring.multichoose` on `ℂ` is the Mathlib instance. The file
  has no `variable` block, so no binder can be lost. I compared each elaborated type with its
  README statement and they agree. Examples:
  - `LSeries_generalizedDivisor` uses the same function `fun n ↦ ↑(Λ n) / ↑(Real.log ↑n)` as
    Mathlib's `riemannZeta_eq_exp_LSeries`.
  - `smoothedSum_eq_mellinInv` carries `ContDiff ℝ ↑k ν` with `1 ≤ k`.
  - `norm_logDeriv_sub_sum_zeros_le` puts `∃ C` after `r₁, r₂` only.

  Nothing changed as a result. The temporary copy was then replaced by the committed file, which
  is byte-identical to the package's `Suggested.lean`.

## Draft pull request body

Analytic number theory, Part III builds the general analytic machinery that turns a zero-free
region into an error term for a prime sum, and the Dirichlet series of the classical arithmetic
functions. It starts from Mathlib's Fourier and Mellin transforms, `LSeries` and
`ArithmeticFunction`, and from Tau Ceti's residue calculus, its one-dimensional bounded-variation
measures and its presented Hecke `L`-functions. It proves, in order:
- Fourier decay for integrable functions of bounded variation, and principal-value Mellin
  inversion on vertical lines with a quantitative window (Layer 7);
- the residue theorem on a rectangle in Mathlib's four-edge form, the derivative form of
  Borel–Carathéodory, and Landau's local logarithmic-derivative lemma for any holomorphic function
  on a disc (Layer 8);
- Mellin convolution, delta spikes for `dx/x` and smoothed cutoffs (Layer 9);
- the smoothed sum of a Dirichlet series as an inverse Mellin integral, an Ingham-type transfer
  theorem, and the classical bound `L′/L ≪ log(|t| + 3)` in a de la Vallée Poussin region for the
  Hecke `L`-function of every ray class character of every number field (Layer 10). The transfer
  theorem takes a zero-free region of width `η(t)` with polylogarithmic growth to the error
  `x exp(−c ω_η(x))` for any Dirichlet series with a pole at `1`;
- `σ_ν` and `d_z` with complex parameter, Ramanujan's four-shift identity, and the series of `2^ω`,
  `μ²`, `λ` and `φ` with their exact abscissas of absolute convergence (Layer 11);
- the Hardy–Landau Tauberian theorem for Cesàro means (Layer 12);
- the asymptotics of Erdős problem 392, and a transfer of verified Goldbach ranges along
  short-interval primes (Layer 13).

Parts I and II of the series use contour shifts, smoothing and logarithmic-derivative bounds only
as local steps for `ζ` and Dirichlet characters. This part states them once, as general theorems
with their own hypotheses, so that every later consumer can cite them. Its `Suggested.lean` states
all 24 headline theorems, with the eight small definitions they need, against the pinned Mathlib
and Tau Ceti.

## Dependencies that are still pull requests

- AnalyticNumberTheoryPartI: §§0.30a, 0.33a, 3.3, 3.4 and 3.24a are consumed as Checks of 8.3,
  10.3, 11.2 and 11.3. §§0.11c and 1.2a are named in Scope. All of them resolve at its head.
- ProbabilisticAndMetricNumberTheory, §0.1a. This is a supplier: 11.4 uses the multiplicativity
  of `2^ω`, and 11.1 uses `2^Ω` and `2^ω` as Checks.
- ArithmeticDirichletSeriesPartII: §5.1 is a Check of 11.2; §§0.1 and 3.2 are named in Scope.
- ExplicitPrimeCounting: §7.1 is used in an Example of Layer 13; §§1.4, 2.1, 3.1 and 3.6 and
  Layer 7 are named in Scope.
- ExplicitZetaBounds: §6.1, Layer 7 and §7.6 are named in Scope only.

Two more roadmaps are named in "Not owned here" and are not suppliers. Both are open pull requests
by another author and are not in the merge order: AsymptoticExpansions §8.2 and
SpecialFunctionsEiLiErfIncompleteGamma Layer 9. No cited id is defined only by an open revision.
`overlaps.md` reports no open pull request that changes this roadmap and no dropped id.

## What moved from the Lean to the README

Nothing. The package's `Suggested.lean` already met the rules, so the committed file is the package
file byte for byte:
- 24 headline theorems, and 8 definitions with real bodies, each used by a headline;
- no padding, no sorry'd data, no `set_option`, no `lemma`;
- `import Mathlib` followed by the two Tau Ceti modules it uses (`TauCeti.Analysis.Contour.Residue.Basic`
  and `TauCeti.NumberTheory.LFunctions.Hecke.Basic`).

I tried removing the leading `module` keyword so that the file would match ZerosOfLFunctions and
LFunctions on main. The build then emitted a second kind of warning ("imports `Mathlib` … consider
adding `module`"), so I restored the keyword. The README targets that are not stated in Lean
remain in the README, as in the package: 7.2, 9.1–9.3, 11.1, the comparison of 10.1, the `τ(n²)`
corollary of 11.3 and the elementary Goldbach transfers.

## Supplier replacements and duplication removals

None was needed.
- **Pins.** I grepped the pinned Mathlib and Tau Ceti for each headline object. None exists:
  - Fourier decay through `eVariationOn`: Tau Ceti's `Analysis/Fourier/Decay.lean` covers only
    smooth compactly supported functions and Fourier coefficients;
  - a rectangle residue theorem: Tau Ceti uses `Complex.integral_boundary_rect_eq_zero_of_differentiableOn`
    only as Cauchy's theorem (in Perron estimates, removability and strip shifts) and has no
    residue form;
  - the derivative Borel–Carathéodory: Mathlib has only `Complex.borelCaratheodory` and
    `Complex.borelCaratheodory_zero`;
  - Landau's local lemma, Mellin convolution, the Dirichlet kernel, and a completely
    multiplicative predicate on `ArithmeticFunction` (Mathlib's `CompletelyMultiplicative` is a
    section of `EulerProduct/Basic.lean` about `ℕ →*₀ F`);
  - `σ_ν` for complex `ν`, `d_z`, and the `LSeries` of `σ_k`, `φ`, `λ`, `μ²` and `2^ω`;
  - a Cesàro Tauberian theorem (only `Filter.Tendsto.cesaro` and `cesaro_smul`), Goldbach, and
    factorial factorizations.
- **Roadmaps.** I ran `roadmaps grep` over main and all 466 open heads, by object: Mellin
  convolution, smoothed cutoffs and delta spikes, Hardy–Landau and Cesàro, Erdős 392 and factorial
  factorizations, Goldbach, Borel–Carathéodory, Landau's lemma, the rectangle residue theorem,
  bounded variation with Fourier, Ramanujan's identity, generalized divisor and `multichoose`,
  complete multiplicativity, Ingham, and the series `ζ(s−1)/ζ(s)`, `ζ(2s)/ζ(s)` and
  `ζ(s)²/ζ(2s)`. Every hit is a route mention, an instance, or a different object:
  - Part I §0.30a runs the nested-disc argument for `ζ` and Dirichlet `L`-functions only;
  - ExplicitZetaBounds §6.1 is a sharp-cutoff Perron formula with numerical errors, and its
    "Ingham" hit is a zero-density route;
  - ExplicitMultiplicativeFunctions uses `τ_k = ζ^{⋆k}` and the explicit averages, and owns none
    of the Layer 11 series;
  - ProbabilisticAndMetricNumberTheory §0.1a defines `IsCompletelyAdditive`, but no completely
    multiplicative predicate;
  - SieveMethodsAndPrimePatterns and CircleMethodThreePrimes treat Goldbach-type sieves and the
    three-primes theorem, not the finite-range propositions.
- **Board.** The board package `AnalyticNumberTheory`, earlier in the merge order, is an index of
  Parts I and II and owns no target.

This roadmap owns these objects because no roadmap earlier in the order states them. Its generality
is the one later consumers need: arbitrary bumps, widths and Dirichlet series, every number field
and ray class character, and complex `ν, z, α, β`.

## README fixes

The fixes a reviewer would flag, each now in the README:

1. Process wording, in two places.
   - Supplier contracts: "exists at the pins or is a section of a roadmap on main or earlier in the
     merge order; this roadmap declares no supplier gap" → "is a declaration of the pinned Mathlib
     or Tau Ceti or a section of one of the roadmaps named in this section".
   - Not owned here: "These roadmaps precede this one in the merge order and prove…" → "Those
     roadmaps prove…".
2. Missing witnesses. Seven conventions had no computed witness for their normalisation; each
   now has one:
   - two-sided Laplace transform: `f = 1_(0,1]` gives `g = 1_[0,∞)` and `G(2) = 1/2 = mellin 1_(0,1] 2`,
     while the opposite substitution `u = log t` gives a divergent integral;
   - one-sided limits and variation: for `1_(0,1]` at `1`, `leftLim = 1`, `rightLim = 0`, and the
     variation is `2`;
   - `LSeries` totality: `LSeries 1 2 = π²/6`, and `LSeries 1 1 = 0` as a junk value;
   - complex powers: `4^{1/2} = 2`, so `σ_{1/2}(4) = 1 + √2 + 2`;
   - the Euler-product logarithm at `s = 2`: `log(π²/6) ≈ 0.49770`;
   - cutoffs and Cesàro means: `Σ_{n≤2} 1 = 2`, and for `(−1)^i`, `S_0, S_1, S_2 = 0, 1, 0` with
     mean `1/2` at `N = 2`;
   - ray class characters: at `K = ℚ`, `𝔪 = 1`, `χ = 1`, the `L`-function agrees with
     `riemannZeta` off `1`, and the residue of `−L′/L` is `+1`.
3. An imprecise identification. 10.3 said that for `K = ℚ` the presented `L`-function "is
   `riemannZeta`". At the pin, `heckeLFunctionC` is the meromorphic normal-form continuation
   (`TauCeti/NumberTheory/LFunctions/Hecke/Basic.lean`, the docstring of `heckeLFunctionC`). It
   therefore agrees with `riemannZeta` only on `ℂ ∖ {1}`; Mathlib gives `riemannZeta 1` a finite
   conventional value. The text now says so, in 10.3 and in Conventions.

The review's one finding (R01, the opposite-normalisation Check of 9.4) was already repaired in the
package. I recomputed the repaired Check; its values are in the table below.

## Adversarial mathematics pass

The values were computed in scratch scripts: Simpson quadrature, Euler–Maclaurin `ζ`, sieves, and
exhaustive search over divisors.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Fourier convention | `𝓕1_[0,1](1/2)` | `−0.636620i = −2i/π` | holds | none |
| Mellin convention | `mellin 1_(0,1] 2` | `0.5000000` | holds | none |
| Laplace convention | `g = 1_[0,∞)`, `s = 2`; `u = log t` | `G(2) = 1/2 = mellin 1_(0,1] 2`; other direction `∫_{−∞}^0 e^{−2u}` diverges | holds | witness added |
| Truncation witness, 7.3 Perron instance | `F = 1/s`, `x = 1`, `σ = 1`, `T = 10` | `π⁻¹ arctan 10 = 0.468274`; limit `1/2` = mean of `1, 0` | holds | none |
| 7.1 `‖𝓕f(ξ)‖ ≤ V/(2π|ξ|)` | `1_[0,1]`, `ξ = 1/2`; `ξ = 0`; `1_[0,∞)` | `0.636620 = 0.636620` (sharp); `V/(4π·½) = 0.318310 < 0.636620`; at `ξ = 0` the right side is junk `0` and the left `1`; `1_[0,∞)` is not integrable and its limit is `1` | holds; `ξ ≠ 0` and integrability needed | none |
| 7.1 derivative form | tent, `ξ = 1/2`; `ξ = 0` | `0.405285 = V₁/(2πξ)² = 0.405285`; `1 ≤ 1 + 1/π²` | holds, sharp | none |
| 7.1 `C²` form | `1/(1+t²)`, `A = 2` | `max |f″|(1+t²) = 2.0000` on `[−10,10]`; `π = 3.1416 ≤ 2(π + 1/4π) = 6.4423` | holds | none |
| 7.2 Dirichlet-integral bounds | `x = π, 2π, −1`; grid `(0, 60]` | `Si(π) = 1.851937`, `π/2 − Si(π) = −0.281141`, `2/π = 0.636620`; `Si(2π) = 1.418152`, gap `0.152645 ≤ 1/π = 0.318310`; `π/2 − Si(−1) = 2.51688 > −2`; on the grid `max(|Si| − Si(π)) ≤ 0` and `max(|π/2 − Si| − 2/x) ≤ 0` | holds; `x > 0` needed | none |
| 7.3 windowed error | `h = e^{−σu}1_{u≥0}`, `(σ,T) = (1,10),(10,1),(1000,1)`; tail counterexample `sin(T₀v)1_[1,2]` at `T₀ = 10², 10³, 10⁴` | errors `0.031726, 0.468274, 0.499682` against `min_δ(σδ + 2/(Tδ)) = 0.894428, 8.94428, 89.4428`; tail `0.109959, 0.110419, 0.110319 → log 2/2π = 0.110318` while `‖h‖₁/(T₀δ) → 0` | holds; global BV needed for the rate | none |
| 7.3 Mellin inversion | `1_(0,1]`, `σ = 0` | `mellin` is junk `0` on `Re s = 0` and the limit `0 ≠ 1/2` | `MellinConvergent` needed | none |
| 8.1 rectangle residue theorem | `1/s`, `1/(s−2)`, `1/s²` on `[−1,1]²`; `exp(1/s)` | edges `iπ/2, −iπ/2, π/2, −π/2`, expression `6.283185i = 2πi`; `1/(s−2)`: expression `≈ 0` (`|·| < 10⁻¹⁴`); `1/s²`: edges `−1, −1, 1, 1`, expression `0`; `exp(1/s)`: integral `6.283185i` with junk residue `0` | holds; meromorphy needed | none |
| 8.1 U-shaped form | `1/s`, `σ₁ = −1`, `σ₂ = 1`, `T = 1` | right `1.570796`; left + (top − bottom)/i + 2π `= 1.570796`; clockwise model `7.853982` | holds | none |
| 8.2 derivative Borel–Carathéodory | extremal `−2Mw/(R−w)`, `M = R = 1`, `r = ½`, `k = 1,2,3`; `Re f` on the disc | both sides `8, 32, 192`; `max Re f = 0.99950 < M = 1` on a 2880-point sample; source bound `128` against ours `8` | holds, sharp | none |
| 8.3 Landau's lemma | `(z − 0.3)e^{2z}`, `R = 1`, `r₁ = ¼`, `r₂ = ½`; `z − ρ` with `|ρ| = 0.51, 0.8, 1.0` | `max|f| = 5.172339`, `M = 2.847298`, left side `2.0000` at four admissible `z`; with an empty zero sum, `max|1/(z−ρ)|/M = 3.543, 2.242, 1.924 ≤ 1/((r₂−r₁) log 2) = 5.771` | holds; constant `C(r₁, r₂)` consistent | none |
| 9.1 Mellin convolution | `1_(0,1] ⋆ 1_(0,1]` at `e^{−1}`; `1_[1,2] ⋆ 1_[1,2]` at `2`; `x = 0` | `1.000000`; `0.693147 = log 2`; `(g⋆f)(0) = log 2`, `(f⋆g)(0) = 0` | holds; `x > 0` needed | none |
| 9.2 bump transforms | `(x−1)²(2−x)²`; `max(0,1−x)²` at `s = 1.5+0.7i`; sign at `k = 1` | `∫ν = 0.0333333`, `∫ν/x = 0.0225887 = 4 log 2 − 11/4`; `0.080331 − 0.102704i = 2/(s(s+1)(s+2))`; `−∫ν′x = 0.0333333 = mellin ν 1` | holds; support away from `0` needed | none |
| 9.3 delta spike | non-symmetric bump, `ε = ½`, `s = 1.3+2i`; `ε = 0.1, 0.5, 1` | `mellin ν_ε s = 1.057100 + 0.188361i = mellin ν(εs)`; mass `1.000000`; `|mellin ν ε − 1| = 0.0139, 0.0783, 0.1805 ≤ 2ε log 2 = 0.139, 0.693, 1.386` | holds | none |
| 9.4 cutoff transform and the R01 Check | `ν ∝ (x−½)²(2−x)²` (raw mass `0.2144194`), `s = 1.3+2i`, `ε = ½, ¼, 1/10, 1/20`; symmetric bump | direct `0.3077244 − 0.3285289i` = formula; correct side moduli `0.4501, 0.4361, 0.4263, 0.4228 → |1/s| = 0.4192`; wrong model `0.49617 + 0.09889i`, moduli `0.506, 0.762, 16.37, 1.91·10⁴`; cutoff at `1` is `0.706468` (non-symmetric) and `0.500000` (symmetric) | holds; R01 repair correct | none |
| 10.1 smoothed sum, the `+1` | `a ≡ 1`, `X = 2`, symmetric `ν`, `ε ≤ log₂(3/2)` | sharp `2`, smoothed `1 + ½ + 0`, difference `½`, while `CBεX log X = 2Cε → 0` | `+1` needed | none |
| 10.2 Ingham exponent | `η = 1/log t`, `log x = 100`; `η ≡ ¼` | `20.000000` at `log t = 10.0000`; `26.098612` at `t = 3` (`= 25 + log 3`) | holds | none |
| 10.2 transfer, steep width | `η = ½` on `[3, T₀]`, linear drop, `1/log² t`; `log x = 2 log T₀` | `ω ≥ log T₀`; choice by `η(T)` gives `T = T₀` and saving `exp(−2 log T₀/log²(T₀+3)) → 1`; choice by `η(T+3)` forces `T > T₀ − 3` and saving `1/T` | the route's `η(T+3)` is needed | none |
| 10.3 `L′/L` bound | `K = ℚ`, `χ = 1`; trivial character mod `2`; `δ_χ` | `L = (1 − 2^{−s})ζ`, residue of `L` at `1` is `½` but `δ_χ = 1`; `G` shifts by `−(log 2)2^{−s}/(1−2^{−s})`, bounded on `Re s ≥ ½`; at the pin `heckeLFunctionC` agrees with `riemannZeta` only off `1` | holds | wording fixed (fix 3) |
| 11.1 complete multiplicativity | `λ`, `μ`, `≡ 1 (4)` indicator, `2^Ω`, `2^ω`, `λ ⋆ μ²` | `λ(4) = 1`, `λ(12) = −1`; `μ(4) = 0 ≠ 1`; `f(65) = 1`, `f(15) = 0`; `2^{Ω(4)} = 4`, `2^{ω(4)} = 2 ≠ 4`; `(λ⋆μ²)(4) = 0 − 1 + 1 = 0` | holds | none |
| 11.2 `σ_ν` | `ν = 1, −1, ½`, `n = 6, 6, 4`; `Σσ(n)n^{−3}` | `12, 2, 4.414214 = 3 + √2`; partial sum to `2·10⁴` `1.977222` against `ζ(3)ζ(2) = 1.977304` | holds | none |
| 11.2 `d_z` | `multichoose(½,2)`, `(−1,1)`, `(−1,2)`, `(3,2)`; `Σd_{1/2}n^{−2}`, `Σd_i n^{−3}` to `2·10⁵`; `Ring.choose` model | `0.375, −1, 0, 6`; `1.2825491` against `√ζ(2) = 1.2825498`; `0.9831135 + 0.1829971i` against `exp(i log ζ(3)) = 0.9831135 + 0.1829971i`; `(d_{½}⋆d_{½})(p²) = 1`; `multichoose(2,2) = 3` against `choose(2,2) = 1` | holds | none |
| 11.3 Ramanujan | `α = 0.3+i`, `β = −0.2+0.5i`, `s = 2.6+i`; `Στ(n²)n^{−3}` | left side (`N = 6·10⁴`) `2.485611 − 0.364634i`, right side `2.485612 − 0.364635i`; `1.7072914` against `ζ(3)³/ζ(6) = 1.7072914` | holds | none |
| 11.4 four series | `s = 3`, and `s = 4` for `φ` | `1.4203083, 1.1815649, 0.8463352, 1.1106265` against `ζ(3)²/ζ(6)`, `ζ(3)/ζ(6)`, `ζ(6)/ζ(3)`, `ζ(3)/ζ(4)` (same to 9 places) | holds | none |
| 12.1 Hardy–Landau | `(−1)^n`, `N = 1000, 1001`; `(−1)^n/(n+1)`, `N = 2·10⁴` | `S_N = 0, 1`, means `0.5000, 0.4995`; `S_N = 0.693122`, mean `0.693122` against `log 2 = 0.693147` | the hypothesis excludes `(−1)^n` | none |
| 13.1 factorial factor count | `(16,4)`, `(4,4)`, `n = 0, 1`; `n = 5…10` with `B = n` and `B = n²`; `B = 4`, `n = 5` | `2, 3, 0, 0`; `4,4,5,6,7,7` and `2,2,3,3,3,4` by exhaustive search; lower bounds `2.97, 3.67, 4.38, 5.10, 5.83, 6.56` and `1.49, 1.84, 2.19, 2.55, 2.91, 3.28`; junk `0` | holds | none |
| 13.2 Goldbach ranges and transfer | even `≤ 30`, odd `≤ 33, 56, 9`; `2`, `5`; Schoenfeld `Δ = 16598`, `x₀ = 2 010 882` | all verified by search; `2` and `5` fail; `x₀(1 − 1/Δ) = 2 010 760.848 > 2 010 759.9`, `y + y/16597 = x₀` exactly; `(4·10¹⁸ − 4)·16598 + 4 = 6.6392·10²²`; the Helfgott–Platt bound has 31 digits, `8.8757·10³⁰` | holds | none |

## Unresolved, for the worker

- SpecialFunctionsEiLiErfIncompleteGamma Layer 9, an open new-roadmap pull request by another
  author that is not in the merge order, owns `Si` as an entire function. That includes its
  auxiliary functions `f, g` with their positivity (9.2), the remainder identities (9.4) and the
  first maximum at `π` (9.7). This roadmap's 7.2 states two elementary uniform bounds for the real
  integral `∫_0^x sin t/t dt` with their own proofs, and its Scope says how it differs. Because
  that roadmap is not earlier in the order, 7.2 cannot cite it as a supplier. If it enters the
  order before this one, 7.2 could become a citation of its 9.2 and 9.7.
- Several sources are settled as uncertified and are cited by chapter or equation locator only:
  `montgomeryvaughan2007`, `titchmarsh1986`, `iwanieckowalski2004`, `tenenbaum2015`,
  `apostol1976`, `katznelson2004` and `hardy1949`. `hardy1949` has a descriptive locator with no
  chapter number. The 12.1 statement is also sourced to the certified
  `estradavindas2012littlewood` at lines 32–35.
- Under `module`, with no `public section`, the declarations of `Suggested.lean` are private to
  the module. The file elaborates and nothing imports it. Making them public would need
  `public import` lines; the gate's import rule did not cover that, so I left the package's form.
- Ownership against open pull requests: I checked every open roadmap head through `roadmaps grep`
  (466 heads) and read the cited heads directly. No suspicious instruction was found in any
  untrusted text I read.


Pull request: #2008 (roadmap/analytic-number-theory-part-iii at 907d9b6)
