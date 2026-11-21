# Review of SpecialFunctionsSU11MatrixElements (pull request #2934 at e88a77c)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every identity the layers state was recomputed from the circle integral (closed forms, symmetries at and off the Gamma poles, unitarity sums, the discrete series, addition and multiplication, generating functions, recurrences, the other subgroups, and Mehler–Fock Parseval of orders 0, 1, 2) and each agrees with the README and with the Lean signature. There are three small corrections and three format notes, none blocking. None of the four cited books could be read legally, so no locator and no wording was compared with a source; that, and the reuse of the author's own public formalization, are left to the human reviewers.

## C01 — `ContRepresentation` is Mathlib's structure, not a Tau Ceti declaration, and the Tau Ceti import of `Suggested.lean` is not used

A reader who follows the supplier contract "From Tau Ceti" (README line 739) to `TauCeti/RepresentationTheory/Continuous/MatrixCoefficient.lean` finds no definition of `ContRepresentation` there: at the pin it is declared in `Mathlib/RepresentationTheory/Continuous/Basic.lean`, line 55, and the Tau Ceti file's own docstring (line 22) calls it "Mathlib's `ContRepresentation`". A copy of `Suggested.lean` with the line `public import TauCeti.RepresentationTheory.Continuous.MatrixCoefficient` deleted elaborates with the same 44 `sorry` warnings and no error, so nothing of that module is used.

The smallest change: move `ContRepresentation` to "From Mathlib" with its file, drop the import (the file rules ask for the Tau Ceti modules actually used only), and adjust the sentence of the description "It imports only Mathlib and `TauCeti.RepresentationTheory.Continuous.MatrixCoefficient`" and the heading of the closing `#check` block accordingly.

## C02 — The unitarity relations and the bound of 2.1 hold for every real `n`, which the Conventions say would then be stated so

Conventions (line 71) says "Identities that hold for every real `n` with `m = n + k`, `k ∈ ℤ`, are stated so", but 2.1 and its three Lean statements restrict to the weights `n − e/2`. At `τ = −1/2 + 0.8i`, `t = 0.9`, `n = 0.3` I get `Σ_k |𝔓^τ_{n+k,n}|² = 1.000000000000` and `Σ_k |𝔓^τ_{n,n+k}|² = 1.000000000000`. The reason is elementary: the integrand of 1.1 has modulus `|A(θ)|^{2 Re τ} = |A(θ)|⁻¹` on `Re τ = −1/2`, the mean of `|A|⁻²` over the circle is `1/(cosh²(t/2) − sinh²(t/2)) = 1`, and Parseval on the circle gives the first sum; the second follows from the transposition of 1.4, whose Gamma quotient has modulus `1` when `m − n ∈ ℤ` and `Re τ = −1/2`.

Either would do: state the two sums and the bound for real `n` and `k ∈ ℤ` (the proof then needs no representation), or keep them on the weights and reword the sentence of Conventions to say that 2.1 is stated on the weights of the series.

## C03 — The route to the inversion formula of 5.2 omits the decay of the transform, without which the inversion integral is not known to converge

The proof paragraph of 5.2 (lines 603–605) derives inversion "from Parseval by polarization and the continuity and bound of `ρ ↦ 𝔓^{−1/2+iρ}_{00}(cosh t)`". The bound `|𝔓| ≤ 1` only gives `|mehlerFock f ρ| ≤ ∫ |f| dμ`, a bounded function of `ρ`, and the measure `ρ tanh(πρ) dρ` is infinite; so the integral in `SU11.mehlerFock_inversion` is not shown to exist, and the passage from the `L²` identity to a pointwise value has nothing to dominate it. An implementer who follows the sketch is stuck at integrability.

The missing input is already in the roadmap: for smooth `f` with compact support in `(0, ∞)`, the equation of 4.2 at `m = n = 0` and two integrations by parts give `mehlerFock (f″ + coth t · f′) ρ = −(1/4 + ρ²) · mehlerFock f ρ`, hence decay faster than every power of `ρ`. Add that sentence to the route and 4.2 to the `*Needs:*` line of 5.2 (and of 5.3, where the equation is the one with `n = 0` and general `m`).

## N01 — "Row" and "column" are used both ways

`SU11.hasSum_norm_sq_boostMatrixElement_row` sums over the first index and its docstring calls it "the column through `n − e/2`"; the `_column` theorem has the docstring "the row through"; 3.3 calls sums over the first index "row sums". One convention for the three would let a reader match name, docstring and prose.

## N02 — The dependency summary in "How to read the build" differs from the `*Needs:*` lines

"Layer 3 uses 1.1 and 1.3" (line 57), while 3.3 needs 1.5 (the values of `𝔓^{1/2}`); "2.2 uses 1.2 and 1.4" while its `*Needs:*` line has 1.1–1.2, 1.4.

