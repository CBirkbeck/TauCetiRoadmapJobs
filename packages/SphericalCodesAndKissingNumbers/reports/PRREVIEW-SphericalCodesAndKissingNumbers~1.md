# Review of SphericalCodesAndKissingNumbers (pull request #3000 at d78083c)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every printed number was recomputed in exact rational arithmetic and agrees (the three expansions, all zonal and Gegenbauer coefficients, the quotients `6`, `240`, `196560`, both Layer 4 systems with their determinants and solutions, the control values `720/143`, `14359/3596`, `20/9`), every locator into Cohn's notes was read at its place, and every cited supplier section and library declaration exists as cited. There are no small corrections and two format notes, neither blocking. Left to the humans: the roadmap can only merge after SpecialFunctionsHigherSpheres, and five of its routes rest on no opened source (they were checked here by computation).

## N01 — The sentence on kissing numbers in the Conventions has a stray `τ`

In the Conventions, under "Kissing numbers" (README line 60), the quoted phrase reads "`τ` configurations of size `τ` exist and none is larger", which says that there are `τ` configurations. "Configurations of size `τ` exist and none is larger" is what `IsGreatest` states.

## N02 — The simplex bound is in the proof of Cohn's Proposition 4.1, not in its statement

In the first Check of 2.1 (README line 185), `|C| ≤ 1 − 1/s` is cited to "Cohn, Lecture 2, Proposition 4.1, p. 25". The proposition states that the regular simplex is the optimal code of `N ≤ n + 1` points; the inequality on the average inner product, from which `|C| ≤ 1 − 1/s` follows for `s < 0`, is in its proof (Cohn2016 lines 970–985). "The proof of Proposition 4.1", as the References section already writes, would be exact.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| Conventions: halving map, `ω_{n,k}` normalisation | `‖x‖=‖y‖=2`, `‖x−y‖=2`; `n=2`, `k≤4`; `n=8,24`, `k≤6` | `(8−4)/8 = 1/2`; `ω_{2,k} = T_k` coefficientwise; `ω_{n,k}·(n−2)_k/k!` equals `C_k^{(λ)}`; `C_6^{(3)}(1) = 462` | agree | none |
| 1.1 definitions and Checks | hexagon; `±e_i`; `s < −1`; strict-inequality variant | distances `2, 2√3, 4`; halved inner products `1/2, −1/2, −1`; cross polytope `0, −1`; strict variant excludes hexagon | true; wrong variant excluded | none |
| 1.2 lattice shell to code | rank 0; Gram `[2]`; `ℤ²`; `A₂`; `E₈` (240 roots enumerated) | `kissingNumber = 0`, empty code in `ℝ⁰`; `{±1}`, `−1 ≤ 1/2`; `B(x,y) ≤ m/2` from `N(x−y) ≥ m`; `E₈`: `{−1:1, −1/2:56, 0:126, 1/2:56}` from all 240 points | true; Lean signature equals README | none |
| 2.1 linear programming bound | `h = t − s`, `n=3`, `s=−1/3`; `c_0 = 0`, `h = t`, `s = 0`; `s ≥ 1`; `s < −1`; `n ≤ 1` | `1 − 1/s = 4` (tetrahedron); control: `n ≤ 0` false; `h(1) ≥ c_0 > 0` makes `s ≥ 1` vacuous; `h(1)/c_0 ≥ 1`; for `n = 1` `ω ≡ 1`, statement still true | true; `c_0 > 0` needed; `n ≥ 2` needed by the route only | none |
| 2.2 equality case | chain with `|C| = h(1)/c_0`; hexagon `k ≤ 4`; `E₈` `k ≤ 8`; tetrahedron `k = 3` | `|C|h(1) = c_0|C|²` forces equalities; `E₈` sums with `y = x` removed: `−1` for `k = 1..7`, `577/143` for `k = 8` (total `720/143`); `1 + 3·11/27 = 20/9` | true; restriction to `c_k > 0`, `k ≤ d` is sharp | none |
| 3.1 plane | expansion; Chebyshev coefficients; cubic control | `t⁴ + 3/2 t³ + 1/4 t² − 3/8 t − 1/8`; `3/8, 3/4, 5/8, 3/8, 1/8`; `(9/4)/(3/8) = 6`; cubic `1/4, 1/2, 1/2, 1/4`, positive on `(−1, −1/2)` | agree | none |
| 3.2 dimension eight | expansion; `c_0..c_6`; Gegenbauer; `ω_{8,1..6}` | `3/320, 3/40, 15/64, 39/80, 399/640, 9/16, 33/128`, sum `9/4`; Gegenbauer `3/320 … 1/1792`; `(9/4)/(3/320) = 240` | agree with every printed value | none |
| 3.3 dimension twenty-four | expansion; `c_0..c_10`; Gegenbauer; leading coefficient | all eleven zonal and Gegenbauer values as printed; sum `2025/1024`; leading coefficient of `ω_{24,10}` `1323008/310155`; quotient `196560` | agree with every printed value | none |
| 4.1 codes of 240 points | matrix `ω_{8,k}(t)`, `k ≤ 3`; solution in equations `k = 4..8` | determinant `15/49`; `(1, 56, 126, 56)` gives `239, −1, −1, −1`, and `−1` for `k = 4..7`; filter counts exclude `x` since `⟨x,x⟩ = 1` | true; Lean equals README | none |
| 4.2 codes of 196560 points | matrix `ω_{24,k}(t)`, `k ≤ 5`; equations `k = 6..12` | determinant `6036849/14327859200`; solution gives `196559` and `−1` for `k = 1..11`, `14359/3596` for `k = 12`; orbits `759 + 24 + 276 = 1059` | true; Lean equals README | none |
| Supplier citations | SpecialFunctionsHigherSpheres 1.2, 3.1, 3.3, 4.1 at its open head | `zonalPolynomial` body identical line for line; `eval_one` for all `n`; harmonic, value and reproducing statements all under `2 ≤ n`, as assumed in 2.1 | as cited | none |

