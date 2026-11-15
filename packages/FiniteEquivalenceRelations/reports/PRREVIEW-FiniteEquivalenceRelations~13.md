# Review of FiniteEquivalenceRelations (pull request #1929 at 34c9767)

**Verdict:** accepted

No findings. Incremental re-review of the 66 lines changed since 2209712 (README only: Scope and ownership, 3.2's route, 3.3's closing sentences, Research context).

## Previous findings

- R01 — repaired: the description now has “Layer 4: along any map of commutative rings `A → B`, morphisms of descent data descend exactly under the Amitsur equalizer condition; …” and the sources “FGA I (Numdam); Mesablishvili, TAC 7 (2000); Stacks Tags 023G, 08WE, 08XA, 0EUA”.
- R02 — repaired: the description now has “its restriction to the finite local subscheme `Z = V(x₁⁴, (x₁x₂ - x₂²)², x₂⁶)` … not effective over any field, with an explicit obstruction over `𝔽₃`” and “It is this roadmap's own … no published source states it.”

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| 3.2 route, “maximal minors of gcd 1” for `(I + K)ₑ`, `e ≤ 5` | Smith normal form over `ℤ` of the monomial multiples of the 4 generators of `raicuIdeal` and the 6 of `K`, `e = 1..5`; control `e = 6` | ranks `0, 2, 9, 25, 52`; every elementary divisor is `1`. Control `e = 6`: rank `84`, divisors `1⁸³, 4` (rank `83` mod 2) | as stated; the bound `e ≤ 5` is needed |
| 3.2 route, same matrix with the columns `a(x) - a(y)` added | same, `e = 1..5` | ranks `2, 3, 12, 27, 52`; every elementary divisor `1` | as stated |
| 3.2 route, invariants of `O(Z)` of degree `≤ 5` | `dim O(Z)ₑ − (rank difference)` over `ℤ`, hence every field | `0, 2, 1, 1, 2` in degrees `1..5`; `f₁, f₂, f₃, f₁f₂` have differences in the `ℤ`-span of `I + K`; `f₁f₂ = x₁³x₂ − x₁²x₂² ∉ span{x₁⁴, f₂²}` mod every `p`; `dim O(Z)₅ = 6 − 4 = 2` | the stated basis, over every field |
| `not_isEffectiveEquivalenceRelation_raicuArtin` (3.2) | `(J + K)₅` from the differences of `f₁, f₂, f₃, f₁f₂` and the six quintic monomials, plus `K₅` | rank `51` over `ℚ`, divisors all `1`, rank `51` mod `2, 3, 5, 7`; `(I + K)₅` rank `52` over `ℚ` and mod every `p`; degrees `2, 3, 4`: `2, 9, 25` on both sides | `52 > 51` over every field |
| `raicuCocycle_not_mem_differenceIdeal` (3.3), “the same holds over every field” | `(J + K)₅` with the cocycle added | rank `52`, divisors all `1`; `g₁, g₂, g₃` are differences of the invariants `f₁, f₂, f₃`, so `(I + K)₅ = (J + K)₅ + k · cocycle` | the cocycle is outside `(J + K)₅` over every field; the Lean statement (over `ZMod 3`) equals the README target |
| Research context, lengths 3 and 4 over `𝔽₂` | every ideal inside `ker μ`, the three fields of 0.1, then `I = J(B)`, on all ten algebras listed | ideals / equivalence ideals: `k[x]/(x³)` 11 / 3; `k[x,y]/m²` 77 / 5; `𝔽₈` 4 / 2; `𝔽₁₆` 8 / 3; `𝔽₄[ε]` 27 / 7; `k[x]/(x⁴)` 87 / 6; the seven `W`: 2175, 845, 645, 2175, 645, 645, 2175 / 8, 12, 8, 8, 8, 8, 8; none non-effective | as stated over `𝔽₂` |
| Research context, lengths 3 and 4 over `𝔽₃` | same test; nine of the thirteen `W`, at least one in each isomorphism class of the quadric `x², xy, y² ↦ m²/W` (split, anisotropic, degenerate) | `k[x]/(x³)` 16 / 3; `k[x,y]/m²` 229 / 6; `𝔽₂₇` 4 / 2; `𝔽₈₁` 8 / 3; `𝔽₉[ε]` 42 / 8; `k[x]/(x⁴)` 175 / 7; split `W` (six) 3940 / 13; anisotropic `W` (two) 3238 / 7; degenerate `W` (one, `k[x,y]/(xy, y², x³)`) 18496 / 10; none non-effective | as stated |
| Research context, “these are all local `k`-algebras of lengths 3 and 4” | residue degree `d` divides the dimension; Hilbert functions | dimension 3: `(1,1,1)`, `(1,2)`, `d = 3`; dimension 4: `(1,1,1,1)`, `(1,2,1)`, `(1,3)`, `d = 2` (`𝔽_{p²}[ε]`, a coefficient field exists since `𝔽_p` is perfect), `d = 4` | the list is complete; `(1,3)` has `m² = 0` |

