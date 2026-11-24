# Review of IntegralWeylModulesOfGeneralLinearGroups (pull request #3027 at 374b9ce)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/IntegralWeylModulesOfGeneralLinearGroups/`
**Verdict:** accepted

**Summary.** A review of the change against `main`: 86 changed lines since `74a09b7`. I checked the origin and method labels of all eleven sections, the two `*Corollary of:*` lines and the supplier sections they cite, the corrected sentence of 2.2, and the scope, contract and reference changes. I checked them against the sources that can be read legally, the formal proof's source and kernel export, and the cited roadmaps at this head; there is no finding. The correction to 2.2 is right: computed on three `GL_3` weights, the cofactor substitution sends `∇` to `∇` and `Δ` to `Δ` of the dual weight. There are three small corrections, all non-blocking: the description leaves out this roadmap's new supplier and the move of the Capelli identity, the references leave 2.1 (c) out of what the formal proof states, and a preprint is called published. There are no format notes and nothing for the human reviewers to decide.

## C01 — The description does not say that this roadmap gains ArakelovGeometryAndAbelianHeights as a supplier, or that ownership of the Capelli identity passes to ClassicalGroups §6.6a

From the description, a reader learns only that one sentence of 2.2 is corrected in this roadmap. The head also does two other things:

- It adds a supplier subsection, `From TauCetiRoadmap.ArakelovGeometryAndAbelianHeights`. That subsection covers §1A.4, of which the independence of the number of summands in 3.3 is now a corollary, and §1A.5, which is named in the labels of 3.2 and 3.4.
- The scope paragraph no longer counts the Capelli identity among what this roadmap owns. It names RepresentationTheory/ClassicalGroups §6.6a, a section this pull request adds, and 3.1 keeps the statement with a `*Corollary of:*` line.

Both changes are sound (§6.6a states exactly the clause of 3.1, and §1A.4 is the orthogonal-sum identity used). The description could add: "IntegralWeylModulesOfGeneralLinearGroups gains ArakelovGeometryAndAbelianHeights as a supplier (§1A.4 for 3.3; §1A.5 in the labels of 3.2 and 3.4), and its 3.1 keeps the Capelli identity as a corollary of RepresentationTheory/ClassicalGroups §6.6a, which now owns it."

## C02 — The references' list of what [FormalProof] states leaves out 2.1 (c), which the new label of 0.2 credits to it

The [FormalProof] entry in the References was edited by this change and now reads "… 0.2, 1.1, 2.1 (a), (b), (d), (e), 2.2 …". The new `*Method of the formal proof:*` label of 0.2 says that 0.2 is read off the bound `C(N, 2)·⌊log_p w⌋` for the exact exponent (2.1). The route of 0.2 cites ExIntervalLt (`Formalism/PieriBlockIdeals/StatementE.lean`).

ExIntervalLt states exactly 2.1 (c). For every interval of length `w` containing the shifted weights, the exponent is at most `C(N, 2)·⌊log_ℓ w⌋`, and it is `0` when `w < ℓ`. I opened the statement in the formal proof's source, and the name is in its kernel export. Writing "2.1 (a), (b), (c), (d), (e)" in that list makes the record agree with the label.

## C03 — 1.1 calls Hara, Miyazaki and Namikawa (2023) "published", but it is a preprint

The `*Origin:*` label of 1.1 says "nearest published result", and its method label says "The published integral treatment". Whether a result is published is exactly what these labels record. arXiv:2308.12200 (latest version v3, 3 April 2024) carries no journal reference.

One fix would be "nearest result in the literature: Hara, Miyazaki and Namikawa (preprint, 2023)"; if a journal version exists, it could be cited instead. The comparison itself is right. Their Lemma 2.4 gives the same highest-weight vector `ξ`, read with rows and columns exchanged. Their Proposition 2.1 needs `(λ_1 − λ_n + n − 3)!` invertible, which is what "inverts a factorial" says.

## Questions for the author

- Is 2.1 (c′), the total exponent `D(λ)` with the Chebyshev bound, a statement of [FormalProof]? The Labels paragraph names only 0.3, 3.2 and 3.4 as having parts of this roadmap's own formulation, and the label of 0.3 counts the same lcm form as this roadmap's own. 2.1 gives no formal-proof locator for (c′). A search of the source found only a total-exponent bound of another shape (`GlobalTheory.T.exists_totalExponent_topWeight_bound`), so I could not settle the question. If (c′) is not a statement of [FormalProof], would the `*Origin:*` label of 2.1 name it as this roadmap's own formulation?

