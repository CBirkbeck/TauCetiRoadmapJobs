# FIX-RT-SchrodingerOperatorsAndSpectralTypes~1

Repair of red-team round 1 (passes a and b) of `packages/SchrodingerOperatorsAndSpectralTypes`.
Eight findings, one pair overlapping (1a/F02 = 1b/F01), settled in seven sections.

## RT-SchrodingerOperatorsAndSpectralTypes~1a/F01 (P2) — applied

§4.3 route: "Hilbert–Schmidt energy … `‖V_R‖₂² ‖f_R‖₂²` (Parseval … and Plancherel)" → the kernel
`K_R` is square-integrable; AutomorphicSpectralTheory §0.8 (`hilbert_schmidt_kernel`) gives energy
`‖K_R‖₂²`; Tonelli, translation invariance and `MeasureTheory.Lp.norm_fourier_eq` give
`‖V_R‖₂²‖f_R‖₂²`. The norm convergence is now stated explicitly. Added: §0.8 in the 4.3 *Needs:* line,
Layer 4 Dependencies, a Scope bullet and a "From TauCetiRoadmap.AutomorphicSpectralTheory" contract.

## RT-SchrodingerOperatorsAndSpectralTypes~1a/F02, RT-SchrodingerOperatorsAndSpectralTypes~1b/F01 (P2) — applied

§1.1 second law: "If `IsSpectralMeasureOf A P` and `U` unitary …" → "If `A` is self-adjoint, …",
with the reason (SA-D18, `LinearPMap.resolvent_eq_of_isResolventAt`). New Check: `A = ⊥` on `ℂ²`
(1b's witness). 1a's witness `A = i` on `ℂ` fails: no `P` satisfies the predicate (computed at
`z = 2i`), so the law holds vacuously there.

## RT-SchrodingerOperatorsAndSpectralTypes~1a/F03 (P2) — applied

New headline `laplacian_add_potential_isSelfAdjoint_closure` (§3.9): on a complete manifold, for
real `V` with `MemLp V ⊤`, the closure of `Δ + V` on test functions is self-adjoint, is bounded below
by `essInf V`, and has 3.6's maximal domain. That domain clause, beyond the proposal, matches the
README's "closure `Δ_X + V`". The §3.9 route and the docstring list are updated.

## RT-SchrodingerOperatorsAndSpectralTypes~1a/F04 (P3) — applied

§3.7: "connected with `vol_g(X) < ∞` and `0 ∉ closure(σ(Δ_X) ∖ {0})`, then `λ₁⁺ = λ₁`" →
"connected with `vol_g(X) < ∞`, then `λ₁⁺ = λ₁`", with a two-case route: `0` isolated gives a simple
eigenvalue and `μ₂` is the next spectral point (1.6); otherwise `0 ≤ λ₁ ≤ inf σ_ess = 0`.

## RT-SchrodingerOperatorsAndSpectralTypes~1a/F05 (P3) — applied

§1.8 *Needs:* "Mathlib Plancherel" → "Mathlib `MeasureTheory.Lp.norm_fourier_eq` (Plancherel on
`L²`) and `MeasureTheory.Lp.fourierTransformₗᵢ`" (pin: `Mathlib/Analysis/Fourier/LpSpace.lean`
lines 51, 90). The route now explains the factor `2π`: `t = 2πτ` turns Mathlib's kernel `e^{−2πi⟨x,ξ⟩}`
into `∫|∫e^{−itλ}g|² dt = 2π‖g‖₂²`. `norm_fourier_eq` is added to the Mathlib contract. The same
pattern in §4.3 is repaired under 1a/F01.

## RT-SchrodingerOperatorsAndSpectralTypes~1a/F06 (P3) — applied

Deleted from the supplier contracts: `TauCeti.HyperbolicMetric` (no Check used it), `TauCeti.W1p`,
and Mathlib `UpperHalfPlane`. Each occurred only in its own row. All three exist at the pins
(`TauCeti/Geometry/Manifold/Riemannian/Hyperbolic.lean:51`, `TauCeti/Analysis/Sobolev/W1p/Basic.lean:372`);
they are simply unused. The row now reads "`TauCeti.Wkp` in `TauCeti/Analysis/Sobolev/` …".

