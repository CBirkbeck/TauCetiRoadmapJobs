# Review of ComplexCurveModuli (pull request #2548 at 6d27467)

**Verdict:** needs changes

**Summary.** Changes are needed for one finding: the acceptance test states only part of the uniformization headline. The bordered case, which the module docstring calls not statable, and uniqueness on punctured surfaces both elaborate at the pins, and neither is in `Suggested.lean`. Every finding of the previous review is repaired, and so is its question about numbering, except the ConformalMappingPartII link, which is deferred. There are no small corrections or format notes, and nothing is left for the human reviewers.

## R01 (P2) — The uniformization headline is stated only in part: the bordered case and uniqueness on punctured surfaces both elaborate at the pins but are absent

The third headline in the Summary (lines 28–31) gives existence and uniqueness for surfaces of finite type and for compact bordered surfaces with geodesic boundary. `Suggested.lean` states only existence, for closed and for punctured surfaces. Its docstring (lines 47–49) says the bordered case is not statable "for want of" a second fundamental form of the boundary. As a result, the acceptance test checks neither the bordered theorem nor the punctured uniqueness. §6.2 relies on that uniqueness when it cuts along geodesics ("apply the uniqueness of §0.4", line 1293).

The pin has what both statements need: `TauCeti.Manifold.IsGeodesicCurve` (`TauCeti/Geometry/Manifold/Riemannian/Geodesic/Basic.lean:115`, the Levi-Civita geodesic equation for any model with corners), `HyperbolicMetric` and `rescale` on the half-space model, and Mathlib's `ModelWithCorners.boundary`. A boundary is geodesic exactly when its unit-speed curves are geodesics. With the imports `Mathlib`, `TauCeti.AlgebraicTopology.Cellular.EulerCharacteristic.FiniteCWType`, `TauCeti.Geometry.Manifold.Riemannian.Hyperbolic`, `TauCeti.Geometry.Manifold.Riemannian.Geodesic.Basic` and `TauCeti.Geometry.Manifold.VectorBundle.Riemannian.Conformal`, and with `open Module TauCeti TauCeti.Manifold Bundle`, the following elaborates; the only warning is the `sorry`:

```lean
theorem exists_hyperbolicMetric_isGeodesicCurve_boundary
    {M : Type*} [TopologicalSpace M] [T3Space M] [PreconnectedSpace M] [CompactSpace M]
    [ChartedSpace (EuclideanHalfSpace 2) M] [IsManifold (𝓡∂ 2) ∞ M] [FiniteCWType M]
    (hχ : eulerChar M < 0)
    (g : ContMDiffRiemannianMetric (𝓡∂ 2) ∞ (EuclideanSpace ℝ (Fin 2))
      (fun x : M ↦ TangentSpace (𝓡∂ 2) x)) :
    ∃ (G : HyperbolicMetric (I := 𝓡∂ 2) (M := M)) (f : M → ℝ)
      (hf : ContMDiff (𝓡∂ 2) 𝓘(ℝ) ∞ f) (hf_pos : ∀ x, 0 < f x),
      G.metric = g.rescale f hf hf_pos ∧
      letI : RiemannianBundle (fun x : M ↦ TangentSpace (𝓡∂ 2) x) :=
        ⟨G.metric.toRiemannianMetric⟩
      ∀ γ : ℝ → M, (∀ t, γ t ∈ (𝓡∂ 2).boundary M) → ContMDiff 𝓘(ℝ) (𝓡∂ 2) 2 γ →
        (∀ t, G.metric.inner (γ t) (mfderiv 𝓘(ℝ) (𝓡∂ 2) γ t 1)
          (mfderiv 𝓘(ℝ) (𝓡∂ 2) γ t 1) = 1) →
        IsGeodesicCurve (𝓡∂ 2) γ := by
  sorry
```

The hypothesis χ(M) < 0 is the right one. On the annulus (χ = 0), Gauss–Bonnet with K = −1 and geodesic boundary would give area 0. Uniqueness on `U = M ∖ P` is also statable. Take the binders of `exists_hyperbolicMetric_hasFiniteVolume_metric_eq_rescale_of_eulerChar_lt_card`, two metrics `G₁ G₂ : HyperbolicMetric (I := I) (M := U)`, and hypotheses `G₁.metric = (g.restrictOpenTangentSpace U).rescale f₁ hf₁ hf₁_pos` and the same with `f₂`. The conclusion `G₁ = G₂` elaborates at the pins. The pin's `TauCeti.HyperbolicMetric.eq_of_metric_eq_rescale` (`TauCeti/Geometry/Manifold/Riemannian/Hyperbolic/ClosedSurface.lean:105`) assumes `CompactSpace M`, so it does not cover `U`.

