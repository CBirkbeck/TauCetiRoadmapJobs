<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1236#issuecomment-6389664346 -->
Review (claude) of 4be8459

Verdict: needs changes

1. **F01** (P1) Scope cites a roadmap that exists nowhere

   - **Location.** README line 19, Scope: "Hyperbolic volume and gonality constructions for higher-dimensional arithmetic quotients belong to HyperbolicCurveVolumesAndGonality."
   - **Claim.** These constructions are owned by the roadmap HyperbolicCurveVolumesAndGonality.
   - **Witness.** There is no such folder under `TauCetiRoadmap/` or `Completed/` on main. The name is not in `merge-order/ORDER.txt`, in the 338 open roadmap pull requests (`roadmaps list`), or in the board packages index. Its only other occurrence is a bare name in a consumer list in ComplexComparisonPartII.
   - **Repair.** Delete the sentence, or replace it with "Hyperbolic volumes and gonality of higher-dimensional arithmetic quotients are outside this roadmap." Name no owner. The depcheck is unaffected, because the dependency check never treated the name as an edge.

2. **F02** (P2) `cycleGroup_highestElliptics` stands in for a §3.4 headline that is statable but absent

   - **Location.** Lean lines 81–93, together with README §3.3 line 513: "The headline `cycleGroup_highestElliptics` states the height bound and equality of the maximal-height fixed-point set with the prefix centres modulo m."
   - **Claim.** The highest-elliptic-lift theorem is a headline.
   - **Witness.** In the §3.4 route (README line 543), §3.3 serves only to force a=1 and to read off the height-one set. The headline is "the conformal class of F_A determines A" (DIT16 line 332). Its raw-list group form is statable at the pins: the statement below elaborated in a scratch copy, with `sorry` as the only warning. The Lean docstring itself calls §3.3 "the arithmetic normalization used in conformal recovery", which describes a route lemma.
   - **Repair.**
     - Delete `cycleGroup_highestElliptics` from the Lean. In README §3.3, keep the statement as prose and drop the backticked name.
     - In the Lean under Layer 3, and in README §3.4 as a backticked target, state:

   ```lean
   /-- Two admissible cycle groups are conjugate in `PSL(2, ℝ)` exactly when their digit lists
   are cyclic rotations of each other. -/
   theorem cycleGroup_conj_iff_isRotated (n n' : List ℕ) (hn : AdmissibleCycle n)
       (hn' : AdmissibleCycle n') :
       (∃ φ : PSL(2, ℝ), ((cycleGroup n).map psl2zToPSL2R).map (MulAut.conj φ).toMonoidHom =
         (cycleGroup n').map psl2zToPSL2R) ↔ n ~r n' := by
     sorry
   ```

     The class statement of §3.4 follows from this and the `gap:primitive-minus-cycle-interface` contract.
   - **Tested.**
     - [3,6] against [6,3]: both sides are true, by T⁻³.
     - [4] against [4,4]: both sides are false. After normalizing, a·4=8, but the elliptic heights force a=1.
     - [3,4,5] against [5,4,3]: both sides are false. Centres {0,3,7} and {0,5,9} mod 12 have gap cycles (3,4,5) and (5,4,3), which are not rotations of each other. The reflection that conjugates the two groups reverses orientation.

     The theorem holds because an admissible Γ(n) has one cusp class. For a tangency vertex such as 4 in [3,2], S₁ sends it to 2, an endpoint of the free interval I₁, so it is not parabolic.

