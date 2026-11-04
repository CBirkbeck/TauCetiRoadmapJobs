<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/128#issuecomment-6392509200 -->
Red team round 1 pass b (claude) of b571a4c

Verdict: needs changes

1. **F01** (P1) The package is an index: it owns nothing, nothing supplies from it; withdraw it (addressed to the maintainer)

   This is not a re-raise of the repair report's F07 (which concerned the merge-order line, something a worker cannot edit). The settled question on the board is whether "an index of eight separately owned roadmaps" is a roadmap. The counts say it is not.

   - **Location.** README:7: "Each target has one owner among the eight parts; this index states no target of its own." `Suggested.lean`:10–11: "This index owns no target, so it states no theorem and introduces no definition". README:3 nevertheless says the roadmap builds families, proves counting estimates and computes densities, moments and Selmer averages.
   - **Claim.** The folder is a roadmap: a specification with its own targets, Checks, acceptance test and consumers.
   - **Witness (counts).**

   | Measured | Value | Evidence |
   | --- | --- | --- |
   | Own bold targets / `*Needs:*` lines / Checks / Lean declarations | 0 / 0 / 0 / 0 | 60 README lines; the only bold text is "Summary."; `Suggested.lean` is one docstring and an empty namespace |
   | Parts-table cells that copy the part's own H1 subtitle | 8 of 8 | e.g. row II "Integral orbit dictionaries." = `TauCetiRoadmap/ArithmeticStatisticsPartII/README.md:1` after "Part II:"; rows V and VII add only a pointer to a target owned by Part V (§3.8, line 977) or Part VII (line 1150) |
   | Supplier link texts that copy the owner's heading | 12 of 12 | AnalyticNumberTheoryPartII §§5.4, 5.5, 5.6, 5.7, 5.21, 5.28, 5.29 (lines 763, 782, 807, 827, 1193, 1553, 1581); AnalyticNumberTheoryPartI §2.5 (1117) and Layer 3 (2028); ArithmeticDirichletSeries Layers 3, 6, 9 (`Completed/ArithmeticDirichletSeries/README.md:190, 256, 337`) |
   | Remaining paragraphs that restate another roadmap | all | README:13 condenses the Conventions of Parts I (22–32), V (21–31) and VI (21–31); README:35's two retention notes are at Part VII:13, 49, 1368, 2265 and Part V:2461, 2481, 2539; README:52 restates HeightsRationalPointsAndObstructions:39 and ModularityAndLanglandsExtensions:1387, both of which cite the parts by name |
   | Statements found nowhere else | 1 | README:7, the §§3.2–3.9 numbering collision between Parts IV and V |
   | Mentions of the bare name on main and at open heads | main 1; heads 9 lines in 7 roadmaps | 0 `*Needs:*` lines, 0 supplier rows; every one is consumer prose (list under the repair) |
   | Supplier citations of the bare name in board-main designs | 97 occurrences in 5 packages | `ArithmeticStatistics:ST.0/…` 72, `ST.3` 2, `ST.4/…` 5, `ST.5/…` 18; the index has no `ST.n` section; all 20 distinct slugs are anchors in Part I (14), Part VI (1) or Part VII (5) |

     So no citation anywhere is satisfied by this folder: the consumer prose names the series, and the only supplier-style citations (the board designs) name sections that exist only in the parts. The brief's contract says `Suggested.lean` is the acceptance test stating the headline theorems the finished roadmap proves; a roadmap whose acceptance test is empty by design has no finish line. The board already rejected the identical pattern for the sibling index: `packages/AnalyticNumberTheory/reports/REV-PKG-AnalyticNumberTheory~2.md` F01 (P1) withdraws that index and notes that the decision also decides this one.

   - **Repair (exact).**
     1. Withdraw `packages/ArithmeticStatistics` (README.md, Suggested.lean, metadata.toml, sources.toml) and delete the line `ArithmeticStatistics` (merge-order line 99). No `*Needs:*` line and no supplier row on main or at an open head names it, so no consumer loses a supplier.
     2. Repoint the consumer prose at the parts that own the material:
        - `TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/README.md:3812`: "**ArithmeticStatistics** uses" becomes "**ArithmeticStatisticsPartVI** uses". The bullet says A6.30–A6.34 while Part VI:1487 and 1503 cite A6.30–A6.33; make the ranges agree.
        - `TauCetiRoadmap/ArithmeticGaloisDuality/README.md:7114`: "ArithmeticStatistics" becomes "ArithmeticStatisticsPartI, ArithmeticStatisticsPartII, ArithmeticStatisticsPartVI, ArithmeticStatisticsPartVII" (the parts that cite it, e.g. Part II:2023).
        - `TauCetiRoadmap/InductionRestrictionPartII/README.md:1786`: "ArithmeticStatistics ST.3 and ST.5, and ArithmeticStatisticsPartV, use" becomes "ArithmeticStatisticsPartV uses"; line 1788: "ArithmeticStatistics ST.3 is" becomes "ArithmeticStatisticsPartV is" (Part V:17, 19, 47 cite InductionRestrictionPartII; no other part does).
        - `TauCetiRoadmap/PolynomialGaloisGroupsPartII/README.md:51` and `:1433`, and `packages/PolynomialGaloisGroupsPartII/README.md:48` and `:1329`: "a continuation of ArithmeticStatistics" becomes "a continuation of ArithmeticStatisticsPartV".
        - `TauCetiRoadmap/ClassicalArithmeticCompletion/README.md:23` on main (line 25 at its open head): after R02, "ArithmeticStatistics consumes the negative-Pell families" becomes "ArithmeticStatisticsPartI and ArithmeticStatisticsPartV consume the negative-Pell families" (today neither part cites it: 0 hits in both).
        - AnalyticNumberTheoryPartI:3423 and AnalyticNumberTheoryPartII:3806 already say "the ArithmeticStatistics parts"; HeightsRationalPointsAndObstructions and ModularityAndLanglandsExtensions already cite the parts: no change.
        - Board-main designs `packages/{CMRankZeroConverse,EffectiveBoundsCompactModels,EffectiveBoundsPartII,RankOneConverse,RankZeroOneBSDPartII}/design/{README.md,plan.json}`: each `ArithmeticStatistics:ST.0/<slug>` becomes the same slug under ArithmeticStatisticsPartI (e.g. `relative-density` is Part I:256, `number-fields-ordered-by-discriminant` Part I:1300); `ST.4/refinement-positive-simultaneous-rank-one` becomes ArithmeticStatisticsPartVI (anchor at 1896); the five `ST.5/<slug>` become ArithmeticStatisticsPartVII (e.g. `selmer-ratio-of-an-isogeny` at 1289); bare `ST.0` becomes Part I Layer 0 and bare `ST.5` Part VII Layer 5; `ST.3` occurs only in a "no dependence" sentence (`EffectiveBoundsCompactModels/design/README.md:700`) and becomes ArithmeticStatisticsPartV.
     3. Keep the one fact only the index states. Part IV uses §§3.1–3.11 and Part V uses §§3.2–3.9 and 3.19–3.37, so §3.2 is "Gaussian coefficients" in IV and "Cubic splitting densities and field counts" in V. Renumber Part V's §§3.2–3.9 to §§3.38–3.45 and update its internal references (Part V:69–74, 940, 1223, 1357, 1399, 2589, 2595). Part IV keeps its numbers: HabiroCyclotomicCompletions:52, QSeriesPartitionsAndMockModularForms:408 and 510, HabiroRings:676, Part VII:46 and 2490 and Part VIII:625–1219 cite Part IV §§3.1–3.6 by number, whereas every external citation of Part V by number is to §3.27 (Part VIII), §3.28 (GenericDoublePointInterpolation:50, 1623) or §3.30 (SieveMethodsAndPrimePatterns:3300, 3666), all outside the renumbered range; section links use slug anchors and do not change.
   - **Test.** After step 2 every citation of the bare name found (97 on the board, 10 lines on main and at open heads) names a part whose anchor or section exists (all 20 slugs resolved). After step 3 the Layer 3 section-number sets of Parts IV and V are disjoint.