## N03 — "the sign `+`" in the last bullet of 3.3 does not say which of the two signs is meant

The bullet has `θ = ±π/2` and `(∓i)^k`; "the sign `+` is [VK, §6.7.1 (10)]" could be either. Writing "the case `θ = π/2`, with `(−i)^k`" (or the other) removes the doubt.

## Verified sound

All values below were computed by me from the circle integral of Conventions (trapezoid rule on the circle, double precision), at `τ = 0.23 + 0.4i`, `t = 1.3` unless stated.

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.1 definition and principal series | `(n', n) = (2,−1), (0,0), (1,3)`; `e = 0, 1`; `(α,t,γ) = (0.7,1.3,−2.1)` | `𝔓_{2,−1} = −0.0115064149 − 0.0159750333i`; circle-model `D` minus phase·`𝔓`: `≤ 2·10⁻¹⁵`; with `e^{−i(…)}`: `0.0138`, `0.0484` | holds; wrong phase excluded | none |
| 1.1 identity, parity | `τ = 1`: `𝔓_{10}`, `𝔓_{01}`; `t = −1.3` | `sinh t/2`, `sinh t` by hand; `𝔓_{2,−1}(−t) = +0.0115064149 + 0.0159750333i` | holds | none |
| 1.2 `tanh²` form | `(m,n) = (2,−1), (0,0), (5/2,1/2), (3,3), (1.3,0.3)`, `t = ±1.3` | difference from the integral `≤ 2·10⁻¹⁵` | holds, also for `t < 0` | none |
| 1.2 `−sinh²` form | same indices, `t = ±0.9` (series range) | difference `≤ 1.4·10⁻¹⁵` | holds | none |
| 1.3 Laplace, Legendre | `t = ±1.3`; `τ = −1/2 + 0.8i`, `t = 0.9`; `τ = 1`, `m = 1` | Laplace minus integral `≤ 1.4·10⁻¹⁵`; `0.8331690033`; `𝔓^1_{10} = sinh t/2 = Γ(2)/Γ(1)·P^{−1}_1` | holds | none |
| 1.3 Gamma quotients of the Check | `m = 1, 2, −1` | `τ`, `τ(τ−1) = −0.3371 − 0.216i`, `1/(τ+1) = 0.735250 − 0.239106i` | Check true | none |
| 1.4 sign reversal, transposition, reflection, conjugation | `(2,−1), (1.3,0.3), (0.3,2.3), (−1.5,0.5)` | all four differences `≤ 1.4·10⁻¹⁵`; `𝔓_{−1,2} = −0.0016647647 + 0.0513779018i` | holds for real non-integral `n` | none |
| 1.4 at the Gamma poles | `(τ,m,n) = (1,3,0), (1,1,0), (1/2,3/2,1/2), (−2,1,0), (0.3,1.3,0.3), (2,−3,1), (−3,2,1)` | both sides of swap and of reflect agree to `3·10⁻¹⁵`; `𝔓^{−2}_{0,2} = 0` while `𝔓^1_{0,2} = 1.2977` | reciprocal-Gamma form has no junk | none |
| 1.5 vanishing | `ℓ = 1`: `(2,1), (2,0), (2,−1)`; `ℓ = 3/2`; `ℓ = 0` | `≤ 5·10⁻¹⁶`; `𝔓^1_{1,2}(0.9) = 1.2819588691`; `𝔓^0_{01}(0.9) = 0.4218990053` | holds; orientation matters | none |
| 1.5 Jacobi and `SU(2)` forms | seven `(ℓ, m', m)` with `m' ≥ \|m\|`; `ℓ = 1` against Edmonds's `d¹` | Jacobi form agrees to `3·10⁻¹⁵`; `(−i/√2)(i sinh t/√2) = sinh t/2 = 𝔓^1_{10}` | holds with the supplier's `d` | none |
| 2.1 principal series | `τ = −1/2 + 0.8i`, `t = 0.9`, `m = 0, 2, −1/2, 3/2, 0.3` | both sums `1 ± 4·10⁻¹⁵`; max `0.8331690` at `(0,0)`; `τ = 0.1`: `1.0585138265` | holds (also at `n = 0.3`: C02) | C02 |
| 2.1 complementary series | `τ = −0.3`, `t = 0.9`, `n = 0, 1, −2` | weighted sums `1 ± 4·10⁻¹⁵`; inverse weights give `0.934`, `0.998`, `0.978`; unweighted `0.9535190712`; bound `0.95927` | weight orientation pinned | none |
| 2.1 boundedness range | `t = 5`; `τ = 1, 0, −1, −0.3, −1/2, 0.2+i, −1.2`; `τ = 2i` at `t = 8, 12` | `74.21`, `1`, `1`, `0.412`, `0.334`, `1.475`, `2.169`; `0.39899`, `0.39893` | consistent with `−1 ≤ Re τ ≤ 0` | none |
| 2.2 discrete series | `k = 2`: `(2,1)`; `k = 3`: `(1,3)`; Euler phases at four `(k,j',j)`; `Σ_{j'}` for `k = 2, 3` | `D_{21} = −0.5470715360`, `𝔓^{−1}_{3,2} = −0.6700230580`, quotient `0.8164966 = √(2/3)`; `1.8257419 = √(10/3)`; phases `≤ 2·10⁻¹⁵`; sums `1.000000000000` | holds | none |
| 3.1 addition theorem | `t₁ = 0.8`, `t₂ = 1.1`, `φ = 0.7`; `(2,−1), (0,0), (3/2,−1/2)` | `cosh t = 3.1387881544` both ways (`−` sign: `1.3242818905`); sum minus right side `≤ 1.4·10⁻¹⁵`; with `e^{−ikφ}`: `−0.03727 − 0.02621i` vs `−0.00777 − 0.04490i` | holds | none |
| 3.2 multiplication, kernel | `k = 0, 1, 2, −1`; kernel by Gauss–Chebyshev | Fourier form `≤ 8·10⁻¹⁶`; product `1.0302270795 + 0.2688277410i` both ways | holds; `1/π` confirmed | none |
| 3.3 generating function, row sums, convolution, shift | `n = 0, 1/2, 2, 0.3`; three `(m,n₁,n₂)`; four `(m,n)` | row sums minus `e^{±τt}` `≤ 10⁻¹¹`; second-index sum `4.2940403 + 2.4586036i`; convolution, shift `≤ 3·10⁻¹⁵`; `θ = ±π/2`: `1.1261047073 + 0.3133553931i` | holds | none |
| 4.1 derivatives, ladders | `(2,−1), (0,0), (3/2,1/2), (1.3,0.3)`; `t = −1.3`; `τ = 1` by hand | central differences agree to `3·10⁻¹⁰`; quotients `−0.77 + 0.4i`, `1.23 + 0.4i`; wrong pairing `−0.09251 + 0.00201i` | holds, also `t < 0` | none |
| 4.2 recurrences, equation in `z` | same indices; `τ = 1`, `(1,0)` by hand | recurrences `≤ 3·10⁻¹⁵`; negated right side misses by `0.2291`, `1.4268`; ODE residual `≤ 4·10⁻⁸` (finite differences); `√(z²−1)` solves it with `τ(τ+1) = 2` | holds | none |
| 5.1 other subgroups | `(n',n) = (2,−1), (0,3)`, `e = 0`; `(1,0)`, `e = 1`; `s = 0.8, −1.7` | `boostY`, parabolic differences `≤ 10⁻¹⁵`; `D = −0.0013370826 − 0.0045854908i`; `i^{m−m'}` misses by `0.0394`; `N² = 0` by hand | holds | none |
| 5.2 Mehler–Fock | `f = e^{−cosh t}`; `F = (x−1)e^{−x}` | `(2/π)^{1/2} K_{iρ}(1) = 0.3064219939`, `0.1068053193`; Parseval `0.03383382085` vs `e⁻²/4 = 0.03383382081` | holds; route incomplete (C03) | C03 |
| 5.3 order `m` | `m = 1, 2` Parseval; density identity for `m = 0, ±1` by hand; `ρ = 0.9`, `t = 1.2` | `0.0338338138`, `0.0338338208`; without the Gamma factor `0.0246704`; `\|𝔓_{10}\|² = 0.2061643714` | holds | none |
| Supplier copies in `Suggested.lean` | 20 definitions against SpecialFunctionsGroupModels' file at its open head | 20 of 20 textually identical | verbatim | none |
| `ContRepresentation` | pinned Mathlib and Tau Ceti; file without the Tau Ceti import | `Mathlib/RepresentationTheory/Continuous/Basic.lean:55`; 44 `sorry` warnings, 0 errors without the import | misattributed | C01 |

