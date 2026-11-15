# Review of AnalyticStacks (pull request #1687 at ba511f7)

**Verdict:** needs changes

Incremental re-review of the 102 lines changed since 7caeef3 (one locator repair, and a regrouping of sixteen subsections under nine merged headings), and of the pull request's title and description.

## R01 (P3) — the regrouping removes sixteen `### k.n` targets and gives nine ids two extents

**Location:** `TauCetiRoadmap/AnalyticStacks/README.md` lines 209, 270, 528, 611, 662, 1031, 1067, 1140, 1196 (the merged headings), e.g. line 1067 "### 6.3 Suave regular immersions and cohomologically smooth solid maps", with line 1084 "**6.4 The solid affine line and cohomological smoothness.**" inside it.

**Claim:** every numbered unit is a `### k.n <topic>` subsection, and an id names one thing.

**Witness:** the board's target reader returns 60 targets at 7caeef3 and 44 here; lost: 0.6, 0.9, 0.10, 2.2–2.5, 2.7, 2.8, 2.10, 2.11, 6.2, 6.4, 7.2, 7.3, 7.5. Line 1088, in section `### 6.3`: "*Needs:* 6.2; 6.3; …".

**Repair:** restore the 7caeef3 headings: one `### k.n <title>` per unit (the sixteen run-in titles become headings again, and the nine first units get their titles back: "### 0.5 The construction principle", "### 0.8 Suave and prim objects", "### 2.1 Light condensed animated rings and their modules", "### 2.6 Comparison with spectral analytic structures", "### 2.9 Solid Huber rings", "### 6.1 Solid finite presentation", "### 6.3 Suaveness of regular immersions and of lci maps", "### 7.1 Cartier duality for bialgebras", "### 7.4 Lattices and tori"). Delete the nine "This section provides …" sentences; what they say about consumers is already in the `*Needs:*` lines. Tested: with those headings the target reader returns 60 targets, and "6.3" in line 1088 names a unit that does not contain 6.4. The grouping changes neither the order nor the scope of any numbered unit, so nothing else depends on it.

## R02 (P3) — the description's AI-assistance sentence predates the last two commits

**Location:** the pull request's description: "AI assistance: codex (gpt-6.1-sol) ported the package after 4 independent review rounds and 2 red-team rounds on the job board (Fable and Astra); this draft awaits human review."

**Claim:** the description names the models used (CONTRIBUTING.md, "Attribute AI assistance": "say which models you used, in the PR description").

**Witness:** commit 8b3b4cb1 carries "Co-Authored-By: Claude Fable 5.1" (the locator repair in 0.9) and commit ba511f7c carries "Co-Authored-By: Claude Opus 5.5" (the regrouping); the description names neither edit, and Opus 5.5 not at all.

**Repair:** replace the sentence by: "AI assistance: codex (gpt-6.1-sol) ported the package after 4 independent review rounds and 2 red-team rounds on the job board (Fable and Astra); after the first AI review of this pull request, Claude Fable 5.1 repaired a locator in 0.9 and Claude Opus 5.5 edited the README's section headings; this draft awaits human review."

## Previous findings

- R01 — repaired: line 296 now reads "(HM Lemma 4.5.9, HM line 3583; the formula for ω_(g∘f) is HM Lemma 4.4.9(i), HM line 3353, with P = Q = 1, and compatibility with base change is HM Lemma 4.4.8(i), HM line 3339)".
- R02 — not repaired: `Suggested.lean` is unchanged ("only its case k = 2, E₀ = all morphisms is stated below"). The report of 7caeef3 offered the E₀-refinement as optional; the stated theorem and the docstring are accurate, so it asks for no change and is not carried.

## Verified sound

