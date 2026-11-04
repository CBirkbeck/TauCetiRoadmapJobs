# Review of CotangentLagrangian (pull request #1651 at 307ff10)
Folder: `TauCetiRoadmap/SymplecticGeometry/CotangentLagrangian/`
**Verdict:** needs changes

Incremental re-review of 0 changed lines since 24f7c9f. One blocking consumer-interface finding remains, together with two P3 companion-file findings. The worker's scope-aware gate passes. The targeted build, direct elaboration and signature checks pass. No pull-request file was changed.

## R01 (P2) — The cotangent momentum consumer still calls the deleted form

**Location:** `TauCetiRoadmap/SymplecticGeometry/HamiltonianReduction/Suggested.lean:76`, `HasHamiltonianField (canonicalForm (M := M) I)`; its supplier is `TauCetiRoadmap/SymplecticGeometry/CotangentLagrangian/Suggested.lean:59`.

**Claim:** the previous R01 is only partly repaired. ConvexityToric now imports native libraries directly, so its import chain no longer encounters this error. HamiltonianReduction still imports the family index and calls the deleted `canonicalForm`. Removing the downstream import did not repair this consumer of CotangentLagrangian's changed interface. Neither the family index nor the targeted gate builds HamiltonianReduction itself.

**Witness:** an unchanged scratch copy of HamiltonianReduction's file fails elaboration at 76:39: `Invalid argument name M for function`. Replacing the obsolete form with the explicit form and chart hypotheses below succeeds, with five `sorry` warnings only.

**Exact repair:** coordinate the consumer adjustment in HamiltonianReduction: replace the theorem header and its `HasHamiltonianField` form argument as follows, keeping its Hamiltonian function and vector field unchanged. Record the consumer's use of this existence/chart interface in CotangentLagrangian's downstream contract. This requires a sibling repair; it is not permission to edit that sibling in this read-only review.

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

The full modified declaration was elaborated successfully. For translation on `T*ℝ`, the prescribed chart form gives `ω(∂q,∂p)=1`, momentum `H=p`, and `ι_(∂q)ω=dp=dH`; the repair retains the intended sign and excludes arbitrary rescalings of the form. `SmoothTwoForm.inChartAt_extChartAt_self` fixes its value at every chart centre. Do not restore a sorry'd data definition.

## R02 (P3) — The companion retains the forbidden import form and old module header

**Location:** `TauCetiRoadmap/SymplecticGeometry/CotangentLagrangian/RelativeDarbouxTargets.lean:1`–12, including `import Mathlib.LinearAlgebra.Dimension.Finrank` and “These are suggested forms.”

**Claim:** the per-file Lean rules require `import Mathlib` first, followed only by used Tau Ceti modules, and the specified target-signatures module docstring. This unchanged companion still has a Mathlib submodule import, no `import Mathlib`, and the old header. The gate's zero import counters do not certify this companion.

**Witness:** lines 1–2 are the Tau Ceti import followed by the Mathlib submodule import; lines 4–12 lack the required title and headline-at-the-pins description.

**Exact repair:** use `import Mathlib` followed by `import TauCeti.Geometry.Symplectic.SymplecticTransport`; title the module docstring “Relative Darboux, linear step: target signatures”, identify README.md as the roadmap, and describe C4's Witt-extension headline on the pinned carrier. The changed imports, with the retained extension theorem and a signature check, elaborate with one `sorry` warning.

## R03 (P3) — Delete the one-term specialization from the acceptance test

**Location:** `TauCetiRoadmap/SymplecticGeometry/CotangentLagrangian/RelativeDarbouxTargets.lean:32`–38, `symplectic_extension_fixing_subspace`.

**Claim:** this is the preceding extension theorem with `W=V`, `T=S`, and `f=id`. It is padding under the acceptance-test rule, even though its proof is already supplied.

**Witness:** line 38 is exactly `exact symplectic_subspace_extension ω₀ ω₁ rfl S S (LinearEquiv.refl ℝ S) hS`.

