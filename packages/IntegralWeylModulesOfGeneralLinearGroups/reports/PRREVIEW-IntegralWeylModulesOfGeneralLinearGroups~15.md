# Review of IntegralWeylModulesOfGeneralLinearGroups (pull request #3027 at f0da4ff)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/IntegralWeylModulesOfGeneralLinearGroups/`
**Verdict:** accepted

**Summary.** An incremental re-review of the 8 lines changed since `3bddf73`, all in the README: the method label and route of 0.2, and two entries of the References. The new sentences of 0.2 agree with the formal proof's source at the commit the README names (statements, hypotheses and the Nakayama argument), and the journal reference now given for Hara, Miyazaki and Namikawa is confirmed. There is no finding. One small correction remains, not blocking (the description still does not name the supplier this roadmap gains), with no format note and nothing for a human to decide.

## C01 — The description does not say that this roadmap gains ArakelovGeometryAndAbelianHeights as a supplier

For other roadmaps of the family the description lists each supplier gained; of this roadmap it says only that 3.1 cites ClassicalGroups §6.6a on its `*Corollary of:*` line. The head also adds the subsection `From TauCetiRoadmap.ArakelovGeometryAndAbelianHeights` to the supplier contracts (line 491: §1A.4, of which the independence of the number of summands in 3.3 is a corollary; §1A.5, named in the labels of 3.2 and 3.4).

The edge is sound (the dependency check shows no upward edge). The description could add: "IntegralWeylModulesOfGeneralLinearGroups gains ArakelovGeometryAndAbelianHeights as a supplier (§1A.4 for 3.3; §1A.5 in the labels of 3.2 and 3.4)."

## Questions for the author

- Is 2.1 (c′), the total exponent `D(λ)` dividing `lcm(1, …, w)^{C(N,2)}` with the Chebyshev bound, a statement of [FormalProof]? The Labels paragraph names only 0.3, 3.2 and 3.4 as having parts that are this roadmap's own formulation; 2.1 gives no locator for (c′), and I found no statement of that shape in the source. If it is not, would the `*Origin:*` label of 2.1 say so? (Open since the previous review; the change does not touch it.)

## Previous findings

