# Review of WeightsInEtaleCohomology (pull request #1001 at 9e753f8)

**Verdict:** needs changes

Incremental re-review of 10 changed lines since `501bdc1`, with the pull request's title and description read against this head. One P3 finding, in the description; the folder's files have none.

## R01 (P3) — The description places the Mathlib connection in the wrong layers

**Location:** pull request description, summary block (`<!-- roadmap-summary -->`), second paragraph: “The later layers connect Mathlib's `Representation`, `LinearMap.charpoly` and `IsArithFrobAt` to arithmetic Galois representations, and hand the fixed-form polynomials to a compatible-family interface.”

**Claim:** After the first two layers, Layers 3–6 are where the three Mathlib declarations meet arithmetic Galois representations.

**Witness:** `TauCetiRoadmap/WeightsInEtaleCohomology/README.md` names `LinearMap.charpoly` at lines 71, 85, 127 and `IsArithFrobAt` at lines 73–77, 87 only: Conventions, supplier contracts and §1.1. No line of Layers 2–6 (265–834) names any of the three.

**Repair:** Replace the sentence by: “Layer 1 connects Mathlib's `Representation`, `LinearMap.charpoly` and `IsArithFrobAt` to arithmetic Galois representations, and Layer 6 hands the fixed-form polynomials to a compatible-family interface.” (§6.2, line 718, is that interface.) No file of the folder changes.

## Previous findings

- R01 — repaired: lines 3 and 146 read “the representation-predicate module of this roadmap”; line 720 reads “Define the common good-prime polynomial predicate on this family to mean”. `TauCeti.Weights.GaloisRep` and `HasCommonGoodPrimePolynomials` occur nowhere in the folder.
- R02 — repaired: line 534 adds “DeligneWeightsAndPurity §§0.12, 4.3; EtaleCohomologyFoundations §§… F.5–F.6”; line 834 adds “ClassFieldTheory Layers 11–12; EtaleCohomologyFoundations §§F.5–F.6; PadicDifferentialEquationsAndRigidCohomology §RD.7.7”. All five resolve (below); the dependency check is unchanged.

Neither repair introduced a new problem: the three reworded sentences change no mathematics, and the two `*Needs:*` lines add only suppliers that §§3.4, 3.5 and 6.5 already cite (lines 425, 431, 450, 791, 818).

## Verified sound

| Statement | Instances tried | Values on each side | Result |
| --- | --- | --- | --- |
| Layer 3 `*Needs:*` (534): DeligneWeightsAndPurity §0.12, power criterion used in §3.4 | `α=i√3`, `q=3`, extension degree 2; rank 0 | `α²=−3`, `|−3|=3=9^{1/2}`: weight 1 relative to 9; rank 0: empty root set, every weight | Citation fits its use. |
| Layer 3 `*Needs:*` (534): DeligneWeightsAndPurity §4.3 with §RD.7.7, stratum purity in §3.4 | `ℙ¹/𝔽₃`, `b=0,2`; a point | eigenvalues `1=3^0`, `3=3^{2/2}`; point: `1` in degree 0 only | Citation fits its use. |
| Layer 6 `*Needs:*` (834): ClassFieldTheory Layers 11–12, degree-zero character in §6.5 | Saito's `H⁰` action, `w=2` and `w=4` | character `N^{(w−2)/2}∘Nrd`: exponent 0 (trivial) and 1; factors through `𝔸_f^×/ℚ_{>0}^×≅ℤ̂^×` | Global reciprocity is the needed input. |
| Common good-prime polynomial predicate (720), renamed in prose only | rank 0, 1; eigenvalues `±1`; dual of root 2 | `P_v=1`, `X−1`; `X−1≠X+1`; `X·P(1/X)/P(0)=X−1/2` | Definition unchanged by the rewording. |
| Description, R01 | grep of the three Mathlib names over lines 265–834 | 0 occurrences; all occurrences at lines 71–87 and 127 | Finding R01. |

The rows for the untouched statements stand as in the previous review, of `501bdc1`.

- Gate, run on this head: every counter 0 (`set_option`, `sorry-data`, `imports`, `statement-hygiene`, `readme-ids-missing`, `round-labels`, `depcheck`, `stray-files`, `outside-folder`, `build`), result `OK`.
- Dependency check with the merge order, `--movable`, the content repository and `--pr 1001`: `depcheck: 247 roadmaps, 2254 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Elaboration of `TauCetiRoadmap/WeightsInEtaleCohomology/Suggested.lean` with `lake env lean`: one warning, `declaration uses sorry` at line 55, exit 0. The file is unchanged since `501bdc1`; the worker's elaborated signatures of `newformHeckePolynomial` and `newform_ramanujan` equal those of the previous review, no binder lost.
- Cross-roadmap citations resolved, 5: DeligneWeightsAndPurity §0.12 (line 749) and §4.3 (line 1365) and PadicDifferentialEquationsAndRigidCohomology §RD.7.7 (line 14001) at their open heads; EtaleCohomologyFoundations F.5, F.6 (lines 1179, 1200) and ClassFieldTheory Layers 11, 12 (lines 1781, 1834) on main at `8ad4192`. All are on main or earlier in the merge order (positions 74 and 122 against 150).
- Library declaration opened, 1: `hasse_bound`, `TauCeti/AlgebraicGeometry/EllipticCurve/HasseBound.lean:65` at the pin, for the description's “Tau Ceti's Hasse theorem”.
- Description sentences checked against the head, 14 (summary block and prose): 13 stand (layers and headlines named, consumers R28.4 and LV.1 at README line 20, Lean content of one definition and one theorem, the validation counters, no upward edge); one is R01. The folder is new on the base (930 insertions, 59 headings, 2 declarations, none removed), which the description's folder line states.
- Seeded sample: none of the fifteen targets lies in a changed passage, and the changed passages carry no source locator; no source was opened this round.
- Overlap facts: no other open pull request changes this roadmap, no cited id is dropped, no id is defined only by an open revision, no second copy on main. Diff outside the folder against `origin/main`: empty.

Overlap check: read DeligneWeightsAndPurity, LefschetzPencilsAndVanishingCycles, EtaleCohomologyFoundations (scope as at the previous review; the change touches no ownership statement); nothing shared — general weight theory, vanishing cycles and duality stay with those three, cited by section.

Source independence: changed passages only — 5 passages compared, none carries a source locator or source wording; largest share WII, 13 of 68 locators; arrangement not compared again (no layer added, removed or reordered).

## Not verifiable

- Mokrane, *La suite spectrale des poids en cohomologie de Hyodo–Kato* (README line 431): no legal text found at the previous review; not reopened, the passage is unchanged.
- Gillet–Messing, *Cycle classes and Riemann–Roch for crystalline cohomology* (README line 458): the same.

## Source issues

- none

## For the human reviewers

- none
