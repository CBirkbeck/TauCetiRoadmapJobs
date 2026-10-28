# Review of AutomorphicSpectralTheory (pull request #925 at c5cfb92)

**Verdict:** needs changes

The mathematics of the sampled targets and of the three Lean statements checks out, with computed witnesses below. The verdict is forced by the gate: the dependency check reports six UPWARD edges and the residue scanner 45 hits. In my assessment the six UPWARD lines are false positives against the merge-order file's own header (five targets are roadmaps on main, the sixth is another author's new-folder pull request), and 29 of the 45 residue hits are mathematical vocabulary; the board has to settle both before this folder can be accepted. The remaining findings are P3 and the author's to take or leave.

## R01 (P2) — Dependency check: six UPWARD lines, roadmap not movable

**Location.** `TauCetiRoadmap/AutomorphicSpectralTheory/README.md` lines 39, 45–46, 84, 86, 193, 205, 334, 355, 1069, 1081, 1270, 1283, 2682, 3365, 3396, 3756, 3790, 3815, 3830.

**Claim.** The gate rule requires every named supplier to precede this roadmap in the merge order.

**Witness.** Output of the dependency check at this head, run by me:

```
not movable: AutomorphicSpectralTheory consumes GlobalQuadraticForms (#348) and is consumed by GanGrossPrasadUnitaryGroups (#210), which comes first: moving AutomorphicSpectralTheory after GlobalQuadraticForms would put a supplier after a consumer, a cycle through AutomorphicSpectralTheory
UPWARD: AutomorphicSpectralTheory (#88) -> AlgebraicCurves (#238) at README lines [1069, 1081, 3365, 3396]
UPWARD: AutomorphicSpectralTheory (#88) -> ClassFieldTheory (#255) at README lines [3756, 3790, 3815, 3830]
UPWARD: AutomorphicSpectralTheory (#88) -> GlobalQuadraticForms (#348) at README lines [2682]
UPWARD: AutomorphicSpectralTheory (#88) -> LFunctions (#309) at README lines [39, 1270, 1283]
UPWARD: AutomorphicSpectralTheory (#88) -> NoncommutativeGeometry (#209) at README lines [334, 355]
UPWARD: AutomorphicSpectralTheory (#88) -> OperatorTheory (#227) at README lines [45, 46, 84, 86, 193, 205]
depcheck: 164 roadmaps, 1179 edges, 6 problem(s)
```

**Assessment.** I believe every one of these lines is a false positive. AlgebraicCurves, ClassFieldTheory, GlobalQuadraticForms, NoncommutativeGeometry and OperatorTheory are folders on the content repository's main branch (`TauCetiRoadmap/OperatorTheory/SelfAdjointSpectralTheory`, `TauCetiRoadmap/OperatorTheory/OperatorIdeals`, `TauCetiRoadmap/ClassFieldTheory`, `TauCetiRoadmap/AlgebraicCurves`, `TauCetiRoadmap/GlobalQuadraticForms`, `TauCetiRoadmap/NoncommutativeGeometry` all exist there), and LFunctions is roed-math's pull request #248, which adds a new roadmap folder. The merge-order file's header says a roadmap may consume roadmaps above it, roadmaps on main, and other authors' pull requests; the brief's supply rules say the same. The one citation that is not on main, `OperatorTheory/UnboundedOperators` Part A (UO-A01, UO-A02, UO-A07), resolves at the head of kim-em's pull request #1027, which adds that sub-folder (its README has `## Part A`, and UO-A02 is defined at its line 24). The `not movable` line is a board-level order question (GanGrossPrasadUnitaryGroups at #210 consumes this roadmap and sits before GlobalQuadraticForms at #348); nothing in this README creates a cycle.

**Repair.** None for the author on the on-main citations. The board settles the order; if it prefers a textual fix, §4.17a (line 2682) can cite NumberFieldArithmetic alone for quadratic fields, ideals and units, but that removes only one of the six lines. I re-ran the check after reading every cited line; no UPWARD edge points to a roadmap that is neither on main nor another author's new-folder pull request.

## R02 (P3) — Residue scanner: 16 anchor tags; 29 vocabulary hits

**Location.** `TauCetiRoadmap/AutomorphicSpectralTheory/README.md` lines 1199, 1226, 1254, 1589, 2021, 2045, 2064, 2083, 2524, 2553, 2568, 2589, 2608, 2633, 3782, 3868 (`<a id=…>` tags).

**Claim.** The rule forbids `<a id=` anchors in the README and the word "packet".

**Witness.** Sixteen lines of the form `<a id="unitary-hecke-functional-equation"></a>`. The other 29 hits are "generic packet", "tempered packet", "wave-packet" (lines 39, 106, 110, 212, 1210, 1672–1713): L-packets and wave packets are the literature's names and cannot be renamed.

**Repair.** Replace the anchors by section-number citations (the README already cites its own sections as "§1.15c"; the sibling roadmaps that link here use section numbers, not anchors). Report the "packet" hits to the board as scanner false positives.

