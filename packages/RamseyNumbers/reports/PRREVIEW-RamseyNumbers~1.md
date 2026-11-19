# Review of RamseyNumbers (pull request #2566 at 43ab2af)

**Verdict:** accepted

**Summary.** Accepted: every statement, Check and worked value was recomputed and none is false, all 34 source locators were read at the text and support the statements, and `Suggested.lean` elaborates with `sorry` as its only warning. There are two small corrections (auxiliary values that the routes use exist only as Checks; the References sentence on Schur's paper is not what the two named sources say) and one format note, none blocking. Two points are left for the human reviewers: the coincidence of four theorem names and statements with a public Lean 3 formalisation, and the access status of the Diestel preview.

## C01 — The routes of 3.2, 4.1, 4.2 and 4.3 take `R(1, t) = 1`, `R(2, t) = t`, `R(3, 3) = 6` and `R(2, 3, 3) = 6` as inputs, but these are stated only as Checks

An implementer of Layer 4 needs these values as proved facts, and a Check is a test of a definition, not a target; the `*Needs:*` lines of 4.1 and 4.3 (lines 345 and 386) say so themselves ("the values `R(2, t) = t` of the Checks of 1.1"). The base cases of 3.2 (line 281) use `R(1, t + 1) = 1` the same way, and 3.3 is only applicable to `R(3, 4)` through `R(2, 4) = 4` and `R(3, 3) = 6`.

The values are correct (recomputed: a demand `0` gives `0`; all demands `≥ 1` with one equal to `1` give `1`; adding a colour of demand `2` to any demand `f` leaves the number unchanged, which gives `R(2, t) = R(t) = t` and `R(2, 3, 3) = R(3, 3) = 6` at once). The smallest change would be to list them as API facts under 1.1 in prose (the three degenerate rules above, the third in its general form), keep the Checks as they are, and point the `*Needs:*` lines of 3.2, 4.1 and 4.3 at those facts; `R(3, 3) = 6` could be stated as a consequence in 3.1.

## C02 — The References say Schur's 1916 paper is "named as Diestel and Radziszowski attribute the results", but neither text read gives that attribution

The last entry of the References (line 587) rests the citations "Ramsey, 1930" and "Schur, 1916" on the two books. For Ramsey this holds: Diestel heads Theorem 9.1.1 "(Ramsey 1930)" and Radziszowski's §1 cites Ramsey's paper. For Schur it does not: Diestel's Exercise 14 of Chapter 9 (p. 320) states the result without a name, the chapter does not mention Schur, and Radziszowski speaks of Schur numbers (§6.2 (i), p. 58) without citing a paper of Schur or a year. A reader who follows the sentence finds no source for "Schur, 1916" in 6.1.

The smallest change is to say that the attribution to Schur (1916) is the standard one and to give the bibliographic entry of the paper itself, or to cite a text that does give it with its locator.

## N01 — Two quotations of a source's formula use other letters than the source

In 3.1, Greenwood and Gleason's Theorem 6 is printed with the index one higher, `t_(r+1) ≤ (r + 1)(t_r − 1) + 2`, not "`tᵣ ≤ r (tᵣ₋₁ − 1) + 2`"; in 2.1, Radziszowski writes the uniformity `s` and the number of colours `m`, `R(G₁, …, G_m; s)`, not "`R(k₁, …, kᵣ; m)`". Both are equivalent relabellings; "in the form" in place of "where it reads" / "is written" would be exact. The References entry for Ramsey and Schur also lacks the papers' titles and journals.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.1 `RamseyProp`, `ramseyNumber` | `K` empty; one colour; some `f k = 0`; all `≥ 1` with a `1`; `![2, t]`; pentagon | empty `K`: fails at `n = 0, 1`, vacuous from `2`, so `2`; `R(s) = s`; `0`; `1`; `t`; pentagon: no triple `a, b, a+b` in `{1,4}` or `{2,3}` mod 5 | true | none |
| 1.1 two-colour form | `toTopEdgeLabeling` at the pin | edges ↦ `1`, non-edges ↦ `0`; colour `0` class is the complement; `![s, t]`: independent `s`-set or `t`-clique | true | none |
| 1.2 `ramseyProp_iff_ramseyNumber_le` | `K` empty; `K = ℕ`, `f = 3`; route step count | empty: `prop ↔ 2 ≤ n` both sides; `ℕ`: `sInf ∅ = 0 ≤ 2`, property fails; vertex has `Σ nₖ` neighbours, all `< nₖ` gives `≤ Σ nₖ − r` | true; finiteness needed | none |
| 1.3 `ramseyNumber_comp_equiv` | swap on `Fin 2`; non-bijection `Fin 1 → Fin 2` | `R(2,3) = R(3,2) = 3`; `![3,3] ∘ const = ![3]`, `R = 3 ≠ 6` | true | none |
| 2.1 `HypergraphRamseyProp` | `m = 0`; `m = 1`; `m = 3` with `(2,5)`, `(1,4)`, `(3,3)`, `(4,3)`; `K` empty | `max f`; `1 + Σ(f k − 1)`; `2`, `1`, `3`, `4`; empty `K`: number `m` (so `0` at `m = 0`, `1` at `m = 1`) | true | none |
| 2.2 `hypergraphRamseyProp_iff` | `K` empty; `(2,4,4)` at `m = 3`; step `R⁽ᵐ⁺¹⁾(f) ≤ 1 + R⁽ᵐ⁾(g)` | empty: `prop ↔ m ≤ n`; `2`; new `(m+1)`-sets through `v` are `T ∪ {v}`, `T ⊆ S`, colour `k`; empty `K`: `m + 1 ≤ 1 + m` | true | none |
| 2.3 `hypergraphRamseyProp_two_iff` | `K` empty, `n = 0, 1, 2`; infinite `K` | both fail at `0, 1`, both vacuous at `2`; bijection of colourings needs no finiteness | true | none |
| 3.1 `ramseyNumber_add_card_le` | `r = 0, 1`; `(3,3)`; `(3,3,3)`; `(1,1)`; count of test demands | `2 ≤ 2`; `s + 1 = 2 + (s − 1)`; `8 ≤ 8`; `R + 3 ≤ 20`; `3 ≤ 2` false without hypothesis; `8 + 16 = 24` demands | true; hypothesis needed | none |
| 3.2 `ramseyNumber_two_le_choose` | `s = 0`; `t = 0`; `s = t = 0`; `(2,2)`, `(2,3)`, `(2,4)`, `(3,3)`; Pascal step | `1 ≤ 1` each; `6 ≤ 6`, `9 ≤ 10`, `14 ≤ 15`, `18 ≤ 20`; `C(s+t+1, s) + C(s+t+1, s+1) = C(s+t+2, s+1)` | true | none |
| 3.3 `ramseyNumber_two_lt_of_even` | `(s,t) = (1,2)`; `s = 0`; `(1,1)` | `R(2,4) = 4`, `R(3,3) = 6`: `9 < 10`; `R(1, t+2) = 1` odd; `6 = 3 + 3` both odd; `(2p+2q−1)(2p−1)` odd | true | none |
| 4.1 `R(3,4) = 9`, `R(3,5) = 14` | cubes mod 13; sums in `{1,5,8,12}`; `ℤ/8` with `±1, 4` | cubes `{1,5,8,12}`; ten pairwise sums `2,6,9,0,10,0,4,3,7,11`, none a cube; `14 ≤ 5 + R(3,4)`, `R(3,4) ≤ 9`; `ℤ/8`: no triangle, independence `3` | true | none |
| 4.2 `R(4,4) = 18` | squares mod 17; `3` | `{1,2,4,8,9,13,15,16}`; `3` a non-square; `9 + 9 = 18` | true | none |
| 4.3 `R(3,3,3) = 17` | cubes of `𝔽₂[x]/(x⁴+x+1)` | `x³, x⁶ = x³+x², x⁹ = x³+x, x¹² = x³+x²+x+1, 1`; `1 + A` for each cube `A`: none a cube; `2 − 3 + 18 = 17` | true | none |
| 5.1 `lt_ramseyNumber_of_choose_mul_two_lt` | `k = 0, 1, 2, 3, 4`; `n < k` | `2 < 1` never; `n = 0`, `0 < 1`; `n ≤ 1 < 2`; `n ≤ 3` (`C(4,3)·2 = 8`); `n ≤ 6` (`30 < 64 < 70`); `n < k ≤ R(k,k)` | true | none |
| 5.2 `two_pow_lt_ramseyNumber_sq` | `k = 0, 1, 2, 3, 4`; factorial step | `1 < 0`, `2 < 1`, `4 < 4` false; `8 < 36`; `16 < 324`; `32 < 36`, `64 < 576`; `C(n,k) = 0` case trivial | true; `k ≥ 3` needed | none |
| 6.1 `exists_add_eq_of_ramseyNumber_le` | `κ` empty; one, two, three colours; `κ = ℕ` | no `c`; `N = 2`, `1 + 1 = 2`; `{1,4}`, `{2,3}` sum-free, `S = 4`, `N = 5`; `13 + 2 ≤ 17`; `R = 0`, identity colouring has no solution | true; finiteness needed | none |
| C01 auxiliary values | colour of demand `2` added to `f` | no colour-`0` edge ⇒ colouring in the other colours; an edge ⇒ pair; `R(2, f) = R(f)`, also for `K` empty (`2 = 2`) | true | state as API facts |

- Source locators checked against the text: 34 of 34 (Greenwood–Gleason 12, Radziszowski 10, Diestel 7, Erdős 5); the displayed formulas of Corollary 1 (GreenwoodGleason1955, p. 2) and inequality (3) (Erdos1947, p. 293) were read on the page images.
- Library declarations opened at the pinned Mathlib: 27, among them `Mathlib/Combinatorics/SimpleGraph/Coloring/EdgeLabeling.lean` lines 68, 71, 100, 126, 139, 177, 181, 191 and the closing `labelGraph_toTopEdgeLabeling`; `Clique.lean` line 245; `DegreeSum.lean` line 101; `Order/Lattice/Nat.lean` lines 75, 86; `Order/OrderIsoNat.lean` line 186; `Combinatorics/Hindman.lean` line 203; `HalesJewett.lean` line 460. No Ramsey number, Ramsey property or Schur theorem exists in Mathlib or Tau Ceti at the pins.
- Cross-roadmap citations resolved: 1 (BanachSpaceTheory §B4.1 on main, the paragraph on the infinite Ramsey theorem for `[ℕ]^k`).
- Dependency check: `depcheck: 200 roadmaps, 2195 edges, 0 problem(s)`; no UPWARD or CYCLE line. The roadmap names no roadmap as a supplier.
- Automatic checks: all passed. Elaboration of `TauCetiRoadmap/RamseyNumbers/Suggested.lean`: 14 `sorry` warnings, nothing else. The file has no section variables; the 18 elaborated signatures agree with the README statements.
- One-tactic probe (`rfl`, `simp`, `decide`, `simp` with the four definitions unfolded) on a copy: none of the 14 theorems closes. No padding found; all headline theorems of the README are stated.
- Pull request text read against the head: title and description agree with it (a new roadmap, 14 theorems and 4 definitions, `import Mathlib` only, no supplier roadmap); no change outside the folder.
- Overlap check: read GraphColouring, HamiltonianCycles, BanachSpaceTheory (§B4.1), HanfNumbers; nothing shared (the infinite Ramsey theorem belongs to BanachSpaceTheory and is not stated here; no other roadmap declares a Ramsey number or Schur's theorem).

Source independence: 11 passages compared with 4 sources, none shared beyond formulas and standard names; largest share GreenwoodGleason1955, 12 of 34 locators; contents compared with GreenwoodGleason1955 (§1–§6): independent (Layer 3 draws on §2 and §5, Layer 4 on §3 and §4, Layers 2, 5, 6 have no counterpart; bounds before values is forced by 4.1 and 4.2 needing 3.1 and 3.3).

Research link: The headline targets are the classical base of the literature in Radziszowski's dynamic survey (revision 18, 2026): the Greenwood–Gleason (1955) recurrence and values (§2.1, §2.3, §6.1) and Erdős's (1947) bound, which §2.4 lists first among asymptotic results on `R(3, k)`, `R(4, k)` (Mattheus–Verstraëte 2024) and `R(k, k)`. Rests on Radziszowski2026, read.

## Not verifiable

- Ramsey (1930) and Schur (1916): the README gives no locator into them and they were not read; the attribution of 1.2 and 2.2 to Ramsey was confirmed in Diestel2025 (Theorem 9.1.1 heading) and Radziszowski2026 line 161.
- Ownership against open pull requests was checked by searching the open heads for the objects (Ramsey number, Ramsey property, monochromatic cliques, Schur's theorem); the heads were not read in full.

## Source issues

- **Misprint** in GreenwoodGleason1955 at §3, p. 4 (last sentence before Table I): the source says Theorem 3 establishes `n(4, 4) = 18`; it should be Theorem 2, since `n(3, 4) = n(4, 3) = 9` are odd and Theorem 3 does not apply; affects nothing.

## For the human reviewers

- **Licence.** The public Lean 3 project `b-mehta/exponential-ramsey` (`src/prereq/ramsey_small.lean`) has `ramsey_number_three_four`, `ramsey_number_four_four`, `ramsey_number_three_three_three` with the statements of `Suggested.lean` lines 106, 114, 118 up to naming case; the description says no outside formalization was used.
- **Licence.** Diestel2025 was read from the preview files on the author's university page; the files are permission-restricted PDFs, read by OCR for locators only. The README names `diestel-graph-theory.com` as the host.
