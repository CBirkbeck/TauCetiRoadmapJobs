# Review of ArithmeticFuchsianGroups (pull request #2026 at c567d7a)

**Verdict:** needs changes

On this head the gate passes and the dependency check reports no problem. Eleven of the previous
review's thirteen findings are repaired, R03 is partly repaired and R09 is not (see the table
below). Six findings remain: four P2 and two P3.

- Three definitions in `Suggested.lean` restate predicates that the pinned Tau Ceti already has.
- One headline that is declared not statable is in fact statable.
- The isometry identification of §3.1 has two owners.
- A FuchsianOrbifolds citation is stale at that roadmap's open head.

## The previous review, finding by finding

| Previous | Status at c567d7a | Evidence (this head) |
|---|---|---|
| R01 sorry'd Tamagawa measure | repaired | `tamagawaMeasure` and its carriers are gone. README lines 51–53: "Tamagawa number one for `SL₁(B)`: EndoscopicTransferAndUnitaryTraceComparison §6.2 proves `τ(S)=1`". |
| R02 sorry'd action, roadmap import, `letI` | repaired | `Suggested.lean:1–3` imports only `Mathlib` and two Tau Ceti modules. The action is Tau Ceti's `UpperHalfPlane.instMulActionPSL2`. `IsLattice` has no `letI`, but now duplicates a native predicate (R01 below). |
| R03 statable headlines absent | partly | Five headlines are now stated: `isArithmetic_iff_dense_commensurator`, `commensurator_discrete_of_not_isArithmetic`, `discr_ge_odlyzko_five`, `discr_ge_totallyReal` and `covolume_normOneImage`. Fixed-signature finiteness is still declared not statable, wrongly (R02 below). |
| R04 τ(SL₁(B)) = 1 and adelic Poisson re-planned | repaired | §1.2 step (a), lines 394–397, consumes §6.2. Lines 55–56 place Poisson summation in AnalyticNumberTheoryPartII §§5.3g–5.3h. ThetaSeries no longer occurs. |
| R05 reduced-norm images, classification re-planned | repaired | Lines 57–62 and 199–210 cite ClassicalArithmeticCompletion §7.60 and GL2AutomorphicRepresentationsAndTransfer R17.1.5. `global_reduced_norm_localization` is gone. |
| R06 second owner of quaternion orders | repaired on this side | Lines 29–32 claim ownership, and lines 1032–1035 name QuaternionArithmetic as a consumer. QuaternionArithmetic's head still claims them; see "Ownership against open pull requests". |
| R07 Odlyzko (4), strip positivity | repaired | Lines 63–64 cite AnalyticNumberTheoryPartI §2.9a. Lines 65–70 and 229–230 cite SmallRamificationAndAbelianVarietyBaseCases §§1.0 and 1.6. |
| R08 algorithms and certificates | repaired | No bisection, grid, enumeration or provenance text remains. Line 554 reads "prove `Q₅(u) > 0` for every `u ≥ 0`". |
| R09 isometry identification | not repaired | §3.1 now claims the theorem, but TeichmullerGeometry's head keeps it and refuses to consume it (R03 below). |
| R10 gate style | repaired | The gate re-run on this head: `blob=0 tex=0 dropped=0`. |
| R11 locators | repaired | ZerosOfLFunctions "§1.4, §3.1, §§3.4–3.5 and Layer 5" (lines 75–77) all resolve on main. `TauCeti.skolemNoether` and `IsCoveringMap.existsUnique_continuousMap_lifts` are cited. Line 548 now cites inequality (13) on p. 214, and the ICM phrase is gone. |
| R12 order-32 padding | repaired | `Suggested.lean` has no `p85` declaration, and §3.2 has no backticked Lean name. |
| R13 README shape | repaired | The README now has the house shape: Summary, sections 25/94/130/254, `### k.n` subsections with **Checks.**, *Needs:*, Examples and Dependencies per layer, and Downstream consumers. No process words remain. |

## R01 (P2) — `IsQuaternionOrder`, `IsMaximalQuaternionOrder` and `IsLattice` restate Tau Ceti's predicates

- **Location.**
  - `Suggested.lean:57–68`: `IsQuaternionOrder`, with fields `fg` and `span_eq_top`, and `IsMaximalQuaternionOrder`.
  - `Suggested.lean:88–91`: "def IsLattice (Γ …) : Prop := DiscreteTopology Γ ∧ ∃ s, IsFundamentalDomain Γ s volume ∧ volume s < ⊤".
  - README lines 29–30, 106–107, 304–306, 327–328 and 1032–1035.
