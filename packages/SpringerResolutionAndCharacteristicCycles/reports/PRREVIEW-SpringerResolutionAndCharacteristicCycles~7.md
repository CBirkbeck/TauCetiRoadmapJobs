# Review of SpringerResolutionAndCharacteristicCycles (pull request #1828 at f8ea4db)

**Verdict:** needs changes

Incremental re-review of 0 changed lines since f8ea4db; this round reads the pull request's title and description against the head. The folder needs no change: the one finding is in the description.

## R01 (P3) — The description classifies GroupSchemesOverABase as a consumer

**Location:** pull request description, the Dependencies paragraph: "Roadmaps on main are cited by name; everything else named in the README is a consumer, not a prerequisite."

**Claim:** Every roadmap the README names is on main, in the merge-order chain, or a consumer.

**Witness:** `TauCetiRoadmap/SpringerResolutionAndCharacteristicCycles/README.md` line 10 names "GroupSchemesOverABase §7.6", in Scope. That roadmap is the open pull request #1522: not on main, not in the chain, not under `## Downstream consumers` (line 1549).

**Repair:** Replace the sentence by: "Roadmaps on main are cited by name. GroupSchemesOverABase §7.6 (open) is named in Scope only to distinguish its multiplicative Grothendieck–Springer space from the additive g̃ owned here; nothing is consumed from it and it need not merge first. Everything else named in the README is a consumer, not a prerequisite."

## Previous findings

- none: the previous report, of f8ea4db, had no finding (both findings of the report before it were recorded there as repaired); the folder is byte-identical to the head it read.

## Verified sound

| Statement | Instances | Values each side | Result |
|---|---|---|---|
| §13.4 tangent bound (cited by the description's "zero-operator tangent bound") | SL₂, (w,v)=(e,e), (s,e), (s,s); torus | `1+1+1=3`, `2+0+1=3`, `2+1+0=3`, each = dim X_w = 3; torus `0+r+0=r` | sound |
| §13.5 smoothness criterion (description: "with its smoothness criterion") | SL₂ (s,e), (e,e) | codim ker(s−1)=1=ℓ(s)−ℓ(e); codim ker(0)=0=0; both components smooth | sound |
| §11.4 three bases (description: "three integral bases … components, simple … Verma (Cartan zero-fibre) cycles") | SL₂ | `M=((1,0),(1,1))`, det 1, `M⁻¹=((1,0),(−1,1))`; families `[Z_w]`, `ℒ_w`, `[X̄_w]` as described | sound |
| §11.3 route (description: "de Rham comparison and Schubert stalks rather than the full Riemann–Hilbert correspondence") | SL₂ stalk at the fixed point | `m_(s,e)·1 + m_(s,s)·(−1) = 0`, so `m_(s,e)=1=P_(e,s)(1)`; only Deligne's connection equivalence (C5.6) on cells is used | sound |
| Conventions line 27 (description: "explicit p>h … tori included") | torus | h=0, hypothesis is char 0 or p>0: every field | sound |

The rows of the previous review, of f8ea4db, stand for every other statement: no statement changed.

- The description, sentence by sentence against the head: the summary block and the long paragraph agree with the README Summary, Scope (lines 3–21), Conventions line 27, §§4.2–4.3, 6, 9, 10.4, 11.3–11.4, 12.2, 13.4–13.5, 14.4 and `## Downstream consumers`; "`Suggested.lean` declares nothing" agrees with the file (62 lines, a docstring and an empty namespace). The title says it adds a roadmap; the worker's comparison shows the folder absent from main, 1641 insertions, 0 headings and 0 declarations removed.
- Roadmap names in the README resolved: 10 on main (ReductiveGroups, ReductiveGroupsPartII, SchemeAndStackFoundations, AlgebraicVectorBundles, NilpotentOrbits, EnhancedDerivedSheaves, TypeAHeckeAlgebras, SchubertGeometry, AffineMorseLefschetz, RepresentationTheory/LieHighestWeight); 6 open suppliers (#848, #1034, #1038, #1040, #1056, #1312), exactly the description's "Depends on" list, at merge-order lines 34–118 before this roadmap at line 262; 4 consumers (lines 263–325); 1 other (R01).
- Remark, no change asked: "the Lean states only real-bodied definitions and theorems" and "`sorry` as the only warning" hold vacuously, the file having no declaration and the build no warning.
- Gate rerun on f8ea4db: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`; the worker's gate adds `build=0`.
- Dependency check with `--movable`: `depcheck: 244 roadmaps, 2231 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- `lake env lean` on `Suggested.lean`: exit 0, no output. No declaration, so nothing to `#check` and nothing for the one-tactic probe. Outside-folder diff against main: empty.
- `roadmaps overlaps` and `roadmaps resolve`: no other open pull request changes this roadmap, no cited id dropped or defined only by a revision, no unresolved citation or Lean name. The seeded sample meets no changed passage (none changed).
- Overlap check: read the scope and ownership of SheafConvolutionOnAbelianVarieties (#1809), TriangulineVarietyAndItsLocalModel (#1829), SmoothRepresentationsOfLocalGroupsPartII (#1815) and GroupSchemesOverABase (#1522, README lines 1440–1442) at their heads; each cites this roadmap's sections or names a distinct object; nothing shared. SchubertGeometry, NilpotentOrbits and KacMoody on main stand as in the earlier reviews.
- Source independence: changed passages only; 0 passages changed, so none compared; largest share BHS19, 166 of 270 source mentions; no layer added, removed or reordered, so the contents were not compared again.

## Not verifiable

- G86 and KT84 (settled as uncertified), Hum08 and KL80 (paywalled): cited by locator in §§11.1 and 11.3; untouched.
- The description's "after 2 independent review rounds and 2 red-team rounds on the job board": a statement about the board's history, not checkable against the head.

## Source issues

- **Error** in BHS19 at Lemma 2.4.8 and Remark 2.4.9, printed p. 324: the source says the simple characteristic cycle is invariant when P_w translates the first flag on the left; it should say the cycle is saturated along the fibres of F → G/P_w on the first flag; affects a stated result.

## For the human reviewers

- **Licence.** G98 is read from a copy on a third party's university page, and ElliottBB (notes by Heleodoro) from the seminar organiser's page, not the authors' own (`README.md`, References).
- **Scope.** Layers 8–10 take their locators from unpublished lecture notes and a thesis (M23, G98, ElliottBB, EH18); Layers 1–7 and 11–14 from refereed articles (BHS19, BR12, R08).
- **Pins.** The branch's `lake-manifest.json` pins Tau Ceti 358314d4 and Mathlib f6090c70; the README's `file:line` locators follow main's pins (2fd255d9, 1b1ccf4b), as the previous report records.
