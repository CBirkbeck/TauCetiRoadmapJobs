# Review of MinimalSurfaces (pull request #2226 at 3866361)
Folder: `TauCetiRoadmap/RiemannianGeometry/MinimalSurfaces/`
**Verdict:** needs changes

## R01 (P2) — Hersch's lemma and `λ₁A ≤ 8πd` still have two owners
**Location:** `README.md` lines 98–102: "Hersch's balancing lemma (10.3) and the bound `λ₁(−Δ_Σ) |Σ| ≤ 8πd` … have this sub-roadmap as their single owner. A roadmap that needs this bound … cites 10.3 and 10.4."
**Claim:** CanonicalModelsAndGonality still owns both objects at the head of its pull request and cites nothing here, so the "single owner" sentence is false. This is the previous review's R03, not repaired.
**Witness:** `TauCetiRoadmap/CanonicalModelsAndGonality/README.md` at #1726 (`e7bed94`), line 287: "this roadmap owns the measure-balancing argument". Its §8.4 (line 1781) states `λ₁(X)·A ≤ 8π·d`, with "(b) Hersch's balancing lemma". It never cites MinimalSurfaces.
**Repair:** Agree one owner with that roadmap's author, then state the outcome here. Either:
- (i) CanonicalModelsAndGonality §8.4 cites 10.3–10.4 and merges after this roadmap. Keep lines 98–102, replacing "as the theory of the gonality of algebraic curves does" with "as CanonicalModelsAndGonality §8.4 does".
- (ii) This roadmap consumes §8.4 and merges after it:
  - Delete 10.3, the *Degree bound* paragraph of 10.4, and `herschMap` and `exists_integral_herschMap_eq_zero`.
  - Replace lines 98–102 with "CanonicalModelsAndGonality §8.4 owns Hersch's balancing lemma and `λ₁A ≤ 8πd` for a holomorphic map of degree d to the sphere; 10.4 consumes them".
  - Add the same item to "From the other roadmaps".

In both cases, correct the description's sentence "Hersch's balancing lemma (10.3) and the degree bound of 10.4 have this sub-roadmap as their single owner".

## R02 (P2) — 3.6 owns Simons' inequality in a Riemannian manifold, which G6 owns
**Location:** `README.md` lines 785–790 (3.6): "the estimate of the terms that the curvature of a Riemannian ambient manifold adds to it is owned here … `|½Δ|A|² − |∇A|² + |A|⁴| ≤ C(n)(|Rm_N| |A|² + |∇Rm_N| |A|)`".
**Claim:** This display, and its consequence `Δ|A|² ≥ −2|A|⁴ − C(n)(…)` (line 795), are Simons' identity and inequality for a minimal hypersurface of a Riemannian manifold. GeometricCurrents G6 owns both, in a Riemannian setting. Only the two-dimensional Kato form (line 799) is new. This is the previous review's R02, partly repaired.
**Witness:** `TauCetiRoadmap/GeometricCurrents/README.md` on main, line 839: "Build Simons' identity and inequality with the chosen curvature/B signs". G6's ambient space is "a smooth Riemannian n-manifold" (line 842), with "Riemannian error bounds" (line 688).
**Repair:**
- Replace lines 785–797, from "*Ambient curvature terms.*" through "enters the Kato equality: for every `ε ∈ (0,1)` there is `C_ε` such that, where `s = |A|² > 0`,", with:

  > *Ambient curvature terms.* For a minimal hypersurface of a Riemannian `(n+1)`-manifold N, consume G6's Simons identity and inequality, whose ambient terms are bounded pointwise by `C(n)(|Rm_N| |A|² + |∇Rm_N| |A|)`; 5.1 uses this inequality. For `n = 2` the Codazzi term of R5a enters the Kato equality, and this form is owned here: for every `ε ∈ (0,1)` there is `C_ε` such that, where `s = |A|² > 0`,

  Keep the display of line 799.
- In Scope (lines 35–36 and 90–91) and in the description, replace "the estimate of the ambient curvature terms (of that identity) in a Riemannian manifold" with "the two-dimensional Kato form of G6's Riemannian Simons inequality".