- **Claim.** All three predicates exist at the Tau Ceti pin with the same content. So eight headline signatures are stated against local copies, and the README claims to own objects the library already provides.
- **Witness.** In Tau Ceti:
  - `RingTheory/IntegralOrder/Basic.lean:75` defines `IsOrder F Λ := (toSubmodule Λ).IsLattice F`.
  - `Maximal.lean:68` defines `IsMaximalOrder F Λ := Maximal (IsOrder F) Λ`.
  - `Fuchsian/Covolume.lean:117` defines `IsCofinite`: discrete, with `covolume Γ ℍ ≠ ∞`.

  All three equivalences compile in scratch with complete proofs.
- **Repair.**
  - Delete the three definitions.
  - Import `TauCeti.RingTheory.IntegralOrder.Maximal` and `TauCeti.Analysis.Complex.Fuchsian.Covolume`.
  - Replace `IsQuaternionOrder a b O` by `TauCeti.IntegralOrder.IsOrder k O`, `IsMaximalQuaternionOrder a b O` by `TauCeti.IntegralOrder.IsMaximalOrder k O`, and `IsLattice Γ` by `Γ.IsCofinite`. The affected lines are 86, 97–98, 105, 122, 185, 215, 221 and 230.
  - In the README, list the three under "From Tau Ceti" with their files.
  - Rewrite the three "Define …" sentences as statements about the native predicates, keeping the API bullets and the Checks.
  - In "Owned here" (lines 29–32) and in the QuaternionArithmetic bullet (lines 1032–1035), replace "quaternion orders and maximal orders" by what is owned: the existence of a maximal order containing a given order, the local structure, the order-to-tree adapter and type finiteness.

  Tested: `IsArithmetic`, rewritten with `TauCeti.IntegralOrder.IsOrder k O`, elaborates at the pins. The scratch proofs are:

```lean
theorem isQuaternionOrder_iff {K : Type*} [Field K] [NumberField K] (a b : K)
    (O : Subalgebra (𝓞 K) ℍ[K, a, b]) :
    IsQuaternionOrder a b O ↔ TauCeti.IntegralOrder.IsOrder K O :=
  ⟨fun h => ⟨h.fg, h.span_eq_top⟩, fun h => ⟨h.fg, h.span_eq_top⟩⟩

theorem isLattice_iff_isCofinite (Γ : Subgroup PSL(2, ℝ)) : IsLattice Γ ↔ Γ.IsCofinite := by
  constructor
  · rintro ⟨hd, s, hs, hfin⟩
    exact hs.isCofinite_of_volume_ne_top hfin.ne
  · intro h
    have := h.discreteTopology
    obtain ⟨s, -, -, hs⟩ := Subgroup.exists_isFundamentalDomain Γ
    exact ⟨this, s, hs, lt_top_iff_ne_top.2 (h.volume_ne_top hs)⟩
```

## R02 (P2) — Fixed-signature finiteness is statable at the pins

- **Location.** `Suggested.lean:23–24`: "Takeuchi's fixed-signature finiteness (§1.4): the signature of a Fuchsian group (FuchsianOrbifolds Layer 4 item 5) has no carrier in Mathlib or Tau Ceti." README lines 626–627.
- **Claim.** The stated reason is false, and the headline has a statable form.
  - Borel 1981, Theorem 8.2, which §1.4 cites, gives finiteness up to conjugacy of arithmetic lattices of covolume at most `c`. Stating it needs only `IsArithmetic`, `Subgroup.IsCofinite` and `MeasureTheory.covolume`.
  - It implies the fixed-signature form, because a signature fixes the covolume.
  - It is strictly stronger: the signatures `(0; 2, 3, m)` give infinitely many below `π/3`.
  - The §1.4 route already bounds the number of generators by the covolume (line 616).
- **Witness.**
  - `borel1981` line 811, Theorem 8.2, p. 26.
  - Tau Ceti has the signature carriers: `Fuchsian/Elliptic/Finite.lean:74` (`ellipticOrbits`), `Fuchsian/Cusp/Basic.lean:137` (`CuspOrbit`) and `Stabilizer/Basic.lean:270` (`cardStabilizerOnOrbit`).
  - FuchsianOrbifolds' head states `covolume_eq_two_pi_mul_signature` with them.
- **Repair.** Add the following to Layer 1, after R01. Make it the §1.4 target, with the signature statement as its corollary for `C = A`. Then delete the docstring bullet and README lines 626–627. Tested: it elaborates at the pins with only the `sorry` warning.

