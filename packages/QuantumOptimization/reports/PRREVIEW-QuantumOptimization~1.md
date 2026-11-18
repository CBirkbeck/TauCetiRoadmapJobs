# Review of QuantumOptimization (pull request #2505 at ebff77f)

**Verdict:** needs changes

**Summary.** Changes are needed for one sentence only: the proof sketch of the hyperplane probability (2.2) misdescribes the separating event, and for `u = −v` what it says is false. Every stated theorem, formula and Check that was recomputed is correct, including the two statements that go beyond their sources (the adiabatic bound without the factors `m`, and the 3-regular guarantee with the exact constant). There are one small correction and three format notes, none blocking. Two questions of scope and one of licence are left for the human reviewers.

## R01 (P2) — For `u = −v` the event that the signs differ is the line without its origin, which is neither empty nor a half-line

The proof sketch of 2.2 (README lines 273–276) says "the two events are arcs of angle `2θ` and `θ`" and "If `u = ±v` the span is a line and the events are empty or a half-line." An implementer who follows the second sentence in the degenerate case gets probability `0` or `1/2` for the two-sided event at `u = −v`, against the Check directly below it, which correctly gives `1`.

Computed: for `u = −v` and `t = ⟪g, u⟫`, the two-sided event is `{t ≠ 0}` (probability `1 = arccos(−1)/π`) and the one-sided event is `{t < 0}` (probability `1/2`); for `u = v` both are empty. In the generic case the two-sided event is a pair of opposite arcs of angle `θ` each, not one arc of angle `2θ`; the one-sided event is a single arc of angle `θ`.

Smallest change: "the two-sided event is a pair of opposite arcs of angle `θ` and the one-sided event is one of them. If `u = v` both events are empty; if `u = −v` the span is a line, the two-sided event is the complement of the origin and the one-sided event is an open half-line."

## C01 — The boundary sentence on one-step methods says the opposite of what that roadmap states

In "Scope and ownership" (lines 811–813): "a roadmap on one-step methods for ordinary differential equations treats splitting schemes as integrators". The open roadmap OneStepMethodsForODEs lists "partitioned, splitting and composition methods" under "Out of scope" at its head, so no roadmap treats them and a reader looking for the neighbouring owner finds none.

The text that would be right: "OneStepMethodsForODEs (not on main) excludes splitting and composition methods; the two-matrix bound 5.2 is owned here."

## N01 — The first bullet of 4.2 identifies the band projection with a Riesz integral without naming the owner of Riesz idempotents

BanachAlgebras 2.1 on main owns Riesz projections of a separated part of the spectrum in a Banach algebra. The bullet here is the comparison for Hermitian matrices, not a second construction; a line in the list of boundaries saying so would let a reader place it.

## N02 — "deleting one of its ends gains at most `B`" in 1.4 (line 177) has the direction unclear

Deleting an end of an internal edge raises the energy by exactly `B` and lowers it by at least `A`. Would "and deleting one of its ends loses only `B`" be meant?

## N03 — `Suggested.lean` states more than the headline theorems

