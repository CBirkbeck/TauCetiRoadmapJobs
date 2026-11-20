# Review of QueueingModels (pull request #2809 at b933ac1)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every statement, Check and numerical value was recomputed and holds, the six Lean statements elaborate with `sorry` as the only warning and none closes with one tactic, and every locator of both sources was read at its place. There are three small corrections (a route described as the roadmap's own that is the source's guide, two Mathlib file paths that do not exist at the pin, a section numbering of StandardDistributions that main does not have) and one format note, none blocking. Two points are left for the human reviewers: both sources are unrefereed teaching texts, and several targets are exercises of one of them.

## C01 — The route of 3.4 for the many-server limit is the route of Zukerman's guide, not the roadmap's own

A reader is told twice that the argument differs from the source's: in 3.4 (README line 353), "the route below is this roadmap's own", and in the References (line 616), "where one is a target here, the route given is this roadmap's own"; the pull-request description repeats it ("the routes it gives for them are its own"). For 3.3 this is right: the source's hint is induction on the number of servers through the recursion, and the README uses the explicit sum for `1/B(c, a)`. For 3.4 it is not. The guide to Homework 8.5 (Zukerman lines 6787–6819, p. 159) rewrites Jagerman's integral as `∫ e^(−t)(1 + t/A)^k dt`, lets `k → ∞` with `A/k` fixed under the integral to get `∫ e^(−(1 − k/A)t) dt`, and reads off `∞` or `1/(1 − k/A)`. The README's route is the same substitution, the same pointwise limit and the same two values.

What the README adds is the justification of the passage to the limit, which the guide omits: the integrands increase in `c`, so monotone convergence applies. The smallest change is to say that: "the route below is that of the guide, with the passage to the limit justified by monotone convergence", and to restrict the sentence in the References and in the description to 3.3.

## C02 — Two Mathlib files named in the supplier contracts do not exist at the pin

Under "From Mathlib" (README lines 544 and 546) `Matrix.of` is placed in `Mathlib/Data/Matrix/Defs.lean` and `Finset.prod_range_succ` in `Mathlib/Algebra/BigOperators/Basic.lean`. Neither file exists at the pinned Mathlib: `Matrix.of` is at `Mathlib/LinearAlgebra/Matrix/Defs.lean`, line 90, and `Finset.prod_range_succ` at `Mathlib/Algebra/BigOperators/Group/Finset/Basic.lean`, line 560. The declarations themselves exist with the stated content; only the paths need replacing. The other fourteen Mathlib paths and the three Tau Ceti paths are right.

## C03 — The numbers 1.2, 1.3 and 1.4 of StandardDistributions exist only in an open revision of that roadmap

The scope section (README line 514) and the supplier contracts (line 603) cite "1.2, 1.3 and 1.4 in its sectioned numbering" for the binomial, geometric and Poisson entries of StandardDistributions, Layer 1. On main that layer has no numbered subsections: the entries are the bold paragraphs "Bernoulli and binomial", "Geometric" and "Poisson". The headings `### 1.2 Bernoulli and binomial`, `### 1.3 Geometric`, `### 1.4 Poisson` are those of the open revision of StandardDistributions (its template update), which neither the description nor its list of open suppliers names. Section 7.3 exists on main under that number.

Nothing depends on these entries (they are "named for comparison"), so the smallest change is to cite them by name only, "Layer 1, the entries on the binomial, geometric and Poisson laws", which is valid on main and at the revision's head; or to keep the numbers and name the revision in the description.

## N01 — The Adan–Resing reference has no date and its address redirects

