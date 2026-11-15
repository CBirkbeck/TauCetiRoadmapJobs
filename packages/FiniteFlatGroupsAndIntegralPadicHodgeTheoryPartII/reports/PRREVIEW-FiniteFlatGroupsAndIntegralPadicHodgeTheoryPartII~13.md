# Review of FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII (pull request #1843 at 18defe2)

**Verdict:** accepted

Incremental re-review of 10 changed lines since `006b950` (README line 44, the closing paragraph of the `Suggested.lean` docstring), and of the pull request's title and description against this head. No finding.

## Deferred findings

- D01 — stands
- D02 — stands

## Previous findings

- R01 — repaired: the description's summary now reads "At every prime, over complete Noetherian local rings with perfect residue field, it constructs the Zink ring Ŵ(R), frames with constant θ (p for the Dieudonné frame at odd p, 2−[4] at p=2)"; "Later layers assume p>2".
- R02 — repaired: the description now reads "Fifteen supplier extensions that this roadmap needs from earlier roadmaps are stated as exact contracts with locators."

## Verified sound

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| README line 44: Tau Ceti's `Module.Grassmannian.scheme` represents `Module.Grassmannian.functor` on affine schemes over Spec R, M in the universe of R | pinned Tau Ceti `2fd255d`; R=ℤ_p, Λ free of rank h, k=h−d; h=2, d=1 | `Basic.lean:71` has `(R : Type u) (M : Type u)`; `Points.lean:405` `schemeHomEquiv (A : Type u)`: `G(k, A ⊗[R] M; A) ≃ {h : Spec A ⟶ scheme R M k // h ≫ toSpec = …}`; ℤ_p and Λ both in `Type`; k=1 gives lines in rank 2 | true as written | none |
| README line 44: "Mathlib has no representing scheme" | pinned `Mathlib/RingTheory/Grassmannian.lean` | line 51 lists representability of `Module.Grassmannian.functor R M k` as not done; no `Scheme` in the file | true | none |
| README line 44: ModularCurves §0G owns the relative Grassmannian over an arbitrary base with its universal quotient | ModularCurves on main (`1a19c9f`) | label table line 4509: Layer 0G = Layer 0.7; line 367: "Layer 0.7 owns the relative version over a scheme"; lines 1079–1122: relative Grassmannian, charts, universal quotient | citation resolves through the label table; agrees with README lines 13, 74, 439 | none |
| `Suggested.lean` docstring, lines 58–61 | same two declarations | functor: Mathlib line 185; scheme: Tau Ceti `Basic.lean:161`, affine base Spec R only | true; "None of them" now has three antecedents | none |
| Description: frame constant (previous R01) | p=2, R=ℤ₂; odd p | θ=2−[4], ghost components 2−4^(2ⁿ) = −2, −14, −254; θ=p for odd p | description agrees with README lines 26, 198, 392 | none |
| Description: contract count (previous R02) | count by supplier | 1+1+3+4+4+1+1 = 15 at README lines 50, 68, 76, 78, 80, 88, 90, 92, 94, 102, 104, 106, 108, 118, 124 | "Fifteen" agrees | none |
| Description: "none of the 21 headline theorem groups is statable" | docstring bullets | 21 bullets, 0 declarations | agrees | none |

The rows for the untouched statements stand as in the previous review, of `006b950`.

- Description and title read against the head: every sentence of the summary block and the prose agrees; "adds" agrees with the change (folder not on `origin/main`, 1747 insertions, 0 deletions, 0 Lean declarations); "the base carriers are Mathlib's `WittVector`, `DividedPowers` and `Module.Grassmannian`" still holds.
- Library declarations opened at the pins, 4: `Module.Grassmannian.scheme` (`TauCeti/AlgebraicGeometry/Grassmannian/Basic.lean:161`), `Module.Grassmannian.schemeHomEquiv` (`TauCeti/AlgebraicGeometry/Grassmannian/Points.lean:405`), `Module.Grassmannian` and `Module.Grassmannian.functor` (`Mathlib/RingTheory/Grassmannian.lean:66`, `:185`).
- Cross-roadmap citations resolved in the changed passage, 1 (ModularCurves §0G, on main). The seeded sample has no target in the changed passages; no source locator was added or changed.
- Gate at `18defe2` (the worker's run): every counter 0, `build=0 OK`.
- Dependency check: `depcheck: 244 roadmaps, 2229 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- `lake env lean` on `TauCetiRoadmap/FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII/Suggested.lean`: exit 0, no output (the file declares nothing).
- Outside-folder diff against `origin/main`: empty. `scratch/overlaps.md`: no open pull request changes this roadmap, no cited id dropped, none defined only by an open revision.
- Overlap check: read GeometricSatakeAndFusionPartII, BunGAndNewtonStrata, ReductiveGroupsPartII (and SchubertGeometry for the Grassmannian); shared object: the Grassmannian scheme, owner Tau Ceti (affine base) and ModularCurves §0G (relative), cited by all, owned by none of them here.
- Source independence: changed passages only; 2 passages compared, neither cites a source (both describe pinned library declarations), none shared; the diff adds, removes or reorders no layer, so the arrangement was not compared again.

## Not verifiable

- The description's "4 independent review rounds and 2 red-team rounds" is a statement about the job board, not checkable against the head.
- The generated blocks of the description (`depends-on`, `merge-order`) are outside this check.

## Source issues

- none

## For the human reviewers

- `packages/FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII/design/plan.json` lists 11 gaps; README lines 102–108 state four further contracts on GeometricSatakeAndFusion (§§4.17, 0.29) whose slugs the plan lacks, so the intake does not announce them (D01).
- The plan's `needs` sentences for `full-fixer-cutting-tensors` and `ordinary-levi-full-fixer` are older than the README's at lines 88 and 94 (D02).
