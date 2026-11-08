# Review of CompactQuantumMetricSpaces (pull request #1155 at 7211966)

**Verdict:** needs changes

Files reviewed: `TauCetiRoadmap/CompactQuantumMetricSpaces/README.md` (1721 lines) and `TauCetiRoadmap/CompactQuantumMetricSpaces/Suggested.lean` (396 lines, 37 declarations, 17 `sorry`). This is a full review: the folder changed by 385 lines since 9647ef8. The worker's gate passes every check, nothing changed outside the folder, and the dependency check reports no problem. No finding is blocking: the three findings are P3 (one unrepaired item of the previous review, one supplier attribution, and three wording items).

Sources are cited by the line numbers of the sources service's extractions: rieffel98 = arXiv math/9807084, rieffel99 = math/9906151, rieffel00 = math/0011063.

## Status of the previous review's findings

- **R01 (P2, two owners of the gauge action): repaired.** Scope line 36 now reads "its gauge coefficient maps and gauge-finite Fourier polynomials"; §6.1 lines 1479–1484 consume the gauge action, its average `τ(a)·1`, the trace, the Fourier coefficients and the fixed algebra from HeisenbergImprimitivity §3.1, and own only `E_p` and the gauge-finite subalgebra. The supplier is declared in the pull request's depends-on list and merge-order paragraph. One residue of the attribution is R02 below.
- **R02 (P3, false non-Archimedean witness): repaired.** Lines 351–357 use `a = (−1, −1)`; recomputed below (adversarial row 2).
- **R03 (P3, §6.5 states less than Theorem 9.2): repaired.** Lines 1626–1633 state the global `δ` for all `Θ, Ψ` with the fundamental-domain route, and a new Check (lines 1647–1650) records the `d = 2` instance.
- **R04 (P3, `TauCeti.SmoothNoncommutativeTorus` absent at the pin): not repaired.** `Suggested.lean` line 28 still reads "(Tau Ceti has only its smooth subalgebra `TauCeti.SmoothNoncommutativeTorus θ`, …)", now with a longer description. Carried forward as R01.
- **R05 (P3, three locators): repaired.** Line 183 and line 1166 say "Notation 4.1"; line 1283 cites Lemma 13.6 and line 1286 Proposition 4.7; §2.4 lines 749–750 cite the paragraph on morphisms before Proposition 3.1.
- **R06 (P3, Proposition 5.7 unstated): repaired.** §5.2 lines 1243–1255 state the quotient estimate with Rieffel's route (the diagonal bridge on `E × E`, the quotient by `co(K₁ ∪ K₂′)`, the identification with `F₁ × F₂`); §5.5 line 1341 and §5.6 lines 1359–1360 cite it; a strict-case Check was added (lines 1267–1270).
- **R07 (P3, seven locators): repaired.** §0.1–§0.3 cite "Rieffel 1999, §1" (lines 329, 372, 404); §1.1 cites "Rieffel 1999, §2 … Rieffel 2000, Definition 2.1" (lines 498–499); §0.5 cites the paragraph before Proposition 3.1 and Proposition 3.5 (lines 460–465); §4.3 cites Lemma 2.5 (line 1034); §4.4 says "between Proposition 8.1 and Theorem 8.2, and the proof of Theorem 8.2" (line 1065); §4.5 attributes `actionLip ≤ L_der` to the proof of Theorem 3.1 and owns the reverse inequality (lines 1105–1108); the Riesz measure path is `RieszMarkovKakutani/Real.lean` (line 211).
- **R08 (P3, two one-tactic lemmas): repaired.** `stateEDist_self` and `stateEDist_comm` are deleted; the `edist_self` and `edist_comm` fields of `stateEMetricSpace` (lines 168–169) carry the tactic proofs, and README §1.2 line 525 says "zero self-distance, symmetry" in prose.

## R01 (P3) — The module docstring still names a Tau Ceti declaration absent at the pin

**Location.** `TauCetiRoadmap/CompactQuantumMetricSpaces/Suggested.lean` lines 27–29: "provided by neither pinned library (Tau Ceti has only its smooth subalgebra `TauCeti.SmoothNoncommutativeTorus θ`, a star algebra of rapidly decreasing coefficient functions with no norm or completion)".

**Claim.** The pinned Tau Ceti declares `TauCeti.SmoothNoncommutativeTorus`.

**Witness.** The checkout's `lake-manifest.json` pins Tau Ceti at a91d3aa, and that package's working tree is at that commit. A case-insensitive grep of its `TauCeti/` tree for `NoncommutativeTorus`, "rotation algebra", "quantum tor" and "noncommutative tor" finds nothing. The name occurs only in the NoncommutativeGeometry revision's `Suggested.lean` (pull request #1143, line 33), as a target of that roadmap, not as a library declaration. This is the previous review's R04, unrepaired.

**Repair.** Replace the parenthesis with "(neither pinned library has the rotation algebra or a smooth subalgebra of it)". The sentence before it already says that the identification needs `A_θ`.

**Repair tested.** The same grep confirms the replacement sentence; no other line of the file or the README names the declaration.

## R02 (P3) — §6.1 attributes the point-norm continuity of the gauge action to a supplier section that does not state it

