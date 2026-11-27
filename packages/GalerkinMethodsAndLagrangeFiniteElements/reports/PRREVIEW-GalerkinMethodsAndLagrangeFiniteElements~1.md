# Review of GalerkinMethodsAndLagrangeFiniteElements (pull request #3234 at 6e7cadb)

**Verdict:** needs changes

**Summary.** Changes are needed for one finding: the README states the converse of Fortin's criterion (1.2) for arbitrary subspaces, where it is false; the Lean statement has the missing finite-dimensionality. Every other statement survived the degenerate-case pass, all numerical Checks were recomputed and agree, and every Ern–Guermond locator was read at its theorem number. There are four small corrections and two format notes, none blocking. Left for a human: the licence of the author's earlier formalisation, and the four paywalled books whose locators could not be read.

## R01 (P2) — The converse of Fortin's criterion in 1.2 is false for the arbitrary subspaces the README states it for; it needs `X` and `Y` finite-dimensional

A reader takes the bullet (README line 143) at the generality of the section's opening line, "for subspaces `X ⊆ V` and `Y ⊆ W`": the neighbouring bullets say "finite-dimensional" when they need it (discrete well-posedness, Xu–Zikatanov) and Fortin's criterion and Babuška's bound do hold for arbitrary subspaces. The proof route also uses the hypothesis silently ("is onto by the inf-sup condition").

Counterexample: `V = X = ℝ`, `H = ℓ²`, `Y` the finitely supported sequences, `h ∈ ℓ² \ Y`, `A v w = v ⟪h, w⟫`. Then `‖A‖ = ‖h‖`, and since `Y` is dense `‖(A v)|_Y‖ = |v| ‖h‖`, so the discrete inf-sup condition holds with `α = ‖h‖ = ‖A‖`. A Fortin operator with `(α/‖A‖) ‖P w‖ ≤ ‖w‖` is a linear idempotent of norm at most 1, hence the orthogonal projection onto a closed subspace `R ⊆ Y`; the Fortin identity `⟪h, P w − w⟫ = 0` for all `w` gives `h ⊥ R^⊥`, so `h ∈ R ⊆ Y`, a contradiction. `exists_fortin_of_infSup` in `Suggested.lean` (line 153) carries `[FiniteDimensional ℝ X] [FiniteDimensional ℝ Y]` and is true (the constant `α` on the orthogonal complement of the kernel of the transpose: checked).

Smallest change: begin the bullet "for `X` and `Y` finite-dimensional, if the test space `H` is an inner product space …". The counterexample would serve as a negative-control Check.

## C01 — Two Lean statements carry a hypothesis the README does not state, and both hold without it

`norm_sub_le_of_infSup_of_hilbert` (Lean line 176) assumes `[CompleteSpace H]`, while the README's Xu–Zikatanov bullet says "inner product space"; `norm_sub_le_strang_energy` (Lean line 212) assumes `[FiniteDimensional ℝ Xh]`, while the README's bullet (line 215) has no such condition. Both README statements are true as written (extend the Galerkin projector to the completion, where `‖I − P‖ = ‖P‖`; for the energy lemma project onto the closure of `Xh` in the completion: `‖u − u_h‖² = d² + s²` with `d` the distance and `s` the norm of the restricted functional). Either drop the two instance hypotheses from the Lean or name them in the README, so that prose and signature have one generality.

## C02 — The Check of 6.2 labelled "negative control" for `s = 0` exhibits no failure: the rate bound holds at `s = 0`

At `s = 0` the bound of `exists_galerkin_rate` reads `‖∇(u − u_h)‖ ≤ C |w|_{1,2}`, which is Céa with `v = 0` (`C = Λ/λ`). So `hs : 1 ≤ s` excludes a true, trivial case, and the Check (README line 587) does not show what a wrong statement would get wrong. Either call it a remark ("at `s = 0` the bound is Céa's with no power of `h`"), or replace it by a control that fails, for instance `s = k + 1`: for `k = 1`, `u = sin πx` the measured rate stays `h¹` (ratios `2.00`), not `h²`.

## C03 — The PDE supplier contract omits §1.6, which the converse in 4.2 uses

The proof route of the converse boundary statement (README line 426) takes the trace from a cell from PDE §1.6, and the pull request's description lists that section among the suppliers, but neither the `*Needs:*` line of 4.2 nor "From PDE" under the supplier contracts names it. Add "§1.6: the trace on a Lipschitz domain (4.2)" in both places. (PDE §1.6 exists on main under that number.)

