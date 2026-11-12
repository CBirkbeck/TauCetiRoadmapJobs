# Review of Yamabe (pull request #2248 at 69162f8)

**Verdict:** needs changes

## R01 (P2) — Statable headline theorems absent from Suggested.lean

**Location:** `TauCetiRoadmap/Yamabe/Suggested.lean` lines 10–16 and 71–77 state only the Euclidean sharp inequality. README Y9.1: "Conclude that every closed smooth n-manifold, n≥3, has a positive smooth unit-volume conformal factor attaining Y".

**Claim:** Five headlines can be stated on pinned carriers, but the file neither states them nor names them as not statable: Yamabe's theorem (Y9.1), Aubin's bound Y≤Y(Sⁿ) (Y3.1), Theorem A (Y3.3), Aubin's strict inequality (Y5), and the Weyl–Schouten converse for n≥4 (Y0.5).

**Witness:** The statements below elaborate at the pins with only `sorry` warnings. They use `Bundle.ContMDiffRiemannianMetric.rescale`, `.scalarCurvature`, `.IsLocallyConformallyFlat`, `TauCeti.Yamabe.yamabeQuotient`, `TauCeti.Yamabe.sphereYamabeConstant` and `CovariantDerivative.weylTensor`.

**Repair:** Add the following to `Suggested.lean`, after `open Bundle Module` and `open scoped ContDiff Manifold`, each statement with a docstring and its locator from R10 (this block elaborates as written). In the module docstring, name each remaining headline (Y2.2 equality classification, Theorem C of Y7–Y8, Y9.2 uniqueness, Obata in Y9.3) with the carrier it lacks, or state it the same way.

```lean
variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  {H : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  {M : Type*} [TopologicalSpace M] [ChartedSpace H M]

theorem exists_rescale_scalarCurvature_eq_const [T2Space M] [SecondCountableTopology M]
    [CompactSpace M] [ConnectedSpace M] [I.Boundaryless] [IsManifold I ∞ M]
    (hn : 3 ≤ finrank ℝ E) (g : ContMDiffRiemannianMetric I ∞ E (fun x : M ↦ TangentSpace I x)) :
    ∃ (f : M → ℝ) (hf : ContMDiff I 𝓘(ℝ) ∞ f) (hf_pos : ∀ x, 0 < f x) (c : ℝ),
      ∀ x, (g.rescale f hf hf_pos).scalarCurvature x = c := by
  sorry

theorem exists_yamabeQuotient_lt [T2Space M] [SecondCountableTopology M]
    [CompactSpace M] [ConnectedSpace M] [I.Boundaryless] [IsManifold I ∞ M]
    [MeasurableSpace M] [BorelSpace M]
    [RiemannianBundle (fun x : M ↦ TangentSpace I x)]
    [IsContMDiffRiemannianBundle I ∞ E (fun x : M ↦ TangentSpace I x)]
    [IsContinuousRiemannianBundle E (fun x : M ↦ TangentSpace I x)]
    (hn : 3 ≤ finrank ℝ E) {ε : ℝ} (hε : 0 < ε) :
    ∃ u : M → ℝ, ContMDiff I 𝓘(ℝ) ∞ u ∧ (∀ x, 0 < u x) ∧
      TauCeti.Yamabe.yamabeQuotient I u < TauCeti.Yamabe.sphereYamabeConstant (finrank ℝ E) + ε := by
  sorry

theorem isLocallyConformallyFlat_of_weylTensor_eq_zero [T2Space M] [IsManifold I ∞ M]
    (hn : 4 ≤ finrank ℝ E) (g : ContMDiffRiemannianMetric I ∞ E (fun x : M ↦ TangentSpace I x))
    (hW : ∀ x, (letI : RiemannianBundle (fun x : M ↦ TangentSpace I x) := ⟨g.toRiemannianMetric⟩;
      (CovariantDerivative.leviCivitaConnection I M).weylTensor x) = 0) :
    g.IsLocallyConformallyFlat := by
  sorry

theorem exists_yamabeQuotient_lt_sphereYamabeConstant_of_weylTensor_ne_zero [T2Space M]
    [SecondCountableTopology M] [CompactSpace M] [ConnectedSpace M] [I.Boundaryless]
    [IsManifold I ∞ M] [MeasurableSpace M] [BorelSpace M]
    [RiemannianBundle (fun x : M ↦ TangentSpace I x)]
    [IsContMDiffRiemannianBundle I ∞ E (fun x : M ↦ TangentSpace I x)]
    [IsContinuousRiemannianBundle E (fun x : M ↦ TangentSpace I x)]
    (hn : 6 ≤ finrank ℝ E)
    (hW : ∃ x, (CovariantDerivative.leviCivitaConnection I M).weylTensor x ≠ 0) :
    ∃ u : M → ℝ, ContMDiff I 𝓘(ℝ) ∞ u ∧ (∀ x, 0 < u x) ∧
      TauCeti.Yamabe.yamabeQuotient I u < TauCeti.Yamabe.sphereYamabeConstant (finrank ℝ E) := by
  sorry

theorem exists_isMinOn_yamabeQuotient_of_lt [T2Space M]
    [SecondCountableTopology M] [CompactSpace M] [ConnectedSpace M] [I.Boundaryless]
    [IsManifold I ∞ M] [MeasurableSpace M] [BorelSpace M]
    [RiemannianBundle (fun x : M ↦ TangentSpace I x)]
    [IsContMDiffRiemannianBundle I ∞ E (fun x : M ↦ TangentSpace I x)]
    [IsContinuousRiemannianBundle E (fun x : M ↦ TangentSpace I x)]
    (hn : 3 ≤ finrank ℝ E)
    (h : ∃ v : M → ℝ, ContMDiff I 𝓘(ℝ) ∞ v ∧ (∀ x, 0 < v x) ∧
      TauCeti.Yamabe.yamabeQuotient I v < TauCeti.Yamabe.sphereYamabeConstant (finrank ℝ E)) :
    ∃ u : M → ℝ, ContMDiff I 𝓘(ℝ) ∞ u ∧ (∀ x, 0 < u x) ∧
      IsMinOn (TauCeti.Yamabe.yamabeQuotient I) {v | ContMDiff I 𝓘(ℝ) ∞ v ∧ ∀ x, 0 < v x} u := by
  sorry
```

