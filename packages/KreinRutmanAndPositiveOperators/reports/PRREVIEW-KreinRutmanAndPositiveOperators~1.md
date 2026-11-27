# Review of KreinRutmanAndPositiveOperators (pull request #3219 at 3aac32d)

**Verdict:** accepted

**Summary.** Accepted: every statement, route, Check and worked example was recomputed and none is false, the ten theorems elaborate against the pins, and no other roadmap owns these objects. There are two small corrections (a sentence that claims a counterexample for every hypothesis, and a compactness hypothesis in 4.2 that the conclusion does not need) and three format notes, none blocking. One thing is left to the humans: the Gerhat thesis, which carries 11 of the 14 source locators, could not be read from a place the project accepts, so its locators, its wording and its table of contents were not compared.

## C01 — The sentence "Each hypothesis comes with an example showing that the conclusion fails without it" claims more than the Checks give

A reader takes this sentence of the summary (README line 22) to cover every hypothesis, and the README itself says otherwise: the opening paragraph of Layer 3 (lines 261–263) states that 3.2 and 3.3 hold without the nonzero point of `K`. Compactness has a counterexample only for 2.1 (the shift); there is none in Layers 3 and 4, and compactness of `P` in 4.2 has none because none exists (C02). The pull request description has the same sentence in the form "Every hypothesis except the nonzero point in 3.2 and 3.3 … has a counterexample Check without it".

The smallest change is to name what the examples cover, for instance: "The hypotheses of 2.1 (salience, dense span, `r(T) > 0`, compactness) and strong positivity in 3.3 and 3.4 each come with an example showing that the conclusion fails without them", and the matching sentence in the description.

## C02 — Strict monotonicity 4.2 holds for every bounded `P`; compactness of `P` is used only by the route

In 4.1 the README stresses that `P` is not assumed compact, so a reader expects the hypothesis in 4.2 (README line 436, `hP` in `realSpectralRadius_lt`) to be needed. It is not. Let `x` be the interior eigenvector of `T` from 3.1, `r = r(T)`, and `w = P x − T x`, a nonzero point of `K`. As in the route, `P` is strongly positive, so `P w` is interior and `P w − a x ∈ K` for some `a > 0`. For `s > 0` put `u = x + s w` and `c = r + s a`; then

    P u − c u = (1 − c s) w + s (P w − a x),

which lies in `K` once `c s ≤ 1`, and `u` is a nonzero point of `K`. Theorem 1.2 applied to `P` gives `r(P) ≥ r + s a > r(T)`. Only 3.1 for `T` and 1.2 are used.

The statement as written is true, so nothing has to change. The author would either drop `hP` (and say, as in 4.1, that `P` is any bounded operator), or keep it and note that it is there to match the source's statement.

## N01 — The Lean file's namespace and module docstring differ from the house form

`Suggested.lean` opens `namespace KreinRutman` where the other roadmaps use `TauCetiRoadmap.<Name>`, and its module docstring does not say that the README is the roadmap and the file is not.

## N02 — One Mathlib name is cited without its namespace

`spectralRadius_le_nnnorm` (4.2 *Needs:*, line 448, and the Mathlib contracts, line 506) is `spectrum.spectralRadius_le_nnnorm` in `Mathlib/Analysis/Normed/Algebra/Spectrum.lean`.

## N03 — Two phrases describe the writing rather than the mathematics

"(Proved here.)" in 1.1–1.3 and 4.1, and "That theorem is a README item there, so its short proof is kept here" in step 2 of 2.1 (line 180), would read better as "No source is cited; the route is complete" and "its short proof, for reference:".

## Questions for the author

