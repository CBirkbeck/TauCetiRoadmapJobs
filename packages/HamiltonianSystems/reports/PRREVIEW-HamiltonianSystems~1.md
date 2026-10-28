# Review of HamiltonianSystems (pull request #480 at ef23c04)

**Verdict:** needs changes

Files reviewed: `TauCetiRoadmap/HamiltonianSystems/README.md` (681 lines) and `TauCetiRoadmap/HamiltonianSystems/Suggested.lean` (332 lines, 32 declarations, 20 `sorry`). No change outside the roadmap folder. Gate at this head: FAIL (`prnum` 4, `readme-ids-missing` 1; build, `sorry-data`, `set_option`, imports and `depcheck` clean). Previous AI review: none.

## R01 (P2) — The contraction inverse has two owners, and the one named on the supplier side does not exist on main

**Location.** README line 160 ("one construction, which HeegaardFloer F2.1 builds and Layer 1 specializes to differentials"), line 211 ("It is the one contraction inverse, which HeegaardFloer F2.1 builds following this layer"), lines 623–636 (*Relation to sibling roadmaps*, "F2.1 builds the strongly nondegenerate contraction inverse").

**Claim.** The inverse of `v ↦ ω x v` on arbitrary covectors, with its smooth dependence on the base point, is built by HeegaardFloer Lane F2.1 and consumed here; the same object is also listed under *What is missing (build here)* and spelled out as a Layer 1 item.

**Witness.** HeegaardFloer on main, `TauCetiRoadmap/HeegaardFloer/README.md` lines 186–207 (Lane F2, items 1–5): almost complex structures, local theory, compactness, transversality, gluing. No contraction inverse, no "F2.1" subsection. The contraction-inverse text exists only at the head of pull request #957, which revises an existing roadmap and is therefore not a supplier; that head itself says it builds the inverse "following HamiltonianSystems Layer 1's existing design". `isHamiltonian_of_contMDiff` (Suggested.lean line 80) and the smoothness of `hamiltonianVectorField` rest on this construction.

**Repair.** Make Layer 1 the sole owner: delete the two clauses "which HeegaardFloer F2.1 builds …" (lines 160 and 211), keep the Layer 1 items as they stand (inverse on arbitrary covectors by the open mapping theorem, smooth dependence by `contDiffAt_map_inverse`, then the `dF` specialization), and rewrite the sibling entry (lines 623–636) as: HeegaardFloer Lane F2 consumes Layer 1's inverse for the Moser field; this roadmap consumes nothing from it. Tested on the instance that refuted it: with Layer 1 as owner, every use in Layers 1–3 resolves inside this roadmap, and the citation of a section absent on main disappears.

## R02 (P2) — The summit theorem is statable at the pins but absent, and the docstring names no non-statable headline

**Location.** Suggested.lean lines 7–22 (module docstring) and the whole file; README lines 24–28 ("Its summit is Souriau's mass theorem in algebraic form") and lines 486–523 (Milestone 3).

**Claim.** The file states the roadmap's headline theorems; the summit is `H²(𝔤𝔞𝔩, ℝ)` one-dimensional and the class of a free particle of mass `m` equal to `m [f₀]`.

**Witness.** Neither statement is in the file, and the docstring says nothing about statability. Both are statable at the pins: `LieSubalgebra.lieSpan` (Mathlib `Algebra/Lie/Subalgebra.lean` line 624) gives `𝔤𝔞𝔩 ⊆ Matrix (Fin 5) (Fin 5) ℝ` from its ten generators with a real body and no proof field; `LieModule.Cohomology.twoCocycle` and `d₁₂` (`Algebra/Lie/Cochain.lean` lines 156 and 101) and a quotient by the range of `d₁₂` give `H²` as a real-bodied definition of the kind the acceptance test allows; the cocycle statement is `∀ a μ, (∀ Z x, a.toLinearMap Z x = ⟨explicit field⟩) → σ.IsMomentMap a μ → (∀ x Z, μ x Z = ⟨explicit formula⟩) → σ.momentCocycle μ x Z Z' = m * f₀ Z Z'` on `(coordinateSymplecticForm 3).constSmooth`, with `f₀` an explicit bilinear map. The Tau Ceti comparisons of Layers 1–2 are the headlines that are not statable here (the modules `Geometry/Symplectic/Hamiltonian/*` are absent at the pin), and the docstring must say so.

