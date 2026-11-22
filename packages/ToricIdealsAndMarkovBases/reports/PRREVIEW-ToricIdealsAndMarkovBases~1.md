# Review of ToricIdealsAndMarkovBases (pull request #2985 at 0cc63a0)

**Verdict:** needs changes

**Summary.** Needs changes, for one finding: the unimodular theorem 3.4 is stated only for matrices of full row rank with maximal minors in `{0, ±1}`, a form chosen to fit the supplier's hypotheses, so it applies neither to a totally unimodular matrix of deficient row rank (the margin matrix of contingency tables, as the README's own Check shows) nor to the unimodular matrices of the theorem it cites. Every other statement, Check and route was recomputed and holds, and the sampled locators agree with the texts that could be read. There is one format note, and one question for the human reviewers about the copy of Drton–Sturmfels–Sullivant, which could not be read.

## R01 (P2) — Theorem 3.4 is narrower than the theorem it cites: it excludes totally unimodular matrices of deficient row rank and unimodular matrices whose maximal minors are `0, ±δ` with `δ > 1`

The Graver basis and the circuits depend only on the integer kernel of `A`, but the hypotheses of `graverBasis_eq_circuits` (README 3.4, line 418; `Suggested.lean` line 202) depend on the presentation: real rank exactly `r` and every `r × r` column minor in `{0, 1, −1}`. An implementer who proves this target cannot apply it to the basic example of the subject. The README says so itself: in the first Check of 3.4 (line 452) the margin matrix of `2 × 3` tables "has five rows of rank `4`", and a row must be deleted before the theorem applies; in the Examples of Layer 3 (line 513) the same is done for `m × n` tables. That matrix is totally unimodular, and the statement the README cites for 3.4 (Almendra-Hernández–De Loera–Petrović, p. 13) is for totally unimodular matrices, with no rank condition; Mathlib's `Matrix.IsTotallyUnimodular` has none either. Likewise `A = (2 2)` has rank `1` and minors `2, 2`, its Graver basis and circuits are both `±(1, −1)`, and the hypothesis on minors rejects it; the README records this exclusion (line 423, "a matrix whose nonzero maximal minors share an absolute value other than `1` is not covered"), and gives as the reason that the hypotheses are those of IntegerPolyhedraAndTotalUnimodularity 2.1. That is a restriction made for the route, not by the mathematics.

The general statement costs a short reduction in front of the present route. State 3.4 for `d` the real rank of `A`, an injective choice `ρ` of `d` rows and an integer `δ`: if every `d × d` minor of `A.submatrix ρ id` lies in `{0, δ, −δ}` and one of them is nonzero, then `graverBasis A = circuits A`. Proof: the chosen rows span the row space, so `A` and `A.submatrix ρ id` have the same kernel; for a column basis `B` of the chosen rows, `B⁻¹ · A.submatrix ρ id` is an integer matrix by Cramer's rule (its entries are quotients of two such minors), has the same kernel, rank `d` and maximal minors in `{0, ±1}`, and the present route applies to it. Total unimodularity of any rank (`δ = 1`, `ρ` a row basis) and the present statement (`d = r`, `ρ = id`, `δ = 1`) are then corollaries, the margin matrices need no deleted row, and the sentence at line 423 can go. The Check that the rank hypothesis is needed (the twisted cubic with a repeated row) becomes the Check that some chosen minor must be nonzero. `Suggested.lean` and the summary's sentence on the unimodular case change with it.

## N01 — One line of `Suggested.lean` is longer than 100 characters

