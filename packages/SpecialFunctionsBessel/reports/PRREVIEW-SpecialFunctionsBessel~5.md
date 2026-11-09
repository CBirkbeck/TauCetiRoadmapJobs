# Review of SpecialFunctionsBessel (pull request #1987 at a310139)

**Verdict:** needs changes

Incremental re-review of the 150 lines changed since `1e4c517`. One finding (P2). The six findings of the previous review are repaired as requested; the remaining defect is in the new 8.3 text, in the clause for 10.22.74, which follows DLMF's print (and the wording the previous review suggested) and is false on the boundary `A = 0`. The gate passes, the file elaborates with `sorry` as the only diagnostic, and the dependency check reports no problem.

## R01 (P2) — 8.3 states 10.22.74 with the case `A ≤ 0`; at `A = 0` the value is not `0` for `−½ < Re ν ≤ ½`

**Location.** `TauCetiRoadmap/SpecialFunctionsBessel/README.md` line 1296: "10.22.74 for `Re ν > −½`, with its two cases `A > 0` and `A ≤ 0`;" (with line 1294, "each case a separate statement").

**Claim.** For positive `a`, `b`, `c` with `A ≤ 0` and every `Re ν > −½`, `∫₀^∞ J_ν(at) J_ν(bt) J_ν(ct) t^{1−ν} dt = 0`.

**Witness.** `A = 0` is the degenerate triangle, e.g. `(a, b, c) = (3, 2, 1)`. There the product of the three leading cosines has the constant term `¼ cos(νπ/2 + π/4)`, so the integrand has a non-oscillating component `∝ t^{−ν−1/2}`, by the same computation as the README's own Check for 10.22.75. Computed (series and Hankel asymptotics, composite Simpson):
- `ν = 0`: the partial integrals to `R = 50, 100, 200, 400, 800` are `0.5155, 0.7320, 1.0377, 1.4678, 2.0742`, growing like `R^{1/2}`: the integral diverges.
- `ν = ½`: the partial integrals are `0.08086, 0.08129, 0.08157, 0.08150, 0.08147`. Exactly, with `J_{1/2}(x) = (2/(πx))^{1/2} sin x`, the integral is `(2/π)^{3/2} (abc)^{−1/2} · ¼ ∫₀^∞ (sin 2bt + sin 2ct − sin 2at)/t dt = 1/(2 (2π abc)^{1/2}) = 0.0814338`, half the `A > 0` value, not `0`.
- `ν = 1`: the partial integrals are `0.0103, 0.0074, 0.0052, 0.0037, 0.0026`, tending to `0`. For `Re ν > ½` the integrand is absolutely integrable at infinity, the integral is continuous in `a`, and both one-sided limits are `0`.

DLMF 10.22 line 2978 prints the second case as `A ≤ 0` (see Source issues); the roadmap copies it.

**Repair.** Replace line 1296 by: "10.22.74 for `Re ν > −½`, with its cases `A > 0` and `A < 0`; at `A = 0` the value is `0` for `Re ν > ½`, and nothing is stated for `−½ < Re ν ≤ ½`, where DLMF's `A ≤ 0` is not correct." Add two negative-control Checks: at `(a, b, c) = (3, 2, 1)`, `ν = 0`, the integral of 10.22.74 diverges (integrand component of size `t^{−1/2}`); at `ν = ½` it equals `1/(2 (12π)^{1/2}) = 0.08143…`, half the limit from `A > 0`. Tested on the refuting instances: the repaired text states nothing at `ν = 0, ½` and states `0` at `ν = 1`, which the computation above confirms.

## Previous findings

- R01 — repaired: lines 1293–1304 give 10.22.75 its three regions with opposite signs, exclude `a = |b − c|`, `a = b + c`, and add the signed and divergent Checks. The accompanying 10.22.74 clause is R01 of this report.
- R02 — repaired: `### From LaguerreJacobi` (lines 401–410) consumes `Polynomial.gegenbauer` (F2) and F1; `Complex.gegenbauerC` is declared a roadmap-local copy (lines 297–298, 708–711, `Suggested.lean` 141–143); the description names LaguerreJacobi.
- R03 — repaired: lines 908–918 give `|ph z| ≤ π/2 − δ` for 10.40.1 and 10.40.3, `−π/2 + δ ≤ ±ph z ≤ π − δ` for 10.40.5, and the negative-control Check at `z = 10 e^{i(π − 0.01)}`.
- R04 — repaired: lines 1149–1151, "and, for `ν > 0`, 10.21.16".
- R05 — repaired: line 1133, "DLMF 10.21.2–10.21.14, for `ν ≥ 0`".
- R06 — repaired: lines 1520–1523 state 9.8.9–9.8.12 for `x < 0` through `M_{1/3}`, `M_{2/3}`, `θ_{1/3}`, `θ_{2/3}` at `ξ`, with the constants fixed by `θ(0) = −φ(0) = π/6` and 10.18.3.

