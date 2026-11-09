# Review of ArithmeticFuchsianGroups (pull request #2026 at e4e4f9a)

**Verdict:** needs changes

The gate fails on this head (seven failing checks, listed under R01, R02 and R10). Beyond the gate there
are two P1 defects in `Suggested.lean`. The README also re-plans objects that earlier roadmaps already
own: Tamagawa number one, adelic Poisson summation, reduced-norm images, quaternion classification by
ramification, Odlyzko's estimate (4) and strip positivity. It shares ownership of quaternion orders with
QuaternionArithmetic. Findings are ordered by severity.

## R01 (P1) — Sorry'd Tamagawa measure and a headline stated against it

- **Location.** `TauCetiRoadmap/ArithmeticFuchsianGroups/Suggested.lean:191–200`: "noncomputable def tamagawaMeasure : Measure (AdelicNormOne a b) := by sorry", followed by `tamagawaNumberOne_SL1_quaternion`, which asserts a fundamental domain `s` with `tamagawaMeasure a b s = 1`.
- **Claim.** This is sorry'd data, and the gate's `sorry-data` check fails on it. The theorem constrains an unspecified measure, so it says nothing about the AA.2.4 normalisation and no proof can discharge it.
- **Witness.** Gate: "sorry-data: line 191". `lake env lean` warns "declaration uses `sorry`" at line 191, column 18, on the `def` itself; the theorem at line 196 mentions it.
- **Repair.**
  - Delete these declarations from `Suggested.lean`: `AdelicQuaternion`, its `TopologicalSpace` instance, `AdelicNormOne`, its `MeasurableSpace` and `BorelSpace` instances, `diagonalNormOne`, the `MulAction` instance, `tamagawaMeasure` and `tamagawaNumberOne_SL1_quaternion`.
  - In the module docstring, list τ(SL₁(B)) = 1 as not statable at the pins, because there is no Tamagawa measure on `SL₁(B)(𝔸_k)`.
  - R04 says where the theorem itself belongs.

## R02 (P1) — The Layer 2 statement depends on another roadmap's sorry'd action

- **Location.**
  - `Suggested.lean:5`: `import TauCetiRoadmap.FuchsianOrbifolds.Suggested`.
  - `Suggested.lean:209–210`: `hcov : letI := pslSubgroupMulAction Γ` followed by `∃ s : Set UpperHalfPlane, IsFundamentalDomain Γ s volume ∧ volume s < ⊤`.
- **Claim.** The finite-covolume hypothesis is stated for an action that is itself sorry'd:
  - `pslSubgroupMulAction Γ` is `MulAction.compHom ℍ (pslAction.comp Γ.subtype)`, and FuchsianOrbifolds' `pslAction` is defined `by sorry`.
  - So `hcov` concerns an arbitrary action of `Γ` on `ℍ`, and the statement mentions sorry'd data.

  The same lines fail two gate checks:
  - `imports`: the file imports another roadmap's module, and an open pull request revises that roadmap.
  - `statement-hygiene`: the signature contains a `letI`.
- **Witness.** `TauCetiRoadmap/FuchsianOrbifolds/Suggested.lean:31–32` reads "noncomputable def pslAction : PSL₂R →* Equiv.Perm ℍ := by sorry". In my scratch check, `#print pslSubgroupMulAction` shows the `compHom` body above.
- **Repair.**
  - Delete line 5, and remove `TauCetiRoadmap.FuchsianOrbifolds` from the `open` line.
  - Take the action from Mathlib. Mathlib's faithful `MulAction PGL(2, ℝ) ℍ` is at `Mathlib/Analysis/Complex/UpperHalfPlane/MoebiusAction.lean:267`. Pull it back along `Matrix.ProjectiveSpecialLinearGroup.toPGL`, defined at `Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Projective.lean:113` and proved injective at line 121.
  - Mathlib's `volume` on `ℍ` is already the hyperbolic area (`Mathlib/Analysis/Complex/UpperHalfPlane/Measure.lean:44`, density `y⁻²`).
  - The block below elaborated in a scratch copy that imports only `Mathlib` and `TauCeti.Algebra.Quaternion.NormForm`. The only warnings were for `sorry`, and it needs neither `letI` nor any roadmap import:

```lean
/-- Mathlib's Möbius action of `PGL(2,ℝ)` on `ℍ`, pulled back along `PSL(2,ℝ) → PGL(2,ℝ)`. -/
noncomputable instance : MulAction PSL(2, ℝ) UpperHalfPlane :=
  MulAction.compHom UpperHalfPlane Matrix.ProjectiveSpecialLinearGroup.toPGL

/-- A lattice of `PSL(2,ℝ)`: discrete, with a fundamental domain of finite hyperbolic area. -/
def IsLattice (Γ : Subgroup PSL(2, ℝ)) : Prop :=
  DiscreteTopology Γ ∧ ∃ s : Set UpperHalfPlane, IsFundamentalDomain Γ s volume ∧ volume s < ⊤

theorem dense_commensurator_squared_trace_field_is_number_field (Γ : Subgroup PSL(2, ℝ))
    (hΓ : IsLattice Γ)
    (hdense : Dense (Subgroup.Commensurable.commensurator Γ : Set PSL(2, ℝ))) :
    FiniteDimensional ℚ (squaredTraceField Γ) := by
  sorry
```

  Update the docstring paragraph at `Suggested.lean:15–16` to match.

## R03 (P2) — Statable headlines are absent, and the docstring does not name the rest

- **Location.**
  - The README completion criterion, items 1–4 (lines 40–52).
  - The module docstring at `Suggested.lean:7–19`, which says it pins "the squared-trace field … the arithmetic predicate, the named Layer 1 and Layer 2 targets, and the finite order-32 data of Layer 3".
