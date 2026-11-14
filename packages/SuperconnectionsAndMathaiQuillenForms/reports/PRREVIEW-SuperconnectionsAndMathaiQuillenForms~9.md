# Review of SuperconnectionsAndMathaiQuillenForms (pull request #2297 at ede1b8b)

**Verdict:** needs changes

## R01 (P3) — The estimate quoted for 4.4 (b) is written in symbols the README never defines

**Location:** TauCetiRoadmap/SuperconnectionsAndMathaiQuillenForms/README.md:820–822: “Theorem 9.2, p. 272, for the estimate `‖e^(−𝓕_t) − e^(−R_[2])‖_ℓ = O(t^(−1/2))` in every `C^ℓ`-norm”.
**Claim:** `𝓕_t`, `R_[2]`, `α`, `D` and `P₀` occur only in this sentence and are not tied to `X`, `∇`, `P_K`, `∇^K`; read as the degree-two part of the curvature, `R_[2]` makes the estimate false.
**Witness:** Point, `T = (2,0,0)`, their `t = s`: `e^(−𝓕_s) = diag(e^(−4s),1,1,e^(−4s)) → diag(0,1,1,0)`; the degree-two curvature is `0`, `e^(−0) = I₄`; the difference has norm `→ √2`, not `O(s^(−1/2))`.
**Repair:** Replace lines 820–824 from “Theorem 9.2” by: “Theorem 9.2, p. 272, for the estimate `‖exp(−𝔸_t²) − P_K exp(−(∇^K)²) P_K‖ = O(1/t)` in every `C^ℓ`-norm on compact subsets, Corollary 9.6, p. 276, for the limit `ch(K, ∇^K)`, and Theorem 9.7, p. 277, for the convergent transgression `ch(𝔸_t) − ch(K, ∇^K) = d ∫_t^∞ str(X exp(−𝔸_s²)) ds`; they write `t^(1/2) X + ∇` for the `𝔸_t` here, so their `t` is the square of this one and their `O(t^(−1/2))` is the `O(1/t)` above).” On the witness: `diag(e^(−4t²),0,0,e^(−4t²)) → 0`. If Theorem 9.2 states something else, cite it without a formula.

## R02 (P3) — The description is written for the previous head and denies the locators this head adds

**Location:** pull request description, Sources: “Berline–Getzler–Vergne by section and chapter pages (4.4 (b) by §9.1, without a theorem number or page)”; first paragraph: “This description is written for the head `fdef9b8e`”; Review, first bullet.
**Claim:** The head contradicts all three, and the description still lists the text of Berline–Getzler–Vergne as not read while the README now cites three of its numbered statements with pages.
**Witness:** README.md:820–823 at `ede1b8b`: “Theorem 9.2, p. 272 … Corollary 9.6, p. 276 … Theorem 9.7, p. 277”.
**Repair:** Write “for the head `ede1b8b7`”; replace the parenthesis by “(4.4 (b) by §9.1, Theorem 9.2, p. 272, Corollary 9.6, p. 276, and Theorem 9.7, p. 277, read in <the copy and edition read>)”; move Berline–Getzler–Vergne §9.1 out of “Not read”, or say how the three locators were obtained; replace the first Review bullet by “the three locators of 4.4 (b) in Berline–Getzler–Vergne §9.1, which the roadmap worker could not check against the text”.

## Previous findings

- R01 — repaired: README.md:820–823 now reads “§9.1, for (b): Theorem 9.2, p. 272, … Corollary 9.6, p. 276, … Theorem 9.7, p. 277”; the gloss added with it is this report's R01, and the description is R02.

## Verified sound

