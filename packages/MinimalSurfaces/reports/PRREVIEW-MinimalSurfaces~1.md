# Review of MinimalSurfaces (pull request #2226 at cfff95b)
Folder: `TauCetiRoadmap/RiemannianGeometry/MinimalSurfaces/`
**Verdict:** needs changes

## R01 (P2) — Statable headlines absent from `Suggested.lean`
**Location:** `Suggested.lean` lines 13–16: "Every other target of `README.md` is stated on the immersion carriers of RiemannianGeometry R5a and R5b … so it has no signature here."
**Claim:** The half-space theorem (4.2, a headline of the Summary) and Bernstein's theorem (7.6) can both be stated at the pins, but neither is in the file. The docstring also names no individual headline that cannot be stated, nor the carrier it lacks.
**Witness:** A scratch copy elaborates with only `sorry` warnings after adding the two theorems below, `import TauCeti.Geometry.Manifold.Riemannian.Laplacian`, `open Bundle` and `open scoped Manifold ContDiff`. Minimality is MS1's characterization of an isometric immersion by harmonic coordinates.
**Repair:** Add (tested):

```lean
/-- **Half-space theorem** (MS4.2). A proper isometric immersion of a connected nonempty surface
into `ℝ³` with harmonic coordinates, that is a proper minimal immersion (MS1), whose image lies in
`{x₃ ≥ 0}` has a horizontal plane as its image. -/
theorem range_eq_plane_of_minimal_of_nonneg {S : Type*} [TopologicalSpace S]
    [ChartedSpace (EuclideanSpace ℝ (Fin 2)) S] [IsManifold (𝓡 2) ∞ S]
    [ConnectedSpace S] [Nonempty S]
    [RiemannianBundle (fun x : S ↦ TangentSpace (𝓡 2) x)]
    [IsContMDiffRiemannianBundle (𝓡 2) 1 (EuclideanSpace ℝ (Fin 2))
      (fun x : S ↦ TangentSpace (𝓡 2) x)]
    {f : S → EuclideanSpace ℝ (Fin 3)}
    (hf : ContMDiff (𝓡 2) 𝓘(ℝ, EuclideanSpace ℝ (Fin 3)) ∞ f)
    (hiso : ∀ (x : S) (v w : TangentSpace (𝓡 2) x),
      inner ℝ (mfderiv (𝓡 2) 𝓘(ℝ, EuclideanSpace ℝ (Fin 3)) f x v)
        (mfderiv (𝓡 2) 𝓘(ℝ, EuclideanSpace ℝ (Fin 3)) f x w) = inner ℝ v w)
    (hmin : ∀ (i : Fin 3) (x : S),
      TauCeti.Manifold.laplaceBeltrami (𝓡 2) (fun y ↦ f y i) x = 0)
    (hprop : IsProperMap f) (hhalf : ∀ x, 0 ≤ f x 2) :
    ∃ c : ℝ, Set.range f = {y | y 2 = c} := by
  sorry

/-- **Bernstein's theorem** (MS7.6). A `C²` solution of the minimal-surface equation
`(1 + u_y²) u_xx − 2 u_x u_y u_xy + (1 + u_x²) u_yy = 0` on all of `ℝ²` is affine. -/
theorem exists_affine_of_minimalSurfaceEquation {u : ℝ × ℝ → ℝ} (hu : ContDiff ℝ 2 u)
    (hmse : ∀ p : ℝ × ℝ,
      (1 + (fderiv ℝ u p (0, 1)) ^ 2) * fderiv ℝ (fderiv ℝ u) p (1, 0) (1, 0)
        - 2 * fderiv ℝ u p (1, 0) * fderiv ℝ u p (0, 1) * fderiv ℝ (fderiv ℝ u) p (1, 0) (0, 1)
        + (1 + (fderiv ℝ u p (1, 0)) ^ 2) * fderiv ℝ (fderiv ℝ u) p (0, 1) (0, 1) = 0) :
    ∃ a b c : ℝ, ∀ x y : ℝ, u (x, y) = a * x + b * y + c := by
  sorry
```

Replace lines 13–16 with one line for each headline that stays unstated, naming the carrier it lacks. For example: "Instability under `Ric > 0` (6.4), removable singularities (8.1), compactness under bounded total curvature (9.1), Frankel's theorem (11.2) and Choi–Schoen compactness (12.1) need the mean curvature and the normal Jacobi operator of an immersion into a Riemannian manifold (R5a, R5b). The pins lack them: `TauCeti.secondFundamentalForm` covers only maps between inner product spaces." Correct the description's sentence "Every other target is stated on the immersion carriers of R5a and R5b, which the pins do not yet provide" in the same way.

