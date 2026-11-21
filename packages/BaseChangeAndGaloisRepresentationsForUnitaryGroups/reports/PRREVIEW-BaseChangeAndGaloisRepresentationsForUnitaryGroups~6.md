# Review of BaseChangeAndGaloisRepresentationsForUnitaryGroups (pull request #2890 at 284e520)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/BaseChangeAndGaloisRepresentationsForUnitaryGroups/`
**Verdict:** accepted

**Summary.** Accepted: this was an incremental re-review of the 85 lines changed since `650e4a7`, and the one finding of the previous report is repaired. Theorem 16.1 now defines the weight (`a_τ = −w₀λ_τ`), and I recomputed its Hodge–Tate weights `{j − 1 − λ_{τ,j}}` in rank one, in the trivial rank-two example and against §3.6 of PotentialAutomorphyInfrastructurePartII; the three small corrections and the format note are repaired as well. There are no new findings, small corrections or format notes. The two questions for the human reviewers (scope and licence of the family's unpublished source) stand.

## Previous findings

- R01 — repaired: 16.1 now reads "Here `a` is the weight of `BC(Π)` in the sense of AutomorphicGaloisRepresentationsPartII AG2.0 … `a_τ = −w₀λ_τ = (−λ_{τ,n}, …, −λ_{τ,1})`", with the rank-one Check and the dictionary to §3.6; headline (4) and the docstring follow.
- C01 — repaired: step (6) of 13.8a cites Harish-Chandra's formula of EndoscopicTransferAndUnitaryTraceComparison §2.3(c); the orbital integrals of one pseudo-coefficient are "among the steps not given"; the contract and the two dependency lines cite §2.3.
- C02 — repaired: the Summary says "Headline (1) restates, clause by clause and with the same hypotheses, what EndoscopicTransferAndUnitaryTraceComparison proves" and that 14.1 and 15.1 are cases with added routes; the docstring says the same.
- C03 — repaired: the description names "ModularityAndLanglandsExtensions (§2.43, the irreducibility input of the first route of 14.1 and 15.1)".
- N01 — repaired: the route of 10.33d and the rank-five Check of 10.34 write `conj`; no TeX macro remains in either file.

## Verified sound

| Statement | Instances tried | Values on each side | Result |
|---|---|---|---|
| 16.1 weights, general `n` | `a_τ = −w₀λ_τ`, `j = n + 1 − i` | `a_{τ,i} + n − i = −λ_{τ,j} + j − 1` | the two multisets agree |
| 16.1 conjugate embedding | `λ_{τ∘c} = −w₀λ_τ` | `a_{τ∘c} = −w₀λ_{τ∘c} = λ_τ`; `a_{τ,i} + a_{τ∘c,n+1−i} = −λ_{τ,n+1−i} + λ_{τ,n+1−i} = 0` | `a ∈ (ℤⁿ)_0` |
| 16.1 rank-one Check | `n = 1`, `Π_v = τ(z)^m` | `BC` component `τ(x)^m(τ∘c)(x)^{−m} = ∏σ(x)^{−a_σ}`: `a_τ = −m`, `a_{τ∘c} = m`; formula gives `{0 − m}`, `{0 + m}` | Check true; agrees with the previous review's computation |
| 16.1 wrong readings | `a_τ = λ_τ`; restriction of embeddings | `{m}`, `{−m}`; `a_τ = a_{τ∘c} = m`, sum `2m ≠ 0` | both excluded, as the Check says |
| 16.1 trivial example | `n = 2`, `λ = 0` | `{j − 1} = {0, 1}`; existing Check has `{0, 1}` | consistent |
| 16.1 infinitesimal character | `Ξ_a^∨` at `τ` | highest weight `−w₀a_τ = λ_τ`, so `λ_τ + ρ` | as stated |
| 16.1 against §3.6 | `Π_∞ ≅ ξ_{ιλ′}^∨` | `−w₀λ′ = λ` gives `λ′ = −w₀λ = a`; `{λ′_j + n − j} = {a_j + n − j}` | dictionary correct |
| 13.8a step (6) | `U(p,q)`, `r = p + q` odd, torus point `t`, conjugates `wt` | `Δ(wt) = ε(w)Δ(t)`; sum over `W_K∖S_r` is `(−1)^{pq}Σ_{S_r}ε(σ)e^{σλ}/Δ`; `q(G) = pq`, even | Weyl character `s_{λ−ρ}`, sign `+1` |
| 13.8a step (1) | §2.10 of the supplier | statement gives `O_γ(f_ξ)` for the packet average; the value `vol⁻¹Θ_π(γ⁻¹)` for one member is in its route only | the sentence about §2.10 is accurate |
| 10.33d, 10.34 notation | `\overline{…}` to `conj` | same expressions, symbols only | no change of meaning |

The rows for untouched statements stand as in the previous review, of `650e4a7`.

- Source locators checked against the text: none; the changed passages add no source locator.
- Library declarations opened at the pin: none needed; `Suggested.lean` declares nothing and the change touches its docstring only.
- Cross-roadmap citations resolved: 4, on main and at the open head: EndoscopicTransferAndUnitaryTraceComparison §2.3(c) (the formula with `(−1)^{q(G)}` and `W_K`) and §2.10; AutomorphicGaloisRepresentationsPartII AG2.0 (weights compared with `Ξ_a^∨`; a character of infinity type `∏τ(x)^{−b_τ}` shifts `a` by `b`; `(ℤⁿ)_w`; base change by restriction); PotentialAutomorphyInfrastructurePartII §3.6 (`Π_∞ ≅ ξ_{ιλ}^∨`, `HT_τ = {λ_{τ,j} + n − j}`).
- Seeded sample: 13.8a and 16.1 fall in the changed passages and were checked as above; the other sampled targets are untouched.
- Dependency check: `depcheck: 171 roadmaps, 2002 edges, 0 problem(s)`; no UPWARD or CYCLE line. The change adds and drops no supplier (§2.10 to §2.3 within one roadmap).
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with no output; no declaration, no `sorry`, no `set_option`, single `import Mathlib`. No signature to compare and no one-tactic probe to run.
- The automatic checks all passed; nothing changes outside the folder apart from the family index.
- The pull request's title and description agree with this head; the description now names both open suppliers of 14.1, 15.1 and 16.1.

Overlap check: read LocalFactorsOfTwistsAndTypes, CongruenceModulesOfThetaLifts, UniformWildKernelBounds, HeckeIdealsAndTaylorWilesRelations, FiniteReductiveGroups (open) and AutomorphicGaloisRepresentationsPartII, EndoscopicTransferAndUnitaryTraceComparison, GL2AutomorphicRepresentationsAndTransfer (main), as scoped in the previous review; the change moves no ownership. Shared objects and owners as before: the properties of the trace-defined correspondence, EndoscopicTransferAndUnitaryTraceComparison §§10.20–10.30; the away-prime and coefficient-prime comparisons, AutomorphicGaloisRepresentationsPartII AG2.5–AG2.7; Galois representations on the group of PotentialAutomorphyInfrastructurePartII §3.1, its §3.6; the inertial type for `GL₂(ℚ_x)`, GL2AutomorphicRepresentationsAndTransfer §R16.3.9.

Source independence: changed passages only: 5 passages (the hypothesis and weight sentence of 16.1, its rank-one Check, the comparison with §3.6, step (6) of 13.8a, the Summary clause) compared with 0 sources, since none carries a source locator, and with the three supplier sections they cite, none shared; largest share Deligne–Henniart 1981, 2 of 8 locators (equal with three others), unchanged; the arrangement was not compared again (no layer added, removed or reordered). Kudla 1994, Harris–Kudla–Sweet 1996 and Labesse 2011 could not be read.

Research link: Layer 10 is the explicit depth-zero local Langlands correspondence (Henniart 1992; Bushnell–Henniart 2005) with Kottwitz's 1986 matching extended to functions from the residue field; Layers 14–16 apply Caraiani's and Labesse's (2011) results to definite unitary groups. Rests on the README; the family index says the family follows an unpublished formal proof.

## Not verifiable

- Kudla 1994 §1 (6.3a): paywalled; the citation resolves to the publisher only.
- Harris–Kudla–Sweet 1996 §1 (6.3a): the publisher's host is not one the sources service reads.
- Labesse 2011 (16.1, the hypothesis `[E⁺:ℚ] ≥ 2`): the only copy is on a third party's page and was not used; the hypothesis agrees with EndoscopicTransferAndUnitaryTraceComparison §6.29.
- Caraiani–Scholze, Corollary 5.5.5 in the published numbering: the published version is paywalled, and arXiv v1 numbers a different statement 5.5.5.
- The six steps of 13.8a listed as not given (now including the orbital integrals of one pseudo-coefficient) were not checked; the README says they are not supplied.

## Source issues

- none

## For the human reviewers

- Scope: the family index (`TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/README.md`, lines 9–12) says the family follows a formal Lean proof of the Riemann hypothesis announced on 20 November 2026; I found no refereed source for it. Targets 10.33c, 10.33d, 13.8a and 15.1 here cite no literature.
- Licence: that formal proof is linked from the family index as a public repository; I did not open it and could not check whether any statement or arrangement of this README is adapted from it, or under what licence it is published.