```lean
/-- **Arithmetic lattices of bounded covolume** (§1.4; Borel 1981, Theorem 8.2): up to
conjugacy in `PSL(2,ℝ)` there are finitely many arithmetic lattices of covolume at most `C`; in
particular finitely many have a given signature (Takeuchi 1983, Theorem 2.1). -/
theorem finite_conj_isArithmetic_covolume_le (C : ℝ) :
    ∃ F : Finset (Subgroup PSL(2, ℝ)), ∀ Γ : Subgroup PSL(2, ℝ), Γ.IsCofinite → IsArithmetic Γ →
      covolume Γ UpperHalfPlane ≤ ENNReal.ofReal C →
        ∃ Δ ∈ F, ∃ c : PSL(2, ℝ), MulAut.conj c • Γ = Δ := by
  sorry
```

## R03 (P2) — §3.1 has two owners, and its route does not prove its statement

- **Location.**
  - `Suggested.lean:239`: `existsUnique_pgl_smul_eq_isometryEquiv (f : UpperHalfPlane ≃ᵢ UpperHalfPlane)`.
  - README lines 913–919: "some `c` makes `c⁻¹f` fix `i` with identity differential; … This is the identification TeichmullerGeometry §0.4a consumes".
  - README lines 1028–1029.
- **Claim.**
  - `f` is an isometry for the distance, and no supplier gives it a differential, so the 1-jet route through R4 item 7 does not prove the statement as written.
  - TeichmullerGeometry, at its head, owns exactly this theorem with a proof that needs no differential. It explicitly declines to consume §3.1, and leaves this roadmap only the smooth lift step.
  - So the theorem has two owners, and the Downstream consumers bullet is false.
- **Witness.**
  - TeichmullerGeometry README at its head, line 337 (§0.4a): "that step needs a differential, which a distance isometry of `ℍ` is not known to have at the pins … does not consume §0.4a".
  - Its `Suggested.lean:539`: `exists_mulEquiv_isometryEquiv_glAction`.
- **Repair.** TeichmullerGeometry comes later in the merge order (285 against 284), so it cannot be cited here.
  - Restate §3.1 as the step §3.4 uses: every smooth Riemannian isometry of `ℍ` for the FuchsianOrbifolds L2.1 metric is `z ↦ c · z` for a unique `c ∈ PGL₂(ℝ)`, by R4 item 7's 1-jet rigidity and faithfulness. This covers the lift of an isometry `S₁ → S₂`, which is a local isometry because both projections are.
  - Delete `existsUnique_pgl_smul_eq_isometryEquiv` and its docstring from `Suggested.lean`.
  - Rewrite the Summary sentence (line 14), the "Owned here" bullet (line 46) and lines 1028–1029, so that TeichmullerGeometry is not said to consume §3.1.

  On the refuting instance, a distance isometry not known to be smooth, the restated target no longer applies; its only use, in §3.4, is on lifts through Riemannian coverings, which are smooth.

## R04 (P2) — FuchsianOrbifolds Layer 5 citations are stale at its open head

- **Location.**
  - README lines 183–185: "Layer 5 items 4 and 5 (Riemann–Hurwitz for finite-index quotient maps, and the identification of the signature genus with the genus of the compact quotient)".
  - Line 992: "Layer 5 items 4–5".
  - Lines 976–977: "(FuchsianOrbifolds Layer 5)".
- **Claim.** FuchsianOrbifolds' open revision has renumbered Layer 5. That revision is this pull request's base branch, now at a1a346e, while this head sits on 4b6bb3d. In the revision:
  - item 4 is the descent of invariant functions, and item 5 is the degree of `X(Γ′) → X(Γ)`;
  - Riemann–Hurwitz is item 6;
  - the genus bridge with the orbifold area formula is item 7.

  On main, item 4 is also descent, and there is no genus-bridge item. This is a supplier citation of an id the open pull request drops.
- **Witness.** FuchsianOrbifolds README at its head, lines 506, 512, 520 and 532. Its line 36 says that ArithmeticFuchsianGroups takes "Layer 5 items 5–7".
- **Repair.** Rebase onto the base branch's tip. At lines 183–185, 976–977 and 992, cite "Layer 5 item 5 (degree of compactified quotient maps), item 6 (Fuchsian Riemann–Hurwitz) and item 7 (the genus bridge and the orbifold area formula)".

## R05 (P3) — Two library names do not resolve at the pins

- **Location.**
  - README lines 115 and 159: `QuaternionAlgebra.nonempty_algEquiv_matrix_iff_not_anisotropic_normForm`.
  - README lines 147, 608 and 644: `Ideal.finite_setOf_absNorm_le`.
