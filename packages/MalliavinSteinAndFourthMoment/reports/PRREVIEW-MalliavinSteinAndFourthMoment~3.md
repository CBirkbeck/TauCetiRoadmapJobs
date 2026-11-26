# Review of MalliavinSteinAndFourthMoment (pull request #3054 at 5dbb37b)

**Verdict:** accepted

**Summary.** Accepted: this is an incremental re-review of the 76 lines changed since `8d6453a`, and the changes repair both small corrections, both format notes and the question of the previous review without introducing a new problem. The Hermite expansion now has its owner in the pinned Tau Ceti with the right normalization, the route of §5.2 bounds each term by a bounded factor times a contraction of order between 1 and q − 1, and the positive semidefiniteness of the fractional Gaussian noise covariance is argued separately at H = 1. There are no findings, no small corrections and no format notes. The locators into the four monographs still cannot be checked here, which is left to the human reviewers.

## Previous findings

The previous review, of `8d6453a`, had no finding; its other remarks are accounted for here.

- C01 — repaired: Conventions, the *Needs:* line of §6.1 and "From Tau Ceti" now name `TauCeti.hasSum_gaussianHermite_expansion`, "so a_q is that coordinate divided by √(q!)"; the declaration is pinned by a `#check`.
- C02 — repaired: §5.2 now reads "the first factor is at most ‖f_(i,n)‖², which is bounded, and the second has order q − r between 1 and q − 1 (q − r ≥ q − p ≥ 1 when p < q)".
- N01 — repaired: "the other targets of this README are of the same standing", in the README and in the module docstring of `Suggested.lean`.
- N02 — repaired: "*Needs:* §§2.2, 4.2, 6.1; Young's inequality on ℤ (the prose target above)", which is what the route of §6.2 quotes.
- Question on §6.3 at H = 1 — answered in the text: "for H < 1 by the representation |t|²ᴴ = c_H⁻¹ ∫₀^∞ (1 − e^(−u²t²)) u^(−1−2H) du … and for H = 1 because r₁(t, s) = ts".

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Conventions and §6.1: a_q against the coordinates of the pinned Hermite basis | f = He₂; general f | coordinate ∫He₂²/√2 dγ = 2/√2 = √2; a₂ = (1/2!)·2 = 1 = √2/√2; ∑ c_q He_q/√(q!) = ∑ a_q He_q | holds; previous C01 repaired | none |
| §5.2 route: orders of the two factors (§5.1 with §4.1) | (p,q) = (2,3), (2,2), (1,3), (1,1) | (2,3): r = 1, 2 gives orders (1,2), (0,1); (2,2): r = 1, (1,1); (1,3): r = 1, (0,2); (1,1): empty sum, DF deterministic, variance 0 | second order always in {1, …, q − 1}, first factor ≤ ‖f‖²; previous C02 repaired | none |
| §5.2 route: components with C(j, j) = 0 | ‖f ⊗ₛ f‖ ≤ ‖f‖² | qⱼ! ‖f_(j,n)‖² = E F_(j,n)² → 0, so the second factor → 0 without §4.4 | holds | none |
| §6.2 *Needs:* line against its route | q = 2 | route uses §2.2 (bound 4 √Var(‖DF‖²/2) at unit variance) and §4.2 (Var = 8 ‖fₙ ⊗₁ fₙ‖²); §4.3 not quoted | line now matches the route; previous N02 repaired | none |
| §6.3 route: representation of \|t\|²ᴴ and positive semidefiniteness | H = 1/2; H → 1; H = 1; kernel under the integral | substitution v = u\|t\| gives \|t\|²ᴴ ∫(1 − e^(−v²)) v^(−1−2H) dv; at H = 1/2 the constant is √π; integrand ~ v^(1−2H) at 0, integrable iff H < 1; r₁(t,s) = (t² + s² − (t−s)²)/2 = ts | holds: 1 − a(t) − a(s) + a(t)a(s)e^(2u²ts) = (1−a(t))(1−a(s)) + a(t)a(s)(e^(2u²ts) − 1), both positive semidefinite, with a(t) = e^(−u²t²) | none |
| `Suggested.lean`: new import and two `#check` lines | elaboration | `TauCeti.hasSum_gaussianHermite_expansion` (`TauCeti/Probability/Distributions/Gaussian/Hermite/Parseval.lean`, line 77) and `TauCeti.gaussianHermiteHilbertBasis` resolve; coefficient is ∫ (He_n/√(n!)) f dγ | holds | none |

