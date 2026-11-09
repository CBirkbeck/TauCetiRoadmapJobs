# Review of OperatorAlgebraDynamics (pull request #1137 at 3e67e69)

**Verdict:** needs changes

This is a full review of the head that the previous review read. The folder is unchanged since then. There are four findings, all P3; none is blocking.

- One finding is outside the folder: the branch deletes six files of other roadmaps, so the gate fails.
- Three are small repairs inside `README.md`:
  - a missing locator on the saddle-flow worked example;
  - a Mathlib name that does not exist at the pin;
  - a misstated scaling identity in D9.

`Suggested.lean` needs no change. It elaborates with only the 15 expected `sorry` warnings, and every statement in it held under the adversarial pass.

## R01 (P3) — The branch still deletes six files of other roadmaps, so the gate fails

Re-raised: H02

Carried from the previous R01. Not repaired.

**Location.** Outside the folder:

- `TauCetiRoadmap/FiniteGroupExtensionSplitting/PROGRESS.md` and `STATUS.md`
- `TauCetiRoadmap/LieGroupoidsPoisson/PROGRESS.md` and `STATUS.md`
- `TauCetiRoadmap/PrimitivePrimeDivisors/PROGRESS.md` and `STATUS.md`

**Claim.** Merging would delete from main six files that belong to other roadmaps.

**Why the repair report's reason fails.** The repair report says a repair of this folder may not write outside it. That is true, but it does not settle the finding. The gate fails on this head, and a folder is not accepted while it does. The fix is one commit on the branch by whoever can write there.

**Witness.**

- The merge commit 4133234f has parents a08e7b27 and 32a0bcc9. The diff from 32a0bcc9 to 4133234f deletes exactly these six files (159 lines). All six exist at origin/main 3090489 and are absent at HEAD.
- My gate run gives `outside-folder=6 … FAIL`, and every other check is 0.

**Repair.** In a new commit on the branch, run `git checkout origin/main -- <the six paths>`. Re-run the gate. `outside-folder` is then 0 and the diff against main touches only `TauCetiRoadmap/OperatorAlgebraDynamics/`.

## R02 (P3) — The saddle-flow worked example has no locator, though a cited source states it

**Location.** `README.md` lines 2025–2040, "Worked example: the saddle flow": "For the continuous action `t·(x,y)=(exp(t)x,exp(−t)y)` of ℝ on ℝ², classify orbits and compute the quotient topology directly … Prove these bases from saturated open sets in ℝ². Deduce T₀, failure of T₁ and failure of Hausdorffness."

**Claim.** The target gives orbits, neighbourhood bases and separation properties, but no locator.

**Witness.**

- Williams, Example 3.32, pp. 96–97 (`williams-cpcsa-draft31` line 6178, page 96). The positive reals act by `r·(x,y)=(rx,r⁻¹y)`, which is the same flow under `r=e^t`.
- The example lists the same orbits. Its basis items (a)–(c) at lines 6192–6195 are the README's bases: at a half-axis, small r on the two adjacent quadrant branches; at the origin, all four half-axis points and small r on all four branches.

**Repair.** Append "(Williams, Example 3.32, pp. 96–97)" to the first sentence of the worked example and add Example 3.32 to the Williams entry of References.

I recomputed the content (row 29 of the table) and it is correct, so the locator is the only change.

## R03 (P3) — `Real.fourierIntegral` does not exist at the Mathlib pin

**Location.**

- `README.md` line 2275, the D4.Harmonic Check: "Mathlib's `Real.fourierIntegral` integrates `f(x)e^(−2πiwx)`, so it is this transform at `χ_(−2πw)`".
- `README.md` line 2459, D4 Examples: "against Mathlib's `Real.fourierIntegral`".

**Claim.** The Check pins the README's Fourier convention against a declaration that is not at the pin.

**Witness.**

- `#check @Real.fourierIntegral` after `import Mathlib` at 1b1ccf4b gives "Unknown constant".
- The real transform at the pin is the `FourierTransform` instance `Real.instFourierTransform` with notation `𝓕` (`Mathlib/Analysis/Fourier/FourierTransform.lean` line 428).
- `Real.fourier_eq` (line 434) states `𝓕 f w = ∫ v, 𝐞 (-⟪v, w⟫) • f v`.

**Repair.** Replace both occurrences with "Mathlib's Fourier transform `𝓕` (`Real.fourier_eq`: `𝓕 f w = ∫ v, 𝐞(−⟪v,w⟫) • f v`)". Add `Real.fourier_eq` to D4's Dependencies.

The rest of the Check stays as it is. On ℝ, `⟪x,w⟫=xw` and `𝐞(t)=e^(2πit)`, so `𝓕f(w)=∫f(x)e^(−2πiwx)dx`, which is `f̂(χ_(−2πw))` (row 33).

## R04 (P3) — The D9 scaling sentence misstates how the two sides change

