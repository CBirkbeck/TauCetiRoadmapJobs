# Review of BesselPoincareSeriesAndGramBounds (pull request #3027 at c832fa9)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/BesselPoincareSeriesAndGramBounds/`
**Verdict:** accepted

**Summary.** A review of the change against `main`: 432 changed lines since `74a09b7`. The change adds an `*Origin:*` and a `*Method of the formal proof:*` label to each of the 29 sections 5.13a–5.23, replaces the former tags by `*Sources:*` lines, adds two Conventions paragraphs, narrows one ownership sentence in 5.22 and extends the References; no statement, heading, layer or Lean declaration changes. I checked the labels against the routes they describe and against the cited sources at their locators, and found no false statement: accepted, with four small corrections and one format note, none blocking. The standing and licence of the formal proof are left to the human reviewers.

## C01 — 5.13c is labelled `published:`, but its own label says that (c) and (d) differ from the published statements, which makes it `adapted from`

A reader who trusts the label takes 5.13c for a quotation of published theorems. The label (lines 250–257) begins "*Origin:* published:" and continues "Here (c) is stated for Sobolev-continuous Bessel maps of every unitary representation, and (d) for discrete series with a large gap". Lemma 7.3.1 of Beuzart-Plessis (2020) is about tempered representations and gives a bound with growth `Ξ·σ^d`, not boundedness (BeuzartPlessis2020 lines 6990–6994), and the absolute convergence of the unregularised form is not in the sources named. The family index defines `adapted from` as a published result with what is changed. Begin the label with "*Origin:* adapted from Jiang, Sun and Zhu (2010) …".

## C02 — The rank-one clause of 5.13c is credited to Theorem 7.2.1 of Beuzart-Plessis (2020), which states only the nonvanishing criterion

Lines 251–252 credit Theorem 7.2.1 with "has rank at most one and is nonzero exactly when a Bessel functional exists". The theorem states `L_π ≠ 0 ⇔ m(π) ≠ 0` and nothing else (BeuzartPlessis2020 lines 6813–6814); the bound on the rank is in the paragraph after it, from Theorem 6.3.1 (lines 6825–6826). Write "Theorem 7.2.1 and the remark after it", or "§7.2". The same wording is in the References entry (line 2605).

## C03 — The locator §§2, 4 for Gerasimov, Kharchev and Lebedev (2002) omits §6, where the monodromy matrix is

The label of 5.18a (lines 1155–1157) quotes this paper for "the Capelli generating function as an entry of the Toda monodromy", and the References entry (line 2610) gives §§2, 4. In arXiv math/0204206v3 the monodromy matrix first appears in §6, "Connection with the QISM-based approach" (text line 1278); §§2 and 4 have the Whittaker modules and the Drinfeld generators `A_n(λ)`. The locator should read §§2, 4, 6.

## C04 — Several Origin labels name an author but no work, and the label of 5.23 names no source

An `adapted from` label points a reader to a published result, and these cannot be followed: 5.13, line 409 ("Jacquet; Wallach"); 5.14, line 472 ("Godement"); 5.15, line 554 ("Jacquet"); 5.17c, line 940, and 5.18d, line 1352 ("Jacquet and Ye"); 5.23, line 2349 (factorisation statistics of random polynomials, no source). The References entries for these authors (lines 2606–2609) give no titles either. Name each work with a locator; for 5.23 a textbook treatment of factorisation types over finite fields would do.

## N01 — Seven `*Sources:*` lines keep the words "method", "ingredients" and "frameworks" from the former tags

Lines 539, 858, 1141, 1249, 1295, 1495 and 1591 (for example "*Sources:* ingredients (Gelfand–Graev multiplicity one)"). Drop the leftover word, or fold the parenthesis into the Origin label.

## Questions for the author

- 5.22 (a), lines 2304–2308: the change removes the upper bound `wt_v(𝔣) ≤ ∏_j(1 + g^{−d_j})·wt_GG(𝔣)` from the list of this roadmap's own statements, and the next clause still gives [FormalProof]'s form as `(1 + 1/g)^r·wt_GG(𝔣)`. The Method label of FiniteReductiveGroups §5.8 at this head credits the formal proof with `Σ_j c_jq^{−j} ≤ ∏_l(1 + q^{−d_l})`. Which of the two bounds does the formal proof have? Both are true (`∏_j(1 + g^{−d_j}) ≤ (1 + 1/g)^r`), and nothing uses either; I did not open the formal proof's source, so I could not settle it.

## Previous findings