## C04 — "The residual of the polynomial approximation item beyond cells" refers to nothing in the text

In "Beyond this roadmap" (README line 691) the parenthesis points at an "item" that no section of the README defines, so a reader cannot tell what is being left out. Say it directly: "approximation by polynomials in `W^{k,∞}` on a Lipschitz domain that is not convex".

## N01 — `LatticeIndex` is declared in `Suggested.lean` (line 410) but not named in the README, which writes the index set out as `Finset.Nat.antidiagonalTuple (d + 1) k`; name it once in the Conventions bullet on Lagrange nodes.

## N02 — The last section comment of `Suggested.lean` (line 714) heads a block of 35 `#check` lines and no declaration; fold the pins into the module docstring's supplier list or drop the heading.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 `bijective_iff_infSup` | `V=W=0`; `ℝ`, `A v w=2vw`; right shift on `ℓ²`; symplectic form on `ℝ²` | trivial case both sides true; `α=2`, `u=ℓ/2`; shift: `α=1`, adjoint kernel `span e₀`; `B v v=0`, `B` bijective | true; both conditions needed | none |
| 1.1 `infSup_of_coercive`, `norm_le_of_infSup` | `v=0`; `α>0` | `0 ≤ ‖B 0‖`; `α‖v‖² ≤ ‖Bv‖‖v‖` | proved in file | none |
| 1.2 `bijective_restrict_iff` | `X=Y=⊥`; `X=span e₁`,`Y=span e₂`; `X=span e₁`,`Y=ℝ²` | both sides true; ranks 1=1 but `A v w=0`; constant 1, ranks 1≠2 | true | none |
| 1.2 `infSup_restrict_of_fortin` | `γ≤0`; `X=span e₁`, `Y=span(e₁+e₂)`, `P w=w₁(e₁+e₂)` | left side `≤0`; `‖P‖=√2`, `γα=1/√2` = exact constant `|v₁|/√2` | true, no linearity used | none |
| 1.2 `exists_fortin_of_infSup` | `X=⊥`; `‖A‖=0`; `Y` dense in `ℓ²` (README form) | `P=0`; `α/0=0`; README form: `h∈R⊆Y` contradiction | Lean true; README false without finite dimension | R01 |
| 1.3 `norm_sub_le_of_infSup` | `v∈X` arbitrary | `α‖u_h−v‖ ≤ ‖A‖‖u−v‖` | true | none |
| 1.3 `norm_sub_le_of_infSup_of_hilbert` | `X=⊥`, `α=2‖A‖`; `X=H`; projector along `e₁+te₂`, `t=1` | `‖u‖≤‖u‖/2` false, excluded by `X≠⊥`; `u=u_h`; `‖P‖=‖I−P‖=√2=1.4142` vs `2.4142` | true | C01 |
| 1.3 `norm_sub_le_of_coercive`, `_of_symm` | `-u''=π² sin πx`, `P₁`; `A=diag(1,4)` | Galerkin = nodal interpolant; constants `4` and `√4=2` | true | none |
| 1.4 `norm_sub_le_strang_first`, `_second` | `Ah=A` conforming | consistency term `0`, factor `1+‖A‖/α` (Babuška) | true | none |
| 1.4 `norm_sub_le_strang_energy` | `Xh=span e₁`, `u=(1,1)`, `u_h=(2,0)` | left `√2=1.4142`, right `1+1=2` | true | C01 |
| 1.4 `norm_le_of_dualApproximation` | `J=diag(0,1)`, `X=span e₂`, `e=e₁`, `e=e₂` | `δ=0`: `Je₁=0`; `‖Je₂‖=1` with orthogonality violated | true | none |
| 2.1 cells | `d=0`; `[0,h]`; equilateral side 1; reference triangle | interior empty vs point; `ρ=h`, ratio 1; `ρ=0.5774`, ratio `1.7321`; `ρ=2−√2=0.5858`, ratio `2.4142` | true; `[NeZero d]` where needed | none |
| 2.2 `SimplicialMesh`, `card_cells_meeting_le`, `exists_cellDiam_le_of_meet` | same vertex set reordered; `d=1` cells `[0,1]`,`[1,1+ε]`; vertex-pinched triangles; edge `ℓ` vs inradius `r` | excluded by disjoint interiors; ratio `1/ε` (needs `d≥2`); ratio `1/ε` (needs stars); `r ≤ d|K|/|F| ≤ ℓ`, `κ=(2σ)^N` | true | none |
| 3.1 `isUnisolvent_iff` | `P₂`/2 points; `P₁`/3 points; 6 points on `x²+y²−x−y=0`; `P` infinite-dimensional | `2≠3`; `3≠2`; quadratic vanishes at all six; injectivity impossible | true | none |
| 3.2 Lagrange element | `k=0`; `d=0`; triangle `k=1,2,3`; node count `d≤3`,`k≤4`; translation at `k=0` | one node at origin, constants; one node `v₀`; determinants `1`, `1/64`, `64/387420489=1.652·10⁻⁷`; `C(k+d,d)` all equal; `A0≠0` | true | none |
| 4.1 `bijective_eval_globalNodes` | `d=1`, `n` cells; two triangles; `k=0`; empty mesh; `d=0` repeated cell | `n+1`, `2n+1`; `4`, `9`; one node outside domain; `{0}` vs empty; points as a set | true | none |
| 4.2 conformity, `W1p0`, additivity | hat at `1/2`; 0/1 on two triangles; `d=0` repeated point; frontier of `int D` | `‖∇v‖=√4=2`; jump 1; sum counts mass twice; `∂(int D) ⊆ ∂D` | true (Lipschitz on segments, no conformity needed) | C03 |
| 5.1 interpolation error | `sin πx`, `n=8..64`; `log log(1/r)`; `x²`, `k=1`, `r=3`; `x²` on two cells; `r=0` | max error `0.018846, 0.0047921, 0.0012031, 0.00030109` < `0.019277,…`; unbounded; `h²/4` vs `0`; slope jump `1`; `d<0` false | true | none |
| 5.2 `exists_scottZhang` | `d=1`; pinched triangles `u=0/1`; two cells sharing a facet; `s=0` | nodal interpolation; right side `0`, left `>0`; union star-shaped about a ball at the facet centre; `W^{1,p}` stability | true with connected stars | none |
| 5.3 inverse and trace | `P₁`,`P₂` on `[0,h]`; trace `k=1,2`; hat between cells `ε`,`h`; `l>k` | `√12/h`, `√60/h`; `(k+1)²/h`: `2`, `3`; ratio `√(3/(εh))`; `0 ≤ …` | true | none |
| 6.1 `existsUnique_isGalerkinSolution`, `norm_gradient_sub_le_cea` | `Ω` unbounded; nonsymmetric `A=[[1,M],[−M,1]]` | `∇v=0`, `v∈L²` gives `v=0`; pinned `UniformlyEllipticOn` bounds `|η·Aξ| ≤ Λ‖η‖‖ξ‖`, so `Λ ≥ √(1+M²)` | true | none |
| 6.2 `tendsto_galerkin`, `exists_galerkin_rate` | `sin πx`, `k=1`; `s=0`; empty meshes | `0.25118, 0.12583, 0.062947, 0.031477`, ratio `2.00`; bound is Céa with `v=0`; `0→0` | true | C02 |
| 6.3 `exists_aubinNitsche`, `exists_galerkin_L2_rate` | `sin πx`, `k=1`; transpose in adjoint | `0.0099209, 0.0024865, 0.00062202, 0.00015553`, ratio `4.00`; `a(e,z)=‖e‖²` | true | none |

