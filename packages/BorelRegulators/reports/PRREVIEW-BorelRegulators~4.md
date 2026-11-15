# Review of BorelRegulators (pull request #1461 at c564441)

**Verdict:** accepted

Incremental re-review of 0 changed lines since c564441; this round reads the pull request's title and description against the head. No finding.

## Previous findings

- R01 — not repaired, settled: `packages/BorelRegulators/sources.toml` still has no entry for borel1980 (0 occurrences); the pull request carries no manifest, so nothing in it can repair this. Not re-raised; reported to the human reviewers below.

## Verified sound

**Adversarial table** (the folder did not change; rows are for the statements the description's text cites).

| Statement | Instance | Left side | Right side | Result |
|---|---|---|---|---|
| Description: covolume "a nonzero rational multiple of ζ_F*(1−n), equivalently of √Δ_F·π^(dₙ−Nn)·ζ_F(n)" (§5.4, §1.3) | F=ℚ, n=2 | d=0; ζ(−1)=−1/12 | √1·π^(−2)·ζ(2)=1/6 | ratio −1/2 ∈ ℚˣ; agrees with §5.4 Check (factors −12 and 6, R=1) |
| same | F=ℚ, n=3 | d=1; ζ′(−2)=−ζ(3)/(4π²) | π^(1−3)·ζ(3) | ratio −1/4 ∈ ℚˣ; exponent −2 as in §5.4 Check |
| same | F=ℚ(i), n=2 | d=r₂=1, N=2, Δ_F=4 | 2·π^(1−4)·ζ_F(2)=2ζ_F(2)/π³ | agrees with §5.4 Check; Conventions set Δ_F=\|disc F\|, so "√Δ_F" is the README's own symbol |
| Description: "the Borel map is −2 times the universal Beilinson regulator" (§6.2) | rank 0, 1, 2 | det ratio (−2)^d = 1, −2, 4 | Layer 6 Examples: 1, −2, 4; covolumes 1, 2, 4 | agree |
| Description: "division algebras of every degree split at infinity" (§3.2, Lean) | a=1; a=0 | D=F, finrank 1=1² | no division ring of finrank 0; `1 ≤ a` present | "every degree" is every a≥1, as stated |
| Description: "rank zero included" (§5.1, Lean) | F=ℚ, n=2, 4; ℚ(√5), n=2 | ζ(2)/π²=1/6, ζ(4)/π⁴=1/90; √5·ζ_F(2)/π⁴=2/75 | positive rationals | agree |

The rows of the previous review, of c564441, stand for every statement of the folder.

- Description against the head, sentence by sentence: the summary block (construction on K_(2n−1)(O_F) for n≥2, §2.2; real isomorphism, §2.3; full lattice and zeta covolume, §§5.3–5.4; period = index, §3.1; division algebras, §3.2; volumes and periods, Layers 3–5; Deligne target and r_Bo=−2r_Be, §§6.1–6.2); the consumers named (Polylogarithms, PeriodsAndSpecialValues, ColemanIntegration via §6.0a) match Scope and Downstream consumers; "ranks imported from ArithmeticKTheory independently of regulator values" is Scope paragraph 3; S-integers and orders are §5.5. No sentence is contradicted.
- Description, the change: the folder is absent from main (276e711) and the pull request adds it (3 files, 978 insertions, 0 deletions; 4 Lean theorems, no definition), as "roadmap" and "Roadmap folder … (README, `Suggested.lean`, `metadata.toml`)" say. Nothing is removed or renumbered, so nothing is left unstated.
- Description, validation sentence: each count reproduced (next two bullets); "2 independent review rounds and 2 red-team rounds" matches the package's reports (two package reviews, two red-team rounds).
- Suppliers: of the 21 roadmaps the README cites as suppliers, 11 are on main (AdelicAlgebraicGroups, StableHomotopyKTheory, CharacteristicClasses, TopologicalKTheory, ClassFieldTheory, SemisimpleAlgebras, LFunctions, DifferentialGeometry, AlgebraicTopology, SchemeAndStackFoundations, and NumberFieldArithmetic under Completed) and 10 are open and earlier in the merge order; the `depends-on` block lists exactly these 10 open and marks the two merged ones done.
- Gate, rerun at c564441: every scanner 0, `depcheck=0`, `stray-files=0`, `outside-folder=0`, OK; the worker's run adds `build=0`. Dependency check: `depcheck: 244 roadmaps, 2231 edges, 0 problem(s)`, no UPWARD or CYCLE line. BorelRegulators is at line 306 of the merge order, Polylogarithms at 310.
- Elaboration: `lake env lean` on `TauCetiRoadmap/BorelRegulators/Suggested.lean` gives four `declaration uses sorry` warnings (lines 51, 77, 89, 105) and nothing else; the four elaborated types agree with `scratch/signatures.md` and README §§1.3, 3.1, 3.2, 5.1; no `set_option`, no sorry'd data, imports `Mathlib` plus two `TauCeti.*` modules.
- Outside the folder: `git diff --stat origin/main...HEAD` is empty; the folder holds only the three roadmap files.
- Remark (no change asked): the description's "everything else named in the README is a consumer, not a prerequisite" also covers HeightsRationalPointsAndObstructions, which Scope names only to delimit ownership; it is not a prerequisite, which is what the sentence is for.

Overlap check: read Polylogarithms, MotivicEtaleKTheory, PeriodsAndSpecialValues, ArithmeticKTheory, K3BlochGroups (the open list; the two other lists are empty); nothing shared — the overlap tool lists no dropped id, no second copy and no other pull request changing this folder, and the ownership split stands as in the previous review.

Source independence: changed passages only — 0 passages compared (the folder did not change since c564441); arrangement not compared again (no layer added, removed or reordered).

## Not verifiable

- borel1980 item 3's displayed relations and borel1977's displayed formulas are images in the extractions, as in the previous reports.
- weil1961 (waived) and beilinson1985 (uncertified) are cited by locator only, as the manifest settles.

## Source issues

- none

## For the human reviewers

- **Licence.** borel1980 (Numdam ASNSP_1980_4_7_2_373_0) is cited at `TauCetiRoadmap/BorelRegulators/README.md` lines 27, 507, 571, 600 and 859 but has no entry in `packages/BorelRegulators/sources.toml`; the pull request carries no manifest.
