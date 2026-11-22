# Review of NonintersectingPathsAndLGV (pull request #2995 at e6deaab)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every stated theorem, formula, Check and worked example was recomputed (the lemma's involution by hand on the README's examples, the binomial, Catalan, Hankel, flagged-tableau and box-formula statements by exact computation) and agrees; the three Krattenthaler sources support the statements at the locators given, and the README's claim that the involution printed in the survey is not an involution is correct. There are one small correction and two format notes, none blocking. For the humans: Stanley's text could not be read through a legal channel, three attributed papers were not consulted by the author, and a Check quotes 27 words of a source in fragments.

## C01 — The scope sentence reads as if Mathlib and Tau Ceti had the Narayana numbers; neither does

In "Scope and ownership", under "Not treated here" (README line 469), the clause "the enumeration of Dyck paths and the Narayana numbers (Mathlib and Tau Ceti)" tells a reader that both topics are in the libraries, so that nothing is left to plan. At the pins Dyck words are there (`Mathlib/Combinatorics/Enumerative/DyckWord.lean`, `TauCeti/Combinatorics/PlanarMatching/DyckWord.lean`), but the word "Narayana" occurs in no file of either library except as part of an author's name. Attach the parenthesis to the Dyck paths only, for example "the enumeration of Dyck paths (Mathlib and Tau Ceti) and the Narayana numbers".

## N01 — Four Checks report random experiments that a reader cannot rerun

"checked exactly on 300 random digraphs" (1.2, line 170), "878 instances with at most three rows" (4.1, line 399) and "at random rational points" (3.1, line 304) name no instances, so they test nothing a reader can repeat; the fully specified ones (the 3985 Pascal minors, the 1555 tuples, `n ≤ 8`) do, and I reproduced them. Would you either specify the family (as the other Checks do) or drop the sentence?

## N02 — 2.1 and 2.2 carry an attribution but no locator

The Pascal total nonnegativity (2.1, line 209) and the positivity criterion (2.2, line 235) are attributed to Lindström 1973 and Gessel–Viennot 1985 "in prose", and the References mark both as not consulted, so a reader has no place to compare the statements with. A theorem or corollary number in Gessel–Viennot 1985 for 2.2 would do; see the question below for 2.1.

## Questions for the author

