# Review of SidonSetsAndLinearEquations (pull request #2847 at 09f5b3a)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every one of the fifteen stated theorems was recomputed on degenerate and small instances and each proof route was followed to the end (including the closing estimates of 1.4 and 4.2, which the roadmap derives itself); all source locators were read at the text, every cited library declaration was opened at the pins, and `Suggested.lean` elaborates with `sorry` as the only warning. There are no small corrections and three format notes, none blocking. One point is left for the human reviewers: the survey cited most was read in its arXiv version, not the journal version the README's page numbers name.

## N01 — 4.3 carries neither a source locator nor the remark that it is derived here

Every other target either cites a source or says that the statement and route are derived in the roadmap (2.4, 4.2). In 4.3 (line 471) a reader cannot tell which is meant. One clause would do: "the statement and the route are derived here".

## N02 — The Check on Klarner's set in 3.2 understates what the example shows

"the constant `1/3` cannot be replaced by `1/2`" (line 351) is true, but the set of seven elements with largest sum-free subset of three shows that no constant above `3/7` works, which is what the cited page records. Would read better as "by any constant above `3/7`".

## N03 — Several Checks rest on searches a reader cannot redo by hand

The Checks of 1.4 (every `N ≤ 200000`), 2.4 (every `N` up to `10⁶`) and 4.2 (the grid over `b` and `log N`) report the outcome of a computation without a value a reader can recompute in minutes. The small ones were recomputed for this review and agree (table below); for the large ones, one representative computed value per Check (as the last Check of 2.4 already gives) would make them testable.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| Conventions: strong Sidon form against the survey's counting form | `{0,1} ⊆ ℤ/2`; a group without 2-torsion | Counting form: both sums have 2 representations, accepted; strong form: `0+0 = 1+1`, rejected. Without 2-torsion `2a = 2c ⇒ a = c`, forms agree | true | none |
| 1.1 `isSidon_iff_sub` | `{1,2,5,7}`, `{1,2,3}`, `{0,1} ⊆ ℤ/2`, `{0,1,3} ⊆ ℤ/7`, `∅` | Differences `1,4,6,3,5,2` distinct; `1+3 = 2+2`; `0−1 = 1−0` with `a ≠ b`; `±1,±2,±3`; both sides vacuous | both directions hold | none |
| 1.2 `isSidon_iff_addEnergy` | `∅`, singleton, `{1,2,5,7}`, `{1,2,3}`, `{0,1} ⊆ ℤ/2` | `0+0 = 0`; `1+1 = 2`; `E = 28 = 32 − 4`; `E = 19 ≠ 15`; `E = 8 ≠ 6` | true | none |
| 1.3 `card_mul_card_sub_one_le` | `A = ∅`; trivial group; `{0,1,3} ⊆ ℤ/7`; `(ℤ/2)²` | `0·(0−1) = 0` in `ℕ`; `1·0 ≤ 0`; `3·2 = 6 = 7−1`; bound allows 2, largest Sidon set has 1 | true; truncated subtraction harmless | none |
| 1.4 `card_lt_sqrt_add_rpow_add_one` | `N = 0, 1, 7, 12, 18, 26, 35, 45`; route with `u = ⌈N^(1/4)⌉` | `0 < 1`; `1 < 3`; sizes `4,5,6,7,8,9` against `5.27, 6.33, 7.30, 8.36, 9.35, 10.30`; `D² < N(u+½)²` gives `r < √N + √N/(2u) + (u+1)/2` | true | none |
| 2.1 `erdosTuranSet_spec` | `p = 2, 3, 5`, all primes `< 60`; `p = 4, 9` | `{0,5}`; `{0,7,13}`; `{0,11,24,34,41}` Sidon; all primes `< 60` Sidon, `p` elements, `< 2p²`; `p = 4`: `0+25 = 9+16`; `p = 9` fails | true; primality needed | none |
| 2.2 `boseSet_spec` | `q = 2` (`X²+X+1`), `q = 3` (`X²+X−1`), `θ = 1` | `{1,2}` mod 3; powers of `θ` give `θ⁶ = θ+2`, `θ⁷ = θ+1`: `{1,6,7}` mod 8, differences `1,2,3,5,6,7`, `4` absent; `θ = 1`: all of `ℤ/3` | true; count `q²−1−(q−1) = q²−q` | none |
| 2.3 `singerSet_spec`, `exists_perfect_difference_set` | `q = 2` (`X³+X+1`), `q = 3` (`X³−X+1`), `θ = 1` | `{0,1,3}` mod 7; `θ³ = θ+2`, `θ⁹ = θ+1`, `θ¹³ = −1` so order 26: `{0,1,3,9}` mod 13; `θ = 1`: 7 elements | true; `q(q+1) = m−1` | none |
| 2.4 `exists_isSidon_sqrt_div_two_le` | `N = 0, 1, 2, 8, 9`; every `N` from 9 to 20000 | `0 ≤ 0`; `0.5 ≤ 1`; `1.41 ≤ 2`; Bertrand prime has `q²+q+1 ≤ s²−s+1 ≤ N`, `q+1 > √N/2`: no failure | true | none |
| 2.4 `sidonNumber`, `sidonNumber_isEquivalent` | `N = 0..12`; `N = 10⁴, 10⁶, 10⁸, 10¹⁰` | `0,1,2,2,3,3,3,4,4,4,4,4,5`; primes `97, 997, 9973, 99991` give `0.98, 0.998, 0.9974, 0.99992`; `q ≤ √N−1 ⇒ q²+q+1 ≤ N−√N+1` | true | none |
| 3.1 `IsSumFree` | `{1}`, `{1,2}`, `{0}`, odd integers | `1+1 = 2 ∉ {1}`; `1+1 = 2 ∈ {1,2}`; `0+0 = 0`; odd + odd even | determines the object; the distinct-variable variant accepts `{1,2}` | none |
| 3.2 `exists_isSumFree_card_add_one_le` | `{1,2,3}`; `{2,3,4,5,6,8,10}`; `{0}`; `∅`; all nonempty `A ⊆ [−6,6]∖{0}`, `|A| ≤ 8` | `3·2 ≥ 4`; largest sum-free subset 3, `9 ≥ 8`; no nonempty sum-free subset; `1 ≤ 0` false; no failure. Route: `n(j+1)/(3j+1) > n/3` | true; both hypotheses needed | none |
| 3.3 `exists_isSumFree_two_mul_card_le` | `ℤ/2, ℤ/3, ℤ/5, ℤ/7, ℤ/13`, trivial group | `1/2, 1/3, 2/5, 2/7, 4/13`; `j/(3j+1) ≥ 2/7 ⇔ j ≥ 2`; `ℤ/7` maximum 2, `ℤ/13` maximum 4; trivial group only `∅` | true; equality at 7 | none |
| 4.1 `card_sq_le_of_forall_not_injective` | `a = (1,1), (1,−1), (1,2)` at `N = 6, 10`; `k = 1`; `a = (1,0)`; `|A| < 2k` | Largest admissible sets 4 and 5, `16 ≤ 72`, `25 ≤ 120`; `N² ≤ N` fails; `N² ≤ 6N` fails for `N ≥ 7`; vacuous hypothesis: `|A|² ≤ (2k−1)N` | true | none |
| 4.2 `exists_forall_eq_of_sum_mul_eq` | `k = 0`; `b = 1`; `N = 0, 1`; `b = 2, 3`; `x+2y = 3z` with `d = 3`; `log N = C²`, `b = 2` | Bound `N` with `A = range N`; `0 ≤ 0`; `1 ≤ 1`; `C = 4.995, 5.679`; `D = 7`, sphere 5 gives `{9,15}`; `n = 6`, `d = 32`, excess `12.07` | true; `log 0 = 0` harmless | none |
| 4.3 `exists_forall_sum_mul_ne` | `x₁+x₂ = x₃`; `x₁−x₂ = 0`; `k = 0`, `c ≠ 0`; `s = 0`, `c ≠ 0` | `m = 2`, odd numbers, `⌈N/2⌉ ≥ ⌊N/2⌋`; hypothesis fails as it should; `0 = c` has no solution; `m > |c|` so class 0 works | true | none |
| Supplier statement used in 2.4 | Tau Ceti's count of primes in residue classes at `m = 1` | `IsUnit (a : ZMod 1)` holds, `φ(1) = 1`, limit `1`: the prime number theorem for `𝓞 ℚ` | usable as cited | none |

