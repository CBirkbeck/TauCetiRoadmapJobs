# FIX-PKG-SpectralSequencesAndConvergence~2

The review `REV-PKG-SpectralSequencesAndConvergence` raises one finding (F01, P3). Its "For the
human reviewers" section is empty. Its "Source issues" section lists misprints in the sources;
these are not findings, and the review says the roadmap does not inherit them.

## REV-PKG-SpectralSequencesAndConvergence/F01 (P3) — applied

`packages/SpectralSequencesAndConvergence/sources.toml`, entry `helle-rognes2024`: `year = 2024` →
`year = 2019`. Added a `version_note`: published in Documenta Math. 24 (2019), 1855–1878 (with the
publisher URL); the recorded copy is the authors' draft of 2 February 2018; line locators refer to
that draft; the numbering of the cited items agrees with the published version. Key, URL, hash and
access fields are unchanged. README References entry: added the journal citation and the same
sentence on line locators.

**Verification.**
- `helle-rognes2024 line 59`: the cached copy (author page, sha `b57ad81f…`) carries the date
  February 2nd 2018.
- The publisher copy (EMS Press, `https://ems.press/content/serial-article-files/26495`, cached
  under a separate hash) has "Received: February 8, 2018 / Revised: July 31, 2019" at its lines
  9–10 and the running footer "Documenta Mathematica 24 (2019) 1855–1878" at its line 41. No copy
  is dated 2024.
- Numbering agreement, checked item by item (draft line → publisher line):
  - Lemma 2.2 (65 → 83), Definition 2.3 (71 → 93), Remark 2.4 (78 → 100), Definition 2.5
    (81 → 103), Lemma 2.6 (85 → 108), Definition 2.7 (94 → 118);
  - Definition 3.1 (104 → 134), Definition 3.3 (136 → 152), Lemma 3.4 (141 → 158), Remark 3.5
    (143 → 160), Definition 3.6 (145 → 162), Definition 3.7 (153 → 174);
  - Theorem 3.9 (163 → 188), Theorem 3.10 (166 → 192), Definition 3.11 (169 → 195);
  - Lemmas 3.13, 3.14, 3.15 (185, 195, 201 → 211, 226, 234), the sequence (3.1) (226 → 267);
  - Definition 4.5 (291 → 338), Remark 4.6 (299 → 347), Remark 4.10 (334 → 384), Example 8.1
    (943 → 980).

  Every item the README cites has the same number in both versions.
- All 20 README line locators of the form `helle-rognes2024 line N` match the draft's line
  numbers. I checked each against the list above, and lines 213–214 (Lemma 3.15 (c)) and 237–245
  (proof of Theorem 3.10) directly. None of them needed to change.

**The same defect elsewhere.** I checked every manifest entry's `year` against the version read
and the published version:
- `bhatt-scholze2015` had the same defect. It recorded `year = 2013`, the year of arXiv v1. The
  copy read is arXiv v2, dated 17 December 2014 (`bhatt-scholze2015 line 5`). The README cites the
  published version, Astérisque 369 (2015).
  - Repair: `year = 2013` → `year = 2015`. The `version_note` "arXiv v2" became a note naming the
    publication, the copy read (v2, 17 December 2014) and the numbering used (Definition 3.1.1,
    Proposition 3.1.10). It says that the journal numbering was not compared, because the
    Astérisque text was not read.
- `browning-sawin2020`: the copy read is arXiv v3 of 19 February 2020 (its line 5) and the paper
  was published in 2020. Consistent, no change.
- The uncertified entries (1952, 1956, 1962, 1994, 1999, 2001) match their publication years. No
  change.

## Checks

- **Elaboration.** `lake env lean packages/SpectralSequencesAndConvergence/Suggested.lean`, run
  from the content checkout: exit 0, about 9 s. The only messages are the 8 expected `declaration
  uses 'sorry'` warnings, at lines 96, 108, 144, 169, 188, 218, 244 and 264. No errors.
  `Suggested.lean` is unchanged in this round.
