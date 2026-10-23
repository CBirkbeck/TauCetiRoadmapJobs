<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/128#issuecomment-6361868928 -->
Review (claude) of 28f9562

Verdict: needs_changes

1. **F01** (P3) The AnalyticNumberTheory links land on redirect stubs, not on the owning sections

   - **Location:** `packages/ArithmeticStatistics/README.md` line 9: "From AnalyticNumberTheory require the [binary-cubic action and discriminant](../AnalyticNumberTheory/README.md#cubic-action-discriminant) (§5.4), …" There are seven such links, §§5.4, 5.5, 5.6, 5.7, 5.21, 5.28 and 5.29.
   - **Claim:** These AnalyticNumberTheory sections state the objects consumed.
   - **Witness:** At board head 0ac1ec8, all seven anchors exist in `packages/AnalyticNumberTheory/README.md` (lines 1398, 1404, 1410, 1416, 1536, 1686, 1700). But each section holds only a "Read in Part II" link, and line 8 says that statements live in the parts.
   - **Repair:** Keep the contract, but cite the owner directly, as Parts I, II, III, V and VI do. Point the links to `../AnalyticNumberTheoryPartII/README.md#s5-4`, `#s5-5`, `#s5-6`, `#s5-7`, `#s5-21`, `#s5-28` and `#s5-29`, and name the supplier AnalyticNumberTheoryPartII. Tested: all seven `s5-N` anchors resolve at the AnalyticNumberTheoryPartII head, at README lines 763, 782, 807, 827, 1193, 1553 and 1581, under the same headings. Both AnalyticNumberTheory (merge-order line 80) and AnalyticNumberTheoryPartII (line 79) come before this roadmap (line 81), so the supply points down either way.

