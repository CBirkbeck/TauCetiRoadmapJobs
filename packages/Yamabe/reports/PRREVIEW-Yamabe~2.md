# Review of Yamabe (pull request #2248 at c91966f)

**Verdict:** needs changes

## R01 (P2) — Y1.1 builds a second W^(k,p) carrier owned by PseudodifferentialOperators 5.2

**Location:** `TauCetiRoadmap/Yamabe/README.md` 1.1, lines 475–476: "Construct the scalar W^(k,p) finite-chart adapter from PDE's weak spaces, and prove agreement at p=2 with that same Hilbert carrier." API line 489: "Equivalent metric and atlas norms, and smooth density."

**Claim:** PseudodifferentialOperators, on main and earlier in the merge order, owns the W^(k,p) carrier of a real or complex bundle over a compact base. That includes its finite-chart norms, completeness and smooth density. The scalar carrier of Y1.1 is its trivial-line case, so the object has two owners.

**Witness:** `TauCetiRoadmap/PseudodifferentialOperators/README.md` lines 969–971 construct "the weak-covariant-derivative bundle W^(k,p) carrier … on a compact smooth base, using PDE Lane A's scalar weak derivatives in finite bundle charts". Its API bullets at lines 1015–1016 are Y1.1's API bullet.

**Repair:**
- Lines 475–476: replace with "Consume PseudodifferentialOperators 5.2's W^(k,p) carrier on the trivial real line (finite-chart and connection norms equivalent and complete, smooth sections dense for finite p, compact W^(k,p)→W^(l,p)), and prove its agreement at p=2 with that same Hilbert carrier."
- Line 489: delete the bullet "Equivalent metric and atlas norms, and smooth density."
- Line 25: replace "the scalar Sobolev carriers of a closed manifold" with "the comparison of the scalar Sobolev carriers of a closed manifold (PseudodifferentialOperators 5.2, ComplexKahlerGeometry K5a) and their critical embedding".
- Add `### From TauCetiRoadmap.PseudodifferentialOperators` with "5.2: the W^(k,p) carrier of a real bundle over a compact base, its norms, completeness, smooth density and compact embeddings, used on the trivial real line." Add "PseudodifferentialOperators 5.2" to 1.1's *Needs:* and to Layer 1's Dependencies.

## R02 (P2) — Y2.2 re-plans Isoperimetry's Schwarz rearrangement and Pólya–Szegő inequality

**Location:** README 2.2, lines 607–608: "Construct decreasing rearrangement and the coarea/isoperimetric comparison needed for a proof". API line 616: "Decreasing rearrangement on ℝⁿ with ‖u*‖_q=‖u‖_q and ‖∇u*‖₂≤‖∇u‖₂ (Pólya–Szegő)". Line 73: "Sobolev rearrangement and its equality classification are Y2's."

**Claim:** Isoperimetry, on main, owns Schwarz rearrangement with its Lᵖ norms (I2) and the convex-integrand Pólya–Szegő inequality (I5). Y2.2 plans both again, so they have two owners.

**Witness:** `TauCetiRoadmap/Isoperimetry/README.md` lines 160–163 define Schwarz rearrangement and its equimeasurability and Lᵖ norms. Lines 318–319 state "`∫ Φ(‖∇h*‖) ≤ ∫ Φ(‖∇h‖)`" for nonnegative integrable Lipschitz h. At Φ(s)=s² this is Y2.2's API bullet.

