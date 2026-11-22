# Review of SpectralSparsification (pull request #2964 at 54e5a81)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every statement, Check and route constant of Layers 1 to 3 was recomputed and agrees with the text, with the Lean signatures and with the sources at their locators (Spielman's book, Batson–Spielman–Srivastava, Spielman–Srivastava); the supplier citations resolve and the direction of supply is sound. There are no small corrections and four format notes, none blocking. One question is left for the human reviewers: the source with the largest share of locators is an unpublished draft.

## N01 — The letter `M` changes meaning between 3.1 and the routes of 3.2 and 3.3

In 3.1 (lines 322–324) `M` is the inverse `((u + δ) I − A)⁻¹`, and `U_A(v)`, `L_A(v)` are written with `M` and `M²`; in the routes of 3.2 (line 343) and 3.3 (line 377) `M` is the matrix itself and the costs appear as `vᵀ M⁻¹ v`, `vᵀ M⁻² v`. A second letter in one of the two places would spare the reader the translation.

## N02 — "For `v = 0` there is nothing to prove" in the route of 3.2 skips a step

For `t > 0` and `v = 0` (line 346) the conclusion is still that `(u + δ) I − A` is positive definite and `Φ^{u+δ}(A) ≤ Φ^u(A)`; that is the last inequality of the case `t ≤ 0` just above. "For `v = 0` the update is that of `t = 0`" would say so.

## N03 — Step 1 of the route of 2.1 re-derives a fact its supplier already lists

ElectricalNetworksAndRandomWalks 2.1 states, as a bullet, that the grounded Laplacian of a connected network is invertible for every `z`, with the same argument through its 1.2. Step 1 (lines 179–183) and step 1 of 2.2 could cite that bullet instead of repeating the argument.

## N04 — "Copy … verbatim" in 1.1 reads as a target of the library

