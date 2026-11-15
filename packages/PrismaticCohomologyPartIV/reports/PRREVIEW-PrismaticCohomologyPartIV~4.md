# Review of PrismaticCohomologyPartIV (pull request #1080 at 57f0c7a)

**Verdict:** accepted

Incremental re-review of the 2 lines changed since 32d1a4e, and a check of the pull request's title and description against this head. No finding. The gate passes.

## Previous findings

- R01 — repaired: the description now reads "`Suggested.lean` declares nothing: no headline theorem of Layer 8 is statable against the pinned Mathlib and Tau Ceti, and its module docstring names each group of headlines with the objects it lacks".
- R02 — repaired: "Validation: the targeted Lake build succeeds, and the file contains no `sorry` because it declares nothing; the roadmap gate passes every check".
- R03 — repaired: `README.md` line 419 "…the envelopes of §§8.11–8.12 and 8.36, the perfect log prisms of §8.15, the sites of §§8.18, 8.20 and 8.30, and §§8.24, 8.41, 8.51, 8.52 and 8.58 consume them."

## Verified sound

| Statement (changed passage) | Instances | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| Consumer sentence of §8.7 (`README.md` line 419) | every `*Needs:*` line citing §8.7, §8.8, §8.9 or §8.10 from outside the group | §8.7: {8.11, 8.24, 8.36, 8.51, 8.52}; §8.8: {8.11, 8.30, 8.36}; §8.9: {8.12, 8.15, 8.18, 8.20, 8.30}; §8.10: {8.41, 8.58}; union has 12 sections, the sentence lists the same 12 | equal in both directions | none |
| "the perfect log prisms of §8.15" (same line) | the id it names | line 621 is "**§8.15 Perfect log prisms.**", *Needs:* "§§8.14, 8.9, 8.2" | label and edge agree | none |
| Description: "`Suggested.lean` declares nothing" | the file at this head | 43 lines, one `import Mathlib`, one docstring, an empty namespace; `sorry` count 0; nine docstring bullets name the missing objects | sentence true | none |
| Description: validation sentence | gate, dependency check, elaboration, run this round | all gate counters 0; `0 problem(s)`; `lake env lean` exit 0, empty output | sentence true | none |

Rows for untouched statements stand as in the previous review, of `32d1a4e`.

- Change since 32d1a4e in the folder: `README.md` line 419 only (1 insertion, 1 deletion); `Suggested.lean` and `metadata.toml` unchanged. The files the change summary lists outside the folder come from the merge of main: `git diff --stat origin/main...HEAD` outside the folder is empty.
- Pull request text against the head: the title matches `README.md` line 1; the description's second paragraph equals the `**Summary.**` of line 3; the summary block's ownership and consumer sentences agree with lines 9–11 (sole supplier of §§8.1–8.29; CohomologyComparisons §4.6 and §6.1 downstream), its library names with lines 9, 138 and 144 (`Perfection`, `PerfectRing`, `TauCeti.IsProP`), its generality sentences with lines 83–85 and 104; "Roadmap folder … (README, `Suggested.lean`, `metadata.toml`)" matches the three files added (1996 insertions, 47 headings, 0 Lean declarations). No sentence is contradicted and no removal, renumbering or supplier change is left unstated (the pull request adds the roadmap).
- Library declarations opened: `TauCeti.IsProP`, `TauCeti/Topology/Algebra/Group/Profinite/ProP/Basic.lean` line 31 at the pin.
- Cross-roadmap citations: the changed line cites no other roadmap. The worker's one lead, `AInf.cohomology_finiteness_from_periods` (`README.md` line 1774), is a supplier's name in untouched text; AInfCohomology §AI.5.2 exists at its open head (BMS1 Corollary 4.20 there).
- Source locators: the changed sentence carries none; the seeded sample does not fall in it (it sits under the heading of §8.7 but changes no statement of §§8.7–8.10).
- Gate at 57f0c7a: every check 0, "OK" (re-run this round, and the worker's record including `build=0`). Dependency check: `depcheck: 245 roadmaps, 2242 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. Elaboration of `Suggested.lean`: exit 0, no output. `#check` and one-tactic probes: nothing to probe, the file declares nothing.
- Headlines: unchanged; none statable at the pins, each group named in the module docstring with the objects it lacks.

Overlap check: read PrismaticCohomologyPartII, PrismaticCohomology, PrismaticCohomologyPartIII, CohomologyComparisons, CrystallineCohomology, AInfCohomology, PerfectoidSpaces, DiamondsAndVStacks, EnhancedDerivedSheaves (through the worker's overlap list and the ownership search of the earlier reviews; the changed line adds no object); nothing shared; no dropped id, no second copy and no other pull request changing this roadmap.

Source independence: changed passages only; 1 passage compared (an internal cross-reference sentence with no source counterpart), none shared; largest share K1, about 117 of about 290 locators (KY about 114); contents not compared again, since the diff adds, removes or reorders no layer.

## Not verifiable

- KYcorr (Inoue–Koshikawa–Yao, Corrigendum, Adv. Math. 503 (2026) 111223): not readable legally, as in the previous reviews; untouched by this change.
- The items of the earlier reviews' lists (Kato89, OgusDraft, Tsuji, Nakayama II, Huber Cor. 3.2.3, SW Lemma 17.1.8, KL, HK94 printed folios) are untouched by this change and stand as recorded there.
- The description's sentence on AI assistance (which models did what) cannot be checked against the head.

## Source issues

- none (new this round; the entries of the earlier reviews stand)

## For the human reviewers

- **Not tested.** No arrangement comparison was repeated this round. Fact: §§8.1–8.13, 8.18–8.42 run in the order of K1 §§2–8 (`README.md` lines 293–1097); the `*Needs:*` lines force that order.
- **Licence.** KYcorr, cited for §§8.71–8.75 (`README.md` lines 1586–1661), could not be read: the author copy refuses the sources service and the DOI resolves to a paywalled page.
- **Licence.** OgusDraft (a 2006 draft, cited at `README.md` line 425) and CN21 (an author version, line 1938) are unpublished copies; neither was reachable or classified.
- **Scope.** The description's summary block says "The route follows Koshikawa and Koshikawa–Yao as amended by their corrigendum"; the README itself makes no such statement. Whether the description should say it is yours to decide.
