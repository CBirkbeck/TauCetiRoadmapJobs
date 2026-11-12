# Review of SobolevMapsBetweenManifolds (pull request #2230 at cd6db2b)

**Verdict:** needs changes

## R01 (P2) — Two end-theorem clauses are statable at the pins but absent from `Suggested.lean`

**Location:** `README.md:24–26` "preserved by precomposition with `C¹` submersions and postcomposition with `C¹` maps, with the chain rule for `Df`"; `README.md:41–42` "agrees with the extrinsic space, with the induced target norm"; `Suggested.lean:31–34`.

**Claim:** `Suggested.lean` states the chain rule only for postcomposition. It also omits the §10.4 comparison, and its docstring gives as the reason the lack of a tangent-norm carrier. The norm induced by `ι` needs no such carrier.

**Witness:** Both theorems below elaborate in a scratch copy with only `sorry` warnings (27, no error). QuasiregularMaps' gap `sobolev-maps-chain-rules` (its README:400) consumes `D(f ∘ θ) = Df(θ) ∘ dθ`.

**Repair:** Insert after `IsSobolevMap.comp_submersion`:

```lean
/-- §4.6(a): the chain rule for precomposition with a submersion. -/
theorem HasWeakMFDeriv.comp_submersion [CompleteSpace E']
    {E₀ : Type*} [NormedAddCommGroup E₀] [NormedSpace ℝ E₀] [FiniteDimensional ℝ E₀]
    [MeasureSpace E₀] [BorelSpace E₀] [(volume : Measure E₀).IsAddHaarMeasure]
    {M₀ : Type*} [TopologicalSpace M₀] [ChartedSpace E₀ M₀] [IsManifold 𝓘(ℝ, E₀) 1 M₀]
    {f : M → N} {θ : M₀ → M}
    {Df : (x : M) → TangentSpace 𝓘(ℝ, E) x →L[ℝ] TangentSpace 𝓘(ℝ, E') (f x)}
    (hf : Continuous f) (hDf : HasWeakMFDeriv E E' f Df)
    (hθ : ∀ x, Manifold.IsSubmersionAt 𝓘(ℝ, E₀) 𝓘(ℝ, E) 1 θ x) :
    HasWeakMFDeriv E₀ E' (f ∘ θ) (fun y => (Df (θ y)).comp (mfderiv 𝓘(ℝ, E₀) 𝓘(ℝ, E) θ y)) := by
  sorry
```

Insert before `end Density`:

```lean
/-- §10.4: for a compact target with a smooth embedding `ι` into a finite-dimensional space, a
map lies in the local homogeneous class of §5.4 for the target norm induced by `ι` (a colocal
weak differential whose `ι`-image is locally `Lᵖ` in charts) iff `ι ∘ u` lies in
`W^{1,p}_loc(M; F)`; on a compact source this is `W^{1,p}_ι(M, N)` (Convent–Van Schaftingen,
Prop. 1.6, p. 6, and Prop. 2.6, p. 11). -/
theorem memW1pLocM_comp_iff_exists_hasColocalWeakMFDeriv [FiniteDimensional ℝ E']
    [FiniteDimensional ℝ F] [MeasurableSpace N] [BorelSpace N]
    [IsManifold 𝓘(ℝ, E) 1 M] [T2Space M] [SecondCountableTopology M]
    [IsManifold 𝓘(ℝ, E') ∞ N] [T2Space N] [CompactSpace N]
    {ι : N → F} (hι : ContMDiff 𝓘(ℝ, E') 𝓘(ℝ, F) ∞ ι) (hιemb : Topology.IsEmbedding ι)
    (hιimm : ∀ y, Manifold.IsImmersionAt 𝓘(ℝ, E') 𝓘(ℝ, F) ∞ ι y)
    {p : ℝ≥0∞} (hp : 1 ≤ p) {u : M → N} :
    MemW1pLocM E p (ι ∘ u) ↔
      ∃ Du : (x : M) → TangentSpace 𝓘(ℝ, E) x →L[ℝ] TangentSpace 𝓘(ℝ, E') (u x),
        HasColocalWeakMFDeriv E E' u Du ∧ ∀ x : M,
          MemLpLoc (F := E →L[ℝ] F) p (extChartAt 𝓘(ℝ, E) x).target fun y =>
            ((mfderiv 𝓘(ℝ, E') 𝓘(ℝ, F) ι (u ((extChartAt 𝓘(ℝ, E) x).symm y))).comp
              ((Du ((extChartAt 𝓘(ℝ, E) x).symm y)).comp
                (mfderiv 𝓘(ℝ, E) 𝓘(ℝ, E) (extChartAt 𝓘(ℝ, E) x).symm y)) : E →L[ℝ] F) := by
  sorry
```

