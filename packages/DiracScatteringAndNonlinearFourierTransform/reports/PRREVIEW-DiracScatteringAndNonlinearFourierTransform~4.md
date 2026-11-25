# Review of DiracScatteringAndNonlinearFourierTransform (pull request #3099 at eccde19)

**Verdict:** accepted

**Summary.** A review of the change against `main`: 20 changed lines since `293502c`. I checked the new wider-cone bullet of §2.3, the new Check in §2.3, the aperture statement added to §2.4 with its route, the cited cone definitions in poltoratski2024 and mauth2022, the pinned kernel comparison and maximal function in Tau Ceti, and the pull request's title and description against this head. The mathematics holds: the constant `A² = max(2, 1 + 2α²)` bounds the true supremum `((α + √(α² + 4))/2)²` for every `α > 0`, the counterexample is correct, and the almost-everywhere statement follows from the route, whose null set does not depend on `α`. Accepted, with one small correction on wording and one question for the author; nothing is left for the human reviewers to decide.

## C01 — Two limits through nested cones cannot disagree, so "need not agree" points at the wrong failure

In the wider-cone bullet of §2.3 (line 514), "limits through cones of different apertures need not agree" can be read as saying that a function can have one limit through one cone and a different limit through another. That cannot happen. For `α < β` the cone `Γ^α_∞(x)` lies inside `Γ^β_∞(x)` and both accumulate at `x`, so a limit through the wider cone is also the limit through the narrower one. What can fail is existence, and that is what the third Check shows: `u` has limit `0` through `Γ_∞(0)` and no limit through `Γ^2_∞(0)`.

A wording that would match the Check: "For an arbitrary function, a limit through one cone need not give a limit through a wider one (third Check)".

## Questions for the author

- In §2.4, line 578, the sentence "The sources fix `α = 1`" follows a citation list that includes garnett2007, Ch. I §§3–5. poltoratski2024 (line 615–616) and mauth2022 (line 411–412) use only the cone `|Re(z − x)| < Im z`, as the description says. Does garnett2007 also use only aperture `1`? If it defines nontangential convergence through cones of every aperture, "poltoratski2024 and mauth2022 fix `α = 1`" would be the accurate sentence. That text is recorded as uncertified, so I could not read it.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| §2.3 wider cones: `(s − x)² + y² ≤ A²((s − x′)² + y²)` for `|x′ − x| < αy` | `α = 0.1, 1/√2, 1, 2`; scan `α ∈ (0, 4]` | true supremum `((α+√(α²+4))/2)²` = `1.105, 2, 2.618, 5.828` against `A² = 2, 2, 3, 9`; largest ratio over the scan `0.9999` (tight at `α = 1/√2`, not attained) | holds | none |
| §2.3 algebra of the bound | `a = |s − x′|`, `b = y` | `(a + αb)² + b² ≤ 2a² + (1 + 2α²)b² ≤ max(2, 1 + 2α²)(a² + b²)` via `2αab ≤ a² + α²b²` | holds | none |
| §2.3 `M^α_∞ P[g] ≤ A² · maximalFunction` | `g = 1_{[0,1]}`, `x = 2`, `α = 2` and `α = 1` | `M g(2) = 1/4` (radius 2); sup over `Γ^2_∞(2)` ≈ `0.400 ≤ 9/4`; over `Γ_∞(2)` ≈ `0.250 ≤ 3/4`; `0.400 > 1/4`, so a factor is needed | holds | none |
| Pinned comparison used with general `A` | Tau Ceti `halfSpacePoissonKernel_le_mul`, `n = 2`, poles `x′ + iy`, `x + iy` | hypothesis `‖y − x₁‖ ≤ A‖y − x‖`, conclusion with height ratio `1` and `A² = max(2, 1 + 2α²)`; holds for any `A > 0` | holds | none |
| §2.3 third Check, `u = max(0, |Re z|/Im z − 1)` | `t = 1, 0.1, 0.001`; points `it` | `u(t(3/2 + i)) = 0.5, 0.5, 0.5`; `|Re|/Im = 3/2 < 2`, so in `Γ^2_∞(0)`; `u(it) = 0`; `u ≡ 0` on `Γ_∞(0)`; `1 + 2·4 = 9` | holds | none |
| §2.3 "need not agree" | nested cones `Γ^1 ⊂ Γ^2` | two limits that both exist must coincide; Check shows existence through `Γ^1` only | misleading wording | C01 |
| §2.4 limits through `Γ^α_∞(x)` for every `α`, off one null set | `h = 1_{[0,1]}`, `x = 1/2`, `Re z = 1/2 ± 1.98y` | `P[h] = 0.853, 0.9872, 0.99873` at `y = 0.1, 0.01, 0.001`, tending to `h(1/2) = 1` | holds | none |
| §2.4 degenerate measure | `ν = δ₀`, `w = 0` | at `x ≠ 0`: `y/(π|z|²) → 0 = w(x)` for every `α`; at `x = 0`: `1/(πy) → ∞`, a null set | holds | none |
| §2.4 route, null set independent of `α` | Lebesgue points of `w` with `ν_s(B(x, r))/2r → 0` | near part `≤ A²·sup_{r<δ} μ(B(x,r))/2r` with `μ = |w − w(x)|dx + ν_s`; far part `≤ y·C_δ/(1 + s²) → 0`; the set does not mention `α` | holds | none |
| §2.4 "The sources fix `α = 1`" | poltoratski2024 line 615–616; mauth2022 line 411–412 | both define only `|Re(z − x)| < Im z` (with `Im z < 1` in poltoratski2024); neither uses the word "aperture"; garnett2007 unread | holds for the two read | question |

