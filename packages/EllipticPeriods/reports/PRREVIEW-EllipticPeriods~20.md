# Review of EllipticPeriods (pull request #1059 at d300669)

**Verdict:** accepted

No finding. Incremental re-review: the folder is unchanged since `88b745b` (0 lines); the head adds only a merge of main.

## Previous findings

- R01 — repaired: the description's Boundary paragraph now ends "Of the comparison with Eisenstein series, this roadmap owns only the E₂ dictionary `η(1) = G₂(τ)` for `ℤ + ℤτ` (2.4, `quasiPeriod_ofUpperHalfPlane_one`) and its scaled form for a positive period pair." It agrees with README 34–38.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| 2.4 `quasiPeriod_ofUpperHalfPlane_one`, `η(1) = G₂(τ) = (π²/3)E₂(τ)` (cited by the repaired sentence) | `τ = −0.4 + 0.8i`; `η(1) = 2ζ(1/2)` by lattice sum `\|m\|, \|n\| ≤ 250` against the `q`-series | `3.7058181 + 0.2948974i` vs `3.7058167 + 0.2948988i` | sound | none |
| 2.4 scaled dictionary `η(ω₁) = ω₁⁻¹(π²/3)E₂(τ)` (cited by the repaired sentence) | `(ω₁, τ) = (3 − i, −0.4 + 0.8i)`, same truncation | `1.0822557 + 0.4590510i` vs `1.0822551 + 0.4590513i` | sound | none |

Rows for the untouched statements stand as in the previous review, of `88b745b`.

- Gate: the worker's gate, and my rerun with the candidate order and `--build`, report every counter 0 and `build=0 OK`. With the configured order the depcheck prints `NOT IN ORDER: EllipticPeriods (insert it after its last supplier)`; the candidate order lists it at line 74, after ModularCurvesPartII (73), so this is not a finding.
- Dependency check (`--movable`, candidate order): `depcheck: 245 roadmaps, 2230 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line.
- Elaboration of `TauCetiRoadmap/EllipticPeriods/Suggested.lean`: exit 0, 27 diagnostics, all "declaration uses `sorry`". The pins (`lake-manifest.json`, `lean-toolchain`) are unchanged since `88b745b`.
- Changes outside the folder: `git diff origin/main...HEAD` outside `TauCetiRoadmap/EllipticPeriods/` is empty; the files listed as changed since `88b745b` all come from the merge of main.
- Description read sentence by sentence against the head, no contradiction: three files and nothing outside them; six layers; five supplier subsections (README 123–206); headlines at `Suggested.lean` 175, 223, 230, 243, 247; module form (line 1); the docstring's `ζ = σ′/σ` (43–44); ModularCurvesPartII still open and listed under "Depends on".
- Cross-roadmap citations resolved again, 9 in all: ModularCurvesPartII at its open head `9be1eb8` (unchanged), §1.1 (its README 394) and §1.4a (488, 502); DiophantineApproximationAndTranscendence on main `2248bbb`, §5.6 (3555), `nesterenko` (3658; its `Suggested.lean` 938), `eisenstein_values_at_i` (3660); ModularForms §10D on main (58, 145). Tau Ceti `PeriodPair.weierstrassCurve_Δ_ne_zero` opened at the pin (`Analysis/SpecialFunctions/Elliptic/Uniformization.lean` 203).
- Seeded sample: none of the sampled targets is in changed text; the README flags no locator as unverified.
- Remark: EllipticIntegrals on main (its README 71) still names this roadmap by a former title and pull-request link; that file is outside this folder.

Overlap check: read EllipticCurvePeriodsAndModularParametrizations (open, `91ab26b`), ModularForms, DiophantineApproximationAndTranscendence and EllipticIntegrals (main). The `g₂, g₃`–`E₄, E₆` comparison is owned by ModularForms §10D and Tau Ceti `UpperHalfPlane.g₂_periodPair`, and consumed here (ModularForms README 65, 1536 names EllipticPeriods §2.4 as consumer). `σ`, quasi-periods and Legendre are owned by ModularCurvesPartII §1.4a and Tau Ceti; EllipticCurvePeriodsAndModularParametrizations (README 109–110) and EllipticIntegrals (69–71) defer them and the transcendence of periods. `nesterenko` is owned by DiophantineApproximationAndTranscendence §5.6.

Source independence: changed passages only, 0 passages compared with 0 sources, because the folder did not change since `88b745b`; largest share NIST DLMF ch. 23, 15 of 28 locators, as in the previous review; no layer was added, removed or reordered, so the contents were not compared again.

## Not verifiable

- Silverman, AEC ch. VI and ATAEC chs. I–II (1.4, 2.4, 4.1): no legal copy found; cited by chapter. 2.4 is checked numerically above.
- Chudnovsky 1976 and 1984, Nesterenko 1996, André 2004, Grothendieck 1966, Lang 1966, and Waldschmidt's *Diophantine Approximation on Linear Algebraic Groups*: not read. They are cited by locator in References and Research context only, and no locator changed.

## Source issues

- none

## For the human reviewers

- none