## R02 (P2) — Simons' identity has two owners
**Location:** `README.md` lines 500–503 (3.6): "Include the version in a Riemannian `(n+1)`-manifold N … Simons' identity and inequality are also built by GeometricCurrents G6; it is one identity, stated here in the forms and with the Laplacian used below."
**Claim:** 3.6 restates and owns an identity that GeometricCurrents G6 (on main) already owns. This README's own supplier contract (lines 265–266) also imports it from G6.
**Witness:** `TauCetiRoadmap/GeometricCurrents/README.md` line 839 on main: "Build Simons' identity and inequality with the chosen curvature/B signs". This README, line 266: "G6: … Simons' identity and inequality."
**Repair:** Rewrite 3.6 to consume G6 and own only the consequences G6 does not state: "Consume G6's Simons identity and inequality, translated by `Δ = −Δ⁺`. From it prove, for a minimal hypersurface in `ℝ^(n+1)`, the improved Kato inequality `|∇A|² ≥ ((n+2)/n)|∇|A||²`. Hence `Δ|A|² ≥ −2|A|⁴`, and `|A|Δ|A| − (2/n)|∇|A||² ≥ −|A|⁴` where `A ≠ 0`. For `n = 2` prove the equalities `Δs = |∇s|²/s − 2s²` (`s = |A|² > 0`) and `Δ log|A| = −|A|²`." Delete the Riemannian clause, and cite G6 where 7.4 uses the Riemannian identity. In the MS3 Scope bullet (line 31), replace "the forms of Simons' identity used below" with "the improved Kato inequality and the two-dimensional forms of G6's Simons identity".

## R03 (P2) — Hersch's balancing lemma and the degree bound have two owners
**Location:** `README.md` lines 1036–1077 (10.3–10.4): "Hersch's conformal balancing lemma on `S²` … `λ₁(−Δ_Σ) |Σ| ≤ 2E(Φ̃) = 8πd ≤ 8π(γ+1)`."
**Claim:** CanonicalModelsAndGonality, an open new roadmap, owns the same balancing lemma and the same bound `λ₁A ≤ 8πd` for a holomorphic map of degree d. Neither roadmap cites the other.
**Witness:** `TauCetiRoadmap/CanonicalModelsAndGonality/README.md` lines 1781–1795, at the head of pull request #1726. Its §8.4, "The Li–Yau inequality", has sub-milestone (b) "Hersch's balancing lemma" and concludes `λ₁ A ≤ 8π d`.
**Repair:** Settle one owner. Proposed:
- Split a target out of 10.4: "for a branched conformal map `Φ : Σ → S²` of degree d on a closed Riemannian surface, `λ₁(−Δ_Σ)|Σ| ≤ 8πd`".
- Keep it and 10.3 here.
- Add to Scope: "CanonicalModelsAndGonality §8.4 states the same bound for holomorphic maps; 10.3 and this bound are their single owner, and §8.4 cites them."

Alternatively make CanonicalModelsAndGonality the owner, cite it, and place MinimalSurfaces after it in the merge order.

## R04 (P2) — Riemannian adaptation in 7.4: constants not scale-invariant, no source
**Location:** `README.md` lines 840 and 845: "`ΔQ ≥ (1−ε₀)|∇Q|²/Q + (c₀/2)Q² − C(Λ₀² + Λ₁²)`" and "`R² Q(p) ≤ C(1 + (Λ₀ + Λ₁)R²)`".
**Claim:** With a universal C both bounds are dimensionally inconsistent: Λ₁ bounds `|∇Rm_N|` (units length⁻³) but enters with Λ₀'s exponents. [Lynch] treats only `ℝ³` and `ℝ⁴`, so the adaptation has no source.
**Witness:** Under `g ↦ λ²g`, `Q²` and `Λ₀²` scale by `λ⁻⁴` but `Λ₁²` by `λ⁻⁶`. Letting `λ → ∞` deletes Λ₁, yet `ΔQ(p)` contains `−2⟨∇f,(∇Ric_N)(·,ν,ν)⟩`, linear in `∇Rm_N`, which no Λ₀-term bounds where `Rm_N(p) = 0`.
**Repair:** Young's inequality `2√q Λ₁ ≤ δQ² + C_δ Λ₁^(4/3)` gives the scale-correct forms:
- line 840: "`ΔQ ≥ (1−ε₀)|∇Q|²/Q + (c₀/2)Q² − C(Λ₀² + Λ₁^(4/3))`";
- line 845: "`R² Q(p) ≤ C(1 + (Λ₀ + Λ₁^(2/3))R²)`".