**Repair:**
- Line 73: replace the sentence with "[Isoperimetry](../Isoperimetry/README.md) owns Schwarz rearrangement (I2) and the Pólya–Szegő inequality (I5); the equality classification of the sharp L² Sobolev inequality is Y2's."
- Lines 607–608: replace the first sentence of 2.2 with "Consume Isoperimetry I2's Schwarz rearrangement and I5's estimate `∫Φ(‖∇h*‖)≤∫Φ(‖∇h‖)` at `Φ(s)=s²`, extended from nonnegative Lipschitz functions to D¹,² by density, or use the stereographic variational argument with its compactness and equality steps."
- Line 616: replace the API bullet with "Isoperimetry I2 and I5 give `‖u*‖_q=‖u‖_q` and `‖∇u*‖₂≤‖∇u‖₂`; prove here the equality case for the extremals."
- Add `### From TauCetiRoadmap.Isoperimetry` with "I2: Schwarz rearrangement, equimeasurability and Lᵖ norms; I5: the convex-integrand Pólya–Szegő estimate for nonnegative integrable Lipschitz functions." Add "Isoperimetry I2 and I5" to 2.2's *Needs:* and to Layer 2's Dependencies.

## R03 (P3) — Gate failure: `letI` in three theorem signatures

**Location:** `TauCetiRoadmap/Yamabe/Suggested.lean` lines 119, 131 and 251: `(letI : RiemannianBundle (fun x : M ↦ TangentSpace I x) := ⟨g.toRiemannianMetric⟩; …)`. These are in `isLocallyConformallyFlat_of_weylTensor_eq_zero`, `isLocallyConformallyFlat_of_cottonTensor_eq_zero` and `exists_forall_eq_of_ricciTensor_eq_smul`.

**Claim:** Each is a statement-hygiene hit, P3, with the repair "use an instance binder or a named instance in the signature".

**Witness:** The gate at c91966f reports `statement-hygiene=3 … FAIL`. Tau Ceti's `Bundle.ContMDiffRiemannianMetric.scalarCurvature_eq_scalarCurvature_leviCivitaConnection` (`Curvature/Scalar.lean` line 227) ties an instance to g with `hg : RiemannianBundle.g = g.toRiemannianMetric`.

**Repair:** Use Tau Ceti's pattern. These three replacements elaborate at the pins with only `sorry` warnings.

```lean
theorem isLocallyConformallyFlat_of_weylTensor_eq_zero [T2Space M] [IsManifold I ∞ M]
    [RiemannianBundle (fun x : M ↦ TangentSpace I x)]
    [IsContMDiffRiemannianBundle I ∞ E (fun x : M ↦ TangentSpace I x)]
    (hn : 4 ≤ finrank ℝ E) (g : ContMDiffRiemannianMetric I ∞ E (fun x : M ↦ TangentSpace I x))
    (hg : RiemannianBundle.g = g.toRiemannianMetric)
    (hW : ∀ x, (CovariantDerivative.leviCivitaConnection I M).weylTensor x = 0) :
    g.IsLocallyConformallyFlat := by
  sorry
```

Write the Cotton theorem the same way, with `(hn : finrank ℝ E = 3)` and `(hC : ∀ x, (CovariantDerivative.leviCivitaConnection I M).cottonTensor x = 0)`. In `exists_forall_eq_of_ricciTensor_eq_smul`, replace lines 249–252 with:

```lean
    [RiemannianBundle (fun x : M ↦ TangentSpace I x)]
    [IsContMDiffRiemannianBundle I ∞ E (fun x : M ↦ TangentSpace I x)]
    (g : ContMDiffRiemannianMetric I ∞ E (fun x : M ↦ TangentSpace I x))
    (hg : RiemannianBundle.g = g.toRiemannianMetric) {κ : ℝ} (hκ : 0 < κ)
    (hRic : ∀ x (v w : TangentSpace I x),
      (CovariantDerivative.leviCivitaConnection I M).ricciTensor x v w = κ * g.inner x v w)
```

## R04 (P3) — Gate failure: anchor tag in the README

**Location:** README line 1050: `<a id="y9-existence-uniqueness-and-rigidity"></a>`. Line 1214: "RiemannianGeometry R7.0 cites Y9.3, at the anchor of Layer 9, as the owner of Obata's theorem".

**Claim:** The residue rule refuses `<a id=` tags. The id Y9 stays resolvable through the heading "Layer 9 (Y9)" without the tag.

**Witness:** The gate at c91966f reports `residue=1`, at line 1050.

