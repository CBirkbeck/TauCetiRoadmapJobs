# Review of FiniteEquivalenceRelations (pull request #1929 at 2209712)

**Verdict:** needs changes

## R01 (P3) — The description still leaves out Layer 4

**Location:** Pull request description, first paragraph, which still ends “…and Raicu's theorem that affine toric equivalence relations are effective.”

**Claim:** Previous R06, not repaired. The title and description say nothing about Layer 4 (4.1–4.4, descent of modules along pure maps) or its sources. Layer 4 carries eight of the twenty-two sorried theorems of `Suggested.lean`.

**Witness:** The `Suggested.lean` docstring (lines 42–51) lists README 4.1–4.4. Their theorems are at lines 363, 368, 378, 387, 399, 407, 423 and 437. Summary lines 18–25 state them.

**Repair:** After “…are effective.”, add: “Layer 4: along any map of commutative rings `A → B`, morphisms of descent data descend exactly under the Amitsur equalizer condition; that condition for every module, full faithfulness of descent and comonadicity of extension of scalars are each equivalent to purity of `A → B` (Joyal–Tierney; Mesablishvili 2000); the quotient map `A^R → A` satisfies `Algebra.IsEffective` for every `I` and is comonadic in the flat case; and `Spec B → Spec A` is a universal effective epimorphism of affine schemes iff `A → B` is pure.” Add “FGA I (Numdam); Mesablishvili, TAC 7 (2000); Stacks Tags 023G, 08WE, 08XA, 0EUA” to the Sources line.

## R02 (P3) — The description omits the restored headlines of 3.2 and 3.3

**Location:** Description, first paragraph: “Layer 3: Raicu's non-effective finite relation on `𝔸²` over every field; the effectivity of relations on split square-zero extensions; and Raicu's theorem…”. Second paragraph: “The question is Grothendieck's (FGA III, …)”.

**Claim:** The revert restores two headlines that the text does not mention. The first is a non-effective closed equivalence relation on a finite local scheme, over every field; README 3.2 says it answers Grothendieck's question negatively. The second is the obstruction over `𝔽₃` (3.3). The text presents the question as background only.

**Witness:** `Suggested.lean` lines 252 and 276 (`not_isEffectiveEquivalenceRelation_raicuArtin`, `raicuCocycle_not_mem_differenceIdeal`); README lines 476–478: “This answers negatively, over a field, the question of FGA III, §2, p. 212-05 … this roadmap's own”.

**Repair:** Replace the Layer 3 sentence with: “Layer 3: Raicu's non-effective finite relation on `𝔸²` over every field; its restriction to the finite local subscheme `Z = V(x₁⁴, (x₁x₂ - x₂²)², x₂⁶)` (length 15, or 16 in characteristic 2), a closed equivalence relation that is not effective over any field, with an explicit obstruction over `𝔽₃`; the effectivity of relations on split square-zero extensions; and Raicu's theorem that affine toric equivalence relations are effective.” After the first sentence of the second paragraph, add: “The relation on `Z` answers the question in the negative over a field. It is this roadmap's own, proved by a rank computation in degree 5 (`52 > 51`), and no published source states it.”

## Previous findings

