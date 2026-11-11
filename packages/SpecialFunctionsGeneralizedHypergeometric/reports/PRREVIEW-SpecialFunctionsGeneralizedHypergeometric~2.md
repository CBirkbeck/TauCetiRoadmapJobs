# Review of SpecialFunctionsGeneralizedHypergeometric (pull request #2136 at 3c765c9)

**Verdict:** needs changes

The gate passes on this head and ten of the eleven findings of the previous review are repaired in full (the list is under "Verified sound"). One blocking finding remains (R01), and three P3 findings.

## R01 (P2) — Džrbasjan's sum 16.4.8 is a statable headline that is absent, and README 4.2 does not state it

**Location.** `TauCetiRoadmap/SpecialFunctionsGeneralizedHypergeometric/README.md` line 652: "16.4.6 at `a = −n` (terminating Watson) and 16.4.8 (Džrbasjan), by WZ pairs in `n`." `Suggested.lean` has no declaration for 16.4.8.

**Claim.** The Summary (lines 24–26) names seven sums: Pfaff–Saalschütz, Dixon, Watson, Whipple, Džrbasjan, Rogers–Dougall and Dougall. Six are stated in `Suggested.lean`; Džrbasjan's is not, and the module docstring does not name it as unstatable. It is not a case of a stated sum: README 4.3 itself shows that 16.4.8 is not 16.4.7 at `c = −n`. The README bullet also gives neither the formula nor the hypotheses of its two targets.

**Witness.** The signature below elaborates in a scratch copy of the file (`sorry` the only warning). At `(a, d) = (0.3 + 0.2i, 1.4 − 0.1i)` both sides are `1.07100 44075 34… + 0.03193 48283 17… i` (`n = 1`), `1.08836 91450 45… + 0.03910 59691 16… i` (`n = 2`) and `1.09604 92224 04… + 0.04217 13385 85… i` (`n = 3`). The single hypothesis suffices, since `(1 − d − 2n)ₖ = ±(d + 2n − k)ₖ` and `(d/2)ₙ ((d + 1)/2)ₙ = (d)₂ₙ/4ⁿ`.

**Repair.**
- Add to `Suggested.lean`, Layer 4:

```lean
/-- 4.2: Džrbasjan's sum, DLMF 16.4.8. -/
theorem terminatingSum_dzrbasjan (n : ℕ) (a d : ℂ) (hd : poch(d, 2 * n) ≠ 0) :
    terminatingSum [-(n : ℂ), a, 1 - a] [d, 1 - d - 2 * n] n =
      poch((a + d) / 2, n) * poch((d - a + 1) / 2, n) /
        (poch(d / 2, n) * poch((d + 1) / 2, n)) := sorry
```

- In README 4.2 state both targets with their hypotheses. For 16.4.8: for `(d)₂ₙ ≠ 0`, the sum of `[−n, a, 1 − a]`, `[d, 1 − d − 2n]` is `((a + d)/2)ₙ ((d − a + 1)/2)ₙ/((d/2)ₙ ((d + 1)/2)ₙ)` (`terminatingSum_dzrbasjan`). For terminating Watson: for `((b − n + 1)/2)ₙ (2c)ₙ ≠ 0`, the sum of `[−n, b, c]`, `[(b − n + 1)/2, 2c]` is `0` for odd `n` and `(½)ₖ (c + (1 − b)/2)ₖ/(((1 − b)/2)ₖ (c + ½)ₖ)` for `n = 2k`, with no condition on `Re(2c − a − b)`. I checked the second at `(n, b, c) = (2, 0.5, −1.4)`, where `Re(2c − a − b) = −1.3`: both sides are `2.55555 55555 55…`; and at `(4, 0.3 + 0.2i, −2.6 + 0.1i)`: both are `1.62612 38526 09… + 0.86836 15758 22… i`.

## R02 (P3) — 4.1: the Check contradicts the definitions it tests, and the three classes share one Check

**Location.** README lines 618–620: "`k`-balanced if `a_{q+1} ∈ {0, −1, −2, …}` and `a₁ + ⋯ + a_{q+1} + k = b₁ + ⋯ + b_q`", and lines 629–630: "The `₇F₆` of 16.4.10 is very well-poised and, with its balance condition, `2`-balanced".

