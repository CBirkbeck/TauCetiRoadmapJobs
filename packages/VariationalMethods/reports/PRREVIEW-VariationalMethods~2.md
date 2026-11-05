# Review of VariationalMethods (pull request #1028 at 2acede3)

**Verdict:** needs changes

Reviewed: `TauCetiRoadmap/VariationalMethods/README.md` (1073 lines) and `TauCetiRoadmap/VariationalMethods/Suggested.lean` (304 lines). The pull request changes nothing outside the folder (`metadata.toml` is the folder's own). The gate at this head passes every check (`build=0`, `imports=0`, `depcheck=0`, `blob=0`); `lake env lean` on `Suggested.lean` gives 14 `sorry` warnings and nothing else.

## Status of the previous review's findings

| r1 finding | Status at 2acede3 |
| --- | --- |
| R01 (P1) cycle with UnboundedOperators | Partly repaired: this README now consumes UO-D06 only (Scope lines 45–53, 2.3, 5.1) and plans no complexification; but UnboundedOperators at its open head still cites "VariationalMethods V2.3" as its supplier of coercivity and complexification. See R01 below. |
| R02 (P1) cycle with ComplexKahlerGeometry and PseudodifferentialOperators | Repaired: no `*Needs:*` line, contract or layer dependency names them; they are listed under Downstream consumers (lines 1040–1047); the geometric specialization and rows p22–p28 are gone. |
| R03 (P1) imports of a pull-request module, no build | Repaired: single `import Mathlib`; `operator`, `operator_spec`, `operatorDomain`, `operator_domain` deleted; build passes. |
| R04 (P2) re-planned complexification | Repaired on this side: lines 54–58 defer to GeneralizedCohomology G5.5-RealHilbert, which exists on main (README 1939–1960) with the stated laws; `P_R` is cited from UO-D06. |
| R05 (P2) absent headlines, definition as theorem | Repaired: `eigenvalue_eq_rayleighMinMax`, `mem_operatorDomainV_iff_summable`, `mem_operatorDomainV_iff_mem_adjoint_domain` stated; `differentialOperator` has a real body; `adjointProductDomain`/`exists_restricted_adjointProduct` deleted. |
| R06 (P3) blob links | Repaired (`blob=0`). |
| R07 (P3) shape, Lean names, namespace, unused hypotheses | Repaired: house shape with Scope, Conventions, contracts, layers with Checks/Examples/Dependencies, Downstream consumers, References; `hbelow` and `[CompleteSpace V]` removed where unused; namespace `TauCetiRoadmap.VariationalMethods`; docstring names the unstatable headlines. |
| R08 (P3) Math240 scan, `fderivWithin_eq_zero` | Repaired: the scan is gone, `IsLocalMinOn.fderivWithin_eq_zero` is written; no `sources.toml` was added, but no roadmap on main carries one, so this is not raised. |
| R09 (P3) overclaims about PDE, reflexivity, Eberlein–Šmulian | Repaired: PDE is a non-consumer (line 1048), Milman–Pettis is cited (268–271), the sequential-closure form is owned in 1.1 with Whitley's route (252–260). |

## R01 (P1) — The supply cycle with UnboundedOperators is still open at the supplier's head; the coercive solution over `𝕜` has no owner

Location: README lines 45–53 ("UnboundedOperators UO-D06 owns the closed-form representation theorem over `[RCLike 𝕜]`: the coercive solution map of a shifted Hermitian form over `𝕜` …"), 194–203, 496–497 ("Consume the coercive solution of UnboundedOperators UO-D06 over `[RCLike 𝕜]`"), 829–853, 1050–1051 ("UnboundedOperators UO-D06 is a supplier, not a consumer").

Claim: UO-D06 owns the `𝕜`-coercive solution map, the real/complex bridge and the represented operator, and nothing in this roadmap is cited by it.

Witness: OperatorTheory/UnboundedOperators README at its open head, line 63: "VariationalMethods V2.3 supplies scalar-generic coercivity, Hilbert complexification and the fixed real subspace"; line 508, in §4.7 (UO-D06): "Use native real Lax–Milgram and the scalar-generic coercive adapter specified in VariationalMethods V2.3"; line 559, its `*Needs:*`: "VariationalMethods V2.3 coercivity and complexification"; line 617, its Dependencies. So each roadmap cites the other for the Lax–Milgram adapter over `𝕜` and for the complexification bridge: the adapter is owned by neither, and the roadmap-level edge runs both ways. The dependency check cannot see it (UnboundedOperators is in neither the merge order nor main); placed after its last supplier as the brief prescribes, UnboundedOperators lands after this roadmap and every UO-D06 citation here is upward. UnboundedOperators also still cites `CompactFormPair.operator` (its line 540), a declaration this head deleted.

Repair: one direction of supply, decided once. The shape this README already has is the right one (UnboundedOperators earlier, owning the general representation; this roadmap consuming it), so the edit falls on the companion: UO-D06 must own its scalar-generic coercive adapter (Mathlib `IsCoercive.continuousLinearEquivOfBilin` on the realification `Re a_α`, recovered as `𝕜`-linear by the `I`-test of this README's 2.2) and cite GeneralizedCohomology G5.5-RealHilbert for the complexification, and delete every "VariationalMethods V2.3" supplier citation and the `CompactFormPair.operator` sentence. Until that head changes, this folder's Scope paragraph and 2.3 contract state something the cited supplier does not make. In this folder: keep 2.3's self-contained route (1.4 with 2.2) as the proof route, as now, and record in Scope that the adapter is UO-D06's and the route here is a second proof, not an owner. The alternative (this roadmap owns the adapter and UnboundedOperators consumes 2.3) is not available, since Layer 5 consumes UO-D06.

## R02 (P3) — Two declarations of `Suggested.lean` are not headlines

Location: `Suggested.lean` lines 80–86 (`zero_mem_weak_closure_embedded_unitSphere`), 131–141 (`exists_shifted_solution_maps`).

Witness: the first is the README's own negative control ("the counterexample that fixes the limits of these statements", 1.3 line 333, and 3.2's Check at line 618): a boundary statement mirroring a Check. The second is UO-D06's coercive solution applied to the shifted form of a pair (2.3 line 496: "Consume the coercive solution of UnboundedOperators UO-D06"): a specialization of a supplier's theorem, not a result this roadmap proves. Neither closes in one tactic (probe below), so they are not one-step padding, but neither is an end theorem.

Repair: delete both from `Suggested.lean`; the README keeps the counterexample as a 1.3 target and the solution maps as a 2.3 target. If R01 is resolved the other way (this roadmap owning the adapter), `exists_shifted_solution_maps` becomes a headline and stays.

## R03 (P3) — Three locator defects

Location: README lines 176–178 and 1071 (`TauCeti/Topology/Algebra/Module/LinearPMap/Resolvent.lean`); line 962 and 975–977 (Layer 6 sources and the convergence theorem); lines 651–654 (3.4, `fredholmAlternative_formPerturbation`).

Witness: at the pinned Tau Ceti there is no `Topology/Algebra/Module/LinearPMap/` directory; `LinearPMap.resolventSet` and `IsResolventAt` are defined in `TauCeti/Analysis/Normed/Operator/Resolvent/Unbounded.lean` (lines 104 and 168). Layer 6 cites Hunter Theorem 4.37 (p. 122), which is the spectral theorem for compact self-adjoint operators (hunter-pde-notes lines 6809–6815) and says nothing about Ritz values; the Ritz–Galerkin convergence theorem (`tendsto_rayleighMinMax`) has no locator at all. Tau Ceti `fredholmAlternative_formPerturbation` (`Variational/Fredholm.lean` line 132) is the dichotomy "nonzero homogeneous solution, or unique solvability for every forcing"; it does not state solvability for `ℓ` annihilating the kernel modulo the kernel, which is what 3.4 says it identifies.

Repair: write the Unbounded.lean path (and `Resolvent/Shift.lean` for the shift lemmas); give 6.1 a locator for Ritz–Galerkin convergence (for example Babuška–Osborn, "Eigenvalue problems", Handbook of Numerical Analysis II, 1991, §8, or Weinberger, *Variational Methods for Eigenvalue Approximation*, 1974, Chapter 3; cite by locator as uncertified if no open copy is found) and cite Hunter 4.37 only for Layer 4–5's spectral facts; in 3.4 say the Tau Ceti theorem supplies the alternative and the annihilator criterion is proved here.

## R04 (P3) — A Check uses the wrong model's vector

Location: README line 618 ("`(n+1) eₙ ∈ S_H` is unbounded and `0` is in the weak closure").

Witness: in the Layer 3 diagonal pair (line 580: `V = {u | Σ (n+1)² |uₙ|² < ∞}`, `j` the inclusion) `‖j((n+1)eₙ)‖ = n+1 ≠ 1`, so `(n+1)eₙ ∉ S_H`; the sphere element is `eₙ`, with `‖eₙ‖_V = n+1 → ∞`. The vector `(n+1)eₙ` belongs to the Layer 1–2 model (`V = ℓ²`, `(j u)ₙ = uₙ/(n+1)`, lines 339, 398, 546), which the README also calls "the diagonal pair" (line 547). The two models are unitarily equivalent (`u ↦ (uₙ/(n+1))`), so every other Check survives.

Repair: write `eₙ ∈ S_H` with `‖eₙ‖_V = n+1` at line 618, and give the two models distinct names (for example "the diagonal map on `ℓ²`" for Layers 1–2 and "the weighted pair" for Layers 3–6), or use one model throughout.

## R05 (P3) — Downstream consumers: say what replaces the deleted names

Location: README lines 1040–1046.

Witness: ComplexKahlerGeometry K5a on main (README 1049–1066, 1153, 1656) consumes "V5.1's `CompactFormPair.operator`", "V2.2–V2.4's RCLike coercive solution operator and its `toRealBilin` comparison" and the order "VM V2.3 → UO-D06 → VM V5.1", all pinned to the superseded head 515847c. `CompactFormPair.operator` and `toRealBilin` no longer exist; the represented operator is now any `A` with the graph of 5.1 (`exists_compact_selfAdjoint_shifted_inverse`, `operatorDomainV`). This is the consumer's drift, not a defect of this folder, but the Downstream paragraph is where K5a's repair will be read.

Repair: add one sentence to the ComplexKahlerGeometry bullet naming the current carriers (5.1's graph characterization and `operatorDomainV`, 2.2–2.3's `𝕜 = ℝ` identification with `IsCoercive.continuousLinearEquivOfBilin` and `formSolutionMap`).

## Verified sound

**Sampled targets** (the 15 seeded: 1.1, 1.2, 1.3, 1.4, 2.2, 2.3, 3.1, 3.2, 3.4, 4.2, 4.3, 4.4, 5.1, 5.3, 6.1) and all 20 declarations of `Suggested.lean`, checked against the texts, the pins and by computation.

**Elaboration.** `lake env lean TauCetiRoadmap/VariationalMethods/Suggested.lean`: 14 `sorry` warnings, no other output. A scratch copy with `#check @name` for all 20 declarations elaborated once; each type agrees with the worker's `signatures.md` and with its README statement. The six "dropped binder" leads are the five `def`s/structure (`CompactFormPair`, `energy`, `unitConstraint`, `rayleighMinMax`, `operatorDomainV`, `differentialOperator`) losing `[CompleteSpace E] [CompleteSpace H]`: correct, since their types do not need completeness; every theorem carries both. Convention check: `LinearPMap.adjoint_isFormalAdjoint : Dense T.domain → T.adjoint.IsFormalAdjoint T`, so `⟪D₀† y, x⟫ = ⟪y, D₀ x⟫`, matching Convention 4 and the 5.3 convention paragraph; `D₀`'s domain `range j` is dense (`P.dense`), so Mathlib's `if Dense … else 0` fallback in `LinearPMap.adjoint` (line 153) is not hit.

**One-tactic probe.** On a scratch copy each `sorry` was replaced by `first | rfl | simp | infer_instance | trivial | (intros; simp_all) | …`: none of the 14 theorems closes (7 "no applicable tactic", 7 unsolved goals after `simp`). No one-step padding.

**Adversarial table** (values computed on each side):

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| `exists_isMinOn_of_weak_closed` | `S` nonempty, `b = E s₀` | sublevel `{u ∈ S ∣ E u ≤ E s₀}` nonempty, bounded (hyp), weakly closed (closed `S`, lsc `E`); `isCompact_closure_of_isBounded` with surjective bidual inclusion makes its weak closure compact; `LowerSemicontinuousOn.exists_isMinOn` on it; minimum on the sublevel is a minimum on `S` | true | none |
| `exists_isMinOn_of_bounded_minimizing_sequence` | subsequence of `u` | bounded ⇒ weakly convergent subsequence `u_{n_k} ⇀ v` (B2); `hseqclosed`: `v ∈ S`; `hseqlsc` with `r = sInf`: `E v ≤ sInf ≤ E v` (nonempty, `BddBelow`) | true | none |
| same, without `hbelow` | `E = −Re⟨e₀,·⟩` on `ℓ²`, `u ≡ 0` | `sInf (E '' S) = 0` (junk, `Real.sInf_of_not_bddBelow`), `E(uₙ) = 0 → 0`, no minimizer | hypothesis necessary; README Check line 391 agrees | none |
| `compactMap_continuousOn_weak_bounded` | `K = closure (J '' B)` | `K` norm-compact; `J` weak-to-weak continuous; on compact Hausdorff `K` the weak and norm topologies coincide | true | none |
| `zero_mem_weak_closure_embedded_unitSphere` | basic weak nbhd `{∣f₁∣,…,∣fₘ∣ < ε}` | `⋂ ker fᵢ` has codim `≤ m < ∞`, contains `u ≠ 0`; `Ju ≠ 0`; `u/‖Ju‖` in the nbhd and on the sphere | true; mirrors a Check | R02 |
| `CompactFormPair` admits `E = 0`? | `E = 0`, `j = 0` | injective ✓, dense iff `H = 0` | only the zero pair; no wrong model | none |
| 2.2 expansion | Hermitian `a`, real `t` | `q(u+tv) = q(u) + 2t Re a(u,v) + t²q(v)`; `−2Re ℓ(u+tv) = −2Re ℓ(u) − 2t Re ℓ(v)` | holds | none |
| 2.2 `I`-test necessity | `𝕜 = ℂ`, `a u v = ū v`, `u = 1`, `v = i` | `Re(a u v) = 0`, `a u v = i ≠ 0`; with `iv = −1`: `Re = −1 ≠ 0` | Check line 481 correct | none |
| 2.2 kernel identity | `a = diag(1,−1)`, `u = (1,1)` | `q(u) = 0`, `a u (1,0) = 1` | needs `q ≥ 0`, as stated | none |
| `exists_shifted_solution_maps` scalar types | scalar `c` | `a_α(S(ch), v) = c̄⟨h, jv⟩ = a_α(cS h, v)` ⇒ `S` linear; `a_α(F(cℓ), v) = cℓ v = a_α(c̄ F ℓ, v)` ⇒ `F` conjugate-linear | matches `H →L[𝕜] E`, `StrongDual 𝕜 E →L⋆[𝕜] E` | none |
| 2.3 Check 1 | `V = H = ℂ`, `j = id`, `α = 0` | `S₀ h = h`; `F₀ ℓ = conj(ℓ 1)`; `F₀(iℓ) = −i F₀ ℓ` | Check line 518 correct | none |
| 2.3 norm bound | coercive `a_α` | `c‖u‖² ≤ Re⟨h, ju⟩ ≤ ‖h‖‖j‖‖u‖` ⇒ `‖S_α h‖ ≤ c⁻¹‖j‖‖h‖` | holds | none |
| 2.4 shift coercivity | `α ≥ ω` | `q + α‖j·‖² ≥ q + ω‖j·‖² ≥ c‖·‖²`; Check `q = −u²`: `c = 1, ω = 2`, `a₁ = 0` not coercive | holds; Checks 539–542 correct (`diag(1,−3)`: `ω = 4`, `a₄ = diag(5,1)`) | none |
| 3.1 finite sums | constants `cᵢ, ωᵢ` | `min c ‖u‖² ≤ Σ qᵢ + Σ ωᵢ‖jᵢuᵢ‖² ≤ q(u) + max ω ‖ju‖²` (each `‖jᵢuᵢ‖² ≥ 0`) | holds; Check line 585: `max(0,4) = 4` | none |
| 3.1 Check 1 | `𝕜ᵈ`, `j = id`, Hermitian `a` | `q(u) ≥ −‖a‖‖u‖²` ⇒ `‖u‖² ≤ q + (‖a‖+1)‖u‖²` | holds | none |
| 3.2 `exists_minimum_on_unitConstraint` | minimizing `uₙ ∈ S_W` | `c‖uₙ‖² ≤ q(uₙ) + ω` bounded; `uₙ ⇀ u`; `juₙ → ju` in norm (1.3) so `‖ju‖ = 1`, `ju ∈ W` (closed); `q + ω‖j·‖²` convex ⇒ weakly lsc ⇒ `q(u) ≤ liminf q(uₙ)` | true | none |
| 3.2 Check 3 | `W = span{(1/(n+1))ₙ}` | `Σ (n+1)²/(n+1)² = ∞` ⇒ `x ∉ V`, `S_W = ∅` though `W ≠ 0` | correct | none |
| 3.2 Check 4 | `(n+1)eₙ` in the Layer 3 pair | `‖j((n+1)eₙ)‖ = n+1 ≠ 1` | wrong vector; `eₙ` has `‖eₙ‖_V = n+1` | R04 |
| `equation_of_constrained_minimum` | path `(u+tv)/‖j(u+tv)‖`, `jv ∈ W` | `g(t) = q(u+tv) − q(u)‖j(u+tv)‖² ≥ 0 = g(0)` ⇒ `g'(0) = 2Re(a(u,v) − q(u)⟨ju,jv⟩) = 0`; with `I•v` (`I jv ∈ W`, a `𝕜`-submodule) the imaginary part | `a u v = q(u)⟨ju,jv⟩`; closedness of `W` unused, as the README says | none |
| 3.3 Check 3 | `ℂ²`, `a = diag(1,2)`, `u = (1,1)/√2` | `q(u) = 3/2`; `a u e₁ = 2/√2`; `(3/2)⟨u,e₁⟩ = 3/(2√2)` | unequal, as stated | none |
| 3.4 `δ > 0` and `W ≠ 0 ⇒ S_W ≠ ∅` | `H = jN ⊕ (jN)ᗮ`, `jN` finite-dim closed | `ju = jn + w` with `n ∈ N` ⇒ `w = j(u−n) ∈ range j ∩ W`; if `range j ∩ W = 0` then `H = jN` finite-dim and `W = 0`; a minimizer with `q = 0` lies in `N`, unit vector in `jN ∩ (jN)ᗮ` | holds | none |
| 3.4 Check 1 is a pair | `a u v = Σ n² ūₙvₙ` on the weighted `V` | `c(n+1)² ≤ n² + ω` for all `n`: `c = 1/2`, `ω = 1` works (`n = 1` extremal) | a compact pair; `N = span e₀`, `δ = 1` at `e₁` | none |
| 3.4 Check 3 | `𝕜²`, `a = 0` | `N = V`, `W = 0`, `S_W = ∅`, `H` finite-dim | matches the `W = 0` clause | none |
| 4.1 full equation | `v = uₖ`, `k < n` | `a uₙ uₖ = star(a uₖ uₙ) = star(λₖ⟨juₖ, juₙ⟩) = 0 = λₙ⟨juₙ, juₖ⟩` | holds | none |
| 4.1 `λₙ → ∞` | bounded subsequence `λ_{nₖ} ≤ M` | `c‖u_{nₖ}‖² ≤ M + ω`; compact `j` ⇒ norm-Cauchy subsequence of orthonormal `ju_{nₖ}`, but `‖juₙ − juₘ‖² = 2` | contradiction | none |
| 4.1 lower bound | `‖juₙ‖ = 1` | `c‖uₙ‖² ≤ λₙ + ω`, `uₙ ≠ 0` ⇒ `λₙ > −ω` | strict; Check line 715 (`λ₀ = −3 ≥ −4`) | none |
| 4.1 Check 4 | `u = e₀ + e₁` | `a`-complement `{v₀ + 4v₁ = 0}`, `H`-complement `{v₀ + v₁ = 0}`; for `u = e₀` both `{v₀ = 0}` | correct | none |
| `exists_ordered_eigenbasis`: `ℕ`-indexed basis | `¬FiniteDimensional 𝕜 H` | `j(ball)` relatively compact ⇒ separable; `range j = ⋃ n·j(ball)` dense ⇒ `H` separable; `H ≠ 0` infinite-dim ⇒ Hilbert basis indexed by `ℕ` | statable and true | none |
| 4.2 completeness | energy-orthogonal `v ≠ 0` | `a_α(uₙ, v) = (λₙ+α)⟨juₙ, jv⟩ = 0` ⇒ `jv ⊥ juₙ` ∀n ⇒ `v` admissible at every step ⇒ `λₙ ≤ q(v)/‖jv‖²` ∀n, contradicting `λₙ → ∞` | holds; `(V, a_α)` complete since `c‖u‖² ≤ q_α(u) ≤ (‖a‖ + α‖j‖²)‖u‖²` | none |
| 4.2 Check 3 | `𝕜²`, `a = diag(1,3)`, `j = id` | solution operator `a⁻¹ = diag(1, 1/3)`; `κ⁻¹ = 1, 3 = λ₀, λ₁` | correct | none |
| 4.3 energy Parseval | `eₙ = uₙ/√(λₙ+α)` | `a_α(uᵢ,uₖ) = (λₖ+α)δᵢₖ`; `∣a_α(eₙ,u)∣² = (λₙ+α)∣⟨juₙ,ju⟩∣²`; `q(u) + α‖ju‖² = Σ(λₙ+α)∣⋯∣²` | holds; Check line 764: `5 + 2 = 2·1 + 5·1 = 7` | none |
| 4.3 converse | `x` with `Σ(λₙ+α)∣⟨juₙ,x⟩∣² < ∞` | `w = Σ⟨juₙ,x⟩uₙ` converges in `(V,a_α)` (`‖uₙ‖²_α = λₙ+α`), `jw = x` | holds; Check line 766 (`1/(n+1)` not, `1/(n+1)²` yes) | none |
| `rayleighMinMax` well-defined | `M` of dim `n+1` | `‖ju‖ ≥ m > 0` on the unit sphere of `M` (compact, `j` injective) ⇒ quotient `≤ ‖a‖/m²`; quotient `≥ −ω` ⇒ `sInf` of a nonempty bounded-below set; `dim L ≤ n` ⇒ `sInf ∅ = 0` | matches Convention 6 | none |
| `eigenvalue_eq_rayleighMinMax` | `M = span{u₀..uₙ}`; any `M` of dim `n+1` | upper: `q(Σcₖuₖ) = Σλₖ∣cₖ∣² ≤ λₙΣ∣cₖ∣² = λₙ‖ju‖²`; lower: `u ≠ 0 ∈ M` with `⟨bₖ, ju⟩ = 0` for `k < n` (`n` conditions), `q(u) = Σ_{k≥n} λₖ∣⟨bₖ,ju⟩∣² ≥ λₙ‖ju‖²` using `λₖ > −ω` for the absolutely convergent shifted expansion | true with only `Monotone`; divergence unused, as stated | none |
| 4.4 Check 1, 2, junk | `diag(1,3,5)`, `n = 1` | planes: `span{e₀,e₁} ↦ 3`, `span{e₁,e₂} ↦ 5`; every plane meets `span{e₁,e₂}` ⇒ inf `= 3 = λ₁`; `rayleighMinMax (span e₀) 1 = sInf ∅ = 0` | correct | none |
| 4.4 PD conversion | PD-A51: `k`-th sorted (decreasing) eigenvalue `= sup` over `(k+1)`-dim of `inf` | `k = 0 ↦ 5 = λ₂`, `d−1−0 = 2` | correct | none |
| 4.4 interlacing | `L` codim `d`, `M'` of dim `n+d+1` | `dim(M' ∩ L) ≥ n+1` ⇒ `sup_{M'} ≥ λₙ(L)` ⇒ `λ_{n+d}(V) ≥ λₙ(L) ≥ λₙ(V)` | holds | none |
| `operatorDomainV` is a submodule | `c • u` | `a(cu, v) = c̄ a(u,v) = c̄⟨f, jv⟩ = ⟨cf, jv⟩` | proof compiles | none |
| `exists_compact_selfAdjoint_shifted_inverse` | `S = j ∘ S_α` | `a_α(S_α h, v) = ⟨h, jv⟩` ⇒ `(jS_αh, h − αjS_αh) ∈ graph` ⇒ `A(Sh) + αSh = h`; `x = ju ∈ dom`, `Ax = f`: `a_α(u,v) = ⟨f + αx, jv⟩` ⇒ `u = S_α(Ax+αx)`; compact (`j`); `⟨k, Sh⟩ = a_α(S_αk, S_αh) = star⟨h, Sk⟩ = ⟨Sk, h⟩` | true; `IsSelfAdjoint A` not needed as a hypothesis (the graph determines `A`) | none |
| 5.1 sign | `R_A(z) = (zI − A)⁻¹` | `R_A(−α) = (−α − A)⁻¹ = −(A+α)⁻¹`; `subScalar A (−α) = A − (−α)I = A + α` (`Shift.lean` 34) | Check line 862: `R_A(−α)e₀ = e₀/(−α−1) = −S_αe₀` | none |
| 5.1 Check 2 | `diag(1,−3)`, `ω = 4` | `α = 4`: `S₄ = diag(1/5, 1) > 0`; `α = 2`: `A + 2 = diag(3,−1)` | positivity only for `α ≥ ω`, as stated | none |
| `mem_operatorDomainV_iff_summable` (⇒) | `f` the representative | `⟨bₙ, f⟩ = star(a(w,uₙ)) … = λₙ⟨bₙ, jw⟩`; Parseval `Σ∣⟨bₙ,f⟩∣² = ‖f‖²` | summable | none |
| same (⇐) | `f = Σ λₙ⟨bₙ,jw⟩bₙ` | `λₙ > −ω` automatically (`c‖uₙ‖² ≤ λₙ + ω`); polarized shifted expansion `a(w,v) = Σ λₙ⟨jw,bₙ⟩⟨bₙ,jv⟩ = ⟨f, jv⟩` | true without `Monotone`/`Tendsto` | none |
| 5.2 Checks | `x = (1/(n+1)³)`, `(1/(n+1)²)` | `Σ(n+1)⁴/(n+1)⁶ < ∞`, `(Ax)ₙ = 1/(n+1)`; `Σ(n+1)⁴/(n+1)⁴ = ∞` | form domain ≠ operator domain, as stated | none |
| `mem_resolventSet_iff` (⇒) | `z = λₙ` | `Abₙ = λₙbₙ` (hA with `u = uₙ`, `λ` real); `R(zbₙ − Abₙ) = R 0 = 0 ≠ bₙ` | contradiction | none |
| same (⇐) | `z ≠ λₙ ∀n`, `λₙ → ∞` | `inf∣z − λₙ∣ > 0`; `R y = Σ(z−λₙ)⁻¹⟨bₙ,y⟩bₙ`, `‖R‖ ≤ 1/inf`; `Ry ∈ range j` (4.3 converse: `Σ(λₙ+α)∣cₙ∣² < ∞`) and `Σλₙ²∣cₙ∣² < ∞` (`λₙ/(z−λₙ)` bounded) ⇒ `Ry ∈ dom A`; `(z − A)Ry = y`, `R(z−A)x = x` | true; matches `IsResolventAt` fields (Unbounded.lean 104–110) | none |
| 5.2 Check (spectrum) | `z = 0`, `z = 4`; `ℓ = ⟨e₀, j·⟩`, `⟨e₁, j·⟩` at `λ = 1` | `‖R_A(0)‖ = 1 = 1/dist(0,{1,4,…})`; `(4−A)e₁ = 0`; `0·ū₀ = 1` no solution; `3ū₁ = 1` ⇒ `e₁/3 + te₀` | correct | none |
| `differentialOperator` / 5.3 identification | `y = Du`, `x = jv` | `⟨Du, D₀(jv)⟩ = ⟨Du, Dv⟩ = a u v`; continuity in `‖jv‖_H` ⇔ ∃`f`, `a u v = ⟨f, jv⟩` (Riesz on the dense `range j`); Mathlib convention gives `⟨D₀†(Du), jv⟩ = a u v` | true; `K` needs no completeness (adjoint requires `[CompleteSpace H]` only) | none |
| 5.3 graph norm | `‖ju‖² + ‖Du‖²` | `≤ (‖j‖² + ‖D‖²)‖u‖²`; `≥ min(1, c/max(1,ω))·‖u‖²`-type bound from `c‖u‖² ≤ ‖Du‖² + ω‖ju‖²` | `D₀` closed | none |
| 5.3 Checks | `(Du)ₙ = (n+1)uₙ`; `D = 2·id` on `ℂ` | `dom D₀† = {((n+1)yₙ) ∈ ℓ²}`; `Du ∈ dom D₀†` iff `((n+1)²uₙ) ∈ ℓ²`; `u = (1/(n+1)²)`: `(n+1)·1/(n+1) = 1` not square-summable; `D₀†(Du) = 4u` | correct; `LinearPMap.comp` inapplicable as stated | none |
| `tendsto_rayleighMinMax` | lower / upper | `dim Vₘ ≥ n+1` ⇒ `rayleighMinMax Vₘ n ≥ rayleighMinMax ⊤ n = λₙ`; nested + dense ⇒ `u₀..uₙ` approximable in one `Vₘ`, Gram matrix near `I`, sup on the approximating span within `ε` of `λₙ`; `dim Vₘ → ∞` since `E` is infinite-dim | true; nesting needed (alternating `Vₘ` breaks the upper estimate) | none |
| 6.1 Checks | `𝕜²`, `a = diag(1,3)`, `φ₁ = e₀`, `φ₂ = e₀+e₁` | `A = [[1,1],[1,4]]`, `G = [[1,1],[1,2]]`, `det(A − λG) = (1−λ)(3−λ)`; `A` alone: `(5 ± √13)/2`; `V₁ = span{e₀+e₁}`: `5/2`, `G = 2` | correct | none |
| 6.2 noncompact example | `a = Σ(1 + 1/(n+1))ūₙvₙ`, `j = id` | `q(u) > ‖u‖²` for `u ≠ 0`, inf `= 1` not attained; `A − 1 = diag(1/(n+1))` unbounded inverse; spectrum `{1 + 1/(n+1)} ∪ {1}` | correct | none |
| 6.2 non-dense `J` | `V = 𝕜`, `H = 𝕜²`, `Ju = (u,0)` | `S h = h₁`, `J S = diag(1,0)`, kernel `span e₁ = (range J)ᗮ` | matches `ker_formSolutionOperator` (Spectrum.lean 210) | none |
| Layer 4 Example | `sin x + sin 2x` on `(0,π)` | `∫(cos x + 2cos 2x)² = 5π/2`, `‖u‖² = π` ⇒ `5/2`; CF with `n = 1` on the span: `4` | correct | none |
| 1.1 sequential-closure form of Eberlein–Šmulian | Whitley's route | `D = ⋃Dₙ` is `1/2`-norming on `Y` by density and continuity; `(aₙ)` in compact `K` has a cluster point `y ∈ Y` (weakly closed); `f(y−x) = 0` on `D` ⇒ `y = x`; unique cluster point in a compact set ⇒ convergence | route sound; B2 states only the compactness equivalence, so ownership here is right | none |
| 1.2 Mazur Check | `u_{2n} = eₙ`, `u_{2n+1} = 2eₙ` | `liminf ‖uₙ‖² = 1`, `limsup = 4`; tails contain energy `4` | Check line 312 correct | none |
| 2.1 Check 3 | discs centred `(∓1, 0)` | `C₁ ∩ C₂ = {0}`; `∂ι_{{0}}(0) = ℝ²`; `N_{C₁}(0) = {(t,0) ∣ t ≥ 0}`, `N_{C₂}(0) = {(t,0) ∣ t ≤ 0}`, sum `ℝ × {0}` | sum rule fails without continuity, as stated | none |

**Library declarations opened at the pin.** Tau Ceti: `Variational/Spectrum.lean` 93 (`formSolutionMap`), 104, 110, 128 (`formSolutionOperator`), 140, 146, 210, 340, 393, 434–445 (`exists_hilbertBasis_forall_apply_eq_smul_inner`: real coercive `B`, compact dense `J`, symmetric, `s`-indexed basis, as the README says); `Variational/Rayleigh.lean` 130 (`isLeast_rayleighQuotient`: compact `J ≠ 0`, symmetric), 149; `Variational/Fredholm.lean` 65, 84, 121, 132 (dichotomy, R03); `Analysis/PDE/Spectrum.lean` 146, 218, 296 (`firstDirichletEigenvalue`), 544; `Analysis/Convex/Subdifferential.lean` 70, 77; `FenchelMoreau.lean` present; `Analysis/Normed/Operator/Resolvent/Unbounded.lean` 104 (`IsResolventAt`), 168 (`resolventSet`), 199 (`resolvent`); `Resolvent/Shift.lean` 88, 97; `LinearAlgebra/LinearPMap/Shift.lean` 34 (`subScalar A ω = (−ω • id) +ᵥ A`); `InnerProductSpace/LinearPMap/SelfAdjoint.lean` 249 (`IsSelfAdjoint.smul_sub_bijective`); no `spectralMeasure`/`ProjValMeasure` anywhere in Tau Ceti, so the docstring's "not statable" claims for SA-E03/E05 hold. Mathlib: `LocallyConvex/WeakSpace.lean` 40, 60; `Normed/Module/DoubleDual.lean` 115, 145–149 (`isCompact_closure_of_isBounded` needs bounded preimage and the bidual range condition); `Topology/Semicontinuity/Basic.lean` 77; `Calculus/LocalExtr/Basic.lean` 15, 143, 165; `Calculus/LagrangeMultipliers.lean` 86; `Normed/Operator/NormedSpace.lean` 318 (`IsCoercive`, real only); `InnerProductSpace/LaxMilgram.lean` 105, 113; `InnerProductSpace/Basic.lean` 956 (`InnerProductSpace.rclikeToReal`); `InnerProductSpace/Convex.lean` 36; `InnerProductSpace/Rayleigh.lean` 56, 258, 296; `Topology/Algebra/Module/LinearPMap.lean` 59 (`LinearPMap.IsClosed`); `InnerProductSpace/LinearPMap.lean` 73, 89, 151–153; `Algebra/Module/Submodule/Equiv.lean` 165; `LocallyConvex/Separation.lean` 94; `Normed/Operator/Compact/Basic.lean` 462; `Complex/Basic.lean` 82; `l2Space.lean` 376–378; `Matrix/Hermitian.lean` 44; `HahnBanach.lean` 66; `Real.sInf_of_not_bddBelow`. Mathlib has no reflexivity notion for normed spaces, no Eberlein–Šmulian, no Courant–Fischer or Ritz, and no weak-to-norm lemma for compact operators: Layers 1, 4 and 6 are new work.

**Cross-roadmap citations resolved.** BanachSpaceTheory B1 (main lines 41–72: Goldstine, bipolar, convex closure agreement, finite-convex-combination Mazur, evaluation criteria) and B2 (74–104: Eberlein–Šmulian with relative version, reflexivity iff weakly compact ball, James with finite norming sets, Milman–Pettis); GeneralizedCohomology G5.5-RealHilbert (1939–1960); SelfAdjointSpectralTheory SA-C39–C43 (888–895), SA-C76–C85 (978–997), SA-D01–D02 (937), SA-D17–D22 (1103–1113), SA-E01, E03, E05 (1202–1211); PolarDecomposition PD-A50–A53 (252–262; PD-A51 is sup over `(k+1)`-dim of inf, decreasing order, so Convention 5's `k ↦ d−1−k` is right); UnboundedOperators UO-D06 at its open head (§4.7, lines 495–560; `existsUnique_selfAdjoint_of_closed_form` in its `Suggested.lean` with exactly this roadmap's pair hypotheses and graph) — see R01 for its reverse citations; ComplexKahlerGeometry K5a on main (R05); PseudodifferentialOperators at its open head consumes K5a (lines 18, 78–85) and is not cited here. Dependency check: `depcheck: 207 roadmaps, 1467 edges, 0 problem(s)`, no UPWARD or CYCLE line (it cannot see UnboundedOperators, R01). Ownership sweep over main and the 434 open heads (`roadmaps grep`): Courant–Fischer owned by PolarDecomposition and consumed here (Majorization and RandomMatrices consume it); Ritz only in SpectralSubspacePerturbation (Ritz residuals, a different object); "direct method", "weakly lower semicontinuous", `rayleighMinMax`, `CompactFormPair` nowhere else except the consumers UnboundedOperators and ComplexKahlerGeometry; Lax–Milgram over `𝕜` planned nowhere else (PDE, CalibratedGeometry, ComplexComparisonPartII consume the real native one); Friedrichs extension owned by UnboundedOperators, consumed by CongruenceSpectralGap, AutomorphicSpectralTheory, MaassForms.

**Sources read.** `ivrii-pde-13-1` (author page): Theorem 1 lines 65–68, Theorem 4 lines 101–118 (items 1–3: ordered eigenvalues to `∞` with a basis; first minimum; successive minima under `(u, uᵢ) = 0`), proof lines 120–142 (divergence by orthonormality and compactness at 136–137, completeness through the `K`-inner product at 139–142), Remark 2 lines 144–149, Corollary 1 lines 152–168; all agree with the 1.4, 3.2, 4.1, 4.2 and 4.4 citations, including the obstacle-count correction. `hunter-pde-notes` (author page; printed page = page marker − 6): Definition 4.3 line 5103 (p. 93), Proposition 4.5 lines 5157–5173 (p. 94; derivative with gap `½∫∣Dh∣²`), Corollary 4.6 and the direct-method remark lines 5185–5193 (p. 95), Theorem 4.20 lines 5739–5745 (p. 103, real Lax–Milgram), Theorem 4.21 lines 5748–5758 (p. 103, Gårding constant `γ`), Theorem 4.22 lines 5865–5882 (p. 105), §4.8 lines 5900–5936 with (4.26) at 5918 and compactness at 5932–5936 (p. 105–106), Theorem 4.25 lines 6057–6076 and Example 4.26 lines 6079–6086 (p. 109), the alternatives lines 6087–6103 (p. 109–110), Theorem 4.37 lines 6809–6815 (p. 122).

## Not verifiable

- Ownership against open pull requests was checked through the project's roadmap index (grep over the 434 open heads) and by reading UnboundedOperators, ComplexKahlerGeometry and PseudodifferentialOperators; the other sibling folders were not read line by line.
- No source states the Ritz–Galerkin convergence theorem of 6.1 (R03); it was checked by computation only.

## Source issues

- **Error** in ivrii-pde-13-1 at Corollary 1, proof (lines 162–168): the proof takes a nonzero vector of an n-dimensional subspace orthogonal to the first n eigenfunctions and bounds by λ_{n+1}; it should be orthogonal to the first n−1, giving λ_n; affects the proof.
- **Misprint** in ivrii-pde-13-1 at Theorem 4, proof step 1 (lines 123–124): a broken sentence cites "Theorem 1(3)" for the trace estimate; it should be Theorem 3, part (3), inequality (13.1.6); affects nothing.
- **Misprint** in hunter-pde-notes at Theorem 4.22, printed p. 105 (lines 5867–5869): the Dirichlet problem is written with the forcing multiplied by the shift; it should read `Lu + µu = f`, as the proof (line 5873) uses; affects nothing.
- **Gap** in hunter-pde-notes at Theorem 4.25, printed p. 109 (lines 6057–6059): states the first eigenvalue is simple (`λ₁ < λ₂`) for a general symmetric uniformly elliptic operator on a bounded open set; the compact-resolvent proof gives only `λ₁ ≤ λ₂`, and strictness fails on a disconnected set; affects a stated result.
