# Review of CommunicationComplexity (pull request #2751 at a3210a8)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every statement, Check and worked value was recomputed (degenerate cases `n = 0`, empty inputs, signed weightings, the ranks over `ℝ` and `𝔽₂`, the Lindsey maxima `2, 5, 11`) and none is false; `Suggested.lean` elaborates with `sorry` as its only warning and none of its 15 theorems closes in one tactic. There is one small correction and three format notes, none blocking. Left for a human: two of the three cited texts (Lee–Shraibman and the Arora–Barak draft, 27 of the 34 locators) could not be read from a place the project accepts, so their locators, wording and table of contents were not compared.

## C01 — The complexity, the partition number and fooling sets are stated for `Bool`-valued functions only, although nothing in 1.3, 2.1 or 2.3 uses that the outputs are bits

`Protocol X Y Z` is defined for an arbitrary output type, but `commComplexity`, `IsMonoRectangle`, `partitionNumber`, `IsFoolingSet` and the theorems of 1.1, 1.3, 2.1 and 2.3 take `f : X → Y → Bool` (`Suggested.lean` lines 72, 84, 89, 104, 126). An implementer who later needs a function with values in a finite set (a relation, a multi-bit output) must restate all of them. The routes of 1.1 (Bob announces `f x y`, which costs `⌈log₂ |Z|⌉` bits in general), 1.3, 2.1 and 2.3 never use that there are two values; only the rank bound 2.2, discrepancy and Layer 4 do.

The smallest change would be to let `IsMonoRectangle`, `partitionNumber`, `IsFoolingSet` (with `b : Z`), 1.3, 2.1 and 2.3 take `f : X → Y → Z`, keeping `Bool` from 2.2 on; or to say in the Conventions that the restriction to bits is deliberate and why. Either is fine.

## N01 — The Conventions ask for decidable equality in the discrepancy statements, which the Lean statements do not carry

The first bullet of the Conventions (line 43) says the statements about discrepancy assume decidable equality on `X` and `Y`; `discrepancy` and the theorems of 3.2 and 3.3 assume only `[Fintype X] [Fintype Y]`. Dropping "and discrepancy" from that clause makes the two agree.

## N02 — Six Lee–Shraibman locators are pages of the web version only

The trivial protocol (p. 2), disjointness (pp. 17–18), the Sylvester matrix (p. 23), the public-coin model (pp. 41–42), equality (p. 44) and discrepancy (pp. 56–57) are located by a page of the version on the author's page, which is numbered from 1; the journal issue runs over pp. 263–399. A section number beside each page would let a reader of the published text find them.

## N03 — The second layer has one title in the README and another in the Lean file

"Layer 2: partitions, rank and fooling sets" in the README is "Layer 2: rectangle partitions, rank and fooling sets" in the section comment of `Suggested.lean` (line 95).

## Questions for the author