**Claim.** The classes are defined on ordered lists. Well-poisedness makes the last top parameter the unpaired one, and `k`-balancedness makes the last top parameter the nonpositive integer. No single ordering of the `₇F₆` of 16.4.10 satisfies both.

**Witness.** With tops `[a/2 + 1, b, c, d, f, −n, a]` and bottoms `[a/2, a − b + 1, a − c + 1, a − d + 1, a − f + 1, a + n + 1]`, every pair sums to `a + 1` and `a₁ = b₁ + 1`, so the list is very well-poised; its last top is `a`, not a nonpositive integer. With `−n` last, `a₁ + b₁ = a + 1` would have to equal `−n + 1`. The sums do satisfy `Σtops + 2 = Σbottoms` exactly when `b + c + d + f = 2a + 1 + n`.

**Repair.**
- Define `k`-balanced without an order: some top parameter is a nonpositive integer and `Σ𝐚 + k = Σ𝐛`. Then the Check holds with the ordering above, and its last sentence applies to well-poisedness only (in the order printed in 16.4.10, `a₁ + b₁ = 3a/2`, so that list is not well-poised).
- Add two Checks, so that the definitions have three. Both are computed:
  - the Pfaff–Saalschütz series at `(n, a, b, c, d) = (1, ½, ½, 3/2, −½)` has `Σtops + 1 = 1 = c + d`, so it is `1`-balanced and not `2`-balanced;
  - Watson's `₃F₂` at `(a, b, c) = (0.3, 0.5, 0.9)`, with bottoms `0.9` and `1.8`, is well-poised in no ordering: with unpaired top `u`, the two pairs would sum to `2(u + 1)`, while the bottoms and the paired tops sum to `2.7 + (1.7 − u)`; this forces `u = 0.8`, which is not one of the tops.

## R03 (P3) — 4.5: the hypothesis of 16.4.17 excludes the instance its own Check uses, and the bilateral series has one Check

**Location.** README lines 766–767: "for `Re(c + d − a − b) > 1` and `a, b, c, d` with every `Γ` in the formula finite and nonzero", and line 771: "16.4.17 at `b = d`: `₁H₁(a; c; 1) = 0`".

**Claim.** At `b = d` the factor `Γ(d − b)` of the denominator is at a pole, so the stated hypothesis excludes the Check. The Check itself is true.

**Witness.** At `(a, c) = (0.3, 2.9)` the sum over `k ≥ 0` is `1.1875` and the sum over `k ≤ −1` is `−1.1875` (mpmath: `1.18749 98…` and `−1.18750 00…`), so `₁H₁ = 0`, which is the right side with `1/Γ(d − b) = 0`.

**Repair.**
- State 16.4.17 with reciprocal Gamma factors in the denominator: `Γ(c) Γ(d) Γ(1 − a) Γ(1 − b) Γ(c + d − a − b − 1)` times `(Γ(c − a) Γ(d − a) Γ(c − b) Γ(d − b))⁻¹`, with the hypothesis only that `c`, `d`, `1 − a`, `1 − b` are not poles of `Γ` (`c + d − a − b − 1` has positive real part). The case `b = d` is then covered.
- Add two Checks:
  - the term of index `k = −1` of `₁H₁(a; c; 1)` is `(c − 1)/(a − 1)`, which is `−2.71428 57…` at `(0.3, 2.9)`; this excludes a definition that uses the ascending Pochhammer polynomial, or `1`, at negative indices;
  - at `(a, b, c, d) = (0.3 + 0.1i, −0.4 + 0.2i, 1.7 − 0.3i, 1.2 + 0.5i)` the right side is `1.13072 61026 60… + 0.44353 25702 10… i`.

## R04 (P3) — Three sentences of the README

**(a) Lines 436–437.** "…`(−1)^{p+q+1}/z)`, as a finite sum The proof reverses the order of summation": the sentence about 16.2.4 has no full stop and no hypotheses. Repair: end it with "as a finite sum, for `m : ℕ`, `(𝐛)ₘ ≠ 0`, `(1 − m − 𝐚)ₘ ≠ 0` and `z ≠ 0`." before "The proof reverses…".

