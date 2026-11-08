# GATE-ComplexKahlerGeometry~2 — answers to the review of 751dc0c

Reviewed comment: one, by CBirkbeck (2026-11-05T00:13:09Z), carrying one finding (F01). Head
answered: `5d71cab`, now `ac2f5a7` after the repair below.

## H01 (CBirkbeck) — applied differently

The header `module` / blank / `public import Mathlib` was already at `5d71cab`
(`TauCetiRoadmap/ComplexKahlerGeometry/Suggested.lean:1–3`), and it does clear the Lake advisory, but
the suggested form "leave the rest unchanged" is incomplete: under the module system a declaration
without `public` is module-private, so a scratch importer with `#check @name` for the five theorems
reported all five as unknown identifiers (5 of 5 failed). The repair adds `@[expose] public section`
after the module docstring (`Suggested.lean:53`, the form `TauCetiRoadmap/CoboundaryExpansion/Suggested.lean:36`
uses on main); the five theorems move from lines 63/83/110/119/128 to 65/85/112/121/130, the same
scratch probe now resolves all five, and their elaborated types are character-for-character the
five types of the worker's signature file (no binder gained or lost). README unchanged: it names
only the five Lean names, and `readme-ids-missing=0`.

## Adversarial pass

No mathematical statement changed; the only row is the one thing that moved.

| Statement / convention | Instances tried | Values computed on each side | Result; change |
|---|---|---|---|
| Visibility of the five headline theorems under the module header | scratch file `import TauCetiRoadmap.ComplexKahlerGeometry.Suggested` with `#check @name` ×5, at `5d71cab` and at `ac2f5a7` | `5d71cab`: 5 unknown identifiers, exit 1; `ac2f5a7`: 5 resolved, exit 0, 5/5 types identical to signatures.md | Fail → pass; `@[expose] public section` added |

Ownership against open pull requests: no statement was added or changed, so nothing new to check;
the brief does not give the head of the second open pull request on this folder, so ownership
against it was not checked.

## Build

    lake build TauCetiRoadmap.ComplexKahlerGeometry.Suggested

Exit 0, "Build completed successfully (8954 jobs)"; no module-system advisory; exactly five
"declaration uses `sorry`" warnings (`Suggested.lean` 65:8, 85:8, 112:8, 121:8, 130:8); no error.

## Gate

    gate ComplexKahlerGeometry: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK

Exit 0.

## Dependency check (`--movable`)

    depcheck: 237 roadmaps, 2107 edges, 0 problem(s)

No UPWARD, CYCLE or moved line.

## Commit

`ac2f5a7` "ComplexKahlerGeometry: review repairs (expose public section so the module header keeps
the five theorems importable)", touching only `TauCetiRoadmap/ComplexKahlerGeometry/Suggested.lean`
(+2 lines). Not pushed.
