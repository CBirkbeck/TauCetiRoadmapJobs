# Review of HochschildHomologyAndHKR (pull request #2447 at d18fb7a)

**Verdict:** accepted

**Summary.** Accepted: no finding. The folder is unchanged since the previous review of d18fb7a, so this round read the pull request's title and description against the head: the layer list, the headline statements, the supplier list and the account of the étale base change all agree with the README and `Suggested.lean`, and the roadmap the description used to list without the README naming it is gone. One small correction (the description's list of RefinedTraceMethods sections omits §1.10, which a Check of §6.3 cites) and one carried format note, neither blocking; one point of scope is left for the human reviewers, as before.

## C01 — The description lists RefinedTraceMethods §§1.1, 1.8 and 1.9 as the sections the README uses, but a Check of §6.3 also takes a value from §1.10

The description says "an open roadmap pull request, which merges first and is listed in the merge order below: RefinedTraceMethods §§1.1, 1.8 and 1.9". The second Check of §6.3 (README line 1326) cites "RefinedTraceMethods §§1.1 and 1.10" for the derived value `HH₂(𝔽_p/ℤ) = 𝔽_p`, which it sets against the classical `HH₂(𝔽_p,𝔽_p) = 0`; §1.10 of RefinedTraceMethods at its open head does state that value (its item on the Hochschild homology of `𝔽_p` over `ℤ`). A reader of the description who checks the citations against the listed sections finds one more. Either add to the description that §1.10 is cited once, in a Check of §6.3, for a value and for no statement of a layer, or write "§§1.1, 1.8, 1.9 and, in one Check, 1.10". The README's own contract for RefinedTraceMethods could carry the same clause; that is an offer, not a request.

## N01 — Three lines of `Suggested.lean` exceed 100 characters

Lines 19, 101 (138 characters, in the docstring of `hochschildBimoduleCocycles`) and 264, unchanged since the previous review.

## Questions for the author

- §9.1 and the docstring of `cohomological_hkr` read "Loday98 §3.4, Theorem 3.4.4, and Weibel94 §9.4, Theorem 9.4.7, over a field". Is Loday's Theorem 3.4.4 not stated for a smooth algebra over a commutative ring, so that "over a field" should attach to Weibel's theorem only? Neither text could be read (both are cited by locator only). Carried from the previous review; the passage is unchanged.

## Previous findings

The previous review, of d18fb7a, listed no finding (no R01). Its other remarks:

- C01 (the description listed CyclicHomologyLieHomologyAndQuasiFreeAlgebras among the roadmaps the README names) — repaired: the description now lists "DerivedDeRhamCohomology, NoncommutativeGeometry, BanachAlgebras, LanglandsParameterStacks, ZigzagPreprojective, and DerivedModuleAlgebra §0.5", each of which the README names.
- N01 — not repaired: written again above as N01.
- The question on Loday98 Theorem 3.4.4 is carried above; the passage is unchanged.

## Verified sound

| Statement | Instances | Values computed (left / right) | Result |
|---|---|---|---|
| Description: `homological_hkr`, antisymmetrisation `Ω^n_{R/k} → HH_n(R,R)` bijective for smooth `R`, every `k` | `R = k`; `R = k[x]`, `n = 1, 2`; `k = 0`; control `k[x]/(x²)` | `R = k`: `Ω⁰ = k = HH₀`, higher both 0; `k[x]`: `dx ↦ [1⊗x]`, `HH₁ = R·dx`, `HH₂ = 0 = Ω²`; control: `Ω² = 0`, `HH₂ ≠ 0`, not smooth | agrees with §9.1 and the Lean signature (`Algebra.Smooth`, no projectivity) |
| Description: `cohomological_hkr`, cup products of derivations, `R` smooth and `k`-projective; determinant map fails without `1/n!` | `𝔽₂[x,y]`, `n = 2`; `ℤ[1/2]` over `ℤ` | `⟨∂_x,∂_y⟩ = ∂_x∪∂_y − ∂_y∪∂_x`, class `2[∂_x∪∂_y] = 0` in characteristic 2 while `[∂_x∪∂_y]` generates; `ℤ[1/2]` étale, not ℤ-projective, excluded by `Module.Projective k R` | agrees with §9.2 and the Lean signature |
| Description: the map of RefinedTraceMethods §1.8, `B ⊗_A HH_n(A/k) → HH_n(B/k)`, `b⊗[c] ↦ b·[φ(c)]`, bijective | `A = k[x]`, `B = k[x,1/x]`, `n = 0, 1` | `n = 0`: `B⊗_A A → B`, identity; `n = 1`: `B⊗_A A·dx → B·dx`, `1⊗[1⊗x] ↦ [1⊗x]`, bijective | §1.8 at the open head states this map with this formula |
| Check of §6.3 that C01 touches: classical against derived `HH₂` of `𝔽_p` over `ℤ` | `k = ℤ`, `A = M = 𝔽_p` | classical: `C_n = 𝔽_p`, `b_n = Σ_{i=0}^{n}(−1)^i` = 1 (`n` even), 0 (`n` odd), so `HH₂ = ker b₂ = 0`; derived: `𝔽_p·u`, RefinedTraceMethods §1.10 | Check true; C01 is about the description only |
| Description against head | 9 layers and their titles; 18 Lean declarations; suppliers | layers 1–9 as listed; DGAInfinity Layers 0, 1, 8, DerivedModuleAlgebra §0.K.1, EulerSystemsAndKolyvaginSystems §6.1, IntegralIwasawaTheory §12.6, KTheoryFiniteLocalFields §4.0 on main; RefinedTraceMethods open; §1.10 unlisted | C01 |

