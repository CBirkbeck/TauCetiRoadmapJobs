# Review of ComplexKahlerGeometry (pull request #1234 at 96d5e07)

**Verdict:** needs changes

A full review of the repaired head. Five of the previous review's eight findings are repaired (R01, R02, R05, R07, R08 there), one was repaired in the wrong direction and now fails the gate (R03 there, R01 here), and two are unchanged (R04 and R06 there, R02 and R03 here).

## R01 (P1) — K4.P now consumes ComplexComparisonPartII, which consumes K3–K4: a two-roadmap cycle, and the gate fails

Location: `TauCetiRoadmap/ComplexKahlerGeometry/README.md:853`, "*Needs:* ComplexComparisonPartII C−1.1 (structure-sheaf identification), C0.3 (`holomorphicBundleDictionary`), C1.9 (`analyticPicardGroup`) and C5.4 (frame-torsor bijection, holomorphic exponential sequence and its `c₁` identification)". The same supply is stated at :51–53, :105–114 (a supplier block "From TauCetiRoadmap.ComplexComparisonPartII"), :742–744, :748–758, :765–770, :775–782, :820–822, :833–834, :843–846 and :2614–2617, and in `Suggested.lean:59–61`.

Claim: the previous review's R03 asked to keep K4.P as the owner of the exponential segment and to have ComplexComparisonPartII cite it. This head does the opposite: it makes C5.4 the owner and K4.P a consumer. That creates a cycle, because ComplexComparisonPartII's own head consumes exactly the sections K4.P sits in: C−1.1 needs K3–K4, C0.3 needs K4, and C5.4 takes K4's line bundles and Chern connection. The dependency check also refuses the edge on its own terms: this roadmap is on main and ComplexComparisonPartII is an open pull request, so the edge is upward whatever the order says. The gate fails (`depcheck=1`), and no acceptance is possible while it does.

Witness: at ComplexComparisonPartII's open head, `TauCetiRoadmap/ComplexComparisonPartII/README.md:165` reads "Thus ComplexKahlerGeometry K2/K3/K4 → RealAnalyticGeometry R3.2 item 0 → C-1/C0"; its §C−1.1 ends "*Needs:* ComplexKahlerGeometry K3–K4" (`:1006`, `:1026`); C0.3's needs list has "ComplexKahlerGeometry K4" (`:1362`); the C5.4 row at `:150` says it "takes from ComplexKahlerGeometry K4 only the holomorphic line bundles and their Chern connection". Gate output on this head:

```text
UPWARD: ComplexKahlerGeometry (on main) -> ComplexComparisonPartII (#39) at README lines [105, 853]
depcheck: 238 roadmaps, 2313 edges, 1 problem(s)
```

Repair: restore K4.P as the owner, as the previous review's R03 asked, and cite no ComplexComparisonPartII section as a supplier anywhere in this folder.
- Put back the construction of 06e0a3f: 𝒪× and its exactness with a local holomorphic logarithm, the frame 𝒪×-torsor with cocycles, coboundaries and refinements, the group isomorphism `Pic_hol(M)≃H¹(M,𝒪×)` with tensor, dual, trivial-line and pullback laws, the long exact sequence through `Sheaf.H.δ`, and the identification of the connecting map with the integral `c₁` through SBC B6.1's sheaf/singular comparison with the `e_j=e_i g_ij` convention. The new `F_M` paragraph (:784–816), which uses no ComplexComparisonPartII input, stays as it is.
- Delete the supplier block at :105–114 and the sentences listed above; in the ownership sentence at :843–846 and the order paragraph at :2614–2617 name K4.P as the owner of the unit sheaf, `Pic_hol`, the exponential segment, the conditional `c₁` isomorphism and `F_M`. Revert `Suggested.lean:56–61` to the wording of 06e0a3f (the pins lack a units sheaf, hence `H¹(M,𝒪×)`; nothing about C5.4).
- The sentence at :619, where K4 supplies ComplexComparisonPartII C−1.1, C0.4 and C5.1–C5.2, is the right direction and stays.
- The two-owner residue with C5.4 is then what the previous review's R03 described: one sentence in the description's merge-order paragraph says that #848 replaces its single-owner clause at its `:150` with a citation of CKG K4.P, and that #1285 and #1186 take the exponential segment and `c₁` from K4.P. No further file in this folder changes.

Test: after the repair the dependency check must print `0 problem(s)` with no UPWARD line, and the only edges between the two roadmaps run from CKG K2–K6 into ComplexComparisonPartII. The ℂP¹ Check at :865–867 is unchanged: `c₁(O(1))·[ℂP¹]=+1`, `c₁(O(−1))·[ℂP¹]=−1`.

