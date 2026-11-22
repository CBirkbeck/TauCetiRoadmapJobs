# Review of IntegralWeylModulesOfGeneralLinearGroups (pull request #2888 at 4b745e9)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/IntegralWeylModulesOfGeneralLinearGroups/`
**Verdict:** accepted

**Summary.** Accepted. The folder is unchanged since the previous review; this round read the pull request's title and description against the head, sentence by sentence, and found nothing the head contradicts and no change left unstated. The small correction of the previous review (the description's sentence on how the family relates to the formal proof) is repaired. There are no small corrections and no format notes; scope and licence are left to the human reviewers.

## Previous findings

- C01 (the description said the family "follows the formal Lean proof") — repaired: the description now reads "The results that the family states are those of the formal Lean proof", as the family index does (lines 10–12), and names "the first commit of that repository".

The previous report had no finding (R).

## Verified sound

| Statement | Instances | Values computed on each side | Result |
|---|---|---|---|
| Sandwich exponent, local and global (0.3 (b), (c); `pow_smul_dualWeylLattice_le_weylLattice`, `lcm_pow_smul_dualWeylLattice_le_weylLattice`), which the description cites with `lcm(1, …, λ_0 − λ_{N−1} + N − 1)^{N(N−1)/2}` | `GL_2`, `λ = (2,0)`: `∇ = ⟨x², xy, y²⟩`, `Δ = ⟨x², 2xy, y²⟩` | `p = 2`: `e = 1·⌊log_2 3⌋ = 1`, `2∇ ⊂ Δ`, exact; `p = 3`: `e = 1`, `3∇ ⊂ Δ` holds (not sharp); global: `lcm(1,2,3)¹ = 6`, `6∇ ⊂ Δ` | holds; description, README and Lean agree |
| Branching integer and integral branching (1.1; `branchingInteger_ne_zero_and_abs_le`, `exists_integral_branching`, `fischerNormSq_branchingVector_le`), as the description words them | `m = 1`, `λ = (2,0)`, `σ = (1)` | `D₀ = 1`, `R_0 = {0,1}`, `R_0 ∖ {σ_0} = {0}`, `c_Br = (0 − 0) − (1 − 0) = −1 ≠ 0`, bound `(2 − 0 + 1 − 1)^{1·1} = 2 ≥ 1`; `ξ = x_{00}x_{10}`, `⟨ξ,ξ⟩_F = 1 ≤ 3·2`; norm identity `1·1 = 1·1·1` | holds; the description's four clauses are the four conjuncts of the Lean statement |
| Fischer norm of `v_λ` (3.2 (a); `fischerNormSq_highestWeightVector`) | diagram `(2,2)`: `(x_{00}x_{11} − x_{01}x_{10})²` | coefficients `1, −2, 1` on `x_{00}²x_{11}²`, `x_{00}x_{01}x_{10}x_{11}`, `x_{01}²x_{10}²`: `4 + 4 + 4 = 12`; hooks `3·2·2·1 = 12` | holds |
| The description's count "9 headline theorems … 16 definitions with real bodies" and its list of names | `Suggested.lean` at this head | 9 `theorem`, 16 `def` (9 of the model with the weight spaces, `fischerNormSq`, 3 of branching, 3 of Pieri), no `sorry` in a definition; every name of the description is declared | true |

The rows of the previous reviews, of `4b745e9` and before, stand for the statements this round does not touch; no statement changed.

- The description read against the head, 24 claims: the summary paragraph against the README's Summary (lines 3–9); the Capelli identity `det(x)·det(∂) = A_K(K − 1)` (line 298, ClassicalGroups §6.6) and its use in 3.2 (line 329); the ordered product of the `𝔭_{ij}` in 2.1 (b) (line 222); GroebnerGeometry G5 (lines 39–46); locators at the first commit under `src/` (line 456); what the formal proof states less of in 0.3, 0.3a, 2.1 (a), 3.2 (a) (lines 62, 95, 222, 329); the route of 2.1 (e) through ReductiveGroups §10B without the two further hypotheses (line 222); the frame bound of 3.4 derived in its route (line 368); the family index's entry for this roadmap (index lines 175–179); the Lean names, counts and the docstring's list of what is not statable (2.1 (d), (e); 3.2 (b)–(d); 1.1 (b), (f)); 0.3 (b′) in the README only (line 83). All agree with the head.
- The pull request adds the roadmap (it is not on main) and says so; it removes or renumbers nothing; outside the folder it changes only the three files of the family index, as the description says.
- Automatic checks: all content checks pass; the merge-order check asks for the roadmap to be placed after its last supplier (not a defect), as the description's validation sentence says. Dependency check: `depcheck: 133 roadmaps, 1477 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration of `Suggested.lean` at this head: 9 `sorry` warnings and nothing else.
- Suppliers resolved: ReductiveGroups, GroebnerGeometry, PotentialAutomorphyInfrastructure, ClassicalGroups, SchurWeyl and CompactGroups are on main; HermitianFormsAndLattices is open in #2882; SlopesOfHermitianVectorBundles is open only in the family's aggregate #2954, and the generated dependency block of the description (outside this check) does not list it.
- No source locator was opened again this round: no passage of the folder changed.

Overlap check: no object added or changed this round; the scope of ClassicalGroups, SchurWeyl and TensorProductCombinatorics on main and of LocalGainOfThetaChains, ThetaChainsOnDefiniteUnitaryGroups and CongruenceModulesOfThetaLifts at their open heads stands as read in the previous reviews; the closed-alcove simplicity over the residue field of a `p`-adic ring of integers is PotentialAutomorphyInfrastructure §0.4 and is cited; nothing else shared.

Source independence: changed passages only; no passage of the folder changed, so 0 passages were compared this round; largest share FormalProof (Lean source, no prose); no layer added, removed or reordered, so the arrangement was not compared again.

Research link: the Weyl and dual Weyl lattices of Kostant 1966 and Jantzen 2003, linkage as in Carter–Lusztig 1974, and Bost's slopes; Layers 0–3 are prerequisites of the theta-chain roadmaps of the family built on Alpöge's 2026 formal proof. Rests on the README (References, Downstream consumers).

## Not verifiable

- Jantzen II.5.6 (the closed lowest alcove): no legal copy, as in the previous reviews.
- The description's last clause, "independent audits by a second model family", is a statement about how the text was written and cannot be checked against the head.

## Source issues

- none

## For the human reviewers

- Scope: the source of most targets is one Lean formalization announced on 20 November 2026 (README References, last two entries); it is unpublished and unrefereed.
- Licence: several definitions of `Suggested.lean` (`rowOperation`, `dividedRowOperator`, `weylLattice`, `pieriShapes`, `branchingInteger`) have the bodies of `rowGen`, `rowDiv`, `weyl`, `shapes`, `cCap` in the formal proof, under other names; the family index (line 16) records that the proof was published without a licence.
- Scope: the family index has a section, "When a roadmap is wrong" (line 46), which sets rules for writers and reviewers of later contributions; whether a roadmap index may carry such rules is a project decision.
