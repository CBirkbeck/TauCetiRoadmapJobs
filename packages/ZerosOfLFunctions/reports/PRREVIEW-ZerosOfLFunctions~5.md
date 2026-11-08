# Review of ZerosOfLFunctions (pull request #1913 at ccff63f)

**Verdict:** needs changes

Full review of `TauCetiRoadmap/ZerosOfLFunctions/` at `ccff63f8` against Mathlib `1b1ccf4b` and Tau Ceti
`2fd255d9` (the worktree's `lake-manifest.json`). The worker's gate passed every check at this head
(`depcheck=0`, `build=0`, `dropped=0`, `readme-ids-missing=0`); the depcheck result is a false negative
(R01). The sources service created `packages/ZerosOfLFunctions/sources.toml` on the board when I
fetched Trudgian and DLMF (records `trudgian2015`, `dlmf5`); this review edits no manifest, so the
worker may keep or drop those two records.

## R01 (P1) — The forms over `ℚ` consume AnalyticNumberTheoryPartI, a later roadmap that consumes this one

**Location.** `TauCetiRoadmap/ZerosOfLFunctions/README.md` lines 325–341 (the section "The exclusion
of Landau–Siegel zeros, consumed downstream" and its table "Form over `ℚ` | Input from
AnalyticNumberTheoryPartI"), lines 1132–1141 (6.3, "Every such zero has `(1 − β) log q ≥ c_LS`, by the
exclusion of Landau–Siegel zeros (AnalyticNumberTheoryPartI §0.34, consumed downstream)"), lines
1472–1476 (8.5), 1494–1499 (8.6, "AnalyticNumberTheoryPartI §0.18, consumed downstream"), 1584–1593
(8.7), 1643–1652 (8.8), 15–19, 88–94, 168–172, 1783–1786; `Suggested.lean` lines 26–30, 127–141,
215–229.

**Claim.** The README calls the input "not a supplier contract" (line 331) and says the forms over `ℚ`
are "proved after it"; the two Lean headlines `dirichletLFunction_zeroFreeRegion` (no exception, every
character) and `primeCounting_progression_effective` (uniform in every modulus) are stated as theorems
of this roadmap.

**Witness.** The merge order lists `ZerosOfLFunctions` at line 85 and `AnalyticNumberTheoryPartI` at
line 90 of `merge-order/ORDER.txt`, and the brief's list of roadmaps this one may consume does not
contain AnalyticNumberTheoryPartI. AnalyticNumberTheoryPartI at the head of its pull request consumes
this roadmap: its README line 13 says ZerosOfLFunctions "stand[s] before this part and keep[s] [its]
statements", its supplier table lists ZerosOfLFunctions 0.1–0.2, 1.2–1.4, 3.3–3.4, Layer 4, 5.2–5.7,
6.2–6.4, 7.4 and 8.2–8.8 (its lines 77–85), and its §0.34b (the Landau deduction) has `*Needs:*
… [ZerosOfLFunctions 6.4]` (its line 812), as do §0.34 itself (line 835), §0.1 (line 204), §0.9 (line
313) and §0.18 (line 562, through §0.1). So 6.3 (here) ← §0.34 ← §0.34b ← 6.4d (here): the two roadmaps
supply each other. The depcheck reports `0 problem(s)` only because the citation is spelled outside the
grammar it parses; on a scratch copy of the README with the heading at line 325 spelled `### From
TauCetiRoadmap.AnalyticNumberTheoryPartI` and `AnalyticNumberTheoryPartI §0.34` appended to the
`*Needs:*` line of 6.3, the same command prints

```text
UPWARD: ZerosOfLFunctions (on main) -> AnalyticNumberTheoryPartI (#89) at README lines [325, 335, 1145]
depcheck: 245 roadmaps, 2468 edges, 1 problem(s)
```

The proof routes of 6.3 (ℚ), 6.4 (ℚ), 8.6 (ℚ), 8.7 (uniform) and 8.8 (ℚ) have no input for the
exclusion other than that section, so within the supply this roadmap is allowed the two Lean headlines
have an unowned prerequisite: the acceptance test now states theorems the finished roadmap cannot
prove from its own layers and its suppliers. (The mathematics of the deduction is right, see the table
below; the defect is ownership and direction.)

**Repair.** Restore the folder as it is on main (6.3, 6.4, 8.5–8.8, Summary, Scope, Conventions,
"How to read the build", Layer 6 and 8 Examples and Dependencies, Downstream consumers, the three new
References, the module docstring, and the two Lean theorems in their fixed-modulus and
exceptional-zero forms). The exception-free forms over `ℚ` then live where
AnalyticNumberTheoryPartI already states them (R02). The alternative that keeps the intent of the
pull request, moving the exclusion down into this roadmap as an owned layer, is not a repair of this
folder alone: AnalyticNumberTheoryPartI §§0.34a–c rest on its §§0.11a–b, 0.12, 0.30 and 0.30a, all of
which would move with it, and that pull request would have to be rewritten to consume them from
here; it is a re-plan of that roadmap to be settled on its pull request, not by a revision of this
one.

## R02 (P2) — Two owners for the exception-free statements over `ℚ`

**Location.** `README.md` lines 1136–1141 ("this is `dirichletLFunction_zeroFreeRegion`, with an
effective absolute constant"), 1494–1497 (8.6 over `ℚ`), 1584–1586 ("this is
`primeCounting_progression_effective`"), 1643–1652; `Suggested.lean` lines 137–141 and 225–229.

**Claim.** This roadmap owns the region for Dirichlet L-functions without exception, `ψ(x, χ)` without
the exceptional term, the prime count in a progression uniform in the modulus, and abelian Chebotarev
over `ℚ` without exceptional term.

**Witness.** AnalyticNumberTheoryPartI at its head, README line 13: "the exception-free forms over `ℚ`
of ZerosOfLFunctions 6.3–6.4 and 8.6–8.8 … are stated in this part (§§0.1, 0.6, 0.9, 0.18, 0.32), where
later roadmaps consume them", repeated at its line 3187; its §0.1 `ExceptionalRealZero.empty` (line
190), §0.6 "no primitive Dirichlet character of modulus `q ≤ T` has a zero … `β > 1 − c/log T`"
(line 267), §0.18 the character estimate "without the term `−X^β/β`" (line 555), §0.32 the
progression count for `q ≤ (log x)^B` (line 784). The open consumers follow that ownership:
ExplicitPrimeCounting at #1945 cites this roadmap for "the zero-free regions with existential
constants and the exceptional-zero predicate (§§6.2–6.4)" and "the prime number theorem … and its
progression form (§§8.5, 8.7)" and AnalyticNumberTheoryPartI §0.34 for the exclusion (its README lines
141–144 and 165–171); ExplicitZetaBounds at #1954 and ExplicitNumberFields at #1944 do the same (their
lines 103–109 and 86–94).

