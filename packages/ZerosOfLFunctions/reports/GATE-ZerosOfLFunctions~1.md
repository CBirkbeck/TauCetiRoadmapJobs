# GATE-ZerosOfLFunctions~1 — answers to human review

Head reviewed: `cce2e04`. Repairs committed as `d7e9b6b3` and `6328e1c7` on the PR branch (not pushed). Files:
`TauCetiRoadmap/ZerosOfLFunctions/README.md`, `TauCetiRoadmap/ZerosOfLFunctions/Suggested.lean`.
Points are numbered in the order they appear in the unanswered comments. A point repeated in a later
comment gets its own number and points back to the first one.

## H01 (CBirkbeck) — answered
Merge order is respected. `Suggested.lean` no longer imports any roadmap module (old lines 2–6
imported ArithmeticDirichletSeries, GlobalNumberFields, LFunctions, Chebotarev and
ContourIntegration). It now has the single line `import Mathlib`, so the Lean file cannot land
ahead of a supplier. The README still cites its suppliers by section; the dependency check shows
no UPWARD or CYCLE line (see the end of this report).

## H02 (CBirkbeck) — answered
The contour declarations Layer 7 names all exist in `Completed/ContourIntegration/Suggested.lean`
on main: `hungerbuhlerWasem_residueTheorem`, `windingNumber`, `IsPwC1ImmersionOn`,
`IsPiecewiseC1On`, `HasCauchyPV`, `ConditionAprime`, `ConditionB`, `argumentPrinciple_local`,
`IsNullHomologous` and `residue` were each found there. No local replacement is introduced.

## H03 (CBirkbeck) — answered
No change was requested. Nonabelian Chebotarev stays out of scope: see the README's *Out of scope*
list and the end of 8.8. No generic Artin instance is claimed anywhere.

## H04 (CBirkbeck) — disputed
The roadmap's `|d_K|` inside the logarithm is correct for the symmetric count `|γ| ≤ T`. The
proposed `|d_K|^{1/2}` is false. Trudgian (arXiv 1206.1844v4, `Trudgian2015 line 16–27`) counts
zeros with `0 < β < 1`, `|γ| ≤ T`, and states Theorem 2 as
`|N_K(T) − (T/π) log(d_K (T/2πe)^{n_K})| ≤ 0.317(log d_K + n_K log T) + 6.333 n_K + 3.482`.
The imaginary-quadratic check fails for the halved form by `(T/2π) log|D|`, which is unbounded in
`D`; the README worked example *Degree and conductor in the main term* keeps that computation. The
`K = ℚ` instance is now a Lean headline, `riemannVonMangoldt_dirichlet`, with main term
`(T/π) log(qT/2πe)`.

## H05 (CBirkbeck) — applied
This was already in place at `cce2e04`. 8.7 is the effective count on the ray-class side. 8.8
transports it to an abelian `L/K` along a reciprocity hypothesis. Nonabelian classes are out of
scope, with the reason given (*Out of scope*, and the end of 8.8). The `K = ℚ` case of 8.7 is now
the Lean headline `primeCounting_progression_effective`.

## H06 (CBirkbeck) — applied
Already in place at `cce2e04`. Layer 6.4 is broken into the named milestones (4a)–(4f): common
presentation modulus, imprimitive comparison, real/non-real split, conductor dependence through the
Hadamard expansion, small-conductor reduction, and uniqueness with simplicity.

## H07 (CBirkbeck) — applied
Already in place at `cce2e04`. Layer 1.1 makes `0 < δ < π` a hypothesis of items 1, 2 and 4, gives
the reason for each endpoint, and proves `2 ∈ S_δ` as a lemma.

## H08 (CBirkbeck) — answered
This is an approval conditional on the L-functions supplier. Since `Suggested.lean` no longer
imports `TauCetiRoadmap.LFunctions.Suggested` (H01), the remaining dependency on that supplier is
in the README only.

## H09 (CBirkbeck) — applied
The effective main term is `Li`.
- README 8.7/8.8 use Tau Ceti's `TauCeti.Real.logIntegral` (`∫ t in 2..x, (log t)⁻¹`).
- The Lean headline `primeCounting_progression_effective` has main term
  `(∫ t in 2..x, (log t)⁻¹) / φ(q)` and error `x exp(−c√log x)`.
- At `q = 1` this is de la Vallée Poussin's `π(x) = Li x + O(x e^{−c√log x})`, the requested
  acceptance test.

