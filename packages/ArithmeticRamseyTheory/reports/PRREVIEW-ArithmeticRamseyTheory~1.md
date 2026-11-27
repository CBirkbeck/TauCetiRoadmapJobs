# Review of ArithmeticRamseyTheory (pull request #3218 at 131ee1a)

**Verdict:** accepted

**Summary.** Accepted: no statement, Check or route was found false. Every theorem of `Suggested.lean` was instantiated at its degenerate cases (no colours, `m = 0`, `p = 0`, `c = 0`, `k ≤ 1`, no columns), the five numerical Checks were recomputed by exhaustive search, and all 22 source locators agree with the texts. There are five small corrections and three format notes, none blocking. Three points are left for the human reviewers: the main source is a set of unpublished lecture notes, the formalisation named under Provenance could not be read, and the description says the author's own read-through is still pending.

## C01 — The comparison "17 against 5, which allows x = y" attributes the gap to the wrong cause

In the second Check of 5.3 (README line 479) a reader is led to think the bound `mpcNumber 2 1 1 (Fin 2) = 17` exceeds RamseyNumbers 6.1's value `5` because 6.1 allows `x = y`. The solution `y = (x₁ − x₂, x₂, x₁)` of 5.3 also allows equal entries (`x₁ = 2x₂` gives `(x₂, x₂, 2x₂)`), and requiring `x ≠ y` alone only raises `5` to `9` (the value of `folkmanNumber 2 (Fin 2)` in 4.1, recomputed). The `17` comes from asking that all four of `x₁ − x₂, x₁, x₁ + x₂, x₂` have one colour. Replace "which allows `x = y`" by that reason, or drop the clause.

## C02 — 5.3 promises `p, c ≥ 1`; the Lean statement asserts only `1 ≤ c`

README line 461 states `ColumnsCondition.exists_mpc` with "`p, c ≥ 1`", while `Suggested.lean` line 317 has `∃ t p c : ℕ, 1 ≤ c ∧ …`. The two are equivalent (the set grows with `p`), but the prose statement cannot be matched to the formal one as written. Add `1 ≤ p` to the Lean conclusion or drop `p ≥ 1` from the sentence.

## C03 — Brauer's theorem (3.4) does not bound `d` when `k ≤ 1`

The statement bounds `a + (k − 1) d` by `mpcNumber 2 k 1 κ` (README line 299, `Suggested.lean` line 176). For `k = 1` this is `a ≤ …` with `χ a = χ d` and `d` unrestricted, and for `k = 0` natural subtraction gives the same; `a = d = 1` then satisfies it for every colouring, so these cases ask nothing. The route of 3.4 yields `a + k d ≤ mpcNumber 2 k 1 κ` (the set contains `x₁ + k x₂`), which bounds `d` for every `k` and is stronger for `k ≥ 1`. Stating that bound would make the theorem uniform in `k`.

## C04 — `[Finite κ]` is not used by the two block-product theorems of 4.4

`exists_orderedProd_blocks_mono` and `exists_finsetProd_blocks_mono` (`Suggested.lean` lines 263 and 274, README line 383) assume both `[Finite κ]` and `IsFinUnionsBound m κ n`. The route (colour `A` by `χ (orderedProd a A)` and apply the hypothesis) uses only the second, so the statements hold for every `κ`. Drop `[Finite κ]` there, or say that it is kept only for uniformity with 4.3.

## C05 — The Provenance section refers to "another Lean development" without naming it

README lines 629–633 say the openai/math file was "adapted in another Lean development" which "also proves" a form of Folkman's theorem and the block selection. A reader cannot find that development or check the two claims about it. Name it (repository and file), or keep only the sentence about openai/math.

## N01 — Several names in code font are declared nowhere