**Repair.** State `finrank ℝ (secondCohomology ℝ 𝔤𝔞𝔩 (TrivialLieModule ℝ 𝔤𝔞𝔩 ℝ)) = 1` and the cocycle equation above, each with `sorry`, and replace the docstring by the standard form: the roadmap is README.md, this file states the headline theorems against the pinned APIs, and the comparisons with Tau Ceti's `SymplecticForm.hamiltonianVectorField` and `hamiltonianFlow` are not statable because those modules are newer than the pin.

## R03 (P3) — Gate failures and process narrative

**Location.** README lines 563, 602, 623 (`#178`, `#151`, `#957`, `#1049`); line 100 (`isSymplectomorphism_cotangentModelEquiv`, flagged `readme-ids-missing`); lines 12–13 and 142–143 ("newer than this repository's Tau Ceti pin", "cited at Tau Ceti commit `8562ddf8`").

**Witness.** Gate rule `prnum`: no pull-request numbers in the README. The symplectomorphism lemma exists at the pin (`Geometry/Symplectic/Cotangent/Compatible.lean` line 91, namespace `TauCeti`), so the gate flags the unqualified spelling. A commit hash is a process detail a reader a year from now cannot use.

**Repair.** Cite by name and section: DifferentialGeometry Layers 0.3, 0.4, 1.1, 1.2, 1.4, 3.4; RestrictedThreeBody Lane A1; HeegaardFloer Lane F2; SymplecticGeometry (its root README and HamiltonianReduction). Spell the lemma `TauCeti.isSymplectomorphism_cotangentModelEquiv` or state the fact in prose. Replace the commit reference by the module paths alone and drop "newer than the pin".

## R04 (P3) — No theorem carries a source locator

**Location.** Layers 1–3 throughout: Milestone 1 (line 287), Poisson's theorem (line 331), Milestone 2 (line 394), Liouville (line 421), Noether (line 440), the cocycle and class (lines 448–484), `H²(𝔤𝔞𝔩, ℝ)` (line 515).

**Witness.** The only locators in the file are Souriau's equation numbers in the dictionary (lines 71–93) and the reference list; Bargmann 1954 is cited with no section; McDuff–Salamon, Marsden–Ratiu and Chernoff–Marsden are listed without a theorem or page anywhere.

**Repair.** Attach a theorem-level locator at each claim (for example Marsden–Ratiu for Noether and the cocycle, Bargmann §6 for the Galilean `H²`, Chernoff–Marsden for the Banach-manifold Hamiltonian formalism), in parentheses at the claim as the house style asks.

## R05 (P3) — Definitions without discriminating Checks

**Location.** `IsStronglyNondegenerate` (Lean line 56), `IsSymplecticMap` (141), `IsSymplectomorphism` (150), `InfinitesimalAction` (222), `momentCocycle` (244), and the README-only `SymplecticForm.pi`, `twoCoboundary`, `secondCohomology`, `SmoothTwoForm.pullback`.

**Witness.** None of these has three Checks; the examples of Layers 1 and 3 test `hamiltonianVectorField`, `poissonBracket` and moment maps only.

**Repair.** Add `**Checks.**` bullets, for instance: strong nondegeneracy holds on `V × StrongDual ℝ V` exactly for reflexive `V` (already in the text at line 304, to be labelled as a Check); `(q, p) ↦ (2q, p/2)` is a symplectic map of the plane and `(q, p) ↦ (2q, p)` is not (the form scales by 2); for `InfinitesimalAction`, two linear fields `A, A'` on `V` satisfy `-[A_M, A'_M] = (AA' - A'A)_M` and the opposite sign fails whenever `AA' ≠ A'A`; for `momentCocycle`, the value `ω(Z, Z')` for translations and `-m` on `(B e₁, T e₁)` for the free particle.