## R02 (P2) — Two owners shared with PositiveMass, and a supply direction that does not exist

**Location:** README lines 52–53: "PositiveMass consumes Y0's conformal identities and Y2.1's Euclidean inequality". Y0.2, line 69: "`Scal_ĝ=u^(-(n+2)/(n−2)) L_g u`". Y3.1, lines 181–182: "Construct a metric of scalar curvature of the corresponding sign from the positive first eigenfunction φ".

**Claim:** PositiveMass, on main and a supplier of this roadmap, owns the scalar law (0.4) and the positive-scalar metric built from the first eigenfunction (3.0). It consumes nothing from Yamabe. Each of these objects therefore has two owners, and the reverse supply the README describes does not exist.

**Witness:** `TauCetiRoadmap/PositiveMass/README.md` lines 32–40 say these facts "are owned here so that supply runs in one direction". Its 3.0 (lines 674–676) gives `φ^(4/(k−2)) g` scalar curvature `λ₁φ^(−4/(k−2))`, and its Sobolev input is Mathlib's non-sharp GNS inequality (lines 114–119).

**Repair:**
- Lines 52–54: replace "Y0–Y3 supply the variational foundation; … weighted corrections." with "PositiveMass is a supplier of this roadmap and consumes nothing from it."
- Y0.2: replace "Prove `Scal_ĝ=…` and the operator identity `L_ĝ(v)=…`." with "Consume Tau Ceti's `TauCeti.Yamabe.scalarCurvature_rescale_eq_rpow_mul_conformalLaplacian` and `TauCeti.Yamabe.conformalLaplacian_rescale` (`TauCeti/Analysis/PDE/Yamabe/ConformalLaplacian.lean`) for `Scal_ĝ=u^(-(n+2)/(n−2)) L_g u` and `L_ĝ(v)=u^(-(n+2)/(n−2)) L_g(uv)`."
- Y3.1: replace the sentence with "For λ₁(L_g)>0 consume PositiveMass 3.0's metric `φ^(4/(n−2))g` of scalar curvature `λ₁φ^(−4/(n−2))`. For λ₁≤0 the same Tau Ceti law gives this metric scalar curvature of the sign of λ₁."