Either say that the adaptation is this roadmap's own proof or cite a published one. Delete "every proof has a written source" from the Summary.

## R05 (P3) — Padding in `Suggested.lean`
**Location:** `Suggested.lean` lines 43–78: `six_fifths_mul_sq_le`, `herschMap_zero`, `norm_herschMap`, `herschMap_neg_herschMap`, `tendsto_herschMap`.
**Claim:** The first two close in one tactic and compute small values. The other three are API facts of the definition `herschMap`, which README 10.3 already lists; they are not headline theorems.
**Witness:** The file proves `six_fifths_mul_sq_le` with a single `nlinarith [sq_nonneg (2 * q - s)]` and `herschMap_zero` with a single `simp [herschMap]`. README 10.3 states `T₀ = id`, `T_a⁻¹ = T_(−a)` and the boundary limit as properties of `T_a`.
**Repair:** Delete the five declarations from `Suggested.lean`; the README keeps the statements. Delete "and the elementary inequality behind the constant `6/5` in the gradient estimate for positive Jacobi fields (7.4)" from the docstring. Tested: the copy without them, with R01's additions, elaborates with four `sorry` warnings and nothing else.

## R06 (P3) — Locators that do not contain the cited statement
**Location:** `README.md` lines 369, 481–482, 493, 585, 886, 904, 927: "[Chodosh, Lemma 32.3]", "[Chodosh, Corollary 9.5] [White, Theorem 4]", "[Chodosh, Lemma 26.1]", "[Chodosh, Lemma 29.1]", "[Chodosh, Lemma 32.1, …]", "[Chodosh, Proposition 32.2]", "[Chodosh, Lemmas 32.3–32.4, …]".
**Claim:** Each cited item states something else, or does not exist under that label.
**Witness:** Chodosh line 3386: Lemma 32.3 concerns critical points of `|x|`; the implicit-function solution is in the proof of Theorem 32.5 (lines 3411–3414). Line 2840 is Proposition 26.1, on stability of cones. White line 415: Theorem 4 is plane rigidity.
**Repair:**
- 2.3: "[Chodosh, proof of Theorem 32.5]".
- 3.5: delete "[Chodosh, Corollary 9.5]" (the support of a limit measure, line 1354) and "[White, Theorem 4]".
- 3.1: add "[White, Theorem 4]" to the affine-plane-rigidity clause.
- 3.6: delete "[Chodosh, Lemma 26.1]".
- 5.4: "[Chodosh, proof of Lemma 29.1 and of Theorem 5.5]".
- 8.1: "[Chodosh, §32 opening paragraph, Theorem 32.5]".
- 8.2: "[Chodosh, Lemmas 32.1–32.3, Proposition 32.4]".
- 8.3: "[Chodosh, Proposition 32.4, Theorem 32.5]".

## R07 (P3) — Suppliers defined only by open revisions, not named in the description
**Location:** Description: "pass locally, on this branch and on the merge of this branch with the four suppliers, which merge without conflict." MS1 cites R5c, R7.9, R4.1's smooth upper distance barriers and S6.
**Claim:** These four ids are absent from RiemannianGeometry and Surfaces on main. They exist only at the heads of four open revisions, and the description does not name them.
**Witness:** On main, `RiemannianGeometry/README.md` contains no "R5c", "R7.9" or "Lynch", and `Surfaces/README.md` ends at Layer 5. At the revision heads: #2222 (R5c, line 3348), #2223 (R7.9, line 3747), #2224 (barriers, line 2171), #2225 (S6, line 779).
**Repair:** Replace the sentence with: "MS1 consumes R5c, R7.9 and the smooth upper distance barriers of R4.1 from the RiemannianGeometry revisions #2222, #2223 and #2224, and Surfaces S6 from #2225; this pull request merges after those four."

