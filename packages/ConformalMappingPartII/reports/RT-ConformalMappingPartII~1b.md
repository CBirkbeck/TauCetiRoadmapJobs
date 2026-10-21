<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/132#issuecomment-6315356737 -->
Red team round 1 pass b (claude) of f9d9ca6

Verdict: needs_changes

1. **F01** (P2) Conformal radius is already planned by ClassicalArithmeticCompletion §6.20

   Location: `packages/ConformalMappingPartII/README.md:210-242` (1.3 "The pointed conformal radius", 1.5 "Monotonicity of conformal radius"); `Suggested.lean:102-103`.

   Claim: 1.3 defines R(Ω,a) with API `conformalRadius.positive`, `conformalRadius.riemannMap` (R = 1/|φ′(a)| for the normalized map), `conformalRadius.affineChange`; 1.5 proves monotonicity; no owner is cited.

   Witness: `TauCetiRoadmap/ClassicalArithmeticCompletion/README.md:12529-12542` ("6.20 Conformal radius using the existing normalized map") defines cr(Ω,p)=1/|φ′(p)| from `TauCeti.IsNormalizedRiemannMapOn` with `conformalRadius_pos`, `conformalRadius_deriv`, `conformalRadius_mono`, `conformalRadius_affine`, `conformalRadius_exhaustion`. ClassicalArithmeticCompletion is on main and earlier in the merge order (ORDER.txt line 79). Two roadmaps now own one object, and the simply connected cases of `riemannMap`, `affineChange` and 1.5 are planned twice.

   Repair: in 1.3 add, after the first paragraph: "For a proper simply connected Ω the conformal radius is owned by [ClassicalArithmeticCompletion — 6.20 Conformal radius using the existing normalized map]; this roadmap extends it to connected hyperbolic plane domains through the pointed cover and proves the two notions agree." Replace `conformalRadius.riemannMap` by `conformalRadius.eq_classical`: "If Ω is proper and simply connected, R(Ω,a) equals ClassicalArithmeticCompletion's cr(Ω,a)." Add to the 1.3 `*Needs:*` line "[ClassicalArithmeticCompletion — 6.20 …]". In 1.5 state monotonicity only for the hyperbolic (non-simply-connected) extension and add "the simply connected case is `conformalRadius_mono` of ClassicalArithmeticCompletion 6.20". In `Suggested.lean:100-103` extend the docstring: "Extends the simply connected conformal radius of ClassicalArithmeticCompletion 6.20 to hyperbolic domains."

2. **F02** (P3) Every `example` in Suggested.lean is admitted

   Location: `packages/ConformalMappingPartII/Suggested.lean` (35 `example` declarations, all `:= by sorry`; e.g. lines 66-69, 123-124, 197, 214, 278, 307-308, 362-363, 418).

   Claim: the file's docstring says the examples "distinguish boundary factors, centre poles, …"; the rules require proved examples and forbid admitted ones.

   Witness: `grep -c "by sorry" Suggested.lean` = 54 = 19 theorems + 35 examples; no example has a proof.

   Repair: prove the examples that are routine at the pins and turn the others into named `sorry`'d theorems listed in the README. Routine (prove): `blaschkeFactor 0 z = z` (214), `blaschkeFactor 1 z = -1` (217), both `finiteBlaschke` examples (220-225), the `scalarSpike` value example (381), `pivotMap 2 2 = 4/3` (418), `pivotMap 2 1 = 0` (first conjunct of 421), `gammaRadius 1 = 0` (311, via `Real.Gamma_zero`), the Layer 0 jet example (78-79, `iteratedDeriv` of `z^2`), `schwarzian (2z+1) = 0` (197), the square-map Schwarzian (200-201), the phase example (247-250), the `{x | x^2 ≠ 1}` set example (162), the quarter-turn derivative (170-172), `0 ∉ ExceptionalCuspSet` (396-397), `¬ AnalyticAt (1/z) 0` (82), the `discCounting`/`discCharacteristic` value examples (362-375) if the divisor API allows, and the rotation-matrix computation (324-331). Rename as theorems in the README: the identity/square `PointedCover` examples (123-128), `conformalRadius (ball 0 1) 0 = 1` and `= 2` (131-134), the cusp-limit example (165-167, which is 1.6's "F_N(1)=1" limit and deserves its own target `RootsCover.realRadialLimit`), the `inverseRatio` derivative examples (278-281), the Gamma values (307-308), the `scalarSpike` meromorphy example (384-387), the rotated-large-values example (400-403), `meromorphicOrderAt (pivotMap 2) 1 = -1` (second conjunct of 421-422).