**Repair:** Delete line 1050 and the blank line after it. In lines 1214–1215, replace the bullet with "RiemannianGeometry R7.0 cites Y9 as the owner of Obata's theorem (Y9.3) and consumes nothing from this roadmap."

## R05 (P3) — Layers 6 and 8 depend on each other

**Location:** README line 923, Layer 6 Dependencies: "Layers 1 and 4; Y8.1; …". Line 1047, Layer 8: "Layers 0 and 6; …". Lines 306–307: "Layer 5 proves Theorem B from Layer 4 alone."

**Claim:** 6.2, and 7.1 through it, needs the later target 8.1, while 8.2–8.4 need Layer 6. That is a coarse cycle between layers. Separately, Layer 5 also needs Layers 0 and 2.

**Witness:** 6.2's *Needs:* reads "6.1; 8.1; 0.5; …" (line 914), and 8.2's reads "8.1; 6.1" (line 1005). 5.1's *Needs:* reads "4.1–4.2; 2.3; 0.5" (line 856).

**Repair:**
- Move 8.1's developing map and its covering lemma to a new `### 0.6 The developing map`, with *Needs:* 0.5; DifferentialGeometry 2; UniversalCovers Stages 1–4. The covering lemma: for compact simply connected M the developing map covers Sⁿ and is a conformal diffeomorphism. Keep the round-sphere Spin lift and its pullback as 8.1.
- Cite 0.6 in place of Y8.1 in lines 306 and 308, in 6.2 and 8.3, and in Layer 6's Dependencies.
- Lines 306–307: replace "from Layer 4 alone" with "from Layers 0, 2 and 4, with no positive-mass input".

## R06 (P3) — Claims without a locator

**Location:** README 0.5, "and C=0 implies LCF for n=3"; 1.1 API, "compact H¹→Lq for q<p_n"; 4.4, "prove `G=r^(2−n)+A+O(r)`"; 6.2, "`Y<Y(Sⁿ)` when A>0". Also 8.1, 8.4, 9.2, 9.3 (Obata 1962 and 1971), 9.4, 10.2, 10.3.

**Claim:** These claims carry no theorem or page locator. Lee–Parker p. 43 gives Weyl–Schouten only for n ≥ 4. The docstrings of `isLocallyConformallyFlat_of_cottonTensor_eq_zero` and `eq_of_scalarCurvature_rescale_eq_of_nonpos` cite nothing.

**Witness:** LeeParker1987 lines 292–294 (p. 43) state the n ≥ 4 case only. Lines 356–363 (Theorem 2.2), 1131–1132 (Lemma 6.4(a)), 1302 and 1352 (Proposition 7.1, Theorem 7.2), 1813–1825 (Theorem 10.4) and 142–144 (Theorem C) state the uncited claims.

**Repair:**
- 1.1 API: append "(Lee–Parker, Theorem 2.2, p. 45)".
- 4.4: after "differentiated remainder estimates", add "(Lee–Parker, Lemma 6.4(a), p. 64)".
- 6.2: after "when A>0", add "(Lee–Parker, Proposition 7.1, p. 69, and Theorem 7.2, p. 70)". After "a conformal diffeomorphism", add "(Lee–Parker, proof of the Yamabe theorem, p. 85)".
- 8.1: change "(Schoen–Yau 1988)" to "(Schoen–Yau 1988; Lee–Parker, Theorem 10.4, pp. 81–82)".
- 8.4: add "(Theorem C: Lee–Parker, p. 40)".
- 9.4: add "(Lee–Parker, Theorems B and C, pp. 39–40, and Theorem 3.2, p. 49)", which the Lean docstring already has.
- 0.5 (the case n = 3), 9.2, 10.2, 10.3, and the Obata 1962 and 1971 citations: give a theorem or page locator, marked uncertified where the text is paywalled. Copy it into the two Lean docstrings above.

## R07 (P3) — Two owners named for the conformal scalar law

**Location:** README lines 54–55: "It owns … the scalar law for `φ^(4/(n−2))g` and the mass shift under a conformal factor (0.4)". Line 251: "0.4: the scalar law for `φ^(4/(n−2))g`;".

