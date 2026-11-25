# Review of BesselPoincareSeriesAndGramBounds (pull request #3027 at f0da4ff)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/BesselPoincareSeriesAndGramBounds/`
**Verdict:** accepted

**Summary.** An incremental re-review of the 72 lines changed since `c40f181`: the credits to the formal proof in 5.13c, 5.18a, 5.18b, 5.18d and 5.20b, the published comparisons for 5.16 (Shin–Templier, Dalal), the inputs of the class-number count of 5.16a and the sentence on `q² ≤ n` in 5.16b. Every declaration and file named was opened in the formal proof's source, the two papers were read at the cited theorems, and the count of 5.16a was recomputed; no sentence is false. Accepted, with one small correction and one format note, none blocking; the standing and licence of the formal proof remain for the human reviewers.

## C01 — In the Origin label of 5.16, "constants … not made explicit" is true of the implied constants only

The label (lines 809–810) says that Shin–Templier and Dalal have error terms "with constants that depend on the group in a way not made explicit". Shin and Templier say, after each of the two theorems cited, that the exponents of their error terms can be chosen explicitly, with the saving exponent at least an explicit invariant of the group (arXiv:1208.1945v3, Remarks 9.18 and 9.21, its text lines 3894 and 3965); what is left inexplicit is the constant implied by `O(·)` (lines 3890 and 3960), and in Dalal's Theorem 9.1.1 the saving exponent is `1` (arXiv:1910.10800v2, its text line 3219). A reader would take the sentence to cover the exponents as well. "with implied constants that depend on the group in a way not made explicit" says what the sources support.

## N01 — Six `*Sources:*` lines keep the words "ingredients" and "frameworks" from the former tags

Carried from the previous two reviews: lines 957, 1240, 1349, 1398, 1603 and 1699 (for example "*Sources:* ingredients (Gelfand–Graev multiplicity one)"). Drop the leftover word, or fold the parenthesis into the Origin label.

## Questions for the author

- 5.22 (a): the list of this roadmap's own statements gives `wt_v(𝔣) ≤ ∏_j(1 + g^{−d_j})·wt_GG(𝔣)` and the form of [FormalProof] as `(1 + 1/g)^r·wt_GG(𝔣)`, while the Method label of FiniteReductiveGroups §5.8 credits the formal proof with `Σ_j c_jq^{−j} ≤ ∏_l(1 + q^{−d_l})`. Which of the two does the formal proof have? Both are true and nothing uses either; the passage is untouched by this change and I did not look for the declaration.

## Previous findings

