# Review of GrothendieckUniverses (pull request #1783 at 3979823)

**Verdict:** needs changes

## R01 (P3) — The year of Grothendieck's draft is not in the cited pages

**Location:** `TauCetiRoadmap/GrothendieckUniverses/README.md` lines 324–326: "Grothendieck introduced them in a Bourbaki draft of 1958 answering Lacombe's proposal of a theory of classes … (Krömer 2006, §6, pp. 148–149)."

**Claim:** The locator supports the draft, its author, Lacombe's paper and the bifunctor remark, but not the year: Krömer dates rédaction n° 307 nowhere, so "of 1958" has no source at this head.

**Witness:** kromer2006 lines 1143–1147 (p. 148): « La Tribu » 45 still awaits Lacombe's paper; line 1170: n° 307 answers it; line 1237 (p. 150): « La Tribu » 47 reports the theory. Congress dates, lines 1553–1554: 25/06–07/07/1958 and 07–14/03/1959.

**Repair:** Replace "in a Bourbaki draft of 1958 answering" by "in a Bourbaki draft, rédaction n° 307, written between the congresses of summer 1958 and March 1959 and answering", and widen the locator to "Krömer 2006, §6, pp. 148–150". (Or delete "of 1958".)

## Previous findings

- none: the review of 7282328 raised no finding.

## Verified sound

The diff changes no statement. The row below is for 2.1, the statement the replaced sentence cited (the removed n° 453 clause, "the total order of 2.1") and the next sentence still cites. Values marked † are proved `example`s that elaborate with no message in a scratch file at the pins.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 2.1 `IsGrothendieckUniverse.mem_or_eq_or_mem` | stages `V_ a`, `V_ b` with `a < b`, `a = b`; `U = V` | `a < b`: `V_ a ∈ V_ b`†, `V_ b ∉ V_ a`†. `a = b`: `V_ a ∉ V_ a`†, only the middle disjunct. Trichotomy on stages†; `x ∉ x`† | true | none |
| README 324–326 vs kromer2006 pp. 148–149 | author, Lacombe's paper, bifunctor remark, section, year | n° 307 by Grothendieck (lines 1000, 1019–1020, 1170); Lacombe's n° 301 (1150–1152); bifunctor not expressible with classes (1156–1158); §6 starts line 1032; year: absent | year unsupported | R01 |
| README 363–365 page range | first and last page | header line 6: "12 (2006), p. 119–162"; 44 PDF pages | true | none |

The rows of the other statements stand as in the previous review, of `7282328`.

- **Change since 7282328.** 16 lines, all in `README.md` (Research context lines 324–326; References: Krömer's page range, the Archives Bourbaki entry removed). No heading, layer, target, supplier or Lean declaration changed. `git diff --stat origin/main...HEAD` outside the folder is empty.
- **Gate.** My run with `--base origin/main` passes every check, and so does the worker's run with the build (`build=0`). Depcheck: `depcheck: 245 roadmaps, 2231 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- **Elaboration.** `lake env lean` on `Suggested.lean` gives 8 `declaration uses sorry` warnings (lines 67, 72, 78, 85, 91, 99, 104, 112) and nothing else.
- **Sources (7 locators read, all kromer2006, the Numdam copy).** Page range line 6; §6 heading line 1032; n° 301 lines 1150–1152; bifunctor remark lines 1156–1160 (p. 148); n° 307 line 1170 and its text lines 1180–1223 (p. 149); authorship note lines 1019–1020; list of rédactions lines 1477–1478.
- **Library declarations opened at the pin (5).** `Mathlib/SetTheory/ZFC/VonNeumann.lean` 55, 76, 88, 94, 112.
- **Residue of the removed passage.** No mention of the Archives Henri Poincaré, a rédaction number or n° 453 remains in `README.md` or `Suggested.lean`; the only citations of Krömer are lines 323, 325–326 and 363–365.
- **Pull request text.** Title and every paragraph read against this head. "The Research context cites Krömer 2006 (Rev. Histoire Math., on Numdam) for how universes entered Bourbaki's discussions" holds (the article is on Numdam, item RHM_2006__12_1_119_0). The description never mentioned the removed typescripts. No sentence is contradicted and no change is left unstated.
- **Remark (untouched text).** gabriel1962 places §1 in Chapitre I; README lines 62, 109, 128, 263 and `Suggested.lean` lines 48 and 103 say "Ch. 0", as does the description's Sources list.

Overlap check: read HanfNumbers; nothing shared. It is the only entry of the three closest-roadmap lists, and it consumes only Mathlib's `ZFSet.vonNeumann` API. The overlap file lists no dropped id, no second copy and no other pull request changing this folder.

Source independence: changed passages only. 1 passage (README lines 324–326) compared with 1 source (kromer2006 lines 1143–1170, French): no sentence translated or followed clause by clause; the only shared phrase is the mathematical statement about composition of functors. Largest share williams1969, as counted in the previous review. Contents were not compared again because no layer changed.

## Not verifiable

- none in the changed passages. The texts the previous review listed (tarski1938, tarski1939, shepherdson1952, Kanamori 2003, SGA 4 Exposé I, Zermelo 1930, Blass–Dimitriou–Löwe 2007; the formulas of williams1969 (b), (c)) were not read again.

## Source issues

- none

## For the human reviewers

- none
