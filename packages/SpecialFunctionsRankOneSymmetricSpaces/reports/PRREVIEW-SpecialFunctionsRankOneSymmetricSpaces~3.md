# Review of SpecialFunctionsRankOneSymmetricSpaces (pull request #2935 at 71569a2)

**Verdict:** needs changes

**Summary.** Changes are needed: two findings, both in text the last repair added, neither touching a statement of `Suggested.lean`. The new negative control of 2.5 says `G ≠ K P` for the identity map, which is false for every `n ≥ 2` (that clause was taken from the previous review, which was wrong there); and the new route to the surjectivity of the unitary extension in 1.2 rests, for part of the parameter range, on a Sturm–Liouville expansion theorem that no target, supplier or library declaration provides. Both findings of the previous review are repaired, and the new Abel-transform formulas, constants and numerical Checks all agree with my computations. There are one small correction and two format notes, none blocking; the unreadable book sources remain for the human reviewers.

## R01 (P2) — The negative control of 2.5 says `G ≠ K P` for the identity map, which is false for `n ≥ 2`

The third Check of 2.5 (README lines 708–710) says of `g ↦ J (gᵀ)⁻¹ J`, the identity on `G`: "its `P = {p | θ p = p⁻¹}` is the set of elements of order at most two, and `G ≠ K P`." A reader concludes that the identity fails the hypotheses of the symmetric-pair criterion; for `n ≥ 2` it satisfies all of them.

Take `J' = diag(1, −1, −1, 1, …, 1) ∈ K`. Then `J' a_t J' = a_{−t}`, so `(a_t J')² = a_t a_{−t} = 1` and `a_t = (a_t J') J'` with `a_t J' ∈ P`. For `g = k₁ a_t k₂` this gives `g = (k₁ J' k₂) · (J' k₂)⁻¹ (a_t J') (J' k₂)`, a product of an element of `K` and an involution: `G = K P`. The identity is a continuous involutive automorphism fixing `K`, so the criterion of SpecialFunctionsGroupModels §5.1 applies to it (this is `g⁻¹ ∈ K g K`; that section has the same remark for `SU(1,1)` among its Checks). Only for `n = 1` is `P = {1} ≠ G`. The clause comes from the previous review of this folder, whose sentence "`G ≠ K P`" was wrong; the rest of that finding (the first Check `θ(a_t) = a_{−t}` fails for the identity) stands.

Smallest change: end the Check with what does fail, for example "…is the identity on `G`, since `(gᵀ)⁻¹ = J g J`; so it sends `a_t` to `a_t`, not to `a_{−t}`, and is not the Cartan involution (for `n ≥ 2` it still satisfies the criterion, because `a_{−t} ∈ K a_t K`)."

## R02 (P2) — The surjectivity of the unitary extension of 1.2 outside `−1/2 ≤ ±β ≤ α` rests on an expansion theorem that nothing supplies

For the parameters the Paley–Wiener theorem and Euler's transformation do not reach (for example `−1 < α < −1/2`, or `β > max(α, 1/2)`), the route of 1.2 (lines 430–435) takes density of the range from "the completeness of the eigenfunction expansion of the Sturm–Liouville operator `L` on `(0, ∞)` (Weyl–Titchmarsh–Kodaira theory…)", and the guide to the build (lines 63–65) lists that theory among what Layers 0–1 depend on. It is not a target of this roadmap, no supplier section is cited for it, and it is absent from the *Needs* line of 1.2, the Dependencies of Layer 1 and the supplier contracts; the pinned Mathlib and Tau Ceti have no Sturm–Liouville expansion. So for those parameters the unitary extension, a stated headline, has a route whose main input an implementer cannot find.

