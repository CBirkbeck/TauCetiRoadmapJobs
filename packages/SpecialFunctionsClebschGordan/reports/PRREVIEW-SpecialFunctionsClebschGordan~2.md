# Review of SpecialFunctionsClebschGordan (pull request #2930 at 6a9b08d)

**Verdict:** accepted

**Summary.** Accepted: no finding. The one finding of the previous review (the Regge symmetries of the 3-j symbol stated as an invariance) is repaired, and so are its four small corrections and three format notes. All 51 statements of `Suggested.lean` and every formula the README now displays in prose (the Regge symmetries, the `₃F₂` and `₄F₃` forms, the recursions, the values at `j₃ = 1`, the dual Hahn orthogonality) were recomputed on small parameters, junk values included, and none failed. There are one small correction and three format notes, none blocking; the human reviewers are left the stated reuse of the author's own formalization and the fact that the four books could not be read.

## C01 — The closed form given for the dual-orthogonality norm `h_n` is `0/0` at `n = 0`, `α + β = -1`

In the dual orthogonality of §4.2 (README lines 527–528) the norm is `h_n = Σ_x w_x Q_n(x)²`, "which is the right side of `sum_hahn_mul_hahn` divided by `2n + α + β + 1`". The target is stated for `α, β > -1`, and that range contains `α + β = -1`, where at `n = 0` both the right side and the divisor vanish. At `α = β = -1/2`, `N = 2`: `h_0 = Σ_x w_x = 1`, the right side of `sum_hahn_mul_hahn` is `0` and `2n + α + β + 1 = 0`. An implementer who takes the quotient as the definition of `h_n` gets Lean's `0` there and a false dual orthogonality (the term `n = 0` drops out). The identity with `h_n` defined as the sum is true: it held exactly at all 546 instances I tried with `N ≤ 5`.

Smallest change: add "for `2n + α + β + 1 ≠ 0`" to the clause, or give the form without the removable factor at `n = 0`, `h_0 = (α + β + 2)_N / N!`. The Hahn row of DLMF Table 18.19.1 prints the same quotient.

## N01 — "DLMF's range `α, β > -1`" names one of the two ranges of Table 18.19.1

The Hahn row of the table reads `α, β > -1` or `α, β < -N` (in §4.2, README line 520, and the docstring of `sum_hahn_mul_hahn`). "DLMF's first range `α, β > -1`" would be exact; the Check at `(α, β) = (-5/2, 7/3)`, `N = 2` is outside both, as it says.

## N02 — DLMF 34.2.1 is the triangle inequalities only

In the Conventions (README line 65) and §1.1, "DLMF 34.2.1 states the same condition" is attached to a condition that includes `j₁ + j₂ + j₃ ∈ ℤ`. Equations 34.2.1–34.2.3 are the triangle inequalities, the range of `m_r` and `m₁ + m₂ + m₃ = 0`; none of them states the integrality. Cite §34.2 for it, or say "the triangle inequalities are DLMF 34.2.1".

## N03 — The module docstring lists the headlines "not stated here" without saying which are statable

Of the prose headlines listed in the docstring of `Suggested.lean`, only the spherical-harmonic ones are said to lack a carrier (the spherical harmonics of SpecialFunctionsSU2MatrixElements, §6.1). A clause saying that the others (the Regge symmetries, the hypergeometric forms, the recursions in `j`, the dual orthogonality) are statable with the definitions of the file and are left in prose by choice would tell a reader that nothing is missing at the pins.

## Verified sound

"Model" is a transcription of the Lean definitions (truncated subtraction, floor division, `x/0 = 0`); the unitary model is the pinned `symPowerModel` transported by `monomialScale`. Hahn and Racah identities are in exact rational arithmetic.

Previous findings at this head:

