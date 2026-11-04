# Review of PseudoholomorphicCurveAnalysis (pull request #1793 at 575925d)

**Verdict:** needs changes

Full review of `TauCetiRoadmap/PseudoholomorphicCurveAnalysis/README.md` (1416 lines) and `Suggested.lean` (182 lines, 5 definitions, 5 sorried theorems). The gate passes at this head (worker: `build=0 OK`; my run with the merge-order file: every check `0`, `OK`); the dependency check reports `204 roadmaps, 1656 edges, 0 problem(s)`, no UPWARD, CYCLE or `moved:` line. The pull request changes nothing outside the roadmap folder. Two findings block: the Carleman similarity statement is false as written (R01), and the planar gradient-bound convergence theorem of Layer 5.2 is statable with the file's own carriers but absent (R02). The rest is P3.

## R01 (P1) — `exists_similarity_of_isWeakLinearCauchyRiemann` is false: `J` is an a.e. class in the hypotheses and pointwise in the conclusion

Location: `TauCetiRoadmap/PseudoholomorphicCurveAnalysis/Suggested.lean` lines 165–178, hypothesis `hJ : MemWkpLoc p Ω 1 J`, conclusion `∀ z ∈ Metric.ball z₀ r, ∀ v, J z (Φ z v) = Φ z (I • v)`; README 3.5 lines 753–758.

Claim: every hypothesis on `J` survives modification on a null set. `MemWkpLoc p Ω 1 J` unfolds to `MemLpLoc` (an `MemLp` on compacts) and `TauCeti.HasWeakFDerivOn volume Ω J U`, which at the pin is `CompleteSpace F ∧ LocallyIntegrableOn ∧ LocallyIntegrableOn ∧ (integral identity against 𝓓(Ω, ℝ))` (`TauCeti/Analysis/Sobolev/WeakDeriv/Basic.lean` lines 209–211 and 248–249); `hJsq` is pointwise but holds for both `i` and `−i`. The conclusion intertwines `J` with `Φ` at every point of the ball, and `Φ` is continuous there.

Witness: `V = ℂ`, `Ω = ⊤`, `z₀ = 0`, `p = 3`; `J z = i` for `z ≠ 0` and `J 0 = −i` (as elements of `ℂ →L[ℝ] ℂ`); `C = 0`; `ξ z = z`, `U z = id`. Then `hJ` holds (`J` is a.e. the constant `i`, weak derivative `0`), `hJsq` holds everywhere (`(±i)² = −1`), `heq` holds a.e. (`1 + i·i = 0` off `{0}`), `ξ 0 = 0`. Any `Φ` continuous on a ball about `0` with `i Φ z v = Φ z (i v)` for `z ≠ 0` satisfies `i Φ 0 v = Φ 0 (i v)` by continuity; the conclusion at `z = 0` demands `−i Φ 0 v = Φ 0 (i v)`; so `Φ 0 v = 0` for all `v`, and `Φ 0` is not an equivalence of `ℂ`. No `Φ` exists.

Repair (tested: the statement below elaborates at the pin with only the `sorry` warning; on the witness it no longer applies since `J` is discontinuous at `0`, and for `J ≡ i` the conclusion holds with `Φ = id`, `σ = ξ`): add `(hJc : ContinuousOn J Ω)` before `hJ`, so that `J` is the continuous representative the README's `p > 2` assumption provides, and in README 3.5 (line 754) write "a continuous `J ∈ W^{1,p}_loc(Ω; End_ℝ V)`".

