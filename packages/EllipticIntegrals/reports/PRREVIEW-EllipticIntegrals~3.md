# Review of EllipticIntegrals (pull request #2556 at 1d029f4)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every target of Layers 1–5 and all eleven Lean statements were recomputed from the defining integrals and hold, the sampled locators say what they are cited for, and the three findings of the first review stay repaired. Five small corrections and two format notes remain, none blocking: a sentence in §3.1 that ignores Hartogs' theorem, a bound in the route of §2.1 that gives nothing for k′ ≤ 1/9, two DLMF equation numbers, a milestone-table entry, and a Cremona citation in two docstrings. The human reviewers have two facts to weigh (Tau Ceti after the pin, and the `lean-codes` counterpart of one declaration).

## C01 — In the route of §2.1 the cited quadratic bound gives no decay when k′ ≤ 1/9

An implementer who follows the route literally cannot conclude uₙ → 0 or the summability for moduli near 1. The route (lines 176–178) derives both from "Tau Ceti's quadratic bound on aₙ − gₙ", which is `NNReal.agmSequences_snd_sub_fst_le` (`TauCeti/Analysis/SpecialFunctions/ArithmeticGeometricMean.lean` line 67): for `0 < y ≤ x`, the difference after n + 1 steps is at most `8 * y * ((x - y) / (8 * y)) ^ (2 ^ (n + 1))`. With x = 1 and y = k′ the base is (1 − k′)/(8k′), which is at least 1 as soon as k′ ≤ 1/9. At k′ = 0.1 it is 1.125, and the bound at n = 3 is 0.8 · 1.125¹⁶ ≈ 5.27, while a₄ − g₄ ≈ 1.7 · 10⁻⁹.

Nothing quadratic is needed. Mathlib's halving bound `NNReal.dist_agmSequences_fst_snd` (`Mathlib/Analysis/SpecialFunctions/ArithmeticGeometricMean.lean` line 145) gives cₙ ≤ 2⁻ⁿ, so 2ⁿcₙ² ≤ 2⁻ⁿ, which is summable and tends to 0 for every k′ ∈ (0, 1]. The sentence could read "because 1 − tₙ ≤ kₙ² and 2ⁿaₙ²kₙ² = 2ⁿcₙ² ≤ 2⁻ⁿ by Mathlib's halving bound", with that declaration in the *Needs:* line; or the route could say that the quadratic bound is applied from an index at which aₙ − gₙ < 8gₙ.

## C02 — §3.1 says that holomorphy in each variable separately gives no chain rule; by Hartogs' theorem it does, and what is missing is that theorem at the pins

The sentence at line 243, "holomorphy in each variable separately gives no chain rule for such a composite", presents the joint statement as a mathematical necessity. By Hartogs' theorem a function on an open subset of ℂⁿ that is holomorphic in each variable separately is holomorphic, and `slitPlane ×ˢ slitPlane ×ˢ slitPlane` is open, so the separate statements already imply the joint one. The pins do not have the theorem: Mathlib has none, the files of Tau Ceti that mention Hartogs are about schemes, and Tau Ceti's Osgood lemma (`ContinuousOn.analyticAt_of_differentiableAt_update`, `TauCeti/Analysis/Complex/CauchyIntegralPolydisc.lean` line 292) assumes continuity in the variables jointly.

A possible wording: "the chain rule needs differentiability in the three variables jointly; separate holomorphy gives it only through Hartogs' theorem, which the pinned libraries lack, so it is proved directly by differentiating under the integral sign."

## C03 — Two DLMF equation numbers do not hold the formulas they are cited for

