# Review of LefschetzStructures (pull request #1061 at d3b9c22)

**Verdict:** accepted

## Previous findings

- R01 — repaired: README 375–377 now reads “its cut uses only the projectors onto the degrees outside `[i, 2n − i]`, which the descending induction has already made algebraic, whereas `lambdaAlgebraic_of_charpoly` assumes `ProjectorsAlgebraic` and cuts `w` as `π_i w π_{2n−i}` (2.4, Research context).)”

## Verified sound

This is an incremental re-review of the 8 lines changed since `ad5de98`. Only README 373–377 changed: the clause of 1.3's source line that follows “holds automatically”. The lines before it were only rewrapped. `Suggested.lean` is byte-identical, and nothing outside the folder differs from `origin/main`.

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| 1.3 source line: Beilinson's cut « uses only the projectors onto the degrees outside `[i, 2n − i]` » | surface, `n = 2`, `i = 1` (Beilinson's index `n − i = 1`) | His `p_j`, `\|j\| > 1`, project onto `H⁰` and `H⁴`, the degrees outside `[1, 3]`. For `c′` of degree `−2`, `(1 − p_{H⁰}) c′ (1 − p_{H⁴})` keeps only `H³ → H¹` | sound | none |
| The same clause at the boundary | `n = 2`, `i = 0` (Beilinson's index `2`, the start of his induction) | No degree lies outside `[0, 4]`, so no projector is used. A `c′` of degree `−4` is already only `H⁴ → H⁰` | sound | none |
| « which the descending induction has already made algebraic » | `n = 2`, step `i = 1`, using step `i = 0` | Let `c` be the inverse of `L² : H⁰ → H⁴` with no other component. Then `L² c = p_{H⁴}` and `c L² = p_{H⁰}`, both from correspondences | sound | none |
| « whereas `lambdaAlgebraic_of_charpoly` assumes `ProjectorsAlgebraic` and cuts `w` as `π_i w π_{2n−i}` » | `Suggested.lean` 229–235; `ℚ[ξ]/(ξ³)`, `i = 0`, `u = 2Λ² + π_2`, `w = ½u` | `hπ : ProjectorsAlgebraic 𝔄` is a hypothesis. `π_0 w π_4` is `Λ²` on `H⁴` and `0` elsewhere, so it is `LowersDegreeBy 4`. Uncut, `w ξ = ½ξ ≠ 0` | sound | none |
| Beilinson's cut on an inhomogeneous correspondence | `X = ℙ²`, his index `2`, `c′ = [Δ] + [X × X]` | `c′` induces `H⁴ ≅ H⁰` (`ξ² ↦ ξ² + 1`), but there are no projectors to cut with and `c′ ξ = ξ`. Isolating the component needs `c′` of pure codimension | gap in the source; 1.3's `π_i w π_{2n−i}` avoids it | Source issues |
| Cross-reference « (2.4, Research context) » | README 528–540 | README 536 says that 1.3 uses `π_i w π_{2n−i}` and `ProjectorsAlgebraic` « instead ». This agrees with the new clause | sound | none |
| Title and description against this head | 9 sentences against README 307–402, 498–540 and `Suggested.lean` | The Layer 1 sentence still matches 1.2–1.4. « `sorry` as the only warning » holds: 12 warnings, all `sorry`. The change alters nothing the text describes | sound | none |

The rows for the statements this change does not touch stand as in the previous review, of `ad5de98`.

- **Gate.** The worker's gate at `d3b9c22` reports OK, with `build=0`. Re-run with `--build` against the candidate order, every check is 0, `build=0`, OK. Against the default order the only failing check is `depcheck: NOT IN ORDER: LefschetzStructures`, which is not a finding: the candidate order lists the roadmap at line 95, right after MotivesAndAlgebraicCycles at line 94.
- **Dependency check** (candidate order, `--movable`): `depcheck: 245 roadmaps, 2236 edges, 0 problem(s)`. No UPWARD or CYCLE line.
- **Elaboration.** `lake env lean` on `Suggested.lean` exits 0 with 12 `declaration uses sorry` warnings and nothing else. The file is unchanged since `ad5de98`, so the earlier `#check @name` comparison and one-tactic probe still hold.
- **Source locators checked against the text: 1.** README 373–377 against Beilinson2012 lines 242–252 and 286–297 (arXiv:1006.1116v2). README 533–537 was also read against the same lines.
- **Citations resolved:** the internal reference to 2.4's Research context (README 528). The suppliers were re-read at their open heads: MotivesAndAlgebraicCycles §§0.1, 0.2, 0.5, 2.2, 2.3, 7.3 and 7.4, and DeligneWeightsAndPurity §§9.6 and 9.7. The changed passage cites no other roadmap.
- **Remark (untouched text).** In README 534–536, « leaves only its component `H^{d+i} → H^{d−i}` » holds only for `c′` of pure codimension `d − i`. The source leaves this step implicit (see Source issues).

Overlap check: read MotivesAndAlgebraicCycles and DeligneWeightsAndPurity, the two closest open roadmaps (no roadmap on main or by results is listed). The change touches no shared object. Owners are as before: DeligneWeightsAndPurity §9.7 owns the primitive decomposition and pairings. MotivesAndAlgebraicCycles §§0.1–0.2, 0.5, 2.2–2.4 and 7.3–7.4 own correspondences, Weil cohomology and the standard-conjecture predicates, and its scope names LefschetzStructures Layer 2 as their consumer.

Source independence: changed passages only. 1 passage (README 373–377) was compared with 1 source (Beilinson2012 lines 286–297); the longest shared run is 2 words. The largest share is Arapura2006's, 6 of 12 exact locators (Corollaries 2.8, 4.3, 7.2, 7.5, 7.9 and §4), all in research-context prose. The arrangement was not compared again, since no layer was added, removed or reordered.

## Not verifiable

- Kleiman 1994, Theorem 4.1, pp. 14–15, and §5, pp. 16–19 (the sources of 1.2 and 1.4, outside the changed passage). Earlier rounds found no legal copy, and it was not fetched again.

## Source issues

- **Gap** in Beilinson2012 at §2.3, proof of (b), p. 7: the source says that cutting a correspondence `c′` that induces `H^{n+i} ≅ H^{n−i}` by the `1 − p_j`, `|j| > i`, leaves that isomorphism as its only component; it should be first replace `c′` by its codimension-`(n − i)` part, which induces the same isomorphism (on `ℙ²`, `i = 2`, `[Δ] + [X × X]` keeps `1` on `H²`); affects the proof.

## For the human reviewers

- none