- R01 (Regge symmetries as an invariance): repaired. §2.1 now reads "invariant up to sign … multiplies the symbol by `(-1)^J` exactly when the two permutations have opposite parity"; the rule held on 21816 group elements times symbols, 4752 with a nontrivial sign.
- C01 (four statements true by unfolding): repaired; each docstring and README item now says "sanity check of the definition". On a copy, exactly these four close in one tactic.
- C02 (Hahn orthogonality only for `α, β > -1`): repaired; hypotheses are now `(α+1)_n ≠ 0`, `(α+1)_m ≠ 0`.
- C03 (build guide omitted two edges): repaired; "the alternative route to the recursion in `j` of §2.4 also uses §5.2" and "§4.1 also uses §§2.1 and 2.4".
- C04 (six prose targets by locator alone): repaired; all six now carry displayed formulas, each recomputed below.
- N01, N02, N03: repaired (count qualified by "with a nonzero 6-j symbol"; commit `2a512fe` named; the three unneeded hypotheses dropped).

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §1.1 `IsTriad`, `sum_isTriad_succ` | all `d₁, d₂ ≤ 8` | `(2,3)`: `2+4+6 = 12 = 3·4`; dropping parity at `(1,1)`: `6 ≠ 4` | holds, 81/81 | N02 (locator) |
| §1.2 `clebschGordan`, `triangleCoefficient`, Checks | 8 Check values | `1`, `±1/√2`, `1/√2`, `0`, `Δ(111)² = 1/24`, control `0` | as stated | none |
| §1.2 selection rules, `isTriad_comm` | probe on a copy | close by `simp [clebschGordan, h]`, `grind [IsTriad]` | true by definition, labelled so | none |
| §1.3 `tprod_coupledVector` | `d₁, d₂ ≤ 4`, 3 random `g`, 9075 components | max deviation `5.7e-16`; model unitary to `6.7e-16` | holds | none |
| §1.3 `inner_coupledVector`, `span_coupledVector`, `clebschGordan_pos` | `d₁, d₂ ≤ 4`; 140 triads | Gram matrix identity on 3025 entries; count `(d₁+1)(d₂+1)`; all phases `> 0` | holds | none |
| §1.4 `sum_clebschGordan_mul_clebschGordan` (new hypotheses) | `d₁, d₂ ≤ 4`, `d'`, `i'` out of range too | 17500 sums equal `δ`; without `h` or `hi` it fails (`0 ≠ 1`) | holds | none |
| §1.4 product-index orthogonality | `d₁, d₂ ≤ 4` | 3025 sums equal `δ` | holds | none |
| §1.5 swap, reflect, rotate | `d₁, d₂ ≤ 4`, indices to `d+2` | 32350 instances; rotate Check `-1/√3 = -√(1/3)·1` | holds | none |
| §1.6 special values | `d ≤ 8`; stretched `d₁, d₂ ≤ 5` | spinHalf `(2,0)`: `√(1/3)`; spin_zero `(1,0)`: `-1/√2`; 441 stretched | holds | none |
| §1.7 lowering, raising | 32350 instances each, junk indices included | Check: `√2·1 = 1/√2 + 1/√2` | holds | none |
| §2.1 `clebschGordan_eq_threeJ`, `threeJ_eq_racahSum` | all `i ≤ d`; 681 support points | Check `-√3·(-1/√3) = 1`; DLMF 34.1.1, 34.2.4 read: same sign and summand | holds | none |
| §2.1 cycle, swap, reflect (no evenness) | all `d ≤ 4`, 8000; plus 32350 | odd sum: both sides `0`; `threeJ 2 2 2 2 0 1 = 0.40825`, swapped `-0.40825` | holds | none |
| §2.1 Regge symmetries (prose) | 1384 symbols, `d ≤ 6` | 34.3.11, 34.3.12 without sign; `(1 3/2 ½; 0 -½ ½) = 0.40825 = 1/√6` | holds | none |
| §2.2 both orthogonalities | `d₁, d₂ ≤ 3`, inadmissible `d₃` included | 9644 + 3025 sums; control `1/3` | holds | none |
| §2.3 special values | `l ≤ 5`, 216 | `(1 1 2;000) = 0.36515 = √(2/15)`; `(2 2 2;000) = -0.23905 = -√(2/35)` | holds | none |
| §2.4 `₃F₂` form, recursions, `j₃ = 1` (prose) | 1384 symbols; `j ≤ 4` | 34.2.6, 34.3.13, 34.3.14 agree; `(½ ½ 1; -½ -½ 1) = -0.57735`; `b_r ≤ -k` always | holds | none |
| §3.1 product formula, characters | `d₁, d₂ ≤ 4`, 3 random `g`, 9075 entries | max deviation `4.2e-16`; characters `1.1e-15`; `g = -1`: `4 = 1+3` | holds | none |
| §3.2 `integral_matrixElement_mul_mul` | 27000 index sets, exact Haar integrals of monomials | `∫(D¹₀₀)² = 1/3 = (-1/√3)²`; conjugated control `∫|g₀₀|⁴ = 1/3` against `0` | holds | none |
| §3.3 `jacobi_mul_jacobi`, `integral_jacobi_mul_mul` | `l ≤ 4`, exact polynomials | `P₂ = (3X²-1)/2`; `P₁P₂ = 0.4P₁ + 0.6P₃`; `∫P₁P₁P₂ = 4/15` | holds, 25 + 125 | none |
| §4.1 `hahn`, `clebschGordan_eq_hahn` | `N ≤ 5`, `a, b ≤ 3`, 1456 | Check `-0.70711` both sides; `Q₁(3; ⅓, 2/7, 5) = -5/28` both ways | holds | none |
| §4.2 `sum_hahn_mul_hahn` (new hypotheses) | `N ≤ 5`, 20 pairs incl. negative integers, `α+β = -1`; 1660 | `N=1`: `6 = 6`; `(-5/2, 7/3)`: `0`, weights `65/9, -5, 3/8`; hypothesis violated: fails 209/222 | holds exactly | N01 (wording) |
| §4.2 dual orthogonality (prose) | `N ≤ 5`, 6 pairs in `α, β > -1`, 546 | `N=1`: `½ + ½ = 1 = 1/w₀`; at `α=β=-½`: `h₀ = 1`, quotient `0/0` | identity holds; gloss undefined at one point | C01 |
| §4.2 `hahn_reflect` | 2464, real and out-of-range `x` | equal exactly | holds | none |
| §5.1 `sixJ`, `recouplingCoefficient`, Checks | Check values | `-½`, `1/6`, `½`, `0`, recoupling `-½` | as stated | none |
| §5.2 `recouplingCoefficient_eq_sixJ` | `d₁, d₂, d₃ ≤ 3`, every `I`, 1688 | matrix `[[-½, √3/2], [√3/2, ½]]` at both `M` | holds | none |
| §5.2 `sixJ_eq_sum_threeJ`, `threeJ_mul_sixJ` | arguments `≤ 3` (4096), `≤ 2` (19683) | `{000; ½½½} = -0.70711`, unsigned sum `0`; DLMF 34.4.1, 34.5.23 read | holds unconditionally | none |
| §5.3 three symmetries; Regge (prose) | 4096; 15625 incl. inadmissible | `sixJ 2 0 2 2 2 2 = sixJ 2 1 1 2 1 3 = -1/3`; 34.5.9, 34.5.10 agree | holds | none |
| §5.4 orthogonality, Racah sum, Biedenharn–Elliott, `sixJ_zero` | 1850 / 15625 / 30118 (356 nonzero) / all triads `≤ 7` | control `-0.35355` against `-0.70711` | holds, floor-sign cases included | none |
| §6.1 `sixJ_eq_racahPolynomial` | all `e ≤ 6`: 7296, 5214 nonzero | `R₁(λ(1)) = 1/5`, symbol `1/6`; printed constant fails 4650 of 5214 | holds | none |
| §6.1 `₄F₃` form (prose) | 1479 admissible symbols, `d ≤ 5` | agrees with `sixJ`; DLMF 34.4.3 read: same parameters; `b_r ≤ -k` always | holds | none |
| §6.2 `sum_racahPolynomial_mul` | `N ≤ 3`, random rational `(β, γ, δ)` filtered by the hypothesis, 35024 | Checks `1 = 1`, `0`, control `0.211`; DLMF 18.25.9–12 read | holds exactly | none |
| §6.3 `tendsto_racahPolynomial_hahn` | 6 cases incl. `n > N`, zero denominators | difference `3.8e-9` at `δ = 10⁹`; junk cases equal for all `δ`; `γ → ∞` gives `1.997 ≠ 0.103` | holds with no hypothesis | none |
| `eq_coupledVector_of_tprod` | by reading | multiplicity one gives `v = c·w`; norm gives `|c| = 1`; positive component with `clebschGordan_pos` gives `c = 1` | hypotheses determine the basis | none |