## RT-SchrodingerOperatorsAndSpectralTypes~1b/F02 (P3) — applied

The three named lines are fixed. §3.2 gains HilbertModules H6. §1.6's line moves after "The statement
without spectral projections" and gains SA-D12, SA-D22, SA-E08. §4.4 gains 1.4. A scan of every
*Needs:* line found the same omission elsewhere, also fixed: 1.1 (SA-D18, resolvent lemmas, `diag`),
1.3 (UO-C03), 1.4 (SA-B44), 3.2 (locally-finite instance), 3.6 (3.1), 3.9 (K5a), 4.2 (UO-E06),
4.4 (4.1).

## Checks run

**Elaboration.** `lake env lean packages/SchrodingerOperatorsAndSpectralTypes/Suggested.lean`, run
from the content checkout: no errors and 12 warnings, all `declaration uses 'sorry'`. That is the
11 earlier theorems plus the new one. All `TauCeti.*` imports were already built; no import changed.

**Binder check.** All 19 declarations were checked with `#check @name` in one scratch file (a copy of
`Suggested.lean` with the checks appended, kept outside the repository). Each elaborated type was
compared with its README statement. The 18 earlier declarations are textually unchanged (the diff of
`Suggested.lean` deletes only three docstring lines) and match the signature file. The new
`laplacian_add_potential_isSelfAdjoint_closure` keeps every binder of `gaffney_isSelfAdjoint_closure`
plus `(V : M → ℝ)` and `MemLp V ∞ (TauCeti.riemannianVolume I M)`. Its conclusion has three clauses:
`IsSelfAdjoint T.closure`, the maximal-domain characterisation, and the `essInf V` lower bound. No
binder was lost.

**Dependency check** (command of the brief):

    depcheck: 239 roadmaps, 2260 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line. The new edge goes to AutomorphicSpectralTheory, which is line 101
of `merge-order/ORDER.txt`; this roadmap is line 221.

**Citation resolver** (`roadmaps resolve` on the README): no cross-roadmap citation and no Lean name
was found missing anywhere.

**Gate failures listed in the brief:** none.

