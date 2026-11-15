# Review of InstantonFloerTheory (pull request #1083 at 0b47a8f)

**Verdict:** accepted

Incremental re-review of 0 changed lines since 0b47a8f; this round reads the pull request's title and description, which changed since the previous review, against the head. No finding.

## Previous findings

- R01 — repaired: the description now reads "`Suggested.lean` states no declaration, because none of the headline theorems is statable at the pinned Mathlib and Tau Ceti", and lists the five docstring headlines; the 3,261-byte prototype sentence and the old pins are gone.
- R02 — repaired: the validation paragraph ("including the unchanged prototype", "Metadata and dependency pins are unchanged…") is gone; the description now describes the README as it stands (Checks, `*Needs:*`, Examples, Dependencies, the `ZMod (2m)` Künneth sequence).

## Verified sound

| # | Statement (where the description cites it) | Instances | Values on each side | Result |
|---|---|---|---|---|
| 1 | "Genus-dependent nilpotence includes the genus-two case, where u²−64 already vanishes over C" (README lines 225, 340, 346) | cs1612 lines 31–32; `g=1,2,3,4` | `2⌈g/2⌉−1`: 1, 1, 3, 3; exponent 1 means `u²−64=0`, so `g=1,2` exact, `g=3` not; README line 346 lists `1,1,3,3` | holds; description agrees |
| 2 | "U²=T⁻¹ for the upward half-period variable" (lines 455, 459) | `U`, `T` on `(i, A_h)` | `U:(i+4, A+1/2)`, `U²:(i+8, A+1)`; `T:(i−8, A−1)`; `T·U²=id`, so `U²=T⁻¹` | holds; description agrees |
| 3 | "integral reducible identity with coefficient two", "cochain-dual … adapter" (line 257) | froyshov9903 lines 280, 291 | source: `dv − vd + 2δ⊗δ′ = 0` on cochains; transpose of `dv−vd` is `v*d*−d*v*`, sign reversed, matched by `δ'=−(δ_F)*` | holds; description agrees |
| 4 | "no reduced cobordism map beyond Frøyshov's domain (`H₁(W;Z)=0` and a negative-definite intersection form)" (line 263) | froyshov9903 lines 422, 1108 | source: homology-sphere ends, `H₁(W;Z)=0`, negative definite; README line 263 states the same two conditions | holds; description agrees |
| 5 | "no excision isomorphism beyond the top eigensectors over C" (line 332) | km0807 line 1945 (Theorem 7.7); `g=0`, `g=1` | sectors `(2g−2, 2)`: `g=1` gives `(0,2)`; `g=0` gives `−2` on a zero group (line 338), excluded by "positive genus" | holds; description agrees |
| 6 | "the genus-one relation `u² − 64 = 0`" (lines 225, 231) | `u=4μ(pt)`, `μ(pt)=±2` | `u=±8`, `u²=64`; `u²=16μ(pt)²=16·4=64` | holds |
| 7 | "both finite forgetful quotients" (lines 461, 467) | one generator | `Z[U^±1]/(U−1)`: rank 1; `Z[U^±1]/(U²−1)`: basis `1, U`, rank 2 | holds |

The rows of the previous reviews for untouched statements stand as in the previous review, of 0b47a8f.

- Description against the head: title, 3 summary-block paragraphs and 6 prose paragraphs read; each mathematical sentence was located in `TauCetiRoadmap/InstantonFloerTheory/README.md` (lines 3, 13, 17, 20, 21, 225, 257, 263, 269–276, 298–300, 322, 332, 340, 388, 402, 407, 411, 441, 455, 461, 479, 485, 487, 494, 512). No sentence is contradicted by the head.
- Description's account of `Suggested.lean` against the file: no declaration; the five docstring headlines (IF5; IF6; IF7a–IF7b; IF8; IF9–IF10) and the missing carriers named in the description are those of the module docstring; the closing sentence on linear algebra matches.
- "Adds the roadmap folder … no other folder is changed": the roadmap is not on `origin/main`; the folder holds `README.md`, `Suggested.lean`, `metadata.toml`; `git diff --stat origin/main...HEAD` outside the folder is empty. "Examples and Dependencies in every layer": 11 layers, 11 `### Examples`, 11 `### Dependencies`.
- Gate at 0b47a8f, my run: every counter 0, `OK` (the worker's run also reports `build=0`). `lake env lean` on `Suggested.lean`: exit 0, no output. The file declares nothing, so there is nothing to `#check` or probe with one tactic.
- Dependency check: `depcheck: 244 roadmaps, 2229 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Source locators checked this round: 4 (cs1612 lines 29–33; froyshov9903 lines 280–291 and 422, 1108; km0807 line 1945). The seeded sample falls outside the changed passages (the folder did not change).
- Overlap check: read GaugeQuiltFieldTheory, FourManifolds, FukayaTheory, DGFloer, YangMillsConnectionsAndCaloricGauge, HeegaardFloer, SeibergWittenTheory, TaubesGromov (scopes as read in the previous review, of the same head; `scratch/overlaps.md` lists no dropped id, second copy or conflicting pull request); odd-degree surface moduli `M(P,δ)`: GaugeQuiltFieldTheory GQ1; compact/local SU(2) ASD core: FourManifolds Layer 5; abstract determinant package: HeegaardFloer F0; instanton Floer homology and cylindrical ASD gluing: this roadmap. Nothing has two owners.
- Source independence: changed passages only; 0 passages changed in the folder, so none compared; largest share Daemi–Fukaya–Lipyanskiy (dfl07032 with dfl07038), about 20 of 85 locators; no layer added, removed or reordered, so the arrangement was not compared again.

## Not verifiable

- Donaldson, *Floer Homology Groups in Yang–Mills Theory*, and Donaldson–Kronheimer, *The Geometry of Four-Manifolds*: not in an open repository; their locators are carried from the previous reports.
- The description's "AI assistance" paragraph (which tools wrote which parts): no file of the head records it.

## Source issues

- none

## For the human reviewers

- **Licence.** Donaldson's book (about 13 locators) and Donaldson–Kronheimer (about 6) are cited by section and page without an open text (`TauCetiRoadmap/InstantonFloerTheory/README.md` lines 520–521); wording and arrangement were never compared with them.