## Verified sound

**Gate and build.**
- Gate on this head with the candidate merge order (the worker's run): every rule `0`, `OK`. My own run without the candidate order reports only `depcheck: NOT IN ORDER`, the placement of a roadmap the order does not list yet, which is not a finding.
- Dependency check with `--movable`: `depcheck: 236 roadmaps, 2267 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- `lake env lean` of `Suggested.lean`: 49 warnings, all `declaration uses sorry`; no other diagnostic. The folder holds `README.md`, `Suggested.lean`, `metadata.toml`; nothing changes outside it.
- `Suggested.lean` changed in two docstrings only (`gegenbauerC`, `exists_integral_cpow_mul_exp_mul_besselJ`); no statement changed, so the one-tactic probe and the comparison of the 86 elaborated signatures of the previous report stand.

**New supplier citations resolved at the open heads.**
- LaguerreJacobi (new roadmap, head `5aad605`), README lines 470–474 (F1: `Polynomial.jacobi 0 0 n` is Legendre, `Polynomial.shiftedLegendre_eq_jacobi_comp`) and 476–500 (F2: `Polynomial.gegenbauer (lam : R) (n : ℕ) : R[X]` by the explicit sum over `Finset.range (n/2 + 1)`, the values at `n = 0, 1, 2`, and the multiplied-out identity `(λ + ½)ₙ • gegenbauer λ n = (2λ)ₙ • jacobi (λ − ½) (λ − ½) n`). `gegenbauerC` (`Suggested.lean` 144–147) is that sum term for term. It states neither 18.12.4 nor 18.18.17, so the auxiliary row at line 163 has no second owner (grep for `18.12.4` and `Gegenbauer` over main and the open heads: only this roadmap, LaguerreJacobi, and scope sentences of SpecialFunctionsHypergeometric and NoncompactQuantumSymmetry).
- SpecialFunctionsHypergeometric (new roadmap, head `375fe53`): Conventions lines 159–188 (`Complex.regularizedGaussHypergeometric`, principal branch on `1 − z ∈ slitPlane`, `0` off it), §1.2 line 322 (the anchor `#12-definition-uniqueness-and-existence` exists), §1.3 lines 376–378 (equality with `regularizedGaussHGFun` for `‖z‖ < 1`, all parameters), §1.4 lines 404–407 (holomorphy in `(a, b, c, z)`). Its Downstream consumers (lines 1114–1118) name this roadmap's 8.2 for exactly this use, and its supplier contracts do not name this roadmap: no cycle. `{x | x.im ≠ 0 ∨ x.re < 1}` in the Lean statement is `{x | 1 − x ∈ slitPlane}`.
- SpecialFunctionsHypergeometricPartII (line 1593) is named only as the planned home of excluded formulas, as SpecialFunctionsHypergeometric lines 143 and 1118 also say; it is not a supplier.
- The description's merge-order paragraph names both new suppliers.

**The new route for 10.22.49 (lines 1244–1250).** `D = {Re(a ± ib) > 0}` is convex and open, `Re a > 0` on it, and `|b| < |a|` contains `(1, 0)`; `−b²/a² = s ≥ 1` forces `a ± ib ∈ {(1 − √s)a, (1 + √s)a}`, excluded. The identity theorem on a connected open subset of `ℂ²` then gives the claim; each input is a named supplier section (1.3, 1.4) or 2.2.

**Sampled targets that fall in the changed passages.** 7.3: DLMF 10.21 lines 676 and 710 (`ν ≥ 0` for 10.21.15, `ν > 0` for 10.21.16), as cited in the previous report. 11.1: DLMF 9.8 lines 364–470 as cited there; the new formulas are derived and computed below. 8.3: DLMF 10.22 lines 2940–3016. The other sampled targets (1.5, 1.8, 2.3, 2.6, 3.3, 4.1, 4.3, 5.3, 5.5, 7.5, 9.2, 10.1, 11.2) are untouched by the diff.

**Adversarial table: changed statements.** Double precision, plain Python (series for `x ≤ 18`, Hankel asymptotics beyond, composite Simpson).

| Statement | Instance | Left side | Right side | Result |
|---|---|---|---|---|
| 10.22.74, `A = 0` (8.3) | `(3, 2, 1)`, `ν = 0`, `R = 50 … 800` | `0.5155, 0.7320, 1.0377, 1.4678, 2.0742` | README: `0` | diverges (R01) |
| 10.22.74, `A = 0` | `(3, 2, 1)`, `ν = ½` | `0.08147` at `R = 800`; exact `0.0814338` | README: `0` | false (R01) |
| 10.22.74, `A = 0` | `(3, 2, 1)`, `ν = 1` | `0.0103 → 0.0026` | `0` | holds for `Re ν > ½` |
| 10.22.74, `A < 0` | `(4, 2, 1)`, `ν = 0`, `R = 200 … 403` | within `±0.0033` of `0` | `0` | holds |
| 10.22.74, `A > 0` | `(2, 2, 1)`, `ν = 0` | partials `0.156 … 0.172` | `0.16437` | holds |
| 10.22.75 Checks | `ν = 0`, `(½, 2, 1)`; `(4, 2, 1)` | `A = −0.41016`, `−1/(2π(−A)^{1/2}) = −0.2485`; `A = −6.5625`, `+0.0621` | Check `−0.2485…`, `+0.0621…` | hold (integrals: previous report) |
| 10.22.75 divergence Check | `(3, 2, 1)`, `ν = 0.4` | `1.93, 3.61, 6.71, 12.49, 23.33` at `R = 50 … 800` | no value | diverges, as the Check says (`R^{0.9}`) |
| 10.22.75, `ν = 0.3` | `(½, 2, 1)`; `(4, 2, 1)`; `(2, 2, 1)` | partials oscillate about `−0.04`; `+0.015`; `0.00` | `−0.1018`; `+0.0207`; `0` | signs as stated; convergence too slow (`R^{−0.2}`) to confirm the digits |
| 9.8.9, 9.8.10 (11.1) | `x = −1`; `x = −2` | `|x|^{1/2}M² = 0.2976409167`, `0.3135418417`; `|x|^{−1/2}N² = 0.3510121199`, `0.3252485863` | `½ξM²_{1/3}`, `½ξM²_{2/3}`: same to `1e−15` | hold |
| 9.8.11, 9.8.12 (11.1) | `x = −1`; `x = −2` | `θ = 1.3789992151`, `2.6375566024`; `φ = −0.0171505552`, `1.1471644064` | `2π/3 + θ_{1/3}(ξ)`, `π/3 + θ_{2/3}(ξ)`: same | hold; at `0`: `2π/3 − π/2 = π/6`, `π/3 − π/2 = −π/6` |
| 10.40.1 Check (5.2) | `z = 10e^{i(π−0.01)}` | `I₀ = 2801.65 − 266.56i` (previous report) | `|e^z/(2πz)^{1/2}| = e^{−9.9995}/62.83^{1/2} = 5.7e−6` | Check correct |
| `C_n^{(1/2)} = P_n` via F2 (2.5) | `n = 2` | `(1)₂ C₂^{(1/2)} = 2(3x²/2 − ½) = 3x² − 1` | `(1)₂ P₂ = 3x² − 1` | holds; `(1)ₙ = n! ≠ 0` cancels |
| `gegenbauerC` against F2 | `n = 1`, `n = 2` | `2νx`; `2ν(ν+1)x² − ν` | `C (2λ) X`; `C (2λ(λ+1)) X² − C λ` | agree |

**Adversarial table: untouched statements.** The 48 rows of the previous report (`PRREVIEW-SpecialFunctionsBessel~3`, at `1e4c517`) are carried forward unchanged: every Lean statement is untouched, and the README passages they test (`besselY`, `besselK`, the Wronskians, recurrences, connection formulas, generating functions, `hasSum_besselJ_gegenbauer`, the integral representations, `tendsto_convs_besselJ`, the Kummer form, 10.40.2, the Debye expansions, the zeros and McMahon, `hasProd_besselJ`, 10.22.64, `exists_integral_cpow_mul_exp_mul_besselJ`, `integral_cpow_mul_besselK`, the spherical and Kelvin rows, Bickley, `O_n`, `airyAi_eq_besselK` with its control) are outside the diff.

## Not verifiable

- **Watson 1944** (p. 411, which DLMF cites for 10.22.74–10.22.75) and **Olver 1997**: no legal open copy; not read. R01 rests on the computation, not on Watson's text.
- **Ownership against open pull requests** was checked with the roadmaps grep over the 458 open heads for Gegenbauer and 18.12.4, and by reading LaguerreJacobi and SpecialFunctionsHypergeometric at their heads; other open roadmaps were not re-read this round.

## Source issues

- **Error** in DLMF-Bessel at 10.22.74, §10.22(iv), online Release 1.2.8: the source says the triple-product integral is zero whenever `A ≤ 0`, for all `Re ν > −½`; it should say `A < 0`, with `A = 0` giving zero only for `Re ν > ½` (divergent for real `−½ < ν < ½`, half the `A > 0` value at `ν = ½`); affects a stated result.
