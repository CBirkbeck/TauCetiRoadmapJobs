# Review of KMeansAndHierarchicalClustering (pull request #2957 at 71141e3)

**Verdict:** accepted

**Summary.** Accepted: no statement, Check or route was found false. Every theorem was instantiated on degenerate cases (`n = 0`, `k = 0, 1`, repeated points, empty and one-point types, asymmetric and negative dissimilarities), and three of the enumerations reported in Checks were recomputed exactly and agree. There are three small corrections and one format note, none blocking. None of the four cited texts could be read from a place the sources service accepts, so every source locator is unverified and the wording and arrangement were not compared with the sources; that, and the placement of the subject, are left to the human reviewers.

## C01 — Two docstrings of `Suggested.lean` carry section numbers the README does not have, and the module docstring names a section the README calls otherwise

A reader matching the Lean file to the README looks for a section 2.3 that does not exist. The docstring of `seedProb_nonneg_and_sum_eq_one` (line 120) begins "2.2" while the README states it in 2.1; the docstring of `expected_centreCost_seed_le` (line 125) begins "2.3" while the README states it in 2.2, the last section of Layer 2. The module docstring (line 14) refers to "the README's design section"; the README's section is `## Conventions`. Renumber the two docstrings to 2.1 and 2.2 and write "the README's Conventions".

## C02 — The route of 4.2 uses a number `a₂` that it never introduces

In the route of 4.2 (README line 525) the distance function is "between `a₂` and `a₁` within the blocks of `Γ₁` only", but only forcing pairs `a < b` have been introduced, and no index convention attaches `a₀, b₀` to `Γ₀` and `a₁, b₁` to `Γ₁`. As written the rescaling step cannot be reconstructed. One sentence suffices: let `(a₀, b₀)` and `(a₁, b₁)` be forcing pairs of `Γ₀` and `Γ₁`, fix `0 < a₂ ≤ a₁` and `0 < ε < a₀ a₂ / b₀`, take `ε` within the blocks of `Γ₀`, `a₂` within the blocks of `Γ₁` only and `b₁` across `Γ₁` (after enlarging `b₁` so that `a₂ ≤ b₁`), and rescale by `b₀ / a₂`. I checked that this choice works: after rescaling the values are `ε b₀ / a₂ < a₀` within `Γ₀` and at least `b₀` across it.

## C03 — The description counts 4860 data sets where the README counts 4860 cases

The description says the seeding bound was checked "on 4860 data sets and `k ≤ 3`". The Check of 2.2 has `4⁴ + (4 + 16 + 64 + 256 + 1024) = 1620` data families and three values of `k`, hence 4860 cases, which is what the README says and what I recomputed. The description should read "on 1620 data sets and `k = 1, 2, 3` (4860 cases)".

## N01 — Four Mathlib names in the supplier contracts stand under a file that does not contain them

In "From Mathlib" the bullet for `Mathlib/Algebra/BigOperators/Fin.lean` continues with `Finset.sum_div`, `Finset.inf'`, `Finset.exists_min_image` and `Fintype.equivFin` with no file of their own; at the pin `Finset.sum_div` is in `Mathlib/Algebra/BigOperators/Field.lean` (line 25) and `Fintype.equivFin` in `Mathlib/Data/Fintype/EquivFin.lean` (line 80). Give each its file, as the other bullets do.

## Questions for the author