**Location.** README lines 1479–1482: "The gauge action of §6.0 is a point-norm continuous action of `Tᵈ` with Haar average `∫ α_z(a) dz = τ_Θ(a)·1`. Both are HeisenbergImprimitivity §3.1's at `L = ℤᵈ` (its gauge action of `L̂` and its gauge average `τ(a)1`; continuity of `z ↦ α_z(a)` comes from …)".

**Claim.** HeisenbergImprimitivity §3.1 states that the gauge action is point-norm continuous.

**Witness.** At the head of #1149 (a9eeb6ec), `TauCetiRoadmap/HilbertModules/HeisenbergImprimitivity/README.md` §3.1 (lines 440–462) states "the gauge action of L̂, `α_γ(δ_x)=γ(x)δ_x`, with fixed-point algebra ℂ1 when L̂ is compact", and its line 477 states "the gauge average of a positive element a is `τ(a)1`". Neither sentence, nor any other line of the section, states continuity of `γ ↦ α_γ(a)`, and the average is stated for positive `a` only. The one-line proof of continuity (isometry of each `α_z` and continuity on the dense span) is given here, in this README's parenthesis, and is a theorem about the supplier's object that the supplier does not plan.

**Repair.** Own the continuity here and keep the average with the supplier: "Prove, owned here, that the gauge action of §6.0 is point-norm continuous: each `α_z` is isometric and `z ↦ z^pW_p` is continuous, so continuity passes from the dense span. Its Haar average `∫ α_z(a) dz = τ_Θ(a)·1` is HeisenbergImprimitivity §3.1's gauge average at `L = ℤᵈ` (stated there for positive `a`, extended to all `a` by linearity), as are …". Add "point-norm continuity of the gauge action" to the Scope list of owned items at line 35–36. Keep the `*Needs:*` line as it is.