- Source locators checked against the text: 8 into Cohn2016 (Lecture 1 §4 p. 12 at line 426; Lecture 2 Prop. 4.1 p. 25 at line 967; Lecture 4 Thm 4.1 and both polynomials p. 41 at lines 1684–1707; §5 normalisation p. 42 at line 1730; Lemma 5.3 and Cor. 5.4 p. 44 at lines 1820–1839); bibliography entries for Delsarte–Goethals–Seidel, Levenshtein and Odlyzko–Sloane match lines 2357, 2398, 2417.
- Library declarations opened at the pins: 15 of Tau Ceti (13 elaborated with `#check`, the two Leech ones read at `Rank24/Leech/Basic.lean:299` and `Rank24/Leech/MinimalVectors.lean:758`) and 12 of Mathlib (all with `#check`; `toSphere` finite-measure instance at `MeasureTheory/Constructions/HaarToSphere.lean:107`).
- Cross-roadmap citations resolved: SpecialFunctionsHigherSpheres 1.2, 3.1, 3.3, 4.1, 4.4 (open head); LaguerreJacobi 6.2 and LatticePackingsAndPerfectForms Layer 5 and scope exclusions (main); BoundsOnCodes 5.1–5.2, AssociationSchemes 4.1, EquiangularLinesAndTwoGraphs Layer 4, LinearAlgebraMethodInCombinatorics 3.1 (open heads).
- Duplication by object: no spherical code, kissing configuration or Gegenbauer polynomial in the pinned Mathlib or Tau Ceti; Tau Ceti's shell comparison (`Algebra/Module/ZLattice/ModelShell.lean`) does not state 1.2; no other roadmap, open or on main, states a kissing number of `ℝⁿ` or the spherical linear programming bound.
- Automatic checks: all passed. Dependency check output: `depcheck: 133 roadmaps, 1473 edges, 0 problem(s)`; no change outside the folder.
- Elaboration: `Suggested.lean` elaborates with `sorry` as the only warning (8 theorems); the 11 elaborated signatures were compared with the README statements and none lost a binder; the one-tactic probe (`simp`, `rfl`, `exact?`) closes none of the 8 theorems.
- Headline theorems (the bound, its equality case, the three kissing numbers, the two inner-product theorems, the lattice passage) are all stated; nothing is padding.

Overlap check: read SpecialFunctionsHigherSpheres, ThetaSeries, Rank24LatticeConstructions, IntegralLattices, LevelOneAutomorphicFormsForClassicalGroups, LatticePackingsAndPerfectForms, OrthogonalTamagawaAndLatticeMass; zonal polynomials, zonal harmonics and the reproducing property are owned by SpecialFunctionsHigherSpheres and cited (the definition copied under this roadmap's own namespace to make 2.1 statable); lattice minimum, kissing number of a lattice and shell designs are owned by Tau Ceti and LatticePackingsAndPerfectForms and cited; nothing else shared.

Source independence: 9 passages compared with 1 source (Cohn2016), none shared beyond formulas the mathematics forces; largest share Cohn2016, all 8 of 8 locators; contents compared with Cohn2016 (five lectures): independent, only 2.1 corresponds to a section of it (Lecture 4, §4).

Research link: Layer 2 is the bound of Delsarte–Goethals–Seidel (1977) and Layer 3 the kissing numbers of Levenshtein (1979) and Odlyzko–Sloane (1979), as presented in Cohn (2016), Lecture 4, §4; rests on the README's references and Cohn2016 lines 1699–1712.

## Not verifiable

- Delsarte–Goethals–Seidel (1977), Odlyzko–Sloane (1979), Levenshtein (1979): not opened; the README cites no locator into them and attributes through Cohn, which was read.
- The third Check of 4.2 (enumeration of the `196560` minimal vectors of the Leech lattice): not re-enumerated; its counts equal the unique solution of the system, which was recomputed, and the orbit count `1059` was recomputed.
- `isPosDef_leechLattice` and `kissingNumber_leechLattice`: read in the pinned source, not elaborated (the module's object file is not built on this worker).

## Source issues

- none

## For the human reviewers

- **Merge order.** The roadmap consumes SpecialFunctionsHigherSpheres 1.2, 3.1, 3.3, 4.1, which is still an open pull request (#2931); the description says so. The cited names were checked at that head today.
- **Licence.** `zonalPolynomial` in `TauCetiRoadmap/SphericalCodesAndKissingNumbers/Suggested.lean` (line 41) is copied from the supplier's `Suggested.lean`, whose README names lean-SFVK (Apache-2.0, by that roadmap's author) as prior formalization of its definitions.
- **Sources.** The statements of 1.2, 2.2, 4.1, 4.2 and the linear programming proof of 3.1 carry no source locator ("Proved here"); the only source opened is an arXiv version of published lecture notes. Their numbers were verified here by exact computation.