## R03 (P2) — Statable headlines 5.1 and 7.5 absent from `Suggested.lean`
**Location:** `Suggested.lean` lines 23–24 and 31–32: "ε-regularity (5.1) needs the second fundamental form `A` of an immersed surface with boundary …" and "The curvature estimate for stable surfaces (7.5) needs `|A|` and the stability form of a two-sided minimal immersion."
**Claim:** Both headlines are stated first in `ℝ³`, where the pins express every quantity they use:
- for an isometric immersion into `ℝ³`, `|A|² = Σᵢ |Hess fᵢ|²` with `TauCeti.Manifold.hessian`;
- the stability form uses `TauCeti.Manifold.mgradient` and `TauCeti.riemannianVolume`.

This is the route the half-space theorem already takes for minimality. Their `ℝ³` forms are statable and absent. The docstring, README lines 14–17 and the description say they are not statable.
**Witness:** A copy of `Suggested.lean` with the code below elaborates at the pins with six `sorry` warnings and nothing else. The copy adds `import TauCeti.Geometry.Manifold.Riemannian.VolumeDensity.Volume` and `ENNReal` to `open scoped`.
**Repair:** Add (tested):

```lean
/-! ## Layer 5 and Layer 7: ε-regularity and the curvature estimate in `ℝ³` -/

/-- `Σᵢ |Hess fᵢ|²(x)` for a map `f` of a Riemannian surface into `ℝ³`. For an isometric
immersion it is `|A|²(x)`, since `Hess fᵢ = ⟨II, eᵢ⟩` (MS1). -/
def hessianCoordNormSq {S : Type*} [TopologicalSpace S]
    [ChartedSpace (EuclideanSpace ℝ (Fin 2)) S] [IsManifold (𝓡 2) 2 S]
    [RiemannianBundle (fun x : S ↦ TangentSpace (𝓡 2) x)]
    [IsContMDiffRiemannianBundle (𝓡 2) 1 (EuclideanSpace ℝ (Fin 2))
      (fun x : S ↦ TangentSpace (𝓡 2) x)]
    (f : S → EuclideanSpace ℝ (Fin 3)) (x : S) : ℝ :=
  ∑ i : Fin 3, ∑ j, ∑ k, TauCeti.Manifold.hessian (𝓡 2) (fun y ↦ f y i) x
    (stdOrthonormalBasis ℝ (TangentSpace (𝓡 2) x) j)
    (stdOrthonormalBasis ℝ (TangentSpace (𝓡 2) x) k) ^ 2

/-- **ε-regularity in `ℝ³`** (MS5.1). There are universal `ε, C₀ > 0` such that a minimal
immersion of a surface that is proper into the open ball `B_r(x₀)` and has total curvature at
most `ε` satisfies `σ² |A|²(q) ≤ C₀ ∫ |A|²` whenever `f q ∈ B_(r−σ)(x₀)`. -/
theorem exists_sq_mul_hessianCoordNormSq_le_lintegral : ∃ ε C₀ : ℝ, 0 < ε ∧ 0 < C₀ ∧
    ∀ (S : Type) [TopologicalSpace S] [ChartedSpace (EuclideanSpace ℝ (Fin 2)) S]
    [IsManifold (𝓡 2) ∞ S] [RiemannianBundle (fun x : S ↦ TangentSpace (𝓡 2) x)]
    [IsContMDiffRiemannianBundle (𝓡 2) 1 (EuclideanSpace ℝ (Fin 2))
      (fun x : S ↦ TangentSpace (𝓡 2) x)]
    [IsContinuousRiemannianBundle (EuclideanSpace ℝ (Fin 2)) (fun x : S ↦ TangentSpace (𝓡 2) x)]
    [MeasurableSpace S] [BorelSpace S] [SecondCountableTopology S]
    (f : S → EuclideanSpace ℝ (Fin 3)) (x₀ : EuclideanSpace ℝ (Fin 3)) (r : ℝ),
    ContMDiff (𝓡 2) 𝓘(ℝ, EuclideanSpace ℝ (Fin 3)) ∞ f →
    (∀ (x : S) (v w : TangentSpace (𝓡 2) x),
      inner ℝ (mfderiv (𝓡 2) 𝓘(ℝ, EuclideanSpace ℝ (Fin 3)) f x v)
        (mfderiv (𝓡 2) 𝓘(ℝ, EuclideanSpace ℝ (Fin 3)) f x w) = inner ℝ v w) →
    (∀ (i : Fin 3) (x : S), TauCeti.Manifold.laplaceBeltrami (𝓡 2) (fun y ↦ f y i) x = 0) →
    (∀ q, f q ∈ ball x₀ r) → (∀ K ⊆ ball x₀ r, IsCompact K → IsCompact (f ⁻¹' K)) →
    ∫⁻ x, ENNReal.ofReal (hessianCoordNormSq f x) ∂TauCeti.riemannianVolume (𝓡 2) S ≤
      ENNReal.ofReal ε →
    ∀ (σ : ℝ) (q : S), 0 < σ → dist (f q) x₀ < r - σ →
      σ ^ 2 * hessianCoordNormSq f q ≤ C₀ *
        (∫⁻ x, ENNReal.ofReal (hessianCoordNormSq f x) ∂TauCeti.riemannianVolume (𝓡 2) S).toReal := by
  sorry

/-- **Curvature estimate for stable minimal surfaces in `ℝ³`** (MS7.5). There is a universal
`C` such that a minimal immersion of a surface into `ℝ³` satisfying the stability inequality
`∫ |A|² φ² ≤ ∫ |∇φ|²` has `R² |A|²(p) ≤ C` whenever the intrinsic ball `B̄_R(p)` is compact. -/
theorem exists_sq_mul_hessianCoordNormSq_le_of_stable : ∃ C : ℝ, ∀ (S : Type) [MetricSpace S]
    [ChartedSpace (EuclideanSpace ℝ (Fin 2)) S] [IsManifold (𝓡 2) ∞ S]
    [RiemannianBundle (fun x : S ↦ TangentSpace (𝓡 2) x)]
    [IsContMDiffRiemannianBundle (𝓡 2) 1 (EuclideanSpace ℝ (Fin 2))
      (fun x : S ↦ TangentSpace (𝓡 2) x)]
    [IsContinuousRiemannianBundle (EuclideanSpace ℝ (Fin 2)) (fun x : S ↦ TangentSpace (𝓡 2) x)]
    [IsRiemannianManifold (𝓡 2) S] [MeasurableSpace S] [BorelSpace S] [SecondCountableTopology S]
    (f : S → EuclideanSpace ℝ (Fin 3)),
    ContMDiff (𝓡 2) 𝓘(ℝ, EuclideanSpace ℝ (Fin 3)) ∞ f →
    (∀ (x : S) (v w : TangentSpace (𝓡 2) x),
      inner ℝ (mfderiv (𝓡 2) 𝓘(ℝ, EuclideanSpace ℝ (Fin 3)) f x v)
        (mfderiv (𝓡 2) 𝓘(ℝ, EuclideanSpace ℝ (Fin 3)) f x w) = inner ℝ v w) →
    (∀ (i : Fin 3) (x : S), TauCeti.Manifold.laplaceBeltrami (𝓡 2) (fun y ↦ f y i) x = 0) →
    (∀ φ : S → ℝ, ContMDiff (𝓡 2) 𝓘(ℝ) ∞ φ → HasCompactSupport φ →
      ∫ x, hessianCoordNormSq f x * φ x ^ 2 ∂TauCeti.riemannianVolume (𝓡 2) S ≤
        ∫ x, ‖TauCeti.Manifold.mgradient (𝓡 2) φ x‖ ^ 2 ∂TauCeti.riemannianVolume (𝓡 2) S) →
    ∀ (p : S) (R : ℝ), 0 < R → IsCompact (closedBall p R) →
      R ^ 2 * hessianCoordNormSq f p ≤ C := by
  sorry
```

