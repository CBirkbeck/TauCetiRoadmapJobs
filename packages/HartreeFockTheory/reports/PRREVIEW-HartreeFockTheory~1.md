# Review of HartreeFockTheory (pull request #3042 at ef64bcc)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every statement of both layers was recomputed (by hand and, for the many-body statements, numerically from the Lean definitions read literally) and every source locator was read at its place; the four cited open texts support what is attributed to them. There are two small corrections (one sentence of the Conventions that needs a Hermiticity hypothesis, and page numbers of one source that are file pages rather than printed pages) and three format notes, none blocking. Two points are left for the human reviewers: several classical results are attributed by name with no text read, and the external Lean developments the README names were not opened in this review.

## C01 — "For a Hermitian `γ` the two traces are real" holds only when `T` and `V` are Hermitian as well

In the bullet on the functional in the Conventions (README line 80) the sentence stands with no hypothesis on `T` and `V`, while the same bullet goes on to speak of statements "without Hermiticity hypotheses", so a reader takes `T`, `V` to be arbitrary there. For `T = [[0, 1], [−1, 0]]` and the Hermitian `γ = ½[[1, i], [−i, 1]]` one gets `tr(Tγ) = γ₁₀ − γ₀₁ = −i`; this is the matrix `T` of the third Check of 1.2, which itself uses that `tr(Tγ)` is purely imaginary. With `T`, `V`, `γ` all Hermitian both traces are real (`(1 − Ex)(γ ⊗ₖ γ)` is Hermitian because `Ex` commutes with `γ ⊗ₖ γ`), and no exchange symmetry is needed.

The smallest change: "For Hermitian `T`, `V` and `γ` the two traces are real". No stated result uses the sentence.

## C02 — The page numbers given for Bach's survey are pages of the arXiv file, one more than the printed page numbers

A reader who opens arXiv:2209.10189v1 at the printed page finds the neighbouring page. The running head of the file's twelfth page reads 11, and so on throughout: Lemma 1 with (II.25)–(II.27) is on printed p. 11 (cited p. 12, in 2.2 and 2.4), Lemma 2 with (III.1)–(III.2) on p. 13 (cited p. 14), Theorem 3 with (III.6) on p. 14 and the descent proof on pp. 14–15 (cited p. 15 and pp. 15–16, in 1.3), Theorem 5 on p. 25 and the remark on Lieb's paper on p. 24 (cited p. 26 and p. 25, in 2.3). The theorem and equation numbers are all right. Either lower each page by one or say once that pages are those of the arXiv file. The pages given for the other three sources agree with their printed numbers.

## N01 — The code span `(Equiv.prodComm ι ι).permMatrix ℂ` does not elaborate

In the Conventions (line 75): `Equiv.prodComm ι ι` has type `ι × ι ≃ ι × ι`, on which dot notation finds no `Equiv.permMatrix`; `Equiv.Perm.permMatrix ℂ (Equiv.prodComm ι ι)` elaborates at the pin.

## N02 — The `*Needs:*` line of 2.5 covers two statements with different needs and omits 1.2

Brillouin's theorem needs 2.4 only; its clause "in particular at every local minimiser of 1.2" needs 1.2, which the line (and the Dependencies paragraph of Layer 2) does not list; 1.3, 2.1, 2.2 and the spectral theorem are needed by Lieb's inequality alone. Splitting the line by statement would keep an implementer of Brillouin's theorem from waiting on 1.3.

## N03 — "(no open copy read)" in the References describes the drafting, not the mathematics