A reader who opens the locator finds another statement. In Convention 4 (line 73) the integral for R_G is cited as DLMF 19.16.3; in the current DLMF that number reads "Moved to (19.23.6_5)" (the surface-integral definition), and the single integral displayed in the README is 19.16.2_5. In Scope and ownership (line 622) the elementary R_C is cited as "DLMF 19.2.19, 19.2.20"; the two cases the library proves, `carlsonRC_ofReal_eq_arccos` (0 ≤ x < y) and `carlsonRC_ofReal_eq_arcosh` (0 < y < x), are 19.2.18 and 19.2.19. DLMF 19.2.20 is the case y < 0 ≤ x, a Cauchy principal value outside the domain of Convention 4.

The repair is "19.16.2_5" in Convention 4 and "19.2.18, 19.2.19" in the scope bullet. The same two numbers stand in the docstrings of the pinned Tau Ceti files (`Carlson/RG.lean` line 90, `Carlson/Basic.lean` lines 332 and 376), which is where they come from.

## C04 — The milestone table sends former Milestone 5 to the group *Special values*, but item 5.2, E(1/√2), is listed in another group

A reader who follows former 5.2 to the *Special values* group of the supplier contracts (line 819) does not find it there. E(1/√2) = K(1/√2)/2 + π/(4K(1/√2)) is `legendreEc_one_div_sqrt_two` (`TauCeti/Analysis/SpecialFunctions/EllipticIntegral/Relation.lean` line 124), and the contracts list it under *At k = 1 and Legendre's relation* (line 798). The row at line 689 could read "5.1, 5.3: Tau Ceti: *Special values*; 5.2: Tau Ceti's `TauCeti.Real.legendreEc_one_div_sqrt_two`". No roadmap cites Milestone 5, so no citation breaks.

## C05 — Two docstrings of `Suggested.lean` cite Cremona §3.7 for the K forms of the real period, which that section does not state

Cremona §3.7 (pp. 97–98) gives only the AGM form: for the monic cubic with real roots ordered e₃ > e₂ > e₁, a positive real period λ₁ = π/AGM(√(e₃ − e₁), √(e₃ − e₂)), and for one real root λ₁ = π/AGM(|z|, Re z) with z = √(e₃ − e₁). It has no Legendre integral. The docstrings of `realPeriod_eq_of_three_real_roots` (line 112) and `realPeriod_eq_of_one_real_root` (line 128) attach "(Cremona §3.7)" to 4K(k)/√(e₁ − e₃) and 2K(k)/√A. The README does this correctly: §5.3 cites Cremona for the AGM sentence and §5.2 cites Byrd and Friedman for the integrals. The two K-form docstrings could cite §5.2's source (Byrd and Friedman 236.00, 239.00) and leave Cremona to the two AGM theorems, where the formulas agree with his after exchanging e₁ and e₃ and doubling λ₁ in the three-root case (two real components).

## N01 — The *Needs:* line of §2.1 omits what the bound "1 − tₙ is at most a constant times kₙ²" uses

The listed `pi_div_two_le_legendreK` and `legendreEc_le_pi_div_two` give only tₙ ≤ 1. The bound itself (with constant 1: E(k)/K(k) ≥ 1 − k²) comes from `TauCeti.Real.legendreK_le_pi_div_two_div_sqrt` and `TauCeti.Real.le_legendreE_integrand`, both in the supplier contracts but not in this line.

## N02 — Line 58 of `TauCetiRoadmap/EllipticIntegrals/Suggested.lean` (the docstring of `pi_eq_four_mul_agm_sq_div_one_sub_tsum`) is 106 characters long; rewrapping it brings it within 100.

## Previous findings

The previous review read this same head and accepted it; its points are re-checked here against the text.