- **Claim.** Apart from R02's sub-step, the file states only Layer 1 adapters and finite computations. Several headlines that are statable at the pins are missing:
  - Margulis' criterion (Layer 2, item 1): a lattice is arithmetic if and only if its commensurator is dense.
  - The same item's discrete alternative: otherwise the commensurator is discrete and contains the lattice with finite index.
  - The totally real bound `|d_k| ≥ a₀R₀ⁿ` (completion criterion, item 2).
  - Estimate (5): its unconditional consequence, from `f₂ ≥ 0`, is `|d_k| ≥ 58.6^{r₁}·21.8^{2r₂}·e^{−70}`.
  - The covolume formula (Layer 1, item 2).

  The docstring does not say which headlines are not statable, or which carrier each lacks.
- **Witness.**
  - `IsArithmetic`, `Subgroup.Commensurable.commensurator` and `NumberField.discr` all exist at the pins.
  - So do `NumberField.InfinitePlace.nrRealPlaces` and `NumberField.dedekindZeta` (`Mathlib/NumberTheory/NumberField/DedekindZeta.lean:50`).
  - The statements below elaborated against the pins.
- **Repair.** Add the following after R02's `IsLattice`. The block elaborated in the scratch copy with `sorry` warnings only; `finiteRamification` uses Tau Ceti's `QuaternionAlgebra.normForm` on each adic completion:

```lean
theorem isArithmetic_iff_dense_commensurator {Γ : Subgroup PSL(2, ℝ)} (hΓ : IsLattice Γ) :
    IsArithmetic Γ ↔ Dense (Subgroup.Commensurable.commensurator Γ : Set PSL(2, ℝ)) := by
  sorry

theorem commensurator_discrete_of_not_isArithmetic {Γ : Subgroup PSL(2, ℝ)} (hΓ : IsLattice Γ)
    (hna : ¬ IsArithmetic Γ) :
    DiscreteTopology (Subgroup.Commensurable.commensurator Γ) ∧
      Γ.IsFiniteRelIndex (Subgroup.Commensurable.commensurator Γ) := by
  sorry

theorem discr_ge_totallyReal (k : Type*) [Field k] [NumberField k] [IsTotallyReal k] :
    (2439 / 10 ^ 7 : ℝ) * (29099 / 1000 : ℝ) ^ Module.finrank ℚ k ≤ |(discr k : ℝ)| := by
  sorry

theorem discr_ge_odlyzko_five (k : Type*) [Field k] [NumberField k] :
    (293 / 5 : ℝ) ^ InfinitePlace.nrRealPlaces k *
      (109 / 5 : ℝ) ^ (2 * InfinitePlace.nrComplexPlaces k) * Real.exp (-70) ≤ |(discr k : ℝ)| := by
  sorry

/-- The finite places at which `(a,b)_k` ramifies. -/
def finiteRamification {k : Type*} [Field k] [NumberField k] (a b : k) :
    Set (IsDedekindDomain.HeightOneSpectrum (𝓞 k)) :=
  {v | (QuaternionAlgebra.normForm (algebraMap k (v.adicCompletion k) a) 0
      (algebraMap k (v.adicCompletion k) b)).Anisotropic}

theorem covolume_normOneImage {k : Type} [Field k] [NumberField k] [IsTotallyReal k] {a b : k}
    (S : RealSplitting k a b) (hdiv : (QuaternionAlgebra.normForm a 0 b).Anisotropic)
    (O : Subalgebra (𝓞 k) ℍ[k, a, b]) (hO : IsMaximalQuaternionOrder a b O)
    (s : Set UpperHalfPlane) (hs : IsFundamentalDomain (normOneImage S O) s volume) :
    (volume s).toReal = 8 * Real.pi * |(discr k : ℝ)| ^ ((3 : ℝ) / 2) *
      (dedekindZeta k 2).re / (4 * Real.pi ^ 2) ^ Module.finrank ℚ k *
      ∏ᶠ (v) (_ : v ∈ finiteRamification a b), ((Ideal.absNorm v.asIdeal : ℝ) - 1) := by
  sorry
```

  Then state in the docstring which headlines are not statable and what each lacks:
  - Takeuchi's fixed-signature finiteness: the orbifold signature is FuchsianOrbifolds Layer 4 item 5's, not a carrier at the pins.
  - The isospectral covers: there is no Laplace spectrum of compact hyperbolic surfaces at the pins, and no topology on `PGL(2, ℝ)` for the maximality hypothesis (`Matrix.ProjGenLinGroup` is a `def`, so no quotient-topology instance is found).
  - τ(SL₁(B)) = 1: see R01.

  Each new name also needs a README sentence, and the README must keep the same generality.

## R04 (P2) — τ(SL₁(B)) = 1 and adelic Poisson summation are re-planned

- **Location.**
  - README line 146: "It owns the named theorem `tamagawaNumberOne_SL1_quaternion` proving `τ(SL₁(B))=1`".
  - Lines 175–270, step (a), including line 220: "L1 owns this restricted-scalars adelic adapter for `F`, `F²`, and `B`".
- **Claim.** Two earlier roadmaps already own these objects:
  - EndoscopicTransferAndUnitaryTraceComparison §6.2 proves τ(S) = 1 for every simply connected semisimple group over a number field, including inner forms; `SL₁(B)` is one of them.
  - AnalyticNumberTheoryPartII §§5.3g–5.3h owns adelic Schwartz–Bruhat functions, self-dual measures, Fourier inversion and Poisson summation (`adeleRing_selfDual`).

  Both roadmaps come before this one in the merge order.
