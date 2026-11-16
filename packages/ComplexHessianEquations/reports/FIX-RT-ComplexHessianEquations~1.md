# FIX-RT-ComplexHessianEquations~1

All seven findings of the two red-team reviews were checked against the sources, the pins and the roadmap's own definitions. All seven hold. Five are applied as asked. Two are applied differently: F01a uses a different route for the new Green-representation target, and F03a's deletion also rewords the surviving docstring. Files changed: `packages/ComplexHessianEquations/README.md`, `packages/ComplexHessianEquations/Suggested.lean` and `packages/ComplexHessianEquations/sources.toml`. `packages/ComplexHessianEquations/design/plan.json` is unchanged (see Gate failure).

## RT-ComplexHessianEquations~1a/F01 (P1) — applied differently

Verified. At the pin there is no Green representation of a given function on a disc, no `[−∞, 0]`-valued subharmonic carrier and no Riesz measure. `TauCeti.integral_laplacian_mul_ballGreenKernel` needs `3 ≤ n`. The pinned `TauCeti.planarGreenKernelDisk` is positive, while the README took `G ≤ 0`. Harnack's inequality is pinned (`InnerProductSpace.HarmonicOnNhd.harnack_inequality_center`).

Change in §7.1: "every subharmonic `v : D(0,R) → [−∞,0]` … Green–Riesz" → three steps.
- A new target, the Green representation on a disc for `C²` `v`: `v(a) = h(a) − ∫ G_ρ(w,a)Δv(w)`, with `G_ρ = planarGreenKernelDisk ≥ 0`. Jensen's formula is its value at the centre.
- The one-variable estimate, restated for `C²` `v` with `Δv ≥ 0`.
- The local estimate.

The `point mass` and `centre` Checks now use smooth `v_ε`, and three Checks on the representation were added.

This is "differently" because the route avoids the suggested Green's theorem on the disc (DifferentialGeometry Layer 5.6). It uses only pinned inputs:
- the planar Newtonian identity;
- harmonicity of the kernel's correction term;
- Green's identity against test functions;
- Weyl's lemma;
- the comparison principle;
- the Dirichlet problem on a ball.

The `*Needs:*` line, the Layer 7 Dependencies, the Tau Ceti contract (one new bullet) and the Mathlib contract (`MeasureTheory.Measure.toSphere`) list every name used. Scope and ownership records this roadmap as owner of the `C²` disc representation, delimited from PDE §3.4 (C15)'s Green solution operator for given data.

## RT-ComplexHessianEquations~1a/F02 (P3) — applied

Verified: Mathlib's `Young` section (`Mathlib/Analysis/MeanInequalities.lean:532`) has only the power form. Change in §8.3: "with the generalized Young inequality for `η(x) = (log(1+x))^p`" → "with a pointwise inequality". The inequality `y^p e^{nF_t} ≤ e^{nF_t}(1+n|F_t|)^p + (p/e)^p e^{2y}` is stated with its two-case proof and its locator (gpt2023 line 303–321). A Check was added: the values at `nF_t = 0`, and an instance showing that neither term can be dropped.

## RT-ComplexHessianEquations~1a/F03 (P3) — applied differently

Verified. With `f := 0`, `ConcaveOn.1` of `concaveOn_spectralFunction` gives `convex_spectralDomain` in one term, under the same `hΓo`, `hΓc` and `hΓs`. Change: the declaration is deleted from `Suggested.lean`. In README §1.4: "`convex_spectralDomain` and `concaveOn_spectralFunction` … state the first two items" → "`concaveOn_spectralFunction` … states the second item, and with it the first at `f = 0`". The module docstring now reads "the concavity of spectral functions on their convex spectral domains". The applied-differently part: the docstring of `concaveOn_spectralFunction` gained the clause "in particular (at `f = 0`) the spectral domain is convex".

## RT-ComplexHessianEquations~1a/F04 (P3) — applied

