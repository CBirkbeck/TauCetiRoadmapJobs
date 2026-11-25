# Review of DiracScatteringAndNonlinearFourierTransform (pull request #3099 at eccde19)

**Verdict:** accepted

**Summary.** A review of the change against `main`: 20 changed lines since `293502c`. I checked the wider-cone bullet and the new Check of §2.3, the aperture statement and route added to §2.4, the cone definitions of poltoratski2024 and mauth2022, the pinned Tau Ceti kernel comparison and maximal function, and the pull request's text against this head. The mathematics holds: `A² = max(2, 1 + 2α²)` dominates the true supremum `((α + √(α² + 4))/2)²` of the kernel ratio for every `α > 0`, the counterexample is correct, and the exceptional null set of §2.4 does not involve `α`. Accepted, with one small correction on wording and one question for the author; nothing is left for a human to decide.

## C01 — Limits through nested cones cannot disagree; what fails for a general function is existence

In the wider-cone bullet of §2.3 (line 514), "limits through cones of different apertures need not agree" suggests a function with one limit through one cone and another limit through a wider one. For `α < β` the cone `Γ^α_∞(x)` is contained in `Γ^β_∞(x)` and both accumulate at `x`, so a limit through the wider cone is the limit through the narrower one: two limits that exist always agree. What can fail is existence, and that is what the third Check exhibits (`u` has limit `0` through `Γ_∞(0)` and none through `Γ^2_∞(0)`).

A sentence that matches the Check: "For an arbitrary function, a limit through one cone need not persist through a wider one (third Check); for Poisson integrals the limits through all cones exist and agree almost everywhere (§2.4)."

## Questions for the author

- In §2.4 (line 578), "The sources fix `α = 1`" follows a citation list that includes garnett2007, Ch. I §§3–5. The two texts I could read do fix it: poltoratski2024 line 615–616 and mauth2022 line 411–412 define only the cone `|Re(z − x)| < Im z` (mauth2022 line 984–985 enlarges the height, not the aperture). Does garnett2007 also restrict to aperture `1`? My recollection is that its Ch. I §§4–5 treat cones `|x − t| < αy` for every `α > 0`, in which case the sentence should name the two papers only and garnett2007 would be a locator for the every-aperture statement. The book is recorded as uncertified, so I could not read it.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| §2.3 wider cones, `(s − x)² + y² ≤ A²((s − x′)² + y²)` for `|x′ − x| < αy` | `α = 0.1, 0.5, 1/√2, 1, 2, 5`; grid over `s`, `y = 1` | sup of ratio `1.105, 1.640, 2.000, 2.618, 5.828, 26.96` = `((α+√(α²+4))/2)²`; `A² = 2, 2, 2, 3, 9, 51` | holds; tight only at `α = 1/√2` | none |
| §2.3 derivation of `A²` | `a = |s − x′|`, `b = y` | `(a + αb)² + b² ≤ 2a² + (1 + 2α²)b²` by `2αab ≤ a² + α²b²`; `≤ max(2, 1 + 2α²)(a² + b²)` | holds | none |
| §2.3 `M^α_∞ P[g](x) ≤ A² · maximalFunction g x` | `g = 1_{[0,1]}`, `x = 2`, `α = 2` | sup of `P[g]` over `Γ^2_∞(2)` ≈ `0.399`; `M g(2) = 1/4`; bound `9/4`; `0.399 > 1/4`, so some factor is needed | holds | none |
| Pinned comparison with general `A` | `TauCeti.halfSpacePoissonKernel_le_mul`, `n = 2`, poles of equal height | hypothesis `‖y − x₁‖ ≤ A‖y − x‖` for any `A` (positivity derived); factor `1 · A²` | matches the bullet | none |
| §2.3 third Check, `u = max(0, |Re z|/Im z − 1)` | points `t(3/2 + i)`, `it`, `Γ_∞(0)` | `|Re|/Im = 3/2 < 2`, `u = 1/2` for all `t`; `u(it) = 0`; `u ≡ 0` where `|Re z| < Im z`; `1 + 2·4 = 9` | holds | none |
| §2.3 "need not agree" | nested cones `Γ^1 ⊂ Γ^2` | two existing limits coincide; the Check shows non-existence, not disagreement | wording | C01 |
| §2.4 limit through `Γ^α_∞(x)`, every `α`, one null set | `h = 1_{[0,1]}`, `x = 1/2`, `Re z = 1/2 ± 4.9y` (`α = 5`) | `P[h] = 0.4997, 0.9871, 0.99873, 0.99987` at `y = 0.1, 0.01, 0.001, 0.0001` → `h(1/2) = 1` | holds | none |
| §2.4 singular measure | `ν = δ₀`, `w = 0` | `x ≠ 0`: `P[δ₀](z) = y/(π|z|²) → 0` through every cone; `x = 0`: `1/(πy) → ∞`, one point | holds | none |
| §2.4 route, null set independent of `α` | `μ = |w − w(x)| ds + ν_s` at a point with `μ(B(x, r))/2r → 0` | near part `≤ A² sup_r μ(B(x,r) ∩ B(x,δ))/2r`; far part `≤ A² y C_δ ∫ dμ/(1 + s²) → 0`; the point set has no `α` | holds | none |
| §2.4 "The sources fix `α = 1`" | poltoratski2024 line 615–616; mauth2022 line 411–412, 984–985 | both define `|Re(z − x)| < Im z` only; neither text contains "aperture"; garnett2007 unread | holds for the two read | question |

