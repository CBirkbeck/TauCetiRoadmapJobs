# Review of Yamabe (pull request #2248 at 22008fb)

**Verdict:** accepted

## Previous findings

- R01 — repaired: lines 815–820 now read "N≥3 forces Ric(p)=0 and N≥4 adds dScal(p)=0. The Weyl-norm identity needs N≥5: the flat metric times `e^(2r⁴)` has W=0 and `det g=1+O(r⁴)`, yet `Σ∂ᵢ²Scal(p)=−16n(n−1)(n+2)≠0`."
- R02 — repaired: line 803 reads "(Lee–Parker, Theorem 5.1, p. 58, proved on pp. 61–62)".

## Verified sound

| Statement | Instances | This roadmap's side | Computed or source side | Result |
| --- | --- | --- | --- | --- |
| 4.1 Check 1, S³ part | unit S³, N=2 | `det g=(sin r/r)^4=1−2r²/3+O(r⁴)`; Scal(p)=6 | Lemma 5.5 r² term `−Ric_ij xⁱxʲ/3` with Ric=2g gives −2r²/3; Scal=n(n−1)=6 | agree |
| 4.1 Check 1, orders 3 and 4 | N=3, N=4 | N≥3 forces Ric(p)=0; N≥4 adds dScal(p)=0 | LeeParker1987 lines 951–953: r² term −Ric/3, r³ term −Sym∇Ric/6; lines 1018–1019: contraction gives 2dScal(p)=0 | agree |
| 4.1 Check 1, `e^(2r⁴)δ` | n=3, 4, 5 | W=0, `det g=1+O(r⁴)`, `Σ∂ᵢ²Scal(p)=−16n(n−1)(n+2)` | finite differences: −480, −1152, −2240. Ric(0)=∇Ric(0)=0, so `det g=1+(8(n−1)/5)r⁴+O(r⁵)`. Theorem 5.1 needs `Σ∂ᵢ²S=−|W|²/6=0` | agree |
| Sign convention behind that value | round metric `(2/(1+r²))²δ`, n=3, 4 | Rm(X,Y,Y,X)=1, unit sphere Scal=n(n−1) | same conformal scalar formula gives Scal(0)=6.0 and 12.0 | agree |
| 4.1 locator | statement and proof of Theorem 5.1 | "Theorem 5.1, p. 58, proved on pp. 61–62" | statement lines 875–880 (p. 58); proof lines 988–1019 (p. 61 to p. 62) | agree |
| 4.1 statement (cited by the Check) | N=4 against N≥5 | Scal=O(r²) and the Weyl-norm identity for N≥5 | lines 879–880 state both for N≥5. Scal=O(r²) already holds at N=4, a weaker hypothesis, so there is no conflict | agree |
| 4.2 and 5.1 (consumers of 4.1) | N=5 | lines 830 and 891: "4.1 … with N≥5" | N=5 satisfies all three thresholds of the Check (3, 4, 5) | agree |
| Description, Y4 bullet | head lines 799–803 | "states … for N ≥ 5, as Lee–Parker's Theorem 5.1 does" | README 4.1 states the N≥5 normalization; LP lines 879–880 | agree |

The rows for statements this change does not touch stand as in the previous review, of `263a8ce`.

- **Source locators:** 4 checked in LeeParker1987, where printed page N is text page N−36. They are Theorem 5.1 (line 875, p. 58), Lemma 5.5 (line 951, p. 60), the proof of Theorem 5.1 (lines 988–1019, pp. 61–62) and (5.5a–b) with the dScal step (lines 1001–1004, 1018–1019). All agree.
- **Library declarations:** the change touches none. `Suggested.lean` has not changed since `263a8ce`.
- **Cross-roadmap citations resolved:**
  - 4.1's *Needs:* cites RiemannianGeometry R1–R2. Its 2.2, "Normal-coordinate jets", is at line 1384 on main.
  - RiemannianGeometry #2222 is still at `90a5c6a`, and main has no R5c, so the description's "R5c is added by #2222" holds.
- **Gate:** rerun at `22008fb`, every check is 0 and the result is OK; the worker's run has build=0. The dependency check gives `depcheck: 206 roadmaps, 1900 edges, 0 problem(s)`, with no UPWARD or CYCLE line. Nothing changed outside the folder.
- **Elaboration:** `lake env lean TauCetiRoadmap/Yamabe/Suggested.lean` gives 16 `sorry` warnings and nothing else. The file is unchanged, so the earlier `#check @` comparison (no binder lost) and the one-tactic probe (none closes) still stand.
- **Overlap check:** read PositiveMass (main, #2247 at `90dd731`), RiemannianGeometry (main, #2222 at `90a5c6a`) and RicciFlow (main).
  - Conformal normal coordinates belong to Yamabe alone: `roadmaps grep` finds them nowhere else.
  - Normal-coordinate jets belong to RiemannianGeometry 2.2, which 4.1's *Needs:* cites.
- **Pull request's text:** the title and description were read against `22008fb`. The head contradicts no sentence, and the change leaves nothing unstated that a reader needs.
- **Remark (untouched text):** 4.1's API says Δ agrees with the Euclidean Laplacian on radial functions "up to order N". The radial drift term `½∂_r log det g` is O(r^(N−1)).

## Not verifiable

- None among the changed passages. The previous review's list stands: Obata 1962 and 1971, Eisenhart, Aubin 1976a and 1976b, Talenti, Schoen 1984 and 1989, Schoen–Yau, and Kobayashi.

## Source issues

- none