- Does Lindström 1973 state the total nonnegativity of the Pascal matrix (2.1), or is the attribution meant only for the lemma used in the route? I could not read the paper (paywalled) and Gessel–Viennot 1985 resolves only to a paywalled page, so I could not check either attribution of 2.1 and 2.2.
- Is page 247 the page of Theorem 2.7.1 in Stanley's copy of 15 July 2011, and does it treat weighted lattice paths as 1.2 says? The copy could not be fetched through a legal channel here.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.1 `pathMatrix`, `IsVertexDisjoint`, `disjointWeight` | `n = 0`; quiver `y → x → z`, sources `(x, y)`, sinks `(x, z)` | `n = 0`: det `1`, weight `1`. Example: matrix `[[1,1],[1,1]]`, det `0`; both types share `x`, weights `0`, `0` | agrees; endpoint-inclusive disjointness is what the Check separates | none |
| 1.2 `det_pathMatrix` (convention `a (σ i) → b i`) | `n = 0`, `n = 1`; example above; 2-cycle with weights `1`; 2-cycle over `ℤ[t]/(t³)` | `1 = 1`; entry = entry; `0 = 0 − 0`; weights `1`: left `0` (junk), right `1`; nilpotent: `(1+t²)² − t² = 1 + t²` vs `1` | lemma holds where hypothesis holds; both negative controls fail as stated | none |
| 1.2 route, steps 3–4 (involution) | README's three-path example `s₀→u→m→t₀`, `s₁→u→t₁`, `s₂→m→t₂` | step-3 rule: `(i, v, j) = (0, u, 1)` both ways, returns to the identity family; simple-path argument of step 4 reread line by line | involution | none |
| 1.2 Check on the survey's printed rule | same example, rule of KrLPE lines 3030–3041 | first image `(s₂ m t₀, s₁ u t₁, s₀ u m t₂)` via pair `(0,2)`, point `m`; second image via `(1,2)`, `u`: `(s₂ m t₀, s₀ u t₁, s₁ u m t₂)` ≠ start | printed map is not an involution; Check true | none (source issue recorded) |
| Crossing step (Layer 2) | both cases of the first common level; last level by symmetry | `d ≥ 0` at first level, `d ≤ 0` at last, steps of `d` in `{−1, 0, 1}` | zero exists | none |
| 2.1 `isTotallyNonneg_choose` | all minors of size `≤ 3`, indices `< 8`; rows `(2,3)` cols `(1,3)`; rows `(1,0)` cols `(0,1)` | 3985 minors (64 + 784 + 3136 + the empty one), all `≥ 0`; `det [[2,0],[3,1]] = 2`; `det [[1,1],[1,0]] = −1` | agrees with `Matrix.IsTotallyNonneg` (StrictMono rows and columns) | none |
| 2.2 `det_choose_pos_iff` | same 3985 minors, both directions; `n = 0`; rows `(1,2)` cols `(0,3)`, `(0,1)` | `det > 0 ⇔ bᵢ ≤ aᵢ` on all; `1 > 0`; `0`; `1`; example `det [[1,2,1],[1,3,3],[1,4,6]] = 1` | iff holds both ways | none |
| 3.1 `det_catalan_add` (Lean form, `∏ j ∈ Ioi i (αⱼ − αᵢ)`) | all `α ∈ {0,…,6}ⁿ`, `n ≤ 4` (2801 tuples, `n = 0` included); `(0,2)`, `(1,1)`, `(1,0)` | determinant = product on all; `3 = 2·1·(3/2)`; `0 = 0`; `−1 = −1` | agrees, sign convention pinned by `(1,0)` | none |
| 3.1 route: determinant lemma, steps 2–3 | 100 random rational points, `n ≤ 5`; step-3 product for `α ∈ {0,…,4}ⁿ`, `n ≤ 4` | both sides equal each time; `Bᵢ − Aⱼ = i − j − 3/2`; specialisation `Xᵢ = −Aᵢ` gives `c = ∏ (B_k − Aᵢ)` by hand | agrees with KrCat Lemma 1 and KrADC (2.8) after the index shift | none |
| 3.2 `hankelDet_catalan` | `n = 0,…,9`, shifts `0,1,2,3` | `1, 1, n + 1` for all `n ≤ 9`; shift 3: `5, 14, 30, 55`; quotient `(2n+1)!(2n+2β)!/((2n+β)!(2n+β+1)!)` = `1`, `1`, `(n+2)/(n+1)` | agrees; `hankelDet` identical to the supplier's definition | none |
| 4.1 `latticePathCount` | `(−1, 1)`, `(2, 2)` by `decide` in Lean | `0`, `6`; truncating variant gives `C(0,0) = 1` at `(−1, 1)` | guard is needed | none |
| 4.1 `card_flaggedSkewTableaux` | 1324 instances, `n ≤ 4`, empty and padding rows, `n = 0`; README Checks | count = determinant on all; `(2,1)`, `[0,2]`: `8 = 18 − 10`; `(2,1)/(1)`: `4 = 4`; dropped hypotheses: `3` vs `0`, `8` vs `−5`, `0` vs `−5`, none vs `1`, infinite vs `1` | holds; each hypothesis has a failing control | none |
| 4.1 route (level ranges overlap) | `n = 3`, `μ = 0`, `λ = (1,1,1)`, `a = b = (0,0,5)` | first inequality `3 < 0` false; source `(−2, 5)` to sink `(1, 0)` has no path | the "both paths exist" proviso is needed and stated | none |
| MacMahon Example | boxes `(2,2,2)`, `(3,1,1)`, `(1,2,1)`, `(2,3,2)`, `(3,3,3)`, `(2,3,4)` | enumeration, box product, hook-content product, `det (C(b+c, b−i+j))`: `20, 4, 3, 50, 980, 490` on every side; truncated variant at `(3,1,1)`: `5` | agrees | none |
| C01 (scope sentence) | search of both pinned libraries | Dyck words: present in both; Narayana numbers: absent from both | sentence ambiguous | small correction |