3. **F03** (P2) The Part I contract credits Layer 6 with a measure μ_mod of mass π/3 that Layer 6 does not state

   - **Location.** README line 62: "Layer 6 (the effective level-one quotient M, its measure μ_mod of mass π/3, regular connected locus and cone charts)". The same measure is used in §4.1 (line 561) and in the *Needs:* lines of §§4.1, 4.3 and 4.4.
   - **Claim.** FuchsianOrbifolds Layer 6 supplies a Borel measure on M of total mass π/3, and the connectedness of its regular locus.
   - **Witness.**
     - Part I Layer 6 (`TauCetiRoadmap/FuchsianOrbifolds/README.md` lines 344–363) constructs the quotient, its charts, the cusp, X(1) and the descended j. It defines no measure on M and never mentions π/3.
     - The Part I `Suggested.lean` has only `IsLocallyFiniteMeasure volume` (line 82).
     - Part I defines genus in Layer 5 item 1, not in Layer 4.
   - **Repair.**
     - Define μ_mod in §4.1 as the quotient measure of `volume.restrict fdo`, with Mathlib `MeasureTheory.IsFundamentalDomain.quotientMeasure_eq` (`Mathlib/MeasureTheory/Group/FundamentalDomain.lean:630`) and Tau Ceti `ModularGroup.isFundamentalDomain_fdo`.
     - Derive the mass π/3 from FuchsianOrbifolds Layer 4 item 5 with the Layer 6 signature (0;2,3;1), or from Tau Ceti `TauCeti.UpperHalfPlane.ConvexPolygon.volume_carrier` (`.../Polygon/Convex/GaussBonnet.lean:215`).
     - State the connectedness of the regular locus here, as a consequence of FuchsianOrbifolds Layer 1.
     - Re-point "genus convention" to Layer 5 item 1.
   - **Tested.** The modular triangle has angles π/3, π/3 and 0, so its area is π−2π/3 = π/3.

4. **F04** (P2) `gap:completed-critical-line-c1-bounds` asks for estimates that are already supplied, and §5.3 restates AnalyticNumberTheoryPartI §2.1

   - **Location.** README line 72, and the third entry of the plan's `gaps`. Also §5.3, lines 742–748: "The same formula for smooth level-one weight-zero Maass cusp eigenfunctions follows by applying the supplied cusp estimates and the integrable Stokes identity".
   - **Claim.** AutomorphicSpectralTheory must newly export four things: C¹ termwise Fourier differentiation; exponential bounds for the nonconstant modes; fixed-t constant-term bounds for every t; and cusp-form estimates.
   - **Witness.**
     - AutomorphicSpectralTheory §4.18 already exports, for E(z,1/2+it): exponential decay of the nonconstant terms, the O(Y^(−1/2)) derivative constant term, cusp-form decay, flux→0 and integrability.
     - §1.15 `constantTerm` gives Λ(2s)y^s+Λ(2−2s)y^(1−s).
     - AnalyticNumberTheoryPartI §2.1 already discharges `core_stokes` for E on Re s=1/2.
     - For t≠0, E* = Λ(1+2it)E, a nonzero scalar multiple.
   - **Repair.**
     - Rewrite the `needs` of this gap, in the README and in the plan's `gaps` under the same slug, as: "§§1.15 and 4.18 must export, for the regular value E*(z,1/2), a termwise C¹ Fourier expansion on high strips with exponentially decaying nonconstant modes and first derivatives."
     - In §5.3, cite `core_stokes` multiplied by Λ(1+2it) for t≠0, and for cusp forms. Keep only the t=0 endpoint as this roadmap's target.
   - **Tested.**
     - Near s=1/2 the constant term equals √y(log y + c) + O(s−1/2), so the √Y log Y growth comes from §1.15 itself.
     - E(z,1/2) ≡ 0, because φ(1/2) = −1. So t=0 is the only genuinely new case.

5. **F05** (P3) `cycleGroup_presentation` asserts only an abstract isomorphism

   - **Location.** Lean lines 62–66. README §1.3 says that T^m generates ℤ and that S₀,…,Sℓ₋₁ generate the order-two factors.
   - **Witness.** The Lean conclusion `Nonempty (… ≃* cycleGroup n)` does not mention the generators. It recovers the README form only through the Hopfian property of ℤ*(C₂)^*ℓ, which the README never invokes.
   - **Repair.** Pin the generators: `∃ e, (e (inl (ofAdd 1)) : PSL(2, ℤ)) = T ^ n.sum ∧ ∀ k, (e (inr (of (i := k) (ofAdd 1))) : PSL(2, ℤ)) = T ^ N_k * S * T ^ (-N_k)`. I checked that this full statement elaborates at the pins.

