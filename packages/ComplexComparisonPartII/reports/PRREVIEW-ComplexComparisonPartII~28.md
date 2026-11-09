# Review of ComplexComparisonPartII (pull request #848 at 3cf1bed)

**Verdict:** needs changes

This is a full review of an unchanged head: `scratch/changes.md` shows 0 changed lines in the folder since `3cf1bed`. I reread `Suggested.lean`, the README's scope, conventions and supplier contracts, and every layer, and checked the fifteen seeded targets against their sources. No new defect turned up. The one previous finding is still open and is carried as R01.

## R01 (P2) — The holomorphic Picard bijection, the holomorphic exponential sequence and the `c₁` identification still have two owners

**Location:** `TauCetiRoadmap/ComplexComparisonPartII/README.md:146`: "C5.4 is the single owner, on every complex manifold, of the holomorphic-to-smooth forgetful adapter, the frame-torsor bijection from holomorphic line-bundle classes to `H¹(M,O_M^×)`, the holomorphic exponential sequence with its cocycle `δu`". The same claim is made at :89–93 and :3822–3836. At :5117–5121, K3Surfaces §1.1 is named as a consumer of C5.4's bijection.

**Claim:** C5.4 is the only owner of these three objects, and K3Surfaces and GeometricQuantization take them from C5.4.

**Witness:** ComplexKahlerGeometry #1234 at `682823d`, README :731–734, says that K4.P "owns, on every complex manifold, the holomorphic exponential sequence, the isomorphism `Pic_hol(M)≃H¹(M,𝒪×)`" and "supplies this segment … to ComplexComparisonPartII C5.4". Its :826 repeats the claim. K3Surfaces #1285 at `920b522` places `Pic_hol(M)≃H¹(M,O_Mˣ)` with ComplexKahlerGeometry, at :13–16 and through `gap:integral-topology` at :184–187 and :429–434. That contradicts README :5117 here.

The other heads were rechecked in today's index (2026-11-09T04:13:08Z). #1234, #1285 and K3SurfacesAndSymplecticBoundedness #1375 (`c1d6da0`, :13) have not moved since the previous review. GeometricQuantization #1186 (`be6ed5f`, :719) consumes C5.4, as this README says, and so does #1375. The other open revisions of ComplexKahlerGeometry, #1398 (`1038b16`), #1807 (now at `62d686c`), #1808 (`a96d197`) and #1854 (`30817b1`), make no K4.P claim. Main's ComplexKahlerGeometry has neither K4.P nor an exponential sequence: a grep for `K4.P`, `exponential seq` or `Pic_hol` returns nothing.

**Why this roadmap keeps ownership:** ComplexKahlerGeometry is on main, and a pull request that revises it is never a supplier. So C5.4 cannot take K4.P from #1234, and the README's own text is right as it stands. The defect is that the open heads disagree with it and nothing records which side gives way. No file in the folder needs to change.

**Repair** (unchanged since r20): add this paragraph to the merge-order block of the pull-request description.

> **Ownership.** ComplexComparisonPartII C5.4 is the single owner, on every complex manifold, of `Pic_hol(M) ≃ H¹(M,O_M^×)` with its tensor, dual and pullback laws, the holomorphic exponential sequence and the identification of its connecting map with the integral first Chern class. ComplexKahlerGeometry on main states none of them. ComplexKahlerGeometry #1234 drops K4.P's ownership claim (README :731–735, :826) and reads isomorphism classes of K4's line bundles directly. K3Surfaces #1285 replaces `gap:integral-topology` (README :13–16, :184–187, :429–434) by a citation of C5.4. K3SurfacesAndSymplecticBoundedness #1375 re-points README :13 to C5.4.

**Tested** on the lines that refute the claim. With this paragraph, #1234 :731 and :826, #1285 :15, :184 and :434, and #1375 :13 are each named together with the edit that makes it cite the one owner.

