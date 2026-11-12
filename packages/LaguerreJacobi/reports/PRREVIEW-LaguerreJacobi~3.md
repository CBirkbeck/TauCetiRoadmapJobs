# Review of LaguerreJacobi (pull request #117 at 8e25e5e)

**Verdict:** needs changes

## R01 (P2) — the §3.1 target is already a Tau Ceti theorem at the pin

**Location:** README line 432, `ProbabilityTheory.intervalIntegral_rpow_mul_rpow_one_sub_eq_beta : 0 < u → 0 < v → ∫ x in (0:ℝ)..1, x ^ (u-1) * (1-x) ^ (v-1) = ProbabilityTheory.beta u v`; line 67, "It owns: … the interval form of the real Beta integral"; `Suggested.lean` lines 201–210.
**Claim:** the interval form of the real Beta integral is missing at the pins and is owned here.
**Witness:** at the Tau Ceti pin, `TauCeti.integral_rpow_mul_one_sub_rpow` (`TauCeti/Analysis/SpecialFunctions/Beta.lean` line 125) has exactly this type. In a scratch file the target closes by `exact TauCeti.integral_rpow_mul_one_sub_rpow hu hv`.
**Repair:**
- Delete the target from README §3.1 and from `Suggested.lean`, together with its `namespace ProbabilityTheory` block and the clause "the Beta integral in interval form" in the module docstring (line 23).
- Replace §3.1's target paragraph with: "The interval form is Tau Ceti's `TauCeti.integral_rpow_mul_one_sub_rpow` (`TauCeti/Analysis/SpecialFunctions/Beta.lean` line 125): for `0 < a`, `0 < b`, `∫ t in 0..1, t ^ (a - 1) * (1 - t) ^ (b - 1) = ProbabilityTheory.beta a b`. The symmetry is `ProbabilityTheory.beta_comm` (line 422)."
- List both under `From Tau Ceti`.
- Delete "the interval form of the real Beta integral;" from line 67.
- In the description, replace "the interval-integral form is a corollary target" with "the interval-integral form is Tau Ceti's `TauCeti.integral_rpow_mul_one_sub_rpow`".

## R02 (P3) — the gate fails: `readme-ids-missing` (8)

**Location:** README lines 139–141, 154–156, 501, 708: `Polynomial.degree_shiftedLegendre`, `Polynomial.factorial_mul_shiftedLegendre_eq`, `Polynomial.iterate_derivative_eq_zero_of_degree_lt`, `Polynomial.iterate_derivative_mul`, `Polynomial.neg_one_pow_mul_shiftedLegendre_comp_one_sub_X_eq`, `ProbabilityTheory.beta_eq_betaIntegralReal`, `ProbabilityTheory.beta_pos`, `ProbabilityTheory.lintegral_betaPDF`.
**Claim:** these backticked names pass the gate.
**Witness:** the gate prints `readme-ids-missing=8 … FAIL`: names under `Polynomial` or `ProbabilityTheory` must occur in the Lean text. All eight are Mathlib declarations at the pin (`ShiftedLegendre.lean` 46, 91, 102; `Derivative.lean` 306, 699; `Beta.lean` 36, 41, 78).
**Repair:** name each of the eight in the docstring of the theorem whose route uses it:
- the two orthogonality theorems: "the off-diagonal terms vanish by `Polynomial.iterate_derivative_eq_zero_of_degree_lt`; `Polynomial.iterate_derivative_mul` expands the Rodrigues derivative";
- `jacobi_neg_comp`: "the analogue of `Polynomial.neg_one_pow_mul_shiftedLegendre_comp_one_sub_X_eq`";
- `shiftedLegendre_map_eq_jacobi_comp`: "compare `Polynomial.factorial_mul_shiftedLegendre_eq` and `Polynomial.degree_shiftedLegendre`";
- `jacobiNormSq_pos`: "at `n = 0` by `ProbabilityTheory.beta_pos`";
- `isFiniteMeasure_jacobiMeasure`: "from `ProbabilityTheory.lintegral_betaPDF` after `x = 2t − 1`".

