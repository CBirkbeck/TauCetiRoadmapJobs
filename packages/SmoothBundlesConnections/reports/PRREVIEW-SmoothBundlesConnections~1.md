# Review of SmoothBundlesConnections (pull request #887 at 64aa4ab)

**Verdict:** needs changes

The gate fails on one residue rule (an `<a id=…>` anchor tag), so the folder cannot be accepted at this head whatever else holds. Beyond that there is one blocking supply defect (a two-way supply relation with LieGroupoidsPoisson, R01) and one blocking supplier-drift defect (DifferentialGeometry declarations and sections cited that DifferentialGeometry does not state, R02). The mathematics of the conventions and of the three stated Lean targets checked out under every instance tried (table below); the remaining findings are form and locator notes.

## R01 (P1) — Two-way supply with LieGroupoidsPoisson

**Location.** `TauCetiRoadmap/SmoothBundlesConnections/README.md` line 145 ("Consume LieGroupoidsPoisson G0.1's independent submersion fiber product"), lines 176–178 (G0.1's regular-level carrier for Ehresmann), lines 575–578 (G0.0's countability of π₁), line 807 (B7: "B5 uses … LieGroupoidsPoisson G0.0's").

**Claim.** This roadmap consumes LieGroupoidsPoisson G0.0 and G0.1 as suppliers.

**Witness.** LieGroupoidsPoisson's README at its open head (pull request 1050), "Dependency order and acceptance": "G0.1 … supplies SBC B1.1/B1.5", "G0.3 and G3.3 consume SBC B1.1's division and B1.4's quotient", "G3.3 … separately consumes B5"; its ownership list cites SmoothBundlesConnections B1–B5 as supplier. The merge order lists SmoothBundlesConnections at line 7 and LieGroupoidsPoisson at line 136, so the citation here is upward, and the two roadmaps cite each other. The mechanical check printed `depcheck: 200 roadmaps, 1319 edges, 0 problem(s)` with `--movable`; I believe that is a false negative: moving this roadmap below LieGroupoidsPoisson would turn LieGroupoidsPoisson's own B1/B5 citations upward, so no placement satisfies both READMEs.

**Repair.** This roadmap is the earlier one, so the two notions move down into it as targets, and the four LieGroupoidsPoisson citations are deleted: (a) in B1.1/B1.5 state the regular-fibre carrier `{p // π p = b}` of a smooth submersion with its manifold structure and tangent kernel, built from Tau Ceti's `sectionZeroChartedSpace` and `exists_isManifold_sectionZero_of_contMDiff` (`TauCeti/Geometry/Manifold/VectorBundle/Section/Chart.lean` line 246, `…/SmoothZero.lean` line 63) by the chart transfer the LieGroupoidsPoisson text describes, and the submersion fibre product `P ×_M P` as the regular fibre of `(p,q) ↦ (π p, π q)` over the diagonal; (b) in B5.2 state "π₁ of a connected second-countable manifold is countable" as a target of B5.2 (the proof named there is elementary). LieGroupoidsPoisson then cites these sections; that edit belongs to its own pull request.

## R02 (P2) — DifferentialGeometry cited for declarations and statements it does not make

**Location.** `README.md` lines 728 ("On each intersection DG8.4 gives `smoothCochainRestriction_quasiIso`"), 731–732 ("The column-zero integration square is DG's `smoothIntegration`, with evaluation exactly `chainIntegral`. Consume its `chainIntegral_map`"), 734–735 ("agrees with DG's `deRhamHom` by `deRhamHom_comparison`"), 757–764 (B6.2: "consume DG9.3's general fundamental-class integration comparison … `∫_(ℂP¹)η=⟨deRhamHom[η],[ℂP¹]_ℝ⟩`", "DG8.3's smooth/continuous relative-chain comparison and DG9.3's local-generator comparison").

**Claim.** These are supplied by DifferentialGeometry 8.3, 8.4 and 9.3.

