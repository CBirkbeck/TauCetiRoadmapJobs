# Review of CompressibleEulerEquations (pull request #2442 at 59271f0)

**Verdict:** accepted

No findings at this head. This is an incremental re-review of the 87 lines changed since 85b68bd.

## Previous findings

- R01 — repaired: `Suggested.lean` now ends §8.2 at `EquationOfState.isGreatest_development_of_solution` (line 465). `#check @…quadraticLaw` gives an unknown identifier. README.md:2352: "*Failure of uniqueness.* For the law `P(ρ, s) = ρ²` on `(0, ∞) × ℝ`, `n = 1`, `t₀ = 0`," with no Lean name.
- R02 — repaired: README.md:188–209 has four API bullets: "Every domain `D` is a uniquely differentiable set (`UniqueDiffOn ℝ D`)", unions and finite intersections, slices, and neighbourhoods. It also has four Checks, among them the infinite intersection and the rejected "open in `𝔐`" definition.
- R03 — repaired: README.md:2068–2070: "the family with `g_0 = U₀ − Ū` and `g_α = 0` for `α ≠ 0` is a family of iterated weak derivatives … the zero family is not one, its `g_0 = 0` differing from `U₀` on `2πℤ`".
- R04 — repaired: the description now reads: "PDE and ComplexKahlerGeometry, on main, and MathematicalStatisticsNonparametric and RelativisticQuantumFieldTheory, still open, are named only to mark scope boundaries: nothing of them is consumed, and none of them is a consumer."

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Conventions: every domain is `UniqueDiffOn ℝ D` | `D = {t ≥ 0, \|x\| < 1 + t}` at `(0, 0.5)`; `D = ∅` | `H₀` convex, interior `(0, ∞) × ℝ ∋ (1, 0)`; `D ∩ W = H₀ ∩ W` with `W ∈ 𝓝 p`; empty case vacuous | holds; `uniqueDiffOn_convex` and `uniqueDiffWithinAt_inter` cited at the right lines | none |
| Unions, finite intersections, `∅` | `W₁ = {\|x\| < 1 + t}`, `W₂ = {\|x\| < 2}`; `H₁` tested as a `0`-domain | `⋃(Wᵢ ∩ H) = (⋃Wᵢ) ∩ H`; `H₁` fails: `(1, 0) ∈ H₁`, but `(1 − δ, 0) ∈ H₀ ∖ H₁` | holds; "fixed `t₀`" is needed | none |
| Slices open for `t ≥ t₀`, empty below | `{t ≥ 0, \|x\| < 1 + t}` at `t = 0, 2, −1` | `(−1, 1)`, `(−3, 3)`, `∅` | holds | none |
| Neighbourhood at points with `t > t₀` | `D = H₀` at `(1, 0)` and at `(0, 0)` | ball of radius `1/2` inside `D` at `(1, 0)`; at `(0, 0)` none, since `(−δ, 0) ∉ D` | holds; `t > t₀` is needed | none |
| The four domain Checks | `(0, 1)`, `(0, 1 + δ)`; `⋂ₘ{\|x\| < 1 + 1/m}`; open `A ⊆ H₀` containing `(0, x)` | `1 ≤ 1` but `1 + δ > 1`; intersection `{\|x\| ≤ 1}` (`\|x\| = 1 + ε` drops once `1/m < ε`); `(−ε, x) ∉ H₀` | all true; each separates the definition from its wrong model | none |
| §1.1 law `P = ρ²` (sample) | `ρ = 1/2`, `ρ = 2` | `∂_ρP = 2ρ`: `1`, `4`; `c = 1`, `2`; positive on `(0, ∞) × ℝ` | holds; ChristodoulouMiao2014 line 606, AbbresciaSpeck2022 lines 165–170, LuoYu2023a line 88 match | none |
| §7.1 continuity Check / `QuasilinearSystem.localWellPosedness` (sample, headline) | `U₀ = 1_{2πℤ}`, `N = n = 1`, `k = 2`, `F = [0, 2π)` | `∫φ′U₀ = 0 = −∫φ·0`; `∫_F U₀² = 0`, so the norm is `0`; zero family: `g₀(0) = 0 ≠ 1`; `U(t, 0) = 1`, `U(t, 0.1) = 0` | holds; `Continuous U₀` is needed | none |
| §8.2 failure of uniqueness | `P = ρ²`, `ρ = 1/2`, `v = ±2` | `c = 1`; `v − c = 1`, `v + c = −1`; at `(2, 0)`: `0 < 1` (in `T_L`), `0 > −1` (in `T_R`); `v = 2` vs `−2` | true; agrees with the §8.2 Check and the Worked example | none |
| §6.2 Check citing it (README.md:1962) | past curve of `U₁` from `(2, 0)` | speeds `[1, 3]`; at `t = 1`, `x ∈ [−3, −1]`, and the slice of `D₂` at `t = 1` is `{x > 0}` | still true | none |
| Headline list (README.md:565–577, docstring, description) | count; `#check @…quadraticLaw` | `14 = 14 =` "fourteen"; unknown identifier | consistent | none |

