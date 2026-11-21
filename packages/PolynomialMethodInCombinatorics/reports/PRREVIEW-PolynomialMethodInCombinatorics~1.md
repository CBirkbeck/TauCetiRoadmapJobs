# Review of PolynomialMethodInCombinatorics (pull request #2848 at 194d963)

**Verdict:** needs changes

**Summary.** Needs changes, for one reason: the joints theorem of 5.1 is restricted to fields of characteristic zero only because the route ends by iterating partial derivatives, while the theorem, with the same constant, holds over every field, and the roadmap lists positive characteristic as not treated. Every other statement survived the computed checks, all sixteen source locators agree with the texts, and the Lean file elaborates with `sorry` as its only warning. There are no small corrections and no format notes; one question for the author; one point on the copy of a source is left for the human reviewers.

## R01 (P2) — The joints theorem of 5.1 holds over every field with the same constant; the hypothesis of characteristic zero comes from the route, not from the theorem

A library user with lines in `𝔽_qᵈ` (the setting of Layer 4 of this same roadmap) cannot use `card_pow_le_of_isJoint`, and the scope section tells them that "joints over fields of positive characteristic" are not treated, although nothing in the mathematics separates the two cases. A roadmap states the general theorem; a restriction to good characteristic for the convenience of one proof is what the planning principles exclude.

How I know. The statement over an arbitrary field is CarberyIliopoulou14 (A. Carbery and M. Iliopoulou, *Counting joints in vector spaces over arbitrary fields*, arXiv:1403.6438v2), Theorem 1.1, p. 1 (line 35), with the key step in Proposition 3.1, pp. 5–6 (lines 221–259). The README's own route gives the constant `4ᵈ d!` in every characteristic once its last step is changed: after the pruning, take `P ≠ 0` of *least* degree vanishing on the remaining points (so `deg P ≤ b` by 3.1); by 3.3 it vanishes on the remaining lines, so, as in the route, every `∂ᵢP` vanishes at every remaining point; each `∂ᵢP` has smaller degree, so by minimality `∂ᵢP = 0` for all `i`. In characteristic zero `P` is then constant. In characteristic `p`, `P` is a polynomial in the `xᵢ^p`, hence a `p`-th power `Q^p` over a perfect closure, and `Q` vanishes on the same points with `deg Q = deg P / p`; the least degree of a nonzero polynomial vanishing on a finite set of `Kᵈ` does not change under field extension (it is a rank condition on an evaluation matrix over `K`), so `P` is constant again. A nonzero constant does not vanish on the nonempty set of remaining points. The numerical step `m^(d−1) > 4ᵈ d! nᵈ ⇒` more than `b` points on each line is untouched.

Smallest change: drop `[CharZero K]` from `card_pow_le_of_isJoint` and "of characteristic zero" from 5.1, the summary and the scope paragraph; replace the last two sentences of the route ("by induction every iterated partial derivative … a nonzero constant") by the least-degree argument above, citing Carbery–Iliopoulou, Theorem 1.1 and Proposition 3.1; and remove "joints over fields of positive characteristic" from the list of what is not treated. `MvPolynomial.pderiv` stays in the *Needs:* line; nothing else in the layer changes.

## Questions for the author

