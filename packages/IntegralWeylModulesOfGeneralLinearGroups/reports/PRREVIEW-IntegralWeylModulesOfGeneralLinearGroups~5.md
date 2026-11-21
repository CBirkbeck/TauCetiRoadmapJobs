# Review of IntegralWeylModulesOfGeneralLinearGroups (pull request #2888 at 2aa27fa)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/IntegralWeylModulesOfGeneralLinearGroups/`
**Verdict:** needs changes

**Summary.** Needs changes, for one finding: the routes of 3.1, 3.2 and 2.1 (b) rest on two classical theorems (the Capelli identity, and the factorisation of the extremal projector) that no layer, supplier section or library declaration provides; the README itself says of the first that "no roadmap states" it. The mathematics of the stated results held on everything I recomputed (lattices, exponents, branching integers, Pieri denominators, hook products), and every formal-proof locator of the sample resolves to a statement that matches the README. There are six small corrections and no format note. Scope, licence and the source's commit are left to the human reviewers.

## R01 (P1) — The Capelli identity (3.1, 3.2) and the factorisation of the extremal projector (2.1 (b)) are inputs of the routes that nothing owns

An implementer of 3.1 or 3.2 is sent to a prerequisite that no roadmap will supply, and another roadmap could later state the same identity with no way of knowing that this one needs it. The *Needs* lines of 3.1 (line 294) and 3.2 (line 322) list "the Capelli identity (`det(x)·det(∂)` as the column-ordered Capelli determinant of the polarisation operators of a square matrix of variables), which no roadmap states". I confirmed that: ClassicalGroups §6.6 states the determinant `A_k(u)`, its centrality and its eigenvalues, not its realisation as `det(x)·det(∂)`; TensorInductionAndFiniteGroupInputs Layer 9 treats quantum minors abstractly; a search of every roadmap on main and at the open heads finds the identity nowhere else. The route of 2.1 (b) (line 222) has the same gap: the `𝔤𝔩_N`-invariance of `S₀(T)` is taken from the Asherova–Smirnov–Tolstoy factorisation, "The proof of this factorisation is not given here", and it is in no *Needs* line and has no locator.

The smallest repair is to make each a target of the item it serves, so that this roadmap owns it. In 3.1: "Prove the Capelli identity: for a `K × K` matrix of variables, `det(x)·det(∂)` is the column-ordered determinant of ClassicalGroups §6.6 in the polarisation operators `Σ_s x_{a,s}·∂/∂x_{b,s}`, evaluated at the shift that the route uses", with the formal proof's `capelli_determinant_identity` (`Formalism/PeriodIntegrals/UnitaryGroupMassFormula/HookLengthBound/CapelliOps.lean`, line 125) as locator, and the *Needs* lines of 3.1 and 3.2 pointing to that item; add it to the list of what the roadmap owns. In 2.1 (b): state the invariance of the ordered product of the `𝔭_{ij}` on an endomorphism commuting with the Levi factor as a step to be proved there; the formal proof derives it from rank one and rank two (`GlobalTheory.T.grid_invariance_of_rank_one_two`, used in `Development/AbelianVarietyTheory/Proofs/DivisorProofs/WeylLatticeExactExponentBlockCut.lean`, line 155), which is a locator for it.

## C01 — GroebnerGeometry §§5.1 and 5.3 exist only in an open revision of that roadmap

The README cites GroebnerGeometry §5.1 and §5.3 (lines 39, 44, 46, 124, 385 and the supplier contract at line 415). On main that roadmap has one section for this material, "G5. Minor, flag-minor and invariant algebras", which already contains the diagonal leading terms and the standard-monomial basis of the flag-minor algebra; the numbering 5.1, 5.3 is that of an open revision by the same author. Neither the description nor its merge-order paragraph names that revision. Cite G5 as on main, or name the revision of GroebnerGeometry as a pull request that merges first.

## C02 — The description names two declarations that the head does not have

The description says the sandwich exponent is stated as "`pow_smul_dualWeylLattice_le_smul_weylLattice`, `lcm_pow_smul_dualWeylLattice_le_smul_weylLattice`". At the head they are `pow_smul_dualWeylLattice_le_weylLattice` and `lcm_pow_smul_dualWeylLattice_le_weylLattice` (`Suggested.lean`, lines 128 and 137), and they state the inclusion into `Δ`, not into `(dim V_λ)·Δ`. The counts (9 theorems, 16 definitions) are right.

## C03 — Statements the head calls "this roadmap's argument", or leaves without a locator, are in the formal proof's source

