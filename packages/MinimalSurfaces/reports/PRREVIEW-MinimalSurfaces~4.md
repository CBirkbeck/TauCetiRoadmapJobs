# Review of MinimalSurfaces (pull request #2226 at 4788ed5)
Folder: `TauCetiRoadmap/RiemannianGeometry/MinimalSurfaces/`
**Verdict:** needs changes

## R01 (P2) — 4.1's unique continuation has no owned input
**Location:** `README.md` lines 843–846 (4.1): "Include unique continuation [CM, §1.7] [Chodosh, Corollary 19.6]: if Σ is connected, `f : Σ → N` is a minimal immersion into a Riemannian `(n+1)`-manifold, … `f(U) ⊂ S` … then `f(Σ) ⊂ S`."
**Claim:** Two-sided agreement on an open set does not follow from 3.2, which needs one-sided contact. The step needs unique continuation for the linear equation of 2.5 (Aronszajn) or analyticity. *Needs:* (3.2, 2.5, R5a) supplies neither, and no roadmap owns either. 4.2 needs only the one-sided form.
**Witness:** [Chodosh, Corollary 19.6, p. 53] is the one-sided principle (one surface inside the region the other bounds: they coincide or are disjoint). `roadmaps grep -i 'unique continuation'` finds only PH3.5, for Cauchy–Riemann operators.
**Repair:**
- 4.1: replace the quoted sentence with:

  > Include the global tangency principle [Chodosh, Corollary 19.6]: if Σ is connected and without boundary, `f : Σ → N` is a minimal immersion into a Riemannian `(n+1)`-manifold, `S ⊂ N` is a properly embedded minimal hypersurface, possibly with boundary, with `f(Σ) ∩ ∂S = ∅`, and every point of `f⁻¹(S)` has a neighbourhood whose image lies on one side of S, then `f⁻¹(S)` is empty or all of Σ. It is closed, and it is open by 3.2, since one-sided contact forces equal tangent planes.
- 4.2, line 875: replace "then the tangency principle and unique continuation force `f(Σ) = {x₃ = 0}`" with "then the global tangency principle of 4.1 gives `f(Σ) ⊂ {x₃ = 0}`. By properness the image is open and closed in the plane, so it is the plane".
- 4.2, lines 882–883: replace "The tangency principle and unique continuation then force `f(Σ)` to be a catenoid, which is not contained in a half-space;" with "The global tangency principle of 4.1 then puts `f(Σ)` in the compact set `{λ ≤ ρ ≤ λ cosh(t/λ)}` of the contact barrier. By properness Σ is then compact, which 3.3 excludes;".
- Add 3.3 to 4.2's *Needs:*.
- In Scope (line 38) and in the description's MS4 bullet, replace "unique continuation" with "the global tangency principle".

## R02 (P3) — Three targets without a locator
**Location:** `README.md` 2.6 (lines 576–600) and 3.4 (lines 717–743) have no *Sources:* line. 4.1 (line 836), "Establish a first-contact lemma", cites nothing for the lemma.
**Claim:** Each target needs a locator, and these three have none. 3.4 cites [CM4, Lemma C.1] only for an application.
**Witness:** [CM4] (arXiv:math/0210119v1), §0, defines N-valued graphs over the universal cover of `ℂ ∖ {0}`, with `w(ρ,θ) = u(ρ,θ+2π) − u(ρ,θ)`. Its Appendix C proves Lemma C.1 by the maximum principle for `dist²` on small balls.
**Repair:**
- 2.6: add "*Sources:* [CM4, §0, notation for multi-valued graphs]."
- 3.4: add "*Sources:* [CM4, Appendix C, proof of Lemma C.1]."
- 4.1: after "Establish a first-contact lemma", insert "([Chodosh, proof of Theorem 20.1])".

## R03 (P3) — 2.3's source covers only the Euclidean metric
**Location:** `README.md` line 474: "*Sources:* [Chodosh, proof of Theorem 32.5]." The statement (lines 476–496) varies the metric g near `g_Eucl` in `C⁴`.
**Claim:** The cited proof solves the Euclidean minimal-surface equation only. The statement's dependence on g is not in the source.
**Witness:** [Chodosh, proof of Theorem 32.5, p. 78] applies the implicit function theorem to the Euclidean operator `M`, with linearization `Δ`, on `B₁ ∩ Π₀`. No metric parameter appears.
**Repair:** Line 474: "*Sources:* [Chodosh, proof of Theorem 32.5], for `g = g_Eucl`. The dependence on g is this roadmap's extension: the same implicit-function argument, with g as a parameter."

