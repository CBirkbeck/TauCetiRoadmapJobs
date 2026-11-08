# Review of ComplexKahlerGeometry (pull request #1234 at 41f5a15)

**Verdict:** needs changes

Full re-review of the repaired head (680 changed lines since `f44628f`). The previous review's R01, R03, R04, R05 and R06 are repaired; R02 is partly repaired and R07 is not (both are carried below as R01 and R06). The rest of this review audits every passage of the folder against Tau Ceti `2fd255d` and Mathlib `1b1ccf4`, which the previous, incremental review left to "the next full review". Four blocks of the README (K3.MeromorphicGermField, the K3 stalk algebra, K5a's pointwise star and codifferential, K7.1's projective charts) restate what those pins now contain; they are P3 duplications with the exact names to cite. No finding is mathematical: every Lean statement and every sampled target survived the adversarial pass.

## R01 (P2) — Two owners of the frame-torsor isomorphism, the exponential sequence and the `c₁` identification (partly repaired from the previous R02)

Location: `TauCetiRoadmap/ComplexKahlerGeometry/README.md:647–652`: "K4.P owns, on every complex manifold, the holomorphic exponential sequence, the isomorphism `Pic_hol(M)≃H¹(M,𝒪×)` and the identification of its connecting map with the integral first Chern class … Its consumers are ComplexComparisonPartII C5.4 …, K3Surfaces 1.1 and GeometricQuantization §3.3: the exponential segment … that they use are this construction."