- **Signatures.** I put `#check @name` for all 11 declarations in one scratch file and elaborated
  it once (exit 0). I compared each elaborated type with its README statement:
  - `BidegreeAssignment` and `HasConvergenceBounds` (the two definitions); `IsMittagLeffler`;
  - the two vanishing-differential theorems;
  - `convergence_of_hasConvergenceBounds` and `isIso_hom_app_abutment_of_hasConvergenceBounds`;
  - the Euler-characteristic theorem and the comparison theorem;
  - the repleteness characterisation and `epi_towerDifference_of_isMittagLeffler`.

  Each type carries its binders explicitly, for example `[HasCountableProducts C]
  [TauCeti.IsReplete C]` on the last theorem and `[HasExactColimitsOfShape ℕ C]` on the comparison
  theorem. No binder was lost and nothing changed.
- **Dependency direction.**
  `tauceti-roadmap … gate --depcheck packages/SpectralSequencesAndConvergence/README.md --name
  SpectralSequencesAndConvergence --order merge-order/ORDER.txt --movable --content <content>`
  printed:

  ```
  depcheck: 240 roadmaps, 2170 edges, 0 problem(s)
  ```

  There is no UPWARD, CYCLE or moved line.

## Adversarial pass on the changed text

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| `helle-rognes2024` year | draft header vs publisher footer | draft: "February 2nd 2018" (line 59); publisher: "Documenta Mathematica 24 (2019) 1855–1878" (line 41), revised July 31, 2019 | 2024 is wrong; 2019 is the publication year | `year = 2019` |
| "numbering of the cited items agrees with the published version" | each of the 22 numbered items in the manifest locator | the draft → publisher line pairs listed under F01; same number at each pair | holds for every cited item | version note added |
| "line locators refer to the authors' draft" | README line locators 65–70, 94–98, 145–156, 163–168, 225–229, 943–967 | draft lines hold Lemma 2.2, Definition 2.7, Definitions 3.6–3.7, Theorems 3.9–3.10, (3.1), Example 8.1; in the publisher copy these sit at 83, 118, 162/174, 188/192, 267, 980 | locators valid only against the draft, which the note now says | README References sentence added |
| Journal citation "Documenta Math. 24 (2019), 1855–1878" | publisher first page and footer | first page numbered 1855 (line 5); footer range 1855–1878 (line 41) | correct | added to README and manifest |
| `bhatt-scholze2015` year | arXiv v2 header vs README citation | v2 dated 17 Dec 2014 (line 5); README cites Astérisque 369 (2015); manifest said 2013 | 2013 is the year of neither the copy read nor the publication | `year = 2015`, version note expanded |
| `browning-sawin2020` year | arXiv v3 header | v3 19 Feb 2020 (line 5); Ann. of Math. 191 (2020) | consistent | none |

No mathematical statement, target, Check or Lean declaration changed, so no worked example needed
to be recomputed.

## Ownership and citations

- No construction was added, so ownership was not re-examined this round.
- The citation resolver lists two Lean names it found nowhere: `DoubleComplex.edgeBottom` and
  `DoubleComplex.edgeLeft`, at README line 365. Both are the planned names of
  TauCetiRoadmap.DerivedModuleAlgebra §S.1 on main (its README line 65 lists them). This README
  attributes them to that roadmap ("cited there as"), so the attribution is correct and needs no
  change.

## For the maintainer

- `sources.toml`: `helle-rognes2024` now has `year = 2019` and a version note; `bhatt-scholze2015`
  now has `year = 2015` and a fuller version note. The keys are unchanged, so citations in other
  roadmaps are unaffected.
- No name that another roadmap cites changed. No gap was added to `design/plan.json`.
- The publisher copy of Helle–Rognes is in the sources cache under a different hash from the
  recorded author-page copy. The manifest keeps the author-page copy as its record because all
  line locators refer to it.
