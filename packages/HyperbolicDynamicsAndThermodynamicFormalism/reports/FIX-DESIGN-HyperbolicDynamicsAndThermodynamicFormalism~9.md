# FIX-DESIGN-HyperbolicDynamicsAndThermodynamicFormalism~9

This round repairs the four findings of the round-8 review of the design, all P3. Two files change: `packages/HyperbolicDynamicsAndThermodynamicFormalism/design/README.md` and `packages/HyperbolicDynamicsAndThermodynamicFormalism/design/plan.json`. `sources.toml` is unchanged: no new work is cited, and no source was fetched. The design stage has no `Suggested.lean`, so the `#check` comparison does not apply. Nothing was elaborated.

## F01 (P3) — applied

The finding is correct. At the pin, `UnitAddTorus d` is `d → UnitAddCircle` (`Mathlib/Topology/Instances/AddCircle/Real.lean`:55). Mathlib only charts the product (`piChartedSpace`, `Mathlib/Geometry/Manifold/ChartedSpace.lean`:482). The `IsManifold` instance comes from Tau Ceti: `TauCeti.instIsManifoldPi` (`TauCeti/Geometry/Manifold/IsManifold/Pi.lean`:109) and `TauCeti.extChartAt_pi` (:119). `AddCircle.instIsManifold` needs `[Fact (0 < p)]`, and `ZeroLEOneClass.factZeroLtOne` (`Mathlib/Algebra/Order/ZeroLEOne.lean`:54) supplies it for p = 1.

Changes: §9.1 "(the product of Tau Ceti's smooth circles, …)" → "(`UnitAddTorus (Fin n)` with the product structure `TauCeti.instIsManifoldPi` of Tau Ceti's analytic circles `AddCircle.instIsManifold`)". New supplier bullets: Tau Ceti `instIsManifoldPi`/`extChartAt_pi` (stated for C^r, to avoid clashing with the dimension n), and Mathlib `UnitAddTorus`, `piChartedSpace`, `ModelWithCorners.pi`. §9.1 *Needs* and P 9.1 add both names.

Same pattern elsewhere: the Scope list of library objects and Layer 9's Dependencies now name Tau Ceti's finite products of manifolds.

## F02 (P3) — applied

The finding is correct. Bowen's n-delayed specification asks for a gap of length at least n between consecutive intervals (BowenPeriodicPoints1971 lines 161–162). M is therefore counted in steps of f^m, and a gluing time of f is about mM, not M + m.

Witness recomputed: f = σ × (rotation of ℤ/2), metric max(shift, discrete), m = 2.
- At δ = 2^{−k}, gluing two arbitrary segments needs τ ≥ 2k.
- At ε' = 2^{−k−1}, σ² glues only when the next segment starts at least k + 2 of its own steps after the last time of the previous one, so M = k + 2.
- The old bound M + m = k + 4 is below 2k for k ≥ 5.

§6.3 route, old → new: "gluing time, at most M(ε) + m" → apply the second item at a scale ε' with d(a, b) < ε' ⟹ d(f^i a, f^i b) < ε for 0 ≤ i < m, extend each segment back into X_1, and use gaps of M + 1 steps of f^m. Each gluing time is then mM + (mL_j − r_j − n_j) + r_{j+1} ∈ [mM, mM + 2m − 1] ⊆ [0, m(M + 2)], in the stated residue class.

The witness is added as a fourth §6.3 Check, with the plan test `product_with_rotation_gluing_bound`. The statement of the third item is unchanged.

## F03 (P3) — applied

The finding is correct. On the roof-one suspension of the two-shift, take a scale that distinguishes the base coordinates −k, …, k at matched heights. A shadowing point then fixes the base coordinates −k, …, n + k of a first segment that starts at height 0 and has integer length n. An arbitrary second segment needs τ > 2k, so "[0, 1]" is false for k ≥ 1.

§5.3 first Check, old → new: "(gluing times in [0, 1] absorb the phase)" → "with gluing times in [0, τ₀ + 1] as in §6.6, τ₀ the connecting time at the given scale and the extra unit absorbing the phase; τ₀ grows as the scale shrinks". I do not repeat the review's claim that τ₀ is itself at least 2k. What is computed is τ₀ + 1 > 2k.

Same pattern elsewhere: §2.2's second Check and §6.6's first Check already say [0, τ₀ + 1]. No other gluing-time bound occurs. P's `suspension_nonmixing` is unchanged.

## F04 (P3) — applied differently

The finding is correct. The statement and route of §10.2 use only §§6.8, 8.4, 10.1 and ClassicalErgodicTheory §8.2; the "in particular" clause about Anosov diffeomorphisms uses §10.1's third API item. The statement and route of §10.3 use only §§4.1, 6.6, 6.8, 8.5, 10.1 and ClassicalErgodicTheory §8.5. Only the Checks use Layer 9.

Changes:
- §10.2 *Needs* → "Layers 6.8, 8.4, 10.1; Layer 9.1 for the Checks".
- §10.3 *Needs* → "Layers 4.1, 6.6, 6.8, 8.5, 10.1; Layers 9.1 and 9.2 for the Checks".
- P 10.2 loses `target:9.1`; P 10.3 loses `target:9.2`.

