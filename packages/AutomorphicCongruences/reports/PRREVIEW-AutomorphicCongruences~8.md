# Review of AutomorphicCongruences (pull request #1816 at 4291999)

**Verdict:** accepted

Incremental re-review of the 2 lines changed since c30ac90 (the Summary sentence of `TauCetiRoadmap/AutomorphicCongruences/README.md`, line 3), with the pull request's title and description read against this head. No finding.

## Previous findings

- R01 — repaired: the description now reads "`Suggested.lean` declares nothing: no headline theorem is statable against the pinned Mathlib and Tau Ceti" and "the targeted Lake build succeeds with no warning (the file has no declaration and no `sorry`)".
- R02 — repaired: the summary block now reads "GL₂ Hida theory over ℚ and totally real fields … are imported; ordinary GU(2,2) and semi-ordinary GU(3,1) Hida theory are built here, on unitary Igusa towers requested from IgusaVarietiesAndTorsionConcentration".

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| README line 3 (changed): BCS "rational … main conjecture together with its integral form under their rank-one image condition" | `BCS lines 59–68`, p. 2; README §§7.9, 7.10, 8.1 | Thm 1.1.2(a): p > 3, (irr_ℚ), equality in Λ ⊗ ℚ_p, no (im). (b): (im) added, equality in Λ. §7.9 line 2252: Λ_ℚ[1/p]; §7.10 line 2269: Λ_ℚ under (im); §8.1 line 2300 the same | (im) now attached to the integral form only; agrees with source and with §§7.9, 7.10, 8.1 | none |
| Rational against integral (the distinction the changed sentence states) | Λ = ℤ_p[[T]], J = (p·L), L ≠ 0 | J·Λ[1/p] = (L)·Λ[1/p]; in Λ, ord_(p) J = ord_(p) L + 1, so J ≠ (L) | the two forms are different statements; the old wording put (im) on both | none |
| §7.8 (cited by §7.10; seeded sample) factor separation | defects d_χ = ord_P(L_χ) − ord_P(J_χ) for four χ | hypotheses give d_χ ≥ 0 and Σ d_χ ≤ 0, so d = (0,0,0,0). Product bound alone: ord J = (1,0,0,0), ord L = (0,1,0,0): sums 1 = 1, yet J_1 ≠ (L_1) | holds; individual bounds are needed, as stated | none |
| §7.6 (cited by §7.10; seeded sample) twist stability of (im) | ρ(σ) = 1 + N, N = [[0,u],[0,0]], u a unit, p odd; χ(σ) = −1 | (1+N)² − 1 = 2N; coker of 2N on ℤ_p² is ℤ_p ⊕ ℤ_p/(2u) = ℤ_p since 2u is a unit; χ(σ²) = 1. At p = 2: coker ℤ_2 ⊕ ℤ/2, fails, and p > 2 is assumed | holds | none |
| Description, R01 repair | `Suggested.lean` at this head | 59 lines, 0 declarations, 0 `sorry`; `lake env lean` exit 0, empty output | agrees | none |
| Description, R02 repair | README headings and scope table | "Hida theory" headings: lines 474, 765, 909, all unitary; line 13 imports PadicFamilies §§5.6–5.9; gap:unitary-ordinary-igusa on IgusaVarietiesAndTorsionConcentration | agrees | none |
| Description, "which no other roadmap plans" | `roadmaps grep` over main and 447 open heads | "1+n+1 / three-block lattice": 0 other READMEs; Ichino with "triple/trilinear": 0 other; "CAP eigensystem/component/representation": 0 other; "universal zeta morphism": 5 hits elsewhere, all citations of this roadmap or bibliography lines | agrees | none |
| Description, dependencies paragraph | 43 roadmap names in the README | 9 on main; 29 not on main, each in the depends-on list (3 more there are on main and ticked); 4 left: ModularIwasawaMainConjectures, HeegnerPointEulerSystems (consumers, merge-order lines 399, 400 after 398), ArithmeticStatisticsPartVI, NoncommutativeAndEquivariantIwasawa (README line 9: not restated, not consumed) | agrees | none |
| Description, endpoints and layers named in the prose | README headings | §§0.1–0.3, 0.7, 0.9, 1.10–1.11, 2.4, 2.7–2.8, 2.12, 2.15–2.16, 2.20–2.21, 3.4, 3.7, 4.3, 4.5, 5.1, 5.10, 6.6, 7.3, 7.8, 7.9–7.10: each present under the name the description uses | agrees | none |
| Title and folder | change against the base | folder not on main; 3 files added (README, `Suggested.lean`, `metadata.toml`), 2432 insertions, 0 deletions; 0 headings and 0 declarations removed | "AutomorphicCongruences: roadmap" and "Roadmap folder … (README, `Suggested.lean`, `metadata.toml`)" agree | none |

The rows for the statements the diff leaves untouched stand as in the previous review, of c30ac90.

- Source locators checked against the text: 1 (BCS Theorem 1.1.2(a), (b) and condition (im), p. 2, `BCS lines 59–68`). Seeded sample: none of the fifteen targets lies in the changed line; §§7.6 and 7.8, which depend on the BCS endpoint it names, were recomputed above.
- Library declarations opened: none (the diff changes no Lean and cites no library declaration); the `#check @name` comparison and the one-tactic probe have nothing to run on.
- Cross-roadmap citations in the changed passage: none. Headline theorems: all named in the module docstring as not statable (BCS: §§6.6, 7.9, 7.10, "rational and integral cyclotomic theorems"); none added or removed.
- Gate, rerun at 4291999 against origin/main: every check 0, `OK`, exit 0 (the worker's run also has `build=0`). Outside the folder: `git diff --stat origin/main...HEAD` is empty.
- Dependency check: `depcheck: 236 roadmaps, 2232 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Overlap check: read ModularIwasawaMainConjectures, KatoEulerSystems, HeegnerPointEulerSystems, IntegralIwasawaTheory (scope as settled in the earlier reviews; the diff adds no object); nothing shared. `overlaps.md`: no other pull request changes this roadmap, no dropped or revision-only id.
- Source independence: changed passages only; 1 passage compared with 1 source (BCS), none shared (longest common run 2 words); largest share FW, as in the review of c30ac90; contents not compared again (no layer added, removed or reordered).
- The description's "6 independent review rounds and 2 red-team rounds" matches the board's report files (six package reviews, two red-team rounds).

## Not verifiable

- `Hung2017` is uncertified and `Ichino2008`, `Ikeda1994`, `Harris1984`, `Rubin2000`, `BST19` are waived; the changed line cites none of them.

## Source issues

- none

## For the human reviewers

- **Not tested.** The README states 21 `What <Supplier> must provide (gap:…)` contracts; the board plan declares 16 (README-only: `katz-ht93-normalization`, `hecke-l-values-mod-p`, `hida-rankin-selberg-cm`, `anticyclotomic-nonvanishing-mod-p`, `vatsal-theta-mu`). Registering the five is a board task, recorded as settled by the earlier reviews.