Delete `ProbabilityTheory.beta_eq_betaIntegralReal` from the README, since no target uses it once R01 is applied. Then rerun the gate.

## R03 (P3) — padding in `Suggested.lean`, and a module docstring that frames it as a name catalogue

**Location:** `Suggested.lean` lines 11–15: "The statements here suggest Lean forms for the roadmap's headline targets, so that contributors and reviewers converge on names and signatures; discharging all of them finishes neither a layer nor the roadmap." Also the 14 declarations listed below.
**Claim:** every declaration is a headline the finished roadmap is tested against.
**Witness:** on a scratch copy one tactic closes six: `simp [laguerre]`, `simp [jacobi]`, `exact natDegree_eq_of_degree_eq_some (degree_laguerre α n)`, one `rw` (`leadingCoeff_jacobi`), one `norm_num` (`gegenbauer_neg_one_two`, `jacobiNormSq_neg_half_neg_half_zero`). The other eight are small values, restatements of a definition, or `n = 0` and `λ = 0` cases.
**Repair:**
- Delete from `Suggested.lean`: `laguerre_zero`, `laguerre_one`, `coeff_laguerre`, `natDegree_laguerre`, `integral_laguerreMeasure`, `jacobi_zero`, `jacobi_one`, `leadingCoeff_jacobi`, `jacobiNormSq_zero_eq_quotient`, `gegenbauer_one`, `gegenbauer_two`, `gegenbauer_neg_one_two`, `gegenbauer_zero_param` and `jacobiNormSq_neg_half_neg_half_zero`.
- In the README (lines 229–231, 318, 463–467, 599, 731, 739, 764, 788), state those facts in prose without the backticked names. The Check at line 764 then names no Lean counterpart.
- Replace docstring lines 11–15 with: "`README.md` is the roadmap; this file is not the roadmap. It states the roadmap's headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, with the definitions they need."

## R04 (P3) — four open roadmaps cite ids this head no longer has

**Location:** README headings `## Layer 1` … `## Layer 6`, `### k.n`. No old → new numbering anywhere.
**Claim:** renumbering Parts A–F into Layers 1–6 breaks no citation.
**Witness:** at their heads: QuantumFoundations lines 72 and 1021 ("LaguerreJacobi A1–A4, B1–B4", "A1–A3, B1–B4"); SpecialFunctionsBessel line 754 ("F1–F2"); SpecialFunctionsConfluent lines 395–396 and 932 ("A1", "B3"); NoncompactQuantumSymmetry lines 205 and 6265 ("A/B", "A–B"). This README defines none of these ids.
**Repair:** at the end of "How to read the build", add a table headed `Former id | Section`, one row per id: A1–A4 → §1.1–§1.4, B1–B4 → §2.1–§2.4, C1–C4 → §3.1–§3.4, D1–D4 → §4.1–§4.4, E → Layer 5, F1–F3 → §6.1–§6.3. These are the old Part A–F targets (`git show b01ad60`), in the same order.

## R05 (P3) — named consumers that do not consume this roadmap

**Location:** README lines 79–80: "the PDE roadmap owns an eigenfunction-expansion statement and consumes the bases here". Lines 819–825: "SpecialFunctionsLegendre states, … those roadmaps … cite these targets for the polynomial statements. … Layers 2 and 4 supply the bases that the PDE roadmap consumes".
**Claim:** PDE and SpecialFunctionsLegendre cite this roadmap.
**Witness:** `TauCetiRoadmap/PDE/README.md` on main contains no "LaguerreJacobi"; its eigenfunction expansion (line 428) is the bounded-domain Dirichlet basis. The SpecialFunctionsLegendre head contains no "LaguerreJacobi" and owns 14.17.6–14.17.9 for all `m` itself (§7.3, line 806).
**Repair:**
- End the bullet at line 80 after "spectral and PDE theory".
- Replace lines 819–825 with: "SpecialFunctionsBessel 2.5 consumes §6.2; SpecialFunctionsConfluent consumes §1.1 and §2.3; NoncompactQuantumSymmetry and QuantumFoundations consume Layers 1 and 2. The order-0 Legendre orthogonality is owned here (§6.1); SpecialFunctionsLegendre's 14.17.6 for general `m` contains it as its case `m = 0`."

