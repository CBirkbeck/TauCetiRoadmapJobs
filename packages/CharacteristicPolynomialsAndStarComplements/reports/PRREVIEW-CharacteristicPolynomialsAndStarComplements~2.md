# Review of CharacteristicPolynomialsAndStarComplements (pull request #3059 at 87fae50)

**Verdict:** accepted

**Summary.** Accepted: this head repairs the one finding of the previous review (Huang's theorem is now cited from DecisionTreeComplexity 5.1 and only translated here) and all four small corrections and both format notes. Every statement was recomputed on small and degenerate cases and none was found false; `Suggested.lean` elaborates with `sorry` as the only warning and no statement closes with one tactic. There is one small correction and two format notes, none blocking. The textbook by Cvetković, Rowlinson and Simić, which carries the largest share of the locators, could not be read, and that is left to the human reviewers.

## C01 — The supplier contract says Gershgorin's theorem is used in Huang's route in 4.4, and 4.4 does not use it

In the Mathlib contract (line 589), `eigenvalue_mem_ball` is listed as "used in Huang's route in 4.4". The text of 4.4 at this head describes Huang's own proof by Cauchy interlacing and "his row-sum bound [H, Lemma 2.3, p. 4]", and the route actually proposed applies DecisionTreeComplexity 5.1; Gershgorin's theorem is named nowhere in the section, and the `*Needs:*` line of 4.4 does not list it. A reader of the contracts looks for a step that is not there. Either drop the entry (and its `#check` line), or say in 4.4 that the row-sum bound of Lemma 2.3 is the place where `eigenvalue_mem_ball` would enter.

## N01 — The locator in 3.3 covers two of the three energy bounds

The exercise of [BH] cited for `energy_bounds` states `√(2m + n(n-1)|det A|^{2/n}) ≤ E ≤ √(2mn)` only (BH line 3114 in the 2011 proof, where it is Exercise 8 of Chapter 3; Exercise 10 in the later online version). The bound `2√m ≤ E` is proved in the suggested proof and has no locator; saying so, or giving one, would keep a reader from looking for it in the exercise.

## N02 — "as in [BH, §2.5, p. 26]" for interlacing with `m ≤ n`

[BH] defines interlacing for `m < n` (BH line 1473); the Conventions admit `m = n`, which the negative control of 4.1 uses. "as in [BH, §2.5, p. 26], which takes `m < n`" would be exact.

## Verified sound

Previous findings at this head: R01 repaired (4.4, lines 483–486 and 492–495, cites DecisionTreeComplexity 5.1 as owner and derives the graph form from it; scope lines 535–537 and 545; contract lines 667–671; the cited statement is at that roadmap's README line 440 and `Suggested.lean` line 206). C01 repaired (the sentence on Cauchy interlacing in Tau Ceti is gone from the scope section). C02 repaired ([H, Theorem 1.1, p. 1] and [H, Lemma 2.2, p. 4] at lines 476–485; both checked, H lines 29 and 121). C03 repaired (`energy_bounds` has no `Nonempty`; the empty-type Check is at lines 361–362). C04 repaired (the description names DecisionTreeComplexity 5.1 and GraphSpectra 3.8). N01 repaired (the derivative is now GraphSpectra 1.2, README line 181 there, and is no longer stated here). N02 repaired (3.8 at lines 622–624).

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 `IsElementary`, counts | `∅`; matching of `C₄`; `K₃`; `P₃` | `(comp, cyc)`: `(0,0)`; `(2,0)`; `(1,1)`; `P₃` fails the degree-1 clause, formulas give `(1,0)` | Checks agree | none |
| 1.2 Harary `det_adjMatrix` | empty; `K₁`; `K₂`; `K₃`; `K₄` | left `1, 0, −1, 2, −3`; right `1`, `0`, `(+1)(−1)`, `(−1)(−2)`, `3 − 6` | equal | none |
| 1.2 Sachs | `K₃` `j = 2, 3`; `C₄` `j = 4`; `j = 0` | `−3`, `−2`; `1 + 1 − 2 = 0`; `1` | equal | none |
| 1.2 first coefficients | `K₃`; `K₂` | `0, −3, −2`; for `K₂` index `n − 3 ↦ 0`, `−1 ≠ 0` | `n ≥ 3` needed | none |
| 1.3 isolated vertex | `K₂ ⊕ K₁`; `K₁`; vertex of `K₂` | `t³ − t = t(t² − 1)`; `t = t·1`; `t² ≠ t² − 1` | equal; degree `0` needed | none |
| 2.1 lowest term | empty; `P₃`; `C₄` | `0 + 0 = 0`; `1 + 2 = 3`; `0 + 4 = 4` | equal | none |
| 2.2 forests | empty; `K₂`; `P₃`; `P₄`; `K_{1,3}`; `C₄` | `det`: `1, −1, 0, 1, 0`; `count 0`: `1`, `2`; `C₄`: `count 0 = 2 ≠ 0` | forest needed | none |
| 3.1 tensor spectrum | `K₂ × K₂`; `K₃ × K₂` | `{1, −1, −1, 1}`; `{±2, ±1, ±1}` = `C₆` | equal | none |
| 3.1 `lapSpectrum_join` | `K₁ ∨ K₁`; `K_{1,3}`; `K_{2,3}`; `P₃ ∨ K₂`; count | `{0,2}`; `{0,1,1,4}`; `{0,2,2,3,5}`; `{0,3,5,5,5}`; `2 + (n₁−1) + (n₂−1)` | equal | none |
| 3.2 `eval_charpoly_compl` | empty; `C₄`; `P₃` at `0.37`; sign | `1 = 1`; `(t+1)²(t−1)²`; both `−0.3193`; `det((t+1)I + A) = (−1)ⁿ p_G(−t−1)` | equal | none |
| 3.2 walk generating function | `K₁`; substitution `s = −(t+1)/t` | `1 = t⁻¹((t+1) − 1)`; `s + 1 + θ = −(1 − tθ)/t`, so the quotient is `1 + t·n∑β²/(1 − tθ)` | equal; no pole | none |
| 3.3 `energy_bounds` | empty; `K₂`; `K₃`; `C₄`; `K_{1,3}` | `0 ≤ 0 ≤ 0`; `2 = 2 = 2`, `√4`; `2√3 ≤ 4 ≤ √18`; `4 = 4`, `√8 ≤ 4`; `2√3 = 2√3 ≤ √24` | hold; casts real | N01 |
| 3.3 rational energy | `K₂`, `K₃`, `P₃` | `2`, `4`, `2√2` | consistent | none |
| 4.1 predicates | `{1,−1}` in `{√2,0,−√2}`; `{2}` in `{2,−1,−1}`; `{4/3}`; `{0,0}` in `{1,−1}` | holds; tight `k = 1`; not tight; `1 ≥ 0 ≥ 1` false | Lean bodies match | N02 |
| 4.2 tight interlacing | `K₃`, `𝟙/√3`; `C₄`, two columns; `P₃`; `ι` empty | `2`, `AS = 2S`; `diag(2, −2)`, tight `k = 1`; `4/3`, `AS = (1,2,1)/√3`; trivial | holds; fails untight | none |
| 4.3 `isStarSet_iff`, eigenspace | `K₂` `θ = 1`; `K₃` `θ = −1`, `X = {0,1}`, `{0}`; `X = ∅`; `X = univ`; block elimination | `1 = 1`; `−J₂ = B(−1)Bᵀ`; size `1 ≠ 2`; iff `θ` not eigenvalue; forces `A = 0`, `θ = 0`; second row gives `y = (θI − C)⁻¹Bᵀx` | both directions | none |
| 4.3 `card_le_of_isStarSet` | `t = 0, 1, 2` by hand; Petersen, `C₅`, `K₃`, `3K₂`, `K₂ ⊕ K₁`; McLaughlin | `t = 1`: only `K₂`; `t = 2`: only `2K₂`; `(n, t(t+1)/2)`: `(10,15)`, `(5,6)`, `(3,3)`, `(6,6)`, `(3,3)`, `(275,276)` | only the two exceptions | none |
| 4.3 route of the bound | inner products; polarization | `⟨s_u, s_v⟩ = θ, −1, 0` on all three block pairs; `⟨s_u, w*⟩ = −w_u` when `θ ≠` index | steps hold | none |
| 4.4 signing | `d = 0, 1, 2`; two paths `i < k` | `[0]² = 0`; `I`; `+,+,+,−`; `s_i·(−s_k) + s_k·s_i = 0`; `d = 0` spectrum has 2 ≠ 1 terms | holds; `d ≥ 1` needed | none |
| 4.4 graph form | `d = 1`; `d = 2`; even-weight set; against the supplier | `1 ≥ 1`; `2 ≥ √2`; degree `0`; `2^d < 2(2^{d−1} + 1)` | follows from 5.1 | C01 |

- Source locators checked against the text: 11. [H] Theorem 1.1 p. 1, Lemma 2.2 p. 4, Lemma 2.3 p. 4, proof pp. 4–5 (H lines 29, 121, 142, 153). [BH] §1.4.2 p. 8, §1.4.6 and §1.4.7 p. 10, §2.5 p. 26, Theorem 2.5.1 (iv) pp. 26–27, Corollary 2.5.4 p. 27, the energy exercise (BH lines 711, 767, 783, 1472, 1481–1509, 1530, 3114).
- Restated locators: [CRS, Theorem 5.1.7], both parts, as quoted in arXiv:1912.07594v3, Theorem 2.1; the bound `n ≤ t(t+1)/2` for `θ ∉ {−1, 0}`, `t > 2`, as quoted in arXiv:1911.01113v1, p. 9; the star-set definition also in [BH, §3.14, Proposition 3.14.1].
- Library declarations opened at the pins: `Matrix.charpoly_coeff_eq_sum_minors` (`Mathlib/LinearAlgebra/Matrix/Charpoly/Coeff.lean` 456), `Matrix.twoBlockTriangular_det` (`Mathlib/LinearAlgebra/Matrix/Block.lean` 345), `Matrix.det_add_replicateCol_mul_replicateRow` (`Mathlib/LinearAlgebra/Matrix/SchurComplement.lean` 427), `LinearMap.IsSymmetric.re_inner_apply_self_eq_sum_eigenvalues_mul_sq` (`TauCeti/Analysis/InnerProductSpace/CourantFischer.lean` 152); all 44 `#check` lines elaborate. No tensor product or join of graphs, graph energy, star set or interlacing predicate in either library.
- Cross-roadmap citations resolved at the suppliers' heads or on main: GraphSpectra 1.2, 1.7, 1.8, 2.3, 2.6, 3.2, 3.8, 3.9; DecisionTreeComplexity 5.1; MatchingPolynomial 1.1, 2.2; MatchingTheory 1.1; TuttePolynomialAndArrangements 4.1; SpectralGraphBounds 1.1; LaplacianEigenvaluesOfGraphs 1.1; RandomMatrices 1.2 (main). The 16 copied definitions agree with their owners' `Suggested.lean`.
- Dependency check: `depcheck: 129 roadmaps, 1436 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the roadmap folder.
- Elaboration: 26 `sorry` warnings, no error, no other warning. Elaborated types compared with the README for all 53 declarations; the five definitions that drop `Fintype` or `DecidableEq` binders do not use them; `n − 1` and `2/n` in `energy_bounds` are real.
- One-tactic probe (`rfl`, `simp`, `simp` with the definitions unfolded, `ext; simp`, `aesop`) on a copy: none of the 26 statements closes. Every headline of the Summary that carries a name is stated.
- Overlap check: read GraphSpectra, MatchingPolynomial, LaplacianSpectraAndSpanningTrees, SpectralGraphBounds, RamanujanGraphs, SpanningTreesAndShortestPaths, and also DecisionTreeComplexity, EquitableOperatorReduction, SpectralQuantumWalks, LaplacianEigenvaluesOfGraphs; shared: Huang's theorem on induced subgraphs of the cube, owner DecisionTreeComplexity 5.1, cited here; nothing else shared.

Source independence: 10 passages compared with 2 sources (BH, H) and 2 restatements of CRS, none shared; largest share CRS, 23 of about 52 locators; contents of CRS not read. By the README's own CRS locators (§2.3 in Layer 1, none in Layer 2, §§2.1, 7.1, 9.2 in Layer 3, §§5.1, 5.3 in Layer 4) and against the contents of BH (§1.4 and an exercise of Chapter 3 in Layer 3, §2.5 in Layer 4) the layers are not a run of either book's chapters.

Research link: 4.4 rests on Huang (2019), the proof of the sensitivity conjecture (H, read). 4.3 is the star-complement technique and the Bell–Rowlinson multiplicity bound, in current use by Ramezani, Rowlinson and Stanić (2019) and Yang et al. (2022) (arXiv texts read). 4.2 is Haemers's tight interlacing (BH, read).

## Not verifiable

- [CRS] (1.1, 1.2, 1.3, 3.1, 3.2, 3.3, 4.3; 23 locators): the publisher's page is closed and no legal copy was found. Theorem 5.1.7 and the bound of Theorem 5.3.1 were checked only through the restatements named above; page numbers, Proposition 5.1.1, Proposition 2.1.3, (2.14), Theorems 2.3.1–2.3.3, 7.1.9 and Proposition 9.2.2 were not.
- The exceptions `K₂` and `2K₂` in the bound of 4.3: the restatement read assumes `t > 2`; the cases `t ≤ 2` were computed by hand and give exactly these two graphs, but the wording of [CRS, Theorem 5.3.1] was not read.
- [B], [Ba], [N–P], [St]: not in the cache and not sought further; their statements were recomputed, their locators not checked.
- The misprints the README reports in [CRS, Theorem 7.1.9] and [St, Theorem 8.14]: neither text was read; the README's corrected formulas are the ones computed above.
- [BH, Exercise 3.10, p. 65]: the statement was read in two author-hosted versions, numbered Exercise 8 (p. 64) and Exercise 10 of Chapter 3; the number and page in the Springer print were not confirmed.

Automatic checks set aside as false positives: Mathlib's `Matrix.det_apply'`, which the README cites as a Mathlib lemma and `Suggested.lean` pins with `#check`, was read as a name this roadmap claims to declare.

## Source issues

- none

## For the human reviewers

- **Not tested.** [CRS] carries 23 of about 52 locators and could not be read: its wording and table of contents were not compared with the README. [B], [Ba], [N–P] and [St] were not read either.
- **Scope.** The sources are six textbooks and one refereed article (Huang, Ann. of Math. 2019); [N–P] is cited for one exercise beside [H] in 4.4.
