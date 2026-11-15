# Review of GeometricQuantization (pull request #1186 at 0708083)

**Verdict:** accepted

No findings. Incremental re-review of 0 changed lines since `49fe13a`; this round read the pull request's title and description against the head.

## Previous findings

- R01 — repaired: the description now reads “Functions constant along the real polarization act by pointwise multiplication on polarized sections; globally constant functions act by their scalar value.”
- R02 — repaired: “Layer 3 consumes SchubertGeometry S9.1/S9.7's flag geometry and constructs the ordinary Picard–Chern and homogeneous-character comparisons consumed by SchubertGeometry, Part II”; the summary block names “SchubertGeometry, Part II”.
- R03 — repaired: the notebook-reference sentence is gone; “Knutson” and “Semester2” occur 0 times in the description and in the folder.
- R04 — repaired: “Suggested.lean imports Mathlib, defines theta sections and states their dimension theorem for positive integral degree, an upper-half-plane parameter and arbitrary real characteristics”.
- R05 — repaired: the prose opens “This PR adds the GeometricQuantization roadmap: a six-layer README, a theta-section acceptance file, and topic metadata”; the prose-only sentence is replaced by the validation paragraph.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| Description: basic functions act by pointwise multiplication; constants by their value | Vertical P on T*ℝ, a=q, local section 1, q=0,1; a=2 | `Q_a=iℏ∇_(X_a)+a`, X_a∈P kills polarized s: Q_q1=(0,1)=q·1; Q_2 1=(2,2). `README.md:80`–87, 908–911 agree. | Agrees | none |
| Description: p versus p² example | P=span{∂p} on T*ℝ | [X_p,∂p]=[∂q,∂p]=0 (preserves P); [X_(p²),∂p]=[2p∂q,∂p]=−2∂q, not vertical. `README.md:918`–920 same values. | Agrees | none |
| `finrank_thetaSections` as the description states it (k>0, Im τ>0, real α, β) | k=1, α=β=0; k=0, α=β=0; coefficient recursion | k=1: `jacobiTheta₂ z τ` is a section, dimension 1=k. k=0: constants are sections, dimension 1≠0, so `hk` is needed. Recursion c_(m+k)=exp(2πi(m+α)τ−2πiβ+πikτ)c_m recomputed: k free coefficients. | Agrees with signature | none |
| Description: “six-layer README … theta-section acceptance file, and topic metadata”; “adds only the GeometricQuantization roadmap folder” | Base-to-head diff | Layer headings: 6. Files added: `README.md` 2008, `Suggested.lean` 109, `metadata.toml` 1. Files changed outside the folder against the base: 0. | Agrees | none |
| Description: Schubert supply direction | `README.md:22`, 276, 1938; SchubertGeometry on main | S9.1/S9.7 cited as supplier (S9 at `TauCetiRoadmap/SchubertGeometry/README.md:107`–109 on main); §3.3 owns the Picard–Chern comparison; Part II is listed only as consumer. S3P occurrences: 0. | Agrees | none |
| Description: bounded extension inverts restriction before the index formula; empty levels; two ℂP² examples | §6.7, §6.9, §6.10 | `README.md:1617`–1629: extension inverse to restriction, H⁰ comparison for every n≥1, vanishing only later; 1631–1637 empty level; 1826 “two CP² actions”. | Agrees | none |
| Description: peak-section embedding independent, Serre vanishing afterwards | §6.2 | `README.md:1181`–1195: embedding built from peak sections “independently of reduction”, then ComplexComparisonPartII C1.8 applied to `i_*(L^j)`. | Agrees | none |
| Description: validation paragraph | Gate, targeted build, direct elaboration | Build exit 0 with 2 warnings (`sorry` at `Suggested.lean:93`, Mathlib module-system note); direct elaboration exit 0, 1 warning (`sorry`); depcheck 0 problems. | Agrees | none |
| Summary block: Layer 6 setting and outputs | §6.1, §6.4, §6.9, §6.10 | `README.md:1144`–1146: compact torus, compact connected Kähler M, positive linearized line; Duistermaat–Heckman limit at 1361; joint quasipolynomial at 1754; character twist and T/K⁰ transport at 1803–1815. | Agrees | none |

The adversarial rows for the untouched statements stand as in the previous review, of `49fe13a`.

- Incremental scope: 0 changed folder lines since `49fe13a`; 0 files changed outside the folder against the base; the title and every sentence of the description's prose and summary block read against the head.
- Sources: 0 locators fall in changed passages (the seeded sample lies wholly in untouched text); none reopened.
- Library: `jacobiTheta₂_add_left`, `jacobiTheta₂_add_left'`, `differentiableAt_jacobiTheta₂_fst` used by the proved `example`, which elaborates at the pin.
- Signatures: `thetaSections : ℕ → ℂ → ℝ → ℝ → Submodule ℂ (ℂ → ℂ)` and `finrank_thetaSections` compared with README §5.3 and the description; 0 lost binders (“modulo” in the worker's list is docstring text, not a declaration).
- Citations: mechanical resolution reports 0 cross-roadmap citations and 0 Lean names found nowhere; SchubertGeometry S9 re-resolved on main (3cf7342).
- Gate rerun at 0708083: every scanner count 0, `OK`; `lake build TauCetiRoadmap.GeometricQuantization.Suggested` exits 0.
- Direct elaboration of `Suggested.lean`: exit 0, the only warning `declaration uses sorry` at line 93.
- Dependency check, complete output: `depcheck: 244 roadmaps, 2210 edges, 0 problem(s)`; no UPWARD or CYCLE line.

Overlap check: read SymplecticGeometry (main/#1808), HamiltonianSystems (#480), ComplexKahlerGeometry (main/#1807), SmoothBundlesConnections (main/#2127), FukayaTheory (#1045), ConvexityToric and HamiltonianReduction (main) as in the previous review; the overlap facts list no pull request changing this roadmap, no dropped or revision-only id and no result-level match; nothing shared beyond the supplier contracts already stated, whose owners are unchanged.

Source independence: changed passages only; 0 changed roadmap passages compared with 0 sources. No layer was added, removed or reordered, so the arrangement comparison was not reopened.

## Not verifiable

- Nothing new; no source text was needed for this round.

## Source issues

- none

## For the human reviewers

- none
