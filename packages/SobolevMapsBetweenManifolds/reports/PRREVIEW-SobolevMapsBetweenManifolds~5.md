# Review of SobolevMapsBetweenManifolds (pull request #2230 at ed21777)

**Verdict:** needs changes

## R01 (P2) — The agreement of the intrinsic class with the continuous class is statable but declared not statable

**Location:** `Suggested.lean:33–37` "the energy classes of §5.4 for general compatible norms with their comparison with the continuous class: there is no carrier for continuous norms"; `README.md:41` "agrees with the continuous class on continuous maps".

**Claim:** For a continuous `u`, finite local energy needs no tangent-norm carrier. By §5.3 it is the same for every compatible norm pair: the chart expressions of `Du` are locally `Lᵖ`. So this end-theorem clause can be stated, just as §10.4's was.

**Witness:** The theorem below, inserted before `end Colocal` in a scratch copy, elaborates with only its `sorry` warning. `README.md:1073–1075` makes the energy condition independent of the norms for continuous maps.

**Repair:** Insert before `end Colocal`:

```lean
/-- §5.4: on continuous maps into a finite-dimensional target the local homogeneous class is the
continuous class: a continuous `u` lies in `W^{1,p}_loc(M, N)` iff it has a colocal weak
differential whose chart expressions are locally `Lᵖ`, which for a continuous map is the local
energy condition for every pair of compatible tangent norms (§5.3). -/
theorem isSobolevMap_iff_exists_hasColocalWeakMFDeriv [FiniteDimensional ℝ E'] [BorelSpace N]
    [T2Space M] [SecondCountableTopology M] [T2Space N] [SecondCountableTopology N]
    [IsManifold 𝓘(ℝ, E) 1 M] [IsManifold 𝓘(ℝ, E') 1 N]
    {p : ℝ≥0∞} (hp : 1 ≤ p) {u : M → N} (hu : Continuous u) :
    IsSobolevMap E E' p u ↔
      ∃ Du : (x : M) → TangentSpace 𝓘(ℝ, E) x →L[ℝ] TangentSpace 𝓘(ℝ, E') (u x),
        HasColocalWeakMFDeriv E E' u Du ∧ ∀ x : M,
          MemLpLoc (F := E →L[ℝ] E') p (chartDomain E E' u x) fun y =>
            ((mfderiv 𝓘(ℝ, E') 𝓘(ℝ, E') (extChartAt 𝓘(ℝ, E') (u x))
                (u ((extChartAt 𝓘(ℝ, E) x).symm y))).comp
              ((Du ((extChartAt 𝓘(ℝ, E) x).symm y)).comp
                (mfderiv 𝓘(ℝ, E) 𝓘(ℝ, E) (extChartAt 𝓘(ℝ, E) x).symm y)) : E →L[ℝ] E') := by
  sorry
```

Then make these edits:
- `Suggested.lean`, section comment: replace `/-! ## Layers 4.7–4.8: measurable weak maps into finite-dimensional targets -/` with `/-! ## Layers 4.7–4.8 and §5.4: measurable weak maps into finite-dimensional targets -/`.
- Module docstring, "Stated here": after "existence and uniqueness of its differential (§4.7–§4.8);" add "its agreement with the continuous class on continuous maps (§5.4);".
- Module docstring, first "Not statable" bullet: replace "the energy classes of §5.4 for general compatible norms with their comparison with the continuous class" with "the energy classes of §5.4 for general compatible norms".
- README §5.4, first "Prove" bullet: after "is equivalent to `IsSobolevMap E E' p u`" add "(`isSobolevMap_iff_exists_hasColocalWeakMFDeriv`, with the energy read in charts, which §5.3 makes norm-independent for continuous `u`)".
- Pull-request description, `Suggested.lean` paragraph: after "and of the colocal weak differential;" add "colocality of continuous Sobolev maps and, on continuous maps into a finite-dimensional target, the agreement of the continuous class with the local intrinsic class;".

## R02 (P3) — Five sampled targets carry no source locator

**Location:** `README.md:632–674` (§3.1), `:676–716` (§3.2), `:1046–1062` (§5.2), `:1330–1360` (§8.1), `:1619–1658` (§10.1): none cites a theorem, section or page.

**Claim:** Each section states theorems without a locator. Sources in the manifest support each one at a stated generality.

