# Review of EntropyAndSourceCoding (pull request #2719 at 2d8993b)

**Verdict:** accepted

**Summary.** Accepted: the one finding of the previous review, the false step in the route of 2.4 for values of probability zero, is repaired, and the repaired argument was recomputed and is sound. The two earlier small corrections are repaired in the README; one small correction remains, on the pull request description, which does not yet name the Shearer boundary with ClassicalErgodicTheory §4.6 that the README now states. No format notes. The six Polyanskiy–Wu locators are still unread, and the same two questions of scope and licence are left to the human reviewers.

## C01 — The description names only the Shannon–McMillan–Breiman theorem of ClassicalErgodicTheory, while the README now also sets 1.1 and 1.2 against its §4.6

The description says "The Shannon–McMillan–Breiman theorem of the open roadmaps ArithmeticDynamics §2.7 and ClassicalErgodicTheory, the vector entropy of MeansMajorizationAndDiscreteInequalities §5.4 and the comparison-tree bound of ComparisonSortingAndSelection §1.3 are named as different statements". At this head the scope paragraph (README lines 517–520) also names the strong subadditivity and the finite-set Shearer inequality of ClassicalErgodicTheory §4.6, so a reader of the description alone still cannot tell who owns Shearer's lemma.

One clause would do, for instance: "…and ClassicalErgodicTheory, whose §4.6 also states strong subadditivity and a Shearer inequality for the window labels of a group action (1.1 and 1.2 here are for an arbitrary finite family of finite-valued labels and contain its finite-valued case), the vector entropy of …".

## Previous findings

- R01 — repaired: "Among the optimal codes take one of least total codeword length; in it a longest codeword has its sibling as a codeword, since otherwise it could be shortened without increasing the expected length." (README lines 318–320)
- C01 — partly repaired: the README now says "ClassicalErgodicTheory §4.6 also states strong subadditivity and a finite-set Shearer inequality for the window labels of a group action" (lines 517–520); the description is unchanged (C01 above).
- C02 — repaired: "argue by uncrossing (the roadmap's own route; Galvin's proof of Lemma 2.8 goes through the chain rule with dropped conditioning instead)" (README lines 145–146).

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 2.4 route, sibling step as repaired | longest codeword `w ++ [x]`, `w ++ [y]` absent; `(1/2,1/2,0)`, codes `0,10,110` and `0,10,11` | replacing by `w` keeps a prefix code; expected length not increased, total length `−1`; totals `6` vs `5`, both `3/2` | sound; least total excludes `0,10,110` | none |
| 2.4 route, parenthetical example | `(1/2, 1/2, 0)`, code `0, 10, 110` | `1/2 + 1 + 0 = 3/2`; lengths `(1,2,2)` give `3/2`, zero-weight value short gives `2`; so `L* = 3/2`; `111` absent | true | none |
| 2.4 route, swap step after the choice | least `a`, holder `u` of a longest sibling word | change `(p(a) − p(u))(ℓ(u) − ℓ(a)) ≤ 0`; multiset of codewords, hence total length and sibling pairs, unchanged | sound | none |
| 2.4 sibling property (statement, cited by the route) | `(1/2,1/2,0)`, `a` of weight `1/2`, `b` of weight `0` | code `0, 10, 11` with `a ↦ 10`, `b ↦ 11`: expected length `3/2 = L*`, siblings of greatest length | holds | none |
| 1.2 route attribution | Galvin §2.8 (Galvin lines 383–410) | proof there: chain rule, then dropped conditioning, summed over the sets, each index counted at least `t` times | sentence true | none |
| 1.2 uncrossing route, chain case | chain `F₁ ⊆ … ⊆ Fₘ` covering `ι`; an index in no set | least count of an index = number of sets equal to `ι`; else `k = 0` | sound | none |
| Scope sentence on ClassicalErgodicTheory §4.6 | its open head, README lines 1270–1274 | asks strong subadditivity and "the finite-set Shearer inequality" for `H_μ(ξ^F)`, finite-entropy labels; translates of a finite-valued label are a finite family as in 1.1, 1.2 | sentence true | none |

The rows for the untouched statements stand as in the previous review, of `f4d0f55`.

- Source locators checked against the text in the changed passages: 3 (Galvin §2.8 proof, Galvin lines 383–410; Gallager Lemmas 2.5.1–2.5.3, Gallager lines 703–719, printed p. 30; Gallager's positivity assumption, Gallager line 489, printed p. 26).
- Cross-roadmap citations resolved: 1 (ClassicalErgodicTheory §4.6 at its open head).
- Library declarations: the diff changes no Lean statement and names no library declaration; `Suggested.lean` is unchanged since `f4d0f55`.
- Dependency check: `depcheck: 182 roadmaps, 2069 edges, 0 problem(s)`; the only supplier roadmap is on main.
- Automatic checks: all passed. Elaboration of `Suggested.lean`: 15 `sorry` warnings, nothing else.
- No file outside the roadmap folder is changed.
- Overlap check: read ComparisonSortingAndSelection, SeriesOfIndependentRandomVariables, ClassicalErgodicTheory, ImportanceSamplingAndVarianceReduction, RenyiDivergenceAndPrivacy, AlgebraicCodingTheory as in the previous review, and ClassicalErgodicTheory §4.6 again at this head; its Shearer inequality is for window labels of a group action (owner: ClassicalErgodicTheory), the general finite-family form is owned here and the README now says so; nothing else shared. DifferentialEntropyAndEntropyPower, new in the closest list, was not read.

Source independence: changed passages only; 3 passages compared with 2 sources (Gallager, Galvin), none shared in wording; largest share Gallager, 11 of 21 locators; the diff adds, removes and reorders no layer, so the arrangement stands as compared in the previous review (independent). Polyanskiy–Wu could not be read.

Research link: Shearer's lemma (Chung, Graham, Frankl, Shearer 1986) is the tool of the entropy counting method surveyed in Galvin 2014 (§§3–4, graph-copy counts); Fano's inequality underlies minimax lower bounds as in MathematicalStatisticsNonparametric §2.4. Rests on Galvin's text and the README's scope section.

## Not verifiable

- Polyanskiy–Wu, Theorems 1.6 (p. 16), 1.8 with (1.18) (p. 18), 3.12 with (3.18) (p. 57), 10.9 part 2 (pp. 207–208), 10.10 (p. 209) and Remark 10.4 (p. 208): not read, as in the previous review; the change touches none of these locators.

## Source issues

- none

## For the human reviewers

- **Scope.** The headline theorems are textbook results (Shannon 1948, Kraft 1949, Huffman 1952, Fano 1961, Shearer 1986); the sources are two textbooks, course notes and a tutorial preprint (README References).
- **Licence.** The MacKay copy on the author's page carries the notice that on-screen viewing is permitted and printing is not (MacKay line 5).
- **Not tested.** Polyanskiy–Wu (6 of 21 locators) could not be read: wording and locators were not compared with it. The source with the largest share, Gallager, was read.
