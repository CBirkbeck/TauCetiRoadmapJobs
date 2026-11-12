# Review of Yamabe (pull request #2248 at 263a8ce)

**Verdict:** needs changes

## R01 (P3) — 4.1's first Check claims Scal(p)=0 needs N≥5

**Location:** `TauCetiRoadmap/Yamabe/README.md` 4.1, line 816: "With N=2 the factor 1 is already normalized, yet Scal(p)=6≠0, so the scalar conclusions need N≥5".

**Claim:** The N=2 computation does not show that N≥5 is needed, and for Scal(p)=0 and dScal(p)=0 the claim is false: they hold from N=3 and N=4 respectively. Only the Weyl-norm identity needs N≥5. The previous R01's claim, "at orders below 5 the scalar conclusions are false", overstated this.

**Witness:** LeeParker1987 lines 951–953 (Lemma 5.5, p. 60) give the r² coefficient of `det g` as −Ric(p)/3, so N=3 forces Scal(p)=0. With the r³ coefficient, lines 1018–1019 give dScal(p)=0 at N=4. `e^(2r⁴)δ`: W=0, N=4, `Σ∂ᵢ²Scal(0)=−480` (n=3).

**Repair:** Replace lines 815–818 with:
"- The unit S³ in its own geodesic normal coordinates has `det g=(sin r/r)^4=1−2r²/3+O(r⁴)`. With N=2 the factor 1 is already normalized, yet Scal(p)=6≠0. By the expansion of `det g` (Lee–Parker, Lemma 5.5, p. 60), N≥3 forces Ric(p)=0 and N≥4 adds dScal(p)=0. The Weyl-norm identity needs N≥5: the flat metric times `e^(2r⁴)` has W=0 and `det g=1+O(r⁴)`, yet `Σ∂ᵢ²Scal(p)=−16n(n−1)(n+2)≠0`. For N≥3 a conformal factor is needed. The round metric is conformal to the flat metric near the pole, whose coordinates have `det g=1` exactly."

## R02 (P3) — The proof of Theorem 5.1 starts on p. 61

**Location:** README 4.1, line 802: "(Lee–Parker, Theorem 5.1, p. 58, proved on p. 62)".

**Claim:** This parenthesis covers the construction of the conformal factor as well as the scalar conclusions. Only the scalar conclusions are proved on p. 62.

**Witness:** LeeParker1987 line 988 (printed p. 61) opens the proof of Theorem 5.1 with the inductive construction giving `det g=1+O(r^N)`. Line 1019 (p. 62) closes it.

**Repair:** Replace "proved on p. 62" with "proved on pp. 61–62".

## Previous findings

- R01 — repaired: "For any pole and prescribed finite order N≥2 … for N≥5, that `Scal=O(r²)` at the pole, so that Scal and dScal vanish there"; the Check at line 819 reads "After normalization with N≥5". The Check the repair added is this report's R01.
- R02 — repaired: line 76 "G2 owns the area formula, spherical surface measure and polar integration"; line 298 "G2: the area and coarea formulas …". Lines 424, 509, 672 and 714 read "G2". No "G2–G3" is left.
- R03 — repaired: lines 136–138 list `Mathlib/Topology/VectorBundle/Riemannian.lean`, `Mathlib/Geometry/Manifold/VectorBundle/Riemannian.lean` and `Mathlib/Geometry/Manifold/Riemannian/Basic.lean`.
- R04 — repaired: the description now says "Eisenhart, Obata 1962 and 1971, Schoen 1989 and Kobayashi are marked uncertified …". It also names main's 11 removed declarations and the restatement as `sphereYamabeConstant_mul_le`.

## Verified sound