- **Witness.**
  - The EndoscopicTransferAndUnitaryTraceComparison README (open pull request head), §6.2 "Tamagawa number one for simply connected semisimple groups", has the Check "`τ(SL_n)=1`, including `SL₁=1`" and covers inner forms.
  - `GeometryOfNumbersAndQuadraticArithmetic/README.md:1120` derives τ(SL₁(D)) = 1 from the §5.3h Poisson route.
- **Repair.**
  - Delete step (a) from item 2: lines 175–270, from "Split the proof into four named steps: (a)" through "in L1 rather than importing their conclusions as axioms."
  - Replace it with one sentence: consume EndoscopicTransferAndUnitaryTraceComparison §6.2 for τ(SL₁(B)) = 1 with AdelicAlgebraicGroups AA.2.4's measure, and AnalyticNumberTheoryPartII §§5.3g–5.3h wherever an adelic Fourier statement is still needed.
  - Keep steps (b)–(d), which hold the local volumes, the Iwasawa normalisation and strong approximation.
  - Remove ThetaSeries from the L1.4 dependency entries (line 104 and the L1.4 row at line 1107); only step (a) used it.
  - Remove the ownership sentence at line 146, and delete the Lean declarations as in R01.

## R05 (P2) — Reduced-norm images and quaternion classification are re-planned

- **Location.**
  - Lines 246–258, on the global norm image: "For division `B`, prove the global image `Nrd(Bˣ)=F_{>Ω}ˣ`" and "The cited Hasse–Schilling norm-image statement is a reference, not a replacement for this L1 proof".
  - Lines 739–741, on `global_reduced_norm_localization`.
  - Lines 560–584, which classify quaternion algebras by their ramification sets through ABHN, weak approximation and crossed products.
- **Claim.** Two earlier roadmaps already own these results:
  - ClassicalArithmeticCompletion §7.60, on main, owns "Local and global reduced-norm images": the global image is the elements positive at the ramified real places, and the local images are full at finite places and `ℝ_{>0}` at ramified real places.
  - GL2AutomorphicRepresentationsAndTransfer R17.1.5, earlier in the merge order, owns realizability of a ramification set exactly when it has even cardinality, together with the local–global isomorphism criterion.

  The Lean adapter `global_reduced_norm_localization` (`Suggested.lean:106–113`) exists only for the duplicated route.
- **Witness.**
  - `ClassicalArithmeticCompletion/README.md:15856` on main: "### 7.60 Local and global reduced-norm images", whose Check states that `Nrd` is onto `ℚ^×` for `M₂(ℚ)`.
  - At the GL2AutomorphicRepresentationsAndTransfer head, `Suggested.lean:155` reads "R17.1.5: quaternion ramification is realizable exactly for an even set".
- **Repair.**
  - Delete the QFI 6D / GQF 6.1 isotropy route, both in lines 246–258 and in the Supplier boundary (lines 737–741).
  - Cite ClassicalArithmeticCompletion §7.60 for the local and global norm images.
  - In L1.4, replace lines 560–584 with a citation of GL2AutomorphicRepresentationsAndTransfer R17.1.5 for existence and uniqueness of `(a,b)_k` with a given even ramification set. Keep only the finite-candidate bookkeeping.
  - Delete `global_reduced_norm_localization` from `Suggested.lean` and the README.

## R06 (P2) — A second owner of quaternion orders: QuaternionArithmetic

- **Location.**
  - README lines 772–774: "This layer owns quaternion orders and norm-one groups, arithmetic normalizers, …".
  - Lines 307–321: the order-to-tree adapter, "maximal orders correspond to vertices, adjacent maximal orders intersect in level-one Eichler orders".
  - Lines 585–593: finiteness of maximal-order type classes.
  - Line 161: the ramification parity law.
  - `Suggested.lean:84–91`: `IsQuaternionOrder` and `IsMaximalQuaternionOrder`.
- **Claim.** The open roadmap QuaternionArithmetic owns the same objects for `ℍ[F,a,b]` over a number field `F`:
  - orders, maximal orders, `O¹` and the local structure of maximal orders (§§1.2 and 1.7);
  - "Eichler orders of level `𝔭^e` and vertices at distance `e`", which is the order-to-tree adapter (§1.12);
  - finiteness of class and type sets (§3.5), and the normalizer (§3.6);
  - the even ramification set (§0.3).

  So these objects have two owners.
- **Witness.** QuaternionArithmetic `README.md` at its head: lines 41–44 claim "Lattices and orders in `ℍ[F,a,b]` … maximal orders … the unit group `O^×` and the norm-one group `O¹`", and line 85 claims "The local order-to-tree adapter … belong[s] to §§1.12 and 8.2 here".
- **Repair.** Settle a single owner. Under the current supply direction, that owner is this roadmap.
  - QuaternionArithmetic lists "From TeichmullerGeometry §9.1" among its suppliers (its README line 260). TeichmullerGeometry consumes this roadmap and sits at merge position 285, so QuaternionArithmetic would be placed after this roadmap. Citing it here would therefore be an upward edge.
  - In "Ownership and dependencies", name the objects this roadmap owns: orders and maximal orders of `ℍ[k,a,b]`, `O¹`, local maximal-order structure, the order-to-tree adapter, and finiteness of maximal-order types. Name QuaternionArithmetic §§1.2, 1.7, 1.12, 3.5 and 3.6 as consumers that must cite them; its §9.1 citation of TeichmullerGeometry should point to Layer 1 item 1 here.
  - The alternative is for QuaternionArithmetic to drop its TeichmullerGeometry supplier, so that it precedes this roadmap. Then this README cites QuaternionArithmetic §§0.3, 1.2, 1.7, 1.12, 3.5 and 3.6, and deletes lines 161, 307–321 and 585–593 and the ownership sentence at lines 772–774. Either way, exactly one of the two roadmaps plans these objects.

