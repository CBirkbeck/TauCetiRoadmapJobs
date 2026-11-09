# Review of ArithmeticFuchsianGroups (pull request #2026 at b98ed29)

**Verdict:** needs changes

The gate passes on this head and the dependency check reports no problem. All seven findings of the previous review are repaired (table below). This full review finds five P3 defects and nothing blocking:

- a covolume formula claimed for every order;
- a local-volume normalisation stated at the wrong step;
- a pinned theorem applied outside its hypotheses;
- definitions with too few Checks;
- two Lean section titles that differ from the README.

## The previous review, finding by finding

| Previous | Status at b98ed29 | Evidence (this head) |
|---|---|---|
| R01 standard presentation unowned | repaired | §1.4, README lines 716–736, states it as a named target: "the homomorphism to `Γ` from the quotient of FreeGroupsAndLimitGroups §6.1's `S⁺(g, r + c)` by the normal closure of the `p_j^(m_j)` … is an isomorphism". Its route is the Dirichlet polygon, truncated to a one-face surface model of §6.0a, then §6.1a. It is cited at line 752 (generators), line 1265 (§3.4) and the *Needs:* lines 834–836 and 1288. |
| R02 envelope theorem statable but absent | repaired | `Suggested.lean:167–172` `traceEnvelope_isCentral_isSimpleRing_finrank_eq_four`; README line 588. |
| R03 PGL passage and maximality statable | repaired | `Suggested.lean:247–268` (`instTopologicalSpacePGL`, `commensurator_pgl_discrete_of_not_isArithmetic`, `commensurator_pgl_eq_of_maximal`); README §§2.3–2.4 and Conventions lines 121–125. |
| R04 isometry lifting owned twice | repaired here | §3.1, README lines 1162–1188: "Prove that for every isometry `f : ℍ/Γ₁ → ℍ/Γ₂` there is `c ∈ PGL₂(ℝ)` …". It is cited in §§3.3–3.4 (lines 1251, 1278–1279) and in Downstream consumers (lines 1328–1331). TeichmullerGeometry has not yet switched to citing it (see the ownership notes). |
| R05 pinned quotient metric cited to RiemannianGeometry | repaired | The Tau Ceti declarations are listed at README lines 237–255 and used at lines 1167–1170, 1219–1222 and 1272–1273. RiemannianGeometry is no longer cited. |
| R06 build-order slips | repaired | Line 357: "The envelope and invariance targets of §1.3 … proceed in parallel with §§1.1–1.2; its trace-integrality and `Γ(O)` statements need §1.1". The index-two inclusion is now §1.4's own (lines 708–714). Line 654: "ZerosOfLFunctions §1.4's digamma formulas". |
| R07 "sharp" and dangling locators | repaired | No "sharp" in either file. Line 10 reads "an explicit totally real bound". Maclachlan–Reid is cited only as Theorems 11.2.1 (lines 641, 843) and 11.3.1 (line 743). |

## R01 (P3) — The Summary gives the maximal-order covolume formula for every order

- **Location.** `TauCetiRoadmap/ArithmeticFuchsianGroups/README.md` lines 4–7: "From an order `O` … it builds the lattice `Γ(O)`, proves that it is discrete of finite covolume, cocompact exactly in the division case, and computes its covolume `8π|d_k|^(3/2)ζ_k(2)(4π²)^(−n)∏(N𝔭−1)`".
- **Claim.**
  - The formula holds only for maximal orders. §1.2 (line 495) and `covolume_normOneImage` (`Suggested.lean:112`, `IsMaximalOrder k O`) assume a maximal order.
  - For a smaller order `O′ ⊆ O`, the covolume is `[Γ(O) : Γ(O′)]` times the formula (line 537).
- **Witness.** README line 564: the level-2 Eichler order of `M₂(ℤ)` gives `Γ₀(2)`, of area `π`. The formula, at `k = ℚ` with `Ram_f = ∅`, gives `8π·(π²/6)/(4π²) = π/3`.
- **Repair.** Write "…cocompact exactly in the division case, and, for a maximal order `O`, computes its covolume `8π|d_k|^(3/2)…`".
  - *Tested.* The Eichler order is now excluded, and `M₂(ℤ)` still gives `π/3`.

## R02 (P3) — §1.2(c): `1 − q⁻²` is the split-place norm-one volume, not the unit fraction