| Statement | Instances tried | Left side computed | Right side computed | Result | Change |
|---|---|---|---|---|---|
| 4.4 (b), limit | Point, `E⁺ = E⁻ = ℂ²`, `T = diag(3,0)`, `t = 1, 2` | `str exp(−t²X²) = (e^(−9t²)+1) − (e^(−9t²)+1) = 0` | `rk ker T − rk ker T* = 1 − 1 = 0` | Agrees | Locators added |
| 4.4 (b), parameter change (README.md:823–824) | `X² = 4` on `K^⊥`, their `t = s`, here `t` | Their `exp(−𝓕_s)` block: `e^(−4s)`; at `s = t²`: `e^(−4t²)` | Here `exp(−t²X²)` block: `e^(−4t²)`; `O(s^(−1/2)) = O(1/t)` | `s = t²` as stated | None |
| 4.4 (b), sign of the transgression | `α(s) = str(𝔸̇_s exp(−𝔸_s²))`, 4.3's rule `d/ds ch = −d α` | `ch(𝔸_t) − lim ch = −∫_t^∞ (d/ds) ch(𝔸_s) ds` | `= d ∫_t^∞ α(s) ds`, the sign README.md:823 writes | Agrees with 4.3's Check on `ℝ²` (`−i dx∧dy`) | None |
| 4.4 (b), quoted estimate, R01 | Point, `T = (2,0,0)` | `exp(−𝓕_s) = diag(e^(−4s),1,1,e^(−4s)) → diag(0,1,1,0) = P_K` | `exp(−0) = I₄` for the degree-two curvature; `P_K exp(−(∇^K)²) P_K = diag(0,1,1,0)` | Undefined `R_[2]`; only the repaired right side agrees | R01 |

The rows for untouched statements stand as in the previous review, of `fdef9b8`.

- Diff since `fdef9b8`: 1 passage, README.md:820–824 (5 insertions, 1 deletion); 0 Lean declarations, 0 headings, 0 `*Needs:*` lines, 0 supplier citations changed; 0 files outside the folder; worktree clean.
- Sources: 0 of the 3 new locators checked against the text (BGV1992 is settled uncertified); seeded target touched: 4.4 only. Wu2006 for (a) is unchanged.
- Cross-roadmap: the overlap lead on GeneralizedCohomology G4.0b is false, G4.0b is on main `4d169a9` (TauCetiRoadmap/GeneralizedCohomology/README.md:939); citation check lists nothing unresolved.
- Dependency check output: `depcheck: 244 roadmaps, 2200 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Gate at `ede1b8b`: every check 0, `build=0`, `OK`.
- Elaboration of `Suggested.lean`: 16 `declaration uses sorry` warnings, nothing else; the file is unchanged since `fdef9b8`, so the 49 signatures and the padding probes stand.
- Remark, no change asked: the References give the 1992 edition with Crossref's chapter range pp. 263–310; pp. 272, 276 and 277 are assumed to be in that same pagination.

Overlap check: read RationalHomotopyModels, SpinGeometry, CalibratedGeometry, IndexTheory; nothing shared by the changed passage, which introduces no object.

Source independence: changed passages only; 1 passage compared with 0 readable sources (its source, BGV1992, is settled uncertified and could not be read); largest share Wu2006, 23 of 55 locators, as in the previous review; no layer added, removed or reordered, so the contents comparison stands.

## Not verifiable

- BGV1992, Theorem 9.2, p. 272, Corollary 9.6, p. 276, Theorem 9.7, p. 277, and that §9.1 contains them: settled uncertified; looked at Springer's front matter (login redirect) and the MPDL catalogue record (403), no open copy found, no renewed request.
- BGV1992 §1.3, §1.4, §1.6, Proposition 1.41 and Quillen1988 §2, §5: as in the previous review, settled uncertified.

## Source issues

- none

## For the human reviewers

- **Not tested.** BGV1992 (now 18 locators with the three added) and Quillen1988 could not be read: README.md:820–823's Theorem 9.2, Corollary 9.6, Theorem 9.7 and their pages, and the wording beside them, are unchecked. The description lists that text as not read.
- **Licence.** README.md:1246–1248 and :1251–1253 cite Knuth (arXiv:math/9503234) and Harvey–Lawson (arXiv:math/9407216); `packages/SuperconnectionsAndMathaiQuillenForms/sources.toml` has no entry for either.
