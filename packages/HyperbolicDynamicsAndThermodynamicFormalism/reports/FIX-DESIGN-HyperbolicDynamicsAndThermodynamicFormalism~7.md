# FIX-DESIGN-HyperbolicDynamicsAndThermodynamicFormalism~7

Repair of the three findings of the round-6 review of the design (all P3). Files changed: `packages/HyperbolicDynamicsAndThermodynamicFormalism/design/README.md` and `packages/HyperbolicDynamicsAndThermodynamicFormalism/design/plan.json`. `sources.toml` is unchanged: no source was fetched and no work was added.

## F01 (P3) — applied

§8.3: the chart inner product now also gives X(x) length 1. Route: "rates e^{−κ'} against a bounded neutral rate" → §8.1's unstable statement for g^{±1}, whose neutral block has norm and conorm 1, so λ = 1 < μ = e^{κ'}. Added a negative-control Check; plan 8.3 statement, API and tests mirrored.

Verification. The finding is right. §7.6 fixes the norm on E^s and E^u only. On ℝX the ratio |Dg^1 X(x)|/|X(x)| = |X(g^1 x)|/|X(x)| is bounded, but it is not compared step by step with e^{±κ'}. Witness, checked: the time change h(s)∂_s of the cat suspension only moves s, so Dg^t = diag(h(σ_t s)/h(s), 1, 1) in (s, u, v). E^s and E^u are the eigenline directions. A period-p orbit takes time p∫₀¹ds/h > p to contract E^s by e^{−ap}, so κ ≤ a/∫₀¹ds/h < a. A point crossing a drop of length 0.05 (crossing time ≤ 0.05·e^{3a} = 0.897 < 1) has neutral ratio e^{−3a} ≈ 0.056. So the neutral block of Dg^{−1} has norm e^{3a} ≈ 17.9 > e^{κ'} = μ, and §8.1's hypothesis μ > max(1, λ) fails. With |X| = 1 the splitting is invariant and orthogonal, so Dg^1 is block-diagonal with blocks of norm ≤ e^{−κ'} (E^s), exactly 1 (ℝX) and conorm ≥ e^{κ'} (E^u). That gives λ = 1 < μ = e^{κ'} for both applications, and §8.1 allows λ ≥ 1 (its second Check).

The reviewer's text says "stable family" for the time −1 application. §8.1's stable family needs λ < 1. So the README now says explicitly that both applications use the unstable statement: E^u is the expanded factor for g^1, and E^s for g^{−1}. The source's own scalar product (BowenRuelle1975 lines 636–642) keeps the original length of X and works with a constant K (line 632). The normalisation here is a choice of this roadmap and does not change the locator.

Pattern search. "neutral", "domin" and "bounded distortion on ℝX" appear at §7.7 (a true statement about rates, with no domination claim), §8.1's second Check (correct), and §11.2(iii). §11.2(iii) bounds the graph transform over all t ≥ 0 with a constant C, which holds without the normalisation, so it is unchanged. Checks recomputed with the new inner product:
- §8.3 suspension chart: |∂_s| = 1 already, composite diag(1, 2.618, 0.382) with neutral entry 1.
- §8.3 curved plaque: |∂_θ| = 1 on Λ.

## F02 (P3) — applied

§8.7 route: "L a Lipschitz constant of Df" → L > 1 a common Lipschitz constant of f and f⁻¹ (g^{±1} for flows), Df α-Hölder, θ = α log λ⁻¹ / (α log L + log λ⁻¹) ∈ (0, α). The Hölder constant of Df enters only C. Added a Check (cat map, θ = 1/2) and a plan test.

Verification. The finding is right. For the cat map Df is constant, so every L > 0 is a Lipschitz constant of Df, and L = λ makes the denominator 0. The reviewer's repair is exact for C², where α = 1. The statement also admits C^{1+α}, and there the exponent changes, so the formula carries α. Derivation, recomputed: the errors accumulate as Σ_{j<n} λ^j H (L^{j+1}d)^α ≤ (L^α H/(1 − λ))·(L^n d)^α. Adding the cone width λ^n and balancing λ^n = (L^n d)^α gives n = α log(1/d)/(α log L + log λ⁻¹), hence d^θ. At that n, L^n d = λ^{n/α} is small, so the points stay in one chart. θ < α ⇔ α log L > 0. Cat map, α = 1, L = (3 + √5)/2 = λ⁻¹ (the operator norm of A and of A⁻¹): θ = 1/2.

Pattern search for "Lipschitz constant", "log L" and "θ =": the other uses are §1.1 (a semiconjugacy constant, correct) and §8.6(b) (a bound for g^v with |v| ≤ r₀, correct). No other exponent formula exists.

## F03 (P3) — applied

