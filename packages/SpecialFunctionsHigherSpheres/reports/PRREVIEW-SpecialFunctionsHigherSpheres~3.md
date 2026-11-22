# Review of SpecialFunctionsHigherSpheres (pull request #2931 at 52cd1a7)

**Verdict:** accepted

**Summary.** Accepted: the one finding of the previous review is repaired (the classification of the irreducible subrepresentations in 2.2 now carries `n ≥ 3`, or `n = 2` over `ℝ`, and the restriction rule of 6.2 carries `n ≥ 1`), and I found no new defect in the 63 changed lines; every changed identity was recomputed and agrees. There is one small correction (the new route of 3.1 uses a form of the Jacobi polynomial that its supplier does not state) and one format note, neither blocking. As before, none of the four books could be read legally; that, the reuse of names from the author's own formalization, and the ownership bounds of 4.6 are left to the human reviewers.

## C01 — The new route of 3.1 uses DLMF 18.5.7, which LaguerreJacobi §3.2 does not state

The route (3.1, lines 320–324) takes "the hypergeometric form DLMF 18.5.7 of the Jacobi polynomial" as an input beside the Jacobi relation of LaguerreJacobi §6.2. An implementer who looks for it in the supplier finds nothing: LaguerreJacobi §3.2 defines `jacobi` by the sum DLMF 18.5.8 in `(X − 1)^{n−k} (X + 1)^k` (and so does the local copy in `Suggested.lean`), and neither it, SpecialFunctionsHypergeometric nor SpecialFunctionsOrthogonalPolynomialsGeneral on main states the expansion in powers of `(1 − x)/2`. The identity itself is right: at `α = β = (n − 3)/2` it gives `P_l^{(α,α)} = (((n − 1)/2)_l / l!) ω_{n,l}` exactly for `n = 2, …, 8`, `l ≤ 6` (for example `−861/1600` on both sides at `n = 4`, `l = 3`, `t = 3/10`), and with the relation of §6.2 it yields the Gegenbauer form.

Would you say in the route that passing from the defining sum 18.5.8 to 18.5.7 is a step of it (write `X + 1 = 2 − (1 − X)` and sum by Chu–Vandermonde), as the route of 6.3 already does for the disk polynomials ("by expanding `P_q^{(α,β)}` in powers of `(x − 1)/2`").

## N01 — "Prior formalization" still records what an external repository proves at one commit

The section lists what a named commit "proves … without `sorry`" (line 1146 and following); that will go out of date. A sentence that the names and conventions agree with that repository would be timeless. (Raised in the two previous rounds.)

## Previous findings