- Can 2.1 and 3.1–3.4 carry one locator into a refereed text besides the thesis (Krein and Rutman's 1948 memoir itself, or a standard monograph on nonlinear functional analysis or positive operators)? The thesis could not be fetched from a place the project accepts, so no Gerhat locator was checked, and the README's attribution "their Theorem 6.1, 1948" rests on the thesis alone.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Conventions: solid cone is total | `x = (y+ax)/(2a) − (y−ax)/(2a)` | right side `= 2ax/(2a) = x`; both points within `a‖x‖ < ρ` of `y` | true | none |
| Conventions: `realSpectralRadius` vs `spectralRadius ℝ` | rotation `[[0,−1],[1,0]]`; `E = 0` | complex spectrum `{±i}`, radius 1; real spectrum empty, 0; trivial algebra gives 0 | distinguishes | none |
| 1.1 Neumann series | `T=[[2,1],[1,2]]`, `μ=4`, `μ=2`; `T=1`, `μ=1` | `(4−T)⁻¹=(1/3)[[2,1],[1,2]]`; `(2−T)⁻¹=[[0,−1],[−1,0]]`; `1−T=0`; partial sums give `1−μ^(−N)T^N` | true; Checks true | none |
| 1.2 lower bound | `K=ℝ²,T=0`; `u=(1,0)`, `u=(1,1)` for `[[2,1],[1,2]]`; `c≤0` | `−cu∈K` all `c`, `r=0`; `Tu−2u=(0,1)`; `Tu=3u`; `ofReal c=0` | true; salience needed | none |
| 1.3 matrices | rotation; empty `n`; `[[1,1],[0,2]]` | both sides 1; both sides 0; `(X−1)(X−2)`, radius 2 | true | none |
| 2.1 Krein–Rutman | rotation on `ℝ²`; ray with `diag(0,1)`; Volterra; right shift; `[[1,1],[0,2]]`; `min(x,y)` kernel | `ker(T−1)=0`; eigenline misses `K`; `‖Vⁿ‖=1/n!`; no eigenvalue; `x=(1,1)`, `φ=(0,1)`; `r=4/π²` | true; four hypotheses needed | none |
| 2.1 route, steps 3–5 | Laurent part on range of `P`; telescoping sum; `|λ+ελ²|²` | `(μ−r)^m ∑_(k<m)(μ−r)^(−k−1)(S−r)^k → (S−r)^(m−1)`; `Tx=r(x−r^(n−1)u)+rⁿu`; `r²(1+2εRe λ+ε²r²)` | sound | none |
| 3.1 interior eigenvector | `K=ℝ²` rotation; `K={0}`, `T=0`; `E=ℝ`, `T=t>0` | no real eigenvector; `r=0`; `r=t`, `x=1` | true | none |
| 3.2 strictly positive functional | `[[2,1],[1,2]]`; `[[1,1],[0,2]]`; `K={0}` | `Tᵀ(1,1)=3(1,1)`; `(0,1)` vanishes at `e₁`; `φ=0` works | true | none |
| 3.3 simplicity | `[[1,1],[0,1]]`; `diag(1,2)`; identity on `K=ℝ²` | `(T−1)²=0`, `ker=ℝ²`; `e₁` has eigenvalue `1≠2`; eigenspace `ℝ²` | true; Checks true | none |
| 3.4 strict dominance | `[[0,1],[1,0]]`; rotation with `K={0}`; ellipse identity | eigenvalue `−1`, modulus 1; `i` spectral; `A(cos s·u+sin s·v)=cos(s−θ)u+sin(s−θ)v` | true | none |
| Layer 3 examples | Lorentz cone map; kernel `1+xy` | spectrum `{2,±i}`, `2x₀>(x₁²+x₂²)^(1/2)`; trace 4/3, det 1/12, roots `(4±√13)/6`, slope `(√13−2)/3` | true | none |
| 4.1 monotonicity | `T=2·rotation,P=0` on `ℝ²`; ray; `[[1,1],[1,1]]` vs `[[2,1],[1,1]]` | `2>0`; `1>0`; `2 ≤ (3+√5)/2` | true | none |
| 4.2 strict monotonicity | `K={0}`, `P=T`; `P=T+1`; bounded noncompact `P` | `r<r` false; `2<3`; `Pu−cu=(1−cs)w+s(Pw−ax)∈K` gives `r(P)≥r+sa` | true; `hP` unneeded | C02 |
| Summary sentence on hypotheses | nonzero point in 3.2, 3.3; `P` compact in 4.2 | `φ=0` satisfies 3.2 for `K={0}`; C02 argument | overstated | C01 |

- Source locators checked against the text: 3 of 14 (Intissar Definition 2.1, Theorem 2.2, Corollary 2.3, at Intissar2019 lines 311–316, 341–343, 349–356); the 11 Gerhat locators were not checked.
- Library declarations opened at the pin: 14 of Mathlib and 13 of Tau Ceti, each at its file; all exist with the hypotheses the contracts state (for instance `IsCompactOperator.exists_projection_ker_range_pow_sub_smul`, `TauCeti/Analysis/Normed/Operator/Compact/Decomposition.lean` line 155; `Matrix.ofReal_le_spectralRadius_of_smul_le_mulVec`, `TauCeti/LinearAlgebra/Matrix/PerronFrobenius/Nonnegative.lean` line 158).
- Cross-roadmap citations resolved on main: 4 (BanachAlgebras 8.1 and 8.2, PeriodicNonnegativeMatrices Layer 2, ClassicalErgodicTheory 8.6).
- Duplication by object: no Krein–Rutman statement, strongly positive operator or cone-invariant spectral radius in the pinned Mathlib or Tau Ceti, on main, or in the open roadmaps searched.
- Dependency check: `depcheck: 94 roadmaps, 1054 edges, 0 problem(s)`; no UPWARD or CYCLE line. The one roadmap supplier, BanachAlgebras, is on main.
- Elaboration of `TauCetiRoadmap/KreinRutmanAndPositiveOperators/Suggested.lean`: ten `sorry` warnings and nothing else. One-tactic probe (`simp`, `rfl`, `infer_instance`, `simp` with the three definitions unfolded, `aesop`) on a copy: none of the ten closes. The 13 elaborated types were compared with the README statements: no binder lost, same generality.
- Headline theorems (2.1; 3.1–3.4; 4.1, 4.2) are all stated; none is unstatable. No change outside the roadmap folder.
- The worker's automatic checks all passed on this head.

Overlap check: read RegularSplittingsAndMMatrices, ConditioningAndPerturbation, PeriodicNonnegativeMatrices, EigenvalueIterations, ProbabilisticAndMetricNumberTheoryPartII; nothing shared. RegularSplittingsAndMMatrices 1.1 and 1.3 own the matrix comparison and Neumann criterion on `Matrix` carriers, this roadmap the operator statements on cones; ProbabilisticAndMetricNumberTheoryPartII 3.3 owns the Hilbert distance and Birkhoff contraction on cones, which are not stated here.

Source independence: 8 passages compared with 1 source (Intissar2019), none shared; largest share Gerhat2016, 11 of 14 locators; its text and table of contents could not be read, so wording and contents were not compared with it. From the numbers the README cites, Layer 2 ↔ §6.1 and Layers 3–4 ↔ §6.2, an order the *Needs:* lines force (3.x needs 2.1; 4.x needs 2.1, 3.1, 3.2); Layer 1 has no counterpart.

Research link: The headline targets are the theorem of Krein and Rutman (1948) and its strongly positive form, as README 2.1 and 3.1–3.4 attribute them through Gerhat (2016); Intissar (2019), Theorem 2.2 and Corollary 2.3, states the eigenvector half and monotonicity (read). Rests on the README and on Intissar2019.

## Not verifiable

- Gerhat2016, all 11 locators (proof of Theorem 6.1.3 with (6.1.2), p. 78; Lemmas 6.1.1, 6.1.2, p. 76; Theorem 6.1.3, p. 77; Proposition 5.3.2, p. 71; Lemma 6.2.1, p. 82; Theorem 6.2.3 (i)–(iv), pp. 84–89; Corollary 6.2.5, pp. 90–91): the thesis is on the TU Wien repository, a host the sources service places in no licence class; a request for the text was filed and no other copy was sought.
- The attribution of 2.1 to Krein and Rutman's Theorem 6.1 (1948): the README gives it through the thesis; the memoir was not read.
- Sampled targets affected: 2.1, 3.1, 3.2, 3.3, 3.4, 4.2 and the source remark of 1.1. Their mathematics was verified independently (table above); only the locators are open.

## Source issues

- **Misprint** in Intissar2019 at the list of order axioms before Definition 2.1, printed page 10: the source says that two inequalities between `x₁, y₁` and `x₂, y₂` add to an inequality between `x₁ + y₁` and `x₂ + y₂`; it should be between `x₁ + x₂` and `y₁ + y₂`; affects nothing.

## For the human reviewers

- **Not tested.** Gerhat2016 carries 11 of the README's 14 source locators; its text and table of contents could not be read, so wording and arrangement were not compared with it.
- **Licence.** Gerhat2016 is on repositum.tuwien.at (handle 20.500.12708/2936), a host the sources service does not classify; whether that copy is open is for a human to confirm.
- **Scope.** The two sources read or cited are a Diplomarbeit (TU Wien, 2016) and an arXiv preprint (1910.01120v1); the 1948 memoir of Krein and Rutman is named without a locator (README lines 166–170).