- The previous review, of `374b9ce`, raised no finding. The folder is identical at this head, so its remarks stand where they were and are carried above.
- C01 — not repaired: line 250 still reads "*Origin:* published: Jiang, Sun and Zhu (2010) and Sun and Zhu (2012), …".
- C02 — not repaired: lines 251–252 still credit Theorem 7.2.1 with "has rank at most one and is nonzero exactly when a Bessel functional exists".
- C03 — not repaired: line 2610 still gives "(2002), §§2, 4 (arXiv math/0204206): 5.18a".
- C04 — not repaired: lines 409, 472, 554, 940, 1352 and 2349 are unchanged.
- N01 — not repaired: line 858 still reads "*Sources:* ingredients (Gelfand–Graev multiplicity one)", and likewise the six other lines.
- The question on 5.22 (a) — open, restated above with what FiniteReductiveGroups §5.8 says.

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| Conventions, Labels and Corollaries paragraphs (lines 83–93) | the 29 sections | 29 `*Origin:*` and 29 `*Method…:*` lines for 29 headings `5.x`; `*Corollary of:*` only on lines 86, 93 | "every target carries both" true; corollary rule governs no section |
| 5.13b label (regularised form) | BeuzartPlessis2020 Lemma 6.5.1, §7.1, Lemma B.1.1 | found at text lines 5726, 6627, 11858; 6.5.1 is convergence of `∫Ξ·e^{εσ}`, B.1.1 an integral over a neighbourhood in `F^×` | locators exist; label says "adapted", with its changes |
| 5.13c label | BP Thm 7.2.1, Lemma 7.3.1; JSZ Thm A; SZ Thm B | 7.2.1: `L_π≠0 ⇔ m(π)≠0` only; 7.3.1: tempered, bound `Ξσ^d`; A: `dim Hom ≤ 1`; B: at most one-dimensional | C01, C02 |
| 5.13d label and (e) | BP Thm 12.4.1; Xue Thm 2.2 context; He Thm 0.1; `r_S=0,k=1` | 12.4.1: unique `π` with `m(π)=1` in the packets; He: discrete spectrum = interlacing parameters; threshold `max(5, 45.3, 192.33) = 192.33` | label accurate |
| 5.15a label (headline) | `S = S′ = {1}`, `V = ℂ` | `O(γ) = ⟨b, σ(γ)b′⟩`, `∫|O|² = ‖b‖²‖b′‖²/d = 1/d`: equality, the case the label calls published | consistent |
| 5.16 label (headline) | label against statement | both: relative error `exp(−c·nf log n)`, `c = 1/16`, gap and unipotent support at one prime | consistent; Savin (1989) not read |
| 5.17a label | `q = 3`, all `k` | `∏_{i≥1}(1 − 3^{−i})^{−1} = 1.7853 ≤ 1 + 3/3 = 2`; Method's `∏_{i<k}(q^i − 1)` equals the route's dimension bound | true |
| 5.17b, 5.17 labels | Method against routes | regrouping by cokernel class gives rank-one forms with weights `≥ 0`; mean over lattices glued along discriminant forms, mass of rank `k−1` | same routes |
| 5.18a label | Molev (2002) Thm 1.3; GKL (2002) | Thm 1.3: homomorphism `Y(m) → Y(n)` with qdet identity (1.28), called the quantum Sylvester analogue; GKL monodromy matrix in §6 | attribution right; C03 |
| 5.18d label | phase `Σ_{k≤d−1}x_k + D/∏x_k` | critical points `x_k = z`, `z^d = D`: `d` of them; Hessian `(I+J)/z`, `det = d·z^{−(d−1)}` | matches "the `d` critical points" and the route |
| 5.18b, 5.18c, 5.18e, 5.18 labels | Method against routes | top coefficient = frequency × slice, `2j+1` nodes; Markov on a long interval absorbs half the supremum; `r_S + 1` block units | same routes |
| 5.19, 5.20b label | Method against route | zero frequency of the Poisson step is an identity, so constant `1`; determinant in `g^{s−1}𝒪_E` with Hadamard bound gives powers of `2/g` | consistent |
| 5.22 (a), changed sentence | `k=1, r=2`; `g = 3, 5, 7` | split label: `(1−1/g)+2/g = 1+1/g ≤ (1+1/g)²` (1.33 ≤ 1.78 at `g=3`); `(1−1/g)(1−2/g) ≥ 1−3/g`; `Σ_{j≤k}c_jg^{−j} ≤ ∏(1+g^{−d_j})` | all true; question on attribution |
| 5.22, "the wider form of FiniteReductiveGroups §2.6 (c)" | that README at this head | §2.6 has a block "**Wider form** (published: Zelevinsky (1981) …) (c) For `G = GL_n(𝔽_q)`"; §5.8 (c) states both bounds and `3/q` | citation resolves and supports (a) |
| 5.23 label, (v)(1) | `H` trivial | group determinant of `u` is `u`; not a zero divisor, so both maps injective and `dim V ≤ dim V₂` | consistent; C04 |

