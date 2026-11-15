# Review of MathematicalStatisticsSemiparametric (pull request #2378 at c096627)

**Verdict:** needs changes

Incremental re-review of the 82 lines changed since `b2960a7`.

## R01 (P3) — the Foundations sections named in the scope and the contract no longer match what is consumed

**Location:** `TauCetiRoadmap/MathematicalStatisticsSemiparametric/README.md` lines 88–91: "i.i.d. families, the weak law of large numbers, Slutsky's lemma, the `o_P` algebra and contiguity basics: [MathematicalStatisticsFoundations](../MathematicalStatisticsFoundations/README.md), 8.2–8.6"; line 217: "8.4: Slutsky's lemma without separability"; line 1345: "Foundations 8.3–8.5".

**Claim:** This head deletes the contract's 8.2 bullet and the last `*Needs:*` citations of Foundations 8.2 and 8.4. The scope still names 8.2, and the contract and the Layer 6 dependencies still name 8.4, which no target consumes.

**Witness:** `*Needs:*` lines cite Foundations only at line 554 (8.5, 8.6), 942 (8.3, 8.5) and 996 (8.3, 8.6). "Slutsky" occurs only at lines 88, 217 and 230; line 230 is MathematicalStatisticsAsymptotic 1.1.

**Repair:** Lines 88–91: "i.i.d. families, the weak law of large numbers, the `o_P` algebra on one probability space and contiguity basics: [MathematicalStatisticsFoundations](../MathematicalStatisticsFoundations/README.md), 8.3, 8.5, 8.6;". Delete line 217. Line 1345: "Layers 1–5; Foundations 8.3, 8.5." In the pull request's description, replace the Foundations item by "the `o_P` algebra on one probability space, i.i.d. families with the weak law of large numbers, and contiguity (its 8.3, 8.5, 8.6)". If a route does use Slutsky's lemma on one probability space, keep line 217 and add "Foundations 8.4" to that target's `*Needs:*` line instead; line 91 then reads "8.3–8.6".

## Previous findings

- R01 — repaired: line 228 "**Convergence on varying spaces** (1.1): `TendstoInProbability` and boundedness in probability along a filter, the algebra of convergence in probability on varying spaces … (2.3, 4.2, 4.4, 5.2, 5.3)"; the five `*Needs:*` lines cite Asymptotic 1.1. The repair left the ranges of R01 above.
- R02 — repaired: both declarations are gone from `Suggested.lean`; README line 348 "`Ĩ` is positive definite iff the efficient scores are linearly independent in `L²` (Mathlib `Matrix.posDef_gram_iff_linearIndependent`)"; line 1420 "**Stationarity.** If `θ*` is an interior point".
- R03 — repaired: the Mathlib pull-request bullet is deleted; lines 1058–1059 "`1.016` under `N(0, 1)`, against the bound `1`.", line 1063 "so `I_η = π²`.", lines 1465–1466 "`= 0.24197`, not `1`."

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.3 positive definiteness of `Ĩ`, now cited to Mathlib | uniform on 3 points, `ℓ₁ = (1,0,-1)`, `ℓ₂ = (1,-1,0)`; `N = ∅` and `N = {(1,-1,0)}` | `N = ∅`: Gram `[[2/3,1/3],[1/3,2/3]]`, det `1/3`, independent. `N = {ℓ₂}`: `ℓ̃ = ((1/2,1/2,-1), 0)`, Gram `[[1/2,0],[0,0]]`, det `0`, dependent | both sides agree; `efficientInformationMatrix` unfolds to `Matrix.gram ℝ` of the efficient scores | none |
| 7.2 stationarity, now a bullet without a Lean name | normal example of 7.1, `Q(θ ∣ θ') = -(1 + (θ - θ')²)/2 - log(2π)/2` | maximizer of `Q(· ∣ θ*)` is `θ*`, `∇Q = 0`; `L` is constant, `∇L = 0`; multinomial: `∇L(0.626821) = 0` | holds; Fermat's rule on its hypotheses | none |
| 5.2, 5.3 `√n`-consistency, now cited to Asymptotic 1.1 | `√n (x̄ₙ - θ)` on `Fin n → ℝ` under `N(θ,1)^n`; `n (x̄ₙ - θ)` | law `N(0,1)` for every `n`, bounded along `atTop`; law `N(0,n)`, not bounded: the Checks of Asymptotic 1.1 for `IsBoundedInProbabilityAlong` | the cited section states the varying-space notion used | none |
| 2.3, 4.2, 4.4 varying-space algebra, now cited to Asymptotic 1.1 | each item of README lines 228–232 against Asymptotic 1.1 at its open head | sums and constant multiples, `O_P(1) · o_P(1) = o_P(1)`, transfer to a contiguous sequence, Slutsky's lemma in two forms: all five are bullets of 1.1 | contract matches the supplier | none |