- The previous review, of `3bddf73`, had no finding. Of its three small corrections: the first (the description leaves the new supplier unnamed) is not repaired and is C01 again; the second is repaired (the References now list "2.1 (a), (b), (c), (d), (e)"); the third is repaired (the References give "published in Represent. Theory 29 (2025), 527–615", which the journal's record confirms, so "nearest published result" in 1.1 is accurate). No repair introduced a new problem.

## Verified sound

| Statement | Instances tried | Roadmap side | Computed / source side | Result |
|---|---|---|---|---|
| 0.2 statement (`w = λ_0 − λ_{N−1} + N − 1 < p` gives `Δ = ∇` at `p`), cited by the changed route | `GL_2`, `λ = (a, 0)`: `a = 2, p = 5`; `a = p − 2`; `a = p` | equality iff covered: `w = a + 1 < p` | `C(2, i) = 1, 2, 1`, units at 5; `C(p − 2, i)` units; `C(p, 1) = p`, fails and `w = p + 1` | agrees |
| 0.2 route: ExIntervalLt "states the first", least `e` with `m·p^e·∇ ⊂ Δ`, `p ∤ m`, is `0` | source statement at the named commit | hypothesis `w < p`, shifted weights in an interval of length `w` | shifted weights `λ_a + N − 1 − a` in `[lo, lo + w]`; exponent is the infimum of `e` with `∃ m, ℓ ∤ m, m·ℓ^e·∇_ℤ ⊂ Δ_ℤ`; `= 0` if `w < ℓ` | agrees |
| 0.2 method label: closed alcove, simplicity gives `∇ ⊂ Δ + p∇`, Nakayama gives `c ≡ 1 (mod p)` | `GL_2`, `a = p − 1` (wall); `a = 2`, `p = 5` | `c·∇_ℤ ⊂ Δ_ℤ`, `p ∤ c` | `C(p − 1, i) ≡ (−1)^i`, units; `∇/Δ = ℤ/2`, `c = 6 ≡ 1 (mod 5)` kills it. Source: `c − 1 ∈ (p)`, hypothesis `λ_i − λ_j + (j − i) ≤ p` | agrees |
| 0.2 route: the open form "for `λ_0 − λ_{N−1} + N < p`" | source definition of the spread; `a = p − 2` | strict bound with `N`, one less than the range of 0.2 | spread `= λ_0 − λ_{N−1} + N`; `a = p − 2`: spread `= p`, not covered there, covered by `w = p − 1 < p` | agrees |
| References: [FormalProof] list now has 2.1 (c) | ExIntervalLt | bound `C(N, 2)·⌊log_p w⌋`, `0` if `w < p` | `≤ C(N, 2)·log_ℓ w` and `= 0` if `w < ℓ` | agrees |

The rows of the previous review, of `3bddf73`, stand for every untouched statement.

- Source locators read at the text: [FormalProof] at commit `40e56bab`, four declarations of 0.2 (`ExIntervalLt`; `InducedSimpleLowestAlcove`, `exists_smul_mem_delSq_of_simple`, `weylDualWeylLatticesAgree_of_lowest_alcove` in the named file; `NablaMemDeltaLocallyAtLargePrime` with its namespace `Formalism.BasicNotions`), each present with the stated hypotheses; the proof of the Nakayama step read line by line.
- Bibliography: arXiv:2308.12200 has three versions (v3 of 3 April 2024); the journal's record gives Represent. Theory 29 (2025), 527–615.
- Cross-roadmap citations in the changed passages: none added or changed (ReductiveGroups §§10B, 10D and PotentialAutomorphyInfrastructure §§0.4, 0.6 stand as before).
- Record: no heading, layer or Lean declaration changed since `3bddf73`; against the merge base the four layers are kept and one supplier subsection is added.
- Dependency check: `depcheck: 122 roadmaps, 1390 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks: every check of the worker's run passed. Elaboration of `Suggested.lean` (unchanged): nine `sorry` warnings and nothing else; signatures not re-checked with `#check`, no declaration having changed.
- Overlap check: read NonintersectingPathsAndLGV (open), GluedTargetAndDivisionInequality, TensorInductionAndFiniteGroupInputs, LocalGainOfThetaChains (main); nothing shared. The Capelli identity is owned by ClassicalGroups §6.6a and the maximal slope of an orthogonal sum by ArakelovGeometryAndAbelianHeights §1A.4; this roadmap cites both.
- Pull request's text: the title and description do not contradict this head; the one omission is C01.

Source independence: changed passages only; 3 passages compared with 2 sources (the formal proof's Lean source, which has no prose at these declarations, and the bibliographic record of Hara–Miyazaki–Namikawa), none shared; largest share [FormalProof], about 50 of 87 locators; arrangement not compared, the change adding, removing and reordering no layer.

Research link: Layers 0–3 supply the lattices, branching maps, exponents and slopes that the theta-chain roadmaps use toward Alpöge's 2026 proof of the Riemann hypothesis for Dirichlet L-functions; 1.1 is the integral branching that Hara, Miyazaki and Namikawa (2023) treat for Rankin–Selberg critical values. Rests on the README and on that preprint's §2.3.

## Not verifiable

- Carter and Lusztig (1974), §2.2, Theorem 3.8, Corollary 2 of 4.1 (labels of 0.2 and 1.1): paywalled at the publisher; no legal copy found.
- De Concini, Eisenbud and Procesi (1980) (label of 0.1): paywalled at the publisher.
- Jantzen (1977), both papers (label of 0.2), and Jantzen (2003), II.5.6 and II.8 (route of 0.2, label of 3.2): paywalled; not read.
- Asherova, Smirnov and Tolstoy (1971) (labels of 0.3a and 2.1): not read; no legal copy looked for beyond the cached texts.
- The published version of Hara, Miyazaki and Namikawa (Represent. Theory 29): its existence and pages are confirmed, its text was not read; §§2.3.1–2.3.2 were checked in the arXiv version, which the README says it cites.

## Source issues

- none

## For the human reviewers

- none
