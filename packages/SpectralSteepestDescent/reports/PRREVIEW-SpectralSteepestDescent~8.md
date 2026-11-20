# Review of SpectralSteepestDescent (pull request #2423 at 548240a)

**Verdict:** accepted

**Summary.** Accepted: an incremental re-review of the 129 lines changed since `dce07ed` found no finding. The change moves `## Scope and ownership` and `## Exact supplier contracts` behind the layers without altering their text, and adds the definition `matrixPolarFactor` of §6.1, which is the intended object and agrees with the three Checks of §6.1. There is one small correction (the new definition is used by no statement of `Suggested.lean`, and two sentences still say the file covers Layers 1–5 only) and no format note; the questions left for a human are those of the previous review.

## C01 — `matrixPolarFactor` is declared in `Suggested.lean` but no statement there uses it, and two sentences still describe the file as Layers 1–5 only

A reader of `Suggested.lean` meets a `## Layer 6: matrices` section holding one definition and no theorem, while the module docstring (lines 12–16) says the file "states the headline theorems of Layers 1–5" and that "the matrix forms of §6.1 are README targets not stated here", and `README.md` line 21 says the same of Layers 1–5. The definition is correct, but as it stands it tests nothing: the file keeps a definition only to make a headline statable.

Either of two small changes would do. One is a sentence in the docstring and at `README.md` line 21 saying that Layer 6 contributes the definition alone, to fix the convention of §6.1. The other is to state one §6.1 target with it; the first one elaborates at the pins as

    theorem matrixPolarFactor_conjTranspose_mul_self {m n : Type*} [Fintype m] [Fintype n]
        [DecidableEq n] (A : Matrix m n 𝕜) (hA : Function.Injective A.mulVec) :
        (matrixPolarFactor A)ᴴ * matrixPolarFactor A = 1 := sorry

(the name is a suggestion), with the docstring's list of unstated targets adjusted to match.

## Previous findings

- none: the previous review, of `dce07ed`, was an acceptance with no finding, no small correction and no format note.

## Verified sound

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| §6.1 `matrixPolarFactor` (new definition) | `A = 0` on `Fin 2 × Fin 3` over `ℂ`; `A = (i)`; `A = diag(3,4)`; `A = [[0,2],[0,0]]` | `0` (closed by `simp` with `polarFactor_zero`); `|A| = (1)`, `U = (i)`, `Uᴴ U = 1`, `re tr(Uᴴ A) = 1`, `Uᵀ U = −1`; `|A| = A`, `U = 1`; `|A| = diag(0,2)`, `U e₂ = e₁`, `U e₁ = 0`, so `[[0,1],[0,0]]` | the three Checks of §6.1 hold for the definition |
| §6.1 `Uᴴ U = 1` for full column rank, against the definition | `A = [[0,2],[0,0]]` (rank 1); `A = (i)`; statement elaborated with `Function.Injective A.mulVec` | `Uᴴ U = diag(0,1) ≠ 1`, so the rank hypothesis is needed and is stated; `1`; elaborates, `sorry` the only warning | holds as stated |
| Wrong models of `matrixPolarFactor` | transpose in place of conjugate transpose; an isometric extension in place of the canonical factor; row-vector action | `(i)`: `−1` versus `1`; `[[0,2],[0,0]]`: an extension has rank 2, the Check gives rank 1; `toEuclideanLin` acts by `mulVec`, `U e₂ = e₁` not `e₁ ↦ e₂` | each excluded by a Check |
| Moved sections (`Scope and ownership`, `Exact supplier contracts`) | diff of removed against added lines | text identical; the link `#exact-supplier-contracts` still resolves; "as above" at line 53 points at Conventions, still above | pure reordering |

The rows for the untouched statements stand as in the previous review, of `dce07ed`.

- Source locators: the diff changes none and §6.1 is "(Proved here.)"; of the seeded sample only §6.1 falls in the changed passages, and it has no source locator.
- Library declarations opened at the pin: `LinearMap.polarFactor` (`TauCeti/Analysis/InnerProductSpace/Polar/Finite.lean` line 55, vanishing on `ker A`), `LinearMap.polarFactor_zero` (same file, line 164), `Matrix.toEuclideanLin` (Mathlib, a linear equivalence acting by `mulVec`); `TauCeti/Analysis/Matrix/Polar.lean` holds the invertible square case only (`existsUnique_posDef_mul_unitary`, line 76) and no rectangular matrix polar factor, so the new definition duplicates nothing.
- Elaborated signature compared with the README: `matrixPolarFactor : {𝕜} → [RCLike 𝕜] → {m n} → [Fintype m] → [Fintype n] → [DecidableEq n] → Matrix m n 𝕜 → Matrix m n 𝕜`; it keeps `[RCLike 𝕜]` and drops the unused `E`, `F`, as it should.
- Duplication: no open roadmap or roadmap on main declares a matrix polar factor of a rectangular matrix; ManifoldOptimization §O2.2 cites the object and this roadmap's `## Downstream consumers` records it.
- Dependency check: `depcheck: 181 roadmaps, 2065 edges, 0 problem(s)`; no UPWARD or CYCLE line. The diff changes no supplier citation.
- Automatic checks at `548240a`: all passed. Elaboration of `Suggested.lean`: 20 `sorry` warnings, nothing else; no `set_option`, no sorry'd data (the new definition has a real body and depends on no `sorryAx`).
- The pull request changes no file outside the folder. Its title and description agree with this head (a new roadmap; the suppliers named are unchanged; the description's list of contents does not need the new definition).
- Overlap check: read Majorization, PolarDecomposition, PrincipalAngles (main); nothing shared.

Source independence: changed passages only; 2 passages compared (the §6.1 sentence and the docstring of `matrixPolarFactor`) with 4 sources (BernsteinNewhouse2024, GuptaKorenSinger2018, FanHoffman1955, JordanMuon2024), none shared; largest share BernsteinNewhouse2024, 6 of 10 locators; the diff adds, removes or reorders no layer, so the contents were not compared again.

Research link: Layers 1–2 are the operator–nuclear duality and the Fan–Hoffman (1955) nearest-isometry theorem; Layers 3–5 are the Newton–Schulz iterations and steepest descent under the operator norm of Bernstein–Newhouse (2024), which interprets Shampoo (Gupta–Koren–Singer, 2018) and underlies Muon (Jordan, 2024); README summary and the four cached sources.

## Not verifiable

- none

## Source issues

- **Misprint** in JordanMuon2024 at section *Proving that NS iteration orthogonalizes the update* (line 119): the source says the iterated odd quintic should tend to 1 for every starting value in the closed interval from 0 to 1; it should be the half-open interval excluding 0, where every odd polynomial vanishes; affects nothing.

## For the human reviewers

- **Scope.** §4.3 (band `[17/25, 5/4]`, entry time `K(s)`, threshold `1/270`) is stated in no source; the README says so after the §4.3 bullets. JordanMuon2024 is a web post, BernsteinNewhouse2024 an arXiv preprint.
- **Scope.** Layers 1–2 are general matrix analysis continuing `OperatorTheory/Majorization` and `OperatorTheory/PolarDecomposition`, including Lidskii's eigenvalue inequality (`README.md`, §2.1); they sit in a top-level roadmap whose `metadata.toml` topic is `math.OC`.
- **Licence.** The README's `## Provenance` section names `github.com/brettkoonce/lean4-mlir` (stated BSD-3, by the pull request's author) as a prior formalization; `Suggested.lean` was not compared with its files.