- 4.1 cites Theorem 3 of the arXiv version of Dvir's paper, which states only `|K| ≥ C_n qⁿ` and whose proof is written with `(q + n − 2 choose n)` (Dvir09 lines 83–86); the README says so. Does the published version (J. Amer. Math. Soc. 22) state `(q + n − 1 choose n)` outright? If it does, its theorem number would be the better locator. I could not read the published text.

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| 1.1 `le_card_polySumset` | one variable `A={0,1,2}⊆ℤ/5`, `m=2`; `A=∅`, `m=0`; `σ` empty, `h=c≠0`; two variables `h=1` | coefficient 1, bound 3 = `#A`; hypotheses hold, sumset empty (so nonempty needed); sumset `{0}`, `1 ≤ 1`; coefficient `(m choose c₀)` | holds; agrees with Alon99 lines 187–198 |
| 1.2 `coeff_sum_pow_mul_vandermonde` | `r=2,m=1,c=(2,0)`; `r=2,m=0,c=(1,0),(0,1)`; `r=0`; `c=(1,0),m=1` (degree condition off) | `−1·2!·0! = −2 = 1!·(0−2)`; `−1`, `+1` both sides; `1 = 1`; `0 ≠ −1` | holds; Alon99 lines 245–255; sign convention `∏_{j<i}(xᵢ−xⱼ)` same in Lean |
| 1.3 `card_restrictedSumset_of_injective` | `p=5`, `{0,1,2},{0,1}`; equal sizes `{0,1},{0,1}`; `∅, ℤ/5`; `r=0`; `r=1` | sums `{1,2,3}`, bound 3; one sum vs 2; no sums vs 3; `1 ≤ 1+0`; `#A+1 ≤ #A+1`; `m = ∑#Aᵢ − (r+1 choose 2) ≤ p−1` | holds; Alon99 lines 219–229 with `r = k+1` |
| 1.4 `min_le_card_restrictedSumset_const` | all `A ⊆ ℤ/p`, `p ≤ 7`, `0 ≤ s ≤ p+1` (recomputed); `p=7`,`A={0..3}`,`s=2`; `ℤ/8`, `{0,2,4,6}` | no violation; 5 sums = `min(7,5)` (also by `decide` on the Lean definition); 4 sums < 5 | holds; Alon99 lines 329–330, 237–238; route sums `sN − s² + 1` checked |
| 2.1 `sum_card_sub_one_le_card_of_covers` | `ι` empty; `σ` empty; `aⱼ=0`; cube in `𝔽₃³`, `u=(2,2,2)` | forces grid `={u}`, `0 ≤ 0`; `0 ≤ #ι`; then `bⱼ≠0`, covers nothing; 2 planes < 3 | holds; Alon99 lines 498–499 (real cube); route's `P(u)=0`, coefficient `−c` checked |
| 2.2 `exists_regular_subgraph` | `q=2`, one vertex, two loops; `V` empty; `q=3` five-vertex multigraph of the Check | `2>1`, degree 2, both loops; no edges, hypothesis fails; 11 edges, degrees `8,4,4,3,3`, degree at 0 in `{2,4,6,8}` | holds with loops counted once (`decide`: one loop twice gives degree 2); Alon99 lines 422–423, 444 |
| 3.1 | `n=0`; `n=1`; `n=2,b=1` | `(b choose 0)=1`, `S=∅`, `P=1`; `b` points fit, `b+1` do not; 2 points on a line, 3 general not | holds; KSS10 lines 64–70; Tau Ceti dimension lemma has `(m + n choose n)` |
| 3.2 | `n=0,b=1`; `n=1`; `n=2,b=2` | bound reads 1, only polynomial is 0 (so `n ≥ 1` needed); bound 1; `(3 choose 1)=3` | holds; Dvir09 lines 112–113; `multichoose n b = (n+b−1 choose b)` |
| 3.3 | `P=x₁x₂`, 2 points, `b=2` | `P(1/2,1/2)=1/4≠0` | holds; not closed by one tactic |
| 4.1 `choose_le_card_of_isKakeya` | `(q,n)=(2,2),(3,2),(4,2),(5,2),(2,3)` minimum recomputed; `n=0`; `n=1` | minima `3,7,10,17,5` vs bounds `3,6,10,15,4`; bound 1; bound `q` | holds; route with top homogeneous component checked; Dvir09 lines 83–99 |
| 4.2 `choose_le_card_of_many_rich_lines` | `n=0`; `n=1`; `d=0`; Kakeya with `d=q−2`; Dvir's `(δ,γ)` hypothesis | hypotheses contradictory; bound 1; bound 1; `qⁿ−1 > (q−2)q^(n−1)`; `δqⁿ ≥ (d+2)q^(n−1) > dq^(n−1)` | holds; Dvir09 lines 61–73, 131–150 |
| 5.1 `card_pow_le_of_isJoint` | `L=∅`; `d=1`, `L=∅`; `d=2`; grid `d=3,k=2`; `m/(2n) > 2(d!m)^(1/d)` solved | `0 ≤ 0`; `1 ≤ 0` fails (so `d ≥ 2` needed); `≤ n²/2`; `64 ≤ 663552`; `m^(d−1) > 4ᵈ d! nᵈ` | true as stated; characteristic hypothesis not needed (R01); KSS10 lines 20, 85–131 |

