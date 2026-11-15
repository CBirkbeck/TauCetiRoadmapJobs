# Review of FiniteAffineBoundTightening (pull request #2216 at a1cee98)

**Verdict:** accepted

## Previous findings

- R01 — repaired: `TauCetiRoadmap/FiniteAffineBoundTightening/README.md:201` locates construction in 4.1; line 339 explicitly consumes 2.4 for graph preservation; line 357 consumes 4.1 construction and 4.2 greatestness.
- R02 — not repaired; previously withdrawn: `TauCetiRoadmap/FiniteAffineBoundTightening/README.md:59` and `Suggested.lean:8` retain the suggested-forms note required by the repository README's Prototyping paragraph. The previous withdrawal stands; no repair is outstanding.
- R03 — repaired: the description states seven headline theorems and 30 supporting definitions, totaling 37 declarations in `TauCetiRoadmap.FiniteAffineBoundTightening`; these counts and the namespace match the head.

## Verified sound

| Statement | Instances tried | Values computed: construction | Values computed: comparison | Result | Change |
| --- | --- | --- | --- | --- | --- |
| 4.3 `unique_full_width_optimum`, cited in the PR description | `A=(1 1)`, `X⁰=[0,2]²`, `B⁰=[0,4]`; competitor keeps X and uses `B=[1,3]` | Initial inverse candidates `[-2,4]`; step and every iterate equal initial tuple; limit widths `2+2+4=8` | Competitor inverses `[-1,3]`, feasible, width `2+2+2=6`; both variable widths 4; containment bounds joint width by 8 | Equality at 8 forces all initial endpoints and canonical products; full-width uniqueness holds | none |

The rows for untouched statements stand as in the previous review, of `a1cee98`.

- Incremental scope: 0 changed folder lines; 0 seeded-source targets changed; 0 new source-locator checks required; previous mathematical and padding checks stand.
- PR text: 3 added files, 706 inserted lines, 33 added headings, 37 added declarations, 0 base declarations removed, 0 outside-folder changes; first prototype has 50 declarations; Lean and metadata match `4656cdbb`; title, scope, pins and stated changes agree with head. CI run 43127019099 reports success at this exact head.
- Gate rerun: all reported checks 0, OK; dependency output: `depcheck: 245 roadmaps, 2206 edges, 0 problem(s)`; no UPWARD or CYCLE.
- Targeted build passes; direct `lake env lean` elaboration passes with exactly 7 `sorry` warnings. The build additionally emits Mathlib's module-system advisory for the unchanged import.
- Fresh scratch `#check @` elaboration covers all 37 declarations; types agree with the supplied signatures and README, with 0 lost binders and 0 changed types.
- Pinned declarations opened: `tendsto_atTop_ciSup`, `tendsto_atTop_ciInf` (`Mathlib/Topology/Order/MonotoneConvergence.lean:121`, `:155`), `tendsto_pi_nhds` (`Mathlib/Topology/Constructions.lean:818`), `TauCeti.IsConvexPolyhedron` (`TauCeti/Analysis/Convex/Polyhedron/Basic.lean:56`).
- Cross-roadmap references: 3 scope comparisons resolved on main (GraphConnectivityAndFlows, OptimalTransport, VariationalMethods); 0 roadmap suppliers, 0 changed supplier contracts.
- Overlap check: read ExactPenalties, ConvexLifting, BoundedConicHulls, ExponentialCone and OptimalTransport scope/ownership; nothing shared with this roadmap's concrete tightening construction.

Source independence: changed passages only; 0 changed roadmap passages, 0 new source comparisons; no layer changes requiring a renewed source-arrangement comparison.

## Not verifiable

- BCLL10 publisher version: previous review records the Springer paywall and comparison against the author manuscript; that source limitation is unchanged and was not reopened in this zero-line re-review.

## Source issues

- none

## For the human reviewers

- none
