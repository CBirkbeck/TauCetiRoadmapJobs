# Review of TraceInequalitiesAndQuantumEntropy (pull request #2975 at 0c9fa0c)

**Verdict:** accepted

**Summary.** Accepted: no finding. This is an incremental re-review of the 100 lines changed since `121a07a`; the previous review had no finding, and its three small corrections and three format notes are all applied correctly: the rectangular characteristic-polynomial lemma is the one named, Section 2.4 of OperatorMonotoneFunctionsAndMatrixMeans is cited for the concavity of `t^r`, and the monotonicity of mutual information is stated without the trace hypothesis, which was recomputed and holds. There is one format note, not blocking. Five of the seven cited books still could not be read, which is reported to the human reviewers.

## N01 — The scope sentence on trace superadditivity names neither hypotheses nor an owner

In Scope and ownership (line 724), "Trace superadditivity `Tr f(A) + Tr f(B) ≤ Tr f(A + B)` is not a target here either" shows a formula that holds only under hypotheses it does not give (for instance `f` convex on `[0, ∞)` with `f(0) ≤ 0` and `A`, `B` positive semidefinite). Adding those words would keep a reader from taking the bare formula for a general fact.

## Previous findings

The previous report (of `121a07a`) was an acceptance with no finding; its small corrections and format notes are accounted for here.

- C01 — repaired: 4.1 (line 525), the Mathlib contract (line 765) and the `#check` list name `Matrix.charpoly_mul_comm'`, with `t^|κ| χ_{X Xᴴ}(t) = t^|ι| χ_{Xᴴ X}(t)`, which is the pinned statement at `A = X`, `B = Xᴴ`.
- C02 — repaired: the route of 2.2, its *Needs:* line, the Dependencies of Layer 2, the supplier contract and the description cite Section 2.4 (monotone iff concave on the half-line) beside Section 2.6.
- C03 — repaired: `mutualInformation_kraus_le` has no trace hypothesis; the README bullet and the docstring say "for every positive semidefinite `ρ`; the trace is not used".
- N01 — repaired: the module docstring names the compound calculus of 5.1 and Araki's log-majorization of 5.3 as lacking a carrier, with the owner of each.
- N02 — repaired: no sentence about Tau Ceti "beyond the pin" remains in Scope and ownership or in Prior formalization.
- N03 — repaired: References gives the arXiv numbering (Prop 8.3.3, p. 125; Prop 8.3.5, p. 126; Def 8.6.1 with (8.6.1), p. 134), each confirmed in the arXiv text.

## Verified sound

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| 3.4 `mutualInformation_kraus_le` without trace hypothesis | `ρ = 10·` projector on `(e₁⊗e₁ + e₂⊗e₂)/√2`, dephasing on the second factor | before `20 log 2 − 10 log 10 = −9.163`; after `10 log 2 − 10 log 10 = −16.094` | true; difference `10 log 2 ≥ 0` | none |
| same, commuting family | 20000 random unnormalised diagonal `ρ` (traces `10⁻³` to `10²`, zeros included), random stochastic channels, sizes 1–4 | minimum of (before − after)/max(1, Tr ρ) is `−3.1e−15` | true | none |
| same, route | `D(aρ ‖ bσ) = a·D(ρ ‖ σ) + a·Tr ρ·log(a/b)`; channel preserves `Tr ρ` | extra term equal on both sides, so 3.2 for unnormalised pairs reduces to densities; `ρ'_A = ρ_A`, `ρ'_B = Φ(ρ_B)` | route sound | none |
| 4.1 halves, equal nonzero spectra | pinned `charpoly_mul_comm'` at `A = X : ι × κ`, `B = Xᴴ` | `X^card κ · (X Xᴴ).charpoly = X^card ι · (Xᴴ X).charpoly`; README: `t^|κ| χ_{X Xᴴ} = t^|ι| χ_{Xᴴ X}` | agree | none |
| 2.2 Lieb route, concavity of `t^p`, `t^r` | supplier 2.6: monotone iff `0 ≤ r ≤ 1`; supplier 2.4: continuous `f : [0,∞) → [0,∞)` monotone iff concave; `p = 0` | `−t^p` convex for `p ∈ (0, 1]`; `p = 0` gives constant `−1` | cited sections state what is used | none |
| Scope: trace superadditivity | `f = t²`, `A = B = 1` (1×1); `f = 1` | `1 + 1 ≤ 4`; `1 + 1 > 1` | needs `f(0) ≤ 0` | N01 |