In the copy of the source I read (commit `e50d098`; the README names `8c90877ce`), the base change and the tensor products of 2.1 (a) are stated and proved: `ExZEqO` and `TensorReal` (`Formalism/PieriBlockIdeals/LocalFaithfullyFlat.lean`, lines 47 and 87; proved in `Formalism/PieriBlockIdeals/PieriColumnMinors/RealLocalDeltaNabla.lean`, lines 142 and 255), for every local domain of characteristic `0` in which `ℓ` is not a unit. The README says they "are this roadmap's argument above" (line 222), and lines 206 and 251 and two docstrings of `Suggested.lean` repeat it. Likewise the duality of 0.3 (a) "in the polynomial model over `ℤ`" (line 95) has lost its locator, which is `WeylEqDualNabla` and `NablaEqDualWeyl` (`Formalism/GradedWeylDivisibility/StatementE.lean`, lines 68–74), and the norm form of 1.1 (e) that `exists_integral_branching` states is `BranchIsometry` (`Formalism/BranchSandwichDivisors/StatementW.lean`, line 47). If these are absent at `8c90877ce`, the sentences are right for that commit and the commit is what to update; otherwise cite them.

## C04 — Two descriptions of what the formal proof states leave out hypotheses of the source

The paragraph "Statements of the formal proof" (line 25) promises the source's hypotheses. In 0.3a (line 62) the second form is said to hold "over a complete discrete valuation ring with `p ≥ 5`"; the source's `AdmissibleDVR` (`Formalism/SharpRestriction/GrowthBounds/ObjPol.lean`, line 358) also asks that the residue field contain a field of `p^{n′}` elements with `n′ ≥ 2` even. In 2.1 (line 222), "(e) is `GlobalTheory.T.simple_subquotient_embeds_dualWeyl_reduction_maxWeight`": that theorem takes two further hypotheses, the reduction of `∇_O` modulo `ϖ` (`GlobalTheory.HighWt.BaseChange`) and that the matrix coefficients lie in `𝒜_λ` (`GlobalTheory.HighWt.CoefIn`). Neither changes a result here, since 0.3a and 2.1 (e) have their own routes; a clause at each place would make the attribution exact.

## C05 — The docstring of `fischerNormSq_highestWeightVector` credits its upper bound to a statement with a larger base

The docstring (`Suggested.lean`, lines 329–334) says the theorem "follows from" `HookNorm`, `hookNorm` and `PI.HookBound`. The theorem's upper bound has base `λ⁰_0 + N − 1` (`μ.rowLen 0 + n`); `PI.HookBound` has base `ν_0 + N` (`Formalism/PeriodIntegrals/HookBound.lean`, lines 22–24), which does not give it. README 3.2 says this correctly ("whose upper bound has the base `λ⁰_0 + N`") and proves the sharper bound from the beta-number identity; the bound holds for all 792 partitions I tried (`N ≤ 6`, entries `≤ 6`). The docstring would say the same.

## C06 — A Check of 1.1 compares a negative number with a positive one

Line 176 reads "`c_Br = ∏_{j=0}^{4}(j − 5) = −120 > (2(λ_0 − λ_5))^{N·D₁} = 64`". The value is right (`−120`), and what is meant is `|c_Br| = 120 > 64`.

## Verified sound