**Repair tested.** The claim then cites the supplier only for what its lines 440–462 and 477 state; the continuity statement has no second owner on main (the OperatorAlgebraDynamics text that proves it for every discrete abelian group exists only in the open revision #1137, `TauCetiRoadmap/OperatorAlgebraDynamics/README.md` lines 1438–1447 at 08edaf59, which also claims (lines 3304–3309) this roadmap's regular model, trace and gauge action for its D1/D2.CentralTwists; that revision and #1149 contest the ownership of `C*(L, c)` between themselves, which is a matter for their reviews, not a finding here).

## R03 (P3) — Three wording defects

- **A §5.1 Check asserts finiteness of `M_ε` where it is infinite.** Line 1210–1211: "`N_ε(v) ≤ ε⁻¹‖v‖` shows `M_ε` is finite everywhere on the product." Witness: `M_ε(a, b) = max(L_E(a), L_F(b), N_ε(a, b))`, so for `E = C([0, 1], ℝ)` with the Lipschitz constant and `a(t) = √t`, `M_ε(a, b) = ∞` for every `b` and every `ε`. The prose at line 1186 states the domain correctly. Repair: "`N_ε(v) ≤ ε⁻¹‖v‖` shows that `N_ε` is finite everywhere, so `M_ε` has exactly the product domain `dom L_E × dom L_F`."
- **The Tau Ceti contract drops the moment hypotheses of the basepoint-normalized duality.** Lines 224–229 name `TauCeti.wassersteinEDist_one_eq_iSup_of_compactSpace` "with its basepoint-normalized form `TauCeti.wassersteinEDist_one_eq_iSup_apply_eq_zero`" and end "The compact form assumes probability measures and `OpensMeasurableSpace`; no moment hypothesis." Witness: at the pin, `TauCeti/MeasureTheory/OptimalTransport/Wasserstein/KantorovichRubinstein.lean` line 161 states the compact form with `[IsProbabilityMeasure μ] [IsProbabilityMeasure ν]` only, while line 304–307 states `wassersteinEDist_one_eq_iSup_apply_eq_zero` with `(hμ : HasFiniteMoment 1 μ) (hν : HasFiniteMoment 1 ν) (x₀ : X)` and no compactness. Repair: "The compact form assumes probability measures and `OpensMeasurableSpace` and no moment hypothesis; the basepoint-normalized form assumes `HasFiniteMoment 1 μ` and `HasFiniteMoment 1 ν`, which §3.3's adapter proves on a compact metric space."
- **§4.6 states a theorem without a locator or an ownership phrase.** Lines 1127–1129: "translation on `C(G/H)` … with the quotient metric `d(gH, kH) = inf_{h ∈ H} ℓ(g⁻¹kh)` for conjugation-invariant `ℓ`, and the equality of the action seminorm with `classicalLip` for this metric". None of the three Rieffel texts states it (rieffel00 Example 6.5, lines 1134–1148, treats only the isometry property of `α` under conjugation invariance). The statement is true: for `f` `C`-Lipschitz, `|f(x⁻¹gH) − f(gH)| ≤ C inf_h ℓ(g⁻¹xgh) ≤ Cℓ(x)` by conjugation invariance; conversely, for `x = gh⁻¹k⁻¹` one has `x⁻¹gH = kH` and `ℓ(x) = ℓ(g⁻¹kh)`, so `actionLip f ≤ C` gives `|f(kH) − f(gH)| ≤ C d(gH, kH)`. Repair: insert "(owned here; conjugation invariance of `ℓ` makes `d` a metric and `α` isometric, Rieffel 2000, Example 6.5)" after "for this metric".

## Verified sound

**Gate and direction.**
- The worker's gate at 7211966: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK`.
- `git diff --stat origin/main...HEAD` outside the folder is empty; the folder holds `README.md`, `Suggested.lean` and `metadata.toml` (`topic = "math.OA"`).
- My rerun of the dependency check with `--movable` prints:

```
depcheck: 239 roadmaps, 2430 edges, 0 problem(s)
```

- Merge order: CompactQuantumMetricSpaces is at line 209; VonNeumannAlgebras (line 6) and CStarAlgebras (line 8) are earlier; every other supplier is on main (eaf17b1) or is one of the two new-folder pull requests (#1145, #1149) named in the description's depends-on list and merge-order paragraph. Neither of those cites this roadmap as a supplier.
- A grep of the README for process words (so far, to be checked, current, removed, checkpoint, handoff, packet, optional, deferred, for later, round labels, pull-request numbers) finds nothing.

**Elaboration and signatures.**
- `lake env lean` on a scratch copy of `Suggested.lean` with `#check @name` appended for all 37 declarations: exit 0, 17 "declaration uses `sorry`" warnings, no other diagnostic.
- I compared each elaborated type with its README statement. Since 9647ef8 the only change is the deletion of `stateEDist_self` and `stateEDist_comm`; no binder was lost. The context audit: `IsOrderUnitNorm`, `stateSpace`, `centeredUnitBall`, `leftState`, `rightState` carry `[PartialOrder]` only; `ExtendedLipschitzSeminorm`, `stateEDist`, `scalarLine`, `IsLipNorm`, `IsClosedLipNorm` carry no order; every theorem carries `[IsOrderedAddMonoid] [PosSMulMono ℝ]` and `IsOrderUnitNorm` where its README statement needs them; `quantumGHEDist_eq_zero_iff` carries `[CompleteSpace E] [CompleteSpace F]`; `exists_limit_of_cauchySeq_quantumGHEDist` carries `[∀ n, CompleteSpace (E n)]` and returns `CompleteSpace F` in `Type u`; `exists_closedLipNorm_actionLip` carries `[CompactSpace G] [T2Space G] [IsTopologicalGroup G]`, `hℓ`, `hα`, `herg`.
- A second scratch file: `#synth UniformSpace (E ⧸ Submodule.span ℝ {e})` resolves to `PseudoMetricSpace.toUniformSpace` through `Submodule.Quotient.seminormedAddCommGroup (ℝ ∙ e)`, so `IsLipNorm` is total boundedness for the quotient seminorm, as the README says; `Prod.le_def` and `Prod.norm_def` confirm the coordinatewise order and the maximum norm on `E × F` used by the admissible Lip-norms.
- Padding probe: on a copy with each `sorry` replaced by `first | rfl | simp | infer_instance | (intros; rfl) | (intros; simp) | aesop`, all 17 sites fail (10 "aesop made no progress", 7 unsolved goals). No one-tactic declaration remains.
- Lean form: imports are `import Mathlib` and `TauCeti.MeasureTheory.OptimalTransport.Wasserstein.Basic` (object file present); no `set_option`, `lemma`, `#eval`, `#synth`, `#print`, no sorried data; `integrationState` has a real body; every Lean name occurs in the README and every backticked name of the roadmap's own in the README is declared.

**Headlines.**
- The Summary's headlines `tendsto_stateEDist_iff`, `closedLipNorm_recovery`, `stateEDist_integrationState`, `exists_closedLipNorm_actionLip`, `quantumGHEDist_triangle`, `quantumGHEDist_eq_zero_iff`, `exists_limit_of_cauchySeq_quantumGHEDist`, `totallyBounded_quantumGHEDist_iff` are stated, and `quantumGHEDist_eq_quotientQuantumGHEDist` with them.
- The docstring names three items as not statable. Checked at the pins: Mathlib has no rotation algebra (grep for "rotation algebra", `NoncommutativeTorus`, "quantum torus": nothing); Tau Ceti's `twistedMonoidAlgebra` (`TauCeti/Algebra/MonoidAlgebra/Twisted/Basic.lean` line 282) is a subalgebra of `Module.End k (G →₀ k)` with no star, norm or completion in its folder. R01 corrects only the parenthesis.
- The classical comparison `dist_q(C(X), C(Y)) ≤ ghDist X Y` of §5.3 would be statable at the pins through `exists_closedLipNorm_classicalLip`'s `L`; the Summary does not list it among the headlines and I do not count its absence as a defect.

**Supplier citations resolved (18).**

On main (eaf17b1):

| Supplier | Item | Where |
|---|---|---|
| BanachSpaceTheory | B1, B5 | `README.md` lines 54, 800 |
| VonNeumannAlgebras | Layer 0; V8.CompactErgodicActions (arbitrary compact Hausdorff `G`, Haar expectation, unique faithful tracial invariant state) | lines 275, 2037 |
| RepresentationTheory/CompactGroups | Layers 0–5 | lines 205–318 |
| RepresentationTheory/LieGroups | Layer 2 (closed-subgroup theorem) with "Cartan's automatic-smoothness corollary" | lines 275, 296–298 |
| CharacteristicClasses | C1 item 3, one finite faithful unitary representation of a compact Lie group | lines 212, 664–668 |
| OptimalTransport | Layers 0–3 | lines 346–504 |
| NoncommutativeGeometry | N5; N6 (`U₂U₁=exp(2πiθ)U₁U₂`); N7 (`D=−i(σ₁δ₁−σ₂δ₂)`, ordered Fourier basis) | lines 410, 475–484, 530–534 |
| RiemannianGeometry | R7.8 | lines 1303, 1527 |
| SpinGeometry | G6 | line 569 |
| OperatorAlgebraDynamics | D2 (absorption) | lines 143, 189 |
| AmenableGroups | Layer 6 | line 391 |

At open heads:
- CStarAlgebras (#860): the README labels "Layer 1, C1" and "Layer 2, C2" (lines 23, 25; headings at 232 and 538).
- SmoothBanachRepresentations (#1145): §2.1 (line 187) defines `E^k`, `E^∞` and proves "linearity in X" of the orbit derivatives; §3.1 (line 231) constructs `dπ` on `E^∞`; §8.1 (line 484) gives the dense complete Fréchet star subalgebra with `dα(X)(a*) = (dα(X)a)*`.
- HeisenbergImprimitivity (#1149, a9eeb6ec): §3.1 lines 440–462 state `λ_c`, `C*(L,c) = C*_r(L,c)`, the universal property through `TauCeti.TwistedMonoidAlgebra.lift`, the faithful trace `τ(f)=f(0)` with Fourier coefficients, and the gauge action with fixed algebra `ℂ1`; line 477 the gauge average; lines 101–104 the star `f*(x) = conj(c(−x,x)) conj(f(−x))`. Its Check at lines 512–518 uses `σ_Θ` with `Θ₁₂ = −θ`, the convention of this README. The continuity gap is R02.
- SpectralManifolds (#1158) cites this roadmap's §3.1 and §3.6 (its lines 33, 174, 236); both subsections exist under the Layer 3 heading.
- No roadmap on main cites CompactQuantumMetricSpaces, so no dropped id can break a citation.

**Pinned declarations opened (20).** Mathlib: `WeakDual.isCompact_closedBall` (`Analysis/Normed/Module/WeakDual.lean:269`), `PositiveContinuousLinearMap` (`Topology/Algebra/Module/ContinuousLinearMap/Positive.lean:31`), `PositiveContinuousLinearMap.ofReal_opNorm_eq_map_one` (`Analysis/CStarAlgebra/PositiveLinearFunctional.lean:74`, with `[CStarAlgebra A] [PartialOrder A] [StarOrderedRing A]`), `exists_extension_norm_eq` (`Analysis/Normed/Module/HahnBanach.lean:43`), `geometric_hahn_banach_closed_point` (`Analysis/LocallyConvex/Separation.lean:230`), `BoundedContinuousFunction.arzela_ascoli` (`Topology/ContinuousMap/Bounded/ArzelaAscoli.lean:109`), `Metric.hausdorffEDist` (`Topology/MetricSpace/HausdorffDistance.lean:259`), `Metric.hausdorffDist` (same file, 657), `GromovHausdorff.ghDist` (`Topology/MetricSpace/GromovHausdorff.lean:175`, with `[Nonempty] [CompactSpace]`), `RealRMK.rieszMeasure` (`MeasureTheory/Integral/RieszMarkovKakutani/Real.lean:65`), `ContinuousMap.toLp` (`MeasureTheory/Function/LpSpace/ContinuousFunctions.lean`), `MeasureTheory.L1.integralCLM` (`MeasureTheory/Integral/Bochner/L1.lean`), `GroupNorm` (`Analysis/Normed/Group/Seminorm.lean:110`), `IsCompactOperator` (`Analysis/Normed/Operator/Compact/Basic.lean:69`), `LieGroup` (`Geometry/Manifold/Algebra/LieGroup.lean:72`), `Matrix.unitaryGroup` (`LinearAlgebra/UnitaryGroup.lean`). Tau Ceti: `wassersteinEDist` (`Wasserstein/Basic.lean:160`, the infimum over couplings of the `L^p(π)` seminorm of `edist`, `∞` without a coupling), `wassersteinEDist_one_eq_iSup_of_compactSpace` (`KantorovichRubinstein.lean:161`, supremum over all `1`-Lipschitz `f : X → ℝ` of `ofReal (∫ f dμ − ∫ f dν)`, which equals the absolute-value form by `f ↦ −f`), `wassersteinEDist_one_eq_iSup_apply_eq_zero` (line 304, R03), `TauCeti.TwistedMonoidAlgebra.of` (316), `of_mul_of` (330), `lift` (391), `equivOfCoboundary` (501).

**Ownership.** `roadmaps grep` and the sibling checkouts: "Følner box" and `dist_q` are this roadmap's (SpectralManifolds is a consumer); "order-unit space" occurs otherwise only in QuantumFoundations as a consumer; "twisted group C*" occurs in OperatorAlgebraDynamics #1137, HeisenbergImprimitivity #1149 and here, and this roadmap now consumes it from #1149 (R02 for the residue). Ownership against open pull requests was checked through the brief's sibling checkouts.

**Sources: the seeded sample and every locator a finding touches** (24 rows, read at the lines given).

| README target | Source item | Lines | Agrees |
|---|---|---|---|
| 0.1 order-unit norm, order from norm | rieffel99 §1 | 101–112 | yes; Archimedean axiom is the source's `a ≤ re ∀ r ∈ ℝ⁺ ⟹ a ≤ 0` |
| 0.2–0.3 states, compactness, Kadison | rieffel99 §1 | 121–132 | yes |
| 0.4 quotient norm, dual-ball identity | rieffel99 §1 end, Lemma 2.1 | 143–146, 171–184 | yes; the `ω`-rescaling matches `µ − (tν + (1 − t)µ)` |
| 0.5 functoriality; order quotient | rieffel00 §3, Prop 3.5 | 359–368, 512–525 | yes |
| 1.1 Lipschitz seminorm | rieffel99 §2; rieffel00 Def 2.1 | 152–154; 258–261 | yes |
| 1.2 state distance | rieffel99 §2 | 156–159 | yes, `ρ_L` may be `+∞` |
| 1.3 radius identity | rieffel99 Prop 2.2 | 193–207 | yes, `diam ≤ 2r ⟺ ‖ã‖ ≤ r L(a)` |
| 1.4 criterion | rieffel98 Thm 1.8, 1.9, Condition 1.5 | 203–215, 263–269, 161–163 | yes; Condition 1.5 holds for order-unit spaces by `norm_eq_iSup_states` |
| 1.5 metric, uniformity | rieffel98 Thm 1.8; separability owned here | 203–215 | yes |
| 2.2 recovery | rieffel99 Thm 4.1, 4.2 | 310–320 | yes; the `a ∉ dom L` clause follows from closedness in `E` (row 17 below) |
| 2.3 metrics from norms | rieffel99 Def 9.5, Thm 9.7, Thm 9.11 | 834–836, 842–845, 920–923 | yes; misprint recorded |
| 2.4 morphisms | rieffel00 §3 | 359–368 | yes |
| 3.1 classical Lipschitz constant | definition; `LipschitzWith` at the pin | — | standard |
| 3.2 compact metric spaces | rieffel99 §8 | 678–680 | the ordinary Lip-norm of a metric, "permitted to take value +∞"; the Arzelà–Ascoli proof is standard |
| 3.3 states and `W₁` | Tau Ceti KR duality | `KantorovichRubinstein.lean` 161 | yes |
| 3.5 commutator seminorm lsc | rieffel99 Prop 3.7 | 284–288 | yes, essentially self-adjoint `D`, domain-preserving `a` |
| 4.2 compact ergodic supplier | VonNeumannAlgebras V8.CompactErgodicActions | main line 2037 | yes, arbitrary compact Hausdorff `G`, no length function |
| 4.3 compact `α_f`, bound, theorem, closedness | rieffel98 Lemma 2.5, 2.4, Thm 2.3; rieffel00 Prop 8.1 | 413–420, 386–405, 368–370; 1437–1439 | yes |
| 4.4 faithful `π₀`, `χ`, `k_n`, Lemmas 8.3, 8.4 | rieffel00 §8 | 1440–1447, 1486–1492, 1539–1557 | yes; Lemma 8.4 uses only centrality |
| 4.5 derivative seminorm | rieffel98 Thm 3.1 and proof; rieffel00 Prop 8.6 | 464–492; 1598–1611 | yes: the path argument gives `L0 ≤ L` "for any norm" (line 490); 8.6 is stated after the Ad-invariance remark |
| 4.6 examples | none in the sources | rieffel00 1134–1148 | locator missing (R03) |
| 5.1 admissible Lip-norms, distance | rieffel00 Notation 4.1, Def 4.2 | 620–630 | yes |
| 5.2 bridges, Prop 8.5, quotient estimate | rieffel00 Def 5.1, Thm 5.2, Prop 8.5, Prop 5.7 | 825–839, 1562–1585, 966–1000 | yes; 5.7's route (diagonal bridge, `K = co(K₁ ∪ K₂′)`, `C = B₁ ⊕ B₂`) is the README's; the source itself remarks the inequality is strict for one-point subsets |
| 5.3 triangle, diameter, comparison | rieffel00 Thm 4.3, Lemma 13.6, Prop 4.7 | 638–640, 2542–2556, 736–739 | yes |
| 5.4–5.6 rigidity, completeness, compactness | rieffel00 Thm 7.8, Def 6.3, Cor 12.10, Thm 12.11, Thm 13.1, Thm 13.5, Prop 13.7 | 1330–1333, 1105–1107, 2378–2393, 2410–2426, 2496–2509, 2582–2595 | yes; 13.5's converse uses `Fin`, and `Scv ≥ Fin` (line 2500) gives the `Scv` form |
| 6.0 twisted convolution, `σ`, trace, gauge | rieffel00 §9 (9.1), HeisenbergImprimitivity §3.1 | 1627–1647; #1149 lines 440–462 | yes; `δ_p ∗ δ_q = σ(p, p+q)δ_(p+q) = σ(p,q)δ_(p+q)` |
| 6.1 gauge action, average | HeisenbergImprimitivity §3.1 | #1149 lines 440–462, 477 | average yes; continuity not stated (R02) |
| 6.2 Lip-norms on quantum tori | rieffel00 §9 | 1655–1661 | yes, one fixed `ℓ` for all `θ` |
| 6.3 norm continuity | rieffel00 Lemma 9.3, remark | 1708–1716, 1722–1748 | yes |
| 6.5 Theorem 9.2, periodicity | rieffel00 | 1662–1668, 1806–1808 | yes; the global form is now stated |

**Adversarial table** (48 rows; values computed by me).

| Statement | Instances | Values on each side | Result | Change |
|---|---|---|---|---|
| 0.1 interval formula | `ℝ²`, `e=(1,1)`, `a=(1,1)` | Euclidean `√2`, max norm `1`; `−e ≤ a ≤ e` | formula selects the max norm | none |
| 0.1 non-Archimedean Check | cone `{x>|y|} ∪ {(t,−t)}`, `a=(−1,−1)`, `(0,1)` | `εe−a=(1+ε,1)` in cone ∀ε; `−a=(1,1)` not; `a+re=(r−1,−1)` in cone iff `r>2` or ray at `r=2`: `‖a‖=2`; `(0,1)`: `(r,−1)` in cone iff `r≥1`, `(r,1)` iff `r>1`: inf `1`, fails at `r=1`; `(ε,−1)` in cone iff `ε≥1` | Check correct | none |
| 0.1 `a ≥ 0 ↔ ‖‖a‖e−a‖ ≤ ‖a‖` | `(1,0)`; `(1,−1)` | `‖(0,1)‖=1 ≤ 1`; `‖(0,2)‖=2 > 1` | both directions | none |
| 0.1 Archimedean from the formula | `a ≤ εe ∀ε` | `b=a+‖a‖e`: `0 ≤ b ≤ (‖a‖+ε)e` so `‖b‖ ≤ ‖a‖`, then `b ≤ ‖a‖e` | derivation valid | none |
| 0.2 normalization without positivity | `2a₁−a₂`; `f(0)−f(1)+f(1/2)` | value `1` at `e`, norm `3`; unital, norm `3` | not states, not contractive | none |
| 0.3 `norm_eq_iSup_states` | `(1,−1)`; `E=0` | `sup|2t−1|=1`; `‖0‖=0≠1` so `he` excludes it; `iSup` over a bounded family | holds | none |
| 0.4 dual ball | `λ=(1/2,−1/2)` | `‖λ‖=1`, `t=1/2`, `φ=(3/4,1/4)`, `ψ=(1/4,3/4)`, `φ−ψ=λ`; `φ′−ψ′=(1,−1)≠λ` | exact | none |
| 0.4 quotient norm | `a=(3,1)` | `(3−1)/2=1=‖(1,−1)‖` | holds | none |
| 0.5 algebraic quotient by `o(t)` | class of `t` | `ε−t+max(t−ε,0)=max(ε−t,0) ≥ 0`; `−t=h+g`, `h≥0`, `g=o(t)` impossible near `0` | non-Archimedean | none |
| 1.1 `map_smul` junk | `r=0`, `L a=∞` | `L 0=0=0·∞` | consistent | none |
| 1.1 kernel axiom | `|a₁|`; `∞` off `ℝe` | kernel `{a₁=0}`; domain not dense | excluded | none |
| 1.2 `ρ(δ_x, Leb)` | `x=0, 1/2` | `x²−x+1/2`: `1/2`, `1/4` | holds | none |
| 1.3 radius, centered ball | `|a₁−a₂|`, `φ=ev₂` | diam `1`, `r=1/2`; ball `[−1,1]×{0}`, norm sup `1=diam > 1/2` | holds | none |
| 1.4 section bound | `a=(1,−1)`, `φ=ev₁` | `‖q(a)‖=1`, `‖a−φ(a)e‖=‖(0,−2)‖=2` | constant `2` sharp | none |
| 1.5 separability | `{L≤1} ⊆ B_φ+ℝe`, `dom L=⋃ n{L≤1}` | `a−φ(a)e ∈ B_φ`; `ℓ^∞` nonseparable | no Lip-norm on `ℓ^∞` | none |
| 1.6 `G_n` | `n=2` | `G_n′=min(n|t|,1)`, `L(G_n)=1`; `‖G_n−(t+1)‖=∫₀^{1/n}(1−ns)ds=1/(2n)`; `L(t+1)=2` | not closed | none |
| 2.1 kernel loss | `p_n=∫q_n`, `q_n→g′` | `L(p_n) ≤ ‖q_n−g′‖_∞→0`, `‖q(p_n)‖→1/2` | `g` in closure kernel, radius `∞` | none |
| 2.2 `closedLipNorm_recovery` | `a∉dom L`, sup `=C<∞` | `a` in the `E`-closure of `C·{L≤1}={L≤C}` by closed sublevel sets, so `L(a)≤C` | `∞` case holds | none |
| 2.2 `√t` | `φ=δ_h`, `ψ=δ_0` | `√h/h=h^(−1/2)→∞` | sup `∞=L(a)` | none |
| 2.3 simplex | `K⊆ℝ³` | `K−K={Σx=0, Σ|x|≤2}` (`c=(1−Σx⁺)/3≥0`); `‖(1/2,1/2,−1)‖₂=√1.5<√2=W₁` | extreme points do not recover `L` | none |
| 2.3 `|x−y|²` | `0,1/2,1` | `1 > 1/4+1/4` | metric hypothesis needed | none |
| 2.4 pullback direction | `T=id`, `L_F=L_E/2` | `ρ_E(T*φ,T*ψ)=ρ_F/2` | correct | none |
| 2.5 edge quotient; restriction vs quotient; image norm | `max|a_i−a_j|`; `|a₁−a₂|+2|a₂−a₃|`; `b=(0,1)` | `|b₁−b₂|` at `a₃=(b₁+b₂)/2`; `|b₁−b₃|` at `t=b₃` vs `2|a₁−a₃|`; image norm `1`, every lift has `a(1)=2` | all Checks correct | none |
| 3.1 `classicalLip`, Leibniz | `t²` on `[0,1]`; `X=∅` | `sup(s+t)=2 ≤ 1+1`; `0` | holds | none |
| 3.2 `exists_closedLipNorm_classicalLip` | `X=∅` | `C(∅)=0`, `L=0` satisfies every field, `TotallyBounded` of `{0}` | statement also true for empty `X`; `Nonempty` keeps the README's generality | none |
| 3.2 `√x`, inverse law | `f_r=min(rx,√x)`; `1/t` on `[1,2]` | error `1/(4r)` at `x=1/(4r²)`; `classicalLip(1/t)=1=1²·1` | sharp | none |
| 3.3 `stateEDist_integrationState` | `{0,1}`; `δ_(1/2)` vs Leb | `|t−s|`; `1/4`; KR sup over `LipschitzWith 1 f` of `∫f dμ−∫f dν` equals the `|·|` form by `f↦−f` | equals `W₁` | none |
| 3.5 `M₂`, `D=diag(1,−1)` | `[D,a]` | entries `2a₁₂`, `−2a₂₁`; kernel diagonal `ℂ²` | not a Lip-norm | none |
| 3.5 maximal-domain closedness (owned) | `a_n→a`, `‖[D,a_n]‖≤C` | `D a_nξ` bounded, weak subsequence limit in the closed graph: `aξ∈dom D`, `‖[D,a]ξ‖≤C‖ξ‖` | true | none |
| 4.1 inverse law | `C(T)`, `2+z` | `L(f)=1`, `‖f⁻¹‖=1`, `L(f⁻¹)=sup 1/|2+z|²=1` | equality | none |
| 4.3 `exists_closedLipNorm_actionLip` | `T`, `ℓ=|θ|`; `ℤ/2`; `A=0` | `∫ℓ=π/2`, diam `π` sharp; `1/2`, diam `1`; `L=0` satisfies all fields | true, Lean needs no `A≠0` | none |
| 4.4 `ℓ` dominates a Lie length (owned) | `ℓ(x_k)/d(x_k)→0` | `ℓ(x_k^{m_k}) ≤ m_kℓ(x_k)→0` on the shell `d∈[r/2,r]` where `ℓ≥c>0` | contradiction, claim true | none |
| 4.4 kernels | `T`, `1⊕z`; `ℤ/2`, `1⊕sgn`; `T`, `1⊕z²` | `2+2cosθ`, support `{−n..n}`; `k_n=2δ_1`, `δ_n=0`; maxima at `0,π`, `δ_n→π/2` | Checks correct | none |
| 4.5 `actionLip=L_der` | path; `exp(tX)` | `≤` by `∫‖c′‖`; `≥` by `ℓ(exp tX) ≤ |t|‖X‖` | equality for any norm | none |
| 4.6 Jordan factor | `a∘b=(ab+ba)/2` | `L ≤ (L(ab)+L(ba))/2 ≤ L(a)‖b‖+‖a‖L(b)` | factor `1` | none |
| 4.6 `C(G/H)` | `x=gh⁻¹k⁻¹` | `x⁻¹gH=kH`, `ℓ(x)=ℓ(g⁻¹kh)` | equality true, no locator | R03 |
| 5.1 `M_δ` | `ℝ²` vs `ℝ` | `ρ_M(φ_t,ψ)=|t−1/2|+δ`, Hausdorff `1/2+δ`; `dist_q=1/2` by diameters | Check correct | none |
| 5.1 `N_ε` bounds | `M` with `‖q‖≤RM` | `N_ε(v) ≥ inf_w(‖q(w)‖/R+‖q(v−w)‖/ε) ≥ ‖q(v)‖/max(R,ε)`; `N_ε ≤ ε⁻¹‖v‖`; `M_ε(√t,b)=∞` | kernel and domain correct; Check wording wrong | R03 |
| 5.1 `ρ_M ≤ ρ_(M_ε) ≤ ρ_M+2ε` | `M_ε≤M`; `M_ε(v)≤1` | `‖v−w‖≤ε(1+η)`, `M(w)≤1+η`: `|φ(v)−ψ(v)| ≤ (1+η)(ρ_M+2ε)` | both inequalities | none |
| 5.2 compatibility | `P=id`, `L_F=L_E/2` | diam `1` vs `2`, `dist_q ≥ 1/2` | Check correct | none |
| 5.2 quotient estimate | `K₁={δ_0}`, `K₂={δ_1}`; `K=S(E)` | `dist_q(ℝ,ℝ)=0 < 1=W₁`; quotient by `S(E)` is `E` since restriction is injective | strict case, special case | none |
| 5.3 two-point spaces | `d=1` vs `d=2` | `ghDist=1/2`, `dist_q ≥ (2−1)/2` | equality | none |
| 5.4 `quantumGHEDist_eq_zero_iff` | `C¹` vs `C[0,1]` | distance `0`; `C¹` fails `CompleteSpace`, `‖f′‖_∞` fails closedness | hypotheses needed and present | none |
| 5.4 closed = Rieffel-closed | complete `E`, closed sublevel sets | Kadison onto `Aff_c`; a `1`-Lipschitz affine `â` has `L(a)≤1` by recovery | `E` is `A^c` | none |
| 5.5 limit of `(D,L_D)` | closed completion | diagonal bridge with `{L_D≤t}` dense in `{L̄≤t}`: `dist_q(D,D̄)=0` | closed limit exists | none |
| 5.6 `Fin`, `Scv`, nets | `{δ_(k/n)}`; `[0,1]`; `(ℝ²,t|a₁−a₂|)` | `dist_H(co(net),S)=1/(2n)` (nearest grid point; `δ_(1/(2n))` attains), `n+1 ≤ 1/ε+2`; `⌈1/(2ε)⌉`; `Fin≤2`, diam `1/t` | Checks correct | none |
| 6.0 relation, `d=2` | `Θ₁₂=−θ` | `W_(1,0)W_(0,1)=e^(−πiθ)W_(1,1)`, `W_(0,1)W_(1,0)=e^(πiθ)W_(1,1)`: `U₂U₁=e^(2πiθ)U₁U₂` | matches N6 | none |
| 6.0 supplier convention; `δ_p∗δ_q` | HI's `c(x,y−x)h(y−x)`; (9.1) | `λ_c(x)δ_q=c(x,q)δ_(x+q)`; `(δ_p∗δ_q)(p+q)=σ(p,p+q)=σ(p,q)` | matches | none |
| 6.0 negative control | `d=1`, `B=C({±1})` | `V_2=1`, `τ_B(V_2)=1≠0` | hypothesis fails, map not injective | none |
| 6.1 `V*π_τ(U₂)V` | `δ_(m,n)` | phase `πiθmn+2πiθm−πiθm(n+1)=πiθm`; `σ((0,1),(m,n))=e^(πiθm)` | equal | none |
| 6.1 `E_p` | `a=W_q` | `∫z^(q−p)dz·W_q=δ_(p,q)W_q=τ(W_qW_p*)W_p` | holds | none |
| 6.2 Dirac bound | `W_(1,0)+W_(−1,0)` | `x=2πi(W−W*)`, `‖x‖=4π`, `y=0`; `σ₁x−σ₂y=[[0,x+iy],[x−iy,0]]` | both bounds attained | none |
| 6.3 Følner boxes; Harper | `d=2,n=1,k=(1,0),(1,1)`; `θ=1/2` | `4≤4`, `6≤8`; cross terms cancel, `A+B` with `A=2+2cos2x`, `B=2+2cos2y` central: `‖H‖²=8` vs `16` at `0` | Checks correct | none |
| 6.4 support functions | `a=(−1,−3)`, `R=1,2,3` | `max(|R−1|,|R−3|)−R=1,−1,−1`; `max(a)=−1` | `R≥2` needed | none |
| 6.5 coboundary | `N₁₂=1`, `p=(1,0)`, `q=(0,1)` | `σ_(Θ+N)/σ_Θ=e^(πi p₁q₂−πi p₂q₁)`; `b(p)b(q)/b(p+q)=e^(−πi(p₁q₂+p₂q₁))`; ratio `e^(2πi p₁q₂)=1` | `equivOfCoboundary` hypothesis `β·c(p+q)=α·c(p)c(q)` holds | none |
| 6.5 global `δ` | `D` fundamental domain, `K={dist(·,D)≤1}` | `‖Θ−Ψ‖<δ≤1`, `Θ−N∈D` gives `Ψ−N∈K`; `dist_q(A_Θ,A_Ψ)=dist_q(A_(Θ−N),A_(Ψ−N))<ε` | Theorem 9.2 as stated | none |

**Checks per definition.** Every `### k.n` carries at least three Checks: 0.1–0.5: 4/4/4/5/3; 1.1–1.6: 3/4/4/4/3/3; 2.1–2.5: 4/4/3/3/4; 3.1–3.6: 4/4/4/3/3/3; 4.1–4.6: 4/3/4/4/3/3; 5.1–5.6: 4/4/3/3/3/4; 6.0–6.5: 7/5/3/4/3/5. Each subsection has a `*Needs:*` line, and all seven layers end with `### Examples` and `### Dependencies`.

**Counts.** 31 locator rows read at their lines, 18 supplier citations resolved, 20 pinned declarations opened, 37 Lean declarations elaborated and compared with the README, 17 sorried statements probed for padding, 48 adversarial rows.

## Not verifiable

- hkls81 (Høegh-Krohn–Landstad–Størmer, Ann. of Math. 114 (1981)): the DOI resolves to JSTOR, paywalled. It is consumed only through VonNeumannAlgebras V8.CompactErgodicActions.
- rieffel00 Lemmas 13.8–13.11 were read for their statements only; the README cites Proposition 13.7 for that conclusion.

## Source issues

- **Misprint** in rieffel99 at Theorem 9.11, printed page 26: the source says the metric must be convex, midpoint balanced and midpoint convex; it should be midpoint concave, the condition of its Definition 9.5 used in Theorem 9.7; affects nothing.
- **Gap** in rieffel00 at the remark before §10, printed page 46: the source says the quantum tori are unchanged when integers are added to the entries of θ; it should say isometrically isomorphic, by rescaling generators with a ±1-valued coboundary, since σ changes by exp(πi p·Nq); affects the proof.