- **Location.** README lines 511–514: "in the gauge `vol(𝒪_v) = 1` the maximal-order unit fraction is `1 − q⁻²` at a split place, and at a division place the maximal order has volume `q⁻¹`, so its norm-one volume is `(1 − q⁻²)/(q − 1)` after dividing by the reduced-norm image `𝒪_v^×` of volume `1 − q⁻¹`".
- **Claim.**
  - At a split place, the unit fraction of `M₂(𝒪_v)` is `|GL₂(𝔽_q)|/q⁴ = (1 − q⁻¹)(1 − q⁻²)`.
  - The value `1 − q⁻²` is the norm-one volume `|SL₂(𝔽_q)|/q³`. That is what remains after the division by `vol(𝒪_v^×)`, which the sentence applies only at division places.
  - Read as written, an implementer who divides at split places too gets `1 + q⁻¹`. The product of these over the split primes diverges, instead of giving `ζ_k(2)⁻¹`.
  - The final product, and with it the covolume formula, is correct. Only this step's normalisation is misstated.
- **Witness.** At `q = 2`:
  - `|GL₂(𝔽₂)|/2⁴ = 6/16 = 3/8`;
  - `|SL₂(𝔽₂)|/2³ = 6/8 = 3/4 = 1 − 2⁻²`;
  - `(3/4)/(1/2) = 3/2 = 1 + 2⁻¹`.
- **Repair.** Write: "(c) … at a split place `M₂(𝒪_v)` has volume `1` and unit fraction `(1 − q⁻¹)(1 − q⁻²)`. At a division place the maximal order has volume `q⁻¹` and unit fraction `1 − q⁻²`. Dividing by the volume `1 − q⁻¹` of the reduced-norm image `𝒪_v^×` gives the norm-one volumes `1 − q⁻²` and `(1 − q⁻²)/(q − 1)`".
  - *Tested at `q = 2`.* The split place gives `(3/8)/(1/2) = 3/4`, and the division place gives `(1/2)(3/4)/(1/2) = 3/4 = (1 − 1/4)/(2 − 1)`.
  - The product is still `ζ_k(2)⁻¹∏_(Ram_f)(N𝔭 − 1)⁻¹`, and `M₂(ℤ)` still gives `π/3`.

## R03 (P3) — `TauCeti.skolemNoether` does not apply over `k` to two splittings `B → M₂(ℝ)`

- **Location.**
  - README lines 383–384: "Two real splittings with the same place differ by conjugation by an element of `GL₂(ℝ)` (`TauCeti.skolemNoether`)".
  - Line 617: "Real splittings are compared in `PGL₂(ℝ)` by `TauCeti.skolemNoether`".
  - The *Needs:* lines 469 and 641.
- **Claim.** A splitting is a `k`-algebra map into `M₂(ℝ)`. `M₂(ℝ)` is infinite-dimensional over the number field `k`, and the pinned theorem requires its target to be finite-dimensional over the base field. So, as cited, it cannot be invoked.
- **Witness.** Tau Ceti `Algebra/CentralSimple/SkolemNoether.lean:107`: `skolemNoether [IsSimpleRing A] [FiniteDimensional K A] [Algebra.IsCentral K B] [IsSimpleRing B] (f g : B →ₐ[K] A)`. With `K = ℚ` and `A = M₂(ℝ)`, `FiniteDimensional ℚ M₂(ℝ)` is false.
- **Repair.** Write: "…differ by conjugation by an element of `GL₂(ℝ)`. Both induce `ℝ`-algebra maps `ℍ[k,a,b] ⊗_(k,place) ℝ ≃ M₂(ℝ) → M₂(ℝ)`, and `TauCeti.skolemNoether` applies to them over `ℝ`." Change line 617 the same way.
  - *Tested on `k = ℚ`, `B = M₂(ℚ)`, `S₂ = Ad(diag(√2, 1)) ∘ S₁`.* Over `ℝ` the induced maps are the identity and `Ad(diag(√2, 1))` of `M₂(ℝ)`. That is four-dimensional and central simple over `ℝ`, and the theorem returns `u = diag(√2, 1)`.
  - The uses over `K₀` in §2.2 (line 1013, target `A_Γ`, four-dimensional over `K₀`) are correct as written.

## R04 (P3) — `liftSL`, `squareSubgroup`, `N_B⁺(O)` and `ν` have fewer than three Checks

- **Location.**
  - §1.3 Checks, README lines 622–623, is the only Check naming `liftSL` ("`liftSL` of the trivial group is the centre `{±I}`") and one of the two naming `squareSubgroup`.
  - §1.2 Checks, lines 554–560, are the only two naming `N_B⁺(O)` and `ν` (`M₂(ℤ)` and discriminant 6).
- **Claim.**
  - `liftSL` has one Check, `squareSubgroup` two, and `N_B⁺(O)` and `ν` two each. Every definition needs three discriminating Checks.
  - The plausible wrong models are untested. One lift chosen per element is not a subgroup. The set of squares is not the subgroup they generate.