Then make these edits:
- README §4.6(a), after "is a weak differential of it": add "(`HasWeakMFDeriv.comp_submersion`)".
- README §10.4, end of the sentence "prove `D(ι ∘ u) = dι_u ∘ Du` and `‖D(ι ∘ u)‖ = ‖Du‖` almost everywhere": add "(`memW1pLocM_comp_iff_exists_hasColocalWeakMFDeriv` for the local class)".
- Module docstring, "Stated here", add two items: "the chain rule for precomposition by submersions (§4.6(a))" and "the comparison of the intrinsic class with the extrinsic one for compact targets, with the norm induced by the embedding (§10.4)".
- Module docstring, first "Not statable" bullet: replace "the energy classes of §5.4 with their comparisons" with "the energy classes of §5.4 for general compatible norms".
- Pull-request description, `Suggested.lean` paragraph: add both theorems.

## R02 (P2) — §7.3 and §2.3 plan Banach-valued objects that Tau Ceti already has at the pin

**Location:** `README.md:1275–1278` "Build the first-order Banach-valued Euclidean component space from the closed graph … Weak-derivative closedness supplies completeness"; `README.md:270–271` "The scalar estimates are suppliers"; `README.md:513–514` "Build the Banach-valued Poincaré inequality on balls by the segment-integral proof".

**Claim:** Tau Ceti already supplies both objects, and the supplier contracts name neither:
- the complete graph space of `u ↦ (u, Du)` over Bochner `Lᵖ(Ω; F)` for Banach `F`;
- the Banach-valued segment (potential) estimate for `C¹` functions.

**Witness:** At Tau Ceti `2fd255d`:
- `GraphStep/Basic.lean:209` defines `TauCeti.WeakDerivStep` (any complete `F`), and `:398` gives its `CompleteSpace` instance.
- `Poincare/Potential.lean:251` states `TauCeti.enorm_sub_setAverage_le_of_convex` for `u : E → F`.

**Repair:**
- From Tau Ceti, add a bullet: "`TauCeti.WeakDerivStep` (`TauCeti/Analysis/Sobolev/GraphStep/Basic.lean`). With base the identity of `Lp F p (volume.restrict Ω)`, it is the complete first-order space `W^{1,p}(Ω; F)` for Banach `F`, with `TauCeti.mem_weakDerivStepSubmodule_iff_hasWeakFDerivOn`, `TauCeti.WeakDerivStep.tendsto_iff_prev_weakFDeriv` and `TauCeti.WeakDerivStep.restrictBaseL`."
- `README.md:269–271`: replace "Poincaré inequalities on balls under `TauCeti/Analysis/Sobolev/Poincare/`. The scalar estimates are suppliers; §2.3–§2.4 build their Banach-valued local versions" with "Banach-valued potential estimate for `C¹` functions `TauCeti.enorm_sub_setAverage_le_of_convex` (`Poincare/Potential.lean`) with the scalar mean-oscillation bound `TauCeti.W1p.setLAverage_enorm_value_sub_setAverage_ball_le_mul_measure_rpow` (`W1p/BoundedMeanOscillation.lean`); §2.3–§2.4 build the Banach-valued Sobolev versions".
- §2.3: replace "Build the Banach-valued Poincaré inequality on balls by the segment-integral proof and Minkowski's inequality" with "Derive the Banach-valued Poincaré inequality on balls from `TauCeti.enorm_sub_setAverage_le_of_convex` and the `Lᵖ` bound of the Riesz potential".
- §7.3: replace the sentences "Build the first-order … supplies completeness, and" with "The Euclidean chart component is `TauCeti.WeakDerivStep` over `Lp F p`, complete by its `CompleteSpace` instance; the §5.2 carrier of a trivial bundle with finite-dimensional fibre is its specialization, and". Then add `TauCeti.WeakDerivStep` to §7.3's *Needs*.
- §1.2, `README.md:400–401`: replace "The complete quotient carrier and its identification with the bundle carrier are built in §7.3." with "The complete quotient carrier on `U` is `TauCeti.WeakDerivStep`; its identification with the bundle carrier is §7.3."