The notes carry the date March 26, 2015 on their title page, and `www.win.tue.nl/~iadan/queueing.pdf` now redirects to `iadan.win.tue.nl/queueing.pdf`. Since the locators are printed page numbers of an unversioned file, the date would let a reader check that they hold the same text.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| 1.1 generator; Q-matrix and irreducibility criteria | `N=2,b=1,d=2`; `b=(1,0),d=1`; `N=0`; a rate `≤ 0` | `[[−1,1,0],[2,−3,1],[0,2,−2]]`; state 2 unreachable from 0; `1×1` zero matrix; only edge `n→n+1` is `b_n` | holds | none |
| 1.2 `πQ=0` iff detailed balance (Lean) | `N=1,b₀=2,d₁=1,π=(1,2)`; `b₀=−1,π=(1,−1)`; `N=0`; general `n` | `πQ=(0,0)`, `2=2`; `πQ=(0,0)`, `−1=−1`; both sides true; `(πQ)_n=F_(n−1)−F_n` | holds | none |
| 1.3 product form (Lean) | `b=1,d=2`; `b=(1,0),d=1`; `b₀=d₁=0`; `b=−1,d=1,N=2` | `(4/7,2/7,1/7)`; `(1/2,1/2,0)` unique; law `(1,0)` but `(0,1)` stationary; `π₀+π₁=0` forces no probability vector | holds; both negative controls real | none |
| 2.1 truncated geometric law | `N=2,ρ=1/2`; `ρ=2`; `ρ=0`; `λ=1,μ=0,N=1` | `(4/7,2/7,1/7)`; `(1/7,2/7,4/7)`; `(1,0,0)`; stationary `(0,1)` against `(1,0)` | holds | none |
| 2.2 mean formula | exact rationals, `N≤5`, `ρ∈{1/3,1/2,2,3,−1/2,−2}`; `ρ=1`; `N=1,ρ=−1` | both sides equal in all 36 cases; `N/2` against `0`; `0` against `−1/2` | holds; hypothesis `ρ≥0` stronger than needed, harmless | none |
| 2.3 limit to the geometric law (Lean) | `p=1`; `p=0`; `ρ=3/2,N=10`; `ρ=−1` | point mass at 0 both sides, means 0; `1/(N+1)→0` against mass 1; `0.337232`; alternates `1,0` | holds; `p≠0` needed | none |
| 3.1 Erlang law, Poisson conditioning | `c=2,a=1`; `B(3,2)`; `B(0,a)`; `B(c,0)`; wrong normalisation | `(2/5,2/5,1/5)`; `4/19`; `1`; `0`; `1/6≠1/5` | holds | none |
| 3.2 recursion; Jagerman (Lean) | exact, `c≤6`, `a∈{0,1/2,1,3,10}`; `a=−1`; `c=0`; `c=1`; general | recursion equal in all cases; `1≠0`; `a·(1/a)=1`; `1+1/a`; `∑_j c!/((c−j)!aʲ)` both sides | holds; `a>0` needed at `c=0` | none |
| 3.3 carried load; decrease in `c`; increase in `a` (Lean) | exact as above; `B(1,0)=B(2,0)`; `c=0`; `c=1,a=−1` | `∑n·law=a(1−B)` in all cases; `0=0`; `B(0,a)=1`; `0` against `−1` | holds | none |
| 3.4 many servers (Lean); Poisson limit | `a=2`; `a=1`; `a=0`; `a=−1`; `c=10,a=3,n=0` | `0.50481`, `0.500498`; `0.075700`, `0.024812`; `0`; `B(2,−2)=2`, `B(5,−5)=625/296`; `0.0498016` against `0.0497871` | holds | C01 (attribution of the route) |
| 4.1 Engset law, binomial form | `M=c=3,r=1`; `M=3,c=1`; `c>M`; `p=1,M=c=1` | `(1/8,3/8,3/8,1/8)`; `(1/4,3/4)`; weight `C(M,n)=0` above `M`; `1` against `0` | holds | none |
| 4.2 rate-weighted Engset law | exact, `1≤M≤5`, `0≤c≤7`, `r∈{0,1/3,1,5}`; `M=0`; `M=2,c=1,r=−1/2` | equal in all 160 cases; `0` against mass 1; `0` against `(2,−1)` | holds | none |
| 4.3 machine-repair law | exact, `M≤5`, `r∈{1/3,1,5}`; `M=2,r=1`; `r=0`; `n=M+1` | equals `erlangLaw M (1/r) (M−n)` in all cases; `(1/5,2/5,2/5)`, `4/5=2−6/5`; point masses at `0` and `M`; `0` against a positive mass | holds | none |
| Supplier contracts, From Mathlib | 16 declarations opened | 14 paths right, 2 wrong | statements right | C02 |
| StandardDistributions citation | main and the open revision | main: unnumbered entries; revision: `### 1.2`, `### 1.3`, `### 1.4`; `7.3` on both | resolves by name | C03 |

