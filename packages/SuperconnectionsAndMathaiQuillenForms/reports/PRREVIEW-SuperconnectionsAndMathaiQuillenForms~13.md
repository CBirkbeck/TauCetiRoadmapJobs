# Review of SuperconnectionsAndMathaiQuillenForms (pull request #2297 at 907c830)

**Verdict:** needs changes

## R01 (P3) — The description says that the Quillen 1988 locators are missing, but the README gives them

**Location:** pull-request description, "Not read" paragraph: "and Quillen 1988 as stated in its zbMATH review"; first bullet of "Review": "the section and page of Quillen 1988 for the correspondence of 6.1 and for the forms `γ_(2k)` and `γ_(2k−1)` of 6.2, which is not given".

**Claim:** At this head the targets cite Quillen 1988 by section, proposition and page, not through its zbMATH review, so both sentences are false.

**Witness:** `TauCetiRoadmap/SuperconnectionsAndMathaiQuillenForms/README.md:1062`: "(Quillen 1988, §2, p. 214, and Proposition 2.1, p. 215"; README.md:1113–1115: "(Quillen 1988, §5.A: … in (5.1) and Proposition 5.2, p. 222; the class in Proposition 5.5 and its proof, pp. 222–223)".

**Repair:** In "Not read", replace "and Quillen 1988 as stated in its zbMATH review;" with "and Quillen 1988 by §2, p. 214, Proposition 2.1, p. 215, (5.1) and Proposition 5.2 in §5.A, p. 222, and Proposition 5.5, pp. 222–223, locators not checked against its text;". In "Review", replace the first clause of the first bullet with "the Quillen 1988 locators of 6.1 (§2, p. 214; Proposition 2.1, p. 215) and of 6.2 ((5.1) and Proposition 5.2, p. 222; Proposition 5.5, pp. 222–223), which could not be checked against the text;". Also replace "Three points need checking" with "Four points need checking", since the section lists four bullets.

## Previous findings

- None: the review of `ef75c28` had no findings.

## Verified sound

| Statement | Instances tried | Left side computed | Right side computed | Result | Change |
|---|---|---|---|---|---|
| 6.1 `grading_mul_cayley_mul_grading`, `cayley_cayleyInv` (Suggested.lean:430, 437) | `m = n = 1`, `X = [[0, −2], [2, 0]]` (`T = 2`) | `g = (1/5)[[−3, −4], [4, −3]]`; `εgε = (1/5)[[−3, 4], [−4, −3]]` | `g⁻¹ = gᵀ = (1/5)[[−3, 4], [−4, −3]]`; `det(g + 1) = 0.8`; `(g − 1)(g + 1)⁻¹ = [[0, −2], [2, 0]] = X` | Holds; agrees with the README Check at `a = 2` | None |
| 6.1, `W = (1 − X)E⁺` is the graph of `−T`, Quillen's `+1` eigenspace of `gε` (README.md:1061–1063) | `T = 2` as above | `(1 − X)(1, 0) = (1, −2)`; `εg(1, −2) = (1, −2)` | `gε(1, 2) = (1, 2)` (graph of `T`); `ε(1, 2) = (1, −2)` | `ε` carries Quillen's subspace to `W`, as stated | None |
| 6.1, hypothesis `IsUnit (g + 1)` | `g = −1` on `ℂ^(1|1)` | unitary, `εgε = −1 = g⁻¹`, `g + 1 = 0` | `cayley X + 1 = 2(1 − X)⁻¹` is invertible for every skew-adjoint `X` | `−1` is never a Cayley transform, so the hypothesis is needed | None |
| 6.2, `tr(F(dF)^(2k)) = 2^(2k+1) k! (2π/i)^k ch_k(W)` (README.md:1111–1115) | `dP = A + B`, `A = P dP(1 − P)`, `B = (1 − P)dP P`; `ℂP¹`, `k = 1` | `tr((1 − P)(dP)^(2k)) = tr((BA)^k) = −tr((AB)^k)`, so `tr((2P − 1)(dP)^(2k)) = 2 tr(P(dP)^(2k))`; `∫ tr(P(dP)²) = 2πi` | `2³ · 1 · (2π/i) · c₁ = 8 · (2π/i)(−1) = 16πi = 8 · 2πi` | Agrees | None |

The rows for untouched statements stand as in the previous review, of `ef75c28`.