- R01 — repaired: "for `n ≥ 3` (and for `n = 2` over `ℝ`), every irreducible subrepresentation of the quasi-regular representation is one of them" (2.2); Hilbert sum "for `n ≥ 2`"; 6.2 restriction "for `n ≥ 1`"; three negative controls added.
- C01 — repaired: "Scope and ownership" now names SpecialFunctionsHypergeometric §9.1, GeometryOfNumbersAndQuadraticArithmetic §4.3 and SpecialFunctionsLegendre §3.4, each with how the statement here differs; the Check of 4.6 names Hecke's identity.
- C02 — repaired: "The roadmap on rank-one symmetric spaces of the same project does not consume this roadmap", with the two normalizations of the sphere measure; the description says the same.
- N01 — not repaired: N01 above.
- N02 — repaired: the Lean comment reads "Layer 5: branching `SO(m + 1) ↓ SO(m)`".
- Question on Pfaff's transformation — settled: the route now goes through the Jacobi relation and says the direct comparison "goes through a quadratic transformation of the Gauss series" (see C01).

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 2.2 irreducible subrepresentations (changed) | `n = 1`; `n = 2` over `ℂ`, over `ℝ`; `n ≥ 3`; the route's Schur step | line of `1 + x₁` invariant, not `H_0`, `H_1`; `ℂ e^{ilθ} ⊊ H_l ⊗ ℂ`; real `H_l` irreducible, traces `2 cos lθ` distinct; projection to `H_{l'}` zero or iso, iso excluded | true with the new bounds; all three controls true | none |
| 2.2 Hilbert sum (changed) | `n = 1`; `n = 2` | `L²(S⁰) = H_0 ⊕ H_1` also holds; R8.2 is stated for `n ≥ 2` | bound is the supplier's | none |
| 3.1 route (changed; sampled) | `n = 2..8`, `l = 0..6`, `t = 3/10`, exact rationals | `P_l^{(α,α)} = ((n−1)/2)_l/l! · ω_{n,l}`; `(λ+½)_l C_l = (2λ)_l P_l`; `C_l = (n−2)_l/l! · ω_{n,l}`: all 49 cases equal; `n = 4`, `l = 3`: `−861/1600`, `C_3^{(1)} = −123/125`, `ω = −123/500` | route sound; 18.5.7 unowned | C01 |
| 3.1 special cases against Hypergeometric §9.1 (changed scope text) | parameters of `ω_{2,l}`, `ω_{4,l}`, `ω_{3,l}` | `(−l, l; ½)`, `(−l, l+2; 3/2)`, `(−l, l+1; 1)` = DLMF 15.9.5, 15.9.6, 15.9.7 as §9.1 states them | agrees | none |
| 4.3 against Legendre §3.4 (changed scope text; sampled) | `n = 3`, general `f` | here `½ ∫ f P_l`; there `2π ∫ f P_l` for `sin θ dθ dφ`; ratio `4π` | agrees | none |
| 4.6 Check against Hecke's identity (changed) | `t = 1`, `l = 1, 2`, `|ξ| = 0.7` | `(−i)^l P(ξ) e^{−π|ξ|²}`: `−i ξ₁ e^{−0.49π}`, `−ξ₁ξ₂ e^{−0.49π}`, as the Check has | agrees | none |
| 6.2 restriction and branching dimension (changed; sampled) | `n = 0`, `(1,1)`; `n = 1`, `(2,3)`; `n = 1..5`, `p, q ≤ 5` | `0` vs `1`; `6 = 6` (`p + q + 1`); equal in all 180 cases | `n ≥ 1` needed and sufficient | none |
| Downstream (changed) | rank-one roadmap at its open head | no mention of this roadmap; surface measure "of total mass `2π^{n/2}/Γ(n/2)`", used through `MeasureTheory.average` | sentence true | none |

The rows for the statements the change does not touch stand as in the previous review, of `c063187`.

- Source locators checked against the text: DLMF 18.5.7 (its text at dlmf.nist.gov/18.5, line 558: `(α+1)_n/n!` times the Gauss series in `(1 − x)/2`), which the new route cites; 0 book locators (no book readable, as before).
- Cross-roadmap citations resolved (the new or changed ones): LaguerreJacobi §3.2 (definition by DLMF 18.5.8) and §6.2 (`Polynomial.ascPochhammer_smeval_smul_gegenbauer`, the multiplied-out relation, valid at `λ = 0`) on main; SpecialFunctionsHypergeometric §9.1 on main; GeometryOfNumbersAndQuadraticArithmetic §4.3 (`fourier_harmonic_gaussian`) on main; SpecialFunctionsLegendre §3.4 and SpecialFunctionsRankOneSymmetricSpaces at their open heads. All present and saying what is claimed of them.
- Elaboration: no error, 60 `sorry` warnings, nothing else. The only change to `Suggested.lean` is one section comment; no statement changed, so the signature comparison and the one-tactic probe of the previous review stand.
- Dependency check: `depcheck: 156 roadmaps, 1805 edges, 0 problem(s)`; no UPWARD or CYCLE line. The pull request changes nothing outside the folder.
- The pull request's text against this head: the description lists the three newly named roadmaps under "Cited, not consumed", says that no sibling consumes this roadmap, and its counts (59 headlines, 60 theorems) agree; nothing to correct.
- Automatic checks: the text scanners, the dependency check and the targeted build passed; one form check is set aside below.

Overlap check: read SpecialFunctionsMotionGroupsBessel, SpecialFunctionsRankOneSymmetricSpaces, SpecialFunctionsGroupModels, SpecialFunctionsSU2MatrixElements, SpecialFunctionsAffineHeisenbergGroups, SpecialFunctionsLegendre, SpecialFunctionsBessel, LaguerreJacobi, SpecialFunctionsOrthogonalPolynomialsGeneral, SpecialFunctionsHypergeometric (scopes as in the previous review; the changed passages reread against LaguerreJacobi, SpecialFunctionsHypergeometric, SpecialFunctionsLegendre, GeometryOfNumbersAndQuadraticArithmetic and the rank-one roadmap); the plane wave in `ℝ³` and the radial Fourier transform: SpecialFunctionsMotionGroupsBessel; Gegenbauer and Jacobi polynomials: LaguerreJacobi; Gel'fand pairs in general, `SOn`: SpecialFunctionsGroupModels; `T_n`, `U_n`, `P_n` as Gauss series: SpecialFunctionsHypergeometric, the polynomial forms here, now stated in Scope; Funk–Hecke on `S²` in the `Y_{l,m}`: SpecialFunctionsLegendre, now stated; Hecke's identity: GeometryOfNumbersAndQuadraticArithmetic, now stated; nothing owned twice.

Source independence: changed passages only; 1 passage compared with 1 source (DLMF 18.5.7, a formula; nothing shared); the four books were not readable, so no wording was compared with them; largest share Vilenkin–Klimyk Vol. 2, 28 of 61 locators; its contents were not read; the change adds, removes and reorders no layer, so the arrangement was not compared again.

Research link: The targets are the harmonic analysis of the compact rank-one pairs `(SO(n), SO(n−1))` and `(U(n), U(n−1))` as in Vilenkin–Klimyk 1993, Klimyk–Vilenkin 1995, Wawrzyńczyk 1984 and Dieudonné 1980; Hecke's identity of GeometryOfNumbersAndQuadraticArithmetic §4.3 is the Gaussian case of 4.6. This rests on the README and that roadmap, not on a source I read.

## Not verifiable

- The book locators of the sampled targets that the change touches (3.1, 4.3, 6.2) and every other locator into Vilenkin–Klimyk Vol. 2, Klimyk–Vilenkin (EMS 59), Wawrzyńczyk and Dieudonné: no legal copy was found in the previous rounds and none is in the sources cache. The mathematics of the changed passages was checked by computation instead.
- The lists of the README's "Prior formalization" and of the description's paragraph of that name: the external repository was not opened.

Automatic checks set aside as false positives: the section comment "Supplier declarations named in the README" at the end of `Suggested.lean` is followed by `#check` lines that pin library declarations, which the form rules allow, and not by nothing.

## Source issues

- none

## For the human reviewers

- Licence and reuse: the README ("Prior formalization") says the roadmap reuses the names and conventions of the author's own public formalization lean-SFVK (stated there as Apache-2.0); `Suggested.lean` was not compared with that repository.
- Not tested: Vilenkin–Klimyk Vol. 2 has the largest share of the locators (28 of 61); neither its text nor its table of contents could be read, so wording and arrangement were not compared with it, nor with the other three books.
- Scope of 4.6: `hasSum_cexp_inner_sphereEval` assumes `4 ≤ n` and `fourier_mul_eval_div_norm` assumes `1 ≤ l`, called ownership boundaries in "Scope and ownership"; the open sibling states `n = 3` in its own `Y_l^m` and the case `l = 0`.
