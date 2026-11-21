# Review of SpecialFunctionsSU11MatrixElements (pull request #2934 at 9186656)

**Verdict:** accepted

**Summary.** Accepted: no finding. This is an incremental re-review of the 136 lines changed since `e88a77c`; the previous review had no finding, and its three small corrections and three format notes are all repaired. The generalized unitarity relations and bound of 2.1 (real `n`), their new proof route, the new Checks of 2.1, 3.3 and 5.2, and the decay argument added to 5.2 and 5.3 were recomputed and agree with the README and the Lean signatures. One format note, not blocking. As before, none of the four cited books could be read legally, so locators and wording were not compared with a source; that is left to the human reviewers.

## N01 — The `*Needs:*` line of 5.3 omits 2.1, whose bound the new inversion sentence uses

"Inversion follows as in 5.2" (5.3, line 662) uses the bound `|𝔓^{−1/2+iρ}_{m0}| ≤ 1` of 2.1 to make the inversion integral converge; 5.2 lists 2.1 in its `*Needs:*` line, 5.3 (line 675) and the summary in "How to read the build" do not. Adding 2.1 to both would match.

## Previous findings

The previous report had no finding (R); its small corrections and format notes are accounted for here.

- C01 — repaired: `ContRepresentation` is under "From Mathlib" with `Mathlib/RepresentationTheory/Continuous/Basic.lean`; "From Tau Ceti" is gone; `Suggested.lean` has the single import `public import Mathlib`; the description says "It imports only Mathlib".
- C02 — repaired: 2.1 reads "for `Re τ = −1/2` and real `n`, the row sum `Σ_{k∈ℤ} |𝔓^τ_{n+k,n}(cosh t)|² = 1` and the column sum …"; the three Lean statements take `n : ℝ`, `k : ℤ`.
- C03 — repaired: 5.2 now derives `mehlerFock (f″ + coth t · f′) ρ = −(1/4 + ρ²) · mehlerFock f ρ` from 4.2 and uses the decay; 4.2 is in the `*Needs:*` lines of 5.2 and 5.3.
- N01 — repaired: Conventions defines "row sum" (first index) and "column sum" (second index); the `_row` and `_column` theorems, their docstrings and 3.3 agree with it.
- N02 — repaired: the summary in "How to read the build" now matches every `*Needs:*` line (2.1: 1.1, 1.3, 1.4; 2.2: 1.1–1.2, 1.4; 3.3: 1.1, 1.5; …), except 5.3 (N01 above).
- N03 — repaired: "`Σ_k i^k 𝔓^τ_{k0}(cosh t) = cosh^τ t` (the case `θ = −π/2`) and `Σ_k (−i)^k …` (the case `θ = π/2`)"; the first is attributed to [VK].

## Verified sound

Values computed by me from the circle integral of Conventions (1024-point trapezoid rule, double precision; sums over `|k| ≤ 60`).

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 2.1 row sum, real `n` (`hasSum_norm_sq_boostMatrixElement_row`) | `τ = −1/2 + 0.8i`, `t = 0.9`, `n = 0, 2, −1/2, 3/2, 0.3, 0.25, −1.7`; `τ = −1/2`, `n = 0.3, 1/2, −3/2`; `τ = −1/2 + 0.1i`, `t = 1.7` | `1.000000000000` in all eleven | holds | none |
| 2.1 column sum, real `n` (`…_column`) | same eleven | `1.000000000000` in all eleven | holds, also at `ρ = 0`, `n ∈ 1/2 + ℤ` | none |
| 2.1 route: modulus of the integrand, mean of `\|A\|⁻²` | by hand | `\|A^{τ+n} conj(A)^{τ−n}\| = \|A\|^{2 Re τ}` (the `Im τ · arg A` factors cancel); mean `= 1/(cosh² − sinh²) = 1` | holds | none |
| 2.1 route: Gamma moduli of the transposition | by hand; `ρ = 0`, `n = 1/2`, `k = 1, 2, −3` | `\|Γ(1/2+n+iρ)Γ(1/2−n+iρ)\| = π/\|cos π(n+iρ)\|`, unchanged by `n ↦ n+k`; `0.3825117100` both; `0.1613813099` both; `0` both | holds, poles as stated | none |
| 2.1 bound (`norm_boostMatrixElement_le_one`) | `n = 0.3, 0.25, −1.7, 1/2`, `\|k\| ≤ 5`, `τ = −1/2 + 0.8i`, `t = 0.9` | maximum `0.8225` | holds | none |
| 2.1 negative control | `τ = −0.4 + 0.8i`, `t = 0.9`, `n = 0.3` | row sum `0.968888209539`; mean of `\|A\|^{−1.6}` `= 0.968888209539`; column sum `1.0476` | Check true | none |
| 3.3 last bullet | `τ = 0.23 + 0.4i`, `t = 1.3` | `Σ i^k 𝔓_{k0}` and `Σ (−i)^k 𝔓_{k0}` both `1.1261047073 + 0.3133553931i = cosh^τ t`; `F(θ) = Σ_k 𝔓_{n+k,n} e^{−ikθ}` gives `(−i)^k` at `π/2` | holds, cases labelled correctly | none |
| 5.2 decay identity | bump `f` of the Check, `ρ = 0.7, 2.1` | `mehlerFock f = 0.1813610422`, `−0.0638318678`; `mehlerFock(f″ + coth·f′)/(−(1/4+ρ²))` agrees to `2·10⁻¹²`; `(−1/2+iρ)(1/2+iρ) = −1/4 − ρ²` | holds | none |
| 5.3 decay identity | same `f`, `m = 1, 2`, `ρ = 0.7, 2.1` | `m = 1`, `ρ = 0.7`: `−0.0753088537 − 0.1054323952i` both sides; `m = 2`, `ρ = 2.1`: `−0.0583396634 + 0.0669471547i` both; all four agree to `2·10⁻¹²` | holds, with the conjugated kernel | none |
| 4.2 equation at `n = 0` in `t` | by hand | `(z²−1)∂_z² + 2z∂_z = ∂_t² + coth t ∂_t`; the term `(m²+n²−2mnz)/(z²−1)` is `m²/sinh² t` | as 5.3 states | none |