## R07 (P2) — Discriminant-bound duplication: Odlyzko estimate (4) and strip positivity

- **Location.**
  - Completion criterion item 2 (lines 43–45): "Odlyzko's discriminant estimates (4) and (5) hold for number fields of every signature".
  - L1.3b (lines 389–407 and 439–509).
  - L1.5, lines 634–643: the derivation of the Fourier density of `cosh(ax)/cosh(x/2)` and positivity of the zero terms.
- **Claim.** These duplicate two earlier roadmaps:
  - AnalyticNumberTheoryPartI §2.9a owns Odlyzko's Theorem 1(4), including the harmonic reduction to `x = 1` and the `y ≥ 40` tail. Estimate (4) is not used anywhere in this roadmap: L1.4 uses only estimate (5) (line 541).
  - SmallRamificationAndAbelianVarietyBaseCases §1.6 owns positivity, throughout the strip `0 ≤ Re s ≤ 1`, of `Φ(s) = ∫ f(x)/cosh(x/2)·e^{(s−1/2)x} dx` for every even, continuous, compactly supported, nonnegative positive-definite `f`.

  Both roadmaps are earlier in the merge order.
- **Witness.**
  - AnalyticNumberTheoryPartI README line 1490: "Odlyzko, Theorem 1(4), p.210 gives `log D≥r₁log60.1+2r₂log22.2−254`… The harmonic maximum principle reduces pp.212–215's estimate…".
  - SmallRamificationAndAbelianVarietyBaseCases §1.6, "Positivity throughout the critical strip".
- **Repair.**
  - Delete estimate (4) from completion item 2 and from L1.3b: the row set at lines 440–442, `f₁` at lines 449–451, and the "(4)" halves of lines 463–475 and 497–501. Cite AnalyticNumberTheoryPartI §2.9a for it.
  - In L1.5, replace lines 634–643, from "For `|a|<1/2`, compute the Fourier density" through "nonnegative", with an application of SmallRamificationAndAbelianVarietyBaseCases §1.6 to `f = H(·/b)`.
  - `f = H(·/b)` meets that section's hypotheses: `H = h∗h/3` is positive definite and nonnegative; `H` is continuous, with `H(2) = 0`; and it is compactly supported.

## R08 (P2) — Computational algorithms and certificate procedures in the README

- **Location.**
  - Lines 497–502: "Repeatedly bisect at dyadic midpoints using exact de Casteljau averages. For (4), prove the six leaves at depths at most 5 … evaluating both sides at 84 and 66 distinct rational points".
  - Lines 472–477: "exact rational arithmetic with directed integer grids; its decimal displays are diagnostics".
  - Line 303: "give an effective enumeration of its square classes".
  - Lines 1165–1169: the section "Secondary implementation provenance", which refers to "the source-evidence collection".
- **Claim.** These are executable procedures and certificate formats, which the principles exclude (mathematics, not algorithms). The last section also points to an artefact outside the roadmap.
- **Witness.** The quoted lines specify bisection depth, leaf counts, the number of evaluation points and rounding grids. None of these is a mathematical statement.
- **Repair.** State only the inequalities as targets:
  - `P(z) > 0` for `z ≥ 0`, of degrees 83 and 65;
  - `C_R − log A_R > 0`, `C_C − log A_C > 0` and `C_pole > −70`;
  - `A·e^{−E/n₀} > B` for each row.

  Then delete the bisection and evaluation-point procedure, the grid and rounding wording, "effective enumeration", and the whole "Secondary implementation provenance" section.

## R09 (P2) — The isometry identification is credited to TeichmullerGeometry and also proved here

- **Location.** Lines 88–90: "Its Layer 4.1 owns the group identification of `Isom(ℍ)` with `PGL₂(ℝ)`; Layer 3 here proves only the identification of a lifted isometry with one element of `PGL₂(ℝ)`". The proof is at lines 1064–1068.
- **Claim.** A "lifted isometry" `F` is an arbitrary isometry of `ℍ²`, so lines 1064–1068 prove the same theorem that TeichmullerGeometry is said to own; the object has two owners. TeichmullerGeometry is also later in the merge order (285 against 284), so it cannot be this theorem's owner. The locator is wrong as well: TeichmullerGeometry has no Layer 4.1.
- **Witness.** At the TeichmullerGeometry head, the theorem is `README.md:335` "### 0.4a The isometry group of the hyperbolic plane" (`exists_mulEquiv_isometryEquiv_glAction`). Layer 4 there starts at §4.2.
- **Repair.**
  - Make the identification an owned, named Layer 3 target: every isometry of `ℍ` for the FuchsianOrbifolds L2.1 metric is `z ↦ c·z` for a unique `c ∈ PGL₂(ℝ)`. Its inputs are R4.7's 1-jet uniqueness and FuchsianOrbifolds L0 item 2.
  - Rewrite lines 88–90 to say that TeichmullerGeometry §0.4a consumes this target. Never cite it as a supplier.

## R10 (P3) — Gate style failures

- **Location and witness.** The gate reports:
  - `blob`: 10 commit-pinned links, at lines 75 (×2), 76 (×2), 77 (×2), 93, 95, 97 and 998.
  - `tex`: lines 436–437, `G_{k_i−1}` and `Z_{k_i−1}` (a display that wraps over two lines).
  - `dropped`: line 771, "QuaternionicModularForms §0.3 treats totally definite algebras".
- **Repair.**
  - Replace each link with the roadmap and section name, for example "LFunctions Layer 3" or "InductionRestriction Layer 2.1".
  - Write `G_(k_i−1)` and `Z_(k_i−1)`, and keep the display in one code span.
  - Delete the sentence at lines 771–772.
  - The `sorry-data`, `imports` and `statement-hygiene` failures are repaired by R01 and R02.

