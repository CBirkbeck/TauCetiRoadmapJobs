# Review of PCurvature (pull request #1747 at 8551139)

**Verdict:** needs changes

Incremental re-review of 58 changed lines since 774be2e (README only: the Kronecker citation in 4.1, the paragraph after 4.3 deleted, two paragraphs of *Research context*, one reference entry). One finding.

## R01 (P3) — Theorem 1.3 of Fürnsinn–Pannier is cited for more than it proves

**Location** `TauCetiRoadmap/PCurvature/README.md` lines 718–726: "Over `ℚ`, a finite and explicit set of primes suffices in 4.3 … a finite list of primes at which the vanishing of the `p`-curvature of `y′ = u y`, `u ∈ ℚ(x)`, decides whether a nonzero algebraic solution exists (their Theorem 1.3)".

**Claim** The list of Theorem 1.3 decides only for `c = 1`. The theorem (v3) writes `u = c·a/b`, `c ∈ ℚ` free, `a, b` primitive, and computes `σ` from `a/b`; the README deleted this caveat at this head.

**Witness** `a = 1`, `b = x² + 1`, `c` = product of the primes `p ≡ 3 (mod 4)` below `σ(4w² + 1)`: `ψ_p = 0` at every listed prime (`u ≡ 0` at `p ∣ c`; `i ∈ 𝔽_p` otherwise), residues `∓ci/2 ∉ ℚ`. FurnsinnPannier lines 112–119, 275–277.

**Repair** Replace lines 718 and 723–726 by: "Over `ℚ`, for `u = a/b` with `a, b ∈ ℤ[x]` primitive, `b` square-free and `deg a < deg b`, a finite and explicit set of primes suffices in 4.3." and "… a finite list of primes at which the vanishing of the `p`-curvature of `y′ = (a/b) y` decides whether a nonzero algebraic solution exists (their Theorem 1.3 with `c = 1`; for `u = c·a/b` its list, computed from `a/b`, does not decide: `c/(x² + 1)` with `c` the product of the primes `p ≡ 3 (mod 4)` below `σ` has zero `p`-curvature at each listed prime and irrational residues); by Katz 1982, §9, …". The witness is then outside the statement (`a = c` is not primitive).

## Previous findings

- The previous report (on 774be2e) had no finding; nothing to account for.

## Verified sound

| Statement | Instances | Values each side | Result |
| --- | --- | --- | --- |
| 4.1 Kronecker (`exists_intCast_eq_of_forall_pow_sub_mem`), with its new citation "Theorem 3.7, applied to the minimal polynomial of `c`" (lines 603–604) | `c = i`; `c = √2`; `c = 3` | `x² + 1`: root in `𝔽_p` iff `p = 2` or `p ≡ 1 (4)`, and `i^p − i = −2i ∉ 𝔓` at `p ≡ 3 (4)`: both hypotheses fail; `x² − 2`: root iff `p ≡ ±1 (8)`; `x − 3` linear, `3^p ≡ 3` | the reduction to Theorem 3.7 is exact: `c^p ≡ c` puts `c mod 𝔓` in `𝔽_p`, a root of the monic minimal polynomial; linear gives `c ∈ ℚ ∩ 𝓞_L = ℤ` |
| Theorem 1.2 as paraphrased (lines 719–721) | `R = 4w² + 1`; `R = w − 1` | `r_n = 4 > 0`; no rational root; modulo `3 ∤ 4`: `w² ≡ 2`, no root; modulo `5`: `w² ≡ 1`, `w = ±1`, splits. `w − 1` splits everywhere | agrees with FurnsinnPannier lines 97–103 |
| Theorem 1.3 as cited (lines 721–724) | `u = 1/(x² + 1)`; `u = c/(x² + 1)`, `c = Π p`, `p ≡ 3 (4)`, `p < σ` | `c = 1`: `ψ_3 ≠ 0`, not algebraic: decided. Free `c`: `ψ_p = 0` at every `p ∤ 4`, `p < σ`; residues `∓ci/2` irrational | fails for free `c`: R01 |
| "whose roots are the residues of `u` when `u` has simple poles and vanishes at `∞`" (lines 722–723) | `u = 1/(2x)`: `a = 1`, `b = 2x`; `u = 1` | `res_x(2x, 1 − 2w) = 1 − 2w`, root `1/2` = residue; `u = 1`: `deg a = deg b`, excluded | agrees with FurnsinnPannier lines 197–200 |
| 4.3 `honda` beside the new sentence "a finite and explicit set of primes suffices" | `a = 1/(2x)`; `a = 1/(x² + 1)` | `ψ_p = ((1/2)^p − 1/2)x^{−p} = 0`, odd `p`; `n = 2`, `f = x`. `ψ_p ≠ 0` at `p ≡ 3 (4)`, residues `∓i/2` | statement untouched; holds |