**Repair.** One owner. Since the later roadmap is the one that can state them, delete the forms over
`ℚ` here (the revert of R01) and leave the "Downstream consumers" paragraph recording that
AnalyticNumberTheoryPartI proves the exclusion and the exception-free forms from Layers 0–8.

## R03 (P3) — Four Mathlib names in the supplier list do not resolve at the pin

**Location.** `README.md` lines 187, 191–193, 723, 730, 836, 998, 1001, 1006.

**Claim.** "From Mathlib" lists `Complex.PhragmenLindelof.vertical_strip`,
`multipliableLocallyUniformlyOn_one_add`, `Complex.multipliable_sineTerm` and `Complex.cot_series_rep`.

**Witness.** `#check` of each at the pin fails ("Unknown constant" or "Unknown identifier"). The pinned
declarations are `PhragmenLindelof.vertical_strip` (`Mathlib/Analysis/Complex/PhragmenLindelof.lean:275`,
inside `namespace PhragmenLindelof` opened at line 54, not under `Complex`);
`Summable.multipliableLocallyUniformlyOn_one_add`
(`Mathlib/Analysis/Normed/Module/MultipliableUniformlyOn.lean:137`, inside `namespace Summable`, lines
80–157); `multipliable_sineTerm` and `cot_series_rep` in the root namespace
(`Mathlib/Analysis/SpecialFunctions/Trigonometric/Cotangent.lean:98` and `:233`, a file with sections
and no namespace). These lines are unchanged from main, but they are in the reviewed folder.

**Repair.** Write the four pinned names at the lines above; the hypotheses of `vertical_strip`
(`DiffContOnCl` on the open strip, growth `exp (B * exp (c * |im z|))` with `c < π/(b − a)`, polynomial
edge bounds) are what 3.2 describes, so nothing else changes.

## R04 (P3) — Reference entries without locators and a misstated theorem

**Location.** `README.md` lines 1812–1819.

