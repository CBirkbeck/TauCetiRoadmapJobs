# Review of YangMillsConnectionsAndCaloricGauge (pull request #2164 at 65b773c)

**Verdict:** accepted

## Previous findings

- R01 — repaired: `TauCetiRoadmap/YangMillsConnectionsAndCaloricGauge/README.md:2138` now says “10.5 uses 9.5”; the direct dependencies at lines 2390, 2424, 2491–2494 and 2526 agree.
- R02 — repaired: the description’s `<!-- roadmap-summary -->` block now says “Ordered by dependency, the build runs from critical Sobolev approximation and local Coulomb gauges through gauges at infinity to heat flow and the caloric manifold.”

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
| --- | --- | --- | --- | --- |
| §9.4 consumer sentence, README:2138 | Direct Layer 9 inputs of §§10.2–10.5 | 10.2: {9.4,9.5,9.7}; 10.3: {9.2,9.4,9.5}; 10.4: ∅; 10.5: {9.1,9.5}; all asserted memberships hold. | Agrees with four Needs lists | R01 repaired |
| §9.5 flat limit, cited by the changed sentence | U(1), φ(x)=exp(−‖x‖²), a=i dφ | F=0; Q=0; A(s)=a=A∞; at x=e₁ both equal −2i/e dx¹. | Static flat flow has the stated limit | none |
| §10.5 use of §9.5 in the decomposition | a=0, w=i dφ, φ(x)=exp(−‖x‖²) | W∞=w; c=−iφ; b=0; w=b−dc=−2i/e dx¹ at e₁; Π₀w=0. | Limit supplies the gauge component with the stated sign | none |

The rows for untouched statements stand as in the previous review, of `00950d4`.

- Source locators: 2 re-read, OhTataru-YMHF line 1952 (Corollary 5.15) and lines 3363–3385 (Proposition 7.9 and its use of that limit); no locator changed.
- Pinned declarations: `TauCeti.HasWeakFDerivOn` at `TauCeti/Analysis/Sobolev/WeakDeriv/Basic.lean:251` and `TauCeti.WeakDerivStep` at `TauCeti/Analysis/Sobolev/GraphStep/Basic.lean:209` opened; the 5 supplied elaborated signatures agree with the README, with no lost binder.
- PR text: title, summary and prose checked against the head and base change: 1 new folder, 3 added files, 5 Lean declarations (3 definitions and 2 theorems), 6 declared supplier gaps, 0 removed declarations and 0 changed paths outside the folder; no contradiction found.
- Gate: all scanner checks 0, OK; targeted Lake build and direct `lake env lean` both exit 0, only 2 `sorry` warnings at `Suggested.lean:139` and `Suggested.lean:152`; worktree clean.
- Dependency output: `depcheck: 244 roadmaps, 2206 edges, 0 problem(s)`; no UPWARD or CYCLE. Four local consumer references resolved; the repair changes no cross-roadmap citation.
- Overlap check: read scopes of IncompressibleFlows, InstantonFloerTheory, PDE (main and #1614), FourManifolds, RelativisticQuantumFieldTheory, SobolevMapsBetweenManifolds and PseudodifferentialOperators; scalar PDE spaces belong to PDE, first-order manifold Sobolev theory to SobolevMapsBetweenManifolds, smooth bundle elliptic theory to PseudodifferentialOperators, closed SU(2) theory to FourManifolds and cylindrical Floer theory to InstantonFloerTheory; this repair changes no ownership. The overlap report has 0 conflicting heads or dropped cited ids.
- Source independence: changed passages only; 1 README dependency passage compared with OhTataru-YMHF, no copied expression or reused material. Largest explicit source-key share before References: OhTataru-TopClass, 55 of 137 mentions. No layer added, removed or reordered; arrangement comparison stands from the previous review.

## Not verifiable

- The description’s attribution of “2 independent review rounds and 2 red-team rounds” is not independently verified; the previous report recorded the same limitation.
- Previously settled uncertified sources are outside the changed passages; none was requested again.

## Source issues

- none

## For the human reviewers

- none