- Source locators checked against the text: 34 (ErnGuermondI 18, ErnGuermondII 16, each at its theorem, definition or equation number); printed pages not checked (see below).
- Library declarations opened at the pin: `TauCeti.PDE.UniformlyEllipticOn` (`TauCeti/Analysis/PDE/Ellipticity/Basic.lean` 534), `IsWeakSolutionDirichlet` and `dirichletForcing` (`…/PDE/DirichletProblem.lean` 189, 149), `energyFormH1` (`…/PDE/EnergyForm/Sobolev.lean` 411), `W1p0` (`…/Sobolev/W1p/Zero.lean` 158), `Affine.Simplex.interior`, `closedInterior`, `interior_eq_empty` (`Mathlib/LinearAlgebra/AffineSpace/Simplex/Basic.lean` 460, 475, 519), `incenter`, `inradius`, `inradius_pos` (`Mathlib/Geometry/Euclidean/Incenter/Basic.lean` 394, 434, 519), `convexHull_eq_closedInterior` (`Mathlib/Analysis/Convex/Combination.lean` 619). Neither library has meshes, finite elements or the abstract Galerkin bounds.
- Cross-roadmap citations resolved on main: PDE §1.2, §1.6, §4.1, §4.2; SobolevPolynomialApproximation Conventions, §1.2, §1.3, §2.2, §2.3, §4.1, §5.1; VariationalMethods §6.1. The five local copies agree character for character with SobolevPolynomialApproximation's `Suggested.lean`.
- Dependency check: `depcheck: 94 roadmaps, 1054 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: 42 `sorry` warnings, no error, no other warning; pins Mathlib `1b1ccf4`, Tau Ceti `2fd255d` as the description says. Elaborated types read against the README for all 49 theorems; the three dropped section binders (`[Fact (1 ≤ p)]` on the inverse estimate, which binds its own `p`; `[NeZero d]` on two definitions) change nothing.
- One-tactic probe (`rfl`, `simp`, `infer_instance`) on a copy: none of the 42 admitted theorems closes. The six proved headlines are already marked as sanity checks.
- Pull request text read against the head: 48 named headlines, 42 admitted, 7 proved; no sentence contradicted.
- Overlap check: read SobolevPolynomialApproximation, VariationalMethods, PolynomialInterpolationAndBestApproximation; nothing shared (single-cell polynomial approximation stays with the first, Ritz–Galerkin eigenvalue convergence with the second, one-variable Lagrange interpolation with the third; no open pull request plans meshes or finite elements).

Source independence: 34 passages compared with 2 sources, none shared; largest share ErnGuermondII, 21 of 64 locators; contents compared with ErnGuermondII and ErnGuermondI: independent (1.1–1.4 run parallel to chapters 25, 26.2, 26.3, 27.4 in an order the `*Needs:*` lines 1.2→1.1, 1.3→1.2, 1.4→1.3 force, with other scope: 1.4 adds 32.3 and Brenner–Scott; Layers 2–5 take volume I's chapters as 8, 11, 5, 7, 19, 18, 11, 12). BrennerScott (19 locators), HanAtkinson, BoffiBrezziFortin and DiPietroErn could not be read.

Research link: Layers 1 and 5 are the stability and approximation results that the analyses of mixed methods (Boffi–Brezzi–Fortin 2013), discontinuous Galerkin methods (Di Pietro–Ern 2012) and conforming elliptic approximation (Ern–Guermond 2021, chapters 26 and 32) rest on; README "Downstream consumers" and ErnGuermondII.

## Not verifiable

- Printed page numbers of all Ern–Guermond locators: the authors' open deposit, the only legal copy found, is paginated differently from the Springer print; theorem numbers agree.
- Brenner–Scott, all 19 locators (among them (2.8.1), (3.3.11), (4.4.20), (4.5.3), (4.8.7)–(4.8.16), (5.4.4), (5.4.8), (10.1.9)): paywalled; ErnGuermondII line 1415 confirms only that 2.8.1 is Céa's lemma.
- The README's remark that Brenner–Scott (4.8.16) prints a seminorm where the norm is meant (5.2): the text could not be read.
- Han–Atkinson (Theorems 9.2.1, 10.4.3, Proposition 9.1.3), Boffi–Brezzi–Fortin (Proposition 5.4.2), Di Pietro–Ern (Lemma 1.46): paywalled.
- Ownership against open pull requests was checked by search of their READMEs and Lean files for the objects (meshes, Ciarlet elements, inf-sup, Céa, Strang, Scott–Zhang); no hit outside this roadmap.

## Source issues

- **Error** in ErnGuermondI at Proposition 11.6 (ErnGuermondI line 4743): the source says cells sharing a vertex have uniformly equivalent sizes on any shape-regular matching sequence, in every dimension; it should be restricted to `d ≥ 2`, since in `d = 1` every sequence is shape regular (Example 11.3) and `[0,1]`, `[1,1+ε]` have ratio `1/ε`; affects a stated result.
- **Gap** in ErnGuermondI at the proof of Proposition 11.6 (ErnGuermondI line 4751): the source says any two cells at a vertex are linked by a path of cells sharing faces; it should assume this, since two triangles meeting only at a vertex form a matching mesh without such a path; affects the proof.

## For the human reviewers

- Licence: the README's "Prior formalization" section says the author's repository `bjbraams/lean-NASC` (`NASC/Galerkin.lean`) proves five Layer 1 targets "in forms close to those here"; that repository and its licence were not read.
- Not tested: Brenner–Scott (19 of 64 locators), Han–Atkinson, Boffi–Brezzi–Fortin and Di Pietro–Ern are paywalled; their wording and locators were not compared. The largest share, ErnGuermondII (21), was read.