- 3.5 says that the source's proof of Proposition 26 "writes the step bound with `η` where its normalisation of the distortion requires `2η`". I could not read the text. Which line of p. 1464 is meant, and is the slip in the bound on a step of the chain or in the choice of the correspondence? If it stands, it belongs in the project's errata with that locator.
- 3.4 says that §3.4.1 (p. 1443) of Carlsson–Mémoli "says that the conditions characterize single linkage" and that their condition (III) enters only step (B) of the proof. The mathematics here does not depend on it (the two-point quotient argument of the route is complete: I checked that the map collapsing the block `S` and its complement is distance-nonincreasing onto the two-point space at distance `dist(S, Sᶜ) > r'`), but I could not confirm the description of the source.

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| 1.1 definitions, tie and empty-cluster rules | `x=(0,2,10)`, `a=(0,0,1)`, `c=(5,5)`; `x=(0,4)`, `c=(0,3)`; `x=(10,12)`, `c=(11,100)` | cost 59 → image `(1,10)` cost 2; image `((0,1),(0,4))` cost 0; fixed, centre 100 kept | Checks true |
| 1.2 `pairCost_lloydMap_le`, `_lt` | all 442321 pairs of the Check of 1.4; `x=(0,0)`, `a=(0,1)`, `c=(0,0)` | 0 violations of strict decrease at moved pairs; tie example fixed, least-label rule moves it at cost 0 = 0 | true; tie rule needed |
| 1.3 `isFixedPt_lloydMap_iff` | `x=(0,2,3)`: `((0,1,1),(0,5/2))`, `((0,0,1),(1,3))`, `((1,1,0),(3,1))` | costs 1/2, 2, 2; all fixed; other partitions cost 2, 9/2, 14/3, so 1/2 least | true both directions |
| 1.4 `isFixedPt_lloydMap_iterate` | `n=0` (`k^0=1`, `s₁=s₀`); `k=0,n≥1` (no pair); `k=n=0`; enumeration | pair count `1+224+16368+425728 = 442321`; longest orbit 4 steps; 0 exceed `k^n` | true |
| 2.1 `seedProb_nonneg_and_sum_eq_one` | `x=(p,p)`, `k=2`; `n=0,k=1`; `n=0,k=0`; `x=(0,2)`, `k=1` | 4 × 1/4; empty sum 0 ≠ 1; one tuple, product 1; expected cost 4 = 2·2 | true; `n ≥ 1` needed for `k ≥ 1` |
| 2.2 `expected_centreCost_seed_le` | `k=1`; `n=0`; `x=(0,2)`, `k=2`; 4860 cases incl. repeats and `n<k` | `2·OPT ≤ 16·OPT`; `0 ≤ 0`; expected 0; masses all 1, max ratio 0.15305, `OPT=0 ⇒` expected 0 | true; `InnerProductSpace` binder present in elaborated type |
| 3.1 definitions | two-point families `⊥` for `r<1` / `r≤1`; `X` empty or one point; path 1,1,2 | first is a dendrogram, second fails right-constancy at 1; `dendrogramUltra = 0` on diagonal; `⊤` at scale 1 | determine the object |
| 3.2 correspondence | `ℕ` with `max(x,y)`; right-open two-point family; 76 ultrametrics | ultrametric, never `⊤`; `sInf = 1` but `θ 1` fails; counts 1+3+12+60 = 76 | true; finiteness only in second statement |
| 3.3 `isGreatest_singleLinkageUltra` | `d(0,1)=1,d(1,0)=2`; `d x x>0`; `d x y ≤ 0` off diagonal; `ℚ∩[0,1]` | value 1; diagonal unread, value 0 ≤ `d x x`; set of ultrametrics below `d` empty; function 0 off diagonal | true; both hypotheses and finiteness needed |
| 3.4 `isFunctorialMethod_iff` | `T=d`; `T=2·SL`; `T=` largest distance; `n=0,1`; two-point quotient by a block | 2 vs 1 on 1,1,2; two-point value `2δ ≠ δ`; inclusion sends 1 to 2; trivial; `δ=dist(S,Sᶜ)>r'` gives `u ≥ δ` | true both directions without (III) |
| 3.5 `abs_singleLinkageUltra_sub_le` | non-total `R`; `d_X(p,p)=50`; `x=x'` with `y≠y'`; negative values | 1 vs 10 with `η=0`; 0 vs 100 with `η=50`; `d_Y(y,y') ≤ η`; set contains `max(d,0)`, bounded below by 0 | true; totality and diagonal needed |
| 4.1 definitions | `F=⊥`; `n=0`, `n=1` | scale-invariant, consistent, range `{⊥}`; one partition, all three hold | definitions restricted to distance functions as stated |
| 4.2 antichain and impossibility | `n=2`: `⊥<⊤`; rescaling by `b₀/a₂` | within `Γ₀`: `εb₀/a₂<a₀`; across: `≥ b₀` | true (see C02 for the route) |
| 4.3 `exists_clusterRange_eq` | `A=∅`; tie under transformation; `n=4`, seven two-block partitions | not a range; `Φ_{d'}(Γ') ≥ Φ_d(Γ') − Δ ≥ Φ_{d'}(Γ)`, equality forces a tie already for `d`; 1+3 block reached by sums 3 < 6, 7 | true; nonempty needed |
| 4.4 two single-linkage rules | `r=0`; `n=2, α=1/2`; `α=1`; `α≤0`; `n=3` values `(1,1,1)`, `(1,3,3)`, `(1,1,2)` | `⊥`; `⊥` only; `⊤` only; `⊥` only; five partitions reached by both rules | true; `r>0`, `n≥3`, `0<α<1` needed |