- **Witness.** In `PSL₂(ℝ)`, `S = [[0,−1],[1,0]]` has `S² = −I`, so `{I, S}` is not closed under multiplication. In the free group on `a, b`, `a²b²` is cyclically reduced and is not `w²` for any `w`.
- **Repair.** Add these Checks:
  - `liftSL ⟨[S]⟩ = {±I, ±S}`, cyclic of order four. One lift per element, `{I, S}`, is not a subgroup. For the image of `Γ₁(4)`, `liftSL` is `±Γ₁(4)`, of index two over `Γ₁(4)` because `−I ∉ Γ₁(4)`.
  - For `Γ̄(2)`, free on `z ↦ z + 2` and `z ↦ z/(2z + 1)`, the subgroup `Γ^(2)` has index four (`Γ/Γ^(2) ≃ (ℤ/2)²`). The set of squares is not a subgroup, because `a²b²` is not a square.
  - For the Hurwitz order over `ℚ(cos 2π/7)`, `N_B⁺(O) = Γ(O)` and `im ν` is trivial. `N_B⁺(O)` is a discrete overgroup of the `(2,3,7)` group (§1.2), and that group is maximal among discrete subgroups of `PSL₂(ℝ)` (line 1120).

## R05 (P3) — Two section titles in `Suggested.lean` differ from the README's layer titles

- **Location.**
  - `TauCetiRoadmap/ArithmeticFuchsianGroups/Suggested.lean:222`: `/-! ## Layer 2: the arithmetic commensurator criterion -/`.
  - `Suggested.lean:270`: `/-! ## Layer 3: isometries of the hyperbolic plane and the order-32 Gassmann covers -/`.
  - The README headings at lines 944 and 1136 are "Layer 2: the arithmetic commensurator criterion and the PGL passage" and "Layer 3: the order-32 Gassmann covers".
- **Claim.** Each Lean section comment must carry its README layer title.
- **Repair.** Copy the two README titles into `Suggested.lean:222` and `:270`. The README's anchors are unchanged, and no roadmap cites Layer 2 or Layer 3 by title (`roadmaps grep`, no match).

## Verified sound

**Gate, dependencies and scope.**
- The gate, re-run on this head, reports every check at 0, then `OK`.
- The dependency check output is `depcheck: 238 roadmaps, 2321 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- The roadmap is line 284 of the merge order. Its suppliers are earlier or on main:
  - earlier: FuchsianOrbifolds (49), AnalyticNumberTheoryPartI (50), AnalyticNumberTheoryPartII (51), AdelicAlgebraicGroups (52), GeometryOfNumbersAndQuadraticArithmetic (55), GL2AutomorphicRepresentationsAndTransfer (100), SmallRamificationAndAbelianVarietyBaseCases (119), EndoscopicTransferAndUnitaryTraceComparison (148) and NoncompactQuantumSymmetry (155);
  - on main: FreeGroupsAndLimitGroups, ClassicalArithmeticCompletion, LFunctions, ZerosOfLFunctions, ReductiveGroupsPartII, RepresentationTheory and PseudodifferentialOperators.
- `git diff --stat` against the base, outside the folder, is empty.

**Elaboration, signatures and padding.**
- `lake env lean` on `Suggested.lean` gives 17 warnings, all `declaration uses sorry`, one per theorem, at lines 84, 92, 110, 147, 155, 167, 177, 191, 200, 210, 218, 226, 232, 240, 252, 262 and 276.
- A scratch file `#check @`'d all 28 declarations, the four `RealSplitting` fields and about 66 library names. It elaborated with no error. Each elaborated type matches its README statement:
  - `[NumberField k] [IsTotallyReal k]` on the Layer 1 theorems;
  - `IsMaximalOrder k O` on the covolume formula;
  - `Group.FG Γ` and `IsNonelementary Γ` on the three envelope theorems;
  - `a ≠ 0` and `b ≠ 0` on `integral_trace_lattice_order`;
  - `Γ.IsCofinite` on the Layer 2 theorems;
  - `Maximal (fun Λ ↦ DiscreteTopology Λ)` on `commensurator_pgl_eq_of_maximal`.

  No `def` lost a binder, and I changed nothing.
- The one-tactic probe ran `first | rfl | (simp; done) | infer_instance | decide | (norm_num; done) | (aesop; done) | (positivity; done)` on a copy. It closed none of the 17 theorems: line 151 hit the heartbeat limit in `simp`, and the other 16 failed.
- No declaration restates a definition, mirrors a Check or treats a boundary case.
- The module docstring names the one unstatable headline (the Laplace spectrum). Tau Ceti has no spectrum of a compact manifold: `TauCeti.Manifold.laplaceBeltrami` is pointwise. The genus of the compactified quotient needs a `FiniteCWType` instance that the pin lacks (`TauCeti.eulerChar`, `AlgebraicTopology/Cellular/EulerCharacteristic/FiniteCWType.lean:123`). So reading Takeuchi's form as the case `C = A` is right.

