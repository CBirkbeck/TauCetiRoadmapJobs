# Review of HeightsRationalPointsAndObstructions (pull request #1017 at 3dc9d71)

**Verdict:** accepted

Incremental re-review of 0 changed lines since 3dc9d71; this round reads the pull request's title and description against the head. No finding.

## Previous findings

- The review of 3dc9d71 had no numbered finding. Its one remark on the description (the entry "#1522 GroupSchemesOverABase" under *Depends on* and in the merge-order chain) is resolved: the description no longer names that roadmap.

## Verified sound

### Adversarial table (statements the description cites)

| Statement | Instances | Values | Result |
|---|---|---|---|
| Description: "canonical heights normalized against the native `canonicalHeight` and `neronTatePairing`" (README Conventions) | pinned pairing on the diagonal; halved polar form of a quadratic ĥ | Pin: `neronTatePairing W P P = P.canonicalHeight`. Halved polar: `(ĥ(2P)−2ĥ(P))/2=(4−2)ĥ(P)/2=ĥ(P)`. README: `b(P,P)=2ĥ_(O)=canonicalHeight`. Both sides agree. | consistent |
| Description: "Abelian Mordell–Weil generalizes the elliptic `fg_point_of_numberField`" (§1.7, `AbelianVariety.fg_points`) | A elliptic over a number field; constant A over ℂ(t) | Pin has `fg_point_of_numberField : AddGroup.FG W.Point`; `[NumberField K]` excludes ℂ(t), where `A(ℂ)⊂A(K)` is uncountable. | consistent, not vacuous |
| Description: "Lang–Néron covers regular finitely generated extensions of any transcendence degree" (§1.10) | K=k(t), A constant; K=k(s,t) | Constant A: `A(K)=A(k)=τTr(A)(k)`, quotient 0. §1.10 states regular finitely generated K/k and reduces to `k(C)` by §1.9c; no degree bound. | matches the head |
| Description: "genus-one Brauer–Manin sufficiency assumes only a vanishing divisible part of Sha" (§6.3) | Sha finite; Sha with a ℚ/ℤ summand | Finite: `Sha_div=0`, radicals zero. ℚ/ℤ summand: divisible, lies in the radical of the pairing, hypothesis fails. §6.3: "If Sha(E/K)_div=0, in particular if Sha is finite". | matches the head |

The rows for the roadmap's other statements stand as in the previous review, of `3dc9d71`.

### The title and description against the head

- Folder change against the base: three files, 3234 insertions, 0 deletions; the description names the folder and exactly these three files (README, `Suggested.lean`, `metadata.toml`). No heading, declaration or supplier is removed, so there is nothing of that kind to state.
- Summary block, 14 claims checked at the head, none contradicted: height classes modulo bounded functions (§0.2); generalized global and polarized function fields (§§0.9–0.10); Tate's limit, canonical metrics, local Néron functions (§§0.18–0.24); Kummer maps fppf over arbitrary fields (§1.1); Chow's trace, Lang–Néron, Mordell–Weil (§§1.7–1.10); Layers 2–3 adelic points, Brauer–Manin, descent; Mordell by §5.12 "independently of §5.9 and of Shafarevich finiteness", §4.5 conditional; Siegel (§4.8); characteristic-zero Manin–Mumford (§5.6); finite-rank Mordell–Lang (§5.13); Bogomolov by §§5.17, 5.19; Layer 6 by genus, the conic Hasse principle (§6.2), four conjectures as propositions (§6.5); number-field Selmer/Sha, scalar heights and Northcott imported (SelmerIwasawaCohomology §2.12a, HeightsAndUnits, native); the six consumer families are those of "Downstream consumers".
- "everything else named in the README is a consumer": the README names 14 suppliers not on main (the 14 unticked entries of the generated *Depends on* block, one for one), AdelicAlgebraicGroups (on main, ticked), and five roadmaps not on main that occur only under "Downstream consumers" (AnabelianGeometryAndNonabelianChabauty, ArithmeticDynamics, ArithmeticStatisticsPartVI, EffectiveDiophantineMethods, GrossZagierAndArithmeticHeights).
- Validation paragraph: the gate counters `readme-ids-missing`, `round-labels`, `empty-sections`, `set_option`, `depcheck`, `build` are all 0 at this head.
- "the Lean states only real-bodied definitions and theorems": `Suggested.lean` has one `abbrev` and three `def`s with bodies and seven sorried theorems; the eleven names are those of the worker's declaration list.

### Counts

- Gate at 3dc9d71: every check passes (`build=0`, `depcheck=0`, `outside-folder=0`, `stray-files=0`).
- Dependency check run this round: `depcheck: 247 roadmaps, 2252 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Elaboration: `lake env lean` on `TauCetiRoadmap/HeightsRationalPointsAndObstructions/Suggested.lean` prints seven `declaration uses sorry` warnings (lines 60, 72, 79, 91, 138, 152, 166) and nothing else.
- Library declarations opened at the Tau Ceti pin: `fg_point_of_numberField` (`TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/FinitelyGenerated.lean:145`), `neronTatePairing` and `neronTatePairing_self` (`TauCeti/AlgebraicGeometry/EllipticCurve/CanonicalHeight/Basic.lean:368, 384`), `Hom.toOverHom` (`TauCeti/AlgebraicGeometry/AbelianVariety/Hom/Basic.lean:65`).
- Cross-roadmap names resolved: 21 on main (LocalFieldsRamification under `Completed/`), 19 open and in the merge order before this roadmap or consumers only; changes outside the folder: none.
- Source locators: none rechecked (the folder did not change; the seeded sample falls in no changed passage).
- Remark (untouched text): SubspaceTheorem on main names Siegel's theorem on curves as out of its scope ("the curve-side argument is not here"), so §4.8 here has no second owner.

Overlap check: read HeightsRationalPointsAndObstructionsPartII, ArakelovGeometryAndAbelianHeightsPartII, ArithmeticDynamics, ArithmeticStatisticsPartVI, SubspaceTheorem, DiophantineApproximationAndTranscendence; nothing shared (the two Part II roadmaps import §§0.10–0.12, 0.31–0.35, 5.9b, 5.17a–g from this one; SubspaceTheorem §6.2 and DiophantineApproximationAndTranscendence are cited as suppliers).

Source independence: changed passages only; 0 passages compared with 0 sources (no line of the folder changed); largest share Poonen, *Rational points on varieties*, 55 of 241 source lines; contents not compared again (no layer added, removed or reordered).

## Not verifiable

- Faltings 1991 (§5.9a): carried from the earlier reviews; JSTOR only, untouched passage.
- The description's sentence on AI assistance (which tools made the port and the author-side passes) cannot be checked from the repository.

## Source issues

- none

## For the human reviewers

- none