**Exact repair:** delete lines 32–38 from the Lean companion; keep the specialization in README C4, lines 407–410. A scratch copy after deletion still elaborates. For `ω₀=dq∧dp`, `ω₁=2dq∧dp`, and the q-axis, the retained theorem with `f=id` gives the required extension; `diag(1,1/2)` has pullback coefficient `2·1·(1/2)=1` and fixes the axis.

## Previous findings

- R01 — partly repaired: `ConvexityToric/Suggested.lean:1` removes the HamiltonianReduction import. `HamiltonianReduction/Suggested.lean:76` still calls deleted `canonicalForm` and fails elaboration. The missing consumer adjustment remains R01 above.
- R02 — not repaired: `RelativeDarbouxTargets.lean:1`–12 is unchanged: a Mathlib submodule import, no `import Mathlib`, and the old module docstring remain.
- R03 — not repaired: `RelativeDarbouxTargets.lean:32`–38 still contains the identity-on-subspace specialization and its one-term proof.

## Verified sound

**Scope and changes.** Git confirms head `307ff104a9ad6ced639837d3c239a1fce3705c40`, an empty folder diff against `24f7c9f`, unchanged pins, and a clean worktree. Only ConvexityToric's README and Suggested.lean changed since that review. Those files belong to another review under this brief; here I inspected their import removal and the Liouville ownership/interface that touches this folder. The comparison against origin/main outside the three authorized folders and family index is empty. No new mathematical statement in this folder requires a fresh source or adversarial review.

**Gate and elaboration.** The worker's gate at this exact head reports every check zero, including `outside-folder=0`, `build=0`, and `OK`. My literal gate rerun reports all other content counters zero but `outside-folder=6`, naming:

- `TauCetiRoadmap/SymplecticGeometry/ConvexityToric/BottSamelsonMomentTargets.lean`
- `TauCetiRoadmap/SymplecticGeometry/ConvexityToric/FixedLocusTargets.lean`
- `TauCetiRoadmap/SymplecticGeometry/ConvexityToric/README.md`
- `TauCetiRoadmap/SymplecticGeometry/ConvexityToric/Suggested.lean`
- `TauCetiRoadmap/SymplecticGeometry/IntegrableSystems/AnnulusFixedPointTargets.lean`
- `TauCetiRoadmap/SymplecticGeometry/IntegrableSystems/README.md`

These are precisely authorized sibling-folder files, so that raw single-folder diagnostic is a scope false positive, not an additional finding. The separately run targeted build of `TauCetiRoadmap.SymplecticGeometry.CotangentLagrangian.Suggested` and `TauCetiRoadmap.SymplecticGeometry.Suggested` completes successfully (9000 jobs). Direct `lake env lean` on this folder's Suggested.lean exits 0 with seven `sorry` warnings and no others. The consumer failure is separately reproduced under R01.

The dependency command reports:

```text
depcheck: 205 roadmaps, 1557 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. Its graph does not separate the nested family layers; the C3.1-to-I5.2 and C4-to-R3/T4 mentions are downstream contracts, not reverse supplier edges. ConvexityToric now delegates density-measure construction to SmoothBundlesConnections B2.4 and retains its Hamiltonian applications in Layer 4. CotangentLagrangian's recurrence theorem still uses the explicit finite cylinder measure, not that later construction.

**Elaborated signatures and headline coverage.** A scratch copy checks all 13 named declarations with `#check @`; all elaborate, and their types are unchanged from the prior review. The canonical-form existence retains `FiniteDimensional ℝ E`; the chart Liouville identity additionally retains `I.Boundaryless`; the section identity retains `IsSmoothOneForm α`; the group headlines retain their displayed compactness, symplectic-membership and inclusion hypotheses. The companion checks both extension signatures, including both finite-dimensional instances and the dimension equality. No binder changed in this round.

The acceptance headlines carried forward are the canonical cotangent-form existence, both Liouville identities, maximal compactness of U(n) in GL(n,ℂ) and of its realification in Sp(2n,ℝ), and connectedness of those two ambient groups (seven sorried targets), plus symplectic Witt extension in the companion. README C3/C3.1 additionally aims at generating transformations, fixed-point and chain dictionaries, and convex billiards; C4 at relative Moser and point/submanifold neighborhood germs. The unchanged module docstring names the missing exterior-derivative, open-cotangent symplectomorphism, germ, and symplectic-bundle carriers. The one-tactic results of reviews ~2 and ~3 are carried forward for all eight unchanged sorried targets; the explicitly proved one-term companion specialization is R03.

