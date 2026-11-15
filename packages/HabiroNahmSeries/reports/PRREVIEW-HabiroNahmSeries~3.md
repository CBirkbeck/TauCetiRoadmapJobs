# Review of HabiroNahmSeries (pull request #1427 at 4b68a8d)

**Verdict:** accepted

No findings. Incremental re-review of 76 changed lines since d526e66, plus the check of the pull request's title and description against this head. Acceptance means ready for a human's final approval, conditional on the seven declared supplier gaps; it is not approval or merger.

## Previous findings

- none: the review of d526e66 was an acceptance with no findings (its R01–R04 bullets recorded repairs of an earlier round; the passages they name are untouched by this diff).

## Verified sound

The diff changes no statement. It renames six `###` headings (5.1, 5.5, 6.1, 6.4, 7.1, 7.6), turns thirteen others (5.2–5.4, 5.6–5.7, 6.2–6.3, 6.5, 7.2–7.5, 7.7) into bold run-in labels with the same numbers and text, and adds six introductory paragraphs. The rows are for statements those paragraphs cite.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §5.2 `formalExponent` (cited by the §5.1 paragraph) | A=(−1), n=2; parity of the numerator for symmetric A | (−4−2)/2=−3, as the Check says; numerator = ∑A_ii n_i(n_i+1)+2∑_{i<j}A_ij n_i n_j, even, so the Lean `/2` is exact | holds | none |
| §5.2 `formalNahmSeries_qDifference` | rank one, A=(a), coefficient of tⁿ; a=3, n=1 | left c_n(1−qⁿ)=(−1)^(an) q^(an(n+1)/2)/(q;q)_(n−1); right (−q)^a q^(a(n−1)) c_(n−1), the same; a=3,n=1: −q³ on both sides | holds | none |
| §5.5 restricted Adams coefficient (cited by the §5.5 paragraph) | m=2, s=2 | (1−q²)/(2(1−q⁴))=1/(2(1+q²)) | holds | none |
| §6.4 polar term of the completed expression | m=1, D_pξ=p² | h=log(1+x/ζ) gives 1/h=ζ/x+…; pole coefficient ζ_m d/m² = p² ≠ 0 | holds | none |
| §6.5 powered and unpowered products (cited by the §5.1 and §6.4 paragraphs) | γ=2, q=2, F⁺=t, F⁻=1, μ=(1,1) | Ψ=(4t²)²=16t⁴; P=(4t)²=16t²; reversed order (q^(γμ)t)^γ gives 16t² per factor, 256t⁴ | holds | none |
| §6.5 need for 1/γ | A=0, m=1, γ=5, q=1+x | 5/(1−q⁵)=−1/x+2−2x+x²+x³/5+…; q/(q−1)=1/x+1; sum 3−2x+x²+x³/5 | holds | none |

Rows for the untouched statements stand as in the previous review, of d526e66.

Consumer claims of the six new paragraphs, each checked against the `*Needs:*` lines it summarises (README line numbers): §5.1 paragraph ↔ 1332, 1497, 1509, 1638, 1759, 1878, 1893, 1957 and the independence sentence at 1293; §5.5 paragraph ↔ 1555, 1561, 1594, 1662, 1693, 2091; §6.1 paragraph ↔ 1718, 2091; §6.4 paragraph ↔ 1718, 1811, 1880, 1893, 2021, 2091; §7.1 paragraph ↔ 2195; §7.6 paragraph ↔ the third paragraph of Downstream consumers. All agree.

