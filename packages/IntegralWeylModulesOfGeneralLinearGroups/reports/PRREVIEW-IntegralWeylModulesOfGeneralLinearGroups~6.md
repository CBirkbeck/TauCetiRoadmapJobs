# Review of IntegralWeylModulesOfGeneralLinearGroups (pull request #2888 at ae37607)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/IntegralWeylModulesOfGeneralLinearGroups/`
**Verdict:** accepted

**Summary.** Accepted: the one finding of the previous review is repaired. The Capelli identity is now a target of 3.1 and the invariance of the ordered product of the root projectors a step of 2.1 (b), each owned here with a locator; both statements agree with the formal proof's and hold on every instance I recomputed (the identity for `K ≤ 3`, the invariance for six cuts with `N ≤ 4`). The six earlier small corrections are repaired. There is one new small correction and no format note; scope and licence are left to the human reviewers.

## C01 — The order of the product `S₀` in 2.1 (b) decides the statement, and the text does not say which factor acts first

The new step of 2.1 (b) (README line 222) asserts that `S₀(T)` is killed by every `E_{cd}`, with `S₀` "in the order in which the columns increase within a row and the rows decrease, applied to `T`". Read as a written product (leftmost factor `𝔭_{a−1,a}`, rightmost `𝔭_{0,N−1}`, the rightmost acting first) this is the formal proof's `gridP` and the step holds. Read as the order of application it is false: on `End(Sym²ℚ³)`, cut `a = 1`, `T` the projector onto the polynomials in the first variable, applying `𝔭_{01}` first and `𝔭_{02}` second gives an endomorphism that is not `𝔤𝔩_3`-invariant and has `(v_λ, v_λ)` entry `1/36`, while applying `𝔭_{02}` first gives `(1/12)·id`, as the route's `z = 12` requires. The same happens for `(N, a) = (3, 2)`, `(4, 2)` and for `Sym³ℚ³`.

A clause would settle it, for instance "(written left to right, so that `𝔭_{0,N−1}` is applied to `T` first)".

## Previous findings

- R01 — repaired: 3.1 now has "*The Capelli identity.* Prove: for a commutative ring `R`, a `K × K` matrix of variables …" with DetDetId and capelli_determinant_identity as locators; 2.1 (b) states the invariance of `S₀(T)` as a step, with GridInv, RankOne, RankTwo; both are in the ownership list.
- C01 (GroebnerGeometry numbering) — repaired: every citation and the supplier contract now read "GroebnerGeometry G5", the section on main, and the contract's description matches G5 (diagonal leading terms, exchange identities, flag-minor SAGBI and standard-monomial bases).
- C02 (declaration names in the description) — repaired: the description names `pow_smul_dualWeylLattice_le_weylLattice` and `lcm_pow_smul_dualWeylLattice_le_weylLattice`, as the head has them.
- C03 (missing locators) — repaired: 2.1 cites ExZEqO and TensorReal "over every local domain of characteristic `0` in which `ℓ` is not a unit"; 0.3 cites WeylEqDualNabla and NablaEqDualWeyl; 1.1 cites BranchIsometry; the commit named is the one the paths were checked at.
- C04 (hypotheses of the source) — repaired: 0.3a, 0.3 and the References give the residue-field condition of AdmissibleDVR; 2.1 names the two further hypotheses (BaseChange, CoefIn) of the source's theorem for (e).
- C05 (hook-bound docstring) — repaired: the docstring credits the lower bound to `PI.HookBound`, "whose upper bound has the larger base `λ⁰_0 + N`", and the stated upper bound to the beta-number identity.
- C06 (sign in a Check of 1.1) — repaired: "`c_Br = ∏_{j=0}^{4}(j − 5) = −120`, so `|c_Br| = 120 > … = 64`".

## Verified sound

