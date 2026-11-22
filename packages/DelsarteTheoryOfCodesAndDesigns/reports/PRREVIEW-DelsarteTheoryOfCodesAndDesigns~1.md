# Review of DelsarteTheoryOfCodesAndDesigns (pull request #3009 at 77a9ff4)

**Verdict:** accepted

**Summary.** Accepted: no statement, Check or route step was found false, and every numerical Check of the README was reproduced in exact rational arithmetic (both linear programs and the dual, the Krein parameters and cometric orders, the Hahn identity for every `J(n, k)` with `2k ≤ n ≤ 8`, the design transforms). The fifteen copied definitions are identical to their owners' at the current heads, all sampled locators hold in the sources, and no other roadmap owns any of the targets. There are two small corrections (the few-distance bound of 5.1 has no locator; a citation in 1.2 is attached to the wrong program) and one format note, none blocking. Two points are left for the human reviewers.

## C01 — The absolute bound for few-distance sets on the sphere (second target of 5.1) carries no source locator

In 5.1 (README lines 535–542) the citation covers only the design bound ("the first is the Delsarte–Goethals–Seidel bound, stated as `D(n, 2k)` in Boyvalenkov–Dragnev–Hardin–Saff–Stoyanova"); `card_le_multichoose_add_multichoose` is left with "no opened source proves either bound", so a reader cannot check the statement against the literature.

An open text does state it, with the same dimension argument as route step 4: Glazyrin and Yu, *Upper bounds for s-distance sets and equiangular lines*, arXiv:1611.09479 (version 1), Theorem 7, p. 7 (its text, line 332): an `s`-distance set in `S^(n−1)` has at most `C(n + s − 1, s) + C(n + s − 2, s − 1)` points, attributed there to Delsarte, Goethals and Seidel. Adding that locator to the second bullet (and to the References) would do; the sentence "no opened source proves either bound" would then change to say that the design bound is the one without an opened proof.

## C02 — In 1.2 the Martin–Tanaka remark is attached to the sign-free program, but it is about Delsarte's program

Line 153 reads "Martin–Tanaka, p. 20, call the program a close variant of Lovász's bound" inside the statement of the sign-free identification, where "the program" is the one without the conditions `a_i ≥ 0`. At that place (arXiv:0811.2475v1, p. 20, its text line 982, directly after Theorem 7.1) the remark concerns the linear-programming bound of Theorem 7.1, which has the conditions `a_i ≥ 0`, that is the program of 1.1. A reader would take the survey to mention the sign-free form, which it does not.

Would read correctly as: "Martin–Tanaka, p. 20, call Delsarte's program, the one of 1.1, a close variant of Lovász's bound; no opened source states the sign-free form."

## N01 — Some phrases describe the drafting rather than the mathematics