"Attributed without locators" says what a reader needs; the parenthesis could go.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.0 `direct`, `exchangeTerm`, `fockOperator`, `hfEnergy`, partial-trace and index forms | `V = Pₐ`, `n = 3`, `T = diag(0,0,1)`; `V = −Pₐ`, `n = 2`, `γ = ½` | `J − K = (tr γ)·1 − γ`; `F(e₀e₀*) = diag(0,1,2)`, `F(e₀e₀*+e₁e₁*) = diag(1,1,3)`; `E(½) = −0.25`; index renaming gives the three forms | agree with README Checks | none |
| 1.0 `pairInteraction`, `Q(xx*, yy*)` | `e₀, e₁` with `Pₐ` and `−Pₐ` | `W = 1` and `W = −1`; `Q(xx*,xx*) = ⟨xx|V|xx⟩ − ⟨xx|V|xx⟩ = 0` | ok | none |
| 1.0 "the two traces are real" | `T = [[0,1],[−1,0]]`, `γ = ½[[1,i],[−i,1]]` | `tr(Tγ) = −i` | false without Hermitian `T`, `V` | C01 |
| 1.1 `hfEnergy_sub_add_vecMulVec` | random Gaussian-integer `T, γ, x, y`, `n = 2, 3` | exchange-symmetric `V`: 17.5 = 17.5, −164.5 = −164.5; not symmetric: 365.5 vs 552.0 | holds; hypothesis needed | none |
| 1.1 expansion, negative control | `n = 2`, `V(0,1)(0,1) = 1` only | lhs 0.5, rhs 0; after adding `V(1,0)(1,0) = 1`: 1 = 1 | as the Check says | none |
| 1.2 `commute_fockOperator_iff` | `γ = 0`; `δ = c·yx* + c̄·xy*` | `γ = 0` forces `δ = 0`, both sides true; `tr(Fδ) = 2 re(c⟨x,Fy⟩)` for Hermitian `F` | ok | none |
| 1.2 `commute_fockOperator_of_isLocalMinOn` | rotation curve; `T = [[0,1],[−1,0]]`, `V = 0` | `γ_t − γ = sc(c·yx*+c̄·xy*) + s²(yy*−xx*)`, `f′(0) = 2 re(c⟨x,Fy⟩)`; control: `E ≡ 0`, `[T, e₀e₀*] ≠ 0` | ok; Hermitian `T` needed | none |
| 1.3 `exists_isRankProjection_hfEnergy_le` | `N = 0`; `N > n`; `n = 1`; `V = −Pₐ`, `γ = ½` | `γ = 0 = P`; no admissible `γ`; `γ = N ∈ {0,1}`; control `E(½) = −0.25 < 0 = E(P)` | ok; hypothesis needed | none |
| 1.3 `isRankProjection_of_isMinOn` | `g(s) = bs − Ws²`, `W > 0`; `V = 0`, `T = 0` | `g(0) = 0 >` convex combination of `g(a), g(b) ≥ 0`: contradiction; control: `½·1` minimises | ok | none |
| 1.4 `pairInteraction_le_of_isMinOn` | `V = −Pₐ`, `T = diag(0,1)`, `N = 1` | `F(e₀e₀*) = 0`, `W = −1`: `0 − 1 ≤ 0`; `E(e₁e₁*) − E(e₀e₀*) = 1` | ok | none |
| 1.4 `no_unfilled_shells` | `V = Pₐ`, `n = 3`, `N = 2`; `N = 0`, `N = n`; `v = 0` | `E(P) = tr(TP) + 1`, minimiser `span(e₀,e₁)`, `F = diag(1,1,3)`; no unit `x` resp. `y`; trivially true | ok | none |
| 2.0 `slater`, `antisymmSubmodule`, `manyBodyHamiltonian`, `oneRDM` | `N = 0`; `N > n`; product state `e₀⊗e₀` | `slater = 1`; all determinants 0; `oneRDM = 2·e₀e₀*` (so antisymmetry is needed) | ok | none |
| 2.1 `inner_slater` | `(n,N) = (3,2),(4,2),(4,3),(3,1),(1,1),(2,3),(3,0)`, non-orthonormal | −143−29i both sides; 162−226i; −5724−3504i; 10+18i; −6−3i; 0; 1 | holds | none |
| 2.1 `span_slater…`, `exists_linearEquiv_exteriorPower` | expansion at injective and repeated `y`; `N = 0`, `N > n` | each `x = y∘σ` contributes `ψ(y)/N!`; dimension `C(n,N)`: 1 and 0 | ok | none |
| 2.2 `isAdmissible_oneRDM` | random antisymmetric `ψ`, `(4,2)`; `N = 0`; `N > n` | `tr γ / ‖ψ‖² = 2.0`; largest Rayleigh quotient over 2000 vectors 0.93 ≤ 1; `γ = 0`; no state (trace 0 ≠ 1) | ok | none |
| 2.2 `oneRDM_slater` | `(3,2),(4,2),(4,3),(5,3),(3,1),(3,0)` | entrywise equal to `∑ φᵢφᵢ*` | holds | none |
| 2.3 Coleman iff, extreme points | `N = 0`; `N > n`; `ι` empty; Rado input | `ρ = [1]`, `γ = 0`; both sides false; `{0} = {0}`; prefix sums of sorted `λ` ≤ `min(k,N)` | ok | none |
| 2.4 `slater_energy` | random `T`, `V` with no symmetry, six `(n,N)` | complex identity, e.g. −3.0176−3.6122i both sides for `(3,2)` | holds | none |
| 2.4 `slaterCondon_single`, `_double`, `_of_three_le` | every `i`, every ordered `i ≠ j`, `a, b` not mutually orthogonal; `(6,3)` | exchange-symmetric `V`: equal in all 11 single and 16 double cases; without: single fails (also `N = 1`); triple: 1e−15 | holds; hypothesis needed | none |
| 2.5 `brillouin` | `Fγ − γF = (1−γ)Fγ − γF(1−γ)` | singles are `⟨φᵢ, Fa⟩`, `a ∈ ker γ`; vanish iff `γF(1−γ) = 0` | ok | N02 |
| 2.6 `thouless` | `(3,2),(4,2),(4,3),(5,3),(3,1)`; `N = 0` | `c = det M`, `(1−γ)Xγ = X`, `slater ψ = c·slater(φ+Xφ)`, `X² = 0` all exact to 1e−8; `X = 0` | holds | none |