- Source locators checked against the text: 43 DLMF equations and table rows (34.1.1; 34.2.1–34.2.6; 34.3.1–3, 5, 8–14, 16–17, 19–22; 34.4.1–3; 34.5.1, 8–10, 14–16, 23; 18.20.5; Table 18.19.1; 18.25.9–12; 18.26.3, 10). All agree with the README and the Lean signs and index placements, except the wording points N01 and N02.
- Library declarations opened at the pin: 14 (`TauCeti/RepresentationTheory/SU2/SymmetricPower.lean:97`, `SU2/Weight.lean:84` and `:105`, `SU2/Exhaustion.lean:97`, `Continuous/Transport.lean:63`, `Continuous/TensorProduct.lean:57`, `:82`, `:92`, `Compact/SchurOrthogonality.lean:151`, `Compact/Haar.lean:93`, `TauCeti/Algebra/BigOperators/Finset/Range.lean:197`; `TauCeti/Algebra/Lie/Sl2/ClebschGordan.lean:275`; Mathlib `Analysis/InnerProductSpace/TensorProduct.lean:71`, `:810`).
- Cross-roadmap citations resolved: 20 (SpecialFunctionsSU2MatrixElements §§1.3, 1.4, 2.1–2.3, 2.5, 2.6, 3.3, 4.1, 5.1, 5.2, 6.1 at its open head; LaguerreJacobi §§3.2, 4.3, 6.1; SpecialFunctionsGeneralizedHypergeometric §§1.1, 4.3, 4.5; LieHighestWeight §0.1; QuantumGroups §8.5). The five local copies and `monomialNorm_pos` are identical to their owners' declarations.
- Duplication: neither pinned library has the 3-j or 6-j symbol, the Hahn or the Racah polynomial; Tau Ceti has the `sl₂` Clebsch–Gordan rule and the `q`-deformed recoupling, which the README cites and does not restate. No other roadmap, open or on main, states these objects.
- Dependency check: `depcheck: 171 roadmaps, 1988 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration of `Suggested.lean` with `lake env lean`: 51 `sorry` warnings and the 18 `#check` lines, no error. The file has no `variable` line, so no binder can be lost; the elaborated types of the four changed theorems match their README statements.
- Automatic checks: all passed. Pull-request text: 57 named headlines, 12 definitions, 51 theorems, 51 `sorry`, four Tau Ceti imports and the supplier list agree with the head.
- Overlap check: read SpecialFunctionsSU2MatrixElements, SpecialFunctionsHigherSpheres, SpecialFunctionsGroupModels, SpecialFunctionsMotionGroupsBessel, SpecialFunctionsSU11MatrixElements, SpecialFunctionsGeneralizedHypergeometric, SpecialFunctionsOrthogonalPolynomialsGeneral, SpecialFunctionsHypergeometric; nothing shared (Krawtchouk stays with SpecialFunctionsSU2MatrixElements §5.2; the `q`-theory with QuantumGroups §8.5).

