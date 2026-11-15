# FIX-DESIGN-StackPointsAndResidualGerbes~14

The review REV-DESIGN-StackPointsAndResidualGerbes~13 raises one finding. It is applied. The
review's "For the human reviewers" section was read and changes nothing.

## F01 (P3) — applied

Layer 4's Dependencies line in `packages/StackPointsAndResidualGerbes/design/README.md` (line 1381):
"SchemeAndStackFoundations §§1.8, 1.12, 1.19–1.21" → "SchemeAndStackFoundations §§1.7–1.8, 1.12,
1.19–1.21".

**Verification.** 4.2's third Check (README lines 1306–1308) cites the Check of
SchemeAndStackFoundations §1.7 on the generic point of `𝔸¹_ℚ/ℤ`. That section exists on main
(`TauCetiRoadmap/SchemeAndStackFoundations/README.md`, heading "### 1.7 Points of an algebraic space"
at line 2969), and its last Check (lines 2993–2994) says that no monomorphism from the spectrum of a
field represents the generic point of `𝔸¹_ℚ/ℤ`. So Layer 4 names §1.7, and its Dependencies line
left it out.

**Recomputing the Check the edit supports.** `ℤ` acts on `𝔸¹_ℚ` by `t ↦ t + n`. The representative
`Spec ℚ(t) → 𝔸¹_ℚ/ℤ` of the generic point has `Spec ℚ(t) ×_{𝔸¹_ℚ/ℤ} Spec ℚ(t) = ⊔_{n ∈ ℤ} Spec ℚ(t)`.
The two projections differ on every component with `n ≠ 0`, so the representative is not a
monomorphism. The residual space at the generic point is `Spec ℚ(t)/ℤ`, which is not the spectrum
of a field. This matches the supplier's Check and 4.2's Check. Nothing else in Layer 4 depends on
the Dependencies line, so no Check or worked example changes.

**The same pattern elsewhere.** A script compared, for each of the eight layers, the supplier
sections, gap slugs and ReductiveGroups layers named in the layer's body with its Dependencies line:

| Layer | Supplier sections named in the body, missing from Dependencies | Gap slugs missing | Listed in Dependencies but not named in the body |
|---|---|---|---|
| 0 | none | none | SchemeAndStackFoundations §4.13, written "(through gap:reduced-regular-smooth-local)": that gap names §4.13 as its supplier section, so the entry is intended |
| 1 | none | none | none |
| 2 | none | none | none |
| 3 | none | none | none |
| 4 | §1.7 (fixed by this edit) | none | none |
| 5 | none | none | none |
| 6 | none | none | none |
| 7 | none | none | none (ReductiveGroups Layer 1 is in both; Layer 3 is listed through gap:homogeneous-quotient-scheme) |

After the edit no layer is missing anything. `design/plan.json` already lists §1.7 among the
SchemeAndStackFoundations supplier sections. Target 4.2's *Needs* line does not name §1.7, because
only a Check cites it, so target 4.2's plan prerequisites stay as they are. The plan needs no edit.

## Adversarial pass on the changed text

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| Layer 4 Dependencies contain every supplier section Layer 4 names | Sections cited in 4.1–4.5, their Checks, Examples | body {1.7, 1.8, 1.12, 1.19, 1.20, 1.21} versus Dependencies {1.8, 1.12, 1.19, 1.20, 1.21} before the edit; equal after it | held only after the edit | §1.7 added |
| 4.2 Check 3 (`𝔸¹_ℚ/ℤ`, generic point) relies on supplier §1.7 | `Spec ℚ(t)` representative; closed point `t = a` | self-product `⊔_{n∈ℤ} Spec ℚ(t)` (not a monomorphism) at the generic point; at `t = a` the stabiliser is trivial (`a + n = a` forces `n = 0`), so a closed point has residual space `Spec ℚ` | consistent with supplier §1.7 line 2993 and §1.12 | none |
| Layer 0 Dependencies entry §4.13 | gap:reduced-regular-smooth-local in the README contracts (line 418) and in the plan's `gaps` | the gap's section is §4.13, and the Dependencies line names it through that gap | intended | none |

## Checks run

**Dependency check** (command of the brief):

    candidate: StackPointsAndResidualGerbes is not in the merge order yet; checked as if placed after AlgebraicModuliForArithmeticGeometry (the intake inserts it when its design is accepted)
    depcheck: 243 roadmaps, 2247 edges, 0 problem(s)

There is no UPWARD and no CYCLE line. As the brief says, "not in the merge order yet" is not a
defect at the design stage.

**Lean.** A design has no `Suggested.lean`, so there was nothing to elaborate and no `#check`
comparison to run.

**Gate failures.** None were listed for this round.

## Notes for the maintainer

- The edit is to one Dependencies line. No target, Lean name, section number or gap slug changed,
  so nothing that other roadmaps cite has changed.
- Ownership: this round states no new construction, so ownership is as recorded in the earlier
  rounds. The supplier citation added here (§1.7) was resolved against SchemeAndStackFoundations on
  main.
- `sources.toml` is unchanged. No new source was needed, and `needs-references.toml` was not
  written.