6. **F06** (P3) The DIT16 locators for §§3.1–3.3 point to text that does not make those statements

   - **Location.** README lines 473, 503 and 519, which cite "DIT16 line 387" for the double, the lift and the highest elliptic lifts.
   - **Witness.** DIT16 lines 387–406 (p.959) discuss the boundary points closest to the cone points and the function V. They contain no doubling, no covering lift and no height bound.
   - **Repair.** Label §§3.1–3.3 as this roadmap's route. Cite ComplexCurveModuli D0.4 for the compact smooth double, and cite DIT16 Theorem 1 (p.957) only for the conclusion in §3.4.

7. **F07** (P3) Process narrative and a stale label

   - **Location.**
     - Line 66: "instead of the older AS layer labels".
     - Lines 473, 503 and 519: "corrected conformal-lift route" and "lift-selection gap correction".
     - Line 35: "the corrected operator".
     - Lines 666 and 668: "RQ.2" and "fundamentalDiscriminant(d)".
     - Line 744: "Use the the supplied".
   - **Witness.** MultiquadraticPartII has no section RQ.2: its criterion is §2.4, `J_square_iff_sumTwoSquares`. `fundamentalDiscriminant` is defined nowhere.
   - **Repair.**
     - Delete the "older labels" sentence.
     - Make the locators plain.
     - Write "Δ" in place of "the corrected operator".
     - Replace RQ.2 with MultiquadraticPartII §2.4, and drop the undefined name.
     - Fix the doubled word.

8. **F08** (P3) Pinned inputs are used but not cited

   - **Location.**
     - §1.6 *Needs:* (line 360).
     - The §1.3 ping-pong route (line 314).
     - The §4.1 route (line 567).
   - **Witness.**
     - The §1.6 route uses the finite-index area formula and the finite covolume of PSL₂(ℤ): Tau Ceti `MeasureTheory.covolume_eq_card_mul_covolume` and `TauCeti.ModularGroup.isCofinite_psl2zToPSL2RRange` (`TauCeti/Analysis/Complex/Fuchsian/LevelOne/Basic.lean:73`). Neither is listed.
     - Mathlib has `Monoid.CoprodI.lift_injective_of_ping_pong` (`Mathlib/GroupTheory/CoprodI.lean:903`).
     - Since fdo ⊆ F_DIT ⊆ fd, the a.e. equality in §4.1 follows directly from Tau Ceti `ModularGroup.fd_ae_eq_fdo` (`TauCeti/NumberTheory/Modular.lean:196`).
   - **Repair.** Add these declarations to the three *Needs:* lines and to the supplier contracts.

9. **F09** (P3) `gap:oriented-quadratic-cycle-reversal` prescribes coefficient actions IntegralLattices already supplies

   - **Location.** README line 70: "using the DIT coefficient actions [a,−b,c]↦A⁻¹, [−a,b,−c]↦JA and −Q↦JA⁻¹".
   - **Witness.** IntegralLattices B3 sends the opposite form to the inverse class. The B2 sign clause gives −Q ↦ √D·(conjugate of 𝔞_Q), which is the class JA⁻¹, and hence [−a,b,−c] ↦ JA.
   - **Repair.** Reduce the `needs` to the orientation-reversal identification of C_(JA⁻¹) with the reversed C_A, and cite IntegralLattices B2–B3 for the actions.
   - **Tested.** For a>0, all three of DIT's actions follow from B2–B3.

Ten findings: one P1, four P2, five P3 (R08 raised to P2 by the maintainer: a Check that states a false value is blocking, not style). The mathematics of the stated Lean targets checks out on every instance I computed. The blocking items are: a scope citation of a roadmap that exists nowhere (R01); a route lemma in `Suggested.lean` standing in for a headline that is in fact statable (R02); a Part I contract that credits Layer 6 with a measure it does not state (R03); and a declared gap that asks for estimates AutomorphicSpectralTheory already exports (R04). Files are cited relative to the board: `packages/FuchsianOrbifoldsPartII/README.md` (README) and `packages/FuchsianOrbifoldsPartII/Suggested.lean` (Lean). Line numbers refer to those files at the reviewed head.

