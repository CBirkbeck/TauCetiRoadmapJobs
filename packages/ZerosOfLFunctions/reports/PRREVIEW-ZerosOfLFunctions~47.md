# Review of ZerosOfLFunctions (pull request #1913 at ecaa5a7)

**Verdict:** accepted

:robot: AI-assisted review (Claude Opus 5.5). This is an incremental re-review of the 63 lines changed in `TauCetiRoadmap/ZerosOfLFunctions/README.md` since `ad6372b`. `Suggested.lean` and every file outside the folder are unchanged. The previous finding is repaired and the repair introduces no new defect. The gate passes and the dependency check reports no problem.

This report has no findings.

## Previous findings

- R01 — repaired: the 8.6 Weil clause (lines 2376–2379) now reads "with the rectangle of 7.1 and Tau Ceti `TauCeti.Contour.classicalResidueTheorem_nullHomologous` for the shift, the residue `m_ρ φ̃(ρ)` at a zero `ρ` read off `…logDeriv_eventuallyEq_principalPart` and `…residue_eq_of_tendsto_sub_mul`". The contract (lines 274–289) lists all three declarations, as the repair asked, plus four more.

The previous report's remark on untouched text is also acted on. The *Needs:* lines of 8.2 (lines 2165–2173) and 8.4 (lines 2249–2253) now cite 7.1 and the residue theorem, not 7.2. So "their inputs" in the first clause of 8.6 (line 2369) is now accurate.

## Verified sound

### Gate

I re-ran the gate at `ecaa5a7`:

```text
gate ZerosOfLFunctions: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

The worker's run, which includes the targeted build, also reports `build=0`. `git diff --stat origin/main...HEAD` outside the folder is empty. The folder holds only `README.md`, `Suggested.lean` and `metadata.toml`.

### Dependency check

Output: `depcheck: 234 roadmaps, 2261 edges, 0 problem(s)`. There is no UPWARD and no CYCLE line. The change adds no supplier: every new item is a section of this roadmap or a declaration at the Tau Ceti pin (`2fd255d`).

### Elaboration

- `lake env lean TauCetiRoadmap/ZerosOfLFunctions/Suggested.lean` exits with `0` and prints 19 ``declaration uses `sorry` `` warnings and nothing else.
- The worker's scratch file with `#check @…` for all 22 declarations elaborates with no error. The Lean file has no `variable` or `include` line, so no declaration can lose a binder.
- `Suggested.lean` is byte-identical to `9b48d25`, so the earlier padding probe stands: none of the 19 theorems closes with a single tactic.

### The new contract entries, opened at the pin

All seven declarations are in `namespace TauCeti.Contour` under `TauCeti/Analysis/Contour/`. Each README paraphrase matches the pinned statement.

| README claim (lines 274–289) | Pinned declaration, file:line | Hypotheses and conclusion at the pin |
| --- | --- | --- |
| residue theorem for a closed piecewise-`C¹` null-homologous curve | `classicalResidueTheorem_nullHomologous`, `Residue/Cycle.lean:226` | `IsOpen U`; `DifferentiableOn ℂ f (U \ S)`; `∀ s ∈ S, s ∈ U → MeromorphicAt f s`; `IsPiecewiseC1On γ a b`; `γ` in `U`; `γ a = γ b`; avoids `S`; `IsNullHomologous γ a b U`. Gives `∫ deriv γ • f ∘ γ = 2πi ∑ windingNumber γ a b s * residue f s`. |
| the residue | `residue`, `Residue/Basic.lean:80` | the order-`(−1)` Laurent coefficient; `0` when analytic and junk `0` when not meromorphic |
| principal part of `logDeriv` | `logDeriv_eventuallyEq_principalPart`, `Argument/Principle.lean:97` | `MeromorphicAt F s` and order `n` give `g`, analytic and nonzero at `s`, with `logDeriv F =ᶠ[𝓝[≠] s] n (z − s)⁻¹ + logDeriv g` |
| analyticity of `logDeriv` | `analyticAt_logDeriv_of_analyticAt`, `LogDerivFTC.lean:165` | `AnalyticAt f z`, `f z ≠ 0` |
| residue as a limit | `residue_eq_of_tendsto_sub_mul`, `Residue/SimplePole.lean:152` | `MeromorphicAt f z₀` and `(z − z₀) f z → L` on `𝓝[≠] z₀` |
| additivity | `residue_add`, `Residue/Basic.lean:343` | both summands meromorphic at `z₀` |
| Cauchy kernel | `residue_div_sub_pow_of_analyticAt`, `Residue/Basic.lean:467` | `g(z)/(z − z₀)^(k+1)` has residue `iteratedDeriv k g z₀ / k!` |

