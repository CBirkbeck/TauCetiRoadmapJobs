# Review of Polylogarithms (pull request #1424 at bd1c355)

**Verdict:** accepted

Incremental re-review of 0 changed lines since `bd1c355`, and of the pull request's title and description against this head. No finding.

## Previous findings

- R01 — repaired: the description now reads “Direct suppliers on main, cited by name: PolylogarithmFunctions, StableHomotopyKTheory, AlgebraicCurves, AlgebraicTopology, AlgebraicVectorBundles, ComplexKahlerGeometry, DGFloer, DifferentialGeometry, GeometricCurrents, GeometricTopology and SchemeAndStackFoundations.”

## Verified sound

The folder did not change; the rows are for the statements the description cites.

| Statement | Instances tried | Values computed on each side | Result |
| --- | --- | --- | --- |
| Description: “`zagier_three_exists` … a nonzero rational multiple of ζ_F(3)” (`Suggested.lean:221`) | `F = ℚ`, `c = [1]` | `d = 1`; `IsCycle3`: `b(1) ⊗ u(1) = 0` since `u(1) = 0`; exponent `3·(1−1) = 0`, `√|disc| = 1`; `L₃(1) = ζ(3)` | `Z₃ = 1·ζ(3)`, `q = 1 ≠ 0` |
| the same, with a complex place | `F = ℚ(i)`, `c = [1]` | `r₁+r₂ = 1`; exponent `3·(2−1) = 3`, `√|−4| = 2`; left `π³ζ(3)/2`; `ζ_F(3) = ζ(3)·π³/32` | `q = 16 ≠ 0`, rational |
| `singleValued 3 1` as defined (`Suggested.lean:47`) | `z = 1` | `k = 0` term `Li₃(1) = ∫₀¹ log t · log(1−t)/t dt = ζ(3)`; `k = 1, 2` carry `log‖1‖^k = 0`; `n` odd, real part | `ζ(3)`, the endpoint the description keeps |
| Description: “eight headline theorems” | sorried theorems at the head | lines 118, 139, 145, 150, 162, 221, 232, 262: eight; the sentence names eight | agrees |
| Description: “Direct suppliers on main” (eleven names) | every roadmap name in the README, against main's folders | on main and named in the README: eleven, the same eleven; named and open: fourteen, each a supplier with an open pull request | agrees |
| Description: “Everything else named in the README (Polylogarithms, Part II and HabiroNahmSeries) is a consumer” | remaining roadmap names in the README | `ZagierConjecturePolylogarithms` (the name of Part II, README `:21`, `:1553`) and HabiroNahmSeries (`:1553`); no third name | agrees |

The rows for the untouched statements stand as in the previous review, of `bd1c355`.

- Description read sentence by sentence against the head. Summary block: weight-two descent, Borel normalization and ideal volume (Layer 2); both weight-three theorems (`Suggested.lean:221`, `:232`); every unital ring (README `:167`); rank filtration without Adams identification (`:539`, `:612`); residue field with at least four elements (`:381`); `[1]₃` kept (`:312`, `:491`); conjectures as motivation (`:612`, `:655`). All agree.
- Change stated correctly: the pull request adds the folder (README, `Suggested.lean`, `metadata.toml`; 1852 insertions, nothing removed); the totally real even-weight sentence matches README `:655` and §4.7.
- Cross-roadmap citations resolved: 4. HabiroNahmSeries (open head, README lines 92–94: consumes §§2.1 and 2.3); MotivicEtaleKTheory (open head, line 728); K3BlochGroups (open head, line 2361); BorelRegulators (open head, line 846). Each states the same direction of supply as this README.
- Seeded sample: no sampled section lies in a changed passage, the folder being unchanged; no source locator was opened this round.
- Gate at `bd1c355`: every check passes (rerun; all counters 0). Dependency check: `depcheck: 244 roadmaps, 2229 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line. Outside-folder diff against the merge base: empty.
- Elaboration of `TauCetiRoadmap/Polylogarithms/Suggested.lean`: exit 0, eight warnings, all `declaration uses sorry` (lines 118, 139, 145, 150, 162, 221, 232, 262). Signatures unchanged since `bd1c355`.
- Overlap check: read MotivicEtaleKTheory, K3BlochGroups, BorelRegulators, PolylogarithmFunctions; nothing newly shared. The auxiliary complexes `Aₚ`, `Aₚ,S`, `Hₚ` are MotivicEtaleKTheory's (§§5.2–5.3), the pre-Bloch group K3BlochGroups', the Borel regulator and zeta determinant BorelRegulators', `Lₙ` PolylogarithmFunctions'; this roadmap imports each.
- Source independence: changed passages only; the folder has no changed passage, so 0 passages compared with 0 sources; largest share G95, as in the previous reviews; no layer added, removed or reordered, so the contents were not compared again.

## Not verifiable

- The items of the previous reports' lists (the full induction of `relationSpecialization_induction` with poles, the OCR-garbled 22-term display of G95, cycle lifting in G95 §9.2, the constant `−4/3` of §5.18, the Borel scalars) are untouched and stand as recorded there.
- The description's sentence on AI assistance (the number of review and red-team rounds) describes the process, not the head; it was not checked.

## Source issues

- none

## For the human reviewers

- **Licence.** [GR] (Goncharov–Rudenko) is read from its arXiv text, recorded in the manifest with year 2026; whether a refereed version with the same numbering exists was not checked.