Part of it has an owner on main: OperatorTheory/UnboundedOperators §4.8 states the scalar Sturm–Liouville expression `w⁻¹(−(pu′)′ + qu)` on an open interval, Weyl's limit-point/limit-circle alternative, the self-adjoint boundary conditions and the Friedrichs condition at a singular endpoint, and its Layer 1 the spectral theorem. Neither states the expansion itself (that the self-adjoint realization of `L` with the even boundary condition is diagonalized by `f ↦ f̃`, with spectral measure `(2π)⁻¹ |c(λ)|⁻² dλ`).

Smallest change: cite OperatorTheory/UnboundedOperators §4.8 and Layer 1 in the route, in the *Needs* line of 1.2, in the Dependencies of Layer 1 and in the supplier contracts, and state the one step they do not give as a bullet of 1.2 with its hypotheses (for real `α > −1`, `|β| ≤ α + 1`: the closure of `L` on smooth even compactly supported functions is self-adjoint in `L²(Δ dt)` and the Jacobi transform is its spectral representation). The supplier lists of the pull request's description then gain that roadmap.

## C01 — The boundary condition at `0` is needed for `α < 1`, not only for `α < 0`

The same sentence of 1.2 (line 432) says "for `α < 0` the even solutions fix the boundary condition at `0`". Near `0` the solutions of `Lu = μu` behave like `1` and `t^{−2α}` (`log t` at `α = 0`), and `t^{−2α}` is square-integrable for `Δ ~ t^{2α+1}` exactly when `α < 1`; so `0` is a limit-circle endpoint for `−1 < α < 1` and a boundary condition is needed on all of that range (OperatorTheory/UnboundedOperators §4.8 has the same classification, `0 ≤ ν < 1`, with `ν = |α|`). Write "for `α < 1`".

## N01 — "not read here" appears four times, and the Paley–Wiener theorem of 1.3 still has no theorem number

Lines 469, 511 and the two new References entries say the cited papers were "not read here". That is a remark about how the text was written, which a reader a year from now cannot use; "cited after Klimyk–Vilenkin, p. 234" says the same without it. The theorem numbers in Flensted-Jensen (1972) and Koornwinder (1975) would give the target its locator.

## N02 — At half-integer `α` the inverse of `𝒜_{α,−1/2}` in 1.3 contains `W⁰`

With `k = ⌈α + 1/2⌉` (line 504) and `α + 1/2` an integer, the formula reads `W^{k−α−1/2} = W⁰`, which the definition `Γ(a)⁻¹ ∫ …` does not cover. Say that `W⁰` is the identity there, as 4.2 does for even `m`.

## Previous findings

- R01 — repaired: "with the involution `θ(g) = (gᵀ)⁻¹`, which equals `J g J` on `G`", and the docstring of `isGelfandPair_lorentzGroup` agrees. The negative control added with the repair is R01 above.
- R02 — repaired: 1.3 now gives `𝒜_{α,−1/2}` as a Weyl fractional integral with its inverse, 4.2 inverts by `W^{1/2}` "without the Paley–Wiener theorem", and "neither of 1.3 and 4.2 uses the other". The rewritten surjectivity route of 1.2 is R02 above.
- C01 — repaired: the summary now reads "for real `α ≥ −1/2` and `α + β + 1 ≥ 0`", as 0.4 does.
- N01 — repaired: the *Needs* lines of 1.2 and 1.3 say which target needs which ("which does not use 1.2"; "not 1.2").
- N02 — partly repaired: both papers are in the References with volume, pages and DOI; the theorem numbers are still absent (N01 above).

## Verified sound