The rows for the untouched statements stand as in the previous review, of 2209712.

- Gate rerun (`gate … --base origin/main`): every count `0`, `OK`; the worker's gate, with the targeted build, is `OK`. Dependency check: `depcheck: 245 roadmaps, 2229 edges, 0 problem(s)`, no UPWARD, CYCLE or `moved:` line.
- `lake env lean` on `Suggested.lean`: exit 0, 22 warnings, all “declaration uses `sorry`”. The file is unchanged since 2209712; the signatures of lines 252 and 276 agree with README 3.2 (every field) and 3.3 (`ZMod 3`).
- Nothing outside the folder differs from `origin/main` (`git diff --stat origin/main...HEAD` outside the folder is empty; the files listed as changed since 2209712 come from merging main).
- Pull request text against this head: the title and the four paragraphs agree with the README (Layers 0–4, `Z` of length 15 or 16, `52 > 51`, the sources); no layer, heading, declaration or supplier changed since 2209712.
- Source locator of the changed passages checked (1): fga3 lines 156–164 (p. 212-05), the question that 3.2 answers; the other changed sentences cite no source and say so.
- Citations: AlgebraicModuliForArithmeticGeometry cites §4.2 and PerfectoidSpacesPartII names this roadmap as a consumer of its §5.1; both unchanged. `roadmaps grep 'raicuArtin|raicuCocycle|Raicu'` finds no other roadmap, so 3.2–3.3 have one owner.
- Overlap check: the three closest-roadmap lists in `overlaps.md` are empty; nothing shared. No other open pull request changes this folder, and no cited id is dropped.
- Source independence: 4 passages compared with 3 sources (fga3, kollar2012, raicu2010), changed passages only; none shared, the changed text being this roadmap's own argument; largest share Stacks, 23 of 76 locators; contents not compared again, no layer added, removed or reordered.
- Remark: “nonzero maximal minors” in 3.2 reads as the minors of order the rank (the 56 × 56 minors in degree 5 all vanish); the computation above confirms that reading.

## Not verifiable

- As before: Venken 1971, Philippe 1973, Olivier, Joyal–Tierney 1984, and Mesablishvili 2004a and 2004b are paywalled or not online; cited only for history and in Research context.
- The Buffalo lecture of 11 July 1973 appears only in the description; no source for it is among the README's references.

## Source issues

- none

## For the human reviewers

- Scope: no published source states `not_isEffectiveEquivalenceRelation_raicuArtin` or `raicuCocycle_not_mem_differenceIdeal`; README Scope and 3.2–3.3 now say so. The field-uniform rank argument (`52 > 51`) was recomputed here over `ℤ` (all elementary divisors `1` in degrees `≤ 5`).
- Priority: kollar2012 lines 143–144 call Venken 1971 and Philippe 1973 closely related. An earlier branch commit (c2992349) described Venken 1971, Corollaire 3.1, as a non-effective relation on a 33-dimensional local artinian algebra; 7a81d5f3 dropped it as unchecked. Venken was not read.
- README Research context reports an unpublished exhaustive search and concludes that the smallest length is at least 5 over `𝔽₂` and `𝔽₃`. Reproduced here over `𝔽₂` (lengths 3, 4) and over `𝔽₃` (lengths 3, 4; one `W` per isomorphism class at least): no non-effective example.
