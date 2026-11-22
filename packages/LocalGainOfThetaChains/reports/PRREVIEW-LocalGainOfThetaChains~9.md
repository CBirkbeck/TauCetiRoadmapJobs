# Review of LocalGainOfThetaChains (pull request #2915 at 513e0b8)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/LocalGainOfThetaChains/`
**Verdict:** accepted

**Summary.** Accepted: the one finding of the previous review is repaired (the Summary now puts in `Drop` only the primes `p ≥ p₀` with a power in the band, as 4.17 (b) does), and so are its four small corrections and its format note; I checked each repair against 4.17, against a recomputation, or against the formal proof, and none introduces a new problem. This was an incremental re-review of the 24 lines changed since `288fa8c`. There is one format note, not blocking; the scope and licence of the single source remain for the human reviewers.

## N01 — The *Needs* line of 4.15e′ still lists 4.15, which the target no longer cites

The ring `𝒪` of the plane count is now described in 4.15e′ itself (line 1408) and no longer taken from 4.15, whose subject is the depth property; nothing else in the statement or the route of 4.15e′ uses 4.15. The line (1450) would read "*Needs:* 4.14c, 4.15d" if the item was there only for the ring.

## Previous findings

- R01 — repaired: "`Drop` contains every prime inert in `K` and in `ℚ(√−q)` below `(1 + ρ_B)X′` that has short orbits or that is at least `p₀` and has a power in the band" (line 5); agrees with 4.17 (a), (b).

The small corrections and the format note of the previous report, at this head:

