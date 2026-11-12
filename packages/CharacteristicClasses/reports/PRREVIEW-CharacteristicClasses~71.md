# Review of CharacteristicClasses (pull request #1807 at 3af9fd1)

**Verdict:** needs changes

This is a full re-review. Since e65eef3 the folder changed by 308 lines:
- AlgebraicTopology stages are renumbered: 4.5 → 4.8 for compact generation, 4.8 → 4.10 for CW approximation, 8.8b → 8.8.
- C2.4a and C7.6 are new.
- C1.5a has two new Checks.
- `PROGRESS.md` and `STATUS.md` arrive with the merge of main. Both are on main, so they are not part of this pull request's diff.

The merge of main also replaced GeometricTopology, DifferentialGeometry and LieGroups with main's rewritten texts, and three of this roadmap's supplier citations into GeometricTopology no longer resolve (R02, R03).

## Previous findings

The previous report (PRREVIEW-CharacteristicClasses~70) raised no finding, so none is carried over. The two r68 findings it recorded as repaired are still repaired:
- **R01 (r68):** `README.md:2949–2951` still defines f!_K as "the Thom map of the dual-Koszul class of ν followed by the open extension from a tubular neighbourhood".
- **R02 (r68):** `README.md:1663–1665` still has "a closed 2m-form Ψ … on the simplicial manifold N(G;G/T) whose restriction to the fibre G/T has nonzero integral".

## R01 (P2) — The statable integral form of C2.4a's representation theorem is absent from `Suggested.lean`

**Location.** `README.md:1497–1510` (C2.4a) states that, for oriented M, every class of H_(m−1)(M;ℤ) and H_(m−2)(M;ℤ) is i_*[N] for a compact embedded oriented N. `Suggested.lean:12–118`, the module docstring, mentions C2.4a nowhere, neither stated nor named as not statable.

**Claim.** This is Thom's realization theorem in codimensions one and two. This roadmap owns it: AlgebraicTopology 8.13 (`AlgebraicTopology/README.md:4967–4978`) hands it here. It is a headline, and its integral form is statable at the pins.

**Witness.** The following elaborates against the pins with only the `sorry` warning (my scratch file, `lake env lean`). The carriers are Tau Ceti's integral `HomologicalOrientation.mapFundamentalClass` (`AlgebraicTopology/Singular/LocalHomology/FundamentalClass.lean:275`) and Mathlib's `Manifold.IsSmoothEmbedding` (`Geometry/Manifold/SmoothEmbedding.lean:70`).

**Repair.** State it, name it in C2.4a, and name the mod 2 form in the docstring as not statable: `TauCeti.HomologicalOrientation` and its `fundamentalClass` are integral only, so a non-orientable N has no fundamental class at the pins.

```lean
theorem exists_isSmoothEmbedding_mapFundamentalClass_eq {E M : Type} [NormedAddCommGroup E]
    [InnerProductSpace ℝ E] [FiniteDimensional ℝ E] [TopologicalSpace M] [T2Space M]
    [CompactSpace M] [ChartedSpace E M] [IsManifold 𝓘(ℝ, E) ∞ M]
    {m c : ℕ} (hc : c = 1 ∨ c = 2) (hE : finrank ℝ E = m + c)
    (oM : TauCeti.HomologicalOrientation M E (m + c))
    (x : ((singularHomologyFunctor (ModuleCat.{0} ℤ) m).obj
      (ModuleCat.of ℤ (ULift.{0} ℤ))).obj (TopCat.of M)) :
    ∃ (N : Type) (_ : TopologicalSpace N) (_ : T2Space N) (_ : CompactSpace N)
      (_ : ChartedSpace (EuclideanSpace ℝ (Fin m)) N) (_ : IsManifold (𝓡 m) ∞ N)
      (oN : TauCeti.HomologicalOrientation N (EuclideanSpace ℝ (Fin m)) m) (i : C(N, M)),
      Manifold.IsSmoothEmbedding (𝓡 m) 𝓘(ℝ, E) ∞ i ∧
        oN.mapFundamentalClass finrank_euclideanSpace_fin i = x := by
  sorry
```