## R04 (P3) — [Frankel] is still cited without theorem or page
**Location:** `README.md` line 2051 (11.1) "[Lee, Chapters 6, 10]; [Frankel]", line 2092 (11.2) "[Frankel]; [Chodosh, Exercise 20.2], for the round sphere" and line 2123 (11.3) "[Frankel]; [Bernstein, Theorem 3.1]".
**Claim:** Headline 11.2 and items 11.1 and 11.3 cite Frankel's paper without a theorem number or page. This is the unrepaired part of the previous R07.
**Witness:** [Chodosh, Exercise 20.2, p. 55] covers minimal hypersurfaces of the round sphere only. 11.2 is stated for every complete manifold with `Ric > 0`.
**Repair:** At 11.1, 11.2 and 11.3, write `[Frankel, Theorem N, p. P]` with the number and page of Frankel's intersection theorem and of the surjectivity of `π₁(Σ) → π₁(M)` (Ann. of Math. 83 (1966), 68–73).

## R05 (P3) — `hessianCoordNormSq` is not in the README and has no Checks
**Location:** `Suggested.lean` line 76, `def hessianCoordNormSq`. The README never names it. Its identity sits in MS1's R5a bullet (lines 162–163): "For an isometric immersion `f : Σ → ℝ^m`, `Hess_Σ(x_i ∘ f) = ⟨II, e_i⟩`".
**Claim:** Every Lean name must appear in the README, and a definition needs Checks. R5a does not state this identity: it supplies only `Δ⁺f = −mH` (parent `README.md` line 3046).
**Witness:** Round sphere of radius ρ: `Hess(x_i) = −(ν_i/ρ) g`, so the sum is `2/ρ² = |A|²`. For the non-isometric `2ι` of the unit sphere the sum is 8, but the image has `|A|² = ½`.
**Repair:**
- Move the sentence of lines 162–163 into 1.1 as: "Also prove, from R5a's Gauss formula, that `Hess_Σ(x_i ∘ f) = ⟨II, e_i⟩` for an isometric immersion `f : Σ → ℝ^m`. Hence `|II|² = Σ_i |Hess_Σ(x_i ∘ f)|²`; for `m = 3`, `n = 2` this sum is `hessianCoordNormSq`."
- Add to 1.1's Checks:
  - "Round sphere of radius ρ: `Hess_Σ(x_i ∘ f) = −(ν_i/ρ) g`, so the sum is `2/ρ² = |A|²`; on the catenoid it is `2/cosh⁴ v`."
  - "Negative control for isometry: for `2ι` on the unit sphere the sum is 8, while the image sphere has `|A|² = ½`."
- 1.1 *Needs:* "R5a's Gauss equation and Gauss formula."

## R06 (P3) — `Suggested.lean` section comments are not in Layer form
**Location:** `Suggested.lean` line 72: "/-! ## Layer 5 and Layer 7: ε-regularity and the curvature estimate in `ℝ³` -/". Line 134 repeats "## Layer 7".
**Claim:** Each section comment must be `/-! ## Layer k: <title> -/`, in README order and once per layer. Here Layer 7 opens twice and 7.5 sits under a combined heading.
**Witness:** README headings: "Layer 5 (MS5): local compactness and ε-regularity" (line 913) and "Layer 7 (MS7): stability and the curvature estimate" (line 1313).
**Repair:**
- Replace line 72 with `/-! ## Layer 5: local compactness and ε-regularity -/`.
- Move line 134, `/-! ## Layer 7: stability and the curvature estimate -/`, to just before the docstring of `exists_sq_mul_hessianCoordNormSq_le_of_stable` (line 111).

## R07 (P3) — The description's sentence on CanonicalModelsAndGonality is outdated
**Location:** Description, Boundaries: "CanonicalModelsAndGonality §8.4 (#1726) states the same two results, and its author has been asked, on #1726, to cite them and merge after this pull request."
**Claim:** The current head of #1726 cites 10.3–10.4 and restates neither.
**Witness:** `TauCetiRoadmap/CanonicalModelsAndGonality/README.md` at #1726 (`77620a3`), lines 135–137 and 1806: "`λ₁ · A ≤ 8π · d` is RiemannianGeometry.MinimalSurfaces 10.4, … neither is restated here."
**Repair:** Replace the sentence with "CanonicalModelsAndGonality (#1726) cites 10.3 and 10.4 in its §8.4 and restates neither."

## Previous findings

