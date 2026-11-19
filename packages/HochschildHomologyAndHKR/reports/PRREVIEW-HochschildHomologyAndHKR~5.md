# Review of HochschildHomologyAndHKR (pull request #2447 at d5f6490)

**Verdict:** accepted

**Summary.** Accepted: no finding. This is an incremental re-review of the 11 lines changed since e98ebdb, all in the supplier contract for RefinedTraceMethods §1.8: the contract now states the étale base change as the bijectivity of the named map `b ⊗ [c] ↦ b · [φ(c)]`, which is what step (a) of §9.1 uses and what RefinedTraceMethods §1.8 states at its open head, and the pull request's description now describes the head. Both small corrections of the previous review are repaired; one format note is carried, not blocking. One point of scope is left for the human reviewers, as before.

## N01 — Three lines of `Suggested.lean` exceed 100 characters

Lines 19, 101 (138 characters, in the docstring of `hochschildBimoduleCocycles`) and 264, unchanged since the previous review.

## Questions for the author

- §9.1 (README line 1842) and the docstring of `cohomological_hkr` read "Loday98 §3.4, Theorem 3.4.4, and Weibel94 §9.4, Theorem 9.4.7, over a field". Is Loday's Theorem 3.4.4 not stated for a smooth algebra over a commutative ring, so that "over a field" should attach to Weibel's theorem only? Neither text could be read (both are cited by locator only). Carried from the previous review; the passage is unchanged.

## Deferred findings

- D01 — resolved: `packages/HochschildHomologyAndHKR/design/plan.json` now has `"gaps": []`; the stale gap on RefinedTraceMethods §1.9 was retired and no target cites a gap.

## Previous findings

The previous review, of e98ebdb, listed no finding (no R01). Its other remarks:

- C01 — repaired: "the `B`-linear map `B ⊗_A HH_n(A/k) → HH_n(B/k)`, `b ⊗ [c] ↦ b · [φ(c)]`, is an isomorphism for every `n`" (README lines 2669–2675); RefinedTraceMethods §1.8 names the same map (its README line 349). Its second point: D01.
- C02 — repaired: the description lists nine layers with Layer 9 (§9.1, §9.2), suppliers "RefinedTraceMethods §§1.1, 1.8 and 1.9", no gap, and `homological_hkr` in the summary.
- N01 — not repaired: written again above as N01.

## Verified sound

| Statement | Instances | Values computed (left / right) | Result |
|---|---|---|---|
| Contract for RefinedTraceMethods §1.8 (lines 2669–2675): `B ⊗_A HH_n(A/k) → HH_n(B/k)`, `b ⊗ [c] ↦ b·[φ(c)]`, bijective for étale `φ`, `k`-flat `A`, `B` | `k[x] → k[x,x⁻¹]`, `n = 0, 1`; `A = B`; non-étale `k[x] → k`, `x ↦ 0`; well-definedness | `n = 0`: `B ⊗_A A = B`; `n = 1`: `B ⊗_A A dx = B dx = HH₁(B)`; identity ↦ identity; `k ⊗ HH₁(k[x]) = k`, `HH₁(k) = 0`; `ba ⊗ [c]` and `b ⊗ [ac]` both ↦ `bφ(a)[φ(c)]` | holds; étale needed; agrees with supplier line 349 |
| §9.1 step (a) (lines 1850–1857), which cites the contract | square `B ⊗_A ε^cl_{A,n}` against `ε^cl_{B,n}` on `b ⊗ r₀dr₁∧⋯∧dr_n` | both paths give `b·Σ_σ sgn(σ) φ(r₀) ⊗ φ(r_{σ(1)}) ⊗ ⋯ ⊗ φ(r_{σ(n)})` | commutes along the named map |
| Pull request text | description against head | 9 layers, §§1.1, 1.8, 1.9, no gap in text; the same at head; "§1.8 states it so" true at the supplier's head | agrees |

The rows for the untouched statements stand as in the previous review, of e98ebdb.

- Cross-roadmap citations resolved for the changed passage: 1 (RefinedTraceMethods §1.8 at its open head 795405e, README lines 335–359: it states that for `k`-flat `A`, `B` the isomorphism is inverse to the `B`-linear map `b ⊗ [c] ↦ b·[φ(c)]` on the homology of the cyclic bar complexes of its §1.1, with the action through the zeroth factor).
- Source locators in the changed passage: none; no library declaration is newly cited (`Algebra.Etale` was opened at the pin in the previous review). The seeded sample does not fall in the changed lines.
- Dependency check: `depcheck: 199 roadmaps, 2189 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line. RefinedTraceMethods is immediately before this roadmap in the merge order. Nothing is changed outside the folder.
- Automatic checks: all passed. Elaboration: `lake env lean` on `TauCetiRoadmap/HochschildHomologyAndHKR/Suggested.lean` gives 10 `sorry` warnings and nothing else; the file is unchanged since e98ebdb, so the signatures and the one-tactic probe stand.
- Declared gaps: none in the README and none in the plan.

Overlap check: read CyclicHomologyLieHomologyAndQuasiFreeAlgebras, DGAInfinity, NoncommutativeGeometry, DerivedModuleAlgebra (the results-and-headings list is empty); the change touches no ownership, and the shared objects and owners stand as in the previous review (DGAInfinity Layer 8, DerivedModuleAlgebra §§0.5 and 0.K.1, NoncommutativeGeometry N1.Cyclic, KTheoryFiniteLocalFields §4.0, each cited); the étale base change is owned by RefinedTraceMethods §1.8 and cited, not restated as a target.

Source independence: changed passages only: 1 passage (the §1.8 contract), which cites no source, so there was nothing to compare; largest share Ginz05, 47 of 133 locators, and the contents comparison with Ginz05 stands as independent (the diff adds, removes or reorders no layer).

Research link: the headline targets are the theorem of Hochschild, Kostant and Rosenberg (1962, Theorems 5.1–5.2) and its integral form used by Antieau and Vezzosi (2020, Proposition 1.2) for HKR in characteristic p; Gerstenhaber (1963) for the cup product. Rests on the README's sources HKR62 and AV20, read in the previous review.

## Not verifiable

- Loday98 §3.4, Theorem 3.4.4, and Weibel94 §9.4, Theorem 9.4.7 (§9.1, which the changed contract serves): cited by locator only, no legal text available.
- The other locators into Loday98, Weibel94, CE56, Ger63 and Mat86 remain cited by locator only, as in the previous review.

## Source issues

- none

## For the human reviewers

- Scope: KTheoryFiniteLocalFields §4.0 on main has the target `HH_n(A/k) ≅ Ω^n_{A/k}` for smooth `A`, map unnamed, on derived chains; §9.1 here proves it for the antisymmetrisation on the classical complex, as a stated variant.
