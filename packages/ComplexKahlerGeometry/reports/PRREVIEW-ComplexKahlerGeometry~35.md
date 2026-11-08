# Review of ComplexKahlerGeometry (pull request #1398 at 20c666e)

**Verdict:** needs changes

Full review. The folder changed by 402 lines since 80b9617. Of the seven findings of the previous review, three are repaired (R03, R05, R06), one is partly repaired (R04) and three stand (R01, R02, R07). The head still pins Tau Ceti at 358314d (`lake-manifest.json`), while every Tau Ceti declaration the README's contract now names exists only at main's pin 2fd255d9. Five findings: one P1, two P2, two P3.

## Previous findings

- **R01 (P1, Tau Ceti contract cites declarations absent at the pin): not repaired, and extended.** The branch's manifest still pins Tau Ceti 358314d. The repair cited more names at that pin instead of fewer: `README.md:191–203` now adds `IsManifold.restrictScalars_of_ne_zero`, `TauCeti.contMDiff_iff_mdifferentiable`, `TauCeti.deRhamComplex`, `TauCeti.deRhamCohomology`, `StarConvex.exists_contDiffOn_forall_extDeriv_eq`, `TauCeti.homotopyOperator` and Osgood's lemma to the same contract. See R01 below.
- **R02 (P2, README and docstring disagree on what the pin provides): not repaired.** `Suggested.lean:19–22, 36–40` still lists the Nijenhuis tensor, the type-form differential and the Hodge star as missing; `README.md:33–38, 330–341, 353–359` still says the pinned Tau Ceti has them. See R02 below.
- **R03 (P2, two owners for PseudodifferentialOperators' operator core and LieGroupoidsPoisson's Lie-algebra complex): repaired.** `README.md:27–32` and `154–161` now make P1.0 the owner of the operator carrier, symbols, transposes, adjoints, ∇*∇ and the Laplace-type predicate, with §5.1's density line preceding P1.0's adjoint part; this is the item order PseudodifferentialOperators records at `PseudodifferentialOperators/README.md:95–97`. `README.md:1104–1116` consumes them. `README.md:2537–2550` consumes LieGroupoidsPoisson §G1.3a for the real complex and keeps only the complex-scalar copy; §G1.3a on main (`LieGroupoidsPoisson/README.md:655–668`) is stated for a real Lie algebra with `[LieModule ℝ L V]`, so the complex copy is not a duplicate, and `LieGroupoidsPoisson/README.md:85–90` names K8 as consumer and K1 as owner of the eigenbundle comparison, as `README.md:368–372` now says.
- **R04 (P2, DifferentialGeometry ids dropped by #886): partly repaired.** The density citations now read "§5.5a" (`README.md:1058, 1102, 1430`), an id that only the head of #886 defines (`DifferentialGeometry/README.md:841` at the head of #886; main has "5.5 Densities, and Stokes with corners" at `DifferentialGeometry/README.md:528`). The chain and de Rham citations keep main's §§8.3–8.5 (`README.md:18, 139, 1426, 2067, 2107, 2208, 2699`), which #886 drops. The pull-request description names neither #886 nor an order. See R03 below.
- **R05 (P3, §5.7 had no Checks, no *Needs:* and no locators): repaired.** `README.md:1841–1873` adds four API bullets, five Checks and a *Needs:* line, and the locators Demailly VI (3.6), (3.8), Theorem 3.9, (4.2) and §7. Every Check value was recomputed (table below) and every locator opened (`demailly-agbook` lines 14360, 14375, 14386, 14675, 15370).
- **R06 (P3, two locators): repaired.** `Suggested.lean:123–127` cites (2.1) with the uniqueness clause of (2.3) and explains the division of `w^d` by `f`; `README.md:1655–1656` now says "DifferentialGeometry §1.1" and "DifferentialGeometry §0.4".
- **R07 (P3, no merge order against the four conflicting pull requests): not repaired.** The description's dependency block still names only #271, #1027 and #1028. See R04 below.

## R01 (P1) — The README's Tau Ceti contract cites about forty declarations that the pinned Tau Ceti 358314d does not have

Location: `README.md:33–38` ("The pinned Tau Ceti owns the pointwise real Hodge star … It also owns the real-analytic structure underlying a complex manifold"), `191–203`, `207–235`, `330–341`, `358–359`, `385`, `627–631`, `649`, `1018–1026`, `1036–1047`, `1102`, `1425`, `1457–1459`, `1509`, `1623–1628`, `1872`; and `README.md:303` ("DG's fixed-coefficient map `SmoothForm.mapCoeff`").

Claim: this head pins Tau Ceti at 358314d and Mathlib at f6090c7 (`lake-manifest.json`; main pins 2fd255d9 and 1b1ccf4). At 358314d none of the following names occurs in any `.lean` file of the pinned package:

- Hodge stars and codifferential: `Orientation.hodgeStar`, `volumeEquiv`, `formHodgeStar`, `complexHodgeStar`, `barHodgeStar`, `TauCeti.alternatingFormEquiv`, `TauCeti.alternatingFormInner`, `TauCeti.adjoint_wedgeLeft`, `koszulDifferential_hodgeStar`, `TauCeti.RoughForm.hodgeStar`, `TauCeti.SmoothForm.hodgeStar`, `TauCeti.SmoothForm.codifferential`, `integralTopForm_inner_mextDeriv_eq_inner_codifferential`, and every `*_apply`/`*_iff` identity named at lines 210–228;
- almost-complex calculus: `TauCeti.SmoothForm.IsOfType`, `del`, `delBar`, `nijenhuis`, `nijenhuis_apply`, `nijenhuis_antisymm`, `isInvolutiveComplexDistribution_eigenspace_I_iff`, `delBar_delBar_apply`, `del_del_apply`, `IsOfType.mextDerivₗ_eq_add_del_add_delBar_add`, `ofComplexManifold`, `nijenhuis_ofComplexManifold`;
- added since the previous review: `IsManifold.restrictScalars_of_ne_zero`, `IsManifold.maximalAtlas_subset_restrictScalars_of_ne_zero`, `TauCeti.contMDiff_iff_mdifferentiable`, `contMDiffOn_iff_mdifferentiableOn`, `contMDiffAt_iff_eventually_mdifferentiableAt`, `ContinuousOn.analyticOnNhd_of_differentiableAt_update`, `TauCeti.deRhamComplex`, `TauCeti.deRhamCohomology`, `deRhamCohomology.mk`, `StarConvex.exists_contDiffOn_forall_extDeriv_eq`, `TauCeti.homotopyOperator`, `TauCeti.SmoothSimplex.integral`, `SmoothForm.mapCoeff`.

So at the pin this branch declares, the pointwise and manifold stars, the type calculus, ∂, ∂̄, the Nijenhuis tensor, the realified atlas, the real de Rham complex and the flat Poincaré lemma that K1, K3.0, K5a, K5b and K6 consume have no owner: §1.1 and §5.1 deleted their own constructions at bad9cde6, and §3.0 deleted `realified_isManifold_analytic` at this head, in favour of these names.

Witness: a `grep -rl` over `.lake/packages/TauCeti/TauCeti` (HEAD 358314d) for each of the 40 names returns no file (`hodgeStar` 0, `nijenhuis` 0, `delBar` 0, `restrictScalars_of_ne_zero` 0, `deRhamCohomology` 0, `homotopyOperator` 0, `SmoothSimplex` 0, `mapCoeff` 0). At 2fd255d9 every one resolves: `Analysis/InnerProductSpace/HodgeStar/Basic.lean:161, 194, 198, 236`, `AlternatingForm.lean:82, 111, 128, 138, 147`, `Complex.lean:113, 126, 161, 219, 233`, `Contraction.lean:75, 89`, `Isometry.lean:80, 165`, `Geometry/Manifold/Riemannian/HodgeStar.lean:73, 296`, `Riemannian/Codifferential.lean:88, 252`, `Geometry/Symplectic/Manifold/Nijenhuis.lean:158, 170, 207`, `AlmostComplex/Eigenbundle.lean:96`, `Geometry/Manifold/DifferentialForm/Dolbeault/Basic.lean:86, 95, 151, 405, 414`, `Manifold/Complex/AlmostComplexStructure.lean:221`, `Manifold/Complex/Analytic.lean:115, 123, 168, 174, 181`, `Analysis/Complex/CauchyIntegralPolydisc.lean:311`, `Geometry/Manifold/DeRham/Basic.lean:45, 77`, `Analysis/Calculus/DifferentialForm/Poincare.lean:393`, `DifferentialForm/HomotopyOperator.lean:100`, `SmoothSingular/Integral.lean`, `DifferentialForm/MapCoeff.lean:87`.

Repair, route a (recommended): merge main into the branch so that `lake-manifest.json` pins Tau Ceti 2fd255d9 and Mathlib 1b1ccf4 (the manifest currently differs from main's by 235 lines); re-run `lake env lean` on `Suggested.lean` and the gate at those pins. Then apply R02. Two attribution fixes at that pin: `README.md:303` attributes `SmoothForm.mapCoeff` to DifferentialGeometry, whose README on main does not name it; it is Tau Ceti's (`DifferentialForm/MapCoeff.lean:87`), so move it to the "From Tau Ceti" contract. `README.md:1509` calls `TauCeti.homotopyOperator` "of DifferentialGeometry §5.4"; cite it as Tau Ceti's and keep §5.4 as the roadmap context.

Route b, if the branch keeps 358314d: restore §1.1's eigenbundle/type-projection/Nijenhuis constructions, §5.1's real and complex pointwise star, §3.0's `realified_isManifold_analytic` (the ac2f5a7 text), and state the de Rham complex, the homotopy operator and the simplex integral as DifferentialGeometry targets; delete the contract lines 191–203 and 207–235.

## R02 (P2) — `Suggested.lean` and the README disagree about the pins, and on the README's account three statable headlines are absent

Location: `Suggested.lean:19–20` ("Newlander–Nirenberg needs the Nijenhuis tensor and the comparison between a complex atlas and its induced smooth almost-complex structure"), `21–22`, `36–40`; against `README.md:33–38`, `330–341`, `353–359`, `1623–1628`.

Claim: the module docstring says the Nijenhuis tensor, the type-form differential, the manifold form complexes and the Hodge star are not available at the pins; the README says the pinned Tau Ceti has exactly these. One of the two is wrong at every pin: at 358314d the docstring is right and the README's contract is R01; at 2fd255d9, where R01's route a takes the branch, the README is right and three headlines are statable and absent:

- Newlander–Nirenberg, in the local form of `README.md:353–357`, with `TauCeti.SmoothAlmostComplexStructure` and `nijenhuis` (`Nijenhuis.lean:158`, type `TangentSpace I x →L[ℝ] TangentSpace I x →L[ℝ] TangentSpace I x`); the converse is already `nijenhuis_ofComplexManifold`;
- the local Dolbeault–Grothendieck lemma, with `delBar : SmoothForm I M F k →ₗ[ℂ] SmoothForm I M F (k + 1)` (`Dolbeault/Basic.lean:95`) and `IsOfType` (`DifferentialForm/AlmostComplexType.lean:201`) on an open polydisc subtype of `Fin n → ℂ` with `J = ofComplexManifold`;
- the de Rham Hodge decomposition on a compact oriented Riemannian manifold, with `SmoothForm.hodgeStar`, `SmoothForm.codifferential` (`Codifferential.lean:88`) and `deRhamCohomology` (`DeRham/Basic.lean`).

Witness: `README.md:58–62` lists seven acceptance statements and defers "the other headline theorems and their missing geometric carriers" to the docstring, whose list contradicts lines 33–38.

Repair: on route a, add the three statements (the Newlander–Nirenberg shape given in the previous review fits the declarations at 2fd255d9; elaborate it after the merge) and rewrite the docstring bullets for Layers 1, 2 and 5 so they name only carriers still missing at 2fd255d9 (reduced analytic subsets, holomorphic bundle carriers, the density bundle and bundle distributions). On route b, delete the README contract; the docstring then stands.

## R03 (P2) — The DifferentialGeometry citations are split between two incompatible states of that roadmap, with no stated order

Location: `README.md:1058` ("DifferentialGeometry §5.5a's `RoughDensity` carrier"), `1102` ("*Needs:* DifferentialGeometry §§0.1–0.4, 5.5a"), `1430`; and `README.md:18, 139, 1426, 2067, 2107, 2208, 2699` ("§§8.3–8.5", "§8.4", "§8.5").

Claim: §5.5a exists only at the head of the open DifferentialGeometry revision #886 (main has one item 5.5), while §§8.3–8.5 exist only on main (#886 deletes Layers 6–11 and reassigns their content to DeRhamCohomologyAndDuality, which is downstream of this roadmap and cannot be cited). No merge order makes both sets of citations resolve, and the description names neither #886 nor an order. These are supplier citations (`*Needs:*` lines 1102 and 2107 and the contract at 139).

Witness: `DifferentialGeometry/README.md:841` at the head of #886 ("5.5a Densities, for every finite-dimensional real model"), `850` (5.5b); main `DifferentialGeometry/README.md:528` ("5.5 Densities, and Stokes with corners"), `836, 845, 852` (8.3, 8.4, 8.5); at #886 `grep -c '8\.3\|8\.4\|8\.5'` on the Layer 8 ids finds no definitions. The description's "Depends on" block lists #271, #1027, #1028 only.

Repair: write "DifferentialGeometry §5.5 (5.5a at the head of its open revision)" at 1058, 1102 and 1430, keep main's §§8.3–8.5 ids, and state in the description's merge-order paragraph that this pull request merges before #886, which then owes the old → new map for 8.3–8.5. Tested: with that wording every DG id resolves on main today, and the depcheck is unchanged (DifferentialGeometry is on main).

## R04 (P3) — Four open pull requests change this folder and conflict with this head, with no stated order

Location: the pull-request description, "Depends on" block (names #271, #1027, #1028).

Claim: the overlap facts show heads that conflict with this one in this folder's files, and the description states no rebase order.

Witness: #1234 (normal frames, Picard and projective examples) and #1807 conflict in `README.md` and `Suggested.lean`; #1808 and #1854 conflict in `Suggested.lean` (the overlap facts computed from the open heads). R03 adds #886 to the list of pull requests the description must name.

Repair: state which pull request rebases onto which (for example, #1234 onto this one; this one before #886 and before or after #1807/#1808/#1854), and do not restate here what #1234 changes.

## R05 (P3) — Typography, label precision and two unrecorded sources

Location and claim, one line each:

- Missing spaces fused to digits, at `README.md:1122` ("equal1 near closure J"), `1123` ("extended by0"), `1154` ("equal1 near S"), `1170` ("Dimension0 is separate"), `1176` ("near0"), `1669` ("degree0,1,2"), `1664` ("dimension2"), `781` ("Theorem4.29"), `783` ("item0"), `2183, 2185, 2193` ("Layer11", "Stage4", "AT4.7"), `2206` ("Stage4's"), `2445` ("Stage6.3's"), `2699–2710` ("DG8.3–8.5/12.1, AT4.5/4.7/6.1/6.3", "Stage4's", "Stage6's").
- `README.md:2613` reads "[ComplexManifolds ComplexManifolds Milestone 4]".
- `README.md:990, 1316, 1646, 1935` cite "PDE Lane A.3" and `1328` "PDE Lane B.9"; PDE on main labels these "§1.3 Agreement with the Bessel-potential scale (A3)" (`PDE/README.md:769`) and "§2.2 Interpolation (B9)" (`PDE/README.md:1148`), and has no "Lane". Cite the section and label as PDE writes them.
- `README.md:750, 2729` cite Griffiths–Harris chapter 0 §§1–2 and `2623, 2739` Raghunathan pp. 23 and 31; neither work is in the package's `sources.toml` (its twelve keys are ballmann-kahler, berwick-evans-tripathy, knutson-borel-weil, lojasiewicz-triangulation, demailly-agbook, sakane-parallelisable, angella-iwasawa, webster-nn, hormander-alpdo1, wells-dacm, rainer-advanced-complex-analysis, chevalley-eilenberg). Record both as `uncertified` by locator, as Hörmander and Wells are.

Repair: insert the spaces and the section labels as listed; add the two manifest entries.

## Verified sound

### Gate, build, signatures, padding

- Worktree at `20c666e4a6559be17db0659081b18fd83391f82e`, clean; `git diff --stat origin/main...HEAD` outside the folder is empty. The folder holds `README.md`, `Suggested.lean`, `metadata.toml` and main's generated `PROGRESS.md`/`STATUS.md`.
- Gate rerun from the worktree (`gate . ComplexKahlerGeometry --base origin/main`): every counter 0, `OK`. The worker's run adds `build=0`.
- `lake env lean TauCetiRoadmap/ComplexKahlerGeometry/Suggested.lean`: exit 0, exactly 7 warnings, all ``declaration uses `sorry` `` (lines 65, 85, 114, 128, 146, 163, 172).
- Movable dependency check on this head:

```text
depcheck: 242 roadmaps, 2452 edges, 0 problem(s)
```

- `#check @…` for all 7 declarations in one scratch file: the elaborated types are identical to the worker's listing; `FiniteDimensional ℂ E`, `I.Boundaryless`, `T2Space P`, `SecondCountableTopology P`, the analyticity and order hypotheses all occur in the types. `smoothSheafCommRing` is Mathlib's at f6090c7.
- Padding probe: each `sorry` replaced by `first | rfl | simp | infer_instance | exact?`, elaborated once: 0 of 7 closed (three `unsolved goals` after `simp`, four `exact?` failures).
- Header: `module`, `public import Mathlib`, `@[expose] public section`; no other import, no `set_option`, no `lemma`, no sorry'd data, no `example`. The README's seven backticked acceptance names (`README.md:58–61`) are exactly the file's declarations.

### Headline theorems

Headlines named in the README: Newlander–Nirenberg (§1.1), Dolbeault–Grothendieck and the Dolbeault theorem (§2.1), Runge and the mixed solver (§2.1, stated), Weierstrass preparation and division, Noetherian and factorial stalks (§3.1, stated), Nullstellensatz, Oka and Cartan coherence, Hartogs (§3.2), Chern connection, Koszul–Malgrange, flat correspondence (§4.1), elliptic regularity, de Rham Hodge theorem (§5.4), Dolbeault Hodge theorem and Serre duality (§5.8), Kähler identities, ∂∂̄, Hodge decomposition, Hard Lefschetz, Hodge–Riemann, cycle classes (§6), ℂPⁿ, tori, Hopf (§7), Frölicher and Nomizu/Sakane (§8). At the branch's pin 358314d the docstring's not-statable list is accurate (no `nijenhuis`, `delBar`, `hodgeStar`, `SmoothAlmostComplexStructure` has no Nijenhuis field, no analytic-subset carrier); the three that become statable at 2fd255d9 are R02.

### Library declarations opened at the pins

Mathlib f6090c7: `smoothSheafCommRing`, `TestFunction`, `Distribution` (`Analysis/Distribution/Distribution.lean:165`), `TemperedDistribution.MemSobolev`, `BesselPotentialSpace`, `fourierMultiplierCLM`, `Complex.HadamardThreeLines.norm_le_interp_of_mem_verticalClosedStrip'`, `MontelSpace`, `ContinuousLinearEquiv.toCompactConvergenceCLM`, `SchwartzMap.fourier_convolution`, `Laplacian.laplacian`, `meromorphicOrderAt_eq_int_iff`, `CovariantDerivative.leviCivitaConnection`, `exteriorPower.exteriorPower_hodgeStar_eq_wedgePairing`, `ImplicitFunctionData.contDiffAt_implicitFunction`, `MDifferentiable.exists_eq_const_of_compactSpace`, `MDifferentiable.isLocallyConstant`, `OnePoint.equivProjectivization`, `differentiableAt_complex_iff_differentiableAt_real`, `real_linearMap_map_smul_complex`, `ContinuousLinearMap.complexOfReal`, `ContDiffAt.to_localInverse`, `ContDiffAt.implicitFunction`, `LinearMap.det_restrictScalars`, `Algebra.norm_complex_eq`, `Opens.overPullbackSheafEquivOver`, `sheafRestrict`, `TestFunction.continuous_iff_continuous_comp`, `TemperedDistribution.memSobolev_zero_iff`, `IsCoercive.continuousLinearEquivOfBilin`, `Complex.starConvex_one_slitPlane`, `BoundedContinuousFunction.arzela_ascoli`, `MvPolynomial.mul_esymm_eq_sum`, `PowerSeries.IsWeierstrassFactorization`, `AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq`, `isUnit_stalk_iff`, `FundamentalGroupoid`, `ContMDiffSection`, `CWComplex`, `LieModule.Cohomology.oneCochain/twoCochain/d₁₂/d₂₃`, `SpectralObject`, `circleMap`, `curveIntegral`, `Projectivization`: all present (one or more files each).

Tau Ceti 358314d: `DifferentiableOn.analyticOnNhd_of_finiteDimensional` and `analyticOnNhd_iff_differentiableOn_of_finiteDimensional` (`Analysis/Complex/CauchyIntegralPolydisc.lean:275, 282`), `analyticAt_circleIntegral` (335), `analyticOnNhd_circleIntegral` (348), `analyticAt_implicitFunction` (`Analysis/Analytic/Inverse.lean:129`), `riemannianVolume` and `isLocallyFiniteMeasure_riemannianVolume` (`Riemannian/VolumeDensity/Volume.lean:76, 101`), `IsCoercive.formSolutionMap` (`Variational/Spectrum.lean:93`), `SmoothAlmostComplexStructure` (`Symplectic/Manifold/AlmostComplex.lean:67`), `SmoothTwoForm.Compatible` (`TwoForm.lean:157`), `principalPart`. `Manifold.Orientation`, `OrientationLift` and `IsOrientationPreservingAt` are DifferentialGeometry roadmap targets (`DifferentialGeometry/README.md:345, 352`), not library names, as the README says.

Tau Ceti 2fd255d9 (read for R01/R02): `IsManifold.restrictScalars_of_ne_zero (hm : m ≠ 0) (h : IsManifold 𝓘(ℂ, E) m M) : IsManifold 𝓘(ℝ, E) n M` with `E` finite-dimensional and no separation hypotheses (`Complex/Analytic.lean:115`), as `README.md:627–629` states; `contMDiff_iff_mdifferentiable (hn : n ≠ 0)` for a boundaryless finite-dimensional source model (174); `nijenhuis_apply` gives `[JX,JY] − [X,Y] − J[JX,Y] − J[X,JY]` (`Nijenhuis.lean:170–175`), matching `README.md:336`; `delBar_delBar_apply` has the factor `−(4 : ℂ)⁻¹` (`Dolbeault/Basic.lean:405–406`), matching `README.md:340`; `isInvolutiveComplexDistribution_eigenspace_I_iff` is the `i`-eigenspace of the complexified `J` iff `J.nijenhuis = 0` (`Eigenbundle.lean:96–99`); `codifferential` is `(−1)^(m(k+2)+1) ⋆ d ⋆` on `(k+1)`-forms (`Codifferential.lean:88–91`), the README's `(−1)^(m(j+1)+1)` for a `j`-form; its adjointness needs `[BoundarylessManifold I M] [T2Space M] [SigmaCompactSpace M]` and one compactly supported form (247–258), as `README.md:1626–1627` states.

### Cross-roadmap citations resolved

- PseudodifferentialOperators on main: heading "### P1.0. Differential-operator core" (`:164`; anchor `#p10-differential-operator-core`); the adjoint part uses K5a's density bundle (`:401–407, 425`); the Laplace-type predicate with `CKG K5a consumes this predicate` (`:438–441`).
- LieGroupoidsPoisson on main: "### G1.3 Chevalley–Eilenberg complexes" (`:636`, anchor as cited), G1.3a label and the standalone real complex (`:639, 655–668`), "### G1.6 Complex Lie algebroids and the involutivity equivalence" (`:738`) with the eigenbundle comparison left to this roadmap (`:748–750`).
- DifferentialGeometry on main: items 0.1–0.4, 1.1–1.4, 2.1, 2.2, 5.2–5.5, 8.3–8.5, 12.1, 12.4 (`:272–352, 511–528, 836–852, 915, 923`), `RoughDensity`, `legacySmoothTwoFormEquiv`, `wedgeWith`, `homotopyOperator`, `laplaceBeltrami`, Mayer–Vietoris. R03 covers the #886 state.
- VariationalMethods at #1028: §§2.2–2.4, 3.1, 4.3, 5.1–5.3 (`:452, 494, 528, 562, 762, 839, 882, 924`); `CompactFormPair.operatorDomainV` (845), `exists_compact_selfAdjoint_shifted_inverse` (849), `mem_operatorDomainV_iff_summable` (884): the worker's three leads resolve.
- UnboundedOperators at #1027: §4.7 (UO-D06), `existsUnique_selfAdjoint_of_closed_form` (`:512, 534`).
- GlobalHolomorphicFunctions at #992: §§0.3, 2.5, 7.2 (`:381, 900, 1807`), stated as non-suppliers at `README.md:49–52`.
- DeRhamCohomologyAndDuality at #1768: §§2.4, 3.1–3.3, 4.1 (`:384, 443, 465, 486, 512`); its lines 75 and 695 record K6.1 as consumer of the boundaryless instances, as `README.md:52–56` says.
- CalibratedGeometry at #946 consumes K1, K2, K4, K5a, K5b.0 and K6.1 (`:75–76, 213–219`) and leaves singular-set integration to K6.1; no reverse edge.
- DGFloer at #1798: "### 1.3 The spectral sequence of a filtered complex" (`:1131`), ComplexKahlerGeometry named as consumer (`:4011`). FormalConnectionsOpers at #1056: F2.4 (`:722`) consumes K1, K3.0, K4 (`:64, 879`).
- RealAnalyticGeometry on main: R0–R5 (`:39, 49, 138, 624, 928, 1007`), R3.1 (676), R3.2 with "item0" (728, 819). AlgebraicTopology on main: Stages 3, 4, 6, 7 (`:471, 499, 946, 1573`), Stage 4.5/4.6, 6.3, 8.12 and `cwSubcomplexNeighborhoods`, `simplicialRealizationCW` present. GeometricTopology Layer 11 (`:831`). ComplexManifolds Milestones 1–7 (`:172–319`), Milestone 2 items 1–4 (`:203–215`), items 7.4–7.5 (`:373`). ComplexTori Milestone 1 (`:130`). SmoothBundlesConnections B1.0–B1.5, B2.1–B2.5, B3.1, B5.0–B5.2, B6.2, B6.3. CharacteristicClasses C1.5 (`:63–64`). HamiltonianReduction R5 (`SymplecticGeometry/HamiltonianReduction/README.md:305`), Hyperfunctions, SymplecticGeometry: consumers only. Completed/RealAlgebraicGeometry Layer 7 (`:479`, anchor as cited); Completed/ContourIntegration and Completed/HodgeStructures exist. PlanarTopology and SurfaceTopology exist only at #271, named in the description.
- The anchor map at `README.md:239–251` covers every `#k1`–`#k8` heading anchor; main cites `#k2-…` (Hyperfunctions), `#k5-…` (Hyperfunctions, PseudodifferentialOperators, SmoothBundlesConnections, SpinGeometry) and `#k7-…` (GeneralizedCohomology, MorseTheory, RiemannianGeometry).
- Ownership by object against open pull requests: `roadmaps grep` for `barHodgeStar`, "conjugate-linear Hodge star" and "Dolbeault Laplacian" finds no other roadmap owning them. SobolevDifferentialForms (#1609, read with `roadmaps show`) builds Sobolev forms and the codifferential on ℝⁿ test forms and records that "ComplexKahlerGeometry K5a specialises the same Mathlib star" (its line 117); §5.5's planar rough-form comparison on DG's carrier is a different object. ComplexComparisonPartII (#848) consumes "the supplied codifferential" (its line 1450).

### Adversarial pass

| Statement / convention | Instances tried | Values computed on each side | Result; change |
|---|---|---|---|
| `weierstrass_preparation` | n=0, f=w²+w³ | iteratedDeriv 0,1,2 of f(0,·) at 0: 0, 0, 2≠0, so d=2; u=1+w, a=(0,0) | True |
| `weierstrass_preparation` | n=1, f=w²−z | derivatives of w↦w² at 0: 0, 0, 2; u=1, a₀(z)=−z, a₀(0)=0, a₁=0 | True |
| `weierstrass_preparation`, d=0 | f=1+z+w | hd: f(0,0)=1≠0; empty sum, w⁰=1, u=f | True; matches docstring |
| `weierstrass_preparation`, negative | f=z | f(0,w)≡0: every iteratedDeriv is 0, hd fails for every d | Excluded, as the Check says |
| `weierstrass_preparation_unique` | n=1, d=1, f=w−z | u′(w+a′₀(z)): w=−a′₀(z) forces a′₀=−z, then u′=1 | True |
| uniqueness route | f=uP | w^d=u⁻¹f−Σa_i w^i; (2.3) uniqueness (line 3817) fixes u⁻¹, a_i | Route sound |
| `weierstrass_division` | n=0, g=w², f=1+w+w² | q=1, r=(1,1); degree-≤2 remainder would allow q=0, r=f | `Fin d` bound gives uniqueness |
| `weierstrass_division` | n=1, g=w²−z, f=w³ | q=w, r₀=0, r₁=z: (w²−z)w+zw=w³ | True |
| `weierstrass_division`, d=0 | g=2+w | q=f/(2+w), empty remainder | True |
| `finite_rank_runge_approximation` | K={0}, Ω=ℂ, U=D(0,1) | closure of ℂ∖{0} is ℂ, not compact: hypothesis holds; L=closed D(0,½), N=1, ζ=0, g=1: error 0 ≤ εB | True |
| Runge, negative | K=unit circle, Ω=ℂ | component of 0 is the disk, closure compact ⊆ ℂ: hypothesis fails; ∮dz/z=2πi, entire approximants give 0 | Excluded |
| Runge, empty K | K=∅ | L=∅, N=0, `K ⊆ interior L` vacuous | True |
| `mixed_parameter_solver` | P, Q points, f=1 | u=z̄: fderiv at 1 is 1, at i is −i; (1+i(−i))/2=1. u=z: (1+i·i)/2=0 | True; wrong model excluded |
| `mixed_parameter_solver` | f=pq, Q=ℂ∖{0} | u=pq z̄: (uₓ+iu_y)/2=pq, holomorphic in q | True |
| `holomorphicStalk_noetherian` | E=0; E=ℂ | stalk ℂ, a field; ℂ{z} has ideals (z^s) only (lines 3874–3876) | True; Thm 2.7 p. 81 |
| `holomorphicStalk_factorial` | E=ℂ²; real analogue | zw has nonassociate primes z, w; real germs exp(−1/x)·1ₓ>₀ and its reflection are nonzero with product 0 | True; Thm 2.10 p. 82 |
| Conventions g(u,v)=ω(u,Jv) | ℂ, u=v=∂ₓ | ω(∂ₓ,∂ᵧ)=1=g(∂ₓ,∂ₓ); −J gives −1 | Pass |
| d^c=i(∂̄−∂) | f=x²+y² | i(z dz̄−z̄ dz)=2x dy−2y dx; dd^c f=4dx∧dy=2i∂∂̄f | Pass |
| h_T vs h_src | u=1, v=i | h_T=0+i·1=i; h_src,tensor=2h_T(i,1)=2(−i)=−2i; h_src,native=2i; fundamental form 2dx∧dy | Pass |
| h_T(u^(1,0),v^(1,0))=2g_ℂ(bar u^(1,0),v^(1,0)) | u=v=∂ₓ | 2·¼(1+1)=1=g(∂ₓ,∂ₓ) | Pass |
| ω=(i/2)Σh dz∧dz̄, coframe norms | standard metric | (i/2)(−2i)dx∧dy=dx∧dy; Gram norm of dz is √2, h_T-dual norm 1 | Pass |
| §1.1 type decomposition | v=∂ₓ | (∂ₓ∓i∂ᵧ)/2 sum to ∂ₓ; J(∂ₓ−i∂ᵧ)/2=(∂ᵧ+i∂ₓ)/2=i(∂ₓ−i∂ᵧ)/2 | Pass |
| §1.1 Nijenhuis on (0,1) fields | [X,Y]=B+C | N=−4B; d(∂̄f)(X,Y)=∂f(B)=−¼∂f(N) | Pass; pinned −4⁻¹ at `Dolbeault/Basic.lean:406` |
| §2.1 Cauchy–Green sign | radial φ, φ(0)=1 | ∂̄φ=φ′(r)ζ/(2r); ∫(1/πζ)∂̄φ dA=∫₀^∞φ′(r)dr=−1 | Pass; Cor 3.4 p. 21 (line 918) |
| §2.1 Wirtinger | Demailly (3.1) line 879 | ∂/∂z=½(∂ₓ−i∂ᵧ) | Pass |
| §3.0 realification | z↦iz; z↦z̄; E=0 | matrix ((0,−1),(1,0)), det 1; z̄ has D(i)=−i≠iD(1); zero-dimensional transition analytic | Pass |
| §3.2 germs | z⁻¹; exp(1/z); 1+z | order −1, residue 1; infinitely many negative terms; value 1 | Pass |
| §4.1 Chern matrix | h=exp(\|z\|²) | A=h⁻¹∂h=z̄dz; Θ=dA=dz̄∧dz, type (1,1) | Pass; II (3.1)–(3.3) pp. 83–85 |
| §5.1 star Checks | plane, both orientations; dim 0 | *dx=dy, *dy=−dx, *²dx=−dx; reversed −dy, dx; *1=±1 | Pass |
| §5.1 density vs orientation | derivative −2 | density factor \|−2\|=2, orientation sign −1 | Pass |
| §5.1 transpose on 1 | P=x∂ₓ, density dx | Pᵗ=−x∂ₓ−1; ⟨P1,ψ⟩=−∫(xψ)′=0; with −x∂ₓ: ∫ψ=1 for a unit bump | Pass |
| §5.2 H_m | w=δ₀, m=2 | H₂=max(x,0), D²H₂=δ₀; ⟨x δ′,φ⟩=−1 | Pass |
| §5.2 delta series | test 1/(1+2x) | ⟨δ^(n)/n!,φ⟩=2^n: 1,2,4; sums 1,3,7 | Pass |
| §5.4 Sobolev Checks | χ₁=χ₂=1/√2; a=2ūv | ½+½=1; A=2, (A+1)⁻¹=⅓; D=2: D₀†D₀=4 | Pass |
| §5.4 Peetre | s<0 case | ⟨ζ+η⟩^s ≤ 2^(\|s\|/2)⟨ζ⟩^s⟨η⟩^\|s\| from (1+\|ζ\|²)≤2(1+\|ζ+η\|²)(1+\|η\|²) | Pass |
| §5.4 planar exactness | β=dx∧dy, u=z̄/(2i) | ∂̄u=1/(2i); d(u dz)=∂̄u dz̄∧dz=(1/2i)(2i)dx∧dy | Pass |
| §5.4 period of dz/z | Log_±, four arcs | Log_−−Log_+: 0 above, 2πi below; c_U=0, c_L=−2πi; Per=c_U−c_L=2πi; P([dz/z])=1 | Pass |
| §5.4 codifferential sign | Demailly (3.9) line 14386 | d⋆=(−1)^(mp+1)⋆d⋆ is adjoint of d on p-forms, so acts on (p+1)-forms: p=k−1 gives the README's (−1)^(m(k+1)+1) | Pass |
| §5.5 star on dz | dz=dx+i dy | *dz=dy−i dx=−i dz; *dz̄=i dz̄ | Pass |
| §5.5 δ formulas | α=P dx+Q dy; h dx∧dy | −⋆d⋆α=−(Pₓ+Q_y); −⋆dh=h_y dx−hₓ dy | Pass |
| §5.5 Checks | x dx+y dy; x dy; x²+y²; \|x\|³ | δ=−2, dα=0; dα=dx∧dy, δ=0; δ(h dx∧dy)=2y dx−2x dy, Δ_H=−4 vs +4; Δ_H\|x\|³=−6\|x\| | Pass |
| §5.5 Δ_H=−4∂z∂z̄ | C² u | ∂z∂z̄=¼(∂ₓ²+∂ᵧ²) | Pass |
| §5.6 component Checks | ranks (0,1,2), section (0,1,(1,i)) | 0+1+2=3; eigenvalue 2 with multiplicity 1+2=3 | Pass |
| §5.7 volume form | ℂ; ℂ² | (i/2)dz∧dz̄=dx∧dy=ω¹/1!; ω²=2ω₁∧ω₂, so ω²/2!=dvol | Pass; (4.2) line 14675 p. 296 |
| §5.7 dz∧barStar dz | standard metric | barStar dz=*(dz̄)=i dz̄; dz∧i dz̄=i(−2i)dx∧dy=2dx∧dy=⟨dz,dz⟩_Gram dvol with ⟨dz,dz⟩=1+1=2; dz∧*dz=dz∧(−i dz)=0 | Pass |
| §5.7 anticommutator | ψ=dz/√2; dz | (e_ψi_ψ+i_ψe_ψ)1=⟨ψ,ψ⟩=1; for dz: 2; ⟨dz,dz̄⟩=1+conj(i)(−i)=0 | Pass; (3.8) line 14375 |
| §5.7 ∂̄*=−*∂* | f dz̄, f=z; f=z̄ | *(f dz̄)=i f dz̄; ∂(i f dz̄)=i f_z dz∧dz̄; *(dz∧dz̄)=−2i; −*∂*(f dz̄)=−2f_z: −2 for z, 0 for z̄; ⟨∂̄u,f dz̄⟩=2∫conj(u_z̄)f=−2∫conj(u)f_z | Pass; Thm 3.9, §7 line 15370 |
| §5.7 (3.6) slot convention | s∧#t=⟨s,t⟩dV, # conjugate-linear | left side linear in s, so ⟨s,t⟩ is linear in s: Demailly's product is linear in its first slot; the README's ⟨β,α⟩ (conjugate-linear first) equals it | Pass; line 14358 |
| §5.7 dimension 0 | ℂ⁰ | volume 1=ω⁰/0!; star on ℂ is id, barStar(i)=−i | Pass |
| §5.8 Serre | ℂP¹, O(−1); O | h⁰(O(−1))=0 and h¹(O(−1))=h⁰(O(1)⊗K)=h⁰(O(1)⊗O(−2))=h⁰(O(−1))=0; h⁰(O)=1=h¹(K) | Pass; Thms 7.1–7.3 pp. 309–310 |
| §6.0 [Λ,L]=(n−k) | ℂ: 1, ω; ℂ²: 1 | Λω−0=1; 0−L1=−ω=(1−2)ω; ΛL1=2 | Pass; (5.4)–(5.5) p. 300 |
| §6.0 primitive | ℂ²: ω₁−ω₂ vs ω₁+ω₂ | Λ=0 vs 2 | Pass; Def 5.11, (5.15) p. 302 |
| §6.0 Kähler identities | α=x dy; f=x | [Λ,d]α=Λ(dx∧dy)=1; [Λ,∂]α=Λ(½dx∧dy)=½=i(−i/2); (d^c)*α=−i(−i/2−i/2)=−1; [L,d*]x=−δ(x dx∧dy)=dy=d^c x | Pass; Thm 6.4 p. 305 |
| §6.0 d^c vs Demailly | d^c_Dem=(i/4π)(d″−d′) | =d^c_README/(4π), as line 2011 says | Pass |
| §6.0 Laplacians | f=x²+y² | Δ_d f=−4; Δ_∂̄ f=Δ_d/2=−2 | Pass; Cor 6.5 p. 306 |
| §6.0 Nakano | iΘ=0; ±ω⊗Id on (n,k) | form 0, semipositive not positive; [iΘ,Λ]=±k Id by (7.1): Σ_S Σ_j\|u_jS\|²=k\|u\|² | Pass; (7.1) line 16819 p. 341 |
| §6.1 Hodge–Riemann sign | n=1 dz; n=2 ω₁−ω₂; dz₁∧dz₂ | i·(−2i)∫dx∧dy>0; (−1)^1∫(ω₁−ω₂)²=2vol>0; i²(−1)∫dz₁dz₂dz̄₁dz̄₂=4vol>0 | Pass |
| §6.1 relative cone | (α,β)↦(dα, α\|_W−dβ) | squared: (0, dα\|_W−dα\|_W)=0 | Pass |
| §6.1 evaluation | unit bump on ℝ² | absolute class 0 (H²_dR(ℝ²)=0); relative evaluation 1 | Pass; Łojasiewicz Thm 2 line 512, printed 464 |
| §7.1 charts | [1:2:3]; w=1/z | (2,3), (½,3/2); \|−1/z²\|²=\|z\|⁻⁴, +1 at z=1 | Pass; V §15.A line 13673 p. 277 |
| §7.2 Fubini–Study | ℂP¹ chart | (i/2π)(−2i)dx∧dy/(1+r²)²=dx∧dy/(π(1+r²)²); ∫=2∫₀^∞r/(1+r²)²dr=1 | Pass |
| §7.2 O(1) curvature | (15.8) line 13780 | Θ=d′d″log(1+\|z\|²)=(2π/i)ω_FS=−2πiω_FS; O(2): −4πiω_FS | Pass; p. 279 |
| §7.2 CW sums | ℂP⁰, ℂP¹, ℂP² | 1; 1+1=2; 3 | Pass |
| §7.2 genus | ℂP¹; torus; two tori | (0,0); (1,2); h^(1,0)=2, h^(0,0)=2 | Pass |
| §7.2 Hopf weights | z↦2z | z^a dz_j weight 2^(a+1)≥2; z₁^(−m)z₂^(−n)dz_j weight 2^(1−m−n)≤½; none is 1 | Pass |
| §8.1 CE normalization | [X,Y]=Z | dZ*(X,Y)=−Z*([X,Y])=−1; source δ=−½ with q+1=2 | Pass; (23.1)–(23.2) lines 1177–1183, printed 115 |
| §8.1 Iwasawa | Angella line 510 | dϕ₃=−ϕ₁∧ϕ₂ on p. 9; h^(1,0)=3, h^(0,1)=2, b₁=4 | Pass |
| §8.2 central reduction | Heisenberg | lower central series 𝔤⊃ℝZ⊃0; quotient ℝ², fibre ℝ/ℤ | Pass; Sakane Thm 1 line 102, printed 189 |

### Sources sampled

- `demailly-agbook`: I (3.1) p. 20 (line 879), Cor 3.4 p. 21 (918); II (2.1) p. 80 (3794), (2.3)–(2.4) p. 80 (3804–3817), Thm 2.7 p. 81 (3872), Thm 2.10 p. 82 (3931), (3.1)–(3.3) pp. 83–85 (3968, 4007, 4047), §4.4 (4825), Thm 4.29 p. 99 (4842), Thm 4.31 p. 100 (4929); V §15.A p. 277 (13673), (15.1)–(15.2) p. 277 (13691, 13699), (15.8) p. 279 (13780); VI (3.1)–(3.5) p. 291 (14323–14352), (3.6) and (3.8) p. 292 (14360, 14375), Thm 3.9 p. 292 (14386), Def 4.1 p. 296 (14652), (4.2) p. 296 (14675), Ex 4.4 and 4.6 p. 297 (14688, 14700), Thm 4.8 p. 298 (14736), (5.4)–(5.5) p. 300 (14871–14873), Cor 5.9 p. 301 (14948), Def 5.11 and (5.15) p. 302 (14967, 14987), Thm 6.4 p. 305 (15156), Cor 6.5 and Thm 6.7 p. 306 (15190, 15210), §7 D⋆=−⋆D⋆ p. 309 (15370), Thms 7.1–7.3 pp. 309–310 (15377–15390); VII Thm 1.1 p. 329 (16248), Cor 1.3 p. 330 (16281), (6.1)–(6.3) p. 338 (16637–16652), (7.1)–(7.2) p. 341 (16819, 16828). Every page and statement matches the README's claim.
- `rainer-advanced-complex-analysis`: Thm 11.1 (line 1338, PDF 31 = printed 25), Lemma 11.3 (1437–1443, PDF 33 = printed 27) with (3) the hull as K plus the relatively compact components and (4) its compactness, Thm 11.7 (1550, PDF 35 = printed 29).
- `lojasiewicz-triangulation` Thm 2 (line 512, printed 464 at line 504); `sakane-parallelisable` Thm 1 (line 102, printed 189 at line 95); `chevalley-eilenberg` (23.1)–(23.2) (lines 1177, 1183, PDF 31 = printed 115); `angella-iwasawa` §3 from line 479 on page 9, dϕ₃=−ϕ₁∧ϕ₂ at line 510.

## Not verifiable

- `webster-nn` (§1.1), `hormander-alpdo1` (§5.2) and `wells-dacm` (§5): settled as uncertified, not requested.
- Griffiths–Harris chapter 0 §§1–2 (§3.1 route) and Raghunathan pp. 23 and 31 (§8.2): paywalled books, not in the manifest (R05); no legal copy sought, this review is never parked. For Raghunathan I checked only that Sakane's proof cites those pages (`sakane-parallelisable` lines 112–113).
- The statements of `Suggested.lean` and the Newlander–Nirenberg shape of R02 at main's pins (Tau Ceti 2fd255d9, Mathlib 1b1ccf4): not elaborated, because this worktree's packages are at 358314d/f6090c7 and the brief allows `lake env lean` only there. Declarations at 2fd255d9 were read in the content checkout's pinned package.
- Ownership against #848 and #1609 by object was checked only through `roadmaps grep`/`roadmaps show` on the terms named above; their files are not in this brief.

## Source issues

- none
