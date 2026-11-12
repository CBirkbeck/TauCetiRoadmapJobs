# Review of MinimalSurfaces (pull request #2226 at 9cfb02f)
Folder: `TauCetiRoadmap/RiemannianGeometry/MinimalSurfaces/`
**Verdict:** needs changes

## R01 (P2) — Hersch's lemma and `λ₁A ≤ 8πd` still have two owners
**Location:** `README.md` lines 98–102: "Hersch's balancing lemma (10.3) and the bound `λ₁(−Δ_Σ) |Σ| ≤ 8πd` … have this sub-roadmap as their single owner."
**Claim:** CanonicalModelsAndGonality still owns both objects and cites nothing here, so "single owner" is false. Not repaired (previous R01).
**Witness:** `TauCetiRoadmap/CanonicalModelsAndGonality/README.md` at #1726 (`e7bed94`): line 287 "this roadmap owns the measure-balancing argument"; §8.4, lines 1784–1794, states `λ₁(X)·A ≤ 8π·d` with "(b) Hersch's balancing lemma". It never cites MinimalSurfaces.
**Repair:** Agree one owner with that roadmap's author and state the outcome. Either:
- (i) CanonicalModelsAndGonality §8.4 cites 10.3–10.4 and merges after this roadmap. Keep lines 98–102, replacing "as the theory of the gonality of algebraic curves does" with "as CanonicalModelsAndGonality §8.4 does".
- (ii) This roadmap consumes §8.4 and merges after it. Delete 10.3, the *Degree bound* paragraph of 10.4, `herschMap` and `exists_integral_herschMap_eq_zero`. Replace lines 98–102 with "CanonicalModelsAndGonality §8.4 owns Hersch's balancing lemma and `λ₁A ≤ 8πd` for a holomorphic map of degree d to the sphere; 10.4 consumes them", and add the same item to "From the other roadmaps".

In both cases, correct the description's sentence "Hersch's balancing lemma (10.3) and the degree bound of 10.4 have this sub-roadmap as their single owner".

## R02 (P2) — 3.6 owns Simons' inequality in a Riemannian manifold, which G6 owns
**Location:** `README.md` lines 785–790 (3.6): "the estimate of the terms that the curvature of a Riemannian ambient manifold adds to it is owned here … `|½Δ|A|² − |∇A|² + |A|⁴| ≤ C(n)(|Rm_N| |A|² + |∇Rm_N| |A|)`".
**Claim:** This display and its consequence (line 795) are Simons' identity and inequality for a minimal hypersurface of a Riemannian manifold, which GeometricCurrents G6 owns. Only the two-dimensional Kato form (line 799) is new. Not repaired (previous R02).
**Witness:** `TauCetiRoadmap/GeometricCurrents/README.md` on main (`7342e8f`), line 839: "Build Simons' identity and inequality with the chosen curvature/B signs". G6 is set in "a smooth Riemannian n-manifold" (line 842).
**Repair:**
- Replace lines 785–797, from "*Ambient curvature terms.*" through "where `s = |A|² > 0`,", with:

  > *Ambient curvature terms.* For a minimal hypersurface of a Riemannian `(n+1)`-manifold N, consume G6's Simons identity and inequality, whose ambient terms are bounded pointwise by `C(n)(|Rm_N| |A|² + |∇Rm_N| |A|)`; 5.1 uses this inequality. For `n = 2` the Codazzi term of R5a enters the Kato equality, and this form is owned here: for every `ε ∈ (0,1)` there is `C_ε` such that, where `s = |A|² > 0`,

  Keep the display of line 799.
- In Scope (lines 35–36 and 90–91) and in the description, replace "the estimate of the ambient curvature terms (of that identity) in a Riemannian manifold" with "the two-dimensional Kato form of G6's Riemannian Simons inequality".

