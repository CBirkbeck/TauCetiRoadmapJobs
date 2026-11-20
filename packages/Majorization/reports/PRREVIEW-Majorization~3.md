# Review of Majorization (pull request #2612 at c754e3c)
Folder: `TauCetiRoadmap/OperatorTheory/Majorization/`
**Verdict:** accepted

**Summary.** Accepted with no finding. This is an incremental re-review of the 51 lines changed since `591e977`: the table of former labels agrees with the subsections of the README on main, the new block-sum Check of §2.4 was recomputed and holds, the sentences about the private progress step agree with the pinned Tau Ceti, and the description agrees with this head. One small correction and two format notes are carried over from the previous review, none blocking. For the humans: the two declarations kept in `Suggested.lean` for other roadmaps' acceptance files, and the fact that none of the five references could be read legally.

## C01 — Six sections still cite Bhatia only as "Chapters II–IV"

Sections 1.1, 1.2, 1.4, 2.1, 2.3 and 2.5 (lines 107, 170, 280, 410, 514, 594) give a three-chapter range as their only locator into that book, so a reader cannot find the source statement of the transfer step, Ky Fan's maximum principle or the gauge representation. It matters most for the two targets that are not public library declarations (the progress step of §1.2 and the singular-pair attainment of §1.4). Would theorem or section numbers be given where the book states each result, as §2.2 does with Theorem IV.2.2?

## N01 — In the second Check of §2.1 (line 462), "double every singular value" reads as multiplying by 2

The dilation repeats each singular value, `(1, 1, 0, 0)` against `(1, 0, 0, 0)`. Would "repeat every singular value twice" be used?

## N02 — The *Needs:* line of §1.5 (lines 372–375) omits three Tau Ceti lemmas its bullets use

`Matrix.toLin_diagonal_apply_self`, `LinearMap.exists_linearIsometryEquiv_eq_comp_toLin_diagonal_comp` and `LinearMap.diagonalSum_add` are cited in the bullets and listed in the supplier contracts, but not on that line.

## Questions for the author

These stand from the previous review; the texts are paywalled or returned no copy, so none could be checked.

- §2.2 cites Bhatia, Theorem IV.2.2 for the equivalence of Ky Fan domination with orbit-hull membership, for rectangular maps and for `𝕜 = ℝ`. Is that theorem the hull characterization, or the norm inequality for square complex matrices, with the hull statement elsewhere in the book?
- §1.4 cites Fan 1949 for the Ky Fan sums of singular values and their triangle inequality. Is the singular-value maximum principle in that note, or in Fan's 1951 note in the same journal (vol. 37)?
- §1.5 and §2.3 call the gauge representation Mirsky's. The square case is usually credited to von Neumann (1937); would he be cited as well?

## Previous findings

The previous review, of `591e977`, had no finding; its small corrections and format notes are accounted for here.

- C01 — repaired: "**Former labels.** … The former Part A is Layer 1 and the former Part B is Layer 2", with an eleven-row table at the end of Scope and ownership (lines 745–761).
- C02 — repaired: "State as a public declaration: …", "The pinned Tau Ceti proves the step as the private theorem `exists_robinHood_card_lt`" (§1.2, lines 182–192); Scope: "which Tau Ceti proves only as a private theorem".
- C03 — repaired: "Take `A = B = I` on `𝕜²` and `C = D = diag(2, 0)` … `1 ≤ 2` … `2 ≤ 2√2` … `4 ≤ 4`" (§2.4, lines 583–588).
- C04 — not repaired: "(Bhatia, *Matrix Analysis*, Chapters II–IV)" at six places; written again as C01 above.
- C05 — repaired: the description now says "The labels `MAJ-Ann` and `MAJ-Bnn` no longer appear in the text. A table of former labels at the end of Scope and ownership maps each range".
- N01 — not repaired: "would double every singular value" (line 462); written again as N01.
- N02 — not repaired: the *Needs:* line of §1.5 ends "Tau Ceti `Matrix.singularValues_toLin_diagonal`, `LinearMap.diagonalSum`"; written again as N02.

## Verified sound

