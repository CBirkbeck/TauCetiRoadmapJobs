# Review of RegularSplittingsAndMMatrices (pull request #3211 at 20c61f3)

**Verdict:** accepted

**Summary.** Accepted: the one finding of the previous review is repaired. The route of 2.3 now factors the SOR splitting matrix with `K = −ω D⁻¹ L`, and the factorisation, the nilpotency of `K` and the formula for `M_ω⁻¹` were recomputed exactly for `ω = 1/2, 1/3, 1`. The two dependency paragraphs now agree with the `*Needs:*` lines of their targets, and the Stein–Rosenberg paper has a bibliographic entry. There are no small corrections and no format notes; the questions on the two sets of lecture notes remain for the humans who approve.

## Previous findings

- R01 — repaired: "`M_ω = (D/ω)(I − K)` with `K = −ω D⁻¹ L ≥ 0` strictly lower triangular, so `K^n = 0` and `M_ω⁻¹ = (∑_(k<n) K^k)(ω D⁻¹) ≥ 0`" (route of 2.3, README line 199); recomputed, see the table.
- C01 — repaired: "1.1 uses Tau Ceti and Mathlib" (line 133) and "2.1, 2.2 and 2.4 use Tau Ceti" (lines 293–294); both agree with the `*Needs:*` lines at 75, 156, 184, 211 and 279.
- N01 — repaired: the References now list Stein and Rosenberg, J. London Math. Soc. 23 (1948), 111–118, with its DOI, "the origin of 2.4, which is proved here".

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 2.3 route, `K = −ω D⁻¹ L` | `D = I₂`, `L = [[0,0],[−1,0]]`, `ω = 1/2` | `M_ω = [[2,0],[−1,2]]`; `K = [[0,0],[1/2,0]]`; `(I+K)(ω D⁻¹) = [[1/2,0],[1/4,1/2]] = M_ω⁻¹`; the former `K` gave `[[1/2,0],[1/2,1/2]]` | holds | none |
| 2.3 route, size 3 | `A = [[2,−1,0],[−1,2,−1],[−1,−1,3]]`, `ω = 1/2, 1/3, 1` | each `ω`: `A = M_ω − N_ω`, `M_ω = (D/ω)(I − K)`, `K³ = 0`, `(I+K+K²)(ω D⁻¹)·M_ω = I`, least entry of inverse `0`, least entry of `N_ω` `0` | holds | none |
| 2.3 route, size 1 and algebra | `A = [[3]]`, `ω = 1/2`; symbolic | `K = 0`, `M_ω⁻¹ = 1/6`, `N_ω = 3`; `(D/ω)(I + ω D⁻¹ L) = (D + ωL)/ω`; `M_ω⁻¹ N_ω = (D+ωL)⁻¹((1−ω)D − ωU)`, the body of `sorMatrix` | holds | none |
| 2.3 statement (`Suggested.lean` line 118) | compared with the README sentence | `0 < ω`, `ω ≤ 1`, `IsUnit A`, `A⁻¹ ≥ 0`, off-diagonal `≤ 0` in both; unchanged by the diff | agree | none |

The rows for the statements the change does not touch stand as in the previous review, of `ea62f87`.

- Source locators checked against the text: none new; the change adds no locator. The bibliographic data of the new entry (authors, title, journal, volume, year, pages, DOI) agree with the Crossref record the previous review quoted.
- Library declarations opened at the pin: none new; the change names none.
- Cross-roadmap citations resolved: the changed dependency line of Layer 1 names IterativeMethodsForLinearSystems §1.2, on main, as before.
- Dependency check: `depcheck: 94 roadmaps, 1054 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the roadmap folder.
- Elaboration: `Suggested.lean` (unchanged since `ea62f87`) elaborates with eleven `sorry` warnings and nothing else.
- The automatic checks all passed on this head.
- The title and description were read against this head: nothing in them is contradicted (2.4 is still "attributed to Stein and Rosenberg without a locator"; the new entry is bibliographic).

Overlap check: read IterativeMethodsForLinearSystems, PeriodicNonnegativeMatrices, EigenvalueIterations, ConditioningAndPerturbation, KrylovMethodsAndOrthogonalPolynomials, LinearQuadraticControl, EchoStatesAndRandomFeatures (as in the previous review; the change adds no object); the only shared objects are the Jacobi and SOR matrices and the triangular parts, owned by IterativeMethodsForLinearSystems §2.1 and cited here as copied.

Source independence: changed passages only; 3 passages compared with 1 source (the corrected sentence of the route of 2.3 against Saad's proof of Theorem 1.32, which has no SOR part; the two dependency lines have no source counterpart), none shared; largest share Saad, 8 of 14 locators; no layer added, removed or reordered, so the contents were not compared again. The Auzinger–Melenk and Fawzi notes could not be read.

Research link: Layers 1–2 are the nonnegative-matrix and regular-splitting theory that Saad (2003) uses for incomplete LU factorizations of M-matrices (Theorem 1.32 in the proof of Theorem 10.1, p. 302); 2.4 is Stein and Rosenberg (1948). This rests on Saad's text; the README states no research motivation.

## Not verifiable

- Stein and Rosenberg (1948): the paper is behind a paywall and was not read; the README cites it as the origin of 2.4 without a locator and proves 2.4 itself.
- Auzinger and Melenk, Theorem 5.2 (p. 32), Definition 5.4 (p. 35), Theorems 5.4 (p. 36) and 5.5 (p. 37), and Fawzi, Theorem 4.12 and Corollary 4.13 (p. 33): not readable through the sources service, as in the previous review; the change does not touch them.

## Source issues

- none

## For the human reviewers

- Scope: of the sources with locators, two are unpublished lecture notes (Auzinger–Melenk, TU Wien 2023; Fawzi, Cambridge 2021); 2.2, 2.4 and the converse of 4.1 are "proved here", 2.4 now with the 1948 paper cited as its origin.
- Licence: the Auzinger–Melenk notes are served from a course page of a third lecturer at TU Wien, with no stated licence; the sources service classified neither that page nor Fawzi's DAMTP page.
- Not tested: wording and arrangement were compared with Saad only; the Auzinger–Melenk and Fawzi notes (6 of 14 locators, all of Layer 4) were not read.