I tested it on these instances:
- M = T², c = 1: (2,0) ∈ H₁ is two parallel circles. N may be disconnected, as the README allows.
- M = S², c = 2: n·[pt] is |n| signed points.
- M = RP³, c = 2: the torsion class of H₁ = ℤ/2 is RP¹.
- x = 0: N = ∅.

## R02 (P2) — GeometricTopology Layer 10 no longer owns the "oriented-plane Euler target" that C2.3 compares with

**Location.**
- `README.md:181`: "Layer 10 (the oriented-plane Euler target)".
- `README.md:271–276`: "owns … the oriented-plane Euler target … compares its rank2 restriction with that standalone plane construction".
- `README.md:1363–1364`: "Compare the rank2 class with GT Layer10".
- `README.md:1709`: "the rank-two comparison GeometricTopology Layer 10".

**Claim.** The cited section makes no such statement at this head. The comparison has no second object.

**Witness.**
- `GeometricTopology/README.md:7645` (identical to main): Layer 10 is "foliations of 3-manifolds".
- `GeometricTopology/README.md:208–210`: the foliation Euler class is Tau Ceti's.
- Pinned `TauCeti.Foliation.eulerClass` (`Geometry/Manifold/Foliation/EulerClass.lean:122`) is defined as `TauCeti.eulerClass` of the tangent field (module docstring, lines 17–21).

**Repair.** Delete the Layer 10 entries and the comparison sentence. If a remark is wanted, say once that the pinned foliation Euler class is `TauCeti.eulerClass` applied to the tangent field, so no rank-two comparison is needed.

## R03 (P3) — GeometricTopology and DifferentialGeometry contracts cite sections for objects that are now pinned in Tau Ceti or renumbered

**Location.**
- `README.md:181` and `271–273`.
- `README.md:1483–1484` (C2.4): "Consume GT's normal/tubular maps".
- `README.md:1629–1634` (C2.5): "Use GT Layer1's weak (compact-open C∞) topology on native `ContMDiffMap` … Use Layer3's compact-source comparison".
- `README.md:178` and `254`: DifferentialGeometry "Layers 1–2 … forms, wedge, d".

**Claim.** Main's GeometricTopology Layer 1 has no C∞ mapping topology, and its Layer 3 is `Diff(M)`. The objects are pinned:
- `ContMDiffMap.manifoldWeakWhitneyTopology` (`Geometry/Manifold/ContMDiffMap/Chart/Topology.lean`). Its docstring states agreement with the strong topology on compact sources.
- `TauCeti.SmoothEmbedding.NormalSpace` and `TauCeti.SmoothEmbedding.exists_diffeomorph_normalBundle_subset`.

**Witness.**
- `GeometricTopology/README.md:976–987`: "None of this is planned again here".
- `GeometricTopology/README.md:1429–1445`.
- `DifferentialGeometry/README.md:3194`: "CharacteristicClasses (layers 0–2, 5–10)". Forms and wedge are its Layer 0.

**Repair.**
- Name the three pinned declarations in C2.4, C2.5 and the Tau Ceti row.
- Keep GeometricTopology 1.5 only for the uniqueness of tubes.
- Drop Layer 3.
- Write DifferentialGeometry "Layers 0–2 and 5–10".

## R04 (P3) — C1.1d restates the section/trivialization correspondence that TopologicalKTheory T6.4 and the pin already have

**Location.** `README.md:603–607`: "define a global trivialization … Construct its equivalence with global sections, using the bundle division map".

