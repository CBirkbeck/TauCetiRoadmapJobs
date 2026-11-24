# Review of HochschildHomologyAndHKR (pull request #2447 at d18fb7a)

**Verdict:** accepted

**Summary.** Accepted: no finding. This is an incremental re-review of the 4 lines changed since d5f6490, all in the scope paragraph on quasi-free algebras: the paragraph no longer assigns them to a roadmap that is neither on main nor in an open pull request, and what remains (the definition by lifting, the `Ext²` criterion over a field, the comparison through §3.6 and §4.4) is true. One small correction (the description still lists the roadmap the README stopped naming) and one carried format note, neither blocking; one point of scope is left for the human reviewers, as before.

## C01 — The description still lists CyclicHomologyLieHomologyAndQuasiFreeAlgebras among the roadmaps the README names

The description says "The other roadmaps the README names (DerivedDeRhamCohomology, NoncommutativeGeometry, BanachAlgebras, LanglandsParameterStacks, ZigzagPreprojective, CyclicHomologyLieHomologyAndQuasiFreeAlgebras, and DerivedModuleAlgebra §0.5) are not suppliers". At this head the README no longer names CyclicHomologyLieHomologyAndQuasiFreeAlgebras anywhere: the scope paragraph (README lines 2075–2080) now excludes quasi-free algebras without an owner. A reader of the description would look for a roadmap that exists neither on main nor among the open pull requests. Drop that name from the list; if wanted, add that quasi-free algebras are outside the roadmap and owned by none.

## N01 — Three lines of `Suggested.lean` exceed 100 characters

Lines 19, 101 (138 characters, in the docstring of `hochschildBimoduleCocycles`) and 264, unchanged since the previous review.

## Questions for the author

- §9.1 and the docstring of `cohomological_hkr` read "Loday98 §3.4, Theorem 3.4.4, and Weibel94 §9.4, Theorem 9.4.7, over a field". Is Loday's Theorem 3.4.4 not stated for a smooth algebra over a commutative ring, so that "over a field" should attach to Weibel's theorem only? Neither text could be read (both are cited by locator only). Carried from the previous review; the passage is unchanged.

## Previous findings

The previous review, of d5f6490, listed no finding (no R01). Its other remarks:

- N01 — not repaired: written again above as N01.
- The question on Loday98 Theorem 3.4.4 is carried above; the passage is unchanged.

## Verified sound

| Statement | Instances | Values computed (left / right) | Result |
|---|---|---|---|
| Scope paragraph (lines 2075–2080): quasi-free ⇔ `Ext²_{Aᵉ}(A,M) = 0` for all `M`, over a field | `A = k`; `k[x]`; `k[x,y]`; `k[ε]/(ε²)` | `k`: `Ext² = 0`, quasi-free; `k[x]`: bimodule resolution of length 1, `Ext² = 0`, free algebra; `k[x,y]`: `Ext²(A,A) = ⋀²Der = A ≠ 0`, `k⟨x,y⟩/([x,y])² → k[x,y]` has no algebra section; dual numbers: `HH² ≠ 0` | holds |
| §3.6, which the paragraph cites: `HH²(A,M)` ↔ `k`-split square-zero extensions | `k = ℤ`, `A = M = ℤ/2`, extension `ℤ/4 → ℤ/2`; `f = 0` | cochains `C^n = ℤ/2`, `d¹ = id`, `d² = 0`, so `HH² = 0`; `ℤ/4 → ℤ/2` is square-zero, not ℤ-split, not trivial; `f = 0` ↦ `TrivSqZeroExt` | "`k`-split" is needed and stated; over a field every extension splits, as the paragraph says |
| §4.4, which the paragraph cites: `HH^n ≅ Ext^n_{Aᵉ}` for `k`-projective `A` | same `k = ℤ`, `A = ℤ/2`, `M = ℤ/2`, `n = 2` | `HH² = 0`; `Aᵉ = ℤ/2`, so `Ext²_{Aᵉ}(A,M) = 0` as well, but `A` not ℤ-projective and bar complex not a resolution: hypothesis stated in the paragraph ("for `k`-projective `A`") | agrees with §4.4 as written |
| Pull request text | description against head | 9 layers, suppliers §§1.1, 1.8, 1.9, no gap: the same at head; one roadmap listed as named that the README no longer names | C01 |

The rows for the untouched statements stand as in the previous review, of d5f6490.

- Cross-roadmap citations in the changed passage: none remain (the one it had is removed); a search of main and of the open roadmap heads for quasi-free algebras in this sense finds no owner, and CyclicHomologyLieHomologyAndQuasiFreeAlgebras is neither on main, nor in the merge order, nor among the open pull requests, so removing its name is right and creates no unowned prerequisite (no layer uses quasi-free algebras).
- Sections cited by the changed passage and opened: §3.6 (README lines from the heading "3.6 HH² classifies split square-zero extensions") and §4.4 (line 873).
- Source locators in the changed passage: none; no library declaration is newly cited. The seeded sample does not fall in the changed lines.
- Dependency check: `depcheck: 131 roadmaps, 1464 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line. Nothing is changed outside the folder.
- Automatic checks: all passed. Elaboration: `lake env lean` on `TauCetiRoadmap/HochschildHomologyAndHKR/Suggested.lean` gives 10 `sorry` warnings and nothing else; the file is unchanged since e98ebdb, so the signatures and the one-tactic probe stand.
- Declared gaps: none.

Overlap check: read DGAInfinity, CohomologyOfGroups, NoncommutativeFlatness, NoncommutativeGeometry, DerivedModuleAlgebra (the results-and-headings list is empty); the change removes a pointer to a roadmap that does not exist and touches no ownership; the shared objects and owners stand as in the previous review (DGAInfinity Layer 8, DerivedModuleAlgebra §§0.5 and 0.K.1, NoncommutativeGeometry N1, KTheoryFiniteLocalFields §4.0, RefinedTraceMethods §1.8, each cited).

Source independence: changed passages only: 1 passage (the scope sentence on quasi-free algebras), which cites no source, so there was nothing to compare; largest share Ginz05, 47 of 133 locators, and the contents comparison with Ginz05 stands as independent (the diff adds, removes or reorders no layer).

Research link: the headline targets are the theorem of Hochschild, Kostant and Rosenberg (1962, Theorems 5.1–5.2) and its integral form used by Antieau and Vezzosi (2020, Proposition 1.2) for HKR in characteristic p; Gerstenhaber (1963) for the cup product. Rests on the README's sources HKR62 and AV20, read in an earlier review.

## Not verifiable

- Loday98 §3.4, Theorem 3.4.4, and Weibel94 §9.4, Theorem 9.4.7 (§9.1): cited by locator only, no legal text available.
- The other locators into Loday98, Weibel94, CE56, Ger63 and Mat86 remain cited by locator only, as in the previous review.

## Source issues

- none

## For the human reviewers

- Scope: KTheoryFiniteLocalFields §4.0 on main has the target `HH_n(A/k) ≅ Ω^n_{A/k}` for smooth `A`, map unnamed, on derived chains; §9.1 here proves it for the antisymmetrisation on the classical complex, as a stated variant.