The finding has been carried since r17 and has never been attempted. No repair report marks it `not actionable in this package`: the board's reports folder holds only review reports. If the repair job cannot edit the description, it should mark R01 `not actionable in this package` and give that reason. The board then hands it to a human instead of carrying it into round 29.

## Previous findings

- **R01 (r27): not repaired.** README :146 still says "C5.4 is the single owner, on every complex manifold, of … the frame-torsor bijection from holomorphic line-bundle classes to `H¹(M,O_M^×)`". #1234 at `682823d` :733–734 still "supplies this segment and its `c₁` identification to ComplexComparisonPartII C5.4". The description still has no ownership paragraph.

## Verified sound

### Gate, dependency check, Lean

- **Gate.** My own run on `3cf1bed` exits 0 with every scanner at 0: `set_option=0 … readme-ids-missing=0 … depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`. The worker's `gate.md` agrees and adds `build=0`.
- **Dependency check** (`--movable`), output in full:

  ```text
  depcheck: 239 roadmaps, 2334 edges, 0 problem(s)
  ```

  It prints no UPWARD, CYCLE or `moved:` line, and the roadmap is at `ORDER.txt:39`. Every supplier is either on main or earlier in the order:
  - on main: EtaleCohomologyFoundations, ComplexKahlerGeometry, RealAnalyticGeometry, GeometricCurrents, CharacteristicClasses, Hyperfunctions, AffineMorseLefschetz, EnhancedDerivedSheaves, DerivedModuleAlgebra, ModularCurves, SchemeAndStackFoundations, AlgebraicVectorBundles, DifferentialGeometry, AlgebraicTopology, AlgebraicCurves and StableReduction;
  - completed: RealAlgebraicGeometry, UniversalCovers and HodgeStructures;
  - earlier in `ORDER.txt`: JacobianChallenge (1), SmoothBundlesConnections (12), ResolutionOfSingularitiesCharacteristicZero (18), DerivedDeRhamCohomology (22), CrystallineCohomology (23) and AlgebraicModuliForArithmeticGeometry (34).

  FormalConnectionsOpers (40) appears only as a consumer.
- **Outside the folder.** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/ComplexComparisonPartII'` is empty, and the worktree is clean.
- **Elaboration.** `lake env lean` on `Suggested.lean` exits 0. The only warnings are four `declaration uses sorry`, at :116, :127, :154 and :172.
- **`#check @`.** I ran it on all four declarations in one scratch file. The binders `[FiniteDimensional ℂ E]`, `[CompleteSpace E]`, `[CompleteSpace F]`, `IsManifold (modelWithCornersSelf ℂ E) ⊤ M` and `LocallyContractibleSpace ↑T` each appear in the elaborated types. No section variable is lost, and the types match `scratch/signatures.md` and the README statements (:1813, :1838, :2870–2899, :3042–3054). I changed nothing.
- **Padding probe.** I tried 20 one-tactic proofs: `simp`, `rfl`, `infer_instance`, `aesop` and `exact?` on each of the four theorems. None closes. `exact?` finds only the probe file's own sorried copies, never a library lemma. The pins have one-variable Montel only (`TauCeti.montel`, `Montel/Basic.lean:58`, for `Ω ⊆ ℂ`), Riesz theory only for `1 − K` on Banach spaces (`RieszTheory.lean:160`), and no holomorphic Poincaré lemma or sheaf/singular comparison.
- **Headlines.** The README table (:45–54) lists 67 headline targets. `montelTheorem`, `schwartzFiniteness`, `holomorphicPoincare` and `nonempty_sheafSingularComparison` are stated. Each of the other 63 is named in the module docstring with the carrier it lacks; I checked this mechanically by comparing names.
  - The docstring's claims about missing carriers hold. There is no Kähler manifold carrier at the pins: a grep of Tau Ceti and Mathlib for `Kahler`/`Kähler` finds only `KaehlerDifferential`.
  - The pinned names the docstring cites exist: `TauCeti.SmoothPair.AlgebraicChart` (`SmoothPair/AlgebraicChart.lean:45`), `TauCeti.Hodge.HodgeStructureOn` (`Hodge/Structure.lean:62`), `TauCeti.RiemannSurface.MeromorphicFunction` (`RiemannSurface/FunctionField.lean:104`) and `TauCeti.holomorphicStructureSheaf` (`StructureSheaf/Basic.lean:68`).

