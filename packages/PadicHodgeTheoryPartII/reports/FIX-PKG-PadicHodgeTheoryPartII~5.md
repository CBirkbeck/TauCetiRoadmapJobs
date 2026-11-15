# FIX-PKG-PadicHodgeTheoryPartII~5

Repair of the review `REV-PKG-PadicHodgeTheoryPartII~4` (two P3 locator findings). Both are confirmed and applied. Only `packages/PadicHodgeTheoryPartII/README.md` changed, by one token in each of two places.

## F01 (P3) — applied

The finding is correct. In the cached Chen14 text, journal page 742 is page marker 21 (running head "742 M. CHEN" at Chen14 line 908), and it ends with Proposition 3.3.3 (Chen14 line 946). The running head of page 743 is at Chen14 line 951. Proposition 3.3.4 is stated at Chen14 line 966, on p. 743. Its proof crosses to p. 744 (running head at Chen14 line 991) and ends at Chen14 line 1005.

Change in §0.6: `Chen14 Proposition 3.3.4(1), pp. 742–744` → `Chen14 Proposition 3.3.4(1), pp. 743–744`.

Pattern search: I checked every other Chen14 locator in the README against the page markers (journal page = marker + 721):
- 3.2.1 at line 856 is on p. 740, and its proof runs to p. 741.
- 3.2.3 at line 896 is on pp. 741–742.
- 3.3.1 at line 933 and 3.3.2 at line 939 are on p. 742.
- 3.3.3 at line 946 is on pp. 742–743.
- 3.3.5 at line 1008 is on p. 744.
- 3.3.6 at line 1028 is on pp. 744–745.
- 4.2.2 at line 1133 is on p. 747.
- 5.0.6 at line 1303 is on pp. 750–751.
- §3.1 runs from line 711 (p. 737) to line 820 (p. 740). The README's "pp. 739–740" names the passage it uses, the fibre functor at lines 781–820. The manifest's "pp. 737–740" names the whole section.

All of these are right. The same wrong range `pp. 742–744` also appears at `design/plan.json` line 485, in the §0.6 target's `sources` entry. That is outside the plan's top-level `gaps` list, the only part of the plan this job may edit, so I left it. The maintainer should change it to `pp. 743–744` when the plan is next regenerated. The plan's erratum locator "Proof of Proposition 3.3.4(2), p. 743" is right: the proof of part (2) is at Chen14 line 978, on p. 743.

## F02 (P3) — applied

The finding is correct. At the pinned Mathlib (`1b1ccf4b088b32fa3f23f2de1127433254a81e1e`, the `rev` in `lake-manifest.json` and the HEAD of the checked-out package), `Mathlib/RingTheory/AlgebraicIndependent/Defs.lean` line 54 is `@[stacks 030E "(1)"] def AlgebraicIndependent : Prop :=`. Line 53 is the end of its docstring. `design/plan.json` already records line 54.

Change in Exact supplier contracts, From Mathlib: `Defs.lean`:53 → `Defs.lean`:54.

Pattern search: I opened every other file-and-line locator in the supplier contracts at the pins (Mathlib `1b1ccf4b`, Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`), and each line is the declaration's own line:
- `Isocrystal.lean`:179, `isocrystal_classification`
- `UniversallyOpen.lean`:142, `UniversallyOpen.of_flat`
- `UniversallyOpen.lean`:43, `Scheme.Hom.isOpenMap`
- `Etale/Field.lean`:194, `iff_exists_algEquiv_prod`
- `ExteriorStabilizer/Character.lean`:101
- `Tannaka/Equivalence.lean`:188
- `Tannaka/GroupFunctor.lean`:138
- `Derived/Basic.lean`:69
- `Derived/Functoriality.lean`:68
- `Derived/Connected.lean`:153
- `Derived/Image.lean`:97 and :113
- `Isogeny/Basic.lean`:78
- `PointTopology/Basic.lean`:83 and :110
- `PointTopology/Group.lean`:102
- `PointTopology/Functoriality.lean`:110
- `PointTopology/IntegralPoints.lean`:102 and :116

None needed a change.

## Adversarial pass on the changed text

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §0.6 locator `Chen14 Proposition 3.3.4(1), pp. 743–744` | first page of the statement; last page of the proof | statement at Chen14 line 966, under the p. 743 running head (line 951); end of proof at line 1005, under the p. 744 running head (line 991) | range is exact | 742 → 743 |
| §0.6 mathematical statement (unchanged) | the review recomputed it on G_m with m ≠ 0, on b = 1 with μ = 0 for GL_2, and on V ⊕ 1 | H_cris = G_m; the scalar on lines of V ⊕ 1 is forced to 1 | not touched by this repair | none |
| Supplier contract `AlgebraicIndependent` at `Defs.lean`:54 | line 53; line 54 at the pin | line 53 is ` map out of the multivariable polynomial ring is injective. -/`; line 54 is `def AlgebraicIndependent : Prop :=`, whose body `Injective (MvPolynomial.aeval x …)` matches the README's prose "injectivity of multivariable polynomial evaluation" | locator and description agree | 53 → 54 |

No statement, hypothesis, Check, worked example or Lean declaration changed. No other object needed recomputing.

## Checks

- **Elaboration.** `lake env lean packages/PadicHodgeTheoryPartII/Suggested.lean`, run from the content checkout, exits 0 with no output (2.3 s). `Suggested.lean` is unchanged. It holds `import Mathlib`, the module docstring and an empty namespace, with 0 declarations. The `#check @name` audit therefore has no candidates, so I did not run it, and nothing changed.
- **Dependency check.** It reports no UPWARD, CYCLE or moved line:

  ```text
  depcheck: 245 roadmaps, 2241 edges, 0 problem(s)
  ```

- **Sources.** No new source is cited and `sources.toml` is unchanged. The manifest's Chen14 locator lists the proposition without a page and stays correct. No `needs-references.toml` was written.
- **Gate failures.** None were listed for this round.

## Notes for the maintainer

- `design/plan.json` line 485 still reads `Proposition 3.3.4(1), pp. 742–744`, the range fixed in the README by F01. This job may not edit that part of the plan.
- No name that another roadmap cites changed. No section, layer or target id changed.
- Ownership: no construction was added or moved, so no new ownership question arises.