## R03 (P2) — Lichnerowicz bound and its equality case owned twice; R7.4 is the wrong section

**Location:** README lines 330–332: "for Ric≥(n−1)kg with k>0 prove λ₁(Δ⁺)≥nk via R7.4's scalar Bochner identity, and identify equality with Obata's Hessian equation and the round sphere."

**Claim:** The bound is a pinned Tau Ceti theorem. Its equality case, Hess f=−kfg, is owned by RiemannianGeometry R7.0 on main. RiemannianGeometry R7.4 is the Weitzenböck identity on forms, not the scalar Bochner identity.

**Witness:** `TauCeti.Manifold.finrank_mul_le_of_laplaceBeltrami_eq_neg_mul` (`TauCeti/Geometry/Manifold/Riemannian/Lichnerowicz.lean` line 82). RiemannianGeometry R7.0 (README lines 3531–3549) proves "the equality case … Hess f=−kfg". R7.4 (line 3630) starts "On K5a's real Gram exterior-form bundles".

**Repair:** Replace the sentence with: "Consume the Lichnerowicz bound `TauCeti.Manifold.finrank_mul_le_of_laplaceBeltrami_eq_neg_mul` and RiemannianGeometry R7.0's equality case (an eigenfunction with λ=nk satisfies Hess f=−kfg). With Obata's theorem above, prove that λ₁(Δ⁺)=nk forces (M,g) to be isometric to the round sphere of radius 1/√k." Name R7.0 and the Tau Ceti declaration in the supplier table.

## R04 (P3) — Gate failure: imports

**Location:** `TauCetiRoadmap/Yamabe/Suggested.lean` lines 1–8: `import Mathlib.Analysis.InnerProductSpace.Laplacian` … `import Mathlib.Tactic`, `import TauCeti.Geometry.Manifold.VectorBundle.Riemannian.Conformal`.

**Claim:** The file has seven Mathlib submodule imports and no `import Mathlib`. The one Tau Ceti module it imports is not used by any declaration.

**Witness:** Gate at 69162f8: `imports=1 mathlib-subimports=7 no-import-mathlib=1 … FAIL`.

**Repair:** Replace lines 1–8 with the imports the statements of R01 and R05 use (this set was elaborated in a scratch copy):

```lean
import Mathlib
import TauCeti.Analysis.PDE.Yamabe.ConformalLaplacian
import TauCeti.Analysis.PDE.Yamabe.Quotient
import TauCeti.Analysis.PDE.Yamabe.SphereConstant
import TauCeti.Geometry.Manifold.VectorBundle.CovariantDerivative.Curvature.ConformallyFlat
```

## R05 (P3) — Suggested.lean restates pinned Tau Ceti declarations and pads

**Location:** `TauCetiRoadmap/Yamabe/Suggested.lean` lines 25–69: `Euclidean`, `criticalExponent`, `conformalCoefficient`, `conformalCoefficient_pos`, `bubble`, `bubble_pos`, `bubble_conformalLaplacian`, `roundSphereVolume`, `sphereYamabeConstant`, `exists_smoothCompact_eq_one`.

**Claim:** The definitions duplicate `TauCeti.Yamabe.criticalExponent`, `.conformalCoefficient`, `.bubble`, `.sphereYamabeConstant` and `TauCeti.roundSphereVolume`. Each of the four theorems is either a pinned result or a boundary fact proved in place.

**Witness:** In a scratch copy, `sphereYamabeConstant n = TauCeti.Yamabe.sphereYamabeConstant n` is closed by `rfl`. `conformalCoefficient_pos` and `bubble_pos` each close by one `simpa using` of a Tau Ceti lemma. `bubble_conformalLaplacian` follows from `TauCeti.Yamabe.conformalCoefficient_mul_neg_laplacian_bubble`.

**Repair:** Delete lines 25–69 from `Suggested.lean`; the README keeps these facts as cited Tau Ceti declarations. Restate `sharpSobolev_smoothCompact` on the pinned constants (this statement elaborates):