- **Witness.**
  - `#check` reports "Unknown constant" for the first name. The theorem is `TauCeti.QuaternionAlgebra.nonempty_algEquiv_matrix_iff_not_anisotropic_normForm` (`SplittingCriterion.lean:208`), stated for `a b : Kˣ` with `[Invertible (2 : K)]`.
  - The second name warns "deprecated: Use `Ring.HasFiniteQuotients.finite_absNorm_le`".
- **Repair.**
  - At lines 115 and 159, write the `TauCeti.`-qualified name with its hypotheses: unit parameters and `2` invertible.
  - At lines 147, 608 and 644, write `Ring.HasFiniteQuotients.finite_absNorm_le` (`RingTheory/Ideal/Norm/AbsNorm.lean`).

## R06 (P3) — A Check, a computed value and a docstring sentence are inaccurate

- **The G₅ Check.**
  - *Location.* README lines 354–357: "`tr(ST)² = φ² = φ + 1 ∉ ℚ` contradicts the trace integrality and field identification of §1.3".
  - *Witness.* `tr(ST) = φ` is an algebraic integer, so G₅ passes trace integrality. Only the identification `K₀ = k = ℚ` fails.
  - *Repair.* Write "contradicts the field identification of §1.3".
- **A computed value.**
  - *Location.* README line 632: "`((4π²)³/21)^(2/3) ≈ 204.6`".
  - *Witness.* The value is 204.76.
  - *Repair.* Write "≈ 204.8".
- **The Layer 3 docstring.**
  - *Location.* `Suggested.lean:31–32`: "neither the quotient surface of a Fuchsian group nor a Laplace spectrum".
  - *Witness.* Tau Ceti has the Riemann surface `Γ \ ℍ` (`Subgroup.instIsManifoldOrbitRelQuotient`, `Fuchsian/CoarseQuotient.lean:130`).
  - *Repair.* Say that the missing carriers are its descended Riemannian metric and a Laplace spectrum with multiplicities.

## Verified sound

**Gate, dependencies and scope.**
- The gate, re-run on this head, reports every check at 0, then OK.
- The dependency check reports `depcheck: 238 roadmaps, 2322 edges, 0 problem(s)`, with no UPWARD or CYCLE line.
- The roadmap sits at line 284 of the merge order. Its suppliers are earlier or on main:
  - earlier: FuchsianOrbifolds (49), AdelicAlgebraicGroups (52), GL2AutomorphicRepresentationsAndTransfer (100), SmallRamificationAndAbelianVarietyBaseCases (119), EndoscopicTransferAndUnitaryTraceComparison (148) and NoncompactQuantumSymmetry (155);
  - on main: LFunctions, ZerosOfLFunctions, ClassicalArithmeticCompletion, ReductiveGroupsPartII, RepresentationTheory, RiemannianGeometry and PseudodifferentialOperators.
- `git diff --stat` against the base, outside the folder, is empty.

**Elaboration, signatures and padding.**
- `lake env lean` on `Suggested.lean` gives 13 warnings, all `declaration uses sorry`, on the 13 theorems.
- A scratch file importing the built module ran `#check @` on all 26 declarations. Each elaborated type matches its README statement:
  - The trace-invariance theorems keep `Group.FG Γ` and `IsNonelementary Γ`.
  - `integral_trace_lattice_order` keeps `[NumberField K]`, `a ≠ 0` and `b ≠ 0`.
  - The Layer 1 theorems carry `[NumberField k] [IsTotallyReal k]` in their own signatures.
  - No `def` lost a binder.
  - Nothing was changed.
- The one-tactic probe tried `rfl`, `simp`, `infer_instance`, `decide`, `aesop` and `exact?` on all 13 theorems in a copy. None closed: lines 99 and 203 timed out, and the other eleven failed. No declaration restates a definition or mirrors a Check.

**Library declarations opened at the pins (file:line).**
- Mathlib:
  - `UpperHalfPlane.σ` (MoebiusAction.lean:91, conjugation for `det < 0`) and `glAction` (:181). The README's `(a z̄ + b)/(c z̄ + d)` convention matches.
  - `MulAction PGL(2, ℝ) ℍ` (:267).
  - `Matrix.ProjGenLinGroup` is a `def` (Projective.lean:41) with no topology instance anywhere at the pins, so the §2.4 docstring reason is correct.
  - `Submodule.IsLattice` (Algebra/Module/Lattice.lean:68) and `MeasureTheory.covolume` (FundamentalDomain.lean:679).
  - `#check` passes for `toPGL_injective`, `UpperHalfPlane.volume_def`, `UpperHalfPlane.dist_eq`, `NumberField.finite_of_discr_bdd`, `jacobson_density`, `Module.Finite.toModuleEnd_moduleEnd_surjective`, `IsCoveringMap.existsUnique_continuousMap_lifts`, `Complex.digamma`, `Real.eulerMascheroniConstant`, `NumberField.dedekindZeta` and `nrComplexPlaces`.
