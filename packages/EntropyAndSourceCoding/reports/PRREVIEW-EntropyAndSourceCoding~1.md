# Review of EntropyAndSourceCoding (pull request #2719 at f4d0f55)

**Verdict:** needs changes

**Summary.** Changes are needed for one sentence: the route of 2.4 asserts a property of every optimal binary prefix code that fails as soon as a value has probability zero, which is the generality the same section claims. Every stated theorem, definition and Check survived recomputation, and `Suggested.lean` elaborates with `sorry` as its only warning. There are two small corrections and no format notes; the six Polyanskiy–Wu locators could not be read, and two questions of scope and licence are left to the human reviewers.

## R01 (P2) — The route of 2.4 says that in an optimal code a longest codeword has its sibling as a codeword; this is false when a value has probability zero

Section 2.4 states the sibling property "for every measure and every map `X`", so values of weight zero are allowed, and its route (README line 317) then argues "in an optimal code a longest codeword has its sibling as a codeword, since otherwise it could be shortened". An implementer who formalises that step as written is stuck: shortening a codeword of weight zero does not lower the expected length, so it does not contradict optimality.

The roadmap's own law `(1/2, 1/2, 0)` is a counterexample. The binary code `0, 10, 110` is injective and prefix-free, its expected length is `1/2 + 1 + 0 = 3/2`, which is `L*` by the Check of 2.2, and its longest codeword `110` has sibling `111`, which is not a codeword. Gallager's Lemmas 2.5.2 and 2.5.3 (p. 30), which the route cites, are proved under his standing assumption that every symbol has positive probability (p. 26). The target itself is unaffected: it asserts that *some* optimal code has the property, and that is true.

The smallest repair is to choose the code before using the step, for instance: "among the optimal codes take one of least total codeword length; in it a longest codeword has its sibling as a codeword, since otherwise it could be shortened without increasing the expected length".

## C01 — The scope paragraph on ClassicalErgodicTheory names only its Shannon–McMillan–Breiman theorem, but that roadmap also states strong subadditivity and a Shearer inequality

In "Different statements in open roadmaps" (README lines 506–512) ClassicalErgodicTheory is described as stating "an amenable form" of Shannon–McMillan–Breiman. At its open head, §4.6 of ClassicalErgodicTheory (README lines 1270–1274) also asks for strong subadditivity and "the finite-set Shearer inequality" for the window labels `ξ^F` of a group action, for labels of finite entropy. A reader comparing the two roadmaps cannot tell from this README who owns Shearer's lemma.

The statements differ: there the family is the translates of one label, with countably many values allowed; 1.1 and 1.2 here are for an arbitrary finite family of finite-valued labels, and contain the finite-valued case of that one. One sentence saying so in the scope paragraph (and in the pull request description, which lists the same boundary) would settle it; nothing here depends on that roadmap.

## C02 — "The uncrossing argument of the cited proof" in 1.2 does not describe the proof in Galvin