**Library declarations opened at the pins (file:line).**
- Mathlib:
  - `Projective.lean:41` (`ProjGenLinGroup` is a `def`), `:113` (`toPGL`), `:120` (`toPGL_injective`) and `:140` (`toPGL_surj_iff`: onto iff every unit is a `card n`-th power, a square here);
  - `ProjectiveSpecialLinearGroup.lean:36` (`PSL` is an `abbrev`, hence its quotient topology);
  - `Topology/Algebra/Group/Quotient.lean:30, 149`;
  - `Topology/Covering/Quotient.lean:286` (free, properly discontinuous, locally compact, Hausdorff);
  - `UpperHalfPlane/Metric.lean:68` (`cosh_dist`);
  - `MoebiusAction.lean:90–92, 140, 267` (it conjugates when `det < 0`, giving `(a z̄ + b)/(c z̄ + d)`);
  - `FixedPoints.lean:208` (`FaithfulSMul PGL(2, ℝ) ℍ`).
- Tau Ceti:
  - `Fuchsian/Covolume.lean:117` (`IsCofinite`, fields `discreteTopology` and `covolume_ne_top`);
  - `IntegralOrder/Basic.lean:75` (`IsOrder` is `Submodule.IsLattice F`) and `Maximal.lean:74, 80`. Neither file has "every order lies in a maximal order", so §1.1 owns it;
  - `CentralSimple/SkolemNoether.lean:107` (R03);
  - `Topology/Algebra/Group/Subgroup.lean:164` (`isClosed_center`, an instance for separately continuous multiplication and T2);
  - `Manifold/Instances/Quotient.lean:242, 253`;
  - `Riemannian/Pullback/Descent.lean:189, 258` (`quotient` takes the invariance identity as an explicit argument);
  - `Riemannian/Isometry/Basic.lean:44` and `Distance.lean:58`;
  - `UpperHalfPlane/PoincareMetric.lean:127`;
  - `Fuchsian/CoarseQuotient.lean:130`;
  - `Riemannian/Hyperbolic.lean:51`;
  - `EulerProduct/Analytic.lean:498`;
  - `Quaternion/SplittingCriterion.lean:208` and `NormForm.lean:158`;
  - `Fuchsian/Arithmetic.lean`, which covers finite-index subgroups of `SL(2, ℤ)` only;
  - `HeckeRing/GLn/Basic.lean` (`posDetInt_le_commensurator`, the `SL_n(ℤ)` case only).
- No topology on `PGL(2, ℝ)`, Odlyzko bound or trace field exists at either pin, so `instTopologicalSpacePGL` duplicates nothing.

**Cross-roadmap citations resolved (62).**
- FuchsianOrbifolds at #1168's head f997c5f0:
  - Layer 0 items 1–3 (lines 289, 310, 340);
  - Layer 2 items 1 (L2.1, line 398), 3, 4 and 5 (side-pairing presentation only);
  - Layer 4 item 5;
  - Layer 4a item 2, `minimum_area_finite_area_orbifold` (line 783);
  - Layer 5 items 5, 6 and 7, with `covolume_eq_two_pi_mul_signature` (lines 705–716).
- FreeGroupsAndLimitGroups on main: §6.0a (1384), §6.0b (1403), §6.0c (1419), §6.1 `SurfaceGroup.orientable` (1463, commutator `x⁻¹y⁻¹xy`) and §6.1a `SurfaceGroup.modelEquiv` (1494).
- AdelicAlgebraicGroups:
  - §2.4 (2011);
  - §3.4 (3113), with `Reduction.finite_classes` (3169: finiteness of `G(F)\G(𝔸_f)/U` for every linear `G`);
  - §4.2 (4263), with *strong-approximation-sufficiency* (4550).
- EndoscopicTransferAndUnitaryTraceComparison §6.2 (2098; its Check reads "including `SL₁=1`").
- GL2AutomorphicRepresentationsAndTransfer R17.1.5 (1508).
- SmallRamificationAndAbelianVarietyBaseCases §1.0 (234), §1.6 (475) and §1.7 (519).
- NoncompactQuantumSymmetry M1 (1281).
- AnalyticNumberTheoryPartI §2.9a (1473). Line 1490 applies the same harmonic reduction to estimate (4).
- AnalyticNumberTheoryPartII §§5.3g–5.3h (line 8).
- GeometryOfNumbersAndQuadraticArithmetic `quaternionAdjointTamagawa` (1121).
- ClassicalArithmeticCompletion §7.60 (15856). Its §7.21 (14867) is only the general maximal-order definition.
- LFunctions Layer 3 (730; `Γ_ℂ(1) = 1/π` at 779).
- ZerosOfLFunctions §1.4 (478), §3.1 (636), §3.4 (705), §3.5 (763), Layer 5 (927) and §5.6 (1003).
- ReductiveGroupsPartII RG2.2.1 (2846), RG2.2.2 (2973) and RG2.2.4 (3408), with `Building.exists_fixedPoint_of_bounded` (2955), `BTTree` (3658) and `type_smul` and `sl2_preserves_type` (3665–3666).
- RepresentationTheory:
  - LieGroups (the closed-subgroup theorem, line 11);
  - SemisimpleAlgebras Layer 3 (233);
  - InductionRestriction Layer 2.1 (346).