Verified: §4.2 (README "or more generally an admissible pair with `Γ` convex") and `eq_of_isNormalizedSolution` (`hΓ : Convex ℝ P.cone`) are wider than "How to read the build" said. Change: "for every concave admissible pair" → "for every admissible pair with a convex cone, in particular every concave admissible pair". A concave admissible pair has a convex cone by the §2.4 definition. Every convex cone containing `Γ_n` has `Γ + Γ_n ⊆ Γ`, which is what §4.1 needs.

## RT-ComplexHessianEquations~1a/F05 (P3) — applied

Verified. With `F = a`, `V = 1`, `q = 2` and `n = 1`, the docstring's integral is `∫ e^{2a} = e^{2a} = ‖e^a‖²_{L²}`. Change in the docstring of `exists_abs_le_hessian_degenerating`: "(the `L^q` norm of `e^{nF}`)" → "(the `q`-th power of the `L^q` norm of `e^{nF}`)". No other occurrence: README §8.7 already says "bounded through `∫ e^{nqF_t} ω_X^n`".

## RT-ComplexHessianEquations~1b/F01 (P2) — applied

Verified. For `(σ_k^{1/k}, Γ_k)` with `1 ≤ k < n` and normalized `F`, §3.3 gives `c^k = binom(n,k)·V/∫e^{kF}`. Jensen's inequality gives `∫e^{kF} ≤ V`, so `c ≥ binom(n,k)^{1/k} > 1`, and `c = 1` has no instance.

Change in `exists_abs_le_of_entropy_le`: the binder `K` → `K₁ K₂`, the constant `1` → a quantified `c` with `c ^ n ≤ K₁`, and the entropy bound `≤ K₂`. The docstring follows.

README §8.6 now states the theorem with `c` and a bound `c̄ ≥ c^n`. Its route is §8.3 plus §8.5(c), applied to the rescaled pair `(f/c, Γ)` with structural constant `γ/c^n`. Two Checks were added (the Hessian constant, the rescaled structural constant) and the `n = 1` Laplace Check was corrected (`c = 1` is forced there). One sentence was added to §8.5.

## RT-ComplexHessianEquations~1b/F02 (P2) — applied

Verified. The barrier `v = −φ + (A/c_B)(R² − |z|²)` gives `v ≥ 0` and `Δ_ω v ≤ A − A = 0`. The pin `TauCeti.PDE.exists_ae_setAverage_rpow_rpow_inv_le_mul_value` (`TauCeti/Analysis/PDE/Regularity/Harnack.lean:284`) applies at `s = 1`, since `(2n−2)·1 < 2n`.

Change in §5.4: the second bullet's route is now this barrier argument, with a barrier Check on the torus. The README no longer names `gap:weak-harnack-supersolutions` (PDE contract paragraph, Scope clause, §§5.4, 8.5, 8.7 `*Needs:*`, Layer 5 and 8 Dependencies); a Tau Ceti contract bullet cites the pin. `sources.toml` drops Theorem 8.18 from `gilbarg-trudinger2001`. The plan's `gaps` entry stays (see Gate failure).

## Checks run

