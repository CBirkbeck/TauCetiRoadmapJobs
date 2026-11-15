# Review of ArithmeticStatisticsPartII (pull request #1173 at c5b1568)

**Verdict:** needs changes

🤖 Independent AI review, incremental re-review of the 8 lines changed since 8e2b31a (four reworded passages in `TauCetiRoadmap/ArithmeticStatisticsPartII/README.md`; `Suggested.lean` is untouched), and the first check of the pull request's title and description against this head. The folder's four changed passages are sound; the one finding is in the description.

## R01 (P3) — The description's good-prime sentence is contradicted by the three-isogeny target

**Location** Pull-request description, block `roadmap-summary`, last sentence: “The cubic equivalence, Selmer carriers and resolvents are reused, not rebuilt, and a good-prime hypothesis enters only one local uniqueness theorem.”

**Claim** The head has two local theorems with a good-prime hypothesis, and the second is an existence theorem, not a uniqueness theorem.

**Witness** `README.md:2085` (§1.16): “Let p be odd … `p²` not dividing `Δ(f)`”. `README.md:2137`: “At `p>3`, the local integral-representative theorem assumes a twist of good reduction and `v(Dhat)<2`”.

**Repair** Replace the clause by: “and good-prime hypotheses enter only two local theorems, each beside an unrestricted form: the uniqueness theorem of §1.16 (p odd, `p² ∤ Δ(f)`) and the `p > 3` good-reduction integral-representative theorem of the three-isogeny mirror dictionary.”

## Previous findings

- none — the review of 8e2b31a was an acceptance with no finding.

## Verified sound

**Adversarial table** (the four statements whose text the diff changes; values computed this round).

| Statement | Instances and computed values | Result |
|---|---|---|
| Index p subrings of a cubic ring, proof paragraph (`README.md:268`) | `θ² ∈ ℤ + ℤθ` mod p tested on every line of `(R'/ℤ)/p`: all 81 forms with coefficients in {0,1,2} at p = 2, 3 and 500 random forms at p = 5, 7: count equals `ω_p(f)`, 0 violations. `x³+y³`, p = 3: 1 = 1. Zero form, p = 2: 3 = p+1. | Holds |
| Same, the displayed form of S | 2000 random `(a',b',c',d',p)`, 568 with `p ∣ d'`: `disc(a'p², b'p, c', d'/p) = p²·disc(f')` in all 568 (index p). Table: `θ² = −b'd' + d'ω − c'θ`, so `<1,pω,θ>` closes iff `p ∣ d' = f'(0,1)`. | Holds |
| Projection of a plane cubic, proof paragraph (`README.md:1121`) | c₄, c₆ extracted from `H(U ± H(U))`: Weierstrass A = −1, B = 3 gives (48, −2592) = (−48A, −864B); `F_U = (0,4,0,−4,12)`, `(I,J) = (48, −5184) = (c₄, 2c₆)`. 200 random integral cubics with `b = 0`: 0 violations. | Holds |
| Integral representatives of locally soluble quartics (`README.md:1179`) against `exists_integral` | `4I³ − J² = −110592·(4A³ + 27B²)` at `I = −48A`, `J = −1728B`, so the README's and the Lean's nonvanishing hypotheses agree; 48 = 2⁴·3, 1728 = 2⁶·3³. `4x³z − 8z⁴`: `(I,J) = (0, 3456)`, the Check's value. | Holds |
| Binary quartic parametrization of two-Selmer (`README.md:1195`) | `−27·(−48A) = 1296A = 6⁴A`, `−27·(−1728B) = 46656B = 6⁶B`; `x ↦ 36x`, `y ↦ 216y` is `u = 1/6`. | Holds |

All other statements are untouched and stand as in the previous review, of `8e2b31a`.

- Source locators checked against the text for the changed passages, 5: ref-3 lines 361–375 (Proposition 15 and its proof, p. 7; ref-3 is [3], arXiv:1005.0672v3); ref-9 lines 557–565 (Lemma 3.14, p. 15), 600–602 and 617–622 (the discriminant remark and the proof of Lemma 3.10(i), p. 16; ref-9 is [9], arXiv:0908.1741v1); ref-1 lines 1272–1273 (Lemma 3.4, p. 23) and 1276–1281 (Theorem 3.5, both paragraphs, p. 23). Each supports the reworded text; the seeded sample falls in these passages only at §§1.2 and 1.7, covered here.
- Library declarations: none touched by the diff. `exists_integral` and `exists_integral_local` read at `Suggested.lean:197–207` against the reworded statement: same hypotheses.
- Cross-roadmap citations: the diff adds none. The suppliers the README names are on main (AnalyticNumberTheoryPartII, DiophantineApproximationAndTranscendence, EllipticCurves, GlobalNumberFields, GlobalQuadraticForms, JacobianChallenge, OrthogonalSpinGroups, PolynomialGaloisGroups, SchemeAndStackFoundations) or are the seven open roadmaps of the description's `depends-on` block; HeightsRationalPointsAndObstructions and QuadraticFormsOverABase are named as consumers only.
- Pull-request text: title and every prose sentence read against the head. Confirmed at the head: `σ(n)` resolvents at content n (`README.md:523`), the étale criterion over imperfect fields (:185), the overring construction replacing exponent reduction (:239, :545), the corrected sign and order (:401, :1271), degrees two to five (§1.14 and the supporting descent target), the three-isogeny mirror dictionary (:2133), the three files of the folder, the validation counts (gate below). Only R01 fails.
- Gate, independent rerun on this head: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`; the worker's run adds `build=0 OK`.
- Dependency check (the brief's command, `--movable`): `depcheck: 247 roadmaps, 2245 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line. No file changed outside the folder.
- Elaboration: `lake env lean` on `Suggested.lean` gives nine `sorry` warnings (lines 152, 162, 173, 180, 189, 198, 205, 229, 243) and nothing else; the file is byte-identical to the one read at 8e2b31a, so its signature comparison and one-tactic probes stand.
- Overlap check: the scopes of the closest roadmaps (ArithmeticStatisticsPartIII, ArithmeticStatisticsPartI, ArithmeticStatisticsPartVI) were not read again this round, since the diff adds no object, name or section; the overlap report at this head lists no other pull request changing this roadmap, no dropped id and no id only an open revision defines; nothing shared by the changed passages.

Source independence: changed passages only; 4 passages compared with 3 sources (ref-3, ref-9, ref-1), none shared (longest common run 4 words, “a rational linear factor”, and the standard name “genus one models” with its two equation labels); the quotation of ref-9 line 600 present at 8e2b31a is gone; the diff adds, removes or reorders no layer, so the arrangement was not compared again.

## Not verifiable

- ref-17 (O'Dorney) and ref-5 (Gan–Gross–Savin): unchanged from the earlier reports; no passage citing them changed.
- The description's sentence on AI assistance and on passes “to follow” describes process, not the head; it cannot be checked against the folder.

## Source issues

- none

## For the human reviewers

- none