3. **F03** (P3) Seventeen Lean theorem names do not appear in the README

   Location: `Suggested.lean:59, 107, 148, 152, 190, 229, 239, 263, 272, 293, 300, 317, 348, 354, 407, 426, 437`.

   Claim: "every Lean name appears in the README".

   Witness: none of `LinearEquation.global_initial_value`, `PointedCover.extremal`, `RootsCover.exists_cover`, `RootsCover.power_descent`, `roots_inverse_schwarzian`, `herglotz_log`, `quotient_representation`, `gauss_equation`, `inverseRatio.cover_inverse`, `roots_conformal_radius`, `gammaRadius.positive_expansion`, `half_rotation_involution`, `discCounting.zero_iff`, `local_first_main_translation`, `large_n_max_growth`, `normalized_log_derivative`, `uniform_mean_growth` occurs in `README.md` (grep).

   Repair: name each in its target: 0.4 "(`LinearEquation.global_initial_value`)", 1.4 "(`PointedCover.extremal`)", 1.6 "(`RootsCover.exists_cover`)", 1.9 "(`RootsCover.power_descent`)", 2.8 "(`roots_inverse_schwarzian`)", 3.4 "(`herglotz_log`)", 3.8 "(`quotient_representation`)", 4.1 "(`gauss_equation`)", 4.5 "(`inverseRatio.cover_inverse`)", 5.5 "(`roots_conformal_radius`)", 5.8 "(`gammaRadius.positive_expansion`)", 6.7 "(`half_rotation_involution`)", 7.4 "(`discCounting.zero_iff`)", 7.8 "(`local_first_main_translation`)", 8.7 "(`large_n_max_growth`)", 9.4 "(`normalized_log_derivative`)", 9.19 "(`uniform_mean_growth`)".

4. **F04** (P3) Examples that test no roadmap definition, more than two per definition, and a catalogue comment

   Location: `Suggested.lean:82, 85, 137-138, 162, 247-250, 324-331` (library-only examples); `123-138` (five examples for `PointedCover`/`conformalRadius`); `447-456` (closing comment); `150-151` ("does not choose an admitted data definition").

   Claim: examples are "at most two … per kept definition, testing a definition this roadmap introduces"; no catalogues of names or process comments.

   Witness: lines 82, 85, 137, 162, 247, 324 mention only Mathlib objects (`AnalyticAt`, `MeromorphicAt`, set equalities, `Real.circleAverage`, a matrix computation); lines 447-456 list README-only names; line 151 is a policy remark.

   Repair: delete the examples at 82, 85, 137-138, 162 and 247-250 (their README Checks stay as prose); keep 324-331 only if restated as a Check of a roadmap definition (e.g. after a light `def halfPlaneRotation (N : ℕ) : Matrix (Fin 2) (Fin 2) ℝ` is introduced, otherwise delete); keep two of the four `PointedCover`/`conformalRadius` examples and move the other two to named theorems per R02; delete the comment block 447-456 and the sentence at 150-151.

5. **F05** (P3) Unused Tau Ceti import

   Location: `Suggested.lean:2`.

   Claim: `import TauCeti.Analysis.Complex.Conformal.Moebius`.

   Witness: no identifier `TauCeti.` occurs in the file (grep); `blaschkeFactor` (206-207) restates the Möbius factor by formula instead of using `TauCeti.unitDiscMoebius`.

   Repair: either delete line 2, or use the import: add `example (a z : Complex.UnitDisc) : blaschkeFactor a z = (TauCeti.unitDiscMoebius a z : ℂ) := by simp [blaschkeFactor, TauCeti.coe_unitDiscMoebius, a.norm_lt_one.ne]` as the Lean mirror of `blaschkeFactor.discAutomorphism` (README line 413).