- Source locators checked against the text: 21, in four texts (Bach 2022; Bach–Lieb–Loss–Solovej 1993; Bach–Lieb–Solovej 1993; Cancès–Le Bris 2000), all supporting the statements; 7 page numbers of the first are file pages (C02).
- Library declarations opened at the pin: 34 (Mathlib 20, Tau Ceti 14), among them `Matrix.det_mul_eq_sum_prod_mul_det_submatrix` (`TauCeti/LinearAlgebra/Matrix/Divisibility.lean:183`), `TauCeti.mem_convexHull_range_comp_perm_iff` (`TauCeti/Analysis/Convex/PermutationOrbit.lean`), `Matrix.partialTraceRight_apply` (`TauCeti/LinearAlgebra/Matrix/Trace/Partial.lean:55`), `exteriorPower.finrank_eq`, `OrthonormalBasis.exteriorPower` (real spaces only, as the README says); all exist with the stated content.
- Cross-roadmap citations resolved on main: 5 (QuantumFoundations §6.2 and §6.4, OperatorAlgebraDynamics D8, OperatorTheory/Majorization MAJ-A27, OperatorTheory/PrincipalAngles Part A).
- Elaboration: `Suggested.lean` elaborates with `sorry` as the only warning (20 theorems). The elaborated types were compared with the README statements: the 14 definitions that lose `[DecidableEq ι]` or `[Fintype ι]` do not use them; no hypothesis is lost.
- One-tactic probe (`rfl`, `simp`, `simp` with the definitions unfolded, `infer_instance`, `aesop`) on a copy of the file: no theorem closes.
- Dependency check: `depcheck: 132 roadmaps, 1464 edges, 0 problem(s)`; no UPWARD or CYCLE line. Automatic checks: all passed. No file outside the folder is changed.
- Headline theorems (Hartree–Fock equations, Lieb's principle in both parts, no unfilled shells, Coleman's theorem with the extreme points) are all stated in `Suggested.lean`; the docstring's claim that all are statable is right.
- Duplication by object: no Slater determinant, Hartree–Fock functional, one-particle density matrix or Coleman theorem in the pinned Mathlib or Tau Ceti, on main or in an open roadmap.

Overlap check: read RelativisticQuantumFieldTheory, TraceInequalitiesAndQuantumEntropy, Majorization; nothing shared (Ky Fan's inequality is Majorization's and is cited as MAJ-A27).

Source independence: 11 passages compared with 4 sources, none shared; largest share Bach 2022, 4 of 11 citation sites; contents compared with Bach 2022 (Coulomb systems, Fock space and reduced density matrices, Lieb's principle, representability, quasifree states): independent, the roadmap places the functional before the many-body space.

Research link: Lieb's variational principle (Lieb 1981) and the closed-shell theorem (Bach, Lieb, Loss and Solovej 1994) are stated in the finite-dimensional setting of Bach, Lieb and Solovej 1994; the critical-point lemma is that of Cancès and Le Bris 2000 on SCF convergence. Rests on the README's sources, read here.

## Not verifiable

- Lieb, Phys. Rev. Lett. 46 (1981), and Coleman, Rev. Mod. Phys. 35 (1963): paywalled, not read; the README gives no locator into either and attributes them through Bach 2022, which was read.
- The attributions to Koopmans, Slater and Condon, Brillouin, and Thouless: by name only, no text cited, none looked for; the statements themselves were recomputed.
- The README's description of the external Lean developments (LeanPool, LiebThirring, FQChem, PhysLean): not opened.

## Source issues

- **Misprint** in Bach 2022 (arXiv:2209.10189v1) at eq. (II.24), printed p. 11: the source says the two-particle density matrix is the trace against two creators and the annihilator of `g₂` twice; it should be the annihilators of `g₂` and `g₁`; affects nothing.
- **Misprint** in Bach–Lieb–Loss–Solovej (arXiv:cond-mat/9307066v1) at the definition of `h_k`, p. 4: the source says the one-body term is the kinetic energy minus `U`; it should be plus `U`, as in the Hamiltonian on p. 2; affects nothing.

## For the human reviewers

- **Scope.** Subject is mathematical physics (`math.MP`); the located sources are refereed (Phys. Rev. Lett., J. Stat. Phys., M2AN) plus one arXiv survey. 2.1, 2.4, 2.5 and 2.6 carry attributions by name and "proved here", with no source locator.
- **Licence.** README (Scope and ownership) names LeanPool, LiebThirring, FQChem and PhysLean as having Slater determinants and says nothing is taken from them; this review did not open those repositories.
