# Review of QuaternionArithmetic (pull request #1722 at e0f2268)

**Verdict:** needs changes

Incremental re-review of 0 changed lines since e0f2268: the folder is unchanged, and this round reads the pull request's title and description against the head. Both findings are in the description; neither asks for a change to the roadmap's files.

## R01 (P3) — the description lists the classification by ramification among the roadmap's contents

**Location:** pull request description, prose paragraph: "local invariants and the classification by ramification (Hilbert symbols and reciprocity consumed)".

**Claim:** The sentence presents the classification as built here from consumed Hilbert symbols and reciprocity. At the head the classification itself is consumed; Layer 0 owns only the ramification predicates, the ramification set and the discriminant.

**Witness:** `TauCetiRoadmap/QuaternionArithmetic/README.md:84–86`, under *Not owned here*: "The classification of quaternion algebras by ramification (existence and uniqueness) is R17.1.5 of the GL₂ transfer roadmap … Layer 0 consumes all three."

**Repair:** Replace the clause by: "local ramification predicates, the ramification set and the discriminant (the classification by ramification, the Hilbert symbols and reciprocity are consumed)".

## R02 (P3) — the description's `Suggested.lean` bullet describes an earlier form of the file

**Location:** pull request description, file list: "`TauCetiRoadmap/QuaternionArithmetic/Suggested.lean`: what can be stated over Mathlib and the pinned Tau Ceti; the other targets are specified in the README, with Checks."

**Claim:** The head's file states the headline theorems only, not everything statable. Targets that are statable but are not headlines are in the README alone, so "the other targets" are not the unstatable ones.

**Witness:** `TauCetiRoadmap/QuaternionArithmetic/Suggested.lean:17–18`: "It states the roadmap's headline arithmetic theorems"; 30 sorried theorems against 87 README milestones. §0.4's squarefreeness of `discNat` is statable (`discNat` is declared) and is not stated.

**Repair:** Replace the bullet's text by: "`TauCetiRoadmap/QuaternionArithmetic/Suggested.lean`: the headline theorems statable over Mathlib and the pinned Tau Ceti (30), with the definitions they need; its docstring names the headlines not statable at the pins; every other target is specified in the README, with Checks."

## Previous findings

The previous report (of `e0f2268`) had no findings: nothing to account for.

## Verified sound

| Statement | Instances | Values computed (both sides) | Result |
| --- | --- | --- | --- |
| Description: "classification by ramification" against README 84–86, §0.3 (R01) | `ℍ[ℚ,3,−1]` | `(3,−1)₃ = (−1|3) = −1`; `(3,−1)₂ = (−1)^{1·1} = −1`; `(3,−1)_∞ = +1`; `Ram = {2,3}`, `D = 6`, `2+0` even. Existence and uniqueness: supplier's `Suggested.lean:157, 173`, not here | description wrong; README consistent |
| Description: `Suggested.lean` bullet (R02) | the file at the head | 30 `sorry` theorems; 87 numbered README sections; docstring lists 7 not-statable items | description wrong |
| Description: "11 layers and 87 milestones" | README headings | Layers 0–10 = 11; `### k.n` headings = 87 | holds |
| Description: "genus and elliptic points from embedding numbers" (§§8.2–8.4) | `X_0(6;1)` | area `(π/3)·φ(6)·ψ(1) = 2π/3`; `e₂ = e₃ = 2`; `2g − 2 = 1/3 − 2·(1/2) − 2·(2/3) = −2`, so `g = 0` | holds |

The rows for the roadmap's own statements stand as in the previous review, of `e0f2268`: no statement changed.

- **Description against the head, sentences checked:** title (adds a roadmap: the folder is not on main; 3 files, 3795 insertions, 0 deletions); summary block's three paragraphs; the prose paragraph; the three file bullets. `metadata.toml` is `topic = "math.NT"`. Only the two sentences above disagree with the head.
- **Summary block, points confirmed at the head:** Dedekind base of characteristic zero for Layers 1–2 and number fields for Layers 0, 3–7 (README 2722–2723); curves over `ℚ` (README 30); presentation invariance (README 26–28); strong approximation consumed (README 87–89); downstream Gross–Zagier, gonality and adelic-image consumers (README 2740–2750).
- **Cross-roadmap citations resolved this round:** 2, both at the head of GL2AutomorphicRepresentationsAndTransfer: `existsQuaternionRamification_iff` (`Suggested.lean:157`) and `nonempty_quaternionAlgEquiv_of_localSplitting` (`Suggested.lean:173`, README 1523).
- **Worker's gate:** every counter 0, `build=0`, OK. **My rerun:** agrees except `depcheck: NOT IN ORDER: QuaternionArithmetic (insert it after its last supplier)`, as in the previous round; the candidate order places it after ArithmeticFuchsianGroups. Not a finding.
- **Dependency check** (the brief's command, `--movable`): `depcheck: 244 roadmaps, 2229 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line.
- **Elaboration:** `lake env lean` on `Suggested.lean` exits 0 with 30 `declaration uses sorry` warnings and no other message. No statement changed, so the signature comparison and the one-tactic probe of the earlier rounds stand.
- **Outside the folder:** `git diff --stat origin/main...HEAD` outside the folder is empty. **Overlaps:** no other pull request changes this roadmap, no dropped or revision-only id.
- Remark, no change asked: `README.md:17` reads "The book this roadmap follows is Voight", and the description's summary says "The route follows Voight"; the two agree with each other. Seeded sample: no sampled section is changed or cited by a changed passage.

Overlap check: read ArithmeticFuchsianGroups (its README 1404 names this roadmap as consumer of §1.1) and HilbertModularVarietiesAndShimuraCurves (§R18.5.16a, Eichler orders: owner there, consumed here at README 108–126) at their heads; AdelicAlgebraicGroups not reopened, its handoff (README 87–89) being unchanged; nothing shared.

Source independence: 0 passages compared (changed passages only: the folder is unchanged since e0f2268); largest share voight, 186 of about 234 locators; contents not compared again, since no layer was added, removed or reordered.

## Not verifiable

- "One of 23 roadmaps for the mathematics behind the LMFDB, opened as drafts": a statement about other pull requests, not about this folder; not checked.
- The description after the generated blocks (`depends-on`, `merge-order`): generated, outside this check.
- `pizer1976`, `eichler1955`, the LMFDB knowls `shimcurve.label` and `shimcurve.eichler`, and the uncertified `ogg1983`, `vigneras1980`, `pizer1980`, `shimizu1965`, `alsina_bayer2004`: as in the previous report; none is cited by a changed passage.

## Source issues

- none

## For the human reviewers

- `README.md:17` says the roadmap follows Voight's book, which carries 186 of about 234 locators; the arrangement was compared in earlier rounds and not again in this one.
