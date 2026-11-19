# Review of LinearSystemsAndControl (pull request #2568 at 0df8d12)

**Verdict:** accepted

**Summary.** Accepted: no statement, Check or route was found false, every sampled locator into Sontag and Åström–Murray is at the stated theorem and page and supports the statement, and `Suggested.lean` elaborates with `sorry` as its only warning. There are three small corrections (one sentence of the build guide, one sentence of the pull-request description, one sentence of the conventions) and one format note, none blocking. Two points are left for the human reviewers: the scope (a textbook subject with one dominant source) and the host of the Sontag PDF.

## C01 — The build guide says the sections of a layer are in build order, but 1.5 is built on 1.6

An implementer who takes the sections of Layer 1 in order reaches the Hautus test before the Kalman decomposition its route uses. "How to read the build" (README line 52) says "Within a layer the sections are in build order", while the `*Needs:*` line of 1.5 (line 208) lists 1.6, and the route of 1.5 (lines 195–197) uses the second block `A₂₂` of that decomposition. The smallest change is to the sentence: "Within a layer the sections are in build order, except that 1.5 uses 1.6." Exchanging the two sections would do as well; that is the author's choice.

## C02 — The description says the roadmap depends on no roadmap that is not on main; the head depends on IterativeMethodsForLinearSystems 1.2

The description's sentence "Nothing in this roadmap depends on a roadmap that is not on main" is contradicted by the head: section 5.1 (README lines 476–480 and 504) and the supplier contracts (lines 759–763) cite IterativeMethodsForLinearSystems 1.2 for the equivalence of Schur stability with `A ^ k → 0`, and that roadmap is still an open pull request. The description's own stability paragraph and its dependency block already say so. The sentence that would be right: "The roadmap depends on one roadmap that is not yet on main, IterativeMethodsForLinearSystems (section 1.2, for one statement of 5.1); it merges first."

## C03 — The convention on feedback signs says every statement quantifies over all feedback matrices; Ackermann's formula does not

A reader comparing 3.1 with a source in the convention `u = −K x` (Åström–Murray, Theorem 7.3, p. 7-15) is told in the Conventions (README lines 64–65) that such sources "state the same theorems, since every statement quantifies over all feedback matrices". Section 3.1 names one specific row, `f = −(q ᵥ* χ(A))`, and in the other convention the formula is `K = q χ(A)`, with the opposite sign; the second Check of 3.1 itself computes that reversing the sign gives `X² − 3X − 2` instead of `X² + 3X + 2`. The smallest change: "…state the same theorems, since every statement but 3.1 quantifies over all feedback matrices; in Ackermann's formula of 3.1 the sign of the feedback row is reversed."

## N01 — Two phrases of "Scope and ownership" describe the state of a pull request

