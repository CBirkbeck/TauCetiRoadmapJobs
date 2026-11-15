# Review of SuperconnectionsAndMathaiQuillenForms (pull request #2297 at 57e450e)

**Verdict:** accepted

No findings.

## Previous findings

- R01 — repaired: the "Not read" paragraph now reads "and Quillen 1988 by §2, p. 214, Proposition 2.1, p. 215, (5.1) and Proposition 5.2 in §5.A, p. 222, and Proposition 5.5, pp. 222–223, locators not checked against its text"; "Review" says "Four points need checking", and four bullets follow.

## Verified sound

| Statement | Instances tried | Left side computed | Right side computed | Result | Change |
|---|---|---|---|---|---|
| 2.5 `trace_exp_sub_trace_exp` (Suggested.lean:322; README.md:545–551) | `T = (a, b) : ℂ² → ℂ` (`m = 2`, `n = 1`), `s = abs(a)² + abs(b)²`; also `m = 1`, `n = 0` | `tr exp(−tT*T) = 1 + e^(−ts)`, `tr exp(−tTT*) = e^(−ts)`, difference `1`; empty case `1 − 0` | `m − n = 1`; `1 − 0 = 1` | Holds for every `t ∈ ℂ` | None |
| 3.2 `pfaffian`, `factorial_mul_pfaffian`, `pfaffian_sq` (Suggested.lean:383–394) | `r = 0`; `r = 1`, `S = [[0, a], [−a, 0]]`; general alternating `r = 2` | `r = 0`: `skewFormDivPow S 0 = 1`, `berezin 0 1 = 1`; `r = 1`: `Pf = a`, `Pf² = a²`; `r = 2`: `s₀₁s₂₃ − s₀₂s₁₃ + s₀₃s₁₂` (`e₀e₂e₁e₃ = −e₀e₁e₂e₃`, `e₀e₃e₁e₂ = +e₀e₁e₂e₃`) | `det` of the 0 × 0 matrix `= 1`; `det S = a²`; Knuth's (0.8) matching sum, same signs | Holds | None |
| 3.2 `pfaffian_mul_mul_transpose`, alternating hypotheses (Suggested.lean:397) | `r = 1`, `B` = swap (`det B = −1`), `S` not skew; `B = diag(2, 1)`, `S` alternating | Swap: `Pf(BSBᵀ) = s₁₀`; diag: `Pf = 2a` | Swap: `det B · Pf S = −s₀₁`; diag: `2 · a` | Fails unless `s₁₀ = −s₀₁`, so the hypotheses are needed; holds when `S` is alternating | None |
| 3.1 `berezin_map` (Suggested.lean:337) | `n = 2`, `f = diag(a, b)`, `x = e₀ ∧ e₁` and `x = 1`; `n = 0`, `x = 1` | `berezin(ab e₀e₁) = ab`; `berezin(1) = 0`; `berezin 0 1 = 1` | `det f · 1 = ab`; `ab · 0 = 0`; `det` of the 0-dimensional map is `1`, times `1` | Holds | None |
| 6.1 `grading_mul_cayley_mul_grading` (Suggested.lean:430) | `m = n = 1`, `X = [[0, −2], [2, 0]]` (skew-adjoint, odd) | `g = (1/5)[[−3, −4], [4, −3]]`; `εgε = (1/5)[[−3, 4], [−4, −3]]` | `det g = 1`, `g⁻¹ = gᵀ = (1/5)[[−3, 4], [−4, −3]]` | Holds | None |

The rows for the other statements stand as in the previous review, of `907c830`.

- Diff since `907c830`: 0 lines in the folder, which is identical to `abc8ad9d`. `Suggested.lean` last changed at `0c22c1ff`. The head merges main `1a19c9f`. `git diff origin/main...HEAD` outside the folder is empty, and `lake-manifest.json` is unchanged (Mathlib `1b1ccf4`, Tau Ceti `2fd255d`).
- Description against this head: 3 files and `topic = "math.DG"`, as stated. "Nothing outside the folder changes" holds. The 16 sorried theorems, 5 proved theorems and 28 definitions and instances (49 in all), the imports and the supplier list all match the head.
- Cross-roadmap: GeneralizedCohomology G4.0b is on main `1a19c9f`. Its README.md:1082 opens the target, and README.md:1149–1150 cover the graph charts on the finite complex Grassmannians. So the overlap lead ("only an open revision defines it") is false. Since `907c830`, main gained ArithmeticDirichletSeriesPartII, PerfectoidTowers and ProbabilisticAndMetricNumberTheory, and RiemannianGeometry/MinimalSurfaces changed. Searches of these for superconnection, supertrace, Berezin, Pfaffian, Mathai, Thom form, Cayley transform, McKean, Chern character and transgression give 0 hits. None of the cited suppliers changed.
- Dependency check: `depcheck: 245 roadmaps, 2232 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Gate: in the worker's run every check is 0, `build=0`, `OK`. A rerun against the public merge order reports only `depcheck: NOT IN ORDER: SuperconnectionsAndMathaiQuillenForms (insert it after its last supplier)`. That is expected, because a new roadmap is placed after its last supplier.
- Elaboration: `lake env lean` of `Suggested.lean` at the pins gives 16 `declaration uses sorry` warnings (lines 211–437) and nothing else. The 10 signature leads are `Fintype`/`DecidableEq` instances on index types that the declarations do not use.

Overlap check: read RationalHomotopyModels, SpinGeometry, CalibratedGeometry, IndexTheory; nothing shared. A search of the open heads finds superconnection, supertrace, Berezin or Mathai–Quillen only at MotivesAndAlgebraicCycles README.md:483, where the supertrace is on cohomology, a different object. CalibratedGeometry README.md:944 (a Pfaffian–volume comparison for Wirtinger's inequality) and IndexTheory README.md:1351 use a Pfaffian, but neither owns one.

Source independence: changed passages only. No passage of the folder changed, and the description sentences checked are locators, not source wording. Largest share: Wu2006, 23 of 55 locators, as in the previous review. No layer was added, removed or reordered, so the contents comparison stands.

## Not verifiable

- Quillen1988 §2, p. 214; Proposition 2.1, p. 215; §5.A, (5.1) and Proposition 5.2, p. 222; Proposition 5.5, pp. 222–223 (README.md:1062, 1113–1115): settled as uncertified, not requested again.
- BGV1992 §9.1 (Theorem 9.2, p. 272; Corollary 9.6, p. 276; Theorem 9.7, p. 277), §1.3, §1.4, §1.6 and Proposition 1.41: settled as uncertified.

## Source issues

- none

## For the human reviewers

- **Not tested.** BGV1992 (18 locators) and Quillen1988 could not be read. So the BGV §9.1 locators at README.md:820–825 and the Quillen 1988 locators at README.md:1062 and 1113–1115 are not checked against the texts.
- **Licence.** The description lists Berline–Getzler–Vergne Ch. 9 under "Read in open copies", as "page images of the author's own printed copy of the 1992 edition". `packages/SuperconnectionsAndMathaiQuillenForms/sources.toml` records BGV1992 as uncertified (paywalled).
- **Licence.** README.md cites Knuth (arXiv:math/9503234; lines 615–620) and Harvey–Lawson (arXiv:math/9407216; lines 1199–1202). `packages/SuperconnectionsAndMathaiQuillenForms/sources.toml` has no entry for either.