## R03 (P3) — The build paragraph misstates two internal orders

**Location:** `README.md:325` "Layer 2 needs Layer 1;"; `README.md:329` "§9.3 does not depend on §9.1–§9.2."

**Claim:** §2.1, §2.2 and §2.4 need the later §2.3. §9.3(d) uses §9.2, so the sentence about §9.3 is false.

**Witness:** `README.md:475` (§2.1) "*Needs:* §1.2, §2.3"; `:502` (§2.2) "*Needs:* §1.2, §2.3"; `:1579` "Part (d)'s direct retraction construction additionally uses §9.2."

**Repair:** Replace "Layer 2 needs Layer 1;" with "Layer 2 needs Layer 1; within it §2.3 is built first, since §2.1, §2.2 and §2.4 use its mollification;". Replace "§9.3 does not depend on §9.1–§9.2." with "§9.3(a)–(c) do not depend on §9.1–§9.2; the retraction construction of §9.3(d) uses §9.2."

## R04 (P3) — The section comments of `Suggested.lean` are not in README order

**Location:** `Suggested.lean:53` "Layer 1" (it also heads the §2.1–§2.4 theorems); `:234` "Layer 9" (before `:289` "Layers 4.7–4.8" and `:368` "Layer 6").

**Claim:** The file's layer order is 1, 4, 9, 4.7–4.8, 6, 10, 11, and Layer 2 has no heading.

**Witness:** `Suggested.lean:77–101`: §2.1(a), §2.2 and §2.4 theorems under the Layer 1 comment. `:234–285`: the Layer 9 block inside `section Manifold`.

**Repair:** Tested together with R01: 27 `sorry` warnings, no error, and the three moved declarations keep their binders.
1. Insert `/-! ## Layer 2: Euclidean calculus of the local class -/` before the docstring of `MemW1pLoc.comp_contDiffOn`.
2. Cut the lines from `/-! ## Layer 9: the extrinsic characterization -/` to just before `end Manifold`.
3. After `end JacobianOfMap`, paste:

```lean
/-! ## Layer 9: the extrinsic characterization and smooth approximation -/

section Approximation

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [MeasureSpace E] [BorelSpace E] [(volume : Measure E).IsAddHaarMeasure]
  {E' : Type*} [NormedAddCommGroup E'] [NormedSpace ℝ E']
  {E'' : Type*} [NormedAddCommGroup E''] [NormedSpace ℝ E'']
  {M : Type*} [TopologicalSpace M] [ChartedSpace E M] [IsManifold 𝓘(ℝ, E) 1 M]
  {N : Type*} [TopologicalSpace N] [ChartedSpace E' N] [IsManifold 𝓘(ℝ, E') 1 N]

-- the three declarations cut in step 2, unchanged

end Approximation
```

## Previous findings