## R06 (P3) — §6.3 re-derives a measure identity that Tau Ceti already proves

**Location:** README lines 786–787: "the agreement is proved with `MeasureTheory.restrict_withDensity` before any `measureT` lemma is consumed"; `From Tau Ceti` (lines 171–197).
**Claim:** no pinned declaration rewrites `measureT` into the shape `(volume.restrict s).withDensity`.
**Witness:** `TauCeti.chebyshevMeasureT_eq_withDensity` (`TauCeti/Analysis/SpecialFunctions/Trigonometric/Chebyshev/Measure.lean` line 113) elaborates as `measureT = (volume.restrict (Ioc (-1) 1)).withDensity fun x => ofReal √(1 - x ^ 2)⁻¹`. The same file has `chebyshevMeasureT_univ` (line 46) and `integral_eval_T_real_mul_eval_T_real_measureT_eq_ite` (line 174).
**Repair:**
- Add the three, and `TauCeti.chebyshevTNormSq` (line 138), to `From Tau Ceti`.
- Replace the quoted clause with: "after `TauCeti.chebyshevMeasureT_eq_withDensity` it remains to compare the densities on `Ioo (-1) 1` and to drop the null set `{1}`".
- Add `TauCeti.chebyshevMeasureT_eq_withDensity` to §6.3's *Needs:*.

## R07 (P3) — wrong and missing locators

**Location:** `Suggested.lean` line 91: "The three-term recurrence (DLMF 18.9.13 shifted by two)". README line 709, the locator of `shiftedLegendre_map_eq_jacobi_comp`: "*Locator:* DLMF 14.17.6; Table 18.6.1."
**Claim:** these locators support the statements.
**Witness:** DLMF 18.9.13 is the contiguous relation `Lₙ^{(α)} = Lₙ^{(α+1)} − Lₙ₋₁^{(α+1)}`. The recurrence is 18.9.1 with the Laguerre row of Table 18.9.1. The transport `P*ₙ(x) = Pₙ(2x − 1)` is 18.7.10, which neither locator names.
**Repair:**
- Line 91: write "(DLMF 18.9.1 with Table 18.9.1, shifted by one)".
- Line 709: write "*Locator:* DLMF 14.17.6 (orthogonality); 18.7.10 with Table 18.6.1 (`P̃ₙ(x) = (−1)ⁿ Pₙ(2x − 1) = Pₙ(1 − 2x)`); Table 18.3.1, shifted-Legendre row (`hₙ = 1/(2n+1)`)."

## R08 (P3) — "vanishes exactly when" is false over a general `ℚ`-algebra

**Location:** `Suggested.lean` lines 248–249 (docstring of `degree_jacobi`, stated over `[CommRing R] [Algebra ℚ R]`): "With `z = n + α + β + 1` this vanishes exactly for `n ≥ 1` and `z ∈ {0, -1, …, -(n-1)}`". The same claim is at README line 471.
**Claim:** `(z)ₙ = 0` iff `z ∈ {0, −1, …, −(n−1)}`.
**Witness:** take `R = ℚ × ℚ`, `n = 2`, `α = (−3, −4)`, `β = 0`. Then `z = (0, −1)` and `(z)₂ = (0, −1)·(1, 0) = (0, 0)`, but `z ≠ 0` and `z ≠ −1` in `R`.
**Repair:** begin the sentence at both places with "Over a domain, …". The instance is not a domain, so the restricted sentence no longer applies to it.

## Previous findings

