# Review of WeightsInEtaleCohomology (pull request #1001 at 2103290)

**Verdict:** accepted

Incremental re-review of 2 changed lines since `9e753f8`, with the pull request's title and description read against this head. No finding.

## Previous findings

- R01 — repaired: the description's summary block now reads “Layer 1 connects Mathlib's `Representation`, `LinearMap.charpoly` and `IsArithFrobAt` to arithmetic Galois representations, and Layer 6 hands fixed-form polynomials to a compatible-family interface.”

The repair introduced no new problem: the three Mathlib names occur in the README at lines 71–87 and 127 (Conventions, supplier contracts, §1.1) and the interface is §6.2 (line 718), fed by §6.3.

## Verified sound

| Statement | Instances tried | Values on each side | Result |
| --- | --- | --- | --- |
| README line 85, “Use Mathlib at `1b1ccf4` and Tau Ceti at `2fd255d`” | `lake-manifest.json` and the checked-out packages at this head | manifest: mathlib `1b1ccf4b088b…`, TauCeti `2fd255d997f4…`; package heads the same two commits | The pins named are the pins built against. |
| `newform_ramanujan` with `newformHeckePolynomial` (cited by the changed sentence: “Tau Ceti's bundled newforms and coefficient fields”) | `Δ`: `N=1`, `k=12`, `p=2`, `a₂=−24`, trivial character; boundary `k=2` exponent | `X²+24X+2¹¹`: discriminant `576−8192<0`, `|α|²=2048`, `|α|=2^{11/2}≈45.25`; `24 ≤ 90.51`. `k=2`: exponent `1/2` | Holds on the instance; signature unchanged since `9e753f8`. |
| Library names of the changed paragraph, at the new pins | the 6 `Representation.*` operations, `LinearMap.charpoly`, `Matrix.charpoly`, `Matrix.charpoly_units_conj`, 3 `IsArithFrobAt.*` facts, `TauCeti.CoefficientField` | all found: `RepresentationTheory/Basic.lean` 313, 329, 425, 600, 618, 670; `Matrix/Charpoly/Basic.lean` 140, 291; `RingTheory/Frobenius.lean` 201, 206, 222; `Newforms/Fields.lean` 48 | No drift from the pin change. |

The rows for the untouched statements stand as in the previous review, of `9e753f8`.

- Gate, run on this head: every counter 0 (`set_option`, `sorry-data`, `imports`, `statement-hygiene`, `readme-ids-missing`, `round-labels`, `depcheck`, `metadata`, `stray-files`, `outside-folder`, `source-material`), result `OK`; the worker's run adds `build=0`.
- Dependency check with the merge order, `--movable`, the content repository and `--pr 1001`: `depcheck: 245 roadmaps, 2250 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Elaboration of `TauCetiRoadmap/WeightsInEtaleCohomology/Suggested.lean` with `lake env lean` at the new pins: one warning, `declaration uses sorry` at line 55, exit 0. The file is unchanged since `9e753f8`; the worker's elaborated signatures of the two declarations show no lost binder and equal the README's generality (every level, `2 ≤ k`, every good prime, every embedding of the coefficient field).
- Library declarations opened at the pins, 13 (table), plus `hasse_bound` at `TauCeti/AlgebraicGeometry/EllipticCurve/HasseBound.lean:57` for the description's “Tau Ceti's Hasse theorem” (README line 321).
- Description checked against the head, title and 14 sentences of the summary block and prose: all stand. The folder is new on the base (930 insertions, 59 headings, 2 declarations, none removed), which the description's folder line states; the pin names in README line 85 are not something the description describes.
- Seeded sample: none of the fifteen targets lies in the changed line, which carries no source locator; no source was opened this round.
- Overlap facts: no other open pull request changes this roadmap, no cited id is dropped or defined only by an open revision, no second copy on main. Diff outside the folder against `origin/main`: empty.
- Lead of the citation resolver, `VanishingCycles.etaleTraceFormula` (README line 101): untouched text passed by the previous review; a remark only.

Overlap check: read DeligneWeightsAndPurity, LefschetzPencilsAndVanishingCycles, EtaleCohomologyFoundations (the change touches no ownership statement); nothing shared — general weight theory, vanishing cycles and duality stay with those three, cited by section.

Source independence: changed passages only — 1 passage compared, it carries no source locator and no source wording; largest share WII, 13 of 68 locators; arrangement not compared again (no layer added, removed or reordered).

## Not verifiable

- Mokrane, *La suite spectrale des poids en cohomologie de Hyodo–Kato* (README line 431): no legal text found at an earlier review; not reopened, the passage is unchanged.
- Gillet–Messing, *Cycle classes and Riemann–Roch for crystalline cohomology* (README line 458): the same.

## Source issues

- none

## For the human reviewers

- none