- The previous review, of `c40f181`, raised no finding (no R-numbered remark). Its small corrections, format note and question:
- C01 — repaired: the description now says "step (b) of the route of 5.16 sets the threshold … at `τ* = (nf·rd_E·g_ϕ·b)^{−11q_V}`, where `main` had the exponent `−Cq_V`".
- C02 — repaired: the `*Needs:*` line of 5.16a names Mathlib `NumberField.exists_ideal_in_class_of_norm_le` and AnalyticNumberTheoryPartI §2.15a, with the count `Σ_{m≤x}τ_d(m) ≤ x(1 + log x)^{d−1}`; both are in the supplier contracts.
- C03 — repaired: 5.16b now has "The condition `q² ≤ n` is that of [FormalProof]; the route below does not use it."
- N01 — not repaired: line 957 still reads "*Sources:* ingredients (Gelfand–Graev multiplicity one)", and likewise five other lines; written again above.
- The question on 5.22 (a) — open, written again above.

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| 5.16a `*Needs:*`: `Σ_{m≤x}τ_d(m) ≤ x(1 + log x)^{d−1}` | `Σ_{m≤x}τ_d(m) = Σ_{a≤x}τ_{d−1}(a)⌊x/a⌋`; `d = 2`, `x = 4` | `≤ x(Σ_{a≤x}1/a)^{d−1}`; `d = 2, x = 4`: `8 ≤ 4(1 + log 4) ≈ 9.55` | true |
| 5.16a: Minkowski's bound `≤ √|d_E|` | `(4/π)^f(2f)!/(2f)^{2f}`, `f = 1, 2` | `0.637`, `0.152`; decreasing in `f` | at most `1`: true |
| 5.16a: `h_E ≤ rd_E^f(1 + f log rd_E)^{2f−1}` | `x = √|d_E| = rd_E^f`, `d = 2f` | `log x = f·log rd_E`; exponent `2f − 1`, below the Method's `2f` | consistent with the Method label and the statement |
| 5.16a: scale ideals `𝔫 = 𝔞𝒪_E`, `N𝔞 ≤ rd_E^f` | `N_E(𝔞𝒪_E) = N_F(𝔞)²`, `d = f` | `N𝔫 ≤ rd^{2f}` iff `N𝔞 ≤ rd^f`; count `≤ rd^f(1 + f log rd)^{f−1}` | within the Method's `rd^f(1 + f log rd)^f` |
| 5.16a: `f ≥ 2` | `F = ℚ`, `E` imaginary quadratic | `|d_E| ≥ 3`, so some finite prime ramifies; §2.15a needs `d > 1` | the case `d = f` is in range |
| AnalyticNumberTheoryPartI §2.15a as cited | its text at this head (line 1588) and on main (line 1488) | `0 ≤ a_K(n) ≤ d_d(n)`, ramified primes included, `d > 1` | states what the contract says; on main |
| Mathlib lemma in the contracts | `Mathlib/NumberTheory/NumberField/ClassNumber.lean` line 78 | norm `≤ M K = (4/π)^{r₂}·(n!/nⁿ)·√|d_K|` | as glossed |
| 5.13c credit, `ThmM` | `StDiagExists.lean` line 151; `aM = 4·nR³`, `nR = 2r + k + 1` (`StDefs.lean` lines 31–33) | README `r = p + q_S = 2r_S + k + 1`: `a ≥ 4r³`; domain `Vfl` = vectors with coefficient against `w` of decay `a` | gloss right |
| 5.13c credit, `RankOneG` | `IsDSOfIsDG.lean` line 31 | `∀ w v ∈ R.sm`, character `cStd`, `R.IsDG` = discrete series with `GapOK` (`120n³ ≤ h` and two bounds on `a(h)`) | gloss right |
| 5.13c credit, `UniqGap` | `UniqGapOfUniq.lean` line 17 | `120·(2r + k + 1)³ ≤ h`, `psiGen` with all `c_a ≠ 0`, two Bessel maps dependent on smooth vectors | gloss right |
| 5.13c, `BesselUniquenessReal` | `BesselFormsTrivialNeBot.lean` line 136; kernel export of the main theorems | `σ` irreducible unitary, `π₀` finite-dimensional irreducible, rank `≤ 1`; the name is absent from the export | "contains the case of this section" and "do not depend on it" right |
| 5.18a credit | `StatementQ.lean` lines 773, 784; `InvariantOperatorUnderJacquet.lean` lines 71, 77 | `detCore : DetAt (last level)`; `DetLevel` = all levels, proved (`determinant_identity_all_levels`), absent from the export | right |
| 5.18b credit | `HerGenC.lean` line 63; `CutSETopFinal.lean` line 14; `CompositeFormulaLevelZero.lean` lines 377, 395 | `actual_compact_theorem : ThmPActualCpt`; every theorem with conclusion `ThmPActual` takes hypotheses; absent from the export; statement (e) is for compactly supported `F` | right |
| 5.18d credit | `PBBLiftV.lean` line 20; `BlockOfCauchySchwarz.lean` lines 146, 168, 181 | `block_schur2`: `‖Σ κw∏w‖ ≤ (Σκa∏a + Σκb∏b)/2` for block-PSD kernels; the three `PBA` theorems exist | right |
| 5.20b credit | `LoopEvaluationThresholdZero.lean` line 44; `LoopRowSOf.lean` lines 126, 137, 140 | conclusion under `Cnt.Hyp`; `loopRowS_of_raised` concludes `LoopRowS` and calls `loop_evaluation_threshold_zero` | right |
| 5.16 Origin, Shin–Templier | arXiv:1208.1945v3, Theorems 9.16 (line 3882), 9.19 (line 3954) | level aspect `O(q^{A+Bκ}N(𝔫)^{−C})`, weight aspect `O(q^{A+Bκ}m(ξ)^{−C})`, `G` fixed, packets | as described; C01 on "constants" |
| 5.16 Origin, Dalal | arXiv:1910.10800v2, Theorem 9.1.1 (line 3212) | weight aspect, a sequence of single discrete series `π_k`, error `O(q^{A+Bκ}m(ξ_k)^{−1})` | as described; no level aspect there |