- R01 — repaired: README line 489, “Prove also `eq_differenceIdeal_of_sq_eq_bot`, this roadmap's own: for `k` a field and `A = k ⊕ V`”.
- R02 — repaired: README lines 476–477, “This answers negatively, over a field, the question of FGA III, §2, p. 212-05”. The 2.1 Check at lines 427–428 shows that flatness is needed.
- R03 — repaired: README lines 375–376, “The restriction of Raicu's relation to `Z` (3.2): `finrank` differs by one in degree `5` … so the criterion fails.”
- R04 — repaired: README lines 113–114, “Raicu's ideal and the ideal of `Z` are homogeneous”. `Z = V(f₁², f₂², f₃²)` is defined again (Summary line 14, 3.2), and its ideal is homogeneous.
- R05 — repaired: `ZMod` is used again, by 3.3 (*Needs:* Mathlib `ZMod`, line 542) and by `raicuCocycle_not_mem_differenceIdeal` (`Suggested.lean` line 276).
- R06 — not repaired: the description still ends its account at “…affine toric equivalence relations are effective.” There is no Layer 4 and no Layer 4 source. This is R01 above.

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| `raicuArtinIdeal`, `O(Z)` (3.2, Check 1) | all 168 primes `< 1000`; `10007, 32003, 65521, 1000003, 2³¹ − 1` | Hilbert function `1,2,3,4,3,2` (length 15); over `𝔽₂`, `1,2,3,4,3,2,1` (length 16); degree-6 determinant `−4` | as stated |
| `raicuArtinRelation` (3.2, Check 3) | same primes | `dim (I+K)₁ = 0`, `dim (I+K)₂ = 2`, containing `x₁² − y₁²`; `K` starts in degree 4 | neither `⊥` nor `ker μ` |
| `not_isEffectiveEquivalenceRelation_raicuArtin` (3.2) | same primes | invariants of `O(Z)` in degrees 1–5: `0,2,1,1,2` (`𝔽₂`: plus 1 in degree 6); `dim (I+K)_d = 0,0,2,9,25,52,84,…` and `dim (J+K)_d = 0,0,2,9,25,51,84,…` | the only gap is in degree 5, at every prime tried |
| Flatness is needed (2.1 Check, restored) | `char ≠ 2`; `char 2` | `dim (O⊗O)/I(Z) = 38`, not a multiple of `15`, and `39`, not a multiple of `16`, so not free; `dim O ⊗_B O = 39`, resp. `40` | consistent with 2.1 |
| `isEffectiveEquivalenceRelation_iff_finrank` (1.3 Check, restored) | `Z` over `𝔽₃`, `𝔽₃₂₀₀₃` | `finrank I(Z) − finrank J(B(Z)) = 1`, all of it in degree 5 (`52 − 51`) | the criterion fails, as stated |
| `raicuCocycle_not_mem_differenceIdeal` (3.3) | `𝔽₃`; `𝔽₂`; large primes for `ℚ` | cocycle `∉ (J+K)₅`; `(O⊗O)₅ = 56 − 16 = 40 = Σ hᵢh₅₋ᵢ`; equal below degree 5. Since `g₁, g₂, g₃ ∈ J(B(Z))`, at `𝔽₃` it is equivalent to 3.2 | true; the one-tactic probe fails |
| Exponent Check (3.2, Check 2) | 13 triples over `𝔽₃` | no gap for the seven listed (lengths 4–10), nor for `(3,1,1)` or `(3,2,1)`; `(2,2,2)`: degree 5, `52 > 51`; `(3,3,2)`: length 27, `44 > 43`, `77 > 75` | as stated |
| Research context, lengths 3–4 | `k[x]/(x³)` and `k[x,y]/m²` over `𝔽₂, 𝔽₃`; `𝔽₂[x]/(x⁴)` | ideals inside `ker μ`: `11, 16; 77, 229; 87`; equivalence ideals: `3, 3; 5, 6; 6`, all effective | agrees with the search where reproduced |
| 3.4 Check (reworded) | Raicu's `g₂`, `σ = ℕ²` | its `(1,1)`-component `x₁x₂ − y₁y₂ ∉ I₂ = span{g₁, g₂}` | not toric; no conflict with 3.1 |
| Control: 3.1 on `𝔸²` | `𝔽₂, 𝔽₃, 𝔽₅, 𝔽₃₂₀₀₃` | `dim I_d = 0,0,2,9,23,44`, `dim J_d = 0,0,2,9,23,43`; invariant forms `0,2,1,3,2` | matches the Checks of 1.1 and 3.1 |

