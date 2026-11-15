# Review of SchemeKTheoryOperations (pull request #1229 at 1dfb7dd)

**Verdict:** needs changes

## R01 (P3) — Correct the supplier's merge status in the description

**Location:** PR description, supplier paragraph (`scratch/pull-request.md:30`): “The open ones are StableHomotopyKTheory, GeneralAlgebraicKTheory and AlgebraicModuliForArithmeticGeometry”.
**Claim:** StableHomotopyKTheory is already on main, so the prose incorrectly lists three outstanding supplier pull requests.
**Witness:** Main `3cf7342` contains `TauCetiRoadmap/StableHomotopyKTheory/README.md:1`; `roadmaps show` resolves it to main, GeneralAlgebraicKTheory to #1212, and AlgebraicModuliForArithmeticGeometry to #853.
**Repair:** Replace that sentence with: “The suppliers still open are GeneralAlgebraicKTheory and AlgebraicModuliForArithmeticGeometry; StableHomotopyKTheory is already on main.”

## Previous findings

- R01 — repaired: The prior report's repair record remains valid: README lines 3059–3069 use an arbitrary field and distinguish Borel–Serre's scope; line 3168 retains residue-weighted degree for the real conic.
- R02 — repaired: The prior report's repair record remains valid: README lines 1302, 1712 and 1788 cite the existing completion, Witt-geometry and enhanced-category suppliers; the relevant sections still resolve on main.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| PR supplier-status sentence | Three named suppliers at the supplied main/open heads | Prose: 3 open; heads: 2 open, 1 on main | mismatch | R01 |
| §6.4 operation independence, cited in PR prose | A=ℚ, T=S¹, unit 3; second λ and Adams operations | λ²[3]=−[3]=[1/3]; ψ²[3]=−2λ²[3]=[9]; either lift gives these values | agree | none |

Untouched statement rows stand as in the previous review of `1dfb7dd`.

- Incremental scope: 0 changed folder lines; 0 removed headings or declarations; 0 outside-folder changes; title, prose and `roadmap-summary` compared with the 3368-line addition.
- Source locators newly checked: 0; the seeded mathematical sample lies entirely in settled text. Pinned declarations newly opened: 0; all 5 fresh `#check @name` signatures match the README and retain their hypotheses.
- Supplier checks: 3 advertised merge statuses resolved; the prior Witt/completion and GRR contracts reopened on main; citation resolver reports 0 missing cross-roadmap citations (its rerun did not check external library names).
- Gate: every check passed; dependency output: `depcheck: 245 roadmaps, 2215 edges, 0 problem(s)`.
- Targeted build passed; standalone elaboration and signature probe each emitted only 3 `sorry` warnings. Lake also emitted its Mathlib import-module advisory; worktree remains clean.
- Overlap check: reread StableHomotopyKTheory and GeneralAlgebraicKTheory—generic homotopy belongs to the former, categorical K-machines to the latter. The prior ownership audit of KTheoryFiniteLocalFields, KTheoryLowDegrees, MotivicEtaleKTheory, SchemeKTheoryOperationsPartII, EnhancedDerivedSheaves, SchemeAndStackFoundations and AlgebraicKTheory stands; the supplied overlap report lists 0 conflicts or dropped citations.
- Source independence: changed passages only; 0 roadmap passages changed, 0 new source comparisons. Largest share remains Weibel (prior audit: 209 of 684 citation links); no layers changed, so the previous wording, reuse and contents comparison stands.

## Not verifiable

- Inherited access limits: TT90, Soulé's operations paper, GS99, Riou and Geisser were not obtained in the prior sources-service audit; no new source-dependent mathematical passage was introduced.
- Gillet.1981 remains settled as uncertified; the prior source-access and licence limits were not reopened in this description-only round.

## Source issues

- none

## For the human reviewers

- **Licence.** TT90 is linked at a personal site (README line 3206); the previous sources-service search assigned no licence class and found no other source. The copy's status remains unsettled.
- **Licence.** Quillen (a third party's university page), Schlichting (another author's university page), GS99 (web archive of a preprint server), Zhang.2021 (a university archive) and Schneider (a seminar's book-chapter copy) have hosts not classified here.
