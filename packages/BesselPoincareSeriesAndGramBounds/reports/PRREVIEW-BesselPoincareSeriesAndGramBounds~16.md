# Review of BesselPoincareSeriesAndGramBounds (pull request #3027 at 3f8c596)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/BesselPoincareSeriesAndGramBounds/`
**Verdict:** accepted

**Summary.** An incremental re-review of the 41 lines changed since `c832fa9`: the repairs of the four small corrections of the previous review, and one constant in the route of 5.16. The four corrections are repaired, and the works and locators now named in the Origin labels are in the sources where the labels say (Beuzart-Plessis, Godement, Jacquet, Flajolet–Sedgewick, read at their locators). No statement, heading or Lean declaration changes and I found no false sentence: accepted, with one small correction and one format note, none blocking. The standing and licence of the formal proof remain for the human reviewers.

## C01 — The description does not say that the route of 5.16 now fixes the threshold `τ*` with exponent `11q_V`

On `main` the route (b) of 5.16 reads `τ* = (nf·rd_E·g_ϕ·b)^{−Cq_V}`, where `C` could only be read as the constant `C = 8·10¹⁴(C_ϕ + 4)` of the statement; this head has `(nf·rd_E·g_ϕ·b)^{−11q_V}` (line 754). The description says that the family's sections gain labels and names the sections whose statements change, and does not mention this one or the other corrections of constants made with it. One sentence would do: "BesselPoincareSeriesAndGramBounds 5.16, route (b): the threshold `τ*` has the exponent `11q_V` of the formal proof." The new value is consistent with the route: for `least(x) < τ*` the covering bound of (f) is at most `(nf·rd_E·g_ϕ·b)^{−9}/2`.

## N01 — Seven `*Sources:*` lines keep the words "method", "ingredients" and "frameworks" from the former tags

Lines 542, 861, 1144, 1252, 1298, 1498 and 1594 (for example "*Sources:* ingredients (Gelfand–Graev multiplicity one)"). Drop the leftover word, or fold the parenthesis into the Origin label.

## Questions for the author

- 5.22 (a): the list of this roadmap's own statements no longer has the upper bound `wt_v(𝔣) ≤ ∏_j(1 + g^{−d_j})·wt_GG(𝔣)`, and the next clause gives [FormalProof]'s form as `(1 + 1/g)^r·wt_GG(𝔣)`, while the Method label of FiniteReductiveGroups §5.8 credits the formal proof with `Σ_j c_jq^{−j} ≤ ∏_l(1 + q^{−d_l})`. Which of the two does the formal proof have? Both are true and nothing uses either; I did not open the formal proof's source.

## Previous findings

- The previous review, of `c832fa9`, raised no finding (no R-numbered remark). Its small corrections and format note:
- C01 — repaired: line 250 now reads "*Origin:* adapted from Jiang, Sun and Zhu (2010) and Sun and Zhu (2012), uniqueness of Bessel models for real unitary groups".
- C02 — repaired: lines 251–252 now credit "Theorem 7.2.1 and the remark after it"; the References entry (line 2609) glosses Theorem 7.2.1 with the nonvanishing criterion only.
- C03 — repaired: line 2614 gives "(2002), §§2, 4, 6 (arXiv math/0204206): 5.18a".
- C04 — repaired: the labels of 5.13, 5.14, 5.15, 5.17c, 5.18d and 5.23 name Beuzart-Plessis (2020) Lemma 7.3.1 (i), Godement (1958) §4, Jacquet (1986) §§1, 7, 9, Jacquet and Ye (1999), Flajolet and Sedgewick (2009), each with a References entry.
- N01 — not repaired: line 861 still reads "*Sources:* ingredients (Gelfand–Graev multiplicity one)", and likewise the six other lines; written again above.
- The question on 5.22 (a) — open, written again above.

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| 5.13c label (lines 250–257) | BeuzartPlessis2020 Thm 7.2.1 and the paragraph after it; Lemma 7.3.1 | line 6813: `L_π ≠ 0 ⇔ m(π) ≠ 0`; lines 6825–6826: image in a space of dimension ≤ 1 by Thm 6.3.1; "adapted" now matches "Here (c) … (d) …" | accurate |
| 5.13 label and Sources (lines 410–411, 449), 5.13c Sources (line 295) | BeuzartPlessis2020 Lemma 7.3.1 (i) | lines 6990–6994: tempered `π`, `ℓ ∈ Hom_H(π^∞, ξ)`, bound `ν_d(e)·Ξ^{H\G}(x)·σ_{H\G}(x)^d` | the label's gloss "a bound for Bessel functionals of tempered representations" is what (i) says |
| 5.14 label (line 474) | Godement1958 §4, Théorèmes 5, 5 bis | §4 "Séries de Poincaré" at line 541; Thm 5 (line 544): normal convergence for `f` in the integrable space, continuity; 5 bis (line 666): boundedness when `α_n > 2n` | locator and gloss right; Siegel case, hence "adapted" |
| 5.15 label (line 557) | Jacquet1986 §§1, 7, 9 | §1 "Doubles classes" (line 121, parametrisation of `T\G/T`); §7 (line 838) and §9 (line 1344): global orbital integrals, split and compact torus; regular and singular kernels in (9.1) | locators and glosses right |
| 5.23 label (lines 2352–2353) | FlajoletSedgewick2009; `q = 3`, degree 2 | Example I.20 at printed p. 90, Note I.66 p. 91, Example VII.4 p. 449; `(3² − 3)/2 = 3` irreducibles, `3² − 3 = 6` squarefree monic quadratics | locators and pages right |
| 5.18a References (line 2614) | Gerasimov–Kharchev–Lebedev §6 | monodromy matrix first in §6 (GerasimovKharchevLebedev2002 line 1278, as read in the previous review) | locator now covers the quoted object |
| 5.16 route (b), `τ* = X^{−11q_V}`, `X = nf·rd_E·g_ϕ·b` | `least(x) < τ*` in (f); `log(1/τ*)` in (d) | `(2·least)^{1/q_V} < 2X^{−11}`; cover `≤ n²√f·g_ϕ·rd_E·2X^{−11}/4 ≤ X^{−9}/2`; times derivative bound `≲ 30X^{3.5}` is `< 1`; `log(1/τ*) = 11q_V·log X` | consistent with (d) and (f); C01 on the description |
| 5.17c, 5.18d labels (lines 943, 1355) | Jacquet and Ye (1999) | title, journal and pages as in the References entry; not opened | under Not verifiable |