## R11 (P3) — Supplier and source locators

- **Location and witness.**
  - Lines 104, 756 and 1106–1108 cite ZerosOfLFunctions "4.8", "the zero-counting estimate". ZerosOfLFunctions Layer 4 ends at §4.6, on main and at both open heads. The `N_K(T) = O(T log T)` count used at line 724 is §§7.4–7.6.
  - Lines 409–410 cite "Layer 3.4's finite-order/growth theorem". Finite order is §3.1, and growth in strips is §§3.4–3.5.
  - Line 567 cites "GlobalNumberFields L1's `weakApproximation_denseRange`". It is native as `TauCeti.GlobalNumberFields.weakApproximation_denseRange` (`TauCeti/NumberTheory/NumberField/Global/Approximation/Weak.lean:208`).
  - Lines 387 and 848–849 "prove"/"apply" Skolem–Noether without a supplier. Tau Ceti has `TauCeti.skolemNoether` (`TauCeti/Algebra/CentralSimple/SkolemNoether.lean:107`).
  - Lines 1062 and 1098 cite "the universal-covers lifting criterion" without a locator. Mathlib has `IsCoveringMap.existsUnique_continuousMap_lifts` (`Mathlib/Topology/Homotopy/Lifting.lean:489`).
  - Line 485: Odlyzko p. 214 reduces his inequality (13), the strip version, and (11) follows from it. The README says (11) is reduced.
  - Lines 1006–1007 cite "the source article's cited 1974 ICM theorem". No source article is identified.
- **Repair.** Repoint each item:
  - ZerosOfLFunctions: "§§7.4–7.6" in place of "4.8", and "§§3.1, 3.4–3.5" in place of "3.4".
  - Cite the Tau Ceti declarations for weak approximation and Skolem–Noether, and the Mathlib declaration for the lifting criterion, with their files, under the supplier contracts.
  - Odlyzko: "(13), p. 214, which implies (11)".
  - Replace the ICM phrase with the full reference (author, title, ICM 1974 proceedings, page), or delete it.

## R12 (P3) — Padding in `Suggested.lean`: the order-32 block

- **Location.** `Suggested.lean:215–327`, which contains:
  - the definitions `p85Scale`, `p85ScaleHom`, `p85AffineGroup`, `p85Unit3`, `p85Unit5`, `p85Unit7`, `p85Element`, `p85H1Elements`, `p85H2Elements`, `p85H₁`, `p85H₂`, `p85ConjugacyCount`, `p85Translation`, `p85Dilation3` and `p85Dilation5`, together with their instances;
  - the computations `p85Element_mul`, `p85_card`, `p85H₁_card`, `p85H₂_card`, `p85H₁_subgroup_card`, `p85H₂_subgroup_card`, `p85AlmostConjugate`, `p85_not_conjugate`, `p85_normalForm`, `p85_generates` and `p85H₁_almostConjugate_p85H₂`.
- **Claim.** These are proved computations of small values that mirror the L3.2 Checks: `decide`, `rfl`, or a membership argument. Most of them have no docstring.
- **Witness.** All of them are closed in the file by `decide +kernel` or `rfl`. My independent count reproduces the README's L3.2 values (see the table), so they add no test.
- **Repair.**
  - Delete lines 215–327 from `Suggested.lean`. The README keeps the order-32 facts as L3.2 statements and Checks.
  - Rewrite README lines 1027–1029 without backticked Lean names, for example "prove the order, the intersection counts, nonconjugacy and generation", so that the gate's README-name check still passes.

## R13 (P3) — README shape, missing Checks, and process residue

- **Location.** The whole README.
  - It has no `**Summary.**` paragraph.
  - Its headings are "Scope and completion criterion", "Ownership and dependencies" and "Pinned conventions", with no "Exact supplier contracts" or "How to read the build".
  - Each layer is a numbered paragraph. There are no `### k.n` subsections, no `*Needs:*` lines, and no `### Examples` or `### Dependencies` sections.
  - There is no `## Downstream consumers` section.
  - No definition has a `**Checks.**` list.
  - Process wording remains, for example line 152 ("not claims that a supplier has already proved …"), line 174 ("cannot be silently assembled"), lines 257–258, line 262 ("do not identify the two Tamagawa measures by notation alone") and the "Acceptance checks" section.
- **Claim.** The README does not follow the house shape, and the definitions `squaredTraceField`, `traceEnvelope`, `IsNonelementary`, `IsQuaternionOrder`, `IsMaximalQuaternionOrder`, `RealSplitting`, `normOneImage` and `IsArithmetic` have no discriminating Checks.
- **Witness.** Compare `ReductiveGroupsPartII/README.md` or `ZerosOfLFunctions/README.md` on main: each has the sections above, and every section ends with Checks and `*Needs:*` lines.
- **Repair.** Restructure into the house shape, with one `### k.n` subsection per target, a `*Needs:*` line and three Checks per definition. These Checks were all computed in this review:
  - `RealSplitting` over `ℚ(√2)` with `(a,b) = (−1,√2)` exists for `√2 ↦ 1.414` and fails for `√2 ↦ −1.414`.
  - `IsArithmetic` holds for `PSL₂(ℤ)` and fails for the trivial group. It also fails for the Hecke group `G₅`: `tr(ST)² = φ² ∉ ℚ` and the group has a cusp.
  - `squaredTraceField` is not a finite-index invariant for the elementary group `⟨diag(λ,λ⁻¹)⟩` with `t = λ²+λ⁻²` transcendental: the field is `ℚ(t)` for the group and `ℚ(t²)` for its square.
  - The covolume formula gives `π/3` for `M₂(ℤ)`, and `π/21` for the Hurwitz order over `ℚ(cos 2π/7)` (`d = 49`, `ζ_k(−1) = −1/21`).

  Delete the process sentences and the "Acceptance checks" section.