## R08 (P2, blocking by maintainer override) — Two Checks have wrong labels or a wrong value for the wrong model

- **Location.**
  - Line 529: "fixed by the conjugate of S₃".
  - Line 634: "total denominator 7π, not 2π".
- **Witness.**
  - For [3,6], ℓ=2, so S₃ is undefined: k indexes the involutions, not their centres. The element fixing −3/10+i/10 is S·S₁·S⁻¹.
  - Equal-weight averaging gives ν_I(E)/(4π)+ν_J(E)/(10π), not a denominator of 2π.
- **Repair.**
  - Write "fixed by S S₁ S⁻¹, the conjugate of the involution S₁ centred at 3".
  - Write "equal weights give ν_I(E)/(4π)+ν_J(E)/(10π) instead of (ν_I(E)+ν_J(E))/(7π)".

## Verified sound

### Principles

- No `set_option` and no sorry'd data. The three definitions have real bodies on native carriers.
- The imports are `import Mathlib` plus one Tau Ceti module that exists at the pin.
- No computational algorithm and no copied source passage.
- The roadmap is a genuine Part II. Its Scope says where FuchsianOrbifolds stops. It re-plans nothing from Part I: t=0 reduces to Part I's signature and area, and the free-side tiling is proved here.

### Depcheck

`depcheck: 34 roadmaps, 311 edges, 0 problem(s)`. There is no UPWARD or CYCLE line. FuchsianOrbifoldsPartII sits at position 275 in the merge order, after AutomorphicSpectralTheory (97), AnalyticNumberTheoryPartI (98) and MultiquadraticPartII (274).

### Cross-roadmap citations resolved (14)

Each was checked against main or the open head:

- FuchsianOrbifolds Layers 0–4 and 6 on main. Layer 2 items 1–5 match the contract; for Layer 6 see R03.
- AutomorphicSpectralTheory §§1.14, 1.15, 4.17a, 4.18 and 4.20.
- AnalyticNumberTheoryPartI §2.1: `core_stokes`, `core_signature`, `core_boundary_period`.
- IntegralLattices B2–B3. B5 uses plus-continued-fraction cycles, so it does not already supply the minus-cycle invariant of gap 1.
- GlobalNumberFields Layer 11.
- MultiquadraticPartII §§2.3–2.4 (`J_square_iff_sumTwoSquares`) and §§3.1–3.2.
- ConformalMapping L2 and L4.
- ComplexCurveModuli D0.1, D0.4 and D6.2.
- AlgebraicTopology Stages 1 and 7.
- DifferentialGeometry §§5.3, 5.5 and 5.6.3.
- Completed UniversalCovers Stage 2.

### Library declarations opened at the pins

All resolve, with the hypotheses the README states.

- **Mathlib (15).** Resolved by `#check`:
  - `UpperHalfPlane.volume_def` (Measure.lean:44).
  - `UpperHalfPlane.dist_eq` and `UpperHalfPlane.cosh_dist` (Metric.lean:42, :67).
  - `ModularGroup.S` and `ModularGroup.T` (SpecialLinearGroup.lean:825, :829).
  - `ModularGroup.im_smul_eq_div_normSq` (MoebiusAction.lean:471).
  - `ModularGroup.fdo` (Modular.lean:370). Both of its inequalities are strict.
  - `Subgroup.closure_le` (Lattice.lean:355), `Monoid.Coprod` and `Monoid.CoprodI`.
  - `Subgroup.index_eq_zero_iff_infinite` (Index.lean:561).
  - `ProperlyDiscontinuousSMul.finite_stabilizer` (ConstMulAction.lean:599).
  - `MeasureTheory.Measure.map_apply` (Map.lean:170) and `MeasureTheory.integral_map` (Bochner/Basic.lean:1076).
  - `IsCoveringMap.existsUnique_continuousMap_lifts_of_range_le` (Lifting.lean:499). It takes path-connected and locally path-connected sources and a range inclusion.