Added a "From Tau Ceti" bullet for `TauCeti.Sol` and `TauCeti.Sol.riemannianMetric` (used in Checks only). The §11.1 Check now says in prose that its metric is a⁻² times the pull-back of the Sol metric under (x, y, z) = (au, av, as). The Scope list and the plan's 11.1 test say the same. No value changes.

Verification at the pinned Tau Ceti (`2fd255d9…`, confirmed as the checkout's HEAD). `def Sol : Type := ℝ × ℝ × ℝ` is at line 63. `def riemannianMetric` is at line 264, and `riemannianMetric_inner` (line 273) gives e^{2z}v₁w₁ + e^{−2z}v₂w₂ + v₃w₃. Pull-back: dx = a du, dy = a dv, dz = a ds, so e^{2as}a²du² + e^{−2as}a²dv² + a²ds² = a²(ds² + e^{2as}du² + e^{−2as}dv²). A constant factor c² multiplies every unit-plane norm by the same c^q at both ends, so λ_t = e^{at} and φ^u = −a are unchanged. The volume form of the Check's own metric is still ds du dv. The other Layer-11 Checks cite "the metric of §11.1" and are unaffected.

## Checks

Dependency check (`gate --only HyperbolicDynamicsAndThermodynamicFormalism`), output:

    candidate: HyperbolicDynamicsAndThermodynamicFormalism is not in the merge order yet; checked as if placed after ArithmeticDynamics (the intake inserts it when its design is accepted)
    depcheck: 245 roadmaps, 2233 edges, 0 problem(s)

There is no UPWARD and no CYCLE line. `roadmaps resolve` on the README: no cross-roadmap citation and no Lean name found nowhere. The tool did not check Lean names outside TauCetiRoadmap ("no pinned Lake packages on this host"), so I checked the two new Tau Ceti names by hand at the pin, as above.

No gate failures were listed for this round. There is no `Suggested.lean` at the design stage, so no elaboration and no `#check` comparison applies. `plan.json` parses, keeps its formatting (indent 1, UTF-8, no trailing newline) and still has 45 targets.

## Adversarial pass on the changed statements

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §8.3 chart inner product, \|X(x)\| = 1 | cat suspension; flow θ' = 1, u' = u, v' = −v + u²; E^u = 0 (attracting periodic orbit) | \|∂_s\| = 1, composite diag(1, 2.618, 0.382); \|∂_θ\| = 1 on Λ; with E^u = 0 the ε-ball of ℝX(x) is {σX : \|σ\| ≤ ε}, carried into the orbit arc | Pass | the clause and its continuity reason added |
| §8.3 route, domination with neutral rate 1 | witness h(s)∂_s; block norms | old: neutral norm e^{3a} = 17.9 > μ = e^{κ'} < e^a = 2.618, so it fails; new: max(e^{−κ'}, 1) = 1 = λ < e^{κ'} = μ for g^1 and for g^{−1} | old false, new Pass | route rewritten |
| §8.3 new Check (time change) | κ bound; crossing time; d covered | κ ≤ a/∫ds/h < a; 0.05·e^{3a} = 0.897 < 1; remaining time covers ≤ e^{−3a} = 0.056 < 0.1, so the point ends on the plateau | Pass | Check added |
| §8.7 exponent | cat map α = 1; α = 1/2; L = λ (old reading) | θ = 1/2; θ = (0.481)/(0.481 + 0.962) = 1/3; old: denominator log λ + log λ⁻¹ = 0 | new Pass, old fails | formula with L > 1 and α |
| §8.7 θ ∈ (0, 1] | L → 1⁺; L → ∞ | θ → α; θ → 0⁺; both in (0, α) ⊆ (0, 1] | Pass | none |
| §8.7 new Check | operator norms of A, A⁻¹ | eigenvalues 2.618, 0.382 for A and 0.382, 2.618 for A⁻¹ (both symmetric), norm 2.618 for both | Pass | Check added |
| Sol pull-back | (x, y, z) = (au, av, as); scaling c² = a⁻² | a²(ds² + e^{2as}du² + e^{−2as}dv²); λ_t ratio c·e^{a(s+t)}/(c·e^{as}) = e^{at} | Pass | contract line, Check clause |
| §11.1 Check invariance (recomputed) | (s, w) ↦ (s − 1, Aw) | e^{2a(s−1)}(e^a du)² = e^{2as}du², e^{−2a(s−1)}(e^{−a}dv)² = e^{−2as}dv² | Pass | none |

## Notes for the maintainer

- Ownership: no construction was added. The Sol metric is Tau Ceti's and is cited, not stated. The other changes are route sentences and Checks inside targets this roadmap already owns.
- Overlap lead "GeneralizedCohomology §G4.0b, only an open revision defines it": this is a false positive. `TauCetiRoadmap/GeneralizedCohomology/README.md` on main (1a19c9f) states G4.0b at line 1082, so the citation depends on no open pull request.
- No name that another roadmap cites has changed. No other open pull request changes this roadmap.
- Nothing in the review text read as an instruction.
