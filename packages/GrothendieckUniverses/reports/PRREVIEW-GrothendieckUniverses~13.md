# Review of GrothendieckUniverses (pull request #1783 at 8c6b38b)

**Verdict:** accepted

## Previous findings

- R01 — repaired: README lines 324–326 now read "Grothendieck introduced them in a Bourbaki draft answering Lacombe's proposal of a theory of classes, which could not express that composition of functors is a bifunctor (Krömer 2006, §6, pp. 148–149)", with no year.

## Verified sound

The diff changes no statement. Row 1 is for 0.1, the object the changed sentence names ("introduced them"). Values marked † are proved `example`s that elaborate with no message in a scratch file at the pins, on a copy of the structure `IsGrothendieckUniverse`.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 0.1 `IsGrothendieckUniverse` | `V_ 0`, `V_ 1`, an arbitrary universe `U` | `V_ 0 = ∅` fails only UA5†. `V_ 1 = {∅}`†, fails UA2: `𝒫 ∅ = {∅} ∉ {∅}`†. Every universe contains `∅`†; `U ∉ U`† | true; agrees with the Conventions witness | none |
| README 324–326 against kromer2006 pp. 148–150 | author, draft, Lacombe's paper, bifunctor remark, "introduced them", year | n° 307, by Grothendieck (lines 1169–1170, note 55 at 1177); Lacombe's n° 301 (1150–1152); bifunctor not expressible with classes (1156–1158); filtration `U_i` and a new axiom in n° 307 (1204–1215, p. 149); Krömer names them universes (1229–1230, p. 150); no year stated | supported | none |

The rows of the other statements stand as in the previous review, of `3979823`.

- **Change since 3979823.** 2 lines of `README.md` (line 324, « of 1958 » deleted). No heading, layer, target, supplier or Lean declaration changed. `git diff --stat origin/main...HEAD` outside the folder is empty.
- **Gate.** My run with `--base origin/main` passes every check (exit 0), and so does the worker's run with the build (`build=0`). Depcheck: `depcheck: 245 roadmaps, 2229 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- **Elaboration.** `lake env lean` on `Suggested.lean` gives 8 `declaration uses sorry` warnings (lines 67, 72, 78, 85, 91, 99, 104, 112) and nothing else. The probe file (5 examples) gives no message.
- **Sources (8 passages read).** kromer2006, the Numdam copy, fetched again: lines 1143–1147, 1150–1158, 1169–1170, 1177, 1204–1215, 1229–1230. gabriel1962: lines 29–30, 206 and 216–217, for the remark below.
- **Library declarations opened at the pin (4).** `Mathlib/SetTheory/ZFC/VonNeumann.lean` 116 (`vonNeumann_zero`) and 120 (`vonNeumann_add_one`); `Mathlib/SetTheory/ZFC/Basic.lean` 268 (`eq_empty_or_nonempty`) and 312 (`mem_singleton`).
- **Residue and citations.** No "1958" is left in `README.md` or `Suggested.lean`. Krömer is cited at README lines 323, 325–326 and 363–365 only. The three Lean-name leads (README lines 209, 210, 247) are declared in `Suggested.lean` at lines 85, 91 and 99.
- **Pull request text.** I read the title and every paragraph against this head. The description never gave the year. It names the files correctly (3 in the folder, none outside) and the 9 declarations (1 structure, 8 theorems). No sentence is contradicted and no change is left unstated.
- **Remark (untouched text).** gabriel1962 puts §1 « Les univers de Grothendieck », p. 328, in Chapitre I (lines 29–30, 206). README lines 62, 109, 128, 263 and 338, `Suggested.lean` lines 48 and 103, and the description's Sources list say "Ch. 0" instead.

Overlap check: read HanfNumbers; nothing shared. It is the only entry of the three closest-roadmap lists and uses only Mathlib's `ZFSet.vonNeumann` API, not universes. The overlap file lists no dropped id, no second copy and no other pull request changing this folder. A search of the open heads and main for `IsGrothendieckUniverse` and "Grothendieck universe" finds only convention sentences, no other owner.

Source independence: changed passages only. 1 passage (README lines 324–326) was compared with 1 source (kromer2006 lines 1143–1230, in French). No sentence is translated or followed clause by clause; the only shared content is the mathematical statement about composition of functors. The largest share is williams1969, as counted in the earlier full reviews. Contents were not compared again because no layer changed.

## Not verifiable

- none in the changed passages. The texts the earlier reviews listed (tarski1938, tarski1939, shepherdson1952, Kanamori 2003, SGA 4 Exposé I, Zermelo 1930, Blass–Dimitriou–Löwe 2007; the formulas of williams1969 (b), (c)) were not read again.

## Source issues

- none

## For the human reviewers

- none