- **Tau Ceti (22).** Thirteen resolved by `#check`; nine read in source, because their modules have no object files in this checkout and are not imported by the Lean:
  - `UpperHalfPlane.pslMk_smul` (PSL/Action.lean:140) and `UpperHalfPlane.psl2zToPSL2R_smul` (:184).
  - `psl2zToPSL2R_injective`.
  - `OnePoint.instMulActionPSL` and `OnePoint.pslMk_smul` (ProjectiveLine.lean:189, :194).
  - `TauCeti.UpperHalfPlane.isProperMap_psl_smul_I`, and the discrete-subgroup instance (Fuchsian/ProperAction.lean:33).
  - `Subgroup.instIsCyclicStabilizer`.
  - `TauCeti.UpperHalfPlane.geodesicLine` and `TauCeti.UpperHalfPlane.dist_geodesicLine`.
  - `TauCeti.UpperHalfPlane.ConvexPolygon.volume_carrier` (:215).
  - `ModularGroup.isFundamentalDomain_fdo`. It is stated for PSL(2,ℤ) and is almost-everywhere.
  - `UpperHalfPlane.volume_preimage_coe_null` and `UpperHalfPlane.volume_setOf_re_mem_Ico_and_lt_im`. The latter gives ofReal((b−a)/A), so the cusp tail is m/Y.
  - `Subgroup.exists_isFundamentalDomain` and `Subgroup.IsCofinite`.
  - `MeasureTheory.covolume_eq_card_mul_covolume` and `Subgroup.isCofinite_iff_isCofinite_and_finiteIndex`.
  - `NumberField.NarrowClassGroup`, `NumberField.NarrowClassGroup.mkPrincipal_sq` and `NumberField.NarrowClassGroup.instFinite`.
  - `TauCeti.Deck.conjMulEquiv`.

### Gaps

- `primitive-minus-cycle-interface` is declared in the README and the plan under the same slug. It is precise, and minimal: AutomorphicSpectralTheory §4.17a constructs the cycle but does not state that it is a complete invariant.
- `oriented-quadratic-cycle-reversal` is declared in both and genuine, apart from R10.
- `completed-critical-line-c1-bounds`: see R04.
- No gap has supplier `none`.

### Lean form

- **Elaboration.** `lake env lean` on the Lean file gives exactly five `declaration uses sorry` warnings and nothing else.
- **Binders.** One `#check @name` file over all eight declarations: there are no section variables, so no binder was lost, and each type matches its README statement. Nothing changed.
- **One-tactic probe.** On a scratch copy, `rfl`, `simp`, `infer_instance`, `decide`, `norm_num` and `exact?` close none of the five theorems.
- **Shape.** The docstring names every unstatable headline and what it lacks. Namespaces are unique (`cycleGroup` and `cyclePolygon` occur nowhere else on main or at the open heads). Layer comments follow README order, and every Lean name appears in the README.

### Headline theorems

| Headline | Status in the Lean |
| --- | --- |
| §0.3 finite-area Nielsen core | Not statable (no limit-set or hull carrier); named in the docstring. Accepted. |
| §0.5 bordered Gauss–Bonnet | Not statable (no bordered signature or genus); named. |
| §1.3 Ford polygon theorem | Stated by three declarations. |
| §1.6 infinite index | Stated. |
| §§2.1–2.2 arithmetic comparison | Not statable; named. |
| §3.4 class recovery | Not statable in class form; the raw-list form is statable and missing (R02). |
| §§4.4–4.5 coverings | Not statable; named. |
| §§5.2–5.3 Stokes | Not statable; named. |