### Library declarations opened at the pins (29)

- **By `#check`:**
  - `TauCeti.Topology.subsingleton_H_succ_of_isFlasque`
  - `TauCeti.smallSingularChainHomotopyEquiv` (`Small/Equiv.lean:423`)
  - `TauCeti.poincareHomotopy` (`Poincare.lean:91`) and `TauCeti.poincareHomotopy_apply` (:95)
  - `StarConvex.contDiffOn_poincareHomotopy` and `StarConvex.extDeriv_poincareHomotopy`
  - `TauCeti.CategoryTheory.SheafExtensionByZero.preservesFiniteLimits_sheafPullback` (`ExtensionByZero.lean:315`)
  - `TauCeti.LocalCoefficientSystem`, with `twistedCochainComplex`, `monodromyRepresentation` and `constantFunctor`
  - `TauCeti.holomorphicStructureSheaf`, `TauCeti.AlgebraicGeometry.Spaces.IsAlgebraicSpace` and `TauCeti.montel`
  - `TauCeti.deRhamCohomology.wedge` and `TopCat.smallSingularSubcomplex`
  - `IsCompactOperator.isClosed_range_pow_one_sub` and `IsCompactOperator.finiteDimensional_quotient_range_one_sub`
  - `TauCeti.mextDeriv_ofFunction_eq_zero_iff`, `TopCat.singularCochainComplex` and `circleIntegral.integral_sub_inv_of_mem_ball`
- **By grep at the pin:**
  - Mathlib:
    - `LocallyContractibleSpace` (`Topology/Homotopy/LocallyContractible.lean:81`). It is the null-homotopic-inclusion notion; nLab calls it semilocal contractibility.
    - `AlgebraicGeometry.AffineEtale` (`Sites/AffineEtale.lean:46`), whose `IsCoverDense` instance (:71) backs the C6.3 unit-map equivalence.
    - `Functor.mapDerivedCategory` (`DerivedCategory/ExactFunctor.lean:43`), `Ext.mapExactFunctor` and `Sheaf.H` (`SheafCohomology/Basic.lean:57`).
    - `AnalyticAt.hasStrictFDerivAt` (`FDeriv/Analytic.lean:145`) and `OpenPartialHomeomorph.analyticAt_symm'` (:422).
  - Tau Ceti:
    - `AnalyticAt.exists_openPartialHomeomorph` (`Analytic/Inverse.lean:106`)
    - `TauCeti.ContDiffOn.exists_openPartialHomeomorph` (`Calculus/InverseFunctionTheorem.lean:153`)
    - `ContinuousLinearMap.IsFredholm.add_of_isCompactOperator` (`Fredholm/CompactPerturbation.lean`)
    - `mextDerivₗ_eq_del_add_delBar_ofComplexManifold` (`Dolbeault/ComplexManifold.lean`)
    - `TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat.cartierDualBaseChangeIso` and `exists_isCAD_signInvariant`

### Cross-roadmap citations resolved

All 39 leads in `scratch/citations.md` resolve in the suppliers:

- **EtaleCohomologyFoundations on main**, sections G.1 :57, G.2 :105, G.3 :139, F.0.1–F.0.3 :175–231, 0.7 :439, F.1 :457, F.2.1–F.2.6 :504–645, 0.8 :565, F.3 :676 and F.4.0–F.4.6 :850–1089. Its 26 `VanishingCycles.*` names each occur in that README; `ClassicalAlgebraic.smoothTrace` is at :1159, and `properSupports` and `supportLocalization` also occur there.
- **EnhancedDerivedSheaves on main:** `ClassicalDerived.{derivedCompletion, enhancedCategory, functorCoherence, inverseLimits, tensorHom}`.
- **AlgebraicModuliForArithmeticGeometry #853:** `spaceDQCoh.*` at :9758, `ModuliDescent.coherentPresentationDescent` at :1832 and `ProjectiveBundles.projectiveBundle.projectiveSpaceCechComparison` at :477.
- **DerivedDeRhamCohomology #868:** `DeRham.d_leibniz` at :3247.
- **`TauCeti.Analysis.Fredholm.CompactPerturbation`** is a module that exists.

