# Review of ZeroDimensionalIdeals (pull request #2983 at ab3bb21)

**Verdict:** accepted

**Summary.** Accepted: no statement, Check or route was found false, and every one of the thirteen sampled targets survived its degenerate cases (unit ideal, empty variable type, imperfect and non-closed fields, infinite dimension). There are two small corrections (the eigenvalue theorem and Stickelberger's formula are stated only for coefficients in the algebraically closed field, narrower than the cited source, and one sentence about the sign convention is ambiguous) and two format notes, none blocking. Sturmfels's book, which carries most of the locators, could not be read through a legal copy, so its locators are unverified; that and the status of the cited preprint are left to the human reviewers.

## C01 — 2.2 and 2.3 take the ideal over the algebraically closed field itself, while Cox states both for an arbitrary field with the points over its algebraic closure

A reader with an ideal of `ℚ[x]` (the setting of both cited sources) cannot apply the eigenvalue theorem or Stickelberger's formula as stated: the layer opens with "`K` is a field and `I` an ideal of `MvPolynomial σ K`; the points are taken over `K` itself" (line 200), and 2.2 and 2.3 then assume `K` algebraically closed. The base change that would bridge the gap (`K ⊗ A` is the quotient by the extended ideal, with the same characteristic polynomial) is no target. Cox's Theorem 1.1 and formula (1.2) are for any field `F`, with the solutions and the algebra taken over the algebraic closure (Cox2020 lines 13–40), and the README does not say at these locators that it is narrower, although 1.1, 1.2, 5.2 and 5.3 all carry `[Algebra k K]`.

The smallest change is to name Cox's setting at the two locators ("Cox works over any field with the points over its algebraic closure; here the field is closed"). The route of 2.2 already proves more and would support the general form at no cost: for `I ⊆ MvPolynomial σ k`, `K` algebraically closed over `k` and `μ : k`, `μ` is an eigenvalue of `m_f` iff `f(a) = μ` for some `a ∈ zeroLocus K I`, since `A/𝔪` embeds in `K`. For 2.3 the general form would be the characteristic polynomial mapped to `K`, with the multiplicities of the extended ideal.

## C02 — "with Cox's sign convention" in 2.3 reads as if the displayed formula used it

The parenthesis after the display of 2.3 (line 253) says "statement only, with Cox's sign convention", but the display is the monic `∏ (X − C (f a)) ^ μ(a)` of `LinearMap.charpoly`, whereas Cox's (1.2) is `det(m_f − xI) = ∏ (f(a) − x)^μ(a)` (Cox2020 lines 37–40). The Conventions section has it right; here the sentence would read correctly as "Cox states it for `det(m_f − X)`, see Conventions".

## N01 — The proof of Cox's Theorem 4.1 is on p. 6 only

3.1 (line 328) and the References give "proof pp. 6–7"; the proof ends on p. 6 (Cox2020 line 285), and p. 7 opens with Corollary 4.2.

## N02 — The Check of 4.2 on "Sturmfels's degree-8 eliminant" has no locator

The polynomial at line 498 is attributed to the book without a page or example number, unlike every other use of that source.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| Conventions: charpoly sign, lex direction | `K[x]/(x−2)`; `X 1^5 + X 0` | charpoly `X−2` vs Cox `2−X`; Mathlib doc-example at pin: `X 1 < X 0`, so degree is `X 0` | agree | none |
| 1.1 finiteness TFAE | `I=⊤`; `I=⊥`, σ nonempty; σ empty; `(x²+y²)` over ℝ; `σ=ℕ`, `(X_i²)` | ⊤: all five true; ⊥: all five false; σ=∅, ⊥: all true; ℝ: (5) true, (1),(3) false; ℕ: (3) true, (1) false | holds; both hypotheses needed | none |
| 1.2 count = dim iff radical | `⊤`; `(x²)`; `(x²−y,y²−1)`; `(x²+t)/𝔽₂(t)`; `(x²+1)/ℝ`; `(x²)⊆ℂ[x,y]` | 0=0, radical; 1≠2, not radical; 4=4, radical; 1≠2 but prime; 0≠2 radical; 0=0 not radical | holds; perfect, closed, finite each needed | none |
| 2.1 multiplicity | `x²(x−1)`; `(x²,y²)`; non-point | 2, 1; 4 (vs `dim A/𝔪`=1, `1+dim 𝔪/𝔪²`=3); quotient is zero ring, finrank 0 | definition separates wrong variants | none |
| 2.2 eigenvalue theorem | `⊤`; `(x²−y,y²−1)`, `f=xy`; `(x²+1)/ℝ`, `f=x²`; `I=0` | no eigenvalue, no point; values 1, −1, −i, i = eigenvalues; eigenvalue −1, no point; no eigenvalue, all points | holds | C01 |
| 2.3 Stickelberger | `⊤`; `x²(x−1)`, `f=x`; `(x²−y,y²−1)`, `f=x`, `y`; `(x²+1)/ℝ` | 1=empty product; `X²(X−1)`; `(X−1)(X+1)(X²+1)`, `(X−1)²(X+1)²`; `X²+1` vs 1 | holds; closedness needed | C01, C02 |
| 2.4 joint eigenvectors | `⊤`; σ=∅, `⊥`; `(x²,y²)`; `I=0⊆K[x]` | ∅=∅; one point, `v=1`; `xy` killed by `x`,`y`; no eigenvector, all points | holds over any field | none |
| 3.1 type of trace form | `A=0`; ℂ; `ℝ[x]/(x²)`; `(x²−y,y²−1)`; `ℝ[x,y]/(x²+y²)` | (0,0); diag(2,−2), (1,1); diag(2,0), (1,0); Gram 4,4,[[0,4],[4,0]], (3,1)=(2+1,1); form 0 vs (1,0) | holds | none |
| 3.2 real solutions with signs | `h=1,y,x,x−2,2x+1` on `(x²−y,y²−1)`; `x²(x−1)`; ℂ-block | point diagonalisation: (3,1),(3,1),(2,2),(1,3),(2,2); Gram rows (3,1,1),(1,1,1),(1,1,1), (2,0); det `−4(u²+v²)` | signatures 2,2,0,−2,0 = counts | none |
| 4.1 radical criterion | `⊤`; `(x²,y²)`; `(x²−y,y²−1)`; `(x²+t,y²+t)/𝔽₂(t)` | minpoly 1, radical; `T²`, not radical; `T⁴−1`,`T²−1`, radical; `T²+t` squarefree, `(x+y)²=0` | holds; perfectness needed | none |
| 4.2 radical formula | `⊤`; `(x²,y)`; `(x²)/𝔽₂`; degree-8 polynomial; `𝔽₂(t)` example | ⊤=⊤; `(x,y)`; `rad T²=T` vs `p/gcd(p,p′)=1`; cubic `w³+6w²+17w+8` has no rational root, so both give the degree-7 polynomial; right side `I`, not radical | holds | N02 |
| 5.1 shape iff multiplicities | `⊤`; `(x²,y²)`; `(y²,x−y)`; `(x²−1,y)`; `(x²+1,y)/ℝ` | `r=1`, vacuous; 4≠2, no shape; 2=2, shape; 1=1 both points, `dim 2>1`, not injective; vacuous, `A≅ℂ` | holds; injectivity and closedness needed | none |
| 5.2 shape lemma | `n=0`; `d=1`; `(x²−1,y−x)`; `(x²−y,y²−1)`, `x` last; `(x²−1,y)`; `(x²,y)`; `⊤` | `{r}`; `{X i−a_i, X n−a_n}`; `{x−y,y²−1}`; `{y−x²,x⁴−1}`; shared `y=0`; 1 point, `d=2`; no `q_i` of degree `<0` | holds; each hypothesis needed | none |
| 5.3 linear form | `⊤`; `(x²−x,y²−y)/𝔽₂`; `(x²,y²)/ℚ`; `(x²−y,y²−1)` | `A=0`, surjective; `ℓ²=ℓ`, dim ≤2<4; `ℓ³=0`, dim ≤3<4; `ℓ=x`, `T⁴−1` | holds; infinite field and count needed | none |
| Layer 5 example | Cox–D'Andrea's pair | eliminating by hand: `x₁=x₂²+1`, `x₂³+2x₂−1`; check `x₁²=x₂+1` modulo the cubic | agrees with the source | none |

- Source locators checked against the text: 14 (Cox2020: p. 1 finiteness, Theorems 1.1, 1.2, (1.2), (1.3), 4.1, Corollary 4.2, Theorem 5.1, Corollary 5.2, Theorem 5.3; CoxDAndrea2023: Example 1.1, Lemmas 2.1, 2.2, standing hypotheses at lines 53–54); 1 slip (N01).
- Library declarations opened at the pin: 52, among them `MvPolynomial.zeroLocus` (`Mathlib/RingTheory/Nullstellensatz.lean:39`), the maximal-ideal instance (`:108`), `vanishingIdeal_zeroLocus_eq_radical` (`:171`, `[IsAlgClosed K] [Finite σ]`), `card_algHom_le_finrank` (`Mathlib/LinearAlgebra/FreeModule/Finite/Matrix.lean:92`), `sigPos` (`Mathlib/LinearAlgebra/QuadraticForm/Signature.lean:65`, bounded by `finrank`, so 0 in infinite dimension), `MonomialOrder.lex` (`Mathlib/Data/Finsupp/MonomialOrder.lean:204`), `IsArtinianRing.quotNilradicalPowEquivPi` (`Mathlib/RingTheory/Artinian/Module.lean:615`); Tau Ceti `standardMonomials` (`TauCeti/RingTheory/MvPolynomial/Groebner/NormalForm.lean:69`), `IsReducedGroebnerBasis` (`…/Reduced.lean:58`), `comap_rename_lex` (`…/Elimination.lean:113`), `trace_eq_add_of_exact` (`TauCeti/LinearAlgebra/Trace/Exact.lean:43`), `sigPos_lift_radical` (`TauCeti/LinearAlgebra/QuadraticForm/Signature.lean:326`), `sum_sign_sturmSeq_univ` (`TauCeti/Algebra/Polynomial/Sturm/Infinity.lean:354`), `IsFullSetOfSections.charpoly_eq_prod` (`TauCeti/RingTheory/Norm/FullSetOfSections/Basic.lean:187`). All exist with the hypotheses the README names.
- Cross-roadmap citations resolved: GroebnerGeometry G1 and G2 on main; the open revision of GroebnerGeometry maps G1 to its Layer 1 in a table of former labels and keeps elimination in §1.7. No object of this roadmap is stated by GroebnerGeometry, ToricIdealsAndMarkovBases, the completed RealAlgebraicGeometry or the pinned libraries (searched by object: finiteness of points, shape lemma, eigenvalue theorem, trace-form signature, multiplicity as length of the local ring).
- Overlap check: read GroebnerGeometry (main and open revision), ToricIdealsAndMarkovBases, IntegralLattices, ArithmeticInterpolationDeterminants; nothing shared.
- Dependency check: `depcheck: 133 roadmaps, 1473 edges, 0 problem(s)`; the only roadmap supplier is GroebnerGeometry G1, on main. No change outside the folder.
- Elaboration: `Suggested.lean` elaborates with `sorry` as the only warning (12 theorems); the elaborated type of each of the 14 declarations was compared with its README statement, no binder lost. `[DecidableEq k]` in the radical formula is needed for the normalization of `Polynomial k`.
- One-tactic probe: `rfl`, `simp` and `infer_instance` close none of the 12 theorems; all 12 headline theorems of the README are stated, both definitions have real bodies, no `set_option`, single `import Mathlib` plus two Tau Ceti modules.
- The automatic checks all passed on this head. The description agrees with the head (12 theorems, 2 definitions, suppliers, a new roadmap).

Source independence: 11 passages compared with 2 sources (Cox2020, CoxDAndrea2023), none shared beyond formulas and standard names; largest share Sturmfels2002, 13 of 22 locators in the layers; its text and table of contents could not be read, so the contents were not compared with it (by the README's own page locators Layers 1, 4 and 5 draw on pp. 13–15, Layer 2 on pp. 16–18 and Layer 3 on p. 20, which is not a run of sections in order).

Research link: Layers 2–3 are the eigenvalue theorem, Stickelberger's formula and the trace-form count of real solutions surveyed by Cox (2020) after Scheja–Storch and Pedersen–Roy–Szpirglas; Layer 5 is the shape-lemma characterisation Cox–D'Andrea (2023) take from Becker–Marinari–Mora–Traverso. Rests on Cox2020 lines 383–397 and CoxDAndrea2023 lines 184–187.

## Not verifiable

- Sturmfels2002 (Propositions 2.1, 2.3, 2.5, Theorems 2.2, 2.6, 2.8, Corollaries 2.7, 2.9, §§2.2–2.4, pp. 13–20, the two short quoted phrases and the degree-8 polynomial of 4.2): no legal copy could be read; the cited preprint address was not accepted as an author's page and the book is not openly available. Every target that cites it carries a complete route in the README, and those routes were checked independently of the book.
- Cox–Little–O'Shea (both books): cited only at second hand, as the README says; not opened.

## Source issues

- none

## For the human reviewers

- **Not tested.** Sturmfels2002 carries the largest share of locators (13 of 22 in the layers); its text and table of contents were not read, so wording and arrangement were not compared with it.
- **Licence.** The README cites Sturmfels's book through a preprint at `math.berkeley.edu/~bernd/cbms.pdf` (References, line 751); the copy's status as the author's own page could not be settled automatically.