```lean
theorem sphereYamabeConstant_mul_le {F : Type*} [NormedAddCommGroup F] [InnerProductSpace ℝ F]
    [FiniteDimensional ℝ F] [MeasurableSpace F] [BorelSpace F]
    (hn : 3 ≤ finrank ℝ F) (u : F → ℝ) (hu : ContDiff ℝ ∞ u) (hc : HasCompactSupport u) :
    TauCeti.Yamabe.sphereYamabeConstant (finrank ℝ F) *
        (∫ x, |u x| ^ TauCeti.Yamabe.criticalExponent (finrank ℝ F)) ^
          (2 / TauCeti.Yamabe.criticalExponent (finrank ℝ F)) ≤
      TauCeti.Yamabe.conformalCoefficient (finrank ℝ F) * ∫ x, ‖fderiv ℝ u x‖ ^ 2 := by
  sorry
```

## R06 (P3) — Suggested.lean form

**Location:** `TauCetiRoadmap/Yamabe/Suggested.lean` lines 10–23: "**This file is not the roadmap and is not exhaustive.** These are suggested forms …", then `namespace Yamabe`.

**Claim:** The namespace is not `TauCetiRoadmap.Yamabe`. The module docstring does not have the form "<title>: target signatures" and names no headline that is not statable. The definitions at lines 25, 27, 29 and 60 have no docstrings.

**Witness:** The elaborated name is `Yamabe.sharpSobolev_smoothCompact`, not `TauCetiRoadmap.Yamabe.…`.

**Repair:** Use `namespace TauCetiRoadmap.Yamabe` … `end TauCetiRoadmap.Yamabe`. Make the module docstring: "The Yamabe problem and conformal scalar curvature: target signatures. The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline theorems against the pinned Mathlib and Tau Ceti. Not statable at the pins: <each headline of R01's list that is not stated, with the missing carrier>." Give every declaration a docstring with its locator.

## R07 (P3) — The README plans targets that the pinned Tau Ceti already proves

**Location:** README Y0.2–Y0.5 (lines 68–110), Y2.1 (lines 152–155), Y2.3 (lines 166–170). For example: "In a local orthonormal frame define `(div W)(X,Y,Z)=…` and prove `div W=(n−3)C`."

**Claim:** These results exist at the pinned Tau Ceti. The README plans them as targets, and no supplier contract names them.

**Witness:** `CovariantDerivative.IsMetricCompatible.sum_derivWeylTensor_self_eq_mul_cottonTensor` (`TauCeti/Geometry/Manifold/VectorBundle/CovariantDerivative/Curvature/Weyl/Divergence.lean` line 184) proves `Σᵢ(∇_(eᵢ)W)(eᵢ,u,v,w)=(n−3)C(u,v,w)`.

**Repair:** Add a "From Tau Ceti" supplier list that names these declarations with their files, and cut them from their items, keeping only what the pin lacks:
- `TauCeti/Analysis/PDE/Yamabe/`: `conformalLaplacian`, `conformalLaplacian_rescale`, `scalarCurvature_rescale_eq_rpow_mul_conformalLaplacian`, `integral_mul_conformalLaplacian_self`, `yamabeQuotient`, `forall_hasDerivAt_yamabeQuotient_add_smul_iff_exists_conformalLaplacian_eq`, `conformalCoefficient_mul_neg_laplacian_bubble`, `conformalCoefficient_mul_integral_norm_fderiv_bubble_sq_eq_sphereYamabeConstant`, and `Bubble/Cutoff.lean`, `Bubble/Moments.lean`.
- `TauCeti.WithMetric.riemannianTotalVolume_rescale_rpow`, `Bundle.ContMDiffRiemannianMetric.conformalClass`, `TauCeti.roundSphereVolume_eq_two_mul_pi_rpow_div_Gamma`.
- `Curvature/Weyl/{Basic,Divergence,Integrability}.lean`: `weylTensor`, `conformalFlatteningDeriv_sub_swap_eq_inner_curvatureTensor`. `Curvature/ConformallyFlat.lean`: `IsLocallyConformallyFlat` and its `weylTensor_eq_zero` and `cottonTensor_eq_zero`. `Curvature/Cotton.lean`: `cottonTensor`.
- `TauCeti.D1p0` and `TauCeti.D1p0.sobolevEmbeddingL` (`TauCeti/Analysis/Sobolev/D1p0/`), with its dilation and translation files.

## R08 (P3) — Supplier ids that resolve nowhere