"The opened sources prove it" (line 100), "no opened source states this form" (line 153), "no opened source proves either bound" (line 541), "their papers were not opened" (line 749) and "read on arXiv" in the References record what was read while writing. "The sources cited here" and "cited from the attributions of the sources above" would say the same thing timelessly.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.1 `isGreatest_thetaPrime_classGraph` | `R = ∅`, all classes, Petersen, `H(5,2)` `R={1,2}`, `{3,4}`, `J(6,3)` `R={1}`; `d = 0` | LP values `35` (`J(7,3)`, `=|X|`), `1`, `4`, `4`, `6`, `4`; `d = 0`: both sides `1` | holds; README values reproduced | none |
| 1.1 route steps 2–4 | eigenvalue of `B` on `E_j`; compactness bound | `|X|⁻¹∑(a_i/v_i)P_ji = (aQ)_j/(|X| m_j)` via `m_j P_ji = v_i Q_ij`; `∑a_i = (aQ)_0 ≤ |X|` | correct | none |
| 1.2 `isGreatest_lovaszTheta_classGraph` | Petersen, `H(5,2)` `R={1,2}`, `{3,4}`, `J(6,3)` `R={1}` | sign-free LP `4`, `16/3` at `a=(1,0,0,10/3,5/3,−2/3)`, `8`, `5`; Hoffman for `J(6,3)`: `20·3/12 = 5` | holds; equals known `ϑ` on Kneser and `J(6,3)` | C02 (citation only) |
| Duality remark of Layer 1 | all `R` on `H(2,3)`, `H(3,3)`, `H(4,2)`, `J(7,3)` | primal max equals dual min `∑ m_j b_j` in every case (exact vertex enumeration) | holds; matches Martin–Tanaka Theorem 7.2 | none |
| 2.1 `hamming_scheme` | `H(2,2)`, `n = 0`, `q ≥ 2`; argument order of `TauCeti.krawtchouk q n w j` | `P = Q` rows `(1,2,1)`,`(1,0,−1)`,`(1,−2,1)`; `n=0`: `K_0(0)=1`; `|X| P⁻¹ = K` on seven schemes | holds; degree index first, as stated | none |
| 2.2 `isLeast_thetaPrime_hamming` | `H(5,2)`, `δ = 1..6`; `δ > n`; `n = 0`; `δ = 0` | primal `32,16,4,8/3,2,1`; dual identical; `δ>n`: `1`; `δ=0`: certificates `≤ 0` vs `q^n` | holds; `δ ≥ 1` needed, as the Check says | none |
| 2.2 against BoundsOnCodes 5.2 | hypotheses of `card_mul_le_of_krawtchouk` | `f_0 > 0`, `f_k ≥ 0` for `1 ≤ k ≤ n`, `f(i) ≤ 0` for `d ≤ i ≤ n`: identical to the Lean set | same certificates | none |
| 3.1 `isDesign_johnson_iff` | Fano; 15 triples through a point; single pair in `J(4,2)`, `t=3`; `Y=∅`; `t=0` | `aQ = (7,0,0,28)`; `(15,20,0,0)`; `(1,3,2)` so not a design while combinatorial side holds; both sides true | holds; `t ≤ k` needed | none |
| 3.1 `isDesign_hamming_iff` | `[7,4]` code; even-weight code of length 3; one word, `t = n+1` | `aQ = (16,0,0,0,112,0,0,0)`; `(4,0,0,4)`; array side vacuous | holds; `t ≤ n` needed | none |
| 4.1 `IsCometric` | `d = 0, 1`; `K_{3,3}`; wrong model "any order" | `d=0` vacuous; `d=1`: `q^1_10 = 1`; `K_{3,3}` `m=(1,1,4)`: cometric only for order `(2,1)` | definition separates orders; equivalent to the `|k−j|>1` form by `m_k q^k_1j = m_j q^j_1k` | none |
| 4.1 `isCometric_johnson`, `isCometric_hamming` | 13 schemes, all orders | standard order cometric everywhere; extra orders exactly `J(6,3)` `(3,2,1)`, `H(4,2)` `(3,2,1,4)`, both orders for `J(5,2)`, `J(6,2)`, `J(7,2)`, `H(2,3)` | README Check reproduced | none |
| 4.1 Krein values | `J(5,2)`, `H(3,2)` | `(4, 2/9, 20/9)`; `(3, 0, 2, 0)` | agree with AssociationSchemes 3.1 | none |
| 4.2 `sum_trace_le_card_of_isDesign` | Fano; even-weight code; `Y = ∅`; `e ≥ d` | `7 = 1+6`; `4 = 1+3`; `∅`: `1 ≤ 0` fails, so nonempty needed; `e ≥ d` forces `Y = X` | holds; Martin–Tanaka (16) left side | none |
| 4.2 `card_le_sum_trace_of_degree` | one side of `K_{3,3}` in the non-cometric order; `Y = ∅`; `s = 0` | `3 > m_0+m_1 = 2`; `0 ≤ 1`; `|Y| ≤ 1 = m_0` | holds; cometric hypothesis needed | none |
| 4.2 route step 2 | `q^k_ij` for `k > i+j`; distinct `Q_i1` | all zero and all distinct on `J(7,3)`, `J(8,4)`, `H(4,3)`, `H(5,2)` | correct | none |
| 4.3 `dualEigenmatrix_johnson_eq_hahn` | every `J(n,k)`, `2k ≤ n ≤ 8`; `k = 0`; `α ↔ β`; `x = k − i` | identity exact in all; `k=0`: `1 = 1`; swapped: `Q_1(1) = −1/4`; reversed argument fails for all `k ≥ 1` | holds; denominators `(k−n)_m`, `(−k)_m` nonzero for `m ≤ k` | none |
| 4.3 against Martin–Tanaka Example 2.3 | parameter translation | `₃F₂(−j, j−n−1, −i; k−n, −k; 1)` both sides after `m_i P_ij = v_j Q_ji` | same polynomial | none |
| 5.1 `multichoose_add_multichoose_le_card` | pentagon, triangle, tetrahedron, icosahedron; `n = 0, 1`; `e = 0` | `5 = 3+2`; `3 = 2+1`; `4 = 3+1`; `12 ≥ 9`; `n=0` vacuous; `n=1`: `2`; `e=0`: `2 > 1` so `e ≥ 1` needed | holds; equals `D(n, 2k)` of the cited (6) | none |
| 5.1 `card_le_multichoose_add_multichoose` | simplex; cross-polytope; `s = 0`; `n = 0, 1` | `n+1 = n+1`; `2n ≤ C(n+1,2)+n`; `s=0`: `|Y| ≤ 1 ≤ 2`; `n=0`: `0`; `n=1`: `2 ≤ 2` | holds; `FiniteDimensional` present in the elaborated type | C01 (locator) |
| Copied definitions | 11 from AssociationSchemes, `lovaszTheta`, `hahn`, 2 from LatticePackingsAndPerfectForms | text of each `def`/`structure` compared with the owner's file at its head or on main | 15 of 15 identical | none |