Then make these README and docstring edits:
- **MS1, end of line 161:** add "For an isometric immersion `f : Σ → ℝ^m`, `Hess_Σ(x_i ∘ f) = ⟨II, e_i⟩`, so `|II|² = Σ_i |Hess_Σ(x_i ∘ f)|²`."
- **5.1, after the first display:** add "The same holds for a minimal immersion of a surface without boundary that is proper into the open ball `B_r(x)`: apply it to `f⁻¹(B̄_(r′)(x))` for regular values `r′ ↑ r` of `|f − x|`. Lean name: `exists_sq_mul_hessianCoordNormSq_le_lintegral`, for this form in `ℝ³`." Add "DifferentialGeometry 10.2" to its *Needs:*.
- **7.5, after line 1508:** add "Stability enters only through the scalar inequality `Q(φ) ≥ 0`, so the estimate holds for every minimal immersion that satisfies it. Lean name: `exists_sq_mul_hessianCoordNormSq_le_of_stable`, for the form in `ℝ³`."
- **Docstring:** replace the bullets of lines 23–24 and 31–32 with "- ε-regularity (5.1) and the curvature estimate (7.5) are stated in `ℝ³`, `|A|²` of an isometric immersion being `hessianCoordNormSq`; their Riemannian forms need `A` and `Ric_N(ν,ν)` of a surface in a Riemannian three-manifold."
- **README lines 14–17 and the description's `Suggested.lean` paragraph:** list these two statements.