6. **F06** (P3) "CDT, p.632; 1.1.6" cited for theorems that §1.1.6 does not state

   Location: `README.md:113, 129, 135, 141, 236, 242` (targets 0.1–0.4, 1.4, 1.5).

   Claim: the analytic initial-value theorem, continuation of ODE solutions, global solutions on simply connected domains, extremality and monotonicity of the conformal radius are sourced to "CDT, p.632; 1.1.6".

   Witness: `CDT-journal line 275-325` (§1.1.6, p.632) is introductory prose ("Cauchy's analyticity theorem on the solutions of linear ODEs", "has to factorize properly through the universal covering map") with no theorem statement and no reference; CDT itself cites nothing for these facts.

   Repair: cite a primary text. For 0.2–0.4: "E. Hille, *Ordinary Differential Equations in the Complex Domain*, Wiley 1976, Ch. 2 (existence and uniqueness for analytic linear systems) and Ch. 3 (analytic continuation of solutions)" (uncertified: not read on this pass; a repair worker must fix the theorem numbers from the text or substitute Coddington–Levinson Ch. 3 §8). For 1.4–1.5: cite the Schwarz lemma equality case already consumed, i.e. "Mathlib `Complex.affine_of_mapsTo_ball_of_norm_dslope_eq_div` and ConformalMapping L2", keeping CDT p.632 only as motivation.

7. **F07** (P3) Nonexistent Mathlib module path for the log-integrability theorems

   Location: `README.md:15` ("in `Analysis.SpecialFunctions.Integrability.LogMeromorphic`").

   Claim: `MeromorphicOn.circleIntegrable_log_norm` and `MeromorphicOn.circleIntegrable_posLog_norm` live in that module.

   Witness: at pin `6b7abb3c` the directory `Mathlib/Analysis/SpecialFunctions/Integrability/` contains only `Basic.lean`, `Log.lean`, `PosLog.lean`; `MeromorphicOn.circleIntegrable_log_norm` is `Log.lean:122`, `circleIntegrable_posLog_norm` is in `PosLog.lean`.

   Repair: replace the module name by "`Mathlib.Analysis.SpecialFunctions.Integrability.Log` and `…Integrability.PosLog`".

8. **F08** (P3) ConformalMapping milestone anchors do not exist

   Location: `README.md:135, 141, 208, 236, 307, 357, 452, 651, 702` (links `…/ConformalMapping/README.md#milestone-l2--schwarz-lemma-extensions`, `#milestone-l3--the-riemann-mapping-theorem-summit`, `#milestone-l4--analytic-continuation--the-reflection-principle`).

   Claim: these anchors locate the L2/L3/L4 milestones.

   Witness: `TauCetiRoadmap/ConformalMapping/README.md` has headings only at lines 1, 43, 68, 93, 139, 169, 200, 205 (grep `^#`); L2–L4 are bold list items under "## Layers (…)" (lines 93-137), so no `milestone-l*` anchor exists.

   Repair: link the file without a fragment and name the item, e.g. `[ConformalMapping, Layers list, L2 Schwarz lemma extensions](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ConformalMapping/README.md)`, in all nine places.

9. **F09** (P3) Process word "deferrals"

   Location: `README.md:75` ("These current-library inputs are ownership deferrals; `Suggested.lean` uses only interfaces available at the pins.").

   Claim: the sentence describes how the package was produced.

   Witness: CONTRIBUTING "Roadmaps are timeless … don't use the words [optional, deferred]".

   Repair: replace by "These are consumed from the pinned Tau Ceti modules named above."

