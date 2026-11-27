# Review of GlobalGaloisDeformations (pull request #3181 at bd50e0d)

**Verdict:** accepted

**Summary.** An incremental re-review of the 6 lines changed since `a37cbe8`: one sentence of the Tau Ceti supplier contract now names the second input to the `k`-linearity of the class map `Z1 → continuousCohomology 1`, the linearity of the cohomology functor. The named instance exists at the pin under the stated name, in the stated file, for a commutative coefficient ring, and the sentence is now complete; the earlier small correction is repaired and the repair introduces nothing new. Accepted with no finding, no small correction and no format note; nothing is left for a human to decide.

## Previous findings

- The previous report had no finding (no R item). Its small correction C01 — repaired: "the naturality, with the `k`-linearity of the functor (`TauCeti.ContinuousCohomology.continuousCohomologyFunctor_linear`, in `TauCeti/RepresentationTheory/Homological/ContCohomology/Additive.lean`), makes the class map … `k`-linear".

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| Supplier contract (README lines 2119–2125): the class map `Z1 → continuousCohomology 1` is `k`-linear by naturality in `r • ·` and linearity of the functor | `_map` at `φ = id`, `F = r • 𝟙`; `r = 0`, `r = 1`; noncommutative coefficients | `_map` gives `[r•c] = map id (r•𝟙) 1 [c]`; `map_smul` (`Additive.lean` 181) and the instance (383) give `r • map id 𝟙 1 [c] = r•[c]`; `r = 0`: `0 = 0`; instance needs `CommRing`, `k` is a field | true, both inputs named and at the pin | none |
| `continuousCohomologyFunctor_linear` as cited | name, namespace, file at the pinned Tau Ceti | `instance continuousCohomologyFunctor_linear (n : ℕ) : (continuousCohomologyFunctor R G n).Linear R`, namespace `TauCeti.ContinuousCohomology` (line 57), `[CommRing R]` (line 375) | name, namespace and path as written | none |
| 8.2 (untouched, depends on the sentence): `L_v` is the image of `L¹_v ⊆ Z¹` in `H¹`, a `k`-subspace | against the changed sentence | image of a `k`-subspace under a `k`-linear map; over `k = 𝔽₄` an additive-only map could give a subgroup of order 2, not a subspace | consistent | none |

The rows for the untouched statements stand as in the previous review, of `a37cbe8`.

- Source locators checked against the text: 0; the changed sentence carries none (it cites library declarations only).
- Library declarations opened at the pin: 4 (`continuousCohomologyFunctor_linear`, `Additive.lean` 383; `map_smul`, `Additive.lean` 181; `TopRep.explicitH1AddEquivContinuousCohomologyOfDiscrete` and `_map`, `CohomologyComparison.lean` 486, 502).
- Cross-roadmap citations in the changed passage: none.
- Record: no heading, layer, item or Lean declaration removed, retitled or added; the one hunk lies in "Exact supplier contracts".
- Seeded sample (3.3, 3.5, 3.7, 4.3, 4.6, 4.9, 4.11, 5.5, 5.7, 6.6, 6.7, 7.2, 7.4, 8.2, 8.7): none lies in the changed passage; 8.2 depends on it and is the third row.
- Automatic checks: all passed. Dependency check: `depcheck: 2 roadmaps, 12 edges, 0 problem(s)`. No change outside this folder and `TauCetiRoadmap/EllipticCurves/`.
- Elaboration of `Suggested.lean`: two `sorry` warnings (lines 50 and 65), nothing else. The file is unchanged, so the one-tactic probe and the binder check were not repeated.
- Pull request text: its paragraph on this roadmap now names the functor's linearity with the same declaration as the head; the title and the rest match the head, and it states that the roadmap is revised and removes nothing.

Overlap check: read ArithmeticGaloisDuality (main, and its two open revisions by name), LocalGaloisDeformationRings (main) and GlobalGaloisDeformationsPartII (open) as in the previous review; nothing shared. The changed sentence adds no object: the instance it names is Tau Ceti's.

Source independence: changed passages only; 1 passage compared, a supplier contract with no source wording, with 0 sources; none shared. Largest share of locators: KW, as in the earlier reviews. Contents not compared: the change adds, removes or reorders no layer.

Research link: the roadmap's headlines are the presentations and Taylor–Wiles generator counts of global deformation rings used by Khare–Wintenberger (2009) and Allen–Calegari–Caraiani–Gee–Helm–Le Hung–Newton–Scholze–Taylor–Thorne (2023), with the tangent-space dictionary of Kisin's lectures and Gee's notes; rests on the README's overview and References and on Gee lines 598–608.

## Not verifiable

- Whether this head and the other open pull request reported as conflicting with this one merge cleanly was not tested; the reported conflict is in a file outside this folder.

## Source issues

- none

## For the human reviewers

- none
