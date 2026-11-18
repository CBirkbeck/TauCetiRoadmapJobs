# Review of RegretMinimizationAndEquilibria (pull request #2482 at c604afe)

**Verdict:** accepted

No finding. Incremental re-review of the 29 lines changed since `ee8c93c` (README only; `Suggested.lean` is unchanged).

## Previous findings

- R01 — repaired: 3.2 now reads "Hart and Mas-Colell 2000, Section 4(c), for the no-regret property behind the coarse notion, attributed there to Hannan"; 4.4 reads "The value `−1/18` is proved here"; the three unlocated works are no longer cited or listed.
- R02 — repaired: 4.1 has three `IsSequenceForm` Checks, 3.3 has two further `deviationPayoff` Checks and the `empiricalDistribution` Check that separates it from the product of averaged marginals; all six recomputed below.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 3.2 citation of Hart and Mas-Colell 2000, Section 4(c) | source text at the locator | HartMasColell2000 lines 464–472 (printed p. 1139): subsection (c) states the no-constant-deviation property (4.1) and attributes it to Hannan 1957 | supports the sentence | none |
| 3.3 `empiricalDistribution` (new Check) | two players, two actions, `(0,0)` at `t = 0`, `(1,1)` at `t = 1`, `T = 2` | `μ = (1/2, 0, 0, 1/2)`; averaged marginals `(1/2, 1/2)` each, product `1/4` on all four profiles | Check true and discriminating | none |
| 3.3 `deviationPayoff` (two new Checks) | matching pennies `M = [[1,−1],[−1,1]]`, `σ t 2 = (1,0)`, `σ t 1 = (1/4, 3/4)` | `M *ᵥ (1,0) = (1,−1)`, independent of `σ t 1`; `1/4·1 + 3/4·(−1) = −1/2`; `U 1 (σ t) = 1/4 − 3/4 = −1/2` | both true; the identity is linearity in slot `i` and needs no simplex hypothesis | none |
| 4.1 `IsSequenceForm` (new Check 1) | `j₀` at the root, `j₁` under `⟨j₀, a⟩`, `b j₀ = (1/2,1/2)`, `b j₁ = (1/4,3/4)` | `x = (1; 1/2, 1/2; 1/2·1/4, 1/2·3/4) = (1; 1/2, 1/2; 1/8, 3/8)`; `1/8 + 3/8 = 1/2`; wrong model `x = b`: sum `1 ≠ 1/2` | true; excludes the unscaled model | none |
| 4.1 `IsSequenceForm` (new Check 2) | same process, `b j₀ = (0,1)` | `x (some ⟨j₀,a⟩) = 0`, so `x` on `j₁` is `0·b j₁ = (0,0)` for every `b j₁` | true; sequence form is not injective in `b` | none |
| 4.1 `IsSequenceForm`, `mem_sequenceFormPolytope_iff` (new Check 3) | one decision point, `b j = (2,−1)` | `x = (1; 2, −1)`: `x none = 1`, `x = 1·b`, flow sum `2 − 1 = 1 = x none`, but `x ≥ 0` fails | true; only the `simplex` clause of the Lean statement excludes it | none |
| 4.4 `kuhnPoker_value` ("the value `−1/18` is proved here") | player 1's family at `α ∈ {0, 1/10, 1/3}` against all 64 pure replies; player 2's strategy against all 64 pure strategies of player 1 (exact rationals) | minimum `−1/18` for each `α`; maximum `−1/18` | holds | none |

The rows for the untouched statements stand as in the previous review, of `ee8c93c`.

- Source locators checked against the text: 1 (HartMasColell2000 lines 464–476, Section 4(c), printed p. 1139). No locator in the README is flagged unverified; the seeded sample falls in the changed passages only at 3.2, 3.3, 4.1 and 4.4.
- No remaining mention of Moulin and Vial, Kuhn 1950 or Hannan 1957 as a citation in the README (searched); the only occurrence of "Hannan" is the attribution at line 460.
- Library declarations and cross-roadmap citations: none added or changed by the diff; the citation resolver lists no cross-roadmap citation found nowhere, and its four Lean-name leads are this roadmap's own `_root_.Matrix.*` declarations in `Suggested.lean`.
- Gate at this head: every check passes (`… depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`; the worker's run also has `build=0`). Dependency check: `depcheck: 236 roadmaps, 2499 edges, 0 problem(s)`; no UPWARD or CYCLE line. Nothing changed outside the roadmap folder.
- Elaboration of `Suggested.lean`: exit 0, 29 `sorry` warnings and nothing else; the file is identical to the one read at `ee8c93c`, so the signature comparison and the one-tactic probe of that review stand.
- Pull request text read against this head: title and description are still correct (a new roadmap, 29 theorems, the same suppliers and boundaries); the change touches nothing they describe.
- Remark: the parenthesis closing 4.4's statement says "proved here" twice.

Overlap check: read FirstOrderOptimization, MathematicalStatisticsFoundations, MarkovChainsAndRenewal; stationary distributions are shared with MarkovChainsAndRenewal Layer 3, which owns stationarity and the irreducible case, while this roadmap owns only existence for an arbitrary finite row-stochastic matrix; nothing else shared, and the change adds no object.

Source independence: changed passages only; 1 passage compared with 1 source (HartMasColell2000), none shared; the six new Checks are computations with no source; largest share CesaBianchiLugosi2006, 5 locators, text not readable; no layer added, removed or reordered, so the arrangement was not compared again.

Research link: Layers 1–3 state results of Blackwell 1956, Hart and Mas-Colell 2000 and Blum and Mansour 2007; Layer 4 states the counterfactual-regret bounds of Zinkevich, Johanson, Bowling and Piccione 2007 and Farina, Kroer and Sandholm 2019, which Tammelin, Burch, Johanson and Bowling 2015 use to solve heads-up limit hold'em. Rests on the README references and the texts read.

## Not verifiable

- The items of the previous review stand (Cesa-Bianchi and Lugosi 2006, Nash 1951, von Neumann 1928, Aumann 1974, Koller, Megiddo and von Stengel 1994: not readable legally); none is in a changed passage. Moulin and Vial 1978, Hannan 1957 and Kuhn 1950 are no longer cited.
- Ownership against the board's packages under review was not checked beyond the index of their names.

## Source issues

- none

## For the human reviewers

- **Scope.** The sources are refereed, in venues of computer science and economics (JMLR, NeurIPS, AAAI, IJCAI, Econometrica, Games Econom. Behav.) besides Pacific J. Math., Ann. of Math. and Math. Ann.; `metadata.toml` gives topic `math.OC`.
- **Attribution.** This head removes the references to Kuhn 1950, Moulin and Vial 1978 and Hannan 1957 instead of locating them; the README still names "Kuhn poker" and coarse correlated equilibria, and states the value `−1/18` as "proved here" with no source.
- **Licence.** The README's Provenance section names four BSD-3 Lean repositories covering regret matching, Nash existence and Blackwell obstructions; `Suggested.lean` was not compared with them declaration by declaration.
- **Not tested.** CesaBianchiLugosi2006, the source with the most locators: neither its text nor its section-level contents could be read; wording and arrangement were checked against its chapter list only, in the previous review.
- **Mathlib deference.** Mathlib pull request 34713, whose name 3.4 adopts, was a draft that a reviewer there called unsuitable as it stood, and 39393 was open with a merge conflict, as of the previous review; not looked at again.
- **Numerical Check.** 4.4 reports a 1000-round self-play run (`−0.05556`, gap `0.0145`), reproduced in the previous review; it is a computation and not a hand-checkable value.
