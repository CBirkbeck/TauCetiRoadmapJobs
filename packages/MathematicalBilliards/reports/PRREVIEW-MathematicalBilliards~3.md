# Review of MathematicalBilliards (pull request #2255 at 5b627bb)

**Verdict:** accepted

## Previous findings

- R01 — repaired: the summary now names Tau Ceti’s plane topology, Bochner theorem and strongly continuous unitary groups, and identifies the smooth-table comparison with SymplecticGeometry/CotangentLagrangian through `v = cos δ` (README §2.5).

## Verified sound

| Statement | Instances tried | Left side computed | Right side computed | Result | Change |
|---|---|---|---|---|---|
| Corrected summary: smooth-map conjugacy, README §2.5, line 232 | Unit circle, `s = 0`; `δ = π/3`, `2π/3` | `Ψ(T(0,π/3)) = (2π/3,1/2)`; `Ψ(T(0,2π/3)) = (4π/3,−1/2)` | `β(0,1/2) = (2 arccos(1/2),1/2) = (2π/3,1/2)`; `β(0,−1/2) = (4π/3,−1/2)` | Both agree; fibre order reverses | Attribution repaired |

The other adversarial rows stand as in the previous review, of `5b627bb`.

- Incremental scope: 0 changed folder lines; 1 previous finding repaired; title and full quoted prose checked against the head and base diff (3 new files, 1320 insertions, 0 deletions); 0 outside-folder changes or description discrepancies.
- Source sample: 0 sampled targets changed; no source locators reopened. The seeded sample remains covered by the preceding review.
- Pinned declarations opened: 5 — `TauCeti/Analysis/Semigroups/Group/Basic.lean:74`, `TauCeti/Analysis/Semigroups/Group/Unitary.lean:107`, `TauCeti/Analysis/Bochner/CharFun/Bochner.lean:101`, `TauCeti/Geometry/Manifold/SMulGroupoid.lean:123,153`; the description’s library attribution agrees.
- Cross-roadmap references resolved: 7 roadmaps — CotangentLagrangian C3.1, IntegrableSystems I5.0/I5.4, Surfaces §3.1, GeometricTopology §§1.7/2.3, FactorRigidity §8.2, ProbabilisticAndMetricNumberTheory §§4.6/4.9a, ClassicalErgodicTheory’s supplier contract at README lines 288–298; 0 broken references.
- Gate: all checks 0, `OK`; targeted build passed. Dependency output: `depcheck: 244 roadmaps, 2206 edges, 0 problem(s)`; no UPWARD or CYCLE.
- Direct Lean elaboration: exit 0, 9 `sorry` warnings only; supplied elaborated types of all 18 declarations inspected, with no lost required binder or signature change.
- Overlap check: read ClassicalErgodicTheory, PlanarTopology, TeichmullerGeometry, ProbabilisticAndMetricNumberTheory, IntegrableSystems, CotangentLagrangian and ConformalMapping; smooth billiards belong to CotangentLagrangian, compact-pair Čech/cup-length theory to IntegrableSystems, continuous-action Koopman theory to ProbabilisticAndMetricNumberTheory, plane topology to pinned Tau Ceti, finite-regularity billiards and measurable real-flow weak mixing here; 0 competing ownership changes.
- Source independence: changed passages only — 0 folder passages compared with 0 sources; no layer rearrangement. Largest share BialyMironov2022, 16 of 90 locators, and the independent contents comparison stand as in the previous review; its waived/uncertified-source limitations remain.

## Not verifiable

- The description’s “6 independent review rounds and 2 red-team rounds on the job board”: process history cannot be verified against the supplied head.
- Text unavailable, settled as waived or uncertified: KatokHasselblatt1995, Tabachnikov2005, ChernovMarkarian2006, BoldrighiniKeaneMarchetti1978, MasurTabachnikov2002, ZemlyakovKatok1975 and KerckhoffMasurSmillie1986; no new source request.

## Source issues

- none

## For the human reviewers

- Licence: Hochman2012 (README line 976) is unpublished lecture notes on the author's page; Layer 12 cites it for the `ℤ`-action analogues of §§12.1–12.5.
- Not tested: wording and arrangement were not compared with the seven waived or uncertified sources (47 of 90 locators); Layers 7–11 cite, besides ChaikaForni2026, only these.
