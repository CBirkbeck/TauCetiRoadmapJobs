# GATE-LocalVariationalFieldTheory~1: answers to human review

Line numbers refer to `TauCetiRoadmap/LocalVariationalFieldTheory/README.md` at the repair commit `778f9c51` (on top of `a38ee99`). Both reviews were posted against earlier heads (`747ba46`, `b0d4708`). Most points were already repaired in `b0d4708` or `a38ee99`; for each one the report gives the current text and, where relevant, what this round changed.

## H01 (roed-math) — applied

The density-dual transpose `A^t=Σ_I(−D)_I∘a_I^T` (an operator `Γ(F*⊗Dens)→Γ(E*⊗Dens)`) is now kept separate from the Hermitian adjoint `A†=ρ⁻¹H_E⁻¹Σ_I(−D)_I∘(ρ ā_I^T H_F)` (lines 95–104). The reviewer's case `A=D_x`, `ρ=eˣ` gives `A†=−D_x−1`, as the reviewer states. This round adds the requested adapter at line 101: `b_E(s)=ρ s†H_E` and `A†=b_E⁻¹∘A^t∘b_F`. Expanding the adapter reproduces the displayed formula. Line 101 also says that `A^t` is the operator acting on density-valued Euler sources. In the field-redefinition chain rule, `ℓ_ψ^*` became `ℓ_ψ^t` (line 105), and in the constant-coefficient example `ℓ*=1−αD₁` became `ℓ^t=1−αD₁` (lines 107–117).

## H02 (roed-math) — applied

The metric-identified Euler one-form is `e=−δdA`, and `e_A=−D_A†F_A` for Yang–Mills, with the action `L=−F²/4` kept as it was (lines 294, 313, 315, 321). Check: `δL=−⟨F,da⟩=−⟨δF,a⟩`, and `(−δF)_μ=∇^νF_{νμ}` gives back the displayed `E^μ=∂_νF^{νμ}`.

## H03 (roed-math) — applied

Line 319 shows `δ_K(e_b z)=ℰ_b z`. So `H₁(K)` is a module over the stationary ring `Ā=F_loc/I_∞`, and any `F_loc` presentation must keep these annihilator relations. Line 349 states the presentation `H₁(K_r)≃⊕Ā_r·[z_J]` over `Ā_r`. Over `A_r`, its coefficient kernel is `I_r·A_r^(J)`, and line 349 says explicitly that it is not a relation-free `F_loc` presentation.

## H04 (roed-math) — applied differently

The regularity/KT theorem is not limited to four dimensions. It is stated for pure Yang–Mills on every base of dimension `n≥2`, for any signature and nondegenerate `Ad`-invariant pairing (line 321). The proof uses the explicit independent/dependent split, leader coordinates, the `[[b,0],[C_i,B_ij]]` block, the triangular identity normal form and order-controlled contracting pairs (lines 321–357). The cases `n=1` and `n=0` get their own complete resolutions (lines 359–361). The reviewer's flat one-dimensional `U(1)` example is kept at line 359 as the control showing that `e_0` is not a boundary of the gauge-only differential.

## H05 (roed-math) — applied

The fixed-signature metric-family, connection and `δΓ` contract is now on main, in HopfRinow Layer 1 under "Nondegenerate Levi-Civita supplier". It covers nondegenerate symmetric sections of `Hom(TM,Hom(TM,ℝ))`, the Koszul construction, jointly smooth families with fixed signature, and the identity `2g((∂_t∇)_X Y,Z)=…`, and it names LVF6 as its consumer. The citation at lines 396 and 435 now points to `../HopfRinow/README.md#layer-1-…` on main instead of an unmerged revision commit.

## H06 (roed-math) — applied

The full real `N=±1` cover and its comparison with the native norm-one `pinGroup` are now on main, in SpinRepresentations Layer 7 under "Full real orthogonal covers and the norm-one subgroup". That section covers the surjection onto O(Q) with kernel `{±1}`, the three definite/indefinite image cases and the comparison of even subgroups. The consumption sentences at lines 275 and 370 now link to that section on main.