**Witness:** ConventVanSchaftingen2016 lines 134–150 (p. 3): chartwise measurability, negligible sets, measure independence. HeikkilaPankka2025 line 341 (p. 7): `|f^*β| ≤ (|β|∘f)‖Df‖^ℓ`. Hajlasz2009 line 28 (p. 185): `u ∈ W^{1,p}(M, ℝ^ν)` with `u(x) ∈ N` a.e.

**Repair:**
- §3.1, after "and agreement of `μ`-null sets with chartwise null sets" (`:650`), add "(Convent–Van Schaftingen, §1.1, p. 3, for positive absolutely continuous Radon measures)".
- §3.2, first bullet, after "the notions do not depend on the charts (§2.2) and are local" (`:688`), add "(Convent–Van Schaftingen, §1.1, p. 3)".
- §5.2, after "`‖Df‖ ∈ L^p_loc(M)` (§3.2)" (`:1050`), add "(for compact Riemannian `M`, `N`, finite `p` and an isometric embedding `ι`, where `|∇(ι ∘ f)| = ‖Df‖`: Hajłasz 2009, §1, p. 185)".
- §8.1, after "`|f^♯ω| ≤ |ω ∘ f| ‖Df‖^k` for compatible continuous source and target tangent norms" (`:1339`), add "(for scalar forms and quasiregular maps of a ball: Heikkilä–Pankka, arXiv 2302.11440v2, §3, p. 7)".
- §10.1, after "with `u(x) ∈ ι(N)` for almost every `x`" (`:1621–1622`), add "(Hajłasz 2009, §1, p. 185, for compact Riemannian `N` isometrically embedded in `ℝ^ν`)".

## R03 (P3) — Arendt–Kreuter Thm 4.2 is cited without its differentiability hypothesis

**Location:** `README.md:453` "(Arendt–Kreuter, Thm 4.2, p. 9, for Lipschitz outer maps on bounded domains)".

**Claim:** The theorem needs an outer map that is both Lipschitz and one-sided Gateaux differentiable, with `Ω` bounded or `F(0) = 0`. Without the Radon–Nikodým property, plain Lipschitz maps fail, as `README.md:471–472` itself says.

**Witness:** ArendtKreuter2018 lines 378–380 (Thm 4.2, p. 9) state the hypotheses; lines 340–343 give the failure for Lipschitz maps alone.

**Repair:** Replace the parenthesis with "(Arendt–Kreuter, Thm 4.2, p. 9, for outer maps that are Lipschitz and one-sided Gateaux differentiable, on bounded domains or with `g(0) = 0`)".

## Previous findings

- R01: repaired. `Suggested.lean:241` states `HasWeakMFDeriv.comp_submersion` and `:548` states `memW1pLocM_comp_iff_exists_hasColocalWeakMFDeriv`. `README.md:885` and `:1718` name them, and docstring lines 21–22 and 28–30 list them.
- R02: repaired. `README.md:276–281` supplies `TauCeti.WeakDerivStep`. `:269–273` cites `TauCeti.eLpNorm_sub_setAverage_le_of_convex` (`Poincare/Wirtinger/Basic.lean:232`) and `TauCeti.enorm_sub_le_of_mem_ball_of_finrank_lt` (`Morrey.lean:181`), both Banach-valued at the pin. §1.2, §2.3 and §7.3 are rewritten (`:410`, `:523`, `:1290`).
- R03: repaired. `README.md:333–340` reads "within it §2.3 comes first" and "§9.3(a)–(c) do not depend on §9.1–§9.2".
- R04: repaired. `Suggested.lean:80` heads Layer 2, and Layer 9 is at `:408–470`, after `end JacobianOfMap`. The order is now 1, 2, 4, 4.7–4.8, 6, 9, 10, 11.

## Verified sound