## R04 (P3) — 3.1's plane rigidity assumes embeddedness, but 5.3 uses it to prove embeddedness
**Location:** `README.md` line 631 (3.1): "a nonempty properly embedded minimal n-submanifold without boundary". Lines 996–997 (5.3): "a priori only an immersion, and embeddedness is recovered afterwards from the affine-plane rigidity of 3.1".
**Claim:** As stated, 3.1's rigidity cannot apply to an immersed limit, so it cannot recover that limit's embeddedness. Its cited source proves the rigidity for proper immersions; the README narrows it.
**Witness:** White line 415: Theorem 4 is for "a properly immersed minimal m-manifold without boundary". Its density at infinity is at least 1, with equality only for a multiplicity-one plane.
**Repair:** In 3.1 (lines 630–634), replace the rigidity sentence with:

> Include the affine-plane-rigidity equality case [White, Theorem 4]: if `f : Σ → ℝ^m` is a proper minimal immersion of a nonempty n-manifold without boundary satisfying `lim_(R→∞) Area(f⁻¹(B_R(0)))/(ω_n Rⁿ) ≤ 1`, then translation invariance of the asymptotic ratio and the small-ball limit `#f⁻¹(p₀) ≥ 1` at `p₀ ∈ f(Σ)` force the ratio at p₀ to be identically 1, hence `(f−p₀)^⊥ ≡ 0`, and f is an embedding onto an affine n-plane through p₀.

## R05 (P3) — Bernstein: the Lean statement is for `C²` solutions, the README for smooth ones
**Location:** `README.md` lines 1533–1534: "every smooth solution of the minimal-surface equation on all of `ℝ²` is affine". `Suggested.lean` line 92: `(hu : ContDiff ℝ 2 u)`.
**Claim:** The Lean statement is more general than the README's. Its proof through 7.3 and 7.5 needs a `C²` solution to be smooth, and 7.6 does not list that input.
**Witness:** `exists_affine_of_minimalSurfaceEquation` assumes only `ContDiff ℝ 2 u`. The *Needs:* line of 7.6 (line 1549) reads "7.5, 7.3." The smoothness comes from 2.2: "De Giorgi–Nash–Moser for Du, then the Schauder bootstrap".
**Repair:**
- Lines 1533–1534: "Consequently, every `C²` solution of the minimal-surface equation on all of `ℝ²` is affine: it is smooth by the regularity of 2.2, an entire graph is complete, and it is stable by 7.3".
- 7.6 *Needs:* "7.5, 7.3; 2.2 (smoothness of a `C²` solution)."
- MS7 Dependencies (lines 1590–1591): "Items 7.1–7.5 are independent of Layers 2, 4 and 5; 7.6 uses 2.2, and 7.7 uses 2.5 and 5.2."

## R06 (P3) — `Suggested.lean`: a non-headline lemma, and section comments not in Layer form
**Location:** `Suggested.lean` lines 70–86 (`exists_point_picking`). The section comments at lines 48, 70, 88 and 100, e.g. "/-! ### MS4.2: the half-space theorem -/".
**Claim:** The point-picking lemma is an elementary metric-space lemma, not one of the headline results the Summary lists. The section comments do not have the form `/-! ## Layer k: <title> -/`.
**Witness:** A scratch proof closes it in 20 lines (`IsCompact.exists_isMaxOn`, `dist_triangle`, `nlinarith`) without using `hSR` or `hxR`. The headline list in README lines 5–10 has no MS5.4 item.
**Repair:**
- Delete `exists_point_picking`, together with "Lean name: `exists_point_picking`." (README line 1023).
- Remove "the point-picking lemma (5.4)," from README line 15, from `Suggested.lean` line 9 and from the description.
- Rename the section comments to `/-! ## Layer 4: the half-space theorem -/`, `/-! ## Layer 7: stability and the curvature estimate -/` and `/-! ## Layer 10: eigenvalue estimates and area bounds -/`.