**(b) Lines 995–996.** "`F(a, α; b; z/α) → F(a; b; z)` as `|α| → ∞`, locally uniformly in `z` … (`tendsto_generalizedHypergeometric_confluence_top`)": the declaration states the limit for a fixed `z`. Repair: write "for every `z` (`tendsto_generalizedHypergeometric_confluence_top`); the convergence is locally uniform in `z`", so that the name is attached to what the Lean states.

**(c) Line 1030.** `[SpecialFunctionsStruve](../SpecialFunctionsStruve/README.md)`: that folder is not on main, so the link is broken when this pull request merges. Repair: name the roadmap without a link, as line 1035 does for SpecialFunctionsConfluent.

## Verified sound

**The previous review's findings at this head.**
- R01 (missing headlines): repaired. `Suggested.lean` now states 16.11.6, 16.6.2, 16.10.2, 16.11.10, `solution_16_8_6`, 16.3.2–16.3.4, 16.4.12 and 16.8.4–16.8.5, and the docstring names only the agreement with the Gauss function, with its missing carrier.
- R02 (import): repaired. The only import is `public import Mathlib`; Clausen and 16.12.3 use `pFq`.
- R03 (names): repaired. All 63 declarations are backticked in the README, and the citation check finds no README name without a declaration.
- R04 (padding): repaired. The eleven declarations and `pochZ` are gone.
- R05 (16.4.15, `a − b − c + 1 = −m`): repaired by `regularizedHGFun_whipple_7F6_16_4_15`; recomputed below.
- R06 (`hc''`): repaired. R07 (16.8.11): repaired, README and Lean now agree on `‖z‖ < 1` and `δ < π/2 → ‖z‖ < sin δ`.
- R08 (certificates): repaired; "WZ pair" and "Zeilberger" remain only as routes.
- R09 (Checks): repaired for 1.2 (three Checks); partly for 4.1 and 4.5 (R02, R03).
- R10 (digit) and R11 (a)–(d): repaired.

**Gate, build, dependencies.**
- The worker's gate passes on 3c765c9 (every scanner `0`, build OK).
- `lake env lean` on `Suggested.lean`: exit 0 in 7 s, 56 warnings, all "declaration uses `sorry`".
- Dependency check: `depcheck: 237 roadmaps, 2140 edges, 0 problem(s)`; no UPWARD or CYCLE line. The three suppliers are on main.
- The pull request changes nothing outside the folder.

**Lean form.** One module docstring, no `set_option`, no `lemma`, no section `variable`, seven `def`s with real bodies, 56 theorems. I compared each elaborated type in the worker's signature list with its README statement; nothing differs except R04 (b).

**Padding probe.** On a scratch copy, each of the 56 `sorry`s was replaced by `first | rfl | simp [the six definitions] | infer_instance`: 56 errors, so none closes in one tactic.

**Library declarations opened at the pins.**
- Mathlib `Mathlib/Analysis/SpecialFunctions/RegularizedHypergeometric.lean`: lines 75, 93, 195, 201, 249, 282, 302, 342, 371, 414 (the ten cited theorems).
- Mathlib `Analysis/Calculus/MeanValue.lean:767` (`IsOpen.is_const_of_deriv_eq_zero`), `Analysis/Analytic/Binomial.lean:154`, and the files of 14 further cited names (`Complex/AbelLimit.lean`, `Analytic/Uniqueness.lean`, `Complex/Liouville.lean`, `Fourier/Inversion.lean`, `MellinInversion.lean`, `Gamma/Beta.lean`, `Gamma/Digamma.lean`, `Gamma/Deriv.lean`, `Combinatorics/Enumerative/Stirling.lean`, `LinearAlgebra/Vandermonde.lean`, `Complex/Convex.lean`, `Calculus/ParametricIntervalIntegral.lean`).
- Tau Ceti `Analysis/SpecialFunctions/RegularizedHypergeometric.lean:53`, `Analysis/Analytic/Binomial.lean:46`, `Analysis/Contour/Residue/Basic.lean:80`.
- Tau Ceti's `Analysis/SpecialFunctions/OrdinaryHypergeometric.lean` (lines 36, 56) and `EllipticIntegral/Hypergeometric.lean` state only the radius and analyticity of the `₂F₁` series and elliptic-integral cases; none of this roadmap's targets is there.