- First review R01 (joint holomorphy of R_F) — repaired: §3.1, line 240, "Prove also that R_F is holomorphic in its three variables jointly on the product of three slit planes"; §3.2's *Needs:* lists it; the statement elaborates as written.
- First review R02 (pendulum headline) — repaired: `pendulum_solution` ends with the uniqueness clause `… → φ 0 = θ₀ → ψ 0 = 0 → φ = θ` and `IsLeast {p : ℝ | 0 < p ∧ Function.Periodic θ p} (4 * legendreK k / ω)`.
- First review R03 (§2.1 Check) — repaired: line 187 gives 1.0854130…; recomputed 1.0854129860.
- Second review C01 (Hartogs sentence) — not repaired: line 243 is unchanged (C02 above).
- Second review C02 (Milestone 5 row) — not repaired: line 689 is unchanged (C04 above).
- Second review N01 (line length) — not repaired: line 58 is unchanged (N02 above).

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 1.1 `tendsto_legendreK_sub_log` | k′ = 10⁻¹, 10⁻², 10⁻³; log(2/k′) variant | K − log(4/k′) = 6.758e-3, 1.248e-4, 1.824e-6; with log 2/k′: 0.693149 | holds | none |
| 1.1 route, E → 1 | k = 0.9; same k′ | J = 1.6357994329 = arsinh(k/k′)/k; ∫tan(φ/2) = 0.6931472; E = 1.0159935, 1.0002746, 1.0000039 | holds | none |
| 2.1 `legendreEc_eq_agm_tsum` | k = 0.6, −0.6, 0; Lean indexing; weights 2ⁿ | series 1.4180833944 = E(0.6) by quadrature; Lean form 1.41808339445; wrong weights 1.0854129860 | holds | none |
| 2.1 route | recurrence by hand; k′ = 0.1 | uₙ₊₁ − uₙ = 2ⁿ⁻¹cₙ² exactly; cited bound 5.27 at n = 3 vs a₄ − g₄ = 1.7e-9 | route input fails for k′ ≤ 1/9 | C01, N01 |
| 2.2 `pi_eq_four_mul_agm_sq_div_one_sub_tsum` | g₀ = 1/√2; partial sums; weight 2ⁿ | M = 0.8472130848; quotient 3.141592653589794; iterates 3.1405792505, 3.1415926462; wrong weight 3.0002511 | holds | none |
| 3.1 separate and joint holomorphy | R_C(−2 ± i·10⁻⁶, 1); domination bound | 0.9068997 ∓ 0.6617679i = π/(2√3) ∓ i·artanh(√(2/3))/√3; joint statement elaborates | holds | C02 (wording) |
| 3.2 `carlsonRF_duplication` | (0,1,1); x = y = e^{3πi/4}, z = 1; (0, e^{3πi/4}, 1 − i/2); (0, −1+.01i, −2−.01i); 300 random triples, 60 with x = 0 | π/2 both; 0.8012606 − 0.8091666i both, √(xy) variant 1.2195926 − 0.5959131i; 1.5591503 − 0.7765197i both; 2.6206765 + 1.2954743i both; max relative gap 2.8e-15 | holds | none |
| 3.3 `legendreEc_eq_carlsonRG` | k = 0.6, −0.6, 0, 0.99; route identity at y = 0.64, e^{3πi/4}, 2+i, −3+0.2i | 2R_G = 1.4180834, 1.4180834, 1.5707963, 1.0284758 = E(k); route: 0.4663828 + 1.3557016i both at −3+0.2i | holds | none |
| 4.1 least period 4K | k = 0.3, 0.9 | sn(K) = 1, sn(3K) = −1; sn(0.7 + 4K) − sn(0.7) = 2e-16; sn(0.7 + 2K) + sn(0.7) = 0 | holds | none |
| 4.2 `jacobiSn_add`, cn, dn | (u,v,k) = (0.4,1.3,0.7), (−2.1,5.5,0.95), (3,−7,−0.5), (1,2,0); v = K, k² = ½ | sn 0.9945733, 0.9615354, 0.5802001, 0.1411200 both sides; cn, dn agree to 1e-15; 0.9592196 vs + sign 0.8270594 | holds | none |
| 4.3 limits k → 1⁻ | u = 1; k = 0.999999, 0.9 | 0.7615943, 0.6480541, 0.6480550 vs tanh 1 = 0.7615942, sech 1 = 0.6480543; at 0.9: 0.77764, 0.62871, 0.71426 | holds | none |
| 4.4 `pendulum_solution` | (ω, θ₀) = (1.3, 2), (0.5, 3.1), formula vs RK4 at three times; periods | 1.6144581, −1.6015072, 1.8612346 both; 3.0946933, 0.5137519, −1.4211070 both; 4K/2π = 1.180341 (90°), 1.073182 (k = ½) | holds | none |
| 5.1 exchanged ellipse | a = 1, b = 2; arc length by quadrature | 8E(√3/2) = 9.6884482 = quadrature 9.6884482; wrong case 2π = 6.2831853; γ(t) = i·conj(δ(π/2 − t)) by hand | holds | none |
| 5.2 cubic integrals | e = (1,0,−1), (3,1,−2), (10,9.99,−5); (e₁,a,b) = (2,−1,3), (0,5,−0.1), (5,0,0.001) | 1.3110288 both; 0.8718732 both; 1.3022463 both; 0.7930927 both; 2.6793194 both; 0.7024815 both | holds | none |
| 5.3 four real-period theorems | y² = x³ − x, x³ + 1; e = (3,1,−2); Cremona's λ₁ | 5.2441151 = 2π/M(√2,1); 4.2065463 both forms; 3.4874928 both; equals 2λ₁ (three roots), λ₁ (one root) | holds | C05 (docstring) |
| Convention 4 and scope locators | DLMF 19.16.1–19.16.5, 19.2.17–19.2.20 opened | 19.16.3 "moved"; R_G integral is 19.16.2_5; arccos case is 19.2.18, 19.2.20 is y < 0 ≤ x | two slips | C03 |
| Milestone table | main's Milestones 5 and 8 item by item; the two citing heads | 8.2–8.3 → §5.2, 8.4 → §5.3 right; 5.2 sits in another contract group | one slip | C04 |