**Location:** README line 48 "[PositiveMass P0–P8]"; lines 57 and 248 "P8"; line 261 "Consume P3's orientation-double-cover corollary and P0's covering mass comparison"; line 49 "[AlgebraicTopology Stage 1]"; lines 107–108 "use R1.3's local Euclidean-isometry theorem"; line 44 "[PDE Lanes A,C–E]".

**Claim:** None of these ids exists in the cited roadmap: PositiveMass numbers Layers 0–8 and sections k.n, with no P-ids; AlgebraicTopology's van Kampen is its Layer 1; "flat implies locally Euclidean" is RiemannianGeometry R1.1 item 3, while R1.3 covers metric changes, Lie groups and submersions; PDE has Layers, not Lanes.

**Witness:** `TauCetiRoadmap/AlgebraicTopology/README.md` line 895 is `## Layer 1: van Kampen through the fundamental groupoid`. `TauCetiRoadmap/RiemannianGeometry/README.md` line 914 sits inside `### 1.1 Curvature identities`. `TauCetiRoadmap/PositiveMass/README.md` has `## Layer 8` and `### 8.1`–`### 8.4`.

**Repair:**
- "PositiveMass P0–P8" → "PositiveMass 0.4, 3.2, 8.1, 8.3, 8.4".
- "P8" → "PositiveMass 8.1–8.4".
- "P3's orientation-double-cover corollary and P0's covering mass comparison" → "PositiveMass 3.2's orientation double cover and 0.4's lifts of ends to finite covers".
- "AlgebraicTopology Stage 1" → "AlgebraicTopology Layer 1".
- "R1.3's local Euclidean-isometry theorem" → "RiemannianGeometry R1.1 item 3 (flat implies locally Euclidean)".
- "PDE Lanes A,C–E" → "PDE Layers 1, 3, 4, 5 (A1–A7, C12–C15, D16–D19, E20–E26)".

## R09 (P3) — Y1.2 re-plans RiemannianGeometry R5c's closed-manifold realization

**Location:** README lines 128–132: "Consume K5a's closed-manifold Laplace-type estimates, … Prove that L_g and a sufficiently positive shift satisfy those exact operator/form hypotheses, and identify its native coefficient, domain and quadratic form."

**Claim:** R5c, which Y1.2 now cites, already builds from K5a the closed-manifold realization of Δ⁺+q: its independence of the shift, its form and its eigenbasis. The realization of L_g is a_n times that operator with q=Scal_g/a_n.

**Witness:** RiemannianGeometry R5c, at the head of #2222: "For c>k₀ the operator L+c is a formally self-adjoint nonnegative Laplace-type system on the compact boundaryless M, and K5a supplies … Define L_D, for D=M, as that realization minus c."

**Repair:** Replace the two sentences with: "Take the self-adjoint realization of L_g as a_n times RiemannianGeometry R5c's closed-case realization of `Δ⁺+Scal_g/a_n`, with K5a's H² domain, the form `∫(a_n|du|²+Scal_g u²)dV_g` on H¹ and the same eigenfunctions, and identify this form with the numerator of Q_g."

## R10 (P3) — No target carries a locator

**Location:** README lines 358–370: "Lee–Parker, *The Yamabe Problem*, supplies the conformal, variational, normal-coordinate and test-function development. Aubin and Schoen's primary papers give the two strict-inequality lanes."

**Claim:** No target in Y0–Y10 has a theorem or page locator, and the Sources section gives no journal, year or identifier for any work.

**Witness:** Y3.1's "universal bound Y≤Y(Sⁿ)" has no locator. It is LeeParker1987 Lemma 3.4, p. 50 (LeeParker1987 line 566).

**Repair:** Replace `## Sources` with `## References`, giving full entries. For Lee–Parker: *The Yamabe problem*, Bull. Amer. Math. Soc. 17 (1987) 37–91, doi:10.1090/S0273-0979-1987-15514-5. Then put a locator at each claim. These were checked against the text:
- Y0 conventions and law: (1.1), p. 38.
- Y2.4: Theorem 2.3, p. 45.
- Y9.3, sphere case: Proposition 3.1, p. 48.
- Y2.1–Y2.2: Theorem 3.3, p. 50.
- Y3.1: Lemma 3.4, p. 50.
- Y3.2: Proposition 4.2, p. 53.
- Y3.3: Proposition 4.4 and Theorem 4.5, pp. 54–55.
- Y4.1: Theorem 5.1, p. 58.
- Y5: Theorem B, p. 39, with its proof, pp. 58–59.
- Y4.3–Y4.4: Lemma 6.4, p. 64.
- Y6: Theorem 6.5, p. 65, and Lemma 9.7, p. 79.
- Y7–Y8: Theorem C, p. 40.
- Y9.1: The Yamabe Theorem, p. 85.