10. **F10** (P3) Pinned Tau Ceti geometry that Layers 1, 6 and 8 restate instead of citing

   Location: `README.md:192-208` (1.2 rotation uniqueness), `272` (1.8 matrix), `649-651` (6.1 "Dirichlet fundamental domain"), `655` (6.2), `694` (6.6 area), `706-708` (6.8 triangle area), `861` (8.3), `869-873` (8.4).

   Claim: these consume only "FuchsianOrbifolds Layer 0/2/3" and "ConformalMapping L2".

   Witness (all at Tau Ceti `a91d3aaf`): `TauCeti.dirichletDomain` with its measurable-fundamental-domain theorem (`TauCeti/MeasureTheory/Group/DirichletDomain/Basic.lean:71`, used in `Analysis/Complex/Fuchsian/DirichletDomain.lean`); `MeasureTheory.covolume` and `Subgroup.IsCofinite` (`Fuchsian/Covolume.lean`); `Subgroup.CuspDatum` with width and full-stabilizer field (`Fuchsian/Cusp/Datum.lean:167`); the horodisc precise-invariance and two-cusp height bound `Subgroup.im_smul_mul_im_le_abs_mul_of_upperRightHom_mem` (`Fuchsian/Cusp/Horodisc.lean`, `Fuchsian/Shimizu.lean`); Gauss–Bonnet `volume_triangle` and `volume_idealRegion_neg_one_one` (`UpperHalfPlane/Triangle.lean`, `UpperHalfPlane/IdealRegion.lean`); `Matrix.SpecialLinearGroup.rotation θ = !![cos θ, sin θ; -sin θ, cos θ]` (`UpperHalfPlane/Rotation.lean`); the origin-fixing rotation theorem `exists_eqOn_const_mul_of_leftInvOn_ball_of_map_zero` and the automorphism classification (`Conformal/UnitDisc/Automorphism/Classification.lean`, which states it discharges ConformalMapping L2).

   Repair: 1.2 `*Needs:*` add "Tau Ceti `exists_eqOn_const_mul_of_leftInvOn_ball_of_map_zero` in `TauCeti.Analysis.Complex.Conformal.UnitDisc.Automorphism.Classification`". 1.8: add "In Tau Ceti's `Matrix.SpecialLinearGroup.rotation θ = !![cos θ, sin θ; −sin θ, cos θ]` the displayed r̃_N is `rotation (−π/N)`." 6.1: "Dirichlet fundamental domain" → "the Dirichlet domain `TauCeti.dirichletDomain Γ̃_N i` transported by C, whose fundamental-domain and measurability theorems are in `TauCeti.Analysis.Complex.Fuchsian.DirichletDomain`". 6.2: add "packaged as a `Subgroup.CuspDatum` of width h_N". 6.6 and 6.8: add "areas by `volume_triangle` (Gauss–Bonnet) in `TauCeti.Analysis.Complex.UpperHalfPlane.Triangle`". 8.3/8.5: cite the horodisc precise-invariance theorems of `TauCeti.Analysis.Complex.Fuchsian.Cusp.Horodisc`. 8.4: cite `Subgroup.im_smul_mul_im_le_sq_of_upperRightHom_mem` for the geometric form.

11. **F11** (P3) The pre-Schwarzian exists in Tau Ceti and 2.1 should be stated through it

   Location: `README.md:324-331` (2.1, `schwarzian_expanded`).

   Claim: S(f) = (f″/f′)′ − (1/2)(f″/f′)² is proved from scratch.

   Witness: `TauCeti/Analysis/Complex/Conformal/PreSchwarzian.lean` (module docstring) develops `logDeriv (deriv f)` = f″/f′ with its composition and affine-rigidity theory.

   Repair: in 2.1 write "with P(f) = `logDeriv (deriv f)` the pre-Schwarzian of `TauCeti.Analysis.Complex.Conformal.PreSchwarzian`, `schwarzian_expanded` is S(f) = (P f)′ − (1/2)(P f)²" and add that module to the 2.1 `*Needs:*` line.