- Diff since `ef75c28`: 0 lines in the folder (unchanged since `abc8ad9d`; `Suggested.lean` since `0c22c1ff`). The head merges main `e6f6358d`; `git diff origin/main...HEAD` outside the folder is empty, and `lake-manifest.json` is unchanged (Mathlib `1b1ccf4`, Tau Ceti `2fd255d`).
- Description against this head (apart from R01): it lists 3 files and `topic = "math.DG"`, as at the head. Its imports match. It has 16 sorried theorems, 28 definitions and instances and 5 proved theorems (49 in all). Its supplier list matches README.md:193–281. GeneralizedCohomology G4.0b is on main `276e711` (its README.md:1082). RandomMatrices §8.5 (:1295), SA-D24/SA-D27 (:1127, :1131), HeegaardFloer F0.0 (§2.2, :1388) and NoncommutativeGeometry N1–N2 (:479, :795) all resolve.
- Library names in the description: 13 Mathlib and 11 Tau Ceti names resolve at the pins. Examples: `Graded/Internal.lean:182`, `CliffordAlgebra/Prod.lean:54`, `Manifold/SmoothEmbedding.lean:70`, `Matrix/BilinearForm.lean:93`, Tau Ceti `SpecialFunctions/Exponential.lean:267, :378`, `DifferentialForm/Smooth.lean:479`.
- Source claims in the description, 5 checked: Garcia2018 (A.9), p. 24, cites Berline–Getzler–Vergne Prop. 1.41 (Garcia2018 lines 1113–1114, reference 2 at line 1170); (A.11), p. 24 (line 1128); (A.15), p. 25 (line 1145); Wu2006 §3.1, the universal Thom form, p. 3 (Wu2006 lines 284, 346).
- Cross-roadmap: the ten cited roadmaps did not change on main between `4d169a9` and `276e711`. The six roadmaps main gained in that time have 0 hits for superconnection, supertrace, Berezin, Pfaffian, Mathai, Thom form, Cayley transform or McKean. The overlap lead on G4.0b is false: G4.0b is on main.
- Dependency check: `depcheck: 245 roadmaps, 2234 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Gate: in the worker's run every check is 0, `build=0`, `OK`. A rerun against the public merge order reports only `depcheck: NOT IN ORDER`, which is expected: a new roadmap is placed after its last supplier.
- Elaboration: `lake env lean` of `Suggested.lean` at the pins gives 16 `declaration uses sorry` warnings (lines 211–437) and nothing else. The 10 signature leads are unused `Fintype`/`DecidableEq` instances, as before.

Overlap check: read RationalHomotopyModels, SpinGeometry, CalibratedGeometry, IndexTheory; nothing shared. A search by object over the open heads and main finds no second owner. Hits at MotivesAndAlgebraicCycles README.md:483, StableHomotopyKTheoryPartII README.md:691 and EllipticCohomology README.md:1701 are other objects: a supertrace on cohomology and homotopy-theoretic Thom objects.

Source independence: changed passages only. No passage of the folder changed, and the description sentences checked are locators, not source wording. Largest share: Wu2006, 23 of 55 locators, as in the previous review. No layer was added, removed or reordered, so the contents comparison stands.

## Not verifiable

- Quillen1988 §2, p. 214; Proposition 2.1, p. 215; §5.A, (5.1) and Proposition 5.2, p. 222; Proposition 5.5, pp. 222–223 (README.md:1062, 1113–1115): settled as uncertified, not requested again.
- BGV1992 §9.1 (Theorem 9.2, p. 272; Corollary 9.6, p. 276; Theorem 9.7, p. 277), §1.3, §1.4, §1.6 and Proposition 1.41: settled as uncertified.

## Source issues

- none

## For the human reviewers

- **Not tested.** BGV1992 (18 locators) and Quillen1988 could not be read. The BGV §9.1 locators at README.md:820–825 and the Quillen 1988 locators at README.md:1062 and 1113–1115 are unchecked against the texts.
- **Licence.** The description lists Berline–Getzler–Vergne Ch. 9 under "Read in open copies", as "page images of the author's own printed copy of the 1992 edition". `packages/SuperconnectionsAndMathaiQuillenForms/sources.toml` records BGV1992 as uncertified (paywalled).
- **Licence.** README.md cites Knuth (arXiv:math/9503234) and Harvey–Lawson (arXiv:math/9407216); `packages/SuperconnectionsAndMathaiQuillenForms/sources.toml` has no entry for either.