Main's ComplexKahlerGeometry (:471–472) and SchemeAndStackFoundations (:7392) cite this roadmap only as a consumer of theirs, so there is no reverse edge. `scratch/overlaps.md` lists no dropped id, no revision-only id and no other pull request that changes this folder.

### Ownership against open pull requests

I checked #1234, #1398, #1807 (`62d686c`, new since r27), #1808, #1854, #1285, #1375 and #1186; the only conflict is R01. bwangpj's `ComplexComparison` (#196, `4bd7237`) duplicates C-1.1 and C6. It is not in `ORDER.txt` and depends on CohomologicalPointCounting, which this roadmap may never cite, so this roadmap is the admissible owner, as recorded since r14.

### Sources: the seeded sample (15 of 15 read this round)

Texts not in the manifest were read from their public hosts through the sources service. This review edits no manifest, so the ids in the third column are scratch labels.

| Target | Locator checked | Text, line |
| --- | --- | --- |
| `IsDifferentialOperator` | EGA IV₄: §16.7 starts on p. 36. Déf. (16.8.1) is on p. 39, Prop. (16.8.8) on p. 42 (its (a)⇔(b) is the commutator criterion), and Prop. (16.8.9) with (16.8.9.2) on pp. 43–44. §16.9 starts on p. 46, so the References range pp. 39–46 is right | `ega4-4` lines 1259–1263, 1371, 1489–1495, 1526–1537, 1616 |
| `holomorphicConnectionDictionary` | Deligne LNM 163: I.2.3 on p. 6, Déf. 2.11 on p. 10, 2.15 on p. 11, Thm 2.17 and Prop. 2.19 on pp. 12–13, 2.20.3–2.21 on pp. 13–14, 2.22–2.23 on p. 14. The proof of 2.23 runs to p. 19; its Case 3 and the induction are on p. 18 | IAS `Number9.pdf` lines 230, 359, 397, 422, 442, 453–456, 490, 606–639 |
| `CurrentCalculus` | Demailly: I (2.1) on p. 13, (2.3) on p. 14, (2.6) and (2.7) on p. 15, §2.D.3 on p. 19, (3.20) on p. 25. III §1 starts on p. 129, (1.1) is on p. 130, (2.2) on p. 138, (2.3) on p. 139 | agbook lines 505, 538, 599, 617, 818, 1095, 6444, 6463, 6885, 6928 |
| `realComplexCurrentComparison` | Demailly III (1.14)–(1.15) on pp. 133–134, (1.21)–(1.22) on pp. 135–136, Wirtinger (1.24) on p. 136 | agbook lines 6611, 6671, 6761, 6781, 6818 |
| `analyticSetLocalFiniteMass` | Demailly III (2.5)–(2.6) on p. 140: Lelong's finite mass of `[A_reg]` near `A_sing` | agbook lines 6990–7000 |
| Analytic cotangent and log differentials | Freitag *Complex Spaces*: I.2 on pp. 2–5, I.6 on pp. 16–18, II.2 on pp. 47–48. Deligne I.2.10–2.15 on pp. 9–11 and I.2.22 on p. 14. Kato: see *Not verifiable* | freitag lines 12, 16, 1802–1832 |
| `complexAlgebraicTopology` | SGA 1 XII §§1–3, pp. 241–247 (local topology, separatedness, Props. 3.1–3.2). Hironaka and Bochnak–Coste–Roy: see *Not verifiable* | `sga1` lines 9445, 9491, 9593, 9610 |
| `topologicalCoefficientComparison` | Sella: the Theorem on p. 2, Lemma 0.1 on pp. 2–4, Example 0.3 on p. 5, nestings on p. 6, Step 1 on p. 7. Sella's "semi-locally contractible" is Mathlib's `LocallyContractibleSpace` (pass to interiors in either direction). Hatcher §3.H, pp. 333–334: direct cochains are lifts. Dimca: see *Not verifiable* | arXiv:1602.06674v3 lines 16–20, 45, 69, 157, 188, 228; `hatcher-at` lines 14546, 14576–14584 |
| `riemannExistence` | SGA 1 XII Thm. 5.1 on p. 251, stated for `X` locally of finite type over `ℂ` | `sga1` lines 9851, 9872–9875 |
| `artinComparison` | SGA 4: XI Déf. 3.1 and Prop. 3.3 on p. 549, Thm. 4.4 on p. 552, Var. 4.6 on p. 553, XVI Thm. 4.1 on p. 638. Milne LEC v2.21: Thm. 21.1 on p. 130, Thm. 21.5 on p. 132, Def. 21.7 and Prop. 21.8 on p. 133 | `sga4` lines 24599–24629, 24748–24818, 28326–28365; LEC lines 5001–5161 |
| The comparison as `IsIso` of a named unit map | SGA 4 XVI §4: the comparison morphism of the topos morphism `ε` (Thm. 4.1, p. 638) | `sga4` lines 28345–28365 |
| `artinComparisonCompactSupport` | SGA 4 XVII Cor. 5.3.5 on p. 705 (separated, compactifiable, any torsion sheaf); XVI 4.1(i) (proper, any torsion sheaf) | `sga4` lines 31739–31747, 28359–28361 |
| `relativeArtinComparison` | SGA 4 XVI 4.1, p. 638: `f` of finite type between schemes locally of finite type; case (i) proper, case (ii) constructible. XVII Thm. 5.3.3 on p. 704 (way-out argument), Var. 5.3.4(i) on p. 705 | `sga4` lines 28350–28362, 31733–31742 |
| `artinSmoothTrace` | SGA 4 XVIII 2.8 and Thm. 2.9 on p. 815 (existence and uniqueness of trace), Prop. 2.10 on p. 819, Thm. 3.2.5 on p. 836 (Poincaré duality) | `sga4` lines 37190, 37209–37216, 37405, 38315 |
| `adicArtinComparison` | Bhatt–Scholze, arXiv:1309.1198v2: §6.5 on p. 49 (constructible complexes on the pro-étale site), §6.7 on p. 55, §6.8 on p. 58 (`ℤ_ℓ`/`ℚ_ℓ` sheaves) | arXiv text lines 2294, 2579, 2757 |