| Statement | Instances tried | Values on each side | Result |
|---|---|---|---|
| 1.2 Euler relation `φ^{(α,β)} = (cosh t)^{−2β} φ^{(α,−β)}` | `(0.3, 0.8)`, `λ = 1.1 + 0.3i`, `t = 0.9` | both `0.4476366246 − 0.0511691986i`; exponent `c − a − b = −β` | agrees |
| 1.2 `Δ` and `c` under `β ↦ −β` | symbolic | `(2 cosh t)^{2β+1−(−2β+1)} = (2 cosh t)^{4β}`; `2^{ρ−(α−β+1)} = 2^{2β}`, Gamma factors swap | agrees |
| 1.2 transport of the transform | symbolic | `(cosh t)^{−2β}(2 cosh t)^{4β} = 2^{2β}(2 cosh t)^{2β}`; both `L²` norms preserved (`2^{4β} · 2^{−4β}`) | agrees; range `α ≥ −β ≥ −1/2` |
| 1.2 remaining parameters | endpoint `0`: `1`, `t^{−2α}` against `t^{2α+1}` | limit-circle for `−1 < α < 1`; README says `α < 0`; no supplier for the expansion | R02, C01 |
| 1.3 limit `β → −1/2` of 0.4 | mass of `Γ(β+1/2)⁻¹ sin^{2β} ψ dψ` | `√π/Γ(β + 1) → 1`; constant `2Γ(α+1)/(√π Γ(α+1/2)) · 1/2` | agrees |
| 1.3 kernel at `β = −1/2` | `1 − r²` under `e^s = cosh t + r sinh t`; `α = 1.3`, `λ = 0.7 − 0.4i`, `t = 0.9` | `2e^s(cosh t − cosh s)/sinh² t`, powers of `e^s` cancel; both `0.7353220887 + 0.0370647013i` | agrees |
| 1.3 `𝒜_{α,−1/2}` and `K_α` | `C 2^{2α} Γ(α + 1/2)`; `f = e^{−t²}`, `λ = 0.6 + 0.2i` | `2^{3α+1/2} Γ(α+1)/√π`; `f̃` (ODE and quadrature) and Fourier of `𝒜f` both `11.4147843490 − 0.9143999970i` | agrees |
| 1.3 inverse of `𝒜_{α,−1/2}` | `W^{k−α−1/2} W^{α+1/2}`; `α + 1/2 ∈ ℕ` | `W^k`, `(−d/du)^k W^k = id`; `W⁰` undefined | agrees; N02 |
| 1.3 case `α = β` | `(1.3, 1.3)`, `λ = 0.7 − 0.4i`, `t = 0.9`; `s = 2s'` | `φ_λ^{(α,α)}(t) = φ_{λ/2}^{(α,−1/2)}(2t) = 0.3472760133 + 0.0180732376i`; support `[−2R, 2R] → [−R, R]` | agrees |
| 1.3 case `α = β = −1/2` | `Δ = 1` | `∫₀^∞ f cos λt dt = ∫_ℝ (f/2) e^{iλs} ds` | agrees |
| 1.3 and 4.2 agree | `ω_{n−1} 2^{1−n} K_{(m−1)/2}` | `2π^{(m+1)/2} · 2^{−m} · 2^{(3m−2)/2}/√π = (2π)^{m/2}` | agrees |
| 4.2 inversion for odd `m` | `W^{1/2} W^{m/2}`; `m = 1` closed form; `F(0.9)`, `R = 3/2` | `W^{(m+1)/2}`; `(2π)^{1/2}/Γ(1/2) = √2`; `0.9038267374` | agrees |
| 2.5 involution | `g ∈ G`; `a_t`; `k = diag(1, k')` | `(gᵀ)⁻¹ = J g J`; `J a_t J = a_{−t}`; `J k J = k` | repaired |
| 2.5 negative control | `J' = diag(1, −1, −1, 1, …)`; `n = 1` | `(a_t J')² = 1`, `a_t = (a_t J') J'`, so `G = K P`; `P = {1}` | R01 |

The rows for the statements the change does not touch stand as in the previous review, of `7ad98a7`.