- Do Definitions 2.1–2.2 and Theorems 2.1, 2.3 and 4.9 carry the same numbers in the published Lee–Shraibman survey as in the web version cited? Neither text could be read here, so the numbering was not compared.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.1 `commComplexity`, `commComplexity_le` | `X` empty, one point, three points; `Y` infinite; `X = Y = ℕ` | `clog 2 0 = 0`: bound 1, true value 0; one point: bound 1; three: 2+1 = 3 = exact (χ = 6 > 4); ℕ: set empty, junk 0, excluded by `[Fintype X]` | holds | none |
| 1.2 `transcript_eq_of_transcript_eq` | leaf; Alice node; `[x && y]` non-example | leaf: `[] = []`; Alice: `a x = a x'` forces one subtree; non-example groups (t,f),(f,t) without (t,t) | holds, any `Z` | none |
| 1.3 leaf partition | `X` empty; unreachable leaf; the `x && y` protocol | empty: 0 parts ≤ 1; unreachable: 1 part ≤ 2; `x && y`: 3 parts ≤ 4 | holds | C01 |
| 2.1 `partitionNumber`, `χ ≤ 2^D` | empty inputs; constant; EQ₁; `x && y` | 0 ≤ 1; 1 ≤ 1; 4 ≤ 2²; 3 ≤ 2² ; set nonempty by singletons | holds | C01 |
| 2.2 rank bound | constant; EQ on 3 points over ℝ, 𝔽₂; IP₃ over ℝ, 𝔽₂; empty | 0+1 = 1 = χ; 3+3 = 6 = χ, 3+2 = 5 ≤ 6; 7+8, 3+4 ≤ χ; 0 ≤ 0 | holds over every field | none |
| 2.3 fooling sets | EQ diagonal; DISJ `(x, ¬x)`; `x && y` pair with `b = false`; non-example | 2ⁿ pairs, crossed values false; crossed pair meets at a differing position; 2+1 = 3 = χ; (f,f),(f,t) crossed both false | holds | C01 |
| 2.4 EQ and DISJ equal `n + 1` | `n = 0, 1, 2, 3` | `n = 0`: both constant true, D = 0 ≠ 1, excluded; upper `clog 2 2ⁿ + 1 = n+1`; lower 2ⁿ+1 ≤ χ ≤ 2^D; DISJ ranks 2,1; 4,3; 8,7 | holds for `n ≥ 1` | none |
| 3.1 `discrepancy` | `x && y` uniform; signed sum under both sign conventions; empty rectangle | max over rectangles 2/4 = 1/2; signed 1/2 versus 1/4; empty gives 0 | holds; absolute value fixes the convention | N01 |
| 3.2 distributional bound | `μ = 0`; signed `μ`; depth 0 answering false on `x && y`; empty `X × Y` | `μ = 0`: 1 ≤ 0 false, excluded by `∑ μ = 1`; sum of signs = 1 − 2·err exactly for signed μ; 1/2 = 2⁰·1/2; empty: hypothesis 0 = 1 | holds | none |
| 3.3 public-coin bound | `w = (−1, 2)` on one point; empty family; signed `μ` | 3 > 1 without `w ≥ 0`; 1 ≤ 1/2 fails without `∑ w = 1`; averaging step needs `μ ≥ 0`, present | holds | none |
| 4.1 Hadamard | `n = 0, 1`; 0–1 matrix; Mathlib's definition at the pin | `[[1]]`; `[[1,1],[1,−1]]² = 2·1`; `card (Fin n → Bool) = 2ⁿ` matches `Fintype.card n • 1`; `[[0,0],[0,1]]` not Hadamard | holds | none |
| 4.2 Lindsey | `n = 0`; all `A, B` for `n = 1, 2, 3`; whole cube | 1 ≤ 1; maxima 2, 5, 11 against 2.83, 8, 22.6; whole cube 2ⁿ ≤ 2^(3n/2) | holds | none |
| 4.3 discrepancy of IP, public coin | `n = 0, 1, 2, 3`; `n = 2, d = 0` | disc 1, 1/2, 5/16, 11/64 against 1, 0.707, 0.5, 0.354; `ε ≥ 1/4` required, constant mixtures have `ε ≥ 1/2` | holds | none |
| 4.4 IP equals `n + 1` | `n = 0, 1, 2, 3` | `n = 0`: constant false, D = 0, excluded; ranks 1,2; 3,4; 7,8: sum 2^(n+1) − 1 > 2ⁿ, so D ≥ n+1; `J + H = H(I + e₀1ᵀ)`, det factor 2 | holds for `n ≥ 1` | none |