## R02 (P2) — The open-pair relative de Rham theory still has two owners (previous R04, not repaired)

Location: `README.md:1888–1891`: "K6.1.RelativeIntegration owns these boundaryless open-pair statements; DeRhamCohomologyAndDuality §§2.4, 3.1–3.3 and 4.1, which extend them to models with corners, consume these instances."

Claim: DeRhamCohomologyAndDuality's head is unchanged (`1b57dbe0`, the head the previous two reviews read) and still names itself the single owner and K6.1 its consumer. The description still does not name #1768. Both roadmaps cannot own the same complex; and since this roadmap is on main and #1768 is open, the only direction the gate admits is the one this README states, so the repair is on #1768's side and is recorded in the description.

Witness: `TauCetiRoadmap/DeRhamCohomologyAndDuality/README.md:70–76` at `1b57dbe0`: the relative smooth chain comparison, the relative form complex, relative integration and the compact-support formula "have a single owner, this roadmap", and the instances K6.1 uses are "consumed from §§2.4, 3.1–3.3 and 4.1"; `:695–700` repeats it under its consumers.

Repair: description only. Add one sentence to the merge-order paragraph: #1768 replaces `README.md:70–76` and `:695–702` with a citation of CKG K6.1.RelativeIntegration for the boundaryless open-pair complex, relative integration and the compact-support formula, and keeps the corners extension and §4.2. Now that (ii) is the cone construction, the two texts agree in content, so nothing in this folder changes.

## R03 (P3) — The description states no order against the four heads that conflict with this one (previous R06, not repaired)

Location: the pull-request description. Its only order statements are "Revisions of roadmaps on main whose numbering this roadmap cites, which merge first: #1186" and the depends-on line for #848.

Claim: #1398, #1807, #1808 and #1854 each change this folder's README, the first three also its `Suggested.lean`, and the overlap computation reports their heads as conflicting with this one. The description does not say which rebases on which.

Witness: the overlap computation from main `e9fd8e4` and the open heads: "#1234 and #1398 conflict in `README.md`, `Suggested.lean`", the same for #1807 and #1808, and "#1234 and #1854 conflict in `README.md`".

Repair: one sentence in the description saying, for each of #1398, #1807, #1808 and #1854, whether it rebases on this pull request or this one on it.

## R04 (P3) — K1's constructions have no Checks

Location: `README.md:116–220`, Layer K1. It constructs the reindexed complex orientation with positive chart signs (:120–135), the one-variable holomorphy criterion `φ_{z̄}=0` (:136–149), the joint holomorphic implicit map `F(z,w)` (:165–175), holomorphic submanifolds with their tangent/normal sequences (:176–179) and the eigensubbundles `T^(1,0)`, `T^(0,1)` with the involutivity criterion (:199–203).

Claim: no `**Checks.**` block falls in K1 (the blocks are at lines 317, 572, 719, 861, 1518, 1623, 1679, 1739, 1934, 2025, 2102, 2159, 2233, 2289, 2357, 2438 and 2555). Every other layer now has one; each K1 definition needs three discriminating Checks.

Repair: add a Checks block to K1 with computed values, for instance:
- On ℂ with `J=i`, `u=∂_x` has `u^(1,0)=(∂_x−i∂_y)/2=∂_z`, the `+i` eigenvector; the convention `(u+iJu)/2` would give `∂_z̄`, the `−i` eigenvector.
- `φ(z)=z̄` has `φ_z̄=1`, so `φ*dz=dz̄` is of type `(0,1)` and the criterion rejects it; `φ(z)=z²` has `φ_z̄=0` and `φ*dz=2z dz`.
- The chart change `z↦z̄` has real determinant `−1` and `z↦2z` has `4`; only the second is a chart of the complex orientation.
- `G(z,v)=v²−z` at `(1,1)` has `∂_vG=2≠0` and implicit map `F(z,w)=√(z+w)` near `(1,0)`, `F(1,0)=1`, `G(z,F(z,w))=w`.
- `{w=z²}⊂ℂ²` is a holomorphic submanifold with trivial normal line; `{z²=w³}` is not one at `0` (both partial derivatives vanish); `{|z|=1}⊂ℂ` is a real submanifold whose tangent line is not `J`-invariant.

## Previous findings

