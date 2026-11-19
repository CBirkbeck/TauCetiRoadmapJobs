# Review of ModularIwasawaMainConjecturesPartII (pull request #2281 at a2bff3e)

**Verdict:** accepted

**Summary.** Accepted: the one remaining finding, the L-value beside the scalar `N(a) − η(σ_a)` in §§4.2–4.3, is repaired. The zeta element is now characterized by `L′(η⁻¹, 0)` in the roadmap's own convention, the removed Euler factors are `1 − η⁻¹(𝔭)`, and a cubic Check separates the two readings; its values were recomputed. There are no small corrections and no format notes. The regulator normalization of §4.2 and the corrections to printed statements of the sources are left to the human reviewers as before.

## Previous findings

- R01 — repaired: §4.2 reads "characterized by r(z(η)) = L′(η⁻¹, 0) in its character line, the units on which Gal(L/K) acts through η", with `z_p(η) = ∏(1 − η⁻¹(𝔭)) z(η)`; §4.3 has the cubic Check at `p = 7`.

## Verified sound

| Statement | Instances tried | Computed on one side | Computed on the other / wrong model | Result; change |
|---|---|---|---|---|
| §4.2 definition of `z(η)` and `z_p(η)` | `Σ_τ η⁻¹(τ)τ(u)` under `σ`; Euler factor of `L(χ, s)` at `s = 0`, `χ = η⁻¹`; quadratic `η` at `p = 13` | `σ` acts by `η(σ)`: the `η`-part, coefficients `O_p(η⁻¹)(1)`; factor `1 − η⁻¹(𝔭) = 1 − η(σ_𝔭)⁻¹` | JLK's `η(a) = η⁻¹(σ_a)` (JLK lines 104–110): their `L(η, s)` is this `L(η⁻¹, s)`; `p = 13`: `η⁻¹(𝔭) = η(𝔭) = 1`, `z_13 = 0` | Agree; none |
| §4.3 identity `e(η⁻¹) = (N(a) − η(σ_a)) z_p(η)` | supplier's Kronecker formula at `χ = η⁻¹`, squared norm | `Σ_τ η⁻¹(τ) log(τ(u)·conj τ(u)) = (N(a) − η(σ_a))·L′(η⁻¹, 0)` | `r(z(η)) = L′(η⁻¹, 0)`, Euler factor 1 at ramified `p`: same coordinate | Agree; none |
| §4.3 new cubic Check | `ℚ(i)`, `p = 7`, `a = (5)`, `ψ(3) = ω`; `ψ(i)`-triviality: `N(i) = 1` | `ψ(25) = ψ(4) = ω⁴ = ω`; `L′(ψ, 0) = 0.69922 − 0.19115i`; `L(ψχ_{−4}, 0) = 1 − 1.73205i`; product `0.36814 − 1.40225i` | `(25 − ω)·conj = 10.6019 + 35.4384i`; `(25 − ω)·L′(η, 0) = 8.1731 − 36.0761i` | True, and separates the two; none |
| §4.3 quadratic Check | `η` of conductor `(3)`, `a = (5)` | `(25 − 1)·R/3 = 8R` | `η = η⁻¹`, so unchanged in value | True; none |
| §2.5 route | functional equation `s ↔ 1 − s` for `L(η⁻¹, s)`, `η` of finite order | leading term at `0` of `L(η⁻¹, s)` pairs with `L(conj(η⁻¹), 1) = L(η, 1)` | previous text had `L(η̄, 1) = L(η⁻¹, 1)`, the value paired with `L(η, 0)` | New text right; none |

The rows for untouched statements stand as in the previous review, of `b9017b4`.

- Source locators checked against the text: 4 (JLK lines 104–110 on printed p. 3; JLK lines 726–733, Theorem 3.9, p. 17; BT lines 141–145, p. 3); each at the stated place and supporting the sentence that cites it.
- Seeded sample: §§2.5 and 4.3 fall in the changed passages; both were read against their locators and recomputed (rows above).
- Cross-roadmap citations resolved: NonordinaryCMSpecialValues §2.2 at its open head, Kronecker's formula `2 Σ χ(σ) log|σ(_az_f)| = (N(a) − χ(a)⁻¹)·L′_f(χ, 0)` in the ordinary absolute value, which the squared norm turns into the coordinate of §4.3.
- Numerical values: `L′(ψ, 0) = −(1/2)Σ ψ(a) log|1 − ζ_7^a|` and `L(ψχ_{−4}, 0) = −(1/28)Σ a·ψχ_{−4}(a)`, in floating point; all six printed values agree to the digits given.
- Dependency check output: `depcheck: 199 roadmaps, 2189 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks: all passed on this head. `Suggested.lean` elaborates with no output and exit code 0; it has no declaration (the diff does not touch it), so no signature comparison and no one-tactic probe applies, and its module docstring names each headline and the carrier it lacks.
- Pull request text: title and description read against the head; the change touches nothing they state. No file outside the folder is changed.

Overlap check: read KatoEulerSystems, NonordinaryCMSpecialValues, AutomorphicCongruences, ModularIwasawaMainConjectures, InertAnticyclotomicCMMainConjecture, EulerSystemsAndKolyvaginSystems, SelmerIwasawaCohomology, EulerSystemsCyclotomicMainConjecture as in the previous reviews (NonordinaryCMSpecialValues §2.2 again at this round); the change moves no ownership. Owners: zeta morphism and CM module structure, KatoEulerSystems; theta functions, standard elliptic units, zeta element, Kronecker formulas and reciprocity law, NonordinaryCMSpecialValues; formulation of Kato's conjecture, ModularIwasawaMainConjectures; units of every modulus, the module `z`, the character-wise and equivariant equalities and the CM descent, this roadmap. Nothing has two owners.

Source independence: changed passages only; 4 passages compared with 2 sources (JLK, BT), none shared; largest share Kato, 33 of about 98 locators; contents compared with Kato §15 in an earlier review: independent, and the change adds, removes or reorders no layer.

Research link: Layer 8 is Theorem 2.6 of Burungale–Tian (2025), resting on Kato (2004) §15, Johnson-Leung–Kings (2011) and Rubin (1991); Layer 5 supplies Castella–Grossi–Lee–Skinner (2022). Rests on the README's sources, read at BT lines 208–218 and CGLS lines 394–836.

## Not verifiable

- The proof of the Tamagawa number statement at `p = 2` (§4.2) goes through Itakura §3.1 by JLK line 432; no legal copy was found.
- The direction of the Galois action in Kronecker's formula (which of `χ`, `χ⁻¹` pairs with `L′(χ, 0)`) was taken from NonordinaryCMSpecialValues §2.2 and Kato (15.5.1) as cited there, not recomputed from theta values for a non-real character.

## Source issues

- none

## For the human reviewers

- JLK lines 394–397 state that the ordinary-norm regulator is needed for the 2-part; the README (§4.2, line 267) replaces it by the squared norm. The class-number computation supports the README; Itakura's proof at `p = 2` was not readable.
- The README corrects four printed statements of its sources (JLK (6), (17), Proposition 3.3(4); BT Theorem 2.1) and writes the L-values and Euler factors of §§4.2, 4.3, 4.6 in a character convention inverse to JLK's print. Each was recomputed on one example, not proved in general.