- Tau Ceti:
  - PSL/Action.lean: `instMulActionPSL2` (:136), `SMulInvariantMeasure` (:161), `toPGL_smul` (:170) and `FaithfulSMul` (:180).
  - `TauCeti.skolemNoether` (:107): `B` central simple, `A` simple and finite-dimensional, as the README says.
  - `TauCeti.dedekindZeta_eulerProduct_hasProd` (:498, for `1 < Re s`).
  - `Subgroup.AlmostConjugate` (:92) and `TauCeti.ratPosToPSL2R` (RatPSLAction.lean:78, namespace `TauCeti`).
  - `HyperbolicMetric` (Hyperbolic.lean:51) and `laplaceBeltrami` (Laplacian.lean:238).
  - `IsElementary` (GroupTheory/Elementary.lean:144) is Brauer's `p`-elementary notion, so it does not duplicate `IsNonelementary`.
  - R01's and R02's declarations were opened at the lines given there.

**Cross-roadmap citations resolved (43).**
- FuchsianOrbifolds at #1168's head: Layer 0 items 1–3 (item 2 includes the isometric `GL(2,ℝ)` action), Layer 2 items 1, 4 and 5, Layer 4 item 5, and Layer 4a items 1–2 with `minimum_area_finite_area_orbifold`. Layer 5 is R04.
- EndoscopicTransferAndUnitaryTraceComparison §6.2, line 2098. It states `τ(S) = 1` for simply connected semisimple `S`, inner forms included, and its Check reads "`τ(SL_n)=1`, including `SL₁=1`".
- AdelicAlgebraicGroups:
  - §2.4 (line 2011);
  - §3.4: class-number finiteness with `Reduction.finite_classes` (line 3169), Borel–Harish-Chandra (3216) and anisotropic compactness (3474);
  - §4.2: quaternion norm-one strong approximation (4263).
- GL2AutomorphicRepresentationsAndTransfer R17.1.5 (line 1508): realisable exactly for real infinite places and even cardinality, and isomorphic exactly when the splitting predicates agree.
- ClassicalArithmeticCompletion §7.60: main line 15856, and line 15335 at the head of #1409. It covers `Nrd`, the local images, and maximal-order units with image `𝒪_v^×`.
- LFunctions Layer 3 (730).
- ZerosOfLFunctions §1.4 (478), §3.1 (636), §3.4 (705), §3.5 (763), Layer 5 (927) and §5.6 (1003).
- SmallRamificationAndAbelianVarietyBaseCases:
  - §1.0 (234): the explicit formula, with the same hypotheses and normalisation as README lines 221–227;
  - §1.6 (475): `Re Φ ≥ 0` on the closed strip for even, continuous, compactly supported, nonnegative positive-definite `f`;
  - §1.7 (519).
- ReductiveGroupsPartII RG2.2.1 (2846), with `Building.exists_fixedPoint_of_bounded` at 2955; RG2.2.2 (2973); and RG2.2.4 (3408), with `BTTree`, `type_smul` and `sl2_preserves_type` at 3658–3666.
- RepresentationTheory: LieGroups (the closed-subgroup theorem at line 11, automatic smoothness at 453), SemisimpleAlgebras Layer 3 (233) and InductionRestriction Layer 2.1 (346).
- RiemannianGeometry R4 item 7 (717): the quotient atlas, descended metric and covering, and the 1-jet rigidity of local isometries.
- NoncompactQuantumSymmetry M1 (1563–1592): the finite-index lattice-quotient `L²` adapter.
- PseudodifferentialOperators P7a, Layer 8 (1933).
- AnalyticNumberTheoryPartI §2.9a (1473; estimate (4) at 1490) and AnalyticNumberTheoryPartII §5.3g (682) and §5.3h (699).
- GeometryOfNumbersAndQuadraticArithmetic `quaternionAdjointTamagawa` (1121), which matches lines 53–55.
- TeichmullerGeometry at its head: §9.1 (858) and §9.2 (870) consume "Layer 1 items 1 and 4". README line 1028 gives the old → new numbering, and line 990 agrees on who owns the isospectral application.

