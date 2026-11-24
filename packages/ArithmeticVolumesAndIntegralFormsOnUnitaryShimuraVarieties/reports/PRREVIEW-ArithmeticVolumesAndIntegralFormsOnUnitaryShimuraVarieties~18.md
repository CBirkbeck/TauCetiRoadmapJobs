# Review of ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties (pull request #3027 at 374b9ce)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties/`
**Verdict:** accepted

**Summary.** An incremental re-review of the 34 lines changed since `644c332`: the rewritten paragraph on corollaries in the Conventions, the attribution to Yuan in 8.14a, and the new `*Sources:*` lines of 8.14c, 8.18b and 8.19a‴. Each was read against its source (Yuan's Lemma 2.4 and Theorems 2.6, 2.9; the five declarations of the formal proof, opened and compared with the statements) and is correct; the previous review's remarks on 8.14a, on the description and on the three sections are repaired. There is no finding. Accepted with one small correction and one format note, both carried over and neither blocking; two facts are left for the human reviewers.

## C01 — 8.17a still names no declaration of the formal proof, although the Conventions say it has a statement of every section

The **Labels** paragraph (line 114) says "[FormalProof] has a statement of each section". After this change 8.14c, 8.18b and 8.19a‴ name theirs; 8.17a is now the one section seen whose `*Sources:*` line (after the route, "the basis problem through the doubling method") names neither a file nor a declaration, so a reader cannot find the form the proof has.

A declaration with the matching name exists: `GlobalTheory.T.cuspForms_le_span_shortThetaSeries` in `Development/AbelianVarietyTheory/Proofs/SiegelThetaTransformation/CuspFormsLeSpanShortThetaSeriesStatement.lean`, and the kernel export of the proof has that name. Its statement is in the proof's own carriers (it concludes a spanning statement at dominant weights, under one named statement taken as a hypothesis) and I did not compare it clause by clause with 8.17a. If it is the statement meant, a `*Sources:*` entry naming it, with what it assumes, would close this.

## N01 — Where `*KNOWN*` and `*NEW*` became `*Sources:*`, the qualifiers they carried still read as if they were sources

Carried over; the text is unchanged. "*Sources:* (this form; …" in 8.14 (line 522), "(statement; …" in 8.14a and 8.14b (lines 588, 653), "*Sources:* ingredients (…" in 8.13, 8.18, 8.18c, 8.18e and 8.19a′ (lines 410, 1395, 1744, 1845, 2459). Dropping "this form;", "statement;" and "ingredients" would fix these.

## Deferred findings

- D01 — resolved: the description's shared-folder list now has the line for this folder, #3036 before this pull request.

## Previous findings

The previous report had no finding (no R01); its small corrections and format note are accounted for here.

- C01 — repaired: 8.14a (lines 543–545, 550) now gives Yuan's identity `h(A/G) = h(A) − (ℓ − 1)·deg Lie(G)` for a height-one `G` on a curve, and the bound for the largest-degree sub-bundle over `ℙ¹` only.
- C02 — repaired: the description's list of statements that were wrong on `main` now has the bullet on §8.16 (d), saying the formal proof does show the convergence.
- C03 — partly repaired: 8.14c, 8.18b and 8.19a‴ now carry `*Sources:*` lines naming the declarations, each correct as described; 8.17a still names none (C01 above).
- C04 — repaired outside the folder (D01): the shared-folder list of the description names this folder.
- N01 — not repaired: the qualifiers stand as before (N01 above).

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| Conventions, corollaries (lines 117–124) | the one `*Corollary of:*` line, 8.5 | 8.5's route deduces (a) from ComplexMultiplicationAndExplicitReciprocityPartII §4.6; its `*Needs:*` (line 199) names that roadmap; method label gives the proof's analytic route | paragraph agrees with 8.5 and with the family index | none |
| 8.14a origin and method labels vs Yuan | Thm 2.9 (2), Lemma 2.4, Thm 2.6 (arXiv v1) | Yuan: `h(B) = h(A) − (p−1)·deg Lie(G)` on a smooth projective curve; `gnef` closed under `p`-power for `S = ℙ¹`; `h ≥ 0`. README: same, `(ℓ−1)m₀ ≤ deg ω` over `ℙ¹`; own route `(ℓ−2)m₀ ≤ e`, weaker by `m₀` | attribution exact | none |
| 8.14c vs `AntisymDivisible.Statement`, `AntisymPerturbation.Statement` | `|Φ| = 1`, `N = 2`, `j = p = 1`; `v = 0`; `ε = 0` | formal degree `|T|·C(N,2) + 1 = 2 = D + 1`; `Δ = x₀ − x₁`; `v = 0`: coefficients of `P − Δl` at most `Cε`, the README form; `ε = 0`: `P − vh = Δl` | lines as described; formal needs `0 < j < N`, README `0 < p < N` | none |
| 8.18b vs `IdxPsiGood`, `LemmaGG` | `P = U = 1` (`u = δ = 1`) | formal bound `(E − v(σ) + v(u))·dim(Z_ψ ∩ V₀) + (r + dim Z·v(u))/δ` becomes `(E − v(σ))·dim Z_g + r`, the README's; `LemmaGG` reads `idx ≤ idx` | equal; the two assumed inequalities are as the line says | none |
| 8.19a‴ vs `QuotCoreStatement`, `GlobalQuotStatement` | `ρ = 0, 1, 2` | formal `ρ(B_θ + C_arch + B_deg) + (ρ/2)·log ρ`; README `ρ(… + ½·log ρ)`: 0; `B_θ + C_arch + B_deg`; `2(…) + 0.693` on both sides; `LenDescentStatement` is the first hypothesis | equal | none |
| 8.17a (C01) | declaration by name | file and name present, name in the kernel export; statement not compared | no `*Sources:*` entry | C01 |

The rows of the previous review for the untouched statements stand as in that review, of `644c332`.

- Source locators checked against the text: Yuan2021 lines 673–675 (Lemma 2.4), 767–769 (Theorem 2.6), 822–832 (Theorem 2.9), 875–880; four files and seven declarations of [FormalProof] opened and their statements compared.
- The seven cited names (and that of 8.17a) are in the kernel export of the proof's five main theorems, as the description requires of a statement of the proof.
- Cross-roadmap citations resolved: ComplexMultiplicationAndExplicitReciprocityPartII §4.6 on `main` (line 616, the imaginary quadratic average). The list of citations found nowhere is empty of cross-roadmap entries.
- The family's index page states the same convention on corollaries as the new paragraph; 212 `*Corollary of:*` lines in the family, the description's count.
- Record: no heading, layer, statement or Lean declaration removed since `644c332` or against `main` (0 headings removed, 0 declarations changed). Nothing changed outside the pull request's own folders.
- Automatic checks: all passed. Dependency check: `depcheck: 132 roadmaps, 1489 edges, 0 problem(s)`.
- Elaboration of `Suggested.lean`: only the `sorry` warning (line 68). The file is unchanged; the elaborated types of `logPeriod` and `chowlaSelberg_classMean` were read again against 8.5 (a) and nothing changed.
- Description read against this head: its paragraph on general theorems and the 8.16 (d) bullet agree with the head; the change adds or drops no section, declaration or supplier.

Overlap check: read HeightsForLogSingularMetrics, GluedTargetAndDivisionInequality and ProjectiveModelsAndPeriodBoundsOnShimuraVarieties (on `main`) as in the previous review, and this folder's place in #3036 (two `*Needs:*` lines, ordered before this pull request in the description); the list by results named is empty. The change adds no object; nothing shared.

Source independence: changed passages only. 5 passages (the Conventions paragraph, the two labels of 8.14a, the `*Sources:*` lines of 8.14c, 8.18b, 8.19a‴) compared with 2 sources (Yuan2021 and the Lean source of [FormalProof]), none shared beyond the formula of Theorem 2.9 (2), which the mathematics forces; largest share [FormalProof], 110 cited files against at most 5 locators for any published source. Arrangement not compared: the change adds, removes or reorders no layer.

Research link: 8.5 is the Chowla–Selberg formula (Chowla–Selberg 1967), read as a Faltings height (Colmez 1993). 8.14–8.19 bring Bost's slope method (Bost 1996), arithmetic Hilbert–Samuel and successive minima (Gillet–Soulé 1992, Zhang 1995, Bost–Gillet–Soulé 1994) and Mumford's proportionality (1977) to unitary Shimura varieties. Rests on the README's References.

## Not verifiable

- 8.17a against `GlobalTheory.T.cuspForms_le_span_shortThetaSeries`: the statement is in the proof's own carriers and was not compared clause by clause.
- Yuan's published version (Compositio Math. 157, 2021): not opened; the README cites the numbering of arXiv:1808.03960, which is the version read.
- Goldstein (1981–1982), Böcherer (2006), Weissauer (1986), Katz (1976, 1978): no legal copy found in earlier rounds; not retried, and no changed passage cites them.

## Source issues

- none

## For the human reviewers

- Scope: of the 30 sections, 15 are labelled "particular to this proof", 14 "adapted from" and one (8.5) "published". The proof is the formal proof of GRH for Dirichlet L-functions announced on 20 November 2026 (README References), which has not been refereed.
- Licence: the repository of [FormalProof] carries no licence. The README cites its file paths and declaration names only and copies no code; whether citing it in this way needs anything more is for a human to read.