The rows of the previous review for the untouched statements stand as in the previous review, of `121a07a`.

- Source locators checked against the text: 4 in Tropp's arXiv version (tropp2015 line 5765, line 5777, line 5796, lines 6229 and 6237; printed pages 125, 126, 134 from the running heads at lines 5752, 5791, 6225), all as the README now gives them.
- Library declarations opened at the pin: `Matrix.charpoly_mul_comm'` (`Mathlib/LinearAlgebra/Matrix/Charpoly/Basic.lean`, line 249) and `Matrix.charpoly_mul_comm` (line 279); `Matrix.vonNeumannEntropy` and `Matrix.relativeEntropy` (`TauCeti/Analysis/Matrix/Entropy.lean`, lines 88 and 134); `partialTraceRight`, `partialTraceLeft` (`TauCeti/LinearAlgebra/Matrix/Trace/Partial.lean`, lines 51 and 153). No compound matrix and no log-majorization predicate exists in either pinned library, as the docstring says.
- Cross-roadmap citations resolved on main: OperatorMonotoneFunctionsAndMatrixMeans 2.1 (Davis's criterion), 2.4, 2.6; EigenvalueAndSingularValueInequalities 1.1 (`IsWeaklyLogMajorizedBy`); PadicMeasuresIwasawaAlgebras 6.4; the two new relative links point to folders that exist.
- Dependency check: `depcheck: 106 roadmaps, 1216 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration of `Suggested.lean`: exit 0, 36 `sorry` warnings and nothing else. The elaborated type of `mutualInformation_kraus_le` was printed and compared with the README: binders `ι κ μ` with their `Fintype` and `DecidableEq` instances, `K`, `hK`, `ρ`, `hρ`, no trace hypothesis, no binder lost.
- One-tactic probe on a copy (`simp`, `rfl`, `le_rfl`, `positivity` after introducing `ρ'`): none closes `mutualInformation_kraus_le`.
- Pull request text against the head: 36 theorems and 36 `sorry`s, six local definitions, the three imports, Section 2.4 among the suppliers and the Davis bullet all agree; no change outside the folder.
- Automatic checks: all pass except the one set aside below.

Overlap check: read OperatorMonotoneFunctionsAndMatrixMeans, EigenvalueAndSingularValueInequalities, OperatorAlgebraDynamics; nothing shared. The change adds no object; the operator Jensen inequality for isometries is owned by OperatorMonotoneFunctionsAndMatrixMeans, Section 2.1, and is only pointed to.

Source independence: changed passages only; 4 passages compared with 1 source (Tropp, arXiv version), none shared beyond theorem numbers and titles of results; largest share Watrous, 21 of about 74 locators, unchanged; the diff adds, removes and reorders no layer, so the arrangement was not compared again. Not read: Bhatia, Simon, Bratteli–Robinson, Bengtsson–Życzkowski, Hiai's book.

Research link: Layers 2–3 are the Lieb, Ando and data-processing theorems that the README's closing section names as inputs to Petz recovery, the Fawzi–Renner bounds and the multivariate trace inequalities of Sutter, Berta and Tomamichel; Hiai (2018) extends the divergence theory to von Neumann algebras. Rests on the README and on Hiai's paper.

## Not verifiable

- Bhatia, *Matrix Analysis* (about 19 locators): paywalled; no legal copy.
- Simon, *Loewner's Theorem on Monotone Matrix Functions* (about 12 locators): paywalled.
- Hiai, *Quantum f-Divergences in von Neumann Algebras*: no legal copy.
- Bengtsson–Życzkowski (6 locators): no open copy.
- Bratteli–Robinson (Lemma 6.2.21, Prop 6.2.22, p. 278): paywalled.
- Tropp, journal numbering and pages 181, 182, 194: only the arXiv version was read.

Automatic checks set aside as false positives: the section comment "Supplier names cited in the README" in `Suggested.lean` was reported as heading no declaration; it heads the twenty `#check` lines that pin library names, which is the permitted use.

## Source issues

- none

## For the human reviewers

- **Not tested.** Five of the seven cited books (Bhatia, Simon, Hiai, Bengtsson–Życzkowski, Bratteli–Robinson; about 49 of 74 locators) could not be read legally; wording and locators were not compared with them. Watrous, the largest share, was read at every locator in the previous review.
- **Licence.** Watrous was read from the author's own page, Tropp and Hiai's paper from arXiv; nothing is reused beyond statements and locators.