**Witness.** On main, `TauCetiRoadmap/DifferentialGeometry/README.md` and `Suggested.lean` contain none of `smoothCochainRestriction_quasiIso`, `smoothIntegration`, `deRhamHom_comparison`, `chainIntegral_map` (0 occurrences each; also 0 at the open head of pull request 886, which revises that roadmap and is therefore not citable anyway). DG 8.4 (README line 845) lists `fullSimplex`, `chainIntegral`, `SmoothSimplex.integral_mextDeriv`, `deRhamHom`; DG 9.3 (line 872) is `poincareDuality` and its corollaries; the words "fundamental class", "local generator" and "relative chain" occur nowhere in DifferentialGeometry's README. `chainIntegral_map` occurs only in ComplexKahlerGeometry's README (line 1389 on main), which attributes it to DG8.4 with the same drift.

**Repair.** Cite only what DG 8.3–8.5 and 9.1 state (`smoothToSingular`, `chainIntegral`, `deRhamHom`, `fullSimplex`, `poincarePairing`), and state the rest as targets of B6.1/B6.2 here with hypotheses: the quasi-isomorphism of restriction from all real cochains to cover-small smooth cochains on each intersection (T2, σ-compact, finite-dimensional, as DG 8.3 requires), naturality of `chainIntegral` under smooth maps, the comparison of this roadmap's Čech–de Rham map with `deRhamHom`, and the fundamental-class pairing `∫_M η = ⟨deRhamHom [η], [M]_ℝ⟩` for a closed oriented M with AT Stage 6 item 3's orientation class.

## R03 (P3) — Gate residue: HTML anchor tag

**Location.** `README.md` line 455: `<a id="transport-connection-reconstruction"></a>`.

**Claim.** The gate's residue rule forbids `<a id=` anchor tags; the worker's gate reports `residue=1 … FAIL`.

**Witness.** Gate rule "no process residue: … `<a id=` anchor tags".

**Repair.** Delete the line; link to the heading `### B5.1. Reconstructing connections from smooth transport` by its generated anchor instead.

## R04 (P3) — `TransportDerivativeTargets.lean` breaks the Lean form rules and is not a headline

**Location.** `TauCetiRoadmap/SmoothBundlesConnections/TransportDerivativeTargets.lean` lines 1–3 (three `import Mathlib.<submodule>` lines), 5–13 (docstring "These are suggested forms"), 22–28 (`hasDerivAt_inverse_transport_section`).

**Claim.** A second Lean file carrying one target.

**Witness.** The Lean form rules apply to every `.lean` file in the folder: imports are the single line `import Mathlib` plus `TauCeti.*` modules; the docstring form is "<title>: target signatures". The theorem quantifies over free data only (`P : ℝ → F ≃L[ℝ] F`, `σ : ℝ → F`, `A : F →L[ℝ] F`) and its conclusion is calculus on its hypotheses: it names no object of the roadmap. It elaborates (one `sorry` warning) and is true: with `P 0 = id` and `P'(0) = −A`, `(P⁻¹)'(0) = −P(0)⁻¹ P'(0) P(0)⁻¹ = A`, so the derivative is `w + A (σ 0)`, consistent with B5.1's `A_x(v) = −∂_t P` and `∇ = d + A`.

**Repair.** Delete the file and the README sentence that links it (line 505–506). Keep the sign in the README as a Check of B5.1: "for `P(t) = exp(−tA)` on the trivial bundle and `σ(t) = σ₀ + t w`, the inverse-transport derivative at 0 is `w + A σ₀`; the opposite sign convention would give `w − A σ₀`."

## R05 (P3) — README form: no Checks, no `*Needs:*` lines, locators absent from most targets

**Location.** Whole README (955 lines). Counts: `**Checks.**` lists 0; `*Needs:*` lines 0; numbered locators (theorem, proposition, section or page) 7, all in B5.1, B6.0 and B8; no `**Summary.**`, `## Scope and ownership`, `## Conventions`, `## Exact supplier contracts`, `## How to read the build` sections; no `### Examples`/`### Dependencies` per layer.