`Finset.exists_isHomogeneous_of_hypergraphRamseyNumber_le` (1.1), `hjNumber_congr`, `vdWNumber_congr`, `mpcSet_smul`, `mpcRowMonoNumber_one`, `exists_mono_mpcSet`, `columnsCondition_iff_exists_le_card`, `Matrix.IsPartitionRegular.columnsCondition` and `Matrix.ColumnsCondition.exists_mono_solution_le` appear in code font but not in `Suggested.lean`, so a reader cannot tell a proposed name from a declared one. Write them as prose ("a lemma we call …") or declare them. The `Finset.`, `Fin.` and `Matrix.` prefixes of the README are also absent from the Lean names (and from the README's own `isPartitionRegular_single_iff`); the Conventions explain this, a single spelling would be simpler.

## N02 — `Suggested.lean` carries auxiliary lemmas beside the headline theorems

The module docstring describes the file as non-exhaustive suggested forms; it also states `vdWNumber_two` (labelled a Check, the first Check of 2.2), `mpcSet_comp_orderEmbedding`, `lt_of_mpcSet_pos`, `finsetSum_mem_mpcRow`, `IsFinUnionsBound.mono` and `orderedProd_biUnion`. None closes with one tactic (`rfl`, `simp`, `simp_all`, `tauto` all fail on each), so none is empty; they are API rather than headlines and would sit as well in the README alone. The bounded form of Rado's theorem (5.3, second item) is the one quantitative headline the file does not state.

## N03 — Process wording

"The prototype `Suggested.lean`" (Conventions), "not consulted, no locator given" and "they were not consulted" (References) describe how the text was written rather than the mathematics. 4.3 and 4.4 carry no locator for their statements (see the second question).

## Questions for the author

- Worked examples, first bullet: is "the sharper bound `R(3, …, 3) − 1`" meant for every number of colours? I checked it against `mpcNumber 2 1 1 (Fin r)` only for `r = 1, 2` (2 against 3, 5 against 17) and, through `mpcNumber 2 1 1 (Fin 3) ≥ W(3, 3) = 27`, for `r = 3` (16); I have no comparison for general `r`.
- 4.3: the finite unions theorem is, I believe, stated in Graham–Rothschild–Spencer, which the README names without a locator. Is there a refereed statement of the ordered-block form that 4.3 could cite? I could not read that book.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 Ramsey on a finite set | `m = 1`, `K = Fin r`, demand `t`; `m > f k` | hypothesis `r(t−1)+1 ≤ #S` = RamseyNumbers 2.1 Check 2; `f k`-set vacuously homogeneous = its Check 3 | true | none |
| 1.2 simultaneous Ramsey | `k = 0`; `k = 1`; empty `κ j` | `B(0,t) = t`; `B(1,t) = max(t, r(t−1)+1) = r(t−1)+1`; no `χ`, vacuous | true; sanders1968 Lemma 1, lines 65–79 | none |
| 1.3 ordered form | `t = 0`; `j > t`; empty `κ j` with `j > B` | one empty embedding; no `s`; still true by replacing `κ j` | true | none |
| 2.1 `hjNumber` | `k = 0`, `κ` empty; `k = 1`; `k = 2` | bound holds at `n = 0`, fails at `n = 1` (so `1 ≤ k` needed); `1`; `r` (points `1ⁱ0ʳ⁻ⁱ`; count of 1s) | true | none |
| 2.2 `vdWNumber` | `k = 0, 1, 2`; `(3, Fin 2)`; HJ bound at `n = 0`, `k = 0` | `0`, `1`, `r + 1`; `9` by search over 2⁸, 2⁹ colourings; max term `1 + kn` | true; chua2017 line 612 | none |
| 3.1 rows and sets | `p = c = 1`, `x = (3, 1)`; `c = 0`; row `j` with all `λ = −p` | `{2, 3, 4, 1}`; `0` in every row; `c xⱼ − p Σ_{i>j} xᵢ > 0` | true; chua2017 lines 1335–1359 | none |
| 3.2 recursion | `m = 0`; `p = 0`; `c = 0`; `κ` empty; `(m,p,c) = (1,1,1)`, 2 colours | `c ≤ c·1`; `c ≤ c`; `0 ≤ 0`; `0 ≤ 0`; `9 ≤ W(3) = 9`, sharp; `dM ≤ n/(2mp)`, `|s| ≤ mpM` | true | none |
| 3.3 Deuber, `mpcNumber_le` | `m = 0`; `κ` empty; `(2,1,1)`, 2 colours | `0`; `0 ≤ 0`; `17` by search (some colouring of `[1,16]` has none; every colouring of `[1,17]` has one) | true; chua2017 lines 1369–1374 | none |
| 3.4 Brauer | `k = 0, 1, 2` | `k ≤ 1`: `a = d = 1` suffices, `d` unbounded; `k = 2`: Schur triple `d, a, a+d` | true | C03 |
| 4.1 Folkman | `m = 0, 1`; `(2, Fin 1)`; `(2, Fin 2)`; without injectivity | `0`, `1`; `3`; `9` by search; `2` and `5` (Schur) | true; chua2017 lines 1415–1420, sanders1968 lines 18–24 | none |
| 4.2 products | `m = 0, 1` | `1 ≤ 2⁰`; `2 ≤ 2¹` | true; chua2017 lines 1421–1430 | none |
| 4.3 finite unions | `m = 0, 1`; `κ` empty; parity colouring | vacuous; `F = 1`, `B(1,1) = 1`; `n = 0`; `{a}`, `{a,b}` differ | true | none |
| 4.4 block products | empty blocks in `orderedProd_biUnion`; `(ℕ,+)`, `aᵢ = 1`; free monoid | both sides the same list product; block sums `#Dⱼ`; increasing list of `A` | true | C04 |
| 5.1 definitions | `!![1,1,-1]`; `!![2,-1]`; `!![λ,-1]` at `λ = 0, 1`; no columns; zero matrix | blocks `{1,3},{2}`: `0`, `1 ∈ ℚ`; sums `2, −1, 1 ≠ 0`; `λ = 0` fails at block 2; both hold; both hold | true; chua2017 lines 945–947, 1042–1049 | none |
| 5.2 necessity | `lastDigit 5 75`, `lastDigit 7 1`, `lastDigit p 0` | `75/25 mod 5 = 3`; `1`; `0` (never used, `x > 0`) | true; chua2017 lines 1242–1325 | none |
| 5.3 sufficiency, Rado | Schur with `b = (0,1,0)` | `q = (1,0)`, `y = (x₁−x₂, x₂, x₁)`, rows `1, 2, 1`, `y₁+y₂−y₃ = 0`; reversed generators fail | true; chua2017 lines 1437–1502 | C01, C02 |
| 5.4 one equation | `κ` empty; `a = (0,1)`; `(2,3,−6)`; `(1,2,−4)`; `(1,2,−3)` | PR but no `I`; `I` exists but not PR; subset sums `2,3,−6,5,−4,−3,−1`; `1,2,−4,3,−3,−2,−1`; `0` | true; chua2017 lines 1088–1093, 1186–1191 | none |
| 5.5 consistency, one class | Schur ⊕ `!![2,-1]`; colouring `1,4 ↦ 0`, `2,3 ↦ 1`, rest `0` | not PR; colour 1 sums `4, 5, 6` all colour 0; colour 0 has `4+4 = 8` | true; chua2017 lines 1511–1527 | none |

- Source locators checked against the text: 22 of 22 (19 into chua2017, 3 into sanders1968); the README's claim about Alweiss's argument checked at alweiss2023 lines 617–651.
- Library declarations opened at the Mathlib pin `1b1ccf4b`: `Combinatorics.Line` (HalesJewett.lean:176), `Line.IsMono` (:206), `Line.exists_mono_in_high_dimension` (:449), `exists_mono_homothetic_copy` (:460), `Hindman.FP_partition_regular` with its additive form (Hindman.lean:192–205), `Fintype.exists_lt_card_fiber_of_mul_lt_card` (Pigeonhole.lean:391), `Finset.orderEmbOfFin` and `orderEmbOfFin_unique'` (Sort.lean:195, 272), `Fin.castLEOrderEmb` (Order/Fin/Basic.lean:354), `Nat.sInf_mem`, `Nat.sInf_le` (Order/Lattice/Nat.lean:75, 86), `Matrix.fromBlocks`, `blockDiagonal'` (Block.lean:45, 569), `dotProduct`, `Matrix.mulVec` (Mul.lean:76, 719), `Nat.exists_infinite_primes` (Prime/Infinite.lean:36), `Finset.rado_selection` (Compactness.lean).
- No declaration on these subjects in the pinned Tau Ceti (`2fd255d9`) or Mathlib beyond those cited; the one same-name lead (`Matrix.fromBlocks`) is the carrier, not the theorem.
- Cross-roadmap citations resolved: RamseyNumbers 2.1, 2.2, 6.1 and their Checks (main), BanachSpaceTheory §B4.1 (main), SidonSetsAndLinearEquations (open head).
- Dependency check: `depcheck: 94 roadmaps, 1054 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `Suggested.lean` elaborates with 33 `sorry` warnings and nothing else; the four additive forms exist (`orderedSum`, `orderedSum_biUnion`, `exists_orderedSum_blocks_mono`, `exists_finsetSum_blocks_mono`). `#check`-level signatures compared with the README: only the difference of C02.
- One-tactic probe on a copy: none of the 33 theorems closes with `rfl`, `simp`, `simp_all` or `tauto`.
- Automatic checks: one failed, on names in code font that are not declared (N01); it is real.

Overlap check: read RamseyNumbers, SidonSetsAndLinearEquations, LovaszLocalLemma; nothing shared (finite hypergraph Ramsey and Schur's theorem with its Ramsey bound are owned by RamseyNumbers 2.1–2.2 and 6.1 and are cited, not restated; 1.1 is the transport to an arbitrary finite set). Ownership against the other open pull requests was checked by searching their heads for van der Waerden, Hales–Jewett, Folkman, Deuber, Rado, Hindman and partition regularity: no other owner.

Source independence: 27 passages compared with 2 sources (chua2017, sanders1968), none shared; largest share chua2017, 19 of 22 locators; contents compared with chua2017: independent (Layers 3, 4, 5 reorder its §3, Layer 1 rests on sanders1968, nothing is taken from its §§1, 4, 5).

Research link: Layers 1 and 4 (simultaneous Ramsey, Folkman) are the inputs of Alweiss (2023), monochromatic sums and products over ℚ, toward Hindman's 1979 question; Layers 3 and 5 are Deuber's (1973) `(m, p, c)`-sets and Rado's (1933) theorem. Rests on the README and on alweiss2023 lines 617–651.

## Not verifiable

- Graham–Rothschild–Spencer, *Ramsey Theory*; Rado 1933 and 1970; Deuber 1973; Brauer 1928; van der Waerden 1927; Hindman 1979: named for attribution, with no locator; not fetched, nothing in the README rests on a locator into them.
- The openai/math file named under Provenance (`OAI/Analysis/MarkovType/FiniteRamsey.lean` at `adc7f124`): the repository did not resolve (not found), so the names and statements of 1.2 and 1.3 were not compared with it.
- The unnamed "other Lean development" of the Provenance section.

## Source issues

- **Misprint** in chua2017 at §2, van der Waerden's theorem, p. 18: the source says the monochromatic progression has length `n`; it should be length `m`, the first argument of `W(m, k)`; affects nothing.
- **Misprint** in chua2017 at §3, Proposition, p. 29: the source says `a₂, …, a_n` are nonzero; it should be `a₁, …, a_n`; affects nothing.
- **Error** in chua2017 at §3, Theorem, p. 31: the source says the single-equation criterion holds for all rational `a₁, …, a_n`; it should require them nonzero as on p. 29 (`(0, 1)` is a counterexample); affects a stated result.
- **Misprint** in chua2017 at §3, proof of the Proposition of p. 32, first display of p. 33: the source says the second sum runs over blocks `B₁, …, B_s`; it should be `B₁, …, B_{s−1}`, as in the next display; affects nothing.
- **Error** in chua2017 at §3, proof of the Proposition of p. 35, p. 36: the source says to use generators in the order `(x_m, …, x₁)` and `p = max c·d_{is}`; it should be `(x₁, …, x_m)` and `max |c·d_{is}|`; affects the proof.
- **Misprint** in sanders1968 at Lemma 1, proof, p. 4: the source says `N(k, r, t) = N(R(k, r−1, t), r, t)`; it should be `N(R(k, r, t), r−1, t)`, as the next sentence uses; affects nothing.

## For the human reviewers

- **Scope.** 19 of the 22 locators point into chua2017, unpublished notes of a 2017 Cambridge lecture course whose first page says the lecturer has not endorsed them; the refereed sources (Graham–Rothschild–Spencer, Rado, Deuber) are named without locators.
- **Licence.** chua2017 was read from the note-taker's own page; the lectures are B. P. Narayanan's. Whether that page is the right legal source is yours to decide.
- **Licence.** README Provenance says 1.2 and 1.3 were formalised in openai/math (Apache-2.0, `adc7f124`); that repository could not be read, so agreement of names and statements with it was not tested.
- **Status.** The pull request description says it was opened as a draft pending the author's full read-through.
