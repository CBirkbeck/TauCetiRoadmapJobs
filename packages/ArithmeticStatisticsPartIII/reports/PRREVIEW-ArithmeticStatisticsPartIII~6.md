# Review of ArithmeticStatisticsPartIII (pull request #1174 at b20a75d)

**Verdict:** accepted

Incremental re-review of the 21 lines changed since a9cc8cd (18 in `README.md`, 3 in `Suggested.lean`, none outside the folder), and a check of the pull request's title and description against this head. No findings.

## Previous findings

- none: the previous report (of a9cc8cd) was an acceptance with no findings.

## Verified sound

### Adversarial table: statements the change touches, computed here

| # | Statement | Instances and values on each side | Result |
|---|---|---|---|
| 1 | `README.md:1182`, `Counting.ternaryDet4 = 4adf+bce−ae²−dc²−fb²`; Lean body `Suggested.lean:140–145` | Lean: `a=c₀₀, b=c₀₁, c=c₀₂, d=c₁₁, e=c₁₂, f=c₂₂`, same five monomials. `u²+v²+w²`: 4. `uv+w²`: `−f·b²=−1`. Zero form: 0. | holds |
| 2 | `README.md:1182`, "four times the Gram determinant when 2 is invertible" | `u²+v²+w²`: Gram `det I=1`, `4·1=4`. `uv+w²`: `det[[0,½,0],[½,0,0],[0,0,1]]=−1/4`, `4·(−1/4)=−1`. Wrong model (factor 1 or 2) gives 1 or 2 against 4. | holds |
| 3 | `README.md:1184`, degree three | `2(u²+v²+w²)`: `4·2·2·2=32=2³·4`; quadratic scaling would give 16. | holds |
| 4 | `README.md:1185`, base change, including 2 and 3 | `uv+w²`: −1 over ℤ, `1` in 𝔽₂, `2` in 𝔽₃; the definition is a ℤ-polynomial in coefficients, so it commutes with ring maps. | holds |
| 5 | `README.md:1186`, invertible `δ` scales by `det(δ)²`, "as in the supplied covariance law" | Shear `(u+v,v,w)` on `u²+v²+w²`: `u²+2uv+2v²+w²`, `4·1·2·1−1·2²=4=1²·4`. `diag(2,1,1)`: `4u²+v²+w²`, `16=2²·4` (factor `det` would give 8). Singular `(u,v,0)`: `0=0²·4`, so the law also holds there. | holds |
| 6 | `README.md:1197`, resolvent: "A variable change δ contributes det(δ)²" | `A=uw−v²`, `B=u²−vw−w²`: `f=x³+4xy²+y³`. Row 5 applied to the pencil `Ax−By` over `ℤ[x,y]` gives `det(δ)²·f`; `diag(2,1,1)` gives `4f`, discriminant `4⁴·(−283)`. | holds |
| 7 | `README.md:11`, `:1168`, ArithmeticStatisticsPartII §1.3 owns the determinant and its covariance | At its open head (c5b1568), §1.3 **Pairs of ternary quadratic forms** states `4 Det (Q∘Mᵀ)=(det M)²·4 Det Q` for every `M ∈ Mat₃(R)`, with Checks 4, 16, 4, −1: the same values as rows 1 and 5. | citation resolves |

The rows for statements this change does not touch stand as in the previous review, of `a9cc8cd`.

### Counts

- The move: the rank-three determinant laws are stated here as §2.8 API (homogeneity, base change, covariance) under ArithmeticStatisticsPartII §1.3, instead of being taken from QuadraticFormsOverABase. No mention of QuadraticFormsOverABase, `univHalfDisc`, `halfDisc` or `δ'` remains in `README.md` or `Suggested.lean` (grep: 0 hits).
- Cross-roadmap citations resolved: 1 (ArithmeticStatisticsPartII §1.3, row 7). QuadraticFormsOverABase at its open head (74cfd54) says "No roadmap consumes this one" and identifies ArithmeticStatisticsPartII §1.3's `4 Det` with its `δ'` at `n=3` (its `README.md:63`): one direction, no object handed back.
- Library declarations opened: Mathlib `QuadraticForm.discr'` (`Mathlib/LinearAlgebra/QuadraticForm/Basic.lean:1242`), the Gram determinant the "when 2 is invertible" clause refers to.
- Source locators checked: 0; the changed passages carry none (their only citation is the supplier section of row 7). The seeded sample's §2.8 falls in the change only through these passages.
- Gate, run at this head: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`; the worker's run adds `build=0`.
- Dependency check: `depcheck: 247 roadmaps, 2248 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. `git diff --stat origin/main...HEAD` outside the folder is empty.
- Elaboration: `lake env lean` on `Suggested.lean` gives 12 warnings, all `declaration uses sorry` (lines 231, 245, 255, 267, 284, 293, 304, 315, 332, 354, 408, 418), one line earlier than at a9cc8cd because the docstring lost a line. The diff changes only the docstring of `ternaryDet4`; its elaborated type is `{R : Type u_1} → [CommRing R] → MvPolynomial (Fin 3) R → R` and `pairResolvent : (Fin 2 → MvPolynomial (Fin 3) ℤ) → MvPolynomial (Fin 2) ℤ`, both unchanged. No theorem changed, so the padding probe of a9cc8cd stands.
- Title and description against this head: 14 claims checked, none contradicted. Among them: a new folder of three files (2787 insertions, 0 deletions); `Counting.quantitative_ekedahl_sieve` and `Counting.hypersurface_local_density` declared; exact area `π/3` (`README.md:474`) against Tau Ceti's `ModularGroup.volume_fd_lt_top` (`:40`); the `PGL₂(ℤ)` covolume (`:488`); `τ(SL₂)=1` (`:2060`); the elimination regression (`:124`); "no smoothness of the whole hypersurface" (`:54`); any abelian dimension (`:2151`); ideal-class charts (`:1368`); consumers Parts IV–VIII and ModularityAndLanglandsExtensions (`:2272`). Every supplier the README names is on main (AdelicAlgebraicGroups, AlgebraicCurves, AnalyticNumberTheoryPartI, AnalyticNumberTheoryPartII, ClassFieldTheory, GlobalNumberFields, OperatorTheory, PolynomialGaloisGroups, SchemeAndStackFoundations) or among the nine open ones of the description's dependency block; the description does not name the dropped supplier QuadraticFormsOverABase.

Overlap check: read ArithmeticStatisticsPartII (scope and §1.3), and QuadraticFormsOverABase (scope and downstream consumers) because the change concerns it; the division-free ternary `4 Det` and its laws are shared with ArithmeticStatisticsPartII, owner ArithmeticStatisticsPartII §1.3, cited here; `Counting.ternaryDet4` is its polynomial specialization, kept to state `Counting.quartic_pair_count`. A search of every open and merged roadmap for the determinant polynomial finds it only in these three.

Source independence: changed passages only; 4 passages (`README.md:11`, `:1182–1186`, `:1197`, `Suggested.lean:138–139`) compared with the 2 texts they could draw on (ArithmeticStatisticsPartII §1.3 and QuadraticFormsOverABase §§1.1–1.3 at their open heads), none shared beyond the forced formula; the passages carry no source locator, so no share is counted; contents not compared again, since the diff adds, removes or reorders no layer.

## Not verifiable

None new. The four texts listed in earlier reports (cohen-dihedral, stichtenoth, lang-weil, platonov-rapinchuk) are cited only in untouched passages.

## Source issues

- none

## For the human reviewers

- none
