# FIX-PKG-HyperbolicDynamicsAndThermodynamicFormalism~5

One review (REV-PKG-HyperbolicDynamicsAndThermodynamicFormalism~4), three findings, all verified
and applied in `packages/HyperbolicDynamicsAndThermodynamicFormalism/README.md`. `Suggested.lean`,
`metadata.toml`, `sources.toml` and `design/plan.json` are unchanged.

## F01 (P2) — applied

§6.5, first API bullet. Old: "For small δ … a single point [x, z]; … and g^t[x, z] = [g^t x, g^t z]
when both are defined." New: the single-point clause made precise (δ ≤ δ₀, 2δ ≤ δ*), and
equivariance, with v unchanged, only when d(g^s x, g^s z) < e(δ) for every s between 0 and t, under
4δ ≤ δ*, 2δ ≤ δ₀, e(δ) ≤ e(2δ), with the stepping argument. New §6.5 Check: the Fibonacci
counterexample family.

Verification. Cat suspension, A = (2 1; 1 1), e_u = (φ, 1)/√(1+φ²), e_v = (−1, φ)/√(1+φ²).
For n = (F_(k+1), F_k) and even k, the identities F_(k+1) − φF_k = (−1/φ)^k and
φF_(k+1) + F_k = φ^(k+1) give n·e_v = −φ^(−k)/√(1+φ²) and |A^(−k)q| = φ^(1−k)/√(1+φ²). At
k = 6 these are −0.02930 and 0.04741, the review's numbers. g^k z = [0, A^k w + q] ≡
[0, A^k w + 0.0293e_v]. So [x, z] = x while [g^k x, g^k z] = g^k z. Larger k puts both distances
below any e(δ).

The repair's hypothesis excludes the example. At time k/2 the fibre difference is
(φ², φ)/(1+φ²) ≡ e_v/√(1+φ²) mod ℤ², at flat distance 0.5257 from ℤ² for every k. In the metric
of §11.1 the two points are at least 0.428 apart. The proof of the repaired clause was checked
step by step (table below).

Same pattern elsewhere, checked and left as they are:
- §6.1 claims only one step, f[x, z] = [fx, fz]. This is true: the two candidates are within 2δ
  at every n ∈ ℤ, and 2δ ≤ δ* is stated.
- §6.4 iterates the bracket only under closeness at every k < n.
- §6.6 and §6.7 claim no equivariance across long times.

## F02 (P3) — applied

§6.5, third API bullet. Old: "Every z with d(x, z) < e(δ) lies in W^u_δ(w) for a point
w = [x, z] of W^cs_δ(x)." New: z ∈ W^u_δ(w) for d(x, z) < e(δ), and w ∈ W^cs_δ(x) for
d(x, z) < e'(δ), some e'(δ) ∈ (0, e(δ)]. The new text explains why W^s_δ(g^v x) need not lie in
g^v W^s_δ(x) when v > 0, and gives the continuity argument. New §6.5 Check: the two sets have
coordinate half-widths ℓe^(a(s+v)) and ℓe^(as) in the metric of §11.1.

Verification. The plane u = const has the metric ds² + e^(−2as)dv², of curvature −a², and the
ambient metric projects onto it without increasing lengths. So the distance to the stable point at
coordinate b is (2/a)asinh(a|b|e^(−as)/2), which gives ℓ = (2/a)sinh(aδ/2) (0.10004 at δ = 0.1).
The ratio of the two half-widths is e^(0.1a) = 1.1010.

For v ≤ 0 no shrinking is needed: every t ≥ 0 has t − v ≥ 0. For v > 0, the times t ∈ [0, v) are
backward times u = v − t ∈ (0, δ]. Continuity of the bracket and of v, uniform on the compact set
{d(x, z) ≤ e(δ)/2}, gives e'.

Same pattern in §8.5's proof sketch. There, r = min(r₀, δ/K) placed the bracket g^v y in
g^v W^s_δ(x), but (F2) asks for W^s_δ(g^v x). The sketch now takes r = min(r₀, δ/(KL)), where L
bounds the Lipschitz constants of g^s for |s| ≤ r₀, and says that the backward times between v and
0 cost the factor L. In the Sol suspension, r = δ/K fails at v = −r for y at the edge of the
plaque, and δ/(KL) with L = e^(ar₀) works. §8.3's definition of W^cs as the union of the g^v W^s
already agrees with §6.5. §11.3 uses chart constants and makes no scale claim.

## F03 (P3) — applied

§1.1, fifth API bullet. Old: "(ClimenhagaThompson2016, line 358, for compact X)" and
"(ClimenhagaThompson2016, lines 355–358)". New: "(ClimenhagaThompson2016, lines 1687–1688, for the
definition on a compact metric space)" and "(ClimenhagaThompson2016, lines 355–358, where
compactness is noted for compact X)".

Verified: ClimenhagaThompson2016 line 356 is (2.12), the set for a flow, and line 358 notes its
compactness. Lines 1687–1688 are (5.7), the set for a map, without the remark. The standing setting
of the map section, a compact metric space, is at line 1595. No other occurrence of this citation
was found.

## Checks

- **Elaboration.** `lake env lean packages/HyperbolicDynamicsAndThermodynamicFormalism/Suggested.lean`
  was run from the content checkout and exited with code 0. There were no errors and 15 warnings,
  all `declaration uses sorry`, at lines 194, 211, 223, 286, 302, 406, 464, 475, 539, 557, 591, 601,
  617, 668 and 686.
