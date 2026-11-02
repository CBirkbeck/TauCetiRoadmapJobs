# Review of CotangentLagrangian (pull request #1651 at c7860ab)
Folder: `TauCetiRoadmap/SymplecticGeometry/CotangentLagrangian/`
**Verdict:** needs changes

The consumer signature still needs the adjustment specified in R01. The new downstream prose repairs the contract documentation, but not the failing call. Two nonblocking companion-file findings also remain. The scope-aware gate, targeted build and direct Suggested.lean elaboration pass.

:robot: AI review. Incremental re-review of 33 changed lines since 307ff10. Only the added downstream contract and reference, their interfaces, and the previous findings were reviewed afresh; unchanged mathematical evidence is attributed below. No pull-request file was changed.

## R01 (P2) — The documented form interface is still not used by its consumer

**Location:** `TauCetiRoadmap/SymplecticGeometry/CotangentLagrangian/README.md:503`–516 and `TauCetiRoadmap/SymplecticGeometry/HamiltonianReduction/Suggested.lean:76`: `HasHamiltonianField (canonicalForm (M := M) I)`.

**Claim:** the new downstream paragraph correctly specifies an explicit symplectic form with the canonical chart identity, but the consumer still calls the deleted intrinsic `canonicalForm`. The targeted build does not include HamiltonianReduction. Documentation alone therefore does not complete the supplier-interface repair.

**Witness:** an unchanged scratch copy of HamiltonianReduction's Suggested.lean exits 1 at 76:39: `Invalid argument name M for function`. Replacing that form argument with the explicit form and chart hypotheses below exits 0, with five `sorry` warnings only.

**Exact repair:** coordinate the remaining HamiltonianReduction signature adjustment, retaining the new downstream contract. Replace its theorem header and form argument with the following, leaving the Hamiltonian function and lifted vector field unchanged. Do not restore sorry'd form data. This is a required sibling repair, not an edit made by this review.

```lean
theorem cotangentMomentum_hamiltonian [FiniteDimensional ℝ E]
    (σ : TauCeti.SmoothTwoForm (cotangentModel I) (Cotangent I M)) (hσ : σ.IsSymplectic)
    (hchart : ∀ (z₀ : Cotangent I M) (w : E × (E →L[ℝ] ℝ)),
      w ∈ (extChartAt (cotangentModel I) z₀).target →
      ∀ v : Fin 2 → (E × (E →L[ℝ] ℝ)),
        σ.inChartAt z₀ w v = TauCeti.strongDualCotangentSymplecticForm (v 0) (v 1))
    (ha : ContMDiff (IG.prod I) I ∞ (fun gx : G × M ↦ gx.1 • gx.2))
    (ξ : GroupLieAlgebra IG G) :
    HasHamiltonianField σ
```

The full repaired declaration was elaborated at this head. On translations of ℝ, `X=(1,0)`, `H=p`, and evaluation on `(a,b)` gives `σ(X,(a,b))=b=dH(a,b)`; the chart hypothesis excludes `2σ`, which gives `2b`. Thus the tested repair preserves the Hamiltonian sign and fixes the interface failure.

## R02 (P3) — The companion still uses the forbidden import form and old header

**Location:** `TauCetiRoadmap/SymplecticGeometry/CotangentLagrangian/RelativeDarbouxTargets.lean:1`–12, including `import Mathlib.LinearAlgebra.Dimension.Finrank`.

**Claim:** the per-file Lean rules require `import Mathlib` followed by used Tau Ceti modules and a target-signatures module docstring. This companion still lacks both the required import and header. The gate's import counters do not cover this defect.

**Witness:** lines 1–2 import Tau Ceti and a Mathlib submodule; lines 4–12 do not give the required title or headline-at-the-pins description.

**Exact repair:** use `import Mathlib` followed by `import TauCeti.Geometry.Symplectic.SymplecticTransport`. Title the module docstring “Relative Darboux, linear step: target signatures”, identify README.md as the roadmap, and describe the C4 Witt-extension headline on the pinned carrier. The changed imports with the retained extension theorem elaborate. The test `S=T=ℝ·(1,0)`, `f(q)=2q` still admits `e=diag(2,1/2)`, with symplectic coefficient `2·(1/2)=1`.

## R03 (P3) — Delete the one-term specialization from the acceptance test

**Location:** `TauCetiRoadmap/SymplecticGeometry/CotangentLagrangian/RelativeDarbouxTargets.lean:32`–38, `symplectic_extension_fixing_subspace`.