## R03 (P3) — Pull-request URL and branch-state wording in the README

**Location.** `TauCetiRoadmap/AutomorphicSpectralTheory/README.md` line 44 (`[V4.0.Fields](https://github.com/TauCetiProject/TauCetiRoadmap/pull/1041)`), and "on main" at lines 9, 45, 210.

**Claim.** Cross-roadmap citations name the roadmap and section, never a pull request; the README is timeless.

**Witness.** Line 44 links a supplier section to a pull-request page; line 210 reads "SA-B85 on main". VonNeumannAlgebras' own README at the head of #1041 has the V4.0.Fields section (its line 81), so the name alone resolves.

**Repair.** Write "VonNeumannAlgebras V4.0.Fields" without the URL; delete "on main" in the three places.

## R04 (P3) — §0.14 cites BPCZ22 A.0.9 for a tensor identification it does not state

**Location.** `TauCetiRoadmap/AutomorphicSpectralTheory/README.md` line 341: "For complete nuclear `E`, identify it with `𝓢(V)⊗̂πE` under the completeness hypotheses of A.0.9."

**Claim.** The locator supports the statement as written.

**Witness.** BPCZ22 line 6645–6652 defines `S(A,V)` for quasi-complete `V` and line 6653 (Lemma A.0.9.1) concerns holomorphic families of functionals; neither states `S(A,V) ≅ S(A) ⊗̂ V`. The identification is Trèves, *Topological Vector Spaces, Distributions and Kernels*, Theorem 44.1 (or Grothendieck's Théorème 13 cited at BPCZ22 line 6627), and needs only `E` complete: `𝓢(V)` is nuclear Fréchet, so nuclearity of `E` is an unused hypothesis.

**Repair.** Cite Trèves Thm 44.1 for the identification, keep A.0.9 for the definition, and drop "nuclear" from the hypothesis on `E` (or keep it and say it is not needed).

## R05 (P3) — Two supplier layers cited by a number the supplier does not use

**Location.** `TauCetiRoadmap/AutomorphicSpectralTheory/README.md` line 1003 ("AutomorphicLFunctionsAndLocalFactors Layer 0") and line 1584 ("SmoothRepresentationsOfLocalGroups Layer 4").

**Claim.** Every supplier citation names a section that exists where it is cited.

**Witness.** At the head of #924 the layers are `## Layer AL.0: Local and adelic Fourier analysis` (its line 290); at the head carrying SmoothRepresentationsOfLocalGroups the layers are `## Layer SR.4: spherical representations and Satake` (its line 3077). The README elsewhere writes "AL.0" and "SR.4".

**Repair.** "Layer AL.0" and "Layer SR.4".

## R06 (P3) — Backticked dotted API names that `Suggested.lean` does not declare

**Location.** `TauCetiRoadmap/AutomorphicSpectralTheory/README.md` line 3550 (`regularized_family_value.parabolic_independent`) and line 3659 (`twisted_truncated_trace.fourier_inverse`).

**Claim.** A backticked name of this roadmap's own in an API bullet is a claim that `Suggested.lean` declares it.

**Witness.** `TauCetiRoadmap/AutomorphicSpectralTheory/Suggested.lean` declares exactly seven names (listed under Verified sound); neither dotted name is among them. The citation resolver reports both as found nowhere.

**Repair.** State these API items in prose ("restriction to `X_L^G` is independent of the parabolic", "Fourier inversion over the degree characters") without a dotted Lean name.

## R07 (P3) — Reference [GZ86] links a third-party copy of a paywalled article

**Location.** `TauCetiRoadmap/AutomorphicSpectralTheory/README.md` line 3918.

**Claim.** Sources are read and cited from legal places (publisher, author page, institutional repository).

**Witness.** The link points to a personal site that is neither the authors' nor Springer's; the sources service resolves DOI 10.1007/BF01388809 only to a paywalled page and records the work as uncertified.

**Repair.** Cite [GZ86] by journal and DOI without the URL; the §§0.35, 0.37, 2.24, 2.25 locators then stand as uncertified.

## Verified sound

**Gate.** Residue and depcheck fail as above; every other check passes (`set_option=0 … build=0`). The targeted build of `TauCetiRoadmap.AutomorphicSpectralTheory.Suggested` succeeds with `sorry` the only warning. Pins in the README line 58 equal the manifest (Mathlib `6b7abb3c`, Tau Ceti `a91d3aaf`). No change outside the roadmap folder (`git diff --stat origin/main...HEAD` excluding the folder is empty).

**Lean file.** I elaborated a scratch copy with `#check @name` for all seven declarations; every elaborated type equals the README statement (§0.16, §1.14, §2.18, §0.35, §0.37, §2.25, §2.24), no section binder is lost (none is used), the single import is `Mathlib`, no `set_option`, no `lemma`, no sorry'd data. One-tactic probe (`sorry` replaced by `simp` in a scratch copy): `analytic_fredholm` ("simp made no progress"), `completed_eisenstein_continuation` and `green_kernel_continuation` (unsolved goals) all fail, so none is padding. The three definitions have real bodies on native carriers (`UpperHalfPlane`, `CongruenceSubgroup.Gamma0`, `Complex.cpow`, `tsum`, Bochner integral). Ownership: a Lean-level search over the open roadmap pull requests and main finds no other definition of a nonholomorphic Eisenstein series, Legendre `Q`, point-pair invariant or automorphic Green sum; GrossZagierAndArithmeticHeights (#1487) consumes §§0.35, 0.37–0.38, 1.14–1.30, 2.17–2.18, 2.23–2.25 by name (its README lines 19, 127, 138, 2009), so this roadmap is the owner. Ownership against open pull requests whose files the brief did not give me was checked only through the `roadmaps grep` index.

**Headline theorems.** From the README: spectral completeness (§4.3), residual classification (§4.14), Eisenstein continuation and Hecke comparison (§§1.15a–c, 2.4), Maass–Selberg (§§3.5–3.6), Franke's comparison (§5.10), Paley–Wiener and the coarse/fine/invariant trace formulas (§§6.1–6.16), the L²-Lefschetz formula (§6.20), the function-field fixed-degree trace (§§6.21–6.39), solvable base change and the degree-one comparison (§§7.1–7.2), the modular continuations (§§2.18, 2.24) and analytic Fredholm continuation (§0.16). The module docstring names each unstatable one and what it lacks (adelic reductive quotients, inducing spaces, intertwining operators, the quotient Laplacian, weighted complexes, Higgs carriers, local and global automorphic representations, canonical automorphic L-functions); I found no carrier at the pins that would make any of them statable (no self-adjoint Laplacian on `L²(Γ\ℍ)`, no Maass forms, no `K`-Bessel function, no adelic quotients). The three stated ones are statable and stated.

**Seeded sample, source by source** (locators read in the cached texts):

- §0.7: Tes09 line 37 confirms the 12 February 2009 version; Lemma 3.3 at line 3788 (printed p.92), Lemma 3.4 with (3.35)–(3.37) at lines 3822–3837 (p.93), Lemma 3.16 at line 4354 (p.104), Theorem 3.17 at line 4370 (p.105); Art05 Theorem 7.2(b) at lines 1890–1924 (p.35). SA-B85 exists on main (`TauCetiRoadmap/OperatorTheory/SelfAdjointSpectralTheory/README.md` line 676) with the `C₀(X)` specialization (line 132), measurable multiplicity and the change-of-measure unitary (lines 700–712).
- §0.13: BPCZ22 (A.0.7.8) at lines 6632–6639 (p.331): complete nuclear LF `V`, function space `W` with topology finer than pointwise, image characterized by the two slice conditions, exactly as restated.
- §0.14: BPCZ22 A.0.9 at lines 6645–6652 defines `S(A,V)` for quasi-complete `V`; see R04 for the tensor identification.
- §0.20 (and §§0.19, 0.21): Yu22 lines 1835–1856 (p.35): `λ′ ↦ λ′/w⁻¹(λ′)` has image the identity component, kernel `X^{L_w}_{L_w}`, and `|ker μ_w| = |X^{L_w}_{L_w}|·|w|` with `|w|` the product of cycle lengths.
- §0.30: DIT16 Lemma 7 (9.4) at lines 1462–1468 (p.980) and (A.1) at lines 1641–1646 (p.983): the Whittaker cycle integral equals `G(s,μ) t^{1/2} J_{s−1/2}(t)` with `G(s,μ) = e(±μ/4)(2π)^{3/2} 2^{−s} Γ(2s)/[Γ((s+1+μ)/2)Γ((s+1−μ)/2)]`; `e(±μ/4) = exp(±iπμ/2)` as the README writes.
- §0.31: DIT16 lines 1652–1722 (pp.983–984): the ODE `g″ + (1 + (1/4 − ν²)/t²) g = 0` with `ν = s − 1/2`, i.e. `1 − s(s−1)/t²`; integration by parts with vanishing endpoint terms (line 1710). The source does the positive sign and conjugates (line 1647); the README's direct treatment of both signs is its own route and is consistent.
- §1.5: Lan66 Lemma 3 at lines 125–139 (p.3): zero for non-associate `P′`, the sum over `Ω(𝔞,𝔞′)` of `exp(sΛ(H′(g)) + ρ(H′(g)))(M(s,Λ)Φ)(g)` for associate `P′`; Bruhat computation at lines 142–170 (p.4); `M(1,Λ) = I` when `Γ∩N\N` has measure one (line 169).
- §1.15c: BL24 (arXiv v3, same §2.3 theorem) lines 215–231: meromorphic continuation, functional equation `E(M(w,λ)φ, wλ) = E(φ,λ)`, cocycle relation, root-hyperplane singularities; §5 (SL₂) at line 407. Lan80 is an image-only scan (not verifiable here); Sha10 is a book (not verifiable). The supplied objects resolve at the head of #924: `<a id="hecke-l-functional-equation">` (its line 1506), `canonical-rank-one-comparison` (1439), `rank-one-local-functional-equation` (1228); at the head of #856: `local-constant-gauss-sum` (2053), `standard-test-function-evaluations` (2140), `hecke-zeta-integral-comparison` (2201), `finite-order-hecke-functional-equation` (2237), `root-number-product-formula` (2261), "Global inputs" (2102). `TauCeti.GlobalNumberFields.HeckeCharacter` is `ContinuousMonoidHom (IdeleClassGroup (𝓞 K) K) ℂˣ` (`TauCeti/NumberTheory/NumberField/Global/HeckeCharacter/Basic.lean` line 70), so the unitarity hypothesis `∀ c, ‖(ω c : ℂ)‖ = 1` is well-typed.
- §2.13: JZ20 Theorem B.2 at lines 3985–3990 (p.85), proof at lines 3993–4030 (pp.86–87): `τ` irreducible admissible unitary generic self-dual on `G_{E/F}(a)`, `σ` in the generic local L-packet, `N(ω₀, τ⊗σ, s)` holomorphic and nonzero for `Re s ≥ 1/2`; the proof's nongeneric case uses Proposition B.1 (irreducible standard modules), matching §2.9.
- §2.24 (with §§2.25, 0.35, 0.37): GZ86 is uncertified (paywalled); the mathematics is recomputed below. DIT16 (8.2)–(8.4) at lines 1087–1108 (pp.973–974) for the resolvent kernel and the embedded-eigenvalue subtraction used by §2.19.
- §4.11: Yu22 Définition 2.3.4 at line 488 (p.11) and the `|θ|`-weighted norm at lines 479–485: a discrete representation is a simple `H_{M_P}`-submodule of `L²(M_P(F)\M_P(A))^K_θ`; Remark 3 (lines 497–500) gives the constant function as discrete and not cuspidal, which is the README's first Check.
- §5.12: Mun Theorem 2.1.1 at lines 626–633 (p.15) and (2.1.1) at line 587 (p.14); CGH20 Lemma 3.1 at lines 189–207, whose proof realizes eigenclasses by isobaric representations via Franke–Schwermer.
- §6.1: CD90 Théorème 1 at lines 95–110 (pp.194–195): conditions (i) finite support in `δ`, (ii) Paley–Wiener in `ν`, (iii) `K`-conjugacy invariance, (iv) the induction relation; the real-points-of-a-connected-reductive-group hypothesis at lines 39–45.
- §6.11: Art05 (21.11)–(21.16) at lines 7901–7985 (pp.135–137): normalized operators `R_{Q|P} = r_{Q|P}⁻¹ J_{Q|P}`, properties (i)–(iv), the `(G,M)`-family `r_Q(Λ,π_λ) = r_{Q|P}(π_λ)⁻¹ r_{Q|P}(π_{λ+Λ})`.
- §6.36: Yu22 (5.2.11)–(5.2.13) at lines 1830–1860 (p.35): the `|stab(P,π)|⁻¹` factor, the limit `μ₀ → 1` over `X^G_{L_w}` of the `Q`-sum, the finite-kernel average `|ker μ_w|⁻¹ Σ_{λ₀ ∈ μ_w⁻¹(λ_π)}`.
- §7.1d: Ram18 Proposition 1.1 at lines 173–179 (p.5): for every finite `T ⊂ Σ¹_{K/F}` prime to the conductors and the discriminant, a solvable tower with `π_M ≅ π′_M` and `T` split; Claim 1.2 at line 182; the `n²` self-twist bound at lines 92–93 (p.3).
- §0.16 (headline): DZ22 Definitions C.6–C.7 at lines 21089–21105 and Theorem C.8 at lines 21114–21118 (pp.521–523): connected open `Ω`, holomorphic Fredholm family invertible at one point, inverse meromorphic with finite-rank poles.
- §2.18 (headline): DIT16 (5.2) at lines 503–508, (5.3)–(5.5) at lines 516–524 (pp.961–962): `E* = Λ(2s)E` entire except simple poles at `s = 0, 1`, `E*(z,1−s) = E*(z,s)`, `Res_{s=1} = −Res_{s=0} = 1/2`.

**Library declarations opened at the pins** (file under the pinned Mathlib or Tau Ceti): `MeasureTheory.L2.inner_def` (`MeasureTheory/Function/L2Space.lean` line 136); `MeasureTheory.integral_tsum` (`MeasureTheory/Integral/DominatedConvergence.lean`); `hasFDerivAt_integral_of_dominated_of_fderiv_le`, `hasDerivAt_integral_of_dominated_loc_of_deriv_le` (`Analysis/Calculus/ParametricIntegral.lean`); `WithSeminorms.banach_steinhaus` (`Analysis/LocallyConvex/Barrelled.lean`); `Complex.besselJ`, `Complex.besselJ_neg_int`, `Complex.analyticOnNhd_besselJ_int` (`Analysis/SpecialFunctions/Bessel.lean`); `Complex.radius_regularizedHGFunSeries_eq_top` (`Analysis/SpecialFunctions/RegularizedHypergeometric.lean`); `Complex.betaIntegral_eq_Gamma_mul_div` (`Analysis/SpecialFunctions/Gamma/Beta.lean`); `Complex.Gamma_mul_Gamma_add_half`; `completedRiemannZeta`, `completedRiemannZeta_one_sub`, `zeta_eq_tsum_one_div_nat_add_one_cpow` (`NumberTheory/LSeries/RiemannZeta.lean`); `MonoidHom.measurePreserving` (`MeasureTheory/Measure/Haar/Unique.lean`); `UnitAddTorus.hasSum_mFourier_series_apply_of_summable` (`Analysis/Fourier/AddCircleMulti.lean`); `AddChar.expect_eq_ite` (`Analysis/Fourier/FiniteAbelian/Orthogonality.lean` line 33); `AddChar.complexBasis` (`Analysis/Fourier/FiniteAbelian/PontryaginDuality.lean` line 125); `UpperHalfPlane.cosh_dist` (`Analysis/Complex/UpperHalfPlane/Metric.lean` line 67: `cosh (dist z w) = 1 + dist (z:ℂ) w ^ 2 / (2 * z.im * w.im)`, the coordinate used by `point_pair_invariant`), `UpperHalfPlane.tanh_half_dist`; `CongruenceSubgroup.Gamma0` (`NumberTheory/ModularForms/CongruenceSubgroups.lean`); `SchwartzMap.postcompCLM` (`Analysis/Distribution/SchwartzSpace/Basic.lean` line 1024); `TestFunction` topology (`Analysis/Distribution/TestFunction.lean`); `LinearMap.IsSymmetric.eigenvectorBasis`; `IsHilbertSum.mkInternal`; `Module.AEval'.X_smul_of`; `ArithmeticFunction.moebius`; `Ideal.primaryComponent`, `Ideal.primaryComponent_mem`, `Ideal.primaryComponent.map`, `Ideal.primaryComponent.map_ker_eq` (`Algebra/Module/Torsion/PrimaryComponent.lean`). Tau Ceti: `TauCeti.stdPeterWeylBasis`; `IsSelfAdjoint.existsUnique_isUnitary_complexGenerator_eq_I_smul`; `IsCompactOperator.finiteDimensional_eigenspace`; `TauCeti.isFredholm_one_sub` (`Analysis/Fredholm/CompactPerturbation.lean`); `ContinuousLinearMap.exists_hilbertBasis_forall_hasEigenvector`; `TauCeti.vitali` (`Analysis/Complex/Conformal/Vitali.lean`); `TauCeti.Multiquadratic.IsFundamentalDiscriminant`; `TauCeti.LinearPMap.IsResolventAt`, `resolventSet`, `resolvent` (`Analysis/Normed/Operator/Resolvent/Unbounded.lean`), `analyticAt_resolvent` (`…/Resolvent/Analytic.lean`); `TauCeti.exists_isFiniteMeasure_eq_nevanlinnaKernel_add` (`Analysis/Complex/Pick/Nevanlinna.lean`); `TauCeti.GlobalNumberFields.HeckeCharacter`. Mathlib's `EisensteinSeries` is the holomorphic weight-`k` series only; no nonholomorphic Eisenstein series, Legendre `Q`, Green kernel or analytic Fredholm theorem exists at either pin (`MeromorphicOn` occurs in Tau Ceti only in modular-form valence files).

**Cross-roadmap citations resolved** (on main or at the open head named): ArithmeticLocallySymmetricSpaces `FrankeInput` (its line 189, a hypothesis of ALS.5b.4, "not proved here"), `realPoints_lieGroup` (line 47), ALS.F.1 (571), ALS.F.6 (921), ALS.4.5 (3507), ALS.5b.3 (4253), ALS.5b.5, ALS.0.2; AutomorphicFormsOnReductiveGroups §0.2 `AdelicTestFunction` (115–117), §2.1 (289), §2.6 with Speh modules (435–443), §2.7 (460), §3.2 `eisensteinFiniteJetRealization` (514–518), §3.4 (552), §3.5 (569), §4.1 (597); AutomorphicLFunctionsAndLocalFactors Layers AL.0–AL.3 and the anchors `global-godement-jacquet` (1833), `automorphic-l-data` (2371), `pinned-niceness` (2361), `rs-global-poles` (2240), `rs-archimedean-realization` (2094), `isobaric-construction` (270), `isobaric-strong-multiplicity-one` (2289), `curve-additive-analysis` (2415) with `CurveAdditiveAnalysis` (2419), `restricted-tensor-realizations` (260), `archimedean-smooth-representations` (240); SmoothRepresentationsOfLocalGroups SR.1.1, SR.2, SR.3.3, SR.4.1–4.2; ArithmeticGaloisDuality R02.3.0d, R02.4.5a–b, R02.4.6; VonNeumannAlgebras V4.0.Fields and V4.Core (#1041 head, lines 81 and 54); OperatorTheory/UnboundedOperators Part A (#1027 head); OperatorTheory/SelfAdjointSpectralTheory SA-B01, B05, B14, B21 (`ProjValMeasure.diagMeasure`, its `Suggested.lean` line 291), B26, B29 (`proj_inter`), B33, B36, B85, D20, E01, E03, E05, E43, E44, and `borelCalculus` (line 394); OperatorTheory/OperatorIdeals OI-B29, B30, B32, B35, B36, B40, B41, B83, B90, C01, C14, `hilbertSchmidtEnergy`; AdelicAlgebraicGroups §§0.1, 2.1, 3.1, 3.6; ReductiveGroupsPartII RG2.0, RG2.4, RG2.5; ReductiveGroups Layer 7; GlobalNumberFields Layers 9–10 (#1339 head, lines 503, 526); ClassFieldTheory Layers 11–12 on main; Chebotarev Layer 10 (`Completed/Chebotarev/README.md` line 410); NumberFieldArithmetic (Completed); GlobalQuadraticForms, FuchsianOrbifolds, NoncommutativeGeometry N1 with completed projective tensors (line 84–92), AlgebraicVectorBundles L0B (228), SchemeAndStackFoundations §3.3, AlgebraicCurves Layer 12E (1155), LFunctions Layers 5–6 (#248 head, lines 929, 1100), RepresentationTheory/LieGroups Layer 9 `iwasawaDecomposition` (448, 216), LieHighestWeight Layer 7 (627). No declared gaps (no readable `design/plan.json`); no `*Needs:*` line cites a roadmap later than this one other than the six lines of R01.

**Adversarial table** (values computed by hand or numerically; the integrals by midpoint quadrature with 2·10⁵ nodes on `[0,40]`):

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| `nonholomorphic_eisenstein` = `(1/2) y^s Σ_{gcd=1} |cz+d|^{−2s}` (§1.14, Lean line 60) | `(c,d) = (0,±1)`; `(c,d) = (0,0)`; `s = 2`, `z = iy`, `y → ∞` | `Int.gcd 0 0 = 0` excludes the origin; `(0,±1)` give `2·y^s·1`, halved to `y^s`; `E(iy,2)/y² → 1` | agrees with DIT16 (5.2) and the Checks | none |
| `completed_eisenstein_continuation` residues (§2.18, Lean line 67) | `s = 1`; `s = 0`; `s = 1/2` | `Res_{s=1} E = 3/π`, `Λ(2) = π/6`, product `1/2`; reflection gives `−1/2` at `0`; at `s=1/2` the simple pole of `Λ(2s)` meets the zero of `E(z,1/2)`, finite | matches DIT16 (5.5); `AnalyticOnNhd` on `{0,1}ᶜ` correct | none |
| `completedRiemannZeta` residues (Check §1.15c, line 1274) | `s = 0, 1` | Mathlib `Λ(s) = Λ₀(s) − 1/s − 1/(1−s)`: residues `−1`, `+1` | correct | none |
| `legendre_q` (§0.35, Lean line 81) | `s = 1, t = 3`; `s = 2, t = 3`; `t ≤ 1` | numeric `0.3465736` vs `½ log 2 = 0.3465736`; `0.0397208` vs `3/2 log 2 − 1 = 0.0397208`; for `t ≤ 1` the integrand is `t^{−s}` constant, Bochner integral `0` (junk, used only off the diagonal) | correct; junk value harmless under the off-orbit hypothesis | none |
| `₂F₁` form of `Q_{s−1}` (§0.35) | `s = 1, t = 3` | `Γ(1)²/(2Γ(2))·(1/2)·₂F₁(1,1;2;1/2) = (1/4)(2 log 2) = ½ log 2` | agrees with the integral | none |
| `point_pair_invariant` coordinate (§0.37, Lean line 86) | `z = z′`; `z = i, z′ = 2i` | `1 + 0 = 1 = cosh 0`; `1 + 1/(2·1·2) = 5/4 = cosh(log 2)` | equals `cosh dist` by Mathlib `cosh_dist` | none |
| `g₁ = g` (§0.37) | general `z, z′` | `t+1 = |z−z̄′|²/(2yy′)`, `t−1 = |z−z′|²/(2yy′)`, so `−2Q₀(t) = log(|z−z′|²/|z−z̄′|²)` | correct | none |
| `Δ_GZ g_s = s(s−1) g_s` (§0.37, §2.25) | radial `f(t)`, `t = cosh d` | `Δ_GZ f = ((t²−1)f′)′`; Legendre `((1−t²)Q′)′ = −s(s−1)Q` | eigenvalue `s(s−1)` for `Δ_GZ`, `s(1−s)` for `Δ` | none |
| `automorphic_green` counting (§2.25, Lean line 95; Conventions line 23) | `γ` and `−γ` in `Γ₀(N)` | both give the same summand; `(1/2)Σ_{Γ₀(N)} = Σ_{Γ₀(N)/±I}` | agrees with "each projective element once" | none |
| Convergence of the Green sum for `Re s > 1` (§2.25) | lattice-point count `#{γ : d(z,γz′) ≤ R} ≍ e^R`; `Q_{s−1}(t) ≍ t^{−s}` | `Σ e^{−σ d}` converges iff `σ > 1` | `tsum` is the honest sum exactly on the stated region | none |
| `κ_N = −12/[SL₂(ℤ):Γ₀(N)]` (§2.24, Lean line 102) | `N = 1, 2, 6, 12`; `N = 0` | residue of `R_{N,s}` at `1` is `1/vol`, `vol = (π/3)·index`, `G = −4πR` gives `−12/index`: `−12, −4, −1, −1/2`; `index = N∏(1+1/p)` gives the same; `N = 0` has infinite index, Mathlib `index = 0`, excluded by `hN` | correct, constant in `z, z′` | none |
| `G_{N,s} = −4π R_{N,s}` (§2.25) | free resolvent | free Green kernel of `Δ − s(1−s)` is `(1/2π) Q_{s−1}(cosh d)`; `−2Q = −4π·(1/2π)Q` | correct | none |
| Finite part not harmonic (§2.24) | expand `G = κ/(s−1) + G₀ + O(s−1)` | `Δ_GZ G = s(s−1)G` gives `Δ_GZ G₀ = κ_N` at `s = 1` | correct; Check "`Δ_GZ` value `−12`" at `N = 1` | none |
| Uniform radius `r` in `green_kernel_continuation` | spectrum of `Δ_N` | poles of the kernel near `1` come from `s(1−s) = λ_j`; smallest positive `λ₁` gives `s₁ < 1`; continuous spectrum on `Re s = 1/2`; `r < min(1/2, 1 − s₁)` depends on `N` only | quantifier order `∃ r ∃ G ∀ z z′` is right | none |
| `analytic_fredholm` (§0.16, Lean line 40) | `V = 0`; constant `K`; a pole of order `n` | `V = 0`: `1 − K = 0 = 1` is a unit, `R = 0` works; constant invertible `K`: `R` constant, `n = 0`; at a pole the Laurent coefficients `A_j` are finite rank by DZ22 C.7 | matches Theorem C.8 with the invertible-point hypothesis; `IsConnected U` is in scope | none |
| Resolvent sign convention (Conventions line 19) | `A = 0`, `z = i` | `(A − zI)⁻¹ = (−i)⁻¹ = i` | positive imaginary, as stated | none |
| `Δ y² = −2y²`, `Δ_GZ y² = 2y²` (line 23) | `f = y²` | `−y²·∂ᵧ²(y²) = −2y²` | correct | none |
| Unitary-weight shift at `k = 1/2` (line 23) | `k = 1/2` | `k²/4 − k/2 = 1/16 − 1/4 = −3/16` | correct | none |
| Dilation norm (line 27) | `r = 4`, `Re s = 0` | `‖r^{s+1/2} f(r·)‖² = r^{2Re s}‖f‖²` = `‖f‖²`; without `r^{1/2}`: `‖f‖²/4`, norm halved | correct | none |
| Rank-one regularized value (line 21; §6.11 Checks) | `c_P = 1`, `c_P̄(z) = R(λ)⁻¹R(λ+z)`, `θ_P = z/v`, `θ_P̄ = −z/v` | `v/z − v/z − vR⁻¹R′ = −vR⁻¹R′`; with `v = 1`, `R = exp`: `−1`; `R ≡ 1`: `0` | correct | none |
| §0.7 Checks | `N = diag(i,i,−i)`; `C₀(ℝ)` on `L²⊕L²`; `π(f) = f(0)I` on `ℂ²`; `H = 0` | multiplicities `2, 1`, `E({i}) = diag(1,1,0)`; `‖e^{t²/2}f‖²_{e^{−t²}dt} = ‖f‖²`; control `δ₀`, multiplicity `2`, not faithful; zero measure and field | all correct | none |
| §0.13 Checks | `ℂ^m ⊗ ℂ^n`; singleton `X`; zero factor | all `m×n` arrays; `F̂`; `0` | correct | none |
| §0.14 Check | Gaussian `e^{−π‖v‖²}e` | self-dual Fourier transform is the same Gaussian | correct | R04 on the locator only |
| §0.19 groups | one cycle `l = 2, d = 1`; one cycle `l = 1, d = 2`; `w = 1` | `A = μ₂`, `B = B₀ = {(z,z⁻¹)}`; `B = μ₂`, `B₀ = 1`; `A = T`, `B = ∏μ_{d_j}`, `B₀ = 1` | correct | none |
| §0.20 `δ_w` kernel and fibres | cycle `(l_j, d_j)`, `v ↦ v/w⁻¹(v)` | kernel = cycle-constant `c_j` with `c_j^{l_j d_j} = 1`, i.e. `∏μ_{N_j}`; surjective onto `∏_t v_t = 1` by solving the telescoping product and choosing an `l_j`-th root; fibre size `∏N_j` | matches Yu22 lines 1852–1856 | none |
| §0.21 `|ker μ_w| = ∏l_j · ∏N_j` | `A ∩ B₀`; component group of `T` | `A ∩ B₀ = ∏μ_{l_j}`; `T/T° ≅ ℤ/gcd(d_j)` and `u₁ = ζ_{N₁}` hits a generator, so `A·B₀ = T` | agrees with Yu22 `|X^{L_w}_{L_w}|·|w|` | none |
| §6.36 Check "all cycle lengths one" | `l_j = 1` | `D = 1·∏d_j` | consistent with §0.21 | none |
| §1.15c Check `ω = |·|^{ir}` | `A = D` | `Λ_H(ω,u) = D^{u/2}·D^{−(u+ir)/2}Λ_F(u+ir) = D^{−ir/2}Λ_F(u+ir)`; `Λ_F(s) = Λ_F(1−s)` gives `W_H = D^{−ir}`; poles at `u = −ir, 1−ir` | correct | none |
| §1.15c Check `ℚ(√2)` | `ε = 1+√2`, `r = π/log ε` | `|ε/ε′|^{ir} = ε^{2ir} = e^{2πi} = 1`; `−1` trivially | well-defined, shifts `±ir` | none |
| §1.15c Check imaginary quadratic | `η = ω|·|^{m/2−it}` | `(z/|z|)^m |z|_ℂ^{m/2} = z^m|z|^{−m}|z|^m = z^m` for every `m ∈ ℤ` | correct | none |
| §1.15c Check conductor `4` | `χ_{−4}` | odd (`a = 1`): `Γ_ℝ(u+1)`; `τ(χ)/(i·2) = 2i/2i = 1` | correct | none |
| §1.15c Check `h(u) = e^{2πiu}` | period one | `h(u)/h(u+1) = 1` | preserves the ratio, fails the Euler-product normalization | none |
| §0.30 constant | `G(s,μ)` | `e(±μ/4) = e^{±iπμ/2}` | equal to DIT16 (9.4) | none |
| §0.31 ODE and endpoints | `ν = s − 1/2` | `1/4 − ν² = −s(s−1)`; `M_{μ,s−1/2}(2t sinθ)/sinθ ≍ sin^{s−1}θ`, endpoint terms `O(δ^σ)` | correct | none |
| §1.5 empty Weyl set | non-associate `Q` | constant term `0` | Lan66 Lemma 3(a) | none |
| §7.1d self-twist bound | rank `m` | Ram18 `n²` | matches `m²` | none |
| §2.13 hypotheses | `τ` nonunitary; arbitrary local Arthur parameter | excluded by the README, as in JZ20 B.2 | correct | none |

**Duplication by object.** Searched the pins and the open roadmaps for nonholomorphic Eisenstein series, Green kernels, resolvent kernels, analytic Fredholm continuation, Legendre functions, Maass–Selberg, Arthur truncation, invariant trace formula, Weyl law, Paley–Wiener, weighted orbital integrals, Franke's filtration, Moeglin–Waldspurger and base change. Hits outside this roadmap are consumers (GrossZagierAndArithmeticHeights #1487 cites §§0.35–0.45, 1.14–1.30, 2.17–2.25; GanGrossPrasadUnitaryGroups #1404 cites the truncation operator) or different objects (SpectralManifolds' Weyl law on closed manifolds; KleinianGroups' Eisenstein subgroups). ArithmeticLocallySymmetricSpaces leaves `FrankeInput` as a hypothesis (its line 189); Layer 5 here proves it, which is the intended division.

## Not verifiable

- [GZ86] (§§0.35, 0.36, 0.37, 2.24, 2.25): Invent. Math. 84, DOI 10.1007/BF01388809, resolves only to a paywalled page; the README's link is a third-party copy (R07). The residues, kernels and constants were recomputed above instead.
- [Lan80] (§1.15c): the IAS copy is an image-only scan and OCR is not installed on this worker.
- [Sha10] (§1.15c) and [AC89] (§7.1d): books with no legal open copy found; locators unchecked.
- [BL24]: the published pagination (pp.191, 197) was not checked; the arXiv v3 text has the same §2.3 theorem and §5 example.
- Ownership against open pull requests whose files the brief did not provide (for example EndoscopicTransferAndUnitaryTraceComparison #999, MetaplecticAutomorphicForms #1063, ModularityAndLanglandsExtensions #1180, which mention Paley–Wiener, resolvent kernels or residual spectra) was checked only through the roadmap index, not file by file.

## Source issues

- **Misprint** in DIT16 at (5.4), printed page 962: the source writes the functional equation with the right-hand side missing the variable `z`; it should be `E*(z,1−s) = E*(z,s)`; affects nothing.
