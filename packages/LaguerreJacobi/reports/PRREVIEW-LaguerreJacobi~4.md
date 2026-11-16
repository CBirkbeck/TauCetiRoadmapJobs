# Review of LaguerreJacobi (pull request #117 at 3e89142)

**Verdict:** needs changes

## R01 (P2) — the tensor products of the `√w` bases are promised and are not targets

**Location:** `TauCetiRoadmap/LaguerreJacobi/README.md` lines 8–9: "the resulting Hilbert bases of `L²`, in both the weighted-measure and the `√w` normalization, and their tensor products"; lines 67–68 (scope); lines 701–702: "The two-dimensional Laguerre functions `Lₘ(x) Lₙ(y) e^{-(x+y)/2}` form a basis of `L²((0, ∞)²)`"; line 689: "normalized one-variable Laguerre functions".
**Claim:** Layer 5 delivers the tensor bases of both normalizations, including a basis of the unweighted `L²((0, ∞)²)`.
**Witness:** Layer 5 has two targets (`Suggested.lean` lines 327–344), both over `Measure.pi fun _ => laguerreMeasure α` / `jacobiMeasure α β`. No target is over a product of `volume.restrict`. Line 689's vectors are polynomials, not the Laguerre functions §2.4 defines.
**Repair:**
- Add two Layer 5 targets, with the same *Needs:* line, and state them in `Suggested.lean` (this shape elaborates at the pins): `Polynomial.exists_hilbertBasis_pi_laguerreFunction` (`-1 < α`): a `HilbertBasis (ι → ℕ) 𝕜 (Lp 𝕜 2 (Measure.pi fun _ : ι => volume.restrict (Set.Ioi (0 : ℝ))))` whose vector at `k` is a.e. `fun x => ∏ i, algebraMap ℝ 𝕜 ((laguerre α (k i)).eval (x i) * Real.sqrt ((x i) ^ α * Real.exp (-(x i))) / Real.sqrt (Real.Gamma (k i + α + 1) / (k i).factorial))`; and `Polynomial.exists_hilbertBasis_pi_jacobiFunction` (`-1 < α`, `-1 < β`), likewise over `Measure.pi fun _ : ι => volume.restrict (Set.Ioo (-1 : ℝ) 1)` with `(jacobi α β (k i)).eval (x i) * Real.sqrt ((1 - x i) ^ α * (1 + x i) ^ β) / Real.sqrt (jacobiNormSq α β (k i))`. Say in prose that `MeasureTheory.Measure.restrict_pi_pi` identifies the measure with `volume.restrict (Set.univ.pi fun _ => Set.Ioi 0)`.
- Line 689: write "the product over `i` of the normalized Laguerre polynomials `Lₖᵢ^{(α)}(xᵢ) / √(Γ(kᵢ+α+1)/kᵢ!)`, the vectors of the first basis of §2.4".
- Line 701: write "At `α = 0` the functions `Lₘ(x) Lₙ(y) e^{-(x+y)/2}` are the vectors of `Polynomial.exists_hilbertBasis_pi_laguerreFunction` for `ι = Fin 2`."

## R02 (P3) — the boundary target at `∞` is weaker than what the integration by parts uses

**Location:** README lines 375–376: "The boundary terms vanish because `exp (-t) * t ^ (n+α)` and its derivatives of order below `n` tend to `0` at both ends"; lines 382–383 and `Suggested.lean` lines 130–133 (`tendsto_atTop_iteratedDeriv_laguerreWeight`).
**Claim:** the two `Tendsto` targets are the boundary terms of §2.3's route.
**Witness:** the boundary term of `MeasureTheory.integral_Ioi_mul_deriv_eq_deriv_mul` is `u * v` with `u` a derivative of `Lₘ^{(α)}`, a polynomial of degree up to `m`, unbounded at `∞`. At `m = 1`, `j = 0`: the term is `(1 + α - t) · e^{-t} t^{n+α}`, not `e^{-t} t^{n+α}`.
**Repair:** restate the target at `∞` with the polynomial factor (it elaborates at the pins and is true: every summand is `e^{-t} t^s`): for every `q : ℝ[X]`, `α`, `j`, `n`, `Tendsto (fun t : ℝ => q.eval t * iteratedDeriv j (fun t : ℝ => Real.exp (-t) * t ^ ((n : ℝ) + α)) t) atTop (𝓝 0)`. Replace lines 375–376 with: "The boundary terms are a polynomial times a derivative of order below `n` of `exp (-t) * t ^ (n+α)`; they tend to `0` at `0⁺`, where the polynomial is bounded, and at `∞`, where the exponential dominates."