All other rows stand as in the previous review, of 774be2e.

- Source locators checked against the text, 6: BostanCarusoRoques2024 line 1161 (Theorem 3.7); FurnsinnPannier lines 6–8 (title), 97–103 (Theorem 1.2), 104–109 (the Chudnovskys' proof made explicit), 112–119 (Theorem 1.3), 87–91 (Katz 1982, §9, as they report it). The DOI 10.1090/mcom/4258 is the related DOI of the arXiv record. Of the seeded sample only 4.1 falls in a changed passage.
- The deleted paragraph after 4.3 and the deleted citation of unpublished notes leave no dangling reference: no line of the folder names Theorem 1.1, 2.1 or Propositions 2.2–2.4 of Fürnsinn–Pannier, or the notes; line 733 and the reference entry (lines 780–783) agree with "cited in *Research context* only".
- Title and description against the head: no sentence contradicted. "Fürnsinn–Pannier (Math. Comp. 2026; arXiv:2510.00892) is cited in Research context only" matches lines 718–726 and 733; the source list no longer needs the notes; `git diff --stat origin/main...HEAD` outside the folder is empty; no heading and no Lean declaration changed.
- Gate with the candidate order, run for this review: every check 0, `OK` (the worker's record agrees, `build=0`). Without the order the only line is `depcheck: NOT IN ORDER: PCurvature (insert it after its last supplier)`, not a defect.
- Dependency check: `depcheck: 245 roadmaps, 2235 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line; PCurvature at 43, after FormalConnectionsOpers at 42. The diff changes no supplier citation and no `*Needs:*` line.
- Elaboration, `lake env lean` on `Suggested.lean`: exit 0, 11 `sorry` warnings (lines 71, 97, 109, 114, 119, 138, 160, 167, 174, 200, 224), nothing else; the file is unchanged since 774be2e, so signatures, headlines and padding stand as before.
- Declared gaps: none declared.

Overlap check: the three closest-roadmap lists are empty (no roadmap to read); nothing shared. No open pull request changes this roadmap, drops an id it cites or defines one it cites.

Source independence: changed passages only, 4 passages compared with 2 sources (BostanCarusoRoques2024, FurnsinnPannier), none shared (longest common run 4 words); arrangement not compared again, since the diff adds, removes or reorders no layer.

## Not verifiable

- Katz 1982, §9: not read; the sentence at lines 725–726 was checked only against Fürnsinn–Pannier's report of it (FurnsinnPannier lines 87–91).
- The published *Math. Comp.* version of Fürnsinn–Pannier (doi:10.1090/mcom/4258): behind a paywall, not read; the theorem numbers were checked in arXiv v3, the version the README names. The year 2026 of the journal version was not confirmed.
- Kronecker 1880: not read, as in the earlier reviews.
- Lines 714–716 (the rank-one splitting into a Picard torsion question and a logarithmic-form question) now carry no source; no text was compared.

## Source issues

- **Error** in FurnsinnPannier at Theorem 1.3 (p. 3) and the first step of its proof (§2, p. 7), arXiv v3: the source says the case of a rational factor `c` in `u = c·a/b` reduces to `c = 1`, with `σ` computed from `a/b`; it should be stated for `c = 1` only, since scaling keeps algebraicity but changes the primes of vanishing (`c/(x² + 1)`); affects a stated result.

## For the human reviewers

- Licence: Fürnsinn–Pannier is now cited as *Math. Comp.* (2026), doi:10.1090/mcom/4258, with arXiv:2510.00892v3 for the theorem numbers (`TauCetiRoadmap/PCurvature/README.md` lines 780–783), in *Research context* only; the journal version was not read.