- Source locators checked against a text: 0 this round (the changed passages cite Klimyk–Vilenkin pp. 233–234 and two papers, none readable); DLMF 15.8.1 as Euler's transformation was checked against SpecialFunctionsHypergeometric §5.1 on main, which states it so.
- Cross-roadmap citations resolved: SpecialFunctionsHypergeometric §5.1 (Euler and Pfaff, 15.8.1) and AutomorphicSpectralTheory §1.6 on main; SpecialFunctionsGroupModels §5.1 at its open head (the symmetric-pair criterion: involutive automorphism fixing `K`, `G = K P`, `P = {p | θ p = p⁻¹}`); OperatorTheory/UnboundedOperators §4.8 on main, opened for R02.
- Ownership: a search of the roadmaps on main and at the open heads for the Sturm–Liouville expansion found the endpoint theory in OperatorTheory/UnboundedOperators §4.8 and no owner of the expansion theorem.
- Dependency check: `depcheck: 158 roadmaps, 1825 edges, 0 problem(s)`; no UPWARD or CYCLE line. The roadmap is not yet in the merge order and is placed after its last supplier. No change outside the roadmap folder.
- Elaboration of `Suggested.lean`: no error, `sorry` the only warning (58), no `set_option`. The only change to the file is the docstring of `isGelfandPair_lorentzGroup`; no signature changed, so the elaborated types stand as compared in the previous review.
- Pull request text against the head: no sentence is contradicted; the change adds no supplier, section or declaration (repairing R02 would add one supplier).

Overlap check: read SpecialFunctionsGroupModels (open) and OperatorTheory/UnboundedOperators (main) for the changed passages; the lists of closest roadmaps are those of the previous review and the change adds no object. Symmetric-pair criterion: GroupModels §5.1. Sturm–Liouville endpoint theory: OperatorTheory/UnboundedOperators §4.8. The Abel transform `𝒜_{α,β}` of the Jacobi analysis: this roadmap.

Source independence: changed passages only; 0 passages compared with a source text, since none of the three sources the changed passages cite could be read; the new routes (Weyl fractional integrals, the limit `β → −1/2`) are derivations I recomputed; no layer added, removed or reordered, so the arrangement was not compared again; largest share Wawrzyńczyk, 27 of 79 source mentions, unread as before.

Research link: The Jacobi transform with inversion, Plancherel and Paley–Wiener is Koornwinder's theory (1984), cited by DLMF §15.9(ii); Layer 4 is the rank-one case of the Helgason–Fourier analysis on symmetric spaces (Heckman–Schlichtkrull 1994), a prerequisite of the Selberg trace formula for hyperbolic manifolds. Rests on the README's references and DLMF §15.9.

## Not verifiable

- Flensted-Jensen (1972) and Koornwinder (1975), now in the References: both DOIs resolve only to a paywalled publisher page, so the bibliographic data and the attribution of the factorization of `𝒜_{α,β}` for `α > β > −1/2` to Koornwinder (1975) were not checked against a text.
- Klimyk–Vilenkin pp. 233–234, cited in 1.2 for the form of (14) as an eigenfunction expansion: paywalled.
- As in the previous review, every locator into Vilenkin–Klimyk Vol. 2, Klimyk–Vilenkin, Wawrzyńczyk, Koornwinder (1984) and Heckman–Schlichtkrull.

Automatic checks set aside as false positives: the report of a section header in `Suggested.lean` with no declaration under it (the header carries the `#check` lines that pin the Mathlib names the README cites, which the form rules allow); the report that `SU11.boostMatrixElement_eq_jacobiFunction` is found nowhere (it is declared in `Suggested.lean` inside the namespace `SU11`).

## Source issues

- none

## For the human reviewers

- **Not tested.** Wawrzyńczyk, *Group Representations and Special Functions* (1984), has the largest share of the locators (27 of 79 mentions); neither its text nor its contents page could be read, so wording and arrangement were not compared with it.
- **Licence.** The README's section on prior formalization says the roadmap reuses the names and conventions of the author's own lean-SFVK (Apache-2.0, commit `2a512fe`); `Suggested.lean` appears adapted from it. I did not open that repository.
- **Licence.** The theorems of Layer 1 go back to Koornwinder (1984), Flensted-Jensen (1972) and Koornwinder (1975); the README says the last two were not read, and none of the three could be read here.
