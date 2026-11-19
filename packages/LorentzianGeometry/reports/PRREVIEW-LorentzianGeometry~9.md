# Review of LorentzianGeometry (pull request #2232 at 42109b8)

**Verdict:** accepted

**Summary.** Accepted: the folder is unchanged since the previous review of `42109b8`, and this round read the pull request's title and description, as they now stand, against that head. Every sentence of the description agrees with the head: the consumer and supplier sentences that the previous small correction asked for are in place, and the supplier list, the section references, the count of targets and the lists of stated and not-statable headline theorems all match. No finding, no small correction and no format note; nothing is left for a human to decide.

## Previous findings

- none: the previous report, of `42109b8`, has no finding. Its small correction C01 is repaired: the description now reads "with CompressibleEulerEquations as its consumer (§6.1, §6.3, §7.3, §8.2, §12.6) … Neither is a supplier" and "RiemannianGeometry (R1.3, R2–R3, R4.7, R5a)".

## Verified sound

| Target | Instances | Roadmap or description value | Computed or head value | Result |
| --- | --- | --- | --- | --- |
| Hawking's theorem as the description states it (§13.3; `lorentzianLength_le_of_meanCurvature_le`, `Suggested.lean` line 473): zero set of a temporal function, `H = tr ∇ν`, `ν = −grad t/|grad t|` | `I⁻(0)` in Minkowski `ℝ^{1+n}`, `s = √(t² − |x|²)`, temporal function `T = s₀ − s`, position field `X` | future curves from `T⁻¹(0)` have length `≤ n/|b|` | `ν = −X/s` is future; `div ν = −(n+1)/s + X(s)/s² = −n/s`, so `b = −n/s₀`, bound `n/|b| = s₀`, attained by the ray to the origin; `finrank E − 1 = n` | sound and sharp |
| Same, sign control | the future region `I⁺(0)`, `T = s − s₀` | `H ≤ b < 0` must fail | `ν = X/s`, `div ν = +n/s > 0`; future curves there have infinite length, and the hypothesis excludes it | the sign of `ν` is pinned |
| "lying in the same time cone is transitive (§6.2 (b), `IsLorentzian.neg_of_neg_of_neg`)", used by the §8.1 equivalence | `ℝ^{1+1}`: `u = (1, 0)`, `v = (1, ½)`, `w = (1, −½)`; control `b = −I` on `ℝ²`, `u = (1, 0)`, `v = (1, 1)`, `w = (−1, 2)` | `b(u, v) < 0`, `b(v, w) < 0` give `b(u, w) < 0` | Lorentzian: `−1`, `−5/4`, `−1`; negative definite (index 2): `−1`, `−1`, `+1`, so the Lorentzian hypothesis is used; `Suggested.lean` line 218 calls the theorem in `trans` | sound; the description's sentence is true |
| "The 48 targets" | numbered subsections per layer | 48 | 2 + 7 + 4 + 1 + 2 + 3 + 3 + 4 + 4 + 4 + 4 + 7 + 3 = 48 | agrees |
| Supplier sentence of the description | the nine `From …` subsections (README lines 231–385) | Mathlib, Tau Ceti; HopfRinow, RiemannianGeometry (R1.3, R2–R3, R4.7, R5a), PDE, LocalVariationalFieldTheory, DifferentialGeometry, SmoothBundlesConnections on main; RelativisticQuantumFieldTheory §1.1 | the same nine; the six roadmaps are on main (HopfRinow under `Completed/`); RelativisticQuantumFieldTheory is open only, and its §1.1 names `Spacetime`, `minkowskiSquare`, `causalFuture`, `causalPast` | agrees |
| Consumer sentence of the description | README lines 82–84, 1339, 2353–2357; CompressibleEulerEquations at its open head | consumes §6.1, §6.3, §7.3, §8.2, §12.6; linear systems on `ℝ × ℝⁿ` are SymmetricHyperbolicSystems'; neither a supplier | README lists the same five sections; the Euler README cites exactly these sections of this roadmap; no `From` subsection names either | agrees |

The rows for the untouched statements stand as in the previous review, of `42109b8`.

- Pull request text read against the head: the title; the summary block (three paragraphs, against the README's Summary, "How to read the build" and its table, §3.4, §12.6–§12.7, §13.3 and "Downstream consumers"); the four prose paragraphs. Every stated headline (§12.3 three, §12.4 two, §12.6, §13.3) is one of the eight `sorry` theorems of `Suggested.lean`, the eighth being the auxiliary §6.2 (b); the not-statable list equals the module docstring's (lines 30–46). Nothing contradicted, nothing left unstated: the pull request adds the roadmap, removes no heading or declaration, and changes nothing outside the folder.
- Source locators checked against the text: none new; the folder is unchanged and no sampled target lies in a changed passage.
- Library declarations opened: none new; `Suggested.lean` lines 196–224 and 436–491 were read against the description.
- Cross-roadmap citations resolved: 4. RiemannianGeometry R4.7 on main; RelativisticQuantumFieldTheory §1.1 at its open head `564db65` (README line 313); CompressibleEulerEquations at its open head `d30bd0f` and SymmetricHyperbolicSystems (open, `6a5cca3`), as consumer and as owner of excluded material.
- Automatic checks: the worker's run at `42109b8` passed every check, with the targeted build. Dependency check rerun: `depcheck: 200 roadmaps, 2199 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line; LorentzianGeometry stands right after RelativisticQuantumFieldTheory in the order.
- Elaboration: `lake env lean` on `Suggested.lean` gives 0 errors and 8 `sorry` warnings (lines 151, 304, 312, 323, 348, 358, 427, 473), nothing else.
- Overlap check: read CompressibleEulerEquations, RelativisticQuantumFieldTheory, RiemannianGeometry and, beyond the lists, SymmetricHyperbolicSystems; the acoustical form (§7.3) and domains of dependence in a subset (§12.6) are owned here and cited by CompressibleEulerEquations; linear symmetric hyperbolic systems are SymmetricHyperbolicSystems'; the flat `causalFuture` and `causalPast` are RelativisticQuantumFieldTheory §1.1's. No object has two owners; no dropped id, no second copy, no other pull request changes this roadmap.
- Source independence: changed passages only; the folder has no changed passage, so 0 passages were compared; the arrangement was not compared again (no layer added, removed or reordered).
- Research link: §12.4 states the `C⁰`-inextendibility theorems of Sbierski (2018) and Galloway–Ling–Sbierski (2018); §12.3 and §13.3 the Bernal–Sánchez splitting and the Hawking and Penrose singularity theorems; §12.6–§12.7 and §7.3 serve Dafermos–Luk (2017) and Luo–Yu (2023). Rests on the README's sources.

## Not verifiable

- The description's "Annals definitions 50 and 51" names a list that neither the folder nor the repository's top-level files identify.
- `oneill1983` is settled as uncertified: "Theorem 14.55A", on which the description's Hawking sentence rests through §13.3, was not read; the Milne computation above supports the constant and the sign.

## Source issues

- none

## For the human reviewers

- none
