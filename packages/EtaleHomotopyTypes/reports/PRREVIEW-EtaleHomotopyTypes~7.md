# Review of EtaleHomotopyTypes (pull request #1806 at fb437a1)

**Verdict:** accepted

Incremental re-review of 10 changed lines since eb2290e. No finding; the gate passes.

## Previous findings

- R01 — repaired: line 11 now reads "EtaleCohomologyFoundations §F.0.2 owns the homomorphism of these groups induced by a morphism of schemes, `EtaleFundamentalGroup.map`, with its continuity, its functoriality and its field case; §3.0b restates its definition"; §3.0b's three API bullets are gone; the description names the revision.

## Verified sound

| Statement | Instances tried | Values | Result | Change |
|---|---|---|---|---|
| `fundamentalGroupMap` (§3.0b) against `EtaleFundamentalGroup.map` (EtaleCohomologyFoundations §F.0.2, open head 0cefadf) | both bodies unfolded on σ; direction of transport; Spec ℚ(i) → Spec ℚ here against Spec 𝔽_(p²) → Spec 𝔽_p there | here `conjAut(mapAut σ)` = `α.symm ≪≫ whisker σ ≪≫ α` (Mathlib `Iso.conjAut_apply`, `Conj.lean` 76); there `α.symm ≪≫ isoWhiskerLeft (pullback f) σ ≪≫ α`, α = `pullbackCompFiberIso f x`; index 2 in both Checks | same map, same source and target `Aut (fiber x) →* Aut (fiber (x ≫ f))`; conventions agree | none |
| The supplier sentence of line 133 (continuity, functoriality, field case under `galContinuousMulEquivAutFiber`, "at a geometric point of its source") | each clause against §F.0.2 at 0cefadf, README lines 390–400 | continuity: stated; identity and composite through `pullbackComp`: stated; fields: restriction of absolute Galois groups under `galContinuousMulEquivAutFiber`: stated; point `x` of the source `T`: yes | the supplier states every clause cited | none |
| §3.0b after the deletion of its API bullets | each Check against the definition alone; consumers of the deleted bullets | identity of Spec ℚ ↦ identity; ℚ(i)/ℚ: image G_ℚ(i), index 2; z ↦ z² on 𝔾_m: image 2ℤ̂(1), index 2; trivial map: image not open. §§3.8a and 3.9a *Needs:* both list §3.0b and EtaleCohomologyFoundations §F.0.2 | three Checks remain and are true; no target cites a deleted bullet without citing §F.0.2 | none |
| `geometric_product_formula` (§3.8a), `finiteEtale_product_formula` (§3.9a): cite the changed passage | elaborated types against the previous head's | identical to the three signatures of the previous review; `Suggested.lean` is not in the diff | unchanged | none |
| Description against the head | each sentence of the summary block and the prose; title | 1 `def`, 2 sorried theorems; imports `Mathlib` and `TauCeti.AlgebraicGeometry.FiniteEtale.Fiber`; folder not on `origin/main`, 3 files, 1264 insertions; revision #1891 of EtaleCohomologyFoundations named as merging first; outside-folder diff empty | no sentence contradicted, no change left unstated | none |

The rows of the previous reviews for the untouched statements stand as in the previous review, of `eb2290e`.

- Source locators checked against the text: 2 (SGA1 line 4750 to SGA1 line 4763, V §7, printed p. 116: the induced homomorphism from the inverse-image functor and the isomorphism of fibre functors; SGA1 line 4767 to SGA1 line 4770: image the open stabilizer); both support §3.0b. Seeded sample: no target of it falls in a changed passage; §§3.8a and 3.9c cite §3.0b only through the unchanged definition.
- Library declarations opened at the pins: 5 (`FiniteEtale/Fiber.lean` 117 `fiber`, 179 `pullbackCompFiberIso`, 96 `pullbackComp`; `FiniteEtale/Galois/FundamentalGroup.lean` `galContinuousMulEquivAutFiber`; Mathlib `CategoryTheory/Conj.lean` 73 `Iso.conjAut`).
- Cross-roadmap citations resolved: 1 changed (EtaleCohomologyFoundations §F.0.2, `EtaleFundamentalGroup.map`): absent on main (1a19c9f), present at the open revision 0cefadf in README and `Suggested.lean` line 98; the description names that revision as a dependency, so the citation stands. The worker's one unresolved lead (`VanishingCycles.lisseDirectImageTransport`, README line 735) is in untouched text passed before.
- Elaboration: `lake env lean TauCetiRoadmap/EtaleHomotopyTypes/Suggested.lean`: two `declaration uses sorry` warnings (lines 121, 141), nothing else.
- Gate, run on this head: every counter 0, `OK`. Dependency check: `depcheck: 244 roadmaps, 2229 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Duplication by object: the induced homomorphism now has one owner, EtaleCohomologyFoundations §F.0.2; the restated definition here carries a different fully qualified name (`TauCetiRoadmap.EtaleHomotopyTypes.fundamentalGroupMap`) and no API of its own.
- Overlap check: read this round EtaleCohomologyFoundations (main and its open revision); the induced homomorphism of finite étale fundamental groups is shared with it, owner EtaleCohomologyFoundations §F.0.2, cited here. EllAdicHomotopyTypesAndWeights, KanQuillen, SimplicialCategories, EnrichedLocalization, AnabelianGeometryAndNonabelianChabauty, StableHomotopyKTheory, BordismFormalGroups stand as read in the previous reviews; the worker's overlap lists are unchanged and nothing else is shared.
- Source independence: changed passages only: 3 passages (the scope sentence of line 11, the supplier sentence of line 133, the closing sentence of §3.0b) compared with 1 source (SGA1), none shared; the arrangement was not compared again (no layer added, removed or reordered).

## Not verifiable

- The description's "after 7 independent review rounds and 2 red-team rounds on the job board": the board's history is not among this review's inputs.
- Ownership against open pull requests was checked through the service's index of 2026-11-15T12:04:13Z only.
- Giraud, SGA4, FGV, BK, AM, Fr, SGA5: settled uncertified; no changed passage relies on their text.

## Source issues

- none

## For the human reviewers

- none