The route of 1.2 (README line 145) says "follow the uncrossing argument of the cited proof", after citing Polyanskiy–Wu, Theorem 1.8, and Galvin, Lemma 2.8. Galvin's proof of Lemma 2.8 (§2.8, pp. 8–9; Galvin lines 386–410) is the chain-rule argument with dropped conditioning, not uncrossing through submodularity. I could not read Polyanskiy–Wu, so I do not know whether its proof is the one meant. Name the source whose proof the route follows, or present the uncrossing route as the roadmap's own; the route itself is sound (see the table kept with the report).

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 submodularity | fair bit `X₁ = X₂`, `S={1}`, `T={2}`; independent bits; `S ⊆ T` | `log 2 + 0 ≤ 2 log 2`; `2 log 2 = 2 log 2`; both sides `H(X_T)+H(X_S)` | holds; reverse fails | none |
| 1.2 Shearer, entropy form | even-weight words in `{0,1}³`; all 8 words; `m = 0`; `ι` empty | `4 log 2 ≤ 6 log 2`; `6 log 2 = 6 log 2`; `m=0` forces `k=0` or `H=0` | holds | C02 on the route's attribution |
| 1.2 uncrossing route | chain `F₁ ⊆ … ⊆ Fₘ` | least count of an index equals number of sets equal to `ι` | sound | none |
| 1.2 counting form | cube and 3 coordinate planes; `k=0`, `T=∅`; `ι` empty, `T={f}`; `A i` empty | `64 ≤ 64`; `0⁰ = 1 > 0`; `1 ≤ 1`; `0 ≤ …` | holds; `k ≥ 1` needed | none |
| 1.3 Fano | uniform on 3, `Y`, `g` constant; `|A| = 1`; `|A| = 2` | `h(2/3) + (2/3) log 2 = log 3 ≈ 1.0986`; `log 0 = 0`, both sides 0; `H(X|Y) ≤ h(Pₑ)` | equality attained | none |
| 1.3 Lean cast | `Real.log (Fintype.card A - 1)` | elaborates as `↑(card A) − 1` in `ℝ`, not natural subtraction | no junk value | none |
| 2.1 converse of Kraft | `(1,2,2)`; `(1,1,2)`; single length 0; `(0,1)`; `D = 1`; `ι` empty | sums `1`, `5/4`, `1`, `3/2`; `D=1` gives `|ι| ≤ 1` | holds | none |
| 2.2 bounds | `(1/2,1/4,1/4)`; uniform on 3, `D=2,3`; one value; `(1,0)`; `(1/2,1/2,0)` | `L*=3/2=H/log 2`; `5/3` (`1.1552` in `[1.0986, 1.7918]`), `1`; `0`; `L* log 2 = H + log 2`; `3/2` | holds; strictness needs positivity | none |
| 2.2 route, zero-probability values | Kraft sum of Shannon lengths `< 1` and `= 1` | room `1 − S > 0`; or extend a longest word: cost `p ≤ 1`, frees `D^(−ℓ)(1 − 1/D)` | sound | none |
| 2.3 uniquely decodable | `{0,01,011}` on `(1/2,1/4,1/4)`; `{0,1,10}`; constant `0`; `D=1`; `ι` empty | `7/4 ≥ 3/2`; `4/3 < 5/3`; `1 < 5/3`; `|ι| ≤ 1`; `0 ≤ 0` | holds; both hypotheses needed | none |
| 2.4 sibling property | two values; weights `(1,0,0)`; all weights 0; four equal | `{0,1}`; `0,10,11` optimal with siblings; any code optimal | statement holds | none |
| 2.4 route step | `(1/2,1/2,0)`, code `0,10,110` | expected length `3/2 = L*`; sibling `111` of `110` absent | step false | R01 |
| 2.4 merge identity | `(0.4,0.3,0.2,0.1)`; two values; `(1/2,1/2,0)`; non-least pair in `(1/2,1/4,1/4)` | `1.6+0.3=1.9`; `0+1=1`; `1+1/2=3/2`; `1+3/4=7/4 ≠ 3/2` | holds; least-pair hypothesis needed | none |
| 3.1 typical set | `(3/4,1/4)`, `ε=0.1`, `n=10,1,2`; `n=0`; constant source; `(1,0)` | `H≈0.5623`; `j=2,3`: `45+120=165`, prob `≈0.5318`, bound `≈752.5`; empty for `n=1,2`; one word | holds | none |
| 3.1 cardinality bounds | any `ε`, any `n`; `δ ≥ 1` | `#T · e^(−n(H+ε)) ≤ 1`; lower bound trivial for `δ ≥ 1` | holds | none |
| 3.2 smallest sets | `δ = 1`; uniform on `m`; constant source | `∅` has probability `≥ 0`; `⌈(1−δ)mⁿ⌉`; `|B| ≥ 1 ≥ e^(−nε)` | holds; `δ<1` needed | none |
| 3.3 block codes | `(3/4,1/4)`, `n=1,2`; uniform on `D` values | `L*₁=1`, `L*₂=27/16`, `0.8438` vs `0.8113`; `L*ₙ=n` | holds | none |
| Definitions `labelEntropy`, `condLabelEntropy` | compared with ProbabilisticAndMetricNumberTheory §5.1a | same sums, `p_b / p_ab` orientation | agree | none |
| `IsPrefixCode` on Mathlib's `IsPrefixFree` | `{[]}`; two words with `[]` | prefix-free; forced equal to `{[]}` | conventions as stated | none |