**Adversarial table.** The following 33 rows retain the computed values from review ~3 and the ~2 rows it incorporated. They are inherited evidence, not newly run numerical experiments. I corrected two slips in the earlier reports: `exp(iπt)` runs from 1 to −1, and the billiard cylinder is not compact (its measure is finite). Neither slip occurs in the roadmap. The final three rows are fresh checks of the remaining findings. All five seeded targets are represented.

| Statement | Instances tried | Values | Result | Change / provenance |
|---|---|---|---|---|
| `realify` convention | `A = i·I`, `n = 2` | `realify(i·I) = fromBlocks 0 (−1) 1 0 = Matrix.J (Fin 2) ℝ` (`SymplecticGroup.lean` line 58) | multiplication by i is J, as README line 124 says | Unchanged; inherited from [previous review ~3](PRREVIEW-CotangentLagrangian~3.md) |
| `realify` is a homomorphism commuting with J | random complex `A, B` | `realify(AB) = realify(A)·realify(B)` to `10⁻⁹`; `realify(A)·J = J·realify(A)` | holds; the wrong model `[[X, Y],[−Y, X]]` would send i to −J | Unchanged; inherited from [previous review ~3](PRREVIEW-CotangentLagrangian~3.md) |
| `realify U` is symplectic and orthogonal for unitary `U` | random `U ∈ U(2)` | `realify(U)ᵀ = realify(U*)`; `realify(U)·J·realify(U)ᵀ = J` (Mathlib's membership, `symplecticGroup` carrier line 101); `realify(U)·realify(U)ᵀ = 1` | the hypotheses `hKsp` and `hU` of `realifiedUnitary_maximal_compact_symplectic` are jointly satisfiable by `K =` the realified `U(n)`: not vacuous | Unchanged; inherited from [previous review ~3](PRREVIEW-CotangentLagrangian~3.md) |
| `realifiedUnitary_maximal_compact_symplectic`, negative controls | `K = O(2)` for `n = 1`: `diag(1, −1)` | `diag(1,−1)·J·diag(1,−1) = −J ≠ J`, so `K ⊄ Sp`; `diag(1,−1)` is not `[[a, −b],[b, a]]` for any `a² + b² = 1` | without `hKsp` the conclusion fails: the hypothesis is needed | Unchanged; inherited from [previous review ~3](PRREVIEW-CotangentLagrangian~3.md) |
| same, `hK` needed | `K = Sp(2,ℝ)` itself | `diag(t, 1/t) ∈ Sp(2,ℝ)` unbounded; not orthogonal for `t ≠ 1` | without compactness the conclusion fails | Unchanged; inherited from [previous review ~3](PRREVIEW-CotangentLagrangian~3.md) |
| same, degenerate `n` | `n = 0` | all three groups are the one-point group; conclusion trivial | consistent with README line 174 "n = 0 the trivial case" | Unchanged; inherited from [previous review ~3](PRREVIEW-CotangentLagrangian~3.md) |
| trace growth used by both maximality proofs | `P = diag(2, 1/2) ∈ Sp(2,ℝ)`; `P = (2) ∈ GL(1,ℂ)` | `tr Pᵏ = 2ᵏ + 2⁻ᵏ` = 2.5, 4.25, 32.03, 1024.0 for `k` = 1, 2, 5, 10; `2ᵏ` likewise | unbounded on `⟨P⟩`, so no compact subgroup contains a positive `P ≠ 1`: the README's argument at lines 172, 174 | Unchanged; inherited from [previous review ~3](PRREVIEW-CotangentLagrangian~3.md) |
| `unitaryGroup_maximal_compact` | `Maximal` unfolded (`Order/Defs/Unbundled.lean` line 233, dual): `IsCompact U(n) ∧ ∀ K, IsCompact K → U(n) ≤ K → K ≤ U(n)` | `U(n)` compact in the units topology (`Constructions.lean` line 100: induced by `u ↦ (u, u⁻¹)`; on `U(n)`, `u⁻¹ = u*` is continuous); `n = 0`: the range is the whole one-point group | both conjuncts true; matches README line 172 "includes its compactness" | Unchanged; inherited from [previous review ~3](PRREVIEW-CotangentLagrangian~3.md) |
| `generalLinearGroup_connectedSpace` | `n = 1`: path `e^{iπt}` from 1 to −1 avoids 0 (values 1, i, −1 at t = 0, ½, 1); `n = 0`: singleton | units topology agrees with the subspace topology since inversion is continuous on `GL(n,ℂ)`; concatenate the unitary phase path with the positive-factor path | true; `Nonempty` holds (1) | Unchanged; inherited from [previous review ~3](PRREVIEW-CotangentLagrangian~3.md) |
| `symplecticGroup_isConnected` | `n = 0`: the carrier is the singleton; `n = 1`: `Sp(2,ℝ) = SL(2,ℝ)`, polar factors `diag(λ, 1/λ)ᵗ` and rotations | `IsConnected` = nonempty ∧ preconnected; `1 ∈ Sp`; the wrong carrier `orthogonalGroup` has two components (det ±1), excluded by the statement | true | Unchanged; inherited from [previous review ~3](PRREVIEW-CotangentLagrangian~3.md) |
| docstring: "the chart identity fixes the form" | `w = extChartAt z₀ z₀`, which lies in the target | `inChartAt_extChartAt_self` (Closed.lean line 99): `σ.inChartAt z₀ (extChartAt z₀ z₀) = σ.altAt z₀`; so any two forms satisfying the identity agree at every `z₀` | uniqueness follows from the stated existence theorem; the sentence is justified | Unchanged; inherited from [previous review ~3](PRREVIEW-CotangentLagrangian~3.md) |
| `canonicalForm_exists`: chart expression equals `strongDualCotangentSymplecticForm` | Mathlib's Hom-bundle trivialization at `x₀` sends `p` to `p ∘ (coordinate change from the x₀-chart to the x-chart)`, i.e. the covector in the x₀-chart basis | `strongDualCotangentSymplecticForm_apply` (StrongDual.lean line 91): `y.2 x.1 − x.2 y.1 = (dq∧dp)(x,y)`; `−d(Σ pᵢ dqᵢ) = Σ dqᵢ∧dpᵢ` | the natural cotangent charts carry exactly this form; existence true, no stand-in | Unchanged; inherited from [previous review ~3](PRREVIEW-CotangentLagrangian~3.md), via its [~2 table](PRREVIEW-CotangentLagrangian~2.md) |
| `canonicalForm_exists`, degenerate inputs | `v` arbitrary (junk outside the chart target excluded by `w ∈ target`); `M` a point (`E = 0`): T*M a point, form 0, nondegenerate on the zero space | `IsSymplectic` = closed ∧ `IsNondegenerate` (TwoForm.lean lines 68, 92) | consistent | Unchanged; inherited from [previous review ~3](PRREVIEW-CotangentLagrangian~3.md), via its [~2 table](PRREVIEW-CotangentLagrangian~2.md) |
| `liouville_section`: `s_α*λ = α` | any smooth α, `v ∈ T_xM` | `λ(ds_α v) = α(x)(dπ ∘ ds_α v) = α(x)(v)` since `π ∘ s_α = id` | holds; needs only smoothness of `s_α` (`IsSmoothOneForm`) | Unchanged; inherited from [previous review ~3](PRREVIEW-CotangentLagrangian~3.md), via its [~2 table](PRREVIEW-CotangentLagrangian~2.md) |
| Prop. 5.1 dictionary | `S(q,Q) = aqQ + bq²/2 + cQ²/2` on ℝ, `a ≠ 0` | `p = aQ + bq`, `P = −(aq + cQ)`; `ψ = (a + (b+c)/2)q²`, `dψ = (2a+b+c)q`; fixed point at `Q = q` iff `(2a+b+c)q = 0` | same equation both sides | Unchanged; inherited from [previous review ~3](PRREVIEW-CotangentLagrangian~3.md), via its [~2 table](PRREVIEW-CotangentLagrangian~2.md) |
| Chain: matching-covector equations | N = 1, 2, 3 | `∂_{q_i}A = d_2S_{i−1}(q_{i−1},q_i) + d_1S_i(q_i,q_{i+1})`, zero iff outgoing covector of edge i−1 = incoming of edge i; N = 1: `d_1S_0(q_0,q_0) + d_2S_0(q_0,q_0) = dψ` | holds; the map `(q_0, d_1S_0(q_0,q_1))` iterates to `(q_i, d_1S_i(q_i,q_{i+1}))` and returns to itself | Unchanged; inherited from [previous review ~3](PRREVIEW-CotangentLagrangian~3.md), via its [~2 table](PRREVIEW-CotangentLagrangian~2.md) |
| Chain elimination, N = 2 | the quadratic S above, `q_0 = 0.37`, `p = −0.52` | eliminated `q_1 = −a(q_0+q_2)/(b+c)` equals the true intermediate base point; `∂_{q_0}S_{(0…2)} = p`, `−∂_{q_2}S_{(0…2)} = P_2` to `10⁻⁶`; mixed Hessian `−1.53636` vs `−a²/(b+c) = −1.53636` | holds; nondegenerate iff `b + c ≠ 0` | Unchanged; inherited from [previous review ~3](PRREVIEW-CotangentLagrangian~3.md), via its [~2 table](PRREVIEW-CotangentLagrangian~2.md) |
| Billiard: `v = ∂_sS`, `w = −∂_tS` | 2000 random chords of the ellipse | `∂_sS = e·χ′(s) = v`, `−∂_tS = e·χ′(t) = w` (tangential component preserved by reflection), agreement to `10⁻⁵` | holds | Unchanged; inherited from [previous review ~3](PRREVIEW-CotangentLagrangian~3.md), via its [~2 table](PRREVIEW-CotangentLagrangian~2.md) |
| `∂_s∂_tS < 0` | same chords, with `e = vχ′(s) + √(1−v²)n(s)` inward at s and outward at t | `∂_t∂_sS = (e^⊥·χ′(s))(e^⊥·χ′(t))/ℓ = −√(1−v²)√(1−w²)/ℓ`; numerically negative on every chord, maximum `−0.0020`, matching the formula to `10⁻³` relative | holds; `∂t/∂v = 1/∂_t∂_sS < 0` | Unchanged; inherited from [previous review ~3](PRREVIEW-CotangentLagrangian~3.md), via its [~2 table](PRREVIEW-CotangentLagrangian~2.md) |
| Existence/uniqueness of the next collision | `t ↓ s`: `e → χ′(s)`, `v → 1`; `t ↑ s+L`: `e → −χ′(s)`, `v → −1` | `v(s,·)` strictly decreasing from 1 to −1 on `(s, s+L)` | the relation over `{s<t<s+L}` is the graph of `β̃` onto `(−1,1)`; tangent collisions excluded | Unchanged; inherited from [previous review ~3](PRREVIEW-CotangentLagrangian~3.md), via its [~2 table](PRREVIEW-CotangentLagrangian~2.md) |
| `β̃*λ − λ = dℓ`, `β̃*ω = ω` | `λ = v ds`, `β̃(s,v) = (t,w)` | `dS = v ds − w dt`, so `w dt − v ds = −dS = dℓ`; `d` of both sides | holds | Unchanged; inherited from [previous review ~3](PRREVIEW-CotangentLagrangian~3.md), via its [~2 table](PRREVIEW-CotangentLagrangian~2.md) |
| Invariant measure, mass | `volume (univ : Set (AddCircle L)) = ofReal L` (`AddCircle.measure_univ`, `IntervalIntegral/Periodic.lean` line 69); Lebesgue on `(−1,1)` mass 2 | product mass `2L`; `u = s/L`, `v ds = (Lv) du` | `p = Lv`, area `∫_0^1∫_{−L}^{L} dp du = 2L` | Unchanged; inherited from [previous review ~3](PRREVIEW-CotangentLagrangian~3.md), via its [~2 table](PRREVIEW-CotangentLagrangian~2.md) |
| Circle return map | radius R, `L = 2πR`, `v ∈ {0, 0.5, −0.3}` | ray from `(R,0)` at angle `arccos v` to the tangent meets the circle at central angle `2 arccos v`, arc `2R arccos v`; `w = v` by symmetry | `β(s,v) = (s + 2R arccos v, v)` | Unchanged; inherited from [previous review ~3](PRREVIEW-CotangentLagrangian~3.md), via its [~2 table](PRREVIEW-CotangentLagrangian~2.md) |
| Perimeter maximizer has no consecutive coincident vertices | `q_i = q_{i+1} = a`, neighbours b, c; N = 2 from `(a,a)` | gain `\|a−d\| + \|d−c\| − \|a−c\| > 0` for d on the curve off the segment `[a,c]` (strict convexity); `a = c`: gain `2\|a−d\|`; N = 2: gain `2\|a−d\|` | holds for every N ≥ 2 | Unchanged; inherited from [previous review ~3](PRREVIEW-CotangentLagrangian~3.md), via its [~2 table](PRREVIEW-CotangentLagrangian~2.md) |
| N = 4 circle maximizer | unit circle | doubled diameter 8; inscribed square `4√2 ≈ 5.657` | maximizer has least period 2, as README line 344 says | Unchanged; inherited from [previous review ~3](PRREVIEW-CotangentLagrangian~3.md), via its [~2 table](PRREVIEW-CotangentLagrangian~2.md) |
| Recurrence with full support | any nonempty open U | `μ(U) > 0`; `MeasurePreserving.conservative` needs `IsFiniteMeasure` (Conservative.lean line 64); `exists_mem_iterate_mem'` gives `x ∈ U`, `m ≠ 0`, `f^[m] x ∈ U`; a.e. version needs `SecondCountableTopology` and `OpensMeasurableSpace` (line 197) | holds with exactly the README's hypotheses; `AddCircle L × (−1,1)` is second countable; only its `AddCircle L` factor is compact (`AddCircle/Real.lean` line 33, needs `Fact (0 < L)`); the open cylinder has finite mass `2L` | Unchanged; inherited from [previous review ~3](PRREVIEW-CotangentLagrangian~3.md), via its [~2 table](PRREVIEW-CotangentLagrangian~2.md) |
| Prescribed-derivative germ: block form | splittings `TM\|Q = TQ ⊕ ν_M`, `TN\|Q′ = TQ′ ⊕ ν_N` | `A ∘ di = dj ∘ df` forces `A(v,0) = (df v, 0)`, so `A(v,n) = (df v + Bn, Cn)` with C invertible | holds | Unchanged; inherited from [previous review ~3](PRREVIEW-CotangentLagrangian~3.md), via its [~2 table](PRREVIEW-CotangentLagrangian~2.md) |
| Derivative of the tubular extension along Q | vertical `n`: `q′ = exp_{f(q)}(Bn)` to first order `Bn`, transport of `Cn` over a zero-length path is `Cn`; horizontal `v`: `(df v, 0)` | `(v,n) ↦ (df v + Bn, Cn) = A` | holds | Unchanged; inherited from [previous review ~3](PRREVIEW-CotangentLagrangian~3.md), via its [~2 table](PRREVIEW-CotangentLagrangian~2.md) |
| Zero-first-jet primitive | fiber coordinates y, η with coefficients `O(\|y\|)`, radial field `O(\|y\|)` | `ι_rad η = O(\|y\|²)`, `β = ∫_0^1 t⁻¹ ρ_t^*(ι_rad η) dt = O(\|y\|²)`; Moser field zero first jet; `dψ_t = id` along Q by the variational equation | holds | Unchanged; inherited from [previous review ~3](PRREVIEW-CotangentLagrangian~3.md), via its [~2 table](PRREVIEW-CotangentLagrangian~2.md) |
| Degenerate submanifolds | `Q = ∅`; a point; `Q = M` compact with `f : M → N` | empty: vacuous; point: Darboux with prescribed linear part; `Q = M`: `A = df`, symplectic iff f is, `Φ = f` | consistent | Unchanged; inherited from [previous review ~3](PRREVIEW-CotangentLagrangian~3.md), via its [~2 table](PRREVIEW-CotangentLagrangian~2.md) |
| `symplectic_subspace_extension` | `S = 0` (needs `finrank V = finrank W`, present); `S = V` (then `T = W`, `e = f`); `S` a Lagrangian line in ℝ², `T` another line, any `f` (both restricted forms zero) | existence in each case; without `hdim` and `S = 0` no `e` exists | consistent; degenerate S allowed as README line 408 says | Unchanged; inherited from [previous review ~3](PRREVIEW-CotangentLagrangian~3.md), via its [~2 table](PRREVIEW-CotangentLagrangian~2.md) |
| `IsLagrangianEmbedding` | `Q = M`, `i = id`, dimension 0 or 2 | `tangentRange = ⊤`; `⊤^ω = ⊥`; dimension 0: `⊤ = ⊥`, true; dimension 2: dimensions 2 and 0 differ, false | agrees with the half-dimension condition | Unchanged; inherited from [previous review ~3](PRREVIEW-CotangentLagrangian~3.md), via its [~2 table](PRREVIEW-CotangentLagrangian~2.md) |
| Two-point intersection (C2.2) | compact Q with ≥ 2 points; f constant / nonconstant | constant: all of Q; nonconstant: argmin ≠ argmax | holds; fails for a one-point Q, excluded | Unchanged; inherited from [previous review ~3](PRREVIEW-CotangentLagrangian~3.md), via its [~2 table](PRREVIEW-CotangentLagrangian~2.md) |
| R01: cotangent momentum interface | translations of ℝ; ξ=1, H=p, X=(1,0), test vector (a,b) | `ω(X,(a,b))=b`; `dH(a,b)=b`; a form `2ω` gives `2b` and is excluded by the chart hypothesis | repaired statement has the intended sign; original elaboration exit 1, proposed repair exit 0 | fresh verification; consumer still unrepaired |
| R02: retained Witt extension after import repair | standard ℝ², S=T=q-axis, f(q)=2q | restricted forms both 0; `e=diag(2,1/2)` gives `eᵀJe=J` since `2·(1/2)=1`; `e(q,0)=(2q,0)` | headline and its finite-dimensional binders survive changed imports | fresh check; proposed repair elaborates |
| R03: fixing-subspace specialization | ℝ², `ω₁=2ω₀`, S=q-axis, f=id | restricted forms both 0; `e=diag(1,1/2)` fixes S and pulls `2dq∧dp` back to `dq∧dp` | retained general theorem covers the specialization; deletion loses no headline | fresh check; deletion elaborates |

**Seeded source sample, carried forward.** No sample passage or locator changed. The previous review's verification is retained, with the detailed locator evidence in review ~2:

| Target | Previously verified source evidence | Scope retained at this head |
|---|---|---|
| Fixed points and finite iterates | CdS lines 1300–1306, Proposition 5.1, p. 29 | critical diagonal function and fixed phase point, with the same sign |
| Chains of generating functions | CdS lines 1320–1333 and 1355–1360, Proposition 5.2 and following exercise, p. 30 | local nondegenerate critical branch; source's stronger global uniqueness is distinguished |
| Convex planar billiards | CdS lines 1361–1418, §5.2, pp. 30–32 | strict convexity, nontangent collisions, negative chord generator; the roadmap's extra formulas have the table's evidence |
| Finite-volume recurrence | CdS lines 1420–1435, Theorem 5.3, p. 32 | finite-area result; general finite-measure statement imports Mathlib |
| Neighborhood germs with prescribed ambient derivative | CdS lines 1845–1856, 1974–1985, 2107–2116, Theorems 7.4, 8.4, 9.3, pp. 45, 48, 51 | source gives relative Moser/Lagrangian cases; the stronger derivative prescription is explicitly the roadmap's own construction |

**Pinned libraries.** Both checked-out library revisions equal the manifest: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. For the live findings I reopened three interfaces: `SmoothTwoForm.inChartAt` and `inChartAt_extChartAt_self` in `TauCeti/Geometry/Manifold/TwoForm/Closed.lean:86,99`; `strongDualCotangentSymplecticForm` and its application equation in `TauCeti/Geometry/Symplectic/Cotangent/StrongDual.lean:82,91`; and `SymplecticForm.IsSymplectomorphism` in `TauCeti/Geometry/Symplectic/SymplecticTransport.lean:121`. The first uses tangent-coordinate changes and agrees with the form at the chart centre; the last requires equality on every pair of vectors, not merely on the specified subspace. The remaining pinned-library inventory and one-tactic probes in reviews ~2/~3 are unchanged evidence, not claims of fresh exhaustive searches.

**Cross-roadmap contracts and ownership.** The resolver reports no unresolved roadmap citation or local Lean name against main `fa41b37` and the 439-head index. It does not inspect these local pins, so the direct checks above are separate. I reopened the cited sections on main and the family interfaces at this head:

- `TauCetiRoadmap/HeegaardFloer/README.md:2081`: F2.1's Darboux, domain-local Moser, contraction inverse, smooth-parameter primitives and pullback differentiation; its downstream paragraph at 4124–4128 also names this family.
- `TauCetiRoadmap/DifferentialGeometry/README.md:402,524`: Layer 4's distributions/leaves and §5.4's homotopy operator; §5.5 at 528 supplies density integration.
- `TauCetiRoadmap/GeometricTopology/README.md:218`: tubular neighborhoods for closed submanifolds.
- `TauCetiRoadmap/SmoothBundlesConnections/README.md:421,559,776,869,977,1375`: quotient/slice, bundle, density-measure, connection/curvature and degree-one comparison sections. In particular B2.4 explicitly constructs the Liouville measure, so ConvexityToric's revised ownership does not leave that object unowned.
- `Completed/UniversalCovers/README.md:89,98`: universal covers, deck transformations and covering/fundamental-group correspondence.
- `TauCetiRoadmap/ComplexKahlerGeometry/README.md:1279`: compact Kähler odd-Betti parity.
- `TauCetiRoadmap/RepresentationTheory/LieGroups/README.md:275,407,448`: Layers 2, 7 and 9, the closed-subgroup, complexification/maximal-compact and Cartan-decomposition sections. These are the main-branch suppliers; open revisions are not substituted for them.
- `TauCetiRoadmap/SymplecticGeometry/ContactGeometry/README.md:59,121,150`: CG1's contact predicate and downstream CG4/CG5 applications.
- `TauCetiRoadmap/SymplecticGeometry/IntegrableSystems/README.md:308,361`: I5's opposite generating-function sign and I5.2's cyclic dictionary; its critical equation is still matching covectors after the documented sign change.
- `TauCetiRoadmap/SymplecticGeometry/HamiltonianReduction/README.md:73,262` and `TauCetiRoadmap/SymplecticGeometry/ConvexityToric/README.md:555`: R1a/R3.1 and Layer 4 consumers; the Lean consumer mismatch is R01.

The object search with `roadmaps grep` covered main and the open-head index for cotangent canonical forms, symplectic subspace extension, polar C2.0 and Liouville measures. It confirms the relevant existing ownership interfaces; no construction was added in this zero-line change. Broader unchanged duplication conclusions are carried forward from reviews ~2/~3. The authorized ConvexityToric changes receive their own mathematical review; only their interaction with this folder is assessed here.

## Not verifiable

- Weinstein, *Symplectic manifolds and their Lagrangian submanifolds* (1971), DOI `10.1016/0001-8708(71)90020-X`, remains the previous review's uncertified, paywalled source. Its text was not reopened or guessed; the unchanged citation is accompanied by the previously verified Cannas da Silva theorems. No new source request is made for this settled item.

## Source issues

- **Misprint** in CdS at §5.2, printed page 32: the source says the cyclic sum of negative chord-length generators equals polygonal perimeter; it should be minus the perimeter; affects nothing.
