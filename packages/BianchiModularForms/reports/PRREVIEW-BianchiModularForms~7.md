# Review of BianchiModularForms (pull request #1719 at 70ba211)

**Verdict:** needs changes

Incremental re-review of 0 changed lines since 70ba211. The folder is unchanged and stands as accepted; this round read the pull request's title and description against the head. Two sentences of the description were written for the first head (`b5908b3`) and no longer match. Both repairs are edits to the description only; the folder needs no change.

## R01 (P3) — the description's milestone count is that of the first head

**Location:** pull request description, file list: "`TauCetiRoadmap/BianchiModularForms/README.md`: the roadmap, 10 layers and 64 milestones."

**Claim:** The README at this head has 10 layers and 66 numbered sections, not 64.

**Witness:** `grep -c '^### [0-9]' TauCetiRoadmap/BianchiModularForms/README.md` gives 66 at `70ba211` and 64 at `b5908b3`; the two added since are `### 3.5 Compactified pairs and cuspidal homology` (`README.md:1010`) and `### 5.8 Rational extension of the symbol pairing` (`README.md:1503`).

**Repair:** Replace the bullet by: "`TauCetiRoadmap/BianchiModularForms/README.md`: the roadmap, 10 layers (0–9) and 66 numbered sections."

## R02 (P3) — the description's account of `Suggested.lean` is that of the first head

**Location:** pull request description, file list: "`TauCetiRoadmap/BianchiModularForms/Suggested.lean`: what can be stated over Mathlib and the pinned Tau Ceti; the other targets are specified in the README, with Checks."

**Claim:** The file no longer holds everything statable: it states two headline theorems only, imports Mathlib alone, and names the other headlines as not statable.

**Witness:** `Suggested.lean` at `70ba211`: 2 theorems (`finrank_H1_sub_cuspidal`, line 140; `cuspidalH1_sl2Image_eq_bot_iff`, line 160), 8 definitions, sole import `import Mathlib`; at `b5908b3` it had 19 theorems. Module docstring, lines 10–18, lists the unstatable headlines.

**Repair:** Replace the bullet by: "`TauCetiRoadmap/BianchiModularForms/Suggested.lean`: the two headline theorems statable over the pinned Mathlib (the boundary dimension of §1.2 and Vogtmann's level-one vanishing classification of §9.3) with the eight definitions they need; its module docstring names the headlines that are not statable and the carrier each lacks. All other targets are in the README, with Checks."

## Previous findings

- The previous report (PRREVIEW-BianchiModularForms~6, of `70ba211`) was an acceptance with no finding, and no repair report marks anything "not actionable in this package"; there is nothing to account for.

## Verified sound

| Statement | Instances and values on each side | Result |
|---|---|---|
| §9.3 / `cuspidalH1_sl2Image_eq_bot_iff` (cited by the description as "Vogtmann's level-one vanishing classification") | Radicands 1, 2, 3, 5, 6, 7, 11, 15, 19, 23, 31, 39, 47, 71 ↦ discriminants −4, −8, −3, −20, −24, −7, −11, −15, −19, −23, −31, −39, −47, −71: 14 on each side, equal to the Lean `Finset`. `d_K = −4`: `PSL₂(ℤ[i])^ab` finite, `H¹ = 0`, in list. `d_K = −40, −43`: cuspidal dimension 1, not in list. | Sound, both directions. |
| §1.2 / `finrank_H1_sub_cuspidal` (the other stated headline) | `K = ℚ(i)`, `𝔫 = 𝔞 = 𝓞_K`: one cusp; stabiliser of `∞` contains `diag(i, 1)` with `tr² = 2i ≠ 4i = 4 det`, so right side 0; left side `0 − 0 = 0` (`H¹(GL₂(ℤ[i]), ℂ) = 0`). | Sound. |
| Description, summary block and prose paragraph against the head | Each named item located: all ideal classes (`README.md:21–26`), diamond invariants (`:967`), Tau Ceti Hecke ring, classical newforms, ideal Dirichlet series (`:214–236`), weights `k ≥ 2` in Layer 1 only (`:32–33`), nine fields (`:79–80`), integral Hecke module and period pairing (`:2346–2348`). | No contradiction beyond R01, R02. |

Rows for every other statement stand as in the previous review, of `70ba211`.

- Folder change since `70ba211`: 0 lines; `git diff --stat origin/main...HEAD` outside the folder is empty; the folder holds `README.md`, `Suggested.lean`, `metadata.toml` (`topic = "math.NT"`, as the description says).
- Description against the change: it adds a roadmap not on main (95 headings, 10 declarations added, none removed against the base); title and summary block agree with the head; the two file-list bullets do not (R01, R02).
- Gate, rerun on this head: every counter 0, `OK`; the worker's gate with the targeted build reports `build=0 OK`.
- Dependency check: `depcheck: 238 roadmaps, 2254 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with exactly the two `declaration uses sorry` warnings (lines 140, 160); single `import Mathlib`, no `set_option`.
- Seeded sample: no target falls in a changed passage (none changed); the README flags no locator as unverified; 0 source locators re-read this round.
- Cross-roadmap citations: `scratch/citations.md` lists none unresolved; its eight "Lean names" are LMFDB knowl ids. Suppliers named as roadmaps located on main (ClassicalArithmeticCompletion, ImaginaryQuadraticClassNumber, ClassFieldTheory, EllipticCurves, ModularForms, LFunctions, completed GlobalNumberFields) or at open heads adding new folders (KleinianGroups, MaassForms).
- Overlap check: read MaassForms, HilbertModularForms, KleinianGroups, ModularForms, LFunctions; weight-0 Maass forms on `PSL₂(ℤ[i])\ℍ³` — MaassForms Layer 7; `H3`, `bianchi`, `bianchiGamma`, covolumes — KleinianGroups; weight-two Bianchi forms at level `𝔫` — this roadmap (MaassForms and HilbertModularForms both defer to it by name); nothing owned twice.

Source independence: changed passages only; 0 passages compared with 0 sources, since the folder did not change; the arrangement was not compared again (no layer added, removed or reordered).

## Not verifiable

- Swan 1971 (Adv. Math. 6): recorded `uncertified` in the manifest; cited by locator, as in the previous reports.
- "One of 23 roadmaps for the mathematics behind the LMFDB, opened as drafts" (description): a statement about other pull requests, outside what this review reads.

## Source issues

- none

## For the human reviewers

- none