The rows for untouched statements stand as in the previous review, of `b2960a7`.

- Source locators checked against the text: 0. The changed passages add no locator; those of the sample that lie in changed sections (4.4, 5.2, 7.2) are under `## Not verifiable`.
- Library declarations opened at the pins: `Mathlib/Analysis/InnerProductSpace/GramMatrix.lean:121` (`Matrix.posDef_gram_iff_linearIndependent`, stated for `gram 𝕜 v` over `RCLike 𝕜`); the new `#check` pin elaborates.
- Cross-roadmap citations resolved at the open heads: MathematicalStatisticsAsymptotic 1.1 (heading "Convergence on varying spaces") and MathematicalStatisticsFoundations 8.2–8.6 (headings present); the worker's citation list reports none missing.
- Gate: every check passed. Dependency check: `depcheck: 246 roadmaps, 2241 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the folder.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with 80 `sorry` warnings and nothing else. The diff changes no signature: it deletes two theorems and adds one `#check`, so the `#check @name` comparison of the previous review stands for the 122 remaining declarations.
- The pull request's text against the head: "its 80 theorems are admitted" agrees (80 `theorem`s); the Asymptotic item names boundedness in probability, the `o_P` algebra and Slutsky's lemma on varying spaces, as the contract now does; the Foundations item is in R01.
- Overlap check: read MathematicalStatisticsAsymptotic, MathematicalStatisticsNonparametric, MathematicalStatisticsFoundations, MathematicalStatisticsHighDimensional, PointProcesses, StandardDistributions, OptimalTransport, StochasticCalculus; nothing shared. HighDimensional's debiased lasso inference is a different object from the one-step and cross-fitted estimators here.
- Source independence: changed passages only: 0 passages compared with 0 sources, since the changed passages are supplier lists, `*Needs:*` lines and punctuation with no source-derived prose; largest share van der Vaart 1998, 37 of 72 locators, text not readable; no layer added, removed or reordered, so the contents were not compared again.

## Not verifiable

- 4.4, 5.2 and 7.2 (changed `*Needs:*` lines and the stationarity bullet): van der Vaart; Bickel–Klaassen–Ritov–Wellner, §7.8; Little–Rubin, Theorem 8.2, p. 195: not readable; the previous review's lookup through the sources service found no legal copy of any of the four books, and it was not repeated.
- All other locators: as in the previous review, not readable.
- Ownership against the board's packages was checked only through the index given.

## Source issues

- none

## For the human reviewers

- **Not tested.** van der Vaart, *Asymptotic Statistics* (37 of 72 locators), and the three other books could not be read: wording and arrangement were not compared with any source text or table of contents.
- **Licence.** `README.md`, section "Prior formalization", says the headlines of Layers 3–6 are formalized in the author's `lean-CKSD` (Apache 2.0), `CKSD/Asymptotics/`; the names and statements of `Suggested.lean` were not compared with that repository.