- PseudodifferentialOperators Layer 8 (P7a, 1933).
- TeichmullerGeometry at 9e49e594: lines 20, 27, 337 and 990, which take §§1.1, 1.4 and 3.1.
- QuaternionArithmetic at 797c405e: §§1.2, 1.7, 1.12, 3.5, 3.6 and 8.2 exist.

**Ids that only an open revision defines.** These FuchsianOrbifolds ids exist only at #1168's head, not on main:
- Layer 4a;
- L2.1;
- `minimum_area_finite_area_orbifold`;
- `covolume_eq_two_pi_mul_signature`;
- Layer 5 item 7.

On main, Layer 5 has six items and there is no Layer 4a. The description names #1168 under "Depends on" and in its merge-order paragraph, so this is not a finding.

**Ownership notes for the worker (repairs in other pull requests, not in this folder).** In each case this roadmap is the earlier owner and states the object, so the citation must come from the other roadmap.
- **TeichmullerGeometry, #1169 at 9e49e594.**
  - Line 337 still reads "Prove the **isometry lifting** statement used below". Line 37 attributes isometry lifting to RiemannianGeometry R4 item 7.
  - Line 51 says it "gives [`PGL₂(ℝ)`] the quotient topology" itself.
  - This roadmap (284) precedes it (285) and states both: §3.1's lifting, and `instTopologicalSpacePGL` under Conventions. #1169 should cite them, as README lines 1328–1331 here say.
  - RiemannianGeometry R4 item 7 (main, lines 744–756) proves the continuation of local isometry germs, Killing–Hopf and the quotient description. It does not state the conjugacy of lifts between two quotients, so §3.1 duplicates nothing there.
- **FuchsianOrbifolds, #1168 at f997c5f0.**
  - Lines 27–28 still say "The roadmap proves the standard presentation of the acting Fuchsian group".
  - But its Layer 2 item 5 now reads the presentation off item 3 (side pairings). Main's item 5 (line 252) listed "the standard presentation".
  - Since that revision drops the content, this roadmap states it in §1.4, which is the sanctioned response. #1168's scope sentence should drop the claim.
- **QuaternionArithmetic, #1722 at 797c405e.** Line 43 still claims the local structure of maximal orders, and lines 86 and 265 cite TeichmullerGeometry §9.1 for the lattice theorem. This is as in the previous review, and the repair belongs to #1722.