| Target | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| §1.2 `memW1pLoc_iSup_iff` | empty cover; `(−∞,1) ∪ (0,∞)`, `u = \|x\|` | `⨆ ∅ = ⊥`: left side holds on `∅`, right side vacuous; `sign x` agrees on the overlap `(0,1)` | holds | — |
| §2.1 (sampled), `MemW1pLoc.comp_contDiffOn` | `g = y²`, `u = \|x\|^{−1/4}` on `ℝ²`; Arendt–Kreuter Thm 4.2 | `Du ∈ Lᵖ_loc` iff `p < 8/5`; `D(u²)` iff `p < 4/3`; source adds one-sided Gateaux differentiability | holds; locator misdescribed | R03 |
| §2.2 `MemW1pLoc.comp_contDiffOn_diffeo` | `z²` on `ℂ∖{0}`; `2x`; `dim E = 0` | real `det = 4\|z\|²`, `Φ(1) = Φ(−1)`; `‖u∘Φ‖_{Lᵖ(K)} = 2^{−n/p}‖u‖_{Lᵖ(2K)}`; `det = 1` | holds | — |
| §2.4 `MemW1pLoc.exists_continuousOn_ae_eq` | `dim E = 0`; `F = ℓ²`, `u_j = e_j`; `p = ∞` | `v = u`; `‖e_j − e_k‖ = √2`, no compactness claimed; `Morrey.lean:181` bound tends to `2^{n+2} r ‖Du‖_∞` | holds | — |
| §2.6 (sampled) | `u = max(x,0)`, `v = 0` | `{u = v} = (−∞,0]`, `Du = 1_{x>0} = 0` there; CVS Prop. 1.8 line 314 (p. 7), colocality line 160 (p. 4) | holds | — |
| §3.1 (sampled) | `dx²` vs `e^{2x}dx²` on `ℝ`; `riemannianVolume` binders | density `eˣ` unbounded, same null sets; `Volume.lean:58–63` needs Lindelöf and a continuous metric | holds; no locator | R02 |
| §3.2 (sampled) | `\|x\|^{−1/3}`, chart `h(y) = y³` | `∫_{−1}^{1}\|x\|^{−2/3} = 6`; `u∘h = \|y\|^{−1} ∉ L¹_loc`; CVS lines 134–141 support | holds; no locator | R02 |
| §3.3 (sampled) | `t ↦ e^{2πit}`; constant `ℝ → ℝ` | point preimage `ℤ`, null; preimage of `{c}` is `ℝ`, not null; Lee uncertified | holds | — |
| §4.2 `isSobolevMap_iff_forall_maximalAtlas` | homeomorphic chart `y³`; `p < 1` | `\|x\|^{−1/3}∘y³ = \|y\|^{−1}`: `C¹` atlas needed; `HasWeakFDerivOn` forces `L¹_loc` | holds | — |
| §4.3 `exists_hasWeakMFDeriv`, `HasWeakMFDeriv.ae_eq` | `f = \|t\|`; `dim E = 0` | `Df = sign t` off `{0}`; `T_xM = 0`, differentials equal, `IsNullSet ∅` | holds | — |
| §4.4 `isSobolevMap_of_contMDiff` | `t\|t\|` | weak derivative `2\|t\|` equals the classical `2\|t\|` | holds | — |
| §4.5 `IsSobolevMap.of_locally` | `U_k = (k−1, k+1)` on `ℝ` | `Opens` charts are restricted charts; continuity at `x` from the open `V ∋ x` | holds | — |
| §4.6(b) `comp_contMDiff`, `HasWeakMFDeriv.comp_contMDiff` | `g = y²`, `f = \|t\|^{1/2}` | `2\|t\|^{1/2}·sign t/(2\|t\|^{1/2}) = sign t = D\|t\|` | holds | — |
| §4.6(a) `comp_submersion`, `HasWeakMFDeriv.comp_submersion` | `θ(x,t) = x`, `f = \|x\|`; `θ = id` | `D(f∘θ) = (sign x, 0) = Df(θ)∘dθ`; `Df∘mfderiv id = Df` | holds | — |
| §4.7 (sampled), `isColocallyWeaklyDifferentiable` | `1/x` with `u(0) = 0`; `sign x` | probes vanish near `0` off a point; `φ(1) ≠ φ(−1)` jumps; CVS Def. 1.1 line 155 (p. 3) | holds | — |
| §4.8 (sampled), existence and `ae_eq` | `u = \|t\|`, zero field | probe `y` on `[−1,1]`: `D(φ∘u) = sign t ≠ 0`; CVS lines 188, 215, 272, 308, 314 | holds | — |
| §5.2 (sampled) | `\|t\|^{1/2}`; `t ↦ (cos t, sin t)` | `‖Df‖ = 1/(2\|t\|^{1/2}) ∈ Lᵖ_loc` iff `p < 2`; `‖Df‖ = 1` | holds; no locator | R02 |
| §5.4 comparison with the continuous class | continuous `u`, compatible norm pairs; scratch theorem | norms comparable on compact `u(K)` (§5.3), so energy = chart `Lᵖ_loc`; theorem elaborates | statable, absent | R01 |
| §6.1 (sampled), `orientedJacobian` and its four theorems | `diag(2,1)`; `diag(−1,1)`; `n = 0`; one-tactic probes | `J = 2 ≤ 4`; `J = −1`, `+1` into `−std`; `volumeForm = ±1`, `J = ±1`; none closes | holds; not padding | — |
| §6.2 (sampled) | `id : (ℝ, dt²) → (ℝ, e^{2t}dt²)`; `z²` flat | chart formula `1·eᵗ/1`; volume form on unit `e^{−t}∂_t` gives `eᵗ`; `J = 4\|z\|²` | holds | — |
| §6.3 `integrableOn_orientedJacobian` | `\|x\|^{−1/2}x` on `ℝ²`; `n = 0` | `‖Df‖ ∈ Lᵖ_loc` iff `p < 4`; `J = r^{−1}/2 ∈ L¹_loc`; `J = ±1` on finite `K` | holds | — |
| §7.1 (sampled) | `(ℝ², max)`, `f = x₁ + x₂` | `‖Df‖ = 2`, dual norm of `(1,1)`, vs Euclidean `√2`; MRV line 124 (p. 6) | holds | — |
| §8.1 (sampled) | `\|x\|^{−1/2}x`, `ω = dy₁∧dy₂` | radial `r^{−1/2}/2` times tangential `r^{−1/2}` gives `J = r^{−1}/2`; HP line 341 bounds `\|f^*β\|` | holds; no locator | R02 |
| §8.2 (sampled) | `k = 0`, `n = 1`; `α = sign(x₁)dx₁` on `ℝ²` | HP lines 324–331 sign agrees: `∫βφ = −∫αφ′`; `∫α∧dφ = ∫sign(x₁)∂₂φ = 0` | holds | — |
| §9.1 `isSobolevMap_iff_memW1pLocM_comp_immersion` | figure eight; `(x_j) ↦ (x_j/j)` on `ℓ²` | `ι∘f` Lipschitz near `0` while `f` jumps: `hf` needed; no bounded left inverse | holds | — |
| §9.3 (sampled), `exists_smooth_approx_rel` | `A = ∅`; `p = ∞`; Wockel Thm 0.11 | `V′ = ∅`; `‖sign − g′‖_∞ ≥ 1`; Wockel line 170 (p. 4): graph in `O`, homotopy | holds | — |
| §10.1 (sampled) | finite `N`; `u = log(1/r)` with `sinh` | maps a.e. locally constant; `D(sinh∘u) ≈ r^{−2}/2`, `∫₀ dr/r = ∞`; tangency `du = dΠ_u∘du` | holds; no locator | R02 |
| §10.3 `exists_smooth_approx_of_controlledRetraction` | `N = ∅`; `dim E = 0`, `p = 1/2` | no `r : F → ∅`, vacuous; points have positive Haar mass, so `g = ι⁻¹∘u` | holds | — |
| §10.3 `exists_smooth_approx_of_ae_mem_range` | Hajłasz Thm 2.1 | line 129: `p > n`; lines 138–182: `p = n` through (2.1) | holds | — |
| §10.4 `memW1pLocM_comp_iff_exists_hasColocalWeakMFDeriv` | finite `N`; `S¹ ⊆ ℝ²` | both sides: `u` a.e. locally constant, `Du = 0`; CVS Prop. 1.6 line 282, closed-image converse | holds | — |
| §11.3 `not_exists_smooth_sphere_approx_radial` | `n = 2`, `p = 1`; `x = 0` | `∫_B\|x\|⁻¹ = 2π`; Lean `‖0‖⁻¹ = 0` on a null set; Hajłasz Thm 2.3 line 227 (p. 189) | holds | — |

