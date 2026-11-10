# Review of SpecialFunctionsBessel (pull request #1987 at 2022935)

**Verdict:** accepted

Incremental re-review of the 4 lines added since `d095480`: one bullet under `## Downstream consumers` in `TauCetiRoadmap/SpecialFunctionsBessel/README.md` (lines 1575–1578) naming SpecialFunctionsStruve as a consumer. No finding. The gate passes and `Suggested.lean` (unchanged) elaborates with `sorry` as the only warning.

## Previous findings

- The previous report (`PRREVIEW-SpecialFunctionsBessel~6`, at `d095480`) had no finding; there is nothing to carry.

## Verified sound

**The changed passage (README lines 1575–1578), clause by clause against SpecialFunctionsStruve at its open head** (its `## Exact supplier contracts`, subsection "From SpecialFunctionsBessel", 13 items, and its `*Needs:*` lines). Every section the consumer cites exists at this head under the heading it expects:

| Clause of the new bullet | What SpecialFunctionsStruve cites | Where it is at this head |
|---|---|---|
| `Y_ν`, `I_ν`, `K_ν`, the Hankel functions | Conventions: `Complex.besselY`, `hankelH1`, `hankelH2`, `besselI`, `besselK`, order first | README Conventions (line 221); `Suggested.lean` lines 68–87 |
| equations, connection formulas | 1.1–1.3, 1.7–1.8 | Layer 1 |
| recurrences | 1.4 (10.6.1–10.6.7) | Layer 1 |
| integral representations | 3.1 (10.9.2, 10.9.4, 10.9.6–10.9.7, 10.32.2) | README line 783 |
| large-argument expansions | 5.1–5.2 | README lines 880, 906 |
| primitives 10.22.1 and 10.43.1 | 8.1 and 8.4 | README lines 1213–1215 and 1313–1315; scope table rows at lines 113–114 |
| spherical functions | 9.1–9.2, `Complex.sphericalBesselJ`, `Complex.modifiedSphericalBesselI1`, `…I2` | README lines 1343, 1357; `Suggested.lean` lines 95–123 |
| `Real.debyeU` with Debye's expansions | Conventions and 6.1 | README lines 295, 1032–1043; `Suggested.lean` line 198 (in `namespace Real`) |
| "(Layers 1–6, 8 and 9)" | also 2.2, 2.4, 2.6 and 4.3 | README lines 677, 698, 756, 851 |

The union of layers the consumer cites is exactly 1, 2, 3, 4, 5, 6, 8, 9: it cites nothing of Layers 7, 10 or 11, so the parenthesis is exact. The bullet's only backticked name of this roadmap's own, `Real.debyeU`, is declared in `Suggested.lean`.

**Ownership.** The bullet is a consumer statement, not a supplier citation: SpecialFunctionsStruve does not appear in any `*Needs:*` line or supplier contract here, so no upward edge is created. The two roadmaps do not both own anything: this README excludes the formulas through the Struve functions (lines 189–193, 211–215, 1599–1604, listing 10.22.2 and 10.43.2) and SpecialFunctionsStruve's "Downstream consumers" says it proves 10.22.2 and 10.43.2 in its 5.1; the scope table here lists 10.22.1 and 10.43.1 but not 10.22.2 or 10.43.2. The handoff is one-directional and consistent on both sides.

**Adversarial table: the objects the changed passage names** (computed by hand).

| Statement | Instance | Computed | README / Lean | Result |
|---|---|---|---|---|
| `Real.debyeU` recursion (`Suggested.lean` lines 198–202) | `k = 1` from `U₀ = 1` | `p²(1 − p²)/2 · 0 + ⅛ ∫₀^p (1 − 5t²) dt = (3p − 5p³)/24`; at `p = 1`: `−1/12` | DLMF 10.41.10 `U₁(p) = (3p − 5p³)/24` | agrees |
| primitive 10.22.1 (8.1) | `ν = ½` | `z^{3/2} J_{1/2}(z) = (2/π)^{1/2} z sin z`, primitive `(2/π)^{1/2}(sin z − z cos z) = z^{3/2} J_{3/2}(z)` | `∫ z^{ν+1} J_ν = z^{ν+1} J_{ν+1}` | agrees |
| primitive 10.43.1 (8.4), `e^{iνπ}K_ν` branch | `ν = ½` | `z^{3/2} K_{1/2}(z) = (π/2)^{1/2} z e^{−z}`, primitive `−(π/2)^{1/2}(1 + z) e^{−z} = −z^{3/2} K_{3/2}(z)`; the sign is `e^{i(ν+1)π}/e^{iνπ} = −1` | `∫ z^{ν+1} 𝒵_ν = z^{ν+1} 𝒵_{ν+1}` with `𝒵_ν = e^{iνπ} K_ν` | agrees |