- Source locators read at the text: 11 in 7 sources (BeuzartPlessis2020: Thm 7.2.1, Lemma 7.3.1, Lemma 6.5.1, §7.1, Lemma B.1.1, Thm 12.4.1; Xue2023 p. 1001; He2017 Thm 0.1; SunZhu2012 Thm B; JiangSunZhu2010 Thm A; Molev math/9811115 Thm 1.3; Gerasimov–Kharchev–Lebedev §§4, 6).
- Record against the merge base: one layer and 29 sections at both ends; 0 headings removed, retitled or added; no item deleted; no Lean declaration at either end.
- Cross-roadmap citations the change adds or alters, resolved: GanGrossPrasadUnitaryGroups §§1.2, 2.6, 3.9 (main); FiniteReductiveGroups §2.6 wider form (c), §2.7, §5.8 (c) (this head). No former tag (`KNOWN`, `NEW`) remains.
- The pull request's text against this head: 212 `*Corollary of:*` section lines in the pull request, as the description says; section numbers unchanged here; the description says the family's sections now carry the two labels, which holds for all 29. The family index's account of the Gram estimates agrees with the labels of 5.20 and 5.21.
- Changes outside the folder: all in folders named as the pull request's own (roadmap folders and the two family indexes).
- Automatic checks: all passed in the worker's run. Dependency check, run again: `depcheck: 124 roadmaps, 1387 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with no messages. The file opens a namespace and declares nothing, so there is no signature to compare and no one-tactic probe to run; its docstring names the three headlines (5.15a, 5.16, 5.20–5.21) as not statable and what each lacks.
- Overlap check: read RowTowerAndRallisIdentities, SeesawForThetaChains, ThetaChainsAndFrobeniusPrimeSums, ThetaChainsOnDefiniteUnitaryGroups and GanGrossPrasadUnitaryGroups (main), FiniteReductiveGroups (this pull request); nothing shared: the change adds labels and citations, no object. No other open pull request changes this roadmap or drops an id it cites.

Source independence: changed passages only; 9 passages (the labels of 5.13b, 5.13c, 5.13d, 5.15a, 5.18a, 5.22 and three Method labels) compared with 7 sources, none shared beyond standard names; largest share [FormalProof], Lean-file locators, about four fifths of all; contents not compared, since no layer is added, removed or reordered, and [FormalProof] was not read.

Research link: 5.13c–5.13d make explicit, for gapped discrete series, the archimedean uniqueness and existence of Bessel models (Jiang–Sun–Zhu 2010, Sun–Zhu 2012, Beuzart-Plessis 2020, Xue 2023, He 2017); 5.16 is a uniform limit multiplicity (DeGeorge–Wallach 1978, Savin 1989); the Gram bounds feed Alpöge's formal proof of GRH for Dirichlet L-functions (2026). README References and the sources read.

## Not verifiable

- Muić (2009), Petersson (1930), Gelfand–Graev (1962), Siegel (1935), Shimura (1997), Savin (1989), DeGeorge–Wallach (1978), Clozel (1986), Krob–Leclerc (1995), Zuckerman (1977): cited in the new labels or References, not opened this round (paywalled or no open copy recorded).
- Kobayashi–Speh (2025), Harris–Kobayashi–Speh (2025), Ichino–Lapid–Mao (2017), Beuzart-Plessis (2018): cited in the labels of 5.13c, 5.13d and 5.15a; not reopened this round.
- [FormalProof], the Lean source: the Method labels were checked against the routes in the README and the cited supplier sections, not against that source.

## Source issues

- none

## For the human reviewers

- Scope: 16 of the 29 sections are labelled particular to [FormalProof], and every Method label describes it. It is a Lean formalisation announced on 20 November 2026 (README References), not a refereed publication.
- Licence: the family index says the formal proof was published without a licence. The Method labels paraphrase its arguments section by section (README 5.13a–5.23).
- Not tested: [FormalProof], the source with the largest share of locators, is Lean code. The wording and arrangement checks were not run against it.
