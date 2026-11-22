# Review of AmitsurLevitzki (pull request #2989 at c7267ab)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every statement was tested at its degenerate parameters (`n = 0`, `d = 0`, the zero ring, characteristic 2, `k > m`), every number printed in a Check was recomputed in exact arithmetic and agrees, every locator into the two sources that were consulted was read at its place and supports the statement as written, and the three supplier citations resolve on main with the signatures the README quotes. There are no small corrections and three format notes, none blocking. Two points are left for the human reviewers: the kind of source the roadmap rests on, and the licence of the lecture notes.

## N01 — Three targets carry no source locator

4.4, 5.1 and 5.2 are marked "Proved here" (5.1 and 5.2 with "no source was consulted"). Their routes are complete and were checked step by step, so nothing is unsupported; a locator to a refereed statement of the Azumaya forms would still help a reader place them.

## N02 — One sentence of the route of 4.1 assumes a nontrivial ring

"A product of matrix units is nonzero exactly when each column index equals the next row index" (4.1, Route) holds for `R` nontrivial only; the route's conclusion reads off an entry and does not need it. Adding "for `R` nontrivial" would make the sentence agree with the convention that `R` may be the zero ring.

## N03 — The Layer 2 section comment of the Lean file has a shorter title than the README

`Suggested.lean` has "Layer 2: Rosset's theorem when `n!` is a unit"; the README's layer is "Grassmann matrices and Rosset's theorem when `n!` is a unit".

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| 1.1 definitions | `k = 0, 1, 2`; `f = 0`; zero ring; unsigned variant | `S_0 = 1`, `S_2 = x₀x₁ − x₁x₀`; `totalDegree 0 = 0` (sup over empty support); unsigned sum gives `2 ≠ 0` on `ℤ` | sound |
| 1.2 upward closure | `k = 0` (then `A = 0`); `k = 2`, `A = ℤ`; converse on `M_2(ℤ)` | expansion `S_(m+1) = ∑ (−1)^i x_i S_m(…)` checked; `S_2(e₁₁, e₁₂) = e₁₂ ≠ 0` while `S_4 = 0` | sound |
| 1.3 spanning bound | `d = 0` (`A = 0`); `d = 1`, `k = 1` fails; quaternions | `S_3(i, j, k) = −6` (six terms, each `−1` after sign); `S_4(1, i, j, k) = 0` | sound |
| 1.4 tracelessness | `k = 0` excluded; odd degree; char 2 | `∑_(j<2k) (−1)^j = 0`; `trace S_3(e₁₁, e₁₂, e₂₁) = 3`; `sign (finRotate (2k)) = (−1)^(2k−1) = −1` | sound |
| 2.1 trace criterion | `n = 0`; zero ring; `𝔽₂`, `𝔽₃`, `n = 2` | `𝔽₂`: 8 matrices with both traces 0, 4 with `B² ≠ 0`; `𝔽₃`: 9, all with `B² = 0`; recurrence sign matches supplier | sound |
| 2.2 power formula | `k = 0`; `k > m`; `n = 2`, `m = 4`, `k = 1..5` in exact exterior arithmetic | formula equals `Gᵏ` for `k = 1..5`; `trace G³ = 54ε₀ε₁ε₂ − 36ε₀ε₂ε₃ − 18ε₁ε₂ε₃`; `G⁴ = G⁵ = 0` | sound |
| 2.3 Rosset | `n = 0`; zero ring; `n = 3` six matrices | `S_6 = 0`; some `S_5 ≠ 0` (so `G⁵ ≠ 0`); `S_4` on first four `= [[4,4,29],[−33,−8,0],[4,−41,4]]` | sound; special case of 3.2 by design |
| 3.1 generic statement | `n = 0, 1`; injectivity of `ℤ[x] → ℚ[x]` | `n = 1`: `x_a x_b − x_b x_a = 0`; `n!` a unit in any `ℚ`-algebra | sound |
| 3.2 Amitsur–Levitzki | `M_2(𝔽₂)`; noncommutative coefficients `M_2(M_2(ℤ))` | staircase `e₁₁e₁₂e₂₂e₂₃ = e₁₃` is the only nonzero order, so `S_4 ≠ 0` on `M_4(ℤ)` | sound |
| 4.1 staircase | `d = 0, 1, 2, 3`; zero ring; `n = 2`, `d = 4` | product of `u₀..u_(d−1)` is `e_(1, ⌊d/2⌋+1)`; evaluation matrix `1024 × 24` has rank 23 over `ℚ`, `𝔽₂`, `𝔽₃` | sound |
| 4.2 multilinearization | `ℓ = 0`; `x² − x` over `𝔽₂`; `x₁x₂ + x₃` | inclusion–exclusion coefficient `∑_(S ⊇ U) (−1)^(ℓ−|S|) = [U full]`; `x² − x ↦ y₀y₁ + y₁y₀`, `α(1) = 1` | sound |
| 4.3 minimality | `n = 0` (vacuous); zero ring (no nonzero `f`); `M_2(𝔽₂)` | word-evaluation ranks 4, 15, 40 for 1, 2, 3 letters, equal to the word counts | sound |
| 4.4 the iff | zero ring excluded; `n = 0`; `n = 2`, `m = 3` | `n = 0`: both sides true; `S_3(e₁₁, e₁₂, e₂₂) = e₁₂`; `m < 2n` forces `sign(1) = 1 = 0` | sound, both directions |
| 5.1 Azumaya `S_{2d}` | `d = 0`; `A = 0`; `M_d(A)`; quaternions | `d = 0`: rank `0·0 = 0`, `R` subsingleton; `r ↦ 1 ⊗ r` injective by faithful flatness; supplier needs `0 < d`, supplied | sound |
| 5.2 Azumaya minimality | `d = 0` (vacuous); `A = 0`; pure tensors | value on `bᵢ ⊗ rᵢ` is `(∏ bᵢ) ⊗ ∑ α(σ) r_σ`; `A → B` injective keeps `α' ≠ 0` | sound |
| Lean signatures | all 20 declarations | file has no section variables; every binder is in its own signature; README generality equals Lean in each case | no change |

