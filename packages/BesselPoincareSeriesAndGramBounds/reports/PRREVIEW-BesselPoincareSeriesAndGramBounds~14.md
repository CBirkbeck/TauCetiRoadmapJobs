# Review of BesselPoincareSeriesAndGramBounds (pull request #3027 at 374b9ce)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/BesselPoincareSeriesAndGramBounds/`
**Verdict:** accepted

**Summary.** This head changes only the Conventions paragraph on `*Corollary of:*` lines (README lines 86–93). It now says that what such a line covers is deduced from the general theorem, and that the proof of GRH for Dirichlet L-functions needs only that case. No section of this roadmap carries such a line. The paragraph agrees with the family index and with the convention on statements of the formal proof. No statement, layer or Lean declaration changes. The previous review raised no finding. Its four small corrections, one format note and one question concern text this change does not touch, and none of them has been addressed, so they are carried again below; none blocks. As before, the standing and licence of the formal proof are left to the human reviewers.

## C01 — 5.13c is labelled `published:`, but its own label says that (c) and (d) differ from the published statements, which makes it `adapted from`

This is unchanged from the previous review. The label of 5.13c (lines 250–257) begins "*Origin:* published:" and then says that "(c) is stated for Sobolev-continuous Bessel maps of every unitary representation, and (d) for discrete series with a large gap". The family index defines `adapted from` as a published result "with what is changed". Lemma 7.3.1 of Beuzart-Plessis (2020) concerns tempered representations and gives a growth bound, not boundedness (BeuzartPlessis2020 lines 6990–6994). The fix is to begin the label with "*Origin:* adapted from Jiang, Sun and Zhu (2010) …".

## C02 — The rank-one clause of 5.13c is credited to Theorem 7.2.1 of Beuzart-Plessis (2020), which states only the nonvanishing criterion

This is unchanged. Lines 251–252 credit Theorem 7.2.1 with "has rank at most one and is nonzero exactly when a Bessel functional exists". Theorem 7.2.1 states only `L_π ≠ 0 ⇔ m(π) ≠ 0` (BeuzartPlessis2020 lines 6813–6814). The bound on the rank is in the remark after it, which rests on Theorem 6.3.1 (lines 6825–6826). The fix is to write "Theorem 7.2.1 and the remark after it", or "§7.2".

## C03 — The locator §§2, 4 for Gerasimov, Kharchev and Lebedev (2002) omits §6, where the Capelli generating function is an entry of the monodromy matrix

This is unchanged. The References entry (line 2610) gives §§2, 4 for the result that 5.18a (lines 1155–1157) quotes as the nearest published one. In arXiv math/0204206v3 the monodromy matrix, with `A_n(λ)` as an entry, is in §6. The locator should read §§2, 4, 6.

## C04 — Several Origin labels name an author but no work, and the label of 5.23 names no source

This is unchanged. The labels concerned are:

- 5.13, line 409: "Jacquet; Wallach".
- 5.14, line 472: "Godement".
- 5.15, line 554: "Jacquet".
- 5.17c, line 940, and 5.18d, line 1352: "Jacquet and Ye".
- 5.23, line 2349: factorisation statistics of random polynomials, with no source.

The References entries for these authors (lines 2606–2609) give no titles, so a reader cannot find the published result that an `adapted from` label points to. The fix is to name each work with a locator. For 5.23, a published or textbook treatment of factorisation types over finite fields would do.

## N01 — Seven `*Sources:*` lines keep the words "method", "ingredients" and "frameworks" from the former tags

This is unchanged. The lines are 539, 858, 1141, 1249, 1295, 1495 and 1591. Drop the leftover word, or fold the parenthesis into the Origin label.

## Questions for the author

- In 5.22 (a), lines 2304–2308, the bound `wt_v(𝔣) ≤ ∏_j(1 + g^{−d_j})·wt_GG(𝔣)` is sharper than the formal proof's `(1 + 1/g)^r`, because `∏_j(1 + g^{−d_j}) ≤ (1 + 1/g)^{#j} ≤ (1 + 1/g)^r`. By the Conventions (lines 77–80) that makes it this roadmap's own. Yet the sentence naming this roadmap's own results lists only the equality for irreducible labels and the bound `3/g`. Is the product bound meant as a statement of [FormalProof]? I did not open the formal proof's source, so I could not settle this.

## Previous findings