**Sources: the seeded sample.**
- 1.1: Voight, Proposition 38.3.8 (`voight2021` line 29767, p. 708: arithmetic subgroups are discrete) and Main Theorem 38.4.3 (line 29825, p. 709: compact for division `B`). Borel §3 and §4 are "arithmetic subgroups of `G_{a,b}`" and "maximal arithmetic subgroups" (`borel1981` lines 209 and 286).
- 1.2: Voight, Main Theorem 39.1.8 with (39.1.9) (lines 30270–30272, p. 720). With `t = 1`, `r = n`, `c = 0` and `λ = 1 − 1/q` at ramified primes ((39.1.7), lines 30257–30269), `2·4π/(4π²)ⁿ · ζ_k(2)·d^(3/2)·N𝔇·∏(1 − 1/q)` equals the README formula. Theorem 39.1.2 (line 30203, p. 719) gives `(π/3)φ(D)`. Borel, Theorem 7.3 (line 690, p. 22).
- 1.3b: Odlyzko 1977, Theorem 1 with (4) and (5) on p. 210 (`odlyzko1977` lines 39–44). Also (7)–(8) on p. 212 (lines 88–92), (9)–(12) on p. 213 (107–118), and (13) with Stark's reduction to `x = 1` on p. 214 (129–142); this also confirms that (13) holds trivially at `y = 0`. The tables are on p. 215 (174).
- 1.4: Borel §7.1 (line 662, p. 21: `Γ/Γ^(2)` is elementary abelian of rank at most the number of generators), Lemma 8.1 (779, p. 25) and Theorem 8.2 (811, p. 26).
- 1.5: Table 4 rows `b = 0.42` and `b = 6.1` are at `odlyzko1976tables` lines 23 and 105. All 31 `(b, A, E)` rows match Table 4 exactly.
- 2.2: Bader–Furman, Definition 2.3 (`baderfurman2021` line 130), Theorem 2.5 (152), Lemma 2.6 (163), Theorem 3.2 (321) and Lemma 4.2 (566). Each says what §2.2 uses it for.
- 3.1: Voight, Theorem 33.5.5 (line 25554, pp. 603–604) proves `Isom(H²) ≃ PGL₂(ℝ)` by a metric argument without differentials. That supports the statement, not the README's route (R03).
- 2.0, 2.3, 2.4 and 3.2–3.5 cite only suppliers or Mathlib; their values are recomputed in the table below.

**Adversarial table** (values computed on each side).

