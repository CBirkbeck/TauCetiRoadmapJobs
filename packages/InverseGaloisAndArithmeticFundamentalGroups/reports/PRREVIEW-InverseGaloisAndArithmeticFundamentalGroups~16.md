# Review of InverseGaloisAndArithmeticFundamentalGroups (pull request #850 at 2b715c7)

**Verdict:** accepted

## Previous findings

- R01 — repaired: the Dependencies paragraph names EtaleCohomologyFoundations, SchemeAndStackFoundations, BelyiMaps, AdicEtaleGeometry, EnhancedDerivedSheaves, AdelicAlgebraicGroups, ResolutionOfSingularitiesCharacteristicZero, JacobianChallenge and ClassFieldTheory; all nine are on main and cited in the README.
- R02 — repaired: the summary attributes tame tangential fibre functors and Hilbert irreducibility to this roadmap; its next paragraph credits paths and the arithmetic sequence to EtaleCohomologyFoundations. README:7533–7536 now makes the same distinction.

## Verified sound

| Statement | Instances tried | First side computed | Second side computed | Result | Change |
| --- | --- | --- | --- | --- | --- |
| IG.2 Hilbert irreducibility, cited by README:7535–7536 | `Y² − T` over ℚ, `t = 2, 4`; over ℂ | At 2: degree 2, discriminant 8, irreducible, Galois group C₂; at 4: roots ±2, Galois group 1 | Guard 1 never vanishes; 2 belongs to the Hilbert set, 4 does not; over ℂ every specialization splits | Hypotheses and exclusion agree | None |
| IG.1.2 tame tangential fibre, cited by README:7533 | `z² = t` and identity cover over ℂ, boundary 0, tangent 1 | Quadratic fibre `{t^(1/2), −t^(1/2)}` has 2 elements; inertia swaps them; identity fibre has 1 element | Kummer indices 2 and 1 are invertible; predicted fibre cardinalities 2 and 1, inertia orders 2 and 1 | Agrees | None |
| EtaleCohomologyFoundations F.0.A2, cited by README:7534 | `X = Spec ℝ`, geometric point `Spec ℂ` | Geometric group 1; arithmetic group and Γℝ both C₂; quotient map identity | Kernel of `C₂ → C₂` is 1; image is C₂ | Exact sequence agrees | None |

The rows for untouched statements stand as in the previous review of `9432671`.

- Scope: 9 changed README lines; 0 changed Lean statements; 0 files changed outside the folder; clean worktree.
- PR text: title, 3 summary paragraphs and 3 prose paragraphs checked against the head; 3 added files, 7 layers, 36 declarations, 0 removed headings or declarations; all 9 named on-main suppliers resolved.
- Changed citations: EtaleCohomologyFoundations README:200 and :368 supply F.0.2 and F.0.A2 on main; AnabelianGeometryAndNonabelianChabauty §1.1 consumes IG.1.2; ArithmeticDynamics' IG.2 supplier contract consumes Hilbert irreducibility.
- Seeded sample intersecting the changed text: IG.2.4 Hilbert irreducibility; Dèbes Theorem 5.2.9, printed p. 140, verified at debes-galois-theory line 5283. No new external locator was added.
- Pinned declarations opened for the PR prose: Mathlib `groupHomology.H2` in `Mathlib/RepresentationTheory/Homological/GroupHomology/LowDegree.lean:1059`; Tau Ceti `BraidGroup` in `TauCeti/GroupTheory/SpecificGroups/Braid/Basic.lean:99`; `Place.adicOfIrreducible` in `TauCeti/FieldTheory/FunctionField/Place/RatFunc/Basic.lean:252`.
- Gate with the supplied moved order and targeted build: every counter 0, `build=0 OK`, exit 0; worker gate also passes.
- Dependency-check output: `depcheck: 245 roadmaps, 2223 edges, 0 problem(s)`; no UPWARD or CYCLE.
- Direct `lake env lean` and scratch `#check @name` for all 36 declarations: exit 0, 18 `sorry` warnings each, 0 errors; the Hilbert signatures retain their field and number-field hypotheses, with no signature changes.

Overlap check: read EtaleCohomologyFoundations (groupoid and arithmetic sequence owned there), BelyiMaps (three-point theory owned there), SchemeAndStackFoundations (scheme/site foundations owned there), ArithmeticGaloisDuality (global duality owned there), ArithmeticStatisticsPartVIII, InductionRestrictionPartII and InverseGaloisAndArithmeticFundamentalGroupsPartII (consume this roadmap's Hurwitz spaces, lifting invariants or marked extensions). The changed paragraph preserves these owners; the overlap report lists no conflicting head or dropped citation.

Source independence: changed passages only; 1 changed paragraph compared with 1 external source (Dèbes) and 3 roadmap contracts; no copied expression or reused material. No layer was added, removed or reordered; the source-share and contents comparison stands as in the previous review of `9432671`.

## Not verifiable

- Previous source limits stand: the SGA 4½ secondary curve-trace citation, Serre's *Topics in Galois Theory*, Fried–Jarden, Poonen §8.2, Kollár IV.6.10, Huppert and Ribes–Zalesskii; no newly inaccessible source this round.

## Source issues

- none

## For the human reviewers

- none
