# Review of SymmetricHyperbolicSystems (pull request #2246 at 68aa515)

**Verdict:** needs changes

## R01 (P3) — §2.3 names a Grönwall lemma whose hypothesis the energy route cannot supply

**Location:** `TauCetiRoadmap/SymmetricHyperbolicSystems/README.md:393–394`: "Energy estimate: the integrated identity and `norm_le_gronwallBound_of_norm_deriv_right_le`."

**Claim:** That lemma needs the two-sided bound `‖E'‖ ≤ K‖E‖ + ε`. The route at line 365 gives only `E' ≤ ((κ+1)/λ)E + ‖F(t)‖²`, because `K` is bounded only from above. This name came from the previous review's R08 repair text, which was wrong.

**Witness:** Take `A⁰ = 1`, `Aʲ = 0`, `B = 1`, `F = 0`, `λ = 1`, `κ = 0` (so `K = −2`). Then `E = e^{−2t}E₀` and `‖E'‖ = 2E > 1·E + 0`. The lemma's `bound` is `‖f' x‖ ≤ K * ‖f x‖ + ε` (`Mathlib/Analysis/ODE/Gronwall.lean:134`).

**Repair:** Replace the sentence with: "Energy estimate: the integrated identity and `le_gronwallBound_of_liminf_deriv_right_le`, applied on `[0,t]` to `E(s) − ∫₀ˢ ‖F‖²` with `K = (κ+1)/λ` and `ε = K ∫₀ᵗ ‖F‖²`." Tested on the witness: `−2E ≤ E` holds, and the conclusion `E(t) ≤ eᵗE₀` is true. In general, `gronwallBound(E₀, K, ε, t) + ∫₀ᵗ‖F‖²` equals `e^{Kt}(E₀ + ∫₀ᵗ‖F‖²)`, which is line 363.

## R02 (P3) — The description's Layer 7 line still describes an earlier head (previous R09, not repaired)

**Location:** The pull-request description: "7. General A⁰: the smooth square root of positive definite matrices (Mathlib's matrix functional calculus and the inverse function theorem) and normalization."

**Claim:** The head does not prove that the square root is smooth and does not use the inverse function theorem. It takes smoothness from Tau Ceti, and §7.1 is a target about derivative bounds.

**Witness:** `README.md:771–772`: "The square root and `P ↦ P ^ (−1/2 : ℝ)` are `C^k` … (Tau Ceti `Matrix.contDiffOn_sqrt`, `Matrix.contDiffOn_rpow`)". `Suggested.lean:333` declares `exists_bound_iteratedFDeriv_sqrt_comp`.

**Repair:** "7. General A⁰: uniform bounds for the derivatives of the square root of a positive definite matrix-valued function and of its inverse (smoothness from Tau Ceti's `Matrix.contDiffOn_sqrt` and `Matrix.contDiffOn_rpow`), and normalization."

## Previous findings

- R01 — repaired: `README.md:519` "Throughout this layer and Layers 5 and 6, `n ≥ 1`, `A⁰ = 1` and every `Aⁱ(t,x)` is symmetric." The antisymmetric witness is now a Check at 578–581.
- R02 — repaired: `README.md:816–817` "for `S` symmetric hyperbolic with constant `λ` and `A⁰` of class `C¹` (so that `P` is `C¹`)". This matches `hS` and `hA0` of `isClassicalSolution_normalize_iff`.
- R03 — repaired: §1.1 cites Rudin Theorem 9.21 (193). §4.3, §5.1, §5.2, §6.1 and §6.2 cite John 1982, Ch. 5 §3 (b), which is a subsection locator. §3.1–§3.3 say they are elementary and give their proofs. §7.1 and §7.3 say they are assembled from §6.2, §7.1 and §7.2.
- R04 — repaired: `README.md:170–172` "`TauCeti.fwdDiff_iter_smul` (`TauCeti/Algebra/Group/ForwardDiff.lean:102`): the iterated discrete Leibniz rule over a possibly noncommutative ring". Lines 424–427 derive the shifted form, and both overclaims are deleted.
- R05 — repaired: lines 787–794 use `norm_iteratedFDerivWithin_comp_le` on the open set `U = {P | ((P + Pᵀ)/2).PosDef}`, and lines 776–777 add `CFC.sqrt_eq_rpow` and `CFC.rpow_neg`. This also corrects the previous repair text, which called `{P | P.PosDef}` open.
- R06 — repaired: `README.md:703` "they vanish outside `‖x‖_∞ ≤ R₁ = R + 3 + (T + 1)/μ`".
- R07 — repaired: `README.md:253–264` add the six Checks with their computed values for `matDt`, `matDx` and `IsClassicalSolution`.
- R08 — repaired, but with a new problem: lines 391–394 split the *Needs:* line by result. The Grönwall lemma named for the energy estimate does not apply (R01 above).
- R09 — not repaired: the description still reads "the smooth square root of positive definite matrices (Mathlib's matrix functional calculus and the inverse function theorem)" (R02 above).

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §1.1 `contDiffOn_one_of_hasDerivAt_single` (locator added) | `x₁x₂`; `x₁x₂/(x₁²+x₂²)`; `ι = ∅` | `fderiv f x v = x₂v₁ + x₁v₂`; `f(t,t) = ½ ≠ f(0) = 0`; one-point space, so trivially `C¹` | holds; Rudin's 9.21 covers only `ℝⁿ → ℝᵐ`, and the README says so | none |
| §1.2 `matDt`, `matDx` (new Checks) | `t x₁ σ₁`; `P = diag(t,1)`; `|t| • 1` | `x₁σ₁`, `tσ₁`, `0`; `matDt(P²)(1) = diag(2,0) = P'P + PP'`, while `P'P' = diag(1,0)`; `deriv |·| 0 = 0` | match the Lean bodies (lines 61–68) | none |
| §1.2 `IsClassicalSolution` (new Checks) | `|x − t|`; `T = −1`; `u = g(x)` | `−sgn + sgn = 0` off `x = t`, not `C¹` on it; `Icc 0 (−1) = ∅`; `∂ₜu = 0` | holds; existence theorems carry `hT : 0 < T` (lines 294, 392) | none |
| §2.3 energy estimate (*Needs:* changed) | `B = 1`, `F = 0`, `λ = 1`, `κ = 0` | `E' = −2E ≤ E` holds; `‖E'‖ = 2E ≤ E` fails; `e^{−2t}E₀ ≤ eᵗE₀` | statement holds; named lemma does not apply | R01 |
| §3.1 matrix Leibniz rule via Tau Ceti | `a(j) = j`, `v = δ₁`, `j = 0`, `m = 2` | LHS `−2`; README form `0 + 2 − 4`; Tau Ceti form `0 − 2 + 0`; step `−1` at `j + 2` gives `(−1)²·(−2)` | holds | none |
| §3.2 discrete Sobolev (now "elementary") | `δ₀`, `n = 1, 2` | `1 ≤ h + 2/h`; `1 ≤ h² + 4 + 4/h²`; in 1D, `|v_j|² ≤ 2‖D₊v‖‖v‖` | holds | none |
| §4.2 `sqrt_gridNormSq_friedrichsStep_le` (new standing symmetry, new Check) | `A¹ = [[0,1],[−1,0]]`, `μ = h = 1`, `v_j = e^{−ijπ/4}`, `0 ≤ j ≤ 7` | `A¹ = −i`; 6 interior sites give `2` each, 4 edge sites give `½` each: `14 > 8` | README now excludes it, as Lean `hsymm` does | none |
| §4.3 stability (locator added) | constant coefficients, `B = 0`; `(1+kc)^m` | exponent `0`, `‖u^m‖ ≤ ‖u⁰‖ + kΣ‖F^l‖`; `(1+kc)^m ≤ e^{cmk}` | holds | none |
| §5.2 uniform bounds (locator added) | `B = F = 0`, constant `Aⁱ`; `r = n + 3` | `‖D^αu^m‖ ≤ ‖D^αu⁰‖`; `|β| + n ≤ n + 3` for `|β| ≤ 3` | holds | none |
| §6.1 support radius `R₁` | `R = 0.99`, `T + 1 = 1.005`, `μ = h = 1` | `W` reaches `R + mh + 3h`, with `mh < (T+1)/μ`; `R₁ = 4.995 ≥ 3.998` | holds | none |
| §6.2 `exists_isClassicalSolution_of_A0_eq_one` (locator added) | transport `a = μ = 1`; extension to `t < 0` | `u^{m+1}_j = u^m_{j−1}`; `wᵢ(0,·) = ∂ᵢu₀` on both sides | holds | none |
| §7.1 route via `U` | `N = 2`, `P = [[1,1],[0,1]]`; `1 + εE₁₂`; `N = 1` | `(P+Pᵀ)/2` has eigenvalues `3/2, ½`, so `P ∈ U`; `1 + εE₁₂` is not symmetric, so `PosDef` is not open; `U = (0,∞)` when `N = 1` | holds | none |
| §7.2 `isClassicalSolution_normalize_iff` | `A⁰ = (1+|t−T/2|)²`; `A⁰ = e^{2t}` | `∂ₜA⁰` jumps from `−2` to `2` at `T/2`, so `hA0` excludes it; `B' = −1` | README = Lean | none |
| §7.3 `exists_isClassicalSolution` ("assembled") | `diag(1,4)`, `A¹ = 1`, `supp u₀ ⊆ [−1,1]` | supports `[t−1, t+1]` and `[t/4−1, t/4+1]`, inside `|x| ≤ 1 + t` | holds | none |

