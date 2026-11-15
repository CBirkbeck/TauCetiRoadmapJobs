# Review of EllipticCurveModularityPartII (pull request #1491 at 99111f0)

**Verdict:** accepted

Incremental re-review of 0 changed lines in the folder since `99111f0`; this round reads the pull request's title and description against that head. No findings. The acceptance is conditional on the declared gap `gap:mixed-modular-jacobians` (ModularCurvesPartII).

## Previous findings

- none: the previous review, of `99111f0`, had no findings.

## Verified sound

### Adversarial table (statements the description cites)

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| Description: "13+4√3 rather than 169 at level 11" (`sharpG`, `sharpH`, §§1.6–1.8) | N=11 | μ(11)=12, μ(44)=72, 72/6=12; G♯=(√12+1)²=19.9282=13+4√3; F♯=(√2+1)²=5.8284; H♯=max=19.9282; majorants (12+1)²=169 and (2+1)²=9 | holds |
| Description: "surjective mod-p image for all p > 37" (`lemos_surjectivity`, §6.18) | elaborated signature | hypotheses `NonCM E`, `1 < n`, `HasCyclicIsogeny E n`, `37 < p`; conclusion `Function.Surjective (E.torsionGaloisAction p)`; README §6.18 has the same four hypotheses | agrees |
| Description: "§5.0a … those four degrees force geometric CM" (`prime_isogeny_degrees`, `noncm_prime_isogeny_degrees`) | the two lists | 12 primes {2,3,5,7,11,13,17,19,37,43,67,163} minus {19,43,67,163} = the 8 of the Lean list {2,3,5,7,11,13,17,37}; README line 610 states both | agrees |
| Description: "the 17 `declaration uses sorry` warnings" | elaboration at this head | 17 warnings, at lines 101, 106, 159, 182, 195, 206, 221, 248, 254, 260, 274, 281, 292, 307, 326, 334, 343; 32 declarations = 15 definitions + 17 theorems | agrees |

The rows for every other statement stand as in the previous review, of `99111f0`.

### The description against the head, sentence by sentence

- Title and "Roadmap folder … (README, `Suggested.lean`, `metadata.toml`)": the folder is not on main and holds exactly these three files (1525 insertions, 0 deletions); nothing is removed or renumbered.
- Dependencies paragraph: the 23 roadmaps of the depends-on block equal the roadmaps the README names that are neither on main nor consumers; the only other open roadmaps it names are ErdosProgressionPowers, FaltingsFinitenessAndIsogenyTheoremsPartII and ModularIwasawaMainConjectures, all under Downstream consumers (README lines 1151–1155). GroupSchemesOverABase §4.5 resolves at its current head `180c164`: README line 852 and `Suggested.lean` line 302 (`smooth_of_charZero`, `[CharZero k]`, `[LocallyOfFiniteType G.X.hom]`, no affineness), and its line 1428 lists this roadmap as a consumer.
- EllipticModularityEffectiveComparisons paragraph: #1810 is absent from the index of 477 open pull requests and the roadmap is not on main; a grep of this README for 640320 or 5280 gives 0 hits, and §5.0a (line 610) proves the CM statement for degrees 19, 43, 67, 163.
- Validation paragraph: gate rerun, all counters 0 (below); outside-folder diff empty.
- Summary block: each sentence was matched to its section — §1.4 (Martin), §§1.5–1.7 (F♯, G♯, H♯), §2.2 (deleted prime), §§3.3 and 4.7 (conductor exactly N, full two-torsion kept), §§5.0a–5.0b and 5.4–5.5, §6.18, §4.2 (arbitrary weight, level, character, ideal; ComputationalNumberTheory §3.4 is the level-one prime-modulus case), §6.0e (any coefficient-field degree, CM included), and the Downstream consumers paragraph for ErdosProgressionPowers.

### Counts

- Gate at `99111f0`, rerun: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`; the worker's gate adds `build=0`.
- Dependency check (`--movable`, `--pr 1491`): `depcheck: 245 roadmaps, 2241 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Elaboration: `lake env lean` on `TauCetiRoadmap/EllipticCurveModularityPartII/Suggested.lean` exits with 17 `declaration uses sorry` warnings and no other message.
- Cross-roadmap citations resolved this round: GroupSchemesOverABase §4.5 (head moved from `2e1e5e7` to `180c164`; section and declaration unchanged) and ErdosProgressionPowers' citations of §§2.2, 5.1, 5.4–5.5 and EC.0–EC.6 (its README lines 64, 83, 650, 1022, 1155, 1167). `scratch/citations.md` lists none unresolved.
- Source locators: none rechecked; no seeded target falls in a changed passage, since none changed.
- Overlap check: read EisensteinIdealAndRationalTorsion, ErdosProgressionPowers, EllipticCurveModularity (open, by vocabulary) and ModularForms (main); nothing shared — each is cited as a supplier or listed as a consumer, as in the previous review; the third list is empty.
- Source independence: changed passages only — 0 passages compared with 0 sources, since the folder did not change; arrangement not compared again (no layer added, removed or reordered).
- Remark (untouched text, no change requested): README lines 67 and 69 state `gap:kato-labelled-pushforward` and `gap:kato-labelled-reciprocity` on PadicFamilies; the board's `design/plan.json` lists only `mixed-modular-jacobians`, so the intake would not announce those two to PadicFamilies.

## Not verifiable

- **Kenku1982**, pp. 199–201 (§§5.0b, 5.2): recorded as uncertified, cited by its locator; text unchanged.
- The description's sentence on AI assistance ("0 independent review rounds and 2 red-team rounds") and the reason #1810 was closed describe events, not the head; only that #1810 is no longer open was checked.

## Source issues

- none

## For the human reviewers

- none
