# Review of PositiveMass (pull request #2247 at 90dd731)

**Verdict:** accepted

## Previous findings

- R01 — repaired: `:1134` "## Layer 8: the positive mass theorems and their invariance"; `:1187` "*Needs:* 8.1–8.3; 0.2." This is the repair text the previous report gave, word for word. It introduces no new problem (rows below).

## Verified sound

| Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- |
| 8.4 *Needs:* (`:1187`) | two-ended Schwarzschild, n=3, end swap; its free quotient by `ι(x) = −(m/2)²x/|x|²` | swap: masses (m, m) go to (m, m) by 0.2 `:291`. Quotient: one end, mass m; its double cover has deg = 2 copies of mass m (`:293`). No step uses 0.4's law or `m(g)+2c`. | 0.2 suffices; dropping 0.4 is right |
| 0.2 isometry/cover bullet (`:291`–`293`), cited twice by 8.4 | ends at n=3 and n=2; `λg` on Schwarzschild, n=3 | `π₁(ℝ³∖B̄) = π₁(S²) = 0`, so d copies. At n=2, `z↦z²` on `ℂ∖D̄` is a connected double cover: 1 copy. `λg`: `y=√λx` gives mass `√λ·m = λ^((n−2)/2)m` | holds; n≥3 needed and stated |
| 8.4 sources (`:1183`–`1185`) | LeeParker1987 Theorem 9.6; remark after Theorem 10.3 | line 1691: the mass depends only on g, for τ>(n−2)/2 (isometry invariance). Lines 1802–1809: several ends, each with nonnegative mass; the two-ended orientable double cover | supports both clauses |
| Layer 8 title (`:1134`) | contents of 8.1–8.4 | 8.1–8.3: three positive-mass theorems with rigidity; 8.4: isometry and cover invariance. The conformal blow-up appears only in Examples (`:1199`) and Downstream (`:1208`) | title matches contents |
| 8.4 statement (`:1183`) | trivial cover M ⊔ M of flat ℝ³ | the cover is disconnected, so 8.1's "connected" fails on it; each component meets 8.1 with mass 0 | holds componentwise; remark below |
| 8.1 in Lean (`Suggested.lean:128`, `:154`) | `#check @` both | binders 3≤n≤7, `(n−2)/2<t`, `FiniteEndedAE`, Scal≥0, `Integrable` for `riemannianVolume`, `ConnectedSpace`, `CompleteSpace`; these agree with README `:1138`–`1143` | matches |

The rows for untouched statements (0.1, 0.4, 1.3, 1.4, 2.1–2.3, 3.0, 3.3, 4.2, 5.2, 6.2, 7.1, 8.2, 8.3) stand as in the previous review, of `6d2d7e4`.

- **Source locators read against the text: 2.** `LeeParker1987` line 1691 (Theorem 9.6) and lines 1802–1809 (the remark after Theorem 10.3). Both were read from the AMS open-archive PDF.
- **Cross-roadmap citations resolved.**
  - RiemannianGeometry R5c is at the #2222 head `90a5c6a` (`README.md:3392`).
  - `roadmaps grep` finds no citation of PositiveMass 8.4 or of the Layer 8 heading, on main or at any open head. Yamabe on main cites only the range "P0–P8" (`README.md:48`).
  - Yamabe #2248 cites 0.2 and 0.4 for the lifts of ends (`README.md:932`, `:945`). Neither section changed.
- **Gate and dependency check.** I re-ran the gate on this head: every check returned 0, and it ended `OK`. The worker's gate records `build=0`. The dependency check printed `depcheck: 206 roadmaps, 1896 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- **Lean.** `lake env lean` exits 0, with `sorry` warnings only at `:128` and `:154`. `Suggested.lean` has not changed since `56522b9`.
- **Pull request text.** The description states the retitle of Layer 8 and of 8.4, and the *Needs:* change from 0.4 to 0.2. Both match the head and the computed list of removed and added headings. Its claim that no roadmap cites 8.4 or the Layer 8 heading checks out.
- **Overlap check:** read Yamabe (main and #2248) and RiemannianGeometry (#2222). The isometry invariance of the mass and the lifting of ends to finite covers are owned by PositiveMass 0.2, which Yamabe Y7 consumes. No other roadmap states them.
- **Remark (untouched text).** `Suggested.lean:120` keeps the section comment "Layer 8: theorems", short for the new title. It was equally short for the old one.
- **Remark (untouched text).** 8.4's "finite Riemannian covers" are tacitly connected. Mathlib's `IsCoveringMap` does not require this.

## Not verifiable

- Witten 1981 (8.2): behind the Springer paywall, and marked uncertified. It is untouched by this change.
- Bartnik 1986 (the attribution in 0.2): waived in the manifest, and cited only by its locator.

## Source issues

- none