Line 17 of the module docstring has 123 characters; break it after "not restated."

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.1 `isMarkovBasis_iff_span_eq_toricIdeal` | twisted cubic, fibre over `(2,3)`; `A=(1)`, `M={(1)}`; zero ring with `A=(1 1)`, `M=∅`; identity `2×2`; `r=0` | Fibre `{(0,1,1,0),(1,0,0,1)}`; both lattice moves leave `ℕ⁴` at both points; `A=(1)`: fibres singletons, toric ideal `0`, `x−1∉0`; zero ring: right side true, fibre over `1` has 2 unjoined points | iff holds with `hM` and `Nontrivial`; both hypotheses needed | none |
| 1.1 route, converse | linear form `λ = 1_C` on monomials | `w+m⁺`, `w+m⁻` differ by `m`, both or neither in `C`; `λ(X^u−X^v)=1−λ(X^v)=0` | sound over any nontrivial ring, `M` infinite allowed | none |
| 1.2 `fibreChain_isIrreducible` | `2×3` tables, margins `(2,2)`,`(1,2,1)`; `M=∅`; `A=(1 1)`, `p=(1,1),(1,0),(∞,1)`; `A=(0)`, fibre `ℕ` | Fibre 4 points; weights `(1,½,½,1)`; row 1 `(2/3,1/12,1/12,1/6)`, row 2 `(1/6,2/3,0,1/6)`; invariant `(1/3,1/6,1/6,1/3)`; `p=(1,0)` and `(∞,1)`: acceptance `0`, row `(1,0)` | all four conclusions hold; each hypothesis needed | none |
| 1.2 definitions | `M=∅`; `x±m` outside the fibre; `q x y = 0` | proposal mass `0` (`⊤·` empty sum), chain `= Kernel.id`; `fibreStep` returns `x`; `a/0` only where `Q` has no mass | intended objects; copies agree with suppliers character for character | none |
| 2.1 `mem_standardMonomials_toricIdeal_iff` | `A=(1 2 3)` deglex; `r=0`; zero ring | standard: `x₁`, `x₂^a x₃^e` (`a≤2`), one per value `b=2a+3e`, `b=1`; `r=0`: only `0` standard; zero ring: all standard, one of `(1,0),(0,1)` least | iff holds over nontrivial rings; both directions recomputed | none |
| 2.2 `normalForm_monomial_eq` | `A=(1 2 3)`, `c=(1,1,1)`, `b=4`, `b=7`; `c_j<0` | fibre costs `4,3,2,2`; deglex `x₁>x₂>x₃`: `x₁x₃ > x₂²`, least `(0,2,0)`; `x₂>x₁>x₃`: least `(1,0,1)`; `b=7`: optima `(0,2,1)`,`(1,0,2)`; `c_j<0`: `hc` unsatisfiable | holds; cost-minimality follows from `hc` contrapositive | none |
| 3.1 definitions, `graverBasis_finite` | twisted cubic; `(1 2)`; `(1 0 1)`; identity; `r=0` | Graver: 5 pairs; circuits: 4 pairs (omit one column each: `(1,−2,1,0)`,`(0,1,−2,1)`,`(1,0,−3,2)`,`(2,−3,0,1)`); `(1 2)`: `±(2,−1)`; `(1 0 1)`: `±e₂`, `±(1,0,−1)`; `r=0`: `±e_j` | definitions give the standard objects; antichain per orthant, Dickson | none |
| 3.2 `exists_mem_graverBasis_of_isReducedGroebnerBasis` | twisted cubic lex `x₁>…>x₄`; zero column; ideal `0` | S-pairs of the three quadrics reduce to `0`; tails `x₂²,x₂x₃,x₃²` standard; zero column: `X_j−1`, `v=e_j`, degree `e_j=v⁺`; ideal `0`: `G=∅` | holds; each step of the route rechecked against `not_degree_le` | none |
| 3.3 `exists_isReducedGroebnerBasis_of_mem_circuits` | sign case `w=−c`; `c⁻=0` | `w⁺=c⁻≤c⁺` with disjoint supports gives `c⁻=0`, degree `0` against degree `c⁺≠0` | holds; the disjunction `c` or `−c` is needed | none |
| 3.4 `graverBasis_eq_circuits` | twisted cubic; repeated row; `(1 2)`; `r=0`; `(2 2)`; `5×6` margin matrix | minors `1,2,3`; repeated row: all `3×3` minors `0`, rank `2≠3`; block matrix `B`: minor `= ± det(AD)_{S₁∩S₂}` or `0`; `(2 2)`: Graver `=` circuits `= ±(1,−1)`, rejected by minors; margin matrix: rank `4≠5`, rejected | true as stated; narrower than the cited theorem | R01 |
| 3.5 `IsTestSet`, `isLeast_graverBasis` | twisted cubic, `a=(1,1,1,1)`, `c=(1,0,0,0)`, `u=(0,1,1,0)` and `u=(1,0,0,1)`; `a=g⁺+g⁻`, `c=g` | first `u` optimal (cost `0`) yet `g=(−1,1,1,−1)` fits the box, `u−g` costs `1`; second: only box move `(1,−1,−1,1)`; `c·g⁻=−‖g⁻‖² < c·g⁺`; `t ⊑ g` forces `t=g` | least test set; the condition `c·t>0` is needed | none |
| Sturmfels Theorem 3.4 as printed | same instance | printed statement has no `c·g>0`; its "if" direction fails on the instance above | README's correction is right | none |