## R03 (P3) — three sentences still place declarations in the namespace `ProbabilityTheory`

**Location:** README lines 439–440: "Names live in the namespaces `Polynomial` and `ProbabilityTheory`."; lines 215–216: "qualified by `Polynomial` or `ProbabilityTheory` and is not a Mathlib or Tau Ceti declaration is a declaration of `Suggested.lean`"; `Suggested.lean` lines 33–34: "The roadmap's own declarations live in the namespaces `Polynomial` and `ProbabilityTheory`".
**Claim:** this roadmap declares names under `ProbabilityTheory`.
**Witness:** `Suggested.lean` has one namespace block, `namespace Polynomial` (line 44) to `end Polynomial` (line 451); all 48 declarations are in it. Layer 3 has no `ProbabilityTheory` target since §3.1 cites `TauCeti.integral_rpow_mul_one_sub_rpow`.
**Repair:**
- Lines 439–440: "Names live in the namespace `Polynomial`."
- Lines 215–216: "A name in code font that is qualified by `Polynomial` and is not a Mathlib or Tau Ceti declaration is a declaration of `Suggested.lean`".
- `Suggested.lean` lines 33–34: "The roadmap's own declarations live in the namespace `Polynomial`, in which Mathlib has no declaration of the same name."

## R04 (P3) — the numbering table is introduced by the roadmap's history

**Location:** README lines 220–221: "Earlier drafts of this roadmap, and the roadmaps that cite it, number the targets in six parts A–F. The correspondence with the sections below is:".
**Claim:** the README is timeless.
**Witness:** "Earlier drafts of this roadmap" tells the reader how the text changed; the repository's rule is that a roadmap says what is wanted and not how it came to say it.
**Repair:** replace the two lines with: "Roadmaps that cite these targets by the ids A1–F3 read them as follows:". The table, with its header `Former id | Section`, stays.

## R05 (P3) — the list of Mathlib's `jacobi` names is not exhaustive

**Location:** README lines 30–31: "no declaration is a Jacobi polynomial (the occurrences of `jacobi` are `jacobiSum`, `jacobiTheta`, the Jacobi identity and Jacobian determinants)".
**Claim:** these are all the occurrences of `jacobi` in Mathlib.
**Witness:** at the Mathlib pin, `Mathlib/NumberTheory/LegendreSymbol/JacobiSymbol.lean` declares `jacobiSym` and 27 further `jacobiSym.*` names; `Algebra.PreSubmersivePresentation.jacobiMatrix` is a further family.
**Repair:** write "(the occurrences of `jacobi` are `jacobiSym`, `jacobiSum`, `jacobiTheta`, the Jacobi identity, and Jacobian matrices and determinants)".

## R06 (P3) — the reference entry omits two locators the text uses

**Location:** README lines 844–848: "Chapter 18 (open access). Locators used above: … 18.9.2, 18.9.13, 18.9.15, 18.9.23 (recurrences and derivatives); §14.17 (Legendre orthogonality)."
**Claim:** the entry lists the locators used above.
**Witness:** §1.2 (line 280) cites "DLMF 18.9.1 with Table 18.9.1" and §3.1 (line 457) cites "DLMF 5.12.1"; neither is in the list, and 5.12.1 and 14.17.6 are not in Chapter 18.
**Repair:** write "Chapters 5, 14 and 18" and, in the list, "18.9.1 with Table 18.9.1, 18.9.2, 18.9.13, 18.9.15, 18.9.23 (recurrences and derivatives); 14.17.6 (Legendre orthogonality); 5.12.1 (the Beta integral)".

