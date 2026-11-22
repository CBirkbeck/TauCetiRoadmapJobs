# Review of SturmianWordsAndThreeDistances (pull request #2959 at 149f1f3)

**Verdict:** needs changes

**Summary.** Needs changes, for one false sentence: the Conventions state `{−kα} = 1 − {kα}` for `k ≥ 1` without restriction, which fails when `kα` is an integer, and rational slopes are in the scope of 3.2. The three headline theorems, their proof routes and every Check were recomputed and hold; the file elaborates with `sorry` as the only warning. There are three small corrections and two format notes, none blocking, and two points for a human (the reliance on a single opened source, a survey; an author-page copy).

## R01 (P2) — The identity `{−kα} = 1 − {kα}` for `k ≥ 1` in the Conventions is false when `kα` is an integer

The bullet "Points of the circle" (README line 64) says "Since `{−kα} = 1 − {kα}` for `k ≥ 1`, they are the points `{k(1 − α)}`". The bullet speaks of every real `α`, and 3.2 uses these points for rational slopes, where the identity fails: for `α = 1/2`, `k = 2`, the left side is `{−1} = 0` and the right side is `1 − {1} = 1`. An implementer who takes it as a standing fact gets the point `1`, outside `[0, 1)`, exactly in the rational case that 3.2 treats separately. Mathlib's `Int.fract_neg` carries the hypothesis `fract x ≠ 0` (`Mathlib/Algebra/Order/Floor/Ring.lean`, line 551), as the supplier contracts of this README themselves record.

The conclusion needs no such identity: `k(1 − α) − (−kα) = k` is an integer, so `{k(1 − α)} = {−kα}` for every real `α`. Replace the reason by that one, or restrict the identity to `kα ∉ ℤ`.

## C01 — "one of `nα + ρ`, `(n + 1)α + ρ` is an integer" in 1.1 must read "exactly one"

In "Where they differ" (line 90) the two words differ at `n` exactly when exactly one of the two numbers is an integer: the difference of the letters is `(⌈x + α⌉ − ⌊x + α⌋) − (⌈x⌉ − ⌊x⌋)`. Read as "at least one", the sentence fails for `α = 2`, `ρ = 0`: both numbers are integers at every `n`, and both words are constantly `2`. Writing "exactly one" removes the ambiguity; the irrational case and the Checks are unaffected.

## C02 — Alessandri–Berthé do not speak of mechanical words, and the two codings are in the opening of §2, not in §2.1

1.1 says "Lothaire's lower and upper mechanical words, as Alessandri–Berthé §2.1 recall them through rotations" (line 77). The source never uses the word "mechanical" and does not cite Lothaire; it defines codings of rotations, and the two partitions `[0, 1 − α)`, `[1 − α, 1)` and `(0, 1 − α]`, `(1 − α, 1]`, as well as the Fibonacci sequence, stand on p. 6 in the opening of §2, before the heading of §2.1 (AlessandriBerthe1998 lines 224–236; §2.1 begins at line 246). The page numbers given are right. Would "which Alessandri–Berthé §2, p. 6, present as codings of rotations" serve, with "§2, p. 6" also in the Rotation-coding bullet and in the first Check of 1.1?

## C03 — The Weyl-sum computation in the route of 2.1 is a result ProbabilisticAndMetricNumberTheory §2.5 already states

The route of 2.1 bounds the geometric sum by hand and enters `uniformDistribution_mod_one_tfae` at its third condition. The same §2.5 states `linear_equidistribution_tfae` (equidistribution of `n • α + β` for irrational `α`, proved there by the same geometric sum), and Equidistribution 2.2 consumes it in that form at `d = Unit`. Either cite it and enter the equivalence at its first condition, or say in one clause that the direct computation is kept to avoid the passage from `UnitAddTorus Unit` to `UnitAddCircle`; 3.2's "the Weyl-sum computation of 2.1" then points at the same place.

## N01 — Theorem 8 gives "at most three values" only

