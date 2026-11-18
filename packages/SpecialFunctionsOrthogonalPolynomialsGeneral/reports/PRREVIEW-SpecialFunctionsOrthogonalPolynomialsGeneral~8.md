# Review of SpecialFunctionsOrthogonalPolynomialsGeneral (pull request #2192 at 0925e01)

**Verdict:** accepted

**Summary.** Accepted: this is an incremental re-review of the 94 lines changed since 94e88bc, and no finding remains. The diagonal symmetrization of §1.3 is now correct for negative `a_{k−1}`, `c_k` (recomputed on two sign patterns), the four Lean names of §§3.3, 5.6, 8.1 and 10.2 now follow exactly the conclusion the Lean states, and §5.7 has a route for the unbounded interval. There are two small corrections, both about the pull request's description, and one format note; none blocks. For the human reviewers: the licence of the author's prior formalization and the six unread books, as before.

## C01 — The description still treats LaguerreJacobi as an open pull request that must merge first

A reader of the description is told to wait for a supplier that is already merged. The paragraph under **Overlaps** says "#117 (LaguerreJacobi) defines the Laguerre, Jacobi and Gegenbauer polynomials" and ends "The classical-polynomials roadmap will open after #117 merges"; the folder `TauCetiRoadmap/LaguerreJacobi` is on main (its commit there carries #117), and the README at this head cites it only as a downstream consumer (line 1335), not as a supplier.

Text that would be right: "**LaguerreJacobi** (on main) defines the Laguerre, Jacobi and Gegenbauer polynomials. … The classical-polynomials roadmap builds on it and on this one." The generated dependency block that lists #117 as an open supplier is then stale as well.

## C02 — The description's source list omits Szegő (1975), which the head now cites

The **Sources** paragraph says "each headline cites its sources with the printed page" and lists eight works; the head adds a ninth, Szegő, *Orthogonal Polynomials* (1975), Theorem 7.2, to §5.7 and to the References (README lines 845 and 1428), cited through DLMF §18.2(xii) and without a page. Add a line "Szegő, *Orthogonal Polynomials* (1975), Theorem 7.2, as cited by DLMF §18.2(xii), for the monotonic-weight bound of 5.7".

## N01 — Szegő's Theorem 7.2 is cited without its printed page

In §5.7 (line 845) and in the References (line 1428) the theorem is cited "as DLMF §18.2(xii) cites it"; every other book locator of the README has a page. Add the page when the book is at hand.

## Previous findings

- R01 — repaired: "`D⁻¹ J_n D` is the symmetric matrix … for the invertible diagonal `D = diag(d_k)` with `d_k/d_{k−1} = sgn(a_{k−1}) √(c_k/a_{k−1})` … `D` can be taken positive exactly when every `a_{k−1} > 0`", with the `n = 2` Check added.
- R02 — repaired: line 772 of `Suggested.lean` is the line comment "-- Suppliers cited in README.md"; every `/-! ## -/` header has declarations under it.
- R03 — repaired: `subNextCoeff`, `gaussMeasure` and `imCentralDiffFun` occur in neither file; the README keeps "`k̃̃_n` is the coefficient two below the leading one", "the `n`-point Gauss measure `Σ_i w_i δ_{x_i}`" and the formula for `δ_x`.
- R04 — repaired: each of `X_mul_orthonormal`, `discr_pos`, `hasSum_orthonormal_expansion`, `imCentralDiff_natDegree_leadingCoeff` now directly follows the conclusion its Lean statement has; `q₀`, `q₁`, the product formula, Parseval and `δ_xⁿ p` are prose after it.
- R05 — partly repaired: "DLMF §18.2(xii), which assumes only `b < ∞`, refers to Szegő (1975), Theorem 7.2, for the proof", Szegő is in the References, and a route covers `(−∞, b]`; the printed page is missing (N01).

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.3 symmetrization by `D` | n=2, `a₀=c₁=−1`; n=3, `a=(2,−3)`, `c=(·,8,−12)` | `d₁/d₀=−1`: entries `(−1)(−1)=1` both sides; ratios `2, −2`: `2·2 = 8/2 = 4`, `(−3)(−2) = (−12)/(−2) = 6` | holds; ratio is forced, so "positive exactly when every `a>0`" holds | none |
| 3.3 `X_mul_orthonormal`, `q₀`, `q₁` | Lebesgue on `[−1,1]`, n=0 | `q₀=1/√2`, `q₁=√(3/2)x` (`h₀β₁=2/3`); `√β₂q₂+√β₁q₀ = √(3/2)(x²−⅓)+1/√6 = √(3/2)x² = x q₁` | holds; Lean states the recurrence only, as the README now says | none |
| 5.6 `discr_pos` | n=0, 1; `He₂` | `discr = 1, 1, 4`, all `> 0`; `k₂²·(x₀−x₁)² = 1·4` | holds, no junk at `2n−2` | none |
| 5.7 route for `(−∞, b]` | `w=eˣ` on `(−∞,0]`, n=1; truncation `R=5` | `p₁=x+1`: `e^{−1.5}·2 = 0.446 ≤ 1` at `x=−3`; `α₀^R = −0.9661 → −1` | bound holds; truncated coefficients converge as the route says | none |
| 8.1 `hasSum_orthonormal_expansion` | Lebesgue, `f=\|x\|`, n=0, 2 | `(∫q₀f)q₀ = ½ = λ₀P₀`; `(∫q₂f)q₂ = (15/16)(x²−⅓) = (5/8)P₂` | orthonormal form equals the `λ_n p_n` form | none |
| 10.2 `imCentralDiff_natDegree_leadingCoeff` | `X`, `X²`, `X³` | `1`, `2X`, `3X² − ¼`: degrees 0, 1, 2; leading coefficients 1, 2, 3; real coefficients | holds | none |
| 9.3 route `F_n = μ₀⁻¹ Σ w_i (z−x_i)⁻¹` | Lebesgue, z=2, n=1, 2 | `½·2/2 = ½`; `½(1/(2−1/√3)+1/(2+1/√3)) = 6/11`, the values of `F₁`, `F₂` | agrees with 9.2 | none |

The rows for the statements the change does not touch stand as in the previous review, of 94e88bc.

- Source locators checked against the text: DLMF §18.2(xii) (DLMF §18.2 lines 3093–3100): `b < ∞` is the only assumption on the interval, Szegő (1975, Theorem 7.2) is the reference, and (18.14.8) with `α = 0` is named as the Laguerre special case; all three agree with the new sentence of §5.7.
- Seeded sample: of the 15 targets, the change touches 1.3 and 2.3 (the constants line); both recomputed above or read at the head.
- Lean: no theorem statement changed; three unused definitions removed; 71 theorems, 28 definitions, 69 `#check`s; the file has no `variable` line, so no declaration can lose a binder.
- Elaboration of `TauCetiRoadmap/SpecialFunctionsOrthogonalPolynomialsGeneral/Suggested.lean`: 71 `sorry` warnings, no other warning, no error.
- Automatic checks: all pass at this head, the empty-section rule included.
- Dependency check: `depcheck: 218 roadmaps, 2357 edges, 0 problem(s)`; no UPWARD or CYCLE line. The change adds or drops no supplier (5.7 gains the internal need 2.4).
- Cross-roadmap citations: unchanged; ClassicalArithmeticCompletion, RandomMatrices and LaguerreJacobi are on main. No change outside the folder.
- Pull-request text: the counts (71 theorems, 28 definitions, seven Tau Ceti modules) and the ten layers agree with the head; differences are C01 and C02.

Overlap check: searched the open roadmaps and main at their heads for Favard's theorem, Christoffel–Darboux, Gauss quadrature, Christoffel numbers and the Markov–Stieltjes inequalities, and read the hits in LaguerreJacobi, OrthogonalL2Bases, RandomMatrices and SpecialFunctionsLegendre; nothing shared: LaguerreJacobi and OrthogonalL2Bases exclude Favard and the abstract recurrence theory, RandomMatrices §8.2 owns the weight-case orthonormal polynomials (cited and compared in 3.3), SpecialFunctionsLegendre 2.5 is the family-specific sum for Legendre functions. The scopes of the other closest roadmaps were read in the previous review and the change adds no object.

Source independence: changed passages only: 2 passages (the statement and the route of §5.7) compared with 1 source (DLMF §18.2(xii)), none shared; largest share DLMF, 53 of 174 locators at 94e88bc, one DLMF locator and one Szegő locator added since; the change adds, removes or reorders no layer, so the contents were not compared again (independent of DLMF §18.2(i)–(xii) in the previous review). Szegő (1975) and the six books listed under Not verifiable could not be read.

Research link: Favard's and Hamburger's theorems and uniqueness of the moment problem as in Simon (1998) and Chihara (1978); semi-classical structure relations as in Magnus (1995); the general theory behind DLMF §18.2 that the classical and Askey-scheme families and RandomMatrices §8.2 use. Rests on the README's sources and its downstream-consumers section.

## Not verifiable

- Szegő (1975), Theorem 7.2, cited for the bounded case of §5.7: no legally readable text; read only through DLMF §18.2(xii), which states the result and refers to it.
- Ismail (2005), p. 24, cited for the symmetrization of §1.3 "for the monic case": publisher page only; the statement was verified by computation instead.
- Chihara (1978), Gautschi (2004), Andrews–Askey–Roy (1999), Schmüdgen (2017), Koekoek–Lesky–Swarttouw (2010): as in the previous review, no legally readable text; their locators in the changed passages are unchanged.

## Source issues

- none

## For the human reviewers

- **Licence.** The README's prior-work section names `lean-DLMF` (github.com/bjbraams/lean-DLMF, stated as Apache-2.0, directory `DLMF/OrthogonalPolynomials/`) as prior formalization by the pull request's author; the declarations of `Suggested.lean` were not compared with that repository.
- **Not tested.** Wording and arrangement were compared with DLMF, Simon and Magnus only; Szegő, the five other cited books and Koekoek–Lesky–Swarttouw had no legally readable text, so parts 1 and 2 of the copyright check were not run against them.