- **Elaboration.** `lake env lean packages/ComplexHessianEquations/Suggested.lean`, run from the content checkout, produced 17 `declaration uses 'sorry'` warnings, no errors and no other messages. The file has 31 declarations.
- **Signatures.** I put `#check @name` for all 31 declarations into one scratch file and elaborated it once. `exists_abs_le_of_entropy_le` elaborates with every binder of README §8.6: `K₁ K₂`, `∀ (c : ℝ)`, `IsNormalizedSolution P κ κ F c φ` and `c ^ finrank ℂ E ≤ K₁`. Every other type is unchanged from the job's `signatures.md`. The five definitions flagged there still lack only `[FiniteDimensional ℂ E]` or `[IsManifold 𝓘(ℂ, E) ∞ X]`, which their bodies do not use. Every theorem carries both.
- **New pinned names.** I `#check`ed seven of them at the pins, all resolving: `TauCeti.le_average_toSphere_of_laplacian_nonneg`, `TauCeti.le_setAverage_ball_of_laplacian_nonneg`, `InnerProductSpace.HarmonicOnNhd.average_toSphere_eq`, `ContDiffOn.integral_laplacian_smul_eq_integral_smul_laplacian`, `TauCeti.integral_eq_integral_Ioi_integral_toSphere`, `LinearIsometryEquiv.map_toSphere` and `MeasureTheory.Measure.toSphere`. The modules of the other fourteen have no object files, and building them is not among this job's Lean commands. I verified those fourteen in the pinned sources instead, by file, line and namespace stack:
  - `TauCeti.planarNewtonianKernel` (`Planar/Basic.lean:47`);
  - `TauCeti.planarGreenKernelDisk`, `TauCeti.planarGreenKernelDisk_pos`, `TauCeti.planarGreenKernelDisk_eq_zero_of_norm_sub_eq` and `TauCeti.harmonicAt_planarGreenKernelDisk_sub_newtonianKernel` (`GreenFunction/Disk.lean:35,76,69,90`);
  - `TauCeti.integral_laplacian_mul_planarNewtonianKernel_sub` (`Planar/DistributionalLaplacian.lean:288`);
  - `TauCeti.integral_laplacian_eq_zero_of_hasCompactSupport` (`Laplacian/Integral.lean:37`);
  - `TauCeti.exists_harmonicOnNhd_ball_continuousOn_closedBall_eqOn_sphere` (`PoissonIntegral/Ball.lean:386`);
  - `TauCeti.harmonicOnNhd_iff_weaklyHarmonicOn` and `InnerProductSpace.HarmonicOnNhd.weaklyHarmonicOn` (`Harmonic/Weyl.lean:398,204`);
  - `TauCeti.SubharmonicOn.le_of_le_frontier` and `InnerProductSpace.HarmonicOnNhd.subharmonicOn` (`Harmonic/Subharmonic.lean:147,85`);
  - `InnerProductSpace.HarmonicOnNhd.harnack_inequality_center` (`PDE/Harnack/Planar.lean:116`);
  - `TauCeti.PDE.exists_ae_setAverage_rpow_rpow_inv_le_mul_value` (`PDE/Regularity/Harnack.lean:284`).
- **Dependency check**, output: `depcheck: 245 roadmaps, 2289 edges, 0 problem(s)`. No UPWARD, CYCLE or `moved:` line.
- **`roadmaps resolve`** on the README: no cross-roadmap citation and no Lean name found nowhere. On this run the resolver says it did not check names outside TauCetiRoadmap, hence the manual checks above.
- `design/plan.json` is byte-identical to the committed file (`git diff` empty); its `gaps` list keeps its one entry, `weak-harnack-supersolutions`. The worker's plan check, run on the committed and the current file, reports no problem.

## Gate failure

- `packages/ComplexHessianEquations/design/plan.json: removes the gaps weak-harnack-supersolutions, which targets of the plan still name`. Repaired: the `gaps` entry `weak-harnack-supersolutions` (supplier PDE, section §5.4 (E23)) is restored exactly as committed. The prerequisites of its targets 5.4.2, 8.5 and 8.7 name it, and they cannot change at this stage. Nothing else changed. The README names no `gap:` slug, so every gap it names is declared in the plan.

## Adversarial pass (changed and added statements)