The Consequence in 3.2 (line 270) cites Alessandri–Berthé §2.3, Theorem 8 for "the three-distance form of the frequencies"; the relation "one is the sum of the other two" is in the statement of the three distance theorem in §3, p. 11. Adding "§3, p. 11" there would make the locator exact.

## N02 — "(Proved here.)" in 4.2 repeats the preceding clause

Line 328 already says the proof is written in full; the parenthesis can go. The primary source for 4.2, which the survey names (Morse–Hedlund 1940), would be a welcome second reference beside the survey.

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| 1.1 definitions | `α = 1/2, 3/2`, `ρ = 0`; `α = 2 − φ`, `ρ = α` | lower `0101…`, upper `1010…`; `1212…`; 28 letters equal the printed Fibonacci word | agree |
| 1.1 upper/lower difference | `α = √2 − 1`, `ρ = 0` and `ρ = 3 − 5α`; `α = 2`, `ρ = 0` | differ at `{0}`; at `{4, 5}`; nowhere (both numbers integers) | Checks true; C01 |
| 1.1 Fibonacci against source | source coding `α = τ − 1`, `x = α` | source `10110…`, README `01001…`: letters exchanged | agrees with p. 6 |
| Conventions identity | `α = 1/2`, `k = 2` | `{−1} = 0`, `1 − {1} = 1` | false: R01 |
| 1.2 complexity | `n = 0`; slope `1/2`, `n = 2`; Fibonacci `n = 3` | 1; 2 factors `01, 10`; 4 factors `001, 010, 100, 101` | agree |
| 2.1 `complexity_eq_add_one` | 6 irrational slopes (incl. `−√2/3`, `−φ`, `3/2 + √2`, `√7`), 5 intercepts, lower and upper, `n ≤ 5`, 3000 positions | `n + 1` factors in all 360 cases; `3/2 + √2`: `23, 32, 33` | holds |
| 2.1 negative control | `α = 1/2`, `n = 2`; `α = 1/3`, `n = 3` | 2 and 3 factors, not 3 and 4 | irrationality needed |
| 3.1 Checks | empty word; `0101…`, `w = 01` | count `N + 1`, frequency 1; count `⌊N/2⌋ + 1`, frequency `1/2` | true |
| 3.2 factor set, irrational | same 360 cases | factor set equals `{wₜ}` over the points `{−kα}`, words distinct | holds |
| 3.2 frequencies, irrational | same cases | empirical frequencies within 0.02 of the gaps, in order | holds |
| 3.2 rational slopes | all `p/q` lowest terms, `|p| ≤ 7`, `q ≤ 5`, 5 rational intercepts, lower and upper, `n ≤ 6` | factor sets equal; frequencies over 60 periods equal the gaps exactly | holds |
| 3.2 degenerate | `n = 0`; `α = 0`; `α = 1/2`, `n = 2` | one point, gap `{1}`, frequency 1; `{0}`, word `0ⁿ`; `{1/2, 1/2}` both sides | holds |
| 3.2 Fibonacci Checks | `n = 2, 3` | points `0, .2361, .6180, .8541`; frequencies `.236, .382, .382` and `.236, .382, .236, .146` | equal printed surds |
| Layer 3 golden example | `n = 3` | `(3 − √5)/(7 − 3√5) = 2.6180 = φ²` | true, bound attained |
| 4.1 Checks | `0011…`; Thue–Morse; `010000…` | sums 0 and 2; contains `00` and `11`; at most one `1` | true |
| 4.2, mechanical ⇒ balanced | Fibonacci word, lengths `< 60` | maximal spread of factor sums 1 | holds |
| 4.2 route, steps 1–5 | read line by line; `u = upperMechanical α 0` | `a₀ = 0 = I` attained, `S = 1` not; no `ρ′` makes it a lower word (`ρ′ < 1` and `ρ′ ≥ 1`) | proof sound |
| 4.2 Checks | `5 + lower`; block word | letters 5, 6; `0110` and `1111` sums 2 and 4 | true |
| `Suggested.lean` against README | `#check` types of all 11 declarations | same hypotheses and generality; no binder lost | agree |