| Statement | Instances | Values computed on each side | Result |
|---|---|---|---|
| 3.1 Capelli identity (new target) | `K = 1, 2, 3`, five random polynomials each; `f = det(x)` | `det(x)·det(∂)f − C(K−1)f = 0` in all 15; on `det(x)`: `det(∂)det = 1, 2, 6`, both sides `K!·det` | holds |
| 3.1 new Check on the shift | `K = 2`, `f = det(x)` | shifted determinant: `2f`; unshifted: `f`; `det(x)·det(∂)f = 2f`; unshifted identity fails on random `f` | holds, and tests the shift |
| 3.1 identity against ClassicalGroups §6.6 | `A_K(u)` at `u = K − 1` | §6.6 diagonal term `u − c + 1`, `c` from `1`: `K − 1 − k` for `k = c − 1`; factors left to right in both | same object |
| 3.1 identity against the source | DetDetId, CapAbsMain, `capelli`, `capA` | source: `mulLeft(det X)·detD = capelli(polE, N − 1)`, diagonal `u − j`; relations: `x` commute, `[d, x] = δ` | matches |
| 3.1 route, value on a highest-weight vector | weight `(a_i + 1)_i` | only `π = 1` survives: `∏_{k<K}(a_k + 1 + K − 1 − k) = ∏(a_k + K − k)` | holds |
| 2.1 (b) invariance of `S₀(T)` (new step) | `End(Sym^d ℚ^N)`: `(N, d, a)` = `(2,2,1)`, `(3,2,1)`, `(3,2,2)`, `(3,3,1)`, `(4,2,2)`, `(4,1,2)` | `S₀(T)` scalar: `1/3, 1/12, 1/4, 1/20, 1/40, 1/24`; `z = 3, 12, 4, 20, 40, 24`; `z·S₀(T) = 1` | holds |
| 2.1 (b) order of the product (C01) | same six, factors applied in the opposite order | not invariant in five of six; `(v_λ, v_λ)` entries `1/36, 1/4, 1/80, 1/80, 1/36` | order matters |
| 2.1 (b) step against the source | GridInv, RankOne, RankTwo, `coef`, `gridP` | `coef j k = (−1)^k j!/(k!(k+j+1)!)`; bound `2K`; rows reversed, columns increasing; rank two with `j`, `j + 1` | matches |
| 2.1 (a), (e) attributions | ExZEqO, TensorReal; the theorem for (e) | local domain, `CharZero`, `ℓ` not a unit; (e) takes `BaseChange` and `CoefIn` as hypotheses | matches |
| 0.3, 1.1 attributions | WeylEqDualNabla, NablaEqDualWeyl, BranchIsometry, NablaDeltaComparisonField | duality over `ℤ` both ways; `⟨io f, io f⟩⟨h, h⟩ = ⟨io h, io h⟩⟨f, f⟩` over `ℂ`; `M` finitely generated, spanning | matches |
| `fischerNormSq_highestWeightVector` docstring | `PI.HookBound` | source upper base `ν_0 + N`; Lean base `λ⁰_0 + N − 1` | docstring now says so |
| 1.1 Check, `λ = (1⁵, 0)` | `∏_{j=0}^{4}(j − 5)` | `−120`; `|c_Br| = 120 > 64` | holds |

The rows of the previous review, of `2aa27fa`, stand for the statements this change does not touch; no Lean statement changed (docstrings only).

- Source locators: 14 statements of the formal proof opened at the commit the README names (`e50d098…`): DetDetId, CapAbsMain, capelli_determinant_identity, `capelli`, GridInv, RankOne, RankTwo, grid_invariance_of_rank_one_two, ExZEqO, TensorReal, WeylEqDualNabla, NablaEqDualWeyl, BranchIsometry, BaseChange with CoefIn; also AdmissibleDVR, NablaDeltaComparisonField, `PI.HookBound`, ExCut. All match the README.
- Cross-roadmap citations resolved, 2: GroebnerGeometry G5 and ClassicalGroups §6.6, both on main.
- Ownership: the Capelli identity and the extremal-projector step are stated in no roadmap on main or at an open head (searched by object); TaylorBoundsAndDepthsOnHeightTwoFormalGroups uses Cayley's identity `det(∂)det^{s+1}`, a different statement.
- Automatic checks: all passed. Dependency check: `depcheck: 171 roadmaps, 1992 edges, 0 problem(s)`. No change outside the folder besides the family index, which is unchanged since `2aa27fa`.
- Elaboration: `Suggested.lean` gives 9 `sorry` warnings and nothing else; no `set_option`; imports `Mathlib` and two `TauCeti` modules.
- The pull request's description read against the head: declaration names, counts (9 theorems, 16 definitions), the two owned classical inputs, G5 and the commit all agree.

Overlap check: read ClassicalGroups, SchurWeyl and TensorProductCombinatorics on main, and LocalGainOfThetaChains, TensorInductionAndFiniteGroupInputs, ThetaChainsOnDefiniteUnitaryGroups, GluedTargetAndDivisionInequality and TaylorBoundsAndDepthsOnHeightTwoFormalGroups at their open heads; the Capelli determinant is ClassicalGroups §6.6 and is cited, its realisation `det(x)·det(∂)` is owned here; nothing else shared.

Source independence: changed passages only; 14 statements compared with 1 source (the formal proof's Lean source, which has no prose), no wording shared; largest share FormalProof; the diff adds, removes and reorders no layer, so the arrangement was not compared again.

Research link: the Weyl and dual Weyl lattices of Kostant 1966 and Jantzen 2003, linkage as in Carter–Lusztig 1974, and Bost's slopes; Layers 0–3 are prerequisites of the theta-chain roadmaps of the family built on Alpöge's 2026 formal proof. Rests on the README (References, Downstream consumers).

## Not verifiable

- The proofs of RankOne and RankTwo in the formal proof: located (theorems `rankOne`, `rankTwo` under `Development/AbelianVarietyTheory/Proofs/DivisorProofs/`), not read; the step was checked numerically instead.
- The classical references (Capelli, Howe–Umeda, Asherova–Smirnov–Tolstoy): cited as attributions without locators; not opened.
- Jantzen II.5.6, II.6, II.8: no legal copy, as in the previous review.

## Source issues

- none

## For the human reviewers

- Scope: the source of most targets is one Lean formalization announced on 20 November 2026 (README References, last two entries); it is unpublished and unrefereed.
- Licence: several definitions of `Suggested.lean` (`rowOperation`, `dividedRowOperator`, `weylLattice`, `pieriShapes`, `branchingInteger`) have the bodies of `rowGen`, `rowDiv`, `weyl`, `shapes`, `cCap` in the formal proof, under other names; that repository states no licence.
- Scope: the family index (`TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/README.md`, lines 9–10) and the description say the family "follows the formal Lean proof"; this folder's README does not.