- R01: repaired. `Suggested.lean:169` states `isSobolevMap_iff_forall_maximalAtlas` and `:203` states `IsSobolevMap.of_locally`; `README.md:773` and `:849` name them.
- R02: repaired. `Suggested.lean:462` states `exists_smooth_approx_of_controlledRetraction`, `README.md:1663` names it, and docstring lines 26–28 list it.
- R03: repaired. `README.md:57` reads "the local Lebesgue class `MemLpLoc` and the first-order local Sobolev class", and `:124` puts "Sobolev classes of order `k ≥ 2`" outside the roadmap.
- R04: repaired. All ten locators are present (`README.md:339`, `:584`, `:743`, `:875`, `:1012`, `:1363`, `:1398`, `:1648`, `:1692`, `:1764`).
- R05: repaired. `README.md:1809–1815` lists only QuasiregularMaps and a harmonic-maps consumer.
- R06: repaired. `README.md:304–306` no longer contains the `dπ` clause.
- R07: repaired. `README.md:229–231` reads "Mathlib has no conversion from a surjective differential to `Manifold.IsSubmersionAt`".
- R08: repaired. `README.md:331` reads "needs §6.3 and Layers 8–10", and so does `:1807`.
- R09: repaired. The description reads "Theorem- and page-level locators cite …" and lists chart independence, locality and the controlled-retraction density.

## Verified sound

