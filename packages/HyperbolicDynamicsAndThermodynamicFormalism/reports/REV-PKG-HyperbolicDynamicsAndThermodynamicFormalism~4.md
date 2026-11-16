<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/17485#issuecomment-6905550232 -->
Review (claude) of eaf9766

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) §6.5: the flow bracket is not equivariant "when both are defined"

   **Location.** `packages/HyperbolicDynamicsAndThermodynamicFormalism/README.md` line 443 (§6.5,
   first API bullet): "the bracket and the time shift v(x, z) are continuous, [x, x] = x and
   v(x, x) = 0, and g^t[x, z] = [g^t x, g^t z] when both are defined."

   **Claim.** For every real t, if d(x, z) < e(δ) and d(g^t x, g^t z) < e(δ), then
   g^t[x, z] = [g^t x, g^t z].

   **Witness.** Constant-roof suspension of the cat map (the README's own example, §6.5 first Check,
   §8.5). Unit eigenvectors e_u = (0.8507, 0.5257), e_s = (−0.5257, 0.8507), unstable eigenvalue
   2.618. Take the lattice point n = (13, 8): n·e_s = −6.8345 + 6.8052 = −0.0293, so q = n + 0.0293 e_s
   lies on the unstable line, |q| = 15.26. Put u = A⁻⁶q, |u| = 15.26/2.618⁶ = 15.26/322 = 0.0474,
   x = [s, w], z = [s, w + u], t = 6.

   - d(x, z) is about 0.047, and g⁶z = [s, A⁶w + q] = [s, A⁶w + 0.0293 e_s], so d(g⁶x, g⁶z) is about
     0.029: both brackets are defined once e(δ) > 0.05.
   - x ∈ W^u_δ(z), so [x, z] = x with v = 0, and g⁶[x, z] = g⁶x.
   - g⁶z ∈ W^s_δ(g⁶x), so [g⁶x, g⁶z] = g⁶z ≠ g⁶x.

   For a smaller e(δ) use n = (F_(k+1), F_k) with k larger (|n·e_s| tends to 0) and t larger. At the
   intermediate times the orbits are far apart (|A³u| = 0.85), which is what the clause omits. The
   one-step clause of §6.1 ("f[x, z] = [fx, fz] whenever both sides are defined") is true: the two
   points stay 2δ-close at every integer time (computed in the table). §6.4 uses the iterated form
   only under closeness at every k < n, so no theorem and no declaration of `Suggested.lean` is
   affected.

   **Repair.** In line 443 replace "and g^t[x, z] = [g^t x, g^t z] when both are defined." by:

   "and, for 4δ ≤ δ*, 2δ ≤ δ₀ and e(δ) ≤ e(2δ) (shrink e(δ) if necessary),
   g^t[x, z] = [g^t x, g^t z] with v(g^t x, g^t z) = v(x, z) whenever d(g^s x, g^s z) < e(δ) for
   every s between 0 and t: for |τ| small, uniformly, g^τ[x, z] lies in
   W^s_(2δ)(g^(v+τ) x) ∩ W^u_(2δ)(g^τ z), and the time shift and the point are unique at the scale
   2δ. Closeness at the two end times is not enough (Checks)."

   Add to the Checks of §6.5: "Equivariance of the bracket needs closeness at the intermediate
   times. In the constant-roof suspension of the cat map let q = (13, 8) + 0.0293 e_s, a point of the
   unstable line, u = A⁻⁶q of length 0.047, x = [s, w] and z = [s, w + u]. Then [x, z] = x, while
   g⁶z = [s, A⁶w + 0.0293 e_s] lies on the strong stable set of g⁶x, so [g⁶x, g⁶z] = g⁶z ≠ g⁶x;
   between the times 0 and 6 the two orbits are not close."

   Tested on the witness: the new hypothesis fails at s = 3 (toral distance of A³u from 0 is above
   e(δ)), so the instance is excluded; on the two-shift suspension of the first Check the bracket at
   matched heights commutes with the flow while the base points stay in a common cylinder.