The sentence at lines 80–82 asks to copy seven declarations of ElectricalNetworksAndRandomWalks. The copy exists only so that `Suggested.lean` elaborates without importing another roadmap; in the library these are the supplier's declarations. Would "1.1 uses `Network`, … of ElectricalNetworksAndRandomWalks 1.1 and 2.1 (restated verbatim in `Suggested.lean`)" be closer to what is meant?

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.1 `IsApprox`, `Network.reweight` | `K₃` vs path with `3/2`; single edge `2` vs `1`; `ε < 0` | Path spectrum `0, 3/2, 9/2` against `3Π`: factors `1/2, 3/2`. Edge: `1 ≤ 1 ≤ 3` holds, `1/2 ≤ 2 ≤ 3/2` fails. `2εL_N ⪰ 0` forces `L_N = 0`. | true; orientation pinned | none |
| 1.2 `cutWeight_le_of_isApprox` | `K₃`/path, `S = {1}, {0}, ∅, V`; any real `ε` | `𝟙_SᵀL𝟙_S = cut(S)`. `{1}`: `2` vs `3 = (3/2)·2`; `{0}`: `1 ≤ 3/2 ≤ 3`; `∅`: `0 = 0`. | true | none |
| 1.3 `effResistance_le_of_isApprox` | `K₃`/path; `H = (1+ε)N`; empty network, `ε = 1`; `ε < 0`; `a = z`; two disjoint edges | `R_N = 2/3`; `R_H = 2/3, 2/3, 4/3`; bounds `4/9, 4/3`, both attained. `ε = 1`: `1/3 ≤ 0` false. `ε < 0` forces `n = 1`, all `0`. | true; `ε < 1` and connectivity needed | none |
| 2.1 `dotProduct_inv_groundedLaplacian_mulVec` | `K₃` grounded at `2` and at `0`; unit path grounded at `0`; `x = y`; `z = y` | `(1/3)[[2,1],[1,2]]`: `2/3`; `b = (−1, 0)`: `2/3`. Path inverse `[[1,1],[1,2]]`: `1` and `2`. `z = y` reduces to the definition. | true | none |
| 2.2 `measureReal_not_isApprox_le` | `K₃`, `ρ = 1`, `ε = 1/2`; `n = 1`; two disjoint edges; `ε = −1`; `p(e) ∈ {0, 1}` | `E(σ−1)² = 1/p − 1`; `E X² = (ρ−ℓ)Y ⪯ ρY`; `‖X‖ ≤ ρ`. `K₃`: failure `7/27`, bound `4e^(−3/28) > 1`, count `2 = (n−1)/ρ`. `n = 1`: `0 ≤ 0`. | true; constants are those of `matrix_bernstein` with `L = ρ`, `v ≤ ρ` | none |
| 2.2 parameter Check and negative controls | `ρ = 3ε²/(8 ln 4(n−1))`; disjoint edges `ρ = 1/100`; `ε = −1`, `ρ = 1/10` | Exponent `≥ 3ε²/(8ρ) = ln 4(n−1)`, bound `1/2`. `6e^(−75/7) < 1` against certain failure; `4e^(−15/2) < 1` against certain failure. | true | none |
| 3.1 potentials and costs | `A = 0`; `diag(0,1)`, `u = 2`; singular shift; `n = 0` | `n/u`, `−n/l`; `1/2 + 1 = 3/2`; singular: inverse `0`, potential `0`. Costs match BSS `U_A`, `L_A` (Lemmas 3.3, 3.4). | true | none |
| 3.2 `upperPotential_add_le` | `diag(0,1)`, `u = 2`, `δ = 1`, `v = (1,1)`; `t ≤ 0`; `δ = −2`; `n = 0` | `vᵀM²v = 13/36`, gap `2/3`, `U = 11/8`; `t = 8/11`: `5/6 + 2/3 = 3/2`, equality; top eigenvalue `(27+√377)/22 ≈ 2.11`. `δ = −2`: `−1`. | true; `δ > 0` needed | none |
| 3.3 `lowerPotential_add_le` | `diag(1,10)`, `l = 0`, `δ = 1/2`, `v = (1,0), (0,1)`; `n = 1` equality; `n = 0` | `L = 378/191`; `t = 191/378`: `40/19 − 191/190 = 11/10`, equality. `v = (0,1)`: `L = −18/191`, eigenvalue `−11/18`. `n = 1`: `L = 0`, vacuous. | true; `t ≥ 0` needed | none |
| 3.4 `exists_barrier_step` | `n = 0`; `m` empty; `n = m = 1`, `δ_U = −1`; zero vectors | `Σ U ≤ 1/δ_U + ε_U ≤ 1/δ_L − ε_L ≤ Σ L`; `Φ_l < 1/δ_L` strictly, so `λᵢ − l > δ_L`. Control: `0 ≤ 1` holds, `−t < 0`. | true; `δ_U > 0`, `Nonempty m` needed | none |
| 3.5 `exists_sparse_weights_isotropic` | `d = 4, 9`; `d = 4, n = 1`; `d = 1/2`; `d = 1`; `n = 0`; `ε = 2, n = 2` | `κ_4 = 9`, `κ_9 = 4`; `1/δ_U + ε_U = 1 − 1/√d`; `u₄/l₄ = 18/2 = 9`; at `q = dn` ratio `κ_d`; `l_Q ≥ n(d − √d)`. `d = 1`: `κ = 0` in Lean. | true; `d > 1` needed | none |
| 3.6 `exists_sparse_reweight` | `n = 0, 1`; no edges; `K₃`, `d = 1/2`; disconnected `N` | `⌈d·(−1)⌉₊ = 0`, `s = 0`. `Σ w_e w_eᵀ = I_r`, `r ≤ n − 1`, count `⌈dr⌉`. Rescaled `ε = 2√d/(d+1)`: `4/5`, `3/5`. | true; no connectivity needed | none |
| Layer 3 example family | rows `(1,2,2)/3`, `(2,1,−2)/3` | Norms `9/9`, `9/9`; inner product `(2+2−4)/9 = 0`: isotropic. | true | none |