**Claim:** this specializes the preceding extension theorem to `W=V`, `T=S`, `f=id`. It is acceptance-test padding even though its proof is supplied.

**Witness:** line 38 closes it with `exact symplectic_subspace_extension ω₀ ω₁ rfl S S (LinearEquiv.refl ℝ S) hS`.

**Exact repair:** delete it from `Suggested.lean`'s companion acceptance test, `RelativeDarbouxTargets.lean` (lines 32–38); keep the specialization in README C4. A scratch copy after deletion and the R02 import adjustment elaborates with one `sorry` warning. For `ω₁=2ω₀` on ℝ² and S the q-axis, the retained theorem gives the same specialization: `diag(1,1/2)` fixes S and pulls `2dq∧dp` back to `dq∧dp`.

## Previous findings

- R01 — partly repaired: `README.md:498`–528 adds the correct explicit-form downstream contract and discriminating Checks. `HamiltonianReduction/Suggested.lean:76` still uses the deleted form and fails elaboration; the remaining consumer repair is R01 above.
- R02 — not repaired: `RelativeDarbouxTargets.lean:1`–12 still contains the Mathlib submodule import and old module header; the file is unchanged.
- R03 — not repaired: `RelativeDarbouxTargets.lean:32`–38 still contains the one-term fixing-subspace specialization; the file is unchanged.

## Verified sound

**Scope and gate.** Git confirms head `c7860ab6e3ef2bc06500be50d75677c787f38a6d`, exactly 33 inserted README lines since 307ff10, unchanged Lean files and pins, and a clean worktree. There are no changes since that review outside the folder. The origin/main comparison outside the authorized three folders and family index is empty.

The worker's scope-aware gate at this head has every counter zero, including `build=0`, and reports `OK`. The literal single-folder gate rerun reports all content counters zero except `outside-folder=6`, naming exactly:

- `TauCetiRoadmap/SymplecticGeometry/ConvexityToric/BottSamelsonMomentTargets.lean`
- `TauCetiRoadmap/SymplecticGeometry/ConvexityToric/FixedLocusTargets.lean`
- `TauCetiRoadmap/SymplecticGeometry/ConvexityToric/README.md`
- `TauCetiRoadmap/SymplecticGeometry/ConvexityToric/Suggested.lean`
- `TauCetiRoadmap/SymplecticGeometry/IntegrableSystems/AnnulusFixedPointTargets.lean`
- `TauCetiRoadmap/SymplecticGeometry/IntegrableSystems/README.md`

These six paths are explicitly authorized siblings in the brief, so this is a scope false positive, not a finding. That raw invocation stops before building; I separately ran the prescribed two-module targeted build, which completed successfully (9000 jobs).

The dependency check reports:

```text
depcheck: 205 roadmaps, 1591 edges, 0 problem(s)
```

No UPWARD or CYCLE line occurs. The added HamiltonianReduction R1 reference explicitly describes a downstream consumer; it is not a new prerequisite. No new foundational construction, route-specific restriction, copied source passage, computational algorithm or supplier gap was introduced.

**Elaboration and signatures.** Direct `lake env lean` on Suggested.lean exits 0 with seven `sorry` warnings only. Scratch copies with `#check @` for all 13 named declarations there and both companion declarations elaborate. I compared the emitted types with the README and prior signatures: no binder changed. `canonicalForm_exists` keeps finite dimension; `liouville_inChart` additionally keeps boundarylessness; `liouville_section` keeps the smooth-section hypothesis. The group theorems keep compactness, symplectic membership and unitary inclusion, and the Witt theorem keeps both finite-dimensional instances and the dimension equality. The original and repaired consumer probes respectively exit 1 and 0. The companion import/deletion repair exits 0 with one `sorry` warning.

**Headline coverage and padding.** The unchanged acceptance headlines are canonical cotangent-form existence; the chart and section Liouville identities; maximal compactness of U(n) in GL(n,ℂ) and of realified U(n) in Sp(2n,ℝ); connectedness of GL(n,ℂ) and Sp(2n,ℝ); and symplectic Witt extension (eight admitted headlines). The README also targets generating transformations, fixed-point/chain dictionaries, convex billiards, relative Moser and neighborhood germs. Suggested.lean's module docstring identifies the missing manifold exterior derivative, open-cotangent symplectomorphism, germ and symplectic-bundle carriers. The unchanged one-tactic probes are carried forward from review ~4 and its cited earlier evidence; this diff adds no Lean declaration. The companion's explicit single-`exact` specialization is freshly confirmed as R03.