Of its 32 theorems, the summary names about eight as headlines; the rest include elementary identities and bounds (`qubo_eq_ising`, `ising_eq_qubo`, `ising_ancilla`, `cutWeight_eq_ising`, `qaoaMean_le_sup'`, `exists_qaoaMean_eq_of_le`). None closes in one tactic, so none is padding in the strict sense; they could stay as they are or live in the README only.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.1 `qubo_eq_ising`, `ising_eq_qubo` | `Q = (q)`; general expansion with `b = (1−s)/2` | `x=true`: `q/4+q/2+q/4 = q`; `x=false`: `q/4−q/2+q/4 = 0`; inverse: `Q = 4J − diag(2(Σ(J+Jᵀ)+h))`, `c = ΣJ+Σh` | holds | none |
| 1.2 `ising_ancilla` | one point, `J = 0`; general | `2·(h/2)·s₀s₁ = h·spin(x)`; `t_i t_j = s_i s_j` since `s₀² = 1` | holds | none |
| 1.3 `cutWeight_eq_ising`, `qubo_eq_neg_cutWeight` | triangle; `Q = (1)`; 100 random `Q`, `n ≤ 4`, all `y` | triangle: `6/4 + 1/2 = 2`; `Q=(1)`: cut `−1`, qubo `1`; random: max error `4·10⁻¹⁶` | holds | none |
| 1.3 Check on `Function.HasMaxCutPropertyAt` | `w > 0`, `w = 0` | `w>0`: minimum `−w` only at the two mixed pairs; `w=0`: `f ≡ 0`, uniqueness clause fails | holds | none |
| 1.4 independent set, exact cover | 200 random graphs `n ≤ 6`, `0<B<A`; the four exact-cover Checks; `A = B` edge | minimizers = maximum independent sets in all 200; energies `(1,2)`, `(4,6)`, `(3,6)`, `(5/2,3)`; edge at `A=B=1`: `−1 = −1` | holds; `B < A` strict needed | none |
| 1.5 Quadratization | all 8 bit triples; `c=1, M=1/2`; `M=1` | `p = 0,3,0,1,0,1,1,0`; conditions reduce to `M ≥ c`, `M ≥ 0`, `M ≥ −c`; `M=1/2`: min `1/2 ≠ 1` | holds, threshold `M ≥ |c|` exact | none |
| 2.1 `gwConstant_eq`, `gwConstant_mem_Ioo`, `gwConstant_mul_le_arccos` | bisection for `tan(θ/2) = θ`; grid of 200001 points; `t = −2` | `θ₀ = 2.331122`, `α = 0.878567`; values `1` at `π/2` and `π`; at `t=−2` left `1.32 >` right `1` | holds; `−1 ≤ t` needed | none |
| 2.2 The hyperplane probability | `u = v`, `u = −v`, orthogonal, `u = 0`, norm 2 at `π/3` | `0`, `1` (one-sided `1/2`), `1/2` (`1/4`); `u=0`: `1` vs `1/2`; norm 2: `1/3` vs `arccos 2 = 0` | statement holds; sketch wrong at `u = −v` | R01 |
| 2.3 The relaxation and the rounding guarantee | pentagon; `w₁₂ = −1`, `u₁ = −u₂`; `i = j` term | `4.52254`, rounded `4`, ratio `0.88446 ≥ 0.87857`; negative weight: `−0.439 ≤ −0.5` false; `arccos 1 = 0` matches probability `0` | holds for `w ≥ 0` | none |
| 3.2 The transverse-field mixer | `n = 0, 1, 2`; character vectors | `X_i χ_S = ±χ_S`, eigenvalue `n − 2|S|`; `n=0`: charpoly `X`; `n=2`: `2,0,0,−2`; entry formula = product of `cos β − i sin β·X` | holds | none |
| 3.3 The top eigenvalue along the interpolation | one qubit `C=(0,c)`; `s=1`, `C=0`; `n=0` | eigenvalues `(sc ± √(s²c²+4(1−s)²))/2`; `s=1`: `0,0` not simple; Rayleigh: `s·max C ≤ r ≤ (1−s)n + s⟨C⟩` | holds for `0 ≤ s < 1` | none |
| 4.1 The Schrödinger propagator | `H₁=1, H₂=0`; `H=(i)` | `W' = iT U₁*(H₁−H₂)U₂`; `2|sin(s/2)| ≤ s`; `H=(i)`: `U = exp(Ts)` not unitary | holds | none |
| 4.2 `norm_deriv_bandProj_le`, `contDiffAt_bandProj` | rotating field; `diag(0,1,3)`; band empty, `a = b`, `a > b` | `‖P'‖ = π/4 = (π/2)/2`; gaps `1`, `2`, `0`; empty band: `P = 0` near `s`, `0 ≤ x/0 = 0` | holds | none |
| 4.3 The intertwining evolution | rotating line; constant `P`, rotating `A` | `(PΓ)' = (AP + P'P)Γ = (A + P'P − PP')PΓ` using `PP'P = 0`; `P'P − PP' = [[0,−1],[1,0]]` | holds | none |
| 4.4 `norm_adiabatic_sub_bandProj_le` | rotating field; `T = 0`; constant `H`; full or empty band; rederivation from JRS06 eq. (11) with the blockwise Sylvester bound | left `(π/4)|sin Ω|/Ω`, bound `3.5612/T`; `T=0`: `1/√2` vs `0`; terms `‖H'‖/g²`, `‖H''‖/g² + 6‖H'‖²/g³`, `‖H'‖²/g³` | holds without the factors `m` | none |
| 5.1 Alternating states and their expectations | one qubit `C=(0,1)` at `(0.9, 0.35)`; depth 0 | simulated `0.752317` = `(1 + sin 0.7 sin 0.9)/2`; reversed order `1/2`; list order `L₂·L₁` applied to the plus state | holds | none |
| 5.2 The product formula | commuting; `A=X`, `B=Z` | second-order term `(t²/2)[A,B]`, norm `t²` = right side `t²`; `t<0` by `A,B ↦ −A,−B` | holds, constant sharp | none |
| 5.3 `exists_lt_qaoaMean` | route: `n=0`; band edges; step errors | `plusState` spans the `−n` eigenspace of `−mixer`; freezing error `O(T/N)`, splitting error `O(T²/N)`; `n(1−s₁)/s₁ < ε/3` | route sound | none |
| 5.4 Locality for cuts | depth 1 path; depth 2 on a 7-path; depth 3 on a 9-path | depth 1: `0.784114` unchanged, `0.755160` with `u w`; depth 2: `0.376429` unchanged, `0.375853` at distance 1; depth 3: `0.515330` unchanged, `0.513812` at distance 2 | holds, radius `< p` exact | none |
| 5.5 Depth one: the closed form | 40 random graphs `n ≤ 7`, random angles; single edge; `C₅`, `K₃,₃`, matching | max error `4·10⁻¹⁶`; edge: `1` at `(π/2, π/8)`, `0` at `−γ`; grid maxima `3.7496`, `6.2286`, `1.9994` vs `3.75`, `6.2321`, `2` | holds | none |
| 5.6 Depth one on 3-regular graphs | `K₄`, `K₃,₃`, cube, prism, two joined diamonds | edge values `c`, `c−1/18`, `c−1/9`; `3.48803 ≥ 2.76980`; `6.23205 = 6.23205`; `8.30940 = 8.30940`; `5.89872 ≥ 4.84715`; `7.64273 ≥ 6.92450` | holds, equality on bipartite triangle-free | none |
| Headline: qubo as minus a cut on `n+1` vertices | as 1.3 | as 1.3 | holds | none |
| Headline: Goemans–Williamson bound | as 2.1, 2.3 | as 2.1, 2.3 | holds | none |