- Source locators checked against the text: 14 (KrLPE: Theorem 10.13.1 line 2917, proof lines 2933–3060, Corollary 10.13.2 line 3068, bijection lines 3107–3165, Theorem 10.13.3 line 3168; KrCat: (1.1)–(1.3) lines 45–52, Lemma 1 line 127, Theorem 3 line 172, Remark (a) line 222, Remark (d) line 249; KrADC: Lemma 3 line 369, reduction lines 425–453, (2.17) line 673, box formula line 1880).
- Library declarations opened at the pin: 31. Mathlib: `Quiver.Path.weight` (`Combinatorics/Quiver/Path/Weight.lean:43`), `weight_comp` (:79), `vertices` (`Path/Vertices.lean:37`), `vertices_comp` (:113), `exists_eq_comp_of_mem_vertices` (:207), `Matrix.det_apply` (`Determinant/Basic.lean:66`), `det_mul_row` (:298), `det_mul_column` (:309), `det_vandermonde` (`Vandermonde.lean:220`), `det_of_isUpperTriangular` (`Matrix/Block.lean:404`), `Matrix.IsTotallyNonneg` and `.nonneg` (`Determinant/TotallyNonneg.lean`), `Finset.prod_univ_sum`, `sum_involution`, `prod_bij`, `sign_swap`, `sign_inv`, `finsum_mem_eq_finite_toFinset_sum`, `catalan`, `YoungDiagram.rowLen`, `colLen`. Tau Ceti: `Quiver.IsAcyclic` (`Acyclic/Basic.lean:40`), `finite_paths_of_isAcyclic` (`Acyclic/FinitePaths.lean:83`), `det_mul_transpose_eq_sum_plucker_mul` (`Plucker.lean:194`), `diagramSchurPoly_eq_det_hsymmInt` (`JacobiTrudi.lean:258`), `SkewSemistandardYoungTableau` (`SkewTableau.lean:78`), `BoundedSSYT` (`Kostka.lean:199`), `finrank_weylModuleOfShape` (`WeylModule/Character.lean:120`), `finrank_weylModuleOfShape_eq_prod_div` (`WeylModule/Dimension.lean:85`), `card_gtPattern_topRow_eq_card_ssyt`, `GTPattern.card_topRow_eq_weylDimension`, `weylDimension_weightOfShape_eq_prod_div`, `YoungDiagram.hookLength`.
- Duplication by object: neither pinned library states a theorem on nonintersecting path systems, a Pascal-matrix total nonnegativity, a Catalan determinant or a flagged tableau count (the vertex-disjoint paths of Tau Ceti's Menger files carry no weights or determinants); no roadmap on main or open states them.
- Cross-roadmap citations resolved: 2 (SpecialFunctionsOrthogonalPolynomialsGeneral §2.4 on main, its `hankelDet` definition identical character for character; DimerModelsAndLozengeTilings on main, no path determinants).
- Overlap check: read SchurWeyl, ClassicalGroups, TensorProductCombinatorics, IntegralWeylModulesOfGeneralLinearGroups, HankelFormsAndRealMomentProblems; nothing shared (`hankelDet` is owned by SpecialFunctionsOrthogonalPolynomialsGeneral and cited; the skew tableau carrier is Tau Ceti's and cited).
- Dependency check output: `depcheck: 133 roadmaps, 1473 edges, 0 problem(s)`; no UPWARD or CYCLE line. The only roadmap supplier is on main.
- Elaboration: `Suggested.lean` elaborates with `sorry` as the only warning (six theorems); the eleven elaborated types were compared with the README statements, nothing lost a binder. One-tactic probe (`rfl`, `simp`, `infer_instance`, `decide`): none of the six theorems closes. The automatic checks all passed.
- All six headline theorems of the README are stated in `Suggested.lean`; none is declared not statable.

Source independence: 9 passages compared with 3 sources (the statements and routes of 1.2, 3.1, 3.2, 4.1, the Check of 1.2, the MacMahon Example, three docstrings), none shared beyond formulas and 27 quoted words (see the human reviewers' section); largest share KrLPE and KrCat, 6 each of 17 locators; contents compared with KrLPE §10.13 and KrCat §§1–3: independent (Layers 2 and 3 have no counterpart in KrLPE §10.13, Layers 1, 2, 4 none in KrCat §3). StanleyEC1 could not be read.

Research link: The lemma is Lindström (1973) and Gessel–Viennot (1985); Layer 3 is Theorem 3 of Krattenthaler (2010) with the determinant lemma of Krattenthaler (1999); Layer 4 is Theorem 10.13.3 of Krattenthaler (2015), the lattice-path source of the hook-content and box formulas. Rests on KrLPE, KrCat, KrADC as read, and on the README's References.

## Not verifiable

- StanleyEC1, Theorem 2.7.1, p. 247 of the author's copy: the sources service did not accept the URL as an author's page; a request for the text is recorded.
- GesselViennot1985: resolves only to a paywalled page (recorded as uncertified); the attributions of 2.1, 2.2 and of the lemma to it were not checked.
- Lindström 1973 and MacMahon 1916: attributed in the README as not consulted; not looked for further.
- The Checks N01 names (random instances) cannot be reproduced as stated; the statements they support were recomputed independently on other instances.

## Source issues

- **Error** in KrLPE at the proof of Theorem 10.13.1, printed page 51: the source says to take the lexicographically largest intersecting pair, its last common point, and swap the initial portions, and calls the result evidently an involution; it should use a choice the swap preserves (for example the least index meeting another path, its first shared vertex, the least partner); affects the proof.
- **Misprint** in KrLPE at Theorem 10.13.1, printed page 50: the source says "Let G by"; it should be "Let G be"; affects nothing.

## For the human reviewers

- Licence: the Check of 1.2 (README lines 152–154) quotes 27 words of KrLPE lines 3030–3038 in five marked fragments, to pin down the printed rule it shows is not an involution.
- Licence: Stanley's EC1 is cited from the copy on his MIT page; the sources service could not classify that URL as an author's page, so 1.2's second locator is unchecked.
- Scope: the sources read are a handbook chapter and two journal articles by Krattenthaler; the primary papers (Lindström 1973, Gessel–Viennot 1985, MacMahon 1916) are attributed but were not consulted by the author.