- Source locators: 3 checked against the cached texts (poltoratski2024 line 615–622; mauth2022 line 411–420 and Lemmas 4 and 7, line 404–436). None of the 15 seeded targets lies in §2.3, §2.4 or in text the change affects; the README marks no locator as unverified.
- Library: 2 declarations opened at the pin: Tau Ceti `TauCeti.halfSpacePoissonKernel_le_mul` (`Analysis/PDE/GreenFunction/HalfSpace.lean` line 198) and `TauCeti.maximalFunction`, centred balls (`MeasureTheory/Integral/MaximalFunction.lean` line 125). No pinned Mathlib or Tau Ceti file mentions nontangential limits.
- Cross-roadmap citations: no roadmap on main or in an open pull request cites §2.3, §2.4 or an aperture statement of this roadmap; no other passage of this README mentions apertures, and `Suggested.lean` has no cone.
- Automatic checks: the gate run at this head reports every count `0`, `OK`. Dependency check output: `depcheck: 124 roadmaps, 1404 edges, 0 problem(s)`. Nothing changed outside the folder.
- Lean: `lake env lean` on `Suggested.lean` gives 9 `sorry` warnings and nothing else. The file is unchanged by this pull request, so the elaborated signatures accepted on main stand.
- Record and earlier review: the previous review raised no findings, so none needed repair; no layer, item or heading removed or retitled. The replaced bullet "Aperture independence" keeps its comparison (now derived) and moves its limit statement to §2.4 in the corrected form.

Overlap check: read PDE (main and open), ToeplitzOperators, ComplexHessianEquations, SchattenClassesAndSchurMultipliers, NevanlinnaPickInterpolation, HardyHilbertAndCarlemanInequalities, OptimalControlAndHamiltonJacobi, plus StochasticCalculus S6.5 found by object search (disc nontangential estimate, already separated in this roadmap's Scope). Nothing shared with the changed text: half-plane cones of aperture `α` and Fatou's theorem through them are owned here.

Source independence: 3 changed passages compared with 2 sources (the wider-cone bullet, the aperture Check, the §2.4 addition, against poltoratski2024 line 615–622 and mauth2022 line 404–436), changed passages only, none shared; the arrangement was not compared because no layer was added, removed or reordered.

Research link: the README's purpose is the pointwise convergence theorem for the SU(1,1) non-linear Fourier transform of Poltoratski (poltoratski2024, Ann. of Math. 2024) and Mauth (mauth2022). §2.4's Fatou theorem feeds the boundary values of §2.5, §5.3 and §6.5 that those proofs use; README Summary and mauth2022 line 404–436.

## Not verifiable

- garnett2007, Ch. I §§3–5 (uncertified), cited in §2.4 beside "The sources fix `α = 1`": not read, so whether it fixes the aperture is the question above.

## Source issues

- none

## For the human reviewers

- none