Claim: ComplexComparisonPartII (#848, head `d0ac71a`, a new roadmap at merge-order position 43) claims the same object as its single owner, and both named consumers take it from C5.4, not from K4.P. The sentence "that they use are this construction" is false at all three heads, and the description's merge-order paragraph still says nothing about it.

Witness: #848 `ComplexComparisonPartII/README.md:147`: "C5.4 is the single owner, on every complex manifold, of the holomorphic-to-smooth forgetful adapter, the frame-torsor bijection … to `H¹(M,O_M^×)`, the holomorphic exponential sequence … and the identification of its connecting map with the integral first Chern class". #1285 `K3Surfaces/README.md:13–14` ("its C5.4 owns the normalized exponential/Chern comparison") and `:144–145`; #1186 `GeometricQuantization/README.md:19–20` and `:649` ("Apply the exponential-sequence segment from ComplexComparisonPartII C5.4").

Repair, one of:

- (a) K4.P stays the owner. This is the right direction: this roadmap is on main, and #848 consumes K5a's `BundleTest`/`BundleDistribution` and K6.1's Lelong estimates (`:153–154` at its head). Then (1) rewrite `README.md:649–652` so it asserts ownership and not what the other heads do: "K4.P owns this segment and its `c₁` identification; ComplexComparisonPartII C5.4 (for its analytic-space and cycle comparisons), K3Surfaces 1.1 and GeometricQuantization §3.3 are its consumers." (2) In the pull request's merge-order paragraph, say that #848, #1285 and #1186 must cite K4.P for the frame-torsor isomorphism, the exponential segment and the `c₁` identification in place of C5.4's items, and that #848 must drop the "single owner" claim at its line 147. Nothing in this folder changes beyond (1).
- (b) K4.P cedes. Keep `Pic_hol(M)` as isomorphism classes of K4's rank-one locally free modules, units and automorphisms (`:657–658, 711–714`); move the frame torsor, `Pic_hol≃H¹(𝒪×)`, the segment (`:659–681`), the conditional isomorphism and the continuous-line corollary (`:683–714`) and Checks 2–4 (`:744–752`) to C5.4, and do not consume them here (that would recreate the cycle with ComplexComparisonPartII).

Test: after (a), `roadmaps grep -i 'single owner'` over the open heads must not name C5.4 for the exponential sequence, and K3Surfaces' gap `integral-topology` (#1285 `:125–146`, which asks this roadmap for exactly the frame-torsor isomorphism) is answered by K4.P as written.

## R02 (P3) — K3.MeromorphicGermField restates the pinned field of meromorphic germs

Location: `README.md:384–426`, e.g. "construct `K_a=FractionRing O_a`. Identify it with a field structure on the subring of punctured `Filter.Germ (𝓝[≠] a)` represented by native `MeromorphicAt f a` … choose N≥0 and an analytic germ h … split its convergent Taylor expansion".

Claim: at Tau Ceti `2fd255d` every sentence of this block except the comparison with GlobalHolomorphicFunctions GH2's coefficients is a pinned declaration, and the block cites none of them.

Witness (file, line at the pin): `TauCeti.meromorphicGerms` (`TauCeti/Analysis/Meromorphic/Germ.lean:55`) with `instField` (`:188`); `holomorphicStructureSheaf.toMeromorphicGerms` and `toMeromorphicGerms_injective` (`…/Complex/StructureSheaf/MeromorphicGerm.lean:59, 73`), `exists_eq_toMeromorphicGerms_div` (`:111`, every germ is `h/(z−a)^n`), `isFractionRing_meromorphicGerms` (`:141`, so `FractionRing 𝒪_a` is `IsFractionRing.algEquiv`), `exists_toMeromorphicGerms_eq_iff` (`:87`, regular ⟺ order ≥ 0), `regularPart` (`:166`); `meromorphicGerms.principalPart` with `principalPart_eq_iff` and `principalPart_eq_sum_coeff` (`…/Meromorphic/PrincipalPart.lean:188, 217, 256`: the Taylor split of `(z−a)^(−N) h`, independence of `N` and representative, uniqueness); `coeff_principalPart_succ_eq_circleIntegral` (`…/Contour/Residue/PrincipalPart.lean:86`: the coefficient of order `−k` as a circle integral); `meromorphicGermsEquiv` (`…/Meromorphic/Pullback.lean:130`) with `toMeromorphicGerms_stalkPrecomp` and `meromorphicGermsEquiv_mem_range_iff` (`…/StructureSheaf/Pullback.lean:52, 75`: the pullback comparison respects regular germs); `meromorphicGerms.derivation` and `derivation_pullback` (`…/Meromorphic/Derivation.lean`).

Repair: rewrite the block as a supplier citation of these names, in the shape of the K1 and K2 blocks of this head, and keep as targets only what the pin lacks: the agreement of `coeff_principalPart` with GH2's Laurent coefficients and GH2's finite-pole output, the finite-convolution product formula for a fixed negative coefficient, and the ℂ-only facts the roadmap needs beyond `𝕜`. Its adversarial row (`f=(z−a)^(−2)+1`) is unchanged by the repair.

Test: `grep -c meromorphicGerms README.md` goes from 0 to at least 1, and the block no longer says "construct `K_a`".

## R03 (P3) — K3.HolomorphicStalk and the K3 stalk algebra restate the pinned holomorphic structure sheaf

Location: `README.md:365–371` ("Define holomorphic germs … Consume `smoothSheafCommRing`, its `IsLocalRing` stalk instance and `isUnit_stalk_iff` after K3.0 identifies analytic and complex-smooth sections. Supply restriction/pullback and the maximal-ideal comparison"), `:386–388` ("Prove O_a is a domain by the identity/isolated-zero theorem"), `:428–432`.

Claim: the pin has the holomorphic structure sheaf, its comparison with Mathlib's complex-smooth sheaf (the "native carrier comparison of K3.0"), the local-ring, domain, maximal-ideal and curve-DVR structure of its stalks and the germ comparisons; the README consumes only Mathlib's sheaf and plans the rest.

Witness: `TauCeti.holomorphicStructureSheaf` (`TauCeti/Geometry/Manifold/Complex/StructureSheaf/Basic.lean:68`); `smoothSheafIso` and `smoothStalkIso` (`…/SmoothComparison.lean:80, 110`: the `C^ω` sheaf is Mathlib's `C^∞` sheaf over ℂ, stalkwise, with evaluation and naturality); `instIsLocalRingStalk`, `isUnit_stalk_iff`, `maximalIdeal_stalk`, `residueFieldEquiv` (`…/LocalRing.lean:90, 46, 98, 104`); `stalkIsDomain` and `smoothStalkIsDomain` (`…/Domain.lean:70, 93`, by the identity theorem, zero-dimensional models included); `ker_eval_eq_span_holomorphicLinearCoordinateGerm` and `mem_ker_eval_sq_iff` (`…/MaximalIdeal.lean:197`: `n` coordinate germs generate `𝔪`, Hadamard's lemma); `instIsDiscreteValuationRingStalk` (`…/DiscreteValuationRing.lean:55`, complex curves); `toFilterGerm` with its injectivity and image (`…/Germ.lean`); `TauCeti.analyticGerms` with `equivOfInverse` and `pullback` (`TauCeti/Analysis/Analytic/Germ.lean:37`). Noetherianity, regularity, dimension `n`, factoriality and Weierstrass preparation are at neither pin (0 hits for `IsNoetherianRing`, `IsRegularLocalRing`, `UniqueFactorizationMonoid` under `TauCeti/Geometry/Manifold/Complex` and `TauCeti/Analysis/Analytic`), so the two Lean headlines stay.

Repair: in K3.0 and K3.HolomorphicStalk, consume these by name (the `smoothStalkIso` comparison replaces "after K3.0 identifies analytic and complex-smooth sections"; `stalkIsDomain` replaces "Prove O_a is a domain"; `ker_eval_eq_span_holomorphicLinearCoordinateGerm` is the "maximal-ideal comparison"), and keep as targets Noetherianity, regularity, Krull dimension, factoriality, Weierstrass preparation/division and the several-variable power-series comparison.

Test: the stalk-unit Check (`1+z` a unit, `z` not) is `isUnit_stalk_iff` at `…/LocalRing.lean:46`, evaluated at `0`.

## R04 (P3) — K5a restates the pinned Hodge star, conjugate star, type law and codifferential

Location: `README.md:785–806` ("On an oriented real inner-product space V of dimension m construct the pointwise Hodge star … characterized by `α∧*β=⟨α,β⟩vol`, with `*²=(−1)^(k(m−k))` … Define `barStar β=*(bar β)` … prove the pointwise (p,q) type law"), `:1266–1275` ("Own `d*=(−1)^(m(k+1)+1)*d*` on real k-forms of an oriented m-manifold").

Claim: all of it is at the pin, including the manifold-level star and the codifferential with its Green formula and formal adjointness; the module docstring of `Suggested.lean:55–56` already says the pins have "the Hodge star and codifferential of real forms", so the README contradicts the Lean file.

Witness: `Orientation.volumeEquiv`, `Orientation.hodgeStar`, `inner_hodgeStar_apply`, `hodgeStar_hodgeStar` (`TauCeti/Analysis/InnerProductSpace/HodgeStar/Basic.lean:161, 194, 198, 236`), the Gram-determinant metric `exteriorPower_innerₗ` (same file), `hodgeStarIsometry`, `hodgeStar_neg_orientation` (`…/HodgeStar/Isometry.lean:80, 150`), wedge/contraction adjointness `adjoint_wedgeLeft`, `koszulDifferential_hodgeStar` (`…/HodgeStar/Contraction.lean`), `Orientation.complexHodgeStar`, `barHodgeStar`, `complexWedgePairing_barHodgeStar` (`α∧barStar β = h(β,α) vol`), `complexHodgeStar_mem_typeSubmodule_iff`, `barHodgeStar_mem_typeSubmodule_iff` (`…/HodgeStar/Complex.lean:57, 126, 161, 219, 233`), `exteriorPower.typeSubmodule` (`TauCeti/LinearAlgebra/ExteriorPower/AlmostComplexType.lean`), `TauCeti.SmoothForm.hodgeStar` (`TauCeti/Geometry/Manifold/Riemannian/HodgeStar.lean:296`), `TauCeti.SmoothForm.codifferential`, `codifferential_codifferential`, `integralTopForm_inner_mextDeriv_eq_inner_codifferential` (`…/Riemannian/Codifferential.lean:88, 130, 252`, sign `(−1)^(m(j+1)+1)⋆d⋆`, orientation independence).

Repair: replace `:785–806` and `:1266–1275` by citations of these names, and keep as targets only what they lack: the orientation line and the twisted star on nonorientable manifolds (`:791–794`), the transport to the `(p,q)` bundles of K5b (`:806`), `*Δ_d=Δ_d*` and the `L²` realisation. Keep the `ℝ²` and standard-ℂ Checks; they now test the cited declarations.

Test: `*dx=dy`, `*dy=−dx`, `*²=−1` on `ℝ²` is `hodgeStar_hodgeStar` with `k=l=1`: `(−1)^1`.

## R05 (P3) — K7.1 restates the pinned projective-space topology and complex atlas

Location: `README.md:1681–1704` ("Use the single carrier `Projectivization ℂ (Fin (n+1) → ℂ)` with AlgebraicTopology Stage 4.6's quotient topology … Construct the affine chart on `U_i` … Prove openness, … chart homeomorphism and holomorphic transition maps … Prove `T2Space`, `CompactSpace`, `SecondCountableTopology` and `ConnectedSpace`"), `:2210`.

Claim: the carrier, the quotient topology, these four instances and the affine atlas with its `C^r` manifold instance for every `r` including `ω` are at the pin; the README plans them and cites AlgebraicTopology for the topology.

Witness: `Projectivization.instTopologicalSpace`, `instSecondCountableTopology`, `instT2Space`, `instCompactSpace`, `instPathConnectedSpace`, `isOpen_affineOpen`, `affineOpenPartialHomeomorph` (`TauCeti/Topology/Algebra/Projectivization.lean:90, 149, 188, 215, 251, 271, 311`); `Projectivization.instChartedSpace`, `contDiffOn_affineChart_symm_trans`, `instIsManifold`, `contMDiffOn_affineChart`, `contMDiff_affineChart_symm` (`TauCeti/Geometry/Manifold/Instances/Projectivization.lean:54, 73, 82, 89, 96`). The import clash the docstring reports is real: a scratch file with `import Mathlib` and `import TauCeti.Geometry.Manifold.Instances.Projectivization` fails with "environment already contains `Projectivization.instTopologicalSpace._aux_1` from `Mathlib.Topology.Algebra.Projectivization`".

Repair: cite these in K7.1 (the roadmap keeps the `Fin.succAbove`/`insertNth` coordinate conventions, the `EuclideanSpace` comparison, the orientation comparison with K1, the `OnePoint` biholomorphism and the naturality APIs, none of which is at the pin), replace "AlgebraicTopology Stage 4.6's quotient topology" at `:1683` and `:2210` by `Projectivization.instTopologicalSpace`, and record in K7.1 that the two libraries each declare that instance, so a consumer that imports all of Mathlib cannot import the Tau Ceti module until one copy is removed.

Test: the K7.1 Check `[2:4]=[1:2]` is `Projectivization.mk_eq_mk_iff`; `n=0` is `instCompactSpace` on `Fin 1 → ℂ`.

## R06 (P3) — The order against the two other open revisions of this folder is still not stated (re-raised: previous R07)

Location: the pull request description (merge-order paragraph); `scratch/overlaps.md`.

Claim: #1807 (`c2fe7d2`, draft) and #1398 (`20c666e`) both rewrite `README.md` and `Suggested.lean` of this folder and conflict with this head; neither the description nor the README says which is rebased on which.

Witness: #1807's `Suggested.lean` declares in the same namespace `newlander_nirenberg`, `polydisc`, `dolbeault_grothendieck_polydisc`, `weierstrass_preparation`, `isRegularLocalRing_holomorphicStalk`, `dolbeaultCocycles`, `DolbeaultCohomology`, `finrank_dolbeaultCohomology_serre`, `hard_lefschetz` with different signatures (`IsKahlerForm` and `lefschetzPow` where this head has `IsKahler` and `lefschetzMap`, a complex de Rham carrier where this head uses the real `deRhamCohomology`). The description's only order statement is "Revisions of roadmaps on main whose numbering this roadmap cites, which merge first: #1186".

Repair: add one sentence to the description: which of #1807, #1398 and this pull request is rebased on which. The shorter path is unchanged from the previous review: rebase this pull request's insertions (K4.P, K6.0 frames, the Fubini–Study block, K7.2.TautologicalIncidence, K7.2.RationalQuartic, K7.FlatDegreeZero) onto #1807 and take #1807's Lean statements where the two coincide.

## R07 (P3) — Three citations point to the wrong place

- `README.md:154–157`: "Consume `ImplicitFunctionData.contDiffAt_implicitFunction` and `ImplicitFunctionData.analyticAt_implicitFunction` from `TauCeti.Analysis.Analytic.Inverse`". The first is Mathlib's (`Mathlib/Analysis/Calculus/ImplicitContDiff.lean:41`); only the second is Tau Ceti's (`TauCeti/Analysis/Analytic/Inverse.lean:131`). Repair: attribute each to its library.
- `README.md:1663`: "DG8.4's relative `chainIntegral_map`". No declaration of that name exists in DifferentialGeometry's README (its 8.4, `DifferentialGeometry/README.md:845–847`, names `chainIntegral`), in Tau Ceti or in any open roadmap (`roadmaps grep --fixed chainIntegral_map` hits only this folder). Repair: cite DG 8.4's relative chain integration by the name DG gives it, or describe it in prose without a backticked name.
- `Suggested.lean:160–161`: "**Uniqueness in Weierstrass preparation** (Demailly, Chapter II, (2.1))". Theorem (2.1) (`demailly-agbook` line 3794) states existence only; uniqueness is the sentence "The representation (2.4) is unique" of the division theorem (2.3) (line 3817), from which uniqueness of the preparation follows by dividing `P'` by `P`. Repair: cite "(2.3)–(2.4)" for `weierstrass_preparation_unique`.

## Previous findings

- R01 (headlines absent, docstring wrong) — repaired. `newlander_nirenberg` (`Suggested.lean:83`), `dolbeault_grothendieck_polydisc` (`:105`) and `even_finrank_deRhamCohomology_odd` (`:407`) are stated as proposed, and twelve more headlines with them; the docstring (`:35–65`) now gives a carrier reason for each unstated headline, and each reason checked at the pin is true (table below).
- R02 (two owners) — partly repaired: the K3SurfacesAndSymplecticBoundedness clause is gone; the ownership conflict with C5.4 and the false consumer claim remain. Carried as R01.
- R03 (`nijenhuisOnFields`) — repaired: both declarations deleted; `IsKahler` is `form.IsClosed ∧ form.Compatible J ∧ J.nijenhuis = 0` (`:354–355`); `README.md:166–186` consumes `nijenhuis`, `nijenhuis_apply`, `nijenhuis_eq_zero_iff`, `nijenhuis_antisymm`, `nijenhuis_apply_left`, the `baseChange_nijenhuis_*` identities and `delBar_delBar_apply`/`del_del_apply`, all present at the pin.
- R04 (`realified_isManifold_analytic`) — repaired: deleted; `README.md:354–361` consumes `IsManifold.restrictScalars_of_ne_zero`, `maximalAtlas_subset_restrictScalars_of_ne_zero`, `contMDiff_iff_mdifferentiable`, `ContinuousOn.analyticAt_of_differentiableAt_update` and `TauCeti.ComplexManifold.isManifold_real`, all present.
- R05 (unused multipliers) — repaired: deleted; `README.md:1013–1017` names `SchwartzMap.fourierMultiplierCLM` and `TemperedDistribution.fourierMultiplierCLM` (`Mathlib/Analysis/Distribution/FourierMultiplier.lean`, `…/Sobolev.lean`).
- R06 (homogeneity Check) — repaired: `README.md:1883–1886` now says the inverse convention makes the `k=1` space zero (`F(v)=tF(tv)→0`) and puts `V*` at `k=−1`; recomputed with `φ=v₁`.
- R07 (order against #1807/#1398) — not repaired. Carried as R06.

## Verified sound

**Gate** (worker, `41f5a15`): `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK`.

**Dependency check** (rerun with `--movable`), exact output:

```text
depcheck: 239 roadmaps, 2426 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. ComplexKahlerGeometry is on main and not in `ORDER.txt`; ComplexComparisonPartII (43), K3Surfaces (132) and GeometricQuantization (150) are listed and cite this roadmap as a supplier; this README consumes none of them (its two mentions of ComplexComparisonPartII, `:1836–1838` and `:1924–1925`, are deferrals).

**Outside the folder**: `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/ComplexKahlerGeometry'` is empty. `PROGRESS.md`, `STATUS.md` and `metadata.toml` in the folder are main's files, unchanged.

**Lean**: `lake env lean TauCetiRoadmap/ComplexKahlerGeometry/Suggested.lean` exits 0 in 16 s with exactly 21 `sorry` warnings (lines 83, 105, 121, 151, 163, 179, 192, 203, 219, 234, 251, 259, 269, 292, 327, 334, 369, 381, 390, 407, 422) and nothing else. Module form (`module`, `public import Mathlib`, seven `public import TauCeti.*`, `@[expose] public noncomputable section`); all seven Tau Ceti modules exist at `2fd255d`. No `set_option`, no sorry'd data, no `lemma`, `theorem` throughout, one docstring per declaration.

**Section-binder audit** (`scratch/signatures.md` and my own `#check @` run on a scratch copy, 30 declarations): the three Dolbeault definitions drop `[FiniteDimensional ℂ E]`, which their bodies do not need (`delBar` and `typeProjection` are defined without it); the theorems about them carry it. `IsKahler` keeps `[FiniteDimensional ℝ E]` (needed by `nijenhuis`). `del_delBar_lemma`, `finrank_deRhamCohomology_eq_sum_dolbeault`, `finrank_dolbeaultCohomology_symm` keep `[T2Space M] [CompactSpace M]`; `even_finrank_deRhamCohomology_odd` and `hard_lefschetz` keep `[I.Boundaryless] [T2Space M] [CompactSpace M]`; `newlander_nirenberg` keeps `[I.Boundaryless] [T2Space M]`. `isRegularLocalRing_holomorphicStalk` has `{M : Type}` because Mathlib's `smoothSheafCommRing` puts `M` and `R = ℂ` in one universe. Every elaborated type matches its README sentence (K1 `:191–195`, K2 `:218–221, 235–237, 291–295`, K3 `:375–379, 429–441, 453–454, 469–472, 501–504, 506–508`, K5a `:1015–1017`, K5b.1 `:1427–1431`, K6.0 `:1443–1446`, K6.1 `:1519–1535`).

**Padding probe** (scratch copy, one tactic each, `lake env lean`, exit 0): `complexBesselSymbol_temperate` (`fun_prop`, `unfold; fun_prop`, `simp [complexBesselSymbol]`), `finiteDimensional_dolbeaultCohomology` (`infer_instance`), `isRegularLocalRing_holomorphicStalk` and `uniqueFactorizationMonoid_holomorphicStalk` (`exact ⟨inferInstance, …⟩`), `finrank_dolbeaultCohomology_symm` (`rfl`, `simp`), `even_finrank_deRhamCohomology_odd` (`simp`), `hartogs_extension_across_point` (`exact ⟨f, …⟩`), `weierstrass_preparation_unique` (`simp_all`): none closes, every fallback `sorry` is used. The remaining thirteen are the named theorems of Demailly II and VI, Webster and the K2 solver; by reading, none is a definition restatement, a Check mirror or a boundary case. Nothing is padding.

**Headlines.** README headlines: Newlander–Nirenberg (K1), Dolbeault–Grothendieck and the parameter solver (K2), Dolbeault theorem (K2), Weierstrass preparation/division/uniqueness, the regular factorial local ring, Rückert, Oka, Cartan, Riemann extension, Hartogs across a point and across codimension two, singular-locus analyticity (K3), Chern connection/Koszul–Malgrange/flat correspondence (K4), the exponential sequence and `c₁` (K4.P), the distribution/Sobolev/Laplace theory (K5a), Dolbeault finiteness and Serre duality (K5b), Kähler identities (K6.0), `∂∂̄`, Hodge decomposition and symmetry, odd Betti parity, Hard Lefschetz, Hodge–Riemann, cycle classes (K6.1), the projective/torus/Hopf computations (K7), Frölicher and Iwasawa (K8). Statable ones stated: 21. Each unstated one is named in the docstring with its missing carrier, and each reason I checked is true at the pins: no sheaf of holomorphic `p`-forms or analytic-subset dimension theory or holomorphic-transition mixin (0 hits for `holomorphicPForms`, `AnalyticSubset`, `IsHolomorphicVectorBundle` in Tau Ceti); `holomorphicStructureSheaf` is `TopCat.Sheaf CommRingCat` with no units sheaf (`…/StructureSheaf/Basic.lean:68`; the only "unit" declarations are `isUnit_stalk_iff`/`nonunits_stalk`); `integralTopForm` takes `RoughForm I M ℝ k` (`…/Integration/TopForm.lean:518`); `SmoothForm.hodgeStar`/`codifferential` are on `SmoothForm I M ℝ k`; `deRhamComplex` is over `ℝ` (`…/DeRham/Basic.lean:45`); the projectivization import clash (R05, reproduced).

**Pinned declarations opened** (Tau Ceti `2fd255d`, Mathlib `1b1ccf4`):

| Declaration | File:line | What it gives / lacks |
| --- | --- | --- |
| `SmoothTwoForm.Compatible` | `TauCeti/Geometry/Symplectic/Manifold/TwoForm.lean:231` | `invariant ∧ tames`; `Compatible.isNondegenerate` (:238); so `IsKahler` forces positivity, not only invariance |
| `deRhamCohomology.wedge`, `.mk`, `mem_closedForms` | `TauCeti/Geometry/Manifold/DeRham/Wedge.lean:288`, `DeRham/Basic.lean:141, 82` | bilinear `H^k → H^l → H^(k+l)`, real; `lefschetzMap` is `(wedge (k+2j) 2).flip c` |
| `SmoothForm.IsOfType`, `typeProjection`, `isOfType_typeProjection`, `isOfType_iff_typeProjection_eq` | `…/DifferentialForm/AlmostComplexType.lean:201, 282, 305, 372` | type `(p,q)` ⟺ `p+q=k` and eigenvalue `(p−q)i`; range of `typeProjection p q` in degree `p+q` is exactly the `(p,q)` forms |
| `SmoothAlmostComplexStructure.del`, `delBar`, `IsOfType.del`, `IsOfType.delBar` | `…/Dolbeault/Basic.lean:86, 95, 140, 145` | `(1,0)`/`(0,1)` components of `d`; `∂̄` of `(p,q)` is `(p,q+1)` |
| `kerDelBarZeroEquiv` | `…/Dolbeault/Holomorphic.lean:131` | `∂̄`-closed functions ≃ holomorphic maps, the `p=0` case cited at `README.md:298` |
| `mextDerivₗ_eq_del_add_delBar_ofComplexManifold`, `del_del_ofComplexManifold`, `delBar_delBar_ofComplexManifold`, `del_delBar_add_delBar_del_ofComplexManifold` | `…/Dolbeault/ComplexManifold.lean` | the K2 calculus cited at `README.md:212–218` |
| `del_wedgeWith`, `delBar_wedgeWith`; `mapCoeff_delBar_of_map_smul_conj`, `mpullback_delBar` | `…/Dolbeault/Leibniz.lean`; `…/Dolbeault/Basic.lean` | graded Leibniz; conjugation; pullback naturality |
| `nijenhuis`, `nijenhuis_apply`, `nijenhuis_eq_zero_iff`, `nijenhuis_antisymm`, `nijenhuis_apply_left`, `baseChange_nijenhuis_antiholomorphicPart_antiholomorphicPart` | `TauCeti/Geometry/Symplectic/Manifold/Nijenhuis.lean` | as cited at `README.md:172–178` |
| `SmoothForm.instModule`, `smul_eq_mapCoeff`, `mextDerivₗ_smul`, `mpullback_smul`, `wedgeWith_smul_left_of_map_smul`, `wedgeWith_smul_right_of_map_smul` | `…/DifferentialForm/MapCoeff.lean:273`, `…/Pullback/Basic.lean`, `…/Wedge/MapCoeff.lean` | the K1 complex action cited at `README.md:140–147` |
| `IsManifold.restrictScalars_of_ne_zero`, `maximalAtlas_subset_restrictScalars_of_ne_zero`, `contMDiff_iff_mdifferentiable` | `TauCeti/Geometry/Manifold/Complex/Analytic.lean` | the K3.0 realified atlas |
| `ContinuousOn.analyticAt_of_differentiableAt_update`, `analyticOnNhd_iff_continuousOn_and_differentiableAt_update`, `analyticAt_circleIntegral`, `analyticOnNhd_circleIntegral`, `analyticOnNhd_iff_differentiableOn_of_finiteDimensional` | `TauCeti/Analysis/Complex/CauchyIntegralPolydisc.lean:292, 318, 466, 475, 365` | Osgood; parametric integrals |
| `smoothSheafCommRing`, `smoothSheaf` | `Mathlib/Geometry/Manifold/Sheaf/Smooth.lean:294, 93` | `C^∞` sections (`contDiffWithinAt_localInvariantProp ∞`), so over `𝓘(ℂ,E)` the stalk is the holomorphic germs; `M` and `R` share a universe |
| `isUnit_stalk_iff` | `Mathlib/Geometry/Manifold/Sheaf/LocallyRingedSpace.lean` | Mathlib's stalk units |
| `ImplicitFunctionData.analyticAt_implicitFunction` / `contDiffAt_implicitFunction` | `TauCeti/Analysis/Analytic/Inverse.lean:131` / `Mathlib/Analysis/Calculus/ImplicitContDiff.lean:41` | R07 |
| `Sheaf.H.δ` | `Mathlib/CategoryTheory/Sites/SheafCohomology/ExactSequences.lean:60` | the connecting map cited at `README.md:668, 737` |
| `TemperedDistribution.fourierMultiplierCLM`, `SchwartzMap.fourierMultiplierCLM`, `besselPotential`, `MemSobolev`, `BesselPotentialSpace`, `memSobolev_zero_iff` | `Mathlib/Analysis/Distribution/FourierMultiplier.lean`, `…/Sobolev.lean`, `Mathlib/Analysis/FunctionalSpaces/BesselPotentialSpace.lean` | K5a's Euclidean scale |
| `MontelSpace`, `ContinuousLinearEquiv.toCompactConvergenceCLM`; `TestFunction.continuous_iff_continuous_comp`; `SchwartzMap.fourier_convolution`; `Complex.HadamardThreeLines.norm_le_interp_of_mem_verticalClosedStrip'` | `Mathlib/Analysis/LocallyConvex/Montel.lean`; `…/Distribution/TestFunction.lean`; `…/Fourier/Convolution.lean`; `…/Complex/Hadamard.lean` | as cited |
| `MDifferentiable.exists_eq_const_of_compactSpace`, `MDifferentiable.isLocallyConstant`; `OnePoint.equivProjectivization`; `meromorphicOrderAt_eq_int_iff`; `MvPolynomial.mul_esymm_eq_sum`; `PowerSeries.IsWeierstrassFactorization`; `Differentiable.exists_eq_const_of_bounded`; `Complex.starConvex_one_slitPlane`; `LinearMap.det_restrictScalars`, `Algebra.norm_complex_eq`; `IsCoercive.continuousLinearEquivOfBilin`; `Opens.overPullbackSheafEquivOver`; `real_linearMap_map_smul_complex`, `ContinuousLinearMap.complexOfReal`, `differentiableAt_complex_iff_differentiableAt_real` | Mathlib (`Geometry/Manifold/Complex.lean`, `Topology/Compactification/OnePoint/ProjectiveLine.lean`, `Analysis/Meromorphic/Order.lean`, `RingTheory/MvPolynomial/Symmetric/NewtonIdentities.lean`, `RingTheory/PowerSeries/WeierstrassPreparation.lean`, `Analysis/Complex/Liouville.lean`, `Analysis/Complex/Convex.lean`, `Analysis/Complex/UpperHalfPlane/Manifold.lean`, `Analysis/InnerProductSpace/LaxMilgram.lean`, `Topology/Sheaves/Over.lean`, `Analysis/Complex/Conformal.lean`) | all present |
| `riemannianVolume`, `isLocallyFiniteMeasure_riemannianVolume`; `TauCeti.ComplexManifold.isManifold_real`; `nijenhuis_ofComplexManifold`; `SmoothAlmostComplexStructure.ofComplexManifold` | `…/Riemannian/VolumeDensity/Volume.lean`; `…/Complex/AlmostComplexStructure.lean:76, 221` | as cited |
| meromorphic germs, stalk algebra, Hodge star, projectivization | see R02–R05 | duplicated by the README |

**Citations resolved** (every cross-roadmap citation of the changed passages and of the findings; the rest were resolved by the earlier full reviews and are unchanged on main):

| Citation | Copy | Result |
| --- | --- | --- |
| ComplexComparisonPartII C5.4, C−1.1, C0.4, C5.1–C5.2 | #848 `d0ac71a` `:147, 153–155, 3349, 3626–3714` | C5.4 claims single ownership of the exponential segment (R01); consumes K5a/K6.1 |
| K3Surfaces 1.1 and gap `integral-topology` | #1285 `:13–16, 115, 125–146, 364` | takes `Pic_hol≃H¹(𝒪×)` from this roadmap, the exponential segment from C5.4 (R01) |
| GeometricQuantization §3.3 | #1186 `:19–20, 156–169, 641–651, 678` | vanishing by harmonic theory, `Pic_hol≃H²` from C5.4's segment (R01) |
| SchubertGeometry S5 | main `README.md:70–76` | algebraic; "neither an input nor a consumer" is correct |
| RealAlgebraicGeometry Layer 7 link | main `Completed/RealAlgebraicGeometry/README.md:479` | anchor matches |
| DifferentialGeometry 0.1, 0.3, 0.4, 1.2, 2.1, 2.2, 5.4, 5.5, 6.2, 8.3, 8.4, 9.3, 12.1, 12.4 | main `DifferentialGeometry/README.md:272–915` | all headings exist; `legacySmoothTwoFormEquiv`, `RoughDensity`, `Density`, `homotopyOperator`, `integralTopForm_eq_integralDensity`, `integral_riemannianVolume_eq_integralDensity`, `laplaceBeltrami`, `Manifold.Orientation` named there; `chainIntegral_map` not (R07) |
| ComplexManifolds M2.1, M2.2, M2.4, Milestones 1–7 | main `ComplexManifolds/README.md:197–203` | Milestone 2 item 1; resolver lead is a false positive |
| `CompactFormPair.operatorDomainV` | main `VariationalMethods/README.md` | a VariationalMethods target; resolver lead is a false positive |
| StableReduction Layer 4 anchor; SurfaceTopology Layers 2–3, 6, 8; PlanarTopology Layer 6; LieGroupoidsPoisson G1.3; TopologicalKTheory T1.6d; PseudodifferentialOperators P1.0 anchor; GlobalHolomorphicFunctions GH0/GH2/GH5.1; ContourIntegration; HodgeStructures | main (`TauCetiRoadmap/…`, `Completed/…`) | folders present; SurfaceTopology is on main, so the description's "Depends on #271 SurfaceTopology" is stale but harmless |
| Sakane pp. 188–189 | `sakane-parallelisable` lines 102–115 (page 4 = printed 189) | Theorem 1's preparation: last nonzero `C^m(G)` central, `A∩Γ` lattice ([11] p. 31), `AΓ` closed ([11] Thm 1.13), holomorphic principal torus bundle |

**Seeded sample, locators** (verified in the cache):

| Target | Locator | Lines | Result |
| --- | --- | --- | --- |
| K3.HolomorphicStalk | Demailly II (2.1), (2.3), (2.7), (2.10) | `demailly-agbook` 3794–3800, 3804–3817, 3872–3873, 3931–3936 | preparation with `a_k(0)=0`; division with uniqueness at (2.4); Noetherian; factorial; hypotheses match |
| K3 Lean docstrings | Demailly I (3.29); II (3.19), (4.2), (4.22), (4.29), (4.31) | 1288–1293; 4286–4295; 4399–4404; 4742–4752; 4842–4844; 4929 | local Dolbeault–Grothendieck (neighbourhood of 0); Oka as "same generators on a neighbourhood"; (4.2) is a Remark for connected `M`, componentwise it gives the open-set form; `I(V(J))=√J`; Cartan; `A_sing` analytic |
| K5b, K5b.1, K6.1 Lean docstrings | Demailly VI (7.2), (7.3), (8.5), (8.6), (8.12), (8.17) | 15385–15395, 15442–15456, 15523–15528, 15557–15560 | finite-dimensional harmonic isomorphism; Serre pairing nondegenerate; `h^(p,q)=h^(n−p,n−q)` "as soon as X is compact"; `∂∂̄`-lemma (a)⟺(c); `b_k=Σh^(p,q)`, odd Betti even; Hard Lefschetz over ℂ, `k≤n` |
| K6.0 | Ballmann Thm 4.17, pp. 47–48 | `ballmann-kahler` 1990–2016 | seven equivalent conditions incl. `dω=0`, `∇J=0`, normal coordinates at every point; the one-point criterion is correctly flagged as the roadmap's own |
| K7.2.TautologicalIncidence | Knutson §1, p. 1 | `knutson-borel-weil` 12–72 | incidence variety, blowup at the origin, tautological line, Liouville, weight spaces, sections of the dual = `V*` |
| K7.FlatDegreeZero | Berwick-Evans–Tripathy Remark 2.1, p. 6 | `berwick-evans-tripathy` 287–292 | degree-zero lines ↔ unitary characters `τm+n ↦ e^(2πi(mx+ny))` |
| K6.1 triangulation | Łojasiewicz §3 Thm 2, p. 464 | `lojasiewicz-triangulation` 512–515 | locally finite semianalytic family on a countable real-analytic manifold |
| K8.NilpotentCentralReduction | Sakane pp. 188–189 | `sakane-parallelisable` 102–115 | as above |
| K3.MeromorphicGermField, K4.ComponentwiseFiniteRankAssembly, K5a.DistributionLocalStructure, K5a.SmoothSectionMontel, K5a.ComponentwiseCompact, K5b.0, K7.1, K7.2, Fubini–Study, K7.2.RationalQuartic | no external locator; Mathlib/Tau Ceti names only | resolved in the table above | — |

The README flags no locator as unverified. Webster 1989, Hörmander and Wells are settled uncertified and cited by locator only.

**Ownership by object**: `roadmaps overlaps` reports no id dropped in either direction. Of the nearest roadmaps in vocabulary, ComplexComparisonPartII shares the exponential-sequence object (R01); DifferentialGeometry, CalibratedGeometry, GeometricQuantization and IndexTheory hand nothing back. #1807 and #1398 are revisions of this folder (R06). Within the pinned libraries the shared objects are R02–R05. Ownership against open pull requests whose files the brief did not give was not checked beyond `roadmaps grep`.

**Adversarial pass.** One row per statement; rows for the fifteen sampled targets, every declaration of `Suggested.lean`, and every target a finding touches. Values recomputed in this review.

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| `newlander_nirenberg` | `M=ℂ`, `J=i`, `n=1`, `φ=id`; `E=0`, `n=0`; `E=ℂ`, `n=2` | `finrank ℝ ℂ=2=2·1`, `N=0`, `dφ=id` intertwines; discrete `M`, constant `φ` to the point of `Fin 0→ℂ` is a local diffeo; `2≠4` excluded by `hdim` | Pass | — |
| same, negative | `N_J≠0` | pulling back `i` by a pseudoholomorphic local diffeo gives `N=0`, so `hJ` excludes it | Pass | — |
| `polydisc` | `r k≤0`; `n=0` | `Metric.ball c r=∅`, so the set is empty; `Set.univ.pi` over `Fin 0` is the point | Pass | — |
| `dolbeault_grothendieck_polydisc` | `n=1`, `p=q=0`, `φ=z̄ dz̄` | `ψ=z̄²/2`: `dψ(v)=z̄v̄`, `dψ(iv)=−iz̄v̄`, `∂̄ψ=(z̄v̄+i·(−iz̄v̄))/2·dz̄=z̄dz̄` | Pass | — |
| same, degenerate/negative | some `r k≤0`; `q+1>n`; `n=2`, `φ=z̄₂dz̄₁` | `φ=0=∂̄0`; no nonzero `(p,q+1)` forms; `∂̄φ=dz̄₂∧dz̄₁≠0` excluded by `hclosed` | Pass | — |
| K2 Check `dz̄/z̄` on `ℂ×` | `|z|=1` | `∂̄log|z|²=∂̄(log z+log z̄)=dz̄/z̄`; on the circle `z̄=1/z`, `dz̄/z̄=−dz/z`, `∮=−2πi` | Pass | — |
| `exists_mixed_parameter_dbar_solution` | `Ω=ℂ`, `Q=ℂ×`, `P` point, `f=pq`; `u=z` | `u=pq z̄`: `(pq+i(−i pq))/2=pq`, `∂̄_q u=0`; `(1+i·i)/2=0` so `u=z` is `∂̄`-closed | Pass | — |
| Parameter Cauchy–Green [sample K2] | `χ≡1` on `|z|<1`, `f=z̄` | `∂̄T(χz̄)=z̄` on the disc; `T(χf)` holomorphic off `tsupport χ` | Pass | — |
| `weierstrass_preparation` | `d=0`; `f=w²−z` | `f(0,0)≠0`, `u=f`, empty sum; `u=1`, `a₀=−z`, `a₁=0`, `a_i(0)=0` | Pass | — |
| `weierstrass_preparation_unique` | `f=uP=u'P'` | `P'=(u'⁻¹u)P+0=1·P+(P'−P)`, `deg_w(P'−P)<d`, so division uniqueness (Demailly (2.4)) gives `u=u'`, `P=P'` | Pass | R07 (locator) |
| `weierstrass_division` | `d=0` | `g(0,0)≠0`, `q=f/g`, `r` empty | Pass | — |
| `ruckert_nullstellensatz` | `k=0`; some `f_i(x)≠0` | zero set is everything, `g≡0` near `x`, `m=1`; zero set empty near `x`, ideal is the unit ideal, `m=0` works | Pass | — |
| `oka_coherence`, `cartan_coherence_reducedIdeal` | `k=0`; `V⊄U` | relations/ideal trivial, `m=0`; `V∩U∈𝓝x` can always be chosen, so `V⊆U` is no loss | Pass | — |
| `riemann_extension` | `k=0`; `ℂ`, `A={0}`, `f=1/z` | `A=U`, `interior U=U=∅` forces `U=∅`; `1/z` unbounded near 0, excluded by `hbdd` | Pass | — |
| `isRegularLocalRing_holomorphicStalk` | `E=0` | stalk `=ℂ`, a field: regular local of Krull dimension `0=finrank` | Pass | — |
| `uniqueFactorizationMonoid_holomorphicStalk` | `E=0`; `n=1` | `ℂ` is a UFD; the stalk is a DVR at the pin (`instIsDiscreteValuationRingStalk`) | Pass | R03 (cite) |
| K3.HolomorphicStalk [sample] | `f=w²−z`; `f=(w−z)e^w`; `f(0,w)≡0`; units | order 2: unit 1, `a₀=−z`; order 1: unit `e^w`, `w−z`; no finite order, excluded; `1+z` unit, `z` not (`isUnit_stalk_iff`); Newton `p₂=2z=e₁²−2e₂` with `e₁=0`, `e₂=−z` | Pass | R03 |
| K3.MeromorphicGermField [sample] | `f=(z−a)^(−2)+1`; `N=0`; zero germ | principal part `(z−a)^(−2)`, regular part `1`; `(2πi)^(−1)∮f(z)(z−a)dz=1`; `N=0` gives principal part 0; zero germ has order `⊤` | Pass | R02 (cite) |
| `hartogs_extension_across_point` | `ℂ²`, `f=z₁z₂`; `ℂ`, `1/z`; line with two origins | extends; `1/z` excluded by `2≤finrank`; the non-Hausdorff `ℂ²` with doubled origin: Hartogs in the chart at `p` gives `g`, no `T2Space` needed | Pass | — |
| `complexBesselSymbol` / `_temperate` | `ζ=0`; `‖ζ‖=1`, `z=2+2i`; `z=it` | `1`; `exp((1+i)log 2)`, modulus 2; modulus 1; `fun_prop`/`simp` fail, not padding | Pass | — |
| `dolbeaultCocycles`/`Coboundaries`/`DolbeaultCohomology` | `q=0`; `n=0`; `M=ℂ` | coboundaries `⊥` (no `(p,−1)` forms); point: `H^(0,0)=ℂ`, others 0; `H^(0,1)(ℂ)=0` by the solver with `P=Q=pt`, `Ω=ℂ` | Pass | — |
| `finiteDimensional_dolbeaultCohomology` | `M=∅`; `p>n` | `0`; no nonzero `(p,q)` forms | Pass | — |
| `finrank_dolbeaultCohomology_serre` | `ℂP¹`, `(p,q)=(0,0)`; `(1,0)` | `h^(0,0)=1=h^(1,1)`; `h^(1,0)=0=h^(0,1)`; `n−p` with `p≤n` has no junk | Pass | — |
| K5b.1 [sample] | `ℂP¹`, `O(−1)`; elliptic trivial line | `h⁰(O(−1))=0`, `h¹(O(−1))=h⁰(O(−1)*⊗K)=h⁰(O(−1))=0`; `h^(p,q)=1` for `p,q∈{0,1}` | Pass | — |
| K5b.0 [sample] | standard ℂ | `ω=dx∧dy=vol`; `|dz|²=2`; `*dz=dy−i dx=−i dz`; `barStar dz=*dz̄=dy+i dx=i dz̄` | Pass | — |
| K5b [sample] Serre pairing slot order | `ℂP¹`, `(1,0)×(0,1)` | `s∧t` of type `(1,1)`, `∫` is the pairing; `h^(1,0)·h^(0,1)=0`, degenerate only because both vanish | Pass | — |
| `IsKahler` | flat ℂ, `ω=dx∧dy`, `J=i`; `form=0` | closed, invariant, `ω(v,iv)=|v|²>0`, `N=0`; `0` fails `tames`, so Hopf with the zero form is excluded | Pass | — |
| `del_delBar_lemma` | elliptic curve, `α=ω` | `∫ω>0`, not `d`-exact, excluded by `hexact`; `α=∂∂̄γ` is `d`-exact since `∂∂̄=½d d^c`-type identity | Pass | — |
| `finrank_deRhamCohomology_eq_sum_dolbeault` | elliptic curve `k=1`; `ℂP¹` `k=2`; `k−p` junk | `2=1+1`; `1=0+1+0`; `p∈range(k+1)` so `p≤k` | Pass | — |
| `finrank_dolbeaultCohomology_symm` | `p>n`; Hopf | `0=0`; `h^(1,0)=0≠1=h^(0,1)` and Hopf admits no `IsKahler` (`H²(M;ℝ)=0`) | Pass | — |
| `even_finrank_deRhamCohomology_odd` | `T²`; `∅`; closed annulus; Kodaira–Thurston | `b₁=2`, `b₃=0`; `0`; `b₁=1`, excluded by `Boundaryless`; `b₁=3`, excluded by `nijenhuis=0` | Pass | — |
| `lefschetzMap` | `j=0`; `j=1` | `id`; `(wedge (k) 2).flip c`, i.e. `a↦a∧c` into `H^(k+2)` | Pass | — |
| `hard_lefschetz` | `n=0`; `ℂP²`, `k=0`; `S²×S²`, `aσ₁+bσ₂`; `σ₁` alone | `k=0`, map `id`; `1↦[ω]²`, `∫ω²=1≠0`; `(aσ₁+bσ₂)²=2abσ₁σ₂`, `∫=2ab≠0`; `σ₁²=0`, and `σ₁` is not `tames` (zero on the second factor) | Pass | — |
| K6.0 [adjacent] | `ℂP¹` chart scaled by `√π`; `H=diag(1+z₂+z̄₂,1)` | `H(w)=(1+π|w|²)^(−2)`, `H(0)=1`, `dH(0)=0`, `|H−1|≤2π|w|²`; `dω(0)=(i/2)(dz₂+dz̄₂)∧dz₁∧dz̄₁≠0` | Pass | — |
| K4.P (R01) | point; `ℂP¹`; `E_τ`; Enriques | `exp(2πif)=1⟺f∈ℤ`; `c₁(O(1))=+1`; `H¹(𝒪)=ℂ`, `c₁` not injective; 2-torsion `t`, curvature class 0 | Pass | R01 (ownership only) |
| K4.ComponentwiseFiniteRankAssembly [sample] | `M=ℕ`, `r(j)=j`; `∅`; rank 0 | fibres `ℂ^j` unbounded; unique empty family; zero bundle | Pass | — |
| K5a star [R04] | `ℝ²` | `*dx=dy`, `*dy=−dx`, `*²=(−1)^(1·1)=−1` = `hodgeStar_hodgeStar` | Pass | R04 (cite) |
| K5a.DistributionLocalStructure [sample] | `m=2`, `k=0`, `w=δ₀`; delta series | `H₂=t₊`, `F=x₊`, `D²F=δ₀`; `⟨δ^(n)/n!,φ⟩=(−1)^nφ^(n)(0)/n!=2^n` for `φ=1/(1+2x)` | Pass | — |
| K5a.SmoothSectionMontel [sample] | `M=ℕ` rank 1; `C⁰` unit ball on `[0,1]` | `ℂ^ℕ` with product topology, bounded ⊂ product of discs, compact (Tychonoff); not compact | Pass | — |
| K5a.ComponentwiseCompact [sample] | ranks `0,1,2` | `L²=0⊕ℂ⊕ℂ²`, `‖(0,3,(0,4))‖²=9+16=25` | Pass | — |
| K7.1 [sample, R05] | `n=0`; `[2:4]`; `OnePoint` | point (`instCompactSpace`); `[1:2]`; `∞↦[1:0]` | Pass | R05 (cite) |
| K7.2 [sample] | `O(a)⊗O(b)`, `K_(ℂP¹)` | transition `g^a g^b=g^(a+b)`; `dz=−w⁻²dw` gives `O(−2)` | Pass | — |
| Fubini–Study [sample] | `z=(1,0)`, `v=w=(0,1)`; `w=(1,i)/√2`; `diag(1,2)`; `∫` | `H=(1·1−0)/π=1/π=h(e₁,e₁)`; `r=2`, `h(e₁,e₂)=−w₁w̄₂/(4π)=i/(8π)`, transposed `−i/(8π)`; `4/π≠1/π`; `∫(1/π)(1+|w|²)^(−2)dλ=1` | Pass | — |
| K7.2.TautologicalIncidence [sample] | chart transition; `d=2,k=−1`; `k=0`; `d=1` | `a(e_i+z_k e_k+…)=az_k(e_k+z_k⁻¹e_i+…)`, so `a'=az_k`, `z'_i=1/z_k`, `z'_j=z_j/z_k`; `F(tv)=t⁻¹F(v)` forces `F=0`; constant; `h⁰(O(k))=1` on a point | Pass | — |
| K7.2.RationalQuartic [sample] | `n=1`; `n=2`; control | image `{b₂=0}`, `(0,0,1,0,0)` outside; exponent sums of `{0,1,3,4}`: `0,1,2,3,4,5,6,7,8`, `h⁰=9=4·2+1`, kernel `x₀x₃−x₁x₂` (`s⁴t⁴−s³t·st³=0`), `10−1=9`; rational normal quartic surjective at `n=1` | Pass | — |
| K7.FlatDegreeZero | `ρ=1`; `τ=i`, `ρ(m+ni)=(−1)^m`; gauge | holonomy `ρ(λ)⁻¹` from `(λ,v)~(0,ρ(λ)⁻¹v)`; `f=exp(πix)`, `f(z+1)=−f`, `f(z+i)=f`; `ρ=exp(aλ)`, `a=α+iβ`, `τ=x+iy`: `u=α`, `v=αx−βy`, `α+i(αx−αx+βy)/y=α+iβ` | Pass | — |
| K8.NilpotentCentralReduction [sample] | Heisenberg, integer lattice; `G=ℝ²` | last nonzero `C^m` = centre `≅ℝ`, `Γ∩A=ℤ`, base `ℝ²/ℤ²`, fibre `S¹`; abelian base case is the torus | Pass | — |
| Homogeneity Check (`README.md:1883–1886`) | `d=2`, `φ=v₁` | `φ(tv)=tφ(v)`: degree `+1`; inverse convention: `F(v)=tF(tv)→0`, `V*` at `k=−1` | Pass | — |

Fifty rows. No statement failed; the only changes are citations and ownership.

## Not verifiable

- #1807 and #1398 were read through `roadmaps show`, not elaborated; #848, #1285 and #1186 through their checkouts or `roadmaps show`.
- Webster 1989, Hörmander and Wells are uncertified (settled); Griffiths–Harris chapter 0 is cited without a cached text. The locators into them were not opened.
- The adversarial rows check instances; they are not proofs. The `∂∂̄`-lemma row relies on Demailly (8.6) for the implication from `d`-exact to `∂∂̄`-exact.
- Ownership was checked by object against the roadmaps on main, the pins and the open heads the brief lists; board packages (AnalyticNumberTheory, LawrenceVenkateshMethod, LogicAndDefinabilityInNumberTheory) are unrelated and were not opened.

## Source issues

- none