2. **F02** (P2) The analytic summation inputs are credited to the wrong owner, and "every part" overstates the supply

   - **Location:** README line 9: "AnalyticNumberTheory's analytic layers also supply the Dirichlet-series continuation, Perron/partial-summation, Tauberian and convergent-product statements used below …"; later on the same line, "AnalyticNumberTheory supplies every part".
   - **Claim:** AnalyticNumberTheory owns Perron summation, the Tauberian theorem and convergent Euler products, and it supplies all eight parts.
   - **Witness:** AnalyticNumberTheory's own README leaves generic arithmetic Dirichlet series with their existing suppliers (line 12) and lists ArithmeticDirichletSeries as a supplier of its own (line 20). Parts I (line 62) and V (line 49) credit Perron and Wiener–Ikehara to ArithmeticDirichletSeries.
   - **Further instances:**
     - Line 20 of AnalyticNumberTheory's README defers to AnalyticNumberTheoryPartI's `### From ArithmeticDirichletSeries`. That section consumes Layer 3 (Euler products), Layer 6 (Abel and truncated Perron) and Layer 9 (Wiener–Ikehara).
     - What AnalyticNumberTheory does own here is §2.5 (Dedekind continuation, line 428), §5.12 and §5.30 (cubic continuation, lines 1456 and 1708) and §0.26 (Mertens's Euler product, line 258).
     - ArithmeticStatisticsPartVIII's README never mentions AnalyticNumberTheory or either of its parts.
   - **Repair:** Replace the sentence with: "AnalyticNumberTheory supplies the Dedekind and binary-cubic continuations (§2.5, §§5.12 and 5.30); Completed/ArithmeticDirichletSeries Layer 3 (Euler products), Layer 6 (Abel and Perron summation) and Layer 9 (Wiener–Ikehara) supply the convergent-product, summation and Tauberian inputs." Change "supplies every part" to "supplies Parts I–VII directly". Delete "used below", because nothing in this README uses them. Tested: the wording agrees with Part I line 62 and Part V line 49. The three ArithmeticDirichletSeries headings are at `Completed/ArithmeticDirichletSeries/README.md` lines 190, 256 and 337 on main. The README lines naming ANT-I/ANT-II per part are I 5/12, II 0/9, III 22/13, IV 3/3, V 18/9, VI 0/3, VII 4/5 and VIII 0/0.

3. **F03** (P3) The Lean docstring is not in the required form, and the README misdescribes the parts' Lean files

   - **Location:** `Suggested.lean` lines 3–9: "# Arithmetic statistics: package entry point … representative signatures are in Parts I–VIII … This entry point introduces no duplicate declarations." README line 34: "its Lean file states only light definitions, milestones and discriminating examples on existing carriers."
   - **Claim:** The parts' Lean files are catalogues of light definitions and examples, and this file needs no docstring in the standard form.
   - **Witness:** The required form is a "<title>: target signatures" docstring saying that README.md is the roadmap. The parts state headline theorems (`davenportHeilbronn_cubicFields` in Part V, `average_twoSelmer_largeFamily` in Part VI), and examples count as padding.
   - **Repair:** Use this docstring: "# Arithmetic statistics: target signatures. The roadmap is README.md; this file is not the roadmap. Every headline theorem (field densities, class-group moments, Selmer averages) is owned and stated by ArithmeticStatisticsPartI–PartVIII; this index owns none and states nothing." Change README line 34 to "its `Suggested.lean` states that part's headline theorems against the pinned libraries." Tested: the edit touches only the docstring, so the file still elaborates with no messages.

4. **F04** (P3) Dangling references, undefined notation, process wording and a misplaced contract section

   - **Location:** README line 9: "The cubic descriptions below are import and compatibility contracts … with the displayed basis/sign adapters"; line 17: "retain C(F,φ,Σ), including the normalized SL₂ volume supplier; even-degree binary consumers retain their summed tail".
   - **Claim:** This README displays cubic descriptions and adapters, and it defines the hypotheses it says later parts keep.
   - **Witness:** Only the parts table and the references follow line 9. The adapters are displayed in AnalyticNumberTheoryPartII §5.5. `C(F,φ,Σ)` is defined in ArithmeticStatisticsPartVII README line 49, and the summed tails in ArithmeticStatisticsPartIII.
   - **Further instances:**
     - Line 7: "so the original mathematical locators remain unambiguous" (history).
     - Line 9: "restricting to the free coefficient lattice does not discard those general inputs" (defensive).
     - Line 9 says twice that AnalyticNumberTheory takes no input from any part.
     - Line 17: "not an unspecified package", and "package" again in line 34 and the Lean docstring.
     - `## Exact supplier contracts` has no `From …` subsection.
   - **Repair:**
     - Move the AnalyticNumberTheory contract, repointed as in R01, into `## Exact supplier contracts` under its supplier's `### From TauCetiRoadmap.<Name>` subsection.
     - Change "The cubic descriptions below … adapters" to "with the basis and sign conventions of AnalyticNumberTheoryPartII §5.5".
     - Replace the second and third sentences of line 17 with links: "the three-isogeny averages keep the hypothesis `C(F,φ,Σ)` of [ArithmeticStatisticsPartVII](../ArithmeticStatisticsPartVII/README.md) and the summed tails of [ArithmeticStatisticsPartIII](../ArithmeticStatisticsPartIII/README.md)".
     - Delete "original", the "free coefficient lattice" clause, "not an unspecified package" and the repeated no-input sentence. Also use "package" nowhere (line 34 and the Lean docstring).
     - In `## Downstream consumers`, name roadmaps rather than "Higher Selmer and twist arguments".

5. **F05** (P3) The reference register lists 84 works under 132 numbers, with conflicting metadata

   - **Location:** README lines 44–570, for example line 218, [44] "Forum of Mathematics, Pi 13 (2025), e19", against line 422, [95] "Forum of Mathematics, Pi 13 (2025), e2".
   - **Claim:** The register is a coherent source list for the roadmap.
   - **Witness:** The publisher PDF that [95] links gives article number e19 on its page-1 header. 28 works carry 2 to 6 numbers, for example Bhargava–Klagsbrun–Lemke Oliver–Shnidman as [3], [26], [68], [89], [127] and [130]. The README text cites none of them.
   - **Further instances:**
     - Other works under several numbers: Bhargava–Shankar–Wang, squarefree discriminants II, as [59], [75], [82] and [106]; Bhargava–Shankar–Tsimerman as [5], [6], [79] and [91].
     - [20] and [92] give the same v2 two dates; the title page reads March 13, 2026.
     - Spacing is broken in lines 258, 426, 430, 434, 438, 446, 450, 462 and 466, and entries [46], [47], [53] and [54] end in ",." or "..".
     - Access-date narrative: [46] "checked 2026-09-24", [54] "Retrieved2026-10-05", [81] and [89] "accessed 10 October 2026".
     - [76] calls arXiv v1 "published text".
   - **Repair:** Each part keeps its own bibliography, and this index cites nothing. So reduce `## References` to one sentence that points to the parts' bibliographies. If a register stays, keep one entry per work: merge the published and preprint versions with a version note ([44] as e19 with arXiv 2110.07712v2), fix the spacing and drop the access dates. Tested: [95] corrected to e19 matches the publisher PDF.

6. **F06** (P3) The package has no sources manifest

   - **Location:** `packages/ArithmeticStatistics/`, which holds `README.md`, `Suggested.lean`, `metadata.toml` and `reports/`, and no `sources.toml`.
   - **Claim:** The cited works are recorded.
   - **Witness:** The sources service holds two settled keys for this roadmap: `as-ref-022` (Fouvry–Klüners, waived) and `as-ref-056` (de Jong, waived). The README lists Fouvry–Klüners twice, as [22] and [90], which is a second key in waiting.
   - **Repair:** Restore `sources.toml` (schema `tauceti-roadmap-sources/v1`). Keep `as-ref-022` and `as-ref-056` with their waived status, give every work one key, and use none for [90]. If R05 removes the register, the manifest keeps the two settled keys only. Tested: neither key needs a fetch, since both are waived.

7. **F07** (P3) The index sits in the merge order before the eight roadmaps it routes to

   - **Location:** The merge order puts ArithmeticStatistics at line 81 and its parts at lines 93–97 and 120–122. README line 17 says "The exact external contracts are stated in every part".
   - **Claim:** The index can land before its parts.
   - **Witness:** The board index lists no ArithmeticStatistics part; Parts I–VIII are open roadmap pull requests. If the index lands first, its eight links (lines 25–32) are dead on main until Part VIII lands. AnalyticNumberTheory (line 80) follows its parts (78, 79).
   - **Repair:** No README edit fixes this. The depcheck does not see it, because the links are not supply edges. The intake should place ArithmeticStatistics right after ArithmeticStatisticsPartVIII. Tested against the order file: that position stays below its only supplier, AnalyticNumberTheory (line 80).

The package is an index. It owns no target. `packages/ArithmeticStatistics/README.md` (570 lines) routes every target to ArithmeticStatisticsPartI–PartVIII, which are open new-folder roadmaps. It also states one external contract, with AnalyticNumberTheory, and keeps a 132-entry reference register. `Suggested.lean` (12 lines) declares nothing. `metadata.toml` holds only `topic = "math.NT"`. There is no `sources.toml`. Because nothing here is a theorem or definition of this roadmap, the adversarial pass covers the conventions, the supply and ownership claims, the cross-part claims and the reference metadata (table below). The one blocking defect is a supplier sentence that credits the analytic summation inputs to the wrong roadmap (R02). AnalyticNumberTheory is a board package under review. It is not in this branch's board checkout, so I read it at its own board head 0ac1ec8; the copy I used is byte-identical to that commit's `packages/AnalyticNumberTheory/README.md`.

## Adversarial pass

| Statement | Instances tried | Values computed (each side) | Result | Change |
| --- | --- | --- | --- | --- |
| Convention: field counts use isomorphism classes (line 13) | ℚ(∛2), disc −108; ℚ(ζ₇)⁺, disc 49; Part V `davenportHeilbronn_cubicFields` | Weighted embedded count: ℚ(∛2) gives 3 subfields × 1/3 = 1, ℚ(ζ₇)⁺ gives 1 × 3/3 = 1. Unweighted, ℚ(∛2) would count 3. Constants 1/(12ζ(3)) and 1/(4ζ(3)) | consistent with Part V | none |
| Convention: positive denominators before an average (line 13) | `y²=x³+Ax+B`, `H=max(4·abs(A)³, 27B²)<X` | X=1: only (0,0), discriminant 0, so 0/0. X=5: (±1,0) with H=4 and discriminants −64 and 64; (0,±1) has H=27 | convention needed and correct | none |
| Convention: distribution does not give moments (line 13) | `X_n=n` with probability 1/n, else 0 | Converges in distribution to 0; `E X_n=1` for every n against the limit mean 0 | true | none |
| Six-layer numbering; IV/V share Layer 3, VII/VIII share Layer 5 (line 7) | Layer headings of the eight parts at their heads | I 0, II 1, III 2, IV 3, V 3, VI 4, VII 5, VIII 5 | true | none |
| ANT takes no input from any part (line 9) | AnalyticNumberTheory at board head 0ac1ec8; ANT-I and ANT-II at their heads | Index line 12 calls ArithmeticStatistics a downstream consumer; ANT-I line 3423 and ANT-II line 3806 mention the parts only as consumers | true | none |
| ANT supplies every part (line 9) | README lines naming ANT-I/ANT-II per part | I 5/12, II 0/9, III 22/13, IV 3/3, V 18/9, VI 0/3, VII 4/5, VIII 0/0 | false for VIII (true only transitively) | R02 |
| Seven ANT links (line 9) | AnalyticNumberTheory at board head 0ac1ec8; ANT-II head | 7 of 7 anchors at index lines 1398–1700, each a "Read in Part II" stub (99 such stubs in the index); owners at ANT-II lines 763–1581 under `s5-N`; merge order 80 and 79 < 81 | resolve, through one redirect | R01 (P3) |
| Projective equivalence covers nonprincipal modules, stabilizers and determinant-line discriminants (line 9) | ANT-II §5.5; ANT-II §5.4 covariance Check | §5.5 states all three. `u³−v³`: P=−27. Under diag(2,1) it becomes `4u³−v³/2` with P=−27·16·¼=−108=2²·(−27). Under λI, P(λf)=λ⁴P=det(λI)²P | true | none |
| Perron, Tauberian and Euler-product owner (line 9) | AnalyticNumberTheory lines 12 and 20; ANT-I lines 15 and 49–61; Parts I and V; ADS on main | Index: ADS is its supplier. ANT-I consumes ADS Layers 3, 6 and 9. Part I line 62 and Part V line 49 credit ADS. ADS Layer 3 at line 190, Layer 6 at 256, Layer 9 at 337 | wrong owner | R02 |
| Supply among the parts (line 21) | Mentions of later parts in earlier ones | 11 forward mentions on 5 lines (Part I 7, III 1, V 1, VII 2), all of them downstream-consumer lines (I line 2769, III 2411, V 2690, VII 8 and 2493). Merge order I 93 < … < V 97 < VI 120 < VII 121 < VIII 122 | single direction | none |
| `C(F,φ,Σ)` and the summed tails (line 17) | This README; Parts VII and III | Defined 0 times here; defined in Part VII line 49 and in Part III | undefined here | R04 |
| Table links (lines 25–32) | `roadmaps show` for each part | 8 of 8 READMEs and Lean files exist at their heads | resolve (at heads) | R07 (order) |
| Reference [44] against [95] | Publisher PDF, page 1 | Header gives Vol. 13:e19; [44] says e19, [95] says e2 | [95] false | R05 |
| Reference [20] against [92] | arXiv 1512.03035v2 title page | Title page "March 13, 2026"; [92] says 13 March, [20] says 11 March | conflict | R05 |
| References [1], [5], [19], [73], [74], [76], [2], [131] | arXiv texts | [1]: stamp 23 Dec 2013, title 24 Dec 2013, 36 pp, matches. [5]: 20 Jun 2012, 38 pp, matches. [19]: 31 Jan / 4 Feb 2014, 31 pp, matches. [73]: 24 Feb 2017, 42 pp, matches. [74]: 31 Dec 2021, 29 pp, matches. [76]: 19 Jun 2013, 82 pp, matches, but "published text" is false. [2]: 7 pp, matches. [131]: title matches, 39 pp | 7 sound, 1 wording error | R05 |
| `Suggested.lean` | Elaboration; `#check` sweep; one-tactic probe | Exit 0, no messages; 0 declarations to `#check`; 0 `sorry` theorems to probe; namespace `TauCetiRoadmap.ArithmeticStatistics` collides with nothing | sound | R03 (docstring) |

## Supplier-order audit

The dependency check, run as the brief gives it, printed:

    depcheck: 25 roadmaps, 214 edges, 0 problem(s)

It prints no UPWARD, CYCLE or `moved:` line. The README has no `*Needs:*` line. Its only supplier citation is the AnalyticNumberTheory paragraph. AnalyticNumberTheory is merge-order line 80, below this roadmap's 81, so the supply points down, and the paragraph resolves at that package's board head 0ac1ec8. R01 asks for a direct citation of the owning part, AnalyticNumberTheoryPartII (line 79). R02 corrects the owner of the summation inputs to ArithmeticDirichletSeries (Completed, on main). The README declares no gaps, and there is no `design/plan.json`.

## Duplication and ownership

The index states no object, and its Lean file declares no name, so it restates nothing. I checked its summary objects by search, using the open-head index of 2026-10-23T09:03:29Z and main:

- Davenport–Heilbronn objects are found only in the ArithmeticStatistics parts.
- Cohen–Lenstra objects are in the parts, InductionRestrictionPartII, InverseGaloisAndArithmeticFundamentalGroups, ArithmeticGaloisDuality and ArithmeticDirichletSeriesPartII.
- Selmer averages are in the parts and HeightsRationalPointsAndObstructions.

None of these is planned by this index, so none of them is a duplicate here.

The board index of open packages lists 37 other packages. I read the 22 whose heads are held locally; AnalyticNumberTheory is among them. None of the 22 mentions Davenport–Heilbronn, Cohen–Lenstra or Selmer averages. The 15 other heads are not held locally and were not checked: ArithmeticLocallySymmetricSpacesPartII, CompletedCohomologyAndLocalGlobalCompatibilityPartII, CrystallineCohomologyPartII, EndoscopicTransferAndUnitaryTraceComparisonPartII, HigherHidaAndColemanTheory, LawrenceVenkateshMethod, OrdinaryAutomorphicFormsAndModularityLiftingPartII, PELModuliPartII, PadicHodgeTheoryPartII, PadicLocalLanglandsForGL2QpPartII, RealSurfacePeriodIndex, SchemeAndStackFoundationsPartII, ShimuraVarietiesPartII, VStackSheavesAndLisseCategoriesPartII and VectorBundlesAndIsocrystalsPartII. The nine other packages in this branch's board checkout have no hits either.

No roadmap I could read uses the namespace `TauCetiRoadmap.ArithmeticStatistics`.

## Headline theorems and padding

The README names no headline theorem of its own. The end results in its summary (field densities, class-group moments, Selmer averages) are stated in the parts, for example `davenportHeilbronn_cubicFields`, `bhargava_quarticQuinticFields` and `fouvryKluners_fourRankMoments` in Part V, and `average_twoSelmer_largeFamily` and `secondMoment_twoSelmer_le` in Part VI. Stating them here would duplicate those fully qualified owners. So the empty file is correct, except for its docstring (R03). There is no padding.

## Verified sound

- I checked the principles: no sorry'd data, no `set_option`, no `lemma`, no LaTeX, no PR numbers, a single `import Mathlib`, and no copied source passages.
- `Suggested.lean` elaborates with `lake env lean` from the content checkout: exit 0 and zero messages. It has 0 declarations, so the `#check @name` sweep and the one-tactic probe had nothing to test, and nothing changed.
- The eight table links all resolve at their heads, and the eight parts' layer assignments match line 7.
- The seven cited anchors exist in the AnalyticNumberTheory README at board head 0ac1ec8, above headings matching the link texts. Their owning sections exist in ANT-II. I recomputed ANT-II's §5.4 covariance Check (3 values). The §5.5 claim (nonprincipal modules, stabilizers, determinant-line discriminants) is true.
- I opened ADS on main at lines 190, 256 and 337; ANT-I at lines 15 and 49–61; and the AnalyticNumberTheory README at lines 8, 12 and 20.
- Supply direction among the parts: 11 forward mentions on 5 lines, all of them downstream lines.
- The three conventions on line 13 hold on computed instances.
- Reference metadata: 12 entries checked against the texts. 9 match ([1], [2], [5], [19], [44], [73], [74], [92], [131]), [76] has a wording error, [95] is wrong and [20] conflicts with the title page.
- Depcheck clean.

## Not verifiable

- **Seeded sample:** 15 targets were requested, but the index has no target headings, so the sample is empty. No locator is flagged unverified. I chose the reference-metadata checks above myself.
- **[20]'s "11 March 2026":** the arXiv listing date is not in the PDF text.
- **Unchecked publication data:** [2] (Annals 203, 2026) and [24] (JAMS 39, 2026). I read only [2]'s arXiv preprint and did not fetch [24].
- **[60]:** a Google Drive link whose provenance as the author's copy I cannot establish. I did not fetch it.
- **[22]/[90] and [56]:** waived (`as-ref-022`, `as-ref-056`), so not read.

AnalyticNumberTheory is not in this branch's board checkout. I read it at its own board pull-request head 0ac1ec8, which a separate board checkout holds, and checked that copy byte for byte against the commit. No text needed for this review was unreadable, so I wrote no `needs-references.toml`. The sources I fetched were not recorded in any manifest, because the package has none. No untrusted text contained instructions.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "28f9562", "job": "REV-PKG-ArithmeticStatistics", "model": "opus", "worker": "fable-rev2"} -->
