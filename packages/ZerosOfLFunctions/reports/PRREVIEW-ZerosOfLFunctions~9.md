# Review of ZerosOfLFunctions (pull request #1913 at bcf861a)

**Verdict:** needs changes

Incremental re-review of the 119 lines of `TauCetiRoadmap/ZerosOfLFunctions/` changed since `4762be5`
(two commits: the repairs of the previous review's R01 and R03, then 27 inline citations of two Lean
projects, PrimeNumberTheoremAnd and IEANTN, with two References entries). Pins: Mathlib and Tau Ceti
as in the worktree's `lake-manifest.json`, unchanged since the previous review. The gate passes,
the build is clean, and nothing outside the folder changes. Previous R01 and R03 are repaired, and
previous R02 is not. The new citations have two problems: several of them name a project that
does not state what it is cited for (R02), and none of them has a locator (R03). All three findings
are P3, so none blocks.

## R01 (P3) — The pull request's title, description and merge order are still stale, and no order is stated against #1907

**Location.** The pull request's title and description (data, as the worker quotes them): "effective
statements under the exclusion of Landau–Siegel zeros"; "Merge order: after AnalyticNumberTheoryPartI
(#1126) lands, since the strengthened statements refer to its §0.34."

**Claim.** The description says this pull request restates the roadmap's statements in effective
form, that it depends on AnalyticNumberTheoryPartI, and that it merges after it. It names no other
pull request.

**Witness.** The folder contains none of the strengthened statements. `merge-order/ORDER.txt` puts
`ZerosOfLFunctions` at line 48 and `AnalyticNumberTheoryPartI` at line 49, and the latter consumes this
roadmap, so following the stated order would merge this roadmap after its own consumer. The worker's
overlap list reports #1907 (head `8d25d6d`, "direct Dirichlet selected-zero interfaces"), which
conflicts with this head in `README.md` and `Suggested.lean`. Neither pull request names the other.

**Repair.** Rewrite the title and description so that they describe this head:
- the four Mathlib name repairs, the 3.3 locator and the "Downstream consumers" bullet;
- targets 1.3a, 1.4a, 5.6a and the off-axis bounds of 6.4d;
- the two `ζ` lemmas in `Suggested.lean`;
- the PrimeNumberTheoremAnd and IEANTN provenance.

Then drop the "merge after AnalyticNumberTheoryPartI" paragraph and state the order against #1907:
whichever of the two merges second is rebased on the other. Nothing changes in the README; a README
does not name pull requests.

## R02 (P3) — Several of the new citations name a project that does not state what it is cited for

**Location.** `README.md` lines 470 (1.2), 480 (1.3), 516 (1.4), 532 (1.4a, IEANTN), 896–897 (4.1),
924 (4.2), 969 (4.5), 1336 (7.1), 1397 (7.3), 1417 (7.4), 1647 (8.7). The References entries are at
lines 1852–1856.

**Claim.** Each citation sits in the locator parentheses of a statement and claims that the named
project states that statement.

**Witness.** I downloaded both repositories at their current heads (PrimeNumberTheoremAnd
`127b50e3`, IEANTN `466b41b2`) and grepped them by object, not by name. For each of these
citations, the nearest thing either project contains is a different statement:

| § | Cited for | What the project has (file, declaration) | Mismatch |
| --- | --- | --- | --- |
| 1.2 | `logGamma δ s = (s − 1/2) log s − s + log(2π)/2 + O(1/‖s‖)` on `S_δ` | PNT `Mathlib/Analysis/SpecialFunctions/Gamma/StripBounds.lean:348` `stirling_bound_re_ge_zero`: `‖Γ s‖ ≤ exp (C‖s‖ log(1 + ‖s‖))` for `0 ≤ Re s`, `1 ≤ ‖s‖` | An upper bound only. No asymptotic, no `log Γ` branch (grep "Stirling", "logGamma": nothing else). |
| 1.3 | `log‖Γ(σ+it)‖ = (σ − 1/2) log|t| − π|t|/2 + log(2π)/2 + O(1/|t|)`, uniformly for `σ ∈ [a, b]` | PNT `…/Gamma/CriticalLineDecay.lean:38` `gamma_half_vertical_norm_sq`: `‖Γ(1/2 + iτ)‖² = π/cosh(πτ)` | Covers only `σ = 1/2`. |
| 1.4 | `ψ(s) = log s + O(1/‖s‖)` on `S_δ`; `logDeriv Gammaℝ s = ψ(s/2)/2 − (log π)/2`, and the `Gammaℂ` analogue | PNT `…/Gamma/DigammaSeries.lean:726` `exists_norm_digamma_le_log`: `‖ψ z‖ ≤ C log(|Im z| + 2)` on `a ≤ Re z ≤ b`, `0 < a` | A strip bound, not the asymptotic. No `logDeriv Gammaℝ` or `deriv Gammaℝ` anywhere (grep: no match). |
| 1.4a (IEANTN) | the symmetric form "integers included" | IEANTN `IEANTN/Nodes/ZetaLogDeriv/v1/Conclusions.lean:81` `logDeriv_functional_equation`: the asymmetric `tan`/`ψ(s)` form, assuming `∀ n : ℕ, s ≠ −n` and `cos(πs/2) ≠ 0` | This is the asymmetric form that the same paragraph credits to Mathlib's `logDeriv_riemannZeta_one_sub`. It excludes `s = −1`, where the symmetric target applies (`ζ(−1) = −1/12`, `ζ(2) ≠ 0`). |
| 4.1 | *divisorCount* `f U R`, `zeroCount f U R` for meromorphic `f` on `U` and a region `R` | IEANTN `IEANTN/Vocabulary/Zeta.lean:49, 56` `zetaZeroesSum`, `zetaN`; PNT `PrimeNumberTheoremAnd/IEANTN/ZetaDefinitions.lean:137` `riemannZeta.N` | All three are `ζ`-only `tsum`s over `Ioo 0 T`. At `T = γ₁ = 14.1347…` they give `0`, where the README's convention ("a zero at height `T` counted") gives `1`. |
| 4.2 | `divisor (entireCompletion d) univ = divisor Λ univ + polarOrder` for a record | PNT has no record (grep `polarOrder`, `entireCompletion`, `HasMeromorphicContinuation`: no match). The nearest is `…/SpecialFunctions/CompletedXi.lean:66` `riemannXi_eq_mul_completedRiemannZeta` | A pointwise identity off `0, 1`, for `ζ` only. No divisor statement. |
| 4.5, 7.4 | `N(T) = O(T log q)`, the local count, Riemann–von Mangoldt for `ζ` | PNT `PrimeNumberTheoremAnd/IEANTN/Kadiri.lean:2618` `backlund_bound` is `sorry` ("To be formalised"), over `Ioo 0 T`. The only proved count is `Backlund/ZeroCountCrude.lean:1101` `zetaCounting_crude_majorant`: `|N(T)| ≤ A T^{3/2}` | A `sorry`ed statement does not support the claim, and `T^{3/2}` is weaker than `T log T`. |
| 7.1 | *rectBoundary* `R : ℝ → ℂ` on `[0, 4]` with breakpoints `1, 2, 3` | PNT `ResidueCalcOnRectangles.lean:47` `RectangleIntegral`: a signed sum of four edge integrals; `Rectangle.lean:35` `RectangleBorder`: a set | Different design. No parametrised curve. |
| 7.3 (IEANTN) | *S* `(T)`: `π⁻¹` times the argument variation along `2 → 2 + iT → 1/2 + iT` | IEANTN `IEANTN/Vocabulary/Zeta.lean:79` `zetaS t = (1/π) Im ∫_{1/2}^{∞} (ζ'/ζ)(σ + it) dσ` | That integral is `−arg ζ(1/2 + it)`, so `zetaS = −S`. As `t → 0⁺`, the Poisson-kernel part `∫ t/((σ−1)² + t²) dσ → π` gives `zetaS → +1`, while 7.3's own Check gives `S(T) → −1`. |
| 8.7 | `primeCounting_progression_effective`, error `O(x exp(−c√log x))` | PNT `Wiener.lean:4025` `WeakPNT_AP`: `∑_{n ≤ N, n ≡ a (q)} Λ(n)/N → 1/φ(q)` | Qualitative `o(x)` only. |

**Repair.**
- Delete the PrimeNumberTheoremAnd citation at 1.2, 1.3, 1.4, 4.2, 4.5, 7.1, 7.4 and 8.7, and the
  IEANTN citation at 1.4a and 7.3. Keep the textbook and DLMF locators already there.
- At 4.1, delete both citations. If the `ζ` counts are kept as prior art, name them with the clause
  "for `ζ` only, over `Ioo 0 T`".
- If the author wants to keep 7.3's link to IEANTN, write "IEANTN's `zetaS` is `−S`".
- Rerun on the refuting instances: after the repair, 1.4a cites only PrimeNumberTheoremAnd's
  private `functional_eq_correct_sign` (`PrimeNumberTheoremAnd/IEANTN/Kadiri.lean:661`). At
  `s = −1` all its hypotheses hold (`s ≠ 0, 1`, `ζ(−1) ≠ 0`, `ζ(2) ≠ 0`, `s/2 + 1 = 1/2`,
  `(1 − s)/2 + 1 = 2`), and its conclusion
  `−ζ'/ζ(s) = −log π + ζ'/ζ(1 − s) + (ψ(s/2) + ψ((1 − s)/2))/2` is 1.4a's identity rearranged.
  7.3 then cites nothing whose sign contradicts its Check.
- Shorten the "cited for" lists of References (lines 1852–1856) to match.

## R03 (P3) — None of the project citations has a locator or a commit

**Location.** All 27 inline citations (`README.md` lines 470–1647, listed under R02 and below), and
the References entries at lines 1852–1856. An entry reads "PrimeNumberTheoremAnd, Lean project,
<url> — cited for §§1.2, …".

**Claim.** Every claim carries an exact locator into a legal source.

**Witness.**
- A bare project name points to 281 files (PrimeNumberTheoremAnd) or 714 files (IEANTN) at heads
  pushed on 2026-11-06 and 2026-11-02, with no commit given.
- I needed a grep of each downloaded tree to settle each citation. Even where a project does support
  the statement, the declaration can be private (`functional_eq_correct_sign`), `ζ`-only where the
  README is general (5.6, 8.2, 8.4), or a `sorry`.
- The repository's porting guidance (top-level `README.md`, "Porting existing work") puts any
  file-by-file map in a clearly secondary provenance section.
- The two works are not in the board manifest (`packages/ZerosOfLFunctions/sources.toml` records
  only `trudgian2015`, `dlmf5`, `kadiri2012`).

**Repair.**
- Fix each project to a commit in References.
- Add a short provenance list under References: one line per section giving the file and
  declaration, and the clause "the `ζ` case" or "the `K = ℚ` case" where the README is more general.
  In the prose, keep at most "(PrimeNumberTheoremAnd; see References)".
- These are the locators I confirmed at the commits above, which the author can use as they stand:
  - 1.4a `functional_eq_correct_sign` (private; `PrimeNumberTheoremAnd/IEANTN/Kadiri.lean:661`);
  - 5.2 `Complex.weierstrassFactor` at `m = 1` (`Mathlib/Analysis/Complex/WeierstrassFactor.lean:52`);
  - 5.3 `canonicalProduct` (`Mathlib/Analysis/Complex/CanonicalProduct.lean:33`) and
    `differentiable_divisorCanonicalProduct_univ` (`…/HadamardFactorization.lean:78`);
  - 5.5, `ζ` case: `riemannXi_hadamard_factorization` (`Mathlib/NumberTheory/LSeries/RiemannZetaHadamard.lean:331`);
  - 5.6, `ζ` case: `logDeriv_riemannXi_eq_polynomial_derivative_add_tsum` (same file, line 244);
  - 5.6a: `summable_riemannXi_divisorZeroIndex₀_norm_inv_sq` (same file, line 186). It gives the
    ordinate form, since `1/(1 + γ²) ≤ 1/‖ρ‖²` for `0 ≤ Re ρ ≤ 1`;
  - 6.2, `|Im ρ| ≥ 2` only: `ZeroInequality` (`StrongPNT.lean:2214`);
  - 7.2: `rectangleIntegral_logDeriv_eq_sum_meromorphicOrderAt` (`RectangleArgumentPrinciple.lean:276`);
  - 8.4, `ζ` only, Kadiri's Theorem 3.1 at `q = 1` with a Laplace-transform test class: the
    `kadiri-thm-3-1-q1` block (`PrimeNumberTheoremAnd/IEANTN/Kadiri.lean:1305`);
  - 8.5, in the `ψ` form at `K = ℚ`: `StrongPNT` (`StrongPNT.lean:2895`).
- I did not locate 4.3 (the trailing-coefficient Jensen form), 5.4, 6.4d and 8.2. The author gives
  each a declaration or deletes the citation.
- The worker records both works, with the commit, in `sources.toml`.

## Previous findings

- R01 — repaired: `Suggested.lean` has no Layer 1 section and 13 theorems. README line 540 reads
  "whose right side is `log π − ψ(s/2)/2 − ψ((1 − s)/2)/2` by 1.4. The hypotheses keep `s` and
  `1 − s` off the poles…", with no backticked name. The docstring says "two lemmas".
- R02 — not repaired: the title is still "effective statements under the exclusion of Landau–Siegel
  zeros", the description still says "Merge order: after AnalyticNumberTheoryPartI (#1126) lands",
  and #1907 is not named. Restated as R01 above.
- R03 — repaired: README line 1156 reads "5.6a additionally Layers 1.5 and 4.2, Layer 0
  *entireCompletion* and L-functions Layer 0", and line 1323 reads "L-functions Layers 3, 5, 7, 8.
  Layers 1.4–1.6, 2, 4, 5.6."

## Verified sound

**Gate.** My run of the push gate on `bcf861a`: `set_option=0 … depcheck=0 metadata=0 stray-files=0
dirty=0 outside-folder=0 source-material=0 OK`. `git diff --stat origin/main...HEAD` outside the
folder is empty. Dependency check:

```text
depcheck: 239 roadmaps, 2354 edges, 0 problem(s)
```

There are no UPWARD, CYCLE or `moved:` lines. The merge order lists this roadmap at line 48, after
`LFunctions` (line 27).

**Elaboration and signatures.** `lake env lean TauCetiRoadmap/ZerosOfLFunctions/Suggested.lean`
exits `0` with exactly 13 "declaration uses `sorry`" warnings and nothing else. A scratch copy with
`#check @name` for all 16 declarations elaborates without error. The 16 elaborated types coincide
with the worker's `signatures.md` and with the README statements, and nothing changed relative to
the previous review except the removed theorem: no lost section binder, `[NeZero q]` is inside each
quantifier, and `primeIdealCount_effective` carries `[Field K] [NumberField K]`. The file has one
`import Mathlib`, no `set_option`, no sorried data, and uses `theorem` throughout.

**Headlines and padding.** The headline list is unchanged from the previous review (3.4, 5.5, 5.6a,
6.2, 6.4, 6.4d, 7.4, 7.5, 8.3, 8.4, 8.5, 8.7 at `K = ℚ`), and every headline statable at the pins is
stated. The docstring's "Not statable" paragraph is unchanged.

**One-tactic probe.** I replaced each of the 13 sorried theorems by
`first | rfl | (simp; done) | infer_instance | (norm_num; done)`. The result is 13 errors and none
closes, so there is no padding.

**Changed passages.**
- The 1.4a hunk only removes the backticked name and adds the citation. The route and its Mathlib
  inputs are unchanged and were opened last round.
- The Layer 5 and Layer 6 Dependencies cover every `*Needs:*` item of their layers. Layer 5's 5.6a
  needs `{5.3, 3.1, 1.5, 4.2, entireCompletion, L-functions 0, 3, 5}`, which lies inside lines 1154–1156.
  Layer 6's union is `{6.1, 5.6, 1.4, 2.2, Layer 4, 1.5–1.6, L-functions 5, 7, 8, Global Number
  Fields 2}`, which lies inside line 1323.
- The diff adds no Mathlib, Tau Ceti or cross-roadmap name, so there is nothing new to resolve.

**Sources (the seeded sample, where it falls in the changed passages).**
- 1.3: `dlmf5` line 492 (5.11.9) ✓. The PrimeNumberTheoremAnd citation fails (R02).
- 1.4: `dlmf5` line 160 (5.11.2, `ψ(z) ∼ ln z − 1/(2z) − …`) in the sector of line 104
  (`|ph z| ≤ π − δ`) ✓. The PrimeNumberTheoremAnd citation fails (R02).
- 1.4a: PrimeNumberTheoremAnd ✓ (R03 locator). IEANTN fails (R02).
- 4.1: both fail (R02).
- 4.2: fails (R02).
- 5.3: PrimeNumberTheoremAnd ✓ (R03 locator).
- 5.6a: ✓ (R03 locator).
- 7.1: fails (R02).
- 7.3: IEANTN fails (R02).
- Outside the sample, 1.2's `dlmf5` line 108 (5.11.1) ✓.
- 1.1, 1.3a, 3.5, 6.1, 8.1 and 8.8 are untouched by the diff, and their locators were checked in
  the previous review.

**Overlaps and ownership.** The worker's overlap list shows #1907 conflicting (R01). No id this README
cites is dropped by an open pull request, and this pull request drops no id. The change adds no
object, so ownership is as settled in the previous review.

**Adversarial table.** The table has two parts. The first carries forward the previous report's rows
for statements the diff leaves untouched, with their values. The second has new rows for the changed
passages.

| Statement | Instances tried | Values | Result | Change |
| --- | --- | --- | --- | --- |
| 1.3a (carried) | `Re s = 1/2`; `s = 3/2, 3` | `‖Γ(1/2+it)‖² = π/cosh πt ≤ π`; `Γ(3/2) = 0.886 < 1`; `Γ(3) = 2 > 1` | sound | none |
| 1.4a conjugation (carried) | `s = i` | `Im ψ(i) = 2.0767`, `ψ(−i) = conj ψ(i) ≠ ψ(i)` | sound | none |
| 1.4a symmetric form (README only now) | `s = 2`; `s = −1`; `s = −2` | both sides `1.41509` at `s = 2` and at `s = −1`; at `s = −2` the left side is junk (`0 + ζ'/ζ(3) = −0.1648`, right side `0.5541`), excluded by `ζ(s) ≠ 0` | sound | none |
| 5.6a / `riemannZeta_zeros_summable_ordinate` (carried) | `1/Γ(s+1/2)`; trivial zeros; `ρ₁` | divergent ordinate families as stated; `2/(1+14.1347²) = 0.00996` | sound | none |
| 6.4d / `neg_re_logDeriv_riemannZeta_le` (carried) | `t → 0`, `δ = 2|t|`; `δ ≥ 1` | `1/(4|t|)` against `log|t| → −∞`; `−ζ'/ζ(2) = 0.5700` | sound | none |
| 3.3, 3.4, `dirichletLFunction_convexity` (carried) | `ζ`, `Re s = −δ`; `q = 1`, `t = 0` | edge exponent `1/2 + δ`; `|ζ(1/2)| = 1.4604 ≤ C·3^{1/4+ε}` | sound | none |
| `hadamard_of_orderLE_one` (carried) | `1 − s`; `exp(z²)` | `a = 0, b = −1`; order 2 fails `OrderLE _ 1` | sound | none |
| zero-free regions (carried) | `s = 1/2`; mod-2 principal at `0` | `ζ(1/2) ≠ 0`; `0 < 1 − c/log 6` | sound | none |
| `riemannVonMangoldt`, `_dirichlet` (carried) | `T = 14, 100`; `q = 1` | `0` vs `−0.443`; `29` vs `28.12`; `58` vs `56.25` | sound | none |
| `chebyshevPsi_explicitFormula`, Weil, 8.5, 8.7, 8.9 (carried) | `K = ℚ`; `x = T = 2`; `q = 4`; `x = 10⁶` | `c_ℚ = −log 2π`; `C ≥ 1.44`; main term `Li x/2`; `Li − x/log x = 6244` | sound | none |
| 1.2 cite PrimeNumberTheoremAnd | `s = 10` | `log Γ(10) = 12.801827`; Stirling `12.793497`; difference `0.008330 ≈ 1/120`. The project gives only `‖Γ(10)‖ ≤ exp(C·10·log 11)` | not in project | R02 |
| 1.3 cite PrimeNumberTheoremAnd | `σ = 1/2`; `σ = 1` | `log‖Γ(1/2+iτ)‖ = ½ log 2π − π|τ|/2 + O(e^{−2π|τ|})` matches 1.3 and is in the project; `|Γ(1+iτ)|² = πτ/sinh πτ` gives `½ log|τ| − π|τ|/2 + ½ log 2π`, which matches 1.3 but is not in the project | only `σ = 1/2` | R02 |
| 1.4 cite PrimeNumberTheoremAnd | `z = 10`; `s = 2` | `ψ(10) − ln 10 = −0.050833 = −1/20 − 1/1200` (5.11.2 ✓); `logDeriv Gammaℝ 2 = ψ(1)/2 − (log π)/2 = −0.860973`; the project has neither | not in project | R02 |
| 1.4a cite IEANTN | `s = 2`; `s = −1` | IEANTN's asymmetric form at `s = 2`: `−1.985053 + 1.837877 − 0.422784 + 0 = −0.569960 = ζ'/ζ(2)` ✓; at `s = −1` its hypothesis `s ≠ −1` fails, while the symmetric target holds there | different statement | R02 |
| 1.4a cite PrimeNumberTheoremAnd | `s = −1` | hypotheses `ζ(−1) = −1/12 ≠ 0`, `ζ(2) ≠ 0`, `s/2 + 1 = 1/2`, `(1−s)/2 + 1 = 2` hold; conclusion = 1.4a rearranged | supported | R03 locator |
| 4.1 cite both | `T = γ₁ = 14.134725` | README `zeroCount` over `Ioc 0 T`: `1`; `zetaN`/`riemannZeta.N` over `Ioo 0 T`: `0` | convention differs, `ζ` only | R02 |
| 5.6a cite PrimeNumberTheoremAnd | `ρ₁ = 1/2 + 14.134725 i` | `1/(1+γ²) = 0.0049803 ≤ 1/‖ρ‖² = 0.0049990` | ordinate form follows | R03 locator |
| 7.1, 7.2 cite PrimeNumberTheoremAnd | `f = 1/(s − c)`, `c` inside; README's `f = z − 2`, `S = {2}` | `RectangleIntegral'` gives `1` (counterclockwise ✓); PNT's 7.2 sums the divisor on the rectangle only, so `0` ✓; no curve on `[0, 4]` | 7.2 supported, 7.1 not | R02, R03 |
| 7.3 cite IEANTN | `t → 0⁺`; `t = 10` | `S → −1` (README Check), `zetaS → +1`; `S(10) = −1 − θ(10)/π = −1 + 0.97629 = −0.0237`, `zetaS(10) = +0.0237` | opposite sign | R02 |
| 8.7 cite PrimeNumberTheoremAnd | `q = 4`, `a = 3` | `WeakPNT_AP`: limit `1/φ(4) = 1/2` of `ψ(x;4,3)/x`; no rate | qualitative only | R02 |
| Layer 5, 6 Dependencies | `*Needs:*` lines of 5.1–5.6a, 6.1–6.5 | every item inside lines 1154–1156 and 1323 (sets above) | complete | none |

## Not verifiable

- Davenport, *Multiplicative Number Theory*; Titchmarsh, *The Theory of the Riemann Zeta-Function*;
  Lang, *Algebraic Number Theory*; Iwaniec–Kowalski §§5.1–5.2; Lagarias–Odlyzko. These are as in
  the previous review (paywalled, or the cached copy is not a legal or complete text). The diff
  changes none of their locators.
- PrimeNumberTheoremAnd at 4.3, 5.4, 6.4d and 8.2. These are legal (Apache-2.0, public), but a
  grep of the tree at `127b50e3` by object did not find the cited statement. The author supplies
  the declaration (R03).

## Source issues

- **Error** in IEANTN at `IEANTN/Vocabulary/Zeta.lean`, definition `zetaS` (commit `466b41b2`): the
  source says `S(t) = (1/π) Im ∫_{1/2}^{∞} (ζ'/ζ)(σ+it) dσ`, which is `−π⁻¹ arg ζ(1/2+it)`; it should
  be `−(1/π) Im ∫_{1/2}^{∞} (ζ'/ζ)(σ+it) dσ`; affects nothing.