```lean
theorem exists_similarity_of_isWeakLinearCauchyRiemann [FiniteDimensional ℂ V] {p : ENNReal}
    (hp : 2 < p) (hp_top : p ≠ ⊤) {Ω : Opens ℂ} {J : ℂ → V →L[ℝ] V} (hJc : ContinuousOn J Ω)
    (hJ : MemWkpLoc p Ω 1 J)
    (hJsq : ∀ z ∈ Ω, (J z).comp (J z) = -ContinuousLinearMap.id ℝ V) {C : ℂ → V →L[ℝ] V}
    (hC : MemLpLoc p Ω C) {ξ : ℂ → V} (hξ : ContinuousOn ξ Ω) {U : ℂ → ℂ →L[ℝ] V}
    (hU : TauCeti.HasWeakFDerivOn volume Ω ξ U) (hUp : MemLpLoc p Ω U)
    (heq : ∀ᵐ z ∂(volume.restrict (Ω : Set ℂ)), U z 1 + J z (U z I) + C z (ξ z) = 0)
    {z₀ : ℂ} (hz₀ : z₀ ∈ Ω) (h0 : ξ z₀ = 0) :
    ∃ r > 0, Metric.ball z₀ r ⊆ Ω ∧ ∃ Φ : ℂ → V ≃L[ℝ] V, ∃ σ : ℂ → V,
      ContinuousOn (fun z ↦ (Φ z : V →L[ℝ] V)) (Metric.ball z₀ r) ∧
      MemWkpLoc p ⟨Metric.ball z₀ r, Metric.isOpen_ball⟩ 1 (fun z ↦ (Φ z : V →L[ℝ] V)) ∧
      (∀ z ∈ Metric.ball z₀ r, ∀ v, J z (Φ z v) = Φ z (I • v)) ∧
      DifferentiableOn ℂ σ (Metric.ball z₀ r) ∧ σ z₀ = 0 ∧
      ∀ z ∈ Metric.ball z₀ r, ξ z = Φ z (σ z) := by
  sorry
```

The four nonlinear theorems do not have this defect: `IsWeakCauchyRiemannOn` and `IsWeakCauchyRiemannHalfOn` require `ContinuousOn u`, and `J`, `η` are `ContDiff`.

## R02 (P2) — the planar gradient-bound convergence theorem of Layer 5.2 is statable with the file's carriers but absent

Location: `Suggested.lean` module docstring lines 23–27 ("the uniform estimates of Layer 5.2 (the same carrier)"); README 5.2 lines 987–991 and Summary line 8 ("its uniform version for sequences").

Claim: the docstring's reason does not apply. The file states Layer 5.1 in planar form (`IsWeakCauchyRiemannOn`, `MemWkpLoc`), and the README names 5.2's gradient-bound corollary (McDuff–Salamon Theorem 4.1.1; Wendl Theorem 2.89, second clause, `wendl-lectures` lines 2852–2856) as one of the end theorems. Its planar form uses only those carriers plus Mathlib's `TendstoLocallyUniformlyOn` and `iteratedFDeriv`. `fderiv ℝ (u m)` in the hypothesis is the true derivative on `Ω` because `contDiffOn_of_isWeakCauchyRiemannOn` makes each `u m` smooth on the open `Ω`.

Repair (tested: elaborates at the pin with only the `sorry` warning): add the statement below under the Layer 5 section comment, name it in README 5.2 next to the Theorem 4.1.1 sentence, and delete "(the same carrier)" from the docstring, keeping the surface-level 5.2 statement (data `J_m → J`, `j_m → j`) as not statable.

```lean
/-- Layer 5.2, planar form of McDuff–Salamon Theorem 4.1.1: weak solutions for smooth data
with images in a fixed compact set and uniformly bounded derivatives on compact subsets have
a subsequence converging with all derivatives, locally uniformly on `Ω`, to a solution. -/
theorem exists_subseq_tendstoLocallyUniformlyOn_of_isWeakCauchyRiemannOn [FiniteDimensional ℝ V]
    {p : ENNReal} (hp : 2 < p) {Ω : Opens ℂ} {J : ℂ → V → V →L[ℝ] V}
    (hJ : ContDiff ℝ ∞ (Function.uncurry J))
    (hJsq : ∀ z x, (J z x).comp (J z x) = -ContinuousLinearMap.id ℝ V) {η : ℂ → V → V}
    (hη : ContDiff ℝ ∞ (Function.uncurry η)) {u : ℕ → ℂ → V}
    (hu : ∀ m, IsWeakCauchyRiemannOn p Ω J η (u m))
    (himg : ∀ K ⊆ (Ω : Set ℂ), IsCompact K → ∃ K' : Set V, IsCompact K' ∧ ∀ m, ∀ z ∈ K, u m z ∈ K')
    (hgrad : ∀ K ⊆ (Ω : Set ℂ), IsCompact K → ∃ c : ℝ, ∀ m, ∀ z ∈ K, ‖fderiv ℝ (u m) z‖ ≤ c) :
    ∃ φ : ℕ → ℕ, StrictMono φ ∧ ∃ v : ℂ → V, IsWeakCauchyRiemannOn p Ω J η v ∧
      ∀ k : ℕ, TendstoLocallyUniformlyOn (fun m ↦ iteratedFDeriv ℝ k (u (φ m)))
        (iteratedFDeriv ℝ k v) Filter.atTop Ω := by
  sorry
```

