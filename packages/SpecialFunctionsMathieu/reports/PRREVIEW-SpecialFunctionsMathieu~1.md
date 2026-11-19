# Review of SpecialFunctionsMathieu (pull request #2538 at f0797e5)

**Verdict:** needs changes

**Summary.** Changes are needed, for three findings, none of which touches a stated theorem: an Example in Layer 2 asserts a pole of Hill's determinant that is absent for some real `q`; the proof sketch of the gap theorem in 3.3 rests on an inequality that is false for non-even `Q`; and two auxiliary results listed as owned here (Pincherle's theorem, compactness of integral operators with continuous kernel) are already owned by roadmaps on main. Every numerical Check I recomputed agrees with the README, `Suggested.lean` elaborates with `sorry` as its only warning, and the corrections to DLMF that I could test hold. There are five small corrections and one format note; the scope and licence points for a human are at the end.

## R01 (P2) — Hill's determinant `D(a, q)` does not have a pole at `a = 0` for every `q ≠ 0`

The second Example of Layer 2 (`TauCetiRoadmap/SpecialFunctionsMathieu/README.md`, line 659) says "`D(a, q)` has a pole at `a = 0` for `q ≠ 0` (the entry `B_{0,±1} = −q/a`)". A reader who uses it as a test of an implementation of 2.3 will reject a correct one.

By Hill's formula of 2.3, `D(a, q)(1 − cos π√a) = 1 − w_I(π; a, q)`, and `1 − cos π√a` has a simple zero at `a = 0`, so `D(·, q)` has a pole at `0` exactly when `w_I(π; 0, q) ≠ 1`. By 1.3, `w_I(π) − 1 = 2 w_I′(π/2) w_II(π/2)`, which vanishes at `a = 0` whenever `0` is one of `a_{2n}(q)`, `b_{2n+2}(q)`. That happens for real `q`: `w_II(π/2; 0, q)` is `0.22308` at `q = 7` and `−0.17096` at `q = 8`, with its zero at `q = 7.57969 04`, where `b₂(q) = 0` and I get `w_I(π; 0, q) − 1 = 4·10⁻¹¹`; the README's own `q* = 69.42837 82910` (7.3), where `a₄(q*) = 0`, is another. At these `q` the singularity of `D` at `a = 0` is removable.

The smallest repair is to restrict the sentence: "for `q ≠ 0` with `w_I(π; 0, q) ≠ 1`, in particular for real `0 < |q| < 7.5796`" (on that range `a₀(q) < 0 < b₂(q) < a₂(q)`). The Lean statement `tendsto_mathieuHillDet` asserts only `MeromorphicAt` and needs no change.

## R02 (P2) — The inequality `w_II(π, λ) w_I′(π, λ) ≥ 0` outside the open bands, on which the sketch of the gap theorem rests, is false for non-even `Q`

The proof sketch of 3.3 (README lines 748–750) says: "`w_II(π, λ) w_I′(π, λ) ≥ 0` outside the open bands, by the Wronskian and `|Δ| ≥ 2` there". An implementer who follows it tries to prove a false lemma, and the Wronskian gives the opposite kind of bound: from `w_I w_II′ − w_II w_I′ = 1` at `π`,

```text
4 w_II(π) w_I′(π) = Δ² − 4 − (w_II′(π) − w_I(π))²,
```

so the product is `≥ 0` on `|Δ| ≥ 2` only when `w_I(π) = w_II′(π)`, as for even `Q`. For `Q(x) = −2 cos(2x + π/4)` (the Mathieu potential translated, so `Δ` and the gaps are those of `q = 1`) I computed, at `λ = −0.0602` inside the first gap, `Δ = −2.40129`, `w_II(π) = 0.24898`, `w_I′(π) = −3.45499`, product `−0.86023`; at the gap end `λ = μ₁ = −0.11025`, product `−1.42102`; at `λ₀ = −0.45514`, product `−2.52212`. The Dirichlet and Neumann values of this `Q` in the first gap are `ν₁ = 0.01397` and `τ₁ = 1.85873`, and the product is positive only between them.