- R01 — repaired: `Suggested.lean` exists and elaborates. It declares every backticked name instead of deleting the names, so it is padded (R03).
- R02 — repaired: line 735 reads "`(ascPochhammer R n).smeval lam ≠ 0`"; `Suggested.lean` lines 463–464 agree.
- R03 — repaired: lines 139–144 and 425–429 consume `ProbabilityTheory.beta`, `lintegral_betaPDF_eq_one` and `betaMeasure`. A different pinned duplicate remains (R01).
- R04 — repaired: line 188 reads "`MeasureTheory.Integrable.exp_abs_smul_of_ae_abs_le`"; §4.2's *Needs:* names `isFiniteMeasure_jacobiMeasure`.
- R05 — repaired: line 148 reads "`-1 < s → 0 < p → 0 < b → …`".
- R06 — repaired: there is no pin hash, URL, pull-request number or Coordination section; `From Tau Ceti` names files at the pin.
- R07 — repaired: lines 32–35 match the requested sentence.
- R08 — repaired: the statements are at lines 250, 254, 464, 505, 702 and 705.
- R09 — repaired: line 508 reads "`((1 : ℚ) / 2) • (C (n + α + β + 2) * …)`".
- R10 — repaired: the README has Layers 1–6, a *Needs:* line and a locator per target, and at least three Checks per definition.
- R11 — repaired: lines 105–107 and 316 use the bridge shape `(volume.restrict s).withDensity`.
- R12 — repaired: the description matches this head's folder change and suppliers.

## Verified sound