## Previous findings

- R01 — repaired: lines 449–451, "The interval form is Tau Ceti's `TauCeti.integral_rpow_mul_one_sub_rpow` … for `0 < a`, `0 < b`"; the target and its namespace block are gone from `Suggested.lean`; the description reads "the interval-integral form is Tau Ceti's". Three sentences about the namespace remain (R03).
- R02 — repaired: the gate prints `readme-ids-missing=0`; the eight names are in docstrings (`Suggested.lean` lines 137, 199, 247, 273, 291, 358–359).
- R03 — repaired: the 14 declarations are deleted (48 remain); docstring lines 11–13 read "It states the roadmap's headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`".
- R04 — repaired: lines 223–230 map A1–A4, B1–B4, C1–C4, D1–D4, E, F1–F3. Its lead-in is R04 above.
- R05 — repaired: line 79 ends at "spectral and PDE theory"; lines 837–840 name SpecialFunctionsBessel, SpecialFunctionsConfluent, NoncompactQuantumSymmetry and QuantumFoundations, each of which cites this roadmap at its head.
- R06 — repaired: lines 200–204 list the four declarations; lines 803–804 read "After `TauCeti.chebyshevMeasureT_eq_withDensity` it remains to compare the densities"; line 813 has it under *Needs:*.
- R07 — repaired: `Suggested.lean` line 64 "DLMF 18.9.1 with Table 18.9.1, shifted by one"; README lines 727–728 cite 18.7.10 and the shifted-Legendre row.
- R08 — repaired: README line 489 and `Suggested.lean` line 186 begin "Over a domain".

## Verified sound

