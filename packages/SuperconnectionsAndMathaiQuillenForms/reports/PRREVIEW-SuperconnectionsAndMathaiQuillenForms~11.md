# Review of SuperconnectionsAndMathaiQuillenForms (pull request #2297 at ef75c28)

**Verdict:** accepted

No findings.

## Previous findings

- R01 — repaired: the description reads “written for the head `abc8ad9d`”, “except 4.4 (b) (by §9.1, Theorem 9.2, p. 272, Corollary 9.6, p. 276, and Theorem 9.7, p. 277, read in the copy of Ch. 9 above)”; “Not read” keeps only Chapters 1 and 10.

## Verified sound

| Statement | Instances tried | Left side computed | Right side computed | Result | Change |
|---|---|---|---|---|---|
| 4.4 (b), estimate and limit (README.md:812–825), at a point | `E⁺ = ℂ²`, `E⁻ = ℂ`, `T = (1 0)`, `∇ = d`, `t = 1, 3` | `exp(−t²X²) = diag(e^(−t²), 1, e^(−t²))`; degree-0 `str = 1` | `P_K exp(0) P_K = diag(0,1,0)`; gap `e^(−t²)` = `0.368`, `1.23e−4`; `rk K⁺ − rk K⁻ = 1 − 0 = 1` | Gap `≤ 1/t`; limit agrees with `ch(K⁺) − ch(K⁻)` | None |
| 2.5 `trace_exp_sub_trace_exp` (Suggested.lean:322) | `T = [[1,2],[0,1]]`, `t = 1`; `T = (1 0)`, `t = 1, 2i`; `m = 0`, `n = 1` | `0.84528 − 0.84528 = 0`; `(e^(−t) + 1) − e^(−t) = 1` at both `t`; `0 − 1` | `m − n = 0`; `2 − 1 = 1`; `−1` | Holds, complex `t` included | None |
| 5.3, Check on `T²` (README.md:987–994) | `s = sin 2πx`, `φ = f dy`, the README's `g_β(u) = (2π)^(−1/2) β e^(−β²u²/2)`, `β = 50` | `∫ g_β(s) s′ dx` near `x = 0`: `1.0000`; near `x = ½`: `−1.0000`; `φ ∧ e = −f g_β s′ dx∧dy` | Tangent-first `∫_Z φ = −∫ f(0,y) dy + ∫ f(½,y) dy`; normal-first gives the opposite signs | Agrees; excludes normal-first | None |
| 4.4, Check `T = z` on `ℝ²` (README.md:853–856) | Koszul rule on `dX = dz̄⊗E₁₂ + dz⊗E₂₁`; `t = 0.5, 1, 3` | `str((dX)²) = 2 dz∧dz̄ = −4i dx∧dy`; `ch(𝔸_t) = −(t²/π) e^(−t²|z|²) dx∧dy` | Integral `−(t²/π)(π/t²) = −1.0` at each `t` | `−1` as stated | None |

The rows for untouched statements stand as in the previous review, of `abc8ad9`.

- Diff since `abc8ad9`: 0 lines in the folder; `ef75c28` merges main `4d169a9`; `git diff origin/main...HEAD` outside the folder is empty; worktree clean. Only the description changed.
- Description against this head: three files, `topic = "math.DG"`, `Suggested.lean` unchanged since `0c22c1ff`, 16 sorried theorems, pins `1b1ccf4`/`2fd255d`, the 4.4 (b) locators (README.md:820–825), Berline–Getzler–Vergne cited by section elsewhere, Quillen 1985 and Mathai–Quillen 1986 only at README.md:1183–1188: all agree.
- Remark, no change asked: the description's Review section announces “Three points” and lists four bullets.
- Cross-roadmap: the overlap lead on GeneralizedCohomology G4.0b is false; G4.0b is on main `4d169a9` (TauCetiRoadmap/GeneralizedCohomology/README.md:1082, graph charts at :1140), as the description says.
- Dependency check output: `depcheck: 245 roadmaps, 2209 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Gate: the worker's run has every check 0, `build=0`, `OK`; a second run against the public merge order reports only `depcheck: NOT IN ORDER` (a new roadmap, placed after its last supplier).
- Elaboration: `lake env lean` of `Suggested.lean` at the pins gives 16 `declaration uses sorry` warnings (lines 211–437) and nothing else; the file is unchanged, so the 49 signatures and padding probes stand.
- Sources: 0 locators changed; no seeded target is touched by a change; BGV1992 is settled uncertified.

Overlap check: read RationalHomotopyModels, SpinGeometry, CalibratedGeometry, IndexTheory; nothing shared. An object search (superconnection, Mathai–Quillen, Berezin integral, supertrace, Thom form, Pfaffian, Cayley transform, McKean) over the open heads and main finds no second owner: MotivesAndAlgebraicCycles README.md:483 (the supertrace on cohomology), CalibratedGeometry README.md:944 and IndexTheory README.md:1351 (Pfaffian normalisations) are other objects.

Source independence: changed passages only; 0 passages of the folder changed, and the description's changed sentences are locators, not source wording; largest share Wu2006, 23 of 55 locators, as in the previous review; no layer added, removed or reordered, so the contents comparison stands.

## Not verifiable

- BGV1992, Theorem 9.2, p. 272, Corollary 9.6, p. 276, Theorem 9.7, p. 277, their placement in §9.1 and the estimate of README.md:821: settled uncertified, no renewed request.
- BGV1992 §1.3, §1.4, §1.6, Proposition 1.41 and Quillen1988 §2, Proposition 2.1, §5.A: settled uncertified.

## Source issues

- none

## For the human reviewers

- **Not tested.** BGV1992 (18 locators) and Quillen1988 could not be read: README.md:820–825's Theorem 9.2, Corollary 9.6, Theorem 9.7, their pages and the estimate attributed to Theorem 9.2 are unchecked against the text.
- **Licence.** The description lists Berline–Getzler–Vergne Ch. 9 under “Read in open copies”, as “page images of a printed copy”; `packages/SuperconnectionsAndMathaiQuillenForms/sources.toml` records BGV1992 as uncertified; the origin of the images is not stated.
- **Licence.** README.md cites Knuth (arXiv:math/9503234) and Harvey–Lawson (arXiv:math/9407216); `packages/SuperconnectionsAndMathaiQuillenForms/sources.toml` has no entry for either.