## H10 (CBirkbeck) — applied
README 7.6 keeps the generic form only under Dirichlet agreement, the average coefficient bound and
zero confinement. The two rejection cards (constant card, twisted-zeta card) are now README worked
examples. `Suggested.lean` no longer states a generic-card theorem: the card type belongs to the
L-functions roadmap, and a roadmap module cannot be imported. The headline Riemann–von Mangoldt
statements are therefore on actual carriers:
- `riemannVonMangoldt` (ζ, one-sided);
- `riemannVonMangoldt_dirichlet` (primitive χ, symmetric, uniform in `q`).
The constant-function counterexample cannot be expressed against either.

## H11 (CBirkbeck) — applied
Already in place at `cce2e04`. In README 1.6 the pointwise functional equation carries
`d.polarOrder s = 0` and `d.polarOrder (reflectedPoint s) = 0` alongside the two gamma hypotheses.
The germ form carries none of them. The shifted-pole card (poles at `2` and `−1`) is the worked
example that rejects the old statement (`0 = 1` at `s = 2`).

## H12 (CBirkbeck) — applied
Already in place at `cce2e04`. README 7.2a takes `meromorphicOrderAt f z ≠ ⊤` on `closure V` and
discharges it from a boundary point of order `0` through connectedness. The case `f = 0` is the
rejection example, and the nonzero-order locus is kept distinct from the divisor support.

## H13 (CBirkbeck) — applied
Already in place at `cce2e04`. The zero sides of 8.4 and 8.6 are `∑'` with a `Summable` milestone,
and the conventions-table row *infinite sums* restricts `∑ᶠ` to bounded counts. In the new
`chebyshevPsi_explicitFormula`, the zero sum is `∑ᶠ` over the bounded rectangle
`Icc 0 1 ×ℂ Icc (−T) T`. Its support is finite there: the zeros of a function that is not
identically zero do not accumulate in a compact set.

## H14 (CBirkbeck) — applied
README 6.4 and 7.6 treat uniformity as a quantifier order. In the new Lean headlines the constant
is bound before the varying object:
- `dirichletLFunction_zeroFreeRegion`: `∃ c, … ∀ q χ`;
- `riemannVonMangoldt_dirichlet` and `dirichletLFunction_convexity`: `∃ C, ∀ q χ`;
- `primeIdealCount_effective`: `∀ K, ∃ c`, a fixed-field statement, and its docstring says so.

## H15 (CBirkbeck) — applied
Already in place at `cce2e04`. The 8.6 prime side is
`−∑_𝔞 Λ_K(𝔞)(χ(𝔞) φ(𝔑𝔞) + conj(χ(𝔞)) φ̌(𝔑𝔞))`. The quartic-character-mod-5 worked example gives
`−(i log 2)/2` for this form and `+(i log 2)/2` for the form with `χ` on both terms.

## H16 (CBirkbeck) — applied
Already in place at `cce2e04`. The 6.4d bound is `−ζ'_K/ζ_K(σ) ≤ 1/(σ−1) + ½ log|d_K| + O_n(1)`,
and the split-primes family `ℚ(√D)` is recorded as the refutation of the degree-only form.
Verified against Kadiri, arXiv 1106.1868v1, §2.1.2, `Kadiri2012 line 230–248`: the explicit formula
before (2.7) contains `½ log d_K`.

## H17 (CBirkbeck) — applied
Already in place at `cce2e04`. README 8.7 defines *exceptionalRayClassTerm* as a finsum over all
characters at `𝔪`, trivial included, of the subsingleton `{β | IsExceptionalZero (of ψ) β}`. The
character family is independent of `c` except through the weight `ψ(c)`. Membership is
characterized in both directions through the primitive source in 6.3.

## H18 (CBirkbeck) — applied
Already in place at `cce2e04` in *Out of scope*, 8.5, 8.6 and 8.7: for fixed objects
`x^β = o(x e^{−c√log x})`. The one leftover sentence, in the 8.5/8.6 source-table row, is repaired
under H35.

## H19 (CBirkbeck) — applied
Already in place at `cce2e04`. 6.4d writes the functional-equation map `ρ ↦ 1 − ρ` into
`Λ(χ⁻¹,·)` and the conjugation map `ρ ↦ conj ρ` into `Λ(χ⁻¹,·)` separately. Their composite
`ρ ↦ 1 − conj ρ` is a symmetry of `Λ(χ,·)` itself.