- Source locators checked against the text: 3 (poltoratski2024 line 615–622; mauth2022 line 411–420; mauth2022 Lemmas 4 and 7, line 404–436). None of the 15 seeded targets lies in §2.3 or §2.4; the seeded §2.5 uses only the aperture-1 limit, which the change does not alter. The README marks no locator as unverified.
- Library declarations opened at the pin: 2 (Tau Ceti `TauCeti.halfSpacePoissonKernel_le_mul`, `Analysis/PDE/GreenFunction/HalfSpace.lean` line 198; `TauCeti.maximalFunction`, `MeasureTheory/Integral/MaximalFunction.lean` line 125, centred balls). No file of the pinned Mathlib or Tau Ceti mentions nontangential limits or apertures.
- Cross-roadmap citations: no roadmap on main or at an open head cites §2.3 or §2.4 of this roadmap (the only citations found are of §2.7); within the README no other passage refers to apertures, and `Suggested.lean` has no cone.
- Record: no layer, heading or item removed or retitled; the replaced bullet keeps its comparison and its constant, and its limit statement stands in §2.4 with the hypotheses that make it true.
- Automatic checks: all passed at this head. Dependency check: `depcheck: 124 roadmaps, 1404 edges, 0 problem(s)`. Nothing changed outside the folder.
- Elaboration: `lake env lean` on `Suggested.lean` gives 9 `sorry` warnings and nothing else; the file is not changed by this pull request, so its signatures are those accepted on main.
- Earlier review: it raised no finding, so there was none to repair; its small correction and its question are not addressed at this (identical) head and are repeated above.
- Pull request text: title and description agree with the head (the versions v14 and v1 named are those the manifest records).

Overlap check: read PDE (main and open), ToeplitzOperators, ComplexHessianEquations, SchattenClassesAndSchurMultipliers, NevanlinnaPickInterpolation, OptimalControlAndHamiltonJacobi, HardyHilbertAndCarlemanInequalities, and StochasticCalculus S6.5 found by object search (a disc nontangential estimate with its own aperture); nothing shared: half-plane cones `Γ^α_h(x)` and Fatou's theorem through them are owned here.

Source independence: 3 passages compared with 2 sources (the wider-cone bullet, the aperture Check and the §2.4 addition against poltoratski2024 line 608–622 and mauth2022 line 404–436), changed passages only, none shared; arrangement not compared, since no layer is added, removed or reordered; garnett2007 not read.

Research link: the README's goal is almost-everywhere convergence of the SU(1,1) non-linear Fourier transform (Poltoratski 2024; Mauth 2022); §2.4's Fatou theorem supplies the boundary values used in §§2.5, 5.3 and 6.5 on the way there. Rests on the README Summary and mauth2022 line 404–436.

## Not verifiable

- garnett2007, Ch. I §§3–5 (uncertified, text not held): whether it restricts to aperture `1`, as "The sources fix `α = 1`" says; asked above.

## Source issues

- none

## For the human reviewers

- none