| Statement | Instances and computed values | Result |
| --- | --- | --- |
| Green representation on a disc (§7.1) | `v = |w|²`, `D(0,1)`: `v(0) = 1 − 4∫_0^1 s log(1/s)ds = 1 − 1 = 0`; `v(1/2) = 1 − 4·(3/16) = 1/4`; sign-flipped model gives `2`, `7/4`. Harmonic `v = Re w`: `Δv = 0`, `v = h`. Kernel bound: `|1 − conj(w−c)(a−c)/ρ²| < 2` | holds; Checks added |
| Jensen at the centre | `v_ε = (1/2)log(|w|²+ε)`: `(1/2)log(1+ε) − (1/2)log((1+ε)/ε) = (1/2)log ε = v_ε(0)` | holds; Check added |
| Kernel decomposition in route | `N(ρ⁻¹(a−w)) = N(a−w) + (2π)⁻¹log ρ`; `∫Δχ = 0`; pinned harmonic difference has pole `w`, variable `a` | holds |
| One-variable estimate (`C²`) | `v ≡ −A`: `πr²e^{αA} ≤ 2π(2R')²(R/R')^{C_H}`; `v_ε` near point mass, `r = 3R/4`, `R' = 7R/8`: `v_ε < 0` on `D(0,9R/8)` (`233/64 < 4`), `A = log 4`, `M_ε < 2π ≤ 2π·10.38`, `α_1 ≈ 0.096 < 2`; `R' < R/2`: `M_ε → 0` | holds |
| Centre-hypothesis Check | `(c/2)log((|t|²+ε)/R²)`, `ε ≤ R²/4`: on `D(R/4, 9R/16)`, `|t| < 13R/16`, `233/256 < 1`; `A = c log 4`; `α_1c ≈ 0.2075 < 2`; `0 ∈ D(R/4, 5R/16)` | holds |
| Slices of the local estimate | `|x_0 + tξ| < 1/4 + 7/4 = 2`; `R/R' = 12/11`; `B(x_0,5/4) ⊇ B(0,1)` | holds |
| §5.4 barrier | torus `n = 1`: `c_B = 2`, `φ = −(A/2)x²`: `Δ_ω φ = −A/2`, `Δ_ω v = −A/2`; without barrier `+A/2`; `(2n−2) < 2n` at `n = 1, 2`: `0 < 2`, `2 < 4`; `v(x_m) ≤ AR²/c_B`; non-Kähler `e^ρω_0` (§5.1 Check) breaks divergence form, hence `dω = 0` kept | holds |
| §8.3 pointwise inequality | `nF = 0, p = 2`: `y = log 2`: `0.48 ≤ 1`; `y = 1`: `1 ≤ 4`; `nF = 10, y = 5`: `5.5·10⁵ > 1.2·10⁴` (second term alone fails), `≤ 2.7·10⁶` | holds; Check added |
| §8.6 / `exists_abs_le_of_entropy_le` | Laplace `n = 2`, `F = 0`, `φ = 0`, `c = 2`: hypotheses hold for `K₁ ≥ 4`, conclusion `0 ≤ C`; Hessian `(3,2)`: `c = √3`; MA: `c = 1`; `n = 1` Laplace: `V = cV`; rescaled `σ_1/2`: `∏∂_j = 1/4 = γ/c²`; `K₁ ≤ 0`: hypothesis unsatisfiable for `c > 0`, `n ≥ 1` | holds; old form vacuous off MA |
| §8.5 added sentence | `(2,1)`, normalized `F`: forced `V⁻¹∫e^{2F} ≥ 4 ≠ 1` | holds |
| `concaveOn_spectralFunction` docstring | `f = 0`: symmetric, `C¹`, concave on convex `Γ`; non-convex cone of §1.4 excluded by `hΓc` | holds |
| How to read the build (F04) | convex cone: `μ + d = 2·((μ+d)/2) ∈ Γ`; §4.1 non-convex cone `f(μ) = 6 > 1.11` | holds |
| F05 docstring | `F = a, V = 1, q = 2, n = 1`: `e^{2a} = (e^a)²` | holds |

## Ownership

I searched the roadmaps for the Green representation and Jensen's formula by object (`roadmaps grep`). The hits:
- PDE §3.4 (C15) on main plans the Green solution operator `G_B f` for given data, not the representation of a given `C²` function.
- ArithmeticDynamics (open) treats sphere Riesz measures, a different object.

This roadmap therefore owns the disc representation, stated narrowly at `C²`, and Scope and ownership says so. No declaration of `Suggested.lean` reuses a fully qualified name of another roadmap.

## For the maintainer

- The README no longer consumes `gap:weak-harnack-supersolutions` (PDE §5.4): its §5.4 route needs only the pinned homogeneous weak Harnack inequality. The entry stays in the plan's `gaps` list because the accepted plan's targets 5.4.2, 8.5 and 8.7 still name it, and at the package stage only that list may change. For this roadmap PDE need not supply it.
- `convex_spectralDomain` was deleted and `exists_abs_le_of_entropy_le` changed signature. No roadmap on main or at an open head cites either name, nor the gap slug.
- No source was fetched and `needs-references.toml` was not written.
- No text in the reviews read as an instruction.