12. **F12** (P3) Sign of CDT (5.1.3) is silently reversed

   Location: `README.md:272` (1.8) and `728` (Layer 6 Examples).

   Claim: r̃_N = [cos(π/N), −sin(π/N); sin(π/N), cos(π/N)] corresponds through C to multiplication by ζ_N⁻¹ (verified: the vector field of θ ↦ R_θ at τ=i is −(1+τ²), which is −2iw in the disc coordinate; the N=3, τ=2i computation at line 728 is correct).

   Witness: `CDT-journal line 2357-2364` (Lemma 5.1.2, p.668) states ζ_N F̃_N(τ) = F̃_N(r̃_N·τ) with the same matrix, i.e. the opposite correspondence; the README nowhere says it departs from the source, so an implementer checking the locator will "restore" CDT's sign.

   Repair: after the sentence ending "Its inverse corresponds to ζ_N." add: "CDT Lemma 5.1.2 displays this matrix with ζ_N on the left; under the standard left action that relation holds for r̃_N⁻¹, as the N=3 computation below shows." (Analogous silent corrections of CDT's "R := (1−r)/2" in the proof of Corollary 6.2.11 and "ψ(k)−ψ(k+a)" in the proof of Lemma 5.2.9 are already flagged at lines 1056 and 550; fine.)

13. **F13** (P3) Statable Checks without a Lean mirror

   Location: `README.md:109` (0.1: constant one fails `IsSolution` for n=1, a₀=1; exp(−x) satisfies it), `337` (2.1: S(1/x)=0), `419` (3.1: b₋₁(z)=1), `752` (7.1: constant one has N_D=0), `770` (7.2: T_D(r,c)=log⁺|c|), `889` (8.5: |sz|=|z|), `973` (9.7: p_N(0)=0), `27-28` (Cayley values), `206` (1.2: disconnected Ω admits no `PointedCover`).

   Claim: "every README Check that is statable at the pins has its example".

   Witness: none of these appears in `Suggested.lean` (grep for `exp (-`, `1 / z`, `blaschkeFactor (-1)`, `fun _ ↦ 1`, `posLog`, `pivotMap N 0`, `I * (1 +`, `∪`).

   Repair: add (proved) `example : blaschkeFactor (-1) z = 1`, `example (hN : 2 ≤ N) : pivotMap N 0 = 0`, `example : discCounting (fun _ ↦ (1:ℂ)) r = 0`, `example : ‖Complex.exp (Real.pi * I / N) * z‖ = ‖z‖`, `example : schwarzian (fun z ↦ 1 / z) x = 0` (x ≠ 0), and the 0.1 pair as one example on a `LinearEquation Ω 1` with coefficient 1; state the disconnected-domain Check as `IsEmpty (PointedCover (ball 0 1 ∪ ball 3 1) 0)`. Where this exceeds two examples for one definition, keep the negative controls and move the rest to README prose.

14. **F14** (P3) Uniformization overlap with ComplexCurveModuli D0.4 not stated

   Location: `README.md:184-188` (1.1).

   Claim: hyperbolic uniformization of the cover of a plane domain with two omitted points is a target here, with no sibling cited.

   Witness: `TauCetiRoadmap/ComplexCurveModuli/README.md:50` ("Own finite-type uniformization for every stable punctured component, including punctured spheres …", via a complete curvature −1 metric).

   Repair: add to 1.1: "ComplexCurveModuli D0.4 owns the finite-type hyperbolic metric on punctured spheres; the statement here is the complex-analytic one on the native universal-cover carrier for every connected plane domain with two omitted points, and is not derived from that metric." Add the link to the 1.1 `*Needs:*` line only if the metric route is used.

Sources read for this pass: CDT journal version (JAMS 38 (2025) 627–702) from the author's page, source id `CDT-journal` (journal page = PDF page + 626; every page/number locator below is checked against it); CDT arXiv v4 (`CDT`, OCR, numbering differs from the journal: Definition 5.1.14 there is Definition 5.1.15 in print). Pinned Mathlib `6b7abb3c` and Tau Ceti `a91d3aaf` greps are against the local checkouts at those revisions.

Dependency gate (run on the package README, unchanged):

```
depcheck: 6 roadmaps, 37 edges, 0 problem(s)
```

## Verified sound

Counts: 35 Suggested.lean declarations read (19 theorems/defs/structures, 35 examples, every line); 95 README targets read (every line, 1–1072); 41 CDT locators verified against the journal text (Definition 5.1.1 p.667; Lemma 5.1.2 p.668; Theorem 5.1.4 and (5.1.6) p.668; Definition 5.1.7, Lemma 5.1.8, (5.1.9), Remark 5.1.10, (5.1.11) p.669; (5.1.13), (5.1.14) p.670; Definition 5.1.15, Lemma 5.1.16, (5.1.17)–(5.1.19) p.671; Lemma 5.1.20 and proof of 5.1.4 p.672–673; Example 5.1.22 p.673; Proposition 5.2.1 p.674; Definition 5.2.3 p.674; Corollary 5.2.4, Lemma 5.2.6, Remark 5.2.8 p.675; Lemma 5.2.9, 5.2.12 p.676; Lemma 5.2.16 p.677; Lemma 5.2.18 p.678; Theorem 6.0.1, §6.1.1, Lemma 6.1.2, (6.1.3) p.679; (6.1.4), (6.1.5), Lemma 6.1.7, (6.1.9)–(6.1.12) p.680; entropy estimate p.681; (6.2.1)–(6.2.7) p.682; Corollary 6.2.9, (6.2.13) p.683; Corollary 6.2.11 end, (6.2.15), (6.2.16) p.684; Corollary 2.0.5 and the meromorphic-basis definition p.636; Lemma 2.3.1 pp.639–641; Remark 2.3.3 p.641; §1.1.6 p.632 is prose, see R06); 64 Mathlib and Tau Ceti declaration names grepped at the pins (all exist, including `TauCeti.riemannMapping`, `IsNormalizedRiemannMapOn` with the five stated fields, the Cayley pair, the `UniversalCover` manifold instances and `contMDiff_iff`, `chartAt_chartedSpaceComap_apply`, Shimizu, `descendPow` family, `image_pow_ball` (in `RootsOfUnity.Quotient`), Herglotz `…_smul_re_add` with conclusion "+ (f c).im * I", all ValueDistribution, divisor, Gamma, digamma and hypergeometric names); the five sibling anchors to UniversalCovers, FuchsianOrbifolds and DifferentialGeometry 2.3 exist; 47 README Checks tested by hand.

Mathematics recomputed and found correct: Cayley formulas, inverse and Im C(z); C(e^{iθ}) = −cot(θ/2), so the quadrilateral and triangle vertices of 6.6/6.8 and the areas 2π−2π/N, π−π/N (Gauss–Bonnet); companion matrix and jets of 0.1; the x²y′+y=0 and xy′+y=0 examples of 0.5; Hempel's three constraints (2.6) as the X⁻¹, X⁻², X⁻³ coefficients; the accessory parameters m₀=0, m_k=−(1/2+1/(2N))ζ⁻ᵏ by rotation symmetry (2.7); the rational Schwarzian of 2.8 recomputed from 2.5–2.7 through X=1/x (agrees with CDT's (1+(N²−1)Xᴺ)/(2X²(Xᴺ−1)²)); the Schwarzian ODE of 2.4; the transformed equation (4.2) by direct substitution; the two solutions (4.3) by Riemann P-symbol exponents (0,1/N; 1/2,1/2; −1/(2N) double); J₂ = u + u³/4 + O(u⁵) hence J₂‴(0)=3/2 and ψ₂‴(0)=3/(2γ₂) (consistent with S(ψ₂)(0)=3/2); the matching ψ_N = F′(0)⁻¹J_N through Möbius rigidity and oddness; DLMF 15.8.10 at m=0, b=a with the Γ(2a) renormalization and the k=0 coefficient −log x−2γ−2ψ(a); 4.7 monotonicity and ψ(2)−ψ(3/2)=2log2−1; γ₂=Γ(1/4)⁴/(4π²) and γ₃=Γ(1/6)³/(12π^{3/2}) by reflection and duplication, with the decimal values; 5.3 from duplication at s=1/2±1/(2N); the odd-zeta series (5.7) term by term from log Γ(1+z); the (5.8) terms ζ(3)/(2N³), 3ζ(5)/(8N⁵), ζ(3)²/(8N⁶) and E_N>0; the boundary limit 5.4 from the zero-balanced asymptotic; the free-group, index-N and index-2 statements of 6.3–6.8; the half-rotation identity (6.7) is valid for both e^{±πi/N} (the relation is symmetric), so the Lean sign choice is sound; the horoball diameter E(g,D) with the identity-lift check (centre 1/2, diameter 1); Shimizu for c=0 lifts (a=±1, h_N ≥ 2); 8.5 rotated large values via (e^M+1)^N ≥ e^{MN}+1; the kernel mean 1/(R²−r²); the L¹ identity ∫|log|g||=2m(R,g); the entropy bound with sup t log(1/t)=1/e; the full chain of Lemma 6.1.7 giving the stated constant log 2 + 1/e (using 2r(R−r) < R²−r²); the chain identity (9.9); (6.2.3) giving −log 4; the pairwise constants of 9.12; c(F′/F,0)=1 and γ_N>1 in 9.15; the radial-transfer radii of 9.5. Lean signatures checked for truth as typed: `LinearEquation.initial_value`, `global_initial_value`, `PointedCover.extremal` (lift exists and is holomorphic since F′≠0, equality iff rotation), `RootsCover.power_descent` (including G ≠ 1 on the ball and G′(0)=F′(0)ᴺ), the cusp-limit example (F is real on (−1,1) by conjugation symmetry forced by F′(0)>0, increasing, and its limit cannot be an interior point of a covering), `schwarzian_comp_apply`, `roots_inverse_schwarzian` (branch-independent by Möbius invariance), `herglotz_log`, `quotient_representation` (true with totalized log, g≡0 included), `gauss_equation`, `inverseRatio.cover_inverse`, `roots_conformal_radius`, `gammaRadius.positive_expansion`, `half_rotation_involution`, `discCounting.zero_iff`, `local_first_main_translation` (N_D(f)=N_D(f−a), then 7.6 and 7.7), `large_n_max_growth`, `normalized_log_derivative`, `uniform_mean_growth`; `discCounting`'s centre term matches Mathlib's `MeromorphicOn.circleAverage_log_norm` and `logCounting` conventions. The "ζ_N⁻¹" claim of 1.8 is correct (R12 asks only that the departure from CDT be stated).