2. **F02** (P3) §6.5: the bracket lies in W^cs_δ(x) only after e(δ) is shrunk

   **Location.** `README.md` line 445 (§6.5, third API bullet): "Every z with d(x, z) < e(δ) lies in
   W^u_δ(w) for a point w = [x, z] of W^cs_δ(x)."

   **Claim.** With W^cs_δ(x) the union of g^v W^s_δ(x) over |v| ≤ δ, the point [x, z] of
   W^s_δ(g^v x) lies in g^v W^s_δ(x).

   **Witness.** The inclusion W^s_δ(g^v x) ⊆ g^v W^s_δ(x) fails for v > 0. For the suspension of the
   cat map with the metric of §11.1, W^s_δ(p) at height s is the stable segment of coordinate
   half-width ℓ e^(as), ℓ = (2/a) sinh(aδ/2). So W^s_δ(g^v x) has half-width ℓ e^(a(s+v)) and
   g^v W^s_δ(x) has ℓ e^(as): ratio e^(av) = 1.101 at v = 0.1. (F2) does not say which of the two
   sets holds [x, z]. (In this homogeneous model the bullet still holds for the largest admissible
   e(δ), exactly: the ball of radius asinh(2 sinh(aδ/2))/a has largest stable coordinate ℓ e^(as).)

   **Repair.** Replace the sentence by: "For every δ ∈ (0, δ₀] there is e'(δ) ∈ (0, e(δ)] such that
   every z with d(x, z) < e'(δ) lies in W^u_δ(w) for the point w = [x, z], and w ∈ W^cs_δ(x): w lies
   in W^s_δ(g^v x) with |v| ≤ δ, and for z close to x it is so close to g^v x (the bracket and v are
   continuous, [x, x] = x) that d(g^(−u) g^v x, g^(−u) w) ≤ δ for 0 ≤ u ≤ δ, whence
   g^(−v) w ∈ W^s_δ(x)."

   Tested: for v > 0 and 0 ≤ t < v, d(g^t x, g^t g^(−v) w) = d(g^(−(v−t)) g^v x, g^(−(v−t)) w) ≤ δ;
   for t ≥ v it is the defining bound of W^s_δ(g^v x); for v ≤ 0 every t ≥ 0 is covered by that
   bound. In the witness, z close to x gives a stable coordinate far below ℓ e^(as).

3. **F03** (P3) §1.1: the locator for the two-sided set of a homeomorphism is the flow's

   **Location.** `README.md` line 146 (§1.1, fifth API bullet): "It is closed, and compact when X is
   compact (ClimenhagaThompson2016, line 358, for compact X)."

   **Claim.** ClimenhagaThompson2016 line 358 supports the statement for a homeomorphism.

   **Witness.** ClimenhagaThompson2016 line 358 is the remark on the two-sided set of a flow (the
   definition is (2.12), line 356). The set of a homeomorphism is defined at lines 1687–1688, (5.7),
   with no compactness remark.

   **Repair.** Replace "(ClimenhagaThompson2016, line 358, for compact X)" by
   "(ClimenhagaThompson2016, lines 1687–1688, for the definition on a compact metric space)", and in
   the next sentence replace "(ClimenhagaThompson2016, lines 355–358)" by "(ClimenhagaThompson2016,
   lines 355–358, where compactness is noted for compact X)".

Three findings: one P2 and two P3, all in `README.md`. `Suggested.lean` needs no change. The
finding of round 3 is repaired, the file elaborates with `sorry` as its only warning, all sampled
locators but one match their texts, no theorem is padding and the dependency check is clean. The
blocking finding is an API bullet of §6.5, a section the round-3 table had no computed row for:
its equivariance clause for the flow bracket is false at long times.

## Round 3 finding, checked

- **F01 (§2.2, specification ⇒ weak specification fails on ∅) — repaired.** Line 229 now reads
  "On a nonempty space, ClassicalErgodicTheory's specification with periodic shadowing … implies
  strong specification, with τ the constant M of that property at a scale ε < δ". The supplier's
  definitions were reread at its head (`e3c5108`, `Suggested.lean` lines 773 and 801: distances
  `≤ ε`, intervals with `a i ≤ b i`, gaps `b i + M ≤ a j`). With s_j = n_1 + ⋯ + n_(j−1) + (j−1)M:
  a_(j+1) − b_j = M, p = s_k + n_k + M = b_k − a_1 + M is admissible, and the start of segment j
  in this roadmap's definition is Σ_(l<j)(n_l + M) = s_j. The scale ε < δ turns the supplier's `≤ ε`
  into the strict `< δ`.