| Statement | Instances tried | Values computed (README side / library or computed side) | Result |
| --- | --- | --- | --- |
| 2.4 block-sum Check (changed) | `A=B=I₂`, `C=D=diag(2,0)` | `Kₖ(I)=1,2,2 ≤ 2,2,2`; `σ(A⊕B)=(1,1,1,1)`, `σ(C⊕D)=(2,2,0,0)`; operator `1≤2`, Frobenius `√4=2≤√8=2√2`, nuclear `4=4`; separate bounds `2+2=4` | holds; strict hypotheses at `k=1`, equality for nuclear |
| 1.2 progress step (changed wording) | private theorem at the pin; `y=(3,0,0)`, `d=(1,1,1)` | library: `d` antitone, prefix bounds, equal totals, `y≠d` ⟹ `0≤δ≤yⱼ−yₖ`, fewer differing coordinates, prefix bounds kept; its choice: first differing index `0`, first later deficit `1`, `δ=1`, `(2,1,0)` | README statement equals the library's; the stated choice of `i`, `j` is the library's |
| Former-labels table (added) | every `MAJ-` label of the README on main, by subsection | A01–06, A07–17, A18–25, A26–35, A36–40; B01–11, B14–21, B44–46, B22–29, B30–38, B40–43 (main has no B02, B05–07, B12, B13, B39) | agrees row by row; no roadmap, on main or open, cites a label outside the ranges |
| `Suggested.lean` docstring (changed) | "does not state publicly" against the pin | `exists_robinHood_card_lt` is `private`; the singular-pair attainment has no declaration | holds |
| Description, counts | Checks per section at this head | `3, 4, 2, 4, 2, 2, 3, 3, 2, 2, 2`, total `29`; imports: `Mathlib` and two Tau Ceti modules; three `#check` lines; no theorem | agrees |

The rows of the untouched statements stand as in the previous review, of `591e977`.

- Source locators checked against the text: 0 (the changed passages add none; no reference is readable).
- Library declarations opened: `TauCeti/Analysis/Convex/Majorization.lean` line 261 (`private theorem exists_robinHood_card_lt`, read to the choice of the two coordinates and of `δ`) and line 338 (`mem_of_prefixSum_le_of_sum_eq`, which calls it at line 347).
- Cross-roadmap citations: none added; the search of main and of the open heads for a `MAJ-` label outside the table's ranges returned nothing.
- Changes outside the folder: none.
- Automatic checks: run again on this head, all passed. Dependency check output: `depcheck: 200 roadmaps, 2195 edges, 0 problem(s)`.
- Elaboration of `Suggested.lean` with `lake env lean`: no error and no warning; the three `#check` lines print transfer descent, gauge monotonicity and forward Schur–Horn. The file has no sorried declaration, so the one-tactic probe has nothing to try; the two kept declarations are unchanged.
- Description read against the head: the former-labels table, the private theorem, the block-sum Check, the 29 Checks, the Lean file's imports and its removed statements are all as the description says; nothing a reader must know is left out.

Overlap check: read MeansMajorizationAndDiscreteInequalities, OperatorIdeals, SpectralSteepestDescent, OperatorMonotoneFunctionsAndMatrixMeans, SpectralSubspacePerturbation, PolarDecomposition and PrincipalAngles in the previous review; the change adds no object. Weak majorization, transfers, symmetric gauges, Ky Fan sums and unitarily invariant seminorms are owned by Majorization; the modulus and singular system are PolarDecomposition's; the permutation-orbit hull and Davis's bound are PrincipalAngles'. Nothing else is shared.

Source independence: changed passages only: 3 passages (the progress-step sentences, the block-sum Check, the former-labels table) cite no source and none of the 5 references could be read, so 0 passages compared with 0 sources; largest share Bhatia 1997, 8 of 13 locators; no layer added, removed or reordered, contents not compared again.

Research link: Fan dominance and the symmetric-gauge representation of unitarily invariant norms (Fan 1949; Mirsky 1960; Bhatia 1997) are the norm-transfer inputs for PrincipalAngles' eigenvalue-perturbation estimates, SpectralSubspacePerturbation's block comparisons and OperatorIdeals' Schatten norms; this rests on the README's Downstream consumers and References, not on a source read.

## Not verifiable

- Bhatia, *Matrix Analysis* (1997), Chapters II–IV and Theorem IV.2.2: paywalled.
- Marshall, Olkin and Arnold, *Inequalities* (2011), Theorem 9.B.1: paywalled.
- Fan 1949, Proc. Nat. Acad. Sci. 35; Mirsky 1960, Quart. J. Math. 11; Schur 1923: no legal copy was readable in the previous review; not tried again, since the change touches none of their locators.

## Source issues

- none

## For the human reviewers

- `Suggested.lean` lines 73–112 keep a second carrier of `TauCeti.UnitarilyInvariantSeminorm` and a Frobenius function only because the acceptance files of PrincipalAngles, OperatorIdeals and SpectralSubspacePerturbation import this file; it states no theorem of its own.
- Every headline theorem is a public Tau Ceti declaration at the pin; of the two remaining targets one is proved privately (README §1.2). Whether the roadmap moves to `Completed/` is the maintainers' decision.
- Licence: README Provenance (from line 703) credits a proof strategy to `rjwalters/lean-genius`, `SchurHornMajorization.lean`, which the README says declares no licence. That file was not opened.
- Not tested: Bhatia (8 of 13 locators) could not be read, so neither the wording nor the arrangement was compared with its text or its table of contents.