| Statement | Instances | Values computed on each side | Result |
|---|---|---|---|
| 0.1 basis and saturation | source `SSBasis`, `DualWeylSat`, `DualWeylIntRat`; 10 weights computed | source: every integral domain, `k × n`; ranks 3, 5, 8, 6, 15, 27, 42, 64 = Weyl dimensions | holds |
| 0.3a invariant projection | `N = 2`, `j ≤ 7`; source `InvInt`, `InvInv` | step-projector sums `1, 0, 0, 0, 0, 0, 0, 0`; source exponent `C(n,2)·log_p(l + n − 1)` | holds |
| 0.3 (b), (b′); Lean local sandwich | 10 weights, `p ∈ {2,3,5,7}`; `n = 0` | `(6,3,0)`, 3: `3 = e`; `(5,2,0)`, 3: `2 = 3 − 1`; least exponent ≤ `e − v_p(dim)` always; `N = 1`: `0 = 0` | holds |
| 0.3 (c); Lean global sandwich | same weights; `GL_2`, `a < 200` | every invariant factor divides `lcm(1..w)^{C(N,2)}`; `max_i v_p C(a,i) = ⌊log_p(a+1)⌋ − v_p(a+1)` | holds |
| 0.2 lowest alcove | `(4,2,0)`, `(2,1,0)` at 3; source `ExIntervalLt` | exponents `0` and `1`; source: `w < ℓ → ex = 0` | holds |
| 1.1 (a), (d); `branchingInteger_ne_zero_and_abs_le` | 491 pairs, `N ≤ 4`; `m = 0` | `c_Br ≠ 0`, bound holds; `4, 4, −36, 576, −120, −1`; `m = 0`: `1 ≤ (−1)^0` | holds |
| 1.1 (a), (e); `exists_integral_branching` | `(2,0)/(1)`; `m = 0` | `io(1) = −x_{00}x_{10}`: `1·1 = 1·1·1`; `m = 0`: `1 = 1` | holds |
| 1.1 (e); `fischerNormSq_branchingVector_le` | `(2,1,0)/(2,0)`; `N = 2` | `3 ≤ 8·3`; `1/C(λ_0−λ_1, σ_0−λ_1) ≤ 1` | holds |
| 2.1 (b); both Lean block cuts | 4 weights, cuts `a = 1, 2`, `ℓ ≤ 5`; `a = 0`; `c₁ = 0` | `(6,3,0)`, 3: `0+1+2 = 3 = ex`; `a = 0`: hypothesis trivial; `c₁ = 0`: `0 ≤ Δ` | holds |
| 2.1 (d) Check | `(3,0)/(2,1)`, `(2,0)/(1,1)` mod 3 | `{0,2} = {2,0}`; `{2,2} ≠ {1,0}` | holds |
| 2.2 definitions; `pieriShapes`, `pieriDenominator` | `D(1,w,1,(2,0))`, `w = 3..6`; `D(1,5,i,(0))` | `4, 10, 18, 28 = (w−2)(w+1)`; `1, 5, 20, 60, 120 = i!·C(5,i)` | holds |
| 2.2 (a); Lean block-first bound | 1611 (weight, `μ`, `ℓ`) cases, `ξ = 0` | exponent ≤ `e_L + v_ℓ(D)` always; 1042 equalities; `(5,2,0)`, `(4,2,1)`: `[1, 36]` | holds |
| 2.2 Checks | `(w,2,0)`, `w = 3, 4, 5`; `(4,1,1)` | `[1,8], [2,10], [1,36]`; `(w−1,3,0)`: `1, 2, 3`; index `3 = w − 1` | holds |
| 2.2 (c) Check | `GL_4`, `(2,1,0,0)`, `ℓ = 7` | `c_W = 12/7`, `⌊c_W⌋ = 1`, true exponent `0` | holds |
| 3.1; 3.2 (a); `fischerNormSq_highestWeightVector` | 10 weights computed; 792 partitions; `μ = ∅` | norms `2, 24, 3, 12, 8, 80, 360, 7560` = hook products; both bounds hold; `1 = 1` | holds |
| 3.2 (b) | `(2,0)`, `(2,1,0)`, `(2,2,0)`, `(3,1,0)`, `(4,2,0)` | indices `2, 3, 8, 4096, 819200000000` = README's Gram determinants | holds |
| 3.3 | 792 partitions; `ν = 1` | `H ≤ (ν!)^{2R₀}(R₀!)^ν` and its log ≤ `4νR·log(νR)` always; `0 = 0` | holds |
| 3.4 | supplier sections read | ideal shift `−log N𝔞/d` (Slopes §2.1), slope inequality (§2.4 (b)): signs as used | holds on its Check |
| Capelli identity (R01) | ClassicalGroups §6.6; all roadmaps searched | §6.6: determinant, centrality, eigenvalues only; identity stated nowhere | unowned |
| GroebnerGeometry citation (C01) | main and the open revision | main: G5 only; revision: §§5.1, 5.3 | open revision |
| Hook bound docstring (C05) | source `PI.HookBound` | source base `ν_0 + N`; Lean base `λ⁰_0 + N − 1` | sharper than source |