- Source locators checked against the text: 16 (Alon99: 8; Dvir09: 4; KSS10: 4), all agree, including the page numbers; one further source opened for R01 (CarberyIliopoulou14, Theorem 1.1 and Proposition 3.1).
- Library declarations opened at the pins: 27 in Mathlib (among them `Mathlib/Combinatorics/Nullstellensatz.lean` lines 63, 201, 236; `Mathlib/Algebra/MvPolynomial/SchwartzZippel.lean` line 192; `Mathlib/Algebra/Polynomial/Roots.lean` line 758; `Mathlib/Data/Nat/Choose/Lucas.lean` line 89; `Mathlib/LinearAlgebra/FiniteDimensional/Lemmas.lean` line 185; `Mathlib/Combinatorics/Additive/CauchyDavenport.lean` line 198) and 2 in Tau Ceti (`TauCeti/RingTheory/MvPolynomial/Finrank.lean` lines 133, 152); every cited name exists in the cited file with the stated content.
- Neither pinned library states any target: no Kakeya, joints, Erdős–Heilbronn, Alon–Füredi or regular-subgraph statement was found in Mathlib or Tau Ceti by object search.
- Cross-roadmap citations resolved: 4 (CrystallineCohomologyPartII 6.6 on main; FourierAnalyticAdditiveCombinatorics Layers 2 and 3, LinearAlgebraMethodInCombinatorics, DecisionTreeComplexity Layer 4 at their open heads); none is a supplier.
- Dependency check output: `depcheck: 1 roadmaps, 0 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration of `TauCetiRoadmap/PolynomialMethodInCombinatorics/Suggested.lean`: 12 `sorry` warnings, nothing else; the 16 elaborated types were compared with the README statements and none lost a binder; one `import Mathlib`, no `set_option`, no sorried data.
- One-tactic probe on a separate copy of the file (`simp`, `rfl`, `omega`, `simp_all`, `aesop`): none of the 12 theorems closes; three `decide` evaluations of `restrictedSumset` and `subDegree` agree with the README's values.
- Headline theorems (1.1, 1.3, 1.4, 2.1, 2.2, 4.1, 4.2, 5.1) are all stated in the Lean file; the pull request's title and description agree with the head (12 theorems, 4 definitions, the suppliers and the two source slips it reports).

Overlap check: read FourierAnalyticAdditiveCombinatorics, LinearAlgebraMethodInCombinatorics, SidonSetsAndLinearEquations, DecisionTreeComplexity (no roadmap on main is close); nothing shared.

Source independence: 9 passages compared with 3 sources, none shared beyond formulas and phrases of under six words; largest share Alon99, 8 of 16 locators; contents compared with Alon99 (its ten sections): independent — Layers 1 and 2 draw on its §4 and §6 only, in a different internal order and at other generality, and Layers 3–5 come from elsewhere; the order 1.1 → 1.2 → 1.3 → 1.4 is forced by the *Needs:* lines.

Research link: The targets are published theorems that current work builds on: Alon–Nathanson–Ruzsa (1996) and Dias da Silva–Hamidoune (1994) on restricted sums, Alon–Füredi (1993), Alon–Friedland–Kalai (1984), Dvir (2009) on finite-field Kakeya sets, Kaplan–Sharir–Shustin (2010) on joints; rests on the README's references and on Alon99, Dvir09, KSS10 as read.

## Not verifiable

- The exhaustive searches reported in the Checks of 2.1 (least covers of grids in `𝔽₂²`, `𝔽₂³`, `𝔽₃²`, `𝔽₅²`), 2.2 (small multigraphs) and 4.2 (all `K` in small spaces) were not rerun; those of 1.4 (for `p ≤ 7`) and 4.1 were.
- The published versions of the three papers were not read; the locators were checked in the versions the README cites (for Alon's paper, the author's version).

## Source issues

- **Error** in KSS10 at the proof of Theorem 1, p. 3: the source says the condition `m/(2n) > 2(d!m)^(1/d)` amounts to `m > (2^(d+1) d!)^(1/(d−1)) n`; it should be `m > (4ᵈ d!)^(1/(d−1)) n^(d/(d−1))`; affects the proof (only the value of the constant `A`).
- **Misprint** in Dvir09 at the proof of Theorem 3, p. 3: the source says a Kakeya set smaller than `(q+n−2 choose n)` lies on a nonzero polynomial of degree at most `q − 1`; it should be `(q+n−1 choose n)`, the number of monomials of degree at most `q − 1`; affects nothing.

## For the human reviewers

- **Licence.** The README cites Alon's paper in the version on his Tel Aviv page; the text read for this review is the author's version on his Princeton page (Alon99). Theorem and page numbers agree with the README throughout; that the two copies are the same file was not checked.