**Claim:** Lines 46–47 and Y0.2 make the pinned Tau Ceti law the owner. Naming PositiveMass 0.4 for the same law gives it two owners in this README.

**Witness:** `TauCeti.Yamabe.scalarCurvature_rescale_eq_rpow_mul_conformalLaplacian` is at `TauCeti/Analysis/PDE/Yamabe/ConformalLaplacian.lean` line 200, and Y0.2 (line 341) consumes it.

**Repair:** Line 55: delete "the scalar law for `φ^(4/(n−2))g` and". Line 251: delete "the scalar law for `φ^(4/(n−2))g`;".

## R08 (P3) — Y3.2 narrows Lemma 4.3 and leaves Theorem A's route open at Y = 0

**Location:** README 3.2 API, lines 706–707: "For unit volume, |Y_q| is nonincreasing in q, and Y_q is left-continuous at p_n when Y>0."

**Claim:** Lee–Parker's Lemma 4.3 gives left-continuity for λ(M) ≥ 0. With "Y>0", no stated step covers Y = 0 in Theorem A (3.3).

**Witness:** LeeParker1987 lines 756–758 (proof of Theorem 4.5, p. 55) treat λ(M) ≥ 0 by Lemma 4.3 and λ(M) < 0 separately. At Y = 0, λ₁ = 0 and every Y_q = 0.

**Repair:** Replace "when Y>0" with "when Y≥0 (Lee–Parker, Lemma 4.3, p. 54)".

## Verified sound