**Location.** `README.md` lines 3803–3806: "for c>0, `S(cσ)=cS(σ)−c·Tr σ·log c`, and the four matrices have the trace of ρ, so replacing ρ by cρ changes both sides by `−2c·Tr ρ·log c`".

**Claim.** The first formula is right. The conclusion drawn from it is not: each side is multiplied by c and then shifted. Adding `−2c·Tr ρ·log c` alone is wrong.

**Witness.** The README's own GHZ Check (lines 3866–3871), at c=2:

- The left side goes from `0+log 2` to `−2log 2+0`, a change of `−3log 2`.
- The sentence predicts `−2·2·1·log 2=−4log 2`.
- The Lean docstring says it correctly: "changes each of the four entropies `S(σ)` to `t S(σ) - t Tr(ρ) log t`".

**Repair.** Replace "changes both sides by `−2c·Tr ρ·log c`" with "multiplies both sides by c and then adds `−2c·Tr ρ·log c` to each, so the inequality for ρ is equivalent to that for cρ".

Check of the repair on GHZ at c=2:

- left side: `2·log 2−4log 2=−2log 2`;
- right side: `2·2log 2−4log 2=0`.

Both match the Check's values.

## Previous findings

- **R01 of the previous review (outside-folder deletions): not repaired.** The six deletions are still on the branch and the gate still fails. Raised again as R01 here.
- **Second owners of D8's `U_σ`, `P_s`, `P_a` and vacuum cyclicity (H01): settled, unchanged.** This README already owns them (line 163; D8 lines 3331–3347 and 3537–3540). The other two roadmaps still build them instead of citing D8:
  - NoncompactQuantumSymmetry at #1015, head 4e793e8, lines 660–662 and 669;
  - QuantumFoundations at #1771, head 824bab8, line 711, which consumes "NoncompactQuantumSymmetry P.6".

  The repair is theirs. Main is earlier than every open roadmap.
- **Description (H03): settled, unchanged.** The description's last line still lists revision dependencies (#1097, #1771, #1015, #863). It does not state the order with #1187, which conflicts in `Suggested.lean` according to `scratch/overlaps.md`. This is a description edit, not a folder edit. The revision-dependency line should be deleted, and a sentence should say which of #1137 and #1187 is rebased on the other.

## Verified sound

### Gate, dependency check, elaboration, signatures

- **Gate** (my run at 3e67e69): `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=6 source-material=0 FAIL`. The six paths are those of R01. The worker's `gate.md` agrees and adds `build=0`.
- **Dependency check:** `depcheck: 235 roadmaps, 2265 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line. OperatorAlgebraDynamics is on main, so every named supplier must be on main. Each is:
  - BanachAlgebras, CStarAlgebras, HilbertModules, VonNeumannAlgebras, AmenableGroups and LieGroupoidsPoisson;
  - OperatorTheory/SelfAdjointSpectralTheory, RepresentationTheory/CompactGroups and RepresentationTheory/SpinRepresentations;
  - Completed/OneParameterSemigroups.

  MetaplecticAutomorphicForms, NoncompactQuantumSymmetry, OperatorKTheory, CStarClassification, QuantumFoundations and HeisenbergImprimitivity appear only as deferrals and consumers.
- **Elaboration:** `lake env lean TauCetiRoadmap/OperatorAlgebraDynamics/Suggested.lean` exits 0 after 14 s. The only diagnostics are 15 `declaration uses sorry` warnings, at lines 103, 116, 131, 203, 222, 237, 253, 274, 295, 306, 323, 339, 361, 385 and 408.
- **Signatures:** `#check @` of all 18 declarations in one scratch copy elaborates. The file has no `variable` block, so every binder is in each signature. Each elaborated type matches its README statement at the same generality: arbitrary LCH groups in D1–D4, any HilbertBasis ℕ in D6, any PSD tripartite matrix in D9.
- **One-tactic probe:** I replaced each `sorry` with `first | rfl | infer_instance | simp | trivial | decide`. All 15 theorems fail.
- **Duplication search at the pins:** I grepped Mathlib and Tau Ceti for automatic continuity, strong subadditivity, Powers/C*-simplicity, Cuntz families and the full Fourier isomorphism. Nothing at the pins proves a target. Mathlib's `MeasureTheory.Measure.AddMonoidHom.continuous_of_measurable` (`Mathlib/MeasureTheory/Measure/Haar/NormedSpace.lean` line 79) needs a locally compact seminormed source and a real normed target. That is narrower than `continuous_of_measurable_monoidHom`, as the docstring says.

### Headline theorems

From the README, the headline theorems and where each stands:

- **Stated (15):**
  - D1: the L¹ integrated form, pair recovery and full ideal exactness.
  - D1.CentralTwists: the projective integrated form.
  - D1.BorelPrefix: automatic continuity.
  - D2: amenable faithfulness of the regular representation.
  - D2.OrbitRepresentations: the commutant of an orbit representation.
  - D2.FreeGroups: the Powers partition, simplicity and the unique trace.
  - D4.Harmonic: `C*(G)≅C₀(Ĝ)` and `C*(Ĝ)≅C₀(G)`.
  - D4.LCAWeyl: the Weyl classification.
  - D6: the residue Cuntz family.
  - D9: strong subadditivity.
- **Named in the docstring as not statable, each with the carrier it lacks:**
  - the reduced and twisted crossed products, with exactness and nuclearity;
  - C*-tensor products and Takai duality;
  - Mackey's theorem;
  - Green and symmetric imprimitivity;
  - groupoid algebras, disintegration, Renault equivalence and `O_n`;
  - the KMS simplex;
  - Araki's `Ω^Q`;
  - CAR and Weyl algebras, quasi-free KMS states and the thermodynamic limit.
- **Not a gap:** `C₀(G)⋊G≅K(L²G)` would need a translation action on `C₀(G)`. Tau Ceti's `TauCeti.CStarAction.ofMulAction` is only for compact X (`Action/ContinuousMap.lean`), and Mathlib has no C*-algebra of compact operators. So it is not statable without heavy definitions, and its consequence `lcaWeyl_classification` is stated.

The three definitions have real bodies (`CentralCocycle`, `CentralCovariantPair`, `generatedCStarAlgebra`). There is no sorry'd data and no padding.

### Seeded sample

- **"Worked example: the saddle flow"** (line 2025). The mathematics is correct (row 29) and Williams Example 3.32, pp. 96–97, supports it, but the README gives no locator (R02).
- **"D5.Fields — the standard-fibre model as a measurable field"** (line 2543). All four Williams locators are right:
  - Definition E.16 is at line 23770 and Theorem E.17 at line 23776, both on printed p. 405. E.17 assumes H separable, X second-countable LCH and μ finite, which matches D5.Fields' standing hypotheses.
  - Definition F.1 is on p. 409 (line 23897).
  - The nonzero-fibre standing assumption is in the sentence just before it (line 23893).

  The Checks are recomputed in row 38.
- **"Concrete Cuntz families on separable Hilbert space"** (line 3003). The statement and all five Checks are recomputed in row 39. Cuntz §1 is uncertified (see Not verifiable).
- The README flags no locator as unverified.

### Source locators checked against the cached texts

- **Williams (`williams-cpcsa-draft31`).** The printed page is the PDF page minus 12. All match:
  - Chapters 1–3: 1.76 and 1.78 (pp. 24–25), (1.20) p. 26, (1.21) p. 27, 2.40 p. 59, 2.61 p. 72, 2.73 p. 76, 3.1 p. 82, 3.19 p. 93.
  - Chapters 4 and 7: Def. 4.26 p. 135, Lemma 4.28 p. 136, Thm 4.24 p. 133, Thm 4.29 p. 137, Example 7.11 p. 198, Thm 7.13 p. 199.
  - Appendices D–I:
    - Appendix D: D.3 p. 370, D.11 p. 372, D.20 and D.23 pp. 375–376, D.28 p. 383, D.37–D.43 pp. 391–395;
    - Appendices E and F: E.16–E.17 p. 405, F.1 p. 409, F.20 p. 417, F.21 p. 418, F.26 p. 419, F.33 p. 423;
    - Appendix I: I.1 p. 479, I.21 p. 494.
- **Hypotheses checked against the source:**
  - D.11 assumes "separable metric groups with G Polish", which is what `continuous_of_measurable_monoidHom` assumes.
  - 7.13 says "if π is a faithful representation of A, then π̃⋊λ is faithful", which is `injective_integratedFull_regular_of_amenable`.
  - 3.19, 2.40, 4.24 and 4.29 are as stated in the README.
- **de la Harpe:** Definition 9 (p. 7, line 323) is the partition of `exists_powers_partition`. Corollary 12(i) (p. 8) covers free products. Theorem 14 is on p. 10 with its `1/√N` estimate at line 488. Kesten's `[−1,1−ε]` is on p. 16 (line 720), and the Dixmier remark on p. 19.
- **Others:**
  - Attal: Def. 8.3 p. 7; Defs. 8.11–8.12 and Prop. 8.13 pp. 12–13; Def. 8.4, Prop. 8.5 and Cor. 8.6 pp. 8–9; Def. 8.19 p. 17; Def. 8.20 and Prop. 8.21 p. 18; (8.18) and Prop. 8.23 p. 19.
  - Arici–Mesland: Def. 2.1 and (4), p. 3.
  - Muhly–Williams: Thm 5.5 p. 20, Thm 7.8 p. 35.
  - Sims–Williams: Thm 13 p. 10, Thm 17 p. 12.
  - Takeishi: Thm 5.4 p. 11, for any LCH étale G.
  - Nielsen–Petz: (1) p. 1, Lemmas 1–2 p. 3.
  - Araki: Props 4.1, 4.3, 4.5, 4.6, 4.8 and 4.12 and Cor. 4.4 are present.