- Source locators: 36 of 36 formal-proof statements cited in the README and 11 of 11 cited in `Suggested.lean` docstrings opened in the operator-held source (commit `e50d098`); 29 of them have a proving theorem that I located (not `GTLower`); all match the README's description except as in C03 and C04.
- Library declarations opened at the pin: `DominantWeight.lean` 255, 258; `WeylDimension/Basic.lean` 180; `HookLength/Basic.lean` 138; `BetaNumbers.lean` 241; `Kostant/Form.lean` 125; `CompleteReducibility.lean` 107; `Schur/Pieri.lean` 393; `Schur/Cauchy.lean` 71; `Schur/Basic.lean` 216; `HighestWeight/Lattice.lean` 54; Mathlib `Choose/Factorization.lean` 195, `Multiplicity.lean` 97. No Fischer form, bideterminant or Weyl lattice of `GL_N` in either library.
- Cross-roadmap citations resolved, 27: ReductiveGroups §§9A, 10A, 10B, 10D; ClassicalGroups §§0.4, 4.1, 4.2, 5.1, 6.1, 6.6, Layer 3; SchurWeyl Layers 0, 5, 7; CompactGroups §4.1; TypeAHeckeAlgebras §1.6; LanglandsParameterStacks §4.1; AutomorphicLFunctionsAndLocalFactorsPartII §4.4 (all on main); PotentialAutomorphyInfrastructure §§0.4–0.6, SlopesOfHermitianVectorBundles §§1.2, 1.3, 1.7, 2.1, 2.2, 2.4 (b), 3.5, HermitianFormsAndLattices §4.0 (open heads); GroebnerGeometry as in C01.
- Automatic checks: all passed. Dependency check: `depcheck: 171 roadmaps, 1992 edges, 0 problem(s)`. No change outside the folder besides the family index.
- Elaboration: `Suggested.lean` gives 9 `sorry` warnings and nothing else; the elaborated types match the README, no binder lost.
- One-tactic probe on a copy (`rfl`, `simp`, `omega`, `norm_num`, `infer_instance`, `trivial`): closes none of the 9 theorems.
- Previous findings: the two of the last report on the board (integral branching not stated; the Summary's hypothesis for 0.3a) are repaired at this head. The note on the family index's sentence "The family follows the formal Lean proof" stands and is outside this folder.

Overlap check: read ClassicalGroups, SchurWeyl and TensorProductCombinatorics on main, and LocalGainOfThetaChains, TensorInductionAndFiniteGroupInputs, ThetaChainsOnDefiniteUnitaryGroups, GluedTargetAndDivisionInequality and TaylorBoundsAndDepthsOnHeightTwoFormalGroups at their open heads; the Capelli generators are ClassicalGroups §6.6 and are cited here; the lattices, the sandwich exponent, integral branching and the hook-product norm are owned here and cited by the four family roadmaps; nothing else shared.

Source independence: 47 statements compared with 1 source (the formal proof's Lean source, which has no prose; the announcement has none on this subject), no wording shared; largest share FormalProof, 36 of 39 locators; contents compared with its module tree: independent (Layer 0 draws on four of its directories, Layers 1–3 on two or three each, none one to one).

Research link: the Weyl and dual Weyl lattices of Kostant 1966 and Jantzen 2003, linkage as in Carter–Lusztig 1974, and Bost's slopes; Layers 0–3 are prerequisites of the theta-chain roadmaps of the family built on Alpöge's 2026 formal proof. Rests on the README (References, Downstream consumers).

## Not verifiable

- The formal proof at the commit the README names (`8c90877ce`): the operator-held source is at `e50d098`; paths and names were checked there.
- The classical references (Doubilet–Rota–Stein, De Concini–Eisenbud–Procesi, Kostant, Green, Asherova–Smirnov–Tolstoy, Zhelobenko, Gelfand–Tsetlin, Capelli, Howe–Umeda, Molev, Carter–Lusztig, Donkin, Mathieu, Arakawa–Suzuki, Okounkov–Vershik, Macdonald, Frame–Robinson–Thrall): cited as attributions without locators; not opened.
- Jantzen II.5.6, II.6, II.8: no legal copy; II.5.6 is cited only for the closed-alcove form, which is not stated here.
- 3.3 and 3.4 in general: checked on the instances above and against the source's statement `SlopeE`; the proofs were read, not recomputed.

## Source issues

- none

## For the human reviewers

- Scope: the source of most targets is one Lean formalization announced on 20 November 2026 (README References, last two entries); it is unpublished and unrefereed.
- Licence: several definitions of `Suggested.lean` (`rowOperation`, `dividedRowOperator`, `weylLattice`, `pieriShapes`, `branchingInteger`) have the bodies of `rowGen`, `rowDiv`, `weyl`, `shapes`, `cCap` in the formal proof (`Formalism/GradedWeylDivisibility/StatementA.lean`, `Formalism/PieriBlockIdeals/StatementLD.lean`), under other names; the repository's licence was not read.
- Scope: the family index (`TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/README.md`, lines 9–10) and the description say the family "follows the formal Lean proof"; this folder's README does not.
