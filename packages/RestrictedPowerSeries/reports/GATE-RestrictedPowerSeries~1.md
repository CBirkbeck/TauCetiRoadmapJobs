# GATE-RestrictedPowerSeries~1: answers to human review of the 2026-10-27 progress report

Head `15b8821`. This pull request adds only `TauCetiRoadmap/RestrictedPowerSeries/PROGRESS.md` and
`TauCetiRoadmap/RestrictedPowerSeries/STATUS.md`, both generated (commit `15b8821`, 52 insertions,
no other file). Every point below concerns those generated files or the pull-request bookkeeping.
This job may edit only `README.md` and `Suggested.lean`. None of the review points needs a change to either file. The only edits (commit `053b0fde`) repair the content-gate findings listed under Gate below.
The fixes the reviewer asks for need the progress report regenerated and the branch rebased, which the worker does.

## H01 (CBirkbeck) — answered

Correct about `STATUS.md`. Its Layer 2 and Layer 5 coverage entries and its "Maximum modulus" and "Tate-algebra structure" frontier items describe the Jacobson property, Krull dimension `n` and maximum modulus as not established. The generated report has to be regenerated to fix this; neither roadmap file needs a change. `README.md` §2.4 (lines 386–394) and §5.2 (lines 541–546) state these results as roadmap targets, not as open library gaps. They cannot cite `TauCeti.MvPowerSeries.isJacobsonRing`, `ringKrullDim_isRestricted_subring` or `exists_pointNorm_eq_norm` as suppliers, because the pinned Tau Ceti is `358314d` (committed 2026-10-07, before this window), and a grep of it finds none of these names and no `RingTheory/Affinoid` directory. Once the content pin passes those merges, the README's Tau Ceti supplier contract should cite them and §§2.4, 5.2 should defer to them.

## H02 (CBirkbeck) — answered

Correct: the report stops at `cc3d579`, and later labelled merges (several-variable preparation, Gauss topology, maximal-ideal generators, module-valued coefficient recovery, strict generators) make its frontier stale. The fix is a regenerated report from a current snapshot, made outside the two roadmap files. The roadmap text is not affected: it plans these items as targets in its own layers, which stays true whatever the library has.

## H03 (CBirkbeck) — answered

Correct that `STATUS.md` links `TateAlgebra/Module.html` (the "Restricted coefficient families" bullet) and `PROGRESS.md` links `TateAlgebra/WeierstrassDivision.html` (the "Division in several variables" sentence). These links are in the generated files, which this job may not edit. Neither `README.md` nor `Suggested.lean` contains either link.

## H04 (CBirkbeck) — answered

Correct: `README.md` changed on `main` after the report was generated. Main's commit `64ee3743` changed one line, the AdicSpaces §§0.4–0.5 link in the supplier table (`../AdicSpaces/README.md` → `../../Completed/AdicSpaces/README.md`). So `git diff origin/main` shows that line as the only README difference, and the `readme_sha` recorded in the `STATUS.md` coverage header no longer matches. Rebasing onto `main` and regenerating fixes both. Changing the README here to match by hand would put content edits into a progress pull request.

## H05 (CBirkbeck) — answered

This is pull-request bookkeeping and needs no change to the roadmap. The follow-up comment says the five duplicates (#1635, #1636, #1641, #1679, #1680) are closed, so only this copy is left.

## H06 (CBirkbeck) — answered

The reviewer's own follow-up replaces the suggested fix (close all six, publish one report from current `docgen`) with fixing this copy. One part of it still applies when this copy is regenerated: the generator reads only declarations from PRs carrying this roadmap's label, so a plain rerun would again miss results that landed under other labels, such as RigidAnalyticGeometry #17947, #18262, #19523 and #21050. That rerun is the worker's job, outside the two roadmap files.

## H07 (CBirkbeck) — answered

Agreed: item 1 (H01) and the two dead links (H03) have to be fixed in the regenerated `STATUS.md`/`PROGRESS.md`, pushed together with the rebase onto `main`. The roadmap files `README.md` and `Suggested.lean` need no edit for this. Their only changes in this round are the two gate repairs described under Gate. Apart from those, the only README difference from `origin/main` is main's newer line from H04, which the rebase brings in.

## Build

`lake build TauCetiRoadmap.RestrictedPowerSeries.Suggested` (after the repairs): `Build completed successfully (8984 jobs)`, with 10 `declaration uses 'sorry'` warnings (lines 32, 45, 79, 86, 108, 115, 156, 168, 199, 219; each is one line earlier than before because the import block is one line shorter).

## Gate

    gate RestrictedPowerSeries: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK

The earlier run failed on 5 content findings, all inherited from the roadmap on `main`. They are repaired in commit `053b0fde`:
- `imports`, `mathlib-subimports` ×2, `no-import-mathlib`: `Suggested.lean` lines 1–5 (three `TauCeti.*` imports followed by `import Mathlib.RingTheory.Jacobson.Ring` and `import Mathlib.RingTheory.Noetherian.Defs`) are now `import Mathlib` followed by the same three `TauCeti.*` imports. No statement changed, and the file elaborates under the single Mathlib import.
- `readme-ids-missing`: `README.md` §7.2 "Explicit monic division" (line 751) ended with the backticked name `IsEntire.isUnit_of_evalAt_eq_zero`. `Suggested.lean` does not declare that name, and neither pinned library has it. The parenthetical is removed. The prose target (for `F(0)=1` and `F(a)=0`, `a` is a unit with inverse `−Σ_n coeff (n+1) F · a^n`) is unchanged.

Depcheck (`gate --depcheck … --movable`): `depcheck: 235 roadmaps, 2063 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.

## Adversarial pass, signatures, ownership

No statement in `README.md` or `Suggested.lean` was added or changed: the repairs touch only the import block and remove one backticked name from README prose. So the adversarial pass and the `#check @name` signature comparison had nothing new to check and were not run. The import change cannot drop binders, because every declaration's own signature is untouched, and the build above confirms that the file still elaborates. Ownership was not rechecked, for the same reason. The only library claim this report relies on was checked at the pin: `TauCeti/RingTheory/MvPowerSeries/TateAlgebra/` at `358314d` contains only `Basic`, `Distinguished`, `Iterate`, `Noetherian` and `Subst`, and none of the declarations named in H01 exists there.

No text in the reviews asked for anything outside the job; nothing suspicious to quote.