- The previous report raised no finding (no R01, R02, …). Its other remarks stand as follows.
- C01 — not repaired: line 250 still reads "*Origin:* published: Jiang, Sun and Zhu (2010) and Sun and Zhu (2012), …", followed by what (c) and (d) change.
- C02 — not repaired: lines 251–252 still credit Theorem 7.2.1 with "has rank at most one and is nonzero exactly when a Bessel functional exists".
- C03 — not repaired: the References entry at line 2610 still gives "(2002), §§2, 4 (arXiv math/0204206): 5.18a".
- C04 — not repaired: lines 409, 472, 554, 940, 1352 and 2349 are unchanged, and the References entries at lines 2606–2609 still give no titles.
- N01 — not repaired: line 858 still reads "*Sources:* ingredients (Gelfand–Graev multiplicity one)", and likewise at the six other lines.

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| Corollary convention, lines 86–93 (changed) | sections 5.13a–5.23 | `*Corollary of:*` occurs on 2 lines, 86 and 93, both inside the paragraph; 0 of 29 sections carry it | governs no section here; no new supplier edge; consistent |
| Same paragraph against the family index, lines 66–71 | its four clauses | index: proved in the general roadmap, case deduced, GRH needs only it, Method label gives the narrower form; README: same four, plus the second-proof and `*Needs:*` sentences | no clause contradicts the index |
| Same paragraph against "Statements of the formal proof", lines 77–80 | a section with a narrower formal form and a wider own form | wider form: proved by the route written here; corollary clause: route is [FormalProof]'s "unless the label says that it differs" | compatible; moot here |
| 5.13d (e): the narrower form the paragraph refers to | `r_S = 0`, `k = 1`: `p = q_S = 1`, `r = 2` | threshold `max(5, 45.31, 8√2·17 = 192.33) = 192.33`; (G) for `h/4` needs `h ≥ 4·120·8 = 3840` (also `≥ 2308`, `≥ 1041`) | "(G) for h/4 implies this" holds |
| 5.13d (e), general case | `p + q_S = r`, so `pq_S ≤ r²/4` | `h ≥ 480r³ > rpq_S + 3`; `a(h/4)` bound gives `h ≥ 8√(2q_S)(36q_Sr²+48pq_S+12) > 8√(2q_S)(8·max(rq_S,(q_S−1)r²)+1)` | holds |
| 5.22 (a), the open question | `d_j ≥ 1`, `Σd_j = r` | `∏_j(1+g^{−d_j}) ≤ (1+1/g)^{#j} ≤ (1+1/g)^r`; at `r = 2`, split: `1+1/g ≤ (1+1/g)²` | true; ownership sentence asked about |

The rows for the statements this change does not touch stand as in the previous review, of `71bbefa`.

- The diff: 15 lines in one paragraph of README.md (lines 86–93). `Suggested.lean` is unchanged. Against the merge base `74a09b7` no heading, layer or item is removed, retitled or renumbered (0 headings removed, 0 added).
- Labels at this head: 29 sections, each with both labels (16 particular to the proof, 12 adapted, 1 published). The pull request has 212 `*Corollary of:*` section lines across 36 READMEs, which matches the description's count.
- The previous remarks C01–C04, N01 and the question were checked at their passages. All are unchanged except that line numbers after line 93 have shifted by one.
- Changes outside the folder: every file the pull request changes against `origin/main` lies in a folder the brief names as its own. Run on its own, my gate lists the 118 files of those other folders as changes outside this folder. That run lacked the list of the pull request's folders, and the worker's run, which has the list, passed.
- Automatic checks: all passed in the worker's run. Dependency check: `depcheck: 132 roadmaps, 1476 edges, 0 problem(s)`, with no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with no messages. The file opens a namespace and declares nothing, so there are no signatures to compare.
- Seeded sample: none of the fifteen sampled targets falls in the changed passage. They stand as checked in the previous review.
- Overlap check: read RowTowerAndRallisIdentities, SeesawForThetaChains, ThetaChainsAndFrobeniusPrimeSums and ThetaChainsOnDefiniteUnitaryGroups (main); ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties, ThetaKernelsForUnitaryDualPairs, FiniteReductiveGroups and ThetaLiftsForDefiniteUnitaryGroups (this pull request); QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups (open). Nothing is shared: the change adds no object. Only family roadmaps mention Bessel–Poincaré series, and they cite this roadmap. No other open pull request changes this roadmap or drops an id it cites.

Source independence: changed passages only. One passage, the convention paragraph at lines 86–93, was compared. It cites no source and paraphrases none, and its wording is the project's own, as in the family index at lines 66–71. The largest share of locators is [FormalProof], as in the previous review. Contents were not compared, because no layer is added, removed or reordered.

Research link: 5.13c–5.13d make explicit, for gapped discrete series, the archimedean uniqueness and existence of Bessel models (Jiang–Sun–Zhu 2010, Sun–Zhu 2012, Beuzart-Plessis 2020, Xue 2023, He 2017). 5.16 is a uniform form of limit multiplicity (DeGeorge–Wallach 1978, Savin 1989). The Gram bounds feed the announced formal proof of GRH for Dirichlet L-functions (Alpöge 2026). This rests on the README's References and on the sources read.

## Not verifiable

- The texts listed in the previous review are still not opened: Muić 2009, Petersson 1930, Gelfand–Graev 1962, Siegel 1935, Shimura 1997, Savin 1989, DeGeorge–Wallach 1978, Clozel 1986, Krob–Leclerc 1995 and Zuckerman 1977. The change cites none of them.
- [FormalProof], the Lean source, was not opened. The changed paragraph's claim that the proof of GRH needs only the corollary case was read as a convention, not checked against that source.

## Source issues

- none

## For the human reviewers

- Scope: 16 of the 29 sections are labelled particular to [FormalProof], and every Method label describes it. It is a Lean formalisation announced on 20 November 2026 (README References; family index lines 14–19), not a refereed publication.
- Licence: the family index (lines 20–22) says the formal proof was published without a licence. The Method labels paraphrase its arguments section by section (README 5.13a–5.23).
- Not tested: [FormalProof], the source with the largest share of locators, is Lean code. The wording and arrangement checks were not run against it.