"an open roadmap, not on main, on which this one depends for one statement" (README lines 675–676) will be out of date when the supplier merges. "IterativeMethodsForLinearSystems, on which this roadmap depends for one statement of 5.1, defines …" says the same without the date.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.1 reachable subspace, `ctrbMatrix` | double integrator, `b = e₂`, `e₁`; `A = 1`, `b = e₁`; `n` empty; `m` empty | `[b, Ab] = [[0,1],[1,0]]` rank 2; `[[1,0],[0,0]]`, span `e₁`; line `e₁` ≠ plane; `⊥ = ⊤`; `0` | agrees | none |
| 1.2 Kalman rank condition | `N = 0`; `N = 1`, `A = [a]`; double integrator `j < 1` | rank `0 = 0`; rank 1 iff some `bⱼ ≠ 0`; span `e₂` only, `Ab = e₁` | agrees | none |
| 1.3 discrete states | `k = 0`; double integrator from 0; `B = 0` | `{0}` = sup over `Fin 0`; `(0,u₀)`, then `(u₀,u₁)`; only `A^N x₀` | agrees | none |
| 1.4 feedback and coordinates | `diag(1,2)`, `b = e₁`, any `f`; `b f` for `f = (−a,−c)` | charpoly `(X−1−f₁)(X−2)`; `[[0,1],[−a,−c]]`, `[b, Ãb]` rank 2 | agrees | none |
| 1.5 Hautus test | `A = 1`, `b = (1,1)`, `μ = 1`; `diag(1,2)`, `b = (1,1)`; rotation ⊕ `[1]`, `b = e₃`; `m` empty, `N ≥ 1` | rank 1; rank 2; rank 3 for real `μ` (`μ²+1 ≠ 0`), rank 2 at `i`; rank drops at an eigenvalue | agrees, both directions | none |
| 1.6 Kalman decomposition | `diag(1,2)`, `b = e₁`; controllable pair; no inputs | `r = s = 1`, `P = 1`, blocks `[1],[0],[2]`, `B₁ = [1]`; `s = 0`; `r = 0` | agrees | none |
| 2.1 unobservable subspace | double integrator, `C = [1,0]`, `[0,1]`; `p` empty | outputs `x₁`, `x₂`, kernel 0; `CA = 0`, kernel span `e₁`; `⊤` | agrees | none |
| 2.2 duality, injectivity | `C = [1,0]`: `(Aᵀ,e₁)`, `(A,e₁)`; `C = [0,1]`; `𝔽₂`, `A = 0`, `C = [1,1]`; `p` empty | `Aᵀe₁ = e₂` controllable, `Ae₁ = 0` not; `Aᵀe₂ = 0`; both subspaces span `(1,1)`; injective iff `n` empty | agrees | none |
| 3.1 Ackermann | double integrator, `q = (1,0)`, `χ = X²+3X+2`; `𝔽₂`, `χ = X²+X+1`; `N = 1`; `N = 0` | `χ(A) = [[2,3],[0,2]]`, `f = (−2,−3)`, charpoly `X²+3X+2`; `f = (1,1)`, charpoly `X²+X+1`; `a − qb(a−c) = c`; `1 = 1` | agrees | C03 |
| 3.2 one input, uniqueness | `N = 1`, `B = [1,1]`; `diag(1,2)`, `e₁` over `ℚ`, `𝔽₂` | charpoly `X − (f₁+f₂)`, not unique; `(X−1−f₁)(X−2)` never `X²`; over `𝔽₂` `f = (1,0)` gives `X²` | agrees | none |
| 3.3 pole shifting | all pairs over `𝔽₂`, `𝔽₃`, `N ≤ 2`, `m ≤ 2`; `𝔽₂`, `N = 3`, `m ≤ 2`; `m` empty | 44,522 pairs enumerated: all `p^N` monic polynomials reached iff rank `N`, 0 mismatches; `X^N`, `X^N+1` coprime | agrees | none |
| 4.1 Gramian | double integrator, `b = e₂`; `t = 0`; `diag(1,2)`, `e₁`; `n` empty | `[[t³/3,t²/2],[t²/2,t]]`, det `t⁴/12`; `0`; `diag((e^(2t)−1)/2, 0)`; both sides true | agrees | none |
| 4.2 steering | double integrator, `T = 1`, `(1,0) → 0`; constant input | `W(1)⁻¹ = [[12,−6],[−6,4]]`, `v = (−12,6)`, `u = 12s−6`, state `(1−3s²+2s³, 6s²−6s)`, zero at 1; `(1+c/2, c) ≠ 0` | agrees | none |
| 5.1 Hurwitz, Schur | `[[0,1],[−2,−3]]`; rotation; Jordan block; `[[0,2],[0,0]]`; `n` empty | roots `−1,−2`; `±i`, real spectrum empty; `e^(−t)[[1,t],[0,1]]`; square 0, norm 2; both true | agrees | none |
| 5.2 Lyapunov | `A = [[0,1],[−2,−3]]`, `Q = 1`; `A = [1]`; `A = [0]`; rotation, `Q = 0` | `AᵀP + PA = −1` for `P = [[5/4,1/4],[1/4,1/4]]`, det `1/4`; `P = −Q/2`; `0 = −1`; `P = 1` and `0` both solve | agrees | none |
| 5.3 observable output | same `A`, `C = [1,0]`; `A = [−1]`, `C = 0`; `A = [0]`, `C = 0` | `AᵀP + PA = −diag(1,0)` for `P = [[11/12,1/4],[1/4,1/12]]`, det `1/72`; only `P = 0`; `P = 1` solves | agrees | none |
| 5.4 Stein | `A = [1/2]`; nilpotent `2 × 2`, `Q = 1`; `A = [2]`; `A = [1]` | `P = 4Q/3`; `P = diag(1,2)`, `AᵀPA − P = −1`; `P = −Q/3`; `0 = −1`, series diverges | agrees | none |
| 5.5 stabilizability | `diag(−1,1)` with `e₁`, with `e₂`; `m` empty | rank 1 at `μ = 1`; rank 2 for `re μ ≥ 0`, `f = (0,−2)` gives `diag(−1,−1)`; Hurwitz iff `μ − A` invertible | agrees | none |
| Build guide, 1.5 and 1.6 | `*Needs:*` of 1.5 | lists 1.6; guide says build order | disagree | C01 |