- **Signatures.** One scratch copy carried `#check @name` for all 50 declarations and was elaborated
  once, with exit 0 and no errors. I compared the elaborated types with the README statements,
  including `HasFlowHyperbolicLocalProductStructure`, the §6.8(b) theorem and
  `hasFlowHyperbolicLocalProductStructure_of_isFlowLocallyMaximal`; nothing changed and nothing is
  missing.
  - The 9 dropped-binder leads are defs whose bodies do not use the instance: `[MeasurableSpace X]`
    on 7 Pressure and MetricNotions defs, and `[FiniteDimensional]` on `hadamardPerronGraph`.
  - The theorems keep their binders, for instance `exists_isHadamardPerronFamily` keeps
    `[FiniteDimensional ℝ V]`.
  - The lead `of` is a docstring parsing artefact.
- **Dependency direction.** The output was `depcheck: 242 roadmaps, 2264 edges, 0 problem(s)`, with
  no UPWARD, CYCLE or `moved:` line.
- **Citations.** `roadmaps resolve` reported no citation and no Lean name found nowhere.

## Adversarial pass (changed and added statements)

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §6.5 API 1, single point | 2 candidates w, w′; periodic orbit | d(g^t w, g^t w′) ≤ 2δ ≤ δ* for all t, both → 0; (F3) at base g^T w: d(w, w′) ≤ ce^(−κT)·2δ → 0; orbit: W^s = W^u = {x}, point g^v x | holds | precise scales |
| §6.5 API 1, continuity | w_n → w′, v_n → v′ | d(g^t w_n, g^(t+v_n)x_n) ≤ cδe^(−κt) uniformly ⇒ the limit keeps convergence; uniqueness gives v′ = v, w′ = [x, z] | holds | parenthetical added |
| §6.5 API 1, equivariance (old) | cat suspension, k = 6 | n·e_v = −0.02930, \|y\| = 0.04741; [x, z] = x, [g⁶x, g⁶z] = g⁶z ≠ g⁶x | false | replaced |
| §6.5 API 1, equivariance (new) | step τ ∈ (0, ρ]; τ < 0; t = 0; periodic orbit; k = 6 witness | W^u part for τ > 0: δ/2 + δ + δ/2 = 2δ; W^s part for τ < 0: same; shift unique at 2δ since d < e(δ) ≤ e(2δ); points within 4δ ≤ δ*; orbit: [x, g^v x] = g^v x, v(g^t x, g^t z) = v; witness at time 3: distance ≥ 0.428 > e(δ) | holds; witness excluded | new |
| §6.5 Check (equivariance) | k = 6, 8, 10 | n·e_v = −0.02930, −0.01119, −0.00427; \|y\| = 0.04741, 0.01811, 0.00692; A^(k/2)y = (0.7236, 0.4472) each time, toral distance 0.52573 = 1/√(1+φ²); min_h max(2h, 0.5257e^(−0.9624h)) = 0.4279 | correct | new |
| §6.5 API 3 (old) | Sol suspension, v = 0.1 | half-widths ℓe^(a(s+v)) against ℓe^(as), ratio 1.1010 | inclusion used unjustified | replaced |
| §6.5 API 3 (new) | v ≤ 0; v > 0; z = x | v ≤ 0: t − v ≥ 0, so the bound is the defining one; v > 0: u = v − t ∈ (0, δ], small by continuity; z = x gives w = x, v = 0 | holds | new |
| §6.5 Check (two sets) | δ = 0.1, 0.05 | ℓ = 0.100039, 0.050005; hyperbolic plane distance (2/a)asinh(aβ/2) ⇒ ℓ = (2/a)sinh(aδ/2) | correct | new |
| §8.5 sketch, r | Sol suspension, v = −r | r = δ/K: needs ℓe^(as) ≤ ℓe^(a(s−r)), false; r = δ/(KL), L = e^(ar₀): (δ/L)e^(as) ≤ δe^(a(s+v)) for \|v\| ≤ r₀ | factor needed | r = min(r₀, δ/(KL)) |
| §1.1 locator | CT2016 lines 356, 358, 1595, 1687–1688 | (2.12) flow set and its compactness note; (5.7) map set; map setting compact | old locator was the flow's | replaced |
| §6.1 one step (pattern) | w = [x, z], w′ = [fx, fz] | n ≥ 0: ≤ δ + δ through f^(n+1)x; n ≤ −1: ≤ δ + δ through f^(n+1)z | holds | none |
| §6.4 iterated (pattern) | closeness at each k < n | every step pair within ε ≤ e(δ) | holds | none |

## Ownership and overlaps

No new object or construction was introduced, so no ownership question arises.

`scratch/overlaps.md` lists no open pull request that changes this roadmap and no dropped id. Its
lead "GeneralizedCohomology §G4.0b only in an open revision" is refuted: G4.0b is defined on main,
in the README of `TauCetiRoadmap/GeneralizedCohomology` (the G4.0a/G4.0b block around its line
939). The citation stays as it is.

## Maintainer notes

- No Lean name changed, and no id that other roadmaps cite changed.
- The review's note to the human reviewers is unchanged. `design/plan.json` still lists the
  unused gap `sphere-bundle-embedding`, and this round did not touch it.
- No text was missing, and `needs-references.toml` was not written.