**Claim.** One direction and the division map are already available:
- The pinned `TauCeti.PrincipalBundle.trivializationOfSection` and `TauCeti.PrincipalBundle.division` (`Topology/FiberBundle/Principal.lean:363`, `:191`) give an equivariant trivialization from a section continuous on an open set, so with U = univ a global one.
- TopologicalKTheory T6.4 (`TopologicalKTheory/README.md:1593`, on main as well) owns "a bundle being trivial iff it has a section".

C1.1d names neither, nor the carrier `TauCeti.PrincipalBundle`.

**Repair.**
- Name `TauCeti.PrincipalBundle`, `trivializationOfSection` and `division` in C1.1d and in the Tau Ceti row.
- Cite TopologicalKTheory T6.4 for "trivial iff a section exists", and add T6.4 to C1.1d's dependencies.
- Keep as this item's own: the C(X,G)-torsor, the homotopy correspondence and the relative extension statements.

## R05 (P3) — C7.6 cites a ComplexKahlerGeometry target for a pinned Tau Ceti diffeomorphism

**Location.** `README.md:3258`: "followed by CKG K7.1's biholomorphism CP¹≃`OnePoint ℂ`". Also `README.md:3306–3309` (dependencies).

**Claim.** This map is Tau Ceti's `OnePoint.diffeomorphProjectivization` (`Geometry/Manifold/Instances/OnePoint/Projectivization.lean:140`). Its homeomorphism is `Diffeomorph.toHomeomorph`.

**Witness.** `ComplexKahlerGeometry/README.md:2763–2764`: "The Riemann-sphere comparison is Tau Ceti's and is cited: `OnePoint.diffeomorphProjectivization`".

**Repair.**
- Cite the pinned declaration in C7.6, in C7's dependencies and in the Tau Ceti row.
- Keep K7.1 only for comparing C1.5's sphere quotient S³/S¹ with `Projectivization ℂ (Fin 2 → ℂ)`.

## R06 (P3) — C2.4a's locator is a whole chapter, and the work is not in the manifest

**Location.** `README.md:1503` cites "(Thom 1954, Chapter II)", and `README.md:3347` lists "Chapter II". `sources.toml` has no Thom entry.

**Claim.** This is not an exact locator. Chapter II of a 70-page paper states numbered theorems.