Source independence: 48 passages compared with 1 source (the DLMF), none shared beyond formulas; largest share Edmonds 1957, about 85 of about 227 locators; its text and contents could not be read; by the README's own equation numbers Layer 1 draws on its (3.1)–(3.6) out of order, Layer 3 on two sections of its Chapter 4, and Layers 4 and 6 are not in it; the order of the layers is forced by §2.1 needing §1.2, §3.2 needing Layer 2, Layer 5 needing Layers 1–2 and Layer 6 needing §4.1 and Layer 5.

Research link: Layers 4 and 6 realize the Hahn and Racah polynomials as Clebsch–Gordan and 6-j coefficients of SU(2), as in Vilenkin–Klimyk 1991, Ch. 8, and Klimyk–Vilenkin 1995; Layers 1–3 and 5 are the Wigner–Racah calculus of Edmonds 1957 and DLMF Ch. 34. Rests on the README's references and consumers.

## Not verifiable

- Every locator into Edmonds 1957, Vilenkin–Klimyk 1991, Klimyk–Vilenkin 1995 and Wawrzyńczyk 1984: the sources service found only the publishers' paywalled pages. This covers all locators of the sampled §§1.5, 1.7 and 3.1 and the book locators of the other sampled sections; the statements themselves were computed.
- The running text of DLMF §34.2 and §34.4 outside their numbered equations: the service returned the sections' figure, so only the equations were read.
- The misprint the README reports in Vilenkin–Klimyk §8.5.4 (2): the corrected constant is right and the variant described as printed fails on 4650 of 5214 instances, but what the book prints was not read.
- What the two external repositories prove at the named commit: not opened.

## Source issues

- **Gap** in DLMF at Table 18.19.1, Hahn row: the source gives the norm as a quotient with denominator factor `2n + α + β + 1`, which is `0/0` at `n = 0`, `α + β = -1` inside the stated range; it should be read with the factor cancelled, `h_0 = (α + β + 2)_N / N!`; affects nothing.

## For the human reviewers

- **Licence.** The README's "Prior formalization" section says `Suggested.lean` uses the names of lean-SFVK (`SFVK/ClebschGordan/`, Apache-2.0, by the pull request's author) at commit `2a512fe`. I did not open that repository.
- **Not tested.** Edmonds 1957 has the largest share of the locators (about 85 of about 227); its text and table of contents could not be read, nor those of the other three books. Wording and arrangement were compared with the DLMF only.
- **Scope.** The cited sources are four monographs (1957–1995) and the DLMF; the README cites no research article. The subject is the Wigner–Racah calculus and the Hahn and Racah families of the Askey scheme.