- Section ids: every number 5.1–5.7, 6.1–6.6, 7.1–7.7 is still present at this head; the in-README citations of them and the citations from other roadmaps resolve (PadicHodgeRegulators README lines 1452 and 2754 → §6.3; HabiroCyclotomicCompletions README line 82 → §§5.1–5.2; CountingBundlesAndHallAlgebrasOfCurves README line 16 → §5.1, whose plethystic text is unchanged; PolylogarithmFunctions on main names no section of this roadmap).
- Source locators checked against the text, 12, all in the regrouped parts: GSWZ Theorem 5, p. 14 (GSWZ line 640); Corollary 1.11, p. 15 (line 660); §2.1, (46), p. 18 (lines 788, 796); (59), p. 19 (line 876); Theorem 6, (81), p. 24 (lines 1105, 1116); (89), p. 25 (line 1180); (211), p. 43 (line 2230); (214), p. 44 (line 2262); Remark 3.11, p. 44 (line 2280); (222), p. 46 (line 2343). No README passage is flagged unverified.
- Library declarations: `Suggested.lean` is unchanged since d526e66 (16 declarations, 7 `sorry` theorems, single `import Mathlib`); elaborated signatures compared with the README as in the previous review; the padding probe was not repeated on the unchanged file. No fully qualified name of it occurs in another roadmap's `Suggested.lean` (searched on main and at the open heads).
- Gate at 4b68a8d: every check 0, `OK`; outside-folder diff empty; worktree clean. Elaboration of `TauCetiRoadmap/HabiroNahmSeries/Suggested.lean`: exit 0, seven `declaration uses sorry` warnings and nothing else.
- Dependency check: `depcheck: 245 roadmaps, 2241 edges, 0 problem(s)`; no UPWARD or CYCLE line. The diff adds no supplier citation.
- Declared gaps: the seven slugs are unchanged by the diff; not re-examined.
- Pull request text (step 8): title and every sentence of the description read against the head. The summary's three paragraphs agree with the README Summary, Scope, Conventions and Downstream consumers; "Roadmap folder … (README, `Suggested.lean`, `metadata.toml`)" matches the three files added; the validation sentence matches the gate, the elaboration and the dependency check; the 14 open suppliers of the generated dependency list are exactly the README's suppliers not on main (ThetaSeries, FuchsianOrbifolds, ModularForms, StandardDistributions, QuantumEnvelopingAlgebras, PolylogarithmFunctions are on main). The pull request adds the roadmap, removes no section id and no declaration, and the regrouping since d526e66 adds or drops no supplier, so nothing a reader must know is unstated.
- Remark (asks for no change): in the §6.1 paragraph, "§6.2's Wick formula" denotes §6.2's first-jet identity proved by Wick contractions; the general Wick formula is §5.6's, as §6.2's own Needs line says.

Overlap check: read HabiroNumberFields, QSeriesPartitionsAndMockModularForms, PolylogarithmFunctions; nothing shared (HabiroNumberFields README line 17 assigns Nahm sums, formal Gaussian integration and the eta-class evaluation to this roadmap and keeps the finite regulator; QSeriesPartitionsAndMockModularForms README line 1770 and PolylogarithmFunctions README line 1134 name this roadmap as a consumer only).

Source independence: changed passages only; 6 passages compared with 1 source (GSWZ), none shared (the six added paragraphs are internal cross-references with no source counterpart); largest share GSWZ, 114 of 235 source mentions; the diff adds, removes or reorders no layer, so the arrangement was not compared again (GSWZ contents read at GSWZ lines 20–65).

## Not verifiable

- No source needed for the changed passages was unreadable.
- The untouched mathematics and its source checks are carried from the earlier reviews, as an incremental re-review requires; nothing here repeats them.
- Acceptance is conditional on the seven declared supplier gaps (K3BlochGroups, HabiroNumberFields ×2, HabiroCohomologyFoundations ×2, PadicHodgeRegulators, QSeriesPartitionsAndMockModularForms).
- The description's sentence on AI assistance (review and red-team round counts) describes process, not the folder; it was not checked against the head.

## Source issues

- none (no new one in this round; the 29 entries of the review of d526e66 stand and are not repeated).

## For the human reviewers

- **Scope.** The source cited most, GSWZ (114 of 235 mentions), is cited as arXiv:2412.04241v2 with no journal reference; GW is arXiv:2505.19885v1 and Wagner an author-hosted thesis. CGZ and GZ are cited by arXiv versions.
- **Arrangement.** No earlier report compared the layout with GSWZ's contents, and this round's rules exclude it. Observed: parts 5.5, 5.6, 5.7 cite GSWZ §§2.4, 2.5, 2.6 in that order and parts 7.1–7.4 cite GSWZ §§4.1–4.3, 4.5–4.6 in that order (GSWZ lines 35–37, 52–57); since 4b68a8d they sit under two `###` headings.
- **Licence.** Wagner's thesis is read from the author's page (README References); its licence status was not examined.