## R03 (P2) — Statable headlines 5.1 and 7.5 absent from `Suggested.lean`
**Location:** `Suggested.lean` lines 23–24 and 31–32: "ε-regularity (5.1) needs the second fundamental form `A` …" and "The curvature estimate for stable surfaces (7.5) needs `|A|` and the stability form".
**Claim:** Both headlines are statable in `ℝ³` at the pins and are absent. For an isometric immersion, `|A|² = Σᵢ |Hess fᵢ|²` with `TauCeti.Manifold.hessian`. The stability form uses `TauCeti.Manifold.mgradient` and `TauCeti.riemannianVolume`. Not repaired (previous R03).
**Witness:** A scratch copy of `Suggested.lean` with the code below, `import TauCeti.Geometry.Manifold.Riemannian.VolumeDensity.Volume` and `ENNReal` in `open scoped`, elaborates at the pins with six `sorry` warnings and nothing else (re-run at this head).
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
**Claim:** As stated, 3.1's rigidity cannot apply to an immersed limit, so it cannot recover that limit's embeddedness. Its cited source proves it for proper immersions. Not repaired (previous R04).
**Witness:** [White], Theorem 4 (arXiv:1308.3325v4): stated for a properly immersed minimal manifold without boundary; density at infinity at least 1, with equality only for a multiplicity-one plane.
**Repair:** In 3.1 (lines 630–634), replace the rigidity sentence with:

> Include the affine-plane-rigidity equality case [White, Theorem 4]: if `f : Σ → ℝ^m` is a proper minimal immersion of a nonempty n-manifold without boundary satisfying `lim_(R→∞) Area(f⁻¹(B_R(0)))/(ω_n Rⁿ) ≤ 1`, then translation invariance of the asymptotic ratio and the small-ball limit `#f⁻¹(p₀) ≥ 1` at `p₀ ∈ f(Σ)` force the ratio at p₀ to be identically 1, hence `(f−p₀)^⊥ ≡ 0`, and f is an embedding onto an affine n-plane through p₀.

## R05 (P3) — Bernstein: the Lean statement is for `C²` solutions, the README for smooth ones
**Location:** `README.md` lines 1533–1534: "every smooth solution of the minimal-surface equation on all of `ℝ²` is affine". `Suggested.lean` line 92: `(hu : ContDiff ℝ 2 u)`.
**Claim:** The Lean statement is more general than the README's, and its proof needs a `C²` solution to be smooth, an input 7.6's *Needs:* does not list. Not repaired (previous R05).
**Witness:** 7.6 *Needs:* (line 1549) reads "7.5, 7.3." The smoothness of a `C²` solution comes from 2.2 (De Giorgi–Nash–Moser for Du, then Schauder).
**Repair:**
- Lines 1533–1534: "Consequently, every `C²` solution of the minimal-surface equation on all of `ℝ²` is affine: it is smooth by the regularity of 2.2, an entire graph is complete, and it is stable by 7.3".
- 7.6 *Needs:* "7.5, 7.3; 2.2 (smoothness of a `C²` solution)."
- MS7 Dependencies (lines 1590–1591): "Items 7.1–7.5 are independent of Layers 2, 4 and 5; 7.6 uses 2.2, and 7.7 uses 2.5 and 5.2."

## R06 (P3) — `Suggested.lean`: a non-headline lemma, and section comments not in Layer form
**Location:** `Suggested.lean` lines 70–86 (`exists_point_picking`); section comments at lines 48, 70, 88 and 100, e.g. "/-! ### MS4.2: the half-space theorem -/".
**Claim:** The point-picking lemma is an elementary metric-space lemma, not a headline of the Summary. The section comments are not `/-! ## Layer k: <title> -/`. Not repaired (previous R06).
**Witness:** A 20-line scratch proof (`IsCompact.exists_isMaxOn`, `dist_triangle`, `nlinarith`) closes it without `hSR` or `hxR`. The headline list (README lines 5–10) has no MS5.4 item.
**Repair:**
- Delete `exists_point_picking`, with "Lean name: `exists_point_picking`." (README line 1023).
- Remove "the point-picking lemma (5.4)," from README line 15, `Suggested.lean` line 9 and the description.
- Rename the section comments to `/-! ## Layer 4: the half-space theorem -/`, `/-! ## Layer 7: stability and the curvature estimate -/` and `/-! ## Layer 10: eigenvalue estimates and area bounds -/`.

## R07 (P3) — Frankel's theorem has no locator; Yang–Yau is cited without one
**Location:** `README.md` line 2086 (11.2): "*Sources:* [Frankel]." Lines 1909 and 1951: "[Hersch]; [YangYau]; [Chodosh, Theorem 34.5]" and "[YangYau]; [Chodosh, Theorem 34.5]".
**Claim:** The headline 11.2 cites no theorem or page; 10.3 and 10.4 cite Yang–Yau without the result or page. Not repaired (previous R07).
**Witness:** YangYau (Numdam): the §2 Proposition, p. 58, is `λ₁A ≤ 8πd` for a holomorphic map of degree d; p. 59 applies Hersch's argument; Theorem 1, p. 55, is the genus bound.
**Repair:**
- 10.3: "*Sources:* [Hersch]; [YangYau, p. 59]; [Chodosh, proof of Theorem 34.5]."
- 10.4: "*Sources:* [YangYau, §2, Proposition, p. 58, and Theorem 1, p. 55]; [Chodosh, Theorem 34.5 and its proof]."
- 11.2: add the theorem number and page of the intersection theorem in [Frankel], and "[Chodosh, Exercise 20.2]" for the round sphere.