- Source locators checked against the text: 20 of 20 in the layers (Martin–Tanaka 8, Godsil 7, Bachoc–Gijswijt–Schrijver–Vallentin 2, Vallentin 2, Boyvalenkov et al. 1), plus Glazyrin–Yu Theorem 7 for C01.
- Library declarations opened at the pins: 14 Mathlib (among them `SimpleGraph.fromRel`, `Mathlib/Combinatorics/SimpleGraph/Basic.lean` line 135; `Matrix.PosSemidef.dotProduct_mulVec_nonneg`, `Mathlib/LinearAlgebra/Matrix/PosDef.lean` line 319; `IsCompact.exists_isMaxOn`, `Mathlib/Topology/Order/Compact.lean` line 273; `Nat.multichoose_eq`, `Mathlib/Data/Nat/Choose/Basic.lean` line 415) and 7 Tau Ceti (`TauCeti.krawtchouk`, `TauCeti/InformationTheory/Coding/Krawtchouk.lean` line 39; `MvPolynomial.IsHomogeneous.eq_zero_of_sphereEval_eq_zero`, `TauCeti/Analysis/MvPolynomial/Sphere.lean` line 81; `TauCeti.finrank_homogeneousSubmodule_eq_multichoose`, `TauCeti/RingTheory/MvPolynomial/Finrank.lean` line 133); all exist as cited. Neither library has association schemes, `ϑ′`, orthogonal arrays or cometric schemes.
- Cross-roadmap citations resolved at the open heads or on main: AssociationSchemes 1.1, 1.2, 2.1, 2.2, 3.1, 4.1–4.3, 5.1, 5.2; LovaszThetaFunction 1.1, 2.1, 4.3; ConvexAnalysisAndDuality 5.3; BoundsOnCodes 5.1, 5.2; SpecialFunctionsClebschGordan 4.1, 4.2; LatticePackingsAndPerfectForms 5.1; LinearAlgebraMethodInCombinatorics 2.2, 3.1; StronglyRegularAndMooreGraphs 1.5; SpectralGraphBounds 3.2. Each exists and says what it is cited for.
- Dependency check: `depcheck: 133 roadmaps, 1474 edges, 0 problem(s)`; no UPWARD or CYCLE line. The five open suppliers each add a new roadmap folder; LatticePackingsAndPerfectForms is on main.
- Elaboration of `TauCetiRoadmap/DelsarteTheoryOfCodesAndDesigns/Suggested.lean`: 13 `sorry` warnings, nothing else. Single `import Mathlib` plus one `TauCeti` module, no `set_option`, no sorried data.
- `#check` pass: the 35 elaborated types were compared with the README statements. The binders reported as dropped are decidability, `Fintype` and measurability instances that the definitions do not use; every theorem keeps the hypotheses its statement needs. No change.
- One-tactic probe (`simp`, `rfl`, `infer_instance`, `exact?`) on a scratch copy: none of the 13 theorems closes. No padding.
- Headline theorems of the README (Schrijver's theorem in both forms, the Hamming scheme and its `ϑ′`, the two design characterisations, the two cometric theorems, the Fisher-type and absolute bounds, the Hahn form, the two sphere bounds): all 13 stated; none forced through a stand-in. The pull request's title and description agree with the head (13 theorems, 22 definitions, 15 copied, 9 targets, suppliers as listed). All automatic checks passed.

Overlap check: read AssociationSchemes, BoundsOnCodes, SphericalCodesAndKissingNumbers, EquiangularLinesAndTwoGraphs, LovaszThetaFunction (and LatticePackingsAndPerfectForms, LinearAlgebraMethodInCombinatorics); nothing shared. AssociationSchemes and LovaszThetaFunction both place `ϑ′`, the linear-programming bound as an optimisation, cometric schemes and designs in schemes outside their scope; SphericalCodesAndKissingNumbers excludes spherical designs as a subject; LatticePackingsAndPerfectForms excludes the Delsarte–Goethals–Seidel bounds.

Source independence: 21 passages compared with 6 sources, none shared; largest share Martin–Tanaka, 8 of 20 locators; contents compared with Martin–Tanaka (§§2, 4, 5, 7 against Layers 2, 4, 3 and 4, 1): independent, the layers are in a different order and Layer 5 has no counterpart there.

Research link: Layers 1–4 are Delsarte's linear-programming and design theory as surveyed by Martin and Tanaka (2009, §§4, 5, 7), with the `ϑ′` identification of McEliece–Rodemich–Rumsey and Schrijver as reported by Bachoc–Gijswijt–Schrijver–Vallentin (2010, §4.1); Layer 5 is the Delsarte–Goethals–Seidel bound used by Boyvalenkov et al. (2015, §2.2). Rests on the sources read.

## Not verifiable

- The original papers of Delsarte, Delsarte–Goethals–Seidel, McEliece–Rodemich–Rumsey and Schrijver: the README attributes results to them in prose only and gives no locator into them; they were not looked for.
- The design strengths of the polygons, octahedron and icosahedron in the Checks of 5.1 were not recomputed by integration; they are standard, and the cardinality arithmetic of each Check was recomputed.

## Source issues

- **Misprint** in Martin–Tanaka, arXiv:0811.2475v1, at §4, printed p. 9: the source says the intersection numbers and Krein parameters vanish when `i + j > k`; it should be when `i + j < k`, with non-vanishing at `i + j = k`; affects nothing.
- **Misprint** in Bachoc–Gijswijt–Schrijver–Vallentin, arXiv:1007.2905v2, at §4.1, printed p. 25: the source says codes of minimum distance at most `d` are the independent sets of the graph joining words at distance less than `d`; it should be at least `d`; affects nothing.

## For the human reviewers

- **Scope.** The cited texts are a survey and lecture notes (arXiv, one author's page); the original papers are attributed in prose only. The sign-free identification of 1.2 has no source stating it (README line 153); its proof is the roadmap's own.
- **Scope.** Five of the six suppliers (AssociationSchemes, LovaszThetaFunction, BoundsOnCodes, ConvexAnalysisAndDuality, SpecialFunctionsClebschGordan) are open pull requests adding new roadmaps; fifteen definitions in `TauCetiRoadmap/DelsarteTheoryOfCodesAndDesigns/Suggested.lean` are copies of theirs and must be kept identical if a supplier changes before merging.
