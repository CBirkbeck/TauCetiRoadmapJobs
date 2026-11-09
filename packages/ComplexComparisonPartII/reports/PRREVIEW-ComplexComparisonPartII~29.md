# Review of ComplexComparisonPartII (pull request #848 at 3cf1bed)

**Verdict:** needs changes

This is a full review of the same head as round 28: `scratch/changes.md` shows 0 changed lines in the folder. The previous finding (ownership of C5.4's Picard objects) is now repaired, because the pull-request description and the other open heads changed. A full reread found one new defect: C4.5 states only the smooth-affine-curve case of a general GAGA connectedness theorem. That case is the theorem that C6.2 uses and that a consumer restates.

## R01 (P2) — C4.5 states only the curve case of SGA 1 XII Prop. 2.4; the general theorem is used in C6.2 and restated downstream

**Location:** `TauCetiRoadmap/ComplexComparisonPartII/README.md:2763–2770`: "Prove `affineCurveConnectedness`: a smooth affine curve `U` over `ℂ` is connected if and only if `U^an` is connected … (SGA 1, XII, Proposition 2.4 … proves the comparison of connectedness for every scheme locally of finite type over `ℂ`; this target is its one-dimensional case".

**Claim:** the C4 headline, and the only connectedness target in the roadmap, is limited to smooth affine curves. Its own locator proves more.

**Witness:**

- **The source is general.** `sga1` line 9545 (printed p. 243): Prop. 2.4 says that for any `X` locally of finite type over `ℂ`, `X` is connected (resp. irreducible) iff `X^an` is. Line 9590 (p. 244): Cor. 2.6 gives a bijection `π₀(X^an) → π₀(X)`.
- **C6.2 uses the general form with no target.** At :4690, the equivalence "commutes with … connected components", sourced at :4699 to "SGA 1 XII … §§2–3 for components".
- **A consumer restates it.** MordellLawrenceVenkatesh (#1231 at `3756140`) states the general lemma in its own §3.10 (README :1461–1465), with "*Needs:* ComplexComparisonPartII §C4.5". It sits at `ORDER.txt:159`; this roadmap is at :39.

**Instances outside the stated target (computed):**

| `X` | Connectedness, algebraic and analytic | Why `affineCurveConnectedness` does not cover it |
| --- | --- | --- |
| node `xy = 0` | connected on both sides; components `{x=0}` and `{y=0}` on both sides | not smooth |
| `A² ∖ {0}` | connected on both sides; `T_X ≃ S³ × ℝ` | dimension 2 |

The general statement and its irreducibility clause both apply to these.

**Repair.** In C4.5 add a target with a prose name, say analyticConnectednessComparison:

- **Statement.** For every `X : Scheme.{u}` locally of finite type over `ℂ`, the map `π₀(T_X) → π₀(X)` induced by `φ_X` is a bijection, and `X` is connected (resp. irreducible) iff `T_X` is. Locators: SGA 1 XII Prop. 2.4, printed pp. 243–244; Lemma 2.5 and Cor. 2.6, p. 244.
- **Route,** following the proof of 2.4:
  1. Closed subsets of `X` and of `X(ℂ)` correspond (Cor. 2.3, p. 243).
  2. Reduce the irreducible case to `X` affine and normal.
  3. Embed `X` as a dense open of a normal projective `P`: EtaleCohomologyFoundations §G.2, SchemeAndStackFoundations §4.12 and normalization.
  4. `T_P` is connected by `properSchemeGagaPushforward` in degree 0.
  5. Remove the nowhere dense closed analytic subset `P ∖ X` using Lemma 2.5 in its general form. `puncturedRiemannSurfaceConnected` becomes the dimension-one case of that lemma.
- **Downstream edits in this roadmap.**
  - Keep `affineCurveConnectedness` as a corollary, or move it to a Check.
  - Have C6.2's components clause (:4690) and C1.9's connectedness clause (:1975) cite the new target.
  - Put the new target in the C4 headline row (:52).
  - Add it to the C4 bullet of the `Suggested.lean` docstring (:71) as not statable: it needs analytification.
- **Description.** Say that MordellLawrenceVenkatesh §3.10 should cite this target instead of restating it.
- **Checks to add:**
  - `A¹ ⊔ A¹`: two components on both sides.
  - Node `xy = 0`: connected and reducible on both sides.
  - `A² ∖ {0}`: connected on both sides.
  - `⊔_{k∈ℕ} A¹`: `π₀ = ℕ` on both sides.
  - Dual-number point: one point on both sides.

**Tested:** on the node and on `A² ∖ {0}`, which refute the claim that the curve case is enough. The new target's two clauses give the values in the table above, and C6.2's components clause and MLV §3.10 then have an owner at `ORDER.txt:39`.

## Previous findings

- **R01 (r28), the double ownership of C5.4's holomorphic Picard objects: repaired.**
  - The pull-request description now has the requested paragraph. It begins "**Ownership.** ComplexComparisonPartII C5.4 is the single owner, on every complex manifold, of the bijection from holomorphic line-bundle classes to `H¹(M, O_M^×)` …", and goes on to say that #1234 "cites C5.4 for them instead of claiming K4.P as their owner".
  - The heads that refuted the claim now agree with it:
    - **ComplexKahlerGeometry #1234,** now at `96d5e07`. Its README :111–114 has "**C5.4** supplies, as their single owner on every complex manifold, the frame-torsor bijection …", and :748–751 has "ComplexComparisonPartII C5.4 is the single owner … of three objects that K4.P consumes and does not restate". K4.P keeps only `Pic_hol(M)` on K4's classes and its isomorphism with C1.9's `analyticPicardGroup` (:843–845), which matches README :146 and :2061 here.
    - **K3Surfaces #1285,** now at `d6bce64`. Its :13–15, :175 and :407–421 consume C5.4, and `gap:integral-topology` no longer occurs.
    - **K3SurfacesAndSymplecticBoundedness #1375,** now at `dd529ba`. Its :13 and :76 name C5.4 as the owner.
    - **GeometricQuantization #1186** at `be6ed5f`, :719, as before.
  - The other ComplexKahlerGeometry revisions make no K4.P or exponential-sequence claim: #1398 at `1038b16`, #1807 at `62d686c`, #1808 at `01872e7` and #1854 at `81fee5f`.

## Verified sound

### Gate, dependency check, Lean

- **Gate.** My own run on `3cf1bed` exits 0 with every scanner at 0: `set_option=0 … readme-ids-missing=0 … depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`. The worker's `gate.md` agrees and adds `build=0`.
- **Dependency check** (`--movable`), output in full:

  ```text
  depcheck: 239 roadmaps, 2335 edges, 0 problem(s)
  ```

  It prints no UPWARD, CYCLE or `moved:` line. The roadmap is at `ORDER.txt:39`, and its later consumers are listed there: InverseGaloisAndArithmeticFundamentalGroups (54), LefschetzPencilsAndVanishingCycles (68) and MordellLawrenceVenkatesh (159).
- **Outside the folder.** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/ComplexComparisonPartII'` is empty, and the worktree is clean.
- **Elaboration.** `lake env lean` on `Suggested.lean` exits 0 with exactly four warnings, `declaration uses sorry`, at :116, :127, :154 and :172.
- **`#check @`.** I ran it on all four declarations in one scratch file. The elaborated types keep `[FiniteDimensional ℂ E]`, `[CompleteSpace E]`, `[CompleteSpace F]`, `[T2Space E]`, `[LocallyConvexSpace ℝ E]`, `IsManifold (modelWithCornersSelf ℂ E) ⊤ M` and `LocallyContractibleSpace ↑T`. They match `scratch/signatures.md` and the README statements at :1813, :1838, :2870–2899 and :388–390. I changed nothing.
- **Padding probe.** I replaced each `sorry` in a scratch copy by `simp`, `rfl`, `infer_instance`, `aesop` and `exact?`, 20 attempts in all. None closes: `exact?` fails on all four, and the others fail outright.
  - Montel at the pin is `TauCeti.montel` (`Analysis/Complex/Conformal/Montel/Basic.lean:58`). Its domain is `Ω ⊆ ℂ`, so it is one-variable only.
  - Mathlib's open mapping theorem is Banach-only (`Analysis/Normed/Operator/Banach.lean:229`).
- **Headlines.** I compared names mechanically. All 67 backticked names in the headline table (:47–54) occur in `Suggested.lean`: 4 are declared, and 63 are named in the docstring with the carrier they lack.

### Library declarations resolved at the pins

- **Tau Ceti.** I checked every `TauCeti.*` name the README backticks, 92 in all, in scratch files:
  - 31 are modules, each with an `.olean` at the pin.
  - 3 are namespaces: `TauCeti.AlgebraicGeometry`, `…FinitelyPresentedSheaf` and `TauCeti.RiemannSurface`.
  - The other 58 are declarations, and each passes `#check`. Among them:
    - `TauCeti.RiemannSurface.MeromorphicFunction` (`FunctionField.lean:104`), with `ofMeromorphic_congr` (:281), `ofMeromorphic_add` (:542) and `ofMeromorphic_mul` (:547);
    - `MeromorphicFunction.coordinate` (`RationalFunction.lean:84`) and `divisorSheaf` (`Divisor/Sheaf.lean:293`);
    - `divisorSections.mem_range_toMeromorphic_iff` (`Divisor/Meromorphic.lean:107`);
    - `SchemeWeilDivisor.globalSectionsEquivRiemannRochSpace` (`WeilDivisor/Scheme/FunctionField.lean:276`), `.sheaf` and `.sheafι` (`Scheme/Sheaf.lean:250,260`), and `.toLineBundleClass` (`Scheme/LineBundle.lean:67`);
    - `TauCeti.holomorphicStructureSheaf.smoothSheafIso` (`StructureSheaf/SmoothComparison.lean:80`) and `TauCeti.Hodge.Conjugation` (`Hodge/Conjugation.lean:96`);
    - `TauCeti.IsSemialgebraicOn` (`Semialgebraic/Function.lean:49`) and `TauCeti.LocalCoefficientSystem.twistedCochainComplex` (`Cohomology/Twisted/Basic.lean:79`);
    - `SmoothAlmostComplexStructure.mextDerivₗ_eq_del_add_delBar_ofComplexManifold` (`Dolbeault/ComplexManifold.lean:150`) and `TauCeti.CategoryTheory.SheafExtensionByZero.preservesFiniteLimits_sheafPullback`.
- **Mathlib, by `#check`:**
  - `AlgebraicGeometry.Scheme.AffineEtale` (`Sites/AffineEtale.lean:46`);
  - `LocallyContractibleSpace` (`Topology/Homotopy/LocallyContractible.lean:81`), the null-homotopic-inclusion notion;
  - `CategoryTheory.Sheaf.H`, `smoothSheafCommRing` and `AlgebraicGeometry.Scheme.IsCurveOver`;
  - `UniversallyClosed.eq_valuativeCriterion` and `ValuativeCriterion.Existence`.
- **`TopCat.singularCohomology` read at the pin** (`Cohomology/Basic.lean:129`): it is the homology of `Hom(C(X;R), M)`. With `R = ULift ℤ`, `k = ℤ` and `M = A`, its cochains are `∏_σ A`, as the headline needs.

### Cross-roadmap citations resolved

- **The 39 leads of `scratch/citations.md`:**
  - EtaleCohomologyFoundations on main: G.1 :57, G.2 :105, G.3 :139, F.0.1–F.0.3 :175–231, 0.7 :439, F.1 :457, F.2.1–F.2.6 :504–645, 0.8 :565 (`properSupports` :567), F.3 :676, F.4.0–F.4.6 :850–1089, and 0.11 :1157, where `ClassicalAlgebraic.smoothTrace` is at :1159 with "n invertible on S", automatic over `ℂ`. `supportLocalization` is at :443.
  - EnhancedDerivedSheaves `ClassicalDerived.*`, AlgebraicModuliForArithmeticGeometry `spaceDQCoh.*`, `ModuliDescent.coherentPresentationDescent` and `projectiveSpaceCechComparison`, and DerivedDeRhamCohomology `DeRham.d_leibniz`: these are where round 28 recorded them.
- **On main:**
  - `K4.ComponentwiseFiniteRankAssembly` (ComplexKahlerGeometry :517), K6.0 (:1245) and K6.1 (:1274);
  - RealAnalyticGeometry R3.1 (:676) and R3.2 (:728);
  - GeometricCurrents G1 (:137);
  - CharacteristicClasses `cechSingularCWTypeComparison` (:640);
  - AffineMorseLefschetz `finite_semialgebraic_triangulation` (README :950, `Suggested.lean:129`).
- **Overlaps.** `scratch/overlaps.md` lists no dropped id, no id that only a revision defines, and no other pull request that changes this folder.

### Ownership against open pull requests

I checked #1234, #1398, #1807, #1808, #1854, #1285, #1375, #1186 and #1231, and grepped all open heads for owners of the exponential sequence, `Pic_hol` and Riemann existence.

- bwangpj's ComplexComparison (#196) is not an admissible owner, as recorded since round 14. It depends on CohomologicalPointCounting, which this roadmap may not cite.
- The only new conflict is R01's MordellLawrenceVenkatesh §3.10.
- One note for #1234's own review: once #1234 merges, ComplexKahlerGeometry on main would cite C−1.1, C0.3, C1.9 and C5.4 from this later roadmap. That edge is #1234's to resolve. No section of this README consumes K4.P (a grep for `K4.P` finds nothing), so there is no section-level cycle here.

### Sources: the seeded sample (15 of 15)

I read each text this round. Texts not in the manifest came through the sources service into a scratch manifest; the board manifest is unchanged.

| Target | Locator checked | Text, line |
| --- | --- | --- |
| The Riemann surface of a smooth complex curve | SGA 1 XII: Prop. 3.1 on printed p. 244 (étale, smooth, separated), Prop. 3.2 on pp. 245–246 (proper), proofs to p. 247 | `sga1` lines 9572, 9594, 9604, 9639–9648, 9691 |
| Curve GAGA as named maps | SGA 1 XII: Thm. 4.4 on p. 249 with its proof to p. 250 (full faithfulness through `Hom`, then essential surjectivity through Chow's lemma and `Ext¹`). The README says the function-field and divisor maps are its own arguments | `sga1` lines 9805–9844 |
| `IsDifferentialOperator` | EGA IV₄: §16.7 on p. 36, Déf. (16.8.1) on p. 39, Prop. (16.8.8) on p. 42, Prop. (16.8.9) and (16.8.9.2) on p. 43, §16.9 on p. 46. The text's page markers are the PDF page, so printed = marker + 1 (table of contents at line 14005) | `ega4-4` lines 1259, 1371, 1489, 1526, 1537, 1616, 14005–14007 |
| `holomorphicConnectionDictionary` | Deligne LNM 163: I.2.3 on p. 6, Déf. 2.11 on p. 10, Déf. 2.15 on p. 11, Thm. 2.17 on p. 12, Prop. 2.19 on p. 13. Printed pages are on the page lines 208, 336, 401 and 438 | IAS `Number9.pdf` text lines 230, 359, 397, 422, 442 |
| `CurrentCalculus` | Demailly: §2.A on p. 13; (2.6) `⟨dT,u⟩ = (−1)^{q+1}⟨T,du⟩` and (2.7) `d[Z] = (−1)^{m−p+1}[∂Z]` on p. 15; §2.D.3 on p. 19; (3.20) on p. 25; III §1 on p. 129; (1.1) on p. 130; (1.14) on p. 133; (1.21)–(1.24) on pp. 135–136; (2.2) on p. 138; (2.3) on p. 139 | agbook lines 498, 599, 617, 818, 1095, 6444, 6463, 6611, 6761–6818, 6885, 6928 |
| `analyticSetLocalFiniteMass` | Demailly III (2.5)–(2.6) on p. 140: Lelong's finite mass near `A_sing` | agbook lines 6987–7000 |
| `complexAlgebraicTopology` | SGA 1 XII §§1–3, pp. 240–247. Hironaka and BCR: see *Not verifiable* | `sga1` lines 9405–9700 |
| `topologicalCoefficientComparison` | Sella: Theorem on p. 2, Lemma 0.1 on pp. 2–4. Sella's "semi-locally contractible" (:16–20) is equivalent to Mathlib's `LocallyContractibleSpace`: pass to the interior one way, compose with `int U ↪ U` the other. Hatcher §3.H, direct cochains as lifts, on p. 333. Dimca: see *Not verifiable* | arXiv:1602.06674v3 lines 14–20, 45, 69; `hatcher-at` lines 14546, 14576–14584 |
| `riemannExistence` | SGA 1 XII Thm. 5.1, p. 251, for `X` locally of finite type | `sga1` line 9872 |
| `artinComparison` | SGA 4: XI §3 header on p. 549 with Prop. 3.3, Thm. 4.4 on p. 552, Var. 4.6 on p. 553, XVI Thm. 4.1 on p. 638. Milne LEC: Thm. 21.1 on p. 130, Thm. 21.5 on p. 132, Def. 21.7 and Prop. 21.8 on p. 133 | `sga4` lines 24599, 24629, 24748, 24767, 24818, 28326, 28350; LEC lines 5001–5154 |
| The comparison as `IsIso` of a named unit map | SGA 4 XVI §4: comparison of the topos morphism `ε` | `sga4` lines 28345–28365 |
| `artinComparisonCompactSupport` | SGA 4 XVI 4.1(i): `f` proper, any torsion sheaf. XVII Cor. 5.3.5 on p. 705: `X` separated and compactifiable, any torsion `F` | `sga4` lines 28359–28361, 31745–31747 |
| `relativeArtinComparison` | SGA 4 XVI 4.1, p. 638: `f` of finite type between schemes locally of finite type; cases (i) proper and (ii) constructible. XVII Thm. 5.3.3 on p. 704 (way-out), Var. 5.3.4(i) on p. 705 | `sga4` lines 28350–28365, 31681, 31733–31742 |
| `artinSmoothTrace` | SGA 4 XVIII 2.8, Thm. 2.9, Prop. 2.10 and Thm. 3.2.5 | `sga4` lines 37190, 37209, 37405, 38315 |
| `adicArtinComparison` | Bhatt–Scholze arXiv:1309.1198v2: §5 starts at line 1580, §6.5 at 2294, §6.7 at 2579, §6.8 at 2757 | arXiv text lines as given |

### Adversarial pass (values computed this round)

| # | Statement | Instances | Values computed | Result |
| --- | --- | --- | --- | --- |
| 1 | `montelTheorem` | `Ω` the unit polydisc in `ℂ²`, `f_n = (z₁z₂)ⁿ`; `Ω = ∅`; `ℓ²`, `f_n = ⟨e_n,·⟩` | **Polydisc:** `‖f_n‖ ≤ 1` and `f_n → 0` locally uniformly. **`Ω = ∅`:** `φ = id` works. **`ℓ²`:** the sup over `B(0,r)` is `r` for every `n`, while the pointwise limit is 0, so no subsequence converges locally uniformly | Holds; `FiniteDimensional` is needed |
| 2 | `schwartzFiniteness` | `ℓ²`, `g = id`, `h = −P` with `P` of finite rank `r`; `ℓ²`, `h = −id`; `ℂ`, `h = −id` | **Finite rank:** `range(I − P) = ker P`, closed of codimension `r`. **`ℓ²`, `h = −id`:** `h` is not compact, and the codimension would be ∞. **`ℂ`:** the range is `{0}` and the codimension 1 | Holds; Mathlib's `IsCompactOperator` (a neighbourhood of 0 maps into a compact) is Schwartz's notion |
| 3 | `holomorphicPoincare` | `dz₁∧dz₂` on `ℂ²`; `dz̄` on `ℂ`; `E = 0` | **`dz₁∧dz₂`:** `K` gives `(z₁dz₂ − z₂dz₁)/2`, whose `d` is `dz₁∧dz₂`; adding `d\|z₁\|²` adds `(0,1)`-part `z₁dz̄₁`. **`dz̄`:** primitive `z̄`, excluded by `hα`. **`E = 0`:** forms of positive degree are 0 | Holds; both type clauses are needed |
| 4 | `nonempty_sheafSingularComparison` | a point; `∅`; Warsaw circle `W` | **Point:** `A` in degree 0. **`∅`:** 0 on both sides. **`W`:** compact Hausdorff, so `H¹_sheaf(W;ℤ) = Ȟ¹ = ℤ`, while `H¹_sing(W;ℤ) = 0`; `W` is not locally contractible | Holds; the hypothesis is needed |
| 5 | riemannSurfaceAtlas, riemannSurfaceComparison | `P¹`; `z ↦ z²` on `G_m` and on `A¹`; nodal cubic; doubled origin | **`P¹`:** transition `z ↦ 1/z` on `ℂ*`, holomorphic both ways. **`z²`:** étale on `G_m`; derivative `2z` vanishes at 0 on `A¹`. **Nodal cubic:** gradient `(3x²+2x, −2y)` vanishes at `(0,0)`. **Doubled origin:** by SGA 1 XII 3.1(viii), separatedness of `f` is that of `f^an`, so it is not Hausdorff | Holds |
| 6 | functionFieldToMeromorphic, picardAnalytification | `z/(z−1)` on `P¹`; `D = [∞]` on `P¹`; `O(p−q)` on `E` | **`z/(z−1)`:** orders `+1` at 0, `−1` at 1, 0 at ∞, divisor `[0] − [1]`. **`D = [∞]`:** `h⁰ = 2` (polynomials of degree ≤ 1) on both sides. **`O(p−q)`:** not trivial but of degree 0. Surjectivity uses `E x = max(0,−ord_x h)`, which gives `−E ≤ ord h` | Holds; no circularity, since item 2 uses only the order clause |
| 7 | `IsDifferentialOperator` | `ℂ[z]`; `𝔽₂[z]`; `𝔽₃[z]`; composition | **`ℂ[z]`:** `[d/dz, z] = 1`. **`𝔽₂`:** the `t²` coefficient of `(z+t)²` is 1, while `(d/dz)²z² = 2 = 0`. **`𝔽₃`:** `z⁴ ↦ C(4,3)z = z`, and `(d/dz)³zⁿ = n(n−1)(n−2)zⁿ⁻³ ≡ 0`. **Composition:** `t ↦ t₁+t₂` with `(t₁+t₂)^{m+n+1} = 0` | Holds |
| 8 | `holomorphicConnectionDictionary` | `d + z dw` on `ℂ²`; a frame change `g`; `g = h⁻¹` | **`d + z dw`:** curvature `dA + A∧A = dz∧dw`. **Frame change:** `A ↦ g⁻¹Ag + g⁻¹dg`. **`g = h⁻¹`:** `hAh⁻¹ + h d(h⁻¹) = Ad(h)A − (dh)h⁻¹` | Holds |
| 9 | `CurrentCalculus` | a smooth `k`-form; the wedge on `ℂ`; `[Z]` with boundary | **Smooth form:** `∫d(α∧η) = 0` gives `∫dα∧η = (−1)^{k+1}∫α∧dη`, which is Demailly (2.6). **Wedge:** `(a dx + b dy)∧(φ dx + ψ dy) = (aψ − bφ)dx∧dy`. **`[Z]`:** `d[Z] = (−1)^{2n−dim Z+1}[∂Z]`, which is (2.7) with `m = 2n`. Trace mass: README `ω = ω_D/2`, so `T∧ω^p/p! = 2^{−p}T∧ω_D^p/p! = σ_T` ((1.21)) | Holds |
| 10 | `analyticSetLocalFiniteMass` | `{w = 0} ⊂ ℂ²`; `xy = 0`; metric comparison | **`{w = 0}`:** mass on `B(0,R)` is `πR²`, total ∞. **`xy = 0`:** `2πR²`, no atom. **Metrics:** `h ≤ Cg` gives `√det ≤ C^{2d/2} = C^d` on a real `2d`-set | Holds |
| 11 | `complexAlgebraicTopology` | `P¹` with strata `{0}`, `{∞}`, `ℂ*`; the node | **`P¹`:** `ℂ*` is a union of open simplices but not a subcomplex. **Node:** a cone over two circles, contractible near the node | Holds |
| 12 | `topologicalCoefficientComparison` | `𝔽₃` with monodromy −1; `𝔽₅` with transport 2; `(0,1) ⊂ [0,1]`; `ℤ/2` over `ℤ/4` | **`𝔽₃`:** `H⁰ = {v : −v = v} = 0`. **`𝔽₅`:** `2·3 = 6 ≡ 1`. **`(0,1)`:** `0 → H⁰_c → Λ →Δ Λ² → H¹_c → 0` gives `H⁰_c = 0` and `H¹_c = Λ`. **`ℤ/2` over `ℤ/4`:** `Tor_i = ℤ/2` for all `i`, so not perfect | Holds |
| 13 | `riemannExistence` | `zⁿ` on `ℂ*`; `⊔_n G_m` | **`zⁿ`:** deck group `ℤ/n`. **`⊔_n G_m`:** degree `n` on the `n`-th copy, unbounded; SGA 1 XII 5.1 needs only local finite type | Holds |
| 14 | `artinComparison`, `IsIso` unit | `Spec ℂ`, `Λ = ℤ/4`, `K = ℤ/2`; `G_m`, `Λ(1)`, `n = 2` and `n = 3` | **`Spec ℂ`:** `K` is in `Dᵇ_c`, not in ctf. **`G_m`:** Kummer class ↦ transport `e^{2πi/n}`, and its negation gives `e^{−2πi/n}`. These coincide at `n = 2` (both −1) and differ at `n = 3`, which is why the Check takes `n ≥ 3` | Holds |
| 15 | `artinComparisonCompactSupport` | `A¹`; `G_m ⊂ A¹` | **`A¹`:** `H⁰_c = 0`, `H⁰ = Λ`, `H²_c(Λ(1)) = Λ`. **`G_m ⊂ A¹`:** same connecting map. XVII 5.3.5 covers any torsion sheaf | Holds |
| 16 | `relativeArtinComparison` | `j : G_m ↪ A¹`, `μ_n`; `K = ⊕_{x∈ℂ}(i_x)_*Λ` on `A¹` and on `P¹` | **`j`:** `(R¹j_*μ_n)₀ = H¹(S¹;μ_n) ≅ ℤ/n`, and `R^{≥2} = 0` since `D*` has cohomological dimension 1. **`A¹`:** étale `H⁰` is the finitely supported functions; `1_ℤ` is locally finite on `ℂ`, so the map is not surjective. **`P¹`:** compactness makes both sides finite | Holds; constructibility is needed in (i) |
| 17 | `artinSmoothTrace` | `A¹ ⊔ A¹`; `P¹`; identity | **`A¹ ⊔ A¹`:** `Λ² → Λ`, `(a,b) ↦ a+b`, has nonzero kernel for `n > 1`. **`P¹`:** `tr c₁(O(1)) = 1`. **Identity:** in relative dimension 0 the trace is the identity | Holds |
| 18 | `adicArtinComparison` | a torsion integral object; `P¹` | **Torsion object:** `⊗ℚ_ℓ` gives 0. **`P¹`:** `H²` has rank 1 and trace 1 at every `ℤ/ℓⁿ` | Holds |
| 19 | C5.4 Picard and exponential objects (round 28's R01) | Fubini–Study on `P¹`; `‖e‖² = e^{−\|z\|²}`; `O(p−q)` | **Fubini–Study:** `2∫₀^∞ r(1+r²)^{−2}dr = 1`. **`e^{−\|z\|²}`:** `(i/π)∂∂̄(−\|z\|²/2) = −(i/2π)dz∧dz̄ = −c₁`, with `c₁ > 0` since `i dz∧dz̄ = 2dx∧dy`. **`O(p−q)`:** `[O(p−q)] ≠ 1` but `δ = 0` | Holds; ownership settled |
| 20 | `affineCurveConnectedness` (R01) | `A¹ ⊔ A¹`; node `xy = 0`; `A²∖{0}` | **`A¹ ⊔ A¹`:** two components on both sides. **Node:** connected, with two irreducible components, on both sides. **`A²∖{0}`:** connected on both sides. The last two lie outside the target, inside SGA 1 XII 2.4 | Narrower than the source: R01 |
| 21 | `projectiveComplexGaga`, `properSchemeGagaPushforward` | `O(−2)` on `P¹_{A¹}`; `⊔_k A¹` | **`O(−2)`:** `R¹π_* = O_S`, spanned by `z₀⁻¹z₁⁻¹`. **`⊔_k A¹`:** componentwise, and SGA 1 XII 4.2 needs only local finite type | Holds |

## Not verifiable

- **Kato,** *Logarithmic structures of Fontaine–Illusie* (C5.5): the sources service found no legal copy.
- **Hironaka,** *Triangulations of algebraic sets* (C6.0): the sources service found no legal copy.
- **Bochnak–Coste–Roy,** Thm. 9.2.1 (C6.0): no open host is known.
- **Dimca,** *Sheaves in Topology* (C6.1): Springer; the sources service resolves the DOI only to a paywalled page.

## Source issues

- none
