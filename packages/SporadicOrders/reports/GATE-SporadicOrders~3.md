# GATE-SporadicOrders~3: answers to human review

One review comment (CBirkbeck, 2026-10-28T21:34:38Z) with one distinct point (F01). Its
"Previous findings" and "Verified sound" sections report R02 and R03 as repaired and raise no new
point.

## H01 (CBirkbeck) — disputed

All five names exist at the Tau Ceti pin of the content repository's `main`, `358314d4ab97483df4fc4cb8adcc02e74a8d9f5a` (main's `lake-manifest.json`, bumped by main commit `0d209833`): `GroupPresentation.homEquiv` at `TauCeti/GroupTheory/Presentation/GroupPresentation.lean:207`, with exactly the README's signature `(P.Group →* G) ≃ {f // ∀ t ∈ P.transcribed, FreeGroup.lift f t.toFreeGroup = 1}`; `Relator.eval` at `TauCeti/GroupTheory/Presentation/Relator.lean:259`; `Relator.lift_toFreeGroup` at `:346`, stating `FreeGroup.lift f r.toFreeGroup = eval f r`; `Relator.commInvInv` at `:381`, defined as `.comm (.inv r) (.inv s)`; and `Relator.eval_commInvInv` at `:397`, with value `r⁻¹ s⁻¹ r s`. At this pin McLaughlin and six other sporadic modules use `commInvInv`, and no private `sourceComm` remains. The review read `a780c7ad`, which is the stale manifest on the pull-request branch: the branch was cut from main at `da1fce3b` (2026-10-01), and its three-dot diff touches only `TauCetiRoadmap/SporadicOrders/`. On merge, the roadmap is judged against main's manifest, so the README is correct as written. The commits `98efe4aaa`, `efdb12684` and `56aef1a2c` add these names between `a780c7ad` and `358314d`.

Pattern check: while re-opening every Tau Ceti locator in the contract at `358314d`, one file locator turned out to be inaccurate. `TauCeti.SporadicName` is declared in `TauCeti/GroupTheory/SpecificGroups/CFSG/Index.lean:1444`, not in `.../Sporadic/Presentation.lean`, which declares `SporadicName.presentation` (`:66`) and `SporadicName.Group` (`:131`). README §Exact supplier contracts, "From Tau Ceti", first bullet: old "`TauCeti.SporadicName` and `TauCeti.SporadicName.presentation` (`…/Sporadic/Presentation.lean`)" → new "`TauCeti.SporadicName` (`…/CFSG/Index.lean`), the twenty-six sporadic names, and `TauCeti.SporadicName.presentation` (`…/Sporadic/Presentation.lean`)". The count of 26 comes from `card_sporadicName` at `Index.lean:1460`.

## Adversarial pass (changed statements only)

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| Contract: `homEquiv` condition | pin `358314d`, `GroupPresentation.lean:207–231` | subtype condition is `∀ t ∈ P.transcribed, FreeGroup.lift f t.toFreeGroup = 1`; inverse is `PresentedGroup.toGroup` through `mem_relatorSet_iff` (`:183`) | matches README lines 119–125 | none |
| Contract: `lift_toFreeGroup` | `Relator.lean:346` | `FreeGroup.lift f r.toFreeGroup = eval f r` | matches README line 128 | none |
| Contract: commutator convention | `eval_comm` (`:292`) gives `⁅a,b⁆`, Mathlib `a b a⁻¹ b⁻¹`; `eval_commInvInv` (`:397`) gives `a⁻¹ b⁻¹ a b` | `comm (inv a) (inv b)` ↦ `⁅a⁻¹,b⁻¹⁆ = a⁻¹ b⁻¹ a b` | matches README lines 130–134 | none |
| Contract: `SporadicName` file and count | `Index.lean:1444–1460` | 26 constructors, `card_sporadicName : … = 26` | old locator wrong file | locator fixed |

`Suggested.lean` is unchanged (byte-identical to `dee3069`). No section variables exist, so no binder can be lost and no `#check` comparison was needed for this round. No new construction was added, so no ownership question arises. Ownership against open pull requests: unchanged from the previous round.

## Build and gate

- `lake build TauCetiRoadmap.SporadicOrders.Suggested`: `Build completed successfully (8992 jobs)`. The only warnings are the twenty `declaration uses sorry` warnings for the headline theorems.
- Gate (after commit `ad441fbe`): `gate SporadicOrders: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- Depcheck: `depcheck: 185 roadmaps, 1131 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line.

Note for the worker: the pull-request branch still carries Tau Ceti `a780c7ad` in its own `lake-manifest.json`. That is why a review run on the branch tree cannot find the five names. Merging main into the branch, or rebasing it onto main, would align the two. That step is outside this job.