### Library declarations opened at the pins

The pins are Mathlib 1b1ccf4b and Tau Ceti 2fd255d. Two scratch files of `#check`s cover 44 names. All resolve except `Real.fourierIntegral` (R03).

- **Mathlib.**
  - `PiTensorProduct.reindex_tprod`, `isEmptyEquiv` (line 785), `subsingletonEquiv` (line 814) and `tmulEquiv` (`LinearAlgebra/PiTensorProduct/Basic.lean`).
  - `Measure.modularCharacter` (`Group/ModularCharacter.lean` line 130). Its function is `haarScalarFactor (map (·*g) μ) μ`, so `∫f(xg)dμ=c(g)∫f`. That is the README's convention, with `c=Δ⁻¹` against Williams's `∫f(sr)ds=Δ(r⁻¹)∫f`.
  - `CStarModule.star_inner`, `CStarAlgebra.approximateUnit`, `ContinuousLinearMap.toPointwiseConvergenceCLM`, `CharacterModule.exists_character_apply_ne_zero_of_ne_zero` and `Nat.divModEquiv`.
  - `Measure.ext_of_charFun`, `charFun_gaussianReal`, `Measure.Regular` and `Measure.rnDeriv`.
  - `MeasureTheory.Measure.div_mem_nhds_one_of_haar_pos`, `MeasureTheory.Measure.isMulLeftInvariant_eq_smul_of_regular` and `MonoidHom.isOpenMap_of_sigmaCompact`.
  - `StandardSubspace`, `AnalyticSet` and `WithCStarModule.instCStarModuleComplex`.
- **Tau Ceti.** The modules imported by `Suggested.lean`, plus:
  - `PiTensorProduct.reindexRepresentation`;
  - `TauCeti.CStarAction.multiplier` (`Action/Multiplier.lean` line 45) with `eq_multiplier_of_apply_coe` and `continuous_multiplier_apply_fst`;
  - `CovariantRepresentation.ext_integratedOperator`, `FullCrossedProduct.coefficientMultiplier` and `FullCrossedProduct.groupMultiplier`;
  - `TauCeti.Amenable.of_commGroup` (`GroupTheory/Amenable/Abelian.lean` line 47) and `TauCeti.circleEquivPontryaginDualInt`;
  - `IsKMSState.eq_zero_of_apply_toPreGNS_one_eq_zero`, `perturbationCocycle_add`, `Matrix.IsHermitian.isKMSState_perturbed_iff_eq_gibbsState`, `IsGroundState.of_tendsto_isKMSState`, `CovariantRepresentation.vonNeumannAction`, `gnsCovariantRepresentation` and `QuantumSpin.Interaction.gibbsExtension`;
  - `TauCeti.twistedMonoidAlgebra` and `TauCeti.TwistedMonoidAlgebra.equivOfCoboundary` (`Algebra/MonoidAlgebra/Twisted/Basic.lean` lines 288 and 498).

  The hypothesis of `equivOfCoboundary`, `β g h·c(gh)=α g h·c(g)c(h)`, makes β the coboundary twist of α by c. Its map `k_β→k_α`, `of g↦c g • of g`, is therefore the README's `T_b` direction (row 9).

### Cross-roadmap citations and ownership

**Supplier sections resolved on main (3090489).**