- Source locators checked against the text: 11 into Bezrukavnikov18706 (lines 3016–3141, printed pages 63–66), 5 into Procesi2013 (lines 38, 71–72, 83–89); all agree.
- Library declarations opened at the pin: all 74 names of the supplier contracts exist (checked in one elaboration); statements read for `Module.rankAtStalk_eq_zero_iff_subsingleton`, `Module.FaithfullyFlat.tensorProduct_mk_injective`, `IsAzumaya` (fields), `IsAzumaya.matrix`, `sign_finRotate`, `Matrix.reverse_charpoly`, `Matrix.charpoly_natDegree_eq_dim`, `TauCeti/LinearAlgebra/Trace/Nilpotent.lean:104`, `TauCeti/LinearAlgebra/ExteriorAlgebra/Contraction.lean:409, 487`.
- Cross-roadmap citations resolved on main: 3 (`RepresentationTheory/SchurWeyl/Suggested.lean:241`, `IntegralHeckeAndGaloisDeterminants/Suggested.lean:137`, `SchemeAndStackFoundations/Suggested.lean:670`), each with the signature the README quotes; the copy of `genericMatrices` is character for character the supplier's body.
- Duplication: the pinned Mathlib and Tau Ceti have no standard polynomial, polynomial-identity predicate, or trace criterion over a ring with `n!` a unit; no roadmap on main or in an open pull request states any of the targets (ownership searched by object across the open roadmap pull requests).
- Dependency check: `depcheck: 133 roadmaps, 1475 edges, 0 problem(s)`; no change outside the folder.
- Elaboration: `Suggested.lean` elaborates with 14 `sorry` warnings and nothing else. One-tactic probe (`rfl`, `simp`, `infer_instance`, `simp_all`, `simp` with the definitions unfolded, `exact?`): none of the 14 theorems closes.
- Automatic checks: all passed.
- Overlap check: read IntegralHeckeAndGaloisDeterminants (the only roadmap in the three lists); `genericMatrices` is shared, owner IntegralHeckeAndGaloisDeterminants §0.4, copied here with its citation as the carrier of 3.1; nothing else shared.

Source independence: 11 passages compared with 2 sources, none shared; largest share Bezrukavnikov18706, 11 of 16 locators; contents compared with Bezrukavnikov18706 (§22.4–§23.1): independent (the source puts minimality before Rosset's proof and has neither the generic-matrix transfer nor the Azumaya layer; the order here is forced by 2.3 → 3.1 → 3.2 → 4.4).

Research link: The headline is the theorem of Amitsur and Levitzki (1950) with Rosset's proof (1976), the starting point of the theory of polynomial identities; Procesi (2013) restates it as the Cayley–Hamilton identity for the generic Grassmann matrix. Rests on the README's references and Procesi2013 §1.

## Not verifiable

- S. Rosset (1976) and Amitsur–Levitzki (1950): not read; the README attributes without locators into them, and their bibliographic data agree with Procesi2013 lines 104 and 114.

## Source issues

- **Misprint** in Bezrukavnikov18706 at Lemma 22.10, printed page 64: the source says the staircase list begins `e₁₁, e₁₂, e₂₁, e₂₂`; it should be `e₁₁, e₁₂, e₂₂, e₂₃, …`, whose ordered product is `e_(1n)`; affects the proof.
- **Misprint** in Bezrukavnikov18706 at §23.1, proof of Theorem 22.9, printed page 66: the source says the standard polynomial of degree `n` in `n` matrices, with traces for `i ≤ n − 1`; it should be `S_{2n}` in `2n` matrices, with traces for `i ≤ n`; affects nothing.
- **Error** in Bezrukavnikov18706 at Lemma 22.11(a), proof, printed page 64: the source says subtracting the specialisation at `xᵢ = 0` keeps the total degree; it should be that the degree can drop (`x₁x₂ + x₃` becomes `x₃`), so another step is needed; affects the proof.

## For the human reviewers

- Scope: 11 of 16 locators point to MIT OpenCourseWare lecture notes (unrefereed); the refereed primary sources (Amitsur–Levitzki 1950, Rosset 1976) are attributed and were not consulted; 5.1 and 5.2 cite no source (README, Layer 5 and References).
- Licence: the lecture notes are published by MIT OpenCourseWare under CC BY-NC-SA 4.0 (course page footer); the roadmap cites them by locator and reuses no passage, table or list that I found.