The Tau Ceti pin also has `TauCeti.Contour.Cycle.classicalResidueTheorem_nullHomologous` (`Cycle/Residue.lean:138`), stated for contour cycles. The README's fully qualified name picks the single-curve version, which is the one whose hypotheses it paraphrases.

### The contract's two derived residues, in Lean

- **Simple poles.** The residue `g(s) n` of `g · logDeriv F` is the previous report's scratch example. It uses `logDeriv_eventuallyEq_principalPart`, `analyticAt_logDeriv_of_analyticAt` and `residue_eq_of_tendsto_sub_mul`.
- **The double pole at `0`.** The residue `−n g′(0) − (logDeriv h)(0) g(0)` of `−logDeriv F(z) g(z)/z` at `0` is new.
  - I proved it in a scratch module with `lake env lean`, using only the lemmas the contract lists. Write the integrand as `A + (f − A)` with `A z = −n g(z)/(z − 0)^2`. Then `residue_add` splits it, `residue_div_sub_pow_of_analyticAt` at `k = 1` gives the residue of `A`, and `residue_eq_of_tendsto_sub_mul` gives the residue of `f − A`. Its limit is taken through the germ of `logDeriv_eventuallyEq_principalPart` with `Tendsto.congr'`.
  - The file elaborates with no error or warning.
  - A second version goes through `TauCeti.Contour.residue_congr_nhdsNE` (`Residue/Basic.lean:146`) and also elaborates. That lemma is not needed, so the list is complete as written.

### The changed *Needs:* lines

**8.2.** The integrand is `(−ζ'_K/ζ_K)(s) x^s/s`.

- At `1`, at each `ρ` and at each trivial zero `−m`, the factor `x^s/s` is analytic. The residue is `−ord · x^s/s` there, which gives `x`, `−m_ρ x^ρ/ρ` and `(order) x^{−m}/m`. These are the residues the 8.2 statement lists.
- At `0`, write `n = r₁ + r₂ − 1`, so that `logDeriv ζ_K = n/s + logDeriv h`. The residue is `−n log x − (logDeriv h)(0)`. Also `c_K = lim (−ζ'_K/ζ_K + n/s) = −(logDeriv h)(0)`, so the residue is `c_K − n log x`, as stated.
- The pole at `0` has order `2` exactly when `n ≠ 0`, that is when `r₁ + r₂ ≥ 2`.
- Finiteness of the singular set near the rectangle comes from 4.5 (`N(T)` finite) and 1.5 (the trivial zeros are the nonpositive integers). Both are on the line.

**8.4.** `φ̃` is entire, so the residue of `(Λ_K'/Λ_K) φ̃` at a point of order `n` is `n φ̃`. That gives `m_ρ φ̃(ρ)` at the zeros and `−φ̃(0)`, `−φ̃(1)` at the simple poles, as the route in the 8.4 statement (line 2231) says.

**8.6.**

- The truncated clause names "7.1, the residue theorem and residue lemmas of 8.2". These are general in `F` and so cover `L(χ, ·)`, whose order at `0` is `#{a_j = 0} + r₂`.
- The Weil clause needs only zeros, because `Λ(χ, ·)` is entire for `ψ ≠ 1`.