The gap theorem itself is true and `hill_gaps` needs no change. A sentence that does the job: at a root of `w_II(π, ·)` or of `w_I′(π, ·)` the Wronskian gives `w_I(π) w_II′(π) = 1`, hence `|Δ| = |w_I(π) + 1/w_I(π)| ≥ 2`, so every Dirichlet and Neumann value lies outside the open bands; the sign of `w_II′(π, ν_k)` (resp. `w_I(π, τ_k)`), which is `(−1)^k` by Sturm's count of 3.1, then says which kind of gap, and the count places one of each in the `k`-th.

## R03 (P2) — Two auxiliary results listed as owned here are already owned by roadmaps on main

"Auxiliary results owned here" (README lines 101–119) lists "the limit of finite continued fractions with complex entries for the tails of a three-term recurrence with a minimal solution (7.3)" and "compactness of an integral operator with continuous kernel on `L²` of a compact interval (6.1)". Both have owners on main, so an implementer would build them twice, with two conventions for the first.

Pincherle's theorem is SpecialFunctionsEiLiErfIncompleteGamma §4.1 (`TauCetiRoadmap/SpecialFunctionsEiLiErfIncompleteGamma/README.md`, lines 700–733): minimal solutions of `y(n+1) = b_n y(n) + a_n y(n−1)`, the continued fraction as a `GenContFract ℂ`, and convergence of its convergents iff a minimal solution with `f(0) ≠ 0` exists, with value `−f(1)/f(0)`. SpecialFunctionsBessel on main and the open SpecialFunctionsConfluent and SpecialFunctionsLegendre consume it from there. Against this, the Conventions here say "Mathlib's `GenContFract` carries the algebra of convergents but no analytic convergence theory" (line 258) and 7.3 restates the theorem for a nested-quotient recursion. The repair: cite §4.1 for the equivalence and its conventions in the supplier contracts and in the `*Needs:*` of 7.3; keep in 7.3 what §4.1 does not give (that a recurrence with `|β_k| → ∞` and bounded nonzero `α_k` has a minimal solution, and that the tail denominators are nonzero from some index on); and state once that the nested quotient `mathieuTail` equals the convergent of §4.1 when the partial denominators are nonzero, since the two totalizations differ when one vanishes.

A continuous kernel on `[a, b]²` is square-integrable, so its operator is Hilbert–Schmidt by AutomorphicSpectralTheory §0.8 (`TauCetiRoadmap/AutomorphicSpectralTheory/README.md`, line 239; square-integrable kernels on σ-finite standard Borel spaces), and Hilbert–Schmidt operators are compact at the pin: `ContinuousLinearMap.isCompactOperator_of_hilbertSchmidtEnergy_ne_top`, `TauCeti/Analysis/InnerProductSpace/HilbertSchmidt/Columns.lean`, line 257. RepresentationTheory/CompactGroups (README line 510) has the continuous compact case. The repair: delete the first bullet of 6.1 and the matching line of the scope list, and cite AutomorphicSpectralTheory §0.8 with the pinned lemma in 6.1's `*Needs:*`. Both suppliers are on main, so the direction of supply is unaffected; the pull request's description then lists them among the dependencies.

## C01 — Sections 5.2, 6.4, 8.3 and most of 8.5 give their targets by DLMF number only

"Prove DLMF 28.31.18–28.31.21", "Prove DLMF 28.19.2–28.19.3 … with 28.19.1", "prove 28.22.1–28.22.4, 28.22.11–28.22.12", "DLMF 28.28.17–28.28.23", "DLMF 28.28.24–28.28.49" name formulas without stating them, so the roadmap does not say what is to be proved, with which ranges of `ν`, `h`, `z`. This matters more here than usual: the roadmap itself documents seven printed formulas of this chapter as wrong, and the provenance table says most of 28.28 and all of 28.19 are admitted in the prior formalization, so these ranges were not tested there. Stating each family once in the roadmap's own notation with its hypotheses (as 8.5 already does for 28.28.11 and 28.28.16), or saying which of them were checked and how, would close this.