## H07 (roed-math) — disputed

The supplier specification exists. PseudodifferentialOperators is a new-roadmap folder in an open pull request. Its §P1.0 "Differential-operator core" (README lines 94–230 at its head `063cf51`) builds vector-bundle first and higher jets, the bilinear density transpose and the metric/density formal adjoint. These are the operations compared at lines 104–105. The links at lines 13, 435 and 439 are now relative links into that folder.

## H08 (roed-math) — applied

The Anderson citation now reads Chapter 2, §B, Definition 2.11 (p44), Theorem 2.12 (pp46–47) and Corollary 2.13(i), equation (2.42) (line 439).

## H09 (roed-math) — applied differently

No public copy of either course-note scan has been identified, so a retrievable URL cannot be given. Line 433 pins the editions by physical page count, byte size and inventory SHA-256. It names the Berkeley Math275 page only as course context, and it says that filenames and URLs do not establish authorship.

## H10 (roed-math) — answered

The curved Dirac construction is global (LVF6.GlobalDirac, line 370). It works on a Lorentzian four-manifold with chosen orientation, time orientation and a chosen Spin lift `P→Fr⁺↑_g(TM)`, and the lift is taken as data. It builds the associated bundle `S=P×_ρℂ⁴`, the Clifford multiplication and the lifted Clifford connection, with local coframes only trivializing it. Under metric variation the abstract `P₀` and `S` stay fixed through the near-identity transport `b_t=A_t^(-1/2)` (line 388). Independent coframe and connection variation is restricted to Levi–Civita through the reduced-action chain rule `δS_red=(δ_e S)(δe)+(δ_ω S)(Dω_LC[e]δe)` (line 392).

## H11 (roed-math) — applied

Noether II is stated on the joint field/parameter jet bundle `E×_M P`. It uses one finite-order current operator `B_L,R(j^N u,j^N ε)`, linear and homogeneous in the parameter jets, together with `supp B(u,ε)⊆supp ε` and an explicit ban on the `∀ε,∃B_ε` reading (lines 298–306). The reviewer's example `B_ε=∫_{−∞}^x ε` is not of this form. This round also corrects the primary locator from (6.28) to (6.27) (line 306): in BarnichBrandtHenneaux2000, the ε-enlarged jet definition of a gauge symmetry is equation (6.27) (line 1928), and (6.28) is the Noether-operator identity (line 1935).

## H12 (roed-math) — applied

An LVF-owned classical Cauchy carrier now comes before UNSW41GaugeComparison (lines 128–162). CauchyPhase gives the phase bundle `V*E_Σ⊗Dens_Σ`, the density-valued `ω=−d_vert θ` and three explicit domains. CauchyFunctionals gives finite-order integral functionals, divergence equivalence and spatial first variation from LVF2. CauchyBracket gives `{F,G}=∫[(δF/δq)(δG/δp)−(δF/δp)(δG/δq)]` with well-definedness, antisymmetry and Jacobi, the sign `[X_F,X_G]=−X_{ {F,G} }`, and `{Q_f,P_g}=∫fg`. The delta relations are read as kernels, local functionals form a Lie algebra, and products live in a separate multilocal algebra (line 150). CauchyConstraints gives the primary and gauge interfaces. The bracket formula agrees with BarnichFulpLadaStasheff1997 §3.2, equation (27) (line 689).

## Other repairs made while gating

