# Review of PCurvature (pull request #1747 at 3fad9f2)

**Verdict:** accepted

Incremental re-review of 21 changed lines since 8551139 (README only: one paragraph of *Research context*, lines 718–729). No finding.

## Previous findings

- R01 — repaired: "Over `ℚ`, for `u = a/b` with `a, b ∈ ℤ[x]` primitive, `b` square-free and `deg a < deg b` … (their Theorem 1.3 with `c = 1`; for `u = c·a/b` its list, computed from `a/b`, does not decide: `c/(x² + 1)` …)" (lines 718–727).

## Verified sound

| Statement | Instances | Values each side | Result |
| --- | --- | --- | --- |
| Theorem 1.3 with `c = 1`, as now cited (lines 718–725) | `u = 1/(x² + 1)`; `u = 1/x` | `R = res_x(x² + 1, 1 − 2wx) = 4w² + 1`, `r_n = 4`; `ψ_3 ≠ 0` (`−1` a non-square mod 3), residues `∓i/2`: no algebraic solution, decided. `1/x`: `R = ±(w − 1)`, `ψ_p = 0` all `p`, `y = x` | holds; for `p ∤ res(b, b′)` the residues mod `p` are the roots of `R mod p`, so Theorem 1.2 gives it exactly |
| The witness for free `c` (lines 725–727) | `u = c/(x² + 1)`, `c = Π p`, `p ≡ 3 (4)`, `p < σ`; list = odd `p < σ` | `p ≡ 3 (4)`: `p ∣ c`, `u ≡ 0`, `ψ_p = 0`. `p ≡ 1 (4)`: `i ∈ 𝔽_p`, residues `∓ci/2 ∈ 𝔽_p`, `ψ_p = 0`. Over `ℚ`: residues `∓ci/2 ∉ ℚ` | as stated: zero `p`-curvature at every listed prime, no algebraic solution |
| The witness is outside the restricted statement | `a = c`, `b = x² + 1` | content of `a` is `c ≥ 3` (`3 < σ`), so `a` is not primitive | the restricted sentence is not refuted by it |
| 4.3 `honda` beside "a finite and explicit set of primes suffices in 4.3" | `a = 1/(2x)`; `a = 1/(x² + 1)` | `ψ_p = ((1/2)^p − 1/2)·x^{−p} = 0` at odd `p`; `n = 2`, `f = x`. `ψ_p ≠ 0` at `p ≡ 3 (4)`, residues irrational, no `n, f` | statement untouched; consistent with the new sentence (`1/(2x)` has `b = 2x` not primitive, so lies outside it, as the sentence says) |

All other rows stand as in the previous review, of 8551139.

- Source locators checked against the text, 5: FurnsinnPannier lines 97–103 (Theorem 1.2), 112–119 (Theorem 1.3: `a, b` primitive, `c ∈ ℚ`, `b` square-free, `deg b > deg a`, primes not dividing `Δ_b` below `σ`), 197–200 (Rothstein–Trager, simple poles and `deg a < deg b`), 275–277 (the reduction to `c = 1`), 87–91 (Katz 1982, §9, as they report it). No target of the seeded sample falls in the changed passage.
- The diff changes no statement, no heading, no `*Needs:*` line, no supplier citation and no Lean declaration; `Suggested.lean` is unchanged since 8551139, so signatures, headlines and padding stand as before. The reference entry (lines 783–786) and line 736 agree with the paragraph.
- Title and description against the head: no sentence contradicted. "Fürnsinn–Pannier (Math. Comp. 2026; arXiv:2510.00892) is cited in Research context only, for the effective form of Honda's theorem" matches lines 718–729; `git diff --stat origin/main...HEAD` outside the folder is empty (the files listed as changed since 8551139 come from the merge of main).
- Gate (the worker's record at this head): every check 0, `build=0`, `OK`.
- Dependency check, run for this review: `depcheck: 245 roadmaps, 2235 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Elaboration, `lake env lean` on `Suggested.lean`: exit 0, 11 `sorry` warnings (lines 71, 97, 109, 114, 119, 138, 160, 167, 174, 200, 224), nothing else.
- Declared gaps: none declared. The two names the citation tool could not find (`DerivedDeRham.smoothCartier`, `SchemeFrobenius.schemeFrobeniusTwist`, README lines 120 and 122) are in untouched text that the earlier reviews passed.

Overlap check: the three closest-roadmap lists are empty (no roadmap to read); nothing shared. No open pull request changes this roadmap, drops an id it cites or defines one it cites.

Source independence: changed passages only, 2 passages compared with 1 source (FurnsinnPannier lines 112–119 and 275–277), none shared (longest common run 4 words, apart from formulas); arrangement not compared again, since the diff adds, removes or reorders no layer.

## Not verifiable

- Katz 1982, §9: not read; the sentence at lines 727–728 was checked only against Fürnsinn–Pannier's report of it (FurnsinnPannier lines 87–91).
- The published *Math. Comp.* version of Fürnsinn–Pannier (doi:10.1090/mcom/4258): behind a paywall, not read; the theorem numbers were checked in arXiv v3, the version the README names.

## Source issues

- **Error** in FurnsinnPannier at Theorem 1.3 (p. 3) and the first step of its proof (§2, p. 7), arXiv v3: the source says the case of a rational factor `c` in `u = c·a/b` reduces to `c = 1`, with `σ` computed from `a/b`; it should be stated for `c = 1` only, since scaling keeps algebraicity but changes the primes of vanishing (`c/(x² + 1)`); affects a stated result.

## For the human reviewers

- Licence: Fürnsinn–Pannier is cited as *Math. Comp.* (2026), doi:10.1090/mcom/4258, with arXiv:2510.00892v3 for the theorem numbers (`TauCetiRoadmap/PCurvature/README.md` lines 783–786), in *Research context* only; the journal version was not read.
- Scope: the README (lines 725–727) states that Theorem 1.3 of Fürnsinn–Pannier fails for a free factor `c`, a correction that no published source makes; the witness is computed in the table above.
