# Review of HyperbolicDynamicsAndThermodynamicFormalism (pull request #2441 at 6cc594f)

**Verdict:** accepted

Incremental re-review: the roadmap folder has 0 changed lines since `fe970db` (the head merges main). No finding.

## Deferred findings

- D01 — resolved: board `design/plan.json` now has `"gaps": []` (line 2430); the `sphere-bundle-embedding` entry and its target 9.3 prerequisite were removed in board commit `acbcc3e`.
- D02 — resolved: the `connection-map-jacobi-derivative` entry and its target 9.3 prerequisites were removed from the board's `design/plan.json` in the same commit `acbcc3e`.

## Previous findings

- R01 — not repaired: deferred (D01)
- R02 — not repaired: deferred (D02)

## Verified sound

| Target | Instances tried | Statement side | Computed on the instance | Result |
|---|---|---|---|---|
| §7.7 Inverses, iterates and time reversal (seeded sample; cited by §§9.2, 10.3) | cat matrix A = (2 1; 1 1); f = diag(2, 1/2), k = 2; rescaling a > 0, a = 0; time-t map, t = 0 | f⁻¹ exchanges E^s, E^u; f^k has rate λ^k; g(at) has rate aκ; time-t maps not Anosov | A·(1 −1; −1 2) = I; eigenvalues 2.618, 0.382 swap. f² = diag(4, 1/4), rate 1/4. e^(−κ(at)) gives aκ; a = 0 is the identity, excluded. X is bounded both ways, so X ∈ E^s ∩ E^u = 0, contradiction | holds |
| Board plan (D01, D02) | board `design/plan.json` at `acbcc3e` | no declared gap | `"gaps": []` at line 2430; no occurrence of either slug; README of the pull request has no `gap:` | resolved |
| Pull request text | title, summary block, prose, dependency sentence | adds the roadmap; three open and four main suppliers; 0 paths outside | ClassicalErgodicTheory `e3c5108`, GeometryOfNumbersAndQuadraticArithmetic `81b8a64`, ArithmeticDynamics `ae79f44` still open, same heads; four on main; diff against main outside the folder empty | agrees |

The rows of the previous review for the untouched statements stand as in that review, of `fe970db`.

- Folder diff `fe970db`..`6cc594f`: 0 lines; `lake-manifest.json` and `lean-toolchain` unchanged between the two heads, so the pins and all library names checked before stand.
- Gate at `6cc594f`: every check 0, OK (build included). Dependency check: `depcheck: 263 roadmaps, 2577 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on `Suggested.lean` gives 15 `sorry` warnings and no other output.
- Cross-roadmap citations resolved again: the three open suppliers are at the heads the previous review read; on main (`4dc1e15`) GeneralizedCohomology G4.0b, GeometricCurrents G6, RiemannianGeometry R2 and R4.1, ProbabilisticAndMetricNumberTheory §4.1 are present. The citation and overlap tools list nothing missing, dropped or shared.
- Source locators: none re-read (no changed passage); §7.7's only locator is KatokHasselblatt1995, Section 6.4 (uncertified).
- Overlap check: read ClassicalErgodicTheory, ArithmeticDynamics, Varifolds, RiemannianManifoldsWithConvexBoundary, ManifoldOptimization, MathematicalBilliards, RiemannianGeometry (no `Surfaces` folder on main); pressure, equilibrium states, Gibbs, expansive and specification notions: ClassicalErgodicTheory (cited); measure entropy: GeometryOfNumbersAndQuadraticArithmetic (cited); Jacobi fields: RiemannianGeometry (cited); topological Grassmann bundle: GeometricCurrents G6 (cited); nothing else shared.
- Source independence: changed passages only: 0 passages changed, none to compare; the arrangement is unchanged (no layer added, removed or reordered); as in the review of `fe970db`: largest share BowenRuelle1975, 46 of 132 locators; contents compared with BowenRuelle1975: independent.
- Research link: §10.3's unique equilibrium measure of a transitive Anosov flow and §2.1's mixing are the objects in which Tsujii and Zhang (2023) state exponential mixing of three-dimensional Anosov flows; §§7.1, 8.2, 8.4 are what a nonuniform-hyperbolicity roadmap toward Buzzi, Crovisier and Sarig (2022) would import; rests on README "Downstream consumers" and TsujiiZhang2023 lines 123–127, 485–495.

## Not verifiable

- KatokHasselblatt1995 (Section 6.4, cited by §7.7; also Sections 18.1, 18.4, 19.1, Chapter 17), Bowen1975, FH2019, Walters1982, Newhouse1989, BowenWalters1972, HirschPalisPughShub1970: settled as uncertified; their locators were not read.

## Source issues

- **Error** in BowenRuelle1975 at the proof of Theorem 5.1, printed page 192: the source says that when B_z(ε, n) meets B_x(ε, k) with k ≤ n, the ball B_x(2ε, k) contains B_z(ε, n); it should be B_x(3ε, k), by the triangle inequality through a common point; affects the proof.
- **Misprint** in ClimenhagaPesin2016 at Theorem 11.1, printed page 40: the source gives the maps f_n for n ≤ 0 but indexes the family of graphs by all integers and writes Ω_(n+1) for the fixed box; it should use one index set and Ω; affects a stated result.

## For the human reviewers

- The board's `packages/HyperbolicDynamicsAndThermodynamicFormalism/README.md` (lines 127, 799, 814) still words `gap:connection-map-jacobi-derivative`, though its `design/plan.json` now declares no gap; the pull request's README has no such text.
- ClassicalErgodicTheory §5.5 (its open pull request) states that ℝ-transitivity equals a dense forward orbit on compact spaces without isolated points; README.md:475 gives a counterexample. This roadmap does not use that statement.
