# Review of PCurvature (pull request #1747 at e8f959c)

**Verdict:** accepted

Incremental re-review of 0 changed lines since d027b39: the head merges main and leaves `TauCetiRoadmap/PCurvature/` byte-identical; the pull request's description was revised. No finding.

## Previous findings

- R01 — repaired: the description now reads "…then Downstream consumers, Research context, Provenance and References." and has a paragraph "**Provenance.** A secondary section maps AxiomMath, *The Stacks Project in Lean* (Apache-2.0, commit c496df0, Lean and Mathlib v4.35.0) to the targets…".

## Verified sound

| Statement | Instances | Values each side | Result |
| --- | --- | --- | --- |
| 2.0 `kaehlerD_eq_zero_iff` (cited by the description's new Provenance paragraph, "behind 2.0 and 2.1") | `p = 2`, `R = 𝔽₂[ε]/ε²`, `A = R[t]`: `a = εt²`, `a = t³`, `a = ε` | `d(εt²) = 2εt dt = 0`, `εt² ∈ R[t²]`; `d(t³) = t² dt ≠ 0`, `t³ ∉ R[t²]`; `dε = 0`, `ε ∈ R ⊂ frobeniusImage` though not a square | both sides agree |
| The same, degenerate | `A = R` (smooth, `Ω = 0`); `A = 0` | `ker d = R`, `frobeniusImage = adjoin R {r^p} = R`; the zero ring is excluded by `[Fact p.Prime] [CharP A p]` | agree |
| Description, Provenance paragraph, against README lines 739–757 | each clause | Apache-2.0, `c496df0d…` (line 813), v4.35.0 (line 744), `Cartier` directory and Frobenius coordinates (lines 749–752), Tag 0FMN and divided power differentials (lines 753–756), "not a dependency" (line 745) | the head supports every clause but one (see *Not verifiable*) |

The rows for the other statements stand as in the previous review, of d027b39.

- `git diff d027b39 e8f959c -- TauCetiRoadmap/PCurvature`: empty; `lake-manifest.json` and `lean-toolchain` unchanged between the two heads. `git diff --stat origin/main...HEAD` outside the folder: empty, so "changes nothing outside it" holds.
- Supplier citations resolved again after the merge of main, 9: CrystallineCohomology CR.1.3 (main, README line 1120); DerivedDeRhamCohomology §3.6 and `DerivedDeRham.smoothCartier` (main, lines 3899, 3912); SchemeAndStackFoundations §0.8 `etale_coordinates`, §0.9 `finite_presentation_limits`, `spreading_out_models`, §0.29 `schemeFrobeniusTwist` (main, lines 1194–1283, 2575, 2671); FormalConnectionsOpers §§2.1–2.3 (its open head, lines 667, 707, 782).
- Tau Ceti declarations opened at the pin, 4: `ad_pow_expChar_pow` (`Algebra/Lie/AdjointAction/Frobenius.lean` line 76), `Derivation.extendOfIsLocalization` (`RingTheory/Derivation/Localization.lean` line 68), `kaehlerBasisOfFormallyEtale` (`RingTheory/Kaehler/FormallyEtale.lean`), `NumberField.Chebotarev.infinite_frobeniusPrimeSet` (`NumberTheory/Chebotarev/Density/Chebotarev.lean`).
- Description against the head: the five layers, the four suppliers, the closing sections (now with Provenance) and the `Suggested.lean` headlines match the 36 headings and 19 declarations at the head; each of the 16 works the description names is among the 21 references (it does not name the other five, cited in *Research context* only).
- Gate (the worker's record at this head): every check 0, `build=0`, `OK`.
- Dependency check, run for this review: `depcheck: 235 roadmaps, 2236 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line (PCurvature is listed right after FormalConnectionsOpers).
- Elaboration, `lake env lean` on `Suggested.lean`: exit 0, 11 `sorry` warnings (lines 71, 97, 109, 114, 119, 138, 160, 167, 174, 200, 224), nothing else.
- Remarks, no change asked: the supplier contracts name the pinned revisions `f6090c70` and `358314d4`, while `lake-manifest.json` pins `1b1ccf4b` and `2fd255d9`; the generated `depends-on` block still lists CrystallineCohomology and DerivedDeRhamCohomology as open, and both are on main. Declared gaps: none declared.

Overlap check: the three closest-roadmap lists are empty at this index (the previous round's only entry, LefschetzStructures, was read then); nothing shared. No open pull request changes this roadmap, drops an id it cites or defines one it cites.

Source independence: changed passages only, 0 passages in the folder changed, so 0 compared; the description's Provenance paragraph was compared with the README section it summarises, not with a source; arrangement not compared again, since no layer is added, removed or reordered.

## Not verifiable

- The description's "who have not been contacted about this roadmap" and "is not adapted in `Suggested.lean`": the author's statements; the README says only that adaptation is agreed with the maintainers first (lines 745–747).
- As in the previous review: that every file of the three cited directories of the outside repository builds without `sorry`; the tags inside files not opened; Katz 1982, §9, and the published *Math. Comp.* version of Fürnsinn–Pannier.

## Source issues

- none

## For the human reviewers

- Licence: `TauCetiRoadmap/PCurvature/README.md` lines 741–747 name AxiomMath, *The Stacks Project in Lean* (Apache-2.0 `LICENSE` at the root) as material that may be adapted by agreement with its maintainers; the description says they have not been contacted.
- Licence: no declaration of `Suggested.lean` was compared with that repository; the file predates the citation and, by the previous review's file-name search, the repository has no file on its objects.
- Licence: Fürnsinn–Pannier is cited as *Math. Comp.* (2026), doi:10.1090/mcom/4258, with arXiv:2510.00892v3 for the theorem numbers (`TauCetiRoadmap/PCurvature/README.md` lines 803–806), in *Research context* only; the journal version was not read.
- Scope: the README (lines 725–727) states that Theorem 1.3 of Fürnsinn–Pannier fails for a free factor `c`, a correction that no published source makes; the witness is in the table of the review of 3fad9f2.