| Statement | Instances | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 1.1–1.2 Laguerre definition, recurrence, derivative, contiguous | 11 values of `α` (incl. `−1, −5/2`), `n ≤ 6`, exact over `ℚ` | 77 cases each: `(n+2)Lₙ₊₂` vs RHS; `L′ₙ₊₁` vs `−Lₙ^{(α+1)}`; `L₂^{(0)} = 1 − 2X + X²/2` | 0 failures | R07 (locator) |
| 1.3 `laguerre_rodrigues` | `n = 2`, symbolic `α` | `x^{−α}eˣ/2·(e^{−x}x^{2+α})″ = ((α+1)(α+2) − 2(α+2)x + x²)/2 = L₂^{(α)}`; DLMF Table 18.5.1 `κₙ = n!` | holds | — |
| 1.4 `eval_zero_laguerre` | 77 cases | `Lₙ^{(α)}(0)` vs `(α+1)ₙ/n!`; `α = 1`: `n+1`; DLMF 18.6.1 | holds | — |
| 2.1 `laguerreMeasure`, mass | `α ∈ {−½, 0.7, 2.3}` | numeric mass agrees with `Γ(α+1)` to 4e-16 (`α = −½`: `√π` = 1.7724539); DLMF Table 18.3.1 weight `e^{−x}x^α`, `α > −1` | holds | — |
| 2.2 exponential moment | `α = −½`, `a = ½` | numeric 2.5066283; `(½)^{−½}Γ(½) = √(2π)` = 2.5066283 | holds | — |
| 2.3 Laguerre orthogonality (headline) | `α ∈ {−½, 0.7, 2.3}`, `m,n ≤ 3`; `α ∈ {0,1,2}`, `m,n ≤ 5` exact | max error 2.1e-14; 108 exact cases vs `δ Γ(n+α+1)/n!` | holds | — |
| 2.4 Laguerre bases (headline) | bridge signatures at pin; `α = 0`, `n = 0` | pin `√(x^α e^{−x})·Lₙ/√hₙ` equals `weightL2Isometry_apply`'s `√(w x) • f`; `‖e^{−x/2}‖² = 1` | holds | — |
| 3.1 Beta interval integral | `(2,3)`; Tau Ceti pin | `∫₀¹ x(1−x)² = 0.0833333 = 1/12`; target closes by `TauCeti.integral_rpow_mul_one_sub_rpow` | duplicate | R01 |
| 3.2 `jacobi`, `coeff_jacobi_self`, `degree_jacobi` | 121 pairs `(α,β)`, `n ≤ 6` | 847 coefficient cases; `jacobi (−1) (−1) 1 = 0`; `(−5/2,−5/2,2)` leading coefficient `1/4`; `(0,1,1)`: `(3X−1)/2` vs swapped `(3X+1)/2` | 0 failures | R08 |
| 3.3 reflection, `Pₙ(1)`, recurrence, derivative | 847 cases each | `(s+3)((s+4)(s+2)X + α²−β²)` form vs DLMF 18.9.2 `Aₙ,Bₙ,Cₙ` × `2(n+1)(n+α+β+1)(2n+α+β)`: equal | 0 failures | — |
| 3.4 `jacobi_rodrigues` | `n = 1`, symbolic | `−½(1−x)^{−α}(1+x)^{−β}·d/dx[…] = ((α−β) + (α+β+2)x)/2 = P₁`; Table 18.5.1 `κₙ = (−2)ⁿn!` | holds | — |
| 4.1 `jacobiMeasure`, mass | `(0.3,−0.6)`, `(−½,−½)`, `(1.5,0.2)` | numeric 3.559120 vs `2^{α+β+1}B` 3.559121; π vs π; 1.901673 vs 1.901673 | holds | — |
| 4.2 exponential moment | `(0,0)`, `a = 1` | `2(e−1)` = 3.43656; the Tau Ceti lemma needs `Integrable 1` and gets it from `IsFiniteMeasure` | holds | — |
| 4.3 Jacobi orthogonality (headline), `jacobiNormSq` | `(−½,−½)`, `(0.3,−0.6)`, `(1.5,0.2)`, `m,n ≤ 3`; integer `α,β ≤ 2`, `m,n ≤ 4` exact | errors 2e-8, 2e-6, 7e-16; 225 exact cases; `hₙ/π` = `1, 1/8, 9/128`; `B(¾,¼)` = 4.442883 = `π√2` | holds | — |
| 4.4 Jacobi bases (headline) | `(0,0)`; `(−½,−½)` | first vectors `1/√2` and `(1−x²)^{−1/4}/√π`, norm 1 against mass 2 and π | holds | — |
| 5 tensor bases (headline) | `ι = Fin 2`, `α = 0`, `k = (1,0)` | vector `1 − x₁`, norm 1; `SigmaFinite (laguerreMeasure α)` resolved at elaboration | holds | — |
| 6.1 Legendre and shifted Legendre (headline) | `m,n ≤ 5` exact; `n ≤ 9` | `∫₋₁¹PₘPₙ`, `∫₀¹P̃ₘP̃ₙ`: 72 exact cases; `P̃ₙ = Pₙ(1−2X)` for all `n ≤ 9`; `Pₙ(2X−1)` fails at the 5 odd `n` | holds | R07 (locator) |
| 6.2 Gegenbauer: sum, degree, Jacobi relation, orthogonality (headline) | 11 values of `λ`, `n ≤ 6`; numeric `λ ∈ {0.3, ½, 1, 2.5}` | coefficient 77, degree 62, relation 77 exact cases; orthogonality error ≤ 4e-13; `h₀` vs mass at `λ = −0.3`: 6.268653 both | holds | R03 |
| 6.3 Chebyshev check (headline) | `n ≤ 9` exact; `n ≤ 5` numeric | `Pₙ^{(−½,−½)} = ((½)ₙ/n!)Tₙ` exact; `h₁` = 0.3926991 both sides; `measureT` unfolds by `rfl` | holds | R06 |
| Gate names (R02) | Mathlib pin | 8 of 8 declarations exist (`#check` resolves); the gate flags them | gate false | R02 |
| Padding probe (R03) | scratch copy | 6 declarations closed by one tactic; 8 more are values, restatements or boundary cases | padding | R03 |
| Consumer claims (R05) | PDE on main; SpecialFunctionsLegendre head | "LaguerreJacobi" occurs 0 and 0 times; the head states 14.17.6–9 for all `m` | false | R05 |
| `degree_jacobi` docstring (R08) | `ℚ × ℚ`, `n = 2`, `z = (0,−1)` | `(z)₂ = (0,0)` with `z ∉ {0,−1}` | false | R08 |

