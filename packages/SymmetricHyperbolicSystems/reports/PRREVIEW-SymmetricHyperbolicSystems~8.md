# Review of SymmetricHyperbolicSystems (pull request #2246 at c65921f)

**Verdict:** accepted

**Summary.** Accepted: the one change since the previous review parenthesizes the initial energy in the Lean energy estimate `integral_dotProduct_A0_le`, and it is correct and needed, since without the parentheses the `x`-integral absorbed the source term and the right-hand side was `0` whenever `F ≠ 0`. The Lean statement now says what §2.3 of the README says. There are no findings, no small corrections and no format notes. For the human reviewers: the texts of John 1982, Lax 2006, Friedrichs 1954 and Rudin 1976 could not be read, so their page and equation locators, and the arrangement against John, remain untested.

## Previous findings

The previous review, of `5594d86`, had no finding (R), no small correction and no format note; there is nothing to carry.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §2.3 `integral_dotProduct_A0_le` at this head | `n = N = 1`, `A⁰ = 1`, `A¹ = B = 0` (`K = 0`, `κ = 0`, `λ = 1`), `u = tχ(x)`, `F = χ`, `t > 0` | left `t²∫χ²`; right `eᵗ(0 + t∫χ²)`; holds since `eᵗ ≥ t` | true | none |
| Same, general | `E(t) = ∫⟪A⁰u,u⟫` | `E′ ≤ ((κ+1)/λ)E + ‖F‖²`; Gronwall: `E(t) ≤ e^{ct}E(0) + ∫₀ᵗ e^{c(t−s)}‖F‖² ≤ e^{ct}(E(0) + ∫₀ᵗ‖F‖²)`, `c = (κ+1)/λ ≥ 0` | true; equals the README display | none |
| Same, degenerate | `t = 0`; `T < 0`; `F = 0`, `u = χ` | `E(0) ≤ E(0) + 0`; `Icc 0 T` empty, vacuous; `∫χ² ≤ eᵗ∫χ²` | true | none |
| Same statement as it stood at `5594d86` (unparenthesized) | same `u = tχ`, `F = χ` | parsed as `∫ x, (⟪A⁰u₀,u₀⟫ + c)`, `c = t∫χ² ≠ 0`: integrand not integrable, integral `0`; claim `t²∫χ² ≤ 0` | false; the change repairs it | none |
| §2.3 `integral_dotProduct_A0_sub_eq` (same notation, unchanged) | precedence of `∫ x, _` against `-` and `=` | first integral parenthesized; second ends at `=` (body parsed at level 60 > 50) | reads as the README display | none |

The rows for the untouched statements stand as in the previous review, of `5594d86`.

- Parse probe, elaborated at the pin: `(∫ x, f x + c) = ∫ x, (f x + c)` holds by `rfl` on `EuclideanSpace ℝ (Fin 1)`, and `∫ _x, (0 + 1) = 0` there; so the old form was the absorbed one and the parentheses are not cosmetic.
- Source locators checked against the text: 0 in this round; the change adds no locator, and the texts §2.3 cites could not be read (below).
- Library declarations opened at the pins: none new; the change names no library declaration. Pins as the description states: Mathlib `1b1ccf4`, Tau Ceti `2fd255d`.
- Cross-roadmap citations: none added or changed; none is a supplier.
- Automatic checks: all passed on this head when rerun. `lake env lean` on `Suggested.lean`: 0 errors, 14 `sorry` warnings, nothing else. The changed statement does not close by one tactic (it is the Gronwall estimate above).
- Dependency check: `depcheck: 94 roadmaps, 1055 edges, 0 problem(s)`; no UPWARD or CYCLE line. Nothing changed outside the folder.
- The pull request's title and description agree with this head; the change alters nothing they describe.
- Overlap check: read CompressibleEulerEquations, LaxEquivalenceAndFiniteDifferenceSchemes, HamiltonJacobiAndConservationLaws, PDE (main and its open revision), HankelFormsAndRealMomentProblems and OneStepMethodsForODEs; nothing shared. LaxEquivalenceAndFiniteDifferenceSchemes works on periodic grids `ℤ/N` with fixed coefficients and lists Friedrichs' scheme for variable-coefficient symmetric hyperbolic systems as not treated. No other open pull request changes this roadmap, and none drops an id it cites.
- Source independence: changed passages only; 1 changed passage (a pair of parentheses in a Lean formula, no prose) compared with 0 sources, nothing to share; largest share John 1982, 12 of 25 citations in the layers; no layer added, removed or reordered, so contents not compared again (John's table of contents could not be read).
- Research link: the linear theory of Friedrichs (1954) with the difference scheme of Courant–Friedrichs–Lewy (1928) and Lax; §1.2, §2.1–§2.3 and §7.3 are the linear inputs of the quasilinear theory (Kato, Majda) and are consumed by the open roadmap CompressibleEulerEquations. Rests on the README's references and that roadmap's text.

## Not verifiable

- John 1982, (3.9)–(3.12a), p. 165, Lax 2006, Theorem 4.3, pp. 41–42 and p. 45, and Friedrichs 1954, §7 Theorem 7, p. 361 (the locators of the energy estimate of §2.3, whose Lean statement changed): paywalled or no legal copy among the sources held for this roadmap.
- The remaining locators into these texts and into Rudin 1976, including those of the seeded sample outside the changed passage, are as in the previous reviews: not checked against a text in any round.

## Source issues

- none

## For the human reviewers

- **Not tested.** John 1982 has the largest share of the README's citations (12 of 25 in the layers); its text and table of contents could not be read, so wording and arrangement were not compared with it.
- **Not tested.** The page, theorem and equation locators into John 1982, Lax 2006, Friedrichs 1954 and Rudin 1976 were not checked against a text in any round.