**Claim.** The README is in the older numbered-list form.

**Witness.** Examples of targets stated without any locator: Ehresmann's fibration theorem (line 170), the slice theorem for proper actions (line 150), the arcwise-connected-subgroup theorem (line 548, Yamabe's theorem: Kobayashi–Nomizu I, Appendix 4), Ambrose–Singer (line 550: Kobayashi–Nomizu I, Thm. II.8.1), "zero curvature iff local parallel trivializations" (line 521), the free proper quotient manifold theorem (line 151). Kobayashi–Nomizu and Tu are cited as whole books in References. Every definition (SmoothGoodCover, the L² carrier, ad(P), the thin path groupoid, holonomy bundle, `c₁`) lacks a Checks list; the worked examples (Hopf, lens spaces, flat torus) are scattered as prose in B7.

**Repair.** Recast in the house shape: a Summary; Scope and ownership (moving the deferral sentences about FourManifolds F5, InstantonFloerTheory IF1, HamiltonianReduction R5, LieGroupoidsPoisson, AlgebraicVectorBundles there); Conventions (the current "Setting" paragraph); Exact supplier contracts per supplier with the declarations named in R02's repair; layers B1–B8 with `*Needs:*` lines per target and a locator per theorem (Kobayashi–Nomizu I: connections II.1, curvature II.5, holonomy II.4, reduction II.7, Ambrose–Singer II.8.1; Lee RM Lemma 6.16/Thm 6.17 for B6.0); at least three Checks per definition, using the computations already present (Hopf value 2π, lens-space `β(χ)=u`, the `c₀₀` incompleteness control, the sign of `[V_ξ,V_η]`).

## R06 (P3) — Mathlib pull-request numbers and process narrative

**Location.** `README.md` lines 110–116: "Follow the principal-bundle/connection direction in Mathlib #30121 and #38374 … replace the corresponding local constructions when they become available."

**Claim.** Policy: no pull-request numbers and no process narrative in a README; a roadmap defers to Mathlib but never waits for it.

**Witness.** The two links are to open Mathlib pull requests; "when they become available" is a time-bound instruction.

**Repair.** Describe the interface itself (principal structure as a mixin on `FiberBundle` data, right action by `MulAction (MulOpposite G)`, Lie-algebra-valued connection forms) and drop the pull-request references and the sentence about replacement.

## R07 (P3) — Source locators: a dead link and an unspecified edition

**Location.** `README.md` line 928 (Charles, *Holonomy and Chern classes*, link to `chapt2.pdf`); lines 583 and 611 ("Lee RM Lemma6.16/Thm6.17").

**Claim.** Both are the stated sources for B5's singular-cochain characteristic formula and for B6.0's convex neighbourhoods.

**Witness.** The Charles URL returns HTTP 404 through the sources service (today). "Lee RM" names no edition; Lemma 6.16/Theorem 6.17 are the uniformly normal and convex neighbourhood results in the second edition (2018) only; the text is not legally readable (see Not verifiable).

