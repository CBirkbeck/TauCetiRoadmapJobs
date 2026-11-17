# Review of LaguerreJacobi (pull request #117 at 7db30a3)

**Verdict:** accepted

No findings.

## Previous findings

- R01 — repaired: `TauCetiRoadmap/LaguerreJacobi/README.md` lines 169–172 list `MeasureTheory.Measure.restrict_pi_pi` (with `MeasureTheory.volume_pi`) under `### From Mathlib`; line 711 *Needs:* names both; line 726 "Layers 2 and 4; Mathlib `MeasureTheory.Measure.restrict_pi_pi`; Tau Ceti `TauCeti.piHilbertBasis`."

## Verified sound

| Statement | Instances | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| Supplier bullet for `restrict_pi_pi` (README lines 169–172) against the pin | `Mathlib/MeasureTheory/Constructions/Pi.lean` line 417 | pin: `(Measure.pi μ).restrict (Set.univ.pi fun i ↦ s i) = .pi fun i ↦ (μ i).restrict (s i)`, `[∀ i, SigmaFinite (μ i)]`, `[Fintype ι]`; README states the same equation and hypothesis | agrees | — |
| Layer 5 measure identification (README lines 706–709; docstring of `exists_hilbertBasis_pi_laguerreFunction`) | `ι` any `Fintype`; `s = Ioi 0` and `s = Ioo (-1) 1` | `Measure.pi fun _ => volume.restrict s = volume.restrict (univ.pi fun _ => s)`: `rw [volume_pi, Measure.restrict_pi_pi]` closes both; `rw [Measure.restrict_pi_pi]` alone fails (pattern not found) | holds; `volume_pi` is needed as cited | — |
| `exists_hilbertBasis_pi_laguerreFunction` (docstring changed, statement not) | `ι = Fin 2`, `α = 0`, `k = (1,0)`; against `k' = (0,0)` | norm²: `∫₀^∞(1−x)²e^{-x}dx · ∫₀^∞e^{-y}dy` = (1−2+2)·1 = 1; inner product with `k'`: `∫(1−x)e^{-x}dx` = 1−1 = 0 | holds | — |
| `volume_pi` locator in the pull request description | pin | `theorem volume_pi` at `Mathlib/MeasureTheory/Constructions/Pi.lean` line 660, proved by `rfl` | agrees | — |

The rows for the untouched statements stand as in the previous review, of `7789316`.

- Incremental re-review of the 17 lines changed since `7789316` (README lines 169–172, 706–711, 726; `Suggested.lean` lines 352–353, a docstring). No statement, heading, layer or supplier roadmap changed; no file outside the folder differs from the merge base.
- Seeded sample: none of the fifteen sampled sections (1.1–1.4, 2.1, 2.2, 2.4, 3.2, 3.3, 4.1, 4.2, 4.4, 6.1–6.3) falls in a changed passage; no source locator was added or changed, and the README flags none as unverified.
- Library declarations opened at the pins: `MeasureTheory.Measure.restrict_pi_pi` (`Mathlib/MeasureTheory/Constructions/Pi.lean` line 417), `MeasureTheory.volume_pi` (same file, line 660).
- Gate at `7db30a3`: every rule 0, targeted build passes. Dependency check: `depcheck: 261 roadmaps, 2597 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `lake env lean` of `Suggested.lean` gives 44 `sorry` warnings and nothing else; the changed docstring alters no elaborated type, so the `#check @` comparison and the one-tactic probe of the previous review stand.
- Pull request text against this head: "Adds … (`README.md`, `metadata.toml`, `Suggested.lean`); nothing outside the folder changes", "At `7db30a3` … 44 `declaration uses sorry` warnings" and "`MeasureTheory.volume_pi` … line 660" agree with the head; the description has no summary block.
- Overlap check: read OrthogonalL2Bases, SpecialFunctionsHypergeometric, SpecialFunctionsParabolicCylinder, SpecialFunctionsOrthogonalPolynomialsGeneral, SpecialFunctionsLegendre, SpecialFunctionsGamma, SpecialFunctionsBessel, SpecialFunctionsConfluent; the overlap listing at this head is unchanged (no dropped id, no second copy, no other pull request changing the folder); the change adds no object, so ownership is as in the previous review (product basis: OrthogonalL2Bases, in Tau Ceti, consumed; the families and their tensor bases: LaguerreJacobi).
- Source independence: changed passages only; 3 passages compared (the supplier bullet, the Layer 5 paragraph, the docstring) with 1 source, the pinned Mathlib file they describe, none shared beyond the formula; largest share DLMF, 27 of 28 locators; no layer added, removed or reordered, so the contents were not compared again.
- Research link: the Laguerre and Jacobi `L²` bases are the classical expansions of DLMF Chapter 18 and Szegő's *Orthogonal Polynomials* (Ch. IV, V) and the setting of Thangavelu's *Lectures on Hermite and Laguerre Expansions*; SpecialFunctionsBessel, SpecialFunctionsConfluent, NoncompactQuantumSymmetry and QuantumFoundations consume them (README motivation, consumers and references).

## Not verifiable

- Szegő, *Orthogonal Polynomials*, §4.3 (the `α + β + 1 = 0` remark): not openly available; untouched by this change.
- Abramowitz–Stegun Ch. 22, Askey, Temme Ch. 6, Thangavelu: listed as background, with no claim located in them; not read.

## Source issues

- none

## For the human reviewers

- **Licence.** DLMF (`dlmf.nist.gov`) is the source of 27 of 28 locators; the sources service has no licence class for the host, and it was read as the publisher's own open site. NIST states a copyright on DLMF.
