# Review of SpectralSteepestDescent (pull request #2423 at 5039626)

**Verdict:** accepted

**Summary.** Accepted: an incremental re-review of the 5 lines changed since `548240a` found no finding. The change repairs the one small correction of the previous review: the module docstring of `Suggested.lean` and the guide to the build in `README.md` now both say that Layer 6 contributes the definition `matrixPolarFactor` alone, which is what the file contains. There are no small corrections and no format notes; the questions left for a human are those of the previous review.

## Previous findings

- none: the previous review, of `548240a`, was an acceptance with no finding.
- C01 (small correction) — repaired: `README.md` line 21 reads "and from Layer 6 the definition `matrixPolarFactor` alone"; the docstring of `Suggested.lean` (lines 16–17) reads "Layer 6 contributes the definition `matrixPolarFactor` alone, to fix the convention of §6.1". The repair introduces no new problem.

## Verified sound

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| §6.1 `matrixPolarFactor`, the definition the two changed sentences cite | `A = (i)` over `ℂ`; `A = [[0,2],[0,0]]`; `A = diag(3,4)` | `|A| = (1)`, `U = (i)`, `Uᴴ U = 1`, `Uᵀ U = −1`, `re tr(Uᴴ A) = 1`; `Aᴴ A = diag(0,4)`, `|A| = diag(0,2)`, `U e₂ = e₁`, `U e₁ = 0`, `Uᴴ U = diag(0,1)`; `|A| = A`, `U = 1` | agrees with the three Checks of §6.1; the convention the docstring says it fixes is fixed |
| The changed sentences against the file | declarations under `## Layer 6: matrices` in `Suggested.lean`; theorems of Layers 1–5 | Layer 6: one `def` (line 210), no theorem; 20 sorried theorems, all in Layers 1–5; the docstring's "matrix forms of §6.1 … not stated here" still true | both sentences true of this head |

The rows for the untouched statements stand as in the previous review, of `548240a`.

- Source locators: the diff changes none; of the seeded sample only §6.1 is touched by the changed sentences, and it is "(Proved here.)" with no source locator.
- Library declarations: none newly cited; `matrixPolarFactor` (unchanged) still elaborates against `LinearMap.polarFactor` and `Matrix.toEuclideanLin` at the pins.
- Elaboration of `Suggested.lean` at this head: 20 `sorry` warnings, nothing else; no `set_option`; no sorry'd data.
- Dependency check: `depcheck: 182 roadmaps, 2068 edges, 0 problem(s)`; no UPWARD or CYCLE line. The diff changes no supplier citation.
- Automatic checks at `5039626`: all passed; none set aside.
- The pull request changes no file outside the folder. Its title and description agree with this head: a new roadmap, the same suppliers, and the description's list of contents is not affected by the two changed sentences.
- Overlap check: read Majorization, PolarDecomposition, PrincipalAngles (main); nothing shared. No open pull request changes this roadmap or drops an id it cites.

Source independence: changed passages only; 2 passages compared (the sentence of `## How to read the build` and the sentence of the module docstring) with 4 sources (BernsteinNewhouse2024, GuptaKorenSinger2018, FanHoffman1955, JordanMuon2024), none shared; largest share BernsteinNewhouse2024, 6 of 10 locators; the diff adds, removes or reorders no layer, so the contents were not compared again.

Research link: Layers 1–2 are the operator–nuclear duality and the Fan–Hoffman (1955) nearest-isometry theorem; Layers 3–5 are the Newton–Schulz iterations and steepest descent under the operator norm of Bernstein–Newhouse (2024), which interprets Shampoo (Gupta–Koren–Singer, 2018) and underlies Muon (Jordan, 2024); README summary and the four cached sources.

## Not verifiable

- none

## Source issues

- **Misprint** in JordanMuon2024 at section *Proving that NS iteration orthogonalizes the update* (line 119): the source says the iterated odd quintic should tend to 1 for every starting value in the closed interval from 0 to 1; it should be the half-open interval excluding 0, where every odd polynomial vanishes; affects nothing.

## For the human reviewers

- **Scope.** §4.3 (band `[17/25, 5/4]`, entry time `K(s)`, threshold `1/270`) is stated in no source; the README says so after the §4.3 bullets. JordanMuon2024 is a web post, BernsteinNewhouse2024 an arXiv preprint.
- **Scope.** Layers 1–2 are general matrix analysis continuing `OperatorTheory/Majorization` and `OperatorTheory/PolarDecomposition`, including Lidskii's eigenvalue inequality (`README.md`, §2.1); they sit in a top-level roadmap whose `metadata.toml` topic is `math.OC`.
- **Licence.** The README's `## Provenance` section names `github.com/brettkoonce/lean4-mlir` (stated BSD-3, by the pull request's author) as a prior formalization; `Suggested.lean` was not compared with its files.
