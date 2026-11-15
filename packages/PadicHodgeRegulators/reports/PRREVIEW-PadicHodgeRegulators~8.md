# Review of PadicHodgeRegulators (pull request #1498 at 0c9e8c6)

**Verdict:** accepted

No findings.

## Previous findings

- R01 — repaired: “Every roadmap in the task list below is a direct supplier that the README consumes by section or layer: besides PadicDifferentialEquationsAndRigidCohomology §RD.4.40 and Polylogarithms §§2.1,2.3, for example SchemeKTheoryOperations §7.3a and KTheoryFiniteLocalFields §1.8 …”; the repair introduces no new problem.

## Verified sound

| Statement | Instances tried | Values computed on the two sides | Result / change |
|---|---|---|---|
| `residueDilogValue_spans` (the description's “finite-residue dilogarithm argument”, p > 3) | p=5, s=1, x=2,3,4; control p=3, s=1, x=2 | p=5: li₂(2)=66≡1, /1 → 1; li₂(3)=228≡3, /2⁵≡2 → 4; li₂(4)=580≡0 → 0. Values {1,4,0}, differences {±1,±3,±4}: both spans 𝔽₅. p=3: li₂(2)=6≡0, value set {0}, span 0 ≠ ⊤ | Holds at p=5; `3 < p` excludes p=3, as the description's “bound p > 3” says |
| Description: “Every roadmap in the task list below is a direct supplier that the README consumes by section or layer” | all 25 names of the task list | Each occurs in `TauCetiRoadmap/PadicHodgeRegulators/README.md` with a § or Layer id (fewest: CohomologyComparisons §§4…, 3 times; PadicDifferentialEquationsAndRigidCohomology §RD.4.40, 3 times; ColemanPowerSeries Layers 1–2, 6 times) | Agrees with head |
| Description: six suppliers on main cited by layer or section; EffectiveBounds named only as an owner; three consumers | AlgebraicCurves, LocalGaloisGroups, NumberFieldArithmetic, PadicMeasuresIwasawaAlgebras, PolylogarithmFunctions, ProfiniteArithmetic, EffectiveBounds | All seven are on main (active or completed); the six carry Layer/§ ids (AlgebraicCurves Layers 0…, ProfiniteArithmetic §§0…, once each); EffectiveBounds occurs once, README line 17, no id; consumers at README line 2754 | Agrees with head; no roadmap cited by the README is missing from the description's three groups |

Rows for untouched statements stand as in the previous review, of 0c9e8c6.

- Folder: 0 lines changed since 0c9e8c6; outside-folder diff against the merge base: 0 paths. Title and description read sentence by sentence against the head (title, summary block, prose, dependency paragraph, validation line); no sentence is contradicted and no change is left unstated (the pull request adds the folder: 3 files, 7 Lean declarations, none removed).
- 6 cross-roadmap citations of the description resolved at the open heads: ColemanIntegration §L3.Fa.1 (“Rational K-groups with Adams weights”) and §L3.Fa.4 (de Jeu complexes and their map to K-theory), SchemeKTheoryOperations §7.3a, KTheoryFiniteLocalFields §1.8, PadicDifferentialEquationsAndRigidCohomology §RD.4.40, Polylogarithms §§2.1, 2.3.
- Generality sentences of the summary block checked at their sections: §1.9 (“with no reduction assumption”), §9.34 (“D need not be étale”), Layer 7 title (good and semistable reduction), §§9.26–9.27 (Coleman image, elementary divisors), Downstream consumers (signed Selmer, Euler systems, GrossZagierAndArithmeticHeights §1.9).
- The two citation leads are no defects: FontaineBPR1994 is a source id, and `KTheoryQ.dvr_localization_iso` is the name ColemanIntegration §L3.Fa.1 uses at its open head.
- Gate at 0c9e8c6: every check passed (rerun, all counters 0). Elaboration of `TauCetiRoadmap/PadicHodgeRegulators/Suggested.lean` exits 0 with `sorry` at lines 43, 81, 102 as the only warnings; one `import Mathlib`, no `set_option`, 4 real-bodied definitions and 3 theorems, as the validation line says.
- Dependency check: `depcheck: 244 roadmaps, 2233 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Headlines, padding probes, signatures and the seeded source sample stand as in the earlier reviews: no statement or locator changed.

Overlap check: read CohomologyComparisonsPartII, ColemanIntegration, PhiGammaModulesAndIwasawaCohomology, KatoEulerSystems, PadicHodgeTheory (no list names a roadmap on main); nothing shared. No conflicting head, dropped id or second copy is listed.

Source independence: changed passages only; the folder has no changed passage, so 0 passages compared with 0 sources; largest share LLZ2011, 43 of 297 keyed mentions, as counted in the earlier review; no layer added, removed or reordered, so the contents were not compared again.

## Not verifiable

- Nothing in this round. The earlier extraction limits for Nakamura2014 Theorem 3.10(2) and RJ2018 Théorème I.10 are outside this change.

## Source issues

- none

## For the human reviewers

- none