The rows for the untouched statements (0.1–2.1, 3.1, 3.4, 4.1–4.4, the Conventions witnesses) stand as in the previous review, of 027ef49.

- Gate rerun (`gate … --base origin/main`): every count `0`, `OK`. The worker's gate, which includes the targeted build, is `OK`. Dependency check: `depcheck: 245 roadmaps, 2210 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- `lake env lean` on `Suggested.lean` exits 0 with 22 warnings, all “declaration uses `sorry`”: 20 at 027ef49, plus the two restored theorems. `#check @` of the five restored declarations agrees with README 3.2–3.3 (over every field; over `ZMod 3`). `simp`, `infer_instance`, `decide` and `simp [differenceIdeal, raicuCocycle]` close neither restored theorem.
- The folder at this head is byte-identical to 22fb4a2 (`git diff 22fb4a2 HEAD` on the folder is empty), because 23c32ea reverts 027ef49. Nothing outside the folder differs from `origin/main`.
- Source locators of the changed passages checked against the text (7): fga3 lines 133–153 (p. 212-04) and 156–164 (p. 212-05); kollar2012 lines 1156–1158 (¶50) and 1180 (Theorem 51); raicu2010 lines 32–34 (§1, Definition), 170 (Theorem 3.1) and 237 (Theorem 4.1).
- Citations: `roadmaps grep FiniteEquivalenceRelations` finds AlgebraicModuliForArithmeticGeometry, which cites §4.2 (unchanged), and PerfectoidSpacesPartII, which names this roadmap as a consumer of its §5.1. Neither cites 3.3 or 3.4, so the renumbering breaks no citation. No roadmap on main or in an open pull request states Raicu's relation or its restriction (`roadmaps grep 'raicuArtin|raicuCocycle|Raicu'`), so ownership stays here.
- Overlap check: the three closest-roadmap lists in `overlaps.md` are empty; nothing is shared. No other open pull request changes this folder, and no cited id is dropped.
- Source independence: 6 passages compared with 3 sources (fga3, kollar2012, raicu2010), changed passages only. No wording is shared beyond the generator formulas, which the mathematics forces. The largest share of locators is Stacks, 23 of 76. The contents were not compared again, since no layer was added, removed or reordered.

## Not verifiable

- As before: Venken 1971, Philippe 1973, Olivier, Joyal–Tierney 1984, and Mesablishvili 2004a and 2004b are paywalled or not online. They are cited only for history and in Research context.
- The Buffalo lecture of 11 July 1973 appears only in the description. No source for it is among the README's references.
- 3.2's list of primes `2, 3, 5, 7, 13, 41, 61` depends on an elimination order that the README does not give, so it was not reproduced. Its conclusion was computed directly at every prime below 1000 and at five larger primes.
- The rest of Research context's unpublished search (`𝔽_{p³}`, `k[x,y,z]/m²`, `k[x,y]/(W + m³)`, `𝔽_{p²}[ε]`, `𝔽_{p⁴}`, and `k[x]/(x⁴)` over `𝔽₃`) was not reproduced.

## Source issues

- none

## For the human reviewers

- Scope: no published source states `not_isEffectiveEquivalenceRelation_raicuArtin` or `raicuCocycle_not_mem_differenceIdeal` (README 3.2–3.3). README lines 476–478 call the example this roadmap's own and say it answers FGA III's question (fga3 lines 156–164). The proof is an unpublished rank computation, reproduced here at 173 primes.
- Priority: kollar2012 lines 143–144 call Venken 1971 and Philippe 1973 closely related. Branch commit c2992349 described Venken 1971, Corollaire 3.1, as a non-effective relation on a 33-dimensional local artinian algebra; 7a81d5f3 dropped it as unchecked. Venken was not read.
- README lines 799–803 report an unpublished exhaustive search. It was reproduced here only for `k[x]/(x³)` and `k[x,y]/m²` over `𝔽₂` and `𝔽₃`, and for `𝔽₂[x]/(x⁴)`.