- **Source locators checked (26):** ConventVanSchaftingen2016 lines 128–150, 155, 160–161, 188, 196, 215–219, 272, 282–287, 308, 314, 407, 414, 563; Hajlasz2009 lines 20–28, 104–105, 129–182, 227–252; HeikkilaPankka2025 lines 22–26, 322–342, 1328; MartioRickmanVaisala1969 line 124; ArendtKreuter2018 lines 83–104, 340–343, 378–380, 736–742; Wockel2009 line 170.
- **Library declarations opened at the pins (22):** Tau Ceti `2fd255d` (15): `Poincare/Wirtinger/Basic.lean:66, 232`, `Morrey.lean:181`, `GraphStep/Basic.lean:64, 73, 184, 209, 349, 398`, `Manifold/Measure.lean:36, 50`, `VolumeDensity/Volume.lean:58, 82`, `Riemannian/Sobolev.lean:151`, `JHolomorphic/WeakDerivative.lean:48`. Mathlib `1b1ccf4` (7): `NormDet.lean:69, 389`, `Orientation.lean:179, 198, 223, 245, 290`.
- **Cross-roadmap citations resolved on main `7342e8f` (14):** PDE §1.2, §1.4, §1.5 (README:720, 803, 855); PseudoholomorphicCurveAnalysis §1.1 (:213) and §4.1 (:807); PseudodifferentialOperators §5.2 (:967); Yamabe Y1 (:111); RiemannianGeometry R4.6 (:120) and R6 (:3479); DifferentialGeometry Layer 2 (:1005), Layer 5 (:1644), 10.3–10.5 (:2716, :2750) and 12.4. QuasiregularMaps' six gaps (its README:380–405) cite only sections that exist here.
- **Gate:** rerun on this head: every check 0, and nothing changed outside the folder. Dependency check: `depcheck: 206 roadmaps, 1897 edges, 0 problem(s)`.
- **Elaboration and signatures:** `lake env lean` on `Suggested.lean` gives 27 `sorry` warnings and nothing else. The 34 "dropped binder" leads come from printed names that differ: every theorem's elaborated type keeps `[MeasureTheory.volume.IsAddHaarMeasure]`, `IsManifold` and finite-dimensionality.
- **Probes:** `simp [orientedJacobian]`, `rfl` and `exact?` close none of the four §6.1 theorems. With the R01 theorem added, the scratch copy elaborates with 24 `sorry` warnings (27 − 4 probed + 1 added).
- **Shape:** every Lean name occurs in the README, and every README name of this roadmap occurs in the Lean file. Every definition section has at least three Checks. There is no LaTeX, no process word and no `lemma`. `Suggested.lean:207` begins a docstring line with "class", which the worker's scan misreads as a declaration `is`.
- Overlap check: read QuasiregularMaps, YangMillsConnectionsAndCaloricGauge, SobolevDifferentialForms, Surfaces and RiemannianGeometry (open), and DifferentialGeometry, PseudoholomorphicCurveAnalysis and CalibratedGeometry (main). Shared objects and their owners:
  - planar classes: PseudoholomorphicCurveAnalysis §1.1, the case `E = ℂ` of §1.1 here;
  - `W^{1,p}_loc(Ω; F)`: this roadmap's §1.2. YangMills' gap `vector-valued-wkp` asks PDE for the finite-dimensional orders `k ≥ 1`;
  - Euclidean scalar weak `d`: SobolevDifferentialForms §2.1, of which §8.2 is the manifold, Banach-valued form;
  - degree: DifferentialGeometry 10.3–10.5;
  - the class, `Df` and `J_f`: this roadmap, consumed by QuasiregularMaps;
  - `H¹` paths on `[a,b]`: RiemannianGeometry R3.1. Sources with boundary are outside this roadmap's scope;
  - Surfaces and CalibratedGeometry share nothing.