- Source locators read at the text: 21 of 21 (OBryant2004 10, EGM13 4, GR03 3, Zhao2023 2, Buk07 1, SS14 1); OBryant2004 was read as arXiv:math/0407117v1, whose page numbers agree with the README's at every locator.
- Library declarations opened at the pins: 25 in Mathlib (among them `Combinatorics/Additive/AP/Three/Behrend.lean` lines 111, 134, 163, 246, 482; `Analysis/Convex/Jensen.lean` line 244; `FieldTheory/Finite/Extension.lean` lines 48, 77; `NumberTheory/Bertrand.lean` line 225; `NumberTheory/LSeries/PrimesInAP.lean` line 443) and 2 in Tau Ceti (`NumberTheory/Chebotarev/PrimeCounting/PrimesCongruent.lean` line 63; `NumberTheory/ArithmeticDirichletSeries/Counting.lean` line 630). All exist and say what the supplier contracts say.
- No declaration of Sidon sets, sum-free sets or perfect difference sets exists in the pinned Mathlib or Tau Ceti (searched by object).
- Cross-roadmap citations resolved: 2 (FourierAnalyticAdditiveCombinatorics Layers 1–3 and RamseyNumbers Layer 6, 6.1, at the heads of their open pull requests); both are named as boundaries, neither is a supplier.
- Dependency check output: `depcheck: 172 roadmaps, 1998 edges, 0 problem(s)`. The pull request changes nothing outside the folder.
- Automatic checks: all passed. Elaboration: 15 `sorry` warnings and nothing else; no `set_option`, no sorried data, single `import Mathlib`.
- One-tactic probe on a copy of the file (`rfl`, `simp`, `simp` with the two definitions unfolded, `decide`, `infer_instance`, `aesop`, `grind` with the definitions, `omega`): none of the 15 theorems closes. Elaborated types compared with the README statements: all 21 agree; `boseSet` and `singerSet` do not carry `[Finite k]`, which their bodies do not need and their two theorems do carry.
- Headline theorems: all fifteen are statable at the pins and stated; the module docstring says so.