- R01 (K4.P citation loop with TopologicalKTheory) — repaired. No TopologicalKTheory citation remains; :46–50 and :2619–2621 now say "TopologicalKTheory consumes K5–K7 … and is not a supplier here", and `F_M` is built from the two exponential sheaf sequences (:784–816). TopologicalKTheory on main (`README.md:78`) still consumes CKG K5–K7, so the only edge left runs that way.
- R02 (relative integration not defined on relative chains) — repaired. (ii) at :1901–1917 is the cone of the restriction `C^•_sm(M)→C^•_sm(U)` with differential `(a,b)↦(δa,a|_U−δb)`, the cochain map `(α,β)↦(∫α,∫β)`, the quasi-isomorphism `a↦(a,0)` from the relative cochains, and the pairing `(a,b)↦a(c)−b(∂c)`; the new Check at :1941–1946 records the `(dx,0)` instance that refuted the old formula. Values recomputed in the table below.
- R03 (two owners of the exponential segment) — repaired in the wrong direction; it is R01 above.
- R04 (two owners of the open-pair theory) — not repaired; it is R02 above.
- R05 (DifferentialGeometry drift) — repaired. :75–77 reads the pinned abbreviation directly; :1265–1267 cites DG 5.5's and 12.4's agreements by content; DG1.5 is gone (:1298–1300 use Mathlib's `curveIntegral_eq_intervalIntegral_deriv`, which exists at the pin, `Mathlib/MeasureTheory/Integral/CurveIntegral/Basic.lean:148`; :1306–1308 define α and β explicitly). With DG1.5 gone, #886 need not be named.
- R06 (no order against the conflicting heads) — not repaired; it is R03 above.
- R07 (GlobalHolomorphicFunctions numbering, LieGroupoidsPoisson, ComplexComparisonPartII blowup clause) — repaired. :236–240 cite §0.3 and GH0 §2.5, :461–462 cite GH2 §4.1, :2570–2576 give the order with GH(k−2); the LieGroupoidsPoisson clause and the blowup clause are deleted. All four GH sections exist at #992's head `af99bc58` (`README.md:554`, `:1104` with `exists_finite_rank_runge_operator` at `:1159`, `:1438` with "Laurent-coefficient extraction" at `:1459`, `:2090`; the GH(k−2) rule at `:318`), and `:2128` there says "ComplexKahlerGeometry is a consumer only".
- R08 (locators and Checks) — repaired. Locators added for K4.ComponentwiseFiniteRankAssembly (:696–700), K5a.SmoothSectionMontel (own, :1062), K5b.0 (:1545–1548, :1572–1573), K6.1.RelativeIntegration (:1891–1893, :1902–1903), the Fubini–Study block (:2083–2086), K8's Iwasawa numbers (:2479–2481) and lattice steps (:2507–2510); Checks blocks added for K3, K4, K5a, K5b and K7.1 and extended for K4.P and K6.1.RelativeIntegration. Each locator was opened (below).

## Verified sound

**Gate.** The worker's run on this head: every check 0 except `depcheck=1` (R01), `FAIL`. My dependency check (`--movable`), exact output: `UPWARD: ComplexKahlerGeometry (on main) -> ComplexComparisonPartII (#39) at README lines [105, 853]` and `depcheck: 238 roadmaps, 2313 edges, 1 problem(s)`. The roadmap is on main and not in `ORDER.txt`; ComplexComparisonPartII is line 39 there. The remaining prose citations of open roadmaps (GlobalHolomorphicFunctions §0.3, GH0, GH2, GH5.1; VariationalMethods §§2.3, 3.1, 5.1–5.2; UnboundedOperators UO-D06) are in sentences, not `*Needs:*` lines, and each cited head names CKG as its consumer, as the previous reviews recorded.

**Outside the folder.** `git diff --stat origin/main...HEAD` lists only this folder's `README.md` and `Suggested.lean`.

**Lean.** `lake env lean` on `Suggested.lean` exits 0 with 25 `sorry` warnings and nothing else. The diff from 06e0a3f is 9 lines inside the module docstring; every declaration is byte-identical to the file the previous review elaborated. A scratch copy with `#check @` for all 34 declarations elaborates; each type matches its README statement, and the binder facts are as before: `dolbeaultCocycles`, `dolbeaultCoboundaries` and `DolbeaultCohomology` drop `[FiniteDimensional ℂ E]`, `lefschetzMap` keeps only the binders its body uses, and every theorem about them carries the dropped binders again. No `lemma`, `set_option` or sorry'd data.

**Padding probe.** On the scratch copy every `sorry` was replaced by `first | rfl | infer_instance | fun_prop | (simp; done) | (simp_all; done) | (norm_num; done) | decide | (exact ⟨inferInstance, inferInstance⟩) | (constructor <;> simp; done) | (intros; simp_all; done) | (aesop; done) | sorry`; the run reports 25 `sorry` warnings, so every theorem fell back. Mathlib's temperate-growth lemma covers only real exponents (`hasTemperateGrowth_one_add_norm_sq_rpow`, `TemperateGrowth.lean:327`).

**Headline theorems.** 25, all stated: NN local; DG polydisc; mixed solver; Weierstrass preparation, uniqueness, division; Rückert; Oka; Cartan; Riemann extension; regular local ring; UFD; Hartogs at a point; temperate symbol; finiteness; Serre dimensions; `∂∂̄`; Hodge decomposition (dimensions); Hodge symmetry; odd `b_k` even; Hard Lefschetz; `h^(p,q)`, `b_k` and the cohomology ring of `ℂPⁿ`; genus dictionary. The docstring's not-statable reasons hold at the pins: no units sheaf of `holomorphicStructureSheaf`; no tensor product of vector bundles (no file under `Mathlib/Topology/VectorBundle` or `Mathlib/Geometry/Manifold/VectorBundle` mentions `TensorProduct`; Tau Ceti has only complexifications); Mathlib and Tau Ceti both declare `Projectivization.instTopologicalSpace`; no complex torus or Hopf surface carrier.

**Seeded sample, locators** (source id and line; cache page = printed page for Demailly):

| Target | Locator | Source lines | Result |
| --- | --- | --- | --- |
| K3.HolomorphicStalk | Demailly II (2.1), (2.3)–(2.4), (2.7), (2.10) | `demailly-agbook` 3794–3800, 3804–3823 ("The representation (2.4) is unique", uniqueness proof), 3872–3873, 3931–3936 | supports |
| K3.MeromorphicGermField | pinned modules; GH2 §4.1 | `isFractionRing_meromorphicGerms` (`StructureSheaf/MeromorphicGerm.lean:141`), `coeff_principalPart_succ_eq_circleIntegral` (`Residue/PrincipalPart.lean:86`); GH `README.md:1438–1459` | supports |
| K4.ComponentwiseFiniteRankAssembly | Demailly V (6.6), (6.7), pp. 260–261; IV (16.8), p. 249 | 12832–12859 (flat, parallel frames on simply connected opens, universal cover), 12242–12249 (locally constant sheaf ↔ representation of π₁) | supports the fixed-rank connected case; the componentwise statement is declared own |
| K4.P | Demailly IV (4.11)–(4.12), p. 204, (4.15), p. 205; V (8.2), (9.2), p. 264 | 10201–10209 (continuous and `C^∞` function sheaves soft), 10232 (soft ⇒ acyclic), 13017–13019 (smooth lines ↔ `H¹(M,𝓔×)`), 13035–13044 (exponential sequence, connecting map an isomorphism, `c₁`) | supports |
| K5a (heading) | Hörmann–Steinbauer 4.22, 1.70; Hörmander 2.3.4–2.3.5 | `hormann-steinbauer-distributions` 3736–3741, 3759–3772, 1522–1524 | supports; Hörmander not verifiable |
| K5a.DistributionLocalStructure | as above | same | supports as written |
| K5a.SmoothSectionMontel | own; Mathlib API | `Mathlib/Analysis/LocallyConvex/Montel.lean` (`MontelSpace`, `toCompactConvergenceCLM`) | own statement declared at :1062 |
| K5b (heading) | Demailly VI (7.2), (7.3), (8.12) | 15385–15387, 15390–15395, 15523–15528 | supports finiteness and `h^(p,q)=h^(n−p,n−q)` for compact X |
| K5b.0 | Demailly VI §7, p. 309; (5.2)–(5.3), p. 300 | 15370–15373 (`D*_E=−⋆D_E⋆`, principal part of `Δ''_E` half that of `Δ_E`), 14858–14868 (`u∧⋆v=⟨u,v⟩dV`, `⋆:Λ^(p,q)→Λ^(n−q,n−p)`, `d''*=−⋆d'⋆`) | supports |
| K5b.1 | Demailly VI (7.2), (7.3), (8.12) | as above | supports |
| K6.1.RelativeIntegration | Bott–Tu §6, p. 78; own | not verifiable (uncertified); cone values below | consistent |
| K7.2 | Demailly V (15.10), VI (8.8) | 13812–13813, 15486–15487 | supports |
| Fubini–Study block | Ballmann §4 Example 5, (4.12)–(4.14), pp. 43–44; Demailly VI (4.4), p. 297 | `ballmann-kahler` 1822–1874 (pdf pages 49–50 carry printed 43–44: `i∂∂̄ ln det`, `λ_A*ω=ω` for unitary A, positivity at one point by transitivity), `demailly-agbook` 14688–14694 (`(i/2π)d'd'' log`, `∫ω^n=1`) | supports |
| K7.2.TautologicalIncidence | Knutson §1, p. 1 | `knutson-borel-weil` 12–31, 60–72 | supports |
| K7.2.RationalQuartic | own | values below | consistent |
| K7.FlatDegreeZero | Berwick-Evans–Tripathy Remark 2.1 | `berwick-evans-tripathy` 287–292 | supports |
| K8.NilpotentCentralReduction | Sakane p. 189; Raghunathan 1.13, p. 23, Cor. 1, p. 31; Angella §§4.1–4.2, p. 13 | `sakane-parallelisable` 102–115 (cites [11] p. 31 Cor. 1 and p. 23 Thm 1.13 at exactly this step), `angella-iwasawa` 701 (`b₁=4`), 717–724 (`h^(1,0)=3` in class (i), `h^(0,1)=2`) | supports; Raghunathan read only through Sakane |

Also opened: Demailly I (3.29) at 1288–1293; II (3.19) at 4286, (4.2) Remark at 4399–4403, (4.22) at 4742, (4.29) at 4842, (4.31) at 4929; VI (8.5)–(8.6) at 15442–15456, (8.17) at 15557–15560, (10.1)–(10.2) at 15715–15716; Ballmann 4.17 at 1990.

**Pinned declarations opened** (Mathlib and Tau Ceti at the manifest pins): `curveIntegral_eq_intervalIntegral_deriv`; `Complex.isCoveringMap_exp` (`Analysis/Complex/CoveringMap.lean:46`); `IsCoveringMap.existsUnique_continuousMap_lifts` (`Topology/Homotopy/Lifting.lean:489`, simply connected and locally path-connected domain; a chart ball qualifies); `PartitionOfUnity.exists_isSubordinate` (normal paracompact); `Differentiable.exists_eq_const_of_bounded`; `MDifferentiable.exists_eq_const_of_compactSpace` (`PreconnectedSpace`) and `.isLocallyConstant`; `LinearMap.BilinForm.IsAlt.exists_basis_toMatrix_eq_J` (`TauCeti/LinearAlgebra/BilinearForm/SymplecticBasis.lean:357`, over a field, as the README says); `TopCat.integralCup_self_add_self_eq_zero` (odd degree); `TopCat.singularUniversalCoefficientEquiv`, `singularKronecker`; `eulerChar_complexProjectiveSpace`; `Projectivization.contDiffOn_affineChart_symm_trans`; `LinearMap.det_restrictScalars`, `Algebra.norm_complex_eq`; `MvPolynomial.mul_esymm_eq_sum`; `PowerSeries.IsWeierstrassFactorization`; `isLocallyFiniteMeasure_riemannianVolume`; `norm_le_interp_of_mem_verticalClosedStrip'`; `SchwartzMap.fourier_convolution`; `ker_eval_eq_span_holomorphicLinearCoordinateGerm`; `instIsDiscreteValuationRingStalk`.

**Cross-roadmap citations resolved:** DifferentialGeometry 0.3, 0.4 (`SmoothForm I M ℝ 2`, `README.md:284, 294`), 5.4 (`homotopyOperator`, `:524`), 5.5, 6.2 (`:791`), 8.3–8.5, 12.1, 12.4 on main; SmoothBundlesConnections B6.1 (`:1375`), B6.2 on main; StableReduction Layer 4 on main; TopologicalKTheory `:78`, `:742` on main (consumer); GlobalHolomorphicFunctions sections as above at `af99bc58`; DeRhamCohomologyAndDuality `:70–76`, `:695–700` at `1b57dbe0` (R02); ComplexComparisonPartII `:150`, `:165`, `:1006`, `:1026`, `:1362` at its head (R01); K3Surfaces' head still takes the frame-torsor bijection from C5.4 (its supplier row), GeometricQuantization §3.3 states `Pic_hol(K/H)≃H²(K/H;ℤ)` from the generic segment. Ownership against open pull requests was checked for the objects of R01–R02 and against the five roadmaps closest in vocabulary (#848, #946, #886, #1186, #992); it was not checked against every open pull request.

**Adversarial pass.** One row per statement; each gives the instances and the values computed.

| Statement | Instances | Values computed | Result |
| --- | --- | --- | --- |
| `newlander_nirenberg` | `n=0`; `M=ℂ`, `J=i` | `E=0`: discrete M, constant φ, intertwining vacuous; `φ=id`, `dφ∘i=i∘dφ` | Pass |
| `dolbeault_grothendieck_polydisc` | `n=0`; `r₀≤0`; `n=1`, `p=q=0` | point: forms of degree ≥1 vanish, `ψ=0`; `ball c r₀=∅`; `φ=f dz̄` needs `∂̄u=f` | Pass |
| `exists_mixed_parameter_dbar_solution` | `u=z̄`; `u=z` | `(Du(1)+i·Du(i))/2=(1+i(−i))/2=1=∂̄z̄`; `(1+i·i)/2=0` | Pass |
| `weierstrass_preparation` | `f=w²−z`, `n=1`; `d=0` | `d=2`, `a₀=−z`, `a₁=0`, `u=1`; `u=f`, empty sum | Pass |
| `weierstrass_preparation_unique` | `f=w²−z` | `u′P′=P` forces `u′=1`, `a′=a` by uniqueness of division (3820–3823) | Pass |
| `weierstrass_division` | `g=w²−z`, `f=w³` | `w³=w·(w²−z)+zw`, `q=w`, `r=zw` of degree 1<2 (K3 Check) | Pass |
| `ruckert_nullstellensatz` | `k=0`; `f₁=z²`, `g=z` | `g≡0`, `m=1`; `z²=1·z²`, `m=2` | Pass |
| `oka_coherence` | `f=(z₁,z₂)`; `k=0` | relations generated by `(z₂,−z₁)`; `m=0` | Pass |
| `cartan_coherence_reducedIdeal` | `f₁=z²` on ℂ; `(zw)²` on ℂ² | reduced ideal `(z)`, not `(z²)`; gradient of `(zw)²` vanishes on all of V (K3 Check) | Pass |
| `riemann_extension` | `1/z`; `sin z/z`; `k=0` | unbounded, excluded; extends by 1; `A=U` forces `U=∅` | Pass |
| `isRegularLocalRing_holomorphicStalk` | `E=0`; `E=ℂ` | `spanFinrank 0=dim 0`; `𝔪=(z)`, dim 1 | Pass |
| `uniqueFactorizationMonoid_holomorphicStalk` | `ℂ{z,w}` | `w²−z³` irreducible: roots `±z^(3/2)∉ℂ{z}` | Pass |
| `hartogs_extension_across_point` | dim 1; ℂ² | `1/z` excluded by `2≤finrank`; `1/z` on `ℂ∖{0}` versus every function on `ℂ²∖{0}` (K3 Check) | Pass |
| `complexBesselSymbol(_temperate)` | `z=0,2,it`, real `s`, `‖ζ‖=2` | `1`; `1+‖ζ‖²`, the multiplier of `1−(2π)^(−2)Δ` in the `e^(−2πi⟨ζ,x⟩)` normalization; modulus `exp(Re(it/2·log))=1`; `(1+‖ζ‖²)^(s/2)`; wrong symbol `1+‖ζ‖` gives 3 not 5 | Pass |
| `DolbeaultCohomology` (defs) | ℂ; ℂ×; `q=0` | `h dz` ∂̄-closed of type `(1,0)`, excluded by the type projection; `dz̄/z̄=∂̄log|z|²`, `∮dz̄/z̄=−2πi`; coboundaries `⊥` | Pass |
| `finiteDimensional_dolbeaultCohomology` | `M=ℂ` | `H^(0,0)` = entire functions, infinite-dimensional: compactness needed | Pass |
| `finrank_dolbeaultCohomology_serre` | ℂP¹; Hopf | `h^(0,0)=1=h^(1,1)`, `h^(1,0)=0=h^(0,1)`; `h^(0,1)=1=h^(2,1)`, `h^(1,0)=0` | Pass |
| `del_delBar_lemma` | Kähler form of `ℂ/Λ`; `p+1>n` | `∫ω>0`, not exact; `α=0`, `γ=0` | Pass |
| `finrank_deRhamCohomology_eq_sum_dolbeault` | ℂP¹ `k=2`; `ℂ/Λ` `k=1`; `k>2n` | `1=0+1+0`; `2=1+1`; `0=0` | Pass |
| `finrank_dolbeaultCohomology_symm` | Hopf | `0≠1`, not Kähler | Pass |
| `even_finrank_deRhamCohomology_odd` | Kodaira–Thurston; annulus | `b₁=3`, `N_J≠0`; `b₁=1`, has boundary | Pass |
| `hard_lefschetz`, `lefschetzMap` | ℂP² `k=0`; `S²×S²`; `j=0` | `1↦[ω]²≠0`; `(aσ₁+bσ₂)²=2ab`, `σ₁²=0`; identity; degree `k+2(n−k)=2n−k` | Pass |
| `finrank_dolbeaultCohomology_complexProjectiveSpace` | `n=0,1` | `(0,0)↦1`; `(1,1)↦1`, `(1,0)↦0`, `(2,2)↦0` | Pass |
| `finrank_deRhamCohomology_complexProjectiveSpace` | `n=2` | `b₀=b₂=b₄=1`, odd and `b₆` zero, `χ=3` | Pass |
| `integralCohomology_complexProjectiveSpace`, `integralCupPow` | `S²∨S⁴`; `u=2g`; `n=0` | `u²=0` fails `k=2`; fails `k=1`; `u=0`, `u⁰=1` generates | Pass |
| `finrank_dolbeaultCohomology_riemannSurface` | two elliptic curves; ℂP¹ | `2=2`, `4=2·2`; `0=0`, `0=0` | Pass |
| `IsKahler`, `polydisc` | `(ℂ,dx∧dy,i)`; `r=−1`; `n=0` | `ω(v,iv)=|v|²>0`, closed, `N=0`; `ball=∅`; point | Pass |
| K3 Checks: node and cusp | `t↦(t(t²−1),t²−1)`; `t↦(t³,t²)` | `z²=t²(t²−1)²=(t²−1)²(1+(t²−1))=w²+w³`; `t=±1↦0`; `t⁶=t⁶` | Pass |
| K3.MeromorphicGermField example | `e(z)=2z` | `1/z↦1/(2z)`, back along `w↦w/2`: `1/w`; `1+z↦1+2z`, value 1 | Pass |
| K4 Checks: Chern connection | `h=e^(−|z|²)`; `g=e^z`; `g=2` | `A=∂log h=−z̄dz`, `F=dz∧dz̄`, `(i/2π)F=(1/π)dx∧dy`; `A′=A+dz`; `h′=4h`, `A′=A` | Pass |
| K4 Checks: monodromy | `d−a dz/z` | parallel sections `cz^a`, loop gives `e^(2πia)`; `a∈ℤ`: gauge `z^a` | Pass |
| K4.ComponentwiseFiniteRankAssembly | `ℂ⊔ℂ`, ranks 0 and 2; empty base | fibres `0` and `ℂ²`, no single F; zero objects | Pass |
| K4.P segment and `c₁` | point; ℂP¹; `ℂ/Λ` | `0→0→0→0→0`; `c₁(O(±1))=±1`; `Pic⁰=ℂ/ℤ²≅Hom(ℤ²,U(1))` | Pass (ownership: R01) |
| K4.P `F_M` | ℂP¹; `ℝP²`; `S¹`; `S²` | both sides `ℤ`, `O(1)↦+1`; `H¹(ℝP²;ℤ)=0` so the Bockstein `H¹(ℤ/2)→H²(ℤ)=ℤ/2` is injective, `c₁(L_ℂ)=β(w₁)≠0`; `H¹(S¹;ℂ_const)=ℂ` versus acyclic `C⁰_ℂ`; `H¹(S²;ℤ/2)=0` misses `O(k)` | Pass |
| K4.P exactness route | chart ball | ball simply connected and locally path-connected, so the lifting lemma applies to `exp` onto `{z≠0}` | Pass |
| K5a.DistributionLocalStructure | `m=2,3`; `u=∂_zδ⊗1` | `D²t_+=δ`, `t_+²/2∈C¹`; `z·u=−δ⊗1=(−1)¹1!u_(1)` | Pass |
| K5a Checks: density, tests, Sobolev | `x↦−x`; `y=2x`; delta on `Sⁿ`, `S¹` | `|dx|` fixed, `dx` negated; `∫φdy=2∫φdx`; `∫(1+‖ζ‖²)^s dζ<∞` iff `s<−n/2`, `s<−1/2` on `S¹`, weight `(…)^(2s)` moves it to `s<−n/4` | Pass |
| K5b.0 | `H=I` | `|dz|²=2`; `dz♯=2∂_z`; `∂̄*`: `(p,q)→(n−q,n−p)→(n−q+1,n−p)→(p,q−1)`; `σ(Δ_∂̄)=½σ(Δ_d)` | Pass |
| K5b Checks: volume, adjoint, stars | ℂ, ℂ²; `f dz̄`; `*dz` | `(i/2)dz∧dz̄=dx∧dy`, `ω²/2!=dx₁dy₁dx₂dy₂`; `Δ_∂̄g=−2∂_z∂_z̄g=−½Δ_flat g`, symbol `½|ξ|²` (`¼` if `|dz|²=1`); `*dz=dy−i dx=−i dz` type `(1,0)`, `barStar dz∝dz̄` | Pass |
| K6.0 Checks | ℂP¹ scaled `√π`; `H=diag(1+z₂+z̄₂,1)` | `H=(1+π|u|²)^(−2)`, `|H−1|≤2π|u|²`; `dω=(i/2)(dz₂+dz̄₂)∧dz₁∧dz̄₁≠0` | Pass |
| K6.1 Checks | elliptic curve; Hopf; annulus; `S²×S²` | `2=1+1`; `b₁=1` odd; `b₁=1` with boundary; `σ₁²=0` | Pass |
| K6.1.RelativeIntegration (ii), cone | `d²`; `(ψdx,Ψ|_U)` on `[−1,1]`; `(dx,0)` | `(δδa,(δa)|_U−δ(a|_U)+δδb)=(0,0)`; `d(Ψ,0)=(ψdx,Ψ|_U)`, pairing `1−(1−0)=0`, the wrong sign gives 2; `d(dx,0)=(0,dx|_U)≠0`, `(∫dx,0)([1,2])=1` with no constraint from the quotient | Pass |
| K6.1.RelativeIntegration (ii), pairing well defined | `c=∂e+c_U`, cocycle `(a,b)` | `a(∂e)+a(c_U)−b(∂c_U)=(δa)(e)+(a|_U−δb)(c_U)=0` | Pass |
| K6.1.RelativeIntegration (iii) | `N=ℝ`, `K=[−1,1]`, `[−3,3]`; `S¹` | `∫ψ=1` both; `2π`, reversal negates both sides | Pass |
| K7.1 comparison | `v=(3,4)`, `2iv`; `(1,i)`; `n=1`, `(0,1)` | `(3/5,4/5)`, `i(3/5,4/5)`, chart `4/3`; chart `i` versus `−i` for the conjugate map; value 0 in the chart `v₁≠0` | Pass |
| Fubini–Study | `w=(1,i)/√2`; `z=(1,0)`; `c=2`; `diag(1,2)`; `∫_(ℂP¹)` | coefficient of `dw₁∧dw̄₂` is `(i/2π)(−(i/2)/4)=1/(16π)`; `h(e₁,e₂)=i/(8π)`; `H_z(v,v)=1/π`; `|c|⁴=16` cancels; `4/π`; `∫(1/π)(1+|w|²)^(−2)dλ=1` | Pass |
| K7.2 cohomology Checks | `n=0,1,2` | `u=0`, `u⁰=1`; `h^(2,2)(ℂP¹)=0`; `S²∨S⁴` | Pass |
| K7.2.TautologicalIncidence | overlap; `d=2`, `k=1`; `k<0`; `exp(v₁)` | `a′=az_k`, `z′_i=1/z_k`; `(t·F)=t⁻¹F`; `F(v)=tF(tv)→0`; no homogeneity | Pass |
| K7.2.RationalQuartic | `n=1,2` | `(a,b,c,d)↦(a,b,0,c,d)`; pair sums of `{0,1,3,4}` give `0…8`; `10−9=1`, `x₀x₃−x₁x₂↦0` | Pass |
| Genus dictionary and normal form | `ℂ/(ℤ+τℤ)`; `[[0,2],[−2,0]]`; `[[1,0],[0,1]]` | cup matrix `[[0,1],[−1,0]]`, det 1; det 4, image of `ω(x,−)` is `2ℤ`; `ω(e₁,e₁)=1` not alternating | Pass |
| K7.FlatDegreeZero | `ρ=exp(aλ)`; square torus; holonomy | `u=α`, `v=αx−βy`, recovers `α+iβ`; `exp(πix)` gives `−1`, `1`; `(λ,v)~(0,ρ(λ)⁻¹v)` | Pass |
| K8.NilpotentCentralReduction | `H₃(ℝ)`, `H₃(ℂ)` | `log(1,1,1)=X+Y+½Z` (`(g−I)²=xyZ`), `exp(X+Y)` has `z=½∉ℤ`; `A=exp(ℝZ)`, `Γ∩A≅ℤ`, `G/A≅ℝ²`; `Γ∩A=ℤ[i]`, fibre `τ=i` | Pass |
| K8 Checks: Frölicher | Iwasawa; torus; Hopf | `3+2=5>4`; `d₁[φ₃]=−[φ₁∧φ₂]≠0` in `E₁^(2,0)`; `2n=b₁`; `0+1=1=b₁` and `1+1+1+1=4=Σb_k` | Pass |

That is 55 rows computed; none fails on the mathematics. R01 and R02 concern ownership and direction, R03 the description, R04 missing Checks.

## Not verifiable

- Hörmander, *The Analysis of Linear Partial Differential Operators I*, Theorems 2.3.4–2.3.5: uncertified; second-edition numbering assumed.
- Griffiths–Harris ch. 0, Wells and Webster: uncertified, not opened.
- Raghunathan, Theorem 1.13 and Corollary 1: uncertified; read only through Sakane's citation at `sakane-parallelisable` 112–113.
- Bott–Tu §6, p. 78: uncertified; the relative complex was checked by computation instead.
- Nakamura's Hodge numbers, which Angella cites: not opened.
- The heads of #1398 and #1808 were not read beyond the conflicts the overlap computation reports; #1807 and #1854 were not read this round.
- Ownership was not checked against all 468 open pull requests.
- The adversarial rows check instances; they are not proofs.

## Source issues

- none
