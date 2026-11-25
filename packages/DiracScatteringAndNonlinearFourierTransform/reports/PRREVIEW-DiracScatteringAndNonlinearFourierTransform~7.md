# Review of DiracScatteringAndNonlinearFourierTransform (pull request #3099 at 48477d5)

**Verdict:** accepted

**Summary.** An incremental re-review of the 6 lines changed since `eccde19`: the last sentence of the wider-cone bullet of §2.3 and the sentence of §2.4 that says which sources fix the aperture. Both are now true as written: the §2.3 sentence says what the third Check exhibits (a limit through `Γ_∞(0)` that does not persist through `Γ^2_∞(0)`), and §2.4 attributes aperture `1` only to mauth2022 and poltoratski2024, whose cone definitions I read. Accepted, with no finding, no small correction and no format note; nothing is left for a human to decide.

## Previous findings

- The previous review, of `eccde19`, raised no finding (no R01).
- C01 of that review — repaired: "For an arbitrary function, a limit through one cone need not persist through a wider one (third Check); for Poisson integrals the limits through all cones exist and agree almost everywhere (§2.4)."
- Its question on garnett2007 — settled by the text: "mauth2022 and poltoratski2024 fix `α = 1`"; garnett2007 is no longer said to restrict the aperture.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| §2.3 "a limit through one cone need not persist through a wider one" (third Check) | `u = max(0, |Re z|/Im z − 1)` at `t(3/2 + i)`, `it`, `t(0.99 + i)`, `t(1.99 + i)`, `t = 1, 10⁻³, 10⁻⁶` | `u = 1/2, 0, 0, 0.99` for every `t`; `u ≡ 0` on `Γ_∞(0)`; two values `0` and `1/2` in `Γ^2_∞(0)` near `0` | holds: limit `0` through `Γ_∞(0)`, none through `Γ^2_∞(0)` | none |
| §2.3 nested cones | `α < β` | `Γ^α_∞(x) ⊂ Γ^β_∞(x)`, so a limit through the wider cone is the limit through the narrower; only persistence can fail | the new sentence is consistent with this | none |
| §2.3/§2.4 "for Poisson integrals the limits through all cones exist and agree a.e." | `h = 1_{[0,1]}`, `x = 1/2`, `Re z = 1/2 ± 0.999αy`, `α = 1, 5, 20`, `y = 10⁻², 10⁻⁴, 10⁻⁶` | `α = 1`: `0.98726, 0.99987, 1.0`; `α = 5`: `0.98714, 0.99987, 1.0`; `α = 20`: `0.98485, 0.99987, 1.0`; target `h(1/2) = 1` | holds | none |
| §2.4 singular part through every cone | `ν = δ₀`, `x ≠ 0` and `x = 0` | `P[δ₀](z) = y/(π|z|²) → 0` at `x ≠ 0` for every `α`; `1/(πy) → ∞` at the single point `0` | holds | none |
| §2.4 "mauth2022 and poltoratski2024 fix `α = 1`" | poltoratski2024 line 615–616; mauth2022 line 411–412 | both define the sector by `|Re(z − x)| < Im z` (poltoratski2024 with height `1`); no other aperture appears in either text | holds | none |

The rows for untouched statements stand as in the previous review, of `eccde19`.

- Source locators checked against the text: 2 (poltoratski2024 line 615–622; mauth2022 line 411–420). None of the 15 seeded targets lies in §2.3 or §2.4, and no changed passage is cited by one; the README marks no locator as unverified.
- Library declarations: none is named or changed by the diff; the Mathlib and Tau Ceti names of §§2.3–2.4 are untouched and stand as checked at `eccde19`.
- Cross-roadmap citations: the diff adds none; the two internal references of the changed sentences (the third Check of §2.3, and §2.4) exist and say what is attributed to them.
- Record: no layer, heading or item removed, retitled or added (9 layers at the merge base and at the head); `Suggested.lean` is unchanged.
- Automatic checks: all passed at this head. Dependency check: `depcheck: 124 roadmaps, 1404 edges, 0 problem(s)`. Nothing changed outside the folder.
- Elaboration: `lake env lean` on `Suggested.lean` gives 9 `sorry` warnings and nothing else.
- Pull request text: the title and description agree with the head; the description's sentence on the sources names poltoratski2024 and mauth2022, as §2.4 now does.

Overlap check: read PDE (main and open), ToeplitzOperators, ComplexHessianEquations, SchattenClassesAndSchurMultipliers, NevanlinnaPickInterpolation, OptimalControlAndHamiltonJacobi, HardyHilbertAndCarlemanInequalities as in the previous review (no closest-roadmap list changed, and the diff introduces no object); nothing shared.

Source independence: 2 passages compared with 2 sources (the two changed sentences against poltoratski2024 line 608–622 and mauth2022 line 404–436), changed passages only, none shared; arrangement not compared, since no layer is added, removed or reordered; garnett2007 not read.

Research link: the README's goal is almost-everywhere convergence of the SU(1,1) non-linear Fourier transform (Poltoratski 2024; Mauth 2022); §2.4's Fatou theorem supplies the boundary values used in §§2.5, 5.3 and 6.5 on the way there. Rests on the README Summary and mauth2022 line 404–436.

## Not verifiable

- garnett2007, Ch. I §§3–5 (uncertified, text not held): its locators in §§2.3–2.4 were not read; the changed text no longer asserts anything about its aperture.

## Source issues

- none

## For the human reviewers

- none
