# GATE-ArithmeticStatistics~2: answers to human review

Commit `17ac1bb5` on top of `7c344a8`. Files changed: `TauCetiRoadmap/ArithmeticStatistics/README.md` (88 → 37 lines) and `TauCetiRoadmap/ArithmeticStatistics/Suggested.lean` (docstring only).

## H01 (rwst) — applied
The four disclaimers (old `README.md:3` last two sentences, `:7`, `:29`, `:31`) are deleted. *Exact supplier contracts* now has one block, "From TauCetiRoadmap.ArithmeticStatisticsPartI–PartVIII", linking all eight part READMEs and stating that they precede this page. In the board merge order the parts are already earlier: Parts I–V at lines 117–123, HeightsRationalPointsAndObstructions at 150, Parts VI–VIII at 155–157, and ArithmeticStatistics at 158. So the order this page relies on is already the merge order. The pull-request body's dependency list is the worker's to update.

## H02 (rwst) — applied
I confirmed the defect at the part heads. Part I (#1171 `3b1a24f`) §0.15 `#negative-pell-radicands` defines its own `NegativePellSoluble` and `pellRadicand_finite`. Part V (#1175 `e6310b6`) §3.31 lists `FieldStatistics.pellRadicands` and `negativePellRadicands`, and defines them at its `Suggested.lean:448–453`. Neither part mentions ClassicalArithmeticCompletion. The index's ownership paragraph (old `:9`), the Pell contract (old `:33`) and the three Pell Checks (old `:19–21`) are deleted. Rewiring Parts I and V to ClassicalArithmeticCompletion §4.39 has to be done in those parts' own pull requests, which this job may not edit.

## H03 (rwst) — applied
These are deleted:
- old `:11`;
- *Conventions* with its Checks (`:13–25`);
- the analytic supplier contracts and their cubic-basis Checks (`:35–51`);
- the Part III hypothesis paragraph (`:57`);
- the Checks after the table (`:70–74`).

Nothing is lost. Part I's *Conventions* (#1171) already states every convention of old `:15`: base-field isomorphism classes, displayed stabiliser weights, Haar mass one, the strict versus inclusive cutoff, conjectures as propositions, and distribution convergence not implying moment convergence. *Conventions* now refers to Part I's section.

## H04 (rwst) — applied differently
I took the reviewer's alternative rather than closing the PR. Whether to close it is a maintainer's decision. What remains is the summary's first two sentences plus one naming the parts, the parts table, and the reading-order paragraph (old `:55`). The headings the house shape requires are each kept to one sentence: Conventions, supplier contracts, Downstream consumers and References. Every *Check*, contract and the old downstream paragraph are gone; that paragraph restated what HeightsRationalPointsAndObstructions and ModularityAndLanglandsExtensions cite. The `Suggested.lean` docstring now opens with "this file is not the roadmap and is not exhaustive". It says the series' headline theorems are stated in each part's `Suggested.lean`, so this file declares nothing.

## H05 (rwst) — answered
The sentence about §§3.2–3.9 in Parts IV and V is deleted along with the rest of old `:7`. This page no longer cites any section number, so it is not affected by the collision. The renumbering of Part V's Layer 3, and of the citations to it in Parts VI–VIII, has to happen in those parts' pull requests (#1175–#1179), which this job may not edit. The reviewer's description of the collision stands as a finding for Part V.

## H06 (rwst) — applied
The self-descriptive sentences are deleted:
- old `:3` (last two sentences);
- old `:7`, `:29` and `:31`;
- old `:76` ("Each part's README is its full mathematical specification…");
- old `:84`.

The parenthetical Fouvry–Klüners and de Jong citations are gone from the table rows for Parts V and VII, and so are the entries `as-ref-022` and `as-ref-056`. *References* now reads "Each part's References section lists the works that part cites." Both works keep their part-level keys (#1175 `[22]`, #1178 `[56]`).

## Build and gate

- `lake build TauCetiRoadmap.ArithmeticStatistics.Suggested`: `Build completed successfully (8976 jobs).`
- Gate after the commit: `gate ArithmeticStatistics: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK`
- Depcheck (`--movable`): `depcheck: 148 roadmaps, 999 edges, 0 problem(s)`. There are no UPWARD, CYCLE or moved lines.

## Notes

- `Suggested.lean` declares nothing, so the `#check @name` signature comparison has no declarations to check. There are no theorems or definitions to put through the adversarial pass. The only mathematical text left is the table's scope descriptions, and each one matches the summary line of that part's README at its head.
- Ownership: this page now states no object, so nothing could clash with open work.
- Sources: no source is cited any more, and `needs-references.toml` was not written.
- Nothing suspicious was found in the review text.
