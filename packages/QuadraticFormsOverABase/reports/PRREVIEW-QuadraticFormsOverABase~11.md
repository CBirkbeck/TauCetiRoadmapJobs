# Review of QuadraticFormsOverABase (pull request #1930 at f56e7d0)

**Verdict:** accepted

## Previous findings

- R01 — repaired: "the Hasse–Minkowski theorem is GlobalQuadraticForms' (§5.5), and the Hilbert symbol and the Hasse invariant over a nonarchimedean local field are QuadraticFormInvariants' (Layer 6)" (README:1024–1026). The description's Provenance paragraph has the matching parenthesis.
- R02 — repaired: the description now reads "no `sorryAx` in any of the 17 definitions (`orthogonalGroup` is the range of Tau Ceti's `QuadraticMap.orthogonalToGeneralLinear`)".

## Verified sound

| # | Statement | Instances tried | Values computed (left / right) | Result | Change |
|---|---|---|---|---|---|
| 1 | README:1024–1025: the Hasse–Minkowski theorem is GlobalQuadraticForms' (§5.5) | GlobalQuadraticForms README:773–776 and QuadraticFormInvariants README:90–92 (main `e213fdd`); LeanPool `hasse-minkowski.yaml` | owner named: GlobalQuadraticForms §5.5 / §5.5 is isotropy over a number field `K ⊇ ℚ`; QuadraticFormInvariants defers Hasse–Minkowski to it | holds | none |
| 2 | README:1025–1026: Hilbert symbol and Hasse invariant over a nonarchimedean local field are QuadraticFormInvariants' Layer 6 | QuadraticFormInvariants README:1296, 1505 (6C); Tau Ceti pin | Layer 6: nonarchimedean local field with `2` invertible; 6C aliases `TauCeti.hilbertSymbol`; `localHasse` at `LocalField/QuadraticForm/Hasse.lean:93` | holds | none |
| 3 | README:1024: `ℚ`, `ℚ_p`, `ℝ` are fields in which `2` is invertible | `ℚ_2`, `ℚ_3`, `ℝ`; contrast `𝔽₂((t))` | `ℚ_2`: `2·2⁻¹ = 1`, `v₂(2⁻¹) = −1`; characteristic `0` in all three / `𝔽₂((t))`: `2 = 0`, not among them | holds | none |
| 4 | The cited §5.5 and 6C on `x² + y² − 3z²` over `ℚ` | the symbols `(−1, 3)_v` | `(−1,3)_3 = (−1/3) = −1`, `(−1,3)_2 = (−1)^(ε(−1)ε(3)) = −1`, `(−1,3)_∞ = +1`, product `+1` / anisotropic at `3`, so over `ℚ` | consistent | none |
| 5 | README:1018–1019: authors named in each file's header and in the project's entry in `LeanPool/projects/` | headers of the 6 cited files at `f8b9b72`; 3 cards (`hyperelliptic-chabauty-coleman.yaml` has `entry_module LeanPool.HyperellipticCurves`) | headers: Garibaldi ×4, jayyswan, Stoll / `authors:` Garibaldi; jayyswan, Coppola, de Frutos-Fernández; Stoll | holds | none |

The rows for untouched statements stand as in the previous review, of `c6ecaae`. `Suggested.lean` is byte-identical since `7cf144f`. Since `5626f46`, the README has changed only in Provenance and References.