## R08 (P3) — S4 cited for a curvature case it does not state
**Location:** `README.md` lines 163–165: "on an intrinsic ball with compact closure in the interior on which `K ≤ 0` (or `K ≤ κ` with radius below `π/√κ`, by Jacobi comparison), `exp_p` is defined on the tangent ball".
**Claim:** Surfaces S4 states only the case `K ≤ 0`, and no item of this roadmap uses S4.
**Witness:** On main, `TauCetiRoadmap/RiemannianGeometry/Surfaces/README.md` line 614 is "### 4.2 Normal balls under `K ≤ 0`" (scope, lines 27–28). This README's lines 183–184 list S3, S5 and S6 as the surface tools used.
**Repair:** Delete "(or `K ≤ κ` with radius below `π/√κ`, by Jacobi comparison)".

## R09 (P3) — 6.2 uses a target of MS7
**Location:** `README.md` lines 663–664: "so affine n-planes in `ℝ^m` and minimal graphs in `ℝ^(n+1)` have index 0."
**Claim:** Index 0 for minimal graphs needs 7.3 and 7.1 (MS7), and MS7 consumes MS6. "How to read the build" says MS6 rests on MS1 only.
**Witness:** Minimal graphs are shown stable only in 7.3 (lines 786–788): "so the graph is stable for variations compactly supported in its interior, by 7.1."
**Repair:** End 6.2 with "so affine n-planes in `ℝ^m` have index 0, since `II = 0` gives `Q(V) = ∫|∇^⊥V|² ≥ 0`." Append to 7.3: "; by 6.2 its index is 0."

## R10 (P3) — 8.1 applies 5.1 at a radius where 5.1 says nothing
**Location:** `README.md` lines 896–900: "applying the Riemannian small-total-curvature estimate 5.1 on `B_(s/2)(x)` … yields `(s/2)² |A|²(x) ≤ C₀(∫_(Σ ∩ B_(s/2)(x)) |A|² dμ + (s/2)²) → 0`".
**Claim:** With `r = s/2`, bounding `|A|(x)` with the factor `(s/2)²` is the case `σ = r` of 5.1. In that case 5.1 covers only points with `f(q) ∈ B_(r−σ)(x) = ∅`.
**Witness:** 5.1 (line 546) gives the bound "for `0 < σ ≤ r` and `q ∈ Σ` with `f(q) ∈ B_(r−σ)(x)`". At `σ = r` no q qualifies, so the centre x is not covered.
**Repair:** Replace the display with "`(s/4)² |A|²(x) ≤ C₀(∫_(Σ ∩ B_(s/2)(x)) |A|² dμ + (s/2)²) → 0`" (5.1 with `r = s/2`, `σ = s/4`). Apply it to `Σ ∩ B̄_(s/2)(x)` after perturbing `s/2` to a radius whose sphere meets Σ transversally.

## R11 (P3) — README shape: no `*Needs:*` lines, Checks, Examples or Dependencies
**Location:** The whole `README.md`. For example, 10.3 (lines 1036–1052) defines `T_a` with no `**Checks.**` list and no `*Needs:*` line, and the sections "## MS2." to "## MS12." have no `### Examples` or `### Dependencies`.
**Claim:** Every definition needs at least three discriminating Checks, every target a `*Needs:*` line, and every layer Examples and Dependencies. This README has a single Check (10.1) and none of the rest.
**Witness:** In `README.md`, `**Checks.**` occurs 0 times, `**Check.**` once, `*Needs:*` 0 times, and `### Examples`/`### Dependencies` 0 times. The sibling `Surfaces/README.md` on main has all four in every layer.
**Repair:**
- Retitle the sections "## Layer k (MSk): …" with "### k.n" items, as Surfaces does.
- End each item with a `*Needs:*` line listing its inputs (for 10.3: "*Needs:* `TauCeti.noRetraction_diskBoundary`; dominated convergence.").
- End each section with `### Examples` and `### Dependencies`.
- Add Checks to the definitions in 2.3 (`M_g`), 2.6 (the separation w), 6.1–6.2 (the index), MS7 (`J`, `Q`) and 10.3 (`T_a`). For `T_a`: "for `x ⊥ a`, `T_a(x) = √(1−|a|²)x + a`; `T_a` fixes `±a/|a|`; without the factor `(1+⟨a,x⟩)⁻¹` the image of `−a/|a|` has norm `1−|a|`, off the sphere."

## Verified sound