- Source locators checked against the text: 31 (Sp 19, BSS 11, SS 1); all correct, printed pages included.
- Library declarations opened at the pins: 24 in Mathlib (among them `Matrix.le_iff` Analysis/Matrix/Order.lean:54, `Matrix.PosDef.inv` LinearAlgebra/Matrix/PosDef.lean:590, `iIndepFun.precomp` Probability/Independence/Basic.lean:323, `le_algebraMap_iff_spectrum_le` Unital.lean:1058), 3 in Tau Ceti (`Matrix.isUnit_add_vecMulVec_iff`, `Matrix.inv_add_vecMulVec` at LinearAlgebra/Matrix/SchurComplement.lean:102, 113; `LinearMap.IsSymmetric.eigenvalue_mono` at Analysis/InnerProductSpace/CourantFischer.lean:363). Tau Ceti's rank-one resolvent trace identity is stated off the real axis only and does not cover the barrier shifts.
- Cross-roadmap citations resolved: 8 (ElectricalNetworksAndRandomWalks 1.1, 1.2, 2.1 twice, 2.2, 2.5, 3.3 at its open head; RandomMatrices 2.6 on main). The seven copied declarations are identical to the supplier's.
- Dependency check: `depcheck: 168 roadmaps, 1958 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks: all passed. Elaboration: `sorry` the only warning. One-tactic probe (`rfl`, `simp`, `infer_instance`, `exact?`) on a copy: none of the 9 theorems closes.
- Elaborated signatures of all 22 declarations compared with the README: generality agrees; `Network.graph` carries no `Fintype` binder, as in the supplier (it needs none).
- Pull request text read against the head: counts (9 theorems, 12 definitions, one structure, seven copied), suppliers and scope agree with the files.
- Overlap check: read ElectricalNetworksAndRandomWalks, LaplacianEigenvaluesOfGraphs, AnalysisOnTheSierpinskiGasket, RandomMatrices; shared objects: networks, Laplacian and effective resistance (owner ElectricalNetworksAndRandomWalks, cited), matrix Bernstein (owner RandomMatrices, cited); sparsification is excluded by LaplacianEigenvaluesOfGraphs and owned by no other roadmap.

Source independence: 14 passages compared with 3 sources, none shared; largest share Sp, 18 of 30 locators; contents compared with Sp (Chapters 32 and 33) and BSS §3: independent (the order of 3.1 to 3.6 is forced by their dependency lines; Layer 1 and 2.1 have no counterpart section, and 2.2 takes another route).

Research link: Layer 2 is the sampling theorem of Spielman and Srivastava (arXiv:0803.0929) and Layer 3 the theorem of Batson, Spielman and Srivastava (arXiv:0808.0163), whose barrier method BSS §5 and Sp §33.8 connect to the Kadison–Singer problem; rests on the README's references and on Sp and BSS as read.

## Not verifiable

- The numbering of the published versions of BSS and SS was not compared with the arXiv versions; the README cites the arXiv versions, which are the ones read.

## Source issues

- **Error** in Sp at Theorem 33.3.1, p. 265: the source says the two-sided bound with at most `⌈n/ε²⌉` vectors holds for every positive `ε`; it should be for `0 < ε < 1` (for `n = 2`, `ε = 2` one vector cannot dominate the identity); affects a stated result.
- **Misprint** in Sp at Theorem 33.4.1, proof, p. 266: the source says the last bracket of the verification contains the quadratic form of `A`; it should be the quadratic form of the inverse of `A`; affects nothing.
- **Error** in BSS at Lemma 3.4, proof, p. 12: the source says the two hypotheses give the least eigenvalue strictly above `l + δ_L`; it should be strictly only in dimension at least two (dimension one allows equality, where the cost is undefined); affects the proof.
- **Gap** in BSS at Lemma 3.5, p. 12: the source says condition (3) alone suffices; it should also assume `δ_U > 0` (in dimension one, `A = 0`, `u = 1`, `l = −1`, both bounds `1`, `δ_U = −1`, `δ_L = 1/2` satisfies (3) and the conclusion fails); affects a stated result.
- **Gap** in BSS at Theorem 3.1, p. 5, and its proof, p. 15: the source says at most `dn` nonzero weights after `dn` steps; it should be `⌈dn⌉` steps and weights when `dn` is not an integer; affects the proof.

## For the human reviewers

- Scope and licence: the source with the largest share of locators (Sp, 18 of 30) is an unpublished "incomplete draft" of a book, read on its author's page; the headline theorems of Layers 2 and 3 are also in BSS and SS, cited in their arXiv versions.