Rows for statements the diff does not change stand as in the previous review, of `97d9e01`.

- Gate at `68aa515`: every check is `0`, `OK`. `lake env lean` on `Suggested.lean` gives 0 errors and 14 `sorry` warnings. `Suggested.lean` is unchanged since `97d9e01`.
- Signatures: `#check @` of 28 declarations in one scratch copy, 0 errors. `sqrt_gridNormSq_friedrichsStep_le` carries `hsymm`, and `isClassicalSolution_normalize_iff` carries `hS` and `hA0`, as README lines 519 and 816–817 now say.
- Pinned declarations opened (Mathlib `1b1ccf4b` and Tau Ceti `2fd255d9`, as the description states):
  - Mathlib: `ContDiff/Bounds.lean:444`, `Rpow/Basic.lean:516,633`, `Matrix/Order.lean:137`, `PosDef.lean:176` (`PosDef` includes `IsHermitian`), `ODE/Gronwall.lean:112,134`, `FundThmCalculus.lean:1148`, and `ForwardDiff.lean:55` (`fwdDiff_smul` takes `[Ring R]`).
  - Tau Ceti: `ForwardDiff.lean:102` and `Log.lean:98,106`.
- Dependencies: `depcheck: 206 roadmaps, 1896 edges, 0 problem(s)`. The roadmap is at line 408 of the merge order and names no roadmap as a supplier. Nothing changed outside the folder.
- Sources: Rauch 2005, whose URL was dead, is removed from §4.1 and from the References. The new locators are listed under Not verifiable.
- Overlap check: read PDE (on main and in its open revision), QuaternionicAnalysis, LorentzianGeometry's consumer paragraph and IndexTheory's matrix-square-root step (a step inside a proof about symbols, not a target it owns); nothing shared.

## Not verifiable

- Rudin 1976, Theorem 9.21 (§1.1): a McGraw-Hill textbook with no legal open copy. Not fetched, and not checked against the text.
- John 1982, Ch. 5 §3 (b) (§4.3, §5.1, §5.2, §6.1, §6.2), including §6.1's claim that John's compactness argument is not Arzelà–Ascoli: Springer, paywalled.
- Lax 2006, Theorem 8.1, p. 85 (now also cited at §4.3): AMS Courant Lecture Notes, with no open copy.
- Friedrichs 1954 (§1.2, unchanged): Wiley returned HTTP 403 in the previous review.

## Source issues

- none
