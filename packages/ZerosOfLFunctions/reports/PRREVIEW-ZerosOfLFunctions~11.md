# Review of ZerosOfLFunctions (pull request #1913 at c8a8c6b)

**Verdict:** needs changes

This is an incremental re-review of the 6 lines of `TauCetiRoadmap/ZerosOfLFunctions/` changed since
`f25052c`. The change rewrites three rows (5.3, 5.5, 6.4d) of the README's `## Provenance` table. Nothing
else changed: `Suggested.lean` is byte-identical to `f25052c` and `bcf861a`, and nothing outside the folder
changed. Previous R02 is repaired, and the rewritten rows introduce no new problem. Previous R01 is about the
pull request's own text, which is unchanged, so it is carried forward. It is P3, so nothing blocks.

## R01 (P3) — The pull request's title, description and merge order are still stale, and no order is stated against #1907

**Location.** The pull request's title and description, as the worker quotes them (data): "effective
statements under the exclusion of Landau–Siegel zeros"; "Merge order: after AnalyticNumberTheoryPartI
(#1126) lands, since the strengthened statements refer to its §0.34."

**Claim.**
- The roadmap's statements are restated here in effective, exception-free form.
- This pull request depends on AnalyticNumberTheoryPartI and merges after it.

The description names no other pull request that changes this roadmap.

**Witness.**
- `README.md` line 1200 still defines *IsExceptionalZero*.
- Lines 1812–1816 state that the exception-free forms are AnalyticNumberTheoryPartI's.
- `ORDER.txt` has this roadmap at line 48, ahead of AnalyticNumberTheoryPartI at line 49.
- `roadmaps overlaps` reports that #1907 conflicts with this head in `README.md` and `Suggested.lean`.

**Repair.** This is an edit to the pull request text. The README stays as it is.
- Retitle the pull request and rewrite its description to describe this head:
  - the pinned Mathlib name repairs;
  - targets 1.3a, 1.4a and 5.6a, and the off-axis bounds of 6.4d;
  - the `ζ` lemmas added to `Suggested.lean`;
  - the Provenance table.
- Delete the "after AnalyticNumberTheoryPartI" paragraph.
- State the order against #1907: whichever of the two merges second is rebased on the other.

To test the repair, the new description should agree with README lines 1200 and 1812–1816, and with
`ORDER.txt` lines 48–49.

## Previous findings

- R01 — not repaired: the title is still "effective statements under the exclusion of Landau–Siegel
  zeros", the description still ends "Merge order: after AnalyticNumberTheoryPartI (#1126) lands", and
  #1907 is not named. Restated as R01 above.
- R02 — repaired:
  - Line 1833 (5.5) now reads "for every entire function that is not identically zero (at every order
    `A ≥ 0`, its `EntireOfOrderAtMost A` agrees with `OrderLE _ A` on entire functions)".
  - Line 1836 (6.4d) now reads "within `3/4` of `3/2 + 2it` and of `3/2 + it` respectively … at heights
    `2t` and `t`".
  - Line 1832 (5.3) now states each declaration's hypotheses.

  All three rows are checked below, and the repair introduces no new problem.

## Verified sound

**Gate.** My run of `gate … ZerosOfLFunctions --base origin/main` on `c8a8c6b` printed every check at 0,
ending `stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`, and exited 0. The worker's gate
(including `build=0`) also passes. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/ZerosOfLFunctions'`
is empty. The dependency check gives:

```text
depcheck: 239 roadmaps, 2355 edges, 0 problem(s)
```

There are no UPWARD, CYCLE or `moved:` lines. `ORDER.txt` puts `LFunctions` at line 27, this roadmap at line
48 and `AnalyticNumberTheoryPartI` at line 49.

**Elaboration.**
- `lake env lean TauCetiRoadmap/ZerosOfLFunctions/Suggested.lean` exits 0 with exactly 13 "declaration uses
  `sorry`" warnings and nothing else.
- `git diff f25052c HEAD -- …/Suggested.lean` and `git diff bcf861a HEAD -- …/Suggested.lean` are both empty.
- The scratch file with `#check @name` for all 16 declarations elaborates and exits 0. After whitespace
  normalisation, all 16 elaborated types are identical to the worker's `signatures.md`. No binder is lost,
  and no statement changed.

**One-tactic probe.** On a scratch copy I replaced each of the 13 `sorry`s by
`first | rfl | (simp; done) | infer_instance | (norm_num; done)`. All 13 fail, with errors at lines 83, 99,
112, 122, 130, 148, 161, 172, 185, 201, 220, 233 and 245, so there is no padding. The headline list and the
"not statable" docstring paragraph are unchanged from the reviews that checked them.

**The three changed Provenance rows, against PrimeNumberTheoremAnd at commit `127b50e3`.** I fetched four
files of the public Apache-2.0 repository through the sources service: `Mathlib/Analysis/Complex/DivisorIndex.lean`,
`…/HadamardFactorization.lean`, `…/HadamardFactorization/Order.lean` and `StrongPNT.lean`, all under
`PrimeNumberTheoremAnd/`. Line numbers are those of the files themselves; the previous report's line
numbers are 4 higher, because they count the extraction header. None of the four files contains `sorry`.

| Row | Declaration, file and line | What the declaration assumes and concludes | Row at `c8a8c6b` |
| --- | --- | --- | --- |
| 5.3 | `divisorZeroIndex`, `divisorZeroIndex₀` and `divisorCanonicalProduct`, `DivisorIndex.lean` lines 39, 43, 87 (namespace `Complex.Hadamard`, line 32) | The index is `Σ z, Fin (divisor f U z).toNat` restricted to `z ≠ 0`, and the product is `∏' weierstrassFactor m (z/ρ)`. | ✓ |
| 5.3 | `differentiable_divisorCanonicalProduct_univ`, `HadamardFactorization.lean` line 78 | For any `f`, summability of `‖ρ‖⁻¹^(m+1)` over `divisorZeroIndex₀ f univ` gives `Differentiable ℂ (divisorCanonicalProduct m f univ)`. | ✓ "genus-`g` … `∑_ρ m_ρ ‖ρ‖^{−(g+1)}`" |
| 5.3 | `hadamardDenom` and `divisor_hadamardDenom_eq`, lines 53 and 270 | `hadamardDenom m f z = z^(analyticOrderNatAt f 0) · product`. Under `hf : Differentiable ℂ f` and the same summability, it has the divisor of `f`, with no nontriviality hypothesis. | ✓ "for entire `f` under the same summability" |
| 5.3 | `EntireOfOrderAtMost.summable_norm_inv_pow_divisorZeroIndex₀`, `Order.lean` lines 160–161 | Under `h : EntireOfOrderAtMost ρ f`, `hρ : 0 ≤ ρ` and `hnot : ∃ z, f z ≠ 0`, the exponent is `⌊ρ⌋ + 1`. | ✓ "genus `⌊A⌋` … `A ≥ 0` and not identically zero" |
| 5.5 | `EntireOfOrderAtMost`, `Order.lean` line 78 | `Differentiable ℂ f ∧ ∀ ε > 0, ∃ C > 0, ∀ z, ‖f z‖ ≤ exp (C (1 + ‖z‖)^(ρ + ε))`. | ✓ (equivalence below) |
| 5.5 | `hadamard_factorization_of_order`, `Order.lean` lines 176–177 | Under `hρ : 0 ≤ ρ` and `hnot`, it gives `P` with `deg P ≤ ⌊ρ⌋` and `f = exp P · z^ord₀ · divisorCanonicalProduct ⌊ρ⌋ f univ`. | ✓ "not identically zero", at `ρ = 1 ≥ 0` |
| 6.4d | `ZeroWindow`, `StrongPNT.lean` line 1694 | `{ρ | ζ ρ = 0 ∧ ‖ρ − (3/2 + I t)‖ ≤ 3/4}`. | ✓ "within `3/4`" (closed) |
| 6.4d | `ShiftTwoBound`, lines 1850–1855 | Assumes `δ ∈ Ioo 0 1`, `|t| ≥ 2` and `(ZeroWindow (2 * t)).Finite`. | ✓ "`3/2 + 2it`" |
| 6.4d | `ShiftOneBound`, lines 1945–1952 | Assumes `δ ∈ Ioo 0 1`, `|t| ≥ 2`, `(ZeroWindow t).Finite`, `ζ ρ = 0` and `t = ρ.im`, and concludes `… ≤ C log|t| − 1/(1 + δ − ρ.re)`. | ✓ "`3/2 + it`", matching README 6.4d's `ζ` form |
| 6.4d | `ZeroWindowFinite`, line 2140; used at lines 2318–2322 | Assumes `|t| ≥ 2`, and is applied at `t` and at `2 * t`, with `|2t| ≥ 4`. | ✓ "at heights `2t` and `t`" |

**The equivalence asserted in the 5.5 row, for `A ≥ 0` and entire `f`.**
- *`EntireOfOrderAtMost A f` implies `OrderLE f A`.* Given `A′ > A`, take `ε = (A′ − A)/2`. Then
  `C (1 + r)^{A+ε} ≤ r^{A′}` for large `r`.
- *`OrderLE f A` implies `EntireOfOrderAtMost A f`.* Take `A′ = A + ε/2 ≥ 0`. For `r ≥ R`,
  `log‖f‖ ≤ log⁺K + r^{A′} ≤ (1 + log⁺K)(1 + r)^{A+ε}`. For `r ≤ R`, `log‖f‖ ≤ log⁺M ≤ log⁺M (1 + r)^{A+ε}`,
  so `C = max(1, 1 + log⁺K, log⁺M)` works.

The second step uses `A′ ≥ 0` (so that `r^{A′} ≤ (1 + r)^{A′}`) and `(1 + r)^{A+ε} ≥ 1`. Both fail for
negative orders, which is why the row's restriction to `A ≥ 0` is needed.

**Sources: the seeded sample where it falls in the changed passages (5.3, 5.5, 6.4).**
- *Provenance rows.* They were checked against the cited declarations, as in the table above.
- *6.4.* `kadiri2012` §2.1.2, p. 5 (lines 230–237) gives the explicit formula for `−Re ζ′_K/ζ_K(s)`:
  - the sum over zeros, with a minus sign;
  - the term `½ log d_K`;
  - the polar terms `Re 1/s + Re 1/(s − 1)`;
  - the gamma term.

  This supports the trivial-character bound of 6.4d as stated: `Re 1/s` is absorbed, `1/(σ − 1 + it)` is
  kept, and the gamma term is bounded by 1.4. The locator in the References (line 1856) is right.
- *5.3 and 5.5.* Davenport §§11–12 is paywalled (see Not verifiable), and its locators are unchanged by this
  diff.
- The README flags no locator as unverified.

**Overlaps and ownership.**
- `roadmaps overlaps ZerosOfLFunctions`, run again at this head, reports only #1907, which conflicts (R01).
- No id this README cites is dropped by an open pull request, and none is defined only by an open
  revision.
- This pull request drops no id.
- The change adds no object, so ownership stands as settled in earlier rounds.

**Citations.** The worker's 20 unresolved Lean names are the same as before:
- the 14 at README lines 118–297 are LFunctions declarations, unchanged by this diff;
- the 6 at lines 1830–1833 are the PrimeNumberTheoremAnd names, resolved above and in the previous report.

**Adversarial table.** Rows marked "carried" are from the previous report (`PRREVIEW-ZerosOfLFunctions~10`),
for statements this diff leaves untouched. The rows marked "new" cover every changed statement.

| Statement | Instances tried | Values | Result | Change |
| --- | --- | --- | --- | --- |
| 1.3a (carried) | `Re s = 1/2`; `s = 3/2, 3` | `‖Γ(1/2+it)‖² = π/cosh πt ≤ π`; `Γ(3/2) = 0.886`; `Γ(3) = 2` | sound | none |
| 1.4a conjugation (carried) | `s = i` | `Im ψ(i) = 2.0767`, `ψ(−i) = conj ψ(i)` | sound | none |
| 1.2, 1.4 (carried) | `s = 10`; `z = 10` | `log Γ(10) − Stirling = 0.008330 ≈ 1/120`; `ψ(10) − ln 10 = −0.050833` | sound | none |
| 3.3, 3.4, `dirichletLFunction_convexity` (carried) | `Re s = −δ`; `q = 1, t = 0` | edge exponent `1/2 + δ`; `|ζ(1/2)| = 1.4604` | sound | none |
| `hadamard_of_orderLE_one` (carried) | `1 − s`; `exp(z²)` | `a = 0, b = −1`; order 2 fails `OrderLE _ 1` | sound | none |
| 5.6a / `riemannZeta_zeros_summable_ordinate` (carried) | `ρ₁` | `2/(1+14.1347²) = 0.00996` | sound | none |
| 6.4d / `neg_re_logDeriv_riemannZeta_le` (carried) | `t → 0`, `δ = 2|t|` | `1/(4|t|)` vs `log|t| → −∞`; `−ζ'/ζ(2) = 0.5700` | sound | none |
| zero-free regions (carried) | `s = 1/2`; mod 2 at `0` | `ζ(1/2) ≠ 0`; `0 < 1 − c/log 6` | sound | none |
| `riemannVonMangoldt`, `_dirichlet` (carried) | `T = 14, 100`; `q = 1` | `0` vs `−0.443`; `29` vs `28.12` | sound | none |
| 8.2, 8.4, 8.5, 8.7, 8.9 (carried) | `K = ℚ`; `q = 4`; `x = 10⁶` | `c_ℚ = −log 2π`; main term `Li x/2`; `Li − x/log x = 6244` | sound | none |
| Provenance 1.4a (carried) | `s = 2`; `s = 4` | `1.4150927313 = 1.4150927313`; `0.0636697650 = 0.0636697650` | sound | none |
| Provenance 5.2, 5.6a, 6.2, 7.2, 8.5 (carried) | `E₁(0), E₁(1)`; `ρ₁`; `t = γ₁`; `f = z − 2` on `[−1,1]²`; `K = ℚ` | `1, 0`; `0.00498032 ≤ 0.00499899`; `1 − E/log γ₁ > 0.973 > 1/2`; divisor sum `0`; `ψ − x = O(x e^{−c√log x})` | sound | none |
| 4.5 remark, `riemannZeta.N` (carried) | `T = 14, γ₁, 20` | README `N`: `0, 1, 1`; PNT `N`: `0, 0, 1` | differ exactly at ordinates | none |
| Provenance 5.3, `differentiable_divisorCanonicalProduct_univ` (new) | `1/Γ` (zeros `0, −1, −2, …`, simple) at `g = 0` and `g = 1` | `g = 0`: `∑_{n≤10⁶} 1/n = 14.39`, divergent, so the hypothesis fails, as it must (`∏(1 + z/n)` diverges); `g = 1`: `∑ 1/n² = 1.6449`, entire product | sound | none |
| Provenance 5.3, `divisor_hadamardDenom_eq` (new) | `f = z(z − 1)`, `g = 0`; `f = 0` | `hadamardDenom = z(1 − z)`, divisor `{0 ↦ 1, 1 ↦ 1}` = divisor of `f`; for `f = 0` the index is empty, `ord₀ = (⊤).toNat = 0`, `hadamardDenom = 1`, divisor `0` = divisor of `0` (so stating no nontriviality hypothesis is right) | sound | none |
| Provenance 5.3, summability at genus `⌊A⌋` (new) | `cos √z` (`A = 1/2`); `sin z / z` (`A = 1`); `A = −1` | `∑_k ((k + 1/2)π)^{−2} = 0.5000` at exponent `⌊1/2⌋ + 1 = 1`; `∑_{k≠0} (kπ)^{−2} = 0.3333` at exponent `2`, while exponent `1` diverges; `A = −1` is excluded by `A ≥ 0` | sound | none |
| Provenance 5.5, nontriviality (new) | `f = 0`; `f = 1 − z` at order `1` | `0 = exp(P z) · 1 · 1` is false, and `0` is excluded by "not identically zero"; `1 − z = exp(−z) · (1 − z)e^{z}`, so `P = −z`, `deg P = 1 ≤ ⌊1⌋` | sound | none |
| Provenance 5.5, equivalence at `A ≥ 0` (new) | `e^z`, `e^{z²}` at `A = 1`; `z`, `5` at `A = 0`; `5` at `A = −1` | `e^z`: `r = 10³`, `r ≤ (1 + r)^{1.1} = 1997`, both hold; `e^{z²}`: `r = 10⁴`, `r² = 10⁸ > 10(1 + r)^{1.5} = 1.0·10⁷`, both fail; `5 ≤ exp(log 5 · (1 + r)^ε)`, both hold; at `A = −1`, `exp(C(1 + 10⁶)^{−1/2}) = 1.001, 1.010, 1.105 < 5` (`C = 1, 10, 100`), so they differ there, outside the row's range | sound | none |
| Provenance 6.4d (new) | `t = 2`; `t = −3`; `t = γ₁` | centres `3/2 + 4i` (ShiftTwoBound) and `3/2 + 2i` (ShiftOneBound); `3/2 − 6i` and `3/2 − 3i`; `ZeroWindowFinite` needs `|u| ≥ 2`, met at `|2t| = 4, 6` and `|t| = 2, 3`; distance from `ρ₁` to `3/2 + iγ₁` is `1 > 3/4`, so `ρ₁` is outside its window | sound | none |

**Remarks on untouched text (no change requested).** None.

## Not verifiable

- Davenport, *Multiplicative Number Theory* (§§11–12, the 5.3 and 5.5 sample locators), Titchmarsh, Lang,
  Iwaniec–Kowalski and Lagarias–Odlyzko. These are paywalled, as in earlier rounds, and the diff changes
  none of their locators.

## Source issues

- none