**Layer 8 Dependencies.** In the Dependencies list (line 2706), 7.2 is replaced by 7.1. No Layer 8 text (lines 2140–2713) cites 7.2 any more; I counted 0 occurrences. The remaining 7.2 citations are in Layers 7 and 9 and the Provenance table, where 7.2 is still the input.

**Scope.** Line 62 now lists "the residue theorem" as realized from the contour integration roadmap. Completed `ContourIntegration/README.md` on main states the classical residue theorem for a null-homologous cycle (its lines 102 and 158–174), and Tau Ceti realizes it at `Residue/Cycle.lean:226`. Line 123 agrees with how Layer 8 consumes it.

**Contract coverage of the *Needs:* lines.** The 8.4 and 8.6 lines do not repeat `analyticAt_logDeriv_of_analyticAt`. The contract assigns it to "the contour shifts of 8.2, 8.4 and 8.6" (lines 278–279), so these lines are covered.

### Seeded sample, where it falls in the change

The changed lines cite 1.5, 4.5, 5.6a, 6.3 (through "6.3–6.4" in 8.6) and 8.3. Each is apt for the use made of it:

- **1.5** gives the pole orders of `γ_K` and `γ_χ`. The trivial-zero residues below confirm them: order `2` at `−2` for `ℚ(√5)`, order `1` at `−1` for `ℚ(i)`.
  - The locator DLMF 5.11.9 (`dlmf-5.11` line 490–492) gives `|Γ(x+iy)| ~ √(2π)|y|^{x−1/2} e^{−π|y|/2}`.
  - For `Gammaℝ`, the remainder `log|γ| + π|t|/4 − ((σ−1)/2) log|t|` is `0.806046` at `t = 100` and `0.806043` at `t = 1000` for `σ = 1/2`. It is `−0.572365` at both heights for `σ = 2`. The remainder is bounded, as 1.5 states.
- **4.5** gives the choice of `T` and the finiteness of the zero set.
- **5.6a** confines the zeros to the closed strip.
- **6.3** and **8.3** are not changed and are cited as before. The residues of 8.2 that 8.3 sums are confirmed in the table. Its source, Davenport §17, is uncertified.

The other sampled targets (1.1, 1.3a, 3.1, 3.4, 3.5, 5.5, 6.1, 7.6, 8.8, 8.9) lie outside the changed passages and their citations.

### Overlaps and ownership

- `overlaps.md` lists #1907, which changes this roadmap, conflicts with it in both files, and still carries the old 8.2 line "8.1, 7.2, 5.6, 1.4, 1.5, 4.5" at its head. The generated `merge-order` block orders this pull request first, with #1907 rebased onto it and keeping its text, so the order is stated.
- No id this README cites is dropped by an open pull request, and no id it drops is cited elsewhere.
- The change adds no owned object, only *Needs:* and contract text. The ownership result of the previous reviews stands.
- `citations.md` lists 13 names, all on untouched lines (Provenance and the L-functions `Grossencharacter` block). The previous review resolved them.

### Adversarial table

Rows marked *new* were computed this round, with contour integrals on circles of radius `0.05` (256 nodes) and Simpson's rule on the square, in double precision, using Euler–Maclaurin Hurwitz zeta and Lanczos gamma. Rows marked *carried (r45)* are the previous report's, for statements this diff leaves untouched.