## Not verifiable

- Journal page numbers were checked on the author-page offprint (`CDT-journal`), which carries the printed pagination; the JAMS site itself was not accessed.
- [Hem88] (Hempel, Bull. LMS 1988), [AS92], [Tsu52], [KR16], [Gol69], [Nev70] were not fetched; they are cited by locator only and the README states that their invoked results are proved here, so nothing depends on their text.
- DLMF 15.2.2 (the bold-𝐅 normalization) was not fetched separately; 15.8.10 (`DLMF-15-8 line 516-520`, specialized to m=0, b=a, z=1−x, reproduces 4.6 exactly including the Γ(2a) prefactor and the k=0 coefficient), 5.7.3 (`DLMF-5-7 line 127-130`, which with the log(1+z) series gives 5.6) and 5.7.6 (`DLMF-5-7 line 254-256`) were fetched and verified.
- The Lean file was not elaborated on this pass (no Lean command is permitted by the brief); the accepted review reports exit 0 with 54 sorry warnings, and no signature read here looks like it would fail to elaborate.
- Hille Ch. 2–3 proposed in R06 was not read; the repair worker must confirm the theorem numbers.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "f9d9ca6a0b672a58aae8b50578d7a7541e8284f1", "job": "RT-ConformalMappingPartII~1b", "model": "fable", "worker": "chris-f"} -->