- Source locators checked against the text: 35 into Sontag (all at the stated item and printed page; for example Theorem 13 at Sontag1998 line 8282, Lemma 3.3.7 at line 4164, Theorem 18 at line 10103, Exercise 5.1.12 at line 8356, Definition C.5.2 at line 20951) and 4 into Åström–Murray (Theorems 5.1, 7.1, 7.3, 8.1 at AstromMurray2020 lines 7504, 10944, 11468, 12800).
- Library declarations opened at the pins: 27 of Mathlib (for example `Matrix.charpoly_fromBlocks_zero₂₁`, `Mathlib/LinearAlgebra/Matrix/Charpoly/Basic.lean:193`; `Matrix.PosDef`, `Mathlib/LinearAlgebra/Matrix/PosDef.lean:176`; `Module.End.exists_isNilpotent_isSemisimple`, `Mathlib/LinearAlgebra/JordanChevalley.lean:77`) and 7 of Tau Ceti (`Matrix.rank_map`, `TauCeti/LinearAlgebra/Matrix/Rank.lean:157`; `ContinuousLinearMap.existsUnique_hasDerivAt_add`, `TauCeti/Analysis/ODE/Inhomogeneous.lean:34`; the five cited as existing). No declaration on controllability, Hurwitz matrices or the Lyapunov equation exists at either pin.
- Cross-roadmap citations resolved: IterativeMethodsForLinearSystems 1.2 and 4.1 at the head of its open pull request (both state what is cited; that roadmap says it does not depend on this one); OperatorTheory/SpectralSubspacePerturbation Part B on main.
- Dependency check: `depcheck: 200 roadmaps, 2195 edges, 0 problem(s)`; no UPWARD or CYCLE line. The supplier is an open pull request that adds a new roadmap folder.
- Elaboration: `Suggested.lean` elaborates in 26 s, `sorry` the only warning; 31 declarations, 9 definitions with real bodies, 22 theorems; no `set_option`, single `import Mathlib`.
- One-tactic probe: each of the 22 theorems tried with `rfl`, `simp` with all nine definitions unfolded, and `infer_instance`; none closes. Elaborated signatures compared with the README: `discreteState` does not carry `[DecidableEq n]`, which its statement does not need; nothing else differs.
- Headline theorems of the README (Kalman and Hautus criteria, pole shifting with Ackermann and uniqueness, steering and the Gramian, Lyapunov with the observable version, Stein): all stated in `Suggested.lean`; none forced through a stand-in.
- Automatic checks: all passed at this head.

Overlap check: read KalmanFiltering, IterativeMethodsForLinearSystems (no roadmap on main is close); the equivalence of `A ^ k → 0` with spectral radius below one and the Krylov spaces are owned by IterativeMethodsForLinearSystems (1.2, 4.1) and cited, not restated; KalmanFiltering excludes controllability, Gramians and stabilizability from its scope; nothing else shared.

Source independence: 44 passages compared with 2 sources (39 locators and 5 further passages: the definition of 1.1, the routes of 1.5, 3.3 and 5.2, the docstring of `exists_kalmanDecomposition`), none shared beyond a standard phrase of under ten words; largest share Sontag1998, 35 of 39 locators; contents compared with Sontag1998: independent (Layer 1 draws on its 3.2, 3.3 and 5.1, Layer 2 on Ch. 6, Layer 3 on 5.1, Layer 4 on 3.5, Layer 5 on C.5, 5.7 and 5.5; no run of chapters in order).

Research link: the README attributes its targets to Kalman (around 1960), Hautus (1969), Wonham (1967), Heymann (1968), Ackermann (1972) and Lyapunov (1892), and names linear-quadratic control, Riccati equations and the Kalman filter as users of these notions; Sontag (1998, Ch. 8) uses them for optimal control. Rests on the README and Sontag1998.

## Not verifiable

- The original papers of Kalman, Hautus, Wonham, Heymann, Ackermann and Lyapunov: attributed in prose without locators, not opened.
- The description's account of the author's own numerical checks beyond those recomputed above (the enumeration over `𝔽₅`, `N = 4` over `𝔽₂`, the Hautus test over `GF(2⁶)` and `GF(3²)`): not rerun.
- Ownership against board packages: the two packages under review on the board (AnalyticNumberTheory, LawrenceVenkateshMethod) are in other subjects and were not opened.

## Source issues

- none

## For the human reviewers

- **Scope.** The subject is classical linear control theory (1960–1972 results). 35 of the 39 locators are into one graduate textbook, Sontag (1998); eight cited items are exercises stated there without proof, as the README's References say.
- **Licence.** The Sontag PDF was read from `sontaglab.org`, which the sources service does not classify; it was treated as the author's own page. Åström–Murray was read from the authors' Caltech page.