## Verified sound

**Gate and dependency check.**
- The gate, re-run on this head, reports `FAIL` with `set_option=0 blob=10 tex=2 sorry-data=1 imports=1 statement-hygiene=1 dropped=1`. Every other check is 0. R01, R02 and R10 cover these failures.
- The dependency check reports `depcheck: 239 roadmaps, 2354 edges, 0 problem(s)`, with no UPWARD or CYCLE line. This roadmap sits at line 284 of the merge order, after all its cited suppliers: LFunctions (27), ZerosOfLFunctions (48), FuchsianOrbifolds (49), AdelicAlgebraicGroups (52), NoncompactQuantumSymmetry (155) and PseudodifferentialOperators (13). The remaining suppliers are on main.
- The pull request changes nothing outside its folder relative to its base branch.

**Elaboration.**
- `lake env lean` on `Suggested.lean` gives `sorry` warnings only, at lines 59, 67, 95, 108, 148, 191, 196 and 207.
- One scratch file ran `#check @` on 29 declarations: every theorem and every definition a theorem mentions. Compared with the README:
  - `invariant_squared_trace_data_finite_index` and `invariant_squared_trace_data_commensurable` keep `Group.FG Γ` and `IsNonelementary Γ`, as the README says.
  - `integral_trace_lattice_order` keeps `[NumberField K]`, `a ≠ 0` and `b ≠ 0`.
  - No `def` lost a section variable.
  - The only mismatches are the sorry'd data in R01 and R02.
- The one-tactic probe tried `rfl`, `simp`, `infer_instance`, `decide` and `aesop` on all seven sorried theorems in a copy of the file. None closed: `simp` timed out on line 59, and the other six kept their `sorry` warnings.
- The repaired statements in R02 and R03 elaborated in a scratch file that imports only `Mathlib` and `TauCeti.Algebra.Quaternion.NormForm`, with `sorry` warnings only.

**Library declarations opened at the pins (file:line).**
- Mathlib:
  - `UpperHalfPlane` `MulAction PGL(2, ℝ)`: `MoebiusAction.lean:267`; `FaithfulSMul`: `FixedPoints.lean:208`; hyperbolic `volume`: `Measure.lean:44`.
  - `Matrix.ProjectiveSpecialLinearGroup.toPGL`: `GeneralLinearGroup/Projective.lean:113`, injective at line 121. `PGL(2, ℝ)` has no `TopologicalSpace` instance; `PSL(2, ℝ)` has `TopologicalSpace` and `IsTopologicalGroup`.
  - `Subgroup.Commensurable`: `GroupTheory/Commensurable.lean:57`; `commensurator`: line 141.
  - `Group.IsSolvable`: `GroupTheory/Solvable.lean:145`.
  - `NumberField.finite_of_discr_bdd`: `Discriminant/Basic.lean:496`.
  - `NumberField.dedekindZeta`: `DedekindZeta.lean:50`.
  - `jacobson_density` and `Module.Finite.toModuleEnd_moduleEnd_surjective`: `SimpleModule/Basic.lean:561, 573`.
  - `MeasureTheory.Integrable.fourierInv_fourier_eq` and `Continuous.fourierInv_fourier_eq`: `Fourier/Inversion.lean:166, 175`.
  - `IsCoveringMap.existsUnique_continuousMap_lifts`: `Homotopy/Lifting.lean:489`.
- Tau Ceti:
  - `QuaternionAlgebra.normForm`: `Algebra/Quaternion/NormForm.lean:78`.
  - `TauCeti.QuaternionAlgebra.baseChangeTwoParams`: `BaseChange.lean:155`.
  - `Subgroup.AlmostConjugate`: `GroupTheory/AlmostConjugate.lean:92`. It is defined by intersection counts with conjugacy classes, as the README says.
  - `TauCeti.dedekindZeta_eulerProduct_hasProd`: `ArithmeticDirichletSeries/EulerProduct/Analytic.lean:498`, valid for `Re s > 1` as cited.
  - `TauCeti.skolemNoether`: line 107.
  - `TauCeti.GlobalNumberFields.weakApproximation_denseRange`: line 208.
  - There is no native `PSL(2, ℝ)` action on `ℍ` in Tau Ceti.