Give Aubin, Schoen, Schoen–Yau 1988, Obata, Cecchini–Zeidler and Ammann–Humbert full entries with theorem locators as well.

## R11 (P3) — The README is not in TauCetiRoadmap form

**Location:** README line 1 "# The Yamabe problem and conformal scalar curvature"; line 10 "## Carriers, conventions and ownership"; line 41, a supplier table; line 60 "## Y0. Conformal tensors and the conformal Laplacian".

**Claim:** The README lacks the required structure: no `# Roadmap:` title or **Summary.**; no Scope and ownership, Conventions, Exact supplier contracts or How to read the build sections; layers are numbered items with no `### k.n` subsections, API bullets, **Checks.**, *Needs:* lines, Examples or Dependencies; and no Downstream consumers section.

**Witness:** The README contains 0 occurrences of `Checks` and 0 of `*Needs:*`. The conformal Laplacian, Y(M,[g]), Schouten, Weyl and Cotton, local conformal flatness, the bubbles and D¹,² are all defined without a Check.

**Repair:** Restructure the README in the upstream shape:
- Keep the ids Y0–Y10 and their item numbers, or give an old → new table. RiemannianGeometry R7.0 (anchor `#y9-existence-uniqueness-and-rigidity`), GeometricCurrents (Y7), DifferentialGeometry and YangMillsConnectionsAndCaloricGauge (Y2 item 1) cite them; list all four under Downstream consumers.
- Give every definition three Checks. For example:
  - L_g on the unit S³ is 8Δ⁺+6, with λ₁=6 and φ=1.
  - On the unit Sⁿ, P=g/2 and W=0, and replacing a_n by (n−2)/(4(n−1)) gives Scal_ĝ≠n(n−1).
  - Y(S³)=6(2π²)^(2/3)≈43.8.
  - For the n=3 bubble, a_3Δ⁺U(0)=24√2=6U(0)^5.

## Verified sound