The difference from the review: §10.3's first Check, the constant-roof suspension of the cat map, needs §9.1 (the cat map is a transitive Anosov diffeomorphism) as well as §9.2(a). So 9.1 is named as well as 9.2.

Same pattern elsewhere: P 9.2 had `roadmap:ClassicalErgodicTheory §5.5`, which only its entropy Checks use; the README already labels it "for the entropy Checks". It is removed from P 9.2. §10.4 keeps 9.1, because its statement names toral automorphisms. No other target has a `target:9.x` prerequisite.

## Checks

- **Dependency check** (output):

      candidate: HyperbolicDynamicsAndThermodynamicFormalism is not in the merge order yet; checked as if placed after ArithmeticDynamics (the intake inserts it when its design is accepted)
      depcheck: 245 roadmaps, 2237 edges, 0 problem(s)

  There is no UPWARD or CYCLE line.
- **Citations resolve:** "Cross-roadmap citations found nowhere: None. Lean names found nowhere: None." The tool did not check names outside TauCetiRoadmap. I checked by hand, at the pins, every new Mathlib and Tau Ceti name: `UnitAddTorus`, `piChartedSpace`, `ModelWithCorners.pi` (`Mathlib/Geometry/Manifold/IsManifold/Basic.lean`:521), `TauCeti.instIsManifoldPi` and `TauCeti.extChartAt_pi`. The Mathlib pin is `1b1ccf4b…` and the Tau Ceti pin `2fd255d9…`.
- **Plan:** 45 targets; every `target:` prerequisite is earlier than its consumer; every target has at least three tests (§6.3 now has four).
- **Style scan of the README:** no LaTeX delimiters, machine paths, pull-request numbers or process words.

## Adversarial pass on the changed statements

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| §9.1 carrier `UnitAddTorus (Fin n)` with `TauCeti.instIsManifoldPi` | n = 0; n = 2 (cat map); the binary-product alternative | `Fin 0 → UnitAddCircle` is one point with model `Fin 0 → ℝ` = 0, matching the fourth Check (det of the empty matrix 1, entropy 0). For n = 2 the transition maps are products of circle transitions (integer translations), analytic for `n = ω`. `IsManifold.prod` would give (ℝ/ℤ) × (ℝ/ℤ), which is not the type `UnitAddTorus (Fin 2)` of ClassicalErgodicTheory's `toralEndomorphism` | Holds |
| §6.3 route bound m(M + 2) | m = 1; the swap (m = 2, M = 0); n_j = r_j = 0; σ × ℤ/2 with k = 4, 5 | m = 1: τ ∈ [M, M + 1] ≤ M + 2. Swap: (a,1),(a,1) gives τ = 2M + 1, odd, so 1 + τ is even as needed; (a,1),(b,1) gives τ = 2M + 2, so 1 + τ is odd. n_j = r_j = 0: L_j = 1, so the extra term is m and τ ≤ mM + 2m − 1. σ × ℤ/2: route τ ∈ [2k + 4, 2k + 7] ≥ 2k. At k = 5, M + m = 9 < 10 ≤ 18 = m(M + 2); at k = 4, M + m = 8 = 2k | Holds; old bound fails for k ≥ 5 |
| §6.3 residue class | general j | s_{j+1} + r_1 = mA_{j+1} + r_{j+1} ≡ r_{j+1} (mod m), so f^{s_{j+1}}y lies in the piece of x_{j+1} | Holds |
| §5.3 first Check | k = 1, 2; phase 1/2 | Needed τ > 2k: 2 and 4, both outside [0, 1]. With integer T and τ ≈ T, the constrained coordinates are −k, …, n + k and n + T − k onwards, so T ≥ 2k + 1. The phase gap of 1/2 (§6.6 Check) fits within the extra unit | Old text false; new text holds |
| §10.2 Needs | statement, route, three Checks | Route items: 8.4, 10.1, 6.8(a), ClassicalErgodicTheory §8.2. Checks 1–2 use the cat map (9.1); Check 3 (a fixed point) uses no Layer 9 item | Holds |
| §10.3 Needs | statement, route, three Checks | Route items: 8.5, 10.1, 6.8(b), 6.6, ClassicalErgodicTheory §8.5, 4.1. Check 1 uses 9.1 and 9.2(a); Checks 2–3 use neither. The new prerequisites (4.1, 6.6, 6.8, 8.5, 10.1) are all earlier | Holds |
| P 9.2 without ClassicalErgodicTheory §5.5 | (a), (b), (c) and the Checks | (a)–(c) use the mapping torus, `toFlow`, 2.1, 7.1, 7.2, 7.4, 7.5. The rule h(g^t) = \|t\|h(g^1) appears only in Checks 1–2 | Holds |

## Notes for the maintainer

- No name that another roadmap cites has changed. No id was dropped or renumbered.
- The overlap file lists "GeneralizedCohomology §G4.0b … only an open revision defines". That lead is false: main (`1a19c9f`) states G4.0b at `TauCetiRoadmap/GeneralizedCohomology/README.md`:1082. No dependency on an open revision is needed.
- Ownership against open pull requests: this round adds no construction. The torus manifold structure is Tau Ceti's and is cited, not owned.
- Nothing is marked "not actionable in this package".