- Source locators checked against the text: 36. DLMF 19.2.4, .5, .7, .17–.20; 19.4.1; 19.5.1–2; 19.6.13; 19.7.1, .5; 19.8.1–2, .6, .12; 19.12.1 (with d(0) = 2 ln 2); 19.16.1, .2, .2_5, .3, .5; 19.25.1, .5, .7, .14; 19.26.18 with the standing assumption (dlmf-19 lines 71–74, 633–635); 19.30.5 (a > b); 22.8.1–3; Tables 22.4.1, 22.5.3, 22.5.4; 22.19.1–2; Salamin Theorem 1b, p. 567 (salamin1976 lines 80, 95–98); Carlson 1995 §2, (8)–(11) (carlson1995 lines 122–146); Cremona §3.7.
- Library declarations opened at the pins (Tau Ceti 2fd255d, Mathlib 1b1ccf4): 34, among them `NNReal.agmSequences` (Mathlib `ArithmeticGeometricMean.lean` 56), `NNReal.agmSequences_snd_sub_fst_le` (Tau Ceti 67), `legendreK_eq_pi_div_two_mul_agm` (`Gauss.lean` 60), the two Landen steps (`Gauss.lean` 89, `Landen.lean` 83), `legendre_relation` (`Relation.lean` 88), `jacobiAm` (`JacobiElliptic/Basic.lean` 62), `carlsonRF` (`Carlson/Basic.lean` 91), `carlsonRGIntegrand` (`Carlson/RG.lean` 77), `realPeriodLIntegral` (`RealPeriod.lean` 119), `eVariationOn_ellipse` (`Ellipse.lean` 85), `ODE_solution_unique_univ` (`ExistUnique.lean` 341). Hypotheses agree with the README.
- All 456 backticked identifiers of the README were searched at the pins: all resolve except namespaces, the `lean-codes` file names and the 11 targets of `Suggested.lean`, none of which the pin proves.
- Cross-roadmap citations resolved on main: 8 (ModularCurvesPartII §1.1 and §1.4a; EllipticCurves Layer 7; SpecialFunctionsTheta Layer 6, §§6.3, 6.4, 6.6 and Downstream consumers; ConformalMapping Layer 6; DiophantineApproximationAndTranscendence Layer 3; SpecialFunctionsHypergeometric 15.9.24–15.9.25 and its principal branch). None is a supplier; the suppliers are Mathlib and Tau Ceti only.
- Dependency check: `depcheck: 200 roadmaps, 2196 edges, 0 problem(s)`. The worker's automatic checks all passed. The pull request changes nothing outside the folder.
- Elaboration: `lake env lean` on `Suggested.lean` gives 11 `sorry` warnings and nothing else; single `import Mathlib` and five existing `TauCeti.*` modules; no `set_option`, no sorry'd data. The elaborated types of all 11 were compared with the README statements: no binder lost, same generality.
- One-tactic probe (`rfl`, `simp`, `exact?`) on a scratch copy: fails on all 11, so nothing is padding.
- Pull request text: the description was read against the head (22 Checks counted, 11 theorems, the removed and added declarations, the dropped citation of GrothendieckPeriodConjecture, the milestone table and the two citing roadmaps); no sentence is contradicted.