**Witness.** `TangentialBordism/README.md:3094–3099` (#942) cites the same paper as "Théorèmes III.2 … III.4 …, p.59".

**Repair.** Cite the numbered theorems of Chapter II and their pages for the mod 2 and integral codimension-one and codimension-two statements. Record the paper in `sources.toml`; Commentarii volume 28 is openly archived (e-periodica, GDZ).

## R07 (P3) — The pull request's description does not describe this roadmap's revision

**Location.** `scratch/pull-request.md`, the description. On CharacteristicClasses it says only:
- the C1.5a, C2.4a and C7.6 moves;
- "CharacteristicClasses now lists its suppliers in a table, which the check reads; main states the same dependencies in prose".

**Claim.** The description leaves out four changes a reader must know of:
1. The README is rewritten: 4662 changed lines, 11 headings removed and 71 added.
2. HomotopySpheres §§3A, 4A and GeneralizedCohomology G4.0a–G4.0b are dropped as suppliers.
3. Six `Suggested.lean` declarations are removed.
4. "the same dependencies" is false.

**Witness.** Main's CC README, lines 24 and 456, consumes "HomotopySpheres §3A and §4A", and lines 1894 and 1938 consume "GeneralizedCohomology G4.0a/G4.0b". The head consumes neither.

**Repair.** Add: "CharacteristicClasses is rewritten in the house shape. It no longer consumes HomotopySpheres §§3A, 4A, which TopologicalKTheory T1.5a and AlgebraicTopology 4.8 replace, or GeneralizedCohomology G4.0a–b, which TopologicalKTheory T1.5 and Tau Ceti's `Quaternion.toComplexMatrix` replace. Its Suggested.lean drops `chernRootValue`, `pontryaginRootValue`, `toddSeries`, `lSeries`, `lSeries_root_coefficient_six` and `twice_even_product_correction_eq_zero`, whose series are pinned in Tau Ceti. It states the Thom class over an arbitrary base (C2.1), the Euler obstruction (C2.2), the Euler number (C2.3) and Whitney's non-immersion of RP^(2^k) (C7.3a)." Replace "the same dependencies" with "the dependencies that remain".

## Verified sound

**Gate.**
- The worker's gate at 3af9fd1 passes every check, `build=0` included.
- My re-run reports only `outside-folder=23`. All 23 hits are files in this pull request's own sibling folders (AdicSpacesPartIII … TopologicalKTheory), which the brief names, so this is not a finding.
- `git diff --stat origin/main...HEAD` outside the 13 folders is empty.

**Dependency check.**

    depcheck: 236 roadmaps, 2164 edges, 0 problem(s)

- All 15 supplier roadmaps in the contract table are on main.
- SchubertGeometry (cited by C5a.6 and C5a.7) mentions this roadmap only as an owner it leaves things to (`SchubertGeometry/README.md:120`, `:128`), not as a supplier, so there is no two-cycle.
- The conflicting pull requests #1808 and #1854 merge after this one, as the description's merge-order block states.

**Lean.**
- `lake env lean Suggested.lean` gives five `declaration uses sorry` warnings (lines 149, 173, 189, 213, 245) and nothing else.
- I ran `#check @` on all five theorems in a scratch copy. The elaborated types match the README:
  - C2.1: ∃! with the ±g fibre conditions and `Module.Projective K R`; and existence of `IsThomClass` for every commutative K.
  - C2.2: `[T2Space B]`, CW on `univ`, no cells above the rank, `2 ≤ finrank`.
  - C2.3: `FiniteCWType M`, `hE : finrank = n+1`, `oh` agreeing with `o`.
  - C7.3a: `1 ≤ k`.
  - No binder is lost.
- One-tactic probe. The pinned `existsUnique_singularCohomology_thomPairOver_iUnion` (`MayerVietoris/DirectedUnion.lean:227`) only glues classes already given on each `thomPairOver (W i)`. C2.1 still needs the oriented local classes and the identification of ⋃W with the Thom pair. C2.2, C2.3 and C7.3a are not single library steps. I found no padding.
- Headlines and their status:

  | Status | Headlines |
  | --- | --- |
  | Stated | C2.1 (two theorems), C2.2, C2.3, C7.3a |
  | Named as not statable | C2.1 Thom isomorphism, C2.2 Gysin, C3.4/C3.6, C4.2, C5.2, C5a.1, C5a.5 (two), C6.3–C6.5 |
  | Missing | C2.4a (R01) |

**Seeded sample (15 targets).** Sources are cited as `<source id> line N`, with printed pages.

- **C1.0.**
  - `dupont-ln` line 532 (Prop. 2.20: Gram–Schmidt isometric trivializations), line 566 (Prop. 2.21: F_O(V), right O(n)-action, charts), line 976 (Example 4.3: metric = O(n)-reduction, orientation = GL⁺-reduction).
  - `hatcher-vbkt` line 1019, p. 26 (Gram–Schmidt).
- **C1.1d.** `hatcher-vbkt` line 856, p. 22 (clutching), through p. 26.
- **C1.4.** `mueller-wockel-smoothing` line 225 (Prop. I.13: finite-dimensional K, smooth representative, smooth ⇔ continuous equivalence), line 461 (Thm II.11, relative to closed C), line 686 (Thm II.12, equivalences relative to C).
- **C1.5a.** `hatcher-at` line 3816, p. 88 (Example 1B.3, RP∞ = K(ℤ₂,1)), and line 16490, p. 380 (Example 4.50, CP∞ = K(ℤ,2)).
- **C2.0.**
  - `hatcher-vbkt` line 641, p. 16 (D(E)), and line 3428, p. 88 (Thom pair).
  - `cohen-fiber-bundles` line 2950, p. 86 ((2.4), T(ζ)=D/S), and line 2979, p. 87 (Prop. 3.7).
- **C2.1 and C2.3.** Milnor–Stasheff, see "Not verifiable".
- **C3.3.** `hatcher-vbkt` line 3648, p. 94 (p_i=(−1)^i c_2i(E_C)) and line 3656 (Prop. 3.15(a), p_i ↦ w_2i²).
- **C3.4.** `hatcher-vbkt` line 3285, p. 84 (Thm 3.9) and line 3504, p. 90 (Prop. 3.12, kernel (w₁)).
- **C3.6.** `hatcher-vbkt` line 3681, p. 95 (Thm 3.16(b): Z[p̃,e], e²=p̃_k). The proof computes the rings over R=ℤ[1/2] (lines 3695–3700), as the README says.
- **C4.3.** `dupont-ccc` line 2977, pp. 94–95 (Thm 6.13 a)–d)).
- **C5.3.** `dupont-ccc` lines 3954–3988, pp. 129–130 ((8.33)–(8.34), injectivity for G⁰ ⊂ G by the |G/G⁰| transfer, ending Thm 8.1).
- **C6.3.** `hatcher-vbkt` line 4237, p. 110 (Prop. 4.3) and line 4266, p. 111 (Prop. 4.5).
- **C7.1.** Milnor–Stasheff, see "Not verifiable".
- **C7.6.** `hatcher-at` line 17020, p. 392 (§4.2, Exercise 34: Hopf map composed with the collapse T³→S³).

