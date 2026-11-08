# Review of CharacteristicClasses (pull request #1808 at 0439c6d)

**Verdict:** needs changes

Scope of this round: a full review of `TauCetiRoadmap/CharacteristicClasses/` at 0439c6d. Against main the folder differs only by the new subsection C1.5a and the rewritten AlgebraicTopology scope lines (README lines 59–68, 693–697, 718–741, 742–753); `Suggested.lean` is unchanged. The pins of the worktree's manifest are Mathlib 1b1ccf4b / Tau Ceti 2fd255d9, and several findings below come from that pin: Tau Ceti now carries objects the README and the Lean docstring say do not exist.

## R01 (P1) — the gate's build step fails on Lake's module-system warning

Location: `TauCetiRoadmap/CharacteristicClasses/Suggested.lean:1`, `import Mathlib`.

Claim: the worker's gate reports `build=2 FAIL`: Lake warns twice that the file imports `Mathlib`, a module-system package, without `module`. The file elaborates (`lake env lean`: exit 0, two `sorry` warnings), so this is the gate's warning rule, not an elaboration error, but the brief forbids acceptance while the gate fails.

Witness: gate output "imports `Mathlib` from package `mathlib`, which is designed for use with the module system; consider adding `module`" (twice).

Repair, tested on a scratch copy of the file (exit 0, only the two `sorry` warnings, with and without `--root`): replace line 1 by

```lean
module

public import Mathlib
```

keep the module docstring, and replace `noncomputable section` (line 31) by

```lean
@[expose] public section
noncomputable section
```

(`public section` needs no `end`; the `@[expose]` form keeps the definitions unfoldable by importers).

## R02 (P2) — the docstring's "not statable" reasons are false at the pin, and the Thom-class headline is statable but absent

Location: `TauCetiRoadmap/CharacteristicClasses/Suggested.lean:10–23`, "there is no Thom-class carrier … no orientation local system on a vector bundle at the pins", "no Euler class or fundamental class of a manifold at the pins", "no characteristic class, curvature form or de Rham comparison for bundles".

Claim: at Tau Ceti 2fd255d9 the following exist (all `#check`ed from a scratch importer, signatures recorded in my scratch log):

- `TauCeti.IsThomClass F E u` (`Topology/VectorBundle/EulerClass.lean:245`): a class of `(thomPair F E).singularCohomology R k M (finrank ℝ F)` restricting to a generator on every fibre pair;
- `TauCeti.eulerClass R k M F E n` (`EulerClass.lean:356`), with `eulerClass_naturality`, `eulerClass_pullback`, `eulerClass_eq_zero_of_forall_ne_zero` (a nowhere-zero continuous section kills it) and `eulerClass_trivial_eq_zero`;
- `TauCeti.VectorBundleOrientation.exists_isThomClass` (`Orientation/ThomClass.lean:186`): an oriented bundle over a **compact** base has a Thom class with coefficients in any commutative ring, and `exists_isThomClass_of_compactSpace` (`MayerVietoris/Basic.lean:612`) for coefficient rings with a single unit without orientation;
- `TauCeti.VectorBundleOrientationCover.signLocalSystem F E R hι : LocalCoefficientSystem R B` (`Orientation/LocalSystem.lean`), exactly the README's `o(E)` (line 169), with `signLocalSystemFiberEquiv`;
- `TauCeti.isZero_singularHomology_thomPairOver_biUnion` and the directed-union vanishing of `Topology/VectorBundle/MayerVietoris/DirectedUnion.lean` ("no compactness, separation or paracompactness of the base");
- `TauCeti.evalFundamentalClass` (`AlgebraicTopology/Cohomology/FundamentalClass.lean:88`): evaluation `⟨c, f_*[N]⟩` on the fundamental class of a compact oriented manifold (`HomologicalOrientation`).

What is genuinely absent at the pin (I searched): a relative cup product `H^k(E) ⊗ H^r(E,E₀) → H^{k+r}(E,E₀)` (so the Thom *isomorphism* is not statable), an Euler characteristic of a space (so `e(TM)[M]=χ(M)` is not statable), and any infinite Grassmannian or `BU(r)` carrier (so C3.4/C3.6/C5.2 remain unstatable).