**Claim.** "OpenAI, *Uniform exclusion of Landau–Siegel zeros*, preprint (2026), open repository";
"B. Green, *On Landau–Siegel zeros*, Hexagon 2610.00311 (2026) — Theorem 1.1 (inert primes carry at
most three quarters of the Mertens mass)"; "T. Tao, … blog post (2026)".

**Witness.** The OpenAI entry names no repository, path or date, and the Tao entry no date or address;
neither can be found from the README alone. Green's Theorem 1.1 (green2026 lines 25–34) states, for
`χ` of sufficiently large conductor and `C` large even, `Σ_{p ≤ q^C, χ(p) = −1} (log p)/p ≤ (1/2 +
O(1/C)) log X + O_C(1)`: the constant is `1/2`, not `3/4`; "three quarters" is the constant of
AnalyticNumberTheoryPartI's own §0.34c variant (`N = X^{2/3}`, `J = N`, `3 | C`), which that roadmap
says is its choice and "not a constant of the source" (its line 831).

**Repair.** Under the revert of R01 these three entries go. If any stays, cite the OpenAI preprint by
its repository path and release date (openai/math, preprints, 1 October 2026, Theorem 1, printed
p. 1), Tao's post by its date (19 October 2026) and address, and state Green's Theorem 1.1 with his
constant `1/2 + O(1/C)` and his hypothesis "sufficiently large conductor".

## R05 (P3) — 3.3 has no locator

**Location.** `README.md` lines 732–741 ("### 3.3 The two edges").

**Claim.** The edge bounds `‖continuedL d s‖ ≤ C(δ)` on `Re s = 1 + δ` and `≤ C(δ) analyticConductorAt d
s ^ (1/2 + δ)` on `Re s = −δ`, with the gamma-quotient estimate, are stated with a route and a
`*Needs:*` line but no source.

**Witness.** The section cites nothing; the sampled target was checked against the derivation only
(the `Re s = 1 + δ` bound is the absolute convergence of 3.1's average coefficient bound; the
`Re s = −δ` bound is the functional equation times the Stirling quotient of 1.5, whose two
exponentials cancel because `Re ν` and `Re conj ν` agree, giving `(n/2)(1 + 2δ) log |t|` from
`Σ_j ((−δ + Re μ_j − 1)/2 − (1 + δ − Re μ_j − 1)/2)` summed over the real and complex shifts).

**Repair.** Add the locator the References already carry for this estimate, Iwaniec–Kowalski §5.2
(the proof of the convexity bound), or Davenport §§12–14 for the degree-one case, at the claim.

## Verified sound

**Gate and build.** The worker's gate at `ccff63f`: every check passed, build of
`TauCetiRoadmap.ZerosOfLFunctions.Suggested` with `sorry` the only warning. My own elaboration of a
scratch copy of `Suggested.lean` with `#check @name` appended for all 14 declarations: 11 `sorry`
warnings, no error in the file; the elaborated types agree with the README statements (the
`signatures.md` list and my `#check` output coincide; no section binder is lost, `[NeZero q]` is
carried inside each quantifier, `primeIdealCount_effective` carries `[Field K] [NumberField K]`).

**One-tactic probe.** Each of the 11 sorried theorems replaced by `first | rfl | (simp; done) |
infer_instance | (norm_num; done)` on a scratch copy: 11 errors "unsolved goals", none closes. No
declaration restates a definition, mirrors a Check or computes a value: no padding. The three
definitions have real bodies on native carriers.

**Dependency check.** `depcheck: 245 roadmaps, 2467 edges, 0 problem(s)` on the head; the false
negative and the probe output are in R01.

