# Review of PadicDifferentialEquationsAndRigidCohomology (pull request #1002 at 457e49f)

**Verdict:** accepted

No finding.

## Previous findings

- R01 — repaired: the description now lists, by section, all seventeen suppliers not on main and says "The other roadmaps the README names that are not on main, ColemanIntegration, KloostermanMomentsAndPotentialAutomorphy and KloostermanSheavesAndBesselIsocrystals, build on this one and are not prerequisites."

## Verified sound

| Statement or changed target | Instances tried | Values computed on both sides | Result; change |
| --- | --- | --- | --- |
| Description: "Seventeen of the README's suppliers are roadmaps not yet on main" | Every roadmap name in the README against `origin/main` (199 folders, `Completed/` included) | 20 names not on main: 17 cited with a section or layer, equal as a set to the 17 depends-on entries; 3 named only as extensions (README line 126, "What builds on it") | Agrees; none |
| Description's section lists per supplier | Each of the 17 bullets against every citation of that supplier in the README | CrystallineCohomology: CR.1.2–CR.6.5 cited, all inside Layers CR.1–CR.6; AbelianSchemesAndArithmeticModuli: A1.1, A2.2, A3.3, A3.6, A3.11, A5.7, A6.11, exactly the seven listed; FiniteFlatGroups…: R07.3.2–R07.3.3 used, R07.4.7–R07.4.8 only as sibling consumer | Agrees; none |
| `hasFiniteFreeResolution_polynomial`, RD.0.55(d) (description: "Serre's theorem") | R a field, N = k[t]/(t); zero ring; R = ℤ/4 | Field: hypothesis holds, `0 → k[t] → k[t] → N → 0` has length 1; zero ring: N = 0 free; ℤ/4: ℤ/2 has infinite projective dimension, hypothesis fails | Holds; hypothesis discriminates |
| `unimodularEquiv_C_eval_zero_of_monic`, RD.0.56(a) (description: "unimodular vectors over polynomial rings") | n = 0; n = 1; f = (t, 1) over ℤ[t] | n = 0: no index, vacuous; n = 1: monic unit of B[t] is 1, constants (1), P = 1; (t,1): P = [[1,−t],[0,1]], det 1, P·f = (0,1) = constants | Holds |
| Description: "FormalConnectionsOpers §6.2 … applied in RD.1.7, RD.1.10, RD.1.52 and RD.6.52a" | README paragraph "Shared formal differential theory" | README names the same four sections and `exists_cyclicVector`; `Suggested.lean` has 18 declarations, none on cyclic vectors | Agrees |

Untouched statement rows stand as in the previous review, of `457e49f`.

- Folder diff since the previous review: 0 lines; 0 files changed outside the folder; worktree clean at `457e49f`. The seeded sample falls in no changed passage.
- Title equals the README's first heading. Summary block, the two prose paragraphs, the "Dependencies" paragraph with its 17 bullets and the "Validation" paragraph read sentence by sentence against the README's summary, supplier contracts and conventions: no sentence contradicted, no supplier, removal or renumbering left unstated (the pull request adds the folder: 0 headings and 0 declarations removed).
- 31 supplier headings named by the description resolved at the suppliers' open heads (AbelianSchemesAndArithmeticModuli 7, DeligneWeightsAndPurity §§0.10, 1.10, 2.7, 4.3, 4.4, 7.15 and Layers DWP.0–DWP.1, FiniteFlatGroupsAndIntegralPadicHodgeTheory 2, PadicPeriodRings 3, ClassicalAdicEtaleCohomology 2, DerivedDeRhamCohomology 2, LefschetzPencilsAndVanishingCycles 1, ModularCurvesPartII 1, AdicCoefficientsAndComparisons 1, and the 5 of the previous review); the citation resolver lists no cross-roadmap citation found nowhere.
- Elaboration of `TauCetiRoadmap/PadicDifferentialEquationsAndRigidCohomology/Suggested.lean`: 14 `sorry` warnings, 0 errors, no other message.
- Gate: the worker's gate at this head passes every check, the targeted build included. Dependency check with the supplied merge order: "depcheck: 245 roadmaps, 2251 edges, 0 problem(s)".
- Rerunning the gate with the unmoved order prints "UPWARD: PadicDifferentialEquationsAndRigidCohomology (#122) -> CongruenceSpectralGap (#159)"; the supplied order has CongruenceSpectralGap at line 122 and this roadmap at line 123, so this is the order's pending move, not a defect of the roadmap.
- Remark on untouched text: README line 11268 glosses DerivedDeRhamCohomology Layer 1 as *Derived completion and compatible perfect towers*; that layer's heading at its open head is "Layer 1: Completion and filtered modules". The layer exists and is the one meant.

Overlap check: read PadicDifferentialEquationsAndRigidCohomologyPartII, CrystallineCohomology, NoncommutativeAndEquivariantIwasawa; Part II consumes this roadmap; constant-coefficient rigid cohomology of smooth schemes is owned by CrystallineCohomology §CR.6.4; the Robba carriers by NoncommutativeAndEquivariantIwasawa §F.6. The overlap list names no shared pull request, dropped id or second copy; the other lists stand as read in the earlier reviews.

Source independence: changed passages only; the folder has 0 changed passages, so 0 passages compared with 0 sources this round; the earlier comparison (largest share Kedlaya-Finiteness; arrangement independent) stands, no layer added, removed or reordered.

## Not verifiable

- The description's statement of AI assistance and of author-side red-team passes: provenance, not checkable from the head.

## Source issues

- none

## For the human reviewers

- none