Statable and absent: C2.1's headline in Milnor–Stasheff Thm 10.4's first half, **existence and uniqueness of the Thom class of an oriented real vector bundle over a paracompact Hausdorff base** (the pinned theorem has `[CompactSpace B]`; the roadmap's own content is the general base through the directed-union argument), in the shape of `exists_singularCohomology_thomPair_fiber` (`Orientation/ThomClass.lean:121`): for `o : VectorBundleOrientation F E ι`, `hι : Fintype.card ι = finrank ℝ F`, `[ParacompactSpace B] [T2Space B]` (or no base hypothesis at all if the route is the directed-union one), a unique `u` with `IsThomClass F E u` whose fibre restrictions are read off from `o` as in that theorem's two conjuncts. Also statable now, as a corollary rather than a headline: C2.2's "vanishing when a nowhere-zero section exists" is `eulerClass_eq_zero_of_forall_ne_zero` itself and must be cited, not planned (see R03).

Repair: rewrite the docstring to name the carriers that exist and what is still missing (relative cup, Euler characteristic, classifying-space carriers); state the general-base Thom-class existence-and-uniqueness theorem against `TauCeti.IsThomClass` and `TauCeti.VectorBundleOrientation` with `sorry`; keep "Thom isomorphism" and "`e(TM)[M]=χ(M)`" in the not-statable list with the correct reasons.

## R03 (P2) — C1.0, C2.1–2.2 and the DGFloer bullet restate objects the pinned Tau Ceti already has, and line 78 says the library lacks what it has

Location: `TauCetiRoadmap/CharacteristicClasses/README.md:78` "the pinned Tau Ceti has no Serre-fibration declaration, and none is cited here by name"; lines 217–247 (C1.0); lines 825–856 (C2.1–C2.2).

Claim, each checked at Tau Ceti 2fd255d9 with file and line:

- Serre fibrations: `TauCeti.TopCat.serreFibrations` (`Topology/Homotopy/SerreFibration/Basic.lean:107`), `mem_serreFibrations_iff_cube`, `IsCoveringMap.mem_serreFibrations`, and in `SerreFibration/FiberBundle.lean` `TauCeti.hasHomotopyLiftingProperty_cube_of_exists_trivialization` (every locally trivial map, no base hypothesis) and `TauCeti.TopCat.mem_serreFibrations_proj` (every native `FiberBundle F E` projection); `SerreFibration/RelativeCube.lean` gives the relative lifting "needed … when constructing the fibration homotopy sequence". Line 78 is false at the pin, and the bullet's "DGFloer Layer1 item2 owns the Serre-fibration membership interface for locally trivial TopCat morphisms and for native `FiberBundle` projections" plans what the library proves. (DGFloer on main, line 376, itself says these APIs exist at a later Tau Ceti snapshot than its own pin.)
- C1.0 frame bundle: `TauCeti.OrthonormalFrameBundle 𝕜 F E V` (`Topology/VectorBundle/OrthonormalFrame/Basic.lean`) with the right action of `unitary (V →L[𝕜] V)`, freeness (`smul_eq_self_iff`, line 160), transitivity on fibres (`exists_smul_eq_iff`, line 172), its topology and `continuous_iff` (lines 227–232), local trivializations from linear trivializations by Gram–Schmidt (`orthonormalFrameBundle`, `exists_trivialization`, lines 402–499; `GramSchmidt.lean` is the continuous Gram–Schmidt), and the associated-bundle reconstruction `associatedHomeomorph` (line 564). C1.0's "construct the orthonormal frame principal O(n) bundle by Gram–Schmidt … continuity, local chart/trivialization and division equations, freeness and transitivity on each fibre, reconstruction of the vector bundle as the associated standard module" is this file. `Topology/FiberBundle/Principal.lean` has the principal-bundle mixin, `division` and `coordChange_eq_mul`.
- C1.0 orientation cover: `TauCeti.VectorBundleOrientationCover` (`Orientation/Cover.lean`) with sheets, `trivializationHomeomorph` (the local two-sheet description, line 262), `isCoveringMap_proj` (line 298), `ncard_fiber` (line 340), `deck`; and `TauCeti.OrthonormalFrameBundle.toOrientationCover_eq_toOrientationCover_iff` (`Orientation/OrthonormalFrame.lean`): two frames give the same point of the cover iff they differ by `g` with `0 < det g`. That is C1.0's "identify the determinant-sign orientation double cover with the frame quotient by SO(n), prove its local two-sheet description independently of a universal classifier", at the pin. `Orientation/Tautological.lean` even orients the tautological bundle over the orientation cover "in particular … on finite oriented Grassmannians" (C1.1a).
- C2.1–C2.2: see R02's list; "Euler naturality", "vanishing when a nowhere-zero section exists", "the mod2 form without an orientation" (over compact bases), and the finite-union Mayer–Vietoris gluing (`exists_singularCohomology_thomPairOver_biUnion`) exist.

Repair: in the Carriers section replace line 78 by the citation of `TauCeti.TopCat.serreFibrations`, `mem_serreFibrations_proj` and `hasHomotopyLiftingProperty_cube_of_exists_trivialization` (file `Topology/Homotopy/SerreFibration/{Basic,FiberBundle}.lean`), and reduce the DGFloer bullet to what is not at the pin (the homotopy exact sequence and the spectral sequence); in C1.0 consume `OrthonormalFrameBundle`, `GramSchmidt`, `VectorBundleOrientationCover` and `toOrientationCover_eq_toOrientationCover_iff` by name and keep only the metric-change square root, the smooth versions and the DG comparison; in C2.1–C2.2 consume `IsThomClass`, `eulerClass`, `eulerClass_pullback`, `eulerClass_eq_zero_of_forall_ne_zero`, `exists_isThomClass`, `exists_isThomClass_of_compactSpace`, the Mayer–Vietoris and directed-union lemmas and `signLocalSystem`, and keep as targets the general-base existence, uniqueness, the local-system Thom isomorphism and the Gysin sequence.

## R04 (P2) — C6.1 and C7.1 restate the pinned series, genus polynomials and multiplicative sequences, and `Suggested.lean` redefines the L-series

Location: `README.md:1761–1773` ("Construct universal multiplicative sequences from rational constant1 power series through symmetric-polynomial/root descent … Define `Td(x)=x/(1−e^(−x))`, `Â(x)=(x/2)/sinh(x/2)` and `L(x)=x/tanh x` as regular formal series, with the displayed quotients proved by multiplying their denominators; `toddSeries` is Mathlib's Bernoulli series … `lSeries` is its rescaling by 2 minus x"); `README.md:1847–1850` ("Prove the coefficient formulas Td=1+c₁/2+(c₁²+c₂)/12+c₁c₂/24, L=1+p₁/3+(7p₂−p₁²)/45+…, Â=1−p₁/24+(7p₁²−4p₂)/5760+…"); `Suggested.lean:34–50`.

Claim: at Tau Ceti 2fd255d9, `RingTheory/PowerSeries/CharacteristicSeries.lean` defines `TauCeti.hirzebruchLSeries A := rescale 2 (bernoulliPowerSeries A) + X` (line 245) and `TauCeti.aHatSeries A` (line 147), proves the displayed quotients by multiplying the denominators (`hirzebruchLSeries_mul_sub`, `aHatSeries_mul_sub`, `bernoulli'PowerSeries_mul_one_sub_exp_neg`), their characterisations (`eq_hirzebruchLSeries_iff`), evenness and the coefficients `coeff_hirzebruchLSeries` (`2ⁿ Bₙ/n!` for `n ≠ 1`), `coeff_two_/coeff_four_` of each; `MultiplicativeSequence.lean` defines `PowerSeries.multiplicativeSequence Q n k` with the root description (`mk_aeval_multiplicativeSequence`), the Whitney convolution (`aeval_multiset_esymm_add_multiplicativeSequence`), normalisation, stability under a zero root, the even-series root description in the squares of the roots (`aeval_multiset_esymm_sq_multiplicativeSequence`) and the explicit `K₁, K₂, K₃` (`multiplicativeSequence_three_right`); `GenusPolynomials.lean` proves `Td₁, Td₂, Td₃`, `L₁ = p₁/3`, `L₂ = (7p₂−p₁²)/45`, `Â₁ = −p₁/24`, `Â₂ = (7p₁²−4p₂)/5760` (`multiplicativeSequence_cartier_hirzebruchLSeries_two` and siblings). The file's `lSeries` is the same series: the scratch probe proved `lSeries = TauCeti.hirzebruchLSeries ℚ` by `ext n; rcases n` and `bernoulli_eq_bernoulli'_of_ne_one` (no `sorry`). `chernRootValue`/`pontryaginRootValue` are `MvPolynomial.esymm` evaluated at the roots and their squares, the objects `multiplicativeSequence` is built on.

Repair: in C6.1 and C7.1 cite these declarations by name and file under `From Tau Ceti`, keep as targets only what is not there (the degree-twelve `L₃`, the bundle-level classes `Td(E)`, `L(E)`, `Â(E)` and their Whitney laws on actual bundles, the Chern character); in `Suggested.lean` delete `toddSeries`, `lSeries`, `chernRootValue` and `pontryaginRootValue` and, if the `L₃` coefficient stays, state it through `TauCeti.hirzebruchLSeries` and `PowerSeries.multiplicativeSequence` (but see R05).

## R05 (P3) — the two sorried theorems are not headlines

Location: `Suggested.lean:56–65` (`lSeries_root_coefficient_six`), `Suggested.lean:72–78` (`twice_even_product_correction_eq_zero`).

Claim: `lSeries_root_coefficient_six` computes one small value: with `q₁ = 1/3`, `q₂ = −1/45`, `q₃ = 2⁶B₆/6! = 64/(720·42) = 2/945`, the pinned `multiplicativeSequence_three_right` gives `K₃ = q₃e₁³ + (q₁q₂ − 3q₃)e₁e₂ + (q₁³ − 3q₁q₂ + 3q₃)e₃ = (2e₁³ − 13e₁e₂ + 62e₃)/945`, the stated identity; it is the degree-three sibling of `TauCeti.multiplicativeSequence_cartier_hirzebruchLSeries_two`, obtained from that lemma, `coeff_hirzebruchLSeries` and `aeval_multiset_esymm_sq_multiplicativeSequence`. `twice_even_product_correction_eq_zero` is a theorem about free variables only (two arbitrary power series over an arbitrary commutative ring) whose conclusion is algebra on its hypothesis: `coeff_{2k}(PQ) − Σ_{i≤k} P_{2i}Q_{2(k−i)} = Σ_{i odd} P_iQ_{2k−i}`, and `2·` of that is `0` by `hodd`. Neither names an object of the roadmap. The one-tactic probe (`simp`, `simp [PowerSeries.coeff_mul]`) closes neither, so they are not one-line padding, but the brief's headline rule excludes both.

Repair: delete both from `Suggested.lean` (the README keeps the `L₃` identity in C7.1 and the 2-torsion correction in C3.3 as targets); the file then states the Thom-class theorem of R02 and otherwise says in its docstring what is not statable.

## R06 (P3) — C5.1 cites LieGroups "Layer5A", which exists only in an open revision

Location: `README.md:1378`, "Consume [LieGroups Layer5A and Layer6] for compact reductivity, the invariant positive form, …".

Claim: LieGroups on main (`TauCetiRoadmap/RepresentationTheory/LieGroups/README.md`) has Layers 0–9 with no "5A" (its Layer 5 is "simply-connected covers and the enveloping algebra", Layer 6 "maximal tori, the Weyl group, and Weyl integration"). "Layer 5A: compact Lie-algebra metric and splitting" appears only in the open revision of LieGroups (pull request #1051, README line 641), and a revision of an existing roadmap is never a dependency.

Repair: cite the main-branch section that owns the invariant positive form and the centre/semisimple splitting (Layer 6 and the compact-group conventions of its "Standing conventions"), or, if main has no owner, state the compact invariant form and orthogonal splitting as a C5.1 input with its hypotheses.

## R07 (P3) — two cited works are not in the sources manifest

Location: `README.md:2055` (Cohen, *The Topology of Fiber Bundles*, Chapter 1 §2.2 and Chapter 3 §4.2) and `README.md:2058` (Bott–Tu, *Differential Forms in Algebraic Topology*, §§6, 11–14, 20–23).

Claim: `packages/CharacteristicClasses/sources.toml` has nine entries (hatcher-vbkt, zentner-instanton-sheet2, tomdieck-at, dupont-ccc, dupont-ln, may-concise, and the three uncertified Milnor items) and no entry for Cohen or Bott–Tu. Cohen's notes are a legal author-page copy (the sources cache already holds the text under id 1416c4bf…, from math.stanford.edu); I verified the locators there: §2.2 "The tangent bundle of Projective Space" line 904 with `τRPⁿ ≅ Hom(γ¹, γ¹⊥)` and `τRPⁿ ⊕ ε¹ ≅ Hom(γ¹, ε^{n+1})` lines 925–941, Theorem 3.22 `w(RPⁿ) = (1+a)^{n+1}` line 3480, §4.2 "Normal bundles and immersions" line 3568, Proposition 3.27 line 3583 and `w̄(RP^{2^k}) = 1 + a + … + a^{2^k−1}` line 3590, which is C7.3a as written. Bott–Tu is a Springer book: record it `uncertified` by locator.

Repair: add a `cohen-fiber-bundles` entry (author-page, certified) and a `bott-tu` entry (uncertified, DOI 10.1007/978-1-4757-3951-0) to the manifest.

## R08 (P3) — the pull request changes two files outside its roadmap folders

Location: `Completed/ArithmeticDirichletSeries/README.md:331` and `TauCetiRoadmap/SymplecticGeometry/README.md:77` (one "supplies" → "consumes" wording change each; gate `outside-folder=2`).

Claim: neither folder is named as the pull request's own, so each is a finding under the brief's rule. This is a pull-request-level matter, identical to the one already raised on the PurityOfBranchLocus review of this pull request; it needs no edit inside `TauCetiRoadmap/CharacteristicClasses/`.

Repair: list the two folders as the pull request's own, or drop the two commits (e591d103, 61e5385e) from the branch.

## Verified sound

**Gate and build.** Gate at 0439c6d: `set_option=0 … build=2 outside-folder=2 FAIL` (both treated above). `lake env lean TauCetiRoadmap/CharacteristicClasses/Suggested.lean`: exit 0, two `sorry` warnings (lines 56, 72). Dependency check (`gate --depcheck … --movable`): `depcheck: 242 roadmaps, 2391 edges, 0 problem(s)`; no UPWARD or CYCLE line. The worker's `roadmaps resolve` found no dangling citation or Lean name, and I confirmed every backticked name of the roadmap's own (`chernRootValue`, `pontryaginRootValue`, `toddSeries`, `lSeries`, `lSeries_root_coefficient_six`, `twice_even_product_correction_eq_zero`) is declared in `Suggested.lean`; the elaborated signatures match the README statements (universal over commutative ℚ-algebras, all ranks; arbitrary commutative ring). No section binder is dropped (both theorems carry their own binders). No `set_option`, no sorried data, single `import Mathlib`.

**The change since main (C1.5a and the scope lines).** Every citation resolves at this pull request's head of AlgebraicTopology: 8.5 Whitehead for Hausdorff CW complexes (AT line 1916), 8.8 `groupClassifyingSpace` with the normalized ClassifyingSpaces comparison 8.8b (lines 2035–2050, table row 2412), 8.10 `ordinaryEMRepresentability` with relative map classes and coefficient naturality (lines 2215–2249), 8.12 native circle comparison pinning the degree-one class to the loop `t ↦ t mod ℤ` (lines 2364–2377), 8.9 primary obstructions (line 2174). AT's own scope text (lines 136–143 and 2372–2377) agrees with C1.5a in both direction and content ("no stage here consumes those carriers, comparisons or that identification"), so the former AT8.12 ↔ C1.5 loop is cut. TopologicalKTheory T1.6d at the head names `RP∞`/`CP∞` as rank-one Grassmannian unions, keeps the double-cover and circle local trivialisations and proves the universal sphere total space contractible (TopK lines 625–641); CKG K7.1/K7.2 fix `∫_{CP¹} ω_FS = 1` and the `O(1)` curvature `−2πiω_FS` (CKG lines 88–89). At the pin, `TauCeti.IsAspherical.exists_homotopyEquiv` (`ClassifyingSpace/Uniqueness.lean`) and `classifyingSpace G` as `K(G,1)` give a shorter route to `RP∞ ≃ B(ℤ/2)` once `RP∞` is shown aspherical of CW type; this is a remark, not a finding.

**Adversarial table.** Each row gives what I computed on each side.

| Statement | Instances | Values | Result |
| --- | --- | --- | --- |
| Conventions: CE degree-one differential `da(X,Y) = −a([X,Y])` versus Mathlib | trivial coefficients | pinned `LieModule.Cohomology.d₁₂_apply_apply_ofTrivial : d₁₂ f x y = −f⁅x,y⁆` (Cochain.lean:118) | agree |
| Conventions: Euler form of `[[0,−α],[α,0]]` | rank 2, `A∧A = 0` | `F = [[0,−dα],[dα,0]]`, `Pf(F/2π) = −dα/2π`; complex curvature `i dα`, `c₁ = (i/2π)(i dα) = −dα/2π` | `e = c₁` for the standard character, as stated |
| Conventions: `c₁(O(1)) = h`, `∫_{CP¹}h = 1` | CKG `O(1)` curvature `−2πiω_FS` | Chern form `(i/2π)(−2πiω_FS) = ω_FS`, integral 1 | agree |
| Projective relation `aʳ − c₁aʳ⁻¹ + … + (−1)ʳc_r = 0` | `r = 1`; `r = 2` split | `r=1`: `a − c₁(L) = 0` with `a = c₁(H) = c₁(L)`; general: `[c(E)/(1+a)]_r = Σ c_i(−a)^{r−i} = 0` | sign pattern correct |
| C1.0 metric change `H`, `h₁(u,v) = h₀(Hu,v)` | two metrics | `h₁(H^{−1/2}u, H^{−1/2}v) = h₀(H^{1/2}u, H^{−1/2}v) = h₀(u,v)`; Sylvester map eigenvalues `λ_i^{1/2}+λ_j^{1/2} > 0` | correct |
| C1.0 orientation cover = frames/SO(n) | pinned statement | `toOrientationCover p = toOrientationCover q ↔ ∃ g, 0 < det g ∧ q = g•p` | agrees; duplicated (R03) |
| C1.1d table `[Sⁿ, GL_k(ℝ)]` | `k=1,2,≥3`; `n=0,1,2` | `π₀ = ℤ/2`; `π₁(O(k)) = 0, ℤ, ℤ/2`; reflection conjugation acts on `π₁(SO(2)) = ℤ` by `−1`; `π₂(SO(k)) = 0` | `(ℤ/2)²`, `ℤ/2`, `ℤ⋊ℤ/2`, `(ℤ/2)²`, `ℤ/2` all rows agree |
| C1.1d bundles over `S²`, `S¹` | rank 2, `k≥3`, `k=0,1` | `ℤ/(m∼−m)`; two classes (`π₁(SO(k)) = ℤ/2`); one class; over `S¹`: `π₀(O(k)) = ℤ/2` | agree |
| C1.1d calibration | `O(−1)`, `TS²` | `⟨c₁(O(−1)),[CP¹]⟩ = −1`; `χ(S²) = 2` | winding `−1`, `2` as stated |
| C2.0 cell dimensions | rank 0, empty base | `S(E) = ∅`, `D(E) = X`, cells `(q+0)`, Thom model `X ⊔ pt`; empty base: cofibre of `∅→∅` is a point | as stated |
| C2.0 `supBallEuclideanDiskHomeomorph` direction | `v ↦ (‖v‖∞/‖v‖₂)v` | `‖image‖₂ = ‖v‖∞`, so sup-ball → Euclidean disk; inverse `‖·‖∞ = ‖w‖₂` | formula and direction consistent with its name |
| C2.2 odd-rank Euler `2e = 0` | orientation reversal | `e(−E) = −e(E) = e(E)` under the identity of `E` in odd rank | correct |
| C3.3 Whitney correction | `p_k(E⊕F)` | `(−1)^k c_{2k} = (−1)^k[Σ_{a+b=k}c_{2a}c_{2b} + Σ_{a+b=k−1}c_{2a+1}c_{2b+1}] = Σp_ap_b + (−1)^kΣc_{2a+1}c_{2b+1}` | formula correct |
| C3.3 `p_r = e²` sign | rank `2r` | `E_ℂ` versus `E⊕E` orientation sign `(−1)^{2r(2r−1)/2} = (−1)^r` | as stated |
| C3.3 `ρβ(w_j) = w₁w_j + (j−1)w_{j+1}` | Wu formula `Sq¹` | `j=1`: `w₁²`; `j=2`: `w₁w₂ + w₃` | standard |
| C3.6 rings | `R` with `2` a unit | `H*(BSO(2);R) = R[e]`, `p₁ = e²`; `BSO(1)` contractible; antipodal map `e ↦ −e` fixes `p_i` | consistent |
| C3.6 torus restriction | `T^r ⊂ SO(2r)` | `p_i ↦ e_i(x_0²,…,x_{r−1}²)`, `e ↦ ∏x_j` | standard |
| C5.2 Euler integral of `G/T` | `G = SU(2)` | `G/T = S²`, `|W| = 2 = χ(S²)` | agree |
| C5.4 `H*(BO(n);ℚ)` | `n = 0,1,2,3` | `ℚ`, `ℚ`, `ℚ[p₁]`, `ℚ[p₁]` (`⌊n/2⌋` generators) | agree |
| C5a.1 `H¹(K;ℝ) = ann([g,g])` | closed 1-forms | `da(X,Y) = −a([X,Y])`, no exact 1-forms (`d` of constants is 0) | correct |
| C5a.1 `2d = Σ e^a ∧ L_{e_a}` | trivial coefficients | Koszul identity `d = ½Σ ε(e^a)L_{e_a}` on `Λg*`; invariant tensors closed | correct |
| C5a.1 Haar average | bi-invariance | `L_h*Aω = ∫L_{gh}*ω dg = Aω` by right invariance of Haar | image left-invariant |
| C5a.2 generator count and weights | rank `K`, central directions | `d=1` central generators, weights `2d_i` | consistent with RIT §3 (central factor, line 60) |
| C5a.2 rational structure | `θ ↦ exp(iθ)` | `dχ(a) = ia`, `(i/2π)(ia) = −a/2π` | agrees with Conventions |
| C5a.3 Weil differential | `θ_t = tθ` | `dθ_t + ½[θ_t,θ_t] = tΩ + ((t²−t)/2)[θ,θ] = F_t` | `F_t` correct |
| C5a.3 `d_W CS_P = P(Ω)` | degree `d` | `∫₀¹ (d/dt)P(F_t)dt = P(Ω) − P(0)`, `P(0) = 0` for `d ≥ 1` | correct |
| C5a.3 rank one | `P = −a/2π` | `CS_P = P(θ) = −θ/2π` | matches `τ(−a/2π) = −θ/2π` |
| C5a.4 Koszul model | `|e_i| = 2d_i − 1`, `D e_i = P_i` | quotient by `I_+`: `Λ(e_i)` | consistent |
| C5a.5 transgression page | `z_i ∈ E^{0,2d_i−1}` | `d_r : E_r^{p,q} → E_r^{p+r,q−r+1}`, `r = 2d_i` lands in `E^{2d_i,0}` | `d_{2d_i}(z_i) = u_i` well-formed |
| C5a.5 `π₁(BK) = π₀(K)` | connected `K` | `0` | local coefficients trivial, as used |
| C5a.6 Poincaré series | `U(2)`, `SU(2)`, `SU(n)` | degrees `1,3`; `3`; `3,…,2n−1`, `Σ(2d_i−1) = n²−1 = dim SU(n)`; `χ = ∏(1+(−1)^{odd}) = 0`, trivial group `1` | all agree |
| C5a.7 `E₈` | exponents `1,7,11,13,17,19,23,29` | degrees `3,15,23,27,35,39,47,59`, sum `248 = dim E₈` | agree |
| C5a.7 `SU(2)/N(T) = RP²` | integral cohomology | `H⁰ = ℤ`, `H¹ = 0`, `H² = ℤ/2` | agrees with SchubertGeometry S9.6 (main, line 120) |
| C5a.7 strict upper triangular | `n = 2` | one-dimensional abelian, centre = whole algebra, derived = 0 | counterexample as stated |
| C7.1 `L₃` coefficient | `q₃ = 2⁶B₆/6!` | `B₆ = 1/42`, `q₃ = 64/30240 = 2/945`; `q₁q₂ − 3q₃ = −7/945 − 6/945 = −13/945`; `q₁³ − 3q₁q₂ + 3q₃ = (35+21+6)/945 = 62/945` | `(62p₃ − 13p₁p₂ + 2p₁³)/945` correct |
| `lSeries_root_coefficient_six` low ranks | `r = 0`; `r = 1` | `r=0`: both sides `0`; `r=1`: `q₃x⁶ = 2x⁶/945 = 2p₁³/945`, `p₂ = p₃ = 0` | holds (R05 is about headline status, not truth) |
| `lSeries = hirzebruchLSeries ℚ` | all coefficients | `B'(2X) − X = (B(2X) + 2X) − X = B(2X) + X` | proved in Lean (scratch) |
| `twice_even_product_correction_eq_zero` | `k = 0`; general | `k=0`: `P₀Q₀ − P₀Q₀ = 0`; general: difference `= Σ_{i odd}P_iQ_{2k−i}`, doubled `0` by `hodd` | true; free-variable algebra (R05) |
| C7.2 half-spin character | `r` roots | `ch(S⁺)−ch(S⁻) = ∏(e^{x/2} − e^{−x/2})`; vacuum weight `−Σx_j/2` gives sign `(−1)^r` | as stated |
| C7.2 `x coth(x/2)` versus `L` | degree `4k`, `2k` roots | `∏x_j coth(x_j/2) = 2^{2k}∏L(x_j/2)`; degree-`2k` part scales by `2^{−2k}` | equal in degree `4k`, constants differ for `k>0` |
| C7.3 `p₁(L⊕L)` on `RP⁴` | `L` tautological | `(L⊕L)_ℂ = L_ℂ⊕L_ℂ`, `c₂ = c₁(L_ℂ)² = β(a)²`, `p₁ = −β(a)² = −y² ≠ 0` in `H⁴(RP⁴;ℤ) = ℤ/2`; `p(L) = 1` | detects the correction, as stated |
| C7.AdjointHopfObstruction roots | `End₀(F)` | roots `0, x−y, y−x`; `c₂ = −(x−y)²`; `p₁ = (x−y)² = c₁² − 4c₂` | agrees with Zentner Ex. 2 (`p₁ = −c₂(su⊗ℂ)`, cache lines 50–58) |
| C7.AdjointHopfObstruction on `HP¹` | `c₁(F) = 0`, `⟨u,[HP¹]⟩ = 1` | `p₁(E) = −4u`, pairing `−4`; `e(E) ∈ H³(S⁴) = 0`; `w_{1,2,3} ∈ H^{1,2,3}(S⁴;𝔽₂) = 0` | as stated |
| C7.AdjointHopfObstruction no section | `E = ε¹ ⊕ P` | `e(P) ∈ H²(S⁴) = 0`, `p₁(P) = e(P)² = 0`, `p₁(E) = p₁(P) = 0` (odd Chern classes of `ε_ℂ` vanish) contradicts `−4u` | correct; rank 3 over dimension 4 is outside C2.2's range |
| C7.AdjointHopfObstruction Check | `Z = diag(1,−1)` | `X = (Z − Z*)/2 = 0`, `Y = (Z+Z*)/(2i) = diag(−i,i)`, `X + iY = Z` | correct |
| C7.AdjointHopfObstruction basis | `diag(i,−i)`, `[[0,1],[−1,0]]`, `[[0,i],[i,0]]` | each `A* = −A`, trace 0, linearly independent | a basis of `su(2)` |
| C7.3a | `m = 2^k` | `(1+a)^{m+1}(1+a)^{m−1} = (1+a)^{2m} = 1 + a^{2m} = 1` in degree `≤ m`; `w̄_{m−1} = a^{m−1}` | agrees with Cohen line 3590 |
| C2.3 Checks | `S²`, antipodal, constant map | `2`, `−2`, `0` (Lefschetz number `1`) | correct |
| C2.3a tetrahedron | `4−6+4` | `2 = χ(S²)`; triangle `3−3 = 0` | correct |

**Library declarations opened at the pin** (file and line): `TauCeti.IsThomClass` EulerClass.lean:245; `TauCeti.eulerClass` :356; `eulerClass_naturality` :368; `eulerClass_eq_zero_of_forall_ne_zero` :383; `eulerClass_pullback` :402; `VectorBundleOrientation.exists_isThomClass` Orientation/ThomClass.lean:186; `exists_singularCohomology_thomPair_fiber` :121; `exists_isThomClass_of_compactSpace` MayerVietoris/Basic.lean:612; `VectorBundleOrientationCover.{sheet,isOpen_sheet,trivializationHomeomorph,isCoveringMap_proj,ncard_fiber,deck}` Orientation/Cover.lean:107–340; `signLocalSystem`, `signLocalSystemFiberEquiv` Orientation/LocalSystem.lean; `OrthonormalFrameBundle.{smul_eq_self_iff,exists_smul_eq_iff,orthonormalFrameBundle,exists_trivialization,associatedHomeomorph}` OrthonormalFrame/Basic.lean:160–564; `OrthonormalFrameBundle.toOrientationCover_eq_toOrientationCover_iff` Orientation/OrthonormalFrame.lean; `TauCeti.TopCat.serreFibrations` SerreFibration/Basic.lean:107; `mem_serreFibrations_proj`, `hasHomotopyLiftingProperty_cube_of_exists_trivialization` SerreFibration/FiberBundle.lean; `TauCeti.hirzebruchLSeries` CharacteristicSeries.lean:245, `aHatSeries` :147, `coeff_hirzebruchLSeries` :249; `PowerSeries.multiplicativeSequence` MultiplicativeSequence.lean:110, `multiplicativeSequence_three_right` :373, `aeval_multiset_esymm_sq_multiplicativeSequence` :300; `multiplicativeSequence_cartier_hirzebruchLSeries_two` GenusPolynomials.lean:121; `evalFundamentalClass` Cohomology/FundamentalClass.lean:88; `IsAspherical.exists_homotopyEquiv` ClassifyingSpace/Uniqueness.lean; Mathlib `d₁₂_apply_apply_ofTrivial` Algebra/Lie/Cochain.lean:118, `exists_embedding_euclidean_of_compact` Geometry/Manifold/WhitneyEmbedding.lean:132, `bernoulli'PowerSeries` NumberTheory/Bernoulli.lean:157, `sSetTopAdj` AlgebraicTopology/SingularSet.lean, `SSet.KanComplex`, `cechComplexFunctor` Sites/SheafCohomology/Cech.lean, `MvPolynomial.symmetricSubalgebra`/`esymmAlgEquiv` RingTheory/MvPolynomial/Symmetric. All Clifford-spin names of C3.5 exist (`Topology/Algebra/CliffordAlgebra/Spin/{Covering,Connected,SphereSection}.lean`), as do `hasHomotopyExtensionProperty_base` and `HasHomotopyExtensionProperty.image`. Absent at the pin, as the README says or as needed for R02's scope: a relative cup product on `TopPair`, an Euler characteristic of a space, an infinite Grassmannian or `BU(r)`, Leray–Hirsch, Gysin, Chern/Stiefel–Whitney/Pontryagin classes, a Chern–Weil map.

**Cross-roadmap citations resolved** (main unless noted): SchubertGeometry S9.6 (line 120: `K/T → K/N(T)`, rational acyclicity, `SU₂/ℝP²` test); ReflectionInvariantTheory §§1–3 and §4 (`e_i = d_i − 1`, line 72; central directions line 60; componentwise rule line 95); LieGroupoidsPoisson §G1.3a (lines 18, 603); DGFloer Layer 1 item 2 (lines 133–148, 376); MorseNovikov N6; AffineMorseLefschetz A4.0; MorseTheory M5 (line 857); RiemannianGeometry R3; ConvexityToric T2 (line 73); GeometricTopology Layers 1, 3, 10, 11 (lines 177, 357, 786, 831); SmoothBundlesConnections B1.4/B6; LieHighestWeight L7 names `lieInvariantSymmetricAlgebra`, `killingSymmetricEquiv_lie`, `killingSymmetricEquiv_cartan_restriction`, `lieChevalleyRestrictionIso(_coe,_mem_homogeneous_iff)` (lines 981–1067); CompactGroups Layer 0 Haar; TopologicalSheafCohomology TS1.1–TS1.2 (lines 7–11, 49, which name C1.2b as the consumer); SpinGeometry G4.1a/G4.1b (lines 397, 425) and its own "C1, C3.5 owns" line 50; TopologicalKTheory T1.1 `FiniteRankAtlas`, T1.5a, T1.6a–d, T6.4, T7.4; GeneralizedCohomology G4.0a/G4.0b (this pull request's head, lines 1782–1801); HomotopySpheres §3A/§4A and `S³/{±1} ≃ SO(3)` (pull request #1287 head, lines 1264, 1292); IndexTheory I7.2 `σ = ⟨p₁,[M]⟩/3` (pull request #1077 head, line 868; cited as a consumer-side comparison only). The item-level mutual consumptions on main (AT 8.5 proper ↔ C1.2a, TopK T1.6a ↔ C1.1a, GeneralizedCohomology G4.0 ↔ C7, SpinGeometry G4.1a ↔ C3.5) are declared in both READMEs at item level and the dependency check accepts them; I raise nothing there.

**Sources.** hatcher-vbkt §1.2 pp. 22–26 = cache pages 26–30, "Clutching Functions" line 844, Example 1.10 (`O(−1)` clutching) line 879; zentner-instanton-sheet2 Exercise 2 lines 45–61; tomdieck-at 14.4.3 "The Milnor space" line 14467, 9.5 "Weak Equivalences and Homology" line 9942, 13.1–13.3 (contents lines 253–256); dupont-ccc Chapter 8 (lines 132–141: Cartan's theorem, Borel's theorem, Chevalley in the appendix), Theorem 8.1 line 3514, Proposition 8.3 line 3548, Lemma 8.30 (the `2m`-form on the `G/T` fibre) line 3848, Appendix line 4110; dupont-ln §9 line 2097, §10 (contents line 46); may-concise Chapter 16 line 5203; Cohen (cache 1416c4bf, not in the manifest, R07) as listed there. The Milnor items are settled uncertified and cited by locator.

**Shape.** The README is not in the `## Scope and ownership / ## Conventions / ## Exact supplier contracts / Layer k` shape; it is the existing main-branch form of this roadmap with `## Carriers, scope and suppliers`, `## Conventions`, `## C1 … C7` and `## Dependency order and references`, and this pull request does not reshape it. I do not raise the shape: the roadmap is existing work on main, and the pull request's change is one subsection.

## Not verifiable

- Milnor–Stasheff §§9–15, 18–19, Appendix C and Theorem 15.3; Milnor, *Topology from the Differentiable Viewpoint* §6; Milnor, *Construction of Universal Bundles II* §§2–3: settled uncertified in the manifest; cited by locator, text not read.
- Bott–Tu §§6, 11–14, 20–23: Springer book, no legal text; not in the manifest (R07).
- Hirzebruch's and Milnor–Stasheff's `L₃` coefficient was recomputed from `B₆ = 1/42` and the pinned `K₃` formula rather than read from the uncertified text.

## Source issues

- none