| Target | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| §1.2 class, `memW1pLoc_iSup_iff` (sampled) | sup norm, `x = (1, 1/2)`; `log|x|` on `ℝ²`; empty cover | `Du(x)(0,1) = 0` vs `1/√5 ≈ 0.447`; `∫₀¹ r^{1−p} dr < ∞` iff `p < 2`; `⨆ ∅ = ⊥`, both sides true | holds | — |
| §2.1(a) `MemW1pLoc.comp_contDiffOn` | `g = y²`, `u = |x|^{−1/4}` on `ℝ²` | `Du ∈ Lᵖ_loc` iff `p < 8/5`; `D(u²) ∈ Lᵖ_loc` iff `p < 4/3`: continuity hypothesis needed | holds | — |
| §2.2 `comp_contDiffOn_diffeo` | `z²` on `ℂ∖{0}`; `2x`; `dim E = 0` | `det = 4|z|² ≠ 0`, `Φ(1) = Φ(−1)`; `‖u∘Φ‖_{Lᵖ(K)} = 2^{−n/p}‖u‖_{Lᵖ(2K)}`; `det = 1` | holds | — |
| §2.4 `exists_continuousOn_ae_eq` | `dim E = 0`; `F = ℓ²`, `u_j = e_j` | `0 < p`, `v = u`; `‖e_j − e_k‖ = √2`, no compactness claimed | holds | — |
| §2.5 (sampled) | `θ(x,t) = x`; constant `ℝ → ℝ` | `D(u∘θ)(h,s) = Du(x)h`; preimage of `{c}` is `ℝ`, not null; `IsSubmersionAt` gives `C^n` (`Submersion.lean:172`) | holds | — |
| §3.2 (sampled) | `|x|^{−1/3}`, `h(y) = y³`; `1` with metric `e^{2x}dx²` | `∫_{−1}^{1}|x|^{−2/3} = 6`; `u∘h = |y|^{−1} ∉ L¹_loc`; `∫eˣdx = ∞`, `‖1‖_∞ = 1` | holds | — |
| §3.3 (sampled) | `t ↦ e^{2πit}`; constant map | preimage of a point is `ℤ`, null; constant preimage `ℝ`; `Jacobian.lean:556` present; Lee uncertified | holds | — |
| §4.1 (sampled) | `u = x` in chart `2x`; `log|x − x₀|` on `S²` | representative `y/2`, derivative `1/2 = du∘dφ⁻¹`; `Lᵖ` iff `p < 2`; CVS lines 182–186, p. 4 | holds | — |
| §4.2 `isSobolevMap_iff_forall_maximalAtlas` | homeomorphic chart `y³`; `p < 1` | `|x|^{−1/3}∘y³ = |y|^{−1}`: `C¹` atlas needed; `HasWeakFDerivOn` forces `L¹_loc`, so all `p` are true | holds | — |
| §4.3 `exists_hasWeakMFDeriv`, `.ae_eq` | `|t|`; `dim E = 0` | `Df = sign t` off `{0}`; `T_xM = 0`, `Df` unique, `IsNullSet ∅` | holds | — |
| §4.4 `isSobolevMap_of_contMDiff` (sampled) | `t|t|` | weak derivative `2|t|` equals classical; CVS Prop. 1.1, line 196, p. 4 (continuous derivative iff `C¹`) | holds | — |
| §4.5 `IsSobolevMap.of_locally` | `U_k = (k−1, k+1)` | chart of `Opens M` is the restricted chart; continuity at `x` from `V ∋ x` open | holds | — |
| §4.6 `comp_contMDiff`, chain rules (sampled) | `g = y²`, `f = |t|^{1/2}`; `θ(x,t) = x`, `f = |x|` | `2|t|^{1/2} sign t/(2|t|^{1/2}) = sign t`; `D(f∘θ) = (sign x, 0) = Df(θ)∘dθ`; precomposition rule absent | holds | R01 |
| §4.7 `isColocallyWeaklyDifferentiable` | `1/x`, `u(0) = 0`; `sign x` | probes vanish near `0` off one point; `φ(1) ≠ φ(−1)` gives a jump; CVS Def. 1.1, line 155 | holds | — |
| §4.8 colocal differential (sampled) | `|t|`, zero field; `n = 1` radial | probe `y` on `[−1,1]`: `D(φ∘u) = sign t ≠ 0`; `sign x` into `S⁰` not colocal; CVS lines 188, 215, 308, 314 | holds | — |
| §5.1 (sampled) | `2x`, source `4|dx|²`; sup-norm projection | `‖Df‖ = 2/2 = 1`; `sup|v₁|/max(|v₁|,|v₂|) = 1`; HP line 26, p. 1 | holds | — |
| §5.3 (sampled) | `g = dx²`, `g' = 4dx²`, `f = id` | `a = 2`, `‖Df‖ = 1`, `‖Df‖' = 1/2`; factor `C^{1/p}ab`; Hajłasz lines 104–105, p. 187 | holds | — |
| §5.4 (sampled) | `u = x`, `u(0) = 1` into `ℝ∖{0}`, `g = sign` | `Du = 1`; `g∘u` jumps at `0`; CVS Def. 2.1, line 407, p. 8: `p ∈ [1,∞)`, Hilbert–Schmidt | holds | — |
| §6.1 `orientedJacobian` and four theorems | `diag(2,1)`; `diag(−1,1)`; `n = 0`; one-tactic probes | `J = 2 ≤ 4`; `J = −1`, `+1` into `−std`; `J = ±1`, `‖A‖⁰ = 1`, `det = 1`; none closes | holds; not padding | — |
| §6.3 `integrableOn_orientedJacobian` (sampled) | `|x|^{−1/2}x` on `ℝ²`; `n = 0` | `‖Df‖ = r^{−1/2} ∈ Lᵖ_loc` iff `p < 4`; `J = r^{−1}/2 ∈ L^q_loc` iff `q < 2`; `J = ±1` on finite `K` | holds | — |
| §7.1 (sampled) | `(ℝ², max)`, `f = x₁ + x₂` | `‖Df‖ = 2` vs Euclidean `√2`; MRV p. 6, line 124, `J(x, f)` | holds | — |
| §7.3 carrier | `TauCeti.WeakDerivStep` at the pin | graph of `(u, Du)` in `WithLp 2 (Lp F × Lp (E →L F))`, complete (`Basic.lean:398`) | already at pin | R02 |
| §9.1 `isSobolevMap_iff_memW1pLocM_comp_immersion` | figure eight; `(x_j) ↦ (x_j/j)` | `ι∘f` continuous, `f` jumps at `0`: `hf` needed; no bounded left inverse | holds | — |
| §9.2 (sampled) | `ι(t) = (t,t²)`, `r = z₁`; `S^{m−1}` | `d(ι∘r)dι(1) = (1,2t) = dι(1)`; `dπ = I − zzᵀ`; R6 RiemannianGeometry README:3479 | holds | — |
| §9.3 `exists_smooth_approx_rel` | `A = ∅`; `p = ∞` | `V'` exists (`M` normal); `‖sign − g′‖_∞ ≥ 1`; Wockel Thm 0.11, line 170, p. 4 | holds | — |
| §10.2 (sampled) | `θ = χ log log(1/|x|)`, `p = n = 2` | `∫₀ dr/(r log²(1/r)) < ∞`, `θ` unbounded; Hajłasz lines 133–134, p. 188 | holds | — |
| §10.3 `…_controlledRetraction` | `N = ∅`; `S(ℓ²)`, `δ = 1/2` | `infDist z ∅ = 0`, so `U = F` and `r : F → ∅` cannot exist; tube `1/2 < ‖z‖ < 3/2 ⊆ H∖{0}` | holds | — |
| §10.3 `exists_smooth_approx_of_ae_mem_range` | Hajłasz Thm 2.1; `N = ∅` | line 129: `p > n`; lines 138–182 cover `p = n`; empty range forces `M = ∅` | holds | — |
| §10.4 comparison (R01 probe) | `S¹ ⊆ ℝ²`, smooth `u`; finite `N` | both sides true; finite `N`: both sides mean `u` a.e. locally constant, `Du = 0` | holds; statable | R01 |
| §11.3 `not_exists_smooth_sphere_approx_radial` | `n = 2`, `p = 1`; `p = n` | `∫_B|x|⁻¹ = 2π`; `∫₀¹ r⁻¹dr = ∞`; Hajłasz Thm 2.3, line 227, p. 189 | holds | — |
| Layer 2 order, §9.3 dependencies | *Needs* lines | §2.1 and §2.2 need §2.3 (`:475`, `:502`); §9.3(d) uses §9.2 (`:1579`) | misstated | R03 |
| `Suggested.lean` layer comments | header order | 1 (with 2), 4, 9, 4.7–4.8, 6, 10, 11 | out of order | R04 |