- Source locators checked against the text: 7 of 34 (Bun2019 lines 13, 24–28, 35–40, 170, 186–188, 238–243); all 7 support the statements as written.
- Library declarations opened at the pin: 29 of the 34 the supplier contracts name (the five not opened are the bare definitions `Nat.clog`, `Finpartition`, `Finset.product`, `Matrix.mulVecLin`, `Real.sqrt`); e.g. `Matrix.IsHadamard` at `Mathlib/LinearAlgebra/Matrix/HadamardMatrix.lean` line 51, `IsHadamard.det_ne_zero` line 198, `Matrix.rank` at `Mathlib/LinearAlgebra/Matrix/Rank.lean` line 134, `LinearMap.rank_finsetSum_le` at `Mathlib/LinearAlgebra/Dimension/LinearMap.lean` line 98, `AddChar.sum_eq_ite` at `Mathlib/Algebra/Group/AddChar.lean` line 354; all 29 exist with the hypotheses described. `Finset.sum_partition` and `Finset.sum_comm` are the additive forms of `prod_partition` and `prod_comm`.
- Cross-roadmap citations resolved: 2 neighbours described, none a supplier (BooleanFunctionAnalysis Layer 1, 1.1 Walsh characters; LinearAlgebraMethodInCombinatorics Layer 4, 4.2 Graham–Pollak); both descriptions agree with the open heads.
- Dependency check: `depcheck: 182 roadmaps, 2068 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks: all passed at this head. Elaboration of `Suggested.lean`: 15 `sorry` warnings, nothing else. `#check @name` on the declarations: `commMatrix` and `IsFoolingSet` do not carry the section's `Fintype`/`DecidableEq` binders, which their bodies do not need; nothing changed.
- One-tactic probe (`rfl`, `simp`, `infer_instance`, `omega`, `trivial`, `simp_all`) on a copy: 0 of 15 theorems close. A `decide` test of `innerProduct`, `disjointness` and `equality` on small inputs passes.
- Headline theorems (15) all stated; none is declared not statable. No object of this roadmap exists in Mathlib or Tau Ceti at the pins (search for protocols, fooling sets, communication complexity, Lindsey: no file).
- Overlap check: read DecisionTreeComplexity, ComparisonSortingAndSelection, ReLUNetworkExpressivity, BooleanFunctionAnalysis, LinearAlgebraMethodInCombinatorics; nothing shared.

Source independence: 12 passages compared with 1 source (Bun2019), none shared; largest share Lee–Shraibman, 17 of 34 locators; contents not compared: neither the text nor the table of contents of Lee–Shraibman or of the Arora–Barak draft could be read.

Research link: The partition, rank, fooling-set and discrepancy bounds are the opening lower-bound methods of the Lee–Shraibman survey (2009) and of Kushilevitz–Nisan (1997), going back to Yao (1979), Mehlhorn–Schmidt (1982) and Chor–Goldreich (1988); they are prerequisites of the log-rank conjecture and norm-based bounds the README places outside its scope. Rests on the README's references.

## Not verifiable

- Lee–Shraibman, all 17 locators (1.1, 1.2, 1.3, 2.1, 2.2, 2.4, 3.1, 3.2, 3.3, 4.1, 4.3, 4.4 and the Conventions): the publisher's page is closed and the web copy was not accepted as an author's page by the sources service; a request for the text is filed.
- Arora–Barak draft of 2007, all 10 locators (1.1, 1.2, 1.3, 2.1, 2.2, 2.3, 3.2, 4.2, 4.3), and the slip the README reports in Example 12.14: the publisher's page is closed and the draft's host was not accepted; a request for the text is filed.
- The exhaustive searches over all protocols quoted in the Checks of 1.1, 2.4 and 4.4 were not rerun; the values they report follow from the theorems of the same sections, which were checked by hand.

## Source issues

- **Misprint** in Bun2019 at proof of Theorem 2, p. 2: the source says the subtracted term in the combined sum uses the first rectangle's output for every index; it should be the output of the i-th rectangle; affects nothing.
- **Misprint** in Bun2019 at Section 2, p. 5 (after Theorem 6): the source says the average over x of the product of two columns of the sign matrix is 0 for equal columns and 1 otherwise; it should be 1 for equal columns and 0 otherwise; affects nothing.

## For the human reviewers

- **Not tested.** Lee–Shraibman has the largest share of the locators (17 of 34); neither its text nor its table of contents could be read, nor the Arora–Barak draft (10 locators). Wording and arrangement were compared with Bun2019 only.
- **Licence.** The README cites a web version of Lee–Shraibman on the second author's page and a January 2007 draft of Arora–Barak from the authors' page, not the published texts (README, References); the status of the two hosts was not settled.
- **Scope.** The third source, Bun2019, is a set of course lecture notes, not a refereed text; it carries 7 locators (3.1–3.3, 4.1–4.3), each doubled by a Lee–Shraibman or Arora–Barak locator except Claim 4 and Lemma 5.
