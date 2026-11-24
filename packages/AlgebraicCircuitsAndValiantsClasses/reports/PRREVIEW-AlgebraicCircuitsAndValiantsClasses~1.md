# Review of AlgebraicCircuitsAndValiantsClasses (pull request #3022 at 914ae75)

**Verdict:** accepted

**Summary.** Accepted: no statement, Check or route was found false. Every size bound, sign and closed form was recomputed by hand or by exact arithmetic, including the Hessian determinant of 5.1 and the characteristic condition `p ≥ m`, and `Suggested.lean` elaborates with `sorry` as its only warning. There are two small corrections (both about what Bürgisser's text is cited for) and one format note, none blocking. For the humans: the survey that carries the largest share of the locators (Saptharishi) and Cai–Chen–Li could not be read from a legal place, so 20 of the 37 locators are unverified, and the primary papers are cited without locators.

## C01 — Bürgisser's §3.1 states closure under p-projections, sums, products and compositions, not closure of VNP under subset sums

In 1.2 (README line 153) the sentence "These are the closure properties stated without proof by Bürgisser (§3.1, p. 17; …)" covers all three theorems of the section, the first of which is closure of `VNP` under a further subset sum. Buergisser2024 lines 849–852 (§3.1, printed p. 17) and line 325 (printed p. 8) state closure under p-projections and under sums, products and compositions; summation over `0`/`1` values is not among them, so a reader who follows the locator for `mem_VNP_of_subsetSum` finds nothing. The theorem is proved in the route, so nothing depends on it: attach the citation to the two projection theorems only, and leave the subset-sum closure as proved here.

## C02 — The degree-bounded form of VP is Bürgisser's Remark 2.10(1), not his Definition 2.9

In 1.1 (README line 102) the classes are cited to "Bürgisser, Def. 2.9, p. 6". That definition (Buergisser2024 lines 254–257) asks for multiplicatively disjoint circuits of polynomial size and has no degree bound; the form used here, polynomially bounded degree and circuit size, is his Remark 2.10(1), printed p. 7 (lines 270–271). Add that locator, so that the reader sees the two definitions are known to agree over a field.

## N01 — Two sentences narrate the drafting

"was checked symbolically" (Check of 3.4, line 441) and "(no legal copy was opened)" (References, line 830) date the text. They would read timelessly as "holds symbolically for `n = 0, …, 4`" and "Attributed in prose without locators:".

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| 1.1 `Computes`, degree bound `2^(s−1)` | `s = 0, 1, 2`; squaring chain | `Fin 0` empty so no value; position `k` has degree ≤ `2^k`, chain attains `2^k` | sound |
| 1.1 `VP`, `VNP`, `subsetSum` | `r = 0`; `m = 0, r = 1`; `nvars = 2^n` | subset sum of `y` is `0 + 1 = 1`, of `C 1` is `2`; `r = 0` gives `VP ⊆ VNP` | sound |
| 1.2 projection closure, `P = p_g∘p + p` | `p_g = X²+1`, `p = X+1`, `n = 0,1,2` | gates `2, 5, 10` against `P = 3, 7, 13` | sound |
| 1.2 negative controls | `x^(2^n)`; `nvars = 2^n` | degree `2^n` unbounded; variables unbounded | hypotheses needed |
| 2.1 `s(d+1)²+1` | product gate, `d = 0, 3` | `Σ_e (2e+1) = (d+1)²`: `1`, `16`; other gates ≤ `d+1` | sound |
| 2.2 `5s+2` | `x, x·x`; general count | `2+2+2+1 = 7 ≤ 12`; `s+2+4m+ℓ ≤ 5s+2` with `m+ℓ = s` | sound |
| 3.1 Ryser | random integer matrices, sides `0–4` | both sides equal; side `0`: `1 = 1` | sound |
| 3.2 Glynn, both forms | sides `0–4`, every `i₀` | half sum `= 2^(n−1) perm`, full sum `= 2^n perm`; `2×2`: `2(ad+bc)` | sound |
| 3.3 `hamCycleSum` | `n = 0, 1, 4` in Lean (`decide`) | counts `0, 0, 6`; `finProdFinEquiv (1,2) = 5` | sound |
| 3.4 permanent witness | gate count, all `n ≥ 1` | `3n²+4n+1 ≤ 4(n+1)²`; degree `3n`; `n = 0`: one gate | sound |
| 3.4 Hamiltonian witness | `n = 2, 3, 4`, integer points | subset sum equals cycle sum; without `PM`: `1809` against `93` at `n = 3` | sound, `PM` needed |
| 3.4 Hamiltonian gate count | all `n ≥ 2` | `3n³+n²+2k³+3k²+2 ≤ 5n³+4n²+2 ≤ 5(n+1)³`; `35, 120, 291` for `n = 2,3,4` | sound |
| 4.1 clow recurrence and sign | `n = 1, …, 5`, random integers | with `(−1)^n`: equals `det`; without: equals `det` only for even `n` | sound |
| 4.1 count | `n = 1, …, 4` | `4n⁴+4n²+5 = 13, 85, 365, 1093` against `64, 324, 1024, 2500` | sound |
| 4.2 both matrices | 400 random formulas, ≤ 4 leaves, 3 points each | permanent and determinant equal `φ.eval`; sides ≤ `size+1`, `size+2`; 0 failures | sound |
| 5.1 zero of permanent | `m = 3, 4, 5` | `perm(x₀) = 0`; Hessian entries `(m−3)!·(m−2)` or `−2(m−3)!` | sound |
| 5.1 `det H'` closed form | `m = 3, 4, 5` over `ℚ` | `−128`, `429981696`, `−23110532361879552` on both sides | sound |
| 5.1 characteristic | `m = 3,4,5`, `p = 2,3,5,7,11` | rank `m²` exactly for `p ≥ m`: `m=4`: `0, 11, 16, 16, 16`; `m=5`: `0, 9, 25, 25, 25` | hypothesis exact |
| 5.1 rank of Hessian of `det` | `diag(0,1,…,1)`, two equal rows, `n = 1–4` | `0, 4, 6, 8`; ≤ `2n` over `ℚ`, mod `2`, mod `3` | sound |
| 5.1 boundary | `m = 0, 1, 2`; `ZMod 2`, `m = 3` | `0 ≤ 2n`; `n ≥ 1`; `4 = 2·2` attained; `9 > 6` excluded by hypothesis | sound |
| Scope: bound comparison `n^a + a` | `n = 0, 1`, `n ≥ 2` | `p.eval n ≤ m n^d ≤ n^(d+m) + (d+m)` in each case | sound |

- Source locators checked against the text: 17 of 37 (Buergisser2024 12, ShpilkaYehudayoff2010 4, ChabaudDeshpandeMehraban2022 1); 20 not readable (below).
- Library declarations opened at the pins: 50 in Mathlib (for example `Matrix.det_kronecker`, `Mathlib/LinearAlgebra/Matrix/Kronecker.lean:402`; `cycleType_finRotate_of_le`, `Mathlib/GroupTheory/Perm/Fin.lean:137`; `finProdFinEquiv`, `Mathlib/Logic/Equiv/Fin/Basic.lean:330`) and 3 in Tau Ceti (`TauCeti/Algebra/MvPolynomial/PDeriv.lean:35`, `TauCeti/RingTheory/MvPolynomial/Homogeneous.lean:140`, `TauCeti/Algebra/MvPolynomial/Monad.lean:31`); all exist with the stated content. Neither library has Ryser's or Glynn's formula, circuits, or a Hamiltonian cycle sum.
- Cross-roadmap citations: none are suppliers; the four neighbours named (SatisfiabilityComplexity, MatchingTheory, NonintersectingPathsAndLGV, ComputabilityTheory) were opened and say what the README reports.
- Dependency check: `depcheck: 132 roadmaps, 1464 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `Suggested.lean` elaborates, 13 `sorry` warnings and nothing else; the elaborated type of each of the 30 declarations was compared with its README statement, no binder lost (the theorems over a commutative ring carry `CommRing` in their own signatures).
- One-tactic probe (`rfl`, `simp`, `infer_instance`, `exact?`) on a copy: none of the 13 theorems closes. All headline theorems of the README are stated; none is forced through a stand-in.
- Pull request text: the title and description agree with the head (13 theorems, 17 definitions, no supplier, new roadmap).
- Automatic checks: all passed; nothing set aside.

Overlap check: read SatisfiabilityComplexity, AsymptoticSpectra, DecisionTreeComplexity, PolynomialMethodInCombinatorics, DirectedMatrixTreeAndBEST; nothing shared (each lists circuits or permanents outside its scope or does not treat them).

Source independence: 22 passages compared with 3 sources (17 locators and 5 routes: homogenization, Baur–Strassen, the determinant of a formula, Ryser, Glynn), none shared; largest share Saptharishi903, 17 of 37 locators, text and contents not readable; contents compared with Buergisser2024 (12 locators, §2.1–§2.8, §3.1): independent, Layer 2 has no counterpart section there and Layers 3 and 4 reverse its order.

Research link: Layers 1, 3 and 4 are Valiant's classes and his universality of the determinant (Valiant 1979), Layer 5 the Mignon–Ressayre bound (2004) on determinantal complexity, the starting point of geometric complexity theory; rests on Buergisser2024 §2.5–§2.8 and Thm 2.36, and the README's scope section.

## Not verifiable

- All 17 locators into Saptharishi's survey (Defs. 3.1, 3.2, 3.8; Cor. 3.4; Lemmas 3.9, 5.2, 6.3, 7.2, 7.5–7.6; Thms 3.10, 7.4; Cor. 7.3; Claims 7.7–7.8; §6.1.2): the release file on the GitHub repository the README names is on a host the sources service does not class, and a search by citation found no legal copy.
- The README's remark in the Check of 4.1 that Saptharishi's branching program of Thm 3.10, as printed, computes `(−1)^n det`: same text. (The mathematics of the remark, that the recurrence without the final factor gives `(−1)^n det`, was confirmed for `n = 1, …, 5`.)
- The 3 locators into Cai–Chen–Li (Thm 2.2, p. 42; §2.1; the remark on p. 43): the publisher's copy is paywalled and the page the README names was not accepted as an author's page; cited by locator alone.
- The Checks that report exhaustive runs (the 4108 circuits of 2.1 and 2.2, the counts `8, 19, 56, 157, 376` of 4.1) were not rerun; the bounds they illustrate were verified in general.

## Source issues

- **Gap** in Buergisser2024 at Proposition 2.23, printed pp. 10–11: the source says the matrix has entries in the field or the variables, yet its proof negates every edge weight and then swaps two columns; it should keep the weights and carry the sign elsewhere, as 4.2 here does; affects the proof.

## For the human reviewers

- **Not tested.** The source with the largest share of locators, Saptharishi's survey (17 of 37, version 9.0.3 on GitHub, not a refereed publication), could not be read: wording and arrangement were not compared with it.
- **Scope.** The main results are cited through surveys; the primary papers (Valiant, Baur–Strassen, Mahajan–Vinay, Mignon–Ressayre, Glynn, Ryser) appear in References without locators (README lines 830–835).
- **Licence.** The README (lines 713–727) names a public Apache-2.0 Lean development (`anthropics/formal-math`, folder `vp-vnp`). Its `Statement.lean` shares the names `Computes`, `VP`, `VNP` with `Suggested.lean`; the definitions differ in form as the README says. No statement coincides.
- **Scope.** The extension of 5.1 to characteristic at least `m`, and the exact constants of 2.1, 2.2, 3.4 and 4.1, are the roadmap's own, with no source; they were recomputed here (table above).