- Source locators checked against the text: 15 of 21 (Gallager 11, MacKay 2, Galvin 2); the 6 Polyanskiy–Wu locators could not be read.
- Library declarations opened at the pin: 22 (Mathlib `InformationTheory/Coding/PrefixFree.lean:39`, `UniquelyDecodable.lean:39`, `Kraft.lean:43`, `KraftMcMillan.lean:146`, `BinaryEntropy.lean:64`, `StrongLaw.lean:787`, `ConvergenceInMeasure.lean:219`, `Jensen.lean:72`, `Data/Finset/Pi.lean:163`, and the independence, identical-distribution, Tau Ceti entropy declarations named in the README); all exist as described.
- No converse of Kraft's inequality, Shearer's lemma, Fano's inequality or typical set exists in Mathlib or Tau Ceti at the pins.
- Cross-roadmap citations resolved: 7 (ProbabilisticAndMetricNumberTheory §5.1a, §5.2; GeometryOfNumbersAndQuadraticArithmetic §4.2; MathematicalStatisticsNonparametric §2.4 on main; ArithmeticDynamics §2.6–2.7, MeansMajorizationAndDiscreteInequalities §5.4, ComparisonSortingAndSelection §1.3 at open heads).
- Dependency check: `depcheck: 182 roadmaps, 2069 edges, 0 problem(s)`; the only supplier roadmap is on main.
- Automatic checks: all passed. Elaboration of `Suggested.lean`: 15 `sorry` warnings, nothing else. `#check @name` types compared with the README for all 24 declarations: three definitions drop the unused `[MeasurableSpace Ω]`, no hypothesis is lost.
- One-tactic probe (`rfl`, `simp`, `infer_instance`) on all 15 theorems: none closes. All headline theorems of the README are stated; none is a stand-in.
- Overlap check: read ComparisonSortingAndSelection, SeriesOfIndependentRandomVariables, ClassicalErgodicTheory, ImportanceSamplingAndVarianceReduction, RenyiDivergenceAndPrivacy, AlgebraicCodingTheory; Shearer's inequality appears in ClassicalErgodicTheory §4.6 for window labels of a group action (a different carrier; this roadmap owns the general finite-family form, C01); nothing else shared.

Source independence: 14 passages compared with 3 sources (Gallager, MacKay, Galvin), none shared in wording; the length examples `(1, 2, 2)` and `(1, 1, 2)` of 2.1 are the ones Gallager gives after Theorem 2.3.1; largest share Gallager, 11 of 21 locators; contents compared with Gallager Chapter 2: independent (Layer 1 is absent there, block codes precede the AEP there and follow it here, and the order 2.1, 2.2, 2.4 is forced by the Needs lines of 2.2 and 2.4). Polyanskiy–Wu could not be read.

Research link: Shearer's lemma (Chung, Graham, Frankl, Shearer 1986) is the tool of the entropy counting method surveyed in Galvin 2014 (§§3–4, graph-copy counts); Fano's inequality underlies minimax lower bounds as in MathematicalStatisticsNonparametric §2.4. Rests on Galvin's text and the README's scope section.

## Not verifiable

- Polyanskiy–Wu, Theorems 1.6 (p. 16), 1.8 with (1.18) (p. 18), 3.12 with (3.18) (p. 57), 10.9 part 2 (pp. 207–208), 10.10 (p. 209) and Remark 10.4 (p. 208): the publisher's page is closed and the prepublication file on the first author's page could not be fetched as an author's page; the text has been requested. The statements they are cited for were checked by computation and, for 2.1, 2.2 and 3.x, against Gallager.

## Source issues

- none

## For the human reviewers

- **Scope.** The headline theorems are textbook results (Shannon 1948, Kraft 1949, Huffman 1952, Fano 1961, Shearer 1986); the sources are two textbooks, course notes and a tutorial preprint (README References).
- **Licence.** The MacKay copy on the author's page carries the notice that on-screen viewing is permitted and printing is not (MacKay line 5).
- **Not tested.** Polyanskiy–Wu (6 of 21 locators) could not be read: wording and locators were not compared with it. The source with the largest share, Gallager, was read.