## Verified sound

| Statement | Instances tried | Roadmap side | Computed / source side | Result |
|---|---|---|---|---|
| 0.1 labels (standard basis, De Concini–Eisenbud–Procesi) | `ν = (2, 1)`, `N = 3` | rank = number of semistandard tableaux | 8 tableaux; Weyl dimension of `(2, 1, 0)` is `2·4·2/2 = 8` | agrees |
| 0.3a method label (step operators, `C(n, k)⁻¹`) | `v_2(C(6, 3))`; `P_1` at `j = 1, 2` | valuation at least `−⌊log_p n⌋`; `P_1` projects to invariants | `v_2(20) = 2 = ⌊log_2 6⌋`; `1 − 1 = 0`, `1 − 3 + 2 = 0` | agrees |
| 0.3 headline (1), method label (trace, `id/dim V_λ`) | `GL_2`, `λ = (2, 0)`, `p = 2, 3` | `p^e·(dim V_λ)^{−1}·id` maps `∇` into `Δ` | `p = 2`: `(2/3)·xy = (1/3)·2xy ∈ Δ ⊗ ℤ_(2)`; `p = 3`: `e − v_3(3) = 0`, `Δ = ∇` | agrees |
| 0.2 labels (Jantzen; read off the 2.1 bound) | ExIntervalLt in source; `GL_2`, `p = 5`, `a = 3, 4` | exponent `0` for `w < p` | source: bound `C(N,2)·log_l w`, `= 0` if `w < l`; `C(3, i)`: 1, 3, 3, 1; `C(4, i) ≡ (−1)^i` mod 5 | agrees |
| 1.1 headline (2), origin label (Hara–Miyazaki–Namikawa) | `N = 3`; `λ = (2,1,0), σ = (1,0)`; `λ = (2,0,0), σ = (1,0)` | same `ξ`; integral with `c_Br` | their Lemma 2.4 exponents `λ_k − μ_k`, `μ_k − λ_{k+1}` match transposed; `c_Br = 1`, resp. `−1 ≤ 9` | agrees (C03 on "published") |
| 2.1 (c) and the References list | ExIntervalLt statement | list omits (c) | ExIntervalLt is (c), with any interval length `w` | C02 |
| 2.1 headline (3), block cut | `GL_2`, `λ = (2, 0)`, `ℓ = 2` | `ex ≤ ⌊log_ℓ w⌋` | `ex = v_2(C(2,1)) = 1 = ⌊log_2 3⌋` | agrees |
| 2.2 corrected sentence (cofactor substitution keeps type) | `GL_3`: `(2,1,0)`, `(2,0,0)`, `(3,1,0)`, `M = λ_0`; `GL_2` `(2,0)` | `∇(λ) → ∇(λ*)`, `Δ(λ) → Δ(λ*)` | ranks 8, 6, 15: both equalities hold, `Δ ↦ ∇*` fails; `x², 2xy, y² ↦ x², −2xy, y²` | correction right |
| 3.1 method label (`Δ_K·Δ_K(∂)P = ∏(a_t + K − 1 − t)P`) | `K = 2`, `P = x00·Δ_2`, `a = (2, 1)` | factor `3`, `‖P‖² = H(2, 1)` | `Δ_2(∂)P = 3·x00`; `⟨x00, 3x00⟩ = 3 = H(2,1)`; source proves it by `capelli_hw`, `fock_del` | agrees |
| 3.1 Corollary of ClassicalGroups §6.6a | `K = 1, 2`; `f = det x` | clause is that theorem | §6.6a shift `k − c` (`c` from 1) = `K − 1 − k`; both sides `2f`; `A_1(0) = E_11` | identical |
| 3.2 headline (4), method label (Cauchy–Binet) | `λ = (2, 0)` | Gram dets inverse; lower bound | `det Gram(∇) = 1/2`, `det Gram(Δ) = 2`; entries `≥ 1/(N^{|λ⁰|}c_λ) = 1/4`, `(1/4)³ ≤ 1/2` | agrees |
| 3.3 Corollary of Arakelov §1A.4; Gaudron 5.7 (2) | `ℤ ⊕ (ℤ, Gram 1/4)`; `ν = 1` Check | `μ_max` of sum = max | lines `0`, `log 4`, whole `log 2`: `μ_max = log 4`; Gaudron: error `log max A`, `A = 1` hermitian | agrees |
| 3.4 origin label (Bost 2001, Proposition 4.5) | Bost (4.11); `k = 1` Check | slope inequality | (4.11): `deg_n E ≤ rk E·(μ̂_max F + h)` for injective `φ`; Check: `s·log N(𝔞)` both sides | agrees |