| Statement | Instances | This roadmap's side | Computed or source side | Result |
| --- | --- | --- | --- | --- |
| Y1.2 `λ₁(L_g)=a_n μ₁(Δ⁺+Scal_g/a_n)` (the change) | unit S³; flat T³ | L=8Δ⁺+6: λ₁=6; on T³ λ₁=0 | μ₁(Δ⁺+3/4)=3/4, ×8=6; μ₁(Δ⁺)=0 | holds |
| R5c item 1 at #2222 as cited | closed connected M, smooth q of any sign | q=Scal_g/a_n, smooth, sign-indefinite | k₀ shift admits any smooth q; μ₁ simple, φ₁>0 smooth, least Rayleigh quotient | citation resolves |
| Y0 a_n, p_n | n=3, 4 | a_3=8, p_3=6; a_4=6, p_4=4 | LeeParker1987 line 75 (p. 38): same a, p | agree |
| Y0.2 conformal law | u≡c on unit Sⁿ | c^(−(n+2)/(n−2))·n(n−1)c = n(n−1)c^(−4/(n−2)) | scaling law for c^(4/(n−2))g gives the same | holds; pinned (R02, R07) |
| Y0.4 sphere area | n=1, 2 | 2π/Γ(1)=2π; 2π^(3/2)/Γ(3/2)=4π | circumference 2π, area 4π | holds; pinned |
| Y0.5 P, P⊙g, W | unit Sⁿ, Rm=⟨Y,Z⟩⟨X,W⟩−⟨X,Z⟩⟨Y,W⟩ | P=g/2, so P⊙g=Rm | W=0, as for a conformally flat metric | holds |
| Y0.5 `div W=(n−3)C` | contracted Bianchi, div P=dJ | ∇ⁱR_ibcd=∇_dRic_bc−∇_cRic_bd | difference (n−3)(∇_dP_bc−∇_cP_bd)=(n−3)C_bcd | holds; pinned (R07) |
| Y0.5 jet obstruction | ∇ξ=P+ξ⊗ξ−\|ξ\|²g/2 | antisymmetrized ∇T=C(Z,Y,X)−(P⊙g)(X,Y,Z,ξ) | adding Rm gives C(Z,Y,X)+W(X,Y,Z,ξ♯); then P̂=0 | holds |
| Y1.4 Green normalization | ℝⁿ, r^(2−n) | `L_g G_p=a_n(n−2)\|S^(n−1)\|δ_p` | a_nΔ⁺r^(2−n)=a_n(n−2)\|S^(n−1)\|δ; n=3: 32πδ | holds |
| Y2.1 Y(Sⁿ) | n=3 | Q(1) on unit S³ = 6(2π²)^(2/3)≈43.8 | LeeParker1987 line 555 (Thm 3.3, p. 50): n(n−1)vol^(2/n) | agree |
| Y2.3 bubble equation | n=3, λ=1, b=0, x=0 | a_3Δ⁺U(0)=8·3√2=24√2 | 6U(0)^5=6·4√2=24√2 | holds; pinned |
| Y2.4 ε-Sobolev | leading coefficient | a_n/Y(Sⁿ)+ε | LeeParker1987 line 377 (Thm 2.3, p. 45): (1+ε)σ_n with σ_n=a/λ(Sⁿ) | equivalent |
| Y3.1 bound and sign metric | Lφ=λ₁φ | Scal=φ^(−(n+2)/(n−2))λ₁φ=λ₁φ^(−4/(n−2)) | LeeParker1987 line 566 (Lemma 3.4, p. 50): λ(M)≤λ(Sⁿ) | holds; owner R02 |
| Y3.3 Theorem A | Y<Y(Sⁿ) | smooth positive unit-Lp minimizer | LeeParker1987 line 746 (Thm 4.5, p. 55) | agree |
| Y4.3/Y6 `m_ADM=2A` | flat pole, ρ=1/r | ĝ=(1+Aρ^(2−n))^(4/(n−2))δ; flux 4(n−1)A\|S^(n−1)\|/(2(n−1)\|S^(n−1)\|)=2A | LeeParker1987 lines 1131, 1725: m_LP=4(n−1)A, which is 2A normalized | holds |
| Y5 n≥7 and n=6 | radial cutoff bubble, g^rr=1 | S-term −c\|W(p)\|²ε⁴; cutoff O(ε^(n−2)); n=6 gives ε⁴log(1/ε) | LeeParker1987 lines 896–897 (p. 58): the same orders as upper bounds | holds |
| Y9.1 disconnected infimum | n=4: Y=(−2,−2), (−1,5), (3,5) | −(4+4)^(1/2)≈−2.83; −1; 3 | simplex optimum t_i∝\|Y_i\|^(n/2): −2·√½·2≈−2.83; −1; 3 | holds |
| Y10 cylinder ODE | S^(n−1)×ℝ, Scal (n−1)(n−2) | `L u=n(n−1)u^(p−1)` gives the stated ODE; u₀^(4/(n−2))=(n−2)/n | linearization v''+(n−2)v=0, period 2π/√(n−2); 2π at n=3 | holds |
| Y9.3 Lichnerowicz | unit S², k=1 | λ₁=2=nk | pinned bound; R7.0 owns equality | R03 |
| Headline: Yamabe theorem (tested) | unit Sⁿ; flat T³ | f=1, c=n(n−1); f=1, c=0 | LeeParker1987 line 1957 (p. 85) | absent, R01 |
| Headline: Aubin bound (tested) | unit S³ | u=1 gives Q=Y(S³)<Y(S³)+ε | LeeParker1987 line 566 | absent, R01 |
| Headline: Theorem B (tested) | round S⁶; round S²×S⁴ | W≡0, so the hypothesis fails; W≠0, so Y<Y(S⁶) | LeeParker1987 line 133 (p. 39) | absent, R01 |
| Headline: Weyl–Schouten n≥4 (tested) | flat T⁴; round S²×S²; n=3 | W=0 and LCF; W≠0; n=3 excluded since W≡0 there | pinned `weylTensor_eq_zero_of_finrank_eq_three` | absent, R01 |
| Headline: sharp Sobolev (stated) | u=0; cutoff bubbles, n=3 | 0=0 (2/p_3=1/3≠0); quotient tends to Y(S³) | pinned `tendsto_cutoff_bubble_sobolev_quotient` | sound; restate on pinned constants, R05 |
| `bubble_conformalLaplacian`, `sphereYamabeConstant` | E=ℝⁿ | a scratch proof from the pinned lemma; `rfl` | `conformalCoefficient_mul_neg_laplacian_bubble`; `TauCeti.Yamabe.sphereYamabeConstant` | padding, R05 |