- Source locators checked against the text: 17 (Sturmfels 10, Almendra-Hernández–De Loera–Petrović 3, Aoki 1, Conca 3); 7 into Drton–Sturmfels–Sullivant not checked.
- Library declarations opened at the pin: 27 (Tau Ceti `ToricIdeal/Basic.lean` 124, 129, 151, 172, 250; `ToricIdeal/HilbertFunction.lean` 177; `Groebner/Basic.lean` 94, 268, 514; `Groebner/NormalForm.lean` 69, 192, 232; `Groebner/Reduced.lean` 58, 230; Mathlib `Kernel/Irreducible.lean` 56, `Kernel/Invariance.lean` 39, 58, 63, and nine further names).
- Cross-roadmap citations resolved: 8 (TensorProductCombinatorics §1.5 `Fibre`; MarkovChainsAndRenewal Layer 3 and its `IsIrreducible`; LangevinAndHamiltonianMonteCarlo 1.1, 1.2, four declarations; IntegerPolyhedraAndTotalUnimodularity 2.1; GroebnerGeometry G1, G2; MathematicalStatisticsFoundations 9.4).
- Dependency check: `depcheck: 23 roadmaps, 101 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration of `Suggested.lean`: nine `sorry` warnings and nothing else; the 22 elaborated types were compared with the README statements, no hypothesis lost (the three flagged binders are `[Fintype ι]` or `[MeasurableSpace X]` on definitions that do not use them).
- One-tactic probe: none of the nine theorems closes with `rfl`, `simp`, `infer_instance` or `decide`; no padding.
- No Graver basis, Markov basis, conformal order or test set in the pinned Mathlib or Tau Ceti, nor in any roadmap on main or open; no declaration shares a fully qualified name with another roadmap.
- Pull request text read against the head: 13 definitions, one instance, 9 theorems, two open suppliers; no sentence contradicted.

Overlap check: read GroebnerGeometry (main and its open revision), ZeroDimensionalIdeals, LangevinAndHamiltonianMonteCarlo, IntegerPolyhedraAndTotalUnimodularity, MCMCAsymptoticVariance; nothing shared (toric ideals, Gröbner bases and normal forms are Tau Ceti's and GroebnerGeometry's, cited; the Metropolis–Hastings kernel is LangevinAndHamiltonianMonteCarlo's, cited; ZeroDimensionalIdeals excludes toric ideals and Markov bases).

Source independence: 14 passages compared with 4 sources, none shared; largest share Sturmfels2003Recipes, 10 of 24 locators; contents compared with Sturmfels2003Recipes (six sections; Layer 1 has no counterpart, Layers 2 and 3 take parts of its §2 and §3 and add 2.1, 3.3, 3.4): independent. The text of Drton–Sturmfels–Sullivant (7 locators) could not be read.

Research link: The fundamental theorem is Diaconis–Sturmfels (1998), the normal-form theorem Conti–Traverso (1991), the Graver and circuit inclusions Sturmfels (1996); Almendra-Hernández–De Loera–Petrović (2023) survey their current use in algebraic statistics. Rests on the README's references and on the texts of AlmendraDeLoeraPetrovic2023, Sturmfels2003Recipes and Conca2024.

## Not verifiable

- Drton–Sturmfels–Sullivant, Algorithm 1.1.13, Theorem 1.1.14 (pp. 16–17), pp. 26, 30, 31 and Theorem 1.3.6: the sources service refused the copy on the coauthor's page (the address does not contain an author's surname); no other legal copy was sought.
- Diaconis–Sturmfels 1998, Conti–Traverso 1991, Graver 1975 and Sturmfels 1996: attributed by name only in the README, with no locator; not read.

## Source issues

- **Error** in Sturmfels2003Recipes at Theorem 3.4, p. 7: the source says a feasible point is non-optimal exactly when some Graver element fits the box around it; it should be: fits the box and has positive cost; affects a stated result.
- **Misprint** in Sturmfels2003Recipes at the proof of Theorem 3.4, p. 7 (second paragraph): the source says to suppose the cost of the Graver element negative before moving from its positive to its negative part; it should be positive; affects nothing.

## For the human reviewers

- **Not tested.** Seven of the 24 locators cite Drton–Sturmfels–Sullivant in the 2008 version at `math.berkeley.edu/~bernd/owl.pdf`, a coauthor's page; the sources service did not accept the address, so those locators and the wording against that text were not checked.