Overlap check: read SpecialFunctionsTheta (main and its open revision), SpecialFunctionsHypergeometric (main and open), SpecialFunctionsAppell (main), SpecialFunctionsLegendre, SpecialFunctionsGamma and SpecialFunctionsHeun (open), and the two roadmaps that cite this one, PeriodsAndSpecialValues and EllipticCurvePeriodsAndModularParametrizations (open); nothing shared. They consume Tau Ceti's `legendreK`, `carlsonRF` and Jacobi functions only; Theta owns λ, the nome and the theta forms of K; EllipticCurvePeriodsAndModularParametrizations leaves the real period as a Legendre integral and AGM to this roadmap. A search of main and all open heads for the duplication theorem, the Gauss–Brent–Salamin formula, the addition theorem for sn, the pendulum solution and an AGM formula for the real period finds them only here.

Source independence: 24 passages compared with 4 sources (DLMF Chapters 19 and 22, Salamin 1976, Carlson 1995, Cremona 1997), none shared beyond formulas; largest share DLMF, 25 of 30 locators; contents compared with DLMF Chapters 19 and 22: independent (Layer 1 ↔ §19.12 comes before Layer 2 ↔ §19.8; Layer 3 takes §19.26 before §19.25 and adds holomorphy from Carlson; Layer 5 joins §19.30 with Byrd–Friedman and Cremona).

Research link: Layer 5 evaluates the real period of the Birch–Swinnerton-Dyer quotient by the AGM, the method of Cremona 1997, §3.7 (read) for period lattices; Layer 3's duplication theorem is the step of Carlson's 1995 algorithms for complex elliptic integrals (§2, read). Rests on the README and those two sources.

## Not verifiable

- Carlson 1977, Chapter 9 (the locator of §3.1): a book, no legal copy found; holomorphy was checked on the integral definitions and numerically instead.
- Byrd and Friedman, formulas 236.00 and 239.00 (§5.2): no legal copy found; the three integrals were checked by quadrature instead.
- The statement in Provenance that the author of `lean-codes` agreed to its use (Lean Zulip): not accessible to this review.

## Source issues

- none

## For the human reviewers

- Tau Ceti commit d2083f0 (2026-11-08) is later than the pinned 2fd255d. The folder's `STATUS.md` reports seven of the eight former milestones proved there, including several targets of Layers 1–5; this review treated them as targets, since the pin lacks them.
- `lean-codes` (Apache-2.0 per the README) is said in Provenance to prove the duplication theorem; the previous review found `carlsonRF_duplication` there with the same name and binders, in `Carlson/Elliptic/Addition.lean`. The README directs implementers to port from it.