- R01: repaired. Lines 99–103 now read "as CanonicalModelsAndGonality §8.4 does, cites 10.3 and 10.4", and #1726 at `77620a3` cites both items (lines 135–137, 293–294, 1806).
- R02: repaired. Lines 789–797 "consume G6's Simons identity and inequality"; only the `n = 2` Kato form is owned.
- R03: repaired. `Suggested.lean` lines 86–132 state 5.1 and 7.5 in `ℝ³`.
- R04: repaired. Lines 633–638: "if `f : Σ → ℝ^m` is a proper minimal immersion", as in [White, Theorem 4].
- R05: repaired. Line 1537 "every `C²` solution"; line 1554 "*Needs:* 7.5, 7.3; 2.2".
- R06: partly repaired. `exists_point_picking` is deleted, but line 72 combines Layers 5 and 7 (R06 here).
- R07: partly repaired. The 10.3 and 10.4 locators are added and verified; 11.2 still cites "[Frankel]" without a theorem (R04 here).
- R08: repaired. The description's parent-edit paragraph names both R1 locators.

## Verified sound

| Statement | Instance | README / Lean side | Computed side | Result |
|---|---|---|---|---|
| 2.3 Dirichlet problem | `u = ½|x|²`; `g = e^(2at)(dx²+dt²)`; hyperbolic | `M(u)(0) = n`; slice `−nae^(−at₀)`; horosphere n | `(∇_XY)^⊥ = −g₀(X,Y)a∂_t`, trace over `e^(−at)∂_i` gives `−nae^(−at₀)`; hyperbolic gives n | holds; source Euclidean only (R03) |
| 2.6 multi-valued graphs | helicoid `u = θ`; `Ω = {0<θ<3π}` | MSE numerator; w | `2x³y−2xy³+2xy(y²−x²) = 0`; `w ≡ 2π`; w defined for `θ ∈ (0,π)` | holds; no locator (R02) |
| 3.2 tangency | catenoid at `(1,0,0)`; `u₁ = 0`, `u₂ = x₁` on `{x₁ ≥ 0}` | one side; boundary gradient | `x₁ − 1 ≈ ½(x₃² − x₂²)` takes both signs; `Du₂ − Du₁ = e₁ ≠ 0` | holds; [Chodosh, Prop. 19.3, Cor. 19.6] match |
| 3.4 small-ball maximum principle | unit `S^m` | `Hess(r²) > 0` for `r < π/2` | `2dr² + 2r cot r (g − dr²)`, positive iff `cot r > 0` | holds; no locator (R02) |
| 4.1 first contact, barriers | unit sphere, `S = {x₃ = 0}`; `λ = 0.01`, `ρ = 1` | `t₀`; barrier height | `t₀ = 1`, tangent at the north pole; `0.01·arccosh 100 = 0.0530` | holds; unique continuation input unowned (R01) |
| 4.2 half-space (Lean) | `{x₃ = c}`, `c ≥ 0`; paraboloid; Jorge–Xavier | `range f = {y | y 2 = c}` | plane meets every hypothesis; paraboloid has `Δ_Σ x₃ ≠ 0`; [Chodosh, Thm 20.2]: non-proper in a slab | holds |
| 5.1 ε-regularity (Lean) | plane; `λ𝒞 ∩ B₁(0)`, `σ = ½` | `σ²|A|²(q) ≤ C₀∫|A|²` | `0 ≤ 0`; `∫_𝒞|A|² = 8π` while `2σ²/λ² → ∞` at the waist, so `ε < 8π`; reduction picks `r′ > |f(q)−x₀| + σ` | holds |
| 5.2 compactness | `λ𝒞`, `λ → 0`, `U = ℝ³∖{0}` | `|A| = √2λ/ρ²` | tends to 0 on compacts, ρ bounded below there; multiplicity 2; in `ℝ³` `|A| = √2/λ` at the waist | holds; [Chodosh, Thm 28.5], [White, Thm 22] |
| 5.3 immersed compactness | `{x₃ = 0}`, `{x₃ = x₁/i}` | limit, m | cross along a line for each i; limit `{x₃ = 0}`, `m = 2` | holds |
| 6.1/6.5 index | `S²_eq`; Clifford torus | spectrum of `−J` | `j(j+1)−2`: −2, 0 (×3), so index 1, nullity 3; `2(k²+ℓ²)−4`: −4, −2 (×4), so index 5, nullity 4 | holds |
| 6.4 instability | `S²_eq`; Clifford; flat `T²×{t}` | `Q(1)` | `−8π`; `−4·2π² = −8π²`; `Q(φ) = ∫|∇φ|² ≥ 0` | holds |
| 7.5 curvature estimate (Lean) | open half-catenoid `{v>0}`; whole catenoid | `R²|A|²(p) ≤ C`; ball compact iff `R < sinh v` | `2 sinh²v/cosh⁴v ≤ ½`, equality at `sinh v = 1`; log cutoffs give `Q < 0` on the whole catenoid | holds; `C ≥ ½` |
| 7.6 Bernstein (Lean) | `u = xy` at `(1,1)`; `x² − y²`; affine | `hmse` left side | `−2`; `8(y² − x²)`; `0` | holds |
| 7.7 stable limits | `{x₃ = ±1/i}` | m, Jacobi field | `m = 2`; normalized difference `≡ 1`, `J1 = 0` | holds; [Chodosh, Prop. 33.3] |
| 8.1 removable singularities | punctured plane; `z ↦ (z², z³)` in `ℝ⁴` | `C₁`; area ratio | `C₁ = π`; area `2πρ²(1+o(1))`, ratio 2, cuspidal closure | holds; codimension one needed |
| 9.1 bounded total curvature | `T²×{±1/j}` in flat `T³`; `λ𝒞` | B, m | `B = ∅`, `m = 2`; total curvature `8π` concentrating at 0 | holds |
| 9.2 multiplicity one | `η = 0.1`, `ar = 0.01` | ratio bound | `0.99/(1 − 1.01005·0.01) = 1.0001` | holds; [Chodosh, Lemma 31.4] |
| 9.3 multiplicity implies stability | `T²×{0}`; `log(δ/ε) = 10` | Q; cutoff energy | `Q = ∫|∇φ|² ≥ 0`; `2π/10 = 0.628`; 1-D cutoff energy `≥ 1/δ` | holds; [Chodosh, Thm 33.1, Lemma 33.5] |
| 10.2 Choi–Wang | `Sⁿ_eq`; Clifford torus | `λ₁ ≥ k/2` | `n ≥ n/2`; `2 ≥ 1` | holds; [Chodosh, Thm 34.3] |
| 10.3 Hersch (Lean) | `a = (0,0,⅘)`; `x = e₁`, `−e₃` | `herschMap a x` | `(⅗,0,⅘)`, norm 1; `(−⅗ + ⅖)e₃/⅕ = −e₃` | holds |
| 10.5 area from genus | `S²_eq`, Clifford, `k = 2`; flat `T³` | `(16π/k)(γ+1)` | `4π ≤ 8π`; `19.74 ≤ 50.27`; tori of area `√(p²+q²)` unbounded | holds; [Chodosh, §34.3] |
| 11.1 second variation | spheres of radii 1, 2; unit parallel V | endpoint terms | formula `−½ + 1 = ½`; `L = √(5 − 4cos(s/2)) = 1 + s²/4 + O(s⁴)` | holds |
| 11.2 Frankel | Clifford ∩ `{x₄ = 0}`; `T²×{t₁}`, `T²×{t₂}` | intersect | `x₃² = ½`: two circles; flat `T³` (`Ric = 0`): disjoint | holds; locator missing (R04) |
| 11.3 preimages | `ℝP³`, `d = 2`; a minimal sphere | `χ(Σ̃) = dχ(Σ)` | `2 = 2·1`; `γ̃ = −1`, impossible | holds |
| 12.1 Choi–Schoen | `ℝP³` cover; flat `T³` tori | lifted genus | `2γ − 1`; areas `√(p²+q²) → ∞` at `Ric = 0` | holds; [Chodosh, Thm 34.6] |
| 1.1/MS1 `hessianCoordNormSq` | sphere of radius ρ; `2ι` on unit sphere | `Σ_i|Hess x_i|²` | `2/ρ² = |A|²`; non-isometric: 8 against `|A|² = ½` | holds for isometries (R05) |