Instances: `u m = z/m` on `Ω = D_1`, `J = i`, `η = 0` satisfies both bounds (`‖fderiv‖ = 1/m ≤ 1`, images in the closed unit disc) and the identity subsequence converges with all derivatives to `0`, a solution; `u m = m z` violates `hgrad` on `D_{1/2}` (`‖fderiv‖ = m`) and has no convergent subsequence, so the hypothesis is used, as the README's Check says.

## R03 (P3) — the boundary theorems assume `J = i` along `L` over the whole real axis, not over `U ∩ ℝ`

Location: `Suggested.lean` lines 139 and 154, `hJL : ∀ z : ℂ, z.im = 0 → ∀ x ∈ L, ∀ v, J z x v = I • v`; README 5.1 line 924.

Claim: the structure PH2.3's adapted chart pushes forward is defined only on the chart's target, so the manifold reduction of README 5.1 (lines 927–929) can supply the identity only for `z ∈ U ∩ ℝ`; the theorem as stated asks for it at real `z` outside `U` (indeed outside the domain of the data), which forces an artificial extension. Instance: `U = D⁺_1`, `J(z, x) = i` for `|z| < 1` and `J(z, x) = A i A⁻¹` for `|z| > 2` with `A` the rotation of PH2.1's third Check, interpolated smoothly; `u = z` restricted to `D⁺_1` solves the equation with `u(U ∩ ℝ) ⊆ ℝ`, but `hJL` fails at `z = 3`, so the theorem does not apply although its conclusion holds.

Repair: `(hJL : ∀ z ∈ U, z.im = 0 → ∀ x ∈ L, ∀ v, J z x v = I • v)` in both theorems (the shape of `hbd`), and in README 5.1 "for `s ∈ U ∩ ℝ` and `x ∈ L`".

## R04 (P3) — README 1.1 states `MemWkpLoc` at a different generality and carrier type from the Lean definition

Location: README lines 215–218 ("For a finite-dimensional `F` ... `D^i u : ℂ → (ℂ [×i]→L[ℝ] F)`"); `Suggested.lean` lines 50–54 (any real normed space `F`, derivatives valued in `ℂ →L[ℝ] (ℂ →L[ℝ] ⋯ F)`).

Claim: the README's generality must equal the Lean signature's. The Lean definition admits every `F` and uses iterated continuous linear maps, not multilinear maps. Repair: in 1.1 write "for a real normed space `F`" and "`D^i u` valued in the `i`-fold iterated continuous linear maps `ℂ →L[ℝ] ⋯ →L[ℝ] F`", noting the finite-dimensional case is the one the theorems use.

## R05 (P3) — AlgebraicTopology Stage 8.7 is cited with a Lean name it does not declare on main

Location: README lines 199–201 and 1257 (`compactManifoldFiniteCWType`).

Witness: `TauCetiRoadmap/AlgebraicTopology/README.md` item 8.7 (line 1811) states the finite CW type of compact smooth manifolds in prose with no Lean name, and the name occurs on main only in `FuchsianOrbifolds/README.md` line 81, `FuchsianOrbifolds/Suggested.lean` line 317 and `HeegaardFloer/README.md` line 1992, all as consumers' expectations. Repair: cite "AlgebraicTopology Stage 8.7 (finite CW type of compact smooth manifolds), as FuchsianOrbifolds Layer 5 applies it in real dimension two" without the backticked name, or attribute the name to FuchsianOrbifolds.

## R06 (P3) — `maslovIndex_rotation` is summarised as "a half turn has index `1`"

Location: README lines 152–153.

Witness: at the pin, `TauCeti/LinearAlgebra/TotallyReal/Maslov/Index.lean` line 216: the half turn of a maximal totally real subspace of `E` has index `finrank ℂ E`. The 7.1 Check (lines 1232–1236) applies it on `E = ℂ`, where the value is `1`, so the Check is right and only the contract line is imprecise. Repair: "(a half turn has index `finrank ℂ E`, so `1` on `ℂ`)".

