# Review of AutomorphicLFunctionsAndLocalFactors (pull request #924 at 19069a6)

**Verdict:** needs changes

## R01 (P3) — The description names ZerosOfLFunctions among the dependencies; the head cites it nowhere

**Location:** PR description, Dependencies paragraph: “LFunctions, ZerosOfLFunctions and ReductiveGroupsPartII are folders on main.”
**Claim:** The sentence lists ZerosOfLFunctions as a supplier. The head has no such supplier: the citation was dropped at an earlier commit and the description was not updated.
**Witness:** `ZerosOfLFunctions` occurs 0 times in `TauCetiRoadmap/AutomorphicLFunctionsAndLocalFactors/README.md`, `Suggested.lean` and `metadata.toml`; `LFunctions` is cited at `README.md:26`, `ReductiveGroupsPartII` at `README.md:179`. The last commit touching the name is `f4dd9819`.
**Repair:** Replace the sentence with: “LFunctions and ReductiveGroupsPartII are folders on main.”

## Previous findings

- R01 — repaired: the summary now reads “Hecke L-functions of unitary idele-class characters take their continuation and functional equation from AnalyticNumberTheoryPartI §2.3a; the Godement–Jacquet matrix integral, which continues the standard L-function in every rank, specializes to that theory at n = 1.”

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| PR text: rank-one Hecke continuation (previous R01) | Summary sentence against README lines 3, 27, 166, 2505 | Description: consumed from AnalyticNumberTheoryPartI §2.3a, GJ specializes at `n=1`. Head: the same owner and the same specialization | Agrees | None |
| PR text: new roadmap, size | Folder at base and head | Base: 0 files. Head: 2595 + 711 + 1 = 3307 insertions, 0 deletions; description says 3,307 | Agrees | None |
| PR text: named suppliers | Each roadmap named in the Dependencies paragraph, counted in the folder | AnalyticNumberTheoryPartII: 19 bold citations; LFunctions: 1 (line 26); ReductiveGroupsPartII: 3 bold; ZerosOfLFunctions: 0 | Contradicted for one | R01 |
| PR text: build validation | Targeted build; direct elaboration | Build: success, `sorry` warnings + 2 module-system advisories. Direct: exit 0, 14 warnings, all 14 `sorry`, 0 errors | Agrees | None |
| AL.3.5.1 theta–Mellin Check (seeded sample) | `n=2`, `|det g|=3`, `θ₀=5`, `|a|=2`, `η=1`, `s=1` | Exponent `ns`: 3·5·2² = 60. Exponent `s`: 3·5·2 = 30. Source has `|a|^(ns)` | Check discriminates; agrees with source | None |
| AL.5.3.2 central vanishing (cited by the summary) | `Λ(s)=−Λ(1−s)`, holomorphic at 1/2 | `s=1/2`: `Λ(1/2)=−Λ(1/2)`, so `2Λ(1/2)=0`; with sign +1 no constraint | Consistent with “root-number central vanishing” | None |

Rows for untouched statements stand as in the previous review, of `19069a6`.

- Incremental scope: 0 folder lines changed since `19069a6`; 0 files changed outside the folder; title, prose and `roadmap-summary` block read against the head.
- Description claims resolved at the head: 14 (new roadmap and line count; §§5.3g, 5.3h, 5.3j; §2.3a; three named folders exist on main at 8ad4192; four consumers at README line 2505; intertwiner and residual factors at 2505; `tateLocalConstant` comparison at 188; test-integral ideal and period class at 5; Dirac reuse at 74 and 102; layers AL.4–AL.5 headings; central vanishing at 2448; Lean imports no roadmap; definitions with bodies; validation); 13 agree, 1 contradicted (R01).
- Lean form: 3 `TauCeti.*` imports after `import Mathlib`, no `set_option`, no `lemma`, 33 declarations as listed in the worker's change summary.
- Source sample: 1 locator checked, CogdellColumbia §1.1.3, printed pp.4–5, CogdellColumbia lines 256–269 and 273–275: Schwartz–Bruhat `Φ`, unitary `η`, `Re(s)>1`, the `ξ=0` term removed, exponent `ns`.
- Gate rerun: every check 0, `OK`; dependency check 0 problems; targeted build succeeds; direct elaboration exit 0 with `sorry` the only warning.

```text
gate AutomorphicLFunctionsAndLocalFactors: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
depcheck: 247 roadmaps, 2249 edges, 0 problem(s)
```

Overlap check: no folder change, so the scopes of AutomorphicSpectralTheory, GL2AutomorphicRepresentationsAndTransfer, AutomorphicLFunctionsAndLocalFactorsPartII, AutomorphicFormsOnReductiveGroups, MetaplecticAutomorphicForms, AnalyticNumberTheoryPartII, AnalyticNumberTheoryPartI and SmoothRepresentationsOfLocalGroups stand as read in the earlier reviews and were not reopened; the overlap listing reports no shared, dropped or conflicting id.

Source independence: changed passages only — 0 changed passages, 0 new comparisons with 0 sources; the sampled formula was rechecked against CogdellColumbia, none shared beyond the formula; no layer added, removed or reordered, so the contents comparison was not reopened.

## Not verifiable

- The inaccessible-source limitations of the earlier reviews stand; R01 depends on no source.
- The generated `depends-on` and `merge-order` blocks of the description are outside the text check and were not verified.

## Source issues

- none

## For the human reviewers

- none