- Source locators checked against the text: 0 of 21 (no text readable; see Not verifiable).
- Library declarations opened at the pin: 14, among them `Finset.sum_mul_norm_sub_sq_eq` (TauCeti/Analysis/InnerProductSpace/CompleteSquare.lean:133, statement as the README gives it), `Fin.find`, `Fin.find_spec`, `Fin.find_min` (Mathlib/Data/Fin/Tuple/Basic.lean:1142–1152), `Finset.centroid_def` (Centroid.lean:83), `harmonic_le_one_add_log` (Harmonic/Bounds.lean:34), `sq_sum_le_card_mul_sum_sq` (Chebyshev.lean:143), `Setoid.le_def` (Order/Setoid/Basic.lean:54), `Relation.EqvGen.setoid` (Logic/Relation.lean:817).
- Duplication by object: no dendrogram, single-linkage, k-means or Lloyd declaration in the pinned Mathlib or Tau Ceti; `IsUltrametricDist` is a class on a type, as the README says.
- Cross-roadmap citations resolved: 7 of 7 (StatisticalLearningTheory 5.4, TopologicalDataAnalysis 4.5 and 5.4, SpanningTreesAndShortestPaths 2.4, KernelsAndSpectralMethods 2.2 and 5.1 at their open heads; MathematicalStatisticsSemiparametric 7.2 on main); none is a supplier.
- Dependency check: `depcheck: 170 roadmaps, 1983 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration of `TauCetiRoadmap/KMeansAndHierarchicalClustering/Suggested.lean`: 18 `sorry` warnings, no error, single `import Mathlib`, no `set_option`, no sorried data. Elaborated types compared with the README: the eight definitions without `[InnerProductSpace ℝ E]` use only the norm; every theorem keeps it.
- One-tactic probe (`rfl`, `simp`, `intros; rfl`) on a copy: closes none of the 18 theorems. All README headlines are stated.
- Automatic checks: all passed. No change outside the roadmap folder.

Overlap check: read TopologicalDataAnalysis (the only roadmap in the three lists) and StatisticalLearningTheory; nothing shared: the population risk `kMeansRisk` is StatisticalLearningTheory's, the Rips/spanning-tree count is TopologicalDataAnalysis's, and the single-linkage partition, dendrograms and the tuple cost are stated only here.

Source independence: 0 passages compared with 0 sources, since no cited text could be read; largest share Arthur–Vassilvitskii, 7 of 21 locators (Carlsson–Mémoli 6, Kleinberg 6, Shalev-Shwartz–Ben-David 2); contents not compared. The four layers draw on four different texts and Layers 1 and 3 are mutually independent, so no layer order is taken from one text; the four steps of the route of 2.2 follow the source's Lemmas 3.1–3.3 and Theorem 3.1, an order the induction forces.

Research link: The headline targets are the main theorems of Arthur–Vassilvitskii 2007 (D² seeding bound), Kleinberg 2002 (impossibility and antichain theorems) and Carlsson–Mémoli 2010 (dendrogram–ultrametric correspondence, characterization and stability of single linkage), the last a starting point of metric-geometric clustering theory; this rests on the README's references, not on the texts.

## Not verifiable

- Arthur–Vassilvitskii 2007 (§1, §2.1–2.2, Lemma 2.1, Theorems 1.1, 3.1, 4.1, Lemmas 3.1–3.3; sample targets 1.1, 1.2, 1.4, 2.1, 2.2): the copy on an author's page and a title search were both refused by the sources service.
- Carlsson–Mémoli 2010 (Theorem 9, Lemma 10, §3.3, Example 7, Lemma 12, Corollary 14, §3.4.1, Theorem 18, Proposition 26 and page numbers; sample targets 3.1–3.5): the journal's host is in no licence class of the sources service; title search found nothing.
- Kleinberg 2002 (§2, Theorems 2.1, 2.2, 3.1, 3.2; sample targets 4.1–4.4): the copy on the author's page was refused; title search found nothing.
- Shalev-Shwartz–Ben-David 2014 (Lemma 22.1 p. 313, Theorem 22.4 p. 319, §22.7 p. 320; sample targets 1.2, 4.2): the authors' PDF was refused; title search found nothing.
- The Checks reporting enumerations in 3.3 (5871 cases), 3.4 (9238 maps), 3.5 (61708 triples) and 4.3 were not recomputed; those of 1.4, 2.2 and 3.2 were.
- Library near-match search by docstring was rate-limited for most declarations; duplication was checked by grepping the pinned libraries for the objects instead.

## Source issues

- none

## For the human reviewers

- **Scope.** The headline theorems come from SODA 2007, NIPS 2002 and JMLR 2010 (refereed computer-science and machine-learning venues) and one textbook; the objects are finite and combinatorial. Whether this is within the project's scope is yours to decide.
- **Licence.** The README cites copies "on Vassilvitskii's page", "on Kleinberg's page" and "the authors' PDF"; the sources service classified none of these hosts, nor the journal's.
- **Not tested.** No cited text was readable, so wording and arrangement were not compared with any source, including the one with the largest share of locators (Arthur–Vassilvitskii, 7 of 21).