- Source locators checked against the text: 31 (Luc13 8, Williamson–Shmoys web edition 6, JRS06 8, FGG14 5, WHJ+17 2, CST+19 2); all agree with the README.
- Library declarations opened at the pins: 38 (every Mathlib and Tau Ceti name in the supplier contracts), for example `TauCeti/Analysis/ODE/DysonSeries.lean` lines 165–291, `TauCeti/LinearAlgebra/Matrix/PerronFrobenius/Irreducible.lean` lines 126–157, `TauCeti/Analysis/InnerProductSpace/UnitarilyInvariantSeminorm/Sylvester/Basic.lean` lines 215 and 240, `Mathlib/Combinatorics/Optimization/ValuedCSP.lean` line 78, `Mathlib/Combinatorics/SimpleGraph/Clique.lean` line 1065; all exist with the stated content.
- Cross-roadmap citations resolved: 7 (GraphConnectivityAndFlows 1.2, 3, 4; SpectralSubspacePerturbation Parts B and C; UnboundedOperators 5.5; VariationalMethods 4.4; OperatorAlgebraDynamics D9; TemperleyLiebOperatorAlgebras 1.7; OneStepMethodsForODEs); six agree, one is C01.
- Dependency check: `depcheck: 211 roadmaps, 2260 edges, 0 problem(s)`; no supplier roadmap is named.
- Elaboration of `TauCetiRoadmap/QuantumOptimization/Suggested.lean`: 32 `sorry` warnings and nothing else; no `set_option`, no sorried data, imports `Mathlib` and one Tau Ceti module.
- One-tactic probe (`rfl`, `simp`, `infer_instance`) on all 32 theorems: none closes. Elaborated types compared with the README statements for all 53 declarations: the binders that definitions drop (`Fintype`, `DecidableEq`, the measurable structure) are ones their bodies do not use; no theorem loses a hypothesis.
- Headline theorems of the summary are all stated in `Suggested.lean`; none is declared not statable.
- The pull request's title and description agree with the head (32 theorems, 21 definitions, one Tau Ceti import, no supplier roadmap).