**Overlaps (`scratch/overlaps.md`).** #1907 (kim-em) changes this folder and merges cleanly with this
head; it adds a subsection "Direct primitive Dirichlet exports of 6.4d–e" under 6.4 and a Lean section
`DirichletRealZeros` importing `TauCeti.NumberTheory.LFunctions.Dirichlet.Basic`; it touches none of
the targets this pull request changes and states that the exclusion of exceptional zeros is not an
input to it, so no order between the two is needed. No id this README cites is dropped by an open pull
request; this pull request drops no id. Closest roadmaps by vocabulary (#1954, #1944, #1945, #1126):
read their scope sections; the three Explicit roadmaps own numerical constants and cite this roadmap
for the existential forms and AnalyticNumberTheoryPartI §0.34 for the exclusion; the only object with
two owners is the one in R02.

**Ownership of the three definitions.** No order-of-an-entire-function predicate and no zero-count
function in the pinned Mathlib (grep of `Mathlib/Analysis` for `FiniteOrder`, `HasOrder`,
`entireOrder`, `zeroCount`, `countZeros`: none); Mathlib has `ValueDistribution.logCounting`, which
4.6 compares with, not restates. `zetaEntireCompletion` is `2ξ`; AnalyticNumberTheoryPartI §0.14 defines
its own `riemannXi` and compares it with this roadmap's completion (its line 487), which is that
roadmap's business as the later one.

**Tau Ceti names at `2fd255d9`.** Present: `TauCeti.Contour.IsPiecewiseC1On`
(`TauCeti/Analysis/Calculus/ContDiff/PiecewiseC1On.lean`), `windingNumber`
(`Analysis/Contour/Winding/Number/Basic.lean`), `IsNullHomologous` and `isNullHomologous_iff`
(`Analysis/Contour/NullHomologous.lean`, `Winding/Number/Basic.lean`),
`argumentPrinciple_nullHomologous` (`Analysis/Contour/Argument/Cycle.lean`),
`residue_logDeriv_eq_meromorphicOrderAt` (`Residue/LogDeriv.lean`),
`windingNumber_comp_eq_integral_logDeriv` (`LogDerivFTC.lean`),
`exists_continuousOn_arg_lift_with_partition` (`Argument/Lift.lean`), `TauCeti.Real.logIntegral`
(`Analysis/SpecialFunctions/LogIntegral.lean`), `idealSummatory_mul_eq_sub_integral_mul`
(`NumberTheory/ArithmeticDirichletSeries/AbelSummation.lean`), `IdealArithmeticFunction.vonMangoldt`
(`…/VonMangoldt.lean`), `GlobalNumberFields.RayClassGroup`, `idealClass`, `integralIdealsPrimeTo`,
`finite_rayClassGroup`, `rayClassIdealMainTerm` (`NumberTheory/NumberField/Global/RayClass/*.lean`),
`NumberField.Chebotarev.frobeniusPsi`, `frobeniusPrimeCount`
(`NumberTheory/Chebotarev/PrimeCounting/VonMangoldt.lean`), `NumberField.artinSymbol`
(`NumberTheory/NumberField/ArtinSymbol.lean`), `TauCeti.LFunctions.dirichletData`
(`NumberTheory/LFunctions/Dirichlet/Basic.lean`), `heckeLFunctionC`
(`NumberTheory/LFunctions/Hecke/Basic.lean`). Absent at the pin and cited as roadmap contracts, as the
README says: `dedekindZetaC`, `three_four_one_nonneg` and the other LFunctions Layer 3–8 names.

**Mathlib declarations opened at the pin (by `#check`, hypotheses compared with the README).**
`Complex.exists_continuousOn_eqOn_exp_comp` (simply connected open `U`, continuous `g` with `0 ∉ g ''
U`, gives a continuous `f` with `exp ∘ f = g` on `U`: 1.1 and 5.4 call it a continuous lift to be
upgraded, correct); `DirichletCharacter.LFunction_ne_zero_of_one_le_re` (`χ ≠ 1 ∨ s ≠ 1`, `1 ≤ Re s`)
and `riemannZeta_ne_zero_of_one_le_re` (`1 ≤ Re s`, no pole clause) for 6.5;
`DirichletCharacter.norm_LFunction_product_ge_one` (the 3-4-1 product `≥ 1` for `x > 0`);
`completedRiemannZeta₀_one_sub`; `AnalyticOnNhd.sum_divisor_le` (`0 < |r| < |R|`, `1 ≤ M`, analytic on
`closedBall c |R|`, `f c ≠ 0`, `‖f‖ ≤ M` on the sphere, count on `closedBall c |r|` at most `log (M /
‖f c‖) / log (R / r)`: exactly 4.3); `tprod_one_add_ne_zero_of_summable`; `logDeriv_tprod_eq_tsum`
(open `s`, `MultipliableLocallyUniformlyOn`, nonvanishing factors: 5.5); `Complex.borelCaratheodory`;
`ValueDistribution.logCounting`, `log_counting_zero_sub_logCounting_top`,
`Function.locallyFinsuppWithin.logCounting_divisor_eq_circleAverage_sub_const`,
`MeromorphicOn.circleAverage_log_norm`, `MeromorphicOn.divisor_restrict`,
`Function.locallyFinsuppWithin.posPart_apply`, `LocallyFiniteSupport.finite_inter_support_of_isCompact`,
`MeromorphicOn.meromorphicOrderAt_ne_top_of_isPreconnected`, `MeromorphicOn.extract_zeros_poles`,
`meromorphicTrailingCoeffAt`, `Complex.differentiableOn_update_limUnder_of_bddAbove`,
`Complex.Gammaℝ_mul_Gammaℝ_add_one`, `Complex.Gammaℝ_eq_zero_iff` (`s = −2n`),
`Complex.differentiable_one_div_Gamma`, `differentiable_Gammaℝ_inv`, `differentiable_Gammaℂ_inv`,
`Complex.digamma`, `riemannZeta_def_of_ne_zero`, `riemannZeta_zero` (`= −1/2`), `riemannZetaZeros`,
`isDiscrete_riemannZetaZeros`, `IsCompact.inter_riemannZetaZeros_finite`, `RiemannHypothesis`,
`DirichletCharacter.completedLFunction`, `DirichletCharacter.IsPrimitive`, `mellinInv_mellin_eq`
(`MellinConvergent`, `VerticalIntegrable`, `ContinuousAt`), `NumberField.dedekindZeta`,
`dedekindZeta_residue`, `Chebyshev.psi`, `ArithmeticFunction.vonMangoldt`, `Nat.primesBelow`,
`meromorphicOrderAt`, `MeromorphicOn.divisor`, `meromorphicOrderAt_mul`, `Polynomial.rootMultiplicity`,
`Complex.Gamma_ne_zero`, `Differentiable.apply_eq_apply_of_bounded`,
`TendstoLocallyUniformlyOn.differentiableOn`, `DirichletCharacter.LFunction_apply_one_ne_zero`,
`MulChar.IsQuadratic`. The four that fail are R03.

**Sources (the seeded sample).**

- 1.2, 1.3, 1.5, 3.5: `dlmf5` (fetched from dlmf.nist.gov/5.11) lines 104–108: 5.11.1 is Stirling's
  series for `Ln Γ(z)` in the sector `|ph z| ≤ π − δ`; lines 563–569 (§5.11(ii)): for complex `z` the
  remainder after `n − 1` terms is at most `sec^{2n}(ph z/2)` times the first neglected term, so the
  `O(1/‖s‖)` of 1.2 has a constant depending on `δ`, as stated; line 160: 5.11.2 digamma
  `ψ(z) ∼ ln z − 1/(2z) − …`; lines 490–524: 5.11.9 `|Γ(x + iy)| ∼ √(2π) |y|^{x − 1/2} e^{−π|y|/2}`
  uniformly for bounded real `x`, which is 1.3's leading terms and 3.5's exponential.
- 3.2: `PhragmenLindelof.vertical_strip` at the pin (R03): hypotheses as the README states them.
- 3.3: no locator (R05); the derivation checked by hand.
- 4.2: a consequence of Layer 0's definitions and LFunctions Layer 0's `exact_pole_order`; no
  external source is needed.
- 5.1, 5.3, 5.4: Davenport §11 (not verifiable, below); the route checked: `n(r) = O(r^{1+ε})` from
  4.3 with centre `0`, radii `r`, `2r`, `M = exp((2r)^{1+ε})`; then `Σ m_ρ ‖ρ‖^{−2} ≤ ∫ r^{−2} dn(r) <
  ∞`; `‖E₁(z) − 1‖ ≤ C‖z‖²` on `‖z‖ ≤ 1/2` gives the summable majorant `Summable.multipliableLocallyUniformlyOn_one_add` needs.
- 6.2: `kadiri` cache (arXiv 1106.1868, author page) lines 90–96: Theorem 1.1, "Let `d_K` be
  sufficiently large": (1.7) no zero with `|Im s| ≥ 1` in `Re s ≥ 1 − 1/(12.55 log d_K + 9.69 n_K
  log|Im s| + 3.03 n_K + 58.63)`; (1.8) at most one zero with `|Im s| ≤ 1` in `Re s ≥ 1 − 1/(12.74
  log d_K)`, real and simple. The README's description (regions for `|Im s| ≥ 1` and `≤ 1` when
  `d_K` is large, passage to all fields of degree `n` by 6.4e) is exact.
- 6.3: `openai2026lspdf` lines 23–25, Theorem 1: `(1 − β) log q ≥ c` for every real zero `β ∈ (0, 1)`
  of every primitive nonprincipal real Dirichlet L-function of conductor `q ≥ 3`, `c` absolute; the
  README's and AnalyticNumberTheoryPartI §0.34's statement. The deduction in 6.3 is right (table);
  the defect is R01.
- 6.4: 6.4d cites Kadiri §2.1.2; `kadiri` lines 258–265 (printed p. 7): `−Re ζ_K'/ζ_K(s) = −Σ_ϱ Re
  1/(s − ϱ) + ½ log d_K + Re 1/s + Re 1/(s − 1) + Re γ_K'/γ_K(s)`, the four terms 6.4d names.