## C02 — About a dozen definitions of `Suggested.lean` are used by no theorem

`Complex.besselI`, `Complex.besselK` (and the `𝐅` notation they need), `mathieuFourierB`, `mathieuFe`, `mathieuGe`, `mathieuCeNu`, `mathieuSeNu`, `mathieuCoeff`, the five `modifiedMathieuCe/Se/Me/Fe/Ge` and `radialMathieuMc/Ms` occur in no statement, so they test no convention and an implementer cannot tell them from the definitions the headlines need. `not_summable_besselJ_series` even takes a sequence `c` with a hypothesis that repeats the body of `mathieuCoeff` in place of using it. Either state a headline through each (for instance 28.20.21 or a joining formula through `radialMathieuMc`, and `mathieuCoeff ν n (h ^ 2)` in the divergence theorem) or leave them to the README.

## C03 — The README and the module docstring call statable targets "headlines" and leave them unstated

The scope section says "the other headlines are targets of the same standing, stated in prose", and the docstring that the remaining ones "are statable with the definitions below and are left to the README". Layer 6 in particular has no Lean statement, although completeness of the `ce_n`, `se_n` (6.1 for `Q = −2q cos 2x`) and the integral equation 28.10.1 are statable with `mathieuCe`, `mathieuSe`, `mathieuFourierA`. Would the author either state the expansion theorem of 6.1, or call the unstated ones targets and reserve "headline" for what the file states?

## C04 — The hypothesis of periodicity is unused in three Lean statements

`hillWI_mul_deriv_hillWII_sub` (the Wronskian is `1` for every continuous `Q`), `deriv_hillDiscriminant` and the growth bound of `hillDiscriminant_growth` hold for `λ ↦ w_I(π, λ) + w_II′(π, λ)` without `Function.Periodic Q π`: at `Q(x) = x`, not periodic, the Wronskian is still constant because the equation has no first-order term. Drop `hper` there, or say in the README that it is carried for uniformity.

## C05 — "Sharper Puiseux exponents … needs only `(q − q₀)^{1/k}`" names a statement that is not the general sharpening