| Statement | Instances | Values | Result | Change |
|---|---|---|---|---|
| `RealSplitting` | `ℚ(√2)`, `(−1,√2)`; `ℚ`, `(−1,−1)`; `ℚ(√2)`, `(1,1)` | With `place: √2 ↦ 1.414`: `σa = −1 < 0` and `σb = −1.414 < 0`. With `place: √2 ↦ −1.414`: `σb = +1.414`, so it fails. Hamilton: no ring map to `M₂(ℝ)`. `(1,1)`: `σa = 1 > 0`, so it fails | discriminates | none |
| `IsQuaternionOrder` | `M₂(ℤ)`; `ℤ·1`; `ℤ[1/2]·ℤ⟨1,i,j,ij⟩` | rank 4 with span `⊤`; span `ℚ`; not finitely generated. The scratch proof gives `↔ TauCeti.IntegralOrder.IsOrder` | correct, duplicated | R01 |
| `IsMaximalQuaternionOrder` | `M₂(ℤ)`; the Eichler order of level 2 | maximal; strictly inside `M₂(ℤ)`. The scratch proof gives `↔ IsMaximalOrder` | correct, duplicated | R01 |
| `IsLattice` | `⊥`; `⟨z ↦ z+1⟩`; `PSL₂(ℤ)`; `GL₂(ℚ)⁺` | `∫∫_ℍ dy dx/y² = ∞`; `∫₀¹∫₀^∞ dy/y² = ∞`; `π/3`; not discrete. The scratch proof gives `↔ IsCofinite` | correct, duplicated | R01 |
| `isLattice_normOneImage` | `(1,1)/ℚ` with `O ↦ M₂(ℤ)`; `O = ℤ·1` | `det ∘ splitting = Nrd = 1`, so `Γ = PSL₂(ℤ)`, of area `π/3`; `Γ = {1}`, of infinite area, and the order hypothesis fails | holds | none |
| `cocompact_normOneImage_iff_anisotropic` | `(1,1)/ℚ`; `(−1,3)/ℚ`; `(2,3,7)` over `ℚ(cos 2π/7)` | `(1,1,0,0)` is isotropic and there is a cusp: both sides false. `3∣x₀²+x₁²` gives a descent, so anisotropic, and disc 6 is compact: both true. Division and compact: both true | holds | none |
| `finiteRamification` | `(−1,−1)/ℚ`; `(−1,3)/ℚ`; `(1,1)`; `(−1,−1)/ℚ(√2)`; `a = 0` | `{2}`; `(−1/3) = −1` with the product formula gives `{2,3}`; `∅`; `∅`; isotropic in `x₁`, so `∅` (a junk value excluded by `a_ne_zero`) | holds | none |
| `covolume_normOneImage` | `M₂(ℤ)`; disc 6; Hurwitz order, `d = 49` | `8π(π²/6)/(4π²) = π/3`; `(π/3)·1·2 = 2π/3 = 2π(−2+1+4/3)`; `ζ_k(2) = 8π⁶/(21·343)` gives `π/21` | holds | none |
| §1.2 local volumes and assembly | split, division and real places | `1 − q⁻²`; `q⁻¹(1−q⁻²)/(1−q⁻¹) = (1−q⁻²)/(q−1)`; solving `1 = d^(−3/2)(π/2)·area·(4π²)^(n−1)·ζ⁻¹∏⁻¹` gives `8π d^(3/2) ζ ∏/(4π²)ⁿ` | consistent | none |
| `invariant_squared_trace_data_finite_index` | `PSL₂(ℤ) ⊇ Γ(2)`; `⟨diag(λ,λ⁻¹)⟩` with `t` transcendental | `ℚ` and `M₂(ℚ)` on both sides; `ℚ(t)` against `ℚ(t²)` for the index-2 subgroup, so nonelementarity is needed and present | holds | none |
| `invariant_squared_trace_data_commensurable` | `Γ = PSL₂(ℤ)`, `c = diag(2^(1/6),2^(−1/6))`, `Δ = c⁻¹Γc` | `c A_Δ c⁻¹ = M₂(ℚ) = A_Γ`; the reverse conjugation scales entries by `2^(∓2/3)` | the Lean direction is correct | none |
| `IsNonelementary` | `⊥`; a finite group; `⟨z↦2z, z↦−1/z⟩`; `PSL₂(ℤ)` | `⊤` (resp. `⊥`) is a solvable finite-index subgroup; an abelian subgroup of index 2; every finite-index subgroup contains `F₂` | F, F, F, T | none |
| `integral_trace_lattice_order` | `H = SL₂(ℤ) ⊂ M₂(ℚ)`; `H = {±1}` | the span of `I`, `I+E₁₂`, `I+E₂₁`, `(2 1;1 1)` contains `E₁₁ = (2 1;1 1)−I−E₁₂−E₂₁`, so it is `M₂(ℤ)`; the span is `ℚ`, so the hypothesis fails | holds | none |
| `squared_trace_integrality_…` | `PSL₂(ℤ)`; `(2 1;2 2)/√2 ∈ Γ₀(2)⁺`; `diag(2,1/2)`; `G₅` | traces in `ℤ`; `2√2`, integral; `5/2`, not integral, so not arithmetic; `tr(ST) = φ`, integral | holds (G₅ Check wording: R06) | R06 |
| `discr_ge_odlyzko_five` | `ℚ`; `ℚ(i)`; the nine rows | `58.6·e^(−70) = 2.33·10⁻²⁹ ≤ 1`; `21.8²·e^(−70) ≤ 4`; `C_R − log 58.6 = 0.0008655`, `C_C − log 21.8 = 0.0036206`, `C_pole = −69.5895`; `2a_i` are the `f₂` coefficients | holds | none |
| Inequality (11) on the strip | `z = 1+iy`, `0 ≤ y ≤ 1000`; a grid on `0 ≤ x ≤ 1`, `0 ≤ y ≤ 200` | `E − Σ a_i E_(k_i)` is positive everywhere; `y²·diff → 0.0160` | holds numerically | none |
| `discr_ge_totallyReal` | `n = 1…5`; `n = 9`; all 31 rows; `n ≥ 36` | `1, 5, 49, 725, 14641` against `0.0071, 0.2065, 6.0096, 174.87, 5088.6`; `9685993193 ≥ 3.65·10⁹`; `A_b − A ≥ 0.0026`, `E − 8b/3 ≥ 0.00003`, `A e^(−E/n₀) − B ≥ 0.00024` (`n₀ = 32`); the minimum ratio is `1.2036914` at `n = 9`; `29.583 > 29.099` | holds | none |
| `H` (the §1.5 kernel) | `x = 0, 1/2, 1, 2` | `1`; `0.659`; direct `(h∗h)(1) = ∫₀¹ sin²πt dt/3 = 1/6`; `H(2) = H′(2) = H′(0) = 0`; `∫H = 4/3`, so the pole term is `8b/3` | holds | none |
| §1.4 chain | `(0;2,3,7)`; `(1;−)`; `(0;2,2,2,2)`; index bound | `3⁷⁰ = 10^33.40`; `58.6^1.5/(4π²) = 11.363`; `((4π²)³/21)^(2/3) = 204.76`; `A = 0` twice; `(m!)^d/(m−1)! = m(m!)^(d−1) ≤ m(m!)^d` | holds (value misprinted) | R06 |
| `isArithmetic_iff_dense_commensurator` | `PSL₂(ℤ)`; `G₅`; `⊥` | dense (it contains `GL₂(ℚ)⁺`) and arithmetic; `K₀ ∋ φ−1` with a cusp, so not arithmetic, with discrete commensurator; `⊥` has a dense commensurator but is not a lattice | holds; the lattice hypothesis is needed | none |
| `commensurator_discrete_of_not_isArithmetic` | `G₅` | `Comm = G₅`, of index 1 | holds | none |
| `dense_commensurator_…_number_field` | `PSL₂(ℤ)`; `(2,3,7)` | `[K₀:ℚ] = 1`; `3` | holds | none |
| `existsUnique_pgl_smul_eq_isometryEquiv` | `id`; `z ↦ −z̄` | `c = 1 = [2I]`; `c = diag(−1,1)`, and Mathlib's `σ` gives `conj(−z) = −z̄` | true (Voight 33.5.5), but two owners | R03 |
| Takeuchi / Borel finiteness | `(0;2,3,m)`, `m ≥ 7` | area `2π(1/6 − 1/m) < π/3` for every `m`, so the covolume form is strictly stronger; the probe elaborates | statable | R02 |
| §3.2, the group of order 32 | all 32 elements | classes of sizes `1,4,2,1,4,4,2,4,2,4,4`; both intersection vectors `1,0,0,0,1,0,1,0,0,1,0`; coset character `8,0,0,0,2,0,4,0,0,2,0`; no conjugator; trivial cores; `⟨(1,1),(3,0),(5,0)⟩` has 32 elements | holds | none |
| §3.4 | `g = 3`; `b_i ↦ 1` | `2h−2 = 8·4` gives `h = 17 = 8g−7`; `[a_i, 1] = 1`, so the map respects the relation and is onto | holds | none |