- C01 (the ring of 4.15e′) — repaired: 4.15e′ states `𝒪` as a complete discrete valuation ring, finite over `W(𝔽_{p^{n′}})`, with `w² = p` and residue field of `p^{2n′}` elements, and `n′ ≥ 2` even; these are the clauses of `Formalism.MainNotions.G.UnramifiedQuadraticSetting`.
- C02 (`q` in the Route of 4.15d) — repaired: "With `q` this lower bound for the probability that a tile is marked", with `q ≤ 4^{−3r} ≤ 1/2`.
- C03 (the hypotheses `AdmB` in the note of 4.15e′) — repaired: the note lists the frames of a good orbit, the classical facts on `GL_k`, the laws of the type bounds, the statements on paths and the description of the segment spaces.
- C04 (the description and #2954) — repaired: the description says that #2954 carries this folder, following this head, and the five family suppliers that have no pull request of their own.
- N01 (clause letters of 4.9e, 4.9f) — repaired: 4.9e (lines 323–324) says which of (a)–(h) stand in 4.9, 4.9e and 4.9f.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| Summary, `Drop` against 4.17 (a)–(e) | `p < p₀`, split type, long orbit, power in band, `𝔖(p) ≤ x^{−ε}`; `p ≥ p₀` with a power in band | Summary: not in `Drop`; in `Drop`. 4.17: (b) needs `p₀ ≤ p`, so not in `Drop`; in `Drop` by (b) | agree | none |
| Table of symbols, `𝒫_band` against 4.17c | definition | table: primes `p₀ ≤ p < X′` with a power in the band; 4.17c (line 1849): the same set | agree | none |
| 4.9e, sentence on the clause letters | each letter located | (a) line 145 in 4.9; (b), (c), (f) lines 326, 344, 349 in 4.9e; (d), (e), (g), (h) lines 380, 406, 439, 442 in 4.9f | true | none |
| 4.15d, Route (B): `q ≤ 4^{−3r}` | `u = ⌈1/δ⌉` over `δ = i/10⁵`, `0 < δ < 1` (so `u ≥ 2`); `u = 2, 3` | max of `uδ(1−δ)^{u−1}` is `0.5` (at `δ = 1/2`); `u = 3`: `≤ 4/9`; so `q ≤ (⌊u/2⌋δ(1−δ)^{u−1})^{3r} ≤ 4^{−3r}` | holds | none |
| 4.15d, `(1−q)^{M₀−1} ≤ 2(1−q)^{M₀}` | `q = 1/2`; `q = 4^{−6}` | `1/(1−q) = 2`; `1.00024`; both `≤ 2` | holds | none |
| 4.15e′, the ring `𝒪` against `UnramifiedQuadraticSetting` | clauses; `p = 13`, `n′ = 2`, integer `2` | formal: `5 ≤ p`, `n′` even `≥ 2`, `W` complete with uniformiser `p` and `p^{n′}` residues, `𝒪` finite over `W`, complete, `w² = p`, `w` irreducible, `p^{2n′}` residues, integers squares; README the same with `p ≥ 13` | matches | none |
| 4.15e′, "every integer is then a square" | `z = 2·13`, `p = 13` | `2` is a non-square in `𝔽_13`, a square in `𝔽_{13²} ⊂ 𝔽_{13⁴}`, lifts by Hensel (`p` odd); `13 = w²`; `−1 ∈ 𝔽_p` likewise | consequence, as stated | none |
| 4.15e′, statement against `SelectionLemmas.Conclusion2` | hypotheses and (a) | formal: the setting, `13 ≤ p`, `2 ≤ r`; rank `≥ (p^{n′})^{−rK}·bound` and `≥ bound/nPl 𝔽 (r+K) r`, `|𝔽| = p^{n′}`; README the same | matches | none |
| 4.15e′, note on `AdmB` | the thirteen clauses | frames from a good orbit (1); type-bound laws (2); Weyl, branching, two Pieri sums, `|𝔽|^{r(k−r)} ≤ #planes` for `r ≤ k` (4); five on paths and standard polynomials; segment spaces (1) | description accurate | none |
| Pull request text against the head | each sentence | folder at the head of #2954 identical to this head (README compared, no difference); validation sentence equals my run of the checks | agree | none |

The rows of the previous review, of `288fa8c`, for the statements this change does not touch stand as written there.

- Source locators checked against the text: the two paths and three declaration names the change adds or relies on (`UnramifiedQuadraticSetting.lean` with `HidaSetting` and `UnramifiedQuadraticSetting`; `ValuationLowestDegreeRename.lean` with `Conclusion2` and `AdmB`), read in the operator's copy of [FormalProof]; of the seeded sample, 4.9e, 4.15d, 4.15e′ and 4.17 fall in the changed passages and were read there.
- Library declarations opened at the pins: none needed; the change touches no library name.
- Cross-roadmap citations resolved: the change adds none; StandardDistributions §9.4 and §7.13 in the changed sentence of 4.15d are as in the previous review.
- Dependency check: `depcheck: 133 roadmaps, 1486 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks, run again on this head: all pass except two that are not defects of the folder: the three files of the family index count as outside the folder (they are the pull request's own), and the roadmap is not yet placed in the merge order.
- Lean: `Suggested.lean` is unchanged and elaborates with no message; it declares nothing, so there is no signature to compare and nothing for the one-tactic probe. The four headlines are named in its docstring with the carriers they lack.
- Nothing is changed outside the folder except the three files of the family index, which this change does not touch.

Overlap check: read ThetaChainsAndFrobeniusPrimeSums, ThetaChainsOnDefiniteUnitaryGroups, GluedTargetAndDivisionInequality, CongruenceModulesOfThetaLifts and RowTowerAndRallisIdentities (the list for main is empty); nothing shared. The change adds no object and no layer.

Source independence: changed passages only; 6 passages compared with 1 source ([FormalProof], Lean statements without prose), none shared beyond declaration names; largest share [FormalProof], 60 distinct file paths against one other locator (Jantzen II.5–II.6); contents: the change adds, removes and reorders no layer, so the arrangement was not compared again (independent in the previous review).

Research link: Layer 4 is the gain at inert primes of the chains of theta lifts in Alpöge's formal proof of the Riemann hypothesis for Dirichlet L-functions (announced 2026); the README places it beside Gross (1999) on algebraic modular forms, Hida's normalisation and Bannai–Kobayashi (2010). Basis: the README's References and the family index.

## Not verifiable

- 4.15e′: the five clauses of `AdmB` that are defined in other files (`HyperplaneRank`, `ValuationLemmaField`, `DefiniteRankOne`, `RotatedSumBound`, `ConclusionB3`) were opened for the first two only; the note's description of them was not compared clause by clause for the other three.
- The items the previous review could not verify (the application with `Q = p^{G′}` in 4.15e, the clauses behind 4.15f, 4.10 and 4.9d, the statements of most "proved as" declarations) are untouched and stand as listed there.

Automatic checks set aside as false positives: the listing of elaborated signatures and of library near-matches reads the word after "class" in the module docstring of `Suggested.lean` ("class sets") as a declaration named `sets`, and so reports a failed elaboration; the file declares nothing and elaborates cleanly. The search for citations found nowhere lists the family suppliers that have no pull request of their own (they are at the head of #2954) and the declarations of the formal proof, which are source locators and not library names.

## Source issues

- none

## For the human reviewers

- Scope: every *NEW* target rests on [FormalProof], a Lean development announced on 20 November 2026 with no refereed paper; the published works in References carry no locators except Jantzen II.5–II.6.
- Licence: the family index (`TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/README.md`, lines 13–19) says the proof belongs to its author and was published without a licence; the README cites its file paths and declaration names, and no text of it.
- Merging: this folder is carried, with the same README as at this head, by #2954, which says it merges the family in one piece; five family suppliers exist only there. Which pull request merges the folder is for the operators.