- Source locators checked against the text: Gaudron 2008, Propriétés 5.7 (2) (printed pp. 65–66; equality for hermitian sums since `A(E) = 1`); Bost 2001, Proposition 4.5, (4.11); Hara–Miyazaki–Namikawa, §§2.3.1–2.3.2 (Proposition 2.1, Lemmas 2.3, 2.4); Caracciolo–Sokal–Sportiello, abstract and Corollary 1.3.
- Formal proof (operator-held copy of the public source): ExIntervalLt, InducedSimpleLowestAlcove with the theorem proving it, HookNorm with `hookNorm`, LemmaDLast, and `cofMap`, NablaDual, WeylDual (`LastGradedOfGradedAlone.lean`) opened. All 16 statement names cited in the changed passages and their routes are present in the kernel export.
- Cross-roadmap citations resolved at this head: ClassicalGroups §§6.6, 6.6a; ArakelovGeometryAndAbelianHeights §§1A.3–1A.5 and 1.6a (normalisation `μ^_n` = `μ̂`); SlopesOfHermitianVectorBundles §§1.2, 1.3, 1.7, 2.1, 2.2 (now a corollary of §1A.4), 2.4, 3.5; HermitianFormsAndLattices §4.0; ReductiveGroups §§9A, 10A, 10B, 10D; PotentialAutomorphyInfrastructure §§0.4–0.6; GroebnerGeometry G5. None of them removed or renumbered by this pull request.
- Ownership: on main and at the open heads, the Capelli identity is stated only in ClassicalGroups §6.6a (as owner) and in 3.1 (as a record kept here). The orthogonal-sum maximal slope is owned by ArakelovGeometryAndAbelianHeights §1A.4, and SlopesOfHermitianVectorBundles §2.2 is its corollary.
- Dependency check: `depcheck: 11 roadmaps, 90 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks: the worker's run passed every check. My re-run: every check passes except the one for changes outside the folder. The pull request changes no file outside the folders this brief names as its own.
- Elaboration: `Suggested.lean` is unchanged by the change and elaborates with 9 `sorry` warnings and nothing else. Its signatures were not re-checked with `#check`: no declaration changed, and the worker's signature check found no lost binder.
- Overlap check: read ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties, FiniteReductiveGroups, NonintersectingPathsAndLGV, ThetaKernelsForUnitaryDualPairs, ThetaLiftsForDefiniteUnitaryGroups (open), GluedTargetAndDivisionInequality, TensorInductionAndFiniteGroupInputs, LocalGainOfThetaChains (main); nothing shared. The two objects whose owner the change moves are owned by ClassicalGroups §6.6a and ArakelovGeometryAndAbelianHeights §1A.4.

Source independence: changed passages only; 9 passages compared with 5 sources (Gaudron 2008, Bost 2001, Hara–Miyazaki–Namikawa 2023, Caracciolo–Sokal–Sportiello 2009, the formal proof's Lean source); no shared wording. The largest share of locators is [FormalProof], about 50 of 87. Arrangement not compared: no layer is added, removed or reordered.

Research link: the lattices, branching maps, exponents and slopes of Layers 0–3 are inputs of the theta-chain roadmaps toward Alpöge's 2026 proof of the Riemann hypothesis for Dirichlet L-functions. 1.1 is the integral branching that Hara, Miyazaki and Namikawa (2023) use for the uniform integrality of Rankin–Selberg critical values. This rests on the README and on HMN23 §2.3.

## Not verifiable

- Carter and Lusztig (1974), §2.2, Theorem 3.8, Corollary 2 of 4.1 (labels of 0.2 and 1.1): the publisher's copy is paywalled, and the EuDML record could not be reached (expired certificate). A copy on a third party's course page was not used.
- De Concini, Eisenbud and Procesi (1980) (label of 0.1): the publisher's copy is paywalled.
- Jantzen (1977), both papers (label of 0.2): one is paywalled, and the other's landing page is on a host with no recorded licence class.
- Jantzen, Representations of algebraic groups (2003), II.8 (label of 3.2): paywalled book, not attempted.

Automatic checks set aside as false positives: on a re-run of the checks for this folder alone, the check for changes outside the folder counts the 118 files of the other roadmap folders this pull request owns as changes outside the folder.

## Source issues

- none

## For the human reviewers

- none