## R07 (P3) — Frankel's theorem has no locator; Yang–Yau is cited without one
**Location:** `README.md` line 2086 (11.2): "*Sources:* [Frankel]." Lines 1909 and 1951 (10.3, 10.4): "[Hersch]; [YangYau]; [Chodosh, Theorem 34.5]" and "[YangYau]; [Chodosh, Theorem 34.5]".
**Claim:** The headline 11.2 cites no theorem or page at all. 10.3 and 10.4 cite Yang–Yau without the result or page that contains the degree bound and the balancing argument.
**Witness:** YangYau (Numdam) line 114 is the §2 Proposition (p. 58): `λ₁A ≤ 8πd` for a holomorphic map of degree d. Line 154 (p. 59) applies Hersch's argument. Line 43 (p. 55) is Theorem 1, the genus bound.
**Repair:**
- 10.3: "*Sources:* [Hersch]; [YangYau, p. 59]; [Chodosh, proof of Theorem 34.5]."
- 10.4: "*Sources:* [YangYau, §2, Proposition, p. 58, and Theorem 1, p. 55]; [Chodosh, Theorem 34.5 and its proof]."
- 11.2: add the theorem number and page of the intersection theorem in [Frankel], and "[Chodosh, Exercise 20.2]" for the round sphere.

## Verified sound