**Cross-roadmap citations resolved on main** (13): SpecialFunctionsHypergeometric Conventions, 1.2–1.4 (README 376 / Lean 105), 4.2 (633 / 215, 639 / 226, 641 / 230, Carlson at 664), 4.3 (675), 5.1 (708 / 263), 6.3 (the integral of `(1 + u)^{−a}`, 852–853), 7.3 (923 / 409, 925); ZerosOfLFunctions 1.2 (510) and 1.3 (520); AsymptoticExpansions 8.2 (919, Lean 407), 8.6 (1052, Lean 419), 8.7 (1068, Lean 424). The overlap check lists nothing dropped or changed.

**Ownership against open pull requests** (searched with `roadmaps grep` by object: Saalschütz, Dixon, Thomae, Whipple, Clausen's formula, Fields–Wimp, Nørlund, well-poised, `₃F₂`, order-`n` Wronskians). No roadmap on main or open states a Chapter 16 formula. SpecialFunctionsAppell cites `lean-DLMF` paths only. Abel's identity elsewhere is second order.

**The pull request's text.** Title and description agree with the head: a new roadmap, `Suggested.lean` imports only Mathlib, 56 headlines, the three suppliers, and the list under Beyond.

**Source sample.** All 15 seeded targets read against DLMF Release 1.2.8 of 2026-09-15 (DLMF-16.8 lines 533–534), formulas from the TeX of each equation:
- 1.3, 1.5: 16.2.1, 16.2.3, 16.2.4 (DLMF-16.2 line 276 for the hypothesis on `−m`).
- 1.4: §16.2(v). 2.1: 16.3.1–16.3.5. 2.2: 16.3.6 and 16.3.3–16.3.4 at `n = 1`.
- 3.2: 16.8.3–16.8.5. 3.4: 16.8.7.
- 4.1: 16.4.1, 16.4.2, 16.4.2_5 (DLMF-16.4 lines 94–99, 166). 4.2: 16.4.3, 16.4.5 (Gamma form, equal to the README's Pochhammer form), 16.4.8, 16.4.10. 4.3: 16.4.4, 16.4.6, 16.4.7, 16.4.9 with their conditions. 4.4: 16.4.11–16.4.15.
- 5.1: 16.5.3–16.5.4 and DLMF-16.5 lines 258–261 (`Re z < 1` removable for `p < q`; `max(0, Re z) < c` for `p = q + 1`). 5.2: 16.5.1.
- 6.2: 16.10.1 (DLMF-16.10 lines 42–43 give no conditions; the README's `p < q`, `r ≤ s` is its own claim, tested below) and 16.10.2 (lines 110–111).
- 7.2: 16.11.10 (DLMF-16.11 lines 533, 568: `|ph(1 − z)| < π`, `k` from 1 to `q`) and 16.11.11.
The README flags no locator as unverified.

**Adversarial table.** Hand computations and mpmath at 25–30 digits. "both" means the two sides agree to the digits shown.

| Statement | Instances | Values (left / right) | Result |
|---|---|---|---|
| 1.2 shift (bottom) | coefficient of `zⁿ` | `(b₀ + n)(a₁)ₙ = (b₀ − a₁)(a₁)ₙ + a₁(a₁ + 1)ₙ` | holds |
| 1.2 shift (top) | coefficient of `zⁿ` | `(a₀ + 1)ₙ − (a₀)ₙ = n (a₀ + 1)ₙ₋₁`; `(𝐚)ₘ₊₁ = (𝐚)₁ (𝐚 + 1)ₘ` | holds |
| 1.2 Checks | `𝐅({1}; ∅; −2)`; `b = {−1, 1.9}` | `1/3`; `F = 0` by `Γ(−1) = 0` | hold |
| 1.5 16.2.3 hypothesis | `(a_j)ₘ = 0` | right side is `0` by division by zero, left is not | `(1 − m − 𝐚)ₘ ≠ 0` needed |
| 1.6 trichotomy | coefficient asymptotics | `~ n^{−γ−1}/∏Γ(a)`, for any `b` | as stated |
| 2.1 16.3.2 regularized | `a = {0.3 + 0.1i, 0.7}`, `b = {1.2 − 0.2i}`, `γ = 0.4 + 0.3i`, `z = 0.3 + 0.2i`, `n = 2` | `−0.42740 87717 27… + 1.88825 30046 32… i` both | holds |
| 2.1 16.3.3 regularized | same, `n = 2` | `−0.00356 32630 17… + 0.16751 33704 35… i` both | holds |
| 2.1 16.3.4 regularized | same, `n = 2`; `γ = −1` (a pole), `n = 1` | `−2.78579 46614 04… − 7.85570 51613 97… i` both; `0.18896 66170 8… + 0.03179 29008 8… i` both | holds, also at a pole |
| 2.2 first-order relations | coefficient of `zᵏ` | `(k + a₀)(a₀)ₖ = a₀(a₀ + 1)ₖ`; `(k + b₀ − 1)/Γ(b₀ + k) = 1/Γ(b₀ + k − 1)` | hold |
| 3.2 16.8.4–16.8.5 | `q = 0`: `p = 1`, `p = 0`; `q = 1`, `p = 2` | `(1 − z)w′ − a w = 0`; `w′ − w = 0`; `α₁ = −(a + b + 1)`, `β₁ = c` | hold |
| 3.3 Wronskian exponents | Abel with 3.2 | `−β_q = −Σ𝐛 − q(q−1)/2`; `α_q + β_q = Σ𝐛 − Σ𝐚 − q`; `Σρ − q(q+1)/2 = −Σ𝐛 − q(q−1)/2` | consistent |
| 3.4 Wronskian 16.8.7 | `q = 0` | `(−z)^{−a}(1 − 1/z)^{−a}`, `C = 1` | holds |
| 4.1 Lerch | `n = 0` | `(c − 1 − a)/(c − a − 1) = 1` | holds |
| 4.1 Check | `₇F₆` of 16.4.10 | well-poised needs last top `a`; balanced needs last top `−n` | R02 |
| 4.2 16.4.3 Check | `(1, ½, ½, 3/2)`, `d = −½` | `1 + 1/3 = 4/3`; `1/((3/2)(1/2)) = 4/3` | holds |
| 4.2 16.4.5 | `n = 2`, `b = c = −2`; `b = 0`, `k = 1` | `−6` both; left `1`, right `2` | holds; `(b)ₙ ≠ 0` needed |
| 4.2 16.4.8 | `n = 1, 2, 3`, `(a, d) = (0.3 + 0.2i, 1.4 − 0.1i)` | values in R01, both | holds; absent (R01) |
| 4.2 terminating Watson | `(2, 0.5, −1.4)`; `(4, 0.3 + 0.2i, −2.6 + 0.1i)`; `n = 3` | `2.55555 55555 55…` both; `1.62612 38526 09… + 0.86836 15758 22… i` both; `0` both | holds (R01) |
| 4.3 16.4.7 vs 16.4.8 | `a = d = ½`, `c = 0`, `n = 0` | `1/π` and `2/π` (regularized) | README correct |
| 4.3 convergence exponents | Dixon, Watson, Whipple, Rogers–Dougall | `a − 2b − 2c + 2`; `c + (1 − a − b)/2`; `c`; `2a + 2 − 2(b + c + d)` | match the hypotheses |
| 4.3 16.4.9 at `a = 0` | regularized | every coefficient `0`; right side `1/Γ(0) = 0` | holds |
| 4.4 16.4.15, `f = −n` | Gamma ratios | `(a + 1)ₙ (a − d − e + 1)ₙ/((a − d + 1)ₙ (a − e + 1)ₙ)` | matches the Lean |
| 4.4 16.4.15, `a − b − c + 1 = −m` (Lean form) | `m = 1`, `(1.3, 1.5, 0.2, 0.3, 0.25)`; `m = 2`, `(2.4 + 0.2i, 1.1 − 0.3i, 0.2, 0.3 + 0.1i, −0.15)` | `1.07545 73418 14…` both; `1.00447 22243 05… + 0.00046 02103 12… i` both | holds |
| 4.4 16.4.15 at `a = −1` | `Γ(a + 1)` in the denominator | left `1 − 1 = 0`; right `0` | holds |
| 4.5 16.4.17 Check | `(a, c) = (0.3, 2.9)` | `1.1875 − 1.1875 = 0` | true, outside the stated hypothesis (R03) |
| 5.1 16.5.4, `p = q + 1`, `‖z‖ > c` | `₁F₁(0.7; 1.6 + 0.3i; −3 + 2i)/Γ(b₀)`, `c = 1` | `T = 800`: `0.38670 56 + 0.23191 52 i` / `0.38670 92 + 0.23190 26 i` | converging |
| 5.1 16.5.4 domain | `z/t ∈ [1, ∞)` on `Re t = c` | happens iff `Re z ≥ c` | `Re z < c` is right |
| 5.2 loop integral, orientation | `p = q = 0`, `z = 0.7 − 0.4i`; `p = 1`, `a = 0.6 + 0.3i`, `z = −0.5 + 0.3i`; `η = 0.5`, `σ = −0.3` | `1.85478 90704 2 − 0.78419 22411 6 i` both; `0.85032 15504 − 0.39183 25555 i` both | holds |
| 5.2 vertical line, `p = q = 0` | Cahen–Mellin with `w = −z` | `e^{z}` both, for `Re(−z) > 0` | holds |
| 5.3 16.8.9 off `centeredDomain` | `q = 0`, `a = ½`, `(3 + i, 2i)` | phases `2.81984 + 0.78540 = 3.60524 > π`; `ph(1 − z) = −2.67795` | right side is minus the left |
| 6.1 16.6.2 | roots of `4(1 − z)³ + 27z` | `z = −½` (double), `z = 4` | README correct |
| 6.2 16.10.1, `p = 1`, `q = 2`, `r = s = 1` | `a = {0.6}`, `b = {1.3, 0.9 + 0.2i}`, `c = {0.45}`, `d = {1.7}`, `(α, β, γ) = (0.7, 1.3, 0.4)`; `(z, ζ) = (2, 3)`, `(3 + 2i, −4 + i)`, `(−6, 2.5)` | `2.41533 37222 9 − 0.40524 80401 3 i`; `0.37720 06109 9 + 0.02277 88395 6 i`; `0.37158 51154 5 + 0.06300 97309 9 i` (both; 60th term below `10⁻⁵⁵`) | holds |
| 6.2 16.10.2 domain | `zζ = s ≥ 1` with `‖ζ − 1‖ < 1` | forces `s < 2 Re z < 1` | `zζ` stays in the cut plane |
| 6.3 16.12.1 | regularization | `F = Γ(a) Γ(b) Γ(a + b − 1) 𝐅` | matches |
| 7.1 16.8.10 domination | `p = q` | `(1 + n/A)ⁿ ‖z‖ⁿ/n!` summable for `A > e‖z‖` | route sound |
| 7.2 16.11.10 | `a = {0.3, 0.55 + 0.2i, 0.8}`, `b = {1.4, 1.9}`, `z = −3 + i`, `m = 2`; `r = 50, 100, 200, 400` | `‖error‖ r²`: `k = 1`: `0.401, 0.431, 0.448, 0.457`; `k = 2`: `5.09, 5.75, 6.14, 6.36` | bounded |
| 7 Example | `(1 − z/α)^{−α}` | `→ e^z` | holds |

## Not verifiable

- Andrews–Askey–Roy, Bailey 1935, Luke 1969 and Petkovšek–Wilf–Zeilberger are listed under References and cited at no claim; I did not open them, and no sampled locator depends on them.
- Fields and Wimp (1961), which DLMF cites for the conditions of 16.10.1, was not read; the README's condition `p < q`, `r ≤ s` was tested numerically instead (table).

## Source issues

- **Error** in DLMF Release 1.2.8 at 16.4.8 (§16.4(ii), DLMF-16.4 line 448): the source says 16.4.8 is 16.4.7 in the case `c = −n`; it should be a separate terminating sum, since at `n = 0`, `a = d = ½` the right side of 16.4.7 is 2 and 16.4.8 is 1; affects nothing.
- **Error** in DLMF Release 1.2.8 at 16.8.9 (§16.8(ii)): the source says `|z − z₀| > max(|z₀|, |z₀ − 1|)` and `|ph(z₀ − z)| < π` suffice; it should be restricted to the component containing `z₀ − t` for large `t`, since `q = 0`, `a = ½`, `(z, z₀) = (3 + i, 2i)` gives minus the principal branch; affects a stated result.