## R06 (P3) — Padding in `Suggested.lean`

**Location.** Suggested.lean line 186, `coordinateSymplecticForm_apply`, proved by `rfl`.

**Witness.** It restates the definition at line 180 (the probe: all twenty sorried theorems fail `rfl`, `simp`, `infer_instance` and `simp` with the file's definitions unfolded; this is the only declaration that closes).

**Repair.** Delete it from `Suggested.lean`; the README keeps the formula `ω((q, p), (q', p')) = p' ⬝ᵥ q - p ⬝ᵥ q'` as a Check of `coordinateSymplecticForm`.

## R07 (P3) — Generality and unused hypotheses

**Location.** README line 350 ("`n ≠ 0`") against Lean line 154 (`{n : WithTop ℕ∞}` unrestricted); Lean lines 121 and 132 (`hs : IsOpen s`); line 248 (`hσ : σ.IsSymplectic`).

**Witness.** `IsMIntegralCurveOn` is pointwise `HasMFDerivAt` (Mathlib `Geometry/Manifold/IntegralCurve/Basic.lean` line 65), so the derivative at `t ∈ s` and constancy on a preconnected `T ⊆ s` hold for every `s`; in Noether's theorem, `{μ_Z, F} x = ω x (Z_M x) (X_F x) = -dF_x (Z_M x) = 0` uses only that `F` has a Hamiltonian vector at `x`, which `hF` supplies. The five `def`s drop `[CompleteSpace E]` (elaborated signatures), which is more general than the README's standing Banach setting.

**Repair.** Author's choice: drop `n ≠ 0` from the README or add `(hn : n ≠ 0)`; drop the three unused hypotheses or say in the README which later consumer needs them; say in *Standing conventions* that the definitions need no completeness.

## R08 (P3) — The roadmap's declarations live in Tau Ceti's namespace

**Location.** Suggested.lean line 34 (`namespace TauCeti.SmoothTwoForm`) and line 235.

**Witness.** Tau Ceti at commit 8562ddf8 already adds `SymplecticForm.hamiltonianVectorField`; a pin that adds `SmoothTwoForm.hamiltonianVectorField` or `SmoothTwoForm.poissonBracket` makes this file fail to build with a duplicate declaration.

**Repair.** Declare everything under `namespace TauCetiRoadmap.HamiltonianSystems`, keeping dot-notation through `export` or `open`; the consumers on main cite the short names and are unaffected.

## R09 (P3) — Overlap with the RestrictedThreeBody pull request

**Location.** README lines 602–622 (*Planar restricted three-body problem*).

**Witness.** RestrictedThreeBody (pull request #151, Lane A1, items 1–3) builds its own standard form, Hamiltonian vector field, coordinate Poisson bracket and canonical changes on `Fin (2 * n) → ℝ`, and does not cite this roadmap. This README states ownership of these objects (consistent with SymplecticGeometry on main, which names HamiltonianSystems as owner), so nothing more is needed on this side beyond R03's citation form; the human reviewers decide the other side.

## Verified sound

**Gate and order.** `depcheck: 156 roadmaps, 1066 edges, 0 problem(s)`; no UPWARD or CYCLE line. HamiltonianSystems is the last line of the merge order; every supplier it names is on main or at a pin.

**Ownership.** SymplecticGeometry on main (root README, *Dependencies and single ownership*) names HamiltonianSystems as owner of `IsHamiltonianVectorField`, `IsHamiltonian`, `hamiltonianVectorField`, `poissonBracket`, `IsSymplecticMap`, infinitesimal actions and moment maps; HamiltonianReduction (lines 16–19), IntegrableSystems (line 13), GeometricQuantization (line 14 at its head) and LieGroupoidsPoisson (lines 55–94 at its head) consume rather than rebuild. Grep of all 378 open heads and main for the object names returns only this roadmap and those consumers. Ownership against open pull requests whose files the brief did not give was not checked.

**Cross-roadmap citations resolved.** DifferentialGeometry on main: 0.3 `mpullback` (line 284), 0.4 `SmoothForm I M ℝ 2` migration with `legacySmoothTwoFormEquiv` (lines 294–309), 1.1 `mextDeriv` (315), 1.2 `mpullback_mextDeriv` (320), 1.4 invariant formulas through `mlieBracket` and Cartan (325–332), 3.4 Lie derivatives via flows (393–398). LieGroups on main owns the exponential map and `Ad` (lines 10, 57–62, 101–115). HeegaardFloer on main Lane F2 (186–207): see R01.

**Library declarations opened at the pins (file:line).** Tau Ceti: `SmoothTwoForm` `Geometry/Manifold/TwoForm/Basic.lean:61`, `bilinFormAt` :83, `contMDiff_apply` :142, `const` :166; `inChartAt` `TwoForm/Closed.lean:86`, `IsClosed` :296, `isClosed_iff_forall_extDerivWithin_inChartAt_self` :304, `isClosed_const` :329; `IsNondegenerate` `Geometry/Symplectic/Manifold/TwoForm.lean:68`, `isNondegenerate_iff_separatingLeft` :73, `IsSymplectic` :91, `constSmooth` :192 (needs `[FiniteDimensional ℝ V]`), `fromTangentSpace_constSmooth_apply` :211, `isSymplectic_constSmooth` :236; `SymplecticForm` `Geometry/Symplectic/AlmostComplex.lean:343`; `transport` `SymplecticTransport.lean:63` (bilinear form `congr e`, so `(ω.transport e) v w = ω (e.symm v) (e.symm w)`), `IsSymplectomorphism` :121; `prod` `Prod/Basic.lean:206`; `cotangentSymplecticForm` `Cotangent/Basic.lean:80`; `strongDualCotangentSymplecticForm` `Cotangent/StrongDual.lean:82` with `_apply` :90 (`y.2 x.1 - x.2 y.1`); `stdSymplecticForm` `StandardCompatible.lean:83` (`⟪u.1, w.2⟫ - ⟪u.2, w.1⟫`); `isSymplectomorphism_cotangentModelEquiv` `Cotangent/Compatible.lean:91`; `maximalIntegralCurveInterval` `IntegralCurve/Maximal.lean:107`, `subset_maximalIntegralCurveInterval` :113, `eqOn_maximalIntegralCurve` :249 (`C¹` field, `[T2Space M] [IsManifold I 1 M] [BoundarylessManifold I M]`); `maximalIntegralCurve_add` `IntegralCurve/Flow.lean:106`, `maximalIntegralCurveFlowDomain` :168, `isOpen_maximalIntegralCurveFlowDomain` :358, `contMDiffOn_maximalIntegralCurve` :370 (both `[FiniteDimensional ℝ E]`); `map_of_mfderiv_eq` `IntegralCurve/Basic.lean:68`; `mvfderiv_mlieBracket` `Geometry/Manifold/VectorField/LieBracket.lean:222`; `mvfderiv_apply_eq_mfderiv_apply` `VectorField/Regularity.lean:90`; `flowOfLipschitz` `Dynamics/Flow/OfLipschitz.lean:54`. No `SymplecticForm.pi` and nothing Galilean at the pin. Mathlib: `mvfderiv` `Geometry/Manifold/MFDeriv/NormedSpace.lean:448`, `mvfderiv_eq_fderiv` :613, `mfderiv_eq_fderiv` :625; `NormedSpace.fromTangentSpace` `IsManifold/Basic.lean:1063`; `lieBracket` `Analysis/Calculus/VectorField.lean:59` (`DW·V - DV·W`), `mlieBracket` `Geometry/Manifold/VectorField/LieBracket.lean:70`, `ContMDiffAt.mlieBracket_vectorField` :981, `leibniz_identity_mlieBracket` :1153; `extDeriv_apply_vectorField` `Analysis/Calculus/DifferentialForm/VectorField.lean:143`; `IsMIntegralCurveOn` `IntegralCurve/Basic.lean:65`; `exists_isMIntegralCurveAt_of_contMDiffAt_boundaryless` `IntegralCurve/ExistUnique.lean:120` (`[CompleteSpace E] [BoundarylessManifold I M]`, as the README's Layer 2 "iff" assumes); `contDiffAt_map_inverse` `ContDiff/Operations.lean:844` (`[CompleteSpace E]`); `twoCochain` `Algebra/Lie/Cochain.lean:46`, `d₁₂` :101 with `d₁₂_apply_apply_ofTrivial` :118 (`-f ⁅x, y⁆`), `twoCocycle` :156, `mem_twoCocycle_iff_of_trivial` :161; `LieAlgebra.ofTwoCocycle` and `bracket_ofTwoCocycle` `Algebra/Lie/Extension.lean:202`; `TrivialLieModule.equiv` `Algebra/Lie/Abelian.lean:391`; `skewAdjointLieSubalgebra` `Algebra/Lie/SkewAdjoint.lean:60`; `dotProductEquiv` `LinearAlgebra/Matrix/Dual.lean:48`; `⨯₃` `LinearAlgebra/CrossProduct.lean:61`; `Diffeomorph` `Geometry/Manifold/Diffeomorph.lean:82`; `LieSubalgebra.lieSpan` `Algebra/Lie/Subalgebra.lean:624`. No `twoCoboundary`, no `secondCohomology` and no zero-bracket Lie algebra on a bare module in `Algebra/Lie` at the pin, as the README says.

**Tau Ceti at commit 8562ddf8** (read from the pinned clone, which holds that commit): `hamiltonianVectorField` with `ω (X_H x) v = fderiv ℝ H x v` (`apply_hamiltonianVectorField`), `eq_hamiltonianVectorField_iff`, `contDiff_hamiltonianVectorField` (`C^(n+1) → C^n`), `apply_fderiv_hamiltonianVectorField`, `apply_fderiv_hamiltonianVectorField_add` (`C²`); `hamiltonianFlow = flowOfLipschitz`, `hasDerivAt_hamiltonianFlow`, `hamiltonianFlow_conserves` (`Differentiable ℝ H`), `apply_fderiv_hamiltonianFlow` (`C²`); `TimeDependent.lean` present. The README's descriptions match.

**Elaborated signatures.** Compared the worker's `#check @name` output for all 32 declarations with the README: every theorem carries `[CompleteSpace E]`, the defs do not (R07); the "dropped `[TopologicalSpace H]`" lead on `hamiltonianVectorField_coordinateSymplecticForm` is spurious (the Hamiltonian `H` shadows the model-space type). The file elaborates with `sorry` the only warning (20 of them).

**Adversarial pass.**

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Hamilton's equations on the canonical model (README 60–63, Lean 193) | `ω((q,p),(q',p')) = p'·q - p·q'`, `X_H = (a,b)` | `ω((a,b),(q',p')) = p'·a - b·q'` must equal `∂_qH·q' + ∂_pH·p'` for all `(q',p')`, so `a = ∂H/∂p`, `b = -∂H/∂q` | holds | none |
| `{q_i, p_j} = δ_ij` (README 63) | `n = 2`, `i = 1, j = 1` and `i = 1, j = 2` | `X_{p_j} = (e_j, 0)`, `dq_i(e_j, 0) = δ_ij`: values `1`, `0` | holds | none |
| Bracket in coordinates (Lean 203) | `F = q₁`, `G = p₁`; `F = q₁ p₁`, `G = q₁` | `1·1 - 0 = 1`; `p₁·0 - q₁·1 = -q₁` versus `dF(X_G) = dF(0, -e₁) = -q₁` | holds | none |
| `X_{{F,G}} = -[X_F, X_G]` (README 44, Lean 102) | Cartan: `ι_{[X,Y]} = L_X ι_Y - ι_Y L_X` with `ι_{X_G}ω = dG` | `ι_{[X_F,X_G]}ω = d(ω(X_G, X_F)) = -d{F,G}` | holds with Mathlib's `DW·V - DV·W` | none |
| Six-term formula (Lean 86) | `ω = dq∧dp`, `U = (1,0)`, `V = (0,1)`, `W = (q,0)` | `-1 - 0 + 0 - 0 + 1 - 0 = 0` | holds | none |
| same | `ω = q dq∧dp` (closed on ℝ²), same fields | `-2q - 0 + q - 0 + q - 0 = 0` | holds | none |
| same, negative control | `ω = x₃ dx₁∧dx₂` on ℝ³, `U,V,W = e₁,e₂,e₃` | `0 - 0 + 1 - 0 + 0 - 0 = 1 = dω(e₁,e₂,e₃)` | detects non-closedness | none |
| Conservation along a curve (Lean 120, 131) | `H = p`, `s = (-2,-1) ∪ (1,2)`, curve `(t,0)` then `(t,1)` | `X_H = (1,0)`, `γ' = (1,0)`, `H` takes `0` and `1` | preconnected `T` needed, as stated | none |
| `{H, H} = 0` (README 311) | `x` with a solution `v`; `x` with none | `dH_x v = ω x v v = 0`; `X_H x = 0`, `dH_x 0 = 0` | holds without hypotheses | none |
| Uniqueness under weak nondegeneracy (Lean 64) | `ω x (X x - Y x) = 0` | `isNondegenerate_iff_separatingLeft` gives `X x = Y x` | holds | none |
| Strong ⇒ weak (Lean 75) | `ω x w = 0`, `E = ℓ²` | every `α = ω x v` kills `w`; Hahn–Banach gives `w = 0` | holds, no completeness used | none |
| Finite dim ⇒ strong (Lean 70) | `dim E = 2n`, injective `E → E*` | equal dimensions, so surjective | holds | none |
| Reflexivity example (README 303) | `V` reflexive; `V = c₀` | image of `(q,α)` is `(-α, ev_q) ∈ V* × V**`; onto iff `V** = ev(V)`; for `c₀`, `ℓ^∞ ≠ ev(c₀)` | holds | none |
| Translations (README 460) | abelian `V`, `Z_M = Z` constant | `dμ_Z = ω(Z, ·)`, `c = ω(Z,Z')`, coboundaries `-ν⁅·,·⁆ = 0` | class `≠ 0` iff `ω ≠ 0` | none |
| Linear symplectic action (README 466) | `A, A'` skew-adjoint | `[A_M,A'_M] = (A'A - AA')x = -(⁅A,A'⁆)_M`; `dμ_A(v) = ½(ω(Av,x)+ω(Ax,v)) = ω(Ax,v)`; `c = ω(Ax,A'x) - ½ω((AA'-A'A)x,x) = 0` | holds | none |
| Cotangent lift (README 471) | `L_A = (A, -Aᵀ)` | `⁅L_A,L_{A'}⁆ = L_{⁅A,A'⁆}`; `dμ_A(q',β) = β(Aq) + α(Aq')` = `ι_{L_A}ω`; `c = α(⁅A,A'⁆q) - μ_{⁅A,A'⁆} = 0` | holds | none |
| Galilean algebra closed (README 487) | block commutator | `[M,M'] = [[JJ'-J'J, Jβ'-J'β, Jγ'+βε'-J'γ-β'ε],[0,0,0],[0,0,0]]`, `JJ'-J'J = j(ρ×ρ')`, dimension `3+3+3+1 = 10` | holds | none |
| Action on motions (README 503) | first-order transport of `t ↦ q + (t/m)p` | `q̇ = ρ×q + γ - (ε/m)p`, `ṗ = ρ×p + mβ` | holds | none |
| Infinitesimal-action relation (README 506) | `Z_M = L_Z x + b_Z` | `-[Z_M,Z'_M] = ((ρ×ρ')×q + ρ×γ' - ρ'×γ + ε'β - εβ', (ρ×ρ')×p + m(ρ×β' - ρ'×β)) = (⁅Z,Z'⁆)_M` | holds for the matrix commutator | none |
| Moment map (README 507) | `μ_Z = ρ·(q×p) + γ·p - m β·q - ε p·p/(2m)` | `dμ_Z(q',p') = -(ρ×p)·q' + (ρ×q)·p' + γ·p' - mβ·q' - (ε/m)p·p'` equals `ι_{Z_M}ω(q',p') = p'·(ρ×q + γ - (ε/m)p) - (ρ×p + mβ)·q'` | holds | none |
| Cocycle (README 509) | expand `ω(Z_M,Z'_M) - μ_{⁅Z,Z'⁆}` | rotation, rotation–translation, rotation–boost and `ε` terms cancel pairwise (Lagrange identity); remainder `m(β'·γ - β·γ')` | holds | none |
| `c(B e₁, T e₁) = -m` (README 511) | `β = e₁`, `γ' = e₁` | `⁅Z,Z'⁆ = 0`; `m(0 - e₁·e₁) = -m` | holds | none |
| `f₀` not a coboundary (README 513) | `d₁₂ ν (Z,Z') = -ν ⁅Z,Z'⁆` | vanishes on the commuting pair `(B e₁, T e₁)` where `f₀ = -1` | holds | none |
| Pointwise 2-cocycle (Lean 284) | `IsClosed` only, `c_x(x,y) = ω(x_M,y_M) - μ⁅x,y⁆` | cyclic sum of `ω([x_M,y_M],z_M)` equals `-2A` with `A` the same sum, by the six-term formula and `dc = 0`; so `A = 0`; Jacobi kills the `μ` terms; Mathlib's condition is the cyclic one | holds without nondegeneracy | none |
| `dc = 0` pointwise (README 455) | `d(ω(X_F,X_G)) = -ι_{[X_F,X_G]}ω` from the six-term formula with `W` constant in a chart | `W(dF(X_G)) - ω([X_F,X_G],W) - 2 d(dF(X_G))(W) = 0` | holds | none |
| Shift equation (Lean 276, 319) | `μ + ν`, `ν` constant | `mvfderiv (μ_Z + ν Z) = mvfderiv μ_Z`, same solution set, `c' = c - ν⁅Z,Z'⁆ = c + d₁₂ ν` | holds | none |
| Empty manifold (README 471–476, Lean 306, 319) | `M = ∅`, `𝔤 = ⟨h,e⟩`, `⁅h,e⁆ = e`, `ν e = 1` | `d₁₂ ν (h,e) = -1 ≠ 0` while every cochain satisfies the evaluation equation | `[ConnectedSpace M]` needed, as stated | none |
| Central extension (README 480) | `ofTwoCocycle c` bracket `(⁅Z,Z'⁆, c(Z,Z'))` | `{μ_Z + s, μ_Z' + s'} - μ_{⁅Z,Z'⁆} - c(Z,Z') = 0` | holds | none |
| Souriau dictionary self-consistency (README 71–93) | `grad u = -X_u`, `σ(grad u)(grad v) = {u,v}` | `(9.24)` reads `-X_{{u,v}} = [X_u,X_v]`; `(9.12)` gives `σ = -ω` after `(P,Q) ↦ (Q,P)` | internally consistent; book not readable here | none |

**Padding probe.** Copy of the file with each `sorry` replaced by `first | (rfl; done) | (simp; done) | (infer_instance; done) | (simp [defs]; done) | sorry`, elaborated with `lake env lean`: 20 `sorry` warnings, 0 errors; no sorried theorem closes. Only the `rfl`-proved `coordinateSymplecticForm_apply` restates a definition (R06).

## Not verifiable

- Souriau, *Structure des systèmes dynamiques* (1970) and its 1997 translation: the equation-numbered dictionary (README 71–93) and the References list. Looked at jmsouriau.com (home and *Travaux* pages: no link to the book found), at arXiv 2306.03106 (a presentation of the book without formulas), and at the translation's DOI (Springer, paywalled); the sources service returned network trouble. Listed in `needs-references.toml`.
- Bargmann 1954 (`H²` of the Galilean algebra): JSTOR landing page only; recorded by the sources service in `needs-references.toml`.
- McDuff–Salamon 2017, Marsden–Ratiu 1999, Chernoff–Marsden 1974: cited without locators (R04); the DOIs are paywalled publishers.
- The physlib provenance files (README 653–681): not consulted; the roadmap cites them as provenance only.

## Source issues

- none