- Source locators: 15 checked against LeeParker1987 (AMS open archive), at pp. 38, 39, 40, 45, 48, 50 (twice), 53, 54, 55, 58, 64, 65, 79 and 85. The README flags no unverified locator, and the worker's seeded sample found no targets by heading.
- Library declarations opened at the pins (Tau Ceti 2fd255d), 22: `Yamabe/ConformalLaplacian.lean` lines 92, 200, 240, 263; `Yamabe/Bubble/Basic.lean` 84, 116, 132, 368; `Yamabe/SphereConstant.lean` 41; `Yamabe/Quotient.lean` 97; `Yamabe/Bubble/Cutoff.lean` 377; `Euclidean/Volume/Sphere.lean` 376; `Curvature/Weyl/Divergence.lean` 184; `Curvature/Weyl/Integrability.lean` 193; `Curvature/ConformallyFlat.lean` 100, 171, 187; `Riemannian/Lichnerowicz.lean` 82; `Sobolev/D1p0/Basic.lean` 117, 246; Mathlib `Geometry/Euclidean/Volume/Measure.lean` 68.
- Cross-roadmap citations: resolve for RiemannianGeometry R1, R5c (at #2222) and R7.0, DifferentialGeometry 2, 4.3 and 12.2–12.5, ComplexKahlerGeometry K5a (5.1–5.7), GeometricMeasureTheory G2–G3, SmoothBundlesConnections B1.4, CharacteristicClasses C1, SpinGeometry G3–G5 and G4.2, UniversalCovers Stages 1–4; fail for R08's list and R7.4 (R03).
- Gate: FAIL on imports, mathlib-subimports (7) and no-import-mathlib (R04); every other check is 0.
- Dependency check: `depcheck: 206 roadmaps, 1897 edges, 0 problem(s)`, with no UPWARD or CYCLE line. The R5c dependency on #2222 is stated in the description.
- Elaboration of `TauCetiRoadmap/Yamabe/Suggested.lean`: only `sorry` warnings, at lines 48 and 72. The `#check @name` types of all 11 declarations were compared with the README: no binder is lost. All 6 replacement statements of R01 and R05 elaborate in a scratch file with only `sorry` warnings.
- Overlap check: read PositiveMass (main, #2247), RiemannianGeometry (main, #2222, #2224, #2226), MinimalSurfaces (#2226), RicciFlow (main); owners: conformal scalar law Tau Ceti (R02), first-eigenfunction scalar metric PositiveMass 3.0 (R02), first eigenfunction of Δ⁺+q RiemannianGeometry R5c (consumed), Lichnerowicz equality RiemannianGeometry R7.0 (R03), Obata rigidity Yamabe Y9 (R7.0 defers), sharp Sobolev Yamabe Y2.1 (YangMillsConnectionsAndCaloricGauge cites it).
- Pull-request text: the title and description match the diff (Y1 item 2 and the RiemannianGeometry row only; `Suggested.lean` unchanged), and the merge after #2222 is stated.

## Not verifiable

- Aubin 1976 and Schoen 1984: the README gives no bibliographic entry or locator, so there was nothing to check.
- Schoen–Yau 1988, *Conformally flat manifolds, Kleinian groups and scalar curvature* (Invent. Math.): publisher copy is paywalled, and the README gives no locator.
- Cecchini–Zeidler and Ammann–Humbert: the README cites no theorem; Cecchini–Zeidler is owned through PositiveMass 8.3.
- Obata's general Einstein case (Y9.3): the README cites no source; LeeParker1987 Proposition 3.1 covers only the sphere.

## Source issues

- none