## H20 (CBirkbeck) — answered
The hold depended on the build and on #248's conductor-one lemma. The Lean file no longer depends
on #248, and `lake build TauCetiRoadmap.ZerosOfLFunctions.Suggested` now succeeds (see the end of
this report).

## H21 (CBirkbeck) — applied
README 6.2 now defines
`heckeZeroFreeConstant n := min (Classical.choose (heckeZeroFreeRegion n)) (Real.log 3 / 2)` and
exports three facts: positivity, the upper bound `≤ log 3 / 2`, and the zero-free disjunction (by
monotonicity, since shrinking `c` shrinks the region). README 6.3 adds `IsExceptionalZero.half_le`:
`q(χ,0) ≥ 3`, so `β ≥ 1/2`. *isExceptionalZero_of_iff* now cites this bound for its transfer, which
is valid on `Re s > 0`. The principal-character-mod-2 boundary example
(`(1 − 2^{−s})ζ(s)` vanishes at `0`) is recorded there.

## H22 (CBirkbeck) — answered
Same interval issue as H21, repaired there. The #248 note needs no change here.

## H23 (roed-math) — applied
`TauCetiRoadmap/ZerosOfLFunctions/metadata.toml` contains `topic = "math.NT"`, added in `cce2e04`.

## H24 (CBirkbeck) — applied
Applied as proposed, with the cap `log 3 / 2` (see H21). The same normalization is the Lean
headline `dirichletLFunction_zeroFreeRegion`: `∃ c, 0 < c ∧ c ≤ Real.log 3 / 2 ∧ …`, which puts the
region in `Re s ≥ 1/2`. README 8.7 now uses `β > 0` for the substitution
`∫ t in 2..x, t^(β−1)/log t = Li(x^β) − Li(2^β)`.

## H25 (CBirkbeck) — answered
CI failed because `Suggested.lean` imported the unmerged `TauCetiRoadmap.LFunctions.Suggested`.
That import is gone, and the targeted build succeeds locally.

## H26 (CBirkbeck) — applied
Same repair as H21/H24. The exported bound is `IsExceptionalZero.half_le` (`1/2 ≤ β`), which is
stronger than the requested `IsExceptionalZero.pos`.

## H27 (CBirkbeck) — applied
`import TauCetiRoadmap.LFunctions.Suggested` (old line 4) and the other four roadmap imports are
removed. The file now begins with only `import Mathlib`.

## H28 (CBirkbeck) — applied
Same as H21/H24: one capped constant is defined before *IsExceptionalZero*, and 8.7 reads it.

## H29 (CBirkbeck) — applied
The README supplier rows now cite the canonical Tau Ceti names at the content pin.
- Chebotarev: `NumberField.Chebotarev.frobeniusPrimeSet`, `frobeniusVonMangoldtCoeff`,
  `frobeniusPsi`, `frobeniusTheta`, `frobeniusPrimeCount`, `tendsto_frobeniusPrimeCount`,
  `hasNaturalDensity_frobeniusPrimeSet` (`TauCeti/NumberTheory/Chebotarev/`).
- Arithmetic Dirichlet Series: `TauCeti.normCoeff`, `TauCeti.abscissaOfAbsConv_normCoeff_one`,
  `TauCeti.EulerProductData`, `TauCeti.IdealArithmeticFunction.vonMangoldt`,
  `TauCeti.idealSummatory_mul_eq_sub_integral_mul` (replacing the nonexistent
  `ArithmeticDirichletSeries.abelSummation` and `.idealVonMangoldt`),
  `TauCeti.truncatedPerron_LSeries`, `TauCeti.LSeries.wienerIkehara`,
  `TauCeti.primeNumberTheoremTransfer`.

Each name was checked at the content Tau Ceti pin `a91d3aa`.

## H30 (CBirkbeck) — applied
"No supplier declares `Li`" is removed from the interface list, from *What is missing* and from
8.7. The local `logarithmicIntegral` definition is gone. The README consumes
`TauCeti.Real.logIntegral` (`∫ t in (2:ℝ)..x, (Real.log t)⁻¹`, `LogIntegral.lean:133`) and
`TauCeti.Real.logIntegral_isEquivalent_div_log`. It keeps only the two-term comparison as this
roadmap's target. In Lean, the main terms are written as that same integral; `Suggested.lean` does
not import the module, for the pin reason below.