In "Beyond this roadmap" the bullet reads as if exponent `1/k` were the true sharp form. The `k` roots at a collision split into cycles of lengths `p₁ + ⋯ + p_r = k` (Kato's cycles, which 7.4 cites), each a series in `(q − q₀)^{1/p_i}`; `1/k` suffices only for a single cycle (two cycles of lengths 2 and 1 at `k = 3` need exponent `½`, which no series in `(q − q₀)^{1/3}` gives). 7.4 already words this with care; the bullet could say "the cycle lengths at Mathieu collisions".

## N01 — One Mathlib name is written without its namespace

`laplacian_eq_iteratedFDeriv_complexPlane` (README lines 366 and 516) is `InnerProductSpace.laplacian_eq_iteratedFDeriv_complexPlane` at the pin, as `Suggested.lean` writes it.

## Questions for the author

- 2.3 cites Whittaker–Watson §19.61, pp. 422–424, for "convergence of determinants of von Koch's type". I expected the convergence of infinite determinants at §§2.8–2.82 of that book, which §19.42 uses, and §19.61 to be about the series defining the Mathieu functions. Is §19.61 the intended place? I could not read the book.
- 7.3 proves the `n = 0` identity for all real `q` from `A^0_0(q) ≠ 0` alone. With nested quotients, the truncations converge once every inner tail does, which needs `A^0_{2m}(q) ≠ 0` for all `m` (true for real `q ≠ 0`: a zero would make the tail an `ℓ²` eigenvector of the truncated tridiagonal matrix at its strict lower bound `a₀`). Is that step meant to be part of 7.3? I did not find it in 6.2.
- The overall sign of the corrected 28.28.16 (8.5): I confirmed that DLMF's range `π ≤ y ≤ 2π` for the lower sign cannot be right, but not the sign, which needs `Ce_{2n}` on `(0, ∞)`.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.1 basic solutions, Wronskian | `Q = 0`, `λ = −1`; `Q = −2cos 2x`, `λ = 1.5` | `cosh π = 11.59195`; `w_I(π) = −1.5637429712`, same as Mathieu `w_I(π;1.5,1)` | agrees | C04 (`hper` unused) |
| 1.2–1.3 values, `w_I(π;a,−q)` | `a = 1.5, 3`, `q = ±1` | `−1.5637429712`, `0.5133105431`; `w_I(π/2) = 0.2512298342` vs `−1.1219666108` | agrees | none |
| 1.4 separation, Helmholtz, algebraic forms | chain rule by hand | `ΔF = −2q(cosh 2ξ − cos 2η)F = −4q·abs(sinh w)²F`; 28.2.2 residual `= ¼(w″ + (a − 2q cos 2g)w)` | agrees | N01 |
| 2.1 trace | `λ = 1.5, 3`, `q = 1` | `Δ = −3.1274859424`, `1.0266210863`; `Δ² − 2 = 7.7811683198`; `w_I + w_II(π) = −3.2307280152` | agrees | none |
| 2.3 Hill's formula `tendsto_mathieuHillDet` | `(1.5,1)`, `(3,1)`, `q = 0`, `N = 100` | `D = 1.4559059222`, `1.4577254716`; truncation error `6.07·10⁻⁸`; wrong factor gives `0.1580175479` vs `−0.7609262605` | agrees | none |
| Layer 2 Example, pole of `D` at `0` | `q = 7.5796904` (`b₂ = 0`), `q*` | `w_I(π;0,q) − 1 = 4·10⁻¹¹`, so no pole | false | R01 |
| 2.4 `ince_theorem` | complex `q ≠ 0`; periods `π` and `−1` multiplier | recurrence at `m = 1` forces `2qA₀ = 0`; multipliers `1, −1` give `det = −1 ≠ 1` | sound | none |
| 2.5 stability iff | `(1.5,1)`, `(3,1)`, `(1,0)`, `(0,0)` | `1.56 > 1` unstable; `0.51` stable; `q = 0, a = 1` bounded with modulus `1`; `w = z` | agrees | none |
| 3.2 variation formula | `Q = 0` | integrand `sin(πs)/s`, so `Δ′ = −π sin(πs)/s`; form discriminant `Δ² − 4` | agrees | C04 |
| 3.3 interlacing, gaps, zeros | `Q = 0`; `q = 1`; translated `Q` | `0,4,4,…` and `1,1,9,9`; `a₀…a₂ = −0.4551386041, −0.1102488170, 1.8591080725, 3.9170247730, 4.3713009827`; `ν₁ = 0.01397`, `τ₁ = 1.85873` in `[μ₁, μ₂]` | theorems agree | R02 (sketch) |
| 3.3 sketch `w_II(π)w_I′(π) ≥ 0` | `Q = −2cos(2x + π/4)` | product `−0.86023` at `λ = −0.0602` (`Δ = −2.40129`) | false | R02 |
| 3.4 `mathieuA`, `mathieuB`, weak ordering | `q = ±1`, index parity | `w_I′(π/2; a₁(1), 1) = −1.6808564766 ≠ 0`; `a₁(−1) − b₁(−1) = −1.9693568895` | agrees | none |
| 3.5 `mathieuLambda` | `ν = 0.5, 1.5, 2.5, −1.5`, `q = 1, 0` | `−0.3072853506`, `2.5371800871`, `6.3484471759`; bands `0,2,4,…` and `1,3,5,…` for `ν + 2n` | agrees | none |
| 4.1 normalization, zeros, 28.2.34 | `q = 0`; `q = 1` | `ce₀(0,1) = 0.3848278293`; zero counts of `cos 2nz`, `sin(2n+1)z`, `cos(2n+1)z`, `sin(2n+2)z` in `(0, π/2)` all `n` | agrees | none |
| 4.2 Check `A²/A⁰` | `n = 0` | `a₀(q)/q = −0.4551386041` at `q = 1` | agrees | none |
| 4.3 `mathieuFeT`, `mathieuFeC_odd_neg` | periodicity of `f_n`; DLMF sign rule; `n = 0` | `t = (−1)ⁿ w_II(π)/(π ce(0))`; `C(−q) = εS(q)` gives limit `−ε sin`, so `ε = −1`; `C₀ = 14.2939, 56.6066, 282.8503` at `q = 0.2, 0.05, 0.01` | agrees | none |
| 4.4 `mathieuMeRaw`, `integral_mathieuMe_mul_neg` | `q = 0`; `ν = ±n` | coefficient `i sin πν/w_II(π)`; `e^{iνz}`; `2∫₀^π ce² = π`; `(−√2 i)²·(−se²) = 2se²` | agrees | none |
| 4.5 Check first order | `ν = ½` | `c₂ = −q/(4(ν+1)) = −q/6`, `c₋₂ = −q/(4(1−ν)) = −q/2` | agrees | none |
| 5.1 `whittakerHill_of_ince`, Checks | substitution; `p = 1` | bracket `η − (p+1)ξ cos 2z − ξ² sin² 2z/4`; residuals `(η−1−ξ)cos z`, `(η−1+ξ)sin z` | agrees | none |
| 5.2 double orthogonality | `ξ > 0`, `ξ < 0` contours | `exp(−ξ cosh 2t/4)` and `exp(ξ cosh 2t/4)` with `ξ < 0`: both decay | agrees | C01 |
| 6.1 expansion theorem | DLMF 28.30 hypotheses; `Q = 0` | `f` continuous periodic, `f″ ∈ L²`; `(1/2π)∫(√2 cos)² = 1` | agrees | R03, C03 |
| 6.2 integral equations | 28.10.1 at `n = 0`, `h → 0` | both sides `1/√2` | agrees | none |
| 7.1 `exists_analyticAt_mathieuA_zero` | `q = 0.1` | `a₀ = −0.0049945438005`, series `−0.0049945438368`; `F″(0) = −1`, `F⁗(0) = 1.3125` | agrees | none |
| 7.2 ordering, `tendsto_mathieuLambda_one` | `q = ±1`, `ν = 0.999, 1.001` | `−0.1102500 → b₁`, `1.8591112 → a₁`; order reversed at `q = −1` | agrees | none |
| 7.3 `tendsto_mathieuTail_mathieuA_zero` | `q = 0.1, 0.5, 2`; `q*` | `−2T = −0.1217655449 = a₀(0.5)`, `−T = −0.0608827725`; `−1.5139568851` at `q = 2`; `w_I′(π/2; 0, q*) = 5·10⁻⁸`, third root, so `a₄` | agrees | R03 |
| 7.4 exceptional values | Tau Ceti Puiseux lemma read | exponent any multiple of `d!`; DLMF `±1.4688i`, `2.0886` | agrees | C05 |
| 7.5 sum rules | order `q²` | `−½ + 5/12 + ½(½ − ⅓) = 0`; Gershgorin condition `6M > 4 + 5·abs(q)` | agrees | none |
| 8.1 `modifiedMathieuHankel`, 8.2 | 2.7.10 exponents; `h = √2` | `λ = ±2ih`, `μ = −½`; `(πh)^{−1/2} = 0.474425` | agrees | none |
| 8.3 joining factors | DLMF 28.22.5–28.22.8 denominators | `A^{2m}_0`, `A^{2m+1}_1`, `B^{2m+1}_1`, `B^{2m+2}_2`, the four of 6.2 | agrees | C01 |
| 8.4 `not_summable_besselJ_series` | `n → −∞` | term modulus `≍ abs(cosh z)^{−2·abs(n)}/√(π·abs(n))` | agrees | C02 |
| 8.5 `integral_exp_mul_mathieuCe` | `q → 0` against the Hankel integral | `∫₀^∞ e^{ix cosh t} cosh νt dt = ½πi e^{iνπ/2} H⁽¹⁾_ν(x)` | agrees | none |
| `differentiable_besselJLog`, Checks | Mathlib body of `besselJ`; `μ = ½` | `exp(μ(L − log 2))·G(e^{2L})`; `J_{1/2}(1) = 0.67140`, sign `e^{iπ} = −1` | agrees | none |
| `tendsto_det_one_add_of_summable` | empty set; Hadamard | `det` of `0 × 0` is `1`; `∑_s ∏_{i∈s} r_i = ∏(1 + r_i) < ∞` | sound | none |

- Source locators checked against the text: 13 DLMF sections (28.2, 28.5, 28.6, 28.7, 28.10, 28.12, 28.20, 28.22, 28.23, 28.28, 28.29, 28.30, 28.31), read at dlmf.nist.gov; the eight books could not be read.
- Library declarations opened at the pin: `Complex.besselJ` (`Mathlib/Analysis/SpecialFunctions/Bessel.lean:55`), `TauCeti.rouche` (`TauCeti/Analysis/Complex/Conformal/Rouche.lean:294`), `TauCeti.Polynomial.exists_analyticOnNhd_prod_X_sub_C_powerSubstitution_ball` (`TauCeti/Analysis/Polynomial/Puiseux/Monic.lean:55`), `ContinuousLinearMap.isCompactOperator_of_hilbertSchmidtEnergy_ne_top` (`TauCeti/Analysis/InnerProductSpace/HilbertSchmidt/Columns.lean:257`); the 33 `#check` lines elaborate.
- Cross-roadmap citations resolved on main: AsymptoticExpansions §§10.2–10.4; SpecialFunctionsBessel Conventions, 1.2, 1.3, 1.6, 4.1, 4.2, 6.1, 6.2, 10.1 and its Sturm comparison (README line 134) and its consumer entry for this roadmap; OperatorTheory/UnboundedOperators §4.8. The local Bessel definitions have the bodies of `TauCetiRoadmap/SpecialFunctionsBessel/Suggested.lean`, under different fully qualified names.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with 43 warnings, all `declaration uses sorry`. One-tactic probe (`rfl`, `simp`, `infer_instance`) on a copy: none of the 43 theorems closes. Each elaborated signature was compared with its README statement; no binder is lost and the generalities agree.
- Dependency check: `depcheck: 200 roadmaps, 2191 edges, 0 problem(s)`; no UPWARD or CYCLE line. The pull request changes nothing outside the folder.
- Numerical values recomputed with a fourth-order Runge–Kutta integrator and bisection: all Checks of 1.1–3.5, 4.1 (`ce₀(0,1)`), 4.3 (`C₀`), 7.1–7.3. Not recomputed: `C₁`, `S₁`, `C₂` of 4.3, the sums of 7.5, the values of 7.4 and of Layer 8.

Overlap check: read SpecialFunctionsConfluent, SpecialFunctionsLegendre, SpecialFunctionsStruve, SpecialFunctionsGamma, SpecialFunctionsBessel, SpecialFunctionsAiry, SpecialFunctionsParabolicCylinder; none shares Hill's equation, Floquet theory, Mathieu functions or the separated Sturm–Liouville problems; Sturm comparison: owner SpecialFunctionsBessel (cited); Pincherle's theorem: owner SpecialFunctionsEiLiErfIncompleteGamma §4.1 (R03); Hilbert–Schmidt kernels: owner AutomorphicSpectralTheory §0.8 (R03).

Source independence: 7 passages compared with 1 source (DLMF: Ince's theorem, §28.20(iii), §28.30(i), §28.12(i), §28.7, the validity sentences of §28.23, the conditions on `Q` in §28.29), none shared beyond formulas; largest share DLMF, 199 of 279 source mentions; contents compared with DLMF Chapter 28: independent (Layer 1 draws on 28.2, 28.20, 28.29; Layer 3 on 28.2, 28.12, 28.29; Layer 7 on 28.6, 28.7, 28.15); the eight books could not be read.

Research link: Hill's discriminant, bands and gaps (Layer 3) are the spectral theory of periodic Schrödinger operators as in Levitan–Sargsjan 1991 and Kato 1995; the Mathieu and modified Mathieu functions are DLMF Chapter 28 and separate the Helmholtz equation in elliptic coordinates (Whittaker–Watson 1927). Rests on the README's sources and DLMF as read.

## Not verifiable

- Whittaker–Watson, Levitan–Sargsjan, Kato, Hale–Koçak, Arnold, Courant–Hilbert, Temme, Kristensson: no legal copy found (publisher pages paywalled or not open); their section and page locators in 1.1, 1.4, 2.1, 2.3, 2.5, 3.1–3.4, 4.1, 6.1, 6.2, 7.1, 7.4 were not checked.
- The numerical Checks of Layer 8, of 7.5 and the `C₁`, `S₁` values of 4.3: not recomputed.
- The overall sign of the corrected DLMF 28.28.16 and the divergence Check of 8.4 at `z = i`: not recomputed.
- DLMF 28.4, 28.11, 28.14, 28.15, 28.19, 28.24, 28.25: not opened.

Automatic checks set aside as false positives: the report of a section heading of `Suggested.lean` with no declaration under it; the heading stands over the `#check` lines that pin the library declarations the README names, which the form allows.

## Source issues

- **Error** in DLMF at §28.20(iii), Release 1.2.8: the source says the solutions of 28.20.2 are asymptotic to the square root of ζ times an exponential; it should be `ζ^{−1/2} e^{±2ihζ}`, as 2.7.10 gives `μ = −½`; affects a stated result.
- **Error** in DLMF at 28.5.6, second relation: the source says `C_{2m+1}(−q)` equals `S_{2m+1}(q)`; it should be `−S_{2m+1}(q)` under the sign rule stated after 28.5.7; affects a stated result.
- **Gap** in DLMF at 28.5.5 with 28.5.7: the source normalizes `C_n² ∫ f_n² = π` with no restriction while giving `fe₀(z, 0) = z`; it should exclude `n = 0`, `q = 0`, where `f₀ = 0`; affects a stated result.
- **Misprint** in DLMF at 28.6.16 read at `n = 0`: the source says the empty head leaves `a = −q²/(4 − a − ⋯)`; it should be `−2q²/(4 − a − ⋯)` (`−0.12177` against `−0.06088` at `q = 0.5`); affects a stated result.
- **Error** in DLMF at 28.23.3 and 28.23.5 (validity sentences, covering 28.23.2–28.23.5): the source says the `j = 1` series hold for all `z`; it should require `|cosh z| > 1` (resp. `|sinh z| > 1`) when `ν ∉ ℤ`; affects a stated result.
- **Misprint** in DLMF at 28.28.11: the source says the factor is `e^{iνπ}`; it should be `e^{iνπ/2}`, as in 28.28.12 and the Hankel integral at `q = 0`; affects a stated result.
- **Error** in DLMF at 28.28.16: the source assigns the lower sign to `π ≤ y ≤ 2π`; it should be `−π ≤ y ≤ 0`, since the left side is even and `2π`-periodic in `y` and `fe_{2n}` is not periodic; affects a stated result.

## For the human reviewers

- **Licence.** The README's "Prior formalization" section says the roadmap reuses the design of the author's `lean-DLMF` (Apache-2.0) and that "reused code carries attribution"; I did not compare `Suggested.lean` with that repository.
- **Not tested.** The eight cited books could not be read, so wording and locators were compared with DLMF only; DLMF has the largest share of the locators and was read.
- **Scope.** The roadmap states corrected forms of seven DLMF formulas (Conventions, "Corrections to DLMF"); I confirmed six in part or in full and list them under Source issues. Whether to report them to NIST is not the roadmap's matter.