| Statement | Instances | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 1.1 Definition and degree | 8 values of `α` (incl. `−5/2, −1`), `n ≤ 5`, exact | degree `n`, leading coefficient `(−1)ⁿ/n!` in 48 cases; `L₂^{(0)} = 1 − 2X + X²/2`; `L₁^{(−1)} = −X`; DLMF 18.5.12 | holds | — |
| 1.2 recurrence, derivative, contiguous | same 48 cases | `(n+2)Lₙ₊₂` vs right side; `L′ₙ₊₁` vs `−Lₙ^{(α+1)}`; `Lₙ₊₁^{(α)}` vs difference: 0 mismatches; DLMF Table 18.9.1 row `−1/(n+1), (2n+α+1)/(n+1), (n+α)/(n+1)` | holds | — |
| 1.3 Rodrigues | `n = 0, 1, 2`, symbolic `α` | `n = 2`: `((α+1)(α+2) − 2(α+2)x + x²)/2` both sides; DLMF 18.5.5, Table 18.5.1 `F = x`, `κₙ = n!` | holds | — |
| 1.4 Special values | 48 cases | `Lₙ^{(α)}(0)` vs `(α+1)ₙ/n!`: equal; DLMF 18.6.1 | holds | — |
| 2.1 The measure | `α = −1/2, 0, 1` | mass `Γ(α+1)`: `√π`, 1, 1; DLMF Table 18.3.1 weight `e^{−x}x^α`, `α > −1` | holds | — |
| 2.2 exponential moment | `α = −1/2`, `a = 1/2` | `(1/2)^{−1/2}Γ(1/2)` = 2.5066283 = `√(2π)`; pinned lemma hypotheses `−1 < s`, `0 < p`, `0 < b` | holds | — |
| 2.3 The orthogonality relation (headline) | `α ∈ {0,1,2}`, `m,n ≤ 5` exact; `α ∈ {−0.9, −0.5, 0.7, 2.3}`, `m,n ≤ 3` | 108 exact cases equal `δ Γ(n+α+1)/n!`; float error ≤ 1.5e-11; boundary term at `m = 1` carries the factor `1+α−t` | holds | R02 |
| 2.4 The two Hilbert bases (headline) | pinned bridge signatures; `α = 0`, `n = 0` | pin `√(w x) • f` of `weightL2Isometry_apply` equals `Lₙ·√(x^α e^{−x})/√hₙ`; `‖e^{−x/2}‖² = 1` | holds | — |
| 3.1 The real Beta integral | `(2,3)`, `(1/2,1/2)` | `1/12 = Γ(2)Γ(3)/Γ(5)`; `π`; pinned type `∫ t in 0..1, t^(a−1)(1−t)^(b−1) = beta a b`; DLMF 5.12.1 | cited, not restated | R03 |
| 3.2 Definition and degree | 64 pairs `(α,β)`, `n ≤ 4`, exact | coefficient of `Xⁿ` vs `(n+α+β+1)ₙ/(2ⁿn!)` in 320 cases; `P₁^{(0,1)} = (3X−1)/2`; `P₁^{(−1,−1)} = 0`; `P₂^{(−5/2,−5/2)}`: `1/4` | holds | — |
| 3.3 Recurrences, symmetry and the derivative | same 320 cases | recurrence, derivative, reflection, `Pₙ(1) = (α+1)ₙ/n!`: 0 mismatches; coefficients equal DLMF 18.9.2 × `2(n+2)(n+α+β+2)(s+2)` | holds | — |
| 3.4 Rodrigues | `n = 0, 1, 2` | `n = 1`, `(0,0)`: `x` both sides; DLMF Table 18.5.1 `F = 1−x²`, `κₙ = (−2)ⁿn!` | holds | — |
| 4.1 The measure | `(0,0)`, `(0,1)`, `(−1/2,−1/2)`, `(0.3,−0.6)` | mass `2^{α+β+1}B(α+1,β+1)`: 2, 2, π, 3.559121455 (integral 3.559121455) | holds | — |
| 4.3 orthogonality and `jacobiNormSq` (headline) | integer `α,β ≤ 2`, `m,n ≤ 4` exact; 5 real pairs incl. `(−1/4,−3/4)`, `(−0.9,−0.9)` | 225 exact cases; float error ≤ 4.7e-13; `h₀,h₁,h₂` at `(−1/2,−1/2)`: π, π/8, 9π/128; `B(3/4,1/4)` = 4.442882938 = `π√2` | holds | — |
| 4.4 The two Hilbert bases (headline) | `(0,0)`, `(−1/2,−1/2)` | first vectors `1/√2`, `(1−x²)^{−1/4}/√π`; squared norms `2/2`, `π/π`; `0 < w` a.e. on `Ioo` as `hilbertBasisOfOrthogonalSystem` asks | holds | — |
| 5 tensor bases (headline) | `ι = Fin 2`, `α = 0`, `k = (1,0)`; `ι` empty | vector `1 − x₁`, norm 1; empty product 1 on the one-point space; no unweighted product target exists | holds as stated | R01 |
| 6.1 Legendre | `m,n ≤ 3` exact; `n ≤ 8` | `∫₋₁¹Pₙ²` = 2, 2/3, 2/5, 2/7; `∫₀¹P̃ₘP̃ₙ` = diag(1, 1/3, 1/5, 1/7); `P̃ₙ = Pₙ(1−2X)` for `n ≤ 8`, `Pₙ(2X−1)` fails at `n = 1,3,5,7`; DLMF 14.17.6, 18.7.10 | holds | — |
| 6.2 Gegenbauer (headline) | 9 values of `λ`, `n ≤ 6` exact; `λ ∈ {−0.3, 0.3, 1/2, 1, 2.5}` | leading coefficient and Jacobi relation: 126 exact cases; orthogonality error ≤ 7.5e-12; `h₀` at `λ = −0.3`: 6.268653124 vs mass 6.268653124; `C₂^{(−1)} = 1` | holds | — |
| 6.3 The Chebyshev consistency check (headline) | `n ≤ 8` exact | `Pₙ^{(−1/2,−1/2)} = ((1/2)ₙ/n!)Tₙ`; `hₙ₊₁` = 0.3926991, 0.2208932, 0.1533981 both sides; `measureT` is `(volume.withDensity …).restrict (Ioc (-1) 1)` | holds | — |
| Library claim on `jacobi` (R05) | Mathlib pin | declarations by family: `jacobiTheta` 57, `jacobiSym` 28, `jacobian` 23, `jacobiSum` 16, `jacobiMatrix` 4 | list incomplete | R05 |