## H31 (CBirkbeck) — answered
The failing CI, the merge conflict and the missing supplier in the log all come from the
roadmap-module imports, which are removed. The branch is 831 commits behind `origin/main`. Its
manifest pins Mathlib `05ae010` and Tau Ceti `e8af08d`, while main pins `6b7abb3` / `a91d3aa`.
Merging main is the worker's step; no file outside the roadmap folder was touched.

## H32 (CBirkbeck) — applied
README 4.5's trailing-coefficient variant now carries the central order. With
`m = meromorphicOrderAt f c` finite and `a = meromorphicTrailingCoeffAt f c`, the count is
`≤ (log(M/‖a‖) − m log r)/log(R/r) = m + (log(M/‖a‖) − m log R)/log(R/r)`. The proof divides by
`(z − c)^m` and adds `m` back.

Computed on the reviewer's case `f z = z`, `r = 1/4`, `R = 1/2`, `M = 1`: the count is `1`, the
corrected bound is `log 4/log 2 = 2`, and the old bound is `0`. This case is recorded in the README
as the regression check.

## H33 (CBirkbeck) — applied
README 4.11 now uses `ValueDistribution.logCounting f 0`, the positive part of the divisor (Mathlib
`logCounting_zero`), for `N(r)`. The signed Jensen identity stays on the signed side, related by
`ValueDistribution.log_counting_zero_sub_logCounting_top`. Both are checked at the pins.

Computed checks: for `f z = 1/z` the zero count is `0` and the signed log-counting function is
`−log r`, so the signed version of the inequality reads `0 ≤ −log(R/r)`, which is false. For
`f z = z` the two carriers agree.

## H34 (CBirkbeck) — applied
This is the list of outstanding items: the capped constant (H21/H24), the canonical suppliers
(H27/H29) and `logIntegral` reuse (H30). All three are repaired as described in those sections.

## H35 (CBirkbeck) — applied
In the 8.5/8.6 source-table row, "absorbing `x^β/β` into the error would need Siegel's theorem"
became: for fixed field and character, `x^β/β = o(x e^{−c√log x})`, so the fixed-object estimate
holds with or without the term, and only conductor-uniform absorption needs Siegel.

## H36 (CBirkbeck) — applied
The build log's "missing `TauCetiRoadmap/LFunctions/Suggested.lean`" no longer applies, because the
import is removed (H27).

---

## What changed in `Suggested.lean`

The old file had five roadmap imports, 7 `sorry`'d definitions and 34 `sorry` examples. It is
rewritten as an acceptance test against Mathlib only (180 lines).
- **Definitions** (both with real bodies):
  - `zeroCount`, a finsum of the positive part of `MeromorphicOn.divisor`;
  - `zetaEntireCompletion s = s (s−1) completedRiemannZeta₀ s + 1`. Since
    `completedRiemannZeta = Λ₀ − 1/s − 1/(1−s)`, the pole terms give `−(s−1) + s = 1`, so it equals
    `s(s−1)Λ(s)` off `{0,1}` and is `1` at both points.
- **Headlines:**
  - `dirichletLFunction_convexity`
  - `zetaEntireCompletion_hadamard`
  - `riemannZeta_zeroFreeRegion`
  - `dirichletLFunction_zeroFreeRegion`
  - `riemannVonMangoldt`
  - `riemannVonMangoldt_dirichlet`
  - `chebyshevPsi_explicitFormula`
  - `primeCounting_progression_effective`
  - `primeIdealCount_effective`
- **Not statable at the pins**, as the docstring says: everything about the Dedekind zeta function
  or Hecke L-functions over `K ≠ ℚ`. Mathlib's `NumberField.dedekindZeta` is the raw L-series, and
  neither library has its continuation; at Tau Ceti `a91d3aa` there are only half-plane results in
  `NumberField/DedekindZeta.lean`. The general ray-class count and 8.8 are also not stated.