The rows for untouched statements stand as in the previous review, of `c40f181`.

- Source locators read at the text this round: 3 theorems in 2 papers (Shin–Templier 9.16, 9.19; Dalal 9.1.1), both fetched from arXiv in the versions the README names; the journal data (Invent. Math. 203, Algebra Number Theory 16) were not checked against a register.
- Formal-proof locators opened: 17 declarations in 13 files, all present at the first commit of the repository; 3 further names (`BesselUniquenessReal`, `DetLevel`, `ThmPActual`) confirmed outside the dependency closure of the main theorems.
- Seeded sample within the changed passages: 5.13c, 5.16a, 5.18d and 5.20b (rows above; in 5.18d and 5.20b only the credits changed); the other sampled targets are untouched.
- Library declarations opened at the pin: 1 (`NumberField.exists_ideal_in_class_of_norm_le`, `Mathlib/NumberTheory/NumberField/ClassNumber.lean` line 78).
- Cross-roadmap citations resolved: 1 new (AnalyticNumberTheoryPartI §2.15a, at this head and on main); the Dependencies paragraph, the scope paragraph and the contracts name it consistently.
- Record against the merge base: one layer at both ends; 0 headings removed, 2 added (5.16a, 5.16b); no heading and no Lean declaration changed since `c40f181`.
- The pull request's text: states the exponent `11q_V` and the new inputs of 5.16a; its general sentence on results the source states and the main theorems do not use covers the new credits. The family index agrees with 5.13c on the uniqueness of Bessel models. Nothing to correct.
- Automatic checks: all passed in the worker's run. Dependency check, run again: `depcheck: 119 roadmaps, 1375 edges, 0 problem(s)`; no UPWARD or CYCLE line. Elaboration: `lake env lean` on `Suggested.lean` exits with no message; the file is unchanged, declares nothing and names the three headlines (5.15a, 5.16, 5.20–5.21) as not statable, so there is no one-tactic probe to run.

Overlap check: read RowTowerAndRallisIdentities, SeesawForThetaChains, ThetaChainsAndFrobeniusPrimeSums and ThetaChainsOnDefiniteUnitaryGroups (main); nothing shared. The change adds no object; the ideal count it now uses is owned by AnalyticNumberTheoryPartI §2.15a and cited. No other open pull request changes this roadmap or drops an id it cites.

Source independence: changed passages only; 8 passages (the Origin sentence of 5.16 and seven credit glosses) compared with 3 sources (Shin–Templier, Dalal, [FormalProof]), none shared; largest share [FormalProof], Lean-file locators, about four fifths of all; contents not compared, since no layer is added, removed or reordered.

Research link: 5.13c–5.13d make explicit, for gapped discrete series, the archimedean uniqueness and existence of Bessel models (Jiang–Sun–Zhu 2010, Sun–Zhu 2012, Beuzart-Plessis 2020, Xue 2023, He 2017); 5.16 is a uniform limit multiplicity (DeGeorge–Wallach 1978, Savin 1989, Shin–Templier 2016, Dalal 2022); the Gram bounds feed Alpöge's formal proof of GRH for Dirichlet L-functions (2026). README References and the sources read.

## Not verifiable

- Jacquet and Ye (1999), Petersson (1930) and Muić (2009): as in the previous reviews, not opened (untouched by this change).
- The published versions of Shin–Templier and Dalal: read only in the arXiv versions whose numbering the README cites.

## Source issues

- none

## For the human reviewers

- Scope: 18 of the 31 sections are labelled particular to [FormalProof], and every Method label describes it. It is a Lean formalisation announced on 20 November 2026 (README References), not a refereed publication.
- Licence: the family index says the formal proof was published without a licence. The Method labels paraphrase its arguments section by section (README 5.13a–5.23); the credits now also name the theorems that prove each cited statement.
- Not tested: [FormalProof], the source with the largest share of locators, is Lean code. Its declarations were opened for the changed credits; the wording and arrangement checks were not run against it.
- Decisions of the human reviewers: neither is engaged by this folder; no section leaves it and none is renumbered.