2. **F02** (P1) "Each target has one owner among the eight parts" is false: the negative-Pell radicand family has two owners in the series and a third on main

   - **Location.** README:7: "Each target has one owner among the eight parts".
   - **Claim.** Every object of the series is stated by exactly one part.
   - **Witness.** Part I:1922 ("Negative pell radicands", §0.15) defines the family D of positive squarefree d with every prime factor 2 or 1 mod 4, with `D(X)` using `d ≤ X`, and the soluble subset `NegativePellSoluble`. Part V:2138 ("Restricted real quadratic family", §3.31) defines the same D and D⁻ with `D(X)` using `d < X` (`pellRadicands`, `negativePellRadicands`, `pellRadicandsBelow`). `TauCetiRoadmap/ClassicalArithmeticCompletion/README.md:8769–8780` (§4.39, on main) defines 𝒟, 𝒟⁻, 𝒟(X), 𝒟⁻(X) with `d < X`. None of the three cites either of the others (0 hits for ClassicalArithmeticCompletion in Parts I and V; Part V does not link Part I's `negative-pell-radicands` anchor). A grep for the object across main and all open heads finds only these three roadmaps.
   - **Values.** At X = 5: Part I gives D(5) = {1, 2, 5} (3 elements); Part V and ClassicalArithmeticCompletion give {1, 2} (2 elements). 3 is excluded (3 mod 4), 4 is not squarefree. The two in-series owners disagree at the cutoff.
   - **Repair.** In this folder: delete "Each target has one owner among the eight parts; " from README:7 (moot if R01 is applied). For the maintainer, in the parts: Part I's "Negative pell radicands" imports 𝒟, 𝒟⁻ and 𝒟(X) (strict cutoff) from ClassicalArithmeticCompletion §4.39 and keeps only `quadraticRadicandDisc` and the rescaling step; Part V's "Restricted real quadratic family" imports the same three objects instead of `pellRadicands`, `negativePellRadicands`, `pellRadicandsBelow` and keeps its four-rank slices and discriminant conversion; both add ClassicalArithmeticCompletion §4.39 to their supplier contracts (it is on main, so supply runs the right way). Test: at X = 5 all three then give {1, 2}.

3. **F03** (P2) The parts do not use the basis and sign conventions of AnalyticNumberTheoryPartII §5.5

   - **Location.** README:21: "the parts use these objects with the basis and sign conventions of §5.5".
   - **Claim.** The parts and §5.5 share one normal-basis convention.
   - **Witness.** AnalyticNumberTheoryPartII:787 displays `ω² = −ac + bω − aθ` and line 811 gives the traces of 1, ω, θ as 3, b, −c. Part I:126 fixes `ω² = −ac − bω + aθ`, line 130 pins that sign, line 132 names the adapter `cubicNegatedBasis` (1, −ω, −θ), and line 160 gives Tr ω = −b, Tr θ = c. Part I:128 says so itself ("use its simultaneously negated normal basis"); the index's sentence does not.
   - **Values.** For f = x²y − xy², (a, b, c, d) = (0, 1, −1, 0): §5.5 gives ω² = ω and Tr ω = 1; Part I gives ω² = −ω, ω ↦ (−1, 0, 0) in ℤ³ (its Check at line 150) and Tr ω = −1.
   - **Repair** (only if the package is kept). Replace the clause with: "Part I fixes the statistical coordinates by the simultaneously negated basis (1, −ω, −θ) of §5.5's normal basis, so its linear traces are (3, −b, c) rather than §5.5's (3, b, −c); a part that imports Part I's cubic ring uses Part I's coordinates." Test: f = x²y − xy² gives Tr ω = −1 in the stated convention, as at Part I:150.

4. **F04** (P3) README:48 misdescribes Part V's acceptance test

   - **Location.** README:48: "its `Suggested.lean` states that part's headline theorems against the pinned Mathlib and Tau Ceti, naming the missing carrier of each headline that is not statable there".
   - **Claim.** All eight parts' Lean files have that form.
   - **Witness.** The module docstring of Part V's `Suggested.lean` (lines 6–13) calls the file "representative target signatures" of "light definitions and selected milestones" and names no missing carrier; its README-only list (lines 558–560) says only that those targets need the interfaces specified in the README. The other seven docstrings do name the missing carriers (e.g. Part II:22–29, Part VI:23–29) or say none is missing (Part IV:14–15).
   - **Repair** (only if the package is kept). Replace README:48 with "Each part's README is its full mathematical specification." Test: the sentence then makes no claim that Part V's file contradicts.

5. **F05** (P3) Fouvry–Klüners Theorem 1 concerns narrow class groups

   - **Location.** README:43: "the four-rank moments of quadratic class groups (Fouvry–Klüners [as-ref-022], Theorem 1)".
   - **Claim.** The theorem is about class groups without qualification.
   - **Witness.** as-ref-022 lines 17–18 distinguish the ordinary class group Cl_D from the narrow one C_D; lines 43–56 state the conjectures for C_D² and line 97 (p. 3) states Theorem 1 for them. Part V:977 (§3.8) uses `NumberField.NarrowClassGroup`. For D = 136 (ℚ(√34)): the narrow class number is 4 (20 reduced indefinite forms of discriminant 136 fall into 4 cycles), the 2-rank is ω(136) − 1 = 1 (line 59), so C_D ≅ ℤ/4 and 2^{rk₄} = 2; the fundamental unit 35 + 6√34 has norm +1 (x² − 34y² = −1 is insoluble), so h = 2, Cl_D ≅ ℤ/2 and 2^{rk₄} = 1.
   - **Repair** (only if the package is kept). "among them the four-rank moments of narrow class groups of quadratic fields (Fouvry–Klüners [as-ref-022], Theorem 1)". Test: at D = 136 the stated object gives 2, the value Part V's carrier computes.

Blocking: R01 and R02 (P1). R03 is P2; R04 and R05 are P3. If R01 is applied the folder goes away and R03–R05 lapse with it; R02's substantive repair lands in Parts I and V in any case.

This pass was run by Claude Fable independently of the round-2 repair (an Opus agent) and of an earlier Opus draft of this report. Every count, locator and computation below was recomputed; the draft's findings that survived are restated in my words, nothing from it was taken on trust. `README` means `packages/ArithmeticStatistics/README.md`; `Suggested.lean` means `packages/ArithmeticStatistics/Suggested.lean`. Line numbers into the parts and into the analytic suppliers are file lines at the heads listed under "Verified sound".

## Adversarial pass

The package states no theorem and no definition; each row is an assertion of the README.

| Statement | Instances tried | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| README:7, layer assignment | H2 "Layer" headings of the eight parts | I 0 (178), II 1 (62), III 2 (78), IV 3 (61), V 3 (79), VI 4 (69), VII 5 (63), VIII 5 (188) | true | none |
| README:7, numbering collision | `### k.n` headings per part | IV {3.1–3.11}; V {3.2–3.9, 3.19–3.37}; IV ∩ V = 8 sections. VII {5.1–5.11, 5.23–5.32}; VIII {5.12–5.22}; VII ∩ VIII = ∅ | true | R01 step 3 |
| README:7, "one owner" | negative-Pell family at X = 5 | Part I {1, 2, 5}; Part V and ClassicalArithmeticCompletion {1, 2} | false | R02 |
| README:9 and 21, who consumes which ANT-II section | `#s5-n` link anchors per part | §§5.4–5.7: I (2,4,1,1), II (1,6,0,0), III (1,1,1,1), V (1,1,1,4), VI (1,1,1,1), IV/VII/VIII 0. §5.21/5.28: I, III, V only. §5.29: I 1, III 1, V 1, VII 1; II, IV, VI, VIII 0 | true | none |
| README:21, §5.5 covers nonprincipal modules, stabilizers, determinant-line discriminants | ANT-II:784 | rank-two projective V with a section of Sym³V ⊗ (∧²V)^∨; isomorphisms with stabilizers; discriminants as sections of the determinant-line square | true | none |
| README:21, §5.5 conventions | f = x²y − xy² | §5.5: Tr ω = 1 (traces 3, b, −c at line 811). Part I: Tr ω = −1 (line 160, Check at 150) | false | R03 |
| README:17, Parts IV and VIII take no analytic input | Part IV:53; Part VIII text | IV: ANT-I Layers 0–3 and ANT-II Layers 4–6 "are not inputs to this part"; VIII: 0 mentions of ANT-I, ANT-II or ADS | true | none |
| README:25, ANT-I consumers | mentions per part | I 5, III 22, V 18, VII 4; II, VI, VIII 0; IV 3 (all exclusions). §2.5: I 2, V 11; Layer 3: III 4, VII 3 | true | none |
| README:29, ADS layers | supplier lines of Parts I, III, V | I:63 "Layers 6 and 9"; III:61 Layer 3 `EulerProductData`, Layer 6 `perronFormula`, Layer 9; V:50 "Layers 3, 6 and 9". ADS 3.3 absolute convergence, 9.1 `a n ≥ 0`, residue `κ ≥ 0`, boundary formulation | true | none |
| README:35, Part VII keeps `C(F,φ,Σ)` | Part III:2272; Part VII:49, 1368, 2265 | Part III names the `SL₂` volume-one input; Part VII:49 retains "all seven contract items" and `SL₂` Tamagawa volume one; 1368 and 2265 assume `C(F,φ,Σ)` | true, owned by the parts | R01 |
| README:35, even-degree tail clause | n = 4: (δ,η,ξ) = (1/2, 1/100, 0) and (1, 3/5, 0) | first: τ = 1/50, 9τ = 0.18 < 5, τ < 1; second: τ = 0.6 < 1 but 9τ = 5.4 ≥ 5. Since τ < (n+1)/(2n+1) < 1, `τ < 1` is implied | true as at Part III:1919, Part V:2461, 2481, 2539 | R01 |
| README:39–46, table rows | H1 subtitles at the heads | 8 of 8 equal | copies | R01 |
| README:43, FK Theorem 1 | as-ref-022 lines 85–93, 97; D = 136 | (1): mean of 2^{rk₄} over D > 0 is 3/2; (2): over D < 0 is 2. D = 136: narrow 2, ordinary 1 | locator true; object imprecise | R05 |
| README:45, de Jong Theorem 1.2 | Part VII:1150 and its locator line | target "Function field 3 selmer average bound" cites [56] Theorem 1.2, author DVI pp. 1–2 | routing true; source unread | none |
| README:48, the parts' Lean files | the eight module docstrings | I, II, III, VI, VII, VIII name missing carriers; IV says none is missing; V names none | false for V | R04 |
| README:52, downstream consumers | HRPO:39; MLE:1387 | Part I §0.22 (2531), Part II §1.12 (1821), Part III §2.17 (1967), Part I §0.1 (182) exist with matching headings; both consumers cite the parts, not the index | true, consumers of the parts | R01 |
| README:58, FK locator | as-ref-022 page markers | page 3 begins at line 95; Theorem 1 at line 97 | true | none |
| Bare-name census | `roadmaps grep 'ArithmeticStatistics([^P]\|$)'`; board origin/main | main 1 (CAC:23); heads 9 lines in 7 roadmaps; board designs 97 in 5 packages; 0 `*Needs:*`, 0 supplier rows | nothing resolves to the index | R01 |
| `Suggested.lean` | declarations, imports, docstring form | 0 declarations; `import Mathlib` only; title "Arithmetic statistics: target signatures"; no `set_option`, no `lemma` | nothing to test | none |

## Verified sound

- **Read.** All 60 README lines, all 15 lines of `Suggested.lean`, `sources.toml` (2 entries, keys `as-ref-022` and `as-ref-056`, both waived, `cited_for` pointing at the parts-table rows that exist) and `metadata.toml` (`math.NT`).
- **Counts.** 0 declarations (so the `#check @name` sweep is empty and no binder can have been lost), 0 own targets, 0 Checks, 1 bold token.
- **Locators.** 1 of 2 verified: as-ref-022 Theorem 1 is on p. 3 of the author manuscript (line 97) and README:58 says so; the bibliographic data at README:58 and :60 agree with Part V [22] and Part VII [56]. as-ref-056 is under "Not verifiable".
- **Sibling citations checked: 26**, all at the current heads (AnalyticNumberTheoryPartII ed5b737, AnalyticNumberTheoryPartI 4ba2e21, Parts I–VIII 3b1a24f, a7cc3be, 6f16f6c, 92b9193, 7f06cfc, 88461f2, cbcd49e, b3b98cc; HeightsRationalPointsAndObstructions 82cf8af; ModularityAndLanglandsExtensions 2d70821; ArithmeticDirichletSeries on main ae2562c): the 7 ANT-II headings, ANT-I §2.5 and Layer 3, ADS Layers 3, 6, 9, Part III anchors `refinement-binary-summed-tail` (1917) and `support-coregular-count` (2270), the 8 part links, and the 4 downstream sections. Also the 20 `ST.n` slugs (all resolve to parts) and the 10 consumer lines listed in R01.
- **Analytic supplier map.** README:17–29 is true per part as computed in the table.
- **Dependency check.** Output:

```text
depcheck: 47 roadmaps, 508 edges, 0 problem(s)
```

  No UPWARD, CYCLE or `moved:` line. The index sits at merge-order line 99, after AnalyticNumberTheoryPartI (96) and AnalyticNumberTheoryPartII (97) and before its parts (124–128, 157–159); the links to the parts are not extracted as supply edges.
- **Citation resolver.** `roadmaps resolve` reports no unresolved cross-roadmap citation and no unresolved Lean name (index of 2026-10-25T01:21:56Z, 349 open pull requests).
- **Ownership against open pull requests.** Checked by object with `roadmaps grep` over main and all open heads (negative-Pell radicands, cubic basis conventions, four-rank moments, the three-isogeny contract, section numbering) and on the board's main and the 20 package heads of its index.
- **Policy.** No pull-request number, process narrative, `lemma`, `set_option` or machine path in the package; `git diff --stat origin/main...HEAD` touches only `packages/ArithmeticStatistics/`.
- **Untrusted text.** None of the files read contained instructions.

## Not verifiable

- **as-ref-056 (de Jong), Theorem 1.2.** Waived key with no cached extraction; not requested. Constants and the author's DVI pagination are uncertified here. Only the routing to Part VII:1150 and its locator line was checked.
- **Lean elaboration: not built.** The board checkout has no Lake project and the content checkout has no built `.lake`; by inspection the file has one import, one docstring and an empty namespace, so a build would test nothing.
- **Rendered typography of as-ref-022 equation (2).** No PDF renderer is installed; three `pdftotext` modes agree on the extraction.
- **Journal pagination of the two references.** Checked only against the parts' own bibliographies, not against the journals.
- **R01 step 2, board designs.** The target part of each slug was verified; the exact citation syntax of the design plans was not.

## Source issues

- **Misprint** in as-ref-022 at equation (2), author manuscript p. 2 (as-ref-022 line 93): the source normalises the mean of 2^{rk₄} over negative discriminants by the count of positive discriminants; it should be the count of negative discriminants, as in the definition of M⁻ (line 38) and the odd-p analogue (lines 80–81); affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "b571a4c", "job": "RT-ArithmeticStatistics~1b", "model": "fable", "worker": "fable-rt20"} -->