- **Pin caveat for that last item:** Tau Ceti `a91d3aa` (main's pin) does have ray class groups and
  `NumberField.Chebotarev.frobeniusPrimeCount`, but the branch builds against Tau Ceti `e8af08d`,
  which has neither, and the build command uses the branch manifest. Once the branch is on main's
  pin, the abelian effective Chebotarev statement and the general ray-class count become statable
  and should be added.
- **Signature check:** I appended `#check @…` for all 11 declarations, built once, compared each
  elaborated type with its docstring and README statement, then removed the lines. All matched,
  and none needed a change. In particular, the `[NeZero q]` binders survive, and the explicit
  formula reads `x ^ (-2 : ℤ)` as `1/x²`.

README backtick hygiene: 113 exact backtick spans naming this roadmap's own targets that
`Suggested.lean` no longer declares (*continuedL*, *entireCompletion*, *IsExceptionalZero.unique*,
…) became italics. Formula-shaped code spans that use these names as notation inside a displayed
intended signature are unchanged. Three non-timeless phrases were rewritten ("currently builds",
"currently leaves unnamed", "the previous draft was wrong"). `Complex.analyticAt_of_removable`,
which does not exist, was replaced by Mathlib's `Complex.differentiableOn_update_limUnder_of_bddAbove`.

## Adversarial pass on new or changed statements

| statement | instances tried | values computed | result | change |
|---|---|---|---|---|
| `zetaEntireCompletion` | `s = 0`, `s = 1`, generic `s` | `0·(−1)·Λ₀(0)+1 = 1`; `1·0·Λ₀(1)+1 = 1`; off `{0,1}`: `s(s−1)Λ = s(s−1)Λ₀ − (s−1) + s = s(s−1)Λ₀ + 1` | agrees with `s(s−1)Λ`, nonzero at `0` | none |
| `zetaEntireCompletion_hadamard` | `ρ = 0` factor; exponent off the zeros | `zetaEntireCompletion 0 = 1`, so the exponent at `0` is `0` and the factor is `1`; `∑ 1/|ρ|² < ∞`, so `∑ ‖E₁(s/ρ) − 1‖ < ∞` and the product over `ℂ` is unconditional | true (Davenport §12; the factor `½` goes into `A`) | none |
| `riemannZeta_zeroFreeRegion` | real `σ ∈ [1 − c/log 3, 1)`; `s = 1` | `ζ(σ) < 0` on `(0,1)`; `s = 1` excluded (junk value) | true | hypothesis `s ≠ 1` |
| `dirichletLFunction_zeroFreeRegion` | `q = 1` (ζ); principal `χ₀ mod 2` at `s = 1` and `s = 0`; imprimitive χ; complex χ | `ord_1 L(χ₀) = −1`, not `> 0`; region `Re ≥ 1 − (log3/2)/log 3 = 1/2` excludes `s = 0`; region for `q` lies inside region for `q*`, so it transfers; complex χ has no zero in the region | true (Davenport §14) | zeros read by order; cap `c ≤ log 3/2` |
| `riemannVonMangoldt` | `T = 2`; poles at `0, 1` | `Ioc 0 T` excludes `Im = 0`; main term at `T = 100`: `(100/2π) log(100/2πe) ≈ 28.1`, vs `N(100) = 29` | consistent (Titchmarsh Thm 9.4) | none |
| `riemannVonMangoldt_dirichlet` | `q = 1`; `q = 2` (no primitive χ); even χ, trivial zero at `0` | `q = 1`: `(T/π) log(T/2πe)` = twice the one-sided count; completed function, so no trivial zero at `s = 0`; `log(qT) ≥ log 2 > 0` | true (`Trudgian2015 line 19–22`) | completed L-function, `Icc 0 1` strip |
| `dirichletLFunction_convexity` | `q = 1`; imprimitive χ | `ζ(1/2+it) ≪ (|t|+3)^{1/4+ε}`; imprimitive: Euler factor `≤ ∏_{p|q}(1+p^{−1/2}) ≪ q^ε` | true; stated for primitive χ only, as the sources state it | none |
| `chebyshevPsi_explicitFormula` | `x` a prime power; zeros at height exactly `T`; `ρ = 0, 1` | `Λ(x) ≤ log x ≤ x log²x/T` for `T ≤ x`; extra zeros at height `T`: `O(log T)·x/T`; divisor of `Λ` at `0, 1` is `−1`, `toNat = 0`; `K = ℚ` residues: `c_ℚ = −log 2π`, trivial-zero sum `−½ log(1−x^{−2})` | true (Davenport §17) | `T ≤ x` replaces the prime-power exclusion |
| `primeCounting_progression_effective` | `q = 1`; `q` fixed with exceptional `β` | `q = 1`: `π(x) − Li x`; `Li(x^β)/(x e^{−c√log x}) → 0` for fixed `β < 1` | true with absolute `c` (Davenport §20) | none |
| `primeIdealCount_effective` | `K = ℚ`; possible Siegel zero of `ζ_K` | `K = ℚ`: count = `π(x)`; `Li(x^β) = o(x e^{−c√log x})` | true for fixed `K` | none |
| README 4.5 variant | `f z = z`, `c = 0`, `r = 1/4`, `R = 1/2`, `M = 1` | count `1`; new bound `2`; old bound `0` | old refuted, new holds | central order added |
| README 4.11 | `f z = z`; `f z = 1/z` | `1/z`: `n = 0`, signed `N(r) = −log r`, inequality `0 ≤ −log(R/r)` false; positive part `N ≡ 0` holds | old refuted | positive part |
| README 6.2/6.3 capped constant | principal `χ` mod `2`; degree `n ≥ 1` | `q(χ,0) ≥ 3`, so `c/log q ≤ (log3/2)/log 3 = 1/2` and `β ≥ 1/2`; `(1−2^{−s})ζ(s)` vanishes at `0`, which is outside `Re ≥ 1/2` | gap closed | cap and `half_le` added |
| README 8.7 substitution | `u = t^β` | `t^{β−1}/log t dt = du/log u`, so the integral is `Li(x^β) − Li(2^β)`; needs `2^β > 1`, i.e. `β > 0` | holds given `β ≥ 1/2` | precondition stated |
| README 8.3 trivial zeros | `r₁, r₂` general; `K = ℚ` | even `m`: `(r₁+r₂) ∑ x^{−2k}/2k = −((r₁+r₂)/2) log(1−x^{−2})`; odd: `r₂ artanh(1/x) = (r₂/2) log((x+1)/(x−1))` | display correct | none |

## Ownership

`zeroCount` and `zetaEntireCompletion` are this roadmap's own. `roadmaps grep` over main and the
open heads (`zeroCount`, `riemannXi`, `divisor … .toNat`) and a search of the pins turned up no
natural-number zero count of a meromorphic function in a region, and no entire `s(s−1)Λ(s)`
(Mathlib has only `completedRiemannZeta₀`).

AnalyticNumberTheoryPartI (#1126) is a **consumer** of this roadmap: its README imports
ZerosOfLFunctions Layers 0–8. It defines Riemann's `ξ` with the factor `1/2`, as
`2 * riemannXi = entireCompletion`. The first version of these repairs named the factor-free
function `riemannXi`, which invited exactly that confusion, so the second commit renamed it
`zetaEntireCompletion`. That roadmap also cites `IsExceptionalZero`, `.unique`, `.divisor_eq_one`,
`.sq_eq_one`, `OrderLE` and `entireCompletion` from Layers 0, 5 and 6 here. These remain README
targets in 6.2–6.3, but they are no longer Lean declarations of this roadmap, so that roadmap's
citation resolver may now flag them. Its §0.30 cutoff `c ≤ min(c₁/3, log 3/2)` agrees with the
cap introduced under H21. The general ray-class count and the
logarithmic integral are consumed from Tau Ceti, not restated. No notion moves down from a later
roadmap.

## Sources

`Trudgian2015` (arXiv 1206.1844v4) and `Kadiri2012` (arXiv 1106.1868v1) were fetched through the
sources service. The roadmap has no `sources.toml`, and this job may not create one, so neither is
recorded in a manifest. Davenport, Titchmarsh and Iwaniec–Kowalski are cited by section only
(standard textbooks). Nothing was listed in `needs-references.toml`.

## Build

`lake build TauCetiRoadmap.ZerosOfLFunctions.Suggested`: **Build completed successfully (8702
jobs)**, with only `declaration uses 'sorry'` warnings. This is against the branch's own pins:
Mathlib `05ae010`, Tau Ceti `e8af08d`.

## Gate

`gate ZerosOfLFunctions: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=1 metadata=0 dirty=0 outside-folder=0 source-material=0 FAIL`

The only remaining item is `depcheck: NOT IN ORDER: ZerosOfLFunctions (insert it after its last
supplier)`. This is the design-stage case the brief says is not a defect.

Dependency check (`--movable`):

```text
NOT IN ORDER: ZerosOfLFunctions (insert it after its last supplier)
depcheck: 155 roadmaps, 1060 edges, 1 problem(s)
```

With `--candidate`: the roadmap is placed after TensorProductCombinatorics, with notes that its
suppliers ClassFieldTheory, GlobalNumberFields and LFunctions must be inserted before it, and the
result is `depcheck: 155 roadmaps, 1060 edges, 0 problem(s)`. There is no UPWARD or CYCLE line.

Ownership against open pull requests was checked only through the sibling checkouts this brief
lists (LFunctions at its head) and `roadmaps grep`.