## R08 (P3) — The description's account of the parent README edits omits the new R1 locators
**Location:** Description: "**Edits to the parent README.** A paragraph listing the sub-roadmap after the opening, and one sentence in "Downstream consumers"."
**Claim:** The head also edits R1 and the References of `TauCetiRoadmap/RiemannianGeometry/README.md`, which the description does not state.
**Witness:** `TauCetiRoadmap/RiemannianGeometry/README.md` at 9cfb02f: R1 item 1 gains "(Bishop, *Riemannian Geometry*, §3.11, p. 13, …)", item 3 gains "(Barzen–Leymann, *Mathematics of Spacetime*, Theorem 7, p. 46, …)", and both References entries are extended.
**Repair:** Replace the paragraph with: "**Edits to the parent README.** A paragraph listing the sub-roadmap after the opening; one sentence in "Downstream consumers"; and two locators in R1 with their References entries: Bishop, *Riemannian Geometry*, §3.11, p. 13, for the moving-frame curvature of item 1, and Barzen–Leymann, Theorem 7, p. 46, for flatness in item 3."

## Previous findings

- R01 — not repaired: README lines 98–102, "have this sub-roadmap as their single owner"; CanonicalModelsAndGonality §8.4 at #1726 still owns both.
- R02 — not repaired: README line 786, "the estimate of the terms that the curvature of a Riemannian ambient manifold adds to it is owned here".
- R03 — not repaired: `Suggested.lean` lines 23–24 and 31–32 still call 5.1 and 7.5 not statable; neither is declared.
- R04 — not repaired: README line 631, "a nonempty properly embedded minimal n-submanifold without boundary".
- R05 — not repaired: `Suggested.lean` line 92 `(hu : ContDiff ℝ 2 u)`; README line 1533 "every smooth solution"; *Needs:* "7.5, 7.3."
- R06 — not repaired: `exists_point_picking` at `Suggested.lean` line 76; section comments `/-! ### MS4.2: … -/` at lines 48, 70, 88, 100.
- R07 — not repaired: README line 2086 "*Sources:* [Frankel]."; lines 1909 and 1951 cite [YangYau] without locator.

## Verified sound

| Statement | Instance | README / Lean side | Computed side | Result |
|---|---|---|---|---|
| MS1 blow-up of the metric (R1.5), cited by the changed parent sentence | unit `S²`, `λ = 10`, `ρ = 1` | `λ²·exp_p(·/λ)*g → δ` | `dρ² + λ²sin²(ρ/λ)dθ²`: `100 sin²(0.1) = 0.99667`; gap `0.00333 = 1/(3λ²)` | holds |
| MS1 Bonnet–Myers (R4.5), cited by the changed sentence | `ℝP³`, `Ric = 2g`, `δ = 1` | diam `≤ π`, finite cover | diam `π/2`; universal cover `S³`, 2 sheets, `π₁ = ℤ/2` | holds |
| 3.1 plane rigidity (R04) | Enneper's surface (proper, immersed, not embedded) | 3.1 as written: not applicable | Jorge–Meeks `−4π = 2π(1 − I)`, `I = 3`: density at infinity 3 `> 1` | consistent; R04 |
| 3.6 ambient terms (R02) | `S¹(√⅓) × S²(√⅔) ⊂ S⁴`, `n = 3` | `½Δ|A|² − |∇A|² + |A|⁴` | curvatures `√2`, `−1/√2` (×2), `|A|² = 3`, `∇A = 0`: value `9 = n|A|²` | holds; owner R02 |
| 5.1 ε-regularity, ℝ³ form (R03) | sphere radius ρ; catenoid neck `a = 100`, `r = 1`, `σ = ½` | `hessianCoordNormSq = |A|²`; `σ²|A|²(q) ≤ C₀∫|A|²` | `Σᵢν_i²·2/ρ² = 2/ρ²`; `5·10⁻⁵ ≤ C₀·6.3·10⁻⁴` for `C₀ ≥ 0.08` | holds; R03 |
| 5.4 point picking (R06) | `X = ℝ`, `S = [−1,1]`, `f = y²`, `x = ½` | `M = ⅛`, `q`, ball, `2f(q)` | `q = ⅔`, weight `4/27`; ball `(½,⅚)`; `M/2 = 0.0625 ≤ 0.0741`; `sup f = 0.694 ≤ 0.889` | holds; not a headline |
| 7.5 curvature estimate, ℝ³ form (R03) | full catenoid, log cutoffs φ | stability hypothesis | `∫|∇φ|² → 0`, `∫|A|²φ² → 8π`: `Q → −8π < 0`, hypothesis fails as `R²|A|² → ∞` requires | holds; R03 |
| 7.6 Bernstein (R05) | `u = xy` at `(1,1)`; `u = 2x − y + 3` | MSE left side | `−2·1·1·1 = −2 ≠ 0` (not a solution); affine: `0` | holds; R05 |
| 10.3 Hersch (R01, R07) | `a = (0,0,⅘)`, `x = e₁, ±e₃` | `herschMap a x` | `(⅗,0,⅘)`, norm 1; `−e₃`: `5·(0,0,−⅕) = −e₃`; `e₃` fixed | holds; owner R01 |
| 10.4 degree bound (R01, R07) | flat square torus, area 1, `d = 2` (℘); round `S²`, `d = 1` | `λ₁A ≤ 8πd` | `4π² ≈ 39.48 ≤ 16π ≈ 50.27`; `2·4π = 8π` (equality) | holds; R07 |
| 11.2 Frankel (R07) | great spheres `{x₄=0}`, `{x₃=0}` in `S³`; `T²×{0}`, `T²×{½}` in flat `T³` | intersect under `Ric > 0` | meet in `{x₃=x₄=0}`; in `T³` (`Ric = 0`) disjoint at distance `½` | holds; R07 |