**Adversarial table.**

| Statement | Instances tried | Values computed (each side) | Result | Change |
| --- | --- | --- | --- | --- |
| C1.0 metric change | line, h₁=4h₀ | H=4, H^(−1/2)u=u/2, h₁=4·¼=1; wrong root 2u gives 16 | holds | none |
| C1.0 SO(2) frames | (e₂,e₁) | det=−1, outside SO(2); O(2) has 2 circles | holds | none |
| C1.1d [S^n,O(k)] table | n=0,1,2; k=1,2,≥3 | [S⁰,·]=π₀²=(ℤ/2)²; [S¹,O(2)]=ℤ⋊ℤ/2 (reflection acts by −1); [S¹,O(k≥3)]=ℤ/2×ℤ/2; [S²,·]=π₀=ℤ/2 since π₂=0 | holds | none |
| C1.1d Euler calibration | O(−1), TS² | winding −1, ⟨−h,[CP¹]⟩=−1; winding 2, χ=2 | holds | none |
| C1.4 smoothing | K=U(1), M=S²; M=pt | continuous and smooth classes both ℤ; a point has one bundle | holds | none |
| C1.5a | RP∞, CP∞, RP¹, CP¹ | π₁=ℤ/2, π_{≥2}=0; π₂=ℤ, π_{≠2}=0; π₁(S¹)=ℤ; π₃(S²)=ℤ; H¹(RP∞;ℤ)=Hom(ℤ/2,ℤ)=0 | holds | none |
| C2.0 Thom cells | TS²; Möbius/S¹; rank 0 | cells 0,2,4 vs H̃*=ℤ in 2,4; cells 1,2 = RP², H̃¹(RP²;ℤ)=0≠ℤ; X₊ | holds | none |
| C2.1 (two theorems) | point; rank 0 two components; Möbius | u=g for ω, −g for −ω; (1,−1); ℤ/2 Thom class exists, ℤ none | holds | none |
| C2.2 iff | TS²; S²×ℝ²; S¹ rank 2; B=∅; su(F)/S⁴ | e=2≠0, no section; e=0, section; H²=0, section; vacuous both; rank 3 < dim 4 excluded by hdim | holds | none |
| C2.3 ⟨e,[M]⟩=χ | S², T³, S¹ (n=0), ∅; reversed o | 2=2; 0=0; e=0=χ; 0=0; (−u,−[M]) gives 2 | holds | none |
| C2.4a statement | T² c=1; S² c=2; RP³ c=2; α=0 | (2,0)=two circles; n[pt]=\|n\| points; ℤ/2 class=RP¹; N=∅ | holds | Lean statement (R01) |
| C2.4a orientation sign | normal-first, AT's front-face cap (`AlgebraicTopology/README.md:293`) | (U×1)⌢([ℝ^c]×[ℝ^(m−c)])=(+1)[ℝ^(m−c)]; bordism ∂ at t=1 is (−1)^c·N₁, so ×(−1)^c gives −N₀⊔N₁ | holds | none |
| C2.4a Checks | RP¹, CP¹, CP², RP² | {x₀=0}={[0:1]}, counts 1 and +1; i_*[CP¹]=PD(h) generates H₂ | holds | none |
| C3.3 Whitney correction | general | c_2k(E_C⊕F_C)=Σc_2a c_2b+Σc_(2a+1)c_(2b+1); ×(−1)^k gives Σp_a p_b+(−1)^kΣc_odd c_odd | holds | none |
| C3.3 Checks | CP²; O(1)_ℝ; RP⁴ L⊕L; Wu | (1−h²)³ gives p₁=3h², L₁=1; p₁=h²=e²; −β(a)²≠0 in H⁴(RP⁴;ℤ)=ℤ/2; Sq¹w_j=w₁w_j+(j−1)w_(j+1) | holds | none |
| C3.4 BSO mod 2 | n=1, 2 | F₂ (point); F₂[w₂]=H*(CP∞;F₂) | holds | none |
| C3.6 away from 2 | BSO(2), BSO(3), BSO(4) | R[e], p₁=e²; R[p₁]; R[p₁,e], p₂=e²; antipode reverses x^⊥, e↦−e, invariants R[p,e²] | holds | none |
| C4.3 | U(1), m=1, 2, 3 | point H²=0; −a/2π ↦ −h, ⟨,[CP¹]⟩=−1; h² pairs 1 on CP² | holds | none |
| C5.3 disconnected G | O(2) | ℚ[e]^(ℤ/2)=ℚ[e²]=ℚ[p₁]=H*(BO(2);ℚ) | holds | none |
| C6.3 | point; S²; S¹ | Hper^n(pt)=ℚv^(−n/2); ℚ²=ℚ²; K¹(S²)=0; ℚ=ℚ; (−v⁻¹)(−U_R v)=U_R | holds | none |
| C7.1 L₃ | CP⁶; HP³; HP² | (2170−1911+686)/945=1; (1+u)⁸/(1+4u)=1+4u+12u²+8u³, (496−624+128)/945=0; 1+2u+7u², L₂=(49−4)/45=1 | holds | none |
| C7.1 coefficients | q₁,q₂,q₃ | q₃=2⁶B₆/6!=2/945; q₁q₂−3q₃=−13/945; q₁³−3q₁q₂+3q₃=62/945 | holds | none |
| C7.3a | k=1, 2; RP³ | w̄(RP²)=1+a, ℝ²; w̄₃(RP⁴)=a³≠0, ℝ⁶; w̄(RP³)=(1+a)⁻⁴=1; 2^(k+1)−2≥2 (no truncation) | holds | none |
| C7.6 | Hopf p; constant map | fibres circles, H₃(S¹)=0; π₃(S³)≅π₃(S²); H̃₂(S³)=0 kills f_*; constant: one fibre S³, H₃=ℤ | holds | cite pinned map (R05) |
| C2.3 rank-2 comparison | GeometricTopology Layer 10 | no plane-Euler object at the head; the pinned foliation Euler class is `TauCeti.eulerClass` | fails (no target) | R02 |