The repair is to state both theorems, with bordered uniqueness too if wanted, and to remove the bordered bullet from the docstring's list of what is not statable. The description's sentence that names the bordered case as not statable would change with it.

## Earlier findings

- R01 — repaired. `exists_hyperbolicMetric_hasFiniteVolume_metric_eq_rescale_of_eulerChar_lt_card` (`Suggested.lean` line 98) states the punctured case, and it elaborates. The docstring keeps only the bordered case as not statable; this report's R01 is about that case.
- R02 — repaired. §0.1f now consumes ModularForms §10B: "its prerequisites, including the existence of a nonconstant meromorphic function, belong to that roadmap" (lines 218–219). §1.3 cites `TauCeti.NodalGluing.AuxiliaryIso.permFiberEquiv` (line 482). §1.4 cites the four pinned laws and `CategoryTheory.Subgroupoid.hom.faithful` (lines 501–510).
- R03 — repaired. Line 643 now reads "the fibre jumps from a point (b ≠ 0) to a line (b = 0)".
- R04 — repaired. The headlines now carry Robbin–Salamon locators: 8.1 (line 259), 17.3 (287), 9.2 (343), 3.7–3.8 (354), 5.6 (955), 5.3 and 5.4–5.5 (1017, 1022), 6.5 (1159, 1191), 6.6 (1374) and 17.5 (1325, 1335). Each was checked against the arXiv v4 text.
- C01 — repaired. Lines 328–334 give the barrier computation `(2 − δ − δ²) t^(−δ)` and the solution `u = (1/3) t^(−1) log t` at δ = 1. Recomputed: `(−t²∂_t² + 2)(t^(−1) log t) = 3t^(−1)`.
- C02 — repaired. `CircleSobolevCoefficients` is removed, and §3.1 uses `TauCeti.CircleSobolev s E` (line 717).
- C03 — not repaired: deferred (D01).
- N01 — repaired. Line 5 now reads "using Robbin and Salamon's Hardy-gluing method".
- N02 — repaired. Line 1777 now reads "The following results are proved at the Tau Ceti pin".
- The question on numbering is answered. Convention 8 (line 125) and the References (lines 2025–2027) fix the arXiv v4 numbering, and every locator checked agrees with it.

## Deferred findings