- 6.5: the two Mathlib nonvanishing theorems above; the trivial-character orders at `1` and `1 + it`
  are LFunctions Layer 3 and 7 contracts, cited by name.
- 7.5: `trudgian2015` (arXiv 1206.1844v4) lines 19–22: Theorem 1, `T ≥ 1`, `χ` primitive nonprincipal
  modulo `k`, `|N(T, χ) − (T/π) log(kT/2πe)| ≤ 0.317 log kT + 6.401`, `N` counting `0 < β < 1`, `|γ| ≤
  T`; lines 25–27: Theorem 2, `|N_K(T) − (T/π) log(d_K (T/2πe)^{n_K})| ≤ 0.317(log d_K + n_K log T) +
  6.333 n_K + 3.482`. Both match 7.5 and `riemannVonMangoldt_dirichlet` (for `T ≥ 2`, `k ≥ 1`,
  `0.317 log kT + 6.401 ≤ 9.55 log kT`).
- 8.3: Davenport §17 (not verifiable); the `K = ℚ` constants recomputed in the table.
- 8.7: Davenport §20 (not verifiable); AnalyticNumberTheoryPartI §0.18 and §0.32 read at its head
  (R01, R02); the uniform deduction recomputed in the table.

**Adversarial table.** One row per statement; values computed on each side.

