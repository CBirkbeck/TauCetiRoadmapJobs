# Review of IntegralWeylModulesOfGeneralLinearGroups (pull request #3027 at 3bddf73)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/IntegralWeylModulesOfGeneralLinearGroups/`
**Verdict:** accepted

**Summary.** A review of the change against `main`: 86 changed lines since `b8f3652`. The folder's text is the one the previous review read; I checked again the origin and method labels of the eleven sections, the two `*Corollary of:*` lines against ClassicalGroups §6.6a and ArakelovGeometryAndAbelianHeights §1A.4 at this head, the shortened sentence of 2.2, and the scope, contract and reference changes, recomputing the hook norms, the Capelli identity for `K = 2, 3` and the slope examples. There is no finding. Three small corrections remain, none blocking: the description does not say that this roadmap gains a supplier, the references leave 2.1 (c) out of what the formal proof states, and a preprint is called published. There are no format notes and nothing is left for a human to decide.

## C01 — The description does not say that this roadmap gains ArakelovGeometryAndAbelianHeights as a supplier

A reader of the description learns that 3.1 cites ClassicalGroups §6.6a on its `*Corollary of:*` line and that one sentence of 2.2 is corrected, and for other roadmaps of the family the description lists each supplier gained. For this roadmap it lists none, yet the head adds the subsection `From TauCetiRoadmap.ArakelovGeometryAndAbelianHeights` to the supplier contracts: §1A.4, of which the independence of the number of summands in 3.3 is a corollary, and §1A.5, named in the labels of 3.2 and 3.4.

The edge is sound (§1A.4 states the orthogonal-sum identity with its proof, and the dependency check shows no upward edge). The description could add: "IntegralWeylModulesOfGeneralLinearGroups gains ArakelovGeometryAndAbelianHeights as a supplier (§1A.4 for 3.3; §1A.5 in the labels of 3.2 and 3.4)."

## C02 — The references' list of what [FormalProof] states leaves out 2.1 (c), which the label of 0.2 credits to it

The [FormalProof] entry of the References, edited by this change, reads "… 0.2, 1.1, 2.1 (a), (b), (d), (e), 2.2 …" (line 524). The new `*Method of the formal proof:*` label of 0.2 says the equality of the lattices is read off the bound `C(N, 2)·⌊log_p w⌋` of 2.1, and the route of 0.2 names ExIntervalLt (`Formalism/PieriBlockIdeals/StatementE.lean`). That statement, which I opened in the source at the commit the README names, is exactly 2.1 (c): for shifted weights in an interval of length `w`, the exponent is at most `C(N, 2)·log_ℓ w`, and it is `0` when `w < ℓ`. Writing "2.1 (a), (b), (c), (d), (e)" makes the list agree with the label.

## C03 — 1.1 calls Hara, Miyazaki and Namikawa (2023) "published", but the text cited is a preprint

The `*Origin:*` label of 1.1 says "nearest published result" and its method label "The published integral treatment" (lines 157 and 159); these labels exist to record whether a result is published. The text the References cite is arXiv:2308.12200, whose latest version (v3, 3 April 2024) carries no journal reference. "Nearest result in the literature: Hara, Miyazaki and Namikawa (preprint, 2023)" would be accurate; a journal version, if there is one, could be cited instead. The comparison itself is right: their Proposition 2.1 assumes `(λ_1 − λ_n + n − 3)!` invertible, which is what "inverts a factorial" says.

## Questions for the author

- Is 2.1 (c′), the total exponent `D(λ)` dividing `lcm(1, …, w)^{C(N,2)}` with the Chebyshev bound, a statement of [FormalProof]? The Labels paragraph names only 0.3, 3.2 and 3.4 as having parts that are this roadmap's own formulation, and the label of 0.3 counts the same lcm form as this roadmap's own; 2.1 gives no locator for (c′), and I found no statement of that shape in the source. If it is not, would the `*Origin:*` label of 2.1 say so?

## Previous findings

