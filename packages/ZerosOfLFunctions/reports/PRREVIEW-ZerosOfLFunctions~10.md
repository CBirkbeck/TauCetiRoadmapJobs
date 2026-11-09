# Review of ZerosOfLFunctions (pull request #1913 at f25052c)

**Verdict:** needs changes

This is an incremental re-review of the 119 lines of `TauCetiRoadmap/ZerosOfLFunctions/` changed since
`bcf861a`. The change touches only `README.md`:
- it deletes every inline PrimeNumberTheoremAnd and IEANTN citation;
- it adds a commit-pinned `## Provenance` table;
- it shortens References to one pinned entry.

`Suggested.lean` is byte-identical to `bcf861a`, and nothing outside the folder changes. The gate passes and
the elaboration is clean. Previous R02 and R03 are repaired, and previous R01 (the pull request's text) is
not. I checked the new table row by row against PrimeNumberTheoremAnd at commit `127b50e3`. Every declaration
it names exists there as described, except that two rows misstate a hypothesis (R02). Both findings are P3,
so none blocks.

## R01 (P3) — The pull request's title, description and merge order are still stale, and no order is stated against #1907

**Location.** The pull request's title and description, as the worker quotes them (data): "effective
statements under the exclusion of Landau–Siegel zeros"; "Merge order: after AnalyticNumberTheoryPartI
(#1126) lands, since the strengthened statements refer to its §0.34."

**Claim.** The description says that this pull request restates the roadmap's statements in effective form,
that it depends on AnalyticNumberTheoryPartI, and that it merges after it. It names no other pull request.

**Witness.**
- The folder contains none of the strengthened statements.
- `merge-order/ORDER.txt` puts `ZerosOfLFunctions` at line 48 and `AnalyticNumberTheoryPartI` at line 49,
  and the latter consumes this roadmap.
- The worker's overlap list reports #1907 ("direct Dirichlet selected-zero interfaces"), which conflicts
  with this head in `README.md` and `Suggested.lean`.

**Repair.** Rewrite the title and description to describe this head:
- the four Mathlib name repairs, the 3.3 locator and the downstream-consumer bullet;
- targets 1.3a, 1.4a, 5.6a and the off-axis bounds of 6.4d;
- the two `ζ` lemmas in `Suggested.lean`;
- the Provenance table.

Drop the "merge after AnalyticNumberTheoryPartI" paragraph. State the order against #1907: whichever of the
two merges second is rebased on the other. The README stays as it is, since a README does not name pull
requests.

## R02 (P3) — Two Provenance rows misstate the hypotheses of the declarations they cite

**Location.** `README.md` line 1833 (5.5): "`Complex.Hadamard.hadamard_factorization_of_order` at order
`1`, for every entire function (its `EntireOfOrderAtMost` agrees with `OrderLE` on entire functions)".
Line 1836 (6.4d): "`ShiftTwoBound` and `ShiftOneBound`, whose finiteness hypothesis on the zeros near
`3/2 + it`".

**Claim.**
- The PrimeNumberTheoremAnd factorization applies to every entire function.
- Its order predicate agrees with this roadmap's `OrderLE` on entire functions, with no restriction on the
  order.
- Both 6.4d lemmas assume finiteness of the zeros near `3/2 + it`.

**Witness.**
- *5.5, nontriviality.* `Order.lean` line 181, at commit `127b50e3`, has the hypothesis
  `hnot : ∃ z, f z ≠ 0`. For `f = 0`, the conclusion would read `0 = exp(P(z)) · z⁰ · 1`, which is false.
- *5.5, negative orders.* At `ρ = −1` the constant `5` satisfies `OrderLE` (`Suggested.lean` line 55–56),
  but not `EntireOfOrderAtMost` (line 82–84). The bound `exp(C(1 + r)^{−1/2})` tends to `1`, which is less
  than `5`.
- *6.4d.* `StrongPNT.lean` line 1858 assumes `(ZeroWindow (2 * t)).Finite`. By line 1698, this is the set
  of zeros within `3/4` of `3/2 + 2it`.

**Repair.**
- At line 1833, write "for every entire function that is not identically zero (at every order `ρ ≥ 0`,
  `EntireOfOrderAtMost ρ` agrees with `OrderLE _ ρ` on entire functions)".
- At line 1836, write "whose finiteness hypotheses on the zeros within `3/4` of `3/2 + 2it` and of
  `3/2 + it` respectively".

Test on the refuting instances:
- `f = 0` is excluded.
- `ρ = −1` is outside `ρ ≥ 0`.
- At `t = 2`, the two centres are `3/2 + 4i` and `3/2 + 2i`, as in lines 1858 and 1953.
- `ZeroWindowFinite` (line 2144) needs height at least `2` in absolute value. Both `|2t| ≥ 4` and
  `|t| ≥ 2` satisfy it.

The equivalence holds for `ρ ≥ 0`:
- from `EntireOfOrderAtMost` to `OrderLE`, take `ε = (A′ − ρ)/2`;
- from `OrderLE` to `EntireOfOrderAtMost`, take `A′ = ρ + ε/2` and `C = max(1, log⁺K, log⁺M)`, where `K`
  is the big-O constant and `M` bounds `‖f‖` on the compact disc.

## Previous findings

- R01 — not repaired: the title is still "effective statements under the exclusion of Landau–Siegel
  zeros", the description still says "Merge order: after AnalyticNumberTheoryPartI (#1126) lands", and
  #1907 is not named. This is restated as R01 above.
- R02 — repaired: 1.2, 1.3 and 1.4 end at the DLMF locators, and 4.1 reads "as in the conventions". 7.3
  ends "for `T` not an ordinate". `git diff 4762be5 HEAD` shows every de-cited hunk back to its
  previously reviewed text. The `ζ` count is named at line 1840 with "open interval `(0, T)`".
- R03 — repaired: line 1818 adds `## Provenance`, which is secondary and pinned to commit `127b50e3`, with
  a declaration and a file per row. References line 1871 is pinned too. The citations at 4.3, 5.4 and 8.2
  are deleted, and 6.4d now cites `ShiftTwoBound`/`ShiftOneBound`. The new rows introduce R02.

## Verified sound

**Gate.** My run on `f25052c` gives `gate ZerosOfLFunctions: set_option=0 … depcheck=0 metadata=0
stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`, exit 0. The worker's gate (with `build=0`) also
passes. `git diff --stat origin/main...HEAD` outside the folder is empty. The dependency check gives:

```text
depcheck: 239 roadmaps, 2355 edges, 0 problem(s)
```

There are no UPWARD, CYCLE or `moved:` lines. `ORDER.txt` lists `LFunctions` at line 27, this roadmap at
line 48 and `AnalyticNumberTheoryPartI` at line 49.

**Elaboration.**
- `lake env lean TauCetiRoadmap/ZerosOfLFunctions/Suggested.lean` exits 0 with exactly 13 "declaration uses
  `sorry`" warnings and nothing else.
- `git diff bcf861a HEAD -- Suggested.lean` is empty.
- A scratch file with `#check @name` for all 16 declarations elaborates, with exit 0. The types are those
  of the worker's `signatures.md`, which the previous review compared with the README. There is no lost
  binder, and `primeIdealCount_effective` carries `[Field K] [NumberField K]`.

**One-tactic probe.** I replaced each of the 13 `sorry` by `first | rfl | (simp; done) | infer_instance |
(norm_num; done)`. All 13 fail (errors at lines 83, 99, 112, 122, 130, 148, 161, 172, 185, 201, 220, 233 and
245), so there is no padding. The headline list and the "not statable" paragraph are unchanged from the
previous review.

**Provenance table, PrimeNumberTheoremAnd at `127b50e3`.** I read 11 files of the public Apache-2.0
repository. All paths are under `PrimeNumberTheoremAnd/`.

| Row | Declaration and location | Checked |
| --- | --- | --- |
| 1.4a | `Kadiri.kadiri_thm_3_1_q1_functional_eq`, `IEANTN/Kadiri.lean` line 732 (namespace `Kadiri`, lines 37–3564) | Public. Hypotheses `s ≠ 1`, `s ≠ 0`, `ζ(s) ≠ 0`, `ζ(1−s) ≠ 0` (lines 733–735), which are 1.4a's four. Conclusion at lines 736–739. The proof (lines 740–744) is complete. |
| 5.2 | `Complex.weierstrassFactor`, `WeierstrassFactor.lean` line 56 | Defined as `(1 − z) · exp(partialLogSum m z)`. |
| 5.3 | `divisorZeroIndex₀` and `divisorCanonicalProduct`, `DivisorIndex.lean` lines 43–48 and 91 | Indexed by `Σ z, Fin (divisor f U z).toNat` with `z ≠ 0`. |
| 5.3 | `differentiable_divisorCanonicalProduct_univ`, `hadamardDenom`, `divisor_hadamardDenom_eq`, `HadamardFactorization.lean` lines 82, 57, 274 | `hadamardDenom` is `z^(ord₀ f) · product`, and its divisor equals `divisor f univ`. |
| 5.3 | `EntireOfOrderAtMost.summable_norm_inv_pow_divisorZeroIndex₀`, `Order.lean` line 164 | Assumes `0 ≤ ρ` and that `f` is not identically zero. |
| 5.5 | `EntireOfOrderAtMost` and `hadamard_factorization_of_order`, `Order.lean` lines 82 and 180 | See R02. |
| 5.5 | `riemannXi_hadamard_factorization_no_monomial` and `logDeriv_riemannXi_eq_polynomial_derivative_add_tsum`, `RiemannZetaHadamard.lean` lines 346 and 248 | As described. |
| 5.5 | `riemannXi`, `CompletedXi.lean` lines 51–52 | Defined as `(s(s−1)Λ₀(s) + 1)/2`. `zetaEntireCompletion` (`Suggested.lean` line 70–71) is `s(s−1)Λ₀(s) + 1`, so the table's "`zetaEntireCompletion / 2`" is exact. |
| 5.6a | `summable_riemannXi_divisorZeroIndex₀_norm_inv_sq`, `RiemannZetaHadamard.lean` line 190 | As described. |
| 6.2 | `ZeroInequality`, `StrongPNT.lean` line 2218 | Requires `|t| ≥ 2` and `E ∈ (0, 1/14)`. |
| 6.4d | `ShiftTwoBound`, `ShiftOneBound`, `ZeroWindowFinite`, `ZeroWindow`, `StrongPNT.lean` lines 1854, 1949, 2144, 1698 | Requires `δ ∈ (0, 1)` and `|t| ≥ 2`. See R02. |
| 7.2 | `rectangleIntegral_logDeriv_eq_sum_meromorphicOrderAt`, `RectangleArgumentPrinciple.lean` line 280 | Sums the divisor on the rectangle. |
| 8.5 | `StrongPNT`, `StrongPNT.lean` line 2899 | `ψ` is `ChebyshevPsi` (line 28). |
| 4.5 remark | `riemannZeta.N`, `IEANTN/ZetaDefinitions.lean` line 141 | Sums the zeros with ordinate in `Ioo 0 T`, with multiplicity via `zeroes_sum` (lines 111–113). |

`sorry` occurs nowhere in `StrongPNT.lean`, `RectangleArgumentPrinciple.lean`, the three Hadamard files,
`RiemannZetaHadamard.lean`, `WeierstrassFactor.lean` or `CompletedXi.lean`. It occurs in `Kadiri.lean`, but
not in lines 665–744. The manifest records `primenumbertheoremand` with the commit, and its `cited_for`
matches the nine table rows. The section follows the porting guidance of the top-level `README.md` (lines
270–287): it is secondary, it prescribes nothing, and it asks for coordination first.

**Library names in the changed hunks, at the pins.**
- Mathlib: `Complex.exists_continuousOn_eqOn_exp_comp` (`Analysis/Complex/BranchLogRoot.lean:39`),
  `multipliableLocallyUniformlyOn_one_add` (`Analysis/Normed/Module/MultipliableUniformlyOn.lean:137`),
  `TendstoLocallyUniformlyOn.differentiableOn` (`Analysis/Complex/LocallyUniformLimit.lean:136`),
  `AnalyticOnNhd.sum_divisor_le` (`Analysis/Complex/JensenFormula.lean:389`), `meromorphicTrailingCoeffAt`
  (`Analysis/Meromorphic/TrailingCoefficient.lean:38`), `LocallyFiniteSupport.finite_inter_support_of_isCompact`
  (`Topology/LocallyFinsupp.lean:108`), `riemannZeta_def_of_ne_zero` (`NumberTheory/LSeries/RiemannZeta.lean:154`),
  `Gammaℝ_conj`/`Gammaℂ_conj` (`Analysis/SpecialFunctions/Gamma/Deligne.lean:80, 90`), `mellinInv_mellin_eq`
  (`Analysis/MellinInversion.lean:92`).
- Tau Ceti: `argumentPrinciple_nullHomologous` (`Analysis/Contour/Argument/Cycle.lean:110`),
  `exists_continuousOn_arg_lift_with_partition` (`…/Argument/Lift.lean:427`),
  `windingNumber_comp_eq_integral_logDeriv` (`Analysis/Contour/LogDerivFTC.lean:227`), `IsPiecewiseC1On`
  (`Analysis/Calculus/ContDiff/PiecewiseC1On.lean:91`), `idealSummatory_mul_eq_sub_integral_mul`
  (`NumberTheory/ArithmeticDirichletSeries/AbelSummation.lean:390`), `Real.logIntegral`
  (`Analysis/SpecialFunctions/LogIntegral.lean:141`).
- The worker's 20 unresolved names: the 14 at README lines 118–297 are LFunctions declarations
  (`TauCetiRoadmap/LFunctions/Suggested.lean` on main). The 6 at lines 1830–1833 are the
  PrimeNumberTheoremAnd names above.

**Sources, the seeded sample where it falls in the changed passages.**
- 1.3: `dlmf5` line 492 (5.11.9) ✓.
- 1.4: `dlmf5` line 160 (5.11.2), in the sector of line 104 ✓.
- 1.2: `dlmf5` line 108 (5.11.1) ✓.
- 5.3 and 8.2: Davenport §11 and §17 locators are unchanged (see Not verifiable). The 5.3 row is ✓.
- 5.4: the route on `Complex.exists_continuousOn_eqOn_exp_comp` (hypotheses `IsSimplyConnected U`,
  `IsOpen U`, which hold for `univ`) is the text reviewed at `4762be5`.
- 5.6a ✓ (table row).
- 7.2: the Tau Ceti theorem ✓, and the table row ✓.
- 1.1, 1.6, 3.2, 3.3, 4.4, 4.6, 8.1 and 8.6 are untouched, and their locators were checked in earlier
  rounds.

**Overlaps and ownership.** #1907 conflicts (R01). No id this README cites is dropped by an open pull
request, no id it cites is defined only by an open revision, and this pull request drops no id. The change
adds no object, so ownership is as settled in earlier rounds.

**Adversarial table.** Rows marked "carried" are from the previous report, for statements this diff leaves
untouched. The new rows cover every changed statement.

| Statement | Instances tried | Values | Result | Change |
| --- | --- | --- | --- | --- |
| 1.3a (carried) | `Re s = 1/2`; `s = 3/2, 3` | `‖Γ(1/2+it)‖² = π/cosh πt ≤ π`; `Γ(3/2) = 0.886`; `Γ(3) = 2` | sound | none |
| 1.4a conjugation (carried) | `s = i` | `Im ψ(i) = 2.0767`, `ψ(−i) = conj ψ(i)` | sound | none |
| 3.3, 3.4, `dirichletLFunction_convexity` (carried) | `Re s = −δ`; `q = 1, t = 0` | edge exponent `1/2 + δ`; `|ζ(1/2)| = 1.4604` | sound | none |
| `hadamard_of_orderLE_one` (carried) | `1 − s`; `exp(z²)` | `a = 0, b = −1`; order 2 fails `OrderLE _ 1` | sound | none |
| 5.6a / `riemannZeta_zeros_summable_ordinate` (carried) | `ρ₁` | `2/(1+14.1347²) = 0.00996` | sound | none |
| 6.4d / `neg_re_logDeriv_riemannZeta_le` (carried) | `t → 0`, `δ = 2|t|` | `1/(4|t|)` vs `log|t| → −∞`; `−ζ'/ζ(2) = 0.5700` | sound | none |
| zero-free regions (carried) | `s = 1/2`; mod 2 at `0` | `ζ(1/2) ≠ 0`; `0 < 1 − c/log 6` | sound | none |
| `riemannVonMangoldt`, `_dirichlet` (carried) | `T = 14, 100`; `q = 1` | `0` vs `−0.443`; `29` vs `28.12` | sound | none |
| 8.2, 8.4, 8.5, 8.7, 8.9 (carried) | `K = ℚ`; `q = 4`; `x = 10⁶` | `c_ℚ = −log 2π`; main term `Li x/2`; `Li − x/log x = 6244` | sound | none |
| Layer 5, 6 Dependencies (carried) | `*Needs:*` of 5.1–6.5 | inside lines 1154–1156 and 1323 | sound | none |
| 1.2, citation dropped | `s = 10` | `log Γ(10) = 12.801827`, Stirling `12.793497`, difference `0.008330 ≈ 1/120` | sound | none |
| 1.4, citation dropped | `z = 10` | `ψ(10) − ln 10 = −0.050833 = −1/20 − 1/1200` | sound | none |
| Provenance 1.4a vs README 1.4a | `s = 2`; `s = 4` | symmetric form `1.4150927313 = 1.4150927313`, `0.5817593980 = 0.5817593980`; PNT form `0.5699609931 = 0.5699609931`, `0.0636697650 = 0.0636697650` (with `ζ'(−3) = 0.0053785764`) | sound | none |
| Provenance 5.2 | `m = 1` | `(1 − z) e^{z}`; `E₁(0) = 1`, `E₁(1) = 0` | sound | none |
| Provenance 5.3 | `f = (z−1)²`; `f = z(z−1)` | two indices at `1`, product `E_m(z)²`; `hadamardDenom = z·E_m(z)`, divisor `{0 ↦ 1, 1 ↦ 1}` = divisor of `f` | sound | none |
| Provenance 5.5, "every entire function" | `f = 0` | `EntireOfOrderAtMost 1 0` holds, `hnot` fails; the conclusion would be `0 = exp(P z)` | false | R02 |
| Provenance 5.5, "agrees with `OrderLE`" | `f = 5, ρ = −1`; `e^z`, `e^{z²}` at `ρ = 1` | `OrderLE`: `5 ≤ 5·exp(‖s‖^{A′})`; `EntireOfOrderAtMost`: `exp(C(1+10⁶)^{−1/2}) = 1.001, 1.010, 1.105` (`C = 1, 10, 100`) `< 5`; at `ρ = 1` both hold for `e^z`, both fail for `e^{z²}` | true only for `ρ ≥ 0` | R02 |
| Provenance 5.5, `riemannXi = zetaEntireCompletion/2` | `s = 0, 2` | `1/2` vs `1`; `π/6 = 0.5235987756` vs `π/3 = 1.0471975512` | sound | none |
| Provenance 5.6a | `ρ₁ = 1/2 + 14.134725 i` | `1/(1+γ²) = 0.00498032 ≤ 1/‖ρ‖² = 0.00499899`; in general `β² ≤ 1` | sound | none |
| Provenance 6.2 | `t = γ₁` | `1 − E/log γ₁ > 0.973032 > β₁ = 0.5` | consistent | none |
| Provenance 6.4d | `t = 2` | ShiftOneBound centre `3/2 + 2i`; ShiftTwoBound centre `3/2 + 4i`, not `3/2 + 2i` | misdescribed | R02 |
| Provenance 7.2 | `f = z − 2`, `[−1,1]²`, `S = {2}` | divisor support on the rectangle `∅`, sum `0`, which is 7.2's corrected value | sound | none |
| Provenance 8.5 | `K = ℚ` | `(ψ − id) = O(x exp(−c (log x)^{1/2}))` | sound | none |
| 4.5 remark, `riemannZeta.N` | `T = 14`, `γ₁ = 14.134725`, `20` | README `N`: `0, 1, 1`; PNT `N` (`Ioo 0 T`): `0, 0, 1` | differ exactly at ordinates | none |

## Not verifiable

- Davenport, *Multiplicative Number Theory* (§§11, 17, the 5.3 and 8.2 sample locators); Titchmarsh; Lang;
  Iwaniec–Kowalski; Lagarias–Odlyzko. These are paywalled, as in earlier rounds, and the diff changes none
  of their locators.
- PrimeNumberTheoremAnd's `ResidueCalcOnRectangles.lean` (`RectangleIntegral'`, 7.2 row) was not
  re-fetched this round. It was read at the same commit in the previous review.

## Source issues

- **Misprint** in primenumbertheoremand at `IEANTN/Kadiri.lean`, the blueprint note of
  `kadiri_thm_3_1_q1_functional_eq` (line 729, commit `127b50e3`): the source says the statement is still
  to be formalised; it should say it is formalised, since its proof at lines 740–744 is complete; affects
  nothing.