- **CStarAlgebras:** C1.3 (quotients and the correspondence with surjections), C1.4 (quasicentral approximate units), C1.6, C1.7, C2.1–C2.4, §2.6/C2.AnnHull, C5.1, C5.2, C5.4 (which names this roadmap's D1 for `C*(F_∞)`), C6.1, C6.2, C6.5, C7.1, and C8.4 with symbol `S↦z`.
- **HilbertModules:** H1–H3.
- **VonNeumannAlgebras:** V1, V2 and V2.RectangularL2, V4.0.Fields, V4.0.Decomposition, V8, V10.ModularTheory and V10.KMS, and V11.UnitizationCharacters, V11.FourierUniqueness and the inversion/Plancherel/duality target, which uses the positive-character inversion `f(x)=∫f̂(γ)conj(γ(x))dγ`.
- **Other suppliers:**
  - BanachAlgebras A7.CharactersAndUniqueness;
  - SelfAdjointSpectralTheory SA-B14, B44, B50, B59, B67, B79, B85 and A21;
  - LieGroupoidsPoisson §G0.0;
  - AmenableGroups Layers 5 and 7;
  - FreeProbability F3, which records D6 as the owner of `O_n`.

`scratch/citations.md` reports nothing unresolved.

**Ownership against the open pull requests whose checkouts the brief gives.**

- The scalar `C*(L,c)` has one owner, this roadmap. It is cited, not rebuilt, by:
  - HeisenbergImprimitivity (#1149, lines 7, 24, 54, 194);
  - OperatorKTheory (#866, lines 48 and 228);
  - CompactQuantumMetricSpaces (#1155, line 97).
- D8's `U_σ`, `P_s` and `P_a` are the settled H01 item (#1015, #1771).
- The overlap data shows no dropped id and no id defined only by an open revision.

### Adversarial table

Rows 29, 38 and 39 are the sampled targets. Rows 29, 33 and 54 are the targets of the findings. Every headline theorem has a row.

| # | Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|---|
| 1 | `exists_integratedOperator` | ℤ counting; G trivial; non-separable H | `δ_0⊗a+δ_1⊗b↦π(a)+π(b)U`; `f(n)=2^(−|n|)a` has `‖f‖₁=3‖a‖`; trivial G gives `π(f(e))`; on each compact K the orbit `U·ξ` has compact range, so the integrand is strongly measurable on the σ-finite support | holds | none |
| 2 | `exists_covariantRepresentation_integratedFull` | A=0; G trivial, A=ℂ²; L=0 | A=0 forces H=0 and π=0 is nondegenerate there; `(x,y)↦x` is recovered with π=L, U=1; L=0 on H≠0 is excluded by `hL` | holds | none |
| 3 | `fullCrossedProductMap_exact` | G trivial; A=ℂ², I=ℂ⊕0; I=A | `0→I→A→A/I→0`; `C*(G)→C*(G)²→C*(G)`; quotient 0; `hker` forces the star subalgebra I to be `ker q`, an ideal | holds | none |
| 4 | `CentralCocycle` | ℤ/2 with `ω(a,a)=−1`; `M_2` with `diag(1,−1)`; A=0 | at r=s=t=a both sides are −1; the `cocycle` field holds for `diag(1,−1)` but `diag(1,−1)E_12=E_12≠−E_12=E_12diag(1,−1)`, so only `central` fails; on `M(0)=0` all fields hold | holds, discriminating | none |
| 5 | `CentralCovariantPair` | ℤ/2, `ω(a,a)=−1`, A=ℂ, π=id | `U_a=i` gives `U_a²=−1=ω(a,a)U_e`; `U_a=1` violates `projective` | holds | none |
| 6 | `exists_centralIntegratedOperator` and twisted product | ω=1; the row-5 pair | ω=1 reduces to row 1; `T_(δ_a)²=−1=T_(ω(a,a)δ_e)`; in general `T_fT_g=∫π(∫f(r)α_r(g(r⁻¹s))ω(r,r⁻¹s)dr)U_s ds` | holds | none |
| 7 | Twisted star `c(s)ω(s,s⁻¹)*α_s(f(s⁻¹)*)` | adjoint of `T_f` | `U_s*=U_(s⁻¹)π̃(ω(s,s⁻¹))*`, substitute `s↦s⁻¹` (factor c), then use `ω(s,s⁻¹)=α̃_s(ω(s⁻¹,s))` | holds | none |
| 8 | `T_b` direction, lines 1143–1149 | ℤ/3, ω=1, `b(1)=i`, `b(2)=1` | `ω^b(1,2)=i`; `T_b(δ_1)T_b(δ_2)=iδ_0=T_b(iδ_0)`; the reversed map gives `−δ_0` against `δ_0` | holds | none |
| 9 | `ψ_b` direction and `equivOfCoboundary` | same data | `(1,1)(1,2)=(i,0)` in `E_(ω^b)`, image `(i,0)`; reversed: `(−1,0)` against `(1,0)`; Tau Ceti `hc` gives `β=α^c` and `k_β→k_α` | holds | none |
| 10 | Schrödinger phase, lines 1168–1179 | M=ℤ/3, x=(1,ψ) | `Π_x*δ_2=ζδ_0`, `Π_(−x)δ_2=δ_0`; `δ_x*=ζδ_(−x)`, `δ_x*δ_x=ζ·ζ²δ_0=δ_0`; the projective law gives `ψ(m)` | holds | none |
| 11 | `λ^ω` and `V^ω` projective laws | ℤ/2, `ω(a,a)=−1` | `λ^ω_a²=−1`; both laws reduce to the cocycle at `(s,t,t⁻¹s⁻¹x)` | holds | none |
| 12 | `W_bV^(ω^b)_sW_b*=Π̃(b(s))V^ω_s`, scalar case | general b | `b(r)ω^b(s,s⁻¹r)conj b(s⁻¹r)=b(s)ω(s,s⁻¹r)` | holds | none |
| 13 | Trace, gauge and (ℤ/2)² Checks | (ℤ/2)², `(−1)^(ba′)`; ℤ/2 | `u²=v²=1`, `uv=u_(1,1)`, `vu=−u_(1,1)`, `τ=Tr/2`; `(x+α̂_γx)/2=x₀`; `(iu_a)²=1≠−1` | holds | none |
| 14 | `continuous_of_measurable_monoidHom` | Williams D.11; Hamel map | D.11 hypotheses are separable metric groups with G Polish, as in the signature; a ℚ-linear ℝ→ℝ map that is not ℝ-linear is discontinuous, hence not Borel | holds | none |
| 15 | `U(H)_s` metric and `E_ω` | dim H=1; ℤ/2 | metric `2|z−w|Σ2^(−k)|h_k|`; `(1,a)²=(−1,e)`, so order 4; `(i,a)²=(1,e)` | holds | none |
| 16 | Weight projection `p_1` | weight k | `∫z̄z^kdz=δ_(k1)`; the z weight gives `V_sV_t=conj(ω)V_(st)`, so `C*(G,ω⁻¹)` | holds | none |
| 17 | `injective_integratedFull_regular_of_amenable` | ℤ; F₂; `ρ=z⊕0` | `‖λ(f)‖=sup|f̂|`; for F₂, `χ_triv(h)=4` while Kesten gives spectrum of `λ(h)/4` in `[−√3/2,√3/2]⊆[−1,1−ε]`; a degenerate ρ adds a zero summand, same kernel | holds | none |
| 18 | Unitary `L²(G,A)⊗_ρH≅L²(G,H)` | ℤ/2 swap on ℂ², `ξ=δ_a⊗e_1` | `⟨ξ,ξ⟩_A=e_2`, norm² `|η_2|²`; displayed map `η_2e_2`; the alternative `η_1e_1` is not isometric | holds | none |
| 19 | `transitive_commutant_scalar` | ℤ/2 on {p,q}; F=∅; I=∅ | `(f(p)−f(q))T_pq=0` gives T diagonal and U-commutation makes it constant; F=∅ forces |I|≤1; I=∅ gives the zero space | holds | none |
| 20 | Irrational rotation | `n·x=x−nθ`; `x+nθ` | `uvξ(n)=e^(2πi(x−(n−1)θ))ξ(n−1)`, `vuξ(n)=e^(2πi(x−nθ))ξ(n−1)`, so `uv=e^(2πiθ)vu`; the opposite rotation gives `e^(−2πiθ)` | holds | none |
| 21 | `exists_powers_partition` | F={b}, L=2; F=∅, N=2; ℤ at N=3; N≤1 | `w=ab²`, `wbw⁻¹=aba⁻¹`; for f not a power of b, `b^Lfb^(−L)=b^(L+p)gb^(q−L)` stays reduced; `b^jD` have exactly j leading b's; ℤ fails by density (D has density ≥½, three translates); N≤1 is trivial | holds | none |
| 22 | `reducedFreeGroup_isSimpleRing` | singleton basis; full `C*(F₂)`; algebraic ideals | `C(𝕋)` is not simple (excluded by `a≠b`); `u−1∈ker χ_triv`; a dense ideal contains an invertible element (`Units.oneSub`) | holds | none |
| 23 | `reducedFreeGroup_trace_unique` | `τ(λ(g))`; C(𝕋) | `⟨δ_1,λ(g)δ_1⟩=[g=1]`; `hlam` gives `λ(g)δ_k=δ_(gk)`; every point evaluation of C(𝕋) is a trace | holds | none |
| 24 | Powers estimate | de la Harpe line 488; N=1 | `‖(1/N)ΣX′_j‖≤‖X′‖/√N`, giving `2‖x‖/√N`; N=1 gives `2‖x‖`, weaker than trivial, as the Check says | holds | none |
| 25 | BoundedSequenceTranslation | `E_ij`; even p; `M_fU^k` | `E_ijδ_n=[n=j]δ_i`; the opposite shift gives `δ_(2i−j)↦δ_i`; `UpU*=M_(1_odd)=1−p`; `f_k(i)=f(i)` | holds | none |
| 26 | SequenceToeplitz | `e=M_(1_[0,∞))`; ℓ₊ | `eUeδ_n=δ_(n+1)`; `1−SS*` is the projection onto δ_0; `ℓ₊(α_kf)=ℓ₊(f)`; Prim is `{η}∪𝕋` with opens ∅ and `{η}∪O` | holds | none |
| 27 | Convolution direction, lines 773–781 | ℤ/3 shift on ℂ³ | `(f*g)(2)=e_0α_1(e_2)=e_0`; the inverse convention gives `e_0e_1=0`; `π(e_0)U_1π(e_2)U_1=π(e_0)U_2` | holds | none |
| 28 | Gram and induced-form signs, lines 883–893 | `M_2`, `E_11`, `E_12`; `−E_12`, `E_11` | entries `δ_ikδ_jl` give rank one `ww*`; the transposed matrix is the flip, with eigenvalue −1; induced form `0` against `−2` | holds | none |
| 29 | Saddle flow (sampled; R02) | (1,1), (−1,−1), (1,−2); half-axis and origin bases | orbits `{(u,c/u)}` per quadrant; `{x>0,|xy|<ε}` and `{|xy|<ε}` are saturated and open; the branch with r<δ²/2 meets `B_δ(0)` at `(√r,√r)`; same bases as Williams Ex. 3.32 (a)–(c) | holds; locator missing | add locator |
| 30 | `γ_H` modular factor | ax+b with dilations | `⟨f,g⟩*=Δ_H⁻¹γ_H⁻²Δ_G⟨g,f⟩` via s=th, so `γ_H²=Δ_G/Δ_H`; `Δ_H=1`, `Δ_G(a,0)≠1` | holds | none |
| 31 | `exists_fullGroupCStarAlgebra_equiv_zeroAtInfty_dual` | ℤ/2; ℤ; S₃ | `f̂=(f_0+f_1,f_0−f_1)`; `δ_1↦z`; `(f*)^=conj f̂`; `C*(S₃)=ℂ²⊕M_2` is not commutative | holds | none |
| 32 | `exists_fullGroupCStarAlgebra_dual_equiv_zeroAtInfty` | ℤ; ν↦cν | `C*(𝕋)≅c₀(ℤ)` with the unitary at z going to `n↦zⁿ`; with cν, f represents what cf represents with ν | holds | none |
| 33 | ℝ Fourier against Mathlib (R03) | f on ℝ | `𝓕f(w)=∫f(x)e^(−2πiwx)dx=f̂(χ_(−2πw))` (`Real.fourier_eq`); `Real.fourierIntegral` is an unknown constant | holds; name wrong | rename |
| 34 | Dual measure and inversion | order n; ℤ/3, f=δ_1 | `Σ|δ̂_e|²=n` against 1, so the dual is `(1/n)`·counting; `(1/3)Σχ(1−x)=[x=1]`, while `χ(x)` in place of `conj χ(x)` gives `[x=−1]` | holds | none |
| 35 | `lcaWeyl_classification` | ℤ/2; ℤ/3; ℤ; E=0 | `U_aV_χU_a*=diag(−1,1)`; `U_1V_χU_1*=ω⁻¹V_χ` while `V_χU_1V_χ*=ωU_1`; `z^(−s)`; Williams Def. 4.26 `S_γR_s=γ(s)R_sS_γ` gives `conj χ(s)`; E=0 gives ι=∅ | holds | none |
| 36 | Takai sign | ℤ/3 | `ρ_1e_t=e_(t−1)` from `ρ_sξ(r)=ξ(rs)` | holds | none |
| 37 | One-unit groupoid | group G | `Δ^(1/2)`-dictionary: stars `Δ^(−1/2)conj f(s⁻¹)` on both sides; I-norm `max(‖f‖₁,‖Δ⁻¹f‖₁)`; `D=Δ` | holds | none |
| 38 | D5.Fields Checks (sampled) | point; jump at ½; non-measurable S; zero fibres | `1_(x≥½)E_01` maps fibres into fibres; `E_10e_0=e_1∉span e_0`; `1_Se_0` is not measurable; 1 and `E_00` agree on `span e_0`; zero fibres give `L²(S)` | holds | none |
| 39 | `exists_residue_family` (sampled) | n=1, 2; general n; shift | `S_0*b_3=0`, `S_1*b_3=b_1`, `ΣS_jS_j*b_3=b_3`; `S_i*S_jb_k=[(nk+j)%n=i]b_k`; `ΣS_jS_j*b_k=b_(n(k/n)+k%n)`; shift: `S_1*S_0=S_1*≠0` | holds | none |
| 40 | Full-shift topology | n=2 | `shift^(m+1)(0^m10^∞)=0^∞`, so non-units converge to a unit; `shift(0^m10^∞)≠0^∞`, so `Z([0],1,0,X)` is not open in the subspace topology | holds | none |
| 41 | Strong effectiveness Check | ℤ on `ℤ⊔{+∞}` | `(n,+∞)` is a limit of `(n,k)` with k→∞, so it is not interior to the isotropy; exactly three invariant opens | holds | none |
| 42 | KMS sign | K=diag(0,1), `a=E_12`, `b=E_21` | `ω(aτ_(iβ)b)=e^(−β)/(1+e^(−β))=ω(ba)`; opposite sign `e^β/(1+e^(−β))` | holds | none |
| 43 | Araki, finite dimensions | `Q=−βP` | `Ω^Q=e^(−β(K+P)/2)/√Z_K`; `‖Ω^Q‖²=Z_(K+P)/Z_K≤e^(|β|‖P‖)`; `u_t=diag(1,e^(iβt))`; `Ad(u_t)τ_(−βt)=id` | holds | none |
| 44 | Dyson cocycle ODE | inner dynamics | `Γ_s′=Γ_s·iτ_s(P)`; `u_t=Γ_(−βt)` gives `u_t′=u_t·iσ_t(Q)` with `σ_t(Q)=−βτ_(−βt)(P)` | holds | none |
| 45 | CAR √(n+1) and h=ℂ | g⊥f | `‖P_a(f⊗g)‖²=‖f‖²‖g‖²/2`; `bb†g+b†bg=‖f‖²g/2`; `E_12e_1=0`, `ω₀(aa*)=⟨f,g⟩` | holds | none |
| 46 | One-mode Bogoliubov | U=u, V=v·conj | `V*x=vx̄`; relations give `uv=0`, `|u|²+|v|²=1`; `(ca+sa*)²=cs·1` | holds | none |
| 47 | Weyl on `ℓ²(V)` and spectra | f, g, v | `λ(f)λ(g)δ_v=e^(−iσ(f,g)/2)λ(f+g)δ_v`; spectrum 𝕋, so `‖W(f)−z‖=2` | holds | none |
| 48 | Weyl domains and commutator | `D_F`; Schrödinger | `d/dt[φ(f−tg)e^(−itσ(g,f)/2)]=ψ`; `W(sf)W(tg)W(−sf)=e^(−istσ(f,g))W(tg)`, so `[Φ(f),Φ(g)]=iσ(f,g)`; `e^(isx)ψ(x+t)=e^(−ist/2)π(W(se_1+te_2))ψ` | holds | none |
| 49 | Fock Weyl `W_F` | isometry; h=ℂ | the exponents sum to `⟨g,k⟩`; product phase `−iIm⟨f,g⟩/2`; `e^(−i/2)` and `e^(i/2)`; `⟨Ω,W_F(1)Ω⟩=e^(−1/4)`; derivative `i(v+w̄)/√2`; Attal at u=t/√2 gives `(w̄−v)/√2` | holds | none |
| 50 | Moments and `D(A²)` | Gaussian; `c/(1+|λ|⁵)` | Gaussian fourth moment `3σ⁴=3/4`; `c=5sin36°/2π≈0.4677`; second moment `≈0.618`; fourth moment diverges | holds | none |
| 51 | Jordan–Wigner; one-mode KMS | `h=ℂ²`; `h₀=ε` | `E_12σ_3=−E_12`, `σ_3E_12=E_12`; `ω(a*a)=1/(e^(βε)+1)` | holds | none |
| 52 | Ising and on-site D9 Checks | ℤ; on-site h | `M_λ=|h|+2|J|e^λ`, `M_(λ,2)=|h|+8|J|e^λ`, bound at λ=1, d=2 is `(1/2)/(1+8e)=1/(2+16e)`; `s−βe=log 2coshβh=p` | holds | none |
| 53 | `vonNeumannEntropy_strong_subadditivity` | GHZ; `|0⟩⟨0|⊗Φ⁺`; ρ_A in place of ρ_AB | `0+log2≤2log2`; equality `log2=log2`; `log2≤0` is false; the Lean partial traces trace out a then c (`ρ_B`), and c after regrouping by `prodAssoc.symm` (`ρ_AB`) | holds | none |
| 54 | Scaling sentence, line 3805 (R04) | GHZ, c=2 | `S(2σ)=2S(σ)−2Trσ log2`; left side `log2→−2log2`, a change of `−3log2`, not the stated `−4log2`; the repaired wording gives `−2log2` and `0`, as in the Check | sentence wrong | reword |
| 55 | Relative entropy calculus | `ρ_AB=¼·1`, `σ_B=½·1` | `log¼−log½=−log2`, and `−2log2+log2=−log2` | holds | none |
| 56 | `modularCharacter` convention | Mathlib definition | `map(·g)μ=c(g)μ`, so `∫f(xg)dμ=c(g)∫f`; Williams gives `Δ(g⁻¹)`, so `c=Δ⁻¹` | holds | none |
| 57 | `U_σ` left action, line 3380 | h=ℂ³, σ=(1 2), τ=(2 3) | `U_σU_τe_123=e_312=U_(στ)e_123`; `V_(στ)e_123=e_231⊥e_312` | holds | none |

## Not verifiable

These sources are recorded as uncertified (paywalled) in the manifest. They are cited by locator only, and I did not read them:

- Bratteli–Robinson 1 and 2: §§5.2–5.3, Theorems 5.2.8, 5.3.30 and 5.4.4, §6.2;
- Cuntz 1977, §1. The residue family is verified by computation (row 39), not against the text;
- Renault 1980;
- Brown–Ozawa, Proposition 5.1.3;
- Rudin, *Fourier Analysis on Groups*.

## Source issues

- **Misprint** in attal-fock at Definition 8.11, p. 12: the source says the fermionic annihilation operator carries the sign `(−1)^i` on the i-th term; it should be `(−1)^(i+1)`, since n=1 gives `b(u)v=−⟨u,v⟩Ω`, contradicting adjointness and the CAR; affects nothing.
- **Misprint** in attal-fock at Definition 8.12, p. 13: the source says the adjointness relations read `⟨a*(u)f, f⟩=⟨f, a(u)g⟩` (and likewise for b); it should be `⟨a*(u)f, g⟩=⟨f, a(u)g⟩`; affects nothing.