**Adversarial table.** There are 43 rows: all 36 rows of review ~4 are carried forward with their computed values and attribution, followed by seven fresh rows covering the new contract, equation and Checks. Inherited numerical experiments were not rerun. The original consumer failure and both repair probes were rerun as recorded above. The five seeded targets and all acceptance headlines remain represented.

| Statement | Instances tried | Values | Result | Change / provenance |
|---|---|---|---|---|
| `realify` convention | `A = i·I`, `n = 2` | `realify(i·I) = fromBlocks 0 (−1) 1 0 = Matrix.J (Fin 2) ℝ` (`SymplecticGroup.lean` line 58) | multiplication by i is J, as README line 124 says | Carried forward from [review ~4](PRREVIEW-CotangentLagrangian~4.md); unchanged statement |
| `realify` is a homomorphism commuting with J | random complex `A, B` | `realify(AB) = realify(A)·realify(B)` to `10⁻⁹`; `realify(A)·J = J·realify(A)` | holds; the wrong model `[[X, Y],[−Y, X]]` would send i to −J | Carried forward from [review ~4](PRREVIEW-CotangentLagrangian~4.md); unchanged statement |
| `realify U` is symplectic and orthogonal for unitary `U` | random `U ∈ U(2)` | `realify(U)ᵀ = realify(U*)`; `realify(U)·J·realify(U)ᵀ = J` (Mathlib's membership, `symplecticGroup` carrier line 101); `realify(U)·realify(U)ᵀ = 1` | the hypotheses `hKsp` and `hU` of `realifiedUnitary_maximal_compact_symplectic` are jointly satisfiable by `K =` the realified `U(n)`: not vacuous | Carried forward from [review ~4](PRREVIEW-CotangentLagrangian~4.md); unchanged statement |
| `realifiedUnitary_maximal_compact_symplectic`, negative controls | `K = O(2)` for `n = 1`: `diag(1, −1)` | `diag(1,−1)·J·diag(1,−1) = −J ≠ J`, so `K ⊄ Sp`; `diag(1,−1)` is not `[[a, −b],[b, a]]` for any `a² + b² = 1` | without `hKsp` the conclusion fails: the hypothesis is needed | Carried forward from [review ~4](PRREVIEW-CotangentLagrangian~4.md); unchanged statement |
| same, `hK` needed | `K = Sp(2,ℝ)` itself | `diag(t, 1/t) ∈ Sp(2,ℝ)` unbounded; not orthogonal for `t ≠ 1` | without compactness the conclusion fails | Carried forward from [review ~4](PRREVIEW-CotangentLagrangian~4.md); unchanged statement |
| same, degenerate `n` | `n = 0` | all three groups are the one-point group; conclusion trivial | consistent with README line 174 "n = 0 the trivial case" | Carried forward from [review ~4](PRREVIEW-CotangentLagrangian~4.md); unchanged statement |
| trace growth used by both maximality proofs | `P = diag(2, 1/2) ∈ Sp(2,ℝ)`; `P = (2) ∈ GL(1,ℂ)` | `tr Pᵏ = 2ᵏ + 2⁻ᵏ` = 2.5, 4.25, 32.03, 1024.0 for `k` = 1, 2, 5, 10; `2ᵏ` likewise | unbounded on `⟨P⟩`, so no compact subgroup contains a positive `P ≠ 1`: the README's argument at lines 172, 174 | Carried forward from [review ~4](PRREVIEW-CotangentLagrangian~4.md); unchanged statement |
| `unitaryGroup_maximal_compact` | `Maximal` unfolded (`Order/Defs/Unbundled.lean` line 233, dual): `IsCompact U(n) ∧ ∀ K, IsCompact K → U(n) ≤ K → K ≤ U(n)` | `U(n)` compact in the units topology (`Constructions.lean` line 100: induced by `u ↦ (u, u⁻¹)`; on `U(n)`, `u⁻¹ = u*` is continuous); `n = 0`: the range is the whole one-point group | both conjuncts true; matches README line 172 "includes its compactness" | Carried forward from [review ~4](PRREVIEW-CotangentLagrangian~4.md); unchanged statement |
| `generalLinearGroup_connectedSpace` | `n = 1`: path `e^{iπt}` from 1 to −1 avoids 0 (values 1, i, −1 at t = 0, ½, 1); `n = 0`: singleton | units topology agrees with the subspace topology since inversion is continuous on `GL(n,ℂ)`; concatenate the unitary phase path with the positive-factor path | true; `Nonempty` holds (1) | Carried forward from [review ~4](PRREVIEW-CotangentLagrangian~4.md); unchanged statement |
| `symplecticGroup_isConnected` | `n = 0`: the carrier is the singleton; `n = 1`: `Sp(2,ℝ) = SL(2,ℝ)`, polar factors `diag(λ, 1/λ)ᵗ` and rotations | `IsConnected` = nonempty ∧ preconnected; `1 ∈ Sp`; the wrong carrier `orthogonalGroup` has two components (det ±1), excluded by the statement | true | Carried forward from [review ~4](PRREVIEW-CotangentLagrangian~4.md); unchanged statement |
| docstring: "the chart identity fixes the form" | `w = extChartAt z₀ z₀`, which lies in the target | `inChartAt_extChartAt_self` (Closed.lean line 99): `σ.inChartAt z₀ (extChartAt z₀ z₀) = σ.altAt z₀`; so any two forms satisfying the identity agree at every `z₀` | uniqueness follows from the stated existence theorem; the sentence is justified | Carried forward from [review ~4](PRREVIEW-CotangentLagrangian~4.md); unchanged statement |
| `canonicalForm_exists`: chart expression equals `strongDualCotangentSymplecticForm` | Mathlib's Hom-bundle trivialization at `x₀` sends `p` to `p ∘ (coordinate change from the x₀-chart to the x-chart)`, i.e. the covector in the x₀-chart basis | `strongDualCotangentSymplecticForm_apply` (StrongDual.lean line 91): `y.2 x.1 − x.2 y.1 = (dq∧dp)(x,y)`; `−d(Σ pᵢ dqᵢ) = Σ dqᵢ∧dpᵢ` | the natural cotangent charts carry exactly this form; existence true, no stand-in | Carried forward from [review ~4](PRREVIEW-CotangentLagrangian~4.md); unchanged statement |
| `canonicalForm_exists`, degenerate inputs | `v` arbitrary (junk outside the chart target excluded by `w ∈ target`); `M` a point (`E = 0`): T*M a point, form 0, nondegenerate on the zero space | `IsSymplectic` = closed ∧ `IsNondegenerate` (TwoForm.lean lines 68, 92) | consistent | Carried forward from [review ~4](PRREVIEW-CotangentLagrangian~4.md); unchanged statement |
| `liouville_section`: `s_α*λ = α` | any smooth α, `v ∈ T_xM` | `λ(ds_α v) = α(x)(dπ ∘ ds_α v) = α(x)(v)` since `π ∘ s_α = id` | holds; needs only smoothness of `s_α` (`IsSmoothOneForm`) | Carried forward from [review ~4](PRREVIEW-CotangentLagrangian~4.md); unchanged statement |
| Prop. 5.1 dictionary | `S(q,Q) = aqQ + bq²/2 + cQ²/2` on ℝ, `a ≠ 0` | `p = aQ + bq`, `P = −(aq + cQ)`; `ψ = (a + (b+c)/2)q²`, `dψ = (2a+b+c)q`; fixed point at `Q = q` iff `(2a+b+c)q = 0` | same equation both sides | Carried forward from [review ~4](PRREVIEW-CotangentLagrangian~4.md); unchanged statement |
| Chain: matching-covector equations | N = 1, 2, 3 | `∂_{q_i}A = d_2S_{i−1}(q_{i−1},q_i) + d_1S_i(q_i,q_{i+1})`, zero iff outgoing covector of edge i−1 = incoming of edge i; N = 1: `d_1S_0(q_0,q_0) + d_2S_0(q_0,q_0) = dψ` | holds; the map `(q_0, d_1S_0(q_0,q_1))` iterates to `(q_i, d_1S_i(q_i,q_{i+1}))` and returns to itself | Carried forward from [review ~4](PRREVIEW-CotangentLagrangian~4.md); unchanged statement |
| Chain elimination, N = 2 | the quadratic S above, `q_0 = 0.37`, `p = −0.52` | eliminated `q_1 = −a(q_0+q_2)/(b+c)` equals the true intermediate base point; `∂_{q_0}S_{(0…2)} = p`, `−∂_{q_2}S_{(0…2)} = P_2` to `10⁻⁶`; mixed Hessian `−1.53636` vs `−a²/(b+c) = −1.53636` | holds; nondegenerate iff `b + c ≠ 0` | Carried forward from [review ~4](PRREVIEW-CotangentLagrangian~4.md); unchanged statement |
| Billiard: `v = ∂_sS`, `w = −∂_tS` | 2000 random chords of the ellipse | `∂_sS = e·χ′(s) = v`, `−∂_tS = e·χ′(t) = w` (tangential component preserved by reflection), agreement to `10⁻⁵` | holds | Carried forward from [review ~4](PRREVIEW-CotangentLagrangian~4.md); unchanged statement |
| `∂_s∂_tS < 0` | same chords, with `e = vχ′(s) + √(1−v²)n(s)` inward at s and outward at t | `∂_t∂_sS = (e^⊥·χ′(s))(e^⊥·χ′(t))/ℓ = −√(1−v²)√(1−w²)/ℓ`; numerically negative on every chord, maximum `−0.0020`, matching the formula to `10⁻³` relative | holds; `∂t/∂v = 1/∂_t∂_sS < 0` | Carried forward from [review ~4](PRREVIEW-CotangentLagrangian~4.md); unchanged statement |
| Existence/uniqueness of the next collision | `t ↓ s`: `e → χ′(s)`, `v → 1`; `t ↑ s+L`: `e → −χ′(s)`, `v → −1` | `v(s,·)` strictly decreasing from 1 to −1 on `(s, s+L)` | the relation over `{s<t<s+L}` is the graph of `β̃` onto `(−1,1)`; tangent collisions excluded | Carried forward from [review ~4](PRREVIEW-CotangentLagrangian~4.md); unchanged statement |
| `β̃*λ − λ = dℓ`, `β̃*ω = ω` | `λ = v ds`, `β̃(s,v) = (t,w)` | `dS = v ds − w dt`, so `w dt − v ds = −dS = dℓ`; `d` of both sides | holds | Carried forward from [review ~4](PRREVIEW-CotangentLagrangian~4.md); unchanged statement |
| Invariant measure, mass | `volume (univ : Set (AddCircle L)) = ofReal L` (`AddCircle.measure_univ`, `IntervalIntegral/Periodic.lean` line 69); Lebesgue on `(−1,1)` mass 2 | product mass `2L`; `u = s/L`, `v ds = (Lv) du` | `p = Lv`, area `∫_0^1∫_{−L}^{L} dp du = 2L` | Carried forward from [review ~4](PRREVIEW-CotangentLagrangian~4.md); unchanged statement |
| Circle return map | radius R, `L = 2πR`, `v ∈ {0, 0.5, −0.3}` | ray from `(R,0)` at angle `arccos v` to the tangent meets the circle at central angle `2 arccos v`, arc `2R arccos v`; `w = v` by symmetry | `β(s,v) = (s + 2R arccos v, v)` | Carried forward from [review ~4](PRREVIEW-CotangentLagrangian~4.md); unchanged statement |
| Perimeter maximizer has no consecutive coincident vertices | `q_i = q_{i+1} = a`, neighbours b, c; N = 2 from `(a,a)` | gain `\|a−d\| + \|d−c\| − \|a−c\| > 0` for d on the curve off the segment `[a,c]` (strict convexity); `a = c`: gain `2\|a−d\|`; N = 2: gain `2\|a−d\|` | holds for every N ≥ 2 | Carried forward from [review ~4](PRREVIEW-CotangentLagrangian~4.md); unchanged statement |
| N = 4 circle maximizer | unit circle | doubled diameter 8; inscribed square `4√2 ≈ 5.657` | maximizer has least period 2, as README line 344 says | Carried forward from [review ~4](PRREVIEW-CotangentLagrangian~4.md); unchanged statement |
| Recurrence with full support | any nonempty open U | `μ(U) > 0`; `MeasurePreserving.conservative` needs `IsFiniteMeasure` (Conservative.lean line 64); `exists_mem_iterate_mem'` gives `x ∈ U`, `m ≠ 0`, `f^[m] x ∈ U`; a.e. version needs `SecondCountableTopology` and `OpensMeasurableSpace` (line 197) | holds with exactly the README's hypotheses; `AddCircle L × (−1,1)` is second countable; only its `AddCircle L` factor is compact (`AddCircle/Real.lean` line 33, needs `Fact (0 < L)`); the open cylinder has finite mass `2L` | Carried forward from [review ~4](PRREVIEW-CotangentLagrangian~4.md); unchanged statement |
| Prescribed-derivative germ: block form | splittings `TM\|Q = TQ ⊕ ν_M`, `TN\|Q′ = TQ′ ⊕ ν_N` | `A ∘ di = dj ∘ df` forces `A(v,0) = (df v, 0)`, so `A(v,n) = (df v + Bn, Cn)` with C invertible | holds | Carried forward from [review ~4](PRREVIEW-CotangentLagrangian~4.md); unchanged statement |
| Derivative of the tubular extension along Q | vertical `n`: `q′ = exp_{f(q)}(Bn)` to first order `Bn`, transport of `Cn` over a zero-length path is `Cn`; horizontal `v`: `(df v, 0)` | `(v,n) ↦ (df v + Bn, Cn) = A` | holds | Carried forward from [review ~4](PRREVIEW-CotangentLagrangian~4.md); unchanged statement |
| Zero-first-jet primitive | fiber coordinates y, η with coefficients `O(\|y\|)`, radial field `O(\|y\|)` | `ι_rad η = O(\|y\|²)`, `β = ∫_0^1 t⁻¹ ρ_t^*(ι_rad η) dt = O(\|y\|²)`; Moser field zero first jet; `dψ_t = id` along Q by the variational equation | holds | Carried forward from [review ~4](PRREVIEW-CotangentLagrangian~4.md); unchanged statement |
| Degenerate submanifolds | `Q = ∅`; a point; `Q = M` compact with `f : M → N` | empty: vacuous; point: Darboux with prescribed linear part; `Q = M`: `A = df`, symplectic iff f is, `Φ = f` | consistent | Carried forward from [review ~4](PRREVIEW-CotangentLagrangian~4.md); unchanged statement |
| `symplectic_subspace_extension` | `S = 0` (needs `finrank V = finrank W`, present); `S = V` (then `T = W`, `e = f`); `S` a Lagrangian line in ℝ², `T` another line, any `f` (both restricted forms zero) | existence in each case; without `hdim` and `S = 0` no `e` exists | consistent; degenerate S allowed as README line 408 says | Carried forward from [review ~4](PRREVIEW-CotangentLagrangian~4.md); unchanged statement |
| `IsLagrangianEmbedding` | `Q = M`, `i = id`, dimension 0 or 2 | `tangentRange = ⊤`; `⊤^ω = ⊥`; dimension 0: `⊤ = ⊥`, true; dimension 2: dimensions 2 and 0 differ, false | agrees with the half-dimension condition | Carried forward from [review ~4](PRREVIEW-CotangentLagrangian~4.md); unchanged statement |
| Two-point intersection (C2.2) | compact Q with ≥ 2 points; f constant / nonconstant | constant: all of Q; nonconstant: argmin ≠ argmax | holds; fails for a one-point Q, excluded | Carried forward from [review ~4](PRREVIEW-CotangentLagrangian~4.md); unchanged statement |
| R01: cotangent momentum interface | translations of ℝ; ξ=1, H=p, X=(1,0), test vector (a,b) | `ω(X,(a,b))=b`; `dH(a,b)=b`; a form `2ω` gives `2b` and is excluded by the chart hypothesis | repaired statement has the intended sign; original elaboration exit 1, proposed repair exit 0 | Carried forward from [review ~4](PRREVIEW-CotangentLagrangian~4.md); unchanged statement |
| R02: retained Witt extension after import repair | standard ℝ², S=T=q-axis, f(q)=2q | restricted forms both 0; `e=diag(2,1/2)` gives `eᵀJe=J` since `2·(1/2)=1`; `e(q,0)=(2q,0)` | headline and its finite-dimensional binders survive changed imports | Carried forward from [review ~4](PRREVIEW-CotangentLagrangian~4.md); unchanged statement |
| R03: fixing-subspace specialization | ℝ², `ω₁=2ω₀`, S=q-axis, f=id | restricted forms both 0; `e=diag(1,1/2)` fixes S and pulls `2dq∧dp` back to `dq∧dp` | retained general theorem covers the specialization; deletion loses no headline | Carried forward from [review ~4](PRREVIEW-CotangentLagrangian~4.md); unchanged statement |
| New downstream chart characterization, README 503–510 | chart centre `w=extChartAt z z`; two forms satisfying the identity | both chart values on `(u,v)` equal `v_p(u_q)−u_p(v_q)`; the centre identity gives `σ_z(u,v)=τ_z(u,v)`, difference 0 | uniqueness holds pointwise; off-target chart-inverse junk is excluded | Fresh; no change needed |
| New general cotangent momentum equation, README 512–516 | nonabelian `GL(2,ℝ)` acting on ℝ²; `ξ=[[0,1],[0,0]]`, `q=(0,1)`, `p=(1,0)` | `H=pξq=1`; inverse-derivative lift `X=(ξq,−ξᵀp)=((1,0),(0,−1))`; both `ι_Xω(a,b)` and `dH(a,b)` equal `b₁+a₂`; wrong dual sign gives `b₁−a₂` | claimed sign and lift agree; no abelian restriction | Fresh; consumer signature still R01 |
| Translation Check, README 520–521 | `X=(1,0)`, `H=p`, test `(0,1)` | canonical contraction 1; `dH=1`; opposite symplectic sign gives −1 | discriminates sign | Fresh; no change needed |
| Rescaling Check, README 522–524 | `σ=2dq∧dp`, same translation and test | contraction 2; `dH=1`; chart identity requires 1 and fails | excludes a symplectic but noncanonical form | Fresh; no change needed |
| Trivial-action Check, README 525–526 | identity action on any base | `ξ_M=0`, lifted field 0, `H=p(0)=0`, `ι_0σ=0=d0` | true; used together with the nontrivial Checks | Fresh; no change needed |
| Zero-dimensional Check, README 526–528 | `E=0`, cotangent model `0×0` | unique bilinear form 0; its radical is `{0}` and equals the zero submodule; both sides of Hamiltonian equation 0 | zero form is nondegenerate on this model | Fresh; no change needed |
| New source exercise and its application, README 515,538 | dilation `q↦eᵗq`, at `(q,p)=(2,3)` | lift `(q,p)↦(eᵗq,e⁻ᵗp)`; `X=(2,−3)`, `λ(X)=6=H`; contraction on `(a,b)` is `3a+2b=d(qp)(a,b)` | CdS's `H=λ(X)` becomes precisely `p(ξ_M(q))` | Fresh; locator and generality supported |


**Sources.** The new locator was fetched through the sources service from the author's legal [2006 text](https://people.math.ethz.ch/~acannas/Papers/lsg.pdf). CdS lines 4267–4271, §18.1, printed p. 106 (PDF physical page 114), state the cotangent lift of a vector field is Hamiltonian for `ω=−dλ` with Hamiltonian `λ(X)`. CdS lines 4238–4240 fix `ι_Xω=dH`. Since the lifted field projects to the base field, `λ(X)=p(ξ_M(q))`. The exercise supports the added claim without an extra compactness assumption; completeness is only needed when asserting a global flow, not for this identity.

The seeded passages and their locators did not change. Their source verification is carried forward from [review ~4](PRREVIEW-CotangentLagrangian~4.md), which records the earlier direct checks:

| Seeded target | Carried-forward exact locator | Retained scope |
|---|---|---|
| Fixed points and finite iterates | CdS lines 1300–1306; Proposition 5.1, p. 29 | diagonal critical function and fixed phase point |
| Chains of generating functions | CdS lines 1320–1333, 1355–1360; Proposition 5.2 and exercise, p. 30 | local nondegenerate critical branch, distinct from stronger global uniqueness |
| Convex planar billiards | CdS lines 1361–1418; §5.2, pp. 30–32 | strict convexity, nontangent collisions, negative chord generator |
| Finite-volume recurrence | CdS lines 1420–1435; Theorem 5.3, p. 32 | finite area; generic finite-measure recurrence supplied by Mathlib |
| Neighborhood germs with prescribed ambient derivative | CdS lines 1845–1856, 1974–1985, 2107–2116; Theorems 7.4, 8.4, 9.3, pp. 45, 48, 51 | source's relative Moser/Lagrangian results; prescribed derivative explicitly constructed by this roadmap |

**Pinned declarations.** The checked-out revisions equal lake-manifest.json: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Five declarations were reopened for the changed interface and existing companion findings:

- `TauCeti/Geometry/Manifold/TwoForm/Closed.lean:86`: `SmoothTwoForm.inChartAt` uses the inverse chart and tangent-coordinate change. It does not constrain out-of-target values.
- `TauCeti/Geometry/Manifold/TwoForm/Closed.lean:99`: `SmoothTwoForm.inChartAt_extChartAt_self` identifies the chart-centre value with `altAt`, justifying uniqueness.
- `TauCeti/Geometry/Symplectic/Cotangent/StrongDual.lean:82`: `strongDualCotangentSymplecticForm` bundles the nondegenerate alternating form on the native continuous-dual product.
- `TauCeti/Geometry/Symplectic/Cotangent/StrongDual.lean:90`: its application theorem gives `y.2 x.1 − x.2 y.1`, fixing the new translation Check's sign.
- `TauCeti/Geometry/Symplectic/SymplecticTransport.lean:121`: `SymplecticForm.IsSymplectomorphism` requires preservation on every ambient pair, not just on the named subspace.

The broader unchanged pinned-library inventory belongs to review ~4 and its predecessors, as do the inherited table's library citations. Object searches at these pins found no cotangent-momentum theorem replacing R1's target.

**Cross-roadmap citations and ownership.** The citation resolver reports no unresolved roadmap citation or local Lean name against main `fa41b37` and the 439-head index. Its result does not check these local library pins, so the direct checks above are separate. The new citation resolves to `TauCetiRoadmap/SymplecticGeometry/HamiltonianReduction/README.md:33` (R1), whose lines 59–60 explicitly own the general cotangent momentum equation and equivariance. The family convention at `TauCetiRoadmap/SymplecticGeometry/README.md:36`–40 has the same signs. C1 supplies the cotangent form/lift; R1 retains the action theorem. The new text introduces no duplicate theorem or Lean name.

I also reopened the existing cited interfaces at main, rather than substituting open revisions: HeegaardFloer F2.1 (`TauCetiRoadmap/HeegaardFloer/README.md:2081`), DifferentialGeometry Layer 4 and §§5.4–5.5 (`TauCetiRoadmap/DifferentialGeometry/README.md:402,524,528`), GeometricTopology's tubular-neighborhood target (`TauCetiRoadmap/GeometricTopology/README.md:218`), SmoothBundlesConnections B1.4/B2.1/B2.4/B3/B4/B6.1 (`TauCetiRoadmap/SmoothBundlesConnections/README.md:421,559,776,869,977,1375`), UniversalCovers Stages 1–2 (`Completed/UniversalCovers/README.md:89,98`), ComplexKahlerGeometry's odd-Betti parity (`TauCetiRoadmap/ComplexKahlerGeometry/README.md:1279`), and RepresentationTheory/LieGroups Layers 2/7/9 (`TauCetiRoadmap/RepresentationTheory/LieGroups/README.md:275,407,448`). Two main-branch roadmap specimens, UniversalCovers and ContactGeometry, were also read for shape. These citations retain their previous roles; none is a new supply edge.

Within the family, ContactGeometry CG1/CG4/CG5 retain their contact-predicate/application split (`TauCetiRoadmap/SymplecticGeometry/ContactGeometry/README.md:59,121,150`). IntegrableSystems I5/I5.2 retains the opposite generator sign and matching-covector dictionary (`TauCetiRoadmap/SymplecticGeometry/IntegrableSystems/README.md:308,361`). ConvexityToric Layer 4 still consumes SmoothBundlesConnections B2.4's Liouville measure (`TauCetiRoadmap/SymplecticGeometry/ConvexityToric/README.md:555`). Their mathematics was not otherwise re-reviewed.

The object search used `roadmaps grep` on main and open heads for cotangent lifts, cotangent momentum and canonical-form existence, plus the board packages. Relevant open hits were read using `roadmaps show`: LieGroupoidsPoisson explicitly consumes C1 and has the matching `μ(g,ν)=Coad_g ν` application (`TauCetiRoadmap/LieGroupoidsPoisson/README.md:225,1955`); GeometricQuantization uses cotangent lifts for its distinct polarization/half-density targets (`TauCetiRoadmap/GeometricQuantization/README.md:898`). No duplicate owner for the added downstream contract was found. The unrelated open revision of existing family roadmaps was not treated as a supplier. The broader unchanged ownership audit is carried forward from review ~4.

## Not verifiable

- Weinstein, *Symplectic manifolds and their Lagrangian submanifolds* (1971), DOI `10.1016/0001-8708(71)90020-X`, remains the previous review's uncertified paywalled source, cited by locator. Its text was not reopened or guessed; the unchanged citation is accompanied by the previously verified Cannas da Silva results. No new request is made for this settled source. The new §18.1 citation was fully readable.

## Source issues

- **Misprint** in CdS at §5.2, printed page 32: the source says the cyclic sum of negative chord-length generators equals polygonal perimeter; it should be minus the perimeter; affects nothing.