## R07 (P3) — two owners of the planar Cauchy–Riemann package and of Riemann–Roch; not repairable in this folder

Location: README lines 45–59 (Scope) and 1375–1388 (Downstream consumers).

Witness: on main, `HeegaardFloer/README.md` still plans F1.1 (line 1818, Sobolev surface/bundle adapters), F1.2 (lines 1828–1850, Cauchy–Green and Beurling operators, Beltrami charts, similarity principle) and F1.5 (lines 1982–2000, closed and bordered Riemann–Roch), and nowhere names this roadmap; HeegaardFloer's revision that consumes this roadmap is an open pull request by the same author (head `6d38f63`), and `PseudodifferentialOperators/README.md` line 35 on main already names this roadmap as the owner. AnalyticStableMaps, an open pull request not in the merge order, plans the vector Carleman similarity principle itself (`AnalyticStableMaps/README.md` line 125 at head `9af338e0`), the object of PH3.5. The Scope section states the single-owner boundary correctly and HeegaardFloer is a consumer, so the repair is outside this folder: merge this roadmap before HeegaardFloer's revision, and have AnalyticStableMaps cite PH3.5. This is a human's decision on merge order, recorded here so that it is not lost; it does not block this folder.

## Verified sound

**Gate and build.** Worker gate at 575925d: every check `0`, `build=0`, `OK`. My run (`gate … --order merge-order-candidate.txt`): every check `0`, `OK`. Dependency check: `depcheck: 204 roadmaps, 1656 edges, 0 problem(s)`. `git diff --stat origin/main...HEAD` outside the folder: empty. Folder contents: `README.md`, `Suggested.lean`, `metadata.toml` (`topic = "math.SG"`); no stray file.

**Lean form.** `module`, `public import Mathlib`, `public import TauCeti.Analysis.Sobolev.WeakDeriv.Basic`, `public import TauCeti.LinearAlgebra.TotallyReal.Basic` (both modules exist at the pin), one module docstring, `namespace TauCetiRoadmap.PseudoholomorphicCurveAnalysis`, layer section comments in README order, docstrings on all 10 declarations, no `lemma`, no `set_option`, no `#eval`/`#print`, no sorried data (the 5 `def`s have real bodies). I elaborated a scratch copy with `#check @name` for all 10 declarations: every elaborated type carries its instance binders explicitly (`[FiniteDimensional ℝ V]` or `[FiniteDimensional ℂ V]`, `[NormedSpace ℂ V]` in the complex model); none lost a section variable. One-tactic probe (each `sorry` replaced by `first | simp_all | rfl | infer_instance`): all 5 theorems remain open; no padding. Every backticked own name in the README (`MemLpLoc`, `MemWkpLoc`, `MemWkpLocHalf`, `IsWeakCauchyRiemannOn`, `IsWeakCauchyRiemannHalfOn`, the 5 theorem names) is declared in the file (gate `readme-ids-missing=0`).