- `Suggested.lean`: replaced the five `Mathlib.*` submodule imports with `import Mathlib`. The `sorry`'d smoothness and transitivity fields of `pullback`, `localFunctionSetoid`, `totalDerivative`, `jetPartial` and `eulerAllOrders` are now proved, using a private helper `contDiff_truncate`. The file now has no `sorry` inside any definition. Only proof terms changed, so no declaration's type changed. No separate `#check @name` scratch elaboration was run.
- README: replaced the GitHub blob links to unmerged revision commits with relative links (SmoothBundlesConnections, PseudodifferentialOperators, HopfRinow, IntegrableSystems, SpinRepresentations). Put `F^{μν}` in a code span (line 428).
- Not changed: `Suggested.lean`'s module docstring and its prototype declarations still do not follow the acceptance-test form (headline theorems only). Bringing it into that form would widen this job beyond the review.

## Adversarial pass on the changed statements

| statement | instances tried | values computed | result | change |
|---|---|---|---|---|
| `A†=b_E⁻¹∘A^t∘b_F`, `b_E(s)=ρs†H_E` | general `a_I`, Hermitian `H_E,H_F`, density ρ; `A=D_x`, `ρ=eˣ`, `H=1` | `A^t b_F v=Σ(−D)_I(ρ a_I^T H̄_F v̄)`; `b_E⁻¹w=ρ⁻¹H_E⁻¹w̄` gives `ρ⁻¹H_E⁻¹Σ(−D)_I(ρ ā_I^T H_F v)`; example: `−e^{−x}D(eˣv)=−v′−v` | agrees with line 100 and with the reviewer's `−D_x−1` | added at line 101 |
| `ℓ^t=1−αD₁`, kernels, example `L=e^{x₁/α}v` | α≠0; α=0 | `q−αq′=0⇒q=c e^{x/α}`; `E_u(e^{x/α}(u+αu′))=e^{x/α}−D(αe^{x/α})=0` while `E_v=e^{x/α}`; α=0 gives the identity | consistent | notation `*`→`t` |
| BBH locator | BarnichBrandtHenneaux2000 lines 1925–1935 | (6.27) is the ε-enlarged symmetry, linear-homogeneous in ε-jets; (6.28) is the Noether-operator identity | old locator wrong | (6.28)→(6.27) |
| `contDiff_truncate`, `trans` proof | `r=s` (identity truncation), `r<s` | elaborates; `pullback` composes definitionally, so `e₁'.trans e₂'` closes the goal | proved | new proofs |

## Ownership and suppliers

- Suppliers cited: HopfRinow, SpinRepresentations, IntegrableSystems and DifferentialGeometry on main; SmoothBundlesConnections and PseudodifferentialOperators as new-roadmap open pull requests. The sections cited exist at main or at those heads: SBC B2–B4 and B6.0–B6.1 at `e3abb0d`, PDO §P1.0 at `063cf51`.
- No construction was added this round, so the ownership statement is unchanged.
- The links to RelativisticQuantumFieldTheory, QuantumFoundations and UnboundedOperators name downstream owners of out-of-scope material, not suppliers.

## Build and gate

- `lake build TauCetiRoadmap.LocalVariationalFieldTheory.Suggested`: **Build completed successfully.** There are three `declaration uses 'sorry'` warnings, for `totalDerivativeRepresentative_respects`, `kleinGordon_euler` and `oscillator_euler`, all of which are theorems.
- Gate summary line: `gate LocalVariationalFieldTheory: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=1 metadata=0 dirty=0 outside-folder=0 source-material=0 FAIL`
  - The only failing item is `depcheck: NOT IN ORDER: LocalVariationalFieldTheory (insert it after its last supplier)`. This is the design-stage case, not a defect.
- Depcheck (`--movable`):

```
NOT IN ORDER: LocalVariationalFieldTheory (insert it after its last supplier)
depcheck: 148 roadmaps, 1000 edges, 1 problem(s)
```

  No UPWARD or CYCLE line.
- Sources: BarnichBrandtHenneaux2000 (arXiv hep-th/0002245v3) and BarnichFulpLadaStasheff1997 (arXiv hep-th/9702176) were fetched through the sources service, and no texts are missing. The folder has no `sources.toml`, and this job may not create one.