- Source locators checked against the text: 20 of Zukerman (§2.5.2, §2.5.10, §§8.2, 8.3, 8.5–8.8, §§10.1–10.2, §11, §12.3, with equation numbers, homework numbers and pages) and 6 of Adan–Resing (§4.2.1, §4.2.2, §4.3, §§11.1–11.3, pages by the printed footers); all support the statements as written.
- Library declarations opened at the pin: 16 of Mathlib (among them `ProbabilityTheory.geometricMeasure`, `Mathlib/Probability/Distributions/Geometric.lean` line 52, the point mass at `0` for `p = 0`; `geometricMeasure_real_singleton`, line 75; `Real.integral_rpow_mul_exp_neg_mul_Ioi`, `Mathlib/Analysis/SpecialFunctions/Gamma/Basic.lean` line 465; `Real.tendsto_one_add_div_pow_exp`, `Mathlib/Analysis/SpecialFunctions/Complex/LogBounds.lean` line 444) and 3 of Tau Ceti (`TauCeti/Probability/Distributions/Geometric/Basic.lean` line 118, `TauCeti/Probability/Distributions/Poisson/Tail.lean` line 120, `TauCeti/Analysis/SpecialFunctions/IncompleteGamma.lean` line 389).
- Cross-roadmap citations resolved: ContinuousTimeMarkovChains 1.1, 4.3, 4.4, 5.1 (first bullet and Check), 5.2 (Check on birth–death matrices) and its scope, at its open head; StandardDistributions Layer 1 and 7.3, MarkovChainsAndRenewal Layers 4–7, StochasticCalculus §0.6 on main; DirectedMatrixTreeAndBEST 3.1 and PopulationDynamics 3.3 at their open heads.
- Duplication: no birth–death generator, Erlang or Engset law in the pinned Mathlib or Tau Ceti; no other roadmap on main or open states one. Ownership was checked against every open head.
- Dependency check: `depcheck: 182 roadmaps, 2068 edges, 0 problem(s)`; no UPWARD or CYCLE line. The one supplier not on main, ContinuousTimeMarkovChains, is a new roadmap in an open pull request, named in the description.
- Elaboration: `Suggested.lean` elaborates with six `sorry` warnings and nothing else; the twelve elaborated types were compared with the README statements, no binder is lost and nothing changed. One-tactic probe (`rfl`, `simp`, `simp` and `norm_num` with the six definitions unfolded, `infer_instance`): none of the six theorems closes.
- Headline theorems: the six of the README's overview are all stated in `Suggested.lean`; none is absent or stated through a stand-in; no declaration is padding.
- Automatic checks: all passed on this head.

Overlap check: read ContinuousTimeMarkovChains, TimeReversalOfMarkovChains, MarkovChainsAndRenewal, PopulationDynamics, PoissonApproximation; nothing shared (Q-matrices, irreducible generators, uniqueness of the stationary law and detailed balance are owned by ContinuousTimeMarkovChains and cited; the three-state birth–death matrix occurs in the others only as an example).

Source independence: 20 passages compared with 2 sources (the 13 sampled sections and 7 further passages: the overview's description of births and deaths, the conditioning sentence of 3.1, the recursion route of 3.2, the route of 3.4, the route of 1.2, the congestion paragraph of 4.2, the docstring of `erlangB`), no wording shared beyond formulas and standard names; largest share Zukerman, 20 of 26 locators; contents compared with Zukerman: independent (Layers 1, 2, 3, 4 draw on its §11, §12.3, §8, §10, in another order; Layer 3 merges §§8.5, 8.6, 8.8 and its order is forced by 3.3 and 3.4 needing 3.2). The route of 3.4 is the idea of the guide to Homework 8.5 in the README's own words (C01).

Research link: Erlang's loss formula (Erlang 1917) and Jagerman's integral (Jagerman, Bell Syst. Tech. J. 53, 1974), as cited in Zukerman's bibliography; the product form of reversible birth–death chains is the base case of the theory in ContinuousTimeMarkovChains (Kelly). Rests on Zukerman §8.2–8.3 and the README.

## Not verifiable

- none. (The page of Adan–Resing equation (11.3), p. 116, was read as the page following the footer 115.)

## Source issues

- **Misprint** in Zukerman at §11, generator display, p. 191: the source says the upward rate is defined for every state index up to `k`; it should be up to `k − 1`, as state `k` is the last; affects nothing.
- **Misprint** in Zukerman at §11, first page, p. 191: the source says the birth and death rates of §2.5 are called `a_i` and `b_i`; it should be `b_i` and `d_i`, the names of equations (225)–(226); affects nothing.
- **Misprint** in Zukerman at §12.3, generator display, p. 195: the source says the last diagonal entry is indexed by `k`; it should be indexed by `N`, the buffer size of that section; affects nothing.
- **Gap** in Zukerman at §8.7, guide to Homework 8.5, p. 159: the source says the limit in `k` is taken inside the integral with no reason given; it should be justified, for instance by monotone convergence since the integrands increase in `k`; affects the proof.
- **Misprint** in AdanResing at §11.2, Example 11.2.1, p. 115: the source says the balance relation is read off figure 11.1; it should be figure 11.2, the diagram of the loss system; affects nothing.

## For the human reviewers

- **Scope.** Both sources are unrefereed teaching texts: Zukerman is a textbook posted on arXiv (1307.2968v27), AdanResing lecture notes dated 2015. The README cites no refereed source; Erlang (1917) and Jagerman (1974) appear only in Zukerman's bibliography.
- **Scope.** Five targets or Checks are posed in Zukerman as homework exercises (8.4, 8.5, 8.8, 8.9, 12.1), which the README says at each place; the headline of 3.4 is Homework 8.5 with its guide.
- **Licence.** AdanResing was read from an address under `iadan.win.tue.nl`, taken to be the first author's page from its name; the file states no licence.