**Adversarial table: untouched statements.** The diff touches no mathematical statement and no Lean declaration. Carried forward from `PRREVIEW-SpecialFunctionsBessel~6`, with its values:

| Statement | Instance | Computed | README | Result |
|---|---|---|---|---|
| 10.22.74, `A = 0`, negative control | `(3, 2, 1)`, `ν = 0` | partial integrals `0.73203, 1.46775, 2.93353` at `R = 100, 400, 1600` | diverges | Check correct |
| 10.22.74, `A = 0`, negative control | `(3, 2, 1)`, `ν = ½` | exact `0.0814337520` | `0.08143 37519 8…` | Check correct |
| 10.22.74, `A = 0`, `Re ν > ½` | `(3, 2, 1)`, `ν = 1` | `0.00735, 0.00366, 0.00183` | `0` | holds |
| 10.22.74, `A < 0` | `(4, 2, 1)`, `ν = ½` | `0.00041, −0.00010, −0.00003` | `0` | holds |
| 10.22.74, `A > 0` | `(2.9, 2, 1)`, `ν = ½` | `0.16595` at `R = 1600` | `0.16565` | holds |

and, by citation, the 13 rows of `PRREVIEW-SpecialFunctionsBessel~5` and the 48 rows of `PRREVIEW-SpecialFunctionsBessel~3` (the definitions `besselY`, `besselK`, the Wronskians, recurrences, connection formulas, generating functions, Gegenbauer's addition theorem, the integral representations, the continued fractions, the large-argument and Debye expansions, the zeros, 10.22.49, 10.22.64, 10.22.75, the spherical and Kelvin rows, the Layer 11 relations).

**Gate, order and build at `2022935`.**
- The worker's gate with the candidate merge order: every rule `0`, `OK`. My own run without that order differs only in `depcheck: NOT IN ORDER: SpecialFunctionsBessel (insert it after its last supplier)`, the placement of a roadmap the order does not list yet (not a finding).
- Dependency check with the candidate order and `--movable`: `depcheck: 229 roadmaps, 2124 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- `lake env lean` of `TauCetiRoadmap/SpecialFunctionsBessel/Suggested.lean`: 49 warnings, all `declaration uses sorry`; no error. The file is unchanged since `a310139`, so the one-tactic probe and the comparison of the 86 elaborated signatures with the README (0 lost binders) stand as reported there.
- The pull request changes nothing outside the folder; since `d095480` only `README.md` changed (4 insertions).
- Overlaps: no open pull request changes this roadmap, drops an id it cites, or cites an id it drops.

**Seeded sample.** None of the sampled targets (1.1, 1.3, 1.6, 1.7, 2.2, 3.2, 3.3, 4.1, 5.4, 7.2, 7.6, 8.2, 9.3, 10.2, 11.3) falls in the changed lines, which carry no locator of their own beyond the equation numbers 10.22.1 and 10.43.1 already in 8.1 and 8.4; they were not re-read. The README flags no locator as unverified.

**Remarks on untouched text (no change requested).**
- The description lists eight suppliers and then says "The README links into all seven"; the head has eight.
- The new bullet names items of Layers 1, 3, 5, 6, 8 and 9 explicitly; what SpecialFunctionsStruve takes from Layers 2 and 4 (the power series, the multiplication and addition theorems, the Neumann expansion, the half-odd orders) is covered only by the layer range. That is accurate as written.

## Not verifiable

- **Watson 1944**, p. 411 (DLMF's source for 10.22.74–10.22.75): no legal open copy; not read (carried from the previous report; untouched text).
- **Ownership against open pull requests** was checked this round only for the changed passage, against SpecialFunctionsStruve at its head; the other open roadmaps were not re-read.

## Source issues

- **Error** in DLMF-Bessel at 10.22.74, §10.22(iv), online Release 1.2.8: the source says the triple-product integral is zero whenever `A ≤ 0`, for all `Re ν > −½`; it should say `A < 0`, with `A = 0` giving zero only for `Re ν > ½` (divergent at `ν = 0`, half the `A > 0` value at `ν = ½`); affects a stated result.