The rows for the untouched statements stand as in the previous review, of `e88a77c`.

- Source locators checked against the text: 0 (see Not verifiable).
- Library declarations opened at the pin: `ContRepresentation` in `Mathlib/RepresentationTheory/Continuous/Basic.lean` (docstring line 22).
- Cross-roadmap citations: the change adds none and removes none; the supplier list is as in the previous review.
- Dependency check: `depcheck: 171 roadmaps, 1989 edges, 0 problem(s)`; no UPWARD or CYCLE line. No file is changed outside the folder.
- Elaboration: `Suggested.lean` elaborates with 44 `declaration uses sorry` warnings and no error; the only import is Mathlib; no `set_option`, no sorried data.
- One-tactic probe on a copy (`rfl`, `simp`, `simp [boostMatrixElement]`) of the three changed theorems: none closes.
- Signatures: the elaborated types of the three changed theorems are `∀ τ, τ.re = -1/2 → ∀ (n t : ℝ), HasSum …` and `∀ (n : ℝ) (k : ℤ) (t : ℝ), ‖…‖ ≤ 1`, the README's generality.
- Pull-request text against this head: 44 theorems; 31 proved in the prior formalization (12 + 9 + 6 + 1 + 3), 3 more on the weights, 5 + 5 not proved there; import sentence and supplier list agree with the head. No correction.

Overlap check: read SpecialFunctionsGroupModels, SpecialFunctionsRankOneSymmetricSpaces, SpecialFunctionsMotionGroupsBessel, SpecialFunctionsAffineHeisenbergGroups, SpecialFunctionsHigherSpheres, SpecialFunctionsSU2MatrixElements, SpecialFunctionsLegendre (open), SpecialFunctionsAppell, SpecialFunctionsBessel, SpecialFunctionsHypergeometric (main), as scoped in the previous review; the change adds no object and moves no ownership. Shared objects and owners are unchanged: models, general matrix elements and Euler factorization are SpecialFunctionsGroupModels'; `P^μ_ν` is SpecialFunctionsLegendre's; the Jacobi-function identification is SpecialFunctionsRankOneSymmetricSpaces'; `𝔓^τ_{mn}` and the Mehler–Fock transform are owned here only.

Source independence: changed passages only; 0 passages compared with 0 sources, because none of VK, W, D, M could be read legally; largest share VK, 37 of 64 locators; contents not compared with VK's text (the change adds, removes and reorders no layer).

Research link: The targets are the `SU(1,1)` matrix-element identities and Mehler–Fock inversion of Vilenkin–Klimyk (1991), Wawrzyńczyk (1984), Dieudonné (1980) and Miller (1968); SpecialFunctionsRankOneSymmetricSpaces uses them for Jacobi-function harmonic analysis on rank-one symmetric spaces. Rests on the README's References and Downstream consumers, not on a source text.

## Not verifiable

- The attribution in the last bullet of 3.3 of the sum with the factor `i^k` to [VK, §6.7.1 (10), p. 333]: [VK] was found only behind a paywall in the previous review and was not fetched again; both sums are true whichever one is printed there.
- The other source locators of the sampled sections, and the README's list of misprints: as in the previous review, no cited text could be read.
- The new Checks of 2.1 quoted "to `10⁻²⁵`" and "to `10⁻²⁰`" were confirmed to double precision only (about `10⁻¹²`).

Automatic checks set aside as false positives: a section comment at the end of the Lean file was reported as having no declaration under it; it heads the `#check` pins of library declarations, which are its content and which the file rules allow.

## Source issues

- none

## For the human reviewers

- **Not tested.** [VK] carries 37 of the 64 locators; neither its text nor its table of contents could be read, and [W], [D], [M] could not be read either. Wording and arrangement were not compared with any source.
- **Licence.** The README ("Prior formalization") says the Lean names and statements are those of the author's public repository `bjbraams/lean-SFVK` (Apache-2.0), directory `SFVK/SU11/`; I did not open that repository.
- **Licence.** `Suggested.lean` contains 20 definitions copied verbatim from the `Suggested.lean` of SpecialFunctionsGroupModels, an open pull request by the same author.
