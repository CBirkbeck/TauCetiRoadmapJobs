# Review of IntegralWeylModulesOfGeneralLinearGroups (pull request #2888 at a356b2a)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/IntegralWeylModulesOfGeneralLinearGroups/`
**Verdict:** accepted

**Summary.** Accepted. The small correction of the previous review is repaired: 2.1 (b) now says which factor of `S₀` acts first, and it is the order for which the invariance holds. The sentence added to the route of 0.2, the simplicity of the induced module on the closed lowest alcove over a field of characteristic `p`, agrees with the statement of the formal proof it cites and with the instances I computed. There is one small correction (the ownership paragraph still says the closed-alcove form is not stated here) and no format note; scope and licence are left to the human reviewers.

## C01 — The ownership paragraph says the closed-alcove form of 0.2 "is not stated here", and the route of 0.2 now states part of it

A reader of "Scope and ownership" (README line 394) is told that the closed-alcove form of 0.2 "is Jantzen's; over the integers of a finite extension of `ℚ_p` it is PotentialAutomorphyInfrastructure §§0.4, 0.6, and it is not stated here". The route of 0.2 (line 109) now states one clause of that form, with a locator: for a field `k` of characteristic `p` and `λ_i − λ_j + (j − i) ≤ p` for all `i < j`, the induced module `∇_k(λ)` is nonzero and simple. The route itself was reworded to match ("the closed-alcove form of the three equalities is not a target of this roadmap"); the ownership paragraph was not.

The same wording would do there: "…and the closed-alcove form of the three equalities is not a target of this roadmap; the simplicity of `∇_k(λ)` on the closed alcove is recorded in the route of 0.2 with its locator."

## Previous findings

- C01 (order of the product `S₀`) — repaired: "written from left to right in the order in which the columns increase within a row and the rows decrease (so that the rightmost factor `𝔭_{0,N−1}` is applied to `T` first and `𝔭_{a−1,a}` last)".

The previous report had no finding (R).

## Verified sound

| Statement | Instances | Values computed on each side | Result |
|---|---|---|---|
| 0.2 route, new sentence: `∇_k(λ)` nonzero and simple when `λ_i − λ_j + (j − i) ≤ p` for all `i < j` | `GL_2`: `p = 3`, `λ = (2,0)`, `(3,0)`; `p = 2`, `λ = (1,0)`, `(2,0)`; `GL_1` | `(2,0)`: `3 ≤ 3`, `Sym²k²` simple; `(3,0)`: `4 > 3`, excluded, `⟨x³, y³⟩` stable; `(1,0)`: `2 ≤ 2`, simple; `(2,0)`: `3 > 2`, excluded, `⟨x², y²⟩` stable; `GL_1`: no condition, rank `1` | holds; the bound is sharp at `p + 1` |
| 0.2 new sentence against the source | `GlobalTheory.Published.InducedSimpleLowestAlcove`, in the file the README names | source: `p` prime, field with `CharP k p`, `lam.w i − lam.w j + (j − i) ≤ p` for `i < j`; `nablaSq ≠ ⊥`, every `GL`-stable submodule `⊥` or all | matches; proved there as `inducedSimpleLowestAlcove` |
| 0.2 new sentence against PotentialAutomorphyInfrastructure §§0.4, 0.6 (main) | the interface bullet of §0.4 and the statement of §0.6 | there: `λ₁ − λₙ + n − 1 ≤ p`, `V_λ ⊗ k` simple, `k` the residue field of `O`; here: every field of characteristic `p`; `λ_0 − λ_{N−1} + N − 1` is the maximum of `λ_i − λ_j + j − i` | same bound; cited, not restated as a target |
| 2.1 (b), order of `S₀` (repair) | `(N, a) = (3, 1)` and `(4, 2)` | written `𝔭_{01}𝔭_{02}`, first applied `𝔭_{02}`; written `𝔭_{12}𝔭_{13}𝔭_{02}𝔭_{03}`, first `𝔭_{03}`, last `𝔭_{12}`; the order giving `(1/12)·id` and `(1/40)·id` in the previous review | the valid order |

The rows of the previous review, of `ae37607`, stand for the statements this change does not touch; no Lean statement changed.

- Source locators checked against the text, 1: `InducedSimpleLowestAlcove` in `Development/AbelianVarietyTheory/PublishedTheorems/GlobalTheta/WeylDualWeylLatticesAgreeOfLowestAlcove.lean`, at the commit the README names (`e50d098…`); the file is also in the repository's first commit, where the family index now says files are to be looked up (the two commits differ under `src/` by one unrelated file).
- Cross-roadmap citations resolved, 2: PotentialAutomorphyInfrastructure §0.4 and §0.6, both on main with the closed-alcove bound.
- Consumers: no roadmap on main or at an open head cites 0.2 for the closed alcove.
- Automatic checks: all passed. Dependency check: `depcheck: 136 roadmaps, 1518 edges, 0 problem(s)`. Outside the folder the pull request changes only the family index, which the family carries in every pull request; its README changed since `ae37607` (the source's first commit and licence statement, a section on corrections, one entry moved).
- Elaboration: `Suggested.lean` gives 9 `sorry` warnings and nothing else; the file is unchanged since `ae37607`.
- The pull request's description read against the head: nothing it says is contradicted; the added route sentence changes no section, target, declaration or supplier.

Overlap check: read PotentialAutomorphyInfrastructure §§0.4–0.6 on main; searched ClassicalGroups, SchurWeyl and TensorProductCombinatorics on main and ThetaChainsOnDefiniteUnitaryGroups, CongruenceModulesOfThetaLifts and ThetaKernelsForUnitaryDualPairs at their open heads, by object, for the one object the change adds (simplicity on the closed alcove), with no match in them; their scope stands as read in the previous review; the closed-alcove simplicity over the residue field of a `p`-adic ring of integers is PotentialAutomorphyInfrastructure §0.4 and is cited; nothing else shared.

Source independence: changed passages only; 2 passages compared with 1 source (the formal proof's Lean source, which has no prose), no wording shared; largest share FormalProof; the diff adds, removes and reorders no layer, so the arrangement was not compared again.

Research link: the Weyl and dual Weyl lattices of Kostant 1966 and Jantzen 2003, linkage as in Carter–Lusztig 1974, and Bost's slopes; Layers 0–3 are prerequisites of the theta-chain roadmaps of the family built on Alpöge's 2026 formal proof. Rests on the README (References, Downstream consumers).

## Not verifiable

- Jantzen II.5.6 (the closed lowest alcove): no legal copy, as in the previous review; the new sentence was checked against the formal proof's statement and by instances instead.
- The proof of `inducedSimpleLowestAlcove` in the formal proof: located, its opening lines read, not checked.

## Source issues

- none

## For the human reviewers

- Scope: the source of most targets is one Lean formalization announced on 20 November 2026 (README References, last two entries); it is unpublished and unrefereed.
- Licence: several definitions of `Suggested.lean` (`rowOperation`, `dividedRowOperator`, `weylLattice`, `pieriShapes`, `branchingInteger`) have the bodies of `rowGen`, `rowDiv`, `weyl`, `shapes`, `cCap` in the formal proof, under other names; the family index (line 16) now records that the proof was published without a licence.
- Scope: the family index (`TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/README.md`, line 10) and the description say the family "follows the formal Lean proof"; this folder's README does not.
- Scope: the family index has a new section, "When a roadmap is wrong" (line 45), which sets rules for writers and reviewers of later contributions; whether a roadmap index may carry such rules is a project decision.