- Source locators checked against the text: 11 (pp. 6, 7, 8, 11, 16–17, 17–18 of AlessandriBerthe1998), all right in page; two section labels off (C02), one incomplete (N01).
- Library declarations opened at the pin: 15 (`Int.floor_add_intCast` Ring.lean 186, `Int.ceil_add_intCast` 742, `Int.ceil_neg` 738, `Int.fract_neg` 551, `Int.floor_eq_iff` 139, `Int.ceil_eq_iff` 667, `Subadditive.tendsto_lim` Subadditive.lean 155, `Irrational.neg` 257, `Irrational.ne_int` 181, `fourier_coe_apply` 132, `Filter.limUnder` Defs/Filter.lean 270, `Set.Infinite.ncard` 684, `List.HasPeriod.gcd` 185, `beattySeq` 53, `compl_beattySeq` 120).
- Cross-roadmap citations resolved on main: Equidistribution 4.1, 4.2, 4.5 (definitions and three theorem names present; the two definitions copied are identical in body), SubspaceTheorem 7.2, 7.3 (`complexity` identical), ProbabilisticAndMetricNumberTheory §2.5 (`uniformDistribution_mod_one_tfae`, same `i ≤ n` over `n + 1` normalisation).
- No Sturmian, mechanical-word or balanced-word declaration in the pinned Mathlib or Tau Ceti; no other roadmap, open or on main, states these objects.
- Dependency check: `depcheck: 168 roadmaps, 1959 edges, 0 problem(s)`. No change outside the folder.
- Automatic checks: all passed. Elaboration: three `sorry` warnings, nothing else. One-tactic probe (`rfl`, `simp`, `infer_instance`, `simp` with the definitions unfolded) closes none of the three theorems.
- Headline theorems: three (complexity, factors and frequencies, balance), all stated in `Suggested.lean`; the three-value consequence is an application of Equidistribution 4.2 and is rightly not restated.
- Pull-request text read against the head: no sentence contradicted.

Overlap check: read CombinatoricsOfWords, Equidistribution, SubspaceTheorem; nothing shared (CombinatoricsOfWords lists infinite and Sturmian words as outside its scope; Equidistribution owns the points and gaps and SubspaceTheorem the complexity function, both cited here, not restated).

Source independence: 9 passages compared with 1 source, none shared; largest share AlessandriBerthe1998, 12 of 13 locators; contents compared with AlessandriBerthe1998: independent (Layers 1 to 4 all draw on its §§2–2.1 and §2.3, its §§3–8 are not planned). Lothaire's text was not read.

Research link: The source (Alessandri–Berthé 1998) presents the factor-frequency theorem as equivalent to the three distance theorem of Sós (1958), after Berthé (1996), and the complexity and balance characterisations as Morse–Hedlund (1940) and Coven–Hedlund (1973); rests on AlessandriBerthe1998 §§2.1, 2.3 and its bibliography.

## Not verifiable

- Lothaire, *Algebraic Combinatorics on Words*, Chapter 2, cited for the names "lower" and "upper mechanical word": not read (a commercial book, no legal copy looked for beyond the roadmap's own statement that it was not opened).

## Source issues

- **Misprint** in AlessandriBerthe1998 at Theorem 1, p. 3: the source says the points `iα`, `0 ≤ i ≤ n − 1`, cut the circle into `n + 1` intervals; it should be `0 ≤ i ≤ n` (or `n` intervals); affects nothing.

## For the human reviewers

- Scope: the only source opened is one survey (AlessandriBerthe1998, Enseign. Math. 1998); it states the balance theorem of 4.2 without proof, and the README supplies its own proof. Lothaire is cited for terminology and was not opened.
- Licence: AlessandriBerthe1998 was read from a copy on the page of one of its authors (V. Berthé); the README uses that copy's page numbers, not the journal's (103–132).
