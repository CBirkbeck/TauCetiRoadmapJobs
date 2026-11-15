# Review of K3BlochGroups (pull request #1430 at cf5467c)

**Verdict:** accepted

No findings. Incremental re-review of 0 changed lines since `cf5467c`; this round read the pull request's title and description against the head.

## Previous findings

- none: the previous review, of `cf5467c`, had no findings (its R01–R03 bullets recorded repairs of an earlier round, and those passages are unchanged: `README.md:27`, `:51`, `:67`, `:1835`).

## Verified sound

| Statement | Instances tried | Computed left side | Computed right side | Result / change |
| --- | --- | --- | --- | --- |
| `bloch_dvr_equiv` (description: “residue-size and characteristic conditions without an extra GL-stability hypothesis”) | ℤ_(11)⊂ℚ; ℤ_(2); mixed characteristic with residue field 𝔽̄_p | Lean: `hk` 9<11 true, `hc` true by `Finite`; `hk` false (2≤9, not infinite); `hk` true, `hc` false (0≠p, not finite) | README §4.22: applies; excluded, B(ℤ_(2))=0 but B(ℚ)≅ℤ/6 (24/4); excluded (“char K = char k or k finite”) | Agree; binders are `hk`, `hc` only, no stability hypothesis |
| `bloch_dvr_equiv`, junk value | infinite residue field, ℚ[[t]] | `Nat.card`=0, so 9<0 false; `Infinite` disjunct true; `ringChar` 0=0 | README: k infinite, equal characteristic | Agree; the junk value is covered by the disjunction |
| Description: “nine headline theorems using four simple definitions against the pinned Mathlib” | `Suggested.lean` whole file | 9 `theorem` (lines 51, 94, 106, 119, 144, 168, 180, 192, 205), 4 definitions (44, 66, 74, 86), 1 import | 9, 4, Mathlib only; 13 declarations in all | Agree |
| Description: “§4.16 uses it to obtain the unit quotient ℤ/12”; “numbering map identifies §4.9 with §4.16” | ℤ/24 modulo ⟨12ν⟩; heading list | 12ν has order 2, quotient order 24/2=12; headings run 4.8, 4.10, with “Section 4.9 is now §4.16” in the scope section | ℤ/12; mapping stated | Agree |
| Description: §3.17/§4.22 contents, “many-units and finite-residue stability results are targets” | §4.22 stability list | Three stability bullets stated as targets: many units n≥i; H₂ with \|k\|∉{2,3,4}; H₃ with \|k\|∉{2,3,4,5,8,9,16,32} (domains: {2,3,4,5,8}) | 𝔽_16 local domain: covered; general local ring with residue 16: no assertion; README Check says the same | Agree |
| Summary block: “Steinberg homology handles associative unital rings, including the zero ring” | zero ring | St(0) trivial, BSt(0)⁺ contractible, K₃^ind(0)=0 (Checks of §§1.1, 2.1); P(0)=0 in §3.4 | Conventions: rings associative unital, zero ring allowed | Agree |

Rows for untouched statements stand as in the previous review, of `cf5467c`.

- Pull request text against this head: every sentence of the title, the summary block and the prose was compared with the head; none is contradicted and no change is left unstated. The pull request adds the folder (not on main; 2593 insertions, 0 deletions; no heading or declaration removed), which “Adds `TauCetiRoadmap/K3BlochGroups`” states.
- Description claims resolved at the head: `metadata.toml` topic `math.KT`; §5.1 names `TauCeti.unitsLeftMulMatrix`, `unitsLeftMulMatrix_injective`, `val_det_unitsLeftMulMatrix` (pin: `TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/LeftMulMatrix.lean:72`, `:89`, `:120`); §5.8 Rogers detector; 0 occurrences of BordismFormalGroups or GeneralizedCohomology in the README; all nine suppliers the description names have a contract heading; the five consumers it names are in “Downstream consumers”.
- Cross-roadmap citations resolved (4, those the description relies on): HomologicalStabilityOfGeneralLinearGroups §1.3 and §2.3 at its open head; SchemeKTheoryOperations §6.7 (group hyperhomology is defined inside it) and §4.7; TangentialBordism §8.3 (B3.3) on main, which states η³=12ν≠0 in ℤ/24.
- Gate, rerun on this head: all checks 0, OK; the worker's run includes the targeted build (build=0). Changes outside the folder: 0.
- Elaboration: `lake env lean` on `Suggested.lean` gives exactly nine `sorry` warnings (lines 51, 94, 106, 119, 144, 168, 180, 192, 205) and nothing else; the file is unchanged, so the 13 signatures and the padding probes stand.
- Seeded sample: no passage changed, so none of the 15 targets lies in a changed passage; 0 source locators re-read.
- Remark: the description's `depends-on` and `merge-order` blocks are generated and outside the text check.

`depcheck: 244 roadmaps, 2210 edges, 0 problem(s)`

Overlap check: read Polylogarithms, HomologicalStabilityOfGeneralLinearGroups, K2SymbolsBrauer, ArithmeticKTheory, EllipticKTheory, PolylogarithmFunctions, StableHomotopyKTheory and AlgebraicKTheory as listed for this head; nothing shared beyond the ownership already recorded (frame spectral sequence and GL stability with HomologicalStabilityOfGeneralLinearGroups, cited). No second copy, no conflicting head, no dropped id, no id defined only by an open revision.

Source independence: changed passages only; 0 passages compared with 0 sources, since the folder did not change; largest share weibel, 118 of 224 locators, unchanged; contents not compared again since no layer was added, removed or reordered (previous result: independent).

## Not verifiable

- suslin-1984, suslin-1991, bloch, mirzaii-erratum: waived or uncertified in the manifest; no readable text; none cited in a changed passage.

## Source issues

- none

## For the human reviewers

- none