- D01 — stands.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §0.1a normal forms (sample) | pants, one-holed torus, annulus | g = (2 − χ − b)/2 gives 0, 1, 0; GeometricTopology §1.7 (main line 1068) states the same genus | supported by supplier | none |
| §0.1f analytic genus (sample) | sphere, torus | ModularForms §10B gives h⁰(K) = g_an and g_an = g_top; h⁰(K) = 0, 1 | supported | none |
| §0.3 genus one (sample) | ℂ/(ℤ + τℤ), ω = dz | ∫ i ω∧ω̄ = 2 Im τ = 2 Im(conj(1)·τ); deg K = 0; RS 8.1 at lines 988–1023 uses the flat metric | true, locator correct | none |
| `exists_zlattice_…` (Lean 68) | χ = 2, 0, −2 | χ = 0 iff g = 1; `simp`/`aesop` probe leaves the goal open | true, not padding | none |
| §1.2 and `finite_ordered_iff_…` (sample; Lean 119) | sphere n = 2, 3; torus n = 0, 1; genus 2, n = 0; nodal genus one, one mark | 2<2 false (z ↦ λz); 2<3 true; 0<0 false; 0<1 true; −2<0 true; Aut = ℤ/2; RS 3.7–3.8 lines 565–583 | true, locator correct | none |
| §2.4 smoothing ideal (sample) | xy = b², xy = 0, nodal torus | ideal (b²) ≠ 0 while ds = 2b db vanishes at 0; ideal 0; plumbed genus 0 + 1 = 1 | true | none |
| §3.2 boundary estimate (sample) | disc with ∂̄; closed surface | holomorphic ξ: Dξ = 0, controlled by trace; constants: Dξ = 0, empty trace, estimate fails | true | none |
| §3.3 Def¹ (sample) | chain of three spheres, 5 marks; sphere, 1 mark; nodal genus one | Def¹ = ℂ², 2 = −3 + 5; 0 = −3 + 1 + 2; ℂ, 1 = 0 + 1 | true | none |
| §3.4 index | diagonal a₁ = a₂ = t | 3 − 5 + 1 + 2 − 1 = 0; RS 15.2 codimension ∩ im dπ = 0; kernel = cokernel = 0 | true; source needs regular nodal | source issue |
| §4.1 (sample) | (0, 4) | base 1, curve 2, stratum 0 − 3 + 4 − 1 = 0; RS 11.4 Step 3 lines 1358–1394, section equation 1379 unnumbered; RS 5.6 line 767 | supported | none |
| §4.4 openness (sample) | diagonal unfolding | D bijective at 0, index −1 at b ≠ 0; README restricts RS 5.3 to regular nodal families | supported as restricted | none |
| §4.5 every family (sample) | xy = t² | A₁ singularity; classifying map a = t², derivative 0 at 0; RS 5.4 covers smooth total spaces only | consistent, "extends the paper" | none |
| §5.1 signatures (sample) | (0, 3), (0, 4) | 1 signature; 1 smooth + 3 trees; RS line 585: finitely many signatures | true | none |
| §7.2 collisions (sample) | point meeting node of nodal genus one | 2 vertices, 2 edges, b₁ = 1; each component 3 special points | true | none |
| §7.3 clutching (sample) | (0, {1, *, **}) → (1, {1}); external | b₁ rises by 1; unchanged; StableReduction Layer 3 clutching, main lines 487–500 | true | none |
| §8.1 orbifold instance (sample) | (1, 1) | kernel ℤ/2 retained; Orbifolds O1 item 1 retains trivially acting labels | supported | none |
| §8.2 weighted pairing (sample) | M̄_(1,1) | O5: [*/K] integrates to 1/\|K\|, so weighted class = ½ coarse class | supported | none |
| Universality headline (§§4.1, 4.5) | carriers at pins | no analytic-space or nodal-family carrier in Mathlib or Tau Ceti | not statable, named in docstring | none |
| Compactness headline (§6.3) | (0, 4) | ℙ¹ compact versus ℂ ∖ {0, 1}; RS 17.5 lines 3347–3374, 6.6 lines 869–872 | not statable, named | none |
| Closed uniformization (Lean 79) | χ = 0; genus 2; χ = −1 non-orientable | torus excluded; area 4π; pin has only the criterion and uniqueness | true, stated | none |
| Punctured existence (Lean 98) | sphere ∖ 3, torus ∖ 1, P = ∅, ℝP² ∖ 2 | 2<3, 0<1, closed case, 1<2 (by double cover) | true, elaborates | none |
| Punctured uniqueness (§0.4) | probe on U = M ∖ P | elaborates; pinned uniqueness needs `CompactSpace` (ClosedSurface.lean:105) | statable, absent | R01 |
| Bordered case (§0.4) | probe on 𝓡∂ 2; annulus | elaborates; annulus χ = 0 gives area 0, so χ < 0 needed | statable; docstring says not | R01 |
| §0.4 Check | δ = 1/2, 1; u = t⁻¹ log t | 2 − δ − δ² = 5/4, 0; (−t²∂² + 2)u = 3t⁻¹; roots of a² − a − 2: 2, −1 | true | none |
| §2.2 Check | b₀x = 0 with b₀ ≠ 0 | fibre {x = 0}, one point | true | none |

- Source locators checked against the text: 17 in RobbinSalamon2006 (arXiv v4): 3.7–3.8, 5.3, 5.4–5.5, 5.6, 6.5 (i)–(iii), 6.6, 8.1, 9.1, 9.2, 10.2, 11.4 Steps 1 and 3, 15.1–15.2, 17.3, 17.4, 17.5 and §§12–15. One in Wendl v3.2 (§4.2.4, lines 5743–5780).
- Library declarations opened at the pins: `HyperbolicMetric` (Hyperbolic.lean:51), `HasFiniteVolume` (FiniteVolume.lean, `LindelofSpace` binder), `restrictOpenTangentSpace` (Restriction.lean), `exists_hyperbolicMetric_metric_eq_rescale_iff` and `eq_of_metric_eq_rescale` (ClosedSurface.lean:76, 105), `IsGeodesicCurve` (Geodesic/Basic.lean:115), `rescale` (Conformal.lean:87), `Marking` and `specialPoints` (Basic.lean:414, 426), `ordered` (AuxiliaryMarks.lean:345), `finite_ordered_iff` and its two specializations (FiniteAutomorphisms.lean:126, 163, 189), `FiniteCWType` (a Prop class), `exists_diffeotopy_eqOn_of_pairwise_disjoint`, and twelve further cited names found by grep.
- Cross-roadmap citations resolved on main: GeometricTopology §§1.1, 1.7, 3.3; ModularForms §10B; ComplexKahlerGeometry §5.10; HeegaardFloer §4.6a; ComplexTori Milestone 1; PseudoholomorphicCurveAnalysis Layers 3–7, §§5.2, 6.1, 7.1, 7.2; PDE §§1.1, 1.4, 1.6, 1.7, 4.2; ComplexComparisonPartII §§C-1.1, C0.3, C1.9, C3.2; StableReduction Layers 3, 9, 10; Orbifolds O1, O3, O4, O5; FuchsianOrbifolds Layer 5; Completed ConformalMapping. The old labels D0–D7 cited by main's AnalyticStableMaps, GromovWittenTheory, PainleveEquations, K3SurfacesAndSymplecticBoundedness and RiemannianGeometry/Surfaces, and by the open TeichmullerGeometry, FuchsianOrbifoldsPartII and MappingClassGroupsAndCanonicalRepresentations, map item by item to sections with the same content.
- Automatic checks: all passed, none set aside. Dependency check: `depcheck: 200 roadmaps, 2201 edges, 0 problem(s)`. No change outside the folder.
- Elaboration: `lake env lean` of `Suggested.lean` gives four `sorry` warnings (lines 68, 79, 98, 119) and nothing else. Both R01 probes elaborate with only `sorry`. One-tactic probes (`simp`, `rfl`, `infer_instance`, `aesop`, and `rw [finite_ordered_iff]; simp`) close none of the headline theorems.
- The elaborated types of all 20 declarations were compared with the README statements: no binder is lost, and the file was not changed.
- Checks evaluated: about 55 bullets, all true.