Overlap check: read FourierAnalyticAdditiveCombinatorics, RamseyNumbers (no roadmap on main is close); nothing shared. Sidon sets, the Bose, Singer and Erdős–Turán sets, sum-free subsets and solution-free sets of one linear equation occur in no other roadmap, on main or open; Schur's theorem for colourings stays with RamseyNumbers 6.1 and bounds for sets without three-term progressions with FourierAnalyticAdditiveCombinatorics and Mathlib.

Source independence: 12 passages compared with 6 sources, none shared (the longest common run is under six words, in formulas the mathematics forces); largest share OBryant2004, 10 of 21 locators; contents compared with OBryant2004: independent (the survey runs terminology, constructions in the order Bose, Singer, Erdős–Turán, then sizes; the roadmap puts the upper bounds first, adds the energy identity and the group bound, and draws Layers 3 and 4 from other sources).

Research link: Layer 4.1 is the bound of Ruzsa (1993) that Bukh (2007) improves for `k ≥ 3`; 3.2 is the Erdős–Alon–Kleitman bound whose optimality Eberhard–Green–Manners (2013) prove; 3.3 is the starting point of Green–Ruzsa (2004); 4.2 is the lower bound Schoen–Sisask (2014) match. Rests on the README's sources, read here.

## Not verifiable

- The journal version of OBryant2004 (Electronic Journal of Combinatorics DS11, 26 July 2004), whose page numbers the README names: the journal's host is not one the sources service reads from; the arXiv version of 8 July 2004 was read instead.
- The Checks reporting searches for every `N ≤ 200000` (1.4), every `N ≤ 10⁶` (2.4, recomputed here only to 20000), `q = 4, 5, 7, 8, 9` (2.2, 2.3) and the grid of 4.2: not recomputed in full.
- Ownership against open pull requests was checked by searching the heads of all open roadmap pull requests and main for the objects; no further reading of unrelated roadmaps was done.

## Source issues

- **Misprint** in OBryant2004 at §4, the paragraph before Theorem 5, p. 10: the source says that for `g = 2` the upper bound is due both to Erdős–Turán and to Singer; it should be the lower bound that is due to Singer; affects nothing.
- **Gap** in GR03 at §1, p. 1: the source says density `2/7` for every cyclic group follows from the interval bound `⌊(m+1)/3⌋/m`; it should pass to a quotient of prime order, since at `m = 4` the bound is `1/4`, and exclude the trivial group; affects nothing.

## For the human reviewers

- Not tested against the cited version: the README's page numbers for O'Bryant's survey name the journal version of 26 July 2004; this review read arXiv:math/0407117v1 (8 July 2004), where all ten locators agree (OBryant2004 lines 98–111, 210–279, 414–442, 681–728).