| Statement | Instances tried | Values | Result | Change |
| --- | --- | --- | --- | --- |
| `OrderLE f A` | `exp z` at `A = 1`, `A' = 3/2`; `exp(z²)` at `A = 1`; constant `1` at `A = −1` | `exp r / exp(r^{3/2}) → 0`; `exp(r²)/exp(r^{3/2}) → ∞`; `1 ≤ exp(r^{−1/2})` | holds, fails, holds as the README says | none |
| `zeroCount f U R` | `z(z−1)`, `z/(z−1)`, `f = 0` on `closedBall 0 2` | `2`; `1` (divisor `−1` at `1` → `toNat 0`); `0` (divisor `0`) | agrees with 4.1 Checks | none |
| `zetaEntireCompletion` | `s = 0, 1, 2`; `s ↦ 1 − s` | `0·(−1)·Λ₀(0) + 1 = 1`; `1`; `2Λ(2) = 2·π^{−1}·ζ(2) = π/3` (`Λ₀(2) = Λ(2) − 1/2`); symmetric by `Λ₀(1−s) = Λ₀(s)` | `2ξ`, values match Layer 0 | none |
| `dirichletLFunction_convexity` | `q = 1`, `t = 0`; `q = 1`, large `t` | `|ζ(1/2)| = 1.4604 ≤ C·3^{1/4+ε}` with `C ≥ 1.11`; `ζ(1/2+it) ≪ |t|^{1/4+ε}` (Titchmarsh §5.1) | sound | none |
| `hadamard_of_orderLE_one` | `f = 1`; `f = 1 − s`; `f = exp(z²)`; factor at `ρ = 0` | empty product, `a = b = 0`; `a = 0`, `b = −1`, `e^{−s}E₁(s) = 1 − s`; hypothesis fails (`A' = 3/2` ratio `→ ∞`); `m_0 = 0` since `f 0 ≠ 0`, factor `1` | sound; `Multipliable` is unconditional, justified by `Σ m_ρ/|ρ|² < ∞` at order `≤ 1` | none |
| `zetaEntireCompletion_hadamard` | `s = 2m` | `log|Λ₀(2m)| = m log m + O(m) ≤ (2m)^{1+ε}` for large `m` | order `≤ 1` holds, order `< 1` fails: 3.1's input is exactly what is needed | none |
| `riemannZeta_zeroFreeRegion` | `s = 1/2`; `s = −2`; `s = 1 + 2i`; `s = 1` | in the region iff `c ≥ (log 3)/2`, and `ζ(1/2) ≠ 0` anyway; `Re = −2 <` cutoff, outside; `ζ ≠ 0` by `Re ≥ 1`; excluded by `s ≠ 1` | sound | none |
| `dirichletLFunction_zeroFreeRegion` | `q = 1`, `ρ = 1`; mod-2 principal at `ρ = 0` and `ρ = 2πik/log 2`; odd `χ` mod 4 at `ρ = −1`; real `χ`, hypothetical `β` | order `−1 ≤ 0`; `Re 0 = 0 < 1 − c/log 6` since `c ≤ (log 3)/2 < log 6`; `Re = 0`, outside; `−1 <` cutoff; `(1−β) log 3q ≤ c ≤ c_LS ≤ (1−β) log q' ≤ (1−β) log q < (1−β) log 3q`, contradiction | true given AnalyticNumberTheoryPartI §0.34; unowned here | R01, R02 |
| `riemannVonMangoldt` | `T = 14`; `T = 100` | `N = 0` vs `(14/2π) log(14/2πe) = −0.443`; `N = 29` vs `15.915·1.767 = 28.12` | differences `0.44`, `0.88` within `C log T` | none |
| `riemannVonMangoldt_dirichlet` | `q = 1`, `T = 100`; Trudgian's constants | `N± = 58` vs `(100/π) log(100/2πe) = 56.25`; `0.317 log kT + 6.401 ≤ (0.317 + 6.401/log 2) log kT` for `kT ≥ 2` | sound; main term uses `q`, not `q^{1/2}` | none |
| `chebyshevPsi_explicitFormula` | constant term; `log x` term; trivial-zero term; error with `T ≤ x` | `c_ℚ = −ζ'(0)/ζ(0) = −log 2π`; `r₁ + r₂ − 1 = 0`; `((r₁+r₂)/2) log(1 − x^{−2}) = ½ log(1 − x^{−2})`, sign `−` as in Davenport; `x log x log(xT)/T ≤ 2x log² x/T` and `log x ≤ x log² x/T` | matches 8.3 at `K = ℚ`; poles at `0, 1` have `toNat 0` | none |
| `riemannZeta_weilExplicitFormula` | shift of `(2πi)⁻¹∫_{(2)} (Λ'/Λ) φ̃` to `Re s = −1`; `φ = 0` | residues `m_ρ φ̃(ρ)` at zeros and `−φ̃(0) − φ̃(1)` at the poles; reflection `Λ'/Λ(s) = −Λ'/Λ(1−s)` turns the left integral into `−∫_{(2)} (Λ'/Λ)(w) φ̃(1−w)`; `ζ'/ζ = −ΣΛ(n)n^{−s}` and Mellin inversion give `−ΣΛ(n)(φ(n) + φ(1/n)/n)`; `Γℝ'/Γℝ` gives `(2π)⁻¹∫ logDeriv Γℝ(2+it)(φ̃(2+it) + φ̃(−1−it)) dt`; both sides `0` | signs and both test-function terms agree with the Lean | none |
| `primeIdealCount_effective` | `K = ℚ`; fixed `β < 1` | `π(x) − Li x = O(x e^{−c√log x})`; `x^β/(x e^{−c√log x}) = exp(−(1−β) log x + c√log x) → 0` | the exceptional term is absorbed for fixed `K` | none |
| `primeCounting_progression_effective` | `q = 1`, `x = 2`; `q > x`; `e^{√log x} < q ≤ x`; `q ≤ e^{√log x}`; negative control of the 8.7 Check | `|1 − 0| ≤ 2A e^{−0.83c}`, `A` large; count `≤ 1`, `Li x/φ(q) ≤ C log log q/log x` bounded; count `≤ x/q + 1 ≤ x e^{−√log x} + 1`; §0.18 error `x e^{−(c/2)√log x}(log x)²`; a zero with `(1−β) log q = δ` at `√log x = c₀ log q/(2δ)` gives `Li(x^β)/φ(q) ≈ x e^{−(c₀/2)√log x}/(φ(q) log x)`, ratio to `A₀ x e^{−c₀√log x}` is `≥ e^{(c₀/2 − 2δ/c₀)√log x}/(A₀ log x) → ∞` iff `δ < c₀²/4` (the README's `δ < c₀²/8` suffices) | true given AnalyticNumberTheoryPartI §0.18; unowned here; the Check is right | R01, R02 |
| 6.3 over `ℚ` | `q(χ,0)`; the strict inequality; width `c ≤ c_LS`; conductors `1, 2`; the Siegel Check | `q(χ,0) = q(‖a‖ + 3) = (3 + a)q`; `(1−β) log q < (1−β) log q(χ,0) ≤ heckeZeroFreeConstant 1`; `c_LS ≤ (1−β) log q < c ≤ c_LS` impossible; no real nonprincipal primitive character; `c_ε q^{−ε} < c/log 4q` once `q^{ε} > (c_ε/c) log 4q` | all steps right | R01 |
| 8.5 quadratic `K` | `ζ_K = ζ · L(χ_{d_K})` | `χ_{d_K}` primitive real nonprincipal of conductor `|d_K| ≥ 3` | the exclusion applies; unowned here | R01 |
| 8.6 over `ℚ` Check | `β ≥ 1/2`, `1 − β ≥ c_LS/log q` | `x^β/β ≤ 2x e^{−c_LS log x/log q}`; fixed `q`: `log x/log q ≫ √log x`; `log q ≤ √log x`, `c ≤ c_LS`: `≤ 2x e^{−c√log x}` | right | R01 |
| 8.7 over `ℚ` bullet | `𝔪 = (q)∞`, `q ≤ 2`; `q ≥ 3` | trivial ray class group, only `ζ`, terms `0`; each summand from a real zero of conductor dividing `q`, `|term| ≤ 2x e^{−c_LS log x/log q}` | right (`log q = 0` for `q ≤ 2` is never a denominator there) | R01 |
| 8.8 over `ℚ` | fibre identity; bound; `L = ℚ(√5)` | `Σ_{c ∈ Φ⁻¹(σ)} conj ψ'(c) = (#Cl/#G) conj ψ(σ)` when `ψ' = ψ ∘ Φ`, else `0`, so the fibre sum is `Σ_ψ (#G)⁻¹ conj ψ(σ) Σ_β`; each `ψ ∘ Φ` has conductor dividing `f`, at most one `β`, so `≤ 2x e^{−c_LS log x/log f}`; fibre of the nontrivial automorphism `= {2, 3} ⊆ (ℤ/5)ˣ`, the inert primes, count `Li x/2` | right | R01 |
| 6.2 and 6.4d vs Kadiri | Thm 1.1 hypotheses; §2.1.2 terms | `d_K` large; `|Im s| ≥ 1` and `≤ 1` regions; the four terms of the explicit formula | match | none |
| 7.5 vs Trudgian | Thm 1 and 2 | above | match; halving inside the logarithm would lose `(T/2π) log d_K` | none |
| 1.2, 1.3, 1.5, 3.5 vs DLMF | 5.11.1, §5.11(ii), 5.11.2, 5.11.9 | above | match | none |
| 8.7 main coefficient | `K = ℚ`, `𝔪 = (3)∞` | prime count coefficient `1/#Cl = 1/2`; `rayClassIdealMainTerm = (1/2)(1 − 1/3) = 1/3` | the two counts differ as stated | none |
| 8.2–8.3 trivial zeros, general `K` | order at `0`, at `−m` | `r₁ + r₂ − 1`; `r₁ + r₂` (even `m`), `r₂` (odd `m`) from `Γℝ^{r₁}` poles at `0, −2, …` and `Γℂ^{r₂}` at all nonpositive integers | right | none |

**Cross-roadmap citations resolved.** AnalyticNumberTheoryPartI §§0.1, 0.6, 0.9, 0.18, 0.32, 0.34 and
`ExceptionalRealZero.empty`, `landau_siegel_exclusion` exist at its head (its lines 181, 264, 301, 551,
780, 804, 190, 806): the citations resolve, which is exactly R01. The LFunctions, GlobalNumberFields,
NumberFieldArithmetic, Chebotarev, ArithmeticDirichletSeries, ClassFieldTheory and ModularForms
citations are unchanged from main and were not re-resolved line by line.

## Not verifiable

- Davenport, *Multiplicative Number Theory*, §§11–14, 16–20 (5.1, 5.3, 5.5, 6.2, 7.5, 8.3, 8.5–8.7):
  paywalled (Springer); not in the sources cache (the cache has only a tribute volume naming
  Davenport). Cited by locator; the `K = ℚ` constants of 8.3 and the deductions of 8.7 were
  recomputed instead.
- Titchmarsh, *The Theory of the Riemann Zeta-Function*, §5.1, §§9.2–9.4 (3.4, 4.5, 7.3–7.6):
  paywalled (OUP); not in the cache.
- Lang, *Algebraic Number Theory*, XVII §3 (8.4): paywalled; not in the cache. The formula was
  rederived (table).
- Iwaniec–Kowalski §§5.1–5.2 (Layer 2, 3.4): paywalled; the cache copy (`ebcb8686`) is a table of
  contents only.
- Lagarias–Odlyzko (8.8, not in the sample): not in the cache, not fetched.

## Source issues

- none