The rows for the statements this diff leaves untouched stand as in the previous review, of 85b68bd.

- Source locators checked against the cached texts: 3 (the §1.1 sentence). The changed §8.2 paragraph was compared for wording with EperonReallSbierski2019 lines 1195–1210. The diff adds no locator.
- Library declarations opened at the pins: `uniqueDiffOn_convex` (`Mathlib/Analysis/Calculus/TangentCone/Real.lean:80`) and `uniqueDiffWithinAt_inter` (`…/TangentCone/Basic.lean:128`, hypothesis `t ∈ 𝓝 x`). Also `TauCeti.HasWeakLineDerivOn` (`TauCeti/Analysis/Sobolev/WeakDeriv/Basic.lean:212`), which is an integral identity with local integrability, so a function that vanishes almost everywhere has weak derivative `0`.
- Cross-roadmap citations resolved:
  - LorentzianGeometry §7.3, §12.6 at fc070ae;
  - SymmetricHyperbolicSystems §1.2 (`LinearSystem`, `IsSymmetricHyperbolic`) and §2.1 at 6a5cca3. Both heads are unchanged since 85b68bd;
  - MathematicalStatisticsNonparametric §6.2 at ecf3361 and RelativisticQuantumFieldTheory RQFT1 at 564db65, both still open;
  - PDE and ComplexKahlerGeometry on main (ef3d21f).

  Of the resolver's 16 "Lean names found nowhere", 15 are this roadmap's own declarations (each elaborates with `#check`), and one is SymmetricHyperbolicSystems' `IsSymmetricHyperbolic`.
- Gate at 59271f0: every check OK. Dependency check: `depcheck: 255 roadmaps, 2429 edges, 0 problem(s)`. The diff outside the folder is empty. The folder holds README.md, Suggested.lean and metadata.toml.
- Elaboration: `lake env lean` on Suggested.lean gives 14 `declaration uses sorry` warnings (lines 257–535) and nothing else. `#check @name` was run on all 35 declarations. `[NeZero n]` is in all 14 theorem types, and `[DiscreteTopology ↥Λ]` is in the 13 that mention `Λ`. The Lean statements are unchanged apart from the deletion. The one-tactic probe of 85b68bd stands.
- Remark: the ChristodoulouMiao2014 §2.1.2 source issue recorded at 85b68bd still applies. The changed §8.2 paragraph cites it correctly as false on a fixed background.

Overlap check: read LorentzianGeometry, SymmetricHyperbolicSystems, IncompressibleFlows, PDE (main and its open revision), RelativisticQuantumFieldTheory, SobolevPolynomialApproximation and YangMillsConnectionsAndCaloricGauge. The owners stand as at 85b68bd. The domain predicate and its new API are owned here: a search of main and the open heads for the relatively open half-space domain finds no other owner.

Source independence: changed passages only. 7 passages were compared with 4 sources, and none shares wording: the domain API and Checks, the Mathlib contract bullet, the §1.1 sentence, the §7.1 Check, the §8.2 failure item, the Suggested.lean docstring, and the description's dependency sentence. The diff adds no locator and changes no layer. The largest share therefore stands as at 85b68bd: Majda1984, 18 of 113 locators. The contents comparison with ChristodoulouMiao2014 also stands: independent.

## Not verifiable

- None among the changed passages. The items of the previous report are unchanged: Majda1984, Kato1975 and Dafermos2016 are uncertified, and Friedrichs1954, Christodoulou2007, HawkingEllis1973 and ONeill1983 are waived.

## Source issues

- none

## For the human reviewers

- **Not tested.** Majda1984 holds the largest share of locators (18 of 113, README.md). Its text and table of contents could not be read legally, so wording and arrangement were not checked against it.
- **Licence.** LukNotes is unpublished lecture notes, read from the author's Stanford page (manifest `licence_class` author-page). It is cited for eight standard facts (README.md §§4.2, 4.3, 5.1–5.4, 6.1, 7.1).
