# MathematicalBilliards design repair

This round settles the one finding of REV-DESIGN-MathematicalBilliards~2. The only file changed is `packages/MathematicalBilliards/design/README.md`: six lines deleted, nothing added. `design/plan.json` and `sources.toml` are unchanged. No commit was made.

## REV-DESIGN-MathematicalBilliards~2/F01 (P3) — applied

Old: three audit sentences under "Exact supplier contracts": "Every declaration below was read at the pinned Mathlib.", "Mathlib has no billiard map, … no Wiener lemma; this was checked by searching the pinned sources for the objects.", and "Every declaration below was read at the pinned Tau Ceti." New: all three are deleted. Every declaration-level contract is unchanged.

Verification. The finding is right. These sentences describe how the design was audited, not the mathematics, and the house style requires timeless text. The deleted absence paragraph named six objects: billiard map, twist map, non-wandering set, weak mixing, translation groupoid and Wiener lemma. Each one is already listed as owned in "Scope and ownership" (paragraph 1), which is the only section that may speak about library contents. So no ownership information is lost.

Pattern search. I searched the whole README, `design/plan.json` and `sources.toml` for more process or audit wording ("was read", "checked", "searched", "pinned", "audit", "inspected", "confirmed", "at the head", "current", "removed", "review", "round"). Nothing else needs repair:
- The one other hit is §5.4: "the statement `ρ ∈ (0, 1)` pins the normalisation". There "pins" is used mathematically.
- The plan's supplier entries contain only contracts.
- "No gap: every prerequisite above is stated where it is cited." stays. It states a property of the design (the plan's `gaps` list is empty), not a history.

## Checks

**Dependency gate.** Command as given in the brief. Output:

```text
candidate: MathematicalBilliards is not in the merge order yet; checked as if placed after QuasiregularMaps (the intake inserts it when its design is accepted)
depcheck: 236 roadmaps, 2133 edges, 0 problem(s)
```

There is no UPWARD and no CYCLE line. "Not in the merge order yet" is expected at the design stage.

**Structure after the edit.**
- 12 `## Layer` headings and 52 numbered `### k.n` subsections, the same as before.
- The supplier section still has its subsections: From Mathlib, From Tau Ceti, and the four TauCetiRoadmap suppliers.

**Citations re-resolved on main (252dfa4).** Every cross-roadmap citation of the supplier contracts still resolves:
- SymplecticGeometry/CotangentLagrangian C3.1: the paragraphs "Convex planar billiards" (README line 527), the circle formula with `exists_billiard_periodic_reflection` (line 573) and "Finite-volume recurrence" (line 583).
- SymplecticGeometry/IntegrableSystems I5.0 (line 426) and I5.4 (line 623, with the continuity and cup-length statements at lines 678–682).
- RiemannianGeometry/Surfaces §3.1 (line 471, `integral_signedCurvature_add_sum_exteriorAngle_eq_two_pi` at line 489).
- GeometricTopology §1.7 (line 1049) and §2.3 (line 1386).

**The citation scanner's 27 leads.**
- 5 are source keys (BialyMironov2022, KatokHasselblatt1995, BoldrighiniKeaneMarchetti1978, MasurTabachnikov2002, ChaikaForni2026), not roadmap citations.
- 22 are this roadmap's own prospective `Billiards.*` names for a future `Suggested.lean`. None of them is a claimed pinned declaration.

**Overlaps.** No open pull request changes this roadmap, no cited id is dropped, and no id is defined only by an open revision. This round adds no construction, so no new ownership question arises. I did not re-check ownership against the open pull requests this round.

**Lean.** This is a design-stage package with no `Suggested.lean`, so nothing was elaborated and there were no `#check @name` comparisons. No Lean command was run.

**Sources.** No source was fetched, added or requested. No `needs-references.toml` was written.

**Gate failures listed in the brief.** None.

## Adversarial pass

The repair deletes text and adds or changes no mathematical statement, Check or worked example. So the pass covers only whether anything depended on the deleted text.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Deleted absence paragraph vs Scope ownership | The six named objects, each matched against Scope paragraph 1 | 6 of 6 present in Scope (billiard map; positive/negative, monotone and exact twist maps; non-wandering set; translation groupoid; weak mixing; Wiener's lemma for finite measures on `ℝ`) | No ownership lost | None |
| References to the deleted sentences elsewhere | README, plan, manifest searched for "below was read", "checked by searching", "no Wiener lemma" | 0 hits after the edit; 3 audit sentences before, 0 after | No dangling reference | None |
| Supplier-contract declarations | 16 Mathlib bullets and 8 Tau Ceti bullets, before vs after | 16 → 16 and 8 → 8, text byte-identical | Contracts preserved | None |
| Layer and section structure | `## Layer` and `### k.n` heading counts | 12 → 12 and 52 → 52 | Preserved | None |

## Maintainer notes

- No Lean name, section number or target id changed. No other roadmap's citation of this roadmap is affected.
- The review's stage-boundary remarks are not findings. They concern the future `Suggested.lean`: reconcile the inventory sentence in "How to read the build" with the actual file, and name in the module docstring any headline (polygonal flow, unfolding surface) that is not statable with a few simple definitions. These apply at the package stage. This round did not act on them, as the brief forbids widening scope.
- The review text contained no instructions directed at the worker. Nothing suspicious was found.