| Statement | Instances | This roadmap's side | Computed or source side | Result |
| --- | --- | --- | --- | --- |
| 4.1 orders | unit S³, N=2; `e^(2x₁r²)δ`, N=3; `e^(2r⁴)δ`, n=3, N=4 | `det g=1+O(r^N)` for N≥2; Scal=O(r²) and the Weyl-norm identity for N≥5 | S³: `1−2r²/3+r⁴/5`, Scal=6. N=3: dScal(p)=−40dx₁≠0. N=4: W=0, `Σ∂ᵢ²Scal(0)=−480` | statement holds; Check overclaims (R01) |
| 4.1 Check 1 | N=2, N=3 | "Scal(p)=6≠0, so the scalar conclusions need N≥5" | LeeParker1987 lines 951–953: the r² coefficient is −Ric(p)/3, so N=3 gives Scal(p)=0 | R01 |
| 4.1 locator | the proof of Theorem 5.1 | "Theorem 5.1, p. 58, proved on p. 62" | statement lines 875–880 (p. 58); proof lines 988–1019 (pp. 61–62) | R02 |
| 4.1 "N large" sentence | error term of `det g` | "N large enough that the error term of `det g` does not enter (Lee–Parker, p. 62)" | LeeParker1987 lines 1047–1051 (p. 62): errors O(r^N) with N arbitrarily large, treated as inconsequential | agree |
| 4.2 with N≥5 | N=5; n=6, 7, 8 | error of `det g` below the main terms ε⁴log(1/ε) (n=6) and ε⁴ (n≥7) | numerator errors δε⁴, ε⁵log(1/ε), ε⁵; denominator error ε⁵ (integrands `s^(N+1−n)`, `s^(N−1−n)`) | agree |
| 4.3 after 4.1 | proof of Lemma 6.4 | "after 4.1's normalization" | LeeParker1987 lines 1162–1174 use `g_rr=det g=1` and S=O(r²) | agree |
| `…_of_weylTensor_ne_zero` (5.1, Theorem B) | S²×S⁴; round S⁶; N=5 | W(X,Y,Y,X)=−3/10; S⁶ has W=0; README uses N≥5 | Scal=14, P=−g/10 and 2g/5; Y(S⁶)=96.297; LP lines 883–897 need dV=dx and S=O(r²) | agree |
| 0.4, 2.2: GMT G2 | unit S³; two distant bubbles | `H³(S³)=2π²`; quotient tends to 69.565 | GMT line 178: `nω_n r^(n−1)`=4·π²/2=2π²; `2^(2/3)·43.823=69.565` | agree |
| Mathlib contract | five carriers | three files, README lines 136–138 | pin: `RiemannianBundle` 420, `IsContinuousRiemannianBundle` 60, `IsContMDiffRiemannianBundle` 68, `ContMDiffRiemannianMetric` 245, `IsRiemannianManifold` 80 | agree |
| Description | References; Y4 bullet | "Y4.2–Y4.3 and Y5 use those coordinates with N ≥ 5"; uncertified list | head: lines 805, 828, 843, 889; README lines 1285–1313 | agree |

The rows for statements this change does not touch stand as in the previous review, of `9711109`.

- **Source locators:** 6 checked in LeeParker1987 (printed page N is text page N−36). They are Theorem 5.1 (p. 58), Lemma 5.5 (p. 60), the proof of Theorem 5.1 (pp. 61–62), the remark on error terms (p. 62), the proof of Theorem B (pp. 58–59), and Lemma 6.4 with its proof (pp. 64–66). All agree except R02.
- **Library declarations at the pin:** 5 opened in Mathlib: `Topology/VectorBundle/Riemannian.lean` lines 60 and 420, `Geometry/Manifold/VectorBundle/Riemannian.lean` lines 68 and 245, and `Geometry/Manifold/Riemannian/Basic.lean` line 80.
- **Cross-roadmap citations resolved:**
  - GeometricMeasureTheory G2 on main: its heading is at line 148 and its formulas at lines 158–181. No open pull request changes GeometricMeasureTheory.
  - Conformal normal coordinates are owned by no other roadmap, on main or open (searched with `roadmaps grep`).
- **Gate:** rerun at 263a8ce, every check is 0 and the result is OK. The dependency check gives `depcheck: 206 roadmaps, 1900 edges, 0 problem(s)`, with no UPWARD or CYCLE line. Nothing changed outside the folder.
- **Elaboration:** `lake env lean TauCetiRoadmap/Yamabe/Suggested.lean` gives 16 `sorry` warnings and nothing else. `Suggested.lean` is unchanged since 9711109, so the earlier checks still stand: the `#check @` comparison (no binder lost) and the one-tactic probe (none closes).
- **Overlap check:** read PositiveMass (main, #2247), RiemannianGeometry (main, #2222, still at 90a5c6a) and RicciFlow (main). The owners stand as in the previous review. Yamabe owns conformal normal coordinates, and GeometricMeasureTheory owns spherical measure and polar integration (G2).
- **Remark (untouched text):** 4.1's API says Δ agrees with the Euclidean Laplacian on radial functions "up to order N". The radial drift term is `½∂_r log det g=O(r^(N−1))`.

## Not verifiable

- None among the changed passages. The previous review's list stands: Obata 1962 and 1971, Eisenhart, Aubin 1976a and 1976b, Talenti, Schoen 1984 and 1989, Schoen–Yau, and Kobayashi.

## Source issues

- none