**Library declarations opened at the pins** (Tau Ceti `358314d4`, Mathlib `f6090c70`): `TauCeti.HasWeakFDerivOn` (`WeakDeriv/Basic.lean:248`, via `HasWeakLineDerivOn` at 209–211: complete codomain, local integrability, integration by parts against `𝓓(Ω, ℝ)`); `TauCeti.IsMaximalTotallyReal J L := IsCompl L (L.map J)` (`TotallyReal/Basic.lean:50`); `SmoothAlmostComplexStructure` with exactly the fields `toEndomorphism : ContMDiffSection …` and `square_neg` (`Manifold/AlmostComplex.lean:67–74`), as README 2.1 says; `IsPseudoholomorphicWithinAt/At/On`, `IsPseudoholomorphic` (`Manifold/JHolomorphic.lean:83–103`), `isPseudoholomorphicAt_iff_isJHolomorphicAt` (line 511), `IsJHolomorphic` (`JHolomorphic/Varying.lean:68`); `IsLagrangian.isMaximalTotallyReal_of_tames` (`Geometry/Symplectic/Lagrangian/TotallyReal.lean:92`), the comparison 2.2 consumes; `TotallyRealLoop.maslovIndex` (`Maslov/Index.lean:103`), `maslovIndex_rotation` (line 216, value `finrank ℂ E`), `maslovIndex_map` (`Maslov/Map.lean:61`), `maslovIndex_prod` (`Maslov/Prod.lean:183`); `ContDiff.addHaar_image_criticalPoints_eq_zero` (`Sard/OutermostStratum.lean:366`, hypothesis `finrank E · finrank E + 1 ≤ n`, satisfied by smooth sections in 7.2 step 2); `Reflection/TotallyReal.lean` (`IsMaximalTotallyReal.exists_analyticOnNhd_eqOn_of_boundary_mem` line 49, `contDiffOn_of_boundary_mem` line 88); `W1p.hyperplaneTrace` (`Trace/Hyperplane.lean:182`), `W1p0.extendByZeroL` (`W1p/Extension.lean:220`); the `W1p` files `Morrey`, `HolderEmbedding`, `ChainRule`, `Multiplication`, `SupercriticalMultiplication`, `Mollification`, `Restriction`, `LocalCompactness` all exist under `Analysis/Sobolev/W1p/` (the resolver's lead on `LocalCompactness` is a file name, not a declaration); `Analysis/Fredholm/CompactPerturbation.lean` (`IsFredholm.add_of_isCompactOperator` line 87, `index_add_of_isCompactOperator` line 137) and `Fredholm/Comp.lean`. Mathlib: `ContinuousLinearMap.IsFredholm` (`Analysis/Normed/Operator/Fredholm/Basic.lean:123`), `IsFredholm.comp` (line 544), `IsFredholm.eventually_nhds_index_eq` (`Fredholm/Open.lean:89`), `index_continuousOn_isFredholm` (line 104); `IsSmoothEmbedding` (`Geometry/Manifold/SmoothEmbedding.lean:72`), `IsImmersionAt` (`Immersion.lean:190`), `𝓡∂ n` (`Instances/Real.lean:239`), `ContMDiffSection` (`VectorBundle/ContMDiffSection.lean:286`), `TestFunction` (`Analysis/Distribution/TestFunction.lean:67`).

**Post-pin Tau Ceti files at `333c9e49`** (read from the public repository): `WeaklyHarmonicOn` and `WeaklyHarmonicOn.exists_harmonicOnNhd_ae_eq` exist in `Analysis/InnerProductSpace/Harmonic/Weyl.lean`; `Analysis/Complex/Pompeiu/Basic.lean` states the Cauchy transform as `(2π)⁻¹ ∫ (w − z)⁻¹ • Du` with `Du = ∂ₓu + i∂ᵧu` and `π⁻¹ ∫ (w − z)⁻¹ • f` for `∂̄u = f`, exactly README 3.1's first Check; `exists_eLpNorm_fderiv_le_eLpNorm_conjWirtingerDeriv_of_hasCompactSupport` exists in `Wirtinger/CalderonZygmund.lean`; `CkHolderSpace` in `Analysis/Holder/Iterated.lean`; `Wirtinger/Similarity.lean` proves the scalar (`ℂ → ℂ`) similarity principle for a `C^k` coefficient, `k ≥ 1`, as README 3.5 describes it; `Wirtinger/Potential`, `Pompeiu/Parameter`, `Harmonic/MeanValue`, `Wirtinger/Basic` exist.

**Cross-roadmap citations resolved** (main `dd4b28f1` unless stated): PDE Lane A items 1, 2, 4, 6 (trace, extension, Rellich–Kondrachov), 7 (Hölder spaces) at `PDE/README.md` 227–263, Lane E at 322; HeegaardFloer Layer 2 (1183), F1.1 (1818), F1.2 (1828), F1.3–F1.5 (1911, 1941, 1982), F2.2 (2218, consumes "`W^{2,p}` regularity for `C¹` structures"), F2.3 (2259); PseudodifferentialOperators §5.2 (967: bundle `W^{k,p}` on a compact smooth base, with completeness, norm equivalence and smooth density, as cited) and §6.2 (1523, anchor `#62-regularity-and-solvability`), and line 35 naming this roadmap as owner; TeichmullerGeometry §7.4 (Wirtinger derivatives, quasiconformal maps, Beltrami equation) at its open head `927e6797`, line 576, in the merge order before this roadmap; CharacteristicClasses C2.3 (657: Euler via diagonal self-intersection and the duality/Künneth trace, `e(TM)[M] = χ(M)`) and C3.2 (826: Whitney laws, `c_r = e(E_ℝ)`, determinant and line-twist formulas); ModularForms 10B (iii)–(v) (1068–1100, `analyticGenus_eq_topologicalGenus` at 1097); FuchsianOrbifolds Layer 5 (311: `chi(X) = 2 − 2·genus(X)`, `RiemannSurface.genus` at 95); AlgebraicTopology Stage 6 item 5 (1560: universal-coefficient consequences through the duality maps), 7.1 (1577) and 8.7 (1811); ComplexCurveModuli D0 (48: the operator/divisor Riemann–Roch comparison, as 7.2 says). Every supplier is on main or earlier in the merge order (this roadmap is line 374 of 374).

**Ownership.** Searched main and the 441 open roadmap pull requests for "similarity principle", "Beltrami", "Schottky double", "bundle pair", "real Cauchy–Riemann operator": the only other planners are HeegaardFloer on main and AnalyticStableMaps (R07); all other "Beltrami" hits are the Laplace–Beltrami operator. The Schottky double and the bundle-pair Maslov index have no other owner.

**Adversarial pass** (values computed on each side):

| Statement | Instances | Values | Result |
|---|---|---|---|
| `MemWkpLoc`/`MemLpLoc` (1.1) | `z ↦ z` on `ℂ`, `k = 2`; `|z|`, `k = 2`; indicator of `{Re z > 0}` | `D¹ = id` const, `D² = 0`, constants `∈ Lᵖ(K)`; second derivative `∼ |z|⁻¹`, `∫_{D_1}|z|^{−p}` finite iff `p < 2`; distributional derivative a surface measure, no `HasWeakFDerivOn` witness | consistent with the Checks; `F` general (R04) |
| `MemWkpLocHalf` (1.1) | `U = D⁺_1`, interior `= D⁺_1 ∖ ℝ`; `t^{1/2}` | `interior(W ∩ ℍ̄) = W ∩ {Im > 0}`; derivative `t^{−1/2}/2`, `∫₀ t^{−p/2} dt` finite iff `p < 2` | sound |
| half-disc reflection coefficients | `k = 1`; `k = 2` | `c₁ = 1`; `c₁ + c₂ = 1`, `−c₁ − c₂/2 = 1` ⇒ `c₂ = 4`, `c₁ = −3`; applied to `u = t`: `−3t + 4(t/2) = −t` = the identity at `(s, −t)` | sound |
| 1.2 mixed exponents | `p = q = 4/3`, `f = |z|^{−6/5}`, `g = |z|^{−2/5}` | exponents `8/5`, `28/15`, `8/15` all `< 2`; `fg = |z|^{−8/5}` has `32/15 > 2` | `p ≥ 2` needed, as stated |
| 1.2 composition | `p = 4/3`, `u = |z|^{−2/5}`, `g = x²` | `u²` derivative `∼ |z|^{−9/5}`, `(9/5)(4/3) = 12/5 > 2` | `p > 2` needed |
| 1.3 | `sin(ms)`; `z^m` on `D_ρ`; `m⁻¹ sin(mt)` | derivatives `m cos(ms)` unbounded; `z^m → 0` with all derivatives on `|z| ≤ ρ < 1`; `Du_m = cos(mt)` not convergent | sound |
| 2.1 `C^ℓ` not `C^{ℓ+1}` | angle `|z|^{ℓ+1/2}` on `ℂ²` | `J(ie₁) = −cos θ e₁ − sin θ e₂`; `(ℓ+1)`-st derivative of `r^{ℓ+1/2}` `∼ r^{−1/2}` | sound |
| Floer normalisation (Conventions, 2.1, 4.2) | `∂_s u + J(∂_t u − X) = 0` | `∂̄_J(u)(∂_s) = ½(∂_s u + J∂_t u) = ½JX`; `ν(∂_t) = −Jν(∂_s) = ½X`; `η = 2ν(∂_s) = JX` | sound |
| 2.2 | `ℝⁿ ⊆ ℂⁿ`; circle; `ℂ × 0`; `ℝ × 0` | `ℝⁿ ∩ iℝⁿ = 0`, sum `ℂⁿ`; tangent `ie^{iθ}ℝ` vs `−e^{iθ}ℝ`; `L ∩ iL = L`; `L + iL = ℂ × 0 ≠ ℂ²` | sound |
| 2.3 adapted chart | `J = i`, `L = ℝⁿ`; `L = ℂ × 0` | `Φ(x + iy) = x + iy`; `∂₁γ = (1,0)`, `∂₂γ = (i,0) = J∂₁γ`, rank `2 < 4` | sound |
| 2.4 Beltrami | `μ = a` const | `ψ = z + az̄`: `∂̄ψ = a`, `∂ψ = 1`, Jacobian `1 − |a|²`; `a = 1` gives `2s` | sound; doubles `χ`: disc `1 → 2`, annulus `0 → 0` |
| 3.1 `T` | `f = 1_{D_1}` | `Tf = w̄` inside, `1/w` outside; `∂̄Tf = f` a.e.; `Bf = 0` / `−1/w²`, `∫_{|w|>1}|w|^{−2p}` finite iff `p > 1`; `Tf ∉ Lᵖ` iff `p ≤ 2` | sound; kernel `(w − z)⁻¹` matches `333c9e49` |
| 3.2 solution formula | `h = f + ig` real `f, g` | `Δ(½ Re Th) = 2 Re ∂h = ∂_s f + ∂_t g`; `log|z|`: `∇ = z/|z|²`, data `∈ L^r` iff `r < 2` | sound |
| 3.3 ladder | `p = 4`, `q₀ = 3` | `r₀ = 12/7`, `q₁ = 12 > 4`, `r₁ = 3 > 2`, then `r = 4`; at `q = 4/3`, `r = 1` | sound |
| 3.3 differentiated system | `k = 1` | rows `[S, ∂_sJ]`, `[0, S + ∂_tJ]`; `ξ = e^{−ms}`, `D = ∂_s + i∂_t + m`: `Dξ = 0`, norm ratio `∼ m` | sound |
| 3.4 weak form | `J = i`, `S = η = 0`, `φ = iχ`, `ξ = 1` | boundary term `−∫_ℝ⟨φ, iξ⟩ = −∫χ ≠ 0`; normal derivative `∂_tξ = i∂_sξ` holds for `ξ = z` | sound |
| 3.4 disc kernel | `e^{3iθ/2}ℝ`; `k = −1` | `a_m = conj(a_{3−m})`, kernel `a₀ + a₁z + ā₁z² + ā₀z³`, dim `4`; `k = −1` gives `0` | sound |
| 3.5 (Lean) | R01 witness | `Φ 0 = 0`, not invertible | **false as stated**; repaired form holds with `Φ = id`, `σ = ξ` for `J ≡ i` |
| 3.5 Checks | `ξ = ze^{−z̄}`, `C = 2`; `e^{−1/|z|²}`; `J = ΦiΦ⁻¹` | `∂̄ξ = −ξ`; `C = −2z/|z|⁴ ∉ Lᵖ_loc`; `C = −(∂_sΦ + J∂_tΦ)Φ⁻¹` | sound |
| 4.2 planar predicate | `u = z`, `u = z̄`, `J = i` | `1 + i·i = 0`; `1 + i(−i) = 2` | sound |
| 5.1 interior (Lean) | `ℓ = 1`, `p = ∞`, `f = z² log log(1/|z|)` | `∂̄f = z³/(2r² log r)`, size `r/(2|log r|)`, `C¹`; `∂²f ∋ 2 log log(1/r)` unbounded; `J(v,a) = (iv, ia − 2i∂̄f v̄)`, `J² = −1`, `∂_s u + J∂_t u = (0, 2∂̄f − 2∂̄f) = 0` | `p ≠ ⊤` is needed and present; `ℓ + 1` gain matches Wendl 2.89 |
| 5.1 boundary (Lean) | `V = 0`; `U = ∅`; `L = ℝⁿ ⊆ ℂⁿ`, `u = z` | vacuous/true; `IsCompl ℝⁿ iℝⁿ`; conclusion for all `ℓ` | sound; `hJL` over-quantified (R03) |
| 5.2 | `u_m = mz`, `z/m` on `D_{1/2}`; `L = (0,1)`, `u_m = 1/(m+2)` | `‖du_m‖_{Lᵖ} = m·vol^{1/p}`; limit `0 ∉ L` | hypotheses used; planar headline absent (R02) |
| 6.1–6.2 exponents | `ℓ = 1, k = 1`; `ℓ = 2, k = 1`; compactness at `q < 2` | `q ≤ p`; `2/p − 1 < 0` so every `q > 1`; needs `1/p < 1/2` | sound |
| 6.3 | disc `(ℂ, e^{ikθ/2}ℝ)`; `(∂̄ + 1)` | boundary term `−∫_ℝ⟨iξ, η(∂_s)⟩`; dual condition `k ↦ −k − 2`, cokernel dim `−1 − k`; solutions `e^{−z̄}h` | sound |
| 6.4 | torus, sphere | kernel `ℂ` (2), cokernel `H^{0,1}`: `2`, `0`; indices `0`, `2 = χ` | sound |
| 7.1 | `(ℂ, e^{iθ/2}ℝ)`; `(ℂ², ℝ ⊕ e^{iθ}ℝ)` | `maslovIndex_rotation` on `ℂ` gives `1`; `0 + 2 = 2`; disc double `𝒪(k)`, `c₁ = k` | sound (R06 wording) |
| 7.2 | `TS²`; disc `(ℂⁿ, ℝⁿ)`; `𝒪(−1)`, `𝒪(−2)`; vanishing | `2 + 2·2 = 6 = dim_ℝ PSL₂(ℂ)`; index `n`; `μ = −2 < 0`, index `0`; `μ + 2χ = 0`, `H¹(𝒪(−2)) = ℂ`; Wendl 3.23: `c₁ < 0` injective, `c₁ > −χ` ⇔ `μ + 2χ > 0` surjective | sound |

**Sources read.** Wendl, `wendl-lectures` (arXiv 1011.1690v2): Theorem 2.62 line 2194 (Calderón–Zygmund, `W^{1,p} ≤ c‖∂̄u‖_{Lᵖ}`, `1 < p < ∞`), Theorem 2.73 line 2394 (`f ∈ W^{k,p}`, `u ∈ L¹` weak solution of `∂̄u = f` ⇒ `u ∈ W^{k+1,p}_loc`), Theorem 2.78 line 2482 (similarity with `A ∈ L^∞`, `u ∈ W^{1,p}`, `p > 2`, `Φ ∈ C⁰`), Theorem 2.89 line 2850 (`J ∈ C^m`, `m ≥ 1`, `u ∈ W^{1,p}` ⇒ `W^{m+1,p}_loc`, and `W^{1,p}` convergence of solutions for `J_k → J` in `C^m` gives `W^{m+1,p}_loc` convergence), Remark 2.102 line 3337 (boundary case deferred), Theorem 3.22 line 4833 (`ind D = nχ(Σ) + 2c₁(E)`), Theorem 3.23 lines 4849–4850 (line-bundle vanishing). All agree with the README's use of them.

## Not verifiable

- McDuff–Salamon, *J-holomorphic Curves and Symplectic Topology*, 2nd ed. (AMS Colloquium 52): not openly available (publisher page paywalled; the author copy on the ETH site refuses the request). Every locator into it (Theorem 2.3.5, Theorem 4.1.1, Proposition B.1.19, Theorems B.4.1–B.4.2, Remark B.4.3, Lemmas B.4.4–B.4.6, Proposition B.4.9, Exercise B.4.10, Definition C.1.5, Exercise C.1.7, Lemma C.1.9, Theorem C.1.10, Lemma C.2.2, Theorem C.2.3, Theorems C.3.5–C.3.6, Theorem C.4.1, Corollary C.5.3, Theorem E.3.1, and the printed pages) is cited by locator only, as the README's References say; the mathematics at each was checked against Wendl and by computation above, not against the text.
- Vekua, Ahlfors and Oh are cited by chapter only; not opened.
- The `t4v1/damian_formalizare` repository named in 3.1: not opened (GitHub API rate limit at review time); nothing in the roadmap depends on it.

## Source issues

- none