- Source locators: 21 read against the DLMF text (Table 18.3.1 rows Jacobi, ultraspherical, Legendre, shifted Legendre, Laguerre, and its `𝒜₀`; 18.5.5; Table 18.5.1; 18.5.8; 18.5.10; 18.5.12; 18.6.1; Table 18.6.1; 18.7.1; 18.7.3; 18.7.10; 18.9.1; Table 18.9.1; 18.9.2; 18.9.13; 18.9.15; 18.9.23; 14.17.6; 5.12.1). All 15 sampled targets agree.
- Library declarations: 57 `#check @` at the pins (Mathlib `1b1ccf4`, Tau Ceti `2fd255d`; both moved since the previous review), all resolve; statements compared for the 17 Tau Ceti names and for `Real.Gamma_eq_integral`, both `rpow`–`exp` lemmas, both integration-by-parts lemmas, `restrict_withDensity`, `lintegral_betaPDF`, `measureT`, `shiftedLegendre`.
- Cross-roadmap citations: OrthogonalL2Bases (Completed; B1 line 250, B2 line 275, scope lines 113–118) resolves; the four named consumers cite this roadmap at their heads.
- Gate at `3e89142`: every rule 0, targeted build passes. Dependency check: `depcheck: 265 roadmaps, 2586 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `lake env lean` of `Suggested.lean` gives 42 `sorry` warnings and nothing else. The file has no `variable` or `include`; the 48 elaborated signatures match their README statements. One-tactic probe (`rfl`, `simp`, `norm_num`, `infer_instance`, `positivity`, `fun_prop`, `simp` with each definition unfolded) closes none of the 42 theorems.
- Overlap check: read OrthogonalL2Bases, SpecialFunctionsHypergeometric, SpecialFunctionsParabolicCylinder, SpecialFunctionsOrthogonalPolynomialsGeneral, SpecialFunctionsLegendre, SpecialFunctionsGamma, SpecialFunctionsBessel, SpecialFunctionsConfluent; Hilbert-basis bridge and product basis: OrthogonalL2Bases (in Tau Ceti), consumed; Laguerre, Jacobi, Gegenbauer families: LaguerreJacobi (SpecialFunctionsBessel's `gegenbauerC` is a declared local copy; SpecialFunctionsOrthogonalPolynomialsGeneral excludes the named families); order-0 Legendre orthogonality: LaguerreJacobi §6.1 (SpecialFunctionsLegendre §2.4 states 14.17.6 for Ferrers functions of every order, on another carrier); real Beta integral: Mathlib and Tau Ceti.
- Ownership against open pull requests: searched all open heads and main for definitions named `laguerre`, `jacobi`, `gegenbauer`, `laguerreMeasure`, `jacobiMeasure`, `jacobiNormSq`; only this pull request declares them.
- Source independence: 27 passages compared with 1 source (21 locators and 6 further passages: the definitions of §1.1, §3.2 and §6.2, the `n = 0` paragraph of §4.3, and two docstrings), none shared beyond the formulas; largest share DLMF, 27 of 28 locators; contents compared with DLMF Chapter 18 (§§18.1–18.42): independent (the layers are by family; DLMF's sections are by kind of formula). Szegő's text was not read.

## Not verifiable

- Szegő, *Orthogonal Polynomials*, §4.3 (README lines 849–851, the `α + β + 1 = 0` remark): not openly available. DLMF attributes 18.5.8 to Szegő (4.3.2), and the `n = 0` constant was checked against DLMF Table 18.3.1's `𝒜₀`.
- Abramowitz–Stegun Ch. 22, Askey, Temme Ch. 6, Thangavelu: listed as background, with no claim located in them; not read.

## Source issues

- none

## For the human reviewers

- **Licence.** DLMF (`dlmf.nist.gov`) is the source of 27 of 28 locators; the sources service has no licence class for the host, and it was read as the publisher's own open site. NIST states a copyright on DLMF.