- DLMF text checked at 20 locators: 18.3 Table 18.3.1 (6 rows), 18.5.5, Table 18.5.1, 18.5.8, 18.5.10, 18.5.12, 18.6.1, Table 18.6.1, 18.7.1, 18.7.3, 18.7.10, 18.7.25, 18.9.1, Table 18.9.1, 18.9.2, 18.9.13, 18.9.15, 18.9.23, 14.17.6 and 5.12.1. The sampled targets 1.4, 2.1–2.4, 3.1–3.4, 4.1–4.3, 6.1–6.3 agree, except R07.
- Library declarations: 53 `#check @` at the pins (36 Mathlib at 6b7abb3, 17 Tau Ceti at a91d3aa), all resolve. Tau Ceti files and lines opened: `WeightedOrthogonalBasis.lean` 169/180/193/205, `PolynomialCompleteness.lean` 165, `Determinacy.lean` 243, `BoundedSupportExponential.lean` 56, `WeightL2Isometry.lean` 114/159, `L2/Pi.lean` 339/362, `Beta.lean` 125/422, `Chebyshev/Measure.lean` 46/113/138/174.
- Gate at 8e25e5e: `readme-ids-missing=8 FAIL` (R02); every other rule is 0 and the targeted build passes. Depcheck (`--movable`): `depcheck: 206 roadmaps, 1898 edges, 0 problem(s)`, with no UPWARD or CYCLE line. `LaguerreJacobi` is line 408; its only roadmap supplier, OrthogonalL2Bases (B1 line 250, B2 line 275, B3 line 318), is on main.
- Elaboration: `lake env lean` of `Suggested.lean` printed 57 `sorry` warnings and nothing else. `#check @` of all 63 declarations elaborated; there is no `variable` or `include` line, every binder is explicit, and each type matches its README statement. Both measures have the bridge's literal shape, and `Polynomial.Chebyshev.measureT` unfolds (`unfold …; rfl` elaborates).
- Overlap check: read OrthogonalL2Bases, SpecialFunctionsHypergeometric and SpecialFunctionsEiLiErfIncompleteGamma (main), and SpecialFunctionsOrthogonalPolynomialsGeneral, SpecialFunctionsLegendre, SpecialFunctionsGamma, SpecialFunctionsBessel and SpecialFunctionsConfluent (open). Shared, with owner: Hilbert-basis bridge and product basis — OrthogonalL2Bases B1–B3, consumed; order-0 Legendre orthogonality — LaguerreJacobi §6.1 (SpecialFunctionsLegendre §7.3 restates it, R05); Gegenbauer polynomial — LaguerreJacobi §6.2 (SpecialFunctionsBessel's `Complex.gegenbauerC` is a local copy citing it); real Beta interval integral — Tau Ceti (R01).
- NoncompactQuantumSymmetry (merge-order line 156) and QuantumFoundations (line 213) consume this roadmap from above it (line 408). Its suppliers are all on main, so the order can place it before them; nothing here needs to change for this.
- Ownership against open pull requests was checked with `roadmaps grep` over all 434 open heads and main. No other `Suggested.lean` declares `laguerre`, `jacobi`, `gegenbauer` or the two measures.

## Not verifiable

- Szegő, *Orthogonal Polynomials* §4.3 (README lines 834–836, "the `α + β + 1 = 0` remark"): AMS paywall. The `n = 0` constant was checked against DLMF Table 18.3.1's `𝒜₀` instead.
- Abramowitz–Stegun Ch. 22, Askey CBMS-NSF 21, Temme Ch. 6, Thangavelu: background references with no claim located in them; not read.

## Source issues

- none
