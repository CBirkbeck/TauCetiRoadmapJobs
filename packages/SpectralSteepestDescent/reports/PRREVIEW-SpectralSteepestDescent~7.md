# Review of SpectralSteepestDescent (pull request #2423 at dce07ed)

**Verdict:** accepted

Incremental re-review of the 13 lines changed since `7460969`. Both findings of the previous review are repaired, the repairs introduce no new problem, and no finding remains.

## Previous findings

- R01 — repaired: `README.md` lines 295–296 "2.1 uses PD-A52, the Hermitian dilation and Majorization; 2.2 uses 1.3, 2.1, the Ky Fan triangle inequality and Fan dominance; 2.3 uses 1.1–1.3 and PD-B19." It agrees with the *Needs:* lines 241 and 266.
- R02 — repaired: lines 227–230 "the nonzero eigenvalues of the dilation of `A` are `±σᵢ(A)` for `i < rank A`, with multiplicity (`LinearMap.finrank_eigenspace_hermitianDilation_eq_adjoint_comp_self`) … for `i < min(finrank E, finrank F)`"; the name is in the Tau Ceti item, lines 83–85.

## Verified sound

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| §2.1 spectrum of the dilation (changed sentence) | `A = (2 0) : ℝ² → ℝ`; `A = diag(3,0)` on `ℝ²`; `A = 0`; `E = 0` | eigenvalues `2,0,−2`: largest `2 = σ₀`, smallest `−2`, one index; `3,0,0,−3`: largest `3,0 = σ₀,σ₁`, smallest `−3,−0`; all `0 = ±σᵢ`; no index | holds |
| §2.1 `sum_abs_singularValues_sub_le_kyFanSum`, route through the changed sentence | `A = diag(3,1)`, `B = diag(1,3)`; `A = (2 0)`, `B = 0`; index count for general `m, n` | `D(A) − D(B) = D(A − B)`; left `0,0 ≤ 2,4`; `2 ≤ 2`; chosen top index `i` and bottom index `m+n−1−i'` distinct since `i + i' ≤ 2 min(m,n) − 2 < m+n−1` | route closes |
| Multiplicity declaration as cited | `μ = 2`, `A = (2 0)`; `μ = 0`, same `A` | `dim ker(D − 2) = 1 = dim ker(A†A − 4)`; at `μ = 0`: `1` versus `1` here, but `A = 0` on `ℝ → ℝ²` gives `3` versus `1`, so `μ ≠ 0` is needed and the README says "nonzero" | cited at its generality |
| Layer 2 `### Dependencies` (changed) | each clause against lines 241, 266 and §2.3 | 2.1: PD-A52, dilation, MAJ-A26, MAJ-B21; 2.2: 1.3, 2.1, MAJ-A31, MAJ-B21 | agree |

The rows for the untouched statements stand as in the previous review, of `7460969`; `Suggested.lean` is unchanged since `054ef3c`.

- Source locators: the diff changes none. FanHoffman1955 lines 59–65 and 66–70 read again beside the changed §2.1 sentence; the sample targets fall outside the changed passages except §2.1, checked in the table.
- Library declarations opened at the pin: `LinearMap.finrank_eigenspace_hermitianDilation_eq_adjoint_comp_self` (`TauCeti/Analysis/InnerProductSpace/HermitianDilation/Spectrum.lean` line 156, hypothesis `μ ≠ 0`, real `μ`); `hermitianDilation_sub` (`HermitianDilation/Basic.lean` line 78); `hermitianDilation` (`Basic.lean` line 40).
- Cross-roadmap citations resolved on main: PD-A52 (PolarDecomposition line 257); MAJ-A26, MAJ-A31, MAJ-B21 (Majorization lines 173, 185, 273).
- Dependency check: `depcheck: 250 roadmaps, 2363 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Gate at `dce07ed`: every check 0, `build=0`, OK. Elaboration of `Suggested.lean`: 20 `sorry` warnings, nothing else.
- The pull request changes no file outside the folder; its title and description agree with this head (OI-A50 is still cited, `README.md` lines 78–79; the change adds no roadmap supplier, section or declaration).
- Remark: line 254 still has no full stop between "for the upper bound" and "(Fan–Hoffman, Theorem 1, p. 112, …".
- Overlap check: read Majorization, PolarDecomposition, PrincipalAngles (main); nothing shared.

Source independence: changed passages only; 3 passages compared with 2 sources (FanHoffman1955, BernsteinNewhouse2024), none shared (no cached source mentions a dilation); largest share BernsteinNewhouse2024, 6 of 10 locators; the diff adds, removes or reorders no layer, so the contents were not compared again.

## Not verifiable

- none

## Source issues

- **Misprint** in JordanMuon2024 at section *Proving that NS iteration orthogonalizes the update* (line 119): the source says the iterated odd quintic should tend to 1 for every starting value in the closed interval from 0 to 1; it should be the half-open interval excluding 0, where every odd polynomial vanishes; affects nothing.

## For the human reviewers

- **Scope.** §4.3 (band `[17/25, 5/4]`, entry time `K(s)`, threshold `1/270`) is stated in no source; the README says so after the §4.3 bullets. JordanMuon2024 is a web post, BernsteinNewhouse2024 an arXiv preprint.
- **Scope.** Layers 1–2 are general matrix analysis continuing `OperatorTheory/Majorization` and `OperatorTheory/PolarDecomposition`, including Lidskii's eigenvalue inequality (`README.md` line 216); they sit in a top-level roadmap whose `metadata.toml` topic is `math.OC`.
- **Licence.** The README's `## Provenance` section names `github.com/brettkoonce/lean4-mlir` (stated BSD-3, by the pull request's author) as a prior formalization; `Suggested.lean` was not compared with its files.