## Not verifiable

- Ziemer1989, Thm 2.2.2 (§2.2 and its Lean docstring): settled as uncertified; no legal text.
- Lee2012, Ch. 6 and Ch. 15 (§3.3, §6.2): settled as uncertified.
- Rickman1993, Ch. I (Conventions): settled as uncertified.
- Hencl 2011 (§8.3), Schoen–Uhlenbeck 1983, Hajłasz–Iwaniec–Malý–Onninen 2008, Iwaniec–Martin 2001, Hélein–Wood 2008, Bethuel–Zheng 1988, Brezis–Nirenberg 1995, Marcus–Mizel 1979 (References): not in the manifest's cache, and no sampled claim rests on them.

## Source issues

- **Misprint** in Hajlasz2009 at (2.1), p. 188: the source says the middle term of the Poincaré estimate carries the factor `C r`, with `r` undefined there; it should be `C ε`, the radius of the ball; affects nothing.
- **Misprint** in ConventVanSchaftingen2016 at §2, characterization of the norm of the derivative, p. 8: the source says the operator-norm supremum runs over `e ∈ T_yN` with `|e|_{g_N} ≤ 1`; it should be `e ∈ T_xM` with `|e|_{g_M} ≤ 1`; affects nothing.
- **Misprint** in ConventVanSchaftingen2016 at §1.1, definition of local integrability, p. 3: the source asks for a chart `ψ : V → ℝ^m` with `x ∈ M`; it should be `x ∈ V`; affects nothing.