The rows for the untouched statements stand as in the previous review, of `8d6453a`; the diff changes no Lean statement.

- Source locators checked against the text: none new is checkable (the changed locator, Nourdin–Peccati, proof of Proposition D.1.3, p. 216, is in an unreadable book); Nourdin2012Lectures lines 293–298 reread for the source issue below.
- Library declarations opened at the pin: `TauCeti.hasSum_gaussianHermite_expansion` and `TauCeti.gaussianHermiteHilbertBasis_repr_apply` (`TauCeti/Probability/Distributions/Gaussian/Hermite/Parseval.lean`, lines 77 and 48).
- Cross-roadmap citations resolved: the four links the diff adds (MathematicalStatisticsHigherOrderAndResampling, ArithmeticStatisticsPartVIII, RandomMatrices, PoissonApproximation) all point at roadmaps on main; the §§ cited are unchanged.
- Elaboration: `lake env lean TauCetiRoadmap/MalliavinSteinAndFourthMoment/Suggested.lean` exits with 38 `sorry` warnings, no error and no other warning.
- Dependency check: `depcheck: 101 roadmaps, 1129 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the roadmap folder.
- The pull request's title and description were read against this head: the Tau Ceti suppliers and the import list include the Hermite expansion and its module, and nothing in them is contradicted.
- The worker's automatic checks: one form check hit, set aside below; the targeted build passed.

Overlap check: read WienerChaosAndMalliavinCalculus, SteinsMethodForNormalApproximation, OrnsteinUhlenbeckSemigroup, MathematicalStatisticsHigherOrderAndResampling, YoungIntegrationAndRoughPaths, PoissonApproximation (scopes as in the previous review; the diff changes no ownership); nothing shared. The one object the change newly names, the Hermite expansion in L²(γ), is owned by the pinned Tau Ceti and cited, not restated.

Source independence: changed passages only; 4 passages compared (the Hermite convention, the routes of §5.2 and §6.3, the *Needs:* lines) with 1 open text (Nourdin2012Lectures), none shared beyond formulas; largest share Nourdin–Peccati 2012, 59 of 91 locators, whose text and contents page could not be read; the diff adds, removes or reorders no layer, so the arrangement was not compared again.

Research link: The headline targets are the fourth moment theorem of Nualart–Peccati (2005), its total-variation rates by Nourdin–Peccati (2009), the Peccati–Tudor theorem (2005), the Breuer–Major theorem (1983) and the second-order Poincaré inequalities of Chatterjee (2009) and Nourdin–Peccati–Reinert (2009); rests on the README's references and on those open texts as read.

## Not verifiable

- Nourdin–Peccati 2012 (Cambridge University Press): no legal copy; the changed locator "proof of Proposition D.1.3, p. 216", including that the proof treats H = 1 by r₁(t, s) = ts, is unchecked (the mathematics was recomputed instead), as is every other locator into the book.
- Nualart–Nualart 2018, Nualart2006, ChenGoldsteinShao2011, BreuerMajor1983 and PeccatiTudor2005: not readable legally here; their locators stay unchecked, as in the previous review.

Automatic checks set aside as false positives: the report of a section comment in `Suggested.lean` with no declaration under it; the comment heads the `#check` lines that pin library declarations, which is what such lines are for.

## Source issues

- **Misprint** in Nourdin2012Lectures at Theorem 1.3, assertion (2), printed page 6: the source says the fourth moments converge "in law" to 3σ⁴; it should be plain convergence of real numbers; affects nothing.

## For the human reviewers

- **Not tested.** Nourdin–Peccati 2012 carries 59 of the README's 91 source locators and could not be read (no legal copy); wording and arrangement were compared only with open texts by the same authors. Nualart–Nualart 2018, Nualart2006 and ChenGoldsteinShao2011 were not read either.
- **Licence.** Twenty-five definitions of `TauCetiRoadmap/MalliavinSteinAndFourthMoment/Suggested.lean` are identical to those in the `Suggested.lean` of WienerChaosAndMalliavinCalculus and SteinsMethodForNormalApproximation, two open roadmaps of this project; the docstrings say so.
- **Order of merging.** The roadmap consumes two roadmaps that are still open pull requests (WienerChaosAndMalliavinCalculus, SteinsMethodForNormalApproximation); the description says they merge first.