Overlap check: read AnalyticStableMaps (main and its open revision), GromovWittenTheory (main), HeegaardFloer (main), ComplexKahlerGeometry (main), TeichmullerGeometry (open), FuchsianOrbifoldsPartII (open) and MappingClassGroupsAndCanonicalRepresentations (open); nothing shared. AnalyticStableMaps, GromovWittenTheory, TeichmullerGeometry (whose README line 41 states one-way supply), FuchsianOrbifoldsPartII and MappingClassGroupsAndCanonicalRepresentations consume this roadmap; HeegaardFloer and ComplexKahlerGeometry supply it. No other roadmap on main owns finite-type uniformization.

Source independence: 16 passages compared with 2 sources. From RobbinSalamon2006 arXiv v4: 3.7–3.8, 5.3–5.6, 6.5–6.6, 8.1, 9.1, 9.2, 10.2, 11.4 Steps 1 and 3, 15.2, 17.3, 17.4 and 17.5, set against §§0.3, 0.4, 0.5, 1.2, 3.4, 3.5, 3.6, 4.1, 4.4, 5.4, 5.6, 6.2 and 6.3 and the docstrings at `Suggested.lean` lines 65 and 114. From Wendl v3.2: §4.2.4 against §3.5. Nothing is shared beyond forced formulas and definitions. Largest share: RobbinSalamon2006, 20 of 23 body locators. Contents compared with RobbinSalamon2006 (17 sections): independent. Layers 0, 7 and 8 have no counterpart in it, and Layer 5 (the source's §6) follows Layer 4, as its *Needs:* lines on §§4.4–4.5 force.

Research link: Layers 3–6 are the analytic construction of the Deligne–Mumford orbifold by Robbin and Salamon (2006, corrigendum 2007), which §4.5 extends to every restricted family. AnalyticStableMaps and GromovWittenTheory build stable-map moduli and Gromov–Witten operations on it. This rests on the README's Downstream consumers and References, and on RobbinSalamon2006 §§5–6.

## Not verifiable

- Wendl, version 3.3: only version 3.2 (arXiv:1011.1690v2) was read. Its §4.2.4 supports the offset map of §3.5.
- Robbin–Salamon corrigendum, J. Eur. Math. Soc. 9 (2007): behind a subscription and recorded as uncertified. Lemmas A–B and the Remark cited in §3.6 were not read.
- Robbin–Salamon 2006, journal version: behind a subscription. This no longer matters, since the README cites the arXiv v4 numbering, which was read.
- Hummel's book, cited through Robbin–Salamon §17, was not consulted. The README proves those ingredients itself rather than citing them.

## Source issues

- **Error** in RobbinSalamon2006 at Theorems 5.3 and 5.4 (arXiv v4, p. 18): the source says bijectivity of D_(u,b) is open and implies universality for every nodal unfolding; it should assume the unfolding regular nodal at b (Definition 15.1), since the diagonal pullback a₁ = a₂ = t of two-node plumbing has bijective D but is not universal; affects a stated result.
- **Error** in RobbinSalamon2006 at Lemma 10.2 (arXiv v4, p. 28): the source says J is integrable iff equation (6) holds, after reducing to a one-dimensional base; it should say (6) is necessary, sufficiency needing the horizontal Nijenhuis component when the base has dimension at least two; affects a stated result; corrected in print at Corrigendum, J. Eur. Math. Soc. 9 (2007), 901–905.
- **Misprint** in RobbinSalamon2006 at Lemma 11.3, proof (arXiv v4, p. 32): the source writes the marked-point constraint of X₀ with b̂ and mixes the names ξ and û; it should be â, with one name for the vector field; affects nothing.
- **Misprint** in RobbinSalamon2006 at Theorem 11.4, Step 1 (arXiv v4, p. 33): the source indexes the genus-zero slice arguments up to b with index n − s; it should be n − 3; affects nothing.

## For the human reviewers

- none