| Statement | Instance | README side | Computed / source side | Result |
|---|---|---|---|---|
| 2.3 Dirichlet problem (sampled) | `g = e^(2at)(dx²+dt²)`, `u ≡ t₀` | `M_g(u) = −n a e^(−at₀)` | `∇_(eᵢ)eᵢ = −a e^(−2at₀)∂_t`, pairing with `ν = e^(−at₀)∂_t`; IFT with linearization Δ, Chodosh line 3412 | holds |
| 2.4 graphical neighbourhoods (sampled) | `λ𝒞` | `|A|²` scales by `λ⁻²` | `|A| = √2/ρ²` on 𝒞 becomes `√2λ/ρ²`; Chodosh Lemma 28.3 (line 3105): `r⁻¹|w|+|∇w|+r|D²w| ≤ 3Br` | holds |
| 3.1 monotonicity (sampled) | plane at distance d | ratio `(1−d²/r²)^(n/2)` | `d/ds[sⁿ(d²+s²)^(−n/2)] = n s^(n−1)d²(d²+s²)^(−(n+2)/2)`; White Thm 3 (line 336) | holds; rigidity R04 |
| 3.6 ambient terms | Clifford torus in unit `S³` | `½Δ|A|² − |∇A|² + |A|⁴ = 4` | Simons in `S³` adds `n|A|² = 4`; 2D Kato error `≤ (1+δ)2|S|² + C_δ|Rm|²` recomputed | holds; owner R02 |
| 4.2 half-space (sampled, headline, Lean) | barrier `ρ = 1`, `λ = 1/100`; Lean with plane `{x₃ = 5}` | height `0.0530`; `c = 5` | `0.01·arccosh 100 = 0.0530`; Chodosh Thm 20.1 (line 2405), immersions at line 2418 | holds |
| 5.1 ε-regularity (headline) | `λ𝒞 ∩ B̄₁(0)`, `σ = ½` | total curvature `< 8π`, `σ²|A|² = 2σ²/λ²` | `∫2sech²v dv dθ = 8π`; the `ℝ³` statement elaborates | holds; R03 |
| 5.2 compactness (headline) | `{x₃ = ±1/i}` | multiplicity 2 | Chodosh Thm 28.5 (line 3145); Cor 9.5 (line 1354) puts limit points in the support | holds |
| 5.3 immersed compactness (sampled) | `{x₃ = 0}`, `{x₃ = x₁/i}` | limit `{x₃ = 0}`, `m = 2` | White Thm 22 (line 1107): bounded `|A|` gives local smooth limits | holds; R04 |
| 5.4 point picking (Lean) | `X = ℝ`, `f = |y|`, `x = ½` | `M = ¼`, `q = ±½`, `ρ = ¼`, `sup = ¾ ≤ 1` | weight `(1−|y|)|y|` has maximum `¼`; scratch proof closes it | holds; R06 |
| 5.5 Allard (sampled) | two planes at distance `2δ` | ratio `2(1−δ²/R²)^(n/2)` | each disk has area `ω_n(R²−δ²)^(n/2)`; Chodosh Thm 30.1 (line 3251), `Θ > 1` at blow-up | holds |
| 6.1 Morse index (headline) | `S²_eq ⊂ S³` | index 1, nullity 3 | `j(j+1)−2`: `−2` (×1), `0` (×3), `4`; `Q(a+bx₁) = −8πa²` | holds |
| 6.2 exhaustion (sampled) | catenoid, `h = 1 − v tanh v` | `Jh = 0`, zero at `v₀ tanh v₀ = 1` | `h″ = −2sech²v·h`, so `Jh = 0`; `v₀ ≈ 1.1997` | holds |
| 6.4 instability (headline) | Clifford torus; `ℝP² ⊂ ℝP³` | `Q(1) = −8π²`; one-sided stable | `(2+2)·2π² = 8π²`; odd harmonics give `j(j+1)−2 ≥ 0` | holds |
| 6.5 Clifford spectrum | `(k,ℓ) ∈ ℤ²` | index 5, nullity 4 | `2(k²+ℓ²)−4`: `−4` (×1), `−2` (×4), `0` (×4) | holds |
| 7.1 positive solution (sampled) | half-catenoid, `h = tanh v` | `Jh = 0`, stable | `cosh⁻²v(−2sech²v tanh v) + 2sech⁴v tanh v = 0`; Chodosh Prop 33.4 (line 3557), White Thm 30 (line 1432) | holds |
| 7.3 translations (sampled) | graph `x₃ = u` | `⟨ν,e₃⟩ = (1+|Du|²)^(−1/2) > 0` | `ν = (−Du,1)/√(1+|Du|²)`; Chodosh Thm 18.1 (line 2252): graphs minimize area | holds |
| 7.4 gradient estimate (sampled) | `c = ⅓` | `2q² + s²/3 − (6/5)Q² = (1/5)(2q−s)²` | both sides `(4/5)q² − (4/5)qs + (1/5)s²`; Lynch Prop 4.1 (line 468), §4 (line 459) | holds |
| 7.4 Riemannian adaptation | `W = ζ²Q` at `p̄` | `R²Q(p) ≤ C(1+(Λ₀+Λ₁^(2/3))R²)` | `(c₀/2)W² ≤ CWR² + CRW^(3/2) + CR³√Λ₀W + C(Λ₀²+Λ₁^(4/3))R⁸` gives it | holds |
| 7.5 curvature estimate (headline) | half-catenoid `{v ≥ 0}` | `dist²|A|² ≤ ½` | `2x/(1+x)²`, `x = sinh²v`, maximum `½` at `x = 1`; the `ℝ³` statement elaborates | holds; R03 |
| 7.6 Bernstein (Lean) | `u = x² − y²` | left side `8(y² − x²)` | `2(1+4y²) − 2(1+4x²)`; Lean assumes `C²`, README says smooth | holds; R05 |
| 8.1 removable singularities (headline) | `r = s/2`, `σ = s/4` | `x ∈ B_(s/4)(x)` | `B_(s/2)(x) ⊂ B_(3s/2)(p) ∖ B_(s/2)(p)`; Chodosh §32 hypotheses (line 3353) | holds |
| 8.2 decomposition (sampled) | plane at distance d | critical point at the foot, `Hess_Σ r² = 2g_Σ` | flat `Hess r² = 2 Id`; Chodosh Lemmas 32.1–32.3 (lines 3367–3386), Prop 32.4 (line 3393) | holds |
| 9.1 compactness (headline) | `T² × {±1/j}` in flat `T³` | multiplicity 2, `B = ∅` | Chodosh Thm 31.3 (line 3332): `|B| ≤ Λ/ε` | holds |
| 9.2 multiplicity one (sampled) | area count near b | ratio `≤ (1+o(1))(1−η²)/(1−e^(ar)η²)` | monotonicity at b: `A(ηr) ≤ e^(ar)η²A(r)`; Chodosh Lemma 31.4 (line 3344) | holds |
| 10.1 Reilly | unit ball, `f = x₁² − x₂²` | both sides `−8ω_(n+1)` | `∫z² = 4|Sⁿ|/((n+1)(n+3))`; boundary integral `(8−16)|Sⁿ|/(n+1)` | holds |
| 10.2 Choi–Wang (sampled) | Clifford torus, `k = 2` | `λ₁ = 2 ≥ 1` | `Δ = 2(∂θ²+∂ψ²)` has eigenvalues `2(a²+b²)`; Chodosh Thm 34.3 (line 3687) | holds |
| 10.3 Hersch (sampled, Lean) | `a = (0,0,3/5)`, `x = e₁`, `x = −a/|a|` | `T_a(e₁) = (4/5,0,3/5)`; `±a/|a|` fixed | `T_a(x)₃ = (t+α)/(1+αt)`, `|T_a x| = 1`; YangYau line 154, Chodosh line 3749 | holds; owner R01 |
| 10.4 degree bound | hexagonal torus | `8π²/√3 ≈ 45.59 ≤ 16π` | dual vector `2/√3`, `λ₁ = 16π²/3`, area `√3/2`; YangYau §2 Proposition (line 114) | holds; R07 |
| 10.5 area from genus (sampled) | Clifford torus | `2π² ≤ 16π` | `(16π/k)(γ+1) = 8π·2`; Chodosh §34.3 (line 3787) | holds |
| 11.1 second variation | spheres of radii 1 and 2 | `−½ + 1 = ½` | `L(s) = (5 − 4cos(s/2))^(1/2) = 1 + s²/4 + O(s⁴)` | holds |
| 11.2 Frankel (headline) | Clifford torus and `{x₄ = 0}` | they intersect | points with `x₃² = ½`; the endpoint terms sum to `tr II = 0` | holds; R07 |
| 12.1 Choi–Schoen (headline) | `ℝP³`, genus γ | lift has genus `2γ − 1` | `1 + 2(γ−1)`; Chodosh Thm 34.6 (line 3793) assumes no one-sided surfaces | holds |