The rows for the untouched statements stand as in the previous review, of `3866361`.

- Folder: `git diff 3866361 HEAD` of `TauCetiRoadmap/RiemannianGeometry/MinimalSurfaces/` is empty. The only change is the parent README (12 insertions, 5 deletions).
- Changed parent sentence: "R4.1–R4.3, R4.5" matches MS1, which cites R4.1 (lines 220, 227), R4.2 (237), R4.3 (240) and R4.5 (242), and no R4.4 or R4.6. R1.5 is at parent line 1474 ("Item 5 of R1", MS1 line 212). The R1 locators added to items 1 and 3 are not consumed here.
- Cross-roadmap citations re-resolved at current heads: R5c (#2222, line 3387), R7.9 (#2223, 3832), R4.1 barriers (#2224, 2212), R3 with free endpoints (#2224, 1570), S6 (#2225, 781). A three-way merge of the parent README at this head with the heads of #2222–#2224 has no conflict.
- Gate (worker's run, 9cfb02f): every check passes. My run with the candidate order and `--build`: every check passes except `outside-folder: TauCetiRoadmap/RiemannianGeometry/README.md`, the pull request's own family index. Dependency check: `depcheck: 206 roadmaps, 1898 edges, 0 problem(s)`.
- Elaboration: `lake env lean Suggested.lean` gives 4 `sorry` warnings and nothing else. The file is unchanged, and the 5 signatures in `signatures.md` lose no binder. A scratch copy with R03's code gives 6 `sorry` warnings.
- Seeded sample: none of the 15 sampled targets lies in a changed passage; they stand as checked at `3866361`.
- External witnesses re-read: CanonicalModelsAndGonality at #1726 (`e7bed94`), lines 287 and 1784–1794; GeometricCurrents on main (`7342e8f`), lines 839 and 842.
- Overlap check: read RiemannianGeometry (main, #2222–#2224), Surfaces (#2225), PositiveMass, RicciFlow, GeometricCurrents, CanonicalModelsAndGonality; R1–R8 RiemannianGeometry's, S1–S6 Surfaces', Gauss–Bonnet PositiveMass §3.1's (all cited); Simons' identity and inequality G6's (R02); Hersch and `λ₁A ≤ 8πd` here and CanonicalModelsAndGonality §8.4 (R01); RicciFlow shares nothing.

## Not verifiable

- [Frankel] (Ann. of Math. 83, 1966): JSTOR paywall, not fetched; the theorem number for R07 is the author's to supply.
- [CM], [HM], [ChoiSchoen], [ChoiWang] and the other unfetched sources stand as at `3866361` (paywalled or no legal copy found); no changed passage relies on them.

## Source issues

- none