- **Seeded sample.** All 15 targets were checked. 2.3, 2.6 and 4.1 lead to R01–R03, and 11.1 and 11.3 to R04. The other ten (3.2, 4.2, 5.2, 5.3, 7.6, 7.7, 9.2, 9.3, 10.2, 10.5) match their locators and hypotheses.
- **Source locators checked against the text: 41.**
  - [Chodosh] (version of 15 September 2025): §§19–20, 25 and 28–34, 25 results.
  - [White] (arXiv:1308.3325v4): Theorems 3, 4, 13, 22 and 28–30.
  - [YangYau] (Numdam): Theorem 1, p. 55; Proposition, p. 58; Hersch step, p. 59.
  - [Lynch] (arXiv:2611.12758v1, OCR): Theorem 1.1, Proposition 4.1, Proposition B.1.
  - [CM4] (arXiv:math/0210119v1): §0, Theorem 0.2, Lemma C.1.
- **Library declarations opened at the pins.**
  - Tau Ceti: `TauCeti.Manifold.hessian` (`Riemannian/Laplacian.lean:135`, the Levi-Civita Hessian), `laplaceBeltrami` (`:238`), `mgradient` (`Riemannian/Gradient/Basic.lean:73`), `riemannianVolume` (`VolumeDensity/Volume.lean:82`, chartwise and locally finite), `secondFundamentalForm` (`InnerProductSpace/SecondFundamentalForm.lean:82`, normed-space source only).
  - Mathlib: `RiemannianBundle` and its fibre inner product (`Topology/VectorBundle/Riemannian.lean:420–458`, so `stdOrthonormalBasis` is g-orthonormal); the model-space metric (`Geometry/Manifold/Riemannian/Basic.lean:125`).