| Statement | Instances | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| *new* — previous R01, "7.2 for the residues" (now the residue theorem) | `F = z²`, weights `z`, `eᶻ`, `1` | 7.2's count is `2` for every weight; weighted residues `0.00000000`, `2.00000000`, `2.00000000` = `g(0) · 2` | repaired | none |
| *new* — contract: `classicalResidueTheorem_nullHomologous` as paraphrased | `eᶻ/z²`, `eᶻ/(z(z − 2))` on the boundary of `Icc (−1) 1 ×ℂ Icc (−1) 1` | `6.28318531i = 2πi · 1`; `−3.14159265i = 2πi · (−1/2)`, the pole at `2` outside with winding `0` | true | none |
| *new* — contract: `residue_div_sub_pow_of_analyticAt` | `eᶻ/z^(k+1)`, `k = 0, 1, 2` | `1.00000000`, `1.00000000`, `0.50000000` against `1/k!` | true | none |
| *new* — contract: residue `−n g′(0) − (logDeriv h)(0) g(0)` at `0` | `F = z(z − 2)` (`n = 1`, `h = z − 2`), `g = 10^z` | contour `−1.80258509`; formula `−log 10 + 1/2 = −1.80258509`; Lean proof from the listed lemmas elaborates | true | none |
| *new* — 8.2 residues at `1` and at trivial zeros | `x = 10`; `ℚ`, `ℚ(i)`, `ℚ(√5)` | `Res₁ = 10.00000000` in each; `ℚ(√5)`: `Res₋₂ = 0.01000000 = 2 · 10⁻²/2`, `Res₋₁ = 0` (`r₂ = 0`); `ℚ(i)`: `Res₋₁ = 0.10000000`, `Res₋₂ = 0.00500000` | true | none |
| *new* — 8.2 residue `c_K − (r₁ + r₂ − 1) log x` at `0`; order `2` iff `r₁ + r₂ ≥ 2` | `x = 10`; `ℚ`, `ℚ(i)`, `ℚ(√5)`, `ℚ(ζ₅)` | order of `ζ_K` at `0`: `0, 0, 1, 1`; `a₋₂ = 0, 0, −1, −1`; `Res₀ = −1.83787707, −2.62106585, −4.11843750, −5.41401807`, each equal to `c_K − n log x`; `c_ℚ = −log 2π`; the wrong sign `c_K + n log x` gives `0.48673268` and `−0.80884788` for the last two | true | none |
| *new* — 8.4 residues `m_ρ φ̃(ρ)`, `−φ̃(0)`, `−φ̃(1)` | completed `ζ` and `Λ_{ℚ(√5)}`, weight `eˢ`; `ρ₁ = 1/2 + 14.134725i` | `Res₁ = −2.71828183 = −e` and `Res₀ = −1.00000000` for both; `Res_{ρ₁} = 0.004026 + 1.648716i = e^{ρ₁}` | true | none |
| *new* — 8.6 Weil clause: residue `m_ρ φ̃(ρ)`, no pole term | `Λ(χ₋₄, ·)`, weight `eˢ`, first zero `1/2 + 6.02094890i` | `Res_ρ = 1.592356 − 0.427416i = e^ρ`; `Res₀`, `Res₁` below `3 · 10⁻¹³` | true | none |
| *new* — 8.6 truncated clause: 8.2's residue lemmas for `L(χ, ·)` | `χ₋₄`, `χ₅`, `x = 10` | order at `0`: `0`, `1`; `Res₀ = −0.78318879`, `−2.28056044`, each `c_χ − n log x` | true | none |
| *new* — Layer 8 Dependencies: 7.2 replaced by 7.1 | README lines 2140–2713 | `0` remaining citations of 7.2; 7.1 and the residue theorem cited in 8.2, 8.4, 8.6 | true | none |
| *new* — 1.5 growth, the input for `γ_χ` (cited by the change) | `Gammaℝ`, `Gammaℂ`; `σ = 1/2, 2`; `t = 100, 1000` | remainders `0.806046 / 0.806043`, `−0.572365 / −0.572365` (`Gammaℝ`); `0.693147 / 0.693147`, `−2.063618 / −2.063668` (`Gammaℂ`) | true | none |
| *carried (r45)* — `isFiniteOrder_ofRayClassCharacter` feeds the parity chain | quartic `χ` mod 5 with `χ(2) = i`; `χ⁻¹`; `χ₋₄`; `ℚ(√3)` narrow `ψ` | `χ(−1) = i² = −1`, shift `1`; `χ⁻¹(−1) = −1`, same shift; real characters self-inverse; chain elaborates for `ψ` and `ψ⁻¹` | true | none |
| *carried (r45)* — 8.6: 6.5 for the order at `0` | `χ₋₄`; `χ₅` | `L(0, χ₋₄) = 1/2`; `L'(0, χ₅) = 0.481212`, `Λ(χ₅, 0) = 0.962424 = Λ(χ₅, 1)` | true | none |
| *carried (r45)* — 6.5 | trivial character at `1`; `ζ` at `1+2i`; `χ₄` at `1` | `ord Λ = −1`; `0`; `0.500000` | true | none |
| *carried (r45)* — `heckeLFunction_weilExplicitFormula` | `χ₋₄`; `ℚ(√3)` narrow; quartic mod 5 | `log 4 = 1.3863`; `log 12 = 2.4849`, `L(0) = 1/6`; `+0.346574i` | true | none |
| *carried (r45)* — 0.4 *HasVerticalStripGrowth* | pole at `1+5i`; `1`; `exp(−s²)` | unbounded at `t = 5`; `C=1, A=0`; `exp(t²)` | sound | none |
| *carried (r45)* — 1.1 *logGamma* | `θ = π/2, π/4, 0.1`; value at `3` | `r = 5.53860, 4.15135, 12.62640`; `2.000000` | sound | none |
| *carried (r45)* — 1.2 Stirling | §5.11(ii), `n = 1` | `\|R\| ≤ 1/(12‖s‖ sin²(δ/2))` | sound | none |
| *carried (r45)* — 1.3 strips | `z = σ+it` | `ln\|z\| = ln\|t\| + O(t⁻²)` | sound | none |
| *carried (r45)* — 1.4 gamma log-derivatives | `s = 2, 3, 1`; `−2` | `−0.860973`, `−0.554120`, `−2.415093`; junk `−(log π)/2` | sound | none |
| *carried (r45)* — 1.4a | `s = 2`; `−2`; `ψ(i)` | `1.415093`; `−0.16482` vs `0.55412`; `2.076674` | sound | none |
| *carried (r45)* — 2.4 newform conductor | `Δ`, `k = 12` | `90` vs `15.75` | sound | none |
| *carried (r45)* — 4.2 divisor of `Λ` | `ζ` at `1`, `−2` | `0`, `−1`; `0`; `−1 + 1 = 0` | sound | none |
| *carried (r45)* — 4.4 local count | `ζ`, `T = 0, √15` | `15708`; `1.218·10⁻⁵`; `1.147880`; `2.1942` | sound | none |
| *carried (r45)* — 4.6 Nevanlinna | `z²(z−3)`; `1/z` | `1.386 ≤ 1.674`; `1.5325` | sound | none |
| *carried (r45)* — 5.2 *E₁* | `z = −½`, `1` | `0.09020 ≤ 0.125`; `−e` | sound | none |
| *carried (r45)* — 5.6 `Re b` | `zetaEntireCompletion`; `χ₄` | `b = −0.023096`; `Λ(0) = Λ(1) = 1/2` | sound | none |
| *carried (r45)* — 6.3 *IsExceptionalZero* | cap; `ζ` | `≤ 1/2`; empty | sound | none |
| *carried (r45)* — 6.4 region | moduli 2, 6; (4d) | `1.2619`; `log 18 = 2.890`; `13.8581` | sound | none |
| *carried (r45)* — 7.4 `riemannVonMangoldt` | `T = 2` | `N(2) = 0`, main term `−0.682` | true | none |
| *carried (r45)* — 8.5 checks | `x = 10`, `10⁶` | `2.4849 ≤ 12.094`; `1102.42 ≤ 137682.40` | sound | none |
| *carried (r45)* — 8.7 ray-class count | `q = 1, 3, 10⁶`; `(4)∞` | `0.6957`, `2.4958`, `190.868`; `3.0445` vs `4.1431` | sound | none |
| *carried (r45)* — 8.9 `Li` | `x = 10`, `10⁴` | `5.12044`; `159.356` vs `117.882` | sound | none |
| *carried (r45)* — `dirichletLFunction_convexity` | `q = 1, 2` | vacuous at 2; `¼ + δ/2` | true | none |
| *carried (r45)* — `hadamard_of_orderLE_one` | `ρ = 0`; `1 − s` | `E₁(1) = 0`; `a = 0`, `b = −1` | true | none |
| *carried (r45)* — `zetaEntireCompletion` | `s = 0, 1` | `1`, `1` | sound | none |
| *carried (r45)* — `riemannZeta_zeros_summable_ordinate` | first pair | `0.00996` | true | none |
| *carried (r45)* — `heckeLFunction_zeroFreeRegion` | `n = 0`; `ℚ`, `ψ = 1` | vacuous; `≥ log 3 > 0` | true | none |
| *carried (r45)* — `riemannZeta_zeroFreeRegion` | real `s`; `s = 1` | `ζ < 0` on `(0, 1)`; excluded | true | none |
| *carried (r45)* — `dirichletLFunction_zeroFreeRegion` | mod 2; mod 6 | zeros on `Re s = 0`; `c ≥ 2.890` | true | none |
| *carried (r45)* — `neg_re_logDeriv_riemannZeta_le` | `δ ≥ 1`; `\|u\| ≥ 1`; `t → 0` | `0.5700`; `1/(2\|u\|)`; `1/(4\|t\|)` | true | none |
| *carried (r45)* — `riemannVonMangoldt_heckeLFunction` | `ψ = 1` vs HSW | `hasanalizade2022` line 27 | true | none |
| *carried (r45)* — `riemannVonMangoldt_dirichlet` | BMOR; `q = 1` | `bennett2021` lines 83–84; `2N(T)` | true | none |
| *carried (r45)* — `chebyshevPsi_explicitFormula` | constant; `T ≤ x` | `−log 2π = −1.8379` | true | none |
| *carried (r45)* — `dedekindZeta_weilExplicitFormula` / `riemannZeta_weilExplicitFormula` | `ℚ(i)`; `ℚ(√5)`; `ℚ` | `log 4`; open strip excludes `φ̃(0)`; `−(log π)φ(1)` | true | none |
| *carried (r45)* — `primeIdealCount_effective` | `K = ℚ`, `x = 10` | `π(10) = 4` vs `16/3` | true | none |
| *carried (r45)* — `rayClassPrimeCount_effective` | `(3)∞`; `ℚ(√−5)` | `#Cl = 2`; `p ≡ 1, 9 (mod 20)` | true | none |
| *carried (r45)* — `primeCounting_progression_effective` | `q = 4`, `a = 2`; `q = 1` | count `1`; `π(x)` | true | none |
| *carried (r45)* — `frobeniusPrimeCount_effective_abelian` | `K = L = ℚ`; `ℚ(i)/ℚ`; `(8)∞` | `π(x)`; `1/2`; `(2/5) = −1` | true | none |

## Not verifiable

- **Uncertified texts, cited by locator.** Davenport (`davenport2000`, §§17–20, for 8.2, 8.3, 8.5 and 8.6) and Lang XVII §3 (`lang1994`, for 8.4) are settled as uncertified. The change does not touch their locators. The residues that 8.2 and 8.4 attribute to them were computed instead (table above).
- **Ownership against every sibling checkout.** I relied on `overlaps.md` (#1907) and on the previous reviews' search, since the change adds no owned object.

## Source issues

- none