- Source locators checked against the text: 0 of 64 (no cited text could be read; see Not verifiable).
- Library declarations opened at the pin: `ContRepresentation` (`Mathlib/RepresentationTheory/Continuous/Basic.lean:55`), `TauCeti/RepresentationTheory/Continuous/MatrixCoefficient.lean:22`, `TauCeti/Analysis/SpecialFunctions/RegularizedHypergeometric.lean:53` (the series with at most as many upper as lower parameters, not the Gauss function on the cut plane); no Jacobi polynomial, Legendre function, `SU(1,1)` or Mehler–Fock declaration in either library.
- Cross-roadmap citations resolved: SpecialFunctionsGroupModels Conventions, §§0.1, 2.1–2.3, 3.1–3.3, 4.1, 4.3, 5.2, 5.4; SpecialFunctionsSU2MatrixElements §2.3; SpecialFunctionsLegendre 1.1, 1.4, 4.5, 8.2, 10.2 (open heads); NoncompactQuantumSymmetry M4 (its M4.SL2R) and M4.P, SpecialFunctionsHypergeometric Layer 1 and 5.1, LaguerreJacobi Layer 3 (main). All exist with the cited subject.
- Dependency check: `depcheck: 171 roadmaps, 1989 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `Suggested.lean` elaborates with 44 `declaration uses sorry` warnings and nothing else; no `set_option`, no sorried data.
- One-tactic probe on a copy of the file (`rfl`, `simp`, `simp` with the roadmap's definitions unfolded): 0 of 44 theorems close.
- Signatures: the 44 elaborated types were compared with the README statements; every hypothesis is an explicit binder and none is lost; generality agrees in each.
- Description: 44 named targets and 34 claimed proved in the prior formalization both match the README's lists; suppliers named match the README.

Overlap check: read SpecialFunctionsGroupModels, SpecialFunctionsRankOneSymmetricSpaces, SpecialFunctionsMotionGroupsBessel, SpecialFunctionsAffineHeisenbergGroups, SpecialFunctionsHigherSpheres, SpecialFunctionsSU2MatrixElements, SpecialFunctionsLegendre (open), SpecialFunctionsAppell, SpecialFunctionsBessel, SpecialFunctionsHypergeometric (main). Shared objects: the models, general matrix elements and Euler factorization are SpecialFunctionsGroupModels' (cited, copied verbatim for the Lean file); `P^μ_ν`, Laplace's integral and the Legendre addition theorem are SpecialFunctionsLegendre's (cited; it places the Mehler–Fock transformation outside its scope); the identification with Jacobi functions is SpecialFunctionsRankOneSymmetricSpaces', which cites 1.1–1.3, 2.1 and 5.2 here; `𝔓^τ_{mn}` and the Mehler–Fock transform have this roadmap as their only owner.

Source independence: 0 passages compared with 0 sources, because none of VK, W, D, M could be read legally; largest share VK, 37 of 64 locators; contents not compared with VK's text. By locator numbers alone the layers are not one to one with VK's sections: Layer 1 ↔ §6.5.1–6.5.10 in another order, Layer 2 ↔ parts of §6.5.1 and §6.5.6, Layer 3 ↔ §6.6 with §6.7.1 and §6.7.3, Layer 4 ↔ §6.7.2, Layer 5 ↔ §7.7.1 and §7.8.4.

Research link: The targets are the `SU(1,1)` matrix-element identities and Mehler–Fock inversion of Vilenkin–Klimyk (1991), Wawrzyńczyk (1984), Dieudonné (1980) and Miller (1968); SpecialFunctionsRankOneSymmetricSpaces uses them for Jacobi-function harmonic analysis on rank-one symmetric spaces. Rests on the README's References and Downstream consumers, not on a source text.

## Not verifiable

- Every source locator of the sampled sections 1.1–5.3 (theorem numbers, pages, hypotheses): [VK] and [W] resolve only to a paywalled publisher page; for [D] the publisher's page is not an open copy and for [M] no legal copy was found (the author's former page returns "not found"). The statements were checked by computation instead.
- The README's list of misprints in [VK], [W] and [M] (end of References): the printed formulas could not be read. The corrected forms the README uses are the ones my computations confirm (`1/π` in the kernel form, `e^{ikφ}` in the addition theorem, inversion constant `1`).
- The values quoted "to `10⁻²⁵`" or "to `10⁻³⁰`" in the Checks were confirmed to double precision only (about `10⁻¹⁵`).
- The negative-control value `0.03713` of 5.2 (density `ρ dρ`): my quadrature gives `0.0372` and does not resolve the fourth digit.

Automatic checks set aside as false positives: a section comment at the end of the Lean file was reported as having no declaration under it; it heads the `#check` pins of library declarations, which are its content and which the file rules allow.

## Source issues

- none

## For the human reviewers

- **Not tested.** [VK] carries 37 of the 64 locators; neither its text nor its table of contents could be read, and [W], [D], [M] could not be read either. Wording and arrangement were not compared with any source.
- **Licence.** The README ("Prior formalization") says the Lean names and statements are those of the author's public repository `bjbraams/lean-SFVK` (Apache-2.0), directory `SFVK/SU11/`; I did not open that repository.
- **Licence.** `Suggested.lean` contains 20 definitions copied verbatim from the `Suggested.lean` of SpecialFunctionsGroupModels, an open pull request by the same author.