- **Cross-roadmap citations resolved.**
  - Open heads: R5c at #2222 (`90a5c6a`, line 3392); R7.9 at #2223 (`a3dee99`); R4.1 barriers and R3 free endpoints at #2224 (`c6b1b05`, lines 2212 and 1570); S5 and S6 at #2225 (`762bf82`, lines 704 and 779).
  - Main (`7342e8f`): PositiveMass §3.1 (line 690); AlgebraicTopology §§7.1, 7.3, 8.7; DifferentialGeometry 10.2 and 12.5 (lines 2695, 2936); SmoothBundlesConnections B5.0; HopfRinow Layers 0–4; PDE C13, C14, E22, E23, E25; GeometricCurrents G6 (line 668); PH2.4 and PH7.2.
- **Gate.** The worker's run passes every check. My run against the default order reports only "NOT IN ORDER: MinimalSurfaces" and `outside-folder` for the parent README, which is the pull request's own family index; neither is a finding. The dependency check against the candidate order gives `depcheck: 206 roadmaps, 1899 edges, 0 problem(s)`.
- **Elaboration.** `lake env lean Suggested.lean` gives 5 `sorry` warnings and nothing else. `#check @` on all 7 declarations gives the types in `signatures.md`, with no binder lost. The one-tactic probe (`rfl`, `infer_instance`, `simp`, `aesop`, trivial witnesses) closes none of the 5 theorems. `herschMap 0 e₁ = e₁` holds by `simp`.
- **Ownership.** `roadmaps grep` for Choi–Schoen, Frankel, Choi–Wang, Reilly, Hersch, Simons, the half-space theorem and stable Bernstein finds no second owner. The pins state no minimal-surface theorem.
- **Overlap check.** Read RiemannianGeometry (main, #2222–#2224), Surfaces (#2225), PositiveMass, RicciFlow, GeometricCurrents and CanonicalModelsAndGonality (#1726).
  - R1–R8 belong to RiemannianGeometry and S1–S6 to Surfaces; all are cited here.
  - Gauss–Bonnet belongs to PositiveMass §3.1.
  - The interior maximum principle and Simons' identity and inequality belong to G6, consumed in 3.2 and 3.6.
  - Hersch's lemma and `λ₁A ≤ 8πd` are owned here and cited by CanonicalModelsAndGonality §8.4.
  - RicciFlow shares nothing.

## Not verifiable

- [CM] (AMS GSM 121): no legal copy found. §§1.1–1.8, 2.2, 2.6 and 7.5, Lemmas 1.8, 2.1 and 2.4, and Proposition 1.39 are unread.
- [HM] (Invent. Math. 101): paywalled. 4.2 was checked against [Chodosh, Theorem 20.1] and its remark on proper immersions.
- [ChoiSchoen] (Invent. Math. 81): paywalled.
- [ChoiWang] (J. Differential Geom. 18): Project Euclid refused the automated fetch. 10.2 was checked against [Chodosh, Theorem 34.3].
- [Frankel] (Ann. of Math. 83): JSTOR paywall, so the theorem number for R04 has to come from the author.
- [Bernstein] (math.jhu.edu notes): the server returned HTTP 403. 11.3 and 12.1 were checked mathematically.
- [Lee], [FCS], [dCP], [Pogorelov], [Simons], [Reilly], [SY], [Schoen], [WhiteReg], [GT], [Hersch]: paywalled or not fetched. 7.6 was checked against [White, Theorem 29].

## Source issues

- **Misprint** in Chodosh at Corollary 19.6, proof, p. 54: the source intersects Σ₁ with itself and U; it should intersect Σ₁ with Σ₂ and U; affects nothing.
- **Misprint** in Chodosh at Theorem 34.3, p. 83: the statement assumes only M orientable with `Ric ≥ k` and Σ two-sided; it should also assume M closed and Σ closed embedded, which the separation step uses; affects nothing.