- The previous review had no finding. Of its three small corrections, the first is partly repaired (the description now says that 3.1 cites ClassicalGroups §6.6a for the Capelli identity; the new supplier is still unnamed, C01), and the other two are not repaired (C02, C03). Its question on 2.1 (c′) is still open.

## Verified sound

| Statement | Instances tried | Roadmap side | Computed / source side | Result |
|---|---|---|---|---|
| 0.1 labels (standard bideterminant basis) | `ν = (2, 1)`, `N = 3` | rank = number of semistandard tableaux | 8 tableaux; Weyl dimension of `(2,1,0)`: `2·2·2 = 8` | agrees |
| 0.3a method label (`C(n, k)⁻¹`, valuation `≥ −⌊log_p n⌋`) | `C(6,3)`, `p = 2`; `C(9,3)`, `p = 3` | bound `⌊log_p n⌋` | `v_2(20) = 2 = ⌊log_2 6⌋`; `v_3(84) = 1 ≤ 2` | agrees |
| 0.3 headline (1), label (identity over `dim V_λ`) | `GL_2`, `λ = (2, 0)`, `p = 2, 3` | `p^e·∇ ⊂ Δ`, refined with `dim V_λ = 3` | `p = 2`: `e = 1`, `2·xy ∈ Δ`; `p = 3`: `e = 1`, `e − v_3(3) = 0`, `Δ ⊗ ℤ_(3) = ∇ ⊗ ℤ_(3)` | agrees |
| 0.2 labels (read off 2.1 (c)) | ExIntervalLt in the source; `GL_2`, `λ = (2,0)`, `p = 5` | exponent `0` when `w < p` | source: `≤ C(N,2)·log_l w`, `= 0` if `w < l`; `w = 3 < 5`, `C(2,1) = 2` a unit | agrees |
| 1.1 headline (2), origin label | Hara–Miyazaki–Namikawa Proposition 2.1 | integral without inverting a factorial | source needs `(λ_1 − λ_n + n − 3)!` invertible for `n ≥ 3` | agrees (C03 on "published") |
| 2.1 (c) and the References list | ExIntervalLt statement | list omits (c) | statement is (c) for every interval of length `w` | C02 |
| 2.1 headline (3) | `GL_2`, `λ = (2, 0)`, `ℓ = 2` | `ex ≤ ⌊log_ℓ w⌋` | `ex = v_2(2) = 1 = ⌊log_2 3⌋` | agrees |
| 2.2 method label and route (b) | `GL_2`, `(2, 0)`, `M = 2` | cofactor substitution keeps type; duality twisted by `det^M` exchanges `Δ`, `∇` | `x², xy, y² ↦ y², −xy, x²` (`∇ → ∇`); `x², 2xy, y²` likewise (`Δ → Δ`); `ℓ^c∇ ⊂ Δ` dualises to `ℓ^c∇* ⊂ Δ*` | consistent |
| 3.1 norm identity | `(2,1)`, `(2,2)`, `(3,3)`, `n = 2`; `(3,1)`, `(2,1,1)`, `(3,2,1)`, `(1,1)`, `n = 3` | `H(a)` | norms 3, 12, 144, 8, 8, 45, 2; hook products 3, 12, 144, 8, 8, 45, 2 | agrees |
| 3.1 Capelli identity; Corollary of ClassicalGroups §6.6a | random polynomials, `K = 2, 3`; shifts compared | `det(x)·det(∂) = A_K(K − 1)`, shift `K − 1 − k` from `0` | both sides equal for `K = 2, 3`; unshifted determinant differs; §6.6a shift `k − c` from `1`, same operator | identical |
| 3.1 method label (`Δ_K·Δ_K(∂)P = ∏(a_t + K − 1 − t)·P`) | `K = 2`: `P = x00·Δ_2`; `P = x00²·Δ_2²` | factors `3·1`, `5·2` | `Δ_2(∂)P = 3·x00`; `(3+2)(1+1) = 10`; route's `∏(a_i + K − i)` is the same number | agrees |
| 3.2 headline (4), method label | `λ = (2, 0)` | Gram determinants inverse | `det Gram(Δ) = 2`, `det Gram(∇) = 1/2`, product 1 | agrees |
| 3.3 Corollary of Arakelov §1A.4; Gaudron Propriétés 5.7 (2) | `ℤ ⊕ (ℤ, Gram 1/4)`, `μ = 2μ̂` | `μ_max` of the sum is the larger | lines `0`, `log 4`; whole `log 2`; max `log 4`. Source: defect at most `log max Δ`, zero for hermitian sums | agrees |
| 3.3 constant | `ν = 2`, `R = 1` | `log((ν!)^{2R}(R!)^ν) ≤ 4νR·log(νR)` | `log 4 ≈ 1.39 ≤ 8·log 2 ≈ 5.55` | agrees |
| 3.4 origin label (Bost 2001, Proposition 4.5) | (4.11) | slope inequality for an injective map | `deg_n E ≤ rk E·(μ̂_max(F) + h)` for injective `φ` | agrees |