- **The same pattern elsewhere — repaired.** Conventions line 33 ("on a nonempty space, implies
  strong and hence weak specification"), the Route paragraph ("a nonempty system"), §6.3 line 407
  ("of a nonempty compact metric space X"), §6.6 line 463 ("if the space is nonempty"), with the
  Checks at lines 240, 241, 420 and 472. §§5.2, 5.3, 6.8, 10.2–10.4 carry nonemptiness (in the
  Lean file `[Nonempty X]` or `Λ.Nonempty`; confirmed in the elaborated types).

Maintainer notes: none were left.

## Adversarial table

"R" is `README.md`, "L" is `Suggested.lean`. Values computed in this review.

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §6.5 API 1, flow bracket equivariance (R443) | cat suspension, n = (13, 8), t = 6 | n·e_s = −0.0293; \|u\| = 15.26/322 = 0.047; LHS g⁶x, RHS g⁶z, 0.029 apart; \|A³u\| = 0.85 | false at long times | R01 |
| §6.1 API 2, one-step equivariance (sampled) | w = [x, z], w′ = [fx, fz] | n ≥ 1: d(fⁿw, fⁿ⁻¹w′) ≤ δ + δ through fⁿx; n ≤ 0: ≤ δ + δ through fⁿz; all n ∈ ℤ within 2δ ≤ δ* | holds for one step | none |
| §6.5 API 3 (R445) | Sol-metric cat suspension, v = 0.1 | half-widths ℓe^(a(s+v)) against ℓe^(as), ratio 1.101; maximal ball: δ = 0.1 gives radius 0.09988, largest stable coordinate 0.09628 = 2 sinh(aδ/2) | inclusion used fails; bullet needs e shrunk | R02 |
| §6.5 definition, L258 | period-1 orbit, δ = 0.6; irrational linear flow; ∅ | v = 0.45 and −0.55 both in [−0.6, 0.6]; strong sets {x}, (F3) reads 0 ≤ 0, (F2) fails off the orbit; ∅ satisfies all clauses | definition discriminates | none |
| §6.6 item 1, (F2)–(F3) ⇒ Bowen–Walters expansive | pair with d(g^t x, g^(s(t)) y) < ε | uniqueness at scale 2δ gives v_t = v_0 + s(t) − t, so \|s(t) − t\| ≤ 2δ; (F3) both ways gives y = g^(v_0) x, \|v_0\| ≤ δ | holds (proof written out) | none |
| §6.6 Check 1 | τ against ℤ and 1/2 + ℤ | dist(τ, ℤ) + dist(τ, 1/2 + ℤ) = 1/2, both ≤ 1/4 needed strictly | no strong specification | none |
| §6.7 | z = [x, y] for y ∈ B_t(x, ε) | d(g^s z, g^s y) ≤ δ + ω(δ) + ε ≤ δ* on [0, t], so (F3) applies at time t; shift costs 2\|v\| max\|φ\| | holds | none |
| §2.2 API 1 as repaired (R229) | M = 2, n = (3, 0); M = 0 one point; ∅ | s = (0, 5), intervals [0, 3], [5, 5], gap 2 = M, p = 7; intervals touch, gluing 0; ∅: supplier true, weak false | holds on nonempty X | none |
| §2.2 Check, full shift | δ = 2⁻ᵐ | coordinates s − m … s + n − 1 + m and from s + n + τ − m: disjoint iff τ ≥ 2m; τ = 2m + 1 suffices | Check correct | none |
| §6.3 item 3 route (R413) | r_j = n_j = 0; general | mL_j − r_j − n_j = m when L_j = 1 and r_j = n_j = 0, else ≤ m − 1; gluing time ≤ mM + 2m − 1 | bound holds | none |
| §6.3 Check, σ × rotation | k = 5 | m(M + 2) = 2k + 8 = 18 ≥ 2k = 10; M + m = k + 4 = 9 < 10 | Check correct | none |
| §1.1 balls (sampled) | doubling map; rotation flow, n = 0 | half-widths 1/8, 1/16 = 2⁻ⁿ⁻²; B₀ for g¹ = Id is the circle, flow B₀ the arc 1/4 | holds for n ≥ 1 | none |
| §1.1 API 5, Γ_ε (sampled) | two-shift, y with its only 1 at −1 | d(T^k 0, T^k y) = 2^(−k−1), d(T⁻¹0, T⁻¹y) = 1; T(B̄₃(T⁻¹0)) tests −1, 0, 1; the other translate tests n … 3n | formula correct | none |
| §1.1 API 3 | constant map, L = 0 | image {pt} ⊄ B₁(pt, 0) = ∅ | L > 0 needed, stated | none |
| §1.2 (sampled) | two-shift at ε = 1/4; identity of [0, 1]; shifts on 2^m symbols | coordinates −1 … n fixed: 2ⁿ⁺² cover, rate log 2; Φ_ε an interval, entropy 0; pieces of entropy m log 2 inside every ball about ∞ | holds | none |
| §1.2 against the pin | `coverEntropyEntourage_finite_of_isCompact_invariant` | hypotheses `IsCompact F`, `MapsTo T F F`, `U ∈ 𝓤 X`; F = univ, U = {d ≤ ε} | applies | none |
| §4.1 (sampled) | F = c, a = 2; period-1 orbit | 2h + c against 2h + 2c; 2 log 2 + 1 against 2 log 2 + 2; F₁ constant, so point masses are equilibrium states of g¹ = Id | holds | none |
| §6.2 (sampled) | isolated p; closing by shadowing; monotone shift | fⁿp = f⁻¹p gives fⁿ⁺¹p = p; d(f^m z, f^m y) ≤ β + φ; cylinder {x₋₁ = 0, x₀ = 1} one nonperiodic point | holds in forward time | none |
| §6.4 (sampled) | geometric sums; φ = 1/m potential | 2C(cδ)^θ/(1 − λ^θ); S_nφ(y) − S_nφ(0) = 1/(m+1) + ⋯ + 1/(n+m), unbounded | holds | none |
| §7.1 (sampled), L329 | diag(2, 1/2); identity; norm instance | C = 1, λ = 1/2; \|v\| = \|v\| forces T_xM = 0; `‖v‖` elaborates to the `RiemannianBundle` norm (scratch trace) | definition discriminates | none |
| §7.6 (sampled) | Lyapunov series; Jordan block | \|Dfv\|′² = λ′² Σ_(n≥1) ≤ λ′²\|v\|′²; e^(−2κ′t) for flows; norm ((65/64)^(1/2) + 1/8)/2 = 0.5664 ≤ 0.75 | holds | none |
| §7.4, §7.7 | diag(2, 1/2); cat inverse | (1, 1) unbounded; (1 −1; −1 2) with det 1 | holds | none |
| §8.1 headline, L406 | uniqueness; expansion onto the ball; (iii) at L = 0 | backward chain \|zs L\| ≤ μ′^(−L)\|z\| < 2ν^(−L)\|z\|; image ⊇ ball of radius (μ − (1+γ)δ)r₀; needs C > 1, z ≠ 0 | holds | none |
| §8.2 (sampled) | sink B = (1/2 1; 0 1/2); stable family | s = √7 − 2: 1 + s² = 1.41699 = (1/2 + s)² + s²/4; det = 0.6614 = √7/4; \|B²v\| = 0.7647; ν = 1 admissible since λ′ < 1 < μ′ | holds | none |
| §8.3 (sampled) | neutral block; time change h | norm max(e^(−κ′), 1) = 1; e^(3a) = 17.94 > e^a = 2.618; crossing time ≤ 0.05 · 17.94 = 0.9 < 1 | holds; \|X\| = 1 needed | none |
| §8.5 (sampled), L475 | cat suspension; c = (4/5, 3/5) | (5 + √5)/8 = 0.9045 < 1; Ac ≡ (1/5, 2/5), distance 0.447 > 1/4 | holds | none |
| §8.6 | cover by m plaques | diameters 2C′λ′^(pk) r₀ → 0, so K has at most m points | holds | none |
| §8.7 (sampled) | cat map; L = λ | θ = log λ⁻¹/(2 log λ⁻¹) = 1/2; α log L + log λ⁻¹ = 0 | Check correct | none |
| §10.1 | flow r′ = −sin(2πr)/(2π); signed ⇒ forward | multiplier e^(−t) at r = 0, repelling at 1/2; W^s_Λ(ε) of volume 2ε; p ∈ f^(kq+n)(U) ∩ V with kq + n ≥ 0 | holds | none |
| §10.2 (sampled), L539 | cat map, φ = −log 2.618; fixed point | pressure 0.9624 − 0.9624 = 0; point mass | holds | none |
| §10.3 (sampled), L557 | coboundary clause; periodic orbit | derivative at 0 at every point gives it along the flow; T = kp + r bound ±2p max\|F\| | holds | none |
| §10.4 toral headline, L617 | d = 0; d = 1 | det of empty matrix 1, no roots, pressure 0, Dirac = volume; ±1 has modulus 1, hypothesis fails | holds | none |
| §11.1 | Sol-type metric; rescaling | invariance: e^(2a(s−1)) e^(2a) = e^(2as); λ_t = e^(at); φ′ = −a − 0.2π cos(2πs); one-sided slopes a ± 2π | holds | none |
| §11.3 (sampled) | b = 0.1 | ratio (1 + b²e^(−4aT))^(1/2)/(1 + b²)^(1/2), limit 0.99504 < e^(−0.001) = 0.99900 | Check correct | none |
| §11.5 Check | δ = 1/(3.9m), ε = 1.01δ | (1.95² + 1.01²)^(1/2) = 2.196 > 2.01 | Check correct | none |
| gap:connection-map-jacobi-derivative | both pins; RiemannianGeometry on main | "connection map", "Sasaki", "horizontal lift" occur only under `Riemannian/SL2Tilde/` and two unrelated files | precise and minimal | none |

## Verified sound

- **Principles.** No route-specific shortcut, no re-planned roadmap, no algorithm, no sorry'd data,
  no `set_option`, no `lemma`, no `#eval`, `#check` or `#print`. No process residue, machine path,
  LaTeX delimiter or HTML anchor in `README.md`, `Suggested.lean`, `sources.toml` or
  `metadata.toml`.
- **Dependency check** (output): `depcheck: 239 roadmaps, 2251 edges, 0 problem(s)`. No UPWARD,
  CYCLE or `moved:` line.
- **Elaboration.** `lake env lean` on `Suggested.lean` from the content checkout: no error, 15
  warnings, all `declaration uses sorry` (lines 194, 211, 223, 286, 302, 406, 464, 475, 539, 557,
  591, 601, 617, 668, 686). Header `module`, `import Mathlib`,
  `import TauCeti.Geometry.Manifold.Riemannian.VolumeDensity.Volume` (used for
  `TauCeti.riemannianVolume`), as the roadmaps on main have it.
- **Sources: fifteen sampled targets, 37 passages in 7 texts, every readable locator at its lines
  except R03.** BowenEntropyExpansive1972 lines 55–56, 117–135, 188, 192–193 (§1.2).
  ClimenhagaThompson2016 lines 140–147, 170–177, 295–303, 341–342, 355–375, 945, 1661–1669,
  1687–1690, 1717–1724 (§§1.1, 1.2, 2.2, 6.4, 10.2). BowenPeriodicPoints1971 lines 66–83, 96–97,
  101–104, 171–200, 387–392, 421–426 (§§6.1, 6.2). BowenRuelle1975 lines 10–34, 92–108, 163–165,
  190–199, 213–222, 272–277, 346–375, 377–407, 409–413, 643–676, 681–738 (§§1.1, 4.1, 7.6, 8.3,
  8.5, 8.7, 10.3, 11.3); line 362 cites its reference 19, Pugh (line 838). Smale1967 lines 381–390,
  450–462 (§7.1). ClimenhagaPesin2016 lines 281–283, 1822–1855 (§8.2). TsujiiZhang2023 lines
  106–109, 485–495 (§10.3). The author flagged no locator as unverified. `sources.toml` records
  all 18 cited works, with no local path.
- **Suppliers resolved now.** ClassicalErgodicTheory at its open head `e3c5108` (a pull request
  that adds the folder): Conventions "Separated sets and Bowen balls" (line 171), §§0.3, 1.4, 3.4,
  5.1–5.6, 6.1–6.2, 6.4, 7.1–7.4, 8.1–8.5 exist under those numbers; `IsExpansive` (line 1706),
  `IsTopologicallyMixing` (line 1675), `IsGibbsMeasure` (line 2220), `HasSpecification` and
  `HasFlowSpecification` (its Lean file, lines 773, 801). Of the 16 restated definitions, 14 have
  bodies identical to the supplier's Lean file and `flowInvariantProbabilities` is its ℝ-case;
  `IsGibbsMeasure` matches the supplier's README. GeometryOfNumbersAndQuadraticArithmetic §4.2
  (open head, line 1361). ArithmeticDynamics §2.7 (open head, line 2549), §§2.67–2.92. On main
  (`51d880d`): ProbabilisticAndMetricNumberTheory §4.1 (lines 4650, 4692); GeometricCurrents G6
  (lines 668–681); GeneralizedCohomology G4.0b (line 1082); RiemannianGeometry
  `exists_jacobi_initial_data` (line 1509), `rauch_norm_ge_of_sectional_le` (line 2277);
  OperatorAlgebraDynamics D9; HeegaardFloer §1.0a.
- **Overlap facts.** No other pull request changes this roadmap; no cited id is dropped; the
  package drops no id. The lead "GeneralizedCohomology §G4.0b is defined only by an open revision"
  is refuted: main defines G4.0b at line 1082 of its README.
- **Pinned names.** Mathlib `1b1ccf4`, Tau Ceti `2fd255d`. All 227 backticked items of the README
  were resolved: 50 are the declarations of `Suggested.lean` (every one of its 50 names occurs in
  the README), 9 are attributed to ClassicalErgodicTheory, ProbabilisticAndMetricNumberTheory and
  RiemannianGeometry and exist there, the others are file paths, notation or declarations found at
  the pins (for instance `Dynamics.coverEntropyEntourage_finite_of_isCompact_invariant`,
  `CoverEntropy.lean` line 418; `Flow.restrictNonneg`, `Flow.lean` line 241;
  `AddAction.IsTopologicallyTransitive`, `Transitive.lean` line 31;
  `ContMDiff.iff_comp_isImmersion`, `Immersion.lean` line 995;
  `TauCeti.brouwerFixedPoint_closedBall`, `BrouwerFixedPoint.lean` line 149;
  `TauCeti.SmoothMappingTorus.flow_one_mk`, `MappingTorus.lean` line 431;
  `ContMDiffMap.weakWhitneyTopology`, `ContMDiffMap/WeakWhitney/Basic.lean` line 108).
- **Duplication by object.** Searched every open head and main for the Lean names, hyperbolic
  sets, Anosov systems, weak specification, entropy-expansive maps, Hadamard–Perron, local product
  structure, SRB and Bowen–Margulis measures, geometric potential: only ClassicalErgodicTheory's
  out-of-scope and consumer paragraphs (lines 69–74, 2437–2440) and its use of Bowen's
  entropy-expansive theorem as a route in §5.3 (line 1713). No name of `Suggested.lean` is the
  fully qualified name of a declaration elsewhere. Ownership against open pull requests was
  checked with the search tools on all 450 heads.
- **Headline theorems.** Stated: upper semicontinuity of entropy for expansive flows (L194);
  Bowen's criterion under weak specification, maps and flows (L211, L223); the abstract uniqueness
  theorems (L286, L302); Hadamard–Perron (L406); local product structure (L464, L475); Bowen's
  theorem (L539); Bowen–Ruelle with constants, coboundaries, time-t maps and rescaling (L557);
  positive entropy and the Bowen–Margulis and Bowen measures, Haar measure (L591, L601, L617); the
  SRB theorem and its Anosov case (L668, L686). The docstring names the two not stated (local
  stable and unstable manifolds; the geodesic flow) with what each lacks.
- **Padding.** One-tactic probe on all 15 theorems, on a scratch copy (`rfl`, `trivial`,
  `infer_instance`, `simp`, `simp_all` after `intros`, `constructor` then `simp_all`, anonymous
  constructor with `rfl`, `assumption`): 15 errors, none closes.
- **Signatures.** All 15 theorems keep their section hypotheses in the elaborated types
  (`CompactSpace`, `Nonempty`, `BorelSpace`, `SigmaCompactSpace`, `FiniteDimensional`,
  `IsContMDiffRiemannianBundle` where the README has them). The nine "dropped" leads are instances
  a definition's body does not use; the entry `of` is a parsing artefact of the docstring.
- **Shape.** Eleven layers, each ending with `### Examples` and `### Dependencies`; every
  definition has its API and at least three Checks; `*Needs:*` lines are itemised; no layer is
  named after a source's chapter.
- **Declared gap.** `gap:connection-map-jacobi-derivative` is stated under the RiemannianGeometry
  subsection with the plan's slug, is precise and asks for nothing the pins or R2 provide.

Overlap check: read ClassicalErgodicTheory, ArithmeticDynamics, MathematicalBilliards, RiemannianGeometry (LorentzianGeometry, ManifoldOptimization and DimerModelsAndLozengeTilings searched by object; Surfaces is not a folder on main); pressure, equilibrium states, Gibbs measures, the Bowen property, expansive homeomorphisms and flows, specification with periodic shadowing, toral endomorphisms: ClassicalErgodicTheory; Bowen's criterion under weak specification, entropy-expansive maps, hyperbolic sets and everything built on them: this roadmap; measure entropy: GeometryOfNumbersAndQuadraticArithmetic; Shannon–McMillan–Breiman and ergodic decomposition: ArithmeticDynamics; Jacobi fields and Rauch comparison: RiemannianGeometry; nothing else shared.

Source independence: 37 passages compared with 7 sources (BowenRuelle1975, ClimenhagaThompson2016, BowenPeriodicPoints1971, BowenEntropyExpansive1972, Smale1967, ClimenhagaPesin2016, TsujiiZhang2023), none shared beyond formulas and axioms that can be written in one way; largest share BowenRuelle1975, 46 of 137 locators; contents compared with BowenRuelle1975 (Sections 1–5 and Appendix): independent, the roadmap has no layer for its symbolic dynamics and spreads its Sections 3–5 and Appendix over Layers 4, 5, 10 and 11, whose internal order the `*Needs:*` lines of §§11.2–11.6 force. KatokHasselblatt1995, FH2019 and Bowen1975 could not be read.

## Not verifiable

- KatokHasselblatt1995 (16 locators), FH2019 (9), Bowen1975 (3), BowenWalters1972 (2),
  Walters1982, Newhouse1989 and HirschPalisPughShub1970 are recorded as uncertified: their texts
  cannot be read legally here. This covers the KatokHasselblatt1995 locators of the sampled
  §§6.2, 7.1, 7.6, 8.2, 8.7, the FH2019 locators of §§8.3, 8.5 and the Bowen1975 locators of
  §§6.2, 6.4, 10.2.
- §6.6's closing lemma and weak specification for flows with (F2)–(F3) are this roadmap's
  abstraction of the smooth case; no readable source states them at this generality. Expansivity
  was proved in full here (table); closing and specification were checked on the two examples of
  the Checks only.

## Source issues

- **Misprint** in ClimenhagaThompson2016 at §2.5, the sentence after (2.12), printed page 8: the source writes the two-sided set as an intersection of flow images of closed Bowen balls of order 2t centred at x; it should be centred at the point f_(−t)x; affects nothing.
- **Gap** in ClimenhagaPesin2016 at Theorem 11.1, printed page 40: the source gives the maps for nonpositive indices only yet indexes the family of graphs by all integers, and clause (iii) uses inverses not assumed to exist; it should index consistently and use backward sequences; affects a stated result.

## For the human reviewers

- **Plan gap no longer used.** `design/plan.json` lists the gap `sphere-bundle-embedding` (supplier TangentialBordism §2.3); `README.md` neither declares nor uses it (§9.3 cites Mathlib's `ContMDiff.iff_comp_isImmersion`). Whether to withdraw its announcement is yours.
- **Not tested.** KatokHasselblatt1995, FH2019 and Bowen1975 (28 of 137 locators together) could not be read; wording and arrangement were not compared with them.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "eaf9766f89b27a24cb24b68166beb2a497486d15", "job": "REV-PKG-HyperbolicDynamicsAndThermodynamicFormalism~4", "model": "fable", "worker": "chris-x29"} -->