| Statement | Instance | README side | Computed / source side | Result |
|---|---|---|---|---|
| 2.3 Dirichlet problem (sampled) | linearization at `(g_Eucl,0)`, data `φ+t` | `∂_t u_t = 1` at `(g_Eucl,0,0)` | `Δw = 0`, `w = 1` on `∂B₁` ⇒ `w ≡ 1`; IFT in Chodosh proof of Thm 32.5, lines 3411–3414 | holds; locator R06 |
| 2.4 graphical neighbourhoods (sampled) | `x ↦ λx` | length `λ`, volume `λⁿ`, `|A|²` by `λ⁻²` | `A(E_i,E_j) = −∂²w/√(1+|∇w|²)` scales `λ⁻¹`; Chodosh Lemmas 28.1–28.3, lines 3082–3107 | holds |
| 3.1 monotonicity (sampled) | plane through p; `p ∉ f(Σ)` | ratio `≡ 1`; small-r limit `#f⁻¹(p)` | `(f−p)^⊥ ≡ 0`, remainder 0; limit `0 = #∅`; Chodosh Thm 9.3, White Thm 3 (line 336) | holds |
| 3.3 convex hull (sampled) | closed Σ in `ℝ^m` | no closed minimal submanifold | harmonic coordinates on closed Σ are constant; Chodosh Cor 8.2–8.3, lines 1236–1243 | holds |
| 3.5 mean value (sampled) | `u ≡ 1`, `a = 0`, flat disk | `1 ≤ C(n)R⁻ⁿ·ω_nRⁿ` | true for `C(n) ≥ 1/ω_n`; Chodosh Cor 9.5 is support of limits; White Thm 4 is plane rigidity | holds; locators R06 |
| 3.6 Simons (sampled) | `n = 2` | `Δs = |∇s|²/s − 2s²`, `Δlog|A| = −|A|²` | `|∇A|² = 2|∇|A||²` gives both; Chodosh line 2840 is Prop 26.1, cone stability | holds; R02, R06 |
| 4.2 half-space (headline, sampled) | halves of `λ𝒞`, `λ → 0` | graphs `±λ arccosh(ρ/λ) → 0` | `λ log(2ρ/λ) → 0`, slope `λ/√(ρ²−λ²) → 0`; Chodosh Thm 20.1, line 2418 for immersions | holds; R01 |
| 5.1 ε-regularity (headline) | `x ↦ λx`, `n = 2` | `σ²|A|²(q) ≤ C₀∫|A|²` | both sides scale-invariant; Riemannian `r²` term with metric-dependent `C₀` consistent | holds; [CM] unread |
| 5.2 compactness (headline) | catenoid blow-downs | finite-multiplicity limit off a point | multiplicity-2 plane on `ℝ³∖{0}` (Chodosh line 3196); White Thm 22, line 1107 | holds |
| 5.4 point picking (Lean, sampled) | `X = ℝ`, `R₀ = 1`, `S = [−1,1]`, `f ≡ 1`, `x = 0` | `q = 0`, `ρ = ½`, `f ≤ 2f(q)` | weight `1−|y|` maximal at 0, `M = 1`, `ρf(q) = ½ = M/2`; Lean statement matches | holds; R06 |
| 5.5 Allard (sampled) | ratio at `q_j`, radius `(1−1/j)R_j` | asymptotic ratio `≤ 1` | `(1+1/j)/(1−1/j)ⁿ → 1`; Chodosh Thm 30.1 (`Θ > 1`) is the compactness form | holds |
| 6.3, 6.5 Morse index (headline) | Clifford torus; `S²_eq`; `ℝP²` | index 5, 1, 0; nullity 4, 3, 3 | `2(k²+ℓ²)−4`: −4 (×1), −2 (×4), 0 (×4); `j(j+1)−2`: −2, 0 (×3); odd j only on `ℝP²` | holds |
| 6.4 instability (headline) | `S²_eq ⊂ S³`, `φ = 1` | `Q(1) < 0` | `Q(1) = −∫(0+2) = −8π`; `ℝP² ⊂ ℝP³` stable and one-sided | holds |
| 7.1 (sampled) | graph, `h = ⟨ν,e₃⟩` | `Q(φ) = ∫h²|∇(φ/h)|²` | integration by parts with `Jh = 0`; White Thm 30 (line 1432), Chodosh Prop 33.4 (line 3557) | holds |
| 7.4 Euclidean (sampled) | `c = 1/3`; frame `e₁ = ∇f/|∇f|` | `ΔQ ≥ |∇Q|²/Q + (6/5)Q²` | `2q²+s²/3−(6/5)(q+s/3)² = (1/5)(2q−s)²`; `2|∇²f|²` identity recomputed; Lynch Prop 4.1, lines 468–503 | holds |
| 7.4 maximum principle | `φ = (R²−r̃²)²` at `p̄` | `−4ζ(1+r̃Δr̃) − 8r̃² + (6/5)φQ ≤ 0` | `Δφ − |∇φ|²/φ = 8r² − 4ζ(1+rΔr) − 16r²` recomputed | holds |
| 7.4 Riemannian | `g ↦ λ²g` | `−C(Λ₀²+Λ₁²)`, `C(1+(Λ₀+Λ₁)R²)` | `Q², Λ₀² ∼ λ⁻⁴`, `Λ₁² ∼ λ⁻⁶`, `Λ₁R² ∼ λ⁻¹`; Young gives `Λ₁^(4/3)`, `Λ₁^(2/3)` | fails, R04 |
| 7.5, 7.6 curvature estimate, Bernstein (headline) | `u = ax+by+c`; `s ≤ 3Q` | `R²|A|²(p) ≤ 3R²Q(p) ≤ C` | affine u has zero second derivatives, so it solves the MSE; White Thm 29, line 1422 | holds; R01 |
| 8.1 removable singularities (headline) | 5.1 with `σ = r = s/2` | `(s/2)²|A|²(x) ≤ …` | 5.1 covers `f(q) ∈ B_(r−σ)(x) = ∅`; Chodosh §32 hypotheses (line 3353) match | slip, R10 |
| 8.2 (sampled) | critical point of `r²|_Σ` | `Hess_Σ(r²) = 2g + O(r²) + O(r|A|) > 0` | Chodosh Lemma 32.1 (3367), Lemma 32.2 (3378), Prop 32.4 (3393); no Prop 32.2 | holds; R06 |
| 9.1, 9.2 compactness (headline, sampled) | traced Gauss, `R = 2(K_N(TΣ)+Ric(ν,ν))` | `|A|² = R − 2Ric(ν,ν) − 2K` | `K_Σ = K_N(TΣ) − ½|A|²`; `−4πχ = 8π(γ−1)`; Chodosh Thm 31.3, Lemma 31.4 | holds |
| 10.1 Reilly | unit ball, `f = ½|x|²` | both sides `n(n+1)ω_(n+1)` | LHS `((n+1)²−(n+1))ω_(n+1)`; RHS `H h² = n` over `|Sⁿ| = (n+1)ω_(n+1)` | holds |
| 10.2 Choi–Wang | Reilly plus Green | `λ₁ ≥ k/2` | `0 ≥ (k−2λ₁)∫|∇f|²`; Chodosh Thm 34.3, line 3687 | holds |
| 10.3 `herschMap` (Lean) | `|x| = 1`, `t = ⟨a,x⟩`, `s = √(1−|a|²)` | `|T_a x| = 1`; factor `√((1−|a|)/(1+|a|))` | `(1−s)u²+2stu+s²(1+s) = (1+s)(1+t)²`, `u = t+1+s`; `x ⊥ a`: `|z| = s/(1+|a|)` | holds; R03 |
| 10.4 Yang–Yau (sampled) | round `S²`, `γ = 0` | `λ₁|Σ| ≤ 8π(γ+1)` | `λ₁ = 2`, `|Σ| = 4π`: equality `8π`; Chodosh Thm 34.5 states `⌊(γ+3)/2⌋`, footnote 30 gives `γ+1` | holds |
| 11.2 Frankel (headline) | sum over parallel `E₁…E_n` | `0 ≤ −∫Ric(γ′,γ′) < 0` | endpoint terms `⟨nH⃗ᵢ,γ′⟩ = 0`; endpoint sign matches the R4.1 barrier formula | holds; [Frankel] unread |
| 11.3, 12.1 Choi–Schoen (headline, sampled) | `d = 2`, `γ = 0` | `γ̃ − 1 = d(γ−1)` | `γ̃ = −1` impossible, so no minimal sphere when `π₁ ≠ 1`, as Frankel says; Chodosh Thm 34.6 (line 3793) assumes bounded area | holds |