**Ownership against open pull requests.** I ran `roadmaps grep` over main and all open heads for: "58.6", "29.099|2439", "estimate (5)", "dense commensurator", "arithmetic Fuchsian", "Takeuchi" and the covolume formula.
- No second owner exists for Odlyzko (5), the totally real bound or the commensurator criterion. ExplicitNumberFields (Scope and ownership) explicitly defers discriminant bounds elsewhere.
- QuaternionArithmetic (#1722, a draft) still claims, at its head, orders, maximal orders, `O¹`, Eichler orders and type finiteness (README lines 41–44). It cites "TeichmullerGeometry §9.1" for the lattice theorem (line 260), not this roadmap. Through TeichmullerGeometry (285) it is placed after this roadmap, so this README's declaration (lines 1032–1035) is the right direction. The remaining citation repair belongs to QuaternionArithmetic.
- `overlaps.md` lists no open pull request changing this folder. The only dropped ids are R04's.

## Not verifiable

- **Takeuchi 1983**, Theorem 2.1. On 2026-11-09 the sources service found no legal copy: the Project Euclid DOI landing page has no PDF link.
- **Maclachlan–Reid, GTM 219**: Theorems 11.2.1 and 11.3.1, §11.3.1 and p. 346. Springer, paywalled.
- **Margulis, Chapter IX.** Springer, paywalled.
- **Odlyzko 1977, the displayed formulas.** In the J-STAGE extraction the formulas of (4)–(13) and the table entries are images. I recomputed the constants of (5) from the nine rows instead (see the table).
- **Odlyzko's unpublished Table 2.** The cited URL holds only Table 4. The `B` column is not load-bearing, since every inequality `A e^(−E/n₀) > B` was checked directly.
- **The manifest.** `sources.toml` has no entries for `takeuchi1983`, `maclachlanreid2003` or `margulis1991`. This review edits no manifest.

## Source issues

- none