Overlap check: read ExactPenalties, KernelsAndSpectralMethods, OperatorMonotoneFunctionsAndMatrixMeans (open), ConvexLifting, MathematicalStatisticsHighDimensional (main); nothing shared. Searches by object (Goemans–Williamson rounding, quadratic pseudo-Boolean and Ising forms, adiabatic theorem, alternating states, product formula with a rate, Pauli operators on configurations) over main and the open roadmap pull requests found no other owner; no declaration name of `Suggested.lean` occurs in another roadmap's Lean file.

Source independence: 14 passages compared with 6 sources, none shared beyond formulas; largest share Luc13, 7 of 24 locators; contents compared with Luc13 (ten sections): independent, the five problems of 1.4 are a selection inside one subsection and in a different order.

Research link: Layer 5 states results of Farhi–Goldstone–Gutmann (2014) and Wang–Hadfield–Jiang–Rieffel (2018); Layer 4 sharpens Jansen–Ruskai–Seiler (2007, Theorem 3); Layer 2 is Goemans–Williamson (1995); 5.2 is Childs–Su–Tran–Wiebe–Zhu (2021, Proposition 15). Rests on the README's references and the five texts read.

## Not verifiable

- Goemans and Williamson 1995, cited in 2.1 for the constant defined as a minimum: the publisher's page refuses access and no open copy was found.
- Kato 1950, cited in 4.3 through Jansen–Ruskai–Seiler: the publisher's page refuses access; the attribution was read in JRS06 line 192 only.
- Rosenberg 1975, cited in 1.5 for the substitution: no online copy found; the step itself was recomputed on all eight bit triples.
- The four public Lean repositories named under "Existing formalizations" were not opened, so `Suggested.lean` was not compared with them.

## Source issues

- **Misprint** in JRS06 at Theorem 4, printed page 5: the source says its hypotheses are those of Theorem 4 itself; it should be those of Theorem 3; affects nothing.
- **Error** in WHJ+17 at Theorem 1, equation (14), journal version: the source says, by its own closing correction note, that the first trigonometric term lacked a factor 2; it should be the coefficient `1/4` on `sin 4β sin γ (cos^d γ + cos^e γ)`; affects a stated result; corrected in print at arXiv version 2, which the README cites.

## For the human reviewers

- **Scope.** The main source of Layer 5, Farhi–Goldstone–Gutmann (FGG14), is an arXiv preprint; the README's reference gives no journal. Wang et al. (Phys. Rev. A 2018) and Childs et al. (Phys. Rev. X 2021) build on it.
- **Scope.** Two headline statements are stronger than any cited source and are marked "proved here": the adiabatic bound without the factors `m` (4.4) and the exact constant `1/2 + 1/(3√3)` on all 3-regular graphs (5.6). This review rederived both.
- **Licence.** The README (lines 825–838) names four public Lean repositories as reference material, one sharing this folder's name (urikol/QuantumOptimization, Apache-2.0). They were not opened, so adaptation of `Suggested.lean` from them was not tested.