- Source locators read at the text: Gaudron 2008, Propriétés 5.7 (2) and Remarque 5.8 (printed p. 66); Bost 2001, Proposition 4.5, (4.11); Hara–Miyazaki–Namikawa, §§2.3.1–2.3.2, Proposition 2.1; Caracciolo–Sokal–Sportiello, Corollary 1.3, (1.19c), (1.20a).
- Formal proof: ExIntervalLt opened in its file; DetDetId, HookNorm, LemmaDLast, InducedSimpleLowestAlcove present in the kernel export.
- Cross-roadmap citations resolved at this head: ClassicalGroups §§6.6, 6.6a (statement, route and Checks read); ArakelovGeometryAndAbelianHeights §§1A.4, 1A.5 (statement and proof of the orthogonal-sum identity read). Neither is removed or renumbered by this pull request.
- Record: the README at the merge base has four layers; the head keeps all four with their titles, removes no section, and changes no Lean declaration.
- Dependency check: `depcheck: 129 roadmaps, 1441 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks: every check of the worker's run passed. Elaboration of `Suggested.lean` (unchanged by the change): nine `sorry` warnings and nothing else; signatures not re-checked with `#check`, no declaration having changed.
- Overlap check: read NonintersectingPathsAndLGV (open), GluedTargetAndDivisionInequality, TensorInductionAndFiniteGroupInputs, LocalGainOfThetaChains (main); nothing shared. The Capelli identity is owned by ClassicalGroups §6.6a and the maximal slope of an orthogonal sum by ArakelovGeometryAndAbelianHeights §1A.4; this roadmap cites both.
- Decisions of the human reviewers: neither applies to this folder (no section leaves it).

Source independence: changed passages only; 8 passages compared with 5 sources (Gaudron 2008, Bost 2001, Hara–Miyazaki–Namikawa 2023, Caracciolo–Sokal–Sportiello 2009, the formal proof's Lean source), none shared; largest share [FormalProof], about 50 of 87 locators; arrangement not compared, the change adding, removing and reordering no layer.

Research link: Layers 0–3 supply the lattices, branching maps, exponents and slopes that the theta-chain roadmaps use toward Alpöge's 2026 proof of the Riemann hypothesis for Dirichlet L-functions; 1.1 is the integral branching that Hara, Miyazaki and Namikawa (2023) treat for Rankin–Selberg critical values. Rests on the README and on that preprint's §2.3.

## Not verifiable

- Carter and Lusztig (1974), §2.2, Theorem 3.8, Corollary 2 of 4.1 (labels of 0.2 and 1.1): paywalled at the publisher; no legal copy found.
- De Concini, Eisenbud and Procesi (1980) (label of 0.1): paywalled at the publisher.
- Jantzen (1977), both papers (label of 0.2), and Jantzen (2003), II.8 (label of 3.2): paywalled; not read.
- Asherova, Smirnov and Tolstoy (1971) (labels of 0.3a and 2.1): not read; no legal copy looked for beyond the cached texts.

## Source issues

- none

## For the human reviewers

- none