- **Source locators checked (25):** ConventVanSchaftingen2016 lines 128–141, 155, 182–186, 188, 196, 215, 272, 282, 308, 314, 407, 563; Hajlasz2009 lines 20–28, 102–106, 129, 131–182, 227, 235–252; HeikkilaPankka2025 lines 22–27, 322–342; MartioRickmanVaisala1969 line 124; ArendtKreuter2018 lines 85–104, 378, 736; Wockel2009 line 170.
- **Library declarations opened at the pins (54):**
  - Tau Ceti `2fd255d` (36), e.g. `WeakDeriv/Basic.lean:212, 251, 292, 453, 569, 747, 856`, `Local.lean:71`, `Classical.lean:138, 145`, `Limit.lean:89`, `Interval.lean:203`, `W1p/ChainRule.lean:375`, `W1p/InteriorMorrey.lean:204`, `Wkp/MeyersSerrin.lean:291`, `GraphStep/Basic.lean:209, 398`, `Poincare/Potential.lean:251`, `Manifold/Measure.lean:36, 50`, `VolumeDensity/Volume.lean:82, 179`, `Orientation/Basic.lean:32, 140, 235`, `TopForm.lean:46, 518`, `BoundarylessStokes.lean:122`, `Degree/Basic.lean:76`, `TubularNeighborhood/Euclidean.lean:447`.
  - Mathlib `1b1ccf4` (18), e.g. `Jacobian.lean:556, 1184`, `Submersion.lean:172`, `Immersion.lean:191, 489`, `ImmersionDiff.lean:65, 165`, `WhitneyEmbedding.lean:132`, `SmoothApprox.lean:104`, `Orientation.lean:198, 223, 245`, `NormDet.lean:69, 389`, `Haar/OfBasis.lean:310`.
