# Review of SuperconnectionsAndMathaiQuillenForms (pull request #2297 at abc8ad9)

**Verdict:** needs changes

## R01 (P3) — The description is written for an earlier head and denies the locators the README now gives

**Location:** pull request description, first paragraph: “This description is written for the head `fdef9b8e`”; Sources: “(4.4 (b) by §9.1, without a theorem number or page)”; Review, first bullet: “which is not given because that text could not be read”.
**Claim:** The head contradicts all three, and the description lists the text of Berline–Getzler–Vergne under “Not read” while the README cites three of its numbered statements with pages and restates their content.
**Witness:** TauCetiRoadmap/SuperconnectionsAndMathaiQuillenForms/README.md:820–823 at `abc8ad9`: “Theorem 9.2, p. 272, … Corollary 9.6, p. 276, … Theorem 9.7, p. 277”.
**Repair:** Write “for the head `abc8ad9d`”; replace the parenthesis by “(4.4 (b) by §9.1, Theorem 9.2, p. 272, Corollary 9.6, p. 276, and Theorem 9.7, p. 277, read in <the copy and edition read>)”; take Berline–Getzler–Vergne §9.1 out of “Not read”, or say how the three locators were obtained; replace the first Review bullet by “the three locators of 4.4 (b) in Berline–Getzler–Vergne §9.1 and the estimate quoted from Theorem 9.2, which the roadmap worker could not check against the text”.

## Previous findings

- R01 — repaired: README.md:820–825 reads “the estimate `‖exp(−𝔸_t²) − P_K exp(−(∇^K)²) P_K‖ = O(1/t)` … they write `t^(1/2) X + ∇` for the `𝔸_t` here”; `𝓕_t`, `R_[2]`, `α`, `D`, `P₀` no longer occur.
- R02 — not repaired: the description still reads “written for the head `fdef9b8e`” and “(4.4 (b) by §9.1, without a theorem number or page)”; it is this report's R01.

## Verified sound

| Statement | Instances tried | Left side computed | Right side computed | Result | Change |
|---|---|---|---|---|---|
| 4.4 (b), estimate (README.md:821), at a point | `E⁺ = E⁻ = ℂ²`, `T = diag(2,0)`, `t = 1, 2` | `exp(−t²X²) = diag(e^(−4t²),1,e^(−4t²),1)` | `P_K exp(0) P_K = diag(0,1,0,1)`; difference `√2·e^(−4t²)` = `2.6e−2`, `1.6e−7` | `≤ C/t` | Repaired as asked |
| 4.4 (b), estimate, limit operator and rate | Model `H_t = [[1, t],[t, 2t²]]` (`K` block `a = 1`, coupling `t`, `K^⊥` block `2t²`), `t = 5, 10, 20, 40` | `exp(−H_t)₁₁ = 0.60342, 0.60577, 0.60634, 0.60648`; `t·‖exp(−H_t) − L‖ = 0.432, 0.430, 0.429, 0.429` | `L = e^(−(1 − 1/2)) ⊕ 0`, `e^(−1/2) = 0.60653`; uncompressed `e^(−1) = 0.36788` | Limit is the compressed block; rate exactly `1/t` | None |
| 4.4 (b), compression | Second-order term of `t[∇, X]` against `t²X²` on `K^⊥` | `P∇²P − P∇X(X²)⁻¹X∇P = P∇²P − P∇(1−P)∇P` | `(P∇P)² = P∇P∇P` | Equal | None |
| 4.4 (b), transgression sign (README.md:823–824) | 4.3's rule `d/ds str exp(−𝔸_s²) = −d str(𝔸̇_s exp(−𝔸_s²))`, `𝔸̇_s = X` | `ch(𝔸_t) − lim = −∫_t^∞ (d/ds) ch(𝔸_s) ds` | `d ∫_t^∞ str(X exp(−𝔸_s²)) ds`; at `K = 0`, `t = 1` this is (a)'s primitive | Agrees with (a) and 4.3 | None |
| 4.4 (b), parameter change (README.md:824–825) | `X² = 4` on `K^⊥`, their parameter `s`, here `t` | Their `t^(1/2) X + ∇` at `s`: block `e^(−4s)`; at `s = t²`: `e^(−4t²)` | Here: `e^(−4t²)`; `O(s^(−1/2)) = O(1/t)` | `s = t²` as stated | None |

The rows for untouched statements stand as in the previous review, of `ede1b8b`.

- Diff since `ede1b8b`: 1 passage, README.md:821–825 (5 insertions, 4 deletions); 0 Lean declarations, 0 headings, 0 `*Needs:*` lines, 0 supplier citations changed; 0 files outside the folder; worktree clean.
- Sources: 0 of the 3 locators of the changed passage checked against the text (BGV1992 is settled uncertified); seeded targets touched by the diff: none (4.4 is not in the sample).
- Cross-roadmap: the overlap lead on GeneralizedCohomology G4.0b is false, G4.0b is on main `4d169a9` (TauCetiRoadmap/GeneralizedCohomology/README.md:939); the citation check lists nothing unresolved.
- Dependency check output: `depcheck: 244 roadmaps, 2200 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Gate at `abc8ad9`: the worker's run has every check 0, `build=0`, `OK`; a second run against the public merge order reports only `NOT IN ORDER` (the roadmap is placed after its last supplier).
- Elaboration of `Suggested.lean`: 16 `declaration uses sorry` warnings, nothing else; the file is unchanged since `ede1b8b`, so the 49 signatures and the padding probes stand.
- Remark, no change asked: `ch(K, ∇^K)` at README.md:822–823 abbreviates the statement's `ch(K⁺, ∇^K) − ch(K⁻, ∇^K)` (4.3 for the graded bundle `K`).
- Remark, no change asked: the References give the 1992 edition with Crossref's chapter range pp. 263–310; pp. 272, 276 and 277 are assumed to be in that pagination.

Overlap check: read RationalHomotopyModels, SpinGeometry, CalibratedGeometry, IndexTheory; nothing shared by the changed passage, which introduces no object.

Source independence: changed passages only; 1 passage compared with 0 readable sources (its source, BGV1992, is settled uncertified and could not be read; the passage is a formula in the roadmap's own symbols); largest share Wu2006, 23 of 55 locators, as in the previous review; no layer added, removed or reordered, so the contents comparison stands.

## Not verifiable

- BGV1992, Theorem 9.2, p. 272, Corollary 9.6, p. 276, Theorem 9.7, p. 277, that §9.1 contains them, and that Theorem 9.2 states the estimate in the form README.md:821 gives after the change of parameter: settled uncertified, no renewed request.
- BGV1992 §1.3, §1.4, §1.6, Proposition 1.41 and Quillen1988 §2, §5: as in the previous review, settled uncertified.

## Source issues

- none

## For the human reviewers

- **Not tested.** BGV1992 (18 locators) and Quillen1988 could not be read: README.md:820–825's Theorem 9.2, Corollary 9.6, Theorem 9.7, their pages and the estimate attributed to Theorem 9.2 are unchecked against the text. The description lists that text as not read.
- **Licence.** README.md:1251 and :1256 cite Knuth (arXiv:math/9503234) and Harvey–Lawson (arXiv:math/9407216); `packages/SuperconnectionsAndMathaiQuillenForms/sources.toml` has no entry for either.