The rows for untouched statements stand as in the previous review, of `c832fa9`.

- Source locators read at the text this round: 12 in 4 sources (BeuzartPlessis2020: Thm 7.2.1, the paragraph after it, Lemma 7.3.1 (i); Godement1958: §4, Thm 5, Thm 5 bis; Jacquet1986: §§1, 7, 9; FlajoletSedgewick2009: Example I.20, Note I.66, Example VII.4, with their pages).
- Seeded sample within the changed passages: 5.13c, 5.18a, 5.18d (labels and References only; statements untouched).
- Record against the merge base: one layer and 29 sections at both ends; 0 headings removed or added; 0 Lean declarations removed, added or restated.
- Cross-roadmap citations: the diff adds or alters none.
- The pull request's text: its counts of labels (208 published, 308 adapted, 265 particular, 28 own, 45 definitions) agree with a recount of the family's `*Origin:*` lines after 5.13c moved from published to adapted; C01 is the one omission.
- Changes outside the folder: all in the roadmap folders and the two family indexes that are the pull request's own.
- Automatic checks: all passed in the worker's run. Dependency check, run again: `depcheck: 124 roadmaps, 1415 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with no messages; the file is unchanged, declares nothing and names the three headlines (5.15a, 5.16, 5.20–5.21) as not statable, so there is no one-tactic probe to run.

Overlap check: read RowTowerAndRallisIdentities, SeesawForThetaChains, ThetaChainsAndFrobeniusPrimeSums and ThetaChainsOnDefiniteUnitaryGroups (main); nothing shared: the change adds citations of published works and one constant, no object. No other open pull request changes this roadmap or drops an id it cites.

Source independence: changed passages only; 6 passages (the labels of 5.13c, 5.13, 5.14, 5.15, 5.23 and the two new References entries) compared with 4 sources, none shared beyond titles and standard names; largest share [FormalProof], Lean-file locators, about four fifths of all; contents not compared, since no layer is added, removed or reordered, and [FormalProof] was not read.

Research link: 5.13c–5.13d make explicit, for gapped discrete series, the archimedean uniqueness and existence of Bessel models (Jiang–Sun–Zhu 2010, Sun–Zhu 2012, Beuzart-Plessis 2020, Xue 2023, He 2017); 5.16 is a uniform limit multiplicity (DeGeorge–Wallach 1978, Savin 1989); the Gram bounds feed Alpöge's formal proof of GRH for Dirichlet L-functions (2026). README References and the sources read.

## Not verifiable

- Jacquet and Ye (1999), *Germs of Kloosterman integrals for GL(3)*: newly named in the labels of 5.17c and 5.18d; no copy in the recorded sources, so the reference was not opened.
- Petersson (1930) and Muić (2009), named beside Godement in the label of 5.14: not opened (no open copy recorded).
- [FormalProof], the Lean source: the exponent `11q_V` of 5.16 was checked for consistency with the route, not against that source.

## Source issues

- none

## For the human reviewers

- Scope: 16 of the 29 sections are labelled particular to [FormalProof], and every Method label describes it. It is a Lean formalisation announced on 20 November 2026 (README References), not a refereed publication.
- Licence: the family index says the formal proof was published without a licence. The Method labels paraphrase its arguments section by section (README 5.13a–5.23).
- Not tested: [FormalProof], the source with the largest share of locators, is Lean code. The wording and arrangement checks were not run against it.
- Decisions of the human reviewers: neither is engaged by this folder; no section leaves it and none is renumbered.