- **Cross-roadmap citations resolved on main:**
  - PDE §1.2, §1.4, §1.5 (README:720, 803, 855);
  - PseudoholomorphicCurveAnalysis §1.1 (:213) and §4.1 (:807);
  - PseudodifferentialOperators §5.2 (:967) and Yamabe Y1 (:111);
  - RiemannianGeometry R4.6 (:120) and R6 (:3479), unchanged at the head of its open revision (:129, :3488);
  - DifferentialGeometry 2.1–2.2 (:1009, :1041), Layer 5 (:1644), 10.3–10.5 (:2716, :2750) and 12.4 (:2896).
  - QuasiregularMaps' six gap contracts cite only sections present here.
- **Gate:** rerun on this head: every check OK, nothing changed outside the folder. Dependency check: `depcheck: 206 roadmaps, 1897 edges, 0 problem(s)`.
- **Elaboration:** `lake env lean` on `Suggested.lean` gives 25 `sorry` warnings and nothing else.
- **Signatures:** the elaborated types of all 39 declarations were compared with the README; the theorems keep their Haar, `IsManifold` and finite-dimensionality binders. Lean leaves `p` unrestricted where the README Conventions fix `1 ≤ p`. This is true for all `p`, because `HasWeakFDerivOn` forces `L¹_loc`. `Suggested.lean:202` begins a docstring line with "class"; the worker's scan reads that as a declaration `is`, and elaboration is unaffected.
- **Probes:**
  - The R01 theorems and the R04 restructure elaborate together: 27 `sorry` warnings, no error.
  - `simp [orientedJacobian]`, `rfl` and `exact?` (originals removed) close none of the four §6.1 theorems.
  - Every Lean name occurs in the README, and every definition section has at least three Checks.
- **Overlap check:** read QuasiregularMaps, YangMillsConnectionsAndCaloricGauge, SobolevDifferentialForms, Surfaces and RiemannianGeometry (open), and DifferentialGeometry, PseudoholomorphicCurveAnalysis and CalibratedGeometry (main). Shared objects and their owners:
  - planar classes: PseudoholomorphicCurveAnalysis §1.1, which is §1.1's case `E = ℂ` here;
  - `W^{1,p}_loc(Ω; F)` on Euclidean domains: this roadmap §1.2. YangMillsConnectionsAndCaloricGauge's gap `vector-valued-wkp` asks PDE for the `k = 1` case with finite-dimensional values;
  - Euclidean scalar weak `d`: SobolevDifferentialForms Layer 2;
  - degree: DifferentialGeometry 10.3–10.5;
  - the class and the Jacobian: this roadmap, consumed by QuasiregularMaps.
  - Surfaces and CalibratedGeometry share nothing.

## Not verifiable

- Ziemer1989, Thm 2.2.2 (§2.2): settled as uncertified, no legal text.
- Lee2012, Ch. 6 and Ch. 15 (§3.3, §6.2): settled as uncertified.
- Rickman1993, Ch. I (Conventions): settled as uncertified.
- Hencl 2011, Schoen–Uhlenbeck 1983, Hajłasz–Iwaniec–Malý–Onninen 2008, Brezis–Nirenberg 1995 (References): not in the manifest's cache.

## Source issues

- **Misprint** in Hajlasz2009 at (2.1), p. 188: the source says the middle term carries the factor `C r`, with `r` undefined there; it should be `C ε`, the radius of the ball; affects nothing.
- **Misprint** in ConventVanSchaftingen2016 at §2, characterization of the norm of the derivative, p. 8: the source says the operator-norm supremum runs over `e ∈ T_yN` with `|e|_{g_N} ≤ 1`; it should be `e ∈ T_xM` with `|e|_{g_M} ≤ 1`; affects nothing.