| Statement | Instances | This roadmap's side | Computed or source side | Result |
| --- | --- | --- | --- | --- |
| 0.1 conformal laws | u≡c on unit S³ | law: `c^(−5)·6c=6c^(−4)` | sphere of radius c²: 6/c⁴; LeeParker1987 lines 287–288, 73 | holds |
| 0.3 Euler–Lagrange | unit S³, `u=\|S³\|^(−1/6)`; hyperbolic, volume V | λ=6\|S³\|^(2/3)=43.82; Q(1)=−6V^(2/3) | Q(u)=43.82; Hölder `∫u²≤‖u‖₆²V^(2/3)`; lines 79–108 | holds |
| 0.5 Weyl–Schouten | S²×S²; Heisenberg; flat ℝ³ | W=−1/3, 2/3, trace 0; C(e₃,e₁,e₂)=1; defect diag(1/2,−1/2,−1/2) | P=g/6; Cotton (b−a)/2−(a−b)/2=1 with a=−3/8, b=5/8 | holds; n=3 locator R06 |
| 1.1 carriers | n=3: \|x\|^(−1/4), \|x\|^(−1/2) | first in H¹ and L⁶; second in neither | `∫r^(−1/2)dr<∞`; `∫r^(−1)dr=∞` | holds; R01, R06 |
| 1.2 λ₁(L_g) | S²(1)×S¹; T³; two unit S³ | λ₁=2; 0; 6 with multiplicity 2 | `8·μ₁(Δ⁺+1/4)=2`; R5c item 1 (RiemannianGeometry at #2222) needs connectedness | holds |
| 1.4 Green function | ℝⁿ, n=3,4,5; unit S³ at d=1 | 32π, 24π², 128π²/3; `8Δ⁺G≈−6.26` | 100.53, 236.87, 421.10; `−6/(2sin½)=−6.257`; lines 1099, 449, 1077 | holds |
| 1.4 Ammann–Humbert normalization | n=3 | `Γ=G/(4(n−1)\|S^(n−1)\|)`, leading `r^(−1)/(32π)` | AmmannHumbert2005 lines 52–55, 120: `L_gΓ=δ_P`, `G=4(n−1)ω_(n−1)Γ` | agree |
| 4.2 cutoff-bubble bounds | weight r² (k=2) | ε⁴ (n≥7), ε⁴log(1/ε) (n=6), ε^(n−2) (n≤5) | integrand ~s^(5−n); LeeParker1987 lines 603–606 | agree |
| 4.3 Green expansions | n=3,4,5; n=6 | `r^(2−n)+A+O″(r)`; log term at n=6 | Lemma 6.4(a), (b), lines 1131–1134 | agree |
| 4.4 LCF poles | inversion z=x/\|x\|² | `(1+Aρ^(2−n)+O(ρ^(1−n)))^(4/(n−2))δ` | `ρ⁴(1+Aρ^(2−n)+…)^(4/(n−2))·ρ^(−4)δ_z` | holds; R06 |
| 6.2 glued test function | T³ and T² punctured; unit S³ | π₁: ℤ³ versus free of rank 2; A=0, identity | Proposition 7.1, Theorem 7.2 and p. 85 (lines 1302, 1352, 1972–1974) support it | holds; R05, R06 |
| 7.1 Theorem C, n=3–5 | round RP³; S²×S¹ of length 1 | Q(1)=27.61 and 10.81, both <43.82 | `6(π²)^(2/3)=27.607`; `2(4π)^(2/3)=10.810`; lines 142–144 | agree |
| 8.1 developing map | Hopf `(ℝⁿ∖{0})/(x↦2x)`; flat Tⁿ | image Sⁿ minus two points, deck group ℤ; Sⁿ minus one point | x↦2x fixes 0 and ∞; Theorem 10.4, lines 1813–1825 | holds; R05, R06 |
| 9.3 Obata, Lichnerowicz | unit S², S³; RP²; ℝ with sin | λ=2=nk, 3=nk; λ₁=6; n=1 excluded | `Hess x_i=−x_i g`; even harmonics give l(l+1)=6; lines 492, 523 | agree |
| 10.1 model computations | S³→RP³, m=2 | `Q(π*u)=m^(2/n)Q(u)`; 43.82=2^(2/3)·27.61; factor m gives 55.21 | `m^(1−2/p)=m^(2/n)`; 1.5874·27.607=43.823; 2·27.607=55.21 | holds |
| 10.2 product cylinder | n=3, L=4π | coefficients 1/4 and 3/4; u₀⁴=1/3; period 2π; `(2π/L)²=1/4<1` | `(p−2)·Scal/a_n=n−2`; linearization coefficient `−(n−2)²/4+(n+2)(n−2)/4=n−2` | holds; R06 |
| `sphereYamabeConstant_mul_le` | n=3 bubble; Gaussian; u=0 | 12π²=118.44 on both sides; 65.30≥43.82; 0≤0 | `a_3·3π²/2=12π²`; `43.82·(2π²)^(1/3)=118.44`; `8·5.907/0.7236=65.30` | sound |
| `exists_ae_eq_mul_bubble_of_mul_norm_sq_eq` | n=3; two distant bubbles | hexp forces p⋆=6≠∞; −3U_(1,0) gives equality | two-bubble quotient `2^(2/3)·43.82=69.57>43.82`, so excluded | sound |
| `isLocallyConformallyFlat_of_weylTensor_eq_zero` | flat T⁴; S²×S²; n=3 | W=0, LCF; W≠0, hypothesis fails; n=3 excluded | Heisenberg: W=0, C≠0, not LCF, so n≥4 is needed | sound; R03 |
| `isLocallyConformallyFlat_of_cottonTensor_eq_zero` | S²×ℝ; Heisenberg | P parallel, C=0, LCF; C=1, hypothesis fails | S²×ℝ is conformal to ℝ³∖{0} | sound; R03, R06 |
| `exists_yamabeQuotient_lt` | unit S³, u=1; S²×S¹ of length 2π | 43.82<43.82+ε; 36.81 | `2(8π²)^(2/3)=36.809`; Lemma 3.4, line 566 | sound |
| `exists_isMinOn_yamabeQuotient_of_lt` | closed hyperbolic 3-manifold; unit S³ | constant minimizes, Y=−6V^(2/3); hypothesis fails | Theorem 4.5, line 746 | sound |
| `…_of_weylTensor_ne_zero` (Theorem B) | S²×S⁴; round S⁶ | `W(X,Y,Y,X)=−3/10≠0`; W=0, hypothesis fails | Scal=14, P=−g/10 and 2g/5; Y(S⁶)=96.30; line 133 | sound |
| `…_of_not_conformal` (Theorem C) | RP³; flat T⁶; unit S³ | 27.61<43.82; Y=0<96.30; excluded by `hconf` | W≡0 with n≥6 is LCF by Y0.5; line 142 | sound |
| `exists_isMinOn_yamabeQuotient` | unit S³; T³ | u=1 attains 43.82; u=1 attains 0 | Y≤0 by A; n≥6, W≢0 by B; otherwise C; sphere by Theorem 3.2 | sound |
| `exists_rescale_scalarCurvature_eq_const` | unit S³; S³⊔hyperbolic | f=1, c=6; no single c | second case excluded by `ConnectedSpace`; line 1957 | sound |
| `eq_of_scalarCurvature_rescale_eq_of_nonpos` | c₁<0; c₁=0; unit S³ | `u_max^(p−2)≤c₁/c₂≤u_min^(p−2)`; harmonic, hence constant | S³ Möbius family shows c₁≤0 is needed | sound |
| `exists_forall_eq_of_ricciTensor_eq_smul` | S²×S², κ=1; unit S³ | homotheties only; nonconstant `U_(λ,b)` excluded by `hconf` | κ≤0 follows from Y9.2, so hκ is not restrictive | sound; R03 |
| `forall_le_yamabeQuotient_iff` | unit S³; RP³ | both sides true; 27.61<43.82 and not conformal, both false | Theorems B, C and 3.2 | sound |
| `nonempty_riemannianIsometry_sphere_of_hessian_eq` | unit S², f=x₁; ℝ with f=sin; f≡c≠0 | isometric; excluded by n≥2; Hess=0≠−cg | `⟪·,·⟫_ℝ` elaborates to the Riemannian-bundle fibre instance | sound |
| `nonempty_riemannianIsometry_sphere_of_laplaceBeltrami_eq` | unit S³; RP²; circle of length 4π | Ric=2g, λ=3; λ₁=6≠2; excluded by n≥2 | without the order-1 and order-2 binders, instance synthesis times out | sound |
| `exists_diffeomorph_of_conformalLaplacian_eq` | u≡1 on S³; c≤0 | c=6, Φ=id, a=1; `∫u·Lu>0` rules out c≤0 | Proposition 3.1, Theorem 3.2, lines 492, 523 | sound |
| R01: Y1.1 against PseudodifferentialOperators 5.2 | trivial real line over a closed M | Y1.1: equivalent norms, smooth density | 5.2, lines 1015–1016: equivalent complete norms, dense smooth sections | two owners |
| R02: Y2.2 against Isoperimetry I2, I5 | Φ(s)=s² | Y2.2: `‖u*‖_q=‖u‖_q`, `‖∇u*‖₂≤‖∇u‖₂` | Isoperimetry lines 160–163, 318–319 | two owners |
| R07: scalar law | φ≡c | Y0.2 cites Tau Ceti; lines 54–55 cite PositiveMass 0.4 | pinned at `ConformalLaplacian.lean` line 200 | two owners named |
| R08: Lemma 4.3 | Y=0 | left-continuity only for Y>0 | λ(M)≥0 case, lines 756–758; Y_q=0 for every q | narrowed |
| R05: layer order | Layers 6, 8 | Layer 6 needs Y8.1; Layer 8 needs Layer 6 | lines 914, 923, 1005, 1047 | coarse cycle |

- Source locators: 38 checked in LeeParker1987 (AMS open archive; printed page N is the text's page N−36), at pp. 38–40, 43, 45, 47–55, 58–59, 63–65, 69–70, 79, 81–82 and 85. Also AmmannHumbert2005 (arXiv v3), lines 52–55 and 115–120. All agree except the gaps in R06 and R08.
- Library declarations opened at the pins (Tau Ceti 2fd255d), 25. In `Analysis/PDE/Yamabe/`: `Quotient.lean` 97; `SphereConstant.lean` 41; `Bubble/Basic.lean` 84, 116, 132; `ConformalLaplacian.lean` 92, 200; `Bubble/Cutoff.lean` 377. `Curvature/ConformallyFlat.lean` 100, 171, 187, 236; `VectorBundle/Riemannian/Conformal.lean` 87; `Curvature/Scalar.lean` 212, 227. In `Riemannian/`: `Isometry/Basic.lean` 44; `Laplacian.lean` 135, 238; `Lichnerowicz.lean` 82; `Sphere/Basic.lean` 77; `Sphere/Radius.lean` 63; `WithMetric.lean` 68. `Sobolev/D1p0/Basic.lean` 117, 246.
- Cross-roadmap citations resolved, 30. PositiveMass 0.2, 0.4, 3.0, 3.1, 3.2, 8.1, 8.3, 8.4 (on main; 8.4 renamed at #2247). RiemannianGeometry R1–R4, R1.1 item 3, R7.0 (main), and R5c with items 1–2 (#2222, named in the description). DifferentialGeometry 2, 4.3, 12.2–12.5; PDE Layers 1, 3–5 and C15; K5a; GeometricMeasureTheory G2–G3; AlgebraicTopology Layer 1; B1.4; C1; SpinGeometry G3–G5, G4.2; UniversalCovers Stages 1–4.
- Gate: FAIL with residue=1 and statement-hygiene=3 (R03, R04); every other check is 0. The dependency check gives `depcheck: 206 roadmaps, 1899 edges, 0 problem(s)`, with no UPWARD or CYCLE line.
- Elaboration: `lake env lean TauCetiRoadmap/Yamabe/Suggested.lean` gives 16 `sorry` warnings and nothing else. The `#check @` types of all 16 declarations were compared with the README: no binder is lost. The R03 replacement elaborates with 16 `sorry` warnings. `first | rfl | simp | infer_instance | trivial` closes none of the 16.
- Previous review (69162f8): repaired are R01–R03 (five headlines, line 53, lines 1101–1104), R04 (`import Mathlib`), R05–R06, R07 (lines 143–232), R08, R09 (lines 506–510) and R11. R10 is partly repaired (R06); the anchor kept for R11 is R04.
- Overlap check: read PositiveMass (main, #2247), RiemannianGeometry (main, #2222; #2224–#2226 for their Y9 links), RicciFlow (main, nothing shared). Owners: scalar law, Tau Ceti (R07); first-eigenfunction metric, PositiveMass 3.0; principal eigenfunction of Δ⁺+q, R5c; Lichnerowicz equality, R7.0; Obata and `m = 2A`, Yamabe; mass theorems, PositiveMass. Also read PseudodifferentialOperators and Isoperimetry (R01, R02).
- Pull-request text: the title and description match the head. The Y-ids and item numbers are unchanged from main, the 11 removed declarations are replaced by the 16 headlines, and the suppliers are main's plus R5c, which the description names. No sentence is contradicted.

## Not verifiable

- Eisenhart 1926, §28 (the README marks it uncertified): the sources service found no legal copy.
- Obata 1962 (J. Math. Soc. Japan) and Obata 1971, Schoen 1984, Aubin 1976a (J. Differential Geom.): the Project Euclid landing pages gave the service no PDF.
- Aubin 1976b, Talenti 1976, Schoen–Yau 1988: publisher copies only; not fetched.
- Cecchini–Zeidler, Theorem B, p. 3 (8.3): open on arXiv, outside the seeded sample, not fetched; PositiveMass 8.3 owns it.

## Source issues

- **Error** in AmmannHumbert2005 at the local formula for the Dirac operator used in Section 3, printed in Geom. Funct. Anal. 15 (2005) 567–576: the source says a term was missing there, so the last proof lacked terms; it should include the term and the added estimates; affects the proof; corrected in arXiv:math/0304043v3 (its remark on the printed version).