**Cross-roadmap citations resolved at this head.**

- **AlgebraicTopology:**
  - 2.5 (`supBallEuclideanDiskHomeomorph`, line 5358);
  - 4.5 (cellular approximation, Tau Ceti `exists_isCellular_homotopic`; relative CW pushout; lines 1614, 5360, 5389);
  - 4.6, 4.7 (`simplicialRealizationCW`, line 5400);
  - 4.8 (compact generation, line 1951);
  - 4.10, 5.5, 6.4;
  - 8.7 (the dimension-m CW structure, line 4180);
  - 8.8 (`[X,Bπ]_*≃Hom(π₁X,π)`, bar model);
  - 8.12; 8.13 (owns smoothing, transversality and the circle map, and hands the representation theorem here, lines 4967–4978, 5110–5113);
  - 8.16 (Serre fibration S³→S² with H₃(fibre)=0, lines 5225–5251).
- **TopologicalKTheory:** T1 items 3–6, T1.5a (line 496), T1.6a (line 591), T3 item 4, T4 item 8, T5 item 5, T6 item 4 (line 1573), T7 item 4.
- **ComplexKahlerGeometry:** K4 (line 1091), K7.1 (line 2700), K7.2/7.3 (lines 2798, 2882; consumer note at 3527–3533).
- **LieGroups:** L1 (line 301), L2 (SU(2)≃S³, line 435), L5 (Ad: SU(2)→SO(3), line 575), 5A (641), 6 (673).
- **DifferentialGeometry:** 10.2 Sard (line 2695), 8 (multiplicative comparison, line 2625).
- **GeometricTopology:** 11.3 (smooth triangulations, line 7887).
- **ClassifyingSpaces:** line 1192.
- `scratch/citations.md` lists nothing unresolved.