**Ownership against open pull requests.**
- `roadmaps grep` found no second owner for: `58.6`, `29.099`/`29.58`, Table 4, invariant trace field/trace envelope, commensurator criterion/dense commensurator, Gassmann, isometry lifting and standard presentation.
- KleinianGroups (#432) cites Maclachlan–Reid for invariant trace fields only as background; it owns Bianchi covolumes.
- FuchsianOrbifoldsPartII (#1696, 3d95b6c) owns Nielsen cores and arithmetic cycles of `PSL₂(ℤ)`.
- PolynomialGaloisGroups owns the number-field Gassmann theorem.
- `overlaps.md` lists no pull request changing this folder and no dropped id.

**Sources: the seeded sample.**
- **1.1.** Voight, Proposition 38.3.8 (`voight2021` line 29767) and Main Theorem 38.4.3 (line 29825). Borel §§3–4 (`borel1981` lines 225–440).
- **1.2.** Voight, Main Theorem 39.1.8 with (39.1.9) (`voight2021` lines 30270–30272) and the Eichler factor `λ = 1 − 1/q` (line 30267).
  - With `t = 1`, `r = n` and `c = 0`, this gives `2·4π/(4π²)ⁿ·ζ(2)d^(3/2)∏ q(1 − 1/q)`, which is the README formula.
  - Theorem 39.1.2 (line 30203). Borel Theorem 7.3 (`borel1981` line 690, printed p. 22).
- **1.3.** Maclachlan–Reid is uncertified (see Not verifiable). The route was recomputed in the table instead.
- **1.3b.** Odlyzko 1977 (`odlyzko1977`):
  - Theorem 1 with (4)–(5) on p. 210 (lines 39–44);
  - (7)–(8) on p. 212 (lines 88–92);
  - (9)–(12) on p. 213 (lines 107–118);
  - (13) and Stark's reduction on p. 214 (lines 130–142, including `E > 0` and `E_j < 0` on the real segment);
  - the tables on p. 215 (line 174).
- **1.4.**
  - BGLS §4, presentation (11), p. 12 (`bgls2010` lines 502–508): the relation `x₁⋯x_d y₁⋯y_s z₁⋯z_t [a₁,b₁]⋯[a_g,b_g] = 1`. The README's relation is a cyclic conjugate of it, as stated. Line 102 gives `s_n(Γ) ≤ (n!)^(d(Γ))`.
  - Borel §7.1 (line 662, p. 21) and Lemma 8.1 (line 779, p. 25: "generated by `2g + m + r − 1` elements").
  - Borel Theorem 8.2 (line 811, p. 26: conjugacy in `G_{a,b}`, which is `PGL₂(ℝ)` for `(1,0)`). §1.4's index-two inclusion converts it.
- **1.5.** All 31 `(b, A, E)` rows parsed from `odlyzko1976tables` match Table 4 exactly (lines 23 and 105 are the end rows).
- **2.2.** Bader–Furman: Definition 2.3 (`baderfurman2021` line 130), Theorem 2.5 (152), Lemma 2.6 (163), Theorem 3.2 (321) and Lemma 4.2 (566).
- **3.1.** Voight, Lemma 33.4.11 (`voight2021` line 25501, p. 602) and Theorem 33.5.5 (line 25554, pp. 603–604).
- **2.0, 2.1 (beyond Margulis), 2.3, 2.4, 3.2, 3.3 and 3.4** cite no external text. They are checked in the table.

**Adversarial table** (values computed on each side).

| Statement | Instances | Values | Result | Change |
|---|---|---|---|---|
| `RealSplitting` | `ℚ(√2)`, `(−1,√2)`, both places; `ℚ`, `(−1,−1)`; `ℚ(√2)`, `(1,1)` | other place: `−1 < 0`, `−1.414 < 0`, so it ramifies. With `place: √2 ↦ −1.414`, `σb = +1.414`, so it fails. The Hamilton algebra over `ℝ` is a division algebra and does not embed in `M₂(ℝ)`. `(1,1)`: `σa = 1 > 0`, so it fails. | discriminates | none |
| Skolem–Noether comparison | `k = ℚ`, `S₂ = Ad(diag(√2,1))∘S₁` | `FiniteDimensional ℚ M₂(ℝ)` is false; over `ℝ`, `u = diag(√2,1)` | step valid only after base change | R03 |
| `normOneImage`, `isCofinite_normOneImage` | `(1,1)/ℚ`, `M₂(ℤ)`; `O = ℤ·1` | `PSL₂(ℤ)`, covolume `π/3 < ∞`; `{±1}` gives `{1}`, of covolume `∞`, and `IsOrder` fails (span `ℚ·1`) | holds | none |
| `cocompact_…_iff_anisotropic` | `(1,1)/ℚ`; `(−1,3)/ℚ` | `x₀²−x₁²−x₂²+x₃²` vanishes at `(1,1,0,0)` and there is a cusp: both sides false. `3 ∣ x₀²+x₁²` forces descent and discriminant 6 is cocompact: both sides true. | holds | none |
| `IsArithmetic` | `⊥`; `PSL₂(ℤ)`; `G₅` | `⊥` is not commensurable with an infinite group: false. True. `tr(ST) = φ`, `tr((ST)²) = φ − 1 ∉ ℚ`, with a cusp: false. | holds | none |
| `finiteRamification` | `(−1,−1)/ℚ`; `(−1,3)/ℚ`; `(−1,−1)/ℚ(√2)`; `(1,1)/ℚ` | `{2}`; `(−1/3) = −1`, so `{2,3}`; `∅`; `∅` | holds | none |
| `covolume_normOneImage` | `M₂(ℤ)`; discriminant 6; Hurwitz order, `d = 49`; Eichler level 2 | `8π(π²/6)/(4π²) = π/3`. `(π/3)·1·2 = 2π/3 = 2π(−2+1+4/3)`. `ζ_k(2) = d^(−3/2)(−2π²)³ζ_k(−1) = 8π⁶/(21·343)`, giving `π/21`. The non-maximal Eichler order has actual area `π`, against `π/3`. | holds with `IsMaximalOrder` | R01 (Summary) |
| §1.2(c) local volumes | `q = 2` split; `q = 2` division; real places | `|GL₂(𝔽₂)|/16 = 3/8`, `|SL₂(𝔽₂)|/8 = 3/4`; `(1/2)(3/4)/(1/2) = 3/4 = (1−1/4)/1`; `(π/2)·area` with `vol(SL₁(ℍ)) = 4·(1/2)·2π² = 4π²`; `vol(SL₂(ℤ)\SL₂(ℝ)) = π²/6 = (π/2)(π/3)` | product correct; split step mislabelled | R02 |
| `liftSL`, `squareSubgroup` | `⊥`; `⟨[S]⟩`; `PSL₂(ℤ)`; `Γ̄(2)` | `{±I}`; `{±I,±S}` (`S² = −I`); `ab = ℤ/6`, mod squares `ℤ/2`, index 2; `(ℤ/2)²`, index 4 | holds; too few Checks | R04 |
| `IsNonelementary` | finite; `⟨2z, −1/z⟩`; `PSL₂(ℤ)` | `⊥` is a solvable finite-index subgroup; abelian of index 2, orbit `{0,∞}`; finite-index subgroups contain `F₂` | F, F, T | none |
| `squaredTraceField`, finite-index invariance | `⟨diag(λ,λ⁻¹)⟩`, `t = λ²+λ⁻²` transcendental | `K₀ = ℚ(t)`, against `ℚ(t²−2)` for the index-2 subgroup: unequal. Excluded by `IsNonelementary`. | holds | none |
| `…_commensurable` | `PSL₂(ℤ)`, `c = diag(2^(1/6), 2^(−1/6))`, `Δ = c⁻¹Γc` | `(MulAut.conj c • Δ) = Γ`; `cA_Δc⁻¹ = M₂(ℚ)`; `c⁻¹A_Δc` has entries scaled by `2^(±2/3)` | direction correct | none |
| Envelope theorem | `PSL₂(ℤ)`; `⊥` | span of `I`, `T²`, `T′²` and `T²T′² = (5 2; 2 1)` contains `4E₁₁`, `2E₁₂`, `2E₂₁`, `I`, so it is `M₂(ℚ)`, of dimension 4; `ℚ·I`, of dimension 1, excluded | holds | none |
| `integral_trace_lattice_order` | `SL₂(ℤ) ⊂ M₂(ℚ)`; `{±1}` | `(2 1; 1 1) − I − E₁₂ − E₂₁ = E₁₁`, so the span is `M₂(ℤ)`; span `ℚ`, so `hspan` fails | holds | none |
| `squared_trace_integrality_…` | `PSL₂(ℤ)`; `diag(2,1/2)`; `G₅` | traces in `ℤ`; `5/2` not integral, so not arithmetic; `φ` integral (the necessary condition passes, as the Check says) | holds | none |
| `discr_ge_odlyzko_five` | `ℚ`; `ℚ(i)`; constants | `58.6e^(−70) = 2.33·10⁻²⁹ ≤ 1`; `21.8²e^(−70) = 1.89·10⁻²⁸ ≤ 4`. `C_R − log 58.6 = 0.0008655 > 0.0008515`, `C_C − log 21.8 = 0.0036206 > 0.0036156`, `C_pole = −69.5895`. | holds | none |
| Inequality (13) | `x = 1`, `0 ≤ y ≤ 2000` (step `0.01`); strip grid `51×4001` | minimum `4.0·10⁻⁹ > 0` (the tail), `y²·diff → 0.016`; grid minimum `4.0·10⁻⁷ > 0` | holds numerically | none |
| (8), (10) derivation | `Λ_k` with LFunctions' gamma factors | `log A = (1/2)log D − r₂ log 2 − (n/2) log π`; differentiating `j−1` times gives `(1/2)Σ′E_j = G_(j−1) − (σ−1)^(−j) − σ^(−j) + Z_(j−1)` | matches README | none |
| `finite_conj_isArithmetic_covolume_le` | `C < π/21`; `C ≤ 0`; `Γ̄(N)` | no lattice, `F = ∅`; `ofReal C = 0 < covol` (`covolume_pos`); covolumes `2π` and `4π` for `N = 2, 3` | holds | none |
| §1.4 route constants | `C = π/21`; `(0;2,3,7)`; `(2;−)`; `ℤ`, `m = 2` | `d_C = 4`, `C′ = 16π/21`, `(128π⁶/21)^(2/3) = 325.0 ≥ 49`; `C_sig = 8π/21`, `(64π⁶/21)^(2/3) = 204.8`; `A = 4π`, `C_sig = 64π`, `d_C = 8`, `C′ = 1024π`; `m(m!)^d = 4 ≥ 1` | holds | none |
| Standard presentation | `PSL₂(ℤ)`; `Γ̄(2)`; `(2,3,7)`; closed genus 3 | `ab = ℤ/6` (without the relator `ℤ/6×ℤ`); free of rank 2; `ℤ/42/⟨(1,1,1)⟩ = 0`; 30 sides, 15 pairings and 10 cycles, `10 − 15 + 1 = −4` | holds | none |
| Index-two inclusion | `diag(2,1)`; `diag(−1,1)`; `Γ₀(2)` | `√2·diag(√2,1/√2)`; `λ²·1 = −1` has no real solution; conjugation gives `(a −b; −c d)`, with `c` still even | holds | none |
| `discr_ge_totallyReal` | `n = 1…5`; all 31 rows; `n ≤ 35`; `n ≥ 36` | `1, 5, 49, 725, 14641` against `0.0071, 0.2065, 6.0096, 174.87, 5088.64`. Minimum margins: `A_b−A = 0.00259` (`n₀ = 1`), `E−8b/3 = 0.0000333` (`n₀ = 4`), `Ae^(−E/n₀)−B = 0.000238` (`n₀ = 32`). Minimum ratio `1.2036914` at `n = 9`. `46.482e^(−16.267/36) = 29.5831 > 29.099`. | holds | none |
| `H`, `F_b` | `x = 0, 1/2, 0.7, 1, 1.5`; `∫H`; `H′(0)` | the formula equals `h∗h/3` by quadrature at all five points (`1, 0.659155, 0.434739, 1/6, 0.007512`); `∫H = 4/3`, so the pole term is `8b/3`; `H′(0) = 0` | holds | none |
| §2.0 | `diag(2,1)`, `Γ₀(2)` | `(a 2b; c/2 d)` is integral, so it lies in `SL₂(ℤ)` | holds | none |
| `isArithmetic_iff_dense_commensurator` | `PSL₂(ℤ)`; `G₅`; `⊥` | dense (contains `GL₂(ℚ)⁺`) and arithmetic; discrete and not arithmetic; dense but not a lattice | holds; `IsCofinite` needed | none |
| `commensurator_discrete_of_not_isArithmetic` | `G₅` (maximal `(2,5,∞)`) | `Comm = G₅`, index 1 | holds | none |
| `dense_commensurator_…_number_field` | `PSL₂(ℤ)`; `(2,3,7)` | `[K₀:ℚ] = 1`; `3` | holds | none |
| `instTopologicalSpacePGL`, §2.3 | `diag(1+1/n,1)`; `G₅` and `z ↦ −z̄` | tends to `1` and commensurates `PSL₂(ℤ)`, so not discrete; `S ↦ S`, `z+φ ↦ z−φ`, so index `≥ 2` | holds | none |
| `commensurator_pgl_eq_of_maximal` | `G₅`; `(2,3,7)` | not maximal (extended Hecke group); arithmetic, dense: both hypotheses needed | holds | none |
| `existsUnique_pgl_smul_eq_isometryEquiv` | `id`; `z ↦ −z̄`; route at `z = x+iy` | `[2I] = 1`; `diag(−1,1)`, `cosh d(1+i, −1+i) = 3`; `(x²+y²+1)/(2y)`, `(x²+y²+4)/(4y)`, difference `3/y`; `|z−(1+i)|²−|z−(−1+i)|² = −4x` | holds | none |
| §3.1 lifting | `⟨z+1⟩ → ⟨z+2⟩`, `c = diag(2,1)`; glide `−2z̄` | `cTc⁻¹ = z+2`, `c⁻¹Tc = z+1/2`; square `4z`, odd powers move `Im` by `2ⁿ` | holds | none |
| §3.2 | all 32 elements | class sizes `1,4,2,1,4,4,2,4,2,4,4`; both intersection vectors `1,0,0,0,1,0,1,0,0,1,0`; characters `8,0,0,0,2,0,4,0,0,2,0`; no conjugator; cores `{1}`; `(1,1),(3,0),(5,0)` generate all 32; conjugation formula on all `32²` pairs | holds | none |
| §3.3 | `c ∈ Comm_PGL(Γ₀) = toPGL(Γ₀)` | `h∘p = p∘c = p`, so `h = id` | holds | none |
| §3.4 | `g = 3` | `2h−2 = 8·4`, `h = 17`; `[aᵢ,1] = 1`; `φ` onto `Q`; `(1,1)` conjugates `(3,0)` to `(3,6) ∉ H₁`, so `H₁` is not normal | holds | none |
| §3.5 | areas | `8·4π(g−1) = 64π` for `g = 3` on both sides; `λ = 0` has multiplicity 1 | holds | none |

## Not verifiable

- **Takeuchi 1983, Theorem 2.1.**
  - On 2026-11-09 I tried the sources service, using a scratch copy of the manifest and DOI `10.2969/jmsj/03530381`. The Project Euclid landing page has no PDF link. The previous review found the J-STAGE URLs returning 404.
  - The manifest has no `takeuchi1983` entry. The worker should record it as uncertified with that DOI.
- **Maclachlan–Reid, Theorems 11.2.1 and 11.3.1.** The manifest records the book as uncertified (paywalled).
- **Margulis, Chapter IX.** Uncertified (paywalled).
- **Odlyzko 1977, the displayed formulas (4)–(13).** They are images in the extraction, so I recomputed the constants and inequality (13) instead (table).
- **Odlyzko's Table 2 (the `B` column).** The cited URL holds only Table 4. I checked `A e^(−E/n₀) > B` for every row directly.

## Source issues

- none