The rows for the untouched statements stand as in the previous review, of d18fb7a.

- Description sentences checked against the head: the summary block (three paragraphs), the nine layer bullets, the folder contents (README, `Suggested.lean`, `metadata.toml`; nothing changed outside the folder), the two supplier bullets, the paragraph on §1.8, the paragraph on roadmaps named but not consumed.
- Cross-roadmap citations resolved again: DGAInfinity Layers 0, 1, 8; DerivedModuleAlgebra §§0.5, 0.K.1 (README line 573 there); EulerSystemsAndKolyvaginSystems §6.1 (line 3726); IntegralIwasawaTheory §12.6 (line 1821); KTheoryFiniteLocalFields §4.0 (line 606, the HKR comparison with no map named), all on main; RefinedTraceMethods §§1.1, 1.8, 1.9, 1.10 at its open head (lines 41, 335, 361, 402), the items cited by name present, §1.8 with the `B`-linear map and its formula.
- "No other roadmap cites this one": a search of main and of the open roadmap heads for the roadmap's name finds it only in its own folder.
- The Lean name `TauCeti.StarkSystems.toExteriorBidual` (README line 1494) is cited as the carrier of a supplier's statement, as the supplier contracts say; untouched text, passed before.
- Dependency check: `depcheck: 126 roadmaps, 1403 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line.
- Automatic checks: all passed. Elaboration: `lake env lean` on `TauCetiRoadmap/HochschildHomologyAndHKR/Suggested.lean` gives 10 `sorry` warnings and nothing else; the file is unchanged, so the signatures and the one-tactic probe stand.
- Source locators: none in a changed passage (no passage changed); the seeded sample falls in no changed passage. Declared gaps: none.

Overlap check: read DGAInfinity (main and its open revision), NoncommutativeGeometry, DerivedModuleAlgebra (the results-and-headings list is empty); nothing changed, and the shared objects and owners stand as in the previous review (DGAInfinity Layer 8, DerivedModuleAlgebra §§0.5 and 0.K.1, NoncommutativeGeometry N1, KTheoryFiniteLocalFields §4.0, RefinedTraceMethods §§1.8–1.9, each cited).

Source independence: changed passages only: no passage of the folder changed, so there was nothing to compare; largest share Ginz05, 47 of 133 locators, and the contents comparison with Ginz05 stands as independent (no layer added, removed or reordered).

Research link: the headline targets are the theorem of Hochschild, Kostant and Rosenberg (1962, Theorems 5.1–5.2) and its integral form used by Antieau and Vezzosi (2020, Proposition 1.2) for HKR in characteristic p; Gerstenhaber (1963) for the cup product. Rests on the README's sources HKR62 and AV20, read in an earlier review.

## Not verifiable

- Loday98 §3.4, Theorem 3.4.4, and Weibel94 §9.4, Theorem 9.4.7 (§9.1): cited by locator only, no legal text available.
- The other locators into Loday98, Weibel94, CE56, Ger63 and Mat86 remain cited by locator only, as in the previous review.

## Source issues

- none

## For the human reviewers

- Scope: KTheoryFiniteLocalFields §4.0 on main has the target `HH_n(A/k) ≅ Ω^n_{A/k}` for smooth `A`, map unnamed, on derived chains; §9.1 here proves it for the antisymmetrisation on the classical complex, as a stated variant.