**Cross-roadmap citations resolved (45).**
- FuchsianOrbifolds, at the head of its open revision (this pull request's base, named in the description):
  - L0 items 1–3, L2 items 1 (L2.1), 4 and 5, L4 item 5, and L5 items 4 and 5.
  - L4a with `π/21` and `minimum_area_finite_area_orbifold`. L4a exists only at that head.
- On main:
  - ReductiveGroupsPartII RG2.2.1, RG2.2.2 and RG2.2.4, with `Building.exists_fixedPoint_of_bounded`, `BTTree`, `type_smul` and `sl2_preserves_type` as README prose targets.
  - QuadraticFormInvariants: Layer 0 representation criterion, 6D and 7B (`cocycleOfSplitting`).
  - GlobalQuadraticForms 0.1, 0.2 and 6.1; ClassFieldTheory Layer 10 (`inv_restrict`, `invMap_brRes`); SemisimpleAlgebras Layers 3, 4 and 6.
  - LFunctions Layer 3; ZerosOfLFunctions 1.4, 5, 5.6 and 8.4. The 8.4 test class is `ContDiff ℝ ∞` with compact support in `Ioi 0`, as cited.
  - ThetaSeries 1C, 1D, 2A and 2C; LieGroups (closed-subgroup theorem); RiemannianGeometry R4 item 7 (quotient metric and 1-jet uniqueness).
  - InductionRestriction Layer 2.1; PseudodifferentialOperators P7a (Layer 8); GlobalNumberFields `weakApproximation_denseRange`.
- At open heads:
  - AdelicAlgebraicGroups AA.2.4, AA.3.4 (`Reduction.finite_classes`) and AA.4.2.
  - NoncompactQuantumSymmetry M1 (quotient-`L²` adapter, README lines 1556–1564).
  - TeichmullerGeometry consumes Layer 1 items 1 and 4 (its README lines 27, 102, 859–879), which agrees with this README.
- The tool leads `LocalFieldsRamification, RG2.2.1` and `SemisimpleAlgebras, RG2.2.1` are table-row lists, not citations. `InductionRestriction IR2.1` resolves to Layer 2.1.

**Sources (seeded sample).**
- Odlyzko 1977 (`odlyzko1977`, J-STAGE open archive): Theorem 1 with (4) and (5) is on p. 210 (`odlyzko1977` lines 39–44). The Stark identity (8) is on p. 212 (lines 90–92), and (10)–(12) on p. 213 (lines 108–118). The harmonic reduction to `x = 1, y ≥ 0` is on p. 214 (lines 129–142), and the `y ≥ 40` and "several hundred subintervals" remarks are on pp. 214–215 (lines 144–159). The tables for (4) and (5) are on p. 215 (line 174) and the table for (6) on p. 216 (line 177). All agree with README lines 781–785, apart from R11's point about (13).
- Belolipetsky–Gelander–Lubotzky–Shalev (`bgls2010`, arXiv:0811.2482v2): §2 bounds generators by covolume, §3 counts maximal arithmetic subgroups with Borel's formula, §4 counts subgroups of Fuchsian groups, and §5 proves the main results (lines 134, 278, 499 and 758). This supports its use as a counting reference for L1.4.

**Adversarial table** (rows give the values computed on each side).

| Statement | Instances | Values | Result | Change |
|---|---|---|---|---|
| `invariant_squared_trace_data_finite_index` | `Γ=⟨diag(λ,λ⁻¹)⟩` with `t=λ²+λ⁻²` transcendental, `Δ=⟨γ²⟩` (elementary) | `K₀(Γ)=ℚ(t)`, `K₀(Δ)=ℚ(t²−2)=ℚ(t²)≠ℚ(t)` | `IsNonelementary` is needed and present | negative Check (R13) |
| same | `Γ=PSL₂(ℤ)`, `Δ=Γ(2)` image | `K₀=ℚ` and `A=M₂(ℚ)` on both sides | holds | none |
| `invariant_squared_trace_data_commensurable` (direction) | `Γ=PSL₂(ℤ)`, `c=diag(2^{1/6},2^{−1/6})`, `Δ=c⁻¹Γc` | `A_Δ` has entries scaled by `2^{∓1/3}`; `c·A_Δ·c⁻¹=M₂(ℚ)=A_Γ`; the reversed conjugation gives `2^{∓2/3}` entries, which is not `M₂(ℚ)` | the Lean direction is correct | none |
| `IsQuaternionOrder` | `M₂(ℤ)`, `ℤ·1`, `ℤ[1/2]·M₂(ℤ)` in `ℍ[ℚ,1,1]` | order; span `ℚ ≠ ⊤`; not finitely generated | discriminates | none |
| `IsMaximalQuaternionOrder` | `M₂(ℤ)`; Eichler order of level 2 | maximal; strictly inside `M₂(ℤ)` | discriminates | none |
| `RealSplitting.ramified` | `ℚ(√2)`, `(a,b)=(−1,√2)` | with place `√2↦1.414`: `σ₂a=−1<0`, `σ₂b=−1.414<0`; with place `√2↦−1.414`: `σ₁b=1.414>0` fails | real Hilbert-symbol criterion is correct | none |
| `IsArithmetic` | `PSL₂(ℤ)`; `⊥`; Hecke `G₅` | yes, with `k=ℚ`, `(1,1)`; no, since `Γ(O)` is infinite so `⊥` has infinite index in it; no, since `tr(ST)²=φ+1∉ℚ` and `G₅` has a cusp | correct | none |
| `integral_trace_lattice_order` | `H=SL₂(ℤ)` in `M₂(ℚ)`; `H={1}` | the ℤ-span of `I`, `I+E₁₂`, `I+E₂₁`, `[[2,1],[1,1]]` is `M₂(ℤ)`, which is maximal; for `H={1}` the span is `ℚ`, so the hypothesis fails | holds | none |
| `squared_trace_integrality_of_commensurable_arithmetic_group` | `PSL₂(ℤ)`; any group containing `diag(2,1/2)` | traces lie in ℤ; `tr = 5/2` is not integral, so that group is not arithmetic | consistent | none |
| `global_reduced_norm_localization` | `L=ℝ`, `a=b=−1` | both sides equal `x₀²+x₁²+x₂²+x₃²` | holds | delete (R05) |
| `tamagawaNumberOne_SL1_quaternion` | any | the measure is `sorry`, so no value can be computed | vacuous | R01 |
| `dense_commensurator_squared_trace_field_is_number_field` | `PSL₂(ℤ)`; (2,3,7) | `K₀=ℚ`; `K₀=ℚ(cos 2π/7)`, of degree 3 | true, but stated through a sorry'd action | R02 |
| Headline: arithmetic iff dense commensurator | `PSL₂(ℤ)`; `G₅` | dense (contains the image of `PSL₂(ℚ)`); `G₅` has finite index in a discrete commensurator | true, but absent from the Lean file | R03 |
| Headline: covolume formula | `M₂(ℤ)` over `ℚ`; Hurwitz order over `ℚ(cos 2π/7)` | `8π·(π²/6)/(4π²)=π/3`; with `d=49` and `ζ_k(2)=8π⁶/(21·343)`, `8π·343·ζ_k(2)/(4π²)³=π/21`, the area of (2,3,7) | correct, but absent | R03 |
| Headline: `\|d_k\| ≥ a₀R₀ⁿ` | minimal totally real fields of degree 2, 5, 8, 9 | 5 ≥ 0.2065; 14641 ≥ 5089; 282300416 ≥ 1.254·10⁸; 9685993193 ≥ 3.649·10⁹ | holds | R03 |
| L1.5 rows `A·e^{−E/n₀} > B` | all 31 rows | at `n₀=36`, 29.5831 > 29.582; smallest slack 0.0002 at `n₀=32` (28.0082 > 28.008); `E ≥ 8b/3` in every row | all true | none |
| L1.5 degree ratios `B_nⁿ/(a₀R₀ⁿ)` | `n = 1, …, 35` | minimum at `n=9`: 1.2036914 > 1.20369; the ratio is 1.2408 at `n=8` and at `n=10` | true | none |
| L1.3b constants | (4) and (5) | (4): `C_R−log 60.1 = 0.0008677 > 0.0008528`, `C_C−log 22.2 = 0.0011179 > 0.0011129`, `C_pole = −253.3465438978`; (5): 0.0008655 > 0.0008515, 0.0036206 > 0.0036156, `C_pole = −69.5895030168` | true | none |
| L1.3b `f₁`, `f₂` coefficients equal `2a_i` | all 21 rows | `1.015 = 2·0.5075`, …, `1.516 = 2·0.758` | consistent | none |
| L1.4 chain | signature (0;2,3,7) | `A=π/21`, `r₀=3`, `C_sig=8π/21`; `Δ ≤ ((4π²)³/21)^{2/3} = 204.6 ≥ 49`; `d = 3 ≤ 1/21 + 4`; `58.6^{3/2}/(4π²) = 11.36 > 10`; `3⁷⁰ ≈ 10^{33.4} < 10^{34}` | consistent | none |
| L1.4 count of index-`m` subgroups | `d` generators | `m·(m!)^d ≥ (m!)^d/(m−1)!` | a valid upper bound | none |
| L1.2 local factors | split and division finite places; real places | `vol SL₂(𝒪_v) = 1−q⁻²`; division `q⁻¹(1−q⁻²)/(1−q⁻¹) = (1−q⁻²)/(q−1)`; `vol SL₁(ℍ) = 4·(2π²)/2 = 4π²` | consistent with the formula | delete with R04 |
| L3.2, the group of order 32 | all 32 elements | 11 classes of sizes 1,4,2,1,4,4,2,4,2,4,4; both intersection vectors 1,0,0,0,1,0,1,0,0,1,0; coset character 8,0,0,0,2,0,4,0,0,2,0; trivial cores; no conjugating element | all README values correct | R12 (padding only) |
| L3 conjugation formula and genus | `(u,a)(v,b)(u,a)⁻¹`; `g = 3` | `(v, ub+(1−v)a)`; `2h−2 = 8·4`, so `h = 17 = 8·3−7` | correct | none |
| `IsNonelementary` | `⊥`; `PSL₂(ℤ)`; `⟨z↦2z, z↦−1/z⟩` | solvable, so not; contains `F₂`, so yes; virtually abelian with orbit `{0,∞}`, so not | matches the finite-orbit definition | none |

**Ownership against open pull requests.** Checked by object with `roadmaps grep` over every open head and main, for: arithmetic Fuchsian, Odlyzko, commensurator, Tamagawa number one, trace field, and quaternion and maximal orders. The checks found:
- R04: EndoscopicTransferAndUnitaryTraceComparison §6.2 and AnalyticNumberTheoryPartII §§5.3g–5.3h.
- R05: ClassicalArithmeticCompletion §7.60 and GL2AutomorphicRepresentationsAndTransfer R17.1.5.
- R06: QuaternionArithmetic.
- R07: AnalyticNumberTheoryPartI §2.9a and SmallRamificationAndAbelianVarietyBaseCases §1.6.
- R09: TeichmullerGeometry §0.4a.

Three other open roadmaps were read and do not overlap:
- KleinianGroups: commensurability in `PSL₂(ℂ)` only.
- FuchsianOrbifoldsPartII: Nielsen cores.
- HilbertModularVarietiesAndShimuraCurves: algebraic and `p`-adic Shimura curves.

No other open pull request changes this folder, and none drops an id it cites.

## Not verifiable

- **Takeuchi**, "Arithmetic Fuchsian groups with signature (1;e)", J. Math. Soc. Japan 35 (1983), Theorem 2.1. Project Euclid returned a bot-block page, the J-STAGE path returned 404, and the DOI landing page has no PDF link.
- **Maclachlan–Reid**, GTM 219: §11.3.1, Theorems 11.2.1 and 11.3.1, and p. 346. Springer, paywalled.
- **Vignéras**, LNM 800. Springer, paywalled.
- **Margulis**, *Discrete Subgroups of Semisimple Lie Groups*, Chapter IX. Springer, paywalled.
- **"the source article's cited 1974 ICM theorem"**: no source is identified (R11).
- **Odlyzko 1977, the numerical constants of (4)–(5) and the table entries on p. 215.** The extracted text keeps the labels but not the formulas, which are images, and no page renderer is available. The constants agree with AnalyticNumberTheoryPartI's independent citation of (4).
- **Outside the sample, not checked:** the Voight Chapter 29 locators (Main Theorem 29.10.1(c), Lemma 29.11.1, Theorem 29.11.3, (29.11.4)–(29.11.8), Lemma 29.8.24(b), p. 536), the Bader–Furman locators, and Odlyzko's unpublished Tables 2 and 4. Most of L1.2(a), where the Voight locators sit, is deleted by R04.

## Source issues

- none