**Pinned declarations opened.**

- **Tau Ceti:**
  - `TopCat.mem_serreFibrations_of_exists_trivialization` (`Topology/Homotopy/SerreFibration/FiberBundle.lean:365`);
  - `TauCeti.ComplexProjectiveSpace` (`Topology/ComplexProjectiveSpace/Basic.lean:58`);
  - `HomologicalOrientation` (`.../Orientation/Homological.lean:75`);
  - the genus polynomials (`RingTheory/PowerSeries/GenusPolynomials.lean:65–158`);
  - `multiplicativeSequence_three_right` (`MultiplicativeSequence.lean:373`);
  - `coeff_hirzebruchLSeries` (`CharacteristicSeries.lean:249`);
  - `exists_isThomClass` and `exists_singularCohomology_thomPair_fiber` (`Orientation/ThomClass.lean:186`, `:121`).
- **Mathlib:** `onePointEquivSphereOfFinrankEq` (`Topology/Compactification/OnePoint/Sphere.lean:34`, which needs finrank+1 = card ι, here 2+1=3).

**Ownership against open pull requests.**

- **C2.4a.** TangentialBordism (#942) owns Thom's Chapter III realization by singular manifolds (`TangentialBordism/README.md:3094`). That is a different object, so C2.4a has no second owner.
- **C1.5a and C7.6.** `roadmaps grep` finds no other owner of RP∞ or CP∞ as Eilenberg–MacLane spaces, or of a Hopf map, on main, at the open heads or at the pins.
- **Overlaps.** `scratch/overlaps.md` lists no dropped id.

## Not verifiable

- **Thom 1954, Chapter II (C2.4a).** I tried three routes:
  - EuDML `eudml.org/doc/139072` gives the landing page only;
  - e-periodica returns a bot-verification page;
  - DOI 10.1007/BF02566923 is paywalled.
- **Milnor–Stasheff:** Lemma 18.1 (C2.0), Thm 10.4 (C2.1), Cor 11.12 (C2.3), Thm 15.3 (C3.3), §15 (C3.6), §19 (C7.1). Uncertified, cited by locator.
- **Bott–Tu §6 (C2.4, C2.5), Milnor's *Topology from the Differentiable Viewpoint* §6 (C2.3a), Milnor's *Construction of Universal Bundles, II* (C1.1b).** Uncertified.
- The README flags no locator as unverified.

## Source issues

- none