- Source locators checked against the text:
  - Chodosh (version of 15 September 2025): 38 locators matched to their statement headers, 26 of them read in full.
  - White (arXiv:1308.3325v4): 10. Lynch (arXiv:2611.12758v1, read by OCR): 4.
  - 8 were wrong or imprecise (R06).
- Library declarations opened at the pins:
  - Tau Ceti: `TauCeti.Manifold.laplaceBeltrami` (`TauCeti/Geometry/Manifold/Riemannian/Laplacian.lean:238`), `TauCeti.RiemannSurface.FiniteHolomorphicMap.ofMeromorphic` (`…/RiemannSurface/SphereMap.lean:243`), `TauCeti.noRetraction_diskBoundary` (`…/Singular/BrouwerFixedPoint.lean:71`), `TauCeti.secondFundamentalForm` (`…/InnerProductSpace/SecondFundamentalForm.lean:82`), `Bundle.ContMDiffRiemannianMetric.pullback` (`…/Pullback/Basic.lean:158`).
  - Mathlib: `fourierBasis` (`Mathlib/Analysis/Fourier/AddCircle.lean:410`), `implicitFunction` (`…/Calculus/Implicit.lean:159`), `IsImmersion` (`…/Manifold/Immersion.lean:802`).
- Cross-roadmap citations resolved:
  - PDE C13, C14, E22, E23 and E25 (lines 1344, 1459, 1927, 1965, 2097).
  - GeometricCurrents G6 (lines 668–839); PseudoholomorphicCurveAnalysis §2.4 (line 461) and §7.2 (line 1271); HopfRinow Layers 0–4.
  - RiemannianGeometry on main: R1.5, R3, R4.1 (line 2116), R4.2, R4.3, R4.5 (line 2222), R5a, R5b, R7.0, R7.6, R8.2. Surfaces S1–S5 on main.
  - R5c, R7.9, the R4.1 barriers and S6 exist only at revision heads (R07), where their content matches MS1's contract.