I judged the cusp-stabilizer theorem to be part of the §1.3 conclusion (the quotient's cusp datum), not padding.

### Ownership

Searched by object with `roadmaps grep` over main and all open heads, the listed siblings included. Searches: limit set, Nielsen region, convex core, Ford polygon, cycle group, minus continued fraction, complementary covering.

- No other owner exists apart from AutomorphicSpectralTheory §4.17a, which the README consumes.
- KleinianGroups and the open revisions of FuchsianOrbifolds and GeometricTopology treat different objects.
- The Orbifolds roadmap's O7 leaves Fuchsian area and signature calculations to FuchsianOrbifolds.

### Sources sample (15 targets plus extras)

Checked at their locators:

- **0.2.** DIT16 lines 149–156 and 164–174 (pp.952–953); SERIES05 line 1126 (p.32).
- **0.3.** LU23 lines 215–217 (p.194) and Proposition 3.5 at line 275 (p.195); SERIES05 Theorem 3.33 at line 733 (p.21) and lines 1143–1149 (p.33); LU23 §3.3 (p.198) is torsion-free, as the README says.
- **0.4 and 0.5.** DIT16 lines 157–182 ((2.8), pp.952–953).
- **1.2.** DIT16 lines 333–344 (p.957). The figures cannot be read.
- **1.3.** DIT16 lines 323–341.
- **1.4.** DIT16 lines 255–256 (p.954). The cited line 251 sits three lines earlier in the same paragraph.
- **1.6.** DIT16 lines 253–255 and 323.
- **2.3.** DIT16 lines 394–401 (p.959). The three forms of V agree algebraically.
- **3.1 and 3.3.** Not supported at the locator (R06).
- **3.4.** DIT16 line 332 and lines 387–406.
- **4.2.** DIT16 lines 416–426 ((4.3), p.959).
- **4.4 and 4.5.** DIT16 lines 438–448 (p.960) and lines 238–242 (p.954).
- **Extras.** §§5.2–5.3: DIT16 lines 509–524 and 1025–1051 (p.972). DIT16 has no examples of its own for D=12 or D=136. The manifest's three entries are consistent with the texts: authors, titles, pages (949–990, 189–199, 1–38) and DOIs.

### Adversarial table

| Statement | Instances tried | Values computed (each side) | Result | Change |
| --- | --- | --- | --- | --- |
| Conventions: S, T | 2i, i | S(i)=i, S(2i)=i/2, S²(2i)=2i; SL square of S is −I | pass | — |
| Conventions: rotation sign | [3,6] | T⁻³ sends centres {0,3} to {6,0}={0,6}, the centres of [6,3]; T³ gives {3,6}, wrong | pass | — |
| Conventions: Laplacian | log y on [0,1]×[1,2]; y² | boundary integral 1/2−1/4=1/4; ΔF=1, ∫dμ=1/2, half of it 1/4; Δy²=−2y² | pass | — |
| Conventions: units | D=12, D=8 | N(2+√3)=1, N(1+√3)=−2; N(1+√2)=−1, ε=3+2√2 | pass | — |
| 0.1 limit set | trivial, ⟨T^m⟩, ⟨diag(2,1/2)⟩, PSL₂(ℤ) | ∅, {∞}, {0,∞}, whole circle; basepoints i and 2i for ⟨T⟩ both give {∞} | pass | — |
| 0.2 hull | Λ⊂[−1,1], ∞∉Λ; elliptic on a boundary line | i/2: 1/4≤1, lies on the away side; an "above" convention would admit 2i and exclude i/2; a half-turn on L_j swaps sides, so there are no boundary cone points | pass | — |
| 0.3 finite core | Γ([4]), theta group, ⟨T⟩ | core area π with (s,t)=(1,1); theta group (0;2;2;0), area π = 3·π/3; ⟨T⟩ elementary, excluded | pass | — |
| 0.4 B | (0;2,3;1;0), (0;2^ℓ;1;1), (0;;0;3), (0;;1;0) | π/3, πℓ, 2π, −2π; double of (0;2;1;1) has B=2π=2·π | pass | — |
| 0.5 Gauss–Bonnet | modular, [3,6] | 2π(1/6)=π/3; 2π(−2+1+1+1)=2π (DIT16 line 285) | pass | — |
| 0.6 funnel geodesic | Γ([4]) | axis endpoints 2±√3, length 2log(2+√3)≈2.634; squared word trace 14, length doubles; T has no axis | pass | — |
| 1.1 cycle group | [], [2], [4], [3,6], [1,5] | (ℓ,m)=(0,0),(1,2),(1,4),(2,9); admissible F,F,T,T,F; S₁=[[3,−10],[1,−3]], S₁(3+i)=3+i, S₁²=−I | pass | — |
| 1.2 Ford polygon | [4], [3,2], [3,6] | I=(1,3); I₂=(4,4)=∅; I₁=(1,2), I₂=(4,8), lengths nₖ−2 | pass | — |
| 1.3 presentation | [4], [4,4], [2], [3,2] | ℤ*C₂; χ: index 2 times −1/2 = −1 = χ(ℤ*C₂*C₂); for [2], T²S fixes 1 with trace 2 (second cusp, so admissibility is needed); for [3,2], vertex 4 maps to the free endpoint 2 | pass | — |
| 1.4 rotation | [3,6], [3,4,5] r=1 | T⁻³; {0,3,7}−3 ≡ {0,4,9} mod 12, the centres of [4,5,3] | pass | — |
| 1.5 Pell word | [3,6] | [[17,−3],[6,−1]], trace 16, fixed points (3±√7)/2, ε=8+3√7, derivative at w ≈ 1/253 (attracting); 0<0.177<1≤2<2.823<3 and 3<3.354<4≤8<8.646<9 | pass | — |
| 1.6 infinite index | [4], [2] | index 0, since a free interval gives ∫y⁻²=∞; the theta group has index 3 (negative control for the hypothesis) | pass | — |
| 2.1 partition | [3,6], [4] | z=1/2+(√3/2)i; first crossing 5/2+(√3/2)i; γz≈2.8226+0.0279i; S₁γz=17/2+(√3/2)i; for [4] the crossing (7/2,√3/2) equals γz | pass | — |
| 2.2 comparison | [3,6]; D=28 | second arc centre 6, radius √7≈2.646, from x=7/2 to 17/2, so Y₀=3 works and 2 fails; 3/2+(6/5)i has 1.44<1.75, so it lies outside Q; 2π>π/3 | pass | — |
| 2.3 V | x=0, 2, 4 | V(0)=0; cosh V(2)=3, V(2)≈1.763; V(4)=2arsinh2≈2.887; cosh dist = 1+n²/2 by `cosh_dist` | pass | — |
| 3.1 double | (0;2^ℓ;1;1), pants | (0;2^(2ℓ);2;0); genus 2, area 4π | pass | locator: R06 |
| 3.2 lift | normalized φ | a·m_A=m_B and heights scale by a; the lifting hypotheses match Mathlib's signature | pass | — |
| 3.3 heights | [3,6], [4,4] | Im S(3+i) = 1/(3²+1) = 1/10; equality forces c=0 or γSₖ=T^(a−Nₖ)∈⟨T^m⟩; {0,4}+8ℤ=4ℤ | pass | R02, R08 |
| 3.4 recovery | [3,6]/[6,3]; [3,6]/[3,3,2,2,2]; [3,4,5]/[5,4,3] | same class; m 9≠12; gap cycles not rotations | pass | R02 |
| 4.1 F_DIT | i, ±1/2+2i, ±1/2+(√3/2)i | i in F_DIT, not in fdo; −1/2+2i in, 1/2+2i out; −1/2+(√3/2)i in, 1/2+(√3/2)i out; fdo ⊆ F_DIT ⊆ fd | pass | R09 |
| 4.2 ν_A | D=28 | masses 2π and 5π; ν(∅)=0 | pass | — |
| 4.3 ρ_S | D=28 {I,J} | L=7, ρ(M)=7π/7π=1; the equal-weight model gives 1/(4π), 1/(10π) | pass | R08 |
| 4.4 complementary | D=12, D=28 | ι(I)=J; π+2π=9·π/3 with m: 4+5=9; 2π+5π=21·π/3 with 9+12=21 | pass | — |
| 4.5 genus | D=136, 12, 8 | 136=6²+10²; 3 divides 12; for D=8, J square and J=1 | pass | — |
| 4.6 examples | D=12, D=28 | [3,2] word [[5,−3],[2,−1]], trace 4; [3,3,2,2,2] word [[23,−18],[9,−7]], trace 16; minus continued fraction of (5+√7)/3 is 3,3,2,2,2; (3,5+√7)=(2+√7) via (2+√7)(−1+√7)=5+√7 | pass | — |
| 5.1 truncation | F=1, F=y | α=0; α=dz/2, top −m/2; tail m/Y | pass | — |
| 5.2 Stokes | general, λ=0, F=1 | dα = −(F_xx+F_yy)/2 dx∧dy = (λ/2)F dμ; a''=0, flux −ia'/2, tail a(Y₀)/Y₀; 0=0 with I=πℓ | pass | — |
| 5.3 endpoint | s=1/2+it | λ=1/4+t²; at t=0 the constant term is √y(log y+c); E(z,1/2)=0 | pass | R04 |
| Lean `AdmissibleCycle` | [], [2], [2,2], [1,5], [3], [4,4] | F,F,F,F,T,T (the nonemptiness conjunct is implied) | pass | — |
| Lean `cycleGroup` | [], [4], [3,6] | ⊥; ⟨T⁴,S⟩; ⟨T⁹,S,T³ST⁻³⟩ | pass | — |
| Lean `cyclePolygon` | [4] at 2+i, i/2 | normSq values 5, 5 (in); 1/4 (out) | pass | — |
| Lean fundamental domain | [3], [2] | Hecke-type domain for ⟨S,T³⟩; also true for the theta group | pass | — |
| Lean presentation | [4], [4,4] | ℤ*C₂; ℤ*C₂*C₂ | pass | R05 |
| Lean cusp stabilizer | [3,6], [2] | ⟨T⁹⟩; ⟨T²⟩ | pass | — |
| Lean infinite index | [4], [2] | 0; 3 (the hypothesis is needed and present) | pass | — |
| Lean highest elliptics | [3,6], [4,4] | i, 3+i at height 1, S(3+i) at 1/10; 4ℤ+i | true, but a route lemma | R02 |

## Not verifiable

- DIT16 Figures 1, 4, 6 and 7 (pp.955–958) are images, absent from the text extraction, and OCR is unavailable on this worker. The figure-based shape of P(n) and the arcs for [3,6] were recomputed instead (table rows 1.2, 2.1, 2.2).
- I fetched no new source. Three DIT16 glyphs were read through the extraction's byte pattern: the minus signs in exponents, at lines 141, 511 and 1027.

## Source issues

- **Misprint** in DIT16 at §2, Nielsen-region paragraph, p.952: the source says the region lies above the geodesics over the complementary intervals; it should be the side away from each interval, which differs for an interval through ∞; affects nothing.
- **Gap** in DIT16 at the proof of Theorem 1, p.958: the source says the arc from z to γ(z) meets the next circle because of where the complete axis ends; it should be a justification that the finite subarc reaches the circle, whose meeting point for ℓ=1 is γ(z) itself; affects the proof.
- **Gap** in DIT16 at the proof of Theorem 1, last paragraph, p.959: the source says distances between chosen successive elliptic lifts are conformal invariants; it should be an argument that first lifts and normalizes the equivalence, since for ℓ=1 both lifts are one cone point; affects the proof.
- **Misprint** in DIT16 at §5, the display after (5.2), p.961: the source says the Laplacian has the factor y to the power −2; it should be −y²(∂x²+∂y²), as in (7.10) on p.972; affects nothing.
- **Gap** in DIT16 at Lemma 2 and its proof, p.972: the source says the identity follows by letting Y→∞ under the flux condition alone; it should be a proof that the truncated area integrals converge, with s(1−s)=0 treated separately; affects the proof.
- **Misprint** in SERIES05 at the Fuchsian paragraph after Proposition 4.60, p.33: the source says geometric finiteness is equivalent to finite area of the Nielsen region; it should be the region's quotient by the group; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "4be8459", "job": "REV-PKG-FuchsianOrbifoldsPartII", "model": "opus", "worker": "fable-rev70"} -->