**Repair.** Replace the Charles link by a live locator (the IMPA lecture notes' current address or the published version) or drop the reference; write "Lee, *Introduction to Riemannian Manifolds*, 2nd ed., 2018, Lemma 6.16, Thm. 6.17" and record it as `uncertified` in `sources.toml` (the folder has no manifest yet; the nine cited works need entries).

## R08 (P3) — A statable B6.1 target the Lean file could carry

**Location.** `README.md` line 622 ("Prove acyclicity of smooth real functions by partitions of unity"); `Suggested.lean` docstring lines 23–41.

**Claim.** Not a headline, so not a defect: at the pin, `CategoryTheory.Sheaf.H` (`Mathlib/CategoryTheory/Sites/SheafCohomology/Basic.lean` line 46, `Ext` from the constant sheaf `ℤ`, under `[HasSheafify J AddCommGrpCat] [HasExt …]`) and `smoothSheafAddCommGroup` (generated by `to_additive` from `smoothSheafCommGroup`, `Mathlib/Geometry/Manifold/Sheaf/Smooth.lean` line 230) make "`H^n` of the sheaf of smooth real functions on a finite-dimensional T2 second-countable manifold vanishes for `n ≥ 1`" statable with those instance hypotheses.

**Repair.** Either state it in `Suggested.lean` under B6.1 or leave it; if left, no docstring change is needed since the docstring lists only headlines.

## Verified sound

**Gate and build.** The worker's gate: all scanners pass except `residue=1` (R03); `build=0`. I elaborated `Suggested.lean` with `lake env lean` (3.2 s): exactly three warnings, `declaration uses sorry` at lines 83, 90, 133, nothing else. `TransportDerivativeTargets.lean` elaborates with one `sorry` warning. No `set_option`, no sorry'd data, no `lemma`, single `import Mathlib` in `Suggested.lean`. Diff outside the roadmap folder: none (the four files of the folder are the whole change). `metadata.toml` has `topic = "math.DG"`.

**Signatures.** I elaborated a scratch copy with `#check @` for `SmoothGoodCover`, `cechIntersection`, `locallyConstantRealSheaf`, `cechTupleConstantSection` and the two existence theorems and compared with the README: no binder lost; `exists_smoothGoodCover_refining` carries `IsManifold I ∞ M`, `FiniteDimensional ℝ E`, `T2Space M`, `SecondCountableTopology M`, `I.Boundaryless` as the README states; the finite version replaces second countability by `CompactSpace M` (sound: a compact manifold has a finite atlas of second-countable charts). `locallyConstantRealSheaf` depends only on `M` and its topology, as it should.

**One-tactic probes.** On the scratch copy, `simp` on each of the three sorried theorems: "simp made no progress" (lines 83, 90) and unsolved goal (line 133). None closes in one tactic; none restates a definition or a Check. No padding in `Suggested.lean`.

**Adversarial table.**

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| `exists_smoothGoodCover_refining` | M = ∅; dim E = 0; the long line | ∅: `Index := Empty`, `covers` vacuous, refinement vacuous. dim 0: M discrete, singletons, constant contraction smooth. Long line (T2, not second countable, not paracompact): no locally finite refinement of a cover by bounded intervals exists | true; `SecondCountableTopology` needed and present | none |
| `exists_finite_smoothGoodCover_refining` | compact M without stated second countability; M = ∅ | compact ⇒ finitely many charts, each second countable ⇒ M second countable; ∅ as above | true, strictly more general than README wording | none |
| nonempty finite intersection of a `SmoothGoodCover` is connected | arbitrary `s`, `x` in W | path `t ↦ contract s hs hW (t, x)` from `centre` to `x`: continuous (restriction of `ContMDiff`), endpoints by `at_zero`, `at_one`; a scratch `example` proving `PathConnectedSpace W` elaborated | true | none |
| `cechTupleConstantSection_bijective_iff` | W = ∅; W nonempty connected; W disconnected; p = 0; repeated tuple (a,a) | ∅: Γ(∅) = 0 (sheaf condition on the empty cover), ℝ → 0 not injective, RHS false. Connected nonempty: locally constant = constants, bijective, RHS true. Disconnected: not surjective, but excluded by the previous row. p = 0: W = U_a. (a,a): `Finset.univ.image` collapses, W = U_a, same as tuple (a) | true | none |
| product object vs `cechIntersection` | `Opens M` is a complete lattice, thin category | any two products are equal objects (antisymmetry); `(univ.image i).inf openSet = ⨅ j, openSet (i j)` | consistent | none |
| transition conventions `s_j = s_i g_ij` | `p = s_i a = s_j b`; `s_i ↦ s_i h_i` | `b = g_ij⁻¹ a` (left multiplication by `g_ij⁻¹`); `g'_ij = h_i⁻¹ g_ij h_j` | both as stated | none |
| `A' = Ad(g⁻¹)A + g⁻¹dg` for `s' = s g` | right principal action | `(sg)^*ω = Ad(g⁻¹) s^*ω + g^*θ` | as stated | none |
| holonomy `τ_γ(p) = p·hol_p(γ)` is a homomorphism | Mathlib `Aut` multiplication | `Endomorphism.lean` line 131: `mul x y := Iso.trans y x`, so `p*q = q.trans p`; `τ_{q.trans p}(p₀) = τ_p(p₀ hol(q)) = p₀ hol(p) hol(q)` | homomorphism, as stated; `hol_(pg) = g⁻¹ hol_p g` | none |
| `Ω(X,Y) = dω(X,Y) + [ω(X),ω(Y)]` | determinant-style wedge | `[ω∧ω](X,Y) = [ω(X),ω(Y)] − [ω(Y),ω(X)] = 2[ω(X),ω(Y)]`, so `½[ω∧ω](X,Y) = [ω(X),ω(Y)]` | as stated | none |
| `[V_ξ,V_η] = −V_[ξ,η]` for equivariant ξ, η | `V_ξ(η)(p) = d/dt Ad(exp(−tξ(p)))η(p) = −[ξ,η]` | `[V_ξ,V_η] = σ([ξ,η]) + σ(V_ξη − V_ηξ) = σ([ξ,η]) − 2σ([ξ,η]) = −σ([ξ,η])` | as stated; `Φ_u∘Φ_v(p) = p v(p) v(p)⁻¹ u(p) v(p) = Φ_{uv}(p)` | none |
| gauge generator `δA = d_Aξ` | `u = exp(tξ)` | `d/dt (Ad(u⁻¹)ω + u⁻¹du) = −[ξ,ω] + dξ = dξ + [ω,ξ]` | as stated; inverse-pullback `−d_Aξ` | none |
| group equation `ġ = −dR_g(A(γ̇))` | `p = s(γ) g`, `ω(ṗ) = 0` | `Ad(g⁻¹)A(γ̇) + g⁻¹ġ = 0 ⇒ ġ = dL_g dL_{g⁻¹} dR_g (−A(γ̇))` | as stated | none |
| Hopf conventions | standard vs dual character | `(p,v) ↦ v·p ∈ ℂ²` is well defined on `(pλ,v) ~ (p,λv)`, so the standard character gives O(−1) and the dual gives O(1), `⟨c₁,[ℂP¹]⟩ = 1`; `ω(X_1) = Im(z̄·iz) = |z|² = 1` | consistent | none |
| integer representative `−(δφ)/(2π)` | line with cocycle `g_ij = e^{iφ_ij}` has class `(δφ)/2π`; dual line has cocycle `g_ij⁻¹` | `−(δφ)/2π` | consistent with the O(1) normalization | none |
| YM variations | `F_{A+ta+sb}` expansion; `[a∧b] = [b∧a]` on one-forms | `∂_t∂_s |F|² = 2(d_Aa,d_Ab) + 2(F,[a∧b])`; `D YM = 2(F, d_A a)` (jiang-yangmills line 414); Hessian `2(d_A^*d_A + R_A)` | as stated | none |
| `d_A^* = (−1)^{n(r+1)+1} * d_A *`; conformal scaling | r-forms on an n-manifold; `g' = e^{2φ}g` | standard codifferential sign; `*' = e^{(n−2r)φ}*`, density `e^{−4φ}e^{nφ} = e^{(n−4)φ}` | as stated; invariance exactly at n = 4 | none |
| Circle stationary connections | `d^*F = 0`, `dF = 0` | F harmonic; `A = A₀ + a` stationary iff `d^*da = 0` iff `da` harmonic and exact iff `da = 0` (closed manifold) | torsor for closed one-forms (jiang-yangmills line 424, Exercise 2.11) | none |
| B6.4 kernel `Ext(H₁(M;ℤ),ℤ)` | UCT; `H₁ = ℚ` | `ker(H²(ℤ)→H²(ℝ)) = ker(H²(ℤ)→Hom(H₂,ℤ)) = Ext(H₁,ℤ)` since `Hom(H₂,ℤ)→Hom(H₂,ℝ)` is injective; `Ext(ℚ,ℤ)` is torsion-free and uncountable | finite generation needed for "= torsion", and stated | none |
| lens-space holonomy | character `exp(2πik/n)`, `g = gcd(n,k)` | image `μ_{n/g}`; kernel of `ℤ/n → μ_{n/g}` is `ℤ/g`; holonomy bundle `S³/μ_g`; k = 1 gives `S³` | as stated | none |
| L² completeness control | `F = c₀₀` with ℓ² product, one-point base, unit mass | `L² ≅ F`, not complete | hypothesis `FiniteDimensional` needed and stated in B2 | none |
| inverse-transport derivative sign | `P(0) = id`, `P'(0) = −A` | `(P⁻¹)'(0) = A`; derivative `w + Aσ(0)` | agrees with `A = −∂_tP`, `∇ = d + A` | file deleted per R04, statement kept as a Check |
| Ehresmann | non-proper submersion `ℝ²∖{0} → ℝ` | fibres over 0 and 1 not diffeomorphic | properness needed and stated | none |
| properness of the right action on P → M | M Hausdorff | `(p,g) ↦ (p,pg)` is a homeomorphism onto `P ×_M P`, closed in `P × P` | true | none |
| `EMetricSpace.ofRiemannianMetric` | pin | `Mathlib/Geometry/Manifold/Riemannian/Basic.lean` line 545 requires `[T3Space M]`; README derives T3 from Hausdorff + local compactness | consistent | none |
| `SmoothParameter.lean` zero-field hypothesis | pin | `exists_contDiffAt_picard_solution` line 207 has `hzero : ∀ᶠ y in nhds x₀, f (p₀, y) = 0` | README's caveat correct | none |
| `cechAugmentation` degree-zero component | pin | `TauCeti/CategoryTheory/Sites/SheafCohomology/Cech.lean` line 209: `(cechAugmentation U hT P).f 0 ≫ Pi.π _ a = P.map (hT.from (∏ᶜ fun j ↦ U (a j))).op` | README equation exact | none |

**Library declarations opened at the pins** (file, line): `CategoryTheory.constantSheafAdj` (`Mathlib/CategoryTheory/Sites/ConstantSheaf.lean` 68); `cechComplexFunctor` (`Mathlib/CategoryTheory/Sites/SheafCohomology/Cech.lean` 65); `Limits.isTerminalTop` (`Mathlib/CategoryTheory/Limits/Shapes/IsTerminal.lean` 90); `Sheaf.H` (`…/SheafCohomology/Basic.lean` 46); `smoothSheafCommGroup`, `.compLeft` and their `to_additive` twins (`Mathlib/Geometry/Manifold/Sheaf/Smooth.lean` 230, 244; `#check @smoothSheafAddCommGroup.compLeft` elaborated); `CovariantDerivative` (`…/CovariantDerivative/Basic.lean` 365), `addOneForm` (489); `leviCivitaConnection` (`…/LeviCivita.lean` 359); `GroupLieAlgebra` (`Mathlib/Geometry/Manifold/GroupLieAlgebra.lean` 56); `IsSubmersionAt`, `IsSubmersion` (`Mathlib/Geometry/Manifold/Submersion.lean` 171, 553); `IsSmoothEmbedding` (`…/SmoothEmbedding.lean` 72); `MulAction.instChartedSpaceQuotient` (`…/Instances/Quotient.lean` 49, properly discontinuous actions only, so the B1.4 free-proper quotient is indeed missing); `IsContinuousRiemannianBundle`, `ContinuousRiemannianMetric` (`Mathlib/Topology/VectorBundle/Riemannian.lean` 60, 468); `Trivialization.localFrame` (`…/VectorBundle/LocalFrame.lean` 339); `MeasureTheory.Lp.dense_hasCompactSupport_contDiff` (`Mathlib/Analysis/Normed/Lp/SmoothApprox.lean` 102); `MemLp.exists_hasCompactSupport_eLpNorm_sub_le` (`Mathlib/MeasureTheory/Function/ContinuousMapDense.lean` 141); `Matrix.PosSemidef.inv_sqrt`, `det_sqrt` (`Mathlib/Analysis/Matrix/Order.lean` 142, 148); `Matrix.linftyOpNormedRing` (`Mathlib/Analysis/Matrix/Normed.lean` 404); `TauCeti.linftyOpTopologicalSpace` (`TauCeti/Analysis/Matrix/Normed.lean` 33); `extDeriv` (`Mathlib/Analysis/Calculus/DifferentialForm/Basic.lean` 72, functions on normed spaces only, as the docstring says); `MeasureTheory.L2.inner_def`, `MeasurableEmbedding.subtype_coe` (`…/MeasurableSpace/Embedding.lean` 86), `map_comap_subtype_coe` (`…/Measure/Restrict.lean` 934); `Circle.exp` (`Mathlib/Analysis/Complex/Circle.lean` 120); `InnerProductSpace.ofCoreOfTopology` (`…/InnerProductSpace/Defs.lean` 586); Tau Ceti `riemannianLog`, `contMDiffOn_riemannianLog`, `IsNormalDomain` (`…/Riemannian/Geodesic/Normal.lean` 224, 257, 85); `leftInvariantDerivationLieEquivGroupLieAlgebra` (`TauCeti/Geometry/Lie/Tangent/LieEquiv.lean` 103); `lieExp_eq_mulInvariantExp` (`…/Lie/Exponential/Basic.lean` 146); `IsContMDiffDistribution` (`…/Manifold/Distribution.lean` 163); `contMDiffOn_maximalIntegralCurve` (`…/IntegralCurve/Flow.lean` 370); `exists_contDiffAt_localFlow` (`TauCeti/Analysis/ODE/InitialCondition.lean` 215); `CovariantDerivative.curvatureOperator` (`…/Curvature/Basic.lean` 85); `LensSpace` charts (`…/Instances/LensSpace.lean` 71); `singularSubdivisionHomotopy` (`…/Singular/Subdivision/Homotopy.lean` 239); `sectionZeroChartedSpace`, `levelSetChartedSpace` (the latter is for Fredholm maps between normed spaces, so the Ehresmann "not statable" claim stands). No principal-bundle structure exists in Mathlib or Tau Ceti at the pins (grep for `PrincipalBundle`/"principal bundle" in both `Geometry` trees: no hits), confirming the docstring.

**Cross-roadmap citations resolved** (on main unless noted): DifferentialGeometry 3.5 (README line 400), 4.3 (463), 5.4 `homotopyOperator` (524), 5.5 densities (528), 8.3 `smoothToSingular` (836), 8.4 `fullSimplex`, `chainIntegral`, `deRhamHom` (845), 8.5 (852), 9.3 (872, duality only — see R02), 10.1 `IsRegularPoint`/`IsRegularValue` (881), 12.1 `nonempty_contMDiffRiemannianMetric` (915); AlgebraicTopology Stage 3 item 2 (small chains), Stage 4 item 6 (projectivization topology), Stage 6 item 1 (cochains and coefficients), Stage 6 item 3 (orientation local system and fundamental class); DGFloer Layer 1 item 1 "Hurewicz in degree one" (line 453); HopfRinow Layer 2 (normal neighbourhoods, Gauss lemma); RepresentationTheory/LieGroups closed-subgroup theorem and `integralSubgroup` (lines 191, 215); HamiltonianReduction R3, R5 and IntegrableSystems under `SymplecticGeometry/`; ComplexKahlerGeometry K5a (line 570) and K7.1 (line 1407), anchors as linked; LieGroupoidsPoisson G0.0/G0.1 at pull request 1050 (exist, but see R01); TopologicalSheafCohomology TS1.1–1.2 at pull request 973 (exist, scope "constructed for arbitrary topological spaces" as this README says; it is at merge-order line 283, later than this roadmap: the check places this roadmap after it, which is not a defect, but note that FourManifolds (line 119) and InstantonFloerTheory (271) consume this roadmap's B8 and B1–B6 and would then sit above it). Consumers verified as consumers, not co-owners: CharacteristicClasses (main, lines 95, 501, 1047, 1570), SpinGeometry (main, line 55), TopologicalKTheory (main), FourManifolds F5 (pull request 936, line 874), InstantonFloerTheory (pull request 1083, line 13), GeometricQuantization (pull request 1186, lines 50, 86), LocalVariationalFieldTheory (pull request 916; its Yang–Mills material is the jet/Euler–Lagrange form, not B8's variations). Searches by object across all open roadmap pull requests for "good cover", "principal bundle", "Yang–Mills", "Ambrose", "Ehresmann", "holonomy bundle", "Chern–Weil": no second owner of smooth good covers, principal bundles with connection, holonomy reductions, or the Yang–Mills variational calculus.

**Sources checked.** schreiber-waldorf (arXiv 0705.0452v5): Proposition 4.7 at line 1058 (1-forms ↔ smooth functors `P₁(X) → BG`, isomorphism of categories), Appendix B.4 its proof (line 2374), Theorem 5.8 at line 1418 (Hermitian vector bundles with connection ≃ transport functors with `BU(n)`-structure): all as the README uses them. jiang-yangmills: Proposition 2.9 line 401 (first variation `2(F_A, d_Aη)`, line 414), Exercise 2.11 line 424 (U(1): Yang–Mills iff harmonic curvature, torsor over closed 1-forms), Proposition 2.12 line 431 (second variation `d_A^*d_Aη + *[η∧*F_A]`, the same operator as B8's `L_A`): as cited; the README correctly separates stationarity from minimality. donaldson-gauge: §1.2 (line 26) gauge transformations, §2.1 (108) the functional and Jacobi operator, §2.2 (188) Coulomb gauge ellipticity and conformal invariance in dimension 4 (line 208), §2.3 (255) instantons: the cited range matches.

**Seeded sample "B6.0. Smooth good covers".** The statement as written (existence of locally finite smooth good refinements on finite-dimensional Hausdorff second-countable boundaryless manifolds, finite when compact) is a standard consequence of strongly convex neighbourhoods and paracompactness and is true under exactly the stated hypotheses (table rows 1–3). Its locator is Lee RM Lemma 6.16/Thm 6.17, which I could not read legally; see Not verifiable and R07.

## Not verifiable

- Lee, *Introduction to Riemannian Manifolds* (2nd ed., Springer 2018), Lemma 6.16 and Theorem 6.17, cited for B6.0's uniformly normal and strongly convex neighbourhoods: the sources service found no legal copy (Springer, paywalled; no author or institutional copy). Recorded in the job's `needs-references.toml`. The statement itself is verified independently (table); only the locator is unchecked.
- Charles, *Holonomy and Chern classes* §2.4 (link in References): the linked file returns HTTP 404; no other legal copy located. Only the locator is unchecked; the singular-cochain formula `c₁ = β(h)` for flat bundles is standard and is recomputed in the table (lens-space row).
- Kobayashi–Nomizu I and Tu, *Differential Geometry*: paywalled, cited as whole books (R05 asks for theorem numbers); not opened.
- Cannas da Silva and Freed (hep-th/9206021) are legally available but cited only as background without a locator; not sampled.

## Source issues

- none
