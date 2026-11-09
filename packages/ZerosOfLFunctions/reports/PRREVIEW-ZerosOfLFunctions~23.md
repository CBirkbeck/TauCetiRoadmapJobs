# Review of ZerosOfLFunctions (pull request #1913 at e39fba2)

**Verdict:** needs changes

This is an incremental re-review of the 89 lines of `TauCetiRoadmap/ZerosOfLFunctions/README.md` that changed since `acedbec`. `Suggested.lean` did not change.

- **Previous findings.**
  - R02 (1.1 uniqueness and simple connectivity) is repaired.
  - R03 (8.8's exceptional-term Checks) is repaired.
  - R01 (the pull request's title, description and order against #1907) is not repaired. It is carried below as R01.
- **The repairs.** Neither repair introduces a defect. Every new value was recomputed (table below), and every newly cited declaration elaborates at the pins.
- **Gate.** The gate passes, and the dependency check reports 0 problems.

Paths: `TauCeti/…` is a file of the Tau Ceti pin `2fd255d9`, and `Mathlib/…` a file of the Mathlib pin `1b1ccf4b`. Other roadmaps are read on main (`623f5d69`) unless a pull request is named.

## R01 (P3) — The title, description and merge order are stale, and no order is stated against #1907 (previous R01, not repaired)

**Location.** The pull request's title is "effective statements under the exclusion of Landau–Siegel zeros". Its description says the statements are restated in "unconditional, effective form" and asks to merge "after AnalyticNumberTheoryPartI (#1126) lands".

**Claim.** The description matches this head, and the order against the other open pull request on this roadmap is settled.

**Witness.**
- README lines 87–88 exclude "the nonexistence of exceptional zeros", and lines 2270–2271 keep "the exceptional-zero alternative of 6.3–6.4". No line cites AnalyticNumberTheoryPartI §0.34.
- AnalyticNumberTheoryPartI is on main, at `ORDER.txt` line 50, after this roadmap's line 48.
- `roadmaps overlaps` reports that #1907 (head `123254c`) and #1913 conflict in both files. #1907's `Suggested.lean` declares the same names with different statements:
  - `heckeLFunction_zeroFreeRegion` (line 164) conjoins the two clauses;
  - `rayClassPrimeCount_effective (n : ℕ)` (line 338) chooses `c` before `K`, where this head (line 307) fixes `K` first;
  - `frobeniusPrimeCount_effective_abelian` (line 366) uses `K L : Type`, where this head (line 337) uses `Type*`.

**Repair.**
1. Retitle the pull request and describe this head: the general-field headlines at the pin, and the consumed Tau Ceti holomorphic logarithm and image lemmas.
2. Delete the merge-order sentence about AnalyticNumberTheoryPartI.
3. State which of #1913 and #1907 is rebased on the other. The rebased one reconciles the three statements above.

**Test.** The new description agrees with README lines 87–88 and 2270–2271. After the rebase, `roadmaps overlaps ZerosOfLFunctions` reports no conflict between the two heads.

## Previous findings

- R01 — not repaired: the description still reads "effective statements under the exclusion of Landau–Siegel zeros … after AnalyticNumberTheoryPartI (#1126) lands"; `roadmaps overlaps` still reports "#1907 and #1913 conflict". Carried as R01.
- R02 — repaired: 1.1 (lines 566–571) reads "the sector is open and preconnected and `h 2 = 0`, so `h = 0` on it by `IsOpen.is_const_of_deriv_eq_zero`"; simple connectivity cites `TauCeti.isSimplyConnected_image_of_differentiableOn_of_injOn` (lines 552–554, 223–227).
- R03 — repaired: 8.8 (lines 2121–2145) adds three conditional Checks: only `ζ_K` exceptional (`x^β/(β #G)`, fibre sum, wrong-weight and omitted-trivial models), quadratic `±x^β/(2β)`, and the `(4)∞`/`(8)∞` dictionaries for `ℚ(i)`.

## Verified sound

### Gate, dependency check and elaboration

- **Gate.** My run prints every check at 0 and ends with `outside-folder=0 source-material=0 OK`. The worker's gate on this head (`build=0` included) also passes.
- **Outside the folder.** `git diff --stat origin/main...HEAD` outside the folder is empty.
- **Dependency check.** It exits 0 and prints no UPWARD, CYCLE or `moved:` line:

```text
depcheck: 237 roadmaps, 2283 edges, 0 problem(s)
```

- **Elaboration.** `lake env lean TauCetiRoadmap/ZerosOfLFunctions/Suggested.lean` exits 0 with exactly 17 "declaration uses `sorry`" warnings (lines 97–337) and no other message.
- **`#check` comparison.**
  - I built a scratch copy that adds `TauCeti.Analysis.Complex.Conformal.ImageSimplyConnected` and `TauCeti.Analysis.Complex.BranchLogRoot`, with `#check @…` for all 20 declarations. It elaborates with 0 errors.
  - All 20 elaborated types match `signatures.md` after whitespace normalization. Nothing changed, as expected for an unchanged file.
- **Headline theorems and padding.** These carry over from the previous report, since `Suggested.lean` is unchanged. The 17 headline theorems are stated and no padding was found. Each is listed in the table below.

### The repair of 1.1 (previous R02), checked at the pins

- **Tau Ceti.**
  - `TauCeti.isOpen_image_of_differentiableOn_of_injOn` (`TauCeti/Analysis/Complex/Conformal/ImageSimplyConnected.lean:56`) takes `IsOpen Ω`, `DifferentiableOn ℂ g Ω` and `InjOn g Ω`, and gives `IsOpen (g '' Ω)`.
  - `TauCeti.isSimplyConnected_image_of_differentiableOn_of_injOn` (`:95`) takes the same hypotheses plus `IsSimplyConnected Ω`. These are exactly the hypotheses 1.1 discharges for `g = exp` on `Ω_δ`.
  - `TauCeti.exists_differentiableOn_eqOn_exp_comp` (`TauCeti/Analysis/Complex/BranchLogRoot.lean:173`) needs `IsSimplyConnected U`, `IsOpen U`, `DifferentiableOn ℂ g U` and `0 ∉ g '' U`. The new lemmas supply the first two at `U = S_δ`.
- **Mathlib.**
  - `IsOpen.is_const_of_deriv_eq_zero` (`Mathlib/Analysis/Calculus/MeanValue.lean:767`) needs `IsOpen s`, `IsPreconnected s`, `DifferentiableOn 𝕜 f s` and `s.EqOn (deriv f) 0`. The global `is_const_of_deriv_eq_zero` (`:751`) needs `Differentiable 𝕜 f`, as the new text says.
  - `Complex.log_exp` (`Mathlib/Analysis/SpecialFunctions/Complex/Log.lean:54`) needs `−π < Im x ≤ π`, which `|Im w| < π − δ` gives. `Complex.exp_log` (`:41`) needs `x ≠ 0`.
  - `Convex.isPreconnected` (`Mathlib/Analysis/Convex/PathConnected.lean:97`) and `IsPreconnected.image` (`Mathlib/Topology/Connected/Basic.lean:294`).
  - `Convex.contractibleSpace` (`Mathlib/Analysis/Convex/Contractible.lean:36`) also needs `s.Nonempty`, which holds since `1 ∈ Ω_δ`. `SimplyConnectedSpace.ofContractible` is an instance (`Mathlib/AlgebraicTopology/FundamentalGroupoid/SimplyConnected.lean:82`), and `IsSimplyConnected s` unfolds to `SimplyConnectedSpace s` (`:137`).
  - All of these, and `Complex.exp_eq_exp_iff_exists_int`, `Complex.differentiableAt_Gamma` and `Complex.Gamma_ne_zero`, elaborate in the probe.
- **Lean probe.** In the scratch copy, Lean proves two of 1.1's facts:
  - `Convex ℝ {w : ℂ | 0 < w.re ∧ |w.im| < π − δ}`;
  - `arg (exp w) = Im w` for `|Im w| < π`, from `Complex.log_exp`.
- **Removed citation.** `Topology.IsEmbedding.isSimplyConnected_image` no longer occurs in the README; the pinned Tau Ceti lemma packages it.

### The repair of 8.8 (previous R03), checked

- **Check 1 (only `ζ_K` exceptional).** The fibre sum of 8.7's term (lines 1996–1999) is `#ker Φ/#Cl_𝔪 = 1/#G`. Characters at `𝔪` that do not factor through `Φ` sum to `0` over each fibre, so the stated value holds even when they have exceptional zeros. The class sum `x^β/β` is 8.5's term (line 1937).
- **Check 2 (quadratic `L/K`).** The weight is `(1/2)·ψ(σ) = −1/2`, against `−1` for the weight-`1` model. "Inert" is right: a prime with Frobenius `σ` in a quadratic extension is unramified and not split.
- **Check 3 (`ℚ(i)` at `(4)∞` and `(8)∞`).**
  - `Cl_{(8)∞}(ℚ) = (ℤ/8)ˣ`, and `ker Φ = {1, 5}`, the units `≡ 1 (mod 4)`.
  - `χ₈(5) = (2/5) = −1` and `χ₋₈(5) = (−2/5) = −1`, while `χ₋₄(5) = 1`.
  - `ζ < 0` and `L(·, χ₋₄) > 0` on `(0, 1)`, so both exceptional sets are empty.
  - Previous R03 asked for exactly these three Checks, in 8.7's conditional style.
- **Consistency with 8.7.** 8.7's term uses `Re ψ(c)` and 8.8's uses `conj ψ(σ_C)`. They agree because only real characters carry exceptional zeros (6.3, line 1502).

### Sources: seeded sample

- **Changed passages.** Of the sampled targets, only 8.8 (its Checks) falls in the changed passages, with 8.7 and 8.5 cited by them. The new Checks carry no locator. 8.8's Lagarias–Odlyzko Theorems 1.3 and 9.2 (line 2099) are unchanged and cited by locator.
- **The other sampled targets.** These are 0.2, 1.3, 2.1, 2.3, 2.4, 4.2, 4.4, 5.3, 5.5, 6.5, 7.2, 8.4, 8.7 and 8.9, all untouched by the diff. Their locators were checked in the previous report. I recomputed their mathematics; the values are in the table.
- **Unverified flags.** The README flags no locator as unverified.

### Ownership and citations

- **`logGamma` on a sector.** `roadmaps grep` over main and the 459 open heads finds no second owner. AnalyticNumberTheoryPartII (#1167) cites "ZerosOfLFunctions Layer 1 … the sector branch" as a consumer.
- **`citations.md` leads (13).**
  - Six names are in the Provenance table (README 2285–2288). They are PrimeNumberTheoremAnd names, outside the pins by design.
  - Seven are L-functions Layer 6 names (README 396–399). All resolve in `TauCetiRoadmap/LFunctions/Suggested.lean` on main, at lines 2390–2453.
- **Overlaps.** `overlaps.md` reports no dropped id and no revision-only id. #1907 is R01.

### Adversarial table

The values were computed this round in pure Python (Lanczos `Γ`, the Stirling series with recurrence, the Cohen–Rodriguez Villegas–Zagier alternating-series acceleration, and the series for `li`), with Lean `#check` and the scratch proofs above. Rows marked "r22" are carried from the previous report (PRREVIEW-ZerosOfLFunctions~22) for statements this diff leaves untouched.

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| 1.1 `S_δ = exp '' Ω_δ` (changed) | `δ = 0.5`: `w = 0.3 + 2.5i`; `w = 0.3 + 3i`; `w = 0.01 − 2.6i` | `‖exp w‖ = 1.349859`, `arg = 2.5 < 2.6416`, in both sets; `arg = 3.0`, in neither; `‖exp w‖ = 1.010050 > 1`, `arg = −2.6`, in both; `log (exp w) = w` each time | sound | none |
| 1.1 branch (changed) | `logGamma` at `3`, `3 + 4i`, `1 + 10i`, `−5 + 2i` (in `S_δ` iff `δ < 0.380506`) | `0.693147`; `−1.756627 + 4.742664i` against principal `−1.756627 − 1.540521i`, `k = 1`; `k = 2`; `k = −2`; `exp(branch)/Γ = 1.00000000` at all four | sound | none |
| 1.1 uniqueness (changed) | `δ = 0.5 ≤ δ' = 1`; poles | `S_1 ⊆ S_0.5`, `h 2 = 0`; `‖0‖ = 0`, `‖−1‖ = 1`, `arg(−n) = π`, so no pole lies in any `S_δ`; global lemma needs `Differentiable ℂ h` (MeanValue `:751`) | sound | none |
| 1.1 contracts (changed) | the 9 newly cited names | all elaborate; hypotheses `IsOpen`, `IsSimplyConnected`, `DifferentiableOn`, `InjOn`, `Nonempty` discharged as stated | sound | none |
| 8.8 Check 1 (changed) | `#G = 2`, `𝔪 = (8)∞`; `x = 10⁶`, `β = 0.9` | fibre `2 · 1/4 = 0.5 = 1/#G`; `x^β/β = 279098.492`, per class `139549.246`, total `279098.492`; `Li(x^β)/2 = 11094.292`; omit trivial `0`; weight `1`: `279098.492` per class | sound | none |
| 8.8 Check 2 (changed) | quadratic, `ψ(σ) = −1` | `(1/2)(−1) = −0.5` against `−1` (weight `1`); class sum `0.5 − 0.5 = 0` | sound | none |
| 8.8 Check 3 (changed) | `ζ`, `L(·, χ₋₄)` at `0.5, 0.9, 0.99`; characters mod `8` | `−1.4603545, −9.4301140, −99.4235130`; `0.6676915, 0.7653215, 0.7834614`; `χ₈`: `1, −1, −1, 1`; `χ₋₈`: `1, 1, −1, −1` at `1, 3, 5, 7`; fibre sums over `{1,5}`, `{3,7}`: `0, 0`; single-`c` model at `c = 1` and `5`: `1` and `−1` | sound | none |
| 0.2 (sample, untouched) | `ζE(2)`; `ζE(0)` | `2Λ(2) = 1.047198 = π/3`; `1` | sound | none |
| 1.3 / 1.3a (sample) | r22 | `−14.789025`, `−61.912915`; `π/cosh πt` | sound (r22) | none |
| 2.1 (sample) | `gammaC = {0}` at `0`; `ζ` centre | `(0+3)(1+3) = 12`; `3.5` | sound | none |
| 2.3 (sample) | r22 | `(6+3)(7+3) = 90` against `15.75` | sound (r22) | none |
| 2.4 (sample) | `Δ`, `k = 12` | analytic `1/2`: `90.0`; arithmetic `6`: `90`; unshifted `15.75` | sound | none |
| 4.2 (sample) | `ζ` record at `0`, `−2` | divisor `−1 + polarOrder 1 = 0` (`ζE(0) = 1`); `0` at `−2` | sound | none |
| 4.4 (sample) | `Gammaℝ(2 + 100i)` | `log ‖Γ(1 + 50i)‖ = −75.665` against `−πT/4 = −78.540`: the `exp(πnT/4)` loss is real | sound | none |
| 5.3 (sample) | `cos` at `z = 1` | paired product `0.540303` against `cos 1 = 0.540302` | sound | none |
| 5.5 (sample) | `logDeriv cos` at `0.5` | `∑ 2s/(s² − ρ²) = −0.546302 = −tan 0.5`, `a = b = 0` | sound | none |
| 6.5 (sample) | odd character mod `4` at `1` | `2 · (1/π) · (π/4) = 0.5` | sound | none |
| 7.2 (sample) | r22 | `z − 2` on `[−1, 1]²`: `0` against `∑ ord = 1` | sound (r22) | none |
| 8.4 (sample) | `φ = 0`; r22 shift | both sides `0`; residues `+m_ρ φ̃(ρ)`, `−φ̃(0)`, `−φ̃(1)` | sound (r22) | none |
| 8.7 (sample) | `(3)∞`; r22 count | `(1/2)(1 − 1/3) = 1/3`; `39231`, `39266` against `39313.252` | sound | none |
| 8.9 (sample) | r22 | `5.120436 = 4.342945 − 2.885390 + 3.662881` | sound (r22) | none |
| `dirichletLFunction_convexity` | r22 | `‖ζ(½)‖ = 1.4603545`; exponent `¼ + δ/2` | sound (r22) | none |
| `hadamard_of_orderLE_one` | r22 | `1 − s = e^{−s}E₁(s)`; empty product for `exp(cs)` | sound (r22) | none |
| `zetaEntireCompletion_hadamard` | r22 | `ζE(0) = 1`, `B = −0.0230957` | sound (r22) | none |
| `riemannZeta_zeros_summable_ordinate` | r22 | first pair `0.0099606` | sound (r22) | none |
| `heckeLFunction_zeroFreeRegion` | r22 | `c < log 45 = 3.806662` | sound (r22) | none |
| `riemannZeta_zeroFreeRegion` | r22 | `c < 3 log 3 = 3.295837` | sound (r22) | none |
| `dirichletLFunction_zeroFreeRegion` | r22 | `0.69343` at `ρ = 0` | sound (r22) | none |
| `neg_re_logDeriv_riemannZeta_le` | r22 | `−ζ'/ζ(2) = 0.56996` | sound (r22) | none |
| `riemannVonMangoldt` | r22 | `29.0023` against `29` at `T = 100` | sound (r22) | none |
| `riemannVonMangoldt_heckeLFunction` | r22 | `156.636494` at `ℚ(i)` | sound (r22) | none |
| `riemannVonMangoldt_dirichlet` | r22 | `7.3366 = 4.0946 log 6` | sound (r22) | none |
| `chebyshevPsi_explicitFormula` | r22 | `‖x^ρ/ρ‖ ≤ x/T` | sound (r22) | none |
| `riemannZeta_weilExplicitFormula` | r22 | reflection by `y = 1/u` | sound (r22) | none |
| `primeIdealCount_effective` | r22 | `78498` against `78626.504` | sound (r22) | none |
| `rayClassPrimeCount_effective` | r22 | `39231`, `39266` against `39313.252` | sound (r22) | none |
| `primeCounting_progression_effective` | r22 | `39175`, `39322` against `39313.252` | sound (r22) | none |
| `frobeniusPrimeCount_effective_abelian` | r22 | `39322` against `39313.252` | sound (r22) | none |
| #1907 against #1913 (R01) | the three shared names at `123254c` | conjoined clauses; `c` before `K`; `Type` against `Type*` | order unstated | R01 |

### Remarks on untouched text

- 1.1's third Check uses the ray `arg s = π/2`, which lies in `S_δ` only for `δ < π/2`.
- Lagarias–Odlyzko 1977, cited by locator in 8.8 and in References, has no entry in the package's `sources.toml`.

## Not verifiable

- **Paywalled books and papers, cited by locator.** These were not read, and no legal open copy is known. The mathematics of each sampled target was recomputed instead (table above).
  - Davenport §§11–20 (5.3, 5.5, 8.7);
  - Titchmarsh §§9.2–9.4;
  - Lang, *Algebraic Number Theory*, XVII §3, Theorem 3.1 (8.4);
  - Lagarias–Odlyzko 1977, Theorems 1.3 and 9.2 (8.8).
- **Lagarias–Montgomery–Odlyzko 1979, Lemma 2.3.** Settled as uncertified in the manifest.

## Source issues

- none