| Statement | Instances | Values | Result | Change |
|---|---|---|---|---|
| 0.9, first API bullet (line 296): ω_(g∘f) ≅ ω_f ⊗ f*ω_g, with the new locators | HM line 3353 with P = Q = 1; f = id; 𝔸² → 𝔸¹ → pt in the solid formalism | HM: SD_fg(1) = g*SD_f(1) ⊗ SD_g(1) for g: Y → X, f: X → S; renamed, the bullet. f = id: ω_g = 1 ⊗ ω_g. 𝔸²: O[1] ⊗ O[1] = O[2] = det(Ω¹)[2], as 6.6 | HM line 3583 states stability under composition and every base change, for suave and prim; line 3342 base change | none |
| Opening sentence of `### 0.5` (line 211) | consumers of 0.5 and 0.6 read off every `*Needs:*` line | 0.5: {0.9, 1.1, 3.2, 3.4}; 0.6: {0.9, 0.13, 1.5, 3.3}; the sentence lists the same sets | true and complete | R01 |
| Opening sentence of `### 0.8` (line 272) | consumers of 0.9 and 0.10 | 0.9: {0.10, 0.11, 1.3, 1.4, 3.2, 4.2, 6.3, 6.4, 7.7}; 0.10: {1.3, 1.4, 6.4}; the sentence lists these, 0.10 being inside the section | true and complete | R01 |
| Opening sentence of `### 2.1` (line 530) | consumers of 2.2–2.5 | 2.2: {2.3, 2.4, 2.6, 2.7, 3.7, 4.4, 5.1}; 2.3: {2.4, 2.6, 2.7, 2.11, 3.1, 3.2, 4.4, 5.1, 5.2}; 2.5: {2.7, 2.10, 3.1, 6.2}; the sentence omits 2.11, 3.2, 3.7, 5.2 | true, not exhaustive | R01 |
| Opening sentences of `### 2.6`, `### 2.9` (lines 613, 664) | consumers of 2.7, 2.8, 2.9, 2.10, 2.11 | 2.7: {2.8, 2.9, 3.4, 6.4, 7.5}; 2.8: {2.9, 2.10, 3.4}; 2.9: {2.10, 2.11, 3.5, 4.4, 6.1, 7.5}; 2.10: {2.11, 3.5, 4.4, 6.2}; 2.11: {3.6, 4.3, 7.5, 7.7} | true; 7.5's use of 2.9 omitted | R01 |
| Opening sentences of `### 6.1`, `### 6.3`, `### 7.1`, `### 7.4` (lines 1033, 1069, 1142, 1198) | consumers of 6.2, 6.3, 6.4, 7.2, 7.3, 7.4, 7.5; items 7.2(3), 7.3(4) | 6.2: {6.4, 6.6}; 6.3: {6.4, 6.5}; 6.4: {6.6, 7.5, 7.7}; 7.3: {7.4, 7.5}; 7.6 needs 7.2, 7.4, 7.5; 7.2(3) is the base-change item used at line 1239, 7.3(4) the descent criterion | true | R01 |
| Targets as the board reads them (R01) | 7caeef3 and ba511f7 | 60 and 44 `### k.n` targets; 16 units lost, among them 2.10, which carries `spectralStoneDuality`, and 0.6, both named "README 0.6", "README 2.10" in the Lean docstring | ids still present as run-in bold, not as targets | R01 |
| Bodies of the regrouped units | the sixteen moved paragraphs, old against new | 16 of 16 titles and bodies identical character for character after the `**k.n title.**` prefix; the only other changed lines are 9 headings, 9 opening sentences and the bullet of line 296 | no statement changed | none |
| Description against the head (R02) | every factual sentence of the summary and prose | consumers: README lines 1288–1290; `CategoryTheory.Bicategory`: line 252; essentially small C₀: line 24; det(L_f)[n]: 6.6; folder files: README.md, Suggested.lean, metadata.toml; outside-folder diff empty; on main: no AnalyticStacks folder | the title and the other sentences hold at this head | R02 |

The rows of the report of 7caeef3 for untouched statements stand as in that review.

- Gate at ba511f7 (worker's run and this review's): every check 0, `build=0 OK`. Dependency check: `depcheck: 245 roadmaps, 2241 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Elaboration: `lake env lean` on `TauCetiRoadmap/AnalyticStacks/Suggested.lean`, 3 warnings, all "declaration uses `sorry`" (lines 114, 160, 229); the file is unchanged since 7caeef3, so the signatures and the one-tactic probes of that review stand.
- Source locators opened: 12 (HM line 3339, line 3353, line 3583, line 2057, line 2258, line 2329; RCSolid line 1392, line 1408, line 2212, line 3912, line 3924; RC26a line 678); each states what the README attributes to it.
- Seeded sample: three of its targets are merged headings (0.5, 2.1, 7.1); their bodies are unchanged and the locators above fall in them.
- Cross-roadmap citations: none added or changed; `roadmaps grep` over the open pull requests and main finds no other roadmap citing a section of AnalyticStacks, so the merged headings break no citation. `scratch/overlaps.md`: no dropped id, no other pull request changes this folder, no second copy (main has no `TauCetiRoadmap/AnalyticStacks`).
- Overlap check: read SolidAnalyticRings, EnhancedDerivedSheaves, RefinedTraceMethods; nothing shared beyond the supplier sections already cited (unchanged since 7caeef3).
- Remark, no change asked: the Lean docstring keeps LZ12b Theorem 0.1 (arbitrary E₀) as not stated; its case k = 2 with arbitrary E₀ is statable, as the report of 7caeef3 noted.
- Source independence: changed passages only: 19 passages (9 headings, 9 opening sentences, 1 bullet) compared with 3 sources (HM, RCSolid, RC26a: their section titles and HM line 3583), none shared beyond standard names; largest share RCSolid, 260 of 576 locators; contents not compared again (no layer added, removed or reordered).

## Not verifiable

- none.

## Source issues

- none found in the passages read this round; the eleven items of the report of 7caeef3 stand.

## For the human reviewers

- **Scope.** The four most-cited sources are arXiv preprints or lecture notes: RCSolid (seminar notes, 260 of 576 locators), HM (75), RC26a (64), SixFF (49); the README's References give a journal only for ABFJ22.
- **Licence.** ALRS, Sch24 and Gest are cited from author pages as preprint, draft and lecture notes (`TauCetiRoadmap/AnalyticStacks/README.md` lines 1303, 1306, 1322); no licence is stated for them.
- **Not tested.** Neither the report of 7caeef3 nor this round compares the README's arrangement with a source's contents. Observed: units 0.1–0.2, 0.4–0.11 run in the order of HM §§2.1–2.2, 3.1–3.4, 4.1–4.7; Layers 5–6 in that of RCSolid §§7.4–7.7.
- **Not tested.** The description's summary says "Layer 0 follows Heyer–Mann and Scholze … the geometry follows Rodríguez Camargo". The `*Needs:*` lines chain 0.4 → 0.5, 0.6 → 0.7 → 0.8 → 0.9 → 0.10, 0.11.