- **Gate:** the worker's `gate.md` reports 0 on every check, including `build=0`. My rerun gives `depcheck=1` only for "NOT IN ORDER: QuadraticFormsOverABase", against the public order. The candidate order puts it at line 426, right after its last supplier, GeometryOfNumbersAndQuadraticArithmeticPartII (line 425). Not a finding.
- **Dependency check** (the brief's command, `--movable`): `depcheck: 261 roadmaps, 2517 edges, 0 problem(s)`. No UPWARD, CYCLE or `moved:` line.
- **Elaboration:** `lake env lean` on `TauCetiRoadmap/QuadraticFormsOverABase/Suggested.lean` exits 0 in 13 s. It gives 22 diagnostics, all `declaration uses 'sorry'`. The pins are unchanged (Lean v4.36.0-rc2, Mathlib `1b1ccf4`, Tau Ceti `2fd255d`). `signatures.md` shows 0 of 39 declarations losing a binder.
- **Outside the folder:** `git diff --stat origin/main...HEAD` outside the folder is empty. `c6ecaae..HEAD` touches only `README.md`.
- **LeanPool files opened at `f8b9b72`:** 6 headers (`Prod.lean`, `BaseChangeProjective.lean`, `Regularity.lean`, `NonsingularOverFields.lean`, `QuadraticEtale.lean`, `ForMathlib/Resultant.lean`), 3 registry cards, `NOTICE:531` and `LICENSE`.
- **Pinned declarations and citations resolved:** Tau Ceti `NumberTheory/HilbertSymbol/Basic.lean:47` and `LocalField/QuadraticForm/Hasse.lean:93`; the Tau Ceti pin has no Hasse–Minkowski theorem. On main: GlobalQuadraticForms README:773, and QuadraticFormInvariants README:90–92, 1296 and 1505.
- **Seeded sample and the pull request's text:** none of the 15 seeded targets lies in the changed passages. The description's Provenance paragraph and its Acceptance-test bullets agree with this head. All six suppliers it lists are open (`roadmaps list`).
- **Remark on untouched text:** Scope (README:83–84) gives forms over fields in which `2` is invertible to QuadraticFormInvariants alone. Provenance (README:1024–1025) now names GlobalQuadraticForms §5.5 for Hasse–Minkowski over `ℚ`.

Overlap check: read HyperellipticCurves (open, §0.1 at `91861b5`), ArithmeticStatisticsPartII (open, §1.3 at `c5b1568`), OrthogonalSpinGroups (Completed, on main; README:117 assumes `Invertible (2 : K)`), and GlobalQuadraticForms and QuadraticFormInvariants (main). They share these objects:
- `formDiscr` is owned by HyperellipticCurves §0.1 and consumed in 6.1.
- The ternary `4 Det` is owned by ArithmeticStatisticsPartII §1.3; this roadmap owns the general `δ'`.
- Hasse–Minkowski is owned by GlobalQuadraticForms §5.5, and the local Hilbert symbol by QuadraticFormInvariants Layer 6. This roadmap consumes neither.
- OrthogonalSpinGroups shares nothing.
- `overlaps.md` lists no pull request that changes this roadmap and no dropped or revision-only id.

Source independence: changed passages only. 2 passages (Provenance ¶1, last sentence; ¶2, the attribution sentence) were compared with 4 LeanPool texts at `f8b9b72`: `hasse-minkowski.yaml`, `composition-algebras-over-rings.yaml`, `hyperelliptic-chabauty-coleman.yaml` and `NOTICE`. The longest shared runs are "the Hilbert symbol" and "the Hasse invariant", 3 words each and standard names. No layer was added, removed or reordered, so the contents comparison and the locator shares stand as in the previous review.

## Not verifiable

- The description's "depth 31" in the open-pull-request dependency graph: no tool available here computes that depth.

## Source issues

- none

## For the human reviewers

- **Licence:** at `f8b9b72`, LeanPool's root `LICENSE` is Apache-2.0. The cards record `license: Apache-2.0` for `hasse-minkowski` (provenance mix), `composition-algebras-over-rings` (AI, skipgaribaldi/CompositionAlgebras-lean) and `hyperelliptic-chabauty-coleman` (AI, MichaelStollBayreuth/HyperellipticCurves). No `Suggested.lean` declaration shares a name or statement with them.
- **Licence:** LeanPool `NOTICE:531–559` records that `HasseMinkowski/RankCriteria.lean`, `HilbertSymbol/Existence.lean` and `Padics/Squares.lean` are derived from mariainesdff/HassePrinciple (Apache-2.0).
- **Coordination:** `README.md:1018–1019` says adaptation is agreed first with the authors of the code. The description says LeanPool's maintainers have not been contacted. Nothing is adapted in `Suggested.lean`.