## Adversarial pass (statements added or changed)

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §1.1 transport law (self-adjoint `A`) | `A = 2` on `ℂ`, `U = e^{iθ}`, `P = δ₂`; `A = diag(1,2)`, `U` = swap, `f = (1,0)` | `(i−2)⁻¹ = (−2−i)/5` both sides; `⟪f,(i−diag(2,1))⁻¹f⟫ = (i−2)⁻¹ = ∫(i−s)⁻¹dδ₂`, the measure of `f` under `UPU⁻¹` | true | hypothesis added |
| same, non-self-adjoint `A = ⊥` on `ℂ²` | every `z` | `z − A : 0 → ℂ²` not onto, so `ρ(A) = ∅`; `resolvent A z` is `Classical.choose` of a trivially true statement (`Resolvent/Basic.lean:155–170`), hence unspecified | law unprovable | Check added |
| same, `A = i` on `ℂ` (1a's witness) | `z = 2i`, `f = 1` | left side `(2i−i)⁻¹ = −i`, imaginary part `−1`; right side imaginary part `∫ −2/(s²+4) dμ ∈ [−1/2, 0)` for probability `μ` | predicate never holds; law vacuous | recorded in the Check |
| §3.7 `λ₁⁺ = λ₁` (connected, finite volume) | circle of length `2π`; a point; finite-area end `dr² + r⁻⁴dθ²`; two circles; `ℝ` | `σ = {n²}`: `λ₁⁺ = 1 = μ₂`; `σ = {0}`: `+∞ = +∞`; `0 ∈ σ_ess`: `0 = 0`; `λ₁⁺ = 1 ≠ 0 = λ₁` (excluded: not connected); `0 = 0` (infinite volume, holds anyway) | true without the isolation clause | clause dropped, route added |
| `laplacian_add_potential_isSelfAdjoint_closure` | `M = ∅`; circle, `V = 1`; `V = 0`; circle, `V = 1_{[0,π)}`; `M = ℕ` discrete, `V(p) = −1/(p+1)`; `V = −x⁴` on `ℝ`; `(0,1)` | `L² = 0`: `0·essInf = 0 ≤ 0`, domain clause holds with `w = 0`; eigenvalues `n²+1 ≥ 1 = essInf`, attained at `n = 0`; `0 ≤ ⟪u,Δu⟫` (Gaffney); Rayleigh quotient of `1` is `1/2 ≥ 0`; `Δ = 0`, closure `M_V` on `ℓ²`, `Σ V(p)|x_p|² ≥ −‖x‖²`, domain all of `ℓ²` (`w = 0`); not ess. s.a., excluded by `MemLp V ⊤`; deficiency `(2,2)`, excluded by `CompleteSpace` | true | new headline |
| same, junk values | `essInf` over the zero measure | `essInf V 0 = 0` in `ℝ` (liminf over `⊥`), multiplied by `‖x‖² = 0` | harmless | none |
| §4.3 kernel norm | `d = 1`, `V = 1_{[−1,1]}`, `R = 1` | `‖V_R‖₂² = 2`; `‖f_R‖₂² = 1/(1+4π²) + arctan(2π)/(2π) = 0.249585` (quadrature gives the same 0.249585); `‖K_R‖₂² = 0.499170 < ∞` | finite, §0.8 applies | owner cited |
| §4.3 norm convergence | `R = 1` | `sup_ξ |(4π²ξ²+1)⁻¹ − f_R(ξ)| = (4π²+1)⁻¹ = 0.024705`; `‖V − V_R‖_∞ ≤ ε` for `R ≥ R_ε` | `→ 0` | stated |
| §1.8 factor `2π` | `g = 1_{[0,1]}`; `x = m·1_{[0,1]}`, `C = ⟨φ,·⟩φ` | `∫(2 − 2cos t)/t² dt = 2π = 2π‖g‖²` (quadrature on `[−2000, 2000]` gives 6.28118, and the tail adds 0.002); `2πm²` both sides (the existing Check) | consistent | declaration named |
| §1.6, §3.2, §4.4 *Needs:* additions | the ids used in each section's own text | SA-D12, SA-D22, SA-E08 (main SA README lines 1086, 1113, 1217), H6, 1.4, 4.1 are all earlier in the build; 1.4 and 4.1 come before 4.4 | no cycle, Layers 1 and 2 still independent | lines extended |

## For the maintainer

- **New supplier edge.** 4.3 now consumes AutomorphicSpectralTheory §0.8 ("Measurable
  Hilbert–Schmidt kernels"). That roadmap is still an open pull request; it is listed earlier in
  the merge order (line 101 < 221), and the dependency check is clean. Main has no general owner of
  this statement. UnboundedOperators UO-E01 works on `L²(ℝ)` kernels for its counterexamples, and
  CompactGroups covers continuous kernels on compact spaces only.
- **New Lean name.** `TauCetiRoadmap.SchrodingerOperatorsAndSpectralTypes.laplacian_add_potential_isSelfAdjoint_closure`.
  No name that other roadmaps cite was changed or removed. No section id changed; the §1.6 *Needs:*
  line only moved.
- **Ownership.** For the bounded-potential statement on manifolds and for the kernel theorem, I
  searched main and all 455 open heads with `roadmaps grep`. That covers more than the 233 open pull
  requests whose files the brief lists. The only owner found is the one cited above.
- **Unchanged.** `sources.toml`, `metadata.toml` and the `gaps` list of `design/plan.json` (no new
  supplier gap) are untouched. No new source is cited, and nothing was added to
  `needs-references.toml`.
- **Untrusted text.** The reviews contained nothing that asked for anything outside the job.