- Previous review (`cfff95b`):
  - R01 repaired (`Suggested.lean` lines 50–98).
  - R04 repaired (line 1465, `Λ₁^(4/3)`).
  - R05 repaired (five declarations gone).
  - R06 repaired (e.g. line 471, "proof of Theorem 32.5").
  - R07 repaired (the description names #2222–#2225).
  - R08 repaired (line 185, "on which `K ≤ 0`").
  - R09 repaired (lines 1161 and 1397).
  - R10 repaired (line 1611, `(s/4)²`).
  - R11 repaired (`*Needs:*`, Checks, Examples and Dependencies in every layer).
  - R02 partly repaired (now R02); R03 not repaired (now R01).
- Source locators checked against the text:
  - Chodosh: 38 statement headers matched, 22 read in full.
  - White (arXiv:1308.3325v4): Theorems 3, 4, 22, 29 and 30.
  - Lynch (arXiv:2611.12758v1, OCR): Theorem 1.1, Proposition 4.1 and §4.
  - YangYau (Numdam): Theorem 1, the §2 Proposition and p. 59.
- Library declarations opened at the pins:
  - Tau Ceti `Geometry/Manifold/Riemannian/`: `laplaceBeltrami` (`Laplacian.lean:238`), `hessian` (`Laplacian.lean:135`), `mgradient` (`Gradient/Basic.lean:73`), `riemannianVolume` (`VolumeDensity/Volume.lean:82`), `integral_mul_laplaceBeltrami` (`DivergenceTheorem.lean:312`), `laplaceBeltrami_nonpos_of_isLocalMax` (`MaximumPrinciple.lean:75`), `laplaceBeltrami_norm_sq_mgradient` (`Bochner.lean:171`).
  - Tau Ceti elsewhere: `eulerChar` (`AlgebraicTopology/Cellular/EulerCharacteristic/FiniteCWType.lean:123`), `eulerChar_eq_mul_of_isCoveringMap` (`…/Covering.lean:140`), `noRetraction_diskBoundary` (`AlgebraicTopology/Singular/BrouwerFixedPoint.lean:71`), `FiniteHolomorphicMap.ofMeromorphic` (`Analysis/Complex/RiemannSurface/SphereMap.lean:243`).
  - Mathlib: `IsRiemannianManifold` (`Geometry/Manifold/Riemannian/Basic.lean:80`).
- Cross-roadmap citations resolved:
  - RiemannianGeometry on main: R1.5 (line 1459), R3 (1511), R5a (2840), R5b (3216), R7.0 (3531), R8.2 (3840).
  - Open RiemannianGeometry revisions: R5c at #2222 (line 3387), R7.9 at #2223 (3832), the barriers at #2224 (2212) and R3 with free endpoints at #2224 (1570).
  - Surfaces: S1–S5 on main; S6 at #2225 (line 781).
  - PDE: C13 (1344), C14 (1459), E22 (1927), E23 (1965), E25 (2097).
  - Other roadmaps: GeometricCurrents G6 (668, 703, 839); PositiveMass §3.1 (690); AlgebraicTopology §7.1, §7.3 and §8.7 (3111, 3174, 3618); DifferentialGeometry 10.2 and 12.5; PseudoholomorphicCurveAnalysis PH2.4 (461) and PH7.2 (1271); SmoothBundlesConnections B5.0 (1072); HopfRinow (Completed).
- Gate at 3866361: every check passes. The dependency check prints `depcheck: 206 roadmaps, 1898 edges, 0 problem(s)`.
- Elaboration and probes:
  - `lake env lean Suggested.lean` gives 4 `sorry` warnings and nothing else.
  - `#check @` of all 5 declarations matches README 4.2, 5.4, 7.6 and 10.3, with no binder lost.
  - The one-tactic probe (`simp`, `rfl`, `infer_instance`) fails on `exists_point_picking`, which a 20-line proof closes.
  - The R03 copy gives 6 `sorry` warnings.
- Ownership against open work: Frankel, Choi–Schoen, Choi–Wang, Reilly, the half-space theorem, the stable Bernstein theorem, Simons, Hersch, Yang–Yau, removable singularities and the Clifford torus were searched over main and all open heads. There are two second owners (R01, R02).
- Overlap check: read RiemannianGeometry (main and #2222–#2225), Surfaces (main and #2225), PositiveMass, RicciFlow, GeometricCurrents and CanonicalModelsAndGonality.
  - R1–R8 are owned by RiemannianGeometry and S1–S6 by Surfaces; both are cited.
  - Gauss–Bonnet is owned by PositiveMass §3.1 and cited.
  - Simons' identity and inequality are owned by GeometricCurrents G6 (R02).
  - Hersch's lemma and `λ₁A ≤ 8πd` are owned both here and by CanonicalModelsAndGonality §8.4 (R01).
  - RicciFlow shares nothing.

## Not verifiable

- [CM] (AMS GSM 121) is paywalled. Its locators were not read: §§1.1–2.6, Lemmas 1.8, 2.1 and 2.4, Theorem 1.12, Proposition 1.39 and §7.5.
- [HM] and [ChoiSchoen]: the sources service found only paywalled publisher pages for their DOIs (uncertified).
- [ChoiWang]: the Project Euclid landing page has no PDF link, and no legal copy was found.
- Not fetched: [FCS], [WhiteReg], [Frankel], [Simons], [Reilly], [SY], [Schoen], [Pogorelov], [dCP], [Hersch], [Lee], [GT], [BT], [CM4], [Bernstein]. Each sampled target also rests on a locator read above, except 11.2 (R07).
- [White]: numbering checked against arXiv:1308.3325v4 only; the Park City volume is paywalled.
- [Lynch] was read through OCR (36 of 58 pages image-only). Proposition 4.1's display was recomputed rather than read verbatim.

## Source issues

- **Misprint** in Chodosh at proof of Lemma 28.1, p. 70: the source says the eigenvalue `1+|∇w|²` of a graph's induced metric has multiplicity n; it should be multiplicity 1, with eigenvalue 1 of multiplicity n−1; affects nothing.
- **Misprint** in Chodosh at Lemma 29.1, p. 73: the source indexes the surfaces in the hypothesis and in the rescaling factor by i; it should be j throughout; affects nothing.
