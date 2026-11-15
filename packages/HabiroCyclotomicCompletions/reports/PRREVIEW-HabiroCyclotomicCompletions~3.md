# Review of HabiroCyclotomicCompletions (pull request #1314 at 5ebc7e3)

**Verdict:** needs changes

## R01 (P3) — Remove the local instance from the Taylor theorem signature

**Location:** TauCetiRoadmap/HabiroCyclotomicCompletions/Suggested.lean:148: `letI : WithIdeal B := ⟨Ideal.span {(p : B)}⟩`.
**Claim:** The theorem signature violates the gate's prohibition on `letI` in public signatures.
**Witness:** Both the supplied gate and the independent rerun report `statement-hygiene=1`, identifying line 148 of `close_root_taylor_reexpansion`; every other scanner count is zero.
**Repair:** After the `IsAdicComplete` binder, add `[WithIdeal B] (hI : (WithIdeal.i : Ideal B) = Ideal.span {(p : B)})`; delete the `letI` line. This replacement elaborates in scratch and retains the p-adic topology and the computed translation below.

## Previous findings

The accepted review of `ff6a775` had no open findings; its three recorded repairs remain:

- R01 — repaired: TauCetiRoadmap/HabiroCyclotomicCompletions/README.md:1440–1447 retains all three proper-restriction statements; Suggested.lean:203,211,220 retains their positivity, distinctness, divisibility/adjacency and finite-nonempty hypotheses.
- R02 — repaired: TauCetiRoadmap/HabiroCyclotomicCompletions/README.md:35,61–64,77–85 retains the corrected named consumer sections; the fresh cross-roadmap resolver reports no unresolved citations.
- R03 — repaired: TauCetiRoadmap/HabiroCyclotomicCompletions/README.md:25–26 reserves backticked own names for declarations; Suggested.lean retains the target-signatures docstring and ordered layer comments. The gate reports zero missing README identifiers.

## Verified sound

| Statement | Instances | Left side computed | Right side computed | Result / change |
| --- | --- | --- | --- | --- |
| `valuationOrders`, inclusion annotation | Δ=6, n=1,2,3,6,12 | Valuations (0,0),(1,0),(0,1),(1,1),(2,1) | Each membership includes n>0; 0 is excluded | Annotated inclusion projects the positivity conjunct. |
| `component_decomposition` | Δ=1, x=q, order 1 | Sole component residue: 1 | Restriction residue: 1 | One valuation tuple; no extra factor. |
| `component_decomposition` | Δ=6, x=q, orders 1 and 2 | Component residues: (1,−1) | Restriction residues: (1,−1) | Projection direction retained; swapping factors fails. |
| Component projection and inverse | Δ=2, quotient by (q−1)(q+1) | (q+1)/2 has residues (1,0) | CRT reconstruction of (1,0): (q+1)/2 | Distinct classes remain distinct. |
| `close_root_taylor_reexpansion` (R01) | B=ℤ₂, p=2, ζ=1, ζ′=−1, x=q² | j=0,1,2 sums: 1−4+4=1; 2−4=−2; 1 | Taylor coefficients at −1: (1,−2,1) | Shift −2; M=1 satisfies closeness; repaired signature preserves these values. |

Untouched-statement rows stand as in the previous review of `ff6a775`.

- Scope: 3 changed lines, one explicit subset annotation; no outside-folder changes. The PR title and description remain consistent with this change.
- Sources: 6 supporting locators reopened in 2 legal texts: H lines 250,346,399; G lines 174,207,311. No seeded-sample passage changed; focused source checks cover §§3.3 and 5.3.
- Pinned APIs: `WithIdeal` and its topology, Mathlib/Topology/Algebra/Nonarchimedean/AdicTopology.lean:237,245; `IsAdicComplete`, Mathlib/RingTheory/AdicCompletion/Basic.lean:56. Completeness includes separation; the ideal fixes the topology.
- Signatures: scratch `#check @name` for all 32 named declarations succeeds; the changed theorem retains positive Δ, its component projection equation and both continuity clauses. No binder loss introduced.
- Padding: the changed component theorem closes with none of `rfl`, `simp`, or `infer_instance` in scratch probes.
- Validation: targeted build and direct `lake env lean` succeed, with 17 `sorry` warnings only; the scratch signature repair also elaborates. The gate fails solely on R01.
- Dependency check: `depcheck: 245 roadmaps, 2206 edges, 0 problem(s)`; no UPWARD or CYCLE line. Fresh cross-roadmap resolution reports zero unresolved citations.

Overlap check: read HabiroRings, HabiroNahmSeries, HabiroNumberFields, HabiroCohomologyFoundations and HabiroCohomologyFoundationsPartII; classical completion, Taylor translation and component splitting remain owned here; relative arithmetic comparisons, Nahm theory, number-field arithmetic, enhanced descent and trace comparisons retain their respective owners. No ownership change follows from the annotation.

Source independence: changed passages only; 1 Lean type-annotation passage compared with 2 sources (H and G), with no copied expression or reused material. The changed passage has 0 source locators. No layer was added, removed or reordered, so arrangement was not reopened.

## Not verifiable

- none within the incremental review scope.

## Source issues

- none

## For the human reviewers

- none.