- Gate at cfff95b: every check passes. Dependency check: `depcheck: 206 roadmaps, 1896 edges, 0 problem(s)`.
- Elaboration: `lake env lean` on `Suggested.lean` gives 5 `sorry` warnings and nothing else. The repaired copy (R01, R05) gives 4. The `#check` types of all 9 declarations were compared with README 5.4, 7.4 and 10.3: no binder is lost (the listed `of` is the docstring word "lemma", not a declaration).
- Ownership against open pull requests: 13 objects searched over main and the open heads (Choi–Schoen, Frankel, half-space, Simons, Yang–Yau, Hersch, Choi–Wang, Reilly, Fischer-Colbrie, removable singularities, Clifford torus, Schoen's estimate, Bernstein). Two second owners found (R02, R03).
- Overlap check: read RiemannianGeometry (main and revisions #2222–#2225), Surfaces (main and #2225), PositiveMass, RicciFlow, GeometricCurrents and CanonicalModelsAndGonality.
  - R5a–R5c are owned by RiemannianGeometry and S1–S6 by Surfaces; both are cited.
  - Simons' identity is owned by GeometricCurrents G6 (R02).
  - Hersch's lemma and `λ₁A ≤ 8πd` are also owned by CanonicalModelsAndGonality §8.4 (R03).
  - PositiveMass and RicciFlow share nothing.

## Not verifiable

- [CM] (AMS GSM 121): paywalled, so its locators §§1.1–2.6, Lemmas 1.8, 2.1, 2.4, Proposition 1.39 and §7.5 were not read.
- [Bernstein] Theorem 3.1 (11.3, 12.1): the author page returned HTTP 403 to the sources service.
- [ChoiSchoen], [HM] Theorem 1: the sources service found only paywalled publisher pages for their DOIs.
- [Frankel], [ChoiWang]: the sources service found no legal copy.
- [White]: numbering checked against arXiv:1308.3325v4 only; the Park City volume is paywalled.
- [CM4], [dCP], [FCS], [GT], [Hersch], [Lee], [Pogorelov], [Reilly], [Schoen], [SY], [Simons], [WhiteReg], [YangYau], [BT]: not fetched; no sampled target rests on them alone.

## Source issues

- **Misprint** in Chodosh at proof of Lemma 28.1, p. 70: the source says the eigenvalue `1+|∇w|²` of a graph's induced metric has multiplicity n; it should be multiplicity 1, with eigenvalue 1 of multiplicity n−1; affects nothing.
- **Misprint** in Chodosh at Lemma 29.1, p. 73: the source indexes the surfaces in the hypothesis and in the rescaling factor by i; it should be j throughout; affects nothing.
