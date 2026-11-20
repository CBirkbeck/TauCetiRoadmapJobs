# Review of StochasticApproximationAveraging (pull request #2744 at 47fef5e)

**Verdict:** accepted

**Summary.** Accepted: the one finding of the previous review is repaired, and the repair is correct. The largest gain norm at `t = 4000` in the third Check of 1.2 now reads `1.2·10²¹`, which a recomputation at 60, 120 and 200 significant digits confirms, together with the new explanatory sentence (partial products up to `1.3·10⁴¹`, a cancellation of twenty orders of magnitude). The clause added to 3.1 about the deterministic start is true of the source and of the route. Two format notes are carried over from the previous review, neither blocking; the two points for the human reviewers stand.

## N01 — Two sentences describe the state of other roadmaps at the time of writing

"an open roadmap, not on main" (Scope and ownership, line 394) and "which neither library nor any roadmap on main provides" (Summary, line 36, and line 398 in the form "no library or roadmap on main provides") will be out of date once LinearSystemsAndControl merges or a martingale central limit theorem lands (the roadmap MartingaleCentralLimitTheorem plans one). Naming the supplier and its section, and saying only that the martingale central limit theorem is not consumed here, would stay true.

## N02 — The gain comparison of 4.1 carries no source locator

4.1 and the limit `(σ²/a²) · 2ca/(2ca − 1)` of the Checks of 3.1 are derived in the text. Both are classical; a locator to a refereed statement would let a reader check the normalisation `Γ A − ½` against print.

## Previous findings

- R01 — repaired: "computed as `4.5·10³⁵, 9.0·10⁴⁰, 9.1·10³⁸, 1.2·10²¹` at `t = 500, 1000, 2000, 4000`. The last value needs more than double precision" (1.2, third Check, lines 168–170); all four values recomputed.
- C01 — repaired: "`x 0 = x₀` deterministic (as in the source; the route uses only that `x 0` is measurable)" (3.1, lines 252–253); the constant start is kept on purpose and said to be so.
- N01 — not repaired: "an open roadmap, not on main" (line 394); "which neither library nor any roadmap on main provides" (line 36). Written again as N01.
- N02 — not repaired: 4.1 remains "Proved here" with no refereed locator. Written again as N02.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.2 third Check, gain norms | `A = [[1,4],[−4,1]]` as `1 + 4i`, `γ t = (t+1)^(−0.3)`, `t = 500, 1000, 2000, 4000`; 60, 120, 200 digits | `4.51615e35, 9.03928e40, 9.12831e38, 1.24075e21`, maximum at `i = 0`, identical at all three precisions; README `4.5e35, 9.0e40, 9.1e38, 1.2e21` | agrees | none |
| 1.2 third Check, new sentence on precision | same recursion in double precision; largest partial product `∏_{k=1}^{m} (1 − γ k (1+4i))` | double gives `9.379e25` at `t = 4000` (false), first three correct; largest product `1.3002e41` at `m = 1252`; `1.3e41 / 1.2e21 ≈ 10²⁰` | agrees ("about `10⁴¹`", "twenty orders") | none |
| 1.2 third Check, expansion threshold | `|1 − γ(1+4i)|² = 1 − 2γ + 17γ²` | exceeds 1 exactly when `γ > 2/17`; `(t+1)^(−0.3) > 2/17` for `t + 1 < 8.5^(10/3) ≈ 1252`, matching the index of the largest product | agrees | none |
| 3.1 clause "the route uses only that `x 0` is measurable" | scalar `a = 1`, `η = 1/2`, arbitrary measurable start `x 0`, any joint law with the noise | start term `t^(−1/2) B_t (x 0 − x⋆) = (1 − 2^(−t)) (x 0 − x⋆)/√t → 0` pointwise; in general `≤ C' ‖x 0 − x⋆‖/√t` by 1.2; 2.1 asks only `AEStronglyMeasurable (x 0)` | agrees | none |
| 3.1 clause "as in the source" | CutlerDiazDrusvyatskiy line 1522 | the iteration (40) starts from a given point of the set, not a random vector | agrees | none |
| 3.1 README against Lean | `hx₀ : ∀ ω, x 0 ω = x₀` in `tendstoInDistribution_sqrt_smul_averagedIterate_sub` | README "`x 0 = x₀` deterministic"; Lean constant start; docstring "the start is deterministic" | same generality | none |

The rows for the untouched statements stand as in the previous review, of `687b64b`.

- Source locators checked against the text: 1 (CutlerDiazDrusvyatskiy line 1522, the start of iteration (40), for the clause added to 3.1). The seeded targets 1.2 and 3.1 have unchanged locators, read in the previous review.
- Library declarations opened at the pin: none new; the diff changes no Lean statement and names no library declaration.
- Cross-roadmap citations: none in the changed passages; the tools report no citation and no Lean name found nowhere.
- Dependency check: `depcheck: 182 roadmaps, 2068 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks: all passed on this head. Elaboration of `Suggested.lean`: four `sorry` warnings (lines 66, 84, 111, 138) and nothing else; the file is unchanged since `687b64b`.
- No change outside the folder. The pull request's title and description were read against this head: no sentence is contradicted, and the 7 changed lines alter nothing they describe (no heading, declaration or supplier changed).
- Overlap check: read SeriesOfIndependentRandomVariables, MartingaleCentralLimitTheorem, KalmanFiltering, FirstOrderOptimization, ImportanceSamplingAndVarianceReduction, DenoisingDiffusion, MathematicalStatisticsAsymptotic, MarkovDecisionProcesses; nothing shared (as in the previous review; the change adds no object, and the list by results and headings is empty).

Source independence: changed passages only; 2 passages compared with 1 source (the clause on the start in 3.1 against CutlerDiazDrusvyatskiy line 1522; the sentence on precision in 1.2 has no source), none shared; largest share CutlerDiazDrusvyatskiy, 8 of 14 locators; contents not compared again (the diff adds, removes and reorders no layer; independent in the previous review).

Research link: The headline is Polyak and Juditsky (1992), Theorem 2, and Ruppert (1988); Cutler, Díaz and Drusvyatskiy (2024) restate and use it for decision-dependent problems, Duchi and Ruan (2021) for asymptotic optimality, Mou, Li, Wainwright, Bartlett and Jordan (2020) extend it to constant steps. Rests on the README's references and the three texts read.

## Not verifiable

- Polyak and Juditsky (1992), Lemma 1 and Theorem 2: paywalled (SIAM); checked only as Cutler, Díaz and Drusvyatskiy and Duchi and Ruan quote them (previous review; unchanged).
- The "288 random instances" of the fourth Check of 4.1: not reproducible from the text (previous review; unchanged).

## Source issues

- **Error** in CutlerDiazDrusvyatskiy at Assumption B.2 (i), display (41), printed page 28: the source says a constant step below twice the reciprocal of the smallest real part of an eigenvalue is admissible; it should be that every eigenvalue `μ` satisfies `|1 − η μ| < 1` (for `A = diag(1, 10)`, `η = 1` the iteration diverges); affects a stated result.

## For the human reviewers

- **Licence / primary source.** Polyak and Juditsky (1992) is paywalled; neither the author nor either review read it. Lemma 1 and Theorem 2 are cited through arXiv:2207.04173v3 and arXiv:1612.05612v4.
- **Scope.** Layer 4 (the gain comparison) and the `α = 1` limit formula have no refereed locator; the README derives them itself (README sections 3.1 Checks and 4.1).