Further locators read this round, outside the sample:

- Deligne LNM 163 II.6.5–6.6, pp. 100–101, stated for proper `X` (lines 3262, 3286).
- Schröer, the type table on p. 13: ordinary Enriques surfaces in characteristic 2 have `Pic^τ = μ₂` (`schroer-enriques` lines 543–551).

### Adversarial pass (values computed this round)

| # | Statement | Instances | Values computed | Result |
| --- | --- | --- | --- | --- |
| 1 | `montelTheorem` | `Ω = ∅`; `E = 0`; `ℓ²` with `f_n = ⟨e_n,·⟩` | **`Ω = ∅`:** `φ = id`, `g = 0` work trivially. **`E = 0`:** `Ω ⊆ {0}`, and a bounded sequence in `ℂ` has a convergent subsequence. **`ℓ²`:** `f_n → 0` pointwise, but the sup of `\|f_n\|` on `B(0,r)` is `r` for every `n`, so no subsequence converges locally uniformly | Holds; `FiniteDimensional` is needed |
| 2 | `schwartzFiniteness` | `E = F = ℂ`, `g = id`, `h = −id`; `ℓ²`, `g = id`, `h = −id`; `ℓ²`, `g = h = 0` | **`ℂ`:** `−id` is compact and `g + h = 0` has range `{0}`, closed of codimension 1. **`ℓ²`, `h = −id`:** `h` is not compact (it fixes the unit ball), and the codimension would be ∞. **`ℓ²`, `g = 0`:** `g` is not surjective, and the codimension is ∞ | Holds; compactness and surjectivity are both used |
| 3 | `holomorphicPoincare` | `dz₁∧dz₂` on `ℂ²`; `dz̄` on `ℂ`; `E = 0` | **`dz₁∧dz₂`:** `K` gives `(z₁dz₂ − z₂dz₁)/2`, whose `d` is `(dz₁∧dz₂ − dz₂∧dz₁)/2 = dz₁∧dz₂`. Adding `d\|z₁\|²` gives a `(0,1)`-part `z₁dz̄₁`. **`dz̄`:** type `(0,1)`, so it is excluded by `hα`. **`E = 0`:** every form of positive degree is 0, and `η = 0` works | Holds; the type clause in the conclusion is needed |
| 4 | `nonempty_sheafSingularComparison` | a point; `∅`; Sella's five-point space | **Point:** `A` in degree 0 and 0 above. **`∅`:** both sides 0. **Five points:** locally contractible and non-Hausdorff, with no separation hypothesis in the theorem. Sella's semi-local contractibility is equivalent to Mathlib's notion (take `int V`) | Holds |
| 5 | `IsDifferentialOperator` | `ℂ[z]`; `𝔽₂[z]`; `𝔽₃[z]` | **`ℂ[z]`:** `[d/dz, z] = 1`. **`𝔽₂`:** the `t²` coefficient of `(z+t)²` is 1, while `(d/dz)²z² = 2 = 0`. **`𝔽₃`:** `z⁴ ↦ C(4,3)z = z`. The composition map is `t ↦ t₁ + t₂` | Holds |
| 6 | `holomorphicConnectionDictionary` | `d + z dw` on `ℂ²`; a frame change `g`; `g = h⁻¹` | **`d + z dw`:** curvature `dA + A∧A = dz∧dw + 0`. **Frame change:** `A ↦ A + g⁻¹dg`. **`g = h⁻¹`:** `hAh⁻¹ + h d(h⁻¹) = Ad(h)A − (dh)h⁻¹`. **C5.2 Check:** `d + a dz/z` has horizontal sections `z^{−a}` and monodromy `exp(−2πia)` | Holds |
| 7 | `CurrentCalculus` | a smooth `k`-form; the wedge on `ℂ`; `\|z\|⁻²` | **Smooth form:** `d(α∧η) = dα∧η + (−1)^k α∧dη` gives `(−1)^{k+1}∫α∧dη = ∫dα∧η`. **Wedge:** `(a dx + b dy)∧(φ dx + ψ dy) = (aψ − bφ)dx∧dy`. **`\|z\|⁻²`:** `∫\|z\|⁻² = 2π∫dr/r = ∞` | Holds |
| 8 | `realComplexCurrentComparison` | `n = 1`; disc `q = 2`; segment `q = 1` | **Disc:** `(−1)^{2−2+1} = −1`. **Segment:** `(−1)^{2−1+1} = +1`, with `∂[a,b] = δ_b − δ_a`. **Normalization:** with README `ω = ω_D/2`, `T∧ω^p/p! = 2^{−p}T∧ω_D^p/p! = σ_T` (Demailly (1.22), (1.24)) | Holds |
| 9 | `analyticSetLocalFiniteMass` | a coordinate line; the node `xy = 0`; metric comparison | **Line:** mass on `B(0,R)` is `πR²`, and the total is ∞. **Node:** `2πR²` with no point mass. **Metrics:** `h ≤ Cg` gives `vol_h ≤ C^d vol_g` on a real `2d`-dimensional set | Holds |
| 10 | Analytic log differentials | `ℂ{z,ε}/(ε²)`; the standard log point | **`ℂ{z,ε}/(ε²)`:** `Ω = A dz ⊕ (A/ε)dε`, because `d(ε²) = 2ε dε`. **Log point:** `u ⊗ u ~ 0` for `u ∈ ℂ^×` kills `ℂ⊗ℂ^×`, leaving `ℂ·dlog t`; relative to itself it is 0. **`ℂ{z}`:** a `ℂ(z)`-derivation with `D(e^z) = 1` exists because `e^z` is transcendental, and it violates the chain rule | Holds |
| 11 | `complexAlgebraicTopology` | `P¹` with strata `{0}`, `{∞}`, `ℂ*`; the doubled origin | **`P¹`:** `ℂ*` is a union of open simplices but not a subcomplex, and the chart overlap is `z ↦ 1/z`. **Doubled origin:** the two origins have no disjoint neighbourhoods | Holds |
| 12 | `topologicalCoefficientComparison` | `𝔽₃` with monodromy −1; `𝔽₅` with transport 2; `(0,1)`; `ℤ/2` over `ℤ/4` | **`𝔽₃`:** `H⁰ = {v : 2v = 0} = 0`. **`𝔽₅`:** `2·3 = 6 ≡ 1`. **`(0,1)`:** `H⁰_c = ker(Λ → Λ²) = 0` and `H¹_c = Λ`. **`ℤ/2` over `ℤ/4`:** infinite projective dimension, so not perfect | Holds |
| 13 | `riemannExistence` | `z ↦ zⁿ` on `ℂ*`; `⊔G_m` | **`z ↦ zⁿ`:** deck group `ℤ/n`. **`⊔G_m`:** degree `n` on the `n`-th copy, so degrees are unbounded, and the source is not quasi-compact. SGA 1 assumes only local finite type | Holds |
| 14 | `artinComparison` and the `IsIso` target | `Spec ℂ`, `ℤ/4`, `K = ℤ/2`; `G_m`, `Λ(1)`, `n ≥ 3` | **`Spec ℂ`:** `Tor_i^{ℤ/4}(ℤ/2,ℤ/2) = ℤ/2` for all `i`, so `K` is in `Dᵇ_c` but not ctf. **`G_m`:** the Kummer class goes to transport `e^{2πi/n}`, and the negated isomorphism gives `e^{−2πi/n}`, which differs for `n ≥ 3`. So a `Nonempty` statement would not pin the map | Holds |
| 15 | `artinComparisonCompactSupport` | `A¹`; `G_m ⊂ A¹` | **`A¹`:** `H⁰_c = 0` and `H⁰ = Λ`. **`G_m ⊂ A¹`:** the localization connecting map is preserved. XVII 5.3.5 covers any torsion sheaf | Holds |
| 16 | `relativeArtinComparison` | `K = ⊕_{x∈ℂ} i_{x*}Λ` on `A¹`; `P¹`; `j : G_m ↪ A¹` | **`A¹`:** étale `H⁰` is the finitely supported functions; analytic `H⁰` contains `1_ℤ`, which has closed discrete infinite support, so the map is not surjective. **`P¹`:** compact, so both sides are finitely supported. **`j`:** `(R¹j_*μ_n)₀ = ℤ/n` and `R^{≥2} = 0`; `⊔G_m ↪ ⊔A¹` is quasi-compact | Holds; constructibility is needed in (i) |
| 17 | `artinSmoothTrace` | `A¹ ⊔ A¹`; `P¹` | **`A¹ ⊔ A¹`:** the trace `(a,b) ↦ a + b` is not injective for `n > 1`, since `n² > n`. **`P¹`:** `tr c₁(O(1)) = 1`. The Kummer map to `exp(2πi·/n)` commutes with the exponential sequence, so no sign enters | Holds |
| 18 | `adicArtinComparison` | a torsion integral object; `P¹` | **Torsion object:** `⊗ℚ_ℓ` gives 0. **`P¹`:** `H²` has rank 1, and `tr c₁(O(1)) = 1` at every level `ℤ/ℓⁿ` | Holds |
| 19 | R01 objects in C5.4 | `O(1)` on `P¹`; `‖e‖² = e^{−\|z\|²}`; `O(p−q)` on `E`; Enriques `K` | **`O(1)`:** `∫π⁻¹(1+\|z\|²)⁻² = 2∫₀^∞ r(1+r²)⁻² dr = 1`, and `δ[O(1)] = +1` with `a_α = g_αβ a_β` and `exp(2πi·)`. **`e^{−\|z\|²}`:** `(i/π)∂∂̄ log‖e‖ = −(1/π)dx∧dy = −c₁`. **`O(p−q)`:** `[O(p−q)] ≠ 1` but `δ = 0`. **Enriques:** `δ[K]` is nonzero 2-torsion with real image 0 | Mathematics holds; ownership conflict (R01) |
| 20 | `projectiveComplexGaga`, `properSchemeGagaPushforward` | `O(−2)` on `P¹_S`; `⊔A¹` | **`O(−2)`:** `R¹π_*O(−2) = O_S`, spanned by `z₀⁻¹z₁⁻¹`, and `0→O(−1)→O→O_p→0`. **`⊔A¹`:** SGA 1 XII 4.2 needs only local finite type | Holds |
| 21 | C4 (`properSourceMorphismAlgebraicity`, Remmert–Stein) | the dual-number source; `(x,y) ↦ (x,xy)`; points to 0 | **Dual numbers:** `Hom(Spec ℂ[ε]/ε², A¹) = ℂ[ε]/ε²` on both sides. **`(x,y) ↦ (x,xy)`:** the image `{x ≠ 0} ∪ {0}` is not closed. **Points to 0:** dimension 0 is not greater than `dim E = 0` | Holds |
| 22 | C3.2e and C3.2f | Enriques in characteristic ≠ 2; ordinary Enriques in characteristic 2 | **Characteristic ≠ 2:** `Pic⁰ = 0` and `Pic^τ = ℤ/2`. **Characteristic 2:** `Pic^τ = μ₂` (Schröer, p. 13), and `k[t]/(t²−1) = k[t]/((t−1)²)` keeps `t − 1` | Holds |
| 23 | `compactEllipticHodge` | `−d²/dθ² − 2`; `−d²/dθ² − 1` | **`−d²/dθ² − 2`, `u = 1`:** `−2 + 1 = −1 < 0`; `λ = 3`, `c = 1` works. **`−d²/dθ² − 1`:** the kernel is `⟨e^{±iθ}⟩`, and `ker(P+2) = 0` | Holds |
| 24 | C5.6–C5.7 | residues `3/4 + 3/4`; `dz/z` on `P¹` | **Residues:** `3/2 ↦ 1/2` in `[0,1)`. **`dz/z`:** residue 1 at 0 and −1 at ∞ (`w = 1/z`). Deligne needs no residue eigenvalue in `ℤ_{>0}`, and `k + Res` with `k < 0` the exponent is consistent with that | Holds |
| 25 | Worked examples 1, 4 | `P¹`; `q = e^{2πiτ}` | **`P¹`:** `h⁰(O(2)) = 3`, `h¹(O(−2)) = 1`, and `H⁰(O)` of the double point is `ℂ[ε]/ε²`. **`q`:** `dq/q = 2πi dτ` | Holds |

The rows from r20–r27 for untouched statements carry. The table above recomputes every seeded target, the four Lean headlines and the target R01 touches.

## Not verifiable

- **Kato**, *Logarithmic structures of Fontaine–Illusie* (C5.5, part of the seeded "Analytic cotangent and logarithmic differentials"): there is no open copy; the JHU Press volume is not open.
- **Dimca**, *Sheaves in Topology* (C6.1, part of the seeded `topologicalCoefficientComparison`): Springer, paywalled.
- **Hironaka**, *Triangulations of algebraic sets*, and **Bochnak–Coste–Roy**, Thm. 9.2.1 (C6.0, part of the seeded `complexAlgebraicTopology`): I found no open host.
- **Kleiman's published numbering "9.6.16"** (C3.2e): the AMS chapter is paywalled. arXiv Thm. 6.16 on p. 58 was verified in r20.

## Source issues

- none
