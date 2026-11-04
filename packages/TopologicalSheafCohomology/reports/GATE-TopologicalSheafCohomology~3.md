# GATE-TopologicalSheafCohomology~3: answers to human review of ac45da4

## H01 (rwst) — answered
The pull-request title and description (T2) are not in the roadmap folder, so this job does not edit them. The worker should retitle the PR (for example "Add topological sheaf cohomology roadmap") and rewrite the description from the README Summary (`TauCetiRoadmap/TopologicalSheafCohomology/README.md` line 3), dropping the stale "19 named declarations … with no admissions" claim (`Suggested.lean` has two `sorry` theorems and one `def`) and the reference to CharacteristicClasses as open.

## H02 (rwst) — applied
The point is correct. At the ImplicitAtlases head `3b7572e0`, §0.7 (its README lines 191 and 194) defines the open-cover colimit Ȟ^•(X; F) itself and proves finite-cover cofinality on compact X, and it never mentions this roadmap. README line 10 now says that ImplicitAtlases §0.7 defines this open-cover Čech cohomology on its locally compact Hausdorff spaces, together with refinement independence and finite-cover cofinality. It also says that on those spaces these are the specialisations of §1.2 (computed with the order-free complex of §1.1), and that this roadmap owns them because CharacteristicClasses C1.2b needs them without local compactness. The old wording, "both are statements of that consumer", called ImplicitAtlases a consumer, and that sentence is gone. The hypercohomology comparison through its §0.6 is now attributed to ImplicitAtlases as a statement of that roadmap. Line 221 changed from "can consume TS1.2 for open-cover Čech cohomology" to "can consume TS1.2 in place of its own open-cover definition, for …". The wording stays timeless instead of the suggested "is to consume … until #974 changes", because the README may not carry process narrative. No target changed.

## H03 (rwst) — answered
The follow-up proposed for ImplicitAtlases (consume TS1.2 and §1.4, and delete its own open-cover definition) is an edit to that roadmap, which this job may not touch. This roadmap now records the overlap in its scope paragraph (line 10) and the possible consumption in Downstream consumers (line 221). Removing the duplicate from ImplicitAtlases §0.7 is for that roadmap's reviewers.

## H04 (rwst) — answered
This confirms that T1 is fixed and asks for no change. The finite-cover cofinality, vanishing on ∅ and first spectral sequence items it lists (README §§1.2 and 1.4) are unchanged in this round.

## Adversarial pass on the changed statements

| statement | instances tried | values | result | change |
|---|---|---|---|---|
| ImplicitAtlases §0.7 open-cover Ȟ^• on LCH X is the specialisation of §1.2 | X = point, cover {X, X}: oriented complex vs ordered complex ℤ²→ℤ | both give H⁰ = ℤ, H¹ = 0 (§1.2 Check line 116) | agrees | none |
| same, compact X, finite-cover cofinality | Sierpiński space (compact, not Hausdorff, outside ImplicitAtlases' scope) | §1.2 gives P(X) in degree 0; ImplicitAtlases does not apply, so the specialisation direction is LCH ⊂ arbitrary | consistent | none |
| C1.2b needs it without local compactness | paracompact Hausdorff, not locally compact (ℚ) | ImplicitAtlases' convention (its line 173) excludes ℚ; §1.2 covers it | justifies ownership | none |

## Checks
- Elaborated signatures: no declaration of `Suggested.lean` changed. The three signatures in the job's signature listing still match README §0.1, §2 and the TS3.5 statement.
- Ownership: checked against ImplicitAtlases at its head `3b7572e0` (read-only). No new cross-roadmap citation was added.
- Sources: no source was fetched and no locator changed.

## Build and gate
- `lake build TauCetiRoadmap.TopologicalSheafCohomology.Suggested`: Build completed successfully (8976 jobs). The only warnings are `declaration uses 'sorry'` at Suggested.lean:32 and :63.
- Gate (after commit `f3cac1b1`): `gate TopologicalSheafCohomology: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- Depcheck: `depcheck: 207 roadmaps, 1460 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line.
